# Coleman power series, local units, and cyclotomic-unit quotients

This roadmap connects actual norm-compatible local units with norm-fixed power
series, then with bounded measures and the local cyclotomic-unit quotient. It
builds on the local-field and profinite-group roadmaps and on the bounded
Iwasawa-algebra interfaces. It does not rebuild global cyclotomic-unit subgroups
or turn the local quotient into the Galois main conjecture.

## Conventions and extent

The arithmetic prime p is odd unless a separate dyadic statement is proved.
The field index is n≥1, with K_n=ℚ_p(μ_(p^n)); write G=Gal(ℚ(μ_(p^∞))/ℚ),
Γ for its pro-p factor, and G⁺=G/{±1}. These are different groups.
The source sometimes calls the full group Γ; translate that notation explicitly.

For the L2 algebraic section below, R is any commutative ring, B=R[[T]],
Y=1+T and D is the existing formal derivative. No prime or topology is needed
for those declarations. Write Δ(f)=Y D(f)f⁻¹ for f∈Bˣ. Inverses here are
inverses of actual units; T is not a unit. Additive torsion-freeness, not just
a characteristic-zero label, is required by the kernel theorem. For example,
ℤ×ℤ/3ℤ has characteristic zero but has additive torsion.

The L1 algebra below instead takes B=ℤ_p[[T]] and every prime p, including 2.
The scalar action of B on B is through φ(f)=f(Y^p−1); the norm has the sign
(−1)^(p−1) on Y and T. This wider algebraic statement does not extend the
arithmetic interpolation or quotient theorems to p=2.

The packet has **40 local nodes**: two definitions, six constructions, 27 lemmas,
three theorems and two comparisons. The 25 L1 nodes extend the 15 retained L2
nodes. All remain implementation-unchecked; no layer is closed. In particular,
the comparison with the smoothed series F has a concrete denominator-cleared
hypothesis and does not construct a Coleman measure.

The named Lean signatures use `TauCetiRoadmap.Campaign.ColemanPowerSeries`;
names below are relative to it. All 41 API items, 29 definition/construction
tests, five comparison tests and two additional boundary controls have typed
signatures/examples. The three finite-algebra adapter signatures select existing baseline
constructions; all mathematical proofs and new data are placeholders. The suggested file is a specification, not a formalization.

## Ownership and baseline

The accepted RS-16 assignment is retained. PMIA abbreviates
`PadicMeasuresIwasawaAlgebras`.

| Interface | Owner | Coleman responsibility |
| --- | --- | --- |
| Finite local extensions, units, ramification, unramified Frobenius | LocalFieldsRamification L0–L3 | Construct the particular cyclotomic tower and norm-compatible structures |
| ℤ_p-module structure on abelian pro-p groups | ProfiniteProPGroups L4 | Prove that the principal-unit limit meets the hypotheses |
| Completed action | PMIA L1 | Verify its continuity and module hypotheses |
| Bounded ∂, φ, ψ, restriction, inverse derivative | PMIA L2 | Δ, finite-free norm/trace comparison, and the Coleman composite |
| Weierstrass adapter | PMIA L4, using pinned Mathlib preparation | Interpolation uniqueness and approximation |
| Compact exactness and tensor comparison | PMIA L5 | Prove the arithmetic sequence and its topology |
| Integral denominator q_a, smoothed F_a and normalized ζ_p | DirichletPadicLFunctions L1 | Import the exact denominator/basic-law nodes, prove the finite-sum comparison and Δ comparison, and retain the raw minus sign |
| Global cyclotomic groups and finite index | IntegralIwasawaTheory L0 | Local closure, compatible generator, inverse limit and local quotient |

The reviewed AUDIT-24 entries for all five stages guide this boundary. Norm
transitivity and the ℤ_p Amice equivalence already exist; neither is a new
declaration here. The algebraic nodes directly use the pinned power-series
carrier, derivative, coefficient map, substitution homomorphism, inverse/unit
criterion and multiplication-by-T injectivity, together with exact Dirichlet L1 denominator nodes. In particular the kernel proof
uses `PowerSeries.derivative.ext` with its actual
`IsAddTorsionFree` hypothesis.

The pins are Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. The packet lists 41 statement-read
baseline declarations, including the existing determinant norm, trace, finite-basis
and p-adic compactness APIs. No Tau Ceti result is reintroduced under a private
carrier. The search found analytic logarithmic derivatives but no formal
power-series unit Δ at these pins.

## L0. Towers and genuine modules

Construct K_n, its integers and residue fields from the existing local-field
interface. Choose compatible primitive roots and prove the cyclotomic
Eisenstein and relative norm facts; do not insert degree or ramification as
unconstrained fields of a structure. The inverse-limit elements are compatible
families of genuine units, with the norm transition maps.

The principal-unit tower is a closed compact abelian pro-p group. Only after
proving this may one apply the generic ℤ_p-module construction. The full group
has prime-to-p torsion and must not be called a ℤ_p-module. The finite-level
Teichmüller splitting must commute with the norms before passing to the limit:
for an element of μ_(p−1), the relative degree-p norm is its p-th power, hence
the element itself. This is an arithmetic compatibility to prove, not a
consequence of an abstract product decomposition alone. Identify the Tate
module with its actual compatible-root subgroup.

The unramified/semilocal coefficient version includes the coefficient
Frobenius and norm data. Ramified coefficients require their own sourced
statement. All these construction and topology nodes remain to be decomposed;
the L0 continuation record enumerates the precise tasks.

**Acceptance.** Field degrees and ramification agree with the local-field
supplier, norm maps compose, compatible roots give the specified Tate module,
and the torsion/principal splitting is continuous and norm-compatible.

## L1. The Coleman norm operator

Take B=ℤ_p[[T]], Y=1+T and φ(f)=f(Y^p−1), without any coefficient
Frobenius. The source and target of φ have the same carrier but different
roles: the source ring acts on the target by a·x=φ(a)x. The ordinary
self-module has rank one and cannot be used for these constructions.
The Lean prototype passes this scalar structure explicitly to the basis,
its coordinate map, the multiplication matrix, norm and trace.

The coordinate proof does not assume finite freeness. Modulo p, split
coefficients into the p residue classes of their degrees. Changing the
polynomial factors T^j to Y^i uses a unitriangular binomial matrix. This
gives unique residue coordinates. Lift the residual coefficients and divide
by p repeatedly to solve to every finite p-adic precision. Uniqueness modulo
all p powers follows from the same residue calculation and cancellation.
For existence, use nested nonempty closed solution sets in the compact
product of p copies of B with the p-adic coefficient topology. Their
intersection supplies one exact coordinate tuple; no unjustified choice of
compatible finite-level solutions is used.

The matrix formula below fixes rows as output coordinates and columns as
input basis vectors. In the base ring, write Y_base=1+T. Multiplication by Y
is the cyclic shift, with final-column entry Y_base in row zero. At p=2 its
matrix is [[0,Y_base],[1,0]], so its determinant is −Y_base. Subtracting the
identity gives the matrix for T and determinant −T at p=2; at odd p both
signs are positive. Trace is p times coordinate zero. A normalized trace
therefore exists integrally and uniquely, but the bounded ψ operator and its
comparison remain owned by PMIA L2.

The stable node prefix for this tranche is `ColemanPowerSeries:L1/`.
Each declaration below uses the explicit B, Y, φ and prime-p convention above.
The statements extracted from the norm passage include auxiliary coordinate
lemmas supplied here to justify its finite-free input; the source does not
state every helper separately.

### Frobenius scalar algebra

**Node:** `ColemanPowerSeries:L1/frobenius-scalar-algebra`. **Declaration:** `phiScalarAlgebra`. **Kind:** construction.

Equip the existing ring B with its B-algebra structure through φ. Explicitly a·x=φ(a)x and the structural ring map is φ. The source copy of B is the coefficient ring for this algebra; its ordinary self-module structure is a different structure.

**Hypotheses.** p is a prime, including p=2 for this algebraic part. B=ℤ_p[[T]], Y=1+T, and φ(f)=f(Y^p−1), using the existing formal substitution homomorphism. The coefficientwise topology uses the usual p-adic topology on ℤ_p. No coefficient Frobenius is applied.

**Proof outline.**

1. The constant coefficient of Y^p−1 is zero, so the pinned HasSubst criterion applies.
2. Apply RingHom.toAlgebra to the existing substitution homomorphism. This packages the scalar action only; it does not define another bounded Frobenius operator.
3. Use explicit instance arguments for the basis, norm and trace. Installing an implicit self-algebra instance can select the identity homomorphism and is not an acceptable prototype.

**Prerequisites.** `mathlib:PowerSeries.substAlgHom`, `mathlib:PowerSeries.HasSubst.of_constantCoeff_zero'`, `mathlib:RingHom.toAlgebra`.

**Uses.** ColemanPowerSeries:L1, RJW Lemma 10.8 and Coates–Sujatha Proposition 2.2.3: Supply the actual finite-free algebra, its computational coordinates and determinant/trace; interpolation consumes these maps after the still-required evaluation comparison.

**API.**

- `phiScalarAlgebra_map` (data): The structural map sends f to f(Y^p−1).
- `phiScalarAlgebra_smul` (characterisation): The induced scalar action is a·x=φ(a)x.
- `phiScalarAlgebra_constant` (compatibility): A scalar constant C(c) acts by ordinary multiplication by C(c).

**Unit tests.**

- `phiScalar_zero` (degenerate): At p=2 the zero scalar sends 1 to 0.
- `phiScalar_X_two` (computation): At p=2 the scalar T sends 1 to 2T+T².
- `phiScalar_not_self` (non-example): At p=2 the action of scalar T on 1 is not T; the coefficient of T is 2 instead of 1.

**Acceptance.** At p=2, T acting on 1 gives 2T+T².

**Source.** RJW-published, Lemma 10.8 and its proof, printed p.167 / PDF 68; finite-free algebra implicit in the degree-p assertion. The stated basis/coordinate calculation is the explicit proof of the finite-free input used here, or a determinant/trace consequence of it. The source does not state every helper separately. The dyadic signs follow from the displayed multiplication matrix, independently of the sources’ odd-prime arithmetic convention.

### Coordinates modulo p

**Node:** `ColemanPowerSeries:L1/residue-coordinate-uniqueness`. **Declaration:** `residueCoordinates_unique`. **Kind:** theorem.

For every h∈𝔽_p[[T]], there is a unique tuple (g_i)_(0≤i<p) of 𝔽_p[[T]] such that h=Σ_(i<p)(1+T)^i g_i(T^p).

**Hypotheses.** p is a prime, including p=2 for this algebraic part. B=ℤ_p[[T]], Y=1+T, and φ(f)=f(Y^p−1), using the existing formal substitution homomorphism. The coefficientwise topology uses the usual p-adic topology on ℤ_p. No coefficient Frobenius is applied.

**Proof outline.**

1. Group coefficient indices uniquely as pq+j with 0≤j<p. This writes h=Σ_j T^j h_j(T^p), where coefficient_q(h_j)=coefficient_(pq+j)(h). Use the pinned expand coefficient formula.
2. Change the finite basis T^j to (1+T)^i. The binomial matrix has entries choose(i,j), zeros for j>i and diagonal 1; its inverse is obtained by T^j=((1+T)−1)^j.
3. Existence is the finite binomial expansion on each coefficient block. Uniqueness follows by the inverse change and the disjoint residue supports. No division by p occurs.

**Prerequisites.** `mathlib:PowerSeries.expand`, `mathlib:PowerSeries.coeff_expand`.

**Acceptance.** At p=2, T=(1+T)−1 gives coordinates (−1,1); replacing Y^i by T^i would give (0,1).

**Source.** RJW-published, Lemma 10.8 and its proof, printed p.167 / PDF 68; finite-free algebra implicit in the degree-p assertion. The stated basis/coordinate calculation is the explicit proof of the finite-free input used here, or a determinant/trace consequence of it. The source does not state every helper separately. The dyadic signs follow from the displayed multiplication matrix, independently of the sources’ odd-prime arithmetic convention.

### Frobenius coordinate assembly

**Node:** `ColemanPowerSeries:L1/frobenius-coordinate-assembly`. **Declaration:** `phiAssemble`. **Kind:** construction.

Define the ℤ_p-linear map Ξ:B^p→B by Ξ(a)=Σ_(i<p)Y^i φ(a_i). This is a map between existing finite product modules; linearity here is over ℤ_p.

**Hypotheses.** p is a prime, including p=2 for this algebraic part. B=ℤ_p[[T]], Y=1+T, and φ(f)=f(Y^p−1), using the existing formal substitution homomorphism. The coefficientwise topology uses the usual p-adic topology on ℤ_p. No coefficient Frobenius is applied.

**Proof outline.**

1. Use the formula with the existing finite sum and substitution homomorphism.
2. Additivity and ℤ_p-linearity follow because substitution fixes constant series and distributes through finite sums.
3. Do not equip the target with the ordinary B-module when asserting B-linearity: the corresponding B-linear formulation uses the scalar algebra above.

**Prerequisites.** `ColemanPowerSeries:L1/frobenius-scalar-algebra`.

