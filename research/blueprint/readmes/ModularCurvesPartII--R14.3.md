# Modular curves, Part II — part R14.3: realisations, modular quotients and bad-prime interfaces — blueprint

This part covers stages R14.3, R14.4, R14.5 and R14.6 of ModularCurvesPartII. After the first checkpoint:

| Stage | Coverage |
|---|---|
| R14.5 | `partial`: all planned, one source unread (oldform multiplicity) |
| R14.6 | `partial` |
| R14.3 | `partial`: the weight-two Betti inputs |
| R14.4 | `not_read` |

The accepted restructuring RS-06 narrows each stage:
- **R14.5** owns the actual quotient A_f of J₁(N), or J₀(N) for trivial character, of a weight-two newform. Its Galois
  representation belongs to AutomorphicGaloisRepresentations R19.1/R19.6, and its identification with a given elliptic
  curve to EllipticCurveModularity R29.5.
- **R14.6** owns the special-fibre Eichler–Shimura relation, the character groups and the cusp-normalised Abel–Jacobi
  maps.
- **R14.3** owns the finite-level integral realisations and pairings.

The source is Brian Conrad's appendix, *The Shimura construction in weight 2*, to Ribet–Stein, *Lectures on Serre's
conjectures* (author PDF, §§5.1–5.3), together with Ribet–Stein §2.3.1.

## Purpose

A weight-two newform f of level N gives an abelian variety A_f over ℚ:
- its dimension is [K_f : ℚ];
- its Tate modules carry the Galois representations of f;
- its differentials are the Galois conjugates of f.

It is the bridge from modular forms to geometry that EllipticCurveModularity (R29.5) and SerreWeightAndLevelOptimisation
(R20) use. R14.6 supplies the reduction-mod-p relation (T_p)_* = F + ⟨p⟩_*F^∨, which pins down the characteristic
polynomial of Frobenius, and the Abel–Jacobi maps normalised at rational cusps.

## Conventions

- **Level and curve.** N ≥ 5, and X₁(N) is the proper smooth curve over ℤ[1/N] of the moduli problem (E, P) with P of
  exact order N.
