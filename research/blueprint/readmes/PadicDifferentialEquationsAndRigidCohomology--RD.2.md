# P-adic differential equations, rigid cohomology and p-adic weights — RD.2 continued: Tsuzuki's theorem, monodromy, ramification and André's group

This document continues layer RD.2 (Local monodromy with Frobenius) of the roadmap. The layer's slope filtration theorem, the definitions of constant, unipotent and quasi-unipotent ∇-modules, the p-adic local monodromy theorem in its quasi-unipotent, finite étale and logarithmic forms, the solution space (φ, N, Gal), the monodromy-representation equivalence, Berger's form and the acceptance examples are planned in the roadmap's main document (`research/blueprint/readmes/PadicDifferentialEquationsAndRigidCohomology.md`, §RD.2) and are cited here by their identifiers; nothing there is restated. This part plans the open items of that pass:

1. **Tsuzuki's unit-root theorem**, imported by the first pass, proved from Kedlaya's book (§1), including the existence of the extension over which the Frobenius matrix is within p^{−1/(p−1)} of the identity.
2. **Quasi-constant modules and Matsuda's decomposition** (§2), with local duality, which the RD.1 pass assigned to this layer.
3. **Matsuda's break theorem and Irr = Swan** (§3): the highest break of a quasi-unipotent module is the highest ramification break of its monodromy, break decompositions correspond, and the differential Swan conductor is the Galois Swan conductor.
4. **André's Tannakian form** (§4): MCF(R_K̄/K̄) is the category of quasi-unipotent modules, with Tannakian group I × G_a, wild part P, and tame factor given by the nilpotent residue.
5. **The theorem over every R^L** (§5), the analytic input of Berger's theorem without any p-adic Hodge theory here.
6. **The completion lemma** (§6): the completed algebraic closure of k((t)) is algebraically closed.
7. **The published version of Slope filtrations revisited** and its erratum: a label concordance (§11) and the erratum's corrections (§10).

**Conventions.** K is complete for a discrete valuation, of characteristic 0, with ring of integers O_K, uniformiser π and residue field k of characteristic p; σ is a Frobenius lift (a q-power lift σ\_K on K and an endomorphism of R^int reducing to x ↦ x^q on k((t))), q = p^a. E is the Amice ring, E† = R^bd the bounded Robba ring and R = R_K the Robba ring, all with d = d/dt; for a finite separable L/k((t)), E_L, E†\_L and R^L are the unramified (finite étale) extensions with residue field L, and Ẽ is the completed maximal unramified extension of E. G = Gal(k((t))^sep/k((t))), I its inertia group and P the wild inertia. Generic radii R(E, ρ) and intrinsic radii IR = R/ρ are those of RD.1/generic-radius; a module has highest break β when R(E, ρ) = ρ^{β+1} for ρ close to 1 (RD.1/highest-break). Ramification groups are numbered as in Serre (G^0 = I, G^{0+} = P). A Frobenius structure is a horizontal isomorphism σ^\*M ≅ M. K̄ is an algebraic closure of K and R_K̄ = R_K ⊗\_K K̄.

**Boundaries.** The relative local monodromy theorem over dagger algebras (Kedlaya, Finiteness, Theorem 5.1.3) is RD.5's. The Christol-Mebkhout index formula and the global Grothendieck-Ogg-Shafarevich formula are RD.6's; RD.6's global monodromy groups consume the local group of §4. The identification of Berger's ring B†\_K with an unramified extension of B†\_F through the field of norms, and the bridge from Galois representations to differential modules, are PadicHodgeTheory's (R06.3 and its P7). Upper-numbering breaks and Swan conductors of Galois representations are ArithmeticGaloisRepresentations R01.3's; Fontaine's equivalence for étale φ-modules over a Cohen ring is FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.4's. Galois descent for vector spaces and Tannakian reconstruction for comodules are in Tau Ceti.

## 1. Tsuzuki's unit-root theorem, proved

The first pass imported Tsuzuki's theorem (Amer. J. Math. 120 (1998), Theorem 5.1.1), which no public source then in the set proved. Kedlaya's book p-adic Differential Equations, Chapter 19 (the author's posted PDF), proves it with tools the roadmap already plans: the unramified extensions of the Amice ring and their Galois action, the unit-root modules attached to Galois representations, a Lang-type trivialisation that makes the Frobenius matrix close to the identity after a finite separable extension, and a key lemma showing that a Frobenius matrix within p^{−1/(p−1)} of the identity forces a basis of horizontal sections. The last two are exactly the inputs Kedlaya's Proposition 6.11 (arXiv:math/0110124) takes from Tsuzuki and from an unstated existence argument.

<a id="RD-2-unramified-extensions-of-amice-rings"></a>

### Unramified extensions E_L, E†\_L and the completed maximal unramified extension Ẽ of the Amice ring

`PadicDifferentialEquationsAndRigidCohomology:RD.2/unramified-extensions-of-amice-rings` · construction.

Fix a separable closure k((t))^sep of k((t)) and put G = Gal(k((t))^sep/k((t))). (a) For each finite separable extension L ⊆ k((t))^sep of k((t)) there is a finite étale O_E-algebra O_{E_L}, unique up to unique isomorphism, with O_{E_L}/π ≅ L; E_L = O_{E_L}[1/π] is a complete discretely valued field with residue field L. Its integral elements overconvergent over R^int form the finite étale R^int-algebra R^int_L of RD.2/finite-etale-extension-of-bounded-robba-ring, and E†\_L := R^int_L[1/π] = R^bd_L is the unique finite unramified extension of the henselian field E† with residue field L; moreover E_L = E ⊗\_{E†} E†\_L and E†\_L is the integral closure of E† in E_L. (b) E^unr = ∪\_L E_L and E^{†,unr} = ∪\_L E†\_L (union over finite separable L ⊆ k((t))^sep), and Ẽ is the π-adic completion of E^unr: a complete discretely valued field with residue field k((t))^sep. The Frobenius lift σ and the derivation d extend uniquely to O_{E_L}, R^int_L, E_L, E†\_L, E^unr, E^{†,unr} and (by continuity) Ẽ, and G acts on all of them by continuous ring automorphisms commuting with σ and d, with fixed rings (E^unr)^{G_L} = E_L, (E^{†,unr})^{G_L} = E†\_L, Ẽ^G = E and (E^{†,unr})^G = E†, where G_L = Gal(k((t))^sep/L). (c) Constants: the kernel of d on E†\_L is the integral closure K_L of K in E†\_L (a finite unramified extension of K whose residue field is the algebraic closure of k in L), and the kernel of d on Ẽ is the completion K̃ of the maximal unramified extension of K in Ẽ. (d) Frobenius invariants: if σ\_K is absolute (it acts on k by x ↦ x^q) and its fixed field K_0 = K^{σ\_K = 1} has residue field F_q and the same value group as K, then Ẽ^{σ=1} = K_0.

Hypotheses and conventions:

- K complete discretely valued of characteristic 0; L ranges over finite separable extensions of k((t)) inside one fixed separable closure. No perfectness of k is needed for (a)-(c); a purely inseparable residue extension k((t^{1/p}))/k((t)) has no étale lift.
- In (d) the hypotheses are those of Kedlaya, p-adic Differential Equations, Proposition 19.1.5; without them Ẽ^{σ=1} can be smaller than K^{σ\_K=1}·(unramified constants) and the coefficient field of the Fontaine-Katz equivalence changes.

Uses:

- Kedlaya, p-adic Differential Equations, Definition 19.1.2 and Definition 19.2.2: the rings in which a Galois representation is tensored before taking invariants
- RD.2/lang-trivialisation-of-unit-root-modules: Ẽ is the ring over which a unit-root Frobenius module acquires a basis of fixed vectors
- RD.2/tsuzuki-equivalence-finite-local-monodromy: E†\_L is the ring over which a unit-root (σ,∇)-module becomes trivial
- RD.2/galois-representation-to-differential-module: the Galois action on E^{†,unr} and Ẽ produces D†(V) and D(V)

API:

- `AmiceRing.unramifiedExt` (constructor): E_L for a finite separable L/k((t)), with its integral ring O_{E_L} finite étale over O_E and residue field L.
- `AmiceRing.boundedUnramifiedExt` (constructor): E†\_L = R^bd_L, the finite unramified extension of E† with residue field L; E_L = E ⊗\_{E†} E†\_L.
- `AmiceRing.completedMaxUnramified` (constructor): Ẽ, the π-adic completion of E^unr = ∪\_L E_L, with residue field k((t))^sep.
- `AmiceRing.frobeniusExt` (structure): The unique extension of σ to E_L, E†\_L and Ẽ; it commutes with the Galois action.
- `AmiceRing.derivationExt` (structure): The unique extension of d = d/dt to E_L, E†\_L and Ẽ; it commutes with the Galois action.
- `AmiceRing.galoisAction` (structure): The continuous action of G = Gal(k((t))^sep/k((t))) on E^unr, E^{†,unr} and Ẽ by ring automorphisms.
- `AmiceRing.fixedPoints` (characterisation): Ẽ^G = E, (E^{†,unr})^G = E†, and E_L, E†\_L are the fixed fields of G_L in E^unr, E^{†,unr}.
- `AmiceRing.ker_derivation` (characterisation): ker(d on E†\_L) = K_L (integral closure of K) and ker(d on Ẽ) = K̃.
- `AmiceRing.frobenius_invariants` (characterisation): Under the hypotheses of (d), Ẽ^{σ=1} = K_0.
- `AmiceRing.boundedUnramifiedExt_tensor_robba` (compatibility): E†\_L ⊗\_{E†} R ≅ R^L compatibly with σ, d and the Galois action.

Unit tests:

- `AmiceUnramifiedExt.self` (degenerate): For L = k((t)), E_L = E and E†\_L = E†, and the Galois group of L/k((t)) is trivial.
- `AmiceUnramifiedExt.constant_field` (computation): For L = k'((t)) with k'/k finite separable of degree f, ker(d on E†\_L) = K' with [K':K] = f and K'/K unramified.
- `AmiceUnramifiedExt.artinSchreier` (computation): With π\_0^{p−1} = −p, the ring E†[u]/((1+π\_0 u)^p − 1 − pπ\_0 t^{−1}) is a field, unramified over E† of degree p, with residue field the Artin-Schreier extension ū^p − ū = −t^{−1}.
- `AmiceUnramifiedExt.compat_robba` (compatibility): E†\_L ⊗\_{E†} R = R^L, the Robba-ring extension of RD.2/finite-etale-extension-of-bounded-robba-ring, compatibly with σ and d.
- `AmiceUnramifiedExt.not_inseparable` (non-example): The purely inseparable extension k((t^{1/p}))/k((t)) is not of the form O_{E_L}/π: the reduction of a finite étale O_E-algebra is a finite étale, hence separable, k((t))-algebra.
- `AmiceUnramifiedExt.frob_invariants` (compatibility): For K = Q_q = W(F_q)[1/p] with σ\_K the q-power Witt-vector Frobenius (the identity of Q_q) and σ(t) = t^q, Ẽ^{σ=1} = Q_q = K_0; for K = Q_q with σ\_K the p-power Witt-vector Frobenius (q = p), Ẽ^{σ=1} = Q_p = K_0.

Proof route:

1. (a) O_E is a complete discrete valuation ring with residue field k((t)) and R^int is henselian with the same residue field (RD.0/bounded-robba-ring (a)), so finite separable extensions of the residue field lift uniquely to finite étale algebras of either (Kedlaya, p-adic Differential Equations, Lemma 15.1.3 and Definition 19.2.1); O_{E_L} is the π-adic completion of R^int_L, which gives E_L = E ⊗\_{E†} E†\_L, and the integral closure statement follows because R^int_L is normal and finite over R^int.
2. (b) Unique extension of σ and d: an étale algebra over a ring with an endomorphism or derivation carries a unique compatible extension (the residue map of σ is the q-power map, which extends to L because L/k((t)) is separable). G acts on E^unr by transport of structure through the equivalence between finite separable extensions of k((t)) and finite étale algebras, and continuously on the completion; fixed rings by Galois theory for finite étale algebras (Kedlaya, Definition 19.1.1, p. 314).
3. (c) A d-constant x of E†\_L is integral over K: reduce to a field extension and use that d has kernel K on E† (power series with i·c_i = 0 for i ≠ 0, RD.0/derivation-on-robba-ring) and that d commutes with the trace of E†\_L/E†; the kernel on Ẽ is Kedlaya, Exercise 19.3, p. 325.
4. (d) Kedlaya, Exercise 19.1, p. 325: reduce to residue fields, where the fixed field of the q-power map on k((t))^sep is F_q; the value-group hypothesis gives a uniformiser of K fixed by σ, so σ-invariant elements can be expanded π-adically with σ-invariant digits.

Acceptance:

- For L = k((t)): E_L = E, E†\_L = E† and the Galois action is trivial.
- For an unramified L = k'((t)) with k'/k finite separable: E†\_L = E† ⊗\_K K' with K'/K unramified of residue field k', and ker(d) = K'.
- Artin-Schreier: if K contains π\_0 with π\_0^{p−1} = −p, then E†[u]/((1 + π\_0 u)^p − 1 − pπ\_0 t^{−1}) is the unramified extension E†\_L for L = k((t))[ū]/(ū^p − ū + t^{−1}) (expand (1 + π\_0 u)^p and divide by pπ\_0; compare Kedlaya overview, proof of Lemma 5.4.7).

Prerequisites: `PadicDifferentialEquationsAndRigidCohomology:RD.2/finite-etale-extension-of-bounded-robba-ring`, `PadicDifferentialEquationsAndRigidCohomology:RD.0/bounded-robba-ring`, `PadicDifferentialEquationsAndRigidCohomology:RD.0/derivation-on-robba-ring`, `PadicDifferentialEquationsAndRigidCohomology:RD.0/frobenius-lift-on-robba-ring`, `mathlib:Field.absoluteGaloisGroup`, `mathlib:Algebra.Etale`, `mathlib:HenselianLocalRing`, `mathlib:IsGalois`.

Sources:

- p-adic Differential Equations (kedlaya-pde-book), Definition 19.1.1, p. 314; Definition 19.2.1, p. 316; Lemma 15.1.3, p. 263: Defines E_L as the unramified extension of E with residue field L, Ẽ as the completion of the maximal unramified extension with its Galois action and fixed field E, and E†\_L via the henselian property of E† (Lemma 15.1.3), with E_L = E ⊗ E†\_L.
- p-adic Differential Equations (kedlaya-pde-book), Chapter 19, Exercises (1) and (3), p. 325: Asks to prove Ẽ^{φ=1} = K_0 under the stated hypotheses on K_0, and that the kernel of d on Ẽ is K̃ and on E†\_L the integral closure of K.
- Local monodromy of p-adic differential equations: an overview (kedlaya-local-monodromy-overview), Proposition 3.5.5 and Definition 3.5.6, pp. 15-16: Finite étale covers of the thin annulus correspond to finite separable extensions of k((t)) by henselianity of R^int.

<a id="RD-2-c-constant-unit-root-module"></a>

### c-constant unit-root (σ,∇)-modules

`PadicDifferentialEquationsAndRigidCohomology:RD.2/c-constant-unit-root-module` · definition.

For c ∈ (0, 1), a finite free differential module M over E† (or over E, or over E†\_L for a finite separable L/k((t))) equipped with a unit-root Frobenius structure F relative to σ is c-constant if M has a basis on which F acts by a matrix A with entries in the integral ring and |A − I|\_1 ≤ c, where |·|\_1 is the 1-Gauss norm (the π-adic norm on E). Such a basis is a c-constant basis. Properties: (i) the property does not depend on the Frobenius lift: if σ\_1, σ\_2 are Frobenius lifts that agree on K, the Frobenius structure transported along the Taylor isomorphism of RD.1/change-of-frobenius-for-frobenius-structures is c-constant for σ\_2 iff the original one is c-constant for σ\_1; (ii) c-constancy is preserved by base change E† → E†\_L → E_L, by tensor products and by duals, and c-constant implies c'-constant for c ≤ c' < 1; (iii) if σ is absolute and K_0 = K^{σ\_K=1} satisfies the hypotheses of RD.2/unramified-extensions-of-amice-rings (d), then D(V) (RD.2/galois-representation-to-differential-module) is c-constant iff V_0 has a G-stable O_{K_0}-lattice whose supremum norm satisfies |τ(g)x − x| ≤ c|x| for all g ∈ G.

Hypotheses and conventions:

- The Frobenius structure is unit-root: there is a basis on which F acts by A ∈ GL_n(O_{E†}) (RD.1/frobenius-stable-lattices (a)).
- c is measured in the normalised absolute value of K extended to E by the 1-Gauss norm.

Uses:

- Kedlaya, p-adic Differential Equations, Lemma 19.3.4: the hypothesis of the key lemma: c-constant with c < p^{−1/(p−1)} forces triviality
- RD.2/lang-trivialisation-of-unit-root-modules: the conclusion: every unit-root module becomes c-constant after a finite separable extension
- Kedlaya, A p-adic local monodromy theorem, Proposition 6.11: the condition v_p(A − I) > 1/(p − 1) on a Frobenius matrix is c-constancy with c < p^{−1/(p−1)}

API:

- `IsCConstant` (constructor): The predicate: M has a basis with Frobenius matrix A integral and |A − I|\_1 ≤ c.
- `IsCConstant.mono` (relation): c-constant ⇒ c'-constant for c ≤ c' < 1.
- `IsCConstant.baseChange` (functoriality): Preserved by E† → E†\_L and E† → E.
- `IsCConstant.tensor` (structure): Preserved by tensor products.
- `IsCConstant.dual` (structure): Preserved by duals.
- `IsCConstant.changeFrobenius` (compatibility): Invariant under the change-of-Frobenius equivalence of RD.1/change-of-frobenius-for-frobenius-structures.
- `IsCConstant.iff_galois` (characterisation): Under the hypotheses of RD.2/unramified-extensions-of-amice-rings (d): D(V) is c-constant iff V_0 has a G-stable lattice on which G acts within c of the identity.

Unit tests:

- `IsCConstant.trivial` (degenerate): The trivial (σ,∇)-module (E†, d, σ) is c-constant for every c ∈ (0,1).
- `IsCConstant.rankOne_const` (computation): The rank-one module E† e with F(e) = (1 + π^m) e and ∇e = 0 is |π|^m-constant.
- `IsCConstant.dwork_threshold` (non-example): Dwork's module M_f (f = t^{−1}, K = Q_p(π\_0), σ(t) = t^p) is p^{−1/(p−1)}-constant but not c-constant for any c < p^{−1/(p−1)}.
- `IsCConstant.tensor` (characterisation): If M and M' are c-constant then so are M ⊗ M' and M^∨.
- `IsCConstant.frobenius_change` (compatibility): For σ\_1(t) = t^q and σ\_2(t) = t^q(1 + πt^{−1}), M is c-constant for σ\_1 iff the transported structure is c-constant for σ\_2.

Proof route:

1. (i) Kedlaya, p-adic Differential Equations, Definition 19.3.2 and Exercise (5) of Chapter 19: in Lemma 17.3.4, the integral lattice M_0 spanned by a basis on which F acts integrally is stable under D^i/i!, and if D/i acts with norm at most c on a suitable basis so does D^i/i!; inserting this into the Taylor formula (17.3.1.1) for the transported Frobenius structure gives a matrix A' with |A' − I|\_1 ≤ c (|σ\_2(t) − σ\_1(t)|\_1 < 1).
2. (ii) Base change keeps the same basis; for tensor products A ⊗ B − I = (A − I) ⊗ B + I ⊗ (B − I) and for duals (A^T)^{-1} − I = −(A^T)^{-1}(A − I)^T, with |A^{-1}|\_1 = 1.
3. (iii) Kedlaya, Definition 19.3.2: through the Fontaine-Katz equivalence (RD.2/fontaine-katz-unit-root-equivalence), a c-constant basis of D(V) corresponds to a G-stable lattice of V_0 on which G acts by matrices congruent to I to within c.

Acceptance:

- The trivial module (E†, d) with F = σ is c-constant for every c: A = (1).
- Rank one: M = E† e with F(e) = a e, ∇e = 0 and a ∈ 1 + π^m O_K is |π|^m-constant (the compatibility N a + t da/dt = q a σ(N) holds with N = 0 because a is constant).
- Dwork's module (K = Q_p(π\_0), π\_0^{p−1} = −p, σ\_K = id, σ(t) = t^p): M_f = E† v with ∇v = π\_0 (df/dt) v ⊗ dt, f = t^{−1}, and F(v) = E(t^{−1}) v with E(z) = exp(π\_0(z − z^p)) = Σ λ\_n z^n the Dwork exponential; since λ\_n ∈ Z_p[π\_0] with λ\_1 = π\_0 and ord_p λ\_n ≥ n(p − 1)/p² > 0 for n ≥ 1 (RD.1/dwork-overconvergence-proof, RD.1/dwork-exponential-module), E(t^{−1}) ≡ 1 (mod π\_0) and |E(t^{−1}) − 1|\_1 = |π\_0| = p^{−1/(p−1)}, so M_f is p^{−1/(p−1)}-constant; it is not trivial over E† (exp(−π\_0 t^{−1}) does not converge near |t| = 1), hence by RD.2/small-constant-unit-root-module-is-trivial it is not c-constant for any c < p^{−1/(p−1)}: the threshold is sharp.

