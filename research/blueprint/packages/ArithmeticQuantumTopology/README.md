# Roadmap: arithmetic quantum topology, Habiro invariants and regulators

This roadmap builds the integral quantum invariants of links and integral homology spheres and
connects the invariants of hyperbolic knots with arithmetic: Bloch groups and regulators,
perturbative series over number fields, state integrals and quantum modular forms. It starts from
framed links and the quantum group of sl₂, constructs Habiro's unified invariant of an integral
homology sphere as an element of the Habiro ring, recovers every Witten–Reshetikhin–Turaev invariant
from it by evaluation, and extends the construction to every simple Lie algebra. On the geometric
side it constructs the extended Bloch class of a cusped hyperbolic 3-manifold and its complex
volume, the formal perturbative series of an ideal triangulation, Faddeev's quantum dilogarithm and
the Andersen–Kashaev state integral, and states the quantum modularity conjectures of Garoufalidis
and Zagier together with the cases that are theorems.

**Summary.** The end theorems are: (1) Habiro's theorem that every integral homology sphere M has a
unified invariant J_M in the Habiro ring ℤ[q]^ = lim ℤ[q]/((q;q)_n) whose value at every root of
unity ζ is the sl₂ Witten–Reshetikhin–Turaev invariant τ_ζ(M), so that these values are algebraic
integers, Galois equivariant and determined by J_M, and whose Taylor series at q = 1 is the Ohtsuki
series; (2) the Habiro–Lê extension of (1) to every simple Lie algebra; (3) Neumann's theorem that a
complete finite-volume hyperbolic 3-manifold has an extended Bloch class whose Rogers regulator is
i(Vol + i CS) modulo π²; (4) the Garoufalidis–Storzer–Wheeler theorem that the formal Neumann–Zagier
state integral at the geometric solution is a topological invariant with coefficients in the trace
field; the root-of-unity construction has proved arithmetic descent and conjectural topological
invariance; (5) the Andersen–Kashaev
convergence and invariance theorem for state integrals and their volume limits for 4₁ and 5₂; and
(6) the Bettin–Drappeau theorem proving quantum modularity for ten hyperbolic knots. The quantum
modularity conjectures, the volume conjecture and their matrix and cocycle refinements are stated
precisely as conjectures and never used as inputs. The figure-eight knot and the knot 5₂ are carried
through every layer as the running examples.

## Scope and ownership

This roadmap owns:

- the refined Kirby calculus for admissible surgery presentations (Layer 0), and the classical
  surgery calculus it rests on, which no upstream roadmap plans: linking numbers and linking
  matrices, the homology of a surgery, Kirby and Fenn–Rourke moves and the theorems of
  Lickorish–Wallace and Kirby;
- topological ribbon Hopf algebras, the h-adic quantum groups U_h(g), their integral forms and
  cores, the Reshetikhin–Turaev functor, universal invariants of bottom tangles and tilting
  semisimplification at roots of unity (Layer 1);
- coloured Jones polynomials, Habiro's cyclotomic colours and the cyclotomic expansion, the unified
  Kashaev invariant and the Kashaev function on the rationals (Layer 2);
- the unified invariant of integral homology spheres (Layer 3) and its root evaluations, Ohtsuki
  series and general Lie type version (Layer 4);
- ideal triangulations of cusped hyperbolic 3-manifolds, their gluing and completeness equations and
  the rigidity theorems they need, flattenings, the extended pre-Bloch and Bloch groups, the
  extended Rogers regulator and the Bloch class of a manifold (Layer 5);
- Neumann–Zagier data, formal and root-refined state integrals, the knot-specific comparisons with
  Habiro modules, Faddeev's quantum dilogarithm, the Schrödinger pair and the distributional inputs
  of the Andersen–Kashaev state integral (Layer 6);
- the knot-specific perturbative families, the quantum modularity conjectures, the denominator and
  matrix cocycles and the proved cases (Layer 7).

It leaves to other roadmaps:

- **Tau Ceti.** Smooth link embeddings (`TauCeti.SmoothLinkEmbedding`), braids and Markov
  equivalence (`TauCeti.MarkovBraid`, `TauCeti.FramedMarkovBraid`, `TauCeti.MarkovEquiv`), based
  oriented Gauss codes and their writhe (`TauCeti.BasedOrientedGaussCode.writhe`), the
  Temperley–Lieb representation of the braid group behind the Jones polynomial
  (`TauCeti.TemperleyLieb.jones`), slopes on a framed boundary torus (`TauCeti.Slope`,
  `TauCeti.FramedBoundaryTorus`). The current Tau Ceti library, newer than the pin, adds the Jimbo
  R-matrix representation of the braid group and its weighted trace (`TauCeti.KnotTheory.jimbo`,
  `TauCeti.KnotTheory.jimboWeightedTrace`); these are the vector-representation shadows of the
  universal invariant of Layer 1 and are cited, not planned again. At current Tau Ceti
  `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`,
  `Geometry/Manifold/Riemannian/Hyperbolic/FiniteVolume.lean` already defines
  `TauCeti.HyperbolicMetric.HasFiniteVolume` and `TauCeti.IsFiniteVolumeHyperbolic` on a complete
  metric; their carriers are consumed unchanged. `Hyperbolic/Mostow.lean` records the closed
  rigidity predicates `TauCeti.IsMostowRigid` and `TauCeti.MostowRigidity`, rather than a proof of
  rigidity. Layer 5 adds the cusped theorem and its orientation qualification.
  `Hyperbolic/UpperHalfSpace.lean` supplies `TauCeti.UpperHalfSpace`, its analytic
  `riemannianMetric` and the transitive similarity action. That module proves neither
  completeness nor curvature −1, and supplies no ideal boundary or geodesic ideal regions.
  `TauCeti.BipartiteRibbonGraph` is an abstract graph with cyclic orders; the embedded ribbons and
  coupons below additionally carry ambient isotopy and module colours.
  `TauCeti.TemperleyLieb.jonesTrace_sigma_pow_three` in `KnotTheory/TemperleyLieb.lean`
  computes the right-handed trefoil's writhe-normalized trace as
  δ(A⁻⁴+A⁻¹²−A⁻¹⁶). Its normalized polynomial is t+t³−t⁴ with t=A⁻⁴; this fixes the
  bracket convention used in the new quantum-trace comparison.
- **TauCetiRoadmap GeometricTopology.** Manifolds, connected sum and orientation reversal (Layer 1),
  framed link presentations, Reidemeister and Markov equivalence and the Jones polynomial from the
  Kauffman bracket (Layer 4), Dehn filling and surgery with lens spaces (Layer 5), complete
  hyperbolic metrics, volume and Mostow rigidity of closed manifolds (Layer 7), triangulations
  (Layer 11). Linking numbers, the homology of surgeries, Kirby calculus and the cusped
  finite-volume theory are not planned there, and are planned here.
- **TauCetiRoadmap AlgebraicTopology.** Singular homology and the Mayer–Vietoris sequence (Stages
  2–3), and integral universal coefficients and Poincaré duality (Stage 6), used for the homology
  of a surgery and its integral homology-sphere criterion.
- **TauCetiRoadmap IntegralLattices.** The classification of indefinite odd unimodular lattices
  (6A), used for the existence of admissible presentations.
- **TauCetiRoadmap RepresentationTheory.** LieHighestWeight (Cartan subalgebras and root
  decomposition, Layer 1; enveloping algebra, PBW, Verma modules and L(λ), Layer 3; Weyl character
  and dimension formulas, Layer 6) and RootSystems (root and weight lattices). Quantum groups are
  not planned there and are planned here.
- **TauCetiRoadmap OperatorTheory/SelfAdjointSpectralTheory.** Closed and self-adjoint unbounded
  operators, resolvents and the spectral measure of an unbounded self-adjoint operator (Parts C–E),
  and bounded Borel calculus of the Cayley transform (Part B).
  The Schrödinger pair and its Schwartz core are not planned there and are planned here.
- **HabiroCyclotomicCompletions.** The cyclotomic completions ℤ[q]^S and the Habiro ring (Layer 1),
  factorial series (Layer 2), root evaluation, the Taylor map and p-adic re-expansion (Layer 3), and
  the rigidity theorems (Layer 4). The formal noncommutative pentagon of the q-exponential is also
  there; the analytic Faddeev pentagon of Layer 6 here is a different statement.
- **HabiroNahmSeries.** Formal Gaussian integration (HB.4), the refined Gaussian collection (HB.8),
  Habiro-module membership for integral Nahm data and its étale, Kummer and gluing inputs (HB.9).
- **HabiroNumberFields.** The Frobenius coefficient rings and the K₃-indexed twisted Habiro modules
  (HB.6, HB.7).
- **K3BlochGroups.** The pre-Bloch and Bloch groups in their several conventions (V.3), Suslin's
  exact sequence (V.4) and the fibre of the integral Suslin comparison (V.6).
- **Polylogarithms.** The classical polylogarithms and their branches, the Bloch–Wigner function and
  its five-term relation (P.1), and the volume of an ideal tetrahedron (P.2).
- **QSeriesPartitionsAndMockModularForms.** q-Pochhammer symbols, Bernoulli and infinite-product
  identities (QM.0), and scalar quantum modular forms and their cocycles (QM.5). The matrix-valued
  cocycle notion is defined here.

Wheeler's two-variable invariant of knots and its comparison with the relative Habiro ring and the
Melvin–Morton–Rozansky expansion [Whe] are outside this roadmap; they would build on Layer 2 and on
HabiroRings Layers 1 and 5. A general theory of resurgence and Borel summation is also outside it.
The construction of the Casson invariant and its comparison with the first Ohtsuki coefficient
are outside the build; the Ohtsuki comparison here is characterized by p-adic WRT evaluations.

## Conventions

- **Quantum parameters.** q = e^h, v = e^(h/2), so q = v². For sl₂, K = e^(hH/2), e = (v − v⁻¹)E and
  F̃^(n) = FⁿKⁿ/[n]_q!. Quantum integers are balanced: [n] = (vⁿ − v⁻ⁿ)/(v − v⁻¹), and {a} = v^a −
  v^(−a), {n}! = {1}⋯{n}, {a}_b = {a}{a−1}⋯{a−b+1}. The q-Pochhammer symbol is (a;q)_n = (1 − a)(1 −
  aq)⋯(1 − aqⁿ⁻¹), and (q;q)_n is the cyclotomic factorial.
- **Colours.** V_n is the (n+1)-dimensional irreducible module of highest weight n; the reduced
  coloured Jones polynomial J^red_(K,N) uses the N-dimensional colour V_(N−1) and is formed by
  dividing by the unknot value [N] before any evaluation at a root of unity.
- **Framing.** A positive framing acts by the inverse ribbon element r⁻¹, with scalar q^(n(n+2)/4)
  on V_n. Surgery of sign ε along an unknot inserts the twist element ω^(−ε).
- **The Habiro ring** is ℤ[q]^ = lim ℤ[q]/((q;q)_n), from HabiroCyclotomicCompletions Layer 1. The
  image completions of quantum groups in Layer 1 here are images of inverse limits inside an h-adic
  algebra; they are never identified with the scalar Habiro ring, and inverse-limit maps are not
  asserted to be injective.
- **Signs of complex volume.** Neumann's regulator is R = i(Vol + i CS) = i Vol − CS in ℂ/π²ℤ;
  Garoufalidis–Zagier use V = i Vol + CS, so V = −conj(R) modulo the corresponding period.
- **Root-of-unity conventions.** The Kashaev invariant is ⟨K⟩_N = J^red_(K,N)(e^(2πi/N)).
  Garoufalidis–Zagier use the negative q-convention, the Kashaev function being 𝒥_K(α) =
  J^red_(K,c)(e^(−2πiα)) for α = a/c, while Bettin–Drappeau use the positive one; every comparison
  between them makes the conjugation explicit.
- **Status of statements.** Every statement is a theorem with a source, a computation, or a
  conjecture, and is labelled as such. A conjecture is never a hypothesis of a theorem here, and a
  formal power series is never confused with an analytic asymptotic expansion: the latter needs a
  limit domain, a branch and an error bound for every truncation.
- **Sources.** Bracketed abbreviations refer to the References. Locators give the theorem, section
  and page of the arXiv version listed there. Where a source contains a misprint or error, the
  correction used here is listed under Corrections to the sources.

## Exact supplier contracts

### From Mathlib

At Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`:

- `Matrix`, `Matrix.det`, `Matrix.det_transvection_of_ne` (determinant one of an elementary
  transvection): linking matrices and handle slides.
- `Polynomial.Chebyshev.S` (indexed by ℤ, with `S_zero`, `S_one`, `S_two`, `S_add_two`): the colours
  V_n = S_n(V₁) of the representation ring.
- `Polynomial.cyclotomic`, `IsPrimitiveRoot`, `LaurentPolynomial`, `RatFunc`, `PowerSeries`: the
  coefficient rings and roots of unity.
- `HopfAlgebra`, `CategoryTheory.MonoidalCategory`, `CategoryTheory.BraidedCategory`,
  `CategoryTheory.RigidCategory`, `CategoryTheory.ExactPairing`: the algebraic shadows of the ribbon
  structures. Mathlib has no ribbon category, no completed tensor product of topological modules
  over ℂ[[h]] and no quantum group; these are planned here.
- `AdicCompletion`, `UniformSpace.Completion`: h-adic completions of modules.
- `Complex.log`, `Complex.exp`, `MeasureTheory.integral` (a total integral, so every contour
  integral here is accompanied by an integrability theorem),
  `Complex.integral_boundary_rect_eq_zero_of_differentiableOn` (rectangular Cauchy–Goursat, used for
  finite contour shifts; unbounded tails need separate estimates).
- `SchwartzMap`, `SchwartzMap.fourierTransformCLM`, `TemperedDistribution`,
  `TemperedDistribution.delta`, `MeasureTheory.Lp`: the analytic setting of Layer 6.
- `Function.HasTemperateGrowth` (`Analysis/Distribution/TemperateGrowth.lean`): smoothness and a
  polynomial bound on each iterated derivative, with a separate degree for each derivative.
  `SchwartzMap.smulLeftCLM` and `SchwartzMap.smulLeftCLM_apply` in
  `Analysis/Distribution/SchwartzSpace/Basic.lean`, and `TemperedDistribution.smulLeftCLM` in
  `Analysis/Distribution/TemperedDistribution.lean`, supply smooth multiplication under that
  hypothesis. The total operator outside that hypothesis is zero and does not represent a product.
- `Matrix.SpecialLinearGroup`: SL₂(ℤ) acting on the rationals in Layer 7.

Mathlib has no dilogarithm; it is imported from Polylogarithms P.1.

### From Tau Ceti

At Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`: `TauCeti.SmoothLinkEmbedding`,
`TauCeti.MarkovBraid`, `TauCeti.FramedMarkovBraid`, `TauCeti.MarkovEquiv`,
`TauCeti.BasedOrientedGaussCode.writhe`, `TauCeti.TemperleyLieb`, `TauCeti.TemperleyLieb.jones`,
`TauCeti.Slope`, `TauCeti.FramedBoundaryTorus`. These are used only as stated in Scope and
ownership: a Gauss code describes one knot, and `MarkovEquiv` forgets framings, so neither is a
framed link type.

### From TauCetiRoadmap

- **GeometricTopology.** Layer 1: oriented manifolds, connected sum, orientation reversal. Layer 4:
  framed oriented link presentations with the Seifert framing as canonical longitude, framed
  Reidemeister and Markov equivalence, the Jones polynomial from the Kauffman bracket. Layer 5:
  slopes, Dehn filling, surgery on framed links, lens spaces. Layer 7: `HyperbolicMetric`, volume,
  Mostow rigidity for closed manifolds. Layer 11: triangulations.
- **AlgebraicTopology.** Stage 2: singular homology; Stage 3: excision and Mayer–Vietoris, including
  the sphere computations. Stage 6: integral universal coefficients and Poincaré duality for a
  compact connected oriented boundaryless 3-manifold of finite CW type.
- **IntegralLattices.** 6A: an indefinite odd unimodular lattice of signature (t₊, t₋) is isometric
  to ⟨1⟩^(t₊) ⊕ ⟨−1⟩^(t₋).
- **RepresentationTheory/LieHighestWeight.** Layer 1 (simple roots, root-space decomposition,
  `Base.cartanMatrix`), Layer 3 (PBW basis, Verma modules, L(λ)), Layer 6 (Weyl character and
  dimension formulas); RootSystems for root and weight lattices.
- **OperatorTheory/SelfAdjointSpectralTheory.** Part C (closed operators on `LinearPMap`, graph
  cores), Part D (resolvents, Cayley transform), Part E (the spectral measure of an unbounded
  self-adjoint operator, SA-E01–SA-E03), with the bounded Borel star-homomorphism of Part B,
  SA-B04–SA-B09, applied to its Cayley transform. Real spectral symbols are transported through
  the coordinate κ of SA-E01; SA-E02 removes the Cayley singular point. No new general Borel
  calculus is constructed here.

### From the atlas roadmaps

- **HabiroCyclotomicCompletions.** Layer 1: the completions R[q]^S and the Habiro ring
  `HabiroRing R` with its projections to ℤ[q]/((q;q)_n). Layer 2: convergence and uniqueness of
  factorial series Σ a_n (q;q)_n. Layer 3: evaluation ev_ζ at a root of unity, the Taylor map σ_ζ at
  ζ, and p-adic re-expansion between close roots. Layer 4: injectivity of evaluation on a set of
  roots with a limit point in the Habiro topology, and rigidity of a single rootwise Taylor map over
  ℤ.
- **HabiroNahmSeries.** HB.4: the formal Gaussian bracket ⟨f⟩_Λ for a symmetric invertible Λ, with
  its valuation hypotheses. HB.8: the refined Gaussian collection at roots of unity, with its
  normalisation, classical exponential and phase. HB.9: membership of the Gaussian series of a
  nondegenerate integral Nahm solution in the Habiro module of its number field, with the quadratic
  étale coefficients and Kummer descent, the integral product gluing and Frobenius transport, and
  the finite-Chern orientation of the Gaussian constants.
- **HabiroNumberFields.** HB.6: the Frobenius coefficient ring of a number field with its bad
  primes; HB.7: the K₃-indexed twisted Habiro module on a finite étale algebra and its descent.
- **K3BlochGroups.** V.3: the pre-Bloch group P(F), the Bloch group with exterior-square target,
  Suslin's convention and the published modified Calegari–Garoufalidis–Zagier convention, with the
  comparison maps between them. V.4: Suslin's exact sequence relating the Bloch group and K₃^ind.
  V.6: the fibre of the integral Suslin comparison.
