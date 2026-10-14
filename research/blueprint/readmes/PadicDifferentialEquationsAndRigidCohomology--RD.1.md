# P-adic differential equations, rigid cohomology and p-adic weights — RD.1 continuation

This document continues the [accepted main plan](../packets/PadicDifferentialEquationsAndRigidCohomology.json) for `PadicDifferentialEquationsAndRigidCohomology:RD.1`. It supplies the missing target-level proof inputs and comparisons listed in that packet’s coverage record. The [part packet](../packets/PadicDifferentialEquationsAndRigidCohomology--RD.1.json) is authoritative for IDs and prerequisite edges. All statements are proposed formalisation targets; none is claimed to be implemented.

RD.1 is **planned**, with five precisely bounded gaps and one request to RD.0. This is a complete planning pass under PROTOCOL §0, with open source/comparison suppliers recorded below. It is not closed coverage. The Overview’s quasi-constant and quasi-unipotent modules, Matsuda classification, and Theorem 5.4.10 belong to RD.2 and are imported only where a target here actually needs them.

## Existing ownership and library boundary

The main packet already owns differential modules, twisted polynomials, cyclicity, spectral norms, generic and subsidiary radii, transfer, Frobenius antecedents, breaks, Swan conductors, Frobenius modules and their standard blocks, degree/HN formalism, rank-one Frobenius cohomology, classical and extended-ring Dieudonné–Manin, generic slopes and saturated exterior-power descent. Those definitions and theorems are imported by their existing IDs. This continuation does not introduce another subsidiary-radius multiset, another standard-block definition or another local slope-filtration theorem.

The reviewed library audit has no dedicated RD.1 entry. Related Coleman-integration and Weil-roadmap entries do not establish these analytic carriers. At the pins, Mathlib supplies constant-linear `Derivation`, semilinear `LinearMap`, `Module.Basis` and `Matrix.det`; each declaration’s actual source was read. The pinned `WittVector.isocrystal_classification` is a **rank-one** theorem with a finrank-one hypothesis; it is not a baseline citation for arbitrary-rank Dieudonné–Manin. The current Tau Ceti library and the nine newer TauCetiRoadmap roadmaps were checked in addition to the atlas snapshot. They do not already contain these Robba radius/comparison targets. AdicSpaces and LocalFieldsRamification were read for the analytic/local-field interface and upstream style.

The pins are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Analytic carriers missing there remain targets in this reader. The [suggested Lean file](../suggested/PadicDifferentialEquationsAndRigidCohomology--RD.1.lean) uses only existing carriers for the explicit finite candidate, a cyclicity signature adapter, its statable field theorem and rescaling comparison. It elaborates with proof-placeholder warnings only. The ring-local algorithm, radius variation, Puiseux convergence, Teichmüller rings, isocrystal categories and cohomological duality are not represented by artificial data definitions in Lean.

## Notation and export conventions

| Object | Convention fixed here |
| --- | --- |
| Differential module | The connection satisfies Leibniz and is linear over constants; it is generally not linear over the differential field. |
| Annular radius | η=e^(−r); extrinsic radii are ordered R₁≤⋯≤R_d. Negative logarithms are decreasing. Fᵢ sums the **first**, hence largest, i negative logarithms. |
| Intrinsic radius | IR≤1; a trivial line has intrinsic f=0, but t-extrinsic f=r. These profiles must not be interchanged. |
| Analytic hypotheses | In the KX target family, residue characteristic p is positive and coefficient derivations are commuting, continuous and rational type. Modules on open annuli are locally free coherent sheaves. |
| Bounded Frobenius | E† is FF’s bounded Teichmüller field, E its π-adic completion. This notation alone does not identify it with the ordinary Amice field. |
| Generic slopes | Over bounded E† the descended filtration has **decreasing arithmetic** slopes. Global convergent isocrystals on the constant-polygon locus have **increasing** slopes. |
| Equal-characteristic standard block | HP F_(d,r) satisfies φ^r=π^(−d); its arithmetic Frobenius slope is −d/r, its HP geometric degree is d. |
| Integral lattice | “Bijective” means matrix in GL_n(O_E†), including an integral inverse. Merely preserving the lattice is insufficient. |
| Residue form | For ∂=(1+T)d/dT use η=dT/(1+T); for ∂=d/dT use η=dT. The one-form is part of the pairing. |
| DLB Cartier dual | V̌=V*⊗χ_cyc. The horizontal generator t⁻¹e_χ identifies its N_rig differential module with the differential dual; no untwisted representation-dual equality is asserted. |

The six planets already chosen in the main packet are retained: differential module over the Robba ring, generic radius of convergence, differential Swan conductor, extended-ring Dieudonné–Manin decomposition, Frobenius slopes and (φ,∇)-module over the Robba ring. The continuation adds no flags, keeping the assembled RD.1 layer within the six-planet limit.

## Worked acceptance calculations

### Finite cyclic-vector calculation

In a horizontal rank-two basis the formula gives c=e₀+xe₁. With ∂x=1, Dc=e₁ and the Wronskian is 1. At rank zero the candidate is the empty sum; at rank one it is e₀. For a nonzero field derivation, choose t with s=∂t≠0: the successive iterates of s⁻¹D and D differ by a triangular change with diagonal s^(−i), so cyclicity is unchanged. This is why the normalised algorithm has a genuine nonzero-derivation hypothesis. A zero connection on K² with zero coefficient derivation is a counterexample without it.

### Intrinsic and extrinsic profile check

For a trivial t-differential line the generic radius is η. Therefore its extrinsic negative logarithm is r; its intrinsic radius is 1, so the intrinsic negative logarithm is 0. On a disc the extrinsic theorem’s eventual f=r and the intrinsic theorem’s eventual constancy agree after normalisation. A gap between the first i and remaining radii selects the smallest radii and the largest negative logarithms. Affineness of their partial sum, as well as the persistent gap, is needed to obtain one annular projector.

### Uniform estimates in the monodromy calculation

Write U_c for analytic elements whose partial valuations are infinite at negative π-indices and at least c at all nonnegative indices. Each term of r(z) has its unshifted part in U_h(τ); the shifts s tend to infinity with l. Consequently r is additive, π-linear and π-adically continuous on these uniformly bounded sets.

To lift a prescribed w∈U_h(τ), first solve r(z₀)≡w modulo π by the finite Puiseux polynomial. Then solve each reduced error (w−r(Σⱼ<kπ^jzⱼ))/π^k modulo π, choosing z_k∈U_τ. The series Σπ^kz_k converges in U_τ and its image is w. To obtain a kernel element, start with a nonzero residue root of valuation τ and subtract a π-multiple correction. This keeps v₀(z)=τ.

The nonvanishing of the bilateral series a is an independent check. Since every coefficient of z has residue valuation at least τ and its constant π-coefficient has valuation τ,

`w_ρ(π^lσ^(−l)(z)) = l + ρq^(−l)τ`.

Choose 1/(q−1)<ρτ<q/(q−1). The l=0 term is the unique minimum among all integer l; adjacent differences and their monotonicity establish this for both tails. Thus the ultrametric sum cannot cancel to zero. Both tails tend to infinite valuation, so a converges and is nonzero.

For b₂ use oriented finite sums: a negative upper length reverses and negates the corresponding finite interval, rather than producing an empty sum. All lengths i+l−s stay bounded. Frobenius iterates of their inner terms therefore involve finitely many powers q^(nk), giving one residue-valuation lower bound independent of the π-index. The shifts have a uniform lower π-index bound and bounded-s index sets are finite. These bounds give π-adic convergence and overconvergence, allowing the telescoping identity to be passed to the limit. Only the general ordinary Newton-polygon supplier remains G2.

### Public Dwork bound

The Euler product for the Artin–Hasse series, verified by its formal logarithm and the Möbius divisor sum, has p-integral binomial coefficients. It and its inverse therefore have integral coefficients. In the factorisation of θ, the j-th exponential factor for j≥2 contributes at degree k p^j a valuation at least

`k((p^j−1)/(p−1)−j) ≥ ((p−1)/p²) k p^j`.

The j=2 case is equality in the lower bound; the bound increases thereafter. The Artin–Hasse factor has degree-d valuation at least d/(p−1). Each coefficient of the product uses finitely many factors, so both θ and its inverse satisfy the positive linear bound. For p=2 it gives radius at least 2^(1/4), with convergence asserted on the open disc. This avoids using the divergent scalar exponential at a boundary point. The source’s Artin–Hasse normalisation and Li’s alternate gauge normalisation must not be silently identified.

With g(t)=θ(t⁻¹)⁻¹, logarithmic differentiation gives g′/g=π(t⁻²−p t^(−p−1)). Hence D(gw)=−pπt^(−p−1)gw when D(w)=−πt⁻²w, exactly the Frobenius chain rule. The new estimate proves the missing overconvergence input to the existing odd-p Dwork node; it does not redevelop that node’s break or Artin–Schreier classification.

### Failure of unrestricted bounded completion

Let |c|>1 in F and define φ(e₁)=e₁+[c]e₂, φ(e₂)=πe₂. The matrix has determinant π, so it preserves an integral lattice but is not bijective on it. The completed fixed vector e₁+y e₂ has

`y = Σⱼ≥0 π^j[c^(q^j)]`.

It solves y−πφ(y)=[c] but fails every positive overconvergence weight because the residue norms grow like |c|^(q^j). The highest generic slope-one line e₂ is bounded and descends; the complementary completed fixed line does not. This simultaneously detects the wrong integral hypothesis, an unrestricted completion full-faithfulness claim and an unconditional bounded direct-sum classification.

### Residue and duality checks

For the trivial module with ∂=d/dT, [T⁻¹] pairs with 1 to give 1. For ∂=(1+T)d/dT the representative [(1+T)/T] gives the same answer using dT/(1+T). The coefficient g=T⁻² detects a wrong one-form: its ordinary residue is zero, whereas Res(g dT/(1+T))=−1. An exact class pairs to zero by integration by parts.

For the constant nilpotent model d+A du/u, all nonzero Laurent degrees are invertible after integration on a smaller annulus, leaving H⁰=ker A and H¹=coker A. Evaluation pairs coker A with ker Aᵗ perfectly. This is the local calculation in the proof route; the finite-cover trace/descent comparison is still G5. DLB Proposition 6.4 is a consumer acceptance check, with de Rham, absolute irreducibility, dimension two and nontriangulinity hypotheses all present. Its N_rig and representation constructions are not new RD.1 targets.

## Target catalogue

Each ID below is new in this part. Every prerequisite displayed is a direct edge in the packet; IDs of the accepted main packet remain imports. The candidate and the two analytic definitions/constructions carry all API and test items in the packet. Smaller proof calculations stay inside the target’s proof route.

### Explicit cyclic vectors

#### Katz cyclic-vector candidate

`PadicDifferentialEquationsAndRigidCohomology:RD.1/katz-candidate` · definition

For a rank-n differential module with ordered basis e₀,…,eₙ₋₁ over R, define c(e,x)=Σ₀≤j<n (x^j/j!) Σ₀≤k≤j (−1)^k binom(j,k) D^k(e_(j−k)). The rank-zero candidate is zero. This is an explicit candidate, not an assertion that every x works.

**Hypotheses.**

- R is a commutative differential ring; D is additive and satisfies D(rv)=∂(r)v+rD(v).
- (n−1)! is invertible when n>0; x=t−a with ∂t=1 and ∂a=0 for the cyclic-vector theorem.

**Proof route.**

1. Form the finite sums on the existing module carrier; keep the connection constant-linear.
2. Use the binomial cancellation in its first n differential jets; do not define cyclicity again, since the main packet already owns it.

**Direct prerequisites.** `PadicDifferentialEquationsAndRigidCohomology:RD.1/differential-module`, `mathlib:Derivation`, `mathlib:Module.Basis`, `mathlib:LinearMap`.

