# Arithmetic Dirichlet series and Tauberian methods, Part II: analytic number theory and zeta functions

This is the AN.0–AN.7 planning pass of AnalyticNumberTheory. It begins where Arithmetic Dirichlet series and Tauberian methods stops: the arithmetic coefficient carriers, Euler products, Perron summation, Landau positivity and Tauberian transfer are imports. The additions concern canonical products and zero-free regions, explicit formulas and quantitative prime counts, arithmetic Hecke/Artin comparisons, multiplicative means and generalized prime systems, and the branch structure of Lerch functions. It does not reconstruct Tate's adelic analysis or qualitative Chebotarev.

Every declaration below is an unchecked plan. The packet is **complete as a planning pass**, in the sense of PROTOCOL §0: every target of every scoped stage has a declaration, a supplier request or a recorded gap at the end of its prerequisite chain. The open stages are **planned**, not closed. Source-proof acquisition, nonroutine analytic refinements and six native carrier signatures remain explicitly listed. This document neither asserts formalization nor certifies the original proofs of reviewed extractions.

The baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The reviewed library audit, accepted RS-07 restructuring, all 91 selected routed extraction payloads, and the 17 inherited nodes were read before this expansion. All 54 cited baseline declarations were read at those pins, including their hypotheses. Two upstream documents were read in full: ArithmeticDirichletSeries and Chebotarev. Their carrier and ownership contracts determine the boundaries here.

## Scope and ownership

AN.0, AN.1 and AN.6 are import-only under accepted RS-07 and have no active nodes. In particular, the pinned completed Riemann and primitive Dirichlet functional equations are not planned again. The seven inherited divisor-bound identifiers remain stable for the Erdos–Szemeredi consumer. AN.3 stays whole: the proposed incoming SV.2 edge is withheld until the maintainer can remove the existing AN.3→SV.2 edge atomically. No proof below treats that reverse import as available.

Generic arithmetic Dirichlet series and Tauberian methods remain in ADS; Tate continuation, functional equations, gamma factors and residues remain in AL.1; Hecke character carriers remain in GlobalNumberFields Layer 9. Qualitative number-field Chebotarev belongs to Chebotarev. Its document assigns effective Chebotarev to Zeros of L-functions 8.7, whose stage is not present in the supplied atlas, so this pass records an ownership proposal rather than inventing a prerequisite. Arithmetic-scheme Chebotarev routed by AV item20 needs the proposed arithmetic-scheme extension of that owner, beyond the present part. Random Euler-product models and correlation conjectures are imported from PM.5. Composite-modulus Gauss sums remain a requested FiniteFields FF.1 interface.

## Conventions that change the mathematics

**Convergence and continuation.** A convergent LSeries identity is stated on Re s>1 and does not identify a totalized sum outside that half-plane. The canonical continued Hecke function is imported. Removing bad Euler factors, clearing a principal pole and taking a residue are separate operations. Nonvanishing of a ray-character product permits its pole at 1; it does not assert that a finite value at the pole is nonzero.

**Zeros and finite contours.** The xi function is the entire pole-subtracted extension, with xi(0)=xi(1)=1/2. The multiset Z(T) uses analytic multiplicity and the strict height cutoff |Im rho|<T. The truncated formula concerns the half-weighted psi at prime powers; the exact nearest-distinct-prime-power term remains in the remainder. A finite Perron kernel at the endpoint is arctan(T/c)/pi. The limit is 1/2, but its finite value is not replaced by 1/2. Low-zero estimates retain min(1,1/|rho|) and the logarithmic-square reciprocal-zero sum.

**Order and factorization.** Order at most rho is an infimum growth convention: every exponent b>rho has its own constant. It is not a fixed exponential-type bound. Xi's gamma-integral majorant has exp(C|s|log(2+|s|)) growth. Genus-one products use E1(w)=(1−w)exp(w). Pairing E1(w) with E1(−w) gives 1−w²; an arbitrary zero sequence cannot simply be paired. Strict positivity for the paired imaginary-zero product excludes polynomials, not merely constant functions. The accepted Yun–Zhang E16/E18 corrections are used without claiming them as new findings.

**Characters and ideals.** An exceptional real zero is attached to a primitive nonprincipal quadratic character's conductor. For Q(sqrt d) the conductor can be |d| or 4|d|. A finite or empty exceptional set is permitted; infinitude is not assumed. Partial zeta coefficients count integral ideals, never generators, and use the narrow class group in the real quadratic case. Artin local factors act on inertia invariants; their norm-regrouped coefficients are not degree-one completely multiplicative weights. Brauer induction gives meromorphic continuation, while holomorphy for nontrivial irreducibles remains conditional on Artin's conjecture.

**Integer cutoffs and means.** The even von Mangoldt function vanishes at zero. Its truncated positive-divisor sum does not: every positive divisor divides zero, but the cutoff makes the sum finite. Positive and two-sided truncation-error sums are separate so the zero term survives. The pretentious distance on unit-disc prime values can have positive diagonal; no metric axiom is claimed. Smoothness means p≤y and translates to the pinned strict cutoff by floor(y)+1. Dickman's negative extension is zero, so continuity and monotonicity are asserted on nonnegative arguments. Beurling integers are exponent vectors, and equal real values are counted with multiplicity; the repeated-2 test requires that there are exactly two prime indices of value2.

**Lerch branches.** The initial series uses |z|<1, Re c>0 and the principal Log(n+c). The periodic/polylogarithmic series is z Phi(z,s,1). The z=1 Hurwitz series requires Re s>1 and is treated as a separate stratum, not as an arbitrary continuation value. The universal-cover continuation removes z=0,1 and c=0,−1,−2,...; the z monodromy is not assumed abelian. The published PDE has right-hand side −s Phi. Its preprint's plus sign is already corrected in the publication.

## Stage coverage

- **AnalyticNumberTheory:AN.0 — closed.** Dropped by accepted RS-07; supplied by pinned arithmetic functions/LSeries/Abel/Mellin and ArithmeticDirichletSeries Layers0,1,2,3,6. No duplicate nodes.
- **AnalyticNumberTheory:AN.1 — closed.** Dropped by accepted RS-07; pinned Riemann/Dirichlet continuation, functional equations and character APIs. The two inherited IDs are provenance imports.
- **AnalyticNumberTheory:AN.2 — planned.** All stage targets have declarations or explicit supplier requests. This is a complete planning pass under PROTOCOL§0, not source_decomposed or gap-free closure.
  Refinements: Canonical-product analytic foundations; Canonical-product lower bound on good circles; Higher-genus factorization refinement; Xi Mellin and real gamma estimates; Quantitative zeta analytic estimates; PNT boundary adapters and quantitative remainder; Conductor-uniform region and Siegel–Walfisz proof; Conductor-uniform zero theory; Certified numerical analytic inputs; Ineffective Siegel estimates; Mertens constant and error; Möbius and multiplicative-mean uniformity; Mertens first theorem; Koymans–Pagano analytic suppliers; Native signatures for imported analytic carriers.
- **AnalyticNumberTheory:AN.3 — planned.** All stage targets have declarations or explicit supplier requests. This is a complete planning pass under PROTOCOL§0, not source_decomposed or gap-free closure.
  Refinements: Explicit-formula analytic adapters; Argument principle and zero-count phase; Primitive character explicit-formula uniformity; Dirichlet-polynomial Hilbert inequality; Conductor-uniform zero theory; Quadratic Hecke period normalizations; Gamma and inverse-zeta quantitative bounds; Möbius and multiplicative-mean uniformity; Number-field density and effective prime estimates; Mestre source and contour formula; Native signatures for imported analytic carriers.
- **AnalyticNumberTheory:AN.4 — planned.** All stage targets have declarations or explicit supplier requests. This is a complete planning pass under PROTOCOL§0, not source_decomposed or gap-free closure.
  Refinements: Artin local determinant and induction proofs; Landau endpoint convergence for the auxiliary series; Fixed-degree arithmetic analytic estimates; Quadratic Hecke period normalizations; Quadratic regulator dictionary; Explicit Dedekind estimates; Number-field density and effective prime estimates; Koymans–Pagano analytic suppliers; Genus character classification; Quadratic completed-factor normalization; Native signatures for imported analytic carriers.
- **AnalyticNumberTheory:AN.5 — planned.** All stage targets have declarations or explicit supplier requests. This is a complete planning pass under PROTOCOL§0, not source_decomposed or gap-free closure.
  Refinements: Integer truncation supplier identities; Halász proof decomposition; Dickman construction and limiting recursion; Divisor-average source and harmonic constant; Proved moments and conjectural model normalization; Beurling Tauberian remainder proof; Certified numerical analytic inputs; Fixed-degree arithmetic analytic estimates; Medium-prime combinatorics; Inverse-totient count; Divisor maximal order; Möbius and multiplicative-mean uniformity; Landau and Selberg–Delange counts; Koymans–Pagano analytic suppliers; Native signatures for imported analytic carriers.
- **AnalyticNumberTheory:AN.6 — closed.** Dropped by accepted RS-07; consumer bookkeeping is supplied by AN.2/3/4, SV.3/4 and the baseline RH predicate. No process nodes.
- **AnalyticNumberTheory:AN.7 — planned.** All stage targets have declarations or explicit supplier requests. This is a complete planning pass under PROTOCOL§0, not source_decomposed or gap-free closure.
  Refinements: Lerch continuation and functional-relation refinements; Hurwitz and Dirichlet endpoint adapters; Complex Hurwitz Taylor-subtraction proof.

## Declaration plan

Every block is one proposed library declaration. Prerequisites are direct graph edges, including named baseline declarations and requested supplier stages. Proof outlines name the reduction intended; the associated gap ledger records every input whose original proof or canonical interface was not established. A routed extraction is evidence for the target statement, not a substitute for a source proof.

### AnalyticNumberTheory:AN.2

#### Classical high-height zero-free region

**Identifier:** `AnalyticNumberTheory:AN.2/classical-zero-free-region`. **Kind:** theorem. **Proposed name:** `TauCeti.AnalyticNumberTheory.classical_zero_free_region`.

There exist real c>0 and t₀>1 such that ζ(s)≠0 whenever Im(s)≥t₀ and Re(s)≥1−c/log(Im(s)). This is the high positive-height conclusion of Kedlaya's proof, not a full-height effective region or a conductor-uniform Dirichlet region.

**Hypotheses.** The constants c,t₀ are absolute existence constants, not certified numerical values.

**Construction or proof.**
1. Use the nonnegative trigonometric polynomial 3+4 cos θ+cos 2θ with the absolutely convergent logarithmic derivative for Re(s)>1.
2. The simple pole at 1 bounds the real-axis term by 1/(σ−1)+O(1). The corrected Hadamard/Gamma identity bounds the σ+2it term by O(log t). Keeping a zero β+it bounds the σ+it term by O(log t)−1/(σ−β).
3. Combine to obtain 4/(σ−β)≤3/(σ−1)+C log t. Choose σ=1+A/log t with A sufficiently small relative to C to derive β<1−c/log t for t≥t₀.
4. Hadamard factorization, logarithmic differentiation, Gamma estimates, zero summability and effective choices are unresolved named inputs, not hidden routine steps; see the gaps.

**Direct prerequisites.** `AnalyticNumberTheory:AN.2/zero-free-region-constant-selection`, `mathlib:riemannZeta_ne_zero_of_one_le_re`.

**Acceptance checks.** t₀>1 avoids division by log 1. This node alone does not control negative or bounded heights. No RH or Siegel-effectivity assumption is inserted.

**Source.** `kedlaya-ant-2025`, Theorem8.8 and (8.3.1)–(8.3.6), printed pp.50–51; prerequisites §8.2 pp.48–49. Retains the inherited ID with its review's high-height qualification; corrects the Gamma argument in the proof and records missing analytic lemmas.

**Atlas planet:** Classical zero-free region.

#### Exceptional real zero

**Identifier:** `AnalyticNumberTheory:AN.2/exceptional-real-zero`. **Kind:** definition. **Proposed name:** `TauCeti.AnalyticNumberTheory.exceptional_real_zero`.

Fix the effective absolute c_star>0 furnished by Proposition 7.1. For a nontrivial primitive quadratic character chi of conductor N, an exceptional zero is a real zero beta of L(s,chi) with 1-c_star/log(N)<beta<1. Its conductor is called exceptional.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction or proof.**
1. Use the actual continued primitive quadratic Dirichlet L-function; this predicate does not assert existence of a zero.

**Direct prerequisites.** `mathlib:DirichletCharacter.LFunction`.

**API.**

- `ExceptionalRealZero.iff` (characterisation): The predicate holds exactly when L(β,χ)=0 and 1−c/log N<β<1 for a nonprincipal primitive quadratic χ of conductor N>1.
- `ExceptionalRealZero.bounds` (projection): An exceptional β lies strictly below 1 and strictly above the specified logarithmic cutoff.
- `ExceptionalRealZero.mono` (compatibility): For 0<c≤c′ the c-exceptional predicate implies the c′-exceptional predicate, with N>1.

**Unit tests.**

- `ExceptionalRealZero.one` (non-example): β=1 is excluded even if a chosen totalized function vanishes there.
- `ExceptionalRealZero.lower_endpoint` (non-example): β=1−c/log N is excluded by the strict inequality.
- `ExceptionalRealZero.principal` (non-example): The principal character and N=1 are outside the domain; log 1 is never used as a denominator.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** PAPER-BENNETT-SIKSEK-20/41: Track the distinguished real zero and its conductor, without replacing conductor by a modulus. PAPER-BENNETT-SIKSEK-20/88: Track the distinguished real zero and its conductor, without replacing conductor by a modulus. PAPER-BENNETT-SIKSEK-20/89: Track the distinguished real zero and its conductor, without replacing conductor by a modulus.

**Source.** `reviewed-paper-bennett-siksek-20`, Section 7, Proposition 7.1 and following paragraph, pp. 373-374. Literal title and precise corrected statement of accepted extraction PAPER-BENNETT-SIKSEK-20/40. The original external proof is not certified by its acceptance.

#### Chebyshev sum in a residue class

**Identifier:** `AnalyticNumberTheory:AN.2/theta-ap`. **Kind:** definition. **Proposed name:** `TauCeti.AnalyticNumberTheory.theta_ap`.

For q≥1 and a∈ZMod q, θ(x;a,q)=Σ_{p prime, p≤x, p≡a mod q} log p. Inclusive real cutoff, empty for x<2. This specializes the pinned Chebyshev sum; a coprimality hypothesis is required by asymptotic theorems, not by the finite sum.

**Construction or proof.**
1. Construct the displayed object on the specified domain using the existing carriers; prove the listed API before its analytic applications.

**Direct prerequisites.** `mathlib:Chebyshev.theta`.

**API.**

- `theta_ap.sum` (characterisation): Evaluation is the finite filtered prime sum just displayed.
- `theta_ap.level_one` (compatibility): θ(x;0,1)=Chebyshev.theta x.
- `theta_ap.sum_classes` (relation): Summing over all residue classes modulo q gives Chebyshev.theta x.

**Unit tests.**

- `theta_ap.below_two` (computation): θ(1;a,q)=0.
- `theta_ap.mod_eight` (computation): θ(5;3,8)=log 3 and θ(5;5,8)=log 5.
- `theta_ap.noncoprime` (non-example): θ(x;0,2)=log 2 for x≥2; the noncoprime class cannot satisfy x/φ(2) asymptotics.

**Acceptance checks.** θ(1;a,q)=0. θ(5;3,8)=log 3 and θ(5;5,8)=log 5. θ(x;0,2)=log 2 for x≥2; the noncoprime class cannot satisfy x/φ(2) asymptotics.

**Consumers.** PAPER-BENNETT-SIKSEK-20/78: The same class and level occur at both interval endpoints.

**Source.** `reviewed-paper-bennett-siksek-20`, §§6–9, especially p. 369. Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

#### Repulsion of exceptional conductors

**Identifier:** `AnalyticNumberTheory:AN.2/exceptional-conductor-repulsion`. **Kind:** theorem. **Proposed name:** `TauCeti.AnalyticNumberTheory.exceptional_conductor_repulsion`.

With c_star from Proposition 7.1, two distinct exceptional quadratic conductors N1<N2 satisfy N2>N1^2.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction or proof.**
1. Apply the two-real-zero inequality at the same effective c_star.
2. If N₂≤N₁² then log(N₁N₂)≤3 log N₁, contradicting both strict exceptional cutoffs.

**Direct prerequisites.** `AnalyticNumberTheory:AN.2/exceptional-real-zero`, `AnalyticNumberTheory:AN.2/two-real-zero-separation`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.2: Repulsion of exceptional conductors

**Source.** `reviewed-paper-bennett-siksek-20`, Proposition 7.1 and equation (25), pp. 373-374. Literal title and precise corrected statement of accepted extraction PAPER-BENNETT-SIKSEK-20/41. The original external proof is not certified by its acceptance.

**Unresolved inputs.** Conductor-uniform zero theory.

#### Schoenfeld explicit Chebyshev bound

**Identifier:** `AnalyticNumberTheory:AN.2/schoenfeld-theta-upper`. **Kind:** theorem. **Proposed name:** `TauCeti.AnalyticNumberTheory.schoenfeld_theta_upper`.

For x>0, theta(x)=sum_{p prime,p<=x}log p < 1.000081*x.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction or proof.**
1. Use the stated unconditional published theta upper bound, not an RH conditional table.
2. Supply a certified finite-range check below its analytic threshold.

**Direct prerequisites.** `mathlib:Chebyshev.theta`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.2: Schoenfeld explicit Chebyshev bound

**Source.** `reviewed-paper-bennett-siksek-20`, Equation (10), p. 362; Schoenfeld 1976, concluding note p. 360. Literal title and precise corrected statement of accepted extraction PAPER-BENNETT-SIKSEK-20/65. The original external proof is not certified by its acceptance.

**Unresolved inputs.** Certified numerical analytic inputs.

#### Mod-eight prime mass

**Identifier:** `AnalyticNumberTheory:AN.2/mod-eight-interval-mass`. **Kind:** theorem. **Proposed name:** `TauCeti.AnalyticNumberTheory.mod_eight_interval_mass`.

With epsilon=0.002811, for a=3 or 5 and k>=2*10^10, theta(k;a,8)-theta(k/2;a,8)>=(1-3*epsilon)*k/8.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction or proof.**
1. Subtract the same published residue-class theta error bound at k and k/2, both within its range.
2. Retain a=3 or 5, q=8 and k≥2·10^10.

**Direct prerequisites.** `AnalyticNumberTheory:AN.2/theta-ap`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.2: Mod-eight prime mass

**Source.** `reviewed-paper-bennett-siksek-20`, §6, pp. 369,372, Ramaré–Rumely input. Literal title and precise corrected statement of accepted extraction PAPER-BENNETT-SIKSEK-20/78. The original external proof is not certified by its acceptance.

**Unresolved inputs.** Certified numerical analytic inputs.

#### Prime powers do not erase the character-sum margin

**Identifier:** `AnalyticNumberTheory:AN.2/prime-power-interval-margin`. **Kind:** theorem. **Proposed name:** `TauCeti.AnalyticNumberTheory.prime_power_interval_margin`.

For k>=2*10^10, the prime-power mass psi(k)-theta(k)-psi(k/2)+theta(k/2) is smaller than (((1-3*0.002811)/8)-0.1239)*k. Thus an absolute prime-weighted sum >=(1-3*epsilon)k/8 implies an absolute Lambda-weighted sum >0.1239*k.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction or proof.**
1. Bound the powers p^j with j≥2 by a sum of theta(k^(1/j)), and subtract endpoints before estimating.
2. Insert the certified constants from the source; retain the strict inequality.

**Direct prerequisites.** `mathlib:Chebyshev.psi`, `mathlib:Chebyshev.theta`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.2: Prime powers do not erase the character-sum margin

**Source.** `reviewed-paper-bennett-siksek-20`, §6 end of Case I, pp. 369–370; Schoenfeld Theorem 6*, (5.3*)–(5.4*). Literal title and precise corrected statement of accepted extraction PAPER-BENNETT-SIKSEK-20/79. The original external proof is not certified by its acceptance.

**Unresolved inputs.** Certified numerical analytic inputs.

#### Two-real-zero inequality

**Identifier:** `AnalyticNumberTheory:AN.2/two-real-zero-separation`. **Kind:** theorem. **Proposed name:** `TauCeti.AnalyticNumberTheory.two_real_zero_separation`.

There is an effective absolute c_star>0 such that if distinct real primitive quadratic characters of conductors N1,N2>1 have real zeros beta1,beta2, then min(beta1,beta2)<1-3*c_star/log(N1*N2).

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction or proof.**
1. Use the common-conductor-product zero-repulsion theorem with distinct primitive quadratic characters.
2. Fix one effective c_star small enough for this theorem and the exceptional-zero definition simultaneously.

**Direct prerequisites.** Routine construction on the stated baseline carriers; any nonroutine interface gap is listed below..

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.2: Two-real-zero inequality

**Source.** `reviewed-paper-bennett-siksek-20`, Proposition 7.1(i), (23), p. 373. Literal title and precise corrected statement of accepted extraction PAPER-BENNETT-SIKSEK-20/87. The original external proof is not certified by its acceptance.

**Unresolved inputs.** Conductor-uniform zero theory.

#### Uniqueness and simplicity of an exceptional zero

**Identifier:** `AnalyticNumberTheory:AN.2/exceptional-zero-unique`. **Kind:** theorem. **Proposed name:** `TauCeti.AnalyticNumberTheory.exceptional_zero_unique`.

For that same c_star, a primitive nonprincipal quadratic character of conductor N has at most one real zero in (1-c_star/log N,1), and any such zero is simple.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction or proof.**
1. Apply the conductor-uniform zero-free region to the real near-one interval.
2. Use the multiplicity version of the logarithmic-derivative inequality to force multiplicity one.

**Direct prerequisites.** `AnalyticNumberTheory:AN.2/exceptional-real-zero`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.2: Uniqueness and simplicity of an exceptional zero

**Source.** `reviewed-paper-bennett-siksek-20`, Proposition 7.1(ii), (24), pp. 373–374. Literal title and precise corrected statement of accepted extraction PAPER-BENNETT-SIKSEK-20/88. The original external proof is not certified by its acceptance.

**Unresolved inputs.** Conductor-uniform zero theory.

#### Effective character prime-number estimate

**Identifier:** `AnalyticNumberTheory:AN.2/character-weighted-pnt`. **Kind:** theorem. **Proposed name:** `TauCeti.AnalyticNumberTheory.character_weighted_pnt`.

For a primitive nonprincipal character chi of conductor N>1 and X sufficiently large, sum_{m<=X}chi(m)*Lambda(m)=-X^beta/beta+O(X*exp(-c*log X/(sqrt(log X)+log N))*(log N)^4), with the beta term only when an exceptional zero exists; c>0 and the implied constant are absolute and effective.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction or proof.**
1. Use the character explicit formula and isolate the exceptional real zero before estimating the other zeros.
2. Optimize the height using the conductor-uniform region; preserve log N and the effective constants.

**Direct prerequisites.** `AnalyticNumberTheory:AN.2/exceptional-real-zero`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.2: Effective character prime-number estimate

**Source.** `reviewed-paper-bennett-siksek-20`, Theorem 5, (26), p. 374; Iwaniec–Kowalski Theorem 5.27. Literal title and precise corrected statement of accepted extraction PAPER-BENNETT-SIKSEK-20/89. The original external proof is not certified by its acceptance.

**Unresolved inputs.** Conductor-uniform zero theory.

#### Rosser–Schoenfeld explicit prime-count bounds

**Identifier:** `AnalyticNumberTheory:AN.2/rosser-schoenfeld-pi`. **Kind:** theorem. **Proposed name:** `TauCeti.AnalyticNumberTheory.rosser_schoenfeld_pi`.

For x>=59, (x/log x)*(1+1/(2 log x))<pi(x)<(x/log x)*(1+3/(2 log x)).

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction or proof.**
1. Use the original two inequalities on the exact real range x≥59.
2. Certify the finite threshold region with rational enclosures for logarithms.

**Direct prerequisites.** Routine construction on the stated baseline carriers; any nonroutine interface gap is listed below..

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.2: Rosser–Schoenfeld explicit prime-count bounds

**Source.** `reviewed-paper-bennett-siksek-20`, §9 proof, p. 382; Rosser–Schoenfeld Theorem 1. Literal title and precise corrected statement of accepted extraction PAPER-BENNETT-SIKSEK-20/102. The original external proof is not certified by its acceptance.

**Unresolved inputs.** Certified numerical analytic inputs.

#### Explicit reciprocal-prime estimate

**Identifier:** `AnalyticNumberTheory:AN.2/explicit-prime-reciprocal`. **Kind:** theorem. **Proposed name:** `TauCeti.AnalyticNumberTheory.explicit_prime_reciprocal`.

There is the prime Mertens constant B=0.26149... such that for x>=286, |sum_{p<=x}1/p-log log x-B|<1/(2*(log x)^2).

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction or proof.**
1. Use the original reciprocal-prime theorem and its common prime Mertens constant.
2. Keep x≥286; the rounded decimal is a label, not the definition of B.

**Direct prerequisites.** Routine construction on the stated baseline carriers; any nonroutine interface gap is listed below..

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.2: Explicit reciprocal-prime estimate

**Source.** `reviewed-paper-bennett-siksek-20`, §9 proof, p. 382; Rosser–Schoenfeld Theorem 5. Literal title and precise corrected statement of accepted extraction PAPER-BENNETT-SIKSEK-20/103. The original external proof is not certified by its acceptance.

**Unresolved inputs.** Certified numerical analytic inputs.

#### Bounded-height Landau–Page theorem

**Identifier:** `AnalyticNumberTheory:AN.2/landau-page-bounded-height`. **Kind:** theorem. **Proposed name:** `TauCeti.AnalyticNumberTheory.landau_page_bounded_height`.

There is an effective absolute c>0 such that among primitive Dirichlet characters of moduli q<=T, T>=2, there is at most one zero rho=beta+i*t with |t|<=T and beta>1-c/log T. Any exception is a simple real zero of a real character.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction or proof.**
1. Apply the family zero-repulsion bound including complex zeros and multiplicities.
2. Conjugation forces a unique exception to be real and attached to a real primitive character.

**Direct prerequisites.** Routine construction on the stated baseline carriers; any nonroutine interface gap is listed below..

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.2: Bounded-height Landau–Page theorem

**Source.** `reviewed-paper-bennett-siksek-20`, §12 opening, p. 386; Bombieri §5 p.39; Iwaniec–Kowalski Theorem 5.26. Literal title and precise corrected statement of accepted extraction PAPER-BENNETT-SIKSEK-20/116. The original external proof is not certified by its acceptance.

**Unresolved inputs.** Conductor-uniform zero theory.

#### Quadratic real-zero separation from one

**Identifier:** `AnalyticNumberTheory:AN.2/quadratic-effective-zero-gap`. **Kind:** theorem. **Proposed name:** `TauCeti.AnalyticNumberTheory.quadratic_effective_zero_gap`.

For q>=3 and a quadratic Dirichlet character modulo q, a real zero beta>0 satisfies beta<=1-40/(sqrt(q)*(log q)^2).

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction or proof.**
1. Combine the effective quadratic class-number lower estimate with a uniform derivative estimate between β and 1.
2. Read the original theorem to retain the explicit constant 40 and q≥3.

**Direct prerequisites.** Routine construction on the stated baseline carriers; any nonroutine interface gap is listed below..

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.2: Quadratic real-zero separation from one

**Source.** `reviewed-paper-bennett-siksek-20`, §12 p.387; Bennett–Martin–O'Bryant–Rechnitzer Proposition 1.11. Literal title and precise corrected statement of accepted extraction PAPER-BENNETT-SIKSEK-20/118. The original external proof is not certified by its acceptance.

**Unresolved inputs.** Certified numerical analytic inputs.

#### Weighted-prime sum input to the factorial estimate

**Identifier:** `AnalyticNumberTheory:AN.2/explicit-weighted-prime-sum`. **Kind:** theorem. **Proposed name:** `TauCeti.AnalyticNumberTheory.explicit_weighted_prime_sum`.

For x≥319 there is one absolute real E such that log x+E−1/(2 log x)<Σ_{p≤x}(log p)/p<log x+E+1/(2 log x).

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction or proof.**
1. Use the published two-sided estimate with a single constant E, on x≥319.
2. The interval corollary is a separate subtraction lemma below.

**Direct prerequisites.** Routine construction on the stated baseline carriers; any nonroutine interface gap is listed below..

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.2: Weighted-prime sum input to the factorial estimate

**Source.** `reviewed-paper-bennett-siksek-20`, §9 p.384; Rosser–Schoenfeld Theorem 6, p.70. Literal title and precise corrected statement of accepted extraction PAPER-BENNETT-SIKSEK-20/142. The original external proof is not certified by its acceptance.

**Unresolved inputs.** Certified numerical analytic inputs.

#### Explicit prime Euler-product bound

**Identifier:** `AnalyticNumberTheory:AN.2/explicit-plus-euler-product`. **Kind:** theorem. **Proposed name:** `TauCeti.AnalyticNumberTheory.explicit_plus_euler_product`.

For real x>=10^8, product_{p prime,p<=x}(1+1/p)<=2*log x.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction or proof.**
1. Use the source reciprocal-prime and square-power tail estimates, retaining x≥10^8.
2. Certify the finite threshold calculations required for the literal constant 2.

**Direct prerequisites.** Routine construction on the stated baseline carriers; any nonroutine interface gap is listed below..

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.2: Explicit prime Euler-product bound

**Source.** `reviewed-paper-bennett-siksek-20`, §5 proof of Lemma 5.1, p.365; alternate direct input from Rosser–Schoenfeld Theorem 8 (3.29), p.70. Literal title and precise corrected statement of accepted extraction PAPER-BENNETT-SIKSEK-20/151. The original external proof is not certified by its acceptance.

**Unresolved inputs.** Certified numerical analytic inputs.

#### Weighted prime sum on an interval

**Identifier:** `AnalyticNumberTheory:AN.2/weighted-prime-interval`. **Kind:** lemma. **Proposed name:** `TauCeti.AnalyticNumberTheory.weighted_prime_interval`.

For x≥y≥319, Σ_{y<p≤x}(log p)/p>log(x/y)−1/(2 log x)−1/(2 log y).

**Construction or proof.**
1. Subtract the lower bound at x and the upper bound at y; the same E cancels.
2. Use the log quotient identity for positive x,y.

**Direct prerequisites.** `AnalyticNumberTheory:AN.2/explicit-weighted-prime-sum`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.2: Weighted prime sum on an interval

**Source.** `reviewed-paper-bennett-siksek-20`, §9 p.384; Rosser–Schoenfeld Theorem 6, p.70. Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

#### Siegel's theorem (black box)

**Identifier:** `AnalyticNumberTheory:AN.2/siegel-quadratic-lvalue`. **Kind:** theorem. **Proposed name:** `TauCeti.AnalyticNumberTheory.siegel_quadratic_lvalue`.

For every ε > 0 there is c(ε) > 0, not effectively computable, such that L(1,χ_D) ≥ c(ε)|D|^{−ε} for every fundamental discriminant D ≠ 1.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction or proof.**
1. Use the primitive fundamental-discriminant quadratic character and the original ineffective Siegel theorem.
2. No effective positive constant is inferred from the existence theorem.

**Direct prerequisites.** Routine construction on the stated baseline carriers; any nonroutine interface gap is listed below..

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.2: Siegel's theorem (black box)

**Source.** `reviewed-paper-duke-imamoglu-toth-16`, §6, p.968 ('By Siegel's theorem'); proof of Proposition 1, p.968 ('Siegel's theorem (see [11])'). Literal title and precise corrected statement of accepted extraction PAPER-DUKE-IMAMOGLU-TOTH-16/siegel-theorem. The original external proof is not certified by its acceptance.

**Unresolved inputs.** Ineffective Siegel estimates.

#### Mertens sum and product inputs

**Identifier:** `AnalyticNumberTheory:AN.2/mertens-prime-reciprocal`. **Kind:** theorem. **Proposed name:** `TauCeti.AnalyticNumberTheory.mertens_prime_reciprocal`.

There is a real B such that Σ_{p≤x}1/p=log log x+B+O(1/log x) for real x≥2, with an absolute implied constant.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction or proof.**
1. Use partial summation and the unconditional rational prime-number estimates.
2. Keep one prime Mertens constant B for the whole real range x≥2.

**Direct prerequisites.** Routine construction on the stated baseline carriers; any nonroutine interface gap is listed below..

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.2: Mertens sum and product inputs

**Source.** `reviewed-paper-barysoroker-koukoulopoulos-kozma-23`, arXiv v3, §3.3 p. 21 and §12.1 pp. 60–61, citing[22] Theorem 3.4(b,c). Literal title and precise corrected statement of accepted extraction PAPER-BARYSOROKER-KOUKOULOPOULOS-KOZMA-23/128. The original external proof is not certified by its acceptance.

#### Mertens sum and product inputs

**Identifier:** `AnalyticNumberTheory:AN.2/mertens-prime-product`. **Kind:** theorem. **Proposed name:** `TauCeti.AnalyticNumberTheory.mertens_prime_product`.

For real x≥2, ∏_{p≤x}(1−1/p)^−1=e^γ log x+O(1), with γ Euler’s constant and an absolute implied constant.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction or proof.**
1. Expand log ∏(1−1/p)^−1 into its prime-power series, bounding the k≥2 tail absolutely.
2. Identify the constant with e^γ using the Euler product near 1, and retain the O(1) additive error.

**Direct prerequisites.** `AnalyticNumberTheory:AN.2/mertens-prime-reciprocal`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.2: Mertens sum and product inputs

**Source.** `reviewed-paper-barysoroker-koukoulopoulos-kozma-23`, arXiv v3, §3.3 p. 21 and §12.1 pp. 60–61, citing[22] Theorem 3.4(b,c). Literal title and precise corrected statement of accepted extraction PAPER-BARYSOROKER-KOUKOULOPOULOS-KOZMA-23/128. The original external proof is not certified by its acceptance.

**Unresolved inputs.** Mertens constant and error.

#### Prime-number input

**Identifier:** `AnalyticNumberTheory:AN.2/prime-interval-three-x`. **Kind:** theorem. **Proposed name:** `TauCeti.AnalyticNumberTheory.prime_interval_three_x`.

For all sufficiently large x, the number of primes in (x,3x] lies between 4+x/log x and 3x/log x.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction or proof.**
1. Apply the rational PNT at x and 3x, subtract, and choose the threshold to absorb the constant 4.

**Direct prerequisites.** `AnalyticNumberTheory:AN.2/chebyshev-prime-count-transfer`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.2: Prime-number input

**Source.** `reviewed-paper-barysoroker-koukoulopoulos-kozma-23`, arXiv v3, §3.5 p. 25; (3.4) p. 26. Literal title and precise corrected statement of accepted extraction PAPER-BARYSOROKER-KOUKOULOPOULOS-KOZMA-23/55. The original external proof is not certified by its acceptance.

#### Mertens product input

**Identifier:** `AnalyticNumberTheory:AN.2/mertens-product-comparison`. **Kind:** theorem. **Proposed name:** `TauCeti.AnalyticNumberTheory.mertens_product_comparison`.

For y≥2, ∏_{p≤y}(1−1/p) is comparable to 1/log y, with absolute positive upper and lower constants. The application here needs the lower estimate after removing finitely many fixed primes, not an unsourced precise constant.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction or proof.**
1. Use the reciprocal Mertens product asymptotic and positivity.
2. Extend the two-sided comparison over the compact starting range y≥2.

**Direct prerequisites.** `AnalyticNumberTheory:AN.2/mertens-prime-product`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.2: Mertens product input

**Source.** `reviewed-paper-skorobogatov-sofos-23`, Published proof of Lemma 4.9 p. 713 ('which follows from Mertens' theorem', upper bound ∏_{ℓ≤log x}(1−1/ℓ)^{−n} ≪ (log log x)^n) and proof of Lemma 4.11 p. 716 ('By Mertens' estimate', lower bound). Literal title and precise corrected statement of accepted extraction PAPER-SKOROBOGATOV-SOFOS-23/50. The original external proof is not certified by its acceptance.

**Unresolved inputs.** Möbius and multiplicative-mean uniformity.

#### Mertens's first theorem and Σ_{p | N} log p/p = O(log log N)

**Identifier:** `AnalyticNumberTheory:AN.2/mertens-first-theorem`. **Kind:** theorem. **Proposed name:** `TauCeti.AnalyticNumberTheory.mertens_first_theorem`.

For X≥2, Σ_{p<X}(log p)/p=log X+O(1), with an absolute implied constant.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction or proof.**
1. Apply partial summation to the weighted prime-counting function.
2. Keep the endpoint convention p<X; a single endpoint contributes a bounded term.

**Direct prerequisites.** Routine construction on the stated baseline carriers; any nonroutine interface gap is listed below..

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.2: Mertens's first theorem and Σ_{p | N} log p/p = O(log log N)

**Source.** `reviewed-paper-shankar-shankar-tang-etal-22`, Proof of Proposition 5.2, p.27. Literal title and precise corrected statement of accepted extraction PAPER-SHANKAR-SHANKAR-TANG-ETAL-22/63. The original external proof is not certified by its acceptance.

**Unresolved inputs.** Mertens first theorem.

#### Landau's theorem on the repulsion of exceptional real zeros

**Identifier:** `AnalyticNumberTheory:AN.2/squareclass-exceptional-repulsion`. **Kind:** theorem. **Proposed name:** `TauCeti.AnalyticNumberTheory.squareclass_exceptional_repulsion`.

There is c_Landau > 0 such that, if 𝒮(c_Landau) = {d₁, d₂, …} is listed with |d₁| ≤ |d₂| ≤ ⋯, then |d_i|² ≤ |d_{i+1}| for all i.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction or proof.**
1. Match the primitive conductor of Q(√d), rather than replacing it by |d|.
2. Choose one sufficiently small effective c_Landau so the conductor-product separation implies square growth in |d|+4.

**Direct prerequisites.** `AnalyticNumberTheory:AN.2/exceptional-squareclasses`, `AnalyticNumberTheory:AN.2/two-real-zero-separation`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.2: Landau's theorem on the repulsion of exceptional real zeros

**Source.** `reviewed-paper-koymans-pagano`, §7.2, Definition 7.5, p. 61 (arXiv v1). Literal title and precise corrected statement of accepted extraction PAPER-KOYMANS-PAGANO/182. The original external proof is not certified by its acceptance.

**Unresolved inputs.** Koymans–Pagano analytic suppliers.

#### Prime number theorem for a quadratic character, uniform in the conductor, with an exceptional-zero term (7.7)

**Identifier:** `AnalyticNumberTheory:AN.2/quadratic-prime-character-interval`. **Kind:** theorem. **Proposed name:** `TauCeti.AnalyticNumberTheory.quadratic_prime_character_interval`.

Let D ≠ 1 be squarefree, let χ be the quadratic character of Gal(ℚ(√D)/ℚ), and let β be the exceptional real zero of L(s, χ_D) if there is one. Then Σ_{s_i < p < t_i} χ(Frob_p) ≪ t_i^β + t_i · exp(−c log t_i / (√(log t_i) + log|D|)) · (log t_i|D|)⁴ for an absolute constant c > 0. The t_i^β term is absent when there is no exceptional zero.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction or proof.**
1. Use the weighted character PNT and partial summation to remove log p.
2. Subtract two initial-interval formulas before bounding; isolate the exceptional term with upper endpoint t_i.

**Direct prerequisites.** `AnalyticNumberTheory:AN.2/character-weighted-pnt`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.2: Prime number theorem for a quadratic character, uniform in the conductor, with an exceptional-zero term (7.7)

**Source.** `reviewed-paper-koymans-pagano`, §7.2, proof of Proposition 7.6, (7.7), p. 62 (arXiv v1). Literal title and precise corrected statement of accepted extraction PAPER-KOYMANS-PAGANO/186. The original external proof is not certified by its acceptance.

**Unresolved inputs.** Koymans–Pagano analytic suppliers.

#### Effective lower bound for an exceptional zero

**Identifier:** `AnalyticNumberTheory:AN.2/effective-quadratic-zero-separation`. **Kind:** theorem. **Proposed name:** `TauCeti.AnalyticNumberTheory.effective_quadratic_zero_separation`.

For every ε > 0 there is an effectively computable c(ε) > 0 such that, if D ≠ 1 is squarefree and β is a real zero of L(s, χ_D), then 1 − β ≥ c(ε) |D|^{−1/2−ε}.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction or proof.**
1. Use the effective imaginary/real quadratic class-number lower bound and a derivative estimate.
2. State the exponent −1/2−ε with an effective c(ε); do not substitute ineffective Siegel constants.

**Direct prerequisites.** Routine construction on the stated baseline carriers; any nonroutine interface gap is listed below..

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.2: Effective lower bound for an exceptional zero

**Source.** `reviewed-paper-koymans-pagano`, §7.2, proof of Proposition 7.6, p. 62 (arXiv v1). Literal title and precise corrected statement of accepted extraction PAPER-KOYMANS-PAGANO/187. The original external proof is not certified by its acceptance.

**Unresolved inputs.** Koymans–Pagano analytic suppliers.

#### Exceptional quadratic squareclasses

**Identifier:** `AnalyticNumberTheory:AN.2/exceptional-squareclasses`. **Kind:** definition. **Proposed name:** `TauCeti.AnalyticNumberTheory.exceptional_squareclasses`.

For 0<c<1/2 let S(c) consist of nonzero squarefree d≠1 such that the primitive quadratic character of Q(√d) has a real zero β∈[1−c/log(|d|+4),1]. The conductor is |d| or 4|d| as dictated by its fundamental discriminant. Enumerate any finite initial segment by nondecreasing |d|; an infinite enumeration requires infinitude, which is not asserted.

**Construction or proof.**
1. Construct the displayed object on the specified domain using the existing carriers; prove the listed API before its analytic applications.

**Direct prerequisites.** Routine construction on the stated baseline carriers; any nonroutine interface gap is listed below..

**API.**

- `exceptional_squareclasses.membership` (characterisation): Membership is the stated near-one zero condition for the primitive field character.
- `exceptional_squareclasses.mono` (compatibility): If 0<c≤c′<1/2 then S(c)⊆S(c′).
- `exceptional_squareclasses.finite_height` (data): For each B there are finitely many d∈S(c) with |d|≤B.
- `exceptional_squareclasses.conductor` (compatibility): Every estimate uses the field’s fundamental discriminant conductor, retaining the possible factor 4.

**Unit tests.**

- `exceptional_squareclasses.trivial` (non-example): d=1 is excluded, so a principal pole cannot be called an exceptional zero.
- `exceptional_squareclasses.minus_one` (computation): d=−1 has conductor 4, not conductor 1.
- `exceptional_squareclasses.two` (computation): d=2 has conductor 8, not 2.
- `exceptional_squareclasses.finite` (computation): The definition permits an empty or finite S(c); it does not fabricate an infinite sequence.

**Acceptance checks.** d=1 is excluded, so a principal pole cannot be called an exceptional zero. d=−1 has conductor 4, not conductor 1. d=2 has conductor 8, not 2. The definition permits an empty or finite S(c); it does not fabricate an infinite sequence.

**Consumers.** PAPER-KOYMANS-PAGANO/182: Repulsion applies to successive existing entries of the ordered set.

**Source.** `reviewed-paper-koymans-pagano`, §7.2, Definition 7.5, p. 61 (arXiv v1). Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

**Unresolved inputs.** Native signatures for imported analytic carriers.

#### Entire order at most ρ

**Identifier:** `AnalyticNumberTheory:AN.2/entire-order-at-most`. **Kind:** definition. **Proposed name:** `TauCeti.AnalyticNumberTheory.entire_order_at_most`.

For ρ≥0 and entire f:C→C, orderAtMost(f,ρ) means that for every b>ρ there is C_b>0 with |f(z)|≤C_b exp(|z|^b) for all z. This uses the infimum order convention, not exponential type; it includes the zero function, which is excluded in factorization theorems.

**Construction or proof.**
1. Construct the displayed object on the specified domain using the existing carriers; prove the listed API before its analytic applications.

**Direct prerequisites.** Routine construction on the stated baseline carriers; any nonroutine interface gap is listed below..

**API.**

- `entire_order_at_most.bound` (projection): Every exponent strictly larger than ρ has its own global multiplicative growth constant.
- `entire_order_at_most.mono` (compatibility): If ρ≤ρ′ and orderAtMost(f,ρ), then orderAtMost(f,ρ′).
- `entire_order_at_most.polynomial` (example): Every polynomial has order at most 0.
- `entire_order_at_most.product` (structure): Products of entire functions of order at most ρ≥0 again have order at most ρ.

**Unit tests.**

- `entire_order_at_most.exp` (computation): exp(z) has order at most 1.
- `entire_order_at_most.exp_square` (computation): exp(z²) does not have order at most 1.
- `entire_order_at_most.polynomial` (computation): 1−z² has order at most 0.
- `entire_order_at_most.xi` (non-example): The xi bound exp(C|z|log(2+|z|)) implies order at most 1 but is not a bound of fixed exponential type.

**Acceptance checks.** exp(z) has order at most 1. exp(z²) does not have order at most 1. 1−z² has order at most 0. The xi bound exp(C|z|log(2+|z|)) implies order at most 1 but is not a bound of fixed exponential type.

**Consumers.** PAPER-YUN-ZHANG-17/47: Uniform canonical-product genus and polynomial degree.

**Source.** `kedlaya-ant-2025`, §8.1 Definition8.1. Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

**Atlas planet:** Finite-order entire functions.

#### Genus-one canonical factor

**Identifier:** `AnalyticNumberTheory:AN.2/genus-one-factor`. **Kind:** definition. **Proposed name:** `TauCeti.AnalyticNumberTheory.genus_one_factor`.

E₁(w)=(1−w)exp(w), for every complex w.

**Construction or proof.**
1. Construct the displayed object on the specified domain using the existing carriers; prove the listed API before its analytic applications.

**Direct prerequisites.** Routine construction on the stated baseline carriers; any nonroutine interface gap is listed below..

**API.**

- `genus_one_factor.value` (characterisation): The function is exactly (1−w)exp(w).
- `genus_one_factor.entire` (structure): E₁ is entire.
- `genus_one_factor.zeros` (characterisation): Its only zero is w=1 and that zero is simple.
- `genus_one_factor.pair` (relation): E₁(w)E₁(−w)=1−w².

**Unit tests.**

- `genus_one_factor.origin` (computation): E₁(0)=1.
- `genus_one_factor.root` (computation): E₁(1)=0.
- `genus_one_factor.derivative` (computation): E₁′(0)=0, which excludes the uncorrected factor 1−w.

**Acceptance checks.** E₁(0)=1. E₁(1)=0. E₁′(0)=0, which excludes the uncorrected factor 1−w.

**Consumers.** PAPER-YUN-ZHANG-17/47: Order-one canonical product.

**Source.** `kedlaya-ant-2025`, §8.2 Theorem8.7; Yun–Zhang AppendixB.1. Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

#### Isolate the origin zero

**Identifier:** `AnalyticNumberTheory:AN.2/origin-zero-factor`. **Kind:** lemma. **Proposed name:** `TauCeti.AnalyticNumberTheory.origin_zero_factor`.

For nonzero entire f, with m=analyticOrderNatAt f 0, there is an entire g with g(0)≠0 and f(z)=z^m g(z) for all z. If f has order at most ρ≥0, so does g.

**Construction or proof.**
1. Use the pinned local factorization and remove the quotient singularity at zero.
2. Away from zero divide by z^m; outside the unit ball this does not enlarge the growth estimate, while compact continuity handles the remaining ball.

**Direct prerequisites.** `mathlib:AnalyticAt.analyticOrderAt_eq_natCast`, `AnalyticNumberTheory:AN.2/entire-order-at-most`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.2: Isolate the origin zero

**Source.** `kedlaya-ant-2025`, §8.2 Theorem8.7 and proof; §8.4 exercises; Yun–Zhang AppendixB.1. Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

#### Multiplicity count of compact zeros

**Identifier:** `AnalyticNumberTheory:AN.2/compact-zero-count`. **Kind:** lemma. **Proposed name:** `TauCeti.AnalyticNumberTheory.compact_zero_count`.

A nonzero entire f has finitely many zeros in each closed disk, and every zero has finite analytic multiplicity.

**Construction or proof.**
1. Use isolated zeros and compactness, after excluding a locally identically zero germ by the identity theorem.
2. Use the pinned finite analytic-order characterization for each multiplicity.

**Direct prerequisites.** `mathlib:AnalyticAt.analyticOrderAt_eq_natCast`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.2: Multiplicity count of compact zeros

**Source.** `kedlaya-ant-2025`, §8.2 Theorem8.7 and proof; §8.4 exercises; Yun–Zhang AppendixB.1. Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

**Unresolved inputs.** Canonical-product analytic foundations.

#### Zero count from an order bound

**Identifier:** `AnalyticNumberTheory:AN.2/jensen-growth-zero-count`. **Kind:** lemma. **Proposed name:** `TauCeti.AnalyticNumberTheory.jensen_growth_zero_count`.

If g is entire, g(0)≠0 and has order at most ρ, then for every b>ρ the number n_g(r) of zeros with multiplicity in |z|≤r is O_b(r^b) for r≥1.

**Construction or proof.**
1. Apply the pinned Jensen inequality with centre0, inner radius r and outer radius2r.
2. Insert the global growth bound at2r; log2 is a fixed positive denominator.

**Direct prerequisites.** `AnalyticNumberTheory:AN.2/entire-order-at-most`, `mathlib:AnalyticOnNhd.sum_divisor_le`, `AnalyticNumberTheory:AN.2/origin-zero-factor`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.2: Zero count from an order bound

**Source.** `kedlaya-ant-2025`, §8.2 Theorem8.7 and proof; §8.4 exercises; Yun–Zhang AppendixB.1. Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

#### Summable reciprocal squares of zeros

**Identifier:** `AnalyticNumberTheory:AN.2/dyadic-zero-reciprocal-square`. **Kind:** lemma. **Proposed name:** `TauCeti.AnalyticNumberTheory.dyadic_zero_reciprocal_square`.

For g as above with order at most1, the sum over its nonzero zeros α with multiplicity of |α|^−2 is finite; finite and empty zero sets are allowed.

**Construction or proof.**
1. Choose b=3/2 in the Jensen zero count.
2. Split |α|≥1 into dyadic annuli; their contributions are bounded by C·2^(−j/2). Handle the finitely many inner zeros separately.

**Direct prerequisites.** `AnalyticNumberTheory:AN.2/jensen-growth-zero-count`, `AnalyticNumberTheory:AN.2/compact-zero-count`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.2: Summable reciprocal squares of zeros

**Source.** `kedlaya-ant-2025`, §8.2 Theorem8.7 and proof; §8.4 exercises; Yun–Zhang AppendixB.1. Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

#### Small canonical-factor logarithm

**Identifier:** `AnalyticNumberTheory:AN.2/canonical-factor-log-tail`. **Kind:** lemma. **Proposed name:** `TauCeti.AnalyticNumberTheory.canonical_factor_log_tail`.

For |w|≤1/2, the analytic branch log(1−w)+w equals −Σ_{k≥2}w^k/k and has absolute value ≤|w|².

**Construction or proof.**
1. Use the convergent logarithmic power series on |w|<1.
2. Bound 1/k≤1/2 and the geometric tail; include the endpoint |w|=1/2.

**Direct prerequisites.** `AnalyticNumberTheory:AN.2/genus-one-factor`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.2: Small canonical-factor logarithm

**Source.** `kedlaya-ant-2025`, §8.2 Theorem8.7 and proof; §8.4 exercises; Yun–Zhang AppendixB.1. Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

**Unresolved inputs.** Canonical-product analytic foundations.

#### Uniform tail bound for the canonical product

**Identifier:** `AnalyticNumberTheory:AN.2/canonical-product-compact-tail`. **Kind:** lemma. **Proposed name:** `TauCeti.AnalyticNumberTheory.canonical_product_compact_tail`.

For a locally finite zero family α with Σ|α|^−2<∞, and any R>0, the logarithmic tails of ∏E₁(z/α) converge uniformly on |z|≤R after removing the finite set |α|≤2R.

**Construction or proof.**
1. Use the small-factor logarithm bound and dominate every tail by R²Σ_tail |α|^−2.
2. Keep the finite inner factors outside the logarithm to allow zeros inside the disk.

**Direct prerequisites.** `AnalyticNumberTheory:AN.2/dyadic-zero-reciprocal-square`, `AnalyticNumberTheory:AN.2/canonical-factor-log-tail`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.2: Uniform tail bound for the canonical product

**Source.** `kedlaya-ant-2025`, §8.2 Theorem8.7 and proof; §8.4 exercises; Yun–Zhang AppendixB.1. Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

#### Entire locally uniform canonical product

**Identifier:** `AnalyticNumberTheory:AN.2/canonical-product-entire`. **Kind:** lemma. **Proposed name:** `TauCeti.AnalyticNumberTheory.canonical_product_entire`.

The finite-subset products ∏E₁(z/α) converge locally uniformly to an entire function P, independently of enumeration, with P(0)=1.

**Construction or proof.**
1. Exponentiate the uniformly convergent logarithmic tail and multiply by the finite inner factors.
2. Apply the pinned locally uniform holomorphic-limit theorem.

**Direct prerequisites.** `mathlib:TendstoLocallyUniformlyOn.differentiableOn`, `AnalyticNumberTheory:AN.2/canonical-product-compact-tail`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.2: Entire locally uniform canonical product

**Source.** `kedlaya-ant-2025`, §8.2 Theorem8.7 and proof; §8.4 exercises; Yun–Zhang AppendixB.1. Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

#### Zero divisor of the canonical product

**Identifier:** `AnalyticNumberTheory:AN.2/canonical-product-zero-orders`. **Kind:** lemma. **Proposed name:** `TauCeti.AnalyticNumberTheory.canonical_product_zero_orders`.

For the preceding P, its zeros are exactly the α, with the listed multiplicities, and P is nonzero elsewhere.

**Construction or proof.**
1. At a chosen zero separate all its equal finite factors from a nonvanishing uniformly convergent tail.
2. Use the simple zero of E₁ and the pinned analytic-order local factorization.

**Direct prerequisites.** `mathlib:AnalyticAt.analyticOrderAt_eq_natCast`, `AnalyticNumberTheory:AN.2/canonical-product-entire`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.2: Zero divisor of the canonical product

**Source.** `kedlaya-ant-2025`, §8.2 Theorem8.7 and proof; §8.4 exercises; Yun–Zhang AppendixB.1. Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

#### Analyticity of a continuous logarithm

**Identifier:** `AnalyticNumberTheory:AN.2/continuous-log-analytic-upgrade`. **Kind:** lemma. **Proposed name:** `TauCeti.AnalyticNumberTheory.continuous_log_analytic_upgrade`.

If g is analytic and nonzero on open U, and a continuous L satisfies exp(L)=g on U, then L is analytic on U.

**Construction or proof.**
1. Around each point choose a local inverse branch of exp, whose derivative is nonzero.
2. Continuity fixes the locally constant 2πi ambiguity, so L agrees locally with that analytic inverse.

**Direct prerequisites.** `mathlib:Complex.exists_continuousOn_eqOn_exp_comp`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.2: Analyticity of a continuous logarithm

**Source.** `kedlaya-ant-2025`, §8.2 Theorem8.7 and proof; §8.4 exercises; Yun–Zhang AppendixB.1. Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

**Unresolved inputs.** Canonical-product analytic foundations.

#### Entire logarithm of the quotient

**Identifier:** `AnalyticNumberTheory:AN.2/zero-free-entire-log`. **Kind:** lemma. **Proposed name:** `TauCeti.AnalyticNumberTheory.zero_free_entire_log`.

For nonzero entire f and its origin factor z^m P with the same zero divisor, the quotient extends to a nonvanishing entire q and q=exp(h) for an entire h.

**Construction or proof.**
1. Cancel equal local zero orders using the pinned factorization, yielding a removable nonzero quotient at every zero.
2. Obtain a continuous logarithm on C and upgrade it to an entire logarithm.

**Direct prerequisites.** `mathlib:Complex.exists_continuousOn_eqOn_exp_comp`, `AnalyticNumberTheory:AN.2/origin-zero-factor`, `AnalyticNumberTheory:AN.2/canonical-product-zero-orders`, `AnalyticNumberTheory:AN.2/continuous-log-analytic-upgrade`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.2: Entire logarithm of the quotient

**Source.** `kedlaya-ant-2025`, §8.2 Theorem8.7 and proof; §8.4 exercises; Yun–Zhang AppendixB.1. Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

#### A good radius in every long-enough interval

**Identifier:** `AnalyticNumberTheory:AN.2/summable-excluded-radii`. **Kind:** lemma. **Proposed name:** `TauCeti.AnalyticNumberTheory.summable_excluded_radii`.

If forbidden intervals around |α| have total length at most M<∞, then every [r,r+M+1] contains a radius not in their union.

**Construction or proof.**
1. The interval has length M+1, while the union has outer length≤M.
2. Consequently the good radii have bounded gaps, not merely a subsequence tending to infinity.

**Direct prerequisites.** `AnalyticNumberTheory:AN.2/dyadic-zero-reciprocal-square`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.2: A good radius in every long-enough interval

**Source.** `kedlaya-ant-2025`, §8.2 Theorem8.7 and proof; §8.4 exercises; Yun–Zhang AppendixB.1. Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

#### Lower bound for P on good circles

**Identifier:** `AnalyticNumberTheory:AN.2/canonical-product-lower-good-circles`. **Kind:** lemma. **Proposed name:** `TauCeti.AnalyticNumberTheory.canonical_product_lower_good_circles`.

For an order-at-most-one zero family and each 0<ε<1, suitable good radii R with bounded gaps satisfy log|P(z)|≥−C_ε R^(1+ε) on |z|=R.

**Construction or proof.**
1. Separate zeros below2R from the convergent outer logarithmic tail.
2. Exclude summably small radial intervals near each zero and combine the zero count with the elementary factor bounds.

**Direct prerequisites.** `AnalyticNumberTheory:AN.2/summable-excluded-radii`, `AnalyticNumberTheory:AN.2/jensen-growth-zero-count`, `AnalyticNumberTheory:AN.2/canonical-product-compact-tail`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.2: Lower bound for P on good circles

**Source.** `kedlaya-ant-2025`, §8.2 Theorem8.7 and proof; §8.4 exercises; Yun–Zhang AppendixB.1. Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

**Unresolved inputs.** Canonical-product lower bound on good circles.

#### Growth of the entire quotient logarithm

**Identifier:** `AnalyticNumberTheory:AN.2/hadamard-log-growth`. **Kind:** lemma. **Proposed name:** `TauCeti.AnalyticNumberTheory.hadamard_log_growth`.

For nonzero entire f of order at most1 and q=f/(z^mP)=exp h, for every ε>0, Re h(z)≤C_ε(1+|z|^(1+ε)) on C.

**Construction or proof.**
1. Use the f upper bound and P lower bound on good circles.
2. Fill every bounded gap between good radii by the maximum principle for Re h.

**Direct prerequisites.** `AnalyticNumberTheory:AN.2/zero-free-entire-log`, `AnalyticNumberTheory:AN.2/canonical-product-lower-good-circles`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.2: Growth of the entire quotient logarithm

**Source.** `kedlaya-ant-2025`, §8.2 Theorem8.7 and proof; §8.4 exercises; Yun–Zhang AppendixB.1. Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

#### The quotient logarithm is affine

**Identifier:** `AnalyticNumberTheory:AN.2/borel-cauchy-affine-log`. **Kind:** lemma. **Proposed name:** `TauCeti.AnalyticNumberTheory.borel_cauchy_affine_log`.

If entire h has Re h(z)≤C_ε(1+|z|^(1+ε)) for every ε>0, then h(z)=a+bz.

**Construction or proof.**
1. Use pinned Borel–Carathéodory on radius2R to bound |h| on radiusR.
2. Choose 0<ε<1 and apply Cauchy derivative estimates at any centre; every derivative of order≥2 tends to zero as R→∞.

**Direct prerequisites.** `mathlib:Complex.borelCaratheodory`, `AnalyticNumberTheory:AN.2/hadamard-log-growth`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.2: The quotient logarithm is affine

**Source.** `kedlaya-ant-2025`, §8.2 Theorem8.7 and proof; §8.4 exercises; Yun–Zhang AppendixB.1. Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

**Unresolved inputs.** Canonical-product analytic foundations.

#### Hadamard factorization in order at most one

**Identifier:** `AnalyticNumberTheory:AN.2/order-one-hadamard`. **Kind:** theorem. **Proposed name:** `TauCeti.AnalyticNumberTheory.order_one_hadamard`.

For nonzero entire f of order at most1, f(z)=z^m exp(a+bz)∏_αE₁(z/α), with locally uniform convergence, exact zero multiplicities and finite/empty zero sets permitted.

**Construction or proof.**
1. Assemble the origin factor, the canonical product, its entire quotient logarithm and the affine-log theorem.

**Direct prerequisites.** `AnalyticNumberTheory:AN.2/entire-order-at-most`, `AnalyticNumberTheory:AN.2/genus-one-factor`, `AnalyticNumberTheory:AN.2/borel-cauchy-affine-log`, `AnalyticNumberTheory:AN.2/zero-free-entire-log`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.2: Hadamard factorization in order at most one

**Source.** `kedlaya-ant-2025`, §8.2 Theorem8.7 and proof; §8.4 exercises; Yun–Zhang AppendixB.1. Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

**Atlas planet:** Hadamard factorization.

#### Logarithmic derivative of the canonical product

**Identifier:** `AnalyticNumberTheory:AN.2/canonical-product-log-derivative`. **Kind:** lemma. **Proposed name:** `TauCeti.AnalyticNumberTheory.canonical_product_log_derivative`.

Away from0 and the zeros, f′(z)/f(z)=m/z+b+Σ_α(1/(z−α)+1/α), for the order-one factorization; the corrected summands converge locally uniformly away from zeros.

**Construction or proof.**
1. Differentiate the locally uniform finite products using the pinned derivative-limit theorem.
2. Use 1/(z−α)+1/α=z/(α(z−α)) and the reciprocal-square summability on compact sets.

**Direct prerequisites.** `mathlib:TendstoLocallyUniformlyOn.deriv`, `AnalyticNumberTheory:AN.2/order-one-hadamard`, `AnalyticNumberTheory:AN.2/dyadic-zero-reciprocal-square`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.2: Logarithmic derivative of the canonical product

**Source.** `kedlaya-ant-2025`, §8.2 Theorem8.7 and proof; §8.4 exercises; Yun–Zhang AppendixB.1. Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

#### Pairing imaginary zeros

**Identifier:** `AnalyticNumberTheory:AN.2/paired-imaginary-factors`. **Kind:** lemma. **Proposed name:** `TauCeti.AnalyticNumberTheory.paired_imaginary_factors`.

For f with parity f(−z)=(-1)^m f(z), order at most1, purely imaginary zeros and f eventually positive on the positive real line, its factorization is f(z)=c z^m∏_{pairs ±iλ}(1+z²/λ²), c>0.

**Construction or proof.**
1. Pair the canonical factors and prove independence of their ordering by compact convergence.
2. Parity forces the exponential slope b=0, and positivity forces c>0.

**Direct prerequisites.** `AnalyticNumberTheory:AN.2/order-one-hadamard`, `AnalyticNumberTheory:AN.2/canonical-factor-pair`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.2: Pairing imaginary zeros

**Source.** `kedlaya-ant-2025`, §8.2 Theorem8.7 and proof; §8.4 exercises; Yun–Zhang AppendixB.1. Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

#### Nonnegative coefficients of the paired product

**Identifier:** `AnalyticNumberTheory:AN.2/paired-product-nonnegative-coefficients`. **Kind:** lemma. **Proposed name:** `TauCeti.AnalyticNumberTheory.paired_product_nonnegative_coefficients`.

For the preceding paired product, every Taylor coefficient of parity m is nonnegative, and all coefficients of the other parity are zero.

**Construction or proof.**
1. Finite products have nonnegative coefficients in z².
2. Use locally uniform derivative convergence at0 to pass to every fixed coefficient.

**Direct prerequisites.** `mathlib:TendstoLocallyUniformlyOn.deriv`, `AnalyticNumberTheory:AN.2/paired-imaginary-factors`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.2: Nonnegative coefficients of the paired product

**Source.** `kedlaya-ant-2025`, §8.2 Theorem8.7 and proof; §8.4 exercises; Yun–Zhang AppendixB.1. Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

#### Strict derivative positivity requires nonpolynomiality

**Identifier:** `AnalyticNumberTheory:AN.2/paired-product-strict-derivatives`. **Kind:** lemma. **Proposed name:** `TauCeti.AnalyticNumberTheory.paired_product_strict_derivatives`.

If the preceding f is not a polynomial, every derivative f^(k)(x) with k≡m mod2 is strictly positive for x>0, and the same-parity Taylor coefficients from degree m onward are positive.

**Construction or proof.**
1. Nonpolynomiality forces infinitely many pairs, so for every coefficient beyond m choose sufficiently many positive factors.
2. The nonnegative convergent derivative series gives strict positivity for x>0.

**Direct prerequisites.** `AnalyticNumberTheory:AN.2/paired-product-nonnegative-coefficients`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.2: Strict derivative positivity requires nonpolynomiality

**Source.** `kedlaya-ant-2025`, §8.2 Theorem8.7 and proof; §8.4 exercises; Yun–Zhang AppendixB.1. Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

#### Finite-order Hadamard factorization

**Identifier:** `AnalyticNumberTheory:AN.2/finite-order-hadamard`. **Kind:** theorem. **Proposed name:** `TauCeti.AnalyticNumberTheory.finite_order_hadamard`.

For nonzero entire f of finite order at most ρ≥0, set n=floor ρ. Its nonzero zeros α with multiplicity satisfy Σ|α|^(−n−1)<∞ and f(z)=z^m exp(h(z))∏E_n(z/α), where E_n(w)=(1−w)exp(Σ_{j=1}^n w^j/j), h is a polynomial of degree≤n and the product converges locally uniformly. Finite/empty zero sets are allowed.

**Construction or proof.**
1. Generalize the Jensen annulus and canonical-log-tail proofs from n=1 to n=floorρ.
2. Use a good-circle lower bound, Borel–Carathéodory and Cauchy estimates to kill derivatives of order>n.

**Direct prerequisites.** `AnalyticNumberTheory:AN.2/entire-order-at-most`, `mathlib:AnalyticOnNhd.sum_divisor_le`, `mathlib:Complex.borelCaratheodory`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.2: Finite-order Hadamard factorization

**Source.** `reviewed-paper-yun-zhang-17`, Appendix B.1, pp.901–903, (B.1)–(B.3); Ahlfors [1] §5.3.2. Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

**Unresolved inputs.** Higher-genus factorization refinement.

#### Pole-cancelled Riemann xi

**Identifier:** `AnalyticNumberTheory:AN.2/riemann-xi`. **Kind:** definition. **Proposed name:** `TauCeti.AnalyticNumberTheory.riemann_xi`.

ξ(s)=1/2+(1/2)s(s−1)completedRiemannZeta₀(s). This is the entire extension of (1/2)s(s−1)π^(−s/2)Γ(s/2)ζ(s) away from the completed poles, not the pointwise pole-multiplication convention at s=0,1.

**Construction or proof.**
1. Construct the displayed object on the specified domain using the existing carriers; prove the listed API before its analytic applications.

**Direct prerequisites.** `mathlib:completedRiemannZeta₀`, `mathlib:differentiable_completedZeta₀`, `mathlib:completedRiemannZeta₀_one_sub`.

**API.**

- `riemann_xi.entire` (structure): ξ is entire by differentiability of the pinned pole-subtracted completion.
- `riemann_xi.reflection` (relation): ξ(1−s)=ξ(s) for all complex s.
- `riemann_xi.comparison` (compatibility): For s≠0,1, ξ(s)=(1/2)s(s−1)completedRiemannZeta(s).
- `riemann_xi.endpoints` (simp): ξ(0)=ξ(1)=1/2.

**Unit tests.**

- `riemann_xi.zero` (computation): ξ(0)=1/2, not0.
- `riemann_xi.one` (computation): ξ(1)=1/2, not0.
- `riemann_xi.reflection` (computation): ξ(2)=ξ(−1), checking the centre1/2.

**Acceptance checks.** ξ(0)=1/2, not0. ξ(1)=1/2, not0. ξ(2)=ξ(−1), checking the centre1/2.

**Consumers.** AnalyticNumberTheory:AN.2/classical-zero-free-region: The genus-one product is applied to the entire xi, not to ζ with its pole.

**Source.** `kedlaya-ant-2025`, §8.1 Lemma8.3; pinned RiemannZeta pole-subtracted completion. Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

**Atlas planet:** Riemann xi function.

#### Exponential decay of the theta tail

**Identifier:** `AnalyticNumberTheory:AN.2/theta-tail-decay`. **Kind:** lemma. **Proposed name:** `TauCeti.AnalyticNumberTheory.theta_tail_decay`.

For x≥1, ω(x)=Σ_{n≥1}exp(−πn²x) satisfies 0≤ω(x)≤C exp(−πx), for an absolute C.

**Construction or proof.**
1. Factor exp(−πx) from the first n term and dominate the remaining n²−1 exponentials by their values at x=1.

**Direct prerequisites.** Routine construction on the stated baseline carriers; any nonroutine interface gap is listed below..

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.2: Exponential decay of the theta tail

**Source.** `kedlaya-ant-2025`, Lemma8.3, referring to (5.1.4). Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

#### Entire integral representation of xi

**Identifier:** `AnalyticNumberTheory:AN.2/xi-integral-comparison`. **Kind:** lemma. **Proposed name:** `TauCeti.AnalyticNumberTheory.xi_integral_comparison`.

For all s∈C, ξ(s)=1/2+(1/2)s(s−1)∫_1^∞(x^(s/2−1)+x^((1−s)/2−1))ω(x)dx, with absolute and locally uniform convergence in s.

**Construction or proof.**
1. Use the pinned completion’s integral comparison on its original half-plane.
2. Apply exponential theta-tail domination on every compact set of s and continue by the identity theorem.

**Direct prerequisites.** `AnalyticNumberTheory:AN.2/riemann-xi`, `AnalyticNumberTheory:AN.2/theta-tail-decay`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.2: Entire integral representation of xi

**Source.** `kedlaya-ant-2025`, Lemma8.3 and (5.1.4). Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

**Unresolved inputs.** Xi Mellin and real gamma estimates.

#### Growth bound for the theta integral

**Identifier:** `AnalyticNumberTheory:AN.2/gamma-integral-growth-majorant`. **Kind:** lemma. **Proposed name:** `TauCeti.AnalyticNumberTheory.gamma_integral_growth_majorant`.

For r≥2, ∫_1^∞(x^(r/2+1)+1)exp(−πx)dx≤exp(Cr log(2+r)) for an absolute C.

**Construction or proof.**
1. Bound by a positive real gamma integral after rescaling.
2. Use a real Stirling upper bound and absorb bounded r into C.

**Direct prerequisites.** Routine construction on the stated baseline carriers; any nonroutine interface gap is listed below..

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.2: Growth bound for the theta integral

**Source.** `kedlaya-ant-2025`, Corrected domination for Lemma8.3; real gamma integral. Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

**Unresolved inputs.** Xi Mellin and real gamma estimates.

#### Order-one growth of xi

**Identifier:** `AnalyticNumberTheory:AN.2/xi-order-one-growth`. **Kind:** lemma. **Proposed name:** `TauCeti.AnalyticNumberTheory.xi_order_one_growth`.

There are absolute C,R>0 such that |ξ(s)|≤exp(C|s|log(2+|s|)) for |s|≥R; consequently ξ has order at most1.

**Construction or proof.**
1. Insert the exponentially decaying theta majorant, retaining its x dependence.
2. Use the gamma-integral growth majorant and absorb the s(s−1) factor; do not replace it by a constant integrand on an infinite interval.

**Direct prerequisites.** `AnalyticNumberTheory:AN.2/xi-integral-comparison`, `AnalyticNumberTheory:AN.2/gamma-integral-growth-majorant`, `AnalyticNumberTheory:AN.2/entire-order-at-most`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.2: Order-one growth of xi

**Source.** `kedlaya-ant-2025`, §8.1 Lemma8.3, corrected proof. Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

#### Corrected logarithmic derivative of zeta

**Identifier:** `AnalyticNumberTheory:AN.2/zeta-hadamard-log-derivative`. **Kind:** lemma. **Proposed name:** `TauCeti.AnalyticNumberTheory.zeta_hadamard_log_derivative`.

Away from ζ’s zeros and poles, ζ′(s)/ζ(s)=B−1/s−1/(s−1)+(log π)/2−(1/2)Γ′(s/2)/Γ(s/2)+Σ_ρ(1/(s−ρ)+1/ρ), with ξ zeros ρ counted with multiplicity and corrected locally convergent summands.

**Construction or proof.**
1. Apply the order-one Hadamard log derivative to ξ, whose origin value is1/2.
2. Differentiate ξ=(1/2)s(s−1)π^(−s/2)Γ(s/2)ζ(s) on its regular comparison domain.

**Direct prerequisites.** `AnalyticNumberTheory:AN.2/riemann-xi`, `AnalyticNumberTheory:AN.2/xi-order-one-growth`, `AnalyticNumberTheory:AN.2/canonical-product-log-derivative`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.2: Corrected logarithmic derivative of zeta

**Source.** `kedlaya-ant-2025`, §8.3 (8.3.3). Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

**Unresolved inputs.** Quantitative zeta analytic estimates.

#### Logarithmic gamma bound

**Identifier:** `AnalyticNumberTheory:AN.2/digamma-right-half-plane`. **Kind:** lemma. **Proposed name:** `TauCeti.AnalyticNumberTheory.digamma_right_half_plane`.

For Re z≥1/2 and |z|≥2, Γ′(z)/Γ(z)=log z+O(1/|z|), uniformly with the principal logarithm. In particular it is O(log(2+|z|)).

**Construction or proof.**
1. Use the complex Stirling derivative in the right half-plane.
2. Prove gamma nonvanishing on this domain before dividing.

**Direct prerequisites.** Routine construction on the stated baseline carriers; any nonroutine interface gap is listed below..

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.2: Logarithmic gamma bound

**Source.** `kedlaya-ant-2025`, §8.4 Exercise8.4.5. Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

**Unresolved inputs.** Quantitative zeta analytic estimates.

#### Bounded right-edge logarithmic derivative

**Identifier:** `AnalyticNumberTheory:AN.2/zeta-log-derivative-right`. **Kind:** lemma. **Proposed name:** `TauCeti.AnalyticNumberTheory.zeta_log_derivative_right`.

For Re s≥2, |ζ′(s)/ζ(s)|≤Σ_{n≥1}Λ(n)n^−2<∞, with an absolute constant.

**Construction or proof.**
1. Use the absolutely convergent von Mangoldt logarithmic-derivative series on Re s>1.
2. Bound Λ(n)≤log n and compare the positive series with its integral.

**Direct prerequisites.** Routine construction on the stated baseline carriers; any nonroutine interface gap is listed below..

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.2: Bounded right-edge logarithmic derivative

**Source.** `kedlaya-ant-2025`, §9.4 Lemma9.8 and (9.1.1). Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

#### Pole term near one

**Identifier:** `AnalyticNumberTheory:AN.2/zeta-pole-log-derivative`. **Kind:** lemma. **Proposed name:** `TauCeti.AnalyticNumberTheory.zeta_pole_log_derivative`.

As σ→1 from above, −ζ′(σ)/ζ(σ)=1/(σ−1)+O(1).

**Construction or proof.**
1. Remove the simple pole with residue1 using the pinned zeta residue and analyticity of the regular part.
2. Differentiate the local nonzero pole-cleared function and bound its logarithmic derivative near1.

**Direct prerequisites.** Routine construction on the stated baseline carriers; any nonroutine interface gap is listed below..

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.2: Pole term near one

**Source.** `kedlaya-ant-2025`, §8.3 zero-free region proof. Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

**Unresolved inputs.** Quantitative zeta analytic estimates.

#### Zeta three-four-one inequality

**Identifier:** `AnalyticNumberTheory:AN.2/zeta-three-four-one-derivative`. **Kind:** lemma. **Proposed name:** `TauCeti.AnalyticNumberTheory.zeta_three_four_one_derivative`.

For σ>1 and real t, 3(−ζ′/ζ)(σ)+4Re(−ζ′/ζ)(σ+it)+Re(−ζ′/ζ)(σ+2it)≥0.

**Construction or proof.**
1. Import ADS8’s nonnegative 3-4-1 trigonometric package.
2. Apply it coefficientwise to the absolutely convergent Λ-series; this is the zeta specialization of the generic package.

**Direct prerequisites.** `tauceti:TauCetiRoadmap/ArithmeticDirichletSeries#layer-8-landau-type-positivity`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.2: Zeta three-four-one inequality

**Source.** `kedlaya-ant-2025`, §8.3 zero-free region proof. Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

#### A near-one zero forces a positive reciprocal term

**Identifier:** `AnalyticNumberTheory:AN.2/single-zero-positive-term`. **Kind:** lemma. **Proposed name:** `TauCeti.AnalyticNumberTheory.single_zero_positive_term`.

For a nontrivial zero ρ=β+it and 1<σ≤2, Re(1/(σ+it−ρ))=1/(σ−β)>0. In the Hadamard sum all zero terms Re(1/(σ+it−ρ′)) are nonnegative when 0<Re ρ′<1.

**Construction or proof.**
1. Compute the real part of the complex inverse and use σ−β>0.
2. Apply the same computation to every other zero.

**Direct prerequisites.** `AnalyticNumberTheory:AN.2/zeta-hadamard-log-derivative`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.2: A near-one zero forces a positive reciprocal term

**Source.** `kedlaya-ant-2025`, §8.3 proof of the classical zero-free region. Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

#### Uniform selection of the zero-free constant

**Identifier:** `AnalyticNumberTheory:AN.2/zero-free-region-constant-selection`. **Kind:** lemma. **Proposed name:** `TauCeti.AnalyticNumberTheory.zero_free_region_constant_selection`.

There are effective c>0,t₀>1 such that a zero β+it with t≥t₀ cannot satisfy β≥1−c/log t.

**Construction or proof.**
1. Insert the pole bound, gamma bound and positive single-zero term into the 3-4-1 inequality.
2. Choose σ=1+a/log t; choose a>0 and then c>0 so 4/(a+c)>3/a+C, where C is the proved uniform error constant.
3. Increase t₀ to absorb bounded-height terms.

**Direct prerequisites.** `AnalyticNumberTheory:AN.2/zeta-pole-log-derivative`, `AnalyticNumberTheory:AN.2/digamma-right-half-plane`, `AnalyticNumberTheory:AN.2/zeta-three-four-one-derivative`, `AnalyticNumberTheory:AN.2/single-zero-positive-term`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.2: Uniform selection of the zero-free constant

**Source.** `kedlaya-ant-2025`, §8.3 final constant selection. Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

**Unresolved inputs.** Quantitative zeta analytic estimates.

#### Prime number theorem

**Identifier:** `AnalyticNumberTheory:AN.2/rational-prime-number-theorem`. **Kind:** theorem. **Proposed name:** `TauCeti.AnalyticNumberTheory.rational_prime_number_theorem`.

As x→∞, Chebyshev.psi(x)∼x. The corresponding θ and π asymptotics are supplied by the separate transfer comparison.

**Construction or proof.**
1. Use the pinned nonvanishing on Re s=1 and the actual logarithmic-derivative boundary regularization at1.
2. Apply the generic ADS Wiener–Ikehara and prime-number transfer package to Λ.

**Direct prerequisites.** `mathlib:Chebyshev.psi`, `mathlib:riemannZeta_ne_zero_of_one_le_re`, `tauceti:TauCetiRoadmap/ArithmeticDirichletSeries#layer-9-wienerikehara`, `tauceti:TauCetiRoadmap/ArithmeticDirichletSeries#layer-10-generic-prime-number-theorem-transfer`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.2: Prime number theorem

**Source.** `kedlaya-ant-2025`, Kedlaya Chapter4 and Chapter7. Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

**Unresolved inputs.** PNT boundary adapters and quantitative remainder.

**Atlas planet:** Prime number theorem.

#### Prime number theorem in fixed progressions

**Identifier:** `AnalyticNumberTheory:AN.2/fixed-progression-prime-number-theorem`. **Kind:** theorem. **Proposed name:** `TauCeti.AnalyticNumberTheory.fixed_progression_prime_number_theorem`.

For fixed q≥1 and a coprime to q, θ(x;a,q)∼x/φ(q) and π(x;a,q)∼Li(x)/φ(q) as x→∞. The modulus is fixed; constants in qualitative convergence can depend on q.

**Construction or proof.**
1. Use finite-character orthogonality and pinned line-one Dirichlet nonvanishing, retaining the principal-character deleted factors.
2. Apply the ADS boundary/transfer contract to the nonnegative progression Λ coefficient, then convert to prime sums.

**Direct prerequisites.** `AnalyticNumberTheory:AN.2/theta-ap`, `tauceti:TauCetiRoadmap/ArithmeticDirichletSeries#layer-9-wienerikehara`, `tauceti:TauCetiRoadmap/ArithmeticDirichletSeries#layer-10-generic-prime-number-theorem-transfer`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.2: Prime number theorem in fixed progressions

**Source.** `kedlaya-ant-2025`, Chapter10, fixed-modulus consequence after Theorem10.2. Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

**Unresolved inputs.** PNT boundary adapters and quantitative remainder.

**Atlas planet:** Prime numbers in fixed progressions.

#### Classical PNT remainder

**Identifier:** `AnalyticNumberTheory:AN.2/rational-pnt-error`. **Kind:** theorem. **Proposed name:** `TauCeti.AnalyticNumberTheory.rational_pnt_error`.

There are absolute effective c,C>0 such that |ψ(x)−x|≤C x exp(−c√log x) for all sufficiently large x; ψ is the inclusive pinned function.

**Construction or proof.**
1. Use the truncated explicit formula and the zero-free region with conjugation to control both height signs.
2. Bound the low-height zeros in a compact strip by β≤β₀<1, and the high-zero reciprocal sum by O(log²T).
3. Choose T=exp(a√log x) and absorb logarithms; add the endpoint half-weight correction O(log x).

**Direct prerequisites.** `AnalyticNumberTheory:AN.2/rational-prime-number-theorem`, `AnalyticNumberTheory:AN.3/von-mangoldt-explicit-formula-and-pnt-error`, `AnalyticNumberTheory:AN.2/classical-zero-free-region`, `AnalyticNumberTheory:AN.3/zero-weight-sum`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.2: Classical PNT remainder

**Source.** `kedlaya-ant-2025`, Chapter7 Theorem7.7, with corrected low-zero treatment. Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

**Unresolved inputs.** PNT boundary adapters and quantitative remainder.

#### Ordinary prime-count transfer

**Identifier:** `AnalyticNumberTheory:AN.2/chebyshev-prime-count-transfer`. **Kind:** comparison. **Proposed name:** `TauCeti.AnalyticNumberTheory.chebyshev_prime_count_transfer`.

From ψ(x)∼x, obtain θ(x)∼x, π(x)∼Li(x) and π(x)∼x/log x, using the existing ADS transfer and pinned prime-power bound.

**Construction or proof.**
1. Match the inclusive Chebyshev conventions and bound ψ−θ by the contribution of higher prime powers.
2. Apply the generic ADS prime-count transfer rather than re-proving it.

**Direct prerequisites.** `AnalyticNumberTheory:AN.2/rational-prime-number-theorem`, `mathlib:Chebyshev.theta`, `tauceti:TauCetiRoadmap/ArithmeticDirichletSeries#layer-10-generic-prime-number-theorem-transfer`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.2: Ordinary prime-count transfer

**Source.** `kedlaya-ant-2025`, Chapter4 prime-count transfer; existing ADS contract. Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

#### Conductor-uniform Dirichlet zero-free region

**Identifier:** `AnalyticNumberTheory:AN.2/dirichlet-conductor-zero-free-region`. **Kind:** theorem. **Proposed name:** `TauCeti.AnalyticNumberTheory.dirichlet_conductor_zero_free_region`.

There is an effective absolute c>0 such that a primitive nonprincipal Dirichlet L-function of conductor q≥2 has no zero in Re s≥1−c/log(q(|Im s|+2)), except possibly one simple real zero of a real character.

**Construction or proof.**
1. Apply the finite-order product and gamma estimates to the primitive completed Dirichlet function.
2. Use the conductor-uniform 3-4-1 inequality; separate the real-character exceptional case.

**Direct prerequisites.** `AnalyticNumberTheory:AN.2/order-one-hadamard`, `AnalyticNumberTheory:AN.2/exceptional-zero-unique`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.2: Conductor-uniform Dirichlet zero-free region

**Source.** `kedlaya-ant-2025`, Chapter10 Theorem10.6, corrected log(q(|t|+2)) denominator. Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

**Unresolved inputs.** Conductor-uniform region and Siegel–Walfisz proof.

#### Siegel–Walfisz theorem

**Identifier:** `AnalyticNumberTheory:AN.2/siegel-walfisz`. **Kind:** theorem. **Proposed name:** `TauCeti.AnalyticNumberTheory.siegel_walfisz`.

For every A,B>0, uniformly for q≤(log x)^B and gcd(a,q)=1, π(x;a,q)=Li(x)/φ(q)+O_{A,B}(x(log x)^−A) as x→∞. The constant and threshold may be ineffective.

**Construction or proof.**
1. Use the conductor-uniform explicit formula and exceptional-zero decomposition.
2. Apply Siegel’s ineffective lower separation to absorb the exceptional contribution in the logarithmic modulus range.

**Direct prerequisites.** `AnalyticNumberTheory:AN.2/dirichlet-conductor-zero-free-region`, `AnalyticNumberTheory:AN.2/siegel-quadratic-lvalue`, `AnalyticNumberTheory:AN.2/character-weighted-pnt`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.2: Siegel–Walfisz theorem

**Source.** `kedlaya-ant-2025`, Chapter10 Theorem10.11, corrected coprimality and ineffectivity. Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

**Unresolved inputs.** Conductor-uniform region and Siegel–Walfisz proof.

#### Paired genus-one factors

**Identifier:** `AnalyticNumberTheory:AN.2/canonical-factor-pair`. **Kind:** lemma. **Proposed name:** `TauCeti.AnalyticNumberTheory.canonical_factor_pair`.

E₁(w)E₁(−w)=1−w² for all w∈C.

**Construction or proof.**
1. Unfold the stated definition and apply the finite algebraic, positivity or convergent geometric-series computation.

**Direct prerequisites.** `AnalyticNumberTheory:AN.2/genus-one-factor`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.2: Paired genus-one factors

**Source.** `kedlaya-ant-2025`, Hadamard pairing; Yun–Zhang B.1. Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

#### Xi is entire with nonzero endpoints

**Identifier:** `AnalyticNumberTheory:AN.2/xi-entire-and-endpoints`. **Kind:** lemma. **Proposed name:** `TauCeti.AnalyticNumberTheory.xi_entire_and_endpoints`.

ξ is entire and ξ(0)=ξ(1)=1/2.

**Construction or proof.**
1. Unfold the stated definition and apply the finite algebraic, positivity or convergent geometric-series computation.

**Direct prerequisites.** `AnalyticNumberTheory:AN.2/riemann-xi`, `mathlib:differentiable_completedZeta₀`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.2: Xi is entire with nonzero endpoints

**Source.** `kedlaya-ant-2025`, Lemma8.3; pinned pole-subtracted definition. Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

### AnalyticNumberTheory:AN.3

#### Truncated von Mangoldt formula

**Identifier:** `AnalyticNumberTheory:AN.3/von-mangoldt-explicit-formula-and-pnt-error`. **Kind:** theorem. **Proposed name:** `TauCeti.AnalyticNumberTheory.von_mangoldt_explicit_formula_and_pnt_error`.

For x≥2 and T≥2, let ψ₀(x)=∑_{1≤n<x}Λ(n)+(1/2)∑_{1≤n=x}Λ(n), and let d(x)>0 be the distance to the nearest prime power other than x. There is an absolute C such that ψ₀(x)−x=−∑_{ρ:0≤Reρ≤1, |Imρ|<T}x^ρ/ρ−ζ′(0)/ζ(0)−(1/2)log(1−x⁻²)+R(x,T), with zeros counted with analytic multiplicity and |R(x,T)|≤C[x log²(xT)/T+(log x)min(1,x/(T d(x)))]. Powers of positive x use exp(ρ log x). The PNT-error corollary formerly bundled under this ID is a separate remaining target.

**Hypotheses.** x≥2; T≥2; zeros counted with multiplicity; symmetric strict height cutoff; half-weight at a prime-power endpoint.

**Construction or proof.**
1. Apply the ADS truncated arithmetic Perron formula to the half-weight ψ₀.
2. Shift the contour using the residue lemma, horizontal bound and left-contour limit.
3. Adjust from a good height to the stated strict cutoff with multiplicity-weighted local zero counting; include the nearest-prime-power error.

**Direct prerequisites.** `AnalyticNumberTheory:AN.3/zeta-zero-multiset`, `AnalyticNumberTheory:AN.3/good-height-selection`, `AnalyticNumberTheory:AN.3/explicit-formula-residues`, `AnalyticNumberTheory:AN.3/perron-nearest-prime-power-error`, `AnalyticNumberTheory:AN.3/explicit-formula-horizontal-bound`, `AnalyticNumberTheory:AN.3/explicit-formula-left-contour`, `tauceti:TauCetiRoadmap/ArithmeticDirichletSeries#layer-6-abel-and-perron-summation`.

**Acceptance checks.** At a prime power m, ψ₀(m)=Chebyshev.psi(m)−Λ(m)/2; at x=2 the value is (log2)/2, not log2. Multiplicity cannot be replaced by a set of distinct zeros. At a zero height T, a strict cutoff must agree with the height-adjustment error, not silently switch to ≤.

**Source.** `kedlaya-ant-2025`, Definition7.1/Theorem7.2, printed pp.43–44; Theorem9.9 final assembly, pp.56–58. Restores the half-weight convention and restricts to T≥2. Final assembly was freshly read; its prerequisite lemmas and exercises remain a decomposition gap.

**Atlas planet:** Von Mangoldt explicit formula.

#### Selberg zero-density input

**Identifier:** `AnalyticNumberTheory:AN.3/selberg-zero-density`. **Kind:** theorem. **Proposed name:** `TauCeti.AnalyticNumberTheory.selberg_zero_density`.

For epsilon>0, Q>=2, T>=2, and 1/2<=sigma<=1, sum_{q<=Q} sum_{chi primitive mod q} N(sigma,T,chi) <<_epsilon (Q^(5+epsilon)*T^(3+epsilon))^(1-sigma), with effective constants with the right-hand side enlarged by +1, so the count includes the exceptional zero.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction or proof.**
1. Use the primitive-character counting function and the stated effective density theorem.
2. Include +1 if the original theorem excludes the exceptional zero; the chosen target below always includes it.

**Direct prerequisites.** Routine construction on the stated baseline carriers; any nonroutine interface gap is listed below..

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.3: Selberg zero-density input

**Source.** `reviewed-paper-bennett-siksek-20`, §12 proof of Proposition 12.1, p. 386; Bombieri §5 remark after Theorem 14, p.40. Literal title and precise corrected statement of accepted extraction PAPER-BENNETT-SIKSEK-20/117. The original external proof is not certified by its acceptance.

**Unresolved inputs.** Conductor-uniform zero theory.

#### Eisenstein Weyl sums bounded by Dirichlet L-values

**Identifier:** `AnalyticNumberTheory:AN.3/eisenstein-weyl-lvalue-bound`. **Kind:** theorem. **Proposed name:** `TauCeti.AnalyticNumberTheory.eisenstein_weyl_lvalue_bound`.

There is an absolute C > 0 such that, for every ε > 0, every fundamental D = d'd with genus character χ, and every s with Re(s) = 1/2: Weyl(E(·,s),χ) ≪_ε |s|^C |L(s,χ_{d'})L(s,χ_d)| |D|^{1/4+ε}. The paper prints the left side as 'Weyl(s,χ)'.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction or proof.**
1. Apply the appropriate one of the three genus-period identities.
2. Use the precise gamma quotient and reciprocal-zeta bounds; polynomial height factors and |D|^(1/4+ε) remain visible.

**Direct prerequisites.** `AnalyticNumberTheory:AN.4/negative-genus-core-period`, `AnalyticNumberTheory:AN.4/positive-genus-geodesic-period`, `AnalyticNumberTheory:AN.4/mixed-genus-cm-period`, `AutomorphicSpectralTheory:AS.1`, `AnalyticNumberTheory:AN.3/critical-line-gamma-quotient`, `AnalyticNumberTheory:AN.3/reciprocal-zeta-line-one`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.3: Eisenstein Weyl sums bounded by Dirichlet L-values

**Source.** `reviewed-paper-duke-imamoglu-toth-16`, (6.7), proof of Proposition 2, p.969. Literal title and precise corrected statement of accepted extraction PAPER-DUKE-IMAMOGLU-TOTH-16/eisenstein-weyl-to-dirichlet-l-values. The original external proof is not certified by its acceptance.

**Unresolved inputs.** Quadratic Hecke period normalizations.

#### Standard gamma-quotient and 1/ζ(1+2it) estimates (black box)

**Identifier:** `AnalyticNumberTheory:AN.3/critical-line-gamma-quotient`. **Kind:** theorem. **Proposed name:** `TauCeti.AnalyticNumberTheory.critical_line_gamma_quotient`.

For s=1/2+it, t real and α,β∈{0,1}, |Γ((s+α)/2)Γ((s+β)/2)/Γ(s)|≤C|s|^(1/2), with one absolute C.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction or proof.**
1. Apply the uniform complex Stirling estimate on the three gamma factors, with bounded-height continuity separately.
2. The exponential factors cancel on s=1/2+it; the remaining power is bounded by |s|^(1/2).

**Direct prerequisites.** Routine construction on the stated baseline carriers; any nonroutine interface gap is listed below..

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.3: Standard gamma-quotient and 1/ζ(1+2it) estimates (black box)

**Source.** `reviewed-paper-duke-imamoglu-toth-16`, Proof of Proposition 2, p.969 ('standard estimates for the gamma function quotient and for ζ(2s)'). Literal title and precise corrected statement of accepted extraction PAPER-DUKE-IMAMOGLU-TOTH-16/gamma-quotient-and-zeta-one-line-bounds. The original external proof is not certified by its acceptance.

**Unresolved inputs.** Gamma and inverse-zeta quantitative bounds.

#### Standard gamma-quotient and 1/ζ(1+2it) estimates (black box)

**Identifier:** `AnalyticNumberTheory:AN.3/reciprocal-zeta-line-one`. **Kind:** theorem. **Proposed name:** `TauCeti.AnalyticNumberTheory.reciprocal_zeta_line_one`.

Let Zinv be the meromorphic reciprocal of the continued ζ, extended at s=1 by zero. For all real t, |Zinv(1+2it)|≤C log(2+|t|), and Zinv(1+2it)→0 as t→0.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction or proof.**
1. Use the zero-free region and pole-cleared reciprocal estimates away from t=0.
2. Extend 1/ζ through the pole by the removable value 0; no totalized value of 1/riemannZeta 1 is used.

**Direct prerequisites.** `AnalyticNumberTheory:AN.2/classical-zero-free-region`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.3: Standard gamma-quotient and 1/ζ(1+2it) estimates (black box)

**Source.** `reviewed-paper-duke-imamoglu-toth-16`, Proof of Proposition 2, p.969 ('standard estimates for the gamma function quotient and for ζ(2s)'). Literal title and precise corrected statement of accepted extraction PAPER-DUKE-IMAMOGLU-TOTH-16/gamma-quotient-and-zeta-one-line-bounds. The original external proof is not certified by its acceptance.

**Unresolved inputs.** Gamma and inverse-zeta quantitative bounds.

#### Davenport uniform Möbius exponential cancellation

**Identifier:** `AnalyticNumberTheory:AN.3/davenport-mobius-cancellation`. **Kind:** theorem. **Proposed name:** `TauCeti.AnalyticNumberTheory.davenport_mobius_cancellation`.

For every A>0 there is C_A such that for y≥2, sup_{α∈ℝ}|Σ_{1≤r≤y}μ(r)e^{ir α}|≤C_A y(log y)^{−A}. Original proof input [22] or [39,Thm 13.10] still requires full source extraction.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction or proof.**
1. Use Davenport’s original uniform exponential-sum theorem; α ranges over all real values.
2. Retain arbitrary logarithmic power A and y≥2.

**Direct prerequisites.** Routine construction on the stated baseline carriers; any nonroutine interface gap is listed below..

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.3: Davenport uniform Möbius exponential cancellation

**Source.** `reviewed-paper-skorobogatov-sofos-23`, Published Lemma 3.2 p. 690. Literal title and precise corrected statement of accepted extraction PAPER-SKOROBOGATOV-SOFOS-23/29. The original external proof is not certified by its acceptance.

**Unresolved inputs.** Möbius and multiplicative-mean uniformity.

#### Uniform cancellation of the truncation error E_z (Corollary 3.3)

**Identifier:** `AnalyticNumberTheory:AN.3/positive-truncation-error-cancellation`. **Kind:** theorem. **Proposed name:** `TauCeti.AnalyticNumberTheory.positive_truncation_error_cancellation`.

For A>0 and y,z≥2, sup_{α∈R}|Σ_{1≤r≤y}E_z(r)e^(irα)|≤C_A y(log y)(log z)^−A.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction or proof.**
1. Apply the source positive-integer Fourier argument using Davenport cancellation and the finite cutoff.
2. Keep y,z≥2 so no negative power of log1 occurs.

**Direct prerequisites.** `AnalyticNumberTheory:AN.5/mangoldt-truncation-error`, `AnalyticNumberTheory:AN.3/davenport-mobius-cancellation`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.3: Uniform cancellation of the truncation error E_z (Corollary 3.3)

**Source.** `reviewed-paper-skorobogatov-sofos-23`, Published Corollary 3.3 p. 691, citing Iwaniec–Kowalski (19.17). Literal title and precise corrected statement of accepted extraction PAPER-SKOROBOGATOV-SOFOS-23/97. The original external proof is not certified by its acceptance.

**Unresolved inputs.** Möbius and multiplicative-mean uniformity.

#### Two-sided error and the zero term

**Identifier:** `AnalyticNumberTheory:AN.3/two-sided-truncation-error`. **Kind:** lemma. **Proposed name:** `TauCeti.AnalyticNumberTheory.two_sided_truncation_error`.

For y,z≥2 and A>0 the two-sided sum Σ_{|r|≤y}E_z(r)e^(irα) has absolute value ≤2C_A y(log y)(log z)^−A+|E_z(0)|. The zero term is bounded separately by O_A(z(log z)^−A).

**Construction or proof.**
1. Pair the positive and negative summands using evenness; apply the positive estimate to α and −α.
2. Use Möbius cancellation and partial summation for the finite zero sum.

**Direct prerequisites.** `AnalyticNumberTheory:AN.3/positive-truncation-error-cancellation`, `AnalyticNumberTheory:AN.5/mangoldt-truncation-error`, `AnalyticNumberTheory:AN.3/davenport-mobius-cancellation`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.3: Two-sided error and the zero term

**Source.** `reviewed-paper-skorobogatov-sofos-23`, Published Corollary 3.3 p. 691, citing Iwaniec–Kowalski (19.17). Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

#### Theorem 4.2 (zero-density estimate for ray class L-functions)

**Identifier:** `AnalyticNumberTheory:AN.3/ray-class-zero-density`. **Kind:** theorem. **Proposed name:** `TauCeti.AnalyticNumberTheory.ray_class_zero_density`.

There is c = c([k : ℚ]) > 0 such that for Q, T > 1, 1/2 ≤ σ < 1 and ε > 0, Σ_{Nm 𝔮≤Q}Σ*_{χ mod 𝔮}N_χ(σ, T) ≪_{[k:ℚ],ε} (Disc(k)QT)^{c(1−σ)+ε}, the inner sum over primitive ray class characters of conductor 𝔮 and N_χ(σ, T) counting zeros with ℜρ ∈ (σ, 1), |ℑρ| ≤ T.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction or proof.**
1. Count primitive ray-class characters by conductor norm.
2. Apply the Thorner–Zaman density estimate, retaining the ε exponent: this is not a log-free estimate.

**Direct prerequisites.** Routine construction on the stated baseline carriers; any nonroutine interface gap is listed below..

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.3: Theorem 4.2 (zero-density estimate for ray class L-functions)

**Source.** `reviewed-paper-lemkeoliver-wang-wood-25`, Theorem 4.2, p.20, citing Lemke Oliver–Thorner [Pas17, Proposition A.2] and Thorner–Zaman [TZ21, Theorem 1.2], Forum Math. Pi 13 (2025), e19. Literal title and precise corrected statement of accepted extraction PAPER-LEMKEOLIVER-WANG-WOOD-25/17. The original external proof is not certified by its acceptance.

**Unresolved inputs.** Number-field density and effective prime estimates.

#### Admissible Weil test function

**Identifier:** `AnalyticNumberTheory:AN.3/weil-test-function`. **Kind:** definition. **Proposed name:** `TauCeti.AnalyticNumberTheory.weil_test_function`.

For c≥0, an admissible real F:R→R has, for some ε>0, F(x)exp((1/2+c+ε)|x|) integrable with bounded variation on each half-line; F is the mean of its one-sided limits, and (F(x)−F(0))/x has bounded variation with a removable value at 0. These two-tail hypotheses imply the one-sided condition printed in the extraction and make both F(k log p) and F(−k log p) summable.

**Construction or proof.**
1. Construct the displayed object on the specified domain using the existing carriers; prove the listed API before its analytic applications.

**Direct prerequisites.** Routine construction on the stated baseline carriers; any nonroutine interface gap is listed below..

**API.**

- `weil_test_function.transform` (data): Φ(s)=∫_R F(x)exp((s−1/2)x)dx is defined absolutely for −c≤Re s≤1+c.
- `weil_test_function.reflection` (functoriality): x↦F(−x) is admissible with the same c,ε.
- `weil_test_function.add` (structure): Real linear combinations of admissible functions are admissible, after decreasing ε if needed.
- `weil_test_function.normalization` (projection): F equals the mean of its two one-sided limits, fixing boundary values in the summation formula.

**Unit tests.**

- `weil_test_function.zero` (computation): F=0 is admissible and Φ=0.
- `weil_test_function.gaussian` (computation): F(x)=exp(−x²) is admissible for every c≥0.
- `weil_test_function.one_tail` (non-example): F(x)=exp(−2x) on all R satisfies neither two-tail integrability nor the required Fourier transform; a one-tail test is rejected.

**Acceptance checks.** F=0 is admissible and Φ=0. F(x)=exp(−x²) is admissible for every c≥0. F(x)=exp(−2x) on all R satisfies neither two-tail integrability nor the required Fourier transform; a one-tail test is rejected.

**Consumers.** PAPER-CHENEVIER-TAIBI-20/mestre-explicit-formula: Controls both prime-power directions and the symmetric zero sum.

**Source.** `reviewed-paper-chenevier-taibi-20`, Section 2.3, p. 275 ([Mes86, §§I.1–I.2], [Poi77b, §1]). Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

**Unresolved inputs.** Native signatures for imported analytic carriers.

**Atlas planet:** Weil test functions.

#### Weil's explicit formula (Mestre's formalism)

**Identifier:** `AnalyticNumberTheory:AN.3/mestre-weil-explicit-formula`. **Kind:** theorem. **Proposed name:** `TauCeti.AnalyticNumberTheory.mestre_weil_explicit_formula`.

Let A, B > 0, a_i, a′_i ≥ 0 (1 ≤ i ≤ M) with Σ a_i = Σ a′_i, b_i, b′_i ∈ C with non-negative real parts, and Λ_1, Λ_2 meromorphic on C with (i) Λ_1(1 − s) = wΛ_2(s) for some w ∈ C^×; (ii) finitely many poles; (iii) Λ_i minus its singular parts bounded in every vertical strip of finite width; (iv) for some c ≥ 0 and Re s > 1 + c, Λ_1(s) = A^s Π_{i=1}^M Γ(a_i s + b_i) Π_p Π_{i=1}^{M′} (1 − α_i(p)p^{−s})^{−1} and Λ_2(s) = B^s Π_{i=1}^M Γ(a′_i s + b′_i) Π_p Π_{i=1}^{M′} (1 − β_i(p)p^{−s})^{−1} with |α_i(p)|, |β_i(p)| ≤ p^c. Let F: R → R be such that, for some ε > 0, F(x) exp((1/2 + c + ε)x) is integrable and of bounded variation (with F(x) the mean of its one-sided limits), and (F(x) − F(0))/x is of bounded variation. Then Σ_ρ Φ(ρ) − Σ_μ Φ(μ) + Σ_{i=1}^M I(a_i, b_i) + Σ_{i=1}^M J(a′_i, b′_i) = F(0) log(AB) − Σ_{p,i,k≥1} (α_i(p)^k F(k log p) + β_i(p)^k F(−k log p)) log p / p^{k/2}, where ρ (resp. μ) runs over the zeros (resp. poles) of Λ_1 with −c ≤ Re ≤ 1 + c, with multiplicity, Σ_ρ Φ(ρ) = lim_{T→∞} Σ_{|Im ρ|<T} Φ(ρ), Φ(s) = ∫_R F(x) e^{(s−1/2)x} dx, I(a, b) = a ∫_0^∞ (F(ax) e^{−(a/2+b)x}/(1 − e^{−x}) − F(0) e^{−x}/x) dx and J(a, b) is the same with F(−ax). In this packet F additionally satisfies the two-tail admissibility predicate, so both directions of the prime-power series converge.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction or proof.**
1. Use pole-cleared finite-order meromorphic Λ₁,Λ₂ with the stated dual functional equation, equal gamma-slope sums and bounded local roots.
2. Integrate the logarithmic derivative against the transform; account for zeros, poles and both archimedean kernels.
3. Take the symmetric |Im ρ|<T limit under the admissibility bounds.

**Direct prerequisites.** `AnalyticNumberTheory:AN.3/weil-test-function`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.3: Weil's explicit formula (Mestre's formalism)

**Source.** `reviewed-paper-chenevier-taibi-20`, Section 2.3, p. 275 ([Mes86, §§I.1–I.2], [Poi77b, §1]). Literal title and precise corrected statement of accepted extraction PAPER-CHENEVIER-TAIBI-20/mestre-explicit-formula. The original external proof is not certified by its acceptance.

**Unresolved inputs.** Mestre source and contour formula.

#### Finite zero multiset

**Identifier:** `AnalyticNumberTheory:AN.3/zeta-zero-multiset`. **Kind:** definition. **Proposed name:** `TauCeti.AnalyticNumberTheory.zeta_zero_multiset`.

For T≥0, Z(T) is the finite multiset of nontrivial zeros of ξ in 0≤Re ρ≤1 and |Im ρ|<T, with each ρ repeated analyticOrderNatAt ξ ρ times. The strict height cutoff and finite analytic orders are mandatory; the compact enclosing rectangle proves finiteness.

**Construction or proof.**
1. Construct the displayed object on the specified domain using the existing carriers; prove the listed API before its analytic applications.

**Direct prerequisites.** `AnalyticNumberTheory:AN.2/riemann-xi`, `AnalyticNumberTheory:AN.2/compact-zero-count`, `mathlib:analyticOrderNatAt`, `AnalyticNumberTheory:AN.2/xi-entire-and-endpoints`.

**API.**

- `zeta_zero_multiset.multiplicity` (characterisation): The multiplicity of ρ in Z(T) is its finite analytic order if it lies in the stated rectangle, and0 otherwise.
- `zeta_zero_multiset.mono` (functoriality): If T≤U then Z(T) is a submultiset of Z(U).
- `zeta_zero_multiset.conjugation` (relation): Conjugation preserves the zero multiset and multiplicities.
- `zeta_zero_multiset.xi_zeta` (compatibility): On 0<Re ρ<1, ξ and ζ have the same zeros and analytic multiplicities.

**Unit tests.**

- `zeta_zero_multiset.zero_height` (computation): Z(0) is empty, using the strict height inequality.
- `zeta_zero_multiset.double` (computation): A double analytic zero occurs twice, not once.
- `zeta_zero_multiset.endpoint` (non-example): A zero with |Im ρ|=T is excluded from Z(T).
- `zeta_zero_multiset.poles` (computation): s=0 and1 are not xi zeros since ξ has value1/2 there.

**Acceptance checks.** Z(0) is empty, using the strict height inequality. A double analytic zero occurs twice, not once. A zero with |Im ρ|=T is excluded from Z(T). s=0 and1 are not xi zeros since ξ has value1/2 there.

**Consumers.** AnalyticNumberTheory:AN.3/von-mangoldt-explicit-formula-and-pnt-error: The residue sum uses multiplicities and an unambiguous height cutoff.

**Source.** `kedlaya-ant-2025`, §9.2 Lemma9.2 and Theorem9.9. Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

**Atlas planet:** Zeros with analytic multiplicity.

#### Local zero count

**Identifier:** `AnalyticNumberTheory:AN.3/zeta-unit-height-zero-count`. **Kind:** lemma. **Proposed name:** `TauCeti.AnalyticNumberTheory.zeta_unit_height_zero_count`.

For T≥2 the number of zeta zeros with multiplicity and Im ρ∈[T,T+1] is O(log T), with an absolute constant.

**Construction or proof.**
1. Apply a shifted Jensen disk estimate to the completed function near 2+iT.
2. Use a lower bound at the centre and the local gamma/zeta growth estimate.

**Direct prerequisites.** `AnalyticNumberTheory:AN.3/zeta-zero-multiset`, `mathlib:AnalyticOnNhd.sum_divisor_le`, `AnalyticNumberTheory:AN.2/digamma-right-half-plane`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.3: Local zero count

**Source.** `kedlaya-ant-2025`, Lemma9.4 and Exercise9.6.1. Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

**Unresolved inputs.** Explicit-formula analytic adapters.

#### Choosing a contour height

**Identifier:** `AnalyticNumberTheory:AN.3/good-height-selection`. **Kind:** lemma. **Proposed name:** `TauCeti.AnalyticNumberTheory.good_height_selection`.

For T≥2 there is T′∈[T,T+1] with distance at least c/log(T+2) from every zero ordinate, for an absolute c>0. The change in any weighted zero sum is controlled by the O(log(T+2)) zeros between the cutoffs.

**Construction or proof.**
1. Remove intervals of radius c/log(T+2) around the locally finite ordinates.
2. Choose c so their total length is less than1; use local zero counting.

**Direct prerequisites.** `AnalyticNumberTheory:AN.3/zeta-unit-height-zero-count`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.3: Choosing a contour height

**Source.** `kedlaya-ant-2025`, Theorem9.9 proof, good-height adjustment. Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

#### Local logarithmic-derivative expansion

**Identifier:** `AnalyticNumberTheory:AN.3/zeta-local-log-derivative`. **Kind:** lemma. **Proposed name:** `TauCeti.AnalyticNumberTheory.zeta_local_log_derivative`.

For −1≤σ≤2 and |t|≥2 away from zero ordinates, ζ′/ζ(σ+it)=Σ_{|t−Im ρ|<1}1/(σ+it−ρ)+O(log(|t|+2)), with multiplicity and an absolute error.

**Construction or proof.**
1. Subtract the corrected Hadamard expansion at s and at2+it.
2. Control the remaining annuli by the local zero count and the right-edge series.

**Direct prerequisites.** `AnalyticNumberTheory:AN.2/zeta-hadamard-log-derivative`, `AnalyticNumberTheory:AN.3/zeta-unit-height-zero-count`, `AnalyticNumberTheory:AN.2/zeta-log-derivative-right`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.3: Local logarithmic-derivative expansion

**Source.** `kedlaya-ant-2025`, Lemma9.6 and Exercise9.6.2. Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

**Unresolved inputs.** Explicit-formula analytic adapters.

#### Left-half-plane bound away from trivial zeros

**Identifier:** `AnalyticNumberTheory:AN.3/zeta-left-log-derivative`. **Kind:** lemma. **Proposed name:** `TauCeti.AnalyticNumberTheory.zeta_left_log_derivative`.

For fixed c>0, Re s≤−1 and distance(s,{−2n:n≥1})≥c, ζ′(s)/ζ(s)=O_c(log(2+|s|)) as |s|→∞.

**Construction or proof.**
1. Differentiate the functional equation with the correct gamma duplication/trigonometric factors.
2. Use the right-edge series, right-half-plane digamma bound and the distance from the trivial zeros.

**Direct prerequisites.** `AnalyticNumberTheory:AN.2/digamma-right-half-plane`, `AnalyticNumberTheory:AN.2/zeta-log-derivative-right`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.3: Left-half-plane bound away from trivial zeros

**Source.** `kedlaya-ant-2025`, Lemma9.8. Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

**Unresolved inputs.** Explicit-formula analytic adapters.

#### Residues of the Perron integrand

**Identifier:** `AnalyticNumberTheory:AN.3/explicit-formula-residues`. **Kind:** lemma. **Proposed name:** `TauCeti.AnalyticNumberTheory.explicit_formula_residues`.

For x>1, the integrand −(ζ′/ζ)(s)x^s/s has residue x at1, −m_ρx^ρ/ρ at a nontrivial zeroρ, x^(−2n)/(2n) at−2n, and −ζ′(0)/ζ(0) at0. Summing the trivial zeros gives −(1/2)log(1−x^−2).

**Construction or proof.**
1. Use the local analytic/meromorphic order to compute each logarithmic-derivative residue.
2. Apply the convergent real logarithmic series to the trivial-zero terms.

**Direct prerequisites.** `AnalyticNumberTheory:AN.3/zeta-zero-multiset`, `AnalyticNumberTheory:AN.2/zeta-hadamard-log-derivative`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.3: Residues of the Perron integrand

**Source.** `kedlaya-ant-2025`, Lemma9.2, corrected signs. Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

**Unresolved inputs.** Explicit-formula analytic adapters.

#### Nearest-prime-power remainder

**Identifier:** `AnalyticNumberTheory:AN.3/perron-nearest-prime-power-error`. **Kind:** lemma. **Proposed name:** `TauCeti.AnalyticNumberTheory.perron_nearest_prime_power_error`.

For x≥2,T≥2,c=1+1/log x, the off-endpoint Perron tail for Λ is O(x log²(xT)/T+(log x)min(1,x/(Tδ(x)))), where δ(x) is the distance to the nearest prime power different from x. The exact x term has half weight in the infinite-height limit.

**Construction or proof.**
1. Split n/x away from1, then handle the nearest prime-power terms separately.
2. Use −ζ′(c)/ζ(c)=O(log x), the positive harmonic sum and the ADS finite-height kernel estimate.

**Direct prerequisites.** `AnalyticNumberTheory:AN.2/zeta-pole-log-derivative`, `tauceti:TauCetiRoadmap/ArithmeticDirichletSeries#layer-6-abel-and-perron-summation`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.3: Nearest-prime-power remainder

**Source.** `kedlaya-ant-2025`, Theorem9.9 pp57–58; ADS Perron endpoint correction. Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

**Unresolved inputs.** Explicit-formula analytic adapters.

#### Horizontal contour bound

**Identifier:** `AnalyticNumberTheory:AN.3/explicit-formula-horizontal-bound`. **Kind:** lemma. **Proposed name:** `TauCeti.AnalyticNumberTheory.explicit_formula_horizontal_bound`.

At a good height T′≥2 and c=1+1/log x, the two horizontal integrals from Re s=−1 to c are O(x log²(T′+2)/(T′ log x)), for x≥2.

**Construction or proof.**
1. Use the local log-derivative bound and separation from zero ordinates to bound it by O(log² T′).
2. Integrate |x^s/s| over the bounded real segment.

**Direct prerequisites.** `AnalyticNumberTheory:AN.3/zeta-local-log-derivative`, `AnalyticNumberTheory:AN.3/good-height-selection`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.3: Horizontal contour bound

**Source.** `kedlaya-ant-2025`, Theorem9.9 horizontal segments. Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

**Unresolved inputs.** Explicit-formula analytic adapters.

#### Left contour limit

**Identifier:** `AnalyticNumberTheory:AN.3/explicit-formula-left-contour`. **Kind:** lemma. **Proposed name:** `TauCeti.AnalyticNumberTheory.explicit_formula_left_contour`.

Taking the left vertical edge Re s=−U with U positive odd and U→∞ makes its Perron integral tend to0; the left horizontal tails are bounded by O(log(T+2)/(Tx log x)+1/(Tx(log x)²)).

**Construction or proof.**
1. Odd U avoids the negative-even trivial zeros by a fixed distance.
2. Use the left logarithmic-derivative bound and exponential x^(−U) decay.

**Direct prerequisites.** `AnalyticNumberTheory:AN.3/zeta-left-log-derivative`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.3: Left contour limit

**Source.** `kedlaya-ant-2025`, Theorem9.9, remaining contour segments. Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

**Unresolved inputs.** Explicit-formula analytic adapters.

#### Riemann–von Mangoldt zero count

**Identifier:** `AnalyticNumberTheory:AN.3/riemann-von-mangoldt-count`. **Kind:** theorem. **Proposed name:** `TauCeti.AnalyticNumberTheory.riemann_von_mangoldt_count`.

For T≥2, N(T)=#{ρ:0<Im ρ≤T} with multiplicity satisfies N(T)=(T/(2π))log(T/(2π))−T/(2π)+O(log T), with an absolute constant.

**Construction or proof.**
1. Apply the argument principle to ξ on a zero-avoiding rectangle.
2. Evaluate the gamma phase by uniform Stirling and bound the zeta argument; use local zero counting to pass to all heights.

**Direct prerequisites.** `AnalyticNumberTheory:AN.2/riemann-xi`, `AnalyticNumberTheory:AN.3/zeta-zero-multiset`, `AnalyticNumberTheory:AN.3/zeta-unit-height-zero-count`, `AnalyticNumberTheory:AN.2/digamma-right-half-plane`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.3: Riemann–von Mangoldt zero count

**Source.** `kedlaya-ant-2025`, Remark9.7; original analytic source required. Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

**Unresolved inputs.** Argument principle and zero-count phase.

**Atlas planet:** Riemann–von Mangoldt formula.

#### Low-zero-safe interval kernel

**Identifier:** `AnalyticNumberTheory:AN.3/low-zero-safe-interval-kernel`. **Kind:** lemma. **Proposed name:** `TauCeti.AnalyticNumberTheory.low_zero_safe_interval_kernel`.

For x≥2 and 0<Re ρ<1, |(x^ρ−(x/2)^ρ)/ρ|≤C x^(Re ρ)min(1,1/|ρ|) for an absolute C.

**Construction or proof.**
1. Write the quotient as ∫_{x/2}^x t^(ρ−1)dt, yielding a bound≤x^β log2.
2. Bound the numerator directly by2x^β/|ρ| and take the minimum.

**Direct prerequisites.** Routine construction on the stated baseline carriers; any nonroutine interface gap is listed below..

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.3: Low-zero-safe interval kernel

**Source.** `reviewed-paper-bennett-siksek-20`, §12 proof of Proposition 12.2, p.387; explicit repaired interface. Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

#### Logarithmic-square sum of zero weights

**Identifier:** `AnalyticNumberTheory:AN.3/zero-weight-sum`. **Kind:** lemma. **Proposed name:** `TauCeti.AnalyticNumberTheory.zero_weight_sum`.

For a primitive Dirichlet character χ of conductor q≥1 and T≥2, Σ_{|Im ρ|≤T}min(1,1/|ρ|)=O(log²(q(T+2))), uniformly and with multiplicity.

**Construction or proof.**
1. Treat |Im ρ|≤1 with the local O(log(q+2)) count and the bounded weight.
2. Partition larger ordinates into unit-height bands and sum the O(log(q(u+2)))/u bound.

**Direct prerequisites.** Routine construction on the stated baseline carriers; any nonroutine interface gap is listed below..

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.3: Logarithmic-square sum of zero weights

**Source.** `reviewed-paper-bennett-siksek-20`, §12 proof of Proposition 12.2, p.387; explicit repaired interface. Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

**Unresolved inputs.** Primitive character explicit-formula uniformity.

#### Half-interval explicit formula and low-zero-safe bound

**Identifier:** `AnalyticNumberTheory:AN.3/character-half-interval-formula`. **Kind:** theorem. **Proposed name:** `TauCeti.AnalyticNumberTheory.character_half_interval_formula`.

For primitive nonprincipal chi of conductor q, sufficiently large integer k and 2<=T<=k, a truncated explicit formula on (k/2,k] has zero contributions -(k^rho-(k/2)^rho)/rho for nontrivial zeros |Im rho|<=T, with error O(k*log^2(qk)/T+log^2(qk)).

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction or proof.**
1. Subtract the two endpoint explicit formulas before absolute values, accounting for endpoint half weights.
2. Apply the low-zero-safe kernel and the conductor-uniform local count.

**Direct prerequisites.** `AnalyticNumberTheory:AN.3/low-zero-safe-interval-kernel`, `AnalyticNumberTheory:AN.3/zero-weight-sum`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.3: Half-interval explicit formula and low-zero-safe bound

**Source.** `reviewed-paper-bennett-siksek-20`, §12 proof of Proposition 12.2, p.387; explicit repaired interface. Literal title and precise corrected statement of accepted extraction PAPER-BENNETT-SIKSEK-20/139. The original external proof is not certified by its acceptance.

**Unresolved inputs.** Primitive character explicit-formula uniformity.

#### Mean square of a Dirichlet polynomial

**Identifier:** `AnalyticNumberTheory:AN.3/dirichlet-polynomial-mean-square`. **Kind:** theorem. **Proposed name:** `TauCeti.AnalyticNumberTheory.dirichlet_polynomial_mean_square`.

For N≥1,T≥1 and complex a₁,…,a_N, ∫_{−T}^T|Σ_{n=1}^N a_n n^(−it)|²dt=2TΣ|a_n|²+O(Σn|a_n|²), with an absolute constant.

**Construction or proof.**
1. Integrate the diagonal exactly.
2. Bound the off-diagonal bilinear form by the logarithmic-frequency Hilbert inequality; the spacing at n is comparable to1/n.

**Direct prerequisites.** Routine construction on the stated baseline carriers; any nonroutine interface gap is listed below..

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.3: Mean square of a Dirichlet polynomial

**Source.** `halasz-ghs`, §2.3 Lemma2.6 uses a specialized mean-square bound; original general theorem required. GHS motivates the general mean-square target but proves only its stated specialized lemma. The original general proof is an explicit acquisition gap.

**Unresolved inputs.** Dirichlet-polynomial Hilbert inequality.

**Atlas planet:** Dirichlet polynomial mean values.

### AnalyticNumberTheory:AN.4

#### Hecke series and Tate integral comparison

**Identifier:** `AnalyticNumberTheory:AN.4/hecke-L-function-euler-product-comparison`. **Kind:** comparison. **Proposed name:** `TauCeti.AnalyticNumberTheory.hecke_L_function_euler_product_comparison`.

Let K be a number field, c a unitary idele-class character unramified outside a finite set S containing every archimedean place, and χ its ideal-character presentation from GlobalNumberFields Layer9. Choose Tate's admissible factorizable f with f_v=1_{O_v} for v∉S. For Re(s)>1, Z(f,c|·|^s)=(∏_{v∈S}Z_v(f_v,c_v|·|_v^s))(∏_{v∉S}N(d_v)^(−1/2))L_S(s,χ), where L_S(s,χ)=∑_{a integral, prime to S}χ(a)N(a)^(−s)=∏_{v∉S}(1−χ(v)N(v)^(−s))⁻¹. d_v is the local different; its product is finite because d_v is a unit at almost all places. Haar and Fourier normalizations are Tate's, not silently normalized unit volumes.

**Hypotheses.** K a number field; c unitary and trivial on K×; S finite containing infinity and all ramification of c; f admissible in Tate's Z1–Z3 class with the stated local factors; Re(s)>1.

**Construction or proof.**
1. Import the canonical Hecke character and its local/ideal dictionary from GlobalNumberFields Layer9.
2. At v∉S, compute the local integral as the convergent geometric series N(d_v)^(−1/2)∑_{j≥0}χ(v)^j N(v)^(−js).
3. Import the AL.1 global zeta-integral factorization, with the AL.0 measures and Fourier convention, and multiply the local formulas.
4. Use ADS Layer3 to identify the ideal Euler product with the absolutely convergent ideal series. Exact norm regrouping and admissibility hypotheses are required imports, not new carriers here.
5. The completed functional equation is now AN.4/hecke-primitive-functional-equation, stated as an identity of meromorphic functions from AL.1/hecke-l-functional-equation; no local factor is cancelled at its zeros.

**Direct prerequisites.** `AutomorphicLFunctionsAndLocalFactors:AL.0`, `AutomorphicLFunctionsAndLocalFactors:AL.1/global-zeta-integral`, `AutomorphicLFunctionsAndLocalFactors:AL.1/completed-hecke-l-function`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters`, `tauceti:TauCetiRoadmap/ArithmeticDirichletSeries#layer-3-local-factors-and-euler-products`.

**Acceptance checks.** For K=ℚ and trivial c, the unramified arithmetic series is ζ with exactly the S Euler factors removed. Ramified different factors N(d_v)^(−1/2) are retained. The character is an imported idele-class character, not an arbitrary list of local factors.

**Source.** `tate-thesis-1950`, §4.5, thesis p.(4.23), scan p.57; comparison and continuation discussion scan pp.58–59. Fresh page-image verification of the displayed Euler comparison. Character construction and full admissibility proofs remain imported, with exact unread boundaries recorded.

#### Artin continuation near the line one

**Identifier:** `AnalyticNumberTheory:AN.4/artin-induction-versus-artin-holomorphy`. **Kind:** theorem. **Proposed name:** `TauCeti.AnalyticNumberTheory.artin_induction_versus_artin_holomorphy`.

Let K/ℚ be finite Galois and ρ a finite-dimensional complex representation of Gal(K/ℚ). The incomplete Artin L-function, with precisely the ramified rational primes omitted, has a meromorphic continuation to an open neighbourhood of {Re(s)≥1}; it is holomorphic and nonzero on Re(s)=1 away from s=1, and its pole order at 1 is dim(V^G). This statement asserts neither global Artin holomorphy nor Chebotarev density.

**Hypotheses.** Finite Galois K/ℚ; finite-dimensional complex representation; arithmetic Frobenius at unramified primes; omitted-prime set fixed.

**Construction or proof.**
1. Import arithmetic Frobenius and conjugacy independence from NumberFieldArithmetic Layer2. AN.4 must supply determinant Euler factors and direct-sum/induction identities.
2. Import finite-group Artin rational induction; after clearing denominators express an m-fold representation as a virtual sum of induced one-dimensional characters.
3. Use ClassFieldTheory Layer 11 and GlobalNumberFields Layer 9 to identify one-dimensional factors with finite-order Hecke characters; their continuation is AN.4/hecke-primitive-functional-equation and their boundary nonvanishing, with the pole at 1 of the trivial character, is AN.4/hecke-nonvanishing-on-line-one.
4. On small discs about points of the line, take the m-th root agreeing with the Euler product on Re s > 1 and glue (AN.4/mth-root-gluing).
5. Separate the trivial summand to compute the pole order. Brauer integral induction can prove global meromorphy, whereas absence of extra poles is Artin holomorphy; the rational-root route here does not prove the global assertion.

**Direct prerequisites.** `AnalyticNumberTheory:AN.4/hecke-nonvanishing-on-line-one`, `AnalyticNumberTheory:AN.4/mth-root-gluing`, `AnalyticNumberTheory:AN.4/dedekind-zeta-continuation-and-residue`, `tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-2-frobenius-elements-and-the-artin-symbol`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters`, `tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-6-the-virtual-character-ring-artin-and-brauer-induction`, `AnalyticNumberTheory:AN.4/artin-direct-sum-factor`, `AnalyticNumberTheory:AN.4/artin-induction-factor`, `AnalyticNumberTheory:AN.4/artin-linear-hecke-comparison`.

**Acceptance checks.** For the trivial representation recover ζ times the omitted local factors and a simple pole at1. For a nontrivial one-dimensional character recover the Hecke near-line result. At ramified primes the complete local factor would act on inertia invariants; an arbitrary Frobenius lift on the whole representation is invalid. No natural-density conclusion is included; that theorem belongs to Chebotarev.

**Source.** `kedlaya-ant-2025`, Chapter22, §§22.2–22.5, Theorems22.3–22.4, printed pp.128–129. Retains the inherited ID only for the near-line analytic theorem, with rational induction, root-gluing and Hecke boundary inputs explicitly open. The defective Lemma22.1 is not used.

**Atlas planet:** Artin boundary continuation.

#### Hecke boundary adapter for Landau positivity

**Identifier:** `AnalyticNumberTheory:AN.4/landau-nonnegative-logarithm`. **Kind:** comparison. **Proposed name:** `TauCeti.AnalyticNumberTheory.ne_zero_of_log_nonneg_coeff`.

For a continued Hecke product F meromorphic near Re s≥1, with no poles except a pole of order at most one at 1, nonnegative norm-regrouped logarithmic coefficients on Re s>1 imply: F has no zeros at regular points of Re s≥1, and its meromorphic order at 1 is ≤0. A pole is not a nonzero finite value.

**Hypotheses.** Coefficients a_n real and nonnegative; the Dirichlet series may be indexed by ideals after regrouping by norm.

**Construction or proof.**
1. Import the generic Landau positivity and 3-4-1 boundary theorem from ADS Layer 8, rather than constructing it again.
2. Check that the Hecke product satisfies the imported pole-order and logarithmic-coefficient hypotheses; the separate ray-class orthogonality lemma supplies the coefficients.
3. At a regular point interpret order zero as nonvanishing; at 1 permit a pole, and use the real positive limit when the singularity is removable.

**Direct prerequisites.** `tauceti:TauCetiRoadmap/ArithmeticDirichletSeries#layer-8-landau-type-positivity`.

**Acceptance checks.** A simple pole at 1 is allowed; no value F(1) is asserted there. A removable value at 1 is at least 1 in the logarithmic normalization. No new generic Landau theorem is owned here.

**Source.** `kedlaya-ant-2025`, §3.3, Lemma 3.6 and Exercise 3.6.1, printed pp. 19 and 21. Lemma 3.6, whose proof is left as Exercise 3.6.1 (hint: adapt the case f = ζ); the proof steps here are that adaptation.

#### Ray-class product has no boundary zeros

**Identifier:** `AnalyticNumberTheory:AN.4/ray-class-product-nonvanishing`. **Kind:** lemma. **Proposed name:** `TauCeti.AnalyticNumberTheory.rayClassProduct_ne_zero`.

For the finite character group of a ray class quotient, the product of the continued Hecke L-functions has no zeros at regular points of Re s≥1. At s=1 it has meromorphic order ≤0, permitting the principal-character pole. Each Euler logarithmic coefficient is nonnegative by finite-character orthogonality, with bad-prime factors treated separately.

**Hypotheses.** K a number field; 𝔪 a modulus (an integral ideal times a set of real places); χ a character of the ray class group Cl_𝔪(K) (finite order), identified with a finite-order idele-class character ω_χ by GlobalNumberFields Layer 9; L(s, χ) = Σ_{(𝔞,𝔪)=1} χ(𝔞)N𝔞^{−s} for Re s > 1.

**Construction or proof.**
1. Expand the logarithm of the convergent Euler products on Re s>1.
2. Use finite-character orthogonality, separately planned below, to obtain nonnegative coefficients.
3. Apply the Hecke boundary adapter with the single principal-character pole and holomorphy of every other factor.

**Direct prerequisites.** `AnalyticNumberTheory:AN.4/landau-nonnegative-logarithm`, `AnalyticNumberTheory:AN.4/hecke-primitive-functional-equation`, `AnalyticNumberTheory:AN.4/dedekind-zeta-continuation-and-residue`, `AnalyticNumberTheory:AN.4/ray-character-log-coefficients`.

**Acceptance checks.** Check K = ℚ, 𝔪 = N·∞: f_𝔪 is the product of all Dirichlet L-series of level N (Kedlaya Theorem 3.7).

**Source.** `kedlaya-ant-2025`, §3.3, Theorem 3.7 and (3.3.1), printed p. 19. Kedlaya proves the case K = ℚ; the same orthogonality argument applies to Cl_𝔪(K).

#### Hecke L-functions do not vanish on Re s = 1

**Identifier:** `AnalyticNumberTheory:AN.4/hecke-nonvanishing-on-line-one`. **Kind:** theorem. **Proposed name:** `TauCeti.AnalyticNumberTheory.heckeL_ne_zero_of_re_eq_one`.

For every character χ of Cl_𝔪(K): L(s, χ) ≠ 0 for Re s = 1, s ≠ 1; and L(1, χ) ≠ 0 if χ ≠ 1 (for χ = 1, L(s, 1) has a simple pole at s = 1).

**Hypotheses.** K a number field; 𝔪 a modulus (an integral ideal times a set of real places); χ a character of the ray class group Cl_𝔪(K) (finite order), identified with a finite-order idele-class character ω_χ by GlobalNumberFields Layer 9; L(s, χ) = Σ_{(𝔞,𝔪)=1} χ(𝔞)N𝔞^{−s} for Re s > 1.

**Construction or proof.**
1. Away from1 use the ray-character product and holomorphy of each factor.
2. At1 use the separate nonreal-character cancellation and quadratic Landau contradiction lemmas; the auxiliary zero at1/2 has order at least1, not necessarily exactly1.

**Direct prerequisites.** `AnalyticNumberTheory:AN.4/ray-class-product-nonvanishing`, `AnalyticNumberTheory:AN.4/landau-nonnegative-logarithm`, `AnalyticNumberTheory:AN.4/dedekind-zeta-continuation-and-residue`, `mathlib:LSeries.positive`, `mathlib:DirichletCharacter.LFunction_ne_zero_of_one_le_re`, `AnalyticNumberTheory:AN.4/nonreal-hecke-at-one`, `AnalyticNumberTheory:AN.4/quadratic-landau-contradiction`.

**Acceptance checks.** Check K = ℚ against Mathlib: DirichletCharacter.LFunction_ne_zero_of_one_le_re. Check the need for a separate argument at s = 1 for real χ: χ = χ̄ gives only one zero against the pole, so the product argument alone does not decide it.

**Source.** `kedlaya-ant-2025`, §3.3–§3.4, Theorems 3.8, 3.10 and 3.11, printed pp. 19–20. The three steps for Dirichlet characters; the Hecke case follows the same steps with AL.1's continuation.
**Source.** `kedlaya-ant-2025`, §22.5, Theorem 22.4, printed p. 129. Kedlaya records this Hecke input as the first step of Theorem 22.4, with a reference.

**Atlas planet:** Hecke L-functions do not vanish on Re s = 1.

#### Dedekind continuation and real-side comparison

**Identifier:** `AnalyticNumberTheory:AN.4/dedekind-zeta-continuation-and-residue`. **Kind:** comparison. **Proposed name:** `TauCeti.AnalyticNumberTheory.dedekindZeta_meromorphic`.

The Dedekind function supplied by the trivial-character Tate continuation agrees with NumberField.dedekindZeta K on Re s>1. Its complex residue at 1 equals NumberField.dedekindZeta_residue K, by agreement with the pinned real one-sided residue limit and uniqueness of a meromorphic residue. This is an agreement theorem on the convergence half-plane, not equality with the totalized LSeries everywhere.

**Hypotheses.** K a number field with r₁ real and r₂ complex places.

**Construction or proof.**
1. Import the trivial-character continuation from AL.1 and use the ideal Euler-product comparison on Re s>1.
2. Multiply the continued function by s−1 and remove the simple singularity.
3. Take its real right-hand limit using the pinned Dedekind residue theorem; uniqueness of the continuous extension identifies the complex residue.

**Direct prerequisites.** `AutomorphicLFunctionsAndLocalFactors:AL.1/tate-global-functional-equation`, `AutomorphicLFunctionsAndLocalFactors:AL.1/global-zeta-integral`, `AutomorphicLFunctionsAndLocalFactors:AL.1/idele-class-volume`, `mathlib:NumberField.dedekindZeta`, `mathlib:NumberField.dedekindZeta_residue`, `mathlib:NumberField.tendsto_sub_one_mul_dedekindZeta_nhdsGT`, `mathlib:Complex.Gammaℝ`, `mathlib:Complex.Gammaℂ`.

**Acceptance checks.** No evaluation of the totalized LSeries at −2 is used. For Q(i), the positive residue expression is π/4. The completed functional equation and trivial zeros are separate declarations.

**Source.** `tate-thesis-1950`, §4.4 Main Theorem 4.4.1 and §4.5, physical pp. 50–58 (read on page images, cc-39fac3). The residue −κf(0), κf̂(0) and the comparison of ζ(f, c|·|^s) with the classical ζ(s, χ).

#### Primitive Hecke functional-equation normalization

**Identifier:** `AnalyticNumberTheory:AN.4/hecke-primitive-functional-equation`. **Kind:** comparison. **Proposed name:** `TauCeti.AnalyticNumberTheory.heckeL_functional_equation`.

For a primitive finite-order Hecke character χ with finite conductor f and the imported archimedean parity data, the canonical continued L-function, multiplied by the conductor/discriminant and the real/complex gamma factors in AL.1, satisfies Λ(s,χ)=ε(χ)Λ(1−s,χ̄) as a meromorphic identity. The principal character retains the two completed poles. Imprimitive deleted factors are a separate comparison.

**Hypotheses.** K a number field; 𝔪 a modulus (an integral ideal times a set of real places); χ a character of the ray class group Cl_𝔪(K) (finite order), identified with a finite-order idele-class character ω_χ by GlobalNumberFields Layer 9; L(s, χ) = Σ_{(𝔞,𝔪)=1} χ(𝔞)N𝔞^{−s} for Re s > 1. χ primitive of conductor 𝔣 for the functional equation.

**Construction or proof.**
1. Import AL.1/hecke-l-functional-equation on its canonical completed carrier.
2. Use the Re s>1 comparison to identify the finite Euler product, retaining the different and Haar constants.
3. Transport the identity using the identity theorem; do not claim a new Tate functional-equation proof.

**Direct prerequisites.** `AutomorphicLFunctionsAndLocalFactors:AL.1/hecke-l-functional-equation`, `AutomorphicLFunctionsAndLocalFactors:AL.1/completed-hecke-l-function`, `AutomorphicLFunctionsAndLocalFactors:AL.1/global-epsilon-factor`, `AnalyticNumberTheory:AN.4/hecke-L-function-euler-product-comparison`, `mathlib:DirichletCharacter.IsPrimitive.completedLFunction_one_sub`.

**Acceptance checks.** Check K = ℚ and χ primitive Dirichlet of conductor N: Λ(s, χ) = gammaFactor χ s · LFunction χ s, and the identity has the shape of Mathlib's DirichletCharacter.IsPrimitive.completedLFunction_one_sub. Check that an imprimitive character's L-function acquires zeros on Re s = 0 from the removed Euler factors, which is why the functional equation is stated only for the primitive function.

**Source.** `tate-thesis-1950`, §4.5, physical pp. 57–59 (read on page images, cc-39fac3). Tate's derivation of Hecke's functional equation for ζ(s, χ).

#### Gluing m-th roots across the line Re s = 1

**Identifier:** `AnalyticNumberTheory:AN.4/mth-root-gluing`. **Kind:** lemma. **Proposed name:** `TauCeti.AnalyticNumberTheory.extend_of_pow_eq`.

Let f be holomorphic and zero-free on {Re s > 1}, m ≥ 1, and U an open set containing {Re s = 1} ∖ {1} on which a holomorphic, zero-free g is given with g = f^m on U ∩ {Re s > 1}. Then f extends holomorphically (and zero-free) to {Re s > 1} ∪ U′ for an open U′ ⊇ {Re s = 1} ∖ {1}: on each disc D ⊆ U centred on the line there is a unique holomorphic h_D with h_D^m = g agreeing with f on the connected set D ∩ {Re s > 1}, and the h_D agree on overlaps.

**Hypotheses.** Discs D centred at points of Re s = 1 with D ⊆ U; D ∩ {Re s > 1} is a nonempty half-disc, hence connected.

**Construction or proof.**
1. On the simply connected D, g has m holomorphic m-th roots, differing by m-th roots of unity; exactly one agrees with f at a point of D ∩ {Re s > 1}, hence on all of it (identity theorem on the connected half-disc).
2. On D ∩ D′ ∩ {Re s > 1} ≠ ∅ both roots equal f, so they agree on the connected D ∩ D′ (a lens, connected) by the identity theorem.

**Direct prerequisites.** `mathlib:Complex.exp`, `mathlib:AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq`, `AnalyticNumberTheory:AN.4/analytic-root-on-disc`, `AnalyticNumberTheory:AN.4/boundary-disc-overlap`.

**Acceptance checks.** Check that zero-freeness of g is needed: g = (s − 1 − i)·u with u a unit has no square root near 1 + i.

**Source.** `kedlaya-ant-2025`, §22.5, proof of Theorem 22.4, printed p. 129. The m-th root step of Theorem 22.4, stated and proved here in full.

#### Bounded-degree Brauer-Siegel

**Identifier:** `AnalyticNumberTheory:AN.4/bounded-degree-brauer-siegel`. **Kind:** theorem. **Proposed name:** `TauCeti.AnalyticNumberTheory.bounded_degree_brauer_siegel`.

For number fields of bounded degree and discriminant D tending to infinity, log(h_K R_K)=(1/2+o(1)) log D. Keep fixed-degree uniformity and possible ineffectivity explicit.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction or proof.**
1. Use the bounded-degree Brauer–Siegel/Siegel theorem without adding normality.
2. Apply the real analytic class-number formula; finite adjustment handles bounded discriminants.

**Direct prerequisites.** Routine construction on the stated baseline carriers; any nonroutine interface gap is listed below..

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.4: Bounded-degree Brauer-Siegel

**Source.** `reviewed-paper-tsimerman-18`, 2.2, p. 382; proof of Corollary 3.3, p. 384; [4]. Literal title and precise corrected statement of accepted extraction PAPER-TSIMERMAN-18/brauer-siegel. The original external proof is not certified by its acceptance.

**Unresolved inputs.** Fixed-degree arithmetic analytic estimates.

#### Sufficient conductor-discriminant estimate

**Identifier:** `AnalyticNumberTheory:AN.4/artin-conductor-bound`. **Kind:** theorem. **Proposed name:** `TauCeti.AnalyticNumberTheory.artin_conductor_bound`.

For representations occurring in the fixed-degree Colmez expression, establish log f_rho<=C_g(1+log |Disc(E)|). This is sufficient to absorb the conductor term in |Disc(E)|^epsilon.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction or proof.**
1. Import the conductor-discriminant relation and bounded representation multiplicities.
2. Control the exponent using degree-dependent finite group bounds.

**Direct prerequisites.** Routine construction on the stated baseline carriers; any nonroutine interface gap is listed below..

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.4: Sufficient conductor-discriminant estimate

**Source.** `reviewed-paper-tsimerman-18`, Proof of Corollary 3.3, p. 384. Literal title and precise corrected statement of accepted extraction PAPER-TSIMERMAN-18/conductor-discriminant-control. The original external proof is not certified by its acceptance.

**Unresolved inputs.** Fixed-degree arithmetic analytic estimates.

#### Logarithmic functional equation

**Identifier:** `AnalyticNumberTheory:AN.4/artin-log-functional-equation`. **Kind:** theorem. **Proposed name:** `TauCeti.AnalyticNumberTheory.artin_log_functional_equation`.

For the relevant nontrivial Artin factors with nonzero L(0,rho), the completed functional equation relates L'/L(0,rho) to L'/L(1,conjugate(rho)), a conductor logarithm and fixed-degree archimedean terms. Track conjugation and gamma factors.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction or proof.**
1. Import the completed Artin functional equation with its conductor and archimedean factors.
2. Take logarithmic derivatives only after regularizing zeros/poles and checking nonzero endpoint values.

**Direct prerequisites.** Routine construction on the stated baseline carriers; any nonroutine interface gap is listed below..

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.4: Logarithmic functional equation

**Source.** `reviewed-paper-tsimerman-18`, Proof of Corollary 3.3, p. 384. Literal title and precise corrected statement of accepted extraction PAPER-TSIMERMAN-18/artin-functional-equation. The original external proof is not certified by its acceptance.

**Unresolved inputs.** Fixed-degree arithmetic analytic estimates.

#### Two-sided subpolynomial values at one

**Identifier:** `AnalyticNumberTheory:AN.4/artin-value-one-subpower`. **Kind:** theorem. **Proposed name:** `TauCeti.AnalyticNumberTheory.artin_value_one_subpower`.

For the relevant nontrivial Artin factors, prove two-sided subpolynomial control of the nonzero values at 1 using Brauer induction and bounded-degree Hecke/Brauer-Siegel inputs, allowing ineffective constants.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction or proof.**
1. Use integral Brauer induction, with bounded integer coefficients in the fixed-degree family.
2. Remove every trivial Hecke pole, prove cancellation of orders, then bound the remaining regularized values and their reciprocals.

**Direct prerequisites.** Routine construction on the stated baseline carriers; any nonroutine interface gap is listed below..

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.4: Two-sided subpolynomial values at one

**Source.** `reviewed-paper-tsimerman-18`, Proof of Corollary 3.3, p. 384. Literal title and precise corrected statement of accepted extraction PAPER-TSIMERMAN-18/artin-values. The original external proof is not certified by its acceptance.

**Unresolved inputs.** Fixed-degree arithmetic analytic estimates.

#### Factorwise logarithmic derivative at one

**Identifier:** `AnalyticNumberTheory:AN.4/artin-log-derivative-one`. **Kind:** theorem. **Proposed name:** `TauCeti.AnalyticNumberTheory.artin_log_derivative_one`.

For a nontrivial irreducible Artin factor of the bounded-degree normal closure used in the height formula, with L(1,conjugate(rho)) finite and nonzero, use a Brauer identity L(s,conjugate(rho)) = product_i L(s,chi_i)^n_i. Prove the required subpolynomial bound at s=1 for L_prime/L by summing n_i times the Hecke logarithmic derivatives. If trivial Hecke factors occur, first remove their poles and prove cancellation of their total orders; evaluate the regularized factors, not separate infinite values. Constants depend only on g and epsilon and may be ineffective. This is a missing source obligation, not the printed fixed-radius Cauchy estimate for L_prime.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction or proof.**
1. Differentiate the regularized Brauer product in a neighbourhood of 1.
2. Sum factorwise logarithmic derivatives with bounded induction coefficients; a Cauchy bound for L′ alone does not bound L′/L.

**Direct prerequisites.** Routine construction on the stated baseline carriers; any nonroutine interface gap is listed below..

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.4: Factorwise logarithmic derivative at one

**Source.** `reviewed-paper-tsimerman-18`, Proof of Corollary 3.3, p. 384; [10], (5.2). Literal title and precise corrected statement of accepted extraction PAPER-TSIMERMAN-18/artin-derivatives. The original external proof is not certified by its acceptance.

**Unresolved inputs.** Fixed-degree arithmetic analytic estimates.

#### Quadratic zeta factorization and the residue quotient

**Identifier:** `AnalyticNumberTheory:AN.4/quadratic-zeta-factorization`. **Kind:** theorem. **Proposed name:** `TauCeti.AnalyticNumberTheory.quadratic_zeta_factorization`.

For a quadratic extension E/F with its canonical nontrivial finite-order Hecke character η, ζ_E(s)=ζ_F(s)L_f(s,η) on Re s>1, including every ramified Euler factor.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction or proof.**
1. Verify split, inert and ramified Euler factors of ζ_E/ζ_F on Re s>1.
2. Extend the identity to the canonical continuations; the residue quotient is a separate node.

**Direct prerequisites.** Routine construction on the stated baseline carriers; any nonroutine interface gap is listed below..

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.4: Quadratic zeta factorization and the residue quotient

**Source.** `reviewed-paper-tsimerman-18`, Quadratic Euler-factor calculation; Thorner-Zaman 2017 equations (2-1)-(2-7); main Corollary 3.3 adapter. Literal title and precise corrected statement of accepted extraction PAPER-TSIMERMAN-18/cm-hecke-zeta-factorization. The original external proof is not certified by its acceptance.

**Unresolved inputs.** Fixed-degree arithmetic analytic estimates.

#### Uniform subpolynomial Dedekind residues

**Identifier:** `AnalyticNumberTheory:AN.4/bounded-degree-residue-bounds`. **Kind:** theorem. **Proposed name:** `TauCeti.AnalyticNumberTheory.bounded_degree_residue_bounds`.

For every n>=1 and epsilon>0 there are c,C>0 depending only on n,epsilon such that c*D_K^(-epsilon)<=kappa_K<=C*D_K^epsilon for every number field of degree at most n. Constants may be ineffective. Derive from bounded-degree Brauer-Siegel, the explicit residue formula, the bounded number of roots of unity, and a finite adjustment for small discriminants. Normality is not added to the bounded-degree contract.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction or proof.**
1. Use bounded-degree Brauer–Siegel and the explicit positive residue formula.
2. Uniformly bound roots of unity by degree and absorb the finite small-discriminant range.

**Direct prerequisites.** `AnalyticNumberTheory:AN.4/bounded-degree-brauer-siegel`, `AnalyticNumberTheory:AN.4/dedekind-zeta-continuation-and-residue`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.4: Uniform subpolynomial Dedekind residues

**Source.** `reviewed-paper-tsimerman-18`, Brauer 1947 input as used in main sections 2-3; Tsimerman arXiv:1103.5619v3 Lemma 4.1 for comparison. Literal title and precise corrected statement of accepted extraction PAPER-TSIMERMAN-18/bounded-degree-residue-bounds. The original external proof is not certified by its acceptance.

**Unresolved inputs.** Fixed-degree arithmetic analytic estimates.

#### Two-sided quadratic Hecke value bound

**Identifier:** `AnalyticNumberTheory:AN.4/quadratic-hecke-value-one`. **Kind:** theorem. **Proposed name:** `TauCeti.AnalyticNumberTheory.quadratic_hecke_value_one`.

For every fixed g and epsilon>0, D_E^(-epsilon) <<_(g,epsilon) L_f(1,eta_E/F) <<_(g,epsilon) D_E^epsilon. Constants may be ineffective. Use kappa_E/kappa_F, the degree bounds 2g and g, and D_F<=D_E^(1/2), choosing each residue exponent at most 2*epsilon/3.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction or proof.**
1. Apply the positive residue quotient and both residue bounds with exponent ≤2ε/3.
2. Use D_F≤D_E^(1/2) to keep the total exponent ≤ε.

**Direct prerequisites.** `AnalyticNumberTheory:AN.4/quadratic-residue-quotient`, `AnalyticNumberTheory:AN.4/bounded-degree-residue-bounds`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.4: Two-sided quadratic Hecke value bound

**Source.** `reviewed-paper-tsimerman-18`, Derived adapter for main Corollary 3.3. Literal title and precise corrected statement of accepted extraction PAPER-TSIMERMAN-18/cm-hecke-value-one. The original external proof is not certified by its acceptance.

**Unresolved inputs.** Fixed-degree arithmetic analytic estimates.

#### Uniform finite-order Hecke convexity

**Identifier:** `AnalyticNumberTheory:AN.4/primitive-hecke-convexity`. **Kind:** theorem. **Proposed name:** `TauCeti.AnalyticNumberTheory.primitive_hecke_convexity`.

Let chi be a primitive finite-order Hecke character over a degree-n number field K, Q=D_K*N(f_chi), 0<r<=1/2, and -r<=sigma<=1+r. For s=sigma+it, |L_f(s,chi)| << |(1+s)/(1-s)|^delta(chi) * zeta_Q(1+r)^n * (Q*(3+|t|)^n/(2*pi)^n)^((1+r-sigma)/2), with an absolute implied constant. The pole factor is present only for the trivial character; zeta_Q means the Riemann zeta function.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction or proof.**
1. Use the primitive completed functional equation and the absolutely convergent right-edge bound.
2. Apply the pole-cleared Phragmén–Lindelöf theorem with the displayed strip and height; retain the principal-character pole factor.

**Direct prerequisites.** Routine construction on the stated baseline carriers; any nonroutine interface gap is listed below..

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.4: Uniform finite-order Hecke convexity

**Source.** `reviewed-paper-tsimerman-18`, Thorner-Zaman 2017, Lemma 2.3, printed p. 1142; credits Rademacher 1959. Literal title and precise corrected statement of accepted extraction PAPER-TSIMERMAN-18/primitive-hecke-convexity. The original external proof is not certified by its acceptance.

**Unresolved inputs.** Fixed-degree arithmetic analytic estimates.

#### A fixed small circle gives a subpolynomial derivative

**Identifier:** `AnalyticNumberTheory:AN.4/quadratic-hecke-cauchy-derivative`. **Kind:** theorem. **Proposed name:** `TauCeti.AnalyticNumberTheory.quadratic_hecke_cauchy_derivative`.

For fixed g and every epsilon>0, |L_f prime(1,eta_E/F)| <<_(g,epsilon) D_E^epsilon. Set r=min(epsilon,1/4)>0. The closed circle |s-1|=r is in [-r,1+r] in real part, |t|<=r, and the convexity exponent is at most r. Hence its supremum is at most C_(g,r)*Q^r, and Cauchy gives |L_f prime(1)|<=C_(g,r)*Q^r/r. Holomorphy is required on the entire disk; a zero-free disk is unnecessary.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction or proof.**
1. Choose r=min(ε,1/4), and apply the finite-order convexity bound on the complete circle |s−1|=r.
2. Use Cauchy on the holomorphic disk, with bound Q^r/r; no zero-free disk is assumed.

**Direct prerequisites.** `AnalyticNumberTheory:AN.4/primitive-hecke-convexity`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.4: A fixed small circle gives a subpolynomial derivative

**Source.** `reviewed-paper-tsimerman-18`, Derived from Thorner-Zaman Lemma 2.3 and Cauchy derivative estimate. Literal title and precise corrected statement of accepted extraction PAPER-TSIMERMAN-18/cm-hecke-cauchy-derivative. The original external proof is not certified by its acceptance.

**Unresolved inputs.** Fixed-degree arithmetic analytic estimates.

#### Subpolynomial logarithmic derivative at one

**Identifier:** `AnalyticNumberTheory:AN.4/quadratic-hecke-log-derivative-one`. **Kind:** theorem. **Proposed name:** `TauCeti.AnalyticNumberTheory.quadratic_hecke_log_derivative_one`.

For every fixed g and epsilon>0, |L_f prime(1,eta)/L_f(1,eta)| <<_(g,epsilon) D_E^epsilon. Apply the derivative bound with epsilon/2 and the reciprocal value bound with epsilon/2. The latter, rather than Cauchy, is the possible ineffective input.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction or proof.**
1. Apply the derivative estimate with ε/2.
2. Multiply by the reciprocal positive-value estimate with ε/2.

**Direct prerequisites.** `AnalyticNumberTheory:AN.4/quadratic-hecke-cauchy-derivative`, `AnalyticNumberTheory:AN.4/quadratic-hecke-value-one`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.4: Subpolynomial logarithmic derivative at one

**Source.** `reviewed-paper-tsimerman-18`, Derived adapter for main Corollary 3.3. Literal title and precise corrected statement of accepted extraction PAPER-TSIMERMAN-18/cm-hecke-log-derivative-one. The original external proof is not certified by its acceptance.

**Unresolved inputs.** Fixed-degree arithmetic analytic estimates.

#### Logarithmic functional equation at zero and one

**Identifier:** `AnalyticNumberTheory:AN.4/quadratic-hecke-log-functional-equation`. **Kind:** theorem. **Proposed name:** `TauCeti.AnalyticNumberTheory.quadratic_hecke_log_functional_equation`.

For ell_j=L_f prime(j,eta)/L_f(j,eta), both denominators are nonzero and ell_0+ell_1=-log Q+g*(gamma+log(2*pi)), where gamma is Euler constant. Differentiate the completed functional equation; Gamma_R prime/Gamma_R at 1 and 2 sum to -gamma-log(2*pi). Nonvanishing at 0 follows from the functional equation and L_f(1)>0.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction or proof.**
1. Differentiate the quadratic completed functional equation and evaluate at 0 and 1 after proving both endpoint values nonzero.
2. Use the gamma logarithmic derivatives at 1 and 2; keep the conductor Q separate from D_E until their arithmetic identification.

**Direct prerequisites.** `AnalyticNumberTheory:AN.4/quadratic-residue-quotient`, `AnalyticNumberTheory:AN.4/hecke-primitive-functional-equation`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.4: Logarithmic functional equation at zero and one

**Source.** `reviewed-paper-tsimerman-18`, Derived from Thorner-Zaman (2-3)-(2-6), odd gamma factors. Literal title and precise corrected statement of accepted extraction PAPER-TSIMERMAN-18/cm-hecke-log-functional-equation. The original external proof is not certified by its acceptance.

**Unresolved inputs.** Fixed-degree arithmetic analytic estimates.

#### Quadratic Hecke value as residue quotient

**Identifier:** `AnalyticNumberTheory:AN.4/quadratic-residue-quotient`. **Kind:** lemma. **Proposed name:** `TauCeti.AnalyticNumberTheory.quadratic_residue_quotient`.

For a quadratic extension E/F, L_f(1,η)=κ_E/κ_F>0, where κ_K is the positive residue of the continued Dedekind function.

**Construction or proof.**
1. Multiply the continued quadratic factorization by s−1 and take the limit at 1.
2. Cancel the positive κ_F and use holomorphy of the nonprincipal Hecke factor.

**Direct prerequisites.** `AnalyticNumberTheory:AN.4/quadratic-zeta-factorization`, `AnalyticNumberTheory:AN.4/dedekind-zeta-continuation-and-residue`, `AnalyticNumberTheory:AN.4/hecke-nonvanishing-on-line-one`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.4: Quadratic Hecke value as residue quotient

**Source.** `reviewed-paper-tsimerman-18`, Quadratic Euler-factor calculation; Thorner-Zaman 2017 equations (2-1)-(2-7); main Corollary 3.3 adapter. Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

#### Partial ideal zeta series

**Identifier:** `AnalyticNumberTheory:AN.4/partial-ideal-zeta`. **Kind:** definition. **Proposed name:** `TauCeti.AnalyticNumberTheory.partial_ideal_zeta`.

For A in the narrow ideal class group of a real quadratic field, or the ordinary ideal class group of an imaginary quadratic field, let a_A(n) count nonzero integral ideals of norm n in A. Put ζ_A(s)=LSeries a_A s on Re s>1. Index by ideals, not by generators; a_A(0)=0. The carrier remains the imported norm-indexed ideal arithmetic function.

**Construction or proof.**
1. Construct the displayed object on the specified domain using the existing carriers; prove the listed API before its analytic applications.

**Direct prerequisites.** `mathlib:NumberField.dedekindZeta`, `tauceti:TauCetiRoadmap/ArithmeticDirichletSeries#layer-1-norm-fibres-and-mathlib-lseries`.

**API.**

- `partial_ideal_zeta.coeff` (data): a_A(n) is the finite cardinality of integral ideals of positive norm n in A; a_A(0)=0.
- `partial_ideal_zeta.sum_classes` (relation): The sum of ζ_A over all ideal classes is the Dedekind series on Re s>1.
- `partial_ideal_zeta.character_sum` (compatibility): For a class character χ, Σ_A χ(A)ζ_A(s) is its ideal-character LSeries on Re s>1.
- `partial_ideal_zeta.conjugation` (functoriality): In a quadratic field, conjugating ideals takes A to A^−1 and preserves their norms, hence ζ_A=ζ_{A^−1}.

**Unit tests.**

- `partial_ideal_zeta.q` (computation): For K=Q, the unique partial series equals the Riemann series on Re s>1.
- `partial_ideal_zeta.unit` (computation): a_A(1)=1 for the principal class and 0 otherwise.
- `partial_ideal_zeta.no_generators` (computation): The unit ideal contributes once, even when the unit group is infinite.
- `partial_ideal_zeta.zero` (computation): The zero ideal contributes to no coefficient; no norm-zero negative power occurs.

**Acceptance checks.** For K=Q, the unique partial series equals the Riemann series on Re s>1. a_A(1)=1 for the principal class and 0 otherwise. The unit ideal contributes once, even when the unit group is infinite. The zero ideal contributes to no coefficient; no norm-zero negative power occurs.

**Consumers.** PAPER-DUKE-IMAMOGLU-TOTH-16/133: Identify the narrow partial-zeta Hecke periods. PAPER-GROSS-ZAGIER-86/95: Use the same definition with the ordinary class group in the totally complex case.

**Source.** `reviewed-paper-duke-imamoglu-toth-16`, §7, p970. Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

**Unresolved inputs.** Native signatures for imported analytic carriers.

**Atlas planet:** Partial ideal zeta functions.

#### Ideal-character Hecke L-function

**Identifier:** `AnalyticNumberTheory:AN.4/class-character-lseries-comparison`. **Kind:** comparison. **Proposed name:** `TauCeti.AnalyticNumberTheory.class_character_lseries_comparison`.

For a finite narrow-class character χ, L(s,χ)=Σ_aχ(a)N(a)^(−s)=∏_p(1−χ(p)N(p)^(−s))⁻¹, Re(s)>1, and L=Σ_Aχ(A)ζ_A. The printed Euler product omits χ(p); use the corrected one.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction or proof.**
1. Regroup the canonical ideal-character series by its finite class values.
2. Apply ADS Euler products with χ(p) retained in every local factor.

**Direct prerequisites.** `AnalyticNumberTheory:AN.4/partial-ideal-zeta`, `AnalyticNumberTheory:AN.4/hecke-L-function-euler-product-comparison`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.4: Ideal-character Hecke L-function

**Source.** `reviewed-paper-duke-imamoglu-toth-16`, §7, p970. Literal title and precise corrected statement of accepted extraction PAPER-DUKE-IMAMOGLU-TOTH-16/134. The original external proof is not certified by its acceptance.

#### Hecke CM partial-zeta identity

**Identifier:** `AnalyticNumberTheory:AN.4/cm-partial-zeta-period`. **Kind:** theorem. **Proposed name:** `TauCeti.AnalyticNumberTheory.cm_partial_zeta_period`.

For fundamental D<0, π^(−s)Γ(s)ζ_A(s)=(2^s/ω_D)|D|^(−s/2)E*(z_A,s), initially Re(s)>1 then by continuation.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction or proof.**
1. Identify integral ideals in A with the CM lattice quotient, including the exact unit stabilizer.
2. Match E* and the gamma/discriminant normalization on Re s>1.

**Direct prerequisites.** `AnalyticNumberTheory:AN.4/partial-ideal-zeta`, `AnalyticNumberTheory:AN.4/class-character-lseries-comparison`, `AutomorphicSpectralTheory:AS.1`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.4: Hecke CM partial-zeta identity

**Source.** `reviewed-paper-duke-imamoglu-toth-16`, (7.1). Literal title and precise corrected statement of accepted extraction PAPER-DUKE-IMAMOGLU-TOTH-16/135. The original external proof is not certified by its acceptance.

**Unresolved inputs.** Quadratic Hecke period normalizations.

#### Hecke positive-sign real quadratic formula

**Identifier:** `AnalyticNumberTheory:AN.4/real-even-partial-zeta-period`. **Kind:** theorem. **Proposed name:** `TauCeti.AnalyticNumberTheory.real_even_partial_zeta_period`.

For positive fundamental D, π^(−s)Γ(s/2)²D^(s/2)(ζ_A+ζ_{JA})=2∫_{C_A}E*(z,s)ds, initially Re(s)>1 and then by continuation. The proof divides by the full norm-one unit action.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction or proof.**
1. Unfold along the compact real quadratic geodesic and divide by the full norm-one unit action.
2. Sum the A and JA branches; match arc length and the even gamma factor.

**Direct prerequisites.** `AnalyticNumberTheory:AN.4/partial-ideal-zeta`, `AnalyticNumberTheory:AN.4/class-character-lseries-comparison`, `AutomorphicSpectralTheory:AS.1`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.4: Hecke positive-sign real quadratic formula

**Source.** `reviewed-paper-duke-imamoglu-toth-16`, (7.2), p.970 (Hecke; a cited result, 'He showed'). Literal title and precise corrected statement of accepted extraction PAPER-DUKE-IMAMOGLU-TOTH-16/136. The original external proof is not certified by its acceptance.

**Unresolved inputs.** Quadratic Hecke period normalizations.

#### Genus Hecke factorization

**Identifier:** `AnalyticNumberTheory:AN.4/genus-lseries-factorization`. **Kind:** theorem. **Proposed name:** `TauCeti.AnalyticNumberTheory.genus_lseries_factorization`.

(p.971.) Let D = d'd be a fundamental discriminant, with d' and d fundamental discriminants (hence coprime), K = Q(√D), and χ the associated genus character of Cl^+(K). For D > 0, χ(J) = sign d = sign d'. Kronecker's decomposition holds: L(s,χ) = L(s,χ_{d'})L(s,χ_d). Equivalently Λ(s,χ) = Λ(s,χ_{d'})Λ(s,χ_d), with Λ(s,χ) as in (7.4)–(7.5) and Λ(s,χ_d) as in (5.13).

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction or proof.**
1. Reuse the pinned genus character on the narrow class group and its coprime-ideal evaluation.
2. Compare Euler factors at split, inert and every ramified prime; continue only after the convergent identity.

**Direct prerequisites.** `AnalyticNumberTheory:AN.4/class-character-lseries-comparison`, `tauceti:TauCeti.Multiquadratic.genusCharFunNarrowClassGroupHom`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.4: Genus Hecke factorization

**Source.** `reviewed-paper-duke-imamoglu-toth-16`, §7, 'Genus characters', p.971, the unnumbered sentence between (7.7) and (7.8). Literal title and precise corrected statement of accepted extraction PAPER-DUKE-IMAMOGLU-TOTH-16/139. The original external proof is not certified by its acceptance.

**Unresolved inputs.** Quadratic Hecke period normalizations.

#### Theorem3 negative factors

**Identifier:** `AnalyticNumberTheory:AN.4/negative-genus-core-period`. **Kind:** theorem. **Proposed name:** `TauCeti.AnalyticNumberTheory.negative_genus_core_period`.

For s=1/2+it, coprime negative fundamental d,d′ and D=d′d>0, Λ(s,χ_d)Λ(s,χ_{d′})=(s(1−s)/2)Σ_Aχ(A)∫_{F_A}E*(z,s)dμ. First continue the compact boundary Hecke identity from Re(s)>1 to the critical line, then apply Stokes there. The raw core integral diverges when Re(s)>1 and is not its initial definition.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction or proof.**
1. Apply the odd compact-boundary Hecke identity and the genus Euler factorization.
2. Continue this identity to the critical line before applying Stokes; never start from the divergent Re s>1 core integral.

**Direct prerequisites.** `AnalyticNumberTheory:AN.4/real-odd-partial-zeta-period`, `AnalyticNumberTheory:AN.4/genus-lseries-factorization`, `AutomorphicSpectralTheory:AS.1`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.4: Theorem3 negative factors

**Source.** `reviewed-paper-duke-imamoglu-toth-16`, Theorem3 first branch. Literal title and precise corrected statement of accepted extraction PAPER-DUKE-IMAMOGLU-TOTH-16/140. The original external proof is not certified by its acceptance.

**Unresolved inputs.** Quadratic Hecke period normalizations.

#### Theorem3 positive factors

**Identifier:** `AnalyticNumberTheory:AN.4/positive-genus-geodesic-period`. **Kind:** theorem. **Proposed name:** `TauCeti.AnalyticNumberTheory.positive_genus_geodesic_period`.

Let D > 1 be a fundamental discriminant and D = d′d a factorization into positive fundamental discriminants (equivalently, d′, d > 0 coprime fundamental discriminants with d′d > 1; then D is fundamental). Let χ be the genus character. Then Λ(s,χ_{d'})Λ(s,χ_d) = Σ_{A∈Cl^+(K)} χ(A)∫_{C_A} E*(z,s)y^{−1}|dz|, as meromorphic functions of s (7.8). On Re(s) = 1/2 this is the second case of Theorem 3, where ∫_{∂F_A} replaces ∫_{C_A}.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction or proof.**
1. Sum the even compact-geodesic identity against χ and use genus factorization.
2. Identify geodesic and boundary arcs on the critical line with the imported oriented geometric conventions.

**Direct prerequisites.** `AnalyticNumberTheory:AN.4/real-even-partial-zeta-period`, `AnalyticNumberTheory:AN.4/genus-lseries-factorization`, `AutomorphicSpectralTheory:AS.1`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.4: Theorem3 positive factors

**Source.** `reviewed-paper-duke-imamoglu-toth-16`, Theorem 3, second case, p.964; for all s by (7.8), p.972. Literal title and precise corrected statement of accepted extraction PAPER-DUKE-IMAMOGLU-TOTH-16/141. The original external proof is not certified by its acceptance.

**Unresolved inputs.** Quadratic Hecke period normalizations.

#### Theorem3 CM factors

**Identifier:** `AnalyticNumberTheory:AN.4/mixed-genus-cm-period`. **Kind:** theorem. **Proposed name:** `TauCeti.AnalyticNumberTheory.mixed_genus_cm_period`.

For coprime fundamental d,d′ of opposite sign, Λ(s,χ_d)Λ(s,χ_{d′})=(2√π/ω_D)Σ_Aχ(A)E*(z_A,s), as a meromorphic identity.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction or proof.**
1. Sum the CM point partial-zeta identity against the genus character.
2. Match the two Dirichlet gamma factors and the unit factor 2√π/ω_D.

**Direct prerequisites.** `AnalyticNumberTheory:AN.4/cm-partial-zeta-period`, `AnalyticNumberTheory:AN.4/genus-lseries-factorization`, `AutomorphicSpectralTheory:AS.1`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.4: Theorem3 CM factors

**Source.** `reviewed-paper-duke-imamoglu-toth-16`, Theorem 3, third case, p.964 (Re(s) = 1/2); for all s by the display after 'By (7.6) we have when D < 0', p.971. Literal title and precise corrected statement of accepted extraction PAPER-DUKE-IMAMOGLU-TOTH-16/142. The original external proof is not certified by its acceptance.

**Unresolved inputs.** Quadratic Hecke period normalizations.

#### Hecke negative-sign real quadratic formula

**Identifier:** `AnalyticNumberTheory:AN.4/real-odd-partial-zeta-period`. **Kind:** theorem. **Proposed name:** `TauCeti.AnalyticNumberTheory.real_odd_partial_zeta_period`.

For positive fundamental D, π^(−s)Γ((s+1)/2)²D^(s/2)(ζ_A−ζ_{JA})=2∫_{C_A}i∂_zE*(z,s)dz, initially Re(s)>1 and then by continuation. This is the odd archimedean branch, with an oriented differential rather than arc length.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction or proof.**
1. Unfold the oriented differential i∂_zE* dz over the full norm-one unit quotient.
2. Take the A−JA difference and retain Γ((s+1)/2)^2, rather than the even gamma factor.

**Direct prerequisites.** `AnalyticNumberTheory:AN.4/partial-ideal-zeta`, `AnalyticNumberTheory:AN.4/class-character-lseries-comparison`, `AutomorphicSpectralTheory:AS.1`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.4: Hecke negative-sign real quadratic formula

**Source.** `reviewed-paper-duke-imamoglu-toth-16`, (7.3). Literal title and precise corrected statement of accepted extraction PAPER-DUKE-IMAMOGLU-TOTH-16/158. The original external proof is not certified by its acceptance.

**Unresolved inputs.** Quadratic Hecke period normalizations.

#### Siegel lower bound and regulator conversion

**Identifier:** `AnalyticNumberTheory:AN.4/real-quadratic-class-regulator-lower`. **Kind:** theorem. **Proposed name:** `TauCeti.AnalyticNumberTheory.real_quadratic_class_regulator_lower`.

For every ε>0, h⁺(D)log ε_D≥c_ε D^(1/2−ε) for positive fundamental D, with an ineffective c_ε>0 and the narrow regulator convention of DIT item144.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction or proof.**
1. Import the narrow/ordinary class-number and norm-minus-one unit dichotomy.
2. Apply Siegel and the positive real-quadratic residue formula with the specified fundamental unit.

**Direct prerequisites.** `AnalyticNumberTheory:AN.2/siegel-quadratic-lvalue`, `AnalyticNumberTheory:AN.4/dedekind-zeta-continuation-and-residue`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.4: Siegel lower bound and regulator conversion

**Source.** `reviewed-paper-duke-imamoglu-toth-16`, §6, pp967–968. Literal title and precise corrected statement of accepted extraction PAPER-DUKE-IMAMOGLU-TOTH-16/145. The original external proof is not certified by its acceptance.

**Unresolved inputs.** Quadratic regulator dictionary.

#### Siegel lower bound and regulator conversion

**Identifier:** `AnalyticNumberTheory:AN.4/imaginary-quadratic-class-number-lower`. **Kind:** theorem. **Proposed name:** `TauCeti.AnalyticNumberTheory.imaginary_quadratic_class_number_lower`.

For every ε>0, h(D)≥c_ε |D|^(1/2−ε) for negative fundamental D, with an ineffective c_ε>0.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction or proof.**
1. Use the imaginary-quadratic residue formula and the degree-two uniform roots-of-unity bound.
2. Insert Siegel’s primitive quadratic L-value lower bound.

**Direct prerequisites.** `AnalyticNumberTheory:AN.2/siegel-quadratic-lvalue`, `AnalyticNumberTheory:AN.4/dedekind-zeta-continuation-and-residue`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.4: Siegel lower bound and regulator conversion

**Source.** `reviewed-paper-duke-imamoglu-toth-16`, §6, pp967–968. Literal title and precise corrected statement of accepted extraction PAPER-DUKE-IMAMOGLU-TOTH-16/145. The original external proof is not certified by its acceptance.

#### Explicit residue bound for Dedekind zeta functions (Louboutin)

**Identifier:** `AnalyticNumberTheory:AN.4/louboutin-dedekind-residue-upper`. **Kind:** theorem. **Proposed name:** `TauCeti.AnalyticNumberTheory.louboutin_dedekind_residue_upper`.

For degree d>1 the source quotes Res_(s=1) ζ_K(s)≤(e log|D_K|/(2(d−1)))^(d−1).

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction or proof.**
1. Apply the original Louboutin upper bound to the continued Dedekind residue.
2. Keep d>1 and the exact degree-dependent exponent; this upper bound alone does not prove a lower bound.

**Direct prerequisites.** `AnalyticNumberTheory:AN.4/dedekind-zeta-continuation-and-residue`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.4: Explicit residue bound for Dedekind zeta functions (Louboutin)

**Source.** `reviewed-paper-lipnowski-tsimerman-18`, §3.2.2 (24), [18]; used again in §5.4.2 (49). Literal title and precise corrected statement of accepted extraction PAPER-LIPNOWSKI-TSIMERMAN-18/residue-source. The original external proof is not certified by its acceptance.

**Unresolved inputs.** Explicit Dedekind estimates.

#### Lemma 4.3 (most quadratic extensions have many small split primes)

**Identifier:** `AnalyticNumberTheory:AN.4/most-quadratic-many-split-primes`. **Kind:** theorem. **Proposed name:** `TauCeti.AnalyticNumberTheory.most_quadratic_many_split_primes`.

For ε₁ > 0 and X ≥ 2 there is E = E(k, X, ε₁) ⊂ {F/k quadratic, Disc(F/k) ≤ X} with |E| ≪_{[k:ℚ],ε₁} Disc(k)^{ε₁}X^{ε₁}, such that for F ∉ E and 4 ≤ Y ≤ X, π_k(Y; F, e) ≥ (1/8)π_k(Y/2) − C_{[k:ℚ],ε₁}Y^{σ₁}log²(X Disc(k)) with σ₁ = max(1 − ε₁/(4c), 1/2). E consists of the F whose character χ_{F/k} has a zero with ℜρ > σ₁, |ℑρ| ≤ X^{1/2}; the proof is the explicit formula with Lemma 4.1.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction or proof.**
1. Define the exceptional extension set by zeros in the displayed rectangle.
2. Use the ray-class density bound and the quadratic character prime-count comparison from Chebotarev, retaining σ₁ and the whole range 4≤Y≤X.

**Direct prerequisites.** `AnalyticNumberTheory:AN.3/ray-class-zero-density`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.4: Lemma 4.3 (most quadratic extensions have many small split primes)

**Source.** `reviewed-paper-lemkeoliver-wang-wood-25`, Lemma 4.3 and proof, pp.20–22, Forum Math. Pi 13 (2025), e19. Literal title and precise corrected statement of accepted extraction PAPER-LEMKEOLIVER-WANG-WOOD-25/18. The original external proof is not certified by its acceptance.

**Unresolved inputs.** Number-field density and effective prime estimates.

#### Lemma 4.4 (Zaman's effective lower bound for prime ideals)

**Identifier:** `AnalyticNumberTheory:AN.4/effective-prime-ideal-lower`. **Kind:** theorem. **Proposed name:** `TauCeti.AnalyticNumberTheory.effective_prime_ideal_lower`.

For every fixed degree n there is a positive effective c_n and an absolute effective D₀ such that π_k(Y)≥c_n D_k^(−19)Y/log Y whenever [k:Q]=n, D_k≥D₀ and Y≥D_k^35.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction or proof.**
1. Apply the degree-uniform effective Zaman prime-ideal bound with β=35 and γ=19.
2. Retain a discriminant threshold and Y≥D^35.

**Direct prerequisites.** Routine construction on the stated baseline carriers; any nonroutine interface gap is listed below..

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.4: Lemma 4.4 (Zaman's effective lower bound for prime ideals)

**Source.** `reviewed-paper-lemkeoliver-wang-wood-25`, Lemma 4.4, p.22, citing [Zam17], Forum Math. Pi 13 (2025), e19. Literal title and precise corrected statement of accepted extraction PAPER-LEMKEOLIVER-WANG-WOOD-25/19. The original external proof is not certified by its acceptance.

**Unresolved inputs.** Number-field density and effective prime estimates.

#### Heilbronn's theorem on real zeros of Dedekind zeta functions

**Identifier:** `AnalyticNumberTheory:AN.4/heilbronn-simple-real-zero`. **Kind:** theorem. **Proposed name:** `TauCeti.AnalyticNumberTheory.heilbronn_simple_real_zero`.

If K/Q is finite Galois and the continued ζ_K has a simple real zero β with 0<β<1, then some quadratic subfield k⊆K has ζ_k(β)=0.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction or proof.**
1. Use the finite Galois extension and the multiplicity-one real zero in the critical strip.
2. Apply the quadratic-subfield theorem; negative trivial zeros are outside the statement.

**Direct prerequisites.** Routine construction on the stated baseline carriers; any nonroutine interface gap is listed below..

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.4: Heilbronn's theorem on real zeros of Dedekind zeta functions

**Source.** `reviewed-paper-koymans-pagano`, §8.3, proof that Theorem 8.13 implies Theorem 8.10, p. 92; also §8.4, (8.44), p. 104 (arXiv v1). Literal title and precise corrected statement of accepted extraction PAPER-KOYMANS-PAGANO/250. The original external proof is not certified by its acceptance.

**Unresolved inputs.** Koymans–Pagano analytic suppliers.

#### Eisenstein series at a CM point equals a partial zeta function

**Identifier:** `AnalyticNumberTheory:AN.4/gross-zagier-cm-eisenstein-comparison`. **Kind:** theorem. **Proposed name:** `TauCeti.AnalyticNumberTheory.gross_zagier_cm_eisenstein_comparison`.

Let τ_A ∈ 𝔥 be a root of a primitive positive-definite binary quadratic form of discriminant D (K = ℚ(√D), u = #O_K^×/2) in the class A, and E(z, s) as in PAPER-GROSS-ZAGIER-86/94. For Re s > 1: E(τ_A, s) = 2^{−s} |D|^{s/2} u ζ(2s)^{−1} ζ_K(A, s); equivalently 2^s ζ(2s) E(τ_A, s) = u |D|^{s/2} ζ_K(A, s).

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction or proof.**
1. Unfold the exact uncompleted Eisenstein normalization from GZ item94.
2. Convert its primitive lattice sum to the partial ideal zeta, retaining u=#units/2 and ζ(2s).

**Direct prerequisites.** `AnalyticNumberTheory:AN.4/partial-ideal-zeta`, `AutomorphicSpectralTheory:AS.1`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.4: Eisenstein series at a CM point equals a partial zeta function

**Source.** `reviewed-paper-gross-zagier-86`, Chapter II, §4, p. 248 ('As is well-known (and elementary)'); restated p. 252. Literal title and precise corrected statement of accepted extraction PAPER-GROSS-ZAGIER-86/96. The original external proof is not certified by its acceptance.

**Unresolved inputs.** Quadratic Hecke period normalizations.

#### Genus characters of Cl_K and the factorization of their L-series

**Identifier:** `AnalyticNumberTheory:AN.4/imaginary-genus-character-dictionary`. **Kind:** theorem. **Proposed name:** `TauCeti.AnalyticNumberTheory.imaginary_genus_character_dictionary`.

Standing data of Chap. IV (p. 267): K imaginary quadratic of discriminant D, ε = ε_D = (D/·), Cl_K its class group. A genus character is a character χ: Cl_K → {±1}. Such characters correspond bijectively to the unordered decompositions {D₁, D₂} of D as a product D = D₁·D₂ of two fundamental discriminants, one positive and one negative (D₁ = 1 is allowed and gives the trivial character). The character χ_{D₁·D₂} is characterized by χ(𝔞) = ε_{D₁}(N𝔞) = ε_{D₂}(N𝔞) for integral ideals 𝔞 prime to D, where ε_{D_i} is the Dirichlet character of ℚ(√D_i) (ε_1 = 1).

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction or proof.**
1. Reuse the pinned narrow genus-character construction and the totally-complex narrow/ordinary equivalence.
2. Import the finite quadratic discriminant-factorization classification; allow the trivial decomposition with D₁=1.

**Direct prerequisites.** `tauceti:TauCeti.Multiquadratic.genusCharFunNarrowClassGroupHom`, `tauceti:NumberField.NarrowClassGroup.toClassGroupEquiv`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.4: Genus characters of Cl_K and the factorization of their L-series

**Source.** `reviewed-paper-gross-zagier-86`, Chapter IV, introduction, p. 268 (after (0.3); quoted as known). Literal title and precise corrected statement of accepted extraction PAPER-GROSS-ZAGIER-86/172. The original external proof is not certified by its acceptance.

**Unresolved inputs.** Genus character classification.

#### Functional equation of L(s, ε) with root number +1 (quoted input)

**Identifier:** `AnalyticNumberTheory:AN.4/imaginary-quadratic-root-number-one`. **Kind:** theorem. **Proposed name:** `TauCeti.AnalyticNumberTheory.imaginary_quadratic_root_number_one`.

Let ε = (D/·) with D < 0 a fundamental discriminant, δ = |D|. Then Λ(s, ε) := (δ/π)^{(s+1)/2} Γ((s+1)/2) L(s, ε) extends to an entire function and Λ(1−s, ε) = Λ(s, ε). (Used in §4 to swap the two brackets of e*_s(0,y) under s ↦ 2−2k−s, and in §5 to rewrite the n = 0 term of b_{m,r}: ‘We have used the functional equation of L(s, ε)’, p. 290.)

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction or proof.**
1. Compare ζ_K with ζ times the primitive quadratic L-function.
2. Use the Dedekind completed functional equation and the duplication identity to cancel the Riemann completed factor.
3. Continue the resulting root-number-one identity; no unproved Gauss sign is assumed.

**Direct prerequisites.** `AnalyticNumberTheory:AN.4/quadratic-zeta-factorization`, `AnalyticNumberTheory:AN.4/hecke-primitive-functional-equation`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.4: Functional equation of L(s, ε) with root number +1 (quoted input)

**Source.** `reviewed-paper-gross-zagier-86`, Chapter IV, §4, p. 282 (‘by the functional equation of L(s, ε)’) and §5, p. 290 (after (5.4)). Literal title and precise corrected statement of accepted extraction PAPER-GROSS-ZAGIER-86/226. The original external proof is not certified by its acceptance.

**Unresolved inputs.** Quadratic completed-factor normalization.

#### Analytic class number formula for K: L(1, ε) = πh/(u√δ), L(0, ε) = h/u (implicit input)

**Identifier:** `AnalyticNumberTheory:AN.4/imaginary-quadratic-lvalue-one`. **Kind:** theorem. **Proposed name:** `TauCeti.AnalyticNumberTheory.imaginary_quadratic_lvalue_one`.

For an imaginary quadratic field of fundamental discriminant D<0, δ=|D|, class number h and w=2u roots of unity, L(1,ε_D)=πh/(u√δ).

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction or proof.**
1. Use the positive Dedekind residue and the rational quadratic zeta factorization.
2. Insert r₁=0,r₂=1,R=1,w=2u and Res ζ=1.

**Direct prerequisites.** `AnalyticNumberTheory:AN.4/quadratic-residue-quotient`, `AnalyticNumberTheory:AN.4/dedekind-zeta-continuation-and-residue`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.4: Analytic class number formula for K: L(1, ε) = πh/(u√δ), L(0, ε) = h/u (implicit input)

**Source.** `reviewed-paper-gross-zagier-86`, Chapter IV, §4, Propositions (4.4) and (4.5), pp. 283–284 (used without comment). Literal title and precise corrected statement of accepted extraction PAPER-GROSS-ZAGIER-86/229. The original external proof is not certified by its acceptance.

#### Analytic class number formula for K: L(1, ε) = πh/(u√δ), L(0, ε) = h/u (implicit input)

**Identifier:** `AnalyticNumberTheory:AN.4/imaginary-quadratic-lvalue-zero`. **Kind:** theorem. **Proposed name:** `TauCeti.AnalyticNumberTheory.imaginary_quadratic_lvalue_zero`.

With the same imaginary quadratic data, the canonical continued primitive Dirichlet function satisfies L(0,ε_D)=h/u.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction or proof.**
1. Evaluate the root-number-one completed functional equation at 0 and 1.
2. Use Γ(1/2)=√π and Γ(1)=1 to get the exact h/u normalization.

**Direct prerequisites.** `AnalyticNumberTheory:AN.4/imaginary-quadratic-root-number-one`, `AnalyticNumberTheory:AN.4/imaginary-quadratic-lvalue-one`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.4: Analytic class number formula for K: L(1, ε) = πh/(u√δ), L(0, ε) = h/u (implicit input)

**Source.** `reviewed-paper-gross-zagier-86`, Chapter IV, §4, Propositions (4.4) and (4.5), pp. 283–284 (used without comment). Literal title and precise corrected statement of accepted extraction PAPER-GROSS-ZAGIER-86/229. The original external proof is not certified by its acceptance.

#### Artin local polynomial

**Identifier:** `AnalyticNumberTheory:AN.4/artin-local-polynomial`. **Kind:** definition. **Proposed name:** `TauCeti.AnalyticNumberTheory.artin_local_polynomial`.

For a finite Galois extension L/K, a finite-dimensional complex representation ρ of G=Gal(L/K), and a nonzero prime ideal p of K, choose P above p, its decomposition/inertia groups D_P,I_P and arithmetic Frobenius in D_P/I_P. On V^(I_P), Frobenius acts canonically. Define P_p(T)=det(1−T·Frob_P|V^(I_P)) in C[T]. The determinant is independent of P and of a Frobenius lift.

**Construction or proof.**
1. Construct the displayed object on the specified domain using the existing carriers; prove the listed API before its analytic applications.

**Direct prerequisites.** `tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-2-frobenius-elements-and-the-artin-symbol`.

**API.**

- `artin_local_polynomial.independence` (compatibility): Changing P conjugates the invariant-space endomorphism and leaves P_p unchanged.
- `artin_local_polynomial.constant` (simp): P_p(0)=1.
- `artin_local_polynomial.unramified` (compatibility): For unramified p, P_p(T)=det(1−Tρ(Frob_p)) on all of V.
- `artin_local_polynomial.degree` (projection): deg P_p≤dim_C V; its eigenvalues have modulus1.
- `artin_local_polynomial.basis` (extensionality): Changing the finite-dimensional basis does not change the polynomial.

**Unit tests.**

- `artin_local_polynomial.trivial` (computation): For the one-dimensional trivial representation, P_p=1−T at every prime.
- `artin_local_polynomial.zero` (computation): For the zero representation, P_p=1.
- `artin_local_polynomial.ramified_character` (computation): For a one-dimensional character nontrivial on inertia, V^I=0 and P_p=1; using the whole V would give a wrong factor.

**Acceptance checks.** For the one-dimensional trivial representation, P_p=1−T at every prime. For the zero representation, P_p=1. For a one-dimensional character nontrivial on inertia, V^I=0 and P_p=1; using the whole V would give a wrong factor.

**Consumers.** AnalyticNumberTheory:AN.4/artin-induction-versus-artin-holomorphy: Reinstate ramified factors before identifying Artin and Hecke products.

**Source.** `kedlaya-ant-2025`, §22.2, ramified-prime paragraph. Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

**Unresolved inputs.** Artin local determinant and induction proofs; Native signatures for imported analytic carriers.

#### Artin Euler series

**Identifier:** `AnalyticNumberTheory:AN.4/artin-euler-series`. **Kind:** definition. **Proposed name:** `TauCeti.AnalyticNumberTheory.artin_euler_series`.

For the preceding data and Re s>1, L_K(s,ρ)=∏_p P_p((Np)^−s)^−1, over all nonzero prime ideals of K, with complex powers using the positive real norm logarithm. Coefficients are the norm-regrouped reciprocal local-polynomial coefficients, not a completely multiplicative degree-one ideal weight.

**Construction or proof.**
1. Construct the displayed object on the specified domain using the existing carriers; prove the listed API before its analytic applications.

**Direct prerequisites.** `AnalyticNumberTheory:AN.4/artin-local-polynomial`, `tauceti:TauCetiRoadmap/ArithmeticDirichletSeries#layer-1-norm-fibres-and-mathlib-lseries`.

**API.**

- `artin_euler_series.local` (projection): Every local factor is the reciprocal of the inertia-invariant polynomial.
- `artin_euler_series.series` (compatibility): The absolutely convergent Euler product equals the norm-regrouped coefficient LSeries on Re s>1.
- `artin_euler_series.nonzero` (projection): The convergent Euler product is nonzero on Re s>1.
- `artin_euler_series.direct_sum` (relation): The direct-sum identity is exported by the separate lemma below.
- `artin_euler_series.deleted` (compatibility): Omitting a finite bad-prime set multiplies L_K by exactly ∏_{p bad}P_p((Np)^−s).

**Unit tests.**

- `artin_euler_series.trivial` (computation): The one-dimensional trivial representation gives the convergent Dedekind series, including ramified primes.
- `artin_euler_series.zero` (computation): The zero representation gives1.
- `artin_euler_series.ramified` (computation): A one-dimensional character ramified at p contributes local factor1 there.

**Acceptance checks.** The one-dimensional trivial representation gives the convergent Dedekind series, including ramified primes. The zero representation gives1. A one-dimensional character ramified at p contributes local factor1 there.

**Consumers.** AnalyticNumberTheory:AN.4/artin-induction-versus-artin-holomorphy: Apply induction to one canonical Euler product with all local factors.

**Source.** `kedlaya-ant-2025`, §22.2 Euler product and convergence paragraph. Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

**Unresolved inputs.** Artin local determinant and induction proofs; Native signatures for imported analytic carriers.

**Atlas planet:** Artin L-functions.

#### Direct sums of Artin local factors

**Identifier:** `AnalyticNumberTheory:AN.4/artin-direct-sum-factor`. **Kind:** lemma. **Proposed name:** `TauCeti.AnalyticNumberTheory.artin_direct_sum_factor`.

For ρ₁,ρ₂, P_p(ρ₁⊕ρ₂,T)=P_p(ρ₁,T)P_p(ρ₂,T) at every prime, including ramified primes. Hence L(ρ₁⊕ρ₂)=L(ρ₁)L(ρ₂) on Re s>1.

**Construction or proof.**
1. Identify (V₁⊕V₂)^I with V₁^I⊕V₂^I and use the block determinant identity.
2. Multiply the absolutely convergent local identities.

**Direct prerequisites.** `AnalyticNumberTheory:AN.4/artin-local-polynomial`, `AnalyticNumberTheory:AN.4/artin-euler-series`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.4: Direct sums of Artin local factors

**Source.** `kedlaya-ant-2025`, §22.2 direct-sum identity. Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

**Unresolved inputs.** Artin local determinant and induction proofs.

#### Absolute convergence of Artin factors

**Identifier:** `AnalyticNumberTheory:AN.4/artin-absolute-convergence`. **Kind:** lemma. **Proposed name:** `TauCeti.AnalyticNumberTheory.artin_absolute_convergence`.

For fixed dimension d and ε>0, uniformly on Re s≥1+ε, the local factors satisfy |P_p((Np)^−s)^−1−1|≤C_{d,ε}(Np)^−Re s. Their product converges absolutely and locally uniformly and is nonzero there.

**Construction or proof.**
1. Eigenvalues of finite-image Frobenius have modulus1 on V^I.
2. Bound the finite product of (1−α(Np)^−s)^−1 and sum over prime ideals using the convergent Dedekind series.

**Direct prerequisites.** `AnalyticNumberTheory:AN.4/artin-local-polynomial`, `AnalyticNumberTheory:AN.4/artin-euler-series`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.4: Absolute convergence of Artin factors

**Source.** `kedlaya-ant-2025`, §22.2 absolute convergence paragraph. Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

**Unresolved inputs.** Artin local determinant and induction proofs.

#### Induction identity including ramification

**Identifier:** `AnalyticNumberTheory:AN.4/artin-induction-factor`. **Kind:** lemma. **Proposed name:** `TauCeti.AnalyticNumberTheory.artin_induction_factor`.

For H⊆G and a complex finite-dimensional representation σ of H, with F=L^H, L_K(s,Ind_H^G σ)=L_F(s,σ) on Re s>1, including all ramified local factors.

**Construction or proof.**
1. Use the decomposition-group orbit decomposition of G/H, with residue degrees recording the powers of the norm variable.
2. Compare determinants on inertia invariants on each orbit, then multiply the local identities.

**Direct prerequisites.** `AnalyticNumberTheory:AN.4/artin-local-polynomial`, `AnalyticNumberTheory:AN.4/artin-euler-series`, `tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-6-the-virtual-character-ring-artin-and-brauer-induction`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.4: Induction identity including ramification

**Source.** `kedlaya-ant-2025`, §22.4–22.5 induction route. Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

**Unresolved inputs.** Artin local determinant and induction proofs.

#### Linear Artin factors are Hecke factors

**Identifier:** `AnalyticNumberTheory:AN.4/artin-linear-hecke-comparison`. **Kind:** lemma. **Proposed name:** `TauCeti.AnalyticNumberTheory.artin_linear_hecke_comparison`.

A one-dimensional finite Galois character corresponds by global reciprocity to the canonical finite-order Hecke character, and their full L-functions agree on Re s>1 with the same ramified factors.

**Construction or proof.**
1. Use the arithmetic Frobenius reciprocity dictionary and the matching conductor/inertia condition.
2. Compare each local factor, including the degree-zero polynomial at a ramified character.

**Direct prerequisites.** `AnalyticNumberTheory:AN.4/artin-euler-series`, `AnalyticNumberTheory:AN.4/hecke-L-function-euler-product-comparison`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.4: Linear Artin factors are Hecke factors

**Source.** `kedlaya-ant-2025`, §22.5 proof of Theorem22.4. Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

**Unresolved inputs.** Artin local determinant and induction proofs.

#### Global meromorphic Artin continuation

**Identifier:** `AnalyticNumberTheory:AN.4/brauer-meromorphic-continuation`. **Kind:** theorem. **Proposed name:** `TauCeti.AnalyticNumberTheory.brauer_meromorphic_continuation`.

Every finite-image complex Artin Euler series has a meromorphic continuation to C obtained from an integral Brauer expression as a finite product of integer powers of canonical Hecke continuations. This asserts global meromorphy, not Artin holomorphy.

**Construction or proof.**
1. Import integral Brauer induction in the virtual character ring; rational Artin induction is insufficient for this step.
2. Use the ramified induction identity and linear Hecke comparison, then take integer powers of the meromorphic factors.

**Direct prerequisites.** `AnalyticNumberTheory:AN.4/artin-induction-factor`, `AnalyticNumberTheory:AN.4/artin-linear-hecke-comparison`, `tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-6-the-virtual-character-ring-artin-and-brauer-induction`, `AnalyticNumberTheory:AN.4/hecke-primitive-functional-equation`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.4: Global meromorphic Artin continuation

**Source.** `kedlaya-ant-2025`, §22.5 boundary result; integral Brauer strengthening requires its original source. Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

**Unresolved inputs.** Artin local determinant and induction proofs.

**Atlas planet:** Artin meromorphic continuation.

#### Nonnegative ray-character logarithmic coefficients

**Identifier:** `AnalyticNumberTheory:AN.4/ray-character-log-coefficients`. **Kind:** lemma. **Proposed name:** `TauCeti.AnalyticNumberTheory.ray_character_log_coefficients`.

For the finite character group Ĥ of a ray-class quotient H, Σ_{χ∈Ĥ}χ(h^k) is #H if h^k=1 and0 otherwise. Thus the logarithmic coefficients of ∏_χL(s,χ) are nonnegative after norm regrouping, with bad primes omitted consistently.

**Construction or proof.**
1. Import finite-character orthogonality on the actual finite ray quotient.
2. Apply it to each prime power in the absolutely convergent Euler logarithm.

**Direct prerequisites.** `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters`, `tauceti:TauCetiRoadmap/ArithmeticDirichletSeries#layer-3-local-factors-and-euler-products`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.4: Nonnegative ray-character logarithmic coefficients

**Source.** `kedlaya-ant-2025`, §3.4 Theorem3.9. Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

#### Nonreal Hecke characters are nonzero at one

**Identifier:** `AnalyticNumberTheory:AN.4/nonreal-hecke-at-one`. **Kind:** lemma. **Proposed name:** `TauCeti.AnalyticNumberTheory.nonreal_hecke_at_one`.

For a finite-order ray character χ with χ≠χ̄, its canonical L(1,χ) is nonzero.

**Construction or proof.**
1. If L(1,χ)=0, conjugation gives a zero of the same positive order for χ̄.
2. The two zeros exceed the single principal-factor pole order, contradicting order≤0 of the full ray-character product.

**Direct prerequisites.** `AnalyticNumberTheory:AN.4/ray-class-product-nonvanishing`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.4: Nonreal Hecke characters are nonzero at one

**Source.** `kedlaya-ant-2025`, Theorem3.10 nonreal case. Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

#### Positive quadratic auxiliary Euler factors

**Identifier:** `AnalyticNumberTheory:AN.4/quadratic-auxiliary-positive-factors`. **Kind:** lemma. **Proposed name:** `TauCeti.AnalyticNumberTheory.quadratic_auxiliary_positive_factors`.

For a nonprincipal quadratic Hecke character χ, Ψ(s)=L(s,χ)ζ_K(s)/ζ_K(2s) has, on Re s>1, local factors (1+x)/(1−x) when χ(p)=1, 1 when χ(p)=−1, and1+x at omitted character primes, x=(Np)^−s. Hence its norm-regrouped Dirichlet coefficients are nonnegative.

**Construction or proof.**
1. Compute each of the three local factors exactly.
2. Expand the positive power series and multiply/regroup under absolute convergence.

**Direct prerequisites.** `AnalyticNumberTheory:AN.4/hecke-L-function-euler-product-comparison`, `AnalyticNumberTheory:AN.4/dedekind-zeta-continuation-and-residue`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.4: Positive quadratic auxiliary Euler factors

**Source.** `kedlaya-ant-2025`, Theorem3.10 quadratic case. Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

#### Auxiliary holomorphy under vanishing at one

**Identifier:** `AnalyticNumberTheory:AN.4/quadratic-auxiliary-holomorphy`. **Kind:** lemma. **Proposed name:** `TauCeti.AnalyticNumberTheory.quadratic_auxiliary_holomorphy`.

If L(1,χ)=0 for the preceding quadratic character, Ψ extends holomorphically to Re s>1/2. Indeed ζ_K(2s) is nonzero there because Re(2s)>1, and the numerator’s zero cancels ζ_K’s pole at1. At s=1/2, Ψ extends with a zero of order at least1.

**Construction or proof.**
1. Use absolute Euler-product nonvanishing for ζ_K(2s) in Re s>1/2.
2. Cancel the pole at1 under the vanishing hypothesis.
3. At1/2 the denominator has a simple pole while the numerator is holomorphic; the numerator may also vanish, so the zero need not be simple.

**Direct prerequisites.** `AnalyticNumberTheory:AN.4/quadratic-auxiliary-positive-factors`, `AnalyticNumberTheory:AN.4/dedekind-zeta-continuation-and-residue`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.4: Auxiliary holomorphy under vanishing at one

**Source.** `kedlaya-ant-2025`, Theorem3.10 quadratic auxiliary function. Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

#### Landau contradiction for a quadratic character

**Identifier:** `AnalyticNumberTheory:AN.4/quadratic-landau-contradiction`. **Kind:** lemma. **Proposed name:** `TauCeti.AnalyticNumberTheory.quadratic_landau_contradiction`.

The assumption L(1,χ)=0 contradicts nonnegative coefficients of Ψ and the imported Landau abscissa theorem, since Ψ is holomorphic on Re s>1/2 and has a zero at1/2 while a nonzero series with nonnegative coefficients has strictly positive real values in its real convergence range.

**Construction or proof.**
1. Apply the generic ADS8 Landau singularity-at-abscissa theorem to force the abscissa of Ψ to be≤1/2.
2. Use monotone positive partial sums and the finite holomorphic value at1/2 to obtain convergence there; its coefficient at the unit ideal is1, so Ψ(1/2)≥1.
3. Contradict the zero proved by the auxiliary holomorphy lemma.

**Direct prerequisites.** `AnalyticNumberTheory:AN.4/quadratic-auxiliary-positive-factors`, `AnalyticNumberTheory:AN.4/quadratic-auxiliary-holomorphy`, `tauceti:TauCetiRoadmap/ArithmeticDirichletSeries#layer-8-landau-type-positivity`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.4: Landau contradiction for a quadratic character

**Source.** `kedlaya-ant-2025`, Theorem3.10 quadratic case and Landau theorem. Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

**Unresolved inputs.** Landau endpoint convergence for the auxiliary series.

#### Analytic root on a nonvanishing disc

**Identifier:** `AnalyticNumberTheory:AN.4/analytic-root-on-disc`. **Kind:** lemma. **Proposed name:** `TauCeti.AnalyticNumberTheory.analytic_root_on_disc`.

If F is analytic and nonzero on a nonempty complex open disc and m≥1, there is an analytic R on that disc with R^m=F. Any prescribed root at one point fixes R uniquely.

**Construction or proof.**
1. Use the pinned continuous logarithm theorem on the simply connected disc and the analytic upgrade lemma.
2. Set R=exp(L/m), adjusting its root-of-unity constant at the chosen point.
3. The quotient of any two roots is a continuous finite-root-of-unity-valued function, hence constant on the connected disc.

**Direct prerequisites.** `AnalyticNumberTheory:AN.2/continuous-log-analytic-upgrade`, `mathlib:Complex.exists_continuousOn_eqOn_exp_comp`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.4: Analytic root on a nonvanishing disc

**Source.** `kedlaya-ant-2025`, Theorem22.4 root-gluing sketch. Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

#### Overlaps of boundary-centred discs

**Identifier:** `AnalyticNumberTheory:AN.4/boundary-disc-overlap`. **Kind:** lemma. **Proposed name:** `TauCeti.AnalyticNumberTheory.boundary_disc_overlap`.

If two open complex discs centred on Re s=1 intersect, their intersection is connected and contains a point with Re s>1.

**Construction or proof.**
1. Their intersection is convex and open.
2. Reflect a point on or left of the line to the right, preserving its distance from both centres; if it lies on the line, openness gives a small positive real shift.

**Direct prerequisites.** Routine construction on the stated baseline carriers; any nonroutine interface gap is listed below..

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.4: Overlaps of boundary-centred discs

**Source.** `kedlaya-ant-2025`, Geometric lemma for Theorem22.4 root gluing. Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

#### Dedekind completed-functional-equation comparison

**Identifier:** `AnalyticNumberTheory:AN.4/dedekind-completed-functional-equation`. **Kind:** lemma. **Proposed name:** `TauCeti.AnalyticNumberTheory.dedekind_completed_functional_equation`.

For the canonical continued Dedekind function, Λ_K(s)=|D_K|^(s/2)Γ_R(s)^r₁Γ_C(s)^r₂ζ_K^cont(s) satisfies Λ_K(1−s)=Λ_K(s) as a meromorphic identity, with its gamma convention imported from AL.1.

**Construction or proof.**
1. Specialize the Tate global functional equation to the trivial character and the standard local test functions.
2. Use the convergence-half-plane comparison to fix every measure and different factor.

**Direct prerequisites.** `AnalyticNumberTheory:AN.4/dedekind-zeta-continuation-and-residue`, `AutomorphicLFunctionsAndLocalFactors:AL.1/tate-global-functional-equation`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.4: Dedekind completed-functional-equation comparison

**Source.** `tate-thesis-1950`, Tate §4.5 normalization, inherited supplier proof. Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

#### Negative even zeros of the continuation

**Identifier:** `AnalyticNumberTheory:AN.4/dedekind-negative-even-zero`. **Kind:** lemma. **Proposed name:** `TauCeti.AnalyticNumberTheory.dedekind_negative_even_zero`.

For every number field K and n≥1, ζ_K^cont(−2n)=0. The totalized pinned LSeries is not the object being evaluated.

**Construction or proof.**
1. The completed functional equation identifies the left-side completed value with the finite value at1+2n.
2. At−2n at least one archimedean gamma factor has a pole; use the meromorphic orders to force a zero of the uncompleted continuation.

**Direct prerequisites.** `AnalyticNumberTheory:AN.4/dedekind-completed-functional-equation`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.4: Negative even zeros of the continuation

**Source.** `tate-thesis-1950`, §4.5 Dedekind specialization. Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

#### Imprimitive Hecke deleted factors

**Identifier:** `AnalyticNumberTheory:AN.4/imprimitive-hecke-factors`. **Kind:** lemma. **Proposed name:** `TauCeti.AnalyticNumberTheory.imprimitive_hecke_factors`.

For a finite-order Hecke character induced from primitive χ₀, its continued L-function equals L^cont(s,χ₀)∏_{p|f, p∤f₀}(1−χ₀(p)(Np)^−s), with exactly the finite primes deleted by the chosen modulus.

**Construction or proof.**
1. Compare the Euler products on Re s>1, using the canonical conductor dictionary.
2. Continue the finite-factor identity meromorphically.

**Direct prerequisites.** `AnalyticNumberTheory:AN.4/hecke-primitive-functional-equation`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.4: Imprimitive Hecke deleted factors

**Source.** `tate-thesis-1950`, §4.5 Euler factors and conductor. Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

### AnalyticNumberTheory:AN.5

#### Uniform prime-power divisor bound

**Identifier:** `AnalyticNumberTheory:AN.5/prime-power-log-bound`. **Kind:** lemma. **Proposed name:** `TauCeti.AnalyticNumberTheory.prime_power_log_bound`.

For ε>0, integers p≥2 and a≥0, put D=max(1,(ε log 2)⁻¹). Then a+1≤D p^(aε). D is notation for a real expression, not a new carrier.

**Hypotheses.** ε>0; p,a natural; p≥2

**Construction or proof.**
1. Logarithm monotonicity gives log p≥log 2>0. Thus D≥1 and D ε log p≥1.
2. Multiply the latter inequality by a≥0 and add 1≤D to obtain a+1≤D(1+aε log p).
3. Use 1+t≤exp t and p^(aε)=exp(aε log p).

**Direct prerequisites.** `mathlib:Real.log_pos`, `mathlib:Real.log_le_log`, `mathlib:Real.add_one_le_exp`, `mathlib:Real.rpow_def_of_pos`.

**Acceptance checks.** a=0 gives 1≤D. p=2 is included. Without D, ε=1/2,p=2,a=1 would assert 2≤√2, which is false.

**Consumers.** Bennett–Siksek item96; ExponentialSumsAndCircleMethod:ES.0/small-conductor-power-saving: Separate the uniform constant from the eventual size threshold; no squarefree or conductor condition is required.

**Source.** `tao-divisor-2008`, Second proof, exponential estimate and small/large-prime split. Worker refinement of the proof architecture using the cited pinned prime-factorization and real exponential APIs.

#### Large-prime divisor factor bound

**Identifier:** `AnalyticNumberTheory:AN.5/large-prime-power-bound`. **Kind:** lemma. **Proposed name:** `TauCeti.AnalyticNumberTheory.large_prime_power_bound`.

For ε>0, positive integer p and a≥0, exp(1/ε)≤p implies a+1≤p^(aε).

**Hypotheses.** ε>0; p>0; a natural; exp(1/ε)≤p

**Construction or proof.**
1. Apply the exponential/logarithm equivalence to get ε log p≥1.
2. Multiply by a, add 1 and apply 1+t≤exp t; identify the real power.

**Direct prerequisites.** `mathlib:Real.le_log_iff_exp_le`, `mathlib:Real.add_one_le_exp`, `mathlib:Real.rpow_def_of_pos`.

**Acceptance checks.** a=0 is equality. The cutoff is non-strict. Primality is unnecessary for this local inequality.

**Consumers.** Bennett–Siksek item96; ExponentialSumsAndCircleMethod:ES.0/small-conductor-power-saving: Separate the uniform constant from the eventual size threshold; no squarefree or conductor condition is required.

**Source.** `tao-divisor-2008`, Second proof, exponential estimate and small/large-prime split. Worker refinement of the proof architecture using the cited pinned prime-factorization and real exponential APIs.

#### Divisor bounds from local factors

**Identifier:** `AnalyticNumberTheory:AN.5/divisor-bound-from-local-bounds`. **Kind:** lemma. **Proposed name:** `TauCeti.AnalyticNumberTheory.divisor_bound_from_local_bounds`.

Let ε∈ℝ, D≥1 and B∈ℕ. Suppose for every prime p and a∈ℕ that a+1≤D p^(aε) if p≤B, and a+1≤p^(aε) if p>B. For every n>0, τ(n)≤D^B n^ε, with τ(n)=card(n.divisors).

**Hypotheses.** D≥1; B natural; two uniform prime-power hypotheses; n>0

**Construction or proof.**
1. Use Nat.card_divisors to write τ(n)=∏p|n(a_p+1); use Nat.prod_primeFactors_pow_factorization to write n=∏p|n p^a_p.
2. Split the finite prime-factor set at p≤B. Multiply the respective nonnegative local bounds using Finset.prod_le_prod.
3. Repeated Real.mul_rpow and Real.rpow_mul identify the prime-power product with n^ε. At most B small prime divisors occur, since they inject into {1,…,B}.
4. Hence τ(n)≤D^r n^ε with r≤B; D≥1 gives D^r≤D^B.

**Direct prerequisites.** `mathlib:Nat.card_divisors`, `mathlib:Nat.prod_primeFactors_pow_factorization`, `mathlib:Nat.prime_of_mem_primeFactors`, `mathlib:Finset.prod_le_prod`, `mathlib:Real.mul_rpow`, `mathlib:Real.rpow_mul`, `mathlib:Real.rpow_natCast`.

**Acceptance checks.** n=1 has an empty product and τ(1)=1. Repeated prime powers incur one D per small prime, not one per exponent. ε need not be positive once the two local hypotheses are supplied.

**Consumers.** Bennett–Siksek item96; ExponentialSumsAndCircleMethod:ES.0/small-conductor-power-saving: Separate the uniform constant from the eventual size threshold; no squarefree or conductor condition is required.

**Source.** `tao-divisor-2008`, Second proof, exponential estimate and small/large-prime split. Worker refinement of the proof architecture using the cited pinned prime-factorization and real exponential APIs.

#### Explicit divisor subpower bound

**Identifier:** `AnalyticNumberTheory:AN.5/explicit-divisor-subpower-bound`. **Kind:** theorem. **Proposed name:** `TauCeti.AnalyticNumberTheory.explicit_divisor_subpower_bound`.

For ε>0 and any natural B≥exp(1/ε), all positive integers n satisfy τ(n)≤max(1,(ε log 2)⁻¹)^B n^ε. Thus the displayed constant is at least 1 and independent of n.

**Hypotheses.** ε>0; B natural with exp(1/ε)≤B; n>0

**Construction or proof.**
1. Set D=max(1,(ε log 2)⁻¹). Apply the local uniform bound to each prime p≤B.
2. For p>B, the assumed cutoff implies exp(1/ε)≤p; apply the large-prime bound.
3. Apply divisor-bound-from-local-bounds. A certified upper integer B is a permitted input: no exact ceiling evaluation is required.

**Direct prerequisites.** `AnalyticNumberTheory:AN.5/prime-power-log-bound`, `AnalyticNumberTheory:AN.5/large-prime-power-bound`, `AnalyticNumberTheory:AN.5/divisor-bound-from-local-bounds`.

**Acceptance checks.** n=1 is covered. B may be increased without invalidating the estimate. The constant depends only on ε and the chosen certified B, never on n.

**Consumers.** Bennett–Siksek item96; ExponentialSumsAndCircleMethod:ES.0/small-conductor-power-saving: Separate the uniform constant from the eventual size threshold; no squarefree or conductor condition is required.

**Source.** `tao-divisor-2008`, Second proof, exponential estimate and small/large-prime split. Worker refinement of the proof architecture using the cited pinned prime-factorization and real exponential APIs.

#### Uniform divisor subpower bound

**Identifier:** `AnalyticNumberTheory:AN.5/uniform-divisor-subpower-bound`. **Kind:** theorem. **Proposed name:** `TauCeti.AnalyticNumberTheory.uniform_divisor_subpower_bound`.

For every ε>0 there exists a real C≥1 such that τ(n)≤C n^ε for every positive integer n. One choice is C=max(1,(ε log 2)⁻¹)^B for any natural B≥exp(1/ε).

**Hypotheses.** ε>0

**Construction or proof.**
1. Choose B by the Archimedean theorem exists_nat_ge applied to exp(1/ε).
2. Take the explicit constant and use D≥1 to verify C≥1; invoke explicit-divisor-subpower-bound for every n>0.
3. For an effectively presented positive ε, certified bounds for exponential and logarithm produce an effective upper constant. For an arbitrary abstract real ε, this is a mathematical existence assertion, not a uniform executable real-number algorithm.

**Direct prerequisites.** `AnalyticNumberTheory:AN.5/explicit-divisor-subpower-bound`, `mathlib:exists_nat_ge`.

**Acceptance checks.** ε=1/(64c), c>0, supplies the exact ES.0 request for every M>0. C is retained at small inputs; setting C=1 for all n fails at n=2, ε=1/2. No squarefreeness, primitivity or coprimality hypothesis appears.

**Consumers.** Bennett–Siksek item96; ExponentialSumsAndCircleMethod:ES.0/small-conductor-power-saving: Separate the uniform constant from the eventual size threshold; no squarefree or conductor condition is required.

**Source.** `tao-divisor-2008`, Second proof, exponential estimate and small/large-prime split. Worker refinement of the proof architecture using the cited pinned prime-factorization and real exponential APIs.

**Atlas planet:** Divisor subpower bound.

#### Absorption of the divisor-bound constant

**Identifier:** `AnalyticNumberTheory:AN.5/absorb-divisor-bound-constant`. **Kind:** lemma. **Proposed name:** `TauCeti.AnalyticNumberTheory.absorb_divisor_bound_constant`.

For n>0 and ε,δ,C∈ℝ, if τ(n)≤C n^ε and C≤n^(δ−ε), then τ(n)≤n^δ.

**Hypotheses.** n>0; the two displayed inequalities

**Construction or proof.**
1. Multiply C≤n^(δ−ε) by n^ε≥0 and compose with the first inequality.
2. Apply Real.rpow_add at positive n and simplify (δ−ε)+ε=δ.

**Direct prerequisites.** `mathlib:Real.rpow_add`, `mathlib:Real.rpow_nonneg`.

**Acceptance checks.** Equality in the threshold is allowed. δ>ε is not required by this pointwise implication. The threshold is not silently discarded.

**Consumers.** Bennett–Siksek item96; ExponentialSumsAndCircleMethod:ES.0/small-conductor-power-saving: Separate the uniform constant from the eventual size threshold; no squarefree or conductor condition is required.

**Source.** `tao-divisor-2008`, Second proof, exponential estimate and small/large-prime split. Worker refinement of the proof architecture using the cited pinned prime-factorization and real exponential APIs.

#### Eventual unit-constant divisor bound

**Identifier:** `AnalyticNumberTheory:AN.5/eventual-divisor-subpower-bound`. **Kind:** theorem. **Proposed name:** `TauCeti.AnalyticNumberTheory.eventual_divisor_subpower_bound`.

For each δ>0 there exists a natural N≥1 such that every natural n≥N satisfies τ(n)≤n^δ. If C≥1 is the uniform constant at ε=δ/2, any natural N≥max(1,C^(2/δ)) suffices.

**Hypotheses.** δ>0

**Construction or proof.**
1. Use uniform-divisor-subpower-bound with ε=δ/2.
2. Choose natural N≥max(1,C^(2/δ)) using exists_nat_ge.
3. For n≥N, monotonicity of positive real powers and Real.rpow_mul give C≤n^(δ/2). Apply absorb-divisor-bound-constant.

**Direct prerequisites.** `AnalyticNumberTheory:AN.5/uniform-divisor-subpower-bound`, `AnalyticNumberTheory:AN.5/absorb-divisor-bound-constant`, `mathlib:exists_nat_ge`, `mathlib:Real.rpow_le_rpow`, `mathlib:Real.rpow_mul`.

**Acceptance checks.** N≥1 excludes the library's totalized zero input. Replacing δ by 2ε gives the equivalent eventual form used in extraction item96. The result makes no universal claim at n=2.

**Consumers.** Bennett–Siksek item96; ExponentialSumsAndCircleMethod:ES.0/small-conductor-power-saving: Separate the uniform constant from the eventual size threshold; no squarefree or conductor condition is required.

**Source.** `tao-divisor-2008`, Second proof, exponential estimate and small/large-prime split. Worker refinement of the proof architecture using the cited pinned prime-factorization and real exponential APIs.

#### Largest prime factor of a quadratic conductor

**Identifier:** `AnalyticNumberTheory:AN.5/quadratic-conductor-largest-prime`. **Kind:** theorem. **Proposed name:** `TauCeti.AnalyticNumberTheory.quadratic_conductor_largest_prime`.

If N>1 is the conductor of a primitive quadratic character, then P(N)>0.94*log(N).

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction or proof.**
1. Import the prime-discriminant description of a primitive quadratic conductor, including its 2-adic possibilities.
2. Combine the explicit prime-product bounds with certified small-conductor cases; N=24 must be included.

**Direct prerequisites.** Routine construction on the stated baseline carriers; any nonroutine interface gap is listed below..

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.5: Largest prime factor of a quadratic conductor

**Source.** `reviewed-paper-bennett-siksek-20`, Lemma 7.3, p. 375. Literal title and precise corrected statement of accepted extraction PAPER-BENNETT-SIKSEK-20/43. The original external proof is not certified by its acceptance.

**Unresolved inputs.** Certified numerical analytic inputs.

#### Uniform bounded-norm ideal count

**Identifier:** `AnalyticNumberTheory:AN.5/bounded-norm-ideal-count`. **Kind:** theorem. **Proposed name:** `TauCeti.AnalyticNumberTheory.bounded_norm_ideal_count`.

For degree 2g fixed and epsilon>0, the number of integral ideals of norm n is O_{g,epsilon}(n^epsilon), so the number of norm <=X is O_{g,epsilon}(X^(1+epsilon)). Constants are uniform in E.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction or proof.**
1. Combine the coefficient divisor majorant and the fixed-order divisor bound.
2. Sum m^ε for m≤X; no field-dependent constant is introduced.

**Direct prerequisites.** `AnalyticNumberTheory:AN.5/ideal-coefficient-divisor-majorant`, `AnalyticNumberTheory:AN.5/fixed-order-divisor-subpower`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.5: Uniform bounded-norm ideal count

**Source.** `reviewed-paper-tsimerman-18`, 2.2, p. 382. Literal title and precise corrected statement of accepted extraction PAPER-TSIMERMAN-18/small-ideal-count. The original external proof is not certified by its acceptance.

**Unresolved inputs.** Fixed-degree arithmetic analytic estimates.

#### Uniform coefficient bound by a divisor function

**Identifier:** `AnalyticNumberTheory:AN.5/ideal-coefficient-divisor-majorant`. **Kind:** theorem. **Proposed name:** `TauCeti.AnalyticNumberTheory.ideal_coefficient_divisor_majorant`.

For a degree-n number field K, n>=1, let a_K(m) count nonzero integral ideals of norm m. For every m>=1, a_K(m)<=d_n(m), where d_n counts ordered n-tuples of positive integers with product m. At each rational prime the Euler factor product over p-adic prime ideals (1-T^f_i)^(-1) is coefficientwise bounded by (1-T)^(-n), since f_i>=1 and the number of factors is <=n; multiply over primes.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction or proof.**
1. For each rational prime compare ∏_j(1−T^f_j)^−1 coefficientwise with (1−T)^−n.
2. Use f_j≥1 and the number of prime-ideal factors ≤n, then multiply the finite local coefficient comparisons.

**Direct prerequisites.** Routine construction on the stated baseline carriers; any nonroutine interface gap is listed below..

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.5: Uniform coefficient bound by a divisor function

**Source.** `reviewed-paper-tsimerman-18`, Elementary decomposition of the ideal-count input in main section 2.2. Literal title and precise corrected statement of accepted extraction PAPER-TSIMERMAN-18/ideal-coefficient-divisor-majorant. The original external proof is not certified by its acceptance.

**Unresolved inputs.** Fixed-degree arithmetic analytic estimates.

#### Subpolynomial fixed-order divisor function

**Identifier:** `AnalyticNumberTheory:AN.5/fixed-order-divisor-subpower`. **Kind:** theorem. **Proposed name:** `TauCeti.AnalyticNumberTheory.fixed_order_divisor_subpower`.

For each integer n>=1 and epsilon>0 there is C_(n,epsilon) with d_n(m)<=C_(n,epsilon)*m^epsilon for every m>=1. Use d_n(p^a)=binomial(a+n-1,n-1). For large p this is <=n^a<=p^(epsilon*a); for the finitely many smaller primes the supremum of the polynomial in a divided by p^(epsilon*a) is finite. The product of those finitely many constants is independent of m.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction or proof.**
1. Use d_n(p^a)=binomial(a+n−1,n−1)≤n^a for a≥0.
2. Large primes have n≤p^ε; for each smaller prime a polynomial times p^−εa is bounded.
3. Multiply the finitely many small-prime constants, independently of m.

**Direct prerequisites.** Routine construction on the stated baseline carriers; any nonroutine interface gap is listed below..

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.5: Subpolynomial fixed-order divisor function

**Source.** `reviewed-paper-tsimerman-18`, Elementary fixed-degree proof of the bound used in main section 2.2. Literal title and precise corrected statement of accepted extraction PAPER-TSIMERMAN-18/fixed-divisor-subpolynomial. The original external proof is not certified by its acceptance.

**Unresolved inputs.** Fixed-degree arithmetic analytic estimates.

#### Products of distinct medium primes

**Identifier:** `AnalyticNumberTheory:AN.5/medium-prime-products`. **Kind:** definition. **Proposed name:** `TauCeti.AnalyticNumberTheory.medium_prime_products`.

For x≥2 and m≥0, N_m(x) is the finite set of natural products over m-element subsets of {p prime:x/2≤p≤x}. N_0(x)={1}; subsets are unordered and primes are distinct.

**Construction or proof.**
1. Construct the displayed object on the specified domain using the existing carriers; prove the listed API before its analytic applications.

**Direct prerequisites.** Routine construction on the stated baseline carriers; any nonroutine interface gap is listed below..

**API.**

- `medium_prime_products.membership` (characterisation): n∈N_m(x) iff n is a product of an m-element subset of primes in [x/2,x].
- `medium_prime_products.card` (relation): Unique factorization gives #N_m(x)=binomial(#{p prime:x/2≤p≤x},m).
- `medium_prime_products.squarefree` (projection): Every element is squarefree with exactly m prime factors.
- `medium_prime_products.support` (projection): Every prime factor lies in the closed interval [x/2,x].

**Unit tests.**

- `medium_prime_products.zero` (computation): N_0(10)={1}.
- `medium_prime_products.one` (computation): N_1(10)={5,7}.
- `medium_prime_products.two` (computation): N_2(10)={35} and N_3(10)=∅.
- `medium_prime_products.distinct` (computation): 25∉N_2(10), excluding repeated primes and ordered-tuple multiplicity.

**Acceptance checks.** N_0(10)={1}. N_1(10)={5,7}. N_2(10)={35} and N_3(10)=∅. 25∉N_2(10), excluding repeated primes and ordered-tuple multiplicity.

**Consumers.** PAPER-BARYSOROKER-KOUKOULOPOULOS-KOZMA-23/55: Convert prime interval counts to distinct-product counts.

**Source.** `reviewed-paper-barysoroker-koukoulopoulos-kozma-23`, arXiv v3, §3.6 (3.4), p. 26. Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

#### Cardinality of medium-prime products

**Identifier:** `AnalyticNumberTheory:AN.5/medium-prime-cardinality`. **Kind:** theorem. **Proposed name:** `TauCeti.AnalyticNumberTheory.medium_prime_cardinality`.

For fixed integer m≥0, #N_m(x)∼(x/log x)^m/(2^m m!) as x→∞; m is fixed, not uniform in m.

**Construction or proof.**
1. Use the N_m cardinality API, promoted below, and PNT at x and x/2.
2. Use binomial(k,m)∼k^m/m! for fixed m; m=0 is exact.

**Direct prerequisites.** `AnalyticNumberTheory:AN.5/medium-prime-products`, `AnalyticNumberTheory:AN.2/chebyshev-prime-count-transfer`, `AnalyticNumberTheory:AN.5/medium-prime-product-card`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.5: Cardinality of medium-prime products

**Source.** `reviewed-paper-barysoroker-koukoulopoulos-kozma-23`, arXiv v3, §3.5 p. 25; (3.4) p. 26. Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

**Unresolved inputs.** Medium-prime combinatorics.

#### Inverse-totient counting input

**Identifier:** `AnalyticNumberTheory:AN.5/inverse-totient-count`. **Kind:** theorem. **Proposed name:** `TauCeti.AnalyticNumberTheory.inverse_totient_count`.

For real x≥1, #{d∈ℕ_{>0}:φ(d)≤x}=O(x), with an absolute constant.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction or proof.**
1. Use the original inverse-totient counting theorem, with positive integers and φ(d)≤x.
2. No implication is made from a pointwise lower bound on φ alone.

**Direct prerequisites.** Routine construction on the stated baseline carriers; any nonroutine interface gap is listed below..

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.5: Inverse-totient counting input

**Source.** `reviewed-paper-barysoroker-koukoulopoulos-kozma-23`, arXiv v3, Lemma 7.3 p. 37, citing Smati[37]. Literal title and precise corrected statement of accepted extraction PAPER-BARYSOROKER-KOUKOULOPOULOS-KOZMA-23/65. The original external proof is not certified by its acceptance.

**Unresolved inputs.** Inverse-totient count.

#### Maximal-order divisor bound and subpower corollary

**Identifier:** `AnalyticNumberTheory:AN.5/divisor-maximal-order`. **Kind:** theorem. **Proposed name:** `TauCeti.AnalyticNumberTheory.divisor_maximal_order`.

For every ε>0 there is K_ε>e such that for every integer k≥K_ε, τ(k)≤exp((log 2+ε)log k/log log k).

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction or proof.**
1. Split prime factors using the maximal-order argument, retaining the leading constant log 2.
2. The uniform subpower bound is a separate corollary already present in the packet.

**Direct prerequisites.** Routine construction on the stated baseline carriers; any nonroutine interface gap is listed below..

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.5: Maximal-order divisor bound and subpower corollary

**Source.** `reviewed-paper-barysoroker-koukoulopoulos-kozma-23`, arXiv v3, proof of Lemma 3.1, p. 18, citing [18, §18.1, Theorem 317] (Hardy–Wright, sixth edition); subpower use in the proof of Lemma 12.3, p. 60. Literal title and precise corrected statement of accepted extraction PAPER-BARYSOROKER-KOUKOULOPOULOS-KOZMA-23/129. The original external proof is not certified by its acceptance.

**Unresolved inputs.** Divisor maximal order.

#### Even von Mangoldt function

**Identifier:** `AnalyticNumberTheory:AN.5/even-von-mangoldt`. **Kind:** definition. **Proposed name:** `TauCeti.AnalyticNumberTheory.even_von_mangoldt`.

Λ_even(n)=ArithmeticFunction.vonMangoldt(|n|) for n∈Z, including Λ_even(0)=0.

**Construction or proof.**
1. Construct the displayed object on the specified domain using the existing carriers; prove the listed API before its analytic applications.

**Direct prerequisites.** Routine construction on the stated baseline carriers; any nonroutine interface gap is listed below..

**API.**

- `even_von_mangoldt.nat` (compatibility): For positive n this is the pinned von Mangoldt value.
- `even_von_mangoldt.neg` (simp): Λ_even(−n)=Λ_even(n).
- `even_von_mangoldt.zero` (simp): Λ_even(0)=0.

**Unit tests.**

- `even_von_mangoldt.zero` (computation): Λ_even(0)=0.
- `even_von_mangoldt.negative_prime` (computation): Λ_even(−2)=log 2.
- `even_von_mangoldt.power` (computation): Λ_even(−8)=log 2; Λ_even(−6)=0.

**Acceptance checks.** Λ_even(0)=0. Λ_even(−2)=log 2. Λ_even(−8)=log 2; Λ_even(−6)=0.

**Consumers.** PAPER-SKOROBOGATOV-SOFOS-23/28: Integer Fourier sums use an even extension.

**Source.** `reviewed-paper-skorobogatov-sofos-23`, Published §3.1 p. 691. Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

**Unresolved inputs.** Integer truncation supplier identities.

#### Truncated von Mangoldt function

**Identifier:** `AnalyticNumberTheory:AN.5/truncated-von-mangoldt`. **Kind:** definition. **Proposed name:** `TauCeti.AnalyticNumberTheory.truncated_von_mangoldt`.

For real z≥1 and n∈Z, Λ_z(n)=−Σ_{d∈N,1≤d≤z,d|n} μ(d)log d. Divisibility of zero includes every positive d; the sum is finite by its cutoff.

**Construction or proof.**
1. Construct the displayed object on the specified domain using the existing carriers; prove the listed API before its analytic applications.

**Direct prerequisites.** `AnalyticNumberTheory:AN.5/even-von-mangoldt`.

**API.**

- `truncated_von_mangoldt.sum` (characterisation): Evaluation is the cutoff positive-divisor sum.
- `truncated_von_mangoldt.neg` (simp): Λ_z(−n)=Λ_z(n).
- `truncated_von_mangoldt.zero` (simp): Λ_z(0)=−Σ_{1≤d≤z} μ(d)log d.
- `truncated_von_mangoldt.large_cutoff` (compatibility): For n≠0 and z≥|n|, Λ_z(n)=Λ_even(n).

**Unit tests.**

- `truncated_von_mangoldt.zero_two` (computation): Λ_2(0)=log 2, so truncation is not zero at zero.
- `truncated_von_mangoldt.prime_cutoff` (computation): For a prime p, Λ_z(p)=0 when z<p and log p when p≤z.
- `truncated_von_mangoldt.one` (computation): Λ_1(n)=0 for all n.

**Acceptance checks.** Λ_2(0)=log 2, so truncation is not zero at zero. For a prime p, Λ_z(p)=0 when z<p and log p when p≤z. Λ_1(n)=0 for all n.

**Consumers.** PAPER-SKOROBOGATOV-SOFOS-23/97: Keep the isolated zero term in two-sided Fourier sums.

**Source.** `reviewed-paper-skorobogatov-sofos-23`, Published §3.1 p. 691. Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

**Unresolved inputs.** Integer truncation supplier identities.

#### Von Mangoldt truncation error

**Identifier:** `AnalyticNumberTheory:AN.5/mangoldt-truncation-error`. **Kind:** definition. **Proposed name:** `TauCeti.AnalyticNumberTheory.mangoldt_truncation_error`.

E_z(n)=Λ_even(n)−Λ_z(n), for n∈Z and z≥1.

**Construction or proof.**
1. Construct the displayed object on the specified domain using the existing carriers; prove the listed API before its analytic applications.

**Direct prerequisites.** `AnalyticNumberTheory:AN.5/even-von-mangoldt`, `AnalyticNumberTheory:AN.5/truncated-von-mangoldt`.

**API.**

- `mangoldt_truncation_error.sub` (characterisation): E_z is the displayed difference.
- `mangoldt_truncation_error.neg` (simp): E_z(−n)=E_z(n).
- `mangoldt_truncation_error.zero` (simp): E_z(0)=Σ_{1≤d≤z} μ(d)log d.

**Unit tests.**

- `mangoldt_truncation_error.zero_two` (computation): E_2(0)=−log 2.
- `mangoldt_truncation_error.prime` (computation): For p>z, E_z(p)=log p.
- `mangoldt_truncation_error.large_cutoff` (computation): For n≠0 and z≥|n|, E_z(n)=0.

**Acceptance checks.** E_2(0)=−log 2. For p>z, E_z(p)=log p. For n≠0 and z≥|n|, E_z(n)=0.

**Consumers.** PAPER-SKOROBOGATOV-SOFOS-23/97: The positive and two-sided exponential estimates are separated.

**Source.** `reviewed-paper-skorobogatov-sofos-23`, Published §3.1 p. 691. Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

**Unresolved inputs.** Integer truncation supplier identities.

#### Coprime Möbius sums from the prime number theorem ((3.6))

**Identifier:** `AnalyticNumberTheory:AN.5/coprime-mobius-log-sum`. **Kind:** theorem. **Proposed name:** `TauCeti.AnalyticNumberTheory.coprime_mobius_log_sum`.

For every A>0, uniformly in positive integers q≤T^4 and real T≥2, Σ_{1≤t≤T,(t,q)=1} μ(t)log t/t=−q/φ(q)+O_A((log T)^−A).

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction or proof.**
1. Use a coprimality Euler factor and a conductor-uniform Möbius PNT.
2. Prove q≤T^4 uniformity with a sufficiently large logarithmic power before replacing it by A.

**Direct prerequisites.** Routine construction on the stated baseline carriers; any nonroutine interface gap is listed below..

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.5: Coprime Möbius sums from the prime number theorem ((3.6))

**Source.** `reviewed-paper-skorobogatov-sofos-23`, (3.6) in the proof of Lemma 3.11, p. 699, citing [51, Ex. 17, p. 185]; used again in the proof of Lemma 3.14, p. 703. Literal title and precise corrected statement of accepted extraction PAPER-SKOROBOGATOV-SOFOS-23/36. The original external proof is not certified by its acceptance.

**Unresolved inputs.** Möbius and multiplicative-mean uniformity.

#### Wintner-type mean over prime divisors

**Identifier:** `AnalyticNumberTheory:AN.5/prime-divisor-product-mean`. **Kind:** theorem. **Proposed name:** `TauCeti.AnalyticNumberTheory.prime_divisor_product_mean`.

For fixed n∈N,c>0 and f on rational primes with |f(p)|≤c/p, set a(t)=∏_{p|t}(1+f(p))^n for t≥1. Then Σ_{1≤t≤x}a(t)=Cx+O_{n,c}(√x), x≥1, where C=∏_p(1+((1+f(p))^n−1)/p); the product is absolutely convergent and f may be complex.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction or proof.**
1. Expand the prime-divisor product as 1∗g with squarefree g and g(p)=(1+f(p))^n−1.
2. Prove Σ |g(d)|/√d<∞ uniformly in n,c, then use the floor-sum identity.

**Direct prerequisites.** `tauceti:TauCetiRoadmap/ArithmeticDirichletSeries#layer-6-abel-and-perron-summation`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.5: Wintner-type mean over prime divisors

**Source.** `reviewed-paper-skorobogatov-sofos-23`, Published Lemma 4.3 pp. 705–706. Literal title and precise corrected statement of accepted extraction PAPER-SKOROBOGATOV-SOFOS-23/41. The original external proof is not certified by its acceptance.

**Unresolved inputs.** Möbius and multiplicative-mean uniformity.

#### Gamma Euler-product truncation

**Identifier:** `AnalyticNumberTheory:AN.5/gamma-prime-product-tail`. **Kind:** theorem. **Proposed name:** `TauCeti.AnalyticNumberTheory.gamma_prime_product_tail`.

For fixed n∈N and x≥e², ∏_{p>log x}(1−1/p+p^(n−1)/(p−1)^n)=1+O_n(1/log x). The same bound holds after omitting any subset of primes.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction or proof.**
1. Expand the fixed-n local factor, obtaining 1≤γ_n(p)≤1+C_n/(p(p−1)).
2. Bound the absolutely convergent logarithmic tail beyond log x; x≥e² avoids log-zero notation.

**Direct prerequisites.** Routine construction on the stated baseline carriers; any nonroutine interface gap is listed below..

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.5: Gamma Euler-product truncation

**Source.** `reviewed-paper-skorobogatov-sofos-23`, Lemma 4.5 pp. 708–709. Literal title and precise corrected statement of accepted extraction PAPER-SKOROBOGATOV-SOFOS-23/42. The original external proof is not certified by its acceptance.

**Unresolved inputs.** Möbius and multiplicative-mean uniformity.

#### Shifted coprime Möbius sum

**Identifier:** `AnalyticNumberTheory:AN.5/shifted-coprime-mobius-sum`. **Kind:** theorem. **Proposed name:** `TauCeti.AnalyticNumberTheory.shifted_coprime_mobius_sum`.

For every A>0 and uniformly 1≤q≤√T as T→∞, Σ_{t≤T/q,(t,q)=1}μ(t)log(qt)/t=−q/φ(q)+O_A((log T)^{-A}). This is the exactLemma3.11 form used in the Euler-factor calculation; the original PNT-with-coprimality supplier must establish its uniformity.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction or proof.**
1. Expand log(qt)=log q+log t.
2. Apply both coprime Möbius sums at T/q≥√T, with q≤√T, and increase the logarithmic power to absorb log q.

**Direct prerequisites.** `AnalyticNumberTheory:AN.5/coprime-mobius-log-sum`, `AnalyticNumberTheory:AN.5/coprime-mobius-reciprocal-sum`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.5: Shifted coprime Möbius sum

**Source.** `reviewed-paper-skorobogatov-sofos-23`, Published Lemma 3.11 p. 699. Literal title and precise corrected statement of accepted extraction PAPER-SKOROBOGATOV-SOFOS-23/89. The original external proof is not certified by its acceptance.

**Unresolved inputs.** Möbius and multiplicative-mean uniformity.

#### Size of 1/φ(n) and of the divisor function (3.7)

**Identifier:** `AnalyticNumberTheory:AN.5/totient-reciprocal-bound`. **Kind:** theorem. **Proposed name:** `TauCeti.AnalyticNumberTheory.totient_reciprocal_bound`.

For n≥3, 1/φ(n)≤C log log n/n, with an absolute C>0.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction or proof.**
1. Use n/φ(n)=∏_{p|n}(1−1/p)^−1.
2. Split at log n and use Mertens for small primes and a bounded logarithmic tail for large primes.

**Direct prerequisites.** `AnalyticNumberTheory:AN.2/mertens-prime-product`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.5: Size of 1/φ(n) and of the divisor function (3.7)

**Source.** `reviewed-paper-skorobogatov-sofos-23`, Published (3.7) p. 699, citing Montgomery–Vaughan Theorems 2.9 and 2.11. Literal title and precise corrected statement of accepted extraction PAPER-SKOROBOGATOV-SOFOS-23/96. The original external proof is not certified by its acceptance.

**Unresolved inputs.** Möbius and multiplicative-mean uniformity.

#### Coprime Möbius sums from the prime number theorem ((3.6))

**Identifier:** `AnalyticNumberTheory:AN.5/coprime-mobius-reciprocal-sum`. **Kind:** theorem. **Proposed name:** `TauCeti.AnalyticNumberTheory.coprime_mobius_reciprocal_sum`.

For every A>0, uniformly in positive integers q≤T^4 and T≥2, Σ_{1≤t≤T,(t,q)=1} μ(t)/t=O_A((log T)^−A).

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction or proof.**
1. Use the same uniform coprimality Euler factor argument as the logarithmic sum, with one extra partial summation.

**Direct prerequisites.** Routine construction on the stated baseline carriers; any nonroutine interface gap is listed below..

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.5: Coprime Möbius sums from the prime number theorem ((3.6))

**Source.** `reviewed-paper-skorobogatov-sofos-23`, (3.6) in the proof of Lemma 3.11, p. 699, citing [51, Ex. 17, p. 185]; used again in the proof of Lemma 3.14, p. 703. Literal title and precise corrected statement of accepted extraction PAPER-SKOROBOGATOV-SOFOS-23/36. The original external proof is not certified by its acceptance.

#### Integrated prime-divisor mean

**Identifier:** `AnalyticNumberTheory:AN.5/prime-divisor-integrated-mean`. **Kind:** lemma. **Proposed name:** `TauCeti.AnalyticNumberTheory.prime_divisor_integrated_mean`.

With a,C as in the prime-divisor mean lemma, ∫_0^T Σ_{1≤t≤x}a(t)dx=Σ_{1≤t≤T}(T−t)a(t)=CT²/2+O_{n,c}(T^(3/2)), T≥1.

**Construction or proof.**
1. Integrate the finite step sum exactly, then integrate the √x remainder.

**Direct prerequisites.** `AnalyticNumberTheory:AN.5/prime-divisor-product-mean`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.5: Integrated prime-divisor mean

**Source.** `reviewed-paper-skorobogatov-sofos-23`, Published Lemma 4.3 pp. 705–706. Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

#### Landau-type counts

**Identifier:** `AnalyticNumberTheory:AN.5/landau-sum-two-squares-count`. **Kind:** theorem. **Proposed name:** `TauCeti.AnalyticNumberTheory.landau_sum_two_squares_count`.

For K→∞, #{1≤k≤K:k=u²+v² for some integers u,v}∼C_L K/√log K with the positive Landau–Ramanujan constant C_L.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction or proof.**
1. Factor the indicator Dirichlet series by residue classes of primes modulo 4.
2. Apply the square-root Selberg–Delange singularity theorem with its positive constant.

**Direct prerequisites.** Routine construction on the stated baseline carriers; any nonroutine interface gap is listed below..

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.5: Landau-type counts

**Source.** `reviewed-paper-ghosh-sarnak-22`, §1, p.3; §4.1, pp.12–13; §8, p.24, arXiv:1706.06712v3 (final version). Literal title and precise corrected statement of accepted extraction PAPER-GHOSH-SARNAK-22/40. The original external proof is not certified by its acceptance.

#### Landau-type counts

**Identifier:** `AnalyticNumberTheory:AN.5/landau-three-square-form-count`. **Kind:** theorem. **Proposed name:** `TauCeti.AnalyticNumberTheory.landau_three_square_form_count`.

The number of positive k≤K with 4(k−1)=u²+3v² is O(K/√log K), with an absolute constant.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction or proof.**
1. Use the local representation criterion for u²+3v² and the affine substitution 4(k−1).
2. Apply the compatible residue-class multiplicative counting theorem to the exact criterion.

**Direct prerequisites.** Routine construction on the stated baseline carriers; any nonroutine interface gap is listed below..

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.5: Landau-type counts

**Source.** `reviewed-paper-ghosh-sarnak-22`, §1, p.3; §4.1, pp.12–13; §8, p.24, arXiv:1706.06712v3 (final version). Literal title and precise corrected statement of accepted extraction PAPER-GHOSH-SARNAK-22/40. The original external proof is not certified by its acceptance.

#### Landau-type counts

**Identifier:** `AnalyticNumberTheory:AN.5/shifted-square-count`. **Kind:** theorem. **Proposed name:** `TauCeti.AnalyticNumberTheory.shifted_square_count`.

#{1≤k≤K:k−4 is an integer square}≤1+√max(K−4,0), for K≥1.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction or proof.**
1. For each k=u²+4, choose u≥0; the map u↦u²+4 is injective.
2. Count integers 0≤u≤√(K−4) for K≥4.

**Direct prerequisites.** Routine construction on the stated baseline carriers; any nonroutine interface gap is listed below..

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.5: Landau-type counts

**Source.** `reviewed-paper-ghosh-sarnak-22`, §1, p.3; §4.1, pp.12–13; §8, p.24, arXiv:1706.06712v3 (final version). Literal title and precise corrected statement of accepted extraction PAPER-GHOSH-SARNAK-22/40. The original external proof is not certified by its acceptance.

#### Landau-type counts

**Identifier:** `AnalyticNumberTheory:AN.5/landau-exception-union`. **Kind:** theorem. **Proposed name:** `TauCeti.AnalyticNumberTheory.landau_exception_union`.

The union of k=u²+v², 4(k−1)=u²+3v² and k−4=u², with k positive and ≤K, has cardinality ∼C′ K/√log K for a positive C′.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction or proof.**
1. Use the three individual counts for the upper bound.
2. Read the source intersection counts before asserting the positive asymptotic constant for the union.

**Direct prerequisites.** `AnalyticNumberTheory:AN.5/landau-sum-two-squares-count`, `AnalyticNumberTheory:AN.5/landau-three-square-form-count`, `AnalyticNumberTheory:AN.5/shifted-square-count`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.5: Landau-type counts

**Source.** `reviewed-paper-ghosh-sarnak-22`, §1, p.3; §4.1, pp.12–13; §8, p.24, arXiv:1706.06712v3 (final version). Literal title and precise corrected statement of accepted extraction PAPER-GHOSH-SARNAK-22/40. The original external proof is not certified by its acceptance.

**Unresolved inputs.** Landau and Selberg–Delange counts.

#### Landau-type counts

**Identifier:** `AnalyticNumberTheory:AN.5/half-density-prime-support-count`. **Kind:** theorem. **Proposed name:** `TauCeti.AnalyticNumberTheory.half_density_prime_support_count`.

Fix M≥1 and R⊆(ZMod M)^× with #R=φ(M)/2, and omit the finitely many primes dividing M. Let H be the subgroup of (ZMod M)^× generated by R. For every a∈H, the count of 1≤ν≤X with all prime factors in R modulo M and ν≡a mod M is comparable to X/√log X, with positive constants depending on M,R,a. Classes a∉H have count zero.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction or proof.**
1. Use fixed congruence classes R in the reduced residue classes modulo M, with #R=φ(M)/2.
2. Factor the multiplicative indicator Dirichlet series and apply Selberg–Delange with a compatible residue class.

**Direct prerequisites.** Routine construction on the stated baseline carriers; any nonroutine interface gap is listed below..

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.5: Landau-type counts

**Source.** `reviewed-paper-ghosh-sarnak-22`, §1, p.3; §4.1, pp.12–13; §8, p.24, arXiv:1706.06712v3 (final version). Literal title and precise corrected statement of accepted extraction PAPER-GHOSH-SARNAK-22/40. The original external proof is not certified by its acceptance.

**Unresolved inputs.** Landau and Selberg–Delange counts.

#### Logarithmic weight of prime divisors

**Identifier:** `AnalyticNumberTheory:AN.5/prime-divisor-log-weight`. **Kind:** lemma. **Proposed name:** `TauCeti.AnalyticNumberTheory.prime_divisor_log_weight`.

For every integer N≥2, Σ_{p|N}(log p)/p≤log log N+C for one absolute real C.

**Construction or proof.**
1. For N sufficiently large, split at X=log N. Use Mertens’s first theorem for the small primes.
2. For the large primes use 1/p≤1/log N and Σ_{p|N}log p≤log N, so their total is ≤1.
3. Absorb the finitely many small N into C; log log N is permitted to be negative.

**Direct prerequisites.** `AnalyticNumberTheory:AN.2/mertens-first-theorem`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.5: Logarithmic weight of prime divisors

**Source.** `reviewed-paper-shankar-shankar-tang-etal-22`, Proof of Proposition 5.2, p.27. Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

#### Asymptotic for |𝒟(X)| (classical, cited)

**Identifier:** `AnalyticNumberTheory:AN.5/restricted-squarefree-landau-count`. **Kind:** theorem. **Proposed name:** `TauCeti.AnalyticNumberTheory.restricted_squarefree_landau_count`.

For D(X)={1≤n≤X:n squarefree and every odd prime factor p satisfies p≡1 mod4}, #D(X)=C X/√log X·(1+O(1/log X)) for some C>0.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction or proof.**
1. Use the indicator of squarefree integers supported on primes 2 and p≡1 mod4.
2. Apply its square-root Dirichlet-series singularity with the positive constant C.

**Direct prerequisites.** Routine construction on the stated baseline carriers; any nonroutine interface gap is listed below..

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.5: Asymptotic for |𝒟(X)| (classical, cited)

**Source.** `reviewed-paper-koymans-pagano`, §1, running text, p. 3 (arXiv v1). Literal title and precise corrected statement of accepted extraction PAPER-KOYMANS-PAGANO/10. The original external proof is not certified by its acceptance.

**Unresolved inputs.** Koymans–Pagano analytic suppliers.

#### Theorem 7.2(b): Sathe–Selberg-type bounds for |𝒟_r(N)|, (7.3)

**Identifier:** `AnalyticNumberTheory:AN.5/restricted-sathe-selberg-count`. **Kind:** theorem. **Proposed name:** `TauCeti.AnalyticNumberTheory.restricted_sathe_selberg_count`.

For every A > 0 there are C₁, C₂, N₀ > 0 such that for all integers 1 ≤ r ≤ A log log N and all N ≥ N₀: C₁ · (N / log N) · (½ log log N)^{r−1} / (r − 1)! ≤ |𝒟_r(N)| ≤ C₂ · (N / log N) · (½ log log N)^{r−1} / (r − 1)!.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction or proof.**
1. Add the prime-factor-count parameter to the squarefree Euler product.
2. Prove the coefficient estimate uniformly for 1≤r≤A log log N, with constants depending on A.

**Direct prerequisites.** Routine construction on the stated baseline carriers; any nonroutine interface gap is listed below..

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.5: Theorem 7.2(b): Sathe–Selberg-type bounds for |𝒟_r(N)|, (7.3)

**Source.** `reviewed-paper-koymans-pagano`, §7.1, Theorem 7.2, (7.3), p. 60 (arXiv v1). Literal title and precise corrected statement of accepted extraction PAPER-KOYMANS-PAGANO/176. The original external proof is not certified by its acceptance.

**Unresolved inputs.** Koymans–Pagano analytic suppliers.

#### Pretentious distance

**Identifier:** `AnalyticNumberTheory:AN.5/pretentious-distance`. **Kind:** definition. **Proposed name:** `TauCeti.AnalyticNumberTheory.pretentious_distance`.

For complex-valued f,g on positive integers and x≥1, D(f,g;x)=sqrt(Σ_{p≤x}(1−Re(f(p)conj(g(p))))/p), used under |f(p)|,|g(p)|≤1. This is a distance on prime data, not a metric on all multiplicative functions: D(f,f;x) can be positive if |f(p)|<1.

**Construction or proof.**
1. Construct the displayed object on the specified domain using the existing carriers; prove the listed API before its analytic applications.

**Direct prerequisites.** Routine construction on the stated baseline carriers; any nonroutine interface gap is listed below..

**API.**

- `pretentious_distance.square` (characterisation): D² is the displayed nonnegative finite prime sum under the unit-disc hypotheses.
- `pretentious_distance.symmetric` (relation): D(f,g;x)=D(g,f;x).
- `pretentious_distance.cutoff` (functoriality): For 1≤x≤y the squared distance is nondecreasing.
- `pretentious_distance.unit_diagonal` (simp): If |f(p)|=1 for p≤x, then D(f,f;x)=0.
- `pretentious_distance.prime_data` (extensionality): Equal values on all primes≤x give equal distances.

**Unit tests.**

- `pretentious_distance.unit` (computation): D(1,1;x)=0.
- `pretentious_distance.minus` (computation): D(1,−1;x)²=2Σ_{p≤x}1/p.
- `pretentious_distance.disc` (non-example): D(0,0;2)²=1/2, disproving an unqualified metric diagonal axiom.
- `pretentious_distance.empty` (computation): D(f,g;1)=0.

**Acceptance checks.** D(1,1;x)=0. D(1,−1;x)²=2Σ_{p≤x}1/p. D(0,0;2)²=1/2, disproving an unqualified metric diagonal axiom. D(f,g;1)=0.

**Consumers.** AnalyticNumberTheory:AN.5/halasz-classical: Measure approximation to the completely multiplicative twist n^(it).

**Source.** `pretentious-gs`, pp2–4, M(x,T) and weighted unit-disc norm. Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

**Atlas planet:** Pretentious distance.

#### Triangle inequality for pretentious products

**Identifier:** `AnalyticNumberTheory:AN.5/pretentious-product-triangle`. **Kind:** lemma. **Proposed name:** `TauCeti.AnalyticNumberTheory.pretentious_product_triangle`.

For |f_j(p)|,|g_j(p)|≤1, D(f₁f₂,g₁g₂;x)≤D(f₁,g₁;x)+D(f₂,g₂;x). If all g_j have unit modulus on the primes, this gives the usual triangle inequality for prime data.

**Construction or proof.**
1. Use sqrt(1−Re(zw))≤sqrt(1−Re z)+sqrt(1−Re w) on the closed unit disc.
2. Apply the finite weighted Cauchy–Schwarz inequality to the prime sum.

**Direct prerequisites.** `AnalyticNumberTheory:AN.5/pretentious-distance`, `AnalyticNumberTheory:AN.5/pretentious-square-nonnegative`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.5: Triangle inequality for pretentious products

**Source.** `pretentious-gs`, pp3–4, norm product triangle argument. Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

**Unresolved inputs.** Halász proof decomposition.

#### Logarithmic-derivative coefficient class

**Identifier:** `AnalyticNumberTheory:AN.5/halasz-coefficient-class`. **Kind:** definition. **Proposed name:** `TauCeti.AnalyticNumberTheory.halasz_coefficient_class`.

For κ>0, C(κ) consists of multiplicative arithmetic functions f with f(1)=1 for which F(s)=Σf(n)n^−s, an Euler-compatible logF series and −F′/F(s)=ΣΛ_f(n)n^−s converge absolutely on Re s>1, and |Λ_f(n)|≤κΛ(n). The logarithm is the branch fixed by the Euler expansion and tends to0 as real s→∞.

**Construction or proof.**
1. Construct the displayed object on the specified domain using the existing carriers; prove the listed API before its analytic applications.

**Direct prerequisites.** Routine construction on the stated baseline carriers; any nonroutine interface gap is listed below..

**API.**

- `halasz_coefficient_class.log_coeff` (data): The coefficients Λ_f are uniquely determined by their absolutely convergent Dirichlet series.
- `halasz_coefficient_class.majorant` (projection): |Λ_f(n)|≤κΛ(n) for every n, hence they vanish away from prime powers.
- `halasz_coefficient_class.nonzero` (compatibility): The Euler-compatible exponential identity gives F(s)≠0 on Re s>1.
- `halasz_coefficient_class.mono` (functoriality): If κ≤κ′, C(κ)⊆C(κ′).

**Unit tests.**

- `halasz_coefficient_class.one` (computation): f(n)=1 belongs to C(1), with Λ_f=Λ.
- `halasz_coefficient_class.mobius` (computation): μ belongs to C(1), with Λ_f=−Λ.
- `halasz_coefficient_class.twist` (computation): f(n)=n^(it) belongs to C(1), with Λ_f(n)=n^(it)Λ(n).
- `halasz_coefficient_class.growth` (computation): f(n)=n belongs to no fixed C(κ), since |Λ_f(p)|=p log p.

**Acceptance checks.** f(n)=1 belongs to C(1), with Λ_f=Λ. μ belongs to C(1), with Λ_f=−Λ. f(n)=n^(it) belongs to C(1), with Λ_f(n)=n^(it)Λ(n). f(n)=n belongs to no fixed C(κ), since |Λ_f(p)|=p log p.

**Consumers.** AnalyticNumberTheory:AN.5/halasz-integral-bound: The source extends the bounded-multiplicative mean theorem to logarithmic-derivative majorants.

**Source.** `halasz-ghs`, §1 pp1–2, definition of C(κ). Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

**Unresolved inputs.** Halász proof decomposition; Native signatures for imported analytic carriers.

#### Halász integral mean bound

**Identifier:** `AnalyticNumberTheory:AN.5/halasz-integral-bound`. **Kind:** theorem. **Proposed name:** `TauCeti.AnalyticNumberTheory.halasz_integral_bound`.

For fixed κ>0, f∈C(κ) and sufficiently large x, |Σ_{n≤x}f(n)|≤C_κ x/log x ·∫_{1/log x}^1 max_{|t|≤(log x)^κ}|F(1+σ+it)/(1+σ+it)| dσ/σ + C_κ x(log log x)^κ/log x. The constant is uniform in f.

**Construction or proof.**
1. Split the Euler product into primes≤y and>y.
2. Use the exact double-integral identity and finite-height Perron truncation.
3. Apply the logarithmic-coefficient Dirichlet-polynomial mean-square bound and Cauchy–Schwarz; take y=(log x)^(2κ+2).

**Direct prerequisites.** `AnalyticNumberTheory:AN.5/halasz-coefficient-class`, `tauceti:TauCetiRoadmap/ArithmeticDirichletSeries#layer-6-abel-and-perron-summation`, `SieveMethodsAndPrimePatterns:SV.4`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.5: Halász integral mean bound

**Source.** `halasz-ghs`, Theorem1.1 and §2. Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

**Unresolved inputs.** Halász proof decomposition.

**Atlas planet:** Halász theorem.

#### Pretentious Halász mean bound

**Identifier:** `AnalyticNumberTheory:AN.5/halasz-classical`. **Kind:** theorem. **Proposed name:** `TauCeti.AnalyticNumberTheory.halasz_classical`.

For multiplicative |f(n)|≤1, x≥2,T≥1, let M(x,T)=min_{|t|≤2T}D(f,n^(it);x)². Then |Σ_{n≤x}f(n)|/x≤C((1+M)e^−M+T^−1/2), with an absolute C; increasing C handles bounded x.

**Construction or proof.**
1. Use the classical Halász theorem with the twist-minimum convention |t|≤2T.
2. The phase n^(it) and its complex conjugate in the distance give Re(f(p)p^−it) in the sum.

**Direct prerequisites.** `AnalyticNumberTheory:AN.5/pretentious-distance`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.5: Pretentious Halász mean bound

**Source.** `pretentious-gs`, p2, displayed Halász bound. Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

**Unresolved inputs.** Halász proof decomposition.

#### Smooth-number counting function

**Identifier:** `AnalyticNumberTheory:AN.5/smooth-count`. **Kind:** definition. **Proposed name:** `TauCeti.AnalyticNumberTheory.smooth_count`.

For x≥1,y≥2, Ψ(x,y)=#{1≤n≤floor x:every prime factor of n is≤y}. Express the set using Nat.smoothNumbers(floor y+1); the pinned carrier uses prime factors strictly below its cutoff.

**Construction or proof.**
1. Construct the displayed object on the specified domain using the existing carriers; prove the listed API before its analytic applications.

**Direct prerequisites.** `mathlib:Nat.smoothNumbers`, `mathlib:Nat.smoothNumbersUpTo`.

**API.**

- `smooth_count.floor` (compatibility): Ψ(x,y) counts the positive naturals≤floor x in Nat.smoothNumbers(floor y+1).
- `smooth_count.mono` (functoriality): Ψ is nondecreasing in each real parameter.
- `smooth_count.large_y` (simp): For y≥x≥2, Ψ(x,y)=floor x.
- `smooth_count.unit` (simp): The integer1 always contributes once.

**Unit tests.**

- `smooth_count.two` (computation): Ψ(8,2)=4, counting1,2,4,8.
- `smooth_count.inclusive` (computation): Ψ(6,3)=5, counting1,2,3,4,6; the prime3 is included.
- `smooth_count.zero` (computation): 0 is never counted.

**Acceptance checks.** Ψ(8,2)=4, counting1,2,4,8. Ψ(6,3)=5, counting1,2,3,4,6; the prime3 is included. 0 is never counted.

**Consumers.** AnalyticNumberTheory:AN.5/dickman-fixed-u: Fixed-u smooth-integer asymptotics.

**Source.** `smooth-ht`, Introduction pp412–415. Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

**Atlas planet:** Smooth numbers.

#### Dickman function

**Identifier:** `AnalyticNumberTheory:AN.5/dickman-function`. **Kind:** definition. **Proposed name:** `TauCeti.AnalyticNumberTheory.dickman_function`.

ρ:R→R is0 for u<0, equals1 for0≤u≤1, is continuous on[0,∞), and satisfies uρ′(u)=−ρ(u−1) on u>1. Construct it recursively on intervals[k,k+1] by integration; the value at0 is1, so no continuity across negative u is claimed.

**Construction or proof.**
1. Construct the displayed object on the specified domain using the existing carriers; prove the listed API before its analytic applications.

**Direct prerequisites.** Routine construction on the stated baseline carriers; any nonroutine interface gap is listed below..

**API.**

- `dickman_function.initial` (simp): ρ(u)=1 on[0,1].
- `dickman_function.recursion` (characterisation): For u≥1, ρ(u)=1−∫_1^u ρ(t−1)/t dt.
- `dickman_function.unique` (extensionality): These initial values and the delay equation determine ρ uniquely on[0,∞).
- `dickman_function.positive` (projection): ρ(u)>0 for every finite u≥0, and ρ is nonincreasing on[0,∞).

**Unit tests.**

- `dickman_function.zero` (computation): ρ(0)=ρ(1)=1.
- `dickman_function.two` (computation): ρ(2)=1−log2.
- `dickman_function.negative` (computation): ρ(−1)=0; extending1 to negative u would violate the convention.

**Acceptance checks.** ρ(0)=ρ(1)=1. ρ(2)=1−log2. ρ(−1)=0; extending1 to negative u would violate the convention.

**Consumers.** AnalyticNumberTheory:AN.5/dickman-fixed-u: Main term in the fixed-u limit of Ψ.

**Source.** `smooth-ht`, pp414–415 and §2. Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

**Unresolved inputs.** Dickman construction and limiting recursion.

**Atlas planet:** Dickman function.

#### Dickman fixed-u asymptotic

**Identifier:** `AnalyticNumberTheory:AN.5/dickman-fixed-u`. **Kind:** theorem. **Proposed name:** `TauCeti.AnalyticNumberTheory.dickman_fixed_u`.

For each fixed u>0, Ψ(x,x^(1/u))/x→ρ(u) as x→∞. This statement is not uniform for u tending to infinity.

**Construction or proof.**
1. Use the largest-prime-factor decomposition of Ψ and partial summation of rational prime counts.
2. Identify the limiting recursion with the unique Dickman delay solution; prove uniformity on each bounded u interval before passing to a fixed u.

**Direct prerequisites.** `AnalyticNumberTheory:AN.5/smooth-count`, `AnalyticNumberTheory:AN.5/dickman-function`, `AnalyticNumberTheory:AN.2/chebyshev-prime-count-transfer`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.5: Dickman fixed-u asymptotic

**Source.** `smooth-ht`, p414 Dickman formula; §§2–3. Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

**Unresolved inputs.** Dickman construction and limiting recursion.

#### Rankin smooth-number upper bound

**Identifier:** `AnalyticNumberTheory:AN.5/smooth-rankin-bound`. **Kind:** theorem. **Proposed name:** `TauCeti.AnalyticNumberTheory.smooth_rankin_bound`.

For x≥1,y≥2 and σ>0, Ψ(x,y)≤x^σ∏_{p≤y}(1−p^−σ)^−1. The finite-prime Euler product is finite and each geometric series converges.

**Construction or proof.**
1. For each counted n, 1≤(x/n)^σ.
2. Enlarge the positive n sum to all y-smooth positive integers and factor over the finitely many primes.

**Direct prerequisites.** `AnalyticNumberTheory:AN.5/smooth-count`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.5: Rankin smooth-number upper bound

**Source.** `smooth-ht`, p414 Rankin method. Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

#### Dirichlet divisor average

**Identifier:** `AnalyticNumberTheory:AN.5/dirichlet-divisor-average`. **Kind:** theorem. **Proposed name:** `TauCeti.AnalyticNumberTheory.dirichlet_divisor_average`.

For x≥2, Σ_{1≤n≤x}τ(n)=x log x+(2γ−1)x+O(√x), with an absolute constant and inclusive real cutoff.

**Construction or proof.**
1. Apply the exact hyperbola identity 2Σ_{n≤√x}floor(x/n)−floor(√x)^2.
2. Use the harmonic-sum constant γ with an O(1/N) error and control the floor errors.

**Direct prerequisites.** `AnalyticNumberTheory:AN.5/uniform-divisor-subpower-bound`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.5: Dirichlet divisor average

**Source.** `atlas-an-brief`, AN.5 target specification. Fully specified target. Its original proof is explicitly unacquired; the gap lists the required source and nonroutine inputs.

**Unresolved inputs.** Divisor-average source and harmonic constant.

#### Second moment of zeta

**Identifier:** `AnalyticNumberTheory:AN.5/zeta-second-moment`. **Kind:** theorem. **Proposed name:** `TauCeti.AnalyticNumberTheory.zeta_second_moment`.

As T→∞, ∫_0^T|ζ(1/2+it)|²dt=T log(T/(2π))+(2γ−1)T+O(√T log T), with an absolute constant.

**Construction or proof.**
1. Use a proved approximate functional equation with its uniform error.
2. Integrate the diagonal and control off-diagonal terms using a Dirichlet-polynomial mean value theorem.

**Direct prerequisites.** Routine construction on the stated baseline carriers; any nonroutine interface gap is listed below..

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.5: Second moment of zeta

**Source.** `atlas-an-brief`, AN.5 target specification. Fully specified target. Its original proof is explicitly unacquired; the gap lists the required source and nonroutine inputs.

**Unresolved inputs.** Proved moments and conjectural model normalization.

#### Fourth moment of zeta

**Identifier:** `AnalyticNumberTheory:AN.5/zeta-fourth-moment`. **Kind:** theorem. **Proposed name:** `TauCeti.AnalyticNumberTheory.zeta_fourth_moment`.

As T→∞, ∫_0^T|ζ(1/2+it)|⁴dt=(1/(2π²))T(log T)^4+O(T(log T)^3), with an absolute constant.

**Construction or proof.**
1. Use the original Ingham fourth-moment proof, including its approximate functional equation.
2. Separate diagonal and off-diagonal estimates; the second-moment theorem does not imply this constant.

**Direct prerequisites.** Routine construction on the stated baseline carriers; any nonroutine interface gap is listed below..

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.5: Fourth moment of zeta

**Source.** `atlas-an-brief`, AN.5 target specification. Fully specified target. Its original proof is explicitly unacquired; the gap lists the required source and nonroutine inputs.

**Unresolved inputs.** Proved moments and conjectural model normalization.

#### Moment model as a conditional comparison

**Identifier:** `AnalyticNumberTheory:AN.5/moment-model-comparison`. **Kind:** comparison. **Proposed name:** `TauCeti.AnalyticNumberTheory.moment_model_comparison`.

For each fixed k>0, the statement ∫_0^T|ζ(1/2+it)|^(2k)dt∼a(k)g(k)T(log T)^(k²) is a conjectural model with the arithmetic Euler factor a(k) and random-matrix factor g(k) supplied by PM.5. No asymptotic for general k is asserted unconditionally; k=1 and2 are checked against the proved moments.

**Construction or proof.**
1. Import the actual probability/model carrier and exact a(k),g(k) normalization from PM.5.
2. Compare k=1 and2 constants with the analytic moment theorems; treat other k as a named hypothesis.

**Direct prerequisites.** `AnalyticNumberTheory:AN.5/zeta-second-moment`, `AnalyticNumberTheory:AN.5/zeta-fourth-moment`, `ProbabilisticAndMetricNumberTheory:PM.5`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.5: Moment model as a conditional comparison

**Source.** `atlas-an-brief`, AN.5 target specification. Fully specified target. Its original proof is explicitly unacquired; the gap lists the required source and nonroutine inputs.

**Unresolved inputs.** Proved moments and conjectural model normalization.

#### Beurling prime system

**Identifier:** `AnalyticNumberTheory:AN.5/beurling-prime-system`. **Kind:** definition. **Proposed name:** `TauCeti.AnalyticNumberTheory.beurling_prime_system`.

A discrete Beurling prime system is a nondecreasing sequence of real numbers1<p₁≤p₂≤… tending to∞. Generalized integers are finite-support exponent vectors a:N→N, with norm∏p_j^(a_j); coincident real values are counted with multiplicity. N(x) counts these vectors of norm≤x, and π_P(x) counts the prime indices with p_j≤x.

**Construction or proof.**
1. Construct the displayed object on the specified domain using the existing carriers; prove the listed API before its analytic applications.

**Direct prerequisites.** Routine construction on the stated baseline carriers; any nonroutine interface gap is listed below..

**API.**

- `beurling_prime_system.norm` (data): The norm is the finite product with exponent multiplicities.
- `beurling_prime_system.finite` (projection): Only finitely many exponent vectors have norm≤x, because only finitely many primes≤x occur and p₁>1 bounds every exponent.
- `beurling_prime_system.unit` (simp): The zero exponent vector has norm1 and is counted once.
- `beurling_prime_system.multiplicity` (characterisation): Equal real products from different vectors contribute separately to N.
- `beurling_prime_system.ordinary` (compatibility): Taking the increasing ordinary prime sequence recovers the ordinary positive integers and prime count.

**Unit tests.**

- `beurling_prime_system.ordinary` (computation): The ordinary primes give N(10)=10.
- `beurling_prime_system.repeated` (computation): If p₁=p₂=2<p₃, N(2)=3, counting the unit and two distinct norm2 vectors.
- `beurling_prime_system.unit` (computation): For1≤x<p₁, N(x)=1 and π_P(x)=0.
- `beurling_prime_system.invalid` (non-example): A sequence with p₁=1 is rejected because N(x) would have infinitely many unit powers.

**Acceptance checks.** The ordinary primes give N(10)=10. If p₁=p₂=2<p₃, N(2)=3, counting the unit and two distinct norm2 vectors. For1≤x<p₁, N(x)=1 and π_P(x)=0. A sequence with p₁=1 is rejected because N(x) would have infinitely many unit powers.

**Consumers.** AnalyticNumberTheory:AN.5/beurling-zeta-product: Define the zeta sum with the correct multiplicity.

**Source.** `beurling-dv`, Introduction pp1–2. Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

**Atlas planet:** Beurling primes.

#### Beurling zeta and Euler product

**Identifier:** `AnalyticNumberTheory:AN.5/beurling-zeta-product`. **Kind:** lemma. **Proposed name:** `TauCeti.AnalyticNumberTheory.beurling_zeta_product`.

If Σ_n n^−σ (with generalized-integer multiplicities) converges for every real σ>1, then ζ_P(s)=Σ_n n^−s=∏_j(1−p_j^−s)^−1 on Re s>1, absolutely and locally uniformly. The convergence hypothesis is additional to the prime-system axioms.

**Construction or proof.**
1. Expand the finite-prime products as geometric series with nonnegative real majorants.
2. Exhaust the finite-support exponent vectors and use the convergence hypothesis to interchange sums/products.

**Direct prerequisites.** `AnalyticNumberTheory:AN.5/beurling-prime-system`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.5: Beurling zeta and Euler product

**Source.** `beurling-dv`, §2.1 (5)–(7). Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

#### Beurling PNT with all logarithmic remainders

**Identifier:** `AnalyticNumberTheory:AN.5/beurling-all-log-remainders`. **Kind:** theorem. **Proposed name:** `TauCeti.AnalyticNumberTheory.beurling_all_log_remainders`.

For a discrete Beurling system whose ζ converges on Re s>1, π_P(x)=Li(x)+O_m(x/log^m x) for every m≥1 iff N(x)=ax+O_m(x/log^m x) for every m≥1 for some a>0. Each error constant may depend on m and the system.

**Construction or proof.**
1. Use the source’s Tauberian remainder theorem and its exact zeta-boundary equivalences.
2. Separate π from the Riemann prime distribution Π, bounding prime powers under the convergence hypothesis.

**Direct prerequisites.** `AnalyticNumberTheory:AN.5/beurling-prime-system`, `AnalyticNumberTheory:AN.5/beurling-zeta-product`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.5: Beurling PNT with all logarithmic remainders

**Source.** `beurling-dv`, Theorem1 and §4. Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

**Unresolved inputs.** Beurling Tauberian remainder proof.

#### Distinct-product cardinality

**Identifier:** `AnalyticNumberTheory:AN.5/medium-prime-product-card`. **Kind:** lemma. **Proposed name:** `TauCeti.AnalyticNumberTheory.medium_prime_product_card`.

For x≥2,m≥0, #N_m(x)=binomial(#{p prime:x/2≤p≤x},m).

**Construction or proof.**
1. Unfold the stated definition and apply the finite algebraic, positivity or convergent geometric-series computation.

**Direct prerequisites.** `AnalyticNumberTheory:AN.5/medium-prime-products`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.5: Distinct-product cardinality

**Source.** `reviewed-paper-barysoroker-koukoulopoulos-kozma-23`, arXiv v3, §3.6 (3.4), p. 26. Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

#### Squared pretentious-distance formula

**Identifier:** `AnalyticNumberTheory:AN.5/pretentious-square-nonnegative`. **Kind:** lemma. **Proposed name:** `TauCeti.AnalyticNumberTheory.pretentious_square_nonnegative`.

Under the prime unit-disc hypotheses, D(f,g;x)²=Σ_{p≤x}(1−Re(f(p)conj(g(p))))/p≥0.

**Construction or proof.**
1. Unfold the stated definition and apply the finite algebraic, positivity or convergent geometric-series computation.

**Direct prerequisites.** `AnalyticNumberTheory:AN.5/pretentious-distance`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.5: Squared pretentious-distance formula

**Source.** `pretentious-gs`, Weighted norm discussion pp3–4. Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

### AnalyticNumberTheory:AN.7

#### Lerch transcendent

**Identifier:** `AnalyticNumberTheory:AN.7/lerch-transcendent`. **Kind:** definition. **Proposed name:** `TauCeti.AnalyticNumberTheory.lerch_transcendent`.

For |z|<1, Re c>0 and s∈C, Φ(z,s,c)=Σ_{n≥0}z^n exp(−s Log(n+c)), using the principal logarithm. This series defines a jointly holomorphic function on that domain. At z=1 the separate Hurwitz series requires Re s>1.

**Construction or proof.**
1. Construct the displayed object on the specified domain using the existing carriers; prove the listed API before its analytic applications.

**Direct prerequisites.** Routine construction on the stated baseline carriers; any nonroutine interface gap is listed below..

**API.**

- `lerch_transcendent.series` (characterisation): Φ is the displayed absolutely convergent series on |z|<1, Re c>0.
- `lerch_transcendent.zero` (simp): Φ(0,s,c)=exp(−s Log c).
- `lerch_transcendent.shift` (relation): Φ(z,s,c)=c^−s+zΦ(z,s,c+1).
- `lerch_transcendent.exp_change` (compatibility): For Im a>0, LerchZeta(s,a,c)=Φ(exp(2πia),s,c).
- `lerch_transcendent.polylog` (compatibility): The periodic/polylog series is zΦ(z,s,1), not Φ(z,s,1).

**Unit tests.**

- `lerch_transcendent.zero` (computation): Φ(0,2,1)=1.
- `lerch_transcendent.s_zero` (computation): Φ(z,0,c)=1/(1−z) on |z|<1, independently of c.
- `lerch_transcendent.s_minus_one` (computation): Φ(z,−1,c)=c/(1−z)+z/(1−z)².
- `lerch_transcendent.normalization` (computation): For z=1/2 and s=0, Φ=2 while zΦ=1; omitting z fails the polylog comparison.

**Acceptance checks.** Φ(0,2,1)=1. Φ(z,0,c)=1/(1−z) on |z|<1, independently of c. Φ(z,−1,c)=c/(1−z)+z/(1−z)². For z=1/2 and s=0, Φ=2 while zΦ=1; omitting z fails the polylog comparison.

**Consumers.** AnalyticNumberTheory:AN.7/lerch-parameter-derivatives: Differentiate the convergent series. AnalyticNumberTheory:AN.7/lerch-cover-continuation: Fix the initial germ for multivalued continuation.

**Source.** `lerch-III-published`, Introduction (1.1), §2 and §3. Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

**Atlas planet:** Lerch transcendent.

#### Lerch compact convergence

**Identifier:** `AnalyticNumberTheory:AN.7/lerch-compact-series-bound`. **Kind:** lemma. **Proposed name:** `TauCeti.AnalyticNumberTheory.lerch_compact_series_bound`.

On every compact subset of |z|<1, Re c>0, s∈C, the Φ series and each fixed derivative in z,s,c converge uniformly and absolutely.

**Construction or proof.**
1. Choose |z|≤r<1, Re c≥δ>0 and bounded s,c on the compact set.
2. Bound each power/logarithmic derivative by a polynomial in n times r^n; sum the geometric majorant.

**Direct prerequisites.** `AnalyticNumberTheory:AN.7/lerch-transcendent`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.7: Lerch compact convergence

**Source.** `lerch-II`, §2 (2.1) and §5 termwise differentiation. Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

**Unresolved inputs.** Lerch continuation and functional-relation refinements.

#### Lerch shift identity

**Identifier:** `AnalyticNumberTheory:AN.7/lerch-parameter-shift`. **Kind:** lemma. **Proposed name:** `TauCeti.AnalyticNumberTheory.lerch_parameter_shift`.

On the initial convergence domain, Φ(z,s,c)=c^−s+zΦ(z,s,c+1). The identity continues only along corresponding paths avoiding c∈Z≤0.

**Construction or proof.**
1. Separate n=0 and reindex n≥1 in the absolutely convergent series.
2. Continue both sides along the same lifted c shift, keeping its branch data.

**Direct prerequisites.** `AnalyticNumberTheory:AN.7/lerch-transcendent`, `AnalyticNumberTheory:AN.7/lerch-compact-series-bound`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.7: Lerch shift identity

**Source.** `lerch-II`, §4 (4.32). Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

#### Lerch lowering relation

**Identifier:** `AnalyticNumberTheory:AN.7/lerch-z-derivative`. **Kind:** lemma. **Proposed name:** `TauCeti.AnalyticNumberTheory.lerch_z_derivative`.

On the initial domain, z∂_zΦ(z,s,c)+cΦ(z,s,c)=Φ(z,s−1,c). The identity holds on any continued branch with the same lifted parameter paths.

**Construction or proof.**
1. Differentiate termwise using compact uniform convergence.
2. Combine n+c in the numerator, then continue the identity with its s−1 path.

**Direct prerequisites.** `AnalyticNumberTheory:AN.7/lerch-transcendent`, `AnalyticNumberTheory:AN.7/lerch-compact-series-bound`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.7: Lerch lowering relation

**Source.** `lerch-III-published`, Theorem2.3 (2.3), §4. Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

#### Lerch raising relation

**Identifier:** `AnalyticNumberTheory:AN.7/lerch-c-derivative`. **Kind:** lemma. **Proposed name:** `TauCeti.AnalyticNumberTheory.lerch_c_derivative`.

On the initial domain, ∂_cΦ(z,s,c)=−sΦ(z,s+1,c), continued with the matching s+1 path.

**Construction or proof.**
1. Differentiate exp(−sLog(n+c)) termwise under compact convergence.
2. Use the same branch for n+c in the s and s+1 terms.

**Direct prerequisites.** `AnalyticNumberTheory:AN.7/lerch-transcendent`, `AnalyticNumberTheory:AN.7/lerch-compact-series-bound`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.7: Lerch raising relation

**Source.** `lerch-III-published`, Theorem2.3 (2.4), §4. Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

#### Lerch differential equation

**Identifier:** `AnalyticNumberTheory:AN.7/lerch-pde`. **Kind:** lemma. **Proposed name:** `TauCeti.AnalyticNumberTheory.lerch_pde`.

(z∂_z+c)∂_cΦ(z,s,c)=−sΦ(z,s,c) on the initial domain and each matched continued branch. The right-hand side has a minus sign.

**Construction or proof.**
1. Apply the lowering relation with s+1 to the raising relation.
2. Both derivative identities retain the same branch.

**Direct prerequisites.** `AnalyticNumberTheory:AN.7/lerch-z-derivative`, `AnalyticNumberTheory:AN.7/lerch-c-derivative`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.7: Lerch differential equation

**Source.** `lerch-III-published`, Theorem2.3 (2.5); preprint v1 sign corrected in publication. Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

#### Lerch integral representation

**Identifier:** `AnalyticNumberTheory:AN.7/lerch-integral-representation`. **Kind:** lemma. **Proposed name:** `TauCeti.AnalyticNumberTheory.lerch_integral_representation`.

For Re s>0, Re c>0 and z outside [1,∞), Φ(z,s,c)=Γ(s)^−1∫_0^∞t^(s−1)e^(−ct)/(1−ze^−t)dt on the principal sheet, agreeing with the series for |z|<1.

**Construction or proof.**
1. Expand the denominator geometrically in |z|<1 and apply the gamma integral with absolute majorants.
2. For z outside the cut, prove compact denominator lower bounds near finite t and exponential tail bounds; continue in z.

**Direct prerequisites.** `AnalyticNumberTheory:AN.7/lerch-transcendent`, `AnalyticNumberTheory:AN.7/lerch-compact-series-bound`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.7: Lerch integral representation

**Source.** `lerch-II`, §2 (2.2)–(2.3). Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

**Unresolved inputs.** Lerch continuation and functional-relation refinements.

#### Lerch continuation on a covering

**Identifier:** `AnalyticNumberTheory:AN.7/lerch-cover-continuation`. **Kind:** theorem. **Proposed name:** `TauCeti.AnalyticNumberTheory.lerch_cover_continuation`.

The initial Φ germ continues to a single-valued holomorphic function on the universal cover of C_s times (C_z minus {0,1}) times (C_c minus the nonpositive integers), with basepoint (s,z,c)=(1/2,−1,1/2) and the germ continued from the principal domain. The continuation becomes single-valued on a two-step solvable cover; it need not descend to an abelian cover in the z coordinate.

**Construction or proof.**
1. Use the Lerch-zeta continuation in a=Log z/(2πi) and its branch-dependent monodromy.
2. Apply the source’s two-step commutator calculation; positive integer c strata are removable.

**Direct prerequisites.** `AnalyticNumberTheory:AN.7/lerch-transcendent`, `AnalyticNumberTheory:AN.7/lerch-integral-representation`, `AnalyticNumberTheory:AN.7/lerch-parameter-shift`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.7: Lerch continuation on a covering

**Source.** `lerch-III-published`, Theorems2.1–2.2 and §3. Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

**Unresolved inputs.** Lerch continuation and functional-relation refinements.

**Atlas planet:** Lerch analytic continuation.

#### Monodromy around c=−n

**Identifier:** `AnalyticNumberTheory:AN.7/lerch-c-monodromy`. **Kind:** lemma. **Proposed name:** `TauCeti.AnalyticNumberTheory.lerch_c_monodromy`.

On the principal Lerch-zeta germ ζ(s,a,c)=Φ(exp(2πia),s,c), a positive loop around c=−n (n≥0) changes the branch by (e^(−2πis)−1)e^(2πina)(c+n)^−s, with the same logarithm lift. Loops about positive integer c have zero monodromy.

**Construction or proof.**
1. Separate the n-th term by the shift formula; the remaining shifted tail is holomorphic around c=−n.
2. Continue (c+n)^−s once counterclockwise and subtract the original value.

**Direct prerequisites.** `AnalyticNumberTheory:AN.7/lerch-parameter-shift`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.7: Monodromy around c=−n

**Source.** `lerch-II`, Theorem4.5 (4.15), proof pp17–18. Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

**Unresolved inputs.** Lerch continuation and functional-relation refinements.

#### Monodromy around a=n

**Identifier:** `AnalyticNumberTheory:AN.7/lerch-a-monodromy`. **Kind:** lemma. **Proposed name:** `TauCeti.AnalyticNumberTheory.lerch_a_monodromy`.

For the lifted principal Lerch-zeta branch, a positive loop around a=n∈Z changes it by −(2πi)^s Γ(s)^−1(a−n)^(s−1)e^(−2πic(a−n)), with (2πi)^s defined by log(2π)+iπ/2 and the continued logarithm of a−n.

**Construction or proof.**
1. Move the integral contour across the simple pole t=2πi(a−n), retaining the clockwise residue sign.
2. Continue the resulting residue term back to the principal polycylinder.

**Direct prerequisites.** `AnalyticNumberTheory:AN.7/lerch-integral-representation`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.7: Monodromy around a=n

**Source.** `lerch-II`, Theorem4.5 (4.11), (4.26)–(4.27). Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

**Unresolved inputs.** Lerch continuation and functional-relation refinements.

#### Nonpositive Lerch special values

**Identifier:** `AnalyticNumberTheory:AN.7/lerch-nonpositive-special-values`. **Kind:** theorem. **Proposed name:** `TauCeti.AnalyticNumberTheory.lerch_nonpositive_special_values`.

For m≥0, Φ(z,−m,c)=(z∂_z+c)^m(1/(1−z)), a rational function of z,c with poles only at z=1. It extends in c across all integers and has zero monodromy. For m=1 it equals c/(1−z)+z/(1−z)².

**Construction or proof.**
1. Use the lowering relation repeatedly from s=0 on |z|<1.
2. Inductively differentiate the rational function, then continue it as a single-valued function; no limit z→1 is asserted.

**Direct prerequisites.** `AnalyticNumberTheory:AN.7/lerch-transcendent`, `AnalyticNumberTheory:AN.7/lerch-z-derivative`, `AnalyticNumberTheory:AN.7/lerch-zero-order-value`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.7: Nonpositive Lerch special values

**Source.** `lerch-III-published`, §5 Theorem5.1 and recursion. Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

**Atlas planet:** Lerch special values.

#### Pinned Hurwitz specialization

**Identifier:** `AnalyticNumberTheory:AN.7/circle-hurwitz-import`. **Kind:** comparison. **Proposed name:** `TauCeti.AnalyticNumberTheory.circle_hurwitz_import`.

For real 0<c≤1 and Re s>1, the z=1 Lerch/Hurwitz series Σ_{n≥0}(n+c)^−s agrees with the pinned UnitAddCircle Hurwitz function using c mod1 and its endpoint convention c=1. Its meromorphic continuation has a simple pole at s=1 of residue1.

**Construction or proof.**
1. Use the pinned real-circle defining series with the exact representative convention.
2. Transport its existing continuation and pole theorem; no new real Hurwitz function is constructed.

**Direct prerequisites.** `mathlib:HurwitzZeta.hurwitzZeta`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.7: Pinned Hurwitz specialization

**Source.** `lerch-I`, §1, Hurwitz degeneration a=0; pinned Hurwitz comparison. Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

**Unresolved inputs.** Hurwitz and Dirichlet endpoint adapters.

#### Periodic zeta and Lerch normalization

**Identifier:** `AnalyticNumberTheory:AN.7/exp-zeta-lerch-comparison`. **Kind:** comparison. **Proposed name:** `TauCeti.AnalyticNumberTheory.exp_zeta_lerch_comparison`.

For real a, z=e^(2πia), Re s>1, expZeta(a,s)=zΦ(z,s,1) in the absolutely convergent boundary series. The right side uses that series or its matched boundary continuation. At a=0 it is the Riemann/Hurwitz degeneration, handled separately.

**Construction or proof.**
1. Shift the n≥1 periodic sum to n≥0 and factor out z.
2. Use the pinned expZeta series theorem and its existing continuation.

**Direct prerequisites.** `AnalyticNumberTheory:AN.7/lerch-transcendent`, `mathlib:HurwitzZeta.expZeta`, `mathlib:HurwitzZeta.hasSum_expZeta_of_one_lt_re`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.7: Periodic zeta and Lerch normalization

**Source.** `lerch-I`, §1 (1.4). Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

**Unresolved inputs.** Hurwitz and Dirichlet endpoint adapters.

#### Dirichlet character Hurwitz specialization

**Identifier:** `AnalyticNumberTheory:AN.7/dirichlet-hurwitz-finite-sum`. **Kind:** comparison. **Proposed name:** `TauCeti.AnalyticNumberTheory.dirichlet_hurwitz_finite_sum`.

For a character χ modulo q≥1 and Re s>1, L(s,χ)=q^−sΣ_{a=1}^q χ(a)ζ_H(s,a/q), using the actual principal/imprimitive character values. Continue with the pinned Dirichlet and circle-Hurwitz functions and keep the principal pole.

**Construction or proof.**
1. Partition positive integers by residues a=1,…,q in the absolutely convergent LSeries.
2. Use positive-real power multiplication and the pinned continuations on the common domain.

**Direct prerequisites.** `AnalyticNumberTheory:AN.7/circle-hurwitz-import`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.7: Dirichlet character Hurwitz specialization

**Source.** `lerch-I`, Hurwitz/Dirichlet specialization of the defining series. Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

**Unresolved inputs.** Hurwitz and Dirichlet endpoint adapters.

#### Even Lerch functional relation

**Identifier:** `AnalyticNumberTheory:AN.7/lerch-even-functional-equation`. **Kind:** theorem. **Proposed name:** `TauCeti.AnalyticNumberTheory.lerch_even_functional_equation`.

On the extended polycylinder s∈C,0<Re a<1,0<Re c<1, put L_+=ζ(s,a,c)+e^(−2πia)ζ(s,1−a,1−c) and Λ_+=π^(−s/2)Γ(s/2)L_+. Then Λ_+(s,a,c)=e^(−2πiac)Λ_+(1−s,1−c,a), as matched holomorphic continuations. Apparent gamma poles cancel in the completed combination.

**Construction or proof.**
1. Start from the real-parameter four-term identity and continue in a,c on the fundamental strip.
2. Use the functional equation to continue in s and prove removable gamma singularities.

**Direct prerequisites.** `AnalyticNumberTheory:AN.7/lerch-integral-representation`, `AnalyticNumberTheory:AN.7/lerch-cover-continuation`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.7: Even Lerch functional relation

**Source.** `lerch-II`, Theorem2.1 (2.7)–(2.8) and §3. Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

**Unresolved inputs.** Lerch continuation and functional-relation refinements.

#### Odd Lerch functional relation

**Identifier:** `AnalyticNumberTheory:AN.7/lerch-odd-functional-equation`. **Kind:** theorem. **Proposed name:** `TauCeti.AnalyticNumberTheory.lerch_odd_functional_equation`.

On the same polycylinder, L_−=ζ(s,a,c)−e^(−2πia)ζ(s,1−a,1−c) and Λ_−=π^(−(s+1)/2)Γ((s+1)/2)L_− satisfy Λ_−(s,a,c)=i e^(−2πiac)Λ_−(1−s,1−c,a), with matched continuations and removable gamma poles.

**Construction or proof.**
1. Apply the odd real-parameter four-term identity and the same analytic-continuation argument.
2. Retain the i multiplier and the shifted gamma parity.

**Direct prerequisites.** `AnalyticNumberTheory:AN.7/lerch-integral-representation`, `AnalyticNumberTheory:AN.7/lerch-cover-continuation`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.7: Odd Lerch functional relation

**Source.** `lerch-II`, Theorem2.1 (2.9)–(2.10) and §3. Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

**Unresolved inputs.** Lerch continuation and functional-relation refinements.

#### Lerch boundary degeneration

**Identifier:** `AnalyticNumberTheory:AN.7/lerch-boundary-degeneration`. **Kind:** lemma. **Proposed name:** `TauCeti.AnalyticNumberTheory.lerch_boundary_degeneration`.

For Re c>0 and Re s>1, the principal radial limit Φ(r,s,c) as r↑1 equals the convergent Hurwitz series. This limit is not an analytic continuation theorem across the entire z=1 stratum for all s; for s=0, Φ(r,0,c)=1/(1−r) diverges.

**Construction or proof.**
1. Use dominated convergence of the absolutely convergent Hurwitz majorant when Re s>1.
2. Use the explicit s=0 rational special value as a counterexample to an unrestricted boundary limit.

**Direct prerequisites.** `AnalyticNumberTheory:AN.7/lerch-transcendent`, `AnalyticNumberTheory:AN.7/circle-hurwitz-import`, `AnalyticNumberTheory:AN.7/lerch-nonpositive-special-values`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.7: Lerch boundary degeneration

**Source.** `lerch-I`, Theorem2.3 boundary cases; introductory singular-strata discussion. Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

**Unresolved inputs.** Hurwitz and Dirichlet endpoint adapters.

#### Complex-parameter Hurwitz series

**Identifier:** `AnalyticNumberTheory:AN.7/complex-hurwitz-series`. **Kind:** definition. **Proposed name:** `TauCeti.AnalyticNumberTheory.complex_hurwitz_series`.

For Re c>0 and Re s>1, ζ_H(s,c)=Σ_{n≥0}exp(−sLog(n+c)), with the principal logarithm. It is the z=1 series, not an unqualified value of the general Lerch continuation on its omitted z=1 stratum.

**Construction or proof.**
1. Construct the displayed object on the specified domain using the existing carriers; prove the listed API before its analytic applications.

**Direct prerequisites.** `AnalyticNumberTheory:AN.7/circle-hurwitz-import`.

**API.**

- `complex_hurwitz_series.series` (characterisation): The displayed series converges absolutely on Re s>1, Re c>0.
- `complex_hurwitz_series.shift` (relation): ζ_H(s,c+1)=ζ_H(s,c)−c^−s.
- `complex_hurwitz_series.real_circle` (compatibility): For real0<c≤1 it agrees with the pinned circle Hurwitz series using the positive representative convention.
- `complex_hurwitz_series.c_one` (compatibility): ζ_H(s,1)=riemannZeta(s) on Re s>1.

**Unit tests.**

- `complex_hurwitz_series.one` (computation): ζ_H(2,1)=π²/6.
- `complex_hurwitz_series.half` (computation): ζ_H(s,1/2)=(2^s−1)ζ(s) on Re s>1, by the odd-integer partition.
- `complex_hurwitz_series.excluded` (non-example): c=0 is outside the domain and no0^−s term is assigned a junk value.

**Acceptance checks.** ζ_H(2,1)=π²/6. ζ_H(s,1/2)=(2^s−1)ζ(s) on Re s>1, by the odd-integer partition. c=0 is outside the domain and no0^−s term is assigned a junk value.

**Consumers.** AnalyticNumberTheory:AN.7/complex-hurwitz-continuation: Initial function for the pole-and-parameter continuation.

**Source.** `lerch-II`, §2 integral at z=1 with separate origin subtraction. Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

**Atlas planet:** Hurwitz zeta functions.

#### Complex Hurwitz continuation

**Identifier:** `AnalyticNumberTheory:AN.7/complex-hurwitz-continuation`. **Kind:** theorem. **Proposed name:** `TauCeti.AnalyticNumberTheory.complex_hurwitz_continuation`.

The preceding series extends jointly meromorphically to s∈C, Re c>0, with only a simple pole at s=1 and residue1 independent of c. For fixed c, (s−1)ζ_H(s,c) is entire in s. The c shift identity remains valid there.

**Construction or proof.**
1. Write the gamma integral at z=1 and subtract its t=0 Taylor terms to continue in s.
2. Prove locally uniform parameter domination and cancel the reciprocal-gamma zeros.
3. Uniqueness on the convergence half-plane fixes the continuation and the pole residue.

**Direct prerequisites.** `AnalyticNumberTheory:AN.7/complex-hurwitz-series`, `AnalyticNumberTheory:AN.7/lerch-integral-representation`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.7: Complex Hurwitz continuation

**Source.** `lerch-II`, §2 Hurwitz singular stratum; complete separate proof required. Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

**Unresolved inputs.** Complex Hurwitz Taylor-subtraction proof.

#### Hurwitz Bernoulli values

**Identifier:** `AnalyticNumberTheory:AN.7/complex-hurwitz-bernoulli-values`. **Kind:** theorem. **Proposed name:** `TauCeti.AnalyticNumberTheory.complex_hurwitz_bernoulli_values`.

For m≥0 and Re c>0, the canonical continuation has ζ_H(−m,c)=−B_{m+1}(c)/(m+1), with Bernoulli polynomials normalized by te^(ct)/(e^t−1)=ΣB_j(c)t^j/j!. In particular ζ_H(0,c)=1/2−c.

**Construction or proof.**
1. Use the Taylor-subtracted integral and the reciprocal-gamma zero at−m.
2. Identify its coefficient by the stated Bernoulli generating series; pin the B₁ sign.

**Direct prerequisites.** `AnalyticNumberTheory:AN.7/complex-hurwitz-continuation`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.7: Hurwitz Bernoulli values

**Source.** `lerch-III-published`, §6 Hurwitz special-value discussion; generating-function proof required. Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

**Unresolved inputs.** Complex Hurwitz Taylor-subtraction proof.

#### Lerch at order zero

**Identifier:** `AnalyticNumberTheory:AN.7/lerch-zero-order-value`. **Kind:** lemma. **Proposed name:** `TauCeti.AnalyticNumberTheory.lerch_zero_order_value`.

Φ(z,0,c)=1/(1−z) for |z|<1, Re c>0.

**Construction or proof.**
1. Unfold the stated definition and apply the finite algebraic, positivity or convergent geometric-series computation.

**Direct prerequisites.** `AnalyticNumberTheory:AN.7/lerch-transcendent`.

**Acceptance checks.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Consumers.** AnalyticNumberTheory:AN.7: Lerch at order zero

**Source.** `lerch-III-published`, Theorem5.1, m=0. Exact target or stated specialization; unresolved proof inputs are named in the gap ledger.

## Supplier requests

- **tauceti:TauCetiRoadmap/ArithmeticDirichletSeries#layer-6-abel-and-perron-summation.** Truncated arithmetic Perron for the actual von Mangoldt LSeries, with uniform error, off-endpoint and half-weight endpoint forms; finite-height kernel value at1 is arctan(T/c)/π, not1/2. Consumers: `AnalyticNumberTheory:AN.3/von-mangoldt-explicit-formula-and-pnt-error`.
- **tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters.** Canonical HeckeCharacter and unitaryPart, local components, finite conductor, finite-order/ray-class dictionary, and ideal-character coefficients with the exact arithmetic normalization used by Tate §4.5. Consumers: `AnalyticNumberTheory:AN.4/artin-induction-versus-artin-holomorphy`, `AnalyticNumberTheory:AN.4/hecke-L-function-euler-product-comparison`, `AnalyticNumberTheory:AN.4/hecke-nonvanishing-on-line-one`, `AnalyticNumberTheory:AN.4/hecke-primitive-functional-equation`, `AnalyticNumberTheory:AN.4/ray-class-product-nonvanishing`.
- **AutomorphicLFunctionsAndLocalFactors:AL.0.** Fourier and Haar conventions for local/adelic functions, Poisson summation and parameter integrals. Supply an extension from Schwartz–Bruhat functions to Tate's full Z1–Z3 admissible class: uniform lattice sums over all translates and compact idele sets, both f and Fourier f, and idele weighted integrability for every σ>1. Consumers: `AnalyticNumberTheory:AN.4/hecke-L-function-euler-product-comparison`.
- **AutomorphicLFunctionsAndLocalFactors:AL.1.** Local and global Tate zeta integrals on the imported admissible class, Euler factorization with different and measure factors, meromorphic continuation, local gamma factors and global functional equation retaining the trivial-character residues. This does not by itself assert nonvanishing on Re(s)=1. Now planned (AL.1 checkpoint 2, #3918): AN.4 imports AL.1/global-zeta-integral, completed-hecke-l-function, tate-global-functional-equation, idele-class-volume, global-epsilon-factor and hecke-l-functional-equation. Consumers: `AnalyticNumberTheory:AN.4/artin-induction-versus-artin-holomorphy`, `AnalyticNumberTheory:AN.4/dedekind-zeta-continuation-and-residue`, `AnalyticNumberTheory:AN.4/hecke-L-function-euler-product-comparison`, `AnalyticNumberTheory:AN.4/hecke-primitive-functional-equation`.
- **tauceti:TauCetiRoadmap/ArithmeticDirichletSeries#layer-3-local-factors-and-euler-products.** Ideal Euler-product/series identity under absolute convergence on Re(s)>1, including finite bad-prime omission and norm regrouping. General higher-dimensional Artin factors must not be put into the degree-one completely multiplicative ideal-weight carrier. Consumers: `AnalyticNumberTheory:AN.4/hecke-L-function-euler-product-comparison`, `AnalyticNumberTheory:AN.4/ray-class-product-nonvanishing`.
- **tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-2-frobenius-elements-and-the-artin-symbol.** Arithmetic Frobenius at a chosen nonzero prime, conjugacy independence across primes above an unramified base prime and uniqueness modulo inertia at ramified primes; for K/ℚ the residue action is x↦x^p on O_K/P. Consumers: `AnalyticNumberTheory:AN.4/artin-induction-versus-artin-holomorphy`.
- **tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity.** Global reciprocity identification of one-dimensional finite Galois characters with ray-class characters, compatible with the existing ideal Artin map and arithmetic-Frobenius normalization; no second reciprocity carrier. Consumers: `AnalyticNumberTheory:AN.4/artin-induction-versus-artin-holomorphy`.
- **tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-6-the-virtual-character-ring-artin-and-brauer-induction.** Artin rational induction for finite-dimensional complex representations of a finite group, explicitly clearing denominators into a virtual sum of characters induced from cyclic subgroups. Global meromorphy uses the distinct Brauer integral-induction interface and its linear-character reduction, not unproved global roots. Consumers: `AnalyticNumberTheory:AN.4/artin-induction-versus-artin-holomorphy`.
- **tauceti:TauCetiRoadmap/ArithmeticDirichletSeries#layer-8-landau-type-positivity.** Generic meromorphic nonvanishing from nonnegative logarithmic coefficients, with meromorphic order at the distinguished pole ≤0 and the 3-4-1 inequality. Consumers: `AnalyticNumberTheory:AN.4/landau-nonnegative-logarithm`.
- **tauceti:TauCetiRoadmap/ArithmeticDirichletSeries#layer-1-norm-fibres-and-mathlib-lseries.** Finiteness of fixed-norm nonzero integral ideals, norm regrouping and absolute convergence of the restricted ideal-class coefficient sum on Re s>1. Consumers: `AnalyticNumberTheory:AN.4/partial-ideal-zeta`.
- **AutomorphicSpectralTheory:AS.1.** The normalized weight-zero Eisenstein family E and E*, the real-quadratic compact geodesics/boundary cycles and the imaginary-quadratic CM-point evaluations appearing in DIT §7, including the full norm-one unit quotient and the invariant measures. If the quadratic geometric carrier has a finer owner, route that construction there before these comparisons. Consumers: `AnalyticNumberTheory:AN.4/cm-partial-zeta-period`, `AnalyticNumberTheory:AN.4/real-even-partial-zeta-period`, `AnalyticNumberTheory:AN.4/genus-lseries-factorization`, `AnalyticNumberTheory:AN.4/negative-genus-core-period`, `AnalyticNumberTheory:AN.4/positive-genus-geodesic-period`, `AnalyticNumberTheory:AN.4/mixed-genus-cm-period`, `AnalyticNumberTheory:AN.4/real-odd-partial-zeta-period`, `AnalyticNumberTheory:AN.3/eisenstein-weyl-lvalue-bound`.
- **tauceti:TauCetiRoadmap/ArithmeticDirichletSeries#layer-6-abel-and-perron-summation.** For any arithmetic function g and any monotonic bounded h: [0,∞) → ℝ, for all x ≥ 1: Σ_{t≤x}(g∗h)(t) = ∫_0^x (Σ_{t≤y} (g(t)/t) h(y/t)) dy + O(Σ_{t≤x}|g(t)|), where g∗h is the Dirichlet convolution (h restricted to ℕ) and the implied constant depends on sup|h|. Consumers: `AnalyticNumberTheory:AN.5/prime-divisor-product-mean`, `AnalyticNumberTheory:AN.5/prime-divisor-integrated-mean`.
- **AnalyticNumberTheory:AN.8.** If [F : ℚ] ≥ 2 then ξ_{F,α}(0) = 0, since each c_{αβ}(s) vanishes to order [F : ℚ] at s = 1 (Lemma 3.8). For a cubic étale algebra A/F, the orders O ⊂ A with [O_A : O]² = n have Dirichlet series f_A(s) = ζ_F(4s)ζ_F(6s − 1)ζ_A(2s)/ζ_A(4s) (Datskovsky–Wright, Lemma 3.9). For σ > 3/2, ξ_{F,α}(σ + it) ≪_{[F:ℚ],σ,ε} Disc(F)^{1/2+ε}h₂(F) (Lemma 3.10), and for −1/2 ≤ σ ≤ 3/2 away from the poles at s = 1 and 5/6 (for example for |t| ≥ 1; the paper states it for all t, E9), ξ_{F,α}(σ + it) = O(h₂(F)Disc(F)^{7/2−2σ+ε}(1 + |t|)^{2[F:ℚ](3/2−σ)+ε}) by Phragmén–Lindelöf (Lemma 3.11). Consumers: .
- **AutomorphicLFunctionsAndLocalFactors:AL.3.** For the actual Π_alg representation carrier and its canonical completed Rankin–Selberg Λ(s,π×π′), the predicate GRH means every nontrivial zero has real part 1/2. Do not assert this predicate as a theorem. Consumers: `AnalyticNumberTheory:AN.3/mestre-weil-explicit-formula`.
- **FiniteFieldsAndCharacterSums:FF.1.** Let D₂ be an odd fundamental discriminant, δ₂ = |D₂| (squarefree), and R an integer prime to δ₂. Then Σ_{μ ∈ O/𝔡₂} e_{δ₂}(R N(μ)) = Σ_{n ∈ ℤ/δ₂ℤ} e_{δ₂}(Rn²) = κ(D₂) δ₂^{1/2} ε_{D₂}(R), with κ(D₂) = 1 if D₂ > 0 and i if D₂ < 0. The first equality holds because δ₂ is squarefree and totally ramified, so ℤ/δ₂ represents O/𝔡₂. The second is 'the usual evaluation of Gauss sums', Gauss's sign determination included. Also supply the primitive-character shift formula for every integer r, including nonunits, as in GZ item197. This composite odd fundamental-discriminant sign evaluation is stronger than the prime-field square-root magnitude theorem. Consumers: .
- **tauceti:TauCetiRoadmap/ArithmeticDirichletSeries#layer-8-landau-type-positivity.** The nonnegative 3-4-1 coefficient inequality for absolutely convergent logarithmic-derivative series. Consumers: `AnalyticNumberTheory:AN.2/zeta-three-four-one-derivative`.
- **tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-2-frobenius-elements-and-the-artin-symbol.** Decomposition/inertia groups at all nonzero primes, arithmetic Frobenius on residue extensions and conjugacy/tower compatibility on the inertia-invariant representation. Unramified Frobenius alone does not supply the ramified polynomial. Consumers: `AnalyticNumberTheory:AN.4/artin-local-polynomial`.
- **tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-6-the-virtual-character-ring-artin-and-brauer-induction.** Integral Brauer induction with linear characters and the virtual character equality, as distinct from rational cyclic Artin induction; direct-sum, restriction and induced representation identities for the Artin factors. Consumers: `AnalyticNumberTheory:AN.4/artin-induction-factor`, `AnalyticNumberTheory:AN.4/brauer-meromorphic-continuation`.
- **tauceti:TauCetiRoadmap/ArithmeticDirichletSeries#layer-8-landau-type-positivity.** For nonnegative norm-regrouped coefficients, the finite abscissa of convergence is a singular point. Supply the endpoint positivity/convergence corollary for a function holomorphic across that real abscissa. Consumers: `AnalyticNumberTheory:AN.4/quadratic-landau-contradiction`.
- **tauceti:TauCetiRoadmap/ArithmeticDirichletSeries#layer-9-wienerikehara.** Wiener–Ikehara for the actual nonnegative norm/natural coefficient LSeries with its pole removed and continuous line-one boundary. Consumers: `AnalyticNumberTheory:AN.2/rational-prime-number-theorem`, `AnalyticNumberTheory:AN.2/fixed-progression-prime-number-theorem`.
- **tauceti:TauCetiRoadmap/ArithmeticDirichletSeries#layer-10-generic-prime-number-theorem-transfer.** Inclusive ψ to θ to π transfer, including higher prime powers and Li(x)∼x/log x, specialized to ordinary primes or a fixed coprime class. Consumers: `AnalyticNumberTheory:AN.2/rational-prime-number-theorem`, `AnalyticNumberTheory:AN.2/fixed-progression-prime-number-theorem`, `AnalyticNumberTheory:AN.2/chebyshev-prime-count-transfer`.
- **SieveMethodsAndPrimePatterns:SV.4.** Shiu’s bound for nonnegative multiplicative functions: for fixed κ,ε>0, x^ε≤z≤x, q≤z^(1−ε), reduced a modq, Σ_{x−z≤n≤x,n≡a modq}|f(n)|≪_{κ,ε} z/(φ(q)log x) exp(Σ_{p≤x,p∤q}|f(p)|/p), for f∈C(κ). Supply the exact range used by GHS Lemma2.3. Consumers: `AnalyticNumberTheory:AN.5/halasz-integral-bound`.
- **ProbabilisticAndMetricNumberTheory:PM.5.** Canonical random-matrix zeta/L moment and correlation models, their arithmetic factor, averaging measure, symmetry type and conjectural-status predicates. AN.5 supplies proved analytic moments and compares constants; it does not define a second random model. Consumers: `AnalyticNumberTheory:AN.5/moment-model-comparison`.
- **ProbabilisticAndMetricNumberTheory:PM.1.** Normal-order/distribution theorems for multiplicative and prime-factor functions, with their actual arithmetic probability spaces, centering and scaling; AN.5 only provides the mean-value inputs. Consumers: `AnalyticNumberTheory:AN.5/halasz-classical`.

## Refinement gaps

### Integer truncation supplier identities

Verify the pinned von Mangoldt/Möbius convolution identity and finite divisibility API before exporting the large-cutoff comparison. The definitions themselves are finite and their zero convention is exact.

Needed by: `AnalyticNumberTheory:AN.5/even-von-mangoldt`, `AnalyticNumberTheory:AN.5/truncated-von-mangoldt`, `AnalyticNumberTheory:AN.5/mangoldt-truncation-error`.

### Canonical-product analytic foundations

Match the pinned isolated-zero, removable-singularity, logarithmic power-series, analytic inverse and Cauchy derivative-estimate declarations. Their exact theorem names and hypotheses have not yet been read; these named facts are not routine automation.

Needed by: `AnalyticNumberTheory:AN.2/compact-zero-count`, `AnalyticNumberTheory:AN.2/canonical-factor-log-tail`, `AnalyticNumberTheory:AN.2/continuous-log-analytic-upgrade`, `AnalyticNumberTheory:AN.2/borel-cauchy-affine-log`.

### Canonical-product lower bound on good circles

Complete the finite inner-factor lower bound with radii excluded at a summable |α|^(−2) scale, and the outer-tail bound uniformly at radius R. Prove the R^(1+ε) estimate with explicit constants. The bounded-gap good-radius lemma repairs a sparse-subsequence argument, but is not itself the lower bound.

Needed by: `AnalyticNumberTheory:AN.2/canonical-product-lower-good-circles`.

### Higher-genus factorization refinement

Promote the E_n family and its small-log tail to definitions/lemmas with API/tests if a consumer beyond order one needs them. Read the full general Hadamard proof cited in Yun–Zhang AppendixB.1. The fully specified generic theorem is planned; the current detailed chain supplies only genus one.

Needed by: `AnalyticNumberTheory:AN.2/finite-order-hadamard`.

### Xi Mellin and real gamma estimates

Read and match the pinned completed-zeta integral theorem and a real gamma/Stirling upper bound; the theta-tail estimate must remain exponential in x. The original Lemma8.3 proof loses this decay and its asserted pointwise exponential bound is false.

Needed by: `AnalyticNumberTheory:AN.2/xi-integral-comparison`, `AnalyticNumberTheory:AN.2/gamma-integral-growth-majorant`.

### Quantitative zeta analytic estimates

Finish the exact gamma/zero-strip and local-pole library adapters and read the omitted Exercise8.4.5 proof. Track every absolute constant through the real-part inequality before calling c effective. The final high-positive-height statement is unchanged.

Needed by: `AnalyticNumberTheory:AN.2/zeta-hadamard-log-derivative`, `AnalyticNumberTheory:AN.2/digamma-right-half-plane`, `AnalyticNumberTheory:AN.2/zeta-pole-log-derivative`, `AnalyticNumberTheory:AN.2/zero-free-region-constant-selection`.

### Explicit-formula analytic adapters

Verify the shifted Jensen centre lower bound, exact functional-equation gamma duplication, residue theorem for the finite rectangle, and every finite-height kernel constant at the pins. Chapters9.1–9.6 were freshly read; their exercise references remain proof obligations rather than silently established lemmas.

Needed by: `AnalyticNumberTheory:AN.3/zeta-unit-height-zero-count`, `AnalyticNumberTheory:AN.3/zeta-local-log-derivative`, `AnalyticNumberTheory:AN.3/zeta-left-log-derivative`, `AnalyticNumberTheory:AN.3/explicit-formula-residues`, `AnalyticNumberTheory:AN.3/perron-nearest-prime-power-error`, `AnalyticNumberTheory:AN.3/explicit-formula-horizontal-bound`, `AnalyticNumberTheory:AN.3/explicit-formula-left-contour`.

### Argument principle and zero-count phase

Read the original proof behind Remark9.7. Plan the argument branch, winding number, gamma phase and bounded zeta argument separately. The Jensen O(T log T) estimate is weaker than this asymptotic.

Needed by: `AnalyticNumberTheory:AN.3/riemann-von-mangoldt-count`.

### Primitive character explicit-formula uniformity

Read the original primitive-character formula and its conductor-uniform local count; regularize the even-character zero at0 and retain any finite deleted Euler factors. Unqualified imprimitive versions of the printed formula are not imported.

Needed by: `AnalyticNumberTheory:AN.3/zero-weight-sum`, `AnalyticNumberTheory:AN.3/character-half-interval-formula`.

### Artin local determinant and induction proofs

Prove invariant-space independence, determinant identities, the ramified orbit/Mackey comparison and the canonical norm-indexed convergence adapter. Read the exact integral Brauer induction supplier and the reciprocity conductor comparison. Kedlaya Chapter22 was freshly read, but its proof is explicitly a sketch and its Frobenius definition is corrected by inherited E3.

Needed by: `AnalyticNumberTheory:AN.4/artin-local-polynomial`, `AnalyticNumberTheory:AN.4/artin-euler-series`, `AnalyticNumberTheory:AN.4/artin-direct-sum-factor`, `AnalyticNumberTheory:AN.4/artin-absolute-convergence`, `AnalyticNumberTheory:AN.4/artin-induction-factor`, `AnalyticNumberTheory:AN.4/artin-linear-hecke-comparison`, `AnalyticNumberTheory:AN.4/brauer-meromorphic-continuation`.

### Landau endpoint convergence for the auxiliary series

Verify the endpoint step with the precise imported Landau theorem: convergence at the abscissa does not follow from holomorphy in the open half-plane alone. Use holomorphy at1/2 and Landau’s singularity alternative, or a proved monotone limit argument. Export the exact endpoint-positive-value contract before claiming the contradiction complete.

Needed by: `AnalyticNumberTheory:AN.4/quadratic-landau-contradiction`.

### PNT boundary adapters and quantitative remainder

Read the exact pinned LSeries derivative and boundary regularization, fixed-q character orthogonality, conjugation, finite low-height zero separation, and the optimized-height logarithm absorption. No finite zero-check is inferred from numerical evidence. The requested ADS results are generic suppliers, not duplicate planned theorems.

Needed by: `AnalyticNumberTheory:AN.2/rational-prime-number-theorem`, `AnalyticNumberTheory:AN.2/fixed-progression-prime-number-theorem`, `AnalyticNumberTheory:AN.2/rational-pnt-error`.

### Conductor-uniform region and Siegel–Walfisz proof

Read the original sources cited in Chapter10; that chapter states that many proofs are omitted. Break completed-function growth, conductor-uniform zero count and exceptional-term absorption into lemmas. Bombieri–Vinogradov belongs to SV.3, not to this node.

Needed by: `AnalyticNumberTheory:AN.2/dirichlet-conductor-zero-free-region`, `AnalyticNumberTheory:AN.2/siegel-walfisz`.

### Halász proof decomposition

Fresh GHS reading covers Theorem1.1, §2 Lemmas2.2–2.5 and the start of Lemma2.6. Complete Lemma2.6, Proposition2.1 and the final Cauchy–Schwarz argument; split Shiu’s short-interval supplier (SV.4), Euler-factor splitting and finite-height errors into lemmas. The classical D-based theorem needs its original Halász/Montgomery–Tenenbaum proof, not just the quoted source statement.

Needed by: `AnalyticNumberTheory:AN.5/pretentious-product-triangle`, `AnalyticNumberTheory:AN.5/halasz-coefficient-class`, `AnalyticNumberTheory:AN.5/halasz-integral-bound`, `AnalyticNumberTheory:AN.5/halasz-classical`.

### Dickman construction and limiting recursion

The smooth survey’s formula displays require page-image verification because its text layer drops mathematics. Read the complete §2 recursive positivity/uniqueness proof and §3 fixed-u proof, then split the integral recursion, compact-u error and prime-sum limit into lemmas. The exact fixed-u target is recorded and does not inherit a growing-u range.

Needed by: `AnalyticNumberTheory:AN.5/dickman-function`, `AnalyticNumberTheory:AN.5/dickman-fixed-u`.

### Divisor-average source and harmonic constant

Acquire a complete hyperbola-method proof and match the pinned harmonic-sum/Euler-constant error theorem. Tao’s post motivates divisor estimates but is not a proof of this summatory asymptotic.

Needed by: `AnalyticNumberTheory:AN.5/dirichlet-divisor-average`.

### Proved moments and conjectural model normalization

Acquire complete primary second/fourth-moment proofs and decompose the approximate functional equation, diagonal and off-diagonal estimates. Kedlaya’s selected chapters do not prove these moment targets. Match the precise PM.5 a(k),g(k) supplier before claiming its tests pass; the displayed general-k statement remains a conjecture.

Needed by: `AnalyticNumberTheory:AN.5/zeta-second-moment`, `AnalyticNumberTheory:AN.5/zeta-fourth-moment`, `AnalyticNumberTheory:AN.5/moment-model-comparison`.

### Beurling Tauberian remainder proof

Read Debruyne–Vindas §§3–4 completely and split their distributional boundary/slow-decrease assumptions and inverse Laplace remainder theorem into lemmas. This is the all-logarithmic-remainders theorem actually read, not an unsourced general PNT under arbitrary prime-system axioms.

Needed by: `AnalyticNumberTheory:AN.5/beurling-all-log-remainders`.

### Dirichlet-polynomial Hilbert inequality

Acquire the original Montgomery–Vaughan mean-value/Hilbert inequality proof and isolate its logarithmic-frequency spacing lemma. The GHS specialized Λ-supported bound is motivating evidence, not the general theorem’s proof.

Needed by: `AnalyticNumberTheory:AN.3/dirichlet-polynomial-mean-square`.

### Lerch continuation and functional-relation refinements

Read complete §§3–4 of LerchII and §§3–4 of the published LerchIII, including the contour-deformation covers, path-lift homotopy invariance and two-step solvable monodromy calculation. Promote those nonroutine constructions to lemma nodes with canonical topology supplier requests. Fresh reading currently covers the displayed target statements, monodromy residue/shift proofs and derivative proofs, not the full covering-space argument.

Needed by: `AnalyticNumberTheory:AN.7/lerch-compact-series-bound`, `AnalyticNumberTheory:AN.7/lerch-integral-representation`, `AnalyticNumberTheory:AN.7/lerch-cover-continuation`, `AnalyticNumberTheory:AN.7/lerch-c-monodromy`, `AnalyticNumberTheory:AN.7/lerch-a-monodromy`, `AnalyticNumberTheory:AN.7/lerch-even-functional-equation`, `AnalyticNumberTheory:AN.7/lerch-odd-functional-equation`.

### Hurwitz and Dirichlet endpoint adapters

Match the precise pinned representative and pole declarations for HurwitzZeta and the actual Dirichlet LSeries series theorem. Re s>1 radial degeneration is proved by series domination; unrestricted z=1 limits are explicitly rejected. General complex-c Hurwitz continuation requires its separate branch-aware source proof.

Needed by: `AnalyticNumberTheory:AN.7/circle-hurwitz-import`, `AnalyticNumberTheory:AN.7/exp-zeta-lerch-comparison`, `AnalyticNumberTheory:AN.7/dirichlet-hurwitz-finite-sum`, `AnalyticNumberTheory:AN.7/lerch-boundary-degeneration`.

### Complex Hurwitz Taylor-subtraction proof

Read a complete positive-half-plane complex-c Hurwitz proof, including uniform integral subtraction, reciprocal-gamma cancellation and the Bernoulli polynomial convention. Real UnitAddCircle continuation does not establish joint holomorphy for complex c.

Needed by: `AnalyticNumberTheory:AN.7/complex-hurwitz-continuation`, `AnalyticNumberTheory:AN.7/complex-hurwitz-bernoulli-values`.

### Conductor-uniform zero theory

Apply the two-real-zero inequality at the same effective c_star.; If N₂≤N₁² then log(N₁N₂)≤3 log N₁, contradicting both strict exceptional cutoffs. Original proof and finite certification still require lemma-level reading; the accepted extraction supplies the exact target only. Use the common-conductor-product zero-repulsion theorem with distinct primitive quadratic characters.; Fix one effective c_star small enough for this theorem and the exceptional-zero definition simultaneously. Original proof and finite certification still require lemma-level reading; the accepted extraction supplies the exact target only. Apply the conductor-uniform zero-free region to the real near-one interval.; Use the multiplicity version of the logarithmic-derivative inequality to force multiplicity one. Original proof and finite certification still require lemma-level reading; the accepted extraction supplies the exact target only. Use the character explicit formula and isolate the exceptional real zero before estimating the other zeros.; Optimize the height using the conductor-uniform region; preserve log N and the effective constants. Original proof and finite certification still require lemma-level reading; the accepted extraction supplies the exact target only. Apply the family zero-repulsion bound including complex zeros and multiplicities.; Conjugation forces a unique exception to be real and attached to a real primitive character. Original proof and finite certification still require lemma-level reading; the accepted extraction supplies the exact target only. Use the primitive-character counting function and the stated effective density theorem.; Include +1 if the original theorem excludes the exceptional zero; the chosen target below always includes it. Original proof and finite certification still require lemma-level reading; the accepted extraction supplies the exact target only.

Needed by: `AnalyticNumberTheory:AN.2/exceptional-conductor-repulsion`, `AnalyticNumberTheory:AN.2/two-real-zero-separation`, `AnalyticNumberTheory:AN.2/exceptional-zero-unique`, `AnalyticNumberTheory:AN.2/character-weighted-pnt`, `AnalyticNumberTheory:AN.2/landau-page-bounded-height`, `AnalyticNumberTheory:AN.3/selberg-zero-density`.

### Certified numerical analytic inputs

Import the prime-discriminant description of a primitive quadratic conductor, including its 2-adic possibilities.; Combine the explicit prime-product bounds with certified small-conductor cases; N=24 must be included. Original proof and finite certification still require lemma-level reading; the accepted extraction supplies the exact target only. Use the stated unconditional published theta upper bound, not an RH conditional table.; Supply a certified finite-range check below its analytic threshold. Original proof and finite certification still require lemma-level reading; the accepted extraction supplies the exact target only. Subtract the same published residue-class theta error bound at k and k/2, both within its range.; Retain a=3 or 5, q=8 and k≥2·10^10. Original proof and finite certification still require lemma-level reading; the accepted extraction supplies the exact target only. Bound the powers p^j with j≥2 by a sum of theta(k^(1/j)), and subtract endpoints before estimating.; Insert the certified constants from the source; retain the strict inequality. Original proof and finite certification still require lemma-level reading; the accepted extraction supplies the exact target only. Use the original two inequalities on the exact real range x≥59.; Certify the finite threshold region with rational enclosures for logarithms. Original proof and finite certification still require lemma-level reading; the accepted extraction supplies the exact target only. Use the original reciprocal-prime theorem and its common prime Mertens constant.; Keep x≥286; the rounded decimal is a label, not the definition of B. Original proof and finite certification still require lemma-level reading; the accepted extraction supplies the exact target only. Combine the effective quadratic class-number lower estimate with a uniform derivative estimate between β and 1.; Read the original theorem to retain the explicit constant 40 and q≥3. Original proof and finite certification still require lemma-level reading; the accepted extraction supplies the exact target only. Use the published two-sided estimate with a single constant E, on x≥319.; The interval corollary is a separate subtraction lemma below. Original proof and finite certification still require lemma-level reading; the accepted extraction supplies the exact target only. Use the source reciprocal-prime and square-power tail estimates, retaining x≥10^8.; Certify the finite threshold calculations required for the literal constant 2. Original proof and finite certification still require lemma-level reading; the accepted extraction supplies the exact target only.

Needed by: `AnalyticNumberTheory:AN.5/quadratic-conductor-largest-prime`, `AnalyticNumberTheory:AN.2/schoenfeld-theta-upper`, `AnalyticNumberTheory:AN.2/mod-eight-interval-mass`, `AnalyticNumberTheory:AN.2/prime-power-interval-margin`, `AnalyticNumberTheory:AN.2/rosser-schoenfeld-pi`, `AnalyticNumberTheory:AN.2/explicit-prime-reciprocal`, `AnalyticNumberTheory:AN.2/quadratic-effective-zero-gap`, `AnalyticNumberTheory:AN.2/explicit-weighted-prime-sum`, `AnalyticNumberTheory:AN.2/explicit-plus-euler-product`.

### Fixed-degree arithmetic analytic estimates

Use the bounded-degree Brauer–Siegel/Siegel theorem without adding normality.; Apply the real analytic class-number formula; finite adjustment handles bounded discriminants. Read and decompose the original bounded-degree uniformity proof; this is not inferred from fixed-field continuation. Combine the coefficient divisor majorant and the fixed-order divisor bound.; Sum m^ε for m≤X; no field-dependent constant is introduced. Read and decompose the original bounded-degree uniformity proof; this is not inferred from fixed-field continuation. Import the conductor-discriminant relation and bounded representation multiplicities.; Control the exponent using degree-dependent finite group bounds. Read and decompose the original bounded-degree uniformity proof; this is not inferred from fixed-field continuation. Import the completed Artin functional equation with its conductor and archimedean factors.; Take logarithmic derivatives only after regularizing zeros/poles and checking nonzero endpoint values. Read and decompose the original bounded-degree uniformity proof; this is not inferred from fixed-field continuation. Use integral Brauer induction, with bounded integer coefficients in the fixed-degree family.; Remove every trivial Hecke pole, prove cancellation of orders, then bound the remaining regularized values and their reciprocals. Read and decompose the original bounded-degree uniformity proof; this is not inferred from fixed-field continuation. Differentiate the regularized Brauer product in a neighbourhood of 1.; Sum factorwise logarithmic derivatives with bounded induction coefficients; a Cauchy bound for L′ alone does not bound L′/L. Read and decompose the original bounded-degree uniformity proof; this is not inferred from fixed-field continuation. Verify split, inert and ramified Euler factors of ζ_E/ζ_F on Re s>1.; Extend the identity to the canonical continuations; the residue quotient is a separate node. Read and decompose the original bounded-degree uniformity proof; this is not inferred from fixed-field continuation. Use bounded-degree Brauer–Siegel and the explicit positive residue formula.; Uniformly bound roots of unity by degree and absorb the finite small-discriminant range. Read and decompose the original bounded-degree uniformity proof; this is not inferred from fixed-field continuation. Apply the positive residue quotient and both residue bounds with exponent ≤2ε/3.; Use D_F≤D_E^(1/2) to keep the total exponent ≤ε. Read and decompose the original bounded-degree uniformity proof; this is not inferred from fixed-field continuation. Use the primitive completed functional equation and the absolutely convergent right-edge bound.; Apply the pole-cleared Phragmén–Lindelöf theorem with the displayed strip and height; retain the principal-character pole factor. Read and decompose the original bounded-degree uniformity proof; this is not inferred from fixed-field continuation. Choose r=min(ε,1/4), and apply the finite-order convexity bound on the complete circle |s−1|=r.; Use Cauchy on the holomorphic disk, with bound Q^r/r; no zero-free disk is assumed. Read and decompose the original bounded-degree uniformity proof; this is not inferred from fixed-field continuation. Apply the derivative estimate with ε/2.; Multiply by the reciprocal positive-value estimate with ε/2. Read and decompose the original bounded-degree uniformity proof; this is not inferred from fixed-field continuation. Differentiate the quadratic completed functional equation and evaluate at 0 and 1 after proving both endpoint values nonzero.; Use the gamma logarithmic derivatives at 1 and 2; keep the conductor Q separate from D_E until their arithmetic identification. Read and decompose the original bounded-degree uniformity proof; this is not inferred from fixed-field continuation. For each rational prime compare ∏_j(1−T^f_j)^−1 coefficientwise with (1−T)^−n.; Use f_j≥1 and the number of prime-ideal factors ≤n, then multiply the finite local coefficient comparisons. Read and decompose the original bounded-degree uniformity proof; this is not inferred from fixed-field continuation. Use d_n(p^a)=binomial(a+n−1,n−1)≤n^a for a≥0.; Large primes have n≤p^ε; for each smaller prime a polynomial times p^−εa is bounded.; Multiply the finitely many small-prime constants, independently of m. Read and decompose the original bounded-degree uniformity proof; this is not inferred from fixed-field continuation.

Needed by: `AnalyticNumberTheory:AN.4/bounded-degree-brauer-siegel`, `AnalyticNumberTheory:AN.5/bounded-norm-ideal-count`, `AnalyticNumberTheory:AN.4/artin-conductor-bound`, `AnalyticNumberTheory:AN.4/artin-log-functional-equation`, `AnalyticNumberTheory:AN.4/artin-value-one-subpower`, `AnalyticNumberTheory:AN.4/artin-log-derivative-one`, `AnalyticNumberTheory:AN.4/quadratic-zeta-factorization`, `AnalyticNumberTheory:AN.4/bounded-degree-residue-bounds`, `AnalyticNumberTheory:AN.4/quadratic-hecke-value-one`, `AnalyticNumberTheory:AN.4/primitive-hecke-convexity`, `AnalyticNumberTheory:AN.4/quadratic-hecke-cauchy-derivative`, `AnalyticNumberTheory:AN.4/quadratic-hecke-log-derivative-one`, `AnalyticNumberTheory:AN.4/quadratic-hecke-log-functional-equation`, `AnalyticNumberTheory:AN.5/ideal-coefficient-divisor-majorant`, `AnalyticNumberTheory:AN.5/fixed-order-divisor-subpower`.

### Quadratic Hecke period normalizations

Identify integral ideals in A with the CM lattice quotient, including the exact unit stabilizer.; Match E* and the gamma/discriminant normalization on Re s>1. Exact lattice quotient, measure and Eisenstein normalization proofs require original §7 reading. Their geometric objects are imported from the spectral owner. Unfold along the compact real quadratic geodesic and divide by the full norm-one unit action.; Sum the A and JA branches; match arc length and the even gamma factor. Exact lattice quotient, measure and Eisenstein normalization proofs require original §7 reading. Their geometric objects are imported from the spectral owner. Reuse the pinned genus character on the narrow class group and its coprime-ideal evaluation.; Compare Euler factors at split, inert and every ramified prime; continue only after the convergent identity. Exact lattice quotient, measure and Eisenstein normalization proofs require original §7 reading. Their geometric objects are imported from the spectral owner. Apply the odd compact-boundary Hecke identity and the genus Euler factorization.; Continue this identity to the critical line before applying Stokes; never start from the divergent Re s>1 core integral. Exact lattice quotient, measure and Eisenstein normalization proofs require original §7 reading. Their geometric objects are imported from the spectral owner. Sum the even compact-geodesic identity against χ and use genus factorization.; Identify geodesic and boundary arcs on the critical line with the imported oriented geometric conventions. Exact lattice quotient, measure and Eisenstein normalization proofs require original §7 reading. Their geometric objects are imported from the spectral owner. Sum the CM point partial-zeta identity against the genus character.; Match the two Dirichlet gamma factors and the unit factor 2√π/ω_D. Exact lattice quotient, measure and Eisenstein normalization proofs require original §7 reading. Their geometric objects are imported from the spectral owner. Unfold the oriented differential i∂_zE* dz over the full norm-one unit quotient.; Take the A−JA difference and retain Γ((s+1)/2)^2, rather than the even gamma factor. Exact lattice quotient, measure and Eisenstein normalization proofs require original §7 reading. Their geometric objects are imported from the spectral owner. Apply the appropriate one of the three genus-period identities.; Use the precise gamma quotient and reciprocal-zeta bounds; polynomial height factors and |D|^(1/4+ε) remain visible. Exact lattice quotient, measure and Eisenstein normalization proofs require original §7 reading. Their geometric objects are imported from the spectral owner. Read GZ item94 and §III.1 to match primitive/all-lattice Eisenstein sums. This is a distinct normalization adapter to the DIT E* comparison, not a second partial-zeta definition.

Needed by: `AnalyticNumberTheory:AN.4/cm-partial-zeta-period`, `AnalyticNumberTheory:AN.4/real-even-partial-zeta-period`, `AnalyticNumberTheory:AN.4/genus-lseries-factorization`, `AnalyticNumberTheory:AN.4/negative-genus-core-period`, `AnalyticNumberTheory:AN.4/positive-genus-geodesic-period`, `AnalyticNumberTheory:AN.4/mixed-genus-cm-period`, `AnalyticNumberTheory:AN.4/real-odd-partial-zeta-period`, `AnalyticNumberTheory:AN.3/eisenstein-weyl-lvalue-bound`, `AnalyticNumberTheory:AN.4/gross-zagier-cm-eisenstein-comparison`.

### Gamma and inverse-zeta quantitative bounds

Read a complete uniform Stirling proof and decompose the bounded-height part; do not infer a complex bound from a real gamma theorem. Read the quantitative inverse-zeta bound on the line and its compact-height argument. Pole-cleared reciprocal continuity near 1 is distinct from an estimate away from the pole.

Needed by: `AnalyticNumberTheory:AN.3/critical-line-gamma-quotient`, `AnalyticNumberTheory:AN.3/reciprocal-zeta-line-one`.

### Ineffective Siegel estimates

The original Siegel proof and its real-character normalization need lemma-level source acquisition; the claimed constant is explicitly ineffective.

Needed by: `AnalyticNumberTheory:AN.2/siegel-quadratic-lvalue`.

### Quadratic regulator dictionary

Supply DIT item144: h⁺/h and the fundamental-unit logarithm depend on whether a norm −1 unit exists; retain that dichotomy before comparing residues.

Needed by: `AnalyticNumberTheory:AN.4/real-quadratic-class-regulator-lower`.

### Mertens constant and error

The e^γ constant identification and quantitative prime-power-tail proof are still missing named lemmas. The weaker comparison alone does not prove the additive O(1) error.

Needed by: `AnalyticNumberTheory:AN.2/mertens-prime-product`.

### Medium-prime combinatorics

Promote the finite-product injection and binomial cardinality API to a lemma node and supply the fixed-m binomial asymptotic. No uniform moving-m asymptotic is asserted.

Needed by: `AnalyticNumberTheory:AN.5/medium-prime-cardinality`.

### Inverse-totient count

Acquire and decompose Smati’s original O(x) inverse-totient count; the conventional n/φ(n) bound only gives a weaker count and is not a proof.

Needed by: `AnalyticNumberTheory:AN.5/inverse-totient-count`.

### Divisor maximal order

Read Hardy–Wright Theorem317 or a complete primary proof and split its counting lemmas. The inherited subpower proof cannot supply the leading log2 coefficient.

Needed by: `AnalyticNumberTheory:AN.5/divisor-maximal-order`.

### Möbius and multiplicative-mean uniformity

Use Davenport’s original uniform exponential-sum theorem; α ranges over all real values.; Retain arbitrary logarithmic power A and y≥2. Read the original cited proof and split its uniform remainder estimates; the source’s unquantified q range is not treated as a proof. Use a coprimality Euler factor and a conductor-uniform Möbius PNT.; Prove q≤T^4 uniformity with a sufficiently large logarithmic power before replacing it by A. Read the original cited proof and split its uniform remainder estimates; the source’s unquantified q range is not treated as a proof. Expand the prime-divisor product as 1∗g with squarefree g and g(p)=(1+f(p))^n−1.; Prove Σ |g(d)|/√d<∞ uniformly in n,c, then use the floor-sum identity. Read the original cited proof and split its uniform remainder estimates; the source’s unquantified q range is not treated as a proof. Expand the fixed-n local factor, obtaining 1≤γ_n(p)≤1+C_n/(p(p−1)).; Bound the absolutely convergent logarithmic tail beyond log x; x≥e² avoids log-zero notation. Read the original cited proof and split its uniform remainder estimates; the source’s unquantified q range is not treated as a proof. Use the reciprocal Mertens product asymptotic and positivity.; Extend the two-sided comparison over the compact starting range y≥2. Read the original cited proof and split its uniform remainder estimates; the source’s unquantified q range is not treated as a proof. Expand log(qt)=log q+log t.; Apply both coprime Möbius sums at T/q≥√T, with q≤√T, and increase the logarithmic power to absorb log q. Read the original cited proof and split its uniform remainder estimates; the source’s unquantified q range is not treated as a proof. Use n/φ(n)=∏_{p|n}(1−1/p)^−1.; Split at log n and use Mertens for small primes and a bounded logarithmic tail for large primes. Read the original cited proof and split its uniform remainder estimates; the source’s unquantified q range is not treated as a proof. Apply the source positive-integer Fourier argument using Davenport cancellation and the finite cutoff.; Keep y,z≥2 so no negative power of log1 occurs. Read the original cited proof and split its uniform remainder estimates; the source’s unquantified q range is not treated as a proof.

Needed by: `AnalyticNumberTheory:AN.3/davenport-mobius-cancellation`, `AnalyticNumberTheory:AN.5/coprime-mobius-log-sum`, `AnalyticNumberTheory:AN.5/prime-divisor-product-mean`, `AnalyticNumberTheory:AN.5/gamma-prime-product-tail`, `AnalyticNumberTheory:AN.2/mertens-product-comparison`, `AnalyticNumberTheory:AN.5/shifted-coprime-mobius-sum`, `AnalyticNumberTheory:AN.5/totient-reciprocal-bound`, `AnalyticNumberTheory:AN.3/positive-truncation-error-cancellation`.

### Landau and Selberg–Delange counts

Read the exact representation criteria, product singularity and intersection counts in the original cited Landau/GS sources. Positive prime density alone is insufficient; the target uses fixed congruence classes with compatible residue restrictions. Decompose the Selberg–Delange theorem and verify nonvanishing of the residual factor in the fixed congruence family. No uniform modulus bound is asserted.

Needed by: `AnalyticNumberTheory:AN.5/landau-exception-union`, `AnalyticNumberTheory:AN.5/half-density-prime-support-count`.

### Explicit Dedekind estimates

Read the Louboutin paper quoted by Lipnowski–Tsimerman and decompose its explicit residue bound. The accepted extraction is only the target provenance.

Needed by: `AnalyticNumberTheory:AN.4/louboutin-dedekind-residue-upper`.

### Number-field density and effective prime estimates

Count primitive ray-class characters by conductor norm.; Apply the Thorner–Zaman density estimate, retaining the ε exponent: this is not a log-free estimate. Original TZ/Zaman source reading and lemma decomposition, with discriminant/degree uniformity, remain required. Define the exceptional extension set by zeros in the displayed rectangle.; Use the ray-class density bound and the quadratic character prime-count comparison from Chebotarev, retaining σ₁ and the whole range 4≤Y≤X. Original TZ/Zaman source reading and lemma decomposition, with discriminant/degree uniformity, remain required. Apply the degree-uniform effective Zaman prime-ideal bound with β=35 and γ=19.; Retain a discriminant threshold and Y≥D^35. Original TZ/Zaman source reading and lemma decomposition, with discriminant/degree uniformity, remain required.

Needed by: `AnalyticNumberTheory:AN.3/ray-class-zero-density`, `AnalyticNumberTheory:AN.4/most-quadratic-many-split-primes`, `AnalyticNumberTheory:AN.4/effective-prime-ideal-lower`.

### Mertens first theorem

Complete the Abel-summation proof of the O(1) weighted reciprocal-prime error with an adequate prime-number remainder. Mere π(x)∼x/log x does not by itself justify that O(1) bound.

Needed by: `AnalyticNumberTheory:AN.2/mertens-first-theorem`.

### Mestre source and contour formula

Read Mestre’s original theorem and match its test-function convention, including the negative tail, the a_i=0 gamma factors and each I,J subtraction at zero. The extracted one-tail wording is not certified here. Split the zero-sum convergence, gamma kernels and contour limits into lemmas.

Needed by: `AnalyticNumberTheory:AN.3/mestre-weil-explicit-formula`.

### Koymans–Pagano analytic suppliers

Use the indicator of squarefree integers supported on primes 2 and p≡1 mod4.; Apply its square-root Dirichlet-series singularity with the positive constant C. Match and read the exact original Landau/Sathe–Selberg/Heilbronn supplier. No original proof is inferred from the extraction’s bibliographic citation. Add the prime-factor-count parameter to the squarefree Euler product.; Prove the coefficient estimate uniformly for 1≤r≤A log log N, with constants depending on A. Match and read the exact original Landau/Sathe–Selberg/Heilbronn supplier. No original proof is inferred from the extraction’s bibliographic citation. Match the primitive conductor of Q(√d), rather than replacing it by |d|.; Choose one sufficiently small effective c_Landau so the conductor-product separation implies square growth in |d|+4. Match and read the exact original Landau/Sathe–Selberg/Heilbronn supplier. No original proof is inferred from the extraction’s bibliographic citation. Use the weighted character PNT and partial summation to remove log p.; Subtract two initial-interval formulas before bounding; isolate the exceptional term with upper endpoint t_i. Match and read the exact original Landau/Sathe–Selberg/Heilbronn supplier. No original proof is inferred from the extraction’s bibliographic citation. Use the effective imaginary/real quadratic class-number lower bound and a derivative estimate.; State the exponent −1/2−ε with an effective c(ε); do not substitute ineffective Siegel constants. Match and read the exact original Landau/Sathe–Selberg/Heilbronn supplier. No original proof is inferred from the extraction’s bibliographic citation. Use the finite Galois extension and the multiplicity-one real zero in the critical strip.; Apply the quadratic-subfield theorem; negative trivial zeros are outside the statement. Match and read the exact original Landau/Sathe–Selberg/Heilbronn supplier. No original proof is inferred from the extraction’s bibliographic citation.

Needed by: `AnalyticNumberTheory:AN.5/restricted-squarefree-landau-count`, `AnalyticNumberTheory:AN.5/restricted-sathe-selberg-count`, `AnalyticNumberTheory:AN.2/squareclass-exceptional-repulsion`, `AnalyticNumberTheory:AN.2/quadratic-prime-character-interval`, `AnalyticNumberTheory:AN.2/effective-quadratic-zero-separation`, `AnalyticNumberTheory:AN.4/heilbronn-simple-real-zero`.

### Genus character classification

The pinned construction supplies a genus character for given prime-discriminant data; it does not by itself prove the full bijection with all quadratic class characters. Import the classification from the quadratic/global class-field owner and match its hypotheses.

Needed by: `AnalyticNumberTheory:AN.4/imaginary-genus-character-dictionary`.

### Quadratic completed-factor normalization

Supply the Q-quadratic specialization of the zeta factorization and the exact real/complex gamma duplication identity. Root +1 is obtained by this normalization, not guessed from absolute value of a Gauss sum.

Needed by: `AnalyticNumberTheory:AN.4/imaginary-quadratic-root-number-one`.

### Native signatures for imported analytic carriers

The six definition blocks and their API/tests are named and specified in the suggested file comments, but executable signatures are left out under PROTOCOL§13 until the canonical narrow/ordinary class ideal coefficient, quadratic-field character, two-sided BV/one-sided-limit Weil class, inertia/Frobenius Artin representation and Euler-compatible logarithmic coefficient interfaces are supplied. Do not invent replacement Prop fields, a second ideal LSeries carrier, or degree-one completely multiplicative Artin coefficients. All remaining named theorem forms depending on these unavailable carriers are specified by the reader and require the same follow-up. The 16 definitions with concrete carriers have native signatures and all their API/tests; this is an explicit incompleteness, not an elaboration claim.

Needed by: `AnalyticNumberTheory:AN.4/partial-ideal-zeta`, `AnalyticNumberTheory:AN.3/weil-test-function`, `AnalyticNumberTheory:AN.2/exceptional-squareclasses`, `AnalyticNumberTheory:AN.4/artin-local-polynomial`, `AnalyticNumberTheory:AN.4/artin-euler-series`, `AnalyticNumberTheory:AN.5/halasz-coefficient-class`.

## Routed target ledger

All 91 selected target payloads were read. The same definition is shared when two papers need it; a result outside AN.0–AN.7 is assigned an explicit owner rather than copied into this packet.

- **PAPER-BENNETT-SIKSEK-20/40: Exceptional real zero.** planned. Declarations: `AnalyticNumberTheory:AN.2/exceptional-real-zero`.
- **PAPER-BENNETT-SIKSEK-20/41: Repulsion of exceptional conductors.** planned. Declarations: `AnalyticNumberTheory:AN.2/exceptional-conductor-repulsion`.
- **PAPER-BENNETT-SIKSEK-20/43: Largest prime factor of a quadratic conductor.** planned. Declarations: `AnalyticNumberTheory:AN.5/quadratic-conductor-largest-prime`.
- **PAPER-BENNETT-SIKSEK-20/65: Schoenfeld explicit Chebyshev bound.** planned. Declarations: `AnalyticNumberTheory:AN.2/schoenfeld-theta-upper`.
- **PAPER-BENNETT-SIKSEK-20/74: Chebyshev sums used by the argument.** baseline ψ, θ plus AP definition. Declarations: `AnalyticNumberTheory:AN.2/theta-ap`.
- **PAPER-BENNETT-SIKSEK-20/78: Mod-eight prime mass.** planned. Declarations: `AnalyticNumberTheory:AN.2/mod-eight-interval-mass`.
- **PAPER-BENNETT-SIKSEK-20/79: Prime powers do not erase the character-sum margin.** planned. Declarations: `AnalyticNumberTheory:AN.2/prime-power-interval-margin`.
- **PAPER-BENNETT-SIKSEK-20/87: Two-real-zero inequality.** planned. Declarations: `AnalyticNumberTheory:AN.2/two-real-zero-separation`.
- **PAPER-BENNETT-SIKSEK-20/88: Uniqueness and simplicity of an exceptional zero.** planned. Declarations: `AnalyticNumberTheory:AN.2/exceptional-zero-unique`.
- **PAPER-BENNETT-SIKSEK-20/89: Effective character prime-number estimate.** planned. Declarations: `AnalyticNumberTheory:AN.2/character-weighted-pnt`.
- **PAPER-BENNETT-SIKSEK-20/96: Effective divisor subpower bound.** existing chain. Declarations: `AnalyticNumberTheory:AN.5/uniform-divisor-subpower-bound`, `AnalyticNumberTheory:AN.5/eventual-divisor-subpower-bound`.
- **PAPER-BENNETT-SIKSEK-20/102: Rosser–Schoenfeld explicit prime-count bounds.** planned. Declarations: `AnalyticNumberTheory:AN.2/rosser-schoenfeld-pi`.
- **PAPER-BENNETT-SIKSEK-20/103: Explicit reciprocal-prime estimate.** planned. Declarations: `AnalyticNumberTheory:AN.2/explicit-prime-reciprocal`.
- **PAPER-BENNETT-SIKSEK-20/116: Bounded-height Landau–Page theorem.** planned. Declarations: `AnalyticNumberTheory:AN.2/landau-page-bounded-height`.
- **PAPER-BENNETT-SIKSEK-20/117: Selberg zero-density input.** planned. Declarations: `AnalyticNumberTheory:AN.3/selberg-zero-density`.
- **PAPER-BENNETT-SIKSEK-20/118: Quadratic real-zero separation from one.** planned. Declarations: `AnalyticNumberTheory:AN.2/quadratic-effective-zero-gap`.
- **PAPER-BENNETT-SIKSEK-20/139: Half-interval explicit formula and low-zero-safe bound.** planned. Declarations: `AnalyticNumberTheory:AN.3/character-half-interval-formula`, `AnalyticNumberTheory:AN.3/low-zero-safe-interval-kernel`, `AnalyticNumberTheory:AN.3/zero-weight-sum`.
- **PAPER-BENNETT-SIKSEK-20/142: Weighted-prime sum input to the factorial estimate.** planned. Declarations: `AnalyticNumberTheory:AN.2/explicit-weighted-prime-sum`, `AnalyticNumberTheory:AN.2/weighted-prime-interval`.
- **PAPER-BENNETT-SIKSEK-20/151: Explicit prime Euler-product bound.** planned. Declarations: `AnalyticNumberTheory:AN.2/explicit-plus-euler-product`.
- **PAPER-TSIMERMAN-18/brauer-siegel: Bounded-degree Brauer-Siegel.** planned. Declarations: `AnalyticNumberTheory:AN.4/bounded-degree-brauer-siegel`.
- **PAPER-TSIMERMAN-18/small-ideal-count: Uniform bounded-norm ideal count.** planned. Declarations: `AnalyticNumberTheory:AN.5/bounded-norm-ideal-count`.
- **PAPER-TSIMERMAN-18/colmez-finite-uniformity: Uniform character data in fixed dimension.** requested Colmez finite-combinatorial supplier. See requests/ownershipRequests; the input is not falsely treated as an AN.0–AN.7 theorem.
- **PAPER-TSIMERMAN-18/conductor-discriminant-control: Sufficient conductor-discriminant estimate.** planned. Declarations: `AnalyticNumberTheory:AN.4/artin-conductor-bound`.
- **PAPER-TSIMERMAN-18/artin-functional-equation: Logarithmic functional equation.** planned. Declarations: `AnalyticNumberTheory:AN.4/artin-log-functional-equation`.
- **PAPER-TSIMERMAN-18/artin-values: Two-sided subpolynomial values at one.** planned. Declarations: `AnalyticNumberTheory:AN.4/artin-value-one-subpower`.
- **PAPER-TSIMERMAN-18/artin-derivatives: Factorwise logarithmic derivative at one.** planned. Declarations: `AnalyticNumberTheory:AN.4/artin-log-derivative-one`.
- **PAPER-TSIMERMAN-18/cm-hecke-zeta-factorization: Quadratic zeta factorization and the residue quotient.** planned. Declarations: `AnalyticNumberTheory:AN.4/quadratic-zeta-factorization`, `AnalyticNumberTheory:AN.4/quadratic-residue-quotient`.
- **PAPER-TSIMERMAN-18/bounded-degree-residue-bounds: Uniform subpolynomial Dedekind residues.** planned. Declarations: `AnalyticNumberTheory:AN.4/bounded-degree-residue-bounds`.
- **PAPER-TSIMERMAN-18/cm-hecke-value-one: Two-sided quadratic Hecke value bound.** planned. Declarations: `AnalyticNumberTheory:AN.4/quadratic-hecke-value-one`.
- **PAPER-TSIMERMAN-18/primitive-hecke-convexity: Uniform finite-order Hecke convexity.** planned. Declarations: `AnalyticNumberTheory:AN.4/primitive-hecke-convexity`.
- **PAPER-TSIMERMAN-18/cm-hecke-cauchy-derivative: A fixed small circle gives a subpolynomial derivative.** planned. Declarations: `AnalyticNumberTheory:AN.4/quadratic-hecke-cauchy-derivative`.
- **PAPER-TSIMERMAN-18/cm-hecke-log-derivative-one: Subpolynomial logarithmic derivative at one.** planned. Declarations: `AnalyticNumberTheory:AN.4/quadratic-hecke-log-derivative-one`.
- **PAPER-TSIMERMAN-18/cm-hecke-log-functional-equation: Logarithmic functional equation at zero and one.** planned. Declarations: `AnalyticNumberTheory:AN.4/quadratic-hecke-log-functional-equation`.
- **PAPER-TSIMERMAN-18/ideal-coefficient-divisor-majorant: Uniform coefficient bound by a divisor function.** planned. Declarations: `AnalyticNumberTheory:AN.5/ideal-coefficient-divisor-majorant`.
- **PAPER-TSIMERMAN-18/fixed-divisor-subpolynomial: Subpolynomial fixed-order divisor function.** planned. Declarations: `AnalyticNumberTheory:AN.5/fixed-order-divisor-subpower`.
- **PAPER-YUN-ZHANG-17/47: Canonical products and order-at-most-one Hadamard factorization.** planned. Declarations: `AnalyticNumberTheory:AN.2/finite-order-hadamard`, `AnalyticNumberTheory:AN.2/order-one-hadamard`, `AnalyticNumberTheory:AN.2/paired-imaginary-factors`, `AnalyticNumberTheory:AN.2/paired-product-nonnegative-coefficients`, `AnalyticNumberTheory:AN.2/paired-product-strict-derivatives`.
- **PAPER-DUKE-IMAMOGLU-TOTH-16/133: Partial ideal zeta function.** planned. Declarations: `AnalyticNumberTheory:AN.4/partial-ideal-zeta`.
- **PAPER-DUKE-IMAMOGLU-TOTH-16/134: Ideal-character Hecke L-function.** planned. Declarations: `AnalyticNumberTheory:AN.4/class-character-lseries-comparison`.
- **PAPER-DUKE-IMAMOGLU-TOTH-16/135: Hecke CM partial-zeta identity.** planned. Declarations: `AnalyticNumberTheory:AN.4/cm-partial-zeta-period`.
- **PAPER-DUKE-IMAMOGLU-TOTH-16/136: Hecke positive-sign real quadratic formula.** planned. Declarations: `AnalyticNumberTheory:AN.4/real-even-partial-zeta-period`.
- **PAPER-DUKE-IMAMOGLU-TOTH-16/139: Genus Hecke factorization.** planned. Declarations: `AnalyticNumberTheory:AN.4/genus-lseries-factorization`.
- **PAPER-DUKE-IMAMOGLU-TOTH-16/140: Theorem3 negative factors.** planned. Declarations: `AnalyticNumberTheory:AN.4/negative-genus-core-period`.
- **PAPER-DUKE-IMAMOGLU-TOTH-16/141: Theorem3 positive factors.** planned. Declarations: `AnalyticNumberTheory:AN.4/positive-genus-geodesic-period`.
- **PAPER-DUKE-IMAMOGLU-TOTH-16/142: Theorem3 CM factors.** planned. Declarations: `AnalyticNumberTheory:AN.4/mixed-genus-cm-period`.
- **PAPER-DUKE-IMAMOGLU-TOTH-16/145: Siegel lower bound and regulator conversion.** planned. Declarations: `AnalyticNumberTheory:AN.4/real-quadratic-class-regulator-lower`, `AnalyticNumberTheory:AN.4/imaginary-quadratic-class-number-lower`.
- **PAPER-DUKE-IMAMOGLU-TOTH-16/158: Hecke negative-sign real quadratic formula.** planned. Declarations: `AnalyticNumberTheory:AN.4/real-odd-partial-zeta-period`.
- **PAPER-DUKE-IMAMOGLU-TOTH-16/eisenstein-weyl-to-dirichlet-l-values: Eisenstein Weyl sums bounded by Dirichlet L-values.** planned. Declarations: `AnalyticNumberTheory:AN.3/eisenstein-weyl-lvalue-bound`.
- **PAPER-DUKE-IMAMOGLU-TOTH-16/gamma-quotient-and-zeta-one-line-bounds: Standard gamma-quotient and 1/ζ(1+2it) estimates (black box).** planned. Declarations: `AnalyticNumberTheory:AN.3/critical-line-gamma-quotient`, `AnalyticNumberTheory:AN.3/reciprocal-zeta-line-one`.
- **PAPER-DUKE-IMAMOGLU-TOTH-16/siegel-theorem: Siegel's theorem (black box).** planned. Declarations: `AnalyticNumberTheory:AN.2/siegel-quadratic-lvalue`.
- **PAPER-ABDURRAHMAN-VENKATESH-25/20: Chebotarev density for arithmetic schemes.** proposed Chebotarev Part II; outside the number-field stage. See requests/ownershipRequests; the input is not falsely treated as an AN.0–AN.7 theorem.
- **PAPER-BARYSOROKER-KOUKOULOPOULOS-KOZMA-23/55: Prime-number input.** planned. Declarations: `AnalyticNumberTheory:AN.2/prime-interval-three-x`, `AnalyticNumberTheory:AN.5/medium-prime-cardinality`.
- **PAPER-BARYSOROKER-KOUKOULOPOULOS-KOZMA-23/65: Inverse-totient counting input.** planned. Declarations: `AnalyticNumberTheory:AN.5/inverse-totient-count`.
- **PAPER-BARYSOROKER-KOUKOULOPOULOS-KOZMA-23/127: Products of distinct medium primes.** planned. Declarations: `AnalyticNumberTheory:AN.5/medium-prime-products`.
- **PAPER-BARYSOROKER-KOUKOULOPOULOS-KOZMA-23/128: Mertens sum and product inputs.** planned. Declarations: `AnalyticNumberTheory:AN.2/mertens-prime-reciprocal`, `AnalyticNumberTheory:AN.2/mertens-prime-product`.
- **PAPER-BARYSOROKER-KOUKOULOPOULOS-KOZMA-23/129: Maximal-order divisor bound and subpower corollary.** planned. Declarations: `AnalyticNumberTheory:AN.5/divisor-maximal-order`, `AnalyticNumberTheory:AN.5/uniform-divisor-subpower-bound`.
- **PAPER-SKOROBOGATOV-SOFOS-23/28: Even von Mangoldt function and its truncation on ℤ.** planned. Declarations: `AnalyticNumberTheory:AN.5/even-von-mangoldt`, `AnalyticNumberTheory:AN.5/truncated-von-mangoldt`, `AnalyticNumberTheory:AN.5/mangoldt-truncation-error`.
- **PAPER-SKOROBOGATOV-SOFOS-23/29: Davenport uniform Möbius exponential cancellation.** planned. Declarations: `AnalyticNumberTheory:AN.3/davenport-mobius-cancellation`.
- **PAPER-SKOROBOGATOV-SOFOS-23/36: Coprime Möbius sums from the prime number theorem ((3.6)).** planned. Declarations: `AnalyticNumberTheory:AN.5/coprime-mobius-log-sum`, `AnalyticNumberTheory:AN.5/coprime-mobius-reciprocal-sum`.
- **PAPER-SKOROBOGATOV-SOFOS-23/41: Wintner-type mean over prime divisors.** planned. Declarations: `AnalyticNumberTheory:AN.5/prime-divisor-product-mean`, `AnalyticNumberTheory:AN.5/prime-divisor-integrated-mean`.
- **PAPER-SKOROBOGATOV-SOFOS-23/42: Gamma Euler-product truncation.** planned. Declarations: `AnalyticNumberTheory:AN.5/gamma-prime-product-tail`.
- **PAPER-SKOROBOGATOV-SOFOS-23/50: Mertens product input.** planned. Declarations: `AnalyticNumberTheory:AN.2/mertens-product-comparison`.
- **PAPER-SKOROBOGATOV-SOFOS-23/89: Shifted coprime Möbius sum.** planned. Declarations: `AnalyticNumberTheory:AN.5/shifted-coprime-mobius-sum`.
- **PAPER-SKOROBOGATOV-SOFOS-23/96: Size of 1/φ(n) and of the divisor function (3.7).** planned. Declarations: `AnalyticNumberTheory:AN.5/totient-reciprocal-bound`, `AnalyticNumberTheory:AN.5/divisor-maximal-order`.
- **PAPER-SKOROBOGATOV-SOFOS-23/97: Uniform cancellation of the truncation error E_z (Corollary 3.3).** planned. Declarations: `AnalyticNumberTheory:AN.3/positive-truncation-error-cancellation`, `AnalyticNumberTheory:AN.3/two-sided-truncation-error`.
- **PAPER-SKOROBOGATOV-SOFOS-23/wintner-iwaniec-kowalski-4-2: Wintner's mean-value theorem (Iwaniec–Kowalski (1.72)).** generic Abel/convolution supplier request. See requests/ownershipRequests; the input is not falsely treated as an AN.0–AN.7 theorem.
- **PAPER-GHOSH-SARNAK-22/40: Landau-type counts.** planned. Declarations: `AnalyticNumberTheory:AN.5/landau-sum-two-squares-count`, `AnalyticNumberTheory:AN.5/landau-three-square-form-count`, `AnalyticNumberTheory:AN.5/shifted-square-count`, `AnalyticNumberTheory:AN.5/landau-exception-union`, `AnalyticNumberTheory:AN.5/half-density-prime-support-count`.
- **PAPER-LIPNOWSKI-TSIMERMAN-18/residue-source: Explicit residue bound for Dedekind zeta functions (Louboutin).** planned. Declarations: `AnalyticNumberTheory:AN.4/louboutin-dedekind-residue-upper`.
- **PAPER-LEMKEOLIVER-WANG-WOOD-25/14: Lemmas 3.8–3.11 (vanishing at 0, orders, uniform and convexity bounds for Shintani zeta).** outside AN.0–AN.7; supplied/requested from AN.8. See requests/ownershipRequests; the input is not falsely treated as an AN.0–AN.7 theorem.
- **PAPER-LEMKEOLIVER-WANG-WOOD-25/17: Theorem 4.2 (zero-density estimate for ray class L-functions).** planned. Declarations: `AnalyticNumberTheory:AN.3/ray-class-zero-density`.
- **PAPER-LEMKEOLIVER-WANG-WOOD-25/18: Lemma 4.3 (most quadratic extensions have many small split primes).** planned. Declarations: `AnalyticNumberTheory:AN.4/most-quadratic-many-split-primes`.
- **PAPER-LEMKEOLIVER-WANG-WOOD-25/19: Lemma 4.4 (Zaman's effective lower bound for prime ideals).** planned. Declarations: `AnalyticNumberTheory:AN.4/effective-prime-ideal-lower`.
- **PAPER-LEMKEOLIVER-WANG-WOOD-25/20: Brauer–Siegel, Landau and Friedman–Skoruppa inputs.** shared analytic residue and Brauer–Siegel nodes; regulator ratio requested. Declarations: `AnalyticNumberTheory:AN.4/bounded-degree-brauer-siegel`, `AnalyticNumberTheory:AN.4/bounded-degree-residue-bounds`.
- **PAPER-SHANKAR-SHANKAR-TANG-ETAL-22/63: Mertens's first theorem and Σ_{p | N} log p/p = O(log log N).** planned. Declarations: `AnalyticNumberTheory:AN.2/mertens-first-theorem`, `AnalyticNumberTheory:AN.5/prime-divisor-log-weight`.
- **PAPER-CHENEVIER-TAIBI-20/mestre-explicit-formula: Weil's explicit formula (Mestre's formalism).** planned. Declarations: `AnalyticNumberTheory:AN.3/weil-test-function`, `AnalyticNumberTheory:AN.3/mestre-weil-explicit-formula`.
- **PAPER-CHENEVIER-TAIBI-20/grh-rankin-selberg: The hypothesis (GRH) for Π_alg.** Rankin–Selberg GRH predicate requested from AL.3; used only as a hypothesis. See requests/ownershipRequests; the input is not falsely treated as an AN.0–AN.7 theorem.
- **PAPER-KOYMANS-PAGANO/10: Asymptotic for |𝒟(X)| (classical, cited).** planned. Declarations: `AnalyticNumberTheory:AN.5/restricted-squarefree-landau-count`.
- **PAPER-KOYMANS-PAGANO/176: Theorem 7.2(b): Sathe–Selberg-type bounds for |𝒟_r(N)|, (7.3).** planned. Declarations: `AnalyticNumberTheory:AN.5/restricted-sathe-selberg-count`.
- **PAPER-KOYMANS-PAGANO/181: Exceptional set 𝒮(c), its enumeration d₁, d₂, … and the constant c_Landau (Definition 7.5).** planned. Declarations: `AnalyticNumberTheory:AN.2/exceptional-squareclasses`.
- **PAPER-KOYMANS-PAGANO/182: Landau's theorem on the repulsion of exceptional real zeros.** planned. Declarations: `AnalyticNumberTheory:AN.2/squareclass-exceptional-repulsion`.
- **PAPER-KOYMANS-PAGANO/186: Prime number theorem for a quadratic character, uniform in the conductor, with an exceptional-zero term (7.7).** planned. Declarations: `AnalyticNumberTheory:AN.2/quadratic-prime-character-interval`.
- **PAPER-KOYMANS-PAGANO/187: Effective lower bound for an exceptional zero.** planned. Declarations: `AnalyticNumberTheory:AN.2/effective-quadratic-zero-separation`.
- **PAPER-KOYMANS-PAGANO/202: Remark 7.11: the trivial boundary bound and the asymptotic for |𝒟(N)|.** asymptotic shared; set-theoretic boundary bookkeeping belongs to KP consumer. Declarations: `AnalyticNumberTheory:AN.5/restricted-squarefree-landau-count`.
- **PAPER-KOYMANS-PAGANO/249: Chebotarev with Siegel-zero control for M_∘(Z) (Smith, Prop. 6.5, with Heilbronn).** effective Chebotarev supplier and KP box application; not a second theorem here. See requests/ownershipRequests; the input is not falsely treated as an AN.0–AN.7 theorem.
- **PAPER-KOYMANS-PAGANO/250: Heilbronn's theorem on real zeros of Dedekind zeta functions.** planned. Declarations: `AnalyticNumberTheory:AN.4/heilbronn-simple-real-zero`.
- **PAPER-GROSS-ZAGIER-86/95: Partial zeta function ζ_K(A, s) of an ideal class.** same definition, ordinary class specialization. Declarations: `AnalyticNumberTheory:AN.4/partial-ideal-zeta`.
- **PAPER-GROSS-ZAGIER-86/96: Eisenstein series at a CM point equals a partial zeta function.** planned. Declarations: `AnalyticNumberTheory:AN.4/gross-zagier-cm-eisenstein-comparison`.
- **PAPER-GROSS-ZAGIER-86/172: Genus characters of Cl_K and the factorization of their L-series.** planned. Declarations: `AnalyticNumberTheory:AN.4/imaginary-genus-character-dictionary`, `AnalyticNumberTheory:AN.4/genus-lseries-factorization`.
- **PAPER-GROSS-ZAGIER-86/196: Evaluation of the quadratic Gauss sum Σ_{n mod δ₂} e_{δ₂}(Rn²).** composite-modulus Gauss sign supplier FF.1. See requests/ownershipRequests; the input is not falsely treated as an AN.0–AN.7 theorem.
- **PAPER-GROSS-ZAGIER-86/197: Gauss sum of the primitive character ε_{D₂}: Σ_{n mod δ₂} ε₂(n)e(rn/δ₂) = ε₂(r)κ(D₂)δ₂^{1/2}.** same Gauss sign supplier plus primitive Gauss shift. See requests/ownershipRequests; the input is not falsely treated as an AN.0–AN.7 theorem.
- **PAPER-GROSS-ZAGIER-86/226: Functional equation of L(s, ε) with root number +1 (quoted input).** planned. Declarations: `AnalyticNumberTheory:AN.4/imaginary-quadratic-root-number-one`.
- **PAPER-GROSS-ZAGIER-86/229: Analytic class number formula for K: L(1, ε) = πh/(u√δ), L(0, ε) = h/u (implicit input).** planned. Declarations: `AnalyticNumberTheory:AN.4/imaginary-quadratic-lvalue-one`, `AnalyticNumberTheory:AN.4/imaginary-quadratic-lvalue-zero`.

## Baseline statements checked

- `mathlib:exists_nat_ge` — Archimedean choice of a natural upper bound for an arbitrary real. Module: Mathlib/Algebra/Order/Archimedean/Defs.lean.
- `mathlib:Finset.prod_le_prod` — Product comparison from nonnegative factors and pointwise inequalities. Module: Mathlib/Algebra/Order/BigOperators/GroupWithZero/Finset.lean.
- `mathlib:Real.add_one_le_exp` — For real t, t+1≤exp t. Module: Mathlib/Analysis/Complex/Exponential.lean.
- `mathlib:Real.log_le_log` — Logarithm monotonicity on positive reals. Module: Mathlib/Analysis/SpecialFunctions/Log/Basic.lean.
- `mathlib:Real.le_log_iff_exp_le` — At positive y, x≤log y iff exp x≤y. Module: Mathlib/Analysis/SpecialFunctions/Log/Basic.lean.
- `mathlib:Real.log_pos` — The logarithm is positive at real x>1. Module: Mathlib/Analysis/SpecialFunctions/Log/Basic.lean.
- `mathlib:Real.rpow_def_of_pos` — For positive x, x^y=exp(log x*y). Module: Mathlib/Analysis/SpecialFunctions/Pow/Real.lean.
- `mathlib:Real.rpow_natCast` — Real power by a natural exponent agrees with ordinary power. Module: Mathlib/Analysis/SpecialFunctions/Pow/Real.lean.
- `mathlib:Real.rpow_nonneg` — Real powers of a nonnegative base are nonnegative. Module: Mathlib/Analysis/SpecialFunctions/Pow/Real.lean.
- `mathlib:Real.rpow_add` — x^(y+z)=x^y*x^z for positive x. Module: Mathlib/Analysis/SpecialFunctions/Pow/Real.lean.
- `mathlib:Real.rpow_mul` — x^(yz)=(x^y)^z for nonnegative x. Module: Mathlib/Analysis/SpecialFunctions/Pow/Real.lean.
- `mathlib:Real.mul_rpow` — A real power distributes over two nonnegative factors. Module: Mathlib/Analysis/SpecialFunctions/Pow/Real.lean.
- `mathlib:Real.rpow_le_rpow` — Monotonicity in nonnegative bases at nonnegative exponent. Module: Mathlib/Analysis/SpecialFunctions/Pow/Real.lean.
- `mathlib:Nat.prod_primeFactors_pow_factorization` — For n≠0, n=∏p∈primeFactors(n), p^(factorization(n,p)). Module: Mathlib/Data/Nat/Factorization/Basic.lean.
- `mathlib:Nat.prime_of_mem_primeFactors` — Members of the finite prime-factor set are prime. Module: Mathlib/Data/Nat/PrimeFin.lean.
- `mathlib:ArithmeticFunction.sigma_zero_apply` — σ₀(n)=card(n.divisors). Module: Mathlib/NumberTheory/ArithmeticFunction/Misc.lean.
- `mathlib:ArithmeticFunction.sigma_zero_apply_prime_pow` — σ₀(p^a)=a+1 for prime p. Module: Mathlib/NumberTheory/ArithmeticFunction/Misc.lean.
- `mathlib:Nat.card_divisors` — For n≠0, card(n.divisors)=∏p∈primeFactors(n), (factorization(n,p)+1). Module: Mathlib/NumberTheory/ArithmeticFunction/Misc.lean.
- `mathlib:Chebyshev.psi` — Inclusive von Mangoldt count through the natural floor; not the half-weight endpoint count. Module: Mathlib/NumberTheory/Chebyshev.lean.
- `mathlib:Nat.divisors` — Finite positive natural divisors, with divisors0=empty by convention. Module: Mathlib/NumberTheory/Divisors.lean.
- `mathlib:DirichletCharacter.IsPrimitive.completedLFunction_one_sub` — Primitive completed Dirichlet functional equation with inverse character, conductor power and root number. Module: Mathlib/NumberTheory/LSeries/DirichletContinuation.lean.
- `mathlib:HurwitzZeta.hurwitzZeta` — Hurwitz zeta for a parameter in UnitAddCircle, not general complex a. Module: Mathlib/NumberTheory/LSeries/HurwitzZeta.lean.
- `mathlib:HurwitzZeta.expZeta` — Exponential zeta for a real-circle parameter. Module: Mathlib/NumberTheory/LSeries/HurwitzZeta.lean.
- `mathlib:HurwitzZeta.hasSum_expZeta_of_one_lt_re` — For real a and Re(s)>1, expZeta(a,s)=∑n≥1 exp(2πian)n^(−s); comparison with Lerch is zΦ(z,s,1). Module: Mathlib/NumberTheory/LSeries/HurwitzZeta.lean.
- `mathlib:riemannZeta_ne_zero_of_one_le_re` — ζ(s)≠0 on Re(s)≥1; the value at1 is totalized and is not a holomorphy statement. Module: Mathlib/NumberTheory/LSeries/Nonvanishing.lean.
- `mathlib:completedRiemannZeta_one_sub` — Existing symmetry Λ(1−s)=Λ(s) of completed Riemann zeta. Module: Mathlib/NumberTheory/LSeries/RiemannZeta.lean.
- `mathlib:riemannZeta` — Existing Riemann zeta as the zero-parameter Hurwitz-even specialization. Module: Mathlib/NumberTheory/LSeries/RiemannZeta.lean.
- `mathlib:AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq` — The identity theorem on a preconnected open set. Module: Mathlib/Analysis/Analytic/Uniqueness.lean.
- `mathlib:Complex.Gammaℂ` — Γ_ℂ(s) = 2(2π)^{−s}Γ(s). Module: Mathlib/Analysis/SpecialFunctions/Gamma/Deligne.lean.
- `mathlib:Complex.Gammaℝ` — Γ_ℝ(s) = π^{−s/2}Γ(s/2). Module: Mathlib/Analysis/SpecialFunctions/Gamma/Deligne.lean.
- `mathlib:Complex.exp` — The complex exponential, for m-th roots exp((1/m)log g) on simply connected domains. Module: Mathlib/Analysis/Complex/Exponential.lean.
- `mathlib:DirichletCharacter.LFunction_ne_zero_of_one_le_re` — The K = ℚ case of Hecke nonvanishing on Re s ≥ 1. Module: Mathlib/NumberTheory/LSeries/Nonvanishing.lean.
- `mathlib:LSeries.positive` — An L-series with nonnegative coefficients and a₁ > 0 is positive on reals beyond its abscissa. Module: Mathlib/NumberTheory/LSeries/Positivity.lean.
- `mathlib:NumberField.dedekindZeta` — The Dedekind zeta function as the ideal-counting L-series. Module: Mathlib/NumberTheory/NumberField/DedekindZeta.lean.
- `mathlib:NumberField.dedekindZeta_residue` — The constant 2^{r₁}(2π)^{r₂}Rh/(w√|d|), Tate's κ. Module: Mathlib/NumberTheory/NumberField/DedekindZeta.lean.
- `mathlib:NumberField.tendsto_sub_one_mul_dedekindZeta_nhdsGT` — The residue of ζ_K at 1 as a one-sided real limit. Module: Mathlib/NumberTheory/NumberField/DedekindZeta.lean.
- `mathlib:Real.cos_two_mul` — cos 2θ = 2cos²θ − 1, for 3 + 4cos θ + cos 2θ = 2(1 + cos θ)². Module: Mathlib/Analysis/Complex/Trigonometric.lean.
- `mathlib:Chebyshev.theta` — Inclusive prime logarithm sum with natural floor. Module: Mathlib/NumberTheory/Chebyshev.lean.
- `tauceti:TauCeti.Multiquadratic.genusCharFunNarrowClassGroupHom` — Genus character into integer units of the narrow class group for the explicit prime-discriminant factorization, polynomial generator and squarefreeness hypotheses. Module: TauCeti/NumberTheory/Multiquadratic/Quadratic/GenusCharacter/NarrowClassGroup.lean.
- `tauceti:NumberField.NarrowClassGroup.toClassGroupEquiv` — Narrow/ordinary ideal-class multiplicative equivalence under IsTotallyComplex. Module: TauCeti/NumberTheory/NumberField/NarrowClassGroup/TotallyComplex.lean.
- `mathlib:AnalyticOnNhd.circleAverage_log_norm` — Jensen formula for a function analytic near a closed ball with nonzero centre value; R≠0. Module: Mathlib/Analysis/Complex/JensenFormula.lean.
- `mathlib:AnalyticOnNhd.sum_divisor_le` — Multiplicity-weighted zero count in radius r bounded by log(M/|f(c)|)/log(R/r), 0<r<R and M≥1. Module: Mathlib/Analysis/Complex/JensenFormula.lean.
- `mathlib:Complex.borelCaratheodory` — Bounds a holomorphic function on the inner ball by an upper bound for its real part on the larger open ball. Module: Mathlib/Analysis/Complex/BorelCaratheodory.lean.
- `mathlib:analyticOrderNatAt` — Natural analytic vanishing order; junk zero must be excluded by analyticity and finite-order hypotheses. Module: Mathlib/Analysis/Analytic/Order.lean.
- `mathlib:AnalyticAt.analyticOrderAt_eq_natCast` — Local factorization (z−z0)^n g with g analytic and g(z0)≠0 characterizes analytic order n. Module: Mathlib/Analysis/Analytic/Order.lean.
- `mathlib:TendstoLocallyUniformlyOn.differentiableOn` — Holomorphicity of a locally uniform limit on an open domain with a nonbottom filter and eventually holomorphic approximants. Module: Mathlib/Analysis/Complex/LocallyUniformLimit.lean.
- `mathlib:TendstoLocallyUniformlyOn.deriv` — Locally uniform convergence of derivatives of holomorphic locally uniform approximants on an open domain. Module: Mathlib/Analysis/Complex/LocallyUniformLimit.lean.
- `mathlib:Complex.exists_continuousOn_eqOn_exp_comp` — Continuous logarithm of a nonvanishing continuous function on an open simply connected set; analyticity is not part of this theorem. Module: Mathlib/Analysis/Complex/BranchLogRoot.lean.
- `mathlib:completedRiemannZeta₀` — Pole-subtracted completed Riemann zeta. Module: Mathlib/NumberTheory/LSeries/RiemannZeta.lean.
- `mathlib:differentiable_completedZeta₀` — The pole-subtracted completed function is entire. Module: Mathlib/NumberTheory/LSeries/RiemannZeta.lean.
- `mathlib:completedRiemannZeta₀_one_sub` — Reflection symmetry of the pole-subtracted completed function. Module: Mathlib/NumberTheory/LSeries/RiemannZeta.lean.
- `mathlib:Nat.smoothNumbers` — Positive naturals whose prime factors are strictly smaller than the natural cutoff; mathematical P(n)≤y requires floor(y)+1. Module: Mathlib/NumberTheory/SmoothNumbers.lean.
- `mathlib:DirichletCharacter.LFunction` — Canonical continued Dirichlet function, distinct from LSeries outside Re s>1. Module: Mathlib/NumberTheory/LSeries/DirichletContinuation.lean.
- `mathlib:Nat.smoothNumbersUpTo` — Finite inclusive natural cutoff of the existing strict-smoothness carrier. Module: Mathlib/NumberTheory/SmoothNumbers.lean.

## Sources and reading receipts

The current pass read the two named upstream documents in full. Fresh primary reading covered Kedlaya printed pp19–22,47–60,127–130, Yun–Zhang Appendix B.1 pp901–903, the Lerch initial domains/functional relations and selected monodromy formulas, the publisher PDE and its derivation, the first four pages and selected preliminary lemmas of Granville–Harper–Soundararajan, Granville–Soundararajan pp1–4, Hildebrand–Tenenbaum introductory definitions and the page414 image, and Debruyne–Vindas pp1–3. These are selected passages, not complete paper proof audits. Inherited receipts remain attributed to their earlier passes. Original external proofs cited by the accepted extractions are explicitly open unless a fresh receipt says otherwise.

### tao-divisor-2008

The divisor bound

**authors:** Terence Tao.

**edition:** Author post, 23 September 2008, updated 24 September.

**url:** https://terrytao.wordpress.com/2008/09/23/the-divisor-bound/.

**sha256:** 1a26cc2a78746463092d440c0a1e119bd8d4c3e223f805dd000ae8a76830b2f9.

**accessed:** 2026-09-26.

**readSections:** Entire main post: both small/large-prime proofs and applications. The explicit constant D^B below is the worker's refinement, not a quoted constant..

### kedlaya-ant-2025

Notes on analytic number theory

**authors:** Kiran S. Kedlaya.

**edition:** Author PreTeXt PDF, last modified 21 December 2025, 154 PDF pages.

**url:** https://kskedlaya.org/papers/ant-ptx.pdf.

**sha256:** 7a934fce8272cedd36ad609f79bbe79af0056320bb1e0bc690c87af990f305be.

**accessed:** 2026-09-26.

**readSections:** Fresh: §§7.1–7.3, printed pp.43–45; §8.2 pp.48–49; §8.3 pp.50–51; Chapter 22 pp.127–130., Page images additionally checked for printed pp.45,50,127; author HTML parallel §§7.2,8.2,8.3,22.1 checked on 27 September for existing corrections., Chapters 5–6 and §8.1/exercises remain inherited-review provenance; Chapter 9 proof not freshly decomposed., Fresh additionally: Lemma9.8 and Theorem9.9 final assembly, printed pp.56–58, and Chapter10 pp.59–63. Chapter10 proof references and prerequisite exercises are not decomposed., 2026-09-29 (cc-39fac3): §§3.3–3.4 (Lemma 3.6, Theorems 3.7–3.11), Exercises 3.6.1–3.6.5 and Chapter 22 re-read on the text layer; same sha256..

### tate-thesis-1950

Fourier analysis in number fields and Hecke's zeta-functions

**authors:** John Tate.

**edition:** 1950 thesis, 60-page Rutgers-hosted scan.

**url:** https://sites.math.rutgers.edu/~alexk/2023S572/Tate1950.pdf.

**sha256:** 0c40f263e8ab7924d1f0a8c7e40d81d464aec6620b8ec14101f21f7b07e6f0c8.

**accessed:** 2026-09-26.

**readSections:** Fresh page-image read: scan pp.57–59, thesis pp.(4.23)–(4.25)., Scan pp.53–56 inspected as unreliable OCR only; their detailed character/admissibility construction remains inherited-review provenance, not a fresh complete reading., Inherited local/global analytic records retain reviewed locators; complete rereading and decomposition belongs to AL.0/AL.1., 2026-09-29 (cc-39fac3): physical pp. 15–27 and 40–59 read on page images for AL.1; §4.5 (pp. 53–59) used for the Hecke comparison..

### bennett-siksek-2020

A conjecture of Erdős, supersingular primes and short character sums

**authors:** Michael A. Bennett and Samir Siksek.

**edition:** Annals of Mathematics 191 (2020), no.2, published article.

**url:** https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf.

**sha256:** 3920a7524a37870942fe3591ac858db23cb604f4331bccd2a6dc5f11a1671fbf.

**accessed:** 2026-09-26.

**readSections:** Published §8 divisor-bound use and accepted extraction item96/erratumE2 inherited from the immediately preceding ES.0 task., All 19 AN-routed extraction statements and accepted routing review read; their cited original external proofs have not all been read..

### reviewed-paper-bennett-siksek-20

Reviewed extraction: A conjecture of Erdős, supersingular primes and short character sums

**authors:** Atlas extraction and independent review; original authors: Michael A. Bennett and Samir Siksek.

**edition:** Repository accepted extraction at base 30e57b9090cc4c5e6d91a92848a4837206a921f8.

**url:** https://github.com/CBirkbeck/tauceti-explorer/blob/30e57b9090cc4c5e6d91a92848a4837206a921f8/research/blueprint/papers/PAPER-BENNETT-SIKSEK-20.result.json.

**sha256:** 63f9a61d0ed5b899fb65112f1556e64d3bead0cc6e77042fb0d29e834efe4b9f.

**accessed:** 2026-10-05.

**readingScope:** Every routed item payload and the accepted route were read. External proofs remain explicit gaps unless a fresh primary-source read is separately listed..

**readSections:** PAPER-BENNETT-SIKSEK-20/40, PAPER-BENNETT-SIKSEK-20/41, PAPER-BENNETT-SIKSEK-20/43, PAPER-BENNETT-SIKSEK-20/65, PAPER-BENNETT-SIKSEK-20/74, PAPER-BENNETT-SIKSEK-20/78, PAPER-BENNETT-SIKSEK-20/79, PAPER-BENNETT-SIKSEK-20/87, PAPER-BENNETT-SIKSEK-20/88, PAPER-BENNETT-SIKSEK-20/89, PAPER-BENNETT-SIKSEK-20/96, PAPER-BENNETT-SIKSEK-20/102, PAPER-BENNETT-SIKSEK-20/103, PAPER-BENNETT-SIKSEK-20/116, PAPER-BENNETT-SIKSEK-20/117, PAPER-BENNETT-SIKSEK-20/118, PAPER-BENNETT-SIKSEK-20/139, PAPER-BENNETT-SIKSEK-20/142, PAPER-BENNETT-SIKSEK-20/151.

### reviewed-paper-tsimerman-18

Reviewed extraction: The Andre-Oort conjecture for A_g

**authors:** Atlas extraction and independent review; original authors: Jacob Tsimerman.

**edition:** Repository accepted extraction at base 30e57b9090cc4c5e6d91a92848a4837206a921f8.

**url:** https://github.com/CBirkbeck/tauceti-explorer/blob/30e57b9090cc4c5e6d91a92848a4837206a921f8/research/blueprint/papers/PAPER-TSIMERMAN-18.result.json.

**sha256:** 703b84ccac36d3305805541737ccc0ff13fb4f4fb95a8e6efbeca0b9bb581f1e.

**accessed:** 2026-10-05.

**readingScope:** Every routed item payload and the accepted route were read. External proofs remain explicit gaps unless a fresh primary-source read is separately listed..

**readSections:** PAPER-TSIMERMAN-18/brauer-siegel, PAPER-TSIMERMAN-18/small-ideal-count, PAPER-TSIMERMAN-18/colmez-finite-uniformity, PAPER-TSIMERMAN-18/conductor-discriminant-control, PAPER-TSIMERMAN-18/artin-functional-equation, PAPER-TSIMERMAN-18/artin-values, PAPER-TSIMERMAN-18/artin-derivatives, PAPER-TSIMERMAN-18/cm-hecke-zeta-factorization, PAPER-TSIMERMAN-18/bounded-degree-residue-bounds, PAPER-TSIMERMAN-18/cm-hecke-value-one, PAPER-TSIMERMAN-18/primitive-hecke-convexity, PAPER-TSIMERMAN-18/cm-hecke-cauchy-derivative, PAPER-TSIMERMAN-18/cm-hecke-log-derivative-one, PAPER-TSIMERMAN-18/cm-hecke-log-functional-equation, PAPER-TSIMERMAN-18/ideal-coefficient-divisor-majorant, PAPER-TSIMERMAN-18/fixed-divisor-subpolynomial.

### reviewed-paper-yun-zhang-17

Reviewed extraction: Shtukas and the Taylor expansion of L-functions

**authors:** Atlas extraction and independent review; original authors: Zhiwei Yun and Wei Zhang.

**edition:** Repository accepted extraction at base 30e57b9090cc4c5e6d91a92848a4837206a921f8.

**url:** https://github.com/CBirkbeck/tauceti-explorer/blob/30e57b9090cc4c5e6d91a92848a4837206a921f8/research/blueprint/papers/PAPER-YUN-ZHANG-17.result.json.

**sha256:** 2fd58c8dcad8904088f0b5ccb80f883b8c019e43a0e0e8accf185b9618e467e4.

**accessed:** 2026-10-05.

**readingScope:** Every routed item payload and the accepted route were read. External proofs remain explicit gaps unless a fresh primary-source read is separately listed..

**readSections:** PAPER-YUN-ZHANG-17/47.

### reviewed-paper-duke-imamoglu-toth-16

Reviewed extraction: Geometric invariants for real quadratic fields

**authors:** Atlas extraction and independent review; original authors: W. Duke, Ö. Imamoḡlu, Á. Tóth.

**edition:** Repository accepted extraction at base 30e57b9090cc4c5e6d91a92848a4837206a921f8.

**url:** https://github.com/CBirkbeck/tauceti-explorer/blob/30e57b9090cc4c5e6d91a92848a4837206a921f8/research/blueprint/papers/PAPER-DUKE-IMAMOGLU-TOTH-16.result.json.

**sha256:** a2d281f452853e47606a1482be9319938a398cfb0fc0861867b329ee1db27c41.

**accessed:** 2026-10-05.

**readingScope:** Every routed item payload and the accepted route were read. External proofs remain explicit gaps unless a fresh primary-source read is separately listed..

**readSections:** PAPER-DUKE-IMAMOGLU-TOTH-16/133, PAPER-DUKE-IMAMOGLU-TOTH-16/134, PAPER-DUKE-IMAMOGLU-TOTH-16/135, PAPER-DUKE-IMAMOGLU-TOTH-16/136, PAPER-DUKE-IMAMOGLU-TOTH-16/139, PAPER-DUKE-IMAMOGLU-TOTH-16/140, PAPER-DUKE-IMAMOGLU-TOTH-16/141, PAPER-DUKE-IMAMOGLU-TOTH-16/142, PAPER-DUKE-IMAMOGLU-TOTH-16/145, PAPER-DUKE-IMAMOGLU-TOTH-16/158, PAPER-DUKE-IMAMOGLU-TOTH-16/eisenstein-weyl-to-dirichlet-l-values, PAPER-DUKE-IMAMOGLU-TOTH-16/gamma-quotient-and-zeta-one-line-bounds, PAPER-DUKE-IMAMOGLU-TOTH-16/siegel-theorem.

### reviewed-paper-abdurrahman-venkatesh-25

Reviewed extraction: Symplectic L-functions and symplectic Reidemeister torsion (mod squares)

**authors:** Atlas extraction and independent review; original authors: Amina Abdurrahman and Akshay Venkatesh.

**edition:** Repository accepted extraction at base 30e57b9090cc4c5e6d91a92848a4837206a921f8.

**url:** https://github.com/CBirkbeck/tauceti-explorer/blob/30e57b9090cc4c5e6d91a92848a4837206a921f8/research/blueprint/papers/PAPER-ABDURRAHMAN-VENKATESH-25.result.json.

**sha256:** 91e09967ad7c43bfb08d7f777d4a2ef6f14113c8430c24bea7816659499687c5.

**accessed:** 2026-10-05.

**readingScope:** Every routed item payload and the accepted route were read. External proofs remain explicit gaps unless a fresh primary-source read is separately listed..

**readSections:** PAPER-ABDURRAHMAN-VENKATESH-25/20.

### reviewed-paper-barysoroker-koukoulopoulos-kozma-23

Reviewed extraction: Irreducibility of random polynomials: general measures

**authors:** Atlas extraction and independent review; original authors: Lior Bary-Soroker, Dimitris Koukoulopoulos, Gady Kozma.

**edition:** Repository accepted extraction at base 30e57b9090cc4c5e6d91a92848a4837206a921f8.

**url:** https://github.com/CBirkbeck/tauceti-explorer/blob/30e57b9090cc4c5e6d91a92848a4837206a921f8/research/blueprint/papers/PAPER-BARYSOROKER-KOUKOULOPOULOS-KOZMA-23.result.json.

**sha256:** 218f81cd26b1cf14d18e4ada190c08a8dee4b716b692c8183094b2071b1f3548.

**accessed:** 2026-10-05.

**readingScope:** Every routed item payload and the accepted route were read. External proofs remain explicit gaps unless a fresh primary-source read is separately listed..

**readSections:** PAPER-BARYSOROKER-KOUKOULOPOULOS-KOZMA-23/55, PAPER-BARYSOROKER-KOUKOULOPOULOS-KOZMA-23/65, PAPER-BARYSOROKER-KOUKOULOPOULOS-KOZMA-23/127, PAPER-BARYSOROKER-KOUKOULOPOULOS-KOZMA-23/128, PAPER-BARYSOROKER-KOUKOULOPOULOS-KOZMA-23/129.

### reviewed-paper-skorobogatov-sofos-23

Reviewed extraction: Schinzel Hypothesis on average and rational points

**authors:** Atlas extraction and independent review; original authors: Alexei N. Skorobogatov and Efthymios Sofos.

**edition:** Repository accepted extraction at base 30e57b9090cc4c5e6d91a92848a4837206a921f8.

**url:** https://github.com/CBirkbeck/tauceti-explorer/blob/30e57b9090cc4c5e6d91a92848a4837206a921f8/research/blueprint/papers/PAPER-SKOROBOGATOV-SOFOS-23.result.json.

**sha256:** 26eea65f61f1a165f45964f912063b0997ff15983e08e7574013739d1c81a522.

**accessed:** 2026-10-05.

**readingScope:** Every routed item payload and the accepted route were read. External proofs remain explicit gaps unless a fresh primary-source read is separately listed..

**readSections:** PAPER-SKOROBOGATOV-SOFOS-23/28, PAPER-SKOROBOGATOV-SOFOS-23/29, PAPER-SKOROBOGATOV-SOFOS-23/36, PAPER-SKOROBOGATOV-SOFOS-23/41, PAPER-SKOROBOGATOV-SOFOS-23/42, PAPER-SKOROBOGATOV-SOFOS-23/50, PAPER-SKOROBOGATOV-SOFOS-23/89, PAPER-SKOROBOGATOV-SOFOS-23/96, PAPER-SKOROBOGATOV-SOFOS-23/97, PAPER-SKOROBOGATOV-SOFOS-23/wintner-iwaniec-kowalski-4-2.

### reviewed-paper-ghosh-sarnak-22

Reviewed extraction: Integral points on Markoff type cubic surfaces

**authors:** Atlas extraction and independent review; original authors: Amit Ghosh and Peter Sarnak.

**edition:** Repository accepted extraction at base 30e57b9090cc4c5e6d91a92848a4837206a921f8.

**url:** https://github.com/CBirkbeck/tauceti-explorer/blob/30e57b9090cc4c5e6d91a92848a4837206a921f8/research/blueprint/papers/PAPER-GHOSH-SARNAK-22.result.json.

**sha256:** 0629eae571be6f8f8d221aab0e8cdc4fce29f3546eabbf3dab4f4de07eab6249.

**accessed:** 2026-10-05.

**readingScope:** Every routed item payload and the accepted route were read. External proofs remain explicit gaps unless a fresh primary-source read is separately listed..

**readSections:** PAPER-GHOSH-SARNAK-22/40.

### reviewed-paper-lipnowski-tsimerman-18

Reviewed extraction: How large is A_g(F_q)?

**authors:** Atlas extraction and independent review; original authors: Michael Lipnowski and Jacob Tsimerman.

**edition:** Repository accepted extraction at base 30e57b9090cc4c5e6d91a92848a4837206a921f8.

**url:** https://github.com/CBirkbeck/tauceti-explorer/blob/30e57b9090cc4c5e6d91a92848a4837206a921f8/research/blueprint/papers/PAPER-LIPNOWSKI-TSIMERMAN-18.result.json.

**sha256:** afe626cca9703cf932be5264e31ab90757250d366f5b20577f52050746e7a626.

**accessed:** 2026-10-05.

**readingScope:** Every routed item payload and the accepted route were read. External proofs remain explicit gaps unless a fresh primary-source read is separately listed..

**readSections:** PAPER-LIPNOWSKI-TSIMERMAN-18/residue-source.

### reviewed-paper-lemkeoliver-wang-wood-25

Reviewed extraction: The average size of 3-torsion in class groups of 2-extensions

**authors:** Atlas extraction and independent review; original authors: Robert Lemke Oliver, Jiuya Wang and Melanie Matchett Wood.

**edition:** Repository accepted extraction at base 30e57b9090cc4c5e6d91a92848a4837206a921f8.

**url:** https://github.com/CBirkbeck/tauceti-explorer/blob/30e57b9090cc4c5e6d91a92848a4837206a921f8/research/blueprint/papers/PAPER-LEMKEOLIVER-WANG-WOOD-25.result.json.

**sha256:** eec39f1763b55d3862c13e7e754651863d7096de3319e6b6b6a46fc1c46b627c.

**accessed:** 2026-10-05.

**readingScope:** Every routed item payload and the accepted route were read. External proofs remain explicit gaps unless a fresh primary-source read is separately listed..

**readSections:** PAPER-LEMKEOLIVER-WANG-WOOD-25/14, PAPER-LEMKEOLIVER-WANG-WOOD-25/17, PAPER-LEMKEOLIVER-WANG-WOOD-25/18, PAPER-LEMKEOLIVER-WANG-WOOD-25/19, PAPER-LEMKEOLIVER-WANG-WOOD-25/20.

### reviewed-paper-shankar-shankar-tang-etal-22

Reviewed extraction: Exceptional jumps of Picard ranks of reductions of K3 surfaces over number fields

**authors:** Atlas extraction and independent review; original authors: Ananth N. Shankar, Arul Shankar, Yunqing Tang and Salim Tayou.

**edition:** Repository accepted extraction at base 30e57b9090cc4c5e6d91a92848a4837206a921f8.

**url:** https://github.com/CBirkbeck/tauceti-explorer/blob/30e57b9090cc4c5e6d91a92848a4837206a921f8/research/blueprint/papers/PAPER-SHANKAR-SHANKAR-TANG-ETAL-22.result.json.

**sha256:** 16b8ab4b400b1e5f59a63f27fef880629677186f9a2e42e4ceb920528db6b567.

**accessed:** 2026-10-05.

**readingScope:** Every routed item payload and the accepted route were read. External proofs remain explicit gaps unless a fresh primary-source read is separately listed..

**readSections:** PAPER-SHANKAR-SHANKAR-TANG-ETAL-22/63.

### reviewed-paper-chenevier-taibi-20

Reviewed extraction: Discrete series multiplicities for classical groups over Z and level 1 algebraic cusp forms

**authors:** Atlas extraction and independent review; original authors: Gaëtan Chenevier, Olivier Taïbi.

**edition:** Repository accepted extraction at base 30e57b9090cc4c5e6d91a92848a4837206a921f8.

**url:** https://github.com/CBirkbeck/tauceti-explorer/blob/30e57b9090cc4c5e6d91a92848a4837206a921f8/research/blueprint/papers/PAPER-CHENEVIER-TAIBI-20.result.json.

**sha256:** ee4df7d5c91440e1990291b49b8883e2f626d2f5d631292871ad2bd355706e69.

**accessed:** 2026-10-05.

**readingScope:** Every routed item payload and the accepted route were read. External proofs remain explicit gaps unless a fresh primary-source read is separately listed..

**readSections:** PAPER-CHENEVIER-TAIBI-20/mestre-explicit-formula, PAPER-CHENEVIER-TAIBI-20/grh-rankin-selberg.

### reviewed-paper-koymans-pagano

Reviewed extraction: On Stevenhagen's conjecture

**authors:** Atlas extraction and independent review; original authors: Peter Koymans, Carlo Pagano.

**edition:** Repository accepted extraction at base 30e57b9090cc4c5e6d91a92848a4837206a921f8.

**url:** https://github.com/CBirkbeck/tauceti-explorer/blob/30e57b9090cc4c5e6d91a92848a4837206a921f8/research/blueprint/papers/PAPER-KOYMANS-PAGANO.result.json.

**sha256:** 9ce83843e7e96a3f125f48e8cc898440bcd24c5c4fcdfde12b7ad891621afa28.

**accessed:** 2026-10-05.

**readingScope:** Every routed item payload and the accepted route were read. External proofs remain explicit gaps unless a fresh primary-source read is separately listed..

**readSections:** PAPER-KOYMANS-PAGANO/10, PAPER-KOYMANS-PAGANO/176, PAPER-KOYMANS-PAGANO/181, PAPER-KOYMANS-PAGANO/182, PAPER-KOYMANS-PAGANO/186, PAPER-KOYMANS-PAGANO/187, PAPER-KOYMANS-PAGANO/202, PAPER-KOYMANS-PAGANO/249, PAPER-KOYMANS-PAGANO/250.

### reviewed-paper-gross-zagier-86

Reviewed extraction: Heegner points and derivatives of L-series

**authors:** Atlas extraction and independent review; original authors: Benedict H. Gross, Don B. Zagier.

**edition:** Repository accepted extraction at base 30e57b9090cc4c5e6d91a92848a4837206a921f8.

**url:** https://github.com/CBirkbeck/tauceti-explorer/blob/30e57b9090cc4c5e6d91a92848a4837206a921f8/research/blueprint/papers/PAPER-GROSS-ZAGIER-86.result.json.

**sha256:** 6035bf6315cb9a54b1dd4c17d419ba8bff1894156eeabdd7b101dd18195cdb7b.

**accessed:** 2026-10-05.

**readingScope:** Every routed item payload and the accepted route were read. External proofs remain explicit gaps unless a fresh primary-source read is separately listed..

**readSections:** PAPER-GROSS-ZAGIER-86/95, PAPER-GROSS-ZAGIER-86/96, PAPER-GROSS-ZAGIER-86/172, PAPER-GROSS-ZAGIER-86/196, PAPER-GROSS-ZAGIER-86/197, PAPER-GROSS-ZAGIER-86/226, PAPER-GROSS-ZAGIER-86/229.

### lerch-I

The Lerch zeta function I. Zeta integrals

**authors:** Jeffrey C. Lagarias and Wen-Ching Winnie Li.

**edition:** arXiv1005.4712v2.

**url:** https://arxiv.org/pdf/1005.4712v2.

**sha256:** c89fc79652718216ca5a207101309e3edb27133dca4de64f5ad562010d761a10.

**accessed:** 2026-10-05.

**readSections:** Introduction and Theorem2.3 boundary statement; remaining proof sections not freshly read..

### lerch-II

The Lerch zeta function II. Analytic continuation

**authors:** Jeffrey C. Lagarias and Wen-Ching Winnie Li.

**edition:** arXiv1005.4967v2.

**url:** https://arxiv.org/pdf/1005.4967v2.

**sha256:** f249ec6b41f632be29ea4f894f42c921e3ce61cadb8c368a8e39ca58de891eb9.

**accessed:** 2026-10-05.

**readSections:** §2 Theorems2.1–2.3; §4 monodromy formulas and residue/shift proof pp16–18; §5 derivative proof pp20–22; §7 nonpositive-integer monodromy proof. Complete §§3–4 cover gluing remains a gap..

### lerch-III

The Lerch zeta function III. Polylogarithms and special values

**authors:** Jeffrey C. Lagarias and Wen-Ching Winnie Li.

**edition:** arXiv1506.06161v1.

**url:** https://arxiv.org/pdf/1506.06161v1.

**sha256:** 010c108a9e63963dae0b6f3b053c14c457dd836d5e24b067a3fed794f44b3fa3.

**accessed:** 2026-10-05.

**readSections:** Introduction; Theorems2.1–2.4; §5 rational negative-integer recurrence. The (2.5) sign is corrected in the publisher version..

### halasz-ghs

A new proof of Halász’s theorem, and its consequences

**authors:** Andrew Granville, Adam J. Harper and K. Soundararajan.

**edition:** arXiv1706.03749v1.

**url:** https://arxiv.org/pdf/1706.03749v1.

**sha256:** f0e172b6d6a89bfda96c5b4f264641509742030a7567cc9f0ae9815dccde7d06.

**accessed:** 2026-10-05.

**readSections:** §1 pp1–4, §2 Lemmas2.2–2.5 and start of Lemma2.6. Full Shiu and mean-square proofs remain gaps..

### pretentious-gs

Pretentious multiplicative functions and an inequality for the zeta-function

**authors:** Andrew Granville and K. Soundararajan.

**edition:** arXivmath/0608407v1.

**url:** https://arxiv.org/pdf/math/0608407.

**sha256:** 94906dfdc14c8b88a2010334cf0aac31055653b220fa84856d1285ac246efac4.

**accessed:** 2026-10-05.

**readSections:** pp1–4, mean-value statement and weighted unit-disc norm proof..

### smooth-ht

Integers without large prime factors

**authors:** Adolf Hildebrand and Gérald Tenenbaum.

**edition:** JTNB5(1993),411–484, publisher scan.

**url:** https://www.numdam.org/item/JTNB_1993__5_2_411_0.pdf.

**sha256:** f7641a11188d783d8e941883467d541d71429b98d6760e7d20bf85cf53e80bac.

**accessed:** 2026-10-05.

**readSections:** Introduction pp411–415, text-layer read; mathematics on p414 additionally checked on page image. Full §§2–3 proofs remain gaps..

### beurling-dv

On general prime number theorems with remainder

**authors:** Gregory Debruyne and Jasson Vindas.

**edition:** arXiv1601.05324v2.

**url:** https://arxiv.org/pdf/1601.05324.

**sha256:** 5100c8395e6eb149e76fd3d62cf5146d38faac1804afa6c7d9f0dd7e9f30464c.

**accessed:** 2026-10-05.

**readSections:** Introduction, Theorem1 and §2.1 pp1–3; complete Tauberian proofs remain gaps..

### lerch-III-published

The Lerch Zeta function III. Polylogarithms and special values

**authors:** Jeffrey C. Lagarias and Wen-Ching Winnie Li.

**edition:** Research in the Mathematical Sciences3:2(2016),54pp, publisher PDF.

**url:** https://link.springer.com/content/pdf/10.1186/s40687-015-0049-2.pdf.

**sha256:** 1b9d8d35cf23b15bd921621011a066832dd39924688b121e85d6067eb25f6593.

**accessed:** 2026-10-05.

**readSections:** Theorem2.3 (2.3)–(2.5) and corresponding §4 derivative proof read fresh; larger continuation/special-value statements first read in v1 and matched to this publisher text at the named statement only. Full publisher §§3–6 proof collation remains a gap..

### atlas-an-brief

Analytic Number Theory stage specification

**authors:** Tau Ceti Atlas maintainers.

**edition:** Campaign brief at the recorded job base, amended by accepted RS-07.

**url:** https://github.com/CBirkbeck/tauceti-explorer/blob/30e57b9090cc4c5e6d91a92848a4837206a921f8/content/campaign/AnalyticNumberTheory/README.md.

**sha256:** b20cf03920b90ea7af8996b6d186dbfcbe50a1b8088bd9e2501dc3b908c13223.

**readSections:** Entire campaign brief and all eight in-scope stage descriptions. This specifies targets; it proves no analytic theorem..

## Source discrepancies

The inherited thirteen entries are retained with their original provenance. E14 concerns the proof, with a corrected gamma majorant; it does not refute the order-one conclusion. E15 is an already-corrected preprint misprint and does not affect the published result. The source-version records distinguish the preprint and final publisher file. No global novelty claim is made.

### AnalyticNumberTheory/E1

**source:** bennett-siksek-2020

**kind:** error

**locator:** Published §8.1 p.378 and its reuse on p.379; known source issue E2.

**printed:** τ(q) ≤ q^(1/log log 3q) for all q ≥ 1.

**correction:** Use the uniform explicit bound and eventual threshold supplied by the AN.5 chain; retain the constant for all positive n.

**reason:** At q=120, τ(q)=16 while the printed power is about14.89222. The local-to-global construction supplies a valid replacement.

**affects:** a stated result

**known:** Previously recorded and independently confirmed as PAPER-BENNETT-SIKSEK-20/E2; no new finding claimed.

**searched:** Existing independently reviewed E2, E3 and E11 in research/blueprint/errata/PAPER-BENNETT-SIKSEK-20.json and REV-ERRATA-PAPER-BENNETT-SIKSEK-20 were read. Their bounded 23 September 2026 search covered the publisher article page, Crossref, arXiv v1, and both authors' publication pages; this packet does not claim a new correction search or global novelty. The published PDF §8.1 was freshly read on 26 September 2026 and pages377–379 were checked as images. No independent-review verdict is being issued by this blueprint.

### AnalyticNumberTheory/E2

**source:** kedlaya-ant-2025

**kind:** misprint

**locator:** Equation(8.3.3), printed p.50, PDF p.66

**printed:** Γ′((s+1)/2)/Γ((s+1)/2)

**correction:** The displayed term must be Γ′(1+s/2)/Γ(1+s/2). Equivalently retain Γ′(s/2)/Γ(s/2) together with the missing 1/s term.

**reason:** Logarithmically differentiate ξ(s)=(1/2)s(s−1)π^(−s/2)Γ(s/2)ζ(s); the 1/s term is absorbed by (1/2)ψΓ(1+s/2), since ψΓ(z+1)=ψΓ(z)+1/z. The (s+1)/2 argument cannot perform that absorption.

**affects:** the proof

**known:** new

**searched:** 27 September 2026: the author's 21 December 2025 PDF and parallel HTML at https://kskedlaya.org/ant/chap-zeroes.html, https://kskedlaya.org/ant/part-2-4.html and https://kskedlaya.org/ant/chap-artin.html; the displayed problems persist in the matching passages. Author preface https://kskedlaya.org/ant/frontmatter-4.html and bounded domain searches for Kedlaya analytic-number-theory errata, the Frobenius wording and Theorem10.11 explicit constants; no author correction identified. The repository source-issue index had no AnalyticNumberTheory/Kedlaya entry. 'new' means newly recorded here, not exhaustive global novelty.

### AnalyticNumberTheory/E3

**source:** kedlaya-ant-2025

**kind:** error

**locator:** Lemma22.1, printed p.127, PDF p.143

**printed:** x^p=x^g

**correction:** Require a chosen prime P above p and the action of g on every element of O_K/P to be x↦x^p; use NFA2's IsArithFrobAt and then its conjugacy theorem.

**reason:** The source only requires a nonzero solution in O_K/pO_K. The element1 works for every g. In any nontrivial quadratic extension all g then qualify, but its two singleton conjugacy classes cannot form one class. The condition cannot characterize arithmetic Frobenius.

**affects:** a stated result

**known:** new

**searched:** 27 September 2026: the author's 21 December 2025 PDF and parallel HTML at https://kskedlaya.org/ant/chap-zeroes.html, https://kskedlaya.org/ant/part-2-4.html and https://kskedlaya.org/ant/chap-artin.html; the displayed problems persist in the matching passages. Author preface https://kskedlaya.org/ant/frontmatter-4.html and bounded domain searches for Kedlaya analytic-number-theory errata, the Frobenius wording and Theorem10.11 explicit constants; no author correction identified. The repository source-issue index had no AnalyticNumberTheory/Kedlaya entry. 'new' means newly recorded here, not exhaustive global novelty.

### AnalyticNumberTheory/E4

**source:** kedlaya-ant-2025

**kind:** error

**locator:** Equations(7.2.1)–(7.2.2), printed pp.44–45, and proof of Theorem7.7

**printed:** 1/γ

**correction:** Use 1/|γ| in the nonnegative majorant and Stieltjes sum. Choose T away from zero ordinates, or use matching left limits at T. Isolate a finite low-height range and justify a positive lower cutoff.

**reason:** The source sums over both signs of γ. A conjugate pair contributes zero to 1/γ but positively to the claimed Stieltjes expression. A strict sum |γ|<T also cannot equal the expression with inclusive N(T) when T is a zero ordinate.

**affects:** the proof

**known:** new

**searched:** 27 September 2026: the author's 21 December 2025 PDF and parallel HTML at https://kskedlaya.org/ant/chap-zeroes.html, https://kskedlaya.org/ant/part-2-4.html and https://kskedlaya.org/ant/chap-artin.html; the displayed problems persist in the matching passages. Author preface https://kskedlaya.org/ant/frontmatter-4.html and bounded domain searches for Kedlaya analytic-number-theory errata, the Frobenius wording and Theorem10.11 explicit constants; no author correction identified. The repository source-issue index had no AnalyticNumberTheory/Kedlaya entry. 'new' means newly recorded here, not exhaustive global novelty.

### AnalyticNumberTheory/E5

**source:** kedlaya-ant-2025

**kind:** gap

**locator:** Theorems7.5/8.8 and use in Theorem7.7, printed pp.45,50–51

**printed:** Im(s)≥1

**correction:** Retain only Im(s)≥t₀>1 as the direct conclusion; establish bounded heights and conjugation separately before deriving the global PNT error.

**reason:** The formula has log1 in its denominator, and the proof's O(log t) estimate/constant choice is a high-height argument. The inherited independent review already required a finite low-height contribution.

**affects:** the proof

**known:** Inherited integrated-decomposition independent review's high-height and low-zero-gap corrections; no new priority claim.

**searched:** 27 September 2026: the author's 21 December 2025 PDF and parallel HTML at https://kskedlaya.org/ant/chap-zeroes.html, https://kskedlaya.org/ant/part-2-4.html and https://kskedlaya.org/ant/chap-artin.html; the displayed problems persist in the matching passages. Author preface https://kskedlaya.org/ant/frontmatter-4.html and bounded domain searches for Kedlaya analytic-number-theory errata, the Frobenius wording and Theorem10.11 explicit constants; no author correction identified. The repository source-issue index had no AnalyticNumberTheory/Kedlaya entry. 'new' means newly recorded here, not exhaustive global novelty.

### AnalyticNumberTheory/E6

**source:** kedlaya-ant-2025

**kind:** misprint

**locator:** Theorem8.7 proof following(8.2.3), printed p.49

**printed:** 1+(z/ρ)²/2+O((z/ρ)³)

**correction:** The expansion is 1−(z/ρ)²/2+O((z/ρ)³). Also the middle range in the three-factor partition is h₂, not a second h₁.

**reason:** Multiplying (1−w)(1+w+w²/2+O(w³)) gives 1−w²/2+O(w³). Absolute convergence uses only the quadratic order, so the sign does not alter the intended convergence argument.

**affects:** nothing

**known:** new

**searched:** 27 September 2026: the author's 21 December 2025 PDF and parallel HTML at https://kskedlaya.org/ant/chap-zeroes.html, https://kskedlaya.org/ant/part-2-4.html and https://kskedlaya.org/ant/chap-artin.html; the displayed problems persist in the matching passages. Author preface https://kskedlaya.org/ant/frontmatter-4.html and bounded domain searches for Kedlaya analytic-number-theory errata, the Frobenius wording and Theorem10.11 explicit constants; no author correction identified. The repository source-issue index had no AnalyticNumberTheory/Kedlaya entry. 'new' means newly recorded here, not exhaustive global novelty.

### AnalyticNumberTheory/E7

**source:** kedlaya-ant-2025

**kind:** gap

**locator:** End of Theorem8.7 proof, printed p.49

**printed:** |g(z)|=O(|z|^(1+ε))

**correction:** Choose a global holomorphic logarithm of the zero-free entire quotient, then derive a modulus bound for g from its real-part upper bound using Borel–Carathéodory on nested discs (or an equivalent named lemma).

**reason:** Order≤1 gives an upper bound for Re(g)=log|f/h|, not directly the asserted bound for |g|. The missing real-part-to-modulus step is needed before the Liouville argument.

**affects:** the proof

**known:** new

**searched:** 27 September 2026: the author's 21 December 2025 PDF and parallel HTML at https://kskedlaya.org/ant/chap-zeroes.html, https://kskedlaya.org/ant/part-2-4.html and https://kskedlaya.org/ant/chap-artin.html; the displayed problems persist in the matching passages. Author preface https://kskedlaya.org/ant/frontmatter-4.html and bounded domain searches for Kedlaya analytic-number-theory errata, the Frobenius wording and Theorem10.11 explicit constants; no author correction identified. The repository source-issue index had no AnalyticNumberTheory/Kedlaya entry. 'new' means newly recorded here, not exhaustive global novelty.

### AnalyticNumberTheory/E8

**source:** kedlaya-ant-2025

**kind:** misprint

**locator:** Theorem10.2 parity convention, printed p.59

**printed:** a=1 for χ even

**correction:** For the displayed −(1−a)log x and ∑x^(a−2m)/(2m−a), use a=0 for even and a=1 for odd primitive characters. State the primitive restriction; imprimitive local-factor zeros need separate terms.

**reason:** The subsequent §10.2 gamma factor uses a=0 for even and1 for odd. Even primitive nonprincipal L-functions have a zero at0 and trivial zeros at negative even integers, fixing both displayed terms.

**affects:** the proof

**known:** new

**searched:** 27 September 2026: the author's 21 December 2025 PDF and parallel HTML at https://kskedlaya.org/ant/chap-zeroes.html, https://kskedlaya.org/ant/part-2-4.html and https://kskedlaya.org/ant/chap-artin.html; the displayed problems persist in the matching passages. Author preface https://kskedlaya.org/ant/frontmatter-4.html and bounded domain searches for Kedlaya analytic-number-theory errata, the Frobenius wording and Theorem10.11 explicit constants; no author correction identified. The repository source-issue index had no AnalyticNumberTheory/Kedlaya entry. 'new' means newly recorded here, not exhaustive global novelty.

### AnalyticNumberTheory/E9

**source:** kedlaya-ant-2025

**kind:** error

**locator:** Theorem10.11, printed p.63, omitted progression hypothesis

**printed:** π(x,N,a)=li(x)/φ(N)+O(x log^(−A)x)

**correction:** Require gcd(a,N)=1, x sufficiently large, and state an explicit logarithmic modulus range N≤(log x)^B with fixed B in the standard Siegel–Walfisz formulation.

**reason:** With a=N=2, only the prime2 is counted, while li(x)/φ(2) has size x/log x; for A>1 the displayed remainder cannot absorb it.

**affects:** a stated result

**known:** new

**searched:** 27 September 2026: the author's 21 December 2025 PDF and parallel HTML at https://kskedlaya.org/ant/chap-zeroes.html, https://kskedlaya.org/ant/part-2-4.html and https://kskedlaya.org/ant/chap-artin.html; the displayed problems persist in the matching passages. Author preface https://kskedlaya.org/ant/frontmatter-4.html and bounded domain searches for Kedlaya analytic-number-theory errata, the Frobenius wording and Theorem10.11 explicit constants; no author correction identified. The repository source-issue index had no AnalyticNumberTheory/Kedlaya entry. 'new' means newly recorded here, not exhaustive global novelty.

### AnalyticNumberTheory/E10

**source:** kedlaya-ant-2025

**kind:** gap

**locator:** Theorem10.11 following Siegel's theorem, printed p.63

**printed:** implied constants are explicit

**correction:** The usual Siegel–Walfisz proof from the stated Siegel theorem has potentially ineffective constants. An effective version needs an additional explicit input or an exceptional-zero term and a revised contract.

**reason:** No effective lower bound for the Siegel constant is supplied. It is invalid to export an effective constant merely from the preceding existence theorem; AN.2 must distinguish these interfaces.

**affects:** a stated result

**known:** new

**searched:** 27 September 2026: the author's 21 December 2025 PDF and parallel HTML at https://kskedlaya.org/ant/chap-zeroes.html, https://kskedlaya.org/ant/part-2-4.html and https://kskedlaya.org/ant/chap-artin.html; the displayed problems persist in the matching passages. Author preface https://kskedlaya.org/ant/frontmatter-4.html and bounded domain searches for Kedlaya analytic-number-theory errata, the Frobenius wording and Theorem10.11 explicit constants; no author correction identified. The repository source-issue index had no AnalyticNumberTheory/Kedlaya entry. 'new' means newly recorded here, not exhaustive global novelty.

### AnalyticNumberTheory/E11

**source:** kedlaya-ant-2025

**kind:** misprint

**locator:** Theorem9.9 proof, printed pp.57–58

**printed:** U→0

**correction:** The odd positive integer U tends to infinity. The near-endpoint remainder range on p.58 is 3x/4<n<x′, not3/4<n<x′.

**reason:** The contour's left edge is Re(s)=−U, and T log U/(U x^U) tends to0 as U tends to infinity; the substitution n=x′−m with m<x/4 requires the corrected range.

**affects:** nothing

**known:** new

**searched:** 27 September 2026: the author's 21 December 2025 PDF and parallel HTML at https://kskedlaya.org/ant/chap-zeroes.html, https://kskedlaya.org/ant/part-2-4.html and https://kskedlaya.org/ant/chap-artin.html; the displayed problems persist in the matching passages. Author preface https://kskedlaya.org/ant/frontmatter-4.html and bounded domain searches for Kedlaya analytic-number-theory errata, the Frobenius wording and Theorem10.11 explicit constants; no author correction identified. The repository source-issue index had no AnalyticNumberTheory/Kedlaya entry. 'new' means newly recorded here, not exhaustive global novelty.

### AnalyticNumberTheory/E12

**source:** kedlaya-ant-2025

**kind:** misprint

**locator:** Remark10.8 zero-repulsion inequalities, printed p.62

**printed:** σ−Im(ρ)

**correction:** Use σ−Re(ρ) when the evaluation point has the same imaginary part as the zero. The principal-character pole occurs at s=1, not at χ=1.

**reason:** At s=σ+i Im(ρ), s−ρ=σ−Re(ρ); using the imaginary part cannot measure horizontal separation from the zero.

**affects:** the proof

**known:** new

**searched:** 27 September 2026: the author's 21 December 2025 PDF and parallel HTML at https://kskedlaya.org/ant/chap-zeroes.html, https://kskedlaya.org/ant/part-2-4.html and https://kskedlaya.org/ant/chap-artin.html; the displayed problems persist in the matching passages. Author preface https://kskedlaya.org/ant/frontmatter-4.html and bounded domain searches for Kedlaya analytic-number-theory errata, the Frobenius wording and Theorem10.11 explicit constants; no author correction identified. The repository source-issue index had no AnalyticNumberTheory/Kedlaya entry. 'new' means newly recorded here, not exhaustive global novelty.

### AnalyticNumberTheory/E13

**source:** kedlaya-ant-2025

**kind:** error

**locator:** Theorem10.6 denominator, printed p.61

**printed:** log N

**correction:** Assume N>1 for this primitive Dirichlet-character formulation; treat the unique conductor-one character through the zeta statement.

**reason:** The quantifier includes the primitive character of level1, but its denominator log N is zero. The zeta pole and small-height conventions require a separate specialization.

**affects:** a stated result

**known:** new

**searched:** 27 September 2026: the author's 21 December 2025 PDF and parallel HTML at https://kskedlaya.org/ant/chap-zeroes.html, https://kskedlaya.org/ant/part-2-4.html and https://kskedlaya.org/ant/chap-artin.html; the displayed problems persist in the matching passages. Author preface https://kskedlaya.org/ant/frontmatter-4.html and bounded domain searches for Kedlaya analytic-number-theory errata, the Frobenius wording and Theorem10.11 explicit constants; no author correction identified. The repository source-issue index had no AnalyticNumberTheory/Kedlaya entry. 'new' means newly recorded here, not exhaustive global novelty.

### AnalyticNumberTheory/E14

**source:** kedlaya-ant-2025

**kind:** error

**locator:** Lemma8.3 proof, printed p47/PDFp63, author PDF sha7a934fce; parallel current HTML chap-zeroes

**printed:** the integral by exp(C|s|)

**correction:** Retain ω(x)≤C₀e^(−πx), and bound the resulting gamma integral by exp(C₁|s|log(2+|s|)). This proves the stated order-one growth but not the claimed exponential-type integral bound.

**reason:** For fixed real s>2, x^(s/2−1) is unbounded as x→∞, so it cannot be bounded uniformly in x by exp(C|s|). A constant bound for ω integrated on[1,∞) also gives an infinite majorant. The original positive integral has gamma-size growth along positive real s.

**affects:** the proof

**known:** new

**searched:** Current author HTML https://kskedlaya.org/ant/chap-zeroes.html, Lemma8.3, 2026-10-05: the same failed bound remains. Author PDF ant-ptx.pdf and web search for Lemma8.3 corrections on the author domain, 2026-10-05.

### AnalyticNumberTheory/E15

**source:** lerch-III

**kind:** misprint

**locator:** Preprint arXiv1506.06161v1 Theorem2.3 (2.5),p13; corrected in published RMS3:2(2016),p13 (2.5)

**printed:** (z∂z+c)∂cΦ(s,z,c)=sΦ(s,z,c)

**correction:** The right-hand side is −sΦ(s,z,c), as in the published equation(2.5).

**reason:** Apply (z∂z+c) to ∂cΦ=−sΦ(s+1,z,c), then use the lowering relation at s+1. At z=0 the left side is −s c^−s, so the plus sign fails already at s=c=1.

**affects:** nothing

**known:** Corrected in the published RMS3:2(2016) equation(2.5), DOI10.1186/s40687-015-0049-2.

**searched:** Publisher final PDF equation(2.5) and §4 proof freshly read on2026-10-05. arXivv1 equation(2.5), introduction(1.7), and the author publication listing checked on2026-10-05.

## Ownership proposals and upstream notes

**finding:** RT-AREA-analytic/1

**disposition:** propose new extension; requires independent ownership review

**title:** Chebotarev density theorem, Part II: arithmetic schemes

**extends:** tauceti:TauCetiRoadmap/Chebotarev

**need:** Normal integral schemes of finite type over Z, finite étale Galois covers, conjugacy-invariant Frobenius subsets of closed points, weighted natural-density normalization from Serre Lectures on N_X(p) §9 and the AV §2.14 application; recover number-field Chebotarev in relative dimension zero. Prove density of Frobenius in the profinite fundamental group and triviality of a finite cover split at a density-one set. Exact mixed-characteristic/finite-field component hypotheses and denominator must be read and stated before a quantitative density theorem.

**consumers:** PAPER-ABDURRAHMAN-VENKATESH-25/20, PAPER-SCHMIDT-STIX-16

**reason:** AN.4 after RS-07 owns number-field analytic comparisons, not arbitrary arithmetic schemes. Existing Chebotarev roadmap is number-field-only. This is a proposal, not an invented existing supplier or a live scope change.

**finding:** RT-AREA-combinatorics/8

**disposition:** propose narrowing of the AN.2→AC.4 contract; preserve the accepted edge pending review

**source:** AnalyticNumberTheory:AN.2

**target:** AdditiveCombinatorics:AC.4

**need:** For the linear-forms-only smooth-cutoff majorant route of Conlon–Fox–Zhao arXiv:1403.2957 and Zhao arXiv:1307.4959, supply the Laurent expansion of zeta at 1 in a fixed local neighbourhood, with bounded holomorphic regular part, and elementary Chebyshev estimates for the W-trick. The AC.4 owner proves its linear-forms condition and relative counting theorem. Do not require the older Green–Tao 2008 correlation-weight route, a global zero-free region, or a growing-modulus PNT unless the selected AC.4 proof actually uses them.

**reason:** A newer majorant route can narrow the analytic contract, but this packet cannot edit AC.4 or replace accepted stage edges. Source verification and route agreement remain explicit review gates.

**id:** AN.4/colmez-finite-family

**status:** proposal

**need:** For fixed g, possible normal-closure groups, representation dimensions and Colmez coefficient sizes lie in a bounded finite-combinatorial family. Split off the trivial Artin factor as a dimension-dependent constant before evaluating other factors at 1.

**reason:** The Colmez CM-type representation coefficients are arithmetic height data, not a new analytic carrier. The analytic nodes need explicit dimension-dependent coefficient and conductor bounds from its owner.

**source:** PAPER-TSIMERMAN-18/colmez-finite-uniformity

**id:** AN.4/regulator-ratio

**status:** proposal

**source:** PAPER-LEMKEOLIVER-WANG-WOOD-25/20

**need:** For L⊇K, Rg(L)/Rg(K)≥c_[L:Q]>0, in the canonical global unit/regulator theory, with the Friedman–Skoruppa normalization.

**reason:** This is a theorem about unit lattices. Assign the exact supplier after the GlobalNumberFields regulator milestone has been matched; no parallel regulator is defined here.

**id:** AN.4/effective-chebotarev

**status:** proposal

**source:** PAPER-KOYMANS-PAGANO/249

**need:** Zeros of L-functions Layer8.7 supplies effective Chebotarev with field degree/discriminant, interval and exceptional-zero dependence explicit. The KP owner must derive its box count from this theorem and its excellent-box arithmetic data.

**reason:** The Chebotarev roadmap explicitly excludes effective estimates and assigns them to Zeros of L-functions. This upstream roadmap is not represented by a resolvable stage in the supplied atlas snapshot; retain an upstream note and exact request, not a fabricated atlas id.

**locator:** Chebotarev README, boundary section and Layer8.7 reference

**note:** Effective Chebotarev is explicitly owned by Zeros of L-functions, but no stage endpoint for that roadmap exists in this atlas snapshot. Supply the named theorem endpoint before importing KP item249. No upstream file is edited.

**roadmaps:** Zeros of L-functions

## Suggested signatures and verification

The suggested file uses the actual pinned Riemann, Dirichlet, arithmetic-function, analytic-order, smooth-number and finite-support carriers. Six imported-carrier definition blocks remain mathematical comments, with all proposed API and test names, under the explicit native-signature gap. No invented proposition-valued replacement interface is used. Sixteen concrete definition blocks have signatures, API lemmas and examples; principal analytic theorems have native forms where their carriers can be stated.

The suggested file was **not compiled**: a complete existing build at both exact pins was unavailable. No new Lake project, cache, build or language server was started. Indexed packet validation and consistency checks validate the planning graph and its artifacts, not the truth of the mathematical statements. Independent review must assess the open source and native-interface gaps before any stage is treated as closed.
