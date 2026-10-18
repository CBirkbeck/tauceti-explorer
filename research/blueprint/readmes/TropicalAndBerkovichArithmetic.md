# Roadmap: Berkovich spaces, tropical curves and nonarchimedean arithmetic

**Summary.** Build analytic spaces from norm-sensitive Banach spectra, then the metric and divisor theory of semistable curves, valued tropical cycles and faithful tropicalizations, and the model metrics, measures and integration comparisons used in nonarchimedean arithmetic. The endpoints include metric-graph and metrized-complex Riemann–Roch, a faithful tropicalization dominating any specified toric embedding, the skeleton–Jacobian comparison and the tropical correction between Berkovich–Coleman and abelian integrals.

## Scope and ownership

TB.0 owns normalized real-valued Banach spectra, completed residue fields, Berkovich analytic spaces, the rank-one maximal Hausdorff quotient and hybrid topology. The input adic valuation classes, Huber pairs and rational topology belong to Tau Ceti's AdicSpaces Layer 2. DiamondsAndVStacks D5 consumes these Banach-spectrum results and owns their extension to small v-sheaves. There is no diamond prerequisite in TB.0.

TB.1 owns line points, paths, annuli, logarithmic lengths and their descent conventions. TB.2 owns rank-one analytic semistable existence, the metric realization of the imported combinatorial dual graph, retractions, refinement and locally finite noncompact triangulations. StableReduction Layer 1 supplies the dual graph with component genera and its arithmetic-genus formula; Layer 2 supplies flat-family genus invariance. Its Layers 7–9 cover discrete valuation rings. Their statement does not establish the required theorem over a possibly nonnoetherian rank-one valuation ring.

TB.3 owns metric graphs, all-point divisors, potentials, Jacobians, metrized complexes and specialization. TB.4 owns the valued tropicalization, initial-degeneration and weighted-cycle comparisons. TB.5 owns faithfulness on metric graphs and marked rays. Algebraic curves and Riemann–Roch are imported. General-field toric embeddings extend the existing AnalyticToricGeometry direction; its current complex-base interface does not silently provide them.

TB.6 owns local model metrics, mixed measures, graph and line potential theory, and local heights. ArithmeticDynamics owns dynamical escape-rate estimates and the convergence of its family-specific potentials on the hybrid space. TB.7 imports the algebraic Tate curve from EllipticCurves Layer 4, local annular primitives and good-reduction integration from ColemanIntegration, and the abelian logarithm/integral from EffectiveDiophantineMethods ED.4. The analytic Raynaud cross is a precise requested extension of NeronModelsAndSemistableAbelianVarieties R11.3. The new results here compare those objects with skeleta and path integrals.

## Conventions

A general Banach ring is commutative and unital, with a specified submultiplicative seminorm, |1|≤1 and separated completion; the zero ring is allowed. Contractive maps are used for categorical colimits. Bounded maps are used for affinoid functoriality, with the multiplicative power trick giving pointwise domination. The norm is data: the topology alone does not determine the spectrum. Archimedean and discretely normed examples are included in TB.0. For a native normed ring, the spectral carrier is a subtype of Mathlib's `MulRingSeminorm`, never a new theory of seminorms.

For ordinary nonarchimedean geometry, K is a complete real rank-one valued field. Algebraic curve and split skeleton statements assume that K is algebraically closed and nontrivially valued unless the individual statement gives descent hypotheses. X is smooth connected, X̄ its smooth proper completion and D=X̄∖X a finite set of classical punctures. A semistable vertex set consists of type-II points in the split algebraic setting; noncompact nonsplit triangulations can contain type-II and type-III points. H denotes nonclassical points of P¹; H° in faithful finite-graph statements consists of type-II and type-III points. Completed residue fields are H(x); κ is the residue field of K.

Write v(a)=−log|a|, using natural logarithms. An annulus r<|T|<R has length log(R/r). A node uv=a has edge length v(a); uv=πⁿ has length n·v(π). Punctures produce infinite rays, and their classical endpoints belong only to the topological completion. Isometric scalar extension preserves these lengths; changing to a valuation normalized by v_L(π_L)=1 rescales numerical lengths. Virtual-annulus modulus conventions are specified in Layer 1, rather than identified with geometric component length.

Graphs retain loops, multiple edges, positive real edge lengths and vertex genera. A loop contributes two to valency. Divisors range over all graph points, not only a chosen vertex set. Use divPL(f)=Σ_xΣ_outgoing d_bf·x and Δf=−divPL(f); the measure extension is Δf=−f″ds−Σ_xΣ_outgoing d_bf·δ_x. Thus ddc f=−Δf and multiplying a metric by exp(−f) changes curvature by −Δf. For F=−log|h| on a compact skeleton, ΔF=τ_*div(h). This sign convention is used consistently in local heights, graph Green functions and Yuan's normalization comparison.

In p-adic integration K=ℂ_p, a branch Log is fixed and v_p(p)=1. The tropical arithmetic coordinate is rational, while natural-log length is log(p) times that coordinate. Real graph energies and Cp-valued periods have different coefficient fields. No identification of a real monodromy pairing with a Cp integral is implicit.

A bare TB.i/name below means `TropicalAndBerkovichArithmetic:TB.i/name`. Every declaration has its intended namespace, statement, prerequisites and source. All definitions and constructions carry a usable API and discriminating checks. The APIs are mathematical contracts; the representative Lean file includes only statements whose carriers can be expressed against the pinned libraries.

## Exact supplier contracts

The baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Existing declarations are imported rather than replanned. The checked native declarations used directly are:

- `mathlib:MulRingSeminorm` (Mathlib/Analysis/Normed/Unbundled/RingSeminorm.lean): Native nonnegative additive seminorm and unital multiplicative map to the reals.
- `mathlib:MulRingSeminorm.ext` (Mathlib/Analysis/Normed/Unbundled/RingSeminorm.lean): Extensional equality of native multiplicative seminorms.
- `mathlib:normRingSeminorm` (Mathlib/Analysis/Normed/Unbundled/RingSeminorm.lean): The submultiplicative ring seminorm supplied by the norm.
- `mathlib:RingHom.IsBoundedWrt` (Mathlib/Basic/Real/Basic.lean): One positive uniform bound between specified real functions.
- `mathlib:RingHom.IsBounded` (Mathlib/Analysis/Normed/Ring/Basic.lean): One positive uniform bound between source and target norms.
- `mathlib:contraction_of_isPowMul_of_boundedWrt` (Mathlib/Analysis/Normed/Unbundled/IsPowMulFaithful.lean): Power-multiplicative bounded pullbacks are pointwise dominated by the source ring seminorm.
- `mathlib:IsPowMul` (Mathlib/Basic/Real/Basic.lean): Power multiplicativity for positive natural powers.
- `mathlib:map_pow` (Mathlib/Algebra/Group/Hom/Defs.lean): A multiplicative map preserves natural powers.
- `mathlib:normHom` (Mathlib/Analysis/Normed/Ring/Basic.lean): The native multiplicative map supplied by a multiplicative norm and norm of one equal to one.
- `mathlib:Topology.IsEmbedding` (Mathlib/Topology/Defs/Induced.lean): Induced topology together with injectivity.
- `mathlib:Topology.IsInducing.continuous_iff` (Mathlib/Topology/Maps/Basic.lean): Continuity into an induced topology is tested after the inducing map.
- `mathlib:continuous_pi` (Mathlib/Topology/Constructions.lean): Coordinatewise continuity gives continuity into a product.
- `mathlib:continuous_apply` (Mathlib/Topology/Constructions.lean): Each coordinate evaluation is continuous for the product topology.
- `mathlib:isClosed_iInter` (Mathlib/Topology/Basic.lean): Arbitrary intersections of closed sets are closed.
- `mathlib:isClosed_eq` (Mathlib/Topology/Separation/Hausdorff.lean): An equality of continuous real functions cuts out a closed set.
- `mathlib:isClosed_le` (Mathlib/Topology/Order/OrderClosed.lean): An inequality of continuous real functions cuts out a closed set.
- `mathlib:isCompact_pi_infinite` (Mathlib/Topology/Compactness/Compact.lean): Tychonoff compactness for a product of compact subsets.
- `mathlib:CompactIccSpace` (Mathlib/Topology/Order/Compact.lean): Native compactness of closed intervals, including real intervals.
- `mathlib:IsCompact.of_isClosed_subset` (Mathlib/Topology/Compactness/Compact.lean): A closed subset of a compact set is compact.
- `mathlib:Topology.IsEmbedding.isCompact_iff` (Mathlib/Topology/Compactness/Compact.lean): An embedding reflects compactness from its image.
- `mathlib:Topology.IsEmbedding.t2Space` (Mathlib/Topology/Separation/Hausdorff.lean): An embedding into a Hausdorff space has a Hausdorff domain.
- `mathlib:Pi.t2Space` (Mathlib/Topology/Separation/Hausdorff.lean): Products of Hausdorff spaces are Hausdorff.

The current TauCetiRoadmap main and current Tau Ceti source tree were also checked for duplicate ownership. The exact external node interfaces used below are:

- `AdicSpacesPartII:R1/affinoid-covering-tate-acyclicity`: Finite-module Čech acyclicity for finite affinoid covers of a strict affinoid over nontrivially valued K. Weighted nonstrict descent remains a TB.0 proof input.
- `AdicSpacesPartII:R1/analytification-functor`: Adic analytification of finite-type schemes, with the scheme and local-chart interfaces. It does not itself construct Berkovich analytification.
- `AdicSpacesPartII:R2/admissible-formal-scheme`: Flat, topologically finitely presented admissible formal K°-schemes, allowing a nonnoetherian valuation ring.
- `AdicSpacesPartII:R2/raynaud-generic-fibre`: The analytic generic fiber, its formal affinoid charts and compatibility with admissible modifications. TB.2 proves the metric skeleton correspondence.
- `ColemanIntegration:L0/annulus-branch-change`: The explicit change of the logarithmic primitive under Log′−Log=c·v_p.
- `ColemanIntegration:L0/annulus-log-primitive`: The convergent analytic-plus-logarithmic primitive, with its residue coefficient and differentiation identity.
- `ColemanIntegration:L0/annulus-residue`: The dt/t Laurent coefficient and its oriented coordinate invariance.
- `ColemanIntegration:L1/coleman-integration-characterisation`: The good-reduction, Frobenius-normalized Coleman integration class. It is not general global path integration.
- `EffectiveDiophantineMethods:ED.4/abelian-integral`: The endpoint integral obtained by pairing the abelian logarithm of Q−P with an invariant differential.
- `EffectiveDiophantineMethods:ED.4/abelian-logarithm`: The Cp-analytic abelian logarithm on all Cp-points, with derivative and functoriality, in every reduction type.

Stage contracts whose exact required node is absent are requested explicitly:
- **SchemeAndStackFoundations:SF.3**: Integrate the native smooth connected algebraic curve, smooth proper completion and finite puncture set from AlgebraicCurves. Analytification belongs to TB.0, not this request. Supply H⁰(X̄,O)=K for a smooth proper geometrically connected curve over algebraically closed K, used with proper GAGA for analytic connectedness. Consumed by `TB.2/semistable-vertex-sets-and-skeleta` (Semistable vertex set), `TB.0/connected-analytification` (Connected algebraic curves remain connected).
- **SchemeAndStackFoundations:SF.0**: Common scheme interfaces for closed toric embeddings over the general nonarchimedean field K, equivariant dominating maps and initial degenerations retaining generic multiplicities. Coordinate the toric extension with AnalyticToricGeometry Layer 0, whose specified algebraic supplier uses a complex base. Do not duplicate its cones, fans or toric gluing. Consumed by `TB.5/faithful-tropicalization-and-expansion-factors` (Faithful tropicalization of a finite subgraph), `TB.4/tropical-multiplicity-formula` (Tropical multiplicity formula for curves).
- **SchemeAndStackFoundations:SF.5**: Use SF.5/first-chern, SF.5/chern-projection and SF.5/degree for intersections on proper finite-type residue-field schemes. Extend the model specialization, vertical Cartier intersection and admissible-blowup projection identities to proper normal flat models over arbitrary complete rank-one valuation rings, retaining residue degrees and component multiplicities. SF.5/arithmetic-surface-comparison covers regular proper arithmetic surfaces over a Dedekind base; it does not supply this possibly nonnoetherian extension. SF.4 supplies formal geometry, not the intersection-theory owner. Consumed by `TB.6/formal-model-metrics` (Formal and model metrics), `TB.6/model-measures` (Chambert–Loir model measures).
- **NeronModelsAndSemistableAbelianVarieties:R11.3**: Extend the DVR formal Raynaud comparison to the analytic uniformization cross over a complete algebraically closed rank-one field: 0→M′→Eᵃⁿ→Jᵃⁿ→0 and 0→T→E→B→0, the valuation map, its full lattice and good-reduction kernel, base change, and principal period/monodromy pairing. The existing raynaud-extension-comparison node is a formal DVR result and does not provide this analytic cross. Consumed by `TB.7/analytic-jacobian-periods` (Analytic Jacobian periods), `TB.7/bc-abelian-tropical-correction` (BC–abelian tropical correction).
- **ArithmeticDynamics:DY.2**: The DKY degenerating family needs locally uniform convergence of normalized dynamical Green potentials on the hybrid analytic space. TB.0 owns that space and TB.6 its local kernel/energy; the dynamical escape-rate estimates and family-specific convergence remain here, rather than being asserted from topology alone. Consumed by `TB.0/hybrid-analytic-space` (Hybrid analytic spaces), `TB.6/hsia-potentials-and-energy` (Hsia kernels and positive energy).
- **tauceti:TauCetiRoadmap/AdicSpaces#layer-2-affinoid-spectra-and-rational-subsets**: Native valuation classes, Spa(A,A⁺), rational topology and continuous maps; TB.0 adds normalized real rank-one points and the Hausdorff quotient, with no perfectoid or diamond prerequisite. Consumed by `TB.0/adic-rank-one-retraction` (Normalized rank-one adic quotient).
- **tauceti:TauCetiRoadmap/AlgebraicCurves#layer-4-repartitions-weil-differentials-and-riemannroch**: Algebraic Riemann–Roch and prescribed-pole rational functions on the smooth proper curve; TB.5 imports them to obtain unit-slope and coprime-pole coordinates. Consumed by `TB.5/unit-slope-separating-functions` (Functions separating edges and vertices).
- **tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv**: The existing algebraic Tate elliptic curve and its q-parametrization; TB.7 adds the analytic quotient, circle length and measure/integral calibration. Consumed by `TB.7/tate-analytic-quotient` (Tate analytic quotient and skeletal circle).
- **tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs**: Existing combinatorial dual graph with component genera and p_a=Σg_v+b₁. TB.2 adds the metric thickness/skeleton identification only. Consumed by `TB.2/formal-model-skeleton` (Formal models and metric dual graphs), `TB.2/vertex-genus-and-genus-formula` (Vertex genera and analytic genus).
- **tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity**: Existing genus invariance in proper flat curve families, applied to the special and generic fibers; no second genus-invariance theorem is planned. Consumed by `TB.2/vertex-genus-and-genus-formula` (Vertex genera and analytic genus).
- **tauceti:TauCetiRoadmap/StableReduction#layer-7-semistable-reduction**: Existing semistable-reduction theorem in its DVR range, used as a compatibility check. It does not supply the owned nonnoetherian rank-one theorem. Consumed by `TB.2/rank-one-semistable-reduction` (Rank-one semistable reduction).

## How to read the build

The Banach spectrum is constructed before any adic quotient uses it. Line geometry then provides the annular local models for curve skeleta. Divisor and slope theory supplies both weighted tropicalization and the functions used to make it faithful. Measures use the same Laplacian and metric normalization, while the uniformization and integration comparisons use the resulting graph Jacobian and real period lattice. The Tate example in Layer 6 uses the analytic quotient target of Layer 7 as a calibration; its construction does not enter the general model-measure definition.

## Layer 0: Berkovich spectra and analytic comparison

Begin with actual normalized real-valued points and their evaluation topology. Compactness is a closed-product argument; nonemptiness, unit detection and the attained spectral maximum are separate theorems. The general Banach category serves archimedean and hybrid applications, while nonarchimedean affinoid domains carry the G-topology needed for analytic spaces.

External layer inputs: `AdicSpacesPartII:R1/affinoid-covering-tate-acyclicity`; `AdicSpacesPartII:R1/analytification-functor`; `SchemeAndStackFoundations:SF.3`; `tauceti:TauCetiRoadmap/AdicSpaces#layer-2-affinoid-spectra-and-rational-subsets`.

### 0.1 Berkovich spectrum

Define `TauCeti.Berkovich.Spectrum`. For a normed commutative unital ring A, M(A) is the subtype of native MulRingSeminorm A consisting of p with p(a) ≤ ‖a‖ for every a. Points are actual real-valued seminorms, not equivalence classes. Completeness, a base field, multiplicativity of the ambient norm and a nonarchimedean norm are not required for this carrier.

The interface is used in Temkin 2.2.2.1 and 2.2.2.4(i) for Supply points and pullback; AdicSpacesPartII:R3/uniform-spectral-seminorm; PerfectoidSpaces:P1/uniform-banach-field-over-nondiscrete-field for Consumers require rings without a chosen base field; nonemptiness and the spectral maximum are now explicit TB.0 targets, not inferred from compactness; TB.1; ArithmeticDynamics:DY.2 for Evaluation functions begin discs and analytic norm comparisons.

The API consists of:

- `TauCeti.Berkovich.Spectrum.toSeminorm` (projection): Forget only the domination proof, retaining the native MulRingSeminorm.
- `TauCeti.Berkovich.Spectrum.eval` (data): For x in M(A) and a in A, return x(a) in ℝ.
- `TauCeti.Berkovich.Spectrum.ofSeminorm` (constructor): A native multiplicative seminorm p with a pointwise norm bound gives a point.
- `TauCeti.Berkovich.Spectrum.ofSeminorm_eval` (simp): Evaluating the constructed point at a returns p(a).
- `TauCeti.Berkovich.Spectrum.ext` (extensionality): Points with equal values at every a in A are equal.
- `TauCeti.Berkovich.Spectrum.eval_zero` (simp): Every point has value zero at zero.
- `TauCeti.Berkovich.Spectrum.eval_one` (simp): Every point has value one at one.
- `TauCeti.Berkovich.Spectrum.eval_mul` (simp): x(ab)=x(a)x(b).
- `TauCeti.Berkovich.Spectrum.eval_neg` (simp): x(−a)=x(a).
- `TauCeti.Berkovich.Spectrum.eval_add_le` (characterisation): x(a+b)≤x(a)+x(b).
- `TauCeti.Berkovich.Spectrum.eval_nonneg` (characterisation): 0≤x(a).
- `TauCeti.Berkovich.Spectrum.eval_le_norm` (characterisation): x(a)≤‖a‖.

**Checks.**

- `TauCeti.Berkovich.Spectrum.zeroRing_empty`: M(A) is empty when A is a subsingleton normed ring.
- `TauCeti.Berkovich.Spectrum.zeroFunction_excluded`: No point takes value zero at every a.
- `TauCeti.Berkovich.Spectrum.native_compatibility`: Forgetting the bound on the point made from p returns exactly p.
- `TauCeti.Berkovich.Spectrum.nonmultiplicative_product_norm`: The maximum norm on ℝ×ℝ is not multiplicative: use (1,0) and (0,1).

Construction. Take the norm-dominated subtype of the existing seminorm carrier; retain its function coercion through the named evaluation projection. The native carrier already supplies positivity, zero, negation, triangle inequality, one and multiplication.

*Needs:* `mathlib:MulRingSeminorm`; `mathlib:MulRingSeminorm.ext`.

