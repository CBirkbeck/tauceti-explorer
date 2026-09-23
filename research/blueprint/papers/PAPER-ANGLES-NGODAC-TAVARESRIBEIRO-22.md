# Admissible Anderson class formulas: reviewed extraction checkpoint

Status: **partial**. Independent review: **revise** ([review report](../reviews/REV-PAPER-ANGLES-NGODAC-TAVARESRIBEIRO-22.md)). Original authors: Codex `codex-a71f92` and Claude Code `cc-442dc5`; independent reviewer: Codex `codex-c83e7a`. This report replaces contradictory earlier completion claims while preserving the source inventory and recording the repairs in the result JSON.

The paper proves the A-lattice identity

```text
[Lie_E(O_L):U_St(E/O_L)]_A
 = [Lie_E(O_L):U(E/O_L)]_A Fitt_A(H(E/O_L))
 = L(E/O_L)
```

for admissible integral Anderson A-modules, where A is regular away from an arbitrary place of a global function field with full constants F_q. A need not be principal; the infinity place need not be rational. It proves that almost-everywhere principality of the deformed local Fitting ideals implies admissibility, that abelian OR A-finite Anderson modules satisfy it, and that every integral Drinfeld A-module has the formula with a principal L-value lattice. Analytic uniformizability is not silently added, and the theorem is not extended to arbitrary non-admissible E.

