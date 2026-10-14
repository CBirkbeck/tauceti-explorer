# P-adic differential equations, rigid cohomology and p-adic weights — RD.1 continuation

This document continues the [accepted main plan](../packets/PadicDifferentialEquationsAndRigidCohomology.json) for `PadicDifferentialEquationsAndRigidCohomology:RD.1`. It supplies the missing target-level proof inputs and comparisons listed in that packet’s coverage record. The [part packet](../packets/PadicDifferentialEquationsAndRigidCohomology--RD.1.json) is authoritative for IDs and prerequisite edges. All statements are proposed formalisation targets; none is claimed to be implemented.

RD.1 is **planned**, with five precisely bounded gaps and one request to RD.0. This is a complete planning pass under PROTOCOL §0, with open source/comparison suppliers recorded below. It is not closed coverage. The Overview’s quasi-constant and quasi-unipotent modules, Matsuda classification, and Theorem 5.4.10 belong to RD.2 and are imported only where a target here actually needs them.

## Existing ownership and library boundary

The main packet already owns differential modules, twisted polynomials, cyclicity, spectral norms, generic and subsidiary radii, transfer, Frobenius antecedents, breaks, Swan conductors, Frobenius modules and their standard blocks, degree/HN formalism, rank-one Frobenius cohomology, classical and extended-ring Dieudonné–Manin, generic slopes and saturated exterior-power descent. Those definitions and theorems are imported by their existing IDs. This continuation does not introduce another standard-block definition or another local slope-filtration theorem. The main packet's radius targets concern the single derivation d/dt, while the Kedlaya–Xiao targets below also involve the coefficient derivations of a rational-type field. The independent review therefore added three targets from Kedlaya–Xiao §§1.4–1.5: rational-type fields with their intrinsic radii, the ∂ⱼ-Frobenius antecedent and descendant, and the decomposition by intrinsic radii. For ∂₀=d/dt the intrinsic radius is the main packet's toric radius T(E,η), so nothing is planned twice.

The reviewed library audit has no dedicated RD.1 entry. Related Coleman-integration and Weil-roadmap entries do not establish these analytic carriers. At the pins, Mathlib supplies constant-linear `Derivation`, semilinear `LinearMap`, `Module.Basis` and `Matrix.det`; each declaration’s actual source was read. The pinned `WittVector.isocrystal_classification` is a **rank-one** theorem with a finrank-one hypothesis; it is not a baseline citation for arbitrary-rank Dieudonné–Manin. The current Tau Ceti library and the nine newer TauCetiRoadmap roadmaps were checked in addition to the atlas snapshot. They do not already contain these Robba radius/comparison targets. AdicSpaces and LocalFieldsRamification were read for the analytic/local-field interface and upstream style.

The pins are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Analytic carriers missing there remain targets in this reader. The [suggested Lean file](../suggested/PadicDifferentialEquationsAndRigidCohomology--RD.1.lean) uses only existing carriers for the explicit finite candidate, a cyclicity signature adapter, its statable field theorem and rescaling comparison, and the rational-type condition on a normed field with a derivation, with its parameter-change statement. It elaborates with proof-placeholder warnings only. The ring-local algorithm, radius variation, Puiseux convergence, Teichmüller rings, isocrystal categories and cohomological duality are not represented by artificial data definitions in Lean.

## Notation and export conventions

| Object | Convention fixed here |
| --- | --- |
| Differential module | The connection satisfies Leibniz and is linear over constants; it is generally not linear over the differential field. |
| Annular radius | η=e^(−r); extrinsic radii are ordered R₁≤⋯≤R_d. Negative logarithms are decreasing. Fᵢ sums the **first**, hence largest, i negative logarithms. |
| Intrinsic radius | IR_∂ⱼ=\|uⱼ\|·R_∂ⱼ≤1 for each derivation and IR=min_j IR_∂ⱼ; a trivial line has intrinsic f=0, but t-extrinsic f=r. These profiles must not be interchanged. |
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

For b₂ use oriented finite sums: a negative upper length reverses and negates the corresponding finite interval, rather than producing an empty sum. Negative lengths do occur: with q=2, n=1 and v₀(u₀)=−1, the pair (0,−5) at the corner t=(2/3)2^(−5) has length −5. The printed proof writes an ordinary sum (source issue E310). All lengths i+l−s stay bounded. Frobenius iterates of their inner terms therefore involve finitely many powers q^(nk), giving one residue-valuation lower bound independent of the π-index. The shifts have a uniform lower π-index bound and bounded-s index sets are finite. These bounds give π-adic convergence and overconvergence, allowing the telescoping identity to be passed to the limit. Only the general ordinary Newton-polygon supplier remains G2.

### Public Dwork bound

The Euler product for the Artin–Hasse series, verified by its formal logarithm and the Möbius divisor sum, has p-integral binomial coefficients. It and its inverse therefore have integral coefficients. In the factorisation of θ, the j-th exponential factor for j≥2 contributes at degree k p^j a valuation at least

`k((p^j−1)/(p−1)−j) ≥ ((p−1)/p²) k p^j`.

The j=2 case is equality in the lower bound; the bound increases thereafter. The Artin–Hasse factor has degree-d valuation at least d/(p−1). Each coefficient of the product uses finitely many factors, so both θ and its inverse satisfy the positive linear bound. For p=2 it gives radius at least 2^(1/4), with convergence asserted on the open disc. This avoids using the divergent scalar exponential at a boundary point. Sperber–Voight state the bound for θ only, under their standing assumption p>2, and Dwork treats θ but not θ⁻¹; the estimate for θ⁻¹ and the case p=2 come from the factorisation above. The source’s Artin–Hasse normalisation and Li’s alternate gauge normalisation must not be silently identified.

With g(t)=θ(t⁻¹)⁻¹, logarithmic differentiation gives g′/g=π(t⁻²−p t^(−p−1)). Hence D(gw)=−pπt^(−p−1)gw when D(w)=−πt⁻²w, exactly the Frobenius chain rule. The new estimate proves the missing overconvergence input to the existing odd-p Dwork node; it does not redevelop that node’s break or Artin–Schreier classification.

### Failure of unrestricted bounded completion

Let |c|>1 in F and define φ(e₁)=e₁+[c]e₂, φ(e₂)=πe₂. The matrix has determinant π, so it preserves an integral lattice but is not bijective on it. The completed fixed vector e₁+y e₂ has

`y = Σⱼ≥0 π^j[c^(q^j)]`.

It solves y−πφ(y)=[c] but fails every positive overconvergence weight because the residue norms grow like |c|^(q^j). The highest generic slope-one line e₂ is bounded and descends; the complementary completed fixed line does not. This simultaneously detects the wrong integral hypothesis, an unrestricted completion full-faithfulness claim and an unconditional bounded direct-sum classification.

### Residue and duality checks

For the trivial module with ∂=d/dT, [T⁻¹] pairs with 1 to give 1. For ∂=(1+T)d/dT the representative [(1+T)/T] gives the same answer using dT/(1+T). The coefficient g=T⁻² detects a wrong one-form: its ordinary residue is zero, whereas Res(g dT/(1+T))=−1. An exact class pairs to zero by integration by parts.

For the constant nilpotent model d+A du/u, all nonzero Laurent degrees are invertible after integration on a smaller annulus, leaving H⁰=ker A and H¹=coker A. Evaluation pairs coker A with ker Aᵗ perfectly. This is the local calculation in the proof route; the finite-cover trace/descent comparison is still G5. DLB Proposition 6.4 is a consumer acceptance check, with de Rham, absolute irreducibility, dimension two and nontriangulinity hypotheses all present. Its N_rig and representation constructions are not new RD.1 targets.

## Target catalogue

Each ID below is new in this part. Every prerequisite displayed is a direct edge in the packet; IDs of the accepted main packet remain imports. The four definitions and constructions (the Katz candidate, rational-type radii, generic rotation and the residue pairing) carry all API and test items in the packet. Smaller proof calculations stay inside the target’s proof route.

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

