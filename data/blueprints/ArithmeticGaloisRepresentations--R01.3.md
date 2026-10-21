# Arithmetic Galois representations: Artin and Swan conductors

## Purpose and conventions

This layer turns ramification filtrations into invariants of representations. Its local conductor has two separate contributions: the codimension of the **actual** inertia-invariant subspace and the Swan term measuring positive upper breaks. Their distinction matters for unipotent ℓ-adic representations and for reduction modulo ℓ. The resulting exponents define global conductor ideals and connect the Tate module of an elliptic curve with its minimal discriminant. The uniform elliptic comparison includes wild reduction at both 2 and 3.

Throughout, K is complete discretely valued with perfect residue field k of characteristic p>0. The valuation is additive and normalised by v_K(π)=1. Tier F means that k is finite; tier P allows perfect infinite residue fields. The current local-field supplier provides tier F. Tier P uses the precise extension of the same ramification vocabulary described in the dependency contract below. Serre’s 1961 paper, §3.1, pp. 126–128, verifies the mathematical generality; this does not make the missing supplier interface an implemented library declaration.

Write G_K=Gal(K^sep/K), with its Krull topology, I_K for inertia and P_K for wild inertia. Finite Galois extensions are subextensions of the **separable closure**. In positive characteristic the algebraic closure is not separable over K. Tau Ceti’s `AbsoluteGaloisGroup` uses the separable closure, and `absoluteGaloisGroupRestrictEquiv` compares it with Mathlib’s algebraic-closure automorphism group. All quotient and fixed-field arguments here take place on the separable side.

Coefficients F are Hausdorff topological fields, V is finite-dimensional over F, and the action is jointly continuous. We require char F≠p and finite ρ(P_K). For a finite coefficient field these conditions give a finite representation; for a finite extension of Q_ℓ with ℓ≠p, a stable lattice and the pro-ℓ congruence kernel show that wild inertia has finite image. Infinite tame inertia is still allowed. A p-adic representation at residue characteristic p with infinite wild image has no Swan conductor in this interface.

Lower indexing uses the ceiling convention on positive real intervals; upper indexing is the quotient-compatible one, with G_K^−1=G_K and G_K^0=I_K. Arithmetic Frobenius has degree one. A Weil–Deligne pair satisfies r(w)Nr(w)⁻¹=q^{deg(w)}N. The surface Artin invariant uses the sign χ_generic−χ_special−Sw(H¹); its negative, rather than itself, equals the discriminant order.

Every planned declaration is unimplemented. The suggested file is a signature prototype at the recorded pin. Where a genuine geometric or local Weil carrier cannot yet be stated, it records the precise omission instead of inventing a proposition as a substitute carrier. Its unbundled Weil–Deligne numerical formula does not assert that arbitrary data constitute the actual correspondence. The generic ideal product accepts the finitely supported local exponent function; the global representation-to-exponent assignment is supplied by the existing local/global dictionary.

## Layer R01.3: the imported conductor calculus

The existing nodes of this roadmap supply the following results. They are imports, not additional plans for the same theorems. The node index below identifies every imported target used in assembly.

**Finite wild action and integrality.** A finite wild image has an open kernel on P_K, killed by the intersection with some open normal subgroup of G_K. It therefore factors through G₁ in a finite Galois quotient; the factorisation is equivariant for G_K and compatible with enlarging the quotient. A quotient killing the entire inertia kernel is a separate requirement for the Artin lower sum. Maschke and averaging give invariant dimensions, but do not construct a characteristic-zero lift of a residual simple wild module. The equivariant lifting theorem below supplies that missing input. Its orbit induction feeds the existing ordinary Artin integrality theorem, proved by Brauer induction from the abelian conductor theorem (Serre 1961, §3.7, Theorem 2, p. 138). Thus both Sw and a are nonnegative integers. Hasse–Arf for abelian extensions alone is not a proof for all nonabelian representations.

**Characters and elementary computations.** A ramified character with highest upper break b has Sw=b and a=b+1; a tame nontrivial character has b=0 and a=1. An unramified character has a=0. The quadratic characters of Q₂(i) and Q₂(√2) have (Sw,a)=(1,2) and (2,3), respectively. Tame two-dimensional representations have Swan zero and Artin exponents 0,1,2 according to their actual inertia-fixed dimension. For K of characteristic p and α^p−α=u with v(u)=−m<0, p∤m, the extension is cyclic of degree p with both breaks m; a nontrivial associated character has Sw=m and a=m+1. Pole orders divisible by p must first be reduced modulo Artin–Schreier coboundaries. This supplies the local sheaf computation in Deligne’s Artin–Schreier application, rather than a second sheaf conductor definition.

**Exact sequences, twists and base change.** Swan is additive on short exact sequences and is unchanged by semisimplification. Artin is additive on direct sums. For 0→V′→V→V″→0 it satisfies