- **Polylogarithms.** P.1: Li_n with its principal branch, the Bloch–Wigner function D and its
  five-term relation, the cross-ratio identity. P.2: the volume of an ideal tetrahedron as D of its
  shape (Milnor's formula), in the cross-ratio convention of §5.1.
  This comparison additionally requires a geometric realization of the ideal boundary as
  ℂ ∪ {∞}, geodesic ideal regions with finite Riemannian volume, the orientation-preserving
  PSL₂(ℂ) action and volume additivity under subdivision. These are missing geometric
  supplier contracts: GeometricTopology Layers 7–8 specify metrics and homogeneous models,
  but do not specify these ideal-boundary constructions. They must precede P.2; using the
  P.2 volume theorem to construct its own geometric domain would be circular.
- **QSeriesPartitionsAndMockModularForms.** QM.0: q-Pochhammer symbols, Bernoulli numbers and
  infinite products with their convergence domains. QM.5: radial limits and expansions, scalar
  quantum modular forms and the scalar cocycle relation.

## How to read the build

Layers 0–4 are the integral theory of quantum invariants: Layer 0 is the topology of surgery
presentations, Layer 1 the quantum groups and universal invariants, Layer 2 the coloured Jones
polynomials and their cyclotomic expansion, Layer 3 the unified invariant and Layer 4 its
evaluations and its general Lie type version. Layers 5–7 are the hyperbolic and arithmetic theory of
knots: Layer 5 the Bloch class and complex volume of a cusped hyperbolic manifold, Layer 6 the
formal and analytic state integrals, and Layer 7 the conjectures of quantum modularity, the proved
cases and the worked examples. Layer 5 does not depend on Layers 0–4. The two halves meet in the
Kashaev invariant (Layer 2), which is both an evaluation of the unified knot invariant and the
object whose asymptotics Layers 6 and 7 describe.

`Suggested.lean` states what can be typed at the pinned Mathlib and Tau Ceti: linking matrices,
admissibility and handle slides (Layer 0), ribbon categories (Layer 1), the representation ring of
sl₂ with its colours, cyclotomic colours, quantum dimension and colour truncations, and the
figure-eight Kashaev sums (Layer 2), the first divisor of J_M − 1 (Layer 3), the sl₂ Kirby colour
(Layer 4), shapes, flattenings and the logarithmic wedge on the free abelian group of the cover
(Layer 5), linear Neumann–Zagier data, the finite cyclic product, Faddeev's integral on the strip,
positive charges and the level phase (Layer 6), and the denominator cocycle, the matrix cocycle and
the truncated figure-eight descendants (Layer 7). The subsections below name these declarations in a
*Lean:* line; everything else is a target of this README whose carriers are not at the pins.

## Layer 0: framed links, surgery and the refined Kirby calculus

Surgery on framed links presents every closed oriented 3-manifold, and Kirby's theorem says when two
presentations give the same manifold. An integral invariant needs more: the surgery formula of Layer
3 is defined only on *admissible* links, algebraically split and (±1)-framed, and it must be shown
to be unchanged by a calculus whose intermediate links stay admissible. This layer plans the
classical calculus that no upstream roadmap provides (linking numbers, the homology of a surgery,
Kirby and Fenn–Rourke moves) and then Habiro's refined calculus: band slides, Hoste moves, the
theorem that Hoste moves and isotopy relate any two admissible presentations of the same manifold,
and the existence of an admissible presentation for every integral homology sphere.

### 0.1 Framed oriented links, linking numbers and the linking matrix

GeometricTopology Layer 4 supplies framed oriented link presentations in S³ (diagrams and braid
closures carrying orientations and integer framings, with the Seifert, 0-, framing as the canonical
longitude) and their equivalence by framed Reidemeister and Markov moves. It plans no linking
number, so this roadmap defines it. For distinct components L_i, L_j of an oriented link,
`linkingNumber L i j` is half the sum of the signs of the crossings between L_i and L_j in any
diagram; equivalently it is the intersection number of L_j with a Seifert surface of L_i. The
linking matrix A = `linkingMatrix L` is the symmetric integer matrix with A_ii = f_i, the framing of
L_i relative to its Seifert longitude, and A_ij = lk(L_i, L_j) for i ≠ j. After the components are
enumerated it is a `Matrix (Fin m) (Fin m) ℤ`; a change of enumeration acts by permutation
congruence. In a diagram with blackboard framing the framing of L_i is its writhe, the sum of the
signs of its self-crossings. Tau Ceti's `FramedOrientedGaussCode` describes one knot, and its
`FramedMarkovBraid` carries component framings while `MarkovEquiv` forgets them, so neither is a
framed link type.

*Construction.* Define lk from the crossing signs of a diagram and prove that it is an integer and
is invariant under the framed Reidemeister moves; compare with the Seifert-surface intersection
number. Transport to integer matrices after enumerating components. Prove the blackboard comparison
from the definition of the writhe. ([HabK] §2.3, pp. 1290–1291 (PDF pp. 6–7), linking matrices.)

*Needs:* GeometricTopology Layer 4, Tau Ceti `TauCeti.BasedOrientedGaussCode.writhe`, Tau Ceti
`TauCeti.FramedMarkovBraid`, Tau Ceti `TauCeti.MarkovEquiv`, Mathlib `Matrix`.

*Lean:* `IsAlgebraicallySplit` on integer matrices, and the framing negative control
`FramingCheck.oneStrand`, `FramingCheck.admissibility_not_descends`.

The API:

- `linkingNumber`: the pairwise linking number of two distinct components, an integer.
- `linkingNumber_symm`: lk(L_i, L_j) = lk(L_j, L_i).
- `linkingMatrix`: the symmetric integer matrix indexed by the components of L.
- `linkingMatrix_symm`: its (i,j) and (j,i) entries agree.
- `linkingMatrix_diag`: the (i,i) entry is the framing of the i-th component.
- `IsAlgebraicallySplit`: every off-diagonal entry of `linkingMatrix L` vanishes.
- `linkingMatrix_of_move`: the matrix is unchanged by framed Reidemeister and Markov moves, so it is
  an invariant of the framed link type.

**Checks.**

- `linkingMatrix_unknot`: the 0-framed unknot has the 1-by-1 zero matrix; the (+1)-framed unknot has
  the matrix (1).
- `linkingMatrix_hopf`: the 0-framed Hopf link has matrix [[0,1],[1,0]] and determinant −1; it is
  not algebraically split.
- `linkingMatrix_blackboard`: with blackboard framing the diagonal entry is the writhe of that
  component, which distinguishes the Seifert normalisation from the blackboard one.
- `not_algebraicallySplit_of_det_ne`: a nonzero off-diagonal entry rules out algebraic splitting;
  determinant −1 alone does not decide it.
- The Borromean rings with all framings 0 are algebraically split, since every pairwise linking
  number is 0, while the link is not trivial.
- The one-strand braid with framing 0 and with framing 1 have the same image under the map that
  forgets framings, but coefficient matrices (0) and (1); no predicate on the unframed braid
  recovers admissibility.

### 0.2 Surgery on a framed link and the homology of the result

GeometricTopology Layer 5 supplies Dehn filling along slopes and integral surgery on a framed link L
in oriented S³: the meridian of the i-th attached solid torus is glued to f_i μ_i + λ_i, with λ_i
the Seifert longitude. It does not compute the homology of the result, so this roadmap proves: the
first homology of `surgery L` is the cokernel of A = `linkingMatrix L` acting on ℤ^m, and
`surgery L` is an integral homology sphere if and only if det A = ±1. Empty surgery is S³, surgery
on a split union is the connected sum of the surgeries (GeometricTopology Layer 1's connected sum),
and surgery on the (±1)-framed unknot is S³.

First prove `linkExterior_H1_meridians`: the integral first homology of the compact exterior is
free on μ₁,…,μ_m. Prove `seifertLongitude_H1`: the preferred longitude λ_i represents
Σ_(j≠i)lk(L_i,L_j)μ_j. These are link-specific targets, rather than an unstated import of general
Alexander duality.

*Proof sketch.* Apply Mayer–Vietoris to S³ as exterior and tubular neighbourhoods, using collars
for the open-cover formulation. Since H₂(S³)=H₁(S³)=0, the map from H₁ of the boundary tori to
H₁(exterior)⊕H₁(tubular neighbourhoods) is an isomorphism. The meridians span its kernel after
projection to the solid-torus factors and therefore form the required exterior basis. The
Seifert-surface intersection comparison in §0.1 computes the longitude coordinates. The surgery
Mayer–Vietoris sequence then imposes the columns of A. The determinant criterion gives H₁=0
exactly for a unimodular A; Stage 6's integral universal coefficients and Poincaré duality then
give H₂=0 for this closed connected oriented 3-manifold. ([Hab08] §10.1, pp. 34–35, surgery
presentation recalled before Theorem 10.2; the link-homology argument uses the supplier contracts
above.)

*Needs:* GeometricTopology Layer 5, GeometricTopology Layer 1, AlgebraicTopology Stage 3
(Mayer–Vietoris), AlgebraicTopology Stage 6, §0.1, Mathlib `Matrix.det`.

*Lean:* `LinkingCokernel`.

The API:

- `surgery`: the closed oriented 3-manifold obtained by surgery on the framed link L.
- `surgery_empty`: surgery on the empty framed link is the 3-sphere.
- `homology_surgery`: the first homology of `surgery L` is the cokernel of `linkingMatrix L`.
- `linkExterior_H1_meridians`, `seifertLongitude_H1`: the meridian basis and the longitude formula
  before imposing the filling relations.
- `isIntegralHomologySphere_iff`: `surgery L` is an integral homology sphere if and only if the
  determinant of `linkingMatrix L` is a unit.
- `surgery_disjoint_union`: surgery on a split union is the connected sum of the surgeries.

**Checks.**

- `surgery_empty_eq_sphere`: surgery on the empty link is the 3-sphere, so the invariant of the
  empty presentation is the invariant of the 3-sphere.
- `surgery_unknot_pm_one`: surgery on the (±1)-framed unknot is again the 3-sphere (blow-up and
  blow-down).
- `homology_surgery_unknot_p`: for p ≠ 0 surgery on the p-framed unknot has H₁ = ℤ/|p|, the cokernel
  of (p), and is the lens space L(p,1) in the convention of GeometricTopology Layer 5; for p = 0 it
  is S¹×S² with H₁ = ℤ, not an integral homology sphere.

### 0.3 Admissible framed links

A framed link L is *admissible* if its linking matrix is diagonal with diagonal entries ±1, that is,
if it is algebraically split and every component has framing ±1. Admissibility is a predicate on
framed links (through their linking matrices); that every integral homology sphere has an admissible
presentation is the separate theorem §0.8. Surgery on an admissible link is an integral homology
sphere, since its linking matrix has determinant ±1.

*Construction.* Define the predicate on the linking matrix. The determinant of a diagonal matrix
with entries ±1 is ±1, so §0.2 applies. ([HabK] §1, p. 1286 (PDF p. 2), admissible links.)

*Needs:* §0.1, §0.2.

*Lean:* `IsAdmissible`, `isUnit_det_of_isAdmissible`.

The API:

- `IsAdmissible`: L is algebraically split and every framing is ±1.
- `isAdmissible_iff`: `IsAdmissible L` if and only if `linkingMatrix L` is diagonal with entries of
  absolute value one.
- `isIntegralHomologySphere_of_isAdmissible`: surgery on an admissible link is an integral homology
  sphere.
- `isAdmissible_empty`: the empty framed link is admissible.

**Checks.**

- `isAdmissible_unknot_one`: the (+1)-framed unknot is admissible, and presents S³.
- `not_isAdmissible_unknot_zero`: the 0-framed unknot is not admissible although it is algebraically
  split; this separates admissibility from algebraic splitting.
- `not_isAdmissible_hopf`: the (±1)-framed Hopf link is not admissible, since its off-diagonal
  linking number is 1.
- The empty link is admissible and presents S³.

### 0.4 Kirby moves, the Fenn–Rourke move, and the theorems of Lickorish–Wallace and Kirby

No upstream roadmap plans Kirby calculus, so this roadmap states the moves and the two classical
theorems it needs. On framed links in S³ (GeometricTopology Layer 4) a *blow-up* adds a split
(±1)-framed unknot and a *blow-down* removes one; a *handle slide* of L_i over L_j (i ≠ j) replaces
L_i by a band sum with a parallel push-off of L_j taken with its framing. A *Fenn–Rourke move*
removes an unknotted (±1)-framed component K and gives the strands passing through its spanning disc
a ∓1 full twist, changing framings and linking numbers accordingly. Kirby equivalence is the
equivalence relation generated by isotopy, blow-ups and handle slides.

- *Lickorish–Wallace theorem.* Every closed connected oriented 3-manifold is orientation-preserving
  homeomorphic to integral surgery on a framed link in S³.
- *Kirby's theorem.* Two framed links have orientation-preserving homeomorphic surgeries if and only
  if they are Kirby equivalent.
- *Fenn–Rourke.* Kirby equivalence coincides with the equivalence relation generated by isotopy and
  Fenn–Rourke moves.

At the level of linking matrices, the handle slide of L_i over L_j with the band orientation that
adds the push-off replaces A by PᵀAP with P = I + E_ji; for symmetric A the new (i,i) entry is A_ii +
A_jj + 2A_ij. Since det P = 1 (Mathlib `Matrix.det_transvection_of_ne`), the induced map coker A →
coker(PᵀAP), [x] ↦ [Pᵀx], is an isomorphism for every square A, singular or not: surjectivity of P
gives im(AP) = im A. Symmetry is needed only for the diagonal formula. Habiro writes the slide as
φAφᵀ, so P = φᵀ. Different bands can give the same matrix, so the band is part of the move and not
of its matrix.

*Proof sketch.* Lickorish–Wallace: write the gluing map of a Heegaard splitting as a product of Dehn
twists and realise each twist by a (±1)-surgery. Kirby: relate two surgery presentations by a
4-dimensional cobordism and Cerf theory; this is the deep input, with its original proofs in the
references (Kirby 1978; Fenn–Rourke 1979). The matrix statements are direct computations. ([HabK]
§5, p. 1309 (PDF p. 25), where the Kirby and Fenn–Rourke calculi are recalled; [Hab08] §10.1, pp.
34–35, for Lickorish–Wallace; [Kir78]; [FR79].)

*Needs:* GeometricTopology Layer 4, GeometricTopology Layer 5, §0.1, §0.2, Mathlib
`Matrix.det_transvection_of_ne`.

*Lean:* `handleSlide`, `handleSlide_apply_self`, `linkingCokernel_handleSlide`.

The API:

- `IsKirbyMove`: L' is obtained from L by one blow-up, blow-down or handle slide.
- `IsFennRourkeMove`: L' is obtained from L by one Fenn–Rourke twist or its inverse.
- `kirbyEquiv`: the equivalence relation generated by isotopy and Kirby moves.
- `surgery_eq_of_isKirbyMove`: a Kirby move does not change the surgered manifold up to
  orientation-preserving homeomorphism.
- `exists_surgery_presentation`: the Lickorish–Wallace theorem.
- `kirby_theorem`: homeomorphic surgeries if and only if `kirbyEquiv`.
- `kirbyEquiv_iff_fennRourke`: the Fenn–Rourke characterisation.
- `linkingMatrix_congr_of_handleSlide`: a handle slide changes the linking matrix by a unimodular
  congruence.

**Checks.**

- `kirbyEquiv_empty_unknot_one`: the empty link and the (+1)-framed unknot are Kirby equivalent, by
  one blow-down.
- `framing_of_handleSlide`: sliding L_1 over L_2 in the 0-framed Hopf link with the adding band
  gives new framing 0 + 0 + 2·1 = 2, which pins the sign convention; the subtracting band gives −2.
- `not_kirbyEquiv_of_ne_homology`: the 0-framed and 3-framed unknots are not Kirby equivalent, since
  their cokernels ℤ and ℤ/3 differ.
- A blow-up changes the linking matrix by a direct summand (±1) and does not change the surgered
  manifold.
- The Fenn–Rourke move on an unknotted (+1)-framed component K of a two-component link K ∪ L₁ with
  lk(K, L₁) = ℓ changes the framing of L₁ by −ℓ².

### 0.5 Hoste moves between admissible links

A *Hoste move* is a Fenn–Rourke move (§0.4) between two admissible framed links, or its inverse. The
component L_i that is removed is an unknot of framing ±1, and every other component links it
algebraically zero times, so the strands passing through its spanning disc pair up with opposite
orientations; the move discards L_i and gives that bunch of strands a ∓1 full twist. Hoste
equivalence is the equivalence relation on admissible framed links generated by isotopy and Hoste
moves. Both endpoints are required to be admissible; nothing is claimed about whether a Fenn–Rourke
move starting from an admissible link stays admissible in general.

*Construction.* Restrict the Fenn–Rourke relation to pairs of admissible links; the description by
the spanning disc fixes the sign of the twist opposite to the framing of L_i. Take the equivalence
closure together with isotopy. ([HabK] §5, p. 1309 (PDF p. 25), Figure 9 and the definition of Hoste
moves.)

*Needs:* §0.3, §0.4.

The API:

- `IsHosteMove`: L and L′ are admissible and related by one Fenn–Rourke move.
- `hosteEquiv`: the equivalence relation on admissible links generated by isotopy and Hoste moves.
- `isFennRourkeMove_of_isHosteMove`: every Hoste move is a Fenn–Rourke move.
- `hosteEquiv_refl`: `hosteEquiv` is reflexive on admissible links.

**Checks.**

- `isHosteMove_blowdown_unknot`: deleting a split (+1)-framed unknot from an admissible link is a
  Hoste move.
- `not_isHosteMove_of_framing_two`: removing a 2-framed unknot is not a Hoste move, since that
  component is not unit-framed.
- `hosteEquiv_of_isotopy`: isotopic admissible links are Hoste equivalent.
- A Fenn–Rourke move whose result has a component of framing other than ±1 is a Fenn–Rourke move but
  not a Hoste move: for example, blowing down a (+1)-framed unknot that links a 0-framed component
  L₁ twice algebraically changes the framing of L₁ to −4.

### 0.6 Admissible band-slide theorem

A *band slide* is an algebraically cancelling pair of handle slides: L_i is slid over L_j along a
band that runs parallel to L_j once in each direction, so the linking matrix does not change.
*Stabilisation* adds or removes a split (±1)-framed unknot. Habiro's theorem: two admissible framed
links in S³ have orientation-preserving homeomorphic surgeries if and only if they are related by a
sequence of stabilisations, band slides and isotopies. All the intermediate links are admissible.
The proof rests on the Main Lemma: a sequence of oriented, ordered Kirby moves whose induced matrix
is the identity can be replaced by a sequence of band slides.

*Proof sketch.* Assign to each elementary move (handle slide, orientation reversal, reordering) its
integral matrix, functorially in sequences of moves. Given two admissible presentations of the same
manifold, Kirby's theorem gives a sequence of moves; after stabilisation its matrix lies in the
integral orthogonal group O(p, q; ℤ) of the diagonal form, whose generators are realised by moves on
stabilised unlinks. The remaining sequence has identity matrix, and the Main Lemma replaces it by
band slides. Finally forget orders and orientations. ([HabK] Theorem 1.1, §1, p. 1287 (PDF p. 3);
Main Lemma, Theorem 2.1, §2.2, p. 1290 (PDF p. 6); proof in §4, pp. 1300–1309 (PDF pp. 16–25).)

*Needs:* §0.4, §0.3, IntegralLattices 6A.

**Checks.**

- A band slide applied to an admissible link gives an admissible link with the same linking matrix.
- A single handle slide of the (+1)-framed unknot over another (+1)-framed split unknot changes the
  linking matrix from I₂ to [[2,1],[1,1]], which is not admissible; band slides avoid this.
- Two slides in the same algebraic direction instead give P=I+2E₂₁ and
  PᵀI₂P=[[5,2],[2,1]]; they are not a cancelling band slide.

### 0.7 Refined Kirby calculus for admissible links (Hoste's conjecture)

Two admissible framed links in S³ have orientation-preserving homeomorphic surgeries if and only if
they are related by a sequence of isotopies and Hoste moves. The theorem is about unoriented,
unordered links; orientations and orders are used only inside the proof. It does not replace Kirby's
theorem: ordinary Kirby equivalence also relates two admissible presentations of the same manifold,
but its intermediate links need not be admissible, and the point of this theorem is that they can be
kept admissible.

*Proof sketch.* By §0.6 the two links are related by stabilisations, band slides and isotopies. A
stabilisation is a Hoste move. For a band slide of L_i over L_j, first unknot the sliding component
by Hoste moves, then realise the band slide by two local twists, that is, two Hoste moves along a
small auxiliary unknot, and remove the auxiliary components. ([HabK] Corollary 5.1, §5, pp.
1309–1310 (PDF pp. 25–26).)

*Needs:* §0.5, §0.6.

**Checks.**

- For the empty link and the (+1)-framed unknot, which both present S³, the theorem gives one Hoste
  move.
- Any invariant of admissible links that is unchanged by a single Hoste move and by isotopy descends
  to an invariant of integral homology spheres; this is how §3.4 uses it.
- The 0-framed and the (+1)-framed unknot are not related by Hoste moves, since the first is not
  admissible; neither are two admissible presentations of different manifolds, such as the empty
  link (S³) and the (+1)-framed right-handed trefoil, whose surgery is the Poincaré homology sphere,
  with finite nontrivial fundamental group.

### 0.8 Every integral homology sphere has an admissible surgery presentation

Every closed connected oriented integral homology 3-sphere is surgery on an algebraically split
(±1)-framed link in S³.

*Proof sketch.* By the Lickorish–Wallace theorem (§0.4) M is surgery on some framed link L, and det
A = ±1 by §0.2, so A is a unimodular symmetric integer matrix. Add split (±1)-framed unknots until
the form is odd and indefinite; this does not change M. By the classification of indefinite odd
unimodular lattices (IntegralLattices 6A) the stabilised form is congruent over ℤ to a diagonal form
with entries ±1. Write the congruence as a product of elementary congruences and realise each by a
handle slide, which changes A by the corresponding congruence (§0.4). The resulting link has
diagonal ±1 linking matrix. ([HabK] §1, p. 1286 (PDF p. 2), where the existence result is recalled;
the algebraic step is the lattice classification above.)

*Needs:* §0.3, §0.4, IntegralLattices 6A.

**Checks.**

- The 3-sphere has the empty admissible presentation.
- Every one-component integer (±1)-surgery presentation is admissible and gives an integral homology
  sphere. This does not identify the two surgery signs on a fixed handed trefoil with the same
  manifold.
- A manifold with nontrivial first homology has no admissible presentation, since the linking matrix
  of an admissible link is unimodular.
- The stabilisation is needed: the form (1) ⊕ (1) ⊕ … is already diagonal, but an even form such as
  the E₈ form is not congruent to a diagonal ±1 form without adding a ±1 summand.
- For positive E₈, adjoining (−1) makes an odd indefinite form of signature (8,1), to which
  IntegralLattices 6A applies. Adjoining (+1) leaves a positive definite form with only two
  norm-one vectors, whereas I₉ has eighteen; an arbitrary stabilisation sign is insufficient.

### Examples

For the 0-framed Hopf link A = [[0,1],[1,0]], det A = −1: its surgery is S³, but the link is not
algebraically split, hence not admissible. Sliding one component over the other with the adding band
gives [[2,1],[1,0]], and the cokernel stays trivial. The (+1)-framed unknot and the empty link are
both admissible presentations of S³ and are related by one Hoste move. The p-framed unknot with |p|
≥ 2 presents the lens space L(p,1), with H₁ = ℤ/|p|, and has no admissible presentation.

### Dependencies

GeometricTopology Layers 1, 4 and 5; AlgebraicTopology Stages 3 and 6; IntegralLattices 6A; Mathlib
`Matrix`; Tau Ceti `FramedMarkovBraid`, `MarkovEquiv` and `BasedOrientedGaussCode.writhe`.

## Layer 1: ribbon Hopf algebras, quantum groups and universal invariants

The quantum group U_h(g) is a topological ribbon Hopf algebra over ℂ[[h]]; its universal R-matrix
and ribbon element produce, by reading beads along a bottom tangle, a universal invariant in a
completed tensor power, from which every coloured Reshetikhin–Turaev invariant is a trace. The
integral theory needs integral forms and their completions: Habiro's even form U_q^ev of U_h(sl₂),
in which the universal invariant of an algebraically split 0-framed bottom tangle lies, and the
Habiro–Lê integral cores for general g. This layer constructs these objects, with ribbon categories
and the Reshetikhin–Turaev functor, and the semisimplification of tilting modules at a root of unity
that defines the conventional invariants.

### 1.1 Ribbon category

A ribbon category is a braided rigid monoidal category with a natural automorphism θ of the identity
satisfying θ₁=id, θ_(X⊗Y)=(θ_X⊗θ_Y) followed by the double braiding, and θ_(X∗)=(θ_X)∗ for the
chosen rigid duality. All associators/unitors and the dual comparison are retained; no
symmetric-braiding axiom is imposed. Its pivotal trace is the ribbon graphical closure of an
endomorphism.

*Construction.* Extend the existing braided and rigid structures by the balanced natural twist. Use
the compatibility with duals to make the left and right graphical traces agree. Compare the module
instance with κ=K⁻¹ and θ=r⁻¹. ([Hab08] §3.1, pp. 11–12; §5.2, pp. 19–20; [RT] §§2.1–2.2, pp. 2–4;
§§3.1–3.3, pp. 4–7; Theorem 5.1, pp. 12–13.)

*Needs:* Mathlib `CategoryTheory.MonoidalCategory`, Mathlib `CategoryTheory.BraidedCategory`,
Mathlib `CategoryTheory.RigidCategory`, Mathlib `CategoryTheory.ExactPairing`.

*Lean:* `RibbonCategory`, `ribbonTrace`, `ribbonTrace_tensor`.

The API:

- `RibbonCategory`: a braided rigid monoidal category (Mathlib) together with the natural twist and
  the three equations above.
- `ribbonTwist_tensor`: The twist of a tensor product is the double braiding composed with the
  tensor of twists.
- `ribbonTwist_dual`: Dualizing θ_X gives θ_(X∗).
- `ribbonTrace`: Graphical closure gives an endomorphism of the tensor unit; compare with the
  pivotal quantum trace.

**Checks.**

- `ribbonTwist_unit`: The twist on the tensor unit is the identity.
- `ribbonTrace_vectorSpace`: For finite-dimensional vector spaces with flip braiding and trivial
  twist the ribbon trace is the ordinary trace.
- `ribbonTwist_sl2_V1`: In the generic sl₂ instance a positive twist on V₁ acts as q^(3/4), so θ is
  not the identity.

### 1.2 Ribbon Hopf algebras over a formal power series ring, and the category they present

A topological ribbon Hopf algebra over ℂ[[h]] is topologically free of countable topological rank,
with invertible antipode and continuous Hopf structure maps into h-adic completed tensor products, a
quasitriangular R and a central invertible ribbon r. A sequence is zero-convergent when each fixed
h-adic quotient has only finitely many nonzero terms. The completed tensor product, dual maps and
ribbon/pivotal identities are part of the structure. This is the ambient object of [HL]; an integral
subalgebra does not inherit a completion from it automatically. Explicitly, Δ^op(a)=RΔ(a)R⁻¹,
(Δ⊗id)R=R₁₃R₂₃, (id⊗Δ)R=R₁₃R₁₂, and the normalized counit identities hold. If u=μ(S⊗id)(R₂₁), then
r²=uS(u), S(r)=r, ε(r)=1 and Δ(r)=(R₂₁R)⁻¹(r⊗r). All products and maps here use the specified
completed tensor topology.

*Construction.* Use h-adically complete topologically free modules over ℂ[[h]] (Mathlib
`AdicCompletion`) and their completed tensor products, formed as completions of the algebraic tensor
product. State each ribbon identity in the completed tensor square or cube. Use zero-convergence to
justify continuous sums in the clasp and twist forms. ([HL] §§2.1–2.3, pp. 12–16; ribbon axioms in
§2.2, pp. 14–15.)

*Needs:* Mathlib `HopfAlgebra`, §1.1, Mathlib `AdicCompletion`, Mathlib `UniformSpace.Completion`.

The API:

- `TopologicalRibbonHopfAlgebra`: A countable-rank topologically free Hopf algebra over ℂ[[h]] with
  continuous completed-tensor maps, R and r satisfying the displayed ribbon identities.
- `TopologicalRibbonHopfAlgebra.R`: The invertible element of the completed tensor square, with the
  quasi-triangularity identities.
- `TopologicalRibbonHopfAlgebra.ribbon`: The central invertible element with its coproduct and
  antipode axioms.
- `TopologicalRibbonHopfAlgebra.moduleCategory`: Finite-rank topologically free continuous modules
  form a ribbon category, with braiding from R and positive twist from r⁻¹.
- `TopologicalRibbonHopfAlgebra.duals`: Finite-rank topologically free modules have continuous
  left/right duals and evaluation/coevaluation. No rigidity of all infinite-rank topologically free
  modules is asserted.
- `ZeroConvergent`: Zero-convergent families and the sums they define, which is what makes infinite
  expansions meaningful.

**Checks.**

- `trivialRibbonHopf`: The ground ring itself, with trivial R-matrix and ribbon element, is a
  topological ribbon Hopf algebra whose universal invariant is constant; this is the degenerate
  case.
- `twist_unit`: The twist on the tensor unit is the identity, which is the statement that the ribbon
  element acts trivially on the trivial module.
- `braiding_not_symmetric`: For the quantised enveloping algebra the braiding is not a symmetry: its
  square on a two-dimensional module is not the identity, which is exactly what makes the invariant
  see the knotting.
- `groupAlgebra_symmetric`: The completed group algebra of a countable abelian group with trivial
  R-matrix gives a symmetric, not merely braided, category; its universal invariant cannot
  distinguish a knot from the unknot.
- Mathlib's `HopfAlgebra` and `BraidedCategory` give the algebraic shadow (finite-dimensional,
  uncompleted); the completed tensor product is the new ingredient.
- `zeroConvergent_powers`: hⁿ tends to zero: modulo h^k only n<k can contribute.
- `zeroConvergent_constant`: the constant family 1 is not zero-convergent, already modulo h.
- `zeroConvergent_fixedOrder`: the constant family h is not zero-convergent, already modulo h²;
  membership of all terms in one fixed neighbourhood is insufficient.

### 1.3 The h-adic quantized enveloping algebra of sl(2) and its integral forms

Over ℚ[[h]] put q=exp(h), v=exp(h/2), K=exp(hH/2). U_h(sl₂) is the h-adically complete algebra with
[H,E]=2E, [H,F]=−2F, [E,F]=(K−K⁻¹)/(v−v⁻¹), interpreted by its h-adic expansion. Set e=(v−v⁻¹)E and
F̃^(n)=F^nK^n/[n]_q!=v^(−n(n−1)/2)F^(n)K^n. Habiro's U_q is the ℤ[q±1]-subalgebra generated by
K±1,e,F̃^(n); U_q^ev uses K±2. Their PBW bases are F̃^(i)K^je^k and F̃^(i)K^(2j)e^k. U_q=U_q^ev⊕K
U_q^ev. For F_p=U_q e^p U_q take the image of lim U_q/F_p in U_h and the induced tensor-power
completion; injectivity of the map from the inverse limit is not asserted.

*Construction.* Use the classical sl₂ data of LieHighestWeight Layer 3 and division of h-adic power
series. Establish the ordered PBW basis using the commutation rules of [Hab08] §2.1. Identify the
even direct summand and the ad-stable e-power filtration; form the image in U_h as in [Hab08] §2.2.
([Hab08] §§2.1–2.6, pp. 7–11, quantum algebra, integral forms and completions.)

*Needs:* Mathlib `HopfAlgebra`, LieHighestWeight Layer 3, Mathlib `AdicCompletion`, Mathlib
`UniformSpace.Completion`.

The API:

- `Uq`: The ℤ[q±1]-subalgebra generated by e=(v−v⁻¹)E, K±1 and F̃^(n)=F^nK^n/[n]_q!.
- `Uqev`: The ℤ[q±1]-subalgebra generated by e, K±2 and F̃^(n); q=v².
- `basis_Uq`: The ordered F̃^(i)K^je^k form a free ℤ[q±1]-basis; replace j by 2j for the even form.
- `Uqev_le_Uq`: Uqev is a subalgebra of Uq stable under Uq’s adjoint action.
- `completion`: The completed integral form is the image of the inverse limit for F_p=Uq e^p Uq in
  U_h; its tensor-power image completions are algebras. No injectivity of the inverse-limit map is
  presumed.

**Checks.**

- `basis_freeness`: The ordered F̃^(i)K^je^k are linearly independent over ℤ[q±1], with the stated K
  factors and q-divided-power normalization.
- `Uqev_ne_Uq`: K itself lies in Uq and not in Uqev, so the two forms are different.
- `classical_limit`: U_h/hU_h is the classical ℚ-enveloping algebra of sl₂; h is a parameter of the
  ambient complete algebra, not an element asserted in the integral coefficient ring ℤ[q±1].
- The even form is a subalgebra of the odd one, and the odd one is a subalgebra of U_h.

### 1.4 The ribbon structure of U_h(sl(2))

U_h(sl₂) has ΔH=H⊗1+1⊗H, ΔE=E⊗1+K⊗E, ΔF=F⊗K⁻¹+1⊗F, S(H)=−H, S(E)=−K⁻¹E, S(F)=−FK. With
D=exp(hH⊗H/4), R=D Σ_n v^(n(n−1)/2)(v−v⁻¹)^n/[n]! F^n⊗E^n. If R=Σ α⊗β, the ribbon element is r=Σ
S(α)K⁻¹β and the pivotal element is κ=K⁻¹. Positive framing acts by r⁻¹, with scalar q^(n(n+2)/4) on
V_n. All infinite sums live in specified h-adic completed tensor products.

*Construction.* Check the Hopf and quasitriangular identities from the ordered formulas of [Hab08]
§3.1. Construct r and prove centrality, S(r)=r, ε(r)=1 and Δr=(R₂₁R)⁻¹(r⊗r). On finite free modules
use R for braiding and r⁻¹ for the twist; compare the duality with Mathlib's `ExactPairing`.
([Hab08] §3.1, pp. 11–12, ribbon structure.)

*Needs:* §1.3, §1.1.

The API:

- `universalR`: The universal R-matrix of U_h, an invertible element of the completed tensor square.
- `yangBaxter`: The universal R-matrix satisfies the Yang-Baxter equation.
- `ribbonElement`: The ribbon element is a central invertible element with the standard
  compatibility with the coproduct and antipode.
- `braidedCategory_modules`: The category of finite-rank topologically free U_h-modules is braided,
  with braiding given by the R-matrix.
- `rigidCategory_modules`: The same category is rigid, with duals given by the antipode and the
  grouplike element.

**Checks.**

- `ribbon_unknot_framing`: A positive unit framing acts by r⁻¹, hence by q^(n(n+2)/4) on V_n. Using
  r instead reverses the anomaly.
- `R_matrix_classical_limit`: Modulo h the R-matrix is the identity, so the braiding degenerates to
  the symmetry of the classical category.
- `quantum_dimension_V1`: The quantum dimension of the 2-dimensional module is the quantum integer
  [2], not 2; a definition returning the ordinary dimension is wrong.
- The R-matrix satisfies the Yang-Baxter equation, which is what makes the braiding a braiding.

### 1.5 Braided Hopf algebra structure on the completed even integral form

The braided Hopf algebra structure of the braided transmutation of U_h induces a braided Hopf
algebra structure with invertible antipode on the image completion of the even integral form
for its e-power filtration; that
is, each of the braided structure maps, and the inverses of the braiding and the antipode, carries
the completed even form into the appropriate completed tensor power.

*Hypotheses.* the completed even integral form is the image completion of §1.3; the braided Hopf
structure on U_h is the transmutation of its ribbon Hopf structure.

*Proof sketch.* Recall the braided transmutation of U_h: the same algebra with the braided coproduct
and antipode built from the R-matrix. Check on the free basis of the even form that each structure
map has image in the completed tensor power of the even form. Extend to the completion by
continuity, using that each structure map respects the defining filtration. The same holds for the
odd form, compatibly with the ℤ/2-grading, which is the variant used for bottom knots. ([Hab08]
Theorem 3.1, §3.3, pp. 13–14, integral braided structure.)

*Needs:* §1.3, §1.4.

**Checks.**

- Each of the braided product, unit, coproduct, counit, antipode and its inverse preserves the
  integral form.
- A structure map that left the integral form would break the integrality of the universal
  invariant, which is the point of the theorem.
- The statement fails for the non-completed form, so the completion is not cosmetic.

### 1.6 Bottom tangles and their closure

Framed oriented tangles in the cube [0,1]³, with diagrams and framed Reidemeister moves rel
boundary, extend the framed link presentations of GeometricTopology Layer 4, which has no tangles;
they are defined here. An n-component bottom tangle is a framed oriented union of n arcs in the cube
with the i-th arc from bottom endpoint 2i to 2i−1 and no closed component. Closure by exterior arcs
gives a framed link; every framed link has such a presentation. Juxtaposition tensors bottom
tangles. Composition is the action of Habiro’s category B (objects b^m, suitable tangle morphisms
b^m→b^n) on bottom tangles, rather than arbitrary vertical stacking of two all-bottom tangles.

*Construction.* Define framed tangles by diagrams up to framed Reidemeister moves fixing the
endpoints. Impose the endpoint ordering and orientation convention. Build closure and the category B
action; distinguish its vertical composition from tensoring bottom tangles. ([Hab08] §4.1, pp.
14–15, bottom tangles and their closure.)

*Needs:* GeometricTopology Layer 4, §0.1.

The API:

- `BottomTangle`: BottomTangle n is the type of n-component bottom tangles up to isotopy.
- `closure`: closure sends a bottom tangle to a framed oriented link with the same number of
  components.
- `closure_surjective`: Every framed oriented link is the closure of some bottom tangle.
- `bottomTangleAction`: A B-morphism b^m→b^n acts on an m-component bottom tangle to give an
  n-component bottom tangle.
- `tensor`: Juxtaposition gives BT_m×BT_n→BT_(m+n).

**Checks.**

- `closure_trivial`: The closure of the trivial bottom tangle is the zero-framed unlink.
- `closure_of_bottom_knot`: A one-component bottom tangle closes to a knot; the number of components
  is preserved.
- `bottomTangle_not_closed`: A tangle with a closed component is not a bottom tangle; this excludes
  the degenerate case where the universal invariant would already be a trace.
- Composition of compatible morphisms in Habiro’s category B is associative and its action on bottom
  tangles is functorial. Juxtaposition is tensor product; two arbitrary all-bottom tangles have no
  vertical stacking composition.

### 1.7 Reshetikhin–Turaev functor

For a ribbon Hopf algebra (A,R,r) over a field, the finite-dimensional module category admits the
unique tensor functor from homogeneous colored directed ribbon graphs that sends signed colors to V
or V∗, coupons to their A-linear maps, crossings to flip∘R and turns to the evaluation/coevaluation
with pivotal u r⁻¹. Its value on a closed colored framed link is a scalar invariant under framed
isotopy. For U_h use finite free modules over the complete base and continuous structure maps.
Coloured ribbon graphs (framed tangles of §1.6 with coupons) and their presentation by generators
and relations are defined here as the domain of the functor, following [RT].

*Construction.* Use the generators and isotopy relations of coloured ribbon graphs (RT Lemmas
5.2–5.3). Assign R, pivotal duality and coupons; verify the relations by the ribbon identities.
Uniqueness follows from generation; compare the h-adic assignment with Habiro’s bead reading.
([Hab08] §5.2, pp. 19–20; [RT] Theorem 5.1, §5.1, pp. 12–13; proof in §5.4, pp. 15–16; ribbon
structure in §3.3, p. 7.)

*Needs:* §1.1, GeometricTopology Layer 4, Mathlib `HopfAlgebra`, §1.2.

The API:

- `RTFunctor`: Tensor functor with the specified generators and color duality.
- `RTFunctor_coupon`: The image of an A-linear coupon is its label.
- `RTFunctor_tensor`: Juxtaposition maps to the tensor product of maps.
- `RTFunctor_closed`: Closing a component is pivotal quantum trace.

**Checks.**

- `RTFunctor_empty`: The empty closed graph evaluates to 1.
- `RTFunctor_straight`: The straight colored strand evaluates to id_V.
- `RTFunctor_crossing_inverse`: A crossing followed by its inverse is the identity; a positive
  crossing alone is not assumed involutive.

### 1.8 The universal sl(2) invariant of a bottom tangle

For T∈BT_n the bead-reading rule gives J_T∈U_h completed⊗n, invariant under framed tangle isotopy
and in the diagonal adjoint-invariant submodule. Crossings use R±1, local turns use the pivotal
data, and products are read from right to left along the oriented components. J of the trivial
bottom tangle is 1⊗⋯⊗1; tensor is juxtaposition and B-actions are represented by the corresponding
braided structure maps.

*Construction.* Assign the local bead rules, using the stated order and pivotal element. Verify the
local isotopy relations from the ribbon axioms. Compare the B action with braided
multiplication/comultiplication and diagonal adjoint invariance. ([Hab08] §4.2, pp. 15–16, universal
invariant.)

*Needs:* §1.6, §1.4, §1.7.

The API:

- `J`: J T is the universal invariant of the bottom tangle T, an element of the completed n-fold
  tensor power.
- `J_trivial`: The universal invariant of the trivial bottom tangle is the unit.
- `J_bottomTangleAction`: J intertwines the category B action with the specified braided Hopf maps,
  where that action is defined.
- `J_tensor`: The universal invariant of a juxtaposition is the tensor product of the invariants.
- `J_mem_invariants`: The universal invariant lies in the adjoint-invariant part of the completed
  tensor power.

**Checks.**

- `J_unknot_zero_framed`: The universal invariant of the 0-framed unknotted bottom tangle is the
  unit.
- `J_framing_change`: Adding a positive kink inserts r⁻¹ in the bead product; invariance under an
  unframed Reidemeister-I move would lose the framing.
- `J_hopf_nontrivial`: The universal invariant of the bottom tangle closing to the Hopf link is not
  the unit, so the invariant sees linking.
- A negative framing change inserts r, the inverse of the positive one.
- A positive kink followed by a negative kink cancels. A single framing-changing Reidemeister-I curl
  multiplies by r⁻¹ or r and is not asserted to preserve the framed invariant.

### 1.9 The universal invariant of a topological ribbon Hopf algebra

For a topological ribbon Hopf algebra (A, R, r) over ℂ[[h]] (§1.2) and an n-component bottom tangle
T, define J_T^A ∈ A^{⊗̂n} by the bead-reading rule of §1.8: a positive crossing contributes the
factors of R, a negative crossing those of R⁻¹ (with the antipode applied to factors read against
the orientation), each local maximum or minimum read against the orientation contributes the pivotal
element or its inverse, and the beads on each component are multiplied from right to left along its
orientation. Then J_T^A is invariant under framed isotopy of bottom tangles, lies in the
adjoint-invariant part of A^{⊗̂n}, is multiplicative under juxtaposition, and intertwines the action
of Habiro's category of bottom-tangle morphisms with the braided Hopf maps of the transmutation of
A. Closing T and taking the quantum trace in finite-rank topologically free modules gives the
Reshetikhin–Turaev value of the closure. For A = U_h(sl₂) this is §1.8.

*Construction.* Check the local relations of framed tangle isotopy from the quasitriangularity and
ribbon identities in the completed tensor powers; the sums converge by the zero-convergence
condition. Compare the closure with §1.7. ([HL] §2.7, pp. 19–20, where the invariant is recalled
from [HabB] with its ad-invariance and the trace formula for coloured links.)

*Needs:* §1.2, §1.6, §1.7, §1.8.

The API:

- `universalInvariant`: J_T^A in the completed n-fold tensor power.
- `universalInvariant_isotopy`: invariance under framed isotopy of bottom tangles.
- `universalInvariant_tensor`: multiplicativity under juxtaposition.
- `universalInvariant_trace`: closing with finite-rank colours gives the Reshetikhin–Turaev value.

**Checks.**

- `universalInvariant_trivial`: the trivial n-component bottom tangle gives 1 ⊗ ⋯ ⊗ 1.
- `universalInvariant_sl2`: for U_h(sl₂) the invariant is that of §1.8.
- `universalInvariant_symmetric`: for a cocommutative A with R = 1 ⊗ 1 and r = 1 the invariant of
  every bottom knot is 1, so it cannot separate a knot from the unknot.

### 1.10 Integrality of the universal invariant on 0-framed bottom tangles

For an algebraically split and 0-framed n-component bottom tangle T, J_T lies in Inv((completed
U_q^ev) completed⊗n), where completion means the image of the e-power tensor filtration in U_h
completed⊗n. No conclusion of this form is claimed for every 0-framed link.

*Proof sketch.* Generate algebraically split 0-framed bottom tangles using the Borromean bottom
tangle and category B operations. Compute integral even Borromean coefficients. Use closure under
ψ±1, μ, braided Δ and braided S±1 and the diagonal adjoint action. ([Hab08] Theorem 4.1, p. 16;
proof in §4.3, pp. 16–17.)

*Needs:* §1.8, §1.5, §0.1.

**Checks.**

- The invariant of the 0-framed unknotted bottom tangle lies in the integral submodule, being the
  unit.
- The theorem fails for non-zero framings, where the ribbon element contributes denominators; this
  is why the framing hypothesis is present.
- Integrality is what makes the coloured Jones polynomials Laurent polynomials rather than rational
  functions.

### 1.11 The abstract data that turns a ribbon Hopf algebra into an invariant of homology spheres

A core subalgebra X of a topological ribbon Hopf algebra is topologically free with continuous
Δ(X)⊂completed X⊗X, S±1(X)⊂X, adjoint stability, and R in the ambient h-adic closure of X⊗X and the
pivotal element g in X itself. For the clasp c=Σ c′_i⊗c″_i, both families are zero-convergent
topological bases of X. If x=Σ x″_ic″_i lies in its ambient closure and y=Σ y′_ic′_i lies in X,
define ⟨x,y⟩=Σ x″_iy′_i; its convergence follows from these basis conditions. Twist forms are
T±(y)=⟨r±1,y⟩. Their normalization is T±(1)=1. Construction of an integral invariant also needs the
integral K_n stability conditions of §4.11. No arbitrary scalar Gauss denominator is inserted.

*Construction.* Use both clasp bases, their uniqueness of coordinates and zero-convergence. Prove
continuity and define pairing and twist forms by the displayed sum. Use the clasp normalization for
T±(1); retain the distinct integral K_n conditions for a Habiro-valued invariant. ([HL] Definition
3, §2.14, p. 28; §§2.15–2.16, pp. 29–35, core and twist systems.)

*Needs:* §1.2.

The API:

- `CoreSubalgebra`: Topological core with both clasp basis conditions and stability.
- `claspForm`: Continuous pairing between the closure and the core with the coordinate formula
  above.
- `CoreSubalgebra.twistForm`: T±(y)=⟨r±1,y⟩.
- `CoreSubalgebra.twistForm_one`: Both twist forms send 1 to 1.

**Checks.**

- `claspForm_dualBasis`: The two clasp basis families pair as Kronecker delta.
- `coreInvariant_empty`: The empty surgery presentation gives 1, without a denominator.
- `core_pairing_no_arbitrary_dual`: A one-sided basis without the other topological basis does not
  satisfy CoreSubalgebra; it cannot define the coordinate pairing.

### 1.12 Drinfeld–Jimbo algebra

For a finite-dimensional simple complex Lie algebra with normalized short-root length²=2, put
d_i=(α_i,α_i)/2∈{1,2,3}, v_i=v^d_i, q=v², and use root lattice Y⊂weight lattice X with D=|X/Y|.
U_h(g) has Cartan-root commutators, [E_i,F_j]=δ_ij(K_i−K_i⁻¹)/(v_i−v_i⁻¹), and quantum Serre
relations of degree 1−a_ij, with K_i=exp(hH_i/2) in the convention of [HL]. The generic U_q(g) over
ℂ(v) embeds in U_h(g); its PBW root-vector and Lusztig divided-power integral forms are
distinguished. Classical root data and the ordinary PBW theorem come from LieHighestWeight.
Concretely, a_ij=⟨α_j,α_i∨⟩ is the transpose of Mathlib's `RootPairing.Base.cartanMatrix`, so
B_ij=d_i a_ij is symmetric; over ℂ(q) adjoin a central v^(±1) with v²=q, impose
K_iE_jK_i⁻¹=v^(B_ij)E_j and K_iF_jK_i⁻¹=v^(−B_ij)F_j, and both Serre relations Σ_s(−1)^s[r choose
s]_i X_i^(r−s)X_jX_i^s=0 for X=E,F and r=1−a_ij, where [n choose k]_i=v^(−d_i k(n−k)) times the
Gaussian binomial in q^(d_i).

*Construction.* Take the simple root datum and an ordering of the positive roots from
LieHighestWeight Layer 1. Construct the quantum Serre quotient and its topological Hopf maps, using
the corrected relation for K_β and F_α (correction 3 under Corrections to the sources). Use quantum
root vectors for the PBW basis and define the distinct Lusztig and dual integral lattices. ([HL]
§§3.1–3.4, pp. 36–40, quantum presentations, gradings and triangular forms.)

*Needs:* Mathlib `HopfAlgebra`, LieHighestWeight Layer 3, §1.2, LieHighestWeight Layer 1.

The API:

- `DrinfeldJimboDatum`: Root/weight lattices, d_i,D and the chosen root ordering.
- `DrinfeldJimboAlgebra`: The topological quantum Serre algebra for that datum.
- `quantumPBWBasis`: Ordered root-vector divided powers and Cartan factors form the specified PBW
  basis.

**Checks.**

- `DJ_sl2_relations`: For rank one the relations reduce to U_h(sl₂) of §1.3, including the sign of
  the weight of F.
- `DJ_serre_commuting_roots`: For a_ij=0 the quantum Serre relation is E_iE_j=E_jE_i.
- `DJ_root_lengths_G2`: In G₂ the long-root d_i is 3; replacing every v_i by v loses the Serre
  coefficients.

### 1.13 Integral core subalgebra

For the ordered PBW data of U_h(g), the h-adic core X_h over ℂ[[√h]] has weighted basis
h^(||n||/2)b_h. Over A=ℤ[v±1] adjoin the square roots √Φ_k(q) to form Ã. The integral core X_ℤ is
the Ã-span of √((q;q)_n)b^Lusztig_n with the multi-index factorial and PBW ordering of [HL] §5. It
is free with those two-sided clasp bases and is stable under the coproduct, antipode, adjoint
action, braiding, bar and mirror operations. These weighted lattices are separate from U_A and from
the eventual ℤ[q±1] coefficient ring.

*Construction.* Use the PBW bases of [HL] §3 and the dual PBW form to factor the clasp. Insert the
weights h^(||n||/2) to build the topological core and verify both clasp bases ([HL] §4). Use the
cyclotomic square-root weights and divisibility to prove integral stability and T±(X_ℤ)⊂Ã ([HL] §5).
([HL] §§4–5, pp. 46–67, h-adic and integral cores.)

*Needs:* §1.12, §1.11, Mathlib `Polynomial.cyclotomic`.

The API:

- `weightedPBWCore`: The √h-adic core with the displayed weighted PBW basis.
- `integralQuantumCore`: The Ã-lattice with cyclotomic square-root PBW weights.
- `integralCore_twist`: The clasp twist forms take the integral core to Ã.
- `integralCore_stable`: The specified Hopf, adjoint, braiding, bar and mirror maps preserve the
  core.

**Checks.**

- `integralCore_unit`: The zero PBW index has weight 1 and contains the unit.
- `integralCore_sl2`: Under the rank-one identification the core construction yields the sl₂
  integral image used for unified invariants, with its own coefficient comparison.
- `integralCore_weights_essential`: The n-th positive-root basis weight contains √((q;q)_n), rather
  than an unweighted Lusztig basis; omitting that weight is a different lattice.

### 1.14 Tilting semisimplification

Specialise the Lusztig divided-power quantum group at the root of [Saw]: q=s^L, s of order lL, l′=l
for odd l and l/2 for even l. For types with d_max|l′ require l′≥d_max h∨; otherwise l′>h. The
tilting category consists of modules with Weyl and dual Weyl filtrations. Quotient Hom(V,W) by maps
f with qtr(hf)=0 for every h:W→V. Sawin’s full ribbon functor yields a semisimple ribbon category
with simples in the open affine alcove ⟨λ+ρ,θ₀⟩<l′. For sl₂ in Habiro variables v of order 2r, r≥2,
the admissible colors are V₀,…,V_(r−2); the root-lattice scaling of [Saw] must be compared before
using this specialization. General-type modularity is not asserted.

*Construction.* Construct specialized Lusztig modules and Weyl filtrations using the highest-weight
theory of LieHighestWeight Layer 3 and the quantum Weyl modules of §1.12. Prove the negligible maps
form a tensor ideal, then use Sawin’s alcove and tilting decomposition theorem. Descend ribbon
evaluation through the full quotient functor and compare the sl₂ root convention. ([Saw] §4, pp.
18–22; §6, Theorem 5, pp. 24–26.)

*Needs:* §1.7, LieHighestWeight Layer 3, §1.12.

The API:

- `TiltingModule`: Module with both Weyl and dual Weyl filtrations.
- `IsNegligibleMorphism`: f:V→W is negligible iff qtr(hf)=0 for all h:W→V.
- `TiltingSemisimplification`: The quotient ribbon category by the negligible tensor ideal.
- `tiltingSimple_alcove`: Simples are labelled by the stated open affine alcove under the root
  bounds.

**Checks.**

- `negligible_identity_outside_alcove`: An indecomposable tilting module outside the alcove has
  negligible identity under the root bounds.
- `tilting_unit_not_negligible`: The unit has quantum trace 1 and survives.
- `sl2_alcove_rank`: For r=3 the two retained sl₂ labels are 0 and 1; the weight r−1=2 does not
  survive as a simple.

### Examples

On V₁ the positive twist acts by q^(3/4) and the quantum dimension is [2] = v + v⁻¹, so the 0-framed
unknot coloured by V₁ has invariant [2] and the (+1)-framed one q^(3/4)[2]. Modulo h the R-matrix is
1 ⊗ 1 and the braiding is the flip. K lies in U_q but not in U_q^ev. At r = 3 the tilting quotient
for sl₂ keeps V₀ and V₁ and kills V₂.

### Dependencies

Layer 0; Mathlib `HopfAlgebra`, `BraidedCategory`, `RigidCategory`, `ExactPairing`,
`AdicCompletion`, `UniformSpace.Completion`, `Polynomial.cyclotomic`; GeometricTopology Layer 4;
LieHighestWeight Layers 1 and 3.

## Layer 2: coloured Jones polynomials and the cyclotomic expansion

Tracing the universal invariant in the coloured modules V_n gives the coloured Jones polynomials.
Habiro's insight is to use instead the cyclotomic colours P_n = ∏_(i<n)(V₁ − v^(2i+1) − v^(−2i−1))
of the representation ring, which are dual to the central elements σ_n under the quantum trace. The
universal invariant of a 0-framed knot then expands as Σ a_n σ_n with Laurent polynomial
coefficients a_n = J_K(P″_n), and the coloured Jones polynomials of algebraically split 0-framed
links with colours in the n-th step of the cyclotomic filtration are divisible by an explicit
cyclotomic factor. Evaluating the central expansion at C² = 4 gives the unified Kashaev invariant of
a knot in the Habiro ring, whose values at roots of unity are the Kashaev invariants.

### 2.1 Finite free sl₂ colors

For n≥0, V_n is the rank n+1 finite free ℚ[[h]] highest-weight U_h-module of weight n, with basis
F̃^(i)v₀, 0≤i≤n, and actions as in [Hab08] §5.1. For a finite free module V define
tr_q^V(x)=Tr(ρ_V(K⁻¹x)). The representation algebra R_A=A[V₁] has V_m V_n=Σ_(j=0)^min(m,n)
V_(m+n−2j); equivalently V_n=S_n(V₁) with Mathlib’s second-kind Chebyshev
S₀=1,S₁=X,S_(n+2)=XS_(n+1)−S_n. Quantum dimension is [n+1], with [n]=(v^n−v⁻n)/(v−v⁻¹).

*Construction.* Construct the highest-weight action in the ordered basis and check the algebra
relations. Use the pivotal closure to identify the quantum trace. Prove the Clebsch–Gordan rule and
compare the resulting monic recursion with Chebyshev.S. ([Hab08] §5.1, p. 18; §§5.3–5.4, pp. 19–20.)

*Needs:* §1.3, §1.4, Mathlib `Polynomial.Chebyshev.S`.

*Lean:* `qInt`, `color`, `qdim`, `qdim_color`.

The API:

- `sl2Color`: V_n with rank n+1 and the fixed highest-weight basis.
- `quantumTrace`: Tr(ρ(K⁻¹x)) on a finite free color.
- `sl2RepRing`: R_A=A[X], X representing V₁.
- `qInt`: The balanced Laurent quantum integer [n].
- `color_Chebyshev`: V_n equals Chebyshev.S n evaluated at V₁.

**Checks.**

- `quantum_dimension_V0`: qdim V₀=1.
- `quantum_dimension_V1`: qdim V₁=v+v⁻¹, not the constant 2.
- `color_tensor_V1`: V₁⊗V₁=V₂+V₀, so V₂=X²−1 rather than X².
- `quantum_integer_small`: [0]=0, [1]=1 and [2]=v+v⁻¹; the Laurent sum has no
  division by v−v⁻¹ at v=1, where [n] specializes to n.
- `color_small`: V₀=1 and V₁=X in A[X], before taking quantum dimension. Replacing the
  representation algebra by its dimension image loses V₁ as an independent variable.

### 2.2 Coloured Jones polynomials from the universal invariant

For a framed m-component oriented link presented as closure of T, put
J_L(V_(n₁),…,V_(n_m))=(tr_q^(V_n₁)⊗⋯⊗tr_q^(V_nm))(J_T). This is independent of T and multilinear in
virtual colors. The empty link has value 1; the zero-framed unknot has [n+1]. Generic framed values
may need ℤ[q^(±1/4)]; even framings give ℤ[v±1], and algebraically split zero-framed links give
ℤ[q±1]. Positive framing on a V_n component multiplies by q^(n(n+2)/4). For a zero-framed knot
define J^red_(K,N)=J_K(V_(N−1))/[N] as a Laurent polynomial by the divisibility theorem before root
evaluation, N≥1.

*Construction.* Use the graphical closure of §1.7 to prove isotopy invariance and independence of
the bottom tangle. Extend traces linearly to virtual colors. Distinguish scalar-field targets and
reduced division before specialization; quantum dimension vanishes at some roots. ([Hab08]
§§5.2–5.3, pp. 19–20; §6.2, pp. 21–22.)

*Needs:* §1.8, §1.7, §2.1.

The API:

- `colouredJones`: colouredJones L n is the coloured Jones polynomial of the framed link L with the
  given colours.
- `colouredJones_unknot`: The 0-framed unknot coloured by V_n has value the quantum integer [n+1].
- `colouredJones_multilinear`: The coloured Jones invariant is multilinear in the colours, hence
  extends to the representation ring.
- `reducedJones`: The reduced coloured Jones polynomial is the quotient by the value of the unknot
  with the same colour.
- `colouredJones_framing_change`: Changing the framing of a component multiplies the invariant by
  the ribbon scalar of its colour.

**Checks.**

- `colouredJones_unknot_V1`: The 0-framed unknot coloured by the 2-dimensional module has value the
  quantum integer [2], not 1; a definition returning 1 is the reduced one.
- `colouredJones_positive_framing`: The +1-framed unknot in color V₁ has q^(3/4)(v+v⁻¹), not merely
  [2].
- `colouredJones_split_union`: For a split union the invariant is the product of the invariants, so
  a definition that failed multiplicativity would be wrong.
- The trefoil coloured by V_1 recovers the Jones polynomial in the fixed variable convention.
- The invariant is multilinear in the colours, so it extends to the representation ring.

### 2.3 Jones normalization comparison

For a zero-framed knot, the fundamental-color quantum invariant is unreduced:
J_K(V₁)=[2]J^red_(K,2). Compare J^red_(K,2) with the Jones polynomial V_K(t) of GeometricTopology
Layer 4, V_U=1, t=A⁻⁴. Choose Habiro's positive braid crossing to represent the positive braid
generator whose cube closes to the right-handed trefoil in the bracket convention. Then
`reducedJones_eq_jones` states J^red_(K,2)(q)=V_K(q⁻¹), with no additional mirror operation.
On V₁⊗V₁ the crossing has eigenvalues q^(1/4) on V₂ and −q^(−3/4) on V₀. Taking the trace of its
cube and correcting its writhe gives
q^(−9/4)(q^(3/4)[3]−q^(−9/4))/[2]=q⁻¹+q⁻³−q⁻⁴.
Thus the right-handed trefoil has V_K(t)=t+t³−t⁴, while its mirror has t⁻¹+t⁻³−t⁻⁴. The
bracket-side witness is fixed in Scope and ownership.

*Route.* Use the bracket skein relation and the writhe correction of GeometricTopology Layer 4.
Compute the V₁ crossing eigenvalues and match the oriented skein normalization. Check unknot,
oriented trefoil/mirror and framing twist; this determines the substitution uniquely. ([Hab08] §5.2,
pp. 19–20; §6.2, pp. 21–22; [RT] §6.1, p. 17.)

*Needs:* §2.2, GeometricTopology Layer 4.

**Checks.**

- The unknot has J^red_(U,2)=V_U=1; its unreduced value is [2].
- At q=2 the right-handed trefoil's reduced quantum value is 9/16, whereas V_K(2)=−6; using
  t=q fails this test.
- Mirroring exchanges q and q⁻¹, so the mirrored value at q=2 is −6.

### 2.4 The elements P_n and the cyclotomic basis of the representation ring

In ℚ(v)[X]=R_ℚ(v), X=V₁, define {a}=v^a−v⁻a, {n}!=∏_(j=1)^n{j}, {a}_b=∏_(j=0)^(b−1){a−j}. Set
P_n=∏_(i=0)^(n−1)(X−v^(2i+1)−v^(−2i−1)), P′_n=P_n/{n}!, P″_n=P_n/{2n+1}_(2n), and
P̃′_n=v^(−n(n−1)/2)P′_n. P_n is monic and forms a triangular basis over ℤ[v±1]; the three rescalings
are distinct elements in the fraction-field representation algebra.

*Construction.* Define the products including the empty product. Use monicity to prove triangular
basis comparison with the V_n. Specify the nonzero denominators in ℚ(v), rather than claiming the
normalized colors lie in ℤ[v±1][X]. ([Hab08] §6.1, p. 21, P and P″; §8.1, p. 28, P′ and P̃′.)

*Needs:* §2.1.

*Lean:* `cycloColor`, `qdim_cycloColor`.

The API:

- `P`: The exact monic product P_n in R_A.
- `P_prime`: P′_n=P_n/{n}! in R_ℚ(v).
- `P_doublePrime`: P″_n=P_n/{2n+1}_(2n).
- `P_tildePrime`: P̃′_n=v^(−n(n−1)/2)P′_n.
- `P_basis`: The P_n form a monic triangular A-basis.

**Checks.**

- `P_zero_eq_one`: P₀=P′₀=P″₀=1.
- `P_one`: P₁=X−v−v⁻¹.
- `P_rescalings_distinct`: P″₁=P₁/({3}{2}) whereas P′₁=P₁/{1}; the denominators are different.

### 2.5 Completed even center

Set C=(v−v⁻¹)²FE+vK+v⁻¹K⁻¹ and σ_n=∏_(i=1)^n(C²−q^i−2−q⁻i), σ₀=1. The center of the completed even
image integral form is lim_n ℤ[q±1][C²]/(σ_n); every element has a unique expansion Σ a_n σ_n,
a_n∈ℤ[q±1]. This is the even statement in the companion center theorem, distinct from the full
center with coefficients in A+AC. It identifies the topology on the center used in the knot
expansion.

*Construction.* Compute the polynomial center from PBW and the quantum Casimir. Use the induced
e-power ideals and the monic σ_n basis to identify the completed center. Restrict the graded q-form
to its even part; use center theorem Theorem 11.2. ([HabC] Theorem 11.2, §11, p. 31, even q-form
center.)

*Needs:* §1.3, §1.10.

*Lean:* `casimirSigma`, `casimirSigma_eval_color`.

The API:

- `quantumCasimir`: C with the stated normalization.
- `sigma`: The monic central polynomial σ_n.
- `evenCenterExpansion`: An element of the completed even center has unique coefficients a_n∈ℤ[q±1].

**Checks.**

- `sigma_zero`: σ₀=1.
- `sigma_one`: σ₁=C²−q−2−q⁻¹.
- `sigma_Vn_vanish`: σ_i acts by zero on V_n when i>n, since C acts by v^(n+1)+v^(−n−1).

### 2.6 The quantum trace pairing is dual to the cyclotomic basis

For m,n≥0, tr_q^(P″_m)(σ_n)=δ_mn, where the trace is linearly extended over ℚ(v) and σ_n has the
Casimir normalization above.

*Proof sketch.* Compute the trace of σ_n on V_j from its Casimir eigenvalue and [j+1]. Insert the
triangular formula for P″_m. Use the resulting q-binomial cancellation; check m=n=0 gives
tr_V0(1)=1. ([Hab08] Proposition 6.3, §6.2, p. 21; proof in §6.3, pp. 22–24.)

*Needs:* §2.4, §2.5, §2.1.

**Checks.**

- tr_q^(P″₀)(σ₀) = 1 and tr_q^(P″₀)(σ₁) = 0: σ₁ acts by zero on V₀.
- Duality forces the coefficients of the cyclotomic expansion to be the coloured Jones values
  J_K(P″_n), unreduced.
- Without the rescaling the pairing is the stated quantum binomial rather than 1, so the
  normalisation is not cosmetic.

### 2.7 Cyclotomic expansion of the universal invariant of a bottom knot

For a zero-framed bottom knot T with closure K there are unique a_i(K)∈ℤ[q±1], a₀=1, with J_T=Σ_i
a_i(K)σ_i and a_i(K)=J_K(P″_i). In ordinary colors J_K(V_n)=Σ_(i=0)^n ({n+1+i}_(2i+1)/{1}) a_i(K).
The reduced polynomial J^red_(K,N) is obtained by dividing this identity by [N] before evaluation;
Habiro’s name “reduced Jones polynomial” a_i is a different normalization from J^red_(K,N).

*Proof sketch.* Use bottom-knot integrality and adjoint invariance to place J_T in the completed
even center. Take quantum trace against the P″ dual basis to extract a_i. Trace in V_n; σ_i vanishes
for i>n, giving the finite ordinary-color formula. ([Hab08] Theorem 6.4, §6.2, pp. 21–22.)

*Needs:* §2.6, §2.5, §1.10, §2.2.

*Lean:* `colorExpansionCoeff`, with `brace` for {a}.

**Checks.**

- For the unknot the expansion is the single term σ₀, so all higher coefficients vanish.
- The coefficients are Laurent polynomials, by the integrality theorem, which is the point of the
  expansion.
- Summing the expansion against the change-of-basis formula recovers the ordinary coloured Jones
  polynomials.

### 2.8 Each coloured Jones polynomial is determined modulo an explicit ideal by the earlier ones

For a zero-framed knot and n≥1, the values J_K(V₀),…,J_K(V_(n−1)) determine a₀,…,a_(n−1) exactly and
determine J_K(V_n) modulo ({2n+1}_(2n)) in ℤ[v±1]. The new term has coefficient
{2n+1}_(2n+1)/{1}={2n+1}_(2n). This is a finite triangular consequence, not reconstruction of a knot
from its invariants.

*Proof sketch.* Solve the triangular color system successively in ℚ(v). Use integrality of the
extracted a_i. For V_n reduce the last summand modulo its explicit integral factor. ([Hab08]
Proposition 6.5, §6.2, p. 22.)

*Needs:* §2.7.

**Checks.**

- For n=1 the earlier value J_K(V₀)=1 determines a₀=1 and gives the stated congruence for J_K(V₁).
  The statement is for n ≥ 1.
- The ideal is not the zero ideal, so the statement is a congruence and not an equality; a stronger
  reading would be false.
- The result is a consequence of integrality and not of the definition, so it fails for invariants
  without the cyclotomic expansion.

### 2.9 Finite truncations, integrality of coefficients, and the order of operations

For N≥0 define Z_K,<N=Σ_(i<N)a_iσ_i in the polynomial center and, for a fixed ordinary color n,
T_(K,n,N)=Σ_(i<min(N,n+1)) ({n+1+i}_(2i+1)/{1})a_i∈ℤ[v±1]. If N>n then T=J_K(V_n). Central
truncations differ by a multiple of σ_N. They are not one scalar Laurent polynomial equal to every
color. Evaluation of truncations of factorial series is instead the statement of
HabiroCyclotomicCompletions Layers 2–3 and applies to an element of that completion; no generic root
cutoff for an unspecified Jones truncation is asserted.

*Construction.* Truncate the unique central expansion. Trace σ_i in the fixed V_n to obtain the
finite sum and its exact range. Keep the central σ-filtration and the scalar Habiro factorial
filtration distinct. ([Hab08] §6.2, pp. 21–22, finite color traces.)

*Needs:* §2.7, §2.5, HabiroCyclotomicCompletions Layer 2 (factorial series, 2.1),
HabiroCyclotomicCompletions Layer 3 (root evaluation, 3.1).

*Lean:* `colorTruncation`, `colorTruncation_unknot`.

The API:

- `cyclotomicTruncation`: Z_K,<N in the polynomial center.
- `colorTruncation`: The finite scalar sum T_(K,n,N).
- `cyclotomicTruncation_trunc`: Z_K,<M−Z_K,<N is divisible by σ_N for M≥N.
- `colorTruncation_exact`: For N>n the trace truncation equals J_K(V_n).

**Checks.**

- `cyclotomicTruncation_zero`: At N=0 the truncation is 0, whereas the V₀ value becomes 1 at N=1.
- `colorTruncation_V1`: At N=2 the V₁ value is [2]+{3}{2}a₁.
- `cyclotomicTruncation_compat`: Increasing N changes only terms divisible by σ_N.

### 2.10 The algebra spanned by the cyclotomic elements and its completion

Let P be the ℤ[q±1]-span of P̃′_n in R_ℚ(v), q=v²; it is a subalgebra, not the ℤ[v±1]-span of
unnormalized P_n. P_k=span_(ℤ[q±1]){P̃′_n:n≥k} is an ideal and P̂=lim P/P_k, with unique formal
coordinates in P̃′_n. In the P′ basis P′_m P′_n=Σ_(i=0)^min(m,n) {m+n}!/({i}!{m−i}!{n−i}!)
P′_(m+n−i); rescaling gives integral ℤ[q±1] structure coefficients for P̃′.

*Construction.* Use the multiplication formula of [Hab08] §8.1 in the fraction representation
algebra. Rewrite in the tilde basis and verify the coefficients lie in ℤ[q±1]. Indices of all
products are at least max(m,n), proving the filtration ideals; take their inverse limit. ([Hab08]
§8.1, p. 28, color algebra and its completion.)

*Needs:* §2.4, Mathlib `UniformSpace.Completion`.

The API:

- `algebraP`: The ℤ[q±1]-linear span of P̃′_n=v^(−n(n−1)/2)P_n/{n}! in ℚ(v)[V₁], with q=v².
- `mul_P`: The displayed P′ multiplication rule, transported to the integral tilde basis.
- `algebraP_isSubalgebra`: The span of P̃′_n is closed under products and contains 1, so is a
  ℤ[q±1]-subalgebra of ℚ(v)[V₁].
- `filtration`: P_k is the ℤ[q±1]-span of P̃′_n for n≥k; it is an ideal of P and P_kP_l⊂P_max(k,l).
- `completion`: The inverse limit P̂=lim P/P_k has unique convergent coordinates in P̃′_n, with
  coefficients in ℤ[q±1].

**Checks.**

- `P_zero_eq_one`: P 0 is the unit of the algebra.
- `mul_P_one_one`: P′₁P′₁=({2}!/{1}!²)P′₂+({2}!/{1}!)P′₁; the coefficients change upon tilde
  rescaling.
- `twistElement_not_mem`: The twist element lies in the completion and not in the algebra, so the
  completion step is necessary.
- The structure constants are Laurent polynomials, so P is an algebra over the Laurent polynomial
  ring and not merely over its fraction field.
- The completion contains elements that are infinite sums, such as the twist element, which do not
  lie in P itself.

### 2.11 Quantum traces of the integral form in cyclotomic colours are integral

For x∈U_q^ev and y∈P, tr_q^y(x) lies in ℤ[q±1]. Both the even form and the tilde-normalized ℤ[q±1]
color lattice are necessary hypotheses of the stated theorem.

*Proof sketch.* Compute on PBW x and the tilde P′ basis. Use the divided-power action and q-binomial
integrality. Extend linearly over the actual ground ring ℤ[q±1]. ([Hab08] Lemma 8.5, §8.3, p. 29;
proof in §8.4, pp. 30–31.)

*Needs:* §1.3, §2.10, §2.1.

**Checks.**

- The trace of the unit in the colour P_0 is 1.
- The trace of a basis monomial with mismatched degrees vanishes, which is the vanishing that makes
  the computation finite.
- The lemma fails for colours outside the algebra P, where denominators appear, so the restriction
  on colours is necessary.

### 2.12 Integrality and divisibility for algebraically split 0-framed links

For an m-component algebraically split zero-framed L, colors x_i∈P_(k_i), and k=max_i k_i,
J_L(x₁,…,x_m) belongs to ({2k+1}_(q,k+1)/{1}_q)ℤ[q±1], where {a}_q=q^a−1 and
{a}_(q,b)=∏_(j=0)^(b−1){a−j}_q. The empty link has value 1 separately. Consequently the multilinear
map extends continuously P̂^m→ℤ[q]^, the Habiro ring.

*Proof sketch.* Apply universal even integrality and the strengthened quantum-trace divisibility to
the largest filtration index. Use the explicit ideal of [Hab08] Theorem 8.2, not merely Laurent
integrality. Show its generators are cofinal with cyclotomic factorial ideals, giving the continuous
extension ([Hab08] Corollary 8.3). ([Hab08] Theorem 8.2 and Corollary 8.3, §8.2, p. 29.)

*Needs:* §2.10, §1.10, §2.11, HabiroCyclotomicCompletions Layer 1 (the cyclotomic completion, 1.4).

**Checks.**

- For the unknot with colour in the k-th step the value is divisible by the stated factor, which is
  the one-component case.
- The divisibility fails for links that are not algebraically split, which is why the hypothesis is
  present.
- The theorem gives the convergence of the surgery sum used to define the unified invariant.

### 2.13 What a cyclotomic expansion is not

HabiroCyclotomicCompletions Layer 2 supplies generic factorial-series representations of elements of
the completion. This layer proves a different theorem: the integral central σ-expansion of the
universal invariant of a zero-framed knot, with uniquely characterized coefficients a_i=J_K(P″_i). A
completion element need not be a knot invariant; evaluation at roots alone supplies neither these
coefficients nor knot presentation independence. Link divisibility is the algebraically split
zero-framed multilinear theorem, not a blanket knot-basis formula for all links.

*Route.* Compare the domains, bases and uniqueness statements. Keep conventional reduced color
polynomials distinct from Habiro’s a_i. Use an explicit invariant comparison before attaching a
generic completion element to a knot. ([Hab08] §6.2, pp. 21–22; §8.2, p. 29.)

*Needs:* §2.7, §2.12, HabiroCyclotomicCompletions Layer 2 (factorial series, 2.1).

**Checks.**

- The element Σ_n (q;q)_n of the Habiro ring is a factorial series, but no knot is attached to it by
  that fact alone.
- For the 0-framed Hopf link no knot cyclotomic expansion applies; the link is not algebraically
  split, so even the link divisibility theorem does not apply.

### 2.14 Unified Kashaev invariant

For a zero-framed knot K with integral cyclotomic coefficients a_n(K)=J_K(P″_n), define
H_K(q)=Σ_(n≥0) a_n(K)∏_(i=1)^n(2−q^i−q⁻ⁱ)=Σ a_n(K)(q;q)_n(q⁻¹;q⁻¹)_n in the scalar integral Habiro
ring. This is evaluation C²↦4 of the central σ_n expansion; each product is (−1)^n
q^(−n(n+1)/2)(q;q)_n², so the series converges in that ring. At a primitive root ζ of order N,
evaluation equals the reduced dimension-N colored Jones polynomial J^red_(K,N)(ζ), and terms n≥N
vanish. The unknot gives 1 and the order-one value is 1. This construction gives the unified Kashaev
element without the two-variable completion of [Whe], which is outside this roadmap (see Scope and
ownership).

*Construction.* Apply the central coefficient theorem to evaluate σ_n at C²=4. Factor the product as
a Laurent unit times the square of the cyclotomic factorial; use the completion of
HabiroCyclotomicCompletions Layer 1. At ζ^N=1 compare C²=4 with the normalized V_(N−1) trace and use
[Hab08] §7.1; form the reduced polynomial before evaluation. ([Hab08] §7.1, pp. 24–26, θ₀
specialization.)

*Needs:* §2.7, §2.5, HabiroCyclotomicCompletions Layer 1 (the cyclotomic completion, 1.4),
HabiroCyclotomicCompletions Layer 3 (root evaluation, 3.1).

The API:

- `unifiedKashaevInvariant`: The displayed factorial-square series in the integral Habiro ring.
- `unifiedKashaevInvariant_eval`: At primitive order N its evaluation is J^red_(K,N)(ζ).
- `unifiedKashaevInvariant_truncate`: At order N only terms n<N contribute.
- `unifiedKashaevInvariant_unknot`: The unified unknot invariant equals 1.

**Checks.**

- `unifiedKashaev_unknot`: The unknot gives the constant element 1.
- `unifiedKashaev_order_one`: At q=1 only a₀(K)=1 remains.
- `unifiedKashaev_factorial_square`: The n-th product equals (−1)^n q^(−n(n+1)/2)(q;q)_n², hence has
  at least twice the factorial divisibility.

### 2.15 The Kashaev invariant, its identification with a colored Jones evaluation, and the periodic function it defines

For N≥2 the Murakami–Murakami theorem identifies Kashaev ⟨K⟩_N with J^red_(K,N)(exp(2πi/N)), where
color N means dimension N and the reduced polynomial is formed before specialization. For α=a/c in
lowest terms, c>0, set 𝒥_K(α)=J^red_(K,c)(exp(−2πiα)); then 𝒥_K(−1/N)=⟨K⟩_N. It is one-periodic and
Galois equivariant: σ_b𝒥_K(a/c)=𝒥_K(ba/c), gcd(b,c)=1. This does not mean that every value is fixed
by every Galois automorphism. For 4₁, ⟨4₁⟩_N=Σ_(j=0)^(N−1)|(ζ_N;ζ_N)_j|² and the first six values
are 1,5,13,27,46+2√5,89. The order-one extension is defined to be 1. Its root values come from the
unified integral Habiro element H_K. Kashaev's original R-matrix definition enters only through the
comparison theorem of [MM]; it is not a second construction here.

*Construction.* Use the reduced colored-Jones polynomial with dimension index N and MM’s R-matrix
comparison. Apply the cyclotomic field action to define the function at any primitive root. Compute
the figure-eight finite product formula, fixing the GZ minus sign in the rational argument. ([GZ]
§1, equations (1.1)–(1.2), p. 9, and rational extension on p. 10; [MM] Theorem 4.9, §4, p. 15.)

*Needs:* §2.2, §2.9, HabiroCyclotomicCompletions Layer 3 (root evaluation, 3.1), §2.14.

*Lean:* `figureEightKashaevSum`, `figureEightKashaev`, `figureEightKashaev_values`.

The API:

- `kashaevInvariant`: The element of the ring of integers with a root of unity adjoined attached to
  a knot and a positive integer.
- `kashaevInvariant_eq_colouredJones`: Its identification with the evaluation of the colored Jones
  polynomial in the corresponding colour.
- `kashaevFunction`: 𝒥_K(a/c)=J^red_(K,c)(exp(−2πia/c)), c>0, is one-periodic and Galois
  equivariant; 𝒥_K(−1/N)=⟨K⟩_N.
- `kashaevFunction_unique`: The values at −1/N, periodicity and σ_b𝒥(a/c)=𝒥(ba/c) uniquely determine
  the rational function. Values need not be pointwise Galois fixed.
- `figureEightKashaev`: The closed form and the first values for the figure-eight knot.

**Checks.**

- `kashaev_unknot`: For the unknot the Kashaev invariant is one for every order, and the periodic
  function is constant.
- `figureEightKashaev_small`: The first six values for the figure-eight knot are one, five,
  thirteen, twenty-seven, forty-six plus twice the square root of five, and eighty-nine; a wrong
  normalisation would not reproduce them.
- `kashaevFunction_periodic`: The function satisfies that its value at an argument plus one equals
  its value at the argument; this is what makes the statement at minus one over the integer
  meaningful.
- `kashaev_Galois_equivariance`: At order 5, the automorphism sending ζ₅ to ζ₅² changes 46+2√5 to
  46−2√5; equivariance is not pointwise Galois invariance.
- The values lie in ℤ[ζ_N]: for N = 5, 46 + 2√5 is an algebraic integer of ℚ(√5) ⊂ ℚ(ζ₅).

### Examples

For the unknot a₀ = 1 and a_n = 0 for n ≥ 1, so J(V_n) = {n+1}/{1} = [n+1] and the reduced value is 1.
For the figure-eight knot a_n = 1 for all n, so its unified Kashaev invariant is Σ_n
(q;q)_n(q⁻¹;q⁻¹)_n, and at q = e^(2πi/N) the n-th term is |(ζ;ζ)_n|²; summing for N = 1, …, 6 gives
1, 5, 13, 27, 46 + 2√5, 89. The order-two value 5 is the determinant of 4₁. P₁ = V₁ − v − v⁻¹ has
quantum dimension 0, as every P_n with n ≥ 1 has.

### Dependencies

Layers 0–1; HabiroCyclotomicCompletions Layers 1–3; Mathlib `Polynomial.Chebyshev.S`;
GeometricTopology Layer 4 for the Jones polynomial comparison.

## Layer 3: the unified invariant of integral homology spheres

The twist elements ω± of the completed cyclotomic algebra encode (±1)-surgery on an unknotted
component: the twisting theorem turns surgery into insertion of ω^(−ε) as a colour. For an integral
homology sphere with an admissible presentation L, Habiro's unified invariant is J_M =
J_(L⁰)(ω^(−f₁), …, ω^(−f_m)), which converges in the Habiro ring by the divisibility theorem of
Layer 2 and is independent of the presentation by the refined Kirby calculus of Layer 0. It is
multiplicative under connected sum and turns orientation reversal into q ↦ q⁻¹.

### 3.1 The twist element in the completed cyclotomic algebra

In P̂ define ω±=Σ_(n≥0)(±1)^n v^(±n(n+3)/2)P′_n. In the P̃′_n basis the coefficients are integral:
q^(n(n+1)/2) for ω+ and (−1)^n q^(−n) for ω−. These satisfy ω+ω−=1. For the Hopf pairing with the
even representation subalgebra S_ℚ(v)=span{V_(2j)}, ⟨ω±,x⟩=J_(U±)(x). This characterization is only
on even colors, not every element of the full representation algebra. In particular ⟨ω±,V₀⟩=1.

*Construction.* Check integral coefficients after tilde rescaling and convergence in P̂. Use the
Hopf-link pairing formula on even colors to characterize ω±. Prove their product is 1 by pairing
with a separating family of even colors. ([Hab08] §9.1, Propositions 9.1–9.2, p. 33.)

*Needs:* §2.10, §2.2, §2.1.

The API:

- `omega`: omega is the twist element of the completed cyclotomic algebra, in the two sign variants.
- `pairing_omega`: The equality with the ±1-framed unknot pairing holds on S_ℚ(v), the even-color
  subalgebra.
- `omega_mul_inv`: The two twist elements are mutually inverse in the completed algebra.
- `omega_mem_completion`: The twist element lies in the completion of the cyclotomic algebra and not
  in the algebra itself.
- `omega_coeff`: The coefficients of the twist element in the cyclotomic basis are explicit Laurent
  polynomials.

**Checks.**

- `pairing_omega_V0`: ⟨ω±,V₀⟩=1.
- `omega_plus_mul_omega_minus`: The product of the two twist elements is 1, which is the algebraic
  shadow of blowing up and then blowing down.
- `omega_not_finite`: The twist element has infinitely many non-zero cyclotomic coefficients, so it
  is not an element of the uncompleted algebra.
- The pairing is with the normalised even colours V′_(2k) = V_(2k)/[2k+1]; pairing with V₀ gives 1,
  the value of the (±1)-framed unknot coloured by the trivial module.
- ω₊ = ω and ω₋ = ω⁻¹; the surgery formula uses ω^(−f) for a component of framing f.

### 3.2 Twisting theorem: surgery along a unit-framed unknotted component

For algebraically split zero-framed L=L₁∪⋯∪L_m∪K with K unknotted and colors x_i∈P̂, surgery of sign
ε=±1 along K satisfies J_(L_(K,ε))(x₁,…,x_m)=J_L(x₁,…,x_m,ω^(−ε)). The remaining link stays
zero-framed in this algebraically split setting; the opposite exponent is essential.

*Proof sketch.* Use the paired-strand local twist formula and the even-color pairing of ω. Track the
convention that ±1 surgery gives a ∓1 geometric full twist. Extend from finite colors by the
continuous P̂ multilinear invariant. ([Hab08] Theorem 9.4, §9.2, p. 34.)

*Needs:* §3.1, §2.12, §0.5.

**Checks.**

- With no remaining components, surgery on the isolated ±1-framed unknot gives S³ and the formula
  specializes to J_U(ω^(−ε))=1.
- Applying the theorem twice with opposite signs returns the original invariant, matching that the
  two twist elements are inverse.
- The identity is an identity in the completed algebra and requires the divisibility theorem for
  convergence.

### 3.3 The unified invariant of an integral homology sphere

For an integral homology sphere M with admissible presentation L of component framings f_i=±1, let
L⁰ be the underlying zero-framed link and set J_M=J_(L⁰)(ω^(−f₁),…,ω^(−f_m))∈ℤ[q]^. There is no
product of unknot denominators in this formula. Convergence comes from the continuous multilinear
extension of §2.12 for algebraically split 0-framed links, whose filtration generator at maximal
color index tends to zero in the Habiro topology. Empty surgery gives 1.

*Construction.* Choose an admissible presentation and erase its component framings. Insert the
inverse-sign twists in its finite approximants. Use the continuous P̂^m→Habiro map to define the
limit; normalize the empty link as 1. ([Hab08] §10.2, Theorem 10.2, p. 35.)

*Needs:* §3.2, §2.12, §0.3, §0.8, HabiroCyclotomicCompletions Layer 1 (the cyclotomic completion,
1.4).

The API:

- `unifiedInvariantOfPresentation`: The exact formula J_(L⁰)(ω^(−f_i)) in the Habiro ring, with no
  division.
- `unifiedInvariant_empty`: The empty admissible link gives the element 1.
- `summable`: The defining sum converges in the Habiro ring, by the divisibility theorem.
- `unifiedInvariant_mirror`: Reverse the orientation of the surgered 3-manifold by mirroring the
  surgery link and negating its framings: J_(−M)(q)=J_M(q⁻¹). Reversing component orientations alone
  is not this operation.

**Checks.**

- `unified_empty`: The empty presentation gives 1, so the invariant of the 3-sphere is 1.
- `unified_unknot_pm_one`: The plus-one-framed unknot also presents the 3-sphere and must give 1;
  this is the first non-trivial instance of independence.
- `unified_converges`: The defining sum has terms divisible by higher and higher q-shifted
  factorials, so it converges in the Habiro ring; a formula without that divisibility would not
  define an element.
- The completion provides limits for the infinite series; individual invariants may already be
  Laurent polynomials, as J_(S³)=1 shows.
- The construction is made only for admissible presentations; for an arbitrary framed link neither
  the formula nor its convergence is claimed.

### 3.4 The unified invariant does not depend on the admissible presentation

For an integral homology sphere M the element of the Habiro ring defined by the surgery formula does
not depend on the choice of admissible framed link presenting M. Hence the assignment of that
element to M is an invariant of integral homology spheres with values in the Habiro ring.

*Hypotheses.* M is an integral homology sphere; the presentations compared are admissible.

*Proof sketch.* By the refined Kirby calculus any two admissible presentations of M are related by
isotopies and Hoste moves. Check invariance of the surgery formula under an isotopy, which is
immediate from invariance of the coloured invariant. Check invariance under a single Hoste move,
using the twisting theorem to compare the two sides. Conclude by induction along the sequence of
moves. ([Hab08] Theorem 10.2, §10.2, p. 35; refined calculus in §10.1, pp. 34–35.)

*Needs:* §3.3, §0.7, §3.2.

**Checks.**

- The empty link and the plus-one-framed unknot both give 1, matching that both present the
  3-sphere.
- The proof uses the refined calculus and not the classical one, since the intermediate links of a
  classical sequence need not be admissible.
- The invariant of a connected sum is the product of the invariants, which is a consistency check on
  the normalisation.

### 3.5 First divisibility of the unified invariant

For every integral homology sphere M, J_M − 1 is divisible in the Habiro ring by (q² − 1)(q³ − 1)/(q
− 1) = (q + 1)(q³ − 1).

*Hypotheses.* M is an integral homology sphere.

*Proof sketch.* Expand the surgery formula and isolate the constant term, which is 1. Bound the
remaining terms by the divisibility theorem for algebraically split 0-framed links with colours in
the first filtration step. Combine the resulting factors and identify the product as the displayed
one. ([Hab08] Lemma 10.3, §10.3, p. 36; stronger Proposition 12.14, §12.4.2, p. 44.)

*Needs:* §3.4, §2.12.

*Lean:* `firstDivisor`.

**Checks.**

- For the 3-sphere the statement is trivial, since the difference is 0.
- Expanding the divisor at q=1 begins with 6(q−1), hence the coefficient of q−1 in J_M−1 is
  divisible by 6. Integrality of all Taylor coefficients instead follows from the integral Habiro
  Taylor map.
- The divisor is exactly that of [Hab08] Lemma 10.3. The stronger divisibility of [Hab08]
  Proposition 12.14 needs an additional input from the order-six WRT invariant and is not claimed
  here.

### 3.6 Multiplicativity under connected sum and behaviour under orientation reversal

J_(M♯M′) = J_M J_(M′) and J_(S³) = 1. Reversing the orientation replaces J_M by its image under the
involution q ↦ q⁻¹ of the Habiro ring: J_(−M)(q) = J_M(q⁻¹).

*Hypotheses.* M and M′ are integral homology spheres.

*Proof sketch.* Present the connected sum by the split union of admissible presentations of the two
summands. Use multiplicativity of the coloured invariant on split unions to factor the surgery
formula. For orientation reversal, take the mirror image of the presentation and track the effect on
the twist elements and on the coloured invariant. Identify the result with the ring involution of
the Habiro ring. ([Hab08] Proposition 12.1, §12.1, p. 39, with the misprint listed as correction 2
under Corrections to the sources.)

*Needs:* §3.4, GeometricTopology Layer 1, HabiroCyclotomicCompletions Layer 1 (the cyclotomic
completion, 1.4).

**Checks.**

- The invariant of the 3-sphere is 1, which is the empty case of multiplicativity.
- The invariant of the connected sum of a manifold with its own orientation reversal is the norm of
  the invariant under the involution.
- An invariant that failed multiplicativity would not evaluate to the Witten-Reshetikhin-Turaev
  invariants, which are multiplicative.

### Examples

J_(S³) = 1, from the empty presentation and, independently, from the (+1)-framed unknot, which the
twisting theorem reduces to J_U(ω⁻¹) = ⟨ω⁻¹, V₀⟩ = 1. In the P̃′ basis the coefficients of ω₊ are
q^(n(n+1)/2) and those of ω₋ are (−1)ⁿq⁻ⁿ. For every integral homology sphere J_M − 1 is divisible
by (q² − 1)(q³ − 1)/(q − 1), whose expansion at q = 1 starts with 6(q − 1).

### Dependencies

Layers 0–2; HabiroCyclotomicCompletions Layer 1; GeometricTopology Layer 1.

## Layer 4: root evaluations, the Ohtsuki series and general Lie type

The Witten–Reshetikhin–Turaev invariant at a root of unity is defined by surgery with the sl₂ Kirby
colour Ω_r, normalised by Gauss sums. Habiro's evaluation theorem identifies it with the value of
J_M at that root, for every root of unity, so the invariants are cyclotomic integers, Galois
equivariant, and determined by J_M, which in turn they determine through the injectivity theorems of
HabiroCyclotomicCompletions Layer 4; the Taylor expansion of J_M at q = 1 is the Ohtsuki series. The
second half of the layer carries this to every simple Lie algebra: the Habiro–Lê parity grading and
integral core filtration, strong Kirby colours at admissible roots, and the unique unified invariant
whose admissible root values are the conventional ones.

### 4.1 sl₂ Kirby color

For the primitive 4r-th root ξ, r≥2, Ω_r=Σ_(i=0)^(r−2)[i+1]V_i is the sl₂ Kirby color. Its
specialized link evaluations satisfy the handle-slide identity, and its ±1-unknot values are nonzero
quadratic Gauss sums. The admissible range r−2 and the choice q^(1/4)=ξ are retained together;
specializing an infinite generic representation sum is not this construction.

*Construction.* Evaluate the finite pivotal color sum in the semisimple sl₂ quotient. Use
fusion/orthogonality to prove the slide identity. Compute the two Gauss values, with their root
lift, to prove nonvanishing. ([Hab08] §11.1, pp. 36–37, colors and nonzero unknot normalizations.)

*Needs:* §2.1, §2.2, §1.14, Mathlib `IsPrimitiveRoot`.

*Lean:* `kirbyColor`.

The API:

- `sl2KirbyColor`: The finite weighted color sum Ω_r.
- `sl2KirbyColor_handleSlide`: The colored surgery link value is unchanged by a handle slide.
- `sl2KirbyColor_gauss_ne_zero`: Both ±1 unknot values are nonzero at the specified lift.

**Checks.**

- `kirbyColor_r2`: At r=2 the color is V₀.
- `kirbyColor_r3`: At r=3 the labels are V₀ and V₁ with the quantum-dimension coefficients.
- `kirbyColor_no_top_weight`: The weight V_(r−1) is absent; its vanishing quantum dimension does not
  supply an extra simple color.

### 4.2 The Witten-Reshetikhin-Turaev invariant at a root of unity

For r≥2 choose ξ primitive of order 4r and ζ=ξ⁴. Evaluate q^(1/4) at ξ. Let
Ω_r=Σ_(i=0)^(r−2)[i+1]V_i and I_ζ(L)=ev_ξ J_L(Ω_r,…,Ω_r). For a surgery matrix with
positive/negative inertia σ± define τ_(ζ,ξ)(M)=I_ζ(L)/(I_ζ(U+)^σ+ I_ζ(U−)^σ−), with both Gauss
values nonzero. It is invariant under ordinary Kirby moves. For an integral homology sphere it is
independent of ξ and written τ_ζ(M); for general closed M retain ξ. At ζ=1, [Hab08] sets τ₁(M)=1 by
convention.

*Construction.* Use Ω_r’s root-level handle-slide identity. Check the two nonzero Gauss sums and use
the signature correction for ±1 stabilization. Descend through the imported surgery calculus; prove
lift-independence only for integral homology spheres. ([Hab08] §11.1, equation (11.2), pp. 36–37.)

*Needs:* §2.2, §1.14, §0.4, §4.1, Mathlib `IsPrimitiveRoot`.

The API:

- `wrtWithLift`: The normalized surgery quotient retaining ζ and ξ.
- `wrt`: the invariant of integral homology spheres after lift-independence, with the ζ=1
  convention.
- `wrt_sphere`: τ(S³)=1.
- `wrt_kirby_invariant`: Ω_r handles slides and the two Gauss factors cancel stabilizations.
- `wrt_connected_sum`: The normalized invariant is multiplicative under connected sum in the
  normalisation of [Hab08].

**Checks.**

- `wrt_sphere_one`: Empty surgery gives 1.
- `wrt_root_one`: At ζ=1 the invariant is 1 by the declared convention, including r=1.
- `wrt_stabilization_sign`: A split +1 unknot cancels the positive Gauss factor and a −1 unknot
  cancels the negative factor; interchanging the two fails this test.

### 4.3 Evaluation of the unified invariant at a root of unity

Let M be an integral homology sphere and ζ a root of unity of any order. Then ev_ζ(J_M) = τ_ζ(M):
the value of the unified invariant at ζ is the sl₂ Witten–Reshetikhin–Turaev invariant of M at ζ.

*Hypotheses.* M is an integral homology sphere; ζ is a root of unity, with no restriction on its
order.

*Proof sketch.* Evaluate the surgery formula for J_M at ζ, using that ev_ζ is a ring homomorphism
from the Habiro ring to ℤ[ζ]. Identify the evaluated twist elements with the finite Gauss sums
appearing in the state sum. Match the normalisations, using the auxiliary lemma on coloured
invariants with colours in the representation ring at the root. Conclude the equality for every root
of unity, without restriction on the order. ([Hab08] Theorem 11.1, §11.1, p. 36; proof in §11.3, pp.
37–38.)

*Needs:* §3.4, §4.2, HabiroCyclotomicCompletions Layer 3 (root evaluation, 3.1).

**Checks.**

- Both sides are 1 on the 3-sphere.
- The theorem holds for every root of unity, including those of even and of non-prime-power order,
  which the earlier literature had excluded.
- As a corollary the Witten–Reshetikhin–Turaev invariant of an integral homology sphere is an
  algebraic integer in the cyclotomic field, and the family is Galois equivariant.

### 4.4 Integrality and Galois equivariance of the quantum invariants

For every integral homology sphere M and every root of unity ζ, τ_ζ(M) lies in ℤ[ζ], and τ_(α(ζ))(M) =
α(τ_ζ(M)) for every automorphism α of ℚ(ζ).

*Hypotheses.* M is an integral homology sphere.

*Proof sketch.* Apply the evaluation theorem to write the invariant as the image of an element of
the Habiro ring. Observe that the Habiro ring has coefficients in the integers, so evaluation lands
in the ring of integers generated by the root. For equivariance, note that an automorphism of the
cyclotomic field commutes with evaluation of a fixed element of the Habiro ring. Conclude both
statements. ([Hab08] §1.3, pp. 3–4, integrality and Galois consequences.)

*Needs:* §4.3, HabiroCyclotomicCompletions Layer 3 (root evaluation, 3.1).

**Checks.**

- The invariant is an algebraic integer, not merely an algebraic number; this is a strictly stronger
  statement than the state sum gives directly.
- Galois equivariance relates the values at all primitive roots of the same order, so one value
  determines the others in that orbit.
- Outside the integral-homology-sphere domain these exact coefficient and root-lift conclusions
  require separately stated extension theorems. They are not asserted to fail for every rational
  homology sphere.

### 4.5 The unified invariant is determined by the family of quantum invariants

For an integral homology sphere M, the function ζ ↦ τ_ζ(M) on roots of unity and J_M determine each
other, by evaluation and the injectivity of evaluation on the Habiro ring. A subset Z of roots
suffices when it has a Habiro limit point: some root has prime-power-order ratio with infinitely
many members of Z. Over ℤ this is a sufficient injectivity condition; no converse is claimed for
arbitrary infinite sets without that property. A finite set cannot suffice for generic Habiro
elements: the product of its cyclotomic polynomials is a nonzero element killed by all its
evaluations. A single rootwise Taylor expansion also determines J_M.

*Proof sketch.* Transport the injectivity of HabiroCyclotomicCompletions Layer 4 along
ev_ζ(J_M)=τ_ζ(M). Use the exact limit-point condition, not Euclidean convergence of complex roots.
For the negative test use only the explicit finite cyclotomic-product kernel. ([Hab08] Proposition
1.1, §1.2, p. 3; Propositions 12.2–12.3, §12.2, pp. 39–40.)

*Needs:* §4.3, HabiroCyclotomicCompletions Layer 4 (evaluation injectivity, 4.4),
HabiroCyclotomicCompletions Layer 4 (rootwise Taylor rigidity, 4.3).

**Checks.**

- Two integral homology spheres with the same quantum invariants at all roots have the same unified
  invariant.
- A finite set of roots does not determine a generic Habiro element: the nonzero product of its
  cyclotomic polynomials evaluates to zero there. No noninjectivity assertion for arbitrary infinite
  sets is made.
- The statement is about the evaluation map on the Habiro ring, not about the manifolds, so it needs
  the ring-theoretic injectivity input.

### 4.6 Odd-prime evaluations determine an integral power series in q − 1

The homomorphism ℤ[[q−1]]→∏_(p odd prime)ℤ_p[ζ_p] obtained by convergent evaluation q=ζ_p is
injective. Consequently there is at most one integral formal series with a prescribed collection of
these values; for the WRT values such a series exists, namely the Taylor expansion of J_M at q = 1
(§4.7).

*Proof sketch.* For a series killed by every evaluation, induct on its first possible nonzero
coefficient x_n. Reduce modulo (ζ_p−1)^(n+1) to show p|x_n for every odd prime p. An integer
divisible by every odd prime is zero; repeat the induction. ([Hab08] Lemma 12.7, §12.3.2, p. 42.)

*Needs:* HabiroCyclotomicCompletions Layer 3 (p-adic re-expansion, 3.3).

### 4.7 The Taylor expansion at q = 1 is the Ohtsuki series

For an integral homology sphere M, the Taylor expansion of J_M at q = 1, an element of ℤ[[q−1]], is
the Ohtsuki series, characterized by its convergent p-adic evaluations equal to τ_ζ(M) at all odd
prime-power roots. The identity uses the re-expansion square of HabiroCyclotomicCompletions Layer 3
and the uniqueness lemma §4.6 for odd-prime evaluations of ℤ[[q−1]]. This is not convergence as a
complex analytic power series.

*Proof sketch.* Apply the re-expansion square at ζ of odd prime-power order. Substitute the WRT
evaluation theorem. Use the integral formal-series uniqueness characterization. ([Hab08] Theorem
12.6, §12.3.2, p. 41.)

*Needs:* §4.3, HabiroCyclotomicCompletions Layer 3 (the Taylor map, 3.1),
HabiroCyclotomicCompletions Layer 3 (p-adic re-expansion, 3.3), §4.6.

**Checks.**

- The constant term is 1, matching that the Ohtsuki series begins with 1.
- For S³ the series is exactly 1, so every positive-degree coefficient vanishes.
- By §3.5 the coefficient of q−1 is divisible by 6. The candidate series 1+(q−1)
  fails this necessary test for a homology-sphere Ohtsuki series.

### 4.8 Why the determination theorems do not transfer to other completions

The determination and integrality statements are over ℤ. Over ℚ the all-order cyclotomic completion
is a product of rootwise completions, so its Taylor map at one root is not injective. This roadmap
does not transfer integral rigidity, Galois and integrality statements, or coefficient results for
integral homology spheres, to localized, twisted or rational-homology-sphere completions without a
comparison theorem.

*Route.* Use the coefficient-sensitive statements of HabiroCyclotomicCompletions Layers 1 and 4.
Compare the domains before transporting WRT evaluation or Taylor rigidity. Use only the integral
target of the general core construction. ([Hab08] §1.2, pp. 2–3, integral cyclotomic completion.)

*Needs:* §4.4, HabiroCyclotomicCompletions Layer 4 (rootwise Taylor rigidity, 4.3),
HabiroCyclotomicCompletions Layer 1 (the cyclotomic completion, 1.4).

**Checks.**

- Over ℚ the element ∏ of finitely many cyclotomic polynomials becomes a unit at every root outside
  that finite set, and the rational completion splits as a product over orders, so a single rootwise
  Taylor map forgets all other components.

### 4.9 The domain of the invariant, and what a larger domain would require

Layer 3 defines J only for integral homology spheres. For the p-framed unknot with |p|>1, H₁≅ℤ/|p|
and its link is not admissible. Rational homology-sphere extensions require separate
localization/coefficient and surgery theorems; neither the integral target nor the present
convergence proof transfers automatically. Dependence on root lifts for general WRT manifolds is a
separate qualification, not an assertion that it persists for every non-integral example.

*Route.* Check the determinant obstruction in the explicit lens-space case. Separate the domain of
[Hab08] from that of the conventional WRT invariant. Extensions are separate coefficient theorems
outside this roadmap. ([Hab08] §16.3, pp. 62–63, rational homology spheres.)

*Needs:* §3.3, §0.2, §4.2.

**Checks.**

- The 2-framed unknot gives the lens space L(2,1) = ℝP³ with H₁ = ℤ/2, and its linking matrix (2) is
  not admissible.
- No target of this roadmap evaluates J outside integral homology spheres.

### 4.10 Quantum parity grading

G is generated by a central v̇ of order two, commuting K̇_α of order two and invertible ė_α, with
K̇_α ė_β=v̇^((α,β))ė_βK̇_α and ė_αė_β=v̇^((α,β))ė_βė_α. Its quotient by ⟨v̇⟩ is Y×Y/2Y. The
tensor grading amalgamates the central v̇ in all factors; G^⊗0=⟨v̇⟩. The generator degrees are
deg(v)=v̇, deg(K_±α)=K̇_α, deg(E_α)=v̇^(d_α)ė_α and deg(F_α)=ė_α⁻¹K̇_α. These define the grading
over ℂ(q); the even subalgebra is the sum over G^ev, and in terms of the symmetrised matrix B_ij=d_i
a_ij the commutation exponents are v̇^(B_ij). Since v²=q, multiplication by v exchanges the two
components of the scalar ring ℂ(q)[v]=ℂ(q)⊕vℂ(q), so each component is a ℂ(q)-module but not a
ℂ(v)-module. This carries integral square-root cancellation information unavailable from ordinary
Y-grading.

*Construction.* Present G with the central commutator relations. Check that the quantum relations
are homogeneous for the generator degrees of [HL] §6. Use the amalgamated tensor grading and
degree-one part in K_n. ([HL] §§6.1–6.3, pp. 68–70, noncommutative grading.)

*Needs:* §1.12.

The API:

- `QuantumParityGroup`: The central parity extension with the displayed presentation.
- `quantumParityDegree`: the G-degree of [HL] §6 on PBW generators.
- `tensorParityGroup`: G^⊗n with the central order-two elements identified.

**Checks.**

- `parity_v_square`: The degree of v²=q is 1.
- `parity_K_square`: The degree of K_α² is 1.
- `parity_tensor_zero`: G^⊗0 is the two-element central group, not a trivial group.
- The degree of v itself is the nonidentity central v̇. In type A₂, where (α₁,α₂)=−1,
  K̇_α₁ė_α₂=v̇ė_α₂K̇_α₁; replacing G by its abelian quotient loses this sign.

### 4.11 Integral core filtration

Let G be the Habiro–Le central parity extension of Y×Y/2Y, retaining its central element v̇ of order
two and tensor products over that element. On U_q, deg_G(v)=v̇, deg_G(K_α)=K̇_α, deg_G(E_α)=v̇^d_α
ė_α and deg_G(F_α)=ė_α⁻¹K̇_α; use the exact relations of [HL] §6 rather than an abelian root
grading. Set K_n=(X_ℤ^ev)^⊗n∩[(U_A^ev)^⊗n]_1, F_kK_n=(q;q)_k K_n and K̃_n its image completion
inside U_h completed⊗n. Then K₀ = ℤ[q±1] and K̃₀ = ℤ[q]^, the Habiro ring, and the family (K̃_n)
satisfies the two conditions of [HL] Theorem 2.29: (AL1) it contains 1, the universal invariant of
the Borromean bottom tangle in degree 3, is stable under tensor products and under the braided
structure maps ψ^(±1), μ, Δ and S; (AL2) every tensor product of twist forms T_(ε₁) ⊗ ⋯ ⊗ T_(εₙ)
maps K̃_n to K̃₀. Consequently J_T ∈ K̃_n for every bottom tangle with zero linking matrix.

*Construction.* Before (AL1), use the universal invariant J_T of a topological ribbon Hopf algebra,
§1.9, and its compatibility with finite-colour traces. Use the even core and degree-one intersection
to exclude unwanted square roots. Stability and the integral Borromean computation establish (AL1).
Twist images lie in Ã ∩ ℚ(q) = ℤ[q±1]; continuity gives (AL2) and K̃₀. ([HL] §§7.1–7.3, pp. 75–77,
Proposition 7.1 and Theorem 7.3; the conditions are those of Theorem 2.29, §2.16, pp. 34–35.)

*Needs:* §1.13, §1.9, HabiroCyclotomicCompletions Layer 1 (the cyclotomic completion, 1.4), §4.10,
§1.2, §1.6.

The API:

- `generalIntegralKn`: The displayed graded intersection K_n.
- `generalKnFiltration`: F_k=(q;q)_kK_n.
- `generalCompletedKn`: Image completion inside the h-adic ambient tensor power.
- `generalKn_twist`: The tensor product of sign twist forms maps K̃_n to the ordinary integral
  Habiro ring.

**Checks.**

- `generalKn_zero`: K₀ = ℤ[q±1] and K̃₀ = ℤ[q]^.
- `generalKn_degree_one`: An odd power of v alone has central degree v̇ and is excluded from K₀.
- `generalKn_filtration_vanishes`: At a q-root of order r, (q;q)_k vanishes for k≥r, compatible with
  the Habiro completion.

### 4.12 Highest-weight colours of U_h(g) and their quantum dimensions

For a dominant integral weight λ of the simple Lie algebra g, let V_λ be the finite-rank
topologically free highest-weight module of U_h(g) (§1.12) deforming the classical irreducible
module L(λ) of LieHighestWeight Layer 3; its rank is dim L(λ) and its character is given by the Weyl
character formula (LieHighestWeight Layer 6). The quantum trace of x ∈ U_h(g) on V_λ is Tr(ρ_λ(g
x)), with g the pivotal element of §1.2 (K⁻¹ for sl₂), and the quantum dimension is the quantum Weyl
dimension formula

```text
qdim V_λ = ∏_{α > 0} [⟨λ + ρ, α∨⟩]_{v_α} / [⟨ρ, α∨⟩]_{v_α},   v_α = v^{d_α},
```

with [n]_t = (tⁿ − t⁻ⁿ)/(t − t⁻¹). The tensor product of colours decomposes as in the classical
case, so the colours span a ring, the representation ring of U_h(g), isomorphic to the classical
one.

*Construction.* Construct V_λ as a quotient of the quantum Verma module and show it is a deformation
of L(λ); compute the trace of the pivotal element weight space by weight space and apply the Weyl
denominator identity. The denominator does not vanish at a root of unity ξ with ord ξ > d(h∨ − 1),
the bound used in §4.13. ([HL] §3.1, pp. 36–37, for U_h(g); §8.2, pp. 90–91, for finite-rank modules
and their Grothendieck ring; §8.3.1, equation (177), p. 91, for the quantum dimension, written there
as q^(−(λ,ρ)) ∏_(α>0) (q^((λ+ρ,α)) − 1)/(q^((ρ,α)) − 1), which is the balanced form above.)

*Needs:* §1.12, §1.2, LieHighestWeight Layer 3, LieHighestWeight Layer 6.

The API:

- `highestWeightColor`: V_λ for dominant integral λ.
- `highestWeightColor_rank`: its rank is dim L(λ).
- `quantumDimension_eq`: the quantum Weyl dimension formula.
- `colorRing`: the ring spanned by the V_λ, with the classical tensor product rule.

**Checks.**

- `qdim_trivial`: V₀ has quantum dimension 1.
- `qdim_sl2`: for g = sl₂, V_n has quantum dimension [n+1], agreeing with §2.1.
- `qdim_classical_limit`: at v = 1 the quantum dimension is the classical Weyl dimension of
  LieHighestWeight Layer 6; for sl₃ and λ = ω₁ it is [3] = v² + 1 + v⁻², which specialises to 3.

### 4.13 Strong Kirby colors

For g, let D=|X/Y|, d=d_max, r=ord ξ, and choose ζ with ζ^(2D)=ξ (ζ evaluates v^(1/D)). The
half-open weight box P_ζ consists of λ=Σ k_iω_i, 0≤k_i<2rD. Ω^g_ζ=Σ_(λ∈Pζ)qdim(V_λ)V_λ; Ω^(Pg)_ζ
restricts λ to Y. A strong Kirby colour satisfies the strong handle-slide condition of [HL] §8.4,
nonzero ±1 Gauss values, and r>d(h∨−1). Define Z′_g,Z′_Pg as admissible lifts, and Z_g,Z_Pg as their
images ξ. Odd r supplies projective admissibility and even r supplies full admissibility under that
bound; individual lifts with the same ξ can differ. No semisimplicity at all these roots is
asserted.

*Construction.* Construct the finite weight box in the weight lattice. Use the finite highest-weight
colours and traces of [HL] §§3 and 8.2, then the strong sliding identities of [HL] §8.4. The colours
and traces are those of §4.12, not the rank-one coloured Jones construction. Check the nonzero Gauss
sums before taking the root image; use the complement of the vanishing table of [HL] Appendix C, as
corrected. ([HL] §§8.4–8.5, pp. 92–94; Appendix C, pp. 112–117, with the correction to Corollaries
C.6 and C.8 listed under Corrections to the sources.)

*Needs:* §1.12, §4.12, Mathlib `IsPrimitiveRoot`, §1.7, §1.2.

The API:

- `StrongKirbyColor`: The finite color with root bound, sliding condition and nonzero Gauss factors.
- `admissibleRootLifts`: Z′_g and Z′_Pg retain the root lift ζ.
- `admissibleQRoots`: Images under ζ↦ζ^(2D).

**Checks.**

- `kirby_root_bound`: A root with r≤d(h∨−1) does not meet the declared strong-color bound.
- `kirby_gauss_vanishing_Aodd`: For A_ℓ, ℓ odd, ord ζ≡2 mod4 gives a vanishing full Gauss sum, so
  this lift is excluded.
- `kirby_root_one_convention`: At ξ=1 τ is defined as 1 separately; the strong-color root bound does
  not silently include it.

### 4.14 What specialising at a root of unity does and does not give

Keep three settings distinct: generic h-adic finite free modules; integral PBW forms and their image
completions; and specialized tilting modules at a specified root. The last category is not
generically semisimple. Negligibility means every composite endomorphism has zero quantum trace, not
merely that an arbitrary object has zero quantum dimension. The negligible quotient and its allowed
alcove are separate constructions. Modularity needs extra root/type restrictions; the strong Kirby
colours of §4.13 do not give a modular category at every admissible root.

*Route.* Use the definitions of specialised tilting modules and negligible morphisms of §1.14.
Separate integral maps from base change to a field. Apply only Sawin’s stated root bounds and
modularity restrictions. ([Saw] §4, pp. 18–22, tilting modules; §6, Theorem 5, pp. 24–26, negligible
quotient.)

*Needs:* §1.3, §1.14, §4.13.

**Checks.**

- At r = 3 the specialised sl₂ module V₂ is simple and tilting, but its quantum dimension [3]
  vanishes there, so its identity is negligible; only V₀ and V₁ survive the quotient.
- In the finite-free category over ℤ[v±1], multiplication by 2 on its rank-one trivial module is
  monic and epic in that category and is not invertible. Full rank therefore does not justify
  importing abelian semisimplicity before base change to the specified field.

### 4.15 General Lie-type WRT comparison

At each ξ∈Z_g or Z_Pg, choose a corresponding strong Kirby lift ζ. On surgery presentations of
integral homology spheres the normalised finite colour quotient using Ω^g_ζ or Ω^(Pg)_ζ is
independent of the admissible lift and equals ev_ξ J_M^g. The quotient divides by separate
J_(U+)(Ω)^σ+ and J_(U−)(Ω)^σ−, both nonzero. Equality outside these admissible sets is not claimed
for an existing conventional RT invariant.

*Proof sketch.* Approximate the integral core twists in the cyclotomic filtration. Use the
root-annihilating ideals and the specialized quantum traces to compare with the finite strong Kirby
colors. Cancel the distinct sign Gauss factors and prove lift-independence on presentations of
integral homology spheres. ([HL] Theorem 8.8, §8.5, p. 94; comparison to Theorem 8.1, p. 90.)

*Needs:* §4.13, §4.11, §0.7, HabiroCyclotomicCompletions Layer 3 (root evaluation, 3.1).

### 4.16 The same theorem for every simple Lie algebra, with the restrictions it carries

For each finite-dimensional simple complex g there is a unique invariant J_M^g∈ℤ[q]^ of oriented
integral homology spheres such that ev_ξ J_M^g=τ_M^g(ξ) for ξ∈Z_g and ev_ξ J_M^g=τ_M^(Pg)(ξ) for
ξ∈Z_Pg. At any other root evaluation remains defined; using it to extend the conventional invariant
is a definition. At ξ=1 it is 1. Uniqueness and rootwise Taylor determination use the integral
Habiro rigidity theorem. The construction uses the concrete integral core and its degree-one K_n
filtration, not only an unspecified abstract core.

*Proof sketch.* Build the surgery formula of §1.11, inserting the twist forms T_(f_i) on an
admissible presentation; it is invariant under Hoste moves. Apply conditions (AL1) and (AL2) of
§4.11 to place it in K̃₀ = ℤ[q]^. Use the admissible WRT comparison and an injective infinite family
of root evaluations for uniqueness. ([HL] Theorem 8.1, §8.1, p. 90; Theorem 8.8, §8.5, p. 94.)

*Needs:* §4.11, §4.15, §0.8, HabiroCyclotomicCompletions Layer 4 (evaluation injectivity, 4.4),
HabiroCyclotomicCompletions Layer 4 (rootwise Taylor rigidity, 4.3).

**Checks.**

- For g = sl₂ the invariant is Habiro's J_M of §3.3 ([HL] §1.3, p. 7), and the theorem agrees with
  §4.3.
- Evaluation at roots outside Z_g∪Z_Pg defines an extension of the root-value function; it is not
  asserted to be analytic continuation.
- At ξ = 1 the value is 1 for every integral homology sphere ([HL] Proposition 1.6).

### Examples

At r = 2 the Kirby colour is V₀ and at r = 3 it is V₀ + [2]V₁. τ_ζ(S³) = 1 at every root, and τ₁ = 1
by convention. The Ohtsuki series has constant term 1, and for S³ it equals 1. A finite
set of roots never determines a general element of the Habiro ring: the product of the corresponding
cyclotomic polynomials is nonzero and has value 0 at all of them.

### Dependencies

Layers 0–3; HabiroCyclotomicCompletions Layers 1, 3 and 4; Mathlib `IsPrimitiveRoot`;
LieHighestWeight Layers 3 and 6.

## Layer 5: ideal triangulations, flattenings and the extended Bloch class

A cusped hyperbolic 3-manifold is glued from ideal tetrahedra whose shapes solve the gluing and
completeness equations; the volume is the sum of the Bloch–Wigner values of the shapes. Neumann
lifts the shapes to a ℤ²-cover of ℂ ∖ {0, 1} using flattenings, defines the extended pre-Bloch group
P̂(ℂ) by lifted five-term and transfer relations and its extended Bloch subgroup B̂(ℂ), and shows
that a strong flattening of an ordered triangulation gives a class β̂(M) ∈ B̂(ℂ) depending only on
M, whose extended Rogers regulator is i(Vol + i CS) modulo π². This layer plans those objects, the
cusped geometric inputs they need, and the comparison with number-field Bloch groups. It does not
depend on Layers 0–4.

### 5.1 Oriented ideal tetrahedra and their shape parameters

An ordered ideal tetrahedron in the upper half-space model of hyperbolic 3-space (with the
hyperbolic metric of GeometricTopology Layer 7) has four distinct vertices on ℂ ∪ {∞}; its shape is
their cross-ratio z ∈ ℂ ∖ {0,1}, normalised so that the vertices (0, ∞, 1, z) have shape z. Its
companions are z′=1/(1−z), z″=1−1/z and zz′z″=−1. Im z>0 is positive orientation; real nondegenerate
shapes are flat and may occur in refinement arguments. The metric carrier is supplied in the
boundaries. Its realization with ideal boundary ℂ ∪ {∞}, the PSL₂(ℂ) action and finite-volume
geodesic ideal regions require the additional geometric supplier contract stated there.
Four complex vertices and their cross-ratio alone do not establish that realization.

*Construction.* Use the ordered vertices and the Möbius normalisation. Compute the companion
coordinate changes and orientation sign. Flat nondegenerate simplices are kept, since the
refinements of §5.2 may contain them. ([Neu] §3, pp. 420–421 (PDF pp. 8–9), ideal simplex
parameters.)

*Needs:* Mathlib `Complex.log`, GeometricTopology Layer 7 and the ideal-boundary geometric
supplier contract preceding Polylogarithms P.2. The latter is an unresolved prerequisite.

*Lean:* `shapePrime`, `shapeDoublePrime`, `shape_mul_shapePrime_mul_shapeDoublePrime`.

The API:

- `IdealTetrahedron`: An ordered oriented ideal tetrahedron, determined by its shape parameter in
  the complement of 0 and 1.
- `shape`: shape T is the cross-ratio of the four ideal vertices in the chosen order.
- `shape_companions`: The three edge parameters are z, 1/(1-z) and 1-1/z, and their product is minus 1.
- `isometry_iff_shape_eq`: Two ordered ideal tetrahedra are orientation-preserving isometric if and
  only if their shapes agree.
- `positively_oriented`: A tetrahedron is positively oriented exactly when the imaginary part of its
  shape is positive.

**Checks.**

- `shape_regular`: The regular ideal tetrahedron has shape the primitive sixth root of unity; a
  convention giving a different value is a different cross-ratio ordering.
- `shape_product`: The product of the three edge parameters is minus 1, not 1; this pins the
  convention.
- `shape_excludes_degenerate`: Shapes 0 and 1 are excluded, so a degenerate configuration is not an
  ideal tetrahedron.
- An even permutation of the vertices permutes the three parameters cyclically, and an odd one
  inverts them.

### 5.2 Cusped hyperbolic 3-manifolds, ideal triangulations and their rigidity

The additional cusp geometry uses the metric carrier specified in the boundaries; the rigidity
theorem here includes torus cusps. Throughout, M is the interior of a compact
connected oriented 3-manifold whose
boundary is a nonempty union of tori.

- `IdealTriangulation`: a finite set of ordered tetrahedra with orientation-reversing,
  order-compatible face pairings whose quotient, with the vertices removed, is homeomorphic to M;
  the links of the removed vertices are triangulated tori, the cusp triangulations, and a peripheral
  curve is a closed normal path in a cusp triangulation. A matrix equation alone is not this datum.
- `cuspEnds_parabolic`: for a complete finite-volume metric on M, each end has a cusp
  neighbourhood T² × [0, ∞) with rank-two parabolic holonomy. This adds the end classification to
  the existing metric carrier.
- `gluing_theorem` (Thurston): if shapes z_j with Im z_j > 0 satisfy the edge equations of §5.3 in
  logarithmic form and the completeness equations at every cusp, then the developing map of the
  tetrahedra is a local isometry onto hyperbolic space, the structure on M is complete of finite
  volume, and each tetrahedron is isometric to the geometric ideal tetrahedron with its shape.
- `mostow_prasad`: an isomorphism of fundamental groups of two complete finite-volume hyperbolic
  3-manifolds is induced, up to inner conjugation, by an isometry. It can reverse orientation.
  `mostow_prasad_oriented` adds an orientation-preserving homotopy equivalence and concludes an
  orientation-preserving isometry in that homotopy class. Unsigned volume and the invariant trace
  field are invariants without that extra orientation data; the complex regulator and geometric
  PSL₂(ℂ)-representation up to conjugation use the oriented conclusion.
- `epstein_penner`: M has a canonical decomposition into convex ideal polyhedra, depending only on a
  choice of cusp neighbourhood volumes up to common scaling (no relative choice for one cusp).
  A `RegularEPRefinement` triangulates each convex cell by a regular subdivision induced by
  vertex heights, using no new ideal vertices, with compatible shared-face subdivisions; the
  auxiliary flat tetrahedra needed between adjacent cells are part of the refinement datum.
  `regularEPRefinement_connected` relates such regular refinements by 2–3 moves through their
  regular refinement class, permitting flat tetrahedra with nondegenerate shape. It does not
  assert connectivity of arbitrary triangulations of a convex 3-polytope.
- `geometricSolution_nondegenerate`: for those refinements and the discrete-faithful complete
  solution, choose independent edge equations and one peripheral equation per cusp as in [GSW]
  §2.2; the resulting square gluing Jacobian has nonzero determinant. With a quad choice having
  det B≠0, this gives det Λ≠0 for §6.1.
- `ordered_hybrid_refinement`: M admits an ordered triangulation mixing ideal and finite vertices,
  compatible with the face orderings, as required by the extended Bloch class of §5.9.

*Proof sketch.* The gluing theorem is a developing-map argument: the edge equations make the
structure hyperbolic around each edge, and the completeness equations make the holonomy of each cusp
torus parabolic, hence complete. Mostow–Prasad rigidity extends Mostow's closed-manifold theorem
(GeometricTopology Layer 7) to finite volume. The Epstein–Penner decomposition is the convex hull
construction in Minkowski space. ([GSW] §2.2, equations (14)–(15), pp. 6–7, and §2.3, pp. 8–9, where
these inputs are stated with their hypotheses; [Neu] §14, pp. 464–465 (PDF pp. 52–53) and Theorem
14.2, p. 465, for ordered hybrid refinements; [Thu] §§4.2 and 4.4, pp. 48–50 and 54–56, for
the gluing and completeness argument; [Pra73] Theorems A–B, p. 256, for finite-volume rigidity;
the convex-decomposition proof is [EP88].)

*Needs:* GeometricTopology Layer 7, GeometricTopology Layer 11, §5.1, AlgebraicTopology Stage 3.

**Checks.**

- The figure-eight knot complement has a two-tetrahedron ideal triangulation whose geometric
  solution has both shapes e^(πi/3); its volume is 2·D(e^(πi/3)) = 2.0298832…
- A solution of the edge equations alone with a cusp holonomy w ↦ 2w (multiplier 2) is an incomplete
  structure, so the completeness equations are not redundant.
- The trefoil complement has no complete hyperbolic structure, since its fundamental group has
  nontrivial centre; the gluing theorem never applies to it.
- Reversing orientation keeps unsigned volume positive but negates the signed fundamental class
  and R(β̂(M)); it conjugates the geometric representation. An arbitrary group isomorphism cannot
  be used to conclude equality of the oriented complex volumes.
- A refinement without a height witness is not certified regular. In particular the connectivity
  theorem cannot be applied merely because all its tetrahedra use vertices of the convex cells.
- A single ideal tetrahedron admits its empty-height regular subdivision. A subdivision with a
  new interior vertex fails the vertex requirement, even if it is geometrically well behaved.
- A flat shape 2 is nondegenerate, while shape 1 is degenerate. Permitting zero volume in regular
  refinement paths does not permit the latter.

### 5.3 Gluing and completeness equations of an ideal triangulation

For an ideal triangulation (§5.2) of the interior of a compact oriented 3-manifold with torus
boundary, shapes give edge products and peripheral products from the incidence data. A positive
geometric solution has every z_j in the upper half-plane, each edge product 1 with total dihedral
angle 2π, and peripheral similarity multiplier 1 for both generators of each cusp
(parabolic/unipotent cusp holonomy in the developing representation, whose translational part is
generally nontrivial). Edge products alone are insufficient. Geometric realisation of a positive
solution, the existence of ideal triangulations and finite-volume rigidity are the targets of §5.2.
A matrix equation alone is called linear gluing data, not an ideal triangulation.

*Construction.* Take the face pairings, cusp triangulations and peripheral curves from the
triangulation. Extract shape incidences and logarithmic angle equations. Use the developing-map and
completeness theorem of §5.2; then compute the signed volume of each simplex with the tetrahedron
volume formula of Polylogarithms P.2. ([GSW] §2.2, equations (14)–(15), pp. 6–7, edge/peripheral
equations; §2.3, pp. 8–9, regular geometric triangulations.)

*Needs:* §5.1, §5.2, GeometricTopology Layer 7, Polylogarithms P.2.

The API:

- `ShapeSolution`: an ideal triangulation of §5.2 with nondegenerate shapes satisfying all edge and
  completeness equations; an arbitrary matrix equation is not this datum.
- `edgeEquation`: At each edge, the product of the incident edge parameters is 1 and the sum of
  their logarithms is 2πi.
- `cuspEquation`: At each cusp, each generator has similarity multiplier 1; its parabolic
  translation need not vanish.
- `isGeometricSolution`: The conjunction includes positive shapes, edge angle equations and both
  peripheral completeness equations.
- `volume_eq_sum`: The volume of the structure is the sum of the volumes of its tetrahedra.

**Checks.**

- `figure_eight_solution`: The two-tetrahedron triangulation of the figure-eight knot complement has
  the solution with both shapes the primitive sixth root of unity; this is the running example.
- `edge_equation_log_form`: The logarithmic edge equation fixes the branch: the product form alone
  does not, and the two differ by multiples of 2πi.
- `not_geometric_of_negative_imaginary`: A solution with a shape of negative imaginary part is not
  geometric, so the positivity condition is not redundant.
- `complete_cusp_nonidentity_translation`: The map w↦w+1 is a nonidentity parabolic with multiplier 1.
  Completeness may admit this holonomy; a test requiring the identity transformation rejects a
  complete cusp.
- Signed or flat refinement triangulations of a complete oriented manifold are outside this
  positivity test and are not ruled out by it.
- The volume of the resulting structure is the sum of the volumes of the ideal tetrahedra, which is
  the identity the regulator comparison uses.

### 5.4 Combinatorial flattenings and the extended pre-Bloch group

On Neumann’s cut-plane ℤ²-cover of ℂ∖{0,1}, a point (z;p,q) determines (w₀,w₁,w₂)=(log
z+pπi,−log(1−z)+qπi,log(1−z)−log z−(p+q)πi). Their sum is zero. Crossing the negative-real cut
changes p by 2 and crossing the >1 cut changes q by 2; the cover has four parity components. The
triple determines the point of the cover using both w₀ and w₁, not w₀ alone. Strong flattenings of
triangulations impose additional parity and normal-path conditions, planned in §5.8.

*Construction.* Construct the cut cover with its boundary-side identifications. Define the log
parameters and compare the three-edge convention. Recover z from e^w₀ and e^(−w₁) up to sign
simultaneously, then recover the sheet. ([Neu] Definition 3.1 and Lemma 3.2, §3, pp. 421–422 (PDF
pp. 9–10).)

*Needs:* §5.1, Mathlib `Complex.log`.

*Lean:* `flattening`, `flattening_sum`.

The API:

- `Flattening`: A point on the cut ℤ²-cover and its log parameters.
- `flattening_sum_zero`: w₀+w₁+w₂=0.
- `flatteningEquiv`: The cover is in bijection with combinatorial flattening triples.
- `flattening_cover_transition`: Cut transitions shift p or q by two, preserving the appropriate
  logarithmic parameters.

**Checks.**

- `flattening_zero_zero`: On the chosen cut-plane chart p=q=0 gives (log z,−log(1−z),log(1−z)−log
  z).
- `flattening_determines_shape`: Equality of the full w-triples determines z; equality of w₀ alone
  is insufficient.
- `flattening_regular`: For z=exp(πi/3) and p=q=0 the log parameters are (πi/3,πi/3,−2πi/3), summing
  to zero.

### 5.5 Extended pre-Bloch group

Let FT be the five-shape locus (x,y,y/x,(1−1/x)/(1−1/y),(1−x)/(1−y)), x,y∉{0,1},x≠y. In the fivefold
Neumann cover, choose the component FT̂₀ containing the all-principal lifts when all five shapes are
in the upper half-plane; put FT̂=FT̂₀+V, where V consists of sheet pairs
((p₀,q₀),(p₁,q₁),(p₁−p₀,q₂),(p₁−p₀+q₁−q₀,q₂−q₁),(q₁−q₀,q₂−q₁−p₀)). P̂(ℂ) is the free abelian group
on the cover modulo the alternating lifted five-term relations and
[z;p,q]+[z;p′,q′]=[z;p,q′]+[z;p′,q]. The second relation is the transfer relation; omitting it
retains an extra ℤ/2.

*Construction.* Use the distinguished lifted component and the explicit integer sublattice V. Form
the relation subgroup generated by both families, then take its quotient. Forgetting sheets descends
to the pre-Bloch group P(ℂ) of K3BlochGroups V.3; track the torsion that the transfer relation
kills. ([Neu] Definition 2.2, §2, pp. 417–418 (PDF pp. 5–6).)

*Needs:* §5.4, K3BlochGroups V.3 (pre bloch group).

The API:

- `LiftedFiveTerm`: Membership in FT̂₀+V, not every unrestricted tuple of lifts.
- `transferRelation`: The four-term sheet interchange relation.
- `extendedPreBloch`: The quotient by lifted five-term and transfer relations.
- `forget`: The homomorphism forgetting sheet coordinates to P(ℂ).

**Checks.**

- `lifted_five_term_general`: Forgetting a permitted lifted relation gives the ordinary five-term
  relation.
- `transfer_zero`: [z;1,1]+[z;0,0]−[z;1,0]−[z;0,1]=0 in this quotient.
- `lift_sheet_constraint`: For shapes in FT⁺, arbitrary sheet choices violating p₂=p₁−p₀ are not the
  specified lifted relation.

### 5.6 Extended Bloch group

The homomorphism ν:P̂(ℂ)→ℂ∧_ℤℂ is ν[z;p,q]=(log z+pπi)∧(−log(1−z)+qπi). Define B̂(ℂ)=ker ν, a
subgroup of P̂. Forgetting gives the Neumann ordinary Bloch convention ker([z]↦2z∧(1−z)); its
comparison with the antisymmetric-tensor and exterior-kernel conventions of K3BlochGroups V.3 must
use the comparison maps there, not an integral equality of all those groups.

*Construction.* Verify ν kills transfer relations bilinearly and the permitted five-term relation
using the sheet lattice V. Take the kernel subgroup. Track the forgetful boundary and Neumann’s
factor-two convention before applying a K₃ regulator comparison. ([Neu] Lemma 2.3 and Definition
2.4, §2, p. 418 (PDF p. 6).)

*Needs:* §5.5, K3BlochGroups V.3 (exterior kernel bloch group), K3BlochGroups V.4 (suslin exact
sequence).

*Lean:* `extendedDehnGen`, `extendedDehn`, `transferElement`, `extendedDehn_transferElement`.

The API:

- `extendedDehn`: The displayed logarithmic wedge homomorphism.
- `extendedBloch`: Its kernel subgroup.
- `extendedBloch_forget`: Forgetting gives an ordinary Bloch class in the explicitly stated
  convention.

**Checks.**

- `extendedBloch_zero`: The zero class is in the kernel.
- `extendedDehn_transfer`: The four sheet-interchange terms have wedge sum zero.
- `extendedDehn_sheet_change`: Changing p by 1 changes ν by πi∧(−log(1−z)+qπi); individual
  generators are not automatically in the kernel.
- At z=1/2 and q=0 that difference is πi∧log 2, which is nonzero because πi and log 2
  are linearly independent over ℚ. This detects a boundary map that forgets the p sheet.

### 5.7 The flattening condition makes a two-three move an instance of the lifted five-term relation

For five distinct ideal vertices, the alternating lifted five-shape relation is permitted iff the
alternating sum of log parameters about each of their ten edges is zero. Consequently a compatible
2–3 Pachner move preserves the signed flattened-shape sum in P̂(ℂ); sheet changes also use the
transfer relation. Nondegenerate vertices and the full log-edge compatibility are retained.

*Proof sketch.* Use the geometric edge-sum interpretation of Neumann’s lifted relation. For the FT⁺
chart solve the integer sheet equations; extend along the distinguished lifted components. Interpret
the two/three tetrahedra as the two sides of the alternating boundary. ([Neu] Definition 3.3 and
Lemma 3.4, §3, pp. 423–424 (PDF pp. 11–12).)

*Needs:* §5.5, §5.4.

**Checks.**

- The classical five-term relation is recovered by forgetting the flattenings.
- Without the flattening condition the lifted relation fails, so the condition is not automatic.
- The lemma is what makes a two-three Pachner move on an ideal triangulation act trivially on the
  Bloch element.

### 5.8 Strong flattening theorem

For a G-labelled ordered 3-cycle K, G=PSL₂(ℂ) with discrete topology, choose developing boundary
points giving nondegenerate simplex shapes. A flattening has zero parity on every normal path and
zero log-parameter sum about every edge; it is strong if the log parameter also vanishes on normal
paths in each vertex star. Neumann proves that a strong flattening exists. For complete
finite-volume hyperbolic M use an ordered hybrid ideal/ordinary refinement with compatible face
orderings; an unordered ideal triangulation alone may give only B̂/C₆. Existence of that geometric
refinement is a target of §5.2.

*Construction.* Use the log/parity chain complex of [Neu] §9 to solve the flattening obstructions.
Impose vertex-star normal-path conditions for a strong flattening. Apply the ordered hybrid
refinement theorem for cusped manifolds, retaining the ordering condition. ([Neu] Definition 4.4 and
Theorem 4.5, §4.2, p. 429 (PDF p. 17); Theorem 14.2, p. 465 (PDF p. 53).)

*Needs:* §5.3, §5.4, §5.2.

The API:

- `StrongFlattening`: Simplex flattenings satisfying edge, parity and vertex-star normal-path
  equations.
- `strongFlattening_exists`: Existence for the stated labelled ordered nondegenerate 3-cycle.
- `strongFlattening_refinement`: Compatible ordered geometric refinements preserve the resulting
  class.

**Checks.**

- `strongFlattening_edge`: Every edge has log-parameter sum zero.
- `strongFlattening_parity`: An edge-log solution with an odd normal-path parity is not a strong
  flattening.
- `strongFlattening_ordering`: An un-ordered ideal triangulation is not the input of the full
  B̂-class theorem; its unordered invariant can lose C₆ information.

### 5.9 The extended Bloch element of a hyperbolic 3-manifold

For an oriented complete finite-volume hyperbolic 3-manifold M with the ordered hybrid refinement
and strong flattening specified above, β̂(M)=Σ_j ε_j[z_j;p_j,q_j] belongs to B̂(ℂ) and depends only
on M. More generally the labelled ordered-cycle construction gives λ:H₃(PSL₂(ℂ)^δ;ℤ)→B̂(ℂ), and the
signed sum depends only on the represented homology class. Changes of strong flattening, developing
points and compatible refinement do not change the class. The ordinary β_F requires the separate
verified field/boundary comparison; it is not produced by a diagram or numerical shapes alone.

*Construction.* Use cancellation of logarithmic wedges from the edge and normal-path conditions. Use
lifted five-term, transfer and cycle relations to prove independence of flattening and
representative. For cusps use Neumann's relative fundamental class for parabolic boundary holonomy
and the ordered hybrid refinements of §5.2. ([Neu] Theorems 4.5–4.6, §4.2, p. 429 (PDF p. 17);
Theorem 14.2, p. 465 (PDF p. 53).)

*Needs:* §5.8, §5.6, §5.7.

The API:

- `blochElement`: blochElement M is the class in the extended Bloch group attached to a flattened
  ideal triangulation of M.
- `blochElement_exists`: A flattening of the triangulation exists, so the element is defined.
- `blochElement_indep`: The element does not depend on the chosen flattening, only on the homology
  class.
- `blochElement_mem_extendedBloch`: The element lies in the extended Bloch group, the kernel of the
  map to the exterior square.

**Checks.**

- `blochElement_figure_eight_volume`: The projected figure-eight class is 2[z₆], z₆=exp(πi/3); its
  Bloch–Wigner value is 2D(z₆). The full extended class must use the cusp-compatible flattening,
  rather than assume twice the principal lift.
- `blochElement_flattening_independent`: Changing the flattening by an admissible amount does not
  change the class.
- `blochElement_not_in_prebloch_kernel`: The element is non-zero for a hyperbolic manifold, since
  its Rogers dilogarithm has non-zero imaginary part equal to the volume.

### 5.10 Extended Rogers regulator

On the cut-cover chart put R(z;p,q)=Li₂(z)+½log z log(1−z)+(πi/2)(p log(1−z)+q log z)−π²/6 modulo
π²ℤ. The cover transition and both relation families make R:P̂(ℂ)→ℂ/π²ℤ an additive homomorphism.
Restrict to B̂(ℂ). The Li₂ branch and ordinary Bloch–Wigner descent are imported from
Polylogarithms; the π² quotient and the sheet terms are the extra data added here.

*Construction.* Use the principal branch of Li₂ from Polylogarithms P.1 and its analytic
continuation. Check cover transitions change the expression by integral π² periods. Verify the
lifted five-term and transfer relations and descend the additive map. ([Neu] Proposition 2.5, §2,
pp. 419–420 (PDF pp. 7–8).)

*Needs:* §5.5, §5.6, Polylogarithms P.1 (bloch wigner dilogarithm), Polylogarithms P.2 (bloch wigner
descent).

The API:

- `extendedRogers`: The normalized expression in ℂ/π²ℤ.
- `extendedRogers_transfer`: The four-term transfer relation maps to zero.
- `extendedRogers_liftedFiveTerm`: A permitted lifted five-term relation maps to zero modulo π².

**Checks.**

- `rogers_normalizing_constant`: At z=1/2 and p=q=0, Li₂(1/2)=π²/12−(log 2)²/2 gives
  R=−π²/12 modulo π². Omitting the −π²/6 changes this value.
- `rogers_sheet_p`: Changing p by 2 adds πi log(1−z) before reducing periods;
  at z=1/2 this is −πi log 2, which is not a real π² period.
- `rogers_not_plain_BlochWigner`: The complex regulator retains a real Chern–Simons term modulo π²;
  its target is not just ℝ.

### 5.11 The Rogers dilogarithm computes volume and Chern–Simons invariant

Neumann’s λ:H₃(PSL₂(ℂ)^δ;ℤ)≅B̂(ℂ) is an isomorphism and R∘λ is the Cheeger–Chern–Simons class
i(Vol+i CS)=i Vol−CS modulo π²ℤ. For a complete finite-volume hyperbolic manifold R(β̂(M)) has
imaginary part Vol(M). The tetrahedron identity Vol(z)=D(z) is that of Polylogarithms P.2; this
roadmap assembles the signed sum and compares the Chern–Simons normalization. GZ uses V=i Vol+CS, so
V=−conj(R) modulo the corresponding period and with a chosen representative for exponentials. This
is not the ordinary K₃ Suslin isomorphism.

*Proof sketch.* Use Neumann’s exact sequence and λ to compare the group-homology class with the
extended Bloch class. Identify the Rogers class with the Cheeger–Chern–Simons cocycle. Use
Vol(z)=D(z) for the signed volume sum and explicitly convert the real CS sign for GZ asymptotics.
([Neu] Theorem 2.6, p. 420 (PDF p. 8); §12, Theorem 12.1, p. 459 (PDF p. 47); Theorem 14.2, p. 465
(PDF p. 53).)

*Needs:* §5.9, §5.10, Polylogarithms P.2 (bloch wigner descent), K3BlochGroups V.4 (suslin exact
sequence), K3BlochGroups V.6 (suslin lift fibre).

**Checks.**

- The imaginary part of R(β̂(M)) is Vol(M); the real-valued Bloch–Wigner regulator computes the same
  volume.
- The real part of R(β̂(M)) is −CS(M) modulo π²ℤ in Neumann’s convention, since R=i(Vol+i CS)=i
  Vol−CS.
- For the figure-eight knot complement the imaginary part is twice the volume of the regular ideal
  tetrahedron.

### 5.12 Geometric number-field Bloch class

For a chosen algebraic nondegenerate complete gluing solution with all shapes in a number field F,
the signed symbol sum is first an element of P(F). To place it in the selected Bloch group one must
prove the appropriate exterior/antisymmetric boundary vanishes and compare Neumann’s factor-two
convention with K3BlochGroups. The trace-field realization must also identify the chosen embedding
and any necessary field extension. For the standard figure-eight solution z₆²−z₆+1=0, F=ℚ(√−3), the
ordinary class 2[z₆] has zero exterior boundary since 1−z₆=z₆⁻¹ and regulator 2D(z₆). No unverified
general integral trace-field descent is asserted.

*Route.* Prove the solution is algebraic, specifying the field rather than rounding numerical
shapes. Compute the boundary from the incidence and cusp data. Apply the convention comparison of
K3BlochGroups V.3 and the trace-field identification, retaining torsion qualifications. ([Neu] §15,
pp. 470–471 (PDF pp. 58–59); §16, p. 472 (PDF p. 60).)

*Needs:* §5.3, §5.9, K3BlochGroups V.3 (exterior kernel bloch group), K3BlochGroups V.3 (bloch
group), Polylogarithms P.2 (bloch wigner descent).

### 5.13 What a knot diagram must be supplemented with before it gives a number-field Bloch class

A knot diagram does not automatically give β_F. Required witnesses are: a complete finite-volume
hyperbolic complement; genuine face-pairing and peripheral data; an ordered hybrid refinement with a
strong flattening; and an algebraic shape field with the required boundary/convention comparison.
Once supplied, β̂(M) is independent of permissible flattening choices. Neumann’s warning about
non-manifold underlying complexes applies to Dehn-filling triangulations, not all software
triangulations of cusped complements. The geometric existence and rigidity inputs are those of §5.2,
and tetrahedron volume comes from Polylogarithms P.2; none of this depends on the surgery calculus
of Layer 0.

*Route.* Check each geometric, arithmetic and ordering hypothesis separately. Apply the manifold
theorem only after those conditions are established. Treat a numerical solution as numerical until
the exact equations and the field comparison are proved. ([Neu] §14, pp. 464–465 (PDF pp. 52–53),
complete cusped geometry and fillings.)

*Needs:* §5.8, §5.9, §5.12, §5.11.

**Checks.**

- The figure-eight knot meets all four requirements: its complement is hyperbolic, the
  two-tetrahedron triangulation is geometric with shapes e^(πi/3), and the shape field is ℚ(√−3).
- The trefoil fails the first requirement: its complement is not hyperbolic, so no geometric
  solution exists.

### Examples

The regular ideal tetrahedron has shape z = e^(πi/3), with z′ = 1/(1 − z) = z and z″ = 1 − 1/z = z,
so zz′z″ = e^(πi) = −1. Its flattening at p = q = 0 is (πi/3, πi/3, −2πi/3). The figure-eight knot
complement is two such tetrahedra; its ordinary Bloch class is 2[z] in B(ℚ(√−3)), with zero boundary
because 1 − z = z⁻¹, and its volume is 2D(e^(πi/3)) = 2.0298832…

### Dependencies

GeometricTopology Layers 7 and 11; AlgebraicTopology Stages 3 and 6; K3BlochGroups V.3, V.4 and V.6;
Polylogarithms P.1 and P.2; Mathlib `Complex.log`.

## Layer 6: formal and analytic state integrals

A Neumann–Zagier datum records the gluing equations of an ideal triangulation as a pair of integer
matrices (A | B) with ABᵀ symmetric, together with the shapes and a flattening. Its formal state
integral is a Gaussian bracket of a product of quantum-dilogarithm vertex series; Garoufalidis,
Storzer and Wheeler prove that for the geometric solution it is a topological invariant with
coefficients in the trace field, and Dimofte and Garoufalidis refine it at each root of unity, with
arithmetic descent. When B is unimodular the datum becomes an integral Nahm datum, and the
comparison with the Habiro modules of HabiroNahmSeries is planned here under its precise hypotheses.
The analytic side starts from Faddeev's quantum dilogarithm Φ_b, its functional equations and the
operator pentagon on L²(ℝ), and builds the Andersen–Kashaev state integral of a shaped
triangulation, with its convergence and invariance theorem and the volume limits of two selected
knot integrals.

### 6.1 Neumann–Zagier datum

An NZ datum Ξ=(A,B,ν,z,f,f″) comes from an ideal triangulation (§5.2). Choose a full-rank square
system from the edge equations and one peripheral equation per cusp using [GSW] §2.2's incidence
relations (one edge equation is omitted in the one-cusp knot case); deleting arbitrary r rows is
not a valid multi-cusp construction. The integral
block (A|B) has a symplectic completion over ℤ[1/2]; a completion over ℤ additionally requires the
appropriate integral peripheral-row normalization. In particular ABᵀ=BAᵀ and rank(A|B)=N. Shapes
z_j∉{0,1} solve ∏_j z_j^A_ij(1−1/z_j)^B_ij=(−1)^ν_i. Integer flattening vectors satisfy Af+Bf″=ν
(and f′=1−f−f″ with the full incidence equations). For the formal Gaussian route impose det B≠0 and
det Λ≠0, Λ=−B⁻¹A+diag(1/(1−z_j)). Λ is symmetric over ℚ(z). A pair of integer matrices with these
properties need not come from a triangulation; the Lean structure `NZDatum` records only the linear
algebra.

*Construction.* Extract the matrices and ν from the edge and peripheral equations of §5.3. Use the
symplectic completion over ℤ[1/2] of [GSW] §2.2 to establish ABᵀ symmetry and full rank; do not
infer an integral lower half without its extra peripheral-row condition. Check the chosen flattening
and both determinant conditions before defining Gaussian coefficients. ([GSW] §2.2, equations
(14)–(19), pp. 6–8, NZ matrices and symplectic completion; [DG] §1.2, pp. 4–5; §§2.1–2.3, pp.
11–13.)

*Needs:* §5.3, §5.8, Mathlib `Matrix.det`.

*Lean:* `NZDatum`, `NZDatum.hessian`, `NZDatum.hessian_isSymm`, `halfDatum`.

The API:

- `NZDatum`: The triangulation-derived matrices, shapes and flattening satisfying the stated
  equations.
- `NZHessian`: Λ=−B⁻¹A+diag(1/(1−z)).
- `NZHessian_symmetric`: ABᵀ=BAᵀ and invertible B imply symmetry of Λ.
- `NZDatum_nonDegenerate`: Both B and Λ are invertible and all shapes avoid 0 and 1.

**Checks.**

- `NZ_singular_B`: A datum with det B=0 is excluded from this coordinate Gaussian formula.
- `NZ_degenerate_shape`: A shape 1 makes the Hessian and gluing coordinates invalid.
- `NZ_hessian_one_variable`: For A=0,B=1,z=1/2 the algebraic Hessian equals 2; this matrix
  computation alone does not certify a manifold datum.

### 6.2 Formal NZ state integral

For nondegenerate Ξ define ψ_h(x,z)=exp(−Σ_(k,ℓ≥0;k+ℓ/2>1) B_k x^ℓ h^(k+ℓ/2−1)
Li_(2−k−ℓ)(z)/(k!ℓ!)). These nonpositive-index polylogarithms are rational functions of z. Put
F_h^Ξ=exp(√h xᵀ(1−B⁻¹ν)/2+h fᵀB⁻¹Af/8)∏_jψ_h(x_j,z_j). Define Φ^Ξ(h)=⟨F_h^Ξ⟩_Λ using the formal
Gaussian bracket of HabiroNahmSeries HB.4 with covariance Λ⁻¹. The result lies in ℚ(z)[[h]] with
constant 1: Gaussian parity removes half-integral powers. This is a formal construction with no
analytic contour or error assertion. It differs from the normalisation of ψ in [DG] by the stated
exp(h/12−x√h/2) factor.

*Construction.* Use the filtered algebra of series with polynomial coefficients of [GSW] §3.1 to
justify coefficientwise exponentiation. Apply HabiroNahmSeries HB.4’s Gaussian differential
operator, not a new Gaussian theory. Check odd-polynomial parity and finite contributions to each h
coefficient; retain the source prefactor. ([GSW] §1, equations (1), (4)–(7), pp. 3–4; §2.2,
equations (16)–(19), pp. 7–8; Gaussian evaluation in §3.1, pp. 9–10.)

*Needs:* §6.1, HabiroNahmSeries HB.4 (formal gaussian integration), Polylogarithms P.1,
QSeriesPartitionsAndMockModularForms QM.0.

The API:

- `NZVertexSeries`: The normalized ψ_h series with Bernoulli coefficients.
- `NZFormalIntegrand`: F_h^Ξ including its flattening exponential.
- `formalNZStateIntegral`: the Gaussian bracket (HabiroNahmSeries HB.4) of F_h^Ξ.
- `formalNZStateIntegral_constant`: Its constant coefficient is 1.
- `formalNZStateIntegral_integralPowers`: The resulting half-variable series descends to integer h
  powers.

**Checks.**

- `formalNZ_constant`: At h=0 Φ^Ξ=1.
- `formalNZ_odd_moment`: The √h coefficient vanishes by Gaussian parity.
- `formalNZ_normalization`: Replacing GSW ψ by DG ψ without its exp(h/12−x√h/2) correction changes
  the resulting coefficients.

### 6.3 Formal state-integral invariance

Φ^Ξ is invariant under the changes of [GSW]: of quad, edge/peripheral choice and integer flattening
and under a nondegenerate 2–3 Pachner move, with the normalization above. For the geometric
discrete-faithful solution of a complete finite-volume cusped hyperbolic M the canonical
Epstein–Penner cell decomposition and connected regular refinements give a topological invariant
Φ_M∈k_M[[h]], k_M the invariant trace field. This does not assert connectivity of all ideal
triangulations seeing an arbitrary representation.

*Proof sketch.* Use formal Fourier and formal pentagon identities of [GSW] §§3–4 for local moves.
For the geometric solution use the connectivity of regular refinements of the Epstein–Penner
decomposition (§5.2), permitting flat nondegenerate tetrahedra. Use local rigidity/nonzero one-loop
Hessian to meet the determinant hypotheses; each geometric input is a target of §5.2. ([GSW] Theorem
1.1, p. 4; §2.3, pp. 8–9; quad and Pachner proofs in §§5–6, pp. 19–38.)

*Needs:* §6.2, §5.7, HabiroNahmSeries HB.4 (formal gaussian integration), §5.2.

### 6.4 NZ–Nahm comparison

If B is unimodular over ℤ, N=I−B⁻¹A is symmetric integral. If additionally B⁻¹ν≡diag(N)+1 mod2, the
NZ gluing equations are exactly 1−z_j=(−1)^N_jj∏_i z_i^N_ij. The Gaussian Hessian is
Λ=N+diag(z_j/(1−z_j)); its determinant agrees with the Nahm discriminant δ=∏_j
z_j^(−N_jj)det(diag(1−z)N+diag z) after the indicated nonzero monomial factors. If det B≠0 but B is
not unimodular, N can be rational and this is not an input to the symmetric-integral
HabiroNahmSeries HB.9 theorem. For the standard figure-eight comparison the Bloch index is 2[z₆]
over ℚ(√−3).

*Route.* Invert B integrally under unimodularity and use ABᵀ symmetry. Rewrite z″=−(1−z)/z and check
the parity vector explicitly. Compare the two Hessians/discriminants and the signed Bloch convention
using the comparison map of K3BlochGroups V.3. ([GSWZ] §1.8, pp. 15–17, NZ-to-Nahm comparison and
figure-eight example.)

*Needs:* §6.1, HabiroNahmSeries HB.8, K3BlochGroups V.3 (published modified CGZ Bloch group), §5.12.

*Lean:* `NZDatum.nahm_isSymm`.

### 6.5 Root-refined NZ data

Fix a geometric NZ datum Ξ with B∈GL_N(ℤ), symmetric Q=B⁻¹A, nonzero determinant of Λ=−Q+diag(z′),
the canonical primitive k-th root ζ=exp(2πi/k), k>0, and choices θ_i^k=z_i. Put F=ℚ(z), F_k=F(ζ),
E=F_k(θ); the actual Kummer Galois group embeds into (ℤ/kℤ)^N and need not be the whole product. For
m represented by integers 0≤m_i<k, put a_m(θ)=exp(−πi mᵀQm) exp(πi(mᵀQm+mᵀB⁻¹ν)/k) ∏_i
θ_i^(−(Qm)_i)/(ζθ_i⁻¹;ζ)_(m_i). These denominators are nonzero since z_i≠1. Assume S=Σ_m a_m≠0 and
set Av(g)=Σ_m a_m g(m)/S. Put D∗_k(x)=∏_(s=1)^(k−1)(1−ζ⁻ˢx)^s. With chosen roots,
τ_(Ξ,k)=k^(−N/2)[det(A diag(z″)+B diag(z⁻¹)) z^(f″/k)(z″)^(−f/k)]^(−1/2)∏_i D∗_k(θ_i⁻¹)^(1/k) S. The
displayed fractional monomials use the chosen θ_i and roots of z″_i, not unspecified powers. The
invariant scalar is qualified modulo its 2k-th-root ambiguity; it is not canonically an element of
F_k. For another primitive root ζ^u, transport the complete descended formula by the cyclotomic
Galois action, including its phase and a compatible extension to the coefficient and shape-root
data; this action need not fix the original shape field. Keeping the displayed canonical exponential
while replacing ζ only in the finite products is incorrect.

*Construction.* Use the integer unimodular B and invertible Hessian domain, and representatives for
m before proving k-periodicity. Define the finite weights at the canonical root, cyclic products and
nonzero weighted-average denominator. After arithmetic descent, use [DG2] Remark 2.7 for other
primitive roots, transporting the full phase together with the products. Retain each root choice in
τ. Use the root-independence theorem for powers rather than asserting a canonical scalar. ([DG2]
§§2.1–2.2, equations (7), (10)–(12), pp. 5–6; Definition 2.1, p. 6, and Remark 2.7, p. 8.)

*Needs:* §6.1, HabiroNahmSeries HB.4 (formal gaussian integration),
QSeriesPartitionsAndMockModularForms QM.0.

*Lean:* `cyclicDilogStar`.

The API:

- `RootNZDatum.weights`: The explicit a_m on (ZMod k)^N with stated integral and root choices.
- `RootNZDatum.average`: Σa_m g(m)/Σa_m, only with nonzero denominator.
- `cyclicDilogarithmStar`: The finite product D∗_k(x).
- `RootNZDatum.oneLoop`: The exact τ formula with chosen square and k-th roots.

**Checks.**

- `rootNZ_k_one`: For k=1, the finite average has one summand, D∗₁=1 and θ=z.
- `cyclicDilog_small`: D∗₁(x)=1, D∗₂(x)=1+x for ζ=−1, and D∗₃(x)=(1−ζ⁻¹x)(1−ζ⁻²x)².
  Reversing ζ without transporting the weights changes the last polynomial.
- `rootNZ_denominator`: If the weighted sum S is zero, the normalized average is outside the
  constructor’s domain.
- `rootNZ_kummer_relations`: Repeated shapes θ₁=θ₂ cannot admit an independent automorphism rotating
  only θ₁ in their actual splitting field.
- A constant function g=c has weighted average c. With weights (1,2) and values (0,2), the
  weighted average is 4/3, whereas the unweighted average is 1; weights (1,−1) are excluded
  because their sum is zero. These are finite-average tests, without a geometric realization claim.
- At k=1 the one-loop expression is the chosen inverse square root of
  det(A diag(z″)+B diag(z⁻¹)) z^f″(z″)^−f. Changing that square-root choice changes its sign;
  the zero determinant is excluded, and the 2k-th power removes this sign ambiguity.
- `rootNZ_primitive_root_transport`: For k=3 and the scalar weight Q=−1, r=1, θ=2, m=2, the
  canonical numerator is 4ζ⁻¹. Complex conjugation transports the entire weight to numerator 4ζ with
  the conjugated Pochhammer denominator. Replacing ζ by ζ² only in that denominator retains the
  wrong numerator. This is a scalar phase test, not a claim that these inputs form a geometric NZ
  datum.

### 6.6 Root-refined perturbative series

On a root-refined datum (§6.5), define the filtered vertex series
Ψ_(k,h)(x,θ,m)=exp(Σ_(n,j≥0;n+j/2>1) h^(n+j/2−1)(−1)^j/(n!j!k^j) Σ_(s=1)^k
B_n(s/k)Li_(2−n−j)(ζ^(m+s)θ⁻¹)x^j). All polylogarithm indices here are nonpositive; each coefficient
is rational in the indicated algebraic arguments. Define F_(k,h)(x;m)=exp(−√h xᵀB⁻¹ν/(2k)+h
fᵀB⁻¹ν/(8k))∏_iΨ_(k,h)(x_i,θ_i,m_i). The Gaussian bracket has Hessian Λ/k, hence covariance kΛ⁻¹.
Put φ⁺_(Ξ,ζ)(h)=Av(⟨F_(k,h)⟩) and φ_(Ξ,ζ)=τ_(Ξ,k)φ⁺_(Ξ,ζ). Wick parity and coefficientwise
finiteness give φ⁺∈1+hE[[h]]. This filtered definition is the rescaled form of the explicit diagram
rules of [DG2] §2.4: Π=hkΛ⁻¹, valence-zero vertices start at n=2, valence-one/two at n=1 and
valence≥3 at n=0. It corrects the unfiltered printed block (see Corrections to the sources). It is
not obtained by substituting a root into the k=1 series. Choice/topological invariance and
identification with Kashaev asymptotics are the conjecture of [DG2] (Conjecture 2.9), modulo
ζ^(1/12)exp(h/(24k)); the k = 1 theorem of [GSW] proves neither at other roots.

*Construction.* Use the propagator of [DG2] §2.4 and rational diagonal vertex factors, translated by
x↦√h x to the displayed filtered series. Use the Gaussian moments of HabiroNahmSeries HB.4; pair
indices and divide each finite diagram by its automorphism count. The degree bound of [DG2] Lemma
2.8 makes every fixed h coefficient finite. Average coefficientwise over the finite m-set; multiply
by the separately chosen one-loop factor. Keep the general conjectures separate. ([DG2] Definition
2.5, §2.3, p. 7; diagrams in §2.4, equations (24)–(28) and Lemma 2.8, pp. 8–9; [DG2] Conjecture 2.9,
§2.8, pp. 11–12.)

*Needs:* §6.5, HabiroNahmSeries HB.4 (formal gaussian integration), Polylogarithms P.1.

The API:

- `rootNZVertexSeries`: The displayed degree-filtered Bernoulli-polynomial vertex expansion.
- `rootNZFormalSeries`: The normalized finite average of Gaussian brackets, with Hessian Λ/k.
- `rootNZFormalSeries_constant`: The constant coefficient of φ⁺ equals 1.
- `rootNZFormalSeries_descent`: Its coefficients lie in F(ζ), independently of the k-th shape-root
  choices, by the following arithmetic theorem.

**Checks.**

- `rootNZ_constant`: φ⁺(0)=1 whenever S≠0.
- `rootNZ_odd_moment`: Wick parity removes all odd √h powers.
- `rootNZ_valence_three`: The n=0, j=3 vertex is necessary: two such vertices with three propagators
  contribute at h¹; the printed n≥1 block omits this two-loop term.

### 6.7 Root-series arithmetic theorem

For a root-refined datum (§6.5) with nonzero S, every coefficient of φ⁺_(Ξ,ζ) lies in F(ζ) and is
independent of choices θ_i^k=z_i; moreover τ_(Ξ,k)^(2k)∈F(ζ). This proves arithmetic descent of the
defined formal series, not its identification with analytic Kashaev asymptotics. The proof uses the
actual Kummer subgroup (or universal finite étale root algebra), allowing multiplicative relations
among shapes; independent coordinate rotations are not assumed to exist as automorphisms of every
selected field component.

*Proof sketch.* Prove k-periodicity of a_m and the simultaneous root-rotation/index-translation
identities as rational identities in the universal root algebra. For any actual automorphism with
θ_i↦ζ^(−r_i)θ_i, translate all m by r. Both weighted sums transform by the same nonzero factor, so
the normalized average is fixed. Use the cyclic-product shift to compensate the one-loop sum;
raising to 2k removes root/square-root ambiguities. Correct the cyclic-product prefactor and the
dropped parity sign in this computation (see Corrections to the sources). ([DG2] Theorems 2.2 and
2.6, §§2.2–2.3, pp. 6–8; proofs in §3, pp. 12–16.)

*Needs:* §6.6.

### 6.8 Topological Habiro-module comparison

For a nondegenerate isolated solution of the symmetric integral N Nahm equations obtained by §6.4,
use the refined Gaussian collection of HabiroNahmSeries HB.8 only after its global-prefactor and
regularity conditions are verified (and retaining its coprime auxiliary root-order condition) and
the HabiroNahmSeries HB.9 module-membership theorem only after its coefficient-transfer, all-order
HabiroNahmSeries HB.8 identification, Kummer-orientation and all-order gluing hypotheses are
verified. Its coefficient algebra is the full quadratic finite étale B=R[T]/(δT²−1), including split
components, and the target is Φ_(N,z)∈H_(B,ξ|B) at root orders prime to Δ, where ξ=Σ_j[z_j] in the
published modified CGZ convention of K3BlochGroups V.3. The coefficient ring R is the arithmetic
ring of the chosen number field with the required units and bad-prime localization;
HabiroNumberFields HB.6/HB.7 supply the Frobenius ring and K₃-indexed module, subject to the
effective global descent of HabiroNumberFields HB.7 extended to this full finite étale algebra; a
selected number-field component does not prove membership on all components. Identifying this
collection with the normalized geometric NZ series requires the explicit phase/one-loop and
classical-exponential comparison. It is a separate target, not an automatic assertion that every
formal NZ series is in that module. At primitive order k the geometric input is the root-refined
series of §6.6, with the finite cyclic average and one-loop factor above. Its matching with
HabiroNahmSeries HB.8’s refined Gaussian collection is a normalisation comparison under the integral
and parity hypotheses, not mere evaluation of the k=1 series.

*Route.* Verify symmetry/integrality, nondegeneracy and the coefficient localization. Use the
collection only with HabiroNahmSeries HB.9 coefficient-transfer, all-order HabiroNahmSeries HB.8
identification, signed Kummer orientation and integral gluing inputs; preserve the full quadratic
finite étale coefficient algebra and the effective descent of HabiroNumberFields HB.7, the exact
module index and restricted root orders. Compare the geometric normalization with the supplied
collection, stripping the principal logarithmic part exactly as HabiroNahmSeries HB.9; an unmatched
phase is a failure of the comparison, not a convention. ([GSWZ] Theorem 5, §1.7, p. 14; §1.8, pp.
15–17.)

*Needs:* §6.4, HabiroNahmSeries HB.8 (Gaussian identification in arbitrary rank), HabiroNahmSeries
HB.9 (module membership), HabiroNumberFields HB.6, HabiroNumberFields HB.7, K3BlochGroups V.3
(published modified CGZ Bloch group), §6.7, HabiroNahmSeries HB.9 (integral product gluing and
Frobenius transport), HabiroNahmSeries HB.9 (finite-Chern orientation of Gaussian constants),
HabiroNahmSeries HB.9 (quadratic étale coefficients and Kummer descent).

### 6.9 Faddeev quantum dilogarithm

For Re b>0, Im b≥0 put c_b=i(b+b⁻¹)/2. In |Im z|<|Im c_b| define Φ_b(z)=exp(∫_(ℝ+i0) e^(−2izw)/(4
sinh(bw)sinh(w/b)w) dw), with the prescribed contour passing above w=0, and extend meromorphically.
Zeros are −c_b−mib−nib⁻¹ and poles are c_b+mib+nib⁻¹, m,n≥0, with multiplicities when the lattice
points coincide. The symmetric strip integral also specifies the reciprocal parameters with
Re b>0 and Im b≤0; continuation uses that common strip, so self-duality Φ_b = Φ_(b⁻¹)
has both sides defined. An arbitrary ordinary real-axis integral through
w=0 is not this definition.

*Construction.* Use the contour integral and its convergence on the strip from [AK] Appendix A.
Continue using the functional equations and track its zero/pole lattice. Prove self-duality directly
from the symmetric b and b⁻¹ integrand. ([AK] Definition 15, §1.7, p. 9; Appendix A, §13, pp.
34–37.)

*Needs:* Polylogarithms P.1, Mathlib `MeasureTheory.integral`, Mathlib
`Complex.integral_boundary_rect_eq_zero_of_differentiableOn`.

*Lean:* `faddeevIntegrand`, `faddeevHeight`, `faddeevPhi`, `faddeevPhi_inv`.

The Lean `faddeevPhi` records only the real b>0 strip formula, using the horizontal line
Im w=(π/2)min(b,b⁻¹); `faddeevPhi_integrable` proves integrability for
|Im z|<(b+b⁻¹)/2, and `faddeevPhi_stripComparison` identifies it with the above-zero prescription.
The total integral outside these hypotheses is not a meromorphic continuation. The complex-b
meromorphic function is the distinct README target `faddeevPhi_meromorphic`; its comparison with
the real strip formula is asserted only on that common domain.

The API:

- `faddeevPhi_meromorphic`: The meromorphic function determined by the above-zero strip integral.
- `faddeevPhi_integrable`, `faddeevPhi_stripComparison`: the integrability and comparison targets
  on the real positive-b strip just specified.
- `faddeevPhi_selfDual`: Φ_b(z)=Φ_(1/b)(z).
- `faddeevPhi_divisor`: The stated zeros/poles with their multiplicities.

**Checks.**

- `faddeevPhi_zero_pole`: −c_b is a zero and +c_b is a pole; exchanging them reverses the
  convention.
- `faddeevPhi_selfDual_b2`: b=2 and b=1/2 both have c_b=5i/4 and the same zero/pole lattice;
  their raw strip contours also have the same height π/4.
- `faddeevPhi_inversion_constant`: at b=1 and z=0, Φ₁(0)²=exp(iπ/6), by equation (47).
  A normalization setting Φ₁(0)=1 fails this computed value.
- `faddeevPhi_contour_prescription`: The defining integrand has a singularity at w=0; the
  unsubtracted ordinary integral over ℝ is not the above-zero contour definition.
- At b=1 the horizontal height is π/2, strictly between 0 and the first integrand pole at πi.
- b=0 is excluded, as is z with |Im z|≥(b+b⁻¹)/2 from the raw strip formula; a total Bochner
  integral outside the admitted domain does not certify an analytic value.

### 6.10 Faddeev functional equations

As meromorphic identities, Φ_b(z−i b^(±1)/2)=(1+exp(2π b^(±1)z))Φ_b(z+i b^(±1)/2), and
Φ_b(z)Φ_b(−z)=ζ_inv⁻¹exp(iπz²), ζ_inv=exp(iπ(1+2c_b²)/6). Where Im b²>0 the product formula is
(exp(2πb(z+c_b));exp(2πib²))_∞/(exp(2πb⁻¹(z−c_b));exp(−2πib⁻²))_∞. Equalities at poles are
understood meromorphically, not as ordinary finite complex values.

For b>0 real, the conjugation identity is overline(Φ_b(z))=1/Φ_b(overline z), wherever the
finite values exist, and `faddeevPhi_unitary_real` gives |Φ_b(x)|=1 for every real x.
The real axis has no divisor points, since its zeros and poles lie strictly below and above it.
The same conjugation identity holds for |b|=1 with Re b>0 and Im b≥0: conjugation exchanges b
and b⁻¹, and self-duality identifies them. Let `IsUnitaryFaddeevParameter` mean either b>0 real
or this unit-circle branch, and prove `faddeevPhi_unitary_parameter` on that domain.
These are the bounded unitary symbols used in §6.11. ([AK] Appendix A, equation (49), p. 35.)

**Checks.**

- b=1 has ℏ=(b+b⁻¹)⁻²=1/4 and |Φ₁(x)|=1 on the real line.
- b=exp(πi/3) has b+b⁻¹=1, ℏ=1 and c_b=i/2; it lies on the admitted unit circle.
  No real b>0 gives ℏ=1, since b+b⁻¹≥2 there.
- b=i is excluded by Re b>0 and b+b⁻¹=0. The parameter b=2i is outside both branches,
  so unitarity cannot be deduced for an arbitrary nonzero complex parameter.

*Proof sketch.* Shift the contour in the defining strip and compute residues. Use the two shift
equations for meromorphic continuation. Check the inversion constant in the normalisation of [AK];
compare the product representation in its convergence domain. ([AK] Appendix A, §13, equations
(44), (47)–(50), pp. 34–35.)

*Needs:* §6.9, QSeriesPartitionsAndMockModularForms QM.0.

### 6.11 The Schrödinger pair and the operator p + q

On L²(ℝ) let q be multiplication by x and p = (2πi)⁻¹ d/dx, both defined on the Schwartz space S(ℝ).
Both are essentially self-adjoint there (q as a multiplication operator, p because the Fourier
transform carries it to one), S(ℝ) is invariant under both, and [p, q] = (2πi)⁻¹ on S(ℝ). The
operator p + q on S(ℝ) is essentially self-adjoint: conjugation by the unitary multiplication
operator e^(iπx²), which preserves S(ℝ), gives e^(−iπx²)p e^(iπx²)=p+q. Apply the supplied Cayley
Borel calculus and spectral measure to the real-line symbol Φ_b for an
`IsUnitaryFaddeevParameter` b. Define
`faddeevMomentumUnitary`, `faddeevPositionUnitary` and `faddeevSumUnitary` as its three bounded
unitary values; unitarity follows from |Φ_b(x)|=1 on ℝ. These specialised operators are the new
inputs to the pentagon §6.12.

*Construction.* Use the Fourier transform on S(ℝ) and L²(ℝ) (Mathlib
`SchwartzMap.fourierTransformCLM`) to reduce p to a multiplication operator; closedness and
self-adjointness are those of SelfAdjointSpectralTheory Parts C–D. Compute the conjugation e^(−iπx²)
p e^(iπx²) = p + q on S(ℝ) directly. ([AK] Appendix A, §13, pp. 34–35, where this pair is used; the
general theory is SelfAdjointSpectralTheory Parts C–E.)

*Needs:* §6.10, SelfAdjointSpectralTheory Part B, SelfAdjointSpectralTheory Part C, SelfAdjointSpectralTheory Part D,
SelfAdjointSpectralTheory Part E, Mathlib `SchwartzMap`, Mathlib `SchwartzMap.fourierTransformCLM`,
Mathlib `MeasureTheory.Lp`.

The API:

- `positionOp`, `momentumOp`: the closures of q and p, self-adjoint operators on L²(ℝ).
- `positionOp_momentumOp_comm`: [p, q] = (2πi)⁻¹ on S(ℝ).
- `sumOp`: the closure of p + q, self-adjoint.
- `sumOp_eq_conj`: p + q = e^(−iπx²) p e^(iπx²) as self-adjoint operators.
- `faddeevMomentumUnitary`, `faddeevPositionUnitary`, `faddeevSumUnitary`: the supplied calculus
  specialised to Φ_b at an admitted unitary parameter, with the unitary conclusion.

**Checks.**

- `comm_on_gaussian`: on f(x) = e^(−πx²), (pq − qp)f = (2πi)⁻¹ f; the opposite sign convention p =
  −(2πi)⁻¹ d/dx reverses it.
- `position_not_bounded`: q is unbounded: f(x) = (1 + |x|)⁻¹ lies in L²(ℝ) but xf(x) does not, so f
  is outside the domain of q.
- `sumOp_conj_check`: (2πi)⁻¹ (e^(iπx²) f)′ = e^(iπx²)((2πi)⁻¹ f′ + x f), which is the identity
  behind `sumOp_eq_conj`.

### 6.12 Faddeev operator pentagon

On the standard Schrödinger Hilbert space L²(ℝ), for self-adjoint position and momentum p,q with
[p,q]=1/(2πi) on the common invariant Schwartz core and an `IsUnitaryFaddeevParameter` b,
the bounded unitary functional-calculus
operators satisfy Φ_b(p)Φ_b(q)=Φ_b(q)Φ_b(p+q)Φ_b(p). The closure of p+q and the functional calculus
are those of §6.11. This operator identity is distinct from the formal noncommutative q-dilogarithm
pentagon owned by HabiroCyclotomicCompletions Layer 1.

*Proof sketch.* Use the spectral calculus and the Schrödinger pair of §6.11. Apply the Fourier
integral identities of [AK] Appendix A on the invariant core. Extend to bounded operators and use
the charged identity for admissible analytic Pachner moves. ([AK] Appendix A, §13, equation (50), p.
35.)

*Needs:* §6.10, §6.11, SelfAdjointSpectralTheory Part E.

### 6.13 Selected analytic state integrals

Choose b∈(0,1], ℏ=(b+b⁻¹)⁻², and n=2 or 3. For ε∈(0,π) define g_n(ℏ)=(2π√ℏ)⁻¹∫_(ℝ−iε)
Φ_b(z/(2π√ℏ))^(−n)exp(iz²/(4πℏ)) dz, oriented left to right. The strip avoids poles of Φ_b⁻¹
(nearest is at Im z=−π); its tails decay on both ends for n>1. Cauchy deformation identifies
permitted ε, defining the ℝ−i0 boundary value. The figure-eight and 5₂ examples of [AK] identify the
absolute values of g₂ and g₃ with their selected knot state integrals after explicit unit-modulus
phase correction; the exact phases are listed under Corrections to the sources. General
contour/analytic gluing invariance is not inferred from the formal NZ theorem.

*Construction.* Use the pole lattice and large-real-argument estimates to justify the horizontal
contour and absolute convergence. Prove contour independence by rectangular deformation and
vanishing vertical edges. Compare χ₄₁(0) and χ₅₂(0) of [AK] with g₂, g₃ including the inversion and
exp(−iπ/3) phases. ([AK] §§11.4–11.7, pp. 28–32; §12, pp. 32–34.)

*Needs:* §6.10, §5.3, Mathlib `MeasureTheory.integral`, Mathlib
`Complex.integral_boundary_rect_eq_zero_of_differentiableOn`.

The API:

- `analyticStateIntegral`: The displayed g_n with its b,ℏ and horizontal contour.
- `analyticStateIntegral_contour`: Permitted ε in the pole-free strip give the same value.
- `analyticStateIntegral_knotExamples`: The selected AK knot kernels at x=0 agree in absolute value
  after the explicit phases.

**Checks.**

- `stateIntegral_pole_boundary`: The line Im z=−π reaches a pole of the inverse Φ integrand and is
  excluded.
- `stateIntegral_hbar_b1`: At b=1 the declared parameter is ℏ=1/4.
- `stateIntegral_phase_52`: χ₅₂(0)=exp(−iπ/3)g₃, so absolute values agree but exact complex values
  require that phase.

### 6.14 Selected state-integral volume theorem

For the integrals g₂, g₃ of §6.13, as ℏ→0+ on the b→0+ branch, v_n(z)=−nLi₂(−e^z)−z²/2 has v′_n(z)=n
log(1+e^z)−z. The critical point z_n selected by the contour of [AK] §12 minimizes Im v_n in the
stated strip. Its steepest-descent expansion has leading exp(v_n(z_n)/(2πiℏ)) g(z_n)^(−n)/√(i
v″_n(z_n)) (1+O(ℏ)). Thus lim_(ℏ→0+)2πℏ log|g₂|=−Vol(S³∖4₁) and similarly g₃ gives −Vol(S³∖5₂).
These are decay limits for AK integrals; they are not Kashaev growth theorems. The uniform
deformation and tail estimates that the source leaves implicit are part of this target (see
Corrections to the sources).

*Proof sketch.* Use the quantum-dilogarithm small-b expansion on a pole-free strip. Identify the
contour-selected nondegenerate critical points and relate their dilogarithm action to the complete
gluing shapes. Use the steepest-descent contour of [AK] §12 and O(ℏ) formula, proving the uniform
tail and phase estimates. ([AK] Theorem 5, §1.9, p. 11; §12, pp. 32–34, with the phase and estimate
corrections listed under Corrections to the sources.)

*Needs:* §6.13, §5.11, Polylogarithms P.1, HabiroNahmSeries HB.4.

### 6.15 Leveled positive shapes

A finite ordered oriented pseudo-3-manifold X is a finite set of ordered oriented tetrahedra with a
partial matching of their faces by orientation-reversing, order-preserving face pairings; the
unpaired faces form its boundary. It is combinatorial data, defined here. On X, a shape assigns α>0
to each local edge, with the three angles at every tetrahedron vertex summing to π. Opposite edges
have equal angles. The weight ω(e) is the sum of local angles over each global edge. Balanced means
internal and ω=2π; fully balanced means every edge is balanced, hence the face boundary is empty. A
level is ℓ∈ℝ. With p sending a local edge to its opposite-edge pair and ε the orientation-induced
cyclic antisymmetric incidence, a boundary-zero gauge g shifts α(a) by πΣ_b ε_(p(a),p(b))g(edge(b)),
and shifts ℓ by Σ_e g(e)Σ_(a over e)(1/3−α(a)/π), retaining positivity. Leveled shaped equivalence
uses gauge equivalence after common vertex-preserving shaped 3↔2 refinements. The inverse 2→3 move
requires existence of positive new angles; it is not automatically allowed. The admissibility
condition of [AK] is H₂(X∖vertices;ℤ)=0, and composition is allowed only if the glued result remains
admissible.

*Construction.* Define X as combinatorial data and compute H₂(X ∖ vertices) by singular homology
(AlgebraicTopology Stage 2). Add the angle inequalities and linear vertex sums, rather than
substituting a gluing matrix. Use [AK] §§1.2–1.6 for the gauge action, the level and the shaped 3–2
move; positivity is preserved only within its admitted domain. Use the actual H₂ vanishing test on
each glued composite. ([AK] Definitions 1–11, §§1.2–1.6, pp. 2–8.)

*Needs:* GeometricTopology Layer 11, AlgebraicTopology Stage 2.

The API:

- `AKShape.weight`: ω(e)=Σ_(local a over e)α(a).
- `AKShape.charge`: c(a)=α(a)/(2π); each tetrahedron has three opposite-edge charges summing to 1/2.
- `AKShape.gauge`: The stated gauge action and level shift on the domain retaining positive angles;
  boundary gauges vanish.
- `AKShape.admissible`: Admissibility is H₂ of the complement of vertices equal to zero; it is
  checked again after gluing.

**Checks.**

- `ak_regular_charges`: The regular tetrahedron has all local angles π/3 and all three charges 1/6.
- `ak_fullyBalanced_boundary`: A shape with a boundary edge cannot be fully balanced in the sense of
  [AK].
- `ak_positive_inverse_move`: A proposed 2→3 move without positive new angles is excluded, even if
  its formal linear angle equations have a real solution.
- `ak_admissibility_examples`: A single tetrahedron with its vertices removed has H₂=0.
  An S³ triangulation with two distinct vertices has H₂≅ℤ after deleting them, and
  S²×S¹ with one vertex deleted also has H₂≅ℤ; both fail admissibility.
- `ak_gauge_zero`: The zero gauge changes neither angles nor level. In the local angle formula,
  a cyclic incidence pair with coefficient +1 and its reverse with coefficient −1 sends
  (π/3,π/3) to (π/3+πg,π/3−πg). For g=1/6 these become (π/2,π/6); g=1/3 reaches
  zero and is outside the positive gauge domain. For regular starting angles the local
  level-shift coefficients 1/3−α/π vanish.

### 6.16 Kernels, wavefront sets and the contraction of tempered distributions

The state integrals of [AK] compose tempered distributions on products of real lines. Mathlib
provides Schwartz space, tempered distributions, the Dirac distribution and the Fourier transform;
no roadmap plans the three further inputs, which are targets here.

For the local operations, `LocalDistribution` is the continuous dual D′(ℝⁿ) of the compactly
supported smooth test space D(ℝⁿ), with its usual inductive-limit topology over compact supports.
Construct that test-space topology and the restriction S′→D′ before defining its wavefront
operations. The wavefront seminorms are the localized Fourier seminorms of [BDH] §1, pp. 2–3;
the normal topology adds the strong-dual seminorms sup_(φ∈B)|u(φ)| for bounded test sets B
([BDH] §3, Definition 3.1, p. 5). The full cotangent cone recovers the strong local-distribution
topology; the empty cone recovers C∞, and excludes δ₀. These distinguish this construction from
unrestricted distributions or an unqualified weak topology.

- `schwartz_kernel_theorem`: continuous linear maps S(ℝⁿ) → S′(ℝᵐ) correspond bijectively to
  tempered distributions on ℝⁿ⁺ᵐ, their kernels.
- `wavefrontSet`: the wavefront set WF(u) ⊂ ℝⁿ × (ℝⁿ ∖ 0) of a tempered distribution u: the
  directions in which the Fourier transform of a localisation of u does not decay rapidly. It is
  empty exactly when u is smooth, and pullback along a linear surjection pulls it back.
- `product_of_wavefront`: if no (x, ξ) ∈ WF(u) has (x, −ξ) ∈ WF(v), the product uv exists as an
  ordinary distribution D′(ℝⁿ). For fixed closed conic wavefront bounds satisfying that condition,
  multiplication is sequentially continuous in Hörmander's wavefront topology and agrees with
  pointwise multiplication for smooth inputs; in the normal topology it is hypocontinuous
  ([BDH] Theorem 6.1, §6, p. 21). To obtain a tempered product, additionally require that its
  action extend continuously from compactly supported tests to S(ℝⁿ); the wavefront condition
  alone provides no bound at infinity.
- `contraction`: for A on ℝⁿ × ℝᵐ and B on ℝᵐ × ℝˡ, the composite (π_(n,l))_∗(π_(n,m)^∗ A ·
  π_(m,l)^∗ B) is defined when the pulled-back wavefront sets satisfy the product condition and the
  product extends continuously to the enlarged test space of [AK] Appendix B, Definition 20.
  Write x for the retained coordinates and y for the integrated ones. This space of smooth φ(x,y)
  has seminorms sup |(x,y)^β ∂^αφ| for the multi-indices with β_i=0 whenever α_i=0 in an integrated
  coordinate. Thus ψ(x), with ψ Schwartz and constant in y, is admitted; positive-order y
  derivatives must have the stated decay. Pulling back an output Schwartz test gives such a φ,
  and the extension pairs with it to define pushforward. It is a partial composition.

*Construction.* The kernel theorem follows from the nuclearity of S(ℝⁿ). Wavefront sets and the
product criterion are local and use the Fourier transform of localisations; the pushforward is
integration over the fibre, admitted on the enlarged test space. ([AK] Appendix B, §14, pp. 37–39,
Definitions 18–20, Theorem 8 and Proposition 7; the local/global qualification of Theorem 8 is
  listed under Corrections to the sources. The classical proofs are in [Hör] Chapters 5 and 8.)
For the corrected local product use the tensor product followed by diagonal pullback in
[BDH] Theorem 6.1, §6, p. 21; Proposition 5.1, §5, p. 13, supplies the pullback criterion.

*Needs:* Mathlib `SchwartzMap`, Mathlib `TemperedDistribution`, Mathlib
`TemperedDistribution.delta`, Mathlib `SchwartzMap.fourierTransformCLM`.

The API:

- `kernelOf`, `operatorOfKernel`: the two directions of the kernel theorem.
- `LocalDistribution`, `restrictTempered`: the local continuous dual and restriction from S′.
- `wavefrontSet`, `wavefrontSet_eq_empty_iff_smooth`, `wavefrontSet_pullback`.
- `mulOfWavefront`: the local distribution product under the wavefront condition.
- `mulOfWavefront_tempered`: its tempered lift only with a continuous Schwartz extension.
- `contract`: the partial composition, with `contract_assoc` when both sides are admitted.

**Checks.**

- `delta_mul_delta_excluded`: δ₀ · δ₀ on the same coordinate is excluded, since WF(δ₀) contains (0,
  ξ) and (0, −ξ).
- Restriction sends the tempered Dirac distribution to evaluation at 0 and the constant
  tempered distribution 1 to φ↦∫φ. The smooth function e^(x²) defines a local distribution
  on compactly supported tests but has no tempered extension; D′ and S′ are distinct carriers.
- `smooth_multiplier`: a smooth multiplier with polynomial bounds on every derivative has the
  multiplication operator supplied in the boundaries. A polynomial and a compactly supported
  smooth function satisfy this criterion; smoothness and a bound on the function alone do not.
- `empty_wavefront_not_tempered_product`: put u=(sin(e^(x²)))′ and v=cos(e^(x²)). Both are smooth
  tempered distributions: u is the derivative of a bounded function, and v is bounded. Their
  local product is 2xe^(x²)cos²(e^(x²)). On positive translates of a fixed nonnegative test bump,
  its integral grows exponentially (the oscillatory square has positive mean), so it cannot
  satisfy a tempered-distribution polynomial seminorm bound. Both wavefront sets are empty.
- `hyperplane_delta_support`: δ(x₀ + x₂ − x₁) pairs to zero with every test function supported away
  from the hyperplane x₀ + x₂ = x₁.
- `kernel_identity`: the identity map has kernel δ(x−y); the constant kernel 1 instead sends φ
  to the constant function ∫φ. The zero map has zero kernel.
- `contraction_nonproper`: constant kernels 1 satisfy the local product criterion but their
  integral over an internal real coordinate diverges; no enlarged-test-space extension exists.
- `contraction_testSpace`: ψ(x) independent of y belongs to the enlarged test space but is not
  Schwartz in y unless it is zero. Conversely ψ(x)sin y fails its weighted first-y-derivative
  seminorms. These tests distinguish the required space from ordinary Schwartz space and from
  all smooth bounded functions.

### 6.17 Charged tetrahedron kernel

For λ with ℏ=(λ+λ⁻¹)⁻²>0 in the parameter domain of [AK], put c_λ=i(λ+λ⁻¹)/2. Charges a,c>0 and
b=1/2−a−c>0 define ψ_(a,c)(x)=Φ_λ(x−2c_λ(a+c))⁻¹ exp(−4πi c_λ a(x−c_λ(a+c))) exp(−πi
c_λ²(4(a−c)+1)/6). Its Fourier transform is ψ̃_(a,c)(x)=∫ℝ ψ_(a,c)(y)exp(−2πixy)dy, absolutely
convergent, and ψ̃′_(a,c)(x)=exp(−πix²)ψ̃_(a,c)(x)=exp(−πi/12)ψ_(c,b)(x). The positive charged
kernel is the tempered distribution δ(x₀+x₂−x₁)ψ̃′_(a,c)(x₃−x₂)exp(2πix₀(x₃−x₂)); the negative
kernel is its conjugate transpose. For an ordered tetrahedron, a=α(v₀v₁)/(2π) and c=α(v₀v₃)/(2π).
The Dirac factor is a distribution supported on a hyperplane, never an ordinary complex-valued
function.

*Construction.* Use [AK] §4 to prove charged Fourier convergence and the cyclic Fourier identity
from Appendix A. Interpret the hyperplane Dirac kernel by its action on Schwartz test functions;
prove continuity with the kernel theorem of §6.16. Apply conjugate transpose for orientation
reversal and retain the exp(−πi/12) phase. ([AK] §4, pp. 15–16, charged kernels and Fourier
identities.)

*Needs:* §6.15, §6.10, Mathlib `SchwartzMap`, Mathlib `TemperedDistribution`, Mathlib
`TemperedDistribution.delta`, Mathlib `SchwartzMap.fourierTransformCLM`, §6.16.

*Lean:* `IsPositiveCharge`.

The API:

- `chargedPsi`: The displayed charged scalar function with all three charges positive.
- `chargedPsi_fourier`: exp(−πix²) times its Fourier transform equals exp(−πi/12)ψ_(c,b)(x).
- `chargedTetrahedronKernel`: The specified distribution on four real face coordinates.
- `chargedTetrahedronKernel_adjoint`: Orientation reversal gives the conjugate transpose with
  incoming and outgoing face coordinates exchanged.

**Checks.**

- `chargedPsi_regular`: At a=c=1/6 the third charge is b=1/6; the Fourier transform cycles the same
  charge triple with the specified phase.
- `chargedKernel_hyperplane`: The kernel pairs to zero against any test function supported away from
  x₀+x₂−x₁=0.
- `chargedKernel_zero_charge`: The charge boundary a=0 is outside the strictly positive
  construction; a limiting or residue invariant requires a separate theorem.

### 6.18 Charged pentagon theorem

For positive charge pairs (a_j,c_j), b_j=1/2−a_j−c_j>0, satisfying a₁=a₀+a₂, a₃=a₂+a₄, c₁=c₀+a₄,
c₃=a₀+c₄, c₂=c₁+c₃, the charged operators satisfy T₁₂(a₄,c₄)T₁₃(a₂,c₂)T₂₃(a₀,c₀)=exp(πi
c_λ²P_e/3)T₂₃(a₁,c₁)T₁₂(a₃,c₃), where P_e=2(c₀+a₂+c₄)−1/2. This is an equality of the admitted
continuous Schwartz/distribution kernels. Products and contractions are defined only with the
necessary generic analytic extension conditions. The scalar is part of the equality and is cancelled
by the level shift of §6.19 under the corresponding shaped Pachner move.

*Proof sketch.* Insert the charge conjugations around the uncharged tetrahedral operator. Use the
Heisenberg relations of [AK] §5, the five linear charge equations and the uncharged pentagon.
Evaluate the ratio of the five ν charge phases; it is precisely exp(πi c_λ²P_e/3), not 1. ([AK]
Proposition 2, §5, pp. 16–17.)

*Needs:* §6.17, §6.12, §6.11, §6.16.

### 6.19 The leveled Andersen–Kashaev state integral

For ℏ>0, the Andersen–Kashaev state integral F_ℏ(X,ℓ)=Z_ℏ(X)exp(iπℓ/(4ℏ)) is obtained by tensoring
the signed charged tetrahedron kernels and contracting each identified face variable over ℝ. Its
Faddeev parameter λ is chosen with λ+λ⁻¹=ℏ^(−1/2): for 0<ℏ≤1/4 take 0<λ≤1, and for ℏ>1/4
take λ=(ℏ^(−1/2)+i√(4−ℏ⁻¹))/2 on the upper unit circle with positive real part.
Both satisfy `IsUnitaryFaddeevParameter`, the domain of the pentagon. Its
objects are finite face sets, and the morphism associated to X is in S′(ℝ^(boundary faces)). Generic
contraction A:n→m, B:m→l is (π_(n,l))_∗(π_(n,m)^∗A·π_(m,l)^∗B), admitted only when the two
pulled-back wavefront sets have no opposite covectors at a common base point and their product
extends continuously to the enlarged Schwartz test space S(ℝ^(n⊔m⊔l))_m of [AK] Appendix B (§6.16).
It is a partial composition, not unrestricted multiplication of distributions. On the
shape/gauge/Pachner domain above this gives the stated level-normalized construction; convergence
and well-definedness are the separate following theorem. Empty face boundary gives a complex scalar.

*Construction.* Tensor the kernels on independent variables; pull them back along the face incidence
maps. Check wavefront transversality and the enlarged-test-space extension before pushforward along
internal variables. Multiply by the exact level phase. Keep the general distributional inputs of
§6.16 separate from the homological convergence theorem §6.20. ([AK] Theorem 4, §1.7, pp. 9–10;
Appendix B, §14, pp. 37–39.)

*Needs:* §6.15, §6.17, Mathlib `TemperedDistribution`, §6.16.

*Lean:* `levelPhase`, `levelPhase_add_eight_mul`.

The API:

- `akStateIntegral`: The tensor contraction of signed charged kernels with exp(iπℓ/(4ℏ)), only on
  the admitted contraction domain.
- `akStateIntegral_levelShift`: Adding u to ℓ multiplies F by exp(iπu/(4ℏ)).
- `akStateIntegral_glue`: The distributional composition equality for a glued admissible composite,
  with transversality and extension discharged by the convergence theorem.
- `akStateIntegral_closed`: No boundary face variables identify the output distribution with a
  complex scalar.

**Checks.**

- `ak_level_shift`: At ℏ>0 a level increase of 8ℏ leaves F unchanged because its phase is exp(2πi).
- A level increase of 4ℏ multiplies F by −1; its phase has period 8ℏ, rather than 4ℏ.
- At ℏ=1 the parameter is exp(πi/3). Restricting λ to positive reals would omit this
  allowed state integral and would cover only ℏ≤1/4.
- `ak_bad_distribution_product`: δ₀·δ₀ on the same coordinate has opposite wavefront covectors and
  is excluded from this composition rule.
- `ak_closed_output`: The output for an empty face boundary has no free face-coordinate dependence;
  cusp links at deleted vertices do not add boundary-face variables.

### 6.20 The Andersen–Kashaev convergence and invariance theorem

For every positively shaped pseudo-3-manifold X satisfying H₂(X∖vertices;ℤ)=0, Z_ℏ(X) is a
well-defined tempered distribution. Thus F_ℏ is the unique ∗-functor of [AK] on the admissible
leveled shaped cobordism categroid: it respects composition exactly when the composite is
admissible, orientation reversal by adjoint, and the gauge/common vertex-preserving shaped-Pachner
equivalence defined above. The level compensates the charged pentagon and gauge phases. Fully
balanced admissible leveled objects have empty face boundary and give scalar invariants of this
qualified equivalence class. This does not assert invariance under arbitrary moves that add/remove
vertices, or convergence for every shape or homology type.

*Proof sketch.* Use the Fundamental Lemma of [AK]: the three adjacent vertex exchanges conjugate the
charged kernel by its A/B boundary distributions, with charge permutations and orientation change.
Use the operator-valued boundary cohomology class θ_X and its annihilation on the kernel of
H₁(boundary∖vertices)→H₁(X∖vertices). In the polarisation of [AK] §10 the kernel is ψ_X(η) times a
product of independent Dirac factors. A forbidden repeated Dirac constraint under gluing would yield
a nonzero H₂ class. Admissibility rules it out; exponential decay of ψ_X supplies the required
pushforward extension. Apply the charged pentagon, gauge-transformation phase and level shift to
prove independence of the admitted refinements and gauge representatives; use conjugate transpose
for the ∗ law. ([AK] Theorem 4, §1.7, pp. 9–10; Theorem 7 and proof of Theorem 4, §10, pp. 24–25.)

*Needs:* §6.19, §6.18, AlgebraicTopology Stage 2, §6.16.

### Examples

For the one-variable datum A = 0, B = 1, z = 1/2 the Hessian Λ = −B⁻¹A + diag(1/(1 − z)) is 2. At b =
1 the parameter ℏ = (b + b⁻¹)⁻² is 1/4. The regular shaped tetrahedron has angles π/3 and charges
1/6, and a level shift by 8ℏ multiplies the Andersen–Kashaev integral by e^(2πi) = 1. For the
figure-eight knot, the one-loop-normalised series of [GZ] begins
3^(−1/4)(1 + 11h/(72√−3) + ⋯); the [GSW] formal series of §6.2 has constant coefficient 1.

### Dependencies

Layer 5; HabiroNahmSeries HB.4, HB.8 and HB.9; HabiroNumberFields HB.6 and HB.7; K3BlochGroups V.3;
Polylogarithms P.1; QSeriesPartitionsAndMockModularForms QM.0; SelfAdjointSpectralTheory Parts B–E;
Mathlib `SchwartzMap`, `TemperedDistribution`, `MeasureTheory.integral`.

## Layer 7: quantum modularity and the knot examples

The Kashaev function of a knot on the rationals is conjectured by Garoufalidis and Zagier to be a
quantum modular form of weight 3/2 whose period functions are governed by the perturbative series of
Layer 6, and the conjecture extends to a matrix of series indexed by the boundary-parabolic
representations, with a matrix-valued cocycle. Bettin and Drappeau prove the scalar statement for
ten hyperbolic knots. This layer states the conjectures with their exact normalisations and domains,
proves the algebraic parts that are unconditional (the denominator cocycle, the composition law of
the matrix cocycle under invertibility, the figure-eight descendants and their recurrence), records
the proved cases, and collects the two running examples.

### 7.1 Proved quantum modularity cases

Bettin–Drappeau prove positive-q modular asymptotics for the ten hyperbolic knots
4₁,5₂,6₁,6₂,6₃,7₃,7₄,7₅,7₆,7₇ (7₂ is excluded). Write J⁺_K(x)=J^red_(K,c)(exp(2πix)), c=den(x). For
γ with α=γ∞∈ℚ and h=2πi/(x−γ⁻¹∞), for every M and rational x→+∞ of bounded denominator:
J⁺_K(γx)/J⁺_K(x)=(2π/h)^(3/2)exp(i(Vol−iCS)/h)C_K(α)(Σ_(0≤n<M)D_(K,n)(α)h^n+O(h^M)). The error
constant depends on α, the denominator bound and M; D_(K,n)∈F_K(e(α)); C=e(ν_K
s(α)/2)c^(ν_K/2)Λ_(K,α)^(1/c)δ_K^(−1/2), with Λ in that field and δ in F_K. Branches are those of
[BD]. Its positive-q convention is compared explicitly with the negative-q coloured Jones convention
of [GZ] before identifying phases; the general matrix refinements are not proved by this theorem.

*Proof sketch.* Use the exact reciprocity formula for finite Pochhammer symbols of [BD] §2, with
holomorphic error terms and prescribed branches. Insert each of the ten explicit knot sums, and use
the all-orders stationary-phase theorem of [BD] §3 with its arithmetic description of the
coefficients; the uniform error estimates are part of the proof, not assumptions. Identify the field
and the Dedekind/Gauss constants; the table of [BD] Figure 1 names 5₁ where the hyperbolic 5₂ is
meant (correction 7). ([BD] Theorem 1, §1, p. 2; reciprocal Pochhammer and knot proofs in §§2–3, pp.
8–30.)

*Needs:* §2.15, §5.11, Polylogarithms P.1, HabiroNahmSeries HB.4,
QSeriesPartitionsAndMockModularForms QM.0.

### 7.2 The conjectural asymptotic expansion, its normalisation, and the field its coefficients lie in

The formal geometric series of [GSW] (§6.3) exists and is invariant under its hypotheses, with
coefficients in the invariant trace field. The normalised perturbative series of [GZ] additionally
includes a one-loop square root, an eighth-root phase and the complex-volume exponential; the
normalization comparison is explicit. The Kashaev all-orders analytic expansion is conjectural in
general and proved only in the separately cited families. For 4₁ the series of [GZ] begins
3^(−1/4)(1+11h/(72√−3)+697h²/(2(72√−3)²)+⋯). For 5₂ use ξ³−ξ²+1=0 with Im ξ<0 and the prefactor
ζ₈/√(3ξ−2). These formal coefficients do not supply an error bound by themselves. At primitive order
k the geometric input is the root-refined series of §6.6, with the finite cyclic average and
one-loop factor above. Its matching with the refined Gaussian collection of HabiroNahmSeries HB.8 is
a normalisation comparison under the integral and parity hypotheses, not mere evaluation of the k=1
series.

*Route.* Construct the formal coefficients by [GSW], with constant term 1. Record the one-loop
prefactors of [GZ] and fix a lift of complex volume. For an analytic conclusion use only a
separately scoped proved theorem or explicitly mark the conjecture. ([GZ] §1, equations (1.3)–(1.4),
pp. 9–10; §2.2, pp. 12–14.)

*Needs:* §6.3, §5.11, §6.8, §7.1, §6.7.

**Checks.**

- The constant term of the figure-eight series is 3^(−1/4), the one-loop factor; dropping it changes
  every coefficient comparison.
- For 5₂ the branch Im ξ < 0 of ξ³ − ξ² + 1 = 0 is the geometric one; the other complex root gives
  the conjugate series.

### 7.3 What a formal expansion establishes and what it does not

A formal series is an element of a coefficient ring [[h]], with no domain or error estimate.
Analytic all-orders asymptotics requires a limit domain, a branch and, for every truncation M, an
O(h^M) remainder with the stated uniformity. [GSW] supplies formal invariance; [AK] supplies the
analytic leading limits for the two selected knots; [BD] supplies all-orders modular asymptotics in
bounded denominators for its ten knots. The general refinements of [GZ] remain conjectural. No
number of computed coefficients or saddle-point equations upgrades a formal series to such a
theorem.

*Route.* Compare the conclusions of the sources and their remainder hypotheses. Expose the contour,
branch and uniformity whenever an analytic statement is used. Label coefficient computations and
conjectural identifications separately. ([GSW] §1, pp. 2–5; Theorem 1.1, p. 4.)

*Needs:* §6.2, §6.14, §7.1.

**Checks.**

- The formal series of the figure-eight knot, 3^(−1/4)(1 + 11h/(72√−3) + …), carries no error term.
  That it governs the modular asymptotics of the Kashaev function is the conjecture of §7.5; [BD]
  proves the all-orders asymptotics of the ratio J⁺(γx)/J⁺(x) for 4₁ in its positive-q
  normalisation.

### 7.4 Representation-indexed knot series

For a knot with a finite set P_K of isolated boundary-parabolic SL₂(ℂ) representations (including
the trivial σ₀), fix their branches, complex-volume representatives Vσ and perturbative
normalizations. The geometric σ₁ and conjugate geometric representation are distinguished. Define
κσ₀=3/2 and κσ=0 otherwise, and the selected series Φ_ασ(h), with Jσ(α)=Φ_ασ(0), α∈ℚ/ℤ. The trivial
series is the rootwise Taylor series of the knot Habiro element in the chosen q=e(α)e^(−h)
convention; nontrivial series use a qualified formal NZ datum and its one-loop normalization. For 4₁ |P|=3
and for 5₂ |P|=4. General well-definedness for all representations and triangulations is a further
comparison target, not the geometric theorem of [GSW].

*Construction.* Use the rootwise Taylor maps of HabiroCyclotomicCompletions Layer 3 for the trivial
branch. Extract the selected nontrivial stationary points and finite representation index from the
knot data. Compare each formal NZ normalization and field; require isolated nondegenerate input
rather than a bare representation label. ([GZ] §§2.1–2.2, pp. 11–15; §3.1, pp. 15–16.)

*Needs:* §2.15, §6.3, §7.2, HabiroCyclotomicCompletions Layer 3 (the Taylor map, 3.1),
HabiroCyclotomicCompletions Layer 3 (p-adic re-expansion, 3.3).

The API:

- `KnotPerturbativeFamily`: The finite representation index, volumes, weights, branches and
  normalized series.
- `representationWeight`: 3/2 on the trivial representation and zero elsewhere.
- `generalizedKashaev`: The constant term Jσ(α) of a supplied normalized series.
- `trivialSeries_Taylor`: The trivial series uses the exact rootwise Habiro Taylor convention.

**Checks.**

- `representationWeight_trivial`: κσ₀=3/2 and Vσ₀=0.
- `representationIndex_41`: The selected figure-eight family has three representations.
- `representationIndex_52`: The selected 5₂ family has four representations.
- `nonisolated_representation`: A nonisolated or degenerate stationary point is not an input to the
  declared one-loop formal formula.

### 7.5 The conjecture, with its exact normalisation and its domain

*Conjecture* ([GZ], quantum modularity): for γ=(a b;c d)∈SL₂(ℤ), c>0, X→+∞ through rationals with
bounded denominator, J_K(γX)∼(cX+d)^(3/2) J_K(X) Φ̂_(a/c)^geo(2πi/[c(cX+d)]). Here the completed
geometric series is exp(Vgeo/[den(α)²h])Φ_α^geo(h), with the specified volume representative,
one-loop phase and q convention. The relation means an all-orders asymptotic expansion, not equality
of rational functions or pointwise convergence of the formal series: with h_γ(X)=2πi/[c(cX+d)] and
A(X) the full prefactor, for every bound B on denominators and every M there are C and N such that |J_K(γX)
− A(X)J_K(X)Σ_(n<M)φ_n h_γ(X)^n| ≤ C|A(X)J_K(X)h_γ(X)^M| for all rational X ≥ N with den(X) ≤ B.
Only truncations of the formal series are evaluated, and nothing is divided by a value of J_K that
might vanish. The positive-q Bettin–Drappeau theorem is a separately normalized proved
specialization for its ten knots, requiring the explicit q-conjugation comparison.

*Route.* Fix the q and complex-volume conventions of [GZ] and the transformation with c > 0. Define
each truncation and its bounded-denominator O-error criterion. State the conjecture on the domain of
[GZ]; keep the proved positive-q cases separate. ([GZ] §1, equations (1.5)–(1.6), pp. 10–11.)

*Needs:* §2.15, §7.4, §5.11.

**Checks.**

- γ = T = (1 1; 0 1) has c = 0 and is outside the conjecture; for it the exact statement is the
  1-periodicity of §2.15.
- For γ = S and X = N the leading exponential is the Kashaev volume conjecture §7.6.

### 7.6 Kashaev volume conjecture

*Conjecture.* For a hyperbolic knot K⊂S³, put ⟨K⟩_N=J^red_(K,N)(exp(2πi/N)), with dimension N and
zero framing, reduced before root evaluation. The volume conjecture is
lim_(N→∞)(2π/N)log|⟨K⟩_N|=Vol(S³∖K). It is conjectural for general K. With the unknot/reduced and
negative-q conventions compared, γ=S sends X=N to −1/N in the quantum modular conjecture and
recovers this leading exponential assertion. The volume assertion is weaker than the all-orders
expansion of §7.5. The decay limit of §6.14 concerns a different analytic invariant and does not
prove this growth statement. The theorem of [BD] (§7.1) gives the stronger modular asymptotics, in
the positive-q normalisation, for its ten knots.

*Route.* Use the Kashaev/colored-Jones comparison to fix the finite-N invariant. Formulate the
logarithmic limit with the positive primitive root and complete volume. Take the leading exponential
of the S specialization only after checking the rational q and mirror/conjugation comparison. ([AK]
§1.9, p. 11, volume-conjecture qualification following Conjecture 1; [GZ] §1, equations (1.1),
(1.5)–(1.6), pp. 9–11.)

*Needs:* §2.15, §7.5.

### 7.7 Denominator cocycle

For γ=(a b;c d)∈PSL₂(ℤ), x=r/s∈ℚ in lowest terms with s>0 and cr+ds≠0, set λγ(x)=c/[s(cr+ds)]. It is
independent of the sign of the matrix representative. Whenever γ′x and γγ′x are finite,
λ_(γγ′)(x)=λγ(γ′x)+λγ′(x). The corresponding diagonal twist exp(Ṽσ λγ(x)), Ṽσ=Vσ/(2πi), combines
with |cx+d|^κσ to give the tweaked automorphy factor of [GZ]. The rational pole exclusions are part
of the domain. With κσ₀=3/2 and κσ=0 otherwise, the diagonal matrix
j̃γ(x)=diag_σ(exp(Ṽσλγ(x))|cx+d|^κσ) has nonzero entries, satisfies j̃_(γγ′)(x)=j̃γ(γ′x)j̃_(γ′)(x)
on the common pole-free domain, and is unchanged when γ is replaced by −γ; because it is diagonal,
the reversed order of the product in [GZ] (4.15) is harmless.

*Construction.* Use the determinant-one relation to compute reduced numerator/denominator under γ.
Prove the displayed rational identity by clearing its nonzero denominators. In the proof of [GZ]
Lemma 3.1 subtract the second fraction, rather than adding it as printed (see Corrections to the
sources), before composing the diagonal factors. ([GZ] §3.1, equation (3.5) and Lemma 3.1, p. 16.)

*Needs:* §7.4, QSeriesPartitionsAndMockModularForms QM.5 (quantum modular cocycle).

*Lean:* `denominatorCocycle`, `mobius`, `denominatorCocycle_mul`, `denominatorCocycle_neg`.

The API:

- `denominatorCocycle`: λγ(x) on the declared pole-free rational domain.
- `denominatorCocycle_comp`: The additive composition identity with both pole exclusions.
- `tweakedAutomorphy`: The diagonal exp(Ṽσλγ)|cx+d|^κσ.
- `tweakedAutomorphy_comp`: The factors compose on the common pole-free domain.

**Checks.**

- `lambda_T`: For T=(1 1;0 1), λ_T(x)=0.
- `lambda_S_one`: For S=(0 −1;1 0), λ_S(1)=1.
- `lambda_S_zero`: x=0 is excluded from λ_S because Sx is infinite.
- `lambda_sign`: γ and −γ give the same λ.

### 7.8 Generalized quantum modularity

*Conjecture* ([GZ], generalised quantum modularity): for every supplied representation σ, γ=(a b;c
d), c>0, and rational X→+∞ with bounded denominator, (cX+d)^(−κσ)
exp(−Ṽσλγ(X))Jσ(γX)∼Jσ(X)Φ̂_(a/c)^geo(2πi/[c(cX+d)]). For the trivial σ it is §7.5; nontrivial σ has
weight zero but retains its complex-volume twist. All-orders error statements are analytic
conjectures, in the same uniform form as §7.5; neither the formal series nor the cocycle identity
proves them. For c>0, cX+d is eventually positive, so the real power |cX+d|^κσ has the branch used
in [GZ].

*Route.* Substitute the exact index, weight and denominator twist. Check σ₀ reduction before
allowing any nontrivial representation. Keep the all-orders remainder as the precise conjectural
acceptance criterion. ([GZ] §3.1, equation (3.6), p. 16.)

*Needs:* §7.5, §7.7.

### 7.9 Lift to knot power series

*Conjecture* ([GZ] §3.2): put ℏ=h/(2πi), x=X−ℏ and h∗=h/[(cx+d)(cX+d)]. The generalized value
relation lifts coefficientwise to
(cX+d)^(−κσ)exp(−Ṽσλγ(X))Φ_(γX)^σ(h∗)∼Φ_X^σ(h)Φ̂_(a/c)^geo(2πi/[c(cx+d)]). In completed scalar
normalization this is Φ̂_(γX)^σ(h∗)∼(cx+d)^(−κσ)Φ̂_X^σ(h)Φ̂_(a/c)^geo(2πi/[c(cx+d)]). Formal
coefficients in h each have their own all-orders 1/X assertion; one must not differentiate a
rational-point asymptotic statement as if it were a smooth function.

*Route.* Compute γx=γX−h∗/(2πi) exactly. Expand the transformed infinitesimal coordinate
coefficientwise. Cancel the denominator/volume factors and recover the value statement at h=0;
compare the conflicting matrix weight sign (see Corrections to the sources). ([GZ] §3.2, equations
(3.9), (3.12)–(3.13), pp. 17–18.)

*Needs:* §7.8, HabiroCyclotomicCompletions Layer 3 (the Taylor map, 3.1),
HabiroCyclotomicCompletions Layer 3 (p-adic re-expansion, 3.3).

### 7.10 Quadratic relations of knot series

*Conjecture* ([GZ]): Σ_(σ∈P_K∖{σ₀})Φ_ασ(h)Φ_(−α)^σ(−h)=0, with the chosen phases and representation
index. It excludes the trivial representation. For 4₁ the identity follows formally from
Φ_α^anti(h)=iΦ_(−α)^geo(−h). For 5₂ the nontrivial relation is supported by the computations of
[GZ], not a general theorem; its arithmetic trace interpretation must use the same embeddings and
phase.

*Route.* Form the coefficientwise quadratic expression with the actual field embeddings. Prove the
selected 4₁ cancellation using i²=−1. State the 5₂ and general relation as conjectural, recording
finite coefficient checks only as experiments. ([GZ] §3.3, equation (3.14), pp. 18–19.)

*Needs:* §7.4.

### 7.11 Knot coefficient asymptotics

*Conjecture.* The experimental large-n expansion of [GZ] couples A_ασ(n)=[h^n]Φ_ασ to all other
representations through Γ(n−ℓ+κσ)/(Vσ−Vσ′)^(n−ℓ+κσ), an integer matrix M_K and a phase-dependent
prefactor. The printed equation (3.18) uses (2π)^(κσ−1) and M₄₁=((0,1,−1),(0,0,−3),(0,3,0)); its
phase must be reconciled with the adjacent coupled formulas containing 1/(2πi) (see Corrections to
the sources). The selected figure-eight asymptotic conjecture is equation (3.16):
A(n)∼(3/(2π))Σ_ℓ(−1)^ℓ A(ℓ)(n−ℓ−1)!/(2Vgeo)^(n−ℓ). Distinct action differences, branches and
truncation meanings are required. These are conjectural knot statements; general resurgence and
Borel summation are outside this roadmap.

*Route.* Separate the observed finite coefficients from a large-n theorem. Fix action branches and
inspect the phase against the explicit coupled figure-eight equations. For each truncation state the
error criterion; do not infer a theorem from numerical agreement. ([GZ] §3.4, equations
(3.16)–(3.18), pp. 20–22; the phase discrepancy is listed under Corrections to the sources.)

*Needs:* §7.4, §7.10.

### 7.12 Matrix refined quantum modularity

*Conjecture.* [GZ] supplies selected square matrices Φ_α^(σ,σ′)(h) and J(α)=Φ_α(0), indexed by P_K,
with row-wise completions (den(α)h/(2πi))^κσ exp(Vσ/[den(α)²h]). Its refined matrix quantum
modularity conjecture asserts Φ̂_(γX)(h∗)≈jγ(x)Φ̂_X(h)Φ̂_(a/c)(2πi/[c(cx+d)]), x=X−h/(2πi),
h∗=h/[(cx+d)(cX+d)], for bounded-denominator X→+∞ and c>0. This is conjectural, and its
normalisation needs a comparison: the printed positive row-weight factor must be reconciled with the
scalar completed negative factor in equation (3.13), before transporting a single convention.
General matrix invertibility, topological well-definedness and analytic completion are not
consequences of the scalar theorem of [GSW].

*Route.* Use the selected 4₁ and 5₂ descendant rows to specify the entries, rather than posit an
arbitrary matrix invariant. Test the trivial/geometric entry against the scalar lift and resolve its
sign discrepancy. Expose invertibility, exponential ordering and all-orders coefficientwise errors
as separate conjectural targets. ([GZ] §4.5, equations (4.12)–(4.14), pp. 28–30; the weight
discrepancy is listed under Corrections to the sources.)

*Needs:* §7.9, §7.10, §7.11.

### 7.13 Knot matrix cocycle

Given the selected knot matrix J(x) with invertible values and a diagonal tweaked factor j̃
satisfying j̃_(γγ′)(x)=j̃γ(γ′x)j̃γ′(x), set Wγ(x)=J(γx)⁻¹j̃γ(x)J(x) on the common rational pole-free
domain. Then W_(γγ′)(x)=Wγ(γ′x)Wγ′(x) is a proved algebraic identity under these explicit
hypotheses. The general invertibility and unimodularity asserted in [GZ] are conjectural, so the
unconditional knot theorem requires that separate comparison. This roadmap owns the selected knot
matrices, this comparison and the matrix-valued cocycle notion itself, which
QSeriesPartitionsAndMockModularForms QM.5 states only for scalars: a function W from PSL₂(ℤ) to
GL_n-valued functions on the rationals, defined off the finite pole set of each γ, with W_(γγ′)(x) =
Wγ(γ′x)W_γ′(x) where both sides are defined.

*Construction.* Use the matrix-valued cocycle notion just stated. Multiply the matrices in order and
cancel J(γ′x)J(γ′x)⁻¹. For a knot-specific application establish J invertibility first; diagonal
commutation justifies reversing the order of [GZ] for j̃. ([GZ] §5 introduction, equations
(5.1)–(5.3), pp. 30–31.)

*Needs:* §7.7, §7.12, QSeriesPartitionsAndMockModularForms QM.5 (quantum modular cocycle).

*Lean:* `knotMatrixCocycle`, `knotMatrixCocycle_mul`.

The API:

- `knotMatrixCocycle`: The stated conjugated automorphy factor on its domain.
- `knotMatrixCocycle_comp`: The ordered multiplicative cocycle identity under invertibility.
- `knotMatrixCocycle_id`: The identity group element gives the identity matrix.

**Checks.**

- `matrixCocycle_constant`: J=I and j̃=I give W=I.
- `matrixCocycle_noncommutative_order`: The composition multiplies Wγ(γ′x) before Wγ′(x).
  With A=[[1,1],[0,1]] and B=[[1,0],[1,1]], AB=[[2,1],[1,1]] whereas
  BA=[[1,1],[1,2]]. For j̃=I, take J(x)=I, J(γ′x)=B⁻¹ and
  J(γγ′x)=(AB)⁻¹ at three distinct points: the two factors are A,B and the composite is AB.
- `matrixCocycle_singular_J`: A singular J(x) does not define a GL-valued W by this formula.

### 7.14 Analytic extension of the knot cocycle

*Conjecture* ([GZ]): Wγ on ℚ∖{γ⁻¹(∞)} extends real analytically to ℝ∖{γ⁻¹(∞)}. For c≠0 the
exceptional point is −d/c. The restriction to (−d/c,∞) extends holomorphically to ℂ∖(−∞,−d/c], and
the restriction to (−∞,−d/c) extends holomorphically to ℂ∖[−d/c,∞). For c=0 there is no finite
exceptional point. The refined conjecture §7.12 further predicts Wγ(X)≈Φ̂_(a/c)(2πi/[c(cX+d)])⁻¹ for
c>0. Algebraic composition and formal inverses do not prove any analytic extension. The
matrix-valued cocycle notion is §7.13; the scalar holomorphic quantum modular notions are
QSeriesPartitionsAndMockModularForms QM.5.

*Route.* Specify the exceptional point and the cut of [GZ] for each transformation. Prove continuity
and analyticity for the selected knot kernels if available; otherwise retain the conjecture. Only
after extension transport the rational composition identity by continuity. ([GZ] §5.2, Conjecture
5.1 and conditional Proposition 5.2, pp. 34–37; §5.4, pp. 40–42; both cut planes specified on p. 7.)

*Needs:* §7.13, §7.12, QSeriesPartitionsAndMockModularForms QM.5, Mathlib `MeasureTheory.integral`,
Mathlib `Complex.integral_boundary_rect_eq_zero_of_differentiableOn`.

### 7.15 Figure-eight Habiro descendants

For m∈ℤ define H_m(q)=Σ_(n≥0)(q;q)_n(q⁻¹;q⁻¹)_n q^(mn) in the integral ordinary Habiro ring. Laurent
monomials q^(mn) cause no denominator problem because q is a unit; the summands are cofinally
factorial-divisible. The exact recurrence is q^(m+1)H_(m+1)+(1−2q^m)H_m+q^(m−1)H_(m−1)=1. H₀ is the
figure-eight Kashaev element, and the first descendant matrix row is (1,H₀,½(qH₁−q⁻¹H₋₁)); the last
entry is in ½ times the integral Habiro ring. Its Taylor coefficient of (q−1)² is −½, so it is not
an element of the integral ℤ-Habiro ring. [GZ] asserts integrality only for 2Q₂. Nontrivial matrix
rows involve the selected shape-field branches and are not ordinary integral Habiro elements by this
formula alone.

*Construction.* Construct the sum using the factorial-series convergence of
HabiroCyclotomicCompletions Layer 2 and the invertibility of q in the Habiro ring. Telescope the
shifted summands to prove the inhomogeneous recurrence in every finite quotient, then pass to the
inverse limit. Specialize at roots by truncating at their order. For Q₂=½(qH₁−q⁻¹H₋₁), the n=0
summand is (q−q⁻¹)/2=(q−1)−(q−1)²/2+⋯; every n≥1 summand has order at least 3. This detects its
coefficient-ring localization. ([GZ] §7.1, pp. 52–56, descendant sums and recurrence.)

*Needs:* §2.15, HabiroCyclotomicCompletions Layer 1 (the cyclotomic completion, 1.4),
HabiroCyclotomicCompletions Layer 2 (factorial series, 2.1), HabiroCyclotomicCompletions Layer 3
(root evaluation, 3.1).

*Lean:* `figureEightDescendantTrunc`, `figureEightDescendantTrunc_recurrence`.

The API:

- `figureEightDescendant`: The integral Habiro series H_m for every integer m.
- `figureEightDescendant_recurrence`: The displayed inhomogeneous three-term recurrence.
- `figureEightDescendant_eval`: At a root of order N only n<N contribute.
- `figureEightDescendant_firstRow`: The trivial row (1,H₀,Q₂) in the scalar extension by ½, with 2Q₂
  integral; Q₂ is not in the integral ℤ-Habiro ring.

**Checks.**

- `descendant_root_one`: ev₁H_m=1 for every m.
- `descendant_root_minus_one`: ev₋₁H_m=1+4(−1)^m.
- `descendant_root_three`: For a primitive cube root ζ, evζH₀=13.
- `descendant_recurrence_root_one`: At q=1 the recurrence gives 1−1+1=1.
- `descendant_half_row_not_integral`: The Taylor coefficient of (q−1)² in Q₂ is −½; an
  implementation placing this matrix entry in the integral ℤ-Habiro ring contradicts its Taylor map.

### 7.16 The Andersen–Kashaev comparison conjecture

*Conjecture* ([AK], for a hyperbolic knot K in a closed oriented compact 3-manifold M): there is a
smooth J_(M,K)(ℏ,x) on ℝ_>0×ℝ. (1) Every fully balanced positive ideal triangulation X of M∖K has a
gauge-invariant real linear angle form λ and a real quadratic angle form φ with Z_ℏ(X)=exp(iφ/ℏ)∫ℝ
J_(M,K)(ℏ,x)exp(−xλ/√ℏ)dx. (2) For any positive one-vertex H-triangulation Y approachable by weights
tending to τ(K)=0 and τ(other edges)=2π, there is a real quadratic angle form ϕ such that lim_(ω→τ)
Φ_b((π−ω(K))/(2πi√ℏ))Z_ℏ(Y)=exp(iϕ/ℏ−iπ/12)J_(M,K)(ℏ,0). (3) lim_(ℏ→0+)2πℏ
log|J_(M,K)(ℏ,0)|=−Vol(M∖K). All relevant existence, convergence and limiting conditions are part of
the conjecture. [AK] Theorem 5 proves its three parts for (S³,4₁) and (S³,5₂), using χ₄₁ and χ₅₂.
The general analytic/formal NZ identification additionally needs matched saddle, logarithmic
branches, classical action, one-loop determinant and all-orders error estimates; no such universal
comparison follows from formal Pachner invariance.

*Route.* State the three conjectural comparisons separately from the proved invariance §6.20. For
the two selected knots use the explicit χ calculation and the qualified steepest-descent target,
keeping its unit-modulus phase. For any proposed NZ comparison match the actual contour-selected
saddle and classical/one-loop normalization before claiming agreement, then require uniform
all-orders asymptotic control. ([AK] Conjecture 1 and Theorem 5, §1.9, p. 11.)

*Needs:* §6.20, §6.13, §6.14, §6.2.

### 7.17 The comparisons with the Habiro rings that are proved, and the ones that are not

Three precise interfaces connect this roadmap to the Habiro roadmaps: integral knot coefficients and
unified invariants of integral homology spheres use HabiroCyclotomicCompletions Layers 1–4; the
explicit figure-eight descendant H_m supplies new elements of the ordinary Habiro ring via
HabiroCyclotomicCompletions Layer 2; and integral Nahm data obtained from Neumann–Zagier data (§6.4)
use HabiroNahmSeries HB.8 and HB.9 and HabiroNumberFields HB.6 and HB.7 for a K₃-indexed module. The
knot-specific constructions and topological comparisons are made here. Neither formal asymptotics
nor root values alone prove completion membership. Wheeler’s two-variable relative-Habiro theorem
[Whe] is outside this roadmap; it would build on Layer 2 here, HabiroRings Layers 1 and 5 and
GeometricTopology Layer 4's Alexander polynomial.

*Route.* Distinguish the ordinary ring, relative ring and K₃-indexed module targets. Use the
completions and the formal Gaussian theory of those roadmaps unchanged. Keep the exact topological
identification and the example descendants here. ([GZ] §7.1, pp. 52–56, descendant Habiro-like
functions.)

*Needs:* §2.7, §3.4, §7.15, §6.8, HabiroCyclotomicCompletions Layer 1 (the cyclotomic completion,
1.4), HabiroCyclotomicCompletions Layer 2 (factorial series, 2.1).

**Checks.**

- H₀ of §7.15 is an element of the integral Habiro ring, while Q₂ = ½(qH₁ − q⁻¹H₋₁) is not.
- The formal series of §6.2 is not by itself an element of any Habiro module; membership is the
  content of §6.8.

### 7.18 Worked example: the figure-eight knot and the knot 5₂

The ledger records, for each knot, the exact root, normalisation, representation and shape-field
data of every output, together with the status of that output: *proved* (a theorem of a cited
source, planned here), *imported* (a theorem of another roadmap), *computed* (an exact finite
computation), *numerical* (floating-point evidence only) or *conjectural*. An empty cell means that
no checked output exists; it never means zero or agreement.

| Datum | 4₁ | 5₂ |
| --- | --- | --- |
| Cyclotomic coefficients | a_n = 1 for all n, so H₀ = Σ (q;q)_n(q⁻¹;q⁻¹)_n (computed) | empty |
| Kashaev values | orders 1–6: 1, 5, 13, 27, 46+2√5, 89 (computed); the other order-five embedding gives 46−2√5 | order 2: absolute value 7 = det(5₂) (computed) |
| Values at roots | at q=e^(2πi/5), 44 − 4q² − 4q³ = 46 + 2√5 (computed); at q² it is 46−2√5 | empty |
| Shape field and Bloch class | ℚ(√−3), ordinary class 2[e^(πi/3)] (computed) | ℚ(ξ), ξ³ − ξ² + 1 = 0, Im ξ < 0 (computed); no class computed |
| Volume | decay limit of the [AK] integral g₂ (proved) | decay limit of the [AK] integral g₃ (proved) |
| Asymptotic series | geometric formal invariance [GSW] and positive-q modular asymptotics [BD] (proved); matrix and cocycle refinements conjectural | the same statuses on the 5₂ branches |

The [AK] limits are lim 2πℏ log|g_n| = −Vol as b → 0⁺, with the contour and phase of §6.13. [BD]
uses positive q, principal logarithms and bounded-denominator x → +∞; its cubic τ³ − τ + 1 = 0, Im τ >
0, is related to ξ by τ=ξ⁻¹: both satisfy their stated cubics and the indicated imaginary signs.
Their one-loop discriminants satisfy 3τ−2τ²=(3ξ−2)/ξ²; square-root phases still require their
specified branch choices. [GSW] is a formal statement. Neither a torus knot nor a
singular gluing solution satisfies the hyperbolic and nondegenerate hypotheses of these theorems;
they are non-examples, not failed instances.

*Construction.* Use exact arithmetic and the source branches for the finite values and shape fields;
record for each analytic output the theorem that proves it. ([GZ] §1, equations (1.3)–(1.4), pp.
9–10; [AK] Theorem 5, p. 11; [BD] Theorem 1, p. 2; [GSW] Theorem 1.1, p. 4.)

*Needs:* §2.15, §5.12, §6.14, §7.1, §7.12.

The API:

- `LedgerStatus`: the five labels proved, imported, computed, numerical, conjectural.
- `LedgerColumn`: the six data columns of the table.
- `LedgerEntry`: an output with its source target and its status.
- `ledgerRows`: the two rows, for 4₁ and for 5₂.

**Checks.**

- `ledger_figureEight_row`: the Kashaev column of the 4₁ row reproduces 1, 5, 13, 27, 46+2√5, 89.
- `ledger_status_consistent`: no output produced by a conjectural target is labelled proved.
- `ledger_traceField`: the shape field of 4₁ is ℚ(√−3) and that of 5₂ is the cubic field of ξ³ − ξ² + 1.
- `ledger_empty_column`: a cell that cannot be filled is empty, not a claim of agreement.
- The order-two Kashaev value of each knot is the absolute value of its determinant: 5 for 4₁ and 7
  for 5₂, since the reduced Jones polynomial at t = −1 is ± det.

### Examples

For T = (1 1; 0 1), λ_T = 0; for S = (0 −1; 1 0), λ_S(1) = 1 and 0 is excluded from the domain of
λ_S. The figure-eight descendants satisfy ev₁H_m = 1, ev₋₁H_m = 1 + 4(−1)^m and, at a primitive cube
root, ev H₀ = 13. The volume conjecture for 4₁ predicts (2π/N) log⟨4₁⟩_N → 2.0298832…

### Dependencies

Layers 2, 5 and 6; HabiroCyclotomicCompletions Layers 1–3; QSeriesPartitionsAndMockModularForms QM.0
and QM.5; Polylogarithms P.1; HabiroNahmSeries HB.4.

## Downstream consumers

- **HabiroCyclotomicCompletions** uses the Ohtsuki series and the unified invariant (Layer 4) as the
  motivating example of its Taylor rigidity theorems.
- **HabiroNahmSeries** uses the Neumann–Zagier data, the formal state integral and the Habiro-module
  comparison of Layer 6, and the Bloch classes of Layer 5, as its geometric source of Nahm data.
- **K3BlochGroups** uses the geometric Bloch classes of Layer 5 as examples of its comparison maps.
- **Polylogarithms** shares the cross-ratio convention of §5.1 with its volume formula.
- **QSeriesPartitionsAndMockModularForms** uses the unified invariant and the WRT invariants of
  Layers 3–4 in its comparison of Habiro evaluations with radial limits of Eichler integrals.

## Corrections to the sources

The following misprints and errors in the sources are corrected where the targets above use them.

1. [Hab08] §6.2, p. 21, proof of Theorem 6.4: the final coefficient should be a_m(T), not the bound
   summation index a_p(T).
2. [Hab08] §12.1, p. 39, proof of Proposition 12.1: in the connected-sum calculation the second
   factor is τ_ζ(M′), not a repeated factor for M.
3. [HL] §3.1, equation (55), p. 37: commuting K_β past F_α gives v^(−(β,α)) F_α K_β; the printed
   right-hand side has E_α.
4. [HL] §8.4.2, equation (180), p. 92: the surgery normalisation divides by J_(U₊)(Ω)^(σ₊)
   J_(U₋)(Ω)^(σ₋), with the two signs kept distinct.
5. [HL] Appendix C, Corollaries C.6 and C.8, p. 117: the admissible conditions are the complements
   of the listed vanishing conditions, since strong Kirby colours need nonzero Gauss sums.
6. [GSWZ] §1.7, equations (34)–(35), p. 13: the product factor is z_i(t)^(A_ij), with the varying
   index i.
7. [BD] §1, Figure 1, p. 2: the five-crossing hyperbolic knot is 5₂, not the torus knot 5₁.
8. [AK] §12, p. 32: the identifications carry unit phases, χ₄₁(0) = ζ_inv⁻¹ g₂(ℏ) and χ₅₂(0) =
   e^(−iπ/3) g₃(ℏ); the volume limits are unchanged.
9. [AK] §12, pp. 32–34: the contour deformation and steepest-descent argument need pole-free
   deformation, vanishing estimates on the connecting ends, uniform small-b convergence near the
   saddle and uniform tail bounds; these are part of §6.14.
10. [Saw] §6, Theorem 3, p. 24: the finite-free category is a ribbon category, but it is not abelian
    over the ring A′ as asserted (multiplication by a nonzero nonunit on the rank-one free module
    has zero kernel and cokernel in that category without being invertible).
11. [GZ] §3.1, proof of Lemma 3.1, p. 16: the second fraction is subtracted, not added; the lemma
    itself is correct.
12. [GZ] §3.4, equation (3.18), pp. 20–21: the phase of the general coefficient-asymptotic prefactor
    is inconsistent with the coupled figure-eight formulas (3.15)–(3.16); equation (3.16) is used as
    the normalisation test.
13. [GZ] §4.5, equations (4.12)–(4.13), p. 30: the matrix completion uses a positive row weight
    where the scalar completed lift (3.13), p. 18, has the negative one; the convention must be
    reconciled before an entrywise comparison.
14. [HL] §8.3.2, p. 91: the root-lift exponent is 1/D, so that v^(1/D) = ζ gives q = ζ^(2D) = ξ.
15. [AK] §1.7, Theorem 4, equation (5), p. 9: the linear term uses α₂ and the denominator shift α₀,
    with α_i = α(∂_i∂₀T)/π; Layer 6 uses the charged kernel form instead.
16. [MM] §5, p. 15: in the connected-sum formula the first factor is for K₁.
17. [DG2] §2.1(a), p. 5: only (A | B) of full rank with ABᵀ symmetric is required in general;
    invertibility of B, and integral invertibility for the root construction, are extra
    restrictions.
18. [DG2] §2.1, p. 5: the actual Kummer Galois group is a subgroup of (ℤ/k)^N, not the whole
    product; multiplicative relations among shapes constrain the root rotations.
19. [DG2] §2.3, equations (19)–(21), pp. 6–7: the unscaled block has a nonunit constant and omits
    the cubic vertices; the degree-filtered rescaling of §6.6 is used.
20. [DG2] §3.2, Lemma 3.3(d), p. 14: the prefactor is (−1)^(k(k−1)/2) ζ^(k(k−1)(2k−1)/6)
    x^(k(k−1)/2), and in the proof each (−ζx)^s is (−ζ^s x)^s.
21. [DG2] §3.3, proof of Theorem 2.2, pp. 14–16: the coordinate formula keeps the parity sign
    (−1)^((B⁻¹ν)_j).
22. [Hab08] §12.2, proof of Proposition 12.3, p. 40: the Bézout congruence uses u_i(q), not u_q(q).
23. [AK] Appendix B, §14, Theorem 8, p. 38: the local wavefront product condition does not ensure
    that the product of two tempered distributions is tempered. The local D′ product and the
    additional global continuity condition are separated in §6.16, with a smooth counterexample.

## References

- [Hab08] K. Habiro, *A unified Witten–Reshetikhin–Turaev invariant for integral homology spheres*,
arXiv:math/0605314v1. - [HabK] K. Habiro, *Refined Kirby calculus for integral homology spheres*,
arXiv:math/0509039v2 (page numbers are those of the journal version, with PDF pages in parentheses). -
[HabB] K. Habiro, *Bottom tangles and universal invariants*, arXiv:math/0505219v2. - [HabC] K.
Habiro, *An integral form of the quantized enveloping algebra of sl₂ and its completions*,
arXiv:math/0605313v1. - [HL] K. Habiro and T. T. Q. Lê, *Unified quantum invariants for integral
homology spheres associated with simple Lie algebras*, arXiv:1503.03549v2. - [RT] N. Yu. Reshetikhin
and V. G. Turaev, *Ribbon graphs and their invariants derived from quantum groups*, Comm. Math.
Phys. 127 (1990). - [Saw] S. F. Sawin, *Quantum groups at roots of unity and modularity*,
arXiv:math/0308281v2. - [MM] H. Murakami and J. Murakami, *The colored Jones polynomials and the
simplicial volume of a knot*, arXiv:math/9905075v1. - [Neu] W. D. Neumann, *Extended Bloch group and
the Cheeger–Chern–Simons class*, arXiv:math/0307092v2 (journal page numbers, with PDF pages in
parentheses). - [GSW] S. Garoufalidis, M. Storzer and C. Wheeler, *Perturbative invariants of cusped
hyperbolic 3-manifolds*, arXiv:2305.14884v2. - [GSWZ] S. Garoufalidis, P. Scholze, C. Wheeler and D.
Zagier, *The Habiro ring of a number field*, arXiv:2412.04241v2. - [DG] T. Dimofte and S.
Garoufalidis, *The quantum content of the gluing equations*, arXiv:1202.6268v2. - [DG2] T. Dimofte
and S. Garoufalidis, *Quantum modularity and complex Chern–Simons theory*, arXiv:1511.05628v1. -
[AK] J. E. Andersen and R. Kashaev, *A TQFT from quantum Teichmüller theory*, arXiv:1109.6295v2. -
[GZ] S. Garoufalidis and D. Zagier, *Knots, perturbative series and quantum modularity*,
arXiv:2111.06645v3 (the SIGMA version; page numbers are the printed ones). - [BD] S. Bettin and S.
Drappeau, *Modularity and value distribution of quantum invariants of hyperbolic knots*,
arXiv:1905.02045v2. - [Whe] C. Wheeler, *Quantum knot invariants and the Habiro ring*,
arXiv:2603.01619v1. - [Kir78] R. Kirby, *A calculus for framed links in S³*, Invent. Math. 45
(1978), 35–56. - [FR79] R. Fenn and C. Rourke, *On Kirby's calculus of links*, Topology 18 (1979),
1–15. - [Thu] W. P. Thurston, *The geometry and topology of three-manifolds*, lecture notes,
Princeton (1980), Chapter 4. - [Pra73] G. Prasad, *Strong rigidity of Q-rank 1 lattices*, Invent.
Math. 21 (1973), 255–286. - [EP88] D. B. A. Epstein and R. C. Penner, *Euclidean decompositions of
noncompact hyperbolic manifolds*, J. Differential Geom. 27 (1988), 67–80. - [Hör] L. Hörmander, *The
analysis of linear partial differential operators I*, Springer.
- [BDH] C. Brouder, N. V. Dang and F. Hélein, *Continuity of the fundamental operations on
distributions having a specified wave front set (with a counter example by Semyon Alesker)*,
arXiv:1409.7662v2.