- **Jacobian.** J₁(N) = Pic⁰_{X₁(N)}.
- **Two Hecke actions.**
  - The Picard action: T_p^* = Alb(π₁) ∘ Pic⁰(π₂).
  - The Albanese action: (T_p)_* = Alb(π₂) ∘ Pic⁰(π₁).
  - The Albanese action induces the classical action on cotangent spaces (= S₂); the Picard action induces its
    Petersson adjoint, and w_ζ conjugates one into the other (Conrad's warning).
- **The quotient.** A_f is formed with the Picard action (Conrad's Definition 5.13).
- **Rational cusps.** Which cusp is rational depends on the moduli model: ∞ on X₀(N); 0 on X₁(N) in the (E, P) model.

## Milestones

Library module: `TauCeti/NumberTheory/ModularCurves/ModularQuotient`, namespace `TauCeti.ModularCurves`.

### R14.3 — weight-two Betti inputs

**Theorem: the Hecke-equivariant Shimura isomorphism** (node `weight-two-shimura-isomorphism`; planet "Weight-two
Shimura isomorphism"; Conrad Theorem 5.1). S₂ ⊕ S̄₂ ≅ H¹(X₁(N)^an, ℤ) ⊗ ℂ, identifying:
- T_p with T_p^*;
- ⟨n⟩ with ⟨n⟩^*;
- w_N with w^*_ζ.

**Theorem: cup product and the Petersson product** (node `cup-product-petersson`; Theorem 5.2). The two agree up to the
factor 4π.

**Lemma: twisted self-adjointness** (node `hecke-twisted-self-adjoint`; Corollary 5.3). T₁(N) is self-adjoint for
[x, y] = (x, w_ζ y).

**Theorem: rank-two freeness** (node `betti-free-rank-two`; planet; Corollary 5.9).
- H¹(X₁(N), ℚ) is free of rank 2 over ℚ ⊗ T₁(N).
- ℚ ⊗ T₁(N) is Gorenstein.

### R14.5 — the modular quotient A_f

**Definition: the Hecke prime** (node `newform-hecke-prime`). p_f is the kernel of the eigenvalue map T₁(N) → K_f.
- *Unit tests.*
  - N = 11 gives K_f = ℚ.
  - N = 23 gives K_f = ℚ(√5).
  - N = 22 with trivial character has no newform.

**Construction: the modular abelian variety** (node `modular-quotient`; planet "Modular abelian variety A_f"; Conrad
Definition 5.13).
- A_f = J₁(N)/p_f J₁(N).
- It has good reduction over ℤ[1/N] and a K_f-action up to isogeny.
- *API.*
  - `modularQuotient`.
  - `.map`.
  - `.goodReduction`.
  - `.coeffAction`.
- *Unit tests.*
  - N = 11 gives 11a1.
  - N = 23 gives an abelian surface with real multiplication by ℚ(√5).
  - N ≤ 4 is degenerate.

**Lemma: Tate modules of quotients** (node `quotient-tate-exact`). The sequence V_ℓ(B′) → V_ℓ(B) → V_ℓ(A) → 0 is exact,
by Poincaré reducibility.

**Theorem: Shimura's dimension theorem** (node `modular-quotient-dimension`; planet; Conrad Theorem 5.14).
- dim A_f = [K_f : ℚ].
- V_ℓ(A_f) is free of rank 2 over ℚ_ℓ ⊗ K_f.

**Theorem: differentials** (node `modular-quotient-differentials`). The differentials of A_f are the span of the f^σ for
the Albanese action, and w_ζ of that span for the Picard action.

**Comparison: trivial character** (node `trivial-character-J0`). The J₀(N) quotient is isogenous to A_f.

**Lemma: oldforms** (node `oldform-comparison`). The f-part of J₁(M) is isogenous to A_f^{σ₀(M/N)}.
- The proof is planned.
- Its primary source (Shimura's book, Diamond–Im) is not freely available (gap).

**Theorem: the Abel–Jacobi composite** (node `abel-jacobi-composite-nonzero`). X₁(N) → J₁(N) → A_f is nonconstant.

### R14.6 — reduction and Abel–Jacobi

**Lemma: Hecke operators on the Néron model** (node `neron-hecke-extension`). T_p^* and (T_p)_* extend over ℤ[1/N].

**Theorem: the Eichler–Shimura relation** (node `special-fibre-eichler-shimura`; planet "Eichler–Shimura relation";
Conrad Theorem 5.16). For p ∤ N:
- (T_p)_* = F + ⟨p⟩_*F^∨;
- w_ζ⁻¹Fw_ζ = ⟨p⟩_*⁻¹F.

**Construction: cusp-normalised Abel–Jacobi maps** (node `rational-cusp-abel-jacobi`; planet). AJ_∞ : X₀(N) → J₀(N).
- *Unit tests.*
  - N = 11 gives an isomorphism.
  - N = 1 is degenerate.
  - AJ_0 − AJ_∞ is torsion (Manin–Drinfeld).

## Dependencies

- **Requested within this roadmap:**
  - R14.2 (Jacobians and both Hecke actions), from this roadmap's R13.3 part;
  - R13.2 (the moduli curves over ℤ[1/N]);
  - R12.3 (cusps);
  - R12.5 (differentials).
- **Requested from other roadmaps:**
  - AbelianSchemesAndArithmeticModuli A2 (quotients, Pic/Alb) and A6 (Poincaré reducibility);
  - NeronModelsAndSemistableAbelianVarieties R11.1 (Néron property);
  - Tau Ceti ModularForms Layers 4, 8, 8g;
  - Tau Ceti JacobianChallenge Layer F (Abel–Jacobi).
- **Consumers:**
  - EllipticCurveModularity R29.5;
  - AutomorphicGaloisRepresentations R19.1/R19.6;
  - SerreWeightAndLevelOptimisation R20.

## Acceptance tests

- dim A_f = [K_f : ℚ], checked at N = 11 and N = 23.
- The Hecke-action convention is fixed before identifying differentials.
- A_f is defined over ℚ with good reduction outside N.
- The Eichler–Shimura relation includes the w_ζ relation.
- No modular parametrisation of a given E is asserted here.
- No quotient of a modular-curve Jacobian is asserted for weight > 2.

## Remaining

- **R14.3:**
  - integral étale H¹ and the étale–Betti comparison;
  - Poincaré duality at finite level;
  - parabolic versus compactly supported cohomology;
  - symmetric-power local systems;
  - non-Eisenstein torsion-freeness;
  - comparison with Layer 8's modular-symbol lattice.
- **R14.4:** Ihara's lemma (Ribet–Stein §3).
- **R14.5:** a primary source for the oldform multiplicity.
- **R14.6:** character groups and monodromy at p ∥ N, and Taylor–Wiles freeness.

## Sources

**Ribet–Stein,** *Lectures on Serre's conjectures*, author PDF (published in IAS/Park City Math. Ser. 9, 2001). Read:
- §2.3.1;
- Conrad's appendix §§5.1–5.3.