**Uses.** ColemanPowerSeries:L1, RJW Lemma 10.8 and Coates–Sujatha Proposition 2.2.3: Supply the actual finite-free algebra, its computational coordinates and determinant/trace; interpolation consumes these maps after the still-required evaluation comparison.

**API.**

- `phiAssemble_apply` (data): Ξ(a)=Σ_i Y^i φ(a_i).
- `phiAssemble_single` (simp): For i<p, Ξ of the tuple with a in coordinate i and zero elsewhere is Y^i φ(a).
- `phiAssemble_phi_mul` (compatibility): Ξ((a·v_i)_i)=φ(a)Ξ(v), where the input products are ordinary products in B.
- `phiAssemble_continuous` (structure): Ξ is continuous for the coefficientwise p-adic topologies; promoted to a lemma.

**Unit tests.**

- `phiAssemble_zero` (degenerate): At p=3 the zero tuple assembles to zero.
- `phiAssemble_Y_three` (computation): At p=3 the tuple (0,1,0) assembles to Y.
- `phiAssemble_not_ordinary` (non-example): At p=2 the tuple (T,0) assembles to 2T+T² and not T.

**Acceptance.** The tuple supported at coordinate zero with value T assembles to Y^p−1, not T.

**Source.** RJW-published, Lemma 10.8 and its proof, printed p.167 / PDF 68; finite-free algebra implicit in the degree-p assertion. The stated basis/coordinate calculation is the explicit proof of the finite-free input used here, or a determinant/trace consequence of it. The source does not state every helper separately. The dyadic signs follow from the displayed multiplication matrix, independently of the sources’ odd-prime arithmetic convention.

### Formula for coordinate assembly

**Node:** `ColemanPowerSeries:L1/frobenius-coordinate-formula`. **Declaration:** `phiAssemble_apply`. **Kind:** lemma.

For a∈B^p, Ξ(a)=Σ_(i<p)Y^i φ(a_i).

**Hypotheses.** p is a prime, including p=2 for this algebraic part. B=ℤ_p[[T]], Y=1+T, and φ(f)=f(Y^p−1), using the existing formal substitution homomorphism. The coefficientwise topology uses the usual p-adic topology on ℤ_p. No coefficient Frobenius is applied.

**Proof outline.**

1. Unfold the finite-sum constructor.

**Prerequisites.** `ColemanPowerSeries:L1/frobenius-coordinate-assembly`.

**Acceptance.** The coordinate zero contributes φ(a_0), not a_0.

**Source.** RJW-published, Lemma 10.8 and its proof, printed p.167 / PDF 68; finite-free algebra implicit in the degree-p assertion. The stated basis/coordinate calculation is the explicit proof of the finite-free input used here, or a determinant/trace consequence of it. The source does not state every helper separately. The dyadic signs follow from the displayed multiplication matrix, independently of the sources’ odd-prime arithmetic convention.

### Continuity of coordinate assembly

**Node:** `ColemanPowerSeries:L1/frobenius-coordinate-continuity`. **Declaration:** `phiAssemble_continuous`. **Kind:** lemma.

The map Ξ:B^p→B is continuous for the coefficientwise p-adic topology.

**Hypotheses.** p is a prime, including p=2 for this algebraic part. B=ℤ_p[[T]], Y=1+T, and φ(f)=f(Y^p−1), using the existing formal substitution homomorphism. The coefficientwise topology uses the usual p-adic topology on ℤ_p. No coefficient Frobenius is applied.

**Proof outline.**

1. Each coefficient of f(Y^p−1) is a finite sum of coefficients of f, since the substituted polynomial has zero constant coefficient.
2. The pinned substitution coefficient formula expresses that coefficient as a continuous polynomial in finitely many input coefficients.
3. Multiply by Y^i and sum over Fin p. Apply coefficientwise continuity for PowerSeries.

**Prerequisites.** `ColemanPowerSeries:L1/frobenius-coordinate-assembly`, `mathlib:PowerSeries.coeff_subst'`, `mathlib:PowerSeries.WithPiTopology.continuous_coeff`, `ColemanPowerSeries:L1/frobenius-coordinate-formula`.

**Acceptance.** Continuity uses the p-adic coefficient topology; no discrete coefficient topology is installed.

**Source.** RJW-published, Lemma 10.8 and its proof, printed p.167 / PDF 68; finite-free algebra implicit in the degree-p assertion. The stated basis/coordinate calculation is the explicit proof of the finite-free input used here, or a determinant/trace consequence of it. The source does not state every helper separately. The dyadic signs follow from the displayed multiplication matrix, independently of the sources’ odd-prime arithmetic convention.

### Lifting coordinates modulo p powers

**Node:** `ColemanPowerSeries:L1/frobenius-coordinate-congruence-lift`. **Declaration:** `phiAssemble_lift_mod`. **Kind:** lemma.

For every r≥0 and f∈B, there are a∈B^p and h∈B with f=Ξ(a)+p^r h.

**Hypotheses.** p is a prime, including p=2 for this algebraic part. B=ℤ_p[[T]], Y=1+T, and φ(f)=f(Y^p−1), using the existing formal substitution homomorphism. The coefficientwise topology uses the usual p-adic topology on ℤ_p. No coefficient Frobenius is applied.

**Proof outline.**

1. At r=0 choose a=0,h=f. For r=1 reduce f coefficientwise using PadicInt.toZMod, then apply residue-coordinate-uniqueness. Lift each coefficient using its residue representative.
2. Reduction of Y^p−1 is T^p by the binomial theorem in characteristic p. Coefficient-map/substitution compatibility therefore identifies the reduction of Ξ with the residue assembly.
3. The residual f−Ξ(a) has each coefficient in the kernel of toZMod, namely (p). Choose the divided coefficients to form h in B.
4. For the induction step write f=Ξ(a)+p^r h and h=Ξ(b)+p k. Replace a by a+p^r b; ℤ_p-linearity yields the new residual p^(r+1)k.

**Prerequisites.** `ColemanPowerSeries:L1/residue-coordinate-uniqueness`, `ColemanPowerSeries:L1/frobenius-coordinate-assembly`, `mathlib:PadicInt.toZMod`, `mathlib:PadicInt.ker_toZMod`, `mathlib:PadicInt.maximalIdeal_eq_span_p`, `mathlib:PowerSeries.map_subst`, `ColemanPowerSeries:L1/frobenius-coordinate-formula`.

**Acceptance.** The r=0 case is included; no p-adic limit is used for finite-level solvability.

**Source.** RJW-published, Lemma 10.8 and its proof, printed p.167 / PDF 68; finite-free algebra implicit in the degree-p assertion. The stated basis/coordinate calculation is the explicit proof of the finite-free input used here, or a determinant/trace consequence of it. The source does not state every helper separately. The dyadic signs follow from the displayed multiplication matrix, independently of the sources’ odd-prime arithmetic convention.

### Reflection of coordinate divisibility

**Node:** `ColemanPowerSeries:L1/frobenius-coordinate-congruence-reflection`. **Declaration:** `phiAssemble_dvd_iff`. **Kind:** lemma.

For a∈B^p and r≥0, p^r divides Ξ(a) in B if and only if p^r divides every a_i in B.

**Hypotheses.** p is a prime, including p=2 for this algebraic part. B=ℤ_p[[T]], Y=1+T, and φ(f)=f(Y^p−1), using the existing formal substitution homomorphism. The coefficientwise topology uses the usual p-adic topology on ℤ_p. No coefficient Frobenius is applied.

**Proof outline.**

1. For r=0 both sides hold. For r=1, reduce the equation modulo p and use uniqueness of the residue-coordinate expansion of zero. Each coefficient of every a_i is in (p), so coefficientwise division gives a_i=p b_i.
2. For r+1, the r=1 case gives a=p b and Ξ(a)=p Ξ(b). Cancel the nonzero p in the domain B to reduce divisibility to r; apply induction.
3. Conversely factor p^r out of all a_i and use ℤ_p-linearity.

**Prerequisites.** `ColemanPowerSeries:L1/residue-coordinate-uniqueness`, `ColemanPowerSeries:L1/frobenius-coordinate-assembly`, `mathlib:PadicInt.ker_toZMod`, `mathlib:PadicInt.maximalIdeal_eq_span_p`, `mathlib:PowerSeries.map_subst`, `ColemanPowerSeries:L1/frobenius-coordinate-formula`.

**Acceptance.** A nonzero residue in any one component cannot disappear by cancellation among the Y-basis terms.

**Source.** RJW-published, Lemma 10.8 and its proof, printed p.167 / PDF 68; finite-free algebra implicit in the degree-p assertion. The stated basis/coordinate calculation is the explicit proof of the finite-free input used here, or a determinant/trace consequence of it. The source does not state every helper separately. The dyadic signs follow from the displayed multiplication matrix, independently of the sources’ odd-prime arithmetic convention.

### Uniqueness of integral coordinates

**Node:** `ColemanPowerSeries:L1/frobenius-coordinate-injectivity`. **Declaration:** `phiAssemble_injective`. **Kind:** lemma.

The map Ξ is injective.

**Hypotheses.** p is a prime, including p=2 for this algebraic part. B=ℤ_p[[T]], Y=1+T, and φ(f)=f(Y^p−1), using the existing formal substitution homomorphism. The coefficientwise topology uses the usual p-adic topology on ℤ_p. No coefficient Frobenius is applied.

**Proof outline.**

1. If Ξ(a)=Ξ(b), linearity gives Ξ(a−b)=0.
2. Reflection of divisibility implies every coefficient of each a_i−b_i is divisible by every p^r. Apply ker_toZModPow and ext_of_toZModPow to make each coefficient zero.
3. Use PowerSeries and finite-function extensionality.

**Prerequisites.** `ColemanPowerSeries:L1/frobenius-coordinate-congruence-reflection`, `mathlib:PadicInt.ker_toZModPow`, `mathlib:PadicInt.ext_of_toZModPow`.

**Acceptance.** This is uniqueness of all p components, stronger than injectivity of φ alone.

**Source.** RJW-published, Lemma 10.8 and its proof, printed p.167 / PDF 68; finite-free algebra implicit in the degree-p assertion. The stated basis/coordinate calculation is the explicit proof of the finite-free input used here, or a determinant/trace consequence of it. The source does not state every helper separately. The dyadic signs follow from the displayed multiplication matrix, independently of the sources’ odd-prime arithmetic convention.

### Existence of integral coordinates

**Node:** `ColemanPowerSeries:L1/frobenius-coordinate-surjectivity`. **Declaration:** `phiAssemble_surjective`. **Kind:** theorem.

The map Ξ is surjective.

**Hypotheses.** p is a prime, including p=2 for this algebraic part. B=ℤ_p[[T]], Y=1+T, and φ(f)=f(Y^p−1), using the existing formal substitution homomorphism. The coefficientwise topology uses the usual p-adic topology on ℤ_p. No coefficient Frobenius is applied.

**Proof outline.**

1. For f fixed, let C_r={a∈B^p : p^r divides f−Ξ(a)}. The finite-level lifting lemma makes every C_r nonempty.
2. Each C_r is closed: it is the intersection over all coefficient indices of inverse images of the closed ideal p^rℤ_p under continuous coefficient maps. The ideal is compact as the image of compact ℤ_p under multiplication by p^r, hence closed in the Hausdorff coefficient ring.
3. The coefficientwise product B^p is compact by PadicInt.compactSpace and Pi.compactSpace. C_0 is the whole space and C_(r+1)⊆C_r.
4. Apply the pinned Cantor-intersection theorem. A point in every C_r gives f=Ξ(a), since every coefficient of the difference has zero reduction modulo all p^r.

**Prerequisites.** `ColemanPowerSeries:L1/frobenius-coordinate-congruence-lift`, `ColemanPowerSeries:L1/frobenius-coordinate-continuity`, `mathlib:PadicInt.compactSpace`, `mathlib:Pi.compactSpace`, `mathlib:IsCompact.nonempty_iInter_of_sequence_nonempty_isCompact_isClosed`, `mathlib:PadicInt.ker_toZModPow`, `mathlib:PadicInt.ext_of_toZModPow`.

**Acceptance.** The finite-level tuples are not presumed compatible; nested compact solution sets supply an exact tuple.

**Source.** RJW-published, Lemma 10.8 and its proof, printed p.167 / PDF 68; finite-free algebra implicit in the degree-p assertion. The stated basis/coordinate calculation is the explicit proof of the finite-free input used here, or a determinant/trace consequence of it. The source does not state every helper separately. The dyadic signs follow from the displayed multiplication matrix, independently of the sources’ odd-prime arithmetic convention.

### Frobenius power basis

**Node:** `ColemanPowerSeries:L1/frobenius-power-basis`. **Declaration:** `phiBasis`. **Kind:** construction.

Construct the basis (1,Y,…,Y^(p−1)) of B over B with scalar algebra φ. Equivalently every f has a unique expansion Σ_i Y^i φ(a_i). Its rank is exactly p.

**Hypotheses.** p is a prime, including p=2 for this algebraic part. B=ℤ_p[[T]], Y=1+T, and φ(f)=f(Y^p−1), using the existing formal substitution homomorphism. The coefficientwise topology uses the usual p-adic topology on ℤ_p. No coefficient Frobenius is applied.

