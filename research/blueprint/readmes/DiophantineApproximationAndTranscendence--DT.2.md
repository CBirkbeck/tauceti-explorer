# Diophantine approximation and transcendence — DT.2 proof inputs

This part supplies the missing mathematics behind the existing Subspace Theorem,
unit-equation, norm-form and recurrence targets. It extends the
[parent plan](../packets/DiophantineApproximationAndTranscendence.json), whose
100 DT.2 targets retain their ids, definitions and application statements. The
[part packet](../packets/DiophantineApproximationAndTranscendence--DT.2.json)
adds 68 distinct inputs; the assembly must attach them to the relevant parent
proofs and API items. Smaller calculations stay in the proof outlines. This is
a complete planning pass with DT.2 **planned**, with five explicit mathematical
gaps and five supplier requests. It is not a claim of formalisation or closure.

The route through the quantitative theorem passes from absolute successive
infima to controlled compound bases, an auxiliary polynomial and a nonzero
jet whose height contradicts the product formula. The remaining absolute-basis
and arithmetic-intersection gaps affect that route. The unit-equation route
adds logarithmic cone covers, a public small-point argument and rank-exact
induction. It uses Amoroso–Viada's stronger perturbation theorem to repair the
numerical step in the read ESS version. Ordinary-unit stabilizers then give the
norm-form criterion. Polynomial factors and residue classes are retained in
the recurrence route, which also covers repeated roots.

## Conventions and ownership

A number field K is embedded in a fixed algebraic closure of ℚ; d=[K:ℚ].
Normalized local factors have product 1 on K*. At infinity they have weights
[K_v:ℝ]/d; finite factors use the inverse residue norm, raised to 1/d.
For an extension E/K the factor over w|v is raised by
d(w|v)=[E_w:K_v]/[E:K], and these exponents sum to 1 over v.
H is projective sup height, H₂ uses Euclidean norms at infinity, and h=log H.
For a torus point h(x) means h(1:x₁:⋯:x_n). The native Mathlib number-field
height has total weight d, so its logarithm is divided by d before using these
absolute estimates. Coefficient, subspace and cycle heights are kept distinct.

The semistable twisted system used below has n≥2, finitely supported weights
with Σ_i c_iv=0 and Σ_v max_i c_iv≤1, independent forms at each place and
at most R distinct forms, R≥n. At the distinguished finite place v₀ the weights
are zero and the forms are the coordinate forms. Every proper subspace has
weight≤0. When the general system is used instead, its exceptional subspace
and normalized determinant Δ are retained. λ_i(Q) are absolute infima over
algebraic points; they need not be attained in a specified field. H_L denotes
the parent's determinant height of the form family. All dimensional and degree
parameters in denominators are positive unless their zero case is explicitly
separated.

A finite-rank multiplicative group means finite ℚ-dimension after tensoring
the additive version with ℚ. It need not be finitely generated. An affine
solution is nondegenerate when no nonempty subsum of its left side is zero;
a homogeneous relation is nondegenerate when no nonempty proper subsum is
zero. Nonzero roots are required in two-sided recurrences. An arithmetic
progression is c+mℤ, with m=0 allowed for a singleton. Different progressions
may have different moduli. The zero sequence is excluded from finite-zero
theorems.

The pinned Mathlib and Tau Ceti declarations below are imports. Current
GlobalNumberFields owns places and their completions; its current place type
has the finite summand first and includes archimedean multiplicities. Its ray
class lattice counting, and Completed/EffectiveBounds' fixed-field counting,
are not absolute Minkowski theorems. GeometryOfNumbersAndQuadraticArithmetic
(tier 3) owns lattice minima, covolumes and the requested generic extensions.
SchemeAndStackFoundations (tier 2) owns generic projective intersection, Hilbert,
Chow and Koszul inputs. DT (tier 4) owns the arithmetic metrics and height
estimates here. Higher-tier Arakelov, Heights, K-theory and
ClassicalArithmeticCompletion are not imported to fill holes: their needed
generic contracts move to the lower-tier owners listed at the end.

The only newly defined objects in the suggested Lean file are the logarithmic
seminorm and block-constant subalgebra, with real bodies over native carriers.
Its end statements are statable at the pins, with admitted proofs.
Symmetric powers with arithmetic metrics, Chow heights and toric complexity
remain reader targets. The finite-rank unit theorem in this reader is more
general than the finitely generated specialization in the suggested file.

## Parent targets and the supplied routes

**Parent targets:** `absolute-value-continuation-exists`, `absolute-value-extends-to-algebraic-closure`, `twisted-height`.