Sources: [Michael Temkin, Introduction to Berkovich analytic spaces](https://math.huji.ac.il/~temkin/papers/Introduction_to_Berkovich_Spaces.pdf), Definition 2.2.2.1(i), p. 6; Definition/Exercise 2.1.2.1(i), p. 4. The source uses bounded points for Banach rings. The bounded-iff-dominated node proves equality with this presentation; this carrier needs no completion.

Acceptance: The zero ring has no point because one must map to one and zero to zero. The zero function is excluded. On the product of two real fields, the two projection seminorms are distinct; the ambient maximum norm itself is not multiplicative.

### 0.2 Bounded points are norm dominated

Prove `TauCeti.Berkovich.Spectrum.bounded_iff_dominated`. For p in native MulRingSeminorm A, there is a constant C>0 with p(a)≤C‖a‖ for all a if and only if p(a)≤‖a‖ for all a.

Proof route. Apply the native contraction theorem to the identity ring map, the norm ring seminorm, and the multiplicative function p. Native preservation of powers supplies power multiplicativity. For the reverse direction choose C=1. This is an adapter, not a second power-trick theorem.

*Needs:* `mathlib:RingHom.IsBoundedWrt`; `mathlib:normRingSeminorm`; `mathlib:IsPowMul`; `mathlib:map_pow`; `mathlib:contraction_of_isPowMul_of_boundedWrt`.

Sources: [Michael Temkin, Introduction to Berkovich analytic spaces](https://math.huji.ac.il/~temkin/papers/Introduction_to_Berkovich_Spaces.pdf), Definition 2.2.2.1(i), p. 6. Identifies the source boundedness convention with the chosen subtype; the proof is the pinned library theorem.

Acceptance: A different positive bound C produces the same point subtype. A point need not be bounded as a real-valued function on all of A.

### 0.3 Topology of pointwise convergence

Construct `TauCeti.Berkovich.Spectrum.topology`. Equip M(A) with the topology induced by x↦(a↦x(a)) into the full product ℝ^A. Thus continuity into M(A) is equivalent to continuity of every evaluation coordinate.

The interface is used in Temkin 2.2.2.3(i) for Compactness is obtained in the product topology; Temkin 2.2.2.4(i) for Each coordinate of pullback is another evaluation; TB.0 analytic comparison for The comparison must identify this topology, not merely the point set.

The API consists of:

- `TauCeti.Berkovich.Spectrum.topology` (instance): The topology is induced by the full evaluation map M(A)→ℝ^A.
- `TauCeti.Berkovich.Spectrum.continuous_eval` (characterisation): Evaluation at each a is continuous.
- `TauCeti.Berkovich.Spectrum.continuous_iff` (universal-property): For any topological Z, f:Z→M(A) is continuous exactly when each z↦f(z)(a) is continuous.
- `TauCeti.Berkovich.Spectrum.topology_eq_induced` (compatibility): The topology agrees with the native induced topology from ℝ^A.

**Checks.**

- `TauCeti.Berkovich.Spectrum.topology_zero_coordinate`: Evaluation at zero is continuous.
- `TauCeti.Berkovich.Spectrum.topology_product_coordinates`: For a,b in A the map x↦(x(a),x(b)) is continuous into ℝ².
- `TauCeti.Berkovich.Spectrum.topology_all_coordinates`: Coordinatewise continuous maps into M(A) are continuous.
- `TauCeti.Berkovich.Spectrum.topology_distinguishes_projections`: An open set contains the first projection point of ℝ×ℝ and excludes the second; evaluation at (2,3) separates them.

Construction. Use the native induced topology on the native function product. Apply the inducing-map continuity criterion, followed by coordinatewise continuity into a product.

*Needs:* `TB.0/spectrum` (Berkovich spectrum); `mathlib:Topology.IsInducing.continuous_iff`; `mathlib:continuous_pi`; `mathlib:continuous_apply`.

Sources: [Michael Temkin, Introduction to Berkovich analytic spaces](https://math.huji.ac.il/~temkin/papers/Introduction_to_Berkovich_Spaces.pdf), Definition 2.2.2.1(i), p. 6. The initial topology for evaluation at every element of A.

Acceptance: Evaluations at zero and one are continuous constants. The two projection points of ℝ×ℝ have disjoint separating neighborhoods.

### 0.4 The evaluation map is an embedding

Prove `TauCeti.Berkovich.Spectrum.isEmbedding_eval`. The evaluation map M(A)→ℝ^A is a topological embedding.

Proof route. The topology is induced by definition. Native seminorm extensionality and subtype extensionality prove injectivity.

*Needs:* `TB.0/spectrum` (Berkovich spectrum); `TB.0/evaluation-topology` (Topology of pointwise convergence); `mathlib:MulRingSeminorm.ext`; `mathlib:Topology.IsEmbedding`.

Sources: [Michael Temkin, Introduction to Berkovich analytic spaces](https://math.huji.ac.il/~temkin/papers/Introduction_to_Berkovich_Spaces.pdf), Definition 2.2.2.1(i), p. 6. The explicit induced-topology embedding is the library formulation of the definition.

Acceptance: Equality of coordinates cannot identify two distinct points.

### 0.5 Equations for the evaluation image

Prove `TauCeti.Berkovich.Spectrum.range_eval`. The image of M(A) in ℝ^A is exactly the functions v satisfying v(0)=0, v(1)=1, v(−a)=v(a), v(a+b)≤v(a)+v(b), v(ab)=v(a)v(b), and 0≤v(a)≤‖a‖ for all a,b.

Proof route. Unpack a spectrum point to obtain the listed laws. Conversely bundle the additive group seminorm laws and multiplicative zero-preserving unital homomorphism laws into the existing MulRingSeminorm, then attach domination.

*Needs:* `TB.0/spectrum` (Berkovich spectrum); `mathlib:MulRingSeminorm`.

Sources: [Michael Temkin, Introduction to Berkovich analytic spaces](https://math.huji.ac.il/~temkin/papers/Introduction_to_Berkovich_Spaces.pdf), Definition/Exercise 2.1.2.1(i), p. 4; Definition 2.2.2.1(i), p. 6. Native-carrier expansion used only to prove the image description.

Acceptance: The zero function violates the one equation; the product maximum norm violates multiplication.

### 0.6 Closedness of the evaluation image

Prove `TauCeti.Berkovich.Spectrum.isClosed_range_eval`. The image of M(A) in ℝ^A is closed.

Proof route. Express the image as the intersection of the equalities and inequalities of evaluation-range. Coordinate evaluation, real addition and real multiplication are continuous. Each equality is closed by the Hausdorff equality theorem; each inequality is closed by the real order theorem. Intersect over all elements and pairs.

*Needs:* `TB.0/evaluation-range` (Equations for the evaluation image); `mathlib:continuous_apply`; `mathlib:isClosed_eq`; `mathlib:isClosed_le`; `mathlib:isClosed_iInter`.

Sources: [Michael Temkin, Introduction to Berkovich analytic spaces](https://math.huji.ac.il/~temkin/papers/Introduction_to_Berkovich_Spaces.pdf), Fact 2.2.2.3(i), p. 7. This is the explicit topological proof step for the compactness statement; supplied here from native closed-set lemmas.

Acceptance: One uses non-strict inequalities; imposing strict positivity on all nonzero elements would fail closedness.

### 0.7 Compactness of the Berkovich spectrum

Prove `TauCeti.Berkovich.Spectrum.compactSpace`. M(A) is compact for every normed commutative ring A, even without completeness or nontriviality.

Proof route. The image lies in the product of compact real intervals [0,‖a‖]. Tychonoff makes that product compact. Closedness of the image makes it a compact subset of this product. Reflect compactness along the evaluation embedding. No nonemptiness argument is used.

*Needs:* `TB.0/evaluation-embedding` (The evaluation map is an embedding); `TB.0/closed-evaluation-range` (Closedness of the evaluation image); `mathlib:isCompact_pi_infinite`; `mathlib:CompactIccSpace`; `mathlib:IsCompact.of_isClosed_subset`; `mathlib:Topology.IsEmbedding.isCompact_iff`.

Sources: [Michael Temkin, Introduction to Berkovich analytic spaces](https://math.huji.ac.il/~temkin/papers/Introduction_to_Berkovich_Spaces.pdf), Fact 2.2.2.3(i), p. 7. Proves the compactness assertion in a stronger generality; the nonemptiness assertion is not included.

Acceptance: M(ℝ×ℝ) is compact although its ambient norm is not multiplicative. The empty spectrum of a zero ring is compact.

### 0.8 Hausdorffness of the Berkovich spectrum

Prove `TauCeti.Berkovich.Spectrum.t2Space`. M(A) is Hausdorff.

Proof route. The real product is Hausdorff and the evaluation map is an embedding.

*Needs:* `TB.0/evaluation-embedding` (The evaluation map is an embedding); `mathlib:Pi.t2Space`; `mathlib:Topology.IsEmbedding.t2Space`.

Sources: [Michael Temkin, Introduction to Berkovich analytic spaces](https://math.huji.ac.il/~temkin/papers/Introduction_to_Berkovich_Spaces.pdf), Definition 2.2.2.1(i), p. 6. Point separation follows from distinct real-valued seminorms having different coordinates.

Acceptance: Projection points on ℝ×ℝ are separated using evaluation at (2,3).

### 0.9 Pullback of Berkovich points

Construct `TauCeti.Berkovich.Spectrum.comap`. For normed commutative rings A,B and a bounded unital ring homomorphism f:A→B, construct the continuous map M(f):M(B)→M(A), given by M(f)(x)(a)=x(f(a)).

The interface is used in Temkin 2.2.2.4(i) for Functoriality of spectra; AdicSpacesPartII:R3/uniform-spectral-seminorm for The spectral comparison uses the induced map of spectra; TB.0; TB.4 for Coordinate restriction and tropicalization need evaluation-compatible pullbacks.

The API consists of:

- `TauCeti.Berkovich.Spectrum.comap_eval` (simp): M(f)(x)(a)=x(f(a)).
- `TauCeti.Berkovich.Spectrum.comap_id` (functoriality): M(id)(x)=x.
- `TauCeti.Berkovich.Spectrum.comap_comp` (functoriality): M(g∘f)(x)=M(f)(M(g)(x)).
- `TauCeti.Berkovich.Spectrum.comap_continuous` (structure): The map is continuous for the evaluation topologies.
- `TauCeti.Berkovich.Spectrum.comap_proof_irrel` (compatibility): Changing the proof of boundedness does not change the continuous map.

**Checks.**

- `TauCeti.Berkovich.Spectrum.comap_first_projection`: Pull the real norm back along the first projection ℝ×ℝ→ℝ: its value at (2,3) is 2.
- `TauCeti.Berkovich.Spectrum.comap_second_projection`: Pull back along the second projection: its value at (2,3) is 3.
- `TauCeti.Berkovich.Spectrum.comap_id_real`: Pulling the real norm point back along the identity fixes it.
- `TauCeti.Berkovich.Spectrum.comap_distinguishes_projections`: The first and second projection pullbacks are distinct.

Construction. Compose the native seminorm laws with the ring map. If ‖f(a)‖≤C‖a‖, then x(f(a))≤C‖a‖. Apply bounded-iff-dominated to the composed seminorm. For continuity test each a-coordinate, which is evaluation at f(a). Identity and reversed composition follow by pointwise extensionality.

*Needs:* `TB.0/spectrum` (Berkovich spectrum); `TB.0/bounded-iff-dominated` (Bounded points are norm dominated); `TB.0/evaluation-topology` (Topology of pointwise convergence); `mathlib:RingHom.IsBounded`; `mathlib:MulRingSeminorm`.

Sources: [Michael Temkin, Introduction to Berkovich analytic spaces](https://math.huji.ac.il/~temkin/papers/Introduction_to_Berkovich_Spaces.pdf), Exercise 2.2.2.4(i), p. 7. Contravariant continuous functor on bounded homomorphisms; completeness is unused.

Acceptance: Contravariance reverses f:A→B and g:B→D: M(g∘f)=M(f)∘M(g). Do not assume an arbitrary continuous ring homomorphism is bounded.

### 0.10 The norm point of a valued field

Construct `TauCeti.Berkovich.Spectrum.normPoint`. For a normed field K, its native absolute-value norm defines a distinguished point ν_K of M(K), with ν_K(a)=‖a‖. No completeness or nontrivial valuation hypothesis is needed.

The interface is used in TB.0 scalar compatibility for A bounded point pulled back from an algebra to its normed base field must equal ν_K; Pullback tests for The two projection points on a product ring are constructed from this point.

The API consists of:

- `TauCeti.Berkovich.Spectrum.normPoint_eval` (simp): ν_K(a)=‖a‖.
- `TauCeti.Berkovich.Spectrum.normPoint_toMonoidWithZeroHom` (compatibility): The underlying native multiplicative map of ν_K is normHom.
- `TauCeti.Berkovich.Spectrum.normPoint_eq_ofSeminorm` (characterisation): Any native seminorm point whose function equals the norm is ν_K.

**Checks.**

- `TauCeti.Berkovich.Spectrum.normPoint_two`: ν_ℝ(2)=2.
- `TauCeti.Berkovich.Spectrum.normPoint_zero`: ν_ℝ(0)=0.
- `TauCeti.Berkovich.Spectrum.normPoint_inverse`: ν_ℝ(2 inverse)=1/2.

Construction. Combine the native norm homomorphism with the native additive seminorm laws; the required upper bound is equality.

*Needs:* `TB.0/spectrum` (Berkovich spectrum); `mathlib:normHom`; `mathlib:MulRingSeminorm`; `mathlib:normRingSeminorm`.

Sources: [Michael Temkin, Introduction to Berkovich analytic spaces](https://math.huji.ac.il/~temkin/papers/Introduction_to_Berkovich_Spaces.pdf), Definitions 2.1.2.1(i) and 2.2.2.1(i), pp. 4, 6. Specialization to the multiplicative norm of a field.

Acceptance: The real norm point has values 0,2,1/2 on 0,2,2 inverse.

### 0.11 The spectrum of a normed field is a singleton

Prove `TauCeti.Berkovich.Spectrum.eq_normPoint`. For any normed field K, every point of M(K) equals ν_K.

Proof route. For a=0 equality is forced. For a≠0, multiplicativity gives p(a)p(a inverse)=1. Use p(a)≤‖a‖ and p(a inverse)≤‖a inverse‖=‖a‖ inverse to obtain the reverse inequality p(a)≥‖a‖. Apply extensionality.

*Needs:* `TB.0/field-norm-point` (The norm point of a valued field); `TB.0/spectrum` (Berkovich spectrum).

Sources: [Michael Temkin, Introduction to Berkovich analytic spaces](https://math.huji.ac.il/~temkin/papers/Introduction_to_Berkovich_Spaces.pdf), Definition 2.2.2.1(i), p. 6. Elementary consequence of the bounded multiplicative point definition, proved here with explicit inverse bounds.

Acceptance: Every point of M(ℝ) takes value 3 at −3. A power of the real absolute value with exponent strictly between zero and one fails domination near zero.

### 0.12 Seminormed Banach rings

Define `TauCeti.Berkovich.TB0.banach_ring_category`. Use commutative unital seminormed rings with submultiplicative seminorm and |1|≤1, including the zero ring, then separated completion. Morphisms in the colimit statements are contractive unital maps. M(A) consists of unital multiplicative real seminorms dominated by the specified seminorm. The normed-ring subtype already planned embeds this general carrier after separation.

Assumptions and scope: A seminorm, rather than merely its topology, is part of the data.

The interface is used in Scholze §2; TB.0 colimits for Retain the norm-sensitive category required by spectral pushouts and hybrid rings.

The API consists of:

- `TauCeti.Berkovich.TB0.banach_ring_category.separatedCompletion` (constructor): Separated completion is universal for contractive maps to separated complete rings.
- `TauCeti.Berkovich.TB0.banach_ring_category.spectrum_completion` (equivalence): Restriction M(completion(A))→M(A) is a homeomorphism.
- `TauCeti.Berkovich.TB0.banach_ring_category.map_id_comp` (functoriality): Contractive maps compose and their pullbacks satisfy identity and composition.
- `TauCeti.Berkovich.TB0.banach_ring_category.nativeCarrier` (compatibility): For a native NormedCommRing the dominated seminorm subtype is this spectrum.

**Checks.**

- `TauCeti.Berkovich.TB0.banach_ring_category.check1`: The zero ring has empty spectrum.
- `TauCeti.Berkovich.TB0.banach_ring_category.check2`: A nonzero discretely normed field has its trivial absolute-value point.
- `TauCeti.Berkovich.TB0.banach_ring_category.check3`: The usual norm on ℤ and its trivial norm define different spectra although both ring topologies are discrete.

Construction. Quotient the seminorm-zero ideal, complete the resulting metric ring, and extend multiplication by uniform continuity on bounded sets. Every dominated multiplicative seminorm kills that ideal and extends uniquely through completion.

*Needs:* `TB.0/spectrum` (Berkovich spectrum).

Sources: [Peter Scholze, Berkovich Motives](https://people.mpim-bonn.mpg.de/scholze/BerkovichMotives.pdf), Definitions 2.1–2.2 and Proposition 2.4, pp. 7–8; Proposition 3.2, pp. 14–15. Distinguishes contractive Banach-ring maps and their completion from arbitrary bounded morphisms of affinoid algebras.

### 0.13 Existence of spectral points

Prove `TauCeti.Berkovich.Spectrum.nonempty`. A nonzero complete commutative unital seminormed Banach ring with |1|=1 has nonempty spectrum; its spectrum is compact Hausdorff. A completion that becomes zero is excluded.

Assumptions and scope: Nonzero separated complete Banach ring; norm of one is one.

Proof route. For existence use Berkovich’s maximal-ideal quotient and minimal bounded-seminorm construction; the weighted power-series contradiction forces multiplicativity. Compactness and Hausdorffness use the inherited closed evaluation-image proof, which does not require completeness.

*Needs:* `TB.0/banach-ring-category` (Seminormed Banach rings); `TB.0/compact-spectrum` (Compactness of the Berkovich spectrum); `TB.0/hausdorff-spectrum` (Hausdorffness of the Berkovich spectrum).

Sources: Vladimir Berkovich, *Spectral Theory and Analytic Geometry over Non-Archimedean Fields* (maintainer-cleared edition), Theorem 1.2.1, pp. 13–15. Supplies existence, including the part not implied by compactness. [Peter Scholze, Berkovich Motives](https://people.mpim-bonn.mpg.de/scholze/BerkovichMotives.pdf), Theorem 2.14, pp. 10–11. Records the general Banach-ring version and unit normalization.

Acceptance: The zero-ring exception is necessary. The archimedean and trivial absolute-value field cases are included.

### 0.14 Units and spectral maximum

Prove `TauCeti.Berkovich.TB0.unit_and_spectral_radius`. For a complete nonzero commutative Banach ring A, a is a unit iff x(a)>0 for every x∈M(A). Moreover ρ(a)=limₙ||aⁿ||^(1/n)=infₙ≥1||aⁿ||^(1/n)=maxₓ x(a). The spectrum is unchanged by replacing the seminorm with its spectral uniformization and taking separated completion.

Assumptions and scope: Unital Banach norm normalized at one; positive integer powers in the infimum.

Proof route. Apply nonemptiness to the quotient by a maximal ideal containing a for the unit test. Test invertibility of 1−aT in weighted convergent series rings to obtain the sharp spectral-radius bound, then use compactness for attainment. The power trick gives the reverse inequality.

*Needs:* `TB.0/nonempty-spectrum` (Existence of spectral points); `TB.0/bounded-iff-dominated` (Bounded points are norm dominated).

Sources: Vladimir Berkovich, *Spectral Theory and Analytic Geometry over Non-Archimedean Fields* (maintainer-cleared edition), Corollary 1.2.4, p. 15 and Theorem 1.3.1, pp. 15–16. Gives unit detection and the spectral maximum, rather than only a definition by infimum. [Peter Scholze, Berkovich Motives](https://people.mpim-bonn.mpg.de/scholze/BerkovichMotives.pdf), Corollary 2.15, p. 11 and Proposition 2.21, pp. 12–13. Relates spectral uniformization to the same spectrum.

Acceptance: A nonzero nilpotent has spectral radius zero. In ℝ×ℝ the radius is max(|a|,|b|), not a multiplicative norm.

### 0.15 Completed residue fields

Construct `TauCeti.Berkovich.TB0.completed_residue_fields`. For x∈M(A), ker(x) is prime, x descends to an absolute value on Frac(A/ker(x)), and H(x) is its completion. Evaluation A→H(x) has absolute value x. Bounded pullback f*:M(B)→M(A) induces an isometric field embedding H(f*x)→H(x).

Assumptions and scope: A commutative normed ring; x a normalized dominated multiplicative seminorm.

The interface is used in TB.1 types and TB.4 multiplicities for Residue transcendence, value groups and canonical reduction degrees require H(x).

The API consists of:

- `TauCeti.Berkovich.TB0.completed_residue_fields.eval` (data): A bounded ring map A→H(x) realizes x(a)=|a(x)|.
- `TauCeti.Berkovich.TB0.completed_residue_fields.dense_fraction_field` (characterisation): The fraction field of A/ker(x) has dense image in H(x).
- `TauCeti.Berkovich.TB0.completed_residue_fields.map` (functoriality): Pullback induces an isometric embedding; identities and composites agree.
- `TauCeti.Berkovich.TB0.completed_residue_fields.point_realization` (universal-property): Any isometric complete valued-field realization of x contains a unique isometric image of H(x).

**Checks.**

- `TauCeti.Berkovich.TB0.completed_residue_fields.check1`: At a K-rational point of A¹, H(x)=K.
- `TauCeti.Berkovich.TB0.completed_residue_fields.check2`: At the unit Gauss point over algebraically closed K, the residue field is κ(T), rather than κ.
- `TauCeti.Berkovich.TB0.completed_residue_fields.check3`: A point with nonzero kernel uses A/ker(x); taking Frac(A) would fail.

Construction. Multiplicativity makes the kernel prime; define |a/b|=x(a)/x(b), prove independence and complete. Extend the induced fraction-field embedding uniquely to completions.

*Needs:* `TB.0/spectrum` (Berkovich spectrum); `TB.0/comap` (Pullback of Berkovich points).

Sources: [Jérôme Poineau and Daniele Turchetti, Berkovich curves and Schottky uniformization](https://poineau.users.lmno.cnrs.fr/Textes/SchottkyVIASM.pdf), Definition I.2.1 and Lemma I.2.5, pp. 6–7. Gives the residue-field construction and its role in point types. [Michael Temkin, Introduction to Berkovich analytic spaces](https://math.huji.ac.il/~temkin/papers/Introduction_to_Berkovich_Spaces.pdf), §2.2.2, pp. 6–7. Evaluation realizes a spectral point in a complete valued residue field.

### 0.16 Valued base change of spectra

Prove `TauCeti.Berkovich.TB0.spectral_base_change`. For complete nonarchimedean K, a K-affinoid algebra A and complete valued extension L/K, M(A⊗̂_K L)→M(A) is continuous proper surjective. For a finite normal extension it is the topological quotient by the separable Galois group, with purely inseparable extension inducing a homeomorphism. Completed algebraic closure has the corresponding Galois quotient.

Assumptions and scope: Affinoid completed tensor product; absolute values extend that of K.

Proof route. A point lifts by amalgamating H(x) and L over K and evaluating in a common complete valued field. Compactness gives properness in the affinoid case. Normal-extension orbit classification is checked on residue fields, then passed to the completed algebraic closure.

*Needs:* `TB.0/completed-residue-fields` (Completed residue fields); `TB.0/affinoid-algebras` (Affinoid algebras over valued fields).

Sources: Vladimir Berkovich, *Spectral Theory and Analytic Geometry over Non-Archimedean Fields* (maintainer-cleared edition), Proposition 1.3.5 and Corollary 1.3.6, p. 16. Normal and purely inseparable spectrum comparison. [Jérôme Poineau and Daniele Turchetti, Berkovich curves and Schottky uniformization](https://poineau.users.lmno.cnrs.fr/Textes/SchottkyVIASM.pdf), Propositions I.5.1 and I.5.5, Corollary I.5.6, pp. 19–22. Valued amalgamation proves surjectivity; the quotient statements are topological.

### 0.17 Spectra and contractive colimits

Prove `TauCeti.Berkovich.TB0.contractive_colimits`. In the category of commutative Banach rings and contractive maps, complete separated projective ℓ¹ tensor products compute pushouts. The induced map M(B⊗̂_A C)→M(B)×_{M(A)}M(C) is surjective. Filtered colimits, formed by seminormed colimit and separated completion, have spectrum canonically homeomorphic to the inverse limit of the spectra. All small colimits exist in this category; ℤ with its usual absolute value is initial.

Assumptions and scope: The tensor norm is the projective ℓ¹ norm in the general archimedean category. Nonarchimedean affinoid tensor norms are a separate specialization.

Proof route. For compatible points use valued-field amalgamation to obtain a bounded tensor evaluation. For filtered colimits compatible seminorms define a single dominated seminorm on the algebraic colimit, then extend to completion; compact Hausdorff topology identifies the inverse limit.

*Needs:* `TB.0/banach-ring-category` (Seminormed Banach rings); `TB.0/completed-residue-fields` (Completed residue fields).

Sources: [Peter Scholze, Berkovich Motives](https://people.mpim-bonn.mpg.de/scholze/BerkovichMotives.pdf), Proposition 3.2, pp. 14–15. Pushout comparison is surjective, not an asserted homeomorphism; filtered-colimit comparison is a homeomorphism. [Peter Scholze, Berkovich Motives](https://people.mpim-bonn.mpg.de/scholze/BerkovichMotives.pdf), Proposition 2.4, p. 8. Computes the contractive category colimits using infimum quotient/projective ℓ¹ seminorms and separated completion.

Acceptance: For ℂ⊗̂_ℝℂ, the two conjugate factors give two points over the single pair of field-norm points: injectivity fails. Do not replace ℓ¹ by a maximum tensor seminorm in the archimedean category. Every unital ring map ℤ→A is contractive because ||n·1||≤|n|. A trivially normed ℤ would not be initial in the archimedean category.

### 0.18 Affinoid algebras over valued fields

Define `TauCeti.Berkovich.TB0.affinoid_algebras`. For complete nonarchimedean K and positive radii r, K{r⁻¹T} consists of series with |a_I|r^I→0, with weighted Gauss norm; a K-affinoid algebra is a Banach quotient of one. Strict affinoids admit a presentation with radii 1. Morphisms are bounded K-algebra maps and presentations are auxiliary data.

Assumptions and scope: K may be trivially valued; radii need not belong to |K×|.

The interface is used in TB.0 domains/sheaf; TB.4 polyhedral domains for Bounded universal maps and scalar extension support analytic gluing and initial degenerations.

The API consists of:

- `TauCeti.Berkovich.TB0.affinoid_algebras.eval` (universal-property): A tuple b with ||b_i||≤r_i in a complete K-algebra gives a unique contractive evaluation map.
- `TauCeti.Berkovich.TB0.affinoid_algebras.quotient` (constructor): Closed-ideal quotients give affinoid algebras with quotient norm.
- `TauCeti.Berkovich.TB0.affinoid_algebras.baseChange` (functoriality): Completed scalar extension preserves affinoid presentations and identities/composites.
- `TauCeti.Berkovich.TB0.affinoid_algebras.strict_after_extension` (compatibility): A finite list of radii can be realized in a complete valued extension so that the base change is strict.

**Checks.**

- `TauCeti.Berkovich.TB0.affinoid_algebras.check1`: K{T} gives the closed unit disc, not the open disc.
- `TauCeti.Berkovich.TB0.affinoid_algebras.check2`: A radius outside the divisible closure of |K×| is allowed and need not be strict.
- `TauCeti.Berkovich.TB0.affinoid_algebras.check3`: The quotient K{T}/(T) is K, with singleton spectrum.

Construction. Use convergent power series with coefficientwise ring operations; prove the Gauss norm multiplicative, completeness and universal evaluation on bounded tuples. Separate quotient norms and prove equivalent presentations define the same bounded algebra.

*Needs:* `TB.0/banach-ring-category` (Seminormed Banach rings).

Sources: [Michael Temkin, Introduction to Berkovich analytic spaces](https://math.huji.ac.il/~temkin/papers/Introduction_to_Berkovich_Spaces.pdf), Definition 3.1.1.1 and Fact 3.1.4.1, pp. 11–14. Weighted Tate algebras, strictness, quotients and completed scalar extension.

### 0.19 Rational and affinoid domains

Define `TauCeti.Berkovich.TB0.affinoid_domains`. A rational domain {|f_i|≤r_i|g|}⊂M(A), where (g,f_i) generate the unit ideal, is represented by A{r⁻¹T}/(gT_i−f_i). An affinoid domain is a compact subset with an affinoid algebra universally representing maps from affinoid spectra whose images lie there; it carries the induced topology and unchanged completed residue fields.

Assumptions and scope: Finite inequalities, positive radii and the unit-ideal condition; general affinoid domains need not be open subsets.

The interface is used in TB.0 sheaf and adic comparison for Affinoid domains are the G-topology charts corresponding to adic affinoid opens.

The API consists of:

- `TauCeti.Berkovich.TB0.affinoid_domains.factor` (universal-property): Any affinoid map with image in the domain factors uniquely through its representing algebra.
- `TauCeti.Berkovich.TB0.affinoid_domains.rational_inter` (compatibility): Finite intersections of rational domains are rational and restriction maps compose.
- `TauCeti.Berkovich.TB0.affinoid_domains.residue_iso` (equivalence): The representing point and its image have canonically isometric H-fields.
- `TauCeti.Berkovich.TB0.affinoid_domains.rational_cover` (characterisation): An affinoid domain has a finite rational cover in the Gerritzen–Grauert range.

**Checks.**

- `TauCeti.Berkovich.TB0.affinoid_domains.check1`: A closed subdisc in a disc is an affinoid domain but is not generally topologically open.
- `TauCeti.Berkovich.TB0.affinoid_domains.check2`: Without the unit-ideal condition the displayed quotient can retain unwanted fibres over g=f_i=0.
- `TauCeti.Berkovich.TB0.affinoid_domains.check3`: The annulus r≤|T|≤1 has both T and a bounded inverse in its domain algebra.

Construction. Verify the rational universal property using g invertible on any factoring test spectrum and unit detection. Identify fibres and residue fields using the tensor-product injectivity input; glue finite rational covers for general affinoid domains.

*Needs:* `TB.0/affinoid-algebras` (Affinoid algebras over valued fields); `TB.0/unit-and-spectral-radius` (Units and spectral maximum); `TB.0/completed-residue-fields` (Completed residue fields).

Sources: [Michael Temkin, Introduction to Berkovich analytic spaces](https://math.huji.ac.il/~temkin/papers/Introduction_to_Berkovich_Spaces.pdf), Definitions 3.2.2.1 and 3.2.3.1; Facts 3.2.3.2–3.2.3.4, pp. 14–16. Distinguishes rational inequalities from the universal affinoid-domain definition and states Gerritzen–Grauert.

### 0.20 Affinoid structure sheaf and acyclicity

Construct `TauCeti.Berkovich.TB0.analytic_sheaf`. On M(A), finite affinoid-domain covers form the compact G-topology. The assignment U↦A_U with bounded restrictions is a sheaf; for a finite affinoid cover and finite A-module M the augmented Čech complex of associated sections is exact. For nontrivially valued strict K-affinoids import the stronger existing acyclicity theorem; extension to weighted nonstrict affinoids uses strictifying base change and descent.

Assumptions and scope: Finite A-module in the general Berkovich statement; strict nontrivial-value part supplied externally.

The interface is used in TB.0 gluing and TB.2 formal charts for Provides actual analytic sections, rather than only a topological seminorm space.

The API consists of:

- `TauCeti.Berkovich.TB0.analytic_sheaf.restriction` (functoriality): Domain inclusions induce bounded restriction homomorphisms satisfying identity/composition.
- `TauCeti.Berkovich.TB0.analytic_sheaf.glue` (universal-property): Compatible sections over a finite affinoid-domain cover glue uniquely.
- `TauCeti.Berkovich.TB0.analytic_sheaf.globalSections` (equivalence): Global sections recover A as a K-affinoid algebra.
- `TauCeti.Berkovich.TB0.analytic_sheaf.moduleCech` (characterisation): Finite-module sections have the stated exact augmented Čech complex.

**Checks.**

- `TauCeti.Berkovich.TB0.analytic_sheaf.check1`: A one-chart cover has the identity equalizer.
- `TauCeti.Berkovich.TB0.analytic_sheaf.check2`: Two Laurent domains covering an annulus glue the same Laurent function.
- `TauCeti.Berkovich.TB0.analytic_sheaf.check3`: The sheaf is on affinoid G-covers; arbitrary set covers are not declared admissible.

Construction. Use rational refinements and Laurent-cover acyclicity, then finite Čech refinement. Descent after adjoining the finitely many radii is a separate proof leaf recorded in the gaps.

*Needs:* `TB.0/affinoid-domains` (Rational and affinoid domains); `AdicSpacesPartII:R1/affinoid-covering-tate-acyclicity`.

Sources: [Michael Temkin, Introduction to Berkovich analytic spaces](https://math.huji.ac.il/~temkin/papers/Introduction_to_Berkovich_Spaces.pdf), §§3.3.1–3.3.3, pp. 16–18. Finite compact covers, Tate acyclicity, sheaf equalizers and affinoid analytic spaces.

### 0.21 Analytic atlases and morphisms

Define `TauCeti.Berkovich.TB0.analytic_spaces`. A K-analytic space is a locally Hausdorff space with a net of compact affinoid domains and compatible affinoid algebras, localized under compatible atlas refinements. Its structure sheaf is on the analytic G-topology. A morphism is locally induced by bounded K-affinoid algebra maps on compatible domain charts, with the resulting continuous G-continuous map and sheaf map.

Assumptions and scope: Complete nonarchimedean K; Hausdorffness is a separate property, not part of all analytic spaces.

The interface is used in TB.1–TB.7 for Supplies the actual analytic carriers for curves, quotients, line bundles and integration.

The API consists of:

- `TauCeti.Berkovich.TB0.analytic_spaces.ofAffinoid` (constructor): An affinoid spectrum with its domain sheaf is analytic.
- `TauCeti.Berkovich.TB0.analytic_spaces.glue` (constructor): Compatible analytic charts glue along analytic domains satisfying the atlas/net conditions.
- `TauCeti.Berkovich.TB0.analytic_spaces.chart_ext` (extensionality): Morphisms agreeing on an analytic-domain cover agree globally.
- `TauCeti.Berkovich.TB0.analytic_spaces.comp_id` (functoriality): Chartwise bounded morphisms form a category.
- `TauCeti.Berkovich.TB0.analytic_spaces.residueMap` (compatibility): A morphism induces the canonical isometric embedding on H-fields.

**Checks.**

- `TauCeti.Berkovich.TB0.analytic_spaces.check1`: A nonseparated doubled disc is an analytic space but need not be Hausdorff.
- `TauCeti.Berkovich.TB0.analytic_spaces.check2`: Affinoid-domain inclusions are morphisms even when the domain is not a topological open.
- `TauCeti.Berkovich.TB0.analytic_spaces.check3`: Changing to a rational refinement gives an equivalent analytic space.

Construction. Construct the atlas category, identify refinements and glue bounded chart maps. Sheaf equalizers guarantee independence on overlaps; completed residue maps verify local compatibility.

*Needs:* `TB.0/analytic-sheaf` (Affinoid structure sheaf and acyclicity).

Sources: [Michael Temkin, Introduction to Berkovich analytic spaces](https://math.huji.ac.il/~temkin/papers/Introduction_to_Berkovich_Spaces.pdf), Definitions 4.1.1.1 and 4.1.2.1; §§4.1.2–4.1.3, pp. 21–24. Specifies nets, affinoid atlases, domain sheaves and chart-local morphisms.

### 0.22 Berkovich analytification

Construct `TauCeti.Berkovich.TB0.analytification`. For a finite-type K-scheme X, glue the analytic spaces of affine pieces, whose points are scheme points ξ with an absolute value on κ(ξ) extending K. This defines Xᵃⁿ functorially, with H(x) the completion of κ(ξ). For separated proper X it is Hausdorff compact; for smooth X it is quasi-smooth. Scalar extension commutes with analytification.

Assumptions and scope: Complete nonarchimedean K; finite-type schemes; use the existing scheme and adic-analytification infrastructure, not a second scheme theory.

The interface is used in TB.2 algebraic curves; TB.4 torus for Makes algebraic divisors, rational functions and toric maps available analytically.

The API consists of:

- `TauCeti.Berkovich.TB0.analytification.point` (constructor): Pairs (ξ, extended absolute value) give analytic points with the prescribed H-field.
- `TauCeti.Berkovich.TB0.analytification.map` (functoriality): A scheme morphism induces an analytic morphism, respecting identity/composition.
- `TauCeti.Berkovich.TB0.analytification.affine_charts` (compatibility): Affine analytic charts agree with the bounded-radius construction.
- `TauCeti.Berkovich.TB0.analytification.baseChange` (equivalence): (X_L)ᵃⁿ≅Xᵃⁿ⊗̂_K L.

**Checks.**

- `TauCeti.Berkovich.TB0.analytification.check1`: (Spec K)ᵃⁿ is one point.
- `TauCeti.Berkovich.TB0.analytification.check2`: A¹ᵃⁿ contains Gauss points, so X(K) alone is the wrong carrier.
- `TauCeti.Berkovich.TB0.analytification.check3`: P¹ᵃⁿ is compact whereas A¹ᵃⁿ is not compact for nontrivial K.

Construction. On polynomial presentations cover by increasing bounded-radius affinoid domains; glue along principal-open domains. Prove the universal analytic mapping property and field-extension compatibility chartwise. Properness uses the analytic valuative/properness comparison, kept as a precise proof leaf if not imported.

*Needs:* `TB.0/analytic-spaces` (Analytic atlases and morphisms); `AdicSpacesPartII:R1/analytification-functor`.

Sources: [Michael Temkin, Introduction to Berkovich analytic spaces](https://math.huji.ac.il/~temkin/papers/Introduction_to_Berkovich_Spaces.pdf), §5.1, Exercise 5.1.1.1 and Facts 5.1.1.2, 5.1.2.1–5.1.2.2, pp. 33–34. Algebraic analytification and its local constructions; properness comparison requires the stated source proof input.

### 0.23 Normalized rank-one adic quotient

Prove `TauCeti.Berkovich.TB0.adic_rank_one_retraction`. Let A be a nonarchimedean Banach ring with a uniform topologically nilpotent unit z, A⁺ an open integrally closed subring of the power-bounded ring A°, and Spa(A,A⁺) the native adic spectrum. Normalization of rank-one valuations gives a section M(A)→Spa(A,A⁺); every adic point has a unique maximal rank-one generization and the resulting map r:Spa(A,A⁺)→M(A) is a continuous retraction and the maximal Hausdorff quotient. The section is not asserted continuous.

Assumptions and scope: Uniform unit, not merely arbitrary nonzero topologically nilpotent element. Use equivalence classes of valuations on Spa, normalized real seminorms on M(A). The plus ring is allowed to be smaller than A°; a complete Tate Huber pair with such a norm is included. The quotient is independent of A⁺, while Spa need not be. For a general complete Tate Huber pair, choose the z-adic Banach gauge from the uniform-unit hierarchy first. This is an existence statement for a suitable norm, not a retraction onto the spectrum for every compatible Banach norm.

Proof route. Normalize via z and the infimum over comparisons of powers described in KL 2.4.6. Show the maximal generization is independent of z; rational encircling neighborhoods prove continuity and the Hausdorff universal property.

*Needs:* `TB.0/spectrum` (Berkovich spectrum); `TB.0/completed-residue-fields` (Completed residue fields); `tauceti:TauCetiRoadmap/AdicSpaces#layer-2-affinoid-spectra-and-rational-subsets`; `TB.0/uniform-unit-hierarchy` (Uniform units and trivial spectrum).

Sources: [Kiran Kedlaya and Ruochuan Liu, Relative p-adic Hodge theory: Foundations](https://arxiv.org/abs/1301.0792), Definition 2.4.1 and Remark 2.4.4, pp. 37–39; Definitions 2.4.6, 2.4.8, p. 40. The normalization and maximal Hausdorff quotient work for the full adic Banach pair (A,A⁺), not only A⁺=A°. A uniform unit is the stated norm hypothesis.

Acceptance: Do not identify the whole Spa point set with M(A). Changing A⁺ can change the adic point set; for the fixed uniform-unit norm its maximal Hausdorff quotient is M(A). A claim with a merely topologically nilpotent element must not replace the uniform-unit hypothesis.

### 0.24 Rational traces and Hausdorff localization

Prove `TauCeti.Berkovich.TB0.hausdorff_localizations`. Under the uniform-unit hypotheses, rational subsets of Spa have closed affinoid traces in M(A), and rational neighborhoods encircle every Berkovich point and its open neighborhood. The Hausdorff localization at x is henselian with residue field densely embedded in H(x). Finite étale maps induce open maps on the corresponding Berkovich spectra.

Assumptions and scope: Use the KL Hausdorff-localization colimit over rational neighborhoods, followed by its stated henselian/local residue construction; no claim that a rational trace is open.

Proof route. Express normalized inequalities by rational comparisons, refine inside a chosen evaluation-open neighborhood and take the localization colimit. Henselian lifting and finite étale factorization prove the localization and openness statements.

*Needs:* `TB.0/adic-rank-one-retraction` (Normalized rank-one adic quotient); `TB.0/affinoid-domains` (Rational and affinoid domains).

Sources: [Kiran Kedlaya and Ruochuan Liu, Relative p-adic Hodge theory: Foundations](https://arxiv.org/abs/1301.0792), Definition 2.4.8, p. 40; Definition 2.4.12 and Lemma 2.4.17, pp. 41–43. Rational encircling, Hausdorff localization and étale openness in the exact uniform-unit range.

### 0.25 Strict Berkovich–adic equivalence

Establish `TauCeti.Berkovich.TB0.global_adic_comparison`. Over a complete nontrivially valued rank-one field K, Hausdorff strictly K-analytic Berkovich spaces are equivalent to taut adic spaces locally of finite type over Spa(K,K°). On an affinoid Spa(A,A°), its maximal-point quotient is M(A), and adic affinoid opens correspond to Berkovich affinoid domains. Partially proper maps give boundaryless maps; proper maps give proper maps; étale maps give quasi-étale maps; smooth maps give quasi-smooth maps. For partially proper maps, adic étaleness is equivalent to Berkovich étaleness; partially proper smooth maps are Berkovich smooth. Quasi-étaleness alone is not declared étaleness.

Assumptions and scope: Hausdorff strict and taut locally finite-type hypotheses; arbitrary locally noetherian adic spaces and nonstrict Berkovich spaces are outside this equivalence.

Proof route. Glue the normalized affinoid comparison along domain intersections. Tautness gives the correct separated quotient topology. For morphisms use the reduction/germ criterion for absence of relative boundary, then the stated local étale and smooth comparisons. The categorical equivalence proof invokes the precise Huber comparison input in the gaps.

*Needs:* `TB.0/adic-rank-one-retraction` (Normalized rank-one adic quotient); `TB.0/analytic-spaces` (Analytic atlases and morphisms).

Sources: [Bogdan Zavyalov, Mod-p Poincaré duality in p-adic analytic geometry](https://arxiv.org/pdf/2111.01830v3), Appendix A, Definitions A.5–A.6, Lemmas A.7–A.8, pp. 84–86. Equivalence and one-direction morphism comparisons; quasi-étale is retained rather than silently strengthened to étale. [Bogdan Zavyalov, Mod-p Poincaré duality in p-adic analytic geometry](https://arxiv.org/pdf/2111.01830v3), Corollary A.11, p. 86. The boundaryless hypothesis upgrades the quasi-étale/quasi-smooth implications.

Acceptance: Over a complete nontrivially valued rank-one field K, Hausdorff strictly K-analytic Berkovich spaces are equivalent to taut adic spaces locally of finite type over Spa(K,K°). On an affinoid Spa(A,A°), its maximal-point quotient is M(A), and adic affinoid opens correspond to Berkovich affinoid domains. Partially proper maps give boundaryless maps; proper maps give proper maps; étale maps give quasi-étale maps; smooth maps give quasi-smooth maps.

### 0.26 Real quotient of analytic preadic spaces

Prove `TauCeti.Berkovich.TB0.real_quotient`. For a preadic space over an analytic field, identify points with the same maximal normalized rank-one generization and equip the set of these generizations with the quotient topology. Partially proper opens are the saturated inverse images of opens in this real quotient. For an adic space, quasi-compactness descends to the real quotient without a tautness hypothesis; if the space is taut its real quotient is Hausdorff and is its maximal Hausdorff quotient, and every partially proper open is taut.

Assumptions and scope: The tautness condition is essential for the global maximal Hausdorff assertion; use the KL analytic-field normalization.

Proof route. Glue the local rank-one quotient sets and topologies. A continuous quotient preserves quasi-compactness. Tautness gives separation of distinct rank-one points; any continuous map to a Hausdorff space is constant on generization classes. For a partially proper open, the image of a quasi-compact open has compact, hence closed, image in the Hausdorff quotient; its saturated inverse image contains its closure and stays inside the partially proper open. Together with quasiseparatedness this proves tautness.

*Needs:* `TB.0/global-adic-comparison` (Strict Berkovich–adic equivalence).

Sources: [Kiran Kedlaya and Ruochuan Liu, Relative p-adic Hodge theory: Foundations](https://arxiv.org/abs/1301.0792), Definition 8.2.11 and Lemma 8.2.12(a)–(c), pp. 160–161; Example 8.2.13, p. 161. Real quotient, partially proper opens, tautness and its failure in the doubled-disc example.

Acceptance: The doubled-origin closed disc has a non-Hausdorff real quotient, so the tautness qualification cannot be removed. A partially proper open in a taut adic space remains taut even if it is not quasi-compact.

### 0.27 Hybrid analytic spaces

Construct `TauCeti.Berkovich.TB0.hybrid_analytic_space`. For a projective meromorphic family X over a punctured complex disc, choose 0<r<1 small enough for its defining coefficients. The Banach ring A_r of convergent Laurent series uses coefficient hybrid norm max(|c|∞,|c|triv) and weight rⁿ. Its spectrum is the closed disc; the associated analytic family has usual complex fibers for t≠0 and central fiber at parameter 0 equal to X_{ℂ((t))}ᵃⁿ, where the formal parameter has nonarchimedean absolute value r. The topology makes |f|^{log r/log|t|} converge to its nonarchimedean evaluation; the SNC-model hybrid inverse limit gives the same space.

Assumptions and scope: Projective meromorphic family; the Laurent series have finitely many negative terms and finite weighted hybrid sum; fix r within the convergence radius. The complex family is a smooth projective submersion meromorphic at 0; shrink to the closed disc of radius r. The analytic-space machinery must include general Banach-ring bases, not just nonarchimedean K-affinoid charts.

The interface is used in DKY §4 and ArithmeticDynamics:DY.2 for Provides a common topology for local potentials; dynamical measure convergence is a consumer theorem requested from ArithmeticDynamics.

The API consists of:

- `TauCeti.Berkovich.TB0.hybrid_analytic_space.projection` (data): The hybrid space projects continuously and properly to the closed parameter disc.
- `TauCeti.Berkovich.TB0.hybrid_analytic_space.complexFiber` (equivalence): For t≠0 the fiber is homeomorphic to the usual complex analytic X_t.
- `TauCeti.Berkovich.TB0.hybrid_analytic_space.centralFiber` (equivalence): At 0 the fiber is the nonarchimedean analytification over ℂ((t)) with |t|=r.
- `TauCeti.Berkovich.TB0.hybrid_analytic_space.evaluation` (characterisation): The rescaled complex evaluations extend to the central nonarchimedean evaluations.
- `TauCeti.Berkovich.TB0.hybrid_analytic_space.sncLimit` (compatibility): The analytic construction agrees with the inverse limit of SNC hybrid models.

**Checks.**

- `TauCeti.Berkovich.TB0.hybrid_analytic_space.check1`: For the constant family P¹, the central fiber is Berkovich P¹, not the complex sphere.
- `TauCeti.Berkovich.TB0.hybrid_analytic_space.check2`: The parameter monomial t has rescaled absolute value r at every nonzero fiber and at the center.
- `TauCeti.Berkovich.TB0.hybrid_analytic_space.check3`: A series converging only on a smaller disc cannot be used at a larger fixed r.

Construction. Build the hybrid Banach base, identify nonzero fibers with powered complex absolute values and the zero fiber with the t-adic completion. Compare affinoid evaluations with SNC-model logarithmic coordinates and pass to the model inverse limit.

*Needs:* `TB.0/banach-ring-category` (Seminormed Banach rings); `TB.0/analytic-spaces` (Analytic atlases and morphisms); `TB.0/analytification` (Berkovich analytification).

Sources: [Sébastien Boucksom and Mattias Jonsson, Tropical and non-Archimedean limits of degenerating families of volume forms](https://arxiv.org/pdf/1605.05277), Definition 4.9, pp. 23–24 and Proposition 4.12, pp. 25–26; Appendix A. Supplies the topology and Banach analytic realization; no volume-form or dynamical convergence result is inferred. [Laura DeMarco, Holly Krieger and Hexi Ye, Uniform Manin–Mumford for a family of genus 2 curves](https://arxiv.org/pdf/1901.09945v2), §4, pp. 18–22. Uses the rescaled potential convention in the dynamical family.

Acceptance: For a projective meromorphic family X over a punctured complex disc, choose 0<r<1 small enough for its defining coefficients. The Banach ring A_r of convergent Laurent series uses coefficient hybrid norm max(|c|∞,|c|triv) and weight rⁿ. Its spectrum is the closed disc; the associated analytic family has usual complex fibers for t≠0 and central fiber X_{ℂ((t))}ᵃⁿ for |t|=r. The topology makes |f|^{log r/log|t|} converge to its nonarchimedean evaluation; the SNC-model hybrid inverse limit gives the same space.

### 0.28 Uniform Gelfand representation

Prove `TauCeti.Berkovich.TB0.gelfand_representation`. For a uniform commutative Banach ring A, the evaluation homomorphism A→∏_{x∈M(A)}H(x) is isometric for the supremum norm: ||a||=max_x|a(x)|. For arbitrary A its kernel is the spectral seminorm-zero ideal, not necessarily zero.

Assumptions and scope: Uniform means the given complete norm is power-multiplicative.

Proof route. For a nonzero element in a power-multiplicative ring, adjoin its inverse with inverse norm bounded by its reciprocal. Power multiplicativity keeps the norm of one equal to one. Nonemptiness of this Banach localization produces a field-valued evaluation attaining the original norm. The spectral maximum then identifies the Gelfand kernel and the isometric uniform representation.

*Needs:* `TB.0/unit-and-spectral-radius` (Units and spectral maximum); `TB.0/completed-residue-fields` (Completed residue fields).

Sources: [Peter Scholze, Berkovich Motives](https://people.mpim-bonn.mpg.de/scholze/BerkovichMotives.pdf), Definitions 2.19–2.20 and Proposition 2.21, pp. 12–13. The uniform Gelfand transform is an isometric embedding. Vladimir Berkovich, *Spectral Theory and Analytic Geometry over Non-Archimedean Fields* (maintainer-cleared edition), Corollary 1.3.2, p. 16. The spectral/Gelfand kernel is the seminorm-zero ideal.

Acceptance: The dual numbers have a nonzero element in the kernel before uniformization.

### 0.29 Idempotents and clopen subsets

Prove `TauCeti.Berkovich.TB0.idempotents_and_clopens`. For a commutative Banach ring A, e↦{x∈M(A):x(e)=1} is a bijection from idempotents to clopen subsets, carrying 0,1 and complementary idempotents to ∅,M(A) and complementary subsets.

Assumptions and scope: Complete commutative Banach ring with normalized unit.

Proof route. Multiplicativity restricts x(e) to 0 or 1 and the unit test gives uniqueness. Lift idempotents by Newton iteration from the uniform completion. For a two-domain spectral cover, the overconvergent Laurent equalizer glues compatible idempotents. Refine a clopen partition by finitely many such domains; complementing the vanishing-locus convention gives the stated value-one convention. The closed-ideal/equalizer input in KL Corollary 2.8.9 remains to be checked in full.

*Needs:* `TB.0/unit-and-spectral-radius` (Units and spectral maximum); `TB.0/gelfand-representation` (Uniform Gelfand representation).

Sources: [Peter Scholze, Berkovich Motives](https://people.mpim-bonn.mpg.de/scholze/BerkovichMotives.pdf), Theorem 2.18 and its direct proof, pp. 11–12. Classifies clopen spectral subsets by ring idempotents.

Acceptance: For ℝ×ℝ the four idempotents correspond to the four subsets of its two-point spectrum.

### 0.30 Archimedean Banach fields

Prove `TauCeti.Berkovich.TB0.gelfand_mazur`. A commutative Banach field K with |2|>1 is isomorphic as a normed field to ℝ or ℂ with |·|_usual^α for a unique exponent 0<α≤1.

Assumptions and scope: Complete multiplicative absolute value, normalized at one; archimedean condition |2|>1.

Proof route. Ostrowski identifies the completed prime subfield. Apply the complex spectral/nonemptiness argument after complex scalar extension to force algebraic degree at most two; retain the real alternative and the norm exponent.

*Needs:* `TB.0/nonempty-spectrum` (Existence of spectral points).

Sources: [Peter Scholze, Berkovich Motives](https://people.mpim-bonn.mpg.de/scholze/BerkovichMotives.pdf), Theorem 2.12, p. 10. Gelfand–Mazur in the norm-sensitive category, including real fields and exponents.

Acceptance: A nonarchimedean field is excluded by |2|>1.

### 0.31 Connected algebraic curves remain connected

Prove `TauCeti.Berkovich.TB0.connected_analytification`. The Berkovich analytification of a smooth geometrically connected algebraic curve over algebraically closed complete nontrivially valued K is connected. For its smooth proper completion X̄, H⁰(X̄ᵃⁿ,O)=H⁰(X̄,O)=K. Removing finitely many classical points leaves a connected analytic curve.

Assumptions and scope: Smooth geometrically connected curve; finite puncture set in its proper completion.

Proof route. Proper GAGA identifies global analytic functions with algebraic global functions. A clopen analytic decomposition gives a global idempotent, impossible in K, so X̄ᵃⁿ is connected. Smooth analytic curve charts are locally path connected; classical punctures are tree endpoints in disc charts. Excise finitely many such endpoints without separating the remaining curve. Proper GAGA is the recorded analytic-comparison proof input.

*Needs:* `TB.0/analytification` (Berkovich analytification); `TB.0/idempotents-and-clopens` (Idempotents and clopen subsets); `TB.1/tree-hyperbolic-metric` (Paths, tangent directions and hyperbolic metric); `SchemeAndStackFoundations:SF.3`.

Sources: [Michael Temkin, Introduction to Berkovich analytic spaces](https://math.huji.ac.il/~temkin/papers/Introduction_to_Berkovich_Spaces.pdf), Facts 5.1.2.1–5.1.2.2, p. 34. Proper coherent GAGA identifies global functions and analytic morphisms. [Jérôme Poineau and Daniele Turchetti, Berkovich curves and Schottky uniformization](https://poineau.users.lmno.cnrs.fr/Textes/SchottkyVIASM.pdf), Proposition I.6.12 and Remark I.6.14, pp. 25–26. Path structure of disc charts gives the endpoint removal argument.

### 0.32 Uniform units and trivial spectrum

Define `TauCeti.Berkovich.TB0.uniform_unit_hierarchy`. A topologically nilpotent element satisfies ||aⁿ||→0. A uniform unit is an invertible topologically nilpotent z with ρ(z)ρ(z⁻¹)=1. A Banach ring is free of trivial spectrum when every H(x) has nontrivial absolute value; equivalently the ideal generated by its topologically nilpotent elements is the unit ideal. For nonzero nonarchimedean Banach rings, being a bounded Banach algebra over an analytic field implies admitting a uniform unit, which implies admitting a topologically nilpotent unit, which implies freedom of trivial spectrum. The converse from a uniform unit to an analytic-field algebra in characteristic p requires additional norm control, for example equivalence of the norm with the spectral norm.

Assumptions and scope: The Banach ring is nonzero and separated complete. An analytic field is complete and nontrivially valued. All scalar homomorphisms in the hierarchy are bounded for the specified norms.

The interface is used in KL §2.4; TB.0 normalized rank-one quotient for Fix exactly the uniform-unit normalization required for a retraction for the specified norm, and explain how complete Tate pairs admit a compatible gauge.

The API consists of:

- `TauCeti.Berkovich.TB0.uniform_unit_hierarchy.constant_value` (characterisation): For a uniform unit z and every x∈M(A), x(z)=ρ(z)∈(0,1).
- `TauCeti.Berkovich.TB0.uniform_unit_hierarchy.hierarchy` (characterisation): A bounded analytic-field algebra has a uniform unit; a uniform unit is a topologically nilpotent unit; its existence excludes trivially valued H(x).
- `TauCeti.Berkovich.TB0.uniform_unit_hierarchy.no_trivial_iff_unit_ideal` (characterisation): Freedom of trivial spectrum is equivalent to generation of the unit ideal by topologically nilpotent elements.
- `TauCeti.Berkovich.TB0.uniform_unit_hierarchy.tate_gauge` (compatibility): For a complete Tate Huber ring with ring of definition A₀, pseudouniformizer z∈A₀ and 0<c<1, the separated gauge ||a||=inf{cⁿ:z⁻ⁿa∈A₀} induces the given topology and makes z a uniform unit with spectral value c. This is a chosen gauge; the norm-sensitive M(A) is not declared invariant under arbitrary changes of compatible norm.

**Checks.**

- `TauCeti.Berkovich.TB0.uniform_unit_hierarchy.check1`: A nontrivially valued complete field has uniform units, and all its spectral residue fields are nontrivially valued.
- `TauCeti.Berkovich.TB0.uniform_unit_hierarchy.check2`: A trivially normed nonzero field has no topologically nilpotent unit and fails freedom of trivial spectrum.
- `TauCeti.Berkovich.TB0.uniform_unit_hierarchy.check3`: For k((z₁))×k((z₂)) with supremum norm and |z_i|=exp(−c_i), where c₁/c₂ is irrational, (z₁,z₂) is a topologically nilpotent unit but no uniform unit exists for this norm.
- `TauCeti.Berkovich.TB0.uniform_unit_hierarchy.check4`: In characteristic p, the complete weighted norm max_i ρⁱ(1+|i|) on F_p((z)) has a uniform unit z yet admits no bounded scalar map from any analytic field; this rejects the unqualified converse.

Construction. The spectral maximum and the inverse identity force x(z)=ρ(z) for every spectral point. Apply the unit criterion to the ideal of topologically nilpotent elements for the trivial-spectrum characterization. A topologically nilpotent scalar from the analytic base field gives a uniform unit. In characteristic p and a uniform Banach ring, the estimates on all positive and negative powers of z extend the Laurent-series map from F_p((z)) boundedly. For a complete Tate Huber ring choose a ring of definition A₀ containing the pseudouniformizer and use the z-adic gauge norm; this selects a uniform normalization rather than proving the original norm already had it.

*Needs:* `TB.0/banach-ring-category` (Seminormed Banach rings); `TB.0/unit-and-spectral-radius` (Units and spectral maximum); `TB.0/completed-residue-fields` (Completed residue fields).

Sources: [Kiran Kedlaya and Ruochuan Liu, Relative p-adic Hodge theory: Foundations](https://arxiv.org/abs/1301.0792), Remark 2.3.9, p. 35; Remark 2.4.4, p. 39. Defines the hierarchy and the Tate gauge norm; the characteristic-p converse is used only with the norm correction recorded in E9.

### 0.33 Surjectivity detected by residue fields

Prove `TauCeti.Berkovich.TB0.residue_field_surjectivity`. For an A-linear map M→N over a nonarchimedean Banach ring A, with N finitely generated, surjectivity is equivalent to surjectivity of M⊗_A H(x)→N⊗_A H(x) for every x∈M(A). If B is faithfully finite étale over A with its finite Banach module topology, M(B)→M(A) is surjective; under the uniform-unit hypotheses of Hausdorff localization it is also open.

Assumptions and scope: No topology or finite-generation hypothesis is imposed on M. The displayed module tensors are algebraic. N must be finite. Étale openness uses the same analytic hypotheses as KL §2.4.

Proof route. The cokernel is finite. For each maximal ideal choose a spectral point with that kernel by the closed maximal-ideal quotient construction. Faithful scalar extension from its residue field to H(x), followed by Nakayama, annihilates the localized cokernel; hence it vanishes. For finite étale B, the completed fiber over H(x) is a nonzero product of finite valued-field extensions. Its nonempty spectrum lifts x. The Hausdorff-localization factorization proves openness.

*Needs:* `TB.0/completed-residue-fields` (Completed residue fields); `TB.0/nonempty-spectrum` (Existence of spectral points); `TB.0/hausdorff-localizations` (Rational traces and Hausdorff localization).

Sources: [Kiran Kedlaya and Ruochuan Liu, Relative p-adic Hodge theory: Foundations](https://arxiv.org/abs/1301.0792), Lemmas 2.3.12 and 2.3.14, p. 36; Lemma 2.4.17(c), p. 43. Finite-cokernel detection, faithful finite étale spectral surjectivity, and openness.

Acceptance: The zero map to A is detected at every spectral residue field when A is nonzero. Faithfulness excludes a finite étale algebra supported on only one factor of a product ring. Openness and surjectivity are distinct assertions; the finite étale hypothesis alone does not remove the faithfulness requirement for surjectivity.

## Layer 1: Discs, annuli and metric trees

Gauss evaluations and completed residue fields distinguish the four point types. Unique paths give the hyperbolic tree metric and annular skeleta. The descent statement retains geometric component counts and possible end swapping, so an ordinary split interval is never assumed for an arbitrary annulus form.

External layer inputs: the native library contracts above.

### 1.1 Gauss points, discs and projective line

Construct `TauCeti.Berkovich.TB1.gauss_line_and_discs`. A¹ᵃⁿ is the space of multiplicative seminorms on K[T] extending K. For a∈K and r≥0 the Gauss point ζ(a,r) evaluates Σc_n(T−a)ⁿ as max_n|c_n|rⁿ. Glue two affine charts by T↦T⁻¹ to obtain P¹ᵃⁿ. Open/closed discs and annuli are the corresponding strict/non-strict radius inequalities.

Assumptions and scope: Complete nonarchimedean K. For r=0 use evaluation at a; no restriction r∈|K×|.

The interface is used in TB.1 types and annuli; TB.6 potential theory for Explicit evaluations fix the point carrier, kernel and logarithmic radius conventions.

The API consists of:

- `TauCeti.Berkovich.TB1.gauss_line_and_discs.gauss_eval` (simp): ζ(a,r)(Σc_n(T−a)ⁿ)=max|c_n|rⁿ.
- `TauCeti.Berkovich.TB1.gauss_line_and_discs.gauss_eq` (characterisation): ζ(a,r)=ζ(b,s) iff r=s and |a−b|≤r.
- `TauCeti.Berkovich.TB1.gauss_line_and_discs.disc_domain` (compatibility): The closed disc is M(K{r⁻¹(T−a)}).
- `TauCeti.Berkovich.TB1.gauss_line_and_discs.inversion` (equivalence): Inversion exchanges the two projective charts and sends an annulus to the reciprocal-radius annulus.

**Checks.**

- `TauCeti.Berkovich.TB1.gauss_line_and_discs.check1`: ζ(a,0) is the classical a-point.
- `TauCeti.Berkovich.TB1.gauss_line_and_discs.check2`: ζ(0,1)(T)=1 even though evaluation at 0 gives zero.
- `TauCeti.Berkovich.TB1.gauss_line_and_discs.check3`: ζ(0,r)=ζ(b,r) for |b|≤r, so centers are not unique.

Construction. Prove Gauss multiplicativity by choosing the extremal dominant coefficient, then identify the bounded-radius affinoid charts and glue the inverse-coordinate charts.

*Needs:* `TB.0/affinoid-algebras` (Affinoid algebras over valued fields); `TB.0/analytification` (Berkovich analytification).

Sources: [Jérôme Poineau and Daniele Turchetti, Berkovich curves and Schottky uniformization](https://poineau.users.lmno.cnrs.fr/Textes/SchottkyVIASM.pdf), §I.1, pp. 4–5; §I.3, pp. 12–15. Gauss seminorms, disc equality criterion and disc/annulus domains.

### 1.2 Four types of points

Prove `TauCeti.Berkovich.TB1.four_point_types`. Over algebraically closed complete nontrivially valued K, points of A¹ᵃⁿ are: I, evaluation at a∈K; II, ζ(a,r) with r>0 in |K×|; III, ζ(a,r) with r>0 outside |K×|; IV, the infimum seminorm of a decreasing family of closed discs with empty intersection. The IV infimum radius is positive. These cases are disjoint and exhaustive; for general K the classification is made after completed algebraic closure with Galois descent.

Assumptions and scope: Algebraic closedness is required for this explicit list over K; spherical completeness is not assumed.

Proof route. Use nested discs extracted from values of T−a; a common point gives a Gauss center, and an empty intersection gives IV. Completeness rules out empty intersection with radius tending to zero. Compare value-group rational rank and residue transcendence for II/III.

*Needs:* `TB.1/gauss-line-and-discs` (Gauss points, discs and projective line); `TB.0/completed-residue-fields` (Completed residue fields); `TB.0/spectral-base-change` (Valued base change of spectra).

Sources: [Jérôme Poineau and Daniele Turchetti, Berkovich curves and Schottky uniformization](https://poineau.users.lmno.cnrs.fr/Textes/SchottkyVIASM.pdf), Definition I.2.9, Lemma I.2.11, Proposition I.2.12 and Example I.2.20, pp. 7–11. Classification, the radius/value-group distinction and an explicit type-IV construction. In Example I.2.20 the Hahn coefficients are complex, as corrected in E11.

Acceptance: Type IV is not deleted for a merely complete field. At II the residue transcendence degree is one; at III the value-group rational-rank increment is one. Over a nonclosed field a type-I point need not be K-rational.

### 1.3 Paths, tangent directions and hyperbolic metric

Construct `TauCeti.Berkovich.TB1.tree_hyperbolic_metric`. P¹ᵃⁿ over algebraically closed K is uniquely path connected. On H=P¹ᵃⁿ\P¹(K), use d(x,y)=2log diam(x∨y)−log diam(x)−log diam(y) in an affine coordinate, extending across infinity by coordinate invariance. This is the intrinsic path metric and can induce a finer topology than the analytic topology. At type II, tangent directions correspond to closed points of its residue P¹; at III there are two directions and at I/IV one.

Assumptions and scope: Complete algebraically closed nontrivial K; the metric is on nonclassical points and classical endpoints are at infinite path distance.

The interface is used in TB.2 metric skeleton; TB.6 Hsia kernels for Intrinsic arc length and branch slopes are the common metric normalization.

The API consists of:

- `TauCeti.Berkovich.TB1.tree_hyperbolic_metric.segment` (data): There is a unique arc [x,y], compatible with subdivision at z∈[x,y].
- `TauCeti.Berkovich.TB1.tree_hyperbolic_metric.join` (data): x∨y is the least containing disc point in an affine rooted tree.
- `TauCeti.Berkovich.TB1.tree_hyperbolic_metric.distance_add` (characterisation): For z on [x,y]⊂H, d(x,y)=d(x,z)+d(z,y).
- `TauCeti.Berkovich.TB1.tree_hyperbolic_metric.coordinate_invariant` (compatibility): PGL₂(K) acts by isometries on H.
- `TauCeti.Berkovich.TB1.tree_hyperbolic_metric.directions` (equivalence): The tangent set at a type-II point is the residue projective line.

**Checks.**

- `TauCeti.Berkovich.TB1.tree_hyperbolic_metric.check1`: d(ζ(0,r),ζ(0,s))=|log r−log s| for r,s>0.
- `TauCeti.Berkovich.TB1.tree_hyperbolic_metric.check2`: Distinct classical endpoints have infinite length to their joining segment; they are not finite-metric points.
- `TauCeti.Berkovich.TB1.tree_hyperbolic_metric.check3`: A type-III point has two branches, while a type-II Gauss point has all residue directions.

Construction. Join nested-disc points at their least common containing disc. Logarithmic diameter identifies each ordered segment with an interval and proves additivity. Inversion patches the affine formula; residue discs enumerate branches.

*Needs:* `TB.1/four-point-types` (Four types of points).

Sources: [Jérôme Poineau and Daniele Turchetti, Berkovich curves and Schottky uniformization](https://poineau.users.lmno.cnrs.fr/Textes/SchottkyVIASM.pdf), Proposition I.6.12, pp. 25–26; §§I.8.1–I.8.9, pp. 29–31. Unique paths, tangent directions and multiplicative length, converted here to its logarithm, equivalently the difference of −log radial coordinates. [Charles Favre and Juan Rivera-Letelier, Équidistribution quantitative des points de petite hauteur sur la droite projective](https://arxiv.org/pdf/math/0407471), §3, pp. 19–22. Hyperbolic tree distance and the distinction from the compact analytic topology.

### 1.4 Annular skeleton and deformation

Construct `TauCeti.Berkovich.TB1.annular_skeleton`. For an ordinary open annulus r<|T|<R, its skeleton is {ζ(0,ρ):r<ρ<R}, parameterized by s=−logρ, with logarithmic length log(R/r). Retraction sends x to ζ(0,|T(x)|). It is a strong deformation retraction; closed and half-open versions retain the appropriate boundary points. Punctured discs give unbounded rays.

Assumptions and scope: 0≤r<R; infinite logarithmic length is allowed when r=0 or R=∞. Ordinary annuli and non-split forms are distinguished.

The interface is used in TB.2 formal nodes; TB.7 Tate quotient for Annular lengths become graph edges and the Tate circle circumference.

The API consists of:

- `TauCeti.Berkovich.TB1.annular_skeleton.section` (constructor): s↦ζ(0,exp(−s)) embeds the radius interval.
- `TauCeti.Berkovich.TB1.annular_skeleton.retraction` (projection): τ(x)=ζ(0,|T(x)|), with τ∘section=id.
- `TauCeti.Berkovich.TB1.annular_skeleton.homotopy` (structure): The deformation fixes the skeleton pointwise and ends at inclusion∘τ.
- `TauCeti.Berkovich.TB1.annular_skeleton.coordinate_change` (compatibility): An annular coordinate changes s by a translation or reflection; intrinsic length is invariant.
- `TauCeti.Berkovich.TB1.annular_skeleton.punctured_ray` (compatibility): A punctured disc skeleton is a ray of infinite length toward its puncture.

**Checks.**

- `TauCeti.Berkovich.TB1.annular_skeleton.check1`: The annulus |q|<|T|<1 has length −log|q|.
- `TauCeti.Berkovich.TB1.annular_skeleton.check2`: For T↦a/T with a≠0, a₋₁=a and a₁=0: the annulus r<|T|<R maps to |a|/R<|T|<|a|/r, reversing orientation and preserving log(R/r). This uses the E12-corrected coefficient.
- `TauCeti.Berkovich.TB1.annular_skeleton.check3`: A closed annulus has its two endpoints; an open annulus excludes them.

Construction. Identify the Gauss interval via Laurent evaluations; every complementary residue ball attaches at exactly one skeletal point. Enlarge disc radii continuously to the attachment radius to construct the homotopy, then descend through valued scalar extension.

*Needs:* `TB.1/gauss-line-and-discs` (Gauss points, discs and projective line); `TB.1/tree-hyperbolic-metric` (Paths, tangent directions and hyperbolic metric).

Sources: [Jérôme Poineau and Daniele Turchetti, Berkovich curves and Schottky uniformization](https://poineau.users.lmno.cnrs.fr/Textes/SchottkyVIASM.pdf), Definitions I.7.1–I.7.2, Lemmas I.7.8–I.7.9 and Propositions I.7.10–I.7.11, pp. 26–29. Skeleta and explicit deformation homotopies for discs/annuli. [Matthew Baker, Sam Payne, Joseph Rabinoff, On the structure of nonarchimedean analytic curves](https://arxiv.org/abs/1404.0279), §2, Propositions 2.4–2.5 and 2.10, pp. 4–6. Generalized annulus skeleta, retractions and boundary versions.

### 1.5 Integral slopes of analytic units

Prove `TauCeti.Berkovich.TB1.annular_integral_slopes`. For a nonzero analytic Laurent series f on an annulus, −log|f(ζ_s)|=min_n(v(a_n)+ns), a locally finite concave integral-slope piecewise-affine function. On any subannulus where f is invertible with no zero or pole, its skeletal slope is a single integer. A zero-free analytic function on an open ball has constant absolute value.

Assumptions and scope: Complete nonarchimedean K; restrict to compact subintervals to obtain finitely many Laurent terms and breakpoints.

Proof route. Use convergence to reduce the Gauss maximum on compact subannuli to finitely many dominant terms. A slope change produces a Newton-polygon zero after algebraic closure; invertibility rules it out. The ball assertion follows by nested closed-ball unit criteria.

*Needs:* `TB.1/annular-skeleton` (Annular skeleton and deformation); `TB.0/unit-and-spectral-radius` (Units and spectral maximum).

Sources: [Matthew Baker, Sam Payne, Joseph Rabinoff, On the structure of nonarchimedean analytic curves](https://arxiv.org/abs/1404.0279), Propositions 2.4–2.5, pp. 4–5; proof of Theorem 5.15, pp. 21–22. Annular units and ball norm constancy are the local pieces of the slope formula. [Eric Katz, Joseph Rabinoff and David Zureick-Brown, Uniform bounds for the number of rational points on curves of small Mordell–Weil rank](https://arxiv.org/pdf/1504.00694), §4.1, formula (4.1), p. 27. The Laurent minimum has exactly this sign in coordinate s=−log|T|.

Acceptance: f=Tⁿ has slope n. f=T−a has a breakpoint at s=v(a), so invertibility on a whole annulus cannot be dropped.

### 1.6 Virtual annuli and metric descent

Define `TauCeti.Berkovich.TB1.virtual_annuli_descent`. A virtual disc or annulus in A¹ᵃⁿ_K becomes a finite disjoint union of ordinary discs or annuli over a completed algebraic closure. For an annulus A with m geometric components, use Poineau–Turchetti modulus Mod(A)=Mod(component)^(1/m), so additive length is the geometric component length divided by m. Intrinsic skeleton and retraction descend. Abstract annulus forms can have an end-swapping action and a folded half-open quotient skeleton; they must not be identified with an ordinary interval without a splitting hypothesis.

Assumptions and scope: Complete nonarchimedean K; the finite component number and A¹-domain condition are explicit where used.

The interface is used in CDN Appendix A.2; TB.2 noncompact triangulations for Controls nonsplit branches and finite-field descent without pretending every edge is split.

The API consists of:

- `TauCeti.Berkovich.TB1.virtual_annuli_descent.geometricComponents` (data): Base change gives finitely many conjugate ordinary components.
- `TauCeti.Berkovich.TB1.virtual_annuli_descent.skeleton` (data): The descended skeleton is the intrinsic complement of virtual open balls.
- `TauCeti.Berkovich.TB1.virtual_annuli_descent.modulus` (characterisation): log Mod(A)=log Mod(A_geometric_component)/m.
- `TauCeti.Berkovich.TB1.virtual_annuli_descent.retraction_descends` (compatibility): The geometric retractions are Galois equivariant and descend.
- `TauCeti.Berkovich.TB1.virtual_annuli_descent.split_case` (equivalence): For an ordinary split annulus m=1 and the usual logarithmic interval is recovered.

**Checks.**

- `TauCeti.Berkovich.TB1.virtual_annuli_descent.check1`: For a split annulus, log Mod equals log(R/r).
- `TauCeti.Berkovich.TB1.virtual_annuli_descent.check2`: For m conjugate components the chosen descended length is geometric length/m; omitting m changes this convention.
- `TauCeti.Berkovich.TB1.virtual_annuli_descent.check3`: An abstract form swapping its two ends may fold the interval, so an unconditional two-endpoint API fails.

Construction. Use Galois transitivity on geometric components and uniqueness of the intrinsic complement-of-balls skeleton. Descend the homotopy; calculate length from the chosen modulus convention and retain end stabilizers for abstract forms.

*Needs:* `TB.1/annular-skeleton` (Annular skeleton and deformation); `TB.0/spectral-base-change` (Valued base change of spectra).

Sources: [Jérôme Poineau and Daniele Turchetti, Berkovich curves and Schottky uniformization](https://poineau.users.lmno.cnrs.fr/Textes/SchottkyVIASM.pdf), Definitions I.7.1–I.7.2, Lemma I.7.4, Remark I.7.5, Definition I.7.6 and Remark I.7.7, pp. 26–28. A¹-domain descent, the end-swap caution and the component-count modulus convention.

## Layer 2: Semistable models and skeleta of curves

Construct finite marked skeleta and their global retraction from annular charts, then compare them to the imported combinatorial dual graph. Semistable existence over a nonnoetherian rank-one valuation ring is an owned theorem. The noncompact theory uses locally finite triangulations and formal gluing rather than an unjustified finite graph.

External layer inputs: `AdicSpacesPartII:R2/admissible-formal-scheme`; `AdicSpacesPartII:R2/raynaud-generic-fibre`; `SchemeAndStackFoundations:SF.3`; `TropicalAndBerkovichArithmetic:TB.0`; `tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs`; `tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`; `tauceti:TauCetiRoadmap/StableReduction#layer-7-semistable-reduction`.

### 2.1 Semistable vertex set

Define `TauCeti.Berkovich.Curve.semistable_vertex_sets_and_skeleta`. A semistable vertex set is a finite set V of type-2 points of X̂^an whose complement is a disjoint union of open balls and finitely many open annuli, with the punctures in distinct open-ball components. This inherited identifier now retains only the vertex-set definition.

The interface is used in BPR structure §§3–4; TB.2 and TB.5 for Provides the actual skeleton and retraction used by metric and tropicalization theory.

The API consists of:

- `TauCeti.Berkovich.Curve.SemistableVertexSet.points` (projection): Return the finite subset V of type-2 points.
- `TauCeti.Berkovich.Curve.SemistableVertexSet.ext` (extensionality): Equal finite subsets define equal vertex sets.
- `TauCeti.Berkovich.Curve.SemistableVertexSet.ofDecomposition` (constructor): A finite type-2 subset with the stated decomposition and puncture separation gives a vertex set.
- `TauCeti.Berkovich.Curve.SemistableVertexSet.punctures_separated` (characterisation): Distinct punctures lie in distinct complementary ball components.

**Checks.**

- `TauCeti.Berkovich.Curve.vertexSet_unpunctured`: For D empty the puncture condition is vacuous.
- `TauCeti.Berkovich.Curve.vertexSet_sameBall_rejected`: Two punctures in one complementary ball prevent semistability for the punctured curve.
- `TauCeti.Berkovich.Curve.vertexSet_loop_allowed`: A complementary annulus may have both boundary ends at the same vertex; a simple-graph restriction would reject valid examples.

Construction. Use the native algebraic curve and its missing Berkovich analytification, with the TB.1 analytic ball and annulus classifications. Specify the decomposition as a property of V, without choosing an enumeration of infinitely many ball components.

*Needs:* `TropicalAndBerkovichArithmetic:TB.0`; `SchemeAndStackFoundations:SF.3`; `TB.1/annular-skeleton` (Annular skeleton and deformation); `TB.0/analytification` (Berkovich analytification); `TB.1/four-point-types` (Four types of points).

Sources: [Matthew Baker, Sam Payne, Joseph Rabinoff, On the structure of non-archimedean analytic curves](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/StructureOfNonarchimedeanCurves.pdf?download=1), Definition 3.1, printed p. 101; arXiv p. 7. Refines the reviewed extraction; published passages collated.

Acceptance: Two punctures in one complementary ball invalidate the candidate.

### 2.2 Skeleton of a semistable decomposition

Construct `TauCeti.Berkovich.Curve.skeleton`. For a semistable V, define Σ(X,V) as V union the intrinsic skeleta of the generalized open annulus components of X^an minus V. A punctured ball contributes a ray. Its completed skeleton is the closure in X̂^an.

The interface is used in BPR structure §§3–4; TB.2 and TB.5 for Provides the actual skeleton and retraction used by metric and tropicalization theory.

The API consists of:

- `TauCeti.Berkovich.Curve.skeleton_mem` (characterisation): Membership means being a vertex or a point of a complementary annulus skeleton.
- `TauCeti.Berkovich.Curve.skeleton_vertex_mem` (simp): Every vertex is in Σ.
- `TauCeti.Berkovich.Curve.completedSkeleton` (data): The closure of Σ in X̂^an.
- `TauCeti.Berkovich.Curve.skeleton_no_annuli` (example): If there are no generalized annulus components, Σ=V.

**Checks.**

- `TauCeti.Berkovich.Curve.skeleton_noAnnuli`: No annulus components implies Σ=V.
- `TauCeti.Berkovich.Curve.skeleton_annulusInterior`: An intrinsic annulus-skeleton point is in Σ even when not in V.
- `TauCeti.Berkovich.Curve.skeleton_puncture`: A puncture is in the completed skeleton and is not in Σ.

Construction. Take the union in the analytic point space using TB.1 annulus skeleta. Define the completed-skeleton accessor by closure; equality with Σ union D is proved separately.

*Needs:* `TB.2/semistable-vertex-sets-and-skeleta` (Semistable vertex set); `TB.1/annular-skeleton` (Annular skeleton and deformation); `TB.0/analytification` (Berkovich analytification).

Sources: [Matthew Baker, Sam Payne, Joseph Rabinoff, On the structure of non-archimedean analytic curves](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/StructureOfNonarchimedeanCurves.pdf?download=1), Definitions 3.3 and 3.5, printed pp. 102–103. Refines the reviewed extraction; published passages collated.

Acceptance: A puncture belongs to the completed skeleton but not to X^an.

### 2.3 Limit boundaries of semistable components

Prove `TauCeti.Berkovich.Curve.component_limit_boundary`. An open-ball component has one boundary vertex. An open annulus of modulus r has its skeleton parametrization extending continuously from (0,r) to [0,r], with both ends in V, possibly equal. A punctured ball has the extension [0,∞] with one end in V and one in D.

Proof route. BPR Proposition 2.10 yields limits of regular-function norms as logarithmic radius tends to zero. Lemma 2.13 gives constant norms off the annular skeleton; use a zero-free collar to check endpoint continuity, then compactness. Apply the same norm-limit argument at both annulus ends or at the puncture. The annular integral-slope formula and constancy on complementary balls give the required limits; the corrected logarithmic coordinate tends to zero at a normalized unit-radius boundary.

*Needs:* `TB.2/semistable-vertex-sets-and-skeleta` (Semistable vertex set); `TropicalAndBerkovichArithmetic:TB.0`; `TB.1/annular-skeleton` (Annular skeleton and deformation); `TB.0/analytification` (Berkovich analytification); `TB.1/annular-integral-slopes` (Integral slopes of analytic units).

Sources: [Matthew Baker, Sam Payne, Joseph Rabinoff, On the structure of non-archimedean analytic curves](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/StructureOfNonarchimedeanCurves.pdf?download=1), Lemma 3.2 with proof, printed pp. 101–102. Refines the reviewed extraction; published passages collated.

Acceptance: A loop annulus has equal endpoint images.

### 2.4 Ball components off the skeleton

Prove `TauCeti.Berkovich.Curve.skeleton_complement_balls`. Every component B of X^an minus Σ is an open ball with a singleton limit boundary in Σ.

Proof route. Combine the component boundary lemma with BPR Lemma 2.12 for an annulus minus its intrinsic skeleton.

*Needs:* `TB.2/skeleton` (Skeleton of a semistable decomposition); `TB.2/component-limit-boundary` (Limit boundaries of semistable components); `TB.1/annular-skeleton` (Annular skeleton and deformation); `TB.0/analytification` (Berkovich analytification).

Sources: [Matthew Baker, Sam Payne, Joseph Rabinoff, On the structure of non-archimedean analytic curves](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/StructureOfNonarchimedeanCurves.pdf?download=1), Lemma 3.4(3), printed p. 102. Refines the reviewed extraction; published passages collated.

Acceptance: The boundary point may lie in an edge interior, not in V.

### 2.5 Closure and punctures of the skeleton

Prove `TauCeti.Berkovich.Curve.completed_skeleton_boundary`. Σ is closed in X^an, its limit boundary in X̂^an is D, and its closure is Σ union D. It is compact exactly when D is empty.

Proof route. Use the finitely many segments and rays with their endpoint extensions. For D empty the union is compact; any omitted puncture is a limit point preventing compactness in the Hausdorff proper analytification.

*Needs:* `TB.2/skeleton` (Skeleton of a semistable decomposition); `TB.2/component-limit-boundary` (Limit boundaries of semistable components); `TropicalAndBerkovichArithmetic:TB.0`; `TB.1/annular-skeleton` (Annular skeleton and deformation); `TB.0/analytification` (Berkovich analytification).

Sources: [Matthew Baker, Sam Payne, Joseph Rabinoff, On the structure of non-archimedean analytic curves](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/StructureOfNonarchimedeanCurves.pdf?download=1), Lemma 3.4(1)–(2), Definition 3.5, printed pp. 102–103. Refines the reviewed extraction; published passages collated.

Acceptance: A punctured-ball ray is not compact, and its added endpoint is not at finite path distance.

### 2.6 Disc characterization of the skeleton

Prove `TauCeti.Berkovich.Curve.skeleton_disc_characterization`. Σ consists of the points admitting no affinoid neighborhood isomorphic to a closed unit ball and disjoint from V.

Proof route. Off Σ, use the complementary open ball. For x in Σ outside V, any connected candidate neighborhood disjoint from V stays in the same annulus component. Apply BPR Proposition 2.4.

*Needs:* `TB.2/skeleton` (Skeleton of a semistable decomposition); `TB.2/skeleton-complement-balls` (Ball components off the skeleton); `TB.1/annular-skeleton` (Annular skeleton and deformation); `TB.0/analytification` (Berkovich analytification).

Sources: [Matthew Baker, Sam Payne, Joseph Rabinoff, On the structure of non-archimedean analytic curves](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/StructureOfNonarchimedeanCurves.pdf?download=1), Lemma 3.4(4), printed pp. 102–103. Refines the reviewed extraction; published passages collated.

Acceptance: The disjointness from V cannot be omitted in the connected-neighborhood argument.

### 2.7 Retraction onto the skeleton

Construct `TauCeti.Berkovich.Curve.retraction_to_the_skeleton`. Define τ_V:X^an→Σ to fix Σ and send every other point to the unique boundary point of its complementary open-ball component. Continuity is a separate lemma.

The interface is used in BPR structure §§3–4; TB.2 and TB.5 for Provides the actual skeleton and retraction used by metric and tropicalization theory.

The API consists of:

- `TauCeti.Berkovich.Curve.retraction_on_skeleton` (simp): τ_V fixes Σ pointwise.
- `TauCeti.Berkovich.Curve.retraction_on_ball` (characterisation): τ_V is constant on each complementary ball with value its boundary point.
- `TauCeti.Berkovich.Curve.retraction_surjective` (other): Every point of Σ is attained.
- `TauCeti.Berkovich.Curve.retraction_unique` (extensionality): These skeleton and ball evaluation laws determine the map.

**Checks.**

- `TauCeti.Berkovich.Curve.retraction_vertex`: τ_V(v)=v for a vertex.
- `TauCeti.Berkovich.Curve.retraction_edgeInterior`: An edge-interior point is fixed rather than rounded to a vertex.
- `TauCeti.Berkovich.Curve.retraction_sameBall`: Two points in one off-skeleton ball have the same image.

Construction. Use the unique boundary supplied by skeleton-complement-balls, and the identity on Σ.

*Needs:* `TB.2/skeleton` (Skeleton of a semistable decomposition); `TB.2/skeleton-complement-balls` (Ball components off the skeleton); `TB.1/annular-skeleton` (Annular skeleton and deformation); `TB.0/analytification` (Berkovich analytification).

Sources: [Matthew Baker, Sam Payne, Joseph Rabinoff, On the structure of non-archimedean analytic curves](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/StructureOfNonarchimedeanCurves.pdf?download=1), Definition 3.7, printed p. 103. Refines the reviewed extraction; published passages collated.

Acceptance: An edge-interior point is fixed.

### 2.8 Continuity of skeletal retraction

Prove `TauCeti.Berkovich.Curve.continuous_retraction`. τ_V is continuous and restricts on each complementary generalized annulus to its intrinsic retraction.

Proof route. The annulus assertion follows from BPR Lemma 2.12. Supply the vertex-neighborhood proof left as an exercise in Lemma 3.8. This is an unresolved proof input; continuity on the complementary components alone is insufficient.

*Needs:* `TB.2/retraction-to-the-skeleton` (Retraction onto the skeleton); `TB.1/annular-skeleton` (Annular skeleton and deformation); `TB.0/analytification` (Berkovich analytification).

Sources: [Matthew Baker, Sam Payne, Joseph Rabinoff, On the structure of non-archimedean analytic curves](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/StructureOfNonarchimedeanCurves.pdf?download=1), Lemma 3.8, printed p. 103. Refines the reviewed extraction; published passages collated.

Acceptance: Check vertices with infinitely many attached balls.

### 2.9 Connectedness of the skeleton

Prove `TauCeti.Berkovich.Curve.connected_skeleton`. Both Σ and its completed skeleton are connected.

Proof route. Use connectedness of the curve analytification, continuity and surjectivity of τ, then connectedness of its closure in the proper completion. The connectedness target is supplied by proper GAGA and the classical-endpoint removal argument.

*Needs:* `TB.2/continuous-retraction` (Continuity of skeletal retraction); `TB.2/completed-skeleton-boundary` (Closure and punctures of the skeleton); `TropicalAndBerkovichArithmetic:TB.0`; `TB.1/annular-skeleton` (Annular skeleton and deformation); `TB.0/analytification` (Berkovich analytification); `TB.0/connected-analytification` (Connected algebraic curves remain connected).

Sources: [Matthew Baker, Sam Payne, Joseph Rabinoff, On the structure of non-archimedean analytic curves](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/StructureOfNonarchimedeanCurves.pdf?download=1), Proposition 3.9, printed p. 103. Refines the reviewed extraction; published passages collated.

Acceptance: Completing puncture ends does not create an extra connected component.

### 2.10 Existence of a semistable vertex set

Prove `TauCeti.Berkovich.Curve.stable_reduction_and_minimal_skeleta`. X has a semistable vertex set. This inherited identifier now records the existence part of Theorem 4.22.

Proof route. Apply the owned rank-one semistable-reduction target to the smooth proper completion. Use the formal-model/skeleton correspondence, then refine to separate the finite puncture set into distinct complementary balls. The DVR theorem alone is insufficient.

*Needs:* `TB.2/rank-one-semistable-reduction` (Rank-one semistable reduction); `TB.2/formal-model-skeleton` (Formal models and metric dual graphs); `TB.2/refinement-and-field-extension` (Refinement and valued extension).

Sources: [Matthew Baker, Sam Payne, Joseph Rabinoff, On the structure of non-archimedean analytic curves](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/StructureOfNonarchimedeanCurves.pdf?download=1), Theorem 4.22, printed p. 112. Refines the reviewed extraction; published passages collated.

Acceptance: The punctured case needs refinement, not an arbitrary vertex addition.

### 2.11 Intrinsic minimal skeleton

Prove `TauCeti.Berkovich.Curve.intrinsic_minimal_skeleton`. If χ(X)=2−2g(X̂)−#D≤0 and V is inclusion-minimal, Σ(X,V) is the locus with no affinoid neighborhood isomorphic to the closed unit ball.

Proof route. Use the exact genus-zero tail/bridge contraction theorem and semistable refinement. If a minimal skeleton met a forbidden closed-ball neighborhood, refine at its Gauss boundary; its retract in the contractible ball would be a finite tree with a genus-zero vertex of valence below two. The contraction contradicts minimality when χ≤0.

*Needs:* `TB.2/stable-reduction-and-minimal-skeleta` (Existence of a semistable vertex set); `TB.2/skeleton-disc-characterization` (Disc characterization of the skeleton); `TB.2/continuous-retraction` (Continuity of skeletal retraction); `TB.1/annular-skeleton` (Annular skeleton and deformation); `TB.0/analytification` (Berkovich analytification); `TB.2/genus-zero-contractions` (Contractions of genus-zero vertices); `TB.2/vertex-genus-and-genus-formula` (Vertex genera and analytic genus).

Sources: [Matthew Baker, Sam Payne, Joseph Rabinoff, On the structure of non-archimedean analytic curves](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/StructureOfNonarchimedeanCurves.pdf?download=1), Theorem 4.22(1), printed p. 112. Refines the reviewed extraction; published passages collated.

Acceptance: The χ≤0 restriction excludes the unpunctured projective line.

### 2.12 Stable vertices of a hyperbolic curve

Prove `TauCeti.Berkovich.Curve.stable_vertex_characterization`. For χ(X)<0 and inclusion-minimal V, V is stable and equals the points of Σ of valence at least three or positive vertex genus. The genus of a type-2 point is the genus of the smooth proper curve over the residue field with function field the residue field of its completed residue field.

Proof route. Remove each allowable genus-zero low-valence vertex by the exact contraction theorem. Under χ<0 the exceptional one/two-puncture configurations cannot exhaust the curve. The remaining vertices are exactly positive-genus points or topological vertices of valence at least three.

*Needs:* `TB.2/stable-reduction-and-minimal-skeleta` (Existence of a semistable vertex set); `TB.2/skeleton` (Skeleton of a semistable decomposition); `TB.1/annular-skeleton` (Annular skeleton and deformation); `TB.0/analytification` (Berkovich analytification); `TB.2/genus-zero-contractions` (Contractions of genus-zero vertices); `TB.2/vertex-genus-and-genus-formula` (Vertex genera and analytic genus).

Sources: [Matthew Baker, Sam Payne, Joseph Rabinoff, On the structure of non-archimedean analytic curves](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/StructureOfNonarchimedeanCurves.pdf?download=1), Definition 4.20 and Theorem 4.22(2), printed pp. 111–112. Refines the reviewed extraction; published passages collated.

Acceptance: A positive-genus vertex remains even at valence below three.

### 2.13 Uniqueness of the minimal skeleton

Prove `TauCeti.Berkovich.Curve.unique_minimal_skeleton`. For χ(X)≤0 there is a unique set-theoretic minimal skeleton.

Proof route. A finite vertex set has a minimal subset, and the intrinsic description is independent of that choice.

*Needs:* `TB.2/intrinsic-minimal-skeleton` (Intrinsic minimal skeleton); `TB.1/annular-skeleton` (Annular skeleton and deformation); `TB.0/analytification` (Berkovich analytification).

Sources: [Matthew Baker, Sam Payne, Joseph Rabinoff, On the structure of non-archimedean analytic curves](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/StructureOfNonarchimedeanCurves.pdf?download=1), Corollary 4.23, printed p. 112. Refines the reviewed extraction; published passages collated.

Acceptance: A Tate curve has one minimal circle but many minimal one-point vertex sets.

### 2.14 Uniqueness of stable vertices

Prove `TauCeti.Berkovich.Curve.unique_stable_vertex_set`. For χ(X)<0 there is a unique stable vertex set.

Proof route. The intrinsic minimal skeleton is independent of a vertex presentation. Its positive-genus points and valence-at-least-three points are intrinsic and form the stable set when χ<0. The contraction theorem shows that any stable semistable presentation is minimal, giving uniqueness.

*Needs:* `TB.2/unique-minimal-skeleton` (Uniqueness of the minimal skeleton); `TB.2/stable-vertex-characterization` (Stable vertices of a hyperbolic curve); `TB.1/annular-skeleton` (Annular skeleton and deformation); `TB.0/analytification` (Berkovich analytification); `TB.2/genus-zero-contractions` (Contractions of genus-zero vertices); `TB.2/vertex-genus-and-genus-formula` (Vertex genera and analytic genus).

Sources: [Matthew Baker, Sam Payne, Joseph Rabinoff, On the structure of non-archimedean analytic curves](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/StructureOfNonarchimedeanCurves.pdf?download=1), Corollary 4.23, printed p. 112. Refines the reviewed extraction; published passages collated.

Acceptance: Do not apply the assertion to a Tate curve with χ=0.

### 2.15 Rank-one semistable reduction

Prove `TauCeti.Berkovich.TB2.rank_one_semistable_reduction`. A smooth proper geometrically connected curve over a complete nontrivially valued rank-one field acquires a split semistable admissible formal model after a finite valued extension. Over algebraically closed K it has a semistable model over K° itself. The valuation ring may be nonnoetherian. For a finite marked set, choose a model/vertex set adapted to the marks after an extension splitting them.

Assumptions and scope: Admissible formal models over K° are topologically finitely presented and flat, not assumed noetherian. Finite extension is allowed before splitting nodes and marked points.

Proof route. Use the rank-one analytic semistable-reduction theorem cited by BPR, then separate finitely many marked residue directions by admissible modifications. The full BL85 Theorem 7.1 proof is a specifically recorded open proof leaf; the DVR stable-reduction roadmap supplies only its own discrete range.

*Needs:* `AdicSpacesPartII:R2/admissible-formal-scheme`; `tauceti:TauCetiRoadmap/StableReduction#layer-7-semistable-reduction`.

Sources: [Matthew Baker, Sam Payne, Joseph Rabinoff, On the structure of nonarchimedean analytic curves](https://arxiv.org/abs/1404.0279), Theorem 4.22 and proof, pp. 16–17. Uses BL85 Theorem 7.1 for rank-one semistable existence; its DVR replacement would leave the main hypothesis untreated. [Jérôme Poineau and Daniele Turchetti, Berkovich curves and Schottky uniformization](https://poineau.users.lmno.cnrs.fr/Textes/SchottkyVIASM.pdf), Theorem II.2.20 and Remark II.2.21, pp. 42–43. Relates triangulation and semistable models after extension.

Acceptance: Dense value groups are included. A noetherian/DVR model alone is insufficient for this node.

### 2.16 Formal models and metric dual graphs

Establish `TauCeti.Berkovich.TB2.formal_model_skeleton`. Over algebraically closed complete nontrivial K, semistable formal models of a smooth proper connected curve correspond to semistable vertex sets V. The point over a generic component is type II; smooth closed special-fiber points have open-ball fibers; a node locally étale over uv=a has an open-annulus fiber of length v(a)=−log|a|. The metric dual graph, retaining loops and multiple edges, identifies with Σ(X,V). Domination corresponds to inclusion of vertex sets.

Assumptions and scope: Admissible semistable formal model; 0<|a|<1; special-fiber normalizations define component genera.

Proof route. Use formal étale charts to identify analytic fibers and glue Gauss intervals along generic points. For the converse cover by vertex affinoids and annular edge domains and glue their canonical formal models; uniqueness uses admissible-model comparison.

*Needs:* `TB.2/rank-one-semistable-reduction` (Rank-one semistable reduction); `TB.1/annular-skeleton` (Annular skeleton and deformation); `TB.2/skeleton` (Skeleton of a semistable decomposition); `AdicSpacesPartII:R2/raynaud-generic-fibre`; `tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs`; `TB.0/analytification` (Berkovich analytification).

Sources: [Matthew Baker, Sam Payne, Joseph Rabinoff, On the structure of nonarchimedean analytic curves](https://arxiv.org/abs/1404.0279), Proposition 4.3, Theorem 4.6, §4.9, Proposition 4.10 and Theorem 4.11, pp. 11–15. Formal fibers and the vertex-set/model correspondence, including the metric and order relation.

Acceptance: A self-node yields a loop counted twice in valency. An equation uv=πⁿ has length n·v(π), not unit length unless n=1 and v(π)=1.

### 2.17 Vertex genera and analytic genus

Prove `TauCeti.Berkovich.TB2.vertex_genus_and_genus_formula`. At a type-II vertex v let g(v) be the genus of the smooth proper normalization of the residue component. For smooth proper connected X over algebraically closed K, g(X)=b₁(Σ)+Σ_v g(v). Import the algebraic dual-graph arithmetic-genus formula and flat-family genus invariance from StableReduction, and prove the formal/analytic identification and invariance under subdivision. Over general K use geometric stable genus; residue genus alone can change under extension.

Assumptions and scope: K complete rank one; algebraically closed for the displayed residue-genus formula without descent weights.

Proof route. Compare the special fiber with the imported algebraic numerical type after a finite presentation/model descent. Formal chart normalization identifies analytic residue genera. New subdivision vertices are rational genus-zero components, so both sides are unchanged.

*Needs:* `TB.2/formal-model-skeleton` (Formal models and metric dual graphs); `tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs`; `tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`; `TB.1/annular-skeleton` (Annular skeleton and deformation); `TB.0/analytification` (Berkovich analytification).

Sources: [Jérôme Poineau and Daniele Turchetti, Berkovich curves and Schottky uniformization](https://poineau.users.lmno.cnrs.fr/Textes/SchottkyVIASM.pdf), Definition II.2.14, Remark II.2.16, Definition II.2.22 and Theorem II.2.23, pp. 40–43. Stable genus and the analytic/algebraic genus formula; the example rules out unqualified residue-genus invariance.

Acceptance: A good-reduction genus-g curve has a one-vertex skeleton of vertex genus g. A split Tate curve has b₁=1 and all vertex genera zero. A potentially good-reduction elliptic point can have residue genus zero before extension and stable genus one.

### 2.18 Refinement and valued extension

Prove `TauCeti.Berkovich.TB2.refinement_and_field_extension`. Any finite set of type-II points is contained in a semistable vertex set. Two such vertex sets have a common refinement. Enlarging V subdivides old edges into unions of new edges and may attach finite trees; retractions compose τ_V∘τ_V′=τ_V. Under an isometric extension with split semistable model, the corresponding geometric skeleton preserves natural-log edge lengths and vertex genera; replacing v_K by the convention v_L(π_L)=1 rescales lengths by the ramification factor. General descent uses the virtual-annulus convention separately.

Assumptions and scope: Smooth proper connected curve over algebraically closed K for finite-point refinement; split model for the scalar-extension assertion.

Proof route. Insert points on annular edges and in finitely many ball branches, using a larger initial semistable model if necessary. Uniqueness of paths proves retraction composition. Base change of uv=a preserves −log|a|; regularization subdivides the edge rather than changing its total length.

*Needs:* `TB.2/formal-model-skeleton` (Formal models and metric dual graphs); `TB.2/retraction-to-the-skeleton` (Retraction onto the skeleton); `TB.1/virtual-annuli-descent` (Virtual annuli and metric descent); `TB.1/annular-skeleton` (Annular skeleton and deformation); `TB.0/analytification` (Berkovich analytification).

Sources: [Matthew Baker, Sam Payne, Joseph Rabinoff, On the structure of nonarchimedean analytic curves](https://arxiv.org/abs/1404.0279), Theorem 4.11, Corollary 4.23 and §5.3, pp. 13–18. Model domination/refinement and the corrected union-of-subedges statement. [Jérôme Poineau and Daniele Turchetti, Berkovich curves and Schottky uniformization](https://poineau.users.lmno.cnrs.fr/Textes/SchottkyVIASM.pdf), §I.7, pp. 26–29; §II.2, pp. 40–43. Base-change and stable-genus cautions.

### 2.19 Marked skeleta and puncture rays

Construct `TauCeti.Berkovich.TB2.marked_extended_skeleton`. For a smooth proper connected curve X, finite distinct K-rational marked set D and a vertex set V separating the marks into distinct ball components, define Σ(X,D,V) by adjoining the paths from V toward each puncture in (X\D)ᵃⁿ. These are infinite-length rays; adjoining the classical marked endpoints gives the topological completion, not a finite metric edge. The deformation retraction and refinement maps preserve the compact core and marked directions.

Assumptions and scope: K algebraically closed complete nontrivial for the split statement; finite extension to split nonsplit marks is explicit.

The interface is used in TB.3 slope formula and TB.5 faithful rays for Orders at punctures are outgoing slopes on explicitly labeled infinite ends.

The API consists of:

- `TauCeti.Berkovich.TB2.marked_extended_skeleton.core` (projection): Removing the marked open rays recovers the compact proper skeleton.
- `TauCeti.Berkovich.TB2.marked_extended_skeleton.ray` (constructor): Each mark determines a ray with coordinate −log|t| tending to infinity.
- `TauCeti.Berkovich.TB2.marked_extended_skeleton.retraction` (structure): The strong deformation retraction fixes the extended skeleton.
- `TauCeti.Berkovich.TB2.marked_extended_skeleton.refine` (functoriality): Refinements preserve puncture labels and commute with retractions.

**Checks.**

- `TauCeti.Berkovich.TB2.marked_extended_skeleton.check1`: P¹ minus {0,∞} with a Gauss vertex gives two rays joined at that vertex.
- `TauCeti.Berkovich.TB2.marked_extended_skeleton.check2`: A single puncture produces one ray, not a loop.
- `TauCeti.Berkovich.TB2.marked_extended_skeleton.check3`: The classical puncture is absent from (X\D)ᵃⁿ although it is present in the topological completion.

Construction. Choose a semistable refinement separating the finitely many marks; each punctured complementary ball has its intrinsic annular ray. Glue its radius retraction to the core and check continuity at attachment vertices.

*Needs:* `TB.2/refinement-and-field-extension` (Refinement and valued extension); `TB.1/annular-skeleton` (Annular skeleton and deformation); `TB.0/analytification` (Berkovich analytification).

Sources: [Matthew Baker, Sam Payne, Joseph Rabinoff, On the structure of nonarchimedean analytic curves](https://arxiv.org/abs/1404.0279), Definitions 3.1 and 3.3, Remark 3.6 and Lemma 3.8, pp. 7–9. Open algebraic curves, completed skeleta and retractions. [Matthew Baker, Sam Payne, Joseph Rabinoff, Nonarchimedean geometry, tropicalization, and metrics on curves](https://arxiv.org/abs/1104.0320), Theorem 5.22, pp. 26–27. Uses the punctured skeleton and its unbounded ends.

### 2.20 Locally finite triangulations and analytic nodes

Define `TauCeti.Berkovich.TB2.noncompact_triangulations`. For a smooth analytic curve over a p-adic local field, the canonical analytic skeleton is the complement of points with a virtual open-disc neighborhood. A triangulation is a closed discrete set of type-II/III points cutting the curve into relatively compact virtual discs and virtual annuli; its skeleton is locally finite, not necessarily finite. A node is a skeletal point with positive genus (the residue-curve genus at the point), valence different from two, analytic boundary, or a strict inclusion of the local constant field into a branch constant field. Nodes belong to every triangulation.

Assumptions and scope: CDN Appendix A.2 local-field hypotheses; compact curves with nonempty skeleton have a finite intrinsic minimal node triangulation in its stated range. General smooth curves use the broader triangulation existence input separately.

The interface is used in CDN Appendix A.3 and automorphisms for Provides the analytic data whose formal model and automorphism group are compared.

The API consists of:

- `TauCeti.Berkovich.TB2.noncompact_triangulations.canonicalSkeleton` (data): The intrinsic skeleton is independent of a chosen triangulation.
- `TauCeti.Berkovich.TB2.noncompact_triangulations.nodes` (characterisation): A point is a node exactly under the four stated alternatives.
- `TauCeti.Berkovich.TB2.noncompact_triangulations.contains_nodes` (compatibility): Every triangulation contains the node set.
- `TauCeti.Berkovich.TB2.noncompact_triangulations.refinement` (relation): Adding a closed discrete compatible point set refines the triangulation without assuming it finite.

**Checks.**

- `TauCeti.Berkovich.TB2.noncompact_triangulations.check1`: An open annulus has a canonical interval skeleton and no interior valence-two genus-zero node over an algebraically closed field.
- `TauCeti.Berkovich.TB2.noncompact_triangulations.check2`: A positive-genus vertex is a node even when its valence is two.
- `TauCeti.Berkovich.TB2.noncompact_triangulations.check3`: A noncompact locally finite curve can require infinitely many vertices; a finite-set carrier would lose it.

Construction. Characterize virtual-disc neighborhoods and annular interiors; all failures of an unmarked annular interval are exactly the node alternatives. Local finiteness follows from closed discreteness and the analytic triangulation theorem; no global finiteness is inferred in the noncompact case.

*Needs:* `TB.1/virtual-annuli-descent` (Virtual annuli and metric descent); `TB.2/vertex-genus-and-genus-formula` (Vertex genera and analytic genus); `TB.1/annular-skeleton` (Annular skeleton and deformation); `TB.0/analytification` (Berkovich analytification).

Sources: [Pierre Colmez, Gabriel Dospinescu and Wiesława Nizioł, Cohomologie des revêtements du demi-plan de Drinfeld](https://arxiv.org/pdf/1704.08928v2), Appendix A.2, pp. 51–52. Canonical skeleton, four node alternatives, closed discrete triangulations and relatively compact complementary discs.

Acceptance: For a smooth analytic curve over a p-adic local field, the canonical analytic skeleton is the complement of points with a virtual open-disc neighborhood. A triangulation is a closed discrete set of type-II/III points cutting the curve into relatively compact virtual discs and virtual annuli; its skeleton is locally finite, not necessarily finite. A node is a skeletal point with positive stable genus, valence different from two, analytic boundary, or a strict inclusion of the local constant field into a branch constant field. Nodes belong to every triangulation.

### 2.21 Triangulated curves and formal automorphisms

Prove `TauCeti.Berkovich.TB2.triangulated_formal_automorphisms`. For a normal flat admissible formal curve over O_K in the CDN local-field setting, let S be the set of analytic points corresponding to generic points of its special-fiber components. An automorphism of its analytic generic fiber preserving S extends uniquely to a formal automorphism. If the model is semistable, S is its associated triangulation; normality and flatness alone do not make S a triangulation. A split semistable chart uv=a, a≠0, gives the annular chart. This modelwise statement asserts neither a converse reconstruction theorem nor a single proper finite model for every noncompact curve.

Assumptions and scope: Normal flat admissible formal curve in the local-field setting of CDN Appendix A.2; semistability is an additional hypothesis for the triangulation assertion.

Proof route. Use the normal formal model and its component-point set S. The extension criterion for automorphisms preserving S is the cited Ducros theorem; on semistable charts it respects the disc/annulus decomposition. Supply the locally finite gluing and uniqueness proof before closure; CDN does not itself establish a converse reconstruction theorem.

*Needs:* `TB.2/noncompact-triangulations` (Locally finite triangulations and analytic nodes); `AdicSpacesPartII:R2/admissible-formal-scheme`; `AdicSpacesPartII:R2/raynaud-generic-fibre`; `TB.1/annular-skeleton` (Annular skeleton and deformation); `TB.0/analytification` (Berkovich analytification).

Sources: [Pierre Colmez, Gabriel Dospinescu and Wiesława Nizioł, Cohomologie des revêtements du demi-plan de Drinfeld](https://arxiv.org/pdf/1704.08928v2), Appendix A.2–A.3, pp. 52–53, citing Ducros Theorem 6.3.23. Gives the component-point set and the automorphism-extension criterion for normal flat models. The set is a triangulation for a semistable model; a general triangulation-to-model reconstruction is a separate proof input.

### 2.22 Strong deformation onto a skeleton

Prove `TauCeti.Berkovich.TB2.skeletal_strong_deformation`. A semistable (marked) skeleton of a smooth algebraic curve over algebraically closed complete nontrivially valued K is a strong deformation retract of its analytification with punctures removed. The homotopy fixes the skeleton pointwise, ends at τ, and is compatible with the annular radius homotopies and the boundary point of every complementary ball.

Assumptions and scope: Finite semistable vertex set; finite split marks; use the analytic topology on source and skeleton.

Proof route. Glue the annular radial homotopies and rooted-ball contraction while fixing each vertex. At a vertex use star neighborhoods with finitely many annular cuts and all but finitely many attached residue balls. Continuity at these vertices, including infinitely many ball directions, is the recorded proof input; componentwise continuity does not suffice.

*Needs:* `TB.2/continuous-retraction` (Continuity of skeletal retraction); `TB.2/skeleton-complement-balls` (Ball components off the skeleton); `TB.1/annular-skeleton` (Annular skeleton and deformation).

Sources: [Matthew Baker, Sam Payne, Joseph Rabinoff, On the structure of nonarchimedean analytic curves](https://arxiv.org/abs/1404.0279), §2.3, p. 4 and Lemma 3.8, p. 9. The annular homotopy is recalled in §2.3. Lemma 3.8 states continuous retraction only; it does not prove the strong homotopy, and its vertex-continuity exercise remains an explicit proof input. [Jérôme Poineau and Daniele Turchetti, Berkovich curves and Schottky uniformization](https://poineau.users.lmno.cnrs.fr/Textes/SchottkyVIASM.pdf), Lemmas I.7.8–I.7.9 and Propositions I.7.10–I.7.11, pp. 28–29; paragraph following Theorem II.2.20, p. 43. Explicit local disc/annulus homotopies and the global strong-retraction assertion. Gluing and continuity at all vertex directions remain the recorded proof input.

### 2.23 Contractions of genus-zero vertices

Prove `TauCeti.Berkovich.TB2.genus_zero_contractions`. Let V be a semistable vertex set of a smooth punctured curve and x∈V have genus zero. In the completed skeleton, a valence-one x can be removed if its adjoining edge has other endpoint outside the puncture set D; delete x and that edge interior. A valence-two x can be removed if its two other endpoints are not both in D; join its two incident edges, adding their lengths. The resulting V\{x} is semistable.

Assumptions and scope: Algebraically closed complete nontrivially valued K; retain puncture endpoints and the exceptional configurations in the stated conditions.

Proof route. Translate the genus-zero component contraction of BL85 Lemma 6.1 into formal fibers and vertex sets. Rational tail contraction removes its ball branch; a rational bridge contraction joins annuli and adds moduli. The nonnoetherian contraction proof is the specified BL85 proof input.

*Needs:* `TB.2/formal-model-skeleton` (Formal models and metric dual graphs); `TB.2/vertex-genus-and-genus-formula` (Vertex genera and analytic genus); `TB.2/marked-extended-skeleton` (Marked skeleta and puncture rays).

Sources: [Matthew Baker, Sam Payne, Joseph Rabinoff, On the structure of nonarchimedean analytic curves](https://arxiv.org/abs/1404.0279), Proposition 4.21, p. 16. Gives both contractions with the marked-endpoint exceptions and cites BL85 Lemma 6.1.

Acceptance: A genus-zero bridge lying between two punctures is excluded by the two-endpoint condition. Positive genus forbids these rational-component contractions.

## Layer 3: Divisors, slope formula and specialization

Keep graph principal divisors, the negative-outgoing Laplacian and analytic slope specialization in separate named contracts. The unweighted graph Riemann–Roch theorem uses b₁. Vertex genus is retained through metrized complexes and their residue-curve functions; it is not inserted into the unweighted theorem by changing a symbol.

External layer inputs: the native library contracts above.

### 3.1 Metric graphs with loops and vertex genus

Define `TauCeti.Berkovich.TB3.metric_graphs`. A compact metric graph Γ is the realization of a finite connected graph with half-edges, loops and multiple edges and a positive real length on every edge, modulo length-preserving subdivision. Optionally attach a nonnegative integer genus g(v) to finitely many vertices; its polarized genus is b₁(Γ)+Σg(v). An extended graph additionally has finitely many labeled infinite rays, but compact-graph Riemann–Roch uses the compact core.

Assumptions and scope: A one-point graph with no edges is allowed; zero-length edges are contracted before forming a model.

The interface is used in TB.2 numerical type; TB.3 Jacobian; Yuan Appendix A.5 for Retains metric and normalization-genus information absent from a simple intersection graph.

The API consists of:

- `TauCeti.Berkovich.TB3.metric_graphs.realize` (constructor): A finite positive-length multigraph has a compact connected metric realization.
- `TauCeti.Berkovich.TB3.metric_graphs.subdivide` (equivalence): Splitting an edge into positive lengths with the same sum preserves Γ isometrically.
- `TauCeti.Berkovich.TB3.metric_graphs.tangent` (data): Tangent directions are germs of incident intervals; a loop contributes two at its vertex.
- `TauCeti.Berkovich.TB3.metric_graphs.genus` (data): The polarized genus is b₁+Σg(v), independent of genus-zero subdivisions.
- `TauCeti.Berkovich.TB3.metric_graphs.skeleton` (compatibility): A proper split semistable curve skeleton gives this carrier, with length v(a).

**Checks.**

- `TauCeti.Berkovich.TB3.metric_graphs.check1`: A single loop has b₁=1 and vertex valence two.
- `TauCeti.Berkovich.TB3.metric_graphs.check2`: Two parallel edges have b₁=1; a SimpleGraph carrier would erase this cycle.
- `TauCeti.Berkovich.TB3.metric_graphs.check3`: An interval subdivided at its midpoint is isometric to the original interval with unchanged total length.

Construction. Glue closed real intervals by their endpoint half-edge incidence and give the intrinsic path metric. Subdivision gives canonical isometries and transports tangent directions; retain each half-edge separately at a loop.

*Needs:* `TB.1/tree-hyperbolic-metric` (Paths, tangent directions and hyperbolic metric).

Sources: [Andreas Gathmann and Michael Kerber, A Riemann–Roch theorem in tropical geometry](https://arxiv.org/pdf/math/0612129v2), §1, pp. 3–5. Metric graph models, loops, edge lengths and tropical curves. [Omid Amini and Matthew Baker, Linear series on metrized complexes of algebraic curves](https://arxiv.org/pdf/1204.3508v3), §1.1, pp. 2–3. Vertex genus and half-edge marked-point data.

### 3.2 Divisors and rank on metric graphs

Define `TauCeti.Berkovich.TB3.graph_divisors`. Div(Γ) is the free abelian group on all points of compact Γ, with degree the coefficient sum and effectiveness coefficientwise. An integral-slope continuous piecewise-affine function with finitely many breaks has principal divisor divPL(f)=Σ_x(Σ_outgoing d_bf)x. Linear equivalence is difference by such a divisor; r(D)=−1 if D has no effective equivalent and otherwise is the largest r≥0 such that D−E has an effective equivalent for every effective E of degree r. Set KΓ=Σ_v(val(v)−2)v for an unweighted graph; polarized K adds 2g(v).

Assumptions and scope: Divisors include interior points, not just vertices; principal divisors have degree zero.

The interface is used in TB.3 Riemann–Roch/specialization and TB.6 Green functions for Sets the divisor and rank conventions used by both algebraic specialization and metric potentials.

The API consists of:

- `TauCeti.Berkovich.TB3.graph_divisors.pointDivisor` (constructor): Each x∈Γ gives a degree-one effective divisor.
- `TauCeti.Berkovich.TB3.graph_divisors.degree` (structure): Degree is an additive homomorphism, invariant under linear equivalence.
- `TauCeti.Berkovich.TB3.graph_divisors.principal` (relation): divPL(f+g)=divPL(f)+divPL(g) and constants have zero divisor.
- `TauCeti.Berkovich.TB3.graph_divisors.rank` (characterisation): Rank is characterized by all effective subtractands of the specified degree.
- `TauCeti.Berkovich.TB3.graph_divisors.canonical` (data): KΓ has degree 2b₁−2; the polarized formula has degree 2g−2.

**Checks.**

- `TauCeti.Berkovich.TB3.graph_divisors.check1`: A point in the interior of an edge is a legal degree-one divisor.
- `TauCeti.Berkovich.TB3.graph_divisors.check2`: On a tree any degree-d divisor has rank d for d≥0.
- `TauCeti.Berkovich.TB3.graph_divisors.check3`: On a circle a degree-one divisor has rank zero, so rank is not simply degree.
- `TauCeti.Berkovich.TB3.graph_divisors.check4`: A loop contributes two to valency in the canonical divisor.

Construction. Use finitely supported integer functions on the realization. Refine at all breaks, cancel the two edge-end slopes to prove degree zero, and define equivalence/rank through effective representatives.

*Needs:* `TB.3/metric-graphs` (Metric graphs with loops and vertex genus).

Sources: [Andreas Gathmann and Michael Kerber, A Riemann–Roch theorem in tropical geometry](https://arxiv.org/pdf/math/0612129v2), Definitions in §1, pp. 4–7. All-point divisors, principal slopes, linear systems, canonical divisor and rank.

### 3.3 Graph Laplacians and potentials

Define `TauCeti.Berkovich.TB3.graph_laplacian`. For integral-slope PL f define Δf=−divPL(f). For real continuous functions that are C² along finitely many edge pieces, extend to the signed measure Δf=−f″ds−Σ_x(Σ_outgoing d_bf)δ_x. It has mass zero. On a connected compact graph, Δf=0 implies f constant. Integration by parts gives ∫f Δg=∫f′g′ds=∫g Δf. Write ddc f=−Δf for the positive-outgoing convention used for curvature changes.

Assumptions and scope: Piecewise C² functions with finite break set and one-sided derivatives; compact Γ, no unrecorded boundary terms.

The interface is used in TB.3 slope; TB.6 model metrics and Yuan admissible measures for Prevents the opposite conventions in graph divisors and curvature from changing the specialization or mass signs.

The API consists of:

- `TauCeti.Berkovich.TB3.graph_laplacian.pl` (compatibility): For integral PL f, Δf=−divPL(f).
- `TauCeti.Berkovich.TB3.graph_laplacian.mass_zero` (characterisation): The total mass of Δf is zero.
- `TauCeti.Berkovich.TB3.graph_laplacian.integration_by_parts` (relation): The energy identity holds for piecewise C² test functions.
- `TauCeti.Berkovich.TB3.graph_laplacian.kernel` (characterisation): The kernel on connected compact Γ is the constants.
- `TauCeti.Berkovich.TB3.graph_laplacian.curvature_sign` (compatibility): A metric multiplied by exp(−f) has curvature change ddc f=−Δf.

**Checks.**

- `TauCeti.Berkovich.TB3.graph_laplacian.check1`: For f(t)=t on [0,L], divPL(f)=δ₀−δ_L and Δf=δ_L−δ₀.
- `TauCeti.Berkovich.TB3.graph_laplacian.check2`: For f(t)=t²/2, the interior part of Δ is −ds and endpoint atoms restore total mass zero.
- `TauCeti.Berkovich.TB3.graph_laplacian.check3`: A constant potential has zero Δ on a loop as well as on a tree.

Construction. Integrate twice on each oriented edge, add its endpoint derivative terms and identify the vertex fluxes. The energy identity proves uniqueness modulo constants.

*Needs:* `TB.3/graph-divisors` (Divisors and rank on metric graphs).

Sources: [Xinyi Yuan, Arithmetic bigness and a uniform Bogomolov-type result](https://faculty.bicmr.pku.edu.cn/~yxy/preprints/bigness_and_bogomolov.pdf), Appendix A.5, pp. 115–117. Uses negative outgoing slopes and negative edge second derivative. [Andreas Gathmann and Michael Kerber, A Riemann–Roch theorem in tropical geometry](https://arxiv.org/pdf/math/0612129v2), §1, pp. 4–6. The principal-divisor convention is the opposite sign from this Δ.

### 3.4 Metric Jacobian and Abel–Jacobi map

Construct `TauCeti.Berkovich.TB3.graph_jacobian`. Let M=H₁(Γ,ℤ), N=Hom(M,ℤ), and μ:M→N_ℝ be the edge-length pairing μ(m)(n)=Σ_eℓ_e m_e n_e. Define Jac(Γ)=N_ℝ/μ(M). It is canonically Pic⁰(Γ)=Div⁰(Γ)/Prin(Γ); the basepoint Abel–Jacobi map sends x to integration along a path from the basepoint, modulo integral periods. Harmonic-form duals give the same real torus.

Assumptions and scope: Finite connected compact metric graph; orientation choices cancel in the pairing.

The interface is used in TB.7 analytic Jacobian skeleton and periods for The exact length lattice, rather than an unweighted combinatorial Jacobian, is compared to valuation periods.

The API consists of:

- `TauCeti.Berkovich.TB3.graph_jacobian.quotient` (constructor): The positive definite cycle-length pairing defines a compact real torus of dimension b₁.
- `TauCeti.Berkovich.TB3.graph_jacobian.picardEquiv` (equivalence): Degree-zero divisor classes identify canonically with Jac(Γ).
- `TauCeti.Berkovich.TB3.graph_jacobian.abelJacobi` (data): A basepoint gives a continuous map Γ→Jac(Γ), additive on degree-zero divisors.
- `TauCeti.Berkovich.TB3.graph_jacobian.subdivide` (compatibility): Subdivision identifies the lattice pairing and Abel–Jacobi maps.
- `TauCeti.Berkovich.TB3.graph_jacobian.bridge` (characterisation): Abel–Jacobi contracts bridges and is affine with primitive derivative on a nonbridge edge.

**Checks.**

- `TauCeti.Berkovich.TB3.graph_jacobian.check1`: The Jacobian of a tree is the zero group.
- `TauCeti.Berkovich.TB3.graph_jacobian.check2`: A circle of circumference L has Jacobian ℝ/Lℤ.
- `TauCeti.Berkovich.TB3.graph_jacobian.check3`: A bridge attached to a circle is contracted, so Abel–Jacobi need not embed Γ.

Construction. Positive lengths make the pairing positive definite on cycle space, hence μ(M) a full lattice. Pass through finite-model Jacobians and their subdivision direct limit to identify Pic⁰. Path changes are integral cycles; harmonicity proves tropical balancing. The finite-model exactness input is recorded explicitly.

*Needs:* `TB.3/graph-divisors` (Divisors and rank on metric graphs); `TB.3/graph-laplacian` (Graph Laplacians and potentials).

Sources: [Matthew Baker and Xander Faber, Metric properties of the tropical Abel–Jacobi map](https://arxiv.org/pdf/0905.1679), §3, Theorem 3.4, pp. 15–16 and Theorem 4.1, p. 17. Picard/Jacobian identification, model independence and bridge behavior. [Matthew Baker and Joseph Rabinoff, The skeleton of the Jacobian, the Jacobian of the skeleton, and lifting meromorphic functions from tropical to algebraic curves](https://arxiv.org/pdf/1308.3864), §2.7 and Proposition 2.8, p. 5. Length-pairing lattice presentation.

### 3.5 Riemann–Roch for metric graphs

Prove `TauCeti.Berkovich.TB3.graph_riemann_roch`. For a compact connected metric graph Γ of genus g=b₁ and any divisor D, r(D)−r(KΓ−D)=deg(D)+1−g. In particular deg(KΓ)=2g−2 and r(KΓ)=g−1. This is the unweighted graph theorem; vertex genera require metrized complexes rather than silently replacing g by b₁+Σg(v).

Assumptions and scope: All edge lengths positive real numbers; all-point divisor rank; compact graph.

Proof route. For rational lengths subdivide after scaling and compare discrete chip-firing rank with metric rank, then apply the finite graph Riemann–Roch theorem. For real lengths use the rational polyhedral stratification of simultaneous ranks of D and K−D and choose rational points preserving both ranks, rather than relying on unjustified semicontinuity. The discrete rank theorem is a named proof leaf.

*Needs:* `TB.3/graph-divisors` (Divisors and rank on metric graphs).

Sources: [Andreas Gathmann and Michael Kerber, A Riemann–Roch theorem in tropical geometry](https://arxiv.org/pdf/math/0612129v2), Theorem 1.2, Theorem 2.1, Lemma 2.3, Proposition 2.4, Corollary 2.5 and Proposition 3.1, pp. 3, 8–12. The finite graph bridge, rational lengths and simultaneous rational approximation prove the real-length statement.

Acceptance: On a tree r(D)=deg D for nonnegative degree. For g=1 and deg D>0, r(D)=deg D−1. Replacing metric rank by vertex-only rank loses the arbitrary-real-length theorem.

### 3.6 Specialization of algebraic divisors

Construct `TauCeti.Berkovich.TB3.divisor_specialization`. For smooth proper X over algebraically closed complete rank-one K and a semistable skeleton Γ with retraction τ, define τ_*:Div(X)→Div(Γ) by Σn_P P↦Σn_P τ(P). It preserves degree and effectiveness. For a nonclosed field first use geometric divisors or retain closed-point residue degrees explicitly. Refinement maps and isometric scalar extension commute with specialization.

Assumptions and scope: Div(X) is on geometric K-points in the displayed formula; X is proper to give a compact skeleton.

The interface is used in TB.3 rank inequality and TB.7 Picard comparison for Supplies the actual divisor map whose principal compatibility induces a map on Jacobians.

The API consists of:

- `TauCeti.Berkovich.TB3.divisor_specialization.point` (simp): τ_*(P)=τ(P).
- `TauCeti.Berkovich.TB3.divisor_specialization.degree_effective` (compatibility): Degree is preserved and effective divisors specialize effectively.
- `TauCeti.Berkovich.TB3.divisor_specialization.refinement` (functoriality): Coarsening the refined specialization equals the original specialization.
- `TauCeti.Berkovich.TB3.divisor_specialization.principal` (relation): Principal divisors specialize to the graph principal divisors specified by the slope formula.

**Checks.**

- `TauCeti.Berkovich.TB3.divisor_specialization.check1`: Two distinct points in one residue ball specialize to the same vertex.
- `TauCeti.Berkovich.TB3.divisor_specialization.check2`: A point retracting to an edge interior must not be rounded to a vertex.
- `TauCeti.Berkovich.TB3.divisor_specialization.check3`: A closed point of degree d contributes total degree d after geometric base change.

Construction. Extend point retraction linearly and use compatibility of graph retractions. For closed points compare the sum of geometric conjugates, including inseparable multiplicities, with the degree convention.

*Needs:* `TB.2/retraction-to-the-skeleton` (Retraction onto the skeleton); `TB.2/refinement-and-field-extension` (Refinement and valued extension); `TB.3/graph-divisors` (Divisors and rank on metric graphs).

Sources: [Matthew Baker, Specialization of linear systems from curves to graphs](https://arxiv.org/pdf/math/0701075v4), §2, pp. 5–10. Specialization in the discrete-model range. [Omid Amini and Matthew Baker, Linear series on metrized complexes of algebraic curves](https://arxiv.org/pdf/1204.3508v3), §4.3, pp. 21–22. Analytic retraction and geometric-point specialization over arbitrary complete algebraically closed K.

### 3.7 Slope formula for rational functions

Prove `TauCeti.Berkovich.TB3.slope_formula`. Let f∈K(X)× on smooth proper X, and choose a marked skeleton containing all zeros and poles as punctures. F=−log|f| is integral-affine along the extended edges, constant on complementary balls and harmonic at every unmarked nonclassical point. At type II, its outgoing slope equals the order of the normalized residue function in that branch; along a ray toward P the outgoing slope is ord_P(f). On a compact skeleton Δ(F|Γ)=τ_*div(f), equivalently divPL(log|f||Γ)=τ_*div(f).

Assumptions and scope: K algebraically closed complete nontrivial; include the support of div(f) in the marking.

Proof route. Use analytic-unit constancy on balls and Laurent slopes on annuli. In a formal node chart compare the first nonvanishing residue term with its annular exponent. The principal divisor on the residue curve has degree zero, proving harmonicity; cancel attached branch fluxes to obtain the compact-graph formula.

*Needs:* `TB.1/annular-integral-slopes` (Integral slopes of analytic units); `TB.2/marked-extended-skeleton` (Marked skeleta and puncture rays); `TB.3/graph-laplacian` (Graph Laplacians and potentials); `TB.3/divisor-specialization` (Specialization of algebraic divisors).

Sources: [Matthew Baker, Sam Payne, Joseph Rabinoff, On the structure of nonarchimedean analytic curves](https://arxiv.org/abs/1404.0279), Theorem 5.15 and its proof, pp. 21–22. All slope assertions, harmonicity and puncture orders with F=−log|f|. [Omid Amini and Matthew Baker, Linear series on metrized complexes of algebraic curves](https://arxiv.org/pdf/1204.3508v3), Theorem 4.5 and its sign footnote, p. 23. Uses log|f| for the positive-outgoing principal-divisor convention.

Acceptance: On G_m, F=−log|T| has slope +1 toward 0 and −1 toward infinity. The compact formula uses Δ rather than divPL for −log|f|.

### 3.8 Metrized complexes and their divisors

Define `TauCeti.Berkovich.TB3.metrized_complexes`. A metrized complex consists of compact Γ, a smooth proper connected residue curve C_v over algebraically closed κ at each vertex and distinct marked points indexed by incident half-edges. Replace each vertex by C_v(κ) in the divisor support. A rational function is a PL graph function f_Γ with integral slopes and independent nonzero rational functions f_v on C_v. Its component divisor is div(f_v)+Σ_b slope_b(f_Γ)·p_b; its graph-interior divisor is divPL(f_Γ). The associated graph divisor puts total component degree at the vertex. Set K_C=Σ_v(K_{C_v}+Σ_bp_b), with genus b₁+Σg(C_v).

Assumptions and scope: A loop has two distinct marked half-edge points on the same C_v; rational functions need not satisfy an unstated gluing equality.

The interface is used in TB.3 refined specialization and Riemann–Roch for Keeps the residue-component linear-series information that ordinary graph specialization forgets.

The API consists of:

- `TauCeti.Berkovich.TB3.metrized_complexes.graphDivisor` (projection): A divisor maps to its graph-interior chips plus its total degree on each C_v at v.
- `TauCeti.Berkovich.TB3.metrized_complexes.principal` (constructor): A graph PL function and residue rational functions give the stated principal divisor.
- `TauCeti.Berkovich.TB3.metrized_complexes.degree` (compatibility): Total degree is preserved by graph projection and vanishes on principal divisors.
- `TauCeti.Berkovich.TB3.metrized_complexes.rank` (characterisation): Rank tests every effective divisor on the full metrized-complex carrier.
- `TauCeti.Berkovich.TB3.metrized_complexes.canonical` (data): The canonical divisor has degree 2g−2 and is independent up to linear equivalence of canonical-divisor choices.

**Checks.**

- `TauCeti.Berkovich.TB3.metrized_complexes.check1`: A one-vertex complex with no edges recovers divisors and rank on C_v, not a point graph.
- `TauCeti.Berkovich.TB3.metrized_complexes.check2`: A self-loop requires two distinct marked points on C_v.
- `TauCeti.Berkovich.TB3.metrized_complexes.check3`: A graph slope at a vertex adds a marked-point chip, so taking only div(f_v) is incorrect.

Construction. Construct the free divisor group on graph interiors and residue-curve points. Refine at all breaks to prove total principal degree zero; moving vertex chips onto the corresponding component compares refined models.

*Needs:* `TB.3/metric-graphs` (Metric graphs with loops and vertex genus); `TB.3/graph-divisors` (Divisors and rank on metric graphs); `TB.2/vertex-genus-and-genus-formula` (Vertex genera and analytic genus).

Sources: [Omid Amini and Matthew Baker, Linear series on metrized complexes of algebraic curves](https://arxiv.org/pdf/1204.3508v3), §§1.1–2.1, pp. 2–7. Carrier, half-edge markings, rational-function tuple and component slope terms.

### 3.9 Riemann–Roch and rank determination on complexes

Prove `TauCeti.Berkovich.TB3.metrized_complex_riemann_roch`. For a compact metrized complex C of genus g and any divisor D, r_C(D)−r_C(K_C−D)=deg D+1−g, using the combined graph/residue-curve principal-divisor convention.

Assumptions and scope: Algebraically closed residue field; smooth proper C_v; rank on the full divisor carrier. The rank-determining set must satisfy Amini–Baker Appendix A, not merely have the indicated cardinality.

Proof route. Use existence of reduced divisors and the nonspecial-divisor characterization to obtain the two rank inequalities. Establish the Appendix A rank-determining criterion before using finite tests; cardinality alone is not treated as its proof.

*Needs:* `TB.3/metrized-complexes` (Metrized complexes and their divisors); `TB.3/metrized-complex-rank-determining` (Finite rank-determining sets).

Sources: [Omid Amini and Matthew Baker, Linear series on metrized complexes of algebraic curves](https://arxiv.org/pdf/1204.3508v3), Theorem 3.2 and Theorem 3.7, pp. 13–14; Appendix A, Theorem A.1, pp. 40–43. Riemann–Roch, reduced-divisor input and rank-determining criterion; the full proof leaf remains explicitly open.

Acceptance: For one vertex without edges this is algebraic curve Riemann–Roch. For all C_v=P¹ the statement agrees with metric-graph Riemann–Roch.

### 3.10 Specialization inequality

Prove `TauCeti.Berkovich.TB3.specialization_rank_inequality`. For a smooth proper connected curve X over algebraically closed complete nontrivial rank-one K and its semistable metrized complex C, specialization preserves principal divisors and r_X(D)≤r_C(sp D)≤r_Γ(τ_*D). The first map sends points above vertices to their residue point and points above graph interiors to their retraction. For f use the tuple (log|f||Γ, normalized reductions f_v), whose principal divisor is sp(div f).

Assumptions and scope: Arbitrary rank-one value group; do not infer this range solely from Baker’s DVR argument.

Proof route. The slope formula gives principal compatibility, including the marked-point terms. Choose the Appendix A rank-determining residue points and lift them to X(K); specialize every effective subtractand to obtain r_X≤r_C. For the second inequality lift a graph effective subtractand to arbitrary component points of matching degree and project the effective representatives.

*Needs:* `TB.3/metrized-complex-riemann-roch` (Riemann–Roch and rank determination on complexes); `TB.3/slope-formula` (Slope formula for rational functions); `TB.3/divisor-specialization` (Specialization of algebraic divisors).

Sources: [Omid Amini and Matthew Baker, Linear series on metrized complexes of algebraic curves](https://arxiv.org/pdf/1204.3508v3), Theorems 4.5–4.6, pp. 23–24. Principal specialization and the rank inequality without a discrete-valuation restriction. [Matthew Baker, Specialization of linear systems from curves to graphs](https://arxiv.org/pdf/math/0701075v4), Lemma 2.8 and Corollary 2.10, pp. 8–10. Compatible DVR special case; not the source of the arbitrary rank-one proof.

Acceptance: On a positive-genus good-reduction component the metrized complex retains algebraic rank while the point graph loses it. The inequality is r_X≤r_specialized, not the reverse.

### 3.11 Finite rank-determining sets

Prove `TauCeti.Berkovich.TB3.metrized_complex_rank_determining`. Let C be a compact metrized complex with a loopless finite graph model G. For every vertex v choose any subset R_v⊂C_v(κ) of cardinality g(C_v)+1. The union R=∪_v R_v is rank determining: in the definition of r_C(D), it suffices to test effective subtractands supported on R. A graph loop must first be subdivided; points may be chosen away from the finitely many attaching points over algebraically closed κ.

Assumptions and scope: κ algebraically closed; graph model loopless; the points in each R_v are distinct.

Proof route. Use the v₀-reduced divisor characterization and continuity of the reduced-divisor map to find a test point in one R_v detecting failure of rank one. Subtract one test point and induct on the tested rank. Reduced-divisor existence and the continuity theorem are the exact open proof leaves.

*Needs:* `TB.3/metrized-complexes` (Metrized complexes and their divisors).

Sources: [Omid Amini and Matthew Baker, Linear series on metrized complexes of algebraic curves](https://arxiv.org/pdf/1204.3508v3), Appendix A, Theorem A.1 and Lemmas A.3–A.4, pp. 40–43. Any g_v+1 residue points suffice on a loopless model; no unspecified genericity condition is imposed.

Acceptance: A loop requires subdivision before the stated criterion applies. One residue point suffices on every genus-zero component.

## Layer 4: Tropicalization and multiplicities

Use tilted models and valued extensions to define initial degenerations at every real tropical point. Scheme-theoretic generic lengths determine weights. Primitive lattice vectors and the target/image index determine balancing and pushforward; set-theoretic initial supports do not supply these integers.

External layer inputs: `SchemeAndStackFoundations:SF.0`.

### 4.1 Tropical multiplicity formula for curves

Prove `TauCeti.Berkovich.Curve.tropical_multiplicity_formula`. After suitable subdivision, each tropical edge e′ has finitely many embedded segments e_i of H° mapping homeomorphically onto it. Other segments disjoint from these in its preimage are contracted. Its multiplicity is the sum of their positive integral expansion factors. Initial-degeneration components are counted with scheme multiplicities.

Proof route. For a value-group-rational tropical point, pass to its polyhedral analytic fiber and canonical reduction. The Shilov components account for the initial-degeneration generic lengths. For a curve, a finite annular projection identifies each relative component degree with its integral expansion factor. Sum over the noncontracted preimage edges; contracted components contribute zero. Extend to other points by valued base change. The finite-map reduction/multiplicity identity still requires a complete proof check.

*Needs:* `SchemeAndStackFoundations:SF.0`; `TB.4/relative-tropical-multiplicity` (Relative point and edge multiplicities); `TB.3/slope-formula` (Slope formula for rational functions).

Sources: [Matthew Baker, Sam Payne, Joseph Rabinoff, Nonarchimedean geometry, tropicalization, and metrics on curves](https://arxiv.org/abs/1104.0320), Theorem 1.3, pp. 2–3; Proposition 5.4, Theorem 5.8 and Corollary 5.9, pp. 21–23. The curve multiplicity formula is proved by the comparison of analytic edge degrees and initial generic lengths. The original finite-map reduction input is still explicitly recorded as a proof leaf.

Acceptance: Factors 2 and 3 contribute multiplicity 5, not 2.

### 4.2 Expansion factors from coordinate slopes

Prove `TauCeti.Berkovich.Curve.expansion_factor_gcd`. For an affine curve embedded in a torus by invertible regular functions f_i, the expansion factor on an affine edge is the gcd of the absolute values of the integral slopes of log|f_i|. An all-zero slope tuple gives factor zero and a contracted edge.

Proof route. The index of the coordinate-slope vector in its primitive lattice direction is the gcd. Identifying this index with the analytic and tropical lengths requires the missing metric and slope framework.

*Needs:* `TB.4/relative-tropical-multiplicity` (Relative point and edge multiplicities); `TB.3/slope-formula` (Slope formula for rational functions).

Sources: [Matthew Baker, Sam Payne, Joseph Rabinoff, Nonarchimedean geometry, tropicalization, and metrics on curves](https://arxiv.org/abs/1104.0320), Remark 5.6 and formula (5.6.1), p. 22. The expansion index of an integral slope vector is the positive gcd of its coordinate slopes, measured against the primitive image lattice.

Acceptance: Slopes (−2,4) give factor 2; (0,0) gives zero.

### 4.3 Torus tropicalization

Construct `TauCeti.Berkovich.TB4.torus_tropicalization`. For a split torus T=Spec K[M] with character lattice M and N=Hom(M,ℤ), define trop:Tᵃⁿ→N_ℝ by ⟨trop(x),u⟩=−log|χᵘ(x)|. For a closed subscheme X⊂T define Trop(X)=trop(Xᵃⁿ), including multiplicities only after the weighted-cycle construction. Torus homomorphisms induce the dual integral-linear tropical maps; valued scalar extension leaves Trop(X) unchanged.

Assumptions and scope: K a valued field, completed before analytification; arbitrary rank-one value group, including the trivial valuation. The torus is split; nonsplit descent is additional data.

The interface is used in TB.4 initial degenerations and TB.5 faithful embeddings for Fixes the sign and lattice functoriality of every tropical coordinate.

The API consists of:

- `TauCeti.Berkovich.TB4.torus_tropicalization.character_eval` (simp): ⟨trop x,u⟩=v(χᵘ(x)).
- `TauCeti.Berkovich.TB4.torus_tropicalization.map` (functoriality): For a torus map with lattice map A, trop(fᵃⁿx)=A(trop x).
- `TauCeti.Berkovich.TB4.torus_tropicalization.baseChange` (compatibility): Trop(X_L)=Trop(X).
- `TauCeti.Berkovich.TB4.torus_tropicalization.classical_closure` (characterisation): After nontrivial algebraically closed extension L, Trop(X) is the closure of tropicalizations of X(L).

**Checks.**

- `TauCeti.Berkovich.TB4.torus_tropicalization.check1`: Trop(G_m)=ℝ, including when K is trivially valued.
- `TauCeti.Berkovich.TB4.torus_tropicalization.check2`: The equation χᵘ=a tropicalizes into ⟨w,u⟩=v(a).
- `TauCeti.Berkovich.TB4.torus_tropicalization.check3`: The map T↦Tⁿ acts by w↦nw, so omitting the exponent fails.

Construction. Characters are invertible analytic functions, so logarithmic evaluation is well-defined and continuous. Pullback of characters proves functoriality; surjective spectral base change proves invariance. General-base toric scheme interfaces are requested, not rebuilt.

*Needs:* `TB.0/analytification` (Berkovich analytification); `TB.0/spectral-base-change` (Valued base change of spectra); `SchemeAndStackFoundations:SF.0`.

Sources: [Walter Gubler, A guide to tropicalizations](https://gubler.app.uni-regensburg.de/Publikationen/1108.6126.pdf), Definitions 2.1 and 3.2; Propositions 3.6–3.7, pp. 4–7. Seminorm tropicalization, field-extension invariance and classical-point closure after algebraically closed nontrivial extension.

### 4.4 Initial degenerations over valued fields

Construct `TauCeti.Berkovich.TB4.initial_degenerations`. For w∈N_ℝ, use the tilted algebra K[M]^w={Σa_uχᵘ:v(a_u)+⟨u,w⟩≥0}; close X in this model and take the residue fiber. When w is not realized in the value group, pass to a valued extension realizing w and translate its torus point to valuation zero before reduction. The resulting in_w(X) is well-defined up to the corresponding residue-field extension and torus translation; preserve its scheme structure and generic lengths. Polyhedral tilted models use the inequalities for every w in a polyhedron.

Assumptions and scope: Finite-type closed X⊂T; do not assert canonical residue coordinates or finite presentation for every dense indivisible value group.

The interface is used in TB.4 fundamental theorem and tropical weights for Initial nonemptiness detects support; generic lengths define multiplicity.

The API consists of:

- `TauCeti.Berkovich.TB4.initial_degenerations.reduce` (constructor): A realized weight gives the translated residue subscheme with its nilpotents.
- `TauCeti.Berkovich.TB4.initial_degenerations.baseChange` (compatibility): Initial degeneration commutes with valued base extension up to the stated residue identification.
- `TauCeti.Berkovich.TB4.initial_degenerations.polyhedralDomain` (data): The inverse tropical image of a bounded rational polyhedron has its weighted affinoid algebra.
- `TauCeti.Berkovich.TB4.initial_degenerations.choice_independence` (equivalence): Two realizations agree after common extension and torus translation.
- `TauCeti.Berkovich.TB4.initial_degenerations.retain_lengths` (characterisation): Generic local-ring lengths are not discarded by replacing the scheme with its reduced support.

**Checks.**

- `TauCeti.Berkovich.TB4.initial_degenerations.check1`: For X={T=a}, in_w X is nonempty precisely at w=v(a).
- `TauCeti.Berkovich.TB4.initial_degenerations.check2`: For (T−a)²=0, the initial point has length two, not one.
- `TauCeti.Berkovich.TB4.initial_degenerations.check3`: A real weight outside v(K×) is handled by valued extension, rather than declared undefined.

Construction. Extend the valued field to realize finitely many weights, translate and use flat closure over the valuation ring. Compare two choices in a common valued extension; reductions differ by the residual torus translation. For polyhedra apply the same inequality algebra and track the finiteness hypotheses.

*Needs:* `TB.4/torus-tropicalization` (Torus tropicalization); `TB.0/affinoid-algebras` (Affinoid algebras over valued fields).

Sources: [Walter Gubler, A guide to tropicalizations](https://gubler.app.uni-regensburg.de/Publikationen/1108.6126.pdf), §§5.1–5.5 and §§6.5–6.7, pp. 10–13. Extension/translation definition and the failure of unconditional finite generation over some valuation rings. [Matthew Baker, Sam Payne, Joseph Rabinoff, Nonarchimedean geometry, tropicalization, and metrics on curves](https://arxiv.org/abs/1104.0320), Definitions 4.8 and 4.14, Propositions 4.17–4.18, pp. 15–18. Canonical analytic/formal models and their initial special fibers.

### 4.5 Fundamental theorem and polyhedrality

Prove `TauCeti.Berkovich.TB4.fundamental_polyhedral_theorem`. For finite-type X⊂T over any valued field, Trop(X)={w:in_w(X)≠∅}. It is the support of a finite v(K×)-rational polyhedral complex; if X is pure d-dimensional, it is pure d-dimensional. Local stars at w equal tropicalizations of in_w(X) over the trivially valued residue field.

Assumptions and scope: Use the completion/valued-extension definition for arbitrary w; dimensional purity assumes X pure-dimensional.

Proof route. The fundamental equivalence follows from surjective reduction of the polyhedral affinoid domains and a lift of a residue point after valued extension. Homogenize and construct the finite Gröbner complex, constant up to translation on relative interiors; initial-of-initial identifies local stars. The Gröbner finiteness and pure-dimension proof leaves are named in the gaps.

*Needs:* `TB.4/initial-degenerations` (Initial degenerations over valued fields); `TB.0/spectral-base-change` (Valued base change of spectra).

Sources: [Walter Gubler, A guide to tropicalizations](https://gubler.app.uni-regensburg.de/Publikationen/1108.6126.pdf), Theorems 3.3, 5.6 and 10.14; Proposition 10.15, pp. 7, 11 and 32. Support theorem, finite Gröbner subdivision, dimension and local-star comparison.

Acceptance: The theorem holds for trivial valuation by analytic points even though classical K-points have only zero valuation. Nonreduced structure affects weights, not this support equality.

### 4.6 Tropical weights and balancing

Define `TauCeti.Berkovich.TB4.weighted_tropical_cycles`. For pure-dimensional X and a regular tropical point w, define m_X(w) as the sum of the generic local-ring lengths of the irreducible components of in_w(X), after a suitable algebraically closed valued extension. It is locally constant on the regular locus, independent of extension and compatible with the algebraic cycle [X]. On a rational subdivision, attach this integer to each maximal cell. A weighted d-complex is balanced if for each codimension-one face τ, Σ_{σ⊃τ}m_σ u_{σ/τ}=0 in N/N_τ, using primitive outgoing quotient-lattice vectors. Identify cycles under common subdivision.

Assumptions and scope: Use saturated tangent lattices N_σ=N∩span(σ−σ); weights may be signed for general algebraic cycles, positive for effective X.

The interface is used in TB.4 pushforward; TB.5 multiplicity-one faithfulness for Weights distinguish an isometric branch from coincident branches or higher-degree covering.

The API consists of:

- `TauCeti.Berkovich.TB4.weighted_tropical_cycles.weight` (data): Each regular point or refined maximal cell carries its generic-length weight.
- `TauCeti.Berkovich.TB4.weighted_tropical_cycles.baseChange_cycle` (compatibility): Weights commute with valued extension and algebraic cycle multiplicities.
- `TauCeti.Berkovich.TB4.weighted_tropical_cycles.subdivide` (equivalence): Common subdivision defines equality of weighted tropical cycles.
- `TauCeti.Berkovich.TB4.weighted_tropical_cycles.balance` (characterisation): Primitive-normal weighted sums vanish modulo the face lattice.
- `TauCeti.Berkovich.TB4.weighted_tropical_cycles.add` (structure): Cycle addition adds weights after common subdivision.

**Checks.**

- `TauCeti.Berkovich.TB4.weighted_tropical_cycles.check1`: A doubled hypersurface has twice the reduced hypersurface weights.
- `TauCeti.Berkovich.TB4.weighted_tropical_cycles.check2`: The standard tropical line has three primitive rays of weight one whose outgoing vectors sum to zero.
- `TauCeti.Berkovich.TB4.weighted_tropical_cycles.check3`: Using a nonprimitive normal doubles one term and can destroy balancing.

Construction. Compare local stars with initial degenerations, prove cycle-linearity and valued-base-change invariance, then use trivial-valuation tropical compactification and intersection with toric strata for balancing. Refinement preserves weights. The tropical-compactification/intersection input is recorded as a precise external need.

*Needs:* `TB.4/fundamental-polyhedral-theorem` (Fundamental theorem and polyhedrality).

Sources: [Walter Gubler, A guide to tropicalizations](https://gubler.app.uni-regensburg.de/Publikationen/1108.6126.pdf), §§13.4–13.11, pp. 43–45. Generic lengths, cycle/base-change compatibility, local constancy and balancing. [Bernd Sturmfels and Jenia Tevelev, Elimination theory for tropical varieties](https://arxiv.org/pdf/0704.3471), Definition 3.1, Lemma 3.2 and Corollaries 3.4/3.8, pp. 7–8. Trivial-valuation intersection proof and refinement independence.

### 4.7 Sturmfels–Tevelev pushforward

Prove `TauCeti.Berkovich.TB4.cycle_pushforward`. Let f:T→T′ be a torus homomorphism with lattice map A:N→N′, and f:X→Y its dominant generically finite restriction of degree δ between integral d-dimensional subvarieties. After a subdivision on which every noncontracted maximal cell maps into a target cell, δm_Y(τ)=Σ_{σ↦τ}m_X(σ)[N′_τ:A(N_σ)]. Cells whose image dimension is smaller than d contribute zero. Equivalently Trop(f_*[X])=A_*Trop([X]), extended linearly to cycles.

Assumptions and scope: Equal dimensions and generically finite restriction; saturated tangent lattices and positive finite index in the displayed direction.

Proof route. Reduce by valued extension and cycle-linearity to complete algebraically closed fields. On corresponding polyhedral domains compare finite-map degrees and generic reduction degrees; sum over source components. Subdivision and initial local-star compatibility make the formula independent of the chosen cells.

*Needs:* `TB.4/weighted-tropical-cycles` (Tropical weights and balancing); `TB.4/relative-tropical-multiplicity` (Relative point and edge multiplicities).

Sources: [Walter Gubler, A guide to tropicalizations](https://gubler.app.uni-regensburg.de/Publikationen/1108.6126.pdf), §§13.14–13.17, pp. 45–46. Cycle pushforward and the generic-degree formula. [Matthew Baker, Sam Payne, Joseph Rabinoff, Nonarchimedean geometry, tropicalization, and metrics on curves](https://arxiv.org/abs/1104.0320), §7, Theorem 7.1 and Corollary 7.3, pp. 34–35. Analytic proof input for arbitrary-dimensional pushforward, distinct from curve harmonicity.

Acceptance: For T↦Tⁿ on G_m, δ=n and [ℤ:nℤ]=n, so both sides equal n. A contracted component contributes zero to the d-dimensional pushforward. The reciprocal lattice index is not used.

### 4.8 Relative point and edge multiplicities

Define `TauCeti.Berkovich.TB4.relative_tropical_multiplicity`. For reduced pure-dimensional X and a tropical point w, use its canonical polyhedral analytic domain and reduction. At a Shilov-boundary point x over w, define m_rel(x) to be the generic degree of the canonical reduction component over its image in in_w(X); for non-Shilov points set it to zero. For w outside the value group, define it by summing the corresponding lifted multiplicities after valued extension. For curves and a noncontracted skeletal edge e, m_rel(e) is the integral expansion factor, equal to the generic degree of a suitable finite annular projection.

Assumptions and scope: Use generic field degrees, including inseparable degree, and retain the scheme-length factors separately in m_Trop.

The interface is used in TB.4 multiplicity formula; TB.5 one-to-one isometry for Separates lattice expansion, branch count and scheme multiplicity.

The API consists of:

- `TauCeti.Berkovich.TB4.relative_tropical_multiplicity.point_weight` (data): Non-Shilov points have relative multiplicity zero; Shilov weights are the specified generic degrees.
- `TauCeti.Berkovich.TB4.relative_tropical_multiplicity.extension_sum` (compatibility): The multiplicity over w is the sum of lifted relative multiplicities after realizing w.
- `TauCeti.Berkovich.TB4.relative_tropical_multiplicity.edge_degree` (equivalence): On an edge interior the point multiplicity equals the integer edge expansion factor.
- `TauCeti.Berkovich.TB4.relative_tropical_multiplicity.tropical_sum` (relation): m_Trop(w)=Σ_{x∈trop⁻¹(w)}m_rel(x), with finite nonzero support.

**Checks.**

- `TauCeti.Berkovich.TB4.relative_tropical_multiplicity.check1`: A point in an attached open residue ball is non-Shilov and has relative multiplicity zero.
- `TauCeti.Berkovich.TB4.relative_tropical_multiplicity.check2`: The annular map T↦Tⁿ has expansion and generic degree n, including inseparable characteristic-p cases.
- `TauCeti.Berkovich.TB4.relative_tropical_multiplicity.check3`: Two distinct degree-one annular branches over one tropical edge contribute total weight two.

Construction. Canonical reduction associates Shilov points with generic components. Compare a separating character projection with a finite annular map and compute its degree from its primitive slope. Base-change invariance and summation over lifted components give the arbitrary-weight definition.

*Needs:* `TB.4/initial-degenerations` (Initial degenerations over valued fields); `TB.1/annular-integral-slopes` (Integral slopes of analytic units).

Sources: [Matthew Baker, Sam Payne, Joseph Rabinoff, Nonarchimedean geometry, tropicalization, and metrics on curves](https://arxiv.org/abs/1104.0320), Definitions 4.21 and 4.23, Proposition 4.24, pp. 18–19; Theorem 5.8, pp. 22–23. Shilov point multiplicities, initial generic lengths and equality with edge expansion factors.

## Layer 5: Faithful tropicalization of curves

Faithfulness requires injectivity as well as primitive slopes. Add local unit-slope functions, annular approximations and global separating coordinates, then preserve faithfulness under toric domination. Marked rays require their own eventual coprime-pole slope argument.

External layer inputs: `SchemeAndStackFoundations:SF.0`; `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-4-repartitions-weil-differentials-and-riemannroch`.

### 5.1 Faithful tropicalization of a finite subgraph

Prove `TauCeti.Berkovich.Curve.faithful_tropicalization_and_expansion_factors`. Every finite embedded Γ in H°(X^an) admits a closed embedding of X into a quasiprojective toric K-variety meeting its dense torus T such that Γ maps isometrically onto its tropical image. Metrics are the subgraph length metrics. H° is the non-leaf locus, excluding classical and type-4 points. This identifier now retains the existence part of Theorem 1.1.

Proof route. Cover the finite embedded graph by finitely many closed skeletal segments. Use unit-slope functions to make the expansion gcd one, and add finitely many separating coordinates for pairs in distinct graph neighborhoods. The resulting toric refinement is locally isometric and injective on the compact graph, hence faithful.

*Needs:* `TB.2/skeleton` (Skeleton of a semistable decomposition); `SchemeAndStackFoundations:SF.0`; `TB.5/faithful-embedding-predicate` (Faithful tropicalization on a graph); `TB.5/unit-slope-separating-functions` (Functions separating edges and vertices).

Sources: [Matthew Baker, Sam Payne, Joseph Rabinoff, Nonarchimedean geometry, tropicalization, and metrics on curves](https://arxiv.org/abs/1104.0320), Theorem 1.1, p. 2; Theorems 5.20–5.21 and proofs, p. 26. The finite-graph existence theorem follows from finitely many separating unit-slope coordinates. The original formal lifting and Runge approximation inputs remain explicit proof leaves.

Acceptance: A plane embedding can contract a Tate loop; faithfulness is not automatic.

### 5.2 Faithfulness under domination

Prove `TauCeti.Berkovich.Curve.faithful_domination`. Embeddings faithful on a fixed Γ are stable under domination by equivariant toric maps and cofinal among toric embeddings meeting the dense torus.

Proof route. Extend each separating rational function on the smooth proper completion to a morphism to P¹. For the specified closed embedding into a toric variety Y, take the graph of this finite tuple in Y×(P¹)^n. This is a closed toric embedding and projection gives domination; the target remains quasiprojective when Y is quasiprojective. The gcd-one slope and point-separation properties persist under adjoining coordinates. For domination by any equivariant toric map, expansion indices multiply and the composite has index one, so both indices are one. Use the intrinsic image-graph metric.

*Needs:* `TB.5/faithful-tropicalization-and-expansion-factors` (Faithful tropicalization of a finite subgraph); `TB.5/unit-slope-separating-functions` (Functions separating edges and vertices); `TB.5/faithful-embedding-predicate` (Faithful tropicalization on a graph).

Sources: [Matthew Baker, Sam Payne, Joseph Rabinoff, Nonarchimedean geometry, tropicalization, and metrics on curves](https://arxiv.org/abs/1104.0320), §5.15, Remark 5.16, Lemma 5.17 and Theorems 5.20–5.21, pp. 24–26. Lemma 5.17 treats domination for toric targets; Theorems 5.20–5.21 supply quasiprojective faithful embeddings. Taking the product with an arbitrary specified toric target proves cofinality in the stated class. Formal lifting and Runge inputs remain explicit proof leaves.

Acceptance: Lengths are measured within the image subgraph, not via shortcuts in the entire tropicalization.

### 5.3 Multiplicity-one isometry criterion

Prove `TauCeti.Berkovich.Curve.multiplicity_one_isometry`. If Γ′ is a finite embedded tropical subgraph and every initial degeneration at w in Γ′ is irreducible and generically reduced, a unique embedded Γ in H° maps homeomorphically onto it and the map is an isometry for the subgraph length metrics.

Assumptions and scope: Multiplicity one is imposed at every value-group-rational point of the requested tropical subgraph, including its vertices; edge-interior multiplicity alone does not control vertex gluing.

Proof route. At each value-group-rational tropical point, multiplicity one forces a unique generically reduced initial component and one relative-multiplicity-one Shilov lift. On edges the multiplicity formula forces expansion one. Uniqueness at vertices glues these lifts into a graph; intrinsic retraction and properness prove the inverse is continuous. Extend across non-value-group points by their adjacent intervals.

*Needs:* `TB.4/tropical-multiplicity-formula` (Tropical multiplicity formula for curves); `TB.4/relative-tropical-multiplicity` (Relative point and edge multiplicities); `TB.2/continuous-retraction` (Continuity of skeletal retraction).

Sources: [Matthew Baker, Sam Payne, Joseph Rabinoff, Nonarchimedean geometry, tropicalization, and metrics on curves](https://arxiv.org/abs/1104.0320), Theorem 1.4, p. 3; Theorem 5.24 and Corollaries 5.25–5.28, pp. 27–28. Multiplicity one gives a unique positive-relative-multiplicity lift and unit expansion on the stated locus; continuity and compactness identify the intrinsic graph metrics.

Acceptance: Irreducibility without generic reducedness is insufficient.

### 5.4 Faithful tropicalization on a graph

Define `TauCeti.Berkovich.TB5.faithful_embedding_predicate`. For a closed algebraic embedding ι:X→Y_Δ into a toric variety, faithful tropicalization on a finite embedded graph Γ⊂H°(Xᵃⁿ) means trop_ι|Γ is a homeomorphism onto its image and an isometry for Γ’s intrinsic path metric and the tropical lattice-length metric. On each noncontracted edge the expansion factor is the gcd of the absolute coordinates of its integral slope vector; being one is necessary for edgewise isometry but does not by itself imply global injectivity or correct vertex gluing.

Assumptions and scope: K algebraically closed complete nontrivial; X smooth connected curve; subdivide at finitely many tropical breakpoints.

The interface is used in TB.5 faithful refinement and multiplicity-one criterion for Defines the exact output expected from added rational-function coordinates.

The API consists of:

- `TauCeti.Berkovich.TB5.faithful_embedding_predicate.edge_expansion` (characterisation): The slope-vector gcd is the integer expansion on a noncontracted edge.
- `TauCeti.Berkovich.TB5.faithful_embedding_predicate.injective_isometric` (characterisation): Faithfulness is global injectivity/homeomorphism plus all edge factors one.
- `TauCeti.Berkovich.TB5.faithful_embedding_predicate.subdivide` (compatibility): Faithfulness is unchanged by compatible source/target subdivisions.
- `TauCeti.Berkovich.TB5.faithful_embedding_predicate.domination` (relation): For compatible toric embeddings ι′ dominating ι, tropicalization factors through the integral toric projection.

**Checks.**

- `TauCeti.Berkovich.TB5.faithful_embedding_predicate.check1`: The annular coordinate T² has expansion two and is not faithful on its skeleton.
- `TauCeti.Berkovich.TB5.faithful_embedding_predicate.check2`: Two different source edges mapping onto one primitive edge are not faithful even though both factors are one.
- `TauCeti.Berkovich.TB5.faithful_embedding_predicate.check3`: A graph containing only a long arc of a skeletal circle uses its own path distance, not the shorter omitted arc.

Construction. Define lattice length by primitive integral direction, use intrinsic shortest paths on both graph realizations, and separate edgewise expansion from global topology.

*Needs:* `TB.3/metric-graphs` (Metric graphs with loops and vertex genus); `TB.4/torus-tropicalization` (Torus tropicalization); `TB.4/relative-tropical-multiplicity` (Relative point and edge multiplicities); `SchemeAndStackFoundations:SF.0`.

Sources: [Matthew Baker, Sam Payne, Joseph Rabinoff, Nonarchimedean geometry, tropicalization, and metrics on curves](https://arxiv.org/abs/1104.0320), §5.15, Remark 5.16 and Lemma 5.17, pp. 24–25. Faithfulness and the warning to use the graph’s intrinsic metric, not an ambient skeleton shortcut.

### 5.5 Functions separating edges and vertices

Prove `TauCeti.Berkovich.TB5.unit_slope_separating_functions`. Given a finite embedded graph Γ⊂H°(Xᵃⁿ), one can choose finitely many nonzero rational functions on X that provide a primitive slope on each subdivided edge and separate all points of Γ that an initial toric embedding identifies. Adjoin them as coordinates, allowing the toric compactification required for their zeros and poles, to obtain a dominating closed toric embedding faithful on Γ.

Assumptions and scope: Smooth algebraic connected curve over algebraically closed complete nontrivial K; subdivide loops and ensure finitely many relevant graph edges/vertices.

Proof route. On vertex residue curves use algebraic Riemann–Roch to prescribe a slope-one local function, then lift it to a formal vertex domain. Approximate annular coordinates by global rational functions on suitable affinoids; compactness extracts finitely many separating functions. Separate edges first, then vertices and disjoint pieces, and include an initial closed embedding. The BL85 local lifting and FM86 Runge inputs remain named proof leaves.

*Needs:* `TB.5/faithful-embedding-predicate` (Faithful tropicalization on a graph); `TB.3/slope-formula` (Slope formula for rational functions); `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-4-repartitions-weil-differentials-and-riemannroch`.

Sources: [Matthew Baker, Sam Payne, Joseph Rabinoff, Nonarchimedean geometry, tropicalization, and metrics on curves](https://arxiv.org/abs/1104.0320), Lemmas 5.18–5.19 and Theorem 5.20, pp. 25–26. Residue Riemann–Roch, formal lifting, Runge approximation and finite separating coordinates.

Acceptance: A bad T² coordinate is repaired by adjoining T, yielding slope vector (2,1) and gcd one. Edgewise primitive slopes alone do not complete the vertex-separation step.

### 5.6 Faithful tropicalization of marked rays

Prove `TauCeti.Berkovich.TB5.puncture_ray_faithfulness`. For X= X̄\D with finite marked punctures, choose a semistable extended skeleton and a toric embedding that sends each puncture to the toric boundary. A dominating toric embedding can be made faithful on the entire extended skeleton, including infinite tails. At each puncture use two rational functions with coprime pole orders larger than 2g to force gcd-one expansion on the eventual ray, then refine the remaining compact part.

Assumptions and scope: K algebraically closed complete nontrivial; smooth proper completion and distinct split marked points.

Proof route. Riemann–Roch produces functions with the two prescribed sufficiently large pole orders at each mark; their eventual slopes have gcd one. Outside finitely long initial segments they separate the labeled rays; apply compact-graph faithful refinement to the remaining core.

*Needs:* `TB.2/marked-extended-skeleton` (Marked skeleta and puncture rays); `TB.5/unit-slope-separating-functions` (Functions separating edges and vertices).

Sources: [Matthew Baker, Sam Payne, Joseph Rabinoff, Nonarchimedean geometry, tropicalization, and metrics on curves](https://arxiv.org/abs/1104.0320), Theorem 5.22 and proof, pp. 26–27. Coprime pole orders repair the unbounded tails as well as the finite graph.

## Layer 6: Model metrics, measures and local heights

Model intersection degrees first give atomic measures with the correct total mass. Semipositivity and integrability specify the approximation class for weak limits and local heights. Graph Green functions, line Hsia potentials and hybrid topology have distinct contracts; none implies dynamical convergence without its consumer theorem.

External layer inputs: `AdicSpacesPartII:R2/admissible-formal-scheme`; `AdicSpacesPartII:R2/raynaud-generic-fibre`; `SchemeAndStackFoundations:SF.5`.

### 6.1 Formal and model metrics

Define `TauCeti.Berkovich.TB6.formal_model_metrics`. A model metric on a line bundle L over proper X is induced by an admissible formal model (𝔛,𝔏) of (X,L^e), e≥1: for a formal frame σ of 𝔏 and a local section s of L with s^e=fσ, define ||s||^e=|f|. A metric is continuous, homogeneous in scalars and nonzero on nonzero vectors. Tensor products and duals add and negate logarithmic metric ratios. A vertical Cartier divisor gives a model function on Xᵃⁿ, compatible with admissible blowups.

Assumptions and scope: Proper K-variety and positive tensor exponent; formal line-bundle frames of L^e, not an unchosen frame of L.

The interface is used in TB.6 measures/local heights and Yuan Appendix A.5 for Translates vertical intersection data into analytic norms and graph model functions.

The API consists of:

- `TauCeti.Berkovich.TB6.formal_model_metrics.ofModel` (constructor): A model of L^e defines a metric on L by the e-th-root rule.
- `TauCeti.Berkovich.TB6.formal_model_metrics.frame_eval` (simp): A model frame has norm one; multiplying by f changes the norm by |f|.
- `TauCeti.Berkovich.TB6.formal_model_metrics.tensor_dual` (structure): Tensor, dual and tensor-power metrics satisfy the logarithmic sum/negative/scaling rules.
- `TauCeti.Berkovich.TB6.formal_model_metrics.pullback` (functoriality): Model pullback agrees with pullback of the analytic norm and respects composition.
- `TauCeti.Berkovich.TB6.formal_model_metrics.blowup_invariance` (compatibility): Pullback to an admissible blowup does not change the analytic metric.

**Checks.**

- `TauCeti.Berkovich.TB6.formal_model_metrics.check1`: A trivial line with its trivial model has constant frame norm one.
- `TauCeti.Berkovich.TB6.formal_model_metrics.check2`: A model of L² must use square roots; omitting e doubles log norms.
- `TauCeti.Berkovich.TB6.formal_model_metrics.check3`: Multiplying a local frame by an integral unit leaves the norm unchanged.

Construction. Use unit absolute value of formal transition functions to glue the local norms; divide logarithms by e. Pullback along a common admissible blowup compares different model presentations.

*Needs:* `TB.0/analytic-spaces` (Analytic atlases and morphisms); `AdicSpacesPartII:R2/admissible-formal-scheme`; `AdicSpacesPartII:R2/raynaud-generic-fibre`.

Sources: [Antoine Chambert-Loir, Mesures et équidistribution sur les espaces de Berkovich](https://arxiv.org/pdf/math/0304023v3), §2.1–2.3, pp. 4–5. Formal metrics, tensor powers, semipositivity and model-function changes.

Acceptance: For a local section s of L with s^e=fσ in a formal frame σ of the model of L^e, the defining identity is ||s||^e=|f|. A frame of L^e is not silently treated as a frame of L; tensor and dual operations respect this identity.

### 6.2 Chambert–Loir model measures

Construct `TauCeti.Berkovich.TB6.model_measures`. For a d-dimensional proper variety and model-metrized line bundles L₁,…,L_d, define the mixed measure Σ_Y mult(Y)·deg_Y(c₁(𝔏₁)…c₁(𝔏_d))/(e₁…e_d)·δ_{ξ_Y}, on the generic points of the normal model special fiber. After algebraically closed base change or in the split normalization, its total mass is deg_X(L₁…L_d). On a reduced split semistable curve this is Σ_v deg(𝔏|C_v)/e·δ_v. Common blowups, multilinearity and the projection formula make the measure independent of the presentation.

Assumptions and scope: Intersection degrees use the stated residue-field convention; retain component multiplicities in nonreduced special fibers. General valuation-ring intersection theory is an explicit requested input.

The interface is used in TB.6 semipositive limits/local heights; global Arakelov consumers for Defines local analytic curvature once, without rebuilding global adelic heights.

The API consists of:

- `TauCeti.Berkovich.TB6.model_measures.atomicFormula` (characterisation): The measure is the finite atomic sum at divisorial model points with the displayed weights.
- `TauCeti.Berkovich.TB6.model_measures.mass` (compatibility): Its total mass is the algebraic intersection degree.
- `TauCeti.Berkovich.TB6.model_measures.multilinear` (structure): It is symmetric and multilinear in metrized line bundles.
- `TauCeti.Berkovich.TB6.model_measures.projection` (functoriality): For finite surjective f of degree δ, f_*c₁(f*L₁)…c₁(f*L_d)=δ c₁(L₁)…c₁(L_d).
- `TauCeti.Berkovich.TB6.model_measures.commonModel` (equivalence): Common admissible modifications preserve the analytic measure.

**Checks.**

- `TauCeti.Berkovich.TB6.model_measures.check1`: For good reduction and degree-d L on a curve, the measure is dδ_Gauss.
- `TauCeti.Berkovich.TB6.model_measures.check2`: A degree-zero trivial model line has zero curvature measure.
- `TauCeti.Berkovich.TB6.model_measures.check3`: Dropping a special-fiber multiplicity or a tensor exponent changes the mass and fails the degree identity.

Construction. Pass to a common normal model and compute atomic weights by special-fiber intersection. Algebraic specialization of degree gives total mass; projection formula gives blowup invariance and finite-map pushforward, and symmetry of intersections gives symmetry of mixed measures.

*Needs:* `TB.6/formal-model-metrics` (Formal and model metrics); `TB.2/formal-model-skeleton` (Formal models and metric dual graphs); `SchemeAndStackFoundations:SF.5`.

Sources: [Antoine Chambert-Loir, Mesures et équidistribution sur les espaces de Berkovich](https://arxiv.org/pdf/math/0304023v3), Definition 2.4 and §2.5, pp. 5–6. Atomic intersection formula, multiplicities, multilinearity and local heights.

### 6.3 Semipositive and integrable metrics

Define `TauCeti.Berkovich.TB6.semipositive_integrable_metrics`. A formal/model metric is semipositive if its model line bundle has nonnegative degree on every proper special-fiber curve. A continuous semipositive metric is a uniform limit of semipositive model metrics. An integrable metrized line bundle is a difference, in the metrized Picard group, of two semipositive metrized line bundles. The uniform metric distance on a fixed L is sup_x|log(||·||₁/||·||₂)(x)|.

Assumptions and scope: Use a compact proper analytification; comparison ratios are frame independent. For nonmetrizable fields the approximation mode is stated explicitly as nets or a countable-descent construction, not assumed automatic.

The interface is used in TB.6 weak limits and height continuity for Specifies exactly the cone and topology for approximation, rather than assuming every continuous metric is semipositive.

The API consists of:

- `TauCeti.Berkovich.TB6.semipositive_integrable_metrics.distance` (data): The logarithmic uniform distance is a genuine metric on metrics of a fixed line bundle.
- `TauCeti.Berkovich.TB6.semipositive_integrable_metrics.tensor` (structure): Semipositive metrics form a tensor/additive cone and integrable metrics form a group.
- `TauCeti.Berkovich.TB6.semipositive_integrable_metrics.limit` (constructor): A uniform limit of semipositive metrics is semipositive in the approximation definition.
- `TauCeti.Berkovich.TB6.semipositive_integrable_metrics.positiveMeasure` (compatibility): Mixed semipositive model measures are positive; integrable measures are obtained by multilinearity.

**Checks.**

- `TauCeti.Berkovich.TB6.semipositive_integrable_metrics.check1`: On a split curve, a model degree −1 on one component is not semipositive even if total degree is positive.
- `TauCeti.Berkovich.TB6.semipositive_integrable_metrics.check2`: Uniformly multiplying a metric by a positive constant preserves semipositivity.
- `TauCeti.Berkovich.TB6.semipositive_integrable_metrics.check3`: The difference of semipositive metrics can have signed curvature and is not required semipositive.

Construction. Prove frame independence of ratios and the metric/tensor identities. Nefness on model curves yields positive model measures; complete the cone in the uniform topology and take its difference group.

*Needs:* `TB.6/formal-model-metrics` (Formal and model metrics); `TB.6/model-measures` (Chambert–Loir model measures).

Sources: [Antoine Chambert-Loir, Mesures et équidistribution sur les espaces de Berkovich](https://arxiv.org/pdf/math/0304023v3), §§2.2–2.3 and Proposition 2.7, pp. 4–8. Model semipositivity, uniform approximation and integrable differences; source §2 uses a countable dense subfield.

### 6.4 Limits and local intersection heights

Prove `TauCeti.Berkovich.TB6.measure_limits_and_local_heights`. On proper X over a complete nonarchimedean field with a countable dense subfield, mixed measures of uniformly convergent semipositive model metrics converge weakly to a positive Radon measure of the same degree mass, independently of approximants; extend multilinearly to integrable metrics. For sections s₀,…,s_d meeting properly, local heights satisfy h(s₀,…,s_d|Z)=h(s₁,…,s_d|div_Z s₀)−∫log||s₀|| c₁(L₁)…c₁(L_d)|Z. Changing one continuous metric by exp(−F) changes the corresponding local height by the integral of F against the remaining mixed curvature. The extension is for integrable metrics and admissible logarithmic singularities, not arbitrary singular potentials.

Assumptions and scope: Proper d-cycle, properly intersecting sections, integrable metrizations and integrable logarithmic terms. Algebraic intersection uses v(π)=1; analytic local heights include −log|π|.

Proof route. For model metrics apply intersection recursion and projection formula. The telescoping estimate bounds a change of one metric by its uniform distance times the appropriate mixed degree. Uniform density of model functions identifies weak limits against continuous tests; positivity and mass control yield Radon convergence. Extend by multilinearity and prove decomposition independence. Non-countable base fields require the separate descent/net proof leaf.

*Needs:* `TB.6/semipositive-integrable-metrics` (Semipositive and integrable metrics); `TB.6/model-measures` (Chambert–Loir model measures).

Sources: [Antoine Chambert-Loir, Mesures et équidistribution sur les espaces de Berkovich](https://arxiv.org/pdf/math/0304023v3), §2.5 and Proposition 2.7, pp. 6–8. Local height recursion, Lipschitz control and passage to semipositive/integrable limits.

Acceptance: Uniform convergence alone does not imply weak convergence of arbitrary signed Laplacians without positivity or total-variation control. The measure mass remains deg(L₁…L_d) through approximation.

### 6.5 Hsia kernels and positive energy

Define `TauCeti.Berkovich.TB6.hsia_potentials_and_energy`. On the Berkovich line over ℂ_p set δ∞(x,y)=diam(x∨y), and use its projectively normalized spherical kernel when infinity is included. A signed measure has continuous potential if its potential relative to a fixed Gauss base measure is continuous. For equal-mass measures ν₁,ν₂ of continuous potential, put ρ=ν₁−ν₂ and E(ρ)=−∬log δ∞(x,y)dρ(x)dρ(y); normalization terms cancel because ρ has mass zero. Then E(ρ)≥0 with equality iff ρ=0. The Hsia diagonal of a nonclassical point is retained. Classical self-atoms require a separately renormalized energy, for which this positivity claim is not made.

Assumptions and scope: Finite signed Radon measures with the stated continuous-potential/integrability conditions. Source supports ℂ_p; arbitrary complete algebraically closed fields need a separate proof.

The interface is used in DKY §2.7 and ArithmeticDynamics:DY.2 for Supplies the local potential-theory input with a correct positivity statement; global dynamical energies remain with the consumer.

The API consists of:

- `TauCeti.Berkovich.TB6.hsia_potentials_and_energy.kernel` (data): δ∞(x,y) is the join diameter, with finite positive self-diameter at a hyperbolic point.
- `TauCeti.Berkovich.TB6.hsia_potentials_and_energy.potential` (constructor): A continuous-potential mass-zero measure gives a potential modulo constants.
- `TauCeti.Berkovich.TB6.hsia_potentials_and_energy.laplacian` (compatibility): The kernel potential has ddc equal to the specified measure difference.
- `TauCeti.Berkovich.TB6.hsia_potentials_and_energy.energy` (characterisation): Self-energy is the squared-slope integral, hence positive definite on mass-zero continuous-potential measures.
- `TauCeti.Berkovich.TB6.hsia_potentials_and_energy.pairing` (relation): Polarization defines a symmetric bilinear energy pairing; cross-pairings can be negative.

**Checks.**

- `TauCeti.Berkovich.TB6.hsia_potentials_and_energy.check1`: For distinct hyperbolic x,y, E(δ_x−δ_y)=d(x,y)>0.
- `TauCeti.Berkovich.TB6.hsia_potentials_and_energy.check2`: The cross-pairing of ρ and −ρ is −E(ρ), so arbitrary cross-energy is not nonnegative.
- `TauCeti.Berkovich.TB6.hsia_potentials_and_energy.check3`: At ζ(0,r), δ∞(x,x)=r>0; deleting every diagonal would lose finite self-energy.
- `TauCeti.Berkovich.TB6.hsia_potentials_and_energy.check4`: A classical Dirac mass has a logarithmic singularity and is outside the continuous-potential positivity hypothesis.

Construction. Construct finite-tree potentials and use the graph energy identity; exhaust the hyperbolic tree and identify E with the integral of squared directional potential slope. Zero energy makes the potential constant, hence the measure zero. Verify kernel Laplacian ddc logδ∞(·,y)=δ_y−δ_∞.

*Needs:* `TB.1/tree-hyperbolic-metric` (Paths, tangent directions and hyperbolic metric); `TB.3/graph-laplacian` (Graph Laplacians and potentials).

Sources: [Charles Favre and Juan Rivera-Letelier, Équidistribution quantitative des points de petite hauteur sur la droite projective](https://arxiv.org/pdf/math/0407471), §§4.1–4.5, equation (20), Lemmas 4.3–4.4 and Proposition 4.5, pp. 23–27. Kernel, continuous potentials, integrability and positive self-energy. The source Δ equals this packet’s ddc=−Δ. Correct the interior second-derivative sign in §4.2 as recorded in E13; equation (20) and the outgoing vertex atoms fix the convention. The source Δ equals this packet’s ddc=−Δ. Correct the interior second-derivative sign in §4.2 as recorded in E13; equation (20) and the outgoing vertex atoms fix the convention. [Laura DeMarco, Holly Krieger and Hexi Ye, Uniform Manin–Mumford for a family of genus 2 curves](https://arxiv.org/pdf/1901.09945v2), §2.7, pp. 11–12. Consumer normalization; its printed cross-energy claim is corrected in source issue E6. [Laura DeMarco, Holly Krieger and Hexi Ye, Uniform Manin–Mumford for a family of genus 2 curves](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n3-p05-s.pdf), §2.7, printed p. 961. The local pairing uses self-energy of the difference; the intervening arbitrary cross-energy positivity assertion needs the E6 correction.

### 6.6 Admissible Green functions and measures

Construct `TauCeti.Berkovich.TB6.graph_green_and_admissible_measure`. For a polarized compact metric graph (Γ,g(v)) of genus g>0, let μ be a probability measure. Its normalized Green kernel satisfies Δ_y g_μ(x,y)=δ_x−μ, ∫g_μ(x,y)dμ(y)=0 and symmetry. There is a unique admissible probability μ_a characterized by g_μ(KΓ,x)+g_μ(x,x) being constant. Explicitly μ_a=(1/g)(Σ_vg(v)δ_v+Σ_e ds/(ℓ_e+r_e)), where r_e is the effective resistance between its endpoints in Γ with the edge interior deleted; r_e=∞ for a bridge and r_e=0 for a loop.

Assumptions and scope: Positive polarized genus; KΓ=Σ(2g(v)−2+val(v))v; use real electrical resistance and natural-log lengths.

The interface is used in Yuan Appendix A.5 and TB.6 admissible metric comparison for Provides the graph correction to local geometric metrics, distinct from complex Green functions.

The API consists of:

- `TauCeti.Berkovich.TB6.graph_green_and_admissible_measure.green` (constructor): The unique mean-zero Green kernel solves Δg=δ−μ.
- `TauCeti.Berkovich.TB6.graph_green_and_admissible_measure.symmetry` (relation): g_μ(x,y)=g_μ(y,x).
- `TauCeti.Berkovich.TB6.graph_green_and_admissible_measure.admissible` (characterisation): The admissible measure is the unique probability satisfying the canonical-divisor diagonal condition.
- `TauCeti.Berkovich.TB6.graph_green_and_admissible_measure.resistanceFormula` (simp): Vertex atoms and edge densities are exactly the displayed formula.
- `TauCeti.Berkovich.TB6.graph_green_and_admissible_measure.subdivision` (compatibility): Subdividing an edge preserves the measure and kernel under the canonical isometry.

**Checks.**

- `TauCeti.Berkovich.TB6.graph_green_and_admissible_measure.check1`: For good reduction of genus g>0, the point graph has μ_a=δ_v.
- `TauCeti.Berkovich.TB6.graph_green_and_admissible_measure.check2`: A genus-one circle of length L has μ_a=ds/L.
- `TauCeti.Berkovich.TB6.graph_green_and_admissible_measure.check3`: A bridge has zero edge density, even though its length can be positive.
- `TauCeti.Berkovich.TB6.graph_green_and_admissible_measure.check4`: For genus zero the 1/g formula is undefined and no assertion is made.

Construction. Solve the finite-graph Poisson equation with edge quadratic potentials, fix the mean-zero constant and use the energy identity for uniqueness. Compute the diagonal derivative/effective-resistance contribution on each edge; the total density mass is b₁ and vertex mass is Σg(v), giving normalization. The unit-edge Yuan formula rescales to the displayed length formula.

*Needs:* `TB.3/graph-laplacian` (Graph Laplacians and potentials); `TB.3/metric-graphs` (Metric graphs with loops and vertex genus).

Sources: [Xinyi Yuan, Arithmetic bigness and a uniform Bogomolov-type result](https://faculty.bicmr.pku.edu.cn/~yxy/preprints/bigness_and_bogomolov.pdf), Appendix A.5, Green-kernel characterization and Proposition A.5, pp. 115–118. Normalized Green function, admissible measure and unit-edge resistance formula, with lengths rescaled here.

### 6.7 Metric–Laplacian and admissible corrections

Prove `TauCeti.Berkovich.TB6.model_metric_laplacian`. On a split semistable curve, multiplying a model/integrable metric by exp(−F∘τ) changes its curvature by −i_*ΔF for PL or admissible piecewise C² F. For a regular DVR model with normalized v(π)=1, put c=log(|π|⁻¹). Yuan’s unit-coordinate potential f and metric factor e_K^(−f) correspond to natural-log coordinate s=c·t and F(s)=c·f(s/c). The pushforward of Δ_unit f is Δ_natural F, so the curvature measure has no extra c factor. For the model Arakelov metric on the dualizing bundle, c₁(ω,||·||_Ar)=i_*δ_KΓ. Its admissible correction is e_K^(−a−g_μ(KΓ,τ(x)))=e_K^(g_μ(τ(x),τ(x))), with a the Green normalization constant, and c₁(ω,||·||_a)=(2g−2)i_*μ_a.

Assumptions and scope: Split semistable proper curve of positive genus; the dualizing metric statement uses Yuan’s model/Arakelov metric and normalized Green conventions. Approximation must control Laplacians as well as potentials. The unit-edge formula uses a regular semistable DVR model with local equation uv=π. Thickness n is represented by an edge of length n or by n unit subdivisions.

Proof route. For model PL functions identify vertical-divisor intersections with outgoing slopes. Apply model PL approximation with weak Laplacian convergence and controlled total variation for piecewise C² potentials. Under s=c·t and F=c·f the slopes are unchanged, including the vertex atoms and the interior Laplacian measure. The model dualizing degree on each component is 2g_v−2+val(v). Subtract the Green Laplacian δ_KΓ−(2g−2)μ_a to obtain the corrected curvature. Local heights rescale with log absolute values, while these curvature measures keep their total mass.

*Needs:* `TB.6/formal-model-metrics` (Formal and model metrics); `TB.6/graph-green-and-admissible-measure` (Admissible Green functions and measures); `TB.6/measure-limits-and-local-heights` (Limits and local intersection heights); `TB.6/model-pl-approximation` (Model potentials and Laplacian approximation).

Sources: [Xinyi Yuan, Arithmetic bigness and a uniform Bogomolov-type result](https://faculty.bicmr.pku.edu.cn/~yxy/preprints/bigness_and_bogomolov.pdf), Appendix A.5, displayed admissible metric formula, p. 116; Propositions A.4–A.5 and proofs, pp. 117–118. Metric correction and normalized curvature/Laplacian formula; the original graph edges have length one.

Acceptance: For F(t)=t on an interval, curvature change is δ₀−δ_L. Changing the absolute-value normalization rescales both edge length and log metric, not just one. Uniform PL density by itself is insufficient to claim Laplacian convergence. For s=c·t and F(s)=c·f(s/c), ΔF is the coordinate pushforward of Δf. Multiplying the measure by c again would give an incorrect dualizing total mass.

### 6.8 Good-reduction and Tate calibration

Prove `TauCeti.Berkovich.TB6.good_reduction_and_tate_measures`. For a good-reduction proper curve with a semipositive model line bundle of degree d, its model measure is dδ_ζ at the unique component point. For the Tate elliptic curve E_q with L=−log|q| and canonical degree-one line bundle O(0), the canonical measure is normalized length ds/L on the skeletal circle. The periodic potential g(s)=s²/(2L)−s/2+L/12 on 0≤s≤L has mean zero and ddc g=ds/L−δ₀; choose a reference O(0) metric whose curvature is δ₀ at the skeletal origin. Multiplication by exp(−g) then produces the canonical curvature. The constant L/12 normalizes the graph potential to mean zero; identifying the resulting metric with a chosen canonical metric additionally requires its rigidification.

Assumptions and scope: Split good reduction or split Tate reduction; 0<|q|<1. The reference metric has curvature δ₀. Mean-zero normalization fixes g, while a fixed rigidification fixes the canonical line-bundle metric up to its otherwise undetermined constant.

Proof route. The good-reduction model has one component, so the atomic formula gives dδ_ζ. On the circle compute g″=1/L, derivative jump −1 at 0 and integral zero. Add ddc g to the reference curvature δ₀ to get ds/L. Curvature determines the metric only up to a constant; compare rigidifications separately.

*Needs:* `TB.6/model-measures` (Chambert–Loir model measures); `TB.6/model-metric-laplacian` (Metric–Laplacian and admissible corrections); `TB.7/tate-analytic-quotient` (Tate analytic quotient and skeletal circle).

Sources: [Antoine Chambert-Loir, Mesures et équidistribution sur les espaces de Berkovich](https://arxiv.org/pdf/math/0304023v3), §2.4 and Tate example, pp. 5–6 and 17–18. Atomic good-reduction measure and the Tate circle local metric. [Xinyi Yuan, Arithmetic bigness and a uniform Bogomolov-type result](https://faculty.bicmr.pku.edu.cn/~yxy/preprints/bigness_and_bogomolov.pdf), Proposition A.5, pp. 117–118. The genus-one circle is the admissible measure calibration.

Acceptance: The Tate canonical measure is not a Dirac mass at one chosen vertex. Its total mass is one; for degree d it scales to d.

### 6.9 Model potentials and Laplacian approximation

Prove `TauCeti.Berkovich.TB6.model_pl_approximation`. On a finite rational-length polarized reduction graph of a split semistable proper curve over a complete discretely valued field, each continuous edgewise C² function F admits PL approximants F_n with rational breakpoints, uniformly converging to F, whose Laplacian measures converge weakly to ΔF with uniformly bounded total variation. The potentials may be chosen with rational values, so after multiplying by a positive integer and passing to a finite valued extension their vertex data come from vertical divisors on regular semistable models. Thus their normalized metrics are rational model metrics and the curvature–Laplacian identity passes to F.

Assumptions and scope: Fix the unit-edge valuation normalization before approximation; use a finite graph and functions C² up to the endpoints of every chosen edge. Refinement allows all rational breakpoints as divisorial points. Constants can be approximated independently and do not affect Δ.

Proof route. Interpolate at finer rational partitions, approximating values sufficiently closely relative to the square of the mesh size. On each edge the derivative slopes converge to the derivative of F away from partition points, and their variation is controlled by the integral of |F″| plus the vanishing interpolation error. Vertex outgoing slopes converge as well. Integration by parts gives weak convergence of the interior and vertex measures. Clear rational denominators in the values and subdivide after finite extension to realize the vertical model divisor. Yuan sketches density but does not supply this derivative/variation control; it is included in the existing graph-Green proof leaf.

*Needs:* `TB.3/graph-laplacian` (Graph Laplacians and potentials); `TB.6/formal-model-metrics` (Formal and model metrics); `TB.6/model-measures` (Chambert–Loir model measures); `TB.2/refinement-and-field-extension` (Refinement and valued extension).

Sources: [Xinyi Yuan, Arithmetic bigness and a uniform Bogomolov-type result](https://faculty.bicmr.pku.edu.cn/~yxy/preprints/bigness_and_bogomolov.pdf), Appendix A.5, Proposition A.4 and proof, p. 117. Uses rational subdivisions realized by finite extensions and model-function approximation. The stronger convergence contract states the control needed to justify the measure passage.

Acceptance: For an affine F on one edge, the interior Laplacian vanishes and only the outgoing endpoint atoms remain. Uniform convergence alone fails: n⁻¹sin(n²t) tends uniformly to zero while its Laplacian total variation diverges. Subdivision adds no atom at a point where the two incident affine slopes agree.

## Layer 7: Uniformization and integration interfaces

Import the algebraic Tate curve, local Coleman primitives and the abelian logarithm. Build the analytic quotients and Schottky–Mumford comparison, compare Jacobian periods with graph lengths, and then state the branch-sensitive path integral and its valuation-linear correction to abelian integration.

External layer inputs: `ColemanIntegration:L0/annulus-branch-change`; `ColemanIntegration:L0/annulus-log-primitive`; `ColemanIntegration:L0/annulus-residue`; `ColemanIntegration:L1/coleman-integration-characterisation`; `EffectiveDiophantineMethods:ED.4/abelian-integral`; `EffectiveDiophantineMethods:ED.4/abelian-logarithm`; `NeronModelsAndSemistableAbelianVarieties:R11.3`; `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`.

### 7.1 Tate analytic quotient and skeletal circle

Construct `TauCeti.Berkovich.TB7.tate_analytic_quotient`. Import E_q and its compatible point-level Tate uniformization from EllipticCurves. For complete nonarchimedean K and 0<|q|<1, construct the analytic quotient G_mᵃⁿ/q^ℤ and identify it with E_qᵃⁿ. The Gauss-line skeleton descends to ℝ/Lℤ with L=−log|q|, and its retraction is −log|z| mod L. The invariant differential pulls back to dz/z. Isometric scalar extension commutes with quotient, skeleton and differential.

Assumptions and scope: The elliptic curve and point uniformization are imported, not constructed a second time. This is the split Tate case.

The interface is used in TB.6 Tate measure; TB.7 period and integral calibration for Connects an existing algebraic elliptic curve to its analytic quotient and exact skeleton length.

The API consists of:

- `TauCeti.Berkovich.TB7.tate_analytic_quotient.quotientMap` (constructor): The analytic group quotient has kernel q^ℤ and universal descent for invariant analytic maps.
- `TauCeti.Berkovich.TB7.tate_analytic_quotient.tateEquiv` (equivalence): The quotient identifies with the imported Tate elliptic analytification.
- `TauCeti.Berkovich.TB7.tate_analytic_quotient.skeleton` (characterisation): Its skeleton is ℝ/Lℤ and τ([z])=−log|z| mod L.
- `TauCeti.Berkovich.TB7.tate_analytic_quotient.differential` (compatibility): The invariant form pulls back to dz/z.
- `TauCeti.Berkovich.TB7.tate_analytic_quotient.baseChange` (functoriality): The quotient and circle commute with isometric complete valued extension.

**Checks.**

- `TauCeti.Berkovich.TB7.tate_analytic_quotient.check1`: Replacing z by qz changes its real coordinate by L and leaves its skeletal class unchanged.
- `TauCeti.Berkovich.TB7.tate_analytic_quotient.check2`: The circumference is −log|q|, so changing q to qⁿ scales it by n.
- `TauCeti.Berkovich.TB7.tate_analytic_quotient.check3`: The condition |q|<1 is essential; a unit q does not supply this contracting annular quotient.

Construction. Glue an annular fundamental domain by multiplication by q and verify the free properly discontinuous quotient action. The convergent Tate parametrization identifies this analytic group with the imported elliptic curve. Its Gauss interval and translation action give the circle and logarithmic circumference.

*Needs:* `TB.1/annular-skeleton` (Annular skeleton and deformation); `TB.0/analytic-spaces` (Analytic atlases and morphisms); `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`.

Sources: [Jérôme Poineau and Daniele Turchetti, Berkovich curves and Schottky uniformization](https://poineau.users.lmno.cnrs.fr/Textes/SchottkyVIASM.pdf), Theorem II.3.18 and Example II.3.19, pp. 49–50. Rank-one Schottky quotient is the Tate analytic curve. [Antoine Chambert-Loir, Mesures et équidistribution sur les espaces de Berkovich](https://arxiv.org/pdf/math/0304023v3), Tate example, pp. 17–18. The metric circle and local canonical measure normalization.

### 7.2 Schottky groups and fundamental domains

Define `TauCeti.Berkovich.TB7.schottky_data`. Use finitely generated Schottky subgroups Γ⊂PGL₂(K), equivalently in the marked presentation a free generating tuple γ₁,…,γ_g with pairwise disjoint paired closed discs D⁺(γ_i^{±1}) such that γ_i^{±1}(P¹ᵃⁿ\D⁺(γ_i^{∓1})) is the maximal open disc inside D⁺(γ_i^{±1}). Nonidentity elements are loxodromic. Their limit set Λ is the set of accumulation points of distinct group translates, and Ω=P¹ᵃⁿ\Λ. A loxodromic matrix has unequal eigenvalue norms, equivalently |det|<|tr|², and is conjugate to z↦βz with 0<|β|<1.

Assumptions and scope: Complete nonarchimedean K; marked paired-disc data includes the maximal-open-disc condition. The unmarked equivalence uses the Schottky figure theorem rather than assuming every free subgroup has such a figure.

The interface is used in TB.7 Mumford quotient and converse for The analytic quotient needs proper discontinuity and genuine contraction, not only an abstract lattice.

The API consists of:

- `TauCeti.Berkovich.TB7.schottky_data.loxodromic` (characterisation): Unequal eigenvalue norms are equivalent to |det|<|tr|².
- `TauCeti.Berkovich.TB7.schottky_data.koebe` (data): Attracting and repelling K-rational points and 0<|β|<1 determine a loxodromic transformation.
- `TauCeti.Berkovich.TB7.schottky_data.figure` (constructor): A paired-disc figure yields the marked free Schottky group.
- `TauCeti.Berkovich.TB7.schottky_data.limitSet` (data): Λ is the closed accumulation set; Ω is its invariant open complement.
- `TauCeti.Berkovich.TB7.schottky_data.changeMarking` (compatibility): The underlying group/quotient does not depend on the chosen free basis or fundamental figure.

**Checks.**

- `TauCeti.Berkovich.TB7.schottky_data.check1`: diag(q,1) with 0<|q|<1 has limit set {0,∞}.
- `TauCeti.Berkovich.TB7.schottky_data.check2`: A matrix with |det|=|tr|² is not certified loxodromic by the strict criterion.
- `TauCeti.Berkovich.TB7.schottky_data.check3`: A free abstract group action without contraction/disjoint paired discs is not automatically Schottky.

Construction. Construct the nested discs indexed by reduced words. Ping-pong gives freeness; contraction gives loxodromic elements and K-rational limit points. The trace/determinant calculation supplies the explicit loxodromic test.

*Needs:* `TB.1/gauss-line-and-discs` (Gauss points, discs and projective line); `TB.1/tree-hyperbolic-metric` (Paths, tangent directions and hyperbolic metric).

Sources: [Jérôme Poineau and Daniele Turchetti, Berkovich curves and Schottky uniformization](https://poineau.users.lmno.cnrs.fr/Textes/SchottkyVIASM.pdf), Definitions II.1.9/II.1.11, Lemma II.1.10, p. 38; Definition II.3.1 and Lemma II.3.6, pp. 45–46. Koebe coordinates, loxodromic criterion and paired-disc Schottky figures.

### 7.3 Schottky–Mumford uniformization

Prove `TauCeti.Berkovich.TB7.mumford_uniformization`. For a rank-g Schottky group Γ, Ω→Γ\Ω is a free properly discontinuous analytic quotient, the quotient is a smooth proper split Mumford curve of genus g, and its skeleton is Γ\Hull(Λ) (with the limit endpoints removed before quotient). Conversely a split analytic Mumford curve is so uniformized. A split Mumford curve means locally a K-Swiss-cheese domain, equivalently a split semistable model whose normalized special components are P¹_κ and nodes are κ-rational. Potential total degeneration over a finite extension does not imply this split condition over K; descend with its Galois cocycle and graph action.

Assumptions and scope: Complete nontrivially valued K. For the converse use the split Mumford hypothesis; genus zero gives P¹ and the trivial group, genus one the Tate quotient.

Proof route. Reduced-word discs give a compact fundamental region, a free proper action and the hull skeleton; the genus formula gives genus g. For the converse, take the topological universal cover, exhaust its genus-zero tree by finite Swiss-cheese neighborhoods, cap boundary annuli and use Runge-compatible embeddings into P¹. Deck transformations extend to PGL₂(K), giving the Schottky group. The compatible Runge-embedding proof input is explicitly recorded.

*Needs:* `TB.7/schottky-data` (Schottky groups and fundamental domains); `TB.2/formal-model-skeleton` (Formal models and metric dual graphs); `TB.2/vertex-genus-and-genus-formula` (Vertex genera and analytic genus); `TB.0/analytic-spaces` (Analytic atlases and morphisms).

Sources: [Jérôme Poineau and Daniele Turchetti, Berkovich curves and Schottky uniformization](https://poineau.users.lmno.cnrs.fr/Textes/SchottkyVIASM.pdf), Proposition II.2.26 and Remark II.2.28, pp. 44–45; Theorem II.3.18, pp. 49–50; Theorem II.4.3 and Remark II.4.7, pp. 57–61. Split Mumford condition, direct quotient theorem and converse; arbitrary genus-zero nonproper curves need not embed in P¹.

Acceptance: The quotient hull has b₁=g with all vertex genera zero. A potentially split curve is kept with descent data, rather than declared a K-Schottky quotient without proof.

### 7.4 Analytic Jacobian periods

Prove `TauCeti.Berkovich.TB7.analytic_jacobian_periods`. For smooth proper X with split semistable model and Jacobian J, import its Raynaud analytic uniformization 0→M′→Eᵃⁿ→Jᵃⁿ→0, with 0→T→E→B→0 and B of good reduction. The valuation map trop:Eᵃⁿ→N_ℝ has ker on points the good-reduction domain, and trop(M′) is a full real lattice. For a split Mumford curve B=0, T has rank g, and Jᵃⁿ=Tᵃⁿ/M′. Under M′≅H₁(Σ,ℤ), the valuation of the multiplicative period pairing equals the edge-length pairing; hence Sk(J)≅Jac(Σ) as principally polarized real tori. The analytic Abel–Jacobi map retracts to the tropical Abel–Jacobi map.

Assumptions and scope: Complete nonarchimedean K with split semistable model; choose X(K) basepoint when using the point Abel–Jacobi map. The Raynaud cross beyond the existing DVR formal comparison is a requested supplier statement.

Proof route. Use the supplied uniformization and the specialization map on Pic⁰ induced by the slope formula. Compare the two Abel–Jacobi maps on divisors and integral cycles; the induced H₁ isomorphism identifies valuation periods with length integration. This identifies the principal polarizations, not merely the dimensions of the real tori.

*Needs:* `TB.3/graph-jacobian` (Metric Jacobian and Abel–Jacobi map); `TB.3/slope-formula` (Slope formula for rational functions); `TB.7/mumford-uniformization` (Schottky–Mumford uniformization); `NeronModelsAndSemistableAbelianVarieties:R11.3`.

Sources: [Matthew Baker and Joseph Rabinoff, The skeleton of the Jacobian, the Jacobian of the skeleton, and lifting meromorphic functions from tropical to algebraic curves](https://arxiv.org/pdf/1308.3864), §2.7, Theorem 2.9, p. 5; Corollary 6.6 and Remark 6.7, p. 16. Arbitrary rank-one period lattice and equality of analytic monodromy and edge pairings. [Eric Katz, Joseph Rabinoff and David Zureick-Brown, Uniform bounds for the number of rational points on curves of small Mordell–Weil rank](https://arxiv.org/pdf/1504.00694), §3.4.1, pp. 21–22. The general Raynaud cross and valuation lattice needed for integration.

Acceptance: For a Tate curve the single multiplicative period is q and its valuation is L. Good reduction gives toric rank zero, even when dim J>0. The Cp-valued logarithmic periods need not form a discrete lattice; only their real valuation periods do.

### 7.5 Berkovich–Coleman path integration

Construct `TauCeti.Berkovich.TB7.berkovich_coleman_path_integral`. Fix a branch Log:ℂ_p×→ℂ_p extending the unit logarithm. For a smooth ℂ_p-analytic curve, and for the smooth analytic group covers used in the comparison, associate to a closed analytic 1-form and a continuous path with classical endpoints its Berkovich–Coleman integral. It is ℂ_p-linear in the form, invariant under endpoint-fixed homotopy, additive under path concatenation, functorial under analytic pullback, equals F(Q)−F(P) for exact dF, and satisfies ∫_P^Q dz/z=Log Q−Log P on G_m. Restriction to the good-reduction Coleman domains agrees with their Frobenius-normalized primitives.

Assumptions and scope: Characteristic zero and ℂ_p; fixed branch; analytic closed forms and endpoint-fixed homotopy. No global endpoint-only primitive is asserted when the skeleton has cycles.

The interface is used in TB.7 abelian comparison and annulus correction for Provides the path-sensitive object to compare with the already owned endpoint abelian integral.

The API consists of:

- `TauCeti.Berkovich.TB7.berkovich_coleman_path_integral.integral` (data): The value depends on the closed form and endpoint-fixed path homotopy class.
- `TauCeti.Berkovich.TB7.berkovich_coleman_path_integral.concat_reverse` (functoriality): Concatenation adds integrals; reversal negates them; constant paths integrate to zero.
- `TauCeti.Berkovich.TB7.berkovich_coleman_path_integral.exact` (simp): For dF the integral is F(Q)−F(P).
- `TauCeti.Berkovich.TB7.berkovich_coleman_path_integral.pullback` (compatibility): Integrating f*ω along γ equals integrating ω along f∘γ.
- `TauCeti.Berkovich.TB7.berkovich_coleman_path_integral.logarithm` (characterisation): On G_m, dz/z integrates to the chosen logarithm difference.
- `TauCeti.Berkovich.TB7.berkovich_coleman_path_integral.coleman_local` (compatibility): On the imported good-reduction domains it agrees with their Coleman primitive differences.

**Checks.**

- `TauCeti.Berkovich.TB7.berkovich_coleman_path_integral.check1`: The zero form and constant path give zero.
- `TauCeti.Berkovich.TB7.berkovich_coleman_path_integral.check2`: For TⁿdT with n≠−1, the integral is (Q^(n+1)−P^(n+1))/(n+1).
- `TauCeti.Berkovich.TB7.berkovich_coleman_path_integral.check3`: On G_m, dT/T uses Log, not a globally analytic primitive in O(G_m).
- `TauCeti.Berkovich.TB7.berkovich_coleman_path_integral.check4`: A Tate loop can have BC period Log(q); path independence on all of E_q is false.

Construction. Glue local primitives/logarithmic annular primitives along a triangulation, retaining the path and continuation constants. On good-reduction pieces use the imported Coleman characterization. Independence and global existence require the Berkovich integration theorem beyond these local axioms; this is an explicit owned proof gap, not inferred from formal antiderivatives.

*Needs:* `TB.0/analytic-spaces` (Analytic atlases and morphisms); `TB.2/noncompact-triangulations` (Locally finite triangulations and analytic nodes); `ColemanIntegration:L1/coleman-integration-characterisation`; `ColemanIntegration:L0/annulus-log-primitive`.

Sources: [Eric Katz, Joseph Rabinoff and David Zureick-Brown, Diophantine and tropical geometry, and uniformity of rational points on curves](https://arxiv.org/pdf/1606.09618v2), Definition 4.2.2 and surrounding discussion, pp. 28–30. Path integral axioms and logarithm normalization; cites the deeper Berkovich existence theorem. [Eric Katz, Joseph Rabinoff and David Zureick-Brown, Uniform bounds for the number of rational points on curves of small Mordell–Weil rank](https://arxiv.org/pdf/1504.00694), §3.1–3.3 and §3.4.2, pp. 15–23. The path integral on smooth spaces and simply connected analytic group covers needed in Proposition 3.16.

### 7.6 Annular integration and residue monodromy

Prove `TauCeti.Berkovich.TB7.annular_residues_and_periods`. For an open annulus with coordinate t and ω=(Σa_ntⁿ)dt, import res(ω)=a₋₁ and its logarithmic primitive. The BC integral is a₋₁(Log t(Q)−Log t(P))+Σ_{n≠−1}a_n(t(Q)^(n+1)−t(P)^(n+1))/(n+1). Reversing annular orientation negates the residue; a branch change Log′−Log=c·v_p changes the value by c·res(ω)(v_p(t(Q))−v_p(t(P))). Residues of a regular differential around a semistable vertex sum to zero, defining a harmonic graph cochain. Cycle continuation of local primitives records BC periods and is distinct from the real monodromy length pairing.

Assumptions and scope: Open annuli over ℂ_p; compatible Laurent convergence on every compact subannulus. For the vertex residue identity use regular differentials on a semistable proper curve.

Proof route. Apply the imported annulus primitive and residue invariance. Laurent substitution proves the branch-change expression. On each normalized residue component the residue theorem cancels outgoing boundary residues; Čech continuation constants along graph cycles give periods. The semistable residue/continuation comparison is a stated proof leaf where absent from the local Coleman API.

*Needs:* `TB.7/berkovich-coleman-path-integral` (Berkovich–Coleman path integration); `TB.3/metric-graphs` (Metric graphs with loops and vertex genus); `ColemanIntegration:L0/annulus-residue`; `ColemanIntegration:L0/annulus-log-primitive`; `ColemanIntegration:L0/annulus-branch-change`.

Sources: [Eric Katz, Joseph Rabinoff and David Zureick-Brown, Diophantine and tropical geometry, and uniformity of rational points on curves](https://arxiv.org/pdf/1606.09618v2), §4.2 and §4.3, pp. 28–34. Distinguishes local logarithmic integrals, paths and analytic periods. [Eric Katz, Joseph Rabinoff and David Zureick-Brown, Uniform bounds for the number of rational points on curves of small Mordell–Weil rank](https://arxiv.org/pdf/1504.00694), §3.1–3.4, pp. 15–23. Local antiderivatives and group-cover comparison; the semistable residue gluing needs its own proof input.

Acceptance: A residue-zero differential has an analytic annular primitive; dT/T does not. A residue is a Cp scalar and an edge length is real: neither can replace the other in a period pairing.

### 7.7 BC–abelian tropical correction

Prove `TauCeti.Berkovich.TB7.bc_abelian_tropical_correction`. For an abelian variety A/ℂ_p with Raynaud cover E and torus cocharacter lattice N, let log_BC:E(ℂ_p)→Lie(A) be integration on its simply connected analytic cover and let log_Ab=log_A∘π be the imported analytic abelian logarithm. There is a unique ℚ-linear L:N_ℚ→Lie(A) with log_BC−log_Ab=L∘trop. For a path in A starting at 0 with lifted endpoint e, ∫_BC ω−∫_Ab ω=⟨L(trop e),ω⟩. For curve integrals compose with Abel–Jacobi. On an annulus the correction is a_ω(v_p(t(Q))−v_p(t(P))), linear in ω; on an open star of valence d, forms with zero correction have codimension at most d−1.

Assumptions and scope: Use v_p(p)=1 for N_ℚ and Cp scalar arithmetic; convert natural-log graph lengths by log p. The abelian logarithm on all Cp-points is the analytic extension, not just a union of finite-extension point sets.

Proof route. The two logarithms agree on the good-reduction domain A₀: the analytic group logarithm is uniquely characterized by its identity tangent map and agrees with local formal integration. Their difference therefore factors through E(Cp)/A₀(Cp)=N_ℚ. Restriction to the period lattice determines L since the real full lattice has ℚ-span N_ℚ. Tropical Abel–Jacobi balancing bounds the span of a d-star by d−1; an edge is one-dimensional, giving the annular coefficient.

*Needs:* `TB.7/analytic-jacobian-periods` (Analytic Jacobian periods); `TB.7/berkovich-coleman-path-integral` (Berkovich–Coleman path integration); `EffectiveDiophantineMethods:ED.4/abelian-logarithm`; `EffectiveDiophantineMethods:ED.4/abelian-integral`.

Sources: [Eric Katz, Joseph Rabinoff and David Zureick-Brown, Uniform bounds for the number of rational points on curves of small Mordell–Weil rank](https://arxiv.org/pdf/1504.00694), Proposition 3.16, formula (3.17), Corollary 3.18, pp. 22–23; Propositions 3.28–3.29, pp. 26–27. Factorization proof, good-reduction agreement and annular/star consequences.

Acceptance: Good reduction has N=0, so BC and abelian integrals agree. For E_q and dz/z, ∫_Ab=Log(z_Q/z_P)−(Log q/v_p(q))(v_p(z_Q)−v_p(z_P)), independent of changing lifts by q-powers. On a valence-two annular star at most one linear condition makes the two integrals agree.

## Worked examples

### Product rings and the general Banach category

For ℝ×ℝ with its maximum norm, the two coordinate absolute values are distinct points. Its ambient norm is not multiplicative: (1,0) and (0,1) both have norm one and their product is zero. There are exactly four idempotents, corresponding to all subsets of the two-point spectrum. In contrast, a normed field has only its specified norm point, by applying domination to both a and a⁻¹. The spectrum of the zero ring is empty. These cases test the carrier before any curve geometry is introduced (Temkin §2.2.3, pp. 7–8; Scholze Theorems 2.14, 2.18, pp. 10–12).

The pushout ℂ⊗̂_ℝℂ has two complex factors, hence two spectral points mapping to the single pair in M(ℂ)×_{M(ℝ)}M(ℂ). The spectral pushout map is surjective; it is not generally injective. This is why the category uses the projective ℓ¹ seminorm and why the target theorem is a surjection (Scholze Propositions 2.4 and 3.2, pp. 8, 14–15).

### Annuli, thickness and curvature signs

On r<|T|<1, s=−log|T| runs through (0,−log r). For f=Tⁿ the tropical coordinate is ns and its expansion is |n|; adjoining T to a T² coordinate gives slope vector (2,1), whose gcd is one. A formal node uv=π³ has total length 3v(π). Resolving it into three thickness-one nodes subdivides that interval without changing its length (BPR structure Proposition 4.3 and §5.3, pp. 11, 18; BPR tropicalization equation (5.6.1), p. 20).

For f(s)=s on [0,L], divPL(f)=δ₀−δ_L and Δf=δ_L−δ₀. A metric multiplied by exp(−f) therefore changes curvature by δ₀−δ_L. For f(s)=s²/2 the interior contribution to Δ is −ds and the endpoint derivative atoms restore mass zero. These computations fix the sign before the model intersection and Green-function identities are used. If s=c·t and F(s)=c·f(s/c), then dF/ds=df/dt and the Laplacian measures agree by coordinate pushforward. Curvature masses therefore acquire no extra c factor when passing from unit-edge to natural-log lengths; local heights still scale with log absolute values (Yuan Appendix A.5, pp. 115–118).

### Vertex genus and rank

A good-reduction genus-g curve has a one-point skeleton carrying vertex genus g; a split Tate curve has a circle with all vertex genera zero. The first graph has b₁=0 and the second b₁=1, while both satisfy g(X)=b₁+Σg(v) with their correct genera. The bare graph of a good-reduction curve cannot remember its algebraic linear-series rank; its residue curve in the metrized complex supplies that information (Poineau–Turchetti Definition II.2.22 and Theorem II.2.23, pp. 42–43; Amini–Baker §§1–3, pp. 1–14).

On a tree every divisor of nonnegative degree d has graph rank d. On a circle, a degree-one divisor has rank zero, while a divisor of positive degree d has rank d−1. The circle Jacobian is ℝ/Lℤ. A bridge attached to the circle is contracted by Abel–Jacobi, so that map does not itself give a faithful tropicalization of every graph (Gathmann–Kerber Theorem 1.2, p. 3; Baker–Faber Theorem 4.1, p. 17).

### Multiplicity and inseparable degree

The double equation (χᵘ−1)² has the same tropical support as χᵘ−1 and twice its scheme-theoretic weight. The support alone is insufficient. For z↦zⁿ on G_m, the tropical lattice map is multiplication by n; pushforward has index [ℤ:nℤ]=|n|. In characteristic p this includes n=p: the algebraic map is inseparable but its degree is still p, and the tropical pushforward retains it (Gubler §§13.5–13.17, pp. 43–46, with the corrected index in §13.16).

### Admissible measures and the Tate calibration

For a metric tree with two vertices of genus one, total genus is two and μ_a=(δ_v+δ_w)/2; its bridge has no continuous admissible mass. For three parallel edges of length one between two genus-zero vertices, total genus is two. Deleting one edge leaves resistance 1/2, so each edge has density 1/(2(1+1/2))=1/3 and total mass is one. A loop has deleted-edge resistance zero; a bridge has infinite deleted-edge resistance. These tests distinguish the arbitrary-length resistance formula from an unweighted graph count (Yuan Appendix A.5 and Proposition A.5, pp. 115–118; the arbitrary-length proof input is stated below).

For the Tate curve put L=−log|q|. The canonical degree-one measure is ds/L on its circle. The periodic function g(s)=s²/(2L)−s/2+L/12 has mean zero and Δg=δ₀−ds/L: its derivative jumps by −1 at the basepoint. Thus ddc g=ds/L−δ₀, the correction from the one-vertex model measure to the canonical measure. For points represented by z_P,z_Q the abelian integral of dz/z is Log(z_Q/z_P)−(Log q/v_p(q))(v_p(z_Q)−v_p(z_P)). Replacing z_Q by qz_Q leaves it unchanged. Changing the Log branch also cancels between the two terms (Chambert–Loir §5, pp. 17–18; KRZB Proposition 3.16, pp. 21–23 and annular comparison pp. 26–27).

### Hsia self-energy and hybrid normalization

For distinct nonclassical tree points x,y let ρ=δ_x−δ_y. The finite Hsia self-energy is E(ρ)=d(x,y)>0. Bilinearity gives E(ρ,−ρ)=−d(x,y), so arbitrary cross-energy is not nonnegative. Nonclassical diagonal contributions are necessary in this computation. The correct comparison of equal-mass measures uses the self-energy of their difference (Favre–Rivera-Letelier §4, pp. 22–27; DKY printed §2.7, p. 961, with the correction recorded below).

For a hybrid family and fixed 0<r<1, the ordinary complex parameter t has rescaled absolute value |t|^{log r/log|t|}=r. At the central fiber the formal parameter has exactly that nonarchimedean absolute value. A constant projective-line family has central fiber the Berkovich projective line over ℂ((t)), and does not have the complex sphere as its central fiber. Continuity of these evaluations is the topological contract; dynamical potential convergence needs the separate ArithmeticDynamics theorem (Boucksom–Jonsson Proposition 4.12, pp. 25–26).

## Proof inputs required for closure

All eight layers have their target-level definitions and key theorems specified. The following proof leaves prevent a claim of mathematical closure. They are not assumptions hidden inside definitions. Each names the source and the precise missing argument; stage contracts above are separate supplier obligations.

### Nonstrict Tate descent

The strict finite-module Čech theorem is an exact external import. Supply faithful strictifying scalar extension and descent for arbitrary positive radii, including a trivially valued base. Temkin §§3.3.1–3.3.3, pp. 16–18 state the result; the strictification descent proof has not been verified.

Used by `TB.0/analytic-sheaf` (Affinoid structure sheaf and acyclicity).

### Global analytic comparison proof

Zavyalov Appendix A, pp. 84–86 gives the exact equivalence and directions. Remark A.6, p. 84 cites Huber (1996) Proposition 8.3.1, Remark 8.3.2 and Lemma 5.6.8(i), and Huber (1994) Proposition 4.5(iv). Huber Theorem 8.3.5 concerns the later sheaf comparison, not this analytic-space equivalence. The full gluing, tautness and morphism-comparison proofs in those references have not been followed. The properness comparison in analytification also uses this proof input.

Used by `TB.0/global-adic-comparison` (Strict Berkovich–adic equivalence), `TB.0/analytification` (Berkovich analytification), `TB.0/real-quotient` (Real quotient of analytic preadic spaces), `TB.0/connected-analytification` (Connected algebraic curves remain connected).

### Rank-one semistable-reduction proof

BL85 Theorem 7.1 is the explicitly owned theorem, not a request that SF.4 or StableReduction already supplies it. Its application was checked in BPR Theorem 4.22, pp. 16–17, and Poineau–Turchetti II.2.20, pp. 42–43. The original nonnoetherian proof and finite-extension descent for a nonclosed base have not been read in full; do not mark this theorem closed from the DVR reduction theorem.

Used by `TB.2/rank-one-semistable-reduction` (Rank-one semistable reduction).

### Vertex continuity of the homotopy

Give the full star-neighborhood proof at vertices with infinitely many residue-ball directions, using finite annular cuts and local analytic connectedness; BPR Lemma 3.8, p. 9 leaves continuity as an exercise. Annular formulas alone are not a proof of the global retraction or strong homotopy.

Used by `TB.2/continuous-retraction` (Continuity of skeletal retraction), `TB.2/skeletal-strong-deformation` (Strong deformation onto a skeleton), `TB.2/marked-extended-skeleton` (Marked skeleta and puncture rays).

### Locally finite model correspondence

CDN Appendix A.2, pp. 51–52 gives component points of a normal flat model and the criterion for extending automorphisms that preserve them; it does not state a general triangulation/formal-model equivalence. Supply the converse reconstruction, locally finite gluing and nonsplit constant-field/node invariants from the cited Ducros theory. Semistability is required before calling the component-point set a triangulation; compact finite skeleton arguments do not prove this extension.

Used by `TB.2/noncompact-triangulations` (Locally finite triangulations and analytic nodes), `TB.2/triangulated-formal-automorphisms` (Triangulated curves and formal automorphisms), `TB.1/virtual-annuli-descent` (Virtual annuli and metric descent).

### Finite graph rank and Riemann–Roch

Gathmann–Kerber Theorem 2.1, pp. 8–9 invokes the finite graph Baker–Norine rank theorem. Read its reduced-divisor/break-divisor proof and show its discrete-to-metric rank comparison under subdivision. The rational approximation step for arbitrary real lengths is specified, not a replacement for that theorem.

Used by `TB.3/graph-riemann-roch` (Riemann–Roch for metric graphs).

### Finite-model Jacobian exactness

Baker–Faber §3, pp. 15–16 proves the direct-limit Picard identification from finite-model exact sequences in §2. Verify those sequences and compatibility of harmonic forms under subdivision before closing the Picard/Jacobian equivalence.

Used by `TB.3/graph-jacobian` (Metric Jacobian and Abel–Jacobi map).

### Reduced divisors on metrized complexes

Amini–Baker §§2–3 and Appendix A, pp. 6–14, 40–43 require reduced-divisor existence and uniqueness, the rank formula, and continuity of the reduced-divisor map. Their statements and Appendix A proof route were read, but the full reduced-divisor proof has not been verified. Finite rank testing uses any g_v+1 points on each residue curve of a loopless model.

Used by `TB.3/metrized-complex-riemann-roch` (Riemann–Roch and rank determination on complexes), `TB.3/metrized-complex-rank-determining` (Finite rank-determining sets), `TB.3/specialization-rank-inequality` (Specialization inequality).

### Valued Gröbner and polyhedral theorem

Gubler Theorem 10.14, p. 32 and Theorem 3.3, p. 7 state finite rational polyhedrality and purity over arbitrary real value groups. Read the cited valued Gröbner/Bieri–Groves proof, including tilted-algebra descent where K° is nonnoetherian; a DVR Gröbner argument is insufficient.

Used by `TB.4/initial-degenerations` (Initial degenerations over valued fields), `TB.4/fundamental-polyhedral-theorem` (Fundamental theorem and polyhedrality).

### General-valued balancing and pushforward

Sturmfels–Tevelev §3, pp. 7–8 gives the trivial-valuation balancing proof via tropical compactification. Complete the arbitrary-valued reduction-to-local-stars argument and the flat-cycle intersection comparison; Gubler §§13.13–13.17, pp. 45–46 and BPR §7, Theorem 7.1 and Corollary 7.3, pp. 34–35 supply the general pushforward statement, whose whole proof was not read. Use the corrected target/image lattice index.

Used by `TB.4/weighted-tropical-cycles` (Tropical weights and balancing), `TB.4/cycle-pushforward` (Sturmfels–Tevelev pushforward).

### General rank-one model intersections

Chambert–Loir §2, pp. 4–8 supplies the model-measure construction in its stated model range. Extend independence and the projection formula to the requested possibly nonnoetherian models using the requested SF.5 intersection extension. Also supply Radon weak-limit existence without the countable-density hypothesis; the present weak-limit theorem retains it explicitly.

Used by `TB.6/model-measures` (Chambert–Loir model measures), `TB.6/measure-limits-and-local-heights` (Limits and local intersection heights).

### Admissible Green kernel with arbitrary edge lengths

Yuan A.5, pp. 115–118 is unit-edge normalized. Derive the arbitrary-length resistance formula and probability mass from Kirchhoff theory, and construct the normalized Green kernel with this Laplacian sign. Verify PL approximation with weak Laplacian convergence and controlled variation for the C² curvature identity.

Used by `TB.6/graph-green-and-admissible-measure` (Admissible Green functions and measures), `TB.6/model-metric-laplacian` (Metric–Laplacian and admissible corrections), `TB.6/model-pl-approximation` (Model potentials and Laplacian approximation).

### Potential theory beyond the cited Cp range

The corrected self-energy positivity is verified in the Cp tree convention of Favre–Rivera-Letelier §4, pp. 22–27. Extending this Radon/continuous-potential argument to every complete algebraically closed rank-one field requires a source/proof check; no arbitrary cross-energy positivity is asserted.

Used by `TB.6/hsia-potentials-and-energy` (Hsia kernels and positive energy).

### Schottky figures and the converse embedding

Poineau–Turchetti II.3 supplies the Schottky figure theorem; II.4, pp. 58–60 constructs compatible Runge embeddings in the converse. The quotient proof and converse endpoints were read, but those two proof inputs need a complete check. The split Mumford condition remains mandatory over K.

Used by `TB.7/schottky-data` (Schottky groups and fundamental domains), `TB.7/mumford-uniformization` (Schottky–Mumford uniformization).

### Uniformization and monodromy pairing proof

The exact Raynaud cross is requested from R11.3; Baker–Rabinoff §§6–7, pp. 16–17 identifies the edge and analytic monodromy pairings through the cited Bosch–Lütkebohmert theorem. Its full analytic pairing proof was not checked; a point-level Tate parametrization does not prove it.

Used by `TB.7/analytic-jacobian-periods` (Analytic Jacobian periods).

### Global Berkovich–Coleman integration

KRZB §4.2, pp. 28–31 gives the path-integral axioms and uniqueness, citing Berkovich for existence on general smooth analytic curves and groups. The local Coleman primitives and good-reduction Frobenius characterization do not supply global path integration. Read an accessible proof; the uncleared Baker–Rumely book was not used.

Used by `TB.7/berkovich-coleman-path-integral` (Berkovich–Coleman path integration), `TB.7/bc-abelian-tropical-correction` (BC–abelian tropical correction).

### Semistable residues and periods

Prove that oriented annular residues of a global regular differential form a harmonic graph cochain, and identify the global BC period map and the Raynaud valuation factor. Local residue/branch-change nodes are exact imports but do not prove this global residue/monodromy comparison.

Used by `TB.7/annular-residues-and-periods` (Annular integration and residue monodromy), `TB.7/bc-abelian-tropical-correction` (BC–abelian tropical correction).

### Idempotent descent through Laurent covers

Scholze Theorem 2.18, pp. 11–12 reduces the general Banach-ring clopen theorem to Newton lifting and an overconvergent Laurent equalizer, using KL Corollary 2.8.9. Check that equalizer and its closed-ideal argument; a sheaf on the ordinary topology of M(A) is not available for arbitrary Banach rings.

Used by `TB.0/idempotents-and-clopens` (Idempotents and clopen subsets).

### Analytification over the hybrid Banach base

The nonarchimedean analytic-space atlas in TB.0 does not construct analytification over the mixed archimedean/nonarchimedean ring A_r. Boucksom–Jonsson Appendix A gives this Banach-ring scheme analytification, and §§4.3–4.6 give the SNC inverse-limit comparison. The complete Appendix A construction and SNC retraction/inverse-limit proof must be checked before closing the hybrid-space target.

Used by `TB.0/hybrid-analytic-space` (Hybrid analytic spaces).

### Nonnoetherian component contractions

Verify the genus-zero formal contractions in BL85 Lemma 6.1, as used by BPR Proposition 4.21, p. 16. The rational tail/bridge proof must retain puncture exclusions and add edge thicknesses. The current native StableReduction theorem is restricted to a DVR.

Used by `TB.2/genus-zero-contractions` (Contractions of genus-zero vertices), `TB.2/intrinsic-minimal-skeleton` (Intrinsic minimal skeleton), `TB.2/stable-vertex-characterization` (Stable vertices of a hyperbolic curve), `TB.2/unique-stable-vertex-set` (Uniqueness of stable vertices).

### Finite-map reduction multiplicities

BPR Proposition 5.4, Theorem 5.8 and Corollary 5.9, pp. 21–23 relate canonical-reduction degrees, initial lengths and annular expansion. Read the full finite-map multiplicity proof and its base-change reduction, including inseparable residue degrees; it is not a consequence of the gcd definition alone.

Used by `TB.4/relative-tropical-multiplicity` (Relative point and edge multiplicities), `TB.4/tropical-multiplicity-formula` (Tropical multiplicity formula for curves), `TB.5/multiplicity-one-isometry` (Multiplicity-one isometry criterion).

### Formal lifting and Runge approximation

BPR Lemmas 5.18–5.19 and Theorem 5.20, pp. 25–26 use BL85 Corollary 3.8 to lift compatible rational residue functions, FM86 Théorème 4 §2.4 for annular coordinate approximation, and FM86 Théorème 1 §1.4 for rational sublevel descriptions of edge affinoids. These three exact analytic lifting/approximation results are not supplied by algebraic Riemann–Roch; their complete proofs must be read.

Used by `TB.5/unit-slope-separating-functions` (Functions separating edges and vertices), `TB.5/faithful-tropicalization-and-expansion-factors` (Faithful tropicalization of a finite subgraph), `TB.5/faithful-domination` (Faithfulness under domination), `TB.5/puncture-ray-faithfulness` (Faithful tropicalization of marked rays).

## Source corrections

All thirteen findings were independently checked in REV-TropicalAndBerkovichArithmetic on 2026-10-18 and confirmed. Findings E10–E13 were added by this review. Every finding below is scoped to its identified text; an inaccessible published version is not treated as collated.


### E1: Definition/Exercise 2.1.1.1(iv), preprint p. 4 only

Source: `temkin-2011`. The source makes equivalence of two seminorms equivalent to equality of the topologies they induce.

Correction. Two-sided constant bounds imply equal topologies; the converse is false for general seminormed abelian groups.

Reason. On the additive real group, |x| and √|x| are norms with the same topology. At x=n² their ratio is n, and near zero the reverse ratio is unbounded. No global equivalence constant exists.

Reach: a stated result. Known correction: new. Independent verdict: **confirmed**.

Existing-correction search: arXiv:1010.2235 submission history: v2 remains the listed version. Author-hosted PDF; author papers-page URLs unavailable. Springer chapter landing page and PDF request (returned HTML). Searches for Temkin introduction Berkovich errata: no relevant correction located. Independent review 2026-10-18: the cited text and counterexample were read and checked again; source/version scope retained. Independent review opened https://math.huji.ac.il/~temkin/papers/Selected_Publications.html and searched the title with errata; no relevant correction located. This supplements the earlier unavailable-page report.


### E2: Definition 2.2.3.1, preprint p. 7 only

Source: `temkin-2011`. The source takes f ∈ A.

Correction. Use f ∈ C in the topology of MSpec(C).

Reason. For C=K[T], evaluation points at T=0 and T=1 agree on A=K and differ at T. Base-ring coordinates alone cannot separate these points.

Reach: a stated result. Known correction: new. Independent verdict: **confirmed**.

Existing-correction search: arXiv:1010.2235 submission history: v2 remains the listed version. Author-hosted PDF; author papers-page URLs unavailable. Springer chapter landing page and PDF request (returned HTML). Searches for Temkin introduction Berkovich errata: no relevant correction located. Independent review 2026-10-18: the cited text and counterexample were read and checked again; source/version scope retained. Independent review opened https://math.huji.ac.il/~temkin/papers/Selected_Publications.html and searched the title with errata; no relevant correction located. This supplements the earlier unavailable-page report.


### E3: Proof of Lemma 3.2, printed p. 102 (physical 10); also arXiv p. 8

Source: `bpr-structure-published`. The argument takes r sufficiently near 1.

Correction. The logarithmic radius tends to 0, and the scalar function |f(φ(z))| on the annular skeleton must lie in (c1,c2).

Reason. The preceding limit is r→0. The map φ has values on the curve, not in a real interval; r1,r2 are not the endpoints of the continuity test. These substitutions repair the intended collar argument.

Reach: the proof. Known correction: new. Independent verdict: **confirmed**.

Existing-correction search: arXiv:1404.0279v1 and published author offprint collated. Rabinoff research/publications page and Payne published offprint. Searches for the paper title with errata: no relevant correction located. Independent review 2026-10-18: the cited text and counterexample were read and checked again; source/version scope retained.


### E4: Proof of Lemma 3.4(4), printed pp. 102–103; also arXiv p. 8

Source: `bpr-structure-published`. The source allows every neighborhood that is connected.

Correction. Qualify the connected neighborhood as disjoint from V.

Reason. A connected subset of the complement of V lies in one component; an arbitrary connected neighborhood need not. The candidate affinoid neighborhood already has the required disjointness, so the theorem is unchanged.

Reach: the proof. Known correction: new. Independent verdict: **confirmed**.

Existing-correction search: arXiv:1404.0279v1 and published author offprint collated. Rabinoff research/publications page and Payne published offprint. Searches for the paper title with errata: no relevant correction located. Independent review 2026-10-18: the cited text and counterexample were read and checked again; source/version scope retained.


### E5: §5.3 opening, printed p. 115 (physical 23); also arXiv p. 18

Source: `bpr-structure-published`. The proof places each old skeletal edge inside a single edge after refining the vertex set.

Correction. The old edge becomes a union of subdivided edges with its length preserved. Use Proposition 3.13(1)–(2), not containment of the old edge in one refined edge.

Reason. Insert a type-2 point in the interior of an old edge, as Proposition 3.13(2) permits. The two new edges each omit part of the old one. The global metric compatibility result requires the subdivision formulation.

Reach: the proof. Known correction: new. Independent verdict: **confirmed**.

Existing-correction search: arXiv:1404.0279v1 and published author offprint collated. Rabinoff research/publications page and Payne published offprint. Searches for the paper title with errata: no relevant correction located. Independent review 2026-10-18: the cited text and counterexample were read and checked again; source/version scope retained.


### E6: §2.7, printed p. 961, Annals 191 (2020); also arXiv:1901.09945v2 §2.7, p. 12

Source: `dky-published-2020`. The bilinear cross-energy of two arbitrary signed mass-zero continuous-potential measures is declared nonnegative, with equality characterized by their equality.

Correction. Nonnegative definiteness applies to E(ρ,ρ), with equality iff ρ=0; for two equal-mass measures use E(ν₁−ν₂,ν₁−ν₂), with equality iff ν₁=ν₂. The subsequent local pairing already uses this difference self-energy.

Reason. Take distinct nonclassical tree points x,y and ρ=δ_x−δ_y. Their continuous tree potentials have E(ρ,ρ)=d(x,y)>0. Thus E(ρ,−ρ)<0; taking both arguments equal to ρ also disproves the printed equality criterion.

Reach: a stated result. Known correction: new. Independent verdict: **confirmed**.

Existing-correction search: Annals article/DOI listing and publisher PDF checked 2026-10-18; the assertion persists in the version of record. Author pages and searches for a correction to the DKY potential-theory energy assertion checked 2026-10-18; no correction identified. Compared arXiv:1901.09945v2 §2.7 with printed p. 961; this finding concerns the local preliminary assertion, not the main theorem. Independent review 2026-10-18: the cited text and counterexample were read and checked again; source/version scope retained.


### E7: arXiv:1504.00694 PDF, Proposition 3.28 proof, p. 26, last dimension estimate

Source: `krzb-primary-2015`. The final proof sentence gives an upper bound on the dimension of the agreement subspace, whereas the proposition states the same bound on its codimension.

Correction. Replace the final dimension estimate by codimension ≤deg(ζ)−1; the proposition statement is unchanged.

Reason. Agreement is the kernel of a linear map into the space of harmonic functions on a star modulo constants, whose dimension is deg(ζ)−1. Rank bounds the kernel codimension, not its dimension.

Reach: the proof. Known correction: new. Independent verdict: **confirmed**.

Existing-correction search: The current arXiv PDF, Proposition 3.28 and proof, checked 2026-10-18. Rabinoff and Zureick-Brown publication pages and erratum searches checked 2026-10-18; no correction identified. The author-linked Duke offprint returned HTTP 404, and the Project Euclid PDF was blocked by its browser challenge. The published proof was not collated; finding scoped to the preprint. Independent review 2026-10-18: the cited text and counterexample were read and checked again; source/version scope retained.


### E8: Author-hosted arXiv:1108.6126v2, §13.16, p. 46, tropical-cycle pushforward multiplicity

Source: `gubler-2012`. The displayed lattice factor places the source lattice first and the target lattice second, without applying the lattice map.

Correction. For a source cell σ mapping with full dimension to τ, use [N′_τ:A(N_σ)].

Reason. For z↦z² on the one-dimensional torus the source lattice maps to 2ℤ⊂ℤ, so the weight must be [ℤ:2ℤ]=2. Reversing the index is undefined as a subgroup index and would give the wrong degree.

Reach: nothing. Known correction: new. Independent verdict: **confirmed**.

Existing-correction search: Author-hosted guide PDF and author publication page checked 2026-10-18; no separate correction identified. The guide is published in Contemporary Mathematics 589 (2013), 125–189; no publisher full text was obtained in this run. This finding is scoped only to the author-hosted v2 formula. Compared with Sturmfels–Tevelev Theorem 1.1, formula (1.2), pp. 1–2 and Theorem 3.12, pp. 9–10, and BPR Corollary 7.3, pp. 34–35, which use the target/image index. Independent review 2026-10-18: the cited text and counterexample were read and checked again; source/version scope retained.


### E9: arXiv:1301.0792v5, Remark 2.3.9, second bullet, p. 35

Source: `kedlaya-liu-2015`. The characteristic-p assertion makes the existence of a uniform unit sufficient for a bounded analytic-field scalar structure, without norm uniformity.

Correction. Retain the forward implication. For the converse require norm control on all integral powers of the uniform unit, for example that A is uniform as a Banach ring.

Reason. On F_p((z)), choose 0<r<1 and the weighted norm max_i rⁱ(1+|i|). The weights are submultiplicative and this complete norm gives z spectral values r and r⁻¹, hence a uniform unit. Any bounded analytic-field scalar map would send a small nonzero scalar t to an element of positive z-valuation k. Its positive and negative nth powers have norms at least r^(±nk)(1+nk). Multiplying the proposed bounded estimates forces (1+nk)²≤C² for every n, a contradiction.

Reach: a stated result. Known correction: Already recorded as PAPER-KEDLAYA-LIU-15/E101 and independently confirmed by REV-PAPER-KEDLAYA-LIU-15; this packet imports the correction. Independent verdict: **confirmed**.

Existing-correction search: Read the supplied v5 p. 35 again in this run and checked the weighted-norm argument. The existing paper extraction records searches of the authors’ Part II Appendix A errata, author papers page, arXiv history and atlas errata register. Its independent review confirms that the correction to 2.8.1 does not correct this remark. Those searches are inherited provenance, not a claim of fresh published-version collation. The existing extraction did not obtain the published Astérisque text; this imported finding remains scoped to arXiv v5. Independent review 2026-10-18: the cited text and counterexample were read and checked again; source/version scope retained. Fresh independent check: https://kskedlaya.org/papers/ and arXiv:1602.06899v3 Appendix A, pp. 189–191; corrections to 2.4.11 and 2.8.1 were read, with no correction to 2.3.9 found.


### E10: Proposition A.4 proof, published JEP 4 (2017), p. 136; also arXiv:1605.05277 p. 45

Source: `boucksom-jonsson-published-2017`. The norm of the central-fiber Laurent-series point is expressed as r^(−ord₀(f)).

Correction. Use r^(ord₀(f)), as in the norm of Appendix A.5–A.6.

Reason. For f=t, the exponent ord₀(t)=1. Since 0<r<1 and ||t||=r, the printed r⁻¹ is greater than the ambient norm and cannot define a point of M(A_r). The corrected value is r.

Reach: the proof. Known correction: new. Independent verdict: **confirmed**.

Existing-correction search: Numdam version of record https://www.numdam.org/item/10.5802/jep.39.pdf collated at p. 136 with the preprint p. 45 on 2026-10-18; the sign persists. Numdam article listing and Boucksom publications page https://sebastien.boucksom.perso.math.cnrs.fr/publis.html, plus title/erratum search, checked 2026-10-18; no correction found.


### E11: Author preprint dated 18 October 2020, Example I.2.20, p. 11 only

Source: `poineau-2020`. In the Hahn-series description of C((t^Q)), coefficients a_q are required to be rational numbers.

Correction. The exponents q are rational; coefficients a_q belong to C.

Reason. A spherical completion of the chosen completed algebraic closure of C((t)) must contain its constant i. Rational-coefficient Hahn series cannot contain i as a constant, whereas complex-coefficient series do.

Reach: nothing. Known correction: new. Independent verdict: **confirmed**.

Existing-correction search: Author PDF and arXiv:2010.09043 history checked 2026-10-18; only this preprint was collated. Poineau/Turchetti author research pages and title/errata search checked 2026-10-18; no relevant correction found. The Springer chapter was not read; this finding makes no assertion about its text.


### E12: Author preprint dated 18 October 2020, Proposition I.4.14, p. 19 only, reversing-annulus case and bound variables

Source: `poineau-2020`. For i₀=−1 the image radii and Gauss-point image use |a₁|. The dominance and point-image formulas also quantify t while using s as a free radial variable.

Correction. Use |a₋₁| in the reversing case: r₂=|a₋₁|/s₁, s₂=|a₋₁|/r₁ and η_t↦η_(|a₋₁|/t). Use t consistently in the quantified dominance inequality and both point-image formulas.

Reason. For ϕ(T)=a/T, a≠0, the only nonzero coefficient is a₋₁=a. The printed |a₁| is zero and collapses both positive target radii to zero. The corrected map reverses radii and preserves log modulus.

Reach: a stated result. Known correction: new. Independent verdict: **confirmed**.

Existing-correction search: Author PDF p. 19 read and formula visually checked 2026-10-18; arXiv:2010.09043 history and author research pages checked. Title/proposition errata searches found no correction. The Springer chapter was not read; the finding concerns only the identified author preprint.


### E13: arXiv:math/0407471 PDF retrieved 2026-10-18, §4.2, pp. 24–25 only

Source: `favre-rivera-letelier-2004`. The interior edge density is −g″ while the vertex atoms are sums of positive outgoing derivatives.

Correction. With the outgoing-derivative atoms printed there, the interior density is +g″. This is the convention of the source equation (20); in this packet it is ddc=−Δ.

Reason. On a segment of length one take g(s)=s², extended constantly on complementary branches. The outgoing atoms have total −2. Interior density +2 ds restores the zero total mass required in §4.1; the printed −2 ds gives total mass −4. The preceding prose also describes the positive second derivative.

Reach: a stated result. Known correction: new. Independent verdict: **confirmed**.

Existing-correction search: Current arXiv text and author publications page checked 2026-10-18. Read the author-hosted 2007 corrigendum https://www.cmls.polytechnique.fr/perso/favre/corrigendum.pdf in full; it corrects quantitative bounds from Cauchy–Schwarz, not this §4.2 sign. Publisher PDF https://link.springer.com/content/pdf/10.1007/s00208-006-0751-x.pdf returned HTML, not the article, on 2026-10-18. Published formula not collated; finding scoped to the accessible preprint.

## References and versions

- **temkin-2011**: Michael Temkin, *Introduction to Berkovich analytic spaces*. Author-hosted arXiv:1010.2235v2, 16 December 2011; 52 pages. Not asserted to be the Springer chapter.. [Source](https://math.huji.ac.il/~temkin/papers/Introduction_to_Berkovich_Spaces.pdf). Access recorded 2026-09-27.
- **bpr-structure-2014**: Matthew Baker, Sam Payne, Joseph Rabinoff, *On the structure of nonarchimedean analytic curves*. arXiv:1404.0279v1 [math.AG], 1 April 2014 (published in Tropical and non-Archimedean geometry, Contemp. Math. 605 (2013); this is the paper cited as [BPR13] by the tropicalization paper). Not in the library catalogue. Extraction line numbers refer to a pdftotext -layout extraction of this PDF (1299 lines).. [Source](https://arxiv.org/abs/1404.0279). Access recorded in the inherited packet.
- **bpr-tropicalization-2016**: Matthew Baker, Sam Payne, Joseph Rabinoff, *Nonarchimedean geometry, tropicalization, and metrics on curves*. arXiv:1104.0320v3 [math.AG], 10 June 2015 (published in Algebraic Geometry 3 (2016) 63-105). The paper notes that its numbering differs from v2 and that the former Section 5 was extracted and published separately as [BPR13] (= the structure paper above). Not in the library catalogue. Extraction line numbers refer to a pdftotext -layout extraction (2144 lines).. [Source](https://arxiv.org/abs/1104.0320). Access recorded in the inherited packet.
- **bpr-structure-published**: Matthew Baker, Sam Payne, Joseph Rabinoff, *On the structure of non-archimedean analytic curves*. Published author offprint, Contemporary Mathematics 605 (2013), 93–121, DOI 10.1090/conm/605/12113; 29 physical pages.. [Source](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/StructureOfNonarchimedeanCurves.pdf?download=1). Access recorded 2026-09-27.
- **berkovich-1990**: Vladimir Berkovich, *Spectral Theory and Analytic Geometry over Non-Archimedean Fields*. AMS Mathematical Surveys and Monographs 33 (1990); maintainer-cleared library copy; printed page numbers. Read in the maintainer-cleared reference library. Access recorded 2026-10-18.
- **scholze-2026**: Peter Scholze, *Berkovich Motives*. Author-hosted 65-page PDF read 2026-10-18; §2 and Proposition 3.2. [Source](https://people.mpim-bonn.mpg.de/scholze/BerkovichMotives.pdf). Access recorded 2026-10-18.
- **poineau-2020**: Jérôme Poineau and Daniele Turchetti, *Berkovich curves and Schottky uniformization*. Author PDF dated 18 October 2020, arXiv:2010.09043; physical pages. [Source](https://poineau.users.lmno.cnrs.fr/Textes/SchottkyVIASM.pdf). Access recorded 2026-10-18.
- **gathmann-kerber-2007**: Andreas Gathmann and Michael Kerber, *A Riemann–Roch theorem in tropical geometry*. arXiv:math/0612129v2, 11 July 2007, 14 pages. [Source](https://arxiv.org/pdf/math/0612129v2). Access recorded 2026-10-18.
- **baker-2007**: Matthew Baker, *Specialization of linear systems from curves to graphs*. arXiv:math/0701075v4, 5 July 2007, 31 pages. [Source](https://arxiv.org/pdf/math/0701075v4). Access recorded 2026-10-18.
- **amini-baker-2013**: Omid Amini and Matthew Baker, *Linear series on metrized complexes of algebraic curves*. arXiv:1204.3508v3; PDF dated 6 April 2018, arXiv stamp 10 October 2013; 45 pages. [Source](https://arxiv.org/pdf/1204.3508v3). Access recorded 2026-10-18.
- **baker-faber-2009**: Matthew Baker and Xander Faber, *Metric properties of the tropical Abel–Jacobi map*. arXiv:0905.1679 PDF retrieved 2026-10-18; physical pages. [Source](https://arxiv.org/pdf/0905.1679). Access recorded 2026-10-18.
- **gubler-2012**: Walter Gubler, *A guide to tropicalizations*. Author-hosted arXiv:1108.6126v2; page numbers in the PDF. [Source](https://gubler.app.uni-regensburg.de/Publikationen/1108.6126.pdf). Access recorded 2026-10-18.
- **sturmfels-tevelev-2007**: Bernd Sturmfels and Jenia Tevelev, *Elimination theory for tropical varieties*. arXiv:0704.3471 PDF retrieved 2026-10-18; physical pages. [Source](https://arxiv.org/pdf/0704.3471). Access recorded 2026-10-18.
- **chambert-loir-2004**: Antoine Chambert-Loir, *Mesures et équidistribution sur les espaces de Berkovich*. arXiv:math/0304023v3, 12 November 2004, 21 pages. [Source](https://arxiv.org/pdf/math/0304023v3). Access recorded 2026-10-18.
- **favre-rivera-letelier-2004**: Charles Favre and Juan Rivera-Letelier, *Équidistribution quantitative des points de petite hauteur sur la droite projective*. arXiv:math/0407471 PDF retrieved 2026-10-18; physical pages. [Source](https://arxiv.org/pdf/math/0407471). Access recorded 2026-10-18.
- **yuan-2024**: Xinyi Yuan, *Arithmetic bigness and a uniform Bogomolov-type result*. Author PDF dated 21 August 2024, 126 pages; bibliography route PAPER-Yuan-2026. [Source](https://faculty.bicmr.pku.edu.cn/~yxy/preprints/bigness_and_bogomolov.pdf). Access recorded 2026-10-18.
- **zavyalov-2024**: Bogdan Zavyalov, *Mod-p Poincaré duality in p-adic analytic geometry*. arXiv:2111.01830v3, 21 February 2024. [Source](https://arxiv.org/pdf/2111.01830v3). Access recorded 2026-10-18.
- **kedlaya-liu-2015**: Kiran Kedlaya and Ruochuan Liu, *Relative p-adic Hodge theory: Foundations*. arXiv:1301.0792v5, maintainer-supplied paper copy; printed PDF pages. [Source](https://arxiv.org/abs/1301.0792). Access recorded 2026-10-18.
- **cdn-2020**: Pierre Colmez, Gabriel Dospinescu and Wiesława Nizioł, *Cohomologie des revêtements du demi-plan de Drinfeld*. arXiv:1704.08928v2, 56 pages. [Source](https://arxiv.org/pdf/1704.08928v2). Access recorded 2026-10-18.
- **dky-2020**: Laura DeMarco, Holly Krieger and Hexi Ye, *Uniform Manin–Mumford for a family of genus 2 curves*. arXiv:1901.09945v2; this is the preprint read, not a claim to have collated the Annals version. [Source](https://arxiv.org/pdf/1901.09945v2). Access recorded 2026-10-18.
- **boucksom-jonsson-2016**: Sébastien Boucksom and Mattias Jonsson, *Tropical and non-Archimedean limits of degenerating families of volume forms*. arXiv:1605.05277 PDF retrieved 2026-10-18; 48 pages. [Source](https://arxiv.org/pdf/1605.05277). Access recorded 2026-10-18.
- **krzb-2016**: Eric Katz, Joseph Rabinoff and David Zureick-Brown, *Diophantine and tropical geometry, and uniformity of rational points on curves*. arXiv:1606.09618v2, 49 pages. [Source](https://arxiv.org/pdf/1606.09618v2). Access recorded 2026-10-18.
- **krzb-primary-2015**: Eric Katz, Joseph Rabinoff and David Zureick-Brown, *Uniform bounds for the number of rational points on curves of small Mordell–Weil rank*. arXiv:1504.00694 PDF retrieved 2026-10-18; physical pages. [Source](https://arxiv.org/pdf/1504.00694). Access recorded 2026-10-18.
- **baker-rabinoff-2013**: Matthew Baker and Joseph Rabinoff, *The skeleton of the Jacobian, the Jacobian of the skeleton, and lifting meromorphic functions from tropical to algebraic curves*. arXiv:1308.3864 PDF retrieved 2026-10-18; physical pages. [Source](https://arxiv.org/pdf/1308.3864). Access recorded 2026-10-18.
- **dky-published-2020**: Laura DeMarco, Holly Krieger and Hexi Ye, *Uniform Manin–Mumford for a family of genus 2 curves*. Annals of Mathematics 191 (2020), 949–1001; version of record. [Source](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n3-p05-s.pdf). Access recorded 2026-10-18.

The packet records content hashes, exact read ranges and the separate source-version ledger. The Berkovich 1990 book was read in place; its source text is not reproduced. The Baker–Rumely book was not used. Its relevant line-potential claims are supported here by freely accessible Favre–Rivera-Letelier and DKY sources. Missing original proof inputs are listed explicitly above.

- **boucksom-jonsson-published-2017**: Sébastien Boucksom and Mattias Jonsson, *Tropical and non-Archimedean limits of degenerating families of volume forms*. JEP 4 (2017), 87–139; version of record; Appendix A.4–A.6, pp. 136–137 collated for E10. [Source](https://www.numdam.org/item/10.5802/jep.39.pdf). Read 2026-10-18.

- **favre-rivera-letelier-corrigendum-2007**: Charles Favre and Juan Rivera-Letelier, *Corrigendum to Équidistribution quantitative des points de petite hauteur sur la droite projective*. Author-hosted corrigendum, 3 pages; read in full; quantitative error bounds are corrected, not the §4.2 Laplacian sign. [Source](https://www.cmls.polytechnique.fr/perso/favre/corrigendum.pdf). Read 2026-10-18.

- **kedlaya-liu-ii-errata**: Kiran Kedlaya and Ruochuan Liu, *Relative p-adic Hodge theory, II: Imperfect period rings*. arXiv:1602.06899v3, Appendix A, pp. 189–191; errata to Part I checked for E9. [Source](https://arxiv.org/pdf/1602.06899v3). Read 2026-10-18.

The independent review ledger is [REV-TropicalAndBerkovichArithmetic](../reviews/REV-TropicalAndBerkovichArithmetic.md). The packet retains all 22 explicit proof gaps and the precise supplier requests; no stage is claimed closed.