\[
a(V)\geq a(V')+a(V''),
\]

with equality exactly when V^{I_K}→(V″)^{I_K} is onto. In particular a(V)≥a(V^ss). The nontrivial tame unipotent extension of the trivial character by itself has a=1 although its two constituents have exponent zero. This is the direction forced by the failure of invariants to be right exact.

Duality and coefficient extension preserve the conductors. An unramified character twist preserves both a and Sw; a tame twist preserves Sw and the positive breaks, while it can change the tame contribution. If a character χ has positive break b strictly greater than every break of V, then χ⊗V has only break b and a(χ⊗V)=dim(V)a(χ), as in Ulmer’s Proposition 1, §10, pp. 7–8. Unramified field extension preserves a and Sw. For tame L/K with ramification index e, positive breaks and Sw are multiplied by e. That formula is not an assertion that the entire Artin conductor is multiplied by e.

**Induction.** Let L/K be finite separable, with e=e(L/K), f=f(L/K), d=d(L/K), n=[L:K]=ef and discriminant exponent D=fd. For a finite-wild continuous representation V of G_L, the induced representation still has finite wild image and

\[
\begin{aligned}
\epsilon_K(\operatorname{Ind}V)&=(n-f)\dim V+f\epsilon_L(V),\\
\operatorname{Sw}_K(\operatorname{Ind}V)&=f\operatorname{Sw}_L(V)+(D-n+f)\dim V,\\
a_K(\operatorname{Ind}V)&=D\dim V+f a_L(V).
\end{aligned}
\]

The induced trivial representation has Artin conductor D and Swan conductor f(d−e+1). The proof uses the non-Galois Herbrand substitution below and the imported induced-inertia invariant formula, without assuming integrality in order to prove the identity. Globally the relative discriminant raised to dim V is multiplied by the ideal norm of the conductor of V. Excluded places in the global identity must match the coefficient and local-conductor hypotheses on both fields.

**Finite-image bounds and character examples.** The imported `serre-bound-for-the-wild-invariant` applies in characteristic zero with e_K=v_K(p), finite representation image, dimension N and wild group of order p^c. It gives Sw≤N e_K(c+1/(p−1)) and a≤N(1+e_K c+e_K/(p−1)); see Serre 1987, Proposition 9 and (4.9.4), pp. 214–216. This is the non-strict bound. At Q₂, using a wild group of order at most eight in dimension two gives the coarse bound ten; it does not give the sharp elliptic bound eight. The latter requires the Brumer–Kramer inputs below.

The imported `triadic-cubic-conductor` says that a ramified order-three character of G_{Q₃} has Swan one and Artin two; an unramified cubic character instead has exponent zero. For quadratic M/Q and a finite-order character ψ, `quadratic-induction-conductor` specializes the ideal induction formula to N(Ind ψ)=|d_M| Norm(f(ψ)), with matched excluded places. In particular M=Q(i) contributes the factor four. Identifying the Artin ideal f(ψ) with a Hecke-character conductor requires the reciprocity comparison specified below.

For the equal-characteristic example above, `artin-schreier-twist` gives Sw(V⊗ψ)=m dim V and a(V⊗ψ)=(m+1)dim V when every break of V is strictly smaller than m. Equal breaks can cancel. If y∈k[[x]] has valuation d prime to p, the character from T^p−T=y⁻¹ therefore has Swan d and Artin d+1; this is the imported `deligne-artin-schreier-at-infinity` computation used by the local sheaf application.

**Reduction.** For ℓ≠p, E/Q_ℓ finite, and a stable O_E-lattice Λ, let ρ̄_Λ be the actual representation Λ/m_EΛ. Averaging over wild p-groups gives Sw(ρ̄_Λ)=Sw(ρ), while specialisation can enlarge the inertia-fixed subspace. Consequently

\[
a(\bar\rho_\Lambda^{ss})\leq a(\bar\rho_\Lambda)\leq a(\rho).
\]

The semisimplified residual conductor is lattice-independent; the raw residual conductor need not be. These inequalities are compatible with global semisimplification, but equality with raw torsion must not silently be transferred to its global semisimplification. Globally the residual conductor divides the ℓ-adic conductor away from ℓ, and the quotient exponent is dim ρ̄^{I_v}−dim V^{I_v}. Ulmer, §§6 and 9, pp. 5 and 7, supplies the Swan and conductor comparison; this argument requires no unread attribution to Livné.

**Residual elliptic curves.** Good reduction gives raw residual exponent zero. At multiplicative reduction away from ℓ, the raw exponent drops from one to zero precisely when ℓ divides v(Δ_min); the Tate period gives this criterion (Darmon–Diamond–Taylor, Proposition 2.12(c), p. 58). For potential good reduction and ℓ≥5 the finite inertia order divides 24, so reduction preserves all inertia-invariant dimensions and the full exponent. Potentially multiplicative reduction uses the quadratic twist, retaining its wild term at 2.

For E/Q and prime ℓ≥5, with E[ℓ] denoting raw geometric torsion,

\[
N(E[\ell])=\frac{N_E^{(\ell)}}{
 \prod_{q\parallel N_E,\ q\ne\ell,\ \ell\mid v_q(\Delta_{\min})}q}.
\]

For the global semisimplification only N(E[ℓ]^ss) divides this number without further irreducibility assumptions. The curve y²+y=x³−x² at ℓ=5 has raw exponent one at 11, while its global semisimplification has exponent zero there. This distinguishes local finite inertia calculations from a global Jordan–Hölder operation. The characteristic-p place is excluded from this residual conductor definition.

Isogenous elliptic curves have isomorphic rational Tate modules and hence identical local exponents and global conductor ideals. Over Q, bad primes are exactly the support of N_E, exponent one characterizes multiplicative reduction, and N_E divides 2⁸·3⁵ times the product of q² over its bad primes q≥5. These are the imported `elliptic-conductor-isogeny-invariance` and `elliptic-conductor-over-q` conclusions, after applying the sharp bounds below.

## Definition and key-theorem interface

The declarations below supply the missing objects and named inputs at target level. Proofs smaller than these key inputs remain in the proof sketches. The mathematical statements are authoritative; all dependencies use the existing canonical carriers.

### 1. Absolute upper ramification filtration

**Target:** `ArithmeticGaloisRepresentations:R01.3/absolute-upper-filtration`.

For u≥−1 put G_K^u=⋂_{L/K finite Galois in K^sep} res_L⁻¹(Gal(L/K)^u). Put G_K^{u+}=closure(⋃_{w>u}G_K^w). This is a closed normal, decreasing filtration, left continuous; G_K^−1=G_K, G_K^0=I_K and G_K^{0+}=P_K. Transport to Field.absoluteGaloisGroup K only along the topological restriction equivalence; do not use a Galois correspondence in the inseparable algebraic closure.

**Hypotheses.** K is complete discretely valued, with valuation v_K(π)=1 and perfect residue field k of characteristic p>0. Finite Galois subextensions lie in K^sep. Tier F means k finite; tier P permits arbitrary perfect k and depends on the recorded Part II ramification input.

**Uses.** R01.3/break-decomposition: Defines the averaging groups and rational breaks. LocalFieldsRamification layer 4: Identifies the existing inertia and wild-inertia carriers.

**Proof outline.**

Use the finite upper filtration and its quotient compatibility from LocalFieldsRamification layer 3. Restrictions are continuous; inverse images and intersections preserve closedness and normality.

In a directed tower, finite-level quotient compatibility makes the inverse limit project onto every finite upper group. At zero and immediately above zero, the finite images are inertia and wild inertia, giving the existing layer-4 subgroups. At −1 all finite images are the whole groups.

For u sufficiently large each finite upper group is trivial. Intersecting over all u and all finite separable Galois extensions leaves the identity. Left continuity is inherited from the finite filtrations.

**Prerequisites.** `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-3-ramification-the-tame-and-wild-cases-and-the-filtration`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-4-the-tame-quotient-of-the-absolute-galois-group`, `tauceti:TauCeti.AbsoluteGaloisGroup`, `tauceti:TauCeti.absoluteGaloisGroupRestrictEquiv`.

**Sources.** Jean-Pierre Serre, §3.1, Propositions 2–4, pp. 126–128: Proposition 3 is the finite quotient theorem; Proposition 4 is the tower formula. This section treats totally ramified extensions, with perfect residue field allowed; inertia separation supplies the general finite-extension formulation. Douglas Ulmer, §3, pp. 2–3: Fixes the lower and upper conventions used in the finite quotients.

**Planning API.**

- `TauCeti.ConductorR013.absoluteUpper_antitone` (structure): u≤v implies G_K^v≤G_K^u.
- `TauCeti.ConductorR013.absoluteUpper_finiteImage` (compatibility): res_L(G_K^u)=Gal(L/K)^u for every finite Galois L/K and u≥−1.
- `TauCeti.ConductorR013.absoluteUpper_separated` (characterisation): ⋂_u G_K^u=1.

**Unit tests.**

- `TauCeti.ConductorR013.absoluteUpper_atMinusOne` (degenerate): G_K^−1=G_K.
- `TauCeti.ConductorR013.absoluteUpper_atZero` (compatibility): G_K^0=I_K and G_K^{0+}=P_K.
- `TauCeti.ConductorR013.absoluteUpper_unramifiedQuotient` (computation): For finite unramified L/K, res_L(G_K^0)=1 although res_L(G_K^−1)=Gal(L/K).

**Acceptance.** The separable closure convention works also for k((t)).

### 2. Break decomposition with finite wild image

**Target:** `ArithmeticGaloisRepresentations:R01.3/finite-wild-break-decomposition`.

There is a unique finite G_K-stable decomposition V=⊕_{λ∈Q≥0} V(λ). Its zero summand is V^{P_K}. For λ>0, V(λ)^{G_K^λ}=0 and V(λ)^{G_K^{λ+}}=V(λ). Define m_ρ:Q→₀N by m_ρ(λ)=dim_F V(λ), supported in Q≥0; the break set is its support and highest break is its maximum, with value 0 on V=0.

**Hypotheses.** K is complete discretely valued, with valuation v_K(π)=1 and perfect residue field k of characteristic p>0. Finite Galois subextensions lie in K^sep. Tier F means k finite; tier P permits arbitrary perfect k and depends on the recorded Part II ramification input. F is a Hausdorff topological field of characteristic different from p; V is finite-dimensional and ρ:G_K→GL_F(V) is continuous with finite wild image. Continuity is joint continuity of the action. Finite wild image does not mean finite inertia image.

**Uses.** R01.3/swan-from-breaks: Weighted sum defining Swan. Ulmer, Proposition 1, §10, pp. 7–8: Compares the highest break with a twisting character.

**Proof outline.**

Import finite wild factorisation: choose finite Galois L/K killing ker(ρ|P_K), not necessarily killing ρ|I_K. The positive filtration factors through a finite p-group H and has finitely many rational jumps.

For each normal subgroup H_u of H, the average e_u projects onto invariants, by Representation.averageMap and Maschke. Normality makes e_u commute with the whole G_K action. Nested averages commute; if H_u⊆H_v then e_u e_v=e_v, the average over the larger group.

Take V(λ)=im(e_{λ+}−e_λ) at positive jumps and V(0)=im(e_{0+}). Orthogonality and telescoping give the direct sum. The defining invariant conditions recover every projection and prove uniqueness. This is a proof from averaging, with no unread Katz attribution.

**Prerequisites.** `ArithmeticGaloisRepresentations:R01.3/absolute-upper-filtration`, `ArithmeticGaloisRepresentations:R01.3/wild-action-factors-through-a-finite-galois-extension`, `mathlib:Representation.invariants`, `mathlib:Representation.averageMap`, `mathlib:Representation.prod`.

**Sources.** Douglas Ulmer, §§3–4, pp. 2–3: Supplies the filtration and invariant-codimension calculation; the projector decomposition is derived here. Armand Brumer and Kenneth Kramer, §2, p. 230, averaging argument in Lemma 2.7: Subgroup averages preserve invariant dimensions in prime-to-characteristic representations.

**Planning API.**

- `TauCeti.ConductorR013.breakDecomposition_internal` (structure): The summands form an internal direct sum, are G_K-stable and have total dimension dim V.
- `TauCeti.ConductorR013.breakDecomposition_invariants` (characterisation): For u>0, V^{G_K^u}=⊕_{λ<u}V(λ), while V^{G_K^{u+}}=⊕_{λ≤u}V(λ).
- `TauCeti.ConductorR013.breakMultiplicity_support` (data): m_ρ has finite nonnegative support, with m_ρ(0)=dim V^{P_K}.

**Unit tests.**

- `TauCeti.ConductorR013.breakDecomposition_tame` (degenerate): If P_K acts trivially then V(0)=V and every positive summand is zero.
- `TauCeti.ConductorR013.breakDecomposition_quadratic` (computation): Over Q₂, χ₋₄ for Q₂(i) has its only break 1, while χ₈ for Q₂(√2) has its only break 2.
- `TauCeti.ConductorR013.breakDecomposition_directSum` (computation): For 1⊕χ₋₄⊕χ₈, m(0)=m(1)=m(2)=1 and all other multiplicities vanish.

**Acceptance.** In residue characteristic p with coefficient characteristic p the conclusion is not asserted.

### 3. Swan conductor

**Target:** `ArithmeticGaloisRepresentations:R01.3/swan-from-breaks`.

Define Sw(ρ)=Σ_λ λ m_ρ(λ)∈Q≥0. Equivalently Sw(ρ)=∫₀∞ codim V^{G_K^u} du=Σ_{i≥1}|G_i|/|G_0|·codim V^{G_i}. Here L/K kills the wild kernel and G_i acts via its well-defined lifts in P_K; the formula is independent of such L.

**Hypotheses.** K is complete discretely valued, with valuation v_K(π)=1 and perfect residue field k of characteristic p>0. Finite Galois subextensions lie in K^sep. Tier F means k finite; tier P permits arbitrary perfect k and depends on the recorded Part II ramification input. F is a Hausdorff topological field of characteristic different from p; V is finite-dimensional and ρ:G_K→GL_F(V) is continuous with finite wild image. Continuity is joint continuity of the action. Finite wild image does not mean finite inertia image.

**Uses.** FiniteFieldsAndCharacterSums:FF.2: Local conductor of an Artin–Schreier sheaf. R01.3/local-induction-formula: Herbrand substitution in the Swan integral. R01.3/reduction-does-not-increase-the-conductor: Invariant dimensions of wild groups survive reduction.

**Proof outline.**

Apply the break invariant formula: the codimension is Σ_{λ≥u}m(λ) for u>0. Integrate this finite step function to obtain Σλm(λ).

Substitute u=φ_{L/K}(t); its slope is |G_t|/|G_0| on lower intervals. This gives the weighted lower sum, starting at i=1.

Import equivariant finite wild factorisation and enlargement. In either quotient the integral uses the same absolute invariant subspaces, so both lower sums agree.

**Prerequisites.** `ArithmeticGaloisRepresentations:R01.3/finite-wild-break-decomposition`, `ArithmeticGaloisRepresentations:R01.3/finite-wild-factorisation-equivariant`, `ArithmeticGaloisRepresentations:R01.3/finite-wild-factorisation-enlargement`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-3-ramification-the-tame-and-wild-cases-and-the-filtration`.

**Sources.** Douglas Ulmer, §§3–4, pp. 2–3, equations (3.1) and (4.1): The upper-integral and weighted-lower expressions give the same wild part. Jean-Pierre Serre, §1.2, equations (1.2.1)–(1.2.2), pp. 180–181: The residual conductor uses exactly these weights.

**Planning API.**

- `TauCeti.ConductorR013.swan_eq_lowerSum` (compatibility): The weighted lower sum over every quotient killing the wild kernel equals Sw.
- `TauCeti.ConductorR013.swan_eq_zero_iff` (characterisation): Sw=0 exactly when P_K acts trivially.
- `TauCeti.ConductorR013.swan_bound_highest` (relation): Sw≤highestBreak·dim V, with equality exactly when all nonzero summands have that highest break, allowing V=0.

**Unit tests.**

- `TauCeti.ConductorR013.swan_tame` (degenerate): Every tamely ramified representation has Swan conductor zero.
- `TauCeti.ConductorR013.swan_quadraticEight` (computation): Sw(χ₈)=2.
- `TauCeti.ConductorR013.swan_weightsMatter` (non-example): For χ₈ calculated over Q₂(ζ₈), the positive lower sizes are 4,2,2 with |G₀|=4; Sw=1+1/2+1/2=2, whereas the unweighted sum is 3.

**Acceptance.** No finite inertia quotient is required to compute Sw.

### 4. Artin conductor

**Target:** `ArithmeticGaloisRepresentations:R01.3/artin-from-actual-inertia`.

Put ε(ρ)=dim V−dim V^{ρ(I_K)}, using the actual representation, and a(ρ)=ε(ρ)+Sw(ρ). This definition is rational-valued; the imported integrality theorem subsequently identifies a and Sw with natural numbers. For finite inertia image, a=Σ_{i≥0}|G_i|/|G₀|·codim V^{G_i} over a finite quotient killing its inertia kernel. The finite-wild-only quotient is not sufficient for the i=0 term.

**Hypotheses.** K is complete discretely valued, with valuation v_K(π)=1 and perfect residue field k of characteristic p>0. Finite Galois subextensions lie in K^sep. Tier F means k finite; tier P permits arbitrary perfect k and depends on the recorded Part II ramification input. F is a Hausdorff topological field of characteristic different from p; V is finite-dimensional and ρ:G_K→GL_F(V) is continuous with finite wild image. Continuity is joint continuity of the action. Finite wild image does not mean finite inertia image.

**Uses.** R01.3/global-away-conductor: Nonnegative integral local exponents. R01.3/wd-from-monodromy: Preserves the unipotent inertia contribution. R29.4: Uses the elliptic conductor without losing the wild term at 2.

**Proof outline.**

Use Representation.invariants for the restriction to the existing inertia subgroup. Define ε by its codimension and add the Swan sum.

At i=0 the weight is one. If the quotient kills the inertia kernel, its G₀-invariants are the actual I_K-invariants, and the Swan lower sum supplies the remaining terms.

The definition does not depend on integrality. The separately imported hasse-arf-integrality theorem, after applying equivariant simple lifting to the wild orbit sum, promotes its nonnegative rational value to a natural-number exponent for global products.

**Prerequisites.** `ArithmeticGaloisRepresentations:R01.3/swan-from-breaks`, `ArithmeticGaloisRepresentations:R01.3/finite-inertia-factorisation`, `mathlib:Representation.invariants`, `ArithmeticGaloisRepresentations:R01.3/hasse-arf-integrality`.

**Sources.** Douglas Ulmer, §§4–6, pp. 3–5; end of §6: For general ℓ-adic representations the tame term uses actual inertia invariants. Jean-Pierre Serre, §2.1, PDF pp. 6–8: Separates the actual tame codimension from the integer wild term.

**Planning API.**

- `TauCeti.ConductorR013.artin_eq_tame_add_swan` (characterisation): a=ε+Sw.
- `TauCeti.ConductorR013.artin_eq_lowerSum` (compatibility): For a quotient killing inertia, the weighted sum begins at i=0 and equals a.
- `TauCeti.ConductorR013.artin_zero_iff` (characterisation): a=0 exactly when I_K acts trivially.

**Unit tests.**

- `TauCeti.ConductorR013.artin_unramified` (degenerate): If I_K acts trivially, ε=Sw=a=0.
- `TauCeti.ConductorR013.artin_tameCharacter` (computation): A nontrivial tame character has ε=a=1 and Sw=0.
- `TauCeti.ConductorR013.artin_unipotent` (non-example): On F² let ρ(g)(x,y)=(x+t(g)y,y), where t:G_K→(F,+) is continuous, vanishes on P_K and is nonzero on I_K. Then ε=a=1 and Sw=0; the trivial action on F² has a=0. Determine the fixed space from this action, without assuming its dimension.

**Acceptance.** A nontrivial tame unipotent extension of 1 by 1 has a=1 although its semisimplification has a=0.

### 5. Equivariant lifting of simple wild modules

**Target:** `ArithmeticGaloisRepresentations:R01.3/prime-to-characteristic-simple-lifting`.

Let H be a finite p-group, ℓ≠p, and choose a splitting complete mixed-characteristic (0,ℓ) DVR R with fraction field E and residue field F, containing compatible lifts of all |H|-th roots of unity. Reduction of H-stable lattices gives an Aut(H)-equivariant bijection between simple E[H]-module classes and simple F[H]-module classes. It preserves dimensions and dim U^J for every subgroup J≤H. Consequently conjugation stabilisers agree. The bijection depends on the chosen root identification; it is not a canonical functor without that choice.

**Hypotheses.** H finite p-group and ℓ≠p; both coefficient fields split H. Extension to algebraically closed coefficients is by scalar extension.

**Proof outline.**

For each ordinary irreducible character χ, use its central idempotent e_χ=(χ(1)/|H|)Σ_h χ(h⁻¹)h in R[H]. Its coefficient at 1 is χ(1)²/|H|, an R-unit because χ(1) is a power of p; hence reduction is nonzero.

The reductions are orthogonal central idempotents. There are as many as conjugacy classes, the dimension of the centre of split semisimple F[H]; therefore they are precisely the primitive central idempotents. Each block has rank χ(1)² over R, so the corresponding split residue matrix algebra has size χ(1). Reduction of a stable rank-χ(1) lattice is the unique simple residue module for that block.

Automorphisms permute the displayed idempotents and commute with root reduction; thus the bijection is equivariant. For each J, the idempotent |J|⁻¹Σ_j j projects a lattice onto a direct summand; its generic and residue ranks agree.

For the application to inertia G₀, extend a stable characteristic-zero simple module to its stabiliser T. T/H is cyclic and the scalar obstruction vanishes by the existing Clifford/projective-representation interface. Orbit induction then gives the same lower-group invariant dimensions as the residual orbit.

**Prerequisites.** `tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-5-clifford-theory-over-a-normal-subgroup`, `tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-7-projective-representations-factor-sets-and-the-schur-multiplier`, `mathlib:Representation.averageMap`.

**Sources.** Armand Brumer and Kenneth Kramer, §2, Lemma 2.7, p. 230: States the lifting and invariant-dimension result. The central-idempotent argument here additionally proves the conjugation compatibility needed by the orbit construction.

**Acceptance.** For H=C₃ and ℓ=2, the two nontrivial simple classes are interchanged both before and after reduction by inversion. For H=C₂ and ℓ=3, sign lifts to sign and has zero H-invariants. No claim is made when ℓ=p.

### 6. Weil–Deligne conductor

**Target:** `ArithmeticGaloisRepresentations:R01.3/wd-from-monodromy`.

For a Weil–Deligne representation (r,N) over a characteristic-zero coefficient field, r has finite inertia image, N is nilpotent, and r(w)Nr(w)⁻¹=q^{deg(w)}N with arithmetic Frobenius of degree 1. Define a(r,N)=Sw(r)+dim V−dim(ker N)^{r(I_K)}=a(r)+dim V^{r(I_K)}−dim(ker N)^{r(I_K)}. Retain N when Frobenius-semisimplifying r.

**Hypotheses.** K is complete discretely valued, with valuation v_K(π)=1 and perfect residue field k of characteristic p>0. Finite Galois subextensions lie in K^sep. Tier F means k finite; tier P permits arbitrary perfect k and depends on the recorded Part II ramification input. k finite with cardinality q; use the genuine Weil group, not an arbitrary abstract tuple.

**Uses.** R01.2: Conductor preserved by its actual correspondence. LocalLanglands: Monodromy term in a local parameter.

**Proof outline.**

Pull the absolute upper filtration to the Weil group via its existing inertia identification. On inertia the Weil–Deligne relation makes ker N stable, so its intersection with Representation.invariants is well-defined.

Define the displayed codimension and use the Artin formula for r to get the second expression. Normalisation q^{deg} uses arithmetic Frobenius.

Import R01.2 for the actual correspondence. If ρ(σ)=r(σ)exp(t_ℓ(σ)N) on inertia with the full nonzero tame-character package and finite r(I), its invariants are ker N∩V^{r(I)}. Wild inertia has t_ℓ=0, so the Swan terms coincide. Frobenius semisimplification preserves r|I and N.

**Prerequisites.** `ArithmeticGaloisRepresentations:R01.3/swan-from-breaks`, `ArithmeticGaloisRepresentations:R01.3/artin-from-actual-inertia`, `ArithmeticGaloisRepresentations:R01.2/grothendieck-monodromy-and-the-weil-deligne-functor`, `mathlib:Representation.invariants`.

**Sources.** Douglas Ulmer, §§7–9, pp. 6–7, Theorem 1: Defines the monodromy correction and proves agreement with the ℓ-adic conductor, noting the needed inertia invariants.

**Planning API.**

- `TauCeti.ConductorR013.wd_eq_artin_correction` (characterisation): a(r,N)=a(r)+dim V^I−dim(ker N)^I.
- `TauCeti.ConductorR013.wd_eq_ladic` (compatibility): For ℓ≠p, a(WD(ρ))=a(ρ) with the genuine full tame-character package.
- `TauCeti.ConductorR013.wd_frobeniusSemisimplification` (functoriality): a(r^{F-ss},N)=a(r,N).

**Unit tests.**

- `TauCeti.ConductorR013.wd_zeroMonodromy` (degenerate): a(r,0)=a(r).
- `TauCeti.ConductorR013.wd_specialTwo` (computation): For unramified r on a two-dimensional special representation with rank-one N, Sw=0 and a=1.
- `TauCeti.ConductorR013.wd_unramifiedJordan` (computation): For an unramified n-dimensional special representation with one Jordan block N, a=n−1, so using V^I instead of (ker N)^I gives the wrong value zero.

**Acceptance.** Full representation semisimplification can erase N and change the conductor.

### 7. Global conductor away from excluded places

**Target:** `ArithmeticGaloisRepresentations:R01.3/global-away-conductor`.

For a number field L, a representation ρ of G_L in the valid finite-image or finite ℓ-adic coefficient tier, unramified outside finitely many places, and a finite set Σ containing every place where the coefficient characteristic equals the residue characteristic or the local finite-wild conductor is unavailable, define N^Σ(ρ)=∏_{v finite,v∉Σ}𝔭_v^{a(ρ_v)}. Only finitely many exponents are nonzero. The unit ideal represents conductor one.

**Hypotheses.** Use decomposition groups of NumberFieldArithmetic and R01.1; local conductors have the hypotheses of artin-from-actual-inertia.

**Uses.** R01.3/global-conductor-of-reduction: Prime-by-prime divisibility. R01.3/induction-formula-for-conductors: Discriminant and ideal-norm formula.

**Proof outline.**

Decomposition embeddings differ by conjugation, so imported conductor invariance makes a_v independent of choice. Integrality gives a finitely supported natural-number exponent function.

Form the finite product of powers of height-one prime ideals in the ring of integers. Unique factorisation of ideals gives the requested valuations, support and independence.

**Prerequisites.** `ArithmeticGaloisRepresentations:R01.3/artin-from-actual-inertia`, `ArithmeticGaloisRepresentations:R01.3/hasse-arf-integrality`, `ArithmeticGaloisRepresentations:R01.3/conductor-independence-of-choices`, `tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-5-the-global-local-dictionary-at-finite-places`, `mathlib:IsDedekindDomain.HeightOneSpectrum`, `mathlib:Finsupp.prod`.

**Sources.** Jean-Pierre Serre, §1.2, equation (1.2.3), p. 181: Global conductor as the finite product of the local exponents, omitting the coefficient prime.

**Planning API.**

- `TauCeti.ConductorR013.globalConductor_valuation` (characterisation): v(N^Σ)=a_v for v∉Σ and is zero for v∈Σ.
- `TauCeti.ConductorR013.globalConductor_support` (data): Its support is exactly the ramified finite places outside Σ.
- `TauCeti.ConductorR013.globalConductor_enlargeExcluded` (functoriality): For Σ⊆Σ′, N^{Σ′} divides N^Σ, with quotient ∏_{v∈Σ′\Σ}𝔭_v^{a_v}.

**Unit tests.**

- `TauCeti.ConductorR013.globalConductor_unramified` (degenerate): An everywhere-unramified representation has conductor the unit ideal.
- `TauCeti.ConductorR013.globalConductor_singlePrime` (computation): If a_v=n at a single non-excluded prime and zero elsewhere, N^Σ=𝔭_v^n.
- `TauCeti.ConductorR013.globalConductor_excludedPrime` (non-example): If the only ramified prime lies in Σ, N^Σ is the unit ideal even when that local exponent is positive.

**Acceptance.** Restriction to local inertia, not the global image alone, determines each exponent.

### 8. Prime-to-coefficient conductor

**Target:** `ArithmeticGaloisRepresentations:R01.3/residual-prime-to-coefficient-conductor`.

For a finite-image residual representation ρ̄:G_L→GL_n(F) with char F=ℓ, define N(ρ̄)=N^{Σ_ℓ}(ρ̄), where Σ_ℓ is every finite place above ℓ. This ideal is prime to ℓ. Over Q it is the positive integer ∏_{q≠ℓ}q^{a_q(ρ̄)}. Use raw ρ̄ unless a semisimplification is explicitly indicated.

**Hypotheses.** Finite residual coefficient field, or finite-image representation in an algebraic closure of F_ℓ; ℓ prime.

**Uses.** Serre modularity weights and levels: N is the prime-to-ℓ level. R01.3/residual-elliptic-conductor-away-from-ell: Keeps raw torsion separate from its global semisimplification.

**Proof outline.**

Apply global-away-conductor with exactly the excluded places above ℓ. All remaining local representations have prime-to-residue-characteristic coefficients and finite wild image.

The excluded valuations vanish, proving coprimality. Identify ideals of Z with positive generators over Q. For the raw-to-semisimple inequality, restrict a composition series to inertia: left exactness of invariants gives ε(V^{ss})≤ε(V), while exact averaging on each finite wild p-group gives Sw(V^{ss})=Sw(V). Coefficient extension preserves both terms by conductor-extend-scalars. This argument covers arbitrary finite-image residual representations, without requiring them to lift to an ℓ-adic representation.

**Prerequisites.** `ArithmeticGaloisRepresentations:R01.3/global-away-conductor`, `ArithmeticGaloisRepresentations:R01.3/conductor-extend-scalars`, `ArithmeticGaloisRepresentations:R01.1/semisimplification`, `mathlib:Representation.averageMap`, `mathlib:Representation.invariants`.

**Sources.** Jean-Pierre Serre, §1.2, pp. 180–181, equation (1.2.3): Defines N by omitting the coefficient prime and proves it is prime to that prime.

**Planning API.**

- `TauCeti.ConductorR013.primeToConductor_coprime` (relation): N(ρ̄) is coprime to every prime above ℓ.
- `TauCeti.ConductorR013.primeToConductor_raw_ss` (relation): N(ρ̄^{ss}) divides N(ρ̄); equality is not automatic.
- `TauCeti.ConductorR013.primeToConductor_baseChange` (compatibility): Coefficient extension preserving the action leaves N unchanged.

**Unit tests.**

- `TauCeti.ConductorR013.primeToConductor_trivial` (degenerate): N of the trivial representation is one.
- `TauCeti.ConductorR013.primeToConductor_twoPrimes` (computation): Over Q, apply the product constructor to the formal exponent function a₂=3,a₃=1 and zero elsewhere. Excluding the coefficient prime ℓ=3 gives N=8. The unused value at 3 is not a conductor assertion at the coefficient prime.
- `TauCeti.ConductorR013.primeToConductor_notCoefficientPrime` (non-example): The same formal exponent function, excluding ℓ=2, gives N=3. The unused value at 2 is not supplied by residual conductor theory; neither product may contain its excluded prime.

**Acceptance.** A conductor at the coefficient prime is not supplied by this definition.

### 9. Herbrand function of a separable extension

**Target:** `ArithmeticGaloisRepresentations:R01.3/separable-extension-herbrand`.

For a finite separable L/K, choose finite Galois M/K containing L and put ψ_{L/K}=φ_{M/L}∘ψ_{M/K}, on real parameters ≥0. This increasing piecewise-linear homeomorphism is independent of M. For K⊆L⊆L′, ψ_{L′/K}=ψ_{L′/L}∘ψ_{L/K}. Its inverse is φ_{L/K}; both fix zero.

**Hypotheses.** K is complete discretely valued, with valuation v_K(π)=1 and perfect residue field k of characteristic p>0. Finite Galois subextensions lie in K^sep. Tier F means k finite; tier P permits arbitrary perfect k and depends on the recorded Part II ramification input. L/K finite separable; no Galois hypothesis on L/K.

**Uses.** R01.3/local-induction-formula: Change of variables for restriction to an arbitrary finite extension. R01.3/induction-formula-for-conductors: Slope at infinity supplies the different contribution.

**Proof outline.**

Use finite lower subgroup compatibility in M and upper quotient compatibility under enlargement. The two finite Herbrand maps have the same change-of-group transition under a common Galois overfield, proving independence.

For towers choose a common Galois closure and cancel the intermediate inverse functions. Each map is increasing and piecewise linear with positive slopes, so invertible.

For u≥0, G_K^u∩G_L=G_L^{ψ_{L/K}(u)}. The slope is [G_K:G_K^u G_L]/f(L/K); integration fixes ψ(0)=0. Beyond all breaks the different identity gives ψ(u)=e(L/K)u−d(L/K)+e(L/K)−1.

**Prerequisites.** `ArithmeticGaloisRepresentations:R01.3/absolute-upper-filtration`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-3-ramification-the-tame-and-wild-cases-and-the-filtration`, `mathlib:Ideal.ramificationIdx`.

**Sources.** Jean-Pierre Serre, §3.1, pp. 126–128, Proposition 4 and tower discussion: Supplies the tower calculus of Herbrand maps; the open-subgroup integral is the derived non-Galois formulation. Douglas Ulmer, §3, pp. 2–3: Uses inverse Herbrand substitution between the lower and upper parameter.

**Planning API.**

- `TauCeti.ConductorR013.herbrandExtension_tower` (functoriality): ψ_{L′/K}=ψ_{L′/L}∘ψ_{L/K}.
- `TauCeti.ConductorR013.herbrandExtension_index` (characterisation): ψ(u)=f⁻¹∫₀^u[G_K:G_K^t G_L]dt.
- `TauCeti.ConductorR013.herbrandExtension_eventual` (relation): ψ(u)=eu−d+e−1 beyond the ramification breaks.

**Unit tests.**

- `TauCeti.ConductorR013.herbrandExtension_identity` (degenerate): ψ_{K/K}(u)=u.
- `TauCeti.ConductorR013.herbrandExtension_unramified` (computation): Every finite unramified L/K has ψ(u)=u for u≥0.
- `TauCeti.ConductorR013.herbrandExtension_tame` (computation): For tame L/K of ramification index e, d=e−1 and ψ(u)=eu for every u≥0, independently of its residue degree.

**Acceptance.** The residue degree f divides the slope denominator; using [L:K] instead gives the wrong ramified slope.

### 10. Conductor of an elliptic curve

**Target:** `ArithmeticGaloisRepresentations:R01.3/elliptic-exponent-and-parts`.

For an elliptic curve E/K choose an auxiliary prime ℓ₀≠p and put f(E)=a(V_{ℓ₀}E), ε(E)=dim V_{ℓ₀}E−dim(V_{ℓ₀}E)^{I_K}, δ(E)=Sw(V_{ℓ₀}E). The independence theorem makes these intrinsic and gives f=ε+δ. ε is 0,1,2 for good,multiplicative,additive reduction respectively. Over a number field define N_E=∏_v𝔭_v^{f_v(E)}, choosing ℓ₀ separately at each v; unlike a fixed residual conductor, this product includes every bad prime.

**Hypotheses.** K is complete discretely valued, with valuation v_K(π)=1 and perfect residue field k of characteristic p>0. Finite Galois subextensions lie in K^sep. Tier F means k finite; tier P permits arbitrary perfect k and depends on the recorded Part II ramification input. E is a smooth genus-one projective curve with a specified K-rational origin. T_ℓE is the actual Tate module and V_ℓE=T_ℓE⊗Q_ℓ, ℓ≠p.

**Uses.** R01.6/conductor-comparison: Must import this exponent, reversing the old circular conductor dependency. R29.4: Ogg comparison used in arithmetic modularity.

**Proof outline.**

Import the existing elliptic Tate module and its continuous action from EllipticCurves layer 2. The general abelian construction in R01.6 is not needed to define this elliptic restriction, and its conductor comparison imports the theorem here. Define the exponent using the local Artin and Swan constructions.

Use elliptic-local-independence below for independence of ℓ₀ and the reduction-type tame term. Finitely many bad reductions and integrality give the global ideal.

The dual has the same conductor by the reviewed conductor-dual theorem; H¹_et and V_ℓE have the required dual comparison.

**Prerequisites.** `ArithmeticGaloisRepresentations:R01.3/artin-from-actual-inertia`, `ArithmeticGaloisRepresentations:R01.3/elliptic-local-independence`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-2-torsion-the-weil-pairing-and-the-tate-module-aec-iii68`, `ArithmeticGaloisRepresentations:R01.3/conductor-dual`, `ArithmeticGaloisRepresentations:R01.3/global-away-conductor`, `mathlib:WeierstrassCurve.IsElliptic`, `mathlib:WeierstrassCurve.minimal`, `mathlib:WeierstrassCurve.HasGoodReduction`, `mathlib:WeierstrassCurve.HasMultiplicativeReduction`, `mathlib:WeierstrassCurve.HasAdditiveReduction`.

**Sources.** Jean-Pierre Serre, §2.4, PDF p. 10: The elliptic tame term is 0,1,2 and the wild term vanishes outside 2 and 3. Henri Darmon, Fred Diamond and Richard Taylor, §2.2, Propositions 2.11–2.13 and Remark 2.14, pp. 57–58: Connects the Tate-module exponent with the elliptic conductor.

**Planning API.**

- `TauCeti.ConductorR013.ellipticConductor_eq_parts` (characterisation): f(E)=ε(E)+δ(E), with ε determined by the reduction type.
- `TauCeti.ConductorR013.ellipticConductor_allEll` (compatibility): For every prime ℓ≠p, a(V_ℓE)=f(E) and Sw(E[ℓ])=δ(E).
- `TauCeti.ConductorR013.ellipticConductor_dual` (functoriality): a((V_ℓE)∨)=f(E), and isogenous elliptic curves have the same exponent.

**Unit tests.**

- `TauCeti.ConductorR013.ellipticConductor_good` (degenerate): Good reduction has (ε,δ,f)=(0,0,0).
- `TauCeti.ConductorR013.ellipticConductor_multiplicative` (computation): Split or nonsplit multiplicative reduction has (ε,δ,f)=(1,0,1).
- `TauCeti.ConductorR013.ellipticConductor_additiveTame` (computation): Additive reduction in residue characteristic p≥5 has (ε,δ,f)=(2,0,2); this triple is not asserted for additive reduction at 2 or 3.

**Acceptance.** N_E includes the primes above any auxiliary ℓ₀ because its definition uses another auxiliary prime at those places.

### 11. Common finite inertia action under potential good reduction

**Target:** `ArithmeticGaloisRepresentations:R01.3/potential-good-common-inertia`.

If an elliptic curve E/K acquires good reduction over a finite extension, the inertia action on T_ℓE has finite image for every ℓ≠p. Its kernel is independent of ℓ, and the characteristic polynomial of every inertia element has integral coefficients independent of ℓ. Conversely finite inertia image implies potential good reduction. The theorem applies to complete discretely valued K with perfect residue field; no restriction to residue characteristic at least five.

**Hypotheses.** K is complete discretely valued, with valuation v_K(π)=1 and perfect residue field k of characteristic p>0. Finite Galois subextensions lie in K^sep. Tier F means k finite; tier P permits arbitrary perfect k and depends on the recorded Part II ramification input. E/K an elliptic curve, ℓ prime and ℓ≠p.

**Proof outline.**

Import potential-good reduction and the good-model/Tate-module specialisation from EllipticCurves for E. Over a finite Galois good-reduction extension, inertia acts on the good special fibre by automorphisms.

Serre–Tate Theorem 2 extends inertia to automorphisms of the good special fibre and compares every Tate-module action. Faithfulness gives the common kernel. The theorem states integral, ℓ-independent traces; the imported endomorphism characteristic-polynomial theorem supplies integral, ℓ-independent polynomials (the traces of all powers also determine them in characteristic zero).

Finite inertia image kills inertia over a finite extension, so the Néron–Ogg–Shafarevich criterion gives the converse. The source proof uses the torsion-free congruence kernel and bounds tame primes by 3.

**Prerequisites.** `tauceti:TauCetiRoadmap/EllipticCurves#layer-2-torsion-the-weil-pairing-and-the-tate-module-aec-iii68`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`.

**Sources.** Jean-Pierre Serre and John Tate, §2, Theorem 2 and Corollary 2 with their proofs, pp. 496–498: Theorem 2 gives the common inertia kernel and integral, ℓ-independent traces under potential good reduction. Corollary 2 supplies the potential-good criterion; characteristic-polynomial independence uses the good-fibre endomorphism comparison.

**Acceptance.** For an elliptic curve with potential good reduction, the finite inertia action comes from automorphisms of a good elliptic special fibre; its order divides 24.

### 12. Elliptic conductor independence and wild vanishing

**Target:** `ArithmeticGaloisRepresentations:R01.3/elliptic-local-independence`.

For E/K and every prime ℓ≠p, ε(V_ℓE)=0,1,2 according as the minimal equation has good,multiplicative,additive reduction. The Swan term is independent of ℓ and equals Sw(E[ℓ]). It vanishes for p≥5, good reduction, and multiplicative reduction. Thus a(V_ℓE) and a((V_ℓE)∨) are independent of ℓ. Potentially multiplicative E is a quadratic twist of a Tate curve; if the twisting character χ is ramified then a(V_ℓE)=2a(χ), including wild χ at 2.

**Hypotheses.** K is complete discretely valued, with valuation v_K(π)=1 and perfect residue field k of characteristic p>0. Finite Galois subextensions lie in K^sep. Tier F means k finite; tier P permits arbitrary perfect k and depends on the recorded Part II ramification input. ℓ≠p; no general ℓ-adic independence claim for arbitrary geometric representations is inferred.

**Proof outline.**

Good reduction uses Néron–Ogg–Shafarevich; multiplicative reduction uses the Tate curve and its rank-one unipotent tame inertia, including the unramified nonsplit twist.

Potential good reduction uses potential-good-common-inertia: finite inertia traces are integral and independent of ℓ. Averaging over every wild group turns the common traces into common invariant dimensions and Swan sums. For p≥5 the elliptic special-fibre automorphism group has order prime to p, so wild inertia is trivial.

For potentially multiplicative reduction, the Tate curve representation is twisted by the quadratic character; its cyclotomic factor is unramified away from ℓ. A ramified quadratic character has no inertia invariants; its two copies contribute the wild term, giving 2a(χ).

The reduction theorem preserves Swan on the actual Tate lattice. The tame terms follow from the identity component of the special fibre and the minimal reduction predicates, requested from the upstream elliptic roadmap.

**Prerequisites.** `ArithmeticGaloisRepresentations:R01.3/potential-good-common-inertia`, `ArithmeticGaloisRepresentations:R01.3/swan-conductor-of-reduction`, `ArithmeticGaloisRepresentations:R01.3/conductor-dual`, `ArithmeticGaloisRepresentations:R01.3/conductor-twist-unramified-tame`, `ArithmeticGaloisRepresentations:R01.3/conductor-twist-dominant-character`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-2-torsion-the-weil-pairing-and-the-tate-module-aec-iii68`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`.

**Sources.** Jean-Pierre Serre, §§2.3–2.4, PDF pp. 9–10: Elliptic tame and wild terms and their vanishing. Henri Darmon, Fred Diamond and Richard Taylor, Propositions 2.11–2.13, pp. 57–58: Good and multiplicative inertia and the additive lower bound. Jean-Pierre Serre and John Tate, §2, Theorem 2, pp. 496–498: Common finite inertia action provides the ℓ-independence input.

**Acceptance.** At Q₂ a ramified quadratic twist of a Tate curve can have f=4 or 6; f=2 is not universal for additive reduction.

### 13. Cohomological Artin conductor of a regular curve

**Target:** `ArithmeticGaloisRepresentations:R01.3/surface-artin-conductor`.

Let R be a henselian DVR with algebraically closed residue field k of characteristic p>0, K its fraction field, C/K smooth proper geometrically connected of genus g≥1, and X/R its minimal proper regular model. For ℓ≠p define Art(X/R)=χ_et(C_K̄,Q_ℓ)−χ_et(X_k,Q_ℓ)−Sw(H¹_et(C_K̄,Q_ℓ))∈Z. The sign is the cohomological convention: for a singular degeneration it is typically nonpositive. For a semistable curve it equals minus the number of geometric nodes.

**Hypotheses.** The relative surface is minimal, proper, regular and flat; étale Euler characteristic counts all degrees. This node is not a definition for arbitrary nonproper models.

**Uses.** R01.3/saito-verified-statement: The cohomological side of the discriminant theorem. R01.3/uniform-ogg-comparison: Converts the surface invariant to m−1+f.

**Proof outline.**

Import the minimal regular model from StableReduction. Use finite-dimensional étale cohomology with its continuous Galois action; the new curve-cohomology input in this scope is recorded as a gap rather than cited from a higher tier.

Form the Euler difference minus the Swan term. Independence and proper specialisation are the precise curve-cohomology input, not consequences of the linear representation alone.

**Prerequisites.** `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`, `tauceti:TauCetiRoadmap/StableReduction#layer-5-regular-and-minimal-models`, `ArithmeticGaloisRepresentations:R01.3/swan-from-breaks`.

**Sources.** Qing Liu, §2, p. 1: Defines the sign and relates the surface invariant to the curve conductor when component multiplicities have gcd one. Qing Liu, Introduction, p. 51: Uses the same cohomological Artin invariant of the minimal regular model.

**Planning API.**

- `TauCeti.ConductorR013.surfaceArtin_good` (simp): A smooth proper model has Art=0.
- `TauCeti.ConductorR013.surfaceArtin_semistable` (characterisation): For a semistable model, Art is minus the number of geometric ordinary double points.
- `TauCeti.ConductorR013.surfaceArtin_genusOne` (relation): For a minimal regular genus-one model with a section, −Art=m−1+f, where m counts geometric irreducible components without multiplicities.

**Unit tests.**

- `TauCeti.ConductorR013.surfaceArtin_smoothElliptic` (degenerate): A smooth elliptic special fibre gives χ_generic=χ_special=0 and Sw=0, hence Art=0.
- `TauCeti.ConductorR013.surfaceArtin_nodalCubic` (computation): A nodal rational special fibre has χ_special=1, χ_generic=0, Sw=0 and Art=−1.
- `TauCeti.ConductorR013.surfaceArtin_splitPolygon` (computation): For a split I_n fibre, χ_special=n and Sw=0, so Art=−n, although the curve conductor is 1.

**Acceptance.** For genus one with a section, −Art=m−1+f.

### 14. Determinant discriminant order

**Target:** `ArithmeticGaloisRepresentations:R01.3/determinant-discriminant-order`.

In the surface setting let ω=ω_{X/R} be the invertible relative dualising sheaf. Put M=det Rf_*(ω^⊗2) and L=det Rf_*ω, regarded as rank-one R-lattices. The canonical smooth-curve discriminant isomorphism Δ_K:M_K≃L_K^⊗13 determines the unique integer d with Δ_K(M)=π^d L^⊗13; define ordΔ_{X/R}=d. In genus one with a section, Δ_K is the composite of the canonical determinant identification M_K≃L_K and multiplication by the equation-independent tensor Δ_min·ω_min^⊗12.

**Hypotheses.** The determinant objects require perfect complexes, proper curve duality and flat minimal regular models; these restricted curve inputs are recorded, not assumed to be in the pinned library.

**Uses.** R01.3/saito-verified-statement: The geometric discriminant side. R01.3/uniform-ogg-comparison: Identifies the determinant order with the minimal equation discriminant.

**Proof outline.**

Choose bases of the two rank-one lattices. The generic isomorphism is multiplication by a nonzero scalar; its normalised valuation gives d, unchanged by unit changes of bases.

For genus one, the evaluation of the invariant differential trivialises the generic dualising sheaf and χ(ω)=0. Determinant functoriality gives M_K≃L_K. Under a Weierstrass variable change, the discriminant and the twelfth tensor power of the differential compensate, giving a coordinate-independent Δ tensor.

The restricted minimal-model comparison identifies the integral differential lattice with the minimal Weierstrass differential; the determinant identification extends as a unit. Thus this d is v_K(Δ_min), not an arbitrary equation discriminant.

**Prerequisites.** `ArithmeticGaloisRepresentations:R01.3/elliptic-minimal-model-comparison`, `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`, `tauceti:TauCetiRoadmap/StableReduction#layer-5-regular-and-minimal-models`.

**Sources.** Qing Liu, §3, p. 2; §4, pp. 2–4: Defines the determinant lattices and discriminant order; constructs the genus-one isomorphism explicitly. Qing Liu, §2.1, pp. 58–59: Records the conductor–discriminant formulation.

**Planning API.**

- `TauCeti.ConductorR013.discriminantOrder_basisIndependent` (extensionality): Changing either R-basis by a unit leaves d unchanged.
- `TauCeti.ConductorR013.discriminantOrder_extension` (characterisation): d≥0 exactly when Δ_K extends to a lattice homomorphism; d=0 exactly when it extends to an isomorphism.
- `TauCeti.ConductorR013.discriminantOrder_genusOne` (compatibility): For the minimal regular elliptic model, d=v_K(Δ_min).

**Unit tests.**

- `TauCeti.ConductorR013.discriminantOrder_good` (degenerate): For a smooth elliptic model, the discriminant is a unit and d=0.
- `TauCeti.ConductorR013.discriminantOrder_I_n` (computation): For split multiplicative type I_n, d=n.
- `TauCeti.ConductorR013.discriminantOrder_nonminimal` (non-example): Replacing a minimal equation by the integral scaling with discriminant multiplied by π^12 changes its equation valuation by 12 but leaves ordΔ of the minimal regular model unchanged.

**Acceptance.** A nonminimal equation can change v(Δ) by 12 and cannot define this intrinsic order.

### 15. Minimal regular elliptic model and smooth locus

**Target:** `ArithmeticGaloisRepresentations:R01.3/elliptic-minimal-model-comparison`.

For a minimal Weierstrass model W/R of E/K, its minimal resolution X is the minimal proper regular model. The smooth locus X^sm is the Néron model, and its identity component agrees with the smooth locus of W. The relative dualising lattice H⁰(X,ω_{X/R}) is generated by the minimal invariant differential. The geometric irreducible-component count m of X_k includes components of every multiplicity; it is not the cardinality of the Néron component group.

**Hypotheses.** R henselian DVR with algebraically closed residue field; E/K elliptic; use the minimal equation, not any integral equation.

**Proof outline.**

Use the restricted minimal Weierstrass resolution and contraction statements of StableReduction. The Weierstrass model is normal, and the components contracted to it give rational double-point singularities; the resolution identifies the canonical differential lattice.

Identify the smooth locus by the Néron mapping property for smooth test schemes; no full higher-tier Néron-model theory is imported. Liu’s lemma and proof give the exact restricted genus-one comparison.

Record the move downward: this conductor prerequisite is owned here and NeronModelsAndSemistableAbelianVarieties R11.2 must import it. General Néron models remain that roadmap’s responsibility.

**Prerequisites.** `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`, `tauceti:TauCetiRoadmap/StableReduction#layer-5-regular-and-minimal-models`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`.

**Sources.** Qing Liu, §4, lemma and proof, pp. 3–4: The minimal Weierstrass resolution, smooth-locus comparison and invariant-differential lattice are the genus-one inputs.

**Acceptance.** For I₀* the regular special fibre has five geometric components, while the Néron component group need not have order five.

### 16. Saito conductor–discriminant theorem in the verified scope

**Target:** `ArithmeticGaloisRepresentations:R01.3/saito-verified-statement`.

For R henselian DVR with algebraically closed residue field of characteristic p>0 and C/K smooth proper geometrically connected of genus at least one, let X/R be its minimal proper regular model. With the preceding cohomological and determinant conventions, ordΔ_{X/R}=−Art(X/R), in every positive residue characteristic, including mixed characteristic (0,2). This is the statement restated in Liu’s notes, §3. Its original finite-extension defect proof remains the specifically recorded source/proof gap.

**Hypotheses.** Exactly the hypotheses of Liu’s author-hosted restatement; no assertion for arbitrary regular nonminimal or nonproper surfaces.

**Proof outline.**

Liu’s §3 states the theorem in this scope and explains reduction to the semistable case by matching both sides under finite extensions.

To turn that explanation into a closed prerequisite chain one must supply the discriminant and cohomological Artin change-of-base defect identity from Saito’s original proof. Neither determinant functoriality nor semistable reduction alone proves it; this input remains a named gap.

**Prerequisites.** `ArithmeticGaloisRepresentations:R01.3/surface-artin-conductor`, `ArithmeticGaloisRepresentations:R01.3/determinant-discriminant-order`, `tauceti:TauCetiRoadmap/StableReduction#layer-5-regular-and-minimal-models`.

**Sources.** Qing Liu, §3, Theorem, p. 2; §4, pp. 4–5: Explicitly restates Saito Theorem 1 and applies it uniformly to elliptic curves. Qing Liu, §2.1, pp. 58–59: Independently gives the same conductor–discriminant statement.

**Acceptance.** The mixed-characteristic dyadic case is included in the verified statement, but not claimed proved from the available sources.

### 17. Uniform Ogg formula

**Target:** `ArithmeticGaloisRepresentations:R01.3/uniform-ogg-comparison`.

For E/K in the complete perfect-residue-field setting, let X be its minimal proper regular model and m the number of geometric irreducible components of its special fibre, counted once each, irrespective of multiplicities. Then v_K(Δ_min)=f(E)+m−1. The formula includes wild reduction at 2 and 3. Over strictly henselian/algebraically closed residue fields it follows from the preceding genus-one determinant and cohomological comparisons; passage from K to that setting uses the unramified model and conductor invariance inputs.

**Hypotheses.** K is complete discretely valued, with valuation v_K(π)=1 and perfect residue field k of characteristic p>0. Finite Galois subextensions lie in K^sep. Tier F means k finite; tier P permits arbitrary perfect k and depends on the recorded Part II ramification input. X is proper and minimal regular. E has its rational origin, so the gcd of component multiplicities is one.

**Proof outline.**

After strict henselisation and completion, use the geometric m and the minimal-model base-change input. Unramified extension preserves conductor, valuation and geometric components.

For genus one with a section, the Euler-characteristic identity gives −Art=m−1+f, without discarding wild δ. The minimal-differential comparison gives ordΔ=vΔ_min. Saito’s theorem equates these two integers.

Use the upstream Tate-algorithm tables only to compute particular fibres, not as a proof covering all wild cases. This theorem is the conductor comparison imported by R01.6 and by R29.4.

**Prerequisites.** `ArithmeticGaloisRepresentations:R01.3/saito-verified-statement`, `ArithmeticGaloisRepresentations:R01.3/elliptic-minimal-model-comparison`, `ArithmeticGaloisRepresentations:R01.3/surface-artin-conductor`, `ArithmeticGaloisRepresentations:R01.3/elliptic-exponent-and-parts`, `ArithmeticGaloisRepresentations:R01.3/conductor-unramified-base-change`, `tauceti:TauCetiRoadmap/StableReduction#layer-5-regular-and-minimal-models`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`.

**Sources.** Qing Liu, Equation (1), p. 1; §4, pp. 4–5: Proves the genus-one deduction from Saito, explicitly addressing the case absent from Ogg’s original proof. Henri Darmon, Fred Diamond and Richard Taylor, Remark 2.14, p. 58: Identifies the elliptic Tate-module conductor with the Ogg formula.

**Acceptance.** For I_n, (vΔ,m,f)=(n,n,1). For good reduction, (vΔ,m,f)=(0,1,0). For tame I₀*, (vΔ,m,f)=(6,5,2); replacing m by the component-group cardinality breaks the formula.

### 18. Brumer–Kramer digit function

**Target:** `ArithmeticGaloisRepresentations:R01.3/brumer-kramer-digit-function`.

For a prime p and n=Σ_{i≥0}r_i p^i with 0≤r_i<p, define λ_p(n)=Σ_i i r_i p^i∈N. Define λ_p(0)=0. The weight is the digit position multiplied by p^i, not merely the sum of the digits or their positions.

**Hypotheses.** p prime; the definition also makes sense for any integer base p≥2.

**Uses.** Brumer–Kramer, Theorems 5.5 and 6.2: Combines bounds for simple wild constituents of p-power dimension.

**Proof outline.**

Use the finite base-p digit expansion of n. Multiplying each digit by its position and place value gives the finite sum.

For any finitely supported nonnegative s_i with n=Σ_i s_i p^i, carrying p copies at i to one at i+1 increases the weighted value by p^{i+1}. Therefore Σ_i i s_i p^i≤λ_p(n).

**Prerequisites.** `mathlib:Nat.digits`.

**Sources.** Armand Brumer and Kenneth Kramer, §1, p. 227, definition of λ_p; Theorem 5.5 and its proof, p. 242: The introduction defines the weighted base-p digit sum; the proof of Theorem 5.5 uses the carry inequality. Equation (5.6) is the constituent conductor estimate, not the definition.

**Planning API.**

- `TauCeti.ConductorR013.digitWeight_zero` (simp): λ_p(0)=0.
- `TauCeti.ConductorR013.digitWeight_singlePlace` (simp): For 0≤r<p, λ_p(r p^i)=i r p^i.
- `TauCeti.ConductorR013.digitWeight_carry` (relation): For n=Σ_i s_i p^i with arbitrary nonnegative finite s_i, Σ_i i s_i p^i≤λ_p(n).

**Unit tests.**

- `TauCeti.ConductorR013.digitWeight_smallDigit` (degenerate): If 0≤n<p, λ_p(n)=0.
- `TauCeti.ConductorR013.digitWeight_binaryTwo` (computation): λ₂(2)=2, λ₂(3)=2 and λ₂(4)=8.
- `TauCeti.ConductorR013.digitWeight_ternary` (computation): λ₃(3)=3 and λ₃(6)=6; λ₃(2)=0.

**Acceptance.** λ₂(2)=2 and λ₂(4)=8.

### 19. Brumer–Kramer Swan bound

**Target:** `ArithmeticGaloisRepresentations:R01.3/brumer-kramer-wild-bound`.

Let K be a finite extension of Q_p with e_K=v_K(p), M/K finite Galois, G=Gal(M/K), and V a finite-dimensional F[G]-module, char F≠p. Assume either (i) p odd and [F(μ_{p²}):F]=p(p−1), or p=2 and [F(μ₈):F]=4; or (ii) p=2, V restricted to G₁ is isomorphic to its dual, [F(μ₈):F]=2 and 2 is not a square in F. Then dim V−dim V^{G₁}=(p−1)d₁ for an integer d₁≥0, and Sw(V)≤e_K[pd₁+(p−1)λ_p(d₁)]. Self-duality in (ii) means an isomorphism of G₁-modules, not merely real-valued trace.

**Hypotheses.** Mixed characteristic with finite K/Q_p; no claim for all perfect residue fields or equal characteristic. The exact root-of-unity and self-duality hypotheses are required.

**Proof outline.**

Over the fixed field K₁ of G₁, decompose the nontrivial wild part into simple or *-simple constituents W_j, counting repeated constituents. Put m_j=m_F(W_j) and i_j=δ_F(W_j). The rational-lift and character-field formulas give dim W_j=m_j(p−1)p^{i_j}, not (p−1)p^{i_j} without the Schur-index factor. The constituent estimate gives Sw(W_j)≤e_{K₁}m_j[p+(p−1)i_j]p^{i_j}.

Put s_i=Σ_{j:i_j=i}m_j, so d₁=Σ_i s_i p^i. Additivity gives the bound e_{K₁}[pd₁+(p−1)Σ_i i s_i p^i], and carrying gives Σ_i i s_i p^i≤λ_p(d₁). In the exceptional dyadic case the decomposition is into *-simple self-dual constituents, as in Theorem 5.5(ii).

The finite wild extension is over the fixed field of G₁. Its absolute ramification index scales by the tame index; the Swan base-change formula cancels that index and leaves e_K. No coarser group-order estimate replaces the constituent bound.

**Prerequisites.** `ArithmeticGaloisRepresentations:R01.3/brumer-kramer-digit-function`, `ArithmeticGaloisRepresentations:R01.3/brumer-kramer-constituent-estimate`, `ArithmeticGaloisRepresentations:R01.3/swan-from-breaks`.

**Sources.** Armand Brumer and Kenneth Kramer, §§3–4, pp. 231–240; Corollary 5.3 and Theorem 5.5, pp. 241–242: The conductor estimates and integral-trace lifts combine to give this exact root-of-unity-sensitive bound.

**Acceptance.** For p=2,d₁=2, the bracket is 4+λ₂(2)=6, not the value from an unweighted digit sum.

### 20. Sharp small-prime elliptic conductor bounds

**Target:** `ArithmeticGaloisRepresentations:R01.3/elliptic-sharp-exponent-bounds`.

For E/K with K a finite extension of Q_p, f(E)≤2+6v_K(2) if p=2, f(E)≤2+3v_K(3) if p=3, and f(E)≤2 if p≥5. In particular over Q one has f₂≤8,f₃≤5 and f_q≤2 for q≥5. These are Brumer–Kramer bounds; no unverified Lockhart–Rosen–Silverman attribution is used.

**Hypotheses.** K finite over Q_p and E elliptic; these numeric mixed-characteristic bounds are not extended to k((t)).

**Proof outline.**

Use Theorem 6.2 of Brumer–Kramer for g=1: d=⌊2/(p−1)⌋ and f≤2+e_K[pd+(p−1)λ_p(d)].

For the elliptic specialization choose ℓ=3 when p=2: [F₃(μ₈):F₃]=2 and 2 is nonsquare in F₃. The canonical principal polarization gives a perfect G₁-invariant alternating pairing on E[3], since the prime-to-p cyclotomic action is unramified, hence dyadic self-duality. When p=3 choose ℓ=2: [F₂(μ₉):F₂]=ord₉(2)=6. Apply the Swan bound to these raw torsion modules, use elliptic-local-independence, and bound the tame term by two. For p≥5 use the already established vanishing of the elliptic Swan term. These concrete choices require no theorem about auxiliary primes in arithmetic progressions.

Evaluate d and λ: at 2, d=2 and λ₂(2)=2; at 3, d=1 and λ₃(1)=0; at p≥5,d=0.

**Prerequisites.** `ArithmeticGaloisRepresentations:R01.3/brumer-kramer-wild-bound`, `ArithmeticGaloisRepresentations:R01.3/elliptic-local-independence`, `ArithmeticGaloisRepresentations:R01.3/brumer-kramer-digit-function`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-2-torsion-the-weil-pairing-and-the-tate-module-aec-iii68`.

**Sources.** Armand Brumer and Kenneth Kramer, Theorem 6.2 and its proof, p. 243: Bounds the abelian conductor using the choice of auxiliary ℓ and the polarization; specialising to g=1 gives these values.

**Acceptance.** At Q₂ the bound is eight; the weaker wild-image bound does not establish it.

### 21. Conductor comparison for the Weil–Deligne correspondence

**Target:** `ArithmeticGaloisRepresentations:R01.3/wd-actual-inertia-invariants`.

For an ℓ-adic representation ρ over a finite extension of Q_ℓ, ℓ≠p, and its genuine Weil–Deligne pair (r,N), V^{ρ(I_K)}=(ker N)∩V^{r(I_K)}. Consequently Sw(ρ)=Sw(r) and a(ρ)=a(r,N). The tame character t_ℓ must be nonzero on every open inertia subgroup, and r(I_K) must be finite. An arbitrary tuple satisfying only a formal exponential equality with t_ℓ=0 does not suffice.

**Hypotheses.** K is complete discretely valued, with valuation v_K(π)=1 and perfect residue field k of characteristic p>0. Finite Galois subextensions lie in K^sep. Tier F means k finite; tier P permits arbitrary perfect k and depends on the recorded Part II ramification input. Finite residue field; all inertia and tame-character identifications are those of R01.2’s actual correspondence.

**Proof outline.**

Consume R01.2’s genuine correspondence, including its invariant-space identity V^{ρ(I_K)}=(ker N)∩V^{r(I_K)} and equality of the wild actions. These are supplier outputs, not newly planned constructions here. In that supplier proof, finite r(I_K) and the tame character’s nonzero image on every open inertia subgroup are essential; the polynomial exponential argument gives Nv=0 for a fixed vector.

Apply the invariant identity to the actual tame codimension and the equal wild actions to the Swan sum. Substitute into wd-from-monodromy to obtain a(ρ)=a(r,N). This node is the consumer conductor comparison, with the existing monodromy construction imported from R01.2.

**Prerequisites.** `ArithmeticGaloisRepresentations:R01.3/wd-from-monodromy`, `ArithmeticGaloisRepresentations:R01.2/grothendieck-monodromy-and-the-weil-deligne-functor`, `ArithmeticGaloisRepresentations:R01.3/artin-from-actual-inertia`.

**Sources.** Douglas Ulmer, §8, end, p. 7; §9, Theorem 1, p. 7: Compares actual inertia invariants with the monodromy-kernel invariants and the resulting conductor.

**Acceptance.** Unramified r with one nonzero 2×2 nilpotent block has invariant dimension one for ρ, not two.

### 22. Artin conductor and the local reciprocity conductor

**Target:** `ArithmeticGaloisRepresentations:R01.3/character-conductor-reciprocity`.

For a continuous finite-image characteristic-zero character χ:G_K^ab→F× of a nonarchimedean local field, a(χ)=characterConductorExp(χ∘Art_K). The right side is the least n≥0 on whose unit-filtration subgroup U_K^n the multiplicative character is trivial, with U_K^0=O_K×. It uses arithmetic reciprocity; reversing reciprocity does not change the exponent.

**Hypotheses.** Finite inertia image and a coefficient tier in which the character-conductor minimum is attained. The requested unit/upper-filtration compatibility is essential.

**Proof outline.**

The local reciprocity input says Art_K(U_K^n) is dense in the image of G_K^n in the topological abelianization, including n=0. Continuity to a Hausdorff finite image turns density into equality of the kernels tested by χ.

For a ramified character, the largest upper break u is integral by the abelian Hasse–Arf theorem; the first unit subgroup in its kernel is U^{u+1}. Thus its conductor is u+1=a(χ). The unramified case has both minima zero.

**Prerequisites.** `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-3-ramification-the-tame-and-wild-cases-and-the-filtration`, `ArithmeticGaloisRepresentations:R01.3/absolute-upper-filtration`, `ArithmeticGaloisRepresentations:R01.3/conductor-of-a-character`.

**Sources.** Jean-Pierre Serre, §§3.5–3.7: Corollary 1 to Proposition 8, p. 136; Propositions 9–10 and Theorem 2, pp. 137–139: The abelian upper-break calculation and Artin integrality supply the representation side. The reciprocity construction in these sections uses algebraically closed residue fields and proalgebraic unit groups; ordinary local-field reciprocity transport remains the explicit ClassFieldTheory supplier request.

**Acceptance.** Unramified character: exponent zero. Nontrivial tame character: exponent one. Over Q₂, χ₋₄ and χ₈ have exponents two and three.

### 23. Rational lift for the sharp conductor estimate

**Target:** `ArithmeticGaloisRepresentations:R01.3/brumer-kramer-rational-lift`.

Let H be a finite p-group and F a field of characteristic different from p. Under Brumer–Kramer Theorem 5.5(i), let W be simple; under its (ii), let p=2 and W be self-dual and *-simple (having no proper nonzero self-dual submodule). There is a torsion-free finite-rank Z[H]-module M with M_Q simple and m_Q(M_Q)·W≃m_F(W)·M_F. Here m denotes Schur index; in case (ii), m_F(W)=1 and the displayed right multiplicity is one. For every lower ramification subgroup J≤H the same multiplicity-weighted invariant dimensions agree, hence m_Q(M_Q)a(W)=m_F(W)a(M_Q). This is a rational constituent lift, stronger than merely lifting a split simple module to characteristic zero.

**Hypotheses.** The field/root/self-duality hypotheses are exactly those stated in brumer-kramer-wild-bound. *-simple modules are either simple self-dual modules or U⊕U∨ with U nonself-dual simple.

**Proof outline.**

Use the character-value field and Schur-index dictionary from the existing projective-representation interface. For cyclic H, the unique faithful F-module is a cyclotomic field; the root-degree condition controls its rational orbit.

Proposition 4.4 reduces a faithful simple module either to H=C_p, H=Q₈, or m(U)W≃m(W)Ind_J^H U for a proper subgroup J. Its proof uses Clifford theory on an abelian normal subgroup and the classification of p-groups with only cyclic abelian normal subgroups. The dihedral/semidihedral and generalized quaternion cases are explicitly handled on pp. 236–237.

For the self-dual dyadic case, Proposition 4.6 carries out the same induction on *-simple modules. Mackey intertwining and disjoint abelian-character orbits show that the induced integral rational module is simple; averaging preserves each subgroup-invariant rank.

These p-group classification and Schur-index refinements are precise representation-theory requests, rather than an assertion that modular Maschke supplies a rational form. The arithmetic conductor equality follows by summing the invariant codimensions with the same weights.

**Prerequisites.** `ArithmeticGaloisRepresentations:R01.3/prime-to-characteristic-simple-lifting`, `tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-5-clifford-theory-over-a-normal-subgroup`, `tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-7-projective-representations-factor-sets-and-the-schur-multiplier`, `ArithmeticGaloisRepresentations:R01.3/artin-from-actual-inertia`.

**Sources.** Armand Brumer and Kenneth Kramer, Proposition 4.4, pp. 236–237; Corollary 4.5, p. 237; Proposition 4.6 and proof, pp. 237–239: Constructs the multiplicity-weighted integral rational forms, including the special self-dual dyadic case.

**Acceptance.** A quaternionic rational representation can have Schur index two; dropping the multiplicities gives a false lift statement.

### 24. Wild constituent conductor estimate

**Target:** `ArithmeticGaloisRepresentations:R01.3/brumer-kramer-constituent-estimate`.

Let M/K be a totally wildly ramified Galois extension of p-adic fields. For a simple Q[Gal(M/K)]-module U put δ_Q(U)=ord_p(dim_Q U)−ord_p(m_Q(U)). Then a(U)≤dim U+[δ_Q(U)+p/(p−1)]e_K dim U. Equivalently an ordinary nontrivial irreducible character φ of degree p^d and character field degree [Q(φ):Q]=(p−1)p^{h−1} satisfies a(φ)≤[1+e_K(h+d)+e_K/(p−1)]φ(1). Via brumer-kramer-rational-lift, Sw(W)≤[δ_F(W)+p/(p−1)]e_K dim W for the simple or *-simple W under Theorem 5.5’s hypotheses, where δ_F(W)=ord_p(dim W)−ord_p(m_F(W)).

**Hypotheses.** K finite over Q_p, normalised valuation, M/K totally wild; m denotes the actual Schur index.

**Proof outline.**

Base cases: for C_p, the different bound d≤p−1+pe_K gives a(nontrivial character)≤1+pe_K/(p−1). For Q₈, Proposition 3.7 gives a(φ)≤2+6e_K for its faithful degree-two character.

Induct on the group order using Proposition 4.4’s proper-subgroup rational induction. For a subgroup of index p^n, the local induction formula contributes the discriminant, bounded by p^n−1+np^n e_K (Lemma 3.1). Its proof is the Eisenstein derivative estimate: the valuations of j a_j π^{j−1} lie in distinct residue classes modulo p^n, so the least valuation bounds the derivative by the last term.

Track the dimension and Schur-index multiplicities through the induction. The p-adic order δ increases by the subgroup-index exponent, producing precisely the claimed coefficient.

Transfer the rational bound with brumer-kramer-rational-lift, then subtract dim W when no inertia invariant survives. Trivial constituents have Swan zero. This gives Corollary 5.3 and is the key arithmetic input for the digit-sum bound.

**Prerequisites.** `ArithmeticGaloisRepresentations:R01.3/brumer-kramer-rational-lift`, `ArithmeticGaloisRepresentations:R01.3/local-induction-formula`, `ArithmeticGaloisRepresentations:R01.3/artin-from-actual-inertia`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-3-ramification-the-tame-and-wild-cases-and-the-filtration`.

**Sources.** Armand Brumer and Kenneth Kramer, Lemma 3.1, pp. 231–232; Corollary 3.2, p. 232; Proposition 3.7, pp. 233–234; Theorem 5.1, pp. 239–240; Corollary 5.3, p. 241: The cyclic and quaternion base cases plus induction give the rational and transferred constituent bounds.

**Acceptance.** For p=2 and the faithful quaternionic degree-two character, the character bound is 2+6e_K. For a simple wild constituent of dimension (p−1)p^i with Schur index one, the Swan bound is e_K[p+(p−1)i]p^i.

## Supplier contracts and ownership

### tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-3-ramification-the-tame-and-wild-cases-and-the-filtration

Import the canonical lower/upper filtration, finite quotient Herbrand theorem, subgroup/tower calculus, different and Hasse–Arf from this existing roadmap. Its current nonarchimedean-local-field scope is tier F. For tier P, the same declarations for complete DVR fields with arbitrary perfect residue field are a LocalFieldsRamification, Part II extension, justified by Serre 1961 §3.1; do not define a second finite filtration here.

Consumed by: `ArithmeticGaloisRepresentations:R01.3/absolute-upper-filtration`, `ArithmeticGaloisRepresentations:R01.3/swan-from-breaks`, `ArithmeticGaloisRepresentations:R01.3/separable-extension-herbrand`, `ArithmeticGaloisRepresentations:R01.3/character-conductor-reciprocity`.

### tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-4-the-tame-quotient-of-the-absolute-galois-group

Use the canonical inertia and wild-inertia subgroups, their closed normal/pro-p structure and their finite images G₀/G₁, with the exact separable-closure carrier. Current Tau Ceti provides wild inertia after the pin, so these are roadmap imports, not pinned declaration claims.

Consumed by: `ArithmeticGaloisRepresentations:R01.3/absolute-upper-filtration`.

### tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-5-clifford-theory-over-a-normal-subgroup

Supply split semisimple simple-character/central-idempotent correspondence, degrees of irreducible p-group characters as powers of p, and extension of a simple H-module stable under T with cyclic T/H. For the Brumer–Kramer rational lift, export classification of finite p-groups with only cyclic abelian normal subgroups, Clifford induction of rational constituents and the multiplicity/Schur-index dictionary (their Proposition 4.4). The arithmetic cyclic/quaternion estimates and rational-lift application are owned here, not requested as generic representation theory.

Consumed by: `ArithmeticGaloisRepresentations:R01.3/prime-to-characteristic-simple-lifting`, `ArithmeticGaloisRepresentations:R01.3/brumer-kramer-rational-lift`.

### tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-7-projective-representations-factor-sets-and-the-schur-multiplier

For cyclic C and an algebraically closed characteristic-zero coefficient field E, H²(C,E×)=0, with the Clifford scalar obstruction interface and Schur-index/integral-trace inputs required by Brumer–Kramer Propositions 4.4 and 4.6.

Consumed by: `ArithmeticGaloisRepresentations:R01.3/prime-to-characteristic-simple-lifting`, `ArithmeticGaloisRepresentations:R01.3/brumer-kramer-rational-lift`.

### tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces

Use the existing arithmetic-surface blowup, resolution and intersection theory for the minimal Weierstrass resolution and rational double-point differential-lattice comparison; no second surface theory is planned here.

Consumed by: `ArithmeticGaloisRepresentations:R01.3/surface-artin-conductor`, `ArithmeticGaloisRepresentations:R01.3/determinant-discriminant-order`, `ArithmeticGaloisRepresentations:R01.3/elliptic-minimal-model-comparison`.

### tauceti:TauCetiRoadmap/StableReduction#layer-5-regular-and-minimal-models

Import the minimal proper regular model and uniqueness, compatibility with strict henselisation and completion of an unramified extension, preserving v(Δ_min), geometric irreducible components and the minimal differential lattice. Genus-one-with-section cohomological flatness and gcd-one component formula are the restricted comparison inputs needed here.

Consumed by: `ArithmeticGaloisRepresentations:R01.3/surface-artin-conductor`, `ArithmeticGaloisRepresentations:R01.3/determinant-discriminant-order`, `ArithmeticGaloisRepresentations:R01.3/elliptic-minimal-model-comparison`, `ArithmeticGaloisRepresentations:R01.3/uniform-ogg-comparison`, `ArithmeticGaloisRepresentations:R01.3/saito-verified-statement`.

### tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv

Import the canonical minimal reduction predicates, Tate curve, Néron–Ogg–Shafarevich and quadratic potentially-multiplicative twist, minimal discriminant and Tate-algorithm fibre tables. Export the identity-component/Tate-invariant calculation giving tame codimensions 0,1,2. Arithmetic Ogg comparison is supplied by uniform-ogg-comparison here; the algorithmic table is not a second planned target.

Consumed by: `ArithmeticGaloisRepresentations:R01.3/potential-good-common-inertia`, `ArithmeticGaloisRepresentations:R01.3/elliptic-local-independence`, `ArithmeticGaloisRepresentations:R01.3/elliptic-minimal-model-comparison`, `ArithmeticGaloisRepresentations:R01.3/uniform-ogg-comparison`.

### tauceti:TauCetiRoadmap/EllipticCurves#layer-2-torsion-the-weil-pairing-and-the-tate-module-aec-iii68

Import the actual Tate module, good-model specialisation, endomorphism characteristic polynomial and Néron–Ogg–Shafarevich interface for the elliptic restriction of Serre–Tate Theorem 2. This elliptic restriction uses the existing elliptic Tate module; the general abelian Tate-module construction remains in R01.6.

Consumed by: `ArithmeticGaloisRepresentations:R01.3/potential-good-common-inertia`, `ArithmeticGaloisRepresentations:R01.3/elliptic-local-independence`.

### tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-5-the-global-local-dictionary-at-finite-places

Use the actual number-field completion, decomposition-group inclusion, ring-of-integers height-one prime and ideal exponent dictionary.

Consumed by: `ArithmeticGaloisRepresentations:R01.3/global-away-conductor`.

### tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors

Export the canonical arithmetic local Artin map, the attained character-conductor minimum, and closure(Art_K(U_K^n)) equal to the image of G_K^n in G_K^ab for n≥0, including U⁰=O×. The present reader states the minima and normalisations but does not state the last filtration compatibility. This is a ClassFieldTheory, Part II refinement, not a new reciprocity map.

Consumed by: `ArithmeticGaloisRepresentations:R01.3/character-conductor-reciprocity`.

The restricted elliptic smooth-locus and differential-lattice comparison belongs here because the Néron-model roadmap is in a higher upstream tier. Its R11.2 layer imports `elliptic-minimal-model-comparison`. R01.6’s conductor comparison imports `uniform-ogg-comparison`; this elliptic restriction uses EllipticCurves layer 2 for the Tate module and Weil pairing. The general abelian construction remains in R01.6. This gives a direction for each interface without using the conductor comparison to construct its own inputs. The general cohomology/duality roadmap likewise imports the restricted curve interface when that interface is supplied; it is not an upward prerequisite here.

## Mathematical inputs still requiring closure

### Perfect infinite residue-field ramification supplier

Serre 1961 verifies the mathematical scope, but the current LocalFieldsRamification roadmap and pinned carriers target nonarchimedean local fields. The Part II extension must export the same finite upper quotient theorem, different calculus and absolute inertia images for arbitrary perfect residue fields. Every tier-P assertion is conditional on this precise supplier input.

### Curve cohomology and determinant carriers at this tier

Own the restricted H¹_et representation, proper specialisation/Euler characteristic, perfect direct-image determinant and dualising-lattice interfaces required for minimal regular curves of genus g≥1 over a DVR, together with the genus-one specializations. The smooth-curve determinant input is the canonical, base-change-compatible isomorphism det Rf₊(ω²)≃(det Rf₊ω)^⊗13, including genus one; Liu §3 p. 2 identifies the general Mumford/Deligne input. The precise conductor and lattice statements are given by surface-artin-conductor, determinant-discriminant-order and elliptic-minimal-model-comparison. Current libraries do not provide these carriers, and the higher-tier etale/duality roadmap cannot be a prerequisite. They must move down into this conductor interface, with general theory importing them; no Prop placeholder occurs in the Lean file. The semistable API also requires unipotent prime-to-p H¹ monodromy (hence zero Swan) and the normalization/cohomology formula χ_special−χ_generic=#geometric nodes; ordinary coherent duality alone supplies neither.

### Saito finite-extension defect identity

The theorem and uniform genus-one deduction were read in Liu’s freely available original notes (§3 p. 2 and §4 pp. 4–5), and the determinant definition is now explicit. Saito 1988 Theorem 1’s proof was not obtained. To close the proof, provide the matching finite-extension defects of ordΔ and −Art, then semistable reduction; the notes’ explanation does not state these defects. This is a precise remaining proof input, especially for mixed characteristic (0,2).

### Reciprocity unit/upper-filtration compatibility

ClassFieldTheory’s current Layer 7 gives character-conductor minima but not the density identity for Art(U^n) and upper ramification. The exact Part II request above is the missing input of the character comparison.

### Rational p-group representation interface

The arithmetic constituent estimates and rational-lift theorem are now explicit nodes with source proofs. The generic Schur-index/character-field dictionary and p-group classification/refined rational Clifford induction used by Brumer–Kramer Proposition 4.4 are not explicit in the upstream interface. The representation-theory refinement requests remain open; simple modular lifting alone does not supply these rational forms.

## Imported target index

The existing roadmap supplies these nodes. The formulas and hypotheses in the imported calculus above remain in force, including the tier-P and coefficient restrictions. Their principal statements are not re-planned in this continuation.

- `ArithmeticGaloisRepresentations:R01.3/finite-wild-image`: Finiteness of the wild inertia image for coefficients of characteristic different from p.
- `ArithmeticGaloisRepresentations:R01.3/wild-action-factors-through-a-finite-galois-extension`: Wild action factors through a finite Galois extension.
- `ArithmeticGaloisRepresentations:R01.3/finite-wild-factorisation-equivariant`: Equivariance of finite wild factorisation.
- `ArithmeticGaloisRepresentations:R01.3/finite-wild-factorisation-enlargement`: Enlargement of a finite wild factorisation.
- `ArithmeticGaloisRepresentations:R01.3/finite-inertia-factorisation`: Finite inertia action factors through a finite extension.
- `ArithmeticGaloisRepresentations:R01.3/conductor-of-a-character`: Conductor of a ramified character.
- `ArithmeticGaloisRepresentations:R01.3/artin-conductor-integral-finite-group`: Integrality for a characteristic-zero finite-group representation.
- `ArithmeticGaloisRepresentations:R01.3/hasse-arf-integrality`: Integrality of Swan and Artin conductors.
- `ArithmeticGaloisRepresentations:R01.3/conductor-independence-of-choices`: Independence of conductor choices.
- `ArithmeticGaloisRepresentations:R01.3/conductor-vanishing-criteria`: Vanishing criteria for conductors.
- `ArithmeticGaloisRepresentations:R01.3/wild-character-lift`: Lifting a simple wild-inertia module.
- `ArithmeticGaloisRepresentations:R01.3/swan-conductor-of-an-orbit`: Swan conductor of a constituent orbit.
- `ArithmeticGaloisRepresentations:R01.3/swan-conductor-orbit-formula`: Orbit formula for Swan conductors.
- `ArithmeticGaloisRepresentations:R01.3/swan-additive`: Swan additivity in exact sequences.
- `ArithmeticGaloisRepresentations:R01.3/additivity-twist-and-unramified-invariance`: Artin conductor inequality for exact sequences.
- `ArithmeticGaloisRepresentations:R01.3/conductor-dual`: Conductors of dual representations.
- `ArithmeticGaloisRepresentations:R01.3/conductor-twist-unramified-tame`: Unramified and tame character twists.
- `ArithmeticGaloisRepresentations:R01.3/conductor-twist-dominant-character`: Twisting by a character of larger break.
- `ArithmeticGaloisRepresentations:R01.3/conductor-unramified-base-change`: Unramified base change of conductors.
- `ArithmeticGaloisRepresentations:R01.3/conductor-tame-base-change`: Tame base change of Swan conductors.
- `ArithmeticGaloisRepresentations:R01.3/conductor-extend-scalars`: Extension of conductor coefficients.
- `ArithmeticGaloisRepresentations:R01.3/induction-formula-for-conductors`: Global induction formula for conductors.
- `ArithmeticGaloisRepresentations:R01.3/quadratic-induction-conductor`: Conductor of an induced quadratic-field character.
- `ArithmeticGaloisRepresentations:R01.3/invariants-of-an-induced-representation`: Invariants of an induced representation.
- `ArithmeticGaloisRepresentations:R01.3/induced-inertia-invariants`: Inertia invariants of local induction.
- `ArithmeticGaloisRepresentations:R01.3/induced-finite-wild-image`: Induction preserves finite wild image.
- `ArithmeticGaloisRepresentations:R01.3/local-induction-formula`: The local induction formula for conductors, in rational form.
- `ArithmeticGaloisRepresentations:R01.3/swan-conductor-of-reduction`: Swan conductor is preserved by reduction.
- `ArithmeticGaloisRepresentations:R01.3/reduction-does-not-increase-the-conductor`: Artin conductor under reduction.
- `ArithmeticGaloisRepresentations:R01.3/conductor-of-residual-semisimplification`: Conductor of residual semisimplification.
- `ArithmeticGaloisRepresentations:R01.3/global-conductor-of-reduction`: Global conductor divisibility under reduction.
- `ArithmeticGaloisRepresentations:R01.3/tame-conductor-computations`: Conductor of a Steinberg representation.
- `ArithmeticGaloisRepresentations:R01.3/tame-two-dimensional-conductor`: Rank-two tame conductor with no invariants.
- `ArithmeticGaloisRepresentations:R01.3/dyadic-quadratic-conductors`: Dyadic quadratic conductors.
- `ArithmeticGaloisRepresentations:R01.3/triadic-cubic-conductor`: Ramified cubic characters over Q3.
- `ArithmeticGaloisRepresentations:R01.3/artin-schreier-break`: Ramification break of an Artin–Schreier extension.
- `ArithmeticGaloisRepresentations:R01.3/artin-schreier-swan-conductor`: Artin–Schreier conductors.
- `ArithmeticGaloisRepresentations:R01.3/artin-schreier-twist`: Twists by an Artin–Schreier character.
- `ArithmeticGaloisRepresentations:R01.3/deligne-artin-schreier-at-infinity`: Artin–Schreier ramification at infinity.
- `ArithmeticGaloisRepresentations:R01.3/elliptic-conductor-potentially-multiplicative`: Additive potentially multiplicative conductor.
- `ArithmeticGaloisRepresentations:R01.3/elliptic-conductor-isogeny-invariance`: Isogeny invariance of elliptic conductors.
- `ArithmeticGaloisRepresentations:R01.3/elliptic-conductor-over-q`: Elliptic conductor over Q.
- `ArithmeticGaloisRepresentations:R01.3/serre-bound-for-the-wild-invariant`: Serre's bound for the wild invariant of a representation of a p-adic Galois group.
- `ArithmeticGaloisRepresentations:R01.3/residual-conductor-good`: Residual conductor at good reduction.
- `ArithmeticGaloisRepresentations:R01.3/residual-conductor-multiplicative`: Residual conductor at multiplicative reduction.
- `ArithmeticGaloisRepresentations:R01.3/residual-conductor-potentially-multiplicative`: Residual conductor in the ramified quadratic twist case.
- `ArithmeticGaloisRepresentations:R01.3/residual-conductor-potentially-good`: Residual conductor with prime-to-ell inertia.
- `ArithmeticGaloisRepresentations:R01.3/residual-elliptic-conductor-away-from-ell`: Global residual elliptic conductor.

- `ArithmeticGaloisRepresentations:R01.1/semisimplification`: Semisimplification of the underlying finite-dimensional representation.

## Baseline and source references

The signature check uses Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` and Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. Current upstream roadmaps and the current Tau Ceti tree were read as imports, not treated as declarations at those older pins. The library audit reports the conductor targets absent; source inspection confirms this. `Representation.invariants` and `Representation.averageMap` are used directly. The current Tau Ceti tree implements finite upper quotient compatibility as `TauCeti.LocalFieldsRamification.map_restrictNormalHom_upperRamificationGroup` and wild inertia as `TauCeti.wildInertiaSubgroup`; these remain imports through LocalFieldsRamification at the older pin. No private invariant-subspace definition or duplicate finite ramification filtration is planned.

- Douglas Ulmer, [Conductors of ℓ-adic representations](https://arxiv.org/pdf/1307.4525v4), arXiv:1307.4525v4, 7 July 2015; Proc. Amer. Math. Soc. 144 (2016). Read: §§1–10, pp. 1–9, entire paper.
- Armand Brumer and Kenneth Kramer, [The conductor of an abelian variety](https://www.numdam.org/article/CM_1994__92_2_227_0.pdf), Compositio Math. 92 (1994), 227–248. Read: §1, weighted digit definition, p. 227; §2, Lemma 2.7, p. 230; §§3–5, pp. 231–242; Theorem 5.5, p. 242 read on image; Theorem 6.2, p. 243 read on image.
- Jean-Pierre Serre, [Sur les corps locaux à corps résiduel algébriquement clos](https://www.numdam.org/article/BSMF_1961__89__105_0.pdf), Bull. Soc. Math. France 89 (1961), 105–154. Read: §3.1, pp. 126–128; §§3.5–3.7: Corollary 1 to Proposition 8, p. 136; Propositions 9–10 and Theorem 2, pp. 137–139.
- Jean-Pierre Serre, [Facteurs locaux des fonctions zêta des variétés algébriques (définitions et conjectures)](https://www.numdam.org/article/SDPP_1969-1970__11_2_A4_0.pdf), Séminaire Delange–Pisot–Poitou 11 (1969/70), exposé 19. Read: §2.1, PDF pp. 6–8; §§2.3–2.4, PDF pp. 9–10.
- Jean-Pierre Serre, [Sur les représentations modulaires de degré 2 de Gal(Q̄/Q)](https://www.college-de-france.fr/media/jean-pierre-serre/UPL5835292064138487263_Serre_Repr.modulaires_Galois.pdf), Duke Math. J. 54 (1987), 179–230. Read: §1.2, pp. 180–181; §4.9, pp. 214–216.
- Qing Liu, [Formule d’Ogg d’après Saito](https://www.math.u-bordeaux.fr/~qliu/Notes/Ogg-Saito.pdf), Author-hosted five-page notes. Read: §§1–4, pp. 1–5, entire notes.
- Qing Liu, [Conducteur et discriminant minimal de courbes de genre 2](https://www.numdam.org/article/CM_1994__94_1_51_0.pdf), Compositio Math. 94 (1994), 51–79. Read: Introduction, pp. 51–52; §2.1, pp. 58–59.
- Henri Darmon, Fred Diamond and Richard Taylor, [Fermat’s Last Theorem](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), Author-hosted expository paper, 1995. Read: §1.1, Tate curves; §2.2, Propositions 2.11–2.13 and Remark 2.14, pp. 57–58.
- Jean-Pierre Serre and John Tate, [Good reduction of abelian varieties](https://wstein.org/papers/bib/Serre-Tate-Good_Reduction_of_Abelian_Varieties.pdf), Ann. of Math. 88 (1968), 492–517. Read: §2, Theorem 2 and its proof, pp. 496–498, read on page images.

The packet records hashes and access dates of the public files. Saito’s original 1988 paper was not obtained; its exact theorem is supported here by Liu’s author-hosted restatement and the separate 1994 article, while the missing proof input is explicitly listed. Ogg’s original paper, Tate’s Corvallis Part II article, Serre’s Local Fields exercise on strict noncyclic bounds, Katz’s book and the Lockhart–Rosen–Silverman and Livné papers were not used as read sources. In particular no new erratum is asserted about an original source not inspected. The ordinary Serre bound is imported in its non-strict form.