**Proof outline.**

1. The assembly injectivity says the p specified vectors are linearly independent for the φ scalar action.
2. Surjectivity says they span. Apply the existing Basis.mk construction, converting the finite coefficient function to Finsupp.
3. Use the actual scalar algebra argument explicitly, so this cannot elaborate as a basis of the ordinary rank-one self-module.

**Prerequisites.** `ColemanPowerSeries:L1/frobenius-scalar-algebra`, `ColemanPowerSeries:L1/frobenius-coordinate-injectivity`, `ColemanPowerSeries:L1/frobenius-coordinate-surjectivity`, `mathlib:Module.Basis.mk`, `ColemanPowerSeries:L1/frobenius-coordinate-formula`, `mathlib:Module.finrank_eq_card_basis`.

**Uses.** ColemanPowerSeries:L1, RJW Lemma 10.8 and Coates–Sujatha Proposition 2.2.3: Supply the actual finite-free algebra, its computational coordinates and determinant/trace; interpolation consumes these maps after the still-required evaluation comparison.

**API.**

- `phiBasis_apply` (data): The basis vector with index i<p is Y^i; promoted to a lemma.
- `phiBasis_repr_sum` (characterisation): For every f, f=Σ_i φ((phiBasis.repr f)_i)Y^i; promoted to a lemma.
- `phiBasis_repr_phi_mul` (compatibility): Coordinates of φ(a)f are a times the coordinates of f.
- `phiBasis_rank` (structure): The finrank of B with its explicitly chosen Frobenius module structure is p; finite freeness is already supplied by the actual finite basis.

**Unit tests.**

- `phiBasis_zero_two` (degenerate): At p=2 the zeroth basis vector is 1.
- `phiBasis_one_three` (computation): At p=3 the vector with index 1 is Y.
- `phiBasis_carry_two` (compatibility): At p=2, Y² has coordinates (Y,0), not (0,Y); this tests the structural map.

**Acceptance.** The scalar T multiplies Y^(p−1) to (Y^p−1)Y^(p−1), not T Y^(p−1) with an ordinary action.

**Source.** RJW-published, Lemma 10.8 and its proof, printed p.167 / PDF 68; finite-free algebra implicit in the degree-p assertion. The stated basis/coordinate calculation is the explicit proof of the finite-free input used here, or a determinant/trace consequence of it. The source does not state every helper separately. The dyadic signs follow from the displayed multiplication matrix, independently of the sources’ odd-prime arithmetic convention.

**Planet:** Frobenius power basis.

### Values of the Frobenius basis

**Node:** `ColemanPowerSeries:L1/frobenius-basis-values`. **Declaration:** `phiBasis_apply`. **Kind:** lemma.

For every i∈Fin p, the i-th vector of phiBasis is Y^i.

**Hypotheses.** p is a prime, including p=2 for this algebraic part. B=ℤ_p[[T]], Y=1+T, and φ(f)=f(Y^p−1), using the existing formal substitution homomorphism. The coefficientwise topology uses the usual p-adic topology on ℤ_p. No coefficient Frobenius is applied.

**Proof outline.**

1. Apply Basis.mk_apply to the family used by the basis constructor.

**Prerequisites.** `ColemanPowerSeries:L1/frobenius-power-basis`, `mathlib:Module.Basis.mk_apply`.

**Acceptance.** The index zero gives 1.

**Source.** RJW-published, Lemma 10.8 and its proof, printed p.167 / PDF 68; finite-free algebra implicit in the degree-p assertion. The stated basis/coordinate calculation is the explicit proof of the finite-free input used here, or a determinant/trace consequence of it. The source does not state every helper separately. The dyadic signs follow from the displayed multiplication matrix, independently of the sources’ odd-prime arithmetic convention.

### Coleman determinant norm

**Node:** `ColemanPowerSeries:L1/coleman-determinant-norm`. **Declaration:** `colemanNorm`. **Kind:** construction.

Define N:B→*B to be the existing Algebra.norm for B with its explicitly chosen Frobenius scalar algebra. The output belongs to the source copy of B, so no separately defined inverse of φ on a range subtype is required.

**Hypotheses.** p is a prime, including p=2 for this algebraic part. B=ℤ_p[[T]], Y=1+T, and φ(f)=f(Y^p−1), using the existing formal substitution homomorphism. The coefficientwise topology uses the usual p-adic topology on ℤ_p. No coefficient Frobenius is applied.

**Proof outline.**

1. Apply the pinned Algebra.norm to the exact Frobenius algebra. The basis theorem makes this the determinant of a genuine rank-p multiplication matrix.
2. Use norm_eq_matrix_det to expose its value in the Frobenius basis. The norm’s existing multiplicative structure gives the monoid homomorphism and its induced map on units.
3. The product over p-th roots of unity is a comparison to prove after completed coefficient extension; it is not used as an ill-typed definition over ℤ_p.

**Prerequisites.** `ColemanPowerSeries:L1/frobenius-power-basis`, `mathlib:Algebra.norm`, `mathlib:Algebra.norm_eq_matrix_det`.

**Uses.** ColemanPowerSeries:L1, RJW Lemma 10.8 and Coates–Sujatha Proposition 2.2.3: Supply the actual finite-free algebra, its computational coordinates and determinant/trace; interpolation consumes these maps after the still-required evaluation comparison.

**API.**

- `colemanNorm_def` (compatibility): N is Algebra.norm with the explicit Frobenius algebra structure.
- `colemanNorm_matrix` (characterisation): N(f)=det(leftMulMatrix(phiBasis,f)).
- `colemanNorm_one` (simp): N(1)=1.
- `colemanNorm_mul` (structure): N(fg)=N(f)N(g).
- `colemanNorm_phi` (relation): N(φ(a))=a^p; promoted to a lemma.
- `colemanNorm_constant` (simp): N(C(c))=C(c^p); promoted to a lemma.
- `colemanNorm_Y` (relation): N(Y)=(−1)^(p−1)Y; promoted to a lemma.

**Unit tests.**

- `colemanNorm_one_three` (degenerate): At p=3, N(1)=1.
- `colemanNorm_two_three` (computation): At p=3, N(2)=8, not 2.
- `colemanNorm_Y_two` (non-example): At p=2, N(Y)=−Y and N(Y)≠Y.
- `colemanNorm_X_three` (compatibility): At p=3, N(T)=T; this matches the source’s odd-prime normalization.

**Acceptance.** At p=2, N(Y)=−Y; at odd p, N(Y)=Y.

**Source.** RJW-published, Lemma 10.8 and its proof, printed p.167 / PDF 68; finite-free algebra implicit in the degree-p assertion. The stated basis/coordinate calculation is the explicit proof of the finite-free input used here, or a determinant/trace consequence of it. The source does not state every helper separately. The dyadic signs follow from the displayed multiplication matrix, independently of the sources’ odd-prime arithmetic convention.

**Planet:** Coleman norm.

### Integral Coleman trace

**Node:** `ColemanPowerSeries:L1/coleman-integral-trace`. **Declaration:** `colemanTrace`. **Kind:** construction.

Define τ:B→+B to be the existing Algebra.trace for the Frobenius scalar algebra, with its additive homomorphism retained. It satisfies τ(φ(a)f)=aτ(f). The codomain carries ordinary base-ring multiplication; it is not the Frobenius self-module.

**Hypotheses.** p is a prime, including p=2 for this algebraic part. B=ℤ_p[[T]], Y=1+T, and φ(f)=f(Y^p−1), using the existing formal substitution homomorphism. The coefficientwise topology uses the usual p-adic topology on ℤ_p. No coefficient Frobenius is applied.

**Proof outline.**

1. Apply the pinned trace definition with the explicit algebra argument and forget to its additive homomorphism for the standalone prototype.
2. Use the basis and trace_eq_matrix_trace for computations. Its B-linearity is stated as the explicit semilinear formula on ordinary series, which avoids confusing the two self-actions.
3. Divisibility by p is proved from the diagonal calculation; the operator is not defined by dividing an arbitrary series by p.

**Prerequisites.** `ColemanPowerSeries:L1/frobenius-power-basis`, `mathlib:Algebra.trace`, `mathlib:Algebra.trace_eq_matrix_trace`.

**Uses.** ColemanPowerSeries:L1, RJW Lemma 10.8 and Coates–Sujatha Proposition 2.2.3: Supply the actual finite-free algebra, its computational coordinates and determinant/trace; interpolation consumes these maps after the still-required evaluation comparison.

**API.**

- `colemanTrace_def` (compatibility): τ is Algebra.trace with the explicit Frobenius scalar algebra, viewed additively.
- `colemanTrace_add` (structure): τ(f+g)=τ(f)+τ(g).
- `colemanTrace_phi_mul` (compatibility): τ(φ(a)f)=aτ(f).
- `colemanTrace_coordinates` (characterisation): τ(f)=p times the zeroth Frobenius-basis coordinate of f; promoted to a lemma.
- `colemanTrace_divisible` (relation): For every f, there is a unique g∈B with τ(f)=pg; promoted to a lemma. The preceding coordinate formula identifies g without constructing another bounded ψ.

**Unit tests.**

- `colemanTrace_zero_three` (degenerate): At p=3, τ(0)=0.
- `colemanTrace_one_three` (computation): At p=3, τ(1)=3; omitting the rank factor gives the wrong answer.
- `colemanTrace_Y_three` (non-example): At p=3, τ(Y)=0, despite the constant coefficient of Y being 1.
- `colemanTrace_phi_three` (compatibility): At p=3, τ(Y³)=3Y, since Y³=φ(Y).

**Acceptance.** τ(1)=p whereas τ(Y)=0.

**Source.** RJW-published, Lemma 10.8 and its proof, printed p.167 / PDF 68; finite-free algebra implicit in the degree-p assertion. The stated basis/coordinate calculation is the explicit proof of the finite-free input used here, or a determinant/trace consequence of it. The source does not state every helper separately. The dyadic signs follow from the displayed multiplication matrix, independently of the sources’ odd-prime arithmetic convention.

**Planet:** Integral Coleman trace.

### Expansion in the Frobenius basis

**Node:** `ColemanPowerSeries:L1/frobenius-basis-expansion`. **Declaration:** `phiBasis_repr_sum`. **Kind:** lemma.

For every f∈B, f=Σ_(i<p)φ((phiBasis.repr f)_i)Y^i.

**Hypotheses.** p is a prime, including p=2 for this algebraic part. B=ℤ_p[[T]], Y=1+T, and φ(f)=f(Y^p−1), using the existing formal substitution homomorphism. The coefficientwise topology uses the usual p-adic topology on ℤ_p. No coefficient Frobenius is applied.

**Proof outline.**

1. Apply the existing basis reconstruction formula to f.
2. Replace the basis vectors by their value theorem and the scalar multiplication by φ(a)x.

**Prerequisites.** `ColemanPowerSeries:L1/frobenius-basis-values`, `ColemanPowerSeries:L1/frobenius-scalar-algebra`, `mathlib:Module.Basis.sum_repr`.

**Acceptance.** Coordinates are series in the base variable; coefficients pass through φ before multiplying the vectors.

**Source.** RJW-published, Lemma 10.8 and its proof, printed p.167 / PDF 68; finite-free algebra implicit in the degree-p assertion. The stated basis/coordinate calculation is the explicit proof of the finite-free input used here, or a determinant/trace consequence of it. The source does not state every helper separately. The dyadic signs follow from the displayed multiplication matrix, independently of the sources’ odd-prime arithmetic convention.

### Norm of a Frobenius scalar

**Node:** `ColemanPowerSeries:L1/coleman-norm-base-scalars`. **Declaration:** `colemanNorm_phi`. **Kind:** lemma.

For every a∈B, N(φ(a))=a^p.

**Hypotheses.** p is a prime, including p=2 for this algebraic part. B=ℤ_p[[T]], Y=1+T, and φ(f)=f(Y^p−1), using the existing formal substitution homomorphism. The coefficientwise topology uses the usual p-adic topology on ℤ_p. No coefficient Frobenius is applied.

**Proof outline.**

1. Apply norm_algebraMap_of_basis to the rank-p Frobenius basis.
2. Its structural map is φ and Fin p has cardinal p.

**Prerequisites.** `ColemanPowerSeries:L1/coleman-determinant-norm`, `mathlib:Algebra.norm_algebraMap_of_basis`.

**Acceptance.** For a=T, this gives N(Y^p−1)=T^p.

**Source.** RJW-published, Lemma 10.8 and its proof, printed p.167 / PDF 68; finite-free algebra implicit in the degree-p assertion. The stated basis/coordinate calculation is the explicit proof of the finite-free input used here, or a determinant/trace consequence of it. The source does not state every helper separately. The dyadic signs follow from the displayed multiplication matrix, independently of the sources’ odd-prime arithmetic convention.

### Norm-fixed power-series units

**Node:** `ColemanPowerSeries:L1/coleman-norm-fixed-units`. **Declaration:** `normFixedUnits`. **Kind:** definition.

Define the subgroup B_Nˣ={u∈Bˣ : N(u)=u}, using the existing Units carrier and the norm-induced unit homomorphism. Membership is equality of the underlying series.