Prerequisites: `PadicDifferentialEquationsAndRigidCohomology:RD.1/frobenius-differential-module`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/isoclinic-frobenius-module`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/frobenius-stable-lattices`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/change-of-frobenius-for-frobenius-structures`, `PadicDifferentialEquationsAndRigidCohomology:RD.2/unramified-extensions-of-amice-rings`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/dwork-exponential-module`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/dwork-overconvergence-proof`.

Sources:

- p-adic Differential Equations (kedlaya-pde-book), Definition 19.3.2, p. 319: Defines c-constant modules and bases by |A − I|\_1 ≤ c, notes invariance under change of absolute Frobenius lift via Corollary 17.3.2 and Proposition 19.1.5, and the characterisation through Galois representations.
- p-adic Differential Equations (kedlaya-pde-book), Lemma 17.3.4 and Proposition 17.3.5, p. 297; Chapter 19, Exercise (5), p. 325: Integral lattices of unit-root modules are stable under D^i/i!; the exercise extends invariance of c-constancy to arbitrary Frobenius lifts via the Taylor formula (17.3.1.1).
- p-adic Differential Equations (kedlaya-pde-book), Example 17.1.4 and Definition 17.1.3, p. 292: Dwork's module M_f with its Frobenius structure exp(π f − π φ(f)) and the Dwork exponential series of radius p^{(p−1)/p²}.

<a id="RD-2-lang-trivialisation-of-unit-root-modules"></a>

### Unit-root Frobenius modules are trivialised over Ẽ, and become c-constant over a finite separable extension

`PadicDifferentialEquationsAndRigidCohomology:RD.2/lang-trivialisation-of-unit-root-modules` · lemma.

Setting of RD.0/frobenius-lift-on-robba-ring: K is complete for a discrete valuation, of characteristic 0, with ring of integers O_K, uniformiser π and residue field k of characteristic p; σ is a Frobenius lift on R^int (a ring endomorphism extending a q-power Frobenius lift σ\_K of K and reducing to the absolute q-power map x ↦ x^q of k((t))), q = p^a; E = O_E[1/π] is the Amice ring and E† = R^bd the bounded Robba ring, both with d = d/dt. Let M_0 be a finite free R^int-module (or O_E-module) of rank n with a σ-semilinear F whose linearisation σ^\*M_0 → M_0 is an isomorphism (an étale lattice of a unit-root σ-module). Then: (a) M_0 ⊗ O_Ẽ has a basis of F-fixed vectors, and (M_0 ⊗ O_Ẽ)^{F=1} is a free module of rank n over O_Ẽ^{σ=1}; (b) for each m ≥ 1 the set of F-fixed vectors of M_0 ⊗ O_Ẽ/π^m is finite, and each of them is fixed by an open subgroup of G; (c) consequently, for each m ≥ 1 there is a finite Galois extension L of k((t)) such that M_0 ⊗ R^int_L has a basis on which F acts by a matrix A ≡ I (mod π^m). In particular every unit-root (σ,∇)-module M over E† becomes c-constant (RD.2/c-constant-unit-root-module) over E†\_L for any prescribed c ∈ (0,1) and a suitable finite separable L/k((t)) depending on c.

Hypotheses and conventions:

- Only the residual behaviour of σ is used: its reduction is the q-power map of k((t)), which extends to the q-power map of the separably closed field k((t))^sep. No perfectness of k and no condition on σ\_K are needed.
- A unit-root σ-module over E† has an étale R^int-lattice (RD.1/frobenius-stable-lattices (a)).

Proof route:

1. Modulo π: M_0/π is an étale q-power Frobenius module over k((t)); over k((t))^sep its F-fixed vectors span and form an F_q-space of dimension n (Lang's theorem; the p-power, Z_p-coefficient case is FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/etale-phi-modules-cohen-ring (i), and the q-power case is the same argument applied to F, whose fixed-point equations X^{(q)} = A^{−1}X are étale of degree q^n).
2. Lifting: if v is F-fixed modulo π^j, write F v − v = π^j w; a correction v + π^j y is F-fixed modulo π^{j+1} iff ȳ − ū^j·F̄(ȳ) = −w̄ modulo π, where σ(π) = uπ; in coordinates this is a system x − c·x^{(q)} = b over k((t))^sep, separable (derivative 1) and solvable with finitely many solutions. Completeness of O_Ẽ gives F-fixed lifts and Nakayama's lemma gives a basis (a); this is Kedlaya, p-adic Differential Equations, proof of Proposition 19.1.5 (via the first part of Theorem 14.6.3, the residue field of Ẽ being separably closed).
3. (b) Each level is cut out by finitely many étale polynomial equations, so the solutions are finite in number and algebraic and separable over k((t)); hence each is fixed by an open subgroup of G.
4. (c) Let L be the Galois closure of the field generated by the coordinates of an F-fixed basis modulo π^m. Since R^int_L/π^m = O_{E_L}/π^m (RD.2/unramified-extensions-of-amice-rings (a)), the basis lifts to a basis of M_0 ⊗ R^int_L, on which F acts by A ≡ I (mod π^m). Choose m with |π|^m ≤ c (Kedlaya, proof of Theorem 19.3.1, p. 321, where L is chosen to make M c-constant).

Acceptance:

- Rank one: for M_0 = R^int e with F(e) = a e, a ∈ (R^int)^×, a fixed vector b e needs b^{−1}σ(b) = a^{−1}; modulo π this is b̄^{q−1} = ā^{−1}, solvable over the finite separable extension k((t))(b̄) (the polynomial x^{q−1} − ā^{−1} is separable).
- Dwork's module M_f (f = t^{−1}, K = Q_p(π\_0), π\_0^{p−1} = −p) is p^{−1/(p−1)}-constant over E† itself and becomes trivial, hence c-constant for every c, over E†\_L for the Artin-Schreier extension L of z^p − z = t^{−1} (RD.2/dwork-exponential-artin-schreier-example).

Prerequisites: `PadicDifferentialEquationsAndRigidCohomology:RD.2/unramified-extensions-of-amice-rings`, `PadicDifferentialEquationsAndRigidCohomology:RD.2/c-constant-unit-root-module`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/frobenius-stable-lattices`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/isoclinic-frobenius-module`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/etale-phi-modules-cohen-ring`.

Sources:

- p-adic Differential Equations (kedlaya-pde-book), Proposition 19.1.5 and its proof, pp. 315-316; Theorem 14.6.3 (first part of the proof), p. 256: Over Ẽ a unit-root difference module is trivial because the residue field of Ẽ is separably closed, hence weakly difference-closed for absolute Frobenius lifts; this gives the inverse functor (D ⊗ Ẽ)^{φ=1}.
- p-adic Differential Equations (kedlaya-pde-book), Proof of Theorem 19.3.1, p. 321: Uses Proposition 19.1.5 to choose a finite separable L over which M becomes c-constant for some c < p^{−1/(p−1)}.
- A p-adic local monodromy theorem (kedlaya-monodromy-2003), Proposition 6.11, statement, p. 79 (arXiv v4): Tsuzuki's theorem is stated for any finite extension on which the Frobenius matrix satisfies v_p(A − I) > 1/(p − 1); this lemma supplies the existence of such an extension, which the paper assumes.

<a id="RD-2-galois-representation-to-differential-module"></a>

### Unit-root differential modules D(V), D†(V) attached to Galois representations; finite local monodromy

`PadicDifferentialEquationsAndRigidCohomology:RD.2/galois-representation-to-differential-module` · construction.

Let V be a finite-dimensional K-vector space and τ : G = Gal(k((t))^sep/k((t))) → GL(V) a continuous homomorphism. (a) (p-adic topology) D(V) := (V ⊗\_K Ẽ)^G, with G acting diagonally, is an E-vector space of dimension dim_K V and D(V) ⊗\_E Ẽ → V ⊗\_K Ẽ is an isomorphism; d acting on the second factor makes D(V) a differential module over E, and any σ\_K-semilinear bijection of V commuting with τ (for instance the one fixing a chosen basis) makes it a unit-root (σ,∇)-module for any Frobenius lift σ acting on K by σ\_K. (b) (finite image) If τ factors through Gal(L/k((t))) for a finite Galois L, then D†(V) := (V ⊗\_K E†\_L)^G is an E†-vector space of dimension dim V, canonically independent of L, with D†(V) ⊗ E†\_L ≅ V ⊗ E†\_L and D†(V) ⊗\_{E†} E = D(V); it is a unit-root (σ,∇)-module over E†. (c) τ has finite local monodromy if the image of the inertia subgroup I = Gal(k((t))^sep/k^sep((t))) is finite; then D†(V) is defined by the same formula with E^{†,sep} (the bounded Robba ring over the completion K̂^unr of the maximal unramified extension of K, in the variable t, with its unramified extensions) in place of E†\_L, and is again a unit-root (σ,∇)-module over E† of rank dim V. (d) D†(V) is solvable at 1: its generic radius tends to 1 (RD.1/frobenius-structure-forces-solvability). (e) The horizontal sections of D†(V) ⊗\_{E†} E†\_L are V ⊗\_K K_L (K_L = ker d on E†\_L), so the differential structure recovers the restriction of V to inertia but not V itself.

Hypotheses and conventions:

- K complete discretely valued of characteristic 0; V finite-dimensional; τ continuous for the p-adic topology in (a), and with finite image (resp. finite image of inertia) in (b) (resp. (c)).
- The Frobenius structure on D(V) comes from a chosen σ\_K-semilinear structure on V; the differential structure needs no choice.

Uses:

- RD.2/tsuzuki-equivalence-finite-local-monodromy: D† is the functor of Tsuzuki's equivalence
- RD.2/irregularity-equals-swan-conductor: the generic radius of D†(V) is computed from the upper ramification breaks of V
- Kedlaya, Notes on isocrystals, Theorems 3.7 and 3.9: local model of the Katz-Crew and Tsuzuki correspondences for unit-root F-isocrystals

API:

- `unitRootModule` (constructor): D(V) = (V ⊗ Ẽ)^G, a unit-root (σ,∇)-module over E.
- `overconvergentUnitRootModule` (constructor): D†(V) = (V ⊗ E^{†,sep,unr})^G for V with finite local monodromy.
- `HasFiniteLocalMonodromy` (data): τ(I) is finite.
- `unitRootModule.finrank` (characterisation): dim D(V) = dim V and D†(V) has rank dim V.
- `unitRootModule.comparison` (equivalence): D(V) ⊗\_E Ẽ ≅ V ⊗\_K Ẽ, compatibly with G, d and the Frobenius structures.
- `overconvergentUnitRootModule.baseChange` (compatibility): D†(V) ⊗\_{E†} E ≅ D(V).
- `unitRootModule.map` (functoriality): D and D† are exact K-linear tensor functors.
- `overconvergentUnitRootModule.solvable` (other): D†(V) is solvable at 1.
- `overconvergentUnitRootModule.horizontalSections` (characterisation): H^0(D†(V) ⊗ E†\_L) = V ⊗\_K K_L for L trivialising τ on inertia.

Unit tests:

- `unitRootModule.trivial` (degenerate): For the trivial one-dimensional representation, D(V) = E and D†(V) = E† with F = σ and ∇ = d.
- `unitRootModule.finrank` (characterisation): dim_E D(V) = dim_K V and D(V) ⊗\_E Ẽ ≅ V ⊗\_K Ẽ.
- `unitRootModule.artinSchreier` (computation): For the Artin-Schreier character of z^p − z = t^{−1} with value ζ\_p on z ↦ z+1, D†(V) ≅ M_f with f = t^{−1}: ∇v = −π\_0 t^{−2} v ⊗ dt.
- `unitRootModule.horizontal_sections` (compatibility): For τ trivial on Gal(k((t))^sep/L), the horizontal sections of D†(V) ⊗ E†\_L form V ⊗\_K K_L, of dimension dim V over K_L.
- `unitRootModule.not_overconvergent` (non-example): For p odd let χ: G → Z_p^× be the composite of the Artin-Schreier-Witt Z_p-extension of k((t)) attached to the Witt vector (t^{−1}, 0, 0, …) with x ↦ (1 + p)^x; χ has infinite image of inertia, and D(χ) is not the base change to E of any unit-root (σ,∇)-module over E† (RD.2/tsuzuki-equivalence-finite-local-monodromy).

Proof route:

1. (a) Kedlaya, p-adic Differential Equations, Lemma 19.1.3: for finite image, Hilbert-Noether descent for the finite Galois extension E_L/E (Tau Ceti's semilinear Galois descent: invariant vectors span, TauCeti.GaloisDescent.span_invariants_eq_top, and stay independent, TauCeti.GaloisDescent.liftBaseChange_injective_of_invariant); in general choose a G-stable O_K-lattice T (compactness), apply the finite case to each T/m^i and pass to the inverse limit.
2. Differential and Frobenius structures: d and σ extend uniquely to Ẽ and commute with G (RD.2/unramified-extensions-of-amice-rings (b)); they preserve invariants; the compatibility ∇∘F = (F ⊗ dσ)∘∇ holds on V ⊗ Ẽ because d kills V and σ is a ring map (Definition 19.1.4).
3. (b) Same descent for E†\_L/E† (Lemma 19.2.3); independence of L because enlarging L does not change invariants.
4. (c) Definition 19.2.8: the action of G on V ⊗ E^{†,sep} factors through G/I_0 for an open subgroup I_0 of I acting trivially on V, so the finite-image argument applies over the field E^{†,sep}.
5. (d) Proposition 19.2.5: the Frobenius structure forces generic radius 1 (Theorem 17.2.1 = RD.1/frobenius-structure-forces-solvability).
6. (e) Remark 19.2.7, using ker(d on E†\_L) = K_L (RD.2/unramified-extensions-of-amice-rings (c)).

Acceptance:

- Trivial V = K: D(V) = E and D†(V) = E† with F = σ and ∇ = d.
- Artin-Schreier character (Kedlaya Example 19.2.6): with π\_0^{p−1} = −p and ζ\_p ≡ 1 − π\_0 (mod π\_0^2), the character of Gal(L/k((t))), L: z^p − z = f, sending z ↦ z + 1 to ζ\_p has D†(V) ≅ Dwork's module M_f (∇v = π\_0 (df/dt) v ⊗ dt).
- An unramified character (finite image of Frobenius only): D†(V) is trivial as a differential module but its Frobenius structure is the twist by the character's value on Frobenius.

Prerequisites: `PadicDifferentialEquationsAndRigidCohomology:RD.2/unramified-extensions-of-amice-rings`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/frobenius-differential-module`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/frobenius-structure-forces-solvability`, `tauceti:TauCeti.GaloisDescent.span_invariants_eq_top`, `tauceti:TauCeti.GaloisDescent.liftBaseChange_injective_of_invariant`, `mathlib:Field.absoluteGaloisGroup`, `mathlib:Representation`.

Sources:

- p-adic Differential Equations (kedlaya-pde-book), Definitions 19.1.2 and 19.1.4, Lemma 19.1.3, pp. 314-315: D(V) as Galois invariants of V ⊗ Ẽ, its dimension by Hilbert-Noether and lattices, and the induced differential and Frobenius structures.
- p-adic Differential Equations (kedlaya-pde-book), Definitions 19.2.2, 19.2.4 and 19.2.8, Lemma 19.2.3, Proposition 19.2.5, Example 19.2.6, Remark 19.2.7, pp. 317-318: D†(V) for finite image and for finite local monodromy, its solvability at 1, the Artin-Schreier example and the recovery of the inertia restriction from horizontal sections.
- Notes on isocrystals (kedlaya-isocrystals), Remark 3.10, p. 7: The local models: unit-root objects over k((t)) correspond to p-adic representations of G_{k((t))}, overconvergent ones to those with finite image of inertia (Tsuzuki).

<a id="RD-2-fontaine-katz-unit-root-equivalence"></a>

### Fontaine-Katz equivalence: unit-root (σ,∇)-modules over E and p-adic representations of G_{k((t))}

`PadicDifferentialEquationsAndRigidCohomology:RD.2/fontaine-katz-unit-root-equivalence` · theorem.

Suppose σ\_K is absolute (it acts on k by x ↦ x^q) and its fixed field K_0 = K^{σ\_K=1} has residue field F_q and the same value group as K. For a continuous representation V_0 of G = Gal(k((t))^sep/k((t))) on a finite-dimensional K_0-vector space, give V = V_0 ⊗\_{K_0} K the σ\_K-semilinear Frobenius fixing V_0. Then V_0 ↦ D(V) (RD.2/galois-representation-to-differential-module (a)) is an equivalence, compatible with tensor products and duals, from continuous K_0-representations of G to finite differential modules over E with a unit-root Frobenius structure relative to σ; a quasi-inverse is D ↦ (D ⊗\_E Ẽ)^{F=1}. Moreover the differential structure is redundant: a finite free unit-root σ-module over E carries a unique compatible differential structure. For K = Q_q and σ\_K the q-power Witt-vector Frobenius (the identity of Q_q) this is an equivalence with continuous Q_q-representations of G_{F_q((t))} (Kedlaya, Corollary 19.1.6).

Hypotheses and conventions:

- σ is a Frobenius lift on E acting on K by σ\_K, with σ\_K absolute; the value-group and residue-field hypotheses on K_0 guarantee Ẽ^{σ=1} = K_0 (RD.2/unramified-extensions-of-amice-rings (d)).
- For Z_p-lattices and a p-power Frobenius on a Cohen ring this is FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/etale-phi-modules-cohen-ring (ii); here the coefficients are O_{K_0} and the Frobenius has order q.

Proof route:

1. D(V) is a unit-root (σ,∇)-module (RD.2/galois-representation-to-differential-module (a)).
2. (D(V_0) ⊗ Ẽ)^{F=1} = (V ⊗\_K Ẽ)^{F=1} = V_0 ⊗\_{K_0} Ẽ^{σ=1} = V_0, using Ẽ^{σ=1} = K_0 (Kedlaya, p-adic Differential Equations, proof of Proposition 19.1.5, and Exercise (1) of Chapter 19).
3. For D unit-root, D ⊗ Ẽ is a trivial difference module: it has a basis of F-fixed vectors (RD.2/lang-trivialisation-of-unit-root-modules (a)); hence V_0(D) := (D ⊗ Ẽ)^{F=1} has K_0-dimension rank D, the natural map V_0(D) ⊗ Ẽ → D ⊗ Ẽ is an isomorphism, G acts continuously on V_0(D) by (b) of that lemma, and D(V_0(D)) = D by taking G-invariants (RD.2/unramified-extensions-of-amice-rings (b)).
4. Uniqueness of the differential structure (Kedlaya, Exercise (2) of Chapter 19 and Remark 19.1.7): under D ⊗ Ẽ ≅ V_0 ⊗ Ẽ any compatible connection kills the F-fixed vectors, because ∇ maps (D ⊗ Ẽ)^{F=1} into the F-fixed part of D ⊗ Ẽ ⊗ Ω^1, which is zero since dσ is divisible by π on Ω^1 (RD.2/differentials-have-positive-slopes); so ∇ = 1 ⊗ d on V_0 ⊗ Ẽ, and it descends uniquely.
5. Tensor compatibility: F-fixed vectors of a tensor product contain the tensor products of F-fixed vectors, with equal dimensions.

Acceptance:

- V_0 = K_0 trivial ↦ (E, d, σ).
- Corollary 19.1.6: for K = Q_q and σ\_K = id (the q-power Witt Frobenius), continuous Q_q-representations of G_{F_q((t))} correspond to unit-root (σ,∇)-modules over E for a Frobenius lift with σ(t) ≡ t^q.
- Unramified characters χ: G → G/I → Z_p^× (through Frobenius of k) ↦ rank-one modules E e with ∇e = 0 and F e = χ(Frob)^{±1} e (up to the normalisation of the arithmetic Frobenius).

Prerequisites: `PadicDifferentialEquationsAndRigidCohomology:RD.2/galois-representation-to-differential-module`, `PadicDifferentialEquationsAndRigidCohomology:RD.2/lang-trivialisation-of-unit-root-modules`, `PadicDifferentialEquationsAndRigidCohomology:RD.2/unramified-extensions-of-amice-rings`, `PadicDifferentialEquationsAndRigidCohomology:RD.2/differentials-have-positive-slopes`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/etale-phi-modules-cohen-ring`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/frobenius-differential-module`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/isoclinic-frobenius-module`.

Sources:

- p-adic Differential Equations (kedlaya-pde-book), Proposition 19.1.5 and Corollary 19.1.6, pp. 315-316: The equivalence between continuous K_0-representations and finite differential modules over E with unit-root Frobenius structure, with inverse (D ⊗ Ẽ)^{φ=1}, under the stated hypotheses on K_0.
- p-adic Differential Equations (kedlaya-pde-book), Remark 19.1.7 and Remark 19.1.8, p. 316; Exercises (1) and (2), p. 325: The differential structure is not needed (unique compatible differential structure); for non-absolute lifts the proposition fails because the residue field of Ẽ need not be weakly difference-closed.
- Notes on isocrystals (kedlaya-isocrystals), Theorem 3.7 and Remark 3.10, pp. 6-7: The Katz-Crew equivalence of unit-root convergent F-isocrystals with étale Q_p-local systems, whose local model is this statement.

<a id="RD-2-unit-root-matrix-normal-form"></a>

### Normal form of the matrices of a unit-root (σ,∇)-module for a standard Frobenius lift

`PadicDifferentialEquationsAndRigidCohomology:RD.2/unit-root-matrix-normal-form` · lemma.

Let σ be a standard Frobenius lift on E† (σ(t) = t^q; σ\_K arbitrary) and M a finite free differential module over E† with a unit-root Frobenius structure. Then there is an integer m ≥ 1 prime to p such that M ⊗\_{E†} E†[t^{1/m}] has a basis on which the matrices A, A^{−1} of F and N of t·d/dt have entries in E†[t^{1/m}] ∩ O_K⟦t^{−1/m}⟧ (power series in t^{−1/m} with integral coefficients and no positive powers of t). If M is c-constant for some c < 1 (RD.2/c-constant-unit-root-module), one may take m = 1 and keep |A − I|\_1 ≤ c.

Hypotheses and conventions:

- σ standard: σ(t) = t^q and σ extends σ\_K on K; the Frobenius structure is unit-root (a basis with A ∈ GL_n(O_{E†}) exists).
- E†[t^{1/m}] is the bounded Robba ring in the variable t^{1/m}, a tamely ramified extension of E†.

Proof route:

1. Choose a basis on which A ∈ GL_n(O_{E†}) (RD.1/frobenius-stable-lattices (a)); reorder so that the minimum t-adic valuation of the reduction of the entries occurs in position (1,1), adjoin t^{1/(q−1)} and rescale to make it 0, then eliminate the rest of the first column; proceeding inductively makes A upper triangular and invertible over k⟦t^{1/m}⟧ modulo π (Kedlaya, p-adic Differential Equations, Lemma 19.3.3, first paragraph of the proof).
2. Write A = Σ\_i A_i t^{i/m}; repeatedly replace A by U^{−1} A σ(U) with U = I + A_0^{−1} Σ\_{i>0} A_i t^{i/m}; the U converge to the identity in the (t^{1/m}, m_K)-adic topology, removing positive powers of t (if M is c-constant start here with m = 1, which preserves |A − I|\_1 ≤ c).
3. The compatibility N − q A σ(N) A^{−1} = t (dA/dt) A^{−1} (Kedlaya (17.1.2.1)) then forces N to have only nonpositive powers of t: first modulo q, then modulo q^2, q^3, and so on.

Acceptance:

- The trivial module: m = 1, A = I, N = 0.
- Dwork's module M_f, f = t^{−1}: A = E(t^{−1}) and N = −π\_0 t^{−1} already lie in E† ∩ O_K⟦t^{−1}⟧ with m = 1.

Prerequisites: `PadicDifferentialEquationsAndRigidCohomology:RD.2/c-constant-unit-root-module`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/frobenius-stable-lattices`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/frobenius-differential-module`, `PadicDifferentialEquationsAndRigidCohomology:RD.0/bounded-robba-ring`.

Sources:

- p-adic Differential Equations (kedlaya-pde-book), Lemma 19.3.3 and proof, pp. 319-320: Normal form of A, A^{−1}, N with entries in E†[t^{1/m}] ∩ o_K⟦t^{−1/m}⟧, and m = 1 with |A − I|\_1 ≤ c in the c-constant case.
- p-adic Differential Equations (kedlaya-pde-book), Remark 17.1.2, (17.1.2.1), p. 292: The compatibility N A + t dA/dt = (t/φ(t))(dφ(t)/dt) A φ(N) for the derivation t d/dt.

<a id="RD-2-dwork-transfer-to-the-centre-of-a-disc"></a>

### Dwork's transfer theorem: the radius of convergence at the centre of a disc is at least the generic radius

`PadicDifferentialEquationsAndRigidCohomology:RD.2/dwork-transfer-to-the-centre-of-a-disc` · theorem.

Let K be complete nonarchimedean of characteristic 0 with residue characteristic p, β > 0, and M a nonzero finite free differential module (for d/dt) over the ring K⟨t/β⟩ of power series converging on the closed disc |t| ≤ β, or over the ring of functions on the open disc |t| < β. Let R(M ⊗ F_β) be the generic radius of convergence of M at radius β (RD.1/generic-radius). Then for every λ < min{β, R(M ⊗ F_β)}, M ⊗ K⟨t/λ⟩ has a basis of horizontal sections; equivalently the fundamental solution matrix at t = 0 and its inverse converge on the open disc of radius min{β, R(M ⊗ F_β)}: the radius of convergence of M at 0 is at least its generic radius.

Hypotheses and conventions:

- Characteristic 0 is needed to form the Taylor series Σ (−t)^i/i! D^i(x).
- For the open disc one applies the statement to the restrictions to closed discs of radius β' < β and lets β' → β, using continuity of the generic radius (RD.1/generic-radius-basic-properties (d)).

Proof route:

1. Fix λ < β with λ < ω|D|\_{sp,M}^{−1}, ω = p^{−1/(p−1)}, and a supremum norm on M compatible with |·|\_λ. Choose ε > 0 with λω^{−1}(|D|\_{sp,M} + ε) < 1; there is c > 0 with |D^i(x)| ≤ c(|D|\_{sp,M} + ε)^i |x| for all i (Kedlaya, p-adic Differential Equations, Lemma 6.1.8), so the Taylor series y = Σ\_i ((−t)^i/i!) D^i(x) converges in M ⊗ K⟨t/λ⟩ since |1/i!| ≤ ω^{−i}.
2. Differentiating term by term gives D(y) = 0. Applied to a basis of M this yields horizontal sections whose reductions modulo t form a basis, hence a horizontal basis of M ⊗ K⟨t/λ⟩ (a finite differential module over the disc is free and a set of sections whose values at 0 are a basis is a basis: Kedlaya, Proposition 9.1.2).
3. The spectral norm |D|\_{sp,M} is computed after base change to F_β (RD.1/spectral-norm-of-differential-module), which is the definition of the generic radius R(M ⊗ F_β) = ω|D|\_{sp}^{−1} (Kedlaya, Definition 9.4.4).

Acceptance:

- Trivial module: R(M ⊗ F_β) = β and the horizontal sections are constants (Kedlaya, Definition 9.4.4: R(V) = ρ for the trivial module over F_ρ).
- The exponential module D(v) = v (horizontal section e^{−t}v): R(M ⊗ F_β) = min{β, ω} and e^{−t} converges exactly on |t| < ω = p^{−1/(p−1)}, so the bound is attained.
- Generic-disc form: RD.1/dwork-transfer-generic-disc states the same convergence for discs centred at generic points of the circle |t| = β; this node transfers it to the centre.

Prerequisites: `PadicDifferentialEquationsAndRigidCohomology:RD.1/generic-radius`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/spectral-norm-of-differential-module`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/dwork-transfer-generic-disc`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/generic-radius-basic-properties`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/differential-module`.

Sources:

- p-adic Differential Equations (kedlaya-pde-book), Theorem 9.6.1 and proof, pp. 158-159: Dwork's transfer theorem: R(M) ≥ R(M ⊗ F_β) for a nonzero finite differential module over the closed or open disc of radius β, proved by convergence of the Taylor series of horizontal sections.
- p-adic Differential Equations (kedlaya-pde-book), Definition 9.4.4, p. 156: The generic radius R(V) = ω|D|\_{sp,V}^{−1}, with R = ρ for the trivial module over F_ρ.
- Local monodromy of p-adic differential equations: an overview (kedlaya-local-monodromy-overview), Proposition 5.2.3, pp. 29-30: The generic-point form: R(E, ρ) ≥ r iff E has a basis of horizontal sections on discs of radius r around points (or a generic point) of the circle |t| = ρ.

<a id="RD-2-small-constant-unit-root-module-is-trivial"></a>

### A c-constant unit-root (σ,∇)-module with c < p^{−1/(p−1)} is trivial (the key lemma of Tsuzuki's theorem)

`PadicDifferentialEquationsAndRigidCohomology:RD.2/small-constant-unit-root-module-is-trivial` · lemma.

Let M be a finite free differential module over E† (resp. over E†\_L for a finite separable L/k((t)) whose residue field is separable over k, so that E†\_L is a bounded Robba ring over the unramified extension K_L of K in a parameter u) with a unit-root Frobenius structure. If M is c-constant (RD.2/c-constant-unit-root-module) for some c < p^{−1/(p−1)}, then M is trivial as a differential module: M has a basis of horizontal sections over E† (resp. E†\_L). The space H^0(M) of horizontal sections is F-stable, so it is a unit-root Frobenius module over K (resp. K_L) of dimension rank M.

Hypotheses and conventions:

- The bound c < p^{−1/(p−1)} is sharp: Dwork's module M_f, f = t^{−1}, is p^{−1/(p−1)}-constant and not trivial over E† (RD.2/c-constant-unit-root-module, acceptance).
- K complete discretely valued of characteristic 0; any Frobenius lift (c-constancy does not depend on it).

Proof route:

1. Reduce to a standard Frobenius lift σ(t) = t^q (c-constancy is invariant under change of Frobenius, RD.2/c-constant-unit-root-module (i)); by RD.2/unit-root-matrix-normal-form choose a c-constant basis on which F and t·d/dt act by A, N with entries in E† ∩ O_K⟦t^{−1}⟧.
2. The compatibility N A + t dA/dt = q A σ(N) and |A_0| = |A_0^{−1}| = |A|\_1 = |A^{−1}|\_1 = 1 force N_0 = 0 and |N|\_1 ≤ c, so |N|\_α ≤ 1 for some α ∈ (0, 1) (A and N then define a module on the region |t^{−1}| ≤ α^{−1}).
3. Frobenius descent of the system (Kedlaya, p-adic Differential Equations, construction in the proof of Lemma 18.2.3): build V with entries in E† ∩ K⟦t^{−1}⟧, |V − I|\_1 ≤ c, |V − I|\_α ≤ 1, such that A' = V^{−1} A σ(V) and N' = V^{−1} N V + V^{−1} t dV/dt are power series in t^{−p}; substitute t^{−p} ↦ t^{−1} (ψ commutes with the standard σ) and divide N by p: the new pair still satisfies the compatibility, |A'' − I|\_1 ≤ c, |N''|\_1 ≤ c and |N''|\_{α^p} ≤ p.
4. Log-convexity of Gauss norms in log ρ (Hadamard three circles, Kedlaya Proposition 8.2.3; RD.1/generic-radius-basic-properties (d)) interpolating between |N''|\_1 ≤ c and |N''|\_{α^p} ≤ p gives |N''|\_β ≤ 1 with log β = (p log c/(log c − log p)) log α; since p log c < log c − log p < 0 this improves α by a fixed factor > 1 in −log, so iterating makes α < p^{−1/(p−1)}.
5. Then the module M' on the disc |t^{−1}| < α^{−1} with t^{−1} d/dt^{−1} acting by −N has spectral norm of d/dt^{−1} at most α (RD.1/spectral-norm-of-differential-module, Kedlaya Theorem 6.5.3), hence generic radius at radius α^{−1} at least p^{−1/(p−1)}α^{−1} > 1, so by RD.2/dwork-transfer-to-the-centre-of-a-disc its horizontal sections at t^{−1} = 0 converge on a disc of radius > 1 in t^{−1}; restricting to an annulus near |t| = 1 gives a horizontal basis of M (Kedlaya, Lemma 19.3.4).
6. F-stability of H^0(M): F maps horizontal sections to horizontal sections because ∇∘F = (F ⊗ dσ)∘∇.

Acceptance:

- Kedlaya, Proposition 6.11 (arXiv:math/0110124 v4, p. 79) assumes exactly a basis with v_p(A − I) > 1/(p−1), i.e. c-constancy with c < p^{−1/(p−1)}, and concludes that ker ∇ has full rank: this node is a public proof of that step, replacing the citation of Tsuzuki (Amer. J. Math. 120 (1998), Theorem 5.1.1).
- Rank one with A = 1 + π^m a, a ∈ O_{E†}, |π|^m < p^{−1/(p−1)}: the horizontal generator exists over E† itself.

Prerequisites: `PadicDifferentialEquationsAndRigidCohomology:RD.2/c-constant-unit-root-module`, `PadicDifferentialEquationsAndRigidCohomology:RD.2/unit-root-matrix-normal-form`, `PadicDifferentialEquationsAndRigidCohomology:RD.2/dwork-transfer-to-the-centre-of-a-disc`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/spectral-norm-of-differential-module`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/generic-radius`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/generic-radius-basic-properties`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/frobenius-differential-module`, `PadicDifferentialEquationsAndRigidCohomology:RD.2/finite-etale-extension-of-bounded-robba-ring`.

Sources:

- p-adic Differential Equations (kedlaya-pde-book), Lemma 19.3.4 and proof, pp. 320-321: A finite differential module over E† with unit-root Frobenius structure that is c-constant for some c < p^{−1/(p−1)} is trivial; proof by Lemma 19.3.3, the Frobenius descent of Lemma 18.2.3, Proposition 8.2.3, Theorem 6.5.3 and Theorem 9.6.1.
- p-adic Differential Equations (kedlaya-pde-book), Lemma 18.2.3 and proof, pp. 303-304: Construction of the matrix V with V_i = 0 for p | i solving N_0 V_i − V_i N_0 + i V_i = −(N_W)\_i, which makes the system a function of t^p.
- p-adic Differential Equations (kedlaya-pde-book), Proposition 8.2.3, p. 138; Theorem 6.5.3, p. 106: Log-convexity and continuity of ρ ↦ |x|\_ρ; the Christol-Dwork bound for the spectral norm of a twisted polynomial.
- A p-adic local monodromy theorem (kedlaya-monodromy-2003), Proposition 6.11, p. 79 (arXiv v4): States the conclusion (kernel of ∇ of full rank and F-stable) under v_p(A − I) > 1/(p − 1), citing Tsuzuki for k algebraically closed and q = p.

<a id="RD-2-tsuzuki-equivalence-finite-local-monodromy"></a>

### Tsuzuki's theorem: unit-root (σ,∇)-modules over E† have finite local monodromy, and correspond to representations with finite local monodromy

`PadicDifferentialEquationsAndRigidCohomology:RD.2/tsuzuki-equivalence-finite-local-monodromy` · theorem.

(a) (Trivialisation; any K, any Frobenius lift σ, any k.) Let M be a unit-root (σ,∇)-module over E† = R^bd. If k is perfect there is a finite separable (Galois) extension L of k((t)) such that M ⊗\_{E†} E†\_L has a basis of horizontal sections, on which F acts by a matrix in GL_n(K_L); for general k the same holds over E†\_{L'} for a nearly finite separable L' (RD.2/finite-etale-extension-of-bounded-robba-ring (d)). Consequently M ⊗ R is quasi-constant (RD.2/constant-and-quasi-constant-differential-module), and the kernel of ∇ on M ⊗ E†\_L is F-stable of rank n over K_L. This is the statement of RD.2/tsuzuki-unit-root-finite-monodromy. (b) (Equivalence; k perfect.) If σ\_K is absolute and K_0 = K^{σ\_K=1} has residue field F_q and the same value group as K, then V_0 ↦ D†(V_0 ⊗\_{K_0} K) (RD.2/galois-representation-to-differential-module (c)) is an equivalence of tensor categories from continuous representations of G = Gal(k((t))^sep/k((t))) with finite local monodromy on finite-dimensional K_0-vector spaces to finite differential modules over E† with a unit-root Frobenius structure; its composite with base change to E is the Fontaine-Katz equivalence (RD.2/fontaine-katz-unit-root-equivalence). In particular a continuous K_0-representation has finite local monodromy iff its unit-root module D(V) over E descends to E†.

Hypotheses and conventions:

- (a) needs only that σ reduces to the q-power map of k((t)); (b) needs the hypotheses of the Fontaine-Katz equivalence.
- For imperfect k a separable L/k((t)) may have inseparable residue extension, so E†\_L need not be a bounded Robba ring over a coefficient field; the nearly separable L' of RD.2/finite-etale-extension-of-bounded-robba-ring (d) repairs this (Kedlaya, arXiv:math/0110124, proof of Proposition 6.11, last paragraph; Kedlaya, p-adic Differential Equations, Section 20.5).

Proof route:

1. (a), k perfect: choose an étale lattice and, by RD.2/lang-trivialisation-of-unit-root-modules (c), a finite Galois L with M ⊗ E†\_L c-constant for some c < p^{−1/(p−1)}; since k is perfect the residue field of L is separable over k and E†\_L is a bounded Robba ring over K_L in a lifted uniformiser u (RD.2/finite-etale-extension-of-bounded-robba-ring (c)); RD.2/small-constant-unit-root-module-is-trivial gives a horizontal basis, and H^0 is F-stable (Kedlaya, p-adic Differential Equations, proof of Theorem 19.3.1, p. 321).
2. (a), general k: by the Lang step the finite separable L exists; replace it by the compositum L' of L with k^{q^{−m}}((t)) for m so large that the residue extension of L' over k^{q^{−m}} is separable (arXiv:math/0110124, proof of Proposition 6.11, last paragraph); c-constancy persists under base change, and the key lemma applies over E†\_{L'}, a bounded Robba ring over the m-th Frobenius copy K^{(m)} of K.
3. Quasi-constancy of M ⊗ R: M ⊗ R^L = (M ⊗ E†\_L) ⊗ R^L is spanned by the horizontal basis (RD.2/constant-and-quasi-constant-differential-module).
4. (b) Full faithfulness: D†(V) ⊗ E = D(V) and the Fontaine-Katz equivalence is fully faithful, while every G-equivariant map induces a map of the D† (Kedlaya, proof of Theorem 19.3.1). Essential surjectivity: by (a) M ⊗ E†\_L is trivial for a finite Galois L, so the representation V_0(M ⊗ E) is trivial on the inertia subgroup of G_L, i.e. has finite local monodromy, and M = D†(V_0) by Galois descent from E†\_L (RD.2/galois-representation-to-differential-module (b), (c)).
5. Converse: if V has finite local monodromy then D†(V) is a unit-root (σ,∇)-module over E† whose base change is D(V).

Acceptance:

- Dwork's module M_f (f = t^{−1}) becomes trivial over the Artin-Schreier extension L: z^p − z = t^{−1} (RD.2/dwork-exponential-artin-schreier-example), and corresponds to the character of Gal(L/k((t))) with value ζ\_p on z ↦ z + 1 (Kedlaya, Example 19.2.6).
- A unit-root (σ,∇)-module over E† that is unipotent over R^L is constant over E†\_L (Kedlaya, Remark 20.1.5): the generalisation to all slopes is RD.2/quasi-unipotence-and-local-monodromy-statement.
- Non-example: the rank-one ∇-module E† e with ∇e = e ⊗ dt admits no Frobenius structure (it is not solvable, RD.2/frobenius-hypothesis-is-necessary), so the theorem does not apply to it, and indeed it never becomes trivial over any E†\_L.

Prerequisites: `PadicDifferentialEquationsAndRigidCohomology:RD.2/lang-trivialisation-of-unit-root-modules`, `PadicDifferentialEquationsAndRigidCohomology:RD.2/small-constant-unit-root-module-is-trivial`, `PadicDifferentialEquationsAndRigidCohomology:RD.2/c-constant-unit-root-module`, `PadicDifferentialEquationsAndRigidCohomology:RD.2/galois-representation-to-differential-module`, `PadicDifferentialEquationsAndRigidCohomology:RD.2/fontaine-katz-unit-root-equivalence`, `PadicDifferentialEquationsAndRigidCohomology:RD.2/unramified-extensions-of-amice-rings`, `PadicDifferentialEquationsAndRigidCohomology:RD.2/finite-etale-extension-of-bounded-robba-ring`, `PadicDifferentialEquationsAndRigidCohomology:RD.2/constant-and-quasi-constant-differential-module`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/frobenius-stable-lattices`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/change-of-frobenius-for-frobenius-structures`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/isoclinic-frobenius-module`.

Sources:

- p-adic Differential Equations (kedlaya-pde-book), Theorem 19.3.1 and its proof, pp. 318 and 321: Tsuzuki's theorem: for an absolute q-power Frobenius lift with K_0 of residue field F_q and the value group of K, V_0 ↦ D†(V) is an equivalence between representations with finite local monodromy and finite differential modules over E† with unit-root Frobenius structure; the proof chooses L with M ⊗ E†\_L c-constant for c < p^{−1/(p−1)} and applies Lemma 19.3.4.
- p-adic Differential Equations (kedlaya-pde-book), Notes to Chapter 19, p. 323: Attribution: rank one to Crew, the general case to Tsuzuki (Amer. J. Math. 1998, Theorem 5.1.1), alternative expositions by Christol and Kedlaya; the c-constancy argument handles the change of Frobenius lift.
- A p-adic local monodromy theorem (kedlaya-monodromy-2003), Proposition 6.11 and proof, pp. 79-80 (arXiv v4): The reductions from q = p to q = p^f, from k algebraically closed to general k, and the nearly separable choice of the extension when k is imperfect.
- Notes on isocrystals (kedlaya-isocrystals), Theorem 3.9 and Remark 3.10, p. 7: Tsuzuki's theorem in the language of overconvergent unit-root F-isocrystals and potentially unramified local systems; the local model is this equivalence.

## 2. Quasi-constant modules and Matsuda's decomposition

Chapter 4 of Kedlaya's overview, which the RD.1 pass assigned to this layer, describes quasi-constant modules by semilinear representations of finite Galois groups and decomposes every quasi-unipotent module as a sum of quasi-constant irreducibles tensored with unipotent modules. The first pass's monodromy-representation equivalence uses both in its proof; they are planned here. Local duality for quasi-unipotent modules is part of the decomposition node.

<a id="RD-2-quasi-constant-modules-are-semilinear-representations"></a>

### ∇-modules that become constant over R^L are semilinear representations of Gal(L/k((t)))

`PadicDifferentialEquationsAndRigidCohomology:RD.2/quasi-constant-modules-are-semilinear-representations` · theorem.

Let K be complete nonarchimedean of characteristic 0, L/k((t)) a finite Galois extension with group G_L = Gal(L/k((t))), R^L the corresponding finite étale extension of the Robba ring (RD.2/finite-etale-extension-of-bounded-robba-ring) and K' the integral closure of K in R^L (its ring of constants). (a) The functor E ↦ H^0(E ⊗\_{R_K} R^L) is an equivalence of K-linear tensor categories, compatible with duals, from ∇-modules over R_K that become constant over R^L to finite-dimensional semilinear representations of G_L over K' (G_L acting on K' through its action on R^L); a quasi-inverse is V ↦ (V ⊗\_{K'} R^L)^{G_L}. (b) Semilinear representations of a finite group G acting on a field F of characteristic 0 are completely reducible (Maschke), Schur's lemma holds, induction and restriction along a homomorphism G → H are adjoint (Frobenius reciprocity), and every irreducible one is a direct summand of the regular representation F{G}; if G = Gal(F/F_0) acts faithfully, every semilinear representation is trivial (F^n with the coefficient action), since H^1(Gal(F/F_0), GL_n(F)) = 1. (c) Consequently the category M_qc of quasi-constant ∇-modules is closed under direct sums, tensor products, duals, subobjects and quotients (not under extensions), every quasi-constant module is a direct summand of a sum of copies of the pushforward f_\*O_X = R^L, and H^0 commutes with duals on M_qc.

Hypotheses and conventions:

- K of characteristic 0 (division by |G| in Maschke's averaging); no perfectness of k is needed when L is any finite Galois extension and R^L is formed as in RD.2/finite-etale-extension-of-bounded-robba-ring.
- Right actions as in Kedlaya's overview, Convention 4.2.1; the twisted group algebra F{G} has c{g}·d{h} = c d^{g^{−1}} {gh}.

Proof route:

1. (b) Maschke: average a projector over G (Kedlaya overview Lemma 4.2.3); Schur: kernels and images are subrepresentations (Lemma 4.2.4); Frobenius reciprocity: induction V ⊗\_{F{G}} F{H} is left adjoint to restriction (Lemma 4.2.7); Corollary 4.2.9 by reciprocity applied to the trivial group; triviality for G = Gal(F/F_0) by Hilbert-Noether descent (Remark 4.2.5; Tau Ceti's TauCeti.GaloisDescent.span_invariants_eq_top and liftBaseChange_injective_of_invariant).
2. (a) Full faithfulness: H^0(E ⊗ R^L)^∨ ⊗ H^0(F ⊗ R^L) ≅ H^0((E^∨ ⊗ F) ⊗ R^L) by dimension count and injectivity, and G_L-invariant horizontal sections of E^∨ ⊗ F over R^L are horizontal sections over R_K (RD.2/robba-ring-antiderivative: ker d on R^L is K'); essential surjectivity: H^0(R^L) is the regular representation of G_L over K', so an irreducible V is the image of a G_L-equivariant projector on H^0(R^L), which comes from a projector of the ∇-module R^L over R_K (overview Lemma 4.3.2).
3. (c) follows from (a) and (b) as in overview Definition 4.3.1 and the proof of Proposition 4.4.3.

Acceptance:

- E = (R_K, d): H^0(E ⊗ R^L) = K' with the coefficient action.
- The pushforward of R^L to R_K corresponds to the regular representation K'{G_L}.
- Dwork's module M_f (f = t^{−1}) becomes constant over the Artin-Schreier extension L (RD.2/dwork-exponential-artin-schreier-example) and corresponds to a nontrivial character of Gal(L/k((t))) ≅ Z/p (K' = K when k is algebraically closed in L).
- Non-example to closure under extensions: the unipotent module with ∇e_2 = e_1 ⊗ dt/t (SFR Example 7.2.6) is an extension of two constant modules but is not quasi-constant (its monodromy N ≠ 0).

Prerequisites: `PadicDifferentialEquationsAndRigidCohomology:RD.2/finite-etale-extension-of-bounded-robba-ring`, `PadicDifferentialEquationsAndRigidCohomology:RD.2/constant-and-quasi-constant-differential-module`, `PadicDifferentialEquationsAndRigidCohomology:RD.2/robba-ring-antiderivative`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/differential-module`, `tauceti:TauCeti.GaloisDescent.span_invariants_eq_top`, `tauceti:TauCeti.GaloisDescent.liftBaseChange_injective_of_invariant`, `mathlib:Representation`.

Sources:

- Local monodromy of p-adic differential equations: an overview (kedlaya-local-monodromy-overview), Section 4.2, Lemmas 4.2.3, 4.2.4, 4.2.7, Corollary 4.2.9, Remark 4.2.5, pp. 18-19: Maschke, Schur, Frobenius reciprocity and the regular representation for semilinear representations of finite groups, and triviality of semilinear Galois representations by vanishing of H^1(G, GL_n).
- Local monodromy of p-adic differential equations: an overview (kedlaya-local-monodromy-overview), Definition 4.3.1 and Lemma 4.3.2, p. 20: Quasi-constant ∇-modules and the equivalence E ↦ H^0(E, X) with semilinear representations of Gal(R/k((t))) over the constants K'.
- p-adic Differential Equations (kedlaya-pde-book), Proof of Proposition 20.1.3, p. 327: After enlarging K, H^0(M ⊗ R^L) is a linear representation of the finite group G_{L/k((t))}, defined over a finite extension of Q_p.

<a id="RD-2-matsuda-decomposition"></a>

### Matsuda's decomposition of quasi-unipotent ∇-modules as ⊕ F_i ⊗ U_i

`PadicDifferentialEquationsAndRigidCohomology:RD.2/matsuda-decomposition` · theorem.

Let K be complete nonarchimedean of characteristic 0 and M_qu the category of quasi-unipotent ∇-modules over R_K (RD.2/quasi-unipotent-differential-module). (a) (Dualizability) For E ∈ M_qu, H^0(E) and H^1(E) = coker(∇) are finite-dimensional and the residue pairing H^0(E^∨) × H^1(E) → H^1(E^∨ ⊗ E) → H^1(R_K) ≅ K (residue of Σ c_i t^i dt ↦ c_{−1}) is perfect. (b) For P quasi-constant and U unipotent, H^0(P) ⊗\_K H^0(U) → H^0(P ⊗ U) is an isomorphism; a nonzero indecomposable unipotent U has dim H^0(U) = dim H^1(U) = 1. (c) If E_j is F_j-typical (a successive extension of copies of an irreducible F_j) for j = 1, 2 with F_1 ≇ F_2, then Ext^i(E_1, E_2) = 0 for i = 0, 1. (d) Every E ∈ M_qu has a decomposition E ≅ ⊕\_i F_i ⊗ U_i, unique up to reordering and isomorphism, with F_i quasi-constant irreducible and pairwise non-isomorphic and U_i unipotent; in particular every indecomposable quasi-unipotent module is F ⊗ U with F quasi-constant irreducible and U unipotent indecomposable.

Hypotheses and conventions:

- Quasi-unipotent means a filtration with quasi-constant successive quotients; M_qu is closed under direct sums, tensor products, duals, subquotients and extensions (Kedlaya overview Definition 4.6.1).
- K discretely valued and k perfect, as in Kedlaya's book (Proposition 20.4.2): the reduction to a Robba ring over a finite extension of K needs the residue extension of R^L to be separable (overview Remark 3.5.7); for imperfect k the nearly separable extensions of RD.2/finite-etale-extension-of-bounded-robba-ring (d) replace it (Kedlaya's book, Section 20.5).
- The perfect residue pairing for (φ,∇)-modules over the Robba ring (Kedlaya, p-adic Differential Equations, Proposition 20.4.2; planned as RD.1/robba-residue-duality by the RD.1 continuation) is (a) combined with the p-adic local monodromy theorem RD.2/quasi-unipotence-and-local-monodromy-statement; (a) is the public proof that node's gap G5 asks for.

Proof route:

1. (a) Dualizability is stable under direct sums and extensions (snake lemma on 0 → H^0(E_2^∨) → H^0(E^∨) → H^0(E_1^∨) against the dual H^1 sequence; overview Remark 4.4.2), so it suffices to treat E quasi-constant; by Q1 (c) E is a summand of copies of f_\*O_X with H^i(f_\*O_X) = H^i(R^L), and after a finite Galois extension of K (which commutes with H^0 and H^1) R^L is a Robba ring with H^0 = H^1 = K' by RD.2/robba-ring-antiderivative (overview Proposition 4.4.3).
2. (b) Induction on rank U using 0 → O → U → U_1 → 0, the five lemma and (a) for the H^1 term (overview Lemma 4.5.6); the indecomposable case is the Jordan-block statement for nilpotent matrices through RD.2/unipotent-iff-nilpotent-residue (overview Lemma 4.5.5).
3. (c) Ext^i(E_1, E_2) = H^i(E_1^∨ ⊗ E_2); by (a) reduce to i = 0, then induction on rank and Schur's lemma (overview Lemma 4.6.4).
4. (d) Existence of the decomposition into F-typical pieces by induction on rank with (c) (overview Proposition 4.6.5); an F-typical E is F ⊗ U: if 0 → E_1 → E → F → 0 with E_1 ≅ F ⊗ U_1, then Ext^1(F, E_1) = H^0(F^∨ ⊗ F)^∨ ⊗ Ext^1(O, U_1) by (a), (b), and after an automorphism of F the extension class comes from an extension of O by U_1 (overview Theorem 4.6.6; Kedlaya, p-adic Differential Equations, Corollary 20.4.3).

Acceptance:

- E = R_K: H^0 = H^1 = K and the pairing is the residue pairing K × K → K, (a, b) ↦ ab.
- The unipotent module U_2 with ∇e_2 = e_1 ⊗ dt/t: dim H^0 = dim H^1 = 1 (ker and coker of the nilpotent Jordan block, RD.2/unipotent-iff-nilpotent-residue).
- For F the rank-one module of a nontrivial Artin-Schreier character and U_2 as above, F ⊗ U_2 is indecomposable, quasi-unipotent and neither quasi-constant nor unipotent; H^0(F ⊗ U_2) = H^0(F) ⊗ H^0(U_2) = 0.

Prerequisites: `PadicDifferentialEquationsAndRigidCohomology:RD.2/quasi-constant-modules-are-semilinear-representations`, `PadicDifferentialEquationsAndRigidCohomology:RD.2/quasi-unipotent-differential-module`, `PadicDifferentialEquationsAndRigidCohomology:RD.2/unipotent-differential-module`, `PadicDifferentialEquationsAndRigidCohomology:RD.2/unipotent-iff-nilpotent-residue`, `PadicDifferentialEquationsAndRigidCohomology:RD.2/robba-ring-antiderivative`, `PadicDifferentialEquationsAndRigidCohomology:RD.2/constant-and-quasi-constant-differential-module`.

Sources:

- Local monodromy of p-adic differential equations: an overview (kedlaya-local-monodromy-overview), Section 4.4, Definition 4.4.1, Remark 4.4.2, Proposition 4.4.3, pp. 20-21: The local duality pairing H^0(E^∨) × H^1(E) → K and its perfectness for quasi-constant modules and their successive extensions.
- Local monodromy of p-adic differential equations: an overview (kedlaya-local-monodromy-overview), Lemmas 4.5.5 and 4.5.6, Definition 4.6.1, Definition 4.6.3, Lemma 4.6.4, Proposition 4.6.5, Theorem 4.6.6, pp. 23-26: Indecomposable unipotent modules, the tensor formula for H^0, vanishing of Ext between typical modules, the typical decomposition, and Matsuda's decomposition E ≅ ⊕ F_i ⊗ U_i.
- p-adic Differential Equations (kedlaya-pde-book), Lemma 20.4.1, Proposition 20.4.2 and Corollary 20.4.3, pp. 332-333: Galois descent of H^0 and H^1, the perfect pairing for quasi-unipotent modules over the Robba ring (k perfect), and Matsuda's decomposition of indecomposable quasi-unipotent modules.

## 3. Breaks and ramification: Matsuda's theorem and Irr = Swan

Chapter 5 of the overview compares the highest break of a quasi-unipotent module (the irregularity of RD.1/highest-break) with the highest upper ramification break of its monodromy, by a direct computation on Artin-Schreier and tame covers and an induction on p-group images. The comparison of break decompositions follows, and with it the equality of the differential and Galois Swan conductors. The Galois side is ArithmeticGaloisRepresentations R01.3 (tier 7).

<a id="RD-2-highest-break-under-finite-etale-pullback"></a>

### Highest breaks under unipotent twists, tame covers and Artin-Schreier covers

`PadicDifferentialEquationsAndRigidCohomology:RD.2/highest-break-under-finite-etale-pullback` · lemma.

Let K be complete of characteristic 0 with residue characteristic p, and use the highest break of RD.1/highest-break (E has highest break ≤ β iff R(E, ρ) ≥ ρ^{β+1} for ρ close to 1). (a) A unipotent E has highest break 0. (b) If E has highest break ≤ α and F has highest break β > α, then E ⊗ F has highest break β. (c) Let f be the cover t ↦ t^n with p ∤ n. Then E has highest break ≥ β (resp. ≤ β) iff f^\*E has highest break ≥ nβ (resp. ≤ nβ), iff f_\*E has highest break ≥ β/n (resp. ≤ β/n). (d) Let a ∈ k^×, p ∤ n, and f the finite étale cover whose reduction is the Artin-Schreier extension u^p − u = a t^{−n}. If E has no trivial submodule and f^\*E is constant, then E has highest break n; the same holds for the reduction u^p − u = P(t^{−1}) with P a polynomial of degree n prime to p. (e) With f as in (d) and β ≥ n, E has highest break ≤ β iff f^\*E has highest break ≤ βp − n(p − 1).

Hypotheses and conventions:

- In (d) and (e) one may enlarge K (by π\_0 with π\_0^{p−1} = −p and an n-th root of a); breaks do not change under finite extensions of K (RD.1/generic-radius-basic-properties (f)).
- βp − n(p − 1) is the upper numbering of the break β over the Artin-Schreier extension with break n (Herbrand function, Kedlaya overview Example 2.1.10).

Proof route:

1. Generic discs: for p ∤ n the map z ↦ z^n identifies |t − t_ρ^{1/n}| < rρ^{1/n} with |t − t_ρ| < rρ; for z ↦ z^p it identifies |t − t_ρ^{1/p}| < rpρ^{1/p} with |t − t_ρ| < rρ when r ≤ p^{−p/(p−1)}; for the Artin-Schreier cover (1 + π\_0 u)^p = 1 + pπ\_0 t^{−1} it identifies |u^{−1} − u_ρ^{−1}| < rρ^{(2−p)/p} with |t − t_ρ| < rρ (Kedlaya overview Lemmas 5.3.1-5.3.3); with RD.1/dwork-transfer-generic-disc this translates convergence of horizontal sections around generic points.
2. (a) A unipotent basis gives ∇ with nilpotent matrix in dt/t and log(t/t_ρ) converges on |t − t_ρ| < ρ (overview Lemma 5.4.4, using RD.2/unipotent-iff-nilpotent-residue). (b) Horizontal sections of E ⊗ F are products of those of E and F (Lemma 5.4.5). (c) Disc comparison for z ↦ z^n (Lemma 5.4.6).
3. (d) After enlarging K, E is a nontrivial rank-one summand of f_\*f^\*O, generated by (1 + π\_0 u)^i, with ∇v = −π\_0 n b t^{−n−1}(1 + pπ\_0 b t^{−n})^{−1} v ⊗ dt, isomorphic near the boundary to ∇w = −π\_0 n b t^{−n−1} w ⊗ dt, whose horizontal section exp(−π\_0 b(t^{−n} − t_ρ^{−n})) converges exactly on |t − t_ρ| < ρ^{n+1} (Lemma 5.4.7; compare RD.1/dwork-exponential-module for n = 1); the polynomial case by induction on degree with (b) (Lemma 5.4.9).
4. (e) The case n = 1 from the Artin-Schreier disc comparison; general n by composing with t ↦ t^n and (c), using that E is a direct summand of g^\*g_\*E and of f_\*f^\*E through trace and adjunction maps (Lemma 5.4.8).

Acceptance:

- The trivial module has highest break 0, and so does the unipotent module of SFR Example 7.2.6.
- Dwork's module M_f with f = t^{−1} has highest break 1 (n = 1 in (d)); with f = t^{−n}, p ∤ n, highest break n.
- Tame: the Kummer module ∇v = (1/2) v ⊗ dt/t (p odd) becomes trivial under t ↦ t^2 and has highest break 0 = 2·0, consistent with (c).
- (e) with n = 1, β = 1: the Artin-Schreier pullback of M_{t^{−1}} is trivial, of break 0 ≤ 1·p − 1·(p − 1) = 1.

Prerequisites: `PadicDifferentialEquationsAndRigidCohomology:RD.1/highest-break`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/dwork-transfer-generic-disc`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/generic-radius-basic-properties`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/dwork-exponential-module`, `PadicDifferentialEquationsAndRigidCohomology:RD.2/unipotent-iff-nilpotent-residue`, `PadicDifferentialEquationsAndRigidCohomology:RD.2/finite-etale-extension-of-bounded-robba-ring`, `PadicDifferentialEquationsAndRigidCohomology:RD.2/unramified-extensions-of-amice-rings`, `ArithmeticGaloisRepresentations:R01.3/artin-schreier-break`.

Sources:

- Local monodromy of p-adic differential equations: an overview (kedlaya-local-monodromy-overview), Lemmas 5.3.1, 5.3.2 and 5.3.3, pp. 30-32: How discs around generic points transform under z ↦ z^n (p ∤ n), z ↦ z^p and the Artin-Schreier cover.
- Local monodromy of p-adic differential equations: an overview (kedlaya-local-monodromy-overview), Definition 5.4.1 and Lemmas 5.4.4-5.4.9, pp. 32-35: Highest breaks via R(E, ρ) ≥ ρ^{β+1}; unipotent modules have break 0; tensor products; tame covers multiply breaks by n; Artin-Schreier rank-one modules have break n; breaks over an Artin-Schreier cover become βp − n(p − 1).
- Local monodromy of p-adic differential equations: an overview (kedlaya-local-monodromy-overview), Example 2.1.10, p. 6: An Artin-Schreier extension u^p − u = P(t^{−1}) with deg P = d prime to p has the single break d, and the Herbrand function is m for m ≤ d and d + (m − d)/p beyond.

<a id="RD-2-matsuda-highest-break-theorem"></a>

### The highest break of a quasi-unipotent ∇-module equals the highest ramification break of its monodromy representation

`PadicDifferentialEquationsAndRigidCohomology:RD.2/matsuda-highest-break-theorem` · theorem.

Suppose k is perfect. Let E be a quasi-unipotent ∇-module over R_K and τ its monodromy representation restricted to the inertia group I of Gal(k((t))^sep/k((t))) (RD.2/monodromy-representation-equivalence; I acts through a finite quotient). If the highest upper-numbering break of τ (in the sense of ArithmeticGaloisRepresentations:R01.3/breaks-and-swan-conductor, with G^0 = I and G^{0+} = P the wild inertia) is β, then E has highest break β (RD.1/highest-break); in particular E has highest break 0 iff P acts trivially, i.e. iff τ is tame.

Hypotheses and conventions:

- k perfect, so the ramification filtration of Gal(k((t))^sep/k((t))) is the classical one (Serre's numbering, G_0 inertia, G_1 wild); the finite-residue-field case is supplied by Tau Ceti through R01.3 and the perfect infinite case rests on R01.3's recorded ramification gap.
- β ∈ Q_{≥0}; for nonabelian images β need not be an integer, and β ∈ (0, 1) occurs after tame base change (Kedlaya overview Lemma 5.4.6).

Proof route:

1. Enlarge k to an algebraic closure (breaks and the inertia representation are unchanged). By RD.2/highest-break-under-finite-etale-pullback (c) pass to a tame cover so that the image H of τ is a p-group; by RD.2/matsuda-decomposition and parts (a), (b) of that lemma reduce to E quasi-constant and irreducible (Kedlaya overview, proof of Theorem 5.4.10).
2. Induct on |H| and then on the lowest upper break i of H, an integer by Hasse-Arf for the abelian quotient (ArithmeticGaloisRepresentations:R01.3/conductor-of-a-character). Base case |H| = p: Lemma 5.4.9 = part (d) of RD.2/highest-break-under-finite-etale-pullback with the break of ArithmeticGaloisRepresentations:R01.3/artin-schreier-break.
3. Inductive step: choose a maximal subgroup N ⊇ H^i, normal of index p, fixing an Artin-Schreier extension u^p − u = Σ\_{j≤i} c_j t^{−j} (p ∤ j); over it either E becomes constant (break i by part (d)) or the highest break of τ becomes βp − (p − 1)i (Herbrand function, ArithmeticGaloisRepresentations:R01.3/upper-numbering-of-an-open-subgroup) with a smaller lowest break, so the induction hypothesis gives the break of f^\*E and part (e) gives β for E; β = i is excluded because H would then be elementary abelian, hence of order p.

Acceptance:

- Dwork's module M_f, f = t^{−n} (p ∤ n): its monodromy is the Artin-Schreier character of u^p − u = t^{−n}, of upper break n, and its highest break is n.
- A tamely ramified character of order m prime to p (Kummer module ∇v = (a/m) v ⊗ dt/t): break 0 on both sides.
- A representation with highest upper break 1/2 (Artin-Schreier over t^{1/2}, p odd): the module has highest break 1/2 (part (c) with n = 2).

Prerequisites: `PadicDifferentialEquationsAndRigidCohomology:RD.2/highest-break-under-finite-etale-pullback`, `PadicDifferentialEquationsAndRigidCohomology:RD.2/matsuda-decomposition`, `PadicDifferentialEquationsAndRigidCohomology:RD.2/monodromy-representation-equivalence`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/highest-break`, `ArithmeticGaloisRepresentations:R01.3/breaks-and-swan-conductor`, `ArithmeticGaloisRepresentations:R01.3/upper-numbering-of-an-open-subgroup`, `ArithmeticGaloisRepresentations:R01.3/artin-schreier-break`, `ArithmeticGaloisRepresentations:R01.3/conductor-of-a-character`, `ArithmeticGaloisRepresentations:R01.3/conductor-tame-base-change`.

Sources:

- Local monodromy of p-adic differential equations: an overview (kedlaya-local-monodromy-overview), Theorem 5.4.10 and proof, pp. 35-36: For k perfect, a quasi-unipotent E whose monodromy representation has highest break β has highest break β; proof by reduction to p-group images and double induction using Lemmas 5.4.4-5.4.9.
- Local monodromy of p-adic differential equations: an overview (kedlaya-local-monodromy-overview), Remark 5.4.13, p. 36: Attribution: for K discretely valued this is Matsuda's Corollary 8.8; related results of Tsuzuki (Theorem 7.2.2) and Crew (Theorem 5.4), and André's Tannakian Complement 7.1.2.
- Local monodromy of p-adic differential equations: an overview (kedlaya-local-monodromy-overview), Proposition 2.3.6, p. 8: Hasse-Arf: breaks of abelian extensions are integers, used for the lowest break of the p-group image.

<a id="RD-2-irregularity-equals-swan-conductor"></a>

### Break decompositions match ramification: the differential Swan conductor equals the Swan conductor of the monodromy

`PadicDifferentialEquationsAndRigidCohomology:RD.2/irregularity-equals-swan-conductor` · theorem · planet: *Irregularity equals Swan conductor*.

Suppose k is perfect and E is a quasi-unipotent ∇-module over R_K (for instance one admitting a Frobenius structure, by RD.2/quasi-unipotence-and-local-monodromy-statement), with monodromy representation V restricted to inertia. (a) The monodromy equivalence (RD.2/monodromy-representation-equivalence) carries the break decomposition E = ⊕\_b E_b of RD.1/break-decomposition to the break decomposition V = ⊕\_λ V(λ) of ArithmeticGaloisRepresentations:R01.3/breaks-and-swan-conductor: E_b corresponds to V(b). (b) Hence the break multisets agree and the differential Swan conductor (irregularity) equals the Galois Swan conductor: Swan(E) (RD.1/differential-swan-conductor) = Sw(V). In particular Swan(E) is a nonnegative integer (Hasse-Arf, R01.3/hasse-arf-integrality), which recovers RD.1/swan-conductor-integrality for quasi-unipotent modules. (c) For a representation V of G = Gal(k((t))^sep/k((t))) with finite local monodromy and D†(V) as in RD.2/galois-representation-to-differential-module, for ρ < 1 close to 1 the intrinsic generic radius is IR(D†(V) ⊗ F_ρ) = ρ^{b} (equivalently R(D†(V) ⊗ F_ρ) = ρ^{b+1}) where b is the highest upper break of V|\_I, and the intrinsic subsidiary radii are ρ^{b_1}, …, ρ^{b_n}, the b_j being the highest breaks of the constituents V_j of V|\_I counted with multiplicity dim V_j.

Hypotheses and conventions:

- k perfect (as in R01.3, tier (P) of which rests on its recorded ramification gap; tier (F) for finite k is supplied by Tau Ceti).
- Normalisation: breaks are Serre's upper numbering (G^0 = inertia, G^{0+} = wild inertia), and IR = R/ρ is the intrinsic radius of RD.1/generic-radius; Kedlaya's book (Theorem 19.4.1, Corollary 19.4.2) prints R = ρ^b with b = max{i ≥ 1 : G^i ⊄ ker τ}, which must be read with IR in place of R and with b allowed in [0, ∞) (source issue recorded in this packet).

Proof route:

1. (a) By RD.2/matsuda-decomposition and the Galois-theoretic break decomposition, it suffices to show that an indecomposable E with monodromy of uniform break λ has uniform break λ; apply RD.2/matsuda-highest-break-theorem to E and to all its subquotients, which pins down the generic radii of every Jordan-Hölder constituent (Kedlaya overview Corollary 5.4.11 and Remark 5.4.12).
2. (b) Sum the breaks with multiplicities on both sides; Sw(V) = Σ\_λ λ dim V(λ) by definition (R01.3/breaks-and-swan-conductor) and Swan(E) = Σ\_b b·rank E_b (RD.1/differential-swan-conductor).
3. (c) D†(V) ⊗ R is quasi-constant with monodromy V|\_I (RD.2/galois-representation-to-differential-module (e)); apply (a) and the definition of intrinsic subsidiary radii (RD.1/generic-radius).

Acceptance:

- Dwork's module M_{t^{−1}}: Swan = 1 = Sw of the Artin-Schreier character (R01.3/artin-schreier-swan-conductor: Sw = m for u^p − u = u_0 with v(u_0) = −m); IR = ρ, R = ρ^2 near the boundary (RD.1/dwork-exponential-module).
- A tamely ramified or unramified V: all breaks 0, Swan(E) = Sw(V) = 0, IR(D†(V) ⊗ F_ρ) = 1.
- Integrality: for the induced representation from a ramified Artin-Schreier extension of break 1 over the tame extension t^{1/2} (p odd), V is two-dimensional with upper break 1/2 and Sw(V) = 2·(1/2) = 1, an integer, matching the differential Swan conductor of the rank-two module.

Prerequisites: `PadicDifferentialEquationsAndRigidCohomology:RD.2/matsuda-highest-break-theorem`, `PadicDifferentialEquationsAndRigidCohomology:RD.2/matsuda-decomposition`, `PadicDifferentialEquationsAndRigidCohomology:RD.2/galois-representation-to-differential-module`, `PadicDifferentialEquationsAndRigidCohomology:RD.2/monodromy-representation-equivalence`, `PadicDifferentialEquationsAndRigidCohomology:RD.2/quasi-unipotence-and-local-monodromy-statement`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/break-decomposition`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/differential-swan-conductor`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/generic-radius`, `ArithmeticGaloisRepresentations:R01.3/breaks-and-swan-conductor`, `ArithmeticGaloisRepresentations:R01.3/hasse-arf-integrality`, `ArithmeticGaloisRepresentations:R01.3/swan-additive`.

Sources:

- Local monodromy of p-adic differential equations: an overview (kedlaya-local-monodromy-overview), Corollary 5.4.11, Remarks 5.4.12-5.4.13, p. 36: The monodromy equivalence commutes with break decompositions; attribution to Matsuda (Corollary 8.8), Tsuzuki (Theorem 7.2.2) and Crew (Theorem 5.4).
- p-adic Differential Equations (kedlaya-pde-book), Theorem 19.4.1, Corollary 19.4.2, Remark 19.4.4, pp. 321-322: For finite local monodromy, the generic radius of D†(V) ⊗ F_ρ near 1 is computed from the highest upper break, the subsidiary radii from the constituents, and integrality of the product of subsidiary radii is the Hasse-Arf theorem (stated without proof; the radius must be read as the intrinsic radius).
- Filtrations de type Hasse-Arf et monodromie p-adique (andre-hasse-arf), Complément 7.1.2 and its proof, p. 24: The isomorphism G^{>0} ≅ P identifies the p-adic slope filtration with the upper ramification filtration (Matsuda-Tsuzuki), proved by comparing Swan conductor and p-adic irregularity on K_0(Rep I) via Artin induction and the rank-one computation.

## 4. André's Tannakian form

André states the local monodromy theorem as a computation of a Tannakian group: modules with Frobenius structure over the Robba ring with algebraic constants form a Tannakian category with group I × G_a, whose wild part is P (Xu-Zhu §2.9.1 recall it in this form). Over K̄ every quasi-unipotent module carries a Frobenius structure, so the category is that of quasi-unipotent modules, and the first pass's monodromy equivalence identifies it with representations of I × G_a. Tau Ceti's comodule reconstruction then gives the group without a general reconstruction theorem.

<a id="RD-2-quasi-unipotent-modules-admit-frobenius-structures"></a>

### Over algebraic coefficients every quasi-unipotent ∇-module carries a Frobenius structure at a finite level

`PadicDifferentialEquationsAndRigidCohomology:RD.2/quasi-unipotent-modules-admit-frobenius-structures` · lemma.

Let K be complete for a discrete valuation, of characteristic 0, with perfect residue field k of characteristic p, K̄ an algebraic closure with residue field k̄, and R_{K̄} := R_K ⊗\_K K̄ = ∪\_{K'} R_{K'} (union over finite extensions K'/K inside K̄) with the derivation d = d/dt; I = Gal(k̄((t))^sep/k̄((t))), the inertia group of k((t)), and P ⊆ I its wild inertia. Let K_0 = W(k)[1/p] ⊆ K. Say that an object M of MC(R_{K̄}/K̄) admits a Frobenius structure at finite level if there are a finite extension K_1 of K_0 inside K̄, a Frobenius lift σ\_1 of K_1 (a continuous endomorphism lifting x ↦ x^{p^h} on the residue field, for some h ≥ 1), a (σ\_1,∇)-module M_1 over R_{K_1} for the standard lift t ↦ t^{p^h} (RD.1/frobenius-differential-module), and an isomorphism M_1 ⊗ R_{K̄} ≅ M of ∇-modules. (a) Every quasi-constant ∇-module M over some R_{K'} (K'/K finite) becomes, over R_{K̄}, isomorphic to M_1 ⊗ R_{K̄} with M_1 a (σ\_1,∇)-module over R_{K_1}, where F is a finite extension of Q_p inside K̄, k' the compositum of k and the residue field F_{p^f} of F, K_1 = F·W(k')[1/p] and σ\_1 = id_F ⊗ φ\_W^h (φ\_W the Witt-vector Frobenius, f | h). (b) Every unipotent ∇-module over R_{K̄} is the base change of a module over R_{K_0} in Jordan form, which carries a Frobenius structure for every Frobenius lift of K_0. (c) Hence every quasi-unipotent ∇-module over R_{K̄} admits a Frobenius structure at finite level; in the notation of RD.2/differential-modules-with-algebraic-constants, MC^qu(R_{K̄}/K̄) ⊆ MCF(R_{K̄}/K̄). The existence of such a structure does not depend on the choice of the lift t ↦ t^{p^h} (RD.1/change-of-frobenius-for-frobenius-structures).

Hypotheses and conventions:

- k perfect, so K is a finite totally ramified extension of K_0 = W(k)[1/p] and K̄ is also an algebraic closure of K_0. With F^ur the maximal unramified subextension of F/Q_p, F^ur ⊆ W(k')[1/p], and F·W(k')[1/p] = F ⊗\_{F^ur} W(k')[1/p] is a field (F/F^ur totally ramified, W(k')[1/p]/F^ur unramified); id_F ⊗ φ\_W^h is well defined because φ\_W^h fixes F^ur when f | h.
- Working at a finite, discretely valued level is what makes the p-adic local monodromy theorem applicable; André's definition (§3.4) asks instead for an isomorphism φ\_h^\*M ≅ M over R_{K̄} for an automorphism σ of K̄, which contains the present notion (σ\_1 extends to such a σ).

Proof route:

1. (a) After a finite extension of the constants, H^0(M ⊗ R^L) is a linear representation of the finite group Gal(L/k((t))) (RD.2/quasi-constant-modules-are-semilinear-representations), which can be defined over a finite extension F of Q_p inside K̄ with a stable O_F-lattice T (Kedlaya, p-adic Differential Equations, proof of Proposition 20.1.3, p. 327). The equivalence of RD.2/quasi-constant-modules-are-semilinear-representations over K_1 = F·W(k')[1/p] produces M_1 with M_1 ⊗ R_{K̄} ≅ M ⊗ R_{K̄}; declaring T fixed defines a Frobenius structure for σ\_1 = id_F ⊗ φ\_W^h on M_1 ⊗ R^L, which commutes with the Galois action and descends to M_1.
2. (b) A unipotent M is V ⊗ R with ∇ = d + N dt/t, N nilpotent (RD.2/unipotent-iff-nilpotent-residue); after a change of basis N is a Jordan matrix with entries 0 and 1, so M is defined over R_{K_0}; the pull-back along t ↦ t^{q} (q = p^h) has residue qN, conjugate to N by a diagonal matrix with entries powers of q, which gives the Frobenius structure.
3. (c) By RD.2/matsuda-decomposition a quasi-unipotent M is ⊕ F_i ⊗ U_i; take K_1 the compositum of the fields of (a) for the F_i and h a common multiple of the orders (a structure of order h induces one of every multiple order by iteration); tensor products and direct sums of the structures of (a) and (b) give one on M at the level R_{K_1}.

Acceptance:

- (R_{K_0}, d) with the standard lift: a Frobenius structure for every h.
- The Kummer module ∇v = (1/m) v ⊗ dt/t with p ∤ m: quasi-constant (trivial after t ↦ t^{1/m}); for h with m | p^h − 1, the map 1 ⊗ v ↦ t^{(p^h − 1)/m}·v is a horizontal isomorphism φ\_h^\*M ≅ M (the pulled-back connection is (p^h/m) dt/t), a Frobenius structure of order h already over R_{Q_p}.
- Dwork's module M_{t^{−1}} is defined over R_{Q_p(π\_0)} (π\_0^{p−1} = −p) with the Frobenius structure exp(π\_0(t^{−1} − t^{−p})) for σ\_1 = id (RD.1/dwork-exponential-module).

Prerequisites: `PadicDifferentialEquationsAndRigidCohomology:RD.2/quasi-constant-modules-are-semilinear-representations`, `PadicDifferentialEquationsAndRigidCohomology:RD.2/matsuda-decomposition`, `PadicDifferentialEquationsAndRigidCohomology:RD.2/unipotent-iff-nilpotent-residue`, `PadicDifferentialEquationsAndRigidCohomology:RD.2/quasi-unipotent-differential-module`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/frobenius-differential-module`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/change-of-frobenius-for-frobenius-structures`.

Sources:

- p-adic Differential Equations (kedlaya-pde-book), Proposition 20.1.3 and proof, p. 327: A quasi-unipotent module is solvable at 1: after enlarging K, the horizontal sections over R^L form a representation of a finite group with a stable lattice over a finite extension of Q_p, and declaring it fixed gives a Frobenius structure for an absolute Frobenius lift fixing that field.
- Filtrations de type Hasse-Arf et monodromie p-adique (andre-hasse-arf), §3.4, p. 11: Defines Frobenius structures of order h on objects of MC(R_K̄/K̄) via φ\_h (z ↦ z^{p^h}, σ lifting the p^h-power map) and MCF as the objects admitting one, noting that only existence matters.
- Local monodromy of p-adic differential equations: an overview (kedlaya-local-monodromy-overview), Remark 4.7.7, p. 27: For k algebraically closed the monodromy-representation description of quasi-unipotent modules is essentially André's Théorème 7.1.1, i.e. MCF is described by all permissible representations.

<a id="RD-2-differential-modules-with-algebraic-constants"></a>

### The Tannakian categories MC(R_K̄/K̄) ⊇ MCS ⊇ MCF of differential modules over the Robba ring with algebraic constants

`PadicDifferentialEquationsAndRigidCohomology:RD.2/differential-modules-with-algebraic-constants` · construction.

Let K be complete for a discrete valuation, of characteristic 0, with perfect residue field k of characteristic p, K̄ an algebraic closure with residue field k̄, and R_{K̄} := R_K ⊗\_K K̄ = ∪\_{K'} R_{K'} (union over finite extensions K'/K inside K̄) with the derivation d = d/dt; I = Gal(k̄((t))^sep/k̄((t))), the inertia group of k((t)), and P ⊆ I its wild inertia. (a) MC(R_{K̄}/K̄) is the category of finitely presented R_{K̄}-modules with a connection ∇ : M → M ⊗ Ω^1 (Leibniz rule for d); every object is finite free and is the base change of an object over R_{K'} for some finite K'/K, and Hom-spaces are the colimits of those over the R_{K'}; with ⊗ over R_{K̄}, duals and the unit (R_{K̄}, d) it is a K̄-linear abelian rigid tensor category with End(1) = K̄. (b) Full subcategories: MC^uni of unipotent objects (successive extensions of the unit), MC^qu of quasi-unipotent objects, MCS of objects solvable at 1 (RD.1/solvable-at-boundary), and MCF of objects admitting a Frobenius structure at finite level (RD.2/quasi-unipotent-modules-admit-frobenius-structures); only the existence of a Frobenius structure is recorded, not the structure itself. (c) MC^uni ≃ Vec^nil_{K̄} (finite-dimensional K̄-spaces with a nilpotent endomorphism) via (V, N) ↦ (V ⊗\_{K̄} R_{K̄}, d + N dt/t), so the Tannakian group of MC^uni is G_a. (d) MCF = MC^qu ⊆ MCS, and MCF is a Tannakian subcategory stable under subquotients and extensions. (e) The logarithmic fibre functor ω : MCF → Vec_{K̄}, ω(M) = colim_L H^0(M ⊗ R^L_{K̄,log}) (L finite separable over k̄((t)), R^L_log = R^L[log t] as in RD.2/log-robba-ring), is an exact faithful tensor functor, and ω(M) carries commuting actions of I (through the Galois action on R^L_log, fixing log t) and of G_a (c ∈ K̄ acting by log t ↦ log t + c), with dim ω(M) = rank M.

Hypotheses and conventions:

- K discretely valued with perfect residue field; the colimit over K' ⊆ K̄ is taken inside a fixed algebraic closure, so R_{K̄} is an integral domain (K is algebraically closed in R_K).
- (d) uses the p-adic local monodromy theorem (RD.2/quasi-unipotence-and-local-monodromy-statement) at the finite level K_1 for MCF ⊆ MC^qu; André obtains the Tannakian property from Christol-Mebkhout's theory instead. With André's definition (an isomorphism φ\_h^\*M ≅ M over R_{K̄} for an automorphism σ of K̄) the category contains this one, and coincides with it by André's Théorème 7.1.1, which shows that all its objects are quasi-unipotent; that comparison is cited, not planned.

Uses:

- André, Filtrations de type Hasse-Arf, Théorème 7.1.1: MCF(R_K̄/K̄) is the Tannakian category whose group is computed as I × G_a
- Xu-Zhu, Bessel F-isocrystals, §2.9 and §4.5: restriction of overconvergent F-isocrystals to a boundary point lands in MCF(R/K̄), and the local monodromy group is read there
- RD.6 (global monodromy of overconvergent F-isocrystals): local monodromy groups at the boundary points of a curve are the Tannakian groups of these local categories

API:

- `RobbaAlgConst` (constructor): R_{K̄} = R_K ⊗\_K K̄ with the derivation d.
- `DiffModCat` (data): MC(R_{K̄}/K̄), the K̄-linear rigid abelian tensor category of finitely presented R_{K̄}-modules with connection.
- `DiffModCat.descends` (characterisation): Every object and morphism is defined over R_{K'} for some finite K'/K.
- `MCS` (data): The full subcategory of objects solvable at 1.
- `MCF` (data): The full subcategory of objects admitting a Frobenius structure at finite level (a (σ\_1,∇)-module over some R_{K_1}, K_1/W(k)[1/p] finite).
- `MCF.eq_quasiUnipotent` (characterisation): MCF = MC^qu.
- `MCF.subset_MCS` (relation): MCF ⊆ MCS.
- `MCF.closed` (instance): MCF is closed under subquotients, extensions, tensor products and duals.
- `unipotentEquiv` (equivalence): Vec^nil_{K̄} ≃ MC^uni(R_{K̄}/K̄).
- `logFiberFunctor` (constructor): ω : MCF → Vec_{K̄}, ω(M) = colim_L H^0(M ⊗ R^L_{K̄,log}).
- `logFiberFunctor.monoidal` (structure): ω is an exact faithful tensor functor with dim ω(M) = rank M.
- `logFiberFunctor.action` (structure): ω(M) carries commuting actions of I and of G_a, natural in M.

Unit tests:

- `MCF.unit` (degenerate): The unit object (R_{K̄}, d) lies in MCF, with ω(1) = K̄ and End(1) = K̄.
- `MCF.unipotent_equiv` (compatibility): The functor (V, N) ↦ (V ⊗ R_{K̄}, d + N dt/t) is an equivalence Vec^nil_{K̄} ≃ MC^uni(R_{K̄}/K̄), and ω of its image is V with c ∈ G_a acting by exp(cN) up to sign.
- `MCF.eq_quasiUnipotent` (characterisation): An object of MC(R_{K̄}/K̄) lies in MCF iff it is quasi-unipotent.
- `MCF.kummer_mem` (computation): The Kummer module ∇v = (1/m) v ⊗ dt/t (p ∤ m) lies in MCF and ω of it is the character of I through its tame quotient of order m.
- `MCF.not_irrational_exponent` (non-example): For λ ∈ Z_p \\ Q the module ∇e = λ e ⊗ dt/t is solvable at 1 (in MCS) but not in MCF.
- `MCF.not_unsolvable` (non-example): The module ∇e = e ⊗ dt is not in MCS, hence not in MCF.

Proof route:

1. (a) Finitely presented modules with connection over a Robba ring are free (RD.2/finitely-presented-differential-module-is-free); a presentation involves finitely many coefficients, hence descends to some R_{K'}; rigidity and End(1) = ker(d on R_{K̄}) = K̄ (RD.2/robba-ring-antiderivative).
2. (c) Base change of RD.2/unipotent-iff-nilpotent-residue to K̄ (André §3.4; Xu-Zhu §2.9.1, p. 23); Vec^nil_{K̄} is the category of representations of G_a (c acting by exp(cN)).
3. (d) MCF ⊆ MC^qu by the p-adic local monodromy theorem applied to M_1 over R_{K_1} (K_1 discretely valued with Frobenius lift σ\_1; quasi-unipotence is preserved by base change to R_{K̄}); MC^qu ⊆ MCF by RD.2/quasi-unipotent-modules-admit-frobenius-structures; MC^qu is stable under subquotients, tensor products, duals and extensions (Kedlaya overview Definition 4.6.1); MCF ⊆ MCS by Dwork's argument (RD.1/frobenius-structure-forces-solvability).
4. (e) By the logarithmic form of the local monodromy theorem (RD.2/logarithmic-form-of-local-monodromy) and RD.2/solution-space-phi-n-module, for L large H^0(M ⊗ R^L_log) has dimension rank M over the constants and the transition maps are isomorphisms after extending constants; exactness and the tensor property follow from the comparison isomorphism H^0(M ⊗ R^L_log) ⊗ R^L_log ≅ M ⊗ R^L_log.

Acceptance:

- The unit (R_{K̄}, d) ↦ ω = K̄ with trivial I × G_a action.
- U_2 = (K̄², N = [[0,1],[0,0]]) ↦ ω(U_2) = K̄² with G_a acting by [[1,c],[0,1]] (up to the sign convention for N) and I trivially.
- Non-example for MCS ⊆ MCF: the rank-one module ∇e = λ e ⊗ dt/t with λ ∈ Z_p not in Q (Kedlaya, Example 9.5.2: solvable at 1) is in MCS but not quasi-unipotent, hence not in MCF.
- Non-example for MC ⊆ MCS: ∇e = e ⊗ dt is not solvable (RD.2/frobenius-hypothesis-is-necessary).

Prerequisites: `PadicDifferentialEquationsAndRigidCohomology:RD.2/quasi-unipotent-modules-admit-frobenius-structures`, `PadicDifferentialEquationsAndRigidCohomology:RD.2/quasi-unipotence-and-local-monodromy-statement`, `PadicDifferentialEquationsAndRigidCohomology:RD.2/unipotent-iff-nilpotent-residue`, `PadicDifferentialEquationsAndRigidCohomology:RD.2/quasi-unipotent-differential-module`, `PadicDifferentialEquationsAndRigidCohomology:RD.2/finitely-presented-differential-module-is-free`, `PadicDifferentialEquationsAndRigidCohomology:RD.2/robba-ring-antiderivative`, `PadicDifferentialEquationsAndRigidCohomology:RD.2/log-robba-ring`, `PadicDifferentialEquationsAndRigidCohomology:RD.2/logarithmic-form-of-local-monodromy`, `PadicDifferentialEquationsAndRigidCohomology:RD.2/solution-space-phi-n-module`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/solvable-at-boundary`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/frobenius-structure-forces-solvability`.

Sources:

- Filtrations de type Hasse-Arf et monodromie p-adique (andre-hasse-arf), §3.4, pp. 10-11: MC(R/K) and MCS(R/K) over a Robba-type ring, base change to K̄, the definition of Frobenius structures of order h and of MCF(R_K̄/K̄) as the objects admitting one, its Tannakian property (Christol-Mebkhout) and MCF ⊆ MCS (Dwork).
- Bessel F-isocrystals for reductive groups (xu-zhu-2022), §2.9.1, pp. 23-24: MC(R_K/K), MC(R/K̄) with R = R_K ⊗\_K K̄, the unipotent subcategory equivalent to Vec^nil_{K̄} with Tannakian group G_a, and MCF(R/K̄) as the full subcategory of objects admitting a Frobenius structure, with Tannakian group 𝒢.
- Local monodromy of p-adic differential equations: an overview (kedlaya-local-monodromy-overview), Definitions 4.6.1, 4.7.1, 4.7.2, 4.7.5, Lemma 4.7.4, pp. 24-27: Quasi-unipotent modules, the logarithmic sheaf O_log, the dimension of H^0_log and the monodromy representation of G_log = Gal × K.

<a id="RD-2-unipotent-solutions-and-residues"></a>

### Solutions of a unipotent ∇-module on the open unit disc: Sol(M) ≅ (coker N)^∨

`PadicDifferentialEquationsAndRigidCohomology:RD.2/unipotent-solutions-and-residues` · lemma.

Let K{x} be the ring of analytic functions on the open unit disc |x| < 1 (Σ a_n x^n with |a_n| ρ^n → 0 for every ρ < 1), with the logarithmic derivation d : K{x} → Ω^1_{K{x}}(log) = K{x}·dx/x, f ↦ x f'(x) dx/x. Let M be a unipotent ∇-module over R_K corresponding to (V, N) (RD.2/unipotent-iff-nilpotent-residue), extended to the log-∇-module M_log = V ⊗ K{x} with ∇(v) = Nv ⊗ dx/x on the disc. Then the solution space Sol(M) := Hom_{K{x}}((M_log, ∇), (K{x}, d))^{∇=0} of horizontal homomorphisms is canonically isomorphic to (coker N)^∨ = ker(N^∨ on V^∨): every horizontal φ is constant, φ(v) = λ(v) with λ ∈ V^∨ and λ∘N = 0. If ∇ is defined by a differential operator D (M = K{x}[∂]/K{x}[∂]D), Sol(M) is the space of solutions of D in K{x}. If M carries a Frobenius structure extending to the disc, Sol(M) and coker N are (φ, N)-modules with N φ = q φ N, compatibly with the duality.

Hypotheses and conventions:

- K complete of characteristic 0; the residue N is nilpotent (unipotent M).
- Xu-Zhu (2.9.2.2) print a canonical isomorphism Coker(N) ≅ Sol(M); the solution space is the dual of the cokernel (source issue recorded in this packet). Dimensions agree, which is all that their subsequent argument (proof of Proposition 5.1.3) requires.

Proof route:

1. Write φ(v) = Σ\_{n≥0} φ\_n(v) x^n with φ\_n ∈ V^∨. Horizontality φ(Nv) = x d/dx φ(v) gives φ\_n∘N = n φ\_n for every n; for n ≥ 1, N − n is invertible (N nilpotent), so φ\_n = 0, and for n = 0 the condition is φ\_0∘N = 0 (Xu-Zhu §2.9.2, p. 24, in corrected form).
2. Conversely each λ ∈ V^∨ with λ∘N = 0 defines a horizontal homomorphism; so Sol(M) ≅ (V/NV)^∨.
3. For M = K{x}[∂]/K{x}[∂]D, a horizontal homomorphism is determined by the image y of the class of 1, which satisfies D(y) = 0.
4. Frobenius: a Frobenius structure extending to the disc is constant on a horizontal basis (Kedlaya, p-adic Differential Equations, Proposition 17.5.1), giving φ on V with N φ = q φ N (Remark 17.1.2); it induces the dual structure on Sol(M).

Acceptance:

- M = (R_K, d): V = K, N = 0, Sol(M) = K (the constant functions).
- M = U_2 (N e_2 = e_1, N e_1 = 0): coker N is spanned by the class of e_2, and Sol(M) is spanned by the functional e_1^∨ ↦ 0, e_2^∨-dual: λ(e_1) = 0, λ(e_2) = 1; one-dimensional.
- The operator D = (x d/dx)^2: M ≅ U_2 and its solutions in K{x} are the constants (log x is not in K{x}), one-dimensional = dim coker N.

Prerequisites: `PadicDifferentialEquationsAndRigidCohomology:RD.2/unipotent-iff-nilpotent-residue`, `PadicDifferentialEquationsAndRigidCohomology:RD.2/unipotent-differential-module`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/frobenius-differential-module`.

Sources:

- Bessel F-isocrystals for reductive groups (xu-zhu-2022), §2.9.2, (2.9.2.1)-(2.9.2.2), p. 24: The ring K{x}, the log derivation, the log extension of a unipotent object and the identification of its solution space with the cokernel of N (printed without the dual).
- Local monodromy of p-adic differential equations: an overview (kedlaya-local-monodromy-overview), Proposition 4.5.3, pp. 21-23: Unipotent ∇-modules on an annulus are equivalent to log-∇-modules on the open disc with nilpotent residue, overconvergent on the punctured disc, and to (V, N).
- p-adic Differential Equations (kedlaya-pde-book), Proposition 17.5.1 and Remark 17.1.2, pp. 292, 299: A Frobenius structure on the restriction to an annulus of a module with nilpotent singularity extends to the disc, and on the residue it gives N_0 A_0 = q A_0 φ(N_0).

<a id="RD-2-andre-local-monodromy-group"></a>

### André's local monodromy theorem: the Tannakian group of MCF(R_K̄/K̄) is I × G_a, with wild part P

`PadicDifferentialEquationsAndRigidCohomology:RD.2/andre-local-monodromy-group` · theorem · planet: *André's local monodromy group*.

Let K be complete for a discrete valuation, of characteristic 0, with perfect residue field k of characteristic p, K̄ an algebraic closure with residue field k̄, and R_{K̄} := R_K ⊗\_K K̄ = ∪\_{K'} R_{K'} (union over finite extensions K'/K inside K̄) with the derivation d = d/dt; I = Gal(k̄((t))^sep/k̄((t))), the inertia group of k((t)), and P ⊆ I its wild inertia. (a) The logarithmic fibre functor ω of RD.2/differential-modules-with-algebraic-constants (e) is an equivalence of K̄-linear rigid tensor categories from MCF(R_{K̄}/K̄) to the category Rep_{K̄}(I × G_a) of finite-dimensional K̄-vector spaces with a linear action of I whose kernel is open and a commuting nilpotent endomorphism N (c ∈ G_a acting by exp(cN)); equivalently, to the finite-dimensional comodules over the commutative Hopf algebra H = C^lc(I, K̄) ⊗ K̄[x] of locally constant functions on I tensored with the coordinate ring of G_a. (b) Consequently the Tannakian group Aut^⊗(ω) is I × G_a: for every commutative K̄-algebra A, Aut^⊗(ω ⊗ A) ≅ Hom_{K̄-alg}(H, A), naturally in A. (c) Under (a), an object has all p-adic slopes zero (highest break 0, RD.1/highest-break) iff P acts trivially on ω(M); more precisely the break filtration of MCF by p-adic slopes corresponds to the upper ramification filtration of P, so that 𝒢^{>0} ≅ P, and the irregularity of M equals the Swan conductor of ω(M)|\_I. (d) The tame factor: for M unipotent with (V, N) as in RD.2/unipotent-iff-nilpotent-residue, ω(M) = V with G_a acting through N (up to sign), H^0(M) = ker N = ω(M)^{I × G_a} and H^1(M) = coker N = the G_a-coinvariants of ω(M); the solution space of RD.2/unipotent-solutions-and-residues is the dual (coker N)^∨. (e) Every indecomposable object is isomorphic to F ⊗ U_m with F coming from an irreducible representation of I with finite image and U_m the m-dimensional indecomposable unipotent object; an object M with End(M)^{𝒢^{>0}} = K̄ (completely irreducible) is absolutely irreducible of rank a power of p.

Hypotheses and conventions:

- k perfect and K discretely valued (André, §7.1). Over K itself (not K̄) the same functor gives the semilinear form RD.2/monodromy-representation-equivalence.
- Tannakian reconstruction is used only in the form of Tau Ceti's comodule reconstruction (points of a commutative Hopf algebra = tensor automorphisms of scalar extension on its finite-dimensional comodules); no general reconstruction of a neutral Tannakian category is needed, because (a) identifies MCF with a comodule category explicitly.

Proof route:

1. (a) Over K̄ the coefficient Galois action is trivial (residue field k̄ algebraically closed), so the monodromy representation of RD.2/monodromy-representation-equivalence becomes a linear permissible representation of I × G_a, and that theorem (quasi-unipotent modules ≃ permissible representations, Kedlaya overview Theorem 4.7.6) applied over each R_{K'} and passed to the colimit gives the equivalence on MC^qu = MCF (RD.2/differential-modules-with-algebraic-constants (d)); tensor compatibility from the comparison isomorphism of RD.2/solution-space-phi-n-module.
2. Comodules over H: a finite-dimensional comodule over C^lc(I, K̄) is a representation of I with open kernel, and one over K̄[x] is a nilpotent endomorphism (characteristic 0), so Comod_fd(H) = Rep_{K̄}(I × G_a).
3. (b) Tau Ceti's reconstruction TauCeti.Tannaka.pointsFunctorIsoTensorAutFunctor (and its pointwise form TauCeti.Tannaka.fgPointTensorIsoEquiv) identifies Hom_{K̄-alg}(H, A) with the tensor automorphisms of scalar extension to A on finite-dimensional H-comodules; transport along (a).
4. (c) RD.2/matsuda-highest-break-theorem and RD.2/irregularity-equals-swan-conductor: the break decomposition corresponds to the Galois break decomposition, and break 0 means P acts trivially (G^{0+} = P); this is André's Complément 7.1.2.
5. (d) RD.2/unipotent-iff-nilpotent-residue (H^0 = ker N, H^1 = coker N) and the action log t ↦ log t + c on horizontal log-sections (Kedlaya overview Definition 4.7.5).
6. (e) Indecomposable representations of I × G_a with I acting through a finite group are W ⊗ (Jordan block) with W irreducible (André Corollaire 7.1.6; equivalently RD.2/matsuda-decomposition); for completely irreducible M, End of the restriction to 𝒢^{>0} = P is K̄, so M|\_P is irreducible and P is a pro-p group acting through a finite p-group, whose irreducible representations have p-power dimension (André Corollaire 7.1.8).

Acceptance:

- The unit object ↦ the trivial representation; U_m ↦ the m-dimensional Jordan block of G_a.
- Dwork's module M_{t^{−1}} ↦ the Artin-Schreier character of I of conductor 2 (Swan conductor 1), nontrivial on P.
- Kummer module ∇v = (1/m) v ⊗ dt/t (p ∤ m) ↦ a tame character of I of order m (trivial on P), irregularity 0.
- André Corollaire 7.1.3: if k is finite, the isomorphism classes of objects of MCF(R_{K̄}/K̄) form a countable set, because I has countably many open subgroups.

Prerequisites: `PadicDifferentialEquationsAndRigidCohomology:RD.2/differential-modules-with-algebraic-constants`, `PadicDifferentialEquationsAndRigidCohomology:RD.2/quasi-unipotent-modules-admit-frobenius-structures`, `PadicDifferentialEquationsAndRigidCohomology:RD.2/matsuda-highest-break-theorem`, `PadicDifferentialEquationsAndRigidCohomology:RD.2/irregularity-equals-swan-conductor`, `PadicDifferentialEquationsAndRigidCohomology:RD.2/matsuda-decomposition`, `PadicDifferentialEquationsAndRigidCohomology:RD.2/unipotent-solutions-and-residues`, `PadicDifferentialEquationsAndRigidCohomology:RD.2/monodromy-representation-equivalence`, `PadicDifferentialEquationsAndRigidCohomology:RD.2/solution-space-phi-n-module`, `PadicDifferentialEquationsAndRigidCohomology:RD.2/unipotent-iff-nilpotent-residue`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/highest-break`, `tauceti:TauCeti.Tannaka.pointsFunctorIsoTensorAutFunctor`, `tauceti:TauCeti.Tannaka.fgPointTensorIsoEquiv`.

Sources:

- Filtrations de type Hasse-Arf et monodromie p-adique (andre-hasse-arf), Théorème 7.1.1, Complément 7.1.2 and proof, Corollaires 7.1.3, 7.1.5-7.1.8, pp. 24-26: MCF(R_K̄/K̄) has Tannakian group I × G_a with 𝒢^{>0} = P; the p-adic slope filtration matches the upper ramification filtration (Matsuda-Tsuzuki); countability for finite k; log solutions after a finite étale extension; indecomposables M ⊗ U_m; completely irreducible objects have p-power rank.
- Bessel F-isocrystals for reductive groups (xu-zhu-2022), (2.9.1.1) and the following paragraph, p. 24: Restates André's isomorphisms 𝒢 ≅ I × G_a and 𝒢^{>0} ≅ P, the quasi-unipotence of MCF, finiteness of the action of P, and irregularity = Swan conductor of the I-representation on a fibre.
- Local monodromy of p-adic differential equations: an overview (kedlaya-local-monodromy-overview), Theorem 4.7.6 and Remark 4.7.7, p. 27: The monodromy representation is an equivalence from quasi-unipotent ∇-modules to permissible representations of G_log; for k algebraically closed this is essentially André's Théorème 7.1.1.

## 5. The theorem over finite étale extensions, and Berger's setting

The export to PadicHodgeTheory R06.3 needs the local monodromy theorem over Berger's ring B†\_rig,K, which is the finite étale extension R^L of a Robba ring attached to the field-of-norms extension (Berger, Lemme 3.13). Stating the theorem over every R^L, and for any ring presented as one, removes the need for this layer to import or move down any p-adic Hodge theory: the identification of B†\_K belongs to the consumer, which sits in a higher tier and may cite this layer.

<a id="RD-2-local-monodromy-over-finite-etale-robba-extensions"></a>

### The p-adic local monodromy theorem over every finite étale extension R^L of the Robba ring, and for rings presented as such

`PadicDifferentialEquationsAndRigidCohomology:RD.2/local-monodromy-over-finite-etale-robba-extensions` · comparison.

Let K be complete discretely valued of characteristic 0, σ a Frobenius lift on R_K, L/k((t)) a finite separable extension and R^L the finite étale extension of RD.2/finite-etale-extension-of-bounded-robba-ring with the unique extensions σ\_L of σ and d of d/dt. (a) Every (σ\_L, ∇)-module M over R^L (∇ relative to d, i.e. Ω^1_{R^L} = R^L dt) is quasi-unipotent: there is a finite separable L'/L (nearly finite separable if k is imperfect) such that M ⊗ R^{L'} is unipotent, and M has a basis of horizontal sections over R^{L'}\_log = R^{L'}[log t]. (b) (Transport.) Let A be a topological ring with an endomorphism φ\_A, a continuous derivation ∂\_A, and a continuous ring isomorphism ι : A → R^L with ι φ\_A ι^{−1} = σ\_L and ι ∂\_A ι^{−1} = u·d/dt for a unit u ∈ (R^L)^×. If (M, F, ∂\_M) is a finite free A-module with a φ\_A-semilinear F whose linearisation is bijective and a derivation ∂\_M over ∂\_A satisfying ∂\_M∘F = (u·dσ\_L(t)/dt / σ\_L(u))·F∘∂\_M, then ∇(m) = ∂\_M(m) ⊗ dt/u makes ι\_\*M a (σ\_L, ∇)-module, so (a) applies, and the conclusion does not depend on ι. (c) Berger's setting: for K finite over Q_p, Berger's ring B†\_rig,K is B†\_rig,F ⊗\_{B†\_F} B†\_K (Berger, Lemme 3.13), i.e. the ring R^L for the finite separable extension L of k((π)) attached to K by the field of norms, with ϕ and ∂ = (1+π)d/dπ; taking u = 1 + π, ϕ(1+π) = (1+π)^p gives the factor p, so a module with ∂\_M∘ϕ = pϕ∘∂\_M is a (ϕ,∇)-module and has a basis of solutions over R^{L'}[log π] (Berger, Théorème 5.20). The identification of B†\_K with the unramified extension of B†\_F attached to that field-of-norms extension belongs to the p-adic Hodge theory consumer (PadicHodgeTheory:R06.3 and its own P7 layer), not to this roadmap.

Hypotheses and conventions:

- σ is a Frobenius lift in the sense of RD.0/frobenius-lift-on-robba-ring; its extension σ\_L to R^L is unique because R^int_L is étale over R^int and L/k((t)) is separable (so the relative Frobenius of L is bijective).
- In (b) the factor u·dσ\_L(t)/dt/σ\_L(u) is exactly what makes ∇∘F = (F ⊗ dσ\_L)∘∇ hold for ∇ = ∂\_M ⊗ dt/u.

Proof route:

1. (a) Restriction of scalars: π\_\*M is a finite free R_K-module with connection; since L/k((t)) is separable the square of Frobenius lifts is cocartesian (R^L ⊗\_{R_K,σ} R_K ≅ R^L via σ\_L), so σ^\*(π\_\*M) = π\_\*(σ\_L^\*M) and F induces a Frobenius structure on π\_\*M.
2. By RD.2/quasi-unipotence-and-local-monodromy-statement π\_\*M becomes unipotent over R^{L''} for a finite Galois L''/k((t)) which may be taken to contain L; M ⊗ R^{L''} is a direct summand of (π\_\*M) ⊗ R^{L''} (because R^L ⊗\_{R_K} R^{L''} is a product of copies of R^{L''}), and unipotence passes to direct summands (subquotients), so M ⊗ R^{L''} is unipotent.
3. Log solutions over R^{L''}\_log by RD.2/logarithmic-form-of-local-monodromy applied to π\_\*M and projection to the summand.
4. (b) Compute ∇(F m) = ∂\_M(F m) ⊗ dt/u and (F ⊗ dσ\_L)(∂\_M m ⊗ dt/u) = F(∂\_M m) ⊗ (dσ\_L(t)/dt / σ\_L(u)) dt; they agree iff ∂\_M∘F = (u·dσ\_L(t)/dt/σ\_L(u))·F∘∂\_M. Independence of ι: two presentations differ by a continuous automorphism of R^L commuting with σ\_L, and unipotence and horizontal sections are invariant (RD.2/unipotent-differential-module, invariance under change of parameter).
5. (c) Berger p. 57: Ω^1_{R_K} = R_K dπ\_K/π\_K, and on R_F dx = (π∂x/(1+π)) dπ/π, so the Frobenius compatibility of the connection is ∂\_M∘ϕ = pϕ∘∂\_M; finitely presented modules with connection are free (RD.2/finitely-presented-differential-module-is-free).

Acceptance:

- L = k((t)): (a) is RD.2/quasi-unipotence-and-local-monodromy-statement itself.
- Berger's setting with K = Q_p: L = F_p((π)), B†\_rig,Q_p = R_{Q_p} in π with ϕ(π) = (1+π)^p − 1 and ∂ = (1+π)d/dπ; the compatibility factor is u·dϕ(π)/dπ/ϕ(u) = (1+π)·p(1+π)^{p−1}/(1+π)^p = p.
- Dwork's module over R^L for L the Artin-Schreier extension of t^{−1}: already constant, L' = L.

Prerequisites: `PadicDifferentialEquationsAndRigidCohomology:RD.2/quasi-unipotence-and-local-monodromy-statement`, `PadicDifferentialEquationsAndRigidCohomology:RD.2/logarithmic-form-of-local-monodromy`, `PadicDifferentialEquationsAndRigidCohomology:RD.2/finite-etale-extension-of-bounded-robba-ring`, `PadicDifferentialEquationsAndRigidCohomology:RD.2/unipotent-differential-module`, `PadicDifferentialEquationsAndRigidCohomology:RD.2/finitely-presented-differential-module-is-free`, `PadicDifferentialEquationsAndRigidCohomology:RD.2/log-robba-ring`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/frobenius-differential-module`, `PadicDifferentialEquationsAndRigidCohomology:RD.0/frobenius-lift-on-robba-ring`.

Sources:

- p-adic Differential Equations (kedlaya-pde-book), Definition 20.1.1, Remark 20.1.2 and Theorem 20.1.4, pp. 326-328: R^L = R ⊗\_{E†} E†\_L for finite separable L to which φ extends, quasiconstant and quasiunipotent modules over R, and the p-adic local monodromy theorem for any Frobenius lift.
- p-adic Differential Equations (kedlaya-pde-book), Definition 24.2.7, p. 360; Theorem 24.4.4 and Corollary 24.4.5, p. 363: B†\_rig,K = B†\_K ⊗\_{B†\_{Q_p}} R and Berger's theorem that de Rham representations are potentially semistable, obtained by applying Theorem 20.1.4.
- Représentations p-adiques et équations différentielles (berger-padic-differential-2002), Lemme 3.13, p. 37; §5.5, pp. 56-58, Théorème 5.20: B†\_rig,K = B†\_rig,F ⊗\_{B†\_F} B†\_K; the finite extensions R_K = B†\_rig,K come from finite separable extensions of k((π)) by the field of norms; Frobenius compatibility ∂\_M∘ϕ = pϕ∘∂\_M; every finitely presented differential module with Frobenius structure has a basis of solutions in R′[log π] for a finite étale R′.

## 6. The completed algebraic closure (layer RD.0)

The extended Robba ring of RD.0 is built over the completion of an algebraic closure of k((t)), which must be algebraically closed. Mathlib proves this only in characteristic 0. The characteristic-free argument of Conrad's handout is planned here; the node sits in layer RD.0 because RD.0/extended-robba-ring consumes it.

<a id="RD-0-completed-algebraic-closure-is-algebraically-closed"></a>

### The completion of an algebraically closed nonarchimedean field is algebraically closed, in every characteristic

`PadicDifferentialEquationsAndRigidCohomology:RD.0/completed-algebraic-closure-is-algebraically-closed` · lemma.

Let F be a field complete for a nontrivial nonarchimedean absolute value, F̄ an algebraic closure with the unique extension of the absolute value, and C_F the completion of F̄. Then C_F is algebraically closed. More generally, if L is a complete nonarchimedean field containing a dense algebraically closed subfield, then L is algebraically closed. In particular, for F = k((t)) (characteristic p) the completed algebraic closure ℓ^alg used for the extended Robba ring (RD.0/extended-robba-ring) is algebraically closed, hence perfect.

Hypotheses and conventions:

- No hypothesis on the characteristic: Mathlib's IsAlgClosed.of_denseRange is proved only for complete fields of characteristic 0 (it uses Krasner's lemma, which needs separability); the argument below uses continuity of roots instead.

Proof route:

1. Let f ∈ C_F[X] be monic of degree n ≥ 1. Approximate f by monic polynomials f_j ∈ F̄[X] of degree n with coefficients converging to those of f (Mathlib Polynomial.exists_monic_and_natDegree_eq_and_norm_map_algebraMap_coeff_sub_lt, using density of F̄).
2. Each f_j has a root r_j ∈ F̄; the r_j are bounded by C = max |a_i|^{1/(n−i)} and |f(r_j)| ≤ max_i |a_i − a_{ij}|·max(1, C^{n−1}) → 0 (Conrad, Math 248A handout, §2).
3. In a splitting field L of f over C_F (with the spectral norm extending the absolute value, Mathlib spectralNorm.normedField and spectralNorm_extends), f = Π (X − ρ\_k), so Π\_k |r_j − ρ\_k| → 0; by pigeonhole a subsequence of the r_j converges to one root ρ\_k (compare Mathlib Polynomial.exists_aroots_norm_sub_lt_of_norm_coeff_sub_lt, which needs no separability).
4. That subsequence is Cauchy in the complete field C_F, so its limit lies in C_F and is a root of f; hence C_F is algebraically closed (Mathlib IsAlgClosed.of_exists_root).
5. Perfectness: in an algebraically closed field every element has a p-th root (Mathlib IsAlgClosed.exists_pow_nat_eq), so it is perfect (Mathlib PerfectField; the instance IsAlgClosed.perfectField at the pin).

Acceptance:

- Characteristic 0: C_p = completion of Q̄\_p is algebraically closed (Mathlib PadicComplex.isAlgClosed), recovered by this argument.
- Characteristic p: the completion of the algebraic closure of F_p((t)) is algebraically closed although F_p((t))^alg is not complete and has infinite degree over F_p((t)) (Conrad, §1).
- Non-example: F̄ itself is not complete when [F̄ : F] is infinite (Conrad, §1, citing Bosch-Güntzer-Remmert 3.4.3/1), so completing is necessary; and a complete discretely valued field such as k((t)) is never algebraically closed (Eisenstein polynomials X^e − t).

Prerequisites: `mathlib:IsAlgClosed.of_exists_root`, `mathlib:Polynomial.exists_monic_and_natDegree_eq_and_norm_map_algebraMap_coeff_sub_lt`, `mathlib:Polynomial.exists_aroots_norm_sub_lt_of_norm_coeff_sub_lt`, `mathlib:spectralNorm.normedField`, `mathlib:spectralNorm_extends`, `mathlib:UniformSpace.Completion`, `mathlib:IsAlgClosed.of_denseRange`, `mathlib:IsAlgClosed.exists_pow_nat_eq`, `mathlib:PerfectField`.

Sources:

- Math 248A. Completion of algebraic closure (conrad-completion-algebraic-closure), Theorem 1.1, §2 (proof), pp. 1-2; Lemma 3.1, p. 3: The completion of an algebraic closure of a complete nonarchimedean field is algebraically closed, proved by approximating a monic polynomial by ones over the algebraic closure and extracting a Cauchy subsequence of their roots, with no characteristic assumption.
- Slope filtrations revisited (kedlaya-slope-filtrations), Convention 2.2.16, p. 9 (arXiv v4): Kedlaya works with Γ^alg over the completed algebraic closure of k((t)) (as opposed to the uncompleted one of the monodromy paper), using that this complete field is algebraically closed without giving a reference.

## 7. The first pass's open items, item by item

- **resolved.** Gap 'Tsuzuki's unit-root local monodromy theorem is imported, not proved' (first-pass nodes RD.2/tsuzuki-unit-root-finite-monodromy, RD.2/slope-pieces-horizontal-after-finite-extension, RD.2/quasi-unipotence-and-local-monodromy-statement), including the existence of an extension with v_p(A − I) > 1/(p − 1). Planned: RD.2/lang-trivialisation-of-unit-root-modules supplies the extension; RD.2/small-constant-unit-root-module-is-trivial (with RD.2/unit-root-matrix-normal-form and RD.2/dwork-transfer-to-the-centre-of-a-disc) proves Kedlaya's Proposition 6.11 step; RD.2/tsuzuki-equivalence-finite-local-monodromy (a) is the first-pass statement, (b) the equivalence. Source: Kedlaya, p-adic Differential Equations, Chapter 19 (the author's public PDF).
- **resolved.** Remaining 'The characteristic p algebraic closedness of the completed algebraic closure of k((t)) has no read source (gap)'. Planned as RD.0/completed-algebraic-closure-is-algebraically-closed from Conrad's Math 248A handout, Theorem 1.1 (characteristic-free); Mathlib's IsAlgClosed.of_denseRange covers only characteristic 0. Placed in layer RD.0 because RD.0/extended-robba-ring consumes it.
- **pointer.** Remaining 'The relative (over dagger algebras) local monodromy theorem, Kedlaya Finiteness Theorem 5.1.3, is left to RD.5'. Kept with RD.5 (its follow-up job #9747); the absolute statement over every R^L that RD.5 starts from is RD.2/local-monodromy-over-finite-etale-robba-extensions.
- **partly resolved.** Remaining 'André's and Mebkhout's proofs are cited only as comparisons; Mebkhout not read'. André's Tannakian theorem is now planned (RD.2/andre-local-monodromy-group); Mebkhout remains unread and no alternative proof is planned (remaining list).
- **resolved.** Remaining 'The published Documenta version of Slope filtrations revisited and its erratum were not accessible'. Both read (Doc. Math. 10 (2005) 447-525 from the EMIS mirror; Doc. Math. 12 (2007) 361-362 from EMS Press). locatorConcordance maps every Slope filtrations revisited label cited by RD.2 from arXiv v4 to the published pages; sourceIssues record the erratum's corrections, which also make the first pass's E72 (Lemma 2.9.1) a known correction.
- **resolved.** Remaining and gap 'André MC/MCF Tannakian group and logarithmic solutions' (Xu-Zhu §2.9.1: MC after finite coefficient extensions, MCF of modules admitting some Frobenius structure, I × G_a, P, Irr = Swan, tame G_a and nilpotent residues, invariant/coinvariant solution spaces). Planned: RD.2/quasi-unipotent-modules-admit-frobenius-structures, RD.2/differential-modules-with-algebraic-constants, RD.2/andre-local-monodromy-group, RD.2/unipotent-solutions-and-residues, with Irr = Swan from RD.2/irregularity-equals-swan-conductor; the Tannakian group uses Tau Ceti's comodule reconstruction, not a general neutral-Tannakian reconstruction.
- **resolved for RD.2.** Remaining and gaps 'Tier-compatible Galois, Tannakian and zeta inputs' and 'Berger ring and Galois identifications moved down from the higher/stray suppliers' (RD.2 part: the ring identification consumed by Berger's form). Resolved without a move-down: RD.2/local-monodromy-over-finite-etale-robba-extensions states the theorem over every R^L and for any ring presented as R^L with a unit-multiple derivation. Berger's B†\_rig,K is B†\_rig,F ⊗ B†\_K (Berger, Lemme 3.13), an R^L, and the field-of-norms identification is the consumer's (PadicHodgeTheory R06.3 with its own P7), which may cite RD.2 downward. The RD.6 and RD.7 parts of the gap are not RD.2's.
- **resolved for RD.2.** Gap 'Christol-Mebkhout index theory and the comparison Irr = Swan are not planned in RD.1' (next action: Kedlaya overview Theorem 5.4.10 with Lemmas 5.4.4-5.4.9 to RD.2). The RD.2 part is planned: RD.2/highest-break-under-finite-etale-pullback, RD.2/matsuda-highest-break-theorem, RD.2/irregularity-equals-swan-conductor. The Christol-Mebkhout index formula and the global Grothendieck-Ogg-Shafarevich formula stay with RD.6.
- **resolved.** RD.1 coverage: 'Overview Chapter 4 (quasi-constant and quasi-unipotent ∇-modules, Matsuda's classification) and Theorem 5.4.10 are RD.2 material, not planned here'. Planned: RD.2/quasi-constant-modules-are-semilinear-representations, RD.2/matsuda-decomposition (with local duality for quasi-unipotent modules), and the Chapter 5 nodes above.

## 8. Gap

- **Upper ramification filtration over an infinite perfect residue field (inherited from ArithmeticGaloisRepresentations R01.3)** (needed by `PadicDifferentialEquationsAndRigidCohomology:RD.2/matsuda-highest-break-theorem`, `PadicDifferentialEquationsAndRigidCohomology:RD.2/irregularity-equals-swan-conductor`, `PadicDifferentialEquationsAndRigidCohomology:RD.2/andre-local-monodromy-group`). The comparison of differential breaks with ramification breaks uses Serre's upper numbering, the break decomposition and the Swan conductor of representations of Gal(k((t))^sep/k((t))) with finite wild image. ArithmeticGaloisRepresentations R01.3 supplies them for finite k through Tau Ceti's LocalFieldsRamification layers 3-4 (tier (F)) and records a gap for an arbitrary perfect residue field (tier (P)). André's setting (k̄ algebraically closed) and Kedlaya's (k perfect) need tier (P). Kedlaya's own proof is insensitive to this (it works over k̄ throughout), so the gap is in the library interface, not in the mathematics; it closes when R01.3's tier (P) gap is closed.

## 9. Proposed restructuring and assembly edits

- **Prerequisite edits for first-pass RD.2 nodes, to be made at assembly** (rescope; PadicDifferentialEquationsAndRigidCohomology). This follow-up cannot edit the first-pass packet. Several first-pass RD.2 nodes now have planned suppliers here. *Proposal:* At assembly: (1) replace the IMPORTED step of RD.2/tsuzuki-unit-root-finite-monodromy by RD.2/tsuzuki-equivalence-finite-local-monodromy (a) and add that node, RD.2/lang-trivialisation-of-unit-root-modules and RD.2/small-constant-unit-root-module-is-trivial to its prerequisites; drop the gap 'Tsuzuki's unit-root local monodromy theorem is imported, not proved'. (2) Add RD.2/quasi-constant-modules-are-semilinear-representations and RD.2/matsuda-decomposition to the prerequisites of RD.2/monodromy-representation-equivalence (its proof uses overview Lemma 4.3.2 and Theorem 4.6.6). (3) Add RD.2/local-monodromy-over-finite-etale-robba-extensions to RD.2/berger-form-of-local-monodromy and replace its hypothesis assigning the B†\_rig,K identification to PadicHodgeTheory:P7 and PhiGammaModulesAndIwasawaCohomology:PG.0 by: the identification of B†\_K with the unramified extension of B†\_F attached to the field-of-norms extension belongs to the consumer R06.3; drop the gap 'Berger ring and Galois identifications moved down' and the Berger sentence of 'Tier-compatible Galois, Tannakian and zeta inputs'. (4) Add RD.0/completed-algebraic-closure-is-algebraically-closed to the prerequisites of RD.0/extended-robba-ring. (5) Mark the first pass's source issue E72 (Lemma 2.9.1) as known: corrected in Documenta Math. 12 (2007), 361-362.
- **Divide RD.2 into three sub-layers for the atlas** (rescope; PadicDifferentialEquationsAndRigidCohomology). With this follow-up, RD.2 has 50 nodes and eight planet candidates (six from the first pass, two here: 'Irregularity equals Swan conductor' and 'André's local monodromy group'), more than one star can show. *Proposal:* RD.2a 'Slope filtrations over the Robba ring' (first pass: finitely-presented-differential-module-is-free, slope-zero-eigenvectors-descend-to-overconvergent, special-polygon-above-generic, coincident-polygons-common-filtration, good-models-of-sigma-modules, isoclinic-descent-to-bounded-robba-ring, slope-filtration-for-frobenius-modules-statement, differentials-have-positive-slopes, slope-filtration-is-horizontal, isoclinic-model-inherits-connection; planets Isoclinic descent, Slope filtration theorem). RD.2b 'The p-adic local monodromy theorem' (first pass: finite-etale-extension-of-bounded-robba-ring, constant-and-quasi-constant-differential-module, unipotent-differential-module, quasi-unipotent-differential-module, robba-ring-antiderivative, unipotent-iff-nilpotent-residue, quasi-unipotent-implies-overconvergent, tsuzuki-unit-root-finite-monodromy, log-robba-ring, log-robba-ring-antiderivative, slope-pieces-horizontal-after-finite-extension, quasi-unipotence-and-local-monodromy-statement, local-monodromy-finite-etale-form, logarithmic-form-of-local-monodromy, berger-form-of-local-monodromy and the three acceptance applications; this packet: the nine Tsuzuki nodes and local-monodromy-over-finite-etale-robba-extensions; planets Unipotent differential module, Tsuzuki's unit-root monodromy theorem, p-adic local monodromy theorem, Logarithmic form of the local monodromy theorem). RD.2c 'Monodromy representations, ramification and the Tannakian group' (first pass: solution-space-phi-n-module, monodromy-representation-equivalence; this packet: quasi-constant-modules-are-semilinear-representations, matsuda-decomposition, highest-break-under-finite-etale-pullback, matsuda-highest-break-theorem, irregularity-equals-swan-conductor, quasi-unipotent-modules-admit-frobenius-structures, differential-modules-with-algebraic-constants, unipotent-solutions-and-residues, andre-local-monodromy-group; planets Irregularity equals Swan conductor, André's local monodromy group). If the sub-layers are not adopted, the assembly keeps six planets and drops the two proposed here.
- **Berger's form: RD.2 exports the theorem over R^L; the field-of-norms identification stays with PadicHodgeTheory** (rescope; PadicDifferentialEquationsAndRigidCohomology, PadicHodgeTheory). The first pass asked for the B†\_rig,K identification to move down into RD.2 from PadicHodgeTheory:P7 and PhiGammaModulesAndIwasawaCohomology:PG.0. RD.2 does not need it: Berger's ring is B†\_rig,F ⊗\_{B†\_F} B†\_K (Lemme 3.13), which is R^L for the field-of-norms extension L of F_p((π)), and the local monodromy theorem holds over every R^L (RD.2/local-monodromy-over-finite-etale-robba-extensions). *Proposal:* R06.3 (tier 13) cites RD.2/local-monodromy-over-finite-etale-robba-extensions (part (c)) together with its own P7 identification of B†\_K; no notion moves down, and RD.2 cites no p-adic Hodge theory.
- **Local duality over the Robba ring belongs with RD.2** (rescope; PadicDifferentialEquationsAndRigidCohomology). The RD.1 continuation (packet PadicDifferentialEquationsAndRigidCohomology--RD.1, merged 2026-10-14 while this job ran) plans RD.1/residue-duality-pairing and RD.1/robba-residue-duality (Kedlaya, p-adic Differential Equations, Proposition 20.4.2, as used by Dospinescu-Le Bras). Its proof cites RD.2/local-monodromy-finite-etale-form, RD.2/logarithmic-form-of-local-monodromy and RD.2/unipotent-iff-nilpotent-residue, so an RD.1 node depends on RD.2 while the atlas has RD.1 → RD.2; and its gap G5 asks for a public proof that cohomology, residue and duality descend along finite covers. Part (a) of RD.2/matsuda-decomposition is that public proof for quasi-unipotent modules (Kedlaya overview §4.4, Proposition 4.4.3, arXiv). *Proposal:* At assembly, give RD.1/robba-residue-duality parentStageId RD.2 (keeping its id, as the first pass did for RD.3-prefixed nodes now in RD.5) and add RD.2/matsuda-decomposition to its prerequisites, which closes its gap G5; RD.1/residue-duality-pairing (the pairing itself) can stay in RD.1. Then the layer order RD.1 → RD.2 has no exception.
- **The characteristic-free completion lemma is general field theory** (rescope; PadicDifferentialEquationsAndRigidCohomology, PerfectoidSpaces). RD.0/completed-algebraic-closure-is-algebraically-closed is planned here because the first pass assigned the missing source to RD.2. PerfectoidSpaces (tier 3), P4/algebraically-closed-extension-of-affinoid-field, records the same characteristic-p case as a gap, and Mathlib's Dense.lean lists the upgrade of IsAlgClosed.of_denseRange as a TODO. *Proposal:* Keep the node in RD.0 while no lower roadmap plans it. If PerfectoidSpaces plans the lemma, RD.0 cites that node and this one becomes a pointer; if Mathlib proves it, cite the declaration.
- **The first pass's slope filtration theorem generalises a target the FiniteFlatGroups package moved down** (rescope; PadicDifferentialEquationsAndRigidCohomology, FiniteFlatGroupsAndIntegralPadicHodgeTheory). The accepted package of FiniteFlatGroupsAndIntegralPadicHodgeTheory (tier 10, review accepted 2026-10-13) moved down, as §R07.4.7 (the Robba ring, φ-modules, degree, slope, purity) and §R07.4.8 (Kedlaya's slope filtration theorem with Dieudonné-Manin over the extended Robba ring and descent of pure modules), the notions its plan had cited from RD.1. Those targets are the case k perfect, coefficients W(k)[1/p], q = p and the standard Frobenius of the first pass's RD.2 nodes slope-filtration-for-frobenius-modules-statement, isoclinic-descent-to-bounded-robba-ring and their RD.0/RD.1 inputs, which allow a ramified coefficient ring, a q-power Frobenius lift, an arbitrary lift and imperfect k. They are package targets without packet node ids, so this packet cannot cite them by id. *Proposal:* At the RD assembly or package: cite FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.4.7-§R07.4.8 for that special case, keep in RD.0-RD.2 only the generalisation, and state the compatibility (for k perfect, O = W(k), q = p and σ(u) = u^p the RD objects and filtrations are those of §R07.4.7-§R07.4.8). Nothing in this follow-up depends on the choice.
- **Dwork's transfer theorem to the centre of a disc could sit in RD.1** (rescope; PadicDifferentialEquationsAndRigidCohomology). RD.2/dwork-transfer-to-the-centre-of-a-disc is a statement about generic radii (RD.1 material); its only consumer is RD.2's key lemma. *Proposal:* The assembly may move it to RD.1 next to RD.1/dwork-transfer-generic-disc; no RD.1 node needs it, so either placement is acyclic.

## 10. Mistakes found in the sources

- **PadicDifferentialEquationsAndRigidCohomology/E-RD2-1** (misprint; p-adic Differential Equations, Theorem 19.4.1 and Corollary 19.4.2, p. 321 (first edition, author's PDF)). The source: For V with finite local monodromy and ρ close to 1, the generic radius R(D†(V) ⊗ F_ρ) is said to equal ρ^b, with b the largest i ≥ 1 such that the upper ramification group G^i is not contained in the kernel; Corollary 19.4.2 says the same of the subsidiary radii. Correction: The intrinsic radius is meant: IR(D†(V) ⊗ F_ρ) = ρ^b, i.e. R(D†(V) ⊗ F_ρ) = ρ^{b+1}, with b the highest upper break of V restricted to inertia (Serre's numbering), b ∈ Q_{≥0}, b = 0 when V is tamely ramified; the restriction i ≥ 1 must be dropped because highest breaks in (0, 1) occur. Likewise the subsidiary radii in Corollary 19.4.2 are intrinsic. Why: Dwork's rank-one module M_f with f = t^{−1} (Example 17.1.4, = D†(V) for the Artin-Schreier character of break 1 by Example 19.2.6) has horizontal section exp(−π\_0(t^{−1} − t_ρ^{−1})) converging exactly on |t − t_ρ| < ρ^2, so R = ρ^2 while the printed formula gives ρ^1; the book's own Theorem 12.6.4 and Definition 9.4.4 (R = ρ for the trivial module) and Kedlaya's overview (Definition 5.4.1, Theorem 5.4.10) give R = ρ^{β+1}. Inducing the break-1 Artin-Schreier character from k((t^{1/2})) (p odd) gives a representation with highest upper break 1/2, for which no i ≥ 1 qualifies. Reach: a stated result. Known: new.
- **PadicDifferentialEquationsAndRigidCohomology/E-RD2-2** (misprint; Bessel F-isocrystals for reductive groups, §2.9.2, display (2.9.2.2), p. 24 (arXiv:1910.13391, page image checked)). The source: A canonical isomorphism from Coker(N) to the solution space Sol(M) = Hom_{K{x}}((M,∇),(K{x},d))^{∇=0} of a unipotent object M with associated (V, N). Correction: Sol(M) is canonically the dual (Coker N)^∨ = ker(N^∨ on V^∨): a horizontal homomorphism is a constant functional λ on V with λ∘N = 0. Why: Writing φ(v) = Σ φ\_n(v) x^n, horizontality gives φ\_n∘N = nφ\_n, so φ\_n = 0 for n ≥ 1 (N − n invertible) and φ\_0 vanishes on NV; for M = U_2 the solutions form the annihilator of e_1 in V^∨. The dimensions agree, and that is all the paper's subsequent argument uses (convergence of solutions in the proof of Proposition 5.1.3). Reach: nothing. Known: new.
- **PadicDifferentialEquationsAndRigidCohomology/E-RD2-3** (error; Slope filtrations revisited, Definition 2.5.1, p. 462 (Doc. Math. 10; arXiv v4 p. 16), used in Proposition 3.3.7(c), Proposition 4.2.2, Lemmas 4.3.1-4.3.2). The source: Teichmüller presentations of elements of Γ\_I are constructed and used, with a uniqueness property, in several proofs. Correction: The construction is invalid because the Teichmüller map is not additive; in Proposition 3.3.7(c), Proposition 4.2.2 and Lemma 4.3.2 use strong semiunit presentations (as in the Annals paper, Proposition 3.14) instead; the surjectivity in Lemma 4.3.1, which needs uniqueness, follows from Fourquaux's thesis, Corollaire 3.9.19, and is not used elsewhere. Why: Pointed out by L. Berger and corrected by the author in the published erratum. Reach: the proof. Known: Kedlaya, Erratum for 'Slope Filtrations Revisited', Documenta Math. 12 (2007), 361-362.
- **PadicDifferentialEquationsAndRigidCohomology/E-RD2-4** (gap; Slope filtrations revisited, Lemma 2.9.1, proof, p. 474 (Doc. Math. 10; arXiv v4 p. 28)). The source: The proof begins by choosing a unit u removing the slopes of f, which is possible only when f has no slopes in [s′, s). Correction: Obtain g with (a), (b) from Lemma 2.6.7; for (c) choose s″ with no slopes of f in [s″, s), divide in Γ\_[s″,r], note g is a unit in Γ\_[s′,s″], and glue the two divisibilities using Corollary 2.5.7 (Γ\_[s′,s″] ∩ Γ\_[s″,r] = Γ\_[s′,r]). Why: Observed by R. Liu and repaired in the published erratum; this is the issue the first pass recorded as its E72 as new. Reach: the proof. Known: Kedlaya, Erratum for 'Slope Filtrations Revisited', Documenta Math. 12 (2007), 361-362 (the first pass's E72 records the same issue).
- **PadicDifferentialEquationsAndRigidCohomology/E-RD2-5** (gap; Slope filtrations revisited, Lemma 2.9.3, proof, p. 475 (Doc. Math. 10; arXiv v4 p. 28)). The source: The inductive construction does not ensure that the elements x_{i+1} lie in Γ\_r[π^{−1}]. Correction: Replace g_{i+1} − x_i by y_i ∈ Γ\_r with g_{i+1} − x_i − y_i divisible by h_{i+1} in Γ\_{i+1}, chosen by an argument like Lemma 2.9.2. Why: Observed by R. Liu and repaired in the published erratum. Reach: the proof. Known: Kedlaya, Erratum for 'Slope Filtrations Revisited', Documenta Math. 12 (2007), 361-362.
- **PadicDifferentialEquationsAndRigidCohomology/E-RD2-6** (error; A p-adic local monodromy theorem, Introduction (Section 1.1), p. 3 of arXiv:math/0110124v4 (p. 95 of the Annals version)). The source: The ring Γcon is described as the series taking integral values on some open annulus of outer radius 1. Correction: An element of Γcon has that property only after multiplication by a large power of the series variable (and conversely); Γcon is the ring of bounded-by-1 overconvergent series in the sense of Chapter 3. Why: Pointed out by K. Buzzard and corrected in the erratum to Slope filtrations revisited; for example u^{−1} ∈ Γcon has |u^{−1}| = 1/|u| > 1 on every annulus ρ < |u| < 1, while u·u^{−1} = 1 is integral. Reach: nothing. Known: Kedlaya, Erratum for 'Slope Filtrations Revisited', Documenta Math. 12 (2007), 361-362 (errata to [2] = the Annals paper).
- **PadicDifferentialEquationsAndRigidCohomology/E-RD2-7** (error; A p-adic local monodromy theorem, Lemma 2.3, p. 14 of arXiv:math/0110124v4 (Annals version, Lemma 2.3)). The source: For a Bézout ring R, every unimodular row is the first row of a matrix of determinant 1. Correction: R must be a Bézout domain: the proof divides by a generator d of (x_1, …, x_{n−1}), which needs d to be a nonzerodivisor. Why: The induction forms x_i/d; in a ring with zero divisors a generator need not divide its multiples uniquely. Corrected by the author. Reach: the proof. Known: Kedlaya, Erratum for 'Slope Filtrations Revisited', Documenta Math. 12 (2007), 361-362 (errata to [2]).
- **PadicDifferentialEquationsAndRigidCohomology/E-RD2-8** (misprint; Local monodromy of p-adic differential equations: an overview, Lemma 5.4.6, p. 33 (arXiv:math/0501361v2; page image checked)). The source: E has highest break at least β (resp. at most β) iff the tame pull-back f^\*E has highest break nβ (resp. at most nβ) iff the push-forward f_\*E has highest break β/n (resp. at most β/n): the first alternative of the second and third clauses lacks 'at least'. Correction: E has highest break ≥ β (resp. ≤ β) iff f^\*E has highest break ≥ nβ (resp. ≤ nβ) iff f_\*E has highest break ≥ β/n (resp. ≤ β/n). Why: Each clause compares one-sided bounds; with 'exactly nβ' the equivalence fails, e.g. E of highest break 2β has highest break ≥ β while f^\*E has highest break 2nβ ≠ nβ. The proof (Lemma 5.3.1) gives the one-sided statements. Reach: nothing. Known: new.
- **PadicDifferentialEquationsAndRigidCohomology/E-RD2-9** (misprint; Local monodromy of p-adic differential equations: an overview, Proof of Lemma 5.4.7, p. 33 (arXiv:math/0501361v2; page image checked)). The source: The cover with reduction u^p − u = a t^{−n} is presented as R[u]/(1 + pπ b t^{−n} − (1 + πu)^p) with b lifting a and π^{p−1} = −p. Correction: That ring reduces to u^p − u = −a t^{−n} (expand (1 + πu)^p = 1 + pπu − pπu^p + higher terms and divide by pπ); take b lifting −a, or replace u by −u when p is odd. The cover is the same up to this sign, so nothing downstream changes. Why: Coefficient comparison modulo pπ^2: π^p = −pπ and the middle binomial terms are divisible by pπ^2. Reach: nothing. Known: new.

## 11. Slope filtrations revisited: arXiv v4 and Documenta Mathematica

The first pass cited arXiv:math/0504204v4. The published text (Doc. Math. 10 (2005), 447-525) has the same numbering for every statement RD.2 cites; only the page numbers change, and one remark is reworded. The erratum (Doc. Math. 12 (2007), 361-362) is summarised in §10.

| Label | arXiv v4 page | Documenta page | Note |
|---|---|---|---|
| Convention 2.2.16 | 9 | 455 | same label and statement in both versions |
| Definition 2.5.1 | 16 | 462 | invalid construction, see E-RD2-3 |
| Lemma 2.9.1 | 28 | 474 | proof repaired by the erratum, see E-RD2-4 |
| Lemma 2.9.3 | 28 | 475 | proof repaired by the erratum, see E-RD2-5 |
| Proposition 3.3.7 | 34 | 482 | part (c): use strong semiunit presentations |
| Proposition 4.2.2 | 41 | 488 | use strong semiunit presentations |
| Lemma 4.3.1 | 44 | 492 | surjectivity via Fourquaux; unused |
| Lemma 4.3.2 | 44 | 492 | use strong semiunit presentations |
| Lemma 5.4.1 | 57 | 506 | same label and statement in both versions |
| Proposition 5.5.1 | 59 | 508 | same label and statement in both versions |
| Theorem 5.5.2 | 59 | 508 | same label and statement in both versions |
| Lemma 6.1.1 | 62 | 511 | same label and statement in both versions |
| Proposition 6.2.2 | 63 | 512 | same label and statement in both versions |
| Remark 6.2.3 | 64 | 513 | wording differs: arXiv v4 says it is not known whether Proposition 6.2.2 holds without the extension L; the published text says it should be possible. The first-pass node RD.2/good-models-of-sigma-modules paraphrases the arXiv wording. |
| Theorem 6.3.3 | 64 | 513 | same label and statement in both versions |
| Remark 6.3.4 | 65 | 514 | same label and statement in both versions |
| Proposition 6.3.5 | 65 | 514 | same label and statement in both versions |
| Theorem 6.4.1 | 65 | 514 | same label and statement in both versions |
| Corollary 6.4.2 | 66 | 515 | same label and statement in both versions |
| Remark 7.1.4 | 67 | 516 | continues on p. 517 |
| Proposition 7.1.6 | 67 | 516 | same label and statement in both versions |
| Proposition 7.1.7 | 67 | 517 | same label and statement in both versions |
| Definition 7.2.2 | 68 | 517 | same label and statement in both versions |
| Proposition 7.2.3 | 68 | 517 | same label and statement in both versions |
| Definition 7.2.4 | 68 | 518 | same label and statement in both versions |
| Theorem 7.2.5 | 68 | 518 | same label and statement in both versions |
| Example 7.2.6 | 69 | 518 | u^σ = qu misprint as in the first pass's E4 (both versions) |

## 12. Dependencies

Within the roadmap (first-pass nodes and layers): `PadicDifferentialEquationsAndRigidCohomology:RD.0/bounded-robba-ring`, `PadicDifferentialEquationsAndRigidCohomology:RD.0/derivation-on-robba-ring`, `PadicDifferentialEquationsAndRigidCohomology:RD.0/frobenius-lift-on-robba-ring`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/break-decomposition`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/change-of-frobenius-for-frobenius-structures`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/differential-module`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/differential-swan-conductor`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/dwork-exponential-module`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/dwork-overconvergence-proof`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/dwork-transfer-generic-disc`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/frobenius-differential-module`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/frobenius-stable-lattices`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/frobenius-structure-forces-solvability`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/generic-radius`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/generic-radius-basic-properties`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/highest-break`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/isoclinic-frobenius-module`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/solvable-at-boundary`, `PadicDifferentialEquationsAndRigidCohomology:RD.1/spectral-norm-of-differential-module`, `PadicDifferentialEquationsAndRigidCohomology:RD.2/constant-and-quasi-constant-differential-module`, `PadicDifferentialEquationsAndRigidCohomology:RD.2/differentials-have-positive-slopes`, `PadicDifferentialEquationsAndRigidCohomology:RD.2/finite-etale-extension-of-bounded-robba-ring`, `PadicDifferentialEquationsAndRigidCohomology:RD.2/finitely-presented-differential-module-is-free`, `PadicDifferentialEquationsAndRigidCohomology:RD.2/log-robba-ring`, `PadicDifferentialEquationsAndRigidCohomology:RD.2/logarithmic-form-of-local-monodromy`, `PadicDifferentialEquationsAndRigidCohomology:RD.2/monodromy-representation-equivalence`, `PadicDifferentialEquationsAndRigidCohomology:RD.2/quasi-unipotence-and-local-monodromy-statement`, `PadicDifferentialEquationsAndRigidCohomology:RD.2/quasi-unipotent-differential-module`, `PadicDifferentialEquationsAndRigidCohomology:RD.2/robba-ring-antiderivative`, `PadicDifferentialEquationsAndRigidCohomology:RD.2/solution-space-phi-n-module`, `PadicDifferentialEquationsAndRigidCohomology:RD.2/unipotent-differential-module`, `PadicDifferentialEquationsAndRigidCohomology:RD.2/unipotent-iff-nilpotent-residue`.

Other roadmaps and the libraries: `ArithmeticGaloisRepresentations:R01.3/artin-schreier-break`, `ArithmeticGaloisRepresentations:R01.3/breaks-and-swan-conductor`, `ArithmeticGaloisRepresentations:R01.3/conductor-of-a-character`, `ArithmeticGaloisRepresentations:R01.3/conductor-tame-base-change`, `ArithmeticGaloisRepresentations:R01.3/hasse-arf-integrality`, `ArithmeticGaloisRepresentations:R01.3/swan-additive`, `ArithmeticGaloisRepresentations:R01.3/upper-numbering-of-an-open-subgroup`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/etale-phi-modules-cohen-ring`, `mathlib:Algebra.Etale`, `mathlib:Field.absoluteGaloisGroup`, `mathlib:HenselianLocalRing`, `mathlib:IsAlgClosed.exists_pow_nat_eq`, `mathlib:IsAlgClosed.of_denseRange`, `mathlib:IsAlgClosed.of_exists_root`, `mathlib:IsGalois`, `mathlib:PerfectField`, `mathlib:Polynomial.exists_aroots_norm_sub_lt_of_norm_coeff_sub_lt`, `mathlib:Polynomial.exists_monic_and_natDegree_eq_and_norm_map_algebraMap_coeff_sub_lt`, `mathlib:Representation`, `mathlib:UniformSpace.Completion`, `mathlib:spectralNorm.normedField`, `mathlib:spectralNorm_extends`, `tauceti:TauCeti.GaloisDescent.liftBaseChange_injective_of_invariant`, `tauceti:TauCeti.GaloisDescent.span_invariants_eq_top`, `tauceti:TauCeti.Tannaka.fgPointTensorIsoEquiv`, `tauceti:TauCeti.Tannaka.pointsFunctorIsoTensorAutFunctor`.

Every cross-roadmap prerequisite is a node of a roadmap in a lower upstream tier (ArithmeticGaloisRepresentations, tier 7; FiniteFlatGroupsAndIntegralPadicHodgeTheory, tier 10) or a pinned Mathlib or Tau Ceti declaration. No node cites a higher tier.

## 13. Acceptance tests for the layer

- Dwork's module M_f, f = t^{−1}, is p^{−1/(p−1)}-constant but not trivial over E†: the bound of the key lemma is sharp; it becomes trivial over the Artin-Schreier extension, has highest break 1, Swan conductor 1, and corresponds to an Artin-Schreier character of I nontrivial on P.
- A tame Kummer module ∇v = (1/m) v ⊗ dt/t has a Frobenius structure of order h whenever m | p^h − 1, highest break 0 and a tame monodromy character of order m.
- The unipotent module U_2 (∇e_2 = e_1 ⊗ dt/t) lies in MCF, has H^0 = ker N and H^1 = coker N one-dimensional, and its solution space on the disc is the dual of coker N.
- A two-dimensional representation induced from an Artin-Schreier character of break 1 over k((t^{1/2})) (p odd) has highest upper break 1/2 and Swan conductor 1, matching the highest break and differential Swan conductor of its module.
- The module ∇e = λ e ⊗ dt/t with λ ∈ Z_p not rational is solvable at 1 but has no Frobenius structure; ∇e = e ⊗ dt is not even solvable.
- Over Berger's ring for K = Q_p (ϕ(π) = (1+π)^p − 1, ∂ = (1+π)d/dπ) the compatibility factor of the transport statement is p, recovering ∂\_M∘ϕ = pϕ∘∂\_M.

## 14. Sources

- **kedlaya-pde-book**: Kiran S. Kedlaya, *p-adic Differential Equations*, Cambridge Studies in Advanced Mathematics 125, Cambridge University Press, 2010 (first edition); the author's posted PDF, read 2026-10-14. https://kskedlaya.org/papers/p-adic_differential_equations.pdf. Read: Chapter 17, Sections 17.1-17.5 (Frobenius structures, Theorem 17.2.1, Proposition 17.3.1, Corollary 17.3.2, Lemma 17.3.4, Proposition 17.3.5, Theorem 17.4.3, Proposition 17.5.1), pp. 291-300; Chapter 18, Sections 18.1-18.2 (Proposition 18.1.1, Theorem 18.2.1, Lemmas 18.2.2-18.2.3), pp. 301-305; Chapter 19 in full (Sections 19.1-19.4, notes and exercises), pp. 313-325; Chapter 20, Sections 20.1, 20.3, 20.4, 20.5 (Theorem 20.1.4, Remark 20.1.5, Theorem 20.3.5, Proposition 20.4.2, Corollary 20.4.3, Lemma 20.5.5), pp. 326-335; Section 24.2 (Theorem 24.2.5, Definition 24.2.7, Theorem 24.2.8), pp. 359-360, and Section 24.4 (Theorem 24.4.4, Corollary 24.4.5), pp. 362-363; Spot readings: Definitions 3.4.2-3.4.3 p. 52; Theorem 6.5.3 p. 106; Proposition 8.2.3 p. 138; Definition 9.4.4 p. 156; Theorem 9.6.1 pp. 158-159; Theorem 12.6.4 p. 212; Theorem 14.6.3 p. 256; Lemma 15.1.3 and Definition 15.1.2 p. 263.
- **kedlaya-pde-errata**: Kiran S. Kedlaya, *Errata for p-adic Differential Equations (updated 26 Oct 2021)*, author's errata list for the first printing, read 2026-10-14. https://kskedlaya.org/papers/pde-errata.pdf. Read: entries for Chapters 17-24 (Lemma 17.3.4, Section 18.2, Corollary 19.4.2, Lemma 21.4.1, Definition 24.4.1).
- **kedlaya-local-monodromy-overview**: Kiran S. Kedlaya, *Local monodromy of p-adic differential equations: an overview*, arXiv:math/0501361v2; Int. J. Number Theory 1 (2005). https://arxiv.org/abs/math/0501361v2. Read: Section 2.1 Example 2.1.10 and Section 2.3 Propositions 2.3.6-2.3.9, pp. 6-9; Chapter 4 (Sections 4.2-4.7), pp. 18-27; Chapter 5 (Sections 5.1-5.4), pp. 27-36; Section 6.1 Proposition 6.1.5 and Remark 6.1.6, pp. 36-39; Section 6.2, pp. 39-40.
- **kedlaya-monodromy-2003**: Kiran S. Kedlaya, *A p-adic local monodromy theorem*, arXiv:math/0110124v4; Annals of Math. 160 (2004), 93-184. https://arxiv.org/abs/math/0110124v4. Read: Introduction p. 3 (description of Γcon); Lemma 2.3, p. 14; Proposition 6.11 and proof, pp. 79-80; Theorem 6.12, statement, p. 81.
- **andre-hasse-arf**: Yves André, *Filtrations de type Hasse-Arf et monodromie p-adique*, arXiv:math/0203248v1; Invent. Math. 148 (2002), 285-317. https://arxiv.org/abs/math/0203248v1. Read: §3.4 (modules différentiels sur des couronnes p-adiques; MCS, MCF), pp. 10-11; §7.1 (Théorème 7.1.1, Complément 7.1.2, Corollaires 7.1.3-7.1.8), pp. 24-26; §6 end (conditions χ1-χ4, Ext, Ind), p. 23.
- **xu-zhu-2022**: Daxin Xu, Xinwen Zhu, *Bessel F-isocrystals for reductive groups*, arXiv:1910.13391 (Invent. Math. 227 (2022)). https://arxiv.org/pdf/1910.13391. Read: §2.9.1-2.9.4 (local monodromy of an overconvergent F-isocrystal), pp. 23-24 (page images checked); proof of Proposition 5.1.3 (use of Sol), p. 55.
- **berger-padic-differential-2002**: Laurent Berger, *Représentations p-adiques et équations différentielles*, arXiv:math/0102179; Invent. Math. 148 (2002), 219-284. https://arxiv.org/abs/math/0102179. Read: Proposition 2.31, p. 27; §3.4, Lemme 3.13, p. 37; §5.5 (Théorèmes 5.19-5.20 and the conventions for differential modules with Frobenius structure), pp. 56-58.
- **conrad-completion-algebraic-closure**: Brian Conrad, *Math 248A. Completion of algebraic closure*, course handout, Stanford University (author's page), read 2026-10-14. https://math.stanford.edu/~conrad/248APage/handouts/algclosurecomp.pdf. Read: §1 Theorem 1.1, p. 1; §2 proof of Theorem 1.1, pp. 2-3; §3 Lemma 3.1 and Theorem 3.2, p. 3.
- **kedlaya-slope-filtrations**: Kiran S. Kedlaya, *Slope filtrations revisited*, arXiv:math/0504204v4. https://arxiv.org/abs/math/0504204v4. Read: Convention 2.2.16, p. 9; the statements cited by the RD.2 nodes, compared label by label with the Documenta Mathematica text (locatorConcordance).
- **kedlaya-slope-filtrations-documenta**: Kiran S. Kedlaya, *Slope filtrations revisited*, Documenta Mathematica 10 (2005), 447-525 (published version; EMIS mirror of the journal PDF; printed page = PDF page + 446). https://emis.muni.cz/journals/DMJDMV/vol-10/15.pdf. Read: Definition 2.5.1, p. 462; Lemmas 2.9.1 and 2.9.3, pp. 474-475; Proposition 3.3.7, p. 482; Proposition 4.2.2, p. 488; Lemmas 4.3.1-4.3.2, p. 492; Sections 5.4-7.2 (the statements cited by RD.2), pp. 506-518.
- **kedlaya-slope-filtrations-documenta-erratum**: Kiran S. Kedlaya, *Erratum for “Slope Filtrations Revisited”*, Documenta Mathematica 12 (2007), 361-362 (EMS Press journal PDF). https://ems.press/content/serial-article-files/42611. Read: the whole erratum, pp. 361-362.
- **kedlaya-isocrystals**: Kiran S. Kedlaya, *Notes on isocrystals*, arXiv:1606.01321v6. https://arxiv.org/abs/1606.01321v6. Read: Section 3: Definition 3.3, Theorems 3.7 and 3.9, Definition 3.8, Remarks 3.10-3.11, pp. 6-7.