**Sources.** [rd1-katz](https://web.math.princeton.edu/~nmk/old/simplealgorithm.pdf), Defining formula for c(e,t−a) and Theorems 1–2, p. 65; Remark (3), p. 68. Katz defines c(e,t−a) by this finite Taylor-corrected sum when (n−1)! is invertible; Remark (3) shows that for a badly chosen basis it can vanish.

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
- **line** (computation): n=1 gives e₀ without any hypothesis on x.
- **horizontal_two** (computation): D(e₀)=D(e₁)=0 gives c=e₀+xe₁, not e₀−xe₁.
- **bad_translation** (non-example): For a suitably chosen basis the candidate vanishes (Katz, Remark (3), p. 68): with e₀ cyclic, eᵢ=Dⁱe₀ for i≤n−2 and e_(n−1) solved from the formula, c(e,t)=0. So no single translation works for every basis, and the theorem has to use N translations.

**Check.**

- In a horizontal rank-two basis, c=e₀+xe₁ and its derivative is e₁ when ∂x=1.
- Allow n=0 in the definition; the positive-rank theorem states n>0 explicitly.

#### Katz determinant criterion

`PadicDifferentialEquationsAndRigidCohomology:RD.1/katz-determinant-criterion` · lemma

With ∂t=1 put c_i(e,X)=Σ_(j<n)(X^j/j!)c(i,j), where c(0,j) is the inner sum of the candidate (zero for j≥n) and c(i+1,j)=D(c(i,j))+c(i,j+1); equivalently c_i(e,X)=D^i c(e,X) for the candidate over R[X] with ∂X=1. Then c₀∧⋯∧c_(n−1)=P(X)e₀∧⋯∧e_(n−1) for a polynomial P∈R[X] with P(0)=1 and degree at most n(n−1), and for a constant a the vector c(e,t−a) is cyclic if and only if P(t−a) is a unit.

**Hypotheses.**

- n>0; (n−1)! invertible; R commutative; e a basis; the connection extends to R[X] by Leibniz.

**Proof route.**

1. Induction on i+j gives c(i,j)=Σ_k(−1)^k binom(j,k)D^k(e_(i+j−k)) for i+j≤n−1, so c(i,0)=eᵢ and c_i(e,0)=eᵢ: the coordinate matrix at X=0 is the identity.
2. Each jet column has X-degree at most n−1, so the determinant has degree at most n(n−1).
3. Specialisation at X=t−a commutes with D exactly when a is constant. Invertibility of the determinant is the basis criterion.

**Direct prerequisites.** `PadicDifferentialEquationsAndRigidCohomology:RD.1/katz-candidate`, `mathlib:Matrix.det`.

**Sources.** [rd1-katz](https://web.math.princeton.edu/~nmk/old/simplealgorithm.pdf), Proofs of Theorems 1–2, pp. 66–67. Katz's proof of Theorem 1 gives c(i,0)=eᵢ (p. 66); the proof of Theorem 2 gives the polynomial P with P(0)=1, degree at most n(n−1), and the equivalence between cyclicity of c(e,t−a) and P(t−a)∈R^× (p. 67).

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

#### Rational-type differential fields and intrinsic radii for several derivations

`PadicDifferentialEquationsAndRigidCohomology:RD.1/rational-type-intrinsic-radii` · definition

Let K be a complete nonarchimedean field of characteristic 0 and residue characteristic p, with commuting derivations ∂₁,…,∂ₘ. A derivation ∂ is of rational type with parameter u if ∂(u)=1, |∂|_K=|u|⁻¹ and |∂ⁿ/n!|_K≤|∂|_Kⁿ for all n≥1 (equivalently |∂|_sp,K=ω|∂|_K, ω=p^(−1/(p−1))); K is of rational type for u₁,…,uₘ if each ∂ⱼ is of rational type with parameter uⱼ and ∂ᵢ(uⱼ)=0 for i≠j. A ∂ⱼ-differential module is a finite projective K-module with an action of ∂ⱼ alone; a ∂_J-differential module carries commuting actions of all ∂ⱼ. For nonzero V the extrinsic ∂ⱼ-radius is R_∂ⱼ(V)=ω|∂ⱼ|_sp,V⁻¹, the intrinsic ∂ⱼ-radius is IR_∂ⱼ(V)=|∂ⱼ|_sp,K/|∂ⱼ|_sp,V=|uⱼ|R_∂ⱼ(V)∈(0,1], and the intrinsic radius is IR(V)=min_j IR_∂ⱼ(V); ∂ⱼ is dominant for V if IR_∂ⱼ(V)=IR(V). The intrinsic subsidiary radii IR(V;1)≤…≤IR(V;dim V) list the intrinsic radii of the Jordan–Hölder constituents with multiplicity; V has pure intrinsic radii if they are all equal. On a disc or annulus the profiles use F_η, the completion of K(t) for the η-Gauss norm, which is of rational type for ∂₀=d/dt (parameter t) together with ∂₁,…,∂ₘ.

**Hypotheses.**

- Residue characteristic p>0 for the targets here; the definitions also make sense for p=0, where ω=1.
- Spectral norms are computed for any norm on V compatible with K; they do not depend on that choice.

**Proof route.**

1. Rational type is KX Definition 1.4.1; the equivalence of the factorial bound with |∂|_sp,K=ω|∂|_K is KX Corollary 1.2.13, and Remark 1.4.2 gives |∂ⁿ/n!|_K=|u|^(−n) and IR_∂(V)=|u|R_∂(V).
2. Several derivations: KX Definitions 1.5.1–1.5.3; F_η is again of rational type for ∂₀,…,∂ₘ (KX Remark 1.5.4).
3. Taylor map: for each derivation the series x↦Σ_s ∂^s(x)T^s/s! is a continuous homomorphism, isometric for the Gauss norms of radius at most the parameter's absolute value (KX Lemma 1.2.12); for commuting derivations the multivariable series is the composite. Generic rotation uses this map.
4. For ∂₀=d/dt on F_η the intrinsic radius is R(E,η)/η, the main packet's toric radius T(E,η); this fixes the compatibility with generic-radius.

**Direct prerequisites.** `PadicDifferentialEquationsAndRigidCohomology:RD.1/generic-radius`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/spectral-norm-of-differential-module`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/differential-module`, `PadicDifferentialEquationsAndRigidCohomology:RD.0/derivation-on-robba-ring`.

**Sources.** [rd1-kx](https://arxiv.org/pdf/0804.1495v4), Lemma 1.2.12, p. 8; Definition 1.4.1 and Remarks 1.4.2–1.4.4, pp. 9–10; Lemma 1.4.5, pp. 10–11; Remark 1.4.23, p. 15; Definitions 1.5.1–1.5.3 and Remark 1.5.4, p. 16. KX define rational type, the intrinsic ∂ⱼ-radius and the intrinsic radius as the minimum over the derivations, with dominance and subsidiary radii; Remark 1.5.4 keeps F_η of rational type.

**Uses.**

- KX Theorems 2.2.5–2.2.6: the extrinsic profiles f^(j)ᵢ are −log of the subsidiary R_∂ⱼ of M⊗F_η
- KX Theorem 2.4.4 and Theorems 2.5.1–2.5.2: the intrinsic profiles and splittings use IR and its subsidiary radii
- KX Lemma 2.4.2: the rotated radius is the minimum of η·IR_∂₀ and η₊·IR_∂ⱼ
- KX Theorem 2.6.1 and the break decomposition: breaks are read from the intrinsic radii near the boundary

**Planning API.**

| Declaration | Role | Statement |
| --- | --- | --- |
| `IsRationalType` | constructor | IsRationalType ∂ u holds when ∂u=1, \|∂\|_K=\|u\|⁻¹ and \|∂ⁿ/n!\|_K≤\|∂\|_Kⁿ for every n≥1; for several derivations, each ∂ⱼ is of rational type for uⱼ and ∂ᵢuⱼ=0 for i≠j. |
| `IsRationalType.iff_spectralNorm` | characterisation | Given ∂u=1 and \|∂\|_K=\|u\|⁻¹, rational type holds if and only if \|∂\|_sp,K=ω\|∂\|_K. |
| `IsRationalType.parameter_iff` | characterisation | If u is a rational parameter then u′ is one if and only if ∂(u−u′)=0 and \|u−u′\|≤\|u\|. |
| `IsRationalType.add_const` | characterisation | If u is a rational parameter for ∂, ∂c=0 and \|c\|≤\|u\|, then u+c is a rational parameter (the converse half of IsRationalType.parameter_iff is immediate); this uses the ultrametric inequality. |
| `IsRationalType.gaussCompletion` | instance | If K is of rational type for u₁,…,uₘ, then F_η is of rational type for u₁,…,uₘ,t with ∂₀=d/dt. |
| `IsRationalType.tame` | functoriality | The unique extension of ∂ to a complete tamely ramified extension L/K is of rational type with the same parameter. |
| `IsRationalType.taylor` | data | The Taylor series x↦Σ_I ∂^I(x)T^I/I! is a continuous homomorphism K→K⟦T₁/\|u₁\|,…,Tₘ/\|uₘ\|⟧₀, isometric for the Gauss norms of radii at most \|uⱼ\|. |
| `intrinsicRadius` | data | IR(V)=min_j IR_∂ⱼ(V) with IR_∂ⱼ(V)=\|∂ⱼ\|_sp,K/\|∂ⱼ\|_sp,V, and the subsidiary multiset IR(V;·) from the Jordan–Hölder constituents. |
| `intrinsicRadius_eq_parameter_mul` | compatibility | IR_∂ⱼ(V)=\|uⱼ\|·R_∂ⱼ(V) for every nonzero ∂ⱼ-differential module V. |
| `intrinsicRadius_exact` | structure | In a short exact sequence the subsidiary multiset of the middle term is the union of those of the ends; duals have the same intrinsic subsidiary radii. |
| `intrinsicRadius_baseChange` | compatibility | Intrinsic radii are unchanged by a complete extension of K whose derivations are again of rational type with the same parameters. |
| `intrinsicRadius_toric` | compatibility | For a ∇-module E on an annulus and ∂₀=d/dt on F_η, IR_∂₀(E⊗F_η)=T(E,η)=R(E,η)/η. |

**Unit tests.**

- **trivial_line** (degenerate): For V=K with the derivations of K acting, IR_∂ⱼ(V)=1 for every j and IR(V)=1.
- **parameter_nonzero** (non-example): u=0 is never a rational parameter, since ∂(0)=0≠1; so IsRationalType ∂ u forces u≠0.
- **toric_match** (compatibility): For a ∇-module E on an annulus, IR_∂₀(E⊗F_η)=R(E,η)/η; for the trivial line this is 1 while R=η.
- **visible_line** (computation): K the completion of Q_p(u) for the 1-Gauss norm, ∂=d/du, V=K·v with ∂v=av for a∈Q_p with |a|>1: IR_∂(V)=ω/|a|; for a=p^(−1) this is p^(−p/(p−1)).
- **dominance** (non-example): On F_η with |uⱼ|=1, the line with ∂₀v=0 and ∂ⱼv=av (a∈Q_p, |a|>1) has IR_∂₀=1 but IR=IR_∂ⱼ=ω/|a|<1: ∂₀ is not dominant, and the t-radius alone does not compute IR.

**Check.**

- For m=0 and ∂₀ on F_η, IR(E⊗F_η)=R(E,η)/η, the main packet's T(E,η).
- A trivial line has IR=1, while its extrinsic ∂₀-radius is η: the intrinsic and extrinsic profiles differ by r.

#### Frobenius antecedents and descendants for a rational-type derivation

`PadicDifferentialEquationsAndRigidCohomology:RD.1/partial-frobenius-descendant` · theorem

Let ∂ be of rational type on K with parameter u, p>0. The ∂-Frobenius ϕ^(∂)*:K^(∂)↪K is the inclusion of the fixed field of the action i↦(x↦Σ_s ∂^s(x)((ζ_p^i−1)u)^s/s!) of Z/pZ (by Galois descent when ζ_p∉K); K^(∂) carries ∂′=∂/(pu^(p−1)), of rational type with parameter u^p. For a ∂-differential module V, the descendant ϕ^(∂)_*V (restriction of scalars, with ∂′) has intrinsic subsidiary radii obtained by replacing each r∈IR_∂(V) by r^p together with p^(−p/(p−1)) (p−1 times) if r>p^(−1/(p−1)), and by p^(−1)r (p times) if r≤p^(−1/(p−1)). If IR_∂(V)>p^(−1/(p−1)) there is a unique ∂′-module V′ with V≅ϕ^(∂)*V′ and IR_∂′(V′)>p^(−p/(p−1)), and then IR_∂′(V′)=IR_∂(V)^p. For V′ with IR_∂′(V′)≠p^(−p/(p−1)), IR_∂(ϕ^(∂)*V′)=min{IR_∂′(V′)^(1/p), p·IR_∂′(V′)}. With several derivations the others remain of rational type on K^(∂ⱼ).

**Hypotheses.**

- K is a complete nonarchimedean characteristic-zero field, with positive residue characteristic p, commuting rational-type coefficient derivations ∂₁,…,∂ₘ and parameters uⱼ (rational-type-intrinsic-radii). KX Hypothesis 2.0.1 also allows residue characteristic 0; that case is not needed here.
- p>0; V is a nonzero finite-dimensional ∂-differential module.

**Proof route.**

1. KX Lemmas 1.4.8–1.4.9 compute |∂′|=|u|^(−p) and show ∂′ is of rational type with parameter u^p; their proofs are in KX.
2. The antecedent (KX Proposition 1.4.17) is proved as in book Theorem 10.4.2; the descendant radii (KX Theorem 1.4.19) as in book Theorem 10.5.1. These book proofs are part of gap G1.
3. Corollary 1.4.20 follows from Theorem 1.4.19 and the decomposition ϕ^(∂)*ϕ^(∂)_*V′≅⊕_(n<p)V′⊗W_n of KX Lemma 1.4.15(d), where W_n is the line with ∂′v=(n/p)u^(−p)v and IR_∂′(W_n)=p^(−p/(p−1)) for n≠0.
4. For ∂=d/dt in the coordinate t this is the main packet's Christol–Dwork antecedent (frobenius-antecedent); the coefficient derivations need this rational-type version, since the main node is stated for the coordinate t of an annulus, whereas K^(∂ⱼ) is the fixed field of a Z/pZ-action on a general rational-type field.

**Direct prerequisites.** `PadicDifferentialEquationsAndRigidCohomology:RD.1/rational-type-intrinsic-radii`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/frobenius-antecedent`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/christol-dwork-newton-polygon`.

**Sources.** [rd1-kx](https://arxiv.org/pdf/0804.1495v4), Construction 1.4.7 to Corollary 1.4.20, pp. 11–15; Remark 1.5.5, p. 16. KX construct the ∂-Frobenius, prove ∂′ is of rational type, and state the antecedent theorem and the descendant radii, citing the book for the last two proofs.

**Check.**

- For the trivial line (r=1) the descendant is ⊕_(n<p)W_n, with intrinsic radii 1 and p^(−p/(p−1)) (p−1 times).
- A line of intrinsic radius r≤p^(−1/(p−1)) descends to p constituents of radius r/p.

#### Decomposition by intrinsic radii over a rational-type field

`PadicDifferentialEquationsAndRigidCohomology:RD.1/intrinsic-radius-decomposition` · theorem

Let K be of rational type for ∂₁,…,∂ₘ. Every ∂_J-differential module V over K decomposes as V=⊕_(r∈(0,1]) V_r, where every subquotient of V_r has pure intrinsic radii r; for one derivation this is the decomposition by intrinsic ∂-radii. If p=0 then r^(dim V_r)∈|K^×|; if p>0 and h≥0, then r<p^(−p^(−h)/(p−1)) implies r^(dim V_r)∈|K^×|^(1/p^h).

**Hypotheses.**

- K complete nonarchimedean of characteristic 0, of rational type for u₁,…,uₘ; any residue characteristic.
- V a finite-dimensional ∂_J-differential module; the decomposition is by ∂_J-submodules and is unique.

**Proof route.**

1. One derivation: below the visibility bound this is Robba's decomposition (robba-factorization-and-radius-decomposition); beyond it, iterate Frobenius descendants (partial-frobenius-descendant) as in book Theorems 10.6.2 and 10.7.1, which KX cite for Theorem 1.4.21 (gap G1). The value-group statement comes from the Newton-polygon slopes.
2. Several derivations: each ∂ⱼ-decomposition is stable under every ∂ᵢ, since the projection of ∂ᵢ(V_r) to V_(r′) is K-linear and ∂ⱼ-equivariant between modules with disjoint radii, hence zero; take the common refinement (KX's proof of Theorem 1.5.6).

**Direct prerequisites.** `PadicDifferentialEquationsAndRigidCohomology:RD.1/rational-type-intrinsic-radii`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/partial-frobenius-descendant`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/robba-factorization-and-radius-decomposition`.

**Sources.** [rd1-kx](https://arxiv.org/pdf/0804.1495v4), Theorem 1.4.21 and Remark 1.4.22, p. 15; Theorem 1.5.6 and proof, p. 16. KX state the decomposition by intrinsic radii for one rational-type derivation and deduce it for several by a common refinement.

**Check.**

- A module with pure intrinsic radii has a single summand.
- For m=0 and ∂₀ on F_η the summands are those of the main packet's decomposition of E⊗F_η by subsidiary radii.

#### Extrinsic subsidiary-radius variation

`PadicDifferentialEquationsAndRigidCohomology:RD.1/extrinsic-partial-radius-variation` · theorem

For the ∂₀-connection, order subsidiary radii R₁≤…≤R_d; set fᵢ(r)=−log Rᵢ(M,e^(−r)) and Fᵢ=Σⱼ≤i fⱼ. All fᵢ and Fᵢ are continuous and piecewise affine; Fᵢ is convex, and its affine slopes are integral whenever i=d or fᵢ>fᵢ₊₁. In general slopes of fᵢ lie in the union of (1/e)ℤ for 1≤e≤d. On a disc, slopes of Fᵢ are nonpositive where fᵢ>r, and fᵢ=r for sufficiently large r.

**Hypotheses.**

- K is a complete nonarchimedean characteristic-zero field, with positive residue characteristic p, commuting rational-type coefficient derivations ∂₁,…,∂ₘ and parameters uⱼ (rational-type-intrinsic-radii). KX Hypothesis 2.0.1 also allows residue characteristic 0; that case is not needed here.
- ∂ⱼuⱼ=1, ∂ⱼuₖ=0 for j≠k, ‖∂ⱼ‖=|uⱼ|⁻¹ and the rational-type factorial bounds hold; ∂₀=d/dt.
- M is a nonzero finite locally free coherent module with the indicated continuous integrable connection on A¹_K(I), rank d. η=e^(−r) lies in I.

**Proof route.**

1. Reduce at small radii to a cyclic twisted polynomial and its Newton polygon; use the imported spectral and transfer statements.
2. For nonvisible radii use Frobenius pushforward/antecedents and recover individual slopes by subtracting partial sums.
3. The full ∂₀ argument in KX is a reference to book Theorem 11.3.2; gap G1 records the unverified analytic input rather than declaring this proof closed.

**Direct prerequisites.** `PadicDifferentialEquationsAndRigidCohomology:RD.1/rational-type-intrinsic-radii`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/generic-radius`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/generic-radius-basic-properties`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/christol-dwork-newton-polygon`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/frobenius-antecedent`, `PadicDifferentialEquationsAndRigidCohomology:RD.0/robba-ring`.

**Sources.** [rd1-kx](https://arxiv.org/pdf/0804.1495v4), Theorem 2.2.5, p. 20; Hypothesis 2.0.1, p. 18; Notation 2.2.4, p. 19. This is the extrinsic profile, with eventual fᵢ=r on a disc.

**Check.**

- A trivial ∂₀-line has R=η and f=r.
- Order f₁≥…≥f_d; do not sum the smallest negative logarithms.

#### Coefficient-derivation radius variation

`PadicDifferentialEquationsAndRigidCohomology:RD.1/coefficient-partial-radius-variation` · theorem

For a fixed coefficient derivation ∂ⱼ, define fᵢ and Fᵢ from extrinsic ∂ⱼ subsidiary radii as above. They are continuous, Fᵢ is convex, and they are piecewise affine wherever fᵢ>−log|uⱼ|. On the region fᵢ>(log p)/(p^n(p−1))−log|uⱼ|, slopes of Fᵢ at a total sum or strict gap lie in p^(−n)ℤ and individual slopes lie in the union of (1/(p^n e))ℤ, 1≤e≤d. On a disc Fᵢ has nonpositive slopes.

**Hypotheses.**

- K is a complete nonarchimedean characteristic-zero field, with positive residue characteristic p, commuting rational-type coefficient derivations ∂₁,…,∂ₘ and parameters uⱼ (rational-type-intrinsic-radii). KX Hypothesis 2.0.1 also allows residue characteristic 0; that case is not needed here.
- ∂ⱼuⱼ=1, ∂ⱼuₖ=0 for j≠k, ‖∂ⱼ‖=|uⱼ|⁻¹ and the rational-type factorial bounds hold; ∂₀=d/dt.
- M is a nonzero finite locally free coherent module with the indicated continuous integrable connection on A¹_K(I), rank d. η=e^(−r) lies in I.
- j∈{1,…,m}; n≥0 in the visibility-threshold assertion.

**Proof route.**

1. Use an almost-isometric basis and a cyclic vector for ∂ⱼ. The visible spectral radii come from the coefficient Newton polygon (KX Proposition 2.2.2 and Lemma 2.2.3).
2. Away from visibility apply the ∂ⱼ-Frobenius descendant (partial-frobenius-descendant, KX Theorem 1.4.19), separate its subsidiary spectrum and induct on the threshold n; the scaling introduces p^(−n).
3. Continuity follows from the spectral norms; convexity follows from the Newton polygon and induction. The isometric-basis and contraction suppliers cited only to the unread book remain G1.

**Direct prerequisites.** `PadicDifferentialEquationsAndRigidCohomology:RD.1/rational-type-intrinsic-radii`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/generic-radius-basic-properties`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/christol-dwork-newton-polygon`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/partial-frobenius-descendant`, `PadicDifferentialEquationsAndRigidCohomology:RD.0/robba-ring`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/katz-local-global-algorithm`.

**Sources.** [rd1-kx](https://arxiv.org/pdf/0804.1495v4), Theorem 2.2.6 and proof, pp. 20–22; Proposition 2.2.2 and Lemma 2.2.3, p. 19. The coefficient theorem has a visibility restriction; it alone does not supply strong intrinsic integrality.

**Check.**

- Do not claim piecewise affinity at fᵢ=−log|uⱼ| from this theorem alone.
- At threshold n=0 the asserted partial slopes are integers.

#### Intersection descent of annular projectors

`PadicDifferentialEquationsAndRigidCohomology:RD.1/annular-projector-descent` · lemma

For domains R=S∩T inside U and a finite locally free R-module M, M=(M⊗S)∩(M⊗T) inside M⊗U. Direct-sum decompositions (equivalently idempotent endomorphisms) of M⊗S and of M⊗T that agree on M⊗U come from a unique decomposition of M. Thus compatible spectral projectors on overlapping annular charts glue.

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

On an open annulus A¹_K(α,β) with 0≤α<β, if Fᵢ for one derivation is affine on (−logβ,−logα) and fᵢ>fᵢ₊₁ throughout, 1≤i<d, there is a unique differential direct-sum decomposition whose first summand has exactly the first i subsidiary radii at every η.

**Hypotheses.**

- K is a complete nonarchimedean characteristic-zero field, with positive residue characteristic p, commuting rational-type coefficient derivations ∂₁,…,∂ₘ and parameters uⱼ (rational-type-intrinsic-radii). KX Hypothesis 2.0.1 also allows residue characteristic 0; that case is not needed here.
- ∂ⱼuⱼ=1, ∂ⱼuₖ=0 for j≠k, ‖∂ⱼ‖=|uⱼ|⁻¹ and the rational-type factorial bounds hold; ∂₀=d/dt.
- M is a nonzero finite locally free coherent module with the indicated continuous integrable connection on A¹_K(I), rank d. η=e^(−r) lies in I.
- Fix ∂₀ or one ∂ⱼ; no assertion of global freeness for either summand.

**Proof route.**

1. On closed subannuli use affine log norms at a Newton-polygon vertex to obtain unit coefficients and two coprime characteristic factors (KX Lemmas 2.3.3–2.3.4).
2. In the visible coefficient case the separation of factors gives a spectral projector by an iterative contraction; the quantitative contraction is the unread book input G1. The ∂₀ branch is book Theorem 12.4.2.
3. Use uniqueness of the radius-separated projector and intersection descent to glue over the open annulus.

**Direct prerequisites.** `PadicDifferentialEquationsAndRigidCohomology:RD.1/rational-type-intrinsic-radii`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/extrinsic-partial-radius-variation`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/coefficient-partial-radius-variation`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/annular-projector-descent`, `PadicDifferentialEquationsAndRigidCohomology:RD.0/units-of-robba-ring`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/robba-factorization-and-radius-decomposition`.

**Sources.** [rd1-kx](https://arxiv.org/pdf/0804.1495v4), Theorem 2.3.5 and proof, pp. 23–24; Lemmas 2.3.3–2.3.4, p. 23; Caution 2.3.6, p. 25. The decomposition is a sheaf statement on an open annulus, subject to affineness and a persistent gap.

**Check.**

- Removing affineness is not licensed by a pointwise spectral gap.
- Each summand is locally free; a chosen free presentation on every closed subannulus is sufficient for the proof.

#### Generic rotation

`PadicDifferentialEquationsAndRigidCohomology:RD.1/generic-rotation` · construction

Normalise |uⱼ|=1. For η₊>0, let K̃ be the completed Gauss field K(x₁,…,xₘ) with |xⱼ|=η₊⁻¹. On |t|<η₊ define the Taylor homomorphism uⱼ↦uⱼ+xⱼt, fixing t. Pull M back and use the rotated ∂₀=∂₀+Σxⱼ∂ⱼ. For 0<η<η₊ its ∂₀ extrinsic radius is min{η IR_∂₀(M,η), η₊ IR_∂ⱼ(M,η):1≤j≤m}.

**Hypotheses.**

- K is a complete nonarchimedean characteristic-zero field, with positive residue characteristic p, commuting rational-type coefficient derivations ∂₁,…,∂ₘ and parameters uⱼ (rational-type-intrinsic-radii). KX Hypothesis 2.0.1 also allows residue characteristic 0; that case is not needed here.
- ∂ⱼuⱼ=1, ∂ⱼuₖ=0 for j≠k, ‖∂ⱼ‖=|uⱼ|⁻¹ and the rational-type factorial bounds hold; ∂₀=d/dt.
- M is a nonzero finite locally free coherent module with the indicated continuous integrable connection on A¹_K(I), rank d. η=e^(−r) lies in I.
- The Taylor series converges under the rational-type bounds and strict η<η₊; coefficients are extended to the Gauss completion.

**Proof route.**

1. Construct the injective isometric Taylor homomorphism from the multivariable Taylor series of the rational-type derivations (KX Lemma 1.2.12 and Notation 2.4.1; API item rationalType_taylor), and pullback of the finite locally free module on the strict subannulus.
2. Apply the connection chain rule. Generic independent xⱼ prevent cancellation in the spectral norm, giving the minimum formula.
3. Use scalar-extension invariance and uniqueness of radius blocks for its splitting applications.

**Direct prerequisites.** `PadicDifferentialEquationsAndRigidCohomology:RD.1/rational-type-intrinsic-radii`, `PadicDifferentialEquationsAndRigidCohomology:RD.0/robba-ring-flat-base-change`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/generic-radius-basic-properties`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/differential-module`.

**Sources.** [rd1-kx](https://arxiv.org/pdf/0804.1495v4), Notation 2.4.1 and Lemma 2.4.2, p. 26; Lemma 1.2.12, p. 8. Rotation converts competing coefficient directions into a single annular derivative.

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
- **horizontal** (computation): A horizontal trivial line has rotated radius η since all IR=1.
- **coefficient_dominates** (computation): A pure coefficient line with IR_∂ⱼ=c and c<η/η₊ has rotated radius η₊c.
- **boundary** (non-example): The radius identity has a strict η<η₊ hypothesis; it cannot define a boundary Taylor pullback.

**Check.**

- Keep η₊ in the coefficient-radius terms; replacing it by η changes the formula.
- The construction has no claim of convergence on the boundary η=η₊.

#### Intrinsic subsidiary-radius variation

`PadicDifferentialEquationsAndRigidCohomology:RD.1/intrinsic-partial-radius-variation` · theorem

For the full commuting connection, order intrinsic subsidiary radii IR₁≤…≤IR_d≤1 and put fᵢ=−log IRᵢ and Fᵢ=Σⱼ≤i fⱼ. All profiles are continuous and piecewise affine; Fᵢ is convex and has integral slopes at i=d or a strict gap fᵢ>fᵢ₊₁. Individual slopes lie in the union of (1/e)ℤ, 1≤e≤d. On a disc Fᵢ has nonpositive slopes and is constant for sufficiently large r.

**Hypotheses.**

- K is a complete nonarchimedean characteristic-zero field, with positive residue characteristic p, commuting rational-type coefficient derivations ∂₁,…,∂ₘ and parameters uⱼ (rational-type-intrinsic-radii). KX Hypothesis 2.0.1 also allows residue characteristic 0; that case is not needed here.
- ∂ⱼuⱼ=1, ∂ⱼuₖ=0 for j≠k, ‖∂ⱼ‖=|uⱼ|⁻¹ and the rational-type factorial bounds hold; ∂₀=d/dt.
- M is a nonzero finite locally free coherent module with the indicated continuous integrable connection on A¹_K(I), rank d. η=e^(−r) lies in I.

**Proof route.**

1. Decompose the fibre at the boundary radius by intrinsic radii (intrinsic-radius-decomposition), then use the half-open local decompositions of KX Lemma 2.3.8 and Theorems 2.3.9–2.3.10 to partition constituents according to their dominant derivation near a radius; their precise analytic inputs are included in G1.
2. Rotate a coefficient-dominant block into a t-block and apply the extrinsic strong-integrality theorem.
3. If θᵢ is the number of t-dominant constituents among the first i, compare one-sided slopes: (Fᵢ,rot)′₊−θᵢ≤Fᵢ′₊ and (Fᵢ,rot)′₋−θᵢ≥Fᵢ′₋. This yields convexity and the integral partial slopes.
4. At the maximum radius, convexity and discrete possible slopes force local finite piecewise affinity. Transfer on a disc gives eventual constancy.

**Direct prerequisites.** `PadicDifferentialEquationsAndRigidCohomology:RD.1/rational-type-intrinsic-radii`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/intrinsic-radius-decomposition`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/generic-rotation`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/extrinsic-partial-radius-variation`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/coefficient-partial-radius-variation`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/affine-gap-annular-splitting`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/dwork-transfer-generic-disc`.

**Sources.** [rd1-kx](https://arxiv.org/pdf/0804.1495v4), Theorem 2.4.4 and proof, pp. 27–30. The intrinsic theorem strengthens the coefficient theorem by generic rotation and a dominant-direction count.

**Check.**

- A horizontal line has f=0, in contrast with the extrinsic f=r.
- The first i are the largest negative logarithms, preserving multiplicities.

#### Intrinsic annular decomposition

`PadicDifferentialEquationsAndRigidCohomology:RD.1/intrinsic-annular-splitting` · theorem

On A¹_K(α,β), 0≤α<β, if the intrinsic Fᵢ is affine and fᵢ>fᵢ₊₁ throughout, there is a unique decomposition of M into integrable differential summands with the first i and remaining subsidiary intrinsic radii respectively.

**Hypotheses.**

- K is a complete nonarchimedean characteristic-zero field, with positive residue characteristic p, commuting rational-type coefficient derivations ∂₁,…,∂ₘ and parameters uⱼ (rational-type-intrinsic-radii). KX Hypothesis 2.0.1 also allows residue characteristic 0; that case is not needed here.
- ∂ⱼuⱼ=1, ∂ⱼuₖ=0 for j≠k, ‖∂ⱼ‖=|uⱼ|⁻¹ and the rational-type factorial bounds hold; ∂₀=d/dt.
- M is a nonzero finite locally free coherent module with the indicated continuous integrable connection on A¹_K(I), rank d. η=e^(−r) lies in I.
- 1≤i<d; I=(α,β) with 0≤α<β.

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

On the open disc A¹_K[0,β), if Fᵢ is affine for r>−logβ, it is constant. If fᵢ>fᵢ₊₁ for all (equivalently, by the constancy, for one) such r, the unique intrinsic decomposition extends across t=0 as a decomposition of locally free integrable differential modules.

**Hypotheses.**

- K is a complete nonarchimedean characteristic-zero field, with positive residue characteristic p, commuting rational-type coefficient derivations ∂₁,…,∂ₘ and parameters uⱼ (rational-type-intrinsic-radii). KX Hypothesis 2.0.1 also allows residue characteristic 0; that case is not needed here.
- ∂ⱼuⱼ=1, ∂ⱼuₖ=0 for j≠k, ‖∂ⱼ‖=|uⱼ|⁻¹ and the rational-type factorial bounds hold; ∂₀=d/dt.
- M is a nonzero finite locally free coherent module with the indicated continuous integrable connection on A¹_K(I), rank d. η=e^(−r) lies in I.
- 1≤i<d; the disc includes its centre.

**Proof route.**

1. The disc profile is eventually constant and convex with nonpositive slopes; affineness therefore makes it constant everywhere.
2. Transfer identifies the module near zero with a pullback from its differential fibre over K; decompose that fibre by its intrinsic radii (intrinsic-radius-decomposition; KX cites its Theorem 1.4.21).
3. Glue the central decomposition to the unique annular splitting. The all-derivations compatibility is retained.

**Direct prerequisites.** `PadicDifferentialEquationsAndRigidCohomology:RD.1/intrinsic-partial-radius-variation`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/intrinsic-annular-splitting`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/dwork-transfer-generic-disc`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/intrinsic-radius-decomposition`.

**Sources.** [rd1-kx](https://arxiv.org/pdf/0804.1495v4), Theorem 2.5.2 and proof, p. 31. Affineness on a disc forces constancy, permitting extension through the centre.

**Check.**

- A punctured-disc decomposition alone does not establish centre extension.
- Include t=0 in the acceptance chart.

#### Boundary break and Swan-integrality proof support

`PadicDifferentialEquationsAndRigidCohomology:RD.1/boundary-break-proof` · application

For a module solvable at the outer boundary, the full intrinsic partial profiles are eventually affine with nonnegative rational slopes. The imported break decomposition is obtained by repeatedly splitting at strict gaps, and the total break multiplicity sum is integral.

**Hypotheses.**

- K is a complete nonarchimedean characteristic-zero field, with positive residue characteristic p, commuting rational-type coefficient derivations ∂₁,…,∂ₘ and parameters uⱼ (rational-type-intrinsic-radii). KX Hypothesis 2.0.1 also allows residue characteristic 0; that case is not needed here.
- ∂ⱼuⱼ=1, ∂ⱼuₖ=0 for j≠k, ‖∂ⱼ‖=|uⱼ|⁻¹ and the rational-type factorial bounds hold; ∂₀=d/dt.
- M is a nonzero finite locally free coherent module with the indicated continuous integrable connection on A¹_K(I), rank d. η=e^(−r) lies in I.
- Normalise the outer boundary to 1; IRᵢ→1 as η→1⁻.

**Proof route.**

1. Continuity, convexity and discrete slopes from the intrinsic-profile theorem force stable affine slopes near the boundary.
2. Apply intrinsic annular splitting to each strict gap; combine equal profiles into a break block.
3. The total partial slope is integral. Since Fᵢ sums the largest fⱼ, the first block is the smallest radius/largest break. This supplies the interior proof without redefining break or Swan conductor.

**Direct prerequisites.** `PadicDifferentialEquationsAndRigidCohomology:RD.1/intrinsic-partial-radius-variation`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/intrinsic-annular-splitting`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/solvable-at-boundary`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/break-decomposition`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/swan-conductor-integrality`.

**Sources.** [rd1-kx](https://arxiv.org/pdf/0804.1495v4), Theorem 2.6.1, pp. 32–33, with Theorems 2.4.4 and 2.5.1. The boundary application uses the annular decomposition, correcting the printed disc citation (source issue E302); the proof's opening index l should read i (E311).

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
6. For each index in T, the oriented finite geometric sum of length i+l−s gives b₂ (the source writes an ordinary sum from j=1 to i+l−s, but i+l−s can be negative for small corners, so the oriented convention is needed for its telescoping identity: source issue E310) with A=r(z)+πσ^n(b₂)−b₂. The integers i+l−s are uniformly bounded, so all summation k lie in one finite set of integers. Each unshifted summand has every partial valuation ≥h(τ), and σ^(nk) multiplies this bound by one of finitely many q^(nk). The π shifts have a uniform lower index bound; bounded-s index sets are finite. These facts give a uniform residue-valuation lower bound, π-adic convergence and overconvergence. Set b=−b₁−b₂; since a≠0 the pair is nonzero. G2 records only the ordinary Newton-polygon supplier still missing.

**Direct prerequisites.** `PadicDifferentialEquationsAndRigidCohomology:RD.1/puiseux-root-input`, `PadicDifferentialEquationsAndRigidCohomology:RD.0/semiunit-presentation`, `PadicDifferentialEquationsAndRigidCohomology:RD.0/analytic-ring-membership-and-intersections`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/cohomology-of-rank-one-frobenius-modules`, `PadicDifferentialEquationsAndRigidCohomology:RD.0/extended-robba-ring`.

**Sources.** [rd1-monodromy](https://annals.math.princeton.edu/wp-content/uploads/annals-v160-n1-p04.pdf), Lemma 4.12 and entire proof, published pp. 148–151; arXiv v4 pp. 52–54. The plan includes the corner, recursive lifting, bilateral series and telescoping correction beyond the accepted first step; the source does not state why a≠0, which the plan proves, and its b₂ sum needs the oriented convention (E310).

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

- p prime, including p=2, for the coefficient estimate and overconvergence; the imported Dwork module's break and Artin–Schreier statements keep their odd-p hypothesis. The analytic evaluation is of the extended formal series, not necessarily of the scalar exponential.
- The coefficient Frobenius fixes π and sends t to t^p for this example.

**Proof route.**

1. Factor θ=E_p(πX)∏ⱼ≥2 exp(−π^(p^j)X^(p^j)/p^j); the X^p term cancels because π^p/p=−π.
2. For degree k p^j in the j-th exponential, v_p≥k((p^j−1)/(p−1)−j)≥α k p^j for j≥2. The E_p factor and its inverse have degree-d valuation ≥d/(p−1).
3. Finite coefficient convolutions preserve the α-degree bound. The same argument with signs reversed handles θ⁻¹. Their formal product is 1, so they are inverse analytic functions on the open disc.
4. Substitute X=t⁻¹ to obtain an annulus |t|>p^(−α), including inner radii below 1. Differentiate the Frobenius factor and verify the chain rule for D(w)=−πt⁻²w.

**Direct prerequisites.** `PadicDifferentialEquationsAndRigidCohomology:RD.1/artin-hasse-integrality`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/dwork-exponential-module`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/frobenius-differential-module`, `PadicDifferentialEquationsAndRigidCohomology:RD.0/derivation-on-robba-ring`.

**Sources.** [rd1-sparse](https://arxiv.org/pdf/1112.4881), §1, estimate (1.4), PDF p. 6. Sperber–Voight state ord_p λ_i ≥ i(p−1)/p² for the coefficients of θ, under their §1 standing assumption p>2. The estimate for θ⁻¹ and the case p=2 come from the factorisation argument supplied here. [rd1-dwork](https://www.numdam.org/item/10.1007/BF02684275.pdf), §4(a), Lemma 4.1 and its proof, pp. 55–57. Dwork factors his splitting functions through the Artin–Hasse series and proves membership in L((p−1)/p²,0) for θ₁ = exp(π(t−t^p)); he does not treat θ⁻¹ separately. [rd1-li](https://bimsa.net/doc/publication/1445.pdf), Proposition 2.1 and proof, PDF pp. 4–5. Li bounds a different gauge factor R and its inverse (R, R⁻¹ ∈ L(b₀), b₀=min{1/(p−1),(p−1)/p}) by the same Artin–Hasse factorisation, with a different normalisation; it confirms the method, not this exact bound.

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
- The argument is Kedlaya's, proved in the monodromy paper for a perfect algebraic extension of k((t)) (a 'valued field' there, §2.2, p. 102); for FF's complete perfect F the Galois-descent step uses FF Proposition 11.2.15 and the extended-ring step is SFR Proposition 5.4.3 (any K). This extension of Kedlaya's setting is part of the coefficient-ring comparison G3.

**Proof route.**

1. Take the highest completed slope submodule. Its determinant is a rank-one Frobenius line in an exterior power.
2. In rank one choose λ with the highest slope and a completed eigenbasis vᵢ. Approximate it by bounded overconvergent wᵢ so λwᵢ=ΣⱼBᵢⱼF(wⱼ), with B mod π=diag(1,0,…,0). For v₁=Σcᵢwᵢ use σ(cᵢ)=ΣⱼBⱼᵢcⱼ. Choose r with w_r(B)≥0; induction in the π-index gives rv_h(cᵢ)+h≥0. At h=0 the coordinates reduce to δᵢ₁, not all to zero. Thus the determinant line has overconvergent coordinates. Apply the imported saturated exterior-power descent and the RD.0 intersection statement to descend from the algebraic extension.
3. Pass to the quotient and induct on rank. Completed uniqueness and injectivity give uniqueness over E†. For the graded standard forms when F is algebraically closed, apply the fixed-slope completion comparison (isoclinic-completion-comparison) to each isoclinic graded piece; the source instead repeats the eigenvector descent on each piece and applies its Proposition 5.3. Full faithfulness on mixed slopes is never used.

**Direct prerequisites.** `PadicDifferentialEquationsAndRigidCohomology:RD.1/saturated-subobject-descent-via-exterior-power`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/dieudonne-manin-classical`, `PadicDifferentialEquationsAndRigidCohomology:RD.0/completion-versus-overconvergence`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/isoclinic-completion-comparison`.

**Sources.** [rd1-monodromy](https://annals.math.princeton.edu/wp-content/uploads/annals-v160-n1-p04.pdf), Proposition 5.11 and proof, pp. 164–165; §2.2, p. 102; arXiv v4 pp. 66–67. Kedlaya descends the highest generic slope first, giving decreasing bounded slopes, for a perfect algebraic extension of k((t)); the printed proof has the slips E308 and E309. [rd1-ff](https://www.imo.universite-paris-saclay.fr/~fontaine/courbe.pdf), Proposition 11.2.24 p. 378, with accepted main source issues E218/E219. The corrected statement is filtration descent and fixed-slope comparison, not equivalence on all objects. [rd1-sfr](https://arxiv.org/pdf/math/0504204v4), Lemma 5.4.1, Definition 5.4.2 and Proposition 5.4.3, preprint pp. 57–58. Kedlaya's later version: the reverse filtration descends from Γ^alg[π⁻¹] to Γ^alg_con[π⁻¹] for any K, by descending slope-zero eigenvectors.

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

1. Backward Frobenius reduces residue-coefficient growth by q^(−hm), while π^(dm) gives a linearly increasing integral valuation. This produces one positive convergence radius for the tail: if r·v_k(x)+k≥C for all k, then each term π^(dm)σ^(−hm)(x) satisfies the same bound with C+dm in place of C.
2. Telescope finite partial sums; their remaining error tends to zero in the analytic and π-adic topologies.
3. This is the FF coefficient/iterate transport of the imported negative-slope rank-one cohomology, not a new claim of Ext vanishing in both slope directions.

**Direct prerequisites.** `PadicDifferentialEquationsAndRigidCohomology:RD.1/cohomology-of-rank-one-frobenius-modules`, `PadicDifferentialEquationsAndRigidCohomology:RD.0/analytic-ring-membership-and-intersections`.

**Sources.** [rd1-sfr](https://arxiv.org/pdf/math/0504204v4), Proposition 3.3.7(c), preprint pp. 34–35, n<0 with σ replaced by σ^h. SFR 3.3.7(c) gives H¹=0 for negative n over Γ_con[π⁻¹] (here with σ replaced by σ^h). Its proof splits x into two parts with backward and forward series; for x∈Γ_con[π⁻¹] the forward part is zero and the solution is the backward series used here (p. 36). The published erratum replaces the Teichmüller presentations in this proof by strong semiunit presentations; the bounded case needs only partial valuations of Witt-vector expansions. [rd1-sfr-erratum](https://emis.muni.cz/journals/DMJDMV/vol-12/09.pdf), p. 361. The proof of SFR Proposition 3.3.7(c) is repaired with strong semiunit presentations; the statement is unchanged. [rd1-ff](https://www.imo.universite-paris-saclay.fr/~fontaine/courbe.pdf), Proposition 11.2.24, proof, p. 378. FF reduce Ext¹(E†(μ),E†(λ))=0 for λ>μ to the vanishing of the cokernel of Id−π^(−d)φ^h on E† for d>0, h≥1.

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
3. SFR Remark 6.3.4 shows that essential surjectivity fails in general; it is asserted here only for algebraically closed F. Mixed-slope Homs do not reduce to unit root.

**Direct prerequisites.** `PadicDifferentialEquationsAndRigidCohomology:RD.1/bijective-lattice-invariants`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/calculus-of-slopes`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/frobenius-stable-lattices`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/standard-frobenius-modules`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/dieudonne-manin-classical`.

**Sources.** [rd1-sfr](https://arxiv.org/pdf/math/0504204v4), Proposition 6.3.2, Theorem 6.3.3(a) and Remark 6.3.4, preprint pp. 64–65. The H⁰ comparison applies to unit-root modules, hence to Homs between pure modules of one slope; Remark 6.3.4 shows that completion is not essentially surjective in general (its example has the imperfect K=k((t))), so for general perfect F only full faithfulness is claimed.

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

**Sources.** [rd1-ff](https://www.imo.universite-paris-saclay.fr/~fontaine/courbe.pdf), §11.2.5: Proposition 11.2.20, p. 377, and Corollaire 11.2.22, p. 378; Remarque 11.3.4, p. 382. Restriction to one annulus Y_I with φ(I)∩I≠∅ plus a gluing isomorphism is equivalent to a φ-bundle on Y (11.2.20), and such bundles are free φ-modules of finite rank over R (11.2.22); the slope classification is separate.

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

**Sources.** [rd1-hp](https://ivv5hpp.uni-muenster.de/u/uhartl/Publikat/SigmaBd.pdf), Proposition 9.1, p. 705; Lemmas 9.3–9.4 and the reduction to Proposition 9.5, pp. 706–708; §10.1–Lemma 10.17, pp. 708–713. The public analytic key calculation is independent of the classification it proves.

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

**Sources.** [rd1-hp](https://ivv5hpp.uni-muenster.de/u/uhartl/Publikat/SigmaBd.pdf), Theorem 11.1, Lemmas 11.2–11.4, pp. 713–714; Corollary 11.8 p. 715; §8 pp. 703–705. The classification adds equal-characteristic coefficients without rebuilding the already planned standard-block notion. [rd1-ff](https://www.imo.universite-paris-saclay.fr/~fontaine/courbe.pdf), Théorème 11.3.2 and the paragraph after it, pp. 381–382; Remarque 11.3.4, p. 382. Remarque 11.3.4 says that classifying φ-modules over R_F cannot avoid Théorème 11.3.2; FF's coefficient field is a local field of either characteristic, and for E=F_q((π)) the book attributes 11.3.2 to Hartl–Pink Theorem 4.3, which HP derive from their classification.

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

For M† over E†_alg, write the completed increasing slope filtration 0=S₀⊂S₁⊂…⊂Sₘ=M. There is a unique reverse filtration 0=Srev₀⊂…⊂Srevₘ=M† whose i-th graded piece completes to S_(m+1−i)/S_(m−i), for 1≤i≤m. If M† is isoclinic of slope s/r then, after possibly replacing (s,r) by (ks,kr) for a positive integer k, M†[p^(1/r)] has a Frobenius eigenbasis with eigenvalue p^(s/r); this applies to each isoclinic grade.

**Hypotheses.**

- E†_alg is the fraction field of the subring of W(k(t)^alg) of Teichmüller series Σ[fᵢ]pⁱ whose t-adic valuations v(fᵢ) are bounded below by a linear function of i (D'Addezio Definition 4.2.5); k is perfect, the residue field k(t)^alg is algebraically closed but not complete, and E_alg is the p-adic completion. Slope indices begin at 0.
- s∈ℤ, r>0; negative s is allowed; the coefficient extension and Frobenius lift fix the chosen scalar eigenvalue.

**Proof route.**

1. Apply the descending generic filtration over the completed extended ring (SFR Proposition 5.4.3, as in descending-generic-filtration) and intersect back to E†_alg using O_(E^alg)[p^(1/b)]∩Γ_(2,b,c)=O†_(E^alg)[p^(1/b)] (D'Addezio, proof of Theorem 4.2.6, p. 15); this ring comparison is part of G3. Compare its graded completions with the ascending filtration in reverse order.
2. Uniqueness identifies the grade as S_(m+1−i)/S_(m−i). The printed shifted indices in D’Addezio are corrected; at i=m the quotient is S₁/S₀.
3. For one isoclinic grade apply classical standard-block classification and fixed-slope full faithfulness after the finite scalar extension to transport the Frobenius eigenbasis.

**Direct prerequisites.** `PadicDifferentialEquationsAndRigidCohomology:RD.1/descending-generic-filtration`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/isoclinic-completion-comparison`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/dieudonne-manin-classical`.

**Sources.** [rd1-dad](https://arxiv.org/pdf/2012.12879v4), Definition 4.2.5 and Theorem 4.2.6 with proof, pp. 14–15; Lemma 4.2.7 proof, p. 15. De Jong's reverse filtration and eigenbasis over E†_alg, with the quotient-index correction of E303; the proof of Lemma 4.2.7 confirms that the first reverse step carries the maximal slope.

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

- **trivial_dT** (computation): For the trivial module and δ=d/dT, pairing [T⁻¹] with 1 is 1.
- **exact** (degenerate): For any m and horizontal ℓ, pairing [∂m] with ℓ is zero.
- **cyclotomic_form** (computation): For the trivial δ=(1+T)d/dT line, pairing [(1+T)/T] with 1 is 1.
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

**Sources.** [rd1-dlb](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n2-p01-p.pdf), Proposition 6.4 and proof, p. 357; Lemme 6.3, p. 356. The consumer uses general perfect duality cited to the uncleared book Proposition 20.4.2; this plan supplies an explicit alternative route and states its unresolved descent checks.

**Check.**

- Trivial line: H⁰=L, H¹=L and the T⁻¹ residue pairing is perfect.
- Unipotent nilpotent Jordan block: compare ker A and coker A directly.
- No claim that the uncleared book proof has been read.

## Closure boundary and supplier request

### G1: analytic radius and projector suppliers

KX Theorem 2.2.5 cites the uncleared Kedlaya book Theorem 11.3.2; the ∂₀ splitting cites Theorem 12.4.2. The coefficient proof uses almost-isometric bases (book 1.3.7/8.6.1), visible-spectrum comparison (6.7.4), contracting twisted-factor lifting (6.7.1 and 2.2.2), and the half-open/disk analytic inputs in KX 2.3.8–2.3.10. The public KX proof and full rotation/gluing route were read; these precise analytical suppliers have not been independently established in a cleared source. Obtain public proofs or a cleared copy, and check they match these hypotheses. The main packet already owns the broad spectral, transfer and Frobenius-antecedent targets; do not duplicate them. The review added the ∂ⱼ-Frobenius antecedent and descendant theorems and the decomposition by intrinsic radii (KX Proposition 1.4.17, Theorems 1.4.19 and 1.4.21), which KX prove only by reference to book Theorems 10.4.2, 10.5.1, 10.6.2 and 10.7.1; those inputs belong to this gap too.

Affected targets: `partial-frobenius-descendant`, `intrinsic-radius-decomposition`, `extrinsic-partial-radius-variation`, `coefficient-partial-radius-variation`, `affine-gap-annular-splitting`, `intrinsic-partial-radius-variation`, `intrinsic-annular-splitting`, `constant-profile-disc-splitting`, `boundary-break-proof`.

### G2: ordinary Newton-polygon root supplier

The published monodromy Lemma 4.12 proof and HP §§9–11 have been read. The packet supplies recursive lifting instead of a bare density argument, an explicit unique-minimum proof that a≠0, and uniform bounds for the oriented b₂ sums. Still supply and trace an ordinary Newton-polygon root theorem for finite polynomials over the complete algebraically closed valued residue field, including the nonzero-root and closed-ball-image statements after clearing fractional exponents. No verified pinned declaration or fully traced proof of that general supplier is cited here.

Affected targets: `puiseux-root-input`, `monodromy-key-calculation`, `equalchar-degree-zero-section-input`.

### G3: FF and HP coefficient-category transport

RD.0 currently plans mixed Cohen/Witt analytic rings and ordinary Robba rings. It does not state the chartwise FF Teichmüller E†/E/R_F comparison in both coefficient characteristics. Prove the compatible norms, Frobenius action, overlap intersections and germ extension; transport the rank-one/global-generation/standard-block and slope-splitting inputs used by HP §§4–8 without assuming the classification in advance. HP §§9–11 were read in full for the key estimate and classification. No claim of ordinary-Robba/FF ring equality or unrestricted bounded completion equivalence is made. The gap also covers two extensions of Kedlaya's setting: the descending generic filtration for FF's complete perfect F (the monodromy paper proves it for perfect algebraic extensions of k((t)); SFR Proposition 5.4.3 gives the extended-ring step for any K), and D'Addezio's E†_alg over the non-complete k(t)^alg, compared with the extended ring through O_(E^alg)[p^(1/b)]∩Γ_(2,b,c)=O†_(E^alg)[p^(1/b)] (D'Addezio, proof of Theorem 4.2.6, p. 15).

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

All public sources listed below were accessed on 14 October 2026. The packet records SHA-256 hashes of downloaded PDFs. The published Annals monodromy proof is used for its core calculations: the author’s publication page warns that it differs substantially from the preprint. The full KX 2010 erratum was read; its additional hypothesis concerns residue-characteristic-zero subharmonicity in §2.7, outside the positive-residue-characteristic §§2.2–2.5 target family here. The SFR additional errata list was read, including the amended Lemma 2.6.3 argument, and so was the published SFR erratum (Documenta Math. 12 (2007), 361–362). That erratum repairs the proof of SFR Proposition 3.3.7(c) with strong semiunit presentations and leaves its statement unchanged. It also lists two errata to the monodromy paper, neither at a locator used here.

Main-packet source issues E10, E218 and E219 are imported with their accepted corrections. In particular the missing nonzero-derivation hypothesis, decreasing bounded filtration and bijective-lattice requirement are not new duplicate findings. This part records the following further findings in its own words. The independent review confirmed E301–E309 at their locators, corrected E303's locator to part (i), and added E310 and E311.

- **E301** — KX arXiv v4 Lemma 2.3.2 proof, p. 23. The proof points to its own lemma for the intersection result. Use Lemma 2.3.1. Lemma 2.3.1 is the preceding finite-locally-free intersection statement needed on End(M). Search scope: KX v4 and full published 2010 erratum; the erratum addresses §2.7 only. Review: confirmed. Read p. 23: the proof of Lemma 2.3.2 says to apply Lemma 2.3.2 itself; the argument applies Lemma 2.3.1 to the idempotents in End(M)=M∨⊗M.
- **E302** — KX arXiv v4 Theorem 2.6.1 proof, pp. 32–33. The annular break-splitting step is assigned to the disc theorem 2.5.2. Use Theorem 2.5.1 for the boundary annulus. A neighbourhood of the outer Robba boundary excludes t=0; Theorem 2.5.1 is precisely the affine-gap annular statement. Search scope: KX v4 and full published 2010 erratum. Review: confirmed. Read p. 33: the decomposition is obtained 'by Theorem 2.5.2', which is the disc theorem with constant profile; on A¹(η,1) the partial profiles are affine, which is the hypothesis of the annular Theorem 2.5.1.
- **E303** — D’Addezio arXiv v4 Theorem 4.2.6(i), p. 14. The completed i-th reverse grade is indexed by m−i and m−i−1. Use S_(m+1−i)/S_(m−i), 1≤i≤m. At i=m the printed expression reaches a negative index; the last reverse grade is the lowest ascending grade S₁/S₀. Search scope: D’Addezio v4 theorem and proof; accepted main source-issue list; no separate author erratum checked. Review: confirmed. Read Theorem 4.2.6(i), p. 14: the printed grade S_(m−i)/S_(m−i−1) misses the top grade at i=1 and has a negative index at i=m; the proof of Lemma 4.2.7 (p. 15) uses that the first reverse step carries the maximal slope, i.e. S_m/S_(m−1). The locator is corrected from part (2) to part (i).
- **E304** — Hartl–Pink published §10.17, p. 712. The root-difference absolute value is bounded above by a negative expression. The left side must be log|w−w_i|. The preceding root-lifting estimate is logarithmic; absolute values are nonnegative. Search scope: Published SigmaBd.pdf §§10.15–10.17; no separate erratum located in the source. Review: confirmed. Read the proof of Lemma 10.17, p. 712: it bounds |w−w_i| by the negative number −c′q^((n−1)i/2); Lemma 10.15 and the estimate that follows concern log|w−w_i|.
- **E305** — Hartl–Pink published §10.16, p. 712. The displayed terminal logarithmic bound has the wrong sign on cn. Use log|w|=−ρ≤−cn. Lemma 10.12 chooses ρ≥cn, and §10.3 requires log|w|≤−cn. The printed inequality −ρ≤cn is true but too weak to feed §10.3; the construction gives −ρ≤−cn. Search scope: Published SigmaBd.pdf §§10.3,10.12,10.16; no separate erratum located in the source. Review: confirmed. Read §10.16, p. 712: the printed bound log|w|=−ρ≤cn is true but is not what §10.3 needs; Lemma 10.12 gives ρ≥cn, hence log|w|≤−cn. A sign misprint that affects nothing.
- **E306** — Monodromy published Lemma 4.12 proof, p. 150. The target of the dense-image and surjectivity sentence is labelled U_f(t). Use U_h(t). h(t) is the uniform lower valuation bound; f depends on two additional indices and cannot label that module. Search scope: Published Annals paper at the cited locator; corresponding arXiv v4 proof; author publication-list version note; Kedlaya, Erratum for “Slope filtrations revisited”, Documenta Math. 12 (2007) 361–362: it lists two errata to the monodromy paper (introduction p. 95; Lemma 2.3), neither at this locator. Review: confirmed. Read p. 150: 'dense in U_f(t)' and 'surject onto U_f(t)'; the preceding estimate shows r maps U_t into U_h(t), and f(i,l,t) depends on the pair (i,l).
- **E307** — Monodromy published Lemma 4.12 proof, p. 150, bilateral series estimate. The w_s estimate mixes a second radius variable r on its right side. Use l v_p(π)+s q^(−l)t throughout. The residue contribution to w_s is multiplied by the same radius s as on its left side. Search scope: Published Annals paper at the cited locator; corresponding arXiv v4 proof; author publication-list version note; Kedlaya, Erratum for “Slope filtrations revisited”, Documenta Math. 12 (2007) 361–362: it lists two errata to the monodromy paper (introduction p. 95; Lemma 2.3), neither at this locator. Review: confirmed. Read p. 150: the bound w_s(π^l z^(σ^(−l)))≥l·v_p(π)+r·q^(−l)t has r where s is meant; with s the bound is the one used for convergence.
- **E308** — Monodromy published Proposition 5.11 proof, p. 165. The exterior-power reduction calls the selected determinant line the lowest slope submodule. It is the highest slope line in the d-th exterior power. M₁ was selected as the highest-slope rank-d block; summing its d slopes maximises the exterior-power slope. Search scope: Published Annals paper at the cited locator; corresponding arXiv v4 proof; author publication-list version note; Kedlaya, Erratum for “Slope filtrations revisited”, Documenta Math. 12 (2007) 361–362: it lists two errata to the monodromy paper (introduction p. 95; Lemma 2.3), neither at this locator. Review: confirmed. Read p. 165: the sentence on exterior powers is copied from Proposition 5.10, where M₁ has minimal slope; in Proposition 5.11 M₁ has maximal slope, so ∧^d M₁ is the highest-slope line of ∧^d M.
- **E309** — Monodromy published Proposition 5.11 proof, p. 165, coefficient induction base. The base case claims all coordinates cᵢ vanish modulo π. The coordinates reduce to δᵢ₁; normalise wᵢ≡vᵢ modulo π. v₁ has coordinate one in the first vector and zero in the other vectors in a nearby basis. The first coordinate is a unit, and the displayed bound still follows. Search scope: Published Annals paper at the cited locator; corresponding arXiv v4 proof; author publication-list version note; Kedlaya, Erratum for “Slope filtrations revisited”, Documenta Math. 12 (2007) 361–362: it lists two errata to the monodromy paper (introduction p. 95; Lemma 2.3), neither at this locator. Review: confirmed. Read p. 165: v₁≡w₁ modulo π, so c₁≡1 and the claim cᵢ≡0 fails for i=1; v₀(c₁)=0 still gives r·v₀(c₁)+0≥0, so the base case of the induction holds.
- **E310** — Monodromy published Lemma 4.12 proof, definition of b₂ and the telescoping step, p. 151. b₂ is written as a sum over j from 1 to i+l−s(i,l) for each pair in T, and the telescoping is said to leave the k=0 term minus the k=i+l−s(i,l) term. Read a sum from j=1 to N with N<0 as minus the sum from j=N+1 to 0 (oriented summation). With this convention b₂−πσⁿ(b₂)=r(z)−A holds for every pair in T. i+l−s(i,l) can be negative. Take q=2, n=1 and one coefficient u₀ with v₀(u₀)=−1, so f(0,l,m)=−2^(−l)+m4^(−l). The corners of h are t=(2/3)2^l, with h(t)=−2^(−l)/3. At t=(2/3)2^(−5) the pair (0,−5) lies in S, so s=0 and i+l−s=−5; an empty sum would break the telescoping for this pair. With T_j=π^(i+l−j)σ^(−nj)(u_iσ^(−l)(z)) one has πσⁿ(T_j)=T_(j−1), and the oriented sum S of T_1,…,T_N satisfies S−πσⁿ(S)=T_N−T_0 for every integer N. Search scope: Published Annals paper and arXiv v4 at the locator; Kedlaya, Erratum for “Slope filtrations revisited”, Documenta Math. 12 (2007) 361–362: it lists two errata to the monodromy paper (introduction p. 95; Lemma 2.3), neither at this locator; The hundred source issues of the main packet and those of the other RD continuation packets. Review: confirmed. Found by this review; the example was computed by hand and the oriented-sum identity checked term by term.
- **E311** — KX arXiv v4 Theorem 2.6.1 proof, first sentence, p. 33. The proof says 'for l=1,…,d' and then speaks of the function d!F_i(M,r). The index is i: for i=1,…,d the function d!F_i(M,r) is continuous, convex and piecewise affine with integer slopes. Only i occurs in the rest of the sentence and the proof; l plays no role. Search scope: KX arXiv v4 at the locator; The 2010 erratum (J. Inst. Math. Jussieu 9, 669–671), which concerns §2.7 only. Review: confirmed. Found by this review on reading p. 33.

The Kedlaya differential-equations book is not a cleared source and was not read. No book excerpt or extracted book text is included. The downloaded de Jong DVI and correction could not be rendered in this environment; neither is cited as a read proof. Monodromy Proposition 5.11 provides the read public descending-filtration route. It is proved there for perfect algebraic extensions of k((t)), and SFR §5.4 gives the extended-ring step for any K. Its use for FF's complete F and for D'Addezio's E†_alg is part of G3. The geometric proofs beneath the Notes purity/common-vertex statements remain G4.

## Source register

| Source | Version and read locators |
| --- | --- |
| [A simple algorithm for cyclic vectors](https://web.math.princeton.edu/~nmk/old/simplealgorithm.pdf) — Nicholas M. Katz | American Journal of Mathematics 109 (1987), 65–70. Entire paper: defining formula for c(e,t−a) and Theorems 1–2, p. 65; proofs, pp. 66–67; Remarks (1)–(6), pp. 68–69 (Remark (2) the characteristic-p warning, Remark (3) a basis for which c(e,t) vanishes) |
| [Differential modules on p-adic polyannuli](https://arxiv.org/pdf/0804.1495v4) — Kiran S. Kedlaya and Liang Xiao | arXiv:0804.1495v4, 16 December 2008; paper dated 15 December 2008. §§1.2–1.5 inputs, pp. 6–16; Hypothesis 2.0.1 and §§2.1–2.6, pp. 17–33 |
| [Differential modules on p-adic polyannuli: erratum](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/S1474748009000243) — Kiran S. Kedlaya and Liang Xiao | Journal of the Institute of Mathematics of Jussieu 9 (2010), 669–671, DOI 10.1017/S1474748009000243. Entire three-page erratum: corrections to §2.7 in residue characteristic zero |
| [A p-adic local monodromy theorem](https://annals.math.princeton.edu/wp-content/uploads/annals-v160-n1-p04.pdf) — Kiran S. Kedlaya | Annals of Mathematics 160 (2004), 93–184; published version. §2.2, definition of a valued field (an algebraic extension of k((t))), pp. 102–103; Lemmas 4.11–4.12 and the proof of 4.12, pp. 148–151; Propositions 5.10–5.11 (ascending and descending generic filtrations) and their proofs, pp. 163–165; compare arXiv v4 pp. 51–54 and 66–67 |
| [Slope filtrations revisited](https://arxiv.org/pdf/math/0504204v4) — Kiran S. Kedlaya | arXiv:math/0504204v4; Documenta Mathematica 10 (2005), 447–525. §3.3, Lemma 3.3.3 to Proposition 3.3.7 and the proof of 3.3.7, preprint pp. 33–36; §5.4 (Lemma 5.4.1, Definition 5.4.2, Proposition 5.4.3, Remark 5.4.4), preprint pp. 57–58; §6.3 (Proposition 6.3.2, Theorem 6.3.3, Remark 6.3.4), preprint pp. 64–65 |
| [Slope filtrations revisited: additional errata](https://kskedlaya.org/papers/slope-filt-errata2.pdf) — Kiran S. Kedlaya | Author list dated 12 February 2013. Entire two-page list; corrected proof of Lemma 2.6.3; no correction listed to §6.3 |
| [Erratum for “Slope filtrations revisited”](https://emis.muni.cz/journals/DMJDMV/vol-12/09.pdf) — Kiran S. Kedlaya | Documenta Mathematica 12 (2007), 361–362 (EMIS mirror). Entire two-page erratum: Teichmüller presentations replaced by strong semiunit presentations in the proofs of Proposition 3.3.7(c), Proposition 4.2.2 and Lemma 4.3.2; Lemmas 2.9.1 and 2.9.3 completed; two errata to the monodromy paper (introduction p. 95, Lemma 2.3) |
| [Courbes et fibrés vectoriels en théorie de Hodge p-adique](https://www.imo.universite-paris-saclay.fr/~fontaine/courbe.pdf) — Laurent Fargues and Jean-Marc Fontaine | Author copy, 16 avril 2017, printed page numbering. §11.2.5: Définition 11.2.19, Proposition 11.2.20, Exemple 11.2.21, p. 377; Corollaire 11.2.22, Proposition 11.2.24 and its proof, p. 378; Lemme 11.2.25 and its proof, p. 379; Théorème 11.3.2 and the paragraph after it, pp. 381–382; Remarque 11.3.4, p. 382 |
| [Vector bundles with a Frobenius structure on the punctured unit disc](https://ivv5hpp.uni-muenster.de/u/uhartl/Publikat/SigmaBd.pdf) — Urs Hartl and Richard Pink | Compositio Mathematica 140 (2004), 689–716. §§1–4 ring/bundle/global-generation statements; §§8–11 standard bundles, extension calculation, fundamental estimate and classification, pp. 703–715 |
| [On the zeta function of a hypersurface](https://www.numdam.org/item/10.1007/BF02684275.pdf) — Bernard Dwork | Publications Mathématiques de l’IHÉS 12 (1962), 5–68. §4(a): definition of a splitting function, p. 55; Lemma 4.1 and its proof, with equations (4.1)–(4.11) including the Artin–Hasse series (4.3)–(4.4), pp. 55–57 |
| [Computing zeta functions of sparse nondegenerate hypersurfaces](https://arxiv.org/pdf/1112.4881) — Steven Sperber and John Voight | arXiv:1112.4881, publicly served PDF read 14 October 2026. §1, the Dwork splitting function and estimate (1.4), PDF pp. 5–6 (that section assumes p > 2; p = 2 is treated in their §5) |
| [Exponential sums and rigid cohomology](https://bimsa.net/doc/publication/1445.pdf) — Peigen Li | Finite Fields and Their Applications 81 (2022), 102031. Proposition 2.1 and its proof, PDF pp. 4–5, alternate gauge estimates |
| [Parabolicity conjecture of F-isocrystals](https://arxiv.org/pdf/2012.12879v4) — Marco D’Addezio | arXiv:2012.12879v4. §2.2, p. 6; Definition 4.2.5, Theorem 4.2.6 and its proof, and the proof of Lemma 4.2.7, pp. 14–15 |
| [Bessel F-isocrystals for reductive groups](https://arxiv.org/pdf/1910.13391) — Daxin Xu and Xinwen Zhu | arXiv:1910.13391, publicly served PDF read 14 October 2026. Appendix A, §A.2, PDF p. 64, constant-Newton-polygon slope filtration |
| [Notes on isocrystals](https://arxiv.org/pdf/1606.01321) — Kiran S. Kedlaya | arXiv:1606.01321, publicly served PDF read 14 October 2026. Notation 1.1, p. 2; Theorems 3.12 and 4.1, Corollary 4.2 and Remark 4.5, PDF pp. 7–9 |
| [Revêtements du demi-plan de Drinfeld et correspondance de Langlands p-adique](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n2-p01-p.pdf) — Gabriel Dospinescu and Arthur-César Le Bras | Annals of Mathematics 186 (2017), 321–411. §6: Définition 6.1 and Exemple 6.2, pp. 355–356; Lemme 6.3 and its proof, p. 356; Proposition 6.4 and its proof, p. 357 |