**Hypotheses.** p is a prime, including p=2 for this algebraic part. B=ℤ_p[[T]], Y=1+T, and φ(f)=f(Y^p−1), using the existing formal substitution homomorphism. The coefficientwise topology uses the usual p-adic topology on ℤ_p. No coefficient Frobenius is applied.

**Proof outline.**

1. The norm is a monoid homomorphism, so 1 is fixed and the product of two fixed units is fixed.
2. For a fixed unit u, apply N to uu⁻¹=1 and cancel the fixed N(u)=u to see the inverse is fixed.
3. Use Subgroup on Bˣ. No unit tower, evaluation map or interpolation isomorphism is postulated.

**Prerequisites.** `ColemanPowerSeries:L1/coleman-determinant-norm`, `mathlib:Subgroup`.

**Uses.** RJW Proposition 10.10 and Theorem 10.13; ColemanPowerSeries:L3: The interpolation map has this exact domain; the logarithmic-derivative exact sequence in L3 restricts to it. Membership, subgroup extensionality and the constant-unit criterion are needed before identifying the kernel.

**API.**

- `mem_normFixedUnits` (characterisation): u∈B_Nˣ iff N(u)=u as underlying series.
- `normFixedUnits_mk` (constructor): A unit u with N(u)=u gives an element of the subgroup.
- `normFixedUnits_ext` (extensionality): Two subgroup elements are equal iff their underlying power series are equal.
- `normFixedUnits_constant` (characterisation): A constant unit c is norm-fixed iff c^(p−1)=1; promoted to a lemma.

**Unit tests.**

- `normFixedUnits_one_three` (degenerate): At p=3, 1 belongs to the subgroup.
- `normFixedUnits_Y_three` (computation): At p=3, a unit whose value is Y belongs to the subgroup.
- `normFixedUnits_Y_two` (non-example): At p=2, a unit whose value is Y does not belong to the subgroup.
- `normFixedUnits_constant_two_three` (non-example): At p=3 the constant unit 2 is not norm-fixed, since 8≠2 in ℤ_3.

**Acceptance.** The odd-prime unit with value Y is fixed, but its dyadic analogue is not.

**Source.** RJW-published, Lemma 10.8 and Proposition 10.10, printed p.167 / PDF68: multiplicativity and the norm-fixed unit domain. The stated basis/coordinate calculation is the explicit proof of the finite-free input used here, or a determinant/trace consequence of it. The source does not state every helper separately. The dyadic signs follow from the displayed multiplication matrix, independently of the sources’ odd-prime arithmetic convention.

**Planet:** Norm-fixed units.

### Matrix formula for the Coleman norm

**Node:** `ColemanPowerSeries:L1/coleman-norm-matrix`. **Declaration:** `colemanNorm_matrix`. **Kind:** lemma.

For every f∈B, N(f) is the determinant of the multiplication-by-f matrix in the Frobenius basis.

**Hypotheses.** p is a prime, including p=2 for this algebraic part. B=ℤ_p[[T]], Y=1+T, and φ(f)=f(Y^p−1), using the existing formal substitution homomorphism. The coefficientwise topology uses the usual p-adic topology on ℤ_p. No coefficient Frobenius is applied.

**Proof outline.**

1. Unfold the specialization of Algebra.norm and apply norm_eq_matrix_det to the explicit Frobenius basis.

**Prerequisites.** `ColemanPowerSeries:L1/coleman-determinant-norm`, `mathlib:Algebra.norm_eq_matrix_det`.

**Acceptance.** This formula uses the rank-p Frobenius module.

**Source.** RJW-published, Lemma 10.8 and its proof, printed p.167 / PDF 68; finite-free algebra implicit in the degree-p assertion. The stated basis/coordinate calculation is the explicit proof of the finite-free input used here, or a determinant/trace consequence of it. The source does not state every helper separately. The dyadic signs follow from the displayed multiplication matrix, independently of the sources’ odd-prime arithmetic convention.

### Multiplication matrix in Frobenius coordinates

**Node:** `ColemanPowerSeries:L1/frobenius-multiplication-matrix`. **Declaration:** `phiBasis_leftMulMatrix`. **Kind:** lemma.

Write c_k=(phiBasis.repr f)_k. In the Frobenius basis, the (i,j) entry of multiplication by f is Σ_(k<p, i≡k+j mod p) c_k Y^⌊(k+j)/p⌋, where the Y on the right is in the base ring. Since 0≤k,j<p, the exponent is zero or one.

**Hypotheses.** p is a prime, including p=2 for this algebraic part. B=ℤ_p[[T]], Y=1+T, and φ(f)=f(Y^p−1), using the existing formal substitution homomorphism. The coefficientwise topology uses the usual p-adic topology on ℤ_p. No coefficient Frobenius is applied.

**Proof outline.**

1. Expand f with the basis-expansion node and multiply by the j-th vector Y^j.
2. For each k, write k+j=pq+r. The identity Y^p=φ(Y) rewrites Y^(k+j) as φ(Y^q)Y^r.
3. Uniqueness of basis coordinates gives the entry formula. Cite the pinned leftMulMatrix definition; rows are output coordinates and columns are input vectors.

**Prerequisites.** `ColemanPowerSeries:L1/frobenius-basis-expansion`, `mathlib:Algebra.leftMulMatrix`.

**Acceptance.** At p=2, multiplication by Y is the matrix [[0,Y],[1,0]], not its transpose.

**Source.** RJW-published, Lemma 10.8 and its proof, printed p.167 / PDF 68; finite-free algebra implicit in the degree-p assertion. The stated basis/coordinate calculation is the explicit proof of the finite-free input used here, or a determinant/trace consequence of it. The source does not state every helper separately. The dyadic signs follow from the displayed multiplication matrix, independently of the sources’ odd-prime arithmetic convention.

### Norm of a constant

**Node:** `ColemanPowerSeries:L1/coleman-norm-constants`. **Declaration:** `colemanNorm_constant`. **Kind:** lemma.

For every c∈ℤ_p, N(C(c))=C(c^p).

**Hypotheses.** p is a prime, including p=2 for this algebraic part. B=ℤ_p[[T]], Y=1+T, and φ(f)=f(Y^p−1), using the existing formal substitution homomorphism. The coefficientwise topology uses the usual p-adic topology on ℤ_p. No coefficient Frobenius is applied.

**Proof outline.**

1. Substitution fixes constant series. Apply the base-scalar norm formula to C(c).

**Prerequisites.** `ColemanPowerSeries:L1/coleman-norm-base-scalars`.

**Acceptance.** At p=3, the norm of the constant 2 is 8, so the norm is not an additive ring endomorphism.

**Source.** RJW-published, Lemma 10.8 and its proof, printed p.167 / PDF 68; finite-free algebra implicit in the degree-p assertion. The stated basis/coordinate calculation is the explicit proof of the finite-free input used here, or a determinant/trace consequence of it. The source does not state every helper separately. The dyadic signs follow from the displayed multiplication matrix, independently of the sources’ odd-prime arithmetic convention.

### Membership in norm-fixed units

**Node:** `ColemanPowerSeries:L1/coleman-norm-fixed-membership`. **Declaration:** `mem_normFixedUnits`. **Kind:** lemma.

For a power-series unit u, u∈B_Nˣ if and only if N(u)=u as underlying series.

**Hypotheses.** p is a prime, including p=2 for this algebraic part. B=ℤ_p[[T]], Y=1+T, and φ(f)=f(Y^p−1), using the existing formal substitution homomorphism. The coefficientwise topology uses the usual p-adic topology on ℤ_p. No coefficient Frobenius is applied.

**Proof outline.**

1. Unfold the subgroup constructor; equality of units is equivalent to equality of their underlying series.

**Prerequisites.** `ColemanPowerSeries:L1/coleman-norm-fixed-units`.

**Acceptance.** The norm is evaluated on the underlying series, with no implicit arithmetic interpolation map.

**Source.** RJW-published, Proposition 10.10, printed p.167 / PDF68: norm-fixed unit domain. The stated basis/coordinate calculation is the explicit proof of the finite-free input used here, or a determinant/trace consequence of it. The source does not state every helper separately. The dyadic signs follow from the displayed multiplication matrix, independently of the sources’ odd-prime arithmetic convention.

### Norm of one plus the variable

**Node:** `ColemanPowerSeries:L1/coleman-norm-Y`. **Declaration:** `colemanNorm_Y`. **Kind:** lemma.

N(Y)=(−1)^(p−1)Y.

**Hypotheses.** p is a prime, including p=2 for this algebraic part. B=ℤ_p[[T]], Y=1+T, and φ(f)=f(Y^p−1), using the existing formal substitution homomorphism. The coefficientwise topology uses the usual p-adic topology on ℤ_p. No coefficient Frobenius is applied.

**Proof outline.**

1. The multiplication-matrix formula for f=Y is the cyclic shift: column j<p−1 has its only nonzero entry 1 in row j+1; the last column has Y in row 0.
2. In the determinant expansion there is exactly one nonzero permutation term, the p-cycle. Its sign is (−1)^(p−1).

**Prerequisites.** `ColemanPowerSeries:L1/coleman-determinant-norm`, `ColemanPowerSeries:L1/frobenius-multiplication-matrix`, `mathlib:Matrix.det_apply`, `ColemanPowerSeries:L1/coleman-norm-matrix`.

**Acceptance.** At p=2 the sign is negative; p odd makes it positive.

**Source.** RJW-published, Lemma 10.8 and its proof, printed p.167 / PDF 68; finite-free algebra implicit in the degree-p assertion. The stated basis/coordinate calculation is the explicit proof of the finite-free input used here, or a determinant/trace consequence of it. The source does not state every helper separately. The dyadic signs follow from the displayed multiplication matrix, independently of the sources’ odd-prime arithmetic convention.

### Norm of the variable

**Node:** `ColemanPowerSeries:L1/coleman-norm-variable`. **Declaration:** `colemanNorm_X`. **Kind:** lemma.

N(T)=(−1)^(p−1)T.

**Hypotheses.** p is a prime, including p=2 for this algebraic part. B=ℤ_p[[T]], Y=1+T, and φ(f)=f(Y^p−1), using the existing formal substitution homomorphism. The coefficientwise topology uses the usual p-adic topology on ℤ_p. No coefficient Frobenius is applied.

**Proof outline.**

1. Multiplication by T=Y−1 has the cyclic-shift matrix from the multiplication formula minus the identity.
2. A nonzero determinant term either uses every diagonal entry or every shift entry: choosing one shift forces the next at each column around the cycle. The two terms are (−1)^p and (−1)^(p−1)Y.
3. Their sum is (−1)^(p−1)(Y−1).

**Prerequisites.** `ColemanPowerSeries:L1/coleman-determinant-norm`, `ColemanPowerSeries:L1/frobenius-multiplication-matrix`, `mathlib:Matrix.det_apply`, `ColemanPowerSeries:L1/coleman-norm-matrix`.

**Acceptance.** The source’s N(T)=T is recovered for odd p; at p=2 it is −T.

**Source.** CS-2006, Lemma 2.2.5, printed p.17 / PDF27; odd-prime assumption at §1.1, p.1. The dyadic correction here is the direct determinant computation. The stated basis/coordinate calculation is the explicit proof of the finite-free input used here, or a determinant/trace consequence of it. The source does not state every helper separately. The dyadic signs follow from the displayed multiplication matrix, independently of the sources’ odd-prime arithmetic convention.

### Trace in Frobenius coordinates

**Node:** `ColemanPowerSeries:L1/coleman-trace-coordinates`. **Declaration:** `colemanTrace_coordinates`. **Kind:** lemma.

For f∈B, τ(f)=p·(phiBasis.repr f)_0.

**Hypotheses.** p is a prime, including p=2 for this algebraic part. B=ℤ_p[[T]], Y=1+T, and φ(f)=f(Y^p−1), using the existing formal substitution homomorphism. The coefficientwise topology uses the usual p-adic topology on ℤ_p. No coefficient Frobenius is applied.

**Proof outline.**

1. In the multiplication-matrix formula, a diagonal entry has i=j. The congruence k+j≡j mod p with 0≤k<p forces k=0.
2. For k=0 and j<p there is no wrap, so every diagonal entry is c_0. Sum the p diagonal entries using trace_eq_matrix_trace.

**Prerequisites.** `ColemanPowerSeries:L1/coleman-integral-trace`, `ColemanPowerSeries:L1/frobenius-multiplication-matrix`, `mathlib:Algebra.trace_eq_matrix_trace`.

**Acceptance.** If f=Y^i with 0<i<p, the trace is zero; f=1 gives p.

**Source.** RJW-published, Lemma 10.8 and its proof, printed p.167 / PDF 68; finite-free algebra implicit in the degree-p assertion. The stated basis/coordinate calculation is the explicit proof of the finite-free input used here, or a determinant/trace consequence of it. The source does not state every helper separately. The dyadic signs follow from the displayed multiplication matrix, independently of the sources’ odd-prime arithmetic convention.

### Norm-fixed constant units

**Node:** `ColemanPowerSeries:L1/coleman-fixed-constant-units`. **Declaration:** `normFixedUnits_constant`. **Kind:** lemma.