Read source: [HAL v2](https://hal.science/hal-02490566v2/document), 31 numbered pages plus cover; SHA-256 `1faf283f39c566a2bd7acd4e52589ddd22d364b888a6a33199c0ca774354c200`. The complete manuscript was independently read. [Journal metadata](https://link.springer.com/article/10.1007/s00222-022-01110-3) gives the 44-page version of record, which has not been collated. All 18 confirmed findings concern HAL v2 only; no claim of novel journal errors is made.

## Current result

There are 111 items: 8 exact library imports, 6 planned imports, and 97 missing statements, each routed once. Routes 1–3 are accepted after correction; route 4 is rejected pending closure. The JSON is the current statement/API/test inventory. It preserves prerequisites and source boundaries, adds eight baseline/interface/quotient items, and keeps implementation status unchecked.

The repaired Theorem 6.3 presentation uses the untwisted row motive with right original E_a action and quotient by left tau-z. The map rho(sum c_n tau^n)=sum z^n sigma^n(c_n), followed by transpose, gives the trace-adjoint action with exactly one factor z^i and includes the constant term. The independent review supplies degree-reduction exactness and equivariance, with separate projectivity/determinant dependencies. The finite point carrier has zero cokernel; adding z^i to the motive action as well produces the wrong z^(2i).

The source's Gauss-limit and homogeneous-minor arguments now state what remains to prove. The sequence used to refute order stabilization is corrected to alternating z and z+pi^(2n+1). General Fitting and Tate foundations are imports from upstream StableReduction and AdicSpaces. Existing primary decomposition, flat/projective infrastructure, trace pairing, normal basis and restricted-series criterion are exposed as imports rather than planned again. The Part II keeps the source-specific analytic and arithmetic comparisons.

## Routes

### 1. IntegralHeckeAndGaloisDeterminants — accept

Supply the additional general Fitting and finite Dedekind-module theorems needed by IHG.6 and its PadicMeasuresIwasawaAlgebras:L6 consumer. Import the canonical Fitting carrier from upstream StableReduction Layer 0 (item 3); do not replan it. The current IHG.6 statement does not enumerate items 4–7, so they are missing source additions rather than already-planned exact signatures.

Items: 4, 5, 6, 7, 8, 9, 94.

### 2. KTheoryLowDegrees — accept

Z.4 already owns positive-rank Steinitz classification and finite-flat determinant/norm transfer. This source specifies their function-field consumers and relative-ratio conventions without duplicating the projective-module theory. The existing ClassGroup/Pic comparison is a baseline import, not new work.

Items: 101, 103.

### 3. DrinfeldModulesAndTModules — accept

The q-Frobenius skew-polynomial and additive-operator specialization is already DM.0's target. Read the generic Mathlib SkewPolynomial carrier and adapt it once; keep the source's polynomial nonnegative-exponent convention.

Items: 19.

### 4. AdmissibleAndersonClassFormulas — reject

DM.6 stops at integral Drinfeld modules over F_q[t], and DM.4's motive branch starts with that polynomial coefficient ring. Arbitrary A, nonrational infinity, higher-dimensional Anderson modules, Stark z-deformations and the principality criterion require new layers in precisely that direction. Complex period/ETNC, Euler/Kolyvagin Stark systems and the multizeta relation branch are distinct consumers, not alternative owners.

Items: 2, 10, 11, 12, 13, 14, 15, 16, 17, 18, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 95, 96, 97, 98, 99, 100, 111.

Build first on Drinfeld modules, t-motives and characteristic-p special values (DrinfeldModulesAndTModules), importing DM.0, DM.2, DM.4 and DM.6 only within their stated coefficient and uniformizability scope. Import Global function fields, reciprocity and automorphic foundations (FunctionFieldArithmetic) and the already built Tau Ceti AlgebraicCurves function-field/divisor/class-number APIs; import generic Fitting algebra from Integral Hecke actions, determinants and interpolation (IntegralHeckeAndGaloisDeterminants:IHG.6) and Steinitz/exterior determinant/norm transfer from Explicit K0: projectives, rank and determinant (KTheoryLowDegrees:Z.3–Z.4). Do not use retired FoundationsAndLibraryIntegration. Coordinate the polynomial-ring dual-motive special case with the previously extracted Ngo Dac 2021 multizeta branch; it is not a second owner of generic motive algebra.

Fix a global function field K with full constants F_q, an arbitrary place infinity of degree d_infinity>=1, A regular away from infinity, finite generic-characteristic L/K, O_L and L_infinity. Keep A Dedekind rather than principal. Construct topological A-lattices and their determinant ratios, Gauss/Tate and rational z-coefficient extensions, Anderson A-modules with nilpotent differentials, exponential and local logarithm, ordinary units/class modules, polynomial and rational z-units/classes, evaluation and Stark units. Prove the exact quotient/Fitting comparison, local factors, prime-power invariance and scalar-conjugation identities. Define admissibility by (P),(C), keeping exceptional ideals and convergence; prove the regulator containment, valuation normalization and norm/class-group upgrade. The first endpoint is Theorem 4.7: for every admissible integral E, [Lie_E(O_L):U_St(E/O_L)]_A=L(E/O_L), equivalently [Lie_E(O_L):U(E/O_L)]_A Fitt_A(H(E/O_L))=L(E/O_L).

Build the finite-field cyclic decomposition, graded characteristic-polynomial and weighted degree estimates, then the Fitting-ideal descent and Picard injection needed for Theorem 5.6: almost-everywhere principality of Fitt_Atilde(Etilde(F_P(z))) implies admissibility. Cover all Anderson F_q[t]-modules. Construct general-A motives and dual motives with their opposite Frobenius conventions; prove projectivity and almost-all preservation of abelianity/A-finiteness under reduction. Use corrected skew-motive cokernels and trace-pairing adjoints to prove Theorems 6.1 and 6.3. Deduce Theorem 6.4 for E abelian OR A-finite, and Corollary 6.5 for every integral Drinfeld A-module: L is a principal A-lattice and [O_L:U_St]_A=[O_L:U]_A Fitt_A(H)=L. Do not assume automatic analytic uniformizability or remove admissibility for arbitrary E.

Separate each listed definition and proof lemma, preserving the 40 definition contracts, nonflat-base-change, nonprincipal-lattice, Gauss-versus-z, nilpotent-differential, residue-degree and normal-basis tests. Complete G1–G8 before calling the design source-closed; compare the journal version and independently adjudicate E1–E14. Preserve full characteristic-p and bad-prime hypotheses. Later papers removing admissibility are outside this source's theorem scope. No Lean deliverable is authorized by this extraction issue. Independent-review boundary: import generic Tate algebra, evaluation and finite-module series from upstream AdicSpaces Layer 0 via item 110, and the existing restricted-series criterion (109). Import the Fitting carrier from upstream StableReduction Layer 0 via item 3; IHG.6 supplies additional algebra only. Import trace nondegeneracy, normal bases, Dedekind primary decomposition and flat/projective infrastructure (104–108). Use the untwisted row-motive quotient of item 111, never a twice-deformed tau-z presentation. Before this brief is buildable, close G2–G6 and G8 with separate supplier proof/API nodes; Jacobian/Picard prerequisites of 75–77 must be imported from the existing JacobianChallenge direction rather than planned again. The review rejects this route for now despite agreeing with its Part II direction.

## Closure and handoff

- **G1 — unavailable: Collate the 44-page version of record.** The version of record is closed access; all locators refer to HAL v2, the post-referee manuscript.

- **G2 — open: Higher-dimensional analytic and Stark-unit inputs.** Not closed: naming an external supplier or design work does not discharge source/proof/API closure. The higher-dimensional exponential, unit-lattice and Stark-unit inputs are cited suppliers ([28], [10], [16], [19]).

- **G3 — open: Gauss limit versus z-local integral coefficients.** The order counterexample is corrected and a normalized-case repair is outlined, but uniform-denominator and finite-exception compatibility remain to be supplied.

- **G4 — open: Norm comparison and rational-constant valuation argument.** Not closed: naming an external supplier or design work does not discharge source/proof/API closure. Lemma 4.6 for Anderson F_q[t]-modules and the norm compatibility are supplier inputs (Taelman, Demeslay, Fang; item 103 planned in KTheoryLowDegrees Z.4).

- **G5 — open: Homogeneous Fitting descent and Picard torsion proof.** The congruence grading fixes the false R0 claim, but normalized-minor descent and the Jacobian/Picard supplier chain are not yet decomposed or source-closed. The statement of item 76 is not refuted; its compressed proof imports missing results.

- **G6 — open: General-A motives, projectivity and good reduction.** Not closed: naming an external supplier or design work does not discharge source/proof/API closure. The A-motive theory (Hartl–Juschka, Goss) and reduction of A-finiteness or abelianness at almost all primes are supplier inputs.

- **G7 — resolved: Corrected abelian-motive tau-z presentation.** Independent review supplies the explicit untwisted row-motive quotient in item 111, with coefficient map, exactness and equivariance proofs. This resolves the presentation convention only; projectivity/good reduction remain G6 and determinant adapters G8.

- **G8 — open: Finish proof-interior and baseline adapters.** Not closed: naming an external supplier or design work does not discharge source/proof/API closure. The remaining proof-interior and baseline adapters are design work; Corollary 6.5's principality is argued in item 100's note.

The independent review report gives each source-finding verdict, mathematical repair, declaration/ownership evidence, and original-item audit. Its validation section distinguishes executed finite-field diagnostics from general proof and from Lean implementation. No Lean file was compiled.

## Item statements

The following current ledger is generated from the reviewed JSON; definition API and tests remain in that JSON.

### 1. Function-field coefficient and completion datum

**planned · definition.** §1.1, p. 4

Fix the coefficient datum in the conventions: A= {a in K: v_P(a)>=0 for P != infinity}, O_L is the integral closure in finite L/iota(K), and L_infinity=L tensor_K K_infinity. Infinity need not be rational, nor A principal.

### 2. Gauss coefficient extension and Tate algebra

**missing · construction.** §1.1, pp. 4–5

Extend v_infinity to K_infinity(z) by the minimum valuation of polynomial coefficients and subtraction on quotients. Its polynomial completion is T_z(K_infinity)=F_infinity[z]((pi)); its rational completion is Ktilde_infinity=F_infinity(z)((pi)). Put Atilde=F_q(z) tensor A, Otilde_L=F_q(z) tensor O_L, and T_z(L_infinity)=L_infinity tensor_K_infinity T_z(K_infinity).

Independent review: use item 110 for the generic Tate algebra and operations and item 109 for the existing restricted-series criterion. This item remains missing only for the function-field Gauss/Laurent coefficient identifications and Frobenius adapters.

### 3. Zeroth Fitting ideal

**planned · definition.** §1.2, p. 5

For a finitely presented module M over a commutative ring R, choose R^a -> R^b -> M -> 0 and take the ideal of b by b minors; it is zero if a<b and the unit ideal for the zero module. The construction is independent of the presentation.

Independent review: import the common Fitting-ideal carrier from upstream StableReduction Layer 0, whose Layer 1 consumes its base-change API. IHG.6 and PadicMeasuresIwasawaAlgebras:L6 are consumers/extensions, not a second carrier.

### 4. Fitting ideal of a direct sum

**missing · theorem.** §1.2(1), p. 5

For finitely presented R-modules M,N, Fitt_0(M direct-sum N)=Fitt_0(M) Fitt_0(N).

Independent review: the current IHG.6 description imports Fitting APIs but does not explicitly supply this general-ring signature. Route the additional theorem to IHG.6 using the upstream carrier in item 3; do not infer implementation or exact planning from a consumer reference.

### 5. Fitting and annihilator bounds

**missing · theorem.** §1.2(2), p. 5

For finitely presented M generated by b elements, Ann_R(M)^b subset Fitt_0(M) subset Ann_R(M).

Independent review: the current IHG.6 description imports Fitting APIs but does not explicitly supply this general-ring signature. Route the additional theorem to IHG.6 using the upstream carrier in item 3; do not infer implementation or exact planning from a consumer reference.

### 6. Fitting submultiplicativity in exact sequences

**missing · theorem.** §1.2(3), p. 5

For a short exact sequence of finitely presented R-modules 0->M1->M->M2->0, Fitt_0(M1) Fitt_0(M2) subset Fitt_0(M).

Independent review: the current IHG.6 description imports Fitting APIs but does not explicitly supply this general-ring signature. Route the additional theorem to IHG.6 using the upstream carrier in item 3; do not infer implementation or exact planning from a consumer reference.

### 7. Arbitrary base change of a Fitting ideal

**missing · theorem.** §1.2(4)–(5), p. 5; corrected E1

For a ring map f:R->S and finitely presented M, Fitt_0,S(S tensor_R M)=Ideal.map(f,Fitt_0,R(M)). In particular quotienting R by I gives the image ideal. Do not identify the image ideal with S tensor_R Fitt_0,R(M) without injectivity of its canonical map.

Independent review: the current IHG.6 description imports Fitting APIs but does not explicitly supply this general-ring signature. Route the additional theorem to IHG.6 using the upstream carrier in item 3; do not infer implementation or exact planning from a consumer reference.

### 8. Dedekind torsion-module elementary divisors

**missing · theorem.** §1.2, last paragraph, p. 5

For a Dedekind domain R and finitely generated torsion M, M is a finite direct sum of R/I_j for nonzero ideals I_j; Fitt_0(M)=product I_j. The ideals need not be principal.

### 9. Exact Fitting multiplicativity over a Dedekind domain

**missing · theorem.** §1.2, last paragraph, p. 5

For a short exact sequence of finitely generated torsion modules over a Dedekind domain, Fitt(M)=Fitt(M1) Fitt(M2). Torsion and finite generation are retained.

### 10. Discrete full A-lattice

**missing · definition.** Definition 1.1, p. 5; E2

For k=F_q or F_q(z), let R=k tensor A and V a finite-dimensional k_infinity-vector space, with its valuation topology. An R-lattice M subset V is an R-submodule which is discrete and spans V over k_infinity. No freeness is part of the definition.

### 11. Criterion for a discrete submodule

**missing · theorem.** Lemma 1.2, pp. 5–6

An R-submodule M of V is discrete iff it contains an R-free submodule generated by a finite k_infinity-linearly independent family such that the quotient is finite-dimensional over k. The family need not span V.

### 12. Three full-lattice criteria

**missing · theorem.** Proposition 1.3, p. 6

For n=dim_k_infinity V, M is an R-lattice iff it is discrete, finitely generated and of rank n; equivalently it contains the R-span of a k_infinity-basis with finite-dimensional k-quotient.

### 13. Rank-one lattice ratio

**missing · construction.** §1.3, unnumbered rank-one lattice-ratio construction before Remark 1.4, p. 6 (HAL v2)

For one-dimensional V, choose e !=0 and write M=alpha I e, M'=alpha' I' e with nonzero fractional R-ideals I,I'. Define [M':M]_R=(alpha/alpha') I (I')^(-1) inside k_infinity. Prove independence of e and the decompositions.

### 14. Determinant lattice and general ratio

**missing · construction.** §1.3, pp. 6–7

For an R-lattice M in n-dimensional V, take the image of exteriorPower_R^n M in exteriorPower_k_infinity^n V. Define [M':M] by the rank-one ratio of these determinant lattices, with exterior degree zero interpreted as R inside k_infinity.

### 15. Steinitz-coordinate ratio

**missing · theorem.** §1.3, pp. 6–7; Bourbaki VII §4

For n>=1 and decompositions M=R e1+...+R e_(n-1)+I e_n and M'=R f1+...+R f_(n-1)+J f_n, if sigma(e_i)=f_i, then [M':M]=det(sigma)^(-1) I J^(-1). The finite torsionfree/projective Steinitz decomposition is a required algebraic input, not a choice of free basis.

### 16. Ratio inverse and cocycle laws

**missing · theorem.** §1.3, p. 7

For lattices M1,M2,M3 in the same V, [M1:M2]=[M2:M1]^(-1) and [M1:M3]=[M1:M2][M2:M3]; rank-one lattices in k_infinity form an abelian group.

### 17. Index is the Fitting ideal

**missing · theorem.** Proposition 1.5, p. 7

If M' subset M are R-lattices in V, M/M' is finitely generated torsion and [M:M']=Fitt_R(M/M').

### 18. Determinant-index formula

**missing · theorem.** Corollary 1.6, p. 7

For a k_infinity-linear automorphism sigma of V and R-lattices with sigma(M) subset M', [M':M]=det(sigma)^(-1) Fitt_R(M'/sigma(M)).

### 19. Positive Frobenius Ore algebra

**planned · construction.** §2, p. 7; corrected E3

For an F_q-algebra R, construct matrices of additive skew polynomials with tau B=B^(q) tau and nonnegative tau powers. On perfect coefficient fields inverse twists may separately be defined; negative tau powers do not belong to this polynomial ring.

Generic SkewPolynomial is present, but the q-Frobenius action, matrix/additive-endomorphism comparison and this specialization remain planned.

### 20. Anderson A-module in arbitrary coefficient ring

**missing · definition.** §2, pp. 7–8

For a field R over F_q with iota:A->R and d>=1, an Anderson A-module is an F_q-algebra homomorphism E:A->Mat_d(R){tau}, whose constant-term map partial_E satisfies (partial_E(a)-iota(a)I)^d=0 for all a, and whose image is not contained in Mat_d(R). An integral model means every coefficient lies in O_L. Drinfeld modules are the dimension-one case.

### 21. Point and Lie module functors

**missing · construction.** §2, p. 8

For an E-compatible coefficient algebra B, E(B)=B^d with action E_a, while Lie_E(B)=B^d with action partial_E(a). The constant-term map is an algebra homomorphism. Compatible coefficient maps induce maps of both A-modules.

### 22. Continuous Lie scalar extension and integral lattice

**missing · theorem.** §2, p. 8, citing Demeslay §2.1.2

For integral generic-characteristic E, partial_E uniquely extends continuously to K_infinity->Mat_d(L_infinity), and Lie_E(O_L) is an A-lattice in Lie_E(L_infinity) for this action.

### 23. Exponential and formal logarithm

**missing · construction.** §2, p. 8; Goss Theorem 5.9.6 and Anderson 1986

For integral E there are unique series exp_E=I+sum_(i>=1)e_i tau^i and log_E=I+sum_(i>=1)l_i tau^i with coefficients in Mat_d(L), satisfying exp_E partial_E(a)=E_a exp_E and log_E E_a=partial_E(a) log_E. They are two-sided inverses in the formal skew-series ring.

### 24. Entire exponential and local inverse

**missing · theorem.** §2, pp. 8–9; convergence inputs

exp_E converges on all Lie_E(L_infinity). On a sufficiently small valuation ball it and log_E are inverse isometries. Neither global surjectivity on L_infinity nor global convergence of log_E is asserted.

### 25. Exponential unit lattice

**missing · definition.** §2, ordinary unit module immediately before Proposition 2.2, p. 9 (HAL v2)

U(E/O_L)={x in Lie_E(L_infinity): exp_E(x) in E(O_L)}, with its inherited Lie A-action.

### 26. Class module

**missing · definition.** §2, pp. 8–9

H(E/O_L)=E(L_infinity)/(E(O_L)+exp_E(Lie_E(L_infinity))), with the point-module A-action, not the Lie action.

### 27. Unit theorem for integral Anderson modules

**missing · theorem.** §2, p. 9

For integral E, U(E/O_L) is an A-lattice in Lie_E(L_infinity), H(E/O_L) is finite, and 0->U->Lie_E(L_infinity)->E(L_infinity)/E(O_L)->H->0 is exact. The higher-dimensional extension of Taelman 2010 is a proof obligation in G2.

### 28. z-deformation of an Anderson module

**missing · construction.** §2, p. 9

If E_a=sum_i E_(a,i) tau^i, define Etilde_a=sum_i z^i E_(a,i) tau^i, with tau acting on coefficients by q-Frobenius and fixing z. Extend by F_q(z)-linearity to Atilde on Otilde_L-compatible modules. Specialization at z=1 gives E and at z=0 gives partial_E.

### 29. Deformed exponential and logarithm

**missing · construction.** Lemma 2.1(1)–(2), formal exponential and logarithm equations, p. 9 (HAL v2)

Define exp_Etilde=sum_i z^i e_i tau^i and log_Etilde=sum_i z^i l_i tau^i, with e_0=l_0=I. They satisfy the deformed functional equations and are inverse formal series.

### 30. Tate convergence of the deformed exponential

**missing · theorem.** Lemma 2.1, unnumbered analytic conclusion and proof, pp. 9–10 (HAL v2)

exp_Etilde converges on T_z(L_infinity)^d and on Ltilde_infinity^d; on a sufficiently small ball it is an isometric bijection with inverse log_Etilde. Evaluation at z=1 intertwines exp_Etilde and exp_E.

### 31. Polynomial z-units

**missing · definition.** §2, p. 10

U_z={x in Lie_Etilde(T_z(L_infinity)): exp_Etilde(x) in Etilde(O_L[z])}, an A[z]-module. Polynomial refers to the exponential's target, not to requiring x itself to be polynomial.

### 32. Rationally deformed unit lattice

**missing · definition.** §2, p. 10

U_rat={x in Lie_Etilde(Ltilde_infinity): exp_Etilde(x) in Etilde(Otilde_L)}, an Atilde-module.

### 33. Finite generation and rationalization of units

**missing · theorem.** §2, p. 10, citing Arithmetic of function fields units, Proposition 1

U_z is finitely generated over A[z]; U_rat is an Atilde-lattice and equals the F_q(z)-span of U_z in Lie_Etilde(Ltilde_infinity).

### 34. Polynomial deformed class module

**missing · definition.** §2, p. 10

H_z=Etilde(T_z(L_infinity))/(Etilde(O_L[z])+exp_Etilde(Lie_Etilde(T_z(L_infinity)))), with its A[z]-action.

### 35. Rational deformed class module

**missing · definition.** §2, p. 10

H_rat=Etilde(Ltilde_infinity)/(Etilde(Otilde_L)+exp_Etilde(Lie_Etilde(Ltilde_infinity))), with its Atilde-action.

### 36. Polynomial class torsion and invertibility of z

**missing · theorem.** Proposition 2.2(1), p. 10

H_z is finitely generated torsion over F_q[z], and multiplication by z is injective and surjective. The proof uses exp_Etilde congruent I modulo z and finite generation; no invalid local Nakayama inference over F_q[z] is allowed.

### 37. Vanishing of the rational deformed class module

**missing · theorem.** Proposition 2.2(2), p. 10

H_rat=0. Rationalizing the polynomial class module kills it; the dense-span and small-ball argument must identify this rationalization with H_rat.

### 38. Evaluation and Stark units

**missing · construction.** §2, pp. 10–11

Evaluation ev_1:T_z(L_infinity)^d->L_infinity^d is onto with kernel (z-1)T_z(L_infinity)^d and is A-linear from the deformed to the original Lie action. Define U_St(E/O_L)=ev_1(U_z), an A-submodule of U.

### 39. Stark quotient and class-module Fitting ideal

**missing · theorem.** §2, equation (2.1), p. 10 (HAL v2)

U_St is an A-lattice, U/U_St is finite and Fitt_A(U/U_St)=Fitt_A(H). Obtain the quotient through H_z[z-1], with kernel/cokernel multiplicativity for z-1 on the finite A-module H_z. The all-dimensional input is G2; the 2017 Theorem 2.7 inspected directly proves the Drinfeld case.

### 40. Local Fitting factor

**missing · definition.** §3.1, p. 11

For a nonzero ideal I of O_L, Z_I(E/O_L)=Fitt_A(Lie_E(O_L/I)) Fitt_A(E(O_L/I))^(-1), as a fractional A-ideal inside K_infinity. Both modules are finite A-torsion modules.

### 41. Deformed local Fitting factor

**missing · definition.** §3.1, p. 11

Ztilde_I=Fitt_Atilde(Lie_Etilde(Otilde_L/I Otilde_L)) Fitt_Atilde(Etilde(Otilde_L/I Otilde_L))^(-1), a fractional Atilde-ideal in Ktilde_infinity.

### 42. Coprime ideal factorization

**missing · theorem.** Lemma 3.1, p. 11

For nonzero coprime ideals I,J in O_L, Z_(IJ)=Z_I Z_J; likewise for the deformed factors. Apply the Chinese remainder isomorphism to both A-actions.

### 43. Infinitesimal layers have identical point and Lie actions

**missing · theorem.** Proof of Lemma 3.2, pp. 11–12

For a nonzero ideal I and n>=1, on (I^n/I^(n+1))^d all positive Frobenius terms of E vanish since q n>=n+1. Thus E and Lie_E have the same action on this quotient, also after deformation.

### 44. Power independence of local factors

**missing · theorem.** Lemma 3.2, pp. 11–12

For any nonzero ideal I and integer n>=1, Z_(I^n)=Z_I and Ztilde_(I^n)=Ztilde_I. Apply exact Fitting multiplicativity successively to the infinitesimal layers.

### 45. Radical-prime factorization

**missing · theorem.** Proposition 3.3, p. 12

For every nonzero I, Z_I is the product of Z_P over prime ideals P containing I, each prime once regardless of its multiplicity in I; likewise for Ztilde_I.

### 46. Integral scalar conjugation

**missing · construction.** §3.2, p. 12

For xi in O_L nonzero, E'_a=xi^(-1) E_a xi has coefficients xi^(q^i-1) E_(a,i) and is integral, with partial_E'=partial_E. Its exponential is xi^(-1) exp_E xi, and xi U(E') subset U(E). The same formulas hold after z-deformation.

### 47. Conjugation regulator identity with class correction

**missing · theorem.** Lemma 3.4, pp. 12–13

For xi and E' as in item 46, Z_(xi)(E)=[U(E'):U(E)]_A Fitt_A(H(E))/Fitt_A(H(E')). The comparison is between lattices in the common Lie space.

### 48. Finite local product and deformed regulator identity

**missing · theorem.** Corollary 3.5 and Proposition 3.6, p. 13

For the primes containing xi, product Z_P(E)=[U(E'):U(E)] Fitt(H(E))/Fitt(H(E')); product Ztilde_P(E)=[U_rat(E'):U_rat(E)]_Atilde. The second equality uses H_rat=0.

### 49. Removing bad local factors by conjugation

**missing · theorem.** Lemma 3.7, p. 13; corrected E4

For xi in P, Z_P(E')=A and Ztilde_P(E')=Atilde because E'_a reduces to partial_E(a), including its nilpotent term. For xi not in P, multiplication by xi gives an isomorphism of reductions, so both local factors are unchanged.

### 50. Principal-specialization condition (P)

**missing · definition.** Definition 4.1, pp. 13–14

Integral E satisfies (P) if there is a finite set S of nonzero primes of O_L such that for each P not in S there is x_P(z) in A[z] with Fitt_Atilde(Etilde(F_P(z)))=x_P Atilde, Fitt_A(Lie_E(F_P))=x_P(0)A, and Fitt_A(E(F_P))=x_P(1)A, where F_P=O_L/P.

### 51. Admissibility and Euler convergence condition (C)

**missing · definition.** Definition 4.1, p. 14

With (P), require convergence to a nonzero element in Ktilde_infinity of product_(P notin S) x_P(0)/x_P(z). An integral Anderson A-module satisfying (P) and (C) is admissible. Convergence uses the infinity-adic Gauss valuation, not z-adic convergence.

### 52. Deformed Euler-product lattice

**missing · construction.** §4.1, p. 14

For admissible E and x(z)=product_(P notin S) x_P(0)/x_P(z), set Ltilde(E)=x(z) product_(P in S) Ztilde_P(E), a rank-one Atilde-lattice. Prove independence of S and the allowed generators rather than selecting one globally principal ideal.

### 53. Specialized Euler-product lattice

**missing · construction.** §4.1, p. 14

For admissible E, y=product_(P notin S) x_P(0)/x_P(1) converges nonzero in K_infinity; define L(E)=y product_(P in S) Z_P(E). Show choice independence and that, after enlarging S, the tail product converges in the units of T_z(K_infinity), making ev_1 legitimate.

### 54. Approximation of deformed units by integral vectors

**missing · theorem.** Lemma 4.4, pp. 14–15

Let n>=1 and suppose e_i in Mat_d(O_L) for 0<=i<n. With B=F_q[z]_(z), every nonzero u in U_rat has u=z^a(alpha+z^n beta), with a in Z, alpha in B O_L[z]^d not divisible by z and beta in B T_z(L_infinity)^d. Conversely every alpha in B O_L[z]^d has a lift alpha+z^n beta in B U_z. The subcase alpha in O_L^d is the version used to lift the identity.

The bound n>=1 is explicit and the full converse of Lemma 4.4 is retained; analytic supplier closure is G2.

### 55. Projective lift of the identity modulo z^n

**missing · construction.** Proof of Proposition 4.5, pp. 15–16

Under item 54, use the projectivity of Lie_E(O_L) over A to choose an A-linear map mu:Lie_E(O_L)->B U_z with mu(m) congruent m modulo z^n. Extend to the rational completed Lie space; its determinant lies in 1+z^n B T_z(K_infinity).

### 56. Approximation of the regulator lattice

**missing · theorem.** Proposition 4.5, pp. 15–16; corrected E5

Under the integrality of e_0,...,e_(n-1), every nonzero element x of [Lie_Etilde(Otilde_L):U_rat]_Atilde admits x=z^a(alpha+z^n beta), a in Z, alpha in B A not z-divisible and beta in B T_z(K_infinity). Expand each column with z^k, not z^j, and retain determinant cancellations below the first nonzero coefficient.

### 57. Exhausting sequence clearing exponential denominators

**missing · construction.** Theorem 4.3 proof Step 1, p. 17; corrected E6

Choose nonzero xi_n in O_L such that xi_n divides xi_(n+1), every nonzero prime contains some xi_n, and the first n coefficients of xi_n^(-1) exp_E xi_n are integral. Use finite prime sets in bounded residue degree and denominators of finitely many e_i.

### 58. Regulator containment with principal local factors

**missing · theorem.** Theorem 4.3 proof Step 1, p. 17

For admissible E with every Ztilde_P principal, the regulator lattice is contained in Ltilde(E). First apply scalar conjugation (49) to remove the finite primes outside (P) and the finitely many factors not yet normalized as Tate units, then prove the normalized case and restore these finite local factors using 48. In that case y_n^(-1) is a product of polynomial ratios x_P(z)/x_P(0), each of constant term 1. Hence ord_z(u/y_n)=ord_z(u). Item 56 at n=1 gives u=z^a h/f with h in the Tate algebra and f in F_q[z], f(0) nonzero. A fixed such denominator and the Tate limit of y_n^(-1) put u/y in z^a f^(-1)T_z. To infer u/y in Atilde, prove coefficientwise integrality after this same denominator has been cleared and use discreteness of A to make the restricted series a polynomial. The compatibility of this normalization with the approximating congruences remains the explicit proof obligation G3.

Independent review: the inherited argument skipped finite exceptional generators and uniform denominator compatibility. G3 is reopened; no failure of the theorem is asserted.

### 59. Deformed class-formula containment

**missing · theorem.** Theorem 4.3 and proof Step 2, pp. 14, 17–18; E7

For every admissible integral E, [Lie_Etilde(Otilde_L):U_rat]_Atilde subset Ltilde(E). Remove the finite exceptional set by a nonzero scalar conjugation, apply the principal case and restore exactly the deformed local factors.

### 60. Euler-characteristic valuation of regulator and class factor

**missing · theorem.** Lemma 4.6, p. 18, corrected E8; Taelman 2010 Theorem 2

For any nonconstant t in A, regarding integral E as an Anderson F_q[t]-module, [Lie_E(O_L):U]_F_q[t] Fitt_F_q[t](H)=alpha_t F_q[t] for a nonzero alpha_t in F_q((1/t)) with v_infinity(alpha_t)=0; the same is [Lie_E(O_L):U_St]_F_q[t]. The generator is not asserted to lie in F_q[t].

### 61. Finiteness of the affine ideal class group

**library · theorem.** Theorem 4.7 proof, p. 19; pinned affine-class-number theorem

For a Dedekind k-subalgebra R of an algebraic function field F/k with fraction field F and finite k, ClassGroup(R) is finite. Apply to A, after matching its affine-model structure.

Statement and standing hypotheses read in TauCeti/FieldTheory/FunctionField/RiemannRoch/AffineClassNumber.lean:70–109. No rational place or separability hypothesis is added.

### 62. Specialization of the regulator containment

**missing · theorem.** Equation (4.4), proof of Theorem 4.7, pp. 18–19

For admissible E, evaluate polynomial-unit lifts at z=1 and use their determinant ideals to obtain [Lie_E(O_L):U_St]_A subset L(E). No evaluation homomorphism on all of F_q(z) or Ktilde_infinity is used.

### 63. Class-group and norm upgrade from containment to equality

**missing · theorem.** Theorem 4.7 proof, p. 19

In the principal-local-factor reduction of Theorem 4.7, write L(E)=uA with v_infinity(u)=0 and I=u^(-1)[Lie_E(O_L):U_St] subset A. Raise I to a principal power using finite ClassGroup(A), restrict the determinant index to F_q[t], and use the norm plus item 60 to show its principal generator has degree zero. Then I=A. Norm/restriction compatibility is an explicit input G4.

### 64. Class formula for admissible Anderson A-modules

**missing · theorem.** Theorem 4.7, pp. 18–19

For every admissible Anderson A-module E defined over O_L in the generic-characteristic setting, [Lie_E(O_L):U_St(E/O_L)]_A=L(E/O_L). Neither freeness of O_L nor rationality of infinity nor uniformizability of E is assumed.

### 65. Ordinary-unit form of the class formula

**missing · theorem.** Equation (2.1) combined with Theorem 4.7

Under item 64's hypotheses, L(E/O_L)=[Lie_E(O_L):U(E/O_L)]_A Fitt_A(H(E/O_L)), by the Stark quotient formula and the index cocycle.

### 66. Equality in the deformed class formula

**missing · theorem.** Remark 4.8, p. 19

For admissible E, [Lie_Etilde(Otilde_L):U_rat]_Atilde=Ltilde(E). Remark 4.8 proposes the same argument over F_q(z); its Euler-characteristic and class-group inputs must be justified separately, not inferred from local compactness over a finite residue field.

### 67. Finite-field cyclic scalar decomposition

**missing · construction.** Proof of Lemma 5.1, pp. 19–20

For F/F_q finite of degree m and V=F(z)^d, let tau on F(z) act as q-Frobenius on F and fix z. The map psi(l tensor s)=(tau^j(l)s)_(0<=j<m) identifies F(z) tensor_(F_q(z)) V with m copies of V. On constants l in F this is (l*s,l^q*s,...); on rational functions it is coefficient Frobenius, not literal qth power. The operator 1 tensor tau becomes the cyclic twisted shift of (5.1).

### 68. Characteristic polynomial of a deformed semilinear operator

**missing · definition.** Lemma 5.1, pp. 19–20

For r>=1 and A_i in Mat_d(F), put f=sum_(i=0)^r A_i z^i tau^i on F(z)^d, with tau fixing z, and chi(X,z)=det_F_q(z)(X I-f), a monic degree dm polynomial in X with coefficients in F_q[z].

### 69. Residue-degree grading of the characteristic polynomial

**missing · theorem.** Lemma 5.1(i), p. 20

Under item 68, chi(X,z) belongs to F_q[X,z^m]. In each determinant monomial the total shift is zero modulo m; this also holds when the characteristic divides m.

### 70. Degree drop of nonconstant deformation coefficients

**missing · theorem.** Lemma 5.1(ii) and its determinant proof, p. 20

Under item 68, deg_X(chi(X,z)-chi(X,0)) <= dm-m/r, with degree of zero interpreted as minus infinity. The determinant proof more precisely gives deg_X([z^s]chi)<=dm-ceil(s/r) for each s>0.

### 71. Polynomial-ring local characteristic generator

**missing · construction.** Theorem 5.2 proof, p. 21

For A=F_q[t] and integral E, define x_P(t,z)=det_F_q(z)(t I-Etilde_t on F_P(z)^d). It lies in F_q[t,z], is monic in t, generates Fitt_Atilde(Etilde(F_P(z))) and specializes to the Lie and point Fitting generators at z=0,1.

### 72. Admissibility over a polynomial coefficient ring

**missing · theorem.** Theorem 5.2, p. 21

If A=F_q[t], every integral Anderson A-module E is admissible. The degree-drop bound and finiteness of primes in each bounded residue degree prove convergence of its Euler product.

### 73. Class formula for every Anderson F_q[t]-module

**missing · theorem.** After Theorem 5.2, p. 21

For A=F_q[t] and integral E of any dimension, [Lie_E(O_L):U_St]_A=L(E)=[Lie_E(O_L):U]_A Fitt_A(H). This extends the existing DM.6 Drinfeld-only target rather than redescribing it.

### 74. Residue-degree descent of the local Fitting ideal

**missing · theorem.** Proposition 5.3, pp. 21–24

For F/F_q finite of degree m and an Anderson A-module E/F, Fitt_Atilde(Etilde(F(z))) is extended from an ideal of A tensor_F_q F_q(z^m). Use the finite presentation after cyclic scalar decomposition. Give its jth block basis degree -j modulo m: the deformed operators preserve this grading, so its relation module is generated by homogeneous relations (no nonnegative lower bound j+j0 is imposed). In every maximal minor the z-exponent is fixed modulo m, because the sum of row degrees and the full multiset of column degrees are fixed. After inverting z, divide each minor by the corresponding power of z to obtain generators in A_F[z^m,z^(-m)]. Localize to F(z^m), then descend the coefficient field using faithful flatness and the equality of the extended ideal with its scalar-base-changed Fitting ideal. The coefficient descent and Picard proof must be split into exact lemmas under G5.

Independent review: the congruence grading repairs E9/E10, but the previous one-sentence replacement did not supply all determinant/faithful-flatness proof interfaces; G5 is reopened.

### 75. Injection on Picard groups under rational constants

**missing · theorem.** Lemma 5.4, p. 24

The extension map Pic(A)->Pic(Atilde) is injective. The statement is about ideal classes; choosing a principal generator after extension does not yet supply good specializations at z=0 or 1.

### 76. Torsion Picard classes under rational constants

**missing · theorem.** Lemma 5.4, p. 24

Via item 75, Pic(Atilde)_tors = Pic(A). Proof: J(F_q(z)) = J(F_q), since every morphism P¹ → J is constant; Cl⁰(K(z)) = J(F_q(z)) because X has a divisor of degree one over F_q, so Br(F_q(z)) → Br(X_{F_q(z)}) is injective; the degree quotients are both Z/d∞Z.

Jacobian input made explicit by cc-442dc5, 23 September 2026 (simpler than the source's Mordell–Weil argument).

### 77. Picard injection under z to z^m

**missing · theorem.** Last assertion of Lemma 5.4, pp. 24–25

For m ≥ 1, extension Pic(A ⊗ F_q(z^m)) → Pic(Atilde) is injective: the norm from K(z) to K(z^m) shows a class in the kernel is torsion, hence (item 76 for z^m) comes from Pic(A), I = J·δ; then J·Ã is principal and item 75 makes J, hence I, principal.

### 78. Valuation bound on polynomial reciprocal roots

**missing · theorem.** Lemma 5.5, p. 25

Let F(z) in K_infinity[z], F(0)=1, deg F<r with r>=1, and v_infinity(F-1)>=C>=1 in the Gauss valuation. Factor F as product_(i=1)^r (1-alpha_i z), padding with zero alpha_i; then v_infinity(alpha_i)>=C/r, with v(0)=infinity.

### 79. Almost-everywhere principal deformed local ideals

**missing · definition.** Theorem 5.6 hypothesis, p. 25

Condition (P') for integral E is: there exists a finite set S of nonzero primes of O_L such that Fitt_Atilde(Etilde(F_P(z))) is principal for every P outside S. Neither specialization generators nor convergence are assumed.

### 80. Primitive generators with residue-degree grading

**missing · construction.** Theorem 5.6 proof, pp. 25–26

Under (P'), use items 74 and 77 to choose generators x_P(z) in A[z^m_P], primitive with respect to F_q[z] factors; remove constant-field polynomial factors before specializing. Compare their norms to the F_q[t] characteristic generators after choosing a separating t in A.

### 81. Uniform root bound and Euler convergence from (P')

**missing · theorem.** Theorem 5.6 proof, pp. 25–26; E11

For a fixed separating t and E_t=sum_(i=0)^r A_i tau^i, r>=1, the norm characteristic polynomial G_P(z)/G_P(0) has degree at most d*r in Y=z^m_P, with reciprocal roots of valuation at least m_P*(-v_infinity(t))/r. Norm-factor comparison bounds the roots of x_P(z)/x_P(0) similarly, hence these ratios tend to 1 and their product is a Tate-algebra unit. The weaker unweighted Lemma 5.5 estimate also suffices for convergence with a dimension-dependent constant.

### 82. Specialization equality from ideal inclusions and degrees

**missing · theorem.** End of proof of Theorem 5.6, p. 26

For the primitive generators of item 80, base-change gives Fitt_A(E(F_P)) subset x_P(1)A and Fitt_A(Lie_E(F_P)) subset x_P(0)A. The root bound makes v_infinity(x_P(z)), v_infinity(x_P(0)), v_infinity(x_P(1)) equal; matching dimensions and deg(aA)=-d_infinity*v_infinity(a) upgrades both inclusions to equalities.

### 83. Principality criterion for admissibility

**missing · theorem.** Theorem 5.6 and Remark 4.2, pp. 14, 25–26

Every integral Anderson A-module satisfying (P') is admissible. Together with the evident (P) implication, admissibility is equivalent to almost-everywhere principality of these deformed local Fitting ideals.

### 84. Perfect coefficient extension for motives

**missing · construction.** §6, p. 27

Put F=L^perf and O_F the integral closure of A. Each prime P of O_L has a unique prime Q of O_F above it and O_L/P -> O_F/Q is an isomorphism. Define tau(x)=x^q and sigma(x)=x^(1/q) on F; on auxiliary z-extensions these maps fix z.

### 85. Dual A-motive

**missing · construction.** §6.1, p. 27

For E/F of dimension d, take columns F{tau}^d with A acting by left E, F acting by right scalar multiplication, and sigma acting by right multiplication by tau. This gives a left (A tensor F){sigma}-module, free of rank d over F{sigma}; (a tensor1-1 tensor iota(a))^d M subset sigma M.

### 86. A-finite Anderson module

**missing · definition.** §6.1, p. 27; Hartl–Juschka Definition 2.5.9

E is A-finite if its dual A-motive is finitely generated over A tensor F; this is independent of the perfect coefficient extension. Finite generation over the commutative ring is additional to automatic rank-d freeness over the skew ring.

### 87. Projectivity and almost-all reduction of an A-finite motive

**missing · theorem.** §6.1, p. 27; Goss Lemma 5.4.10

For A-finite E, its dual motive is projective over A tensor F. Outside finitely many primes of O_L, its reduction is A-finite. Keep projectivity and good reduction as separately verified external inputs G6, rather than conclusions of a name.

### 88. A-finite Frobenius characteristic polynomial

**missing · construction.** Theorem 6.1 proof, p. 27

At an A-finite reduction E/F_P, put V=M(E/F_P) tensor_A K and let sigma be induced by right multiplication by tau. It is K-linear; define P_P(X)=det_K(X I-sigma), which belongs to A[X]. The K-dimension includes the residue-field extension, not merely the motive rank over A tensor F_P.

### 89. Dual-motive cokernel computes the local Fitting ideal

**missing · theorem.** Equation (6.1), p. 27

At an A-finite reduction, after the appropriate z-scalar extension, right multiplication by tau-z gives an injective Atilde-linear map of the projective dual-motive module with cokernel Etilde(F_P(z)). Therefore Fitt_Atilde(Etilde(F_P(z)))=P_P(z)Atilde, up to the harmless determinant sign unit.

### 90. Admissibility of A-finite Anderson modules

**missing · theorem.** Theorem 6.1, p. 27

Every A-finite Anderson A-module defined over O_L is admissible: good reductions satisfy principal deformed local Fitting ideals by item 89 and the remaining set is finite.

### 91. Contravariant A-motive

**missing · construction.** §6.2, pp. 27–28

For E/F, take row vectors M(E/F)=F{tau}^(1 by d), with left F{tau}-action and right A-action m.a=m E_a, regarded as commuting left actions of A tensor F and tau. It is free of rank d over F{tau}, and (a tensor1-1 tensor iota(a))^d M subset tau M.

### 92. Abelian Anderson module

**missing · definition.** §6.2, p. 28; Hartl–Juschka Definition 2.5.5

E is abelian if the contravariant A-motive is finitely generated over A tensor F; the definition is independent of F. It is not the same definition as A-finiteness.

### 93. Projectivity and almost-all abelian reduction

**missing · theorem.** §6.2, p. 28

For abelian E the motive is projective over A tensor F, and all but finitely many reductions E/F_P are abelian. The spreading-out proof is a required external input G6.

### 94. Dedekind finite-module duality

**missing · theorem.** Lemma 6.2, p. 28

Let k be a field, R a Dedekind k-algebra and M an R-module finite-dimensional over k. With (r.f)(m)=f(rm), Hom_k(M,k) is noncanonically isomorphic to M as an R-module. When R is a field use finite-dimensional R-linear duality; otherwise reduce to R/P^n and compare annihilator exponent and k-dimension.

### 95. Trace adjoint of a deformed finite-field action

**missing · construction.** Theorem 6.3 proof, pp. 28–29; corrected E13–E14

For F/F_q finite and Etilde_a=sum_(i>=0) z^i A_i tau^i on F(z)^d, equip F(z)^d with trace pairing <x,y>=Tr_F(z)/F_q(z)(x^T y). The adjoint action is Etilde_a^*=sum_(i>=0) z^i sigma^i(A_i^T) sigma^i, including i=0. In a basis with Gram matrix G its matrix is G^(-1)[Etilde_a]^T G, not necessarily the ordinary transpose in a normal basis.

### 96. Abelian-motive cokernel and principal local ideal

**missing · theorem.** Theorem 6.3 proof, pp. 28–29; E12–E14

Let E/F_P be abelian. On the untwisted row motive M=F_P(z){tau}^{1 by d}, use the original right action m.a=m E_a (without z^i in E_a) and left tau. The Atilde-linear injective endomorphism T=tau-z has cokernel the trace-adjoint deformed point module by item 111. The motive is finite projective over Atilde after finite coefficient restriction (93). Thus item 18 gives Fitt_Atilde(coker T)=(det_Atilde T), and items 94–95 identify its Fitting ideal with that of Etilde(F_P(z)). It is principal. Determinant here is on the finite projective Atilde-module, not on the skew-ring rank d.

Independent review: the prior phrase “tau twisted by z” would insert z twice. The explicit quotient in item 111 closes this presentation calculation. General-A projectivity and good reduction remain G6, and the determinant adapter remains G8.

### 97. Admissibility of abelian Anderson modules

**missing · theorem.** Theorem 6.3, pp. 28–29

Every abelian Anderson A-module defined over O_L is admissible, using the principal local ideal at almost every reduction.

### 98. Class formula for abelian or A-finite Anderson modules

**missing · theorem.** Theorem 6.4, p. 29

If integral E is abelian or A-finite (either hypothesis suffices), [Lie_E(O_L):U_St]_A=L(E/O_L). Equivalently this equals [Lie_E(O_L):U]_A Fitt_A(H).

### 99. Drinfeld modules are abelian and A-finite

**missing · theorem.** §6.3, p. 29, citing Hartl–Juschka Corollary 2.5.17

Every Drinfeld A-module in the stated field setting is both abelian and A-finite; apply this to the generic fibre of an integral Drinfeld module. Proof and rank/convention dictionary are external input G6.

DM.4's motive equivalence is only over F_q[t]; the arbitrary-A proof is not supplied by that specialization. Conservatively classified as missing, pending resolution of G6.

### 100. Class formula for arbitrary-coefficient Drinfeld modules

**missing · theorem.** Corollary 6.5, p. 29

For any Drinfeld A-module phi defined over O_L, L(phi/O_L) is well-defined and a principal A-lattice in K_infinity, and [O_L:U_St(phi)]_A=[O_L:U(phi)]_A Fitt_A(H(phi))=L(phi/O_L). Principality is a distinct assertion requiring its local/motive justification, not a property of every Dedekind ideal.

Principality (cc-442dc5, 23 September 2026): each local factor Z_P(φ) is principal, since the reduction of φ at P is either constant (Z_P = A) or a Drinfeld module over F_P, whose Fitting ideals are generated by P_π(0) and P_π(1) for the characteristic polynomial P_π of Frobenius (Gekeler); so L(φ/O_L) is principal.

### 101. Steinitz classification of finite projectives

**planned · theorem.** §1.3, pp. 6–7, invoking Bourbaki VII §4 no. 6; owner KTheoryLowDegrees Z.4

For a Dedekind domain R and finite projective module P of positive rank n, there is an invertible ideal I with P isomorphic to R^(n-1) direct-sum I; the ideal class is determined by det(P). Treat rank zero separately. Apply after proving that the discrete lattices are finite torsionfree and hence projective.

### 102. Ideal class group and Picard group comparison

**library · theorem.** Lemma 5.4 and Theorem 4.7; pinned Picard-group comparison

For a commutative domain R, there is a multiplicative equivalence ClassGroup(R) ≃ Pic(R). Transport finiteness of ClassGroup(A) through this equivalence when the source writes Pic(A).

Read Mathlib/RingTheory/PicardGroup.lean:876; only CommRing and IsDomain are required.

### 103. Norm-compatible determinant restriction of scalars

**planned · theorem.** Theorem 4.7 proof p. 19 and Theorem 5.6 pp. 25–26; Stark units 2017 Lemma 2.10 proof; KTheoryLowDegrees Z.4

For a finite flat extension of Dedekind domains R->S, with fraction fields K->L, restriction of two same-rank S-projective lattices identifies their relative determinant ratio with the norm of the S-relative determinant ratio. The determinant of S itself cancels only in the relative ratio. For finite S-torsion M, Fitt_R(M)=Norm_(S/R)(Fitt_S(M)).

The norm/determinant transfer is explicitly in Z.4's scope. The completed-field compatibility and function-field specialization still need G4.

### 104. Nondegeneracy of the separable trace pairing

**library · theorem.** Independent review baseline adapter

For a finite-dimensional separable field extension L/K, (x,y) -> Tr_(L/K)(xy) is nondegenerate. Finite fields and their rational-constant extensions satisfy these hypotheses.

### 105. Torsionfree modules over Dedekind domains are flat

**library · theorem.** Independent review baseline adapter

For a commutative Dedekind domain R and an R-module M, Flat R M iff torsion R M is bottom. In particular IsTorsionFree R M gives Flat R M; no finite-generation hypothesis is needed.

### 106. Finitely presented flat modules are projective

**library · theorem.** Independent review baseline adapter

Over a commutative ring R, a flat finitely presented R-module M is projective. A consumer starting from finite generation must separately supply finite presentation (for example using Noetherianity); neither freeness nor motive finiteness is inferred.

### 107. Primary decomposition of finite Dedekind torsion modules

**library · theorem.** Independent review baseline adapter

For a commutative Dedekind domain R and a finite torsion R-module M, the submodules killed by the powers of the prime factors of annihilator(M) form an internal direct sum equal to M. This is primary decomposition, not the further decomposition into cyclic quotients used by item 8.

### 108. Existence of a normal basis

**library · theorem.** Independent review baseline adapter

For a finite Galois field extension L/K, IsGalois.normalBasis K L is a K-basis indexed by Gal(L/K), and its value at g is g applied to its value at the identity. It is not asserted self-dual for the trace pairing.

### 109. Restricted-series coefficient criterion

**library · theorem.** Independent review baseline adapter

For a normed ring R, real c and f in PowerSeries R, PowerSeries.IsRestricted c f iff ||coeff_n(f)|| c^n tends to zero as n tends to infinity. At c=1 this is the coefficient-decay carrier criterion; it does not itself identify the Gauss completion or prove a completion universal property.

### 110. Shared Tate algebra and evaluation interface

**planned · construction.** Upstream AdicSpaces Layer 0, §§0.3–0.5; HAL v2 §1.1 consumer

For a complete Hausdorff rank-one nonarchimedean field K, import the completed restricted power-series algebra K<z>, its polynomial density, substitution/evaluation at power-bounded elements, and finite-module restricted-series comparison from upstream AdicSpaces Layer 0. Item 2 supplies only the function-field, residue-field Laurent-series and coefficient-Frobenius adapters.

### 111. Explicit untwisted-motive quotient by tau minus z

**missing · construction.** Independent repair of HAL v2 Theorem 6.3, pp. 28–29; E12–E14 and E16

For E over finite F/F_q, let M=F(z){tau}^{1 by d} with right A-action by the original E_a and coefficient Frobenius fixing z. There is an Atilde-linear exact sequence 0 -> M --(left tau-z)--> M --rho--> Etilde(F(z))^* -> 0, where rho(sum c_n tau^n)=(sum z^n sigma^n(c_n))^T and the target has the trace-adjoint action of item 95.
