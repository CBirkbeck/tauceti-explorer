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
numerical step in the read ESS version. The small-point packing specialization uses ε≤(2nθ)⁻¹, which is
stronger than the published Corollary 1.4 premise and sufficient for this
parent perturbation budget. Ordinary-unit stabilizers then give the
norm-form criterion. Polynomial factors and residue classes are retained in
the recurrence route, which also covers repeated roots.

## Conventions and ownership

A number field K is embedded in a fixed algebraic closure of ℚ; d=[K:ℚ].
Normalized local factors have product 1 on K*. At infinity they have weights
[K_v:ℝ]/d; finite factors use the inverse residue norm, raised to 1/d.
For an extension E/K the factor over w|v is raised by
d(w|v)=[E_w:K_v]/[E:K], and these exponents sum to 1 over v.
H is projective sup height, H₂ uses Euclidean norms at infinity, and h=log H.
For a torus point h(x) means h(1:x₁:⋯:x_n). The rational-perturbation and
recurrence degree-lowering inputs explicitly use homogeneous projective height
h_proj(x)=h(x₁:⋯:x_q); removing the leading 1 changes that convention. The native Mathlib number-field
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

The independent review accepts this planning pass with the five gaps retained.
Every input and all 19 baseline declarations have been checked. Eight source
issues have independent verdicts, including the logarithmic factor-two error
and the binary weak-boundary counterexample recorded below. The review changes
no parent target or planet, and marks no stage closed.

## Places, heights and absolute minima

<a id="dt2-place-normalization"></a>

### Current-owner places and absolute height normalization

**Comparison.** For a number field K of degree d, identify the legacy InfinitePlace K ⊕ FinitePlace K with GlobalNumberFields.Place K by swapping the summands and identifying finite places with height-one prime ideals. Current infinite factors are v(x)^{mult(v)} and finite factors are the adic norms. Raise each current factor to 1/d to obtain the normalized factors used by H₂ and H_Q. The product formula is preserved. In E/K, the factor over w|v carries exponent d(w|v)=[E_w:K_v]/[E:K]. In particular H(x)=Height.mulHeight(x)^{1/d} for a nonzero tuple and h(x)=Height.logHeight(x)/d.

**Declaration:** `dt2_place_normalization`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-place-normalization`.

**Hypotheses.** All fields, dimensions, normalizations and strict inequalities are as specified in the statement.

**Inputs:** `mathlib:NumberField.mulHeight_eq` (see the native-export table), `mathlib:NumberField.totalWeight_eq_finrank` (see the native-export table), [GlobalNumberFields layer-0-places-completions-and-the-product-formula](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/TauCetiRoadmap/GlobalNumberFields/README.md#layer-0-places-completions-and-the-product-formula).

**Proof outline.**

1. Use the native finite-place equivalence; the infinite factor retains its multiplicity before the degree root.
2. Use the product formula and the local-degree sum over each v to prove invariance under finite extension. This is the compatibility needed by the parent height, not a new place definition.

**Check.** For K=ℚ the root exponent is 1; at a complex place of a quadratic field it is 2/2, not 1/2. The complex squared factor is not treated as an AbsoluteValue: its triangle estimate has exponent 2/d.

**Sources and use.**

- [A further improvement of the quantitative Subspace Theorem](https://annals.math.princeton.edu/wp-content/uploads/annals-v177-n2-p04-p.pdf), §2.1, pp. 516–518; §6.1, pp. 533–535. The normalized places, continuation weights and coefficient-system hypotheses are those used by the absolute theorem. The native degree-normalization adapter is derived here.

<a id="dt2-exterior-local-norm"></a>

### Local exterior-power norm and determinant bounds

**Lemma.** For a p×n matrix whose rows are the p vectors over a normalized local field, the sup norm of its p-minors is at most the product of row sup norms at a nonarchimedean place; the Euclidean norm of those minors is at most the product of the p Euclidean vector norms at an archimedean place. Consequently H₂(span(x₁,…,x_p))≤∏ H₂(x_i) for independent vectors, and the wedge-coordinate sup version has the factor p^{p/2} when each input uses a coordinate sup norm.

**Declaration:** `dt2_exterior_local_norm`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-exterior-local-norm`.

**Hypotheses.** All fields, dimensions, normalizations and strict inequalities are as specified in the statement.

**Inputs:** [DiophantineApproximationAndTranscendence:DT.2/height-of-linear-subspace](../packets/DiophantineApproximationAndTranscendence.json), [DiophantineApproximationAndTranscendence:DT.2/hadamard-inequality](../packets/DiophantineApproximationAndTranscendence.json).

**Proof outline.**

1. At an archimedean place apply Cauchy–Binet to the Gram determinant and Hadamard; at finite places use the ultrametric determinant expansion.
2. Multiply with normalized local weights. The archimedean weights sum to 1, which gives one global p^{p/2}, rather than a power depending on K.

**Check.** For p=1 this is equality. For p=n the wedge is a determinant, and its projective height is 1.

**Sources and use.**