For c∈ℤ_pˣ, the constant unit C(c) is norm-fixed iff c^(p−1)=1.

**Hypotheses.** p is a prime, including p=2 for this algebraic part. B=ℤ_p[[T]], Y=1+T, and φ(f)=f(Y^p−1), using the existing formal substitution homomorphism. The coefficientwise topology uses the usual p-adic topology on ℤ_p. No coefficient Frobenius is applied.

**Proof outline.**

1. The norm-of-constants formula reduces fixedness to c^p=c in the unit group.
2. Since p≥2 and c is invertible, cancel c to obtain c^(p−1)=1; multiply by c for the converse.

**Prerequisites.** `ColemanPowerSeries:L1/coleman-norm-fixed-units`, `ColemanPowerSeries:L1/coleman-norm-constants`, `ColemanPowerSeries:L1/coleman-norm-fixed-membership`.

**Acceptance.** At p=2 only the constant 1 is fixed; at odd p, −1 is fixed. This is not yet the full kernel of the Coleman map.

**Source.** RJW-published, Lemma 10.8 and Proposition 10.10, printed p.167 / PDF68: multiplicativity and the norm-fixed unit domain. The stated basis/coordinate calculation is the explicit proof of the finite-free input used here, or a determinant/trace consequence of it. The source does not state every helper separately. The dyadic signs follow from the displayed multiplication matrix, independently of the sources’ odd-prime arithmetic convention.

### Divisibility of the integral trace

**Node:** `ColemanPowerSeries:L1/coleman-trace-divisibility`. **Declaration:** `colemanTrace_divisible`. **Kind:** lemma.

For every f∈B there is a unique g∈B with τ(f)=pg. It equals the zeroth Frobenius coordinate by the preceding coordinate formula; in particular p divides τ(f).

**Hypotheses.** p is a prime, including p=2 for this algebraic part. B=ℤ_p[[T]], Y=1+T, and φ(f)=f(Y^p−1), using the existing formal substitution homomorphism. The coefficientwise topology uses the usual p-adic topology on ℤ_p. No coefficient Frobenius is applied.

**Proof outline.**

1. The coordinate formula provides g and the equality.
2. Uniqueness follows coefficientwise from cancellation of the nonzero p in ℤ_p, hence in its power-series ring.

**Prerequisites.** `ColemanPowerSeries:L1/coleman-trace-coordinates`.

**Acceptance.** The proof works integrally; p is not inverted in B.

**Source.** RJW-published, Lemma 10.8 and its proof, printed p.167 / PDF 68; finite-free algebra implicit in the degree-p assertion. The stated basis/coordinate calculation is the explicit proof of the finite-free input used here, or a determinant/trace consequence of it. The source does not state every helper separately. The dyadic signs follow from the displayed multiplication matrix, independently of the sources’ odd-prime arithmetic convention.

### Required interpolation and comparison work

The root-of-unity substitutions T↦ηY−1 require coefficients in
O_(ℚ_p(μ_p)) and the completed coefficient topology. Their constant term
is topologically nilpotent, not generally nilpotent, so the formal substitution
criterion used to define φ does not supply them. The product-over-roots formula
for the determinant norm, the analogous trace formula, their descent and the
norm/evaluation comparison remain to be proved. The current determinant
definition avoids treating these substitutions as ℤ_p[[T]] automorphisms.

All four congruences of RJW Lemma10.11 remain separate obligations. The
Coates–Sujatha norm/trace and first congruence proofs have been read, including
the extended coefficient ring that their notation suppresses. Reading a proof
is not a completed granular decomposition of the full interpolation theorem.

Interpolation requires finite-zero uniqueness for **nonzero** power series,
finite-level arithmetic lifts, norm iteration and compactness. The compact
coordinate argument above only proves the finite-free basis; it does not
supply the arithmetic interpolation map. The Iwasawa Weierstrass adapter is
imported from PMIA L4, with the nonzero hypothesis recorded in source finding
E10. Identify the actual norm-fixed subgroup with the whole norm-compatible
unit tower, prove surjectivity, and specify the unramified coefficient/Frobenius
variants. The original Coleman source still needs reading.

**Acceptance.** Recover U_∞≃B_Nˣ with its arithmetic and topological
properties, the evaluation/norm identities and all four congruences. None of
these remaining statements is asserted as a completed node in this tranche.

## L2. The Coleman map and its sign

### Algebraic declarations

The stable node prefix for the following declarations is
`ColemanPowerSeries:L2/`. Each proof uses only the listed node prerequisites,
the exact Dirichlet denominator nodes, the named pinned baseline, and elementary ring/unit manipulations. The
arithmetic and measure constructions are not hidden prerequisites of these
algebraic statements.

### One denominator owner

Write f_a for the imported `DirichletPadic.smoothingDenominator R a`, whose coefficient in degree n
is choose(a,n+1). Its owner is `DirichletPadicLFunctions:L1/smoothing-denominator`. The concurrently
submitted Dirichlet and Coleman checkpoints had described this same arithmetic object by binomial
coefficients and by a finite geometric sum. This correction makes those descriptions a comparison,
not two definitions.

The following basic laws are imported without local duplicate nodes:

| Law | Exact owner node |
| --- | --- |
| T f_a=(1+T)^a−1 | `DirichletPadicLFunctions:L1/denominator-factorization` |
| constant coefficient a | `DirichletPadicLFunctions:L1/denominator-constant` |
| unit a implies unit f_a | `DirichletPadicLFunctions:L1/denominator-unit` |
| coefficient-map compatibility | `DirichletPadicLFunctions:L1/denominator-coefficient-map` |

The old local factorization, constant, unit-criterion and coefficient-change node IDs are superseded
by these owner nodes. Every consuming edge is redirected. The retained local
`cyclotomic-series` ID now denotes only the finite-sum comparison. Its four tests remain;
they are comparison tests, not evidence for a second definition.

The suggested file uses local notation expanding the exact transparent binomial-coefficient body
of the imported proposed definition. This introduces no Lean declaration or alternate constructor.
The proposed supplier is not falsely imported as an existing compiled library module. On implementation,
replace that notation by the supplier's name and import its module. All mathematical prerequisites
already point to the supplier's exact blueprint nodes.

### Logarithmic derivative

Node `ColemanPowerSeries:L2/logarithmic-derivative`; declaration `logDeriv`.

For f∈Bˣ define Δ_R(f)=Y·D(f)·f⁻¹ in B. This is the weighted formal logarithmic derivative, not an analytic logarithm.

**Hypotheses.** R is a commutative ring. Put B=R[[T]], Y=1+T and D=PowerSeries.derivative R. Inverses of elements of Bˣ mean units' inverses, not inversion of T.

**Construction or proof.** Use the existing PowerSeries.derivative and the inverse already carried by the unit f. Multiply in B; no convergence or rational coefficients are required.

**Dependencies.** `mathlib:PowerSeries.derivative`

**Acceptance.** Δ(1+T)=1; omitting the factor Y would instead give Y⁻¹.

**Uses.** RJW §12.2.1, Theorem 12.9 and Lemma 12.10: Product, integer powers and chain rule control the norm-fixed logarithmic derivative; kernel constants are the first kernel calculation. ColemanPowerSeries:L2 and L3: The Coleman composite and its kernel use Δ, coefficient change and the twist factor. This checkpoint does not construct the full composite.

**API.**

- `logDeriv_def` — Δ(f)=Y D(f) f⁻¹, with the existing formal derivative and the unit's inverse.
- `logDeriv_one` — Δ(1)=0.
- `logDeriv_mul` — Δ(fg)=Δ(f)+Δ(g); promoted to the product node.
- `logDeriv_inv` — Δ(f⁻¹)=−Δ(f); promoted to the inverse node.
- `logDeriv_zpow` — Δ(fⁿ)=nΔ(f) for n∈ℤ; promoted to integer powers.
- `logDeriv_const` — Δ(C(c))=0 for c∈Rˣ.
- `logDeriv_eq_zero_iff` — With IsAddTorsionFree R, Δ(f)=0 precisely for constant f.
- `logDeriv_map` — Coefficient change commutes with Δ; identity and composition follow from the existing PowerSeries.map laws.
- `logDeriv_subst` — (1+g)Δ(f[g])=Y Dg (Δf)[g] whenever HasSubst g.
- `logDeriv_power_subst` — For natural m, Δ(f[Yᵐ−1])=m(Δf)[Yᵐ−1]; not full p-adic equivariance.

**Tests.**

- `logDeriv_identity` — Over ℚ, Δ(1)=0.
- `logDeriv_one_add_X` — Over ℚ, a unit with value 1+T has Δ=1; detects omission of the weight.
- `logDeriv_inverse_one_add_X` — Over ℚ, the inverse of that unit has Δ=−1; detects the inverse sign.
- `logDeriv_characteristic_three` — Over ℤ/3ℤ, the unit 1+T³ has Δ=0 but is not constant; forbids dropping the additive-torsion-free kernel hypothesis.

**Source.** Definition 12.8, printed p.180 / PDF 81; Proposition 12.1, pp.177–178, and Remark 12.4, p.179. The source gives the ℤ_p formula or argument; the stated arbitrary-commutative-ring algebraic form and the declaration-sized splitting are derived here. No claim that the source states this generality.

### Logarithmic derivative of a product

Node `ColemanPowerSeries:L2/logarithmic-derivative-product`; declaration `logDeriv_mul`.

For f,g∈Bˣ, Δ(fg)=Δ(f)+Δ(g).

**Hypotheses.** R is a commutative ring. Put B=R[[T]], Y=1+T and D=PowerSeries.derivative R. Inverses of elements of Bˣ mean units' inverses, not inversion of T.

**Construction or proof.** Apply Derivation.leibniz to D(fg). Use (fg)⁻¹=f⁻¹g⁻¹ and commutativity; distribute Y and cancel units.

**Dependencies.** `ColemanPowerSeries:L2/logarithmic-derivative`, `mathlib:Derivation.leibniz`

**Acceptance.** The target group is additive: the output is a sum, not a product.

**Source.** Definition 12.8, printed p.180 / PDF 81; Proposition 12.1, pp.177–178, and Remark 12.4, p.179. The source gives the ℤ_p formula or argument; the stated arbitrary-commutative-ring algebraic form and the declaration-sized splitting are derived here. No claim that the source states this generality.

### Logarithmic derivative of an inverse

Node `ColemanPowerSeries:L2/logarithmic-derivative-inverse`; declaration `logDeriv_inv`.

For f∈Bˣ, Δ(f⁻¹)=−Δ(f).

**Hypotheses.** R is a commutative ring. Put B=R[[T]], Y=1+T and D=PowerSeries.derivative R. Inverses of elements of Bˣ mean units' inverses, not inversion of T.

**Construction or proof.** Use PowerSeries.derivative_inv for the inverse of a unit. Multiply by Yf and cancel f; alternatively use the product lemma at ff⁻¹=1.

**Dependencies.** `ColemanPowerSeries:L2/logarithmic-derivative-product`, `mathlib:PowerSeries.derivative_inv`

**Acceptance.** For f=Y, the answer is −1.

**Source.** Definition 12.8, printed p.180 / PDF 81; Proposition 12.1, pp.177–178, and Remark 12.4, p.179. The source gives the ℤ_p formula or argument; the stated arbitrary-commutative-ring algebraic form and the declaration-sized splitting are derived here. No claim that the source states this generality.

### Integer powers

Node `ColemanPowerSeries:L2/logarithmic-derivative-integer-powers`; declaration `logDeriv_zpow`.

For f∈Bˣ and n∈ℤ, Δ(fⁿ)=n·Δ(f), where the right side is integer scalar multiplication on the additive group B.

**Hypotheses.** R is a commutative ring. Put B=R[[T]], Y=1+T and D=PowerSeries.derivative R. Inverses of elements of Bˣ mean units' inverses, not inversion of T.

**Construction or proof.** Induct on nonnegative n with the product lemma. For negative n use the inverse lemma and additive negation; no division by n.

**Dependencies.** `ColemanPowerSeries:L2/logarithmic-derivative-product`, `ColemanPowerSeries:L2/logarithmic-derivative-inverse`

**Acceptance.** n=0 gives zero and n=−1 gives the inverse formula.

**Source.** Definition 12.8, printed p.180 / PDF 81; Proposition 12.1, pp.177–178, and Remark 12.4, p.179. The source gives the ℤ_p formula or argument; the stated arbitrary-commutative-ring algebraic form and the declaration-sized splitting are derived here. No claim that the source states this generality.

### Constant units

Node `ColemanPowerSeries:L2/logarithmic-derivative-constants`; declaration `logDeriv_const`.

For c∈Rˣ, Δ(C(c))=0, where the constant unit is Units.map of PowerSeries.C.

**Hypotheses.** R is a commutative ring. Put B=R[[T]], Y=1+T and D=PowerSeries.derivative R. Inverses of elements of Bˣ mean units' inverses, not inversion of T.

**Construction or proof.** PowerSeries.derivative_C makes D(C(c))=0. Substitute in the definition of Δ.

**Dependencies.** `ColemanPowerSeries:L2/logarithmic-derivative`, `mathlib:PowerSeries.derivative_C`