**Inputs:** [Current-owner places and absolute height normalization](#dt2-place-normalization), [Completion comparison for arbitrary continued absolute values](#dt2-continued-place-completion).

**Parent targets:** `height-of-linear-subspace`.

**Inputs:** [Local exterior-power norm and determinant bounds](#dt2-exterior-local-norm), [Plücker duality and orthogonal complement heights](#dt2-subspace-duality), [Intersection and sum inequality for subspace heights](#dt2-subspace-intersection), [Northcott for fixed-degree subspaces](#dt2-plucker-northcott), [Primitive Plücker coordinates and rational covolume](#dt2-rational-covolume).

**Parent targets:** `absolute-minkowski-for-twisted-heights`, `davenport-lemma-for-twisted-heights`, `bombieri-vaaler-siegel-lemma`.

**Inputs:** [Full S-unit logarithmic image](#dt2-s-unit-log-lattice), [Absolute rescaling with one distinguished place](#dt2-absolute-rescaling), [Unitary symmetric-power metric](#dt2-roy-symmetric-metric), [From corrected absolute bases to twisted Minkowski](#dt2-absolute-minkowski-reduction), [Adelic approximation of elimination coefficients](#dt2-coefficient-approximation), [Davenport elimination along a Galois-defined flag](#dt2-davenport-flag), [Small vectors in number-field linear kernels](#dt2-siegel-kernel).

**Parent targets:** `sharp-roths-lemma`, `nonvanishing-on-grids`, `hyperplane-nonvanishing`.

**Inputs:** [Multiprojective degrees and the product criterion](#dt2-multiprojective-degree), [Weighted jets force local multiplicity](#dt2-index-multiplicity), [Fubini–Study Chow height](#dt2-cycle-height), [Arithmetic cuts and the factor-height estimate](#dt2-arithmetic-intersection), [Strict index conclusion at the weak height boundary](#dt2-sharp-roth-boundary), [Sharp Roth to hyperplane and grid nonvanishing](#dt2-grid-roth-assembly).

**Parent targets:** `auxiliary-polynomial-for-twisted-heights`, `interval-result-semistable-case`, `limit-of-successive-infima`, `height-bound-for-filtration-subspaces`, `interval-result`, `parametric-subspace-theorem`, `absolute-subspace-theorem-for-systems`, `faltings-wustholz-interval-refinement`.

**Inputs:** [Successive infima, gap subspaces and Galois descent](#dt2-minima-galois), [Restriction heights and subspace-height lower bounds](#dt2-restriction-height), [Nearly minimizing bases with concentrated archimedean slack](#dt2-minima-local-bases), [Compound heights, truncated weights and the final wedge](#dt2-compound-minima), [Coefficient count and simultaneous weighted-tail constraints](#dt2-auxiliary-count), [Simplex discretization of normalized local weights](#dt2-weight-net-repair), [Auxiliary polynomial with half-rank height control](#dt2-auxiliary-existence), [Nonzero jet and product-formula contradiction](#dt2-semistable-product-contradiction), [Restriction and quotient slopes of the weight flag](#dt2-weight-restriction-quotient), [Asymptotics of successive infima on semistable blocks](#dt2-semistable-minima-asymptotics), [Quantitative height of the canonical weight flag](#dt2-flag-height-bound), [Exceptional quotient and transfer of the interval theorem](#dt2-quotient-interval-transfer), [Bounded intervals, systems and final subspace counts](#dt2-interval-assembly).

**Parent targets:** `unit-equation-subspace-bound-algebraic`, `uniform-bound-nondegenerate-solutions`, `s-unit-equation-finiteness`.

**Inputs:** [Rank exactness for the ratio projection](#dt2-ratio-rank-exact), [Preservation of nondegeneracy after merging a fibre](#dt2-merged-nondegeneracy), [Unit-equation induction and numerical bounds](#dt2-unit-count-induction), [Finite-subset reduction to one number field](#dt2-finite-field-cover-transfer), [Symmetric logarithmic seminorm](#dt2-symmetric-log-seminorm), [Discreteness forces a genuine real norm](#dt2-log-norm-positivity), [Packing cones in the finite-rank logarithmic space](#dt2-cone-cover), [Large perturbed unit points have small twisted height](#dt2-large-unit-height), [Toric equation complexity and exceptional locus](#dt2-toric-complexity), [Hilbert-function lower and fat-point upper bounds](#dt2-hilbert-multiplicity-bounds), [Torsion translation and interpolation determinant](#dt2-interpolation-determinant), [Stabilizers and translation degree control](#dt2-toric-translate-degree), [Explicit small-point cut and relative descent](#dt2-small-point-cut), [Coset decomposition with a weighted degree budget](#dt2-small-point-degree-budget), [Small points in a finite-rank thickening](#dt2-small-unit-packing), [Public conic perturbation cover and the parent ESS budget](#dt2-perturbation-cover), [Amoroso–Viada bounds for unit equations and simple recurrences](#dt2-refined-unit-counts).

**Parent targets:** `schmidt-norm-form-theorem`.

**Inputs:** [Block-constant subalgebra](#dt2-block-constant-algebra), [A fixed norm reduces to finitely many ordinary-unit cosets](#dt2-norm-fixed-ideal), [Homogeneous unit solutions give finitely many stabilizer cosets](#dt2-unit-linear-cosets), [Galois-stable block algebras descend to subfields](#dt2-norm-galois-descent), [The hard direction of the norm-form criterion](#dt2-norm-finiteness-assembly).

**Parent targets:** `nondegenerate-linear-recurrence`, `skolem-mahler-lech-simple-roots`, `uniform-bound-zeros-simple-recurrence`.

**Inputs:** [Cyclic ratio fibres and intersections of progressions](#dt2-progression-fibres), [Simple recurrence zeros from unit fibres](#dt2-simple-zero-assembly), [Polynomial-geometric basis from finite differences](#dt2-finite-difference-basis), [Native recurrences and polynomial-exponential normal form](#dt2-polynomial-exponential-bridge), [Rational polynomial factors in a homogeneous unit relation](#dt2-rational-perturbation), [Lowering the polynomial degree after a height gap](#dt2-recurrence-degree-lowering), [Splitting exponential sums by root-of-unity classes](#dt2-recurrence-splitting), [Conjugate determinants and denominator selection](#dt2-recurrence-conjugate-selection), [Corrected class-modulus proposition](#dt2-recurrence-class-modulus), [Finite obstruction to lowering a progression count](#dt2-finite-progression-obstruction), [Refined counts for multiple-root recurrences](#dt2-recurrence-refined-count).

The other parent targets retain their existing proofs relative to these inputs: classical and p-adic Subspace Theorems, their general-position consequences, Roth, bounded-degree approximation, Thue–Mahler and the existing polynomial/grid interfaces. No parent planet is renamed or added. The six inherited planets are Schmidt’s Subspace Theorem, p-adic Subspace Theorem, Schmidt’s norm form theorem, S-unit equation theorem, Skolem–Mahler–Lech theorem and Parametric Subspace Theorem.

## Places, heights and absolute minima

<a id="dt2-place-normalization"></a>

### Current-owner places and absolute height normalization

**Comparison.** For a number field K of degree d, identify the legacy InfinitePlace K ⊕ FinitePlace K with GlobalNumberFields.Place K by swapping the summands and identifying finite places with height-one prime ideals. Current infinite factors are v(x)^{mult(v)} and finite factors are the adic norms. Raise each current factor to 1/d to obtain the normalized factors used by H₂ and H_Q. The product formula is preserved. In E/K, the factor over w|v carries exponent d(w|v)=[E_w:K_v]/[E:K]. In particular H(x)=Height.mulHeight(x)^{1/d} for a nonzero tuple and h(x)=Height.logHeight(x)/d.

**Declaration:** `dt2_place_normalization`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-place-normalization`.

**Inputs:** `mathlib:NumberField.mulHeight_eq` (see the native-export table), `mathlib:NumberField.totalWeight_eq_finrank` (see the native-export table), [GlobalNumberFields layer-0-places-completions-and-the-product-formula](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/GlobalNumberFields/README.md#layer-0-places-completions-and-the-product-formula).

**Proof outline.**

1. Use the native finite-place equivalence; the infinite factor retains its multiplicity before the degree root.
2. Use the product formula and the local-degree sum over each v to prove invariance under finite extension. This is the compatibility needed by the parent height, not a new place definition.

**Check.** For K=ℚ the root exponent is 1; at a complex place of a quadratic field it is 2/2, not 1/2. The complex squared factor is not treated as an AbsoluteValue: its triangle estimate has exponent 2/d.

**Sources.** [A further improvement of the quantitative Subspace Theorem](https://annals.math.princeton.edu/wp-content/uploads/annals-v177-n2-p04-p.pdf), §§2.1, 6.1, pp. 516–518, 533–535.

<a id="dt2-exterior-local-norm"></a>

### Local exterior-power norm and determinant bounds

**Lemma.** For a p×n matrix of vectors over a normalized local field, the sup norm of its p-minors is at most the product of column sup norms at a nonarchimedean place; the Euclidean norm of those minors is at most the product of the p Euclidean vector norms at an archimedean place. Consequently H₂(span(x₁,…,x_p))≤∏ H₂(x_i) for independent vectors, and the wedge-coordinate sup version has the factor p^{p/2} when each input uses a coordinate sup norm.

**Declaration:** `dt2_exterior_local_norm`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-exterior-local-norm`.

**Inputs:** [DiophantineApproximationAndTranscendence:DT.2/height-of-linear-subspace](../packets/DiophantineApproximationAndTranscendence.json), [DiophantineApproximationAndTranscendence:DT.2/hadamard-inequality](../packets/DiophantineApproximationAndTranscendence.json).

**Proof outline.**

1. At an archimedean place apply Cauchy–Binet to the Gram determinant and Hadamard; at finite places use the ultrametric determinant expansion.
2. Multiply with normalized local weights. The archimedean weights sum to 1, which gives one global p^{p/2}, rather than a power depending on K.

**Check.** For p=1 this is equality. For p=n the wedge is a determinant, and its projective height is 1.

**Sources.** [A further improvement of the quantitative Subspace Theorem](https://annals.math.princeton.edu/wp-content/uploads/annals-v177-n2-p04-p.pdf), §6.3, pp. 535–536; Lemma 17.1, pp. 577–578.

<a id="dt2-subspace-duality"></a>

### Plücker duality and orthogonal complement heights

**Lemma.** For a k-dimensional K-subspace U⊂Kⁿ, the signed complementary-minor map identifies its Plücker vector with that of the annihilator U⊥ for the standard bilinear pairing. Thus H₂(U⊥)=H₂(U); also H₂(U)=1 for k=0,n. This statement concerns bilinear annihilators over K, with Hermitian norms only after embedding at infinity.

**Declaration:** `dt2_subspace_duality`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-subspace-duality`.

**Inputs:** [DiophantineApproximationAndTranscendence:DT.2/height-of-linear-subspace](../packets/DiophantineApproximationAndTranscendence.json), [Local exterior-power norm and determinant bounds](#dt2-exterior-local-norm).

**Proof outline.**

1. Choose an invertible basis minor and row-reduce. The kernel matrix has complementary minors equal up to one common nonzero scalar and signs.
2. Signed coordinate permutation preserves every local sup or Euclidean norm; projective invariance cancels the common scalar.

**Check.** For a rational line generated by (2,3), its perpendicular line generated by (−3,2) has the same H₂=√13.

**Sources.** [A further improvement of the quantitative Subspace Theorem](https://annals.math.princeton.edu/wp-content/uploads/annals-v177-n2-p04-p.pdf), §6.3, pp. 535–536; Lemma 17.2, pp. 578–579.

<a id="dt2-subspace-intersection"></a>

### Intersection and sum inequality for subspace heights

**Lemma.** For subspaces U,V⊂Kⁿ, H₂(U∩V) H₂(U+V)≤H₂(U)H₂(V). This includes nontrivial intersections, and is stronger than applying the exterior product bound only in the disjoint case.

**Declaration:** `dt2_subspace_intersection`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-subspace-intersection`.

**Inputs:** [DiophantineApproximationAndTranscendence:DT.2/height-of-linear-subspace](../packets/DiophantineApproximationAndTranscendence.json), [Local exterior-power norm and determinant bounds](#dt2-exterior-local-norm), [Plücker duality and orthogonal complement heights](#dt2-subspace-duality).

**Proof outline.**

1. Use a common basis A of U∩V and complements B,C. At each archimedean place pass to the quotient by span(A); Gram–Schmidt gives volume(A,B,C) volume(A)≤volume(A,B)volume(A,C).
2. At a finite place use a unit minor of A after scaling and elimination; the induced quotient sup norm gives the corresponding nonarchimedean determinant inequality.
3. Multiply local inequalities, cancel the projective scalars, and use the product formula. The lecture notes quote the inequality; the local quotient proof is the required development.

**Check.** If U⊂V both sides are equal. In ℚ³, U=span(e₁,e₂) and V=span(e₁,e₂+e₃) give 1·1≤1·√2.

**Sources.** [Lecture notes on Diophantine geometry](https://ziyangjeremygao.github.io/LectureNotes/DiophantineGeometry.pdf), §2.3, Proposition 2.3.3, printed pp. 37–39.

<a id="dt2-plucker-northcott"></a>

### Northcott for fixed-degree subspaces

**Lemma.** For n,k,D and B fixed, only finitely many k-subspaces U⊂Q̄ⁿ with [field of definition of U:ℚ]≤D and H₂(U)≤B exist. A Plücker chart with a nonzero coordinate makes every ratio a scalar of degree≤D and absolute multiplicative height≤B; the injective Plücker map then reduces to fixed-degree scalar Northcott.

**Declaration:** `dt2_plucker_northcott`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-plucker-northcott`.

**Inputs:** [DiophantineApproximationAndTranscendence:DT.2/height-of-linear-subspace](../packets/DiophantineApproximationAndTranscendence.json), [DiophantineApproximationAndTranscendence:DT.0/northcott-absolute-height](../packets/DiophantineApproximationAndTranscendence.json).

**Proof outline.**

1. Choose one of finitely many nonzero Plücker coordinates and divide by it.
2. Bound the heights of coordinate ratios by the Plücker sup height, which is≤H₂; use the parent fixed-degree scalar Northcott and Plücker reconstruction.

**Check.** The degree bound is essential: roots of unity give infinitely many lines (1,ζ) of H₂=√2. A fixed ambient number field gives a special case using native fixed-field Northcott.

**Sources.** [A further improvement of the quantitative Subspace Theorem](https://annals.math.princeton.edu/wp-content/uploads/annals-v177-n2-p04-p.pdf), §6.3, pp. 535–536; §17, pp. 578–580.

<a id="dt2-rational-covolume"></a>

### Primitive Plücker coordinates and rational covolume

**Lemma.** For a rational k-subspace U⊂ℚⁿ, L=U∩ℤⁿ is saturated and has rank k. Every specified ℤ-basis b of L extends to a basis of ℤⁿ, hence the gcd of the k-minors of b is 1. Therefore H₂(U)=√det(Gram(b))=covol(L) in U⊗ℝ. This constructs the lattice and proves primitivity, rather than assuming an arbitrary integral basis is primitive.

**Declaration:** `dt2_rational_covolume`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-rational-covolume`.

**Inputs:** [GeometryOfNumbersAndQuadraticArithmetic:GN.0/prescribed-primitive-basis](../packets/GeometryOfNumbersAndQuadraticArithmetic.json), [GeometryOfNumbersAndQuadraticArithmetic:GN.0/covolume-square-gram](../packets/GeometryOfNumbersAndQuadraticArithmetic.json), [DiophantineApproximationAndTranscendence:DT.2/height-of-linear-subspace](../packets/DiophantineApproximationAndTranscendence.json).

**Proof outline.**

1. Saturation follows from m x∈U⇒x∈U for nonzero integer m. Use the prescribed-basis extension theorem, and expand determinant±1 along the first k columns to obtain an integral combination of minors equal to±1.
2. Finite local height factors are then 1; Cauchy–Binet supplies the infinite factor.

**Check.** For the line (2,3) the primitive basis gives √13; using twice this vector without dividing its common factor would wrongly give 2√13.

**Sources.** [A further improvement of the quantitative Subspace Theorem](https://annals.math.princeton.edu/wp-content/uploads/annals-v177-n2-p04-p.pdf), §6.3, pp. 535–536.

<a id="dt2-s-unit-log-lattice"></a>

### Full S-unit logarithmic image

**Theorem.** Let S contain all infinite places and finitely many finite places of K. The map u↦(log|u|_v)_{v∈S}, with degree-normalized factors, has torsion kernel and image a full lattice in Σ_v z_v=0. In particular every vector of that hyperplane is within a K,S-dependent bounded sup distance of some unit logarithm. Native finite generation alone does not imply fullness.

**Declaration:** `dt2_s_unit_log_lattice`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-s-unit-log-lattice`.

**Inputs:** `mathlib:NumberField.Units.unitLattice` (see the native-export table), `mathlib:NumberField.Units.instZLattice_unitLattice` (see the native-export table), `tauceti:Set.unitValuation_ker` (see the native-export table), `tauceti:Set.unit_fg_of_units` (see the native-export table), [GlobalNumberFields layer-0-places-completions-and-the-product-formula](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/GlobalNumberFields/README.md#layer-0-places-completions-and-the-product-formula), [GeometryOfNumbersAndQuadraticArithmetic:GN.4](../packets/GeometryOfNumbersAndQuadraticArithmetic.json).

**Proof outline.**

1. Use ordinary Dirichlet for the infinite-place kernel and principal powers of the finitely many prime ideals in S to obtain independent finite valuation directions.
2. The class group finiteness/principal-power contract is requested from the lower-tier global number-field owner; do not import the higher-tier K-theory rank plan.
3. The product formula places the image in the hyperplane. The obtained independent directions give a full lattice; a bounded fundamental parallelepiped gives the approximation.

**Check.** For ℚ with S={∞,p}, the logarithmic image is ℤ(log p,−log p). For imaginary quadratic K and only infinite places, the hyperplane and free unit rank are both zero.

**Sources.** [A quantitative version of the Absolute Subspace Theorem](https://pub.math.leidenuniv.nl/~evertsejh/00-abssub.pdf), Lemma 6.3 and its proof, pp. 25–27.

<a id="dt2-absolute-rescaling"></a>

### Absolute rescaling with one distinguished place

**Lemma.** Let A_v>0 equal 1 outside a finite set containing all infinite places, with A=∏A_v≥1; fix v₀ and ε>0. There are a finite extension E/K and β∈E* with |β|_w≤A_v^{d(w|v)} for w|v≠v₀ and |β|_w≤((1+ε)A_{v₀}/A)^{d(w|v₀)} for w|v₀. The variant without a distinguished place uses ∏A_v>1 and gives |β|_w≤A_v^{d(w|v)} everywhere.

**Declaration:** `dt2_absolute_rescaling`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-absolute-rescaling`.

**Inputs:** [Full S-unit logarithmic image](#dt2-s-unit-log-lattice), [Current-owner places and absolute height normalization](#dt2-place-normalization).

**Proof outline.**

1. Approximate a large multiple of the balanced target vector of logarithms by the S-unit lattice. Reserve the positive log(1+ε) margin at v₀ and enough negative margin elsewhere to absorb the bounded error.
2. Adjoin a k-th root of that unit; divide all errors by k and check the local-degree weights. This is why the scalar may require a finite extension.

**Check.** When A=1 and all A_v=1 one may take β=1. A zero ε boundary is not inferred from approximation.

**Sources.** [A further improvement of the quantitative Subspace Theorem](https://annals.math.princeton.edu/wp-content/uploads/annals-v177-n2-p04-p.pdf), Lemma 11.1, pp. 544–545; ES2002 Lemma 6.3, pp. 25–27.

<a id="dt2-roy-symmetric-metric"></a>

### Unitary symmetric-power metric

**Definition.** On Symʳ(Kᵐ), write v=Σ_{|I|=r} a_I e^I. At an archimedean place use ‖v‖²=Σ |a_I|²/binomial(r;I); use the dual norm Σ binomial(r;I)|b_I|² on homogeneous polynomial coefficients. At finite places keep the prescribed adelic sup norm. This is the symmetric-tensor metric transported from the invariant symmetric subspace of the tensor power; plain coefficient Euclidean norm is not unitary-invariant.

**Declaration:** `dt2_roy_symmetric_metric`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-roy-symmetric-metric`.

**Inputs:** [Current-owner places and absolute height normalization](#dt2-place-normalization), [DiophantineApproximationAndTranscendence:DT.2/height-of-linear-subspace](../packets/DiophantineApproximationAndTranscendence.json).

**Proof outline.**

1. Average tensor words with each given multiplicity. Their number is binomial(r;I), so the symmetric average has squared norm 1/binomial(r;I).
2. The dual pairing gives the reciprocal coefficient weights. Compare to coefficient sup/Euclidean norms using explicit multinomial factors; the later absolute-basis argument must be checked in the erratum.

**Uses.** Absolute Minkowski input: A unitary-invariant archimedean metric is required in the symmetric-power basis argument.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `symmetricMetric_basis` | simp | The squared norm of e^I is 1/binomial(r;I). |
| `symmetricMetric_unitary` | functoriality | A unitary map on Kᵐ induces an isometry on Symʳ with this metric. |
| `symmetricMetric_dual` | compatibility | The dual polynomial metric has multinomial rather than reciprocal weights. |
| `symmetricMetric_bounds` | relation | Compare to coefficient norms by the largest multinomial coefficient. |

**Unit tests.**

- **computation** (`test_roy_symmetric_metric_1`): For m=2,r=2, ‖a x²+b xy+c y²‖²=|a|²+|b|²/2+|c|².
- **compatibility** (`test_roy_symmetric_metric_2`): For r=1 this is the ordinary Euclidean metric.
- **non-example** (`test_roy_symmetric_metric_3`): Rotating x to (x+y)/√2 sends x² to (x²+2xy+y²)/2. The correct norm stays 1; unweighted coefficient norm becomes √(3/2).

**Check.** The quadratic cross-term has squared weight 1/2; verify invariance on the displayed 45-degree rotation and dual weight 2.

**Sources.** [An absolute version of Siegel’s lemma](https://gdz.sub.uni-goettingen.de/download/pdf/PPN243919689_0476/LOG_0004.pdf), Lemma 3.2(ii), printed p. 9; Roy–Thunder 1999 erratum, introduction p. 47; [Addendum and erratum to An absolute version of Siegel’s lemma](https://doi.org/10.1515/crll.1999.508.47), Introduction p. 47 only.

<a id="dt2-absolute-minkowski-reduction"></a>

### From corrected absolute bases to twisted Minkowski

**Comparison.** Assume the corrected absolute small-basis theorem for adelic Hermitian spaces, with the Roy–Thunder determinant/metric conventions. Apply it to the n coordinate forms at every place, then pass to the algebraic-closure infima. The resulting statement is the parent absolute Minkowski theorem n^{−n/2}Δ Q^{−α}≤∏_{i=1}^n λ_i(Q)≤2^{n(n−1)/2}Δ Q^{−α}, with α=Σ_{v,i}c_{iv}. The lower bound follows directly from local determinants and does not need the unread erratum.

**Declaration:** `dt2_absolute_minkowski_reduction`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-absolute-minkowski-reduction`.

**Inputs:** [Unitary symmetric-power metric](#dt2-roy-symmetric-metric), [Absolute rescaling with one distinguished place](#dt2-absolute-rescaling), [DiophantineApproximationAndTranscendence:DT.2/successive-infima-of-twisted-height](../packets/DiophantineApproximationAndTranscendence.json).

**Proof outline.**

1. For independent nearly minimizing vectors bound each local determinant by the product of local form maxima, with the normalized archimedean factor n^{n/2}; multiply to obtain the lower inequality.
2. For the upper inequality match the adelic twisted box to the corrected absolute-basis theorem and rescale via the preceding lemma. A fixed-field Minkowski theorem is insufficient because λ_i is taken over Q̄.
3. The upper-bound source is a recorded gap until the full 1999 erratum proof is obtained and its constants propagated.

**Check.** Prove the lower determinant inequality separately; mark the upper inequality conditional on the unread corrected-basis proof, with no discriminant term.

**Sources.** [A quantitative version of the Absolute Subspace Theorem](https://pub.math.leidenuniv.nl/~evertsejh/00-abssub.pdf), Proposition 7.1 and Corollary 7.2, pp. 28–31; EF2013 Proposition 9.2, pp. 540–541.

**Open input.** Corrected absolute Siegel basis theorem: Roy–Thunder 1996 was read in full and its symmetric-power metric defect is confirmed by the 1999 erratum preview. Obtain and read pp. 48–51 of that erratum, derive the corrected absolute small-basis/determinant inequality and propagate its constants to ES Corollary 7.2. The weighted-metric definition alone does not establish the upper Minkowski bound.

<a id="dt2-height-zero-torsion"></a>

### Height zero in a number field is torsion

**Lemma.** For x∈K* in a number field, absolute logarithmic height h(x)=0 if and only if x has finite multiplicative order. Only the fixed-field assertion is needed to prove the real logarithmic norm has zero kernel.

**Declaration:** `dt2_height_zero_torsion`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-height-zero-torsion`.

**Inputs:** `mathlib:NumberField.finite_setOfPred_logHeight₁_le` (see the native-export table), `mathlib:Height.logHeight₁_zpow` (see the native-export table).

**Proof outline.**

1. If h(x)=0, all positive powers have height zero by the native power identity; fixed-field Northcott makes them a finite set. Two powers coincide, so x has finite order.
2. Conversely a nonzero power equal to 1 and the power identity imply h(x)=0.

**Check.** Exclude x=0. Finite-order powers have height zero, and finite fixed-field bounded-height powers give two equal positive powers.

**Sources.** [Linear equations in variables which lie in a multiplicative group](https://arxiv.org/pdf/math/0409604v1), §7, p. 824, height-zero input.

<a id="dt2-continued-place-completion"></a>

### Completion comparison for arbitrary continued absolute values

**Comparison.** Given an absolute value on K extending the normalized rational archimedean or p-adic value, construct its metric completion and show the inclusion of K preserves the specified absolute value. Identify the resulting completion with ℝ or ℂ in the archimedean case, or a finite extension of ℚ_p in the nonarchimedean case, with the degree/multiplicity convention of the parent continued-value statements. The existing complete-complex-algebra equivalence cannot create the missing complex algebra structure.

**Declaration:** `dt2_continued_place_completion`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-continued-place-completion`.

**Inputs:** [GlobalNumberFields layer-0-places-completions-and-the-product-formula](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/GlobalNumberFields/README.md#layer-0-places-completions-and-the-product-formula), [Current-owner places and absolute height normalization](#dt2-place-normalization).

**Proof outline.**

1. The lower-tier owner supplies completions, the embedding over ℚ or ℚ_p, and uniqueness of the compatible spectral norm.
2. Archimedean classification needs the real case and construction of the complex action before applying a complex Banach-algebra equivalence.
3. No complete proof of this classification has yet been read for the arbitrary continued value; it remains the explicit parent gap.

**Check.** Do not apply a complex-algebra classification before constructing the complex action. Preserve the given norm, and include the real completion case.

**Sources.** [A further improvement of the quantitative Subspace Theorem](https://annals.math.princeton.edu/wp-content/uploads/annals-v177-n2-p04-p.pdf), §2.1, pp. 516–517, conventions; ES2002 §1, local normalization conventions.

**Open input.** Arbitrary continued-value completion classification: Read a public complete proof constructing the metric completion from an arbitrary continued absolute value, showing finite-dimensionality over the completed rational field, constructing the real/complex algebra action when appropriate and identifying the preserved norm. Native spectral-norm uniqueness is only conditional on these constructions.

## The quantitative Subspace Theorem

<a id="dt2-minima-galois"></a>

### Successive infima, gap subspaces and Galois descent

**Lemma.** For a twisted height H_Q satisfying the parent finite-support, field-extension and Galois compatibility conditions, 0<λ₁(Q)≤⋯≤λ_n(Q)<∞. For every ε>0 choose independent x_i with H_Q(x_i)≤(1+ε)λ_i. If λ_k<λ_{k+1}, the span of vectors with H_Q(x)<λ_{k+1} has dimension k and is K-defined. Comparing two form systems differing at at most R places gives the coordinate bounds of EF Lemmas 9.3–9.4 using their local Cramer constants; no attainment over Q̄ is asserted.

**Declaration:** `dt2_minima_galois`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-minima-galois`.

**Inputs:** [DiophantineApproximationAndTranscendence:DT.2/successive-infima-of-twisted-height](../packets/DiophantineApproximationAndTranscendence.json), [DiophantineApproximationAndTranscendence:DT.2/sup-norm-bounded-by-independent-forms](../packets/DiophantineApproximationAndTranscendence.json), [Current-owner places and absolute height normalization](#dt2-place-normalization), [From corrected absolute bases to twisted Minkowski](#dt2-absolute-minkowski-reduction).

**Proof outline.**

1. Positivity and finiteness follow from determinant bounds and a coordinate basis; the definition of the infimum gives independent near minimizers.
2. Below a genuine adjacent gap the span is independent of the threshold and has dimension k. Galois invariance of H_Q makes this span stable, hence K-defined by the parent descent input.
3. Use inverse matrices and the local Cramer bounds to compare systems, then multiply; retain local determinant factors rather than pretending arbitrary changes of basis are isometric.

**Check.** Use strict adjacent gaps only. A span of near minimizers must be independent of their choices before invoking Galois descent.

**Sources.** [A further improvement of the quantitative Subspace Theorem](https://annals.math.princeton.edu/wp-content/uploads/annals-v177-n2-p04-p.pdf), Lemmas 9.1, 9.3–9.4, pp. 539–543.

<a id="dt2-restriction-height"></a>

### Restriction heights and subspace-height lower bounds

**Lemma.** For k-dimensional T, choose a nonzero basis minor and an isomorphism φ:Q̄ᵏ→T whose selected coordinate minor is the identity. Restricted forms have exterior coefficient heights bounded by √binomial(n,k) H_L H₂(T), with the minimum nonzero restricted determinant carried explicitly. If λ_k(Q)≤Q^{−δ} and λ_{k+1}(Q)>λ_k(Q), the corresponding gap subspace satisfies H₂(T)≥Q^{δ/(3Rⁿ)} in the semistable setting of EF Lemma 10.3.

**Declaration:** `dt2_restriction_height`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-restriction-height`.

**Inputs:** [Local exterior-power norm and determinant bounds](#dt2-exterior-local-norm), [Plücker duality and orthogonal complement heights](#dt2-subspace-duality), [Successive infima, gap subspaces and Galois descent](#dt2-minima-galois), [DiophantineApproximationAndTranscendence:DT.2/weight-and-exceptional-subspace](../packets/DiophantineApproximationAndTranscendence.json).

**Proof outline.**

1. Coordinate projections of φ are bounded by complementary minors; multiply the restricted-minor bounds to obtain Lemma 10.2 with its actual minimum determinant denominator.
2. Combine the determinant lower bound, the restricted weights and semistability w(T)≤0. If H₂(T) were smaller than the stated power, the k-minimum bound would contradict this product estimate.

**Check.** The estimate requires the semistable assumptions; a positive-weight exceptional subspace is not a counterexample to the conditional statement.

**Sources.** [A further improvement of the quantitative Subspace Theorem](https://annals.math.princeton.edu/wp-content/uploads/annals-v177-n2-p04-p.pdf), Lemmas 10.1–10.3, pp. 543–544.

<a id="dt2-minima-local-bases"></a>

### Nearly minimizing bases with concentrated archimedean slack

**Lemma.** Fix v₀ and ε>0. Independent near minimizers can be individually rescaled so that |L_{iv}(x_j)|_v≤n^{−s(v)}Q^{c_{iv}} away from v₀, while at v₀ the bounds are ((1+ε)nλ_j(Q))^{d(w|v₀)}Q^{c_{iw}}. Here s(v)=[K_v:ℝ]/[K:ℚ] at infinity and zero at finite places; after extension the same exponents are multiplied by d(w|v).

**Declaration:** `dt2_minima_local_bases`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-minima-local-bases`.

**Inputs:** [Absolute rescaling with one distinguished place](#dt2-absolute-rescaling), [Successive infima, gap subspaces and Galois descent](#dt2-minima-galois).

**Proof outline.**

1. Take a common finite field for the independent vectors. For each vector set A_v from its actual local twisted maximum and apply distinguished-place rescaling.
2. The product of the A_v is its twisted height; use the near-minimum bound. The independent scalar multiplications preserve independence.

**Check.** The distinguished place is finite and has zero weights and coordinate forms. Multiply the rescaling factors to recover the global near-minimum bound.

**Sources.** [A further improvement of the quantitative Subspace Theorem](https://annals.math.princeton.edu/wp-content/uploads/annals-v177-n2-p04-p.pdf), Lemma 11.2, pp. 545–546.

<a id="dt2-coefficient-approximation"></a>

### Adelic approximation of elimination coefficients

**Lemma.** Given algebraic θ₁,…,θ_{t−1}, a distinguished place v₀ and ε>0, there are algebraic γ₁,…,γ_t with γ_t≠0: |γ_i|_v≤t^{−s(v)} at archimedean v≠v₀ and≤1 at finite v≠v₀; at v₀, |γ_i−θ_iγ_t|_w≤1 and |γ_t|_w≤((1+ε)^t2^{t²})^{d(w|v₀)}. The formulation is after a finite extension containing all coefficients.

**Declaration:** `dt2_coefficient_approximation`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-coefficient-approximation`.

**Inputs:** [From corrected absolute bases to twisted Minkowski](#dt2-absolute-minkowski-reduction), [Absolute rescaling with one distinguished place](#dt2-absolute-rescaling).

**Proof outline.**

1. Apply absolute Minkowski to a unipotent system with last coordinate γ_t and the error forms γ_i−θ_iγ_t.
2. Choose the first nonzero vector after absolute rescaling; if γ_t=0 the remaining coordinates have a strictly too small global product, contradicting the product formula.
3. Track the archimedean factors and use the generous 2^{t²} bound for the successive-minima product.

**Check.** The last coefficient must be nonzero; test the product-formula contradiction when all error coordinates are too small and that coefficient vanishes.

**Sources.** [A quantitative version of the Absolute Subspace Theorem](https://pub.math.leidenuniv.nl/~evertsejh/00-abssub.pdf), Lemma 9.1, pp. 37–39.

<a id="dt2-davenport-flag"></a>

### Davenport elimination along a Galois-defined flag

**Lemma.** In the parent semistable setting, with distinguished nonarchimedean v₀ where c_{iv₀}=0 and L_{iv₀}=X_i, fix Q≥1. Choose ε>0 with (1+ε)²λ_i<λ_{i+1} at every strict gap and n·2^{n²}(1+ε)^{n+1}<3^{n²}, and independent g_i with H_Q(g_i)≤(1+ε/2)λ_i. There are a finite extension E/K, a permutation π and a basis h_j preserving every initial span of the g_j, such that |L_{iw}(h_j)|_w≤n^{−s(w)}Q^{c_{iw}} for w not over v₀, and |L_{π(i),w}(h_j)|_w≤[3^{n²}min(λ_i,λ_j)]^{d(w|v₀)} for w over v₀. Here s(w) is the normalized infinite local degree and zero at finite places.

**Declaration:** `dt2_davenport_flag`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-davenport-flag`.

**Inputs:** [Adelic approximation of elimination coefficients](#dt2-coefficient-approximation), [Nearly minimizing bases with concentrated archimedean slack](#dt2-minima-local-bases), [Successive infima, gap subspaces and Galois descent](#dt2-minima-galois).

**Proof outline.**

1. Select pivots in K-defined annihilators of the flag blocks; use Gaussian elimination in increasing block order.
2. Approximate each elimination coefficient by the preceding adelic lemma, preserving previous pivots. Multiply the local error bounds and sum the geometric losses to obtain 3^{n²}.

**Check.** Equal infima form one block; inventing a gap inside an equal block would make the descent argument invalid.

**Sources.** [A quantitative version of the Absolute Subspace Theorem](https://pub.math.leidenuniv.nl/~evertsejh/00-abssub.pdf), Lemma 9.2, pp. 39–45; EF2013 Lemma 11.3, pp. 546–548.

<a id="dt2-compound-minima"></a>

### Compound heights, truncated weights and the final wedge

**Lemma.** Put p=n−k and N=binomial(n,p). Form the p-fold compound forms and weights ĉ_{Iv}=Σ_{i∈I}c_{iv}. Order the products ν_j of p successive infima increasingly. Under the gap hypothesis of EF Lemma 11.4, normalize the final compound coordinate at v₀ so the last coordinate has the required negative weight. Away from v₀ the total weight is zero and max|ĉ|≤(n−1)max|c|; at v₀ the total is≤−δ/n and max|ĉ|≤n. The inverse compound coefficient height is≤H_L^{Rⁿ}.

**Declaration:** `dt2_compound_minima`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-compound-minima`.

**Inputs:** [Local exterior-power norm and determinant bounds](#dt2-exterior-local-norm), [Davenport elimination along a Galois-defined flag](#dt2-davenport-flag), [DiophantineApproximationAndTranscendence:DT.2/height-of-linear-subspace](../packets/DiophantineApproximationAndTranscendence.json).

**Proof outline.**

1. Identify the final compound coordinate with the annihilator of the k-gap subspace.
2. Apply the determinant/exterior bounds to each wedge of near minimizing basis vectors; sort the products rather than treating them as an unsorted tuple.
3. Modify only the distinguished-place weight by the truncation parameter. Verify the separate local sums and the negative distinguished sum before applying the auxiliary-polynomial construction.

**Check.** Check N=binomial(n,n−k), lexicographic compound coordinates, the zero weight sums away from v₀ and the strictly negative sum at v₀ separately.

**Sources.** [A further improvement of the quantitative Subspace Theorem](https://annals.math.princeton.edu/wp-content/uploads/annals-v177-n2-p04-p.pdf), Lemmas 11.4–11.6, pp. 548–551.

<a id="dt2-siegel-kernel"></a>

### Small vectors in number-field linear kernels

**Theorem.** Let K have degree d and discriminant D_K, C_K=|D_K|^{1/(2d)}, and let A be an M×N matrix of rank M<N. There are L=N−M independent vectors x_j∈O_K^N in its kernel with ∏_j H₂(x_j)≤(√N C_K)^L H₂(row A). Consequently one has H₂(x)≤√N C_K H₂(row A)^{1/L} for some x≠0. Since H₂(row A)≤∏_iH₂(A_i), this implies the parent Lemma 13.1 bound for U<N possibly dependent equations, using denominator N−U. The finite-place primitive row-minor ideal is already incorporated into H₂(row A), and must not be divided out a second time.

**Declaration:** `dt2_siegel_kernel`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-siegel-kernel`.

**Inputs:** [GeometryOfNumbersAndQuadraticArithmetic:GN.0/covolume-dual](../packets/GeometryOfNumbersAndQuadraticArithmetic.json), [GeometryOfNumbersAndQuadraticArithmetic:GN.0/primitive-orthogonal-covolume](../packets/GeometryOfNumbersAndQuadraticArithmetic.json), [GeometryOfNumbersAndQuadraticArithmetic:GN.0/mixed-embedding-normalization](../packets/GeometryOfNumbersAndQuadraticArithmetic.json), [DiophantineApproximationAndTranscendence:DT.2/height-of-linear-subspace](../packets/DiophantineApproximationAndTranscendence.json), [GeometryOfNumbersAndQuadraticArithmetic:GN.1](../packets/GeometryOfNumbersAndQuadraticArithmetic.json).

**Proof outline.**

1. Use the lower-tier adelic-minima and normalized ball-product section contracts requested from GN.1. For a kernel basis Y, BV Theorem 7 gives the adelic box volume≥H₂(Y)^{−d}|D_K|^{−L/2} in Haar measure with covolume-one K^L.
2. BV Theorem 3 bounds (∏λ_j)^d times that volume by 2^{dL}. Theorem 8 converts its independent witnesses to integral vectors with ∏H∞(x_j)≤[(2/π)^{r₂/d}C_K]^L H₂(Y). Complementary minors and the product formula identify H₂(Y)=H₂(row A). Finally H₂(x_j)≤√N H∞(x_j), and (2/π)^{r₂/d}≤1 gives the displayed bound.
3. Take the least-height vector among the N−M independent vectors. EF only needs the half-rank corollary, but the primitive ideal and discriminant are retained.

**Check.** A rank-deficient matrix must first be replaced by independent rows; an N/2 bound counts independent conditions, not a claimed exact rank.

**Sources.** [On Siegel’s lemma](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0073/LOG_0008.pdf), Theorem 9 and proof, pp. 23–30; EF2013 Lemma 13.1, p. 554; [A geometric inequality with applications to linear forms](https://msp.org/pjm/1979/83-2/pjm-v83-n2-p24-s.pdf), Theorem 1 and corollary pp. 543–544; proof §§2–3 pp. 545–549.

<a id="dt2-auxiliary-count"></a>

### Coefficient count and simultaneous weighted-tail constraints

**Lemma.** For m blocks of N variables of degrees r_h, the number of monomials is V=∏_h binomial(r_h+N−1,N−1). For each place in a finite set S₀, the proportion of exponent tuples outside the weighted concentration band is≤exp(−mε²/2). Hence m>2ε^{−2}log(2|S₀|+2) leaves fewer than V/2 simultaneous linear coefficient conditions.

**Declaration:** `dt2_auxiliary_count`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-auxiliary-count`.

**Inputs:** [DiophantineApproximationAndTranscendence:DT.2/block-homogenization](../packets/DiophantineApproximationAndTranscendence.json), [DiophantineApproximationAndTranscendence:DT.2/finite-simplex-discretisation](../packets/DiophantineApproximationAndTranscendence.json).

**Proof outline.**

1. Treat uniform weak compositions in each block as independent variables; normalize the weighted sums using the actual local weight range.
2. Apply the bounded-variable exponential-moment estimate and union bound. Count compositions directly: no extra product of block degrees multiplies V.
3. Each condition is coefficient extraction after the local linear substitution; bound its coefficient height by ((6N²)^s C_v)^{Σr_h}.

**Check.** Count linear conditions by a union bound across the actual finite representative systems. The count must be strictly less than V/2 before invoking Siegel.

**Sources.** [A further improvement of the quantitative Subspace Theorem](https://annals.math.princeton.edu/wp-content/uploads/annals-v177-n2-p04-p.pdf), Lemmas 13.3–13.4, pp. 554–557.

<a id="dt2-weight-net-repair"></a>

### Simplex discretization of normalized local weights

**Lemma.** Let c∈ℝⁿ, Σc_i=0, γ=max c_i>0 and 0<ε≤1/10. Set b_i=1−c_i/γ, so b_i≥0 and Σb_i=n. The bins (⌊b_i/ε⌋)_i have at most binomial(⌊n/ε⌋+n,n)≤(3/ε)^n values. Choosing one actual weight vector per occupied bin gives coordinate error<ε. Together with at most Rⁿ ordered local form systems this gives |S₀|≤(3R/ε)^n, the count used in EF §14.

**Declaration:** `dt2_weight_net_repair`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-weight-net-repair`.

**Inputs:** [DiophantineApproximationAndTranscendence:DT.2/finite-simplex-discretisation](../packets/DiophantineApproximationAndTranscendence.json), [Coefficient count and simultaneous weighted-tail constraints](#dt2-auxiliary-count).

**Proof outline.**

1. The printed cube [−1,1]ⁿ is false for normalized zero-sum weights. The b-coordinates put them in the simplex of mass n.
2. Stars-and-bars counts all floor tuples of sum≤⌊n/ε⌋. Use binomial(a+n,n)≤(e(a+n)/n)^n and e(1+ε)≤3.
3. Take representatives from occupied bins; do not replace them by arbitrary weight vectors which might violate normalization. The ε used in §14 is inside this range.

**Check.** For n=3, c=(−2,1,1) has γ=1 and b=(3,0,0); it is permitted. This argument does not assert the same bound for every ε<1; the unused larger-ε formulation remains outside this repair.

**Sources.** [A further improvement of the quantitative Subspace Theorem](https://annals.math.princeton.edu/wp-content/uploads/annals-v177-n2-p04-p.pdf), Proposition 13.6 proof, p. 559; §14, pp. 560–565.

<a id="dt2-auxiliary-existence"></a>

### Auxiliary polynomial with half-rank height control

**Theorem.** For the compound system, degrees r_h and 0<ε≤1/10, take m satisfying the repaired finite-net count and EF Proposition 13.5. There is a nonzero multihomogeneous P whose prohibited low-weight coefficients vanish at every original place, and H₂(P)≤C_K(2^{3n}H_L^{Rⁿ})^{Σr_h}. C_K depends on the chosen coefficient field and is independent of Q and the large degree parameter.

**Declaration:** `dt2_auxiliary_existence`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-auxiliary-existence`.

**Inputs:** [Small vectors in number-field linear kernels](#dt2-siegel-kernel), [Coefficient count and simultaneous weighted-tail constraints](#dt2-auxiliary-count), [Simplex discretization of normalized local weights](#dt2-weight-net-repair), [Compound heights, truncated weights and the final wedge](#dt2-compound-minima).

**Proof outline.**

1. Choose the finite representative systems; impose fewer than half the coefficient conditions and apply the number-field kernel theorem.
2. A bin error<ε preserves the enlarged vanishing threshold at all original places. Expand the linear substitutions to bound the coefficient matrix height and retain C_K.

**Check.** The polynomial must be nonzero and satisfy every original place constraint, including those represented by a net bin. Keep C_K independent of the degree parameter.

**Sources.** [A further improvement of the quantitative Subspace Theorem](https://annals.math.princeton.edu/wp-content/uploads/annals-v177-n2-p04-p.pdf), Propositions 13.5–13.6, pp. 557–560.

<a id="dt2-semistable-product-contradiction"></a>

### Nonzero jet and product-formula contradiction

**Theorem.** In the semistable case with 0<δ≤1, take the auxiliary polynomial, compound bases and separated parameters of EF §14. Choose ε with 10nε<δ/(nN). The nonzero evaluated jet supplied by the parent grid/Roth inputs has global product at most (eN²2^{7n}H_L^{2Rⁿ})^{Σr_h}(Q₁^{mr₁})^{10nε−δ/(nN)}, after choosing r₁ sufficiently large to absorb C_K. For Q₁ above the stated source threshold this product is<1, contradicting the product formula.

**Declaration:** `dt2_semistable_product_contradiction`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-semistable-product-contradiction`.

**Inputs:** [Auxiliary polynomial with half-rank height control](#dt2-auxiliary-existence), [Compound heights, truncated weights and the final wedge](#dt2-compound-minima), [DiophantineApproximationAndTranscendence:DT.2/nonvanishing-on-grids](../packets/DiophantineApproximationAndTranscendence.json), [DiophantineApproximationAndTranscendence:DT.2/sharp-roths-lemma](../packets/DiophantineApproximationAndTranscendence.json).

**Proof outline.**

1. Balance the degrees so Q_h^{r_h} lie between Q₁^{r₁} and (Q₁^{r₁})^{1+ε}; choose the integer grid jet using the parent strict vanishing threshold.
2. At finite places bound every term ultrametrically; at infinity account for the derivative coefficient and substitution losses.
3. Multiply all local bounds. The negative exponent comes from the distinguished compound coordinate, while all other weight sums cancel. Take the degree parameter large only after Q and the fixed-field constant are fixed.

**Check.** The jet is nonzero, so its global absolute-value product is 1. Verify the negative exponent and the strict upper bound less than 1 after absorbing C_K.

**Sources.** [A further improvement of the quantitative Subspace Theorem](https://annals.math.princeton.edu/wp-content/uploads/annals-v177-n2-p04-p.pdf), §14, equations (14.1)–(14.27), pp. 560–565.

<a id="dt2-weight-restriction-quotient"></a>

### Restriction and quotient slopes of the weight flag

**Lemma.** Let T be the first proper positive-slope subspace in the parent weight flag, k=dim T. Restricted weights are obtained from a minimizing independent restricted-form set I_v(T). On Q̄ⁿ/T, use the complementary forms, normalized by the selected minor. For U⊃T the quotient weight is w(U)−w(T); after subtracting the block mean slope, each resulting block is semistable. The slopes strictly decrease and the last proper flag member is the unique smallest-dimensional maximizer of w(U)/(n−dim U).

**Declaration:** `dt2_weight_restriction_quotient`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-weight-restriction-quotient`.

**Inputs:** [DiophantineApproximationAndTranscendence:DT.2/weight-and-exceptional-subspace](../packets/DiophantineApproximationAndTranscendence.json), [DiophantineApproximationAndTranscendence:DT.2/twisted-height-filtration](../packets/DiophantineApproximationAndTranscendence.json), [Restriction heights and subspace-height lower bounds](#dt2-restriction-height).

**Proof outline.**

1. Use submodularity of restricted independent-form bases, equivalently supermodularity of w, to identify the unique maximizer.
2. Selected minors identify the restricted and quotient form systems. Verify the quotient formula on every intermediate U, then subtract the mean slope on each block.
3. The sum in the dimension-weight expression stops at n−1; do not include the full-space term as another proper jump.

**Check.** For each intermediate U containing T verify the quotient weight formula. Mean shifts must make every block semistable and the dimension-weighted slopes sum correctly.

**Sources.** [A further improvement of the quantitative Subspace Theorem](https://annals.math.princeton.edu/wp-content/uploads/annals-v177-n2-p04-p.pdf), Lemma 15.3 and §§15–16, pp. 565–573.

<a id="dt2-semistable-minima-asymptotics"></a>

### Asymptotics of successive infima on semistable blocks

**Theorem.** For a semistable n-dimensional twisted system with total weight zero and any δ>0, eventually λ₁(Q)>Q^{−δ/(2n)} and λ_n(Q)≤Q^δ. On a block with mean weight μ, undoing the shift gives log λ_i(Q)/log Q→−μ. In the full flag, the exponent α in the Minkowski product is Σ(block dimension)·μ; cumulative flag dimensions would give the wrong sum.

**Declaration:** `dt2_semistable_minima_asymptotics`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-semistable-minima-asymptotics`.

**Inputs:** [Nonzero jet and product-formula contradiction](#dt2-semistable-product-contradiction), [Restriction and quotient slopes of the weight flag](#dt2-weight-restriction-quotient), [From corrected absolute bases to twisted Minkowski](#dt2-absolute-minkowski-reduction).

**Proof outline.**

1. The semistable interval theorem prevents arbitrarily large Q with a small first minimum: its finitely many bounded multiplicative intervals cannot contain an unbounded sequence.
2. Use the absolute Minkowski product and monotonicity to bound the largest minimum. Dimension one follows directly from the product formula.
3. Induct along the flag using restricted/quotient comparisons. Match the slopes in increasing minimum order, and verify that their dimension-weighted sum is the total exponent.

**Check.** In dimension one recover the product formula directly. Higher dimensions use finitely many bounded intervals, rather than assuming infima are attained.

**Sources.** [A further improvement of the quantitative Subspace Theorem](https://annals.math.princeton.edu/wp-content/uploads/annals-v177-n2-p04-p.pdf), Lemmas 16.2–16.4 and Theorem 16.1, pp. 571–576.

<a id="dt2-flag-height-bound"></a>

### Quantitative height of the canonical weight flag

**Theorem.** For the canonical flag T_i of the parent twisted-height filtration, H₂(T_i)≤H_L^{4ⁿ}. For an (n−1)-dimensional final gap subspace the intermediate estimate is H_L^{(n−1)²}; exterior duality transfers the general k-dimensional problem to a hyperplane in dimension N=binomial(n,n−k), and p(N−1)²≤4ⁿ gives the stated bound.

**Declaration:** `dt2_flag_height_bound`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-flag-height-bound`.

**Inputs:** [Compound heights, truncated weights and the final wedge](#dt2-compound-minima), [Asymptotics of successive infima on semistable blocks](#dt2-semistable-minima-asymptotics), [Plücker duality and orthogonal complement heights](#dt2-subspace-duality), [Local exterior-power norm and determinant bounds](#dt2-exterior-local-norm).

**Proof outline.**

1. Choose compound wedges from independent near minimizers and compare their local coordinates to the limiting final flag.
2. Use the source hyperplane estimate with the compound form height, then descend via complementary Plücker coordinates.
3. The exponent is 4ⁿ, not 4n. Keep this distinction in every later effective threshold.

**Check.** For H_L=1 the bound forces height 1; for n=3 the exponent is 64.

**Sources.** [A further improvement of the quantitative Subspace Theorem](https://annals.math.princeton.edu/wp-content/uploads/annals-v177-n2-p04-p.pdf), Lemmas 17.1–17.4 and Proposition 17.5, pp. 577–581.

<a id="dt2-quotient-interval-transfer"></a>

### Exceptional quotient and transfer of the interval theorem

**Theorem.** Let T be the k-dimensional exceptional subspace, k<n. The quotient map φ_T has triangular minor coordinates and compares H_Q outside T to the quotient height with constant≤(2H_L)^{(8R)ⁿ}. Choose θ_v as the average of the selected restricted weights and d_{iv}=(n−k)(c_{iv}−θ_v)/n on complementary indices; put Q′=Q^{n/(n−k)}. The quotient is semistable, has at most nRⁿ form systems and H_L″≤(2H_L)^{(8R)ⁿ}. For Q≥(2H_L)^{200(8R)ⁿ/δ}, H_Q(x)≤Δ^{1/n}Q^{−δ}, x∉T implies H_{Q′}″(φ_Tx)≤(Q′)^{−99δ/(100n)}.

**Declaration:** `dt2_quotient_interval_transfer`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-quotient-interval-transfer`.

**Inputs:** [Restriction and quotient slopes of the weight flag](#dt2-weight-restriction-quotient), [Quantitative height of the canonical weight flag](#dt2-flag-height-bound), [Nonzero jet and product-formula contradiction](#dt2-semistable-product-contradiction), [Restriction heights and subspace-height lower bounds](#dt2-restriction-height).

**Proof outline.**

1. Use the selected restricted minor to eliminate T and bound all quotient coefficients by determinants.
2. Verify Σθ_v=−w(T)/(n−k)≤0 and normalize the quotient weights; transfer semistability through w(U)−w(T).
3. Apply the semistable interval result with the reduced dimension and δ′=99δ/(100n). Translate Q′ intervals back to Q and absorb the comparison constants using the stated Q threshold.

**Check.** Check the identity (Q′)^{d_iv}=Q^{c_iv−θ_v} and δ′=99δ/(100n). The quotient dimension is n−k and the conclusion excludes x∈T.

**Sources.** [A further improvement of the quantitative Subspace Theorem](https://annals.math.princeton.edu/wp-content/uploads/annals-v177-n2-p04-p.pdf), Lemmas 18.1–18.4 and Proposition 18.5, pp. 581–588.

<a id="dt2-interval-assembly"></a>

### Bounded intervals, systems and final subspace counts

**Application.** The parent Parametric Subspace Theorem and its system/interval refinements follow by combining: one exceptional K-subspace; the quotient interval theorem above for x outside it; the elementary short-range gap principle; and the finite system reduction. For each multiplicative interval (Q_h,Q_h^ω), enlarge its endpoints greedily as in EF Lemma 5.2, with the source count and the determinant Δ preserved. The systems statement uses the parent Lemma 5.1 conversion before applying this cover.

**Declaration:** `dt2_interval_assembly`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-interval-assembly`.

**Inputs:** [Exceptional quotient and transfer of the interval theorem](#dt2-quotient-interval-transfer), [DiophantineApproximationAndTranscendence:DT.2/twisted-height-gap-principle](../packets/DiophantineApproximationAndTranscendence.json), [DiophantineApproximationAndTranscendence:DT.2/twisted-height-of-system-solutions](../packets/DiophantineApproximationAndTranscendence.json), [DiophantineApproximationAndTranscendence:DT.2/product-inequality-reduces-to-systems](../packets/DiophantineApproximationAndTranscendence.json).

**Proof outline.**

1. Order the interval starts and cover each surviving long interval by short gap ranges. Greedy endpoint extension controls the number without changing the exceptional subspace.
2. Insert the explicit n,R,δ constants from the parent targets; restriction and quotient losses have already been bounded above.
3. The classical and p-adic forms, Roth, bounded-degree approximation and Thue–Mahler applications remain parent targets. This node supplies their missing absolute quantitative input rather than redeclaring those targets.

**Check.** Preserve the exceptional subspace, determinant normalization and the parent endpoint conventions while moving between systems, short ranges and long intervals.

**Sources.** [A further improvement of the quantitative Subspace Theorem](https://annals.math.princeton.edu/wp-content/uploads/annals-v177-n2-p04-p.pdf), Lemma 5.2, pp. 530–532; Theorems 2.1, 2.3, 3.1, 3.3, pp. 518–526.

## Product intersections and sharp Roth

<a id="dt2-multiprojective-degree"></a>

### Multiprojective degrees and the product criterion

**Lemma.** For an irreducible Z⊂∏P^{n_h} of dimension d, the numbers (Z·L₁^{e₁}⋯L_m^{e_m}) are nonnegative integers for Σe_h=d. For a product Z=∏Z_h only e_h=dim Z_h is nonzero, and that value is∏deg Z_h. Conversely, if Z is not a product, at least two exponent tuples have positive intersection number. For L=Σd_hL_h, (Z·L^d) is the multinomial sum with coefficients d_h^{e_h}.

**Declaration:** `dt2_multiprojective_degree`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-multiprojective-degree`.

**Inputs:** [SchemeAndStackFoundations:SF.5/projective-bundle-formula](../packets/SchemeAndStackFoundations.json), [SchemeAndStackFoundations:SF.5/smooth-intersection](../packets/SchemeAndStackFoundations.json), [SchemeAndStackFoundations:SF.5/cartier-gysin](../packets/SchemeAndStackFoundations.json).

**Proof outline.**

1. Iterate the projective-bundle formula to obtain the ambient Chow ring ℤ[L_h]/(L_h^{n_h+1}); apply proper Cartier intersections to effective cycles.
2. For each projection Z_h=π_hZ choose enough generic hyperplanes to achieve exponent dim Z_h and continue cutting other factors. If Z is not the whole product, Σdim Z_h>dim Z, producing two distinct supported degree tuples.
3. The geometric argument uses proper projection images and generic hyperplane dimension drops from the lower-tier scheme owner.

**Check.** A product of points has degree 1 and a product of projective spaces has the expected multinomial degree; do not replace multidegree by a single affine polynomial degree.

**Sources.** [An explicit version of Faltings’ Product Theorem and an improvement of Roth’s lemma](https://pub.math.leidenuniv.nl/~evertsejh/95-product.pdf), §2, Lemmas 1–3, pp. 10–12.

<a id="dt2-index-multiplicity"></a>

### Weighted jets force local multiplicity

**Lemma.** Let I be generated by the multihomogeneous divided derivatives with weighted order below σ. If Z is a component of the σ-index locus persisting to σ+ε, its local multiplicity ℓ(O_Z/I O_Z) is bounded below by the count of allowed monomials in the normal directions. Under the degree separation of the Product Theorem this lower bound, paired with the intersection upper bounds, forces Z to be a product.

**Declaration:** `dt2_index_multiplicity`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-index-multiplicity`.

**Inputs:** [DiophantineApproximationAndTranscendence:DT.2/block-homogeneous-strict-vanishing](../packets/DiophantineApproximationAndTranscendence.json), [SchemeAndStackFoundations:SF.5/tor-intersection](../packets/SchemeAndStackFoundations.json), [Multiprojective degrees and the product criterion](#dt2-multiprojective-degree).

**Proof outline.**

1. Localize at Z and use the characteristic-zero regular local normal directions; divided derivatives identify the successive powers of the maximal ideal.
2. Count normal-direction monomials satisfying the weighted budget. Apply the source simplex estimates with the separated d_h; all thresholds refer to derivatives of weight strictly below the index.
3. Compare with successive properly meeting Cartier cuts, retaining component lengths. If the degree support has two tuples, their weighted upper bounds contradict the multiplicity lower bound.

**Check.** Use strict jet vanishing below the index threshold. The component multiplicity bound and the choice of ordinary versus Hasse derivatives must agree in characteristic zero.

**Sources.** [An explicit version of Faltings’ Product Theorem and an improvement of Roth’s lemma](https://pub.math.leidenuniv.nl/~evertsejh/95-product.pdf), §3, Lemmas 6–9 and proof of Theorem 1, pp. 15–23.

<a id="dt2-cycle-height"></a>

### Fubini–Study Chow height

**Definition.** For an effective r-cycle Z in Pⁿ over Q̄ with Chow form F_Z, define its normalized Fubini–Study height as the sum over finite places of log coefficient sup norms, plus at infinity the integral of log|F_Z| over r+1 unit spheres with probability measure, plus (r+1)deg(Z)H_n/2, where H_n=Σ_{j=1}^n1/j. Normalize local contributions by [K:ℚ] and archimedean multiplicities. Extend additively to cycles. Multiprojective heights h_L(Z) use the Segre–Veronese metric associated to positive L=O(d₁,…,d_m), with the same point-height normalization. This arithmetic invariant is owned here; generic Chow groups and proper intersections are imported from SF.5.

**Declaration:** `dt2_cycle_height`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-cycle-height`.

**Inputs:** [SchemeAndStackFoundations:SF.5/chow-group](../packets/SchemeAndStackFoundations.json), [DiophantineApproximationAndTranscendence:DT.2/height-of-linear-subspace](../packets/DiophantineApproximationAndTranscendence.json), [Current-owner places and absolute height normalization](#dt2-place-normalization).

**Proof outline.**

1. Construct the incidence Chow form using the generic projective intersection/degree contract requested from SF.4.
2. Show integrability of log|F_Z| on the spheres and cancellation under rescaling by the product formula. The cited source specifies the height normalization and invokes arithmetic intersection theory; a proof of its analytic/arithmetic Bézout estimates is a recorded gap.
3. The harmonic term is chosen so a point has log Euclidean projective height. Do not replace this by the logarithm of the coefficient height of the Chow form.

**Uses.** Sharp Roth proof: Arithmetic intersection bounds turn a high-index product component into an upper bound on one approximating point. Product Theorem arithmetic estimate: The degree-weighted sum of factor heights must use Fubini–Study point normalization.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `chowHeight_scalar` | compatibility | Changing the nonzero scalar of F_Z leaves h(Z) unchanged. |
| `chowHeight_baseChange` | functoriality | Finite extension of the defining field leaves the normalized height unchanged. |
| `chowHeight_add` | structure | h(Z+W)=h(Z)+h(W) for effective cycles. |
| `chowHeight_point` | characterisation | h([x])=log H₂(x). |
| `chowHeight_coefficient` | relation | \|h(Z)−log H₂(F_Z)\|≤c(n,r)deg Z with an explicit computable constant. |
| `chowHeight_segre` | compatibility | At a product point h_L(P₁,…,P_m)=Σ d_h log H₂(P_h). |

**Unit tests.**

- **computation** (`test_cycle_height_1`): The point [1:1] has height (log 2)/2, not 0.
- **degenerate** (`test_cycle_height_2`): The unique cycle point of P⁰ has height 0; doubling a point doubles its height.
- **non-example** (`test_cycle_height_3`): For Z=P¹, the determinant Chow form and harmonic correction give h(Z)=1/2. Plain log coefficient sup height would give 0.

**Check.** Compute [1:1] and P¹ with the sphere-integral harmonic correction. Scalar and finite-extension invariance must hold in this normalization.

**Sources.** [An explicit version of Faltings’ Product Theorem and an improvement of Roth’s lemma](https://pub.math.leidenuniv.nl/~evertsejh/95-product.pdf), §1, equations (1.4)–(1.6), p. 5; §4, pp. 24–27.

**Open input.** Arithmetic Bézout in the Fubini–Study normalization: Evertse specifies the Chow/Faltings height and quotes arithmetic intersection inputs. Read a full primary proof of the sphere-integral formula, proper arithmetic Bézout and the product-height formula with the exact derivative constants; extend DT.2 here. Do not invoke the higher-tier Arakelov package or identify Chow coefficient height with cycle height.

<a id="dt2-arithmetic-intersection"></a>

### Arithmetic cuts and the factor-height estimate

**Theorem.** For the high-index component in the Product Theorem, successive effective Cartier cuts using bounded-height derivatives give the source estimate [k₁:k₀]∏deg Z_h Σ_h d_h h(Z_h)/deg Z_h ≤2(s/ε)^s m^M·M²(Σd_h+log H₂(F)), where M=Σn_h and s=Σcodim Z_h. The geometric degree bound is [k₁:k₀]∏deg Z_h≤(ms/ε)^s. Conjugate components contribute positively; heights are not bounded by degrees alone.

**Declaration:** `dt2_arithmetic_intersection`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-arithmetic-intersection`.

**Inputs:** [Fubini–Study Chow height](#dt2-cycle-height), [Weighted jets force local multiplicity](#dt2-index-multiplicity), [Multiprojective degrees and the product criterion](#dt2-multiprojective-degree), [SchemeAndStackFoundations:SF.5/cartier-gysin](../packets/SchemeAndStackFoundations.json).

**Proof outline.**

1. Construct the truncated effective cycles from successive generic sections, removing components already captured by the index locus.
2. Bound the height of each derivative by its degree factorial loss and H₂(F); apply arithmetic Bézout in the specified metric, which is the precise recorded source gap.
3. Sum over the Galois orbit to obtain [k₁:k₀]; keep the factor 1/deg Z_h and the product of all degrees.

**Check.** Keep m^M M², the Galois orbit factor, the product of factor degrees and the division by each factor degree. This node remains conditional on the stated arithmetic Bézout gap.

**Sources.** [An explicit version of Faltings’ Product Theorem and an improvement of Roth’s lemma](https://pub.math.leidenuniv.nl/~evertsejh/95-product.pdf), Theorems 1–2 and §4, pp. 4–6, 24–27.

**Open input.** Arithmetic Bézout in the Fubini–Study normalization: Evertse specifies the Chow/Faltings height and quotes arithmetic intersection inputs. Read a full primary proof of the sphere-integral formula, proper arithmetic Bézout and the product-height formula with the exact derivative constants; extend DT.2 here. Do not invoke the higher-tier Arakelov package or identify Chow coefficient height with cycle height.

<a id="dt2-sharp-roth-boundary"></a>

### Strict index conclusion at the weak height boundary

**Theorem.** Let m≥2, 0<Θ≤1, F≠0 of binary block degrees d_h>0, and d_h/d_{h+1}≥2m²/Θ. If H₂(x_h)^{d_h}≥(e^{Σd_h}H₂(F))^{(3m²/Θ)^m} for every block, then the index is<mΘ. This is the boundary version used by the parent sharp Roth node: Evertse 1995 states a strict height premise, while the later 1996 lemma uses≥.

**Declaration:** `dt2_sharp_roth_boundary`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-sharp-roth-boundary`.

**Inputs:** [Arithmetic cuts and the factor-height estimate](#dt2-arithmetic-intersection), [DiophantineApproximationAndTranscendence:DT.2/block-homogeneous-weighted-index](../packets/DiophantineApproximationAndTranscendence.json).

**Proof outline.**

1. Argue by contradiction index≥ε=mΘ. Run the index-locus chain until a component repeats, then use the product criterion and arithmetic estimate with its actual strict numerical slack.
2. The constant before the point-height sum is C_s=2m²m![s(m+1)/ε]^s, 1≤s≤m. Endpoint convexity and m!≤((m+1)/2)^m for m≥3 give C_s≤(3m³/ε)^m; handle m=2 directly.
3. In the final source estimate the additional factor m(m+1)/(2m³)<1 for m≥2 supplies strict slack even when the input height is exactly the threshold. Record this strict comparison explicitly; changing > to≥ by continuity is not a proof.

**Check.** For m=2 the final slack is 3/4. The conclusion is strict index<mΘ. No derivative at weighted order exactly mΘ is forced to vanish by the definition.

**Sources.** [An explicit version of Faltings’ Product Theorem and an improvement of Roth’s lemma](https://pub.math.leidenuniv.nl/~evertsejh/95-product.pdf), Theorem 3, p. 7; §5, equations (5.1)–(5.6), pp. 28–34; subspace1996 Lemma 23, p. 64; [An improvement of the quantitative Subspace Theorem](https://pub.math.leidenuniv.nl/~evertsejh/95-subspace.pdf), Lemma 23, author preprint p. 64.

<a id="dt2-grid-roth-assembly"></a>

### Sharp Roth to hyperplane and grid nonvanishing

**Application.** The missing sharp-Roth input completes the parent Evertse Lemmas 24–26 chain: a nonzero coefficient slice of a binary block polynomial preserves the coefficient H₂ bound, restores multihomogeneity by a monomial, and has a nonzero jet on each chosen hyperplane. Iterating across blocks gives the parent Proposition 12.1 grid jet used in the semistable contradiction.

**Declaration:** `dt2_grid_roth_assembly`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-grid-roth-assembly`.

**Inputs:** [Strict index conclusion at the weak height boundary](#dt2-sharp-roth-boundary), [DiophantineApproximationAndTranscendence:DT.2/height2-coefficient-slice](../packets/DiophantineApproximationAndTranscendence.json), [DiophantineApproximationAndTranscendence:DT.2/binary-slice-block-degrees](../packets/DiophantineApproximationAndTranscendence.json), [DiophantineApproximationAndTranscendence:DT.2/restore-binary-multihomogeneity](../packets/DiophantineApproximationAndTranscendence.json), [DiophantineApproximationAndTranscendence:DT.2/hyperplane-jet-restriction](../packets/DiophantineApproximationAndTranscendence.json), [DiophantineApproximationAndTranscendence:DT.2/conditional-nonzero-block-grid-jet](../packets/DiophantineApproximationAndTranscendence.json).

**Proof outline.**

1. Apply the parent affine-chart/Hasse-jet transports and slice lemmas, preserving the strict threshold.
2. Use the corrected weak-boundary sharp Roth conclusion to exclude excessive vanishing on the hyperplane normal of large height.
3. Keep the grid degree capacity and block replacement cases already planned by the parent; these are inputs, not new definitions.

**Check.** Restoring a slice by a monomial must preserve its relevant jet and the prescribed block degrees; the weak height boundary still needs a strict index conclusion.

**Sources.** [An improvement of the quantitative Subspace Theorem](https://pub.math.leidenuniv.nl/~evertsejh/95-subspace.pdf), Lemmas 24–26, pp. 64–70; EF2013 §12, pp. 551–554.

## Finite-rank unit equations

<a id="dt2-ratio-rank-exact"></a>

### Rank exactness for the ratio projection

**Lemma.** For Γ⊂(F*)ⁿ of finite rank r and a proper subspace relation involving ℓ≥2 coordinates, let ρ(x)=(x₂/x₁,…,x_ℓ/x₁), Γ₁=im ρ and Γ₂=ker ρ. Then rank Γ₁+rank Γ₂=r, including groups that are not finitely generated. Each nonempty ratio fibre is one coset uΓ₂, with its first ℓ coordinates proportional.

**Declaration:** `dt2_ratio_rank_exact`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-ratio-rank-exact`.

**Inputs:** [DiophantineApproximationAndTranscendence:DT.2/nondegenerate-solution](../packets/DiophantineApproximationAndTranscendence.json).

**Proof outline.**

1. Tensor the exact sequence of abelian groups with ℚ; flatness gives exactness and finite-dimensional rank-nullity gives r=r₁+r₂.
2. For a fixed ratio choose one representative u and divide every fibre element by u; membership in the kernel is exactly the coordinate-ratio condition.
3. Do not enumerate a finite generating set for an arbitrary finite-rank group.

**Check.** For the full diagonal subgroup, Γ₁ has rank 0 and Γ₂ has rank r.

**Sources.** [Linear equations in variables which lie in a multiplicative group](https://arxiv.org/pdf/math/0409604v1), §4, pp. 816–819.

<a id="dt2-merged-nondegeneracy"></a>

### Preservation of nondegeneracy after merging a fibre

**Lemma.** Suppose a₁x₁+⋯+a_nx_n=1 is nondegenerate and a minimal homogeneous relation on ℓ coordinates fixes their ratios w_i=x_i/x₁. The merged coefficient b=a₁+Σ_{i=2}^ℓa_iw_i is nonzero; replacing the first ℓ terms by b x₁ gives a nondegenerate equation on n−ℓ+1 coordinates in a coset of Γ₂. The ratio equation on ℓ−1 coordinates is itself nondegenerate after dividing the minimal relation by one term.

**Declaration:** `dt2_merged_nondegeneracy`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-merged-nondegeneracy`.

**Inputs:** [Rank exactness for the ratio projection](#dt2-ratio-rank-exact), [DiophantineApproximationAndTranscendence:DT.2/nondegenerate-homogeneous-solution](../packets/DiophantineApproximationAndTranscendence.json).

**Proof outline.**

1. A zero b would make an original nonempty subsum vanish. Any vanishing merged subsum expands to an original vanishing subsum.
2. A minimal relation has no proper zero subsum, so normalizing it gives the required lower-dimensional affine equation. Absorb the chosen fibre representative into its coefficients.
3. The affine nondegeneracy convention prohibits every nonempty zero subsum, including the full left side; it is not the same as the homogeneous convention.

**Check.** A zero merged coefficient or merged zero subsum expands to an original nonempty zero subsum. The homogeneous minimal relation forbids proper zero subsums.

**Sources.** [Linear equations in variables which lie in a multiplicative group](https://arxiv.org/pdf/math/0409604v1), §4, pp. 817–819.

<a id="dt2-unit-count-induction"></a>

### Unit-equation induction and numerical bounds

**Theorem.** With A(n,r)=exp((6n)^{3n}(r+1)) and B(n,r)=exp((5n)^{3n}(r+1)), the fibre count uses A(ℓ−1,r₁)A(n−ℓ+1,r₂)≤A(n−1,r) for 2≤ℓ≤n and r₁+r₂=r. Covering by B(n,r+1) proper subspaces and selecting at most 2ⁿ minimal zero relations gives 2ⁿA(n−1,r)B(n,r+1)<A(n,r) for n≥2. The coefficient vector may increase the group rank by one; it is not rank-neutral.

**Declaration:** `dt2_unit_count_induction`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-unit-count-induction`.

**Inputs:** [Rank exactness for the ratio projection](#dt2-ratio-rank-exact), [Preservation of nondegeneracy after merging a fibre](#dt2-merged-nondegeneracy), [Public conic perturbation cover and the parent ESS budget](#dt2-perturbation-cover).

**Proof outline.**

1. Use the rank sum and monotonicity of the explicit exponents to bound the two affine equations in each fibre.
2. For each proper covering subspace select a support-minimal homogeneous relation, then apply the previous nondegeneracy lemma and induction.
3. Check the exponential inequality for n=2 directly and use the fast growth of (6n)^{3n} for n>2. The n=1 affine equation has at most one solution.

**Check.** Handle n=1 separately. Check n=2 and rank zero explicitly; multiplying the coefficient vector into the group may add one to the rank.

**Sources.** [Linear equations in variables which lie in a multiplicative group](https://arxiv.org/pdf/math/0409604v1), §4, pp. 816–819.

<a id="dt2-finite-field-cover-transfer"></a>

### Finite-subset reduction to one number field

**Lemma.** To cover an arbitrary set of algebraic solutions by at most B proper subspaces it suffices that every finite subset admits such a cover in its common number field, with the same B. A cover of maximal dimension pattern and minimal remaining multiplicities is determined by finitely many spanning points; failure for another point contradicts its extremal choice. This removes the common-field restriction without using fixed-degree Northcott on all solutions.

**Declaration:** `dt2_finite_field_cover_transfer`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-finite-field-cover-transfer`.

**Inputs:** Elementary finite-dimensional span and finite-witness arguments; no arithmetic supplier hypothesis..

**Proof outline.**

1. Order finite unions of at most B subspaces by their dimensions and the finite witnesses spanning each maximal component.
2. Choose an extremal finite witness. Adjoin any allegedly uncovered point and use its finite-subset cover to improve the extremal pattern or force containment.
3. For a finite set of points and coefficients a common number field exists; the uniform constants may not depend on its degree.

**Check.** The finite witnesses must span the selected subspaces; a cover depending on the finite subset is sufficient only after proving the extremal-witness argument.

**Sources.** [Linear equations in variables which lie in a multiplicative group](https://arxiv.org/pdf/math/0409604v1), §6, Proposition 6.2 and proof, pp. 821–823.

<a id="dt2-symmetric-log-seminorm"></a>

### Symmetric logarithmic seminorm

**Definition.** For a finite family of real linear forms g_j on ℝʳ, define Ψ(t)=½Σ_j|g_j(t)|. In a finite-rank multiplicative parameterization, g_j are the local coordinate logarithms of chosen independent group elements. The product formula gives Ψ(u)=Σ_i h(α_i(u)) for integer exponent vectors. Ψ is a norm exactly when the common real kernel of the forms is zero.

**Declaration:** `dt2_symmetric_log_seminorm`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-symmetric-log-seminorm`.

**Inputs:** [Current-owner places and absolute height normalization](#dt2-place-normalization), `mathlib:LinearMap` (see the native-export table).

**Proof outline.**

1. The triangle inequality and absolute homogeneity follow termwise; zero is equivalent to every summand being zero.
2. For each multiplicative coordinate, Σ_v log|α_i|_v=0, hence its positive logarithm sum is half its absolute logarithm sum.

**Uses.** Finite-rank cone cover: Packing balls must use a genuine norm after proving kernel zero. Small-point packing: The inequality h(vector)≤Σ scalar heights≤n h(vector) relates this seminorm to toric height.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `symmetricLog_nonneg` | structure | Ψ(t)≥0. |
| `symmetricLog_smul` | compatibility | Ψ(a t)=\|a\|Ψ(t). |
| `symmetricLog_add` | relation | Ψ(t+u)≤Ψ(t)+Ψ(u). |
| `symmetricLog_zero_iff` | characterisation | Ψ(t)=0 iff every g_j(t)=0. |
| `symmetricLog_integerHeight` | compatibility | For group exponent vectors Ψ(u) is the sum of the absolute scalar logarithmic heights. |

**Unit tests.**

- **computation** (`test_symmetric_log_seminorm_1`): For forms Id and −Id on ℝ, Ψ(t)=|t|.
- **degenerate** (`test_symmetric_log_seminorm_2`): An empty family or the zero-dimensional parameter space has Ψ=0.
- **non-example** (`test_symmetric_log_seminorm_3`): On ℝ² with g₁(x,y)=x and g₂=−x, Ψ(0,1)=0: these forms do not define a norm.

**Check.** The empty family gives zero. A family with nonzero common kernel remains only a seminorm, even when no individual form is zero.

**Sources.** [Linear equations in variables which lie in a multiplicative group](https://arxiv.org/pdf/math/0409604v1), §7, equations (7.3)–(7.10), pp. 824–825.

<a id="dt2-log-norm-positivity"></a>

### Discreteness forces a genuine real norm

**Lemma.** For multiplicatively independent generators modulo torsion in a fixed number field, the logarithmic seminorm Ψ above has zero real kernel. Fixed-field Northcott and the height-zero torsion criterion first give a positive lower bound on Ψ(u) for nonzero u∈ℤʳ. If the real kernel were nonzero, simultaneous approximation to that kernel direction would produce nonzero integer vectors with Ψ arbitrarily small, a contradiction.

**Declaration:** `dt2_log_norm_positivity`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-log-norm-positivity`.

**Inputs:** [Symmetric logarithmic seminorm](#dt2-symmetric-log-seminorm), `mathlib:NumberField.finite_setOfPred_logHeight₁_le` (see the native-export table), [Height zero in a number field is torsion](#dt2-height-zero-torsion).

**Proof outline.**

1. A bounded-height ball in the exponent lattice injects into the fixed-field multiplicative tuple up to the finite torsion kernel.
2. Use Dirichlet simultaneous approximation on a nonzero real kernel direction and continuity of the finite family of linear forms.
3. No uniform degree-independent Dobrowolski estimate is used in this step.

**Check.** Distinguish an integer kernel from a real kernel. Use simultaneous approximation to exclude the latter after obtaining an integer positive gap from fixed-field Northcott.

**Sources.** [Linear equations in variables which lie in a multiplicative group](https://arxiv.org/pdf/math/0409604v1), §7, pp. 824–825.

<a id="dt2-cone-cover"></a>

### Packing cones in the finite-rank logarithmic space

**Lemma.** For rank r and q=4n, finitely many direction vectors cover the Ψ-unit sphere by balls of radius 1/q, with at most (2qn+4)^r choices. Every exponent vector lies in a cone with logarithmic coordinate error≤Ψ(u)/q and ρ(u)≤(n+1/q)Ψ(u). Separate the torsion factor, which has zero logarithm and is not represented by another real direction.

**Declaration:** `dt2_cone_cover`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-cone-cover`.

**Inputs:** [Discreteness forces a genuine real norm](#dt2-log-norm-positivity).

**Proof outline.**

1. Choose a maximal separated set in the Ψ-ball and compare disjoint half-radius balls with a dilated ambient ball by Lebesgue volume.
2. Normalize each nonzero parameter vector and approximate it by a selected direction. Multiply the direction error back by Ψ(u).
3. For r=0 take one cone containing only the torsion parameter.

**Check.** Rank zero has one cone; torsion has zero logarithm and does not create a new real direction. Packing uses the norm after its kernel is shown zero.

**Sources.** [Linear equations in variables which lie in a multiplicative group](https://arxiv.org/pdf/math/0409604v1), §8, pp. 825–827.

<a id="dt2-large-unit-height"></a>

### Large perturbed unit points have small twisted height

**Theorem.** For x=α z with α in a fixed finite-rank cone and h(z)≤h(α)/(8n), Σ_i x_i=1, h(x)>4n log n, choose among X₁,…,X_n,ΣX_i all but the locally largest form. Center the resulting local exponent weights, then divide by 4n+1. Their global sum is zero and total absolute weight is≤1. With Q=H(x)^{4n+1} and δ=1/(2n(4n+1)), one obtains H_Q(x)≤Q^{−δ} and Q>n^{2/δ}.

**Declaration:** `dt2_large_unit_height`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-large-unit-height`.

**Inputs:** [Packing cones in the finite-rank logarithmic space](#dt2-cone-cover), [Bounded intervals, systems and final subspace counts](#dt2-interval-assembly), [DiophantineApproximationAndTranscendence:DT.2/twisted-height](../packets/DiophantineApproximationAndTranscendence.json).

**Proof outline.**

1. Use the cone direction for α and bound the local discrepancy from z by its small logarithmic height.
2. Omit the locally maximal member of the n+1 forms to make every selected system independent. Center per place as well as globally before applying the parent normalized twisted-height theorem.
3. Apply the large-Q quantitative theorem on each cone. This yields at most 2^{2(n+9)²}(8n²+2n)^{n+4+r} proper subspaces.

**Check.** Locally omitting the largest of n+1 forms leaves n independent forms. Verify both per-place centering and the global weight sum, δ and Q>n^{2/δ}.

**Sources.** [Linear equations in variables which lie in a multiplicative group](https://arxiv.org/pdf/math/0409604v1), §9, pp. 827–829; av2009 Theorem 6.1 proof, §6.

<a id="dt2-toric-complexity"></a>

### Toric equation complexity and exceptional locus

**Definition.** For a proper reduced subvariety V⊂G_mⁿ over Q̄, δ(V) is the least positive degree allowing V to be cut out as a set by polynomials of at most that degree in the fixed projective embedding. δ₀(V) is the analogous incomplete-intersection degree: V is a union of isolated components of such an intersection. V⁰ removes every positive-dimensional torus coset contained in V. For irreducible V, μ_ess(V) is the infimum θ for which the points of height≤θ are Zariski dense. These definitions use h(x)=h(1:x₁:⋯:x_n), not the sum of the scalar heights.

**Declaration:** `dt2_toric_complexity`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-toric-complexity`.

**Inputs:** [SchemeAndStackFoundations:SF.4](../packets/SchemeAndStackFoundations.json), [Current-owner places and absolute height normalization](#dt2-place-normalization).

**Proof outline.**

1. Use the lower-tier variety, isolated-component, degree and stabilizer interfaces requested from SF.4; retain the fixed projective embedding.
2. Define V⁰ by the union of contained positive-dimensional cosets, rather than deleting every torsion point. The cited proof proves this union is closed via the ensuing descent.

**Uses.** Small-height bound: Degree budgets and the removal of contained cosets distinguish finitely many nondegenerate unit solutions from an infinite degenerate family.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `toricComplexity_mono` | relation | δ₀(V)≤δ(V), and δ₀(V)≤deg V for an irreducible V in the source embedding. |
| `toricExceptional_coset` | characterisation | A positive-dimensional torus coset has empty V⁰. |
| `toricExceptional_zeroDim` | simp | For zero-dimensional V, V⁰=V. |
| `toricHeight_compare` | compatibility | h(x)≤Σ_i h(x_i)≤n h(x). |
| `essentialMinimum_dense` | characterisation | For θ<μ_ess(V), the points with h≤θ are not dense. |

**Unit tests.**

- **degenerate** (`test_toric_complexity_1`): For a finite set of points no positive-dimensional coset is removed.
- **non-example** (`test_toric_complexity_2`): The hyperplane x+y=1 in G_m² contains no positive-dimensional torus coset and therefore V⁰=V.
- **computation** (`test_toric_complexity_3`): For the coset x=1 in G_m², V⁰ is empty although its points can have positive height.

**Check.** The coset x=1 has empty exceptional complement while the hyperplane x+y=1 does not. Heights use the fixed (1:x) embedding.

**Sources.** [Small points on subvarieties of a torus](https://hal.science/hal-00424769/document), §1 definitions, manuscript pp. 1–2; §3 notation, p. 8.

<a id="dt2-hilbert-multiplicity-bounds"></a>

### Hilbert-function lower and fat-point upper bounds

**Lemma.** Let A=K[x₀,…,x_n], with K a field and 0≤r≤min(m,n), and let J be a homogeneous ideal of codimension r containing the intersection of the isolated codimension-r primary components of an ideal generated in degrees d₁≥⋯≥d_m. For ν>Σ_{j≤r}d_j−r, H(A/J;ν)≥deg J·binomial(ν+n−Σ_{j≤r}d_j,n−r). For an irreducible d-dimensional projective V of degree D and fat-point order T, H(V,T;ν)≤binomial(T−1+n−d,n−d)binomial(ν+d,d)D. Use the corrected Chardin–Philippon notion of relative regularity, quantified over all parameter-sequence Koszul complexes; the original equivalence involving one complex is not valid.

**Declaration:** `dt2_hilbert_multiplicity_bounds`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-hilbert-multiplicity-bounds`.

**Inputs:** [SchemeAndStackFoundations:SF.4](../packets/SchemeAndStackFoundations.json), [SchemeAndStackFoundations:SF.2](../packets/SchemeAndStackFoundations.json).

**Proof outline.**

1. Import the generic Hilbert polynomial, primary components, Koszul/local-cohomology contracts through explicit lower-tier requests; do not cite higher-tier Heights R09 or Scheme K-theory operations.
2. Use the corrected relative-regularity lower bound of Chardin–Philippon. Its Corollary 3 remains valid under the published erratum.
3. For the fat-point upper bound filter by powers of the normal ideal; count monomials in the codimension many normal variables and bound each graded coefficient space by the degree/Hilbert upper bound.

**Check.** Require codim J=r and homogeneous ideals. The binomial lower bound is used only for ν above the stated regularity threshold; the fat-point factor uses codimension, not dimension.

**Sources.** [Small points on subvarieties of a torus](https://hal.science/hal-00424769/document), Proposition 3.3, Theorem 3.4 and Corollary 3.5, manuscript p. 11; Chardin–Philippon Corollary 3 and erratum; [Régularité et interpolation](https://webusers.imj-prg.fr/~marc.chardin/publications/textes/11.RI.pdf), Corollary 3, author preprint p. 7; [Erratum to Régularité et interpolation](https://webusers.imj-prg.fr/~marc.chardin/publications/textes/11.Err.pdf), Entire erratum, published pp. 599–600.

<a id="dt2-interpolation-determinant"></a>

### Torsion translation and interpolation determinant

**Theorem.** For irreducible V⊂G_mⁿ and a prime p, compare the monomial evaluation matrix on V with that on ker[p]·V. Its determinant polynomial of degree ν per row has order at least (L−H(V,T;ν))T on the diagonal evaluation locus. The p-adic estimate |1−ζ_p|_p≤p^{−1/(p−1)}, together with the product formula and Hadamard, gives μ_ess(V)≥(1−H(V,T;ν)/H(ker[p]V;ν))T log p/(pν)−n log(ν+1)/(2ν).

**Hypotheses.** Ambient dimension n≥2; the variety is proper and all complexity parameters use the fixed embedding and h(1:x₁:⋯:x_n). All remaining hypotheses are those in the exact statement.

**Declaration:** `dt2_interpolation_determinant`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-interpolation-determinant`.

**Inputs:** [Hilbert-function lower and fat-point upper bounds](#dt2-hilbert-multiplicity-bounds), [Local exterior-power norm and determinant bounds](#dt2-exterior-local-norm), [Toric equation complexity and exceptional locus](#dt2-toric-complexity).

**Proof outline.**

1. Choose monomials forming an evaluation basis on ker[p]V and make the interpolation determinant nonzero by independent evaluations.
2. At the diagonal, remove at most H(V,T;ν) independent jet rows; the remaining rows each contribute order T.
3. Translate by p-torsion at a place above p, exploit the local divisibility, and multiply the bounds over every place. Bound archimedean determinant coefficients by Hadamard. This replaces an ineffective gap principle with explicit degree data.

**Check.** The evaluation determinant must be nonzero before taking its height. The ratio H(V,T;ν)/H(ker[p]V;ν) is useful only when strictly below 1.

**Sources.** [Small points on subvarieties of a torus](https://hal.science/hal-00424769/document), Lemma 3.1 and Proposition 3.2, manuscript pp. 9–11.

<a id="dt2-toric-translate-degree"></a>

### Stabilizers and translation degree control

**Lemma.** For irreducible V and finite H⊂G_mⁿ, deg(HV)=|H/(H∩Stab V)|deg V and δ₀(HV)≤|H/(H∩Stab V)|δ₀(V). For H=ker[p], δ₀(HV)≤pⁿδ₀(V). A prime avoiding the finite component-group index of Stab V gives |H/(H∩Stab V)|≥p^{codim V+1} when V is not a torus coset. Also deg Stab V≤deg V·δ(V)^{dim V}.

**Hypotheses.** Ambient dimension n≥2; the variety is proper and all complexity parameters use the fixed embedding and h(1:x₁:⋯:x_n). All remaining hypotheses are those in the exact statement.

**Declaration:** `dt2_toric_translate_degree`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-toric-translate-degree`.

**Inputs:** [Toric equation complexity and exceptional locus](#dt2-toric-complexity), [SchemeAndStackFoundations:SF.4](../packets/SchemeAndStackFoundations.json), [Multiprojective degrees and the product criterion](#dt2-multiprojective-degree).

**Proof outline.**

1. Count distinct translates by stabilizer cosets, and multiply defining equations to bound incomplete-intersection complexity.
2. The connected stabilizer has dimension≤dim V; equality would make V a coset. Excluding primes dividing its finite component group yields the extra power of p.
3. Cut enough translates of V by equations of controlled degree and apply the geometric Bézout degree contract to its stabilizer.

**Check.** Count distinct translates by the stabilizer quotient. The extra p-power requires a noncoset and a prime not dividing the stabilizer component-group index.

**Sources.** [Small points on subvarieties of a torus](https://hal.science/hal-00424769/document), §3, equation (3.9) and Lemmas 3.6, 3.8–3.9, manuscript pp. 12–13.

<a id="dt2-small-point-cut"></a>

### Explicit small-point cut and relative descent

**Theorem.** For irreducible V of codimension k that is not a torus coset, θ₀=δ₀(V)[27n²log(n²δ₀(V))]^{kn} bounds the degree of a hypersurface containing all its points of height≤θ₀^{−1} without containing V. More generally for irreducible V₀⊂V₁, codimensions k₀≥k₁, put θ=δ(V₁)[200n⁵log(n²δ(V₁))]^{(k₀−k₁+1)k₀n}. Either V₀ lies in a torus coset B⊂V₁ with δ₀(B)≤θ, or a hypersurface of degree≤θ contains its height≤θ^{−1} points and does not contain V₀.

**Hypotheses.** Ambient dimension n≥2; the variety is proper and all complexity parameters use the fixed embedding and h(1:x₁:⋯:x_n). All remaining hypotheses are those in the exact statement.

**Declaration:** `dt2_small_point_cut`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-small-point-cut`.

**Inputs:** [Torsion translation and interpolation determinant](#dt2-interpolation-determinant), [Stabilizers and translation degree control](#dt2-toric-translate-degree), [Hilbert-function lower and fat-point upper bounds](#dt2-hilbert-multiplicity-bounds).

**Proof outline.**

1. Choose a prime in the prescribed interval avoiding the stabilizer component-group factors. The explicit short-prime interval estimate is recorded as a source gap until its quoted analytic input is independently read.
2. Apply the determinant lower bound with the source T,ν choices. Density of too-small points would contradict it; find the nonzero separating equation via the Hilbert-function bound.
3. For V₀⊂V₁ iterate proper hypersurface cuts and distinguish the coset case; codimension strictly increases, so the descent terminates.

**Check.** Use n≥2 and positive complexity; choose a prime avoiding the stabilizer factors. A separating hypersurface contains the small points but does not contain the whole noncoset component.

**Sources.** [Small points on subvarieties of a torus](https://hal.science/hal-00424769/document), Theorems 2.1–2.2, manuscript pp. 6–7; their proofs in §3 pp. 13–15 and §4 pp. 16–18.

**Open input.** Explicit short-prime interval estimate: AV2009 quotes Rosser–Schoenfeld estimates to choose a prime in the prescribed interval avoiding finitely many stabilizer factors. Read the primary analytic estimates and verify the small numerical cases and exclusion count used in Theorems 2.1–2.2; the quoted input is not yet decomposed.

<a id="dt2-small-point-degree-budget"></a>

### Coset decomposition with a weighted degree budget

**Theorem.** Let V⊊G_mⁿ be reduced, with components X_k,…,X_n grouped by codimension≥k, and θ=δ(V)[200n⁵log(n²δ(V))]^{(n−k)n(n−1)}. The Zariski closure of its height≤θ^{−1} points is a union of torus cosets G_k,…,G_n, and for k≤r≤n one has Σ_{i=k}^r θ^{r−i}deg G_i≤Σ_{i=k}^r θ^{r−i}deg X_i≤θ^r. In particular the small points of V⁰ form a finite set of cardinality≤θⁿ.

**Hypotheses.** Ambient dimension n≥2; the variety is proper and all complexity parameters use the fixed embedding and h(1:x₁:⋯:x_n). All remaining hypotheses are those in the exact statement.

**Declaration:** `dt2_small_point_degree_budget`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-small-point-degree-budget`.

**Inputs:** [Explicit small-point cut and relative descent](#dt2-small-point-cut), [Multiprojective degrees and the product criterion](#dt2-multiprojective-degree), [Toric equation complexity and exceptional locus](#dt2-toric-complexity).

**Proof outline.**

1. Maintain a list of components classified by codimension. Remove cosets and cut all remaining components with the preceding relative hypersurface estimate.
2. Bézout gives deg(new components)≤θ times the removed component degree, preserving the weighted budget at each codimension.
3. After at most n−k cuts every remaining noncoset component is zero-dimensional. Removal of positive-dimensional cosets then gives the cardinality statement.

**Check.** At each cut preserve the degree budget in its actual codimension. Positive-dimensional cosets must be removed before asserting a finite small-point set.

**Sources.** [Small points on subvarieties of a torus](https://hal.science/hal-00424769/document), Theorem 1.2, manuscript p. 3; proof §5 pp. 19–21.

<a id="dt2-small-unit-packing"></a>

### Small points in a finite-rank thickening

**Theorem.** For Γ of rank r, write Γ_ε={αz:α∈Γ, h(z)≤ε}. For C≥1 and 0≤ε≤(2θ)^{−1}, #({x∈V⁰∩Γ_ε:h(x)≤C})≤(5nC)^r θ^{n+r}, with θ as above. The estimate is absolute in the degree of the coordinates.

**Hypotheses.** Ambient dimension n≥2; the variety is proper and all complexity parameters use the fixed embedding and h(1:x₁:⋯:x_n). All remaining hypotheses are those in the exact statement.

**Declaration:** `dt2_small_unit_packing`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-small-unit-packing`.

**Inputs:** [Coset decomposition with a weighted degree budget](#dt2-small-point-degree-budget), [Discreteness forces a genuine real norm](#dt2-log-norm-positivity).

**Proof outline.**

1. In a fixed field parameterize Γ modulo torsion and pack the Ψ-ball of radius nC by balls of radius 1/(2θ); volume gives at most (5nCθ)^r centers.
2. Divide each point by a chosen center. The scalar-height comparison makes the residual height≤θ^{−1}; apply the translated variety small-point cardinality≤θⁿ.
3. Transfer the field-independent estimate by the finite-subset reduction. No fixed-degree bound is applied to Γ_ε itself.

**Check.** A translated variety may have a different height but the same degree complexity. Keep the radius 1/(2θ) and the inequality ε≤1/(2θ).

**Sources.** [Small points on subvarieties of a torus](https://hal.science/hal-00424769/document), Corollary 1.4, manuscript p. 5; proof §6 pp. 24–25.

<a id="dt2-perturbation-cover"></a>

### Public conic perturbation cover and the parent ESS budget

**Theorem.** For n≥2 and Γ⊂(Q̄*)ⁿ of finite rank r, all x=αz satisfying Σx_i=1 and h(z)≤(8n)^{−6n³}(1+h(α)) lie in at most (8n)^{6n³(n+r)} proper linear subspaces. This proves the parent ESS cover as well: n^{−1}exp(−(4n)^{3n})≤(8n)^{−6n³}, and (8n)^{6n³(n+r)}≤exp((5n)^{3n}(r+1)). The comparison must use the same vector height convention.

**Declaration:** `dt2_perturbation_cover`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-perturbation-cover`.

**Inputs:** [Large perturbed unit points have small twisted height](#dt2-large-unit-height), [Small points in a finite-rank thickening](#dt2-small-unit-packing), [Finite-subset reduction to one number field](#dt2-finite-field-cover-transfer).

**Proof outline.**

1. For large points the conic budget implies the h(z)≤h(α)/(8n) input, so the large-height twisted-height route covers them.
2. For small points h(α)≤5n². The hyperplane ΣX_i=1 has δ=1 and θ≤(8n)^{11n³/2}/4; the conic budget therefore lies inside the absolute thickening radius required by the small-point estimate.
3. Count nondegenerate small points using V⁰ and put degenerate points in the at most 2ⁿ proper zero-subsum hyperplanes. Check both numerical comparisons for n=2 and bound monotonically for n≥3.
4. This route proves the full perturbation target without the invalid numerical substitution in ESS (11.19) or the uncleared Schmidt 1996 chapter.

**Check.** Compare the AV and ESS budgets in the same vector-height convention; check n=2 numerically and rank zero without a strict small-height boundary shortcut.

**Sources.** [Small points on subvarieties of a torus](https://hal.science/hal-00424769/document), Theorem 6.1 and proof, manuscript pp. 25–26; ESS §11, author text printed p. 834.

<a id="dt2-refined-unit-counts"></a>

### Amoroso–Viada bounds for unit equations and simple recurrences

**Theorem.** For n≥2, rank r and nonzero coefficients, the number of nondegenerate solutions of Σa_ix_i=1 in Γ is≤(8n)^{4n⁴(n+r+1)}. For a simple recurrence of order n its zero set is a union of at most (8n)^{4n⁵} arithmetic progressions, including singletons; when it is nondegenerate this bounds the number of zeros. These improve, rather than replace by definition, the parent ESS end targets.

**Declaration:** `dt2_refined_unit_counts`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-refined-unit-counts`.

**Inputs:** [Public conic perturbation cover and the parent ESS budget](#dt2-perturbation-cover), [Rank exactness for the ratio projection](#dt2-ratio-rank-exact), [Preservation of nondegeneracy after merging a fibre](#dt2-merged-nondegeneracy), [Cyclic ratio fibres and intersections of progressions](#dt2-progression-fibres).

**Proof outline.**

1. Apply the same ratio/kernel induction with the AV cover and the displayed polynomial exponents; multiplying coefficients increases rank by at most one.
2. For cyclic recurrence root ratios use rank≤1 and the minimal vanishing-partition count, then pull back the ratio fibres to ℤ.
3. Specialize arbitrary characteristic-zero fields via the parent specialization theorem; distinct coefficients and the required nonvanishing conditions are preserved.

**Check.** Track rank+1 when absorbing coefficients. Simple roots are required for the stated progression count; repeated roots use the later polynomial-exponential argument.

**Sources.** [Small points on subvarieties of a torus](https://hal.science/hal-00424769/document), Theorem 6.2 and Corollary 6.3, manuscript pp. 26–27.

## The norm-form criterion

<a id="dt2-block-constant-algebra"></a>

### Block-constant subalgebra

**Definition.** For a finite index type I, field F and equivalence relation P on I, B_P is the F-subalgebra of F^I consisting of functions constant on each P-class. It contains the diagonal F and is isomorphic to F^{I/P}. Refining P increases B_P; intersecting such algebras corresponds to the equivalence relation generated by their relations. This light algebra is the stabilizer carrier in the norm-form argument.

**Declaration:** `dt2_block_constant_algebra`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-block-constant-algebra`.

**Inputs:** `mathlib:Subalgebra` (see the native-export table).

**Proof outline.**

1. Pointwise sum, product and scalar multiplication preserve constancy, giving an actual subalgebra.
2. A function on I/P pulls back uniquely to a block-constant function; quotient induction gives the algebra equivalence.
3. Constancy under all relations is constancy under their generated equivalence closure.

**Uses.** Norm-form exceptional cosets: Coordinatewise stabilizers of homogeneous linear solution patterns are precisely block-constant algebras.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `blockConstant_mem` | characterisation | f∈B_P iff i P j implies f(i)=f(j). |
| `blockConstant_quotient` | equivalence | B_P≃ₐ[F]F^{I/P}. |
| `blockConstant_refine` | relation | If P implies Q, then B_Q⊂B_P. |
| `blockConstant_inf` | compatibility | B_P∩B_Q=B_{P∨Q}, where P∨Q is equivalence closure of their union. |
| `blockConstant_units` | characterisation | A block-constant function is a unit iff its class values are all nonzero. |

**Unit tests.**

- **computation** (`test_block_constant_algebra_1`): For I={0,1,2} and classes {0,1},{2}, the functions are (a,a,b) and the algebra has dimension 2.
- **degenerate** (`test_block_constant_algebra_2`): The universal relation gives the diagonal algebra; equality gives the full product algebra.
- **non-example** (`test_block_constant_algebra_3`): For that two-block relation, (1,2,0) is not a member; (1,1,0) is a member but is not a unit.

**Check.** Check the two-block dimension and the two extreme partitions. Intersections use equivalence closure of the union, reversing refinement inclusion.

**Sources.** [The number of solutions of decomposable form equations](https://pub.math.leidenuniv.nl/~evertsejh/95-decforms.pdf), §§2–3, pp. 10–20, admissible partitions and associated algebras.

<a id="dt2-norm-fixed-ideal"></a>

### A fixed norm reduces to finitely many ordinary-unit cosets

**Lemma.** Let M⊂K be a finitely generated ℤ-module and c∈ℚ*. Choose D>0 with DM⊂O_K. If N_{K/ℚ}(ξ)=c then η=Dξ has fixed nonzero norm N=D^{[K:ℚ]}c∈ℤ. The principal ideal (η) has absolute ideal norm |N|, so the native fixed-ideal-norm finiteness theorem gives finitely many possibilities. In each nonempty ideal fibre choose η₀; then η=η₀u with u∈O_K*. Thus the original solution set lies in finitely many ordinary-unit cosets ξ₀O_K*.

**Declaration:** `dt2_norm_fixed_ideal`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-norm-fixed-ideal`.

**Inputs:** `mathlib:Ideal.finite_setOfPred_absNorm_eq` (see the native-export table), `mathlib:Ideal.absNorm_span_singleton` (see the native-export table), `tauceti:Set.unitEmptyEquivUnits` (see the native-export table).

**Proof outline.**

1. Clear the denominators of the finitely many generators. The ring of integers is a finite free ℤ-module and a Dedekind domain; native Ideal.absNorm_span_singleton identifies the principal-ideal norm with the absolute field norm.
2. Apply native Ideal.finite_setOfPred_absNorm_eq to |N|. Equality (η)=(η₀) makes η and η₀ associated in O_K; their quotient is an ordinary integral unit.
3. Enlarging S would change which subfields have finite units and would invalidate the intended criterion.

**Check.** For K=ℚ, fixed nonzero norm fixes ξ uniquely. The c=0 case is not included.

**Sources.** [The number of solutions of decomposable form equations](https://pub.math.leidenuniv.nl/~evertsejh/95-decforms.pdf), §1 norm-form reduction and §§2–3, pp. 5–8, 10–20.

<a id="dt2-unit-linear-cosets"></a>

### Homogeneous unit solutions give finitely many stabilizer cosets

**Lemma.** Let W⊂F^I be a linear subspace and Γ⊂(F*)^I finite rank. Then W∩Γ is contained in finitely many cosets uH_P, where u∈W∩Γ, H_P=Γ∩B_P*, and uB_P⊂W. Choose finitely many linear equations defining W; for each solution choose a minimal vanishing partition of each equation. Finite homogeneous ratios give finitely many normalized patterns, and their common constancy partition is P.

**Declaration:** `dt2_unit_linear_cosets`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-unit-linear-cosets`.

**Inputs:** [Block-constant subalgebra](#dt2-block-constant-algebra), [Amoroso–Viada bounds for unit equations and simple recurrences](#dt2-refined-unit-counts).

**Proof outline.**

1. For each minimal homogeneous block divide by one nonzero term. The resulting affine equation is nondegenerate in the ratio-image subgroup, whose rank is finite, so the new refined unit-count theorem gives finitely many coordinate-ratio patterns over F. The parent rational-only ratio lemma is not used for general F.
2. Intersect the resulting finitely many ratio patterns across the defining equations. Two solutions of one pattern differ by a block-constant unit.
3. Every independent block relation vanishes after multiplying its whole block by one scalar, so uB_P⊂W. Intersect patterns using the equivalence closure, not by asserting independent equations have identical partitions.

**Check.** A class pattern must satisfy every defining equation of W. After intersections use generated equivalence relations; arbitrary characteristic-zero F cannot use a rational-only ratio theorem.

**Sources.** [The number of solutions of decomposable form equations](https://pub.math.leidenuniv.nl/~evertsejh/95-decforms.pdf), §§2–3, admissible partitions and unit-equation reduction, pp. 10–20.

<a id="dt2-norm-galois-descent"></a>

### Galois-stable block algebras descend to subfields

**Lemma.** Embed K into a normal closure F by all ℚ-embeddings, ψ:K→F^I. Let V⊂K be a ℚ-subspace and u=ψ(ξ₀) with ξ₀≠0. Replace P by the equivalence closure of the union of P and all its Galois conjugates so uB_P⊂F⊗V and B_P is Galois-stable under the simultaneous permutation/semilinear action. Its invariants J=B_P^{Gal(F/ℚ)} are a ℚ-subalgebra of K; being a finite-dimensional domain, J is a subfield. One has ξ₀J⊂V, and the coset stabilizer inside O_K* is the unit group of O_J.

**Declaration:** `dt2_norm_galois_descent`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-norm-galois-descent`.

**Inputs:** [Homogeneous unit solutions give finitely many stabilizer cosets](#dt2-unit-linear-cosets), [DiophantineApproximationAndTranscendence:DT.2/embedding-vectors-linearly-independent](../packets/DiophantineApproximationAndTranscendence.json), [Block-constant subalgebra](#dt2-block-constant-algebra).

**Proof outline.**

1. Conjugating both u and the subspace condition is legitimate because u comes from ξ₀ and V is rational. Intersect the algebras of the conjugate partitions.
2. Galois descent identifies F⊗K with the embedding product and descends the stable subalgebra. Its invariants lie inside K, so the descended algebra has no zero divisors and is a field.
3. For x∈J, x∈O_K and x⁻¹∈O_K are equivalent to both being integral over ℤ, hence x∈O_J*. This establishes ordinary units of J, with no allowed-prime enlargement.

**Check.** Use the semilinear permutation action on all embeddings. Intersect conjugate block algebras, so the relation is coarsened; the invariant algebra lies inside K and is therefore a domain.

**Sources.** [The number of solutions of decomposable form equations](https://pub.math.leidenuniv.nl/~evertsejh/95-decforms.pdf), §3, associated fields and admissible subspaces, pp. 16–20.

<a id="dt2-norm-finiteness-assembly"></a>

### The hard direction of the norm-form criterion

**Theorem.** For a finitely generated M⊂K and V=ℚM, assume M contains no μO_J with μ∈K* and J⊂K whose ordinary unit group is infinite. Then each nonzero fixed norm equation N_{K/ℚ}(ξ)=c in M has finitely many solutions. Equivalently, using the parent unit-rank criterion, exclude subfields other than ℚ and imaginary quadratic fields. The hypothesis in terms of M is equivalent to excluding μJ⊂V with infinite units: clear the finitely many integral-basis denominators to pass between them.

**Declaration:** `dt2_norm_finiteness_assembly`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-norm-finiteness-assembly`.

**Inputs:** [A fixed norm reduces to finitely many ordinary-unit cosets](#dt2-norm-fixed-ideal), [Homogeneous unit solutions give finitely many stabilizer cosets](#dt2-unit-linear-cosets), [Galois-stable block algebras descend to subfields](#dt2-norm-galois-descent), [DiophantineApproximationAndTranscendence:DT.2/unit-group-infinite-criterion](../packets/DiophantineApproximationAndTranscendence.json).

**Proof outline.**

1. Fix each ideal/unit coset, apply the embedding product and homogeneous-unit coset decomposition.
2. Descend each stabilizer to a subfield J with ξ₀J⊂V. The hypothesis makes O_J* finite, so every coset supplies only finitely many solutions.
3. For μJ⊂ℚM, choose an integral basis of O_J and one common integer denominator expressing all μ-basis vectors in M; this gives dμO_J⊂M.
4. The easy direction already belongs to the parent: an infinite unit family in J has relative norm±1, so an index≤2 norm-one subgroup yields infinitely many equal norms.

**Check.** Clear denominators in a finite basis of O_J to compare μJ⊂ℚM with dμO_J⊂M. The stabilizer consists of ordinary units, preserving the imaginary-quadratic boundary.

**Sources.** [The number of solutions of decomposable form equations](https://pub.math.leidenuniv.nl/~evertsejh/95-decforms.pdf), Norm-form consequences of the decomposable-form theorem, §§1–3, pp. 5–8, 10–20.

## Recurrence zeros, including repeated roots

<a id="dt2-polynomial-exponential-bridge"></a>

### Native recurrences and polynomial-exponential normal form

**Comparison.** Over an algebraically closed characteristic-zero field, a two-sided recurrence with nonzero constant companion coefficient is Σ_i P_i(k)α_i^k with distinct α_i≠0 and Σ_i(deg P_i+1)=t for the minimal order t. A native ℕ-indexed LinearRecurrence solution with nonzero constant coefficient extends uniquely to ℤ by solving backwards. The native characteristic polynomial orders coefficients as X^t−Σ coeffs(i)X^i; preserve that convention.

**Declaration:** `dt2_polynomial_exponential_bridge`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-polynomial-exponential-bridge`.

**Inputs:** `mathlib:LinearRecurrence` (see the native-export table), `mathlib:LinearRecurrence.IsSolution` (see the native-export table), `mathlib:LinearRecurrence.charPoly` (see the native-export table), `mathlib:LinearRecurrence.geom_sol_iff_root_charPoly` (see the native-export table), [Polynomial-geometric basis from finite differences](#dt2-finite-difference-basis).

**Proof outline.**

1. Use the finite-difference basis theorem on the companion shift. Each repeated root gives a polynomial times a geometric sequence; characteristic zero identifies its polynomial degree with multiplicity minus one.
2. Invertibility of the shift follows from the nonzero constant coefficient and gives unique backwards extension.
3. A zero root in a native recurrence can create a finite transient segment; remove it first and account for at most the order many initial positions rather than claiming every native solution extends.

**Check.** For (X−2)² a solution is (a+bk)2^k, not a sum of two distinct geometric roots. The zero sequence has minimal order 0 and is excluded from nondegenerate finite-zero statements.

**Sources.** [Zeros of linear recurrence sequences](https://publi.math.unideb.hu/paper/608/download/10_5486_PMD_2000_2336.pdf), §1, pp. 609–612; av2011published §1, pp. 387–389.

<a id="dt2-finite-difference-basis"></a>

### Polynomial-geometric basis from finite differences

**Theorem.** For distinct nonzero α_i and multiplicities t_i>0 over a characteristic-zero field, the sequences k↦k^jα_i^k, 0≤j<t_i, are linearly independent and annihilated by ∏_i(shift−α_i)^{t_i}. They form a basis of the native solution space for that companion polynomial, of dimension Σt_i.

**Declaration:** `dt2_finite_difference_basis`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-finite-difference-basis`.

**Inputs:** `mathlib:LinearRecurrence.solSpace_rank` (see the native-export table), `mathlib:LinearRecurrence.charPoly` (see the native-export table), `mathlib:LinearRecurrence.geom_sol_iff_root_charPoly` (see the native-export table).

**Proof outline.**

1. The operator shift−α lowers the degree of P(k)α^k by one when its root matches; for a different root it preserves the leading degree with nonzero leading scalar.
2. To isolate one root group apply the annihilators of all other groups. A nonzero polynomial over a characteristic-zero field cannot vanish at all natural integers, proving independence.
3. The native solution-space rank then gives spanning. Invertible constant coefficient allows extension backwards without a generic Jordan-form dependency.

**Check.** For (X−2)² the basis is 2^k and k2^k. Distinct-root annihilators preserve the other polynomial leading degree; the dimension is the sum of multiplicities.

**Sources.** [Zeros of linear recurrence sequences](https://publi.math.unideb.hu/paper/608/download/10_5486_PMD_2000_2336.pdf), §1, equations (1.2)–(1.3), pp. 609–610.

<a id="dt2-progression-fibres"></a>

### Cyclic ratio fibres and intersections of progressions

**Lemma.** For φ:ℤ→(F*)^{n−1}, φ(k)=((α₂/α₁)^k,…,(α_n/α₁)^k), every nonempty fibre is a coset of ker φ=dℤ with d≥0. The case d=0 is a singleton, not an empty progression. Finite intersections of such cosets are empty or one coset of the intersection subgroup; for positive moduli the resulting modulus is the lcm. Pullback along a cyclic homomorphism is treated the same way.

**Declaration:** `dt2_progression_fibres`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-progression-fibres`.

**Inputs:** [DiophantineApproximationAndTranscendence:DT.2/nondegenerate-linear-recurrence](../packets/DiophantineApproximationAndTranscendence.json).

**Proof outline.**

1. Apply subgroup classification in ℤ and coset equality. Use the Chinese-remainder compatibility criterion for nonempty intersections.
2. Separate zero modulus before taking an lcm; intersecting a singleton with any progression is a singleton or empty.

**Check.** Even integers intersect 3ℤ in 6ℤ. The fibres of k↦2^k in ℚ* are singletons. 2ℤ and 1+2ℤ have empty intersection.

**Sources.** [Linear equations in variables which lie in a multiplicative group](https://arxiv.org/pdf/math/0409604v1), §5, pp. 819–821; schmidt2000 §3, pp. 617–619.

<a id="dt2-simple-zero-assembly"></a>

### Simple recurrence zeros from unit fibres

**Application.** For a simple recurrence Σ_{i=1}^n a_iα_i^k, α_i distinct nonzero and a_i nonzero, minimal vanishing partitions and the affine unit bound cover the zero set by at most W(n)=exp((6n)^{3n}) arithmetic progressions, including singletons. In the nondegenerate case all progressions are singletons: otherwise restriction to an infinite progression would contradict the Vandermonde determinant for distinct powered roots.

**Declaration:** `dt2_simple_zero_assembly`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-simple-zero-assembly`.

**Inputs:** [Unit-equation induction and numerical bounds](#dt2-unit-count-induction), [Cyclic ratio fibres and intersections of progressions](#dt2-progression-fibres), `mathlib:Matrix.det_vandermonde_ne_zero_iff` (see the native-export table).

**Proof outline.**

1. For each support-minimal homogeneous zero relation normalize by one term and apply A(n−1,1). Pull its finite ratio fibres back through the cyclic root-ratio map.
2. Intersect fibres across the blocks of a vanishing partition; count partitions and use the source numerical inequality giving W(n).
3. On an infinite progression, powered distinct roots stay distinct under nondegeneracy; evaluating enough consecutive progression points gives an invertible Vandermonde matrix.

**Check.** The sequence 2^k−(−2)^k has the progression 2ℤ of zeros; nondegenerate root ratios instead force every fibre to be a singleton.

**Sources.** [Linear equations in variables which lie in a multiplicative group](https://arxiv.org/pdf/math/0409604v1), Theorem 1.2 and §5, pp. 809–810, 819–821.

<a id="dt2-rational-perturbation"></a>

### Rational polynomial factors in a homogeneous unit relation

**Lemma.** Let x∈Γ⊂(Q̄*)^q have rank r and y∈(ℚ*)^q with h(y)≤h(x)/(4q²). The nondegenerate solutions of Σa_ix_iy_i=0 lie in fewer than C(q,r)=(8q)^{4(q−1)⁴(q+r)} proper projective subspaces. For large x use the cone/twisted-height cover; for small x a nontrivial rational y-coordinate ratio has height≥log 2, so the permitted y has only torsion ratios and the unperturbed unit theorem applies.

**Declaration:** `dt2_rational_perturbation`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-rational-perturbation`.

**Inputs:** [Large perturbed unit points have small twisted height](#dt2-large-unit-height), [Amoroso–Viada bounds for unit equations and simple recurrences](#dt2-refined-unit-counts), [Finite-subset reduction to one number field](#dt2-finite-field-cover-transfer).

**Proof outline.**

1. Normalize the homogeneous equation by one term to q−1 affine coordinates, controlling the perturbation-height change.
2. Use the rational-height gap in the small range and the source cone constants in the large range.
3. This rational perturbation is not the much smaller ESS arbitrary-algebraic perturbation budget; distinguish the two statements.

**Check.** A non-torsion rational coordinate ratio has logarithmic height at least log 2. This budget is different from the arbitrary algebraic perturbation budget.

**Sources.** [On the zeros of linear recurrence sequences](https://www.impan.pl/shop/en/publication/transaction/download/product/83761), Lemma 2.2, pp. 390–391; schmidt1999 Lemma 5, pp. 247–249.

<a id="dt2-recurrence-degree-lowering"></a>

### Lowering the polynomial degree after a height gap

**Lemma.** For a nonzero polynomial vector P=(P₁,…,P_k), t=Σ_i(deg P_i+1), a=max_i(deg P_i+1), with t≥3, suppose some root ratio has h(α_i/α_j)≥ℏ>0. Put E=16t²a/ℏ and F=C(t,2)+5E log E. The zeros of ΣP_i(k)α_i^k lie in the union of fewer than F zero sets of nonzero polynomial vectors P^(w) with no increased degrees and with strictly smaller total t. The source chooses one component whose degree strictly drops.

**Declaration:** `dt2_recurrence_degree_lowering`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-recurrence-degree-lowering`.

**Inputs:** [Rational polynomial factors in a homogeneous unit relation](#dt2-rational-perturbation), [Symmetric logarithmic seminorm](#dt2-symmetric-log-seminorm).

**Proof outline.**

1. Translate the index so the height of the exponential vector grows at least linearly, by convexity of its logarithmic norm.
2. Expand every polynomial coefficient into monomial coordinates; the exponential vector has rank≤2 and the rational polynomial-factor height grows only logarithmically in |k|.
3. Outside |k|≤5E log E the rational perturbation lemma supplies a proper relation among the leading coefficient coordinates, eliminating one leading term. Put the bounded range into individual lower-degree equations.

**Check.** Each auxiliary coefficient vector is nonzero, has no increased component degree and strictly smaller total degree-plus-one. Account separately for the finite central interval.

**Sources.** [On the zeros of linear recurrence sequences](https://www.impan.pl/shop/en/publication/transaction/download/product/83761), Lemma 2.3, pp. 391–392; schmidt1999 Lemmas 6–7, pp. 249–251.

<a id="dt2-recurrence-splitting"></a>

### Splitting exponential sums by root-of-unity classes

**Lemma.** For f(k)=Σ_{i=1}^q a_iα_i^k with a_i≠0, group the roots by α_i/α_j of finite order. Except for fewer than G(q)=(8q)^{4(q−1)³q²} integer zeros, each root-of-unity class sum vanishes separately. The projective unit-equation bound controls the exceptional zeros by induction on minimal vanishing supports.

**Declaration:** `dt2_recurrence_splitting`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-recurrence-splitting`.

**Inputs:** [Amoroso–Viada bounds for unit equations and simple recurrences](#dt2-refined-unit-counts), [Cyclic ratio fibres and intersections of progressions](#dt2-progression-fibres).

**Proof outline.**

1. Select a support-minimal vanishing subsum. If it crosses two root-of-unity classes, apply the homogeneous rank-one unit bound to its finite projective ratio set.
2. Remove that exceptional set and split the remaining equation inside classes; induct on q, bounding all support choices by G(q).

**Check.** Split only genuinely disconnected supports; a dependence within a connected support must lead to a strictly smaller coefficient complexity.

**Sources.** [On the zeros of linear recurrence sequences](https://www.impan.pl/shop/en/publication/transaction/download/product/83761), Lemma 2.4, p. 392; schmidt1999 §6, pp. 253–254.

<a id="dt2-explicit-degree-height"></a>

### Explicit non-torsion height and conjugacy-class refinement

**Theorem.** For a nonzero algebraic number β that is not a root of unity, of degree d≥2, d h(β)>(1/4)(log log d/log d)³. The weaker bound h(β)≥1/(4d(log⁺d)³), with log⁺x=max(1,log x), also includes d=1 by h(β)≥log 2. If its d conjugates form m equal-size classes modulo roots of unity, then h(β)≥1/(4d(log⁺m)³): the product of one class has degree≤m, is not torsion and has height≤(d/m)h(β). This is the quantitative height input for Schmidt’s conjugate selection.

**Declaration:** `dt2_explicit_degree_height`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-explicit-degree-height`.

**Inputs:** [Current-owner places and absolute height normalization](#dt2-place-normalization), [Height zero in a number field is torsion](#dt2-height-zero-torsion).

**Proof outline.**

1. For Voutier’s bound, first reduce nonintegral numbers using their leading coefficient and reduce degree when powering causes conjugate collisions. For the remaining integral case form the confluent Vandermonde matrix at conjugates and their first-prime powers, with multiplicities k and 1.
2. Its square is a nonzero rational integer. The determinant product formula and Fermat congruences give divisibility by (p₁⋯p_s)^{2dk}; discriminant factors supply the second lower bound. Hadamard and the factorial product give the upper bound in terms of the Mahler measure.
3. Compare the two bounds with (k,s)=(7,11),(8,14),(7,17) in the finite degree ranges, and k≈k₁ log d/log log d, s≈s₁(log d/log log d)² for d>10000. The primary proof was read; its external prime estimates, Odlyzko bound, degree-reduction lemma and low-degree computations remain the explicit gap, rather than pretending they follow from Northcott.
4. For the class refinement use Galois transitivity to prove equal class sizes. The class product has at most m conjugates; if it were torsion, β^{d/m} would be torsion. Apply the weaker degree bound to this product and divide its upper height estimate by d/m.

**Check.** At d=2 the expression with log log d is negative, so use h≥1/(4d(log⁺d)³) only after verifying the low-degree cases, not by dropping log log d. The class-product degree can be 1: include the rational lower bound log 2. The class-refined denominator is d(log⁺m)³, not m(log⁺m)³.

**Sources.** [An effective lower bound for the height of algebraic numbers](https://matwbn.icm.edu.pl/ksiazki/aa/aa74/aa7417.pdf), Main theorem p. 83; Lemmas 1–8, pp. 84–90; proof pp. 90–94; Schmidt 1999 Lemmas 10–11, pp. 259–260; [The zero multiplicity of linear recurrence sequences](https://archive.ymsc.tsinghua.edu.cn/pacm_download/117/6578-11511_2006_Article_BF02392575.pdf), Lemmas 10–11, printed pp. 259–260.

**Open input.** External inputs to the explicit non-torsion height bound: Voutier 1996 pp. 81–95 and Schmidt Lemma 11 were read in full. Voutier quotes Robin prime-product estimates and Rosser–Schoenfeld prime upper bounds (Lemma 2), Poitou/Odlyzko log|D_K|>3.108d−8.6d^(1/3) (Lemma 4), the degree-reduction lemma for conjugate collisions (proof p. 91), and Smyth/Boyd low-degree Mahler-measure results (degrees≤21). Read or independently establish these precise contracts, including certified finite-degree numerical checks; the determinant proof alone does not close this branch.

<a id="dt2-recurrence-conjugate-selection"></a>

### Conjugate determinants and denominator selection

**Lemma.** For Q-independent forms M₁,…,M_n with algebraic coefficient rows a_i of trailing support t_i, set T=min(kⁿ,e^{12Σt_i}). Every determinant of conjugate evaluations has at most T nonzero monomials. From its conjugate embedding tree one can select 3T embeddings at each branch so every triple of distinct selected conjugates of a root ratio β generates a group of size>T^{−11T³}deg β if β is not torsion, or>T^{−11T³}ord β if β is torsion. This is the combinatorial and Galois input to the class-modulus proposition.

**Declaration:** `dt2_recurrence_conjugate_selection`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-recurrence-conjugate-selection`.

**Inputs:** [Splitting exponential sums by root-of-unity classes](#dt2-recurrence-splitting), [Cyclic ratio fibres and intersections of progressions](#dt2-progression-fibres), [DiophantineApproximationAndTranscendence:DT.2/specialization-to-algebraic-numbers](../packets/DiophantineApproximationAndTranscendence.json), [Explicit non-torsion height and conjugacy-class refinement](#dt2-explicit-degree-height).

**Proof outline.**

1. Count ordered independent coefficient-row tuples by dyadic trailing-support sizes: the total is<e^{12Σt_i}, and is trivially≤kⁿ.
2. Expand conjugate determinants; the embeddings escaping a proper rational coefficient subspace give the branching lower bound. Product-class heights and the explicit height lower bound for a non-root of unity yield the non-torsion estimate.
3. For roots of unity, count triples of rational phase denominators with small lcm: the bad fraction is≤11ε^{1/2}; for 3T-tuples a union bound is<2ε^{1/2}(3T)³. Choose ε=T^{−10T³} and exclude repeated embeddings.
4. The non-torsion degree-height input is the explicit-degree-height node. Voutier’s determinant proof was read; its precise external inputs remain the recorded gap. Do not treat torsion and non-torsion denominator bounds as one case.

**Check.** Count bad embedding tuples uniformly in the number-field degree. The nontorsion height bound remains conditional on its explicit external-input gap.

**Sources.** [Zeros of linear recurrence sequences](https://publi.math.unideb.hu/paper/608/download/10_5486_PMD_2000_2336.pdf), Lemmas 2–5 and §§4–7, pp. 620–630; schmidt1999 §§7–11 and Appendix, pp. 255–282.

**Open input.** External inputs to the explicit non-torsion height bound: Voutier 1996 pp. 81–95 and Schmidt Lemma 11 were read in full. Voutier quotes Robin prime-product estimates and Rosser–Schoenfeld prime upper bounds (Lemma 2), Poitou/Odlyzko log|D_K|>3.108d−8.6d^(1/3) (Lemma 4), the degree-reduction lemma for conjugate collisions (proof p. 91), and Smyth/Boyd low-degree Mahler-measure results (degrees≤21). Read or independently establish these precise contracts, including certified finite-degree numerical checks; the determinant proof alone does not close this branch.

<a id="dt2-recurrence-class-modulus"></a>

### Corrected class-modulus proposition

**Theorem.** Let Q-independent forms M_j have nonzero coefficient rows a_i with trailing support lengths t_i, let T=min(kⁿ,e^{12Σt_i}), ℏ=e^{−6T⁴}, and α_i≠0 algebraic. The integers x for which M₁(α^x),…,M_n(α^x) are Q-dependent belong to fewer than H(T)=(8T)^{4(T−1)T⁴} classes. Each class has a modulus m≥1 with all x congruent modulo m, and some i≠j such that either α_i/α_j is not torsion and h(α_i^m/α_j^m)≥ℏ, or it is torsion and ord(α_i^m/α_j^m)≤ℏ^{−1}. Both the dependence condition and the m in the height bound correct the published AV statement.

**Declaration:** `dt2_recurrence_class_modulus`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-recurrence-class-modulus`.

**Inputs:** [Conjugate determinants and denominator selection](#dt2-recurrence-conjugate-selection), [Splitting exponential sums by root-of-unity classes](#dt2-recurrence-splitting), [Amoroso–Viada bounds for unit equations and simple recurrences](#dt2-refined-unit-counts).

**Proof outline.**

1. Dependence forces every conjugate determinant to vanish. Apply the splitting lemma to each selected determinant and isolate the distinguished monomial.
2. Classify the chosen three-element embedding branches, common minimal supports and projective unit ratios. Comparing two indices in the same class makes their difference divisible by the order m of the generated finite group.
3. The preceding triple-group lower bound and the non-torsion degree-height bound imply h(β^m)=m h(β)>ℏ; in the torsion case m divides ord β and the residual order is≤ℏ^{−1}.
4. Use the improved C,G bounds in the original Schmidt count to obtain H(T); exceptional singletons may take a sufficiently large m.

**Check.** For n=1, dependence means the single evaluated form is zero. Independence would concern all nonzero values and cannot support the induction. The lower bound on h(β^m) gives no corresponding lower bound on h(β).

**Sources.** [On the zeros of linear recurrence sequences](https://www.impan.pl/shop/en/publication/transaction/download/product/83761), Proposition 2.5 and proof, pp. 392–394; schmidt2000 Proposition p. 616 and conclusion p. 630; [Zeros of linear recurrence sequences](https://publi.math.unideb.hu/paper/608/download/10_5486_PMD_2000_2336.pdf), Proposition p. 616 and conclusion p. 630.

<a id="dt2-finite-progression-obstruction"></a>

### Finite obstruction to lowering a progression count

**Lemma.** For Z⊂ℤ a finite union of two-sided arithmetic progressions and singletons, let ν(Z) be its least number of such pieces. There is a finite T⊂ℤ outside Z such that every finite union Z′⊃Z with Z′∩T=∅ satisfies ν(Z′)≥ν(Z). This lower bound, rather than equality for arbitrary supersets, is the contract needed for specialization.

**Declaration:** `dt2_finite_progression_obstruction`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-finite-progression-obstruction`.

**Inputs:** [Cyclic ratio fibres and intersections of progressions](#dt2-progression-fibres).

**Proof outline.**

1. Choose a minimal representation with isolated points Z₁ and periodic part Z₂. For each pair of isolated points, exclude one nonzero-set point on the progression through that pair, so a progression avoiding T contains at most one isolated point.
2. If Z₂ has period q, put ℓ=qν(Z). In a translated interval of length qℓ disjoint from Z₁, exclude all points outside Z₂. Every progression of modulus≤ℓ avoiding this finite set lies in Z₂.
3. Suppose Z′ had fewer than ν(Z) pieces. Replace progressions disjoint from Z₂ by their at most one isolated point; enlarge the small-modulus progressions inside Z₂ to moduli dividing q. Their periodic union must fill Z₂: otherwise its density is short by at least 1/q, and the remaining fewer than ν(Z) progressions each have density<1/ℓ.
4. The periodic pieces therefore need at least ν(Z₂) pieces, and every remaining piece covers at most one isolated point. Their total is at least ν(Z), a contradiction. This proves the stated lower bound.

**Check.** For Z={0} one can take T empty; Z′={0,1} shows why the conclusion is a lower bound rather than equality. For Z=2ℤ∪3ℤ, the obstruction protects a least cover by two independent moduli; it does not prescribe one common modulus.

**Sources.** [Zeros of linear recurrence sequences](https://publi.math.unideb.hu/paper/608/download/10_5486_PMD_2000_2336.pdf), §2, Lemma 1 and proof, pp. 613–615.

<a id="dt2-recurrence-refined-count"></a>

### Refined counts for multiple-root recurrences

**Theorem.** Let a nonzero recurrence over an algebraically closed characteristic-zero field have minimal order t≥1, k distinct nonzero roots and maximum root multiplicity a. Its integer zero set is a union of at most exp(exp(70t)) arithmetic progressions, including singletons. If no quotient of distinct roots is a root of unity, it has at most (8k^a)^{8k^{6a}} zeros, also≤exp(32a k^{6a}log k) for k≥2. For k=1 there are at most a−1 zeros. No common progression modulus is required.

**Declaration:** `dt2_recurrence_refined_count`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-recurrence-refined-count`.

**Inputs:** [Native recurrences and polynomial-exponential normal form](#dt2-polynomial-exponential-bridge), [Corrected class-modulus proposition](#dt2-recurrence-class-modulus), [Lowering the polynomial degree after a height gap](#dt2-recurrence-degree-lowering), [Cyclic ratio fibres and intersections of progressions](#dt2-progression-fibres), [Finite obstruction to lowering a progression count](#dt2-finite-progression-obstruction), [DiophantineApproximationAndTranscendence:DT.2/specialization-to-algebraic-numbers](../packets/DiophantineApproximationAndTranscendence.json), [SchemeAndStackFoundations:SF.4](../packets/SchemeAndStackFoundations.json).

**Proof outline.**

1. Expand the coefficient polynomials in a Q-basis to get independent forms; fewer than a exceptional indices make all coefficient polynomials vanish.
2. On a class x=x₀+my, replace roots by α_i^m. In the torsion case split into at most ℏ^{−1} residue classes and merge equal powered roots, decreasing t.
3. In the non-torsion case use degree lowering. An infinite progression from a lower-degree auxiliary equation need not be wholly inside the original zero set: restrict the original equation to it and merge equal powered roots before the second induction. This explains the square in Z(t,T).
4. The general induction uses Z(t,T)=(8T)^{(2^t−1)8T⁵}; the nondegenerate induction uses (8T)^{8T⁵t} without the square. Substitute T≤e^{12t} or T≤k^a respectively.
5. First transfer the nondegenerate bound to arbitrary characteristic-zero coefficients using Schmidt1999 §2, Lemma 1, pp.246–247. The rank-deficiency equations for a nonzero polynomial vector vanishing on its whole zero set define a variety over ℚ, even for an infinite zero set, by Noetherianity. On a ℚ-irreducible component of degree A, generic rational linear sections give an algebraic point of degree≤A outside any finite union of proper closed subsets.
6. The root-ratio hypersurface for exact torsion order m forces point degree≥φ(m). Since φ(m)→∞, only finitely many such hypersurfaces can contain a point of degree≤A. Exclude these finitely many and the zero-root locus before taking the section. Solve the remaining nonzero coefficient kernel over its number field. This preserves all original zeros and nondegeneracy, without claiming to preserve every nonzero value.
7. For general roots, let q be the lcm of the orders of torsion root ratios. On each residue modulo q merge equal powered roots. Either the merged coefficient polynomials all vanish identically, yielding a whole progression, or their non-torsion ratios and the just-transferred nondegenerate theorem give finitely many zeros. This establishes qualitative SML within this proof, before using it in specialization.
8. Apply the finite-progression-obstruction node to that zero set. The parent specialization lemma, with inverses of the roots, leading coefficients and finitely many values indexed by T adjoined, preserves the order and those nonzero values; every original zero is preserved by the ring homomorphism. The specialized zero set contains the original and avoids T, so its least progression count is at least the original count. Apply the algebraic general bound. The finitely generated coefficient field embeds in ℂ, extending the argument to any characteristic-zero field.

**Check.** For (1−ζ_r^x)(1−ζ_s^x), gcd(r,s)=1, the zero set is rℤ∪sℤ and need not admit a small equal-modulus representation. For (x−3)2^x, k=1,a=2 and the zero set is the singleton {3}.

**Sources.** [On the zeros of linear recurrence sequences](https://www.impan.pl/shop/en/publication/transaction/download/product/83761), Theorems 1.1–1.2 and §3, pp. 388–389, 393–396; schmidt2000 §§2–3, pp. 613–619.

## Native exports and checked versions

Mathlib pin `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti pin `f790474821cf4256814db967cb154e7af3d0c369`. Each declaration and its active hypotheses was read at these pins. The shared compile wrapper attests the Tau Ceti pin and the Mathlib manifest matches it.

| Declaration | Existing export used here | Pinned module |
| --- | --- | --- |
| `mathlib:Height.logHeight₁_zpow` | For nonzero x and integer m, native logarithmic scalar height of x^m is \|m\| times that of x. | [Mathlib/NumberTheory/Height/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/Height/Basic.lean) |
| `mathlib:Ideal.absNorm_span_singleton` | For a finite free ℤ-algebra that is a Dedekind domain, the norm of (r) is natAbs of Algebra.norm ℤ r; used for O_K. | [Mathlib/RingTheory/Ideal/Norm/AbsNorm.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Ideal/Norm/AbsNorm.lean) |
| `mathlib:Ideal.finite_setOfPred_absNorm_eq` | Integral ideals of specified natural absolute norm form a finite set in the finite free ℤ Dedekind algebra O_K. | [Mathlib/RingTheory/Ideal/Norm/AbsNorm.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Ideal/Norm/AbsNorm.lean) |
| `mathlib:LinearMap` | Bundled semilinear maps over a ring homomorphism between semiring modules; real-linear forms use the identity homomorphism. | [Mathlib/Algebra/Module/LinearMap/Defs.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Module/LinearMap/Defs.lean) |
| `mathlib:LinearRecurrence` | Order and coefficient data for native one-sided linear recurrences. | [Mathlib/Algebra/LinearRecurrence.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/LinearRecurrence.lean) |
| `mathlib:LinearRecurrence.IsSolution` | The predicate u(n+order)=Σ coeff_i u(n+i) over the native scalar module. | [Mathlib/Algebra/LinearRecurrence.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/LinearRecurrence.lean) |
| `mathlib:LinearRecurrence.charPoly` | The monic companion polynomial X^order−Σ coeff_i X^i. | [Mathlib/Algebra/LinearRecurrence.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/LinearRecurrence.lean) |
| `mathlib:LinearRecurrence.geom_sol_iff_root_charPoly` | A geometric sequence solves the recurrence exactly when its scalar is a characteristic-polynomial root. | [Mathlib/Algebra/LinearRecurrence.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/LinearRecurrence.lean) |
| `mathlib:LinearRecurrence.solSpace_rank` | The native solution module has rank equal to the recurrence order; gives spanning after an independent normal-form family. | [Mathlib/Algebra/LinearRecurrence.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/LinearRecurrence.lean) |
| `mathlib:Matrix.det_vandermonde_ne_zero_iff` | Over a field, the Vandermonde determinant is nonzero exactly when its node family is injective. | [Mathlib/LinearAlgebra/Vandermonde.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Vandermonde.lean) |
| `mathlib:NumberField.Units.instZLattice_unitLattice` | Native ordinary-unit logarithmic image is a full discrete ℤ-lattice in the chosen reduced real coordinate space. | [Mathlib/NumberTheory/NumberField/Units/DirichletTheorem.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/NumberField/Units/DirichletTheorem.lean) |
| `mathlib:NumberField.Units.unitLattice` | The ordinary-unit logarithmic image after deleting the distinguished infinite coordinate; S-unit finite valuation directions are extra. | [Mathlib/NumberTheory/NumberField/Units/DirichletTheorem.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/NumberField/Units/DirichletTheorem.lean) |
| `mathlib:NumberField.finite_setOfPred_logHeight₁_le` | A fixed number field has only finitely many scalar elements below any fixed native logarithmic-height bound. | [Mathlib/NumberTheory/Height/NumberField.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/Height/NumberField.lean) |
| `mathlib:NumberField.mulHeight_eq` | Native projective sup height is the infinite-place product with multiplicities times the finite-place product; it is not degree-normalized. | [Mathlib/NumberTheory/Height/NumberField.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/Height/NumberField.lean) |
| `mathlib:NumberField.totalWeight_eq_finrank` | The total native height weight equals the degree over ℚ; divide logarithmic heights by this degree. | [Mathlib/NumberTheory/Height/NumberField.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/Height/NumberField.lean) |
| `mathlib:Subalgebra` | Bundled subsemiring of an algebra closed under the scalar algebra map; used with the existing pointwise algebra on functions. | [Mathlib/Algebra/Algebra/Subalgebra/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Algebra/Subalgebra/Basic.lean) |
| `tauceti:Set.unitEmptyEquivUnits` | Units outside the empty set of finite primes are equivalent to ordinary units of the Dedekind base ring. | [TauCeti/RingTheory/DedekindDomain/SInteger/Unit.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RingTheory/DedekindDomain/SInteger/Unit.lean) |
| `tauceti:Set.unitValuation_ker` | The kernel of the S-unit valuation map is the image of ordinary units under the native embedding. | [TauCeti/RingTheory/DedekindDomain/SInteger/Unit.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RingTheory/DedekindDomain/SInteger/Unit.lean) |
| `tauceti:Set.unit_fg_of_units` | For finite S and finitely generated ordinary units, the native S-unit group is finitely generated; it does not assert its logarithmic rank or fullness. | [TauCeti/RingTheory/DedekindDomain/SInteger/Unit.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RingTheory/DedekindDomain/SInteger/Unit.lean) |

Current ownership was also checked against [TauCetiRoadmap at 0d144d044dacebca17b654695b6f1ad58f159b27](https://github.com/TauCetiProject/TauCetiRoadmap/tree/0d144d044dacebca17b654695b6f1ad58f159b27) and [Tau Ceti at a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039](https://github.com/TauCetiProject/TauCeti/tree/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039). GlobalNumberFields and Completed/EffectiveBounds were read in full, including the relevant suggested statements. The current and pinned S-integer unit interfaces and current global-place module were read. No newer declaration is silently imported into the pinned Lean file.

## Lower-tier supplier requests

### 1. GeometryOfNumbersAndQuadraticArithmetic:GN.1

Part II: for K of degree d and L-dimensional adelic convex boxes (bounded open symmetric convex sets at infinity, integral lattices at finite places, standard outside a finite set), with Haar covolume(K^L)=1 and dilation only at infinity, the K-linear successive minima satisfy (∏λ_j)^d volume(box)≤2^(dL) (BV1983 Theorem 3, pp. 18–22). Also supply Vaaler1979 Theorem 1: a central section of a product of volume-one Euclidean balls has intrinsic volume≥1, equivalently ∫1_Q(Ax)dx≥det(AᵀA)^(−1/2) for full-column-rank A. Its proof uses radial Gaussian peakedness, Kanter’s product theorem for symmetric log-concave measures and a thin-normal-slab limit. Do not assert Vaaler’s conjectural extension to arbitrary convex bodies or duplicate the existing real-lattice upper-product theorem.

**Consumers:** [Small vectors in number-field linear kernels](#dt2-siegel-kernel).

### 2. tauceti:TauCetiRoadmap/GlobalNumberFields#layer-0-places-completions-and-the-product-formula

Use the current-owner normalized place/completion/product-formula interfaces. Part II strength needed: start from an arbitrary absolute value continuing a rational value and identify its metric completion with a place completion while preserving the norm; include the real case and construction of the complex action. Native places already exist and are never replanned here.

**Consumers:** [Current-owner places and absolute height normalization](#dt2-place-normalization), [Full S-unit logarithmic image](#dt2-s-unit-log-lattice), [Completion comparison for arbitrary continued absolute values](#dt2-continued-place-completion).

### 3. GeometryOfNumbersAndQuadraticArithmetic:GN.4

Finite class group implies that each selected nonzero prime ideal has a positive principal power. Deduce finite-index image of the S-valuation map in ℤ^S, retaining the native kernel theorem. The higher-tier KTheoryLowDegrees U.4 rank contract moves to this lower-tier owner; DT only adds logarithmic fullness by combining it with native Dirichlet.

**Consumers:** [Full S-unit logarithmic image](#dt2-s-unit-log-lattice).

### 4. SchemeAndStackFoundations:SF.4

Part II: degree and Hilbert functions of projective reduced varieties, isolated primary components, incidence Chow forms, proper projection images/generic hyperplane dimension drops, bounded-degree closed points obtained by generic rational linear sections of a ℚ-defined variety outside a proper closed subset, degree Bézout, torus stabilizer dimension and finite component group, and finite-translation degree formulas in the fixed projective embedding. These contracts move down from higher-tier Heights rational-point/Hilbert plans; DT owns the arithmetic estimates, not the generic geometry.

**Consumers:** [Fubini–Study Chow height](#dt2-cycle-height), [Toric equation complexity and exceptional locus](#dt2-toric-complexity), [Hilbert-function lower and fat-point upper bounds](#dt2-hilbert-multiplicity-bounds), [Stabilizers and translation degree control](#dt2-toric-translate-degree), [Multiprojective degrees and the product criterion](#dt2-multiprojective-degree), [Refined counts for multiple-root recurrences](#dt2-recurrence-refined-count).

### 5. SchemeAndStackFoundations:SF.2

Part II: generic Koszul complexes and their parameter-sequence local-cohomology comparisons sufficient for the corrected Chardin–Philippon relative regularity and isolated-component Hilbert lower bound. Use the erratum definition quantified over all parameter sequences, not the single-complex equivalence in the original paper.

**Consumers:** [Hilbert-function lower and fat-point upper bounds](#dt2-hilbert-multiplicity-bounds).

## Remaining mathematical inputs

### Corrected absolute Siegel basis theorem

Roy–Thunder 1996 was read in full and its symmetric-power metric defect is confirmed by the 1999 erratum preview. Obtain and read pp. 48–51 of that erratum, derive the corrected absolute small-basis/determinant inequality and propagate its constants to ES Corollary 7.2. The weighted-metric definition alone does not establish the upper Minkowski bound.

**Consumers:** [From corrected absolute bases to twisted Minkowski](#dt2-absolute-minkowski-reduction).

### Arbitrary continued-value completion classification

Read a public complete proof constructing the metric completion from an arbitrary continued absolute value, showing finite-dimensionality over the completed rational field, constructing the real/complex algebra action when appropriate and identifying the preserved norm. Native spectral-norm uniqueness is only conditional on these constructions.

**Consumers:** [Completion comparison for arbitrary continued absolute values](#dt2-continued-place-completion).

### Arithmetic Bézout in the Fubini–Study normalization

Evertse specifies the Chow/Faltings height and quotes arithmetic intersection inputs. Read a full primary proof of the sphere-integral formula, proper arithmetic Bézout and the product-height formula with the exact derivative constants; extend DT.2 here. Do not invoke the higher-tier Arakelov package or identify Chow coefficient height with cycle height.

**Consumers:** [Fubini–Study Chow height](#dt2-cycle-height), [Arithmetic cuts and the factor-height estimate](#dt2-arithmetic-intersection).

### Explicit short-prime interval estimate

AV2009 quotes Rosser–Schoenfeld estimates to choose a prime in the prescribed interval avoiding finitely many stabilizer factors. Read the primary analytic estimates and verify the small numerical cases and exclusion count used in Theorems 2.1–2.2; the quoted input is not yet decomposed.

**Consumers:** [Explicit small-point cut and relative descent](#dt2-small-point-cut).

### External inputs to the explicit non-torsion height bound

Voutier 1996 pp. 81–95 and Schmidt Lemma 11 were read in full. Voutier quotes Robin prime-product estimates and Rosser–Schoenfeld prime upper bounds (Lemma 2), Poitou/Odlyzko log|D_K|>3.108d−8.6d^(1/3) (Lemma 4), the degree-reduction lemma for conjugate collisions (proof p. 91), and Smyth/Boyd low-degree Mahler-measure results (degrees≤21). Read or independently establish these precise contracts, including certified finite-degree numerical checks; the determinant proof alone does not close this branch.

**Consumers:** [Explicit non-torsion height and conjugacy-class refinement](#dt2-explicit-degree-height), [Conjugate determinants and denominator selection](#dt2-recurrence-conjugate-selection).

## Source corrections and scope

These findings concern the versions actually read. Existing findings in the parent packet remain in force; the assembly must preserve their scope and the E217–E224 polynomial and strict-boundary corrections. No correction is attributed to a later edition whose full text was unavailable.

### DiophantineApproximationAndTranscendence/E-DT2-1

**Source and locator:** [A further improvement of the quantitative Subspace Theorem](https://annals.math.princeton.edu/wp-content/uploads/annals-v177-n2-p04-p.pdf), Proposition 13.6 proof, published p. 559.

**Finding.** The proof puts every zero-sum weight vector divided by its positive maximum in [−1,1]^n. For n=3, (−2,1,1) has maximum 1 and is outside the claimed cube. The floor-simplex count repairs the actual quantitative route.

**Correction used here.** The admissible region is [−(n−1),1]^n with sum zero. For the ε≤1/10 actually used later, discretize b_i=1−c_i/γ in the mass-n simplex; the same (3R/ε)^n bound follows. The unrestricted ε<1 version needs a separate check.

**Known status:** new. **Search checked:** Annals article and linked files, Evertse author publication list, arXiv 1008.2340v1 and available version listing.

### DiophantineApproximationAndTranscendence/E-DT2-2

**Source and locator:** [Linear equations in variables which lie in a multiplicative group](https://arxiv.org/pdf/math/0409604v1), Author text §11, equation (11.19), printed p. 834.

**Finding.** The small-height step uses a coefficient exp(−(5n)^(3n)) although the stated perturbation hypothesis only gives n^−1 exp(−(4n)^(3n)). For n≥2 the substituted coefficient is strictly smaller and does not follow from the hypothesis. Specializing z=1 avoids this particular step but would not prove the full perturbation target.

**Correction used here.** Use AV2009 Theorem 6.1 and its larger allowed budget to prove the parent perturbation cover, checking both height and numerical comparisons; do not silently strengthen the original hypothesis.

**Known status:** new. **Search checked:** Annals article listing and author/arXiv text comparison, ESS authors’ publication pages, AV2009 §6 replacement proof.

### DiophantineApproximationAndTranscendence/E-DT2-3

**Source and locator:** [An absolute version of Siegel’s lemma](https://gdz.sub.uni-goettingen.de/download/pdf/PPN243919689_0476/LOG_0004.pdf), Lemma 3.2(ii), printed p. 9.

**Finding.** The unweighted coefficient Euclidean norm on a symmetric power is treated as unitary-invariant. A 45-degree rotation of x² gives coefficients (1/2,1,1/2), whose unweighted norm is sqrt(3/2), while the source vector has norm 1.

**Correction used here.** Use the symmetric tensor metric with reciprocal multinomial weights on vectors and the dual multinomial weights on polynomial coefficients; use the corrected absolute-basis proof.

**Known status:** Roy–Thunder, Addendum and erratum, J. reine angew. Math. 508 (1999), 47–51. **Search checked:** Roy–Thunder erratum DOI/publisher preview, GDZ original journal scan, Roy author publications URL (currently unavailable).

### DiophantineApproximationAndTranscendence/E-DT2-4

**Source and locator:** [On the zeros of linear recurrence sequences](https://www.impan.pl/shop/en/publication/transaction/download/product/83761), Proposition 2.5, published p. 392; proof introduction p. 393.

**Finding.** The class-modulus proposition is stated for independent evaluated values. Dependence makes the conjugate determinants vanish and supplies the relation used in the induction. For n=1 it means the one value equals zero. The original Schmidt 2000 proposition and AV p.394 use dependence.

**Correction used here.** It concerns Q-dependent evaluated values of Q-independent forms.

**Known status:** new. **Search checked:** Published IMPAN PDF and article record, HAL hal-00424780 author manuscript, Schmidt 2000 pp.616–630 original proposition, Journal and author-page correction searches.

### DiophantineApproximationAndTranscendence/E-DT2-5

**Source and locator:** [On the zeros of linear recurrence sequences](https://www.impan.pl/shop/en/publication/transaction/download/product/83761), Proposition 2.5(b), published p. 392; repeated in proofs pp.394–395.

**Finding.** The non-torsion alternative omits the progression modulus from h(alpha_i/alpha_j). Schmidt 2000 p.630 proves m h(beta)>the threshold using the generated group order m. It yields no such lower bound for h(beta) before taking the power.

**Correction used here.** The conclusion is h(alpha_i^m/alpha_j^m)≥exp(−6T^4), after restricting indices modulo m.

**Known status:** new. **Search checked:** Published IMPAN PDF, HAL author manuscript, Schmidt 2000 conclusion p.630, Journal and author-page correction searches.

### DiophantineApproximationAndTranscendence/E-DT2-6

**Source and locator:** [Régularité et interpolation](https://webusers.imj-prg.fr/~marc.chardin/publications/textes/11.RI.pdf), Original relative regularity definition and local-cohomology comparison; author erratum entire page.

**Finding.** The relative-regularity argument identifies the required condition through one Koszul complex. The authors’ erratum identifies the invalid equivalence and supplies the corrected regularity notion; AV’s isolated-component Hilbert estimate must use that correction.

**Correction used here.** Quantify the Koszul vanishing condition over all homogeneous parameter sequences as in the published erratum. Corollary 3 used by AV is preserved.

**Known status:** Chardin–Philippon erratum, J. Algebraic Geom. 11 (2002), 599–600. **Search checked:** Chardin’s official publication page, Author original PDF and erratum PDF.

## Sources read

All statements and proof outlines above are in this worker’s words. Sources were read in temporary scratch space; no source text or PDF is part of this deliverable. The bibliography records the exact scope read, including the unavailable erratum pages. The HAL 2009 manuscript has unresolved internal cross-references; the numbered result headings and manuscript page ranges above identify the arguments actually read.

- **dt2-ef2013**: Jan-Hendrik Evertse and Roberto G. Ferretti, [A further improvement of the quantitative Subspace Theorem](https://annals.math.princeton.edu/wp-content/uploads/annals-v177-n2-p04-p.pdf). Annals of Mathematics 177 (2013), 513–590, published version. Read: All pp. 513–590; quantitative theorem and proof inputs §§5–18. Accessed 2026-10-13. SHA-256 `d6caa03fa7a17e162a5843c1152b2dd7b65bf3f5510b8c5fa56cec6c57812937`.
- **dt2-es2002**: Jan-Hendrik Evertse and Hans Peter Schlickewei, [A quantitative version of the Absolute Subspace Theorem](https://pub.math.leidenuniv.nl/~evertsejh/00-abssub.pdf). Author preprint 00-abssub.pdf; J. reine angew. Math. 548 (2002), 21–127. Read: Preprint pp. 1–9, §§1–3 normalization and theorem conventions; pp. 25–45, §§6–9, scalar rescaling, absolute Minkowski and Davenport arguments. Accessed 2026-10-13. SHA-256 `12b5cb1e324988adcfab1ae94fdc8af6016f9968f72835d06d932bb903eaa7c2`.
- **dt2-product1995**: Jan-Hendrik Evertse, [An explicit version of Faltings’ Product Theorem and an improvement of Roth’s lemma](https://pub.math.leidenuniv.nl/~evertsejh/95-product.pdf). Author preprint 95-product.pdf; Acta Arith. 73 (1995), 215–248. Read: All 34 preprint pages; statements, geometric multiplicity argument, arithmetic cuts, sharp Roth proof. Accessed 2026-10-13. SHA-256 `7e030067f7502778eb7a1982e52e31f133ca18f7de869600f25326116bda71e8`.
- **dt2-subspace1996**: Jan-Hendrik Evertse, [An improvement of the quantitative Subspace Theorem](https://pub.math.leidenuniv.nl/~evertsejh/95-subspace.pdf). Author preprint 95-subspace.pdf; Compositio Math. 101 (1996), 225–311. Read: Preprint pp. 64–70, Lemmas 23–26 and the beginning of Lemma 27. Accessed 2026-10-13. SHA-256 `ac82a38059a5d0d9fd23a40a3896fb58d8525b14ef44c42199df9582bd9a0fb4`.
- **dt2-decforms1995**: Jan-Hendrik Evertse, [The number of solutions of decomposable form equations](https://pub.math.leidenuniv.nl/~evertsejh/95-decforms.pdf). Author preprint 95-decforms.pdf; Invent. Math. 122 (1995), 559–601. Read: All 47 preprint pages; unit patterns, admissible algebras and norm-form consequences. Accessed 2026-10-13. SHA-256 `dadbbfeb3ee695eb2bbe8590f0e6ab45147b5f170e6071d3444708624f10e508`.
- **dt2-ess2002**: Jan-Hendrik Evertse, Hans Peter Schlickewei and Wolfgang M. Schmidt, [Linear equations in variables which lie in a multiplicative group](https://arxiv.org/pdf/math/0409604v1). arXiv math/0409604v1 author text; published Annals of Mathematics 155 (2002), 807–836. Read: All 30 author-text pages, including §§4–12; the numerical finding is scoped to this author version. Accessed 2026-10-13. SHA-256 `3c809fcadaddbc08f57045e4f55562c8a379b5fa33d7e83046b63a9c14766e8f`.
- **dt2-roy1996**: Damien Roy and Jeffrey L. Thunder, [An absolute version of Siegel’s lemma](https://gdz.sub.uni-goettingen.de/download/pdf/PPN243919689_0476/LOG_0004.pdf). J. reine angew. Math. 476 (1996), 1–26, GDZ scan. Read: All printed pp. 1–26, OCR checked against the scan where formulas matter. Accessed 2026-10-13. SHA-256 `76353c4a0061fb98c8ae19c335c524cbd59c51d30af8bf2ae79ec14ef7159deb`.
- **dt2-bv1983**: Enrico Bombieri and Jeffrey D. Vaaler, [On Siegel’s lemma](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0073/LOG_0008.pdf). Invent. Math. 73 (1983), 11–32, GDZ scan. Read: All printed pp. 11–32, including Theorem 9 and its kernel-lattice proof. Accessed 2026-10-13. SHA-256 `1c35ab7edfe18d6f552ccc1abd395e327e3589346bdc930662e506d2a24e993e`.
- **dt2-gao**: Ziyang Gao, [Lecture notes on Diophantine geometry](https://ziyangjeremygao.github.io/LectureNotes/DiophantineGeometry.pdf). Public author lecture notes, accessed 2026-10-13. Read: Physical pp. 61–64, printed pp. 37–40, §2.3 on linear-subspace heights. Accessed 2026-10-13. SHA-256 `41c1b0426c7cc8ea5bf0c860083512597d6b58de6fb13b2db450f53ab2857270`.
- **dt2-av2009**: Francesco Amoroso and Evelina Viada, [Small points on subvarieties of a torus](https://hal.science/hal-00424769/document). HAL hal-00424769 author manuscript, 28 printed pages; Duke Math. J. 150 (2009), 407–442. Read: All 28 manuscript pages after the HAL cover, including the full Hilbert, determinant, cutting and unit-equation arguments. Accessed 2026-10-13. SHA-256 `c06db00bb319d8f96124a50edee9507d15c7948da380d94b5eade51c65b16f7c`.
- **dt2-av2011published**: Francesco Amoroso and Evelina Viada, [On the zeros of linear recurrence sequences](https://www.impan.pl/shop/en/publication/transaction/download/product/83761). Acta Arith. 147 (2011), 387–396, published IMPAN PDF. Read: All pp. 387–396, especially Lemmas 2.2–2.4, Proposition 2.5 and both inductive counts. Accessed 2026-10-13. SHA-256 `c0e4a5477e0f03b2699d2a5fb92761252312be856da57b5bb0320287b68961ee`.
- **dt2-schmidt1999**: Wolfgang M. Schmidt, [The zero multiplicity of linear recurrence sequences](https://archive.ymsc.tsinghua.edu.cn/pacm_download/117/6578-11511_2006_Article_BF02392575.pdf). Acta Math. 182 (1999), 243–282, public archive scan. Read: All printed pp. 243–282, including the homogeneous denominator appendix; PDF extraction has internal form-feed characters and locators therefore use printed pages. Accessed 2026-10-13. SHA-256 `89562bdd37165f25257eec32605454deaa9cd43de8a33abe36ec9953419117d9`.
- **dt2-schmidt2000**: Wolfgang M. Schmidt, [Zeros of linear recurrence sequences](https://publi.math.unideb.hu/paper/608/download/10_5486_PMD_2000_2336.pdf). Publ. Math. Debrecen 56 (2000), 609–630, published journal PDF. Read: All pp. 609–630, including the original corrected dependence and powered-height proposition and its proof. Accessed 2026-10-13. SHA-256 `5b1f727babd523a80924a6f8ca9b25910c442c4f760f496105d107cdc8d77c4f`.
- **dt2-cp1999**: Marc Chardin and Patrice Philippon, [Régularité et interpolation](https://webusers.imj-prg.fr/~marc.chardin/publications/textes/11.RI.pdf). Author preprint; J. Algebraic Geom. 8 (1999), 471–481. Read: All 9 author-preprint pages, including Corollary 3 and its proof. Accessed 2026-10-13. SHA-256 `14a541bad02ac5fded025a90bab02b0c13a8252bbe0e0bdac1d5eb6571b11c9f`.
- **dt2-cp2002**: Marc Chardin and Patrice Philippon, [Erratum to Régularité et interpolation](https://webusers.imj-prg.fr/~marc.chardin/publications/textes/11.Err.pdf). Author erratum; J. Algebraic Geom. 11 (2002), 599–600. Read: Entire one-page author erratum; corrected relative regularity and the validity of Corollary 3. Accessed 2026-10-13. SHA-256 `7eb9df346f10c01c85ea9fb6aaa58d977c476289d8e4a571678d4f915dace7ba`.
- **dt2-vaaler1979**: Jeffrey D. Vaaler, [A geometric inequality with applications to linear forms](https://msp.org/pjm/1979/83-2/pjm-v83-n2-p24-s.pdf). Pacific J. Math. 83 (1979), 543–553, published MSP PDF. Read: All pp. 543–553; Theorem 1 ball-product sections and its peakedness proof. The conjectural general-convex-body extension is not used. Accessed 2026-10-13. SHA-256 `cbb5f7796ab10905d227873d1f47fbef6992561ee42d9fd92a0409c287d9cc5d`.
- **dt2-voutier1996**: Paul Voutier, [An effective lower bound for the height of algebraic numbers](https://matwbn.icm.edu.pl/ksiazki/aa/aa74/aa7417.pdf). Acta Arith. 74 (1996), 81–95, published journal archive PDF. Read: All pp. 81–95; the full determinant proof and its explicitly quoted external inputs. Accessed 2026-10-13. SHA-256 `c300191a0dd3468d8200f9b8043608591047b73e16c622cfd2e79fa15f4d3543`.
- **dt2-roy1999preview**: Damien Roy and Jeffrey L. Thunder, [Addendum and erratum to An absolute version of Siegel’s lemma](https://doi.org/10.1515/crll.1999.508.47). J. reine angew. Math. 508 (1999), 47–51; only publisher preview p. 47 read. Read: Only the introduction on p. 47, confirming the symmetric-power norm correction and improved constant; pp. 48–51 were not available. Accessed 2026-10-13.

## Acceptance and assembly

The packet checker reports zero errors and zero warnings, and the suggested Lean file elaborates with only admitted-proof warnings. An assembler must keep the normalization adapters, the strict sharp-Roth conclusion at the weak input boundary, the corrected EF net for the range actually used, the ordinary-unit norm-form reduction and the powered-height recurrence alternative. Resolve the five gaps and five requests before changing DT.2 from planned to closed. The suggested file’s elaboration confirms its syntax and native carriers; it does not prove its admitted theorems.