- [A further improvement of the quantitative Subspace Theorem](https://annals.math.princeton.edu/wp-content/uploads/annals-v177-n2-p04-p.pdf), §6.3, pp. 535–536; Lemma 17.1, p. 576. Exterior-coordinate and Euclidean height conventions give the row-based wedge bound. Lemma 17.1 is the compound-family estimate, not a claim about column norms.

<a id="dt2-subspace-duality"></a>

### Plücker duality and orthogonal complement heights

**Lemma.** For a k-dimensional K-subspace U⊂Kⁿ, the signed complementary-minor map identifies its Plücker vector with that of the annihilator U⊥ for the standard bilinear pairing. Thus H₂(U⊥)=H₂(U); also H₂(U)=1 for k=0,n. This statement concerns bilinear annihilators over K, with Hermitian norms only after embedding at infinity.

**Declaration:** `dt2_subspace_duality`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-subspace-duality`.

**Hypotheses.** All fields, dimensions, normalizations and strict inequalities are as specified in the statement.

**Inputs:** [DiophantineApproximationAndTranscendence:DT.2/height-of-linear-subspace](../packets/DiophantineApproximationAndTranscendence.json), [Local exterior-power norm and determinant bounds](#dt2-exterior-local-norm).

**Proof outline.**

1. Choose an invertible basis minor and row-reduce. The kernel matrix has complementary minors equal up to one common nonzero scalar and signs.
2. Signed coordinate permutation preserves every local sup or Euclidean norm; projective invariance cancels the common scalar.

**Check.** For a rational line generated by (2,3), its perpendicular line generated by (−3,2) has the same H₂=√13.

**Sources and use.**

- [Lecture notes on Diophantine geometry](https://ziyangjeremygao.github.io/LectureNotes/DiophantineGeometry.pdf), Proposition 2.3.8, pp. 38–39. The signed complementary Plücker coordinates of an annihilator have the same local norms. The packet uses this argument for the dual-space pairing, without identifying arbitrary number-field lattices as self-dual.

<a id="dt2-subspace-intersection"></a>

### Intersection and sum inequality for subspace heights

**Lemma.** For subspaces U,V⊂Kⁿ, H₂(U∩V) H₂(U+V)≤H₂(U)H₂(V). This includes nontrivial intersections, and is stronger than applying the exterior product bound only in the disjoint case.

**Declaration:** `dt2_subspace_intersection`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-subspace-intersection`.

**Hypotheses.** All fields, dimensions, normalizations and strict inequalities are as specified in the statement.

**Inputs:** [DiophantineApproximationAndTranscendence:DT.2/height-of-linear-subspace](../packets/DiophantineApproximationAndTranscendence.json), [Local exterior-power norm and determinant bounds](#dt2-exterior-local-norm), [Plücker duality and orthogonal complement heights](#dt2-subspace-duality).

**Proof outline.**

1. Use a common basis A of U∩V and complements B,C. At each archimedean place pass to the quotient by span(A); Gram–Schmidt gives volume(A,B,C) volume(A)≤volume(A,B)volume(A,C).
2. At a finite place use a unit minor of A after scaling and elimination; the induced quotient sup norm gives the corresponding nonarchimedean determinant inequality.
3. Multiply local inequalities, cancel the projective scalars, and use the product formula. The lecture notes quote the inequality; the local quotient proof is the required development.

**Check.** If U⊂V both sides are equal. In ℚ³, U=span(e₁,e₂) and V=span(e₁,e₂+e₃) give 1·1≤1·√2.

**Sources and use.**

- [Lecture notes on Diophantine geometry](https://ziyangjeremygao.github.io/LectureNotes/DiophantineGeometry.pdf), Corollary 2.3.11 and the following paragraph, p. 39. This gives the subspace intersection/sum inequality. The requested constant-one Euclidean version is derived by a local quotient-wedge argument; the quoted sup-height version is not silently used with a different metric.

<a id="dt2-plucker-northcott"></a>

### Northcott for fixed-degree subspaces

**Lemma.** For n,k,D and B fixed, only finitely many k-subspaces U⊂Q̄ⁿ with [field of definition of U:ℚ]≤D and H₂(U)≤B exist. A Plücker chart with a nonzero coordinate makes every ratio a scalar of degree≤D and absolute multiplicative height≤B; the injective Plücker map then reduces to fixed-degree scalar Northcott.

**Declaration:** `dt2_plucker_northcott`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-plucker-northcott`.

**Hypotheses.** All fields, dimensions, normalizations and strict inequalities are as specified in the statement.

**Inputs:** [DiophantineApproximationAndTranscendence:DT.2/height-of-linear-subspace](../packets/DiophantineApproximationAndTranscendence.json), [DiophantineApproximationAndTranscendence:DT.0/northcott-absolute-height](../packets/DiophantineApproximationAndTranscendence.json).

**Proof outline.**

1. Choose one of finitely many nonzero Plücker coordinates and divide by it.
2. Bound the heights of coordinate ratios by the Plücker sup height, which is≤H₂; use the parent fixed-degree scalar Northcott and Plücker reconstruction.

**Check.** The degree bound is essential: roots of unity give infinitely many lines (1,ζ) of H₂=√2. A fixed ambient number field gives a special case using native fixed-field Northcott.

**Sources and use.**

- [A further improvement of the quantitative Subspace Theorem](https://annals.math.princeton.edu/wp-content/uploads/annals-v177-n2-p04-p.pdf), §6.3, pp. 535–536. These are the subspace-height conventions. Finiteness is an independent derivation using a nonzero Plücker chart and native scalar Northcott; these pages are not cited as a proof of Northcott.

<a id="dt2-rational-covolume"></a>

### Primitive Plücker coordinates and rational covolume

**Lemma.** For a rational k-subspace U⊂ℚⁿ, L=U∩ℤⁿ is saturated and has rank k. Every specified ℤ-basis b of L extends to a basis of ℤⁿ, hence the gcd of the k-minors of b is 1. Therefore H₂(U)=√det(Gram(b))=covol(L) in U⊗ℝ. This constructs the lattice and proves primitivity, rather than assuming an arbitrary integral basis is primitive.

**Declaration:** `dt2_rational_covolume`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-rational-covolume`.

**Hypotheses.** All fields, dimensions, normalizations and strict inequalities are as specified in the statement.

**Inputs:** [GeometryOfNumbersAndQuadraticArithmetic:GN.0/prescribed-primitive-basis](../packets/GeometryOfNumbersAndQuadraticArithmetic.json), [GeometryOfNumbersAndQuadraticArithmetic:GN.0/covolume-square-gram](../packets/GeometryOfNumbersAndQuadraticArithmetic.json), [DiophantineApproximationAndTranscendence:DT.2/height-of-linear-subspace](../packets/DiophantineApproximationAndTranscendence.json).

**Proof outline.**

1. Saturation follows from m x∈U⇒x∈U for nonzero integer m. Use the prescribed-basis extension theorem, and expand determinant±1 along the first k columns to obtain an integral combination of minors equal to±1.
2. Finite local height factors are then 1; Cauchy–Binet supplies the infinite factor.

**Check.** For the line (2,3) the primitive basis gives √13; using twice this vector without dividing its common factor would wrongly give 2√13.

**Sources and use.**

- [A further improvement of the quantitative Subspace Theorem](https://annals.math.princeton.edu/wp-content/uploads/annals-v177-n2-p04-p.pdf), §6.3, pp. 535–536. The Euclidean subspace height motivates the normalization. The covolume identity is derived using the existing GN.0 Gram determinant and mixed-embedding normalization contracts, rather than attributed to these pages.

<a id="dt2-s-unit-log-lattice"></a>

### Full S-unit logarithmic image

**Theorem.** Let S contain all infinite places and finitely many finite places of K. The map u↦(log|u|_v)_{v∈S}, with degree-normalized factors, has torsion kernel and image a full lattice in Σ_v z_v=0. In particular every vector of that hyperplane is within a K,S-dependent bounded sup distance of some unit logarithm. Native finite generation alone does not imply fullness.

**Declaration:** `dt2_s_unit_log_lattice`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-s-unit-log-lattice`.

**Hypotheses.** All fields, dimensions, normalizations and strict inequalities are as specified in the statement.

**Inputs:** `mathlib:NumberField.Units.unitLattice` (see the native-export table), `mathlib:NumberField.Units.instZLattice_unitLattice` (see the native-export table), `tauceti:Set.unitValuation_ker` (see the native-export table), `tauceti:Set.unit_fg_of_units` (see the native-export table), [GlobalNumberFields layer-0-places-completions-and-the-product-formula](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/TauCetiRoadmap/GlobalNumberFields/README.md#layer-0-places-completions-and-the-product-formula), [GlobalNumberFields layer-2-moduli-and-ray-class-carriers](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/TauCetiRoadmap/GlobalNumberFields/README.md#layer-2-moduli-and-ray-class-carriers).

**Proof outline.**

1. Use native ordinary Dirichlet for the infinite-place kernel. Finite class-group torsion makes each chosen finite prime power principal; its generator is an S-unit with one nonzero finite valuation direction.
2. The principal-power and finite-index valuation adapter is requested as a Part II of current GlobalNumberFields Layer 2, using the already existing finite class group. No class-group finiteness theorem is replanned.
3. The finite valuation coordinates form a discrete subgroup; their zero fibre is the discrete ordinary-unit logarithmic lattice. This proves discreteness of the full image. The independent valuation directions and ordinary Dirichlet give full rank in the product-formula hyperplane, with torsion kernel.
4. A fundamental parallelepiped of the resulting full lattice is bounded, giving the approximation statement.

**Check.** For ℚ with S={∞,p}, the logarithmic image is ℤ(log p,−log p). For imaginary quadratic K and only infinite places, the hyperplane and free unit rank are both zero.

**Sources and use.**

- [A quantitative version of the Absolute Subspace Theorem](https://pub.math.leidenuniv.nl/~evertsejh/00-abssub.pdf), Lemma 6.3 and proof, pp. 25–27. The scalar approximation uses a full logarithmic S-unit lattice. Native ordinary Dirichlet, the S-valuation kernel and the requested principal-power adapter supply its directions and discreteness.

<a id="dt2-absolute-rescaling"></a>

### Absolute rescaling with one distinguished place

**Lemma.** Let A_v>0 equal 1 outside a finite set containing all infinite places, with A=∏A_v≥1; fix v₀ and ε>0. There are a finite extension E/K and β∈E* with |β|_w≤A_v^{d(w|v)} for w|v≠v₀ and |β|_w≤((1+ε)A_{v₀}/A)^{d(w|v₀)} for w|v₀. The variant without a distinguished place uses ∏A_v>1 and gives |β|_w≤A_v^{d(w|v)} everywhere.

**Declaration:** `dt2_absolute_rescaling`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-absolute-rescaling`.

**Hypotheses.** All fields, dimensions, normalizations and strict inequalities are as specified in the statement.

**Inputs:** [Full S-unit logarithmic image](#dt2-s-unit-log-lattice), [Current-owner places and absolute height normalization](#dt2-place-normalization).

**Proof outline.**

1. Approximate a large multiple of the balanced target vector of logarithms by the S-unit lattice. Reserve the positive log(1+ε) margin at v₀ and enough negative margin elsewhere to absorb the bounded error.
2. Adjoin a k-th root of that unit; divide all errors by k and check the local-degree weights. This is why the scalar may require a finite extension.

**Check.** When A=1 and all A_v=1 one may take β=1. A zero ε boundary is not inferred from approximation.

**Sources and use.**

- [A further improvement of the quantitative Subspace Theorem](https://annals.math.princeton.edu/wp-content/uploads/annals-v177-n2-p04-p.pdf), Lemma 11.1, pp. 546–547. This gives the rescaling weights and their product-formula compatibility.
- [A quantitative version of the Absolute Subspace Theorem](https://pub.math.leidenuniv.nl/~evertsejh/00-abssub.pdf), Lemma 6.3, pp. 25–27. The logarithmic approximation lemma supplies an algebraic scalar with the required controlled local rescalings.

<a id="dt2-roy-symmetric-metric"></a>

### Unitary symmetric-power metric

**Definition.** On Symʳ(Kᵐ), let e^I be the image of a tensor word of multiplicity I, identified with its symmetric average. For v=Σ a_I e^I use ‖v‖²=Σ |a_I|²/binomial(r;I) at infinity. In the dual basis ε_I, ‖Σ b_I ε_I‖²=Σ binomial(r;I)|b_I|². The associated ordinary polynomial is f(x)=ℓ(x^⊗r)=Σ c_I x^I with c_I=binomial(r;I)b_I; hence its dual squared norm is Σ |c_I|²/binomial(r;I). Finite places use the prescribed adelic sup norm. The tensor construction is unitary-invariant; unweighted coefficient norm is not.

**Declaration:** `dt2_roy_symmetric_metric`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-roy-symmetric-metric`.

**Hypotheses.** All fields, dimensions, normalizations and strict inequalities are as specified in the statement.

**Inputs:** [Current-owner places and absolute height normalization](#dt2-place-normalization), [DiophantineApproximationAndTranscendence:DT.2/height-of-linear-subspace](../packets/DiophantineApproximationAndTranscendence.json).

**Proof outline.**

1. Average the binomial(r;I) orthonormal tensor words with each multiplicity. The average has squared norm 1/binomial(r;I), and different multiplicities are orthogonal.
2. The dual basis has reciprocal squared weights. Expand x^⊗r=Σ binomial(r;I)x^I e^I to identify ordinary polynomial coefficients; this accounts for the extra multinomial in the pairing.
3. Restrict a unitary tensor-power map to the symmetric tensors. Compare all weighted norms to coefficient norms with explicit multinomial factors; the corrected absolute-basis argument remains a separate gap.

**Planning API.** These are proposed contracts; only the light definitions and selected statements fit the suggested file.

| Name | Role | Contract |
| --- | --- | --- |
| `symmetricMetric_basis` | simp | The squared norm of e^I is 1/binomial(r;I). |
| `symmetricMetric_unitary` | functoriality | A unitary map on Kᵐ induces an isometry on Symʳ with this metric. |
| `symmetricMetric_dual` | compatibility | The dual basis ε_I has squared norm binomial(r;I). Ordinary polynomial coefficients c_I equal binomial(r;I)b_I, so their squared norm uses reciprocal multinomial weights. |
| `symmetricMetric_bounds` | relation | Compare to coefficient norms by the largest multinomial coefficient. |
| `symmetricMetric_ofTensor` | constructor | Transport the tensor-power inner product to symmetric averages; the monomial averages are orthogonal with the specified squared norms. |
| `symmetricMetric_ext` | extensionality | A Hermitian form agreeing on all pairs of the monomial basis agrees everywhere; the diagonal weights and orthogonality uniquely determine this metric. |

**Consumers.** Absolute Minkowski input: A unitary-invariant archimedean metric is required in the symmetric-power basis argument.

**Unit tests.**

- `test_roy_symmetric_metric_1` (computation): For m=2,r=2, ‖a x²+b xy+c y²‖²=|a|²+|b|²/2+|c|².
- `test_roy_symmetric_metric_2` (compatibility): For r=1 this is the ordinary Euclidean metric.
- `test_roy_symmetric_metric_3` (non-example): Rotating x to (x+y)/√2 sends x² to (x²+2xy+y²)/2. The correct norm stays 1; unweighted coefficient norm becomes √(3/2).
- `test_roy_symmetric_metric_dual` (compatibility): For m=2,r=2, ε_(1,1) has squared norm 2 and evaluates x^⊗2 as 2x₁x₂; the functional for x₁x₂ has squared norm 1/2.

**Check.** For m=2,r=2 the vector e₁e₂ has squared norm 1/2; its dual basis vector has squared norm 2 and corresponds to the polynomial 2XY. The ordinary polynomial XY has dual squared norm 1/2. The displayed rotation of e₁² preserves norm one.

**Sources and use.**

- [An absolute version of Siegel’s lemma](https://gdz.sub.uni-goettingen.de/download/pdf/PPN243919689_0476/LOG_0004.pdf), Lemma 3.2(ii), p. 9. The printed unweighted symmetric-power metric fails the rotation test. The replacement is derived from the tensor-product metric, distinguishing coordinates in the dual basis from coefficients of the ordinary polynomial.

<a id="dt2-absolute-minkowski-reduction"></a>

### From corrected absolute bases to twisted Minkowski

**Comparison.** Assume the corrected absolute small-basis theorem for adelic Hermitian spaces, with the Roy–Thunder determinant/metric conventions. Apply it to the n coordinate forms at every place, then pass to the algebraic-closure infima. The resulting statement is the parent absolute Minkowski theorem n^{−n/2}Δ Q^{−α}≤∏_{i=1}^n λ_i(Q)≤2^{n(n−1)/2}Δ Q^{−α}, with α=Σ_{v,i}c_{iv}. The lower bound follows directly from local determinants and does not need the unread erratum.

**Declaration:** `dt2_absolute_minkowski_reduction`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-absolute-minkowski-reduction`.

**Hypotheses.** All fields, dimensions, normalizations and strict inequalities are as specified in the statement.

**Inputs:** [Unitary symmetric-power metric](#dt2-roy-symmetric-metric), [Absolute rescaling with one distinguished place](#dt2-absolute-rescaling), [DiophantineApproximationAndTranscendence:DT.2/successive-infima-of-twisted-height](../packets/DiophantineApproximationAndTranscendence.json).

**Proof outline.**

1. For independent nearly minimizing vectors bound each local determinant by the product of local form maxima, with the normalized archimedean factor n^{n/2}; multiply to obtain the lower inequality.
2. For the upper inequality match the adelic twisted box to the corrected absolute-basis theorem and rescale via the preceding lemma. A fixed-field Minkowski theorem is insufficient because λ_i is taken over Q̄.
3. The upper-bound source is a recorded gap until the full 1999 erratum proof is obtained and its constants propagated.

**Check.** Prove the lower determinant inequality separately; mark the upper inequality conditional on the unread corrected-basis proof, with no discriminant term.

**Sources and use.**

- [A quantitative version of the Absolute Subspace Theorem](https://pub.math.leidenuniv.nl/~evertsejh/00-abssub.pdf), Proposition 7.1, p. 29; Corollary 7.2 and proof, pp. 30–32. These supply the absolute Minkowski reduction, conditional here on a corrected absolute Siegel-basis input.
- [A further improvement of the quantitative Subspace Theorem](https://annals.math.princeton.edu/wp-content/uploads/annals-v177-n2-p04-p.pdf), Lemma 9.2, p. 542. This invokes the resulting product-of-minima bounds. Reading the invocation does not close the corrected-basis gap.

<a id="dt2-minima-galois"></a>

### Successive infima, gap subspaces and Galois descent

**Lemma.** For the parent finite-support, extension-compatible and Galois-invariant twisted height, 0<λ₁(Q)≤⋯≤λ_n(Q)<∞, and independent near minimizers exist for every positive error. If λ_k<λ_{k+1}, the span of all vectors of height<λ_{k+1} has dimension k and is K-defined. Under all EF (8.1)–(8.9), Q>C₂ and λ₁(Q)≤Q^−δ, any p distinct indices satisfy Q^(−p−1/2)≤∏λ_{i_j}(Q)≤Q^(n−p+1/2), and some 1≤k<n satisfies λ_k(Q)≤Q^(−δ/(n−1))λ_{k+1}(Q). No infimum is asserted to be attained.

**Declaration:** `dt2_minima_galois`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-minima-galois`.

**Hypotheses.** All fields, dimensions, normalizations and strict inequalities are as specified in the statement.

**Inputs:** [DiophantineApproximationAndTranscendence:DT.2/successive-infima-of-twisted-height](../packets/DiophantineApproximationAndTranscendence.json), [DiophantineApproximationAndTranscendence:DT.2/sup-norm-bounded-by-independent-forms](../packets/DiophantineApproximationAndTranscendence.json), [Current-owner places and absolute height normalization](#dt2-place-normalization), [From corrected absolute bases to twisted Minkowski](#dt2-absolute-minkowski-reduction).

**Proof outline.**

1. The parent coordinate lower bound and a coordinate basis give positivity and finiteness; the infimum definition gives independent near minimizers.
2. For a strict adjacent gap, all intermediate threshold spans coincide and have dimension k. Galois invariance makes their common span K-defined by the parent descent input.
3. In the semistable normalized setting use the coordinate lower bound λ₁>Q^(−1−1/(3n)) and absolute Minkowski to bound each product of p infima. The same determinant estimates give λ_n>1. Choose the smallest adjacent ratio, whose (n−1)-st power is at most λ₁/λ_n.

**Check.** Use strict adjacent gaps only. A span of near minimizers must be independent of their choices before invoking Galois descent.

**Sources and use.**

- [A further improvement of the quantitative Subspace Theorem](https://annals.math.princeton.edu/wp-content/uploads/annals-v177-n2-p04-p.pdf), Lemmas 9.1, 9.3 and 9.4, pp. 541–543. The near-minimum span, adjacent-minimum gap and Galois invariance are used with Q>C₂ and the prescribed product bounds.

<a id="dt2-restriction-height"></a>

### Restriction heights and subspace-height lower bounds

**Lemma.** Assume the distinct form family contains X₁,…,X_n. For a basis g of a k-subspace T and all its distinct nonzero restricted determinants θ₁,…,θ_u, put A=√binomial(n,k)H_L H₂(T). Over a common number field E, ∏_w max_j|θ_j|_w≤A and ∏_w min_j|θ_j|_w≥A^(1−binomial(R,k)), where R bounds the number of distinct forms. Under all EF (8.1)–(8.9), Q>C₂, λ₁(Q)≤Q^−δ and λ_k(Q)≤Q^(−δ/(n−1))λ_{k+1}(Q), the gap subspace T=T_k(Q) satisfies H₂(T)>Q^(δ/(3R^n)). A mere strict adjacent gap is insufficient.

**Declaration:** `dt2_restriction_height`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-restriction-height`.

**Hypotheses.** All fields, dimensions, normalizations and strict inequalities are as specified in the statement.

**Inputs:** [Local exterior-power norm and determinant bounds](#dt2-exterior-local-norm), [Plücker duality and orthogonal complement heights](#dt2-subspace-duality), [Successive infima, gap subspaces and Galois descent](#dt2-minima-galois), [DiophantineApproximationAndTranscendence:DT.2/weight-and-exceptional-subspace](../packets/DiophantineApproximationAndTranscendence.json).

**Proof outline.**

1. Cauchy–Binet bounds each restricted determinant by the Plücker norm of g times the exterior coefficient norm. Because the coordinate forms are in the family, every subminor is included in its determinant-height bound. Multiply to obtain the maximum estimate.
2. The product formula for θ₁⋯θ_u bounds the product of local minima below by the maximum product to the power 1−u; u≤binomial(R,k) gives the stated weaker estimate.
3. Choose weight-minimizing independent restrictions on T. Semistability bounds their total weight by zero. Apply determinant bounds to k independent near minimizers and the quantitative adjacent gap to get the selected-determinant product≤Q^(−δ/(2n)). Combining with the preceding minimum bound and Q>C₂ gives the strict height lower bound.

**Check.** The estimate requires the semistable assumptions; a positive-weight exceptional subspace is not a counterexample to the conditional statement.

**Sources and use.**

- [A further improvement of the quantitative Subspace Theorem](https://annals.math.princeton.edu/wp-content/uploads/annals-v177-n2-p04-p.pdf), Lemmas 10.1–10.3, pp. 543–546. The source uses every independent restricted coordinate tuple. Their determinant-product upper and lower bounds lead to the strict lower bound on the exceptional subspace height.

<a id="dt2-minima-local-bases"></a>

### Nearly minimizing bases with concentrated archimedean slack

**Lemma.** Fix v₀ and ε>0. Independent near minimizers can be individually rescaled so that |L_{iv}(x_j)|_v≤n^{−s(v)}Q^{c_{iv}} away from v₀, while at v₀ the bounds are ((1+ε)nλ_j(Q))^{d(w|v₀)}Q^{c_{iw}}. Here s(v)=[K_v:ℝ]/[K:ℚ] at infinity and zero at finite places; after extension the same exponents are multiplied by d(w|v).

**Declaration:** `dt2_minima_local_bases`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-minima-local-bases`.

**Hypotheses.** All fields, dimensions, normalizations and strict inequalities are as specified in the statement.

**Inputs:** [Absolute rescaling with one distinguished place](#dt2-absolute-rescaling), [Successive infima, gap subspaces and Galois descent](#dt2-minima-galois).

**Proof outline.**

1. Take a common finite field for the independent vectors. For each vector set A_v from its actual local twisted maximum and apply distinguished-place rescaling.
2. The product of the A_v is its twisted height; use the near-minimum bound. The independent scalar multiplications preserve independence.

**Check.** The distinguished place is finite and has zero weights and coordinate forms. Multiply the rescaling factors to recover the global near-minimum bound.

**Sources and use.**

- [A further improvement of the quantitative Subspace Theorem](https://annals.math.princeton.edu/wp-content/uploads/annals-v177-n2-p04-p.pdf), Lemma 11.2, pp. 547–548. The two-sided rescaling estimate compares the compound height and ordinary Euclidean height on the distinguished minimum space.

<a id="dt2-coefficient-approximation"></a>

### Adelic approximation of elimination coefficients

**Lemma.** Given algebraic θ₁,…,θ_{t−1}, a distinguished place v₀ and ε>0, there are algebraic γ₁,…,γ_t with γ_t≠0: |γ_i|_v≤t^{−s(v)} at archimedean v≠v₀ and≤1 at finite v≠v₀; at v₀, |γ_i−θ_iγ_t|_w≤1 and |γ_t|_w≤((1+ε)^t2^{t²})^{d(w|v₀)}. The formulation is after a finite extension containing all coefficients.

**Declaration:** `dt2_coefficient_approximation`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-coefficient-approximation`.

**Hypotheses.** All fields, dimensions, normalizations and strict inequalities are as specified in the statement.

**Inputs:** [From corrected absolute bases to twisted Minkowski](#dt2-absolute-minkowski-reduction), [Absolute rescaling with one distinguished place](#dt2-absolute-rescaling).

**Proof outline.**

1. Apply absolute Minkowski to a unipotent system with last coordinate γ_t and the error forms γ_i−θ_iγ_t.
2. Choose the first nonzero vector after absolute rescaling; if γ_t=0 the remaining coordinates have a strictly too small global product, contradicting the product formula.
3. Track the archimedean factors and use the generous 2^{t²} bound for the successive-minima product.

**Check.** The last coefficient must be nonzero; test the product-formula contradiction when all error coordinates are too small and that coefficient vanishes.

**Sources and use.**

- [A quantitative version of the Absolute Subspace Theorem](https://pub.math.leidenuniv.nl/~evertsejh/00-abssub.pdf), Lemma 9.1, pp. 37–39. This is the height redistribution lemma for an ordered basis and prescribed diagonal parameters; its comparisons precede the triangular change.

<a id="dt2-davenport-flag"></a>

### Davenport elimination along a Galois-defined flag

**Lemma.** In the parent semistable setting, with distinguished nonarchimedean v₀ where c_{iv₀}=0 and L_{iv₀}=X_i, fix Q≥1. Choose ε>0 with (1+ε)²λ_i<λ_{i+1} at every strict gap and n·2^{n²}(1+ε)^{n+1}<3^{n²}, and independent g_i with H_Q(g_i)≤(1+ε/2)λ_i. There are a finite extension E/K, a permutation π and a basis h_j preserving every initial span of the g_j, such that |L_{iw}(h_j)|_w≤n^{−s(w)}Q^{c_{iw}} for w not over v₀, and |L_{π(i),w}(h_j)|_w≤[3^{n²}min(λ_i,λ_j)]^{d(w|v₀)} for w over v₀. Here s(w) is the normalized infinite local degree and zero at finite places.

**Declaration:** `dt2_davenport_flag`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-davenport-flag`.

**Hypotheses.** All fields, dimensions, normalizations and strict inequalities are as specified in the statement.

**Inputs:** [Adelic approximation of elimination coefficients](#dt2-coefficient-approximation), [Nearly minimizing bases with concentrated archimedean slack](#dt2-minima-local-bases), [Successive infima, gap subspaces and Galois descent](#dt2-minima-galois).

**Proof outline.**

1. Select pivots in K-defined annihilators of the flag blocks; use Gaussian elimination in increasing block order.
2. Approximate each elimination coefficient by the preceding adelic lemma, preserving previous pivots. Multiply the local error bounds and sum the geometric losses to obtain 3^{n²}.

**Check.** Equal infima form one block; inventing a gap inside an equal block would make the descent argument invalid.

**Sources and use.**

- [A quantitative version of the Absolute Subspace Theorem](https://pub.math.leidenuniv.nl/~evertsejh/00-abssub.pdf), Lemma 9.2 and proof, pp. 39–45. The absolute Davenport argument produces the triangular basis with controlled local norms.
- [A further improvement of the quantitative Subspace Theorem](https://annals.math.princeton.edu/wp-content/uploads/annals-v177-n2-p04-p.pdf), Lemma 11.3, p. 548. This is the particular redistribution contract needed for the compound-minimum argument.

<a id="dt2-compound-minima"></a>

### Compound heights, truncated weights and the final wedge

**Lemma.** Put p=n−k and N=binomial(n,p). Index the compound coordinates I_j lexicographically and set ĉ_jv=Σ_{i∈I_j}c_iv and ν_j=∏_{i∈I_j}λ_i. These ν_j are not generally increasing, although ν_N and ν_{N−1} are the largest and second largest. Under EF (11.8)–(11.9), truncate the distinguished-place last product to ν_{N−1} as in (11.15). Away from v₀ the compound weights sum to zero, max|ĉ|≤(n−1)max c and their summed maxima are≤n−1; at v₀ their sum is≤−δ/n and max|ĉ|≤n. The inverse compound coefficient height is≤H_L^(R^n), and the N−1 wedge span has height H₂(T_k(Q))>Q^(δ/(3R^n)). Separately, for the untruncated compound system sort the products as μ₁≤⋯≤μ_N. Its infima satisfy N^(−npN)μ_j≤λ̂_j≤p^(p/2)μ_j.

**Declaration:** `dt2_compound_minima`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-compound-minima`.

**Hypotheses.** All fields, dimensions, normalizations and strict inequalities are as specified in the statement.

**Inputs:** [Local exterior-power norm and determinant bounds](#dt2-exterior-local-norm), [Davenport elimination along a Galois-defined flag](#dt2-davenport-flag), [DiophantineApproximationAndTranscendence:DT.2/height-of-linear-subspace](../packets/DiophantineApproximationAndTranscendence.json), [Successive infima, gap subspaces and Galois descent](#dt2-minima-galois), [Restriction heights and subspace-height lower bounds](#dt2-restriction-height), [From corrected absolute bases to twisted Minkowski](#dt2-absolute-minkowski-reduction).

**Proof outline.**

1. Apply the Davenport basis estimate to the lexicographic wedges. Keep the permutation of compound coordinates; the last two products have ratio λ_k/λ_{k+1}.
2. At v₀ replace the largest product by the second largest. The product of all ν_j is (∏λ_i)^binomial(n−1,p−1), so the quantitative gap makes the distinguished weight sum negative. The product bounds control its absolute coordinates.
3. Use complementary minors and the determinant-height identity to bound the inverse compound matrices; exterior duality identifies the N−1 wedge-span height with the k-gap subspace height.
4. For the untruncated comparison use independent nearly minimizing wedges to bound λ̂_j≤p^(p/2)μ_j. Absolute Minkowski in dimensions n and N bounds the product of λ̂_j/μ_j below, and the upper bounds on the other ratios give the weaker explicit lower factor N^(−npN).

**Check.** Check N=binomial(n,n−k), lexicographic compound coordinates, the zero weight sums away from v₀ and the strictly negative sum at v₀ separately.

**Sources and use.**

- [A further improvement of the quantitative Subspace Theorem](https://annals.math.princeton.edu/wp-content/uploads/annals-v177-n2-p04-p.pdf), Lemmas 11.4–11.6, pp. 549–551; Lemmas 17.1–17.3, pp. 576–577. The truncation targets the distinguished final compound directions. Lexicographic products are separated from the sorted compound-minimum list; Lemma 17.3 has lower factor N^(−npN).

<a id="dt2-siegel-kernel"></a>

### Small vectors in number-field linear kernels

**Theorem.** Let K have degree d and discriminant D_K, C_K=|D_K|^{1/(2d)}, and let A be an M×N matrix of rank M<N. There are L=N−M independent vectors x_j∈O_K^N in its kernel with ∏_j H₂(x_j)≤(√N C_K)^L H₂(row A). Consequently one has H₂(x)≤√N C_K H₂(row A)^{1/L} for some x≠0. Since H₂(row A)≤∏_iH₂(A_i), this implies the parent Lemma 13.1 bound for U<N possibly dependent equations, using denominator N−U. The finite-place primitive row-minor ideal is already incorporated into H₂(row A), and must not be divided out a second time.

**Declaration:** `dt2_siegel_kernel`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-siegel-kernel`.

**Hypotheses.** All fields, dimensions, normalizations and strict inequalities are as specified in the statement.

**Inputs:** [GeometryOfNumbersAndQuadraticArithmetic:GN.0/mixed-embedding-normalization](../packets/GeometryOfNumbersAndQuadraticArithmetic.json), [DiophantineApproximationAndTranscendence:DT.2/height-of-linear-subspace](../packets/DiophantineApproximationAndTranscendence.json), [GeometryOfNumbersAndQuadraticArithmetic:GN.1](../packets/GeometryOfNumbersAndQuadraticArithmetic.json), [Plücker duality and orthogonal complement heights](#dt2-subspace-duality).

**Proof outline.**

1. Use the lower-tier adelic-minima and normalized ball-product section contracts requested from GN.1. For a kernel basis Y, BV Theorem 7 gives the adelic box volume≥H₂(Y)^{−d}|D_K|^{−L/2} in Haar measure with covolume-one K^L.
2. BV Theorem 3 bounds (∏λ_j)^d times that volume by 2^{dL}. Theorem 8 converts its independent witnesses to integral vectors with ∏H∞(x_j)≤[(2/π)^{r₂/d}C_K]^L H₂(Y). Complementary minors and the product formula identify H₂(Y)=H₂(row A). Finally H₂(x_j)≤√N H∞(x_j), and (2/π)^{r₂/d}≤1 gives the displayed bound.
3. Take the least-height vector among the N−M independent vectors. EF only needs the half-rank corollary, but the primitive ideal and discriminant are retained.

**Check.** A rank-deficient matrix must first be replaced by independent rows; an N/2 bound counts independent conditions, not a claimed exact rank.

**Sources and use.**

- [On Siegel’s lemma](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0073/LOG_0008.pdf), Theorem 9 and proof, pp. 23–30. The kernel-lattice determinant and adelic section-volume argument are the number-field Siegel input.
- [A geometric inequality with applications to linear forms](https://msp.org/pjm/1979/83-2/pjm-v83-n2-p24-s.pdf), Theorem 1, pp. 543–544; §§2–3, pp. 545–549. The section-volume bound applies to products of Euclidean balls. Its conjectural extension to arbitrary convex bodies is unused.
- [A further improvement of the quantitative Subspace Theorem](https://annals.math.princeton.edu/wp-content/uploads/annals-v177-n2-p04-p.pdf), Lemma 13.1, p. 553. This is the coefficient-vector application with its field-dependent constant. Real self-dual lattice statements alone do not prove it.

<a id="dt2-auxiliary-count"></a>

### Coefficient count and simultaneous weighted-tail constraints

**Lemma.** For m blocks of N variables of degrees r_h, the number of monomials is V=∏_h binomial(r_h+N−1,N−1). For each place in a finite set S₀, the proportion of exponent tuples outside the weighted concentration band is≤exp(−mε²/2). Hence m>2ε^{−2}log(2|S₀|+2) leaves fewer than V/2 simultaneous linear coefficient conditions.

**Declaration:** `dt2_auxiliary_count`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-auxiliary-count`.

**Hypotheses.** All fields, dimensions, normalizations and strict inequalities are as specified in the statement.

**Inputs:** [DiophantineApproximationAndTranscendence:DT.2/block-homogenization](../packets/DiophantineApproximationAndTranscendence.json), [DiophantineApproximationAndTranscendence:DT.2/finite-simplex-discretisation](../packets/DiophantineApproximationAndTranscendence.json).

**Proof outline.**

1. Treat uniform weak compositions in each block as independent variables; normalize the weighted sums using the actual local weight range.
2. Apply the bounded-variable exponential-moment estimate and union bound. Count compositions directly: no extra product of block degrees multiplies V.
3. Each condition is coefficient extraction after the local linear substitution; bound its coefficient height by ((6N²)^s C_v)^{Σr_h}.

**Check.** Count linear conditions by a union bound across the actual finite representative systems. The count must be strictly less than V/2 before invoking Siegel.

**Sources and use.**

- [A further improvement of the quantitative Subspace Theorem](https://annals.math.princeton.edu/wp-content/uploads/annals-v177-n2-p04-p.pdf), Lemmas 13.3–13.4, pp. 554–556. The multihomogeneous coefficient-space count and weighted high-derivative conditions leave enough coefficients for the small auxiliary polynomial.

<a id="dt2-weight-net-repair"></a>

### Simplex discretization of normalized local weights

**Lemma.** Let c∈ℝⁿ, Σc_i=0, γ=max c_i>0 and 0<ε≤1/10. Set b_i=1−c_i/γ, so b_i≥0 and Σb_i=n. The bins (⌊b_i/ε⌋)_i have at most binomial(⌊n/ε⌋+n,n)≤(3/ε)^n values. Choosing one actual weight vector per occupied bin gives coordinate error<ε. Together with at most Rⁿ ordered local form systems this gives |S₀|≤(3R/ε)^n, the count used in EF §14.

**Declaration:** `dt2_weight_net_repair`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-weight-net-repair`.

**Hypotheses.** All fields, dimensions, normalizations and strict inequalities are as specified in the statement.

**Inputs:** [DiophantineApproximationAndTranscendence:DT.2/finite-simplex-discretisation](../packets/DiophantineApproximationAndTranscendence.json), [Coefficient count and simultaneous weighted-tail constraints](#dt2-auxiliary-count).

**Proof outline.**

1. The printed cube [−1,1]ⁿ is false for normalized zero-sum weights. The b-coordinates put them in the simplex of mass n.
2. Stars-and-bars counts all floor tuples of sum≤⌊n/ε⌋. Use binomial(a+n,n)≤(e(a+n)/n)^n and e(1+ε)≤3.
3. Take representatives from occupied bins; do not replace them by arbitrary weight vectors which might violate normalization. The ε used in §14 is inside this range.

**Check.** For n=3, c=(−2,1,1) has γ=1 and b=(3,0,0); it is permitted. This argument does not assert the same bound for every ε<1; the unused larger-ε formulation remains outside this repair.

**Sources and use.**

- [A further improvement of the quantitative Subspace Theorem](https://annals.math.princeton.edu/wp-content/uploads/annals-v177-n2-p04-p.pdf), Proposition 13.6 proof, p. 559; §14, pp. 561–565. The zero-sum weights are discretized on a simplex, correcting the false cube assertion. The repaired count is used only in the ε≤1/10 range of the quantitative application.

<a id="dt2-auxiliary-existence"></a>

### Auxiliary polynomial with half-rank height control

**Theorem.** For the compound system with N=binomial(n,n−k), positive block degrees r_h and 0<ε≤1/10, assume m>2nε^−2 log(4R/ε). There is a nonzero multihomogeneous P such that, for every normalized derivative of weighted order≤2mε, its transformed coefficient of a monomial j vanishes when Σ_{h,l}ĉ_lv j_hl/r_h>4mnεγ_v away from v₀, or when Σ_{h,l}ĉ_l,v₀(Q_h)j_hl/r_h>−mδ/(nN)+4mnε at v₀. Here γ_v=max_i c_iv and the distinguished weights may depend on Q_h. One has H₂(P)≤C_K(2^(3n)H_L^(R^n))^Σr_h; the product of local maxima of the transformed derivative coefficient norms is≤C_K(2^(6n)H_L^(2R^n))^Σr_h. C_K depends on the fixed coefficient field and not on the large degree parameter.

**Declaration:** `dt2_auxiliary_existence`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-auxiliary-existence`.

**Hypotheses.** All fields, dimensions, normalizations and strict inequalities are as specified in the statement.

**Inputs:** [Small vectors in number-field linear kernels](#dt2-siegel-kernel), [Coefficient count and simultaneous weighted-tail constraints](#dt2-auxiliary-count), [Simplex discretization of normalized local weights](#dt2-weight-net-repair), [Compound heights, truncated weights and the final wedge](#dt2-compound-minima).

**Proof outline.**

1. The finite-net bound makes the number of imposed coefficient conditions less than half the coefficient dimension. Apply the number-field kernel theorem with this half-rank inequality.
2. For a derivative of weighted order≤2mε and a net-bin error<ε, translate the representative tail threshold to the enlarged threshold above at every original place. The prohibited coefficients have high weight.
3. Bound substitution and derivative coefficient losses using the inverse compound matrices. Multiply the local bounds, retaining C_K; only the later choice of a sufficiently large degree absorbs that fixed constant.

**Check.** The polynomial must be nonzero and satisfy every original place constraint, including those represented by a net bin. Keep C_K independent of the degree parameter.

**Sources and use.**

- [A further improvement of the quantitative Subspace Theorem](https://annals.math.princeton.edu/wp-content/uploads/annals-v177-n2-p04-p.pdf), Proposition 13.5, pp. 556–557; Proposition 13.6, pp. 558–561. The forbidden derivatives have high weighted order. The half-rank estimate and transformed derivative bounds require m>2nε^−2 log(4R/ε), with the stated field and form-height factors.

<a id="dt2-semistable-product-contradiction"></a>

### Nonzero jet and product-formula contradiction

**Theorem.** In the semistable case with 0<δ≤1, take the auxiliary polynomial, compound bases and separated parameters of EF §14. Choose ε with 10nε<δ/(nN). The nonzero evaluated jet supplied by the parent grid/Roth inputs has global product at most (eN²2^{7n}H_L^{2Rⁿ})^{Σr_h}(Q₁^{mr₁})^{10nε−δ/(nN)}, after choosing r₁ sufficiently large to absorb C_K. For Q₁ above the stated source threshold this product is<1, contradicting the product formula.

**Declaration:** `dt2_semistable_product_contradiction`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-semistable-product-contradiction`.

**Hypotheses.** All fields, dimensions, normalizations and strict inequalities are as specified in the statement.

**Inputs:** [Auxiliary polynomial with half-rank height control](#dt2-auxiliary-existence), [Compound heights, truncated weights and the final wedge](#dt2-compound-minima), [DiophantineApproximationAndTranscendence:DT.2/nonvanishing-on-grids](../packets/DiophantineApproximationAndTranscendence.json), [DiophantineApproximationAndTranscendence:DT.2/sharp-roths-lemma](../packets/DiophantineApproximationAndTranscendence.json).

**Proof outline.**

1. Balance the degrees so Q_h^{r_h} lie between Q₁^{r₁} and (Q₁^{r₁})^{1+ε}; choose the integer grid jet using the parent strict vanishing threshold.
2. At finite places bound every term ultrametrically; at infinity account for the derivative coefficient and substitution losses.
3. Multiply all local bounds. The negative exponent comes from the distinguished compound coordinate, while all other weight sums cancel. Take the degree parameter large only after Q and the fixed-field constant are fixed.

**Check.** The jet is nonzero, so its global absolute-value product is 1. Verify the negative exponent and the strict upper bound less than 1 after absorbing C_K.

**Sources and use.**

- [A further improvement of the quantitative Subspace Theorem](https://annals.math.princeton.edu/wp-content/uploads/annals-v177-n2-p04-p.pdf), §14, equations (14.1)–(14.27), pp. 561–565. The gap selects degrees adapted to separated Q-values and converts the auxiliary-polynomial derivative bound into the high-index conclusion.

<a id="dt2-weight-restriction-quotient"></a>

### Restriction and quotient slopes of the weight flag

**Lemma.** For any K-defined proper subspace T, choose at each place the lexicographically least restricted independent basis I_v(T) in the order of increasing c_iv. These selected weights give the restriction. Eliminate their forms by the chosen minor to obtain triangular quotient forms indexed by the complementary indices. For U⊃T the quotient weight is w(U)−w(T). On each consecutive block of the canonical weight flag, subtract its mean slope to obtain a semistable system. The slopes strictly decrease. The last proper flag member, rather than the first positive-slope member, is the unique smallest-dimensional maximizer of w(U)/(n−dim U).

**Declaration:** `dt2_weight_restriction_quotient`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-weight-restriction-quotient`.

**Hypotheses.** All fields, dimensions, normalizations and strict inequalities are as specified in the statement.

**Inputs:** [DiophantineApproximationAndTranscendence:DT.2/weight-and-exceptional-subspace](../packets/DiophantineApproximationAndTranscendence.json), [DiophantineApproximationAndTranscendence:DT.2/twisted-height-filtration](../packets/DiophantineApproximationAndTranscendence.json), [Restriction heights and subspace-height lower bounds](#dt2-restriction-height).

**Proof outline.**

1. The weighted independent-basis rule realizes the minimum defining w_v(T). Supermodularity of the global weight identifies the canonical flag maximizers.
2. Construct the quotient forms by triangular elimination, not by simply restricting unmodified complementary forms. Verify the quotient identity for each U containing T and extension invariance.
3. For consecutive canonical blocks use the maximality of the flag to bound all proper subspace slopes. Subtract the block mean, yielding weight≤0 and thus semistability.
4. The final maximizing ratio follows from the strictly decreasing slopes; the dimension-weight expression stops at n−1.

**Check.** For each intermediate U containing T verify the quotient weight formula. Mean shifts must make every block semistable and the dimension-weighted slopes sum correctly.

**Sources and use.**

- [A further improvement of the quantitative Subspace Theorem](https://annals.math.princeton.edu/wp-content/uploads/annals-v177-n2-p04-p.pdf), Lemmas 15.1–15.4, pp. 565–570; Lemmas 16.2–16.3, pp. 571–573. Weighted lexicographic bases define the filtration. Each quotient uses descended triangularly eliminated forms; the proper last term is the exceptional space.

<a id="dt2-semistable-minima-asymptotics"></a>

### Asymptotics of successive infima on semistable blocks

**Theorem.** For a semistable n-dimensional twisted system with total weight zero and any δ>0, eventually λ₁(Q)>Q^{−δ/(2n)} and λ_n(Q)≤Q^δ. On a block with mean weight μ, undoing the shift gives log λ_i(Q)/log Q→−μ. In the full flag, the exponent α in the Minkowski product is Σ(block dimension)·μ; cumulative flag dimensions would give the wrong sum.

**Declaration:** `dt2_semistable_minima_asymptotics`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-semistable-minima-asymptotics`.

**Hypotheses.** All fields, dimensions, normalizations and strict inequalities are as specified in the statement.

**Inputs:** [Nonzero jet and product-formula contradiction](#dt2-semistable-product-contradiction), [Restriction and quotient slopes of the weight flag](#dt2-weight-restriction-quotient), [From corrected absolute bases to twisted Minkowski](#dt2-absolute-minkowski-reduction).

**Proof outline.**

1. The semistable interval theorem prevents arbitrarily large Q with a small first minimum: its finitely many bounded multiplicative intervals cannot contain an unbounded sequence.
2. Use the absolute Minkowski product and monotonicity to bound the largest minimum. Dimension one follows directly from the product formula.
3. Induct along the flag using restricted/quotient comparisons. Match the slopes in increasing minimum order, and verify that their dimension-weighted sum is the total exponent.

**Check.** In dimension one recover the product formula directly. Higher dimensions use finitely many bounded intervals, rather than assuming infima are attained.

**Sources and use.**

- [A further improvement of the quantitative Subspace Theorem](https://annals.math.princeton.edu/wp-content/uploads/annals-v177-n2-p04-p.pdf), Proposition 16.1 and Lemmas 16.2–16.4, pp. 570–575. The fixed-space proof combines the quotient filtration with a height gap and scalar rescaling. The low-minimum space agrees with the proper filtration term.

<a id="dt2-flag-height-bound"></a>

### Quantitative height of the canonical weight flag

**Theorem.** Let B=max_L H₂(L) over the distinct individual linear forms. For each member T_i of the canonical weight flag, H₂(T_i)≤B^(4^n). The intermediate hyperplane estimate is B^((n−1)^2). For a k-space use p=n−k and the compound dimension N=binomial(n,p): each compound form has height≤B^p, and p(N−1)^2≤4^n. In the normalized coordinate-form setting of EF §18, B≤√nH_L, so H₂(T_i)≤(√nH_L)^(4^n). B and H_L are different heights.

**Declaration:** `dt2_flag_height_bound`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-flag-height-bound`.

**Hypotheses.** All fields, dimensions, normalizations and strict inequalities are as specified in the statement.

**Inputs:** [Compound heights, truncated weights and the final wedge](#dt2-compound-minima), [Asymptotics of successive infima on semistable blocks](#dt2-semistable-minima-asymptotics), [Plücker duality and orthogonal complement heights](#dt2-subspace-duality), [Local exterior-power norm and determinant bounds](#dt2-exterior-local-norm).

**Proof outline.**

1. Use the asymptotic flag and successive-infima estimates to obtain the hyperplane height bound in terms of the maximum individual form height B.
2. Pass to the untruncated compound system and its asymptotic final hyperplane. Exterior duality gives equal subspace heights; the exterior local norm bounds each compound form by B^p.
3. Use p(N−1)^2≤4^n. When coordinate forms are present, their determinant-height bound controls each coefficient and gives B≤√nH_L.

**Check.** For B=1 the flag bound forces height 1; for n=3 the exponent is 64. H_L=1 alone does not imply B=1.

**Sources and use.**

- [A further improvement of the quantitative Subspace Theorem](https://annals.math.princeton.edu/wp-content/uploads/annals-v177-n2-p04-p.pdf), Lemmas 17.1–17.5, pp. 576–579; Lemma 18.1, p. 580. These are the compound-coordinate bounds and the filtration-height induction. B bounds individual form heights; B≤√n H_L in the normalized system.

<a id="dt2-quotient-interval-transfer"></a>

### Exceptional quotient and transfer of the interval theorem

**Theorem.** Let T be the k-dimensional exceptional subspace, k<n. The quotient map φ_T has triangular minor coordinates and compares H_Q outside T to the quotient height with constant≤(2H_L)^{(8R)ⁿ}. Choose θ_v as the average of the complementary quotient weights and d_{iv}=(n−k)(c_{iv}−θ_v)/n on complementary indices; put Q′=Q^{n/(n−k)}. The quotient is semistable, has at most nRⁿ distinct forms and H_L″≤(2H_L)^{(8R)ⁿ}. For Q>(2H_L)^{200(8R)ⁿ/δ}, H_Q(x)≤Δ^{1/n}Q^{−δ}, x∉T implies H_{Q′}″(φ_Tx)≤(Q′)^{−99δ/(100n)}.

**Declaration:** `dt2_quotient_interval_transfer`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-quotient-interval-transfer`.

**Hypotheses.** All fields, dimensions, normalizations and strict inequalities are as specified in the statement.

**Inputs:** [Restriction and quotient slopes of the weight flag](#dt2-weight-restriction-quotient), [Quantitative height of the canonical weight flag](#dt2-flag-height-bound), [Nonzero jet and product-formula contradiction](#dt2-semistable-product-contradiction), [Restriction heights and subspace-height lower bounds](#dt2-restriction-height).

**Proof outline.**

1. Use the selected restricted minor to eliminate T and bound all quotient coefficients by determinants.
2. Verify Σθ_v=−w(T)/(n−k)≤0 and normalize the quotient weights; transfer semistability through w(U)−w(T).
3. Apply the semistable interval result with the reduced dimension and δ′=99δ/(100n). Translate Q′ intervals back to Q and absorb the comparison constants using the stated Q threshold.

**Check.** Check the identity (Q′)^{d_iv}=Q^{c_iv−θ_v} and δ′=99δ/(100n). The quotient dimension is n−k and the conclusion excludes x∈T.

**Sources and use.**

- [A further improvement of the quantitative Subspace Theorem](https://annals.math.princeton.edu/wp-content/uploads/annals-v177-n2-p04-p.pdf), Lemmas 18.1–18.5, pp. 580–585. The height bound and quotient exponents force a stable low-minimum space above the strict threshold. The relevant mean is over the complement of the selected restriction.

<a id="dt2-interval-assembly"></a>

### Bounded intervals, systems and final subspace counts

**Application.** The parent Parametric Subspace Theorem and its system/interval refinements follow by combining: one exceptional K-subspace; the quotient interval theorem above for x outside it; the elementary short-range gap principle; and the finite system reduction. For each multiplicative interval [Q_h,Q_h^ω), enlarge its endpoints greedily as in EF Lemma 5.2, with the source count and the determinant Δ preserved. The systems statement uses the parent Lemma 5.1 conversion before applying this cover.

**Declaration:** `dt2_interval_assembly`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-interval-assembly`.

**Hypotheses.** All fields, dimensions, normalizations and strict inequalities are as specified in the statement.

**Inputs:** [Exceptional quotient and transfer of the interval theorem](#dt2-quotient-interval-transfer), [DiophantineApproximationAndTranscendence:DT.2/twisted-height-gap-principle](../packets/DiophantineApproximationAndTranscendence.json), [DiophantineApproximationAndTranscendence:DT.2/twisted-height-of-system-solutions](../packets/DiophantineApproximationAndTranscendence.json), [DiophantineApproximationAndTranscendence:DT.2/product-inequality-reduces-to-systems](../packets/DiophantineApproximationAndTranscendence.json).

**Proof outline.**

1. Order the interval starts and cover each surviving long interval by short gap ranges. Greedy endpoint extension controls the number without changing the exceptional subspace.
2. Insert the explicit n,R,δ constants from the parent targets; restriction and quotient losses have already been bounded above.
3. The classical and p-adic forms, Roth, bounded-degree approximation and Thue–Mahler applications remain parent targets. This node supplies their missing absolute quantitative input rather than redeclaring those targets.

**Check.** Preserve the exceptional subspace, determinant normalization and the parent endpoint conventions while moving between systems, short ranges and long intervals.

**Sources and use.**

- [A further improvement of the quantitative Subspace Theorem](https://annals.math.princeton.edu/wp-content/uploads/annals-v177-n2-p04-p.pdf), Proposition 5.2, p. 532; Theorems 2.1, 2.3, 3.1 and 3.3, pp. 518–526. The local-gap cover and bounded low-height interval are assembled using half-open Q-intervals. These are the interfaces imported by the parent quantitative targets.

## Product components and the nonvanishing input

<a id="dt2-multiprojective-degree"></a>

### Multiprojective degrees and the product criterion

**Lemma.** For an irreducible Z⊂∏P^{n_h} of dimension d, the numbers (Z·L₁^{e₁}⋯L_m^{e_m}) are nonnegative integers for Σe_h=d. For a product Z=∏Z_h only e_h=dim Z_h is nonzero, and that value is∏deg Z_h. Conversely, if Z is not a product, at least two exponent tuples have positive intersection number. For L=Σd_hL_h, (Z·L^d) is the multinomial sum with coefficients d_h^{e_h}.

**Declaration:** `dt2_multiprojective_degree`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-multiprojective-degree`.

**Hypotheses.** All fields, dimensions, normalizations and strict inequalities are as specified in the statement.

**Inputs:** [SchemeAndStackFoundations:SF.5](../packets/SchemeAndStackFoundations.json).

**Proof outline.**

1. Iterate the projective-bundle formula to obtain the ambient Chow ring ℤ[L_h]/(L_h^{n_h+1}); apply proper Cartier intersections to effective cycles.
2. For each projection Z_h=π_hZ choose enough generic hyperplanes to achieve exponent dim Z_h and continue cutting other factors. If Z is not the whole product, Σdim Z_h>dim Z, producing two distinct supported degree tuples.
3. The geometric argument uses proper projection images and generic hyperplane dimension drops from the lower-tier scheme owner.

**Check.** A product of points has degree 1 and a product of projective spaces has the expected multinomial degree; do not replace multidegree by a single affine polynomial degree.

**Sources and use.**

- [An explicit version of Faltings’ Product Theorem and an improvement of Roth’s lemma](https://pub.math.leidenuniv.nl/~evertsejh/95-product.pdf), §2, Lemmas 1–3, pp. 10–12. The support and projection-degree inequalities are the geometric input to the product conclusion. General intersection theory remains a requested SF.5 contract.

<a id="dt2-index-multiplicity"></a>

### Weighted jets force local multiplicity

**Lemma.** Work over an algebraically closed characteristic-zero field, with m≥2, positive n_h,d_h, M=Σn_h, σ≥0, 0<ε≤1, and F≠0 multihomogeneous of degrees d_h. Suppose Z is an irreducible component of both index loci Z_σ and Z_(σ+ε), of codimension s≥1. Let π_h project to factors h,…,m, and set δ_h=dim π_h(Z)−dim π_(h+1)(Z), with π_(m+1)(Z) a point. For the localized derivative ideal I defining Z_σ its component multiplicity satisfies m_Z≥(ε/s)^s∏d_h^(n_h−δ_h). If d_h/d_(h+1)≥(mM/ε)^M for all h<m, properly meeting derivative cuts and the multiprojective degree support force Z to be a product.

**Declaration:** `dt2_index_multiplicity`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-index-multiplicity`.

**Hypotheses.** All fields, dimensions, normalizations and strict inequalities are as specified in the statement.

**Inputs:** [DiophantineApproximationAndTranscendence:DT.2/block-homogeneous-strict-vanishing](../packets/DiophantineApproximationAndTranscendence.json), [SchemeAndStackFoundations:SF.5](../packets/SchemeAndStackFoundations.json), [Multiprojective degrees and the product criterion](#dt2-multiprojective-degree).

**Proof outline.**

1. Localize at Z and use the regular local ring of the smooth multiprojective ambient space in characteristic zero. Ordinary and divided derivatives differ by invertible factorials, so the strict weighted-jet convention gives the same index.
2. Filter normal variables by the successive projections π_h. Their counts are n_h−δ_h and sum to s. Count monomials in the weighted simplex to get the explicit multiplicity bound.
3. Use properly meeting derivative cuts with their component lengths and the two positive degree tuples of a nonproduct. The separated d_h make their upper intersection bounds incompatible with the lower multiplicity estimate.

**Check.** Use strict jet vanishing below the index threshold. The component multiplicity bound and the choice of ordinary versus Hasse derivatives must agree in characteristic zero.

**Sources and use.**

- [An explicit version of Faltings’ Product Theorem and an improvement of Roth’s lemma](https://pub.math.leidenuniv.nl/~evertsejh/95-product.pdf), Lemma 4, pp. 12–13; Lemma 10 and proof, pp. 23–27. The localized index ideal has the stated multiplicity lower bound, with positive block dimensions and degrees. Degree separation then forces the product component.

<a id="dt2-cycle-height"></a>

### Fubini–Study Chow height

**Definition.** For an effective r-cycle Z in Pⁿ over Q̄ with Chow form F_Z, define its normalized Fubini–Study height as the sum over finite places of log coefficient sup norms, plus at infinity the integral of log|F_Z| over r+1 unit spheres with probability measure, plus (r+1)deg(Z)H_n/2, where H_n=Σ_{j=1}^n1/j. Normalize local contributions by [K:ℚ] and archimedean multiplicities. Extend additively to cycles. Multiprojective heights h_L(Z) use the Segre–Veronese metric associated to positive L=O(d₁,…,d_m), with the same point-height normalization. This arithmetic invariant is owned here; generic Chow groups and proper intersections are imported from SF.5.

**Declaration:** `dt2_cycle_height`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-cycle-height`.

**Hypotheses.** All fields, dimensions, normalizations and strict inequalities are as specified in the statement.

**Inputs:** [SchemeAndStackFoundations:SF.5](../packets/SchemeAndStackFoundations.json), [DiophantineApproximationAndTranscendence:DT.2/height-of-linear-subspace](../packets/DiophantineApproximationAndTranscendence.json), [Current-owner places and absolute height normalization](#dt2-place-normalization).

**Proof outline.**

1. Construct the incidence Chow form using the generic projective intersection/degree contract requested from SF.5.
2. Show integrability of log|F_Z| on the spheres and cancellation under rescaling by the product formula. The cited source specifies the height normalization and invokes arithmetic intersection theory; a proof of its analytic/arithmetic Bézout estimates is a recorded gap.
3. The harmonic term is chosen so a point has log Euclidean projective height. Do not replace this by the logarithm of the coefficient height of the Chow form.

**Planning API.** These are proposed contracts; only the light definitions and selected statements fit the suggested file.

| Name | Role | Contract |
| --- | --- | --- |
| `chowHeight_scalar` | compatibility | Changing the nonzero scalar of F_Z leaves h(Z) unchanged. |
| `chowHeight_baseChange` | functoriality | Finite extension of the defining field leaves the normalized height unchanged. |
| `chowHeight_add` | structure | h(Z+W)=h(Z)+h(W) for effective cycles. |
| `chowHeight_point` | characterisation | h([x])=log H₂(x). |
| `chowHeight_coefficient` | relation | \|h(Z)−log H₂(F_Z)\|≤c(n,r)deg Z with an explicit computable constant. |
| `chowHeight_segre` | compatibility | At a product point h_L(P₁,…,P_m)=Σ d_h log H₂(P_h). |
| `chowHeight_ofChowForm` | constructor | For a valid incidence Chow form, evaluate the stated normalized finite and sphere-integral formula; integrability and its arithmetic-height comparison are the declared analytic gap. |
| `chowHeight_ext` | extensionality | Two incidence Chow representatives of the same effective cycle differ by a nonzero scalar and yield the same height; a cycle equality transports the height. |

**Consumers.** Sharp Roth proof: Arithmetic intersection bounds turn a high-index product component into an upper bound on one approximating point. Product Theorem arithmetic estimate: The degree-weighted sum of factor heights must use Fubini–Study point normalization.

**Unit tests.**

- `test_cycle_height_1` (computation): The point [1:1] has height (log 2)/2, not 0.
- `test_cycle_height_2` (degenerate): The unique cycle point of P⁰ has height 0; doubling a point doubles its height.
- `test_cycle_height_3` (non-example): For Z=P¹, the determinant Chow form and harmonic correction give h(Z)=1/2. Plain log coefficient sup height would give 0.

**Check.** Compute [1:1] and P¹ with the sphere-integral harmonic correction. Scalar and finite-extension invariance must hold in this normalization.

**Sources and use.**

- [An explicit version of Faltings’ Product Theorem and an improvement of Roth’s lemma](https://pub.math.leidenuniv.nl/~evertsejh/95-product.pdf), §1, equations (1.5)–(1.6), p. 5; §3, Lemmas 6–8, pp. 16–20. The sphere-integral cycle-height normalization and product constants are specified here. The full primary proof of the arithmetic intersection input is still the declared gap.

<a id="dt2-arithmetic-intersection"></a>

### Arithmetic cuts and the factor-height estimate

**Theorem.** For the high-index component in the Product Theorem, successive effective Cartier cuts using bounded-height derivatives give the source estimate [k₁:k₀]∏deg Z_h Σ_h d_h h(Z_h)/deg Z_h ≤2(s/ε)^s m^M·M²(Σd_h+log H₂(F)), where M=Σn_h and s=Σcodim Z_h. The geometric degree bound is [k₁:k₀]∏deg Z_h≤(ms/ε)^s. Conjugate components contribute positively; heights are not bounded by degrees alone.

**Declaration:** `dt2_arithmetic_intersection`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-arithmetic-intersection`.

**Hypotheses.** K⊂Q̄ is a number field of coefficients, m≥2, n_h,d_h>0, M=Σn_h, σ≥0 and 0<ε≤1. F is nonzero of multidegree d; d_h/d_(h+1)≥(mM/ε)^M for h<m. Z is a common irreducible component of Z_σ and Z_(σ+ε); by the product criterion Z=∏Z_h, with s=Σcodim Z_h≥1 and k₁/k₀ the minimal defining extension.

**Inputs:** [Fubini–Study Chow height](#dt2-cycle-height), [Weighted jets force local multiplicity](#dt2-index-multiplicity), [Multiprojective degrees and the product criterion](#dt2-multiprojective-degree), [SchemeAndStackFoundations:SF.5](../packets/SchemeAndStackFoundations.json).

**Proof outline.**

1. Construct the truncated effective cycles from successive generic sections, removing components already captured by the index locus.
2. Bound the height of each derivative by its degree factorial loss and H₂(F); apply arithmetic Bézout in the specified metric, which is the precise recorded source gap.
3. Sum over the Galois orbit to obtain [k₁:k₀]; keep the factor 1/deg Z_h and the product of all degrees.

**Check.** Keep m^M M², the Galois orbit factor, the product of factor degrees and the division by each factor degree. This node remains conditional on the stated arithmetic Bézout gap.

**Sources and use.**

- [An explicit version of Faltings’ Product Theorem and an improvement of Roth’s lemma](https://pub.math.leidenuniv.nl/~evertsejh/95-product.pdf), Theorems 1–2, pp. 4–5; §3, pp. 14–22; §4, p. 28. The arithmetic Product Theorem has the same geometric separation hypotheses plus the cycle-height and derivative estimates. Its use remains conditional on the explicitly identified arithmetic Bézout input.

<a id="dt2-sharp-roth-boundary"></a>

### Strict index conclusion at the weak height boundary

**Theorem.** Let m≥2, 0<Θ≤1, F≠0 of binary block degrees d_h>0, and d_h/d_{h+1}≥2m²/Θ. If H₂(x_h)^{d_h}≥(e^{Σd_h}H₂(F))^{(3m²/Θ)^m} for every block, then the index is<mΘ. This is the boundary version used by the parent sharp Roth node: Evertse 1995 states a strict height premise, while the later 1996 lemma uses≥.

**Declaration:** `dt2_sharp_roth_boundary`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-sharp-roth-boundary`.

**Hypotheses.** All fields, dimensions, normalizations and strict inequalities are as specified in the statement.

**Inputs:** [Arithmetic cuts and the factor-height estimate](#dt2-arithmetic-intersection), [DiophantineApproximationAndTranscendence:DT.2/block-homogeneous-weighted-index](../packets/DiophantineApproximationAndTranscendence.json), [Multiprojective degrees and the product criterion](#dt2-multiprojective-degree), [Weighted jets force local multiplicity](#dt2-index-multiplicity).

**Proof outline.**

1. Suppose index≥ε=mΘ and put ε′=ε/(m+1). The chain of m+2 index loci gives a repeated irreducible component Z containing the point, of codimension s≥1. Let δ_i be the successive trailing-projection dimension increments.
2. For the binary factors use the strengthened supported-degree argument of Product Theorem Lemma 11: choose e_i∈{0,1} with positive intersection number, Σe_i=dim Z and η_i=Σ_(j≥i)(δ_j−e_j)≥0. Induct by a generic first-factor cut; on the simultaneous smooth locus the projection dimensions are ranks of coordinate functions, and a cut decreases precisely those ranks spanning the first coordinate. This gives Σ_(i≥2)η_i≥Σdim π_i(Z)−dim Z.
3. If every individual projection is the whole P¹ then Ση_i≥s. The localized multiplicity bound and the supported-degree intersection bound give 1≤(ms/ε′)^s∏_(i≥2)(d_i/d_(i−1))^η_i≤((m+1)/(2m))^s<1, using s≤m and d_(i−1)/d_i≥2m³/ε. Thus some projection is the point x_h. Its height is bounded above by the mixed cycle height divided by its positive degree.
4. The coarse arithmetic coefficient is C_s=2m²m![s(m+1)/ε]^s for 1≤s≤m. Since ε≤m, it increases with s. When m=2 its maximum equals 576/ε², so this coarse estimate alone has no slack. Retain the earlier coefficient m²+log 2 from (5.3), since s≤m and log H₂(F)≥0: the sharper maximum is 72(4+log 2)/ε², with ratio (4+log 2)/8<5/8 to (3m³/ε)^m.
5. For m≥3 the coarse coefficient already suffices: m!≤((m+1)/2)^m gives C_s/(3m³/ε)^m≤2m²((m+1)²/(6m²))^m≤2m²(8/27)^m<1. The last expression is <1 at m=3 and decreases, since its next-term ratio is at most (4/3)²(8/27)<1.
6. The strict coefficient margin therefore gives a point-height upper bound strictly smaller than the permitted lower bound, even when that lower bound holds with equality. The degree comparison also has explicit strict slack, so no continuity argument at a boundary is required.

**Check.** For m=2 the coarse coefficient ratio is 1; retaining m²+log 2 gives the strict ratio (4+log 2)/8<5/8. The equality boundary remains valid. The conclusion is strict index<mΘ. No derivative of weight exactly mΘ is required by strict-index vanishing.

**Sources and use.**

- [An explicit version of Faltings’ Product Theorem and an improvement of Roth’s lemma](https://pub.math.leidenuniv.nl/~evertsejh/95-product.pdf), Theorem 3, p. 7; §5, pp. 29–33. The sharp Roth inequality follows by the product components and point-height lower bounds, with a strict constant margin.
- [An improvement of the quantitative Subspace Theorem](https://pub.math.leidenuniv.nl/~evertsejh/95-subspace.pdf), Lemma 23, p. 64. The weak point-height boundary used by this application is justified by the strict coefficient margin, rather than by a limiting argument at equality.

<a id="dt2-grid-roth-assembly"></a>

### Sharp Roth to hyperplane and grid nonvanishing

**Application.** The missing sharp-Roth input completes the parent Evertse Lemmas 24–26 chain: a nonzero coefficient slice of a binary block polynomial preserves the coefficient H₂ bound, restores multihomogeneity by a monomial, and has a nonzero jet on each chosen hyperplane. Iterating across blocks gives the parent Proposition 12.1 grid jet used in the semistable contradiction.

**Declaration:** `dt2_grid_roth_assembly`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-grid-roth-assembly`.

**Hypotheses.** All fields, dimensions, normalizations and strict inequalities are as specified in the statement.

**Inputs:** [Strict index conclusion at the weak height boundary](#dt2-sharp-roth-boundary), [DiophantineApproximationAndTranscendence:DT.2/height2-coefficient-slice](../packets/DiophantineApproximationAndTranscendence.json), [DiophantineApproximationAndTranscendence:DT.2/binary-slice-block-degrees](../packets/DiophantineApproximationAndTranscendence.json), [DiophantineApproximationAndTranscendence:DT.2/restore-binary-multihomogeneity](../packets/DiophantineApproximationAndTranscendence.json), [DiophantineApproximationAndTranscendence:DT.2/hyperplane-jet-restriction](../packets/DiophantineApproximationAndTranscendence.json), [DiophantineApproximationAndTranscendence:DT.2/conditional-nonzero-block-grid-jet](../packets/DiophantineApproximationAndTranscendence.json).

**Proof outline.**

1. Apply the parent affine-chart/Hasse-jet transports and slice lemmas, preserving the strict threshold.
2. Use the corrected weak-boundary sharp Roth conclusion to exclude excessive vanishing on the hyperplane normal of large height.
3. Keep the grid degree capacity and block replacement cases already planned by the parent; these are inputs, not new definitions.

**Check.** Restoring a slice by a monomial must preserve its relevant jet and the prescribed block degrees; the weak height boundary still needs a strict index conclusion.

**Sources and use.**

- [An improvement of the quantitative Subspace Theorem](https://pub.math.leidenuniv.nl/~evertsejh/95-subspace.pdf), Lemmas 24–26, pp. 64–68. These translate compound minima and wedge height into the index bound and eliminate the separated high-Q configurations.
- [A further improvement of the quantitative Subspace Theorem](https://annals.math.princeton.edu/wp-content/uploads/annals-v177-n2-p04-p.pdf), §12, p. 552. This applies the Roth input with the chosen compound dimension and degrees.

## Unit equations and the conic perturbation cover

<a id="dt2-ratio-rank-exact"></a>

### Rank exactness for the ratio projection

**Lemma.** For Γ⊂(F*)ⁿ of finite rank r and a proper subspace relation involving ℓ≥2 coordinates, let ρ(x)=(x₂/x₁,…,x_ℓ/x₁), Γ₁=im ρ and Γ₂=ker ρ. Then rank Γ₁+rank Γ₂=r, including groups that are not finitely generated. Each nonempty ratio fibre is one coset uΓ₂, with its first ℓ coordinates proportional.

**Declaration:** `dt2_ratio_rank_exact`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-ratio-rank-exact`.

**Hypotheses.** All fields, dimensions, normalizations and strict inequalities are as specified in the statement.

**Inputs:** [DiophantineApproximationAndTranscendence:DT.2/nondegenerate-solution](../packets/DiophantineApproximationAndTranscendence.json).

**Proof outline.**

1. Tensor the exact sequence of abelian groups with ℚ; flatness gives exactness and finite-dimensional rank-nullity gives r=r₁+r₂.
2. For a fixed ratio choose one representative u and divide every fibre element by u; membership in the kernel is exactly the coordinate-ratio condition.
3. Do not enumerate a finite generating set for an arbitrary finite-rank group.

**Check.** For the full diagonal subgroup, Γ₁ has rank 0 and Γ₂ has rank r.

**Sources and use.**

- [Linear equations in variables which lie in a multiplicative group](https://arxiv.org/pdf/math/0409604v1), §4, pp. 816–819. The hyperplane cover is converted to finitely many projective ratio classes; affine normalization is performed only on nonzero block subsums.

<a id="dt2-merged-nondegeneracy"></a>

### Preservation of nondegeneracy after merging a fibre

**Lemma.** Suppose a₁x₁+⋯+a_nx_n=1 is nondegenerate and a minimal homogeneous relation on ℓ coordinates fixes their ratios w_i=x_i/x₁. The merged coefficient b=a₁+Σ_{i=2}^ℓa_iw_i is nonzero; replacing the first ℓ terms by b x₁ gives a nondegenerate equation on n−ℓ+1 coordinates in a coset of Γ₂. The ratio equation on ℓ−1 coordinates is itself nondegenerate after dividing the minimal relation by one term.

**Declaration:** `dt2_merged_nondegeneracy`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-merged-nondegeneracy`.

**Hypotheses.** All fields, dimensions, normalizations and strict inequalities are as specified in the statement.

**Inputs:** [Rank exactness for the ratio projection](#dt2-ratio-rank-exact), [DiophantineApproximationAndTranscendence:DT.2/nondegenerate-homogeneous-solution](../packets/DiophantineApproximationAndTranscendence.json).

**Proof outline.**

1. A zero b would make an original nonempty subsum vanish. Any vanishing merged subsum expands to an original vanishing subsum.
2. A minimal relation has no proper zero subsum, so normalizing it gives the required lower-dimensional affine equation. Absorb the chosen fibre representative into its coefficients.
3. The affine nondegeneracy convention prohibits every nonempty zero subsum, including the full left side; it is not the same as the homogeneous convention.

**Check.** A zero merged coefficient or merged zero subsum expands to an original nonempty zero subsum. The homogeneous minimal relation forbids proper zero subsums.

**Sources and use.**

- [Linear equations in variables which lie in a multiplicative group](https://arxiv.org/pdf/math/0409604v1), §4, pp. 817–819. The minimal zero-sum blocks can be merged only when the affine nondegeneracy condition leaves a nonzero normalized block.

<a id="dt2-unit-count-induction"></a>

### Unit-equation induction and numerical bounds

**Theorem.** With A(n,r)=exp((6n)^{3n}(r+1)) and B(n,r)=exp((5n)^{3n}(r+1)), the fibre count uses A(ℓ−1,r₁)A(n−ℓ+1,r₂)≤A(n−1,r) for 2≤ℓ≤n and r₁+r₂=r. Covering by B(n,r+1) proper subspaces and selecting at most 2ⁿ minimal zero relations gives 2ⁿA(n−1,r)B(n,r+1)<A(n,r) for n≥2. The coefficient vector may increase the group rank by one; it is not rank-neutral.

**Declaration:** `dt2_unit_count_induction`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-unit-count-induction`.

**Hypotheses.** All fields, dimensions, normalizations and strict inequalities are as specified in the statement.

**Inputs:** [Rank exactness for the ratio projection](#dt2-ratio-rank-exact), [Preservation of nondegeneracy after merging a fibre](#dt2-merged-nondegeneracy), [Public conic perturbation cover and the parent ESS budget](#dt2-perturbation-cover).

**Proof outline.**

1. Use the rank sum and monotonicity of the explicit exponents to bound the two affine equations in each fibre.
2. For each proper covering subspace select a support-minimal homogeneous relation, then apply the previous nondegeneracy lemma and induction.
3. Check the exponential inequality for n=2 directly and use the fast growth of (6n)^{3n} for n>2. The n=1 affine equation has at most one solution.

**Check.** Handle n=1 separately. Check n=2 and rank zero explicitly; multiplying the coefficient vector into the group may add one to the rank.

**Sources and use.**

- [Linear equations in variables which lie in a multiplicative group](https://arxiv.org/pdf/math/0409604v1), §4, pp. 816–819. The ordered block induction and its finite partition count give the affine unit bound from the parent cover.

<a id="dt2-progression-fibres"></a>

### Cyclic ratio fibres and intersections of progressions

**Lemma.** For φ:ℤ→(F*)^{n−1}, φ(k)=((α₂/α₁)^k,…,(α_n/α₁)^k), every nonempty fibre is a coset of ker φ=dℤ with d≥0. The case d=0 is a singleton, not an empty progression. Finite intersections of such cosets are empty or one coset of the intersection subgroup; for positive moduli the resulting modulus is the lcm. Pullback along a cyclic homomorphism is treated the same way.

**Declaration:** `dt2_progression_fibres`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-progression-fibres`.

**Hypotheses.** All fields, dimensions, normalizations and strict inequalities are as specified in the statement.

**Inputs:** [DiophantineApproximationAndTranscendence:DT.2/nondegenerate-linear-recurrence](../packets/DiophantineApproximationAndTranscendence.json).

**Proof outline.**

1. Apply subgroup classification in ℤ and coset equality. Use the Chinese-remainder compatibility criterion for nonempty intersections.
2. Separate zero modulus before taking an lcm; intersecting a singleton with any progression is a singleton or empty.

**Check.** Even integers intersect 3ℤ in 6ℤ. The fibres of k↦2^k in ℚ* are singletons. 2ℤ and 1+2ℤ have empty intersection.

**Sources and use.**

- [Linear equations in variables which lie in a multiplicative group](https://arxiv.org/pdf/math/0409604v1), §5, pp. 819–821. A minimal zero-sum partition yields projective block ratios and translates of lower-rank kernels.
- [Zeros of linear recurrence sequences](https://publi.math.unideb.hu/paper/608/download/10_5486_PMD_2000_2336.pdf), §3, pp. 617–619. The homogeneous unit-pattern argument supports the elementary rank-one exponent-fiber derivation.

<a id="dt2-simple-zero-assembly"></a>

### Simple recurrence zeros from unit fibres

**Application.** For a simple recurrence Σ_{i=1}^n a_iα_i^k, α_i distinct nonzero and a_i nonzero, minimal vanishing partitions and the affine unit bound cover the zero set by at most W(n)=exp((6n)^{3n}) arithmetic progressions, including singletons. In the nondegenerate case all progressions are singletons: otherwise restriction to an infinite progression would contradict the Vandermonde determinant for distinct powered roots.

**Declaration:** `dt2_simple_zero_assembly`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-simple-zero-assembly`.

**Hypotheses.** All fields, dimensions, normalizations and strict inequalities are as specified in the statement.

**Inputs:** [Unit-equation induction and numerical bounds](#dt2-unit-count-induction), [Cyclic ratio fibres and intersections of progressions](#dt2-progression-fibres), `mathlib:Matrix.det_vandermonde_ne_zero_iff` (see the native-export table).

**Proof outline.**

1. For each support-minimal homogeneous zero relation normalize by one term and apply A(n−1,1). Pull its finite ratio fibres back through the cyclic root-ratio map.
2. Intersect fibres across the blocks of a vanishing partition; count partitions and use the source numerical inequality giving W(n).
3. On an infinite progression, powered distinct roots stay distinct under nondegeneracy; evaluating enough consecutive progression points gives an invertible Vandermonde matrix.

**Check.** The sequence 2^k−(−2)^k has the progression 2ℤ of zeros; nondegenerate root ratios instead force every fibre to be a singleton.

**Sources and use.**

- [Linear equations in variables which lie in a multiplicative group](https://arxiv.org/pdf/math/0409604v1), Theorem 1.2, pp. 809–810; §5, pp. 819–821. The torsion-ratio classes and homogeneous bound give a finite union of progressions; nondegeneracy excludes nontrivial progressions.

<a id="dt2-finite-field-cover-transfer"></a>

### Finite-subset reduction to one number field

**Lemma.** For a field K, n≥2 and an integer B≥1, if every finite subset of N⊂Kⁿ lies in at most B proper K-linear subspaces, then N itself has such a cover. Apply this over Q̄ to finite algebraic solution sets with common number fields and constants independent of their degree.

**Declaration:** `dt2_finite_field_cover_transfer`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-finite-field-cover-transfer`.

**Hypotheses.** All fields, dimensions, normalizations and strict inequalities are as specified in the statement.

**Inputs:** .

**Proof outline.**

1. For a finite set M let a(M) be the least sum of dimensions of a B-subspace cover, allowing zero spaces to pad. Every optimal subspace is spanned by points of M, so there are finitely many optimal unordered covers; let b(M) be their positive number.
2. Choose M₀ maximizing a(M), which is bounded by B(n−1), and then minimizing b(M) among those maxima.
3. For any finite M⊃M₀, maximality gives a(M)=a(M₀). Every optimal cover of M is an optimal cover of M₀; minimality of b makes the two finite cover sets equal. Apply this to M₀∪{x} for each x∈N; one fixed optimal cover covers all of N.

**Check.** The finite witnesses must span the selected subspaces; a cover depending on the finite subset is sufficient only after proving the extremal-witness argument.

**Sources and use.**

- [Linear equations in variables which lie in a multiplicative group](https://arxiv.org/pdf/math/0409604v1), Lemma 6.1 and proof, pp. 822–823. The source optimizes the minimum sum of subspace dimensions and then the finite number of optimal covers. This finite-witness argument transfers a uniform cover to arbitrary finite rank.

<a id="dt2-symmetric-log-seminorm"></a>

### Symmetric logarithmic seminorm

**Definition.** For a finite family of real linear forms g_j on ℝʳ, define Ψ(t)=½Σ_j|g_j(t)|. In a finite-rank multiplicative parameterization, g_j are the local coordinate logarithms of chosen independent group elements. The product formula gives Ψ(u)=Σ_i h(α_i(u)) for integer exponent vectors. Ψ is a norm exactly when the common real kernel of the forms is zero.

**Declaration:** `symmetricLogSeminorm`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-symmetric-log-seminorm`.

**Hypotheses.** All fields, dimensions, normalizations and strict inequalities are as specified in the statement.

**Inputs:** [Current-owner places and absolute height normalization](#dt2-place-normalization), `mathlib:LinearMap` (see the native-export table).

**Proof outline.**

1. The triangle inequality and absolute homogeneity follow termwise; zero is equivalent to every summand being zero.
2. For each multiplicative coordinate, Σ_v log|α_i|_v=0, hence its positive logarithm sum is half its absolute logarithm sum.

**Planning API.** These are proposed contracts; only the light definitions and selected statements fit the suggested file.

| Name | Role | Contract |
| --- | --- | --- |
| `symmetricLogSeminorm_nonneg` | structure | Ψ(t)≥0. |
| `symmetricLogSeminorm_smul` | compatibility | Ψ(a t)=\|a\|Ψ(t). |
| `symmetricLogSeminorm_add` | relation | Ψ(t+u)≤Ψ(t)+Ψ(u). |
| `symmetricLogSeminorm_eq_zero` | characterisation | Ψ(t)=0 iff every g_j(t)=0. |
| `symmetricLogSeminorm_integerHeight` | compatibility | For group exponent vectors Ψ(u) is the sum of the absolute scalar logarithmic heights. |

**Consumers.** Finite-rank cone cover: Packing balls must use a genuine norm after proving kernel zero. Small-point packing: The inequality h(vector)≤Σ scalar heights≤n h(vector) relates this seminorm to toric height.

**Unit tests.**

- `test_symmetric_log_seminorm_1` (computation): For forms Id and −Id on ℝ, Ψ(t)=|t|.
- `test_symmetric_log_seminorm_2` (degenerate): An empty family or the zero-dimensional parameter space has Ψ=0.
- `test_symmetric_log_seminorm_3` (non-example): On ℝ² with g₁(x,y)=x and g₂=−x, Ψ(0,1)=0: these forms do not define a norm.

**Check.** The empty family gives zero. A family with nonzero common kernel remains only a seminorm, even when no individual form is zero.

**Sources and use.**

- [Linear equations in variables which lie in a multiplicative group](https://arxiv.org/pdf/math/0409604v1), §7, equations (7.10)–(7.14), pp. 825–826. The symmetric logarithmic function extends from exponent coordinates and satisfies seminorm identities. The packet and suggested file use the same declaration names.

<a id="dt2-log-norm-positivity"></a>

### Discreteness forces a genuine real norm

**Lemma.** For multiplicatively independent generators modulo torsion in a fixed number field, the logarithmic seminorm Ψ above has zero real kernel. Fixed-field Northcott and the height-zero torsion criterion first give a positive lower bound on Ψ(u) for nonzero u∈ℤʳ. If the real kernel were nonzero, simultaneous approximation to that kernel direction would produce nonzero integer vectors with Ψ arbitrarily small, a contradiction.

**Declaration:** `dt2_log_norm_positivity`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-log-norm-positivity`.

**Hypotheses.** All fields, dimensions, normalizations and strict inequalities are as specified in the statement.

**Inputs:** [Symmetric logarithmic seminorm](#dt2-symmetric-log-seminorm), `mathlib:NumberField.finite_setOfPred_logHeight₁_le` (see the native-export table), [Height zero in a number field is torsion](#dt2-height-zero-torsion).

**Proof outline.**

1. A bounded-height ball in the exponent lattice injects into the fixed-field multiplicative tuple up to the finite torsion kernel.
2. Use Dirichlet simultaneous approximation on a nonzero real kernel direction and continuity of the finite family of linear forms.
3. No uniform degree-independent Dobrowolski estimate is used in this step.

**Check.** Distinguish an integer kernel from a real kernel. Use simultaneous approximation to exclude the latter after obtaining an integer positive gap from fixed-field Northcott.

**Sources and use.**

- [Linear equations in variables which lie in a multiplicative group](https://arxiv.org/pdf/math/0409604v1), §7, pp. 825–826. The source uses a positive height lower bound in a fixed field. The packet replaces that ingredient by an independent proof from native Northcott and simultaneous rational approximation; it is not presented as the source proof.

<a id="dt2-cone-cover"></a>

### Packing cones in the finite-rank logarithmic space

**Lemma.** In a fixed number field let Γ modulo torsion be finitely generated of rank r and let B={u:Ψ(u)≤1}. Fix n≥2 and q=8n. Cover nB by at most (2qn+4)^r=(16n²+4)^r translates ρ+q^−1B, with centers ρ∈(n+1/q)B. For a group point α of h=h(α)>0, its exponent u satisfies Ψ(u)=h_s(α)≤nh, so u/h lies in such a translate and u∈hρ+(h/q)B. Consequently Σ_{v,j}|g_jv(u)−h g_jv(ρ)|≤2h/q. Separate h=0 torsion points; rank zero needs one cone only.

**Declaration:** `dt2_cone_cover`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-cone-cover`.

**Hypotheses.** All fields, dimensions, normalizations and strict inequalities are as specified in the statement.

**Inputs:** [Discreteness forces a genuine real norm](#dt2-log-norm-positivity), [Symmetric logarithmic seminorm](#dt2-symmetric-log-seminorm), [Finite-subset reduction to one number field](#dt2-finite-field-cover-transfer).

**Proof outline.**

1. Take a maximal q^−1-separated family in nB. Its disjoint balls of radius 1/(2q) lie in (n+1/(2q))B; the volume ratio bounds its size by (2qn+1)^r, hence by the displayed looser count. Maximality covers nB.
2. Use h≤h_s≤nh to put u/h in nB. The cone error is Ψ(u−hρ)≤h/q. Because Ψ is half the sum of absolute coordinate logarithms, their summed error is≤2h/q, not h/q.
3. Torsion is the zero-logarithm case, not a real unit direction. For arbitrary finite-rank groups apply the result to the finitely generated subgroup of each finite subset, then the uniform-cover transfer.

**Check.** Rank zero has one cone; torsion has zero logarithm and does not create a new real direction. Packing uses the norm after its kernel is shown zero.

**Sources and use.**

- [Linear equations in variables which lie in a multiplicative group](https://arxiv.org/pdf/math/0409604v1), §8, equations (8.4)–(8.6), pp. 826–827. Norm-ball packing covers the logarithmic directions. The radius is reduced by using q=8n to account for the factor two between Ψ and the full absolute logarithmic sum.

<a id="dt2-large-unit-height"></a>

### Large perturbed unit points have small twisted height

**Theorem.** Let n≥2 and y=αz with α in a fixed cone above, h=h(α)>4n log n, h(z)≤h/(8n), and Σ y_i=1. Set m_jv=g_jv(ρ) for j=1,…,n and m_0v=0. At each place omit a predicted maximizer of m_jv among X₁,…,X_n,ΣX_i, independent of the point within the cone. On the finite logarithmic support S let γ=(Σ_v max_j m_jv)/(n|S|), and give each selected form weight c_jv=m_jv+γ; set other weights zero. Then Σc=0 and Σ|c|≤4n+1. With Q=H(α)^(4n+1), dividing weights by 4n+1 gives twisted height≤Q^−δ for δ=1/(2n(4n+1)); Q>n^(2/δ). Center per place to use the parent EF normalization: the global height is unchanged and Σ_v max_j c′_jv≤1, while the absolute-weight bound need not be preserved by centering. Each cone uses at most 2^(2(2n+9)^2)(8n²+2n)^(n+4) proper subspaces; the complete large-point count multiplies this by (16n²+4)^r.

**Declaration:** `dt2_large_unit_height`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-large-unit-height`.

**Hypotheses.** All fields, dimensions, normalizations and strict inequalities are as specified in the statement.

**Inputs:** [Packing cones in the finite-rank logarithmic space](#dt2-cone-cover), [Bounded intervals, systems and final subspace counts](#dt2-interval-assembly), [DiophantineApproximationAndTranscendence:DT.2/twisted-height](../packets/DiophantineApproximationAndTranscendence.json).

**Proof outline.**

1. The cone error gives M=Σ_v max_j m_jv≥1−2/q. Omitting this maximum makes the selected global weight sum −M before adding n|S|γ=M. Every remaining set of n forms is independent.
2. The selected-weight absolute sum is≤2Σ|m_jv|≤4(n+1/q)≤4n+1. Product-formula weights outside S have zero logarithmic target.
3. The logarithm of the resulting twisted height is at most h(−1/n+2/(nq)+1/(8n)+2/q)≤−h/(2n), with q=8n. This tracks the factor-two cone error and the perturbation budget.
4. After weight division Q has the stated exponent; h>4n log n gives its strict large-Q threshold. Subtract the selected mean at each place for EF: these means sum to zero, preserving the global twisted height and controlling the sum of local maxima.
5. Use the parent quantitative subspace theorem for this fixed form/weight system. Multiply its per-cone count by the corrected cone count; the larger rank factor will be absorbed in the AV final bound.

**Check.** The omitted form depends only on the chosen cone and place. The large-height premise is on α, not y. For n=2 and q=16 the exponent estimate is −1/4, exactly the required bound. Per-place centering is checked by its sum of maxima, not a claimed unchanged absolute sum.

**Sources and use.**

- [Linear equations in variables which lie in a multiplicative group](https://arxiv.org/pdf/math/0409604v1), §9, pp. 827–829. The fixed omitted form and weights come from the chosen logarithmic cone. The error in (9.6) is repaired before the twisted-height estimate.
- [Small points on subvarieties of a torus](https://edoc.unibas.ch/server/api/core/bitstreams/c591a881-406c-49dd-ad51-24bfb5b80bb9/content), Theorem 6.1 proof, pp. 31–32. The large-height premise is on the group factor α. The cone count can be enlarged without exceeding the final AV numerical budget.

<a id="dt2-toric-complexity"></a>

### Toric equation complexity and exceptional locus

**Definition.** For a proper reduced subvariety V⊂G_mⁿ over Q̄, δ(V) is the least positive degree allowing V to be cut out as a set by polynomials of at most that degree in the fixed projective embedding. δ₀(V) is the analogous incomplete-intersection degree: V is a union of isolated components of such an intersection. V⁰ removes every positive-dimensional torus coset contained in V. For irreducible V, μ_ess(V) is the infimum θ for which the points of height≤θ are Zariski dense. These definitions use h(x)=h(1:x₁:⋯:x_n), not the sum of the scalar heights.

**Declaration:** `dt2_toric_complexity`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-toric-complexity`.

**Hypotheses.** All fields, dimensions, normalizations and strict inequalities are as specified in the statement.

**Inputs:** [SchemeAndStackFoundations:SF.5](../packets/SchemeAndStackFoundations.json), [Current-owner places and absolute height normalization](#dt2-place-normalization).

**Proof outline.**

1. Use the lower-tier variety, isolated-component, degree and stabilizer interfaces requested from SF.5; retain the fixed projective embedding.
2. Define V⁰ by the union of contained positive-dimensional cosets, rather than deleting every torsion point. The cited proof proves this union is closed via the ensuing descent.

**Planning API.** These are proposed contracts; only the light definitions and selected statements fit the suggested file.

| Name | Role | Contract |
| --- | --- | --- |
| `toricComplexity_mono` | relation | δ₀(V)≤δ(V), and δ₀(V)≤deg V for an irreducible V in the source embedding. |
| `toricExceptional_coset` | characterisation | A positive-dimensional torus coset has empty V⁰. |
| `toricExceptional_zeroDim` | simp | For zero-dimensional V, V⁰=V. |
| `toricHeight_compare` | compatibility | h(x)≤Σ_i h(x_i)≤n h(x). |
| `essentialMinimum_dense` | characterisation | For θ<μ_ess(V), the points with h≤θ are not dense. |
| `toricComplexity_ofEquations` | constructor | A degree≤D family whose zero set is V proves δ(V)≤D. A family for which V is the union of isolated components proves δ₀(V)≤D; keep these two witness types distinct. |
| `toricComplexity_ext` | extensionality | Equal reduced subvarieties in the same embedding have equal δ, δ₀, V⁰ and essential minimum. |
| `toricComplexity_baseChange` | functoriality | Extension of the algebraically closed coefficient field preserves degree complexity and the contained-coset locus; height comparisons are restricted to algebraic points with the same normalized absolute height. |

**Consumers.** Small-height bound: Degree budgets and the removal of contained cosets distinguish finitely many nondegenerate unit solutions from an infinite degenerate family.

**Unit tests.**

- `test_toric_complexity_1` (degenerate): For a finite set of points no positive-dimensional coset is removed.
- `test_toric_complexity_2` (non-example): The hyperplane x+y=1 in G_m² contains no positive-dimensional torus coset and therefore V⁰=V.
- `test_toric_complexity_3` (computation): For the coset x=1 in G_m², V⁰ is empty although its points can have positive height.

**Check.** The coset x=1 has empty exceptional complement while the hyperplane x+y=1 does not. Heights use the fixed (1:x) embedding.

**Sources and use.**

- [Small points on subvarieties of a torus](https://edoc.unibas.ch/server/api/core/bitstreams/c591a881-406c-49dd-ad51-24bfb5b80bb9/content), §1, definitions and theorem conventions, pp. 1–3. The essential minimum, exceptional coset set and three degree complexities use the indicated fixed torus embedding.

<a id="dt2-hilbert-multiplicity-bounds"></a>

### Hilbert-function lower and fat-point upper bounds

**Lemma.** Let A=K[x₀,…,x_n], with K a field and 0≤r≤min(m,n), and let J be a homogeneous ideal of codimension r containing the intersection of the isolated codimension-r primary components of an ideal generated in degrees d₁≥⋯≥d_m. For ν>Σ_{j≤r}d_j−r, H(A/J;ν)≥deg J·binomial(ν+n−Σ_{j≤r}d_j,n−r). For an irreducible d-dimensional projective V of degree D and positive integral degree ν and fat-point order T≥1, H(V,T;ν)≤binomial(T−1+n−d,n−d)binomial(ν+d,d)D. Use the corrected Chardin–Philippon notion of relative regularity, quantified over all parameter-sequence Koszul complexes; the original reverse implication from the local-cohomology condition to that all-parameter Koszul condition is false.

**Declaration:** `dt2_hilbert_multiplicity_bounds`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-hilbert-multiplicity-bounds`.

**Hypotheses.** All fields, dimensions, normalizations and strict inequalities are as specified in the statement.

**Inputs:** [SchemeAndStackFoundations:SF.5](../packets/SchemeAndStackFoundations.json), [SchemeAndStackFoundations:SF.2](../packets/SchemeAndStackFoundations.json).

**Proof outline.**

1. Import the generic Hilbert polynomial, primary components, Koszul/local-cohomology contracts through explicit lower-tier requests; do not cite higher-tier Heights R09 or Scheme K-theory operations.
2. Use the corrected relative-regularity lower bound of Chardin–Philippon. Its Corollary 3 remains valid under the published erratum.
3. For the fat-point upper bound filter by powers of the normal ideal; count monomials in the codimension many normal variables and bound each graded coefficient space by the degree/Hilbert upper bound.

**Check.** Require codim J=r and homogeneous ideals. The binomial lower bound is used only for ν above the stated regularity threshold; the fat-point factor uses codimension, not dimension.

**Sources and use.**

- [Small points on subvarieties of a torus](https://edoc.unibas.ch/server/api/core/bitstreams/c591a881-406c-49dd-ad51-24bfb5b80bb9/content), Proposition 3.3 and Theorem 3.4, p. 13; Corollary 3.5, p. 14. The isolated-component Hilbert estimate uses the surviving regularity consequence, with positive fat-point parameters.
- [Régularité et interpolation](https://webusers.imj-prg.fr/~marc.chardin/publications/textes/11.RI.pdf), Corollary 3 and proof, p. 7. This is the regularity inequality invoked by AV.
- [Erratum to Régularité et interpolation](https://webusers.imj-prg.fr/~marc.chardin/publications/textes/11.Err.pdf), Entire one-page author erratum, concerning Corollaries 2–3. The reverse local-cohomology-to-Koszul implication fails. Corollary 3 remains valid by the corrected argument; the original already quantifies over all parameter sequences.

<a id="dt2-interpolation-determinant"></a>

### Torsion translation and interpolation determinant

**Theorem.** For irreducible V⊂G_mⁿ and a prime p, compare the monomial evaluation matrix on V with that on ker[p]·V. Its determinant polynomial of degree ν per row has order at least (L−H(V,T;ν))T on the diagonal evaluation locus. The p-adic estimate |1−ζ_p|_p≤p^{−1/(p−1)}, together with the product formula and Hadamard, gives μ_ess(V)≥(1−H(V,T;ν)/H(ker[p]V;ν))T log p/(pν)−n log(ν+1)/(2ν).

**Declaration:** `dt2_interpolation_determinant`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-interpolation-determinant`.

**Hypotheses.** The irreducible V is nonempty and ν,T are positive integers. L=H(ker[p]V;ν)>0 is the evaluation-space dimension. Use the fixed embedding and degree-normalized projective torus height; the determinant bound is allowed to be negative.

**Inputs:** [Hilbert-function lower and fat-point upper bounds](#dt2-hilbert-multiplicity-bounds), [Local exterior-power norm and determinant bounds](#dt2-exterior-local-norm), [Toric equation complexity and exceptional locus](#dt2-toric-complexity).

**Proof outline.**

1. Choose monomials forming an evaluation basis on ker[p]V and make the interpolation determinant nonzero by independent evaluations.
2. At the diagonal, remove at most H(V,T;ν) independent jet rows; the remaining rows each contribute order T.
3. Translate by p-torsion at a place above p, exploit the local divisibility, and multiply the bounds over every place. Bound archimedean determinant coefficients by Hadamard. This replaces an ineffective gap principle with explicit degree data.

**Check.** The evaluation determinant must be nonzero before taking its height. The ratio H(V,T;ν)/H(ker[p]V;ν) is useful only when strictly below 1.

**Sources and use.**

- [Small points on subvarieties of a torus](https://edoc.unibas.ch/server/api/core/bitstreams/c591a881-406c-49dd-ad51-24bfb5b80bb9/content), Lemma 3.1, pp. 10–11; Proposition 3.2, pp. 11–13. The interpolation matrix has positive degree and dimension parameters. Its determinant height yields the stated multiplicity vanishing bound.

<a id="dt2-toric-translate-degree"></a>

### Stabilizers and translation degree control

**Lemma.** For irreducible V and finite H⊂G_mⁿ, deg(HV)=|H/(H∩Stab V)|deg V and δ₀(HV)≤|H/(H∩Stab V)|δ₀(V). For H=ker[p], δ₀(HV)≤pⁿδ₀(V). A prime avoiding the finite component-group index of Stab V gives |H/(H∩Stab V)|≥p^{codim V+1} when V is not a torus coset. Also deg Stab V≤deg V·δ(V)^{dim V}.

**Declaration:** `dt2_toric_translate_degree`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-toric-translate-degree`.

**Hypotheses.** Ambient dimension n≥2; the variety is proper and all complexity parameters use the fixed embedding and h(1:x₁:⋯:x_n). All remaining hypotheses are those in the exact statement.

**Inputs:** [Toric equation complexity and exceptional locus](#dt2-toric-complexity), [SchemeAndStackFoundations:SF.5](../packets/SchemeAndStackFoundations.json), [Multiprojective degrees and the product criterion](#dt2-multiprojective-degree).

**Proof outline.**

1. Distinct irreducible translates are indexed by H/(H∩Stab V), proving the degree formula. For the δ₀ bound start with an intersection X in which V is isolated, and refine it to X′=⋂_(ζ∈H∩Stab V)ζ^−1X. The component V remains isolated, and the stabilizer subgroup preserves X′.
2. For one representative of each translate class form the product of generic defining equations of its translate of X′. The product degrees are bounded by the number of classes times δ₀(V). Localize around each V-translate; generic choices keep it an isolated component. Merely multiplying unrefined equations would not establish isolation.
3. For ker[p], the connected stabilizer contributes p^dim Stab V torsion points. If p avoids its finite component-group order and V is not a coset, dim Stab V≤dim V−1, giving the extra p-power.
4. The stabilizer is cut out by generic translates of the defining equations together with V; the requested generic degree Bézout contract gives deg Stab V≤deg V·δ(V)^dim V.

**Check.** Count distinct translates by the stabilizer quotient. The extra p-power requires a noncoset and a prime not dividing the stabilizer component-group index.

**Sources and use.**

- [Small points on subvarieties of a torus](https://edoc.unibas.ch/server/api/core/bitstreams/c591a881-406c-49dd-ad51-24bfb5b80bb9/content), Lemma 3.6, p. 14; Lemmas 3.7–3.8, pp. 15–16. The torsion translate count is controlled by the stabilizer. The defining intersection is first refined by the stabilizer subgroup so multiplication of equations preserves isolated components.

<a id="dt2-small-point-cut"></a>

### Explicit small-point cut and relative descent

**Theorem.** For irreducible V of codimension k that is not a torus coset, θ₀=δ₀(V)[27n²log(n²δ₀(V))]^{kn} bounds the degree of a hypersurface containing all its points of height≤θ₀^{−1} without containing V. More generally for irreducible V₀⊂V₁, codimensions k₀≥k₁, put θ=δ(V₁)[200n⁵log(n²δ(V₁))]^{(k₀−k₁+1)k₀n}. Either V₀ lies in a torus coset B⊂V₁ with δ₀(B)≤θ, or a hypersurface of degree≤θ contains its height≤θ^{−1} points and does not contain V₀.

**Declaration:** `dt2_small_point_cut`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-small-point-cut`.

**Hypotheses.** For the first cut, n≥2 and V is irreducible, positive-dimensional, and not a torus coset. A zero-dimensional irreducible variety is a coset of the trivial torus. For the relative statement V₀⊂V₁ is nonempty irreducible in the same fixed torus embedding; use the source codimensions and degree complexity.

**Inputs:** [Torsion translation and interpolation determinant](#dt2-interpolation-determinant), [Stabilizers and translation degree control](#dt2-toric-translate-degree), [Hilbert-function lower and fat-point upper bounds](#dt2-hilbert-multiplicity-bounds).

**Proof outline.**

1. Choose a prime in the prescribed interval avoiding the stabilizer component-group factors. The explicit short-prime interval estimate is recorded as a source gap until its quoted analytic input is independently read.
2. Apply the determinant lower bound with the source T,ν choices. Density of too-small points would contradict it; find the nonzero separating equation via the Hilbert-function bound.
3. For V₀⊂V₁ iterate proper hypersurface cuts and distinguish the coset case; codimension strictly increases, so the descent terminates.

**Check.** Use n≥2 and positive complexity; choose a prime avoiding the stabilizer factors. A separating hypersurface contains the small points but does not contain the whole noncoset component.

**Sources and use.**

- [Small points on subvarieties of a torus](https://edoc.unibas.ch/server/api/core/bitstreams/c591a881-406c-49dd-ad51-24bfb5b80bb9/content), Theorem 2.1, p. 7, proof pp. 16–20; Theorem 2.2, p. 8, proof pp. 20–22. The low-height cut requires a positive-dimensional noncoset in its first form. Its explicit prime selection is still the declared analytic-input gap.

<a id="dt2-small-point-degree-budget"></a>

### Coset decomposition with a weighted degree budget

**Theorem.** Let V⊊G_mⁿ be reduced, with components X_k,…,X_n grouped by codimension≥k, and θ=δ(V)[200n⁵log(n²δ(V))]^{(n−k)n(n−1)}. The Zariski closure of its height≤θ^{−1} points is a union of torus cosets G_k,…,G_n, and for k≤r≤n one has Σ_{i=k}^r θ^{r−i}deg G_i≤Σ_{i=k}^r θ^{r−i}deg X_i≤θ^r. In particular the small points of V⁰ form a finite set of cardinality≤θⁿ.

**Declaration:** `dt2_small_point_degree_budget`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-small-point-degree-budget`.

**Hypotheses.** Ambient dimension n≥2; the variety is proper and all complexity parameters use the fixed embedding and h(1:x₁:⋯:x_n). All remaining hypotheses are those in the exact statement.

**Inputs:** [Explicit small-point cut and relative descent](#dt2-small-point-cut), [Multiprojective degrees and the product criterion](#dt2-multiprojective-degree), [Toric equation complexity and exceptional locus](#dt2-toric-complexity).

**Proof outline.**

1. Maintain a list of components classified by codimension. Remove cosets and cut all remaining components with the preceding relative hypersurface estimate.
2. Bézout gives deg(new components)≤θ times the removed component degree, preserving the weighted budget at each codimension.
3. After at most n−k cuts every remaining noncoset component is zero-dimensional. Removal of positive-dimensional cosets then gives the cardinality statement.

**Check.** At each cut preserve the degree budget in its actual codimension. Positive-dimensional cosets must be removed before asserting a finite small-point set.

**Sources and use.**

- [Small points on subvarieties of a torus](https://edoc.unibas.ch/server/api/core/bitstreams/c591a881-406c-49dd-ad51-24bfb5b80bb9/content), Theorem 1.2, p. 4; proof pp. 23–26. The dimension induction and degree budget identify all sufficiently small points with the exceptional coset part, and bound the complementary finite set.

<a id="dt2-small-unit-packing"></a>

### Small points in a finite-rank thickening

**Theorem.** For Γ of rank r, write Γ_ε={αz:α∈Γ, h(z)≤ε}. For C≥1 and 0≤ε≤(2nθ)^{−1}, #({x∈V⁰∩Γ_ε:h(x)≤C})≤(5nC)^r θ^{n+r}, with θ as above. The estimate is absolute in the degree of the coordinates.

**Declaration:** `dt2_small_unit_packing`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-small-unit-packing`.

**Hypotheses.** Ambient dimension n≥2; the variety is proper and all complexity parameters use the fixed embedding and h(1:x₁:⋯:x_n). All remaining hypotheses are those in the exact statement.

**Inputs:** [Coset decomposition with a weighted degree budget](#dt2-small-point-degree-budget), [Discreteness forces a genuine real norm](#dt2-log-norm-positivity).

**Proof outline.**

1. Use a finite set of points and a common number field. Put ρ=nC, μ=nCθ and a=ρ/μ=θ^−1. In the real span of the logarithms of the finitely many group factors α, use Ψ=h_s on group elements, whose span has dimension≤r. If h_s(αz)≤ρ, then Ψ(α)≤ρ+nε.
2. Choose a maximal a/2-separated set of those group logarithms, represented by actual points of Γ. Its disjoint a/4-balls lie in the ball of radius ρ+nε+a/4. The volume ratio bounds the number of centers by (4μ+4μnε/ρ+1)^r≤(4μ+3)^r, since the strengthened premise gives nε≤a/2. Maximality and h_s(z)≤nε give h_s((αz)/center)≤a.
3. Apply the small-point cardinality bound≤θ^n to each translated variety at height≤a=θ^−1; translation preserves δ(V) and θ. Since (4nCθ+3)^r≤(5nCθ)^r, multiply to obtain the stated count.
4. For arbitrary finite rank use finitely many α from a finite set of points and a common number field. The bound is independent of that field; if a larger finite set existed it would contradict the same estimate.

**Check.** A translated variety may have a different height but the same degree complexity. Keep the radius 1/(2θ) and the inequality ε≤1/(2θ).

**Sources and use.**

- [Small points on subvarieties of a torus](https://edoc.unibas.ch/server/api/core/bitstreams/c591a881-406c-49dd-ad51-24bfb5b80bb9/content), Corollary 1.4, p. 6; proof p. 30. The published noise range is ε≤(2θ)^−1. The packet proves the narrower specialization ε≤(2nθ)^−1 directly by h_s-norm packing, so no unverified Rémond packing lemma or missing factor n is used. This specialization suffices for the parent perturbation theorem.

<a id="dt2-perturbation-cover"></a>

### Public conic perturbation cover and the parent ESS budget

**Theorem.** For n≥2 and Γ⊂(Q̄*)ⁿ of finite rank r, all x=αz satisfying Σx_i=1 and h(z)≤(8n)^{−6n³}(1+h(α)) lie in at most (8n)^{6n³(n+r)} proper linear subspaces. This proves the parent ESS cover as well: n^{−1}exp(−(4n)^{3n})≤(8n)^{−6n³}, and (8n)^{6n³(n+r)}≤exp((5n)^{3n}(r+1)). The comparison must use the same vector height convention.

**Declaration:** `dt2_perturbation_cover`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-perturbation-cover`.

**Hypotheses.** All fields, dimensions, normalizations and strict inequalities are as specified in the statement.

**Inputs:** [Large perturbed unit points have small twisted height](#dt2-large-unit-height), [Small points in a finite-rank thickening](#dt2-small-unit-packing), [Finite-subset reduction to one number field](#dt2-finite-field-cover-transfer).

**Proof outline.**

1. Split according to h(α)>4n log n. For the large range the conic budget implies h(z)≤h(α)/(8n). Use the repaired q=8n count A′=2^(2(2n+9)^2)(8n²+2n)^(n+4)(16n²+4)^r.
2. For the small range h(α)≤4n log n and h(y)≤5n². For V={ΣX_i=1}, δ(V)=1 and θ=(400n⁵ log n)^(n(n−1)²)≤(8n)^(11n³/2)/4. The perturbation budget gives h(z)≤(2nθ)^−1: using the displayed θ bound, 2nθ(1+4n log n)(8n)^−6n³≤(n/2)(1+4n log n)(8n)^−n³/2≤1 for n≥2. Thus it meets the conservative packing premise.
3. This hyperplane contains no positive-dimensional coset through a nondegenerate point: restricting its equation to a torus coset groups the coordinate characters, and a nonconstant group of characters forces a zero subsum. Hence V⁰ consists of the nondegenerate solutions. Apply packing with C=5n², and cover the degenerate points by at most 2^n zero-subsum hyperplanes.
4. The source numerical budget still holds after enlarging the rank factor: 8n²+2n≤(8n)², 16n²+4≤(8n)², and 2^(2(2n+9)^2)≤(8n)^(2(2n+9)^2/4) for n≥2. For n≥3 these give A′≤(8n)^(2(2n+9)^2/4+2(n+4+r))≤(8n)^(6n³(n+r))/4. For n=2 use the exact factor (8n²+2n)=36, giving log_16 A′<92.26+1.52r<96+48r−1/2; the exponent margin increases for n≥3 and with r. The small-point contribution is also≤one quarter of that final budget; add 2^n.
5. Finally compare the AV and ESS budgets in the same height convention. This proves the full parent cover without the erroneous (11.19) substitution.

**Check.** Compare the AV and ESS budgets in the same vector-height convention; check n=2 numerically and rank zero without a strict small-height boundary shortcut.

**Sources and use.**

- [Small points on subvarieties of a torus](https://edoc.unibas.ch/server/api/core/bitstreams/c591a881-406c-49dd-ad51-24bfb5b80bb9/content), Theorem 6.1, pp. 31–32. The large/small group-height split combines the repaired cone cover with the conservative small-point packing specialization.
- [Linear equations in variables which lie in a multiplicative group](https://arxiv.org/pdf/math/0409604v1), §11, equation (11.19), p. 834. The original substitution is too small for its perturbation hypothesis. The AV budget comparison supplies the replacement proof of the same parent target.

<a id="dt2-refined-unit-counts"></a>

### Amoroso–Viada bounds for unit equations and simple recurrences

**Theorem.** For n≥2, rank r and nonzero coefficients, the number of nondegenerate solutions of Σa_ix_i=1 in Γ is≤(8n)^{4n⁴(n+r+1)}. For a simple recurrence of order n its zero set is a union of at most (8n)^{4n⁵} arithmetic progressions, including singletons; when it is nondegenerate this bounds the number of zeros. These improve, rather than replace by definition, the parent ESS end targets.

**Declaration:** `dt2_refined_unit_counts`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-refined-unit-counts`.

**Hypotheses.** All fields, dimensions, normalizations and strict inequalities are as specified in the statement.

**Inputs:** [Public conic perturbation cover and the parent ESS budget](#dt2-perturbation-cover), [Rank exactness for the ratio projection](#dt2-ratio-rank-exact), [Preservation of nondegeneracy after merging a fibre](#dt2-merged-nondegeneracy), [Cyclic ratio fibres and intersections of progressions](#dt2-progression-fibres).

**Proof outline.**

1. Apply the same ratio/kernel induction with the AV cover and the displayed polynomial exponents; multiplying coefficients increases rank by at most one.
2. For cyclic recurrence root ratios use rank≤1 and the minimal vanishing-partition count, then pull back the ratio fibres to ℤ.
3. Specialize arbitrary characteristic-zero fields via the parent specialization theorem; distinct coefficients and the required nonvanishing conditions are preserved.

**Check.** Track rank+1 when absorbing coefficients. Simple roots are required for the stated progression count; repeated roots use the later polynomial-exponential argument.

**Sources and use.**

- [Small points on subvarieties of a torus](https://edoc.unibas.ch/server/api/core/bitstreams/c591a881-406c-49dd-ad51-24bfb5b80bb9/content), Theorem 6.2, p. 33; Corollary 6.3, p. 34. The affine block induction and cyclic specialization give the refined unit and simple-recurrence bounds.

## Norm forms and block algebras

<a id="dt2-block-constant-algebra"></a>

### Block-constant subalgebra

**Definition.** For a finite index type I, field F and equivalence relation P on I, B_P is the F-subalgebra of F^I consisting of functions constant on each P-class. It contains the image of the constant scalar functions (isomorphic to F when I is nonempty) and is isomorphic to F^{I/P}. Refining P increases B_P; intersecting such algebras corresponds to the equivalence relation generated by their relations. This light algebra is the stabilizer carrier in the norm-form argument.

**Declaration:** `blockConstantAlgebra`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-block-constant-algebra`.

**Hypotheses.** All fields, dimensions, normalizations and strict inequalities are as specified in the statement.

**Inputs:** `mathlib:Subalgebra` (see the native-export table).

**Proof outline.**

1. Pointwise sum, product and scalar multiplication preserve constancy, giving an actual subalgebra.
2. A function on I/P pulls back uniquely to a block-constant function; quotient induction gives the algebra equivalence.
3. Constancy under all relations is constancy under their generated equivalence closure.

**Planning API.** These are proposed contracts; only the light definitions and selected statements fit the suggested file.

| Name | Role | Contract |
| --- | --- | --- |
| `mem_blockConstantAlgebra` | characterisation | f∈B_P iff i P j implies f(i)=f(j). |
| `blockConstantAlgebra_quotient` | equivalence | B_P≃ₐ[F]F^{I/P}. |
| `blockConstantAlgebra_antitone` | relation | If P implies Q, then B_Q⊂B_P. |
| `blockConstantAlgebra_inf` | compatibility | B_P∩B_Q=B_{P∨Q}, where P∨Q is equivalence closure of their union. |
| `blockConstantAlgebra_isUnit_iff` | characterisation | A block-constant function is a unit iff its class values are all nonzero. |
| `blockConstantAlgebra_lift` | universal-property | Pullback from I/P is an algebra homomorphism onto B_P. An algebra map or function constant on classes descends uniquely; evaluation of the descended function at [i] is its value at i. |
| `blockConstantAlgebra_ext` | extensionality | Elements of B_P are equal iff their values agree at every i. |

**Consumers.** Norm-form exceptional cosets: Coordinatewise stabilizers of homogeneous linear solution patterns are precisely block-constant algebras.

**Unit tests.**

- `test_block_constant_algebra_1` (computation): For I={0,1,2} and classes {0,1},{2}, the functions are (a,a,b) and the algebra has dimension 2.
- `test_block_constant_algebra_2` (degenerate): The universal relation gives the diagonal algebra; equality gives the full product algebra.
- `test_block_constant_algebra_3` (non-example): For that two-block relation, (1,2,0) is not a member; (1,1,0) is a member but is not a unit.

**Check.** Check the two-block dimension and the two extreme partitions. Intersections use equivalence closure of the union, reversing refinement inclusion. For I empty the function algebra and B_P are the zero ring; no injective copy of F is asserted.

**Sources and use.**

- [The number of solutions of decomposable form equations](https://pub.math.leidenuniv.nl/~evertsejh/95-decforms.pdf), §2, pp. 8–14; §7, Lemmas 8–12, pp. 33–37. The block-constant algebra is a light derived carrier for the source unit patterns. Its quotient, universal-property and extensionality API are specified independently, including the empty index set.

<a id="dt2-norm-fixed-ideal"></a>

### A fixed norm reduces to finitely many ordinary-unit cosets

**Lemma.** Let M⊂K be a finitely generated ℤ-module and c∈ℚ*. Choose D>0 with DM⊂O_K. If the solution set is empty, finiteness is immediate. Otherwise, for any solution N_{K/ℚ}(ξ)=c, η=Dξ has fixed nonzero norm N=D^{[K:ℚ]}c∈ℤ. The principal ideal (η) has absolute ideal norm |N|, so the native fixed-ideal-norm finiteness theorem gives finitely many possibilities. In each nonempty ideal fibre choose η₀; then η=η₀u with u∈O_K*. Thus the original solution set lies in finitely many ordinary-unit cosets ξ₀O_K*.

**Declaration:** `dt2_norm_fixed_ideal`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-norm-fixed-ideal`.

**Hypotheses.** All fields, dimensions, normalizations and strict inequalities are as specified in the statement.

**Inputs:** `mathlib:Ideal.finite_setOfPred_absNorm_eq` (see the native-export table), `mathlib:Ideal.absNorm_span_singleton` (see the native-export table), `tauceti:Set.unitEmptyEquivUnits` (see the native-export table).

**Proof outline.**

1. Clear the denominators of the finitely many generators. The ring of integers is a finite free ℤ-module and a Dedekind domain; native Ideal.absNorm_span_singleton identifies the principal-ideal norm with the absolute field norm.
2. Apply native Ideal.finite_setOfPred_absNorm_eq to |N|. Equality (η)=(η₀) makes η and η₀ associated in O_K; their quotient is an ordinary integral unit.
3. Enlarging S would change which subfields have finite units and would invalidate the intended criterion.

**Check.** For K=ℚ, fixed nonzero norm fixes ξ uniquely. The c=0 case is not included.

**Sources and use.**

- [The number of solutions of decomposable form equations](https://pub.math.leidenuniv.nl/~evertsejh/95-decforms.pdf), §2, pp. 8–14. The norm reduction combines finite principal ideals of a fixed norm with units. An empty solution set is separated before the integral norm is asserted.

<a id="dt2-unit-linear-cosets"></a>

### Homogeneous unit solutions give finitely many stabilizer cosets

**Lemma.** Let W⊂F^I be a linear subspace and Γ⊂(F*)^I finite rank. Then W∩Γ is contained in finitely many cosets uH_P, where u∈W∩Γ, H_P=Γ∩B_P*, and uB_P⊂W. Choose finitely many linear equations defining W; for each solution choose a minimal vanishing partition of each equation. Finite homogeneous ratios give finitely many normalized patterns, and their common constancy partition is P.

**Declaration:** `dt2_unit_linear_cosets`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-unit-linear-cosets`.

**Hypotheses.** F is a field of characteristic zero, I is finite, W is an F-linear subspace and Γ has finite multiplicative rank. The affine unit bound used in every homogeneous ratio block is the characteristic-zero refined unit theorem.

**Inputs:** [Block-constant subalgebra](#dt2-block-constant-algebra), [Amoroso–Viada bounds for unit equations and simple recurrences](#dt2-refined-unit-counts).

**Proof outline.**

1. For each minimal homogeneous block divide by one nonzero term. The resulting affine equation is nondegenerate in the ratio-image subgroup, whose rank is finite, so the new refined unit-count theorem gives finitely many coordinate-ratio patterns over F. The parent rational-only ratio lemma is not used for general F.
2. Intersect the resulting finitely many ratio patterns across the defining equations. Two solutions of one pattern differ by a block-constant unit.
3. Every independent block relation vanishes after multiplying its whole block by one scalar, so uB_P⊂W. Intersect patterns using the equivalence closure, not by asserting independent equations have identical partitions.

**Check.** A class pattern must satisfy every defining equation of W. After intersections use generated equivalence relations; arbitrary characteristic-zero F cannot use a rational-only ratio theorem.

**Sources and use.**

- [The number of solutions of decomposable form equations](https://pub.math.leidenuniv.nl/~evertsejh/95-decforms.pdf), §2, pp. 8–14; §7, Lemmas 8–12, pp. 33–37. The source motivates the unit-pattern structure. The more general finite-rank homogeneous cover is derived from the characteristic-zero unit theorem, with ratio blocks and block-constant unit groups.
- [Small points on subvarieties of a torus](https://edoc.unibas.ch/server/api/core/bitstreams/c591a881-406c-49dd-ad51-24bfb5b80bb9/content), Theorem 6.2, p. 33. This supplies the characteristic-zero affine unit estimate needed for the homogeneous ratio blocks; positive-characteristic Frobenius families are excluded.

<a id="dt2-norm-galois-descent"></a>

### Galois-stable block algebras descend to subfields

**Lemma.** Embed K into a normal closure F by all ℚ-embeddings, ψ:K→F^I. Let V⊂K be a ℚ-subspace and u=ψ(ξ₀) with ξ₀≠0. Replace P by the equivalence closure of the union of P and all its Galois conjugates so uB_P⊂F⊗V and B_P is Galois-stable under the simultaneous permutation/semilinear action. Its invariants J=B_P^{Gal(F/ℚ)} are a ℚ-subalgebra of K; being a finite-dimensional domain, J is a subfield. One has ξ₀J⊂V, and the coset stabilizer inside O_K* is the unit group of O_J.

**Declaration:** `dt2_norm_galois_descent`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-norm-galois-descent`.

**Hypotheses.** All fields, dimensions, normalizations and strict inequalities are as specified in the statement.

**Inputs:** [Homogeneous unit solutions give finitely many stabilizer cosets](#dt2-unit-linear-cosets), [DiophantineApproximationAndTranscendence:DT.2/embedding-vectors-linearly-independent](../packets/DiophantineApproximationAndTranscendence.json), [Block-constant subalgebra](#dt2-block-constant-algebra).

**Proof outline.**

1. Conjugating both u and the subspace condition is legitimate because u comes from ξ₀ and V is rational. Intersect the algebras of the conjugate partitions.
2. Galois descent identifies F⊗K with the embedding product and descends the stable subalgebra. Its invariants lie inside K, so the descended algebra has no zero divisors and is a field.
3. For x∈J, x∈O_K and x⁻¹∈O_K are equivalent to both being integral over ℤ, hence x∈O_J*. This establishes ordinary units of J, with no allowed-prime enlargement.

**Check.** Use the semilinear permutation action on all embeddings. Intersect conjugate block algebras, so the relation is coarsened; the invariant algebra lies inside K and is therefore a domain.

**Sources and use.**

- [The number of solutions of decomposable form equations](https://pub.math.leidenuniv.nl/~evertsejh/95-decforms.pdf), §2, associated algebras, pp. 8–14; Lemma 9, p. 34. These identify the admissible algebra constraint. The invariant block algebra and the semilinear Galois descent to an intermediate field are derived here.

<a id="dt2-norm-finiteness-assembly"></a>

### The hard direction of the norm-form criterion

**Theorem.** For a finitely generated ℤ-submodule M⊂K and V=ℚM, assume M contains no μO_J with μ∈K* and J⊂K whose ordinary unit group is infinite. Then each nonzero fixed norm equation N_{K/ℚ}(ξ)=c in M has finitely many solutions. Equivalently, using the parent unit-rank criterion, exclude subfields other than ℚ and imaginary quadratic fields. The hypothesis in terms of M is equivalent to excluding μJ⊂V with infinite units: clear the finitely many integral-basis denominators to pass between them.

**Declaration:** `dt2_norm_finiteness_assembly`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-norm-finiteness-assembly`.

**Hypotheses.** All fields, dimensions, normalizations and strict inequalities are as specified in the statement.

**Inputs:** [A fixed norm reduces to finitely many ordinary-unit cosets](#dt2-norm-fixed-ideal), [Homogeneous unit solutions give finitely many stabilizer cosets](#dt2-unit-linear-cosets), [Galois-stable block algebras descend to subfields](#dt2-norm-galois-descent), [DiophantineApproximationAndTranscendence:DT.2/unit-group-infinite-criterion](../packets/DiophantineApproximationAndTranscendence.json).

**Proof outline.**

1. Fix each ideal/unit coset, apply the embedding product and homogeneous-unit coset decomposition.
2. Descend each stabilizer to a subfield J with ξ₀J⊂V. The hypothesis makes O_J* finite, so every coset supplies only finitely many solutions.
3. For μJ⊂ℚM, choose an integral basis of O_J and one common integer denominator expressing all μ-basis vectors in M; this gives dμO_J⊂M.
4. The easy direction already belongs to the parent: an infinite unit family in J has relative norm±1, so an index≤2 norm-one subgroup yields infinitely many equal norms.

**Check.** Clear denominators in a finite basis of O_J to compare μJ⊂ℚM with dμO_J⊂M. The stabilizer consists of ordinary units, preserving the imaginary-quadratic boundary.

**Sources and use.**

- [The number of solutions of decomposable form equations](https://pub.math.leidenuniv.nl/~evertsejh/95-decforms.pdf), Theorem 2, pp. 6–7; proof pp. 12–13. The associated fields govern norm-form infinitude. M is a finitely generated ℤ-submodule, and the unit-rank comparison is the infinite-family input.

## Repeated roots and progression counts

<a id="dt2-polynomial-exponential-bridge"></a>

### Native recurrences and polynomial-exponential normal form

**Comparison.** Over an algebraically closed characteristic-zero field, a two-sided recurrence with nonzero constant companion coefficient is Σ_i P_i(k)α_i^k with distinct α_i≠0 and Σ_i(deg P_i+1)=t for the minimal order t. A native ℕ-indexed LinearRecurrence solution with nonzero constant coefficient extends uniquely to ℤ by solving backwards. The native characteristic polynomial orders coefficients as X^t−Σ coeffs(i)X^i; preserve that convention.

**Declaration:** `dt2_polynomial_exponential_bridge`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-polynomial-exponential-bridge`.

**Hypotheses.** All fields, dimensions, normalizations and strict inequalities are as specified in the statement.

**Inputs:** `mathlib:LinearRecurrence` (see the native-export table), `mathlib:LinearRecurrence.IsSolution` (see the native-export table), `mathlib:LinearRecurrence.charPoly` (see the native-export table), `mathlib:LinearRecurrence.geom_sol_iff_root_charPoly` (see the native-export table), [Polynomial-geometric basis from finite differences](#dt2-finite-difference-basis).

**Proof outline.**

1. Use the finite-difference basis theorem on the companion shift. Each repeated root gives a polynomial times a geometric sequence; characteristic zero identifies its polynomial degree with multiplicity minus one.
2. Invertibility of the shift follows from the nonzero constant coefficient and gives unique backwards extension.
3. A zero root in a native recurrence can create a finite transient segment; remove it first and account for at most the order many initial positions rather than claiming every native solution extends.

**Check.** For (X−2)² a solution is (a+bk)2^k, not a sum of two distinct geometric roots. The zero sequence has minimal order 0 and is excluded from nondegenerate finite-zero statements.

**Sources and use.**

- [Zeros of linear recurrence sequences](https://publi.math.unideb.hu/paper/608/download/10_5486_PMD_2000_2336.pdf), §1, pp. 609–612. The polynomial-exponential normal form is the source recurrence model.
- [On the zeros of linear recurrence sequences](https://www.impan.pl/shop/en/publication/transaction/download/product/83761), §1, pp. 387–389. This gives the recurrence and multiplicity conventions. The bridge to native one-sided recurrence carriers is a separate derivation using finite differences and Vandermonde.

<a id="dt2-rational-perturbation"></a>

### Rational polynomial factors in a homogeneous unit relation

**Lemma.** For q≥3 let Γ⊂(Q̄*)^q have finite rank r, z=xy with x∈Γ, y∈(ℚ*)^q and h_proj(y)≤h_proj(x)/(4q²), where h_proj(u)=h(u₁:⋯:u_q) is the degree-normalized homogeneous projective height, and suppose Σz_i=0. The solutions lie in fewer than C(q,r)=(8q)^(4(q−1)^4(q+r)) proper linear subspaces of H={ΣZ_i=0}, hence in proper projective subspaces of P(H). This normalization has no fixed coefficients a_i; to include them absorb their vector into Γ and account for the possible rank increase. For q=2, h_proj(x)>0 admits no solution since z₁+z₂=0 implies h(x₁:x₂)=h(y₁:y₂), contradicting the strict factor 1/16. If h_proj(x)=0, solutions can fill H, a single proper ambient subspace, and no cover by proper subspaces inside H is asserted.

**Declaration:** `dt2_rational_perturbation`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-rational-perturbation`.

**Hypotheses.** All fields, dimensions, normalizations and strict inequalities are as specified in the statement.

**Inputs:** [Large perturbed unit points have small twisted height](#dt2-large-unit-height), [Amoroso–Viada bounds for unit equations and simple recurrences](#dt2-refined-unit-counts), [Finite-subset reduction to one number field](#dt2-finite-field-cover-transfer).

**Proof outline.**

1. For q≥3 normalize the homogeneous equation by one term, retaining the source projective height comparison. Apply the rational perturbation proof in n=q−1≥2 variables.
2. In the small range a non-torsion rational coordinate ratio has height≥log 2; in the large range use the repaired logarithmic cone cover and the AV conic budget. The extra cone factor is absorbed by C(q,r) exactly as in the repaired large-height estimate.
3. Transfer finite-subset covers to arbitrary finite rank. For q=2 use the explicit height equality of the inverse coordinate ratios and separate height zero; the weak published boundary would otherwise be false.

**Check.** For q=2 take Γ=⟨(−1,1)⟩ and y=(1,1). The nonzero point (−1,1) cannot lie in a proper subspace of the one-dimensional H; the repaired contract covers it only in the ambient H. A non-torsion rational coordinate ratio has logarithmic height≥log 2. Fixed coefficients are included only with their rank cost.

**Sources and use.**

- [On the zeros of linear recurrence sequences](https://www.impan.pl/shop/en/publication/transaction/download/product/83761), Lemma 2.2, p. 390. The proof uses n=q−1≥2. The packet restricts the proper relative cover to q≥3, explicitly uses homogeneous projective height, and treats the false binary height-zero boundary separately.
- [The zero multiplicity of linear recurrence sequences](https://archive.ymsc.tsinghua.edu.cn/pacm_download/117/6578-11511_2006_Article_BF02392575.pdf), Lemma 5, pp. 249–250. This is the predecessor rational perturbation argument; fixed equation coefficients cannot be added without accounting for their rank.

<a id="dt2-recurrence-degree-lowering"></a>

### Lowering the polynomial degree after a height gap

**Lemma.** For a nonzero polynomial vector P=(P₁,…,P_k), t=Σ_i(deg P_i+1), a=max_i(deg P_i+1), with t≥3, suppose some root ratio has h(α_i/α_j)≥0<ℏ≤1. Put E=16t²(a+1)/ℏ and F=C(t,2)+5E log E. The zeros of ΣP_i(k)α_i^k lie in the union of fewer than F zero sets of nonzero polynomial vectors P^(w) with no increased degrees and with strictly smaller total t. The source chooses one component whose degree strictly drops.

**Declaration:** `dt2_recurrence_degree_lowering`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-recurrence-degree-lowering`.

**Hypotheses.** The roots are nonzero algebraic numbers and the polynomial vector is nonzero over Q̄, with t≥3; zero components contribute zero to t. The root-ratio height premise and all polynomial degree comparisons use the nonzero components, and 0<ℏ≤1.

**Inputs:** [Rational polynomial factors in a homogeneous unit relation](#dt2-rational-perturbation), [Symmetric logarithmic seminorm](#dt2-symmetric-log-seminorm).

**Proof outline.**

1. Translate the index so that the exponential projective height grows at least linearly away from a central interval, using convexity of the logarithmic norm.
2. Expand the polynomial factors into monomial coordinates. The exponential parameter subgroup has rank≤2 after translation, while the rational factor height grows logarithmically.
3. For |k|>2E log E the rational perturbation bound applies to those monomial coordinates. Its proper relation eliminates a leading coefficient, producing a nonzero auxiliary vector with smaller total t.
4. The central interval |k|≤2E log E has fewer than 5E log E integer points since E is large under t≥3. Cover each point by an auxiliary lower-degree equation; add fewer than C(t,2) equations from the outer range.

**Check.** Each auxiliary coefficient vector is nonzero, has no increased component degree and strictly smaller total degree-plus-one. Account separately for the finite central interval.

**Sources and use.**

- [On the zeros of linear recurrence sequences](https://www.impan.pl/shop/en/publication/transaction/download/product/83761), Lemma 2.3, p. 391; parameters p. 390. The degree-lowering count uses t≥3, 0<ℏ≤1 and E=16t²(a+1)/ℏ.
- [The zero multiplicity of linear recurrence sequences](https://archive.ymsc.tsinghua.edu.cn/pacm_download/117/6578-11511_2006_Article_BF02392575.pdf), Lemma 6, pp. 250–251; Lemma 7, pp. 252–254. The convex height and rational polynomial-factor estimates give a finite central interval and a lower-degree cover outside it.

<a id="dt2-recurrence-splitting"></a>

### Splitting exponential sums by root-of-unity classes

**Lemma.** For f(k)=Σ_{i=1}^q a_iα_i^k with a_i≠0, group the roots by α_i/α_j of finite order. Except for fewer than G(q)=(8q)^{4(q−1)³q²} integer zeros, each root-of-unity class sum vanishes separately. The projective unit-equation bound controls the exceptional zeros by induction on minimal vanishing supports.

**Declaration:** `dt2_recurrence_splitting`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-recurrence-splitting`.

**Hypotheses.** All fields, dimensions, normalizations and strict inequalities are as specified in the statement.

**Inputs:** [Amoroso–Viada bounds for unit equations and simple recurrences](#dt2-refined-unit-counts), [Cyclic ratio fibres and intersections of progressions](#dt2-progression-fibres).

**Proof outline.**

1. Select a support-minimal vanishing subsum. If it crosses two root-of-unity classes, apply the homogeneous rank-one unit bound to its finite projective ratio set.
2. Remove that exceptional set and split the remaining equation inside classes; induct on q, bounding all support choices by G(q).

**Check.** Split only genuinely disconnected supports; a dependence within a connected support must lead to a strictly smaller coefficient complexity.

**Sources and use.**

- [On the zeros of linear recurrence sequences](https://www.impan.pl/shop/en/publication/transaction/download/product/83761), Lemma 2.4, p. 391. The class modulus makes the height or torsion-order separation effective.
- [The zero multiplicity of linear recurrence sequences](https://archive.ymsc.tsinghua.edu.cn/pacm_download/117/6578-11511_2006_Article_BF02392575.pdf), §6, pp. 257–258. The predecessor argument chooses a pair with the relevant height or order and then restricts to a residue class.

<a id="dt2-recurrence-conjugate-selection"></a>

### Conjugate determinants and denominator selection

**Lemma.** For Q-independent forms M₁,…,M_n with algebraic coefficient rows a_i of trailing support t_i, set T=min(kⁿ,e^{12Σt_i}). Every determinant of conjugate evaluations has at most T nonzero monomials. From its conjugate embedding tree one can select 3T embeddings at each branch so every triple of distinct selected conjugates of a root ratio β generates a group of size>T^{−11T³}deg β if β is not torsion, or>T^{−11T³}ord β if β is torsion. This is the combinatorial and Galois input to the class-modulus proposition.

**Declaration:** `dt2_recurrence_conjugate_selection`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-recurrence-conjugate-selection`.

**Hypotheses.** Here k,n≥2, so T≥4; the one-form and one-root cases belong to the next node. Enlarge the coefficient number field so its degree D>exp(3T⁴). The triple conclusion concerns only the root ratios selected from the common nonzero monomial pattern of the conjugate determinant, not every arbitrary root ratio.

**Inputs:** [Splitting exponential sums by root-of-unity classes](#dt2-recurrence-splitting), [Cyclic ratio fibres and intersections of progressions](#dt2-progression-fibres), [DiophantineApproximationAndTranscendence:DT.2/specialization-to-algebraic-numbers](../packets/DiophantineApproximationAndTranscendence.json), [Explicit non-torsion height and conjugacy-class refinement](#dt2-explicit-degree-height).

**Proof outline.**

1. Count ordered independent coefficient-row tuples by dyadic trailing-support sizes. The number of nonzero determinant monomials is≤k^n and<exp(12Σt_i), hence≤T.
2. Choose a common nonzero determinant monomial pattern and its conjugate embedding tree. Every selected branch has more than D/T^((5/4)T²) elements; for the root ratios β identified by this pattern, the relevant multiplicity n_K(β) has the same lower bound.
3. For nontorsion β use the class-product height bound h(β)>1/(8T⁷deg β) and the pattern-height comparison. The resulting small-bad-triple estimate produces three conjugates generating a group larger than T^(−11T³)deg β.
4. For torsion β use rational phase denominators: the fraction of triples with small generated order is≤11ε^(1/2). The union bound over 3T-tuples is<2ε^(1/2)(3T)³; take ε=T^(−10T³). Exclude repeated embeddings.
5. Select 3T embeddings per branch satisfying these triple estimates simultaneously for the selected ratios. The explicit non-torsion height bound remains conditional on its declared external-input gap.

**Check.** Count bad embedding tuples uniformly in the number-field degree. The nontorsion height bound remains conditional on its explicit external-input gap.

**Sources and use.**

- [Zeros of linear recurrence sequences](https://publi.math.unideb.hu/paper/608/download/10_5486_PMD_2000_2336.pdf), Lemma 2, p. 620; Lemma 3, pp. 621–623; Lemma 4, pp. 626–627; Lemma 5, pp. 627–628; §7, pp. 625–630. The conjugate tree applies for k,n≥2 and T≥4. The triple conclusion is about the selected ratios in the common determinant pattern, with the specified branch-size lower bound.
- [The zero multiplicity of linear recurrence sequences](https://archive.ymsc.tsinghua.edu.cn/pacm_download/117/6578-11511_2006_Article_BF02392575.pdf), §§7–11, pp. 259–274; Appendix, pp. 274–282. The predecessor provides the generated-conjugate-group and denominator machinery used by Schmidt 2000. The non-torsion height input is not treated as closed.

<a id="dt2-recurrence-class-modulus"></a>

### Corrected class-modulus proposition

**Theorem.** For k≥2 let Q-independent forms M_j have nonzero coefficient rows a_i with trailing support lengths t_i, let T=min(kⁿ,e^{12Σt_i}), ℏ=e^{−6T⁴}, and α_i≠0 algebraic. The integers x for which M₁(α^x),…,M_n(α^x) are Q-dependent belong to fewer than H(T)=(8T)^{4(T−1)T⁴} classes. Each class has a modulus m≥1 with all x congruent modulo m, and some i≠j such that either α_i/α_j is not torsion and h(α_i^m/α_j^m)≥ℏ, or it is torsion and ord(α_i^m/α_j^m)≤ℏ^{−1}. Both the dependence condition and the m in the height bound correct the published AV statement.

**Declaration:** `dt2_recurrence_class_modulus`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-recurrence-class-modulus`.

**Hypotheses.** All fields, dimensions, normalizations and strict inequalities are as specified in the statement.

**Inputs:** [Conjugate determinants and denominator selection](#dt2-recurrence-conjugate-selection), [Splitting exponential sums by root-of-unity classes](#dt2-recurrence-splitting), [Amoroso–Viada bounds for unit equations and simple recurrences](#dt2-refined-unit-counts).

**Proof outline.**

1. If k=1, Q-independent forms give Q-independent nonzero evaluated values for every x, so the dependent-value set is empty; no ratio i≠j is needed. For k≥2,n=1 use the homogeneous unit bound and the splitting lemma, giving fewer than G(k)+2^k k^(3k²)≤H(k) classes; here T=k.
2. Dependence forces every conjugate determinant to vanish. Apply the splitting lemma to each selected determinant and isolate the distinguished monomial.
3. Classify the chosen three-element embedding branches, common minimal supports and projective unit ratios. Comparing two indices in the same class makes their difference divisible by the order m of the generated finite group.
4. The preceding triple-group lower bound and the non-torsion degree-height bound imply h(β^m)=m h(β)>ℏ; in the torsion case m divides ord β and the residual order is≤ℏ^{−1}.
5. Use the improved C,G bounds in the original Schmidt count to obtain H(T); exceptional singletons may take a sufficiently large m.
6. Only for k,n≥2 apply the conjugate-selection tree. The dependence condition forces the determinant vanishings used in its proof.

**Check.** For n=1, dependence means the single evaluated form is zero. Independence would concern all nonzero values and cannot support the induction. The lower bound on h(β^m) gives no corresponding lower bound on h(β).

**Sources and use.**

- [On the zeros of linear recurrence sequences](https://www.impan.pl/shop/en/publication/transaction/download/product/83761), Proposition 2.5, pp. 392–394. The evaluated forms must be dependent, and the non-torsion alternative concerns the powered ratio. The packet also isolates k=1 and n=1.
- [Zeros of linear recurrence sequences](https://publi.math.unideb.hu/paper/608/download/10_5486_PMD_2000_2336.pdf), Proposition, p. 616; conclusion of §7, p. 630. The original dependence proposition and m·h(β) estimate verify both corrections to the AV statement.

<a id="dt2-finite-progression-obstruction"></a>

### Finite obstruction to lowering a progression count

**Lemma.** For Z⊂ℤ a finite union of two-sided arithmetic progressions and singletons, let ν(Z) be its least number of such pieces. There is a finite T⊂ℤ outside Z such that every finite union Z′⊃Z with Z′∩T=∅ satisfies ν(Z′)≥ν(Z). This lower bound, rather than equality for arbitrary supersets, is the contract needed for specialization.

**Declaration:** `dt2_finite_progression_obstruction`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-finite-progression-obstruction`.

**Hypotheses.** All fields, dimensions, normalizations and strict inequalities are as specified in the statement.

**Inputs:** [Cyclic ratio fibres and intersections of progressions](#dt2-progression-fibres).

**Proof outline.**

1. Choose a minimal representation with isolated points Z₁ and periodic part Z₂. For each pair of isolated points, exclude one nonzero-set point on the progression through that pair, so a progression avoiding T contains at most one isolated point.
2. If Z₂ has period q, put ℓ=qν(Z). In a translated interval of length qℓ disjoint from Z₁, exclude all points outside Z₂. Every progression of modulus≤ℓ avoiding this finite set lies in Z₂.
3. Suppose Z′ had fewer than ν(Z) pieces. Replace progressions disjoint from Z₂ by their at most one isolated point; enlarge the small-modulus progressions inside Z₂ to moduli dividing q. Their periodic union must fill Z₂: otherwise its density is short by at least 1/q, and the remaining fewer than ν(Z) progressions each have density<1/ℓ.
4. The periodic pieces therefore need at least ν(Z₂) pieces, and every remaining piece covers at most one isolated point. Their total is at least ν(Z), a contradiction. This proves the stated lower bound.

**Check.** For Z={0} one can take T empty; Z′={0,1} shows why the conclusion is a lower bound rather than equality. For Z=2ℤ∪3ℤ, the obstruction protects a least cover by two independent moduli; it does not prescribe one common modulus.

**Sources and use.**

- [Zeros of linear recurrence sequences](https://publi.math.unideb.hu/paper/608/download/10_5486_PMD_2000_2336.pdf), Lemma 1, pp. 613–615. The overlap splitting bound requires h≥max(d,√(2d⌈log h⌉)). The printed inequality was checked in the page image because text extraction loses its comparison sign.

<a id="dt2-recurrence-refined-count"></a>

### Refined counts for multiple-root recurrences

**Theorem.** Let a nonzero recurrence over an algebraically closed characteristic-zero field have minimal order t≥1, k distinct nonzero roots and maximum root multiplicity a. Its integer zero set is a union of at most exp(exp(70t)) arithmetic progressions, including singletons. If no quotient of distinct roots is a root of unity, it has at most (8k^a)^{8k^{6a}} zeros, also≤exp(32a k^{6a}log k) for k≥2. For k=1 there are at most a−1 zeros. No common progression modulus is required.

**Declaration:** `dt2_recurrence_refined_count`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-recurrence-refined-count`.

**Hypotheses.** All fields, dimensions, normalizations and strict inequalities are as specified in the statement.

**Inputs:** [Native recurrences and polynomial-exponential normal form](#dt2-polynomial-exponential-bridge), [Corrected class-modulus proposition](#dt2-recurrence-class-modulus), [Lowering the polynomial degree after a height gap](#dt2-recurrence-degree-lowering), [Cyclic ratio fibres and intersections of progressions](#dt2-progression-fibres), [Finite obstruction to lowering a progression count](#dt2-finite-progression-obstruction), [DiophantineApproximationAndTranscendence:DT.2/specialization-to-algebraic-numbers](../packets/DiophantineApproximationAndTranscendence.json), [SchemeAndStackFoundations:SF.5](../packets/SchemeAndStackFoundations.json).

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

**Sources and use.**

- [On the zeros of linear recurrence sequences](https://www.impan.pl/shop/en/publication/transaction/download/product/83761), Theorems 1.1–1.2, pp. 387–389; proofs pp. 393–396. These are the general and nondegenerate progression budgets, using the corrected powered-height proposition.
- [Zeros of linear recurrence sequences](https://publi.math.unideb.hu/paper/608/download/10_5486_PMD_2000_2336.pdf), §§2–3, pp. 613–619. The overlap split and homogeneous unit-pattern bounds provide the finite combinatorial induction.
- [The zero multiplicity of linear recurrence sequences](https://archive.ymsc.tsinghua.edu.cn/pacm_download/117/6578-11511_2006_Article_BF02392575.pdf), §2, Lemma 1, pp. 246–247. The nondegenerate specialization has only isolated zeros, with the prescribed root-multiplicity parameters.

## Native bridges and explicitly open arithmetic inputs

<a id="dt2-height-zero-torsion"></a>

### Height zero in a number field is torsion

**Lemma.** For x∈K* in a number field, absolute logarithmic height h(x)=0 if and only if x has finite multiplicative order. Only the fixed-field assertion is needed to prove the real logarithmic norm has zero kernel.

**Declaration:** `dt2_height_zero_torsion`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-height-zero-torsion`.

**Hypotheses.** All fields, dimensions, normalizations and strict inequalities are as specified in the statement.

**Inputs:** `mathlib:NumberField.finite_setOfPred_logHeight₁_le` (see the native-export table), `mathlib:Height.logHeight₁_zpow` (see the native-export table).

**Proof outline.**

1. If h(x)=0, all positive powers have height zero by the native power identity; fixed-field Northcott makes them a finite set. Two powers coincide, so x has finite order.
2. Conversely a nonzero power equal to 1 and the power identity imply h(x)=0.

**Check.** Exclude x=0. Finite-order powers have height zero, and finite fixed-field bounded-height powers give two equal positive powers.

**Sources and use.**

- [Linear equations in variables which lie in a multiplicative group](https://arxiv.org/pdf/math/0409604v1), §7, pp. 825–826. This motivates fixed-field discreteness. The packet gives an independent bounded-degree proof of a positive non-torsion height gap from native Northcott, without invoking Dobrowolski.

<a id="dt2-finite-difference-basis"></a>

### Polynomial-geometric basis from finite differences

**Theorem.** For distinct nonzero α_i and multiplicities t_i>0 over a characteristic-zero field, the sequences k↦k^jα_i^k, 0≤j<t_i, are linearly independent and annihilated by ∏_i(shift−α_i)^{t_i}. They form a basis of the native solution space for that companion polynomial, of dimension Σt_i.

**Declaration:** `dt2_finite_difference_basis`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-finite-difference-basis`.

**Hypotheses.** All fields, dimensions, normalizations and strict inequalities are as specified in the statement.

**Inputs:** `mathlib:LinearRecurrence.solSpace_rank` (see the native-export table), `mathlib:LinearRecurrence.charPoly` (see the native-export table), `mathlib:LinearRecurrence.geom_sol_iff_root_charPoly` (see the native-export table).

**Proof outline.**

1. The operator shift−α lowers the degree of P(k)α^k by one when its root matches; for a different root it preserves the leading degree with nonzero leading scalar.
2. To isolate one root group apply the annihilators of all other groups. A nonzero polynomial over a characteristic-zero field cannot vanish at all natural integers, proving independence.
3. The native solution-space rank then gives spanning. Invertible constant coefficient allows extension backwards without a generic Jordan-form dependency.

**Check.** For (X−2)² the basis is 2^k and k2^k. Distinct-root annihilators preserve the other polynomial leading degree; the dimension is the sum of multiplicities.

**Sources and use.**

- [Zeros of linear recurrence sequences](https://publi.math.unideb.hu/paper/608/download/10_5486_PMD_2000_2336.pdf), §1, equations (1.2)–(1.3), pp. 609–610. These describe the source polynomial-exponential model. The actual normal-form basis over native recurrence carriers is derived by finite differences and Vandermonde.

<a id="dt2-continued-place-completion"></a>

### Completion comparison for arbitrary continued absolute values

**Comparison.** Given an absolute value on K extending the normalized rational archimedean or p-adic value, construct its metric completion and show the inclusion of K preserves the specified absolute value. Identify the resulting completion with ℝ or ℂ in the archimedean case, or a finite extension of ℚ_p in the nonarchimedean case, with the degree/multiplicity convention of the parent continued-value statements. The existing complete-complex-algebra equivalence cannot create the missing complex algebra structure.

**Declaration:** `dt2_continued_place_completion`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-continued-place-completion`.

**Hypotheses.** All fields, dimensions, normalizations and strict inequalities are as specified in the statement.

**Inputs:** [GlobalNumberFields layer-0-places-completions-and-the-product-formula](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/TauCetiRoadmap/GlobalNumberFields/README.md#layer-0-places-completions-and-the-product-formula), [Current-owner places and absolute height normalization](#dt2-place-normalization).

**Proof outline.**

1. The lower-tier owner supplies completions, the embedding over ℚ or ℚ_p, and uniqueness of the compatible spectral norm.
2. Archimedean classification needs the real case and construction of the complex action before applying a complex Banach-algebra equivalence.
3. No complete proof of this classification has yet been read for the arbitrary continued value; it remains the explicit parent gap.

**Check.** Do not apply a complex-algebra classification before constructing the complex action. Preserve the given norm, and include the real completion case.

**Sources and use.**

- [A further improvement of the quantitative Subspace Theorem](https://annals.math.princeton.edu/wp-content/uploads/annals-v177-n2-p04-p.pdf), §2.1, pp. 516–517. Arbitrary continued absolute values are part of the theorem conventions; this is not a proof of their completion classification.
- [A quantitative version of the Absolute Subspace Theorem](https://pub.math.leidenuniv.nl/~evertsejh/00-abssub.pdf), §1, pp. 1–4. The completion conventions motivate the adapter. The full construction and classification remain the explicit gap.

<a id="dt2-explicit-degree-height"></a>

### Explicit non-torsion height and conjugacy-class refinement

**Theorem.** For a nonzero algebraic number β that is not a root of unity, of degree d≥2, d h(β)>(1/4)(log log d/log d)³. The weaker bound h(β)≥1/(4d(log⁺d)³), with log⁺x=max(1,log x), also includes d=1 by h(β)≥log 2. If its d conjugates form m equal-size classes modulo roots of unity, then h(β)≥1/(4d(log⁺m)³): the product of one class has degree≤m, is not torsion and has height≤(d/m)h(β). This is the quantitative height input for Schmidt’s conjugate selection.

**Declaration:** `dt2_explicit_degree_height`; packet id `DiophantineApproximationAndTranscendence:DT.2/dt2-explicit-degree-height`.

**Hypotheses.** All fields, dimensions, normalizations and strict inequalities are as specified in the statement.

**Inputs:** [Current-owner places and absolute height normalization](#dt2-place-normalization), [Height zero in a number field is torsion](#dt2-height-zero-torsion).

**Proof outline.**

1. For Voutier’s bound, first reduce nonintegral numbers using their leading coefficient and reduce degree when powering causes conjugate collisions. For the remaining integral case form the confluent Vandermonde matrix at conjugates and their first-prime powers, with multiplicities k and 1.
2. Its square is a nonzero rational integer. The determinant product formula and Fermat congruences give divisibility by (p₁⋯p_s)^{2dk}; discriminant factors supply the second lower bound. Hadamard and the factorial product give the upper bound in terms of the Mahler measure.
3. Compare the two bounds with (k,s)=(7,11),(8,14),(7,17) in the finite degree ranges, and k≈k₁ log d/log log d, s≈s₁(log d/log log d)² for d>10000. The primary proof was read; its external prime estimates, Odlyzko bound, degree-reduction lemma and low-degree computations remain the explicit gap, rather than pretending they follow from Northcott.
4. For the weaker degree estimate, Voutier gives the implication directly when d≥16 since log log d≥1. For 2≤d≤15 separately use the stated low-degree Mahler-measure input and certify its comparisons to 1/(4(log⁺d)³); d=1 uses log 2. These low-degree verifications are included in the declared external-input gap.
5. For the class refinement use Galois transitivity to prove equal class sizes. The class product has at most m conjugates; if it were torsion, β^{d/m} would be torsion. Apply the weaker degree bound to this product and divide its upper height estimate by d/m.

**Check.** At d=2 the expression with log log d is negative, so use h≥1/(4d(log⁺d)³) only after verifying the low-degree cases, not by dropping log log d. The class-product degree can be 1: include the rational lower bound log 2. The class-refined denominator is d(log⁺m)³, not m(log⁺m)³.

**Sources and use.**

- [An effective lower bound for the height of algebraic numbers](https://matwbn.icm.edu.pl/ksiazki/aa/aa74/aa7417.pdf), Main theorem, p. 83; Lemmas 1–8, pp. 84–90; proof pp. 90–94. The determinant proof is read, but its analytic, discriminant, collision and low-degree Mahler-measure inputs remain declared. The weaker uniform degree bound needs a separate d≤15 verification.
- [The zero multiplicity of linear recurrence sequences](https://archive.ymsc.tsinghua.edu.cn/pacm_download/117/6578-11511_2006_Article_BF02392575.pdf), Lemmas 10–11, pp. 259–260. The generated-group argument uses the non-torsion degree-height bound with its numerical parameters; it remains conditional on the same external-input gap.

## Confirmed native exports

Mathlib is pinned at `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti at `f790474821cf4256814db967cb154e7af3d0c369`. Every declaration and its active hypotheses were read independently. Current-owner reading is separate from these pins: TauCetiRoadmap `0d144d044dacebca17b654695b6f1ad58f159b27`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.

| Native declaration | What it supplies | Independent check |
| --- | --- | --- |
| [mathlib:Height.logHeight₁_zpow](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/Height/Basic.lean) | For nonzero x and integer m, native logarithmic scalar height of x^m is \|m\| times that of x. | The declaration actually allows zero as well; the nonzero specialization used here is weaker. |
| [mathlib:Ideal.absNorm_span_singleton](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Ideal/Norm/AbsNorm.lean) | For a finite free ℤ-algebra that is a Dedekind domain, the norm of (r) is natAbs of Algebra.norm ℤ r; used for O_K. | Finite free ℤ-algebra and Dedekind assumptions hold for the ring of integers; the absolute norm is the absolute integer norm. |
| [mathlib:Ideal.finite_setOfPred_absNorm_eq](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Ideal/Norm/AbsNorm.lean) | Integral ideals of specified natural absolute norm form a finite set in the finite free ℤ Dedekind algebra O_K. | The finite fixed-norm theorem applies to integral ideals of the ring of integers, not to arbitrary fractional ideals. |
| [mathlib:LinearMap](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Module/LinearMap/Defs.lean) | Bundled semilinear maps over a ring homomorphism between semiring modules; real-linear forms use the identity homomorphism. | The native carrier includes semilinear maps over semirings; identity scalar map gives the required linear forms. |
| [mathlib:LinearRecurrence](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/LinearRecurrence.lean) | Order and coefficient data for native one-sided linear recurrences. | The native data are one-sided, so the reader plans a bridge rather than treating a two-sided source sequence as this carrier. |
| [mathlib:LinearRecurrence.IsSolution](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/LinearRecurrence.lean) | The predicate u(n+order)=Σ coeff_i u(n+i) over the native scalar module. | The defining recurrence uses the native coefficient order and scalar module. |
| [mathlib:LinearRecurrence.charPoly](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/LinearRecurrence.lean) | The monic companion polynomial X^order−Σ coeff_i X^i. | The native polynomial is X^order minus the coefficient sum, with the stated ordering. |
| [mathlib:LinearRecurrence.geom_sol_iff_root_charPoly](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/LinearRecurrence.lean) | A geometric sequence solves the recurrence exactly when its scalar is a characteristic-polynomial root. | The geometric-solution criterion uses this same polynomial convention. |
| [mathlib:LinearRecurrence.solSpace_rank](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/LinearRecurrence.lean) | The native solution module has rank equal to the recurrence order; gives spanning after an independent normal-form family. | The rank theorem retains the strong rank condition; its field specialization is the one used. |
| [mathlib:Matrix.det_vandermonde_ne_zero_iff](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Vandermonde.lean) | Over a field, the Vandermonde determinant is nonzero exactly when its node family is injective. | The determinant criterion has the domain hypothesis, satisfied by the field specialization. |
| [mathlib:NumberField.Units.instZLattice_unitLattice](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/NumberField/Units/DirichletTheorem.lean) | Native ordinary-unit logarithmic image is a full discrete ℤ-lattice in the chosen reduced real coordinate space. | This is a full lattice only in the reduced infinite-place coordinate space; finite S-directions still require an adapter. |
| [mathlib:NumberField.Units.unitLattice](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/NumberField/Units/DirichletTheorem.lean) | The ordinary-unit logarithmic image after deleting the distinguished infinite coordinate; S-unit finite valuation directions are extra. | The image deletes a distinguished infinite coordinate; it is not already the full S-unit logarithmic lattice. |
| [mathlib:NumberField.finite_setOfPred_logHeight₁_le](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/Height/NumberField.lean) | A fixed number field has only finitely many scalar elements below any fixed native logarithmic-height bound. | The bound is for a fixed number field; bounded-degree conclusions are derived through finite extensions or Plücker coordinates. |
| [mathlib:NumberField.mulHeight_eq](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/Height/NumberField.lean) | Native projective sup height is the infinite-place product with multiplicities times the finite-place product; it is not degree-normalized. | The native number-field height is degree-weighted rather than normalized; the packet explicitly takes its degree root. |
| [mathlib:NumberField.totalWeight_eq_finrank](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/Height/NumberField.lean) | The total native height weight equals the degree over ℚ; divide logarithmic heights by this degree. | Total weight equals degree, exactly the normalization required by the adapter. |
| [mathlib:Subalgebra](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Algebra/Subalgebra/Basic.lean) | Bundled subsemiring of an algebra closed under the scalar algebra map; used with the existing pointwise algebra on functions. | The bundled pointwise subalgebra carrier supports the real-bodied block-constant definition, including an empty index set. |
| [tauceti:Set.unitEmptyEquivUnits](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RingTheory/DedekindDomain/SInteger/Unit.lean) | Units outside the empty set of finite primes are equivalent to ordinary units of the Dedekind base ring. | The empty-S equivalence supplies ordinary units with no new S-unit carrier. |
| [tauceti:Set.unitValuation_ker](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RingTheory/DedekindDomain/SInteger/Unit.lean) | The kernel of the S-unit valuation map is the image of ordinary units under the native embedding. | The kernel is the embedded ordinary-unit group; neither fullness nor finite-index image is asserted here. |
| [tauceti:Set.unit_fg_of_units](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RingTheory/DedekindDomain/SInteger/Unit.lean) | For finite S and finitely generated ordinary units, the native S-unit group is finitely generated; it does not assert its logarithmic rank or fullness. | This is finite generation under finite S and finitely generated ordinary units, not a logarithmic rank theorem. |

## Requested supplier contracts

These requests are open contracts with the owners below. A stage citation does not assert that an unread supplier has implemented the contract. No higher-tier roadmap fills a gap.

### Request 1

**Owner:** [GeometryOfNumbersAndQuadraticArithmetic:GN.1](../packets/GeometryOfNumbersAndQuadraticArithmetic.json).

Part II: for K of degree d and L-dimensional adelic convex boxes (bounded open symmetric convex sets at infinity, integral lattices at finite places, standard outside a finite set), with Haar covolume(K^L)=1 and dilation only at infinity, the K-linear successive minima satisfy (∏λ_j)^d volume(box)≤2^(dL) (BV1983 Theorem 3, pp. 18–22). Also supply Vaaler1979 Theorem 1: a central section of a product of volume-one Euclidean balls has intrinsic volume≥1, equivalently ∫1_Q(Ax)dx≥det(AᵀA)^(−1/2) for full-column-rank A. Its proof uses radial Gaussian peakedness, Kanter’s product theorem for symmetric log-concave measures and a thin-normal-slab limit. Do not assert Vaaler’s conjectural extension to arbitrary convex bodies or duplicate the existing real-lattice upper-product theorem.

**Consumers:** [Small vectors in number-field linear kernels](#dt2-siegel-kernel).

### Request 2

**Owner:** [GlobalNumberFields layer-0-places-completions-and-the-product-formula](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/TauCetiRoadmap/GlobalNumberFields/README.md#layer-0-places-completions-and-the-product-formula).

Use the current-owner normalized place/completion/product-formula interfaces. Part II strength needed: start from an arbitrary absolute value continuing a rational value and identify its metric completion with a place completion while preserving the norm; include the real case and construction of the complex action. Native places already exist and are never replanned here.

**Consumers:** [Current-owner places and absolute height normalization](#dt2-place-normalization), [Full S-unit logarithmic image](#dt2-s-unit-log-lattice), [Completion comparison for arbitrary continued absolute values](#dt2-continued-place-completion).

### Request 3

**Owner:** [GlobalNumberFields layer-2-moduli-and-ray-class-carriers](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/TauCetiRoadmap/GlobalNumberFields/README.md#layer-2-moduli-and-ray-class-carriers).

Part II of current GlobalNumberFields Layer 2: use native finite ClassGroup (𝓞 K) to make every selected nonzero finite prime ideal have a positive principal power. Its generator is an S-unit and yields one independent finite valuation direction. Deduce finite-index image of the native S-valuation map in ℤ^S, with its existing kernel. This is a requested adapter, not a new proof of class-group finiteness; GN.4 homogeneous dynamics supplies neither this ideal-theoretic contract nor its carrier.

**Consumers:** [Full S-unit logarithmic image](#dt2-s-unit-log-lattice).

### Request 4

**Owner:** [SchemeAndStackFoundations:SF.5](../packets/SchemeAndStackFoundations.json).

Part II of intersection theory: degree and Hilbert functions of projective reduced varieties, isolated primary components, incidence Chow forms, proper projection images/generic hyperplane dimension drops, bounded-degree closed points obtained by generic rational linear sections of a ℚ-defined variety outside a proper closed subset, degree Bézout, torus stabilizer dimension and finite component group, and finite-translation degree formulas in the fixed projective embedding. These contracts move down from higher-tier Heights rational-point/Hilbert plans; DT owns the arithmetic estimates, not the generic geometry. Include the projective-bundle Chow calculation, effective Cartier intersections and component lengths used by the Product Theorem. These are requested stage contracts: the unread supplier stage has no verified exports under the former projective-bundle-formula, smooth-intersection, cartier-gysin, tor-intersection or chow-group node ids.

**Consumers:** [Fubini–Study Chow height](#dt2-cycle-height), [Toric equation complexity and exceptional locus](#dt2-toric-complexity), [Hilbert-function lower and fat-point upper bounds](#dt2-hilbert-multiplicity-bounds), [Stabilizers and translation degree control](#dt2-toric-translate-degree), [Multiprojective degrees and the product criterion](#dt2-multiprojective-degree), [Refined counts for multiple-root recurrences](#dt2-recurrence-refined-count).

### Request 5

**Owner:** [SchemeAndStackFoundations:SF.2](../packets/SchemeAndStackFoundations.json).

Part II: generic Koszul complexes and their parameter-sequence local-cohomology comparisons sufficient for the corrected Chardin–Philippon relative regularity and isolated-component Hilbert lower bound. Use the erratum definition quantified over all parameter sequences, and its valid one-way local-cohomology implications; the reverse local-cohomology implication in the original paper is false.

**Consumers:** [Hilbert-function lower and fat-point upper bounds](#dt2-hilbert-multiplicity-bounds).

## Five open mathematical inputs

DT.2 remains planned. These inputs and the supplier requests must be resolved before closure.

### Corrected absolute Siegel basis theorem

The original Roy–Thunder metric defect is independently confirmed by a rotation calculation; the planner records the 1999 preview. Obtain and read the full corrected-basis proof on pp. 48–51 of that erratum, derive the corrected absolute small-basis/determinant inequality and propagate its constants to ES Corollary 7.2. The invariant metric alone does not establish the upper Minkowski bound.

**Needed by:** [From corrected absolute bases to twisted Minkowski](#dt2-absolute-minkowski-reduction).

### Arbitrary continued-value completion classification

Read a public complete proof constructing the metric completion from an arbitrary continued absolute value, showing finite-dimensionality over the completed rational field, constructing the real/complex algebra action when appropriate and identifying the preserved norm. Native spectral-norm uniqueness is only conditional on these constructions.

**Needed by:** [Completion comparison for arbitrary continued absolute values](#dt2-continued-place-completion).

### Arithmetic Bézout in the Fubini–Study normalization

Evertse specifies the Chow/Faltings height and quotes arithmetic intersection inputs. Read a full primary proof of the sphere-integral formula, proper arithmetic Bézout and the product-height formula with the exact derivative constants; extend DT.2 here. Do not invoke the higher-tier Arakelov package or identify Chow coefficient height with cycle height.

**Needed by:** [Fubini–Study Chow height](#dt2-cycle-height), [Arithmetic cuts and the factor-height estimate](#dt2-arithmetic-intersection).

### Explicit short-prime interval estimate

AV2009 quotes Rosser–Schoenfeld estimates to choose a prime in the prescribed interval avoiding finitely many stabilizer factors. Read the primary analytic estimates and verify the small numerical cases and exclusion count used in Theorems 2.1–2.2; the quoted input is not yet decomposed.

**Needed by:** [Explicit small-point cut and relative descent](#dt2-small-point-cut).

### External inputs to the explicit non-torsion height bound

Voutier 1996 pp. 81–95 and Schmidt Lemma 11 were read in full. Voutier quotes Robin prime-product estimates and Rosser–Schoenfeld prime upper bounds (Lemma 2), Poitou/Odlyzko log|D_K|>3.108d−8.6d^(1/3) (Lemma 4), the degree-reduction lemma for conjugate collisions (proof p. 91), and Smyth/Boyd low-degree Mahler-measure results (degrees≤21). Read or independently establish these precise contracts, including certified finite-degree numerical checks; the determinant proof alone does not close this branch. In particular the weaker d-dependent bound requires certified comparisons for 2≤d≤15; Voutier’s main formula alone gives the requested simplification only from d≥16.

**Needed by:** [Explicit non-torsion height and conjugacy-class refinement](#dt2-explicit-degree-height), [Conjugate determinants and denominator selection](#dt2-recurrence-conjugate-selection).

## Independently checked source issues

The following descriptions and calculations are paraphrases. New findings are scoped to the versions read. The packet records the correction searches and an independent verdict for each issue.

### E-DT2-1

**Source:** [A further improvement of the quantitative Subspace Theorem](https://annals.math.princeton.edu/wp-content/uploads/annals-v177-n2-p04-p.pdf), Proposition 13.6 proof, published p. 559.

**Printed claim.** The proof puts every zero-sum weight vector divided by its positive maximum in [−1,1]^n.

**Correction.** The admissible region is [−(n−1),1]^n with sum zero. For the ε≤1/10 actually used later, discretize b_i=1−c_i/γ in the mass-n simplex; the same (3R/ε)^n bound follows. The unrestricted ε<1 version needs a separate check.

**Reason.** For n=3, (−2,1,1) has maximum 1 and is outside the claimed cube. The floor-simplex count repairs the actual quantitative route.

**Independent verdict:** confirmed. Confirmed directly: the zero-sum vector (−2,1,1), normalized by its maximum, lies outside the asserted cube. The simplex discretization repairs the ε≤1/10 range actually used; no larger ε range is asserted.

**Known correction:** new.

### E-DT2-2

**Source:** [Linear equations in variables which lie in a multiplicative group](https://arxiv.org/pdf/math/0409604v1), Author text §11, equation (11.19), printed p. 834.

**Printed claim.** The small-height step uses a coefficient exp(−(5n)^(3n)) although the stated perturbation hypothesis only gives n^−1 exp(−(4n)^(3n)).

**Correction.** Use AV2009 Theorem 6.1 and its larger allowed budget to prove the parent perturbation cover, checking both height and numerical comparisons; do not silently strengthen the original hypothesis.

**Reason.** For n≥2 the substituted coefficient is strictly smaller and does not follow from the hypothesis. Specializing z=1 avoids this particular step but would not prove the full perturbation target.

**Independent verdict:** confirmed. Confirmed in the read author text: the coefficient in (11.19) is smaller than the stated conic perturbation budget. The repaired AV large/small argument and both numerical comparisons now supply the parent target.

**Known correction:** new.

### E-DT2-3

**Source:** [An absolute version of Siegel’s lemma](https://gdz.sub.uni-goettingen.de/download/pdf/PPN243919689_0476/LOG_0004.pdf), Lemma 3.2(ii), printed p. 9.

**Printed claim.** The unweighted coefficient Euclidean norm on a symmetric power is treated as unitary-invariant.

**Correction.** Use the invariant symmetric tensor metric: vector coordinates have reciprocal multinomial weights, while coordinates in the dual basis have multinomial weights. Ordinary polynomial coefficients of a dual functional have reciprocal multinomial weights after the evaluation conversion. The corrected absolute-basis proof remains a separate gap.

**Reason.** A 45-degree rotation of x² gives coefficients (1/2,1,1/2), whose unweighted norm is sqrt(3/2), while the source vector has norm 1.

**Independent verdict:** confirmed. Confirmed by the original Lemma 3.2(ii) and the explicit 45-degree rotation. The replacement distinguishes dual-basis coordinates from polynomial coefficients. The full 1999 corrected-basis proof remains unread and is not inferred from the metric repair.

**Known correction:** Roy–Thunder, Addendum and erratum, J. reine angew. Math. 508 (1999), 47–51.

### E-DT2-4

**Source:** [On the zeros of linear recurrence sequences](https://www.impan.pl/shop/en/publication/transaction/download/product/83761), Proposition 2.5, published p. 392; proof introduction p. 393.

**Printed claim.** The class-modulus proposition is stated for independent evaluated values.

**Correction.** It concerns Q-dependent evaluated values of Q-independent forms.

**Reason.** Dependence makes the conjugate determinants vanish and supplies the relation used in the induction. For n=1 it means the one value equals zero. The original Schmidt 2000 proposition and AV p.394 use dependence.

**Independent verdict:** confirmed. Confirmed against the published Proposition 2.5 and Schmidt’s original proposition: the evaluated values must be dependent to make the conjugate determinants vanish.

**Known correction:** new.

### E-DT2-5

**Source:** [On the zeros of linear recurrence sequences](https://www.impan.pl/shop/en/publication/transaction/download/product/83761), Proposition 2.5(b), published p. 392; repeated in proofs pp.394–395.

**Printed claim.** The non-torsion alternative omits the progression modulus from h(alpha_i/alpha_j).

**Correction.** The conclusion is h(alpha_i^m/alpha_j^m)≥exp(−6T^4), after restricting indices modulo m.

**Reason.** Schmidt 2000 p.630 proves m h(beta)>the threshold using the generated group order m. It yields no such lower bound for h(beta) before taking the power.

**Independent verdict:** confirmed. Confirmed against Schmidt’s conclusion on p. 630: the estimate is for m h(β)=h(β^m). It does not give the same bound for h(β) before restricting to a progression class.

**Known correction:** new.

### E-DT2-6

**Source:** [Régularité et interpolation](https://webusers.imj-prg.fr/~marc.chardin/publications/textes/11.RI.pdf), Original relative regularity definition and local-cohomology comparison; author erratum entire page.

**Printed claim.** The original claims the reverse implication `(**)′` ⇒ `(*)′` from the local-cohomology condition to the universally quantified Koszul condition. The original Koszul definition already quantifies over all homogeneous parameter sequences.

**Correction.** Retain the universally quantified Koszul definition and the valid one-way implication to local cohomology. For Proposition 2, append homogeneous elements in the annihilator of M to obtain a parameter sequence for the ambient ring; the direct-summand comparison preserves the vanishing. Corollary 3 used by AV remains valid.

**Reason.** The erratum’s rational-quartic example disproves the reverse implication. Its Remark A repairs Proposition 2 by adjoining annihilator parameters and comparing Koszul homology direct summands, preserving Corollary 3.

**Independent verdict:** confirmed. Confirmed against both the original and the entire erratum: `(**)′` ⇒ `(*)′` is false. The original already quantifies over all parameter sequences. Remark A uses additional annihilator parameters to preserve Proposition 2 and Corollary 3.

**Known correction:** Chardin–Philippon erratum, J. Algebraic Geom. 11 (2002), 599–600.

### E-DT2-7

**Source:** [Linear equations in variables which lie in a multiplicative group](https://arxiv.org/pdf/math/0409604v1), Read author version §9, equation (9.6), p. 828.

**Printed claim.** The full absolute logarithmic error sum is bounded by h(α)/q even though Ψ is half that sum.

**Correction.** Bound the error by 2h(α)/q. Use q=8n instead of 4n, propagate the cone count (16n²+4)^r and check the final AV budget.

**Reason.** By the definition Ψ=(1/2)Σ|g_jv|, summing the error in every coordinate introduces the factor two. This affects the weighted-height estimate; the larger final budget absorbs the corrected cone count.

**Independent verdict:** confirmed. The definitions and the formula in the p. 828 page image show the missing factor two. The corrected exponent calculation is ≤−1/(2n), including equality when n=2.

**Known correction:** new.

### E-DT2-8

**Source:** [On the zeros of linear recurrence sequences](https://www.impan.pl/shop/en/publication/transaction/download/product/83761), Lemma 2.2 and proof, published p. 390.

**Printed claim.** The proper-subspace cover inside the relation hyperplane is asserted for q>1 under a weak height inequality, including q=2 and projective height zero.

**Correction.** Use q≥3 for the proper relative cover. For q=2 positive homogeneous projective group height admits no solution under the factor 1/16; height-zero solutions are covered by the whole relation hyperplane as an ambient proper subspace.

**Reason.** For q=2 take Γ generated by (−1,1), x=(−1,1), y=(1,1). Both projective heights are zero and z=x satisfies z₁+z₂=0. A proper subspace of the one-dimensional relation hyperplane contains no such nonzero point. The proof explicitly assumes n=q−1≥2.

**Independent verdict:** confirmed. The counterexample satisfies every weak binary premise in the printed lemma, while its conclusion is impossible. The corrected packet uses the source homogeneous height and separates the binary case.

**Known correction:** new.

## Read source versions

The AV2009 locators use the complete 36-page Basel author proof, dated 27 August 2009. The original planner’s HAL copy is retained as historical provenance in the packet, and is not claimed retrieved by this review. The 1999 Roy–Thunder full erratum remains an open input; its preview was recorded by the planner and was not independently retrieved.

- [A further improvement of the quantitative Subspace Theorem](https://annals.math.princeton.edu/wp-content/uploads/annals-v177-n2-p04-p.pdf). Jan-Hendrik Evertse and Roberto G. Ferretti. Annals of Mathematics 177 (2013), 513–590, published version. All pp. 513–590; quantitative theorem and proof inputs §§5–18. Independent review: Relevant stated read scope independently checked against the retrieved primary text; formula images checked where extraction was ambiguous.
- [A quantitative version of the Absolute Subspace Theorem](https://pub.math.leidenuniv.nl/~evertsejh/00-abssub.pdf). Jan-Hendrik Evertse and Hans Peter Schlickewei. Author preprint 00-abssub.pdf; J. reine angew. Math. 548 (2002), 21–127. Preprint pp. 1–9, §§1–3 normalization and theorem conventions; pp. 25–45, §§6–9, scalar rescaling, absolute Minkowski and Davenport arguments. Independent review: Relevant stated read scope independently checked against the retrieved primary text; formula images checked where extraction was ambiguous.
- [An explicit version of Faltings’ Product Theorem and an improvement of Roth’s lemma](https://pub.math.leidenuniv.nl/~evertsejh/95-product.pdf). Jan-Hendrik Evertse. Author preprint 95-product.pdf; Acta Arith. 73 (1995), 215–248. All 34 preprint pages; statements, geometric multiplicity argument, arithmetic cuts, sharp Roth proof. Independent review: Relevant stated read scope independently checked against the retrieved primary text; formula images checked where extraction was ambiguous.
- [An improvement of the quantitative Subspace Theorem](https://pub.math.leidenuniv.nl/~evertsejh/95-subspace.pdf). Jan-Hendrik Evertse. Author preprint 95-subspace.pdf; Compositio Math. 101 (1996), 225–311. Preprint pp. 64–70, Lemmas 23–26 and the beginning of Lemma 27. Independent review: Relevant stated read scope independently checked against the retrieved primary text; formula images checked where extraction was ambiguous.
- [The number of solutions of decomposable form equations](https://pub.math.leidenuniv.nl/~evertsejh/95-decforms.pdf). Jan-Hendrik Evertse. Author preprint 95-decforms.pdf; Invent. Math. 122 (1995), 559–601. All 47 preprint pages; unit patterns, admissible algebras and norm-form consequences. Independent review: Relevant stated read scope independently checked against the retrieved primary text; formula images checked where extraction was ambiguous.
- [Linear equations in variables which lie in a multiplicative group](https://arxiv.org/pdf/math/0409604v1). Jan-Hendrik Evertse, Hans Peter Schlickewei and Wolfgang M. Schmidt. arXiv math/0409604v1 author text; published Annals of Mathematics 155 (2002), 807–836. All 30 author-text pages, including §§4–12; the numerical finding is scoped to this author version. Independent review: Relevant stated read scope independently checked against the retrieved primary text; formula images checked where extraction was ambiguous.
- [An absolute version of Siegel’s lemma](https://gdz.sub.uni-goettingen.de/download/pdf/PPN243919689_0476/LOG_0004.pdf). Damien Roy and Jeffrey L. Thunder. J. reine angew. Math. 476 (1996), 1–26, GDZ scan. All printed pp. 1–26, OCR checked against the scan where formulas matter. Independent review: Relevant stated read scope independently checked against the retrieved primary text; formula images checked where extraction was ambiguous.
- [On Siegel’s lemma](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0073/LOG_0008.pdf). Enrico Bombieri and Jeffrey D. Vaaler. Invent. Math. 73 (1983), 11–32, GDZ scan. All printed pp. 11–32, including Theorem 9 and its kernel-lattice proof. Independent review: Relevant stated read scope independently checked against the retrieved primary text; formula images checked where extraction was ambiguous.
- [Lecture notes on Diophantine geometry](https://ziyangjeremygao.github.io/LectureNotes/DiophantineGeometry.pdf). Ziyang Gao. Public author lecture notes, accessed 2026-10-13. Physical pp. 61–64, printed pp. 37–40, §2.3 on linear-subspace heights. Independent review: Relevant stated read scope independently checked against the retrieved primary text; formula images checked where extraction was ambiguous.
- [Small points on subvarieties of a torus](https://edoc.unibas.ch/server/api/core/bitstreams/c591a881-406c-49dd-ad51-24bfb5b80bb9/content). Francesco Amoroso and Evelina Viada. Duke Mathematical Journal author proof, dated 27 August 2009, 36 pages, University of Basel repository copy. All 36 numbered proof pages; §3 Hilbert and determinant estimates, §§4–5 cuts and degree budget, §6 perturbation applications. Locators in this reviewed packet refer to this version. Independent review: Relevant stated read scope independently checked against the retrieved primary text; formula images checked where extraction was ambiguous.
- [On the zeros of linear recurrence sequences](https://www.impan.pl/shop/en/publication/transaction/download/product/83761). Francesco Amoroso and Evelina Viada. Acta Arith. 147 (2011), 387–396, published IMPAN PDF. All pp. 387–396, especially Lemmas 2.2–2.4, Proposition 2.5 and both inductive counts. Independent review: Relevant stated read scope independently checked against the retrieved primary text; formula images checked where extraction was ambiguous.
- [The zero multiplicity of linear recurrence sequences](https://archive.ymsc.tsinghua.edu.cn/pacm_download/117/6578-11511_2006_Article_BF02392575.pdf). Wolfgang M. Schmidt. Acta Math. 182 (1999), 243–282, public archive scan. All printed pp. 243–282, including the homogeneous denominator appendix; PDF extraction has internal form-feed characters and locators therefore use printed pages. Independent review: Relevant stated read scope independently checked against the retrieved primary text; formula images checked where extraction was ambiguous.
- [Zeros of linear recurrence sequences](https://publi.math.unideb.hu/paper/608/download/10_5486_PMD_2000_2336.pdf). Wolfgang M. Schmidt. Publ. Math. Debrecen 56 (2000), 609–630, published journal PDF. All pp. 609–630, including the original corrected dependence and powered-height proposition and its proof. Independent review: Relevant stated read scope independently checked against the retrieved primary text; formula images checked where extraction was ambiguous.
- [Régularité et interpolation](https://webusers.imj-prg.fr/~marc.chardin/publications/textes/11.RI.pdf). Marc Chardin and Patrice Philippon. Author preprint; J. Algebraic Geom. 8 (1999), 471–481. All 9 author-preprint pages, including Corollary 3 and its proof. Independent review: Relevant stated read scope independently checked against the retrieved primary text; formula images checked where extraction was ambiguous.
- [Erratum to Régularité et interpolation](https://webusers.imj-prg.fr/~marc.chardin/publications/textes/11.Err.pdf). Marc Chardin and Patrice Philippon. Author erratum; J. Algebraic Geom. 11 (2002), 599–600. Entire one-page author erratum; corrected relative regularity and the validity of Corollary 3. Independent review: Relevant stated read scope independently checked against the retrieved primary text; formula images checked where extraction was ambiguous.
- [A geometric inequality with applications to linear forms](https://msp.org/pjm/1979/83-2/pjm-v83-n2-p24-s.pdf). Jeffrey D. Vaaler. Pacific J. Math. 83 (1979), 543–553, published MSP PDF. All pp. 543–553; Theorem 1 ball-product sections and its peakedness proof. The conjectural general-convex-body extension is not used. Independent review: Relevant stated read scope independently checked against the retrieved primary text; formula images checked where extraction was ambiguous.
- [An effective lower bound for the height of algebraic numbers](https://matwbn.icm.edu.pl/ksiazki/aa/aa74/aa7417.pdf). Paul Voutier. Acta Arith. 74 (1996), 81–95, published journal archive PDF. All pp. 81–95; the full determinant proof and its explicitly quoted external inputs. Independent review: Relevant stated read scope independently checked against the retrieved primary text; formula images checked where extraction was ambiguous.
- [Addendum and erratum to An absolute version of Siegel’s lemma](https://doi.org/10.1515/crll.1999.508.47). Damien Roy and Jeffrey L. Thunder. J. reine angew. Math. 508 (1999), 47–51; only publisher preview p. 47 read. Publisher preview p. 47 only, no full proof retrieved. Independent review: The original 1996 metric assertion and an explicit rotation counterexample were independently checked. The planner’s preview was not independently retrieved; no proof on pp. 48–51 is claimed read, and the corrected-basis gap remains.

The packet contains retrieval dates and hashes where a complete public text was retrieved. No source files or source passages are included in the repository.