**Acceptance.** All constant units, including −1, are killed; this does not assert they are norm-fixed.

**Source.** Definition 12.8, printed p.180 / PDF 81; Proposition 12.1, pp.177–178, and Remark 12.4, p.179. The source gives the ℤ_p formula or argument; the stated arbitrary-commutative-ring algebraic form and the declaration-sized splitting are derived here. No claim that the source states this generality.

### Kernel of the logarithmic derivative

Node `ColemanPowerSeries:L2/logarithmic-derivative-kernel`; declaration `logDeriv_eq_zero_iff`.

If the additive group of R is torsion-free, then Δ(f)=0 iff f=C(constantCoeff f), for every f∈Bˣ.

**Hypotheses.** R is a commutative ring. Put B=R[[T]], Y=1+T and D=PowerSeries.derivative R. Inverses of elements of Bˣ mean units' inverses, not inversion of T. IsAddTorsionFree R; mere characteristic zero is not substituted for this hypothesis in a ring with additive torsion.

**Construction or proof.** The constant coefficient of Y is 1, so Y is a unit by PowerSeries.isUnit_iff_constantCoeff. Cancel Y and f⁻¹ to deduce D(f)=0. PowerSeries.derivative.ext applied to f and its constant series proves equality; its additive-torsion-free assumption is explicit. The converse is the constant-unit calculation (or derivative_C).

**Dependencies.** `ColemanPowerSeries:L2/logarithmic-derivative-constants`, `mathlib:PowerSeries.derivative.ext`, `mathlib:PowerSeries.isUnit_iff_constantCoeff`

**Acceptance.** In characteristic 3, f=1+T³ is a nonconstant unit with Δ(f)=0; the omitted-hypothesis variant fails.

**Source.** Definition 12.8, printed p.180 / PDF 81; Proposition 12.1, pp.177–178, and Remark 12.4, p.179. The source gives the ℤ_p formula or argument; the stated arbitrary-commutative-ring algebraic form and the declaration-sized splitting are derived here. No claim that the source states this generality.

### Coefficient change

Node `ColemanPowerSeries:L2/logarithmic-derivative-coefficient-change`; declaration `logDeriv_map`.

For a commutative-ring homomorphism ρ:R→S, mapping the coefficients of Δ_R(f) gives Δ_S of the mapped unit.

**Hypotheses.** R is a commutative ring. Put B=R[[T]], Y=1+T and D=PowerSeries.derivative R. Inverses of elements of Bˣ mean units' inverses, not inversion of T. S is a commutative ring and ρ is a unital ring homomorphism; no injectivity or flatness is required.

**Construction or proof.** Compare coefficient n of D(map ρ f) and map ρ(Df), using coeff_derivative and that ρ preserves natural-number multiplication. The coefficient map preserves Y, products and the inverse of a unit. Apply the definition of Δ.

**Dependencies.** `ColemanPowerSeries:L2/logarithmic-derivative`, `mathlib:PowerSeries.map`, `mathlib:PowerSeries.coeff_derivative`

**Acceptance.** Reduction mod 3 commutes with Δ, but the torsion-free kernel theorem need not survive that reduction.

**Source.** Definition 12.8, printed p.180 / PDF 81; Proposition 12.1, pp.177–178, and Remark 12.4, p.179. The source gives the ℤ_p formula or argument; the stated arbitrary-commutative-ring algebraic form and the declaration-sized splitting are derived here. No claim that the source states this generality.

### Weighted chain rule

Node `ColemanPowerSeries:L2/logarithmic-derivative-substitution`; declaration `logDeriv_subst`.

For g∈B with nilpotent constant coefficient and f∈Bˣ, let f[g] be the unit mapped by the existing substitution homomorphism. Then (1+g)Δ(f[g])=Y·D(g)·(Δ(f))[g].

**Hypotheses.** R is a commutative ring. Put B=R[[T]], Y=1+T and D=PowerSeries.derivative R. Inverses of elements of Bˣ mean units' inverses, not inversion of T. PowerSeries.HasSubst g: the constant coefficient of g is nilpotent. This formal substitution condition does not cover ζ(1+T)−1 over ℤ_p[ζ].

**Construction or proof.** Use PowerSeries.derivative_subst and the substitution homomorphism's preservation of unit inverses. On substituting into Δ(f), the weight Y becomes 1+g. Multiply the two expressions out. No division by g or by 1+g is used.

**Dependencies.** `ColemanPowerSeries:L2/logarithmic-derivative`, `mathlib:PowerSeries.derivative_subst`, `mathlib:PowerSeries.substAlgHom`

**Acceptance.** g=T recovers the identity and g=0 makes the left side zero.

**Source.** Proposition 12.5, equation (12-2), printed p.179 / PDF 80; the cross-multiplied general chain rule is the algebraic calculation underlying it. The source gives the ℤ_p formula or argument; the stated arbitrary-commutative-ring algebraic form and the declaration-sized splitting are derived here. No claim that the source states this generality.

### Cyclotomic substitution

Node `ColemanPowerSeries:L2/logarithmic-derivative-natural-power-substitution`; declaration `logDeriv_power_subst`.

For m∈ℕ and g_m=Yᵐ−1, Δ(f[g_m])=m·(Δ(f))[g_m]. This is a natural-power identity, not a theorem about the full ℤ_pˣ-action.

**Hypotheses.** R is a commutative ring. Put B=R[[T]], Y=1+T and D=PowerSeries.derivative R. Inverses of elements of Bˣ mean units' inverses, not inversion of T.

**Construction or proof.** constantCoeff(g_m)=0, so HasSubst.of_constantCoeff_zero' supplies substitution. D(g_m)=mY^(m−1) for m>0 by derivative_pow and D(Y)=1. Use the weighted chain rule; cancel the unit Yᵐ. For m=0, substitution is constant evaluation and both sides are zero.

**Dependencies.** `ColemanPowerSeries:L2/logarithmic-derivative-substitution`, `mathlib:PowerSeries.derivative_pow`, `mathlib:PowerSeries.HasSubst.of_constantCoeff_zero'`, `mathlib:PowerSeries.isUnit_iff_constantCoeff`, `mathlib:PowerSeries.derivative_X`

**Acceptance.** m=0 and m=1 are required; m=p is the formal Frobenius chain factor p.

**Source.** Proposition 12.5, equation (12-2), printed p.179 / PDF 80; natural-exponent specialization. The source gives the ℤ_p formula or argument; the stated arbitrary-commutative-ring algebraic form and the declaration-sized splitting are derived here. No claim that the source states this generality.

### Cyclotomic finite-sum comparison

Node `ColemanPowerSeries:L2/cyclotomic-series`; declaration `cyclotomicSeries_def`.

Let f_a be the imported DirichletPadic.smoothingDenominator R a. For every a∈ℕ, f_a(T)=Σ_(0≤i<a)(1+T)ⁱ. This identifies RJW's local cyclotomic formula with the existing planned arithmetic denominator; it is not a second definition.

**Hypotheses.** R is a commutative ring. Put B=R[[T]], Y=1+T and D=PowerSeries.derivative R. Inverses of elements of Bˣ mean units' inverses, not inversion of T. Throughout, f_a is the imported DirichletPadicLFunctions:L1/smoothing-denominator, not a separately defined Coleman family.

**Construction or proof.** Multiply the proposed equality by T. The imported DirichletPadicLFunctions:L1/denominator-factorization identifies the left side with (1+T)^a−1. For the right side, induct on the finite sum (or telescope using T=(1+T)−1) to get the same polynomial. The base a=0 gives zero; the successor step adds T(1+T)^a. Cancel T with the baseline PowerSeries.X_mul_injective, valid even with zero divisors. The identification includes f_0=0 and f_1=1, and introduces no new carrier or inverse of T.

**Dependencies.** `DirichletPadicLFunctions:L1/smoothing-denominator`, `DirichletPadicLFunctions:L1/denominator-factorization`, `mathlib:PowerSeries.X_mul_injective`

**Acceptance.** f_3=3+3T+T², not (1+T)³−1 and not its logarithm.

**Uses.** RJW §10.2, Proposition 10.4: Identify the imported arithmetic smoothing denominator with RJW's local cyclotomic expression, so the unit lift and logarithmic derivative use the identical series. ColemanPowerSeries:L1 and L2: Arithmetic interpolation must identify this explicit series with the series of the genuine norm-compatible unit c(a); that arithmetic identification remains a gap.

**Tests.**

- `cyclotomicSeries_empty` — Over ℤ, f_0=0.
- `cyclotomicSeries_three` — Over ℤ, f_3=3+3T+T².
- `cyclotomicSeries_nonunit_at_three` — Over ℤ/3ℤ, f_3 is not a unit.
- `cyclotomicSeries_coefficient_reduction` — The existing coefficient map ℤ→ℤ/3ℤ sends f_3 to T².

**Source.** §10.2 between Lemma 10.3 and Proposition 10.4, printed p.165 / PDF 66. The polynomial claim is restricted to natural a; see E3. The source gives the ℤ_p formula or argument; the stated arbitrary-commutative-ring algebraic form and the declaration-sized splitting are derived here. No claim that the source states this generality. The shared series is imported from DirichletPadicLFunctions:L1; this node only proves its finite geometric-sum formula.

### Multiplication of parameters

Node `ColemanPowerSeries:L2/cyclotomic-series-parameter-product`; declaration `cyclotomicSeries_mul`.

For a,b∈ℕ, f_(ab)(T)=f_a(T)·f_b(Yᵃ−1).

**Hypotheses.** R is a commutative ring. Put B=R[[T]], Y=1+T and D=PowerSeries.derivative R. Inverses of elements of Bˣ mean units' inverses, not inversion of T. Throughout, f_a is the imported DirichletPadicLFunctions:L1/smoothing-denominator, not a separately defined Coleman family.

**Construction or proof.** The substituted argument has constant coefficient zero, so substitution is a ring homomorphism. Multiply by T and use T f_a=Yᵃ−1 and the substituted geometric factorization for f_b. Both sides multiplied by T become Y^(ab)−1. Cancel T by PowerSeries.X_mul_injective, valid without a domain assumption.

**Dependencies.** `DirichletPadicLFunctions:L1/denominator-factorization`, `mathlib:PowerSeries.substAlgHom`, `mathlib:PowerSeries.HasSubst.of_constantCoeff_zero'`, `mathlib:PowerSeries.X_mul_injective`

**Acceptance.** Either a=0 or b=0 gives zero; a=1 or b=1 gives f of the other parameter.

**Source.** §10.2 between Lemma 10.3 and Proposition 10.4, printed p.165 / PDF 66. The polynomial claim is restricted to natural a; see E3. The source gives the ℤ_p formula or argument; the stated arbitrary-commutative-ring algebraic form and the declaration-sized splitting are derived here. No claim that the source states this generality.

### Cyclotomic unit series

Node `ColemanPowerSeries:L2/cyclotomic-series-unit`; declaration `cyclotomicSeriesUnit`.

For a∈ℕ whose image in R is a unit, construct the unique element u_a∈Bˣ with value f_a. Its inverse is the formal inverse of f_a, never 1/T.

**Hypotheses.** R is a commutative ring. Put B=R[[T]], Y=1+T and D=PowerSeries.derivative R. Inverses of elements of Bˣ mean units' inverses, not inversion of T. ha: IsUnit(a in R). Throughout, f_a is the imported DirichletPadicLFunctions:L1/smoothing-denominator, not a separately defined Coleman family.

**Construction or proof.** The imported DirichletPadicLFunctions:L1/denominator-unit supplies IsUnit f_a from IsUnit a. Use the existing IsUnit.unit/Units carrier. Uniqueness follows from Units extensionality. For the unit API, coefficient-map compatibility imports denominator-coefficient-map and uses Units extensionality; constant/inverse tests import denominator-constant and the unit inverse laws. These basic denominator facts are not re-planned here.

**Dependencies.** `DirichletPadicLFunctions:L1/denominator-unit`, `DirichletPadicLFunctions:L1/denominator-coefficient-map`, `DirichletPadicLFunctions:L1/denominator-constant`

**Acceptance.** The inverse at a=3 over ℚ has constant coefficient 1/3.

**Uses.** RJW Proposition 10.4 and Definition 12.8: Δ is defined on actual units, so the explicit series requires the proven unit criterion. ColemanPowerSeries:L2: The sign computation uses the same series and its actual inverse, not a private abstract unit type.

**API.**

- `cyclotomicSeriesUnit_val` — The unit has underlying series f_a; promoted to the value node.
- `cyclotomicSeriesUnit_ext` — Every unit with value f_a equals u_a, independently of its proof of invertibility.
- `cyclotomicSeriesUnit_map` — A coefficient homomorphism takes u_a to u_a over the target, with any proof that a is a unit there.
- `cyclotomicSeriesUnit_inv` — f_a times the value of u_a⁻¹ is 1, using the existing Units inverse.

**Tests.**

- `cyclotomicSeriesUnit_one` — Over ℚ, u_1=1.
- `cyclotomicSeriesUnit_three_value` — Over ℚ, u_3 has value 3+3T+T².
- `cyclotomicSeriesUnit_three_inverse` — The constant coefficient of u_3⁻¹ is 1/3.
- `cyclotomicSeriesUnit_three_logDeriv` — For u_3 over ℚ, coefficients zero and one of Δ are 1 and 2/3; detects the wrong logarithmic derivative weight.