**Sources.** [rd1-katz](https://web.math.princeton.edu/~nmk/old/simplealgorithm.pdf), Formula (1) and Theorems 1–2, pp. 65–67. The finite Taylor-corrected vector supplies the constructive input to the cyclic-vector lemma.

**Uses.**

- Katz Theorems 1–2: Compute a candidate and a finite family of local generators.
- PadicDifferentialEquationsAndRigidCohomology:RD.1/cyclic-vector-lemma: Replace an existence-only source gap by the explicit formula.

**Planning API.**

| Declaration | Role | Statement |
| --- | --- | --- |
| `katzCandidate` | constructor | For a rank-n differential module with ordered basis e₀,…,eₙ₋₁ over R, define c(e,x)=Σ₀≤j<n (x^j/j!) Σ₀≤k≤j (−1)^k binom(j,k) D^k(e_(j−k)). The rank-zero candidate is zero. This is an explicit candidate, not an assertion that every x works. |
| `katzCandidate_zero_rank` | simp | For n=0 the empty sum is zero. |
| `katzCandidate_rank_one` | simp | For n=1 the candidate equals e₀. |
| `katzCandidate_naturality` | functoriality | A differential-linear isomorphism sends c(e,x) to c(f(e),x). |
| `katzCandidate_jet` | characterisation | With ∂x=1 the i-th jet at x=0 is eᵢ for 0≤i<n. |
| `katzCandidate_basis_coordinates` | compatibility | Its coordinates are the finite sums obtained using the pinned Basis.repr and the constant-linear map D. |

**Unit tests.**

- **empty** (degenerate): n=0 gives zero even when x≠0.
- **line** (computed): n=1 gives e₀ without any hypothesis on x.
- **horizontal_two** (computed): D(e₀)=D(e₁)=0 gives c=e₀+xe₁, not e₀−xe₁.
- **bad_translation** (non-example): For a specially chosen translation a the candidate can vanish; the theorem cannot assert every a works.

**Check.**

- In a horizontal rank-two basis, c=e₀+xe₁ and its derivative is e₁ when ∂x=1.
- Allow n=0 in the definition; the positive-rank theorem states n>0 explicitly.

#### Katz determinant criterion

`PadicDifferentialEquationsAndRigidCohomology:RD.1/katz-determinant-criterion` · lemma

With ∂t=1, the formal candidate in R[X] equipped with ∂X=1 has Wronskian P(X)=det(c,Dc,…,D^(n−1)c) in the e-basis, with P(0)=1 and degree at most n(n−1). If P(t−a) is a unit, c(e,t−a) is cyclic.

**Hypotheses.**

- n>0; (n−1)! invertible; R commutative; e a basis; the connection extends to R[X] by Leibniz.

**Proof route.**

1. Expand the j-th jet. Binomial cancellation leaves eⱼ at X=0, giving the identity coordinate matrix.
2. Each jet column has X-degree at most n−1, so the determinant has degree at most n(n−1).
3. Specialisation at X=t−a commutes with D exactly when a is constant. Invertibility of the determinant is the basis criterion.

**Direct prerequisites.** `PadicDifferentialEquationsAndRigidCohomology:RD.1/katz-candidate`, `mathlib:Matrix.det`.

**Sources.** [rd1-katz](https://web.math.princeton.edu/~nmk/old/simplealgorithm.pdf), Proofs of Theorems 1–2, pp. 66–67. The constant term and determinant degree give both the local criterion and the finite-family algorithm.

**Check.**

- The Wronskian at X=0 is 1, not merely nonzero.
- Track the differential structure on the polynomial variable; ordinary coefficientwise differentiation would fail.

#### Katz cyclic-vector algorithm

`PadicDifferentialEquationsAndRigidCohomology:RD.1/katz-local-global-algorithm` · theorem

If R is local and t−a lies in its maximal ideal, c(e,t−a) is cyclic. More generally, if constants contain a field k with at least N=n(n−1)+1 elements, any N distinct constants aᵢ yield candidates whose cyclic loci cover Spec R. Over a differential field of characteristic zero with ∂t=1, at least one of these candidates is cyclic.

**Hypotheses.**

- n>0; finite free rank n; the factorial assumption of katz-candidate.
- For the global conclusion k⊂ker ∂ is a field and N pairwise distinct aᵢ belong to k.

**Proof route.**

1. Locally the determinant reduces to 1 modulo the maximal ideal.
2. Globally evaluate P at t−aᵢ. The Vandermonde determinant is a product of nonzero constant differences, hence a unit.
3. Since P has degree ≤N−1 and constant term 1, its coefficients, and therefore the evaluation values, generate the unit ideal. Each prime admits an invertible evaluation after localisation.

**Direct prerequisites.** `PadicDifferentialEquationsAndRigidCohomology:RD.1/katz-determinant-criterion`.

**Sources.** [rd1-katz](https://web.math.princeton.edu/~nmk/old/simplealgorithm.pdf), Theorems 1–2 and proofs, pp. 65–67. The field proof is obtained from a finite covering by explicit candidates, not by an unspecified generic vector.

**Check.**

- Use exactly N candidates, including N=1 in rank one.
- The conclusion over a ring is local cyclicity, not necessarily one globally cyclic candidate.

#### Rescaling a nonzero derivation

`PadicDifferentialEquationsAndRigidCohomology:RD.1/cyclic-rescaling` · comparison

Over a characteristic-zero differential field with ∂≠0, choose t with s=∂t≠0. Put δ=s⁻¹∂ and D′=s⁻¹D. For every v, the spans of the first n iterates of D and D′ agree; cyclicity is unchanged. Hence the Katz algorithm applies with δt=1.

**Hypotheses.**

- K a characteristic-zero field; D constant-linear with Leibniz rule; n is the finite rank.

**Proof route.**

1. Use the Leibniz rule to check D′ is a connection for δ.
2. Induction gives (D′)^i(v)=s^(−i)D^i(v) plus lower iterates. The transition matrix is triangular with nonzero diagonal.
3. Apply the finite-candidate theorem. With ∂=0 and D=0 on K² no vector is cyclic; do not drop ∂≠0.

**Direct prerequisites.** `PadicDifferentialEquationsAndRigidCohomology:RD.1/katz-local-global-algorithm`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/cyclic-vector-lemma`.

**Sources.** [rd1-katz](https://web.math.princeton.edu/~nmk/old/simplealgorithm.pdf), pp. 65–67, ∂t=1 setup; rescaling argument supplied here. The argument explicitly connects the normalised algorithm to the main cyclic-vector statement.

**Check.**

- The field hypothesis is needed to invert s.
- Import main source issue E10 for the missing nonzero-derivation assumption in KX Lemma 1.2.4.

### Interior radius variation and splitting

#### Extrinsic subsidiary-radius variation

`PadicDifferentialEquationsAndRigidCohomology:RD.1/extrinsic-partial-radius-variation` · theorem

For the ∂₀-connection, order subsidiary radii R₁≤…≤R_d; set fᵢ(r)=−log Rᵢ(M,e^(−r)) and Fᵢ=Σⱼ≤i fⱼ. All fᵢ and Fᵢ are continuous and piecewise affine; Fᵢ is convex, and its affine slopes are integral whenever i=d or fᵢ>fᵢ₊₁. In general slopes of fᵢ lie in the union of (1/e)ℤ for 1≤e≤d. On a disc, slopes of Fᵢ are nonpositive where fᵢ>r, and fᵢ=r for sufficiently large r.

**Hypotheses.**

- K is a complete nonarchimedean characteristic-zero field, with positive residue characteristic p, commuting rational-type coefficient derivations ∂₁,…,∂ₘ and parameters uⱼ.
- ∂ⱼuⱼ=1, ∂ⱼuₖ=0 for j≠k, ‖∂ⱼ‖=|uⱼ|⁻¹ and the rational-type factorial bounds hold; ∂₀=d/dt.
- M is a nonzero finite locally free coherent module with the indicated continuous integrable connection on A¹_K(I), rank d. η=e^(−r) lies in I.

**Proof route.**

1. Reduce at small radii to a cyclic twisted polynomial and its Newton polygon; use the imported spectral and transfer statements.
2. For nonvisible radii use Frobenius pushforward/antecedents and recover individual slopes by subtracting partial sums.
3. The full ∂₀ argument in KX is a reference to book Theorem 11.3.2; gap G1 records the unverified analytic input rather than declaring this proof closed.

**Direct prerequisites.** `PadicDifferentialEquationsAndRigidCohomology:RD.1/generic-radius`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/generic-radius-basic-properties`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/christol-dwork-newton-polygon`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/frobenius-antecedent`, `PadicDifferentialEquationsAndRigidCohomology:RD.0/robba-ring`.

**Sources.** [rd1-kx](https://arxiv.org/pdf/0804.1495v4), Theorem 2.2.5, p. 20; Hypothesis 2.0.1 pp. 17–18. This is the extrinsic profile, with eventual fᵢ=r on a disc.

**Check.**

- A trivial ∂₀-line has R=η and f=r.
- Order f₁≥…≥f_d; do not sum the smallest negative logarithms.

#### Coefficient-derivation radius variation

`PadicDifferentialEquationsAndRigidCohomology:RD.1/coefficient-partial-radius-variation` · theorem

For a fixed coefficient derivation ∂ⱼ, define fᵢ and Fᵢ from extrinsic ∂ⱼ subsidiary radii as above. They are continuous, Fᵢ is convex, and they are piecewise affine wherever fᵢ>−log|uⱼ|. On the region fᵢ>(log p)/(p^n(p−1))−log|uⱼ|, slopes of Fᵢ at a total sum or strict gap lie in p^(−n)ℤ and individual slopes lie in the union of (1/(p^n e))ℤ, 1≤e≤d. On a disc Fᵢ has nonpositive slopes.

**Hypotheses.**

- K is a complete nonarchimedean characteristic-zero field, with positive residue characteristic p, commuting rational-type coefficient derivations ∂₁,…,∂ₘ and parameters uⱼ.
- ∂ⱼuⱼ=1, ∂ⱼuₖ=0 for j≠k, ‖∂ⱼ‖=|uⱼ|⁻¹ and the rational-type factorial bounds hold; ∂₀=d/dt.
- M is a nonzero finite locally free coherent module with the indicated continuous integrable connection on A¹_K(I), rank d. η=e^(−r) lies in I.
- j∈{1,…,m}; n≥0 in the visibility-threshold assertion.

**Proof route.**

1. Use an almost-isometric basis and a cyclic vector for ∂ⱼ. The visible spectral radii come from the coefficient Newton polygon (KX Lemmas 2.2.2–2.2.3).
2. Away from visibility apply the ∂ⱼ-Frobenius pushforward, separate its subsidiary spectrum and induct on the threshold n; the scaling introduces p^(−n).
3. Continuity follows from the spectral norms; convexity follows from the Newton polygon and induction. The isometric-basis and contraction suppliers cited only to the unread book remain G1.

**Direct prerequisites.** `PadicDifferentialEquationsAndRigidCohomology:RD.1/generic-radius`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/generic-radius-basic-properties`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/christol-dwork-newton-polygon`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/frobenius-antecedent`, `PadicDifferentialEquationsAndRigidCohomology:RD.0/robba-ring`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/katz-local-global-algorithm`.

**Sources.** [rd1-kx](https://arxiv.org/pdf/0804.1495v4), Theorem 2.2.6 and proof, pp. 20–22; Lemmas 2.2.2–2.2.3, pp. 19–20. The coefficient theorem has a visibility restriction; it alone does not supply strong intrinsic integrality.

**Check.**

- Do not claim piecewise affinity at fᵢ=−log|uⱼ| from this theorem alone.
- At threshold n=0 the asserted partial slopes are integers.

#### Intersection descent of annular projectors

`PadicDifferentialEquationsAndRigidCohomology:RD.1/annular-projector-descent` · lemma

For domains R=S∩T inside U and a finite locally free R-module M, M=(M⊗S)∩(M⊗T) inside M⊗U. An idempotent endomorphism on M⊗S extending an idempotent on M⊗T descends uniquely to M. Thus compatible spectral projectors on overlapping annular charts glue.

**Hypotheses.**

- All maps are injective; R=S∩T is an actual ring-intersection statement in the common overring U.
- M is finite locally free, not just torsion-free.

**Proof route.**

1. For v in the intersection define the ideal of denominators making v lie in M; localisation on a trivialising cover shows this ideal is the unit ideal.
2. Apply the intersection result to End_R(M), which is finite locally free.
3. Descend the operator and its equation P²=P using injectivity; uniqueness supplies agreement on overlaps.

**Direct prerequisites.** `PadicDifferentialEquationsAndRigidCohomology:RD.0/analytic-ring-membership-and-intersections`, `PadicDifferentialEquationsAndRigidCohomology:RD.0/modules-over-bezout-domains`.

**Sources.** [rd1-kx](https://arxiv.org/pdf/0804.1495v4), Lemmas 2.3.1–2.3.2, pp. 22–23. The local-free intersection argument is the algebraic engine for gluing decompositions.

**Check.**

- The image and kernel are locally free direct summands.
- Correct the self-reference in Lemma 2.3.2 to Lemma 2.3.1; do not assume all open-annular modules globally free.

#### Affine-gap extrinsic annular splitting

`PadicDifferentialEquationsAndRigidCohomology:RD.1/affine-gap-annular-splitting` · theorem

On an open annulus A¹_K(α,β) with α>0, if Fᵢ for one derivation is affine on (−logβ,−logα) and fᵢ>fᵢ₊₁ throughout, 1≤i<d, there is a unique differential direct-sum decomposition whose first summand has exactly the first i subsidiary radii at every η.

**Hypotheses.**

- K is a complete nonarchimedean characteristic-zero field, with positive residue characteristic p, commuting rational-type coefficient derivations ∂₁,…,∂ₘ and parameters uⱼ.
- ∂ⱼuⱼ=1, ∂ⱼuₖ=0 for j≠k, ‖∂ⱼ‖=|uⱼ|⁻¹ and the rational-type factorial bounds hold; ∂₀=d/dt.
- M is a nonzero finite locally free coherent module with the indicated continuous integrable connection on A¹_K(I), rank d. η=e^(−r) lies in I.
- Fix ∂₀ or one ∂ⱼ; no assertion of global freeness for either summand.

**Proof route.**

1. On closed subannuli use affine log norms at a Newton-polygon vertex to obtain unit coefficients and two coprime characteristic factors (KX Lemmas 2.3.3–2.3.4).
2. In the visible coefficient case the separation of factors gives a spectral projector by an iterative contraction; the quantitative contraction is the unread book input G1. The ∂₀ branch is book Theorem 12.4.2.
3. Use uniqueness of the radius-separated projector and intersection descent to glue over the open annulus.

**Direct prerequisites.** `PadicDifferentialEquationsAndRigidCohomology:RD.1/extrinsic-partial-radius-variation`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/coefficient-partial-radius-variation`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/annular-projector-descent`, `PadicDifferentialEquationsAndRigidCohomology:RD.0/units-of-robba-ring`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/robba-factorization-and-radius-decomposition`.

**Sources.** [rd1-kx](https://arxiv.org/pdf/0804.1495v4), Theorem 2.3.5 and Caution 2.3.6, pp. 23–24. The decomposition is a sheaf statement on an open annulus, subject to affineness and a persistent gap.

**Check.**

- Removing affineness is not licensed by a pointwise spectral gap.
- Each summand is locally free; a chosen free presentation on every closed subannulus is sufficient for the proof.

#### Generic rotation

`PadicDifferentialEquationsAndRigidCohomology:RD.1/generic-rotation` · construction

Normalise |uⱼ|=1. For η₊>0, let K̃ be the completed Gauss field K(x₁,…,xₘ) with |xⱼ|=η₊⁻¹. On |t|<η₊ define the Taylor homomorphism uⱼ↦uⱼ+xⱼt, fixing t. Pull M back and use the rotated ∂₀=∂₀+Σxⱼ∂ⱼ. For 0<η<η₊ its ∂₀ extrinsic radius is min{η IR_∂₀(M,η), η₊ IR_∂ⱼ(M,η):1≤j≤m}.

**Hypotheses.**

- K is a complete nonarchimedean characteristic-zero field, with positive residue characteristic p, commuting rational-type coefficient derivations ∂₁,…,∂ₘ and parameters uⱼ.
- ∂ⱼuⱼ=1, ∂ⱼuₖ=0 for j≠k, ‖∂ⱼ‖=|uⱼ|⁻¹ and the rational-type factorial bounds hold; ∂₀=d/dt.
- M is a nonzero finite locally free coherent module with the indicated continuous integrable connection on A¹_K(I), rank d. η=e^(−r) lies in I.
- The Taylor series converges under the rational-type bounds and strict η<η₊; coefficients are extended to the Gauss completion.

**Proof route.**

1. Construct the injective isometric Taylor homomorphism and pullback of the finite locally free module on the strict subannulus.
2. Apply the connection chain rule. Generic independent xⱼ prevent cancellation in the spectral norm, giving the minimum formula.
3. Use scalar-extension invariance and uniqueness of radius blocks for its splitting applications.

**Direct prerequisites.** `PadicDifferentialEquationsAndRigidCohomology:RD.0/change-of-frobenius-lift-taylor-formula`, `PadicDifferentialEquationsAndRigidCohomology:RD.0/robba-ring-flat-base-change`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/generic-radius-basic-properties`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/differential-module`.

**Sources.** [rd1-kx](https://arxiv.org/pdf/0804.1495v4), Notation 2.4.1 and Lemma 2.4.2, p. 26. Rotation converts competing coefficient directions into a single annular derivative.

**Uses.**

- KX Theorem 2.4.4: Transfer strong slope integrality from the t-direction.
- KX Theorem 2.5.1: Construct radius blocks and descend them by uniqueness.

**Planning API.**

| Declaration | Role | Statement |
| --- | --- | --- |
| `genericRotation` | constructor | Normalise \|uⱼ\|=1. For η₊>0, let K̃ be the completed Gauss field K(x₁,…,xₘ) with \|xⱼ\|=η₊⁻¹. On \|t\|<η₊ define the Taylor homomorphism uⱼ↦uⱼ+xⱼt, fixing t. Pull M back and use the rotated ∂₀=∂₀+Σxⱼ∂ⱼ. For 0<η<η₊ its ∂₀ extrinsic radius is min{η IR_∂₀(M,η), η₊ IR_∂ⱼ(M,η):1≤j≤m}. |
| `genericRotation_taylor` | data | The coefficient map sends uⱼ to uⱼ+xⱼt and t to t. |
| `genericRotation_isometric` | compatibility | The Taylor map preserves η-Gauss norms for η<η₊. |
| `genericRotation_connection` | characterisation | The pulled-back t-connection equals D₀+ΣxⱼDⱼ. |
| `genericRotation_radius` | characterisation | The extrinsic minimum formula holds on each η<η₊. |
| `genericRotation_base_change` | functoriality | Differential morphisms and tensor products commute with rotation. |

**Unit tests.**

- **no_coefficients** (degenerate): For m=0 the construction is ordinary scalar extension and R=ηIR_∂₀.
- **horizontal** (computed): A horizontal trivial line has rotated radius η since all IR=1.
- **coefficient_dominates** (computed): A pure coefficient line with IR_∂ⱼ=c and c<η/η₊ has rotated radius η₊c.
- **boundary** (non-example): The radius identity has a strict η<η₊ hypothesis; it cannot define a boundary Taylor pullback.

**Check.**

- Keep η₊ in the coefficient-radius terms; replacing it by η changes the formula.
- The construction has no claim of convergence on the boundary η=η₊.

#### Intrinsic subsidiary-radius variation

`PadicDifferentialEquationsAndRigidCohomology:RD.1/intrinsic-partial-radius-variation` · theorem

For the full commuting connection, order intrinsic subsidiary radii IR₁≤…≤IR_d≤1 and put fᵢ=−log IRᵢ and Fᵢ=Σⱼ≤i fⱼ. All profiles are continuous and piecewise affine; Fᵢ is convex and has integral slopes at i=d or a strict gap fᵢ>fᵢ₊₁. Individual slopes lie in the union of (1/e)ℤ, 1≤e≤d. On a disc Fᵢ has nonpositive slopes and is constant for sufficiently large r.

**Hypotheses.**

- K is a complete nonarchimedean characteristic-zero field, with positive residue characteristic p, commuting rational-type coefficient derivations ∂₁,…,∂ₘ and parameters uⱼ.
- ∂ⱼuⱼ=1, ∂ⱼuₖ=0 for j≠k, ‖∂ⱼ‖=|uⱼ|⁻¹ and the rational-type factorial bounds hold; ∂₀=d/dt.
- M is a nonzero finite locally free coherent module with the indicated continuous integrable connection on A¹_K(I), rank d. η=e^(−r) lies in I.

**Proof route.**

1. Use the half-open local decompositions of KX Theorems 2.3.8–2.3.10 to partition constituents according to their dominant derivation near a radius; their precise analytic inputs are included in G1.
2. Rotate a coefficient-dominant block into a t-block and apply the extrinsic strong-integrality theorem.
3. If θᵢ is the number of t-dominant constituents among the first i, compare one-sided slopes: (Fᵢ,rot)′₊−θᵢ≤Fᵢ′₊ and (Fᵢ,rot)′₋−θᵢ≥Fᵢ′₋. This yields convexity and the integral partial slopes.
4. At the maximum radius, convexity and discrete possible slopes force local finite piecewise affinity. Transfer on a disc gives eventual constancy.

**Direct prerequisites.** `PadicDifferentialEquationsAndRigidCohomology:RD.1/generic-rotation`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/extrinsic-partial-radius-variation`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/coefficient-partial-radius-variation`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/affine-gap-annular-splitting`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/dwork-transfer-generic-disc`.

**Sources.** [rd1-kx](https://arxiv.org/pdf/0804.1495v4), Theorem 2.4.4 and proof, pp. 27–30. The intrinsic theorem strengthens the coefficient theorem by generic rotation and a dominant-direction count.

**Check.**

- A horizontal line has f=0, in contrast with the extrinsic f=r.
- The first i are the largest negative logarithms, preserving multiplicities.

#### Intrinsic annular decomposition

`PadicDifferentialEquationsAndRigidCohomology:RD.1/intrinsic-annular-splitting` · theorem

On A¹_K(α,β), α>0, if the intrinsic Fᵢ is affine and fᵢ>fᵢ₊₁ throughout, there is a unique decomposition of M into integrable differential summands with the first i and remaining subsidiary intrinsic radii respectively.

**Hypotheses.**

- K is a complete nonarchimedean characteristic-zero field, with positive residue characteristic p, commuting rational-type coefficient derivations ∂₁,…,∂ₘ and parameters uⱼ.
- ∂ⱼuⱼ=1, ∂ⱼuₖ=0 for j≠k, ‖∂ⱼ‖=|uⱼ|⁻¹ and the rational-type factorial bounds hold; ∂₀=d/dt.
- M is a nonzero finite locally free coherent module with the indicated continuous integrable connection on A¹_K(I), rank d. η=e^(−r) lies in I.
- 1≤i<d; I=(α,β).

**Proof route.**

1. Shrink to η₋<1<η₊ so the radius gap exceeds the possible rotation-normalisation error −logη₋.
2. Affineness forces equality in the one-sided rotation inequalities, so the rotated Fᵢ is affine. Apply affine-gap extrinsic splitting.
3. Uniqueness descends the projector across the Gauss scalar extension. Every commuting derivation preserves the projector because morphisms between the radius-separated blocks vanish.
4. Glue the local projectors by intersection descent.

**Direct prerequisites.** `PadicDifferentialEquationsAndRigidCohomology:RD.1/intrinsic-partial-radius-variation`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/generic-rotation`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/affine-gap-annular-splitting`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/annular-projector-descent`.

**Sources.** [rd1-kx](https://arxiv.org/pdf/0804.1495v4), Theorem 2.5.1 and proof, pp. 30–31. This is the all-derivations splitting used for annular breaks.

**Check.**

- Uniqueness is a differential uniqueness statement, not a choice of bases.
- The proof of the imported boundary break theorem should cite this annular theorem, not the disc theorem.

#### Intrinsic disc decomposition

`PadicDifferentialEquationsAndRigidCohomology:RD.1/constant-profile-disc-splitting` · theorem

On the open disc A¹_K[0,β), if Fᵢ is affine for r>−logβ, it is constant. If fᵢ>fᵢ₊₁ for all such r, the unique intrinsic decomposition extends across t=0 as a decomposition of locally free integrable differential modules.

**Hypotheses.**

- K is a complete nonarchimedean characteristic-zero field, with positive residue characteristic p, commuting rational-type coefficient derivations ∂₁,…,∂ₘ and parameters uⱼ.
- ∂ⱼuⱼ=1, ∂ⱼuₖ=0 for j≠k, ‖∂ⱼ‖=|uⱼ|⁻¹ and the rational-type factorial bounds hold; ∂₀=d/dt.
- M is a nonzero finite locally free coherent module with the indicated continuous integrable connection on A¹_K(I), rank d. η=e^(−r) lies in I.
- 1≤i<d; the disc includes its centre.

**Proof route.**

1. The disc profile is eventually constant and convex with nonpositive slopes; affineness therefore makes it constant everywhere.
2. Transfer identifies the module near zero with a pullback from its differential fibre over K; decompose that fibre by its intrinsic radii.
3. Glue the central decomposition to the unique annular splitting. The all-derivations compatibility is retained.

**Direct prerequisites.** `PadicDifferentialEquationsAndRigidCohomology:RD.1/intrinsic-partial-radius-variation`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/intrinsic-annular-splitting`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/dwork-transfer-generic-disc`.

**Sources.** [rd1-kx](https://arxiv.org/pdf/0804.1495v4), Theorem 2.5.2 and proof, p. 31. Affineness on a disc forces constancy, permitting extension through the centre.

**Check.**

- A punctured-disc decomposition alone does not establish centre extension.
- Include t=0 in the acceptance chart.

#### Boundary break and Swan-integrality proof support

`PadicDifferentialEquationsAndRigidCohomology:RD.1/boundary-break-proof` · application

For a module solvable at the outer boundary, the full intrinsic partial profiles are eventually affine with nonnegative rational slopes. The imported break decomposition is obtained by repeatedly splitting at strict gaps, and the total break multiplicity sum is integral.

**Hypotheses.**

- K is a complete nonarchimedean characteristic-zero field, with positive residue characteristic p, commuting rational-type coefficient derivations ∂₁,…,∂ₘ and parameters uⱼ.
- ∂ⱼuⱼ=1, ∂ⱼuₖ=0 for j≠k, ‖∂ⱼ‖=|uⱼ|⁻¹ and the rational-type factorial bounds hold; ∂₀=d/dt.
- M is a nonzero finite locally free coherent module with the indicated continuous integrable connection on A¹_K(I), rank d. η=e^(−r) lies in I.
- Normalise the outer boundary to 1; IRᵢ→1 as η→1⁻.

**Proof route.**

1. Continuity, convexity and discrete slopes from the intrinsic-profile theorem force stable affine slopes near the boundary.
2. Apply intrinsic annular splitting to each strict gap; combine equal profiles into a break block.
3. The total partial slope is integral. Since Fᵢ sums the largest fⱼ, the first block is the smallest radius/largest break. This supplies the interior proof without redefining break or Swan conductor.

**Direct prerequisites.** `PadicDifferentialEquationsAndRigidCohomology:RD.1/intrinsic-partial-radius-variation`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/intrinsic-annular-splitting`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/solvable-at-boundary`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/break-decomposition`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/swan-conductor-integrality`.

**Sources.** [rd1-kx](https://arxiv.org/pdf/0804.1495v4), Theorem 2.6.1, pp. 32–33, with Theorems 2.4.4 and 2.5.1. The boundary application uses the annular decomposition, correcting the printed disc citation.

**Check.**

- Rank-one θ-Dwork example has break 1 and Swan conductor 1.
- This is a proof-support application to existing target nodes, not a new definition of subsidiary radii or breaks.

### Monodromy calculation and Dwork estimates

#### Puiseux Newton-polygon root criterion

`PadicDifferentialEquationsAndRigidCohomology:RD.1/puiseux-root-input` · lemma

For a nonzero finite polynomial P(z)=Σc_e z^e with distinct nonnegative rational exponents, a finite number l is the valuation of a nonzero root in an algebraically closed valued field if and only if the lower convex hull of (−e,v(c_e)) has a segment of slope l. A monomial has no nonzero root.

**Hypotheses.**

- Zero coefficients are omitted; rational exponents have one common denominator; roots are evaluated after adjoining that denominator-th root.

**Proof route.**

1. Clear denominators in the exponents by z=w^N.
2. Apply the ordinary Newton-polygon root criterion and convert the slope back, accounting for the minus sign in the exponent coordinate.
3. Exclude z=0, whose valuation is infinite.

**Direct prerequisites.** `PadicDifferentialEquationsAndRigidCohomology:RD.0/extended-robba-ring`.

**Sources.** [rd1-monodromy](https://annals.math.princeton.edu/wp-content/uploads/annals-v160-n1-p04.pdf), Lemma 4.11, published pp. 148–149; arXiv v4 pp. 51–52. The finite fractional-polynomial criterion supplies the initial root and lifting steps in the key calculation.

**Check.**

- For z−a the segment slope is v(a).
- Record the ordinary Newton-polygon supplier as G2, not as a presumed pinned theorem.

#### Kedlaya monodromy key calculation

`PadicDifferentialEquationsAndRigidCohomology:RD.1/monodromy-key-calculation` · lemma

In the algebraically closed extended analytic ring with invertible q-Frobenius σ fixing a uniformiser π, let n≥1 and x=Σᵢ₌₀ⁿuᵢπ^i, where the uᵢ are strong semiunits of negative residue valuation or zero and x≠0. There exist a,b, not both zero, with σ(a)=πa and πσ^n(b)=b−ax.

**Hypotheses.**

- The extended-ring topology, strong-semiunit partial valuations and Frobenius action are those of RD.0.
- The residue valuation is nontrivial; complete algebraically closed residue field; π is fixed by σ.
- Normalise the π-adic contribution to w_ρ so w_ρ(π)=1 in the nonvanishing calculation.

**Proof route.**

1. For m>0 set f(i,l,m)=(v₀(uᵢ)+m q^(−l))q^(−n(i+l)), and h(m)=minᵢ,ₗ f(i,l,m). The minimum is locally finite, increasing, piecewise affine, and h(qm)=q^(−n)h(m). Choose a corner τ with h(τ)<0.
2. Define T by f(i,l,τ)<0, S by f(i,l,τ)<q^(−n)h(τ), and s(i,l)=floor(log_(q^n)(h(τ)/f(i,l,τ))). S is finite; s≥0, and only finitely many indices have bounded s.
3. On the uniformly bounded partial-valuation modules U_τ→U_h(τ), define the additive π-linear convergent operator r(z)=Σ_T π^s σ^(−ni−nl+ns)(uᵢ) σ^(−ni−(n+1)l+ns)(z). Its reduction is a finite Puiseux polynomial with distinct exponents. The corner supplies a nonzero root of valuation τ.
4. Lift every required reduction recursively modulo successive powers of π, keeping the same uniform valuation bound. Completeness and continuity then give a nonzero z with v₀(z)=τ and r(z)=0; dense image alone would not imply surjectivity.
5. Put a=Σₗ∈ℤπ^lσ^(−l)(z). Since z∈U_τ and v₀(z)=τ, w_ρ(π^lσ^(−l)(z))=l+ρq^(−l)τ. Choose 1/(q−1)<ρτ<q/(q−1): the l=0 term uniquely minimises the valuation, so a≠0. The valuations tend to infinity at both ends and σ(a)=πa. Split ax=A+B using T; B has nonnegative partial valuation. The nonnegative-valuation difference input (monodromy Proposition 3.19(d), pp. 126–127) writes B=πσ^n(b₁)−b₁: explicitly b₁=−Σₖ≥0π^kσ^(nk)(B). Nonnegative residue partial valuations and the increasing π powers guarantee its convergence, and finite sums telescope.
6. For each index in T, the oriented finite geometric sum of length i+l−s gives b₂ with A=r(z)+πσ^n(b₂)−b₂. The integers i+l−s are uniformly bounded, so all summation k lie in one finite set of integers. Each unshifted summand has every partial valuation ≥h(τ), and σ^(nk) multiplies this bound by one of finitely many q^(nk). The π shifts have a uniform lower index bound; bounded-s index sets are finite. These facts give a uniform residue-valuation lower bound, π-adic convergence and overconvergence. Set b=−b₁−b₂; since a≠0 the pair is nonzero. G2 records only the ordinary Newton-polygon supplier still missing.

**Direct prerequisites.** `PadicDifferentialEquationsAndRigidCohomology:RD.1/puiseux-root-input`, `PadicDifferentialEquationsAndRigidCohomology:RD.0/semiunit-presentation`, `PadicDifferentialEquationsAndRigidCohomology:RD.0/analytic-ring-membership-and-intersections`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/cohomology-of-rank-one-frobenius-modules`, `PadicDifferentialEquationsAndRigidCohomology:RD.0/extended-robba-ring`.

**Sources.** [rd1-monodromy](https://annals.math.princeton.edu/wp-content/uploads/annals-v160-n1-p04.pdf), Lemma 4.12 and entire proof, published pp. 148–151; arXiv v4 pp. 52–54. The plan includes the corner, recursive lifting, bilateral series and telescoping correction beyond the accepted first step.

**Check.**

- Distinguish the integer s from a radius variable.
- Check both equations and that a,b are not both zero; a convergent zero series would not suffice.
- Use oriented summation when i+l−s<0, rather than an empty sum.

#### Artin–Hasse integrality

`PadicDifferentialEquationsAndRigidCohomology:RD.1/artin-hasse-integrality` · lemma

For each prime p, E_p(X)=exp(Σⱼ≥0 X^(p^j)/p^j) and its inverse have p-integral coefficients and constant coefficient 1.

**Hypotheses.**

- Formal power series over Q_p; integrality means membership in Z_p[[X]].

**Proof route.**

1. Use the Euler product E_p(X)=∏_{m≥1,p∤m}(1−X^m)^(−μ(m)/m); the formal logarithm agrees coefficientwise by the Möbius divisor sum.
2. The exponents −μ(m)/m are p-adic integers. The binomial coefficients of a p-adic integer are integral, by density of ordinary nonnegative integers and continuity of the binomial polynomial.
3. Every fixed coefficient involves finitely many factors. Negating the exponents proves integrality of the inverse. This elementary proof is provided here; Dwork states the integrality input.

**Direct prerequisites.** `PadicDifferentialEquationsAndRigidCohomology:RD.0/robba-ring`.

**Sources.** [rd1-dwork](https://www.numdam.org/item/10.1007/BF02684275.pdf), §4(a), equations (4.3)–(4.4), p. 56; Euler-product proof supplied here. Artin–Hasse integrality controls the low-degree factor in a public proof of splitting-function convergence.

**Check.**

- For p=2 the coefficient of X² in E₂ is 1, whereas exp(X) has nonintegral coefficient 1/2.
- Check both E_p and E_p⁻¹; the inverse is needed for the unit statement.

#### Dwork splitting-function overconvergence

`PadicDifferentialEquationsAndRigidCohomology:RD.1/dwork-overconvergence-proof` · theorem

Let π^(p−1)=−p in a complete extension of Q_p, v_p(p)=1, and θ(X)=exp(π(X−X^p)) as a formal series. Both θ and θ⁻¹ have coefficients of degree k with valuation at least αk, where α=(p−1)/p²>0. Hence θ is an analytic unit on |X|<p^α. The imported Dwork module on the Robba annulus admits F(w)=θ(t⁻¹)⁻¹w with an overconvergent inverse.

**Hypotheses.**

- p prime, including p=2; the analytic evaluation is of the extended formal series, not necessarily of the scalar exponential.
- The coefficient Frobenius fixes π and sends t to t^p for this example.

**Proof route.**

1. Factor θ=E_p(πX)∏ⱼ≥2 exp(−π^(p^j)X^(p^j)/p^j); the X^p term cancels because π^p/p=−π.
2. For degree k p^j in the j-th exponential, v_p≥k((p^j−1)/(p−1)−j)≥α k p^j for j≥2. The E_p factor and its inverse have degree-d valuation ≥d/(p−1).
3. Finite coefficient convolutions preserve the α-degree bound. The same argument with signs reversed handles θ⁻¹. Their formal product is 1, so they are inverse analytic functions on the open disc.
4. Substitute X=t⁻¹ to obtain an annulus |t|>p^(−α), including inner radii below 1. Differentiate the Frobenius factor and verify the chain rule for D(w)=−πt⁻²w.

**Direct prerequisites.** `PadicDifferentialEquationsAndRigidCohomology:RD.1/artin-hasse-integrality`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/dwork-exponential-module`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/frobenius-differential-module`, `PadicDifferentialEquationsAndRigidCohomology:RD.0/derivation-on-robba-ring`.

**Sources.** [rd1-sparse](https://arxiv.org/pdf/1112.4881), §1, equation (1.4), PDF pp. 5–6. The public coefficient estimate supplies exactly the unit and inverse required by the Dwork example. [rd1-dwork](https://www.numdam.org/item/10.1007/BF02684275.pdf), Lemma 4.1, §4(a), pp. 55–58. Dwork gives the Artin–Hasse factorisation and coefficient estimates. [rd1-li](https://bimsa.net/doc/publication/1445.pdf), Proposition 2.1 and proof, PDF pp. 4–5. A separate public gauge proof also controls overconvergence and the inverse, with a different normalisation.

**Check.**

- Do not evaluate a divergent scalar exponential at X=1 or infer θ(1)=1 from its formal exponent.
- For p=2 the factor bound is α=1/4 and the X² coefficient includes −π.
- The open-disc bound gives overconvergence; convergence on its boundary is not asserted.

### Bounded, completed and equal-characteristic Frobenius comparisons

#### Descending bounded generic slope filtration

`PadicDifferentialEquationsAndRigidCohomology:RD.1/descending-generic-filtration` · theorem

Every finite-dimensional Frobenius module M over E† has a unique filtration by saturated Frobenius submodules whose completed graded pieces are isoclinic of strictly decreasing arithmetic slopes. The filtration completes to the decreasing generic slope filtration over E. If F is algebraically closed, every graded piece is a direct sum of standard E† blocks of its one slope; M itself need not be their direct sum.

**Hypotheses.**

- F is a perfect complete nontrivially valued characteristic-p field; q is a power of p; σ raises residue coefficients to q-th powers and fixes π.
- E† is the bounded overconvergent Teichmüller coefficient field and E its π-adic completion, in the Fargues–Fontaine §11.2.5 convention; the coefficient-ring identification is requested from RD.0.
- Frobenius modules have invertible linearisation; this does not imply Frobenius is bijective on an arbitrary integral lattice.

**Proof route.**

1. Take the highest completed slope submodule. Its determinant is a rank-one Frobenius line in an exterior power.
2. In rank one choose λ with the highest slope and a completed eigenbasis vᵢ. Approximate it by bounded overconvergent wᵢ so λwᵢ=ΣⱼBᵢⱼF(wⱼ), with B mod π=diag(1,0,…,0). For v₁=Σcᵢwᵢ use σ(cᵢ)=ΣⱼBⱼᵢcⱼ. Choose r with w_r(B)≥0; induction in the π-index gives rv_h(cᵢ)+h≥0. At h=0 the coordinates reduce to δᵢ₁, not all to zero. Thus the determinant line has overconvergent coordinates. Apply the imported saturated exterior-power descent and the RD.0 intersection statement to descend from the algebraic extension.
3. Pass to the quotient and induct on rank. Completed uniqueness and injectivity give uniqueness over E†. For graded standard forms use the fixed-slope completion comparison, not full faithfulness on mixed slopes.

**Direct prerequisites.** `PadicDifferentialEquationsAndRigidCohomology:RD.1/saturated-subobject-descent-via-exterior-power`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/dieudonne-manin-classical`, `PadicDifferentialEquationsAndRigidCohomology:RD.0/completion-versus-overconvergence`.

**Sources.** [rd1-monodromy](https://annals.math.princeton.edu/wp-content/uploads/annals-v160-n1-p04.pdf), Proposition 5.11 and proof, published pp. 164–166; arXiv v4 pp. 66–67. The proof descends the highest generic slope first, giving decreasing bounded slopes. [rd1-ff](https://www.imo.universite-paris-saclay.fr/~fontaine/courbe.pdf), Proposition 11.2.24 p. 378, with accepted main source issues E218/E219. The corrected statement is filtration descent and fixed-slope comparison, not equivalence on all objects.

**Check.**

- For slopes 0,1 the first submodule has slope 1.
- A nonsplit bounded extension can split after completion; no unconditional E† direct-sum conclusion.

#### Bijective integral-lattice invariant descent

`PadicDifferentialEquationsAndRigidCohomology:RD.1/bijective-lattice-invariants` · theorem

If Λ is finite free over O_E† and Frobenius is bijective on Λ (matrix A∈GL_n(O_E†)), then Λ^(σ=1)→(Λ⊗O_E)^(σ=1) is an isomorphism.

**Hypotheses.**

- F is a perfect complete nontrivially valued characteristic-p field; q is a power of p; σ raises residue coefficients to q-th powers and fixes π.
- E† is the bounded overconvergent Teichmüller coefficient field and E its π-adic completion, in the Fargues–Fontaine §11.2.5 convention; the coefficient-ring identification is requested from RD.0.
- Frobenius modules have invertible linearisation; this does not imply Frobenius is bijective on an arbitrary integral lattice.
- The integral Frobenius matrix and its inverse have integral entries; fixed vectors are integral.

**Proof route.**

1. A fixed vector satisfies X=Aσ(X), so σ(X)=A⁻¹X. Apply the coefficient estimates to B=A⁻¹.
2. Rescale the basis by a Teichmüller scalar of sufficiently large residue norm so the reduction of B has entries in O_F. Choose one small positive radius ρ₀ with the resulting partial seminorm bound.
3. Iterate σ(X)=BX in each truncation. Frobenius scales the residue norm exponent by q; the first nonzero π-index bounds all truncations at the same ρ₀. Thus the coordinates are overconvergent. Injectivity is inclusion.
4. The matrix [[1,0],[c,π]] with |c|>1 violates integral bijectivity and has a completed fixed vector e₁+Σⱼ≥0π^j[c^(q^j)]e₂ that is not overconvergent.

**Direct prerequisites.** `PadicDifferentialEquationsAndRigidCohomology:RD.0/witt-partial-valuations`, `PadicDifferentialEquationsAndRigidCohomology:RD.0/partial-valuation-multiplicativity`, `PadicDifferentialEquationsAndRigidCohomology:RD.0/completion-versus-overconvergence`.

**Sources.** [rd1-ff](https://www.imo.universite-paris-saclay.fr/~fontaine/courbe.pdf), Lemma 11.2.25, p. 379, equation (7), corrected using main source issue E219. The integral invariant statement is valid with bijectivity and the inverse matrix in the estimate.

**Check.**

- Reject the condition σΛ⊆Λ as insufficient.
- Normalise B=A⁻¹, not A, when the equation is X=AσX.

#### Negative-slope Frobenius cokernel comparison

`PadicDifferentialEquationsAndRigidCohomology:RD.1/negative-frobenius-cokernel` · comparison

For d>0 and h≥1 the additive map 1−π^(−d)σ^h:E†→E† is surjective. A solution to (1−π^(−d)σ^h)y=x is y=−Σₘ≥1 π^(dm)σ^(−hm)(x); the same formula is valid on the completion and is compatible with inclusion.

**Hypotheses.**

- F is a perfect complete nontrivially valued characteristic-p field; q is a power of p; σ raises residue coefficients to q-th powers and fixes π.
- E† is the bounded overconvergent Teichmüller coefficient field and E its π-adic completion, in the Fargues–Fontaine §11.2.5 convention; the coefficient-ring identification is requested from RD.0.
- Frobenius modules have invertible linearisation; this does not imply Frobenius is bijective on an arbitrary integral lattice.
- σ is invertible; d,h integers with the stated strict signs.

**Proof route.**

1. Backward Frobenius reduces residue-coefficient growth by q^(−hm), while π^(dm) gives a linearly increasing integral valuation. This produces one positive convergence radius for the tail.
2. Telescope finite partial sums; their remaining error tends to zero in the analytic and π-adic topologies.
3. This is the FF coefficient/iterate transport of the imported negative-slope rank-one cohomology, not a new claim of Ext vanishing in both slope directions.

**Direct prerequisites.** `PadicDifferentialEquationsAndRigidCohomology:RD.1/cohomology-of-rank-one-frobenius-modules`, `PadicDifferentialEquationsAndRigidCohomology:RD.0/analytic-ring-membership-and-intersections`.

**Sources.** [rd1-sfr](https://arxiv.org/pdf/math/0504204v4), Proposition 3.3.7(c), preprint pp. 34–35, n<0 with σ replaced by σ^h; FF Lemma 11.2.25 p. 379. The negative slope makes backward-Frobenius summation overconvergent.

**Check.**

- Verify the sign with x=1: y=−π^d/(1−π^d).
- The map is additive and linear over σ^h-fixed constants; it is not E†-linear.

#### Isoclinic completion comparison

`PadicDifferentialEquationsAndRigidCohomology:RD.1/isoclinic-completion-comparison` · comparison

For two E† Frobenius modules of the same prescribed arithmetic slope λ, completion induces a bijection on Frobenius-linear morphisms. If F is algebraically closed, the completion functor on slope-λ objects is an equivalence, with standard blocks providing essential surjectivity. For a general perfect F, only full faithfulness is asserted here.

**Hypotheses.**

- F is a perfect complete nontrivially valued characteristic-p field; q is a power of p; σ raises residue coefficients to q-th powers and fixes π.
- E† is the bounded overconvergent Teichmüller coefficient field and E its π-adic completion, in the Fargues–Fontaine §11.2.5 convention; the coefficient-ring identification is requested from RD.0.
- Frobenius modules have invertible linearisation; this does not imply Frobenius is bijective on an arbitrary integral lattice.
- Both source and target are isoclinic of the same λ; essential surjectivity adds algebraic closedness.

**Proof route.**

1. The internal Hom has slope zero by the imported slope calculus. Twist/iterate to a unit-root lattice and apply the H⁰ comparison of SFR Proposition 6.3.2 or the bijective-lattice invariant estimate.
2. Over algebraically closed F classify the completed object into standard blocks. Each block is already defined over E†, giving essential surjectivity.
3. Use SFR Remark 6.3.4 to keep the non-algebraically-closed obstruction visible. Mixed-slope Homs do not reduce to unit root.

**Direct prerequisites.** `PadicDifferentialEquationsAndRigidCohomology:RD.1/bijective-lattice-invariants`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/calculus-of-slopes`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/frobenius-stable-lattices`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/standard-frobenius-modules`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/dieudonne-manin-classical`.

**Sources.** [rd1-sfr](https://arxiv.org/pdf/math/0504204v4), Propositions 6.3.2 and 6.3.3(a), Remark 6.3.4, preprint pp. 63–64. The H⁰ comparison applies to pure modules of the same slope and explicitly has an essential-surjectivity caveat.

**Check.**

- Test λ=0 by ordinary fixed vectors.
- Do not export an all-slope completion equivalence or a general-perfect-field equivalence.

#### Frobenius germ and punctured-disc comparison

`PadicDifferentialEquationsAndRigidCohomology:RD.1/frobenius-germ-extension` · comparison

For the FF analytic coefficient ring R_F=colim_(ρ→0) B_(0,ρ], restriction and Frobenius gluing identify finite projective Frobenius modules with compatible Frobenius bundles on the punctured analytic radius domain. In equal characteristic E=F_q((π)), the coefficient Frobenius fixes π; comparison with Hartl–Pink uses π as their z and coefficientwise q-power σ.

**Hypotheses.**

- F is algebraically closed complete nontrivially valued of characteristic p; coefficient field E is either FF mixed characteristic or F_q((π)).
- The Banach charts, their overlap restrictions and φ-rescaling maps must be supplied by RD.0; equal-characteristic coefficients are Laurent series in π with coefficients in F.

**Proof route.**

1. Spread a finitely presented module and Frobenius isomorphism to one small annular chart.
2. Translate that chart by Frobenius powers, glue across intersections using the isomorphism and its cocycle, and restrict back to recover the germ.
3. Match the FF norms and HP Laurent convergence conditions chartwise. This match and the mixed-characteristic extension are G3; a mere coincidence of symbols R is not a ring identification.

**Direct prerequisites.** `PadicDifferentialEquationsAndRigidCohomology:RD.0/robba-ring`, `PadicDifferentialEquationsAndRigidCohomology:RD.0/extended-robba-ring`, `PadicDifferentialEquationsAndRigidCohomology:RD.0/analytic-ring-membership-and-intersections`.

**Sources.** [rd1-ff](https://www.imo.universite-paris-saclay.fr/~fontaine/courbe.pdf), §11.2.5 and Propositions 11.2.20–11.2.22, pp. 377–378; Remark 11.3.4 p. 382. The comparison separates coefficient-ring foundations from the slope classification.

**Check.**

- In equal characteristic σ(π)=π, whereas σ acts nontrivially on F coefficients.
- Do not identify R_F with an ordinary Robba ring having t↦t^q without an explicit comparison.

#### Equal-characteristic extension section theorem

`PadicDifferentialEquationsAndRigidCohomology:RD.1/equalchar-degree-zero-section-input` · theorem

Over the Hartl–Pink punctured-disc ring, for every r≥1 and every σ-bundle extension 0→O(−1)→G→F_(1,r)→0 there is a nonzero Frobenius-fixed section of G.

**Hypotheses.**

- F is complete algebraically closed characteristic p with nontrivial norm; σ is coefficientwise q-power, fixes the Laurent variable z.
- HP F_(d,r) has σ^r=z^(−d), geometric degree d and arithmetic slope −d/r.

**Proof route.**

1. Write the extension matrix [[z,b],[0,A_(1,r)]]. A section of the quotient has coordinates v_t=Σᵢ∈ℤz^(−i)w^(q^(ir−t)) for 0<|w|<1; the first coordinate u must solve u=zσ(u)+bσ(v).
2. Its forced coefficients are u_i=Σⱼ≥0 f_(i−j)^(q^j). The negative-power tail always converges; the positive tail is controlled by a fractional q-polynomial condition (HP Lemmas 9.3–9.4).
3. Reduce to HP Proposition 9.5. Discard residue-norm ≤1 coefficients and shift so m=Σ_l m_l z^l has only positive exponents, with log|m_l|≤cl. For n=r+1 form F_i(w)=Σ_(0<j<ni)F_(i,j)w^(q^(−j)), where F_(i,j)=Σ_(j/n<k≤i)m_(nk−j)^(q^(−k)). Their logarithmic profiles φ_(i,j)=log|F_(i,j)| satisfy φ_(i+l,j+nl)=q^(−l)φ_(i,j); the actual coefficient differences satisfy log|F_(i′,j)−F_(i,j)|≤cn i q^(−i) for i′≥i≥2.
4. If every limiting φ_j≤0, any sufficiently small nonzero w works. Otherwise choose a corner ρ≥cn of max_j(φ_j−q^(−j)ρ), with positive maximum at two j. Newton polygons yield roots w_i of norm exp(−ρ).
5. Use the ball-image criterion for additive fractional q-polynomials to choose compatible roots with log|w_(i+1)−w_i|≤−c′q^((n−1)i/2). Their limit w retains nonzero norm; splitting j at ni/2 gives limsup log|F_i(w)|≤0 and the required positive-tail convergence.

**Direct prerequisites.** `PadicDifferentialEquationsAndRigidCohomology:RD.1/puiseux-root-input`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/standard-frobenius-modules`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/cohomology-of-rank-one-frobenius-modules`.

**Sources.** [rd1-hp](https://ivv5hpp.uni-muenster.de/u/uhartl/Publikat/SigmaBd.pdf), Proposition 9.1, Lemmas 9.3–9.4, Proposition 9.5 and §§10.1–10.17, pp. 705–712. The public analytic key calculation is independent of the classification it proves.

**Check.**

- Do not cite HP Theorem 4.3 as input: the source derives it from classification. Use Theorem 4.1 for global generation.
- Maintain the logarithm in the root-difference estimate; a negative upper bound on an absolute value is impossible.

#### Equal-characteristic Frobenius classification

`PadicDifferentialEquationsAndRigidCohomology:RD.1/equal-characteristic-classification` · theorem

For algebraically closed perfectoid F and E=F_q((π)), every finite projective Frobenius module over R_F is a direct sum of standard blocks with coprime integer pair (c,r), r>0, satisfying φ^r=π^c. The multiset of pairs is unique, and its arithmetic slope is c/r. With c=−d these are the Hartl–Pink blocks F_(d,r). Together with the imported mixed-characteristic classification, this covers the two coefficient characteristics in FF Remark 11.3.4, subject to the explicit ring comparison G3.

**Hypotheses.**

- The precise coefficient category is the one in frobenius-germ-extension, not a completion-only bounded category.
- Do not assume finite projective underlying modules on a nonspherically complete punctured disc are free before σ-bundle classification.

**Proof route.**

1. Use HP Theorem 4.1 to find a line subbundle of maximal degree; saturation and the degree bound make its quotient a σ-bundle. Rank-one classification and slope-ordered splitting are the imported standard/HN inputs transported to this coefficient category (G3).
2. Induct simultaneously: every degree-zero bundle has a section; every bundle splits into standard blocks; every nonnegative-degree bundle has a section. The nonsplit degree-zero obstruction is equalchar-degree-zero-section-input.
3. For rank r and degree d, pull back under [r] and twist by −d to obtain degree zero. A section yields a map from [r]_*O(d). If full rank, use saturation/degree and gcd(d,r); otherwise split off a standard summand by the slope inequality and induct.
4. HP Corollary 11.8 gives uniqueness. Transport through the germ comparison, preserving the sign c=−d and arithmetic slope convention.

**Direct prerequisites.** `PadicDifferentialEquationsAndRigidCohomology:RD.1/frobenius-germ-extension`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/equalchar-degree-zero-section-input`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/standard-frobenius-modules`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/semistability-and-harder-narasimhan-filtration`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/splitting-of-exact-sequences-by-polygons`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/dieudonne-manin-over-extended-robba-ring`.

**Sources.** [rd1-hp](https://ivv5hpp.uni-muenster.de/u/uhartl/Publikat/SigmaBd.pdf), Theorem 11.1, Lemmas 11.2–11.4, pp. 713–714; Corollary 11.8 p. 715; §8 pp. 703–705. The classification adds equal-characteristic coefficients without rebuilding the already planned standard-block notion. [rd1-ff](https://www.imo.universite-paris-saclay.fr/~fontaine/courbe.pdf), Remark 11.3.4, p. 382. The required classification includes equal-characteristic E and arbitrary algebraically closed perfectoid F.

**Check.**

- F_(1,r) has arithmetic slope −1/r, not +1/r.
- Direct-sum classification here does not imply direct-sum classification over bounded E†.

### Global and reverse slope filtrations

#### Common Newton-vertex subisocrystal

`PadicDifferentialEquationsAndRigidCohomology:RD.1/common-vertex-global-subobject` · theorem

Let X be a smooth variety over a perfect field k of characteristic p, with an F^n-bearing convergent isocrystal E and a common Newton-polygon vertex of horizontal coordinate a at every geometric point. Then there is a unique convergent Frobenius subisocrystal of rank a whose slopes are the smallest a slopes at each point.

**Hypotheses.**

- Finite coefficient field, fixed n≥1 and a fixed common break; use the convergent category, not merely a differential module or an arbitrary overconvergent subobject.

**Proof route.**

1. At the generic point use classical Dieudonné–Manin to select the initial slope block.
2. Extend the corresponding subobject across the base by the common-vertex theorem; this uses the curve/Katz purity arguments named in Notes Theorem 4.1, not just generic linear algebra (G4).
3. A connection respects the block because its second fundamental map goes from lower slopes to higher slopes and the relevant Frobenius Hom is zero (Notes Remark 4.5). Uniqueness follows from the same slope separation.

**Direct prerequisites.** `PadicDifferentialEquationsAndRigidCohomology:RD.3/restriction-to-convergent`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/dieudonne-manin-classical`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/calculus-of-slopes`.

**Sources.** [rd1-notes](https://arxiv.org/pdf/1606.01321), Theorem 4.1, Corollary 4.2 and Remark 4.5, PDF pp. 8–9. A common vertex is the global extension input for a constant-Newton-polygon slope filtration.

**Check.**

- The subobject is connection-stable, not only Frobenius-stable at generic points.
- Neither this theorem nor its application asserts that the filtration lies in the overconvergent category.

#### Dense-open global slope filtration

`PadicDifferentialEquationsAndRigidCohomology:RD.1/dense-open-global-slopes` · theorem

For an F^n-bearing convergent isocrystal on a smooth variety X over perfect k, there is a dense open U whose complement is a divisor such that on each connected component of U the Newton polygon is constant and the isocrystal has a unique filtration with isoclinic graded pieces of strictly increasing slopes.

**Hypotheses.**

- X is smooth of finite type; coefficients and F^n are fixed as in common-vertex-global-subobject.
- An empty divisor is allowed; disconnected components are treated separately.

**Proof route.**

1. Upper semicontinuity and purity of the Newton-jumping locus give a dense open constant-polygon locus with complement of pure codimension one (Notes Theorem 3.12). On regular X this is the support of a divisor. The proof of this purity supplier is G4.
2. For each successive vertex use the common-vertex theorem, then pass to its quotient.
3. The first graded piece has the smallest slope. Frobenius-Hom vanishing gives compatibility and uniqueness; the result is global on U and distinct from the local Robba slope filtration of RD.2.

**Direct prerequisites.** `PadicDifferentialEquationsAndRigidCohomology:RD.1/common-vertex-global-subobject`, `PadicDifferentialEquationsAndRigidCohomology:RD.3/restriction-to-convergent`.

**Sources.** [rd1-dad](https://arxiv.org/pdf/2012.12879v4), §2.2, p. 6. A divisor may be removed to obtain the global increasing slope filtration. [rd1-xz](https://arxiv.org/pdf/1910.13391), Appendix A §A.2, PDF p. 64. Constant-Newton-polygon convergent F-isocrystals admit the ascending filtration. [rd1-notes](https://arxiv.org/pdf/1606.01321), Theorem 3.12 and Corollary 4.2, PDF pp. 7–8. Purity and common-vertex extension provide the geometric prerequisite chain.

**Check.**

- A constant slope-zero object permits U=X.
- A bare connection without Frobenius does not have this Newton filtration.

#### de Jong reverse slope filtration

`PadicDifferentialEquationsAndRigidCohomology:RD.1/reverse-algebraic-filtration-comparison` · comparison

For M† over E†_alg, write the completed increasing slope filtration 0=S₀⊂S₁⊂…⊂Sₘ=M. There is a unique reverse filtration 0=Srev₀⊂…⊂Srevₘ=M† whose i-th graded piece completes to S_(m+1−i)/S_(m−i), for 1≤i≤m. Each isoclinic grade of slope s/r admits a Frobenius eigenbasis with eigenvalue p^(s/r) after a finite coefficient extension adjoining the needed r-th root of p.

**Hypotheses.**

- The algebraic residue extension is perfect and its completion is algebraically closed as required by the source; slope indices begin at 0.
- s∈ℤ, r>0; negative s is allowed; the coefficient extension and Frobenius lift fix the chosen scalar eigenvalue.

**Proof route.**

1. Apply the descending bounded generic filtration and compare its graded completions with the ascending filtration in the reverse order.
2. Uniqueness identifies the grade as S_(m+1−i)/S_(m−i). The printed shifted indices in D’Addezio are corrected; at i=m the quotient is S₁/S₀.
3. For one isoclinic grade apply classical standard-block classification and fixed-slope full faithfulness after the finite scalar extension to transport the Frobenius eigenbasis.

**Direct prerequisites.** `PadicDifferentialEquationsAndRigidCohomology:RD.1/descending-generic-filtration`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/isoclinic-completion-comparison`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/dieudonne-manin-classical`.

**Sources.** [rd1-dad](https://arxiv.org/pdf/2012.12879v4), Theorem 4.2.6 and proof, pp. 14–15. Reverse bounded slopes and eigenbasis comparison, with the quotient-index correction made explicit.

**Check.**

- For m=2 the grades complete to S₂/S₁ and S₁/S₀.
- This RD.1 ownership replaces the stray VB0 target; no VB0 dependency.

### Residue duality

#### Robba kernel–cokernel residue pairing

`PadicDifferentialEquationsAndRigidCohomology:RD.1/residue-duality-pairing` · definition

For a finite free differential Robba module M over L with coordinate T and connection operator ∂ for δ=(1+T)d/dT, define H¹_∂(M)=coker ∂ and H⁰_∂(M∨)=ker ∂∨. The pairing sends ([m],ℓ) to Res_T(⟨m,ℓ⟩ dT/(1+T)). For δ=d/dT the one-form is dT instead. The dual connection is determined by δ⟨m,ℓ⟩=⟨∂m,ℓ⟩+⟨m,∂∨ℓ⟩.

**Hypotheses.**

- L is a complete characteristic-zero nonarchimedean coefficient field; the Robba derivative has zero residue on exact one-forms.
- For the Dospinescu–Le Bras convention ∇=t(1+T)d/dT on coefficients and ∂=t⁻¹∇, t=log(1+T).
- The dual is the differential-module dual. For N_rig(V̌), V̌=V*⊗χ_cyc, choose the horizontal generator t⁻¹e_χ of N_rig(L(1)) to identify it with this dual.

**Proof route.**

1. Use the imported Robba Laurent coefficient and derivative to define residue as the coefficient of T⁻¹ in the one-form coefficient.
2. For horizontal ℓ the value on ∂m is the residue of δ⟨m,ℓ⟩ dT/(1+T)=d⟨m,ℓ⟩, hence zero. Descend to the additive/L-linear cokernel.
3. Export the pairing of quotient classes; changes of coordinate act on the differential form, not just on the scalar coefficient. The cyclotomic twist is fixed by the horizontal generator, without an extra claim of φ/Γ-equivariance.

**Direct prerequisites.** `PadicDifferentialEquationsAndRigidCohomology:RD.1/differential-module`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/frobenius-differential-module`, `PadicDifferentialEquationsAndRigidCohomology:RD.0/derivation-on-robba-ring`, `PadicDifferentialEquationsAndRigidCohomology:RD.0/robba-ring`.

**Sources.** [rd1-dlb](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n2-p01-p.pdf), §§6.1–6.4, printed pp. 355–357; Proposition 6.4 proof p. 357. The derivative and cyclotomic-dual conventions explain which residue pairing the cokernel argument uses.

**Uses.**

- Dospinescu–Le Bras Proposition 6.4: Convert vanishing of horizontal sections of N_rig(V̌) into surjectivity of ∂ on N_rig(V).
- RD.1 Robba duality target: Identify the finite-dimensional cokernel with the dual of the horizontal kernel.

**Planning API.**

| Declaration | Role | Statement |
| --- | --- | --- |
| `robbaResiduePairing` | constructor | For a finite free differential Robba module M over L with coordinate T and connection operator ∂ for δ=(1+T)d/dT, define H¹_∂(M)=coker ∂ and H⁰_∂(M∨)=ker ∂∨. The pairing sends ([m],ℓ) to Res_T(⟨m,ℓ⟩ dT/(1+T)). For δ=d/dT the one-form is dT instead. The dual connection is determined by δ⟨m,ℓ⟩=⟨∂m,ℓ⟩+⟨m,∂∨ℓ⟩. |
| `dualConnection_leibniz` | characterisation | δ of the evaluation pairing is the sum of the two connection evaluations. |
| `residue_exact` | simp | The residue of dg is zero for every convergent Robba Laurent series g. |
| `residuePairing_representative` | projection | Evaluation on a quotient class equals the chosen representative formula. |
| `residuePairing_bilinear` | structure | The descended pairing is L-bilinear. |
| `residuePairing_coordinate` | compatibility | Under an analytic invertible parameter change, the one-form residue and pairing agree. |
| `residuePairing_tate_generator` | compatibility | Using t⁻¹e_χ identifies the Cartier differential dual with M∨ for the DLB ∂ convention. |

**Unit tests.**

- **trivial_dT** (computed): For the trivial module and δ=d/dT, pairing [T⁻¹] with 1 is 1.
- **exact** (degenerate): For any m and horizontal ℓ, pairing [∂m] with ℓ is zero.
- **cyclotomic_form** (computed): For the trivial δ=(1+T)d/dT line, pairing [(1+T)/T] with 1 is 1.
- **wrong_form** (non-example): For g=T⁻², Res(g dT)=0 but Res(g dT/(1+T))=−1; using dT for δ=(1+T)d/dT is wrong.
- **integer_residue_line** (compatibility): For ∂=d/dT+a/T with a∈ℤ, the horizontal dual section T^a pairs [T^(−a−1)] to 1.

**Check.**

- The scalar residue for ∂=(1+T)d/dT is the coefficient of T⁻¹ in g/(1+T), not in g.
- Well-definedness follows from integration by parts and horizontality, independently of perfectness.

#### Robba residue duality

`PadicDifferentialEquationsAndRigidCohomology:RD.1/robba-residue-duality` · theorem

For a finite free differential module with a compatible invertible Frobenius structure over R_L, where L is complete discretely valued of characteristic zero with perfect residue field of characteristic p>0 and a q-Frobenius lift, H⁰ and H¹ for its connection are finite-dimensional, and the residue pairing H¹_∂(M)×H⁰_∂(M∨)→L is perfect. In the DLB convention, this identifies N_rig(V)/∂N_rig(V) with the L-dual of N_rig(V̌)^(∂=0) after the horizontal Tate-line identification.

**Hypotheses.**

- The Frobenius and finite-dimensional module hypotheses are essential to the public local-monodromy proof route.
- Use the same one-form/derivation and differential dual as residue-duality-pairing; no bare representation-dual identification.
- This theorem uses the discretely valued positive-residue-characteristic hypotheses of RD.2 local monodromy; in the DLB consumer L is a finite extension of Q_p.

**Proof route.**

1. Use the imported RD.2 finite-étale local-monodromy and logarithmic-form targets to obtain, after a finite extension, a unipotent model d+A du/u with A nilpotent. This is a theorem dependency on RD.2, not a redeveloped quasi-unipotence theorem.
2. Integrate Laurent coefficients of nonzero degree; polynomial-size denominators preserve convergence on a smaller annulus. H⁰ is ker A and H¹ is coker A. The residue pairing is the evaluation coker A × ker Aᵗ, hence perfect by finite-dimensional linear algebra.
3. Use finite-cover trace and pullback with their degree normalisation to descend perfectness to L. The analytic normal-form and trace comparison details remain G5.
4. As a consumer check, for a two-dimensional absolutely irreducible nontrianguline de Rham V, DLB Lemma 6.3 gives ∂-injectivity using t^hN⊂D_rig and (∇−h)(t^hx)=t^(h+1)∂x. Apply the same result to V̌ and perfectness for surjectivity, giving Proposition 6.4. The representation/N_rig construction itself is outside RD.1.

**Direct prerequisites.** `PadicDifferentialEquationsAndRigidCohomology:RD.1/residue-duality-pairing`, `PadicDifferentialEquationsAndRigidCohomology:RD.2/local-monodromy-finite-etale-form`, `PadicDifferentialEquationsAndRigidCohomology:RD.2/logarithmic-form-of-local-monodromy`, `PadicDifferentialEquationsAndRigidCohomology:RD.0/finite-separable-extensions-of-analytic-rings`, `PadicDifferentialEquationsAndRigidCohomology:RD.2/unipotent-iff-nilpotent-residue`.

**Sources.** [rd1-dlb](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n2-p01-p.pdf), Proposition 6.4 proof, p. 357; Lemma 6.3 pp. 356–357. The consumer uses general perfect duality cited to the uncleared book Proposition 20.4.2; this plan supplies an explicit alternative route and states its unresolved descent checks.

**Check.**

- Trivial line: H⁰=L, H¹=L and the T⁻¹ residue pairing is perfect.
- Unipotent nilpotent Jordan block: compare ker A and coker A directly.
- No claim that the uncleared book proof has been read.

## Closure boundary and supplier request

### G1: analytic radius and projector suppliers

KX Theorem 2.2.5 cites the uncleared Kedlaya book Theorem 11.3.2; the ∂₀ splitting cites Theorem 12.4.2. The coefficient proof uses almost-isometric bases (book 1.3.7/8.6.1), visible-spectrum comparison (6.7.4), contracting twisted-factor lifting (6.7.1 and 2.2.2), and the half-open/disk analytic inputs in KX 2.3.8–2.3.10. The public KX proof and full rotation/gluing route were read; these precise analytical suppliers have not been independently established in a cleared source. Obtain public proofs or a cleared copy, and check they match these hypotheses. The main packet already owns the broad spectral, transfer and Frobenius-antecedent targets; do not duplicate them.

Affected targets: `extrinsic-partial-radius-variation`, `coefficient-partial-radius-variation`, `affine-gap-annular-splitting`, `intrinsic-partial-radius-variation`, `intrinsic-annular-splitting`, `constant-profile-disc-splitting`, `boundary-break-proof`.

### G2: ordinary Newton-polygon root supplier

The published monodromy Lemma 4.12 proof and HP §§9–11 have been read. The packet supplies recursive lifting instead of a bare density argument, an explicit unique-minimum proof that a≠0, and uniform bounds for the oriented b₂ sums. Still supply and trace an ordinary Newton-polygon root theorem for finite polynomials over the complete algebraically closed valued residue field, including the nonzero-root and closed-ball-image statements after clearing fractional exponents. No verified pinned declaration or fully traced proof of that general supplier is cited here.

Affected targets: `puiseux-root-input`, `monodromy-key-calculation`, `equalchar-degree-zero-section-input`.

### G3: FF and HP coefficient-category transport

RD.0 currently plans mixed Cohen/Witt analytic rings and ordinary Robba rings. It does not state the chartwise FF Teichmüller E†/E/R_F comparison in both coefficient characteristics. Prove the compatible norms, Frobenius action, overlap intersections and germ extension; transport the rank-one/global-generation/standard-block and slope-splitting inputs used by HP §§4–8 without assuming the classification in advance. HP §§9–11 were read in full for the key estimate and classification. No claim of ordinary-Robba/FF ring equality or unrestricted bounded completion equivalence is made.

Affected targets: `descending-generic-filtration`, `bijective-lattice-invariants`, `negative-frobenius-cokernel`, `isoclinic-completion-comparison`, `frobenius-germ-extension`, `equal-characteristic-classification`, `reverse-algebraic-filtration-comparison`.

### G4: geometric Newton-polygon purity and extension

Read public statements/arguments in Notes on isocrystals Theorems 3.12/4.1, Corollary 4.2 and Remark 4.5 and both consumers. Their geometric purity/common-vertex extension proof suppliers (Katz curve argument, de Jong–Oort purity and the Notes §5 extension theorem) have not been fully traced here. Establish them at target level with smoothness/perfect-base hypotheses, rather than replacing them by the local Robba filtration. The convergent category is imported from RD.3; no higher-tier VB0 import is needed.

Affected targets: `common-vertex-global-subobject`, `dense-open-global-slopes`.

### G5: public general Robba-duality proof

The DLB consumer was read but its general duality citation is Kedlaya book Proposition 20.4.2, which is not cleared and was not read. The alternative RD.2 local-monodromy route needs a full proof that finite-cover normal-form cohomology, residue, trace and duality descend, with the exact one-form and degree factors. Establish those comparisons and convergence of Laurent integration; a proof for a nilpotent constant matrix alone is not the general theorem.

Affected targets: `robba-residue-duality`.

**Request to `PadicDifferentialEquationsAndRigidCohomology:RD.0`.** Supply FF coefficient rings E†=colim B_[0,ρ], its π-adic completion E, and R_F=colim B_(0,ρ], in mixed and equal coefficient characteristic, with explicit norms, φ fixing π and q-power residue action. Match the HP Laurent charts when E=F_q((π)); provide intersections, gluing and scalar extensions. This is an RD.0 extension, not a duplicate FF vector-bundle roadmap.

The dense-open and reverse bounded filtrations move into RD.1 from the stray VB0 plan. The higher roadmap must import these IDs; RD.1 has no VB0 prerequisite. The global convergent category is obtained through `RD.3/restriction-to-convergent`. The duality proof imports the existing RD.2 local-monodromy targets: it adds no second quasi-unipotence or local slope-filtration plan. Its normal-form calculation depends on `RD.2/unipotent-iff-nilpotent-residue`.

## Source verification and corrections

All public sources listed below were accessed on 14 October 2026. The packet records SHA-256 hashes of downloaded PDFs. The published Annals monodromy proof is used for its core calculations: the author’s publication page warns that it differs substantially from the preprint. The full KX 2010 erratum was read; its additional hypothesis concerns residue-characteristic-zero subharmonicity in §2.7, outside the positive-residue-characteristic §§2.2–2.5 target family here. The SFR additional errata list was read, including the amended Lemma 2.6.3 argument.

Main-packet source issues E10, E218 and E219 are imported with their accepted corrections. In particular the missing nonzero-derivation hypothesis, decreasing bounded filtration and bijective-lattice requirement are not new duplicate findings. This part records the following further findings in its own words; independent review has not yet adjudicated them.

- **E301** — KX arXiv v4 Lemma 2.3.2 proof, p. 23. The proof points to its own lemma for the intersection result. Use Lemma 2.3.1. Lemma 2.3.1 is the preceding finite-locally-free intersection statement needed on End(M). Search scope: KX v4 and full published 2010 erratum; the erratum addresses §2.7 only.
- **E302** — KX arXiv v4 Theorem 2.6.1 proof, pp. 32–33. The annular break-splitting step is assigned to the disc theorem 2.5.2. Use Theorem 2.5.1 for the boundary annulus. A neighbourhood of the outer Robba boundary excludes t=0; Theorem 2.5.1 is precisely the affine-gap annular statement. Search scope: KX v4 and full published 2010 erratum.
- **E303** — D’Addezio arXiv v4 Theorem 4.2.6(2), p. 14. The completed i-th reverse grade is indexed by m−i and m−i−1. Use S_(m+1−i)/S_(m−i), 1≤i≤m. At i=m the printed expression reaches a negative index; the last reverse grade is the lowest ascending grade S₁/S₀. Search scope: D’Addezio v4 theorem and proof; accepted main source-issue list; no separate author erratum checked.
- **E304** — Hartl–Pink published §10.17, p. 712. The root-difference absolute value is bounded above by a negative expression. The left side must be log|w−w_i|. The preceding root-lifting estimate is logarithmic; absolute values are nonnegative. Search scope: Published SigmaBd.pdf §§10.15–10.17; no separate erratum located in the source.
- **E305** — Hartl–Pink published §10.16, p. 712. The displayed terminal logarithmic bound has the wrong sign on cn. Use log|w|=−ρ≤−cn. Lemma 10.12 chooses ρ≥cn, and §10.3 requires log|w|≤−cn. Search scope: Published SigmaBd.pdf §§10.3,10.12,10.16; no separate erratum located in the source.
- **E306** — Monodromy published Lemma 4.12 proof, p. 150. The target of the dense-image and surjectivity sentence is labelled U_f(t). Use U_h(t). h(t) is the uniform lower valuation bound; f depends on two additional indices and cannot label that module. Search scope: Published Annals paper at the cited locator; corresponding arXiv v4 proof; author publication-list version note.
- **E307** — Monodromy published Lemma 4.12 proof, p. 150, bilateral series estimate. The w_s estimate mixes a second radius variable r on its right side. Use l v_p(π)+s q^(−l)t throughout. The residue contribution to w_s is multiplied by the same radius s as on its left side. Search scope: Published Annals paper at the cited locator; corresponding arXiv v4 proof; author publication-list version note.
- **E308** — Monodromy published Proposition 5.11 proof, p. 165. The exterior-power reduction calls the selected determinant line the lowest slope submodule. It is the highest slope line in the d-th exterior power. M₁ was selected as the highest-slope rank-d block; summing its d slopes maximises the exterior-power slope. Search scope: Published Annals paper at the cited locator; corresponding arXiv v4 proof; author publication-list version note.
- **E309** — Monodromy published Proposition 5.11 proof, p. 165, coefficient induction base. The base case claims all coordinates cᵢ vanish modulo π. The coordinates reduce to δᵢ₁; normalise wᵢ≡vᵢ modulo π. v₁ has coordinate one in the first vector and zero in the other vectors in a nearby basis. The first coordinate is a unit, and the displayed bound still follows. Search scope: Published Annals paper at the cited locator; corresponding arXiv v4 proof; author publication-list version note.

The Kedlaya differential-equations book is not a cleared source and was not read. No book excerpt or extracted book text is included. The downloaded de Jong DVI and correction could not be rendered in this environment; neither is cited as a read proof. Monodromy Proposition 5.11 provides the read public descending-filtration route. The geometric proofs beneath the Notes purity/common-vertex statements remain G4.

## Source register

| Source | Version and read locators |
| --- | --- |
| [A simple algorithm for cyclic vectors](https://web.math.princeton.edu/~nmk/old/simplealgorithm.pdf) — Nicholas M. Katz | American Journal of Mathematics 109 (1987), 65–70. Entire paper; Theorems 1 and 2 and formula (1), pp. 65–68; characteristic-p warning p. 68 |
| [Differential modules on p-adic polyannuli](https://arxiv.org/pdf/0804.1495v4) — Kiran S. Kedlaya and Liang Xiao | arXiv:0804.1495v4, 16 December 2008; paper dated 15 December 2008. §§1.2–1.5 inputs, pp. 6–16; Hypothesis 2.0.1 and §§2.1–2.6, pp. 17–33 |
| [Differential modules on p-adic polyannuli: erratum](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/S1474748009000243) — Kiran S. Kedlaya and Liang Xiao | Journal of the Institute of Mathematics of Jussieu 9 (2010), 669–671, DOI 10.1017/S1474748009000243. Entire three-page erratum: corrections to §2.7 in residue characteristic zero |
| [A p-adic local monodromy theorem](https://annals.math.princeton.edu/wp-content/uploads/annals-v160-n1-p04.pdf) — Kiran S. Kedlaya | Annals of Mathematics 160 (2004), 93–184; published version. Lemmas 4.11–4.12, pp. 148–151; reverse-filtration Proposition 5.11; compare arXiv v4 pp. 51–54 and 66–67 |
| [Slope filtrations revisited](https://arxiv.org/pdf/math/0504204v4) — Kiran S. Kedlaya | arXiv:math/0504204v4; Documenta Mathematica 10 (2005), 447–525. Proposition 3.3.7(c), preprint pp. 34–35; §§6.2–6.3, preprint pp. 63–64; explicit caveat in Remark 6.3.4 |
| [Slope filtrations revisited: additional errata](https://kskedlaya.org/papers/slope-filt-errata2.pdf) — Kiran S. Kedlaya | Author list dated 12 February 2013. Entire two-page list; corrected proof of Lemma 2.6.3; no correction listed to §6.3 |
| [Courbes et fibrés vectoriels en théorie de Hodge p-adique](https://www.imo.universite-paris-saclay.fr/~fontaine/courbe.pdf) — Laurent Fargues and Jean-Marc Fontaine | Author copy, 16 avril 2017, printed page numbering. §11.2.5, Propositions 11.2.20, 11.2.22, 11.2.24 and Lemma 11.2.25, pp. 377–379; Remark 11.3.4 p. 382 |
| [Vector bundles with a Frobenius structure on the punctured unit disc](https://ivv5hpp.uni-muenster.de/u/uhartl/Publikat/SigmaBd.pdf) — Urs Hartl and Richard Pink | Compositio Mathematica 140 (2004), 689–716. §§1–4 ring/bundle/global-generation statements; §§8–11 standard bundles, extension calculation, fundamental estimate and classification, pp. 703–715 |
| [On the zeta function of a hypersurface](https://www.numdam.org/item/10.1007/BF02684275.pdf) — Bernard Dwork | Publications Mathématiques de l’IHÉS 12 (1962), 5–68. §4(a), Lemma 4.1 and equations (4.3)–(4.4), pp. 55–58 |
| [Computing zeta functions of sparse nondegenerate hypersurfaces](https://arxiv.org/pdf/1112.4881) — Steven Sperber and John Voight | arXiv:1112.4881, publicly served PDF read 14 October 2026. §1, splitting function and equation (1.4), PDF pp. 5–6 |
| [Exponential sums and rigid cohomology](https://bimsa.net/doc/publication/1445.pdf) — Peigen Li | Finite Fields and Their Applications 81 (2022), 102031. Proposition 2.1 and its proof, PDF pp. 4–5, alternate gauge estimates |
| [Parabolicity conjecture of F-isocrystals](https://arxiv.org/pdf/2012.12879v4) — Marco D’Addezio | arXiv:2012.12879v4. §2.2 p. 6; Theorem 4.2.6 and proof pp. 14–15 |
| [Bessel F-isocrystals for reductive groups](https://arxiv.org/pdf/1910.13391) — Daxin Xu and Xinwen Zhu | arXiv:1910.13391, publicly served PDF read 14 October 2026. Appendix A, §A.2, PDF p. 64, constant-Newton-polygon slope filtration |
| [Notes on isocrystals](https://arxiv.org/pdf/1606.01321) — Kiran S. Kedlaya | arXiv:1606.01321, publicly served PDF read 14 October 2026. Theorems 3.12 and 4.1, Corollary 4.2 and Remark 4.5, PDF pp. 7–9 |
| [Revêtements du demi-plan de Drinfeld et correspondance de Langlands p-adique](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n2-p01-p.pdf) — Gabriel Dospinescu and Arthur-César Le Bras | Annals of Mathematics 186 (2017), 321–411. §§6.1–6.4, Lemma 6.3 and Proposition 6.4, printed pp. 355–357 |