**Source.** §10.2 between Lemma 10.3 and Proposition 10.4, printed p.165 / PDF 66. The polynomial claim is restricted to natural a; see E3. The source gives the ℤ_p formula or argument; the stated arbitrary-commutative-ring algebraic form and the declaration-sized splitting are derived here. No claim that the source states this generality.

### Underlying cyclotomic series

Node `ColemanPowerSeries:L2/cyclotomic-unit-value`; declaration `cyclotomicSeriesUnit_val`.

For ha: IsUnit(a in R), the underlying series of u_a is f_a.

**Hypotheses.** R is a commutative ring. Put B=R[[T]], Y=1+T and D=PowerSeries.derivative R. Inverses of elements of Bˣ mean units' inverses, not inversion of T. ha: IsUnit(a in R). Throughout, f_a is the imported DirichletPadicLFunctions:L1/smoothing-denominator, not a separately defined Coleman family.

**Construction or proof.** The unit constructor chooses a witness to IsUnit f_a; its value is f_a by construction.

**Dependencies.** `ColemanPowerSeries:L2/cyclotomic-series-unit`

**Acceptance.** Changing the proof ha does not change the unit.

**Source.** §10.2 between Lemma 10.3 and Proposition 10.4, printed p.165 / PDF 66. The polynomial claim is restricted to natural a; see E3. The source gives the ℤ_p formula or argument; the stated arbitrary-commutative-ring algebraic form and the declaration-sized splitting are derived here. No claim that the source states this generality.

### Cyclotomic logarithmic derivative

Node `ColemanPowerSeries:L2/cyclotomic-logarithmic-derivative-cleared`; declaration `cyclotomicSeries_logDeriv_cleared`.

For ha: IsUnit(a in R), T f_a Δ(u_a)=aYᵃ−Y f_a.

**Hypotheses.** R is a commutative ring. Put B=R[[T]], Y=1+T and D=PowerSeries.derivative R. Inverses of elements of Bˣ mean units' inverses, not inversion of T. a∈ℕ and its image in R is a unit. Throughout, f_a is the imported DirichletPadicLFunctions:L1/smoothing-denominator, not a separately defined Coleman family.

**Construction or proof.** Differentiate T f_a=Yᵃ−1 using the product rule and derivative_pow; obtain f_a+T D(f_a)=aY^(a−1) when a>0. Multiply by Y and substitute the definition of Δ(u_a), using the unit-value node to cancel f_a. Handle a=0 by the same polynomial identity (only the zero ring can supply its unit hypothesis).

**Dependencies.** `DirichletPadicLFunctions:L1/denominator-factorization`, `ColemanPowerSeries:L2/cyclotomic-unit-value`, `ColemanPowerSeries:L2/logarithmic-derivative`, `mathlib:Derivation.leibniz`, `mathlib:PowerSeries.derivative_pow`, `mathlib:PowerSeries.derivative_X`

**Acceptance.** No illegal division by the nonunit T occurs.

**Source.** Proposition 10.4 and Lemma 10.5, printed p.165 / PDF 66; compare Lemma 4.3, p.136 / PDF 37. The source gives the ℤ_p formula or argument; the stated arbitrary-commutative-ring algebraic form and the declaration-sized splitting are derived here. No claim that the source states this generality.

### Smoothed logarithmic derivative

Node `ColemanPowerSeries:L2/cyclotomic-smoothed-comparison`; declaration `cyclotomicSeries_logDeriv_smoothed`.

Let a∈ℕ be a unit in R. If F∈B satisfies T f_a F=f_a−C(a), then Δ(u_a)=C(a−1)−F. The equation for F is a denominator-cleared characterization of the independent smoothed series, not an assumption of the conclusion.

**Hypotheses.** R is a commutative ring. Put B=R[[T]], Y=1+T and D=PowerSeries.derivative R. Inverses of elements of Bˣ mean units' inverses, not inversion of T. a∈ℕ and ha: IsUnit(a in R). F is an actual power series satisfying T f_a F=f_a−C(a). This node is conditional algebra; the Dirichlet supplier must construct F for its measure application. Throughout, f_a is the imported DirichletPadicLFunctions:L1/smoothing-denominator, not a separately defined Coleman family.

**Construction or proof.** Use the cleared logarithmic derivative formula and the equation for F to compare T f_a times both sides. The discrepancy is a multiple of T f_a−(Yᵃ−1), so it vanishes by geometric factorization. Cancel the unit f_a and then T by X_mul_injective. This proof needs neither a field nor analytic logarithms.

**Dependencies.** `ColemanPowerSeries:L2/cyclotomic-logarithmic-derivative-cleared`, `DirichletPadicLFunctions:L1/denominator-factorization`, `ColemanPowerSeries:L2/cyclotomic-unit-value`, `mathlib:PowerSeries.X_mul_injective`

**Acceptance.** For a=3 over ℚ, F=1−(2/3)T+… and Δ(u_3)=1+(2/3)T+…; reversing the sign fails already in degree one.

**Tests.**

- `smoothed_three_sign` — Over ℚ with a=3, the defining equation for F forces coefficients 1 and −2/3, and Δ(u_3)=2−F.

**Source.** Proposition 10.4 and Lemma 10.5, printed p.165 / PDF 66; compare Lemma 4.3, p.136 / PDF 37. The source gives the ℤ_p formula or argument; the stated arbitrary-commutative-ring algebraic form and the declaration-sized splitting are derived here. No claim that the source states this generality.

### Realization in the Coleman composite

For positive a>1 prime to p, import the already planned Dirichlet L1 smoothed-series,
series-cleared-equation and smoothed-measure nodes. They supply the independently constructed F_a
and T f_a F_a=f_a−a for this same denominator. Only ψ/restriction/pseudomeasure results remain
in the Dirichlet stage-level request. The comparison theorem above then gives
Δ(u_a)=a−1−F_a without taking an inverse of T. To use this as a Coleman
calculation, L0/L1 must identify u_a with the interpolating series of the
actual norm-compatible units c_n(a)=(ζ_(p^n)^a−1)/(ζ_(p^n)−1).

Unit restriction kills the constant series. Consequently the raw composite

Col₀=A⁻¹ ∘ ∂⁻¹ ∘ (1−φψ) ∘ Δ ∘ Coleman

has Col₀(c(a))=−([a]−1)ζ_p once those genuine interfaces are constructed.
Define the normalized Col to be −Col₀ and prove that equality of maps.
This does not change ζ_p, the cyclotomic-moment quotient map, or the first
kernel inclusion. An equality of principal ideals would not determine this
sign and is not an adequate acceptance test.

For a=3, f_a=3+3T+T², Δ(u_a)=1+(2/3)T+… and F_a=1−(2/3)T+….
The coefficient of T detects both an omitted Y in Δ and the reversed sign.
These rational coefficients are p-integral for p≠3. The characteristic-3
test instead checks that f_3 is not a unit, so this parameter is excluded
exactly where it should be.

The first algebraic specialization of G-equivariance gives
Δ(f[Y^m−1])=m(Δf)[Y^m−1] for m∈ℕ. Full p-adic equivariance also needs the
p-adic power/substitution construction and continuity. The inverse derivative
on ψ=0 is multiplication by x⁻¹ on measures supported on units; this yields
the inverse twist factor a⁻¹. It is not an arbitrary antiderivative on B.
Both factors must be shown to cancel.

Negative integer parameters are not polynomials. The boundary control
`negative_parameter_boundary` checks Δ(−Y⁻¹)=−1; the full negative-parameter
family and its arithmetic compatibility remain in the continuation list.
The additional `power_subst_zero` control checks that substitution by zero
kills Δ. Together with the comparison example, the suggested file has
fifteen examples.

## L3. Kernel and cokernel

The torsion-free kernel theorem above concerns Δ on all formal units.
It does not prove the kernel of the Coleman map. First restrict to genuine
norm-fixed units: a constant c is norm-fixed precisely when c^p=c, and for a
unit this gives μ_(p−1). The image calculation is the separate mod-p
argument, lifting and compactness proof of RJW Lemmas 12.10–12.14.

Next construct the exact sequence for 1−φ on the ψ=1 subspace, including
the convergence of the series of iterates and its constant-term obstruction.
Combine the two sequences with the unit-supported inverse derivative.
Identify the full kernel μ_(p−1)×ℤ_p(1) and the cyclotomic-moment cokernel.
On principal units the required sequence is

0 → ℤ_p(1) → U_(∞,1) → ℤ_p[[G]] → ℤ_p(1) → 0.

Exactness is both algebraic and topological. For finite-flat coefficient
extension, tensor the two endpoint lattices and the unit module as well as
the Iwasawa algebra. The O(1) endpoints and completed-tensor comparison are
part of the assertion. They do not follow by changing the middle ring's
notation. The PMIA L5 request fixes the generic algebra supplier; the
arithmetic maps and hypotheses remain here.

**Acceptance.** Recover RJW Theorems 12.9 and 12.17 with actual continuous
maps, not assumed image/kernel predicates. Check the cyclotomic moment and
both endpoint identifications.

## L4. Cyclotomic units and inverse-limit generators

Import the global groups and finite-conductor real generators from
IntegralIwasawaTheory L0. Embed them in the local principal-unit tower and
prove the Teichmüller adjustment, retaining finite-level −1 where necessary.
Show that the closure of the relevant finitely generated subgroup is its
ℤ_p-span in the principal-unit module.

Prove norm compatibility of the chosen generator. Finite-level cyclicity
does not itself give a cyclic inverse limit with that generator: use the
compatible finite-level solution sets and compactness to prove surjectivity.
Apply the continuous Coleman map to the closed tower, determine its image
ideal and derive the odd-prime plus quotient

U_(∞,1)⁺/C_(∞,1)⁺ ≃ ℤ_p[[G⁺]]/(I(G⁺)ζ_p).

The O-coefficient assertion tensors the unit quotient too. This stage has
not yet been source-decomposed in the packet. Its acceptance includes
Theorems 11.9 and 12.23, actual finite-level units and all closure/comparison
maps. It is a local-unit theorem, distinct from the global Galois main
conjecture.

## Sources and corrections

The principal source is [Rodrigues Jacinto–Williams, published 2025](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf),
collated at the indicated passages with [arXiv v2](https://arxiv.org/pdf/2309.15692v2).
The packet records their exact hashes, read passages, locators and the bounded
search for corrections. This is not an exhaustive reading of either text.

The first nine findings below were recorded by the predecessor against the
version of record and collated with v2; this continuation preserves their records
without claiming an independent review. The two Coates–Sujatha findings concern
the exact publisher-layout copy described below. All await independent review. Existing programme corrections are
credited rather than claimed as new discoveries.

- **ColemanPowerSeries/E1.** Definition 10.14/Theorem 10.15, published p.170 / PDF 71; arXiv v2 p.52; compare published Proposition 10.4/Lemma 10.5 p.165 and Definition 4.10 p.138. With the displayed composite call the map Col₀ and write Col₀(c(a))=−θ_a ζ_p. Define Col=−Col₀ for the positive formula; do not renormalize ζ_p. Δ(f_a)=a−1−F_a. Unit restriction kills constants, so the subsequent linear inverse derivative and Amice inverse give −x⁻¹ Res μ_a=−θ_a ζ_p. The positive formula contradicts these independently fixed definitions. The a=3 expansion checks the algebraic sign; it is not a proof of the measure comparison.
- **ColemanPowerSeries/E2.** Proof of Lemma 10.8, published p.167 / PDF 68; arXiv v2 p.49. Construct the finite-free extension and its determinant norm over ℤ_p first. Identify the product only after adjoining μ_p and using the completed coefficient topology; descend the equality. For nontrivial η∈μ_p with odd p, η−1 is not a coefficient in ℤ_p, so T↦η(1+T)−1 is not an endomorphism of ℤ_p[[T]]. Moreover its constant coefficient is topologically nilpotent but not nilpotent; the pinned formal subst API is insufficient even after extending coefficients. The product formula remains a target with the correct base-change and convergence proof.
- **ColemanPowerSeries/E3.** §10.2 after Lemma 10.3, published p.165 / PDF 66; arXiv v2 p.48. For a>0 the series is the finite geometric sum. For negative integer parameters it is an invertible infinite formal series, with f_(−a)=−Y^(−a)f_a. The source allows any integer a prime to p. At a=−1, f_(−1)=−(1+T)⁻¹ has infinitely many nonzero coefficients over ℤ_p, so is not a polynomial. The finite-sum construction in this packet is explicitly restricted to natural parameters.
- **ColemanPowerSeries/E4.** Proof of Lemma 10.11(iii), published p.168 / PDF 69; arXiv v2 p.50. Perform the congruences in O_(K₁)[[T]], modulo p₁ p^k O_(K₁)[[T]], then intersect coefficientwise with ℤ_p[[T]]. The ideal p₁ and η−1 belong to the ring of integers of K₁=ℚ_p(μ_p), not ℤ_p. For the descended difference, p₁p^k O_(K₁)∩ℤ_p=p^(k+1)ℤ_p. This repairs the ambient ring without changing the asserted congruence.
- **ColemanPowerSeries/E5.** Last displayed geometric-series equality in Proposition 4.4 proof, published p.137 / PDF 38 (rendered); arXiv v2 p.27. Insert a minus sign before the sum over n≥1, or use Σ_(n≥1)(−1)^(n+1)T^(n−1)g(T)^n. Since F=(1−(1+Tg)⁻¹)/T, the geometric tail is subtracted, not added. For a=3, g=1+T/3 and F has constant coefficient +1; the printed series has constant coefficient −1. Integrality remains correct, but the formula cannot define the source's F_a.
- **ColemanPowerSeries/E6.** §4.1 before Lemma 4.2, published p.136 / PDF 37; arXiv v2 p.26. Use a positive integer a (in the analytic Mellin argument) and retain a>1 prime to p in the smoothing supplier. Negative parameters require an independent algebraic power-series argument. The phrase integer coprime to p allows a=−1. Then 1/(e^t−1)+1/(e^(−t)−1)=−1 for positive t, which does not decay. The Mellin-transform hypothesis fails; this does not obstruct the positive-parameter p-adic construction.
- **ColemanPowerSeries/E7.** Final sentence in proof of Proposition 4.11, published p.139 / PDF 40; arXiv v2 p.28. Handle k=1 separately: ζ(0)=−1/2, but the Euler factor 1−p^(k−1) is zero. For odd k>1 the negative-even zeta value is zero; even k has positive sign. The printed iff between nonvanishing of ζ(1−k) and even k misses k=1. The interpolation conclusion remains unchanged because its Euler factor kills that exceptional case.
- **ColemanPowerSeries/E8.** Proof of Lemma 4.7, published p.137 / PDF 38; arXiv v2 pp.27–28. Either define and compare an extension of the trace operator to a suitable localization, or prove the rational partial-fraction identity after clearing denominators and apply it to the already-integral F_a. Do not apply the bounded-series ψ to 1/T directly. The ψ constructed from bounded measures acts on ℤ_p[[T]], which does not contain T⁻¹. The displayed calculation is a useful rational-function identity, but the asserted domain extension and agreement with bounded ψ are missing. The Dirichlet supplier must discharge this proof interface.
- **ColemanPowerSeries/E9.** Proof of Proposition 12.1, series immediately preceding (12-1), published p.178 / PDF 79; arXiv v2 p.57. The expansion of f_u starts at k=0; retain a₀(u). The next line requires a₀(u)≡1 mod p, and a unit series must have a unit constant coefficient. Starting the displayed expansion at k=1 contradicts that. The subsequent separated constant-term calculation uses the intended expansion.

The supplementary source is [Coates–Sujatha, *Cyclotomic Fields and Zeta Values*](https://www.math.mcgill.ca/darmon/courses/16-17/gs/Coates-Sujatha.pdf),
Springer2006, SHA-256 `38178a8a147169c3750b7693c46c7453954790b101b37c2690f8e8cda91b0789`.
Printed pp.13–19 were read, with p.15 rendered to verify its statement; the
proof of Lemma2.3.5 continues on unread p.20. The opening paragraph of the
publisher’s sample chapter confirms the book’s odd-prime convention. The
publisher book/extras pages and a bounded correction search yielded no erratum
for the following items; the extras are a sample chapter and contents. This
records the exact copy read and makes no claim of exhaustive novelty.

- **ColemanPowerSeries/E10.** Theorem2.1.3 and the finite-zero sentence immediately following it, printed p.15 / PDF25; definition of distinguished polynomial on p.14. Require f≠0 in the preparation statement and in the finite-zero assertion; handle the zero series separately. A distinguished polynomial is monic and hence nonzero. In the domain ℤ_p[[T]], a finite power of p times that polynomial times a unit cannot equal zero. The zero series also vanishes at every point of the infinite maximal ideal. The rendered publisher-layout page contains no nonzero qualification. No specific published correction located in the bounded search; this records an elementary omitted hypothesis, not a claim of novelty.
- **ColemanPowerSeries/E11.** Proof of Proposition2.2.3, printed p.16 / PDF26; proof of Lemma2.3.2, printed p.18 / PDF28. Read the congruences in O[[T]], where O is the ring of integers of ℚ_p(μ_p), with ideals p₀O[[T]] or p₀p^kO[[T]]. Descend coefficients using p₀∩ℤ_p=pℤ_p (and its p^k multiple). The book defines R=ℤ_p[[T]], while p₀ and ξ−1 live in the coefficient extension O. The substitution values already belong to O[[T]], as correctly stated on p.15. Intersecting the extended ideal with ℤ_p yields the intended conclusion, without changing the norm or trace congruence. This is the same ambient-ring notation issue as the retained RJW finding ColemanPowerSeries/E4, now located in the cited Coates–Sujatha copy. No separate published erratum located.

The source's pseudomeasure localization/evaluation problems are already
recorded in PMIA's E1–E3. They are not new findings of this packet and are
not fixed by changing the sign of Col₀. Consumers must use the supplier's
admissible-evaluation interface.

## Exact continuation boundary

### ColemanPowerSeries:L0 — partial

- Decompose RJW §9 fully: actual cyclotomic fields K_n=ℚ_p(μ_(p^n)), n≥1, compatible roots, integral rings, degrees, residue fields, total ramification and relative norm formulas. Generic local-field structure and Eisenstein theory are imports, not fresh carriers here.
- Construct the full and principal norm-compatible unit inverse limits, continuity of transitions, closedness/compactness, G-action, Tate-module inclusion, and the norm-compatible Teichmüller splitting. Prove principal-unit pro-p hypotheses before importing the ℤ_p-module construction; full units are not a ℤ_p-module.
- Verify completed action hypotheses and source the explicitly unramified/semilocal coefficient extension with Frobenius and norm data. No arbitrary ramified coefficient extension is justified by this checkpoint.

### ColemanPowerSeries:L1 — partial

- Compare the proved integral trace coordinate with the bounded ψ owned by PMIA L2. Prove completed coefficient root-of-unity substitutions, trace/product formulas and descent; formal HasSubst alone is insufficient.
- Give norm/evaluation comparison and every part of RJW Lemma10.11. The Coates–Sujatha norm/trace and congruence passages have now been read, but their full interpolation argument and original Coleman sources still need granular decomposition.
- Import pinned Weierstrass through PMIA L4 with its nonzero hypothesis; prove interpolation uniqueness, finite-level lifting, compact successive approximation and surjectivity onto the entire norm-compatible tower. Recover Theorems10.2 and10.13, and specify the unramified coefficient/Frobenius variants exactly. The present algebraic basis proof is over ℤ_p only.

### ColemanPowerSeries:L2 — partial

- Identify the explicit f_a with the Coleman series of the actual unit tower c(a), proving membership, relative norm compatibility and interpolation; the 15 local algebraic nodes do not construct the tower.
- Extend the natural-parameter finite-sum family to negative integers with f_(−a)=−Y^(−a) f_a, and prove full p-adic-exponent substitution and continuity. The source's blanket polynomial claim for negative a is false.
- Consume actual PMIA bounded measure operators and the still-missing Dirichlet ψ/restriction/pseudomeasure results. The smoothed series, integral measure and T f_a F_a=f_a−a are already supplied by the exact Dirichlet L1 nodes; instantiate its series-cleared-equation on the shared denominator. Then prove equality of measures for raw Col₀ and normalized Col=−Col₀. This algebraic checkpoint introduces no measure carrier or Col map.
- Establish additivity, continuity, principal-unit ℤ_p-linearity and full G-equivariance; explicitly cancel the factors a and a⁻¹ from Δ and inverse derivative. Natural-power and integer-power lemmas alone are insufficient.

### ColemanPowerSeries:L3 — partial

- Decompose the mod-p image calculation and lifting/compactness proof in Lemmas 12.10–12.14; derive the exact logarithmic-derivative sequence of Theorem 12.9 on actual norm-fixed units.
- Decompose the 1−φ exact sequence on ψ=1, including convergence of the series of iterates and the evaluation-at-zero obstruction.
- Construct the kernel μ_(p−1)×ℤ_p(1), cyclotomic-moment cokernel, and Theorem 12.17 for principal units as both topological and algebraic modules. Tensor every term in a finite-flat coefficient extension and prove the completed-tensor comparison.

### ColemanPowerSeries:L4 — not_read

- Read and decompose RJW §11 and §12.3 through Theorem 12.23 with their cited sources. Import actual global cyclotomic subgroups, finite-conductor real generators and their finite index from IntegralIwasawaTheory:L0.
- Prove local embeddings, the Teichmüller-adjusted compatible generator, closure equals ℤ_p-span, finite-level generation and the compactness argument for inverse-limit cyclicity. Retain −1 at finite real level where required.
- Compute the closed cyclotomic tower's Coleman image and U_(∞,1)^+/C_(∞,1)^+ ≃ Λ(G^+)/(I(G^+)ζ_p) for odd p; transport the unit quotient itself under coefficient extension. This is not the Galois main conjecture.

The six gap records and eleven supplier requests remain open. The stage-level
requests concern the undecomposed arithmetic/comparison statements; they are
not hidden hypotheses of the 40 algebraic nodes. Every new internal edge
terminates in another local node or an exact pinned declaration. The existing
L2 chain also imports the precise Dirichlet denominator nodes. A passing packet
checker does not close the five stage targets.

Six planets are proposed: **Frobenius power basis**, **Coleman norm**,
**Integral Coleman trace**, and **Norm-fixed units** in L1; **Logarithmic
derivative** and **Cyclotomic unit series** in L2. No planet is a completion
claim. All implementation statuses remain unchecked.

### Pinned finite-algebra inputs

These supplement the existing derivative, unit and substitution inputs.
Each statement and its hypotheses were read at the pinned Mathlib commit;
none is replanned as a new generic construction.

| Baseline declaration | Exact role |
| --- | --- |
| `mathlib:Algebra.leftMulMatrix` | The actual multiplication matrix in a specified basis; entry (i,j) is the i-th coordinate of f times the j-th basis vector. |
| `mathlib:Algebra.norm` | Existing determinant norm as a monoid homomorphism, specialized with the explicit Frobenius algebra. |
| `mathlib:Algebra.norm_algebraMap_of_basis` | The norm of a base scalar is its power by the finite basis cardinality. |
| `mathlib:Algebra.norm_eq_matrix_det` | A finite basis computes the norm as the determinant of left multiplication. |
| `mathlib:Algebra.trace` | Existing linear trace of left multiplication, specialized with the explicit Frobenius algebra. |
| `mathlib:Algebra.trace_eq_matrix_trace` | A finite basis computes the trace as the trace of the multiplication matrix. |
| `mathlib:IsCompact.nonempty_iInter_of_sequence_nonempty_isCompact_isClosed` | A decreasing sequence of nonempty closed sets with compact first set has nonempty intersection. |
| `mathlib:Matrix.det_apply` | Leibniz determinant formula, using output row σ(i) and input column i. |
| `mathlib:Module.Basis.mk` | A basis from a linearly independent spanning family in the specified module. |
| `mathlib:Module.Basis.mk_apply` | The constructed basis has the supplied vectors. |
| `mathlib:Module.Basis.sum_repr` | Finite reconstruction as the sum of coordinate-scaled basis vectors. |
| `mathlib:Module.finrank_eq_card_basis` | Over a nontrivial commutative ring, a finite basis identifies finrank with its index cardinality. |
| `mathlib:PadicInt.compactSpace` | Compactness of ℤ_p in its p-adic topology for prime p. |
| `mathlib:PadicInt.ext_of_toZModPow` | All finite residue maps together detect equality in ℤ_p. |
| `mathlib:PadicInt.ker_toZMod` | The residue map kernel is the maximal ideal. |
| `mathlib:PadicInt.ker_toZModPow` | The kernel of reduction modulo p^r is the ideal generated by p^r. |
| `mathlib:PadicInt.maximalIdeal_eq_span_p` | The maximal ideal of ℤ_p is generated by p. |
| `mathlib:PadicInt.toZMod` | The residue ring homomorphism ℤ_p→ZMod p. |
| `mathlib:Pi.compactSpace` | Products of compact spaces are compact, including series coefficients and finite coordinate tuples. |
| `mathlib:PowerSeries.WithPiTopology.continuous_coeff` | Every coefficient map is continuous in the explicitly scoped coefficientwise topology. |
| `mathlib:PowerSeries.coeff_expand` | The coefficient at n is zero unless p divides n, then the coefficient at n/p. |
| `mathlib:PowerSeries.coeff_subst'` | Coefficient formula for substitution; here zero constant term makes the relevant sum finite for each coefficient. |
| `mathlib:PowerSeries.expand` | Substitution by T^p for nonzero p, with the actual coefficient ring retained. |
| `mathlib:PowerSeries.map_subst` | Coefficient homomorphisms commute with valid formal substitution. |
| `mathlib:RingHom.toAlgebra` | Algebra structure with a·x=i(a)x from a ring homomorphism; explicitly handles the warned self-action diamond. |
| `mathlib:Subgroup` | Existing subgroup structure on the actual unit group; no new unit carrier. |
