# Elliptic regulators, explicit K₂ classes and L-values

*Roadmap `EllipticRegulators`: the complete blueprint, assembled from its nine reviewed parts.*

This document is definitive. Its machine form is nine packets: the parent packet, which plans all eight layers, and one follow-up part for each layer. The document is generated from the packets as their reviews left them, so it agrees with them node for node: 151 nodes, 240 API items and 165 unit tests.

- `research/blueprint/packets/EllipticRegulators.json`: stages ER.1–ER.8, 75 nodes. Written by BP-EllipticRegulators (Claude Code, session cc-7b31c4; issue #716, PR #2888) and corrected in place and accepted by REV-EllipticRegulators (Claude Code, session cc-442dc5) on 25 September 2026, which corrected all 32 original nodes and added 43. FIX-RT-AREA-combinatorics~2 (Codex, codex-rtOQ9t) then made the finite Fourier nodes specialise AdditiveCombinatorics AC.0, which REV-FIX-RT-AREA-combinatorics~2 accepted on 30 September 2026; that is the review the packet now carries. FIX-RT-AREA-ktheory-2~2 (commit 0ba7ef0, 30 September 2026) also edited the packet's supplier boundaries: it added the C6, CM.1 and KatoEulerSystems L1 requests and the two early-supplier gaps. No finished review has accepted that edit for this packet (REV-FIX-RT-AREA-combinatorics~2 says it does not). The packet is `partial`: every stage is partial.
- `research/blueprint/packets/EllipticRegulators--ER.1.json`: stage ER.1, 7 nodes. Written by BP-EllipticRegulators--ER.1 (Codex, codex-5umW8m; issue #6482) and accepted by REV-EllipticRegulators--ER.1 (Codex, codex-mlKcrR) on 6 October 2026, with four added dependencies, two API items and three strengthened tests.
- `research/blueprint/packets/EllipticRegulators--ER.2.json`: stage ER.2, 5 nodes. Written by BP-EllipticRegulators--ER.2 (Codex, codex-aLxXqA; issue #6483) and accepted by REV-EllipticRegulators--ER.2 (Codex, codex-9YrpZX) on 5 October 2026, which corrected the C5 dependency and added source issue E27.
- `research/blueprint/packets/EllipticRegulators--ER.3.json`: stage ER.3, 4 nodes. Written by BP-EllipticRegulators--ER.3 (Codex, codex-XWL8DR; issue #6484) and accepted by REV-EllipticRegulators--ER.3 (Codex, codex-KHnHFo) on 6 October 2026, which corrected the relative projective-line bridge.
- `research/blueprint/packets/EllipticRegulators--ER.4.json`: stage ER.4, 11 nodes. Written by BP-EllipticRegulators--ER.4 (Codex, codex-FlFWqs; issue #6485, PR #6583) and accepted by REV-EllipticRegulators--ER.4 (Codex, codex-8wmDo2) on 6 October 2026, which strengthened the convergence node and added a unit test.
- `research/blueprint/packets/EllipticRegulators--ER.5.json`: stage ER.5, 10 nodes. Written by BP-EllipticRegulators--ER.5 (Codex, codex-0vAUOp; issue #6486) and accepted by REV-EllipticRegulators--ER.5 (Codex, codex-PVOz7e) on 6 October 2026, which corrected the opposite-kernel convention and replaced the AL.1 request by AL.1 node imports.
- `research/blueprint/packets/EllipticRegulators--ER.6.json`: stage ER.6, 11 nodes. Written by BP-EllipticRegulators--ER.6 (Codex, codex-YKJFCx; issue #6487, PR #6609) and accepted by REV-EllipticRegulators--ER.6 (Codex, codex-Hx77dG) on 6 October 2026, which promoted three API lemmas to nodes and added the request to ER.2.
- `research/blueprint/packets/EllipticRegulators--ER.7.json`: stage ER.7, 16 nodes. Written by BP-EllipticRegulators--ER.7 (Codex, codex-can3yS; issue #6488, PR #6622) and reviewed by REV-EllipticRegulators--ER.7 (Codex, codex-vQ7zPw) on 6 October 2026, which corrected ten nodes in place and found the pass mathematically complete. Its verdict is `needs_changes` for one reason only: the part's own reader lagged the corrected packet. This document is generated from the corrected packet.
- `research/blueprint/packets/EllipticRegulators--ER.8.json`: stage ER.8, 12 nodes. Written by BP-EllipticRegulators--ER.8 (Codex, codex-FK9WoX; issue #6489) and accepted by REV-EllipticRegulators--ER.8 (Codex, codex-DJhf3X) on 6 October 2026, which added two baseline bridges and confirmed source issues E28 and E29.

The document replaces the nine part documents. Several of their reviews asked that their part's document be brought in line with the corrected packet at assembly: the counts, API items and tests added in review, the dependencies, and, for ER.7, the corrected supplier requests and proof descriptions. Generating the node text from the corrected packets does this, and no part document's node text is reused. Where a part or its review asks for a change to a node of the parent packet, the node is printed as its packet has it and is followed by an **Assembly note**. These notes change no packet.

The suggested Lean file `research/blueprint/suggested/EllipticRegulators.lean` joins the nine parts' files. It is a proposal of names and signatures, not an implementation, and `implementationStatus` is `unchecked` for every node. Pins: Mathlib `082e2d3`, Tau Ceti `f790474`.

## Purpose and scope

This roadmap owns the archimedean and p-adic regulators of K₂ of elliptic curves, the explicit classes on which they are computed, and the special-value formulas that relate them to L(E, 2). Its principal complete theorem is Bloch's. For an elliptic curve E/ℚ with complex multiplication by the maximal order of an imaginary quadratic field of class number one, there is an explicit class U ∈ K₂(E) ⊗ ℚ, built from torsion points, with

L(2, χ^{Gross}) = π·Γ·R_q(U)/(i·y²·C⁴),  Γ = g·χ̂(ḡ),

and hence U ≠ 0. Every constant is explicit. The formula is the corrected form of Bloch's printed Theorem 11.2.1, which has a spurious factor |μ_κ| and, with its printed Fourier kernel, the opposite sign (source issues E7–E9). Around this theorem the roadmap develops the general modular case (Brunault's explicit theorem and Schappacher–Scholl's Beilinson theorem for modular curves and modular elliptic curves), the integral form of the Beilinson statement, and the good-reduction p-adic comparison.

- **ER.1, the analytic curve and its periods.** Oriented period bases, the normalised uniformisation, the parameter q, conjugation, and the real and all-embeddings conventions. The uniformisation itself is imported.
- **ER.2, Deligne cohomology and the symbol regulator.** The target H²_D(E_ℝ, ℝ(2)) of dimension [F : ℚ], Brunault's regulator on symbols, and its normalisation against Beilinson's, r_Beil = 2r_E.
- **ER.3, the elliptic dilogarithm and its companion.** D_q, J_q and J(q; ·), Bloch's R_q, the Steinberg relation by truncation, the Kronecker–Eisenstein expansion and Goncharov's function.
- **ER.4, the divisor formula and Bloch's classes.** The diamond convolution, r_E{f, g}(dz) = ½ conj(R_q((f) ⋄ (g))), the classes S_a and Theorem 10.2.1, the latter with a direct analytic proof.
- **ER.5, the complete CM example.** Bloch's Lecture 11 with its normalisation certificate and three worked curves.
- **ER.6, integral parts and the Beilinson statement.** The regulator on the integral part, the conjecture as a proposition in two equivalent forms, the three conclusions that must not be conflated, and integrality under potentially good reduction.
- **ER.7, general modular elliptic curves.** Brunault's explicit theorem and its consequences, and Schappacher–Scholl's rational structure, determinant formula and integrality, pushed to a modular elliptic curve.
- **ER.8, p-adic comparison and worked examples.** The elliptic specialisation of the syntomic regulator, the weight-two p-adic Beilinson conjecture as a statement, and four worked examples with full certificates.

The roadmap does not claim that any constructed class generates the integral part of K₂, and it does not prove Beilinson's conjecture for any curve beyond the statements of ER.5 and ER.7. Bloch's Conjecture 11.2.4 and the full rank statement of ER.6 are recorded as conjectures.

## Boundaries

The roadmap builds on other roadmaps and never re-plans what they own (PROTOCOL.md section 15). The boundaries below are those of the accepted restructurings RS-03, RS-06, RS-14 and RS-18, of the confirmed red-team findings RT-AREA-ktheory-2/5–/12 and /24 and RT-AREA-combinatorics/14, and of the two reviewed link maps that end in this roadmap.

### What this roadmap imports

| Supplier | What it supplies | Layers here |
|---|---|---|
| EllipticKTheory (*Elliptic curves, Part II: scheme K-theory and arithmetic symbol classes*, RS-18) | The curve as a scheme; the localisation sequence and restriction to the function field (E.3); pullback and pushforward (E.5); regular models, the integral part and vertical residues (E.6); Bloch's classes, symbol certificates, transfer and rational Galois descent (E.7); certified worked examples (E.8) | ER.1, ER.2, ER.4–ER.8 |
| Polylogarithms | The Bloch–Wigner function and the classical polylogarithms (P.1); η(f, g), the weight-two current, the Chow dilogarithm and the comparison with Beilinson's regulator (P.5) | ER.2–ER.4, ER.7, ER.8 |
| ModularCurvesPartII (*Modular curves, following Katz–Mazur, Part II*, RS-06) | The complex uniformisation (R12.1, owner under RS-06); modular curves with cusps, forms as differentials and rational models (R12.3, R12.5, R12.6); regular models (R13.5, R13.6); degeneracy and Hecke correspondences, bad-prime interfaces (R14.1, R14.6) | ER.1, ER.2, ER.7 |
| ComplexComparisonPartII | The de Rham–Betti comparison (C5, node `C5/repair-proper-de-rham-betti`) and the elliptic Hodge-line and integral-period computation (C6) | ER.1, ER.2 |
| MotivicEtaleKTheory | An early prefix of M.8: the real Deligne complex and the universal regulator, with no ER input. It does not exist yet and is recorded as a gap | ER.2, ER.6, ER.7 |
| ComplexMultiplicationAndExplicitReciprocity | The CM action and lattice (CM.1), the torsion Galois action (CM.2), the Grössencharakter with Deuring's comparison and conductor (CM.4) | ER.5, ER.8 |
| AdditiveCombinatorics | The finite-abelian character, inversion and Parseval interface (AC.0, owner under RS-03) | ER.4, ER.5 |
| SchemeKTheoryOperations | Proper transfer, base change and Cartan comparison (S.2), the Gersten residue complex (S.3), localisation (S.5), Adams weight projectors (S.6) | ER.6, ER.7 |
| KatoEulerSystems | Siegel units, cusp divisors and descent (L0, sole owner); an early pair-symbol interface (L1) | ER.7 |
| EllipticCurveModularity | The modular parametrisation (R29.5) and the continued L-function with its functional equation (R29.6) | ER.6, ER.7 |
| GL2AutomorphicRepresentationsAndTransfer, AutomorphicLFunctionsAndLocalFactors, PeriodsAndSpecialValues | Local test vectors and the modular tower (R16.2, R16.4); GL1 local factors (AL.1) and Rankin–Selberg (AL.3, through R16.5); Shimura–Blasius algebraicity (PS.1) | ER.5, ER.7 |
| ModularSymbolsPadicLFunctions, ColemanIntegration, PadicHodgeRegulators | Period lines, Birch's formula and p-adic L-functions (L1–L4); Coleman integration (L1); the syntomic and étale regulators (D.5, D.2) | ER.7, ER.8 |
| GrossZagierAndArithmeticHeights, NeronModelsAndSemistableAbelianVarieties, WeilConjectures, K2SymbolsBrauer | The Green kernel (GZ.2); the Néron differential and real period (R11.6); the Ramanujan bound (WC.5); Matsumoto's theorem, the tame symbol and the Milnor transfer (T.2–T.4) | ER.2–ER.4, ER.7 |
| Tau Ceti roadmaps (never re-planned) | AlgebraicTopology stages 5–6 (torus homology and intersection pairing); EllipticCurves layers 0–4 (places and divisors, the invariant differential, torsion and the Weil pairing, the Hasse bound, reduction over local fields); GlobalNumberFields layers 9–10 (Hecke and ray-class characters, infinity types); ModularForms layers 0, 7, 8 (nebentypus, L-functions, modular symbols); StableReduction layer 5; AlgebraicCurves layer 12; JacobianChallenge layer F; ArithmeticDirichletSeries (the ideal L-series carrier) | all |

**Owner decisions recorded for this roadmap.**
- **RS-06.** ModularCurvesPartII R12.1 owns the pointed complex uniformisation, the converse Weierstrass construction, homothety and the comparison of differentials, formerly planned in ER.1. ER.1 keeps the lattice-choice specialisation.
- **RS-03.** AdditiveCombinatorics AC.0 owns the arbitrary finite-abelian Fourier normalisation and comparison interface, formerly also in ER.4. ER.4 and ER.5 keep the torsion dual, the odd-function identities and the scale comparison.
- **RS-14.** The analytic inputs of ER.5 come directly from AL.1, GlobalNumberFields layers 9–10 and ModularForms layer 0, rather than through DirichletPadicLFunctions L0.
- **RS-18.** EllipticKTheory becomes *Elliptic curves, Part II*, and ER imports its suppliers' parts directly: K2SymbolsBrauer T.3, SchemeKTheoryOperations S.2, S.3 and S.5, KTheoryLowDegrees Z.6, and the Tau Ceti EllipticCurves, AlgebraicCurves, ModularCurves and StableReduction layers.
- **Red-team findings.**
  - RT-AREA-ktheory-2/7 and /24: generic Deligne theory belongs to an early M.8 prefix, and η(f, g) to P.5.
  - /8: C5 and C6 own the comparison and the elliptic period computation.
  - /5: CM.1 and CM.4 own the CM theory.
  - /6: KatoEulerSystems L0 owns modular units.
  - /9: R29.6 supplies the functional equation.
  - /10 and /11: ER.8 imports ER.5, E.6, Coleman L1 and the modular-symbol layers by node id.
  - RT-AREA-combinatorics/14: AC.0 owns the finite Fourier interface.

**Reviewed links.** Two reviewed links end here:
- Tau Ceti ArithmeticDirichletSeries layer 3 → ER.5: Euler-product nonvanishing in the absolutely convergent region.
- Tau Ceti EllipticCurves layer 1 → ER.1: the algebraic invariant differential, which does not supply the uniformisation or the periods.

No reviewed overlap names an ER layer.

### Who uses this roadmap

- **Atlas consumers.**
  - PeriodsAndSpecialValues PS.3 (regulator determinants and leading terms) uses ER.5. It consumes established CM and modular class formulas; no consumer receives from ER.5 a generation statement for all of K₂.
  - SpecialValuesBirchTate (higher special-value statements) uses ER.6 and the aggregation stage KU-ellipticreg.
- **Other packets.** No other packet cites a node or stage of this roadmap as a prerequisite or files a request with it. Supplier packets name ER nodes in their records of use: EllipticKTheory E.7 (ER.4, ER.5, ER.6, ER.8), PadicHodgeRegulators D.2 and D.5 (`ER.8/elliptic-syntomic-etale-factor`, `ER.8/good-reduction-elliptic-pairing`, `ER.8/the-syntomic-comparison`), KatoEulerSystems L0 (ER.7) and EllipticCurveModularity R29.5 (KU-modularparam).
- **PeriodsAndSpecialValues PS.0** must point its elliptic comparison-matrix test at the same C6 computation as ER.1 (the ER.1 part's restructure entry).

### Aggregation stages

The atlas carries six readiness checkpoints for this roadmap: KU-ellipticanalytic, KU-ellipticreg, KU-cmvalue, KU-modularparam, KU-modularreg and KU-ellipticpadic. They aggregate the layers ER.1–ER.8 and their suppliers, and they plan no mathematics of their own; no packet plans them.

## Conventions

These conventions are fixed across all nine parts. Where the parts or their sources differ, the dictionary is given.

**Periods and uniformisation (ER.1).**
- An oriented basis (γ1, γ2) of H_1(E(ℂ), ℤ) has Im(ω2/ω1) > 0, where ω_j = ∫_{γ_j} ω; equivalently ⟨γ1, γ2⟩ = +1 for the complex orientation. Mathlib's `PeriodPair` is not oriented, so the ER.1 part's `RegulatorPeriods` adds the condition.
- τ = ω2/ω1 lies in the upper half-plane, and q = e^{2πiτ} is Mathlib's `Function.Periodic.qParam 1 τ`.
- η : E(ℂ) ≅ ℂ/(ℤ + τℤ) is the normalised uniformisation, with η^*dz = ω/ω1.
- **Change of basis.** (a b; c d) ∈ SL₂(ℤ) sends the periods to (dω1 + cω2, bω1 + aω2), τ to (aτ + b)/(cτ + d) and η to η/(cτ + d).
- **Real case** (Brunault (1.40)). For E over ℝ, γ1 generates H_1^+(E(ℂ), ℤ) with the orientation of E(ℝ), 2 Re τ ∈ {0, 1}, and q is real with q > 0 exactly when E(ℝ) has two components.
- **Conjugate embeddings.** The bases (c_*γ1, −c_*γ2) give τ̄ = −conj(τ) and q̄ = conj(q). In multiplicative coordinates conjugation is x ↦ 1/conj(x).
- **Number fields.** Statements over a number field F are made at every embedding σ : F → ℂ (embeddings, not places). Each conjugation eigenspace of H_1 then has dimension r₁ + 2r₂ = [F : ℚ].

**Regulators (ER.2).**
- **The source's regulator.** r_E{f, g}(ω) = ∫_{E(ℂ)} log|f|·ω ∧ ∂̄ log|g| (Brunault (1.27)), with ∂̄ and not d^c; the two differ by a factor i/(4π).
- **η and η_B.** η(f, g) = log|f| d arg g − log|g| d arg f is Polylogarithms P.5's, and Brunault's η_B(f, g) = iη(f, g).
- **Beilinson's regulator.** In the wedge identification it is r_Beil(γ) = (ω ↦ ∫ η_B(γ) ∧ ω) = 2r_E(γ) (Brunault, Proposition 67).
- **Nekovář's pairing** J = W/(2πi) has J(ν)(ω₀) = r_E(ω₀)/(πi).
- **The target.** H²_D(E_ℝ, ℝ(2)) ≅ H¹(E(ℂ), ℝ(1))⁻, with ℝ(1) = 2πiℝ and the minus sign for the geometric c^*; it has dimension [F : ℚ]. For E/ℚ the coordinate is φ ↦ φ(ω₀)/i with ∫_{γ₊} ω₀ = 1, and reversing the orientation of E(ℝ) changes its sign.
- **Rational structure.** It is B = H¹(E(ℂ), ℚ(1))⁻, which the ER.6 part requests from ER.2.

**Dilogarithms (ER.3–ER.4).**
- D is the Bloch–Wigner function of Polylogarithms P.1, and D_q(x) = Σ_{n∈ℤ} D(xq^n).
- J(x) = log|x|·log|1 − x|. Bloch's companion J_q (written J^{Bl}_q in ER.4) converges without correction but is not q-invariant.
- J(q; x) = J_q(x) + (1/3) log²|q|·B₃(log|x|/log|q|) is Zagier's q-invariant regularisation.
- **R_q.** Throughout, R_q = J(q; ·) + iD_q is the q-invariant function. Bloch's unregularised R^{Bl}_q = J_q + iD_q appears only in `ER.4/bloch-lift-formula` and in the ER.4 part's raw identity, where it is written R_q^{Bl}. On permitted lifts of a pair of divisors the two agree.
- **Brunault's function.** Brunault's complex function satisfies 2R_ω(P, 0) = −conj(R_q(x)) for x = e^{2πiη(P)}.

**Lattice sums.**
- Brunault, Zagier and the ER.3 nodes write λ = m + nτ with the character χ_λ(P) = exp(2πi(mb − na)) for η(P) = a + bτ.
- Bloch's Lecture 10 and the ER.4 nodes write mτ + n against f(m, n).
- Lecture 11 and the ER.5 nodes write w = a + bτ ∈ O.
- Bloch's (m, n) is Brunault's (n, m).

**The diamond convolution and the divisor formula (ER.4).** (f) ⋄ (g) = Σ m_i n_j [Q_j − P_i] is the reflection of (f) times (g) in ℤ[E]. The divisor formula is r_E({f, g})(dz) = ½·conj(R_q((f) ⋄ (g))), for all f and g.

**Finite Fourier transforms (ER.4–ER.5).**
- **Lecture 10.** f̂(k, ℓ) = C⁻² Σ_{a,b} f(a, b)·e^{2πi(−ak+bℓ)/C}. This is AC.0's normalised coefficient for the character χ_{(k,ℓ)}(a, b) = e^{2πi(ak−bℓ)/C}.
- **Lecture 11, dual-first.** F̂(x) = H_F(x) = C⁻¹ Σ_y F(y)⟨x, y⟩, with ⟨a + bτ, k + ℓτ⟩ = e^{2πi(−aℓ+bk)/C}. With f₁₀(a, b) = F(b + aτ) one has H_F(k + ℓτ) = C·f̂₁₀(k, ℓ), at the same output coordinates.
- **The printed kernel.** The kernel printed in Bloch's (11.1.1) is the opposite one; for odd F it negates the transform (source issue E7).
- **The Gauss coefficient.** Γ = Γ_C(χ, g) = g·χ̂(ḡ) for the dual-first transform, and Γ_op = −Γ for the printed kernel.

**CM (ER.5, ER.8).**
- O = O_κ is the maximal order of an imaginary quadratic κ of class number one, E(ℂ) ≅ ℂ/ΩO, and χ^{Gross}((h)) = h̄·χ(h).
- The conductor satisfies f̄O = fO, an equality of ideals.
- C = fg ∈ ℤ, and W is the set of residues modulo C that are invertible modulo f.
- U = Σ_{x∈W/μ} S_{xχ̄(x)/C}.
- The ER.5 part writes ψ for χ^{Gross}, as a Tau Ceti `MultiplicativeIdealWeight`.

**L-functions and signs (ER.5–ER.7).**
- **The L-function.** L(E, s) is Mathlib's `WeierstrassCurve.LSeries` (the raw series, convergent for Re s > 3/2) wherever no continuation is needed.
- **The functional equation.** Λ(s) = N^{s/2}(2π)^{−ds}Γ(s)^d L(E, s), with Λ(s) = wΛ(2 − s), gives L*(E, 0) = w·N·(2π)^{−2d}·L(E, 2). In ER.6, w is the root number.
- **Root numbers in ER.7.** In Brunault's prime-level formulas the root number is ε(E), and his w(E) = −ε(E).
- **Modular forms.** ω_f = 2πi f(z) dz and r_N({u, v}, f) = ∫ log|u|·ω_f ∧ ∂̄ log|v|.
- **Petersson products.** Merel's ⟨f₁, f₂⟩ is linear in the first variable and divided by the congruence index. Tau Ceti's `UpperHalfPlane.peterssonInner` conjugates the first variable and has no index division, so ⟨f₁, f₂⟩_Merel = peterssonInner(2, D, f₂, f₁)/index.
- **The Schappacher–Scholl pairing.** Their (1/(2πi))∫ log|u|·conj(dlog v) ∧ ω and Brunault's ∫ η(u, v) ∧ ω are compared in the ER.7 part's gap G2.

**p-adic (ER.8).**
- Φ is the ℚ_p-linear, untwisted crystalline Frobenius, and γ a root of X² − a_p X + p.
- reg_syn = (1 − p^{−2}Φ)·log_BK reg_ét.
- The pairing factor is 1 − 1/(pγ), and the normalised scalar carries 1 − p/γ.
- For 11a3 the differential is ω0 = (dx/(2y + 1))/Ω^+.

**Notation in this document.**
- **Greek letters.** The ER.1 and ER.8 parts write Greek letters and operators in ASCII (omega, tau, gamma1, integral_, sum_, ->). Their prose is printed here in the notation of the other parts: ω, τ, γ1, ∫_, Σ_, →. The ER.2 part's subscripts (γ₊, ω₀) and the parent's plain digits (γ1, ω1) denote the same objects. Node ids, Lean names, code spans, locators and literal excerpts are untouched.
- **Single capitals.** In the parts' prose, Q, R, Z and C denote ℚ, ℝ, ℤ and ℂ, except that C is also Bloch's torsion level in ER.4, ER.5 and ER.8 (as in "C-torsion" and "C = fg").
- **K-theory.** K2 and K₂ are the same. K2T(E) is Bloch's group of EllipticKTheory E.7, and I(E) in the ER.6 part is the integral part K₂(E)_{ℤ,ℚ}.

## Sources

Every node cites its source passages with a locator and a literal excerpt. The packets use several ids for the same work; this table gathers them. For each id it gives the packet, the version read, its address, its SHA-256 where recorded, and the sections read.

### Bloch, *Higher Regulators, Algebraic K-Theory, and Zeta Functions of Elliptic Curves* (CRM Monograph Series 11, AMS 2000)

The parent packet read Lectures 8–11 from the programme's supplied scan (page images). The ER.4 and ER.5 parts read public transcriptions under the same id `Bloch.CRM11.public` but at different addresses (a Scribd digitisation and a dokumen.pub HTML copy). Both lose overlines, so the parts check the barred quantities algebraically and claim no page-image collation.

- `Bloch.CRM11` (parent packet); CRM Monograph Series 11, American Mathematical Society, 2000 (ISBN 0-8218-2114-8). Read from the programme's supplied scan SUP_Bloch_HigherRegulators_2000 (110 pages, image only; printed page = PDF page − 12), rendered at 110-150 dpi.; https://bookstore.ams.org/crmm-11; SHA-256 `9715a312ec4ebb9535daa24f3308bb5b97152211d747d55bf9f6c06bb221bd60`. Read: Lecture 8, §8.1 and Lemmas 8.2.1–8.2.4, printed pp. 61–67: R_q = J_q + iD_q, the unregularised J_q (8.1.4) with (8.1.5), Lemma 8.1.4 (independence of permitted lifts).; Lecture 9, printed pp. 69–74 (skimmed): the Steinberg relations for J_q and D_q by truncation.; Lecture 10 in full, printed pp. 75–85: Proposition 10.1.1, (10.1.2), (10.2.1), Theorem 10.2.1, Lemmas 10.2.2–10.2.3, (10.3.1), Propositions 10.3.1 and 10.3.3, Lemmas 10.3.2, 10.3.4, 10.3.5.; Lecture 11 in full, printed pp. 87–93: Lemmas 11.1.1–11.1.4, Corollaries 11.1.5–11.1.6, Lemma 11.1.7, (11.2.1)–(11.2.4), Theorem 11.2.1, Remark 11.2.2, Corollary 11.2.3, Conjecture 11.2.4.; Contents (printed p. vii).; Lecture 8, printed pp. 61–67 (PDF 73–79): (8.1.1)–(8.1.6), Lemma 8.1.1, Theorems 8.1.2 and 8.1.5, Lemmas 8.1.3 and 8.1.4, §8.2 with Lemmas 8.2.1–8.2.4.; Lecture 9, printed pp. 69–74 (PDF 81–86): Theorem 9.1.1 with Lemmas 9.1.2, 9.1.3, 9.1.5 and Sublemma 9.1.4; Theorem 9.2.1 with Lemmas 9.2.2 and 9.2.3.; Lecture 10, printed pp. 77–80 (PDF 89–92): Theorem 10.2.1, Lemmas 10.2.2 and 10.2.3, (10.3.1) and the opening of §10.3.; Read from page images rendered at 110 dpi with pdftoppm; no OCR.; 2026-09-30 REV-FIX-RT-AREA-combinatorics~2: selectively re-read printed pp.76,87,89,91 (PDF pp.88,99,101,103) in the supplied 110-page scan; SHA-256 unchanged. Checked both Fourier normalizations, pairing orientation and the input-only coordinate swap. Corrected a missing factor C in E7’s explanatory reason, without changing its source-error verdict..
- `Bloch.CRM11.public` (ER.4 part); CRM Monograph Series 11, AMS, 2000; public digitization text layer. Publisher PDF retrieval returned HTTP 403. No page-image verification or access to the parent worker’s private scan is claimed.; https://www.scribd.com/document/750143417/CRM-Monograph-Series-11-Spencer-J-Bloch-Higher-Regulators-Algebraic-K-Theory-and-Zeta-Functions-of-Elliptic-Curves-AMS-2000. Read: Lecture 10 §§10.2–10.3, printed pp.77–85: Lemmas 10.2.2–10.2.3, Propositions 10.3.1 and 10.3.3, Lemmas 10.3.2, 10.3.4–10.3.5.; Text layer loses overlines. The barred denominator and signs are independently reconstructed by the pointwise algebra and numerical checks in the reader..
- `Bloch.CRM11.public` (ER.5 part); CRM Monograph Series 11, AMS 2000; public HTML text-layer transcription containing AMS reprint page labels. Overlines and some glyphs are lost; no publisher PDF, page-image, licence or private-scan verification is claimed.; https://dokumen.pub/higher-regulators-algebraic-k-theory-and-zeta-functions-of-elliptic-curves-0821821148.html; SHA-256 `f6f64f09e412c623adccec9744c052df811a8fb420f0fb1e7d319237937abc75`. Read: Lecture11 §§11.1–11.2, printed pp.87–93, all lemmas, corollaries, construction and Theorem11.2.1.; The corrected overlines and kernel are inherited from the accepted parent and independently checked through exact coordinate algebra; OCR is not used to certify them..

### Brunault, *Étude de la valeur en s = 2 de la fonction L d'une courbe elliptique* (thesis, arXiv:math/0602186v1, 155 pp., appendix by Loïc Merel)

One file under three ids (SHA-256 8fd73faba5db…). Printed page = PDF page.

- `Brunault.These.2005` (parent packet); Doctoral thesis, Université Paris 7, 2005; arXiv:math/0602186v1, 155 pages (arXiv comment: '155 pages, PhD thesis, French, with an appendix by Loic Merel'). In French. The PDF page number equals the printed page number.; https://arxiv.org/abs/math/0602186v1; SHA-256 `8fd73faba5db08328c2884d9f35b79bc528145428766444f3eb8097f3b494fb7`. Read: The PDF (https://arxiv.org/pdf/math/0602186v1) and the e-print endpoint return the same file (the PDF itself); both hash to the recorded SHA-256.; Introduction §§0.1-0.7, pp. 7-14; page images of pp. 8-13 were rendered because the text layer drops overlines (ψ̄, χ̄).; §1.1, pp. 15-20 (Lemme 15, Définition 16, Proposition 17 and the Remarques on p. 19); §1.2 Remarque 20 (p. 22) and Proposition 26 (p. 26); §1.4, pp. 36-41 (Propositions 35-36, Corollaire 37).; §2.1-2.2, pp. 44-51 (as read by the author).; Chapter 3, §§3.1-3.7, pp. 73-121, in full (checker C), with page images of pp. 74-76, 78, 85, 88, 91, 94-95, 101, 103-106, 109, 116-120.; Appendix (L. Merel), pp. 143-146 (Théorème A statement, Corollaire, Corollaire 2) and pp. 154-155 (Théorème D and its proof).; NOT read: §§2.3-2.7, §§3.8-3.10, the rest of the appendix.; https://arxiv.org/pdf/math/0602186v1 and https://arxiv.org/e-print/math/0602186v1 return the same PDF (SHA-256 above); arXiv holds no TeX source for this submission.; Introduction §§0.1–0.7, pp. 7–14.; §1.1, pp. 15–20: Arakelov's Green function (Proposition 9), Goncharov's R_ω and R_X (Définitions 11, 14), Lemma 15 with (1.26), the regulator r_X (Définition 16), Proposition 17, Remarks 1–4 (including 'à un facteur près').; §1.2, pp. 20–28: translation invariance (Proposition 18), the elliptic dilogarithm (Définition 19, (1.38)–(1.42), Remarque 20), the Fourier expansions (Théorème 21, Propositions 22 and 24, Remarques 23 and 25), Proposition 26 with (1.63)–(1.64), Proposition 28.; §1.3, from p. 28: Théorème 29 with (1.69)–(1.70) (the rest of §§1.3–1.4, pp. 28–41, as the author read it).; §§2.1–2.3, pp. 44–61 (as the author read them; Théorème 6 of the introduction is §2.3).; §2.5–§2.6, pp. 63–70: Deligne cohomology recalled from Schneider [65] and Nekovář [52] (Lemmas 61, 62), the form η(F, G) (Définition 63, (2.107)–(2.112)), r̂ (Définition 65, Proposition 66), Proposition 67 (Beilinson's regulator is r̂ ∘ η^*) and Théorème 68 with its proof.; The text layer loses bars and accents; ∂ versus ∂̄ was read from page images (pp. 19, 20, 28, 66, 70)..
- `Brunault.These.2005` (ER.1 part); Doctoral thesis, Université Paris 7, 2005; arXiv:math/0602186v1; PDF page numbers equal printed page numbers.; https://arxiv.org/pdf/math/0602186v1; SHA-256 `8fd73faba5db08328c2884d9f35b79bc528145428766444f3eb8097f3b494fb7`. Read: Section 1.2, pp.20–27: (1.36)–(1.48), Remarque 20, Proposition 26; page 22 checked visually for orientations and integrals..
- `Brunault.These.2005` (ER.2 part); Doctoral thesis, 2005; arXiv:math/0602186v1. PDF and printed page numbers agree.; https://arxiv.org/pdf/math/0602186v1; SHA-256 `8fd73faba5db08328c2884d9f35b79bc528145428766444f3eb8097f3b494fb7`. Read: §1.1 pp.19–20: Lemma 15, Definition 16, Proposition 17 and remarks.; §1.2 p.26: Proposition 26 and normalised differential.; §§2.5–2.6 pp.63–70: Lemmas 61–62, Definition 63, Proposition 67 and proof of Theorem 68. Page images 64–66 and 68 checked for conjugation and signs..
- `Brunault.These.2005` (ER.3 part); Thèse, 2005; arXiv:math/0602186v1; https://arxiv.org/pdf/math/0602186v1; SHA-256 `8fd73faba5db08328c2884d9f35b79bc528145428766444f3eb8097f3b494fb7`. Read: §1.1, pp. 15–20, Green function and regulator pairing; §1.2, pp. 20–28, Definitions 19–20, Theorem 21, Propositions 22, 24 and 26, Remarks 23 and 25.
- `Brunault.These.2005.public` (ER.4 part); Thesis, Paris 7, 2005; arXiv math/0602186v1, French, 155 pages.; https://arxiv.org/pdf/math/0602186v1; SHA-256 `8fd73faba5db08328c2884d9f35b79bc528145428766444f3eb8097f3b494fb7`. Read: §1.2, pp.20–28: Definitions 19, Remark 20, Theorem 21, Propositions 22,24,26 and their proofs. In particular Theorem 21 obtains its torsion expansion from Bloch 10.2.1, so it is not an input to the new direct proof..
- `Brunault.These.2005.public` (ER.5 part); Paris 7 thesis, 2005; arXiv math/0602186v1.; https://arxiv.org/pdf/math/0602186v1; SHA-256 `8fd73faba5db08328c2884d9f35b79bc528145428766444f3eb8097f3b494fb7`. Read: Introduction §0.5, printed p.11, CM scope; §1.2, Theorem21 and neighboring normalization discussion, pp.20–28.; Theorem21 invokes Bloch10.2.1 and is not an independent premise for the direct ER.4 analytic identity..
- `Brunault.2005` (ER.7 part); arXiv:math/0602186v1, 155 pages; appendix printed and PDF pp.143–155; https://arxiv.org/pdf/math/0602186v1; SHA-256 `8fd73faba5db08328c2884d9f35b79bc528145428766444f3eb8097f3b494fb7`. Read: Merel appendix pp.143–155 in full: definitions, Theorem A, Corollary 2, formulaire §2, Proposition B, Mellin calculation §3, Petersson Theorem C and proof, Theorem D and proof.; Brunault chapter 3 is inherited from the accepted packet; the present pass uses that packet’s declaration statements rather than claiming a new complete reading of chapter 3..

### Brunault, *Valeur en 2 de fonctions L de formes modulaires de poids 2 : théorème de Beilinson explicite* (Bull. SMF 135, 2007)

The version of record of Théorèmes 4–5.

- `Brunault.BSMF.2007` (parent packet); Bull. Soc. Math. France 135 (2007), no. 2, 215-246 (version of record of Théorèmes 4 and 5 of the thesis).; http://www.numdam.org/item/BSMF_2007__135_2_215_0/; SHA-256 `58f538cb38704615de15dee95a688dd576cd44513c118a41e434bde7e3a21b73`. Read: Introduction, pp. 215-218: the regulator (2)-(4), the units (5), Théorème 1.1, Remarque 1.2, Théorème 1.4. Fetched from numdam on 2026-09-25..
- `Brunault.2007` (ER.7 part); Bull. Soc. Math. France 135 (2007), 215–246; version of record; https://www.numdam.org/item/10.24033/bsmf.2532.pdf; SHA-256 `58f538cb38704615de15dee95a688dd576cd44513c118a41e434bde7e3a21b73`. Read: Introduction pp.215–218: regulator conventions, Theorem 1.1, Remark 1.2, Question 1.3, Theorem 1.4. Bars lost in extracted text are read using the inherited corrected statement..

### Brunault, *Regulators of Siegel units and applications* (J. Number Theory 2016; arXiv:1504.08127v1)

- `Brunault.SiegelUnits.2016` (parent packet); arXiv:1504.08127v1; published in J. Number Theory 163 (2016), 542-569.; https://arxiv.org/abs/1504.08127v1; SHA-256 `0bf0a79609289639dc0fd557d90126db975246b9829489c17c6c9feb73be0031`. Read: §5.1, pp. 12-13 (Theorems 23-24: conductors 14, 35, 54). Fetched 2026-09-25..

### Brunault, *Régulateurs p-adiques explicites pour le K₂ des courbes elliptiques* (Publ. math. Besançon 2010)

- `Br2010` (ER.8 part); Publications mathématiques de Besançon (2010), 29–57, DOI 10.5802/pmb.a-125; https://pmb.centre-mersenne.org/item/10.5802/pmb.a-125.pdf; SHA-256 `c266dc60fec34b877e131dede67ba64d29f1a875396198f4aa28a31d27859d30`. Read: Introduction; §1; §3 Remark 3.1; §9, including Théorème 9.4 (115).

### Zagier, *The Bloch–Wigner–Ramakrishnan polylogarithm function* (Math. Ann. 286, 1990)

Author-hosted typeset scan.

- `Zagier.BWR.1990` (parent packet); Math. Ann. 286 (1990), 613–624; the author's scanned copy on his MPIM page, fetched 2026-09-25.; https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01453591/fulltext.pdf; SHA-256 `e56ae90511b60119c1276293e1d6cf342be8764543dfa4de7333c2fba67193bf`. Read: p. 613: the definition of D.; §2, pp. 615–616: D(q; x), the regularised J(q; x), and the displayed Kronecker-series formula for D(q; x) − iJ(q; x) (whose sign is source issue EllipticRegulators/E6)..
- `Zagier.BWR.1990` (ER.3 part); Math. Ann. 286 (1990), 613–624; author-hosted typeset scan, DOI 10.1007/BF01453591; https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01453591/fulltext.pdf; SHA-256 `e56ae90511b60119c1276293e1d6cf342be8764543dfa4de7333c2fba67193bf`. Read: §1, pp. 613–615, weight two and inversion; §2, pp. 615–620, including image inspection of pp. 616–619; the proof of Theorem 1 is used as a method, not as an unchecked formula.

### Dokchitser, de Jeu and Zagier, *Numerical verification of Beilinson's conjecture for K₂ of hyperelliptic curves* (arXiv:math/0405040v2, 4 May 2005; Compositio 2006)

One file under two ids (SHA-256 a9d5c2cce63f…): the arXiv v2 preprint, not the journal version.

- `DJZ.2006` (parent packet); arXiv:math/0405040v2 (4 May 2005); published in Compositio Math. 142 (2006). The arXiv v2 PDF was read.; https://arxiv.org/pdf/math/0405040v2; SHA-256 `a9d5c2cce63f2351991789add5ac9cd213b9783b9cbb0e648313e314eadb3ccf`. Read: §3, pp. 4–7: the integral subgroup K2(C; Z), Conjecture 3.11, Remark 3.12, footnote 3, the Bloch–Grayson counterexample to the unrestricted version.; §8, pp. 22–24: the vertical (integrality) condition and Theorem 8.3 with Remark 8.4..
- `DJZ.2005v2` (ER.1 part); arXiv:math/0405040v2, 4 May 2005; this preprint, not the published Compositio version, was inspected.; https://arxiv.org/pdf/math/0405040v2; SHA-256 `a9d5c2cce63f2351991789add5ac9cd213b9783b9cbb0e648313e314eadb3ccf`. Read: Section 3, equations (3.3)–(3.4) and Remark 3.14: real anti-invariant homology and the disjoint union over all number-field embeddings..
- `DJZ.2006` (ER.6 part); arXiv:math/0405040v2 (4 May 2005); preprint version read; journal publication 2006; https://arxiv.org/pdf/math/0405040v2; SHA-256 `a9d5c2cce63f2351991789add5ac9cd213b9783b9cbb0e648313e314eadb3ccf`. Read: §2, pp. 3–4: completion, functional equation and leading coefficient; §3, pp. 4–7: horizontal and vertical tame kernels, Conjecture 3.11, Remarks 3.12–3.14; §8, pp. 22–24: Theorem 8.3 and its proof.

### Schneider, *Introduction to the Beilinson conjectures* (1988)

- `Schneider.1988` (ER.2 part); Beilinson’s Conjectures on Special Values of L-Functions, Perspectives in Mathematics 4, Academic Press, 1988, pp.1–35; scanned published chapter, PDF page equals printed page.; https://ncatlab.org/nlab/files/SchneiderBeilinsonConjectures.pdf; SHA-256 `9693e4a34e8aa8d6c92899b2ba2ce9735615de4758d536d8dc25d9b20f9ea88b`. Read: §2 pp.7–10: Deligne complex, de Rham conjugation and exact sequence.; §3 pp.11–13: absolute cohomology comparison.; §4 pp.24–30: higher Chern classes, product sign and Chern character; image p.28 inspected..

### Nekovář, *Beilinson's conjectures* (author copy)

Source issues E24–E27 (ER.2 part) concern this author copy only.

- `Nekovar.AuthorCopy` (ER.2 part); Author copy, 33 PDF pages with local pagination, of the article published in Motives, Proc. Sympos. Pure Math.55 Part1, AMS1994, pp.537–570. This is not the publisher’s version of record.; https://math.stanford.edu/~conrad/BSDseminar/refs/BeilinsonintroII.pdf; SHA-256 `3b6ba59cb8338b59fd8206318b2a91c3588ca09545522d6fb33717287924eacd`. Read: §§7.1–7.5 pp.21–24: Deligne complexes, projection π₁, cup product (7.3.2), regulator of units and elliptic pairing. Image p.24 checked; use the corrected formulas recorded in sourceIssues..

### Goncharov, *Polylogarithms, regulators, and Arakelov motivic complexes* (arXiv:math/0207036v3)

- `Goncharov.Arakelov.2004` (ER.3 part); arXiv:math/0207036v3, 17 June 2004; https://arxiv.org/pdf/math/0207036; SHA-256 `ac729924bca286113e8aae593f6012bf72c77d935178606e7a2be677bd3440db`. Read: §3, Theorem 3.4 and proof, pp. 28–29, invariance under multiplying an entry by a constant; §6, Proposition 6.8 and Lemma 6.9 with proof, pp. 56–58; read using Polylogarithms/E11 and E12 corrections.

### Schappacher and Scholl, *Beilinson's theorem on modular curves* (Perspectives in Math. 4, 1988)

Author retypeset copy under two ids; the ER.7 part also inspected a scan with the published pagination for its source issue.

- `SchappacherScholl.1988` (ER.6 part); Author-hosted retypesetting of the chapter in Beilinson’s Conjectures on Special Values of L-functions, Perspectives in Mathematics 4 (1988), pp. 273–304; pagination cited from retypesetting; https://www.dpmms.cam.ac.uk/~ajs1005/preprints/RSS.pdf; SHA-256 `7c97475e330cd67c0de474e1d12096cec262f6ca1f045fe5d1e74b1dbfe8a10e`. Read: §§0–1.2.3, pp. 1–5: Q-structures, determinant theorem and limits of its conclusions; §§7.0–7.4, pp. 17–20: integral elements and correction to integral Manin–Drinfeld.
- `SS.1988` (ER.7 part); 1988, pp.273–304; author retypeset copy dated 2010, 21 pages. Published-pagination mirror separately compared; locators below use numbered sections.; https://www.dpmms.cam.ac.uk/~ajs1005/preprints/RSS.pdf; SHA-256 `7c97475e330cd67c0de474e1d12096cec262f6ca1f045fe5d1e74b1dbfe8a10e`. Read: Entire author copy §§1–7 and bibliography; especially 1.1.1–1.3.2, 3.4.0, 4.5, 5.1, 6.1 and 7.1–7.4.; Published-pagination copy https://ncatlab.org/nlab/files/SchappacherScholl.pdf, SHA256 604efee0cc32f3a06e7915a3bd3f00cb7d2d218274f2d835ca93d6aa6964663e: pp.275–280, 284–289, 294–302. Page image of 3.1.8 checked in both copies..

### Scholl, *Integral elements in K-theory and products of modular curves* (2000) and *Integral elements of K-theory and products of modular curves II* (arXiv:0710.5453v1)

- `Scholl.Integral.I` (ER.6 part); Author-hosted version; in The Arithmetic and Geometry of Algebraic Cycles, NATO Science Series C 548 (2000), pp. 467–489; citations use PDF pagination; https://www.dpmms.cam.ac.uk/~ajs1005/preprints/k1.pdf; SHA-256 `7bffc95825735b551d93cf8074dba61d28131c3b6302bf855fd1f0e38349a9e6`. Read: Introduction and §1 in full, PDF pp. 1–9: Theorem 1.1.6, graded integral image, Corollary 1.3.4 and Proposition 1.3.6.
- `Scholl.Integral.II` (ER.6 part); arXiv:0710.5453v1 (29 October 2007); this preprint was read, not the later version of record; https://arxiv.org/pdf/0710.5453v1; SHA-256 `7e002d151756713aee2080185b91600c643af2c6e39fbe30e4874ea28ac0c3eb`. Read: §1, PDF pp. 1–4: motivic integrality versus ℓ-adic unramifiedness; §2, PDF pp. 4–5 through diagram (3): localisation and finite-extension reflection.

### Deninger and Scholl, *The Beilinson conjectures* (1991)

- `DS.1991` (ER.7 part); 1991 survey; author public preprint, section locators; https://www.dpmms.cam.ac.uk/~ajs1005/preprints/d-s.pdf; SHA-256 `f4a31e86abb2e80a1b3a07a6158fa19ff4f8110a75c7db491890877b12dfcb27`. Read: (1.3)(1),(6): proper functoriality and finite Galois descent.; (2.6)–(2.8): regulator functoriality and construction of cycle maps with supports; degrees and weights checked..

### Siegel, *Lectures on advanced analytic number theory* (Tata, notes by S. Raghavan)

- `Siegel.1965` (ER.7 part); Tata Institute lecture notes 23 (1965), reprint hosted by P. Garrett. Reprint pagination differs from the edition inherited by the original packet.; https://www-users.cse.umn.edu/~garrett/m/mfms/notes_2013-14/Siegel_AdvAnNoTh.pdf; SHA-256 `97db8ec4f8477bea009f9264d17dfd4b76e9d6bd529c31316df4a07499f88643`. Read: §1 Theorem 1 and proof, first Kronecker limit formula; §3 Theorem 2 and complete proof, second limit formula.; §5 Theorem 3 and its Mellin/Poisson proof. Use theorem/section locators rather than inherited pp.17,40,69..

### Shimura, *On the periods of modular forms* (Math. Ann. 229, 1977)

Page images through the linked IIIF manifest.

- `Shimura.1977` (ER.7 part); Mathematische Annalen 229 (1977), 211–221, DOI 10.1007/BF01391466. Göttingen GDZ page scans, pp.211–214 read. SHA256 below identifies the volume IIIF manifest, not an article PDF.; https://gdz.sub.uni-goettingen.de/dms/resolveppn/?PPN=GDZPPN002314584; SHA-256 `9527f45f13c9a0fd66ec49fd8b1b252bceaa3a129c6ddf19e07ab30fc978a132`. Read: pp.211–214: Theorem 1 period algebraicity; Lemma 1 modular-symbol generators; Theorem 2, complete Fourier/period contradiction argument; the following two-prime even-character remark.; Manifest: https://manifests.sub.uni-goettingen.de/iiif/presentation/PPN235181684_0229/manifest?version=29486bf2; article scans are volume sequence positions 217–220. Theorem 1 and Lemma 1 invoke the earlier 1976 paper, whose proofs were not read here..

### Asakura and Chida, *A numerical approach toward the p-adic Beilinson conjecture for elliptic curves over ℚ*

Preprint v2, the accepted manuscript, and the publisher's page (of which only the public preview was read).

- `AC2020` (ER.8 part); arXiv:2003.08888v2, 8 September 2020; https://arxiv.org/pdf/2003.08888v2; SHA-256 `5120eb167b7f02662a6540dd4e2dd7af420f95a16e32bbc3ee278afadf543fec`. Read: §2.2 Theorems 2.2–2.3; §2.3 critical slope; §3.3–3.4, especially Conjecture 3.3; §4.7 algorithm interface; §5.2 Legendre example interface.
- `AC2023AM` (ER.8 part); Author accepted manuscript deposited in HUSCAP; published 2023, Research in the Mathematical Sciences 10:11; https://eprints.lib.hokudai.ac.jp/repo/huscap/all/91491/Perrin-Riou-conj-v1.pdf; SHA-256 `c0b23ae71a8006b9bd3ce2e7529fb1cb668c9f549e188e89e5d44bd876e69043`. Read: §2.2 Theorems 2.2–2.3; §3.4 Conjecture 3.3 and normalisations; §6 footnote 10.
- `AC2023VOR` (ER.8 part); Published version, Research in the Mathematical Sciences 10:11 (2023), DOI 10.1007/s40687-023-00374-2; https://link.springer.com/article/10.1007/s40687-023-00374-2. Read: Public publisher preview: introduction and footnote 10; body not available in the preview.

### Besser and de Jeu, *The syntomic regulator for K₄ of curves* (arXiv:1208.0516v1)

Only its K₂ restatement (Remark 1.10) is used.

- `BdJ2012` (ER.8 part); arXiv:1208.0516v1, 2 August 2012; https://arxiv.org/pdf/1208.0516v1; SHA-256 `a8e2e7aa541ab5ce6b4d04d8a04bbdc6995db8eec31f4a8704f2e4cf904621c2`. Read: Introduction pp. 1–4: constant-term divisor evaluation; Remark 1.10 (K2 only).

### The reviewed parent packet, and Mathlib's division polynomials

The ER.8 part cites them as sources of its imported targets and of the ψ recurrence.

- `ERparent` (ER.8 part); Accepted parent packet at the input of BP-EllipticRegulators--ER.8; https://github.com/CBirkbeck/tauceti-explorer/blob/main/research/blueprint/packets/EllipticRegulators.json. Read: ER.4 divisor and transfer formulas; ER.5 CM setup, class U, corrected scalar; ER.8 all six nodes; source issues E7–E9.
- `MathlibDivision` (ER.8 part); Mathlib pinned 082e2d37e8b0463410cdb532e111cd43d5a66174; https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/EllipticCurve/DivisionPolynomial/Basic.lean. Read: Definitions Ψ and preΨ, recurrences preΨ_even and preΨ_odd.

**Versions read.** Each packet records in `sourceVersions` the exact texts it read, with dates and hashes. A finding that quotes a stated result is scoped to the version named there (PROTOCOL.md section 18).

## What the pinned libraries have

The nine packets cite 120 declarations of the pinned libraries, each read at Mathlib `082e2d3` or Tau Ceti `f790474` by the review of the packet that cites it. Where two packets describe the same declaration, the first description is given. Tau Ceti declarations are inputs; the suggested Lean file names them but does not import their modules, because the shared build has no Tau Ceti object files.

| Declaration | Kind | Module | What it provides | Cited by |
|---|---|---|---|---|
| `mathlib:AddChar.complexBasis` | definition | `Mathlib/Analysis/Fourier/FiniteAbelian/PontryaginDuality.lean` | Complex characters form a basis of functions on a finite abelian group; use its coefficient map, not a new character theory. | parent |
| `mathlib:AddChar.sum_apply_eq_ite` | theorem | `Mathlib/Analysis/Fourier/FiniteAbelian/PontryaginDuality.lean` | Sum over complex additive characters equals card G at zero and zero elsewhere. | parent |
| `mathlib:AddChar.wInner_cWeight_eq_boole` | theorem | `Mathlib/Analysis/Fourier/FiniteAbelian/Orthogonality.lean` | Characters are orthonormal for the normalized counting inner product. | parent |
| `mathlib:AddMonoidAlgebra` | structure | `Mathlib/Algebra/MonoidAlgebra/Defs.lean` | The group ring ℤ[A] with its convolution product (line 64); single_mul_single (line 547, to_additive) evaluates the product on generators. | parent |
| `mathlib:AnalyticAt.analyticOrderAt_eq_natCast` | lemma | `Mathlib/Analysis/Analytic/Order.lean` | Order n iff f(z)=(z-z0)^n g(z) locally for analytic g with g(z0) nonzero. | ER.6 |
| `mathlib:analyticOrderAt` | def | `Mathlib/Analysis/Analytic/Order.lean` | Order of a one-variable analytic function, valued in the extended naturals. | ER.6 |
| `mathlib:bernoulliFourierCoeff_eq` | theorem | `Mathlib/NumberTheory/ZetaValues.lean` | For k≠0, the normalized coefficient of the Bernoulli polynomial on [0,1] is −k!/(2πin)^k. At k=3 this is −6/(2πin)^3; the coefficient at n=0 is zero with the library division convention. | ER.3 |
| `mathlib:Complex.cot_pi_eq_exp_ratio` | lemma | `Mathlib/Analysis/SpecialFunctions/Trigonometric/Cotangent.lean` | cot(πz)=(exp(2πiz)+1)/(i(1−exp(2πiz))); rearrange for Im z>0 to 1/(1−exp(2πiz))=(1+i cot(πz))/2. | ER.4 |
| `mathlib:Complex.exp` | irreducible_def | `Mathlib/Analysis/Complex/Exponential.lean` | The exponential, which turns the additive presentation into the multiplicative one. | parent, ER.3 |
| `mathlib:Complex.Gamma_add_one` | theorem | `Mathlib/Analysis/SpecialFunctions/Gamma/Basic.lean` | Gamma(s+1)=s Gamma(s) when s is nonzero; at s=1 gives Gamma(2)=1. | ER.6 |
| `mathlib:Complex.Gamma_one` | theorem | `Mathlib/Analysis/SpecialFunctions/Gamma/Basic.lean` | Gamma(1)=1. | ER.6 |
| `mathlib:Complex.hasSum_taylorSeries_neg_log` | lemma | `Mathlib/Analysis/SpecialFunctions/Complex/LogBounds.lean` | For ‖z‖<1, HasSum (z^n/n) (−log(1−z)); n=0 term is zero. Principal branch; not a unit-circle assertion. | ER.4 |
| `mathlib:Complex.imCLM` | def | `Mathlib/Analysis/Complex/Basic.lean` | The real continuous linear imaginary-part map; on the imaginary axis it agrees with division by i followed by the real part. | ER.2 |
| `mathlib:Complex.log` | def | `Mathlib/Analysis/SpecialFunctions/Complex/Log.lean` | The principal complex logarithm, used for the bounds \|log(1 − z)\| ≤ 2\|z\| near 0. | parent, ER.3 |
| `mathlib:Complex.tendsto_self_mul_Gamma_nhds_zero` | theorem | `Mathlib/Analysis/SpecialFunctions/Gamma/Deriv.lean` | s Gamma(s) tends to 1 on the punctured complex neighbourhood of zero. | ER.6 |
| `mathlib:CongruenceSubgroup.Gamma1` | def | `Mathlib/NumberTheory/ModularForms/CongruenceSubgroups.lean` | Γ1(N) ⊂ SL2(Z): bottom row ≡ (0, 1) and top-left entry ≡ 1 mod N (Gamma1_mem), Brunault's (3.2). | parent |
| `mathlib:cot_series_rep` | theorem | `Mathlib/Analysis/SpecialFunctions/Trigonometric/Cotangent.lean` | For x outside the integers, π cot(πx)=1/x+Σ_{n:ℕ+}(1/(x−n)+1/(x+n)); paired summation, never an absolutely convergent unprojected bilateral sum. | ER.4, ER.5 |
| `mathlib:DirichletCharacter.IsPrimitive` | def | `Mathlib/NumberTheory/DirichletCharacter/Basic.lean` | Primitivity of a Dirichlet character (conductor = level), the hypothesis of Théorème 4. | parent, ER.7 |
| `mathlib:DirichletCharacter.LFunction` | def | `Mathlib/NumberTheory/LSeries/DirichletContinuation.lean` | L(χ, s), equal to the Dirichlet series for Re s > 1 (LFunction_eq_LSeries); L(χ, 2) in Proposition 80 and Théorème 8. | parent, ER.7 |
| `mathlib:EisensteinSeries.summable_one_div_norm_rpow` | lemma | `Mathlib/NumberTheory/ModularForms/EisensteinSeries/Summable.lean` | For real k>2, Σ_{v:Fin 2→ℤ}‖v‖^(−k) summable; k=3 and an invertible real coordinate map bound the full Kronecker kernel. | ER.4 |
| `mathlib:EulerProduct.exp_tsum_primes_log_eq_tsum` | theorem | `Mathlib/NumberTheory/EulerProduct/ExpLog.lean` | exp(Σ_p −log(1 − f p)) = Σ_n f n for completely multiplicative f on ℕ with summable norms (line 40): the model for the non-vanishing of an absolutely convergent Euler product; ER.5 needs its analogue over ideals. | parent |
| `mathlib:fourierBasis_repr` | theorem | `Mathlib/Analysis/Fourier/AddCircle.lean` | The coordinates in the integer-indexed Hilbert basis of L² of the circle are its Fourier coefficients. Injectivity is supplied by the Hilbert-basis isometry; apply successively in the two circle variables. | ER.3 |
| `mathlib:fourierCoeff` | def | `Mathlib/Analysis/Fourier/AddCircle.lean` | Fourier coefficient defined with the negative character against normalized Haar measure. | ER.3 |
| `mathlib:fourierCoeff_eq_intervalIntegral` | theorem | `Mathlib/Analysis/Fourier/AddCircle.lean` | For positive period T, coefficients equal (1/T) times the interval integral on any interval of length T. Here T=1. | ER.3 |
| `mathlib:FreeAbelianGroup` | def | `Mathlib/GroupTheory/FreeAbelianGroup.lean` | The additive free abelian group on pairs of function-field units, before the symbol quotient. | ER.8 |
| `mathlib:FreeAbelianGroup.lift` | def | `Mathlib/GroupTheory/FreeAbelianGroup.lean` | Extends a generator evaluation uniquely to an additive homomorphism. | ER.8 |
| `mathlib:FreeAbelianGroup.of` | def | `Mathlib/GroupTheory/FreeAbelianGroup.lean` | A formal symbol generator. | ER.8 |
| `mathlib:Function.Periodic.norm_qParam` | theorem | `Mathlib/Analysis/Complex/Periodic.lean` | ‖qParam h z‖ = exp(−2π Im z / h). | parent, ER.1, ER.4, ER.7 |
| `mathlib:Function.Periodic.norm_qParam_lt_one` | theorem | `Mathlib/Analysis/Complex/Periodic.lean` | For h>0 and Im(z)>0 the norm of qParam h z is less than one. | ER.1 |
| `mathlib:Function.Periodic.qParam` | def | `Mathlib/Analysis/Complex/Periodic.lean` | qParam h z = exp(2πiz/h); with h = 1 this is q = exp(2πiτ). | parent, ER.1, ER.4, ER.7 |
| `mathlib:Function.Periodic.qParam_ne_zero` | lemma | `Mathlib/Analysis/Complex/Periodic.lean` | qParam h z ≠ 0. | parent, ER.1 |
| `mathlib:gaussSum` | def | `Mathlib/NumberTheory/GaussSum.lean` | gaussSum χ ψ = Σ_a χ(a)ψ(a); with ψ = ZMod.stdAddChar this is Brunault's τ(χ) = Σ χ(v)e^{2πiv/N}. | parent |
| `mathlib:hasSum_coe_mul_geometric_of_norm_lt_one` | theorem | `Mathlib/Analysis/SpecificLimits/Normed.lean` | For ‖r‖<1, Σ n r^n = r/(1−r)^2. This already supplies Bloch Lemma 10.3.2. | ER.4 |
| `mathlib:hasSum_one_div_nat_pow_mul_sin` | theorem | `Mathlib/NumberTheory/ZetaValues.lean` | For k≠0 and x∈[0,1], Σ n^(−2k−1) sin(2πnx)= (−1)^(k+1)(2π)^(2k+1)/(2(2k+1)!) B_{2k+1}(x); k=1 supplies B3 Fourier series. | ER.4 |
| `mathlib:iteratedDerivWithin_cot_pi_mul_eq_mul_tsum_div_pow` | theorem | `Mathlib/Analysis/SpecialFunctions/Trigonometric/Cotangent.lean` | For k≥1 and Im z>0, kth derivative within the upper half-plane of π cot(πz) is (−1)^k k! Σ_{n:ℤ}1/(z+n)^(k+1). k=1 yields the csc-squared identity by differentiation. | ER.4 |
| `mathlib:LinearMap.BilinForm.smul_left` | theorem | `Mathlib/LinearAlgebra/BilinearForm/Basic.lean` | B(cu,v)=c B(u,v) for an R-bilinear form. | ER.8 |
| `mathlib:LinearMap.BilinForm.smul_right` | theorem | `Mathlib/LinearAlgebra/BilinearForm/Basic.lean` | B(u,cv)=c B(u,v); used to cancel eigenvector scaling. | ER.8 |
| `mathlib:Matrix.det` | def | `Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean` | Signed determinant of a finite square matrix over a commutative ring. | ER.6 |
| `mathlib:Matrix.det_fin_one` | theorem | `Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean` | The Fin 1 determinant is its sole entry. | ER.6 |
| `mathlib:Matrix.det_fin_two` | theorem | `Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean` | The Fin 2 determinant is a*d-b*c. | ER.6 |
| `mathlib:Matrix.det_fin_zero` | theorem | `Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean` | The empty determinant equals 1. | ER.6 |
| `mathlib:Matrix.det_mul` | theorem | `Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean` | det(MN)=det(M)det(N) for finite square matrices. | ER.6 |
| `mathlib:Matrix.isUnit_iff_isUnit_det` | theorem | `Mathlib/LinearAlgebra/Matrix/NonsingularInverse.lean` | A finite square matrix is a unit iff its determinant is a unit; over R this tests invertibility by nonzero determinant. | ER.6 |
| `mathlib:Matrix.SpecialLinearGroup` | def | `Mathlib/LinearAlgebra/Matrix/SpecialLinearGroup.lean` | Integral two-by-two determinant-one matrices with their existing group structure. | ER.1 |
| `mathlib:MeasureTheory.integral_tsum_of_summable_integral_norm` | lemma | `Mathlib/MeasureTheory/Integral/DominatedConvergence.lean` | An integral and a countable sum commute if every summand is integrable and the sum of the integrals of its norm is finite. Both requirements are checked explicitly in the coefficient calculation and reconstruction. | ER.3 |
| `mathlib:ModularForm.eta` | def | `Mathlib/NumberTheory/ModularForms/DedekindEta.lean` | The Dedekind eta function of Kronecker's first limit formula (3.10)-(3.11). | parent, ER.7 |
| `mathlib:ModularGroup.S` | def | `Mathlib/LinearAlgebra/Matrix/SpecialLinearGroup.lean` | The existing integral determinant-one matrix (0 -1;1 0), used to distinguish the basis-change convention in a unit test. | ER.1 |
| `mathlib:ModularGroup.T` | def | `Mathlib/LinearAlgebra/Matrix/SpecialLinearGroup.lean` | The existing integral determinant-one matrix (1 1;0 1), used to test translation of tau without changing the normalized coordinate or q. | ER.1 |
| `mathlib:Module.Basis` | structure | `Mathlib/LinearAlgebra/Basis/Defs.lean` | A basis is an actual linear equivalence with finitely supported coordinates; no dimension assumption hidden in a numerical finrank. | ER.6 |
| `mathlib:Module.Basis.baseChange` | def | `Mathlib/LinearAlgebra/TensorProduct/Basis.lean` | A rational basis b induces an R-basis of R tensor_Q B. | ER.6 |
| `mathlib:Module.Basis.baseChange_apply` | lemma | `Mathlib/LinearAlgebra/TensorProduct/Basis.lean` | The induced basis vector is 1 tensor b(i). | ER.6 |
| `mathlib:Module.Basis.baseChange_repr_tmul` | lemma | `Mathlib/LinearAlgebra/TensorProduct/Basis.lean` | Coordinates of a tensor y are b.repr(y)(i) times the left scalar. | ER.6 |
| `mathlib:Module.End.eigenspace` | abbrev | `Mathlib/LinearAlgebra/Eigenspace/Basic.lean` | The existing submodule for c*x = -x; use this rather than a private invariant-space predicate. | ER.2 |
| `mathlib:Module.End.mem_eigenspace_iff` | theorem | `Mathlib/LinearAlgebra/Eigenspace/Basic.lean` | x lies in the μ-eigenspace iff f x = μ • x; tests and period-coordinate equations use μ = -1. | ER.2 |
| `mathlib:Module.rank_baseChange` | theorem | `Mathlib/LinearAlgebra/Dimension/Constructions.lean` | Cardinal rank, without a finite-dimensional assumption, is preserved by scalar extension of free modules (with universe lift). | ER.6 |
| `mathlib:MonoidAlgebra.mapDomain` | def | `Mathlib/Algebra/MonoidAlgebra/MapDomain.lean` | Pushforward of a group-ring element along a map (line 34); its to_additive form AddMonoidAlgebra.mapDomain gives the reflection [−1]_* used by the diamond convolution. | parent |
| `mathlib:NumberField.ComplexEmbedding.conjugate` | abbrev | `Mathlib/NumberTheory/NumberField/InfinitePlace/Embeddings.lean` | The conjugation action on embeddings K →+* ℂ (star φ). | parent, ER.1, ER.2 |
| `mathlib:NumberField.ComplexEmbedding.involutive_conjugate` | theorem | `Mathlib/NumberTheory/NumberField/InfinitePlace/Embeddings.lean` | Conjugation is an involution on complex embeddings. | ER.1 |
| `mathlib:NumberField.ComplexEmbedding.IsReal` | abbrev | `Mathlib/NumberTheory/NumberField/InfinitePlace/Embeddings.lean` | Real embeddings are the conjugation-fixed ones. | parent |
| `mathlib:NumberField.ComplexEmbedding.isReal_iff` | theorem | `Mathlib/NumberTheory/NumberField/InfinitePlace/Embeddings.lean` | An embedding is real exactly when conjugation fixes it. | ER.2 |
| `mathlib:NumberField.InfinitePlace` | def | `Mathlib/NumberTheory/NumberField/InfinitePlace/Basic.lean` | The infinite places of a number field; a place does not see complex conjugation (mk_conjugate_eq), which acts on embeddings (ComplexEmbedding.conjugate). | parent |
| `mathlib:NumberField.InfinitePlace.card_add_two_mul_card_eq_rank` | theorem | `Mathlib/NumberTheory/NumberField/InfinitePlace/Basic.lean` | nrRealPlaces K + 2 * nrComplexPlaces K = finrank ℚ K: the dimension of the elliptic regulator target. | parent, ER.1, ER.2 |
| `mathlib:NumberField.InfinitePlace.mk_conjugate_eq` | theorem | `Mathlib/NumberTheory/NumberField/InfinitePlace/Basic.lean` | A place does not see conjugation: mk (conjugate φ) = mk φ. | parent |
| `mathlib:NumberField.InfinitePlace.nrComplexPlaces` | abbrev | `Mathlib/NumberTheory/NumberField/InfinitePlace/Basic.lean` | r_2. | parent, ER.2 |
| `mathlib:NumberField.InfinitePlace.nrRealPlaces` | abbrev | `Mathlib/NumberTheory/NumberField/InfinitePlace/Basic.lean` | r₁; with 2r₂ it gives [F : ℚ], the dimension of the regulator target (card_add_two_mul_card_eq_rank). | parent, ER.2 |
| `mathlib:PeriodPair` | structure | `Mathlib/Analysis/SpecialFunctions/Elliptic/Weierstrass.lean` | A pair of periods independent over the reals, the input of the analytic construction; pinned with its lattice. | parent, ER.1, ER.3 |
| `mathlib:PeriodPair.lattice` | def | `Mathlib/Analysis/SpecialFunctions/Elliptic/Weierstrass.lean` | The lattice it spans, with closedness and the rank-two basis, pinned. | parent, ER.1, ER.3 |
| `mathlib:PeriodPair.latticeBasis` | def | `Mathlib/Analysis/SpecialFunctions/Elliptic/Weierstrass.lean` | The integral basis of the actual period lattice. | ER.1 |
| `mathlib:PeriodPair.latticeEquivProd` | def | `Mathlib/Analysis/SpecialFunctions/Elliptic/Weierstrass.lean` | Z-linear equivalence from the period lattice to Z × Z; inverse evaluates (u,v) as u omega1+v omega2. | ER.1 |
| `mathlib:Pi.basisFun` | def | `Mathlib/LinearAlgebra/StdBasis.lean` | The standard basis of functions on a finite index type. | ER.6 |
| `mathlib:Polynomial.bernoulli` | def | `Mathlib/NumberTheory/BernoulliPolynomials.lean` | Bernoulli polynomials; B_3 = X³ − (3/2)X² + (1/2)X in this convention. | parent |
| `mathlib:Polynomial.bernoulli_comp_one_add_X` | theorem | `Mathlib/NumberTheory/BernoulliPolynomials.lean` | B_n(1 + X) = B_n + n X^{n−1}: the q-invariance of J(q; ·). | parent |
| `mathlib:RatFunc.eval` | def | `Mathlib/FieldTheory/RatFunc/AsPolynomial.lean` | Evaluation of a rational function at a point via its normalized numerator and denominator. At poles this is totalized; the bridge uses only regular nonzero endpoint values. | ER.3 |
| `mathlib:Real.summable_one_div_int_pow` | theorem | `Mathlib/Analysis/PSeries.lean` | Summable (n:ℤ↦1/(n:ℝ)^p) iff 1<p; zero term interpreted as zero, p=3 for horizontal term. | ER.4 |
| `mathlib:Real.summable_one_div_nat_pow` | theorem | `Mathlib/Analysis/PSeries.lean` | Summable (n↦1/(n:ℝ)^p) iff 1<p; p=2 bounds boundary Li2 series and row sums. | ER.4 |
| `mathlib:Real.tsum_eq_tsum_fourier` | theorem | `Mathlib/Analysis/Fourier/PoissonSummation.lean` | One-dimensional Poisson formula for a continuous C-valued function with locally uniform norm summability of shifts and summable integer Fourier integrals. Power-kernel estimates in Siegel §1 and Gaussian verification/iteration for §5 remain required. | ER.7 |
| `mathlib:Subgroup.closure` | def | `Mathlib/Algebra/Group/Subgroup/Lattice.lean` | The subgroup generated by a set, defined as the infimum of subgroups containing it. The pinned to_additive attribute generates AddSubgroup.closure with the identical additive construction; that generated interface is used on Z × Z. | ER.1 |
| `mathlib:Subgroup.index` | def | `Mathlib/GroupTheory/Index.lean` | The natural-number cardinality of the coset quotient, zero for infinite index. The pinned to_additive attribute generates AddSubgroup.index, used here for the two-coset integral eigensublattice. | ER.1 |
| `mathlib:Submodule.comap` | def | `Mathlib/Algebra/Module/Submodule/Map.lean` | Line 172: inverse image of a submodule under a semilinear map; membership means its image lies in the submodule. | ER.7 |
| `mathlib:Submodule.map` | def | `Mathlib/Algebra/Module/Submodule/Map.lean` | Line 53: image submodule under a semilinear map with surjective scalar homomorphism; over Q the scalar map is the identity. | ER.7 |
| `mathlib:Submodule.mem_iSup_of_directed` | theorem | `Mathlib/LinearAlgebra/Span/Defs.lean` | Line 358: for a nonempty directed family S, x belongs to its supremum iff x belongs to some S_i. Directedness is indispensable. | ER.7 |
| `mathlib:Submodule.span_image` | theorem | `Mathlib/LinearAlgebra/Span/Basic.lean` | Line 254: span of an image equals the image of the span, under the stated surjectivity hypothesis. | ER.7 |
| `mathlib:TensorProduct.AlgebraTensorModule.lift` | def | `Mathlib/LinearAlgebra/TensorProduct/Tower.lean` | For R an algebra over Q, an R-linear map in the first variable and Q-linear map in the second induces an R-linear map from the tensor product; specialise R=R_real for scalar extension of the regulator. | ER.6 |
| `mathlib:TensorProduct.AlgebraTensorModule.lift_tmul` | theorem | `Mathlib/LinearAlgebra/TensorProduct/Tower.lean` | The extension evaluates on pure tensors by the bilinear input. | ER.6 |
| `mathlib:UpperHalfPlane` | structure | `Mathlib/Analysis/Complex/UpperHalfPlane/Basic.lean` | The upper half-plane, where the ratio of periods lives. | parent, ER.1 |
| `mathlib:WeierstrassCurve.Affine.CoordinateRing.mk_ψ` | lemma | `Mathlib/AlgebraicGeometry/EllipticCurve/DivisionPolynomial/Basic.lean` | For every integer n, the images of ψ_n and Ψ_n agree in the affine coordinate ring. Evaluating at a point satisfying the curve equation transports the computed Ψ_6 to the ψ_6 used by Tau Ceti torsion theorems. | ER.8 |
| `mathlib:WeierstrassCurve.Affine.FunctionField` | abbrev | `Mathlib/AlgebraicGeometry/EllipticCurve/Affine/Point.lean` | Fraction ring of the affine coordinate ring. | ER.8 |
| `mathlib:WeierstrassCurve.c₄` | def | `Mathlib/AlgebraicGeometry/EllipticCurve/Weierstrass.lean` | Invariant b2²-24b4 of a Weierstrass equation. | ER.6 |
| `mathlib:WeierstrassCurve.LFunction` | def | `Mathlib/AlgebraicGeometry/EllipticCurve/LFunction.lean` | The L-function of a Weierstrass curve over a number field as the formal Euler product of the local factors, with local polynomial 1 at additive primes (line 79). | parent, ER.6 |
| `mathlib:WeierstrassCurve.LSeries` | def | `Mathlib/AlgebraicGeometry/EllipticCurve/LFunction.lean` | Its L-series as a function of s : ℂ (line 84); the left side of Deuring's comparison in ER.5. | parent, ER.5, ER.6 |
| `mathlib:WeierstrassCurve.preΨ_even` | lemma | `Mathlib/AlgebraicGeometry/EllipticCurve/DivisionPolynomial/Basic.lean` | The even-index recurrence used at n=6. | ER.8 |
| `mathlib:WeierstrassCurve.Δ` | def | `Mathlib/AlgebraicGeometry/EllipticCurve/Weierstrass.lean` | Discriminant with the Mathlib/LMFDB sign convention. | ER.6 |
| `mathlib:WeierstrassCurve.Ψ` | def | `Mathlib/AlgebraicGeometry/EllipticCurve/DivisionPolynomial/Basic.lean` | The existing bivariate division polynomial, reduced form congruent to ψ_n in the coordinate ring. | ER.8 |
| `mathlib:ZLattice.summable_norm_rpow` | lemma | `Mathlib/Algebra/Module/ZLattice/Summable.lean` | For a discrete integer submodule L of a finite-dimensional real normed space, the norms to power r are summable when r<−rank L. Apply to rank two and r=−3; the zero term has the library total-power convention and is removed. | ER.3 |
| `mathlib:ZMod.dft` | def | `Mathlib/Analysis/Fourier/ZMod.lean` | The finite Fourier transform on ZMod N with inversion, used to invert (10.3.1) at C-torsion. | parent |
| `mathlib:ZMod.stdAddChar` | def | `Mathlib/Analysis/SpecialFunctions/Complex/CircleAddChar.lean` | The additive character ZMod C→ℂ, exp(2πij/C); its conjugate in the AC.0 convention gives kernel exp(2πi(−ak+bℓ)/C). | ER.4, ER.5 |
| `tauceti:AddCircle.prodFundamentalGroupMulEquiv` | def | `TauCeti/AlgebraicTopology/UniversalCover/Torus/FundamentalGroup.lean` | π_1 of AddCircle p × AddCircle q ≃ ℤ × ℤ. | parent, ER.1 |
| `tauceti:CommGroup.sum_monoidHom_apply_eq_ite` | theorem | `TauCeti/GroupTheory/FiniteAbelian/CharacterOrthogonality.lean` | Column orthogonality for finite commutative G and characters G →* Mˣ, M a domain with enough roots of unity. Sum equals Nat.card G at identity and zero elsewhere. | parent |
| `tauceti:HeckeRing.GL2.Newform` | structure | `TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean` | Line 102: normalized new EigenformAwayFromLevel, including a character-space cusp form, newness and q coefficient 1. Bad-prime eigenvalues are not supplied by the away-from-level structure. | ER.7 |
| `tauceti:TauCeti.argumentPrinciple_windingNumber` | theorem | `TauCeti/Analysis/Complex/Conformal/ArgumentPrinciple.lean` | The argument principle for meromorphic functions along a closed piecewise-C¹ null-homologous curve: zero/pole count as a winding number. | parent |
| `tauceti:TauCeti.Divisor.principal` | def | `TauCeti/FieldTheory/FunctionField/Divisor/Principal.lean` | Principal divisor of a function-field unit. | ER.8 |
| `tauceti:TauCeti.finrank_weilDifferentialFiltration_zero` | theorem | `TauCeti/FieldTheory/FunctionField/Differential/Dimension.lean` | dim_k of the regular Weil differentials = genus. | parent |
| `tauceti:TauCeti.haarProb_eq_smul_count` | theorem | `TauCeti/RepresentationTheory/Compact/Finite.lean` | For a finite discrete group with Borel measurable structure, haarProb G=(Nat.card G)⁻¹ • Measure.count. | parent |
| `tauceti:TauCeti.hasSum_norm_sq_peterWeylCoeff` | theorem | `TauCeti/RepresentationTheory/Compact/PeterWeyl.lean` | Peter–Weyl Parseval for an irreducible skeleton and L²(haarProb); the finite-abelian character coefficient comparison remains a separate obligation. | parent |
| `tauceti:TauCeti.LSeries_normCoeff` | theorem | `TauCeti/NumberTheory/ArithmeticDirichletSeries/Regroup.lean` | For f:IdealArithmeticFunction K and I ranging over (Ideal(O K))⁰, Summable(idealTerm K f s) implies LSeries(normCoeff K f,s)=Σ_I idealTerm K f s I. The sum is over nonzero integral ideals. | ER.5 |
| `tauceti:TauCeti.MultiplicativeIdealWeight` | definition | `TauCeti/NumberTheory/ArithmeticDirichletSeries/Weight.lean` | Ideal(O K)→*₀ℂ with only finitely many height-one primes killed; existing carrier for ψ extended by zero at the conductor. | ER.5 |
| `tauceti:TauCeti.MultiplicativeIdealWeight.LSeries_ne_zero_of_summable_idealTerm` | theorem | `TauCeti/NumberTheory/ArithmeticDirichletSeries/EulerProduct/Analytic.lean` | For ψ:MultiplicativeIdealWeight K, Summable(idealTerm K ψ.toIdealArithmeticFunction s) implies LSeries(normCoeff K ψ.toIdealArithmeticFunction,s)≠0, with no separate real-part hypothesis. | ER.5 |
| `tauceti:TauCeti.norm_idealTerm` | theorem | `TauCeti/NumberTheory/ArithmeticDirichletSeries/Regroup.lean` | For I a nonzero ideal, ‖idealTerm K f s I‖=‖f I‖/(absNorm I:ℝ)^Re(s). | ER.5 |
| `tauceti:TauCeti.rouche_windingNumber_comp` | theorem | `TauCeti/Analysis/Complex/Conformal/Rouche.lean` | Rouché: ‖f − g‖ < ‖f‖ along a closed curve gives equal winding numbers of f ∘ γ and g ∘ γ. | parent |
| `tauceti:TauCeti.summable_absNorm_rpow_ideal_iff` | theorem | `TauCeti/NumberTheory/ArithmeticDirichletSeries/Convergence.lean` | For a number field K and real t, Summable(I≠0↦(absNorm I:ℝ)^(−t)) iff1<t. | ER.5 |
| `tauceti:UpperHalfPlane.peterssonInner` | def | `TauCeti/NumberTheory/ModularForms/Petersson/Basic.lean` | Line 107: integral over D of conj(f) times g times y^k against invariant hyperbolic volume. Conjugates the first variable; no division by the congruence index is built in. | ER.7 |
| `tauceti:WeierstrassCurve.Affine.equation_genericX_genericY` | theorem | `TauCeti/AlgebraicGeometry/EllipticCurve/Affine/FunctionField/GenericPoint.lean` | The generic coordinates satisfy the base-changed Weierstrass equation. | ER.8 |
| `tauceti:WeierstrassCurve.Affine.exists_principal_zsmul_pointPlace_sub_infinity` | theorem | `TauCeti/AlgebraicGeometry/EllipticCurve/Affine/FunctionField/TorsionDivisor.lean` | For a nonsingular n-torsion point, n(P)-n(O) is the principal divisor of a unit. This existence theorem is imported, not planned again. | ER.8 |
| `tauceti:WeierstrassCurve.Affine.genericX` | def | `TauCeti/AlgebraicGeometry/EllipticCurve/Affine/FunctionField/GenericPoint.lean` | The x coordinate in the existing elliptic function field. | ER.8 |
| `tauceti:WeierstrassCurve.Affine.genericY` | def | `TauCeti/AlgebraicGeometry/EllipticCurve/Affine/FunctionField/GenericPoint.lean` | The y coordinate in the existing elliptic function field. | ER.8 |
| `tauceti:WeierstrassCurve.Affine.invariantDifferential` | def | `TauCeti/AlgebraicGeometry/EllipticCurve/Affine/InvariantDifferential.lean` | ω = dx/(2y + a₁x + a₃) in Ω[K(E)/F] (its docstring notes that div ω = 0 is not proved). | parent, ER.1 |
| `tauceti:WeierstrassCurve.Affine.isFunctionField` | theorem | `TauCeti/AlgebraicGeometry/EllipticCurve/Affine/FunctionField/Finrank.lean` | The function-field structure used by places and principal divisors. | ER.8 |
| `tauceti:WeierstrassCurve.evalEval_ψ_eq_zero_of_zsmul_eq_zero` | theorem | `TauCeti/AlgebraicGeometry/EllipticCurve/DivisionPolynomial/ZSMul.lean` | The converse: an n-torsion point is a zero of ψ_n. | ER.8 |
| `tauceti:WeierstrassCurve.zsmul_eq_zero_of_evalEval_ψ_eq_zero` | theorem | `TauCeti/AlgebraicGeometry/EllipticCurve/DivisionPolynomial/ZSMul.lean` | A nonsingular zero of ψ_n is annihilated by n in the Jacobian group. | ER.8 |
| `tauceti:WeierstrassCurve.zsmul_fromAffine_eq_zero_iff` | lemma | `TauCeti/AlgebraicGeometry/EllipticCurve/DivisionPolynomial/ZSMul.lean` | For an affine point P and natural n, integer-cast n annihilates Jacobian.Point.fromAffine P iff n annihilates P in the affine group. Use n=6 and natCast_zsmul to reach the torsion-principal-divisor theorem. | ER.8 |

The reviewed library audit (AUDIT-28, `data/library-coverage.json`) finds none of the layers built. The analytic ingredients are partly there (period pairs, the q-parameter, Bernoulli polynomials and their Fourier coefficients, lattice summability, finite Fourier transforms, the raw elliptic L-series, ideal L-series with Euler-product nonvanishing), and the packets cite them rather than re-planning them.

## Layer overview

| Layer | Title | Nodes (parent + part) | Planets | Coverage: parent / part | Atlas requirements |
|---|---|---|---|---|---|
| ER.1 | The analytic elliptic curve and its periods | 4 + 7 | 6 | partial / planned | `EllipticKTheory:E.1`, `UPSTREAM:EllipticFunctions` |
| ER.2 | Deligne cohomology and the symbol regulator | 5 + 5 | 4 | partial / planned | `EllipticKTheory:E.5`, `EllipticRegulators:ER.1`, `Polylogarithms:P.2` |
| ER.3 | The elliptic dilogarithm and its companion | 14 + 4 | 5 | partial / planned | `EllipticRegulators:ER.2` |
| ER.4 | The divisor formula and Bloch's classes | 7 + 11 | 6 | partial / planned | `EllipticKTheory:E.7`, `EllipticRegulators:ER.3` |
| ER.5 | The complete CM example of Bloch | 8 + 10 | 4 | partial / planned | `DirichletPadicLFunctions:L0`, `EllipticRegulators:ER.4` |
| ER.6 | Integral parts and the Beilinson statement | 6 + 11 | 6 | partial / planned | `EllipticKTheory:E.6`, `EllipticRegulators:ER.5` |
| ER.7 | General modular elliptic curves | 25 + 16 | 6 | partial / planned | `EllipticCurveModularity:R29.6`, `EllipticKTheory:E.6`, `EllipticKTheory:E.7`, `EllipticRegulators:ER.4`, `ModularCurvesPartII:R14.6` |
| ER.8 | p-adic comparison and worked examples | 6 + 12 | 4 | partial / planned | `EllipticRegulators:ER.4`, `PadicHodgeRegulators:D.5` |

Each part is a complete planning pass with coverage `planned`: every target of its layer is a node, an imported node, a request or a recorded gap. No layer is `closed`, because supplier requests and gaps remain open. The parent packet's `partial` records predate the parts; each layer section below gives both, and the open items in force are those of the part.

## ER.1 — The analytic elliptic curve and its periods

*11 nodes: 4 from the parent packet and 7 from the ER.1 part. Planets (6): Oriented period basis; Change of period basis; Conjugate periods; Real period normalization; Primitive regulator cycle; Normalized invariant differential.*

The layer fixes the analytic data on which every regulator formula of the roadmap is computed: an oriented period basis, the normalised uniformisation η : E(ℂ) ≅ ℂ/(ℤ + τℤ), the parameter q = e^{2πiτ} with the multiplicative presentation E(ℂ) ≅ ℂ^×/q^ℤ, and their behaviour under a change of basis, under complex conjugation and over all embeddings of a number field. It owns none of the underlying geometry.

- **Imported.** The uniformisation, with its origin, group law and the comparison of the invariant differential with dz, is ModularCurvesPartII R12.1's (RS-06). The de Rham–Betti comparison is ComplexComparisonPartII C5's, and the elliptic Hodge-line and integral-period computation is C6's (confirmed finding RT-AREA-ktheory-2/8). Singular homology of the torus and its intersection pairing are Tau Ceti AlgebraicTopology stages 5 and 6.
- **The parent packet** states the targets for the curve: the normalised uniformisation with its SL₂(ℤ) rule, the q-parameter with Brunault's real normalisation (1.40), the period and comparison statement, and the all-embeddings statement, in which each conjugation eigenspace of H_1(E(ℂ), ℝ) has dimension r₁ + 2r₂ = [F : ℚ].
- **The ER.1 part** supplies the scalar interface that the following layers compute with:
  - `RegulatorPeriods`, a Mathlib `PeriodPair` with positive orientation, and its scaling laws;
  - transport under SL₂(ℤ), with rebase(rebase(D, N), M) = rebase(D, MN);
  - the conjugate datum, with τ̄ = −conj(τ) and q̄ = conj(q);
  - the real shape 2 Re τ ∈ {0, 1}, which fixes the sign of q;
  - the primitive integral anti-invariant cycle, (0, 1) or (−1, 2), the second of index two;
  - conjugation x ↦ 1/conj(x) in multiplicative coordinates;
  - the normalised differential ω/ω1 = η^*dz, handed to ER.2.
- **Reconciliation.** The parent node `ER.1/periods-and-the-comparison-isomorphism` mixes the imported comparison with the period choice and reads H_1(E(ℂ), ℤ) as the deck group Λ_ω, with a Hurewicz gap. The ER.1 part replaces both by supplier contracts with C5, C6 and the two AlgebraicTopology stages, and its accepted restructure entry asks the assembly to read the parent node that way; the node's Assembly note does so.

The layer is planned, not closed: the five supplier contracts of the ER.1 part are open requests. No universal Chern or Deligne factor, and in particular no 2π, is chosen here; that is ER.2's.

**Coverage.**

- **In the parent packet: partial.** The uniformisation itself is R12.1's (RS-06) and is imported; ER.1 keeps the lattice-choice specialisation (normalised τ and η, the q-parameter with the real normalisation and real locus, homology with the intersection pairing and the Abel–Jacobi isomorphism, the period matrix through C5, all embeddings with conjugation and the dimension count r_1 + 2r_2). Revised by REV-EllipticRegulators.
  - Remaining: Hurewicz comparison of the deck group with singular H_1 (gap).
  - Remaining: R12.1 and C5 are requested, not yet planned node by node.
- **In the ER.1 part: planned.** All retained ER.1 targets have been planned or imported at target granularity. This is a complete planning pass, not a closed stage or a claim that suppliers are proved.
  - Remaining: R12.1 must supply the genuine analytic uniformisation and differential compatibility; its current packet has no nodes in this stage.
  - Remaining: C5/C6 must supply the integral integration and elliptic Hodge-line interfaces described in requests, including geometric signatures omitted from the suggested file.
  - Remaining: The upstream torus singular-homology and intersection interfaces must be connected to the C6 integration map; this is a supplier obligation, not a deck-group definition of homology.

### The normalised uniformisation η : E(C) ≅ C/(Z + τZ) attached to an oriented basis

`ER.1/complex-uniformisation` · construction · parent packet

The uniformisation of a complex elliptic curve E (with origin 0 and a non-zero invariant differential ω) by C/Λ_ω, P ↦ ∫_0^P ω, with its compatibility with the origin and the group law, the converse Weierstrass construction from a lattice (including the non-vanishing of g₂³ − 27g₃²), homothety invariance and the comparison of the algebraic invariant differential with dz, is IMPORTED from ModularCurvesPartII R12.1, which owns it (RS-06). This node adds only the lattice-choice specialisation the regulator needs. For an oriented basis (γ1, γ2) of H_1(E(C), Z) (ER.1/periods-and-the-comparison-isomorphism), put τ = ∫_{γ2} ω / ∫_{γ1} ω, which lies in the upper half-plane, and η(P) = (∫_{γ1} ω)^{-1} ∫_0^P ω mod Z + τZ. Then η : E(C) → C/(Z + τZ) is an isomorphism of complex Lie groups with η^*dz = ω / ∫_{γ1} ω; τ and η do not depend on ω; replacing (γ1, γ2) by (dγ1 + cγ2, bγ1 + aγ2) with (a b; c d) in SL_2(Z) replaces τ by (aτ + b)/(cτ + d) and η by η/(cτ + d); replacing γ2 by γ2 + kγ1 replaces τ by τ + k and leaves η unchanged. If E is defined over R and γ1 is the generator of the conjugation-invariant part H_1^+(E(C), Z) fixed by an orientation of E(R) (Brunault (1.40)), then complex conjugation of E(C) corresponds under η to z ↦ z̄ and 2 Re τ is 0 or 1.

**Hypotheses.**

- E is an elliptic curve over C (for number fields: its base change along an embedding, ER.1/all-embeddings-and-the-conjugation-action); ω is a non-zero invariant differential; the uniformisation E(C) ≅ C/Λ_ω is R12.1's and is not re-proved here.
- Oriented means Im(∫_{γ2} ω / ∫_{γ1} ω) > 0, equivalently ⟨γ1, γ2⟩ = +1 for the intersection pairing oriented by the complex structure. Mathlib's PeriodPair is NOT oriented (it only asks for R-linear independence), so the orientation is an extra hypothesis.
- The real statements need E and ω defined over R and γ1 in H_1^+(E(C), Z); for another basis the conjugation is not z ↦ z̄ (see the non-example test).

**Construction.**

1. Import from R12.1 the uniformisation u_ω : E(C) ≅ C/Λ_ω, compatible with 0 and the group law, with u_ω^*dz = ω.
2. Read the oriented basis in Λ_ω through H_1(E(C), Z) ≅ Λ_ω, λ ↦ ∫_λ ω (ER.1/periods-and-the-comparison-isomorphism); Λ_ω = Z∫_{γ1}ω + Z∫_{γ2}ω, so Λ_ω / ∫_{γ1} ω = Z + τZ and η = (∫_{γ1} ω)^{-1} u_ω is well defined.
3. Independence of ω: replacing ω by cω multiplies ∫_0^P ω, ∫_{γ1} ω and ∫_{γ2} ω by c.
4. Change of basis: the new lattice basis is (c∫_{γ2}ω + d∫_{γ1}ω, a∫_{γ2}ω + b∫_{γ1}ω), so τ' = (aτ + b)/(cτ + d) and η' = η/(cτ + d).
5. Real case: for ω defined over R, ∫_{c_*γ} ω = conj(∫_γ ω); c_*γ1 = γ1 makes ∫_{γ1} ω real, and c_*γ2 = −γ2 + mγ1 gives conj(τ) = −τ + m; after γ2 ↦ γ2 + kγ1, m is 0 or 1, and η(c(P)) = conj(η(P)) (Brunault p. 27).

**API.**

- `normalisedTau` (data): τ(γ1, γ2) = ∫_{γ2} ω / ∫_{γ1} ω in the upper half-plane, for an oriented basis; independent of ω.
- `normalisedUniformisation` (data): η : E(C) ≅ C/(Z + τZ), P ↦ (∫_{γ1} ω)^{-1} ∫_0^P ω, an isomorphism of complex Lie groups.
- `normalisedUniformisation_pullback_dz` (compatibility): η^*dz = ω / ∫_{γ1} ω; with R12.1's u_ω, η = (∫_{γ1} ω)^{-1} · u_ω.
- `normalisedUniformisation_indep` (characterisation): τ and η do not depend on the choice of ω.
- `normalisedUniformisation_changeOfBasis` (relation): For (a b; c d) in SL_2(Z) and the basis (dγ1 + cγ2, bγ1 + aγ2): τ' = (aτ + b)/(cτ + d), η' = η/(cτ + d).
- `normalisedUniformisation_conj` (compatibility): For E over R and γ1 in H_1^+: η ∘ c = conj ∘ η and 2 Re τ ∈ {0, 1}.

**Unit tests.**

- `tau_of_y2_eq_x3_sub_x` (computation): For E : y² = x³ − x over R, with γ1 the generator of H_1^+ fixed by an orientation, τ = i (the period lattice of dx/2y is Ω(Z + iZ), Ω = 2.62205755429211981...).
- `tau_negative_discriminant` (computation): For E : y² = x³ + x + 1 (discriminant −496 < 0), the normalised τ has Re τ = 1/2; numerically τ = 1/2 + 0.352464168465...i.
- `shift_gamma2` (degenerate): Replacing γ2 by γ2 + γ1 replaces τ by τ + 1 and leaves η unchanged.
- `basis_change_S` (characterisation): For the oriented basis (γ2, −γ1) one gets τ' = −1/τ and η' = η/τ.
- `real_needs_H1plus` (non-example): For y² = x³ − x and the oriented basis (γ1 + 2γ2, γ2), τ' = i/(2i + 1) = (2 + i)/5 has real part 2/5, conjugation is not z ↦ z̄ on C/(Z + τ'Z), and q' = exp(2πiτ') ≈ −0.2302540 + 0.1672893i is not real.

**Acceptance.**

- η is an isomorphism of complex Lie groups onto C/(Z + τZ) with η^*dz = ω/∫_{γ1} ω, independent of ω.
- Under an SL_2(Z) change of oriented basis, τ ↦ (aτ + b)/(cτ + d) and η ↦ η/(cτ + d); under γ2 ↦ γ2 + γ1, τ ↦ τ + 1 and η is unchanged.
- For E over R with γ1 in H_1^+, conjugation is z ↦ z̄ and 2 Re τ is 0 or 1: for y² = x³ − x one gets τ = i, for y² = x³ + x + 1 one gets τ = 1/2 + 0.352464168465...i (PARI periods 3.749942978094..., 1.874971489047... ± 1.321720533565...i).
- Nothing that R12.1 owns is re-proved.

**Uses.**

- ER.1, the q-parameter: q = exp(2πiτ) and the multiplicative presentation are built from τ and η.
- ER.3, the elliptic dilogarithm: D_{E,η}(P) = D_q(exp(2πiη(P))) (Brunault Définition 19).
- ER.2, the target: ω_0 = η^*dz is the differential that identifies the one-dimensional target with R for E/Q.
- ER.4, the diamond convolution: points of divisors are recorded as classes z mod Z + τZ.

**Depends on.** this roadmap: `ER.1/periods-and-the-comparison-isomorphism`; other roadmaps: `EllipticKTheory:E.1/points-and-group-law-comparison`; layers of other roadmaps: `ModularCurvesPartII:R12.1`; libraries: `tauceti:WeierstrassCurve.Affine.invariantDifferential`, `mathlib:PeriodPair`, `mathlib:PeriodPair.lattice`, `mathlib:UpperHalfPlane`.

**Needed by.** this roadmap: `ER.1/the-q-parameter-and-the-multiplicative-presentation`, `ER.2/the-deligne-cohomology-target`, `ER.3/the-elliptic-dilogarithm`, `ER.3/lattice-basis-change`, `ER.3/green-function-of-the-curve`, `ER.3/goncharov-function-and-the-regulator`, `ER.1/oriented-basis-transport`, `ER.1/real-period-shape`, `ER.1/regulator-period-handoff`, `ER.2/oriented-period-coordinate-comparison`.

**Sources.**

- `Brunault.These.2005`, §1.2, (1.36)–(1.37), p. 21: “Choisissons un isomorphisme η : E ≅ C/(Z + τZ), avec τ ∈ C vérifiant ℑ(τ) > 0. Composons η avec l'application z ↦ exp(2πiz). Nous obtenons un isomorphisme de groupes E ≅ C∗/q^Z, où nous avons posé q = exp(2πiτ).” — The source assumes the uniformisation (R12.1's) and works with the normalised η; this node records η and its dependence on choices.
- `Brunault.These.2005`, Remarque 20, (1.40), p. 22: “Nous posons alors τ = ∫_{γ2} ω / ∫_{γ1} ω ∈ H et η : P ↦ [∫_0^P ω / ∫_{γ1} ω], où ω désigne une forme différentielle holomorphe non nulle quelconque sur E(C).” — The normalised τ and η, verbatim (the source writes the integrals as displayed fractions).
- `Brunault.These.2005`, proof of Proposition 26, p. 27: “Notons c : E(C) → E(C) la conjugaison complexe. Elle correspond à la conjugaison complexe usuelle sur C/(Z + τZ) via l'isomorphisme η.” — The real case of the conjugation compatibility.

**Assembly note.** The ER.1 part imports this node by id, for this use: Use the normalized uniformisation and differential pullback after satisfying the corrected integral input contracts; no new uniformisation theorem.

**Assembly note.** The oriented basis is the ER.1 part's datum `RegulatorPeriods` (`ER.1/oriented-regulator-period-data`). Its change of basis is `ER.1/oriented-basis-transport`, with the same convention as here: (a b; c d) sends the periods to (dω1 + cω2, bω1 + aω2) and τ to (aτ + b)/(cτ + d).

### The multiplicative presentation and the parameter q

`ER.1/the-q-parameter-and-the-multiplicative-presentation` · construction · parent packet

For τ in the upper half-plane put q = exp(2πiτ) (Mathlib's Function.Periodic.qParam 1 τ). Then 0 < |q| = exp(−2π Im τ) < 1, and z ↦ exp(2πiz) induces an isomorphism of complex Lie groups C/(Z + τZ) ≅ C^×/q^Z; composed with η of ER.1/complex-uniformisation it gives E(C) ≅ C^×/q^Z (Brunault (1.37)). q is unchanged by τ ↦ τ + 1; a general SL_2(Z) change of basis acts through z ↦ z/(cτ + d), not by a formula in q alone. q is real exactly when 2 Re τ is an integer. For E over R with the normalisation (1.40): q is real, non-zero, −1 < q < 1, it depends only on E, and q > 0 exactly when E(R) has two connected components; E(R) is carried onto the circle |x| = 1, together with the circle |x| = |q|^{1/2} when q > 0, and complex conjugation of E(C) becomes x ↦ 1/x̄. Reversing the orientation of E(R) replaces η by −η (x by 1/x) and leaves τ and q unchanged.

**Hypotheses.**

- τ comes from an oriented basis as in ER.1/complex-uniformisation; |q| < 1 is then a consequence, not a hypothesis.
- For the real statements E is defined over R and the basis is normalised as in Brunault (1.40): γ1 generates H_1^+(E(C), Z) and is fixed by the orientation of E(R).

**Construction.**

1. |q| = exp(−2π Im τ) (mathlib Function.Periodic.norm_qParam) and q ≠ 0 (Function.Periodic.qParam_ne_zero).
2. exp(2πi ·) : C → C^× is a surjective holomorphic homomorphism with kernel Z that maps τZ onto q^Z; pass to the quotients.
3. q(τ + 1) = q(τ); the SL_2(Z) rule is inherited from ER.1/complex-uniformisation (η ↦ η/(cτ + d)).
4. q is real iff exp(2πi Re τ) is real iff 2 Re τ is an integer.
5. Real case: 2 Re τ is 0 or 1 by ER.1/complex-uniformisation, so q lies in (−1, 0) ∪ (0, 1); z ↦ z̄ becomes x ↦ exp(2πi z̄) = 1/x̄, whose fixed set modulo q^Z is |x| = 1, plus |x| = q^{1/2} when q > 0 (one circle when q < 0).
6. Orientation: γ1 ↦ −γ1 forces γ2 ↦ −γ2 (+ kγ1) for a direct basis, so τ is unchanged and η ↦ −η.

**API.**

- `qParameter` (data): q(τ) = exp(2πiτ), defined as Mathlib's Function.Periodic.qParam 1 τ.
- `qParameter_norm_lt_one` (characterisation): |q(τ)| = exp(−2π Im τ) < 1.
- `qParameter_ne_zero` (characterisation): q(τ) ≠ 0.
- `qParameter_add_one` (simp): q(τ + 1) = q(τ).
- `qParameter_real_iff` (characterisation): q(τ) is real iff 2 Re τ is an integer.
- `multiplicativePresentation` (data): C/(Z + τZ) ≅ C^×/q^Z induced by exp(2πi ·), an isomorphism of complex Lie groups.
- `multiplicativePresentation_conj` (compatibility): For E over R normalised by (1.40): conjugation is x ↦ 1/x̄ and E(R) is |x| = 1 (with |x| = |q|^{1/2} when q > 0).
- `multiplicativePresentation_orientation` (relation): Reversing the orientation of E(R) replaces x by 1/x and fixes q.

**Unit tests.**

- `q_at_i` (computation): q(i) = e^{−2π} = 0.0018674427317079888...
- `q_add_one` (degenerate): q(τ + 1) = q(τ) for every τ.
- `q_eq_qParam` (compatibility): qParameter τ = Function.Periodic.qParam 1 τ (Mathlib).
- `real_points_on_circles` (characterisation): For y² = x³ − x normalised by (1.40), the point (2, √6) is sent to |x| = 1 and (−1/2, √(3/8)) to |x| = e^{−π} = q^{1/2}; conjugation fixes both circles pointwise via x ↦ 1/x̄.
- `negative_q` (computation): For y² = x³ + x + 1, q ≈ −0.109197437222 < 0 and E(R) is connected.
- `nonreal_q` (non-example): q((2 + i)/5) ≈ −0.2302540 + 0.1672893i is not real: a basis of a real curve with γ1 not in H_1^+ does not give a real q.

**Acceptance.**

- 0 < |q| < 1 and q(τ + 1) = q(τ).
- For E over R normalised by (1.40), q lies in (−1, 0) ∪ (0, 1) and q > 0 exactly when E(R) has two components: y² = x³ − x gives q = e^{−2π} ≈ 0.0018674427317, y² = x³ + x + 1 gives q ≈ −0.1091974372.
- E(R) is carried onto |x| = 1 (and |x| = |q|^{1/2} when q > 0), conjugation onto x ↦ 1/x̄; on y² = x³ − x the point (2, √6) goes to |x| = 1 and (−1/2, √(3/8)) to |x| = e^{−π}.
- Reversing the orientation replaces x by 1/x and fixes q; the sign change of the dilogarithm that this causes is ER.3's statement, not this node's.

**Uses.**

- ER.3: The orbit sum defining the dilogarithm runs over the powers of this parameter.
- ER.4: The divisor formula is stated in the multiplicative coordinates.
- ER.5: Bloch’s CM computation uses this normalisation of the parameter.

**Depends on.** this roadmap: `ER.1/complex-uniformisation`; layers of other roadmaps: `ModularCurvesPartII:R12.1`; libraries: `mathlib:UpperHalfPlane`, `mathlib:Complex.exp`, `mathlib:Function.Periodic.qParam`, `mathlib:Function.Periodic.norm_qParam`, `mathlib:Function.Periodic.qParam_ne_zero`.

**Needed by.** this roadmap: `ER.1/all-embeddings-and-the-conjugation-action`, `ER.3/the-elliptic-dilogarithm`, `ER.3/the-companion-and-Bloch-convention`, `ER.3/truncated-theta-products`, `ER.1/exponential-conjugation-coordinates`.

**Sources.**

- `Brunault.These.2005`, §1.2, (1.37), p. 21: “Composons η avec l'application z ↦ exp(2πiz). Nous obtenons un isomorphisme de groupes E ≅ C∗/q^Z, où nous avons posé q = exp(2πiτ).” — The multiplicative presentation, verbatim.
- `Brunault.These.2005`, Remarque 20, after (1.40), p. 22: “Le nombre q = exp(2πiτ) est un nombre réel non nul. Il vérifie −1 < q < 1 et ne dépend que de E.” — The real normalisation of q, verbatim.

**Assembly note.** The ER.1 part imports this node by id, for this use: Use the existing q and exponential presentation; extend conjugation bookkeeping to paired embeddings.

### Periods, homology and the comparison with algebraic de Rham cohomology

`ER.1/periods-and-the-comparison-isomorphism` · theorem · parent packet

For an elliptic curve E over a subfield k of C with a non-zero invariant differential ω, the integration pairing H_1(E(C), Z) × Ω^{1,0}(E) → C, (λ, ω) ↦ ∫_λ ω, induces the Abel–Jacobi isomorphism of real vector spaces H_1(E(C), R) ≅ Hom_C(Ω^{1,0}(E), C) (Brunault (1.43)–(1.44)); it carries H_1(E(C), Z) onto the period lattice Λ_ω of R12.1's uniformisation, so H_1(E(C), Z) is free of rank two. The intersection pairing is the alternating form with ⟨γ1, γ2⟩ = 1 exactly on oriented bases (Im(∫_{γ2} ω/∫_{γ1} ω) > 0); it is perfect over Z and defines the direct bases of ER.1. The period matrix is the matrix of the de Rham–Betti comparison H^1_dR(E/k) ⊗_k C ≅ H^1(E(C), C), imported from ComplexComparisonPartII C5, in a k-basis of H^1_dR and a basis of H_1; its non-degeneracy is the statement that the comparison is an isomorphism, not a property of a matrix attached to E by definition. For E over R, complex conjugation acts on H_1 and H_1^+(E(C), Z) is free of rank one.

**Hypotheses.**

- E is an elliptic curve over k ⊂ C; E(C) and its uniformisation are R12.1's.
- H_1(E(C), Z) is taken as the deck group of the universal covering C → C/Λ_ω, identified with Λ_ω by λ ↦ ∫_λ ω; its comparison with singular H_1 (Hurewicz) is not at the pins and is recorded as a gap.
- The orientation is the complex one of E(C); it fixes the sign of the intersection pairing (Brunault p. 22, note 2).

**Proof outline.**

1. Import from R12.1 the uniformisation E(C) ≅ C/Λ_ω with u_ω^*dz = ω.
2. Identify the deck group of C → C/Λ_ω with Λ_ω (for the fundamental group of a torus Tau Ceti has AddCircle.prodFundamentalGroupMulEquiv after an R-linear change of coordinates); record the Hurewicz comparison with singular homology as a gap.
3. λ ↦ ∫_λ ω is the inclusion Λ_ω ⊂ C, and Λ_ω ⊗ R ≅ C gives (1.44).
4. Define ⟨λ, μ⟩ = Im(conj(λ)μ)/covol(Λ_ω) on Λ_ω: it is Z-valued, alternating and unimodular, and ⟨γ1, γ2⟩ = 1 exactly for oriented bases.
5. Import the de Rham–Betti comparison of C5 for E and define the period matrix as the matrix of the integration pairing in chosen bases; non-degeneracy is the comparison being an isomorphism.
6. Record the pinned material: Tau Ceti's abstract weight-one Hodge structures and TauCeti.finrank_weilDifferentialFiltration_zero (dim of the regular differentials = genus = 1); neither library has algebraic de Rham cohomology of a variety.

**Acceptance.**

- H_1(E(C), Z) ≅ Λ_ω is free of rank two and the intersection pairing is a perfect alternating form with ⟨γ1, γ2⟩ = 1 on oriented bases.
- λ ↦ (ω ↦ ∫_λ ω) induces H_1(E(C), R) ≅ Hom_C(Ω^{1,0}(E), C).
- The period matrix is the matrix of the imported comparison and is non-degenerate because the comparison is an isomorphism.
- For E over R, H_1^+(E(C), Z) is free of rank one.

**Depends on.** layers of other roadmaps: `ModularCurvesPartII:R12.1`, `ComplexComparisonPartII:C5`, `ComplexComparisonPartII:C6`; libraries: `tauceti:AddCircle.prodFundamentalGroupMulEquiv`, `tauceti:TauCeti.finrank_weilDifferentialFiltration_zero`.

**Needed by.** this roadmap: `ER.1/complex-uniformisation`, `ER.1/all-embeddings-and-the-conjugation-action`, `ER.2/the-deligne-cohomology-target`, `ER.2/the-regulator-on-symbols`, `ER.3/fourier-and-kronecker-eisenstein`, `ER.3/green-function-of-the-curve`, `ER.2/archimedean-orbit-equivalence`, `ER.2/oriented-period-coordinate-comparison`.

**Sources.**

- `Brunault.These.2005`, §1.2, (1.43)–(1.44), p. 22: “Rappelons que l'application d'Abel-Jacobi H1(E, Z) → HomC(Ω1,0(E), C), λ ↦ (ω ↦ ∫_λ ω) induit un isomorphisme d'espaces vectoriels réels H1(E, R) ≅ HomC(Ω1,0(E), C).” — The integration pairing and the Abel–Jacobi isomorphism, verbatim.
- `Brunault.These.2005`, Remarque 20, note 2, p. 22: “L'orientation canonique de C induit via η une orientation canonique de E(C), qui détermine à son tour le signe du produit d'intersection sur H1(E(C), Z).” — The sign convention of the intersection pairing.

**Assembly note.** The ER.1 part's accepted restructure entry (confirmed finding RT-AREA-ktheory-2/8) asks the assembly to read this node through supplier contracts, and REV-EllipticRegulators--ER.1 repeats the instruction.

- **Comparison.** The general de Rham–Betti comparison is ComplexComparisonPartII C5's. The elliptic Hodge line, the integral isomorphism H_1(E(ℂ), ℤ) → Λ_ω given by integration, the polarised orientation and the conjugation naturality at all embeddings are C6's (the ER.1 part's C6 request).
- **Homology.** H_1(E(ℂ), ℤ) is singular homology, with its coordinate loops and integral intersection pairing supplied by Tau Ceti AlgebraicTopology stages 5 and 6 (the ER.1 part's two requests). It is not defined as the deck group Λ_ω.
- **The gap.** The parent's gap 'Hurewicz comparison for the first homology of a torus' is replaced by those requests, and no Hurewicz theorem is planned here.
- **The period matrix.** The period matrix and its non-degeneracy, which PeriodsAndSpecialValues PS.0 also uses, are C6's computation.

### All complex embeddings and the conjugation action

`ER.1/all-embeddings-and-the-conjugation-action` · comparison · parent packet

Let E be an elliptic curve over a number field F. For EVERY embedding σ : F → C (embeddings, not places) form E_σ = E ⊗_{F,σ} C with the data of ER.1 (lattice, oriented basis, τ_σ, q_σ). Complex conjugation acts on embeddings by σ ↦ σ̄ (Mathlib's NumberField.ComplexEmbedding.conjugate) and induces an antiholomorphic isomorphism c : E_σ(C) → E_σ̄(C), reversing orientation, with ∫_{c_*γ} σ̄(ω) = conj(∫_γ σ(ω)) for ω defined over F; for bases exchanged by c up to orientation, τ_σ̄ = −conj(τ_σ) and q_σ̄ = conj(q_σ). A real embedding gives a curve over R with the normalisation (1.40) and real q_σ; a pair {σ, σ̄} of complex embeddings gives two curves exchanged by c. On E(C) = ⊔_σ E_σ(C) with the combined involution F_∞, H_1(E(C), R) has dimension 2[F : Q] and each F_∞-eigenspace has dimension r_1 + 2r_2 = [F : Q]. A statement at one embedding is not a statement at all of them.

**Hypotheses.**

- F is a number field; the conjugation action is Mathlib's on embeddings F →+* C (InfinitePlace identifies σ with σ̄ and carries no conjugation action).
- At a real embedding the normalisation (1.40) applies.
- The invariant parts are taken for the combined action on embeddings and on E(C), not for either alone.

**Proof outline.**

1. Record the embeddings with NumberField.ComplexEmbedding.conjugate and IsReal, the places with InfinitePlace.mk_conjugate_eq, and r_1 + 2r_2 = [F : Q] (InfinitePlace.card_add_two_mul_card_eq_rank).
2. Attach to each σ the base change E_σ (EllipticKTheory E.1) and the data of the earlier ER.1 nodes.
3. Conjugation: c(x, y) = (x̄, ȳ) maps E_σ(C) to E_σ̄(C); compute its effect on periods and on oriented bases.
4. Real case: E_σ is defined over R; apply ER.1/the-q-parameter-and-the-multiplicative-presentation.
5. Dimension count: c has eigenvalues +1 and −1 once each on H_1 of a real E_σ and exchanges the two summands of a complex pair.

**Acceptance.**

- Conjugation carries the ER.1 data at σ to that at σ̄, with τ_σ̄ = −conj(τ_σ) and q_σ̄ = conj(q_σ).
- At a real embedding normalised by (1.40), q_σ lies in (−1, 0) ∪ (0, 1).
- Each F_∞-eigenspace of H_1(E(C), R) has dimension r_1 + 2r_2 = [F : Q], not r_1 + r_2.
- A statement at one embedding does not imply the statement at the others.

**Depends on.** this roadmap: `ER.1/the-q-parameter-and-the-multiplicative-presentation`, `ER.1/periods-and-the-comparison-isomorphism`; other roadmaps: `EllipticKTheory:E.1/the-elliptic-curve-as-a-scheme`; libraries: `mathlib:NumberField.InfinitePlace`, `mathlib:NumberField.InfinitePlace.nrRealPlaces`, `mathlib:NumberField.InfinitePlace.nrComplexPlaces`, `mathlib:NumberField.ComplexEmbedding.conjugate`, `mathlib:NumberField.ComplexEmbedding.IsReal`, `mathlib:NumberField.InfinitePlace.mk_conjugate_eq`, `mathlib:NumberField.InfinitePlace.card_add_two_mul_card_eq_rank`.

**Needed by.** this roadmap: `ER.2/the-deligne-cohomology-target`, `ER.5/the-CM-setup-and-the-hecke-character`, `ER.1/conjugate-oriented-periods`, `ER.1/regulator-period-handoff`, `ER.2/archimedean-orbit-equivalence`, `ER.5/unit-factor-cancellation-certificate`.

**Sources.**

- `Brunault.These.2005`, Remarque 20, p. 22: “Lorsque la courbe elliptique E est définie sur R, il existe un dilogarithme elliptique DE bien défini au signe près. Pour voir cela, choisissons une orientation de E(R).” — The real case, verbatim; the number-field bookkeeping is the stage text's, not the source's.

**Assembly note.** The ER.1 part imports this node by id, for this use: Use actual coefficient embeddings, their base changes and the full disjoint-union rank count.

**Assembly note.** The bases exchanged by conjugation are constructed in `ER.1/conjugate-oriented-periods` (γ1_bar = c_*γ1, γ2_bar = −c_*γ2, so τ̄ = −conj(τ) and q̄ = conj(q)). At a real embedding these need not be the chosen real-adapted basis: for the half-integral real shape, τ̄ = τ − 1.

### Chosen oriented periods for an elliptic regulator

`ER.1/oriented-regulator-period-data` · definition · planet “Oriented period basis” · ER.1 part

Given the genuine integration map H1_sing(E(C),Z) → Λ_ω imported from C6 and a positively oriented integral basis (γ1,γ2), set ω_j=∫_γ_j ω. RegulatorPeriods consists of the existing Mathlib PeriodPair (ω1,ω2), together with Im(ω2/ω1)>0. It does not store an elliptic curve, homology, a comparison matrix or an assumed comparison theorem. Set τ=ω2/ω1 in UpperHalfPlane, q=qParam 1 τ and normalise(z)=z/ω1. A nonzero rescaling ω↦c ω gives scale(D,c) with both periods multiplied by c; τ and the normalised coordinate are independent of this differential choice when the unnormalised coordinate is also rescaled.

**Hypotheses.**

- E is a smooth proper elliptic curve over C with origin and nonzero invariant differential ω.
- For number fields work separately at each actual embedding; the periods come from the imported integration map, never arbitrary assigned values.
- The pair is independent over R and the integral basis is positively oriented for the complex structure.

**Construction.**

1. Import E(C), the group-compatible uniformisation and its differential compatibility from R12.1.
2. Use the Stage 5 torus singular-homology calculation and C6 integration compatibility to obtain the two periods from actual coordinate loops. The lattice map is integration, not a definition of H1 as the deck group.
3. Use C6’s polarized elliptic computation and the Stage 6 intersection sign to obtain Im(ω2/ω1)>0. Package exactly the PeriodPair and that inequality.
4. Define τ, q and normalise using existing library objects. Scaling the differential multiplies all its integrals by c, which cancels in the displayed ratios.

**API.**

- `TauCeti.EllipticRegulator.RegulatorPeriods.tau` (data): The upper-half-plane point ω2/ω1.
- `TauCeti.EllipticRegulator.RegulatorPeriods.q` (data): Evaluate the existing qParam with h=1 at τ.
- `TauCeti.EllipticRegulator.RegulatorPeriods.normalise` (data): The scalar coordinate z/ω1.
- `TauCeti.EllipticRegulator.RegulatorPeriods.square` (constructor): The period data with ω1=1, ω2=i.
- `TauCeti.EllipticRegulator.RegulatorPeriods.scale` (constructor): For c≠0 multiply both periods by c and retain positive orientation.
- `TauCeti.EllipticRegulator.RegulatorPeriods.ext` (extensionality): Equality of both complex periods implies equality of the data, by proof irrelevance.
- `TauCeti.EllipticRegulator.RegulatorPeriods.tau_eq` (simp): The underlying complex number of τ is ω2/ω1.
- `TauCeti.EllipticRegulator.RegulatorPeriods.q_eq` (compatibility): q is exactly Function.Periodic.qParam 1 τ.
- `TauCeti.EllipticRegulator.RegulatorPeriods.normalise_eq` (simp): normalise(z)=z/ω1.
- `TauCeti.EllipticRegulator.RegulatorPeriods.square_periods` (simp): The square construction has first period 1 and second period i.
- `TauCeti.EllipticRegulator.RegulatorPeriods.scale_periods` (simp): The first and second periods of scale(D,c) are c ω1 and c ω2.
- `TauCeti.EllipticRegulator.RegulatorPeriods.scale_tau` (relation): The upper-half-plane point of scale(D,c) is τ(D).
- `TauCeti.EllipticRegulator.RegulatorPeriods.scale_normalise` (relation): normalise(scale(D,c),c·z)=normalise(D,z).
- `TauCeti.EllipticRegulator.RegulatorPeriods.scale_one` (functoriality): Scaling by the nonzero scalar 1 gives the original datum.
- `TauCeti.EllipticRegulator.RegulatorPeriods.scale_mul` (functoriality): For nonzero c and d, scale(scale(D,c),d)=scale(D,d·c); both periods and unnormalized coordinates carry this same action.

**Unit tests.**

- `TauCeti.EllipticRegulator.RegulatorPeriods.test_square_tau` (computation): The square datum has τ=i.
- `TauCeti.EllipticRegulator.RegulatorPeriods.test_square_q` (computation): The square datum has q=exp(-2·π), as an exact real scalar in C.
- `TauCeti.EllipticRegulator.RegulatorPeriods.test_scale_identity` (degenerate): Scaling by 1 returns the same data.
- `TauCeti.EllipticRegulator.RegulatorPeriods.test_q_compatibility` (compatibility): q(D)=Function.Periodic.qParam 1 τ(D).
- `TauCeti.EllipticRegulator.RegulatorPeriods.test_negative_orientation` (non-example): There is no RegulatorPeriods with periods (1,-i).

**Acceptance.**

- The square pair (1,i) is accepted; (1,-i) is rejected although it is a Mathlib PeriodPair.
- A lattice is the existing PeriodPair.lattice, with the existing latticeBasis and latticeEquivProd; no private lattice or H1 carrier is introduced.

**Uses.**

- Brunault (1.40), and EllipticRegulators:ER.2: Normalise the holomorphic differential by its real positive-cycle period.
- EllipticRegulators:ER.3 and ER.4: Supply the oriented additive coordinate and existing qParameter for orbit sums and divisor lifts.

**Depends on.** layers of other roadmaps: `ModularCurvesPartII:R12.1`, `ComplexComparisonPartII:C6`; Tau Ceti roadmap layers: `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`; libraries: `mathlib:PeriodPair`, `mathlib:PeriodPair.lattice`, `mathlib:PeriodPair.latticeBasis`, `mathlib:PeriodPair.latticeEquivProd`, `mathlib:UpperHalfPlane`, `mathlib:Function.Periodic.qParam`, `tauceti:AddCircle.prodFundamentalGroupMulEquiv`, `tauceti:WeierstrassCurve.Affine.invariantDifferential`.

**Needed by.** this roadmap: `ER.1/oriented-basis-transport`, `ER.1/conjugate-oriented-periods`, `ER.1/real-period-shape`, `ER.1/primitive-real-regulator-cycles`, `ER.1/regulator-period-handoff`.

**Lean.** module `TauCeti/NumberTheory/EllipticRegulator/Periods`, namespace `TauCeti.EllipticRegulator`; declaration `TauCeti.EllipticRegulator.RegulatorPeriods`.

**Sources.**

- `Brunault.These.2005`, Remarque 20, (1.40), p.22: “choisissons une orientation” — The periods and normalized coordinates are read from integrals on an oriented singular-homology basis, not chosen as a matrix.

### Transport of a chosen oriented integral period basis

`ER.1/oriented-basis-transport` · construction · planet “Change of period basis” · ER.1 part

For M=(a b;c d) in the existing SL2(Z), rebase(D,M) has periods (d·ω1+c·ω2,b·ω1+a·ω2). It retains the same integral lattice and positive orientation. Its τ is (a·τ+b)/(c·τ+d) and its normalized coordinate is normalise(D,z)/(c·τ+d). With this convention rebase(rebase(D,N),M)=rebase(D,M·N). These are the coordinate laws for the chosen-basis part of the parent normalised uniformisation; no new uniformisation is constructed.

**Hypotheses.**

- D is RegulatorPeriods.
- M is an integral determinant-one matrix. Determinant-minus-one changes orientation and is excluded.

**Construction.**

1. The integral change of basis is J·M·J on the column (ω1,ω2), where J swaps the coordinates. Its determinant is 1.
2. The inverse integral matrix proves equality of the two period spans.
3. The first new period is ω1·(c·τ+d), which is nonzero because τ is nonreal. Divide both new periods by it.
4. Compute Im(τ_new)=Im(τ)/norm(c·τ+d)^2>0. Matrix multiplication proves identity and composition.

**API.**

- `TauCeti.EllipticRegulator.RegulatorPeriods.rebase_periods` (simp): The new ordered periods are (d·ω1+c·ω2,b·ω1+a·ω2).
- `TauCeti.EllipticRegulator.RegulatorPeriods.rebase_one` (functoriality): Rebasing by the identity gives D.
- `TauCeti.EllipticRegulator.RegulatorPeriods.rebase_mul` (functoriality): Rebasing first by N then by M equals rebasing by M·N.
- `TauCeti.EllipticRegulator.RegulatorPeriods.rebase_lattice` (compatibility): The Mathlib PeriodPair lattice is unchanged.
- `TauCeti.EllipticRegulator.RegulatorPeriods.rebase_tau` (relation): τ_new=(a·τ+b)/(c·τ+d).
- `TauCeti.EllipticRegulator.RegulatorPeriods.rebase_normalise` (relation): normalise_new(z)=normalise(z)/(c·τ+d).

**Unit tests.**

- `TauCeti.EllipticRegulator.RegulatorPeriods.test_rebase_identity` (degenerate): Rebasing by the identity gives D.
- `TauCeti.EllipticRegulator.RegulatorPeriods.test_rebase_inverse` (characterisation): Rebasing by M and then its inverse recovers D. For the existing ModularGroup.S, τ becomes -1/τ and normalise(z) becomes normalise(D,z)/τ for every z; this also tests the matrix-entry convention.
- `TauCeti.EllipticRegulator.RegulatorPeriods.test_rebase_integral_lattice` (compatibility): Rebasing by any M preserves the exact Mathlib Z-submodule of C. For the existing ModularGroup.T, τ becomes τ+1, normalise(z) is unchanged for every z, and q is unchanged.
- `TauCeti.EllipticRegulator.RegulatorPeriods.test_rebase_minus_identity` (non-example): Rebasing by -I fixes τ but negates normalise(1).

**Acceptance.**

- T=(1 k;0 1) gives τ+k, the same normalized coordinate and the same q.
- S=(0 -1;1 0) gives -1/τ and divides the coordinate by τ.
- Minus the identity fixes τ and sends the coordinate to its negative; it must not act trivially on coordinates.

**Uses.**

- Brunault (1.36)–(1.40), EllipticRegulators:ER.3: Separate the basis dependence of the coordinate from invariance under integer translation of τ.
- Parent ER.1/complex-uniformisation: Give an explicit coordinate implementation of its change-of-basis formula without planning the underlying analytic isomorphism again.

**Depends on.** this roadmap: `ER.1/oriented-regulator-period-data`, `ER.1/complex-uniformisation`; libraries: `mathlib:Matrix.SpecialLinearGroup`, `mathlib:PeriodPair.lattice`, `mathlib:ModularGroup.S`, `mathlib:ModularGroup.T`.

**Needed by.** this roadmap: `ER.1/conjugate-oriented-periods`.

**Lean.** module `TauCeti/NumberTheory/EllipticRegulator/Periods`, namespace `TauCeti.EllipticRegulator`; declaration `TauCeti.EllipticRegulator.RegulatorPeriods.rebase`.

**Sources.**

- `Brunault.These.2005`, (1.36) and Remarque 20, (1.40), pp.21–22: “forme une base directe” — Derived by changing the displayed oriented integral basis; the explicit algebra is given in the proof steps.

### Oriented period data at a conjugate embedding

`ER.1/conjugate-oriented-periods` · construction · planet “Conjugate periods” · ER.1 part

Conjugate(D) has periods (conj(ω1),-conj(ω2)). It is oriented, involutive, and has τ_bar=-conj(τ), q_bar=conj(q). Its normalise(conj(z)) equals conj(normalise(z)), and its existing Mathlib lattice is the complex conjugate of the original lattice. Geometrically at a pair of distinct conjugate embeddings choose γ1_bar=c_*γ1 and γ2_bar=-c_*γ2. At a real embedding these are generally a different basis of the same curve: for the half-integral real shape τ_bar=τ-1. They are not asserted to be the same chosen basis.

**Hypotheses.**

- D is RegulatorPeriods; coefficient conjugation and the antiholomorphic base-change map are those of the parent all-embeddings node.
- The sign on the second basis vector compensates for orientation reversal.

**Construction.**

1. Conjugation reverses complex orientation. Negation of the second vector restores it, since Im(-conj(τ))=Im(τ).
2. Complex conjugation of the integration pairing is imported from C6 and the parent all-embeddings node.
3. Compute both period ratios and normalized coordinates. Use the existing exponential definition to compute q(-conj(τ))=conj(q(τ)).
4. Negation of one integral lattice generator does not change its span. Conjugating twice returns the original two periods.

**API.**

- `TauCeti.EllipticRegulator.RegulatorPeriods.conjugate_periods` (simp): The periods are (conj(ω1),-conj(ω2)).
- `TauCeti.EllipticRegulator.RegulatorPeriods.conjugate_involutive` (functoriality): Applying conjugate twice returns D.
- `TauCeti.EllipticRegulator.RegulatorPeriods.conjugate_tau` (relation): τ(conjugate(D))=-conj(τ(D)).
- `TauCeti.EllipticRegulator.RegulatorPeriods.conjugate_q` (relation): q(conjugate(D))=conj(q(D)).
- `TauCeti.EllipticRegulator.RegulatorPeriods.conjugate_normalise` (compatibility): normalise(conjugate(D),conj(z))=conj(normalise(D,z)).
- `TauCeti.EllipticRegulator.RegulatorPeriods.conjugate_lattice` (compatibility): z belongs to the conjugate period lattice iff conj(z) belongs to the original Mathlib lattice.

**Unit tests.**

- `TauCeti.EllipticRegulator.RegulatorPeriods.test_conjugate_square` (computation): The square pair is fixed.
- `TauCeti.EllipticRegulator.RegulatorPeriods.test_conjugate_twice` (degenerate): Conjugate is an involution.
- `TauCeti.EllipticRegulator.RegulatorPeriods.test_conjugate_scalar` (compatibility): Conjugate(scale(D,c))=scale(conjugate(D),conj(c)).
- `TauCeti.EllipticRegulator.RegulatorPeriods.test_conjugate_not_lower_half_plane` (non-example): Im(τ(conjugate(D)))>0. In addition, for D0=rebase(square,ModularGroup.T), τ(D0)=1+i and τ(conjugate(D0))=-1+i; the construction must conjugate the real part as well as restore orientation.

**Acceptance.**

- Conjugating the square pair returns it.
- Conjugating a scaled pair conjugates the scale as well.
- The conjugate datum lies in the upper, not lower, half-plane.

**Uses.**

- DJZ Remark 3.14; EllipticRegulators:ER.2: Carry the actual period data over every embedding and the combined conjugation action.
- Parent ER.1/all-embeddings-and-the-conjugation-action: Make its positive-orientation correction explicit for the chosen periods.

**Depends on.** this roadmap: `ER.1/oriented-regulator-period-data`, `ER.1/all-embeddings-and-the-conjugation-action`, `ER.1/oriented-basis-transport`; layers of other roadmaps: `ComplexComparisonPartII:C6`; libraries: `mathlib:NumberField.ComplexEmbedding.conjugate`.

**Needed by.** this roadmap: `ER.1/exponential-conjugation-coordinates`, `ER.1/regulator-period-handoff`.

**Lean.** module `TauCeti/NumberTheory/EllipticRegulator/Periods`, namespace `TauCeti.EllipticRegulator`; declaration `TauCeti.EllipticRegulator.RegulatorPeriods.conjugate`.

**Sources.**

- `Brunault.These.2005`, Remarque 20 and (1.40), p.22: “choisissons une orientation” — Real normalization and orientation; the paired nonreal case follows by conjugating the integration formula.
- `DJZ.2005v2`, Remark 3.14, Section 3, p.7: “using all embeddings” — Conjugation swaps nonreal embedding components rather than acting separately on infinite places.

### Real-adapted periods and the sign of q

`ER.1/real-period-shape` · theorem · planet “Real period normalization” · ER.1 part

For D with conj(ω1)=ω1 and conj(ω2)=-ω2+m·ω1, m an integer, 2·Re(τ)=m. In a real-adapted oriented basis with γ1 primitive in H1^+, the integral replacement γ2↦γ2+k·γ1 changes m by 2k. Choose m=0 or 1; then Re(τ)=0 or 1/2 respectively. In the first case q=exp(-2·π·Im(τ))>0; in the second q=-exp(-2·π·Im(τ))<0. Both have imaginary part zero and 0<norm(q)<1. Existence of the real-adapted basis is the parent real-normalisation input, not a new elliptic Hodge theorem.

**Hypotheses.**

- The real assertions concern an elliptic curve over R and a real nonzero invariant differential.
- γ1 is the primitive positive generator of the conjugation-fixed integral sublattice, not an arbitrary real multiple.
- The shape formula for general D assumes the displayed conjugation relation; m is an integer.

**Proof outline.**

1. Conjugation reverses orientation, fixes γ1 and acts by -1 on the quotient by its fixed sublattice; use C6’s elliptic pairing to obtain the displayed integral relation.
2. Divide the relation by the real nonzero ω1 and take real parts.
3. Reduce m modulo 2 by the stated integral basis shear; its parity is unchanged.
4. Evaluate the existing exponential at τ=i·y or τ=1/2+i·y. Its phase is 1 or -1; use qParam_ne_zero and norm_qParam_lt_one.

**Acceptance.**

- For periods (1,i), m=0 and q=exp(-2·π).
- For periods (1,1/2+i), m=1 and q=-exp(-2·π); a real curve need not have positive q.
- Reversing the orientation of E(R) negates both basis vectors, preserves τ and q and inverts the multiplicative point coordinate.

**Depends on.** this roadmap: `ER.1/oriented-regulator-period-data`, `ER.1/complex-uniformisation`; layers of other roadmaps: `ComplexComparisonPartII:C6`; libraries: `mathlib:Function.Periodic.norm_qParam`, `mathlib:Function.Periodic.norm_qParam_lt_one`, `mathlib:Function.Periodic.qParam_ne_zero`.

**Needed by.** this roadmap: `ER.1/primitive-real-regulator-cycles`.

**Lean.** module `TauCeti/NumberTheory/EllipticRegulator/Periods`, namespace `TauCeti.EllipticRegulator`; declarations `TauCeti.EllipticRegulator.RegulatorPeriods.real_period_shape`, `TauCeti.EllipticRegulator.RegulatorPeriods.real_q_sign`.

**Sources.**

- `Brunault.These.2005`, Remarque 20, (1.40)–(1.41), p.22: “est un nombre réel non nul” — The source asserts real nonzero q and its dependence on E; the parity/sign formulas follow explicitly from the real-adapted integral basis.

### Primitive real regulator cycles and their index

`ER.1/primitive-real-regulator-cycles` · theorem · planet “Primitive regulator cycle” · ER.1 part

In the real-adapted ordered integral basis with m=0 or 1, conjugation sends (u,v) to (u+m·v,-v). Its positive integral eigensublattice is Z·(1,0). For m=0 its negative integral eigensublattice is Z·(0,1), with normalized period i·Im(τ). For m=1 it is Z·(-1,2), with normalized period 2·i·Im(τ). The sum of the two integral eigensublattices is the whole Z^2 for m=0 and is the subgroup of pairs with even second coordinate, of index two, for m=1. Over R both eigenspaces have dimension one. The rational anti-eigenvector (-1/2,1) in the m=1 case is not an integral generator.

**Hypotheses.**

- The integral singular-period identification and orientation are supplied by C6 and the upstream torus homology/intersection inputs.
- m is reduced to 0 or 1, and the displayed conjugation relation holds.

**Proof outline.**

1. Conjugate u·ω1+v·ω2 using the real period relation.
2. Solve (u+m·v,-v)=(u,v), which forces v=0.
3. Solve (u+m·v,-v)=(-u,-v), namely 2u+m·v=0: for m=0 use (0,1), for m=1 use (-1,2). These vectors are primitive.
4. The determinant of the two eigen-generators is 1 or 2. In the second case their span is exactly the pairs with even v.
5. Divide their actual periods by ω1. The real part cancels, giving i·y or 2·i·y.
6. For m=1 map (u,v) to v modulo 2. This is a surjective additive homomorphism with kernel the span of (1,0) and (-1,2); its two cosets prove that the existing AddSubgroup.index is exactly 2.

**Acceptance.**

- The half-integral real shape has an integral anti-cycle with twice the normalized imaginary period, not i·y.
- An anti-invariant functional vanishes on γ1; evaluation on the negative generator is twice its evaluation on γ2 when m=1.
- Use exact integral kernels rather than substituting a direct-sum decomposition over Z.

**Depends on.** this roadmap: `ER.1/oriented-regulator-period-data`, `ER.1/real-period-shape`; layers of other roadmaps: `ComplexComparisonPartII:C6`; libraries: `mathlib:PeriodPair.latticeEquivProd`, `mathlib:Subgroup.closure`, `mathlib:Subgroup.index`.

**Needed by.** this roadmap: `ER.1/regulator-period-handoff`, `ER.8/frobenius-regulator-scalar`, `ER.8/neron-refinement-period-dictionary`.

**Lean.** module `TauCeti/NumberTheory/EllipticRegulator/Periods`, namespace `TauCeti.EllipticRegulator`; declarations `TauCeti.EllipticRegulator.RegulatorPeriods.real_conjugation_coordinates`, `TauCeti.EllipticRegulator.RegulatorPeriods.positive_cycle_coordinates`, `TauCeti.EllipticRegulator.RegulatorPeriods.negative_cycle_coordinates_zero`, `TauCeti.EllipticRegulator.RegulatorPeriods.negative_cycle_coordinates_one`, `TauCeti.EllipticRegulator.RegulatorPeriods.negative_cycle_period_zero`, `TauCeti.EllipticRegulator.RegulatorPeriods.negative_cycle_period_one`, `TauCeti.EllipticRegulator.RegulatorPeriods.eigensublattice_index_two`.

**Sources.**

- `Brunault.These.2005`, Remarque 20, p.22 and (1.48), p.23: “forme une base directe” — The oriented integral homology basis identifies periods with the lattice; the matrix, primitive kernels and index follow by the displayed integral calculation.
- `DJZ.2005v2`, Section 3, paragraph before (3.4), p.5: “the anti-invariants” — The regulator is evaluated on integral anti-invariants; rational eigenspaces do not choose its integral normalization.

### Conjugation in multiplicative period coordinates

`ER.1/exponential-conjugation-coordinates` · theorem · ER.1 part

For every z in C, qParam 1 (conj(z))=1/conj(qParam 1 z), and qParam 1 (-z)=1/qParam 1 z. These are point-coordinate identities, distinct from the modulus identity q(-conj(τ))=conj(q(τ)). Hence, in the inherited multiplicative presentation, conjugation from E_σ to E_σ_bar is [x]↦[1/conj(x)], between the quotients with moduli q and conj(q). This is well-defined because q^n maps to conj(q)^(-n). In the real-normalized case it is an involution on the same quotient. A representative of modulus one is fixed; the second fixed circle for positive real q is fixed in the quotient, rather than pointwise before quotienting.

**Hypotheses.**

- Use the inherited exponential-induced group presentation; x is nonzero.
- The paired embedding modulus is conj(q); real moduli include both signs.

**Proof outline.**

1. Conjugate exp(2·π·i·z), observing that conjugation sends i to -i.
2. Use exp(-w)=1/exp(w), so both displayed identities are exact.
3. For a q^n multiple compute its image as a conj(q)^(-n) multiple; invoke the parent quotient presentation.
4. When q>0 and norm(x)^2=q, 1/conj(x)=x/q, so equality is a quotient equality.

**Acceptance.**

- At z=i/2, conjugation changes exp(-π) to exp(π); it does not merely conjugate exp(-π).
- For positive q and norm(x)^2=q, the images differ by q^(-1) before quotienting.
- Orientation reversal gives inversion [x]↦[1/x].

**Depends on.** this roadmap: `ER.1/the-q-parameter-and-the-multiplicative-presentation`, `ER.1/conjugate-oriented-periods`; libraries: `mathlib:Function.Periodic.qParam`.

**Lean.** module `TauCeti/NumberTheory/EllipticRegulator/Periods`, namespace `TauCeti.EllipticRegulator`; declarations `TauCeti.EllipticRegulator.RegulatorPeriods.exponential_conjugate`, `TauCeti.EllipticRegulator.RegulatorPeriods.exponential_neg`.

**Sources.**

- `Brunault.These.2005`, (1.36)–(1.37), p.21; Remarque 20, p.22: “Composons η” — Derived conjugation and inversion laws for the displayed exponential presentation.

### Normalized differential and period handoff to the regulator

`ER.1/regulator-period-handoff` · theorem · planet “Normalized invariant differential” · ER.1 part

For the inherited normalized uniformisation η and the chosen period datum D, the normalized holomorphic differential is ω/ω1=η^*dz, with integrals 1 and τ on γ1 and γ2. The existing qParam gives the same nonzero modulus q with norm less than one. For E over R, γ1 is the positive primitive real cycle and ∫_γ1(ω/ω1)=1. For E over a number field carry this statement at every embedding, with conjugation acting simultaneously on coefficients, the curve and its homology; the conjugate-oriented construction supplies compatible bases for pairs of nonreal embeddings. The parent all-embeddings comparison gives rank(H1^±)=r1+2·r2=[F:Q], not r1+r2. The primitive negative cycles specified here fix the period-coordinate convention for ER.2. No universal Chern/Deligne factor, including its 2·π, is chosen here.

**Hypotheses.**

- All curves, differential comparisons and integration maps are the imported geometric ones.
- At a real embedding use a real-adapted basis. At distinct conjugate embeddings choose γ1_bar=c_*γ1 and γ2_bar=-c_*γ2.
- The rank statement uses the disjoint union over all embeddings, not the set of infinite places.

**Proof outline.**

1. Apply the parent normalized-uniformisation pullback formula and divide the actual period integrals by ω1.
2. Use the existing qParam nonvanishing and norm theorem, with Im(τ)>0.
3. For each conjugate pair apply the constructed conjugate period basis; at a real embedding use its real-adapted basis and primitive negative cycle calculation.
4. Import the parent all-embeddings rank statement and its Mathlib number-field identity. The disjoint union has total rank 2·[F:Q], and each sign has rank [F:Q].

**Acceptance.**

- The positive period is exactly 1; an unspecified nonzero period is insufficient.
- For the half-integral real shape the primitive negative-cycle period is 2·i·Im(τ).
- A complex pair contributes two real dimensions to each eigenspace, not one.

**Depends on.** this roadmap: `ER.1/oriented-regulator-period-data`, `ER.1/complex-uniformisation`, `ER.1/all-embeddings-and-the-conjugation-action`, `ER.1/primitive-real-regulator-cycles`, `ER.1/conjugate-oriented-periods`; other roadmaps: `ComplexComparisonPartII:C5/repair-proper-de-rham-betti`; layers of other roadmaps: `ComplexComparisonPartII:C5`, `ComplexComparisonPartII:C6`; libraries: `mathlib:Function.Periodic.norm_qParam_lt_one`, `mathlib:Function.Periodic.qParam_ne_zero`, `mathlib:NumberField.ComplexEmbedding.conjugate`, `mathlib:NumberField.ComplexEmbedding.involutive_conjugate`, `mathlib:NumberField.InfinitePlace.card_add_two_mul_card_eq_rank`.

**Needed by.** this roadmap: `ER.8/neron-refinement-period-dictionary`, `ER.8/cm36-full-torsion-certificate`.

**Lean.** module `TauCeti/NumberTheory/EllipticRegulator/Periods`, namespace `TauCeti.EllipticRegulator`; declarations `TauCeti.EllipticRegulator.RegulatorPeriods.regulator_period_handoff`.

**Sources.**

- `Brunault.These.2005`, Proposition 26, (1.64), p.26; Remarque 20, (1.40), p.22: “l’unique forme différentielle” — The real normalized differential integrates to 1 on the neutral real component; its geometric identity is inherited.
- `DJZ.2005v2`, Remark 3.14, Section 3, p.7: “using all embeddings” — The combined action and the integral anti-invariant rank are taken over the entire disjoint union.

## ER.2 — Deligne cohomology and the symbol regulator

*10 nodes: 5 from the parent packet and 5 from the ER.2 part. Planets (4): The Deligne regulator target; The symbol regulator; Archimedean orbit equivalence; Archimedean dimension formula.*

The layer computes the target of the archimedean regulator of an elliptic curve and pins the normalisation of the regulator on symbols. It owns no general Deligne theory and no general curve regulator.

- **Imported.** The real Deligne complex, its hypercohomology, products, cone sequence and the universal (Chern-character) regulator belong to an early part of MotivicEtaleKTheory M.8 (confirmed findings RT-AREA-ktheory-2/7 and /24). The form η(f, g) with its Steinberg identity, residues and period statements belongs to Polylogarithms P.5. The additive Betti–de Rham comparison is `ComplexComparisonPartII:C5/repair-proper-de-rham-betti`, and the restriction to the function field and lift independence are EllipticKTheory E.3's.
- **The parent packet** plans:
  - the target H²_D(E_ℝ, ℝ(2)) ≅ H¹(E(ℂ), ℝ(1))⁻, of dimension [F : ℚ] = r₁ + 2r₂, with its identification with ℝ for F = ℚ through ω_0 = η^*dz;
  - Brunault's regulator r_E{f, g}(ω) = ∫ log|f| ω ∧ ∂̄ log|g| (with ∂̄, not d^c), its Steinberg relation and its period formula;
  - the factor fixed in the same source, r_Beil = 2r_E (Brunault, Proposition 67);
  - the vanishing of the regulator on the torsion ambiguity of a lift.
- **The ER.2 part** adds:
  - the elliptic specialisation of the Deligne exact sequence, with F²H¹_dR = 0 because Ω^j = 0 for j ≥ 2 on a curve;
  - an explicit orbit-coordinate equivalence of the target, one real coordinate per real place and two per complex place, and the dimension count derived from it;
  - the comparison of Schneider's Chern-character and cup-product signs with Brunault's convention, giving W(r_D) = 2r_E independently of any L-value;
  - the oriented real coordinate for E/ℚ: −2πa(γ₂) = −∮_{γ₂} η = 2 Im r_E(ω₀), with its behaviour under a change of transverse cycle and of orientation.

The layer is planned, not closed. The early M.8 export (the Deligne complex and the universal regulator with no ER input) does not exist yet; it is the ER.2 part's gap and the parent's first and thirteenth gaps. The ER.6 part asks this layer for one more interface: the Betti ℚ-structure B = H¹(E(ℂ), ℚ(1))⁻ with R ⊗_ℚ B ≅ H²_D(E_ℝ, ℝ(2)) and its determinant line, which no node supplies yet (see Requests).

**Coverage.**

- **In the parent packet: partial.** The Deligne complex is M.8's and η(f, g) is P.5's (RT-AREA-ktheory-2/7, /24; Polylogarithms review); ER.2 keeps the elliptic target with its dimension [F : Q] and normalisation, the regulator r_E of (1.27) with Steinberg relation, periods and the torsion-ambiguity statement, and the normalisation factor fixed by Brunault's Proposition 67 (r_Beil = 2 r_E). Revised by REV-EllipticRegulators.
  - Remaining: The early Deligne-complex part of M.8 (requested).
  - Remaining: Comparison of Schneider's normalisation with the universal regulator (gap).
- **In the ER.2 part: planned.** 
  - Remaining: Instantiate the generic Deligne cone, comparison, products and Chern-character regulator from an acyclic early M.8 export; its stage split and declarations are not yet supplied.
  - Remaining: Replace the period-model Lean prototypes by actual cohomological signatures when the imported C5/ER.1 and early M.8 types are available; no cohomology implementation is claimed.
  - Target “Real Deligne complex and hypercohomology”: Early M.8 supplier contract; gap recorded; no ER.2 ownership
  - Target “Elliptic target, all embeddings, conjugation and dimension”: `ER.2/the-deligne-cohomology-target`, `ER.2/elliptic-deligne-specialisation-contract`, `ER.2/archimedean-orbit-equivalence`, `ER.2/archimedean-rank-from-orbits`
  - Target “η, Steinberg and zeros/poles; independence of cuts and punctured cycles”: `Polylogarithms:P.5/weight-two-regulator-form`, `Polylogarithms:P.5/unramified-weight-two-class`, `ER.2/the-eta-form-and-its-differential-identity`, `ER.2/the-regulator-on-symbols`
  - Target “Universal comparison, 2π and orientation”: `ER.2/the-normalisation-factor`, `ER.2/chern-character-symbol-comparison`, `ER.2/oriented-period-coordinate-comparison`
  - Target “Restriction image and torsion ambiguity”: `ER.2/torsion-ambiguity-has-zero-regulator`, `EllipticKTheory:E.3/what-the-sequence-does-not-identify`

### The regulator target H²_D(E_R, R(2)) of an elliptic curve, its dimension and its normalisation

`ER.2/the-deligne-cohomology-target` · construction · planet “The Deligne regulator target” · parent packet

The real Deligne complex R(2)_D, its hypercohomology, products and long exact sequence are imported from MotivicEtaleKTheory M.8 (its early part; confirmed findings RT-AREA-ktheory-2/7 and /24). For an elliptic curve E over a number field F, with E(C) = ⊔_σ E_σ(C) and F_∞ as in ER.1, this node computes the target. (a) The exact sequence 0 → F²H^1_dR(E_C) → H^1(E(C), R(1)) → H^2_D(E_C, R(2)) → 0 with F²H^1_dR = 0 gives H^2_D(E_C, R(2)) ≅ H^1(E(C), R(1)), and H^2_D(E_R, R(2)) is the part fixed by the de Rham conjugation, i.e. H^1(E(C), R(1))^−, the classes anti-invariant under c^* (Brunault Lemma 61). (b) [ν] ↦ (ω ↦ ∫_{E(C)} ν ∧ ω) is an isomorphism H^1(E(C), R(1)) ≅ Hom_C(Ω^{1,0}(E_C), C) carrying H^1(E(C), R(1))^− onto Hom_R(Ω^{1,0}_R, R(1)) (Lemma 62 with d = 1). (c) dim_R H^2_D(E_R, R(2)) = r_1 + 2r_2 = [F : Q]; it is 1 for F = Q. (d) For F = Q the identification with R is φ ↦ φ(ω_0)/i with ω_0 = η^*dz, the unique holomorphic differential with ∫_{E^0(R)} ω_0 = 1 (Brunault Proposition 26); another normalisation changes it by a non-zero real factor, and reversing the orientation of E(R) changes its sign.

**Hypotheses.**

- E is an elliptic curve over a number field F; E(C) = ⊔_σ E_σ(C) with the involution F_∞ of ER.1/all-embeddings-and-the-conjugation-action (Brunault states Lemmas 61 and 62 for an abelian variety over Q; for F ≠ Q they are applied to E viewed over Q, componentwise).
- The Deligne complex and its exact sequence are M.8's (requested); Brunault recalls them from Schneider [65] and Nekovář [52], and this node uses that normalisation.
- The identification with R in (d) is not canonical: it depends on the orientation through ω_0.

**Construction.**

1. Import from M.8 the complex R(2)_D, its hypercohomology and the sequence 0 → F²H^1_dR → H^1(·, R(1)) → H^2_D(·, R(2)) → 0 for a smooth projective curve over C.
2. F²H^1_dR(E_C) = 0 for a curve (Hodge filtration, Brunault (2.97)); the de Rham conjugation is [ν] ↦ [conj c^*ν] = −[c^*ν], so the real part is H^1(E(C), R(1))^− (Lemma 61).
3. Lemma 62: [ν] ↦ (ω ↦ ∫ ν ∧ ω) is injective by the Hodge decomposition and Poincaré duality, hence bijective; the computation (2.104) with d = 1 identifies the minus part with Hom_R(Ω^{1,0}_R, R(1)).
4. Dimension: H^1(E(C), R) has dimension 2[F : Q]; c^* exchanges the two summands of a complex pair and has eigenvalues +1 and −1 once each on a real summand, so dim H^1(E(C), R(1))^− = r_1 + 2r_2 = [F : Q] (mathlib InfinitePlace.card_add_two_mul_card_eq_rank).
5. For F = Q evaluate at ω_0 = η^*dz (ER.1/complex-uniformisation with (1.40)); ∫_{E^0(R)} ω_0 = 1 fixes ω_0 up to the orientation.

**API.**

- `ellipticDeligneTarget` (data): H^1(E(C), R(1))^−, with its comparison isomorphism to M.8's H^2_D(E_R, R(2)).
- `ellipticDeligneTarget_equivHom` (equivalence): [ν] ↦ (ω ↦ ∫ ν ∧ ω) onto Hom_R(Ω^{1,0}_R, R(1)) (Lemma 62).
- `ellipticDeligneTarget_finrank` (characterisation): dim_R = r_1 + 2r_2 = [F : Q].
- `ellipticDeligneTarget_toReal` (data): For E/Q: φ ↦ φ(ω_0)/i with ω_0 = η^*dz.
- `ellipticDeligneTarget_toReal_orientation` (relation): Reversing the orientation of E(R) negates toReal.

**Unit tests.**

- `finrank_over_Q` (computation): For E/Q (for instance y² = x³ − x) the target has dimension 1.
- `finrank_over_Qi` (non-example): For y² = x³ − x over Q(i) the target has dimension 2 = r_1 + 2r_2, not r_1 + r_2 = 1.
- `not_the_product` (non-example): ⊕_σ H^1(E_σ(C), R(1)) has dimension 2[F : Q], twice the target's: the target is the anti-invariant part, not the product.
- `real_symbols_land_in_minus` (compatibility): For f, g in Q(E)^× and ω in Ω^{1,0}_R, ∫ η_B(f, g) ∧ ω lies in R(1) = iR (Brunault (2.116)).
- `orientation_sign` (characterisation): Reversing the orientation of E(R) replaces ω_0 by −ω_0 and negates the identification with R.

**Acceptance.**

- H^2_D(E_R, R(2)) ≅ H^1(E(C), R(1))^− ≅ Hom_R(Ω^{1,0}_R(E), R(1)).
- dim_R H^2_D(E_R, R(2)) = r_1 + 2r_2 = [F : Q]: 1 for E/Q, 2 for E over Q(i).
- For E/Q the identification with R is evaluation at ω_0 divided by i; it changes by a non-zero real factor under another normalisation and by −1 under reversal of the orientation.
- The Deligne complex itself is not constructed here.

**Uses.**

- ER.2, the regulator: r_E lands in this group after composition over all embeddings.
- ER.2, the normalisation: Brunault's Proposition 67 is stated in the identification (b).
- ER.6: The Beilinson statement uses the determinant of this [F : Q]-dimensional space.

**Depends on.** this roadmap: `ER.1/periods-and-the-comparison-isomorphism`, `ER.1/all-embeddings-and-the-conjugation-action`, `ER.1/complex-uniformisation`; layers of other roadmaps: `ComplexComparisonPartII:C5`; libraries: `mathlib:NumberField.InfinitePlace.card_add_two_mul_card_eq_rank`.

**Needed by.** this roadmap: `ER.2/the-normalisation-factor`, `ER.6/the-regulator-on-the-integral-part`, `ER.2/elliptic-deligne-specialisation-contract`, `ER.2/archimedean-orbit-equivalence`, `ER.2/oriented-period-coordinate-comparison`, `ER.6/regulator-determinant-in-betti-coordinates`.

**Sources.**

- `Brunault.These.2005`, §2.5, Lemme 61, (2.94), p. 64: “Les groupes de cohomologie de Deligne H2D(AC, R(2)) et H2D(AR, R(2)) sont décrits par le diagramme commutatif [...] où les lignes sont des isomorphismes. Dans ce diagramme, nous avons posé R(1) = 2πiR ⊂ C, et (·)− désigne le sous-espace des éléments anti-invariants par le morphisme c∗” — The target as the anti-invariant part of H^1(A(C), R(1)); here A = E.
- `Brunault.These.2005`, §2.5, Lemme 62, (2.100), p. 65: “Nous avons un isomorphisme H1(A(C), R(1)) → HomC(Ωd,d−1(A(C)), C), [ω] ↦ (α ↦ ∫_{A(C)} ω ∧ α).” — The identification with the dual of the holomorphic differentials (d = 1).
- `Brunault.These.2005`, Proposition 26, p. 26: “et ω = η∗dz ∈ Ω1,0(E(C)) est l'unique forme différentielle vérifiant ∫_{E0(R)} ω = 1, où E0(R) est la composante neutre de E(R).” — The normalised differential that identifies the target with R for E/Q.

**Assembly note.** The ER.2 part reuses this node by id. What it takes from it: Deligne target, wedge duality, dimension, chosen real coordinate and its definition/API/tests.

**Assembly note.** **C5 and the Hodge filtration.** F²H¹_dR = 0 needs no Hodge decomposition from C5. On a curve Ω^j = 0 for j ≥ 2, so the truncated de Rham complex in degrees ≥ 2 is zero (`ER.2/elliptic-deligne-specialisation-contract`; REV-EllipticRegulators--ER.2). The additive comparison is the node `ComplexComparisonPartII:C5/repair-proper-de-rham-betti`, so the stage prerequisite C5 can become that node, together with the ER.2 part's request for conjugation and the oriented pairing.

**Assembly note.** **Requested by ER.6.** The ER.6 part requests from this layer the Betti ℚ-structure B = H¹(E(ℂ), ℚ(1))⁻, where ℚ(1) = 2πiℚ and the minus sign refers to the geometric c^*. It asks for the inclusion of B into H¹(E(ℂ), ℝ(1))⁻, the comparison ℝ ⊗_ℚ B ≅ H²_D(E_ℝ, ℝ(2)), dim_ℚ B = [F : ℚ] and the determinant line. This node computes the real target and its dimension, but it does not expose that rational API, and no node supplies it yet.

### The form η(f, g) on an elliptic curve, specialised from Polylogarithms P.5, and its pairing with holomorphic differentials

`ER.2/the-eta-form-and-its-differential-identity` · lemma · parent packet

The form η(f, g) = log|f| d arg g − log|g| d arg f, its bilinearity and antisymmetry, the identity η(f, 1 − f) = d(D ∘ f), its closedness off the divisors, the current identity dη(f, g) = 2π Σ_x log|tame_x{f, g}| δ_x and its period statements are OWNED by Polylogarithms P.5 (P.5/weight-two-regulator-form, P.5/unramified-weight-two-class) and imported. This node records the two facts that tie it to the source's regulator on an elliptic curve E: Brunault's form η_B(f, g) = log|f| · (∂ − ∂̄) log|g| − log|g| · (∂ − ∂̄) log|f| (2.107) equals i · η(f, g); and for every ω in Ω^{1,0}(E), ∫_{E(C)} η_B(f, g) ∧ ω = 2 ∫_{E(C)} log|f| · ω ∧ ∂̄ log|g| (integration by parts, as in the proof of Brunault's Theorem 68).

**Hypotheses.**

- E is a complex elliptic curve and f, g are in C(E)^×; the integrals converge absolutely since the singularities are logarithmic.
- (∂ − ∂̄) log|g| = i d arg g, because ∂ log|g| = (1/2) dg/g for g meromorphic.

**Proof outline.**

1. Import P.5/weight-two-regulator-form.
2. (∂ − ∂̄) log|g| = (1/2)(dg/g − conj(dg/g)) = i Im(dg/g) = i d arg g, hence η_B = iη.
3. Against ω in Ω^{1,0} only the ∂̄-parts survive: η_B ∧ ω = −log|f| ∂̄ log|g| ∧ ω + log|g| ∂̄ log|f| ∧ ω.
4. Stokes on E minus small discs (boundary terms O(r log² r)): ∫ log|g| ∂̄ log|f| ∧ ω = −∫ log|f| ∂̄ log|g| ∧ ω, hence ∫ η_B ∧ ω = −2 ∫ log|f| ∂̄ log|g| ∧ ω = 2 ∫ log|f| ω ∧ ∂̄ log|g|.

**Acceptance.**

- η_B(f, g) = i η(f, g) with P.5's η.
- ∫_E η_B(f, g) ∧ ω = 2 ∫_E log|f| ω ∧ ∂̄ log|g| for every ω in Ω^{1,0}(E); on E = C/(Z + τZ), τ = 0.2 + 1.1i, ω = dz, with the theta quotients of ER.2/the-regulator-on-symbols' computation test, quadrature gives −0.331325 + 0.070010i for the left side and 2 × (−0.1656624 + 0.0350051i) for the right.
- Nothing that P.5 owns is re-proved here.

**Depends on.** other roadmaps: `Polylogarithms:P.5/weight-two-regulator-form`; layers of other roadmaps: `ModularCurvesPartII:R12.1`.

**Needed by.** this roadmap: `ER.2/the-regulator-on-symbols`, `ER.2/the-normalisation-factor`, `ER.7/eta-form-of-divisors`, `ER.8/the-normalisation-example`, `ER.2/chern-character-symbol-comparison`.

**Sources.**

- `Brunault.These.2005`, §2.5, Définition 63, (2.107), p. 66: “Pour toutes fonctions rationnelles F, G ∈ C(A)∗, notons η(F, G) la forme différentielle définie par η(F, G) = log|F| · (∂ − ∂̄) log|G| − log|G| · (∂ − ∂̄) log|F|.” — Brunault's η, which is i times the stage text's η(f, g).
- `Brunault.These.2005`, §2.6, proof of Théorème 68, p. 70: “d'où nous déduisons ∫_{J(C)} η(F, G) ∧ α = −2 ∫_{J(C)} log|F| · ∂̄ log|G| ∧ α.” — The integration by parts, for J = E and α = ω.

**Assembly note.** The ER.2 part reuses this node by id. What it takes from it: Elliptic η_B=iη and integration-by-parts pairing, importing the general curve η from P.5.

### The regulator of a symbol

`ER.2/the-regulator-on-symbols` · construction · planet “The symbol regulator” · parent packet

For a complex elliptic curve E the source's regulator is r_E : K_2(C(E)) → Hom_C(Ω^{1,0}(E), C), {f, g} ↦ (ω ↦ ∫_{E(C)} log|f| · ω ∧ ∂̄ log|g|) (Brunault (1.27); ∂̄, not d^c). The integral converges absolutely; the formula is bilinear; it vanishes on symbols with a constant entry; it vanishes on {f, 1 − f} by Brunault's Lemma 15, whose proof is the identity log|f| · ω ∧ ∂̄ log|1 − f| = (i/2) d((D ∘ f + i log|f| log|1 − f|) ω) (1.26) with Stokes; so r_E is well defined on K_2(C(E)) presented as in Matsumoto's theorem, and it is antisymmetric. It equals ω ↦ (1/2) ∫ η_B ∧ ω = (i/2) ∫ η(f, g) ∧ ω (ER.2/the-eta-form-and-its-differential-identity). If ξ = Σ {f_i, g_i} has |tame_x(ξ)| = 1 at every point, η(ξ) is closed (P.5/unramified-weight-two-class) and, for an oriented basis (γ1, γ2) of H_1(E(C), Z) represented by cycles avoiding the supports, r_E(ξ)(ω) = (i/2)(∫_{γ1} η(ξ) ∫_{γ2} ω − ∫_{γ2} η(ξ) ∫_{γ1} ω) (Riemann bilinear relation), independent of the cycles chosen. For E over a number field F the regulator of K_2(E) ⊗ Q is the composite of the injection K_2(E) ⊗ Q → K_2(F(E)) ⊗ Q (EllipticKTheory E.3) with r_{E_σ} at every embedding σ.

**Hypotheses.**

- E is a complex elliptic curve; f and g are arbitrary elements of C(E)^× (no condition on tame symbols is needed for the definition or for the Steinberg relation).
- K_2(C(E)) is presented by Matsumoto's theorem (K2SymbolsBrauer T.2), which is Brunault's (1.24).
- The period formula needs |tame_x(ξ)| = 1 at every point and cycles avoiding the supports; independence of the representing cycles is part of that statement.

**Construction.**

1. Convergence: log|f| is integrable and ∂̄ log|g| = (1/2) conj(g'/g) dz̄ has 1/r singularities, so the integrand is O(|log r|/r) near the supports.
2. Bilinearity is linearity of log| · | and ∂̄; constant entries: ∫ log|c| ω ∧ ∂̄ log|g| = −log|c| ∫ d(log|g| ω) = 0 and ∂̄ log|c| = 0.
3. Steinberg: check (1.26) from ∂D/∂z = (i/2)(log|z|/(1 − z) + log|1 − z|/z) (Brunault (1.68), P.1/bloch-wigner-differential) and apply Stokes on E minus small discs around f^{-1}{0, 1, ∞}.
4. Descend through K2SymbolsBrauer:T.2/matsumoto; antisymmetry is the integration by parts of ER.2/the-eta-form-and-its-differential-identity.
5. Identify r_E with (1/2) ∫ η_B ∧ ω (ER.2/the-eta-form-and-its-differential-identity).
6. If |tame_x ξ| = 1 everywhere, η(ξ) is closed with a class in H^1(E(C), R) independent of choices (P.5/unramified-weight-two-class); apply the Riemann bilinear relation with the intersection pairing of ER.1/periods-and-the-comparison-isomorphism.
7. Over a number field compose with EllipticKTheory:E.3/what-the-sequence-does-not-identify at each embedding; the torsion ambiguity is ER.2/torsion-ambiguity-has-zero-regulator.

**API.**

- `symbolRegulator` (data): r_E : K_2(C(E)) → Hom_C(Ω^{1,0}(E), C) of (1.27).
- `symbolRegulator_symbol` (simp): r_E{f, g}(ω) = ∫ log|f| ω ∧ ∂̄ log|g|.
- `symbolRegulator_steinberg` (characterisation): r_E{f, 1 − f} = 0 for f ≠ 0, 1 (Lemma 15).
- `symbolRegulator_const` (simp): r_E{c, g} = r_E{f, c} = 0 for c in C^×.
- `symbolRegulator_antisymm` (relation): r_E{g, f} = −r_E{f, g}.
- `symbolRegulator_eq_half_eta` (compatibility): r_E{f, g}(ω) = (1/2) ∫ η_B(f, g) ∧ ω = (i/2) ∫ η(f, g) ∧ ω, with P.5's η.
- `symbolRegulator_periods` (relation): If |tame_x ξ| = 1 everywhere: r_E(ξ)(ω) = (i/2)(∫_{γ1} η(ξ) ∫_{γ2} ω − ∫_{γ2} η(ξ) ∫_{γ1} ω).
- `symbolRegulator_real` (compatibility): For E, f, g defined over R and ω in Ω^{1,0}_R, r_E{f, g}(ω) is purely imaginary (Brunault (2.116)).

**Unit tests.**

- `const_entry` (degenerate): r_E{c, g} = 0 = r_E{f, c} for every c in C^×.
- `steinberg` (characterisation): r_E{f, 1 − f} = 0 for every f in C(E) − {0, 1}.
- `theta_quotient_value` (computation): On E = C/(Z + τZ), τ = 0.2 + 1.1i, ω = dz: for f = θ1(z − a1)θ1(z − a2)/(θ1(z − b1)θ1(z − b2)) with a1 = 0.13 + 0.21τ, a2 = 0.47 + 0.66τ, b1 = 0.31 + 0.05τ, b2 = 0.29 + 0.82τ and g likewise with zeros 0.72 + 0.35τ, 0.05 + 0.48τ and poles 0.58 + 0.90τ, 0.19 − 0.07τ: r_E{f, g}(dz) = −0.1656624 + 0.0350051i.
- `not_dc` (non-example): Replacing ∂̄ log|g| by d^c log|g| = (∂ − ∂̄) log|g|/(4πi) multiplies every value by i/(4π) (only the ∂̄-part survives against ω), so theta_quotient_value fails.
- `real_values` (compatibility): For E, f, g defined over R and ω in Ω^{1,0}_R, r_E{f, g}(ω) lies in iR.

**Acceptance.**

- r_E is well defined on K_2(C(E)): bilinear, antisymmetric, zero on {f, 1 − f} and on symbols with a constant entry.
- r_E({f, g})(ω) = (1/2) ∫ η_B(f, g) ∧ ω.
- Computation: on E = C/(Z + τZ), τ = 0.2 + 1.1i, ω = dz, with the theta quotients of the test theta_quotient_value, r_E({f, g})(dz) = −0.1656624 + 0.0350051i (direct quadrature, N = 400 midpoint grid, error O(h²)).
- For |tame_x ξ| = 1 everywhere, r_E(ξ)(ω) = (i/2)(∫_{γ1} η(ξ) ∫_{γ2} ω − ∫_{γ2} η(ξ) ∫_{γ1} ω), independent of the cycles chosen.

**Uses.**

- ER.4: The divisor formula computes this functional.
- ER.6: The Beilinson statement is about this functional restricted to the integral part.
- ER.7: The modular computation evaluates it against a newform differential.

**Depends on.** this roadmap: `ER.2/the-eta-form-and-its-differential-identity`, `ER.1/periods-and-the-comparison-isomorphism`; other roadmaps: `Polylogarithms:P.1/bloch-wigner-dilogarithm`, `Polylogarithms:P.1/bloch-wigner-differential`, `Polylogarithms:P.5/unramified-weight-two-class`, `K2SymbolsBrauer:T.2/matsumoto`, `K2SymbolsBrauer:T.3/tame-symbol`, `EllipticKTheory:E.3/the-tame-symbol-boundary`, `EllipticKTheory:E.3/what-the-sequence-does-not-identify`.

**Needed by.** this roadmap: `ER.2/the-normalisation-factor`, `ER.2/torsion-ambiguity-has-zero-regulator`, `ER.3/goncharov-function-and-the-regulator`, `ER.4/the-divisor-formula`, `ER.4/transfer-and-the-trace-formula`, `ER.6/the-regulator-on-the-integral-part`, `ER.7/the-regulator-integral-and-its-evaluation`, `ER.7/explicit-beilinson-theorem-degeneracy`, `ER.7/real-structure-of-the-regulator`, `ER.7/regulator-under-finite-pushforward`, `ER.2/chern-character-symbol-comparison`, `ER.2/oriented-period-coordinate-comparison`.

**Sources.**

- `Brunault.These.2005`, §1.1, Définition 16, (1.27), p. 19: “L'application régulateur rX associée à X est définie par rX : K2(C(X)) → HomC(Ω1,0(X), C), {f, g} ↦ (ω ↦ ∫_X log|f| · ω ∧ ∂̄ log|g|). Cette application est bien définie d'après (1.25).” — The definition with ∂̄ (the packet's d^c is a misreading), verbatim.
- `Brunault.These.2005`, §1.1, Lemme 15, (1.25)–(1.26), p. 19: “Pour toute fonction méromorphe f ∈ C(X) − {0, 1} et toute forme différentielle holomorphe ω ∈ Ω1,0(X), nous avons ∫_X log|f| · ω ∧ ∂̄ log|1 − f| = 0.” — The Steinberg relation; its proof is (1.26) and Stokes.

**Assembly note.** The ER.2 part reuses this node by id. What it takes from it: Brunault symbol regulator, absolute convergence, relations and symplectic period formula.

### Fixing the factor and the orientation, and what may not be used to fix them

`ER.2/the-normalisation-factor` · comparison · parent packet

The source's 'à un facteur près' (Brunault p. 20) is resolved in the same source. In the identification H^2_D(E_R, R(2)) ≅ H^1(E(C), R(1))^− ≅ Hom_R(Ω^{1,0}_R, R(1)), [ν] ↦ (ω ↦ ∫ ν ∧ ω) of ER.2/the-deligne-cohomology-target, Beilinson's regulator is r_Beil(γ) = (ω ↦ ∫_{E(C)} η_B(γ) ∧ ω) on K_2^{(2)}(E) ⊂ K_2(Q(E)) ⊗ Q (Proposition 67, from the cup-product formula for Deligne cohomology and the compatibility of the regulator with pull-back to open subsets and with products), and by ER.2/the-eta-form-and-its-differential-identity r_Beil = 2 r_E (the computation in the proof of Theorem 68). The factor between the source's functional and Beilinson's regulator is therefore 2, not an unknown power of 2π; the comparison with R_q = J + iD_q is ER.3/goncharov-function-and-the-regulator (r_Beil{f, g}(η^*dz) = conj(R_q) on the diamond convolution). The remaining comparison — the Schneider/Nekovář normalisation of H_D and of the regulator, used by Brunault, against the universal Chern and Deligne regulator — is owned by MotivicEtaleKTheory M.8, with Polylogarithms P.5/regulator-induces-beilinson for the weight-two curve case (sign (−1)^m = +1 for m = 2). No factor may be fixed by requiring an L-value formula to hold.

**Hypotheses.**

- Brunault's Proposition 67 is taken in the normalisation of Schneider [65] and Nekovář [52]; its comparison with the universal regulator is M.8's.
- The factor is determined, not assumed: 2 between r_E and r_Beil in the identification of Lemmas 61–62.
- ω_0 = η^*dz for an oriented basis, with (1.40) for a real curve.

**Proof outline.**

1. Record Brunault's Remark 1 (pp. 19–20).
2. Import from M.8 the compatibility of the regulator with pull-back to U = E − S and with cup products, and the cup-product formula r_U{F, G} = [η_B(F, G)] in H^2_D(U_R, R(2)) (Brunault (2.121), (2.122)).
3. Proposition 67: write r_Beil(γ) = [ν] and η^*γ = (1/N)Σ{F_i, G_i}; then ν restricted to U is (1/N)Σ η_B(F_i, G_i) + dφ with φ of logarithmic growth, and Stokes gives ∫ ν ∧ α = r̂(η^*γ)(α).
4. Apply ER.2/the-eta-form-and-its-differential-identity: ∫ η_B ∧ ω = 2 r_E(ω).
5. State the non-example: no factor or orientation may be chosen by requiring an L-value identity.

**Acceptance.**

- r_Beil = 2 r_E in the identification of Lemmas 61–62 (Brunault Proposition 67 and the proof of Theorem 68).
- Numerically, for the theta quotients of ER.2/the-regulator-on-symbols: ∫ η_B(f, g) ∧ dz = −0.331325 + 0.070010i = 2 r_E{f, g}(dz).
- The factor is not fixed by requiring the final formula to hold.
- Every L-value statement downstream carries this normalisation explicitly.

**Depends on.** this roadmap: `ER.2/the-regulator-on-symbols`, `ER.2/the-eta-form-and-its-differential-identity`, `ER.2/the-deligne-cohomology-target`; other roadmaps: `Polylogarithms:P.5/regulator-induces-beilinson`.

**Needed by.** this roadmap: `ER.6/the-beilinson-statement`, `ER.8/the-normalisation-example`, `ER.2/chern-character-symbol-comparison`, `ER.6/integral-nonzero-bloch-class`, `ER.7/constant-symbol-regulator-correction`, `ER.7/regulator-period-inclusion`, `ER.7/isotypic-regulator-image`, `ER.7/elliptic-regulator-adjointness`.

**Sources.**

- `Brunault.These.2005`, §1.1, Remarques, item 1, p. 20: “La composition de ηX et rX ⊗ Q donne, à un facteur près, le régulateur de Beĭlinson.” — The source's 'up to a factor', verbatim.
- `Brunault.These.2005`, §2.5, Proposition 67, (2.118), p. 67: “Le régulateur de Beĭlinson rA de (2.91) s'obtient comme la composée K2(2)(A) → K2(Q(A)) ⊗ Q → H2D(AR, R(2)).” — The factor fixed: Beilinson's regulator is r̂ ∘ η^*, with r̂ given by η(F, G) (Définition 65).
- `Brunault.These.2005`, §2.6, proof of Théorème 68, p. 70: “d'où nous déduisons ∫_{J(C)} η(F, G) ∧ α = −2 ∫_{J(C)} log|F| · ∂̄ log|G| ∧ α.” — With J = E and α = ω this is 2 r_E.

**Assembly note.** The ER.2 part reuses this node by id. What it takes from it: Factor2 relative to the universal regulator; the present comparison resolves the Schneider sign convention.

**Assembly note.** `ER.2/chern-character-symbol-comparison` (ER.2 part) specialises the imported higher-Chern comparison to E.

- In Schneider's convention ch_{2,2} = −c_{2,2} and c_{2,2}({f, g}) = −c_{1,1}(f) ∪ c_{1,1}(g). The two signs cancel, so the Deligne regulator of a symbol is the positive cup product.
- Its representative is iη(f, g) = η_B(f, g), which gives W(r_D) = 2r_E.
- This rests on the early M.8 export, which does not exist yet (the ER.2 part's gap). The parent's first gap is therefore refined, not closed.

### The torsion ambiguity in lifting a number-field symbol has zero real regulator

`ER.2/torsion-ambiguity-has-zero-regulator` · lemma · parent packet · added by REV-EllipticRegulators

Let E be an elliptic curve over a number field F and ξ in K_2(F(E)) with trivial tame symbol at every closed point. Two classes of K_2(E) restricting to ξ differ by an element of the image of ⊕_x K_2(k(x)), which is torsion (EllipticKTheory E.3). The regulator is additive with values in a real vector space, so it vanishes on torsion; hence r(γ) for a lift γ of ξ does not depend on the lift, and the function-field formula of ER.2/the-regulator-on-symbols computes the regulator of K_2(E) ⊗ Q.

**Hypotheses.**

- F is a number field and E/F an elliptic curve; the regulator is ER.2/the-regulator-on-symbols composed over all embeddings.

**Proof outline.**

1. By EllipticKTheory:E.3/what-the-sequence-does-not-identify the kernel of K_2(E) → K_2(F(E)) is the image of ⊕_x K_2(k(x)), a torsion group.
2. If nt = 0 then n r(t) = r(nt) = 0 in a real vector space, so r(t) = 0.
3. Hence r is constant on the fibres of K_2(E) → K_2(F(E)); after tensoring with Q the restriction is injective.

**Acceptance.**

- The regulator of a torsion class of K_2(E) is zero.
- The value of r on a lift of ξ does not depend on the lift.
- Nothing is claimed about the torsion classes themselves.

**Depends on.** this roadmap: `ER.2/the-regulator-on-symbols`; other roadmaps: `EllipticKTheory:E.3/what-the-sequence-does-not-identify`, `EllipticKTheory:E.3/localisation-sequence-for-a-curve`.

**Needed by.** this roadmap: `ER.2/chern-character-symbol-comparison`.

**Sources.**

- `Brunault.These.2005`, §2.5, (2.92), p. 64: “Le groupe de K-théorie de Quillen K2(2)(A) est décrit par la suite exacte [52, (7.4), p. 23] 0 → K2(2)(A) −η∗→ K2(Q(A)) ⊗ Q −∂→ ⊕_{V⊂A} Q(V)∗ ⊗ Q,” — After tensoring with Q the ambiguity disappears; this node records why the real regulator never sees it (stage text of ER.2, last sentence).

**Assembly note.** The ER.2 part reuses this node by id. What it takes from it: E.3 rational restriction and zero real regulator for torsion ambiguity of integral lifts.

### Elliptic specialisation of the Deligne exact sequence

`ER.2/elliptic-deligne-specialisation-contract` · comparison · ER.2 part

Specialise the early M.8 Deligne-complex comparison to every smooth projective Eσ/C. With R(p)=(2πi)^p R and R(2)_D=[R(2)→O→Ω¹] in degrees 0,1,2, its cone long exact sequence yields 0→F²H¹_dR(Eσ)→H¹(Eσ(C),R(1))→H²_D(Eσ,R(2))→0. F²H¹_dR(Eσ)=0, so the last arrow is an isomorphism. On the disjoint union of all embeddings, total de Rham conjugation is coefficient conjugation composed with geometric c*. It acts on R(1)-valued classes as -c*, hence its fixed part is the geometric (-1)-eigenspace. Under the accepted target node’s wedge pairing, fixed classes are precisely the functionals taking the real differential space (fixed by ω↦c*conj(ω)) into R(1). The complex, hypercohomology, cone comparison and products are imported, not constructed in ER.2.

**Hypotheses.**

- E/F is an elliptic curve over a number field; Eσ is smooth and projective.
- C5 supplies geometric Betti–de Rham comparison and the oriented Poincaré pairing and its compatibility with real conjugation; the Hodge filtration is the filtration induced by the truncated de Rham complex. The early M.8 interface supplies the Deligne comparison and its conjugation compatibility.
- c* acts geometrically and leaves the coefficient line R(1) alone; total conjugation includes complex conjugation of coefficients.

**Proof outline.**

1. Use Schneider §2 and Nekovář (7.2.2) for the imported Deligne cone and exact sequence in the range i=2<2p=4; this is an instance, not a new construction of the complex.
2. Use C5/repair-proper-de-rham-betti for the additive comparison. On a smooth curve Ω^j=0 for j≥2, so the truncated complex Ω^{≥2} is zero and F²H¹_dR=0. This gives the accepted target node’s isomorphism without requiring a Hodge decomposition from C5. Cup/trace and real-conjugation compatibility remain the explicit C5 stage request.
3. Coefficient conjugation is -1 on R(1), so total conjugation is -c*. Taking invariants commutes with the finite direct sum; real invariants are exact by averaging.
4. Use Brunault (2.104) with complex dimension one: geometric c reverses the surface orientation, and the fixed differential condition makes the wedge functional imaginary-valued.

**Acceptance.**

- The exact sequence uses H¹(R(1)), not H¹(R(2)); E/Q gives a real line.
- A geometric plus eigenclass with nonzero value on the real cycle is not a real Deligne class in this convention.
- The generic early M.8 export is an explicit supplier gap, not an implementation claim.

**Depends on.** this roadmap: `ER.2/the-deligne-cohomology-target`; other roadmaps: `ComplexComparisonPartII:C5/repair-proper-de-rham-betti`; layers of other roadmaps: `ComplexComparisonPartII:C5`.

**Needed by.** this roadmap: `ER.2/archimedean-rank-from-orbits`, `ER.2/chern-character-symbol-comparison`.

**Lean.** module `TauCeti/NumberTheory/EllipticRegulators/Deligne`, namespace `TauCeti.EllipticRegulators`.

**Sources.**

- `Schneider.1988`, §2 pp.7–9, Deligne complex and exact sequence (*): “R(p) := (2πi)^p R” — Supplies the Tate convention and proper-variety cone exact sequence.
- `Brunault.These.2005`, §2.5 Lemmas 61–62, pp.64–66, (2.97), (2.100), (2.104): “F²H¹_dR(A(C)) = 0” — For an elliptic curve the comparison is an isomorphism, and the geometric minus part is the real target.

### Archimedean orbit equivalence

`ER.2/archimedean-orbit-equivalence` · construction · planet “Archimedean orbit equivalence” · ER.2 part

Refine the accepted target node by constructing its orbit-coordinate equivalence. Untwist ν=2πi a and use ER.1 period bases. At a real place v choose γ₊·γ₂=1, c*γ₊=γ₊ and c*γ₂=ε_v γ₊−γ₂ (ε_v=0 or1). On periods (a,b), geometric c* is Cε(a,b)=(a,εa−b), and the minus eigenspace is {(0,b)}. At a complex place choose one embedding σ, identify the conjugate H¹ with H¹(Eσ,R) by geometric transport c*, and write the pair as (u,v). Conjugation is the swap S(u,v)=(v,u), whose minus eigenspace is {(u,-u)}. Evaluation at b on each real orbit and projection to u on each complex orbit give a real linear equivalence orbitEquiv from the target’s untwisted period model to (I_real→R)×(I_complex→R²). The cohomological equivalence is the composite with the accepted ER.1 period comparisons; choices are part of the interface and are not claimed canonical.

**Hypotheses.**

- E/F is elliptic, all embeddings and c are those of ER.1.
- I_real indexes all real places; I_complex contains one representative of every conjugate pair.
- ER.1 supplies integral symplectic bases and real/conjugate transport; geometric transport has been applied before treating complex-pair conjugation as a swap.

**Construction.**

1. Import the accepted target, its Tate untwisting and the ER.1 period isomorphisms; do not define another cohomology theory.
2. At a real place compute Cε on the dual lattice from cγ₂=εγ₊−γ₂. Module.End.mem_eigenspace_iff gives a=-a, hence a=0; b is unrestricted.
3. At a complex pair use the geometric pullback to identify the second summand with the first. The (-1)-eigencondition is v=-u, with u unrestricted in the real rank-two H¹.
4. Construct inverse coordinates by b↦(0,b) and u↦(u,-u); prove both inverse and linearity laws componentwise. Changing a complex representative replaces u by -c*u in intrinsic cohomology.

**API.**

- `Archimedean.orbitEquiv` (equivalence): The real linear equivalence described above, implemented on ER.1 period coordinates and transported to the accepted Deligne target.
- `Archimedean.orbitEquiv_real` (projection): Its real-place component on x is (x_real(v)).2, the untwisted γ₂ period.
- `Archimedean.orbitEquiv_complex` (projection): Its complex-place component is the first transported rank-two period vector.
- `Archimedean.orbitEquiv_symm` (constructor): The inverse sends (b,u) to the family ((0,b(v)),(u(w),-u(w))).
- `Archimedean.orbitEquiv_ext` (extensionality): Two target elements are equal iff all their orbit coordinates are equal.
- `Archimedean.real_mem_iff` (compatibility): For Mathlib’s eigenspace of Cε at -1, (a,b) belongs iff a=0.
- `Archimedean.pair_mem_iff` (compatibility): For Mathlib’s eigenspace of S at -1, (u,v) belongs iff v=-u.

**Unit tests.**

- `Archimedean.rectangular_real` (computation): With one real orbit, ε=0 and no complex orbits, (0,1) has coordinate1 and (1,0) is not in the minus eigenspace.
- `Archimedean.tilted_real` (computation): With ε=1, the eigenline is still (0,b); the vector (1,0) fails, despite the non-diagonal conjugation matrix.
- `Archimedean.complex_pair` (computation): With one complex orbit and no real orbits, ((1,2),(-1,-2)) has coordinate(1,2), and ((1,0),(-1,0)) and ((0,1),(0,-1)) are independent.
- `Archimedean.empty_orbits` (degenerate): With both index sets empty the orbit model is the zero vector space and the inverse of its sole element is zero.
- `Archimedean.invariant_pair_fails` (non-example): ((1,2),(1,2)) is a swap-invariant vector but is not in the minus eigenspace.

**Acceptance.**

- The equivalence retains two real coordinates for a complex place.
- The real-place formula works for both ε=0 and ε=1.
- A choice of a representative is recorded; switching it gives -c* on the intrinsic complex-place coordinate.

**Uses.**

- ER.2 target dimension and ER.6 determinant of the regulator: Supplies independent coordinates, one at every real place and two at every complex place; identifies the determinant-line dimension.
- Brunault Proposition67; ER.2 symbol regulator over F: Projects the regulator over all embeddings to archimedean orbits without dropping a conjugate component or confusing the two conjugations.

**Depends on.** this roadmap: `ER.2/the-deligne-cohomology-target`, `ER.1/periods-and-the-comparison-isomorphism`, `ER.1/all-embeddings-and-the-conjugation-action`; libraries: `mathlib:Module.End.eigenspace`, `mathlib:Module.End.mem_eigenspace_iff`, `mathlib:NumberField.ComplexEmbedding.conjugate`, `mathlib:NumberField.ComplexEmbedding.isReal_iff`.

**Needed by.** this roadmap: `ER.2/archimedean-rank-from-orbits`.

**Lean.** module `TauCeti/NumberTheory/EllipticRegulators/Deligne`, namespace `TauCeti.EllipticRegulators`.

**Sources.**

- `Brunault.These.2005`, §2.5 Lemma61, p.64, (2.94); Proposition26, p.26: “R(1) = 2πiR ⊂ C” — The target is the geometric minus part; the explicit orbit formula is derived from this and the imported ER.1 lattice action.

### Archimedean dimension from conjugation orbits

`ER.2/archimedean-rank-from-orbits` · theorem · planet “Archimedean dimension formula” · ER.2 part

For an elliptic curve E/F over a number field, dim_R H²_D(E_R,R(2)) = |I_real|+2|I_complex| = r₁+2r₂ = [F:Q]. Before real invariants, ⊕σ H²_D(Eσ,R(2)) has real dimension2[F:Q]. The regulator of a class defined over F is a family satisfying c_σ*ν_barσ=-ν_σ in the R(1)-valued presentation, so the orbit equivalence, rather than the unrestricted product, is its coordinate space.

**Hypotheses.**

- E/F is elliptic, smooth and projective, with the target and choices of the orbit equivalence.
- Naturality and real conjugation of the generic regulator are part of the early M.8 supplier contract; ER.1 supplies the geometric conjugate transport.

**Proof outline.**

1. Use orbitEquiv and invariance of finrank under a linear equivalence. The finite product has rank |I_real|+2|I_complex|.
2. The two sets index Mathlib’s real and complex infinite places. Apply NumberField.InfinitePlace.card_add_two_mul_card_eq_rank; this arithmetic theorem is not a new node.
3. Before imposing conjugation there are [F:Q] components of real dimension2. For a class over F, total-conjugation naturality fixes the regulator; untwisting its R(1) coefficients turns this into geometric anti-invariance.

**Acceptance.**

- For E/Q the rank is1. For E/Q(i) it is2, not1. For E/Q(√2) it is2, contributed by two real places.
- The complex-pair test is geometric: the two embeddings are paired, not two independent regulator targets.
- No regulator injectivity, surjectivity or Beilinson conjecture is asserted.

**Depends on.** this roadmap: `ER.2/archimedean-orbit-equivalence`, `ER.2/elliptic-deligne-specialisation-contract`; libraries: `mathlib:NumberField.InfinitePlace.nrRealPlaces`, `mathlib:NumberField.InfinitePlace.nrComplexPlaces`, `mathlib:NumberField.InfinitePlace.card_add_two_mul_card_eq_rank`.

**Lean.** module `TauCeti/NumberTheory/EllipticRegulators/Deligne`, namespace `TauCeti.EllipticRegulators`.

**Sources.**

- `Brunault.These.2005`, §2.5 Lemmas61–62, pp.64–66; §2.6 Proposition66, p.67: “H¹(A(C), R(1))⁻” — The real target is a minus eigenspace and the regulator of a rational class lands there; the number-field count follows from ER.1 and the pinned place-count theorem.

### Chern character, symbol cup product and Brunault normalisation

`ER.2/chern-character-symbol-comparison` · comparison · ER.2 part

Specialise the imported higher Chern and curve-regulator comparisons to E/F. In Schneider’s higher-K convention ch_{2,2}=-c_{2,2} and c_{2,2}({f,g})=-c_{1,1}(f)∪c_{1,1}(g), hence the rational Deligne regulator of a symbol is the positive cup product. On U=Eσ minus the divisors, its representative is log|f| π₁(dlog g)−log|g| π₁(dlog f), with π₁(α)=(α-conj α)/2, thus iη(f,g)=η_B(f,g). If γ∈K₂(E)_Q and its function-field image is ξ=Σq_j{f_j,g_j}, rational coefficients q_j, then at each embedding the accepted wedge identification sends r_D(γ) to ω↦Σq_j∫η_B(f_j,g_j)∧ω =2r_E(ξ)(ω). P.5 supplies Steinberg descent and the closed-current comparison, and E.3 supplies restriction/lift independence; no generic Chern class, Deligne product or curve-current theorem is replanned here. For a symbol combination with only unit-modulus tame symbols the η-period class still exists, but it is not asserted to have a K₂(E) lift.

**Hypotheses.**

- E/F is elliptic over a number field, γ is a rational K₂ class and ξ is its restriction expressed by finitely many nonzero rational-function symbols at each embedding.
- Use M.8’s Chern-character regulator with Schneider’s sign convention; use P.5/weight-two-regulator-form, P.5/unramified-weight-two-class and P.5/regulator-induces-beilinson for the general curve comparison.
- Actual rational unramifiedness in E.3 is required for a K₂(E)_Q lift. Vanishing of log|tame| suffices only for the real-current class.

**Proof outline.**

1. Read Schneider §4 p.28: ch_{i,j}=(-1)^{j-1} c_{i,j}/(j-1)! for i≥1, and the Chern product coefficient at weights1,1 is -1. The two signs cancel for the symbol. This is a comparison of imported maps.
2. Nekovář (7.3.2) and (7.4.1) give the cup representative with π₁=(α-conj α)/2. Since dlog f is holomorphic on U, π₁(dlog f)=i darg f, giving iη without an extra2π factor.
3. Import P.5’s Steinberg and closed-current results. E.3’s rational restriction identifies γ with its unramified symbol image. The representative extends as a closed current on E; equivalently use Brunault (2.123) and Stokes with logarithmic growth to compare it with the smooth Deligne class.
4. Use the accepted elliptic η-pairing node: integration by parts, with boundary estimate O(r log²r), gives ∫η_B∧ω=2∫log|f|ω∧bar∂log|g|. This establishes the accepted normalisation-factor node directly in the Schneider convention.
5. Assemble every embedding, invoke total-conjugation naturality, and use the accepted torsion node to remove ambiguity of integral lifts. No L-value formula is used to set the constant.

**Acceptance.**

- Positive unit cup product; η_B=iη; untwisted wedge pairing r_D=2r_E. All three constants/signs are checked separately.
- For a local symbol {z,c}, c≠0, ∮η=-2π log|c| and tame=c^{-1}; it need not define a compact-curve cohomology class if |c|≠1.
- For |c|=1 but c not a root of unity, its local real residue is zero while its rational tame class need not vanish: real-current descent is weaker than rational K₂ descent.
- For a torsion change of lift, both r_D and the associated real scalar are unchanged.
- The author-copy pairing factor 1/(2πi) changes the evaluated scalar, not the Deligne class or the factor2 in the wedge convention.

**Depends on.** this roadmap: `ER.2/elliptic-deligne-specialisation-contract`, `ER.2/the-eta-form-and-its-differential-identity`, `ER.2/the-regulator-on-symbols`, `ER.2/the-normalisation-factor`, `ER.2/torsion-ambiguity-has-zero-regulator`; other roadmaps: `EllipticKTheory:E.3/what-the-sequence-does-not-identify`, `Polylogarithms:P.5/weight-two-regulator-form`, `Polylogarithms:P.5/unramified-weight-two-class`, `Polylogarithms:P.5/regulator-induces-beilinson`.

**Needed by.** this roadmap: `ER.2/oriented-period-coordinate-comparison`, `ER.8/weight-two-beilinson-relation`, `ER.8/cm36-corrected-l-value`, `ER.8/quadratic-regulator-trace`.

**Lean.** module `TauCeti/NumberTheory/EllipticRegulators/Deligne`, namespace `TauCeti.EllipticRegulators`.

**Sources.**

- `Schneider.1988`, §4 p.28, higher Chern product formula and definition of ch_{i,j}: “(-1)^{j-1}/(j-1)!” — At j=2 the Chern-character coefficient is -1; the product coefficient for two weight-one classes is also -1.
- `Nekovar.AuthorCopy`, §7.3 p.23, (7.3.2); §7.4 p.23, (7.4.1): “π₁” — The projection in the cup product is imaginary-valued, so the representative is iη; p.24 misprints are recorded separately.
- `Brunault.These.2005`, Proposition67 pp.67–69, (2.122)–(2.123) and conclusion p.69; proof of Theorem68 p.70: “r_A(γ) = r̂_A(η*γ)” — Identifies the Beilinson regulator with the η_B wedge pairing; the elliptic integration-by-parts formula gives 2r_E.

### Oriented real coordinate and transverse regulator period

`ER.2/oriented-period-coordinate-comparison` · comparison · ER.2 part

Refine the accepted E/Q coordinate with its homological formula. Let γ₊ generate the conjugation-fixed homology line with the chosen orientation of E⁰(R), choose γ₂ with γ₊·γ₂=+1 and ω₀ with ∫γ₊ω₀=1. For ν∈H¹(E(C),R(1))⁻, write ν=2πi a with a real and a(γ₊)=0. In the accepted wedge identification W(ν)(ω)=∫ν∧ω, the Riemann bilinear formula gives W(ν)(ω₀)=-ν(γ₂). Therefore ellipticDeligneTarget_toReal(ν)=W(ν)(ω₀)/i=-2π a(γ₂). If ν=r_D(γ)=[iη(ξ)], the scalar is -∮γ₂η(ξ)=2 Im(r_E(ξ)(ω₀)). It is independent of γ₂↦γ₂+nγ₊. Reversing the chosen real orientation sends (γ₊,γ₂,ω₀) to (-γ₊,-γ₂,-ω₀) and negates the scalar. Nekovář’s explicitly scaled pairing J=(1/(2πi))W has value J(ν)(ω₀)=r_E(ξ)(ω₀)/(πi)=ellipticDeligneTarget_toReal(ν)/(2π).

**Hypotheses.**

- E/Q is elliptic; γ₊ is the primitive real-cycle generator, with ω₀ and the symplectic basis supplied by ER.1. Both one-component and two-component E(R) are allowed.
- ν is a geometric minus eigenclass. For the regulator-period formula γ∈K₂(E)_Q and ξ is its E.3 restriction image, so η(ξ) defines a closed current on the compact curve.
- γ₊·γ₂=+1 and W integrates ν∧ω, in that order. J is the author copy’s scaled pairing, not Brunault’s W.

**Proof outline.**

1. Use the accepted ER.1 symplectic period comparison to write ∫ν∧ω₀=ν(γ₊)ω₀(γ₂)−ν(γ₂)ω₀(γ₊). Since cγ₊=γ₊ and c*ν=-ν, ν(γ₊)=0, giving the minus sign.
2. Apply the accepted toReal coordinate (division by i). Tate untwisting ν=2πi a gives -2π a(γ₂), showing exactly where2π occurs.
3. The Chern-symbol comparison gives ν=[iη(ξ)]; the accepted symbol period formula gives r_E=-i∮γ₂η/2. Both yield -∮γ₂η as the scalar.
4. A shear of γ₂ adds a multiple of a zero period. Simultaneous reversal of both basis cycles preserves their intersection and replaces ω₀ by -ω₀, changing the coordinate sign.
5. Apply Nekovář’s pairing factor1/(2πi) to W=2r_E. Obtain J=r_E/(πi)=toReal/(2π), rather than changing the underlying regulator.

**Acceptance.**

- With untwisted a(γ₂)=1, the coordinate is -2π, while with η(γ₂)=1 the regulator coordinate is -1 and r_E(ω₀)=-i/2.
- For either ε=0 or1, a(γ₊)=0 and the same transverse-period formula applies.
- Shearing γ₂ leaves the scalar unchanged; reversing the real orientation negates it.
- A geometric plus eigenclass with a(γ₊)≠0 fails the transverse-only formula; the minus hypothesis is essential.
- The compact current’s zero puncture periods ensure that changing representative cycles around deleted divisors does not alter the formula.

**Depends on.** this roadmap: `ER.2/chern-character-symbol-comparison`, `ER.2/the-deligne-cohomology-target`, `ER.2/the-regulator-on-symbols`, `ER.1/complex-uniformisation`, `ER.1/periods-and-the-comparison-isomorphism`; libraries: `mathlib:Complex.imCLM`.

**Needed by.** this roadmap: `ER.8/weight-two-beilinson-relation`, `ER.8/quadratic-regulator-trace`.

**Lean.** module `TauCeti/NumberTheory/EllipticRegulators/Deligne`, namespace `TauCeti.EllipticRegulators`.

**Sources.**

- `Brunault.These.2005`, Proposition26 p.26; Lemma62 pp.65–66; Definition16 p.19: “∫_{E⁰(R)} ω = 1” — Pins the differential normalization; wedge pairing and symbol integral determine the scalar and orientation sign.
- `Nekovar.AuthorCopy`, §7.5 p.24, displayed pairing before (7.5.1): “1/(2πi)” — An additional factor belongs to this source’s pairing, yielding J=W/(2πi); use the corrected symbol integrand.

## ER.3 — The elliptic dilogarithm and its companion

*18 nodes: 14 from the parent packet and 4 from the ER.3 part. Planets (5): The elliptic dilogarithm; Bloch's function R_q = J_q + iD_q; Kronecker–Eisenstein kernel; Elliptic Kronecker expansion; Relative Steinberg relation.*

The layer constructs the elliptic dilogarithm and its logarithmic companion, proves that their combination R_q descends to K₂, and gives the Fourier (Kronecker–Eisenstein) description through which ER.4 and ER.5 compute.

- **Definitions** (parent packet).
  - D_q(x) = Σ_n D(xq^n), the orbit sum of the Bloch–Wigner function of Polylogarithms P.1.
  - Bloch's companion J_q, which converges without correction but is not q-invariant: J_q(qx) − J_q(x) = −log²|x|.
  - Zagier's regularisation J(q; x) = J_q(x) + (1/3) log²|q| B₃(log|x|/log|q|). The Bernoulli term gives invariance under x ↦ qx, not convergence.
  - Bloch's convention R_q = J + iD_q.
- **Bloch's Lecture 9 argument** is decomposed in the parent packet: truncation of the theta product on annuli, the location of the zeros of F_N − K, the relation on the projective line, and the two separate limits for J_q and D_q. The identity for D_q does not give the one for J_q.
- **The Fourier description and the Green function.** D_q − iJ(q; ·) = −(Im τ)²/π Σ' χ_λ/(λ² λ̄) converges absolutely, everywhere, including at the origin. The basis-change law is R_q ↦ R_q/(cτ̄ + d). Brunault's Green function and Goncharov's function R_E give r_Beil = conj(R_q) on the diamond convolution.
- **The ER.3 part** supplies proofs that the parent states but does not prove:
  - the weight-two Kronecker–Eisenstein kernel;
  - a direct computation of the complex Fourier coefficients of D_q − iJ(q; ·), companion included, which settles source issue E3 (J_{E,η} = −J(q; ·));
  - the reconstruction of the absolutely convergent expansion from these coefficients by uniqueness of Fourier coefficients on the torus;
  - the relative Steinberg relation on the projective line (the D-input of the truncation argument), derived from Polylogarithms P.5's Chow dilogarithm.

Two notational conventions meet here and in ER.4–ER.5. Brunault and Zagier write lattice points as m + nτ with the character exp(2πi(mb − na)); Bloch's Lecture 10 writes mτ + n against f(m, n). The Conventions section gives the dictionary.

The layer is planned, not closed. Three obligations remain open:
- the normalised Green kernel, requested from GrossZagierAndArithmeticHeights GZ.2;
- the Gaussian-smoothing limit that justifies the interchange in Brunault's Proposition 24 (source issue E2);
- the continuity argument for colliding roots and exceptional constants in both Lecture 9 limits (source issue E5).

**Coverage.**

- **In the parent packet: partial.** D_q; Bloch's J_q (not q-invariant) and the regularised J(q; ·) (q-invariant, Bernoulli term); R_q = J + iD_q; Bloch's truncation proof of the Steinberg relation split into seven nodes; the absolutely convergent Kronecker–Eisenstein expansion; lattice-basis change; the Green function and Goncharov's R_E with Brunault's Propositions 17 and 26. Revised by REV-EllipticRegulators.
  - Remaining: Bloch Lectures 5–6 inputs (gap).
  - Remaining: Proof of Bloch's (10.3.1) (gap).
  - Remaining: The Green kernel from GZ.2 (requested).
- **In the ER.3 part: planned.** 
  - Remaining: Close the exact GZ.2 Green-kernel request without creating another general Green theory.
  - Remaining: Prove the Gaussian/Sobolev pairing approximation in the recorded analytic gap, making Proposition 24’s interchange legitimate.
  - Remaining: Discharge the repeated-root and exceptional-constant continuity reduction for both separate Lecture 9 arguments.
  - Remaining: For source collation, compare the public direct proof with Bloch Lectures 5–6 and 10 when publicly accessible; no unread book passage is claimed as verified.

The ER.3 part accounts for the layer's targets as follows.

| Target | Nodes | Imported or requested |
|---|---|---|
| Orbit-sum definition, compact convergence, inversion, conjugation and distribution | `ER.3/the-elliptic-dilogarithm`, `ER.3/bloch-wigner-bounds-at-zero` | — |
| Ordinary and Bloch companions, Bernoulli correction, ellipticity and permitted-lift equality | `ER.3/the-companion-and-Bloch-convention` | — |
| Lattice-basis change with antiholomorphic weight | `ER.3/lattice-basis-change` | — |
| Truncated divisors and zeros on annuli, uniform companion and dilogarithm estimates | `ER.3/truncated-theta-products`, `ER.3/zeros-of-truncated-products`, `ER.3/companion-truncation-estimates`, `ER.3/steinberg-for-the-dilogarithm` | — |
| Projective-line relative relation and both separate Lecture 9 Steinberg limits | `ER.3/relative-projective-line-chow-bridge`, `ER.3/steinberg-relation-on-the-projective-line`, `ER.3/steinberg-for-the-companion`, `ER.3/steinberg-for-the-dilogarithm`, `ER.3/the-steinberg-relation-by-truncation` | — |
| Complex Fourier/Kronecker expression with justified exchanges | `ER.3/weight-two-kronecker-kernel`, `ER.3/complex-fourier-coefficient-calculation`, `ER.3/complex-fourier-reconstruction`, `ER.3/fourier-and-kronecker-eisenstein` | — |
| Singular Green-kernel Fourier expression and comparison with Goncharov’s pairing | `ER.3/green-function-of-the-curve`, `ER.3/goncharov-function-and-the-regulator` | Supplier request and regularised pairing convergence gap below. |

### The elliptic Bloch-Wigner dilogarithm

`ER.3/the-elliptic-dilogarithm` · definition · planet “The elliptic dilogarithm” · parent packet

For q in C with 0 < |q| < 1 the ELLIPTIC DILOGARITHM is D_q(x) = Σ_{n∈Z} D(xq^n) for x in C^×, D the Bloch–Wigner function of Polylogarithms P.1; for E with the normalised uniformisation η of ER.1 and q = exp(2πiτ), D_{E,η}(P) = D_q(exp(2πiη(P))) (Brunault Définition 19, (1.38); Bloch Lemma 8.1.1). The series converges uniformly on compact subsets of C^×; D_q is continuous, real-analytic off q^Z, invariant under x ↦ qx, odd (D_q(1/x) = −D_q(x)), satisfies D_{q̄}(x̄) = −D_q(x) (so D_q vanishes on R^× when q is real), and the distribution relations D_{E,η}(nP) = n Σ_{Q∈E[n]} D_{E,η}(P + Q) hold for n ≠ 0. For E over R with the normalisation (1.40), D_E := D_{E,η} depends only on the orientation of E(R), and reversing it changes the sign of D_E.

**Hypotheses.**

- 0 < |q| < 1; for D_{E,η}, q comes from an oriented basis (ER.1).
- D is Polylogarithms P.1's Bloch–Wigner function; the bound |D(z)| ≤ 2|z|(1 + |log|z||) for |z| ≤ 1/2 is ER.3/bloch-wigner-bounds-at-zero.
- D_{E,η} depends on η; only for real E does (1.40) remove the dependence, up to sign.

**Construction.**

1. Uniform convergence on compacta: for n ≥ 0 apply ER.3/bloch-wigner-bounds-at-zero at xq^n; for n < 0 use D(z) = −D(1/z) (P.1/distribution-and-inversion) and the same bound at x^{-1}q^{-n} (Bloch, proof of Lemma 8.1.1).
2. Continuity and real-analyticity off q^Z from P.1/bloch-wigner-dilogarithm and P.1/single-valued-continuity.
3. q-invariance by re-indexing n ↦ n + 1; oddness and conjugation from D(1/z) = −D(z) and D(z̄) = −D(z).
4. Distribution: E[n] corresponds to {ζ q^{k/n}}; re-index and apply D(z^n) = n Σ_{ζ^n = 1} D(ζz) (P.1/distribution-and-inversion).
5. Real normalisation: reversing the orientation replaces x by 1/x (ER.1/the-q-parameter-and-the-multiplicative-presentation); apply oddness.

**API.**

- `ellipticDilog` (data): D_q(x) = Σ_{n∈Z} D(xq^n).
- `ellipticDilog_converges` (characterisation): Uniform convergence on compact subsets of C^×.
- `ellipticDilog_continuous` (characterisation): Continuous on C^×, real-analytic off q^Z.
- `ellipticDilog_mul_q` (simp): D_q(qx) = D_q(x).
- `ellipticDilog_inv` (relation): D_q(1/x) = −D_q(x).
- `ellipticDilog_conj` (relation): D_{q̄}(x̄) = −D_q(x).
- `ellipticDilog_distribution` (relation): D_{E,η}(nP) = n Σ_{Q∈E[n]} D_{E,η}(P + Q) for n ≠ 0.
- `ellipticDilog_real` (compatibility): For E over R normalised by (1.40), D_E depends only on E and the orientation.
- `ellipticDilog_orientation_sign` (relation): Reversing the orientation of E(R) negates D_E.

**Unit tests.**

- `value_at_i` (computation): D_{e^{−2π}}(i) = 0.9432623087139065947...
- `vanishing` (degenerate): D_q(1) = 0; for real q, D_q(x) = 0 for every real x (in particular at the 2-torsion point −1).
- `distribution_two` (characterisation): D_q(x²) = 2(D_q(x) + D_q(−x) + D_q(q^{1/2}x) + D_q(−q^{1/2}x)); at q = e^{−2π}, x = 0.3 + 0.7i both sides are 0.530237890914402...
- `one_sided_not_invariant` (non-example): The one-sided sum Σ_{n≥0} D(xq^n) is not q-invariant: its value at qx minus its value at x is −D(x), i.e. −0.9159655941772... at x = i.
- `brunault_fourier` (compatibility): D_{E,η} equals Brunault's Fourier series (1.49) and (1.50) (ER.3/fourier-and-kronecker-eisenstein); at τ = 0.23 + 1.05i, η(P) = 0.31 + 0.17τ all three give 0.502940259517639...

**Acceptance.**

- The series converges uniformly on compact subsets of C^×; D_q is continuous and real-analytic off q^Z.
- D_q(qx) = D_q(x), D_q(1/x) = −D_q(x), D_{q̄}(x̄) = −D_q(x).
- The distribution relations hold for every non-zero n (checked numerically for n = 2, 3 at τ = 0.23 + 1.05i to 15 digits).
- D_{e^{−2π}}(i) = 0.9432623087139065947... (Catalan's constant 0.9159655941772... plus 2 Σ_{n≥1} D(i e^{−2πn})).
- For E over R it is determined by E and the orientation of E(R); reversing the orientation changes its sign.

**Uses.**

- ER.4: The divisor formula evaluates this function on a divisor.
- ER.5: Bloch’s CM theorem expresses an L-value through values of this function.
- ER.8: The worked examples are numerical evaluations of it.

**Depends on.** this roadmap: `ER.3/bloch-wigner-bounds-at-zero`, `ER.1/the-q-parameter-and-the-multiplicative-presentation`, `ER.1/complex-uniformisation`; other roadmaps: `Polylogarithms:P.1/bloch-wigner-dilogarithm`, `Polylogarithms:P.1/distribution-and-inversion`, `Polylogarithms:P.1/single-valued-continuity`.

**Needed by.** this roadmap: `ER.3/the-companion-and-Bloch-convention`, `ER.3/fourier-and-kronecker-eisenstein`, `ER.3/steinberg-for-the-dilogarithm`, `ER.7/the-X1-11-example`, `ER.8/the-conductor-14-example`, `ER.3/complex-fourier-coefficient-calculation`.

**Sources.**

- `Brunault.These.2005`, §1.2, Définition 19, (1.38), p. 21: “Le dilogarithme elliptique DE,η associé à E et η est la fonction définie par DE,η : E → R, [x] ↦ Σ_{n=−∞}^{∞} D(xq^n), où nous avons utilisé l'identification (1.37).” — The definition, verbatim (the source's isomorphism is η, its period ratio τ).
- `Brunault.These.2005`, §1.2, after (1.38), p. 21: “La série (1.38) définissant DE,η, vue comme série de fonctions de la variable x ∈ C∗, converge uniformément sur tout compact. La fonction DE,η est de classe C∞ sur E − {0}, et continue en 0.” — Convergence and regularity, verbatim.
- `Brunault.These.2005`, §1.2, (1.39), p. 22: “DE,η(nP) = n Σ_{Q∈E[n]} DE,η(P + Q) (P ∈ E, n ∈ Z, n ≠ 0), où E[n] désigne le groupe des points de n-torsion de E. En particulier, la fonction DE,η est impaire.” — The distribution relations and oddness, verbatim.
- `Brunault.These.2005`, Remarque 20, (1.41), p. 22: “ne dépend que du choix de l'orientation de E(R) ; changer cette orientation revient à changer le signe de la fonction DE.” — The sign ambiguity for a real curve, verbatim.
- `Bloch.CRM11`, Lecture 8, Lemma 8.1.1, printed p. 61: “LEMMA 8.1.1. The expression D_q(x) = Σ_{n∈Z} D(xq^n) defines a continuous function D_q : E → R.” — Bloch's definition and continuity.

### Bloch's companion J_q, its q-invariant regularisation J(q; ·), and Bloch's function R_q = J + iD_q

`ER.3/the-companion-and-Bloch-convention` · construction · planet “Bloch's function R_q = J_q + iD_q” · parent packet

Let J(x) = log|x| log|1 − x| (J(0) = J(1) = 0). Bloch's companion is J_q(x) = Σ_{n≥0} J(xq^n) − Σ_{n≥1} J(x^{-1}q^n) (Bloch (8.1.4)); both one-sided sums converge WITHOUT any correction, whereas the two-sided sum Σ_{n∈Z} J(xq^n) diverges. J_q is continuous on C^× and J_q(qx) − J_q(x) = −(log|x|)² (8.1.5), so J_q is NOT a function on E. It is well defined on divisors: if Σ d_j = Σ e_k = 0 and Π α_j^{d_j} = Π β_k^{e_k} = 1 (a permitted lift), J_q(F^- ∗ G) = Σ d_j e_k J_q(α_j^{-1}β_k) depends only on the divisors of f and g (Lemma 8.1.4), giving J_q : C(E)^× ⊗ C(E)^× → R (8.1.6). The q-invariant regularisation is J(q; x) = J_q(x) + (1/3)(log|q|)² B_3(log|x|/log|q|), B_3(t) = t³ − 3t²/2 + t/2 (Zagier 1990, p. 616; the same Bernoulli term is Bloch's Lemma 10.2.2): it satisfies J(q; qx) = J(q; x), J(q; 1/x) = −J(q; x), J(q̄; x̄) = J(q; x), and agrees with J_q on every permitted lift of a pair of divisors. Bloch's complex function is R_q = J + iD_q (Bloch (8.1.2)); it is the one the stage text pins. The source's function differs by conjugation and sign (2R_ω(P, 0) = −conj(R_q(x)); proved in ER.3/goncharov-function-and-the-regulator, not here). For E over R normalised by (1.40), J(q; ·) vanishes on the real locus, so real symbols only see D_q; for a complex embedding both parts are needed, and under a change of oriented basis D_q alone is not invariant (ER.3/lattice-basis-change).

**Hypotheses.**

- 0 < |q| < 1, so log|q| < 0 and the Bernoulli term is defined.
- Bloch's J_q lives on C^×; only its values on permitted lifts of divisor pairs, or the regularised J(q; ·), descend to E.
- Convention: R_q = J + iD_q (Bloch); Brunault's 2R_ω(·, 0) is −conj(R_q); Zagier's Kronecker formula is about D − iJ = −iR_q.

**Construction.**

1. Convergence of the one-sided sums from ER.3/bloch-wigner-bounds-at-zero (|J(z)| ≤ 2|z| |log|z|| for |z| ≤ 1/2); divergence of the two-sided sum since J(xq^{-n}) grows like n² (log|q|)².
2. (8.1.5) by re-indexing, using J(x) + J(1/x) = (log|x|)².
3. Lemma 8.1.4: moving the lift of α_j by q^{n_j} changes J_q(F^- ∗ G) by a multiple of Σ_j d_j n_j Σ_k e_k (log|β_k|)² = 0 (the printed proof drops a minus sign, source issue EllipticRegulators/E4; the conclusion stands).
4. q-invariance of J(q; ·): B_3(t + 1) − B_3(t) = 3t² (mathlib Polynomial.bernoulli_comp_one_add_X) contributes exactly +(log|x|)², cancelling (8.1.5).
5. Agreement on permitted lifts: the Bernoulli term is a cubic polynomial in log|β_k| − log|α_j|, and each of its monomials is killed by one of Σ d_j = 0, Σ d_j log|α_j| = 0, Σ e_k = 0, Σ e_k log|β_k| = 0.
6. Oddness and conjugation of J(q; ·) from J(1/z) = (log|z|)² − J(z), conj-invariance of J, and B_3(−t) = −B_3(t) − 3t² (or from the Fourier expansion of ER.3/fourier-and-kronecker-eisenstein).
7. Real locus: for real q the map x ↦ 1/x̄ fixes |x| = 1 (and sends |x| = q^{1/2} to itself modulo q^Z); oddness, conjugation invariance and q-invariance give J(q; x) = J(q; 1/x̄) = −J(q; x̄) = −J(q; x) there, so J(q; x) = 0 (this is the J-half of Brunault (1.64)).

**API.**

- `blochJ` (data): J_q(x) = Σ_{n≥0} J(xq^n) − Σ_{n≥1} J(x^{-1}q^n) (8.1.4).
- `blochJ_mul_q` (relation): J_q(qx) − J_q(x) = −(log|x|)² (8.1.5).
- `blochJ_divisor` (characterisation): J_q(F^- ∗ G) depends only on the divisors of f and g for permitted lifts (Lemma 8.1.4), giving (8.1.6).
- `ellipticJ` (data): J(q; x) = J_q(x) + (1/3)(log|q|)² B_3(log|x|/log|q|).
- `ellipticJ_mul_q` (simp): J(q; qx) = J(q; x).
- `ellipticJ_eq_blochJ_of_permitted` (compatibility): Σ d_j e_k J(q; α_j^{-1}β_k) = J_q(F^- ∗ G) for permitted lifts.
- `ellipticJ_inv` (relation): J(q; 1/x) = −J(q; x); J(q̄; x̄) = J(q; x).
- `ellipticR` (data): R_q(x) = J(q; x) + iD_q(x) (Bloch's convention).
- `ellipticR_im` (projection): Im R_q = D_q.
- `ellipticR_re` (projection): Re R_q = J(q; ·).
- `ellipticJ_eq_zero_of_real` (relation): For real q and |x| = 1 (or |x| = q^{1/2}), J(q; x) = 0.

**Unit tests.**

- `two_sided_diverges` (non-example): The partial sums of Σ_{|n|≤N} J(xq^n) at τ = 0.23 + 1.05i, x = exp(2πi(0.31 + 0.17τ)) are 2177.9, 15955.5, 121833.9 for N = 5, 10, 20.
- `blochJ_not_invariant` (non-example): J_q(qx) − J_q(x) = −(log|x|)², equal to −1.25787121131 at the same point: Bloch's J_q is not a function on E.
- `ellipticJ_invariant` (characterisation): J(q; qx) = J(q; x) for all x.
- `value` (computation): At the same point: J(q; x) = 0.43352307796225..., J_q(x) = −0.242027754937798..., D_q(x) = 0.502940259517639...
- `real_locus` (degenerate): J(e^{−2π}; x) = 0 whenever |x| = 1; J(q; x) = 0 at the real points (0, 1) and (1, √3) of y² = x³ + x + 1 (q ≈ −0.1092).
- `permitted_lift` (compatibility): On the divisor pair of ER.2's computation test, Σ m n J_q(Q_j − P_i) = Σ m n J(q; Q_j − P_i) = −0.331324812695; moving one point of (f) by τ gives −22.4005498 for J_q.

**Acceptance.**

- The two-sided sum Σ_{n∈Z} J(xq^n) diverges (partial sums 2177.9, 15955.5, 121833.9 for |n| ≤ 5, 10, 20 at the test point); Bloch's one-sided sums converge with no correction.
- J_q(qx) − J_q(x) = −(log|x|)² (−1.25787121131 at τ = 0.23 + 1.05i, x = exp(2πi(0.31 + 0.17τ))), while J(q; qx) = J(q; x).
- J(q; ·) agrees with J_q on permitted lifts (both give −0.331324812695 on the divisor pair of ER.2's computation test) and a non-permitted lift changes the J_q value (to −22.4005498).
- Im R_q = D_q and Re R_q = J(q; ·); at the test point J(q; x) = 0.43352307796225..., J_q(x) = −0.242027754937798..., D_q(x) = 0.502940259517639....
- For E over R normalised by (1.40), J(q; x) = 0 at every real point (checked on y² = x³ − x and y² = x³ + x + 1).

**Uses.**

- ER.4, the divisor formula: The regulator of {f, g} is conj(R_q) on the diamond convolution (ER.3/goncharov-function-and-the-regulator).
- ER.5: Bloch's Lemma 10.2.2: the regulator of S_a is C³ R_q at a torsion point, the Bernoulli term included.
- ER.3, the Steinberg relation: Lecture 9 treats J_q and D_q separately, with their own estimates.

**Depends on.** this roadmap: `ER.3/the-elliptic-dilogarithm`, `ER.3/bloch-wigner-bounds-at-zero`, `ER.1/the-q-parameter-and-the-multiplicative-presentation`; libraries: `mathlib:Polynomial.bernoulli`, `mathlib:Polynomial.bernoulli_comp_one_add_X`.

**Needed by.** this roadmap: `ER.3/the-steinberg-relation-by-truncation`, `ER.3/fourier-and-kronecker-eisenstein`, `ER.3/goncharov-function-and-the-regulator`, `ER.3/truncated-theta-products`, `ER.3/companion-truncation-estimates`, `ER.3/steinberg-for-the-companion`, `ER.4/the-divisor-formula`, `ER.4/the-regulator-of-the-corrected-classes`, `ER.4/bloch-lift-formula`, `ER.3/complex-fourier-coefficient-calculation`, `ER.4/weighted-logarithmic-term`, `ER.4/weighted-dilogarithmic-term`, `ER.4/torsion-bernoulli-horizontal-term`, `ER.4/direct-raw-fourier-identity`, `ER.4/direct-regularized-fourier-identity`, `ER.8/quadratic-regulator-trace`.

**Sources.**

- `Bloch.CRM11`, Lecture 8, (8.1.2), printed p. 61: “We fix q = e^{2πiτ} ∈ C* with |q| < 1 such that E ≅ C*/q^Z. Then (8.1.2) R = R_q = J_q + iD_q, where J_q and D_q are real valued.” — Bloch's convention, verbatim.
- `Bloch.CRM11`, Lecture 8, (8.1.4)–(8.1.5), printed p. 62: “Define (8.1.4) J_q(x) = Σ_{n=0}^{∞} J(xq^n) − Σ_{n=1}^{∞} J(x^{-1}q^n). J_q(x) is clearly continuous on C*, and we have (8.1.5) J_q(qx) − J_q(x) = −J(x^{-1}) − J(x) = −(log|x|)².” — Bloch's companion and its failure of q-invariance, verbatim.
- `Bloch.CRM11`, Lecture 8, Lemma 8.1.4, printed p. 62: “Let F = Σ d_j(α_j), G = Σ e_k(β_k) be divisors on C*, and assume Σ d_j = Σ e_k = 0, Π α_j^{d_j} = Π β_k^{e_k} = 1. Then F and G project to divisors of elliptic functions f, g on E = C*/q^Z, and the expression J_q(F^- ∗ G) = Σ d_j e_k J_q(α_j^{-1}β_k)” — Well-definedness on divisors (the sentence ends: 'depends only on the divisors of f and g').
- `Zagier.BWR.1990`, §2, p. 616: “we find after a short calculation that the function J(q; x) = Σ_{l=0}^{∞} J(q^l x) − Σ_{l=1}^{∞} J(q^l x^{-1}) + log³|x|/(3 log|q|) − log²|x|/2 + log|x| log|q|/6 (q, x ∈ C, |q| < 1) is invariant under x ↦ qx” — The Bernoulli regularisation: the three extra terms are (1/3) log²|q| B_3(log|x|/log|q|).
- `Brunault.These.2005`, §1.2, after Théorème 21, pp. 23–24: “Cette dernière fonction est liée à la fonction Jq de Bloch [12, (8.1.4), p. 62] ; elle coïncide avec l'opposée de la fonction J(q; x) définie par Zagier [79, p. 616].” — Brunault's J_{E,η} (the Im-part of (1.50)) is −J(q; ·); confirmed numerically (source issue EllipticRegulators/E3 records the missing proof).

### Bloch's theorem: D_q and J_q are Steinberg functions, so R_q descends to K_2

`ER.3/the-steinberg-relation-by-truncation` · theorem · parent packet

D_q and J_q are Steinberg functions on E (Bloch Theorems 8.1.2 and 8.1.5, proved as Theorems 9.2.1 and 9.1.1): for every non-constant elliptic function f and every constant K ≠ 0, D_q((f)^- ∗ (K − f)) = 0 and J_q((f)^- ∗ (K − f)) = 0 on permitted lifts, and both vanish when one entry is constant. Hence R_q = J + iD_q induces a homomorphism K_2(C(E)) → C (Matsumoto presentation), and a map on K_2(E) through K_2(E) → K_2(C(E)). The proof is Bloch's: truncate the theta product of f to F_N on annuli (ER.3/truncated-theta-products, ER.3/zeros-of-truncated-products), apply the relation on the projective line to F_N (ER.3/steinberg-relation-on-the-projective-line), and let N → ∞ with the separate estimates for the two parts (ER.3/steinberg-for-the-companion, ER.3/steinberg-for-the-dilogarithm). The identity for D_q does not give the one for J_q. (Brunault obtains the vanishing for his R_E by Stokes instead: Lemma 15 with Proposition 17 give (1.31); that route needs ER.3/green-function-of-the-curve.)

**Hypotheses.**

- f is a non-constant elliptic function and K is in C^×; divisors are lifted to C^× with Σ d_j = 0 and Π α_j^{d_j} = 1.
- K_2(C(E)) is presented by Matsumoto's theorem (K2SymbolsBrauer T.2).

**Proof outline.**

1. Theorem 9.1.1: ER.3/steinberg-for-the-companion.
2. Theorem 9.2.1: ER.3/steinberg-for-the-dilogarithm.
3. Constant entries: a constant has zero divisor, so J_q(L ⊗ g) = D_q(L ⊗ g) = 0.
4. {f, K − f} = {f, 1 − f/K} + {f, K} gives the relation for {f, 1 − f}; descend through K2SymbolsBrauer:T.2/matsumoto.

**Acceptance.**

- R_q((f)^- ∗ (1 − f)) = 0 for every non-constant elliptic f, for the real and the imaginary part.
- R_q induces a homomorphism K_2(C(E)) → C.
- Each part is proved with its own estimates; the D_q identity alone does not give the J_q identity.

**Depends on.** this roadmap: `ER.3/steinberg-for-the-companion`, `ER.3/steinberg-for-the-dilogarithm`, `ER.3/the-companion-and-Bloch-convention`; other roadmaps: `K2SymbolsBrauer:T.2/matsumoto`.

**Sources.**

- `Bloch.CRM11`, Lecture 8, Theorem 8.1.2, printed p. 61: “THEOREM 8.1.2. D_q is a Steinberg function (cf. Definition 5.3.1) and hence induces a map D_q: K_2(C(E)) → R.” — The imaginary part, verbatim.
- `Bloch.CRM11`, Lecture 8, Theorem 8.1.5, printed p. 63: “THEOREM 8.1.5. J_q(f ⊗ (1 − f)) = 0 for f ≢ 1, so J_q induces a map J_q: K_2(E) → K_2(C(E)) → R.” — The real part, verbatim.

**Assembly note.** Bloch reduces to simple zeros and generic K without spelling out the limit (source issue E5). The continuity of the weighted divisor evaluation as roots of f − K collide, and the exceptional constants K = 0, 1 and constant f, are the ER.3 part's open gap 'Multiple roots and exceptional constants in Lecture 9'. The relative projective-line relation does not close it.

### The Fourier and Kronecker-Eisenstein descriptions

`ER.3/fourier-and-kronecker-eisenstein` · theorem · parent packet

For τ in the upper half-plane, P in E with η(P) = a + bτ (a, b in R/Z) and x = exp(2πiη(P)): D_q(x) − iJ(q; x) = −(Im τ)²/π Σ'_{m,n} e^{2πi(mb − na)}/((m + nτ)²(m + nτ̄)), the sum over (m, n) ≠ (0, 0) converging ABSOLUTELY (terms O(|m + nτ|^{-3})), everywhere including P = 0. Equivalently, with λ = m[1] + n[τ] in H_1(E, Z), χ_λ(P) = exp(2πi⟨λ, P⟩) for the complex orientation (⟨[1], [τ]⟩ = +1) and η(λ) = m + nτ, Brunault's (1.49)–(1.50) hold and J_{E,η} = −J(q; ·); so R_q(x) = −i(Im τ)²/π Σ'_λ χ_λ(P)/(η(λ)² conj(η(λ))). The opposite orientation of the intersection pairing negates D. Neither D_q nor R_q needs regularisation here; the only series of this layer that is not absolutely convergent is the Green function's Σ' χ_λ/‖λ‖² ((1.54), Remark 23), which is used only as a distribution or paired against smooth forms (ER.3/green-function-of-the-curve). At C-torsion points the identity is Bloch's (10.3.1), where the m = 0 terms are the Bernoulli term of J(q; ·) (Lemma 10.2.3).

**Hypotheses.**

- The indexing is by H_1(E, Z) through the Abel–Jacobi isomorphism of ER.1/periods-and-the-comparison-isomorphism, with the intersection pairing oriented by the complex structure.
- J(q; ·) is the regularised companion of ER.3/the-companion-and-Bloch-convention; Bloch's unregularised J_q corresponds to the sum over m ≠ 0 at the lifts used in (10.3.1).
- Absolute convergence of this series is not in question; the justification needed is for the Green-function series and for the interchange in Brunault's Proposition 24 (source issue EllipticRegulators/E2).

**Proof outline.**

1. At a point P of order dividing C, apply Bloch's (10.3.1) (Lecture 10, §10.3, a statement about values of R_q only) to f(m, n) = Im χ_{m[1]+n[τ]}(P), which is odd and C-periodic, and invert the finite Fourier transform (Brunault p. 23); the terms with m = 0 are Bloch's Lemma 10.2.3 and account for the Bernoulli term.
2. Both sides are continuous in P (the right side by absolute convergence, the left by ER.3/the-elliptic-dilogarithm and ER.3/the-companion-and-Bloch-convention) and torsion points are dense: the identity holds everywhere.
3. Rewrite with λ, χ_λ and η(λ) to obtain (1.49) and (1.50), and J_{E,η} = −J(q; ·) by taking imaginary parts.
4. Record that the Green-function series is not absolutely convergent (Remark 23) and is handled in ER.3/green-function-of-the-curve.

**Acceptance.**

- D_q − iJ(q; ·) is the displayed absolutely convergent Kronecker–Eisenstein series; at τ = 0.23 + 1.05i, η(P) = 0.31 + 0.17τ: D = 0.502940259517639, J = 0.43352307796225 on both sides to 15 digits (also at τ = 0.8i, η(P) = 0.2 + 0.35τ and τ = 1/2 + 0.9i, η(P) = 0.13 + 0.61τ).
- (1.49) gives the same value (0.50294026 with |m|, |n| ≤ 400).
- With the opposite orientation of the intersection pairing the right side is −D_q: the orientation convention is part of the statement.
- No regularisation of D_q or R_q is needed; the non-absolutely convergent series is the Green function's.

**Depends on.** this roadmap: `ER.3/the-companion-and-Bloch-convention`, `ER.3/the-elliptic-dilogarithm`, `ER.1/periods-and-the-comparison-isomorphism`; libraries: `mathlib:ZMod.dft`.

**Needed by.** this roadmap: `ER.3/lattice-basis-change`, `ER.3/goncharov-function-and-the-regulator`, `ER.4/the-divisor-formula`, `ER.4/bloch-theorem-10-2-1`.

**Sources.**

- `Brunault.These.2005`, §1.2, Théorème 21, (1.50), p. 23: “Théorème 21 (Bloch, [12]). Le développement de Fourier du dilogarithme elliptique DE,η est donné par [...] DE,η(P) = −(ℑ(τ)²/π) ℜ(Σ'_{λ∈H1(E,Z)} χλ(P)/(η(λ)² \overline{η(λ)})) (P ∈ E),” — The Kronecker–Eisenstein expansion of D; its imaginary-part companion is J_{E,η} = −J(q; ·).
- `Brunault.These.2005`, §1.2, Remarque 25, p. 26: “La série intervenant dans (1.61) est normalement convergente en tant que série de fonctions sur E × E. En conséquence, la fonction RE est continue sur E × E.” — Absolute (normal) convergence of the complex function's series.
- `Brunault.These.2005`, §1.2, Remarque 23, p. 25: “Le recours aux distributions dans la proposition 22 s'explique par le fait que la série intervenant dans le membre de droite de (1.54) n'est pas absolument convergente.” — The series that is not absolutely convergent is the Green function's.
- `Bloch.CRM11`, Lecture 10, (10.3.1), printed p. 80: “10.3. Using Lemmas 10.2.2 and 10.2.3, the main result, Theorem 10.2.1 can be rewritten (10.3.1) Σ_{k,ℓ=0}^{C−1} f̂(k, ℓ)R_q(e^{2πi(k+ℓτ)/C}) = (y²i/π) Σ_{m,n∈Z, m≠0} f(m, n)/((mτ + n)²(m τ̄ + n)).” — The identity at torsion points, as a statement about values of R_q.

**Assembly note.** The ER.3 part proves this identity directly, at every point including 0. `ER.3/complex-fourier-coefficient-calculation` computes the torus Fourier coefficients of D_q − iJ(q; ·), and `ER.3/complex-fourier-reconstruction` reconstructs the absolutely convergent expansion from them.

- This answers source issue E3 (J_{E,η} = −J(q; ·) asserted without proof) and the part of the parent's fourth gap that concerns this node.
- At C-torsion points the identity is also `ER.4/direct-regularized-fourier-identity`.
- The node's prerequisites can add `ER.3/complex-fourier-reconstruction`, which does not depend on this node, so no cycle arises.

### Bounds for D and J near zero

`ER.3/bloch-wigner-bounds-at-zero` · lemma · parent packet · added by REV-EllipticRegulators

For |z| ≤ 1/2: |D(z)| ≤ 2|z|(1 + |log|z||) and |J(z)| = |log|z| log|1 − z|| ≤ 2|z| |log|z||; for z, z' in a disc of radius a ≤ e^{−1}/4 about 0, |D(z) − D(z')| and |J(z) − J(z')| are O(|z − z'| |log|z − z'||). These are the bounds behind the convergence of the orbit sums (Bloch, proof of Lemma 8.1.1 citing Corollary 6.1.2) and behind Lemmas 9.1.5 and 9.2.3.

**Hypotheses.**

- D is P.1's Bloch–Wigner function, D(z) = Im Li_2(z) + arg(1 − z) log|z|.

**Proof outline.**

1. |Im Li_2(z)| ≤ Σ_{n≥1}|z|^n/n² ≤ 1.2|z| and |arg(1 − z)| ≤ |log(1 − z)| ≤ 2|z| for |z| ≤ 1/2.
2. |log|1 − z|| ≤ 2|z| for |z| ≤ 1/2 gives the J bound.
3. The Hölder-type bounds as in Bloch's proof of Lemma 9.1.5 (p. 72), using that y|log y| is increasing for y ≤ e^{−1}.

**Acceptance.**

- The three bounds hold with the stated constants.
- They imply uniform convergence of Σ_n D(xq^n) and of Bloch's one-sided J-sums on compact subsets of C^×.

**Depends on.** other roadmaps: `Polylogarithms:P.1/bloch-wigner-dilogarithm`, `Polylogarithms:P.1/classical-polylogarithm`; libraries: `mathlib:Complex.log`.

**Needed by.** this roadmap: `ER.3/the-elliptic-dilogarithm`, `ER.3/the-companion-and-Bloch-convention`, `ER.3/companion-truncation-estimates`, `ER.3/steinberg-for-the-dilogarithm`.

**Sources.**

- `Bloch.CRM11`, Lecture 9, proof of Lemma 9.2.2, printed p. 73: “This is an easy consequence (cf. the proof of Sublemma 9.1.4) of the obvious bound D(y) = O(|y| log|y|), y → 0.” — The bound at zero; Bloch's Corollary 6.1.2 (Lecture 6, not read) is the version cited in Lemma 8.1.1.

### Change of the lattice basis: R_q transforms by 1/(cτ̄ + d)

`ER.3/lattice-basis-change` · theorem · parent packet · added by REV-EllipticRegulators

For τ in the upper half-plane, γ = (a b; c d) in SL_2(Z), τ' = γτ, z in C, x = exp(2πiz) and x' = exp(2πiz/(cτ + d)): R_{q(τ')}(x') = R_{q(τ)}(x)/(cτ̄ + d). In particular D alone is NOT invariant: D_{q(τ')}(x') = Im(R_{q(τ)}(x)/(cτ̄ + d)), which involves J(q; x). Under τ ↦ τ + 1 (c = 0, d = 1) nothing changes; under τ ↦ −1/τ, R' = R/τ̄.

**Hypotheses.**

- The new basis is the one of ER.1/complex-uniformisation's change-of-basis rule (η' = η/(cτ + d)); the intersection pairing is SL_2(Z)-invariant, so χ_λ is unchanged.

**Proof outline.**

1. In the series of ER.3/fourier-and-kronecker-eisenstein, λ ↦ λ/(cτ + d), η(λ) ↦ η(λ)/(cτ + d) and Im τ' = Im τ/|cτ + d|².
2. Hence the series is multiplied by (cτ + d)²(cτ̄ + d)/|cτ + d|⁴ = 1/(cτ̄ + d).
3. Equivalently: Brunault's R_ω is C-linear in ω and ω' = ω/(cτ + d), with 2R_ω(P, 0) = −conj(R_q).

**Acceptance.**

- At τ = 0.23 + 1.05i, z = 0.31 + 0.17τ and γ = S: D_{q'}(x') = 0.494093380257417 and J(q'; x') = −0.370760744817555, equal to Im and Re of R_q(x)/τ̄, while D_q(x) = 0.502940259517639.
- τ ↦ τ + 1 leaves D and J unchanged (difference below 10^{-21}).

**Depends on.** this roadmap: `ER.3/fourier-and-kronecker-eisenstein`, `ER.1/complex-uniformisation`; libraries: `mathlib:UpperHalfPlane`.

**Sources.**

- `Brunault.These.2005`, §1.2, Remarque 27, p. 27: “Remarque 27. Nous pouvons déduire de la formule (1.63) la dépendance de la fonction DE,η en l'isomorphisme η.” — The source announces the dependence on η without stating it; this node states it (stage text: 'lattice-basis change').

### The Green function of E and its Fourier series

`ER.3/green-function-of-the-curve` · construction · parent packet · added by REV-EllipticRegulators

The Arakelov Green function G_X of a compact Riemann surface (∂_y∂̄_y G_X(x, ·) = πi vol_X off x, G_X(x, y) − log|z(y)| smooth at x, ∫ G_X(x, ·) vol_X = 0; symmetric) is imported from GrossZagierAndArithmeticHeights GZ.2. For E with η : E ≅ C/(Z + τZ): vol_E = (i/(2 Im τ)) η^*(dz ∧ dz̄) and ‖λ‖² = π|η(λ)|²/Im τ ((1.57)–(1.58)); G_E(P, Q) = −(1/2) Σ'_λ χ_λ(P − Q)/‖λ‖² as distributions, the series not being absolutely convergent (Proposition 22, Remark 23); G_E is translation invariant (Proposition 18), and for E over R normalised by (1.40), G_E(P, c(t)) = G_E(P, t) for real P ((1.65)). In closed form, G_E(0, z) = (1/2) B_2(b) log|q| + log|1 − x| + Σ_{n≥1} log|(1 − q^n x)(1 − q^n x^{-1})| for η(z) = a + bτ with 0 ≤ b < 1 and x = exp(2πiη(z)) (Kronecker's second limit formula). For f in C(E)^×, log|f| = C_f + Σ_x ord_x(f) G_E(x, ·) with C_f = ∫ log|f| vol_E ((1.14)–(1.15)).

**Hypotheses.**

- E is a complex elliptic curve with η of ER.1/complex-uniformisation.
- The general existence and normalisation are GZ.2's (requested); the elliptic Fourier and closed forms are proved here.

**Construction.**

1. Import G_X from GZ.2 with its characterisation (Brunault Proposition 9, properties 1–3 and 7).
2. Compute ∂χ_λ, ∂̄χ_λ, ‖λ‖² and vol_E ((1.55)–(1.58)); the distribution −(1/2)Σ' χ_λ/‖λ‖² has ∂∂̄ = πi(vol_E − δ_0) and integral 0, so it is G_E(0, ·) by uniqueness (Proposition 22).
3. Translation invariance (Proposition 18) and the real case (1.65).
4. Closed form: both sides have the same ∂∂̄, the same logarithmic singularity and integral 0 (∫_0^1 B_2 = 0 and the log-terms average to 0 over a).
5. (1.14): log|f| − Σ ord_x(f) G_E(x, ·) is harmonic on E, hence constant, and the constant is ∫ log|f| vol_E.

**API.**

- `greenFunction` (data): G_E : E × E − Δ → R.
- `greenFunction_fourier` (characterisation): G_E(P, Q) = −(1/2) Σ' χ_λ(P − Q)/‖λ‖² as distributions.
- `greenFunction_translate` (simp): G_E(P + a, Q + a) = G_E(P, Q).
- `greenFunction_closedForm` (characterisation): G_E(0, z) = (1/2)B_2(b) log|q| + log|1 − x| + Σ_{n≥1} log|(1 − q^n x)(1 − q^n/x)|.
- `greenFunction_logAbs` (relation): log|f| = C_f + Σ ord_x(f) G_E(x, ·) (1.14).
- `greenFunction_eq_arakelov` (compatibility): G_E is GZ.2's Green kernel of E(C) with the Arakelov volume form.

**Unit tests.**

- `integral_zero` (degenerate): ∫_E G_E(0, ·) vol_E = 0.
- `closed_form_value` (computation): G_E(0, z) = 0.111063245655... at τ = 0.23 + 1.05i, η(z) = 0.31 + 0.17τ.
- `laplacian` (characterisation): ∂∂̄ G_E(0, ·) = πi(vol_E − δ_0) as currents.
- `not_absolutely_convergent` (non-example): Σ'_{‖λ‖ ≤ R} 1/‖λ‖² grows like log R: the Fourier series of G_E is not absolutely convergent and cannot be integrated termwise without justification.
- `arakelov` (compatibility): G_E agrees with GZ.2's Arakelov Green kernel of E(C).

**Acceptance.**

- G_E(0, ·) has integral 0 against vol_E and a logarithmic singularity at 0 with coefficient 1.
- At τ = 0.23 + 1.05i, z = 0.31 + 0.17τ the closed form gives 0.111063245655, and the Gaussian-regularised Fourier sum −(1/2)Σ' χ_λ e^{−δ‖λ‖²}/‖λ‖² equals it minus δ/2 (δ = 0.02, 0.005, 0.00125).

**Uses.**

- ER.3, Goncharov's function: R_ω is defined by integrating G_E against ω ∧ ∂̄G_E.
- ER.2 via Proposition 17: (1.14) turns r_E{f, g} into a double sum over the divisors.

**Depends on.** this roadmap: `ER.1/complex-uniformisation`, `ER.1/periods-and-the-comparison-isomorphism`; layers of other roadmaps: `GrossZagierAndArithmeticHeights:GZ.2`; libraries: `mathlib:Polynomial.bernoulli`.

**Needed by.** this roadmap: `ER.3/goncharov-function-and-the-regulator`, `ER.4/the-divisor-formula`.

**Sources.**

- `Brunault.These.2005`, §1.2, Proposition 22, (1.54), p. 24: “Proposition 22. La distribution sur E définie par la série de Fourier Σ'_{λ∈H1(E,Z)} χλ/‖λ‖² est de classe C∞ sur E − {0}. Pour tous points P, Q ∈ E avec P ≠ Q, nous avons GE(P, Q) = −(1/2) Σ'_{λ∈H1(E,Z)} χλ(P − Q)/‖λ‖².” — The Fourier series of the Green function, verbatim.
- `Brunault.These.2005`, §1.1, Proposition 9, p. 16: “Proposition 9 (Arakelov [2]). Il existe une unique fonction GX : X × X − ∆X → R, appelée fonction de Green associée à X, de classe C∞ et vérifiant les trois conditions suivantes.” — The general Green function, owned by GZ.2.

**Assembly note.** The ER.3 part refines the GZ.2 request. It asks for a real normalised kernel that is smooth off the diagonal, symmetric and of mean zero, with ∂∂̄G = πi(vol − δ_P) and local bounds that put G(P, ·) in every L^p and ∂̄G(P, ·) in L^p for p < 2. On the torus the kernel is to be identified with this node's. No GZ.2 node supplies it yet (the ER.3 part's first gap).

### Goncharov's function R_E, Brunault's Proposition 26, and the regulator as conj(R_q) on the diamond convolution

`ER.3/goncharov-function-and-the-regulator` · theorem · parent packet · added by REV-EllipticRegulators

For ω in Ω^{1,0}(E) let R_ω(P, Q) = ∫_{t∈E} G_E(P, t) ω_t ∧ ∂̄_t G_E(Q, t) (Brunault Définition 11) and R_E(P, Q) = (ω ↦ R_ω(P, Q)) (Définition 14). Then R_E is antisymmetric (Proposition 12) and translation invariant (Proposition 18); for ω = η^*dz, R_ω(P, Q) = (πi/2) Σ'_λ χ_λ(P − Q) η(λ)/‖λ‖⁴ (Proposition 24, (1.62)), a normally convergent series (Remarque 25). With x = exp(2πiη(P)): 2R_ω(P, 0) = −J(q; x) + iD_q(x) = −conj(R_q(x)) (Proposition 26 with J_{E,η} = −J(q; ·)); for E over R normalised by (1.40), R_ω(P, Q) = (i/2) D_E(P − Q) for P, Q in E(R) ((1.64)). For f, g in C(E)^×, r_E{f, g}(ω) = Σ_x Σ_y ord_x(f) ord_y(g) R_ω(x, y) (Proposition 17). The resulting formula on divisors, with the diamond convolution, is ER.4/the-divisor-formula.

**Hypotheses.**

- E is a complex elliptic curve with η, q as in ER.1; R_q is Bloch's function with the regularised J (on the divisors of f and g it equals Bloch's J_q on permitted lifts).
- The interchange of sum and integral in Proposition 24 needs the justification of source issue EllipticRegulators/E2.

**Proof outline.**

1. Antisymmetry by Stokes (Proposition 12) and translation invariance (Proposition 18).
2. Proposition 24: insert the Fourier series of ER.3/green-function-of-the-curve into Définition 11 and integrate; justify the interchange by pairing G_E(P, ·) in the Sobolev space H^{1/2} with ω ∧ ∂̄G_E(Q, ·) in H^{−1/2} (Parseval), or by Gaussian regularisation and δ → 0; the resulting series is absolutely convergent.
3. Proposition 26: rewrite (1.62) with ‖λ‖⁴ = π²|η(λ)|⁴/(Im τ)² and compare with ER.3/fourier-and-kronecker-eisenstein.
4. (1.64): conjugation invariance of G_E ((1.65)) gives R_ω(P, Q) in iR for real P, Q.
5. Proposition 17: substitute (1.14) for log|f| and log|g| in (1.27); the constant C_f contributes −C_f ∫ d(log|g| ω) = 0.
6. Combine with translation invariance and oddness of R_q.

**Acceptance.**

- 2R_ω(P, 0) from the lattice sum (1.62) (|m|, |n| ≤ 120) is −0.4335231634 + 0.5029403073i, against −J(q; x) + iD_q(x) = −0.4335230780 + 0.5029402595i at τ = 0.23 + 1.05i, η(P) = 0.31 + 0.17τ.
- For the theta quotients of ER.2/the-regulator-on-symbols: (1/2) conj(R_q(Σ m n [Q_j − P_i])) = −0.1656624063 + 0.0350051346i, equal to the quadrature value of r_E{f, g}(dz).
- J(q; x) = 0 at the real points of y² = x³ − x and y² = x³ + x + 1 (both components), as (1.64) requires.

**Depends on.** this roadmap: `ER.3/green-function-of-the-curve`, `ER.3/fourier-and-kronecker-eisenstein`, `ER.3/the-companion-and-Bloch-convention`, `ER.2/the-regulator-on-symbols`, `ER.1/complex-uniformisation`.

**Sources.**

- `Brunault.These.2005`, §1.2, Proposition 26, (1.63), p. 26: “Le dilogarithme elliptique DE,η s'exprime en fonction de RE au moyen de la formule DE,η(P) = 2 · ℑ(Rω(P, 0)) (P ∈ E), où nous avons posé ω = η∗dz.” — Proposition 26, verbatim (the packet's excerpt wrote ω = dz and renamed η, τ).
- `Brunault.These.2005`, §1.2, Proposition 26, (1.64), p. 26: “Rω(P, Q) = (i/2) DE(P − Q) (P, Q ∈ E(R)),” — The real case.
- `Brunault.These.2005`, §1.1, Proposition 17, (1.28), p. 19: “Proposition 17. Pour toutes fonctions méromorphes f, g ∈ C(X)∗, nous avons l'égalité rX({f, g}) = Σ_{x∈(f)} Σ_{y∈(g)} ordx(f) ordy(g)RX(x, y),” — The regulator as a double sum of R_X over the divisors.

**Assembly note.** Brunault's Proposition 24 exchanges a series that is not absolutely convergent with an integral (source issue E2). The ER.3 part records the missing step as a gap. Before passing to the limit, one must prove either that the Gaussian-smoothed Green kernel converges in L³ and its ∂̄ in L^{3/2}, or the equivalent H^{1/2}/H^{−1/2} duality statement. The final series in |λ|^{−3} then admits dominated convergence.

### The relation on the projective line: J and D vanish on (f)^- ∗ (K − f)

`ER.3/steinberg-relation-on-the-projective-line` · lemma · parent packet · added by REV-EllipticRegulators

Let f be in C(t)^× with f(0) = f(∞) = 1, so that (f) = Σ_j d_j(α_j) on C^× with Σ d_j = 0 and Π α_j^{d_j} = 1, and let g be in C(t)^× with (g) = Σ_k e_k(β_k) on C^×. Then J((f)^- ∗ (g)) := Σ d_j e_k J(α_j^{-1}β_k) = Σ_{x∈C^×} log|x| log|tame_x{f, g}| (Bloch Lemma 8.1.3), and consequently J((f)^- ∗ (K − f)) = 0 for every K in C^×; likewise D((f)^- ∗ (K − f)) = Σ d_j e_k D(α_j^{-1}β_k) = 0 (D is a relative Steinberg function).

**Hypotheses.**

- f(0) = f(∞) = 1 is Bloch's condition f in (1 + I)^*; the tame symbol is K2SymbolsBrauer T.3's.

**Proof outline.**

1. Lemma 8.1.3: expand log|g| log|c Π(α_j − β_ℓ)^{e_ℓ}| and use (log|α|)² = J(α) + J(1/α).
2. {f, K − f} = {f, 1 − f/K} + {f, K}; the first has trivial tame symbols, the second has tame_x = K^{ord_x f}, and Σ_x ord_x(f) log|x| = log|Π α_j^{d_j}| = 0.
3. For D: the relative Steinberg property of D on the projective line (Bloch Lecture 6, not read here; the gap is recorded), obtainable from P.5/chow-dilogarithm-projective-line and P.5/chow-dilogarithm-steinberg with g = t.

**Acceptance.**

- For f = (t − a1)(t − a2)/((t − b1)(t − b2)) with a1 = 0.3 + 1.2i, a2 = −0.7 + 0.4i, b1 = 1.1 − 0.5i, b2 = a1a2/b1 and K = 0.6 − 1.3i, both sums are below 10^{-24} in absolute value.

**Depends on.** other roadmaps: `K2SymbolsBrauer:T.3/tame-symbol`, `Polylogarithms:P.1/bloch-wigner-dilogarithm`, `Polylogarithms:P.5/chow-dilogarithm-projective-line`, `Polylogarithms:P.5/chow-dilogarithm-steinberg`.

**Needed by.** this roadmap: `ER.3/steinberg-for-the-companion`, `ER.3/steinberg-for-the-dilogarithm`.

**Sources.**

- `Bloch.CRM11`, Lecture 8, Lemma 8.1.3, printed p. 62: “LEMMA 8.1.3. The diagram (notation as in Lecture 5) below commutes.” — The J-part; the diagram is tame followed by log|·| · log|·| against (5.3.1) followed by J.
- `Bloch.CRM11`, Lecture 9, proof of Theorem 9.1.1, printed p. 69: “It is an easy exercise from the diagram in Lemma 8.1.3 to show J(f⊗(K−f)) = 0 for f ∈ (1+I)*, K ∈ C*.” — The consequence used in (9.1.1).

**Assembly note.** The D-part, which the parent states with a numerical check only (its third gap), is proved in the ER.3 part by `ER.3/relative-projective-line-chow-bridge`, from Polylogarithms P.5's projective-line Chow dilogarithm.

- The bridge covers K ≠ 0, 1 and allows repeated zeros and poles through their multiplicities; constant f is treated separately.
- The node's prerequisites can add the bridge, which depends only on P.1, P.5 and Mathlib.
- The J-part is Bloch's Lemma 8.1.3, as stated.
- Collation with Bloch's Lectures 5–6 remains recorded.

### Truncating the theta product on annuli, and counting zeros (Lemmas 8.2.1, 8.2.2)

`ER.3/truncated-theta-products` · lemma · parent packet · added by REV-EllipticRegulators

Let f be an elliptic function whose pull-back to C^× is the theta product F(w) of (8.2.1), with Σ d_j = 0 and Π α_j^{d_j} = 1, and fix K ≠ 0, 1. Let A_N be the annulus |q|^N ≤ |w| ≤ |q|^{−N} (8.2.2), F_0(w) = Π_j (w − α_j)^{d_j}, F_N(w) = Π_{|r|≤N} F_0(q^r w) and T_N the tail product, so that F_N T_N = F (8.2.3). (i) There is R > 0 independent of N such that F_N − K has no zeros off A_{N+R} (Lemma 8.2.1). (ii) For irrational 0 < ε < 1, R > 0 and N_0 there is N ≥ N_0 with Z(F_N − K, N(1 − ε) + R) = Z(F − K, N(1 − ε) + R), Z(g, R) the number of zeros of g on A_R; hence along a sequence N → ∞ the number of zeros of F_N − K off A_{N(1−ε)+R} is O(Nε) + O(1) (Lemma 8.2.2).

**Hypotheses.**

- q, f, K as stated; the argument principle and Rouché's theorem are Tau Ceti's.

**Proof outline.**

1. Lemma 8.2.1: replace F(w) by F(w^{-1}) and w by q^N w, and bound the power series of F_N(q^N w) termwise by Π_r 1/(1 − |q|^r s w).
2. Lemma 8.2.2: choose N with Nε + R mod 1 in a compact V ⊂ R/Z avoiding the log|β_k|/log|q| and log|α_j|/log|q| (possible because ε is irrational); on ∂A_{N(1−ε)+R}, |F(w) − K| ≥ δ(V), |F_N(w)| = O(1) and |T_N(w) − 1| = O(|q|^{Nε}); so |(F_N − K)/(F − K) − 1| < 1 there, the winding number of the quotient is 0 (tauceti:TauCeti.rouche_windingNumber_comp), and the argument principle (tauceti:TauCeti.argumentPrinciple_windingNumber) equates the zero counts.

**Acceptance.**

- The bounds (i) and (ii) hold with constants independent of N along the chosen sequence.

**Depends on.** this roadmap: `ER.3/the-companion-and-Bloch-convention`, `ER.1/the-q-parameter-and-the-multiplicative-presentation`; libraries: `tauceti:TauCeti.rouche_windingNumber_comp`, `tauceti:TauCeti.argumentPrinciple_windingNumber`.

**Needed by.** this roadmap: `ER.3/zeros-of-truncated-products`.

**Sources.**

- `Bloch.CRM11`, Lecture 8, Lemma 8.2.1, printed p. 64: “LEMMA 8.2.1. There exists an R > 0 independent of N such that F_N(w) − K has no zeros off the annulus A_{N+R}.” — Statement (i), verbatim.
- `Bloch.CRM11`, Lecture 8, Lemma 8.2.2, printed p. 65: “LEMMA 8.2.2. Given 0 < ε < 1 irrational, R > 0, and N_0 > 0, there exists N ≥ N_0 such that Z(F_N(w) − K, N(1 − ε) + R) = Z(F(w) − K, N(1 − ε) + R).” — Statement (ii), verbatim.

### Where the zeros of F_N − K lie (Lemmas 8.2.3, 8.2.4)

`ER.3/zeros-of-truncated-products` · lemma · parent packet · added by REV-EllipticRegulators

In the setting of ER.3/truncated-theta-products, write F(w) − K = μ Π_k (Π_{n≥0}(1 − β_k q^n w^{-1})^{e_k} Π_{n≥1}(1 − β_k^{-1} q^n w)^{e_k}) with Σ e_k = 0 and Π β_k^{e_k} = 1 (8.2.4), and assume e_k = ±1. (iii) For ε so small that the circle γ_k of radius ε about β_k contains neither 0 nor another β_{k'}, and N ≫ 0, every zero or pole of F_N − K on A_{N(1−ε)+R} lies in exactly one translate γ_k q^r, and no two lie in the same translate (Lemma 8.2.3). (iv) Let β_k(N, r) be the singularity inside γ_k q^r (|r| ≤ N(1 − ε)) and β'_N the others, with multiplicities e_{β'_N}; then Σ e_{β'_N} = 0 and Σ e_{β'_N} log|β'_N| = O(Nε) + O(1) (Lemma 8.2.4).

**Hypotheses.**

- The simplifying assumption e_k = ±1 is Bloch's ('for simplicity'); the reduction to it is part of ER.3/steinberg-for-the-companion (source issue EllipticRegulators/E5).

**Proof outline.**

1. Lemma 8.2.3: for N ≫ 0, |K||T_N(β) − 1| < inf_{γ_k}|K − F|; a zero β of F_N − K satisfies |F(β) − K| = |(1 − T_N(β))K|, so β lies in some γ_j q^r; Rouché (tauceti:TauCeti.rouche_windingNumber_comp) and e_k = ±1 give uniqueness.
2. Lemma 8.2.4: Σ e_{β_N} log|β_N| = log|F_N(0) − K| = log|1 − K|, |log|β_k(N, r)| − log|β_k q^r|| = O(ε), Σ_k e_k log|β_k q^r| = 0, and there are O(N) of the β_k(N, r).

**Acceptance.**

- (iii) and (iv) hold for N ≫ 0 along the sequence of ER.3/truncated-theta-products.

**Depends on.** this roadmap: `ER.3/truncated-theta-products`; libraries: `tauceti:TauCeti.rouche_windingNumber_comp`, `tauceti:TauCeti.argumentPrinciple_windingNumber`.

**Needed by.** this roadmap: `ER.3/companion-truncation-estimates`, `ER.3/steinberg-for-the-companion`, `ER.3/steinberg-for-the-dilogarithm`.

**Sources.**

- `Bloch.CRM11`, Lecture 8, Lemma 8.2.3, printed p. 66: “Then for N ≫ 0, any zero or pole of F_N(w) − K on A_{N(1−ε)+R} lies inside exactly one translate γ_k · q^r. No two roots lie in the same translate.” — Statement (iii), verbatim.
- `Bloch.CRM11`, Lecture 8, Lemma 8.2.4, printed p. 67: “LEMMA 8.2.4. Σ e_{β'_N} = 0 and Σ e_{β'_N} log|β'_N| = O(Nε) + O(1) as N → ∞.” — Statement (iv), verbatim.

**Assembly note.** Bloch reduces to simple zeros and generic K without spelling out the limit (source issue E5). The continuity of the weighted divisor evaluation as roots of f − K collide, and the exceptional constants K = 0, 1 and constant f, are the ER.3 part's open gap 'Multiple roots and exceptional constants in Lecture 9'. The relative projective-line relation does not close it.

### Uniform estimates for the companion (Lemmas 9.1.2–9.1.5)

`ER.3/companion-truncation-estimates` · lemma · parent packet · added by REV-EllipticRegulators

With Bloch's notation J_f(x) = Σ_j d_j J(α_j^{-1}x) for (f) = Σ_j d_j(α_j), J_{F,q}(x) = Σ_j d_j J_q(α_j^{-1}x) and C_F = Σ_j d_j (log|α_j|)²: (a) Σ e_{β'_N} J_{F_N}(β'_N) = O(Nε) + O(1) (Lemma 9.1.2, via J_{F_N}(β) + (log|β|/log|q| − N)C_F = O(1) (9.1.2)); (b) if |xq^{N_0}| ≤ M then Σ_{n≥N_0} |J(xq^n)| = O(M log M) as M → 0 (Sublemma 9.1.4), hence |J_{F,q}(x) − J_{F_N}(x) + N C_F| = O(Nε|q|^{Nε}) uniformly for x in A_{N(1−ε)+R} (Lemma 9.1.3); (c) |J_{F,q}(x) − J_{F,q}(x')| = O(ε log ε) uniformly for |x − x'| ≤ ε|x'| (Lemma 9.1.5).

**Hypotheses.**

- Setting of ER.3/zeros-of-truncated-products; J_q is Bloch's unregularised companion.

**Proof outline.**

1. (9.1.2): split J_{F_N}(β) = Σ_{|r|≤N} J_{F_0}(βq^r) at r = max(−N, −log|β|/log|q|) and use J_{F_0}(x) + J_{F_0^-}(x^{-1}) = C_F and ER.3/bloch-wigner-bounds-at-zero.
2. Lemma 9.1.3 from the identity J(x) + J(1/x) = (log|x|)² and Sublemma 9.1.4.
3. Lemma 9.1.5: J_{F,q}(qx) − J_{F,q}(x) = −C_F reduces to x' in A_1; |J(xq^r) − J(x'q^r)| = O(ε|q|^r r) and |J(x) − J(x')| = O(|x − x'| |log|x − x'||) near 0 (ER.3/bloch-wigner-bounds-at-zero).

**Acceptance.**

- The three estimates hold uniformly as stated.

**Depends on.** this roadmap: `ER.3/zeros-of-truncated-products`, `ER.3/the-companion-and-Bloch-convention`, `ER.3/bloch-wigner-bounds-at-zero`.

**Needed by.** this roadmap: `ER.3/steinberg-for-the-companion`.

**Sources.**

- `Bloch.CRM11`, Lecture 9, Lemma 9.1.3, printed p. 70: “LEMMA 9.1.3. |J_{F,q}(x) − J_{F_N}(x) + NC_F| = O(Nε|q|^{Nε}) as N → ∞, uniformly in x for x ∈ A_{N(1−ε)+R}.” — Estimate (b), verbatim.
- `Bloch.CRM11`, Lecture 9, Lemma 9.1.5, printed p. 71: “LEMMA 9.1.5. For x, x' ∈ C*, |x − x'| ≤ ε|x'|, we have |J_{F,q}(x) − J_{F,q}(x')| = O(ε log ε), ε → 0 uniformly in x, x'.” — Estimate (c), verbatim.

### Theorem 9.1.1: J_q(f ⊗ (K − f)) = 0

`ER.3/steinberg-for-the-companion` · theorem · parent packet · added by REV-EllipticRegulators

For every elliptic function f and every constant K, J_q(f ⊗ (K − f)) = 0 in the notation (8.1.6) (Bloch Theorem 9.1.1).

**Hypotheses.**

- f is non-constant (otherwise the statement is trivial); lifts are permitted.

**Proof outline.**

1. J_q(L ⊗ g) = 0 for constant L, so f may be scaled to the theta-product form (8.2.1).
2. Reduce to K ≠ 0, 1 and simple zeros of F − K (e_k = ±1) by continuity of the expression in the divisors; this reduction is asserted without proof in the source (source issue EllipticRegulators/E5) and must be supplied: K ↦ J_q(f ⊗ (K − f)) is continuous on C^× by (c) of ER.3/companion-truncation-estimates and continuity of the roots, and multiple zeros occur for finitely many K.
3. Apply ER.3/steinberg-relation-on-the-projective-line to F_N and K − F_N: Σ_{|r|≤N(1−ε), k} e_k J_{F_N}(β_k(N, r)) + Σ e_{β'_N} J_{F_N}(β'_N) = 0 (9.1.1).
4. Estimates (a) and (b) turn this into Σ e_k J_{F,q}(β_k(N, r)) = O(Nε) + O(1) + O(N²ε|q|^{Nε}) (9.1.3); (c) replaces β_k(N, r) by β_k q^r at cost O(Nε log ε); J_{F,q}(qx) − J_{F,q}(x) = −C_F and Σ e_k = 0 give (1 + 2N(1 − ε)) Σ_k e_k J_{F,q}(β_k) = O(Nε) + O(1) + O(N²ε|q|^{Nε}) + O(Nε log ε).
5. Divide by 2N(1 − ε) + 1, let N → ∞ along the sequence, then ε → 0.

**Acceptance.**

- J_q((f)^- ∗ (K − f)) = 0 for every elliptic f and constant K.

**Depends on.** this roadmap: `ER.3/companion-truncation-estimates`, `ER.3/zeros-of-truncated-products`, `ER.3/steinberg-relation-on-the-projective-line`, `ER.3/the-companion-and-Bloch-convention`.

**Needed by.** this roadmap: `ER.3/the-steinberg-relation-by-truncation`.

**Sources.**

- `Bloch.CRM11`, Lecture 9, Theorem 9.1.1, printed p. 69: “THEOREM 9.1.1. For any elliptic function f and any constant K, J_q(f ⊗ (K − f)) = 0 (notation as in (8.1.6)).” — The statement, verbatim.

**Assembly note.** Bloch reduces to simple zeros and generic K without spelling out the limit (source issue E5). The continuity of the weighted divisor evaluation as roots of f − K collide, and the exceptional constants K = 0, 1 and constant f, are the ER.3 part's open gap 'Multiple roots and exceptional constants in Lecture 9'. The relative projective-line relation does not close it.

### Theorem 9.2.1: D_q is a Steinberg function (with Lemmas 9.2.2, 9.2.3)

`ER.3/steinberg-for-the-dilogarithm` · theorem · parent packet · added by REV-EllipticRegulators

D_q is a Steinberg function on E (Bloch Theorem 9.2.1): D_q(f ⊗ (K − f)) = 0 for every elliptic function f and constant K. The proof uses (d) |D_{F_N}(x) − D_{F,q}(x)| = O(Nε|q|^{Nε}) uniformly on A_{N(1−ε)+R} (Lemma 9.2.2) and (e) |D_{F,q}(x) − D_{F,q}(x')| = O(ε log ε) uniformly for |x − x'| ≤ ε|x'| (Lemma 9.2.3); it is simpler than the J-part because Σ_n |D(xq^n)| converges, so D_{F_N} is bounded uniformly in x and N.

**Hypotheses.**

- Same setting and reductions as ER.3/steinberg-for-the-companion.

**Proof outline.**

1. (9.2.1): the relative Steinberg property of D on the projective line (ER.3/steinberg-relation-on-the-projective-line) applied to F_N.
2. Since Σ_n |D(xq^n)| converges, D_{F_N} = O(1) uniformly and the number of β'_N is O(Nε) + O(1) (ER.3/zeros-of-truncated-products), giving (9.2.2).
3. Lemma 9.2.2 from |D(y)| = O(|y| log|y|) (ER.3/bloch-wigner-bounds-at-zero); Lemma 9.2.3 as Lemma 9.1.5, using D(1/x) = −D(x) and D(x) = −D(1 − x).
4. Rewrite with β_k q^r, divide by 2N(1 − ε) + 1, let N → ∞ and ε → 0.

**Acceptance.**

- D_q((f)^- ∗ (K − f)) = 0 for every elliptic f and constant K; the proof does not use the J-part.

**Depends on.** this roadmap: `ER.3/zeros-of-truncated-products`, `ER.3/steinberg-relation-on-the-projective-line`, `ER.3/the-elliptic-dilogarithm`, `ER.3/bloch-wigner-bounds-at-zero`; other roadmaps: `Polylogarithms:P.1/distribution-and-inversion`.

**Needed by.** this roadmap: `ER.3/the-steinberg-relation-by-truncation`.

**Sources.**

- `Bloch.CRM11`, Lecture 9, Theorem 9.2.1, printed p. 73: “9.2. The proof of the corresponding result for D_q is similar but slightly less complicated. THEOREM 9.2.1. D_q is a Steinberg function (Definition 5.3.1) on E.” — The statement, verbatim.
- `Bloch.CRM11`, Lecture 9, Lemma 9.2.2, printed p. 73: “LEMMA 9.2.2. |D_{F_N}(x) − D_{F,q}(x)| = O(Nε|q|^{Nε}) as N → ∞ uniformly in x for x ∈ A_{N(1−ε)+R}.” — Estimate (d), verbatim.

**Assembly note.** Bloch reduces to simple zeros and generic K without spelling out the limit (source issue E5). The continuity of the weighted divisor evaluation as roots of f − K collide, and the exceptional constants K = 0, 1 and constant f, are the ER.3 part's open gap 'Multiple roots and exceptional constants in Lecture 9'. The relative projective-line relation does not close it.

### The weight-two Kronecker–Eisenstein kernel

`ER.3/weight-two-kronecker-kernel` · construction · planet “Kronecker–Eisenstein kernel” · ER.3 part

For τ∈C with y=Im τ>0, a,b∈R and v=(m,n)∈Z² set λ_v=m+nτ and χ_v(a,b)=exp(2πi(mb−na)). Define K_τ(a,b;0,0)=0 and K_τ(a,b;m,n)=χ_v(a,b)/(λ_v² conjugate(λ_v)) otherwise. This is the summand, not an assumption of convergence. The character is the intersection-pairing character for the oriented basis (1,τ), and agrees with the product of the unit-period circle characters of indices −n and m.

**Hypotheses.**

- y>0 for norm and nonzero-denominator statements; the displayed total function is defined for all τ.
- The point has additive coordinate a+bτ; m is the coefficient of 1 in the lattice vector, n the coefficient of τ.

**Construction.**

1. Use the baseline exponential to form the character. Remove the zero lattice index explicitly.
2. If m+nτ=0, its imaginary part gives n=0 and then m=0; hence the other denominators are nonzero.
3. Multiplicativity of the exponential gives integral-period invariance and the AddCircle comparison. Norm multiplicativity gives |K|=|λ|⁻³.

**API.**

- `TauCeti.EllipticRegulator.kroneckerTerm_zero` (simp): K_τ(a,b;0,0)=0.
- `TauCeti.EllipticRegulator.kroneckerTerm_eq` (characterisation): For v≠(0,0), K_τ(a,b;v)=χ_v(a,b)/((m+nτ)²(m+n conjugate τ)).
- `TauCeti.EllipticRegulator.kroneckerTerm_norm` (data): For y>0 and v≠0, |K_τ(a,b;v)|=|m+nτ|⁻³.
- `TauCeti.EllipticRegulator.kroneckerTerm_neg_index` (relation): K_τ(a,b;−m,−n)=−conjugate(χ_v(a,b))/((m+nτ)²(m+n conjugate τ)); this also holds at v=0 using total division.
- `TauCeti.EllipticRegulator.kroneckerTerm_neg_point` (relation): K_τ(−a,−b;m,n)=−K_τ(a,b;−m,−n).
- `TauCeti.EllipticRegulator.kroneckerTerm_add_int_left` (simp): For k∈Z, K_τ(a+k,b;v)=K_τ(a,b;v).
- `TauCeti.EllipticRegulator.kroneckerTerm_add_int_right` (simp): For k∈Z, K_τ(a,b+k;v)=K_τ(a,b;v).
- `TauCeti.EllipticRegulator.kroneckerTerm_circle` (compatibility): For v≠0, K equals fourier(−n)(a mod Z) times fourier(m)(b mod Z), divided by (m+nτ)²(m+n conjugate τ), using Mathlib’s unit-period AddCircle characters.

**Unit tests.**

- `TauCeti.EllipticRegulator.kernel_zero_index` (degenerate): At τ=i and a=b=0, K(0,0)=0.
- `TauCeti.EllipticRegulator.kernel_real_axis` (computation): At τ=i and a=b=0, K(1,0)=1.
- `TauCeti.EllipticRegulator.kernel_imaginary_axis` (computation): At τ=i and a=b=0, K(0,1)=−i, distinguishing λ² conjugate λ from λ conjugate λ².
- `TauCeti.EllipticRegulator.kernel_quarter_phase` (computation): At τ=i, a=1/4,b=0, K(0,1)=−1, distinguishing exp(−2πina) from exp(+2πina).
- `TauCeti.EllipticRegulator.kernel_circle_character` (compatibility): At τ=i, a=0,b=1/4, K(1,0)=fourier(1)(1/4 mod Z)=i.
- `TauCeti.EllipticRegulator.kernel_not_green` (non-example): At τ=i and a=b=0, K(2,0)=1/8, different from the Green-kernel coefficient scale 1/4.

**Acceptance.**

- The six tests distinguish the sign of the character, the placement of conjugation, and exclusion of the zero index.

**Uses.**

- ER.3/fourier-and-kronecker-eisenstein and this part’s Fourier reconstruction: The norm formula and integral-period invariance produce a normally convergent function on the torus.
- ER.3/lattice-basis-change: The denominator identifies the antiholomorphic weight and prevents treating D alone as basis invariant.
- ER.4/the-divisor-formula; ER.5 finite torsion-character evaluation: The character orientation matches Q−P in the diamond convolution and controls the sign of torsion sums.

**Depends on.** libraries: `mathlib:Complex.exp`, `mathlib:fourierCoeff`.

**Needed by.** this roadmap: `ER.3/complex-fourier-reconstruction`.

**Lean.** module `TauCeti/NumberTheory/EllipticRegulator/Kronecker`, namespace `TauCeti.EllipticRegulator`; declaration `TauCeti.EllipticRegulator.kroneckerTerm`.

**Sources.**

- `Zagier.BWR.1990`, §2, p. 616, denominator; Theorem 1, p. 619: “This is a classical series” — The weight-two double-series summand, rewritten in the oriented basis (1,τ); sourceIssue E-ER3-1 fixes its complex normalization.

### Direct complex Fourier coefficients of the orbit sums

`ER.3/complex-fourier-coefficient-calculation` · theorem · planet “Elliptic Kronecker expansion” · ER.3 part

Let τ∈C, y=Im τ>0, q=exp(2πiτ) and x(a,b)=exp(2πi(a+bτ)). Let D_q and J(q;·) be the imported orbit sum and Bernoulli-regularised companion. Put F_τ(a,b)=D_q(x(a,b))−iJ(q;x(a,b)). With the normalized character χ_{m,n}=exp(2πi(mb−na)), the coefficient ∫₀¹∫₀¹ F_τ(a,b) conjugate(χ_{m,n}(a,b)) da db is zero for (m,n)=(0,0), and otherwise is −y²/[π(m+nτ)²(m+n conjugate τ)]. This is the complex coefficient calculation; it includes the companion, not only the real part.

**Hypotheses.**

- Use the imported continuous, periodic D_q and J(q;·), with the latter’s correction (log|q|)² B₃(log|x|/log|q|)/3.
- Both integrals are with Lebesgue measure on [0,1]; equivalently, normalized Haar measure on the two unit circles.

**Proof outline.**

1. For a disc argument w, expand Li₂(w)=Σ w^h/h² and log(1−w)=−Σ w^h/h. Then D(w)−iJ(w)=Σ[(w^h−conjugate(w)^h)/(2ih²)+i log|w| w^h/h]. This follows from the imported Bloch–Wigner definition.
2. Use inversion to split the orbit at b+r>0 and b+r<0. The one-sided sums and their integrals commute: away from b=0,1 use geometric uniform bounds; over the whole strip the integrals of the absolute disc-series terms are bounded by constant multiples of Σ h⁻³. Boundary values follow from continuity and have measure zero.
3. For horizontal frequency h>0, unfold b+r to u∈R. The integrands are −i(1/(2h²)+2πyu/h) exp(2πi(hτ−m)u) for u>0 and −i/(2h²) exp(2πi(h conjugate τ−m)u) for u<0. Integrating these exponential and u-exponential terms gives y²/[π(hτ−m)²(h conjugate τ−m)], which is the required coefficient with n=−h. Oddness F(−a,−b)=−F(a,b) supplies h<0.
4. At horizontal frequency zero the ordinary disc terms have zero average; the remaining function is −i(4π²y²/3)B₃(b). Use baseline bernoulliFourierCoeff_eq at k=3 to obtain −y²/(πm³) for m≠0 and zero for m=0. This is the formerly missing Bernoulli mode.

**Acceptance.**

- At (m,n)=(1,0) the coefficient is the negative real number −y²/π.
- At τ=i, (m,n)=(0,1) the coefficient is i/π.
- The correction contributes every n=0 coefficient; omitting it fails the first test.

**Depends on.** this roadmap: `ER.3/the-elliptic-dilogarithm`, `ER.3/the-companion-and-Bloch-convention`; other roadmaps: `Polylogarithms:P.1/classical-polylogarithm`, `Polylogarithms:P.1/bloch-wigner-dilogarithm`, `Polylogarithms:P.1/distribution-and-inversion`; libraries: `mathlib:Complex.log`, `mathlib:bernoulliFourierCoeff_eq`, `mathlib:fourierCoeff_eq_intervalIntegral`, `mathlib:MeasureTheory.integral_tsum_of_summable_integral_norm`.

**Needed by.** this roadmap: `ER.3/complex-fourier-reconstruction`.

**Lean.** declaration `TauCeti.EllipticRegulator.complex_fourier_coefficients`.

**Sources.**

- `Zagier.BWR.1990`, §2, proof of Theorem 1, pp. 619–620: “single integral from 0 to ∞” — Use the unfolding, disc expansion and Laplace-integral method. The coefficient is recalculated in weight two rather than copied from the erroneous printed Theorem 1.
- `Brunault.These.2005`, §1.2, Theorem 21 and the companion assertion, pp. 23–24: “elle coïncide avec l’opposée” — The real-part theorem and asserted companion identification are both accounted for by this direct complex calculation.

### Reconstruction of the elliptic Kronecker expansion

`ER.3/complex-fourier-reconstruction` · comparison · ER.3 part

Under the coefficient theorem’s hypotheses, Σ_{v∈Z²} K_τ(a,b;v) converges absolutely and uniformly for all real a,b. Its continuous torus function satisfies F_τ(a,b)=−y²/π Σ_v K_τ(a,b;v), including (a,b)=(0,0). Thus R_q=J+iD_q=−iy²/π Σ_v K_τ. This supplies the complex equality in the imported ER.3/fourier-and-kronecker-eisenstein node without a finite-torsion or unread-book proof assumption.

**Hypotheses.**

- Im τ>0; F_τ is the imported continuous doubly periodic orbit-sum function.

**Proof outline.**

1. Identify Z² with PeriodPair.lattice for periods (1,τ). The lattice is discrete of rank two. Apply ZLattice.summable_norm_rpow with exponent −3; compare with the kernel norm. The majorant is independent of a,b, hence gives uniform convergence and continuity.
2. Use integral_tsum_of_summable_integral_norm: the total area is one and each integral of the norm is bounded by the same summable lattice majorant. Character orthogonality gives the displayed coefficients for the summed kernel.
3. Subtract this function from F_τ. For each horizontal index its circle coefficient is a continuous function of b, all of whose vertical coefficients vanish by the coefficient theorem. Fourier-basis injectivity in L² and continuity make it zero everywhere. Repeat in the a variable.
4. At the origin pair v with −v in the absolutely convergent series: their sum is zero. This agrees with inversion invariance of the imported orbit-sum functions. Multiply by i to obtain R_q and compare the real and imaginary parts with Brunault’s notation.

**Acceptance.**

- At τ=0.23+1.05i, (a,b)=(0.31,0.17), F=0.502940259517639−0.433523077962249i. A square cutoff of 400 agrees within 3×10⁻9 (numerical check, not a proof).
- At every two-torsion point, oddness and periodicity give F=0.
- The equality has a continuous value at the origin; the Green series with order |λ|⁻² cannot be substituted for this absolutely convergent series.

**Depends on.** this roadmap: `ER.3/weight-two-kronecker-kernel`, `ER.3/complex-fourier-coefficient-calculation`; libraries: `mathlib:PeriodPair`, `mathlib:PeriodPair.lattice`, `mathlib:ZLattice.summable_norm_rpow`, `mathlib:MeasureTheory.integral_tsum_of_summable_integral_norm`, `mathlib:fourierCoeff`, `mathlib:fourierBasis_repr`.

**Lean.** declaration `TauCeti.EllipticRegulator.complex_fourier_reconstruction`.

**Sources.**

- `Zagier.BWR.1990`, §2, p. 616 and proof of Theorem 1, pp. 619–620: “This proves the theorem.” — The source proof method yields a complete complex Fourier reconstruction with the orientation and signs recalculated.
- `Brunault.These.2005`, §1.2, Theorem 21, p. 23; Remark 25, p. 26: “normalement convergente” — Real-part comparison and normal convergence of the weight-two series.

### Relative Steinberg relation on the projective line

`ER.3/relative-projective-line-chow-bridge` · theorem · planet “Relative Steinberg relation” · ER.3 part

Let f∈C(t)× be regular at 0 and ∞ with f(0)=f(∞)=1. Let K∈C× with K≠1 and g=K−f nonzero. Write div(f)=Σ_j d_j[α_j] and div(g)=Σ_k e_k[β_k], with finite supports in C×. Then Σ_{j,k}d_j e_k D(β_k/α_j)=0. The degree-zero and product-one conditions for f follow from its endpoint normalization. This generic-constant identity is the precise D-input used in the truncation argument; this identity already allows repeated zeros and poles through their integer multiplicities. The extension of the elliptic truncation argument to exceptional constants and colliding roots uses the separately recorded continuity obligation, not an assumption that the elliptic relation already holds.

**Hypotheses.**

- K≠0,1 and K−f≠0; f and g therefore have no zeros or poles at 0 and ∞.
- D is the Bloch–Wigner dilogarithm of Polylogarithms P.1.
- The Chow dilogarithm is imported from Polylogarithms P.5 with the corrected real normalization −(2π)⁻¹∫r₂, not the imaginary normalization printed in Goncharov.

**Proof outline.**

1. If f is constant, the endpoint normalization forces f=1, so div(f)=0 and the sum is zero. Otherwise put F=f/K, so g/K=1−F. Apply the imported P.5/chow-dilogarithm-projective-line formula to see that P₂(f∧g∧t)=P₂(F∧(1−F)∧t): multiplication by a nonzero constant leaves each divisor unchanged. Thus the scalar-invariance step follows from this listed prerequisite, without invoking the unpromoted chowDilog_const API item.
2. Apply P.5/chow-dilogarithm-steinberg to (1−F)∧F∧t: its value is D(F(0))−D(F(∞))=0, since both endpoint values are 1/K. Reverse the first two wedge entries to get P₂(f∧g∧t)=0.
3. In P.5/chow-dilogarithm-projective-line, div(t)=[0]−[∞] and r(α,β,0,∞)=α/β for the normalization r(∞,0,1,z)=z. Degenerate terms have Bloch–Wigner value zero. Thus P₂(f∧g∧t)=Σ d_j e_k D(α_j/β_k).
4. Use P.1/distribution-and-inversion to negate this sum and obtain the diamond argument β_k/α_j. The proof uses no elliptic relation and no conjectural reciprocity homomorphism.

**Acceptance.**

- For f=1 and K≠0,1, the divisor sum is empty and equals zero.
- Replacing K−f by 1−f/K leaves its divisor unchanged.
- Changing the diamond convention from β/α to α/β negates the sum, rather than leaving the nonzero summands fixed.

**Depends on.** other roadmaps: `Polylogarithms:P.5/chow-dilogarithm`, `Polylogarithms:P.5/chow-dilogarithm-projective-line`, `Polylogarithms:P.5/chow-dilogarithm-steinberg`, `Polylogarithms:P.1/distribution-and-inversion`; libraries: `mathlib:RatFunc.eval`.

**Lean.** declaration `TauCeti.EllipticRegulator.relative_projective_line_steinberg`.

**Sources.**

- `Goncharov.Arakelov.2004`, Theorem 3.4, p. 28; Proposition 6.8 and Lemma 6.9 with proof, p. 57: “Integrating we get the lemma.” — The ensuing Proposition 6.8 gives the projective-line divisor formula, which already makes scalar multiplication irrelevant. The corrected Lemma 6.9 gives the endpoint Steinberg evaluation; Polylogarithms/E11 and E12 supply the normalization corrections.

## ER.4 — The divisor formula and Bloch's classes

*18 nodes: 7 from the parent packet and 11 from the ER.4 part. Planets (6): The diamond convolution; The divisor formula; Bloch's finite Fourier identity; The Bernoulli correction; Bloch’s logarithmic sum; Bloch’s dilogarithmic sum.*

The layer turns the regulator of a symbol into finite combinatorics on divisors and computes it on Bloch's classes built from torsion.

- **The diamond convolution** (f) ⋄ (g) = Σ m_i n_j [Q_j − P_i] is the reflection of (f) times (g) in ℤ[E]. The opposite convention gives the reflected divisor, not the negated one.
- **The divisor formula** r_E({f, g})(dz) = ½ conj(R_q((f) ⋄ (g))) holds for all f and g, with no tame-symbol hypothesis. It was found independently by two checkers of the parent review and checked by direct integration.
- **Bloch's lift formula** shows that the Bernoulli terms cancel on permitted lifts. The product-one condition matters only for the unregularised companion.
- **Bloch's classes.** R_q(S_a) = C³R_q(a) (Lemma 10.2.2).
- **The Lecture 10 transform** f̂ = C⁻² Σ f · conj(χ) is a specialisation of AdditiveCombinatorics AC.0's normalised character interface (RT-AREA-combinatorics/14), not a second Fourier theory.
- **Theorem 10.2.1**: Σ f̂(k, ℓ) R_q(S_{(k+ℓτ)/C}) = (iy²C³/π) Σ' f(m, n)/((mτ + n)²(mτ̄ + n)).
- **The trace formula** for constant-field transfer.

The parent packet states Theorem 10.2.1 but does not decompose its proof (its fourth gap). The ER.4 part supplies a direct analytic proof of the torsion Fourier identity, in this order:

1. absolute convergence of every orbit series and lattice sum used, including the weighted logarithmic double series that the exchange of sums needs;
2. Bloch's logarithmic term L and dilogarithmic term M, with the orbit splitting of M;
3. the Bernoulli horizontal row;
4. the evaluations of L, of the forward dilogarithmic sum and of the unit-circle boundary, whose H terms cancel;
5. the raw identity, without the m = 0 row;
6. the regularised identity Σ_u f̂(u)R_q(x_u) = (iy²/π) Σ' f(m, n)/((mτ + n)²(mτ̄ + n)).

Multiplying by C³ and applying `ER.4/the-regulator-of-the-corrected-classes` gives the parent's `ER.4/bloch-theorem-10-2-1`; the Assembly note there records this. No class theorem, divisor formula or ER.3 Fourier expansion is a prerequisite of the direct identity, so the proof order is acyclic.

The layer is planned, not closed. The only open item is inherited: the trace formula is proved for constant-field extensions, and the geometric statement r_Y(N_φ ξ)(ω) = r_X(ξ)(φ^*ω) for every ξ is ER.7's (`ER.7/regulator-under-finite-pushforward`, gap G2 of the ER.7 part).

**Coverage.**

- **In the parent packet: partial.** The divisor formula, the classes S_a (Lemma 10.2.2), the finite Fourier transform (10.2.1) and Theorem 10.2.1 are decomposed from Bloch's Lectures 8 and 10 and Brunault §§1.1–1.2, with the normalisation r_E({f,g})(dz) = ½·conj(R_q((f) ⋄ (g))) verified numerically. Revised by REV-EllipticRegulators.
  - Remaining: Bloch's route to Theorem 10.2.1 (Lemma 10.2.3, Propositions 10.3.1 and 10.3.3) is not decomposed (gap).
  - Remaining: The trace formula is proved for constant-field extensions only; the geometric compatibility is ER.7's (ER.7/regulator-under-finite-pushforward, gap).
- **In the ER.4 part: planned.** Every ER.4 target is accounted for: seven accepted parent imports plus eleven direct analytic declarations here. Lemma 10.2.3 and Propositions 10.3.1,10.3.3 have an independent proof route to pinned analytic inputs and the imported Fourier/regularization APIs. The new analytic path supplies the parent proof gap, with C³ attached only after analysis.
  - Remaining: ER.7/regulator-under-finite-pushforward must prove geometric compatibility for arbitrary K₂ classes; ER.4 constant-field trace needs no such input.
  - Remaining: Assembly must connect the parent ER.3 Fourier expansion and ER.4 final theorem to direct-regularized-fourier-identity, preserving the existing declaration ids and the no-cycle proof order.

### The diamond convolution of two divisors

`ER.4/the-diamond-convolution` · definition · planet “The diamond convolution” · parent packet

Let A be an abelian group (for the regulator, A = E(k̄) for an elliptic curve over a field, or A = E_τ = ℂ/(ℤ+ℤτ)), and identify divisors with elements of the group ring ℤ[A] (Mathlib's AddMonoidAlgebra ℤ A). For D = Σ_i m_i[P_i] and D′ = Σ_j n_j[Q_j] the DIAMOND CONVOLUTION is D ⋄ D′ = Σ_{i,j} m_i n_j [Q_j − P_i] = ([−1]_* D)·D′, the product in ℤ[A] of the reflection of D with D′. This is the convention of Bloch's formula R_q{f,g} = Σ d_j e_k R_q(α_j^{-1}β_k) (Lecture 10, p. 75; Lemma 8.1.4 writes it F^- * G). The opposite convention Σ m_i n_j [P_i − Q_j] equals [−1]_*(D ⋄ D′): it is the REFLECTED divisor, not the negated one. An odd function (ER.3's R_q and D_q) changes sign under the reflection; an even function does not change.

**Hypotheses.**

- A is an abelian group; no analytic structure is used, so the same definition serves E(k̄) for a number field k (where Galois equivariance is needed in ER.5) and the complex torus E_τ.
- The convention is fixed here once: the second point minus the first.
- Divisors are finite formal sums, i.e. elements of AddMonoidAlgebra ℤ A.

**Construction.**

1. Define D ⋄ D′ := mapDomain (a ↦ −a) D * D′ in AddMonoidAlgebra ℤ A (mathlib:MonoidAlgebra.mapDomain in its to_additive form, and the convolution product of mathlib:AddMonoidAlgebra).
2. On generators, single_mul_single gives [P] ⋄ [Q] = [Q − P] with coefficient m·n; bilinearity is distributivity of the product together with additivity of mapDomain.
3. Degree: the augmentation deg : ℤ[A] → ℤ is a ring homomorphism and deg ∘ mapDomain(−·) = deg, so deg(D ⋄ D′) = deg D · deg D′.
4. Translation: [P] ⋄ D′ is D′ translated by −P; D ⋄ [Q] is the REFLECTION of D translated by Q (not a translate of D in general).
5. Symmetry: D′ ⋄ D = [−1]_*(D ⋄ D′); hence for an odd function F extended linearly, F(D′ ⋄ D) = −F(D ⋄ D′). This is the sign change the opposite convention forces, and it holds only for odd F.
6. Functoriality: for a group homomorphism φ : A → B (an isogeny, a Galois automorphism), φ_*(D ⋄ D′) = φ_*D ⋄ φ_*D′.

**API.**

- `diamond` (data): D ⋄ D′ := mapDomain (a ↦ −a) D * D′ in AddMonoidAlgebra ℤ A.
- `diamond_single_single` (simp): single P m ⋄ single Q n = single (Q − P) (m·n).
- `diamond_add_left` (simp): (D₁ + D₂) ⋄ D′ = D₁ ⋄ D′ + D₂ ⋄ D′.
- `diamond_add_right` (simp): D ⋄ (D′₁ + D′₂) = D ⋄ D′₁ + D ⋄ D′₂.
- `divDeg_diamond` (characterisation): deg(D ⋄ D′) = deg D · deg D′, deg the augmentation.
- `diamond_single_left` (compatibility): [P] ⋄ D′ = mapDomain (a ↦ a − P) D′.
- `diamond_comm` (relation): D′ ⋄ D = mapDomain (a ↦ −a) (D ⋄ D′); the opposite convention is the reflection.
- `diamond_map` (functoriality): For a group homomorphism φ : A →+ B, mapDomain φ (D ⋄ D′) = mapDomain φ D ⋄ mapDomain φ D′.

**Unit tests.**

- `diamond_two_points` (computation): In ℤ[ℤ/5ℤ]: [1] ⋄ [3] = [2], and ([1] + [2]) ⋄ [0] = [4] + [3].
- `diamond_degree_zero` (degenerate): 0 ⋄ D′ = 0, and if deg D = 0 then deg(D ⋄ D′) = 0 for every D′.
- `diamond_opposite_is_reflection` (non-example): In ℤ[ℤ/5ℤ] with D = [1], D′ = [3]: the opposite convention gives [1 − 3] = [3], while −(D ⋄ D′) = −[2]; the opposite convention is [−1]_*(D ⋄ D′), not −(D ⋄ D′).
- `diamond_eq_convolution` (compatibility): (D ⋄ D′)(c) = Σ_{(a,b) : b − a = c} D(a)·D′(b), i.e. diamond agrees with the Finsupp convolution formula of the reflected divisor with D′.
- `diamond_odd_sign` (characterisation): For F : A → ℂ with F(−a) = −F(a), extended ℤ-linearly: F(D′ ⋄ D) = −F(D ⋄ D′).

**Acceptance.**

- [P] ⋄ [Q] = [Q − P].
- The pairing is ℤ-bilinear.
- deg(D ⋄ D′) = deg D · deg D′.
- D′ ⋄ D = [−1]_*(D ⋄ D′), and F(D′ ⋄ D) = −F(D ⋄ D′) for every odd F.
- φ_*(D ⋄ D′) = φ_*D ⋄ φ_*D′ for every homomorphism φ.

**Uses.**

- ER.4, the divisor formula: The regulator of {f, g} is ½·conj(R_q((f) ⋄ (g))).
- ER.4, the regulator of the corrected classes: (ρ) ⋄ (f_a) = C(C²−1)([a] − [0]) − C Σ_{b≠0}([a − b] − [−b]) is what R_q is evaluated on.
- ER.5, the class U: Galois automorphisms act on E(k̄) by group automorphisms; diamond_map makes the evaluation Galois-equivariant.
- Bloch, Lemma 8.1.4 (p. 62): J_q(F^- * G) depends only on the divisors: the same convolution on lifts to ℂ^×.

**Depends on.** libraries: `mathlib:AddMonoidAlgebra`, `mathlib:MonoidAlgebra.mapDomain`.

**Needed by.** this roadmap: `ER.4/the-divisor-formula`, `ER.4/the-regulator-of-the-corrected-classes`, `ER.4/bloch-lift-formula`, `ER.8/quadratic-regulator-trace`.

**Sources.**

- `Bloch.CRM11`, Lecture 10, §10.1, printed p. 75 (PDF p. 87 of the supplied scan): “Thus, if f, g are elliptic functions, Σd_j = Σe_k = 0, Πα_j^{d_j} = Πβ_k^{e_k} = 1, and (f̃) = Σd_j(α_j), (g̃) = Σe_k(β_k) are liftings of (f), (g) to C*, we have R_q{f, g} = Σ d_j e_k R_q(α_j^{-1}β_k).” — The multiplicative argument α_j^{-1}β_k is the point Q_k − P_j of the curve: the convention of this node, verbatim from the scan.
- `Bloch.CRM11`, Lecture 10, proof of Lemma 10.2.2, printed p. 77 (PDF p. 89): “D̄_q((ρ) * (f_{(k+ℓτ)/C})) = C Σ_{Ca=0, a≠0} (−D̄_q(−a + σ((k+ℓτ)/C)) + D̄_q(−a)) + C(C^2 − 1)(D̄_q(σ((k+ℓτ)/C)) − D̄_q(0)).” — Bloch's convolution * on the divisors (ρ) = (C²−1)[0] − Σ_{a≠0}[a] and (f_x) = C[x] − C[0], written out: every term is [second point − first point], confirming the convention.

**Assembly note.** The ER.4 part imports this node by id: Q−P divisor diamond; all API and tests inherited.

### The regulator of a symbol as ER.3's function on the diamond convolution

`ER.4/the-divisor-formula` · theorem · planet “The divisor formula” · parent packet

Let τ ∈ ℍ, y = Im τ, q = e^{2πiτ}, E_τ = ℂ/(ℤ+ℤτ) ≅ ℂ^×/q^ℤ via z ↦ e^{2πiz}, and let R_q = J_q + iD_q be ER.3's q-invariant function on E_τ (J_q including the Bernoulli term (1/3)·log²|q|·B_3(log|x|/log|q|), B_3(t) = t³ − (3/2)t² + (1/2)t), extended ℤ-linearly to divisors. For all f, g ∈ ℂ(E_τ)^× — with no condition on tame symbols — ER.2's regulator r_E({f,g})(ω) = ∫_{E_τ} log|f| · ω ∧ ∂̄log|g| satisfies
  r_E({f,g})(dz) = ½ · conj( R_q((f) ⋄ (g)) ).
Equivalently Brunault's function (thesis (1.20)) satisfies R_{dz}(P, Q) = ½·conj(R_q(Q − P)); in particular Im r_E({f,g})(dz) = −½·D_q((f) ⋄ (g)) and Re r_E({f,g})(dz) = ½·J_q((f) ⋄ (g)). Symbols with a constant entry have r_E = 0, and {f,g} ↦ R_q((f) ⋄ (g)) is Bloch's regulator R_q : K_2(ℂ(E_τ)) → ℂ (Lecture 10, p. 75), so R_q(ξ) = 2·conj(r_E(ξ)(dz)) on all of K_2(ℂ(E_τ)); in particular the Steinberg relation for R_q follows from the one for r_E (ER.2), independently of ER.3's truncation argument.

**Hypotheses.**

- ω = dz is the invariant differential with ∫_{[1]} dz = 1 for the oriented basis (1, τ) of ER.1; for ω = c·dz the left side is multiplied by c, since r_E is ℂ-linear in ω.
- The identity holds on all of K_2(ℂ(E_τ)); vanishing tame symbols are needed only to identify r_E with the period pairing (Polylogarithms P.5/unramified-weight-two-class), never for this formula.
- Under a change of oriented basis τ′ = (ατ+β)/(γτ+δ), z′ = z/(γτ+δ), both sides are multiplied by (γτ+δ)^{-1}, because R_{q′}(z′) = (γτ̄+δ)^{-1} R_q(z) (reviewer's computation; Bloch's Lemma 11.1.3 prints a different factor, source issue EllipticRegulators/E10).

**Proof outline.**

1. Write log|f| = C_f + Σ_x ord_x(f) G_E(x, ·) (ER.4/elliptic-green-function) and kill the constant by Stokes: r_E({f,g})(ω) = Σ_{x,y} ord_x(f) ord_y(g) R_ω(x, y) with R_ω(x,y) = ∫_E G_E(x,t) ω_t ∧ ∂̄_t G_E(y,t) (Brunault Prop. 17, (1.28)–(1.29), p. 19).
2. Translation invariance R_ω(x, y) = R_ω(x − y, 0) (Brunault Prop. 18, (1.34), p. 20).
3. Insert the Fourier series of G_E and integrate term by term: R_{dz}(P, 0) = (πi/2) Σ'_λ χ_λ(P) η(λ)/‖λ‖⁴ with ‖λ‖² = π|η(λ)|²/y (Brunault Prop. 24, (1.61)–(1.62), p. 25).
4. Compare with the Kronecker–Eisenstein expansion of ER.3/fourier-and-kronecker-eisenstein, R_q(e^{2πi(s+tτ)}) = (y²/π) Σ'_{(m,n)} sin 2π(tm − sn) / ((m+nτ)²(m+nτ̄)) (checked numerically by the reviewer at non-torsion points), to get R_{dz}(P, 0) = −½·conj(R_q(P)); its imaginary part is Brunault's Proposition 26 (D_{E,η}(P) = 2 Im R_ω(P, 0)), which fixes the orientation χ_{m+nτ}(s+tτ) = e^{2πi(mt − ns)}.
5. Assemble with the oddness of R_q: r_E = Σ m_i n_j R_{dz}(P_i − Q_j, 0) = ½ Σ m_i n_j conj(R_q(Q_j − P_i)) = ½ conj(R_q((f) ⋄ (g))).
6. Constant entries: r_E({f, c})(ω) = 0 because log|c| is constant, and r_E({c, g})(ω) = log|c| ∫ ω ∧ ∂̄log|g| = 0 by Stokes; both match (c) = 0.
7. Record the lift form of the same value (ER.4/bloch-lift-formula): for permitted lifts it equals Σ d_j e_k R^{Bl}_q(α_j^{-1}β_k) with Bloch's unregularised J_q.

**Acceptance.**

- For all f, g ∈ ℂ(E_τ)^×: r_E({f,g})(dz) = ½·conj(R_q((f) ⋄ (g))), with no tame-symbol hypothesis.
- Numerical instance (reviewer's computation): τ = 0.3 + 1.2i, (f) = [0.11+0.07i] + [0.37+0.52τ] − [0.63+0.21τ] − [P₄], (g) = [0.21+0.81τ] + [0.77+0.33τ] − [0.45+0.09τ] − [Q₄], P₄ and Q₄ fixed by the sum-zero condition, f and g theta quotients: the integral −i∫∫ log|f| · conj(g′/g) dx dy over the fundamental parallelogram is −1.22280 + 1.33589i (800×800 midpoint grid), and ½·conj(R_q((f) ⋄ (g))) = −1.2228051 + 1.3358976i; without the conjugation one would get −1.2228 − 1.3359i.
- Im r_E({f,g})(dz) = −½·D_q((f) ⋄ (g)).
- r_E vanishes on every symbol with a constant entry.

**Depends on.** this roadmap: `ER.4/the-diamond-convolution`, `ER.3/green-function-of-the-curve`, `ER.4/bloch-lift-formula`, `ER.3/fourier-and-kronecker-eisenstein`, `ER.3/the-companion-and-Bloch-convention`, `ER.2/the-regulator-on-symbols`.

**Needed by.** this roadmap: `ER.4/the-regulator-of-the-corrected-classes`, `ER.5/the-L-value-theorem`, `ER.7/the-X1-11-example`, `ER.8/the-syntomic-comparison`, `ER.8/the-CM-worked-example`, `ER.8/the-integrality-worked-example`, `ER.8/the-nonrational-torsion-example`, `ER.8/the-conductor-14-example`, `ER.5/unit-orbit-regulator-count`, `ER.8/quadratic-regulator-trace`.

**Sources.**

- `Brunault.These.2005`, §1.1, Proposition 17, (1.28)–(1.29), p. 19 of the arXiv PDF: “Proposition 17. Pour toutes fonctions méromorphes f, g ∈ C(X)∗, nous avons l'égalité r_X({f, g}) = Σ_{x∈(f)} Σ_{y∈(g)} ord_x(f) ord_y(g) R_X(x, y),” — The divisor formula on any compact Riemann surface, for all f, g, with no tame-symbol hypothesis.
- `Brunault.These.2005`, §1.2, Proposition 26, (1.63), p. 26 of the arXiv PDF: “Le dilogarithme elliptique D_{E,η} s'exprime en fonction de R_E au moyen de la formule D_{E,η}(P) = 2 · ℑ(R_ω(P, 0)) (P ∈ E), où nous avons posé ω = η∗dz.” — The imaginary part of the elliptic evaluation; the real part and the conjugation come from Proposition 24 (p. 25) and the Kronecker–Eisenstein expansion.
- `Bloch.CRM11`, Lecture 10, §10.1, printed p. 75 (PDF p. 87): “We now have a regulator map R_q: K_2(C(E)) → C which induces by restriction a regulator on the global K_2(E). Abusing notation, we will also write R_q = J_q + iD_q for the function on C*.” — Bloch's regulator is defined on all of K_2(ℂ(E)) by the divisor formula; this node relates it to ER.2's integral.

**Assembly note.** The ER.4 part imports this node by id: r_E({f,g})(dz)=½ conjugate R_q((f)⋄(g)); no second regulator normalization.

### The regulator of Bloch's classes S_a (Lemma 10.2.2)

`ER.4/the-regulator-of-the-corrected-classes` · theorem · parent packet

Let C ≥ 1, τ ∈ ℍ, y = Im τ, and for a ∈ E_τ[C] ∖ {0} let S_a ∈ K_2(ℂ(E_τ)) ⊗ ℤ[1/C] be Bloch's class of EllipticKTheory E.7/bloch-classes (base-changed to ℂ): S_a = (1/C)·(C{ρ, f_a} + Σ_i {f_i, c_i}) with (ρ) = (C² − 1)[0] − Σ_{b ∈ E[C]∖0}[b], (f_a) = C[a] − C[0] and constants c_i. Then Bloch's regulator (ER.4/the-divisor-formula) is
  R_q(S_a) = R_q((ρ) ⋄ (f_a)) = C³·R_q(a),
with R_q ER.3's q-invariant function; equivalently r_E(S_a)(dz) = ½·C³·conj(R_q(a)). This is Bloch's Lemma 10.2.2 (p. 77), which writes, for a = (k+ℓτ)/C with 0 ≤ ℓ < C, R_q(S_a) = C³(R^{Bl}_q(e^{2πi(k+ℓτ)/C}) + 4π²y²(ℓ³/3C³ − ℓ²/2C² + ℓ/6C)); the bracketed Bernoulli term is exactly the difference between ER.3's R_q and Bloch's unregularised function. The constant-symbol corrections contribute zero. No finite Fourier transform enters this node.

**Hypotheses.**

- All points of E[C] are rational over the field of definition of the class (EllipticKTheory E.7/bloch-classes; over ℂ this is automatic), and C is invertible where E[C] ≅ (ℤ/C)² is used.
- S_a is the class of E.7/bloch-classes, defined modulo torsion and symbols with both entries constant; the regulator kills both.
- R_q is odd and R_q(0) = 0 (ER.3).

**Proof outline.**

1. The constant-symbol corrections contribute zero (ER.4/the-divisor-formula), so R_q(S_a) = R_q{ρ, f_a}.
2. Compute (ρ) ⋄ (f_a) = C(C² − 1)([a] − [0]) − C Σ_{b≠0}([a − b] − [−b]) (ER.4/the-diamond-convolution).
3. Apply R_q: Σ_{b∈E[C]} R_q(a − b) = Σ_{b∈E[C]} R_q(b) = 0 and Σ_{b≠0} R_q(−b) = 0 by oddness, R_q(0) = 0; hence R_q((ρ) ⋄ (f_a)) = C(C² − 1)R_q(a) + C·R_q(a) = C³·R_q(a).
4. Record Bloch's own route (pp. 77–79): lifts (10.2.3) with the unregularised J_q, the terms A₁, …, A₄ and B; it is ER.4/bloch-lift-formula plus arithmetic and gives the same value.

**Acceptance.**

- R_q(S_a) = C³·R_q(a) for every nonzero a ∈ E_τ[C].
- Reviewer's instance: τ = 0.1 + 1.1i, C = 4: for (k, ℓ) = (1,0), (0,1), (1,1), (3,2), (1,3) the lift computation with Bloch's J_q and the lifts (10.2.3) and 64·R_q(e^{2πi(k+ℓτ)/4}) agree to 15 digits (e.g. −0.519724250391782 + 59.4385831263844i for (1,0)).
- The constant-symbol corrections contribute zero.
- The only finite Fourier transform of Lecture 10 is ER.4/finite-fourier-transform, normalised by 1/C².

**Depends on.** this roadmap: `ER.4/the-divisor-formula`, `ER.4/the-diamond-convolution`, `ER.3/the-companion-and-Bloch-convention`; other roadmaps: `EllipticKTheory:E.7/bloch-classes`.

**Needed by.** this roadmap: `ER.4/bloch-theorem-10-2-1`, `ER.5/lattice-sum-form-of-theorem-10-2-1`, `ER.5/dual-first-fourier-comparison`, `ER.5/unit-factor-cancellation-certificate`, `ER.8/cm36-corrected-l-value`.

**Sources.**

- `Bloch.CRM11`, Lecture 10, Lemma 10.2.2, printed p. 77 (PDF p. 89): “LEMMA 10.2.2. We have R_q(S_{(k+ℓτ)/C}) = C³(R_q(e^{2πi(k+ℓτ)/C}) + 4π²y²(ℓ³/3C³ − ℓ²/2C² + ℓ/6C)), where R_q on the right denotes the function R_q and R_q on the left is the regulator.” — The regulator of the classes, verbatim; the bracket is ER.3's Bernoulli correction.
- `Bloch.CRM11`, Lecture 10, (10.1.2), printed p. 76 (PDF p. 88): “Let ρ denote a function on E with poles of order 1 at every nonzero point of E_C and a zero of order C² − 1 at the origin.” — The divisor of ρ used here.

**Assembly note.** The ER.4 part imports this node by id: R_q(S_a)=C³R_q(a), with constant corrections killed.

### Extension by transfer, only after the trace formula

`ER.4/transfer-and-the-trace-formula` · comparison · parent packet

Let k be a number field, L/k a finite extension, σ : k ↪ ℂ, E/k an elliptic curve, and for β ∈ K_2(L(E)) let Nβ ∈ K_2(k(E)) be the transfer along the field extension L(E)/k(E) (EllipticKTheory E.7/transfer-of-certified-classes). For each τ : L ↪ ℂ let reg_τ(β) denote the regulator (ER.2's r_E, or Bloch's R_q) of the image of β in K_2(ℂ(E^σ)) under the embedding L(E) ↪ ℂ(E^σ) induced by τ. Then the TRACE FORMULA reg_σ(Nβ) = Σ_{τ : τ|_k = σ} reg_τ(β) holds. Its input is the base-change formula for the Milnor transfer, res_{ℂ(E)/k(E)} ∘ N_{L(E)/k(E)} = Σ_τ res_τ (K2SymbolsBrauer T.4/transfer-base-change: the minimal polynomial of a primitive element of L/k splits over ℂ into distinct linear factors, all e_i = 1), together with the fact that the regulator is a homomorphism on K_2(ℂ(E)). No statement about finite morphisms of curves is involved: Brunault's projection formula (1.118) concerns finite morphisms X → Y of Riemann surfaces (isogenies, modular parametrisations) and belongs to ER.7.

**Hypotheses.**

- L/k is a finite separable extension of number fields.
- E is geometrically integral over k, so L(E) = L ⊗_k k(E) is a field and a primitive element of L/k generates L(E)/k(E).
- The formula is an identity of regulators after base change along each embedding, not of classes.

**Proof outline.**

1. Write L = k(a), so L(E) = k(E)(a) and the minimal polynomial of a over k(E) is its minimal polynomial over k.
2. Apply K2SymbolsBrauer T.4/transfer-base-change with F′ = ℂ(E^σ): the polynomial factors as Π_τ (t − τ(a)), so res ∘ N = Σ_τ res_τ on K_2(L(E)).
3. Apply the regulator homomorphism.
4. Record the non-example: without this formula a computation over L says nothing about the class over k, and the stage text forbids the extension in that case.
5. Record the use in ER.5: for the Galois-invariant class U over L = κ(E[C]) with res(U₀) = U, U₀ = N(U)/[L:ℚ], the formula gives reg(U₀) = reg(U) at the chosen embedding.

**Acceptance.**

- reg_σ(Nβ) = Σ_{τ|σ} reg_τ(β).
- The formula is required before any result is extended by transfer.
- Its only inputs are the base-change formula for the Milnor transfer and the additivity of the regulator.

**Depends on.** this roadmap: `ER.2/the-regulator-on-symbols`; other roadmaps: `K2SymbolsBrauer:T.4/transfer-base-change`, `EllipticKTheory:E.7/transfer-of-certified-classes`.

**Needed by.** this roadmap: `ER.8/the-nonrational-torsion-example`, `ER.8/quadratic-regulator-trace`.

**Sources.**

- `Bloch.CRM11`, Lecture 11, §11.2, printed p. 92 (PDF p. 104): “is invariant under both these actions, and hence lies in K_2(E_Q) ⊗ Q. (This follows from the existence of a norm map K_2(E_L) → K_2(E_Q) for L/Q finite.)” — The source's only use of the transfer; the trace formula is what makes its regulator computable, and the source does not state it.

**Assembly note.** The ER.4 part imports this node by id: Constant-field trace from split base change and regulator additivity.

**Assembly note.** The trace formula here is for constant-field extensions only, and needs no geometric norm theorem. The geometric statement r_Y(N_φ ξ)(ω) = r_X(ξ)(φ^*ω) for every ξ is `ER.7/regulator-under-finite-pushforward`. Only its compact-class case is proved; this is the ER.4 part's gap, assigned to ER.7.

### Bloch's lift formula and why the product-one condition matters only for the unregularised companion

`ER.4/bloch-lift-formula` · lemma · parent packet · added by REV-EllipticRegulators

Let R^{Bl}_q = J^{Bl}_q + iD_q on ℂ^× with Bloch's J^{Bl}_q(x) = Σ_{n≥0} J(xq^n) − Σ_{n≥1} J(x^{-1}q^n), J(x) = log|x|·log|1 − x| ((8.1.4); it converges but is NOT q-invariant: J^{Bl}_q(qx) − J^{Bl}_q(x) = −(log|x|)², (8.1.5)). Let F = Σ d_j(α_j) and G = Σ e_k(β_k) be divisors on ℂ^× with Σ d_j = Σ e_k = 0 and Π α_j^{d_j} = Π β_k^{e_k} = 1 (permitted lifts of (f), (g)). Then Σ_{j,k} d_j e_k R^{Bl}_q(α_j^{-1}β_k) = R_q((f) ⋄ (g)), R_q ER.3's q-invariant function: the Bernoulli terms contribute (1/3)log²|q| Σ d_j e_k B_3(u_k − v_j) = 0, where u_k = log|β_k|/log|q| and v_j = log|α_j|/log|q|, because Σ d_j = Σ e_k = 0 and Σ d_j v_j = Σ e_k u_k = 0. Consequently the lift formula is independent of the permitted lift (Bloch Lemma 8.1.4). For R^{Bl}_q the product-one condition cannot be dropped; for the q-invariant R_q no lift is needed at all; the degree-zero condition is automatic for lifts of divisors of functions.

**Hypotheses.**

- The lifts satisfy Σ d_j = Σ e_k = 0 and Π α_j^{d_j} = Π β_k^{e_k} = 1.
- The polynomial B_3(t) = t³ − (3/2)t² + (1/2)t is used without reduction mod 1, so that (1/3)log²|q|·B_3(log|x|/log|q|) + J^{Bl}_q(x) is q-invariant on ℂ^×.

**Proof outline.**

1. Expand B_3(u − v) as a cubic polynomial in u and v; every monomial is killed by one of Σ d_j = 0, Σ e_k = 0, Σ d_j v_j = 0, Σ e_k u_k = 0.
2. Deduce the equality of the two evaluations, and independence of permitted lifts from the q-invariance of R_q.
3. Record the counterexample below for a non-permitted lift with J^{Bl}_q.

**Acceptance.**

- For permitted lifts the two evaluations agree.
- Reviewer's counterexample: τ = 0.1 + 1.1i, C = 4, the lifts (10.2.3) of (ρ) and of (f_{1/4}): the permitted lift gives Σ d_j e_k R^{Bl}_q = −0.519724 + 59.438583i = 64·R_q(e^{2πi/4}); replacing one point x of (f̃) by qx (product-one violated) gives −1553.008 + 59.438583i with J^{Bl}_q and still −0.519724 + 59.438583i with the q-invariant R_q.
- The imaginary part D_q never depends on the lift.

**Depends on.** this roadmap: `ER.3/the-companion-and-Bloch-convention`, `ER.4/the-diamond-convolution`.

**Needed by.** this roadmap: `ER.4/the-divisor-formula`.

**Sources.**

- `Bloch.CRM11`, Lecture 8, Lemma 8.1.4, printed p. 62 (PDF p. 74): “Let F = Σd_j(α_j), G = Σe_k(β_k) be divisors on C*, and assume Σd_j = Σe_k = 0, Πα_j^{d_j} = Πβ_k^{e_k} = 1. Then F and G project to divisors of elliptic functions f, g on E = C*/q^Z, and the expression J_q(F^- * G) = Σ_{j,k} d_j e_k J_q(α_j^{-1}β_k) depends only on the divisors of f and g.” — Independence of permitted lifts for the unregularised J_q, verbatim.
- `Bloch.CRM11`, Lecture 8, (8.1.4)–(8.1.5), printed p. 62 (PDF p. 74): “J_q(x) = Σ_{n=0}^∞ J(xq^n) − Σ_{n=1}^∞ J(x^{-1}q^n). J_q(x) is clearly continuous on C*, and we have (8.1.5) J_q(qx) − J_q(x) = −J(x^{-1}) − J(x) = −(log|x|)².” — Bloch's J_q converges without any correction and is not q-invariant; the Bernoulli term is what makes it a function on E.

**Assembly note.** The ER.4 part imports this node by id: Permitted raw divisor lifts have degree zero and product one; no repeat planning.

### The finite Fourier transform of Lecture 10

`ER.4/finite-fourier-transform` · definition · parent packet · added by REV-EllipticRegulators

For C ≥ 1 and f : ℤ/C × ℤ/C → ℂ, f̂(k, ℓ) = C^{-2} Σ_{a,b=0}^{C−1} f(a, b)·e^{2πi(−ak+bℓ)/C} (Bloch (10.2.1), p. 76). Inversion: f(a, b) = Σ_{k,ℓ} f̂(k, ℓ)·e^{2πi(ak−bℓ)/C}; f is odd iff f̂ is odd. This Lecture-10 transform is normalised by 1/C², NOT by 1/C: the 1/C normalisation is that of Lecture 11 on O/CO (ER.5/fourier-transform-on-O-mod-C), and if f(m, n) = F(n + mτ) then f̂(k, ℓ) = C^{-1}·F̂(k + ℓτ). This is the specialization of AdditiveCombinatorics:AC.0’s normalized character interface: χ_(k,ℓ)(a,b)=exp(2πi(ak−bℓ)/C), f̂(k,ℓ)=E_(a,b) f(a,b)·conj(χ_(k,ℓ)(a,b)). ER.4 identifies this dual and imports generic inversion and Parseval; it does not rebuild character theory.

**Hypotheses.**

- C ≥ 1; the transform is on the finite group (ℤ/C)² with the kernel as printed in (10.2.1).

**Construction.**

1. Define χ_(k,ℓ) using the pinned ZMod.stdAddChar at ak−bℓ. Prove its exponential formula and that (k,ℓ) ↦ χ_(k,ℓ) bijects (ℤ/C)² with AddChar ((ℤ/C)²) ℂ, using the existing character theory.
2. Import AC.0’s character-indexed coefficient/comparison interface, built on AddChar.complexBasis and orthogonality. Identify finiteFourier10 with its averaged coefficient and with complexBasis.repr f χ_(k,ℓ); its counting-normalized comparison is C⁻² times two successive ZMod.dft transforms, at indices (k,−ℓ).
3. Specialize AC.0 inversion and Parseval through that dual bijection. There is no new general finite-group inversion or Parseval proof here.
4. Prove oddness by x ↦ −x and the imported inversion; compute point masses and the C=1 boundary case.
5. Compare Lecture 11 by swapping only the input coordinates f(m,n)=F(n+mτ): finiteFourier10 f (k,ℓ)=C⁻¹ fourierO F (k,ℓ) in the basis (1,τ). Do not swap the output (k,ℓ). Keep E7’s corrected dual-first kernel.

**API.**

- `finiteFourier10` (data): f̂(k, ℓ) = C^{-2} Σ f(a, b) e^{2πi(−ak+bℓ)/C}.
- `finiteFourier10_inversion` (characterisation): f(a, b) = Σ_{k,ℓ} f̂(k, ℓ) e^{2πi(ak−bℓ)/C}.
- `finiteFourier10_odd` (relation): f odd ⇔ f̂ odd.
- `finiteFourier10_single` (simp): The transform of δ_{(a,b)} is (k, ℓ) ↦ C^{-2} e^{2πi(−ak+bℓ)/C}.
- `finiteFourier10_eq_fourierO` (compatibility): If f(m, n) = F(n + mτ) then f̂(k, ℓ) = C^{-1}·fourierO F (k + ℓτ).
- `torsionFourierCharacter` (data): χ_(k,ℓ)(a,b)=ZMod.stdAddChar(a·k−b·ℓ), a bundled AddChar on (ℤ/C)².
- `torsionFourierCharacter_apply` (compatibility): χ_(k,ℓ)(a,b)=exp(2πi(ak−bℓ)/C), using residue representatives.
- `torsionFourierDuality` (data): The equivalence (ℤ/C)² ≃ AddChar ((ℤ/C)²) ℂ induced by torsionFourierCharacter.
- `finiteFourier10_eq_complexBasis_repr` (compatibility): finiteFourier10 C f kl = (AddChar.complexBasis ((ℤ/C)²)).repr f (torsionFourierCharacter C kl); specialize the AC.0 coefficient comparison.
- `finiteFourier10_eq_dft` (compatibility): finiteFourier10 C f (k,ℓ) = C⁻² · ZMod.dft (a ↦ ZMod.dft (b ↦ f(a,b)) (−ℓ)) k.
- `finiteFourier10_parseval` (relation): Σ_kl ‖finiteFourier10 C f kl‖² = C⁻² Σ_ab ‖f ab‖², imported from AC.0 through the dual bijection.

**Unit tests.**

- `finiteFourier10_C3` (computation): C = 3, f = δ_{(1,0)} − δ_{(2,0)}: f̂(1, ℓ) = −i√3/9 and f̂(0, ℓ) = 0 for every ℓ.
- `finiteFourier10_zero` (degenerate): The transform of 0 is 0; for C = 1 the transform is the identity.
- `finiteFourier10_inv` (characterisation): Inversion recovers f for every f : (ℤ/C)² → ℂ.
- `finiteFourier10_not_one_over_C` (non-example): With the normalisation 1/C in (10.2.1), the right side of Theorem 10.2.1 must be multiplied by C (iy²C⁴/π instead of iy²C³/π).
- `finiteFourier10_C1` (degenerate): For C=1, finiteFourier10 1 f (0,0)=f (0,0).
- `finiteFourier10_parseval_single` (computation): C=3, f=δ_(0,0): Σ_kl ‖finiteFourier10 3 f kl‖²=1/9. A unitary 1/C factor in Lecture 10 gives 1 instead and fails this test.
- `finiteFourier10_basis` (compatibility): For every kl, finiteFourier10 C (torsionFourierCharacter C kl) kl = 1; the full transform is the point mass at kl.

**Acceptance.**

- Inversion holds.
- The normalisation is 1/C².
- The comparison with ER.5/fourier-transform-on-O-mod-C holds with the factor C^{-1}.
- The AC.0 request exports the average convention, inversion and Parseval with explicit counting/unitary comparisons; no prerequisite on a whole upstream coding or modular-forms stage is introduced.
- Σ_(k,ℓ) |f̂(k,ℓ)|² = C⁻² Σ_(a,b) |f(a,b)|²; the Lecture-11 unitary transform preserves the unnormalized sum of squares.
- The character identification and both normalization comparisons are specialized to the C-torsion carrier; generic comparisons remain owned by AC.0.

**Uses.**

- ER.4, Bloch's Theorem 10.2.1: The weights of the combination of regulators.
- ER.5, the lattice-sum form of Theorem 10.2.1: Translated to the Lecture-11 transform by finiteFourier10_eq_fourierO.

**Depends on.** layers of other roadmaps: `AdditiveCombinatorics:AC.0`; libraries: `mathlib:AddChar.complexBasis`, `mathlib:AddChar.sum_apply_eq_ite`, `mathlib:ZMod.dft`.

**Needed by.** this roadmap: `ER.4/bloch-theorem-10-2-1`, `ER.5/fourier-transform-on-O-mod-C`, `ER.4/weighted-logarithmic-term`, `ER.4/weighted-dilogarithmic-term`, `ER.4/dilogarithmic-orbit-splitting`, `ER.4/torsion-bernoulli-horizontal-term`, `ER.4/logarithmic-lattice-evaluation`, `ER.4/dilogarithmic-forward-evaluation`, `ER.4/dilogarithmic-boundary-evaluation`, `ER.5/dual-first-fourier-comparison`.

**Sources.**

- `Bloch.CRM11`, Lecture 10, §10.2, (10.2.1), printed p. 76 (PDF p. 88): “be an odd function, f(−a, −b) = −f(a, b), and write (10.2.1) f̂(k, ℓ) = (1/C²) Σ_{a,b=0}^{C−1} f(a, b) e^{2πi(−ak+bℓ)/C}.” — The definition and its normalisation 1/C², verbatim.

**Assembly note.** The ER.4 part imports this node by id: AC.0 torsion specialization, orientation and oddness.

**Assembly note.** Lecture 10's transform at (k, ℓ) is C⁻¹ times Lecture 11's dual-first transform at the same output coordinates (`ER.5/dual-first-fourier-comparison`).

### Bloch's Theorem 10.2.1: the finite Fourier identity for the regulators of the classes S_a

`ER.4/bloch-theorem-10-2-1` · theorem · planet “Bloch's finite Fourier identity” · parent packet · added by REV-EllipticRegulators

Let τ ∈ ℍ, y = Im τ, C ≥ 1 and f : ℤ/C × ℤ/C → ℂ odd. Then Σ_{k,ℓ=0}^{C−1} f̂(k, ℓ)·R_q(S_{(k+ℓτ)/C}) = (iy²C³/π)·Σ_{(m,n)≠(0,0)} f(m, n)/((mτ + n)²(mτ̄ + n)), with f̂ as in (10.2.1), R_q(S_0) := 0 and f(m, n) := f(m mod C, n mod C) (Bloch Theorem 10.2.1, p. 77). By ER.4/the-regulator-of-the-corrected-classes this is equivalent to Σ f̂(k, ℓ)·R_q(e^{2πi(k+ℓτ)/C}) = (iy²/π) Σ'_{(m,n)} f(m, n)/((mτ+n)²(mτ̄+n)) for ER.3's function R_q (Bloch's (10.3.1) with the m = 0 terms included).

**Hypotheses.**

- f is odd: f(−a, −b) = −f(a, b).
- R_q is ER.3's q-invariant function and R_q(S_a) is Bloch's regulator of ER.4/the-regulator-of-the-corrected-classes.

**Proof outline.**

1. Substitute the Kronecker–Eisenstein expansion of ER.3 at the torsion points (s, t) = (k/C, ℓ/C): R_q(e^{2πi(k+ℓτ)/C}) = (y²/π) Σ'_{(m,n)} sin 2π(ℓm − kn)/C / ((m+nτ)²(m+nτ̄)); the series converges absolutely (terms O(|w|^{-3})), so the finite sum over (k, ℓ) passes inside.
2. Apply finite Fourier inversion and oddness: Σ_{k,ℓ} f̂(k, ℓ) sin 2π(ℓm − kn)/C = i·f(n, m).
3. Relabel (m, n) ↦ (n, m) and multiply by C³.
4. Record the source's own route, which proves the theorem directly and from which Brunault derives the Kronecker–Eisenstein expansion (Theorem 21, p. 23): Lemma 10.2.3 (the Bernoulli terms against Σ f(0,n)/n³, via Σ_{n≠0} e^{2πinx}/n³ = 4π³i(x³/3 − x²/2 + x/6) on [0, 1]), Proposition 10.3.1 with Lemma 10.3.2 (the part L), Proposition 10.3.3 with Lemmas 10.3.4–10.3.5 (the part M), pp. 79–85. If ER.3 takes Brunault's route to its expansion, these four results must become lemma nodes here instead, to avoid a cycle.

**Acceptance.**

- The identity holds for every odd f.
- Reviewer's instances with f(m, n) = χ(n + mτ) for the CM characters of ER.5 (right side = (iy²C³/π)·|μ_κ|·L(2, χ^{Gross}), L from PARI): τ = i, C = 4; τ = (1+√−3)/2, C = 6; τ = (1+√−7)/2, C = 7 and 14 — left/right = 1.0000000000 in every case.

**Depends on.** this roadmap: `ER.4/finite-fourier-transform`, `ER.4/the-regulator-of-the-corrected-classes`, `ER.3/fourier-and-kronecker-eisenstein`.

**Needed by.** this roadmap: `ER.5/lattice-sum-form-of-theorem-10-2-1`.

**Sources.**

- `Bloch.CRM11`, Lecture 10, Theorem 10.2.1, printed p. 77 (PDF p. 89): “THEOREM 10.2.1. With notation as above, Σ_{k,ℓ=0}^{C−1} f̂(k, ℓ) R_q(S_{(k+ℓτ)/C}) = (iy²C³/π) Σ_{m,n∈Z, (m,n)≠(0,0)} f(m, n)/((mτ + n)²(mτ̄ + n)).” — The statement, verbatim; verified numerically by the reviewer.

**Assembly note.** The ER.4 part imports this node by id: Final K₂-class statement; use the direct analytic theorem here for its proof.

**Assembly note.** **Its proof is the ER.4 part's direct route:** `ER.4/direct-regularized-fourier-identity`, multiplied by C³ through `ER.4/the-regulator-of-the-corrected-classes`.

- This decomposes Bloch's Lemma 10.2.3 and Propositions 10.3.1 and 10.3.3, which the parent's fourth gap left undecomposed.
- The direct identity uses neither this node nor `ER.3/fourier-and-kronecker-eisenstein`. Adding it to this node's prerequisites, as REV-EllipticRegulators--ER.4 asks, therefore creates no cycle.
- The proof order is: convergence and the imported Fourier and polylogarithm interfaces; the analytic evaluations; the raw and regularised identities; then the class statement.

### Convergence for Bloch’s direct torsion calculation

`ER.4/direct-series-convergence` · theorem · ER.4 part

For every u∈T_C, the forward and backward raw logarithmic orbit series are absolutely summable after defining W(z)=log|z| log(1−z) with W(1)=0; both double logarithmic power series Σ_{n≥0,j≥1}log|x_u q^n|(x_u q^n)^j/j and Σ_{n≥1,j≥1}log|x_u^(−1)q^n|(x_u^(−1)q^n)^j/j are absolutely summable, with zero forward summands when n=ℓ=0; the corresponding Li₂ imaginary orbit series and the double power series Σ_{n≥0,j≥1}(x_u q^n)^j/j² and Σ_{n≥1,j≥1}(x_u^(−1)q^n)^j/j² are absolutely summable. For bounded periodic f, each of Σ_{m≠0,n} f(m,n)/(m(mτ+n)²), Σ_{m≠0,n} f(m,n) Im(1/(m²(mτ+n))), Σ'_{m,n} f(m,n)/((mτ+n)²(mτ̄+n)), and Σ_{n≠0}f(0,n)/n³ is absolutely summable. Here Σ' omits (0,0); Im is taken before multiplication by f.

**Hypotheses.**

- C is a positive integer; τ∈ℍ, y=Im τ>0, q=exp(2πiτ).
- T_C=(ℤ/C)²; u=(k,ℓ) uses canonical representatives 0≤k,ℓ<C; x_u=exp(2πi(k+ℓτ)/C).
- f:T_C→ℂ, extended periodically to ℤ². f̂(k,ℓ)=C^(−2)Σ_{a,b}f(a,b)exp(2πi(−ak+bℓ)/C). No reality assumption.

**Proof outline.**

1. Use norm_qParam: |q|<1, |x_u|≤1 and |x_u^(−1)q|<1. The only forward boundary is n=ℓ=0. There W vanishes because log|x_u|=0, including x_u=1. For the tail, |log(1−z)|≤A|z| from the principal logarithm Taylor series; |log|x_u q^n|| grows linearly, so n|q|^n dominates the log orbit series. Before exchanging the logarithmic n,j sums, bound Σ_{j≥1}|z|^j/j≤|z|/(1−|z|) on |z|<1. Away from the zero-weight forward boundary, the orbit moduli have a common upper bound r<1; multiplying this bound by |log|z|| gives O((n+1)|q|^n). At n=ℓ=0 every weighted power-series summand is exactly zero. This proves absolute convergence of both logarithmic double series, not just of their orbit sums.
2. On the closed unit disc, Li₂ equals Σ_{j≥1} z^j/j²: import P.1 continuity and its open-disc series, extend by uniform 1/j² domination. For n≥1 the sum of absolute values is bounded by A|q|^n; for n=0 use the convergent p=2 series. This proves the absolute double-series bounds needed to exchange n,j and finite character sums.
3. For a=|m|y>0, divide integers n into shells j≤|n+m Re τ|<j+1, at most four per shell. Comparison with the integral of (a²+t²)^(−1) gives Σ_n|mτ+n|^(−2)≤K_y/|m|. Hence the log-kernel norm sum is ≤K_yΣ_{m≠0}|m|^(−2). The projected imaginary kernel has absolute value y/(|m||mτ+n|²), so the same bound applies. Do not claim the unprojected reciprocal series is absolutely summable.
4. For the full cubic kernel, the real-linear map (m,n)↦mτ+n is invertible because y>0. Its lower norm bound and EisensteinSeries.summable_one_div_norm_rpow at k=3 give the result. The horizontal series uses p=3. Boundedness of f follows from finiteness of T_C.

**Acceptance.**

- At ℓ=0 the logarithmic n=0 contribution is zero; the Li₂ n=0 contribution is retained.
- All lattice identities use product-index absolute sums, not a silently chosen order of summation.
- The row bound is uniform in the translate m Re τ; no irrationality condition on Re τ.
- The logarithmic Taylor expansion is interchanged with the orbit sum only after the weighted n,j norm sum is proved summable; the unit-circle zero-weight term is handled separately.

**Depends on.** other roadmaps: `Polylogarithms:P.1/classical-polylogarithm`; libraries: `mathlib:hasSum_coe_mul_geometric_of_norm_lt_one`, `mathlib:Function.Periodic.norm_qParam`, `mathlib:Complex.hasSum_taylorSeries_neg_log`, `mathlib:Real.summable_one_div_nat_pow`, `mathlib:Real.summable_one_div_int_pow`, `mathlib:EisensteinSeries.summable_one_div_norm_rpow`.

**Needed by.** this roadmap: `ER.4/weighted-logarithmic-term`, `ER.4/weighted-dilogarithmic-term`, `ER.4/dilogarithmic-orbit-splitting`, `ER.4/torsion-bernoulli-horizontal-term`, `ER.4/logarithmic-lattice-evaluation`, `ER.4/dilogarithmic-forward-evaluation`, `ER.4/dilogarithmic-boundary-evaluation`, `ER.4/dilogarithmic-lattice-evaluation`, `ER.4/direct-raw-fourier-identity`, `ER.4/direct-regularized-fourier-identity`, `ER.5/principal-generator-L-series-comparison`, `ER.5/three-CM-normalization-examples`.

**Lean.** module `TauCeti/NumberTheory/EllipticRegulator/BlochFourier`, namespace `TauCeti.EllipticRegulator`.

**Sources.**

- `Bloch.CRM11.public`, §10.3, pp.80–85, sum rearrangements underlying (10.3.2) and Propositions 10.3.1,10.3.3: “10.3.” — The source rearranges the logarithmic double series in (10.3.3) on p.81 and the Li₂ double series in the proof of Proposition 10.3.3 on pp.82–84. These are the supporting calculations, not a separately printed convergence theorem. The packet supplies the required orbit, double-series and lattice estimates independently, including the unit-circle exception.

### Bloch’s logarithmic term L

`ER.4/weighted-logarithmic-term` · definition · ER.4 part

Define blochLogTerm(C,τ,f)=L=Σ_{u∈T_C}f̂(u)A_τ(x_u), where W(z)=log|z| log(1−z), W(1)=0, and A_τ(x)=Σ_{n≥0}W(xq^n)−Σ_{n≥1}W(x^(−1)q^n). Complex.log is the principal logarithm; canonical torsion lifts make both tails lie in the closed unit disc. This construction is the weighted specialization of the raw regulator’s logarithmic part, not a new elliptic companion.

**Hypotheses.**

- C is a positive integer; τ∈ℍ, y=Im τ>0, q=exp(2πiτ).
- T_C=(ℤ/C)²; u=(k,ℓ) uses canonical representatives 0≤k,ℓ<C; x_u=exp(2πi(k+ℓτ)/C).
- f:T_C→ℂ, extended periodically to ℤ². f̂(k,ℓ)=C^(−2)Σ_{a,b}f(a,b)exp(2πi(−ak+bℓ)/C). No reality assumption.

**Construction.**

1. Use the imported torsion transform and q-parameter; define A only at canonical torsion lifts.
2. The convergence theorem gives both orbit sums; multiply by the finite Fourier coefficients and sum.
3. Complex linearity is in f, not in x. The raw part depends on its lift; it is not asserted q-invariant.

**API.**

- `blochLogTerm_apply` (characterisation): L(C,τ,f)=Σ_u f̂(u)A_τ(x_u).
- `blochLogTerm_zero` (simp): L(C,τ,0)=0.
- `blochLogTerm_add` (structure): L(C,τ,f+g)=L(C,τ,f)+L(C,τ,g).
- `blochLogTerm_smul` (structure): L(C,τ,c f)=c L(C,τ,f) for c∈ℂ.
- `blochLogTerm_character` (compatibility): For χ_u(a,b)=ZMod.stdAddChar(ak−bℓ), L(C,τ,χ_u)=A_τ(x_u), by AC.0 character orthogonality and the imported torsion identification.
- `blochLogTerm_boundary` (compatibility): For |z|=1, W(z)=0, including z=1. This is an equality for the weighted summand, not a Taylor series assertion for log(1−z).

**Unit tests.**

- `log_test_trivial_level` (degenerate): At C=1, L(1,τ,f)=0 for every f (A_τ(1)=0 by tail cancellation).
- `log_test_character_level_three` (computation): For C=3 and u=(0,1), L(3,τ,χ_u)=A_τ(exp(2πiτ/3)); no factor 3 or 9.
- `log_test_unit_boundary` (compatibility): W(i)=W(1)=0, although log(1−i) is nonzero; only the weighted summand is erased.
- `log_test_complex_scalar` (compatibility): L(C,τ,i f)=i L(C,τ,f). This tests complex linearity in the coefficient function; a real-part logarithmic kernel also passes it.
- `log_test_nonreal_kernel` (non-example): Im W(i/2)=log(2) arctan(1/2)>0. Replacing Complex.log(1−z) by log|1−z| makes the left side zero, so this test detects loss of the logarithmic argument contribution to the regulator.

**Acceptance.**

- Zero input gives zero on both sides.
- C=1 or C=2 forces an odd complex-valued input to vanish.
- Complex scalar multiplication preserves the identity; no coefficient passes through Im.

**Uses.**

- Bloch Proposition 10.3.1: Rewriting L with weighted geometric series isolates the logarithmic lattice kernel.
- Direct raw Fourier identity in this packet: Adds to the independently computed dilogarithmic contribution.

**Depends on.** this roadmap: `ER.4/finite-fourier-transform`, `ER.4/direct-series-convergence`, `ER.3/the-companion-and-Bloch-convention`; libraries: `mathlib:Function.Periodic.qParam`, `mathlib:ZMod.stdAddChar`.

**Needed by.** this roadmap: `ER.4/logarithmic-lattice-evaluation`, `ER.4/direct-raw-fourier-identity`.

**Lean.** module `TauCeti/NumberTheory/EllipticRegulator/BlochFourier`, namespace `TauCeti.EllipticRegulator`.

**Sources.**

- `Bloch.CRM11.public`, (10.3.2), p.80: “L” — In (10.3.2), L weights R′_q, the forward-minus-backward principal-complex-log expression immediately above it. The real logarithmic factor multiplies the full complex logarithm; it includes the argument term.

### Bloch’s dilogarithmic term M

`ER.4/weighted-dilogarithmic-term` · definition · ER.4 part

Define blochDilogTerm(C,τ,f)=M=i Σ_{u∈T_C}f̂(u)V_τ(x_u), where V_τ(x)=Σ_{n≥0}Im Li₂(xq^n)−Σ_{n≥1}Im Li₂(x^(−1)q^n). On |z|≤1 use P.1’s principal Li₂, equal to the absolutely convergent Σ_{j≥1}z^j/j². Im is applied to each Li₂ value before the complex Fourier coefficient. Together A_τ(x)+iV_τ(x)=R_q^{Bl}(x)=J_q^{Bl}(x)+iD_q(x); the log|z| arg(1−z) part of D is in A, so V alone is not D_q.

**Hypotheses.**

- C is a positive integer; τ∈ℍ, y=Im τ>0, q=exp(2πiτ).
- T_C=(ℤ/C)²; u=(k,ℓ) uses canonical representatives 0≤k,ℓ<C; x_u=exp(2πi(k+ℓτ)/C).
- f:T_C→ℂ, extended periodically to ℤ². f̂(k,ℓ)=C^(−2)Σ_{a,b}f(a,b)exp(2πi(−ak+bℓ)/C). No reality assumption.

**Construction.**

1. Use imported P.1 Li₂ with its closed-disc continuity; the series coordinate form follows by uniform p=2 domination.
2. Form the two absolutely summable imaginary orbit sums, then the finite complex-linear weighted sum.
3. Expand the definition of D(z)=Im Li₂(z)+log|z|arg(1−z) and of J; principal log identifies A+iV with the imported raw Bloch regulator.

**API.**

- `blochDilogTerm_apply` (characterisation): M(C,τ,f)=iΣ_u f̂(u)V_τ(x_u).
- `blochDilogTerm_zero` (simp): M(C,τ,0)=0.
- `blochDilogTerm_add` (structure): M(C,τ,f+g)=M(C,τ,f)+M(C,τ,g).
- `blochDilogTerm_smul` (structure): M(C,τ,c f)=c M(C,τ,f) for all complex c.
- `blochDilogTerm_character` (compatibility): M(C,τ,χ_u)=i V_τ(x_u), using the same torsion character as L.
- `blochDilogTerm_split` (relation): For odd f, M=M₁+M₂, where M₁=2iΣ_u f̂(u)Im Σ_{n≥0}Li₂(x_u q^n), M₂=−iΣ_k f̂(k,0)Im Li₂(exp(2πik/C)); both sums converge absolutely. The ℓ=0 boundary survives the orbit reindexing.

**Unit tests.**

- `dilog_test_trivial_level` (degenerate): M(1,τ,f)=0 for every f; V_τ(1)=0.
- `dilog_test_character_level_three` (computation): M(3,τ,χ_(0,1))=i V_τ(exp(2πiτ/3)); the character test catches the Fourier sign and C^(−2) factor.
- `dilog_test_complex_scalar` (non-example): M(C,τ,i f)=i M(C,τ,f); Im must not be moved outside a complex-weighted sum.
- `dilog_test_unit_circle` (compatibility): For C=4, τ=i and χ_(1,0), M=i Im Li₂(i)+2iΣ_{n≥1}Im Li₂(i exp(−2πn)); the nonzero unit-circle Li₂ value is retained.

**Acceptance.**

- Zero input gives zero on both sides.
- C=1 or C=2 forces an odd complex-valued input to vanish.
- Complex scalar multiplication preserves the identity; no coefficient passes through Im.

**Uses.**

- Bloch Propositions 10.3.3 and Lemmas 10.3.4–10.3.5: M₁ carries a cotangent sum and an extra H term; M₂ removes H.
- Raw Fourier identity; ER.3 companion comparison: The imaginary Li₂ piece combines with the principal-log piece to give R^{Bl}, rather than the dilogarithm alone.

**Depends on.** this roadmap: `ER.4/finite-fourier-transform`, `ER.4/direct-series-convergence`, `ER.3/the-companion-and-Bloch-convention`; other roadmaps: `Polylogarithms:P.1/classical-polylogarithm`, `Polylogarithms:P.1/bloch-wigner-dilogarithm`.

**Needed by.** this roadmap: `ER.4/dilogarithmic-orbit-splitting`, `ER.4/dilogarithmic-forward-evaluation`, `ER.4/dilogarithmic-boundary-evaluation`, `ER.4/direct-raw-fourier-identity`.

**Lean.** module `TauCeti/NumberTheory/EllipticRegulator/BlochFourier`, namespace `TauCeti.EllipticRegulator`.

**Sources.**

- `Bloch.CRM11.public`, (10.3.2), p.80; proof of Proposition 10.3.3, pp.82–83: “M” — In (10.3.2), M=−iΣ f̂ R″_q; the integral defining R″_q is the negative of the principal Li₂ value. Thus the packet has +i times the forward-minus-backward imaginary Li₂ sums. Projection occurs before the Fourier coefficient.

### Splitting the dilogarithmic orbit sum

`ER.4/dilogarithmic-orbit-splitting` · lemma · ER.4 part

blochDilogTerm_split: for odd f, M=M₁+M₂, where M₁=2iΣ_u f̂(u)Im Σ_{n≥0}Li₂(x_u q^n) and M₂=−iΣ_k f̂(k,0)Im Li₂(exp(2πik/C)). This promotes the definition’s relation API to the explicit prerequisite used by the lattice evaluation.

**Hypotheses.**

- C is a positive integer; τ∈ℍ, y=Im τ>0, q=exp(2πiτ).
- T_C=(ℤ/C)²; u=(k,ℓ) uses canonical representatives 0≤k,ℓ<C; x_u=exp(2πi(k+ℓτ)/C).
- f:T_C→ℂ, extended periodically to ℤ². f̂(k,ℓ)=C^(−2)Σ_{a,b}f(a,b)exp(2πi(−ak+bℓ)/C). No reality assumption.
- f(−u)=−f(u) for all u∈T_C; consequently f(0)=0 and f̂ is odd.

**Proof outline.**

1. Change u to −u in the backward sum and use f̂(−u)=−f̂(u). For ℓ>0, the canonical negative lift is q/x_u, so n≥1 becomes n−1≥0.
2. For ℓ=0 the canonical negative lift is 1/x_u; the backward series becomes the forward one with its n=0 term omitted.
3. The finite weighted sum is thus twice the forward sum minus exactly the ℓ=0 endpoint. Absolute convergence justifies the reindexing and taking Im termwise.

**Acceptance.**

- The ℓ=0 boundary is retained with coefficient −i, not −2i.
- Complex f is permitted; only the real Li₂ values are projected.

**Depends on.** this roadmap: `ER.4/weighted-dilogarithmic-term`, `ER.4/direct-series-convergence`, `ER.4/finite-fourier-transform`.

**Needed by.** this roadmap: `ER.4/dilogarithmic-lattice-evaluation`.

**Lean.** module `TauCeti/NumberTheory/EllipticRegulator/BlochFourier`, namespace `TauCeti.EllipticRegulator`.

**Sources.**

- `Bloch.CRM11.public`, (10.3.2) and decomposition in proof of Proposition 10.3.3, pp.80,82–83: “M” — The proof of Proposition 10.3.3 consolidates the backward sum by negating the torsion index, then splits M into M₁+M₂. The ℓ=0, n=0 endpoint occurs once with coefficient −i.

### The Bernoulli horizontal term

`ER.4/torsion-bernoulli-horizontal-term` · theorem · planet “The Bernoulli correction” · ER.4 part

Let b_τ(u)=4π²y²(t³/3−t²/2+t/6), t=ℓ/C. Then B=Σ_u f̂(u)b_τ(u)=(iy²/π)Σ_{n≠0}f(0,n)/n³. This is the unscaled correction for the analytic R_q, before multiplying by C³ for the K₂ classes.

**Hypotheses.**

- C is a positive integer; τ∈ℍ, y=Im τ>0, q=exp(2πiτ).
- T_C=(ℤ/C)²; u=(k,ℓ) uses canonical representatives 0≤k,ℓ<C; x_u=exp(2πi(k+ℓτ)/C).
- f:T_C→ℂ, extended periodically to ℤ². f̂(k,ℓ)=C^(−2)Σ_{a,b}f(a,b)exp(2πi(−ak+bℓ)/C). No reality assumption.
- f(−u)=−f(u) for all u∈T_C; consequently f(0)=0 and f̂ is odd.

**Proof outline.**

1. Specialize Mathlib’s sine/Bernoulli formula at k=1. Pair ±n to obtain Σ_{n≠0}exp(2πint)/n³=(4π³i/3)B₃(t), including endpoints 0,1.
2. Multiply by −iy²/π and exchange the absolutely convergent n sum with the finite u sum.
3. AC.0 inversion in the imported ER.4 coordinates gives Σ_u f̂(u)exp(2πinℓ/C)=f(0,−n). Oddness changes the minus sign to plus.

**Acceptance.**

- For C=3 and f=δ_(0,1)−δ_(0,2), B=8π²i y²/(81√3); the horizontal row has that value after multiplying by iy²/π.
- The inherited capital-C correction is source issue EllipticRegulators/E11; no new spelling of it is introduced.
- For an input supported off the row a=0 the correction vanishes.

**Depends on.** this roadmap: `ER.4/finite-fourier-transform`, `ER.4/direct-series-convergence`, `ER.3/the-companion-and-Bloch-convention`; other roadmaps: `AdditiveCombinatorics:AC.0/fourier-transform`; libraries: `mathlib:hasSum_one_div_nat_pow_mul_sin`.

**Needed by.** this roadmap: `ER.4/direct-regularized-fourier-identity`.

**Lean.** module `TauCeti/NumberTheory/EllipticRegulator/BlochFourier`, namespace `TauCeti.EllipticRegulator`.

**Sources.**

- `Bloch.CRM11.public`, Lemma 10.2.3, pp.79–80: “10.2.3.” — Lemma 10.2.3 states the horizontal n^(−3) identity. Its proof uses the cubic Bernoulli Fourier series, inverse transform at (0,−n), and oddness to obtain the positive iy²/π factor. Capital C follows inherited E11.

### Evaluation of Bloch’s logarithmic term

`ER.4/logarithmic-lattice-evaluation` · theorem · planet “Bloch’s logarithmic sum” · ER.4 part

L=−y/(2π) Σ_{m≠0,n∈ℤ} f(m,n)/(m(mτ+n)²). All indices are signed integers; the m=0 row is absent.

**Hypotheses.**

- C is a positive integer; τ∈ℍ, y=Im τ>0, q=exp(2πiτ).
- T_C=(ℤ/C)²; u=(k,ℓ) uses canonical representatives 0≤k,ℓ<C; x_u=exp(2πi(k+ℓτ)/C).
- f:T_C→ℂ, extended periodically to ℤ². f̂(k,ℓ)=C^(−2)Σ_{a,b}f(a,b)exp(2πi(−ak+bℓ)/C). No reality assumption.
- f(−u)=−f(u) for all u∈T_C; consequently f(0)=0 and f̂ is odd.

**Proof outline.**

1. Use oddness of f̂ to combine the forward/backward log orbit sums. The ℓ=0 endpoint has multiplier n+ℓ/C=0 at n=0; it contributes zero.
2. Expand the principal log only on the open unit-disc terms, using Complex.hasSum_taylorSeries_neg_log. Character orthogonality imposes j≡a (mod C); reindex nC+ℓ. The resulting expression is (4πy/C²)Σ_{a,b,j>0,j≡a} f(a,b)j^(−1)Σ_{r≥0}r exp(2πir(jτ+b)/C).
3. The weighted geometric baseline gives −1/(4sin²(πz)). The k=1 cotangent derivative gives π²/sin²(πz)=Σ_n(z+n)^(−2). Scale z=(jτ+b)/C and reindex b+Cn.
4. The positive j expression is −y/π times its positive-m lattice sum. Pair (m,n) with (−m,−n); both f and m change sign, so bilateralization introduces the factor 1/2. Convergence permits all rearrangements.

**Acceptance.**

- Zero input gives zero on both sides.
- C=1 or C=2 forces an odd complex-valued input to vanish.
- Complex scalar multiplication preserves the identity; no coefficient passes through Im.

**Depends on.** this roadmap: `ER.4/weighted-logarithmic-term`, `ER.4/direct-series-convergence`, `ER.4/finite-fourier-transform`; other roadmaps: `AdditiveCombinatorics:AC.0/fourier-transform`; libraries: `mathlib:Complex.hasSum_taylorSeries_neg_log`, `mathlib:hasSum_coe_mul_geometric_of_norm_lt_one`, `mathlib:iteratedDerivWithin_cot_pi_mul_eq_mul_tsum_div_pow`.

**Needed by.** this roadmap: `ER.4/direct-raw-fourier-identity`.

**Lean.** module `TauCeti/NumberTheory/EllipticRegulator/BlochFourier`, namespace `TauCeti.EllipticRegulator`.

**Sources.**

- `Bloch.CRM11.public`, Proposition 10.3.1 and Lemma 10.3.2, pp.80–82: “10.3.1.” — Proposition 10.3.1 has −y/(2π), m≠0, and denominator m(mτ+n)². Its proof passes through (10.3.3) and the weighted geometric identity in Lemma 10.3.2; the latter is already supplied by the pinned Mathlib baseline.

### Evaluation of the forward dilogarithmic sum

`ER.4/dilogarithmic-forward-evaluation` · theorem · ER.4 part

For odd f define H=(1/C)Σ_{m≥1}Σ_{b mod C}f(m,b)/m² and M₁=2iΣ_u f̂(u)Im Σ_{n≥0}Li₂(x_u q^n). Then M₁=H−(1/(2π))Σ_{m≠0,n} f(m,n)Im(1/(m²(mτ+n))). These expressions are absolutely convergent.

**Hypotheses.**

- C is a positive integer; τ∈ℍ, y=Im τ>0, q=exp(2πiτ).
- T_C=(ℤ/C)²; u=(k,ℓ) uses canonical representatives 0≤k,ℓ<C; x_u=exp(2πi(k+ℓτ)/C).
- f:T_C→ℂ, extended periodically to ℤ². f̂(k,ℓ)=C^(−2)Σ_{a,b}f(a,b)exp(2πi(−ak+bℓ)/C). No reality assumption.
- f(−u)=−f(u) for all u∈T_C; consequently f(0)=0 and f̂ is odd.

**Proof outline.**

1. Expand Li₂ on the closed disc and exchange the absolutely convergent sums. To handle complex f, pair (a,b) with (−a,−b): Σ f(a,b)Re(exp(2πi(−ak+bℓ)/C))=0. This identity, not moving complex scalars through Im, changes the remaining phase expression into f(a,b) times Im(i times the power series).
2. Sum over k to impose m≡a mod C and combine ℓ,n into a nonnegative integer r. Sum the geometric series with z=(mτ+b)/C (Im z>0).
3. Use 1/(1−exp(2πiz))=(1+i cotπz)/2. The constant 1/2 gives H. For the cotangent part use the paired baseline; its imaginary projection is absolutely summable, since Im 1/(mτ+n)=−my/|mτ+n|².
4. Reindex residue b+Cn and use simultaneous negation to convert the positive-m sum to half the bilateral sum.

**Acceptance.**

- Zero input gives zero on both sides.
- C=1 or C=2 forces an odd complex-valued input to vanish.
- Complex scalar multiplication preserves the identity; no coefficient passes through Im.

**Depends on.** this roadmap: `ER.4/weighted-dilogarithmic-term`, `ER.4/direct-series-convergence`, `ER.4/finite-fourier-transform`; other roadmaps: `AdditiveCombinatorics:AC.0/fourier-transform`; libraries: `mathlib:Complex.cot_pi_eq_exp_ratio`, `mathlib:cot_series_rep`.

**Needed by.** this roadmap: `ER.4/dilogarithmic-lattice-evaluation`.

**Lean.** module `TauCeti/NumberTheory/EllipticRegulator/BlochFourier`, namespace `TauCeti.EllipticRegulator`.

**Sources.**

- `Bloch.CRM11.public`, Lemma 10.3.4, pp.83–84: “10.3.4.” — Lemma 10.3.4 evaluates M₁ with a positive H term and −1/(2π) times the projected reciprocal kernel. The proof uses oddness to remove the cosine phase, the geometric/cotangent identity, and paired cotangent partial fractions.

### Cancellation of the unit-circle boundary

`ER.4/dilogarithmic-boundary-evaluation` · theorem · ER.4 part

For odd f, M₂=−iΣ_{k mod C}f̂(k,0)Im Li₂(exp(2πik/C))=−H, with H=(1/C)Σ_{m≥1,b mod C}f(m,b)/m². This cancels precisely the H in the forward evaluation.

**Hypotheses.**

- C is a positive integer; τ∈ℍ, y=Im τ>0, q=exp(2πiτ).
- T_C=(ℤ/C)²; u=(k,ℓ) uses canonical representatives 0≤k,ℓ<C; x_u=exp(2πi(k+ℓτ)/C).
- f:T_C→ℂ, extended periodically to ℤ². f̂(k,ℓ)=C^(−2)Σ_{a,b}f(a,b)exp(2πi(−ak+bℓ)/C). No reality assumption.
- f(−u)=−f(u) for all u∈T_C; consequently f(0)=0 and f̂ is odd.

**Proof outline.**

1. Use the absolutely convergent Li₂ series on the unit circle, including the value 1.
2. Pair the original Fourier input with its negative, cancel its cosine part and use finite orthogonality in k. The condition m≡a mod C leaves a factor C; the original transform contributed C^(−2).
3. The remaining expression is −(1/C)Σ_{m≥1,b}f(m,b)/m². Keeping this endpoint prevents an erroneous extra constant in Proposition 10.3.3.

**Acceptance.**

- For C=3, f=δ_(1,0)−δ_(2,0), H=(1/3)Σ_{r≥0}((3r+1)^(−2)−(3r+2)^(−2))>0, and M₂=−H is not zero.
- For f=δ_(0,1)−δ_(0,2), every residue row sum vanishes, hence H=M₂=0.
- The complex multiple (1+2i) of the first test scales H and M₂ by (1+2i).

**Depends on.** this roadmap: `ER.4/weighted-dilogarithmic-term`, `ER.4/direct-series-convergence`, `ER.4/finite-fourier-transform`; other roadmaps: `AdditiveCombinatorics:AC.0/fourier-transform`, `Polylogarithms:P.1/classical-polylogarithm`.

**Needed by.** this roadmap: `ER.4/dilogarithmic-lattice-evaluation`.

**Lean.** module `TauCeti/NumberTheory/EllipticRegulator/BlochFourier`, namespace `TauCeti.EllipticRegulator`.

**Sources.**

- `Bloch.CRM11.public`, Lemma 10.3.5, p.84: “10.3.5.” — Lemma 10.3.5 evaluates the unit-circle endpoint M₂ as −H by expanding Li₂ and summing the torsion character. This is the term cancelling the forward evaluation’s H.

### Evaluation of Bloch’s dilogarithmic term

`ER.4/dilogarithmic-lattice-evaluation` · theorem · planet “Bloch’s dilogarithmic sum” · ER.4 part

M=−(1/(2π))Σ_{m≠0,n∈ℤ} f(m,n)Im(1/(m²(mτ+n))). The real imaginary-part value is cast into ℂ before multiplying by f; there is no Im on the entire weighted sum.

**Hypotheses.**

- C is a positive integer; τ∈ℍ, y=Im τ>0, q=exp(2πiτ).
- T_C=(ℤ/C)²; u=(k,ℓ) uses canonical representatives 0≤k,ℓ<C; x_u=exp(2πi(k+ℓτ)/C).
- f:T_C→ℂ, extended periodically to ℤ². f̂(k,ℓ)=C^(−2)Σ_{a,b}f(a,b)exp(2πi(−ak+bℓ)/C). No reality assumption.
- f(−u)=−f(u) for all u∈T_C; consequently f(0)=0 and f̂ is odd.

**Proof outline.**

1. Use blochDilogTerm_split, which explicitly retains M₂ from ℓ=0.
2. Substitute the independently evaluated M₁=H+projected kernel and M₂=−H.
3. Cancel H in ℂ. The convergence theorem proves that the remaining product-index sum is independent of summation order.

**Acceptance.**

- Zero input gives zero on both sides.
- C=1 or C=2 forces an odd complex-valued input to vanish.
- Complex scalar multiplication preserves the identity; no coefficient passes through Im.

**Depends on.** this roadmap: `ER.4/dilogarithmic-orbit-splitting`, `ER.4/dilogarithmic-forward-evaluation`, `ER.4/dilogarithmic-boundary-evaluation`, `ER.4/direct-series-convergence`.

**Needed by.** this roadmap: `ER.4/direct-raw-fourier-identity`.

**Lean.** module `TauCeti/NumberTheory/EllipticRegulator/BlochFourier`, namespace `TauCeti.EllipticRegulator`.

**Sources.**

- `Bloch.CRM11.public`, Proposition 10.3.3, pp.82–85: “10.3.3.” — Proposition 10.3.3 states the negative projected-kernel evaluation of M. Lemmas 10.3.4 and 10.3.5 give its two summands; Im acts on the reciprocal kernel, before multiplication by f.

### The direct raw Fourier identity

`ER.4/direct-raw-fourier-identity` · theorem · ER.4 part

Σ_{u∈T_C}f̂(u)R_q^{Bl}(x_u)=L+M=(iy²/π)Σ_{m≠0,n}f(m,n)/((mτ+n)²(mτ̄+n)). This identity concerns canonical lifts and the raw function; it omits the entire horizontal row.

**Hypotheses.**

- C is a positive integer; τ∈ℍ, y=Im τ>0, q=exp(2πiτ).
- T_C=(ℤ/C)²; u=(k,ℓ) uses canonical representatives 0≤k,ℓ<C; x_u=exp(2πi(k+ℓτ)/C).
- f:T_C→ℂ, extended periodically to ℤ². f̂(k,ℓ)=C^(−2)Σ_{a,b}f(a,b)exp(2πi(−ak+bℓ)/C). No reality assumption.
- f(−u)=−f(u) for all u∈T_C; consequently f(0)=0 and f̂ is odd.

**Proof outline.**

1. The imported P.1 Bloch–Wigner formula and raw companion definition give A+iV=R^{Bl}, so its finite weighted sum is L+M.
2. Insert the logarithmic and projected dilogarithmic lattice evaluations. For m≠0 and w=mτ+n, verify 1/(m w²)+y^(−1)Im(1/(m²w))=−2iy/(w² conj w), using w−conj w=2imy.
3. Multiply by −y/(2π) and sum using absolute convergence. This proof never invokes the ER.3 Fourier expansion, Green function, divisor formula or class regulator.

**Acceptance.**

- Zero input gives zero on both sides.
- C=1 or C=2 forces an odd complex-valued input to vanish.
- Complex scalar multiplication preserves the identity; no coefficient passes through Im.

**Depends on.** this roadmap: `ER.4/weighted-logarithmic-term`, `ER.4/weighted-dilogarithmic-term`, `ER.4/logarithmic-lattice-evaluation`, `ER.4/dilogarithmic-lattice-evaluation`, `ER.4/direct-series-convergence`, `ER.3/the-companion-and-Bloch-convention`; other roadmaps: `Polylogarithms:P.1/bloch-wigner-dilogarithm`.

**Needed by.** this roadmap: `ER.4/direct-regularized-fourier-identity`.

**Lean.** module `TauCeti/NumberTheory/EllipticRegulator/BlochFourier`, namespace `TauCeti.EllipticRegulator`.

**Sources.**

- `Bloch.CRM11.public`, (10.3.1) and concluding algebra, pp.80,85: “(10.3.1)” — Equation (10.3.1) omits the m=0 row. The concluding algebra on p.85 combines Propositions 10.3.1 and 10.3.3. The public text loses the denominator’s conjugation; w−conj(w)=2imy independently determines the barred denominator recorded here.

### The direct regularized torsion Fourier identity

`ER.4/direct-regularized-fourier-identity` · theorem · ER.4 part

Σ_u f̂(u)R_q(x_u)=L+M+B=(iy²/π)Σ'_{m,n} f(m,n)/((mτ+n)²(mτ̄+n)), where R_q=R_q^{Bl}+b_τ on canonical torsion lifts and Σ' omits only (0,0). Multiplying both sides by C³ and using the imported class-regulator formula supplies the accepted ER.4/bloch-theorem-10-2-1. This is the analytic input also needed by ER.3’s Fourier/Kronecker–Eisenstein node.

**Hypotheses.**

- C is a positive integer; τ∈ℍ, y=Im τ>0, q=exp(2πiτ).
- T_C=(ℤ/C)²; u=(k,ℓ) uses canonical representatives 0≤k,ℓ<C; x_u=exp(2πi(k+ℓτ)/C).
- f:T_C→ℂ, extended periodically to ℤ². f̂(k,ℓ)=C^(−2)Σ_{a,b}f(a,b)exp(2πi(−ak+bℓ)/C). No reality assumption.
- f(−u)=−f(u) for all u∈T_C; consequently f(0)=0 and f̂ is odd.

**Proof outline.**

1. Import the regularization from ER.3: R_q(x_u)=R_q^{Bl}(x_u)+b_τ(u); here b is the unscaled correction, not C³ times the correction.
2. Add the Bernoulli horizontal identity to the raw m≠0 identity. For m=0,n≠0 the cubic kernel is exactly n^(−3).
3. Use absolute convergence to partition the punctured lattice into these disjoint parts. Attach the already planned K₂ class formula only after this analytic theorem; no new construction of S_a is needed.
4. For assembly, use this analytic theorem as the proof supplier for the parent ER.3 torsion expansion and parent ER.4 10.2.1. That fixes the earlier textual proof gap without editing their ids or introducing a back-edge from analysis to K₂ classes.

**Acceptance.**

- The full series includes horizontal n≠0 terms; erasing them loses the Bernoulli correction.
- The accepted class identity has prefactor iy²C³/π with Lecture 10’s C^(−2) transform. The analytic identity has iy²/π.
- Under f=i g with odd g, every side scales by i; taking Im after weighting fails this check.
- It supplies the analytic expansion before the divisor and class regulator results, breaking the earlier circular proof route.

**Depends on.** this roadmap: `ER.4/direct-raw-fourier-identity`, `ER.4/torsion-bernoulli-horizontal-term`, `ER.4/direct-series-convergence`, `ER.3/the-companion-and-Bloch-convention`.

**Needed by.** this roadmap: `ER.5/dual-first-fourier-comparison`.

**Lean.** module `TauCeti/NumberTheory/EllipticRegulator/BlochFourier`, namespace `TauCeti.EllipticRegulator`.

**Sources.**

- `Bloch.CRM11.public`, Lemma 10.2.3 and end of §10.3, pp.79–80,85: “10.2.3.” — The beginning of §10.3 reduces the regularized class formula using Lemmas 10.2.2 and 10.2.3; the conclusion proves the raw identity. Adding the explicitly evaluated Bernoulli horizontal row gives this unscaled analytic version; the class formula subsequently supplies C³.

## ER.5 — The complete CM example of Bloch

*18 nodes: 8 from the parent packet and 10 from the ER.5 part. Planets (4): Bloch's class U; Bloch's CM L-value theorem; The CM Gauss coefficient; Gauss sum nonvanishing.*

The layer is the roadmap's principal complete theorem: for E/ℚ with complex multiplication by the maximal order O of an imaginary quadratic field of class number one, Bloch's explicit class U ∈ K₂(E) ⊗ ℚ and the identity

L(2, χ^{Gross}) = π Γ R_q(U)/(i y² C⁴),  Γ = χ̂(ḡ)·g,

with every constant explicit, together with U ≠ 0.

- **Bloch's printed formula is false.** (11.2.1) and (11.2.4) carry a spurious factor |μ_κ| (source issue E8). With the kernel printed in (11.1.1) the sign is reversed (E7). The index set must be the residues invertible modulo f unless every prime of g divides f (E9).
- **The parent packet** states the corrected theorem and the Lecture 11 machinery:
  - the pairing on O/CO and its C⁻¹ transform;
  - the lattice-sum form of Theorem 10.2.1;
  - the unit twisting and CM distribution relations;
  - the Fourier transform of the CM character;
  - the class U and its descent;
  - nonvanishing, with what the theorem does not say (Bloch's Conjecture 11.2.4 stays a conjecture).

  It imports the CM setup (Grössencharakter, conductor, Deuring's comparison including the factor 1 at additive primes) from ComplexMultiplicationAndExplicitReciprocity CM.1 and CM.4, and the torsion Galois action from CM.2.
- **The ER.5 part** proves the normalisation:
  - the comparison of the Lecture 10 and Lecture 11 conventions (same output coordinates, factor C);
  - the Gauss coefficient Γ_C(F, g) = g·H_F(ḡ), with |Γ| = N(g) and an exact sign;
  - the conductor-fibre evaluation over W;
  - the free unit orbits, with |W/μ| = N(g)φ(f)/|μ|;
  - the generator-to-ideal comparison of the Hecke series;
  - absolute convergence and nonvanishing at s = 2 from the pinned Tau Ceti ideal L-series theorems;
  - the certificate in which both factors |μ| cancel;
  - the Gaussian (Γ = 2), Eisenstein (Γ = 3) and √−7 (Γ = 7) examples;
  - the level-14 counterexample to the unit-only index set.

Assembly notes on the four parent targets carry the ER.5 review's instructions: the ideal-level conductor equality, the real-structure hypothesis in the descent of U, the opposite-kernel coefficient Γ_op = −Γ, and the replacement of the natural-number Euler-product citation and the broad AL.1 dependency.

The layer is planned, not closed: five owner requests remain, to CM.1, CM.2 and CM.4 and to Tau Ceti GlobalNumberFields layers 9 and 10.

**Coverage.**

- **In the parent packet: partial.** Lecture 11 read from the scan. The printed scalar of Theorem 11.2.1 is wrong by the factor |μ_κ| and, with the printed kernel of (11.1.1), by a sign; the corrected theorem is verified numerically for 32a2, 36a1 and 49a1. Revised by REV-EllipticRegulators.
  - Remaining: The stage text pins the printed (11.2.4) and kernel (11.1.1), both wrong (source issues E7, E8, E9; restructure entry).
  - Remaining: The CM inputs are imported from ComplexMultiplicationAndExplicitReciprocity CM.2 and CM.4, AutomorphicLFunctionsAndLocalFactors AL.1 and Tau Ceti GlobalNumberFields layers 9-10 (requests).
- **In the ER.5 part: planned.** All eight parent ER.5 targets retain their identifiers, with the explicit contract qualifications recorded in imports. Ten new declarations account for the missing normalization proof and examples. Prerequisite chains terminate in pinned declarations, existing parent/supplier nodes, or the five explicit owner requests. Existing AL.1 local-factor nodes are imported directly rather than requested again. No unrecorded local mathematical gap remains; assembly wiring is listed separately.
  - Remaining: Fulfil the five supplier requests to CM.1/CM.2/CM.4 and GlobalNumberFields9/10 with the exact stated interfaces; the stage is planned rather than library-closed.
  - Remaining: Assembly: retain the eight parent ids and their API/tests; connect the parent L-value theorem to unit-factor-cancellation-certificate and nonvanishing to cm-ideal-series-at-two and the pinned ideal Euler theorem. Remove the obsolete natural-number Euler-product near miss from the imported parent nonvanishing proof.
  - Remaining: Assembly: replace the parent CM conductor API’s element equality f̄=f by the ideal equality f̄O=fO. Add the selected-uniformization conjugation compatibility explicitly to the parent class-U descent contract and its tests; retain the actual torsion-field Galois-image qualification.
  - Remaining: Assembly: replace the parent CM setup’s broad AL.1 edge/request by the two imported AL.1 local-factor nodes. Use the norm-half unitary twist when comparing their conventions with ψ; the Deuring theorem remains owned by CM.4.
  - Remaining: Assembly: correct the read-only ER.5 reader paragraph following the boxed L-value formula. If Γ_op=−Γ, write −πΓ_op/(iy²C⁴)=πΓ/(iy²C⁴); the actual coefficient is unchanged. Retain the complete stage-text correction proposal and W index set.

### The CM curve, its Hecke character and the comparison of L-functions

`ER.5/the-CM-setup-and-the-hecke-character` · construction · parent packet

Let E/ℚ have complex multiplication by the full ring of integers O = O_κ = ℤ + ℤτ of an imaginary quadratic field κ; then κ has class number one and j(E) ∈ ℚ (κ = ℚ(√−d), d ∈ {1, 2, 3, 7, 11, 19, 43, 67, 163}). Fix κ ↪ ℂ with E(ℂ) ≅ ℂ/ΩO. The theory of complex multiplication (ComplexMultiplicationAndExplicitReciprocity CM.4) attaches to E its Grössencharakter, which Bloch writes as χ^{Gross}((h)) = h̄·χ(h) for (h) prime to f, where χ : (O/fO)^× → μ_κ is a character restricting to the chosen embedding on μ_κ, with conductor f satisfying f̄O = fO and χ(x̄) = χ̄(x) (Bloch p. 92, citing Lang, Elliptic Functions, Theorem 10 p. 140). Deuring's theorem: for Re s > 3/2, Mathlib's W.LSeries s of a Weierstrass model W of E equals the Hecke series L(s, χ^{Gross}) = Σ_{𝔞 prime to f} χ^{Gross}(𝔞)N𝔞^{−s} over ideals, with equality of every Euler factor, including the factor 1 at each bad prime (all bad primes of E are additive and are exactly the primes below f). This does not follow from E(ℂ) having extra endomorphisms: the twists of E share the torus ℂ/ΩO and have different Grössencharaktere and L-functions.

**Hypotheses.**

- O is the MAXIMAL order of κ; the four non-maximal CM orders with rational j (discriminants −12, −16, −27, −28) need another theorem with its own descent and conductor hypotheses.
- χ restricts to the chosen embedding on μ_κ, so χ(−1) = −1 and χ is odd; χ^{Gross}((h)) = h̄χ(h) is independent of the generator h.
- The L-function on the curve side is Mathlib's WeierstrassCurve.LSeries, whose local polynomial is 1 at additive primes; modularity and analytic continuation are NOT needed, since only s = 2, in the half-plane of absolute convergence, is used.

**Construction.**

1. Import the Grössencharakter with its conductor, its algebraic infinity type and its Frobenius identities (CM.4; Tau Ceti GlobalNumberFields layers 9–10 for the carriers; requests).
2. Split good p = 𝔭𝔭̄: a_p(E) = χ^{Gross}(𝔭) + χ^{Gross}(𝔭̄); inert good p: a_p(E) = 0 and χ^{Gross}(pO) = −p, so both Euler factors are (1 + p^{1−2s})^{-1}.
3. Bad p: E has additive reduction (potentially good, since j is integral), W.localPolynomial = 1, and the Hecke factor is 1 because the primes above p divide f.
4. State the comparison W.LSeries s = L(s, χ^{Gross}) for Re s > 3/2 and the conductor N_E = |d_κ|·N(f).
5. Record the non-example of twists.

**API.**

- `cmHeckeCharacter` (data): The Grössencharakter of E (imported from CM.4), in Bloch's form χ^{Gross}((h)) = h̄χ(h).
- `cmHeckeCharacter_conductor` (projection): Its conductor f, with f̄ = f.
- `cmFiniteCharacter_conj` (relation): χ(x̄) = χ̄(x) (Lang, Theorem 10).
- `deuringComparison` (characterisation): W.LSeries s = Σ_𝔞 χ^{Gross}(𝔞)N𝔞^{−s} for Re s > 3/2.
- `deuringComparison_badPrimes` (compatibility): At every bad prime both Euler factors are 1.
- `cm_maximal_order` (relation): The hypothesis End(E) = O_κ, and the resulting list of nine fields.

**Unit tests.**

- `deuring_32a2` (computation): For y² = x³ − x and χ as above: a_5 = −2 = (−1+2i)‾ + (−1+2i) and a_13 = 6.
- `deuring_bad_prime_32a2` (compatibility): At p = 2 for y² = x³ − x, W.localPolynomial is 1 (additive reduction) and the Hecke Euler factor at (1+i) is 1, since (1+i) | f.
- `not_from_endomorphisms` (non-example): y² = x³ − x and y² = x³ + x have the same j = 1728 and the same endomorphism ring ℤ[i], but conductors 32 and 64 and different values at s = 2.
- `cm_fields_over_Q` (characterisation): The discriminants of maximal CM orders of elliptic curves over ℚ are exactly −3, −4, −7, −8, −11, −19, −43, −67, −163.

**Acceptance.**

- 32a2 (y² = x³ − x), κ = ℚ(i), τ = i, f = 2 + 2i, χ(h) = the unit congruent to h mod 2 + 2i: a_p(E) = χ^{Gross}(𝔭) + χ^{Gross}(𝔭̄) for every split p < 400 (reviewer, PARI; p = 5: primary generator −1 + 2i, a_5 = −2; p = 13: a_13 = 6); L(E, 2) = 0.917050635318654988643805524….
- Same check for 36a1 (y² = x³ + 1; κ = ℚ(√−3), f = 2√−3, χ the unit congruent mod f; L(E,2) = 0.940013007388225781496…) and 49a1 (κ = ℚ(√−7), f = √−7, χ the quadratic character mod √−7; L(E,2) = 1.138814388703848117450…).
- Every Euler factor agrees, including the bad ones.
- Non-example: y² = x³ − x (conductor 32) and y² = x³ + x (conductor 64) both have j = 1728 and CM by ℤ[i], but L = 0.917050635… and 1.023147652… at s = 2.

**Uses.**

- ER.5, the class U: χ fixes the index points x·χ̄(x)/C and the Galois action on E[C].
- ER.5, the L-value theorem: The left side is L(2, χ^{Gross}) = L(E, 2).

**Depends on.** this roadmap: `ER.1/all-embeddings-and-the-conjugation-action`; layers of other roadmaps: `ComplexMultiplicationAndExplicitReciprocity:CM.4`, `AutomorphicLFunctionsAndLocalFactors:AL.1`, `ComplexMultiplicationAndExplicitReciprocity:CM.1`; libraries: `mathlib:WeierstrassCurve.LSeries`, `mathlib:WeierstrassCurve.LFunction`.

**Needed by.** this roadmap: `ER.5/the-class-U`, `ER.5/the-L-value-theorem`, `ER.5/fourier-transform-of-the-character`, `ER.5/cm-gauss-coefficient`, `ER.6/determinant-witnesses-in-the-two-normalisations`, `ER.8/cm36-corrected-l-value`.

**Sources.**

- `Bloch.CRM11`, Lecture 11, §11.2, printed pp. 91–92 (PDF pp. 103–104): “Since κ has class number 1, j(E) ∈ Q so we can choose a model E_Q defined over Q. Deuring's theory associates to E_Q a Grössencharakter χ^Gross of κ with values in κ*, χ^Gross(p) = x̄χ(x), where (x) = p ∤ C.” — The setup and the form of the Grössencharakter, verbatim.
- `Brunault.These.2005`, §0.5, p. 11 of the arXiv PDF: “Dans le cas où E est à multiplication complexe, Bloch a montré comment exprimer L(E, 2) comme combinaison linéaire de valeurs de D_E.” — The scope of the layer, verbatim.

**Assembly note.** The ER.5 part imports this node by id: Import the CM.1/CM.4 datum and Deuring comparison; preserve its owner requests. Conjugation equality is ideal-level, not element-level.

**Assembly note.** REV-EllipticRegulators--ER.5 makes two corrections here.

1. **The conductor.** The API item `cmHeckeCharacter_conductor` says f̄ = f. The equality is of ideals, f̄O = fO, as the statement itself says: for κ = ℚ(i), f = 2 + 2i has f̄ = −i·f.
2. **The AL.1 dependency.** The broad prerequisite `AutomorphicLFunctionsAndLocalFactors:AL.1` and the parent's AL.1 request are replaced by the nodes `AutomorphicLFunctionsAndLocalFactors:AL.1/unramified-local-theory` and `AutomorphicLFunctionsAndLocalFactors:AL.1/ramified-local-theory`, with the unitary convention:
   - away from the conductor the local parameter is ψ(P)/N(P)^{1/2}, at s − 1/2;
   - at conductor primes the local factor is 1. There ψ(P) = 0 is the zero extension of the ideal weight, not a value of a local quasi-character.

CM.4 still owns the full comparison, with every bad prime and the conductor N_E = |d_κ|·N(f).

### The rational class U and its descent

`ER.5/the-class-U` · construction · planet “Bloch's class U” · parent packet

In the setting of ER.5/the-CM-setup-and-the-hecke-character, fix C ≥ 1 with f | C, write C = fg with g ∈ O, and let L = κ(E[C]) (so E[C] ⊂ E(L) and μ_C ⊂ L). Extend χ to O/CO by χ(w) := χ(w mod f) for w invertible modulo f, and χ(w) := 0 otherwise (this is the extension used in the proof of Lemma 11.1.7). For w ∈ O/CO let S_{w/C} ∈ K2T(E_L) ⊗ ℚ be Bloch's class (EllipticKTheory E.7/bloch-classes) at the C-torsion point w/C of ℂ/ΩO, S_0 := 0. Bloch's class is
  U := Σ_{x ∈ W/μ_κ} S_{x·χ̄(x)/C},  W = {x ∈ O/CO : x invertible modulo f},
(Bloch (11.2.3), p. 92, sums over (O/CO)^×/μ_κ; the two index sets coincide exactly when every prime dividing g divides f, which holds in Bloch's applications and in the examples below, and when they differ only W gives the L-value theorem). The summand depends only on the μ_κ-orbit of x. U is invariant under the ray class action x·(y/C) = x^{-1}χ(x)y/C by which Bloch describes Gal(L/κ) on E[C] (CM.2), and under complex conjugation (by χ(x̄) = χ̄(x)); hence U ∈ (K2T(E_L) ⊗ ℚ)^{Gal(L/ℚ)}, and U descends to a class U ∈ K_2(E_ℚ) ⊗ ℚ (EllipticKTheory E.7/rational-galois-descent and E.3). No finite Fourier transform enters the definition of U.

**Hypotheses.**

- f | C, C = fg ∈ ℤ, g ∈ O; χ is extended by pulling back from O/fO.
- The Galois action on E[C] is the one given by the CM main theorem (CM.2); Bloch's formula x·(y/C) = x^{-1}χ(x)y/C is taken from that theory, and U is also invariant under multiplication by the values h̄χ(h).
- No integrality is asserted in this node; for CM curves over ℚ it holds by ER.6/potentially-good-reduction-integrality.

**Construction.**

1. Record the index set W/μ_κ and the extension of χ; check that x ↦ x·χ̄(x) is constant on μ_κ-orbits (ζx·χ̄(ζx) = ζζ̄·x·χ̄(x)).
2. Define U as the specified finite sum of the classes of E.7/bloch-classes over L.
3. Invariance: z^{-1}χ(z)·xχ̄(x) = (xz^{-1})·χ̄(xz^{-1}) and conj(xχ̄(x)) = x̄·χ̄(x̄), so both actions permute the summands; Galois automorphisms send S_w to S_{σ(w)} modulo torsion and constant symbols (E.7/bloch-classes).
4. Descend with E.7/rational-galois-descent (res ⊗ ℚ is an isomorphism onto the invariants, inverse N/[L:ℚ]) and identify K2T(E) ⊗ ℚ with K_2(E) ⊗ ℚ by E.3.
5. Record that the index set must be W when a prime of g does not divide f (non-example below).

**API.**

- `cmCharExtend` (data): χ on O/CO: χ(w mod f) if w is invertible mod f, 0 otherwise.
- `blochClassU` (data): U = Σ_{x∈W/μ_κ} S_{xχ̄(x)/C} in K2T(E_L) ⊗ ℚ.
- `blochClassU_summand_orbit` (characterisation): x·χ̄(x) depends only on the μ_κ-orbit of x.
- `blochClassU_galois_invariant` (characterisation): σ(U) = U for σ ∈ Gal(L/ℚ).
- `blochClassU_descends` (characterisation): U = res(U₀) with U₀ = N_{L/ℚ}(U)/[L:ℚ] ∈ K_2(E_ℚ) ⊗ ℚ.
- `blochClassU_rational` (relation): U is a class of K_2(E_ℚ) ⊗ ℚ; integrality is ER.6's.

**Unit tests.**

- `blochClassU_Qi_C4` (computation): For κ = ℚ(i), C = 4 and χ as in ER.5/the-CM-setup-and-the-hecke-character: U = S_{1/4} + S_{(3+2i)/4}.
- `blochClassU_zero_point` (degenerate): S_0 = 0, and the summands at x and ζx coincide for ζ ∈ μ_κ.
- `blochClassU_descends_test` (characterisation): U is fixed by Gal(κ(E[C])/ℚ) and equals res(N(U)/[L:ℚ]).
- `blochClassU_index_set` (non-example): κ = ℚ(√−7), C = 14, g = −2√−7 (the primes above 2 do not divide f = √−7): the sum over (O/14O)^×/±1 (21 orbits) has regulator twice the value that ER.5/the-L-value-theorem requires; the sum over W/±1 (84 orbits) has the right value.

**Acceptance.**

- U is a specified finite sum, not an existential class.
- κ = ℚ(i), C = 4, f = 2 + 2i, g = 1 − i: W/μ_4 has two elements and x·χ̄(x) ∈ {1, 3 + 2i} mod 4, so U = S_{1/4} + S_{(3+2i)/4}; its regulator is 64·(R_q(e^{πi/2}) + R_q(e^{2πi(3+2i)/4})) = 37.36400426919091138661…·i with q = e^{−2π} (reviewer's computation; the real part vanishes).
- κ = ℚ(√−3), τ = (1+√−3)/2, C = 6: three orbits, index points 1/6, (5+4τ)/6, (3+2τ)/6; κ = ℚ(√−7), τ = (1+√−7)/2, C = 7: 21 orbits.
- U descends to K_2(E_ℚ) ⊗ ℚ.

**Uses.**

- ER.5, the L-value theorem: L(2, χ^{Gross}) is an explicit multiple of R_q(U).
- ER.8, the CM worked example: Its divisor and residue certificates.
- ER.6, the vertical step: U is integral by ER.6/potentially-good-reduction-integrality.

**Depends on.** this roadmap: `ER.5/the-CM-setup-and-the-hecke-character`; other roadmaps: `EllipticKTheory:E.7/bloch-classes`, `EllipticKTheory:E.7/rational-galois-descent`, `EllipticKTheory:E.3/what-the-sequence-does-not-identify`; layers of other roadmaps: `ComplexMultiplicationAndExplicitReciprocity:CM.2`, `ComplexMultiplicationAndExplicitReciprocity:CM.4`.

**Needed by.** this roadmap: `ER.5/the-L-value-theorem`, `ER.6/the-vertical-step-that-is-required`, `ER.8/the-CM-worked-example`, `ER.5/conductor-fiber-regulator-evaluation`, `ER.5/unit-orbit-regulator-count`, `ER.5/unit-factor-cancellation-certificate`, `ER.5/three-CM-normalization-examples`, `ER.5/extra-prime-level-counterexample`, `ER.6/integral-nonzero-bloch-class`, `ER.8/cm36-full-torsion-certificate`.

**Sources.**

- `Bloch.CRM11`, Lecture 11, (11.2.3), printed p. 92 (PDF p. 104): “The ray class group (O/CO)*/μ_κ acts on points of order C by x · (y/C) = x^{-1}χ(x)y/C and conjugation acts on these points in the natural way. The element (11.2.3) U ≝ Σ_{(O/CO)*/μ_κ} S_{xχ̄(x)/C} is invariant under both these actions, and hence lies in K_2(E_Q) ⊗ Q.” — The definition of U and its descent, verbatim from the scan (the stage text's 'S_{x̄χ(x)/C}' puts the bar on the wrong letter; the index set is conjugation-stable, so U is unchanged).

**Assembly note.** The ER.5 part imports this node by id: Retain the explicit W/μ sum, all six API items and four tests; K₂ classes/descent belong to E.7 and CM.2. Rational descent assumes the chosen uniformization has the natural conjugation transport; record this explicit hypothesis at assembly.

**Assembly note.** REV-EllipticRegulators--ER.5 asks for two hypotheses to be made explicit here.

- **The real structure.** Rational descent uses the natural complex conjugation in the coordinates ℂ/ΩO. For the chosen Bloch model this holds only once the real structure of the uniformisation is certified (the ER.5 part's CM.1 and CM.2 requests). Another ℚ-twist needs its own transported real structure.
- **The Galois image.** Descent needs only that Gal(κ(E[C])/κ) acts on E[C] through the ray representation x·(y/C) = x⁻¹χ(x)y/C, not that the Galois group is the whole ray class group.

The unit orbits are counted in `ER.5/unit-orbit-regulator-count`: μ acts freely on W, and |W/μ| = N(g)φ(f)/|μ|.

### Bloch's theorem: the L-value as an explicit multiple of the regulator

`ER.5/the-L-value-theorem` · theorem · planet “Bloch's CM L-value theorem” · parent packet

In the setting of ER.5/the-class-U (E/ℚ with CM by O = O_κ = ℤ + ℤτ, y = Im τ, q = e^{2πiτ}, χ of conductor f, C = fg ∈ ℤ, g ∈ O, U = Σ_{x∈W/μ_κ} S_{xχ̄(x)/C}), with R_q Bloch's regulator (ER.4/the-divisor-formula) and χ̂ the transform of ER.5/fourier-transform-on-O-mod-C (kernel ⟨x, y⟩):
  L(2, χ^{Gross}) = (π·χ̂(ḡ)·g / (i·y²·C⁴)) · R_q(U),
where L(s, χ^{Gross}) = Σ_{𝔞 ⊂ O prime to f} χ^{Gross}(𝔞)N𝔞^{−s} is the Hecke series over IDEALS, equal to L(E, s) by ER.5/the-CM-setup-and-the-hecke-character. When χ̂(ḡ)·g is real (it is 2, 3 and 7 in the three examples below), L being real forces R_q(U) = i·C³·Σ_{x∈W/μ_κ} D_q(e^{2πi·xχ̄(x)/C}), and the theorem reads L(E, 2) = (π·χ̂(ḡ)·g/(y²C))·Σ_{x∈W/μ_κ} D_q(e^{2πi·xχ̄(x)/C}). This CORRECTS Bloch's printed (11.2.4), L(2, χ^{Gross}) = π|μ_κ|χ̂(ḡ)g/(iy²C⁴)·R_q(U), which carries a spurious factor |μ_κ| (the passage from Σ_{0≠w∈O} to a sum over ideals divides by |μ_κ|, and the first line of (11.2.1) omits it; source issue EllipticRegulators/E8) and, when χ̂ is read with the printed kernel of (11.1.1), also the opposite sign (E7): with the printed kernel the correct formula is L(2, χ^{Gross}) = −π·χ̂(ḡ)·g/(iy²C⁴)·R_q(U). The roadmap's transcription in the ER.5 stage text is faithful to the scan and inherits both errors.

**Hypotheses.**

- κ has class number one and O = O_κ; χ : (O/fO)^× → μ_κ restricts to the chosen embedding on μ_κ; f̄ = f; C = fg ∈ ℤ.
- W = {x ∈ O/CO : x invertible mod f}; W = (O/CO)^× (Bloch's index set) exactly when every prime dividing g divides f. With Bloch's index set and a prime of g not dividing f the formula fails (κ = ℚ(√−7), C = 14: off by the factor 2; source issue E9).
- R_q is Bloch's regulator; in ER.2's normalisation r_E(U)(dz) = ½·conj(R_q(U)), so the theorem also reads L(2, χ^{Gross}) = (2π·χ̂(ḡ)·g/(i·y²·C⁴))·conj(r_E(U)(dz)).
- The identity is at the chosen embedding κ ↪ ℂ with the oriented basis (1, τ) of ER.1; under τ ↦ (ατ+β)/(γτ+δ) R_q is multiplied by (γτ̄+δ)^{-1}.

**Proof outline.**

1. Apply ER.5/lattice-sum-form-of-theorem-10-2-1 to F = χ (odd, since χ(−1) = −1): Σ_{w∈O/CO} χ̂(w)R_q(S_{w/C}) = (iy²C⁴/π) Σ_{0≠w∈O} χ(w)/(w²w̄).
2. Group the w by ideals: for ζ ∈ μ_κ, χ(ζh)·(ζh)‾/|ζh|⁴ = χ(h)h̄/|h|⁴, so Σ_{0≠w} χ(w)w̄/|w|⁴ = |μ_κ|·L(2, χ^{Gross}); hence L(2, χ^{Gross}) = (π/(iy²C⁴|μ_κ|)) Σ_w χ̂(w)R_q(S_{w/C}), which is Bloch's first line of (11.2.1) with the missing 1/|μ_κ|.
3. By ER.5/fourier-transform-of-the-character only w = ḡx with x invertible mod f̄ contribute, with χ̂(ḡx) = χ̄(x̄)χ̂(ḡ).
4. By ER.5/cm-twisting-and-distribution (b), conjugated (C = f̄ḡ), R_q(S_{x/f̄}) = g·Σ_{w ≡ x mod f̄} R_q(S_{w/C}); this gives χ̂(ḡ)·g·Σ_{w∈W} χ̄(w̄)R_q(S_{w/C}).
5. By χ(w̄) = χ̄(w) and ER.5/cm-twisting-and-distribution (a), χ̄(w̄)R_q(S_{w/C}) = χ(w)R_q(S_{w/C}) = R_q(S_{wχ̄(w)/C}), constant on μ_κ-orbits; summing over W/μ_κ multiplies by |μ_κ|, which cancels the 1/|μ_κ| of step 2.
6. Assemble: L(2, χ^{Gross}) = (π·χ̂(ḡ)·g/(iy²C⁴))·R_q(U); when χ̂(ḡ)·g is real, R_q(U) is purely imaginary and the D_q form follows.
7. Record source issues EllipticRegulators/E7–E9 and replace the scalar transcribed in the stage text by this one.

**Acceptance.**

- The statement is an equality with the explicit scalar π·χ̂(ḡ)·g/(iy²C⁴); no existential constant.
- 32a2 (y² = x³ − x): κ = ℚ(i), τ = i, C = 4, f = 2 + 2i, g = 1 − i, χ̂(ḡ) = 1 + i: L(E, 2) = (π/2)·[D_q(e^{πi/2}) + D_q(e^{2πi(3+2i)/4})] = 0.9170506353186549886438055…, q = e^{−2π} (reviewer: agrees with PARI's lfun to 25 digits; Bloch's printed scalar gives −3.66820254127461995… = −4·L(E, 2)).
- 36a1 (y² = x³ + 1): τ = (1+√−3)/2, C = 6, f = 2√−3, g = −√−3: L(E, 2) = (2π/3)·Σ D_q over the index points 1/6, (5+4τ)/6, (3+2τ)/6 = 0.9400130073882257814963…; the printed scalar gives −6·L(E, 2).
- 49a1: τ = (1+√−7)/2, C = 7, f = √−7, g = −√−7: L(E, 2) = (4π/7)·Σ D_q over 21 index points = 1.1388143887038481174506…; the printed scalar gives −2·L(E, 2).
- Every period (y), conductor (f, g, C), Gauss-sum (χ̂(ḡ)) and root-of-unity factor is accounted for; |μ_κ| does not occur.

**Depends on.** this roadmap: `ER.5/the-class-U`, `ER.5/lattice-sum-form-of-theorem-10-2-1`, `ER.5/fourier-transform-of-the-character`, `ER.5/cm-twisting-and-distribution`, `ER.5/the-CM-setup-and-the-hecke-character`, `ER.4/the-divisor-formula`; layers of other roadmaps: `ComplexMultiplicationAndExplicitReciprocity:CM.4`.

**Needed by.** this roadmap: `ER.5/nonvanishing-and-what-is-not-claimed`, `ER.6/three-conclusions-that-are-not-the-same`, `ER.8/the-CM-worked-example`, `ER.8/cm36-corrected-l-value`.

**Sources.**

- `Bloch.CRM11`, Lecture 11, Theorem 11.2.1 and (11.2.4), printed p. 92 (PDF p. 104): “THEOREM 11.2.1. With notations as above, let χ^Gross be the Grössencharakter associated to E_Q. Let f be a generator for the conductor ideal and let fg = C ∈ Z, g ∈ O. Then there exists U ∈ K_2(E_Q) ⊗ Q (defined as above) such that (11.2.4) L(2, χ^Gross) = (π|μ_κ|χ̂(ḡ)g/(iy²C⁴)) R_q(U).” — The printed theorem, verbatim from the scan; its scalar is corrected here (source issues E7, E8) and its index set restricted (E9).
- `Bloch.CRM11`, Lecture 11, (11.2.1), printed p. 91 (PDF p. 103): “Let f generate the conductor ideal of χ and write C = fg. From (11.1.2), Corollary 11.1.5, Corollary 11.1.6, and Lemma 11.1.7 we get (11.2.1) L(2, χ^Gross) = (π/(iy²C⁴)) Σ_{w∈O/CO} χ̂(w)R_q(S_{w/C})” — The first line of the derivation, where the factor 1/|μ_κ| is missing.

**Assembly note.** The ER.5 part imports this node by id: Retain the corrected theorem identifier; the new normalization certificate supplies its scalar proof.

**Assembly note.** **The scalar is proved by the ER.5 part's certificate** `ER.5/unit-factor-cancellation-certificate`:

- the weighted sum A_C = Σ_w H_χ(w)R_C(w) equals |μ|·Γ·R_q(U) (`ER.5/conductor-fiber-regulator-evaluation`, `ER.5/unit-orbit-regulator-count`);
- it also equals (iy²C⁴/π)·|μ|·L(2, ψ) (`ER.5/dual-first-fourier-comparison`, `ER.5/principal-generator-L-series-comparison`);
- the two factors |μ| cancel.

Here Γ = Γ_C(χ, g) = g·χ̂(ḡ) (`ER.5/cm-gauss-coefficient`), which is real with |Γ| = N(g) (`ER.5/primitive-gauss-normalization`).

**Assembly note.** **The opposite kernel.** REV-EllipticRegulators--ER.5 asks for the opposite-kernel coefficient to be named. Let Γ_op be g times the transform formed with the printed kernel of (11.1.1). Then Γ_op = −Γ, and the same theorem reads

L(2, ψ) = −π·Γ_op·R_q(U)/(iy²C⁴) = π·Γ·R_q(U)/(iy²C⁴).

The sign statement in the node is this equality. Combining −π with the dual-first Γ would reverse the verified Gaussian value.

### Non-vanishing of the class, and what the theorem does not say

`ER.5/nonvanishing-and-what-is-not-claimed` · comparison · parent packet

Since |χ^{Gross}(𝔭)| = N𝔭^{1/2}, the Euler product of L(s, χ^{Gross}) over prime ideals converges absolutely for Re s > 3/2, so L(2, χ^{Gross}) ≠ 0; with ER.5/the-L-value-theorem this gives R_q(U) ≠ 0 and hence U ≠ 0 in K_2(E_ℚ) ⊗ ℚ (Bloch Corollary 11.2.3). That is the whole of what is proved. NOT claimed: that U spans K_2(E_ℚ) ⊗ ℚ — Bloch's Conjecture 11.2.4, kept as a conjecture (in the stated form, with all of K_2(E) ⊗ ℚ rather than the integral part, the analogous assertion is false for general elliptic curves, Bloch–Grayson, DJZ §3; for CM curves over ℚ the two groups coincide by ER.6/potentially-good-reduction-integrality); nor anything for non-maximal CM orders or fields of larger class number, which need an additional theorem with its own descent and conductor hypotheses.

**Hypotheses.**

- Absolute convergence at s = 2 comes from the weight of the Grössencharakter (|χ^{Gross}(𝔭)| = N𝔭^{1/2}).
- Non-vanishing of U is a consequence of the theorem, the non-vanishing of the L-value and the fact that R_q is a homomorphism on K_2(E_ℚ) ⊗ ℚ.
- The spanning assertion is Bloch's Conjecture 11.2.4 and is recorded as a conjecture.

**Proof outline.**

1. Absolute convergence: Σ_𝔭 |χ^{Gross}(𝔭)|N𝔭^{−2} = Σ_𝔭 N𝔭^{−3/2} < ∞, so Σ_𝔭 −log(1 − χ^{Gross}(𝔭)N𝔭^{−2}) converges absolutely and L(2, χ^{Gross}) = exp(that sum) ≠ 0 (the ideal-indexed analogue of mathlib:EulerProduct.exp_tsum_primes_log_eq_tsum, which is stated for completely multiplicative functions on ℕ).
2. Deduce R_q(U) ≠ 0 from ER.5/the-L-value-theorem, and U ≠ 0 since R_q vanishes on 0.
3. State Conjecture 11.2.4 and record that it is a conjecture.
4. State the two extensions that need other theorems.
5. Record the inputs from the general theory: the only K-theoretic input beyond ER.4–ER.5 is EllipticKTheory E.3/what-the-sequence-does-not-identify (K_2 of a number field is torsion, so K_2(E) ⊗ ℚ ↪ K_2(ℚ(E)) ⊗ ℚ); Borel's rank theorem is not used in Lectures 8–11 — it motivates Conjecture 11.2.4 only.

**Acceptance.**

- L(2, χ^{Gross}) ≠ 0, hence U ≠ 0 (e.g. for 32a2, R_q(U) = 37.364…·i ≠ 0).
- U is not claimed to span.
- Nothing is claimed for other CM orders or larger class number.
- The general-theory inputs are named, and BorelRegulators is not among them.

**Depends on.** this roadmap: `ER.5/the-L-value-theorem`; other roadmaps: `EllipticKTheory:E.3/what-the-sequence-does-not-identify`; libraries: `mathlib:EulerProduct.exp_tsum_primes_log_eq_tsum`.

**Needed by.** this roadmap: `ER.6/three-conclusions-that-are-not-the-same`, `ER.6/integral-nonzero-bloch-class`.

**Sources.**

- `Bloch.CRM11`, Lecture 11, Corollary 11.2.3 and Conjecture 11.2.4, printed p. 93 (PDF p. 105): “Since L(s, χ^Gross) has a product expansion converging for Re s > 3/2, we see from (11.2.4) COROLLARY 11.2.3. The element U ∈ K_2(E_Q) ⊗ Q defined above is non-zero. In view of Borel's work, the following conjecture seems irresistible: CONJECTURE 11.2.4. U spans K_2(E_Q) ⊗ Q.” — The non-vanishing and the conjecture, verbatim.
- `Brunault.These.2005`, §0.5, p. 11 of the arXiv PDF: “La généralisation de cet énoncé à toute courbe elliptique est connu sous le nom de conjecture de Zagier pour L(E, 2) [32, 76, 81].” — Beyond the CM case the statement is a conjecture (the source's own wording 'connu').

**Assembly note.** The ER.5 part imports this node by id: Retain U≠0 and the stated limit on the conclusion; replace the natural-number near miss by the exact pinned ideal Euler result.

**Assembly note.** The first proof step cites `mathlib:EulerProduct.exp_tsum_primes_log_eq_tsum`, which is stated for functions on ℕ and is not the ideal-indexed statement needed. The ER.5 part replaces it by `ER.5/cm-ideal-series-at-two`. That node specialises the pinned Tau Ceti declarations `TauCeti.MultiplicativeIdealWeight`, `TauCeti.norm_idealTerm`, `TauCeti.summable_absNorm_rpow_ideal_iff` and `TauCeti.MultiplicativeIdealWeight.LSeries_ne_zero_of_summable_idealTerm`: summability of the ideal terms for Re s > 3/2 already gives nonvanishing. The parent's request to Tau Ceti ArithmeticDirichletSeries layer 0 for the ideal Euler product is thereby obsolete (the ER.5 part's second restructure entry).

### The pairing on O/CO and the finite Fourier transform of Lecture 11

`ER.5/fourier-transform-on-O-mod-C` · definition · parent packet · added by REV-EllipticRegulators

Let O = ℤ + ℤτ be an order in an imaginary quadratic field and C ≥ 1. The pairing ⟨·,·⟩ : O/CO × O/CO → ℂ^× is ⟨a + bτ, k + ℓτ⟩ = e^{2πi(−aℓ+bk)/C} (Bloch p. 89); it is bi-additive, ⟨x, y⟩⟨y, x⟩ = 1, and ⟨xy, z⟩ = ⟨x, ȳz⟩ (Lemma 11.1.4). For F : O/CO → ℂ put F̂(x) := C^{-1} Σ_{y ∈ O/CO} F(y)·⟨x, y⟩, i.e. F̂(k + ℓτ) = C^{-1} Σ_{a,b} F(a + bτ)·e^{2πi(aℓ − bk)/C}. This is the transform used in the proof of Lemma 11.1.7 (p. 91) and the one for which (11.1.2) holds; Bloch's display (11.1.1) prints the kernel e^{2πi(−aℓ+bk)/C}, i.e. ⟨y, x⟩ = ⟨x, y⟩^{-1}, which for an odd F gives −F̂ (source issue EllipticRegulators/E7). The normalisation is 1/C; if f(m, n) = F(n + mτ) then Lecture 10's f̂(k, ℓ) = C^{-1}·F̂(k + ℓτ).

**Hypotheses.**

- O = ℤ + ℤτ with τ² + Aτ + B = 0, A, B ∈ ℤ (Lemma 11.1.4 uses this form).
- The kernel is ⟨x, y⟩ with the dual argument x first.

**Construction.**

1. Define the pairing and check bi-additivity and ⟨x, y⟩⟨y, x⟩ = 1.
2. Prove ⟨xy, z⟩ = ⟨x, ȳz⟩ by expanding in the basis (1, τ) with τ² = −Aτ − B (Bloch's proof of Lemma 11.1.4).
3. Define the unitary transform with the corrected dual-first pairing. Import inversion from AC.0 via the ER.4 coefficient/dual comparison and the factor C; similarly obtain Parseval for counting sums.
4. Prove the comparison with ER.4/finite-fourier-transform.

**API.**

- `pairingO` (data): ⟨a + bτ, k + ℓτ⟩ = e^{2πi(−aℓ+bk)/C}.
- `pairingO_swap` (relation): ⟨x, y⟩·⟨y, x⟩ = 1.
- `pairingO_mul_left` (characterisation): ⟨xy, z⟩ = ⟨x, ȳz⟩ (Lemma 11.1.4).
- `fourierO` (data): F̂(x) = C^{-1} Σ_y F(y)⟨x, y⟩.
- `fourierO_inversion` (characterisation): F(y) = C^{-1} Σ_x F̂(x)⟨x, y⟩^{-1}.
- `fourierO_eq_finiteFourier10` (compatibility): For f(m, n) = F(n + mτ): finiteFourier10 f (k, ℓ) = C^{-1}·F̂(k + ℓτ).
- `fourierO_parseval` (relation): Σ_x ‖fourierO C F x‖²=Σ_y ‖F y‖², obtained from AC.0 through the ER.4 comparison and the factor C.

**Unit tests.**

- `pairingO_lemma_11_1_4` (characterisation): For O = ℤ[i], C = 4: ⟨xy, z⟩ = ⟨x, ȳz⟩ for all x, y, z ∈ O/4O.
- `fourierO_chi_Qi` (computation): κ = ℚ(i), C = 4, χ the unit congruent mod 2 + 2i (extended by 0): χ̂ is supported on {1+i, 1+3i, 3+i, 3+3i} with χ̂(1+i) = 1 + i; with the printed kernel of (11.1.1) one gets −1 − i.
- `fourierO_normalisation` (compatibility): For f(m,n)=F(n+mτ), fourierO C F (k,ℓ)=C·finiteFourier10 C f (k,ℓ), with the SAME output index, using coordinates (a,b) ↦ a+bτ for F.
- `fourierO_printed_kernel` (non-example): With the kernel printed in (11.1.1), Σ_x F̂(x)R_q(S_{x/C}) = −(iy²C⁴/π) Σ' F(w)/(w²w̄) for the odd characters of ℚ(i) (C = 4), ℚ(√−3) (C = 6), ℚ(√−7) (C = 7).
- `fourierO_output_index` (non-example): C=3, F=δ_(1,0): fourierO F (0,1)=exp(2πi/3)/3, whereas fourierO F (1,0)=1/3. Swapping the output in the comparison with Lecture 10 is false.

**Acceptance.**

- ⟨xy, z⟩ = ⟨x, ȳz⟩.
- For f(m,n)=F(n+mτ), F̂(k+ℓτ)=C·f̂₁₀(k,ℓ). Only the input coordinates are swapped; the dual/output coordinates (k,ℓ) stay fixed.
- With the printed kernel of (11.1.1) the identity (11.1.2) fails by the factor −1 for odd F.

**Uses.**

- ER.5, the lattice-sum form of Theorem 10.2.1: The weights in (11.1.2).
- ER.5, the L-value theorem: The scalar contains χ̂(ḡ).

**Depends on.** this roadmap: `ER.4/finite-fourier-transform`.

**Needed by.** this roadmap: `ER.5/lattice-sum-form-of-theorem-10-2-1`, `ER.5/cm-twisting-and-distribution`, `ER.5/fourier-transform-of-the-character`, `ER.5/dual-first-fourier-comparison`, `ER.5/cm-gauss-coefficient`, `ER.5/primitive-gauss-normalization`, `ER.8/cm36-corrected-l-value`.

**Sources.**

- `Bloch.CRM11`, Lecture 11, (11.1.1), printed p. 87 (PDF p. 99): “It is convenient to alter slightly the definition of the Fourier transform employed in Lecture 10. We write f(a + bτ) in place of f(a, b), and define (11.1.1) f̂(k + ℓτ) = (1/C) Σ_{a,b=0}^{C−1} f(a + bτ)e^{2πi[(−aℓ+bk)/C]}. (Note the interchange of k and ℓ.)” — The printed definition, whose kernel has the wrong sign relative to (11.1.2) and to the proof of Lemma 11.1.7.
- `Bloch.CRM11`, Lecture 11, before Lemma 11.1.4, printed p. 89 (PDF p. 101): “It is convenient to denote by ⟨ , ⟩ the bilinear form ⟨ , ⟩: O/CO × O/CO → C*, ⟨a + bτ, k + ℓτ⟩ = e^{2πi(−aℓ+bk)/C}.” — The pairing, verbatim.

**Assembly note.** The ER.5 part imports this node by id: Retain the specialized transform, all API/tests, using dual-first kernel and C⁻¹ normalization.

### Theorem 10.2.1 on O/CO: (11.1.2), Lemma 11.1.1 and Lemma 11.1.2 with the corrected sign

`ER.5/lattice-sum-form-of-theorem-10-2-1` · theorem · parent packet · added by REV-EllipticRegulators

Let O = ℤ + ℤτ, y = Im τ, C ≥ 1 and F : O/CO → ℂ odd. With F̂ as in ER.5/fourier-transform-on-O-mod-C: Σ_{x ∈ O/CO} F̂(x)·R_q(S_{x/C}) = (iy²C⁴/π) Σ_{0 ≠ w ∈ O} F(w)/(w²w̄) ((11.1.2)). Moreover R_q(S_{−x/C}) = −R_q(S_{x/C}) (Lemma 11.1.1), and, with the sign corrected, R_q(S_{(a+bτ)/C}) = (y²C³/π) Σ_{(m,n)≠(0,0)} sin(2π[bm − an]/C)/((m+nτ)²(m+nτ̄)) (Lemma 11.1.2; Bloch prints sin(2π[an − bm]/C), source issue EllipticRegulators/E7).

**Hypotheses.**

- F is odd.
- R_q(S_{x/C}) is Bloch's regulator of the class at x/C, equal to C³·R_q(x/C) by ER.4/the-regulator-of-the-corrected-classes; R_q(S_0) = 0.

**Proof outline.**

1. Apply ER.4/bloch-theorem-10-2-1 to f(m, n) := F(n + mτ) and use f̂(k, ℓ) = C^{-1}F̂(k + ℓτ).
2. Lemma 11.1.1 is the oddness of R_q (ER.3).
3. Lemma 11.1.2: apply (11.1.2) to the odd function F with F̂ = δ_x − δ_{−x} (obtained by inversion) and use Lemma 11.1.1.

**Acceptance.**

- (11.1.2) holds with the transform of ER.5/fourier-transform-on-O-mod-C; reviewer's ratios LHS/RHS = 1.0000000000 for the characters of ℚ(i) (C = 4), ℚ(√−3) (C = 6), ℚ(√−7) (C = 7 and 14), and −1 with the printed kernel.
- Lemma 11.1.2 with sin(2π[bm − an]/C): τ = 0.1 + 1.1i, C = 4, (a, b) = (1, 0): lattice sum truncated at |m|, |n| ≤ 400 gives −0.51972 + 59.43843i against C³R_q = −0.51972 + 59.43858i; the printed sign gives +0.51972 − 59.43843i. Same for (a, b) = (0, 1) and (3, 2).
- R_q(S_{−x/C}) = −R_q(S_{x/C}).

**Depends on.** this roadmap: `ER.4/bloch-theorem-10-2-1`, `ER.5/fourier-transform-on-O-mod-C`, `ER.4/the-regulator-of-the-corrected-classes`.

**Needed by.** this roadmap: `ER.5/the-L-value-theorem`, `ER.5/cm-twisting-and-distribution`, `ER.5/dual-first-fourier-comparison`.

**Sources.**

- `Bloch.CRM11`, Lecture 11, (11.1.2), printed p. 88 (PDF p. 100): “(11.1.2) Σ_{k,ℓ=0}^{C−1} f̂(k + ℓτ)R_q(S_{(k+ℓτ)/C}) = (iy²C⁴/π) Σ_{(m,n)≠(0,0)} f(m + nτ)/((m + nτ)²(m + nτ̄)).” — The identity, verbatim; it holds with the kernel ⟨x, y⟩, not with the printed (11.1.1).
- `Bloch.CRM11`, Lecture 11, Lemma 11.1.2, printed p. 88 (PDF p. 100): “LEMMA 11.1.2. R_q(S_{(a+bτ)/C}) = (y²C³/π) Σ_{(m,n)≠(0,0)} sin(2π[an − bm]/C)/((m + nτ)²(m + nτ̄))” — The printed statement, whose sign is wrong (source issue E7).

**Assembly note.** The ER.5 part imports this node by id: Retain the corrected C⁴ identity; use the direct reviewed ER.4 analytic proof.

### Units and the CM distribution relation for the regulators (Corollaries 11.1.5 and 11.1.6)

`ER.5/cm-twisting-and-distribution` · lemma · parent packet · added by REV-EllipticRegulators

Let O = O_κ = ℤ + ℤτ with κ of class number one and C ≥ 1. (a) For ζ ∈ μ_κ: R_q(S_{ζx/C}) = ζ^{-1}·R_q(S_{x/C}) (Cor. 11.1.5). (b) If C = fg with f, g ∈ O: ḡ·Σ_{μ ∈ O/gO} R_q(S_{x/C + fμ/C}) = R_q(S_{x/f}), where S_{x/f} is the class at the C-torsion point x/f, built with the same C (Cor. 11.1.6).

**Hypotheses.**

- O is the maximal order of a class-number-one field (Bloch's standing assumption from p. 90).
- All classes are built with the same C.

**Proof outline.**

1. (a) From the lattice-sum form of Lemma 11.1.2 and ⟨ζx, y⟩ = ⟨x, ζ̄y⟩, substituting w ↦ ζ̄w in the lattice sum.
2. (b) From Σ_{μ ∈ O/gO}⟨μ, f̄y⟩ = N(g) if ḡ | y and 0 otherwise, and the substitution y = ḡ(r + sτ) in the lattice sum.

**Acceptance.**

- Reviewer's check, κ = ℚ(i), τ = i, C = 4: R_q(S_{i(1+2i)/4})/R_q(S_{(1+2i)/4}) = −i; for f = 2 + 2i, g = 1 − i and x = 1, 1 + 2i, 3 both sides of (b) agree (e.g. −37.3640042692 + 37.3640042692i for x = 1).

**Depends on.** this roadmap: `ER.5/lattice-sum-form-of-theorem-10-2-1`, `ER.5/fourier-transform-on-O-mod-C`.

**Needed by.** this roadmap: `ER.5/the-L-value-theorem`, `ER.5/conductor-fiber-regulator-evaluation`, `ER.5/unit-orbit-regulator-count`, `ER.5/extra-prime-level-counterexample`.

**Sources.**

- `Bloch.CRM11`, Lecture 11, Corollary 11.1.5, printed p. 89 (PDF p. 101): “COROLLARY 11.1.5. If ζ ∈ O_κ is a unit (i.e., a root of 1) then R_q(S_{ζ(a+bτ)/C}) = ζ^{-1}R_q(S_{(a+bτ)/C}).” — Part (a), verbatim.
- `Bloch.CRM11`, Lecture 11, Corollary 11.1.6, printed p. 90 (PDF p. 102): “COROLLARY 11.1.6. Suppose C = fg, f, g ∈ O_κ. Then ḡ Σ_{μ∈O/gO} R_q(S_{(a+bτ)/C+fμ/C}) = R_q(S_{(a+bτ)/f}).” — Part (b), verbatim.

**Assembly note.** The ER.5 part imports this node by id: Retain the same-level unit and CM distribution laws.

### The Fourier transform of the CM character (Lemma 11.1.7)

`ER.5/fourier-transform-of-the-character` · lemma · parent packet · added by REV-EllipticRegulators

Let χ have conductor f, C = fg, χ extended to O/CO as in ER.5/the-class-U and χ̂ as in ER.5/fourier-transform-on-O-mod-C. Then (i) χ̂(x) = 0 unless C | f̄x, i.e. unless ḡ | x; (ii) χ̂(xy) = χ̄(x̄)·χ̂(y) for x ∈ (O/CO)^×; (iii) if f₁ ∥ f and C | f̄₁x then χ̂(x) = 0. Hence χ̂(w) ≠ 0 only for w = ḡx with x invertible modulo f̄, and then χ̂(ḡx) = χ̄(x̄)·χ̂(ḡ). All three statements are homogeneous in χ̂, so they hold for either sign of the kernel.

**Hypotheses.**

- χ is a character of (O/fO)^× of conductor exactly f, pulled back to O/CO.
- x in (ii) is invertible modulo C.

**Proof outline.**

1. (i) Split y = y′ + fy″ (y′ mod f, y″ mod g) and sum the character y″ ↦ ⟨x, fy″⟩ = ⟨xf̄, y″⟩.
2. (ii) Substitute z ↦ x̄z and use Lemma 11.1.4.
3. (iii) Choose y ≡ 1 mod f̄₁ with χ(ȳ) ≠ 1 (primitivity of χ) and use (ii).

**Acceptance.**

- κ = ℚ(i), C = 4: χ̂ is supported exactly on (1 + i)·(O/4O)^× and (ii) holds for all x, y (reviewer's computation).

**Depends on.** this roadmap: `ER.5/fourier-transform-on-O-mod-C`, `ER.5/the-CM-setup-and-the-hecke-character`.

**Needed by.** this roadmap: `ER.5/the-L-value-theorem`, `ER.5/primitive-gauss-normalization`, `ER.5/conductor-fiber-regulator-evaluation`.

**Sources.**

- `Bloch.CRM11`, Lecture 11, Lemma 11.1.7, printed pp. 90–91 (PDF pp. 102–103): “LEMMA 11.1.7. Let χ have conductor f | C, C = fg. Then (i) χ̂(x) = 0 unless C | f̄x. (ii) ) For x ∈ (O/CO)*, χ̂(xy) = χ̄(x̄)χ̂(y). (iii) Let f₁ ∥ f and suppose C | f̄₁x. Then χ̂(x) = 0.” — The statement, verbatim (including the stray parenthesis of the scan); the proof on p. 91 uses χ̂(x) = (1/C)Σ χ(y)⟨x, y⟩.

**Assembly note.** The ER.5 part imports this node by id: Retain conductor support/covariance; primitive norm and exact support are supplied here.

### Lecture 10 and Lecture 11 Fourier conventions

`ER.5/dual-first-fourier-comparison` · comparison · ER.5 part

With B(a+bτ,k+ℓτ)=exp(2πi(−aℓ+bk)/C), use H_F(x)=C⁻¹Σ_y F(y)B(x,y). In coordinates H_F(k+ℓτ)=C⁻¹Σ_{a,b}F(a+bτ)exp(2πi(aℓ−bk)/C). For f₁₀(a,b)=F(b+aτ), H_F(k+ℓτ)=C f̂₁₀(k,ℓ), with the SAME output coordinates. Thus the imported direct ER.4 analytic identity gives Σ_x H_F(x)R_C(x)=iy²C⁴/π·Σ_{w∈O,w≠0}F(w)/(w²w̄). For odd F the printed opposite kernel gives −H_F and the negative of this identity. The associated sine kernel is sin(2π(bm−an)/C), not sin(2π(an−bm)/C).

**Hypotheses.**

- C≥1, τ∈ℍ; F:O/CO→ℂ is odd. O=ℤ+ℤτ is needed only to identify residue coordinates.

**Proof outline.**

1. Import the AC.0 Fourier API through the parent torsion adapter; no general Fourier transform, inversion or Parseval is constructed here.
2. Substitute f₁₀(a,b)=F(b+aτ) in the parent ER.4 transform and rename a,b; its factor C⁻² becomes C⁻¹ after multiplication by C, without swapping the output.
3. Use ER.4/direct-regularized-fourier-identity, then ER.4/the-regulator-of-the-corrected-classes: the analytic transform supplies C, the class normalization supplies C³.
4. Negating the kernel replaces x by −x. Oddness gives H_F(−x)=−H_F(x); inversion and R_C(−x)=−R_C(x) determine the corrected sine sign.

**Acceptance.**

- C=3, F=δ_(1,0): H_F(0,1)=exp(2πi/3)/3 and H_F(1,0)=1/3, detecting an output-coordinate swap.
- C=4, τ=i, primitive χ: H_χ(1+i)=1+i; the printed kernel gives −1−i.
- No dependency on the final ER.5 L-value theorem enters the analytic identity.

**Depends on.** this roadmap: `ER.4/finite-fourier-transform`, `ER.4/direct-regularized-fourier-identity`, `ER.4/the-regulator-of-the-corrected-classes`, `ER.5/fourier-transform-on-O-mod-C`, `ER.5/lattice-sum-form-of-theorem-10-2-1`.

**Needed by.** this roadmap: `ER.5/unit-factor-cancellation-certificate`.

**Lean.** module `TauCeti/NumberTheory/EllipticRegulator/CM`, namespace `TauCeti.EllipticRegulator`.

**Sources.**

- `Bloch.CRM11.public`, §11.1, (11.1.1)–(11.1.2), pp.87–88; proof of Lemma 11.1.7, p.91: “(11.1.1)” — The printed transform and the dual-first transform in the proof disagree. This comparison implements the accepted parent correction EllipticRegulators/E7; the C⁴ is independently reconstructed from the reviewed direct ER.4 proof.

### The CM Gauss coefficient

`ER.5/cm-gauss-coefficient` · definition · planet “The CM Gauss coefficient” · ER.5 part

Define Γ_C(F,g)=g H_F(ḡ mod C), with H the imported dual-first, C⁻¹ transform. This is a complex-linear finite-weight scalar; the CM specialization is Γ_C(χ,g). It is the numerator coefficient in Bloch’s regulator formula, named separately to pin the generator, Fourier sign and level normalization. It constructs no Hecke character.

**Hypotheses.**

- E/ℚ has CM by the maximal order O=ℤ+ℤτ of an imaginary quadratic field κ of class number one; the embedding has y=Im τ>0. CM.1/CM.4 supply this datum and ψ, not ER.5.
- The imported primitive finite character χ:(O/fO)×→μ restricts to the chosen embedding on μ=O×, satisfies χ(x̄)=χ̄(x), and (f̄)=(f). C≥1 is a rational integer, C=fg, f,g≠0 in O. Equality of conjugate conductor ideals does not mean f̄=f as elements.
- χ on O/CO means pullback from O/fO on residues invertible modulo f, and zero elsewhere. W is precisely that nonzero locus. R_C(x)=R_q(S_{x/C}) always uses classes built at the same level C.

**Construction.**

1. Take the imported finite transform and the image of ḡ in O/CO; multiply its value by the chosen embedding of g.
2. Expose the value and linearity APIs for arbitrary finite weights. For the primitive CM character, derive the conductor-generator independence, reality and norm APIs using primitive-gauss-normalization.

**API.**

- `cmGaussCoefficient_apply` (characterisation): Γ_C(F,g)=g·C⁻¹Σ_x F(x)B(ḡ,x).
- `cmGaussCoefficient_congr` (extensionality): If F(x)=G(x) for every x∈O/CO, then Γ_C(F,g)=Γ_C(G,g), for the same g and level C.
- `cmGaussCoefficient_zero` (simp): Γ_C(0,g)=0 for every g.
- `cmGaussCoefficient_add` (structure): Γ_C(F+G,g)=Γ_C(F,g)+Γ_C(G,g).
- `cmGaussCoefficient_smul` (structure): Γ_C(cF,g)=cΓ_C(F,g) for c∈ℂ.
- `cmGaussCoefficient_changeGenerator` (compatibility): For ζ∈μ, replacing f by ζf and g by ζ⁻¹g, C fixed, gives Γ_C(χ,ζ⁻¹g)=Γ_C(χ,g).
- `cmGaussCoefficient_real` (relation): For the primitive CM character, conjugate Γ_C(χ,g)=Γ_C(χ,g).
- `cmGaussCoefficient_norm` (characterisation): For the primitive CM character, ‖Γ_C(χ,g)‖=N(g)=C²/N(f)>0; in particular Γ_C(χ,g)≠0.
- `cmGaussCoefficient_oppositeKernel` (compatibility): For odd F, the coefficient formed with B(x,ḡ) is −Γ_C(F,g).

**Unit tests.**

- `cmGaussCoefficient_Qi_C4` (computation): τ=i, C=4, f=2+2i, g=1−i, χ(h) the unique unit congruent to h mod f: H_χ(1+i)=1+i and Γ=2.
- `cmGaussCoefficient_Eisenstein_C6` (computation): τ=(1+√−3)/2, C=6, f=2√−3, g=−√−3, χ the unique congruent unit: H_χ(√−3)=√−3 and Γ=3.
- `cmGaussCoefficient_Qsqrt7_C7` (computation): τ=(1+√−7)/2, C=7, f=√−7, g=−√−7, χ(a+bτ)=Legendre(a+4b,7): H_χ(√−7)=√−7 and Γ=7.
- `cmGaussCoefficient_zero_weight` (degenerate): The zero finite weight gives Γ=0, so the primitive-character norm formula cannot omit its hypotheses.
- `cmGaussCoefficient_wrong_kernel` (non-example): The printed kernel gives Γ=−2 in the Gaussian C=4 case, rejecting a transform with the wrong orientation.
- `cmGaussCoefficient_imprimitive` (non-example): At τ=i,C=4,f=2+2i,g=1−i, the trivial character on units mod f extended by zero has H(1+i)=0 and Γ=0; the underlying trivial unit character has conductor (1), while its nonunit-zero extension is an indicator prime to (1+i), and it does not restrict to μ as the embedding.
- `cmGaussCoefficient_changeGenerator_Qi` (compatibility): At τ=i,C=4, replacing f=2+2i by if=−2+2i and g=1−i by −ig=−1−i changes the Fourier input from (1,1) to (3,1) but preserves Γ=2.

**Acceptance.**

- The norm and reality APIs require a primitive CM character with conjugation and μ-restriction; they are not assertions about arbitrary finite weights.
- Changing the generator of the SAME ideal (f), with C fixed, preserves Γ. Changing C is not covered by that API.

**Uses.**

- ER.5 corrected regulator scalar: The coefficient is πΓ/(iy²C⁴), and its nonzero norm permits division.
- ER.8 CM worked example: Finite exact Gauss sums certify the chosen character and the scalar before evaluating the dilogarithm.
- Bloch §11.2, Remark 11.2.2(ii): The generator independence removes a spurious choice of f; the formula still records the chosen class level C.

**Depends on.** this roadmap: `ER.5/fourier-transform-on-O-mod-C`, `ER.5/the-CM-setup-and-the-hecke-character`; layers of other roadmaps: `ComplexMultiplicationAndExplicitReciprocity:CM.1`, `ComplexMultiplicationAndExplicitReciprocity:CM.4`.

**Needed by.** this roadmap: `ER.5/primitive-gauss-normalization`, `ER.5/conductor-fiber-regulator-evaluation`, `ER.5/three-CM-normalization-examples`.

**Lean.** module `TauCeti/NumberTheory/EllipticRegulator/CM`, namespace `TauCeti.EllipticRegulator`.

**Sources.**

- `Bloch.CRM11.public`, §11.2, (11.2.1)–(11.2.4), pp.91–92: “(11.2.4)” — Γ names the product g·H_χ(ḡ) occurring in the displayed formulas, rather than another CM datum. Parent E7/E8 fixes its convention and final scalar.

### Primitive CM Gauss sum normalization

`ER.5/primitive-gauss-normalization` · theorem · planet “Gauss sum nonvanishing” · ER.5 part

For the primitive CM character, H_χ is supported exactly on ḡ·(O/f̄O)× in O/CO, |H_χ(ḡ)|²=N(g), and Γ_C(χ,g) is real with |Γ_C(χ,g)|=N(g)>0. For ζ∈μ, Γ_C(χ,ζ⁻¹g)=Γ_C(χ,g) when f is replaced by ζf. In particular Γ=±N(g); the sign is determined by the character and the fixed additive kernel, not discarded by taking a norm.

**Hypotheses.**

- E/ℚ has CM by the maximal order O=ℤ+ℤτ of an imaginary quadratic field κ of class number one; the embedding has y=Im τ>0. CM.1/CM.4 supply this datum and ψ, not ER.5.
- The imported primitive finite character χ:(O/fO)×→μ restricts to the chosen embedding on μ=O×, satisfies χ(x̄)=χ̄(x), and (f̄)=(f). C≥1 is a rational integer, C=fg, f,g≠0 in O. Equality of conjugate conductor ideals does not mean f̄=f as elements.
- χ on O/CO means pullback from O/fO on residues invertible modulo f, and zero elsewhere. W is precisely that nonzero locus. R_C(x)=R_q(S_{x/C}) always uses classes built at the same level C.

**Proof outline.**

1. Import the parent conductor-support and multiplicative transformation laws. A unit modulo f̄ has a unit-modulo-C lift by the finite quotient/CRT interface of GlobalNumberFields layer 9. The transformation law therefore makes every allowed Fourier coefficient a root of unity times H_χ(ḡ).
2. Reduction O/CO→O/fO has N(g) elements per fiber, so Σ_x|χ(x)|²=N(g)φ(f), while the allowed support has φ(f̄)=φ(f) elements. Imported counting-measure Parseval for the unitary transform gives φ(f)|H_χ(ḡ)|²=N(g)φ(f); φ(f)>0 proves the norm and exact support.
3. Conjugation reverses B: B(x̄,ȳ)=B(x,y)⁻¹. With χ(x̄)=χ̄(x), obtain conjugate H_χ(w)=H_χ(w̄). Since (f̄)=(f), u=g/ḡ=f̄/f is a unit. The character law and χ|μ give H_χ(g)=u H_χ(ḡ), whence conjugate(g H_χ(ḡ))=g H_χ(ḡ).
4. For f′=ζf,g′=ζ⁻¹g, ḡ′=ζḡ and H_χ(ζḡ)=ζ H_χ(ḡ); the two factors cancel. N(g)>0, and N(f)N(g)=C².

**Acceptance.**

- The Gaussian norm is |1+i|²=2, the Eisenstein norm is 3, and the √−7 norm is 7.
- No literal equation f=f̄ is used: f=2+2i is an explicit counterexample to that stronger equation.
- The imprimitive indicator test has zero Fourier value and fails the claimed primitive norm.

**Depends on.** this roadmap: `ER.5/cm-gauss-coefficient`, `ER.5/fourier-transform-of-the-character`, `ER.5/fourier-transform-on-O-mod-C`; other roadmaps: `AdditiveCombinatorics:AC.0/fourier-parseval`; Tau Ceti roadmap layers: `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters`.

**Needed by.** this roadmap: `ER.5/unit-factor-cancellation-certificate`, `ER.5/three-CM-normalization-examples`, `ER.5/extra-prime-level-counterexample`.

**Lean.** module `TauCeti/NumberTheory/EllipticRegulator/CM`, namespace `TauCeti.EllipticRegulator`.

**Sources.**

- `Bloch.CRM11.public`, Lemma 11.1.7 and proof, pp.90–91; §11.2, pp.91–92: “Lemma 11.1.7.” — The support/covariance are Lemma 11.1.7. The norm, reality and generator independence are derived consequences using the imported Fourier API and the E/ℚ conjugation hypothesis, not separately numbered source theorems.

### Conductor fibers in the weighted regulator sum

`ER.5/conductor-fiber-regulator-evaluation` · theorem · ER.5 part

Let A_C=Σ_{w∈O/CO}H_χ(w)R_C(w). Then A_C=Γ_C(χ,g)Σ_{x∈W}χ(x)R_C(x), where W consists of all residues invertible modulo f. This equality holds even when g has a prime factor not dividing f.

**Hypotheses.**

- E/ℚ has CM by the maximal order O=ℤ+ℤτ of an imaginary quadratic field κ of class number one; the embedding has y=Im τ>0. CM.1/CM.4 supply this datum and ψ, not ER.5.
- The imported primitive finite character χ:(O/fO)×→μ restricts to the chosen embedding on μ=O×, satisfies χ(x̄)=χ̄(x), and (f̄)=(f). C≥1 is a rational integer, C=fg, f,g≠0 in O. Equality of conjugate conductor ideals does not mean f̄=f as elements.
- χ on O/CO means pullback from O/fO on residues invertible modulo f, and zero elsewhere. W is precisely that nonzero locus. R_C(x)=R_q(S_{x/C}) always uses classes built at the same level C.
- For rational descent and the pure-imaginary regulator conclusion, the chosen CM uniformization is required to intertwine complex conjugation with z↦z̄ on ℂ/O (equivalently the CM.2 real-structure transport is the natural one in these coordinates). This compatibility is an incoming datum; maximal-order CM and a shared j-invariant alone do not establish it for every ℚ-twist.

**Proof outline.**

1. Support and the character transformation law rewrite A_C as H_χ(ḡ)Σ_{t∈(O/f̄O)×}χ(t)R_C(ḡt), using χ̄(t̄)=χ(t).
2. Apply the parent distribution relation to the factorization C=f̄ḡ: R_C(ḡt)=g Σ_{ν∈O/ḡO}R_C(t+f̄ν). Both sides denote S built with the SAME C; no replacement by f-level Bloch classes occurs.
3. These fibers partition residues invertible modulo f̄, which equal W because (f̄)=(f). χ is constant on each fiber. Multiply by H_χ(ḡ) to obtain the formula.
4. The step never identifies W with units modulo C. That replacement requires every prime dividing g to divide f.

**Acceptance.**

- At √−7,C=14, |W|=168 although |(O/14O)×|=42.
- At Qi,C=4, W equals units modulo C, and the formula reduces to the printed indexing after the scalar correction.
- The prefactor here is g, obtained by applying distribution to f̄,ḡ; substituting ḡ would fail the Gaussian example.

**Depends on.** this roadmap: `ER.5/cm-gauss-coefficient`, `ER.5/fourier-transform-of-the-character`, `ER.5/cm-twisting-and-distribution`, `ER.5/the-class-U`; Tau Ceti roadmap layers: `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters`.

**Needed by.** this roadmap: `ER.5/unit-orbit-regulator-count`, `ER.5/unit-factor-cancellation-certificate`.

**Lean.** module `TauCeti/NumberTheory/EllipticRegulator/CM`, namespace `TauCeti.EllipticRegulator`.

**Sources.**

- `Bloch.CRM11.public`, Corollary 11.1.6, p.90; (11.2.1), pp.91–92: “Corollary 11.1.6.” — The distribution proof partitions full conductor fibers. The printed last step of (11.2.1) incorrectly replaces them by units modulo C without an extra prime-support assumption; accepted parent E9 supplies the correction.

### Root-of-unity orbits in Bloch’s class

`ER.5/unit-orbit-regulator-count` · comparison · ER.5 part

The μ-action on W is free. The map x↦xχ̄(x) identifies W/μ with its image in O/CO, and |W/μ|=N(g)φ(f)/|μ|. For the imported class U=Σ_{W/μ}S_{xχ̄(x)/C}, Σ_{x∈W}χ(x)R_C(x)=|μ|R_q(U). Thus A_C=|μ|Γ_C(χ,g)R_q(U). The class and rational descent remain the parent/E.7 constructions.

**Hypotheses.**

- E/ℚ has CM by the maximal order O=ℤ+ℤτ of an imaginary quadratic field κ of class number one; the embedding has y=Im τ>0. CM.1/CM.4 supply this datum and ψ, not ER.5.
- The imported primitive finite character χ:(O/fO)×→μ restricts to the chosen embedding on μ=O×, satisfies χ(x̄)=χ̄(x), and (f̄)=(f). C≥1 is a rational integer, C=fg, f,g≠0 in O. Equality of conjugate conductor ideals does not mean f̄=f as elements.
- χ on O/CO means pullback from O/fO on residues invertible modulo f, and zero elsewhere. W is precisely that nonzero locus. R_C(x)=R_q(S_{x/C}) always uses classes built at the same level C.
- For rational descent and the pure-imaginary regulator conclusion, the chosen CM uniformization is required to intertwine complex conjugation with z↦z̄ on ℂ/O (equivalently the CM.2 real-structure transport is the natural one in these coordinates). This compatibility is an incoming datum; maximal-order CM and a shared j-invariant alone do not establish it for every ℚ-twist.

**Proof outline.**

1. If ζx=x mod C, invert x mod f to get ζ=1 mod f; χ|μ then gives ζ=1 as a root of unity. This proves freeness without requiring x to be a unit modulo C.
2. The index map is orbit-constant because χ(ζx)=ζχ(x). If two images coincide, x=(χ(x)/χ(y))y, so their residues lie in the same μ-orbit.
3. Unit twisting gives R_C(xχ̄(x))=χ(x)R_C(x). Rational additivity of the parent regulator and equal orbit sizes give the displayed sum.
4. Use the parent Galois action/descent, with inverse norm divided by [L:ℚ], for U over ℚ; no integrality or generation assertion is added.

**Acceptance.**

- Qi,C=4: eight residues, four roots of unity, two distinct index points (1,0),(3,2).
- Eisenstein,C=6: eighteen residues, six roots, three index points (1,0),(5,4),(3,2).
- √−7,C=7 and14: 21 and84 orbits, respectively; freeness remains true at14.

**Depends on.** this roadmap: `ER.5/conductor-fiber-regulator-evaluation`, `ER.5/the-class-U`, `ER.5/cm-twisting-and-distribution`, `ER.4/the-divisor-formula`; other roadmaps: `EllipticKTheory:E.7/rational-galois-descent`.

**Needed by.** this roadmap: `ER.5/unit-factor-cancellation-certificate`.

**Lean.** module `TauCeti/NumberTheory/EllipticRegulator/CM`, namespace `TauCeti.EllipticRegulator`.

**Sources.**

- `Bloch.CRM11.public`, (11.2.2)–(11.2.3), p.92: “(11.2.3)” — This is the orbit step in Bloch’s construction, with W replacing the insufficient unit index set as recorded in parent E9. Its precise factor |μ| must be compared with the generator multiplicity on the L-series side.

### Ideal and generator normalizations of the Hecke series

`ER.5/principal-generator-L-series-comparison` · comparison · ER.5 part

With ψ supplied by CM.4, at s=2 the absolutely convergent element sum T_C=Σ_{a∈O,a≠0}χ(a)/(a²ā) equals |μ|·LSeries(normCoeff κ ψ.toIdealArithmeticFunction,2), the latter also equal to Σ_{I≠0}ψ(I)/N(I)². The summand is zero if a is not prime to f, not merely if a is not prime to C.

**Hypotheses.**

- E/ℚ has CM by the maximal order O=ℤ+ℤτ of an imaginary quadratic field κ of class number one; the embedding has y=Im τ>0. CM.1/CM.4 supply this datum and ψ, not ER.5.
- The imported primitive finite character χ:(O/fO)×→μ restricts to the chosen embedding on μ=O×, satisfies χ(x̄)=χ̄(x), and (f̄)=(f). C≥1 is a rational integer, C=fg, f,g≠0 in O. Equality of conjugate conductor ideals does not mean f̄=f as elements.
- χ on O/CO means pullback from O/fO on residues invertible modulo f, and zero elsewhere. W is precisely that nonzero locus. R_C(x)=R_q(S_{x/C}) always uses classes built at the same level C.
- For rational descent and the pure-imaginary regulator conclusion, the chosen CM uniformization is required to intertwine complex conjugation with z↦z̄ on ℂ/O (equivalently the CM.2 real-structure transport is the natural one in these coordinates). This compatibility is an incoming datum; maximal-order CM and a shared j-invariant alone do not establish it for every ℚ-twist.

**Proof outline.**

1. Use the CM.4 principal-ideal law ψ((a))=āχ(a) and N((a))=a ā to identify the summand with ψ((a))/N((a))². It is unchanged by a↦ζa because χ(ζ)=ζ and ζ̄ζ=1.
2. Class number one makes every nonzero integral ideal principal, with exactly |μ| generators. Regroup the absolutely convergent sum by this finite fiber.
3. The norm of each element summand is at most |a|⁻³; import the reviewed ER.4 lattice convergence. Independently the ideal series is summable by cm-ideal-series-at-two.
4. Apply the pinned TauCeti.LSeries_normCoeff regrouping declaration. The coefficient n=0 is zero, and ideals killed at the conductor contribute zero.

**Acceptance.**

- For Qi, the ideal (1) has four generators, each contributing 1; it contributes once to the ideal L-series.
- For Eisenstein the corresponding multiplier is six, and for √−7 it is two.
- At C=14, conductor-prime-to ideals above2 are retained; deleting them would give an imprimitive L-function.

**Depends on.** this roadmap: `ER.5/cm-ideal-series-at-two`, `ER.4/direct-series-convergence`; layers of other roadmaps: `ComplexMultiplicationAndExplicitReciprocity:CM.1`, `ComplexMultiplicationAndExplicitReciprocity:CM.4`; libraries: `tauceti:TauCeti.LSeries_normCoeff`.

**Needed by.** this roadmap: `ER.5/unit-factor-cancellation-certificate`.

**Lean.** module `TauCeti/NumberTheory/EllipticRegulator/CM`, namespace `TauCeti.EllipticRegulator`.

**Sources.**

- `Bloch.CRM11.public`, §11.2 preceding (11.2.1), p.91; Theorem 11.2.1, p.92: “(11.2.1)” — Bloch moves from the lattice sum to an ideal Hecke L-function without dividing by the number of generators. This explicit comparison implements accepted parent E8. The generator’s bar is recovered from the parent’s reviewed CM convention, since the public text loses overlines.

### Absolute convergence and nonvanishing at two

`ER.5/cm-ideal-series-at-two` · application · ER.5 part

For the imported CM weight ψ, Summable(idealTerm κ ψ.toIdealArithmeticFunction s) for Re s>3/2, and LSeries(normCoeff κ ψ.toIdealArithmeticFunction,s)≠0 there. In particular L(E/ℚ,2)=L(2,ψ)≠0 via CM.4’s all-local-factor comparison. This is a specialization of the pinned ideal Euler-product result, not a new nonvanishing theorem for general Hecke L-functions.

**Hypotheses.**

- E/ℚ has CM by the maximal order O=ℤ+ℤτ of an imaginary quadratic field κ of class number one; the embedding has y=Im τ>0. CM.1/CM.4 supply this datum and ψ, not ER.5.
- The imported primitive finite character χ:(O/fO)×→μ restricts to the chosen embedding on μ=O×, satisfies χ(x̄)=χ̄(x), and (f̄)=(f). C≥1 is a rational integer, C=fg, f,g≠0 in O. Equality of conjugate conductor ideals does not mean f̄=f as elements.
- χ on O/CO means pullback from O/fO on residues invertible modulo f, and zero elsewhere. W is precisely that nonzero locus. R_C(x)=R_q(S_{x/C}) always uses classes built at the same level C.
- For rational descent and the pure-imaginary regulator conclusion, the chosen CM uniformization is required to intertwine complex conjugation with z↦z̄ on ℂ/O (equivalently the CM.2 real-structure transport is the natural one in these coordinates). This compatibility is an incoming datum; maximal-order CM and a shared j-invariant alone do not establish it for every ℚ-twist.

**Proof outline.**

1. CM.4 and GlobalNumberFields layer10 supply |ψ(I)|=N(I)^(1/2) on ideals prime to f and zero otherwise, as a MultiplicativeIdealWeight κ.
2. TauCeti.norm_idealTerm bounds the norm by N(I)^(−(Re s−1/2)). TauCeti.summable_absNorm_rpow_ideal_iff at Re s−1/2>1 proves the summability by norm comparison.
3. Apply TauCeti.MultiplicativeIdealWeight.LSeries_ne_zero_of_summable_idealTerm. The existing theorem supplies the reciprocal Euler-product argument, including prevention of a product of nonzero factors converging to zero.
4. Use the existing AL.1 unramified/ramified local-factor conventions, at unramified primes with unitary parameter ψ(P)/N(P)^(1/2) and argument s−1/2, so the unramified factor is (1−ψ(P)N(P)^(−s))⁻¹ and the ramified local-character factor is1. The ideal coefficient ψ(P)=0 at conductor primes is a zero-extension convention; it is not a value of a local quasi-character on a uniformizer. CM.4 supplies the equality of all these factors with the curve’s pinned WeierstrassCurve.LSeries, including additive factors1. Specialize to2. The parent nonvanishing node then gives R_q(U)≠0 and U≠0 once the corrected scalar is in place.

**Acceptance.**

- The exponent is 3/2 at s=2; a bounded/unitary-weight theorem applied directly to ψ would have the wrong hypothesis.
- The Hecke conductor is part of the coefficient, not an omitted Euler factor of the elliptic curve.
- No claim of analytic continuation, functional equation, K₂ injectivity or spanning follows.

**Depends on.** other roadmaps: `AutomorphicLFunctionsAndLocalFactors:AL.1/unramified-local-theory`, `AutomorphicLFunctionsAndLocalFactors:AL.1/ramified-local-theory`; layers of other roadmaps: `ComplexMultiplicationAndExplicitReciprocity:CM.4`; Tau Ceti roadmap layers: `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-10-archimedean-characters-infinity-types-and-cyclotomic-arithmetic`; libraries: `tauceti:TauCeti.MultiplicativeIdealWeight`, `tauceti:TauCeti.norm_idealTerm`, `tauceti:TauCeti.summable_absNorm_rpow_ideal_iff`, `tauceti:TauCeti.MultiplicativeIdealWeight.LSeries_ne_zero_of_summable_idealTerm`, `mathlib:WeierstrassCurve.LSeries`.

**Needed by.** this roadmap: `ER.5/principal-generator-L-series-comparison`, `ER.5/unit-factor-cancellation-certificate`.

**Lean.** module `TauCeti/NumberTheory/EllipticRegulator/CM`, namespace `TauCeti.EllipticRegulator`.

**Sources.**

- `Bloch.CRM11.public`, Remark 11.2.2 and Corollary 11.2.3, p.93: “Corollary 11.2.3.” — The source nonzero argument lies entirely in the absolutely convergent region. The reviewed library audit identifies the pinned Tau Ceti declaration that already supplies it.

### Normalization certificate for Bloch’s CM formula

`ER.5/unit-factor-cancellation-certificate` · theorem · ER.5 part

The same weighted sum satisfies A_C=|μ|Γ_C(χ,g)R_q(U) and A_C=(iy²C⁴/π)|μ|L(2,ψ). Cancelling |μ|>0 proves the accepted parent theorem with coefficient πΓ_C(χ,g)/(iy²C⁴). If Γ_op denotes g times the transform formed with the printed opposite kernel, then Γ_op=−Γ_C(χ,g); the SAME theorem is L(2,ψ)=−πΓ_op/(iy²C⁴)·R_q(U)=πΓ_C(χ,g)/(iy²C⁴)·R_q(U). Changing Fourier convention does not change the L-value or the coefficient after both signs are accounted for. Thus the printed factor |μ| is spurious. For the rational class U, R_q(U)=iC³Σ_{W/μ}D_q(exp(2πixχ̄(x)/C)), and L(E,2)=πΓ/(y²C)ΣD_q.

**Hypotheses.**

- E/ℚ has CM by the maximal order O=ℤ+ℤτ of an imaginary quadratic field κ of class number one; the embedding has y=Im τ>0. CM.1/CM.4 supply this datum and ψ, not ER.5.
- The imported primitive finite character χ:(O/fO)×→μ restricts to the chosen embedding on μ=O×, satisfies χ(x̄)=χ̄(x), and (f̄)=(f). C≥1 is a rational integer, C=fg, f,g≠0 in O. Equality of conjugate conductor ideals does not mean f̄=f as elements.
- χ on O/CO means pullback from O/fO on residues invertible modulo f, and zero elsewhere. W is precisely that nonzero locus. R_C(x)=R_q(S_{x/C}) always uses classes built at the same level C.
- For rational descent and the pure-imaginary regulator conclusion, the chosen CM uniformization is required to intertwine complex conjugation with z↦z̄ on ℂ/O (equivalently the CM.2 real-structure transport is the natural one in these coordinates). This compatibility is an incoming datum; maximal-order CM and a shared j-invariant alone do not establish it for every ℚ-twist.

**Proof outline.**

1. Use conductor-fiber-regulator-evaluation and unit-orbit-regulator-count for the first expression for A_C.
2. Use dual-first-fourier-comparison and principal-generator-L-series-comparison for the second expression.
3. Cancel the same positive integer |μ|; divide by iy²C⁴/π, which is nonzero. No nonvanishing of a numerical diagnostic is a premise.
4. Import the parent rational descent and conjugation/real-regulator convention. Conjugation-stability of the index set kills the real J companion; the imaginary part is the elliptic D sum. Nonvanishing uses cm-ideal-series-at-two and the primitive Gauss coefficient.

**Acceptance.**

- Gaussian Γ=2, y=1,C=4 gives L(E,2)=π/2·ΣD_q.
- Eisenstein Γ=3,y²=3/4,C=6 gives coefficient2π/3; √−7 Γ=7,y²=7/4,C=7 gives4π/7.
- The regulator is Bloch’s complex R_q. The Deligne regulator is ½ conjugate R_q from ER.4; those scalars cannot be interchanged.
- For the Gaussian example Γ=2 and Γ_op=−2. Both πΓ/(iy²C⁴) and −πΓ_op/(iy²C⁴) give the same positive L-value; −πΓ/(iy²C⁴) with dual-first Γ is false.

**Depends on.** this roadmap: `ER.5/dual-first-fourier-comparison`, `ER.5/conductor-fiber-regulator-evaluation`, `ER.5/unit-orbit-regulator-count`, `ER.5/principal-generator-L-series-comparison`, `ER.5/primitive-gauss-normalization`, `ER.4/the-regulator-of-the-corrected-classes`, `ER.5/the-class-U`, `ER.1/all-embeddings-and-the-conjugation-action`, `ER.5/cm-ideal-series-at-two`.

**Needed by.** this roadmap: `ER.5/three-CM-normalization-examples`, `ER.5/extra-prime-level-counterexample`.

**Lean.** module `TauCeti/NumberTheory/EllipticRegulator/CM`, namespace `TauCeti.EllipticRegulator`.

**Sources.**

- `Bloch.CRM11.public`, (11.2.1)–(11.2.4), pp.91–92; Corollary 11.2.3, p.93: “Theorem 11.2.1.” — This is an independent scalar certificate for the parent corrected theorem, using accepted E7/E8/E9, rather than a new identifier for that theorem. The printed final formula and the printed kernel cannot be combined unchanged.
- `Brunault.These.2005.public`, Remarque 20, p.22; Proposition 26 and its proof, pp.26–27, (1.64): “(1.64)” — The selected real-period uniformization transports conjugation to the natural coordinate action. The orientation-reversing substitution then makes the real-point regulator pure imaginary. Its conversion to Bloch’s R_q is imported from ER.4; no factor of two is inferred from this excerpt alone.

### The Gaussian, Eisenstein and √−7 examples

`ER.5/three-CM-normalization-examples` · application · ER.5 part

For E:y²=x³−x, τ=i,C=4,f=2+2i,g=1−i, Γ=2 and U=S_{1/4}+S_{(3+2i)/4}; R_q(U)=37.36400426919091138661030173188499…i and L(E,2)=0.917050635318654988643805524295713…. For y²=x³+1, τ=(1+√−3)/2,C=6, Γ=3, the three indices are (1,0),(5,4),(3,2) divided by6. For the maximal-order √−7 curve 49a1, C=7,χ(a+bτ)=Legendre(a+4b,7), Γ=7 and there are21 indices. The finite Gauss data and the scalar coefficients are exact; displayed decimal values are diagnostics.

**Hypotheses.**

- E/ℚ has CM by the maximal order O=ℤ+ℤτ of an imaginary quadratic field κ of class number one; the embedding has y=Im τ>0. CM.1/CM.4 supply this datum and ψ, not ER.5.
- The imported primitive finite character χ:(O/fO)×→μ restricts to the chosen embedding on μ=O×, satisfies χ(x̄)=χ̄(x), and (f̄)=(f). C≥1 is a rational integer, C=fg, f,g≠0 in O. Equality of conjugate conductor ideals does not mean f̄=f as elements.
- χ on O/CO means pullback from O/fO on residues invertible modulo f, and zero elsewhere. W is precisely that nonzero locus. R_C(x)=R_q(S_{x/C}) always uses classes built at the same level C.
- For rational descent and the pure-imaginary regulator conclusion, the chosen CM uniformization is required to intertwine complex conjugation with z↦z̄ on ℂ/O (equivalently the CM.2 real-structure transport is the natural one in these coordinates). This compatibility is an incoming datum; maximal-order CM and a shared j-invariant alone do not establish it for every ℚ-twist.

**Proof outline.**

1. Construct finite character tables by unit congruence modulo f for the Gaussian/Eisenstein cases, and by the quadratic residue character modulo7 for √−7. CM.4 supplies their elliptic/Hecke identification; the tables do not prove Deuring.
2. Compute the finite transform and orbit image, checking |W|=8,18,42 and |μ|=4,6,2.
3. For √−7, H(ḡ)=Σ_{t mod7}Legendre(t,7)exp(2πit/7)=2i[sin(2π/7)+sin(4π/7)−sin(6π/7)]. The primitive norm gives absolute value √7; sin(2π/7)>sin(π/7)=sin(6π/7) makes its imaginary part positive, fixing H(ḡ)=i√7 and Γ=7. At C=14 four residue lifts and the factor1/14 give twice this Gauss sum, hence Γ=28.
4. Evaluate the absolutely convergent direct q-orbit regulator series at canonical lifts. The summed real companion vanishes; retain C³ in the class regulator.
5. Independently check the Gaussian ideal L-series using the alternating bilateral-row evaluation: L(2,ψ)=Σ_{a≥1 odd}(−1)^((a−1)/2)[π/(4a²)csch(πa/2)+π²/(8a)csch(πa/2)coth(πa/2)]. This comes from χ(a+bi)=sin(πa/2)cos(πb/2)+i cos(πa/2)sin(πb/2), regrouping the absolutely convergent Gaussian lattice sum, and differentiating the paired cotangent partial fraction series. To make the row calculation explicit, unit symmetry gives L(2,ψ)=Σ_{a>0 odd}(−1)^((a−1)/2)a·Σ_{n∈ℤ}(−1)^n/(a²+4n²)². The paired cotangent expansion gives Σ_n(−1)^n/(a²+4n²)=π csch(πa/2)/(2a); differentiating this equality and multiplying by −1/(2a) yields the displayed row. Both quadratic-denominator series and their differentiated series converge locally uniformly for real a>0, by bounds on compact sets away from the poles, which justifies termwise differentiation.

**Acceptance.**

- The independent Gaussian row sum agrees with the regulator evaluation within10⁻⁴² at45-digit working precision; this is a diagnostic, not an error-certified proof.
- Exact local tests supplied by CM.4 for x³−x include a₅=−2,a₁₃=6, and the bad factor at2 is1.
- Twisting to y²=x³+x preserves the CM order and changes the conductor/finite character, so these data cannot be reused.

**Depends on.** this roadmap: `ER.5/unit-factor-cancellation-certificate`, `ER.5/cm-gauss-coefficient`, `ER.5/the-class-U`, `ER.4/direct-series-convergence`, `ER.5/primitive-gauss-normalization`; layers of other roadmaps: `ComplexMultiplicationAndExplicitReciprocity:CM.4`; libraries: `mathlib:cot_series_rep`.

**Lean.** module `TauCeti/NumberTheory/EllipticRegulator/CM`, namespace `TauCeti.EllipticRegulator`.

**Sources.**

- `Bloch.CRM11.public`, Theorem 11.2.1, p.92, specialized to the parent accepted examples: “(11.2.4)” — The source gives the general construction; the finite tables and numerical diagnostics are explicit specializations, independently recalculated here. The curve labels and character conventions are inherited from the accepted parent, not taken from OCR.

### The enlarged conductor index set at level fourteen

`ER.5/extra-prime-level-counterexample` · application · ER.5 part

For κ=ℚ(√−7),τ=(1+√−7)/2,f=√−7,C=14,g=−2√−7,χ(a+bτ)=Legendre(a+4b,7), Γ=28. W has168 residues and84 root-of-unity orbits; units modulo14 have42 residues and21 orbits. The corrected W-sum gives L(2,ψ)=1.13881438870384811745067015019065…, while direct numerical evaluation of the original unit-only sum gives twice that value to the recorded precision. The primes above2 divide g but not f, so the original index-set hypothesis fails.

**Hypotheses.**

- E/ℚ has CM by the maximal order O=ℤ+ℤτ of an imaginary quadratic field κ of class number one; the embedding has y=Im τ>0. CM.1/CM.4 supply this datum and ψ, not ER.5.
- The imported primitive finite character χ:(O/fO)×→μ restricts to the chosen embedding on μ=O×, satisfies χ(x̄)=χ̄(x), and (f̄)=(f). C≥1 is a rational integer, C=fg, f,g≠0 in O. Equality of conjugate conductor ideals does not mean f̄=f as elements.
- χ on O/CO means pullback from O/fO on residues invertible modulo f, and zero elsewhere. W is precisely that nonzero locus. R_C(x)=R_q(S_{x/C}) always uses classes built at the same level C.
- For rational descent and the pure-imaginary regulator conclusion, the chosen CM uniformization is required to intertwine complex conjugation with z↦z̄ on ℂ/O (equivalently the CM.2 real-structure transport is the natural one in these coordinates). This compatibility is an incoming datum; maximal-order CM and a shared j-invariant alone do not establish it for every ℚ-twist.

**Proof outline.**

1. Compute χ by reduction modulo7. Chinese remainder O/14O≅O/2O×O/7O gives four lifts of each conductor unit, hence168 residues. Since2 splits in κ, O/2O≅𝔽₂×𝔽₂ has only one unit, giving42 full-level units.
2. Use |μ|=2 for orbit counts. The primitive coefficient has |H(ḡ)|²=N(g)=28 and Γ=28.
3. Evaluate both specified finite sums with the imported direct q-orbit regulator formulas; the numerical ratio is2 within10⁻⁴² at45 digits. The exact cardinalities and failure of the prime-support condition already reject the unqualified index substitution. No exact proof of the numerical factor2 is claimed in this diagnostic application.

**Acceptance.**

- The target uses W at every permitted C; the smaller unit index is allowed only with the extra prime-support condition.
- At C=14, the W regulator is870.352604165136888924379523858885…i and the unit-only regulator is1740.70520833027377784875904771777…i.
- The two numerical L-values are L and2L, rejecting a plan that silently substitutes units modulo C.

**Depends on.** this roadmap: `ER.5/unit-factor-cancellation-certificate`, `ER.5/primitive-gauss-normalization`, `ER.5/cm-twisting-and-distribution`, `ER.5/the-class-U`.

**Lean.** module `TauCeti/NumberTheory/EllipticRegulator/CM`, namespace `TauCeti.EllipticRegulator`.

**Sources.**

- `Bloch.CRM11.public`, (11.2.1)–(11.2.3), pp.91–92; parent E9 counterexample: “(11.2.3)” — This is the accepted parent E9 counterexample, recalculated at45 digits; it is not an example asserted in the published book.

## ER.6 — Integral parts and the Beilinson statement

*17 nodes: 6 from the parent packet and 11 from the ER.6 part. Planets (6): Regulator on the integral part; Beilinson's conjecture for K₂ of an elliptic curve; Regulator determinant; Weak Beilinson statement; Elliptic functional equation comparison; Potentially good reduction integrality.*

The layer restricts the regulator to the integral part of K₂, states the elliptic Beilinson conjecture as a proposition, and separates what the constructed classes prove from what the conjecture asserts.

- **The integral part** K₂(E)_{ℤ,ℚ} is EllipticKTheory E.6's. The regulator on it takes values in the [F : ℚ]-dimensional target of ER.2.
- **The conjecture** has a leading-term form and a value-at-two form. Given the functional equation they are equivalent, with L*(E, 0) = w·N·(2π)^{−2d}·L(E, 2); the rational factors differ by wN2^{−2d}, so the two forms do not have "the same rational factor".
- **Three conclusions are kept apart:** a constructed class with nonzero regulator; a constructed d-dimensional subspace with the predicted determinant; and the full rank and isomorphism statement. The first two give surjectivity of the regulator, never injectivity.
- **Unramified is not integral.** Unramifiedness on the generic fibre is not integrality, because of the vertical residues at the bad fibres. For curves with potentially good reduction everywhere, such as the CM curves of ER.5, every unramified class is integral.
- **The ER.6 part** makes these statements exact:
  - a signed regulator determinant in rational Betti coordinates, with its change-of-basis laws;
  - the determinant-witness predicate, the weak Beilinson statement on a constructed subspace;
  - the criterion under which a witness plus real injectivity is the full statement;
  - a genus-one vertical non-example from Dokchitser–de Jeu–Zagier Theorem 8.3(2): y² + (x + 12)y + x³ = 0 with M = {y²/x³, (x − 4)/(−4)}, no nonzero multiple of which is integral;
  - the modularity-supplied leading coefficient for E/ℚ (EllipticCurveModularity R29.6);
  - the equivalence of the two witness normalisations;
  - a published proof of potentially-good integrality by finite-extension descent (Scholl, *Integral elements* I and II), replacing the parent's unsourced fibre-graph argument;
  - integral membership of Bloch's class U. Its regulator is nonzero only under the inherited ER.2 comparison with the universal regulator.

  Three API lemmas of the determinant are promoted to nodes because other nodes cite them.

The layer is planned, not closed. Four supplier interfaces are requested: the Betti ℚ-structure from ER.2, the local integral images and descent from E.6, the continued L-function and nonvanishing at two from R29.6, and the upstream local-reduction layer. The inherited ER.2 universal-regulator comparison remains a gap. The full rank statement is the conjecture, and nothing here proves it.

**Coverage.**

- **In the parent packet: partial.** The integral part is imported from E.6; the conjecture is stated with the correct target dimension [F:ℚ]; the equivalence of the two forms is a theorem with explicit factor w·N·(2π)^{−2d}; the three conclusions are reclassified; the vertical step is supplied for CM curves over ℚ. Revised by REV-EllipticRegulators.
  - Remaining: No published source for the integrality of all unramified classes under potentially good reduction (gap).
  - Remaining: The rank statement on the whole integral part is the conjecture; nothing proves it.
- **In the ER.6 part: planned.** Every ER.6 target is imported from the reviewed parent or refined here. The potentially-good source gap is replaced by a published local-descent proof with exact E.6 supplier requests. The full integral rank is explicitly conjectural. RT-AREA-ktheory-2/9 is handled by the R29.6 prerequisite and by conditional number-field/CM analytic routing. The real-target computation does not itself construct the Betti rational API; that separate ER.2 interface is now requested, and the E.6 request explicitly covers local regular models and good reduction.
  - Remaining: ER.2 must expose the Betti rational subspace, its canonical scalar-extension comparison with the Deligne target, its rational dimension and determinant line.
  - Remaining: E.6 must expose local model/good-reduction API, finite-extension reflection and local-global membership for its full rational K₂ image, with the weightwise-to-unweighted justification.
  - Remaining: R29.6 must expose the continued-function interface and Euler-product nonvanishing at two alongside its already planned FE transfer.
  - Remaining: The inherited ER.2 comparison with the universal regulator is needed for explicit Bloch determinant coordinates.
  - Remaining: The full rank/isomorphism statement remains Beilinson’s conjecture; it is not a requested proof or an unfinished theorem of this pass.

### Restricting the regulator to the integral part

`ER.6/the-regulator-on-the-integral-part` · construction · planet “Regulator on the integral part” · parent packet

Let F be a number field, E/F an elliptic curve and K_2(E)_{ℤ,ℚ} ⊆ K_2(E) ⊗ ℚ its rational integral part (EllipticKTheory E.6/the-integral-part, independent of the regular model by E.6/model-independence). The regulator on the integral part is the ℚ-linear map reg_ℤ : K_2(E)_{ℤ,ℚ} → H²_D(E_ℝ, ℝ(2)) obtained by restricting ER.2's regulator along K_2(E) ⊗ ℚ ↪ K_2(F(E)) ⊗ ℚ (E.3) and taking the part invariant under the combined conjugation. Its target is a real vector space of dimension [F:ℚ] = r₁ + 2r₂ (one for each real place, two for each complex place, where the regulator is complex-valued). Nothing is asserted about the source: that K_2(E)_{ℤ,ℚ} is finite-dimensional is an open conjecture (Bass; part of Beilinson's conjecture, ER.6/the-beilinson-statement), not a fact that can be imported, so reg_ℤ ⊗ ℝ is a map out of a space of unknown dimension.

**Hypotheses.**

- The integral part is E.6's, a ℚ-subspace defined as an image; E.6 asserts no finiteness and no lattice.
- The regulator is ER.2's, with the normalisation fixed there.
- The target dimension is [F:ℚ]; the ER.2 acceptance line 'real places plus complex places' undercounts when F has complex places.

**Construction.**

1. Compose E.6's inclusion K_2(E)_{ℤ,ℚ} ≤ K_2(E) ⊗ ℚ, E.3's injection into K_2(F(E)) ⊗ ℚ and ER.2's regulator at each embedding; take the invariant part (ER.2/the-deligne-cohomology-target).
2. Compute the dimension of the target: a real place contributes H¹(E_v(ℂ), ℝ(1))^{±}, of dimension 1; a complex place contributes H¹(E_v(ℂ), ℝ(1)), of dimension 2.
3. State the rank question — is reg_ℤ ⊗ ℝ an isomorphism? — which is the subject of ER.6/the-beilinson-statement, and record that its source side is open.
4. Record Brunault's modular version r_N : K_2(X_1(N))_ℤ ⊗ ℚ → T ⊗ ℝ(1) ((3.89)–(3.90), p. 93) as the same construction on X_1(N).

**API.**

- `regulatorOnIntegralPart` (data): reg_ℤ : K_2(E)_{ℤ,ℚ} →ₗ[ℚ] H²_D(E_ℝ, ℝ(2)).
- `regulatorOnIntegralPart_apply` (simp): reg_ℤ α is ER.2's regulator of α viewed in K_2(F(E)) ⊗ ℚ.
- `regulatorOnIntegralPart_realify` (data): The ℝ-linear extension K_2(E)_{ℤ,ℚ} ⊗ ℝ → H²_D(E_ℝ, ℝ(2)).
- `regulatorTarget_finrank` (relation): finrank ℝ H²_D(E_ℝ, ℝ(2)) = [F:ℚ].

**Unit tests.**

- `regulatorOnIntegralPart_compat` (compatibility): For α ∈ K_2(E)_{ℤ,ℚ}, regulatorOnIntegralPart α equals ER.2's regulator of the image of α in K_2(F(E)) ⊗ ℚ.
- `regulatorTarget_Qi` (computation): For E over F = ℚ(i) the target has real dimension 2.
- `regulatorOnIntegralPart_bloch` (computation): For E = 32a2, Bloch's class U of ER.5 lies in K_2(E)_{ℤ,ℚ} (ER.6/potentially-good-reduction-integrality) and reg_ℤ(U) ≠ 0.
- `regulatorOnIntegralPart_not_defined_off_integral` (non-example): An unramified class with a non-torsion vertical residue (DJZ Theorem 8.3(2); EllipticKTheory E.8/worked-example-bad-fibre) is not in the source of reg_ℤ, although ER.2's regulator is defined on it.
- `regulatorOnIntegralPart_constants` (degenerate): Classes coming from K_2(F) are torsion, and reg_ℤ vanishes on them.

**Acceptance.**

- reg_ℤ is the restriction of ER.2's regulator.
- dim_ℝ H²_D(E_ℝ, ℝ(2)) = [F:ℚ]; for F = ℚ(i) it is 2, not r₁ + r₂ = 1.
- No finite-dimensionality of the source is asserted or imported.

**Uses.**

- ER.6, the Beilinson statement: The conjecture is about reg_ℤ ⊗ ℝ.
- ER.6, the three conclusions: Conclusion (3) is that reg_ℤ ⊗ ℝ is an isomorphism.
- ER.8, the integrality worked example: It decides whether a class lies in the source of reg_ℤ.

**Depends on.** this roadmap: `ER.2/the-deligne-cohomology-target`, `ER.2/the-regulator-on-symbols`; other roadmaps: `EllipticKTheory:E.6/the-integral-part`, `EllipticKTheory:E.6/model-independence`, `EllipticKTheory:E.3/what-the-sequence-does-not-identify`.

**Needed by.** this roadmap: `ER.6/the-beilinson-statement`, `ER.6/regulator-determinant-in-betti-coordinates`, `ER.6/integral-nonzero-bloch-class`.

**Sources.**

- `Brunault.These.2005`, §3.4, (3.89)–(3.90), p. 93 of the arXiv PDF: “Définissons un sous-groupe K2 (X1 (N ))Z de K2 (X1 (N )) par K2 (X1 (N ))Z = Im(K2 (X1 (N )Z ) → K2 (X1 (N ))). (3.89) D'après [65, Remark p. 13], ce sous-groupe ne dépend pas du choix du modèle (propre et régulier)” — The integral part and the regulator restricted to it, in the source's modular setting.
- `Bloch.CRM11`, Lecture 8, §8.1, printed p. 61 (PDF p. 73): “Let E be an elliptic curve defined over C. Our objective in the next few lectures will be to write down a regulator map (8.1.1) R: K_2(E) → C.” — At a complex place the regulator is complex-valued: two real dimensions.

### Beilinson's conjecture for K₂ of an elliptic curve, as a proposition

`ER.6/the-beilinson-statement` · definition · planet “Beilinson's conjecture for K₂ of an elliptic curve” · parent packet

For E over a number field F with d = [F:ℚ], BeilinsonConjecture(E) is the proposition: (1) dim_ℚ K_2(E)_{ℤ,ℚ} = d and reg_ℤ ⊗ ℝ (ER.6/the-regulator-on-the-integral-part) is an isomorphism onto H²_D(E_ℝ, ℝ(2)); (2) (leading-term form) with respect to a ℚ-basis of K_2(E)_{ℤ,ℚ} and Deligne's ℚ-structure on H²_D(E_ℝ, ℝ(2)), det(reg_ℤ) ∈ ℚ^× · L*(E, 0), L*(E, 0) = lim_{s→0} s^{−d}L(E, s). The value-at-two form BeilinsonConjectureAtTwo(E) replaces L*(E, 0) by π^{−2d}·L(E, 2); it is a well-formed proposition without analytic continuation, since L(E, 2) is given by an absolutely convergent Euler product (DJZ Remark 3.12). Their equivalence needs the functional equation (ER.6/beilinson-forms-equivalent). Bloch's Conjecture 11.2.4 and his closing remark (p. 93) are stated for all of K_2(E) ⊗ ℚ, not the integral part; in that form the statement is false for general E (Bloch–Grayson; DJZ §3).

**Hypotheses.**

- F is a number field and d = [F:ℚ]; the expected order of vanishing of L(E, s) at s = 0 is d.
- The rational structure is the one given by K_2(E)_{ℤ,ℚ}; the whole K_2(E) ⊗ ℚ is too large in general.
- The normalisation of the regulator is ER.2's (the normalisation node), fixed independently of this conjecture.

**Construction.**

1. Define the two propositions with the determinant line and Deligne's ℚ-structure.
2. Record that nothing about them is proved here beyond ER.6/beilinson-forms-equivalent and the special cases of ER.5 and ER.7, classified in ER.6/three-conclusions-that-are-not-the-same.

**API.**

- `BeilinsonConjecture` (data): The proposition (1) ∧ (2) for E/F.
- `BeilinsonConjectureAtTwo` (data): The proposition (1) ∧ (2′) with π^{−2d}L(E, 2) in place of L*(E, 0).
- `BeilinsonConjecture.finrank` (projection): BeilinsonConjecture E → finrank ℚ K_2(E)_{ℤ,ℚ} = [F:ℚ].
- `BeilinsonConjecture.isIso` (projection): BeilinsonConjecture E → reg_ℤ ⊗ ℝ is bijective.

**Unit tests.**

- `beilinson_rank_over_Q` (characterisation): For E/ℚ, BeilinsonConjecture E implies finrank ℚ K_2(E)_{ℤ,ℚ} = 1.
- `beilinson_rank_over_Qi` (computation): For E over ℚ(i), clause (1) predicts finrank 2 = [ℚ(i):ℚ].
- `beilinson_whole_K2_false` (non-example): Replacing K_2(E)_{ℤ,ℚ} by K_2(E) ⊗ ℚ gives a false statement for some E/ℚ (Bloch–Grayson, DJZ §3).
- `beilinson_at_two_needs_no_continuation` (degenerate): BeilinsonConjectureAtTwo E is stated using only W.LSeries 2, a convergent series.

**Acceptance.**

- For F = ℚ clause (1) says dim_ℚ K_2(E)_{ℤ,ℚ} = 1; for F = ℚ(i) it says 2.
- The value-at-two form does not require analytic continuation.
- Nothing about the conjecture itself is proved here.

**Uses.**

- ER.6, the three conclusions: Conclusion (3) is clause (1).
- SpecialValuesBirchTate KU-conjectures: The elliptic statement recorded there.

**Depends on.** this roadmap: `ER.6/the-regulator-on-the-integral-part`, `ER.2/the-normalisation-factor`; layers of other roadmaps: `EllipticCurveModularity:R29.6`; libraries: `mathlib:WeierstrassCurve.LSeries`.

**Needed by.** this roadmap: `ER.6/three-conclusions-that-are-not-the-same`, `ER.6/beilinson-forms-equivalent`, `ER.6/full-integral-basis-criterion`, `ER.7/modular-elliptic-regulator-line`.

**Sources.**

- `DJZ.2006`, §3, Conjecture 3.11 and Remark 3.12, p. 6 (arXiv v2): “Remark 3.12. The definition of L∗(C, 0) requires the analytic continuation of L(C, s), but since the analytic continuation and the expected functional equation of L(C, s) would imply that L∗(C, 0) is rationally proportional to π^{−2g} L(C, 2)” — The two formulations and the role of the functional equation, verbatim.
- `DJZ.2006`, §3, p. 5 (arXiv v2): “Unfortunately, this conjecture was wrong, as K2T(C)/torsion can have rank bigger than g already for g = 1, as was discovered by Bloch and Grayson in [3]. They found that one should consider a certain subgroup of K2T(C)/torsion defined by an additional condition,” — Why the integral part, not K_2(E), is the subject.
- `Bloch.CRM11`, Lecture 11, end of §11.2, printed p. 93 (PDF p. 105): “More generally, for any elliptic curve over a number field one could conjecture that rk K_2(E) = order of zero of L(E, s) at s = 0, assuming of course the existence of a functional equation relating L(E, s) and L(E, 2 − s).” — The source's own (too strong) form, which the integral part corrects.

**Assembly note.** Deligne's ℚ-structure in (2) is the Betti structure B = H¹(E(ℂ), ℚ(1))⁻. The ER.6 part requests it from ER.2 (see `ER.2/the-deligne-cohomology-target`). The ER.6 part also restates both forms as determinant witnesses (`ER.6/constructed-determinant-witness`, `ER.6/full-integral-basis-criterion`).

### Three conclusions that must not be conflated

`ER.6/three-conclusions-that-are-not-the-same` · comparison · parent packet

Three logically different conclusions about reg_ℤ (ER.6/the-regulator-on-the-integral-part), with d = [F:ℚ]: (1) a constructed class has non-zero regulator; (2) a constructed ℚ-subspace V ⊆ K_2(E)_{ℤ,ℚ} of dimension d has regulator image of full rank, with the determinant relation to L*(E, 0) predicted by ER.6/the-beilinson-statement; (3) the conjecture: dim K_2(E)_{ℤ,ℚ} = d and reg_ℤ ⊗ ℝ is an isomorphism. (1) does not imply (2) when d > 1. (2) implies the SURJECTIVITY half of (3) but not its injectivity half, since it says nothing about classes outside V; so (1) and (2) do not imply (3) without a separate dimension (upper bound) or injectivity theorem. For E/ℚ (d = 1) a non-zero integral class with an explicit L-value formula is already a statement of kind (2): Bloch's theorem (ER.5), once U is known to be integral (ER.6/potentially-good-reduction-integrality) and its scalar is expressed in ER.2's normalisation, is of kind (2), not only (1) — e.g. for 32a2, L′(E, 0) = 32·L(E, 2)/(4π²) = (4/π)·[D_q(e^{πi/2}) + D_q(e^{2πi(3+2i)/4})]. Brunault's Théorème 5 (V_p is spanned by r_p(K_p), with K_p ⊆ K_2(X_1(p))_ℤ ⊗ ℚ by Schappacher–Scholl) is the surjectivity half of (3) for X_1(p) and contains no L-value: it is neither (1) nor (2).

**Hypotheses.**

- The three statements concern the same regulator reg_ℤ and the same target.
- The failure of the implications is not a gap in a proof: the constructed subspace may be smaller than the integral part.
- A dimension upper bound, or an injectivity theorem, is what would close the gap; none is available in this roadmap or its suppliers.

**Proof outline.**

1. State the three conclusions precisely.
2. Show (2) ⇒ surjectivity of reg_ℤ ⊗ ℝ, and that neither (1) nor (2) gives injectivity.
3. Classify: ER.5 is of kinds (1) and (2) for E/ℚ with CM (d = 1); ER.7 is of kind (2) for modular curves; Brunault's Théorème 5 is the surjectivity half of (3) for X_1(p); the injectivity half of (3) is proved nowhere.
4. State the rule: an atlas claim that the conjecture holds for a curve must cite an injectivity or dimension theorem; none of the constructions here provides one.

**Acceptance.**

- (1) ⇏ (2) for d > 1; (2) ⇒ surjectivity; (1) ∧ (2) ⇏ (3).
- For 32a2: L′(E, 0) = 0.7433332466435517344801648… = 32·L(E, 2)/(4π²) (PARI, root number +1) = (4/π)·[D_q(e^{πi/2}) + D_q(e^{2πi(3+2i)/4})].
- Brunault's Théorème 5 is classified as the surjectivity half of (3), not as kind (2).
- A claim of kind (3) must cite a dimension or injectivity theorem.

**Depends on.** this roadmap: `ER.6/the-beilinson-statement`, `ER.6/beilinson-forms-equivalent`, `ER.5/the-L-value-theorem`, `ER.5/nonvanishing-and-what-is-not-claimed`, `ER.6/potentially-good-reduction-integrality`.

**Needed by.** this roadmap: `ER.6/the-vertical-step-that-is-required`, `ER.6/constructed-determinant-witness`, `ER.6/strictness-and-a-vertical-non-example`.

**Sources.**

- `Brunault.These.2005`, Théorème 5, p. 11 of the arXiv PDF: “Théorème 5. Pour tout nombre premier p, l'espace vectoriel réel V_p est engendré par r_p(K_p).” — A spanning statement: with K_p inside the integral part (next excerpt), it is the surjectivity half of the conjecture for X_1(p), with no L-value.
- `Brunault.These.2005`, §3.4, Remarques 84.2, p. 93 of the arXiv PDF: “2. Schappacher et Scholl ont démontré [62, 1.1.2 (iii)] que KN ⊂ K2 (X1 (N ))Z ⊗ Q.” — The constructed subspace lies in the integral part.

**Assembly note.** The ER.6 part makes the logic exact. A determinant witness gives surjectivity of the real regulator (`ER.6/determinant-witness-surjective`), but not injectivity. Together with injectivity of the real scalar extension it is equivalent to the full statement (`ER.6/full-integral-basis-criterion`). Rational injectivity alone is weaker: (a, b) ↦ a + √2·b is injective on ℚ² but not after extending scalars to ℝ.

### Unramifiedness on the generic fibre is not integrality

`ER.6/the-vertical-step-that-is-required` · comparison · parent packet

A class whose tame residues on the curve vanish is unramified on the generic fibre. That is NOT the same as lying in the integral part of EllipticKTheory E.6, which is an image out of the K-theory of a regular proper model; the difference is the vertical conditions: the tame symbols at the components of the bad fibres (E.6/vertical-residues). So a construction that produces unramified classes has not thereby produced integral ones, and a claim matching an integral formulation must include the vertical step. For the classes of ER.5 on a CM curve over ℚ the vertical step is available: such a curve has potentially good reduction everywhere, and ER.6/potentially-good-reduction-integrality gives K_2(E) ⊗ ℚ = K_2(E)_{ℤ,ℚ}, so Bloch's U is integral. In general the vertical step is a genuine condition (DJZ Theorem 8.3(2) gives unramified classes with no non-zero integral multiple; EllipticKTheory E.8/worked-example-bad-fibre treats a split multiplicative fibre), and where it is not proved the honest statement is the rational one.

**Hypotheses.**

- The model is a regular proper model as in E.6; the vertical conditions are its vertical residues.
- The classes in question are those of ER.4 and ER.5, unramified by construction.
- Integrality of ER.5's U is supplied by ER.6/potentially-good-reduction-integrality; for other curves the weaker rational statement is what may be quoted unless the vertical residues are computed.

**Proof outline.**

1. State the difference between unramifiedness and integrality, with the vertical residues named.
2. State what a proof of integrality requires: the vertical residues are torsion at every component of every bad fibre.
3. Apply ER.6/potentially-good-reduction-integrality to the CM curves of ER.5.
4. Record the non-example of an unramified non-integral class (DJZ Theorem 8.3(2); E.8/worked-example-bad-fibre).
5. Record the rule: a statement matching an integral formulation cites the vertical step.

**Acceptance.**

- Unramified does not imply integral in general.
- For E/ℚ with CM, Bloch's U lies in K_2(E)_{ℤ,ℚ}.
- Where the vertical step is not proved, only the rational statement is quoted.

**Depends on.** this roadmap: `ER.6/three-conclusions-that-are-not-the-same`, `ER.6/potentially-good-reduction-integrality`, `ER.5/the-class-U`; other roadmaps: `EllipticKTheory:E.6/vertical-residues`.

**Needed by.** this roadmap: `ER.8/the-integrality-worked-example`, `ER.6/strictness-and-a-vertical-non-example`.

**Sources.**

- `DJZ.2006`, §8, p. 22 (arXiv v2): “This means that apart from being trivial for “horizontal” curves (which come from points P ∈ C(Q)), the tame symbol of α must be trivial for all irreducible components of the fibers Cp of C → Spec Z.” — The vertical conditions, verbatim.
- `Brunault.These.2005`, §1.1, Remarques after Proposition 17, pp. 19–20 of the arXiv PDF: “La localisation en K-théorie algébrique induit une inclusion K2^{(2)}(X_Q) ↪ K2(Q(X)) ⊗ Q” — The inclusion whose image is the unramified part.

**Assembly note.** An explicit genus-one obstruction is `ER.6/strictness-and-a-vertical-non-example`. On y² + (x + 12)y + x³ = 0 the class {y²/x³, (x − 4)/(−4)} is horizontally unramified, yet no nonzero multiple is integral (Dokchitser–de Jeu–Zagier, Theorem 8.3(2)). The curve fails potentially good reduction at 2 (v₂(j) = −6), so this does not contradict the descent theorem.

### Potentially good reduction everywhere makes every unramified class integral

`ER.6/potentially-good-reduction-integrality` · lemma · parent packet · added by REV-EllipticRegulators

Let F be a number field and E/F an elliptic curve with potentially good reduction at every finite prime (for example E/ℚ with complex multiplication, whose j-invariant is integral). Then K_2(E)_{ℤ,ℚ} = K_2(E) ⊗ ℚ. In particular the class U of ER.5 lies in the integral part.

**Hypotheses.**

- E has potentially good reduction at every finite prime of F.
- The integral part is E.6's, with its vertical-residue description and model independence.

**Proof outline.**

1. By E.6/vertical-residues it suffices to show that ∂_D(α) is torsion in k(D)^× for every α ∈ K_2(E) ⊗ ℚ and every vertical component D of one regular proper model 𝓔 (one model suffices by E.6/model-independence).
2. Good primes impose no condition (E.6/good-reduction-primes-impose-no-condition).
3. At a bad prime v the reduction is additive of potentially good type, so the special fibre of the minimal regular model has Kodaira type II, III, IV, I₀*, IV*, III* or II*: its components are smooth curves of genus 0 over finite fields (hence projective lines over their constant fields) and its dual graph, with a triple point of type IV or a tangency of type III counted as a single vertex of intersection, is a tree; blowing up closed points preserves both properties.
4. Reciprocity on the regular surface: at each closed point x of 𝓔_v the orders at x of the residues ∂_D(α) of the components D through x sum to zero, since the horizontal residues of α vanish (α is unramified). So the divisors of the ∂_D(α) are supported on intersection points and form a flow of divergence zero on the dual graph, weighted by the degrees of the points; on a tree such a flow vanishes (induction from the leaves).
5. Hence every ∂_D(α) has neither zeros nor poles, so it is a constant of the finite constant field of D, hence torsion; conclude.

**Acceptance.**

- For E/ℚ with CM, K_2(E) ⊗ ℚ = K_2(E)_{ℤ,ℚ}; in particular Bloch's U is integral.
- The tree hypothesis is used: at a fibre whose dual graph has a cycle (multiplicative reduction) the argument fails and integrality is a genuine condition (EllipticKTheory E.8/worked-example-bad-fibre).

**Depends on.** other roadmaps: `EllipticKTheory:E.6/vertical-residues`, `EllipticKTheory:E.6/good-reduction-primes-impose-no-condition`, `EllipticKTheory:E.6/model-independence`; layers of other roadmaps: `SchemeKTheoryOperations:S.3`.

**Needed by.** this roadmap: `ER.6/three-conclusions-that-are-not-the-same`, `ER.6/the-vertical-step-that-is-required`.

**Sources.**

- `DJZ.2006`, §8, p. 22 (arXiv v2): “(One can show though that, to a given α, one can always add an element in K2 (Q) such that the sum satisfies this condition for each prime p for which the fiber Cp is smooth over Fp .)” — The good-reduction case of the vertical condition; the tree argument for potentially good fibres is the reviewer's and still needs a published source (gap).

**Assembly note.** Refined by `ER.6/potentially-good-integrality-by-local-descent` (ER.6 part), which gives the published proof: see the next note.

**Assembly note.** The node's proof is the parent reviewer's argument on the trees of fibre components, for which the parent's fifth gap found no published source. The ER.6 part replaces it by `ER.6/potentially-good-integrality-by-local-descent`, from Scholl, *Integral elements in K-theory and products of modular curves*, I §1 and II §2. At each finite place one passes to a finite extension with good reduction, uses good-reduction integrality there, reflects membership back, and applies local–global membership.

That proof needs the local integral images and the descent API requested from EllipticKTheory E.6, including the passage from Adams-weight statements to the full rational K₂ through SchemeKTheoryOperations S.6. The statement of this node is unchanged.

### The leading-term and value-at-two forms are equivalent, given the functional equation

`ER.6/beilinson-forms-equivalent` · theorem · parent packet · added by REV-EllipticRegulators

Let E be an elliptic curve over a number field F, d = [F:ℚ], N = |d_F|²·N_{F/ℚ}(𝔣_E), and assume L(E, s) continues analytically with Λ(s) = w·Λ(2 − s), Λ(s) = N^{s/2}(2π)^{−ds}Γ(s)^d L(E, s), w = ±1 (a theorem for E/ℚ: EllipticCurveModularity R29.6). Then L(E, s) vanishes to order exactly d at s = 0 and L*(E, 0) = w·N·(2π)^{−2d}·L(E, 2). Hence BeilinsonConjecture(E) ⇔ BeilinsonConjectureAtTwo(E) (ER.6/the-beilinson-statement), the rational factor changing by w·N·2^{−2d}: the two forms do not have 'the same rational factor'.

**Hypotheses.**

- The functional equation is an input: proved for E/ℚ by modularity, not available for general F.
- L(E, 2) ≠ 0 by absolute convergence of the Euler product (as in ER.5/nonvanishing-and-what-is-not-claimed).

**Proof outline.**

1. Near s = 0, Γ(s)^d = s^{−d}(1 + O(s)), so Λ(0) = lim_{s→0} s^{−d}L(E, s) = L*(E, 0).
2. Λ(2) = N(2π)^{−2d}Γ(2)^d L(E, 2) = N(2π)^{−2d}L(E, 2) ≠ 0.
3. The functional equation gives L*(E, 0) = wΛ(2) ≠ 0, hence the order of vanishing is exactly d and the formula.
4. Absorb w·N·2^{−2d} into ℚ^× and π^{2d} into the value-at-two normalisation.

**Acceptance.**

- L*(E, 0) = w·N·(2π)^{−2d}·L(E, 2).
- For 32a2: L′(E, 0) = 0.7433332466435517344801648… = 32·L(E, 2)/(4π²), root number +1 (reviewer, PARI lfun).
- For d=[F:Q], Λ(s)=N^(s/2)(2π)^(-ds)Γ(s)^d L(E,s) and Λ(s)=wΛ(2−s) give L*(E,0)=wN(2π)^(-2d)L(E,2). R29.6 supplies the equation for E/Q; over a general number field it remains an explicit hypothesis (CM cases use the Hecke comparison).

**Depends on.** this roadmap: `ER.6/the-beilinson-statement`; layers of other roadmaps: `EllipticCurveModularity:R29.6`; libraries: `mathlib:WeierstrassCurve.LSeries`.

**Needed by.** this roadmap: `ER.6/three-conclusions-that-are-not-the-same`, `ER.6/modularity-supplied-leading-term-limit`, `ER.6/determinant-witnesses-in-the-two-normalisations`.

**Sources.**

- `DJZ.2006`, §3, Remark 3.12, p. 6 (arXiv v2): “since the analytic continuation and the expected functional equation of L(C, s) would imply that L∗(C, 0) is rationally proportional to π^{−2g} L(C, 2), Beilinson's conjecture could be formulated without any assumptions about the analytic continuation of L(C, s).” — The equivalence through the functional equation, verbatim; the rational factor is computed here.

**Assembly note.** For E/ℚ the ER.6 part derives the leading coefficient from R29.6's continued L-function (`ER.6/modularity-supplied-leading-term-limit`). It transports witnesses with q₂ = q₀·w·N·2^{−2d} (`ER.6/determinant-witnesses-in-the-two-normalisations`); for 32a2 (d = 1, N = 32, w = 1) the factor is 8.

Over a general number field, continuation and the functional equation stay hypotheses. The ER.5 Hecke route covers only the maximal-order, class-number-one CM curves over ℚ (RT-AREA-ktheory-2/9).

### Regulator determinant in rational Betti coordinates

`ER.6/regulator-determinant-in-betti-coordinates` · construction · planet “Regulator determinant” · ER.6 part

For a Q-basis b=(b_i) of B and a d-tuple x=(x_j) in I, define Δ_b(r;x)=det((b_R.repr(r(x_j)))_i), with regulator images as columns. It represents the determinant-line image of x relative to the fixed Betti Q-line. The value is signed. Replacing either rational basis rescales it by Q×; replacing b by an arbitrary real basis is not a permitted rational normalisation.

**Hypotheses.**

- Fix F a number field, E/F elliptic, d=[F:Q]>0, I=K₂(E)_{Z,Q} from E.6 and the restricted universal regulator r:I→D from the parent ER.6 construction. Let B=H¹(E(C),Q(1))^− for the geometric conjugation action c*, with Q(1)=2πiQ. Its inclusion in H¹(E(C),R(1))^−, followed by the ER.2 comparison, gives the Betti rational structure of D. The scalar-extension isomorphism R⊗Q B≃D and dim_Q B=d are requested explicitly from ER.2; its existing target node computes the real target but does not expose this rational API. These are imported objects, not newly defined groups. No finite-dimensionality of I is assumed.
- The linear algebra API also makes sense for d=0, with the empty determinant 1. Arithmetic uses have d>0.

**Construction.**

1. Use the imported tensor-basis extension to choose real coordinates of the Deligne target.
2. Apply Mathlib’s signed Matrix.det, not a new determinant construction.
3. For a frame change xA, linearity gives M(xA)=M(x)A_R; det_mul gives the factor det(A). For b′=bC, M_b=C_R M_b′; the rational transition C is invertible.

**API.**

- `TauCeti.EllipticRegulators.ER6.regulatorDet_eq_matrix` (compatibility): Δ_b(r;x) is exactly Mathlib Matrix.det of the columns of coordinates in b.baseChange R.
- `TauCeti.EllipticRegulators.ER6.regulatorDet_changeFrame` (functoriality): For every d-by-d matrix A over Q, Δ_b(r;xA)=Δ_b(r;x)·det(A), with det(A) cast to R; A need not be invertible.
- `TauCeti.EllipticRegulators.ER6.regulatorDet_changeBetti` (compatibility): If C_ij=b.repr(b′_j)_i then Δ_b(r;x)=det(C)·Δ_b′(r;x).
- `TauCeti.EllipticRegulators.ER6.regulatorDet_zero` (simp): For d>0, the determinant of the zero regulator on the zero frame is 0.
- `TauCeti.EllipticRegulators.ER6.regulatorDet_pullback` (functoriality): For a Q-linear f:J→I, Δ_b(r∘f;x)=Δ_b(r;f∘x).

**Unit tests.**

- `regulatorDet_identity` (compatibility): With I=B, r(y)=1⊗y and x=b, Δ_b(r;x)=1.
- `regulatorDet_empty` (degenerate): For d=0, Δ_b(r;x)=1, including the zero map on the zero-dimensional target.
- `regulatorDet_swap_two` (computation): With d=2, I=B, r(y)=1⊗y and x_j=b_(1-j), Δ=-1.
- `regulatorDet_double_one` (computation): With d=1, I=B, r(y)=1⊗y and x_j=2b_j, Δ=2.

**Acceptance.**

- The identity regulator with frame b has determinant 1.
- Swapping the two vectors for d=2 gives -1; multiplying the sole vector for d=1 by 2 gives 2.
- A change of Betti rational basis preserves only the Q× class of the determinant, not its numerical value.

**Uses.**

- DJZ Conjecture 3.11(2) and Remark 3.14: Compute the determinant in a fixed rational target structure rather than rescaling periods to fit an L-value.
- EllipticRegulators:ER.6/constructed-determinant-witness: Certify the exact rational L-value factor of constructed integral classes.
- EllipticRegulators:ER.7/the-explicit-theorem-for-an-elliptic-curve: After its regulator normalisation comparison, translate a computed value into Betti determinant coordinates.

**Depends on.** this roadmap: `ER.6/the-regulator-on-the-integral-part`, `ER.2/the-deligne-cohomology-target`; this roadmap's layers: `ER.2`; libraries: `mathlib:Module.Basis`, `mathlib:Module.Basis.baseChange`, `mathlib:Module.Basis.baseChange_apply`, `mathlib:Module.Basis.baseChange_repr_tmul`, `mathlib:Matrix.det`, `mathlib:Matrix.det_mul`, `mathlib:Matrix.det_fin_zero`, `mathlib:Matrix.det_fin_one`, `mathlib:Matrix.det_fin_two`.

**Needed by.** this roadmap: `ER.6/constructed-determinant-witness`, `ER.6/full-integral-basis-criterion`, `ER.6/regulator-det-change-betti`.

**Lean.** module `TauCeti/NumberTheory/EllipticRegulators/Integral`, namespace `TauCeti.EllipticRegulators.ER6`; declaration `TauCeti.EllipticRegulators.ER6.regulatorDet`.

**Sources.**

- `DJZ.2006`, Conjecture 3.11(2), p. 6; Remark 3.14, p. 7: “the determinant” — Specialise the source’s regulator pairing matrix to genus one over all embeddings. Signed coordinates are a derived implementation choice; Q× absorbs the sign and any rational lattice index.
- `SchappacherScholl.1988`, §1.1.0 and Theorem 1.1.2(ii), PDF pp. 2–3: “a Q-structure” — Fix the rational structure before comparing the determinant to the L-value.

### The determinant statement on constructed integral classes

`ER.6/constructed-determinant-witness` · definition · planet “Weak Beilinson statement” · ER.6 part

HasDeterminantWitness(b,r,ℓ) means ℓ≠0 and there exist a d-tuple x in I and q∈Q× with Δ_b(r;x)=qℓ. Its nonzero determinant makes the regulator images an R-basis of D and x a Q-basis of its own span V⊂I. This is the weak Beilinson statement on a constructed subspace V, not a rank assertion on I. The two choices of ℓ are the leading coefficient L*(E,0) and π^(−2d)L(E,2); equality of their certificates is proved below.

**Hypotheses.**

- Fix F a number field, E/F elliptic, d=[F:Q]>0, I=K₂(E)_{Z,Q} from E.6 and the restricted universal regulator r:I→D from the parent ER.6 construction. Let B be the Betti rational structure of D, of dimension d, with the prescribed Tate twist and combined conjugation, supplied by the explicit ER.2 request on regulator-determinant-in-betti-coordinates; identify D=R⊗Q B. These are imported objects, not newly defined groups. No finite-dimensionality of I is assumed.
- For source applications ℓ is a specified period-normalised real L-value. Numerical agreement does not supply the exact rational q.

**Construction.**

1. Record an actual tuple of integral classes, its nonzero rational coefficient and determinant equality.
2. A nonzero determinant proves real linear independence of the images, hence rational linear independence of the tuple.
3. Rational target basis changes and rescaling ℓ by Q× leave the existential predicate unchanged; surjections on domains lift finite tuples.
4. The scalar-extended regulator maps 1⊗x_j onto a real basis, hence is surjective. Nothing here establishes real injectivity.

**API.**

- `TauCeti.EllipticRegulators.ER6.HasDeterminantWitness.mk` (constructor): If ℓ≠0, q≠0 and Δ_b(r;x)=qℓ, construct the witness.
- `TauCeti.EllipticRegulators.ER6.HasDeterminantWitness.det_ne_zero` (projection): A witness supplies a d-tuple x with Δ_b(r;x)≠0.
- `TauCeti.EllipticRegulators.ER6.HasDeterminantWitness.rescaleValue` (equivalence): For a∈Q×, a witness for aℓ exists iff a witness for ℓ exists.
- `TauCeti.EllipticRegulators.ER6.HasDeterminantWitness.changeBetti` (equivalence): Any two Q-bases b,b′ of B give equivalent witness predicates.
- `TauCeti.EllipticRegulators.ER6.HasDeterminantWitness.liftAlongSurjection` (functoriality): For a surjective Q-linear f:J→I, witnesses for r∘f and r are equivalent.
- `TauCeti.EllipticRegulators.ER6.HasDeterminantWitness.surjective` (characterisation): If r_R:R⊗Q I→D is the scalar extension (r_R(a⊗x)=a r(x)), a determinant witness implies r_R is surjective.

**Unit tests.**

- `determinantWitness_identity` (compatibility): The inclusion B→R⊗Q B, y↦1⊗y, has a witness with ℓ=1.
- `determinantWitness_zeroValue` (degenerate): No regulator has a witness with ℓ=0.
- `determinantWitness_zeroRegulator` (non-example): For d>0, the zero regulator has no witness for any ℓ.
- `determinantWitness_extraKernel` (non-example): For a one-dimensional B, r:B⊕B→R⊗Q B sends (u,v)↦1⊗u; it has a witness for ℓ=1 although the first projection is not injective.

**Acceptance.**

- A zero ℓ is never certified, and for d>0 a zero regulator cannot be certified.
- The projection B⊕B→B in dimension one has a determinant witness with ℓ=1 despite a nontrivial kernel.
- A zero rational coefficient cannot certify an arbitrary regulator.

**Uses.**

- Schappacher–Scholl Theorem 1.1.2: Express what an integral modular construction with an exact determinant relation proves.
- EllipticRegulators:ER.6/full-integral-basis-criterion: Separate the determinant evidence from the extra real-injectivity assertion in the full conjecture.
- EllipticRegulators:ER.6/determinant-witnesses-in-the-two-normalisations: Transfer an exact certificate between the leading coefficient and at-two normalisations.

**Depends on.** this roadmap: `ER.6/regulator-determinant-in-betti-coordinates`, `ER.6/three-conclusions-that-are-not-the-same`, `ER.6/regulator-det-change-betti`; libraries: `mathlib:TensorProduct.AlgebraTensorModule.lift`, `mathlib:TensorProduct.AlgebraTensorModule.lift_tmul`, `mathlib:Matrix.isUnit_iff_isUnit_det`.

**Needed by.** this roadmap: `ER.6/full-integral-basis-criterion`, `ER.6/strictness-and-a-vertical-non-example`, `ER.6/determinant-witnesses-in-the-two-normalisations`, `ER.6/determinant-witness-surjective`, `ER.6/determinant-witness-rescale-value`.

**Lean.** module `TauCeti/NumberTheory/EllipticRegulators/Integral`, namespace `TauCeti.EllipticRegulators.ER6`; declaration `TauCeti.EllipticRegulators.ER6.HasDeterminantWitness`.

**Sources.**

- `DJZ.2006`, Remark 3.13, pp. 6–7: “finding enough elements” — The finite tuple is a constructed subspace, with no claim it generates the integral group.
- `SchappacherScholl.1988`, §1.1.0, PDF p. 3: “a subspace” — The source gives integral classes with the desired regulator; the witness isolates that conclusion.

### Basis criterion for the full integral Beilinson statement

`ER.6/full-integral-basis-criterion` · theorem · ER.6 part

Let r_R:R⊗Q I→D be the scalar-extended regulator. A determinant witness for ℓ together with injectivity of r_R is equivalent to: ℓ≠0 and there exist a Q-basis a indexed by Fin d of the entire I and q∈Q× with Δ_b(r;a)=qℓ. Consequently either side gives dim_Q I=d and r_R an isomorphism. Applied to the parent BeilinsonConjecture, this is a reformulation of its rank/isomorphism/determinant conjunction, never a proof that the conjunction holds for an elliptic curve.

**Hypotheses.**

- Fix F a number field, E/F elliptic, d=[F:Q]>0, I=K₂(E)_{Z,Q} from E.6 and the restricted universal regulator r:I→D from the parent ER.6 construction. Let B be the Betti rational structure of D, of dimension d, with the prescribed Tate twist and combined conjugation, supplied by the explicit ER.2 request on regulator-determinant-in-betti-coordinates; identify D=R⊗Q B. These are imported objects, not newly defined groups. No finite-dimensionality of I is assumed.
- The scalar extension is R-linear and evaluates a⊗x to a r(x). Injectivity is on this real-linear map, not merely on r viewed as a Q-linear map.

**Proof outline.**

1. A witness gives surjectivity of r_R by its API; the extra injectivity makes r_R a linear equivalence.
2. Use cardinal rank preservation under base change, not a bare numerical finrank equality, to deduce that I has a Fin d basis even though no finiteness was assumed.
3. A witness frame is Q-independent. In a d-dimensional I it is a basis, retaining the determinant equality.
4. Conversely, a basis with nonzero determinant gives an invertible regulator matrix relative to its real scalar extension, so r_R is injective and the witness is immediate.

**Acceptance.**

- The projection Q²→Q passes the constructed-subspace certificate and fails the full criterion.
- For d=1, a nonzero regulator on a constructed class yields a one-dimensional subspace; it does not prove that I has dimension one.
- Using Q-injectivity instead of real injectivity is invalid: (a,b)↦a+√2 b from Q² to R is Q-injective but its real extension has a one-dimensional kernel.
- The rational finrank value alone is never used to establish finite-dimensionality.

**Depends on.** this roadmap: `ER.6/constructed-determinant-witness`, `ER.6/regulator-determinant-in-betti-coordinates`, `ER.6/the-beilinson-statement`, `ER.6/determinant-witness-surjective`; libraries: `mathlib:Module.rank_baseChange`, `mathlib:Module.Basis.baseChange`, `mathlib:Matrix.isUnit_iff_isUnit_det`.

**Needed by.** this roadmap: `ER.6/strictness-and-a-vertical-non-example`, `ER.6/determinant-witnesses-in-the-two-normalisations`.

**Lean.** declaration `TauCeti.EllipticRegulators.ER6.fullBasisCriterion`.

**Sources.**

- `DJZ.2006`, Conjecture 3.11(1–2), p. 6; rational-rank qualification in footnote 3, p. 5: “non-degenerate” — The full conjecture has both rank and nondegeneracy. This equivalence is a derived linear-algebra formulation; it does not assert finite generation of an integral lattice.

### Strict implications and an elliptic vertical obstruction

`ER.6/strictness-and-a-vertical-non-example` · comparison · ER.6 part

There are independent arithmetic and regulator checks. Horizontal unramifiedness identifies a class in K₂(E)⊗Q, not necessarily in I. Nonzero regulator implies a nonzero class. A d-dimensional determinant witness implies real surjectivity on I. Neither implies real injectivity or the full Beilinson statement. For the smooth genus-one curve y²+(x+12)y+x³=0 with its point at infinity, the DJZ class M={y²/x³,(x−4)/(−4)} is horizontally unramified but no nonzero multiple is integral, by Theorem 8.3(2).

**Hypotheses.**

- All horizontal closed points, not only F-rational points, enter the tame kernel; use E.3’s rational injectivity.
- In the DJZ example g=1, d_source=3, f=x+12, m=x−4, m(0)=−4 and p=2 does not divide b₁=1. The source’s d is unrelated to the degree [F:Q] denoted d elsewhere here.

**Proof outline.**

1. Import the parent three-conclusions comparison; use the explicit Q² projection and Q-injective irrational-slope map to test the missing real-injectivity condition.
2. Factor −4t(x)=4x³−x²−24x−144=(x−4)(4x²+15x+36). The quadratic has discriminant −351 and value 160 at x=4, so the cubic has distinct roots.
3. Apply DJZ Theorem 8.3(2) to this irreducible linear factor: the horizontal class has a nontorsion vertical residue at p=2. Thus no rational denominator clears it into I.
4. The change u=−x gives the Mathlib equation with coefficients (−1,0,12,0,0), c₄=289, Δ=−561600. In particular j is not 2-integral, consistent with failure of potentially good reduction.

**Acceptance.**

- The factorisation and nonsingularity checks are exact arithmetic, not numerical regulator evidence.
- For the equation W above, c₄=289 and Δ=−561600; v₂(j)=−6.
- No claimed “all horizontal classes are integral” theorem may apply without its potentially-good hypotheses.

**Depends on.** this roadmap: `ER.6/three-conclusions-that-are-not-the-same`, `ER.6/the-vertical-step-that-is-required`, `ER.6/constructed-determinant-witness`, `ER.6/full-integral-basis-criterion`; other roadmaps: `EllipticKTheory:E.3/what-the-sequence-does-not-identify`, `EllipticKTheory:E.6/vertical-residues`; libraries: `mathlib:WeierstrassCurve.c₄`, `mathlib:WeierstrassCurve.Δ`.

**Sources.**

- `DJZ.2006`, Theorem 8.3(2) and its proof, p. 23: “no non-zero multiple” — The displayed elliptic example is a direct substitution into the theorem, not an example transcribed from its tables.
- `SchappacherScholl.1988`, §1.1.3(iii), PDF p. 3: “evidence for this conjecture” — The integral constructed subspace does not by itself establish the regulator injectivity conjecture.

### Leading coefficient from the modularity functional equation

`ER.6/modularity-supplied-leading-term-limit` · theorem · planet “Elliptic functional equation comparison” · ER.6 part

For E/Q, import the analytic continuation and completed functional equation from EllipticCurveModularity R29.6, including the bad Euler factors and the conductor N. Write Λ(s)=N^(s/2)(2π)^(−s)Γ(s)L(s) away from gamma poles and Λ(s)=wΛ(2−s), w=±1. Then lim_(s→0) L(s)/s=wN(2π)^(−2)L(E,2). When L(E,2)≠0, the analytic order is exactly one. The generic analytic prototype also permits Γ(s)^d and obtains lim L(s)/s^d=wN(2π)^(−2d)L(2). L is a continued function agreeing with Mathlib’s raw LSeries in its convergence region, not the totalised raw series at zero.

**Hypotheses.**

- N is a positive integer and w is ±1; Λ is continuous at zero and the completed identity holds on a punctured complex neighbourhood of zero.
- At s=2, Γ(2)=1; the value of L(2) agrees with the convergent Euler product. To infer exact order d, L is analytic at zero and L(2) is nonzero.
- The normalisation uses (2π), not π, and the conductor appears to the first power in the leading coefficient.

**Proof outline.**

1. Use the R29.6 continuation of the full elliptic Euler product; list the R29.6 stage itself as an explicit dependency, in addition to its supplied theorem node, to repair RT-AREA-ktheory-2/9.
2. Multiply the completed expression by (sΓ(s))^(−d). The baseline punctured limit sΓ(s)→1 and continuity of powers of positive real constants give lim L(s)/s^d=Λ(0). No evaluation of the totalised Gamma at zero is involved.
3. At s=2 the conductor contributes N, the gamma factor contributes 1, and Λ(0)=wΛ(2).
4. For an analytic L, a nonzero finite limit of L(s)/s^d means analyticOrderAt L 0=d. E/Q has d=1. Nonvanishing follows from the convergent Euler product with Hasse bounds; request that exact elliptic statement from R29.6 rather than silently deriving it from the name LSeries.

**Acceptance.**

- For N=32,w=+1,d=1 the comparison is L′(0)=8π^(−2)L(2); the rational factor is 8.
- Changing w to −1 reverses the signed leading coefficient; the determinant Q× class is unchanged.
- For d=2 the comparison is wN/(16π⁴), not wN/(4π²); the leading coefficient is L″(0)/2!, not L″(0).

**Depends on.** this roadmap: `ER.6/beilinson-forms-equivalent`; other roadmaps: `EllipticCurveModularity:R29.6/l-function-continuation`; layers of other roadmaps: `EllipticCurveModularity:R29.6`; libraries: `mathlib:WeierstrassCurve.LSeries`, `mathlib:WeierstrassCurve.LFunction`, `mathlib:Complex.tendsto_self_mul_Gamma_nhds_zero`, `mathlib:Complex.Gamma_one`, `mathlib:Complex.Gamma_add_one`, `mathlib:analyticOrderAt`, `mathlib:AnalyticAt.analyticOrderAt_eq_natCast`.

**Needed by.** this roadmap: `ER.6/determinant-witnesses-in-the-two-normalisations`.

**Lean.** declarations `TauCeti.EllipticRegulators.ER6.leadingTermLimit`, `TauCeti.EllipticRegulators.ER6.leadingTermOrder`.

**Sources.**

- `DJZ.2006`, §2, the display following Conjecture 2.1, p. 3: “residue 1” — The source calculation gives the exact conductor/gamma scalar; modularity supplies its conjectural analytic inputs for elliptic curves over Q.

### Equivalent determinant witnesses at zero and at two

`ER.6/determinant-witnesses-in-the-two-normalisations` · theorem · ER.6 part

Let d=[F:Q], N>0 and w=±1. If the specified leading coefficient ℓ₀ satisfies ℓ₀=wN(2π)^(−2d)L(E,2), then HasDeterminantWitness(b,r,ℓ₀) iff HasDeterminantWitness(b,r,π^(−2d)L(E,2)). The rational factors are related by q₂=q₀wN2^(−2d); they are not equal in general. The same rescaling preserves the full integral basis criterion. For E/Q the identity is supplied by the preceding modularity application. Over a general number field it is conditional on the completed continuation and functional equation; the ER.5 Hecke route supplies analytic inputs only for its stated E/Q maximal-order, class-number-one CM setup, not for arbitrary CM curves over number fields.

**Hypotheses.**

- The Betti rational structure and regulator normalisation are held fixed; changing them to make the formula fit is forbidden.
- In the number-field case use d=r₁+2r₂ and N=|disc F|² Norm_(F/Q)(f_E), with all finite Euler factors. The assumed completion is N^(s/2)(2π)^(−ds)Γ(s)^d L(E,s), with root sign ±1; any other completed convention requires its own conversion.
- The at-two witness predicate is meaningful without analytic continuation. Calling it equivalent to a leading coefficient requires the displayed scalar identity.

**Proof outline.**

1. Factor (2π)^(−2d)=2^(−2d)π^(−2d), justified by π>0.
2. The scalar wN2^(−2d) is a nonzero rational number, so apply rescaleValue in both directions.
3. Apply fullBasisCriterion with the same real-injectivity condition on each side.
4. Do not take a real part of a complex leading term to force a real determinant comparison; use the real structure of the actual elliptic L-function. For number fields the analytic inputs are explicit hypotheses; ER.5’s Hecke character identification and AL.1 supply them in its specified E/Q maximal-order, class-number-one CM case.

**Acceptance.**

- For d=1,N=32,w=1, a leading-form coefficient q₀=1 becomes q₂=8.
- For d=2,N=16,w=−1 the rational conversion scalar is −1.
- If L(E,2)=0 both determinant witness predicates fail; nonzero leading coefficients are enforced by the witness definition.
- Replacing (2π) by π without changing q gives the wrong exact coefficient.

**Depends on.** this roadmap: `ER.6/constructed-determinant-witness`, `ER.6/full-integral-basis-criterion`, `ER.6/modularity-supplied-leading-term-limit`, `ER.6/beilinson-forms-equivalent`, `ER.5/the-CM-setup-and-the-hecke-character`, `ER.6/determinant-witness-rescale-value`.

**Lean.** declaration `TauCeti.EllipticRegulators.ER6.atTwoWitness_iff`.

**Sources.**

- `DJZ.2006`, Remark 3.12, p. 6; Remark 3.14, p. 7: “expected functional equation” — The at-two formulation needs no continuation to be meaningful; the equivalence does. The rational coefficient transformation is derived explicitly here.

### Potentially good integrality by finite-extension descent

`ER.6/potentially-good-integrality-by-local-descent` · theorem · planet “Potentially good reduction integrality” · ER.6 part

If E/F has potentially good reduction at every finite place, then the rational integral part I(E) is all of K₂(E)⊗Q, hence all horizontally unramified rational function-field classes. This refines the proof of the parent ER.6/potentially-good-reduction-integrality theorem: it uses published integral-membership descent and good reduction, without a case analysis of Kodaira fibre graphs. It is a rational image equality, not an assertion that every integral class itself lifts without taking a multiple.

**Hypotheses.**

- Potentially good reduction means good reduction of a minimal equation after some finite extension of the completed local field. A nonminimal base-changed equation is not required to have good reduction.
- Use the regular proper model image from E.6 and the same image over each completion and finite extension, not G-theory of an arbitrary singular proper flat model.
- The unweighted K₂ descent statements are requested from their owner E.6. Scholl states the motivic weightwise version; passage to full rational K₂ uses the finite Adams-weight decomposition, explicitly included in that request.
- The local integral image is im(K₂(𝓔_v)⊗Q→K₂(E/F_v)⊗Q) for a regular proper flat model over O_(F_v), and likewise over L_v. Its construction, model independence and good-reduction equality are part of the E.6 request; the existing number-field E.6 nodes alone do not provide this local-field specialisation.

**Proof outline.**

1. For α∈K₂(E)⊗Q and a finite place v, pull α to E/F_v. Choose a finite extension L_v/F_v where E has good reduction; no simultaneous global good-reduction field is required.
2. Use the requested local-field version of E.6 good-reduction integrality and model independence to put α_(L_v) in the local integral image: localisation has boundary in G₁ of the smooth proper finite-field special fibre, which equals its torsion K₁. These localisation and finite-field computations are supplied by E.6 and its S.3/E.5 prerequisites.
3. Reflect integral membership back along L_v/F_v by Scholl I Corollary 1.3.4 (alteration pullback and degree-normalised transfer), explicitly recalled for finite extensions in Scholl II §2. This is the requested E.6 specialisation.
4. Apply Scholl I Proposition 1.3.6, or the identical localization diagram of Scholl II §2, to infer global integrality from all local completions. The reverse inclusion I⊂K₂(E)⊗Q is definitional.
5. Scholl II’s H_M,nr is ℓ-adic unramified motivic cohomology; do not identify it with the horizontal tame kernel. The proof uses only its integral-membership descent/localisation discussion, not Theorem 1.1 with the word unramified reinterpreted.

**Acceptance.**

- When E has good reduction already at v the extension may be the identity.
- The argument works for wildly ramified extensions in residue characteristics 2 and 3; no rational-tree classification is needed.
- By E.3 rational injectivity and E.6 vertical residues, equality with the full K₂ rational group means every vertical residue of every horizontal rational class is zero.
- The DJZ elliptic example has v₂(j)=−6 and is excluded by the potentially-good hypothesis.
- Neither equality of these two groups nor descent bounds their rational dimension.

**Depends on.** other roadmaps: `EllipticKTheory:E.6/the-integral-part`, `EllipticKTheory:E.6/existence-of-a-regular-proper-model`, `EllipticKTheory:E.6/model-independence`, `EllipticKTheory:E.6/good-reduction-primes-impose-no-condition`, `EllipticKTheory:E.6/vertical-residues`, `EllipticKTheory:E.3/what-the-sequence-does-not-identify`; layers of other roadmaps: `EllipticKTheory:E.6`; Tau Ceti roadmap layers: `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`.

**Needed by.** this roadmap: `ER.6/integral-nonzero-bloch-class`.

**Lean.** declaration `TauCeti.EllipticRegulators.ER6.potentiallyGoodIntegralityByDescent`.

**Signature status.** Arithmetic signature omitted at the pinned higher-K-theory/model boundary; not replaced by dummy types.

**Refines.** `ER.6/potentially-good-reduction-integrality`.

**Sources.**

- `Scholl.Integral.I`, §1.3.3, Corollary 1.3.4, Proposition 1.3.6; PDF pp. 8–9: “generic degree” — Degree-normalised alteration transfer reflects integral membership; localisation identifies global membership with membership over all completions. Their potentially-good application is derived here.
- `Scholl.Integral.II`, §2, PDF p. 5, equations preceding diagram (3): “stable under” — The source explicitly recalls reflection of integral membership under finite field extensions. This is not a statement about horizontal tame unramifiedness.

### Integral membership of the nonzero Bloch class

`ER.6/integral-nonzero-bloch-class` · application · ER.6 part

In the precise ER.5 maximal-order CM setup over Q, let U be its rationally descended Bloch class. Assume E is potentially good at every finite place. The descent integrality theorem gives U∈I(E). Under the ER.2 comparison identifying the imported symbol regulator with the universal regulator by a nonzero normalisation factor, ER.5 nonvanishing gives r(U)≠0, so Q·U is a one-dimensional subspace of I and its scalar-extended regulator is an isomorphism onto the one-dimensional real target. The regulator on all I is surjective. Neither full integral rank nor an exact rational Betti determinant certificate follows just from this nonvanishing.

**Hypotheses.**

- Use exactly the parent ER.5 maximal-order, class-number-one, rational descent and nonvanishing hypotheses; no additional CM orders or higher-class-number fields are included.
- Potentially good reduction at every finite place is an explicit arithmetic hypothesis here. The j-integrality criterion is imported from the existing elliptic local-reduction layer; a theorem establishing integral j for a broader CM family belongs to that family’s CM owner.
- For the universal-regulator nonvanishing and surjectivity conclusions, assume the parent ER.2 comparison identifies the nonzero Bloch symbol regulator with r by a nonzero factor. This inherited comparison is still a gap. An exact rational determinant certificate additionally needs the normalisation in the fixed Betti rational structure, not a freely rescaled period.

**Proof outline.**

1. Import U∈K₂(E)⊗Q and its nonzero symbol regulator from ER.5. Under the explicitly assumed ER.2 comparison, the nonzero normalisation factor also gives r(U)≠0.
2. Apply the source-backed potentially-good integrality refinement to place U in the already constructed I.
3. A nonzero vector in a one-dimensional real target spans that target; Q·U has rank one because a regulator does not annihilate U. This yields scalar-extended surjectivity on all I.
4. Keep the full-basis criterion’s real-injectivity requirement separate. An exact determinant relation in the fixed rational structure also needs the ER.2 regulator comparison, not just nonzero scalar regulator output.

**Acceptance.**

- For j=1728 and j=0, the imported j-integrality criterion supplies the reduction hypothesis at every finite place, including additive primes.
- A hypothetical second independent integral class in the real-regulator kernel would leave this conclusion intact and invalidate the full rank-one conjecture; no argument here excludes it.
- The class U and its regulator coefficients are imported unchanged from ER.5’s corrected formulas; the private Bloch scan is not newly cited or claimed to have been read.

**Depends on.** this roadmap: `ER.6/potentially-good-integrality-by-local-descent`, `ER.6/the-regulator-on-the-integral-part`, `ER.5/the-class-U`, `ER.5/nonvanishing-and-what-is-not-claimed`, `ER.2/the-normalisation-factor`; Tau Ceti roadmap layers: `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`.

**Lean.** declaration `TauCeti.EllipticRegulators.ER6.integralCMClassNonzero`.

**Signature status.** Arithmetic signature omitted until the imported K₂/Deligne objects exist; the exact theorem is stated in the packet and reader.

**Sources.**

- `Scholl.Integral.II`, §2, PDF p. 5: integral membership after finite extension: “the integrality” — Supports the new arithmetic-membership step; the Bloch class and nonzero regulator are imported parent declarations, not results claimed to be stated in this paper.

### Change of rational Betti basis

`ER.6/regulator-det-change-betti` · lemma · ER.6 part · added by REV-EllipticRegulators--ER.6

For Q-bases b,b′ of B indexed by Fin d, any Q-linear r:I→R⊗Q B and any d-tuple x in I, put C_ij=b.repr(b′_j)_i. Then Δ_b(r;x)=det(C)·Δ_b′(r;x), with the rational determinant cast to R.

**Hypotheses.**

- I and B are rational vector spaces; b is a basis of B indexed by Fin d. The arithmetic application uses the imported integral part and requested Betti rational structure.

**Proof outline.**

1. Write C_ij=b.repr(b′_j)_i. The coordinates satisfy M_b=C_R M_b′. Apply det_mul and cast the rational determinant into R. This is the previously outlined API item, promoted because the witness transport uses it.

**Acceptance.**

- Taking b=b′ gives determinant factor 1.
- For d=1, replacing b by 2b divides the coordinate determinant by 2.

**Depends on.** this roadmap: `ER.6/regulator-determinant-in-betti-coordinates`; libraries: `mathlib:Matrix.det_mul`.

**Needed by.** this roadmap: `ER.6/constructed-determinant-witness`.

**Lean.** declaration `TauCeti.EllipticRegulators.ER6.regulatorDet_changeBetti`.

**Sources.**

- `DJZ.2006`, Conjecture 3.11(2), p. 6; Remark 3.14, p. 7: “the determinant” — The cited determinant formulation motivates this derived linear-algebra API lemma, rather than printing it under the proposed name.

### Surjectivity from a determinant witness

`ER.6/determinant-witness-surjective` · lemma · ER.6 part · added by REV-EllipticRegulators--ER.6

Let b be a Q-basis of B indexed by Fin d, r:I→R⊗Q B be Q-linear and r_R:R⊗Q I→R⊗Q B be R-linear with r_R(a⊗x)=a r(x). If HasDeterminantWitness(b,r,ℓ), then r_R is surjective; no finite-dimensionality of I is assumed.

**Hypotheses.**

- I and B are rational vector spaces; b is a basis of B indexed by Fin d. The arithmetic application uses the imported integral part and requested Betti rational structure.

**Proof outline.**

1. Extract a tuple x with determinant qℓ≠0. Its regulator matrix is invertible over R, so its columns span the target. The scalar-extension identity r_R(1⊗x_j)=r(x_j) puts every column in the range, proving surjectivity. This API item is promoted because fullBasisCriterion uses it.

**Acceptance.**

- The projection Q²→Q satisfies the conclusion despite its kernel.
- No injectivity or finite-dimensionality of I is deduced.

**Depends on.** this roadmap: `ER.6/constructed-determinant-witness`; libraries: `mathlib:Matrix.isUnit_iff_isUnit_det`.

**Needed by.** this roadmap: `ER.6/full-integral-basis-criterion`.

**Lean.** declaration `TauCeti.EllipticRegulators.ER6.HasDeterminantWitness.surjective`.

**Sources.**

- `DJZ.2006`, Remark 3.13, pp. 6–7: “finding enough elements” — The cited determinant formulation motivates this derived linear-algebra API lemma, rather than printing it under the proposed name.

### Rational rescaling of a determinant witness

`ER.6/determinant-witness-rescale-value` · lemma · ER.6 part · added by REV-EllipticRegulators--ER.6

For Q-basis b of B indexed by Fin d, Q-linear r:I→R⊗Q B, ℓ∈R and a∈Q with a≠0, HasDeterminantWitness(b,r,aℓ) iff HasDeterminantWitness(b,r,ℓ).

**Hypotheses.**

- I and B are rational vector spaces; b is a basis of B indexed by Fin d. The arithmetic application uses the imported integral part and requested Betti rational structure.

**Proof outline.**

1. For Δ=q(aℓ), use coefficient qa for ℓ; for Δ=qℓ use q/a for aℓ. Since a≠0, the new coefficient and leading value are nonzero in each direction. This API item is promoted because atTwoWitness_iff uses it.

**Acceptance.**

- For a=−1, replace q by −q.
- For a=8, a witness with coefficient q for ℓ has coefficient q/8 for 8ℓ.

**Depends on.** this roadmap: `ER.6/constructed-determinant-witness`.

**Needed by.** this roadmap: `ER.6/determinant-witnesses-in-the-two-normalisations`.

**Lean.** declaration `TauCeti.EllipticRegulators.ER6.HasDeterminantWitness.rescaleValue`.

**Sources.**

- `DJZ.2006`, Remark 3.13, pp. 6–7: “finding enough elements” — The cited determinant formulation motivates this derived linear-algebra API lemma, rather than printing it under the proposed name.

## ER.7 — General modular elliptic curves

*41 nodes: 25 from the parent packet and 16 from the ER.7 part. Planets (6): Explicit Beilinson theorem; Rankin–Selberg integral; Manin–Drinfeld theorem; L(E,2) from geodesic periods; Beilinson subspace; Integral Beilinson subspace.*

The layer proves Beilinson's theorem for modular curves and modular elliptic curves over ℚ, in two complementary forms.

- **Brunault's explicit form** (parent packet, from his thesis, chapter 3, and the Bull. SMF version of record).
  - Analytic inputs: real-analytic Eisenstein series and Kronecker's limit formulas; the Euler-product identity and the Rankin–Selberg integral; the Manin–Drinfeld theorem; the units u_f with their divisors and rationality.
  - Symbols: the symbols of character units lie in K₂ of the complete curve.
  - The explicit formula L(f, 2)L(f, χ, 1) = (Nπi/φ(N)) τ(χ) r_N({u_ψχ, u_χ̄}, f).
  - Spanning of the regulator target of X₁(p).
  - The cycle formula, and the rational combination of geodesic periods for L(E, 2).
  - The prime-level formulas, with the sign of Théorème 1, the factor 4 of Merel's Théorème D and the π of (8) corrected (source issues E15–E17).
  - The X₁(11) example, L(E, 2) = (10/11)·π·D_E(P).
- **Schappacher–Scholl's general form** (the ER.7 part).
  - The fixed-level subspace Q_K of compact combinations of unit symbols, and its transfer closure P_K.
  - The three separate assertions of their Theorem 1.1.2: the rational structure r_D(P_K), the determinant formula det_ℚ r_D(P_K) = L^{(g)}(H¹(X_K), 0)·det_ℚ H¹_B(X_K, ℚ(1)), and integrality of P_K, by the arithmetic-surface argument of their §7 with normalised reductions and supersingular orders.
  - The elliptic image P_{E,φ} under a modular parametrisation, regulator adjointness with rational descent, and the theorem for a modular elliptic curve: r_D(P_{E,φ}) = L′(E, 0)·H¹_B(E/ℝ, ℚ(1)) as rational lines.

The ER.7 part also records, node by node, how far the proofs of seven parent nodes are closed; these appear as Assembly notes on those nodes.

- **Ownership** (confirmed finding RT-AREA-ktheory-2/6 and the ER.7 part's accepted proposal). Siegel units, their cusp divisors and descent are KatoEulerSystems L0's. The generic pair-symbol interface belongs to an early prefix of KatoEulerSystems L1, and the generic Deligne cycle map to an early prefix of MotivicEtaleKTheory M.8. ER.7 keeps Manin–Drinfeld, character-specific compactness, the regulator and Rankin–Selberg evaluations, vertical integrality and the pushforward.
- **Planets.** The two inherited planets on modular units and their symbols are not shown. The layer shows six: Explicit Beilinson theorem, Rankin–Selberg integral, Manin–Drinfeld theorem, L(E,2) from geodesic periods, Beilinson subspace and Integral Beilinson subspace.

The layer is planned, not closed. The ER.7 part records six gaps:
- G1, the early pair-symbol interface;
- G2, the early regulator normalisation and the compact/open extension of proper covariance;
- G3, Merel's composite-level adapter and the analytic location of E15 and E16;
- G4, the certified sign in the X₁(11) example;
- G5, a primitive even twist at exactly the original modulus, which no theorem depends on;
- G6, the imported analytic and special-fibre supplier proofs.

The ER.7 part's review verdict is `needs_changes`, solely because the part's own reader lagged its corrected packet. This document is generated from the corrected packet, so it carries those corrections (see the handoff note).

**Coverage.**

- **In the parent packet: partial.** Chapter 3 §§3.1-3.7 has now been read (checker C) and is decomposed in 21 new nodes; the remaining items are outside the thesis or open. Revised by REV-EllipticRegulators.
  - Remaining: Schappacher–Scholl Theorem 1.1.2, §7 and the integral Manin–Drinfeld correction (gap).
  - Remaining: Merel's appendix (Théorème A, Corollaire 2, Théorème D) (gap).
  - Remaining: Kronecker limit formulas (Siegel) and Manin–Drinfeld proofs (gaps).
  - Remaining: Regulator/pushforward compatibility and descent to K2(E) ⊗ Q (gap).
  - Remaining: Existence of a primitive even χ mod N, χ ≠ ψ̄, with L(f, χ, 1) ≠ 0 (open; Bull. SMF Remarque 1.2).
- **In the ER.7 part: planned.** Every stage target is realized by an imported node, a new node or the expressly recorded open primitive-twist claim. All new chains end in verified baseline, existing supplier nodes, precise stage requests or a named gap. Source retrieval, SS §7 extraction and Manin–Drinfeld/Siegel source proof reading are finished; no declaration is claimed implemented.
  - Remaining: G1: Early pair-symbol interface and full-level cusp adapters
  - Remaining: G2: Early regulator normalization and proper cycle-map prefix; inherited function-field extension
  - Remaining: G3: Merel composite-level Fourier adapter and analytic error location
  - Remaining: G4: Certified sign in the X1(11) worked example
  - Remaining: G5: Primitive even twist at exactly the original modulus
  - Remaining: G6: Imported analytic and special-fibre supplier proofs

The ER.7 part accounts for the layer's targets as follows.

| Target | Nodes | Imported or requested |
|---|---|---|
| Modular units, cusp divisors, descent and early K2 pair symbols | `KatoEulerSystems:L0/siegel-units-and-c-independent-rationalisation`, `KatoEulerSystems:L0/siegel-unit-galois-action-and-distribution`, `KatoEulerSystems:L1/beilinson-element-in-K2-of-Y-M-N` | `KatoEulerSystems:L0`, `KatoEulerSystems:L1`. Ownership correction RT-AREA-ktheory-2/6: no new Siegel-unit or generic pair-symbol node in ER.7. |
| Manin–Drinfeld and Kronecker proofs | `ER.7/manin-drinfeld`, `ER.7/kronecker-limit-formulas`, `ER.7/cuspidal-hecke-separation` | Source passages read; power-kernel Poisson/contour and Abel-summation proofs distinguished from the separate Gaussian theta/Mellin continuation, with all analytic adapters recorded. |
| Finite-level regulator integral and Rankin–Selberg evaluation | `ER.7/the-regulator-integral-and-its-evaluation`, `ER.7/rankin-selberg-integral`, `ER.7/regulator-period-inclusion`, `ER.7/regulator-nonvanishing-after-level-change` | Imported Brunault exact conditional formula, plus general-level SS period/nonvanishing argument. |
| Schappacher–Scholl 1.1.2(i),(ii),(iii) and corrected §7 integrality | `ER.7/beilinson-rational-structure`, `ER.7/beilinson-determinant-formula`, `ER.7/integral-beilinson-subspace` | Three assertions separate; no rank/injectivity claim for all K2. |
| Genuine parametrization, pushforward, descent and nonvanishing on E | `ER.7/elliptic-beilinson-subspace`, `ER.7/elliptic-regulator-adjointness`, `ER.7/modular-elliptic-regulator-line` | Conditional modular statement first; unconditional E/Q after R29.5/R29.6. No unweighted trace noncancellation assumption. |
| Merel A, Corollary 2 and D | `ER.7/nonvanishing-of-a-twisted-value`, `ER.7/prime-level-L-value-formula`, `ER.7/rational-combination-for-L-E-2` | `tauceti:TauCetiRoadmap/ModularForms#layer-8-modular-symbols-the-integral-hecke-algebra-and-coefficient-fields`. Generic period machinery stays in upstream ModularForms; exact composite-level adapter and E15/E16 analytic proof recorded as G3. |
| Primitive even same-modulus nonvanishing | — | Recorded open claim G5; no theorem node asserts it and no general result depends on it. |

### The modular unit u_f attached to a function of sum zero

`ER.7/modular-units-and-their-divisors` · construction · parent packet

Let N ≥ 1 and f : Z/NZ → C with Σ_v f(v) = 0. There is a unique u_f ∈ O*(Y1(N)(C)) ⊗ C with log|u_f| = (1/π)·E*_f and û_f(∞) = 1 ∈ C* ⊗ C, where û(∞) is the leading coefficient of the q-expansion at ∞. Its divisor is supported on the cusps: for P = [u, v] ∈ P_N, (u, v) ∈ E_N, ord_P(u_f) = −(1/(N·(u, N))) Σ_{(a,b)∈(Z/NZ)²} f̂(au + bv)·B̄2(b̃/N). The map f ↦ u_f is C-linear. For an even non-trivial Dirichlet character χ mod N this gives u_χ, an element of O*(Y1(N)) ⊗ C (not a unit) with log|u_χ| = (1/π) Σ_{a∈(Z/NZ)*} χ(a) E*_{0,a}.

**Hypotheses.**

- Σ_v f(v) = 0; for the trivial character (sum φ(N) ≠ 0) no u_f is defined.
- The existence uses the Manin-Drinfeld theorem, planned in ER.7/manin-drinfeld (no modular-curves roadmap plans it), and the Green's function of X1(N)(C).
- Siegel units are KatoEulerSystems:L0's; u_f is a C-linear combination of them (by Kronecker's second limit formula), recorded as a compatibility API item rather than re-planned.

**Construction.**

1. E*_f is C^∞ and harmonic on Y1(N)(C) (ER.7/harmonicity-of-eisenstein-series).
2. At a cusp P, E*_f(gz) = K_{f,P} y + α0 + (exponentially small), with K_{f,P} = (2π²/N²) Σ f̂(au + bv) B̄2(b̃/N) ((3.64)-(3.65)).
3. φ = E*_f + (N/2π) Σ_P K_{f,P}/(u, N) · G(P, ·) extends to a harmonic function on X1(N)(C), hence is constant; this gives Σ_P K_{f,P}/(u, N) = 0.
4. By Manin-Drinfeld and the splitting by û(∞) there is a unique u_f with div u_f = −(N/(2π²)) Σ K_{f,P}/(u, N)[P] and û_f(∞) = 1; comparing constant terms gives log|u_f| = E*_f/π.
5. C-linearity from that of f ↦ div u_f.

**API.**

- `modularUnit` (data): u_f ∈ O*(Y1(N)(C)) ⊗ C for f of sum zero.
- `modularUnit_logabs` (characterisation): log|u_f| = E*_f/π.
- `modularUnit_leadingCoeff` (characterisation): û_f(∞) = 1 ∈ C* ⊗ C.
- `modularUnit_unique` (extensionality): An element u of O*(Y1(N)(C)) ⊗ C with log|u| = E*_f/π and û(∞) = 1 equals u_f.
- `modularUnit_divisor` (characterisation): ord_P(u_f) = −(1/(N(u, N))) Σ_{a,b} f̂(au + bv) B̄2(b̃/N) at P = [u, v].
- `modularUnit_add` (simp): u_{f+g} = u_f · u_g and u_{cf} = u_f ⊗ c (C-linearity, written multiplicatively).
- `modularUnit_eq_siegel` (compatibility): u_f is the C-linear combination of the Siegel units of KatoEulerSystems:L0 given by Kronecker's second limit formula (3.12).

**Unit tests.**

- `modularUnit_divisor_level5` (computation): N = 5, χ = (·/5): div u_χ = −(4/(25√5))(P_1 − P_2), since L(χ, 2) = 4π²/(25√5) = 0.706211403259740969931…
- `modularUnit_odd` (degenerate): For χ odd, E*_χ = 0 and u_χ = 1.
- `modularUnit_trivial_character` (non-example): For the trivial character mod N > 1 the function f = 1 on (Z/NZ)* has sum φ(N) ≠ 0, E*_f has a π log y term in its constant term, and no u_f with log|u_f| = E*_f/π exists.
- `divisor_on_cusps` (characterisation): For every f of sum zero, the support of div u_f is contained in P_N and deg div u_f = 0.
- `modularUnit_primitive_fourier` (compatibility): For χ primitive even, div u_χ̂ = τ(χ)·div u_χ with τ(χ) = gaussSum χ ZMod.stdAddChar.

**Acceptance.**

- The divisor of u_f is supported on the cusps and has degree zero.
- u_f is unique given log|u_f| = E*_f/π and û_f(∞) = 1.
- f ↦ u_f is C-linear; u_χ = 1 for χ odd.

**Uses.**

- ER.7/divisors-of-character-units: The divisors of u_χ, u_χ̂ are computed from modularUnit_divisor.
- ER.7/symbols-of-modular-units-in-K2: The symbols {u_χ, u_χ'} are the modular-curve K2 classes.
- ER.7/explicit-beilinson-theorem-degeneracy: log|u_χ| = E*_χ/π turns the regulator into the Rankin-Selberg integral.
- ER.8/the-integrality-worked-example: On X1(11) = 11a3 the functions x and y are modular units supported on the cusps.

**Depends on.** this roadmap: `ER.7/real-analytic-eisenstein-series`, `ER.7/harmonicity-of-eisenstein-series`, `ER.7/manin-drinfeld`; layers of other roadmaps: `ModularCurvesPartII:R12.3`, `KatoEulerSystems:L0`.

**Needed by.** this roadmap: `ER.7/divisors-of-character-units`, `ER.7/rationality-of-modular-units`, `ER.7/symbols-of-modular-units-in-K2`, `ER.7/explicit-beilinson-theorem-degeneracy`, `ER.7/eta-form-of-divisors`.

**Sources.**

- `Brunault.These.2005`, Proposition 79, p. 85: “Proposition 79. Soit f : Z/NZ → C une fonction de somme nulle. Il existe une unique unité modulaire u_f ∈ O*(Y1(N)(C)) ⊗ C vérifiant log|u_f| = (1/π) · E*_f et û_f(∞) = 1 ∈ C* ⊗ C.” — The existence and uniqueness; (3.63) and the C-linearity follow on the same page.
- `Brunault.These.2005`, §0.3, (13), p. 10: “Pour tout caractère de Dirichlet χ modulo N, pair et non trivial, nous définissons une unité modulaire u_χ ∈ O*(Y1(N)) ⊗ C vérifiant log|u_χ| = (1/π) Σ_{a∈(Z/NZ)*} χ(a) E*_{0,a}.” — The character units, defined only for even NON-TRIVIAL χ, as elements of O*(Y1(N)) ⊗ C.

**Assembly note.** The parent packet marks this node as the planet “Modular units u_f”. The ER.7 part's accepted rescope proposal (RT-AREA-ktheory-2/6) removes that planet. Siegel units, their cusp divisors and descent are KatoEulerSystems L0's; this node keeps only the ℂ-linear units u_f of Brunault's Proposition 79 and their identification with combinations of Siegel units. The layer shows six planets.

### Brunault's explicit Beilinson theorem (Théorème 4 / Bull. SMF Théorème 1.1)

`ER.7/the-regulator-integral-and-its-evaluation` · theorem · planet “Explicit Beilinson theorem” · parent packet

Let f be a primitive weight-two cusp form for Γ1(N) of character ψ and χ an even, primitive Dirichlet character mod N with χ ≠ ψ̄ (so ψχ is non-trivial). Then {u_ψχ, u_χ̄} ∈ K2(X1(N)) ⊗ C and L(f, 2)L(f, χ, 1) = (Nπi/φ(N)) · τ(χ) · r_N({u_ψχ, u_χ̄}, f), with r_N({u, v}, f) = ∫_{X1(N)(C)} log|u| · ω_f ∧ ∂̄ log|v|, ω_f = 2πi f(z)dz and τ(χ) = Σ_a χ(a)e^{2πia/N}. In the normalisation of the version of record, r̂_N({u, v})(ω) = ∫ η(u, v) ∧ ω = −2i·r_N({u, v})(ω), this reads L(f, 2)L(f, χ, 1) = (Nπτ(χ)/(2φ(N))) · r̂_N({u_χ̄, u_ψχ})(ω_f).

**Hypotheses.**

- χ even, primitive mod N, χ ≠ ψ̄ (the source's 'distinct de ψ̄'; the version of record adds χ ≠ 1, automatic for N > 1).
- Primitivity is essential for the K2 statement: without it the source found no formula for r_N({u_ψχ, u_χ̄}, f) (Remarque 82) and the version of record lists lifting it as open (Remarque 1.2); the general identity without primitivity is Théorème 81, for a function-field symbol.
- For N ≡ 2 mod 4 there are no primitive characters mod N, so the theorem is empty (e.g. N = 14).
- The constant is exact and depends on the regulator normalisation, which must be the one of ER.2.

**Proof outline.**

1. Apply ER.7/explicit-beilinson-theorem-degeneracy with M = N and χ' = χ; the condition ψ = ψχ·χ̄ holds.
2. For χ primitive, χ̂ = τ(χ)χ̄, so u_χ̂ = u_χ̄ ⊗ τ(χ).
3. Membership in K2(X1(N)) ⊗ C: ER.7/symbols-of-modular-units-in-K2 (both characters non-trivial, supported on units).
4. Convert to the published normalisation with (3.110): r_N = −(i/2)∫ ω ∧ η = (i/2)∫ η ∧ ω.

**Acceptance.**

- The identity is exact, with the factor Nπiτ(χ)/φ(N) (thesis normalisation) or Nπτ(χ)/(2φ(N)) (published normalisation).
- The symbol is {u_ψχ, u_χ̄} in this order; reversing it changes the sign.
- It is a finite-level statement with auxiliary level N.
- For N = 11, ψ = 1 and χ even non-trivial, both sides are non-zero (L(E, 2)L(E, χ, 1) is listed in ER.7/the-X1-11-example).

**Depends on.** this roadmap: `ER.7/explicit-beilinson-theorem-degeneracy`, `ER.7/symbols-of-modular-units-in-K2`, `ER.2/the-regulator-on-symbols`; libraries: `mathlib:gaussSum`, `mathlib:DirichletCharacter.IsPrimitive`.

**Needed by.** this roadmap: `ER.7/the-pushforward-and-its-hypotheses`, `ER.7/the-X1-11-example`.

**Sources.**

- `Brunault.These.2005`, Corollaire (Théorème 4), p. 91; also Théorème 4, p. 11: “Pour tout caractère de Dirichlet χ modulo N, pair, distinct de ψ̄ et primitif, nous avons L(f, 2)L(f, χ, 1) = (Nπi/φ(N)) τ(χ)⟨r_N({u_ψχ, u_χ̄}), f⟩.” — The theorem, with the bars read from the page images (the text layer drops them).
- `Brunault.These.2005`, Remarque 82, p. 91: “Remarque 82. Sans l'hypothèse χ primitif, nous n'avons pas trouvé de formule satisfaisante pour ⟨r_N({u_ψχ, u_χ̄}), f⟩.” — Why primitivity is not relaxed.
- `Brunault.BSMF.2007`, Théorème 1.1 and (3), pp. 216-217: “Pour tout caractère de Dirichlet χ modulo N, pair, primitif et distinct de 1 et ψ̄, le symbole {u_χ̄, u_ψχ} appartient à K2(X1(N)) ⊗Z C, et nous avons L(f, 2)L(f, χ, 1) = (Nπτ(χ)/(2φ(N)))⟨r_N({u_χ̄, u_ψχ}), f⟩.” — The version of record, with r̂_N({u, v})(ω) = ∫ η(u, v) ∧ ω.

**Assembly note.** The ER.7 part extends the evaluation to every level and every weight-two automorphic π. `ER.7/regulator-period-inclusion` places the period in 2πi·c⁺(π)L′(π̌, 0)·Q̄, and `ER.7/regulator-nonvanishing-after-level-change` proves nonvanishing after a free choice of auxiliary level. This node's exact formula keeps its hypotheses.

### Théorème 1: L(E, 2)L(E, χ, 1) for prime conductor, with the sign corrected

`ER.7/the-explicit-theorem-for-an-elliptic-curve` · theorem · parent packet

Let E/Q have prime conductor p and ε(E) ∈ {±1} its root number (Λ(E, s) = ε(E)Λ(E, 2 − s)); the source's w(E) is −ε(E). For χ' mod p put η_χ = Σ_{a,b∈(Z/pZ)*} χ(a)χ̄(b)η(a, b) and c_{χ,χ'} = τ(χ̄') Σ_{v=1}^{p−1} χ'(v) ∫_{g_vρ}^{g_vρ²} η_χ, g_v = [[0, −1], [1, v]], ρ = e^{πi/3}. For every even non-trivial χ mod p: L(E, 2)L(E, χ, 1) = (p ε(E) τ(χ)/(8πi(p − 1))) Σ_{χ'} c_{χ,χ'} L(E, χ', 1), the sum over even non-trivial χ' mod p. The printed formula has w(E) where ε(E) = −w(E) is correct (source issue E16). The coefficients c_{χ,χ'} depend only on χ, χ' and p.

**Hypotheses.**

- p prime; the general-level analogue goes through Merel's Théorème A (not read).
- Modularity of E (a newform f ∈ S2(Γ0(p)) with L(E, s) = L(f, s)) is an input, from EllipticCurveModularity:R29.6; the modular parametrisation is not used.
- The formula is an analytic identity between L-values and periods of explicit forms; it asserts nothing about K2(E) and is not a conclusion of any of the three kinds of ER.6.

**Proof outline.**

1. From the proof of Théorème 3 with χ primitive: L(f,2)L(f,χ,1) = (p i τ(χ)/4) Σ_{x∈(Z/pZ)*} (∫_{g_xρ}^{g_xρ²} η_χ) ξ_f^+(x) (3.144), the cusps x = 0, ∞ contributing nothing.
2. Expand ξ_f^+(x) in twisted L-values: numerically ξ_f^+(x) = −(w(E)/(2π(p−1))) Σ_{χ' even ≠ 1} τ(χ̄')χ'(x)L(f, χ', 1), i.e. with the opposite sign to the even part of the printed (3.145) (checked at p = 11 and 19 against Manin symbols computed from definition (10)).
3. Substitute, show c_{χ,χ'} = 0 for χ' odd (c*η_χ = −η_χ), and bring the geodesics to g_vρ → g_vρ² (g_x = g_{−v}σ, g_{−v} ∈ Γ1(p)g_{p−v}).

**Acceptance.**

- For p = 11 (11a3, ε = +1) and the four even non-trivial χ, the corrected formula holds to 45 digits; the printed one gives −L(E, 2)L(E, χ, 1) (checker C, thm1.gp).
- The coefficients do not depend on E.
- Modularity is an input.

**Depends on.** this roadmap: `ER.7/cycle-formula`, `ER.7/nonvanishing-of-a-twisted-value`; layers of other roadmaps: `EllipticCurveModularity:R29.6`; libraries: `mathlib:WeierstrassCurve.LSeries`.

**Needed by.** this roadmap: `ER.7/prime-level-L-value-formula`.

**Sources.**

- `Brunault.These.2005`, Théorème 1, p. 8 and pp. 115-117: “Théorème 1. Supposons N = p premier. Pour tout caractère de Dirichlet χ modulo p, pair et non trivial, nous avons la formule L(E, 2)L(E, χ, 1) = (p w(E) τ(χ)/(8πi(p − 1))) Σ_{χ'} c_{χ,χ'} L(E, χ', 1)” — The printed theorem (formula transcribed from the page image, with the factor 8πi); the sign is corrected in the statement.
- `Brunault.These.2005`, Introduction, p. 7: “Notons N le conducteur de E [71, §IV.10-11], et w(E) l'opposé du signe de l'équation fonctionnelle satisfaite par L(E, s).” — The definition of w(E) = −ε(E).
- `Brunault.These.2005`, (3.145), p. 116: “ξ_f(x) = (w(E)/(2π (p − 1))) Σ_{χ≠1_p} τ(χ̄)χ(x)L(f, χ, 1) (x ∈ (Z/pZ)*).” — The printed input whose even part carries the wrong sign (source issue E16).

### The class on E: pushforward along a modular parametrisation, non-vanishing and rational proportionality

`ER.7/the-pushforward-and-its-hypotheses` · comparison · parent packet

Let E/Q have conductor N, f its newform, and φ : X1(N) → E a non-constant morphism over Q sending ∞ to O (supplied: EllipticCurveModularity:R29.5 composed with X1(N) → X0(N)), with φ*ω_E = c_φ·ω_f, c_φ ∈ Q^× (Néron differential ω_E). For χ even primitive mod N put ξ_χ = N_φ{u_χ, u_χ̄} ∈ K2(E) ⊗ C. Then r_E(ξ_χ)(ω_E) = c_φ (φ(N)/(Nπi τ(χ))) L(E, 2)L(E, χ, 1). Summing over a Galois orbit of such χ gives a class ξ ∈ K2(E) ⊗ Q (Lemme 85 and Galois descent) with r_E(ξ)(ω_E/Ω_E^+) ∈ Q^× · i L(E, 2)/π as soon as L(E, χ, 1) ≠ 0 for one χ in the orbit. CONDITIONAL form: for any supplied φ and verified newform correspondence; UNCONDITIONAL for E/Q only after importing modularity. This node does NOT prove that such a primitive χ with L(E, χ, 1) ≠ 0 exists (open in general: Bull. SMF Remarque 1.2), does not treat N ≡ 2 mod 4 (no primitive characters), and makes no integrality claim beyond the one imported from Schappacher-Scholl.

**Hypotheses.**

- φ is non-constant, defined over Q, with φ(∞) = O; c_φ is its Manin-type constant relative to ω_f.
- χ even, primitive mod N; ψ = 1 because E/Q.
- The conductor, the oldform projection (only the f-isotypic part of r_N survives the pairing with φ*ω_E), the cuspidal boundary (tame symbols at the cusps, ER.7/symbols-of-modular-units-in-K2) and the descent (ER.7/rationality-of-modular-units) are all used.
- Integrality: symbols of modular units lie in K2(X1(N))_Z ⊗ Q by Schappacher-Scholl 1.1.2(iii) (quoted by the source, not read: gap); the pushforward of an integral class along a proper morphism of regular models is integral, which needs the model supplier.

**Proof outline.**

1. Push forward: N_φ : K2(X1(N)) ⊗ C → K2(E) ⊗ C (EllipticKTheory:E.5/pullback-and-pushforward).
2. Regulator compatibility: r_E(N_φ ξ)(ω_E) = r_N(ξ)(φ*ω_E) (ER.7/regulator-under-finite-pushforward).
3. φ*ω_E = c_φ ω_f and Théorème 4 give the displayed value.
4. Non-vanishing: L(E, 2) ≠ 0 (Euler product, Re s = 2 > 3/2), and L(E, χ, 1) ≠ 0 for the chosen χ.
5. Descent: u_χ is defined over Q with coefficients in Q(χ̂) (Lemme 85); the trace over Gal(Q(χ)/Q) of ξ_χ is a Q-class; τ(χ)L(E, χ̄, 1)/Ω^+ ∈ Q(χ) (Birch's formula (3.130) and Manin-Drinfeld (3.129)) gives the rational proportionality.
6. Record the source's account of the classical argument: it removes the unspecified choice of auxiliary level and character (N' = N, χ of level dividing N) but NOT the inexplicit parametrisation, which remains an input (the source avoids it by Théorèmes 3 and 97, and in the example N = 11 by E = X1(11)).

**Acceptance.**

- The conditional theorem quantifies over a supplied φ and newform correspondence.
- For E = X1(11), φ = identity (c_φ = 1): the class {x, y} + {−1, x} ∈ K2(E)_Z ⊗ Q has r_E(ω) = −(5i/4)D_E(P) = −(πi/2)L'(E, 0) ≠ 0 with ω = ω_f/Ω^+ (ER.8/the-integrality-worked-example).
- Only the first of the two classical imprecisions is removed by taking N' = N.
- No unrestricted rank statement for K2 of elliptic curves follows.

**Depends on.** this roadmap: `ER.7/the-regulator-integral-and-its-evaluation`, `ER.7/regulator-under-finite-pushforward`, `ER.7/rationality-of-modular-units`, `ER.7/nonvanishing-of-a-twisted-value`; other roadmaps: `EllipticKTheory:E.5/pullback-and-pushforward`; layers of other roadmaps: `EllipticCurveModularity:R29.5`, `EllipticCurveModularity:R29.6`, `ModularCurvesPartII:R14.6`, `NeronModelsAndSemistableAbelianVarieties:R11.6`, `ModularSymbolsPadicLFunctions:L1`.

**Sources.**

- `Brunault.These.2005`, §0.3, p. 10: “La méthode de Beĭlinson souffre de deux imprécisions : – le choix de du caractère χ, et donc de l'entier N', n'est pas précisé ; – la paramétrisation modulaire X1(N) → E n'est pas explicite.” — The two imprecisions, literally (including the source's misprint 'de du', source issue E21).
- `Brunault.These.2005`, §0.3, p. 10: “Nous reprenons la méthode de Beĭlinson et montrons qu'il est possible de choisir N' = N et χ parmi les caractères de niveau divisant N.” — The improvement concerns the first imprecision only.
- `Brunault.These.2005`, Remarques 84, 2., p. 93: “Schappacher et Scholl ont démontré [62, 1.1.2 (iii)] que K_N ⊂ K2(X1(N))_Z ⊗ Q.” — The integrality input, quoted from Schappacher-Scholl (gap).

**Assembly note.** The ER.7 part records the state of this node's proof: *General route supplied, conditional formula preserved*. Retain the explicit same-level formula only with its original primitive-character and c_φ hypotheses. General E/Q uses P_K and modular-elliptic-regulator-line instead. Rational Galois descent occurs on E after pushforward; the trace of a non-invariant single character class may be zero. Nonzero rational image is obtained from the Hecke-equivariant period subspace, not from an unproved orbit-sum noncancellation. Inputs it names: `ER.7/modular-elliptic-regulator-line`, `ER.7/elliptic-regulator-adjointness`.

**Assembly note.** **The descent step needs a qualification.** A sum over a Galois orbit of characters need not keep a nonzero regulator, and the ER.7 part asks the assembly to qualify the step accordingly.

- Nonvanishing of a rational class on E comes instead from the Hecke-equivariant period subspace: `ER.7/elliptic-beilinson-subspace`, `ER.7/elliptic-regulator-adjointness` and `ER.7/modular-elliptic-regulator-line`.
- The explicit same-level formula stands, with its primitive-character and c_φ hypotheses.
- The existence of a primitive even χ of conductor exactly N with L(E, χ, 1) ≠ 0 is the ER.7 part's open item G5. No general result depends on it.
- Integrality is no longer quoted from the source: it is `ER.7/integral-beilinson-subspace`.

### The real-analytic Eisenstein series E_x and E*_f of level N

`ER.7/real-analytic-eisenstein-series` · definition · parent packet · added by REV-EllipticRegulators

Let N ≥ 1. For x = (u, v) ∈ (Z/NZ)², z = x0 + iy ∈ H and Re(s) > 1 put E_x(z, s) = Σ' y^s / |mz + n|^{2s}, the sum over (m, n) ∈ Z² − {(0,0)} with (m, n) ≡ (u, v) mod N. The function s ↦ E_x(z, s) continues meromorphically to C with a single pole, at s = 1, simple, with residue π/N² independent of z and x; put E*_x(z) = lim_{s→1} (E_x(z, s) − π/(N²(s − 1))). For f : Z/NZ → C put E*_f = Σ_v f(v) E*_{(0,v)} and f̂(b) = Σ_v f(v) e^{−2πibv/N} (Mathlib's ZMod.dft). Then: E*_x(gz) = E*_{xg}(z) for g ∈ SL2(Z) (x a row vector); E*_x(−z̄) = E*_{(−u,v)}(z); E*_f is Γ1(N)-invariant, real-valued when f is, and zero when f is odd; and when Σ_v f(v) = 0 it has the Fourier expansion E*_f(z) = (Σ'_{n∈Z} f(n)/n²)·y + (π/N²) Σ_{r≥1} (1/r)(Σ_{k|r} k(f̂(k) + f̂(−k)))(q^r + q̄^r), q = e^{2πiz}.

**Hypotheses.**

- N ≥ 1; the congruence condition is on the row vector (m, n); the pole is subtracted with the factor 1/N², not 1.
- The expansion (3.27) is stated only for functions f of sum zero; for the trivial character (sum φ(N) ≠ 0) the constant term contains π log y and γ and E*_f is not (π times) the log of the modulus of a unit.
- The Fourier transform has the sign e^{−2πibv/N}, which is Mathlib's ZMod.dft convention; the Gauss sum τ(χ) = Σ χ(v) e^{2πiv/N} is gaussSum χ ZMod.stdAddChar.

**Construction.**

1. Introduce ζ_{a,b}(z, s) = Σ' e^{2πi(ma+nb)/N} y^s/|mz+n|^{2s} and the finite Fourier relations (3.6)-(3.7) between the ζ_{a,b} and the E_x.
2. Continue ζ_{a,b} meromorphically (holomorphic for (a,b) ≠ (0,0), simple pole of residue π at s = 1 for (a,b) = (0,0)) and define ζ*_{a,b} (3.8): ER.7/kronecker-limit-formulas.
3. Deduce the continuation of E_x, its residue π/N² and the definition (3.9) of E*_x.
4. Prove the transformation law (3.14)-(3.15) by the substitution (m, n) ↦ (m, n)g, and the conjugation law (3.22).
5. From the Fourier expansions (3.16), (3.17), (3.19) of ζ*_{a,b} and the Fourier series of the periodic Bernoulli function B̄2, deduce (3.27) for f of sum zero (Proposition 71).

**API.**

- `eisensteinE` (data): E_x(z, s) for Re(s) > 1, as a lattice sum over the coset (u, v) mod N.
- `eisensteinStar` (data): E*_x(z) = lim_{s→1}(E_x(z, s) − π/(N²(s − 1))).
- `tendsto_eisensteinE_sub_pole` (characterisation): For real σ ↓ 1, E_x(z, σ) − π/(N²(σ − 1)) → E*_x(z).
- `eisensteinStar_smul` (functoriality): E*_x(g·z) = E*_{xg}(z) for g ∈ SL2(Z), x a row vector mod N.
- `eisensteinStar_conj` (relation): E*_{(u,v)}(−z̄) = E*_{(−u,v)}(z).
- `eisensteinStarOf` (data): The C-linear map f ↦ E*_f = Σ_v f(v) E*_{(0,v)}.
- `eisensteinStarOf_odd` (simp): E*_f = 0 when f(−v) = −f(v).
- `eisensteinStarOf_fourier` (characterisation): The Fourier expansion (3.27) for f of sum zero, with f̂ = ZMod.dft f.

**Unit tests.**

- `eisensteinStar_levelOne_i` (computation): E*_{(0,0)} at N = 1 and z = i equals 2π(γ − log 2 − 2 log η(i)) = 2.58498175957925321706589358738 (Kronecker's first limit formula, (3.10)).
- `eisensteinStarOf_odd` (degenerate): If f is odd then E*_f = 0; in particular E*_χ = 0 for an odd Dirichlet character χ.
- `eisensteinStar_T` (characterisation): E*_{(u,v)}(z + 1) = E*_{(u, u+v)}(z), and not E*_{(u, v−u)}(z) (this distinguishes the row-vector convention from its transpose).
- `fourier_convention` (compatibility): f̂ = ZMod.dft f, and for a primitive even character χ mod N one has χ̂ = τ(χ)·χ̄ with τ(χ) = gaussSum χ ZMod.stdAddChar.
- `pole_normalisation` (non-example): Subtracting π/(s − 1) instead of π/(N²(s − 1)) does not give a finite limit for N > 1: the residue of E_x is π/N².

**Acceptance.**

- E*_x(z + 1) = E*_{(u, u+v)}(z) and E*_x(−1/z) = E*_{(v, −u)}(z) (checked numerically for N = 11, x = (3, 5), z = 0.13 + 0.87i).
- For f odd, E*_f = 0.
- For N = 1: E*_{(0,0)}(i) = 2π(γ − log 2 − 2 log η(i)) = 2.5849817595792532170658935873… with η(i) = Γ(1/4)/(2π^{3/4}).

**Uses.**

- Brunault, Théorème 73 (§3.2): The Rankin-Selberg integral of E*_χ · Ω ∧ ∂̄E*_{χ̂'} is unfolded against E_χ(z, s).
- Brunault, Proposition 79 (§3.3): log|u_f| = E*_f/π defines the modular unit u_f.
- Brunault, Définition 88 (§3.5): η(l, m) is built from E*_l and E*_m.

**Depends on.** this roadmap: `ER.7/kronecker-limit-formulas`; libraries: `mathlib:UpperHalfPlane`, `mathlib:CongruenceSubgroup.Gamma1`, `mathlib:ZMod.dft`, `mathlib:ModularForm.eta`.

**Needed by.** this roadmap: `ER.7/modular-units-and-their-divisors`, `ER.7/rankin-selberg-integral`, `ER.7/harmonicity-of-eisenstein-series`, `ER.7/eta-form-of-divisors`, `ER.7/regulator-period-inclusion`.

**Sources.**

- `Brunault.These.2005`, §3.1, (3.4) and the paragraph after (3.8), pp. 73-74: “Nous déduisons des affirmations précédentes le prolongement méromorphe des fonctions s ↦ E_(u,v)(z, s) au plan complexe, avec un unique pôle en s = 1, simple et de résidu égal à π/N².” — The continuation and the residue π/N² that fix the regularisation (3.9); formula transcribed from the page image.
- `Brunault.These.2005`, Proposition 71, p. 76: “Proposition 71. Soit f : Z/NZ → C une fonction de somme nulle. La série d'Eisenstein E*_f admet le développement de Fourier” — The Fourier expansion (3.27), for f of sum zero; the formula itself is transcribed in the statement from the page image.

### Kronecker's two limit formulas for the Epstein zeta functions ζ_{a,b}

`ER.7/kronecker-limit-formulas` · lemma · parent packet · added by REV-EllipticRegulators

For z ∈ H: ζ*_{0,0}(z) = 2π(γ − log 2 − log √y − 2 log|η(z)|) with η(z) = e^{πiz/12} Π_{n≥1}(1 − e^{2πinz}); and for (a, b) ∈ (Z/NZ)² − {(0,0)} with representatives (ã, b̃) ∈ Z², ζ*_{a,b}(z) = (2π² b̃²/N²) y − 2π log|ϑ((ã − b̃z)/N, z)|, where ϑ(w, z) = e^{πiz/6}(e^{πiw} − e^{−πiw}) Π_{n≥1}(1 − e^{2πi(w+nz)})(1 − e^{−2πi(w−nz)}). Consequently the Fourier expansions (3.16), (3.17) and (3.19) hold.

**Hypotheses.**

- ζ*_{a,b} is the regularised value (3.8): the pole is subtracted only for (a, b) = (0, 0).
- The second formula does not depend on the chosen representatives (ã, b̃).

**Proof outline.**

1. Siegel's proof of the first limit formula (Poisson summation in n, then the product expansion of η).
2. Siegel's proof of the second limit formula (same method with a character twist).
3. Expand log|η| and log|ϑ| in q to obtain (3.16), (3.17), (3.19).

**Acceptance.**

- The two expressions (3.12) and (3.19) for ζ*_{a,b} agree (checked numerically for N = 11, (a,b) = (3,5), (7,2), z = 0.1 + 0.9i, to 60 digits).
- At N = 1, z = i the first formula gives 2.58498175957925321706589358738.

**Depends on.** libraries: `mathlib:ModularForm.eta`, `mathlib:UpperHalfPlane`.

**Needed by.** this roadmap: `ER.7/real-analytic-eisenstein-series`, `ER.7/regulator-period-inclusion`.

**Sources.**

- `Brunault.These.2005`, §3.1, (3.10) and (3.12), p. 74: “La première formule-limite de Kronecker [69, Thm 1, p. 17] s'écrit ζ*_{0,0}(z) = 2π(γ − log 2 − log √y − 2 log|η(z)|)” — The first limit formula; the second, (3.12), is on the same page; formulas transcribed from the page image.
- `Brunault.These.2005`, §3.1, p. 73: “Dans cette section, nous suivons de près l'exposition remarquable de Siegel [69, pp. 1–73]. Le lecteur pourra y trouver les démonstrations que nous avons omises.” — The source gives no proofs; they are Siegel's (Tata lectures), which were not read: gap.

**Assembly note.** The ER.7 part records the state of this node's proof: *Source proof read; analytic adapter still requested*. Siegel §1 Theorem 1: separate the n=0 lattice row, apply one-dimensional Poisson summation to the power kernel (x²+y²)^(−s), evaluate its nonzero Fourier integrals by branch-cut contour deformation and its zero Fourier integral by the beta function, use exponential bounds for locally uniform continuation, isolate the s=1 pole and sum the logarithmic eta product. This is not the Gaussian/Mellin proof. §3 Theorem 2: for nonintegral characteristics, Abel partial summation establishes locally uniform continuation to Re(s)>1/2; Liouville identifies the twisted partial fractions, geometric series give the logarithmic theta product and Bernoulli term, and quasi-periodicity extends to all nonintegral characteristics. §5 Theorem 3 separately uses the Gaussian theta transformation and a Mellin integral split at 1 for continuation and functional equation. Translate Q=y⁻¹|m+nz|² and summation over both signs to Brunault before using a constant. Mathlib Poisson requires locally uniform norm summability and summable Fourier integrals; prove these for the power kernel in §1 and for Gaussian iterations when following §5. Inputs it names: `mathlib:Real.tsum_eq_tsum_fourier`, `mathlib:ModularForm.eta`, `mathlib:Function.Periodic.qParam`, `mathlib:Function.Periodic.norm_qParam`.

**Assembly note.** The second proof step's "same method with a character twist" is not Siegel's proof. His §3 proves the second formula by Abel summation and Liouville's partial fractions; the Gaussian theta and Mellin argument of his §5 is a third, separate proof of continuation (REV-EllipticRegulators--ER.7). The analytic adapters for these proofs remain the ER.7 part's gap G6.

### The Euler-product identity for Σ T_n σ_{χ1,χ2}(n) n^{-s}

`ER.7/dirichlet-series-convolution` · lemma · parent packet · added by REV-EllipticRegulators

Let ψ be a Dirichlet character mod N and χ1, χ2 arbitrary Dirichlet characters; put σ_{χ1,χ2}(n) = Σ_{d|n} d χ1(d) χ2(n/d). In T^ψ (the ψ-isotypic part of the Hecke algebra T ⊗ C of S2(Γ1(N))), for Re(s) large, Σ_{n≥1} T_n^ψ σ_{χ1,χ2}(n) n^{−s} = L(T^ψ, χ2, s) · L(T^ψ, χ1, s − 1) / L(ψχ1χ2, 2s − 2).

**Hypotheses.**

- The source states the identity for Re(s) > 5/2 using T_n = O(n^{1/2+ε}) (Ramanujan-Petersson in weight two, cited without reference); Hecke's bound T_n = O(n) gives it for Re(s) > 3, which suffices, since both sides are then continued.

**Proof outline.**

1. σ_{χ1,χ2} and n ↦ T_n^ψ n^{−s} are weakly multiplicative, so the left side is an Euler product.
2. Compute σ_{χ1,χ2}(p^a) from multiplicativity (three cases).
3. Sum the local generating series with L_p(T^ψ, X) = (1 − T_p^ψ X + pψ(p)X²)^{−1} to get the local factor (3.50).
4. Take the product over primes, including p | N.

**Acceptance.**

- For N = 1 and χ1 = χ2 = 1 the identity is the classical Rankin identity Σ a_n σ_1(n) n^{−s} = L(f, s)L(f, s − 1)/ζ(2s − 2) for a normalised eigenform f.

**Depends on.** libraries: `mathlib:DirichletCharacter.LFunction`.

**Needed by.** this roadmap: `ER.7/rankin-selberg-integral`.

**Sources.**

- `Brunault.These.2005`, Lemme 77, p. 82: “Lemme 77 (Une convolution de séries de Dirichlet). Soient ψ un caractère de Dirichlet modulo N et χ1, χ2 des caractères de Dirichlet arbitraires.” — The lemma; the identity (3.47) is transcribed in the statement.

### The Rankin-Selberg integral of E*_χ against a weight-two form and ∂̄E*_{χ̂'}

`ER.7/rankin-selberg-integral` · theorem · planet “Rankin–Selberg integral” · parent packet · added by REV-EllipticRegulators

Let χ be an even Dirichlet character mod N, χ' an even Dirichlet character mod a divisor M of N, χ'_N the character mod N induced by χ', and ψ = χ·χ̄'_N. With Ω = 2πi Σ T_n e^{2πinz} dz the universal modular form, ∫_{X1(N)(C)} E*_χ · Ω ∧ ∂̄E*_{χ̂'} = −iπ (φ(N)/M) · L(T^ψ, 2) L(T^ψ, χ', 1) in T^ψ (Théorème 73). In particular, for a primitive weight-two form f of character ψ_f and ω_f = 2πi f(z)dz: ∫ E*_χ · ω_f ∧ ∂̄E*_{χ̂'} = −iπ (φ(N)/M) L(f, 2)L(f, χ', 1) if ψ_f = χ·χ̄'_N, and 0 otherwise (Théorème 72).

**Hypotheses.**

- χ even mod N, χ' even mod M | N; the case M = 1 needs (3.16) in place of (3.27).
- L(f, s), L(f, χ', s) and L(T, s) are the analytically continued L-functions; the value at s = 1 is reached by continuation of I(s).
- The equality is exact, with the factor −iπ φ(N)/M; nothing is claimed up to an algebraic factor.

**Proof outline.**

1. Show the integral lies in T^ψ by the change of variables z ↦ ⟨d⟩z ((3.74), (3.75)).
2. Replace E*_χ by E_χ(·, s) (Stokes and moderate growth at the cusps) and write E_χ(z, s) = 2L(χ, 2s) Σ_{γ∈Γ∞\Γ0(N)} χ(γ) Im(γz)^s.
3. Unfold to ∫_{Γ∞\H} and use the constant term (3.43) of F, computed from (3.27): I(s) = −(16π³iφ(N)/M) Γ(s+1)(4π)^{−s−1} L(χ, 2s) Σ c_n n^{−s−1}.
4. Apply ER.7/dirichlet-series-convolution with χ1 = χ', χ2 = 1, cancel L(χ, 2s), continue, and set s = 1.
5. Project to a primitive f to get Théorème 72; sum over χ to get Théorème 74.

**Acceptance.**

- Théorème 72 is the first step of Théorème 3 (ER.7/cycle-formula), which checker C verified numerically for N = 11 and the four even non-trivial χ = χ' (so that ψ = 1).
- The integral vanishes unless ψ_f = χ χ̄'_N (character orthogonality).

**Depends on.** this roadmap: `ER.7/real-analytic-eisenstein-series`, `ER.7/dirichlet-series-convolution`; layers of other roadmaps: `ModularCurvesPartII:R12.5`; libraries: `mathlib:DirichletCharacter.LFunction`.

**Needed by.** this roadmap: `ER.7/explicit-beilinson-theorem-degeneracy`, `ER.7/cycle-formula`, `ER.7/regulator-period-inclusion`.

**Sources.**

- `Brunault.These.2005`, Théorème 72, p. 78: “Théorème 72. Sous les hypothèses précédentes, notons ψ le caractère de f et χ'_N le caractère modulo N induit par χ'.” — The statement; the identity (3.31), with the condition ψ = χ χ̄'_N read from the page image, is transcribed in the node statement.
- `Brunault.These.2005`, Théorème 73, p. 78: “Théorème 73. Soient χ un caractère de Dirichlet pair modulo N et χ' un caractère de Dirichlet pair modulo un diviseur M de N. Posons ψ = χ χ̄'_N.” — The Hecke-algebra version (3.37), proved on pp. 79-83.

### The Manin-Drinfeld theorem for X1(N)

`ER.7/manin-drinfeld` · theorem · planet “Manin–Drinfeld theorem” · parent packet · added by REV-EllipticRegulators

For N ≥ 1 the divisor map div ⊗ Q : O*(Y1(N)(C)) ⊗ Q → Div⁰(P_N) ⊗ Q is surjective, where P_N is the set of cusps of X1(N)(C); equivalently every degree-zero divisor supported on the cusps has finite order in Pic⁰(X1(N)(C)). Hence 0 → C* ⊗ C → O*(Y1(N)(C)) ⊗ C → Div⁰(P_N) ⊗ C → 0 is exact, and u ↦ û(∞) (the leading q-coefficient at ∞) splits it.

**Hypotheses.**

- The coefficients are rational (⊗ Q) or complex (⊗ C); no statement is made integrally.
- The cusps are all cusps of X1(N)(C); their fields of definition are those of ModularCurvesPartII R12.6.

**Proof outline.**

1. Identify degree-zero cuspidal divisor classes with points of the Jacobian (Abel-Jacobi).
2. Show that for a prime ℓ ∤ N the Hecke operator T_ℓ acts on the cuspidal classes through 1 + ℓ⟨ℓ⟩, while on the Jacobian T_ℓ − 1 − ℓ⟨ℓ⟩ is an isogeny because |a_ℓ(f)| ≤ 2√ℓ < 1 + ℓ for every newform (Eichler-Shimura relation and the Weil bound).
3. Conclude that the cuspidal classes are killed by a non-zero integer.
4. Deduce the exact sequence and its splitting by û(∞) (the source's (3.59), (3.61)).

**Acceptance.**

- div ⊗ Q is surjective onto Div⁰(P_N) ⊗ Q.
- For N = 11: X1(11) is the curve y² + y = x³ − x², its five rational cusps P_v are O, (1,0), (0,−1), (0,0), (1,−1) (the source's (3.152)), and they form the subgroup E(Q) of order 5, so every degree-zero divisor on them has order dividing 5.

**Depends on.** layers of other roadmaps: `ModularCurvesPartII:R12.3`, `ModularCurvesPartII:R14.1`, `ModularCurvesPartII:R14.6`, `WeilConjectures:WC.5`.

**Needed by.** this roadmap: `ER.7/modular-units-and-their-divisors`, `ER.7/spanning-for-prime-level`, `ER.7/constant-symbol-regulator-correction`.

**Sources.**

- `Brunault.These.2005`, §3.3, (3.58)-(3.59), p. 85: “Le théorème de Manin-Drinfel'd [28, 29] énonce que l'application naturelle div ⊗ Q : O*(Y1(N)(C)) ⊗ Q → Div0(P_N) ⊗ Q est surjective.” — The statement used; the source cites Manin (1972) and Drinfeld (1973) and gives no proof: gap.

**Assembly note.** The ER.7 part records the state of this node's proof: *Proof reduced to explicit supplier contracts*. SS 3.4.0 supplies the complete spectral separation proof; the fresh cuspidal-hecke-separation node isolates its key ingredient. Componentwise degree-zero cusps become torsion over the generic curve. This says nothing about bad-fibre integral units. Inputs it names: `ER.7/cuspidal-hecke-separation`.

**Assembly note.** The parent's ninth gap (no proof source read) is answered: the ER.7 part reads Schappacher–Scholl 3.4.0 and isolates the Hecke separation as `ER.7/cuspidal-hecke-separation`, with suppliers R12.5 and R14.6.

### E*_f is smooth and harmonic on Y1(N)(C)

`ER.7/harmonicity-of-eisenstein-series` · lemma · parent packet · added by REV-EllipticRegulators

For f : Z/NZ → C of sum zero, E*_f descends to a C^∞ function on the Riemann surface Y1(N)(C) = Γ1(N)\H with ∂∂̄E*_f = 0, including at the elliptic points.

**Hypotheses.**

- Sum zero is needed for the decomposition E*_f = E1 + E2 into holomorphic and antiholomorphic parts read off from (3.27).

**Proof outline.**

1. Γ1(N)-invariance from (3.15).
2. Write E*_f = E1 + E2 using (3.27).
3. At a point of ramification index n, compare the local coordinates v = u^n and show E1, E2 are separately invariant under u ↦ ζ_n u, hence descend.

**Acceptance.**

- ∂∂̄E*_f = 0 on Y1(N)(C).

**Depends on.** this roadmap: `ER.7/real-analytic-eisenstein-series`; layers of other roadmaps: `ModularCurvesPartII:R12.3`.

**Needed by.** this roadmap: `ER.7/modular-units-and-their-divisors`.

**Sources.**

- `Brunault.These.2005`, Lemme 78, p. 84: “Lemme 78. Pour toute application f : Z/NZ → C de somme nulle, la série d'Eisenstein E*_f induit une fonction Y1(N)(C) → C de classe C∞, qui vérifie ∂∂̄E*_f = 0.” — The lemma, verbatim up to typography.

### The divisors of u_χ and u_χ̂

`ER.7/divisors-of-character-units` · lemma · parent packet · added by REV-EllipticRegulators

Let χ be a Dirichlet character mod N. If χ is even and non-trivial, u_χ is defined and div u_χ = −(L(χ, 2)/π²) Σ_{v∈(Z/NZ)*/±1} χ(v)·P_v, with P_v = [0, v] = ⟨v⟩∞; in particular u_χ is supported on the ⟨·⟩-orbit of ∞. If χ is even and N > 1, u_χ̂ is defined and ord_P(u_χ̂) = 0 unless N_χ | d = (u, N), in which case it equals −((φ(N)/N)/(φ(d)/d)) Σ_{β∈(Z/dZ)*} B̄2(β̃/d) χ_d(β v_d) for P = [u, v]; if χ is primitive, div u_χ̂ = τ(χ)·div u_χ. Moreover E*_χ(⟨d⟩z) = χ(d) E*_χ(z).

**Hypotheses.**

- χ even; non-trivial for u_χ (sum zero), N > 1 for u_χ̂.
- L(χ, 2) is Mathlib's DirichletCharacter.LFunction χ 2 (the series converges).

**Proof outline.**

1. Insert f = χ into (3.63); the sum over a vanishes unless u = 0.
2. For P = [0, v] evaluate Σ_b χ̂(bv) B̄2(b̃/N) through the Fourier series of B̄2 to get −χ(v)L(χ, 2)/π².
3. For u_χ̂ compute S(u, v) = Σ_{au+bv=1} B̄2(b̃/N) with the distribution relation of B̄2 ((3.78)-(3.80)).
4. For χ primitive use χ̂ = τ(χ)χ̄ and C-linearity of f ↦ div u_f.

**Acceptance.**

- N = 5, χ = (·/5): L(χ, 2) = 4π²/(25√5) = 0.706211403259740969931…, so div u_χ = −(4/(25√5))(P_1 − P_2) = −0.0715541752799932702…·(P_1 − P_2).
- For χ odd, E*_χ = 0 and u_χ = 1.

**Depends on.** this roadmap: `ER.7/modular-units-and-their-divisors`; libraries: `mathlib:DirichletCharacter.LFunction`, `mathlib:gaussSum`, `mathlib:ZMod.dft`.

**Needed by.** this roadmap: `ER.7/symbols-of-modular-units-in-K2`, `ER.7/the-X1-11-example`.

**Sources.**

- `Brunault.These.2005`, Proposition 80, p. 88: “Proposition 80. Soit χ un caractère de Dirichlet modulo N, pair et non trivial i. e. vérifiant χ(−1) = 1 et χ ≠ 1. Alors u_χ est définie et nous avons div u_χ = −(L(χ, 2)/π²) Σ_{v∈(Z/NZ)*/±1} χ(v) · P_v.” — Formula (3.76) transcribed from the page image; (3.77) is on the same page.

### u_f is defined over Q with coefficients in Q(f̂)

`ER.7/rationality-of-modular-units` · lemma · parent packet · added by REV-EllipticRegulators

For f : Z/NZ → C of sum zero, u_f ∈ O*(Y1(N)) ⊗ Q(f̂) ⊂ O*(Y1(N)(C)) ⊗ C, where Y1(N) is the model over Q in which the cusp ∞ is rational and Aut(C/Q) acts on cusps by [u, v]^σ = [ε(σ)^{−1}u, v] (σ(ζ_N) = ζ_N^{ε(σ)}).

**Hypotheses.**

- The model is the one of Diamond-Im Variant 9.3.6 (∞ rational); with the other standard model the statement changes by the Atkin-Lehner involution.
- Q(f̂) is the field generated by the values of f̂.

**Proof outline.**

1. ord_P(u_f) ∈ Q(f̂) by (3.63) and is Galois-invariant by the substitution a = ε(σ)a' in (3.63).
2. The exact sequence over Q (exact on the right by Hilbert 90) maps injectively to the one over C, compatibly with the splittings by û(∞).
3. Hence u_f is the image of a Galois-invariant divisor under the rational splitting.

**Acceptance.**

- For χ even non-trivial with values in Q(ζ_{φ(N)}), u_χ is defined over Q with coefficients in Q(χ̂) ⊆ Q(μ_N, χ).
- For N = 11 the cusps P_v are rational points of X1(11) (the source's (3.152)).

**Depends on.** this roadmap: `ER.7/modular-units-and-their-divisors`; layers of other roadmaps: `ModularCurvesPartII:R12.6`, `ModularCurvesPartII:R12.3`.

**Needed by.** this roadmap: `ER.7/the-pushforward-and-its-hypotheses`, `ER.7/symbols-of-modular-units-in-K2`.

**Sources.**

- `Brunault.These.2005`, Lemme 85, p. 94: “Lemme 85. Pour toute fonction f : Z/NZ → C de somme nulle, l'unité modulaire u_f est définie sur Q et à coefficients dans Q(f̂), le corps engendré par les valeurs de f̂.” — The lemma; the Galois action (3.93) on cusps is quoted in the source from Schappacher-Scholl [62, 3.0.2].

### Symbols of character units lie in K2 of the complete curve

`ER.7/symbols-of-modular-units-in-K2` · theorem · parent packet · added by REV-EllipticRegulators

Let f, g : Z/NZ → C have sum zero and support in (Z/NZ)*, and let L be the field generated by the values of f̂ and ĝ. Then the symbol {u_f, u_g} ∈ K2(Q(X1(N))) ⊗ L has trivial tame symbol at every closed point of X1(N), hence lies in K2(X1(N)) ⊗ L (via the rational injectivity of K2 of a curve over a number field into K2 of its function field). In particular {u_χ, u_χ'} ∈ K2(X1(N)) ⊗ C for all even non-trivial χ, χ' mod N; and {u, v} ∈ K2(X1(N)) ⊗ Q for u, v ∈ O*(Y1(N)) ⊗ Q supported on the cusps P_w with û(∞) = v̂(∞) = 1.

**Hypotheses.**

- Support in (Z/NZ)* is essential: for f not supported there the tame symbols of {u_f, u_g} need not be trivial (Remarque 87), which is why Théorème 81's symbol {u_χ, α*u_χ̂'} is not asserted to lie in K2(X1(N)) unless χ' is primitive mod N.
- The tame symbol is K2SymbolsBrauer's ∂_P{f, g} = (−1)^{ord f · ord g} (f^{ord g}/g^{ord f})(P), which is the source's (3.87).

**Proof outline.**

1. By bilinearity reduce to f = χ, g = χ' even non-trivial (u_χ = 1 for χ odd).
2. Show ⟨d⟩*u_χ = u_χ ⊗ χ(d): the constant C_d is a homomorphism from a finite group to a Q-vector space, hence trivial.
3. Since u_χ, u_χ' are supported on the cusps P_w = ⟨w⟩∞, reduce to the tame symbol at ∞: ∂_{P_w}{u_χ, u_χ'} = ∂_∞{u_χ, u_χ'} ⊗ χχ'(w).
4. ∂_∞{u_χ, u_χ'} = 1 because û_χ(∞) = û_χ'(∞) = 1.
5. Conclude with the localisation sequence and rational injectivity.

**Acceptance.**

- The tame symbols of {u_χ, u_χ'} vanish at every cusp.
- On X1(11) = 11a3 the symbol {x, y} (x, y supported on the five cusps) has tame values −1, −1, 1, 1 at (0,0), (0,−1), (1,0), O, so 2{x, y} lies in the kernel (EllipticKTheory:E.7/symbol-certificates acceptance).

**Depends on.** this roadmap: `ER.7/modular-units-and-their-divisors`, `ER.7/divisors-of-character-units`, `ER.7/rationality-of-modular-units`; other roadmaps: `EllipticKTheory:E.3/what-the-sequence-does-not-identify`, `EllipticKTheory:E.3/the-tame-symbol-boundary`, `K2SymbolsBrauer:T.3/tame-symbol`.

**Needed by.** this roadmap: `ER.7/the-regulator-integral-and-its-evaluation`, `ER.7/spanning-for-prime-level`, `ER.7/manin-cycle-and-its-boundary`, `ER.8/the-conductor-14-example`.

**Sources.**

- `Brunault.These.2005`, Proposition 86, p. 95: “Proposition 86. Soient f, g : Z/NZ → C deux fonctions de somme nulle et à support dans (Z/NZ)*. Notons L le sous-corps de C engendré par les valeurs de f̂ et ĝ. Alors l'élément {u_f, u_g} appartient à K2(X1(N)) ⊗ L.” — The proposition, which the introduction states for characters (p. 11).
- `Brunault.These.2005`, Remarque 87, p. 96: “Remarque 87. Lorsque f ou g n'est pas à support dans (Z/NZ)*, tous les symboles modérés de {u_f, u_g} ne semblent pas nécessairement triviaux.” — Why the support hypothesis is kept.

**Assembly note.** The parent packet marks this node as the planet “Modular-unit symbols in K2(X1(N))”; the ER.7 part's accepted rescope proposal removes that planet.

- The generic bilinear pair-symbol interface for Siegel units belongs to an early prefix of KatoEulerSystems L1 (the parent's fourteenth gap and the ER.7 part's gap G1).
- At full level, the ER.7 part shows that a compact correction by constant-unit symbols leaves the regulator unchanged (`ER.7/constant-symbol-regulator-correction`).
- Schappacher–Scholl §7 supplies the integrality that this node's hypotheses quoted without proof (`ER.7/full-level-modular-symbol-integrality`, `ER.7/integral-beilinson-subspace`).

### The regulator of {u_χ, α*u_χ̂'}: the general explicit formula

`ER.7/explicit-beilinson-theorem-degeneracy` · theorem · parent packet · added by REV-EllipticRegulators

Let f be a primitive weight-two cusp form for Γ1(N) of character ψ, χ an even non-trivial character mod N, χ' an even character mod a divisor M > 1 of N, α : Y1(N)(C) → Y1(M)(C) the degeneracy map induced by the identity of H, and χ'_N the induced character mod N. With r_N({u, v}, f) = ∫_{X1(N)(C)} log|u| · ω_f ∧ ∂̄ log|v| and ω_f = 2πi f(z)dz: r_N({u_χ, α*u_χ̂'}, f) = (φ(N)/(Mπi)) L(f, 2)L(f, χ', 1) if ψ = χ χ̄'_N, and 0 otherwise. The symbol is an element of K2 of the FUNCTION FIELD tensored with C; it is not asserted to lie in K2(X1(N)) ⊗ C unless M = N and χ' is primitive.

**Hypotheses.**

- χ non-trivial and M > 1 are exactly what make u_χ and u_χ̂' defined (Proposition 80).
- The regulator is the source's (3.82); the published normalisation (Bull. SMF 2007, (3)) is r̂_N({u, v})(ω) = ∫ η(u, v) ∧ ω, and r_N = (i/2) r̂_N by (3.110).

**Proof outline.**

1. log|u_χ| = E*_χ/π and log|α*u_χ̂'| = E*_χ̂'/π (Proposition 79 at levels N and M).
2. Hence r_N({u_χ, α*u_χ̂'}, f) = π^{−2} ∫ E*_χ · ω_f ∧ ∂̄E*_χ̂'.
3. Apply ER.7/rankin-selberg-integral (Théorème 72).

**Acceptance.**

- The proportionality factor is φ(N)/(Mπi), with no unspecified algebraic factor.
- It vanishes unless the characters match.

**Depends on.** this roadmap: `ER.7/rankin-selberg-integral`, `ER.7/modular-units-and-their-divisors`, `ER.2/the-regulator-on-symbols`; layers of other roadmaps: `ModularCurvesPartII:R14.1`, `ModularCurvesPartII:R12.6`.

**Needed by.** this roadmap: `ER.7/the-regulator-integral-and-its-evaluation`, `ER.7/spanning-for-prime-level`.

**Sources.**

- `Brunault.These.2005`, Théorème 81, p. 91: “Théorème 81. Soit f une forme parabolique primitive de poids 2 pour Γ1(N), de caractère ψ. Soient χ un caractère de Dirichlet pair modulo N et χ' un caractère de Dirichlet pair modulo un diviseur M de N. Supposons χ non trivial et M > 1.” — The hypotheses; the formula (3.83) is transcribed in the statement from the page image.

### The regulator of Q-rational symbols takes values in T ⊗ R(1)

`ER.7/real-structure-of-the-regulator` · lemma · parent packet · added by REV-EllipticRegulators

The composite K2(Q(X1(N))) → K2(C(X1(N))) → T ⊗ C, {f, g} ↦ ∫ log|f| · Ω ∧ ∂̄ log|g|, takes values in T ⊗ R(1) = T ⊗ 2πiR; hence the Beilinson regulator r_N : K2(X1(N)) ⊗ Q → V_N := T ⊗ R(1).

**Hypotheses.**

- f, g are defined over Q (in the model with ∞ rational), so c*f = f̄ and c*g = ḡ for complex conjugation c : z ↦ −z̄.

**Proof outline.**

1. Substitute c in the integral; c reverses orientation.
2. c*Ω = Ω̄ from the q-expansion of Ω.
3. Conclude r_N{f, g} = −conj(r_N{f, g}).

**Acceptance.**

- For N = 11, T ⊗ C = C and V_11 = 2πiR; the class {x, y} + {−1, x} on 11a3 has regulator −(5i/4)D_E(P)·Ω_f^+ against ω_f (see ER.8/the-integrality-worked-example), purely imaginary.

**Depends on.** this roadmap: `ER.2/the-regulator-on-symbols`; layers of other roadmaps: `ModularCurvesPartII:R12.6`.

**Needed by.** this roadmap: `ER.7/spanning-for-prime-level`, `ER.7/beilinson-rational-structure`.

**Sources.**

- `Brunault.These.2005`, Lemme 83, p. 92: “Lemme 83. La composition K2(Q(X1(N))) → K2(C(X1(N))) → T ⊗ C est à valeurs dans T ⊗ R(1) = T ⊗ 2πiR.” — The lemma, verbatim up to typography.

### Modular-unit symbols span the regulator target for X1(p)

`ER.7/spanning-for-prime-level` · theorem · parent packet · added by REV-EllipticRegulators

For every prime p, the real vector space V_p = T ⊗ R(1) is spanned by r_p(K_p), where K_p ⊂ K2(X1(p)) ⊗ Q is the subspace of symbols {u, v} of modular units u, v ∈ O*(Y1(p)) lying in the kernel of the tame symbol. The analogous statement for Γ0(p) is false when X0(p) has positive genus.

**Hypotheses.**

- This is a spanning (surjectivity) statement for the regulator restricted to a constructed subspace. It is not the statement that the regulator is injective on K2(X1(p))_Z ⊗ Q, and it gives no rank of K2: it is not a conclusion of the third kind of ER.6.

**Proof outline.**

1. Use the units u_α (α ∈ (Z/pZ)*) with div u_α = P_α − P_1 and û_α(∞) = 1 (Manin-Drinfeld); {u_α, u_β} ∈ K_p by ER.7/symbols-of-modular-units-in-K2.
2. Express r_p{u_χ, u_χ'} as a combination of the r_p{u_α, u_β} (Proposition 80) and evaluate it by Théorème 81: it is (p−1)/(pπi τ(χ')) · L(T^{χχ'}, 2)L(T^{χχ'}, χ', 1).
3. L(T^ψ, 2) is invertible in T^ψ (L(f, 2) ≠ 0 by the Euler product).
4. Show the L(T^ψ, χ, 1), χ even ≠ 1, ψ, span T^ψ: identify T^ψ with H1^+(X1(p)(C), ψ) and L(T, χ, 1) with the cycle −(τ(χ)/p) W_p ξ(1, χ); prove these cycles are closed and span, by Manin's presentation of relative homology and the boundary computation (3.101).

**Acceptance.**

- The published version (Bull. SMF 2007, Théorème 1.4) states the same result.

**Depends on.** this roadmap: `ER.7/explicit-beilinson-theorem-degeneracy`, `ER.7/symbols-of-modular-units-in-K2`, `ER.7/manin-drinfeld`, `ER.7/real-structure-of-the-regulator`; layers of other roadmaps: `ModularSymbolsPadicLFunctions:L1`.

**Sources.**

- `Brunault.These.2005`, Théorème 5, p. 93 (proof pp. 96-98): “Théorème 5. Pour tout nombre premier p, l'espace vectoriel réel V_p est engendré par r_p(K_p).” — The theorem; stated also on p. 11.
- `Brunault.BSMF.2007`, Théorème 1.4, p. 218: “Théorème 1.4. — Lorsque N = p est premier, le groupe r_p(K_p) engendre V_p.” — The version of record.

**Assembly note.** Schappacher–Scholl's rational structure at every level is `ER.7/beilinson-rational-structure` (ER.7 part). This node remains Brunault's explicit prime-level statement.

### The forms η(l, m) of two divisors on Z/NZ and their differential

`ER.7/eta-form-of-divisors` · construction · parent packet · added by REV-EllipticRegulators

For divisors (functions) l, m on Z/NZ put η(l, m) = E*_l · (∂ − ∂̄)E*_m − E*_m · (∂ − ∂̄)E*_l, a Γ1(N)-invariant one-form on Y1(N)(C). Then dη(l, m) = (πi/N²) E*_{D(l,m)} · dx ∧ dy/y² with D(l, m) = (deg m)l − (deg l)m; for l, m of degree zero η(l, m) = π²i · η(u_l, u_m) is closed, where η(f, g) = log|f| d arg g − log|g| d arg f; and ∫_{X1(N)(C)} E*_l · ω_f ∧ ∂̄E*_m = −(1/2) ∫ ω_f ∧ η(l, m) for every weight-two cusp form f.

**Hypotheses.**

- The last identity uses integration by parts and the moderate growth of E*_l E*_m ω_f at the cusps.

**Construction.**

1. Compute dη from ∂∂̄E*_l = −(πi/(2N²))(deg l) dx ∧ dy/y² (from (3.16)-(3.19) and (1.32)).
2. For degree zero, compare with η(u_l, u_m) using log|u_l| = E*_l/π.
3. Integrate by parts for the last identity (Lemme 90).

**API.**

- `etaDiv` (data): η(l, m) as a one-form on H.
- `etaDiv_antisymm` (relation): η(l, m) = −η(m, l).
- `etaDiv_bilinear` (structure): η is C-bilinear in (l, m).
- `d_etaDiv` (characterisation): dη(l, m) = (πi/N²) E*_{D(l,m)} dx ∧ dy/y².
- `etaDiv_eq_units` (compatibility): For deg l = deg m = 0, η(l, m) = π²i η(u_l, u_m).
- `integral_eisenstein_eq_etaDiv` (relation): ∫ E*_l ω_f ∧ ∂̄E*_m = −(1/2)∫ ω_f ∧ η(l, m) (Lemme 90).

**Unit tests.**

- `etaDiv_closed_degree_zero` (characterisation): For l = [1] − [2] and m = [1] − [3] on Z/5Z, dη(l, m) = 0.
- `etaDiv_not_closed` (non-example): For l = [1] and m = [2] on Z/NZ, N ≥ 5 (so that 2 ≢ ±1; for N = 3, E*_{(0,2)} = E*_{(0,1)} and the form is closed), dη(l, m) = (πi/N²) E*_{[1]−[2]} dx∧dy/y², which is not zero.
- `etaDiv_self` (degenerate): η(l, l) = 0.
- `etaDiv_units_compat` (compatibility): For χ, χ' even non-trivial, η(χ, χ') = π²i η(u_χ, u_χ') with η(u, v) = log|u| d arg v − log|v| d arg u, the form of Polylogarithms:P.5/weight-two-regulator-form.

**Acceptance.**

- η(l, m) = −η(m, l).
- dη(l, m) = 0 iff D(l, m) has E*_{D(l,m)} = 0, in particular when deg l = deg m = 0.

**Uses.**

- Brunault, Définition 91 and Théorème 93: The coefficients of the cycle c(l, m) are the integrals of η(l, m) along the geodesics g_xρ → g_xρ².
- Brunault, Théorèmes 1, 3, 97: The periods of η(1, χ̂) and η_χ are the explicit numbers in the formulas for L(E, 2).

**Depends on.** this roadmap: `ER.7/real-analytic-eisenstein-series`, `ER.7/modular-units-and-their-divisors`, `ER.2/the-eta-form-and-its-differential-identity`.

**Needed by.** this roadmap: `ER.7/manin-cycle-and-its-boundary`, `ER.7/unfolding-over-the-fundamental-domain`, `ER.7/cycle-formula`.

**Sources.**

- `Brunault.These.2005`, Définition 88 and Lemme 89, p. 101: “Définition 88. Soient l, m deux diviseurs sur Z/NZ, la forme différentielle η(l, m) sur H est définie par η(l, m) = E*_l · (∂ − ∂̄)E*_m − E*_m · (∂ − ∂̄)E*_l.” — The definition; Lemme 89 (3.113)-(3.114) and (3.112) are on the same page, Lemme 90 on p. 102.

### The relative cycle c(l, m) and its boundary

`ER.7/manin-cycle-and-its-boundary` · construction · parent packet · added by REV-EllipticRegulators

For divisors l, m on Z/NZ put c(l, m) = (1/4) Σ_{x∈E_N} (∫_{g_xρ}^{g_xρ²} η(l, m)) ξ(x) ∈ H1(X1(N)(C), P_N, C), where E_N is the set of elements of order N of (Z/NZ)², g_x ∈ SL2(Z) has bottom row ≡ x, ρ = e^{πi/3}, the integral is along the geodesic, and ξ(x) = {g_x0, g_x∞} is the Manin symbol. For l, m of degree zero, ∂c(l, m) = −2π³i Σ_{P∈P_N} log|∂_P{u_l, u_m}| · [P]; in particular c(l, m) is closed when {u_l, u_m} has trivial tame symbols (for instance l = ψχ, m = χ̂ with χ primitive).

**Hypotheses.**

- The integral ∫_{g_xρ}^{g_xρ²} η(l, m) depends only on x (Γ1(N)-invariance of η and of geodesics).

**Construction.**

1. Write ∂c as a sum over cusps of integrals of η over the cycles γ_P = Σ_{x above P} {g_xρ, g_xρ²}.
2. Show γ_P is a negatively oriented loop around P (telescoping with T^{l_P}).
3. Apply (3.109): the integral of η(f, g) around P is 2π log|∂_P{f, g}|, and (3.112).

**API.**

- `maninCycle` (data): c(l, m) as a relative 1-cycle with complex coefficients.
- `maninCycle_boundary` (characterisation): ∂c(l, m) = −2π³i Σ_P log|∂_P{u_l, u_m}|[P] for degree-zero l, m.
- `maninCycle_bilinear` (structure): c is C-bilinear in (l, m).

**Unit tests.**

- `maninCycle_closed_primitive` (characterisation): For χ primitive even mod N and ψχ non-trivial, ∂c(ψχ, χ̂) = 0.
- `maninCycle_zero` (degenerate): c(l, 0) = 0.
- `maninCycle_odd` (non-example): For l odd, E*_l = 0, so c(l, m) = 0: an odd divisor gives no cycle.

**Acceptance.**

- If the tame symbols of {u_l, u_m} vanish, c(l, m) ∈ H1(X1(N)(C), C).

**Uses.**

- Brunault, Théorème 93 and Remarque 95: ∫_{c(ψχ, χ̂)} ω_f computes L(f, 2)L(f, χ, 1) up to N/(2πiφ(N)).

**Depends on.** this roadmap: `ER.7/eta-form-of-divisors`, `ER.7/symbols-of-modular-units-in-K2`.

**Needed by.** this roadmap: `ER.7/unfolding-over-the-fundamental-domain`.

**Sources.**

- `Brunault.These.2005`, Définition 91 and Proposition 92, p. 103: “Proposition 92. Pour tous diviseurs l et m de degré 0 sur Z/NZ, le bord du cycle c(l, m) est donné par ∂c(l, m) = −2π³i Σ_{P∈P_N} log|∂_P{u_l, u_m}| · [P]” — The boundary formula (3.118); Définition 91 (3.117) is on the same page.

### The integral of ω_f ∧ η(l, m) as a period over c(l, m)

`ER.7/unfolding-over-the-fundamental-domain` · theorem · parent packet · added by REV-EllipticRegulators

Let f be a weight-two cusp form for Γ1(N) and l, m divisors on Z/NZ; put F_x(z) = ∫_∞^z ω_f|g_x. Then ∫_{X1(N)(C)} ω_f ∧ η(l, m) = ∫_{c(l,m)} ω_f − ∫_F Σ_{x∈E_N/±1} F_x · d(η(l, m)|g_x), with F the standard fundamental domain. For l, m of degree zero, ∫ ω_f ∧ η(l, m) = ∫_{c(l,m)} ω_f = −(π/2) Σ_{x∈E_N} (∫_{g_xρ}^{g_xρ²} η(l, m)) ξ_f(x), where ξ_f(x) = −i ∫_{g_x0}^{g_x∞} f(z)dz.

**Hypotheses.**

- The extra term depends only on f and D(l, m); the source could not remove it (Remarque 94), which is why characters are restricted later.

**Proof outline.**

1. Decompose X1(N)(C) into the translates g_xF.
2. Stokes on F: ∫_F ω_f ∧ η|g_x = ∫_{∂F} F_x η|g_x − ∫_F F_x dη|g_x.
3. The two vertical sides cancel after summing over x (T maps ρ² to ρ, F_x∘T = F_{xT}).
4. On the arc ρ² → ρ use σ and F_x(σz) = F_{xσ}(z) + 2πξ_f(x).

**Acceptance.**

- For l, m of degree zero the correction term vanishes (Lemme 89).

**Depends on.** this roadmap: `ER.7/eta-form-of-divisors`, `ER.7/manin-cycle-and-its-boundary`.

**Needed by.** this roadmap: `ER.7/cycle-formula`.

**Sources.**

- `Brunault.These.2005`, Théorème 93, p. 104: “Théorème 93. Soient f une forme parabolique de poids 2 pour Γ1(N) et l, m deux diviseurs sur Z/NZ.” — The hypotheses; (3.122)-(3.123) are transcribed in the statement from pp. 104-105. The source says the proof follows Merel's Théorème C of the appendix.

### Théorème 3: L(f, 2)L(f, χ, 1) through geodesic periods and Manin symbols

`ER.7/cycle-formula` · theorem · parent packet · added by REV-EllipticRegulators

Let f be a primitive weight-two form for Γ1(N) of character ψ and χ an even Dirichlet character mod N distinct from ψ̄. Then L(f, 2)L(f, χ, 1) = (N i/4) Σ_{x∈E_N} (∫_{g_xρ}^{g_xρ²} η(1, χ̂)) ξ_f^+(x), where 1 is the divisor [1̄], η(1, χ̂) = Σ_b χ̂(b) η(1, b), ξ_f^±(x) = (ξ_f(x) ± ξ_f(x^c))/2 and x^c = (−u, v). Equivalently L(f, 2)L(f, χ, 1) = (N/(2πiφ(N))) ∫_{c(ψχ, χ̂)} ω_f.

**Hypotheses.**

- χ ≠ ψ̄ makes ψχ of degree zero; χ̂ has degree zero because N > 1.
- No primitivity is needed (contrast Théorème 4).

**Proof outline.**

1. Théorème 72 and Lemme 90 give L(f,2)L(f,χ,1) = (N/(2πiφ(N))) ∫ ω_f ∧ η(ψχ, χ̂).
2. Apply ER.7/unfolding-over-the-fundamental-domain (degree zero).
3. Show ∫_{c(ε, χ̂)} ω_f = 0 for ε ≠ ψχ by the ⟨d⟩-equivariance of η and ξ_f; sum over all ε to replace ψχ by the divisor 1.
4. Symmetrise with x ↦ x^c using c*η(l, m) = −η(l, m).

**Acceptance.**

- Verified numerically for N = 11 (f the newform of 11a, ψ = 1) and the four even non-trivial χ, in the form (3.144) with ξ_f^+ computed from its definition: both sides agree to 38 digits (checker C, scripts thm1.gp and thm3.gp).

**Depends on.** this roadmap: `ER.7/rankin-selberg-integral`, `ER.7/unfolding-over-the-fundamental-domain`, `ER.7/eta-form-of-divisors`.

**Needed by.** this roadmap: `ER.7/the-explicit-theorem-for-an-elliptic-curve`, `ER.7/rational-combination-for-L-E-2`.

**Sources.**

- `Brunault.These.2005`, Corollaire (Théorème 3), p. 106: “Corollaire (Théorème 3). Soit f une forme parabolique primitive de poids 2 pour Γ1(N), de caractère ψ. Pour tout caractère de Dirichlet χ modulo N, pair et distinct de ψ̄, nous avons” — The hypotheses as printed (the bar over ψ read from the page image); formula (3.124) is transcribed in the statement.

### An even non-trivial character mod N with L(f, χ, 1) ≠ 0 (elliptic case)

`ER.7/nonvanishing-of-a-twisted-value` · theorem · parent packet · added by REV-EllipticRegulators

Let f be the newform attached to an elliptic curve E/Q of conductor N > 1. There is an even non-trivial Dirichlet character χ mod N with L(f, χ, 1) ≠ 0. For a primitive weight-two form of arbitrary character, Merel's Corollaire 2 gives only a primitive character (even or odd, as chosen) of conductor dividing N with L(f ⊗ χ, 1) ≠ 0; it does not give a primitive character mod N, and for N ≡ 2 mod 4 there is none. Hence this node does NOT make Théorème 4 applicable in general.

**Hypotheses.**

- The elliptic case uses rational coefficients (a_2 ∈ Z, Hasse bound), the Atkin-Lehner sign w(f) and Merel's Théorème A (ξ_f^+ homogeneous under (Z/NZ)* if every even primitive twist vanishes).

**Proof outline.**

1. Suppose every even non-trivial χ mod N has L(f, χ, 1) = 0; by Merel's Corollaire 2 the trivial character is the only even primitive one with non-zero twisted value, so ξ_f^+(λu, v) = ξ_f^+(u, λv) = ξ_f^+(u, v) (Théorème A).
2. N odd: T_2 on ξ(0, 1) and the Manin relation ξ(1, 1) = 0 give (a_2(f) − 3)ξ_f^+(0, 1) = 0, impossible since |a_2| ≤ 2√2 and L(f, 1) ≠ 0.
3. N = 2N', N' odd: the T_2 relations force a_2(f) = 1 and ξ_f^+(1, 2t) constant, contradicting L(f, 1_{N'}, 1) ≠ 0.
4. 4 | N: a_2(f) = 0 and the function F(n) of (3.140) gives F(2) = 2, contradicting F(2) = −1.

**Acceptance.**

- For N = 11 all four even non-trivial characters have L(f, χ, 1) ≠ 0 (values in ER.7/the-X1-11-example).
- For N = 14 there is no primitive character mod 14 at all, so Théorème 4 has no admissible χ, while this node still gives an even non-trivial χ mod 14 for Théorème 3.

**Depends on.** layers of other roadmaps: `EllipticCurveModularity:R29.6`, `ModularSymbolsPadicLFunctions:L1`.

**Needed by.** this roadmap: `ER.7/the-explicit-theorem-for-an-elliptic-curve`, `ER.7/the-pushforward-and-its-hypotheses`, `ER.7/rational-combination-for-L-E-2`.

**Sources.**

- `Brunault.These.2005`, Lemme 99 and its proof, pp. 110-114: “Démonstration du lemme 99. Il suffit de montrer qu'il existe un caractère de Dirichlet χ_N modulo N, pair et non trivial, tel que L(f, χ_N, 1) ≠ 0.” — The statement proved, by the three cases on v_2(N).
- `Brunault.These.2005`, Appendice (L. Merel), Corollaire 2, p. 145: “Corollaire 2. — Il existe un caractère de Dirichlet primitif χ, qu'on peut choisir pair ou impair, de conducteur divisant N et tel que L(f ⊗ χ, 1) ≠ 0.” — The general non-vanishing input; its proof (from Théorème A) was not read: gap.
- `Brunault.BSMF.2007`, Remarque 1.2, p. 217: “Il serait donc utile de lever l'hypothèse χ primitif dans le théorème 1.1, et de montrer que le caractère χ vérifiant L(f, χ, 1) ≠ 0 peut être supposé distinct de 1 et ψ̄.” — The version of record says the non-vanishing does not yet make Théorème 1.1 (= Théorème 4) applicable.

**Assembly note.** The ER.7 part records the state of this node's proof: *Parity/conductor distinction audited*. Merel Corollary 2 follows from Theorem A, finite Fourier inversion and injectivity of f↦ξ_f^±. For a generic primitive newform it supplies an even or odd primitive character of conductor dividing N, rather than a primitive even character of conductor exactly N avoiding the nebentypus exception. The inherited E/Q specialization remains the conditional finite-level input; SS 2.2.0 uses unrestricted conductor and separately excludes two characters. Inputs it names: `tauceti:TauCetiRoadmap/ModularForms#layer-8-modular-symbols-the-integral-hecke-algebra-and-coefficient-fields`.

### Théorème 97: L(E, 2) is a rational combination of explicit geodesic periods

`ER.7/rational-combination-for-L-E-2` · theorem · planet “L(E,2) from geodesic periods” · parent packet · added by REV-EllipticRegulators

For every elliptic curve E/Q of conductor N, L(E, 2) is a Q-linear combination of the numbers (1/πi) ∫_{g_xρ}^{g_xρ²} η(1, a), x ∈ E_N, a ∈ Z/NZ, which depend only on N.

**Hypotheses.**

- Uses modularity (a newform f ∈ S2(Γ0(N)) with L(E, s) = L(f, s)), the Manin-Drinfeld rationality ξ_f^+(x) ∈ Q·Ω_E^+/(2π) with Ω_E^+ the Néron real period, and Birch's formula L(f, α, 1) = −(1/N) Σ_a α̂(a) ∫_{a/N}^∞ ω_f.

**Proof outline.**

1. Apply Théorème 3 to every even non-trivial χ and extend linearly to m in the span V̂ of the χ̂ (3.132).
2. Lemme 98: V̂ ∩ Q[Z/NZ] is a Q-structure of V̂ (Galois traces of a basis of the trace-zero part of Q(μ_N)).
3. Lemme 99 (ER.7/nonvanishing-of-a-twisted-value): some m ∈ V̂ has ∫_{m/N}^∞ ω_f ≠ 0; choose it rational.
4. Divide by the non-zero rational multiple of Ω_E^+ and use ξ_f^+ ∈ QΩ_E^+/(2π).

**Acceptance.**

- The coefficients are rational but not explicit in general (source Remarque 1 after the proof).

**Depends on.** this roadmap: `ER.7/cycle-formula`, `ER.7/nonvanishing-of-a-twisted-value`; layers of other roadmaps: `EllipticCurveModularity:R29.6`, `EllipticCurveModularity:R29.5`, `NeronModelsAndSemistableAbelianVarieties:R11.6`, `ModularSymbolsPadicLFunctions:L1`.

**Sources.**

- `Brunault.These.2005`, Théorème 97, p. 109: “Théorème 97. Soit N ≥ 1 un entier. Pour toute courbe elliptique E définie sur Q, de conducteur N, la valeur spéciale L(E, 2) est combinaison linéaire à coefficients rationnels des quantités” — The theorem; the quantities (3.127) are transcribed in the statement.

### Théorème 2 and formula (8): L(E, 2) for prime conductor, as corrected

`ER.7/prime-level-L-value-formula` · theorem · parent packet · added by REV-EllipticRegulators

Let E/Q have prime conductor p, ε(E) = −w(E) its root number (w(E) is the source's 'opposé du signe de l'équation fonctionnelle'), and R = Res_{s=2} Σ a_n² n^{−s}. Then, with λ_{χ,χ'} = Σ_{χ''} τ(χ'')/τ(χ'χ'') c_{χ'',χ} (χ'' even non-trivial) and c as in Théorème 1: L(E, 2) = (p³ ε(E) / (2(p + 1)(p − 1)³ π²)) · Σ_{χ,χ'} λ_{χ,χ'} L(E, χ, 1)L(E, χ', 1) / R, and L(E, 2) = (p² i ε(E) / (8(p − 1) π)) · Σ_{χ,χ'} λ_{χ,χ'} L(E, χ, 1)L(E, χ', 1) / Σ_{χ,χ'} τ(χ̄χ̄') L(E, χ, 1)L(E, χ', 1), the sums over χ even non-trivial and χ' odd. These differ from the printed (6) and (8) by the factor −4 and the factor −1 (with π in place of π²) respectively; see source issues E15-E17.

**Hypotheses.**

- The printed statements (6), (8), (3.146), (3.149) and Merel's Théorème D are not used as stated: numerically they are off by the factors recorded in the source issues.

**Proof outline.**

1. Multiply the corrected Théorème 1 by L(E, χ', 1)/τ(χχ') and sum.
2. Evaluate R: Res_{s=2} Σ a_n² n^{−s} = L(Sym²E, 2)/(ζ(2)(1 + 1/p)) for multiplicative reduction at p; relate it to the twisted values through the Petersson norm (Merel's Théorème D, corrected by the factor 4).
3. Eliminate R for the second formula.

**Acceptance.**

- For 11a3: R = 0.58936464004658978237…, L(E, 2) = 0.54604803621501351833…; the printed (6) gives −L(E, 2)/4 and the printed (8) gives −L(E, 2)/π (checker C, thm2b.gp).
- Σ_{n≤X} a_n² ≈ R X²/2 (X = 4·10⁵ gives 0.5895 for 2Σ/X²).

**Depends on.** this roadmap: `ER.7/the-explicit-theorem-for-an-elliptic-curve`; layers of other roadmaps: `AutomorphicLFunctionsAndLocalFactors:AL.3`, `EllipticCurveModularity:R29.6`.

**Sources.**

- `Brunault.These.2005`, Théorème 2, p. 9 and p. 118: “Théorème 2. Supposons N = p premier. Nous avons la formule” — The printed formula (6), transcribed from the page image, is the one numerically corrected here.
- `Brunault.These.2005`, Appendice (L. Merel), Théorème D, p. 154: “Théorème D. — On a Res_{s=2} L(f ⊗ f, s) = (2πi/((N + 1)(N − 1)²)) Σ_{χ,χ',χχ'(−1)=−1} Λ(f ⊗ χ', 1)Λ(f ⊗ χ, 1)/τ(χχ')” — The input that is off by a factor 4 numerically (source issue E15).

**Assembly note.** The ER.7 part records the state of this node's proof: *Proof normalization gap retained*. Read all of Merel §§2–5, including Theorem A’s translation/Atkin–Lehner calculation, Theorem C’s Stokes/Haberland proof and Theorem D’s substitution. The accepted E15 factor-four, E16 even-sign and E17 pi correction remain authoritative imported findings, not new unproved global formulas. An analytic derivation locating E15/E16 is still required. Petersson is first-linear and divided by [SL2(Z):Γ] here, whereas Tau Ceti conjugates the first variable and has no index division. Inputs it names: `tauceti:UpperHalfPlane.peterssonInner`, `tauceti:TauCetiRoadmap/ModularForms#layer-8-modular-symbols-the-integral-hecke-algebra-and-coefficient-fields`.

### Théorème 8: L(E, 2) for X1(11) and the exotic relation

`ER.7/the-X1-11-example` · theorem · parent packet · added by REV-EllipticRegulators

Let E : y² + y = x³ − x² (= X1(11), Cremona 11a3), P = (0, 0) of order 5, E(R) oriented so that Ω^+ = ∫_{E(R)} dx/(2y + 1) > 0, and D_E(x) = Σ_{n∈Z} D(u q^n) the elliptic dilogarithm in that orientation (u = e^{2πiz/Ω^+}, q = e^{2πiτ}). For every even non-trivial χ mod 11 with ζ = χ(3): L(E, 2) = (2²·5·π/11²) · ((1 + 3(ζ + ζ̄))/(ζ − ζ̄)) · Σ_{a∈Z/5Z} ζ^a D_E(aP). Consequently L(E, 2) = (10/11)·π·D_E(P) and D_E(2P) = (3/2)D_E(P) (Bloch-Grayson).

**Hypotheses.**

- The cusps P_v, v ∈ (Z/11Z)*/±1, are the five rational points of E, with P_{4^a} = aP.
- The proof fixes the sign of L(f, χ, 1) = −α Ω^+/(5τ(χ̄)), α = ζ − ζ̄ + 2(ζ² − ζ̄²), by an uncertified numerical evaluation (source issue E19); a proof must replace it by a certified error bound or an exact modular-symbol computation.

**Proof outline.**

1. Apply Théorème 4 with ψ = 1 (the source uses the equivalent Théorème 7 with J1(11) = X1(11)); div u_χ and div u_χ̄ are supported on the cusps P_v = 4^a·P (Proposition 80).
2. Evaluate r_11({u_χ, u_χ̄}) by the divisor formula (Proposition 17) with R_ω(P, Q) = (i/2)D_E(P − Q) for ω = ω_f/Ω^+ ((1.64)).
3. L(χ, 2)L(χ̄, 2) = π⁴(2/11)⁴(7 − ζ − ζ̄) and L(f, χ, 1) = −α Ω^+/(5τ(χ̄)).
4. Simplify with η = ζ + ζ̄, η² = 1 − η; eliminate η between the two Galois conjugates (the source's (3.155)-(3.157), whose displayed factors (7 − η), (8 + η) are misprints for (1 + 3η), (−2 − 3η): source issue E18).

**Acceptance.**

- Numerically (checker C, PARI): Ω^+ = 6.3460465213977671084439730837727365261, q = −0.2358955385047122079000528089561130080, D_E(P) = 0.19119373708433169575495443431217381…, D_E(2P) = 0.28679060562649754363243165146826072…, L(E, 2) = 0.54604803621501351833412666043344433859…; D_E(P) agrees with 11L(E, 2)/(10π) and D_E(2P) with (3/2)D_E(P) to 36 digits; the displayed formula holds for all four χ to 38 digits.
- L(χ, 2)L(χ̄, 2) = π⁴(2/11)⁴(7 − ζ − ζ̄) and L(f, χ, 1) = −αΩ^+/(5τ(χ̄)) hold numerically for all four χ (the sign is minus).

**Depends on.** this roadmap: `ER.7/the-regulator-integral-and-its-evaluation`, `ER.7/divisors-of-character-units`, `ER.3/the-elliptic-dilogarithm`, `ER.4/the-divisor-formula`; other roadmaps: `Polylogarithms:P.2/certified-numerics`; libraries: `mathlib:WeierstrassCurve.LSeries`.

**Needed by.** this roadmap: `ER.8/the-integrality-worked-example`.

**Sources.**

- `Brunault.These.2005`, Théorème 8, p. 119: “Théorème 8. Soit E la courbe elliptique donnée par l'équation y² + y = x³ − x², et P = (0, 0), point d'ordre 5 de E(Q). Orientons E(R) dans le sens des y croissants.” — The setting; (3.150) is transcribed in the statement.
- `Brunault.These.2005`, Corollaire 101, p. 119: “Corollaire 101. En conservant les hypothèses du théorème 8, nous avons L(E, 2) = (10/11) · π · D_E(P) et D_E(2P) = (3/2) D_E(P).” — The two identities, verified numerically.

**Assembly note.** The ER.7 part records the state of this node's proof: *Inherited rigorous sign gap retained*. E19 fixes the sign only by an uncertified computation in the source. The exact oriented modular-symbol computation or a certified error-bound evaluation is still necessary. The general existence theorem does not depend on this numerical example.

### The regulator commutes with the norm along a finite morphism of curves

`ER.7/regulator-under-finite-pushforward` · theorem · parent packet · added by REV-EllipticRegulators

Let φ : X → Y be a finite morphism of compact connected Riemann surfaces (of smooth projective curves over a number field, at a complex embedding) and N_φ : K2(C(X)) → K2(C(Y)) the norm (Milnor transfer for the finite extension C(X)/C(Y)). For every ξ ∈ K2(C(X)) and ω ∈ Ω^{1,0}(Y): r_Y(N_φ ξ)(ω) = r_X(ξ)(φ*ω). In particular N_φ maps K2(X) ⊗ Q into K2(Y) ⊗ Q and the regulator of the pushed-forward class is the pull-back pairing.

**Hypotheses.**

- The source proves only the analogue for Goncharov's function (Corollaire 37: φ_* R_X(l, φ*m) = R_Y(φ_* l, m)), which covers symbols {f, φ*g}; the general symbol needs the transfer and is not in the source: gap.

**Proof outline.**

1. Reduce to symbols {f, φ*g} and {φ*c, f} by the projection formula and generation of K2 of the function field (K2SymbolsBrauer T.4).
2. For {f, φ*g}: N{f, φ*g} = {N f, g}; compare ∫_Y log|Nf| ω ∧ ∂̄ log|g| with ∫_X log|f| φ*ω ∧ ∂̄ log|φ*g| using log|Nf| = φ_*(log|f|) (trace of functions).
3. Check compatibility with the tame symbol (EllipticKTheory:E.3/naturality-for-finite-transfer).

**Acceptance.**

- For φ = identity the statement is trivial; for an isogeny of elliptic curves it recovers the distribution relation of D_E ((1.99)-(1.101)).

**Depends on.** this roadmap: `ER.2/the-regulator-on-symbols`; other roadmaps: `EllipticKTheory:E.5/pullback-and-pushforward`, `EllipticKTheory:E.3/naturality-for-finite-transfer`, `K2SymbolsBrauer:T.4/milnor-projection-formula`.

**Needed by.** this roadmap: `ER.7/the-pushforward-and-its-hypotheses`.

**Sources.**

- `Brunault.These.2005`, Corollaire 37, p. 40: “Corollaire 37. Soit l (resp. m) un diviseur de degré 0 sur X (resp. Y). Nous avons φ_* R_X(l, φ^* m) = R_Y(φ_* l, m).” — The projection-formula analogue the source proves (Remarque 38 calls it an analogue of the projection formula in K-theory); the general statement is a gap.

**Assembly note.** The ER.7 part records the state of this node's proof: *Compact proper-covariance proof supplied; function-field extension and conventions open*. Deninger–Scholl (2.6)–(2.8) gives proper functoriality of the real Deligne cycle map. For finite maps of compact curves c=0, so no shift occurs, and duality pairs pushforward with pullback forms. The new adjointness node proves the compact-class case needed here independently of the inherited assertion. It repairs the invalid projection-formula-symbol proof only in that scope. The inherited assertion for arbitrary function-field symbols still requires a natural compact/open projection or a supports argument, recorded in G2; no complete proof of that stronger assertion is claimed. Inputs it names: `ER.7/elliptic-regulator-adjointness`.

**Assembly note.** The reduction in the first proof step, to symbols {f, φ^*g} and {φ^*c, f}, is not established: projection on such symbols does not give a generating family for all ξ (REV-EllipticRegulators--ER.4). Only the compact-class case is proved, by `ER.7/elliptic-regulator-adjointness` (Deninger–Scholl (2.6)–(2.8)). The statement for arbitrary function-field symbols is part of the ER.7 part's gap G2.

### The fixed-level modular-unit subspace

`ER.7/fixed-level-beilinson-subspace` · definition · ER.7 part

Let Y_K be the modular curve over Q for an open compact K⊂GL2(A_f), X_K its smooth projective compactification, and j the injective rational weight-two restriction H²_M(X_K,Q(2))→H²_M(Y_K,Q(2)). Define Q_K=j⁻¹(span_Q{{u,v}:u,v∈O(Y_K)×⊗Q}). The span is taken before the compactness condition; the condition is vanishing of the total horizontal tame boundary, not of each generator separately.

**Hypotheses.**

- Work componentwise if X_K is not geometrically connected.
- Symbols and restriction use the common rational weight-two K-theory convention.

**Construction.**

1. Import algebraic modular units from Kato L0 and the early bilinear K2 symbol interface from L1; do not construct either here.
2. Use rational localization and the curve restriction kernel comparison from EllipticKTheory E.3 to identify the compact group with its image.
3. Take a Mathlib span and its comap; a linear combination of symbols can have cancelling cusp residues even when its summands do not.

**API.**

- `EllipticRegulators.Modular.fixedLevelBeilinson_mem` (characterisation): For Q-vector spaces A,B, j:A→B linear and S⊂B, x∈fixedLevelBeilinson(j,S) iff j(x)∈span_Q(S).
- `EllipticRegulators.Modular.fixedLevelBeilinson_id` (compatibility): For j=id, fixedLevelBeilinson(id,S)=Submodule.span Q S.
- `EllipticRegulators.Modular.fixedLevelBeilinson_mono` (functoriality): If S⊂T then fixedLevelBeilinson(j,S)≤fixedLevelBeilinson(j,T).
- `EllipticRegulators.Modular.fixedLevelBeilinson_empty` (simp): For injective j, fixedLevelBeilinson(j,∅)=0. Without injectivity it equals ker(j).
- `EllipticRegulators.Modular.fixedLevelBeilinson_pullback` (compatibility): For linear a:A→A′, b:B→B′ with j′a=bj and b(S)⊂span(S′), a carries fixedLevelBeilinson(j,S) into fixedLevelBeilinson(j′,S′).
- `EllipticRegulators.Modular.fixedLevelBeilinson_linearCombination` (constructor): Every finite Q-linear combination of vectors x_i with j(x_i) in span(S) belongs to fixedLevelBeilinson(j,S).

**Unit tests.**

- `EllipticRegulators.Modular.fixedLevelBeilinson_test_identity` (compatibility): On Q, j=id and S={1} give the whole one-dimensional Q-space.
- `EllipticRegulators.Modular.fixedLevelBeilinson_test_empty` (degenerate): For the injection Q→Q², x↦(x,0), an empty symbol set gives zero.
- `EllipticRegulators.Modular.fixedLevelBeilinson_test_cancellation` (computation): For that injection and S={(1,1),(0,1)}, 1 belongs to Q_K because (1,0)=(1,1)−(0,1), although neither chosen symbol is itself in the compact image.
- `EllipticRegulators.Modular.fixedLevelBeilinson_test_vertical` (non-example): For that injection and S={(0,1)}, 1 does not belong. This detects taking the whole compact group without the span condition.

**Acceptance.**

- For X0(p), two cusps give one modular unit modulo constants; its same-level regulator image is zero, even for genus one.
- Residue cancellation is permitted in the span.

**Uses.**

- SS 1.1.1 and 7.3.0: Forms the horizontally unramified subspace whose bad-fibre residues are studied.
- SS 1.1.3: Separates a fixed level from its transfer closure.

**Depends on.** other roadmaps: `KatoEulerSystems:L0/siegel-units-and-c-independent-rationalisation`, `KatoEulerSystems:L1/beilinson-element-in-K2-of-Y-M-N`, `EllipticKTheory:E.3/localisation-sequence-for-a-curve`, `EllipticKTheory:E.3/what-the-sequence-does-not-identify`; libraries: `mathlib:Submodule.comap`, `mathlib:Submodule.span_image`.

**Needed by.** this roadmap: `ER.7/beilinson-subspace`, `ER.7/constant-symbol-regulator-correction`, `ER.7/full-level-modular-symbol-integrality`.

**Lean.** module `TauCeti/NumberTheory/EllipticRegulators/Modular`, namespace `EllipticRegulators.Modular`; declaration `EllipticRegulators.Modular.fixedLevelBeilinson`.

**Sources.**

- `SS.1988`, 1.1.1: “generated by all symbols” — SS 1.1.1 defines the span of all unit pairs before intersection with compact motivic cohomology; comap is its algebraic prototype.

### The transfer Beilinson subspace

`ER.7/beilinson-subspace` · definition · planet “Beilinson subspace” · ER.7 part

Define P_K as the filtered union of θ_{K′/K,*}Q_{K′} over open compact subgroups K′⊂K. Equivalently it is the supremum of these image Q-submodules. Every element has a single finite-level witness after common refinement. Q_K⊂P_K; equality is not asserted.

**Hypotheses.**

- Finite level maps are proper, generically finite morphisms of equal-dimensional compact curves.
- Transfers and pullbacks are rational and satisfy θ_*θ^*=[K:K′] componentwise with the actual degree when stabilizers intervene.

**Construction.**

1. Pull back finitely many modular-unit combinations to a common subgroup contained in all their levels.
2. Use transfer composition and norm–restriction equal to degree; divide by the nonzero rational degree to dominate each image by the common refinement image.
3. Apply Submodule.mem_iSup_of_directed; do not identify an arbitrary supremum with a set union.

**API.**

- `EllipticRegulators.Modular.beilinsonSubspace_transfer` (constructor): For a family of Q-submodules Q_i and linear transfers t_i to A, t_i(x)∈P when x∈Q_i.
- `EllipticRegulators.Modular.beilinsonSubspace_finiteWitness` (characterisation): If the image submodules are directed and the index type is nonempty, x∈P iff there exist i and y∈Q_i with t_i(y)=x.
- `EllipticRegulators.Modular.beilinsonSubspace_single` (compatibility): For one index, P=Q_i.map(t_i). This is precisely Mathlib Submodule.map.
- `EllipticRegulators.Modular.beilinsonSubspace_zero` (simp): If every Q_i=0 then P=0.
- `EllipticRegulators.Modular.beilinsonSubspace_mono` (functoriality): Increasing each Q_i while keeping the transfers fixed increases P.
- `EllipticRegulators.Modular.beilinsonSubspace_map` (functoriality): For a linear f:A→B, f(P) is the supremum of the images under f∘t_i.
- `EllipticRegulators.Modular.beilinsonSubspace_degree` (relation): Multiplying a transfer by a nonzero rational d leaves its image of a Q-submodule unchanged; this is why norm–restriction degrees do not change P.

**Unit tests.**

- `EllipticRegulators.Modular.beilinsonSubspace_test_single` (compatibility): A singleton level with identity transfer gives its prescribed submodule.
- `EllipticRegulators.Modular.beilinsonSubspace_test_zero` (degenerate): Every zero input submodule gives zero output, even when transfers are nonzero.
- `EllipticRegulators.Modular.beilinsonSubspace_test_newLevel` (non-example): On Q², take levels n∈N with Q_0=span{(1,0)}, Q_n=Q² for n>0, and identity transfers. The family is directed and P=Q²≠Q_0.
- `EllipticRegulators.Modular.beilinsonSubspace_test_degree` (computation): On Q, the transfer x↦2x from Q has full image. An integral span would incorrectly retain a degree-two index.

**Acceptance.**

- Check the statement with all its level, coefficient and covariance hypotheses; compare the cited passage.

**Uses.**

- SS 1.2.9: Transfer at finer levels permits irreducibility to propagate nonvanishing to all vectors at the target level.
- SS 7.3.2: Transfers preserve the integral part.
- General elliptic application: Pushes P_K to the elliptic quotient, without a same-level twist assertion.

**Depends on.** this roadmap: `ER.7/fixed-level-beilinson-subspace`; other roadmaps: `EllipticKTheory:E.5/pullback-and-pushforward`, `EllipticKTheory:E.3/naturality-for-finite-transfer`; libraries: `mathlib:Submodule.map`, `mathlib:Submodule.mem_iSup_of_directed`.

**Needed by.** this roadmap: `ER.7/constant-symbol-regulator-correction`, `ER.7/isotypic-regulator-image`, `ER.7/integral-beilinson-subspace`, `ER.7/elliptic-beilinson-subspace`.

**Lean.** module `TauCeti/NumberTheory/EllipticRegulators/Modular`, namespace `EllipticRegulators.Modular`; declaration `EllipticRegulators.Modular.beilinsonSubspace`.

**Sources.**

- `SS.1988`, 1.1.1–1.1.3: “the union being taken over all open subgroups” — Exact target statement, with convention and gap qualifications given in the proof outline.

### The Hecke separation in Manin–Drinfeld

`ER.7/cuspidal-hecke-separation` · theorem · ER.7 part

For a full modular level n≥3 and a good prime p∤n with p≥7, the eigenvalues of T_p on the rational degree-zero cuspidal divisor module have the form pχ₁(p)+χ₂(p), of modulus at least p−1. On the Jacobian differential module they have modulus at most 2√p. Their spectra are disjoint; consequently the subgroup of the Jacobian generated by cusp differences is finite. For general K use a finite full-level cover and norm.

**Hypotheses.**

- Use the same geometric Hecke correspondence on divisors, Pic⁰ and regular differentials.
- The characters χ_i have finite order, and degrees are zero separately on each geometric connected component.

**Proof outline.**

1. SS 3.4.0 decomposes the finite cusp permutation module into Eisenstein characters.
2. The characteristic polynomial of T_p on the Jacobian has rational coefficients and an integral multiple annihilates Pic⁰ by its endomorphism relation.
3. The good-prime Weil bound separates this polynomial from the cuspidal spectrum since p−1>2√p for p≥7.
4. Thus the cusp subgroup tensored with Q is zero; it is finitely generated, hence torsion finite. Transfer to quotients.

**Acceptance.**

- p=7 satisfies 6>2√7; the argument is not licensed at p=2.
- Matches the imported EllipticRegulators:ER.7/manin-drinfeld; it is a proof ingredient rather than a second statement of that declaration.

**Depends on.** layers of other roadmaps: `ModularCurvesPartII:R12.5`, `ModularCurvesPartII:R14.6`.

**Needed by.** this roadmap: `ER.7/constant-symbol-regulator-correction`.

**Lean.** module `TauCeti/NumberTheory/EllipticRegulators/Modular`, namespace `EllipticRegulators.Modular`.

**Sources.**

- `SS.1988`, 3.4.0: “Then C is finite.” — SS 3.4.0 states cuspidal finiteness and proves it by disjoint good-prime spectra, p−1 > 2√p for p≥7. The node isolates that proof ingredient.

### Compact correction without changing the regulator

`ER.7/constant-symbol-regulator-correction` · theorem · ER.7 part

After refining K to a full level n≥3, let X(n) be one connected component over F=Q(μ_n), with all cusps F-rational, and let α be a rational linear combination of symbols of units on Y(n). There is a rational combination γ of constant-unit symbols {a,h}, a∈F×, h∈O(Y(n))×, such that ξ=α+γ has zero horizontal tame boundary and lifts to compact weight-two K2. It remains in the unit-symbol span on this full-level Q-scheme component and has the same compact-projected regulator as α. Transfers of ξ belong to P_K. This is the full-level specialization needed of SS 1.3.1, not a claim that arbitrary field norms of symbols are single pairs.

**Hypotheses.**

- Manin–Drinfeld for degree-zero cusp differences, componentwise; full-level cusps are rational over the component constant field.
- Rational symbol/tame-boundary identification, curve localization, Weil reciprocity and the compact projection of the real Deligne regulator are supplied.

**Proof outline.**

1. Choose a base cusp P0. For each other cusp P, Manin–Drinfeld gives h_P with div(h_P)=m_P(P−P0), m_P>0. Realize this principal divisor over F by the L0 unit/divisor descent interface.
2. Write t_P=∂_P(α) in F×⊗Q, additively. Weil reciprocity on X(n)/F gives Σ_P t_P=0 because every cusp is F-rational and α has no other boundary.
3. With ∂_P{a,h}=ord_P(h)a, take γ=−Σ_{P≠P0}(1/m_P){t_P,h_P}; bilinearity extends symbols to F×⊗Q. The boundaries at P≠P0 cancel, and the remaining boundary at P0 is zero by reciprocity. Reverse both signs if using the inverse tame-symbol convention.
4. Both constants in F× and h_P are global units on Y(n), viewed as a component of the full-level Q-scheme. Thus compactness does not leave the unit-symbol span. Finer-level transfer gives P_K; no arbitrary norm-generation assertion is needed.
5. SS 3.5.3 compact Stokes/orthogonality makes constant-unit symbols have zero compact pairing with every holomorphic differential; combine with the canonical compact/open regulator comparison. The vanishing is a period statement, not a pointwise claim that conjugate(dlog(h))∧ω=0.

**Acceptance.**

- The correction has tame vector −(t_P) at every cusp, including P0 by reciprocity. For nonrational cusps the norm-weighted relation cannot be replaced by an unweighted sum.
- Adding a constant symbol leaves the compact pairing with every holomorphic differential unchanged.
- Constants of F are units on the actual full-level component; this cannot be replaced by assuming they are Q-rational constants.

**Depends on.** this roadmap: `ER.7/fixed-level-beilinson-subspace`, `ER.7/beilinson-subspace`, `ER.7/cuspidal-hecke-separation`, `ER.7/manin-drinfeld`, `ER.2/the-normalisation-factor`; other roadmaps: `SchemeKTheoryOperations:S.3/weil-reciprocity-k-theory`, `EllipticKTheory:E.3/localisation-sequence-for-a-curve`, `EllipticKTheory:E.3/naturality-for-finite-transfer`; layers of other roadmaps: `KatoEulerSystems:L0`, `ModularCurvesPartII:R12.3`.

**Needed by.** this roadmap: `ER.7/regulator-nonvanishing-after-level-change`.

**Lean.** module `TauCeti/NumberTheory/EllipticRegulators/Modular`, namespace `EllipticRegulators.Modular`.

**Sources.**

- `SS.1988`, 1.3.0–1.3.1, 3.5.3; full-level specialization using Weil reciprocity: “there is a finite extension F of Q” — SS 1.3.1 gives the general finite-extension correction; 3.5.3 proves compact-pairing vanishing for constants. The node proves the stated full-level F-rational-cusp specialization using the separately named suppliers.

### Algebraicity of the modular regulator period

`ER.7/regulator-period-inclusion` · theorem · ER.7 part

For every weight-two cuspidal automorphic π occurring in Ω¹ of the modular tower, every level K, ω∈V_π^K and rational modular units u,v, the tuple over embeddings of ∫_{Y_K(C)}log|u| conjugate(dlog(v))∧ω lies in 2πi c⁺(π)L′(π̌,0)·Qbar inside Qbar⊗C. Period-line equality is understood modulo Qbar×; it is not an exact scalar identity for an arbitrarily chosen period representative.

**Hypotheses.**

- Arithmetic L-normalization has functional equation s↦2−s.
- π̌ is the contragredient; all embeddings of a finite coefficient field are tracked.
- The integral uses the indicated wedge order and the compact/open comparison.

**Proof outline.**

1. Expand log|u| in degree-zero real Eisenstein series and dlog(v) in weight-two Eisenstein representations, using the inherited Kronecker and unit-divisor declarations.
2. Unfold the cuspidal Rankin–Selberg integral with SS Haar measures; 5.1.0 gives πiΓ(s+1)/(4π)^(s−1) times [GL2(Zhat):±K] times the finite-adelic integral.
3. At s=1, 4.5.3 gives an algebraic local factor times L(π,2)L(π⊗χ,1)/L(ω_πχ,2); absolute convergence makes the denominator nonzero.
4. Use SS §2 functional equations, Gauss-sum transformation and Shimura–Blasius period algebraicity over all embeddings. Supplier requests state this exact quotient.
5. Divide by 2πi only after the ER.2 regulator normalization comparison; no Brunault/SS factor is silently exchanged.

**Acceptance.**

- At s=1 the analytic prefactor is πi times the congruence index.
- Changing a period by a nonzero algebraic scalar leaves the line unchanged.

**Depends on.** this roadmap: `ER.7/real-analytic-eisenstein-series`, `ER.7/kronecker-limit-formulas`, `ER.7/rankin-selberg-integral`, `ER.2/the-normalisation-factor`; layers of other roadmaps: `KatoEulerSystems:L0`, `GL2AutomorphicRepresentationsAndTransfer:R16.2`, `GL2AutomorphicRepresentationsAndTransfer:R16.5`, `PeriodsAndSpecialValues:PS.1`; libraries: `mathlib:DirichletCharacter.LFunction`.

**Needed by.** this roadmap: `ER.7/regulator-nonvanishing-after-level-change`, `ER.7/isotypic-regulator-image`.

**Lean.** module `TauCeti/NumberTheory/EllipticRegulators/Modular`, namespace `EllipticRegulators.Modular`.

**Sources.**

- `SS.1988`, 1.3.2(i), 2.3, 4.5.3, 5.1.0 and 5.2: “This concludes the proof of part (i) of Theorem 1.3.2.” — Exact target statement, with convention and gap qualifications given in the proof outline.

### Nonvanishing with freely chosen auxiliary level

`ER.7/regulator-nonvanishing-after-level-change` · theorem · ER.7 part

For each such π there exist a finite level K, ω∈V_π^K and rational modular units u,v for which ∫log|u|conjugate(dlog(v))∧ω≠0. K is chosen after the auxiliary character and local test vectors; it need not be the original newform level. After cusp correction this gives a nonzero compact regulator in the transfer Beilinson subspace, using the full-level constant-symbol correction and the early pair interface G1.

**Hypotheses.**

- An even auxiliary character χ of unrestricted conductor exists with χ≠1,ω_π⁻¹ and L(π^σ⊗χ^σ,1)≠0 for every coefficient embedding σ.
- At bad primes one may choose vectors fixed by a smaller compact subgroup.

**Proof outline.**

1. Shimura Theorem 2 and its following remark give nonzero odd twists at a prime p away from a prescribed M, then another odd twist at q away from pM; their product is primitive even of conductor pq. Take M divisible by the original level and the central-character conductor, excluding both 1 and ω_π⁻¹. The proof uses finite Fourier inversion of modular-symbol periods and parity injectivity. Theorem 1 algebraicity transports the nonzero normalized value through every coefficient embedding; PS.1 supplies this exact adapter.
2. At each bad prime use compactly supported Kirillov vectors with local integral I(1)=1 (4.5.4); at good primes use normalized spherical vectors.
3. Choose φ supported on the product of these compact stabilizers; factorization gives a nonzero product of the two L-values and nonzero local factors.
4. Subtract φ’s (1,1)-Eisenstein component ψ. It has the same degree, but its integral is zero by the nontrivial central character χω_π. Thus φ−ψ has degree zero and preserves the nonzero integral.
5. Apply Manin–Drinfeld and the rational unit realization of degree-zero cusp data; then the full-level compact correction using G1’s early pair interface.

**Acceptance.**

- No primitivity at the fixed modulus N appears in the conclusion.
- For χ=ω_π⁻¹ the central-character cancellation step fails; exclude it.

**Depends on.** this roadmap: `ER.7/regulator-period-inclusion`, `ER.7/constant-symbol-regulator-correction`; layers of other roadmaps: `KatoEulerSystems:L0`, `GL2AutomorphicRepresentationsAndTransfer:R16.2`, `PeriodsAndSpecialValues:PS.1`.

**Needed by.** this roadmap: `ER.7/isotypic-regulator-image`.

**Lean.** module `TauCeti/NumberTheory/EllipticRegulators/Modular`, namespace `EllipticRegulators.Modular`.

**Sources.**

- `SS.1988`, 1.3.2(ii), 4.5.4 and 6.0–6.1.1: “replacing φ by φ − ψ leaves (6.0.1) unchanged” — SS 1.3.2(ii), 4.5.4 and §6 give nonvanishing after choosing the level and local vectors, rather than at a prescribed initial level.
- `Shimura.1977`, Theorem 2 pp.212–213 and following remark pp.213–214; Theorem 1 p.212: “Notice that ξψ is a primitive character modulo pq such that ξψ(−1)=1.” — Two odd prime-conductor twists produce a primitive even auxiliary character away from any prescribed finite set; period algebraicity gives simultaneous coefficient-conjugate nonvanishing. The remark explicitly constructs the product ξψ of two odd characters with distinct prime conductors p,q.

### The isotypic Beilinson regulator image

`ER.7/isotypic-regulator-image` · theorem · ER.7 part

For every K and every occurring π, e_{π̌}r_D(P_K⊗Qbar)=L′(π̌,0)c⁺(π) Hom_Qbar(V_π^K,Qbar), inside the corresponding real Betti component after extending coefficients. If dim V_π^K=m>1 this is a full m-dimensional period subspace, not a single newform line.

**Hypotheses.**

- The compact/open regulator normalization and G1 are supplied.
- Hecke action, duality and the full finite-level automorphic decomposition are available with all bad Euler factors.

**Proof outline.**

1. Period inclusion at all levels and transfer/form-pullback adjointness give the displayed inclusion.
2. Choose the nonzero pairing at a finer level; Hecke stability makes the nonzero isotypic image an invariant submodule.
3. Apply irreducibility of the finite-level Hecke module and transfer adjointness as in 1.2.9 to get equality at the desired level.
4. Use the contragredient projector on cohomology when pairing against V_π; retain oldform multiplicities.

**Acceptance.**

- A level where π has two independent oldvectors gets two-dimensional regulator image.
- The projector is π̌, not an untracked π-projector.

**Depends on.** this roadmap: `ER.7/beilinson-subspace`, `ER.7/regulator-period-inclusion`, `ER.7/regulator-nonvanishing-after-level-change`, `ER.2/the-normalisation-factor`; layers of other roadmaps: `GL2AutomorphicRepresentationsAndTransfer:R16.4`, `ModularCurvesPartII:R12.5`.

**Needed by.** this roadmap: `ER.7/beilinson-rational-structure`, `ER.7/beilinson-determinant-formula`, `ER.7/modular-elliptic-regulator-line`.

**Lean.** module `TauCeti/NumberTheory/EllipticRegulators/Modular`, namespace `EllipticRegulators.Modular`.

**Sources.**

- `SS.1988`, 1.2.6–1.2.9: “by the irreducibility” — Exact target statement, with convention and gap qualifications given in the proof outline.

### The Beilinson rational structure

`ER.7/beilinson-rational-structure` · theorem · ER.7 part

For every X_K, r_D(P_K) is a Q-structure on H²_D(X_{K/R},R(2))=H¹_B(X_{K/R},R(1)); its scalar extension to R is the whole real vector space of dimension g, the sum of component genera. This assertion is about the regulator image, not finite generation or injectivity of the full rational K2 group.

**Hypotheses.**

- All hypotheses of the isotypic image theorem, including G1, are met.
- The real structure and Tate twist use SS’s real Betti convention.

**Proof outline.**

1. Sum the isotypic equalities over a coefficient field splitting the Hecke algebra.
2. The real/conjugation and coefficient-Galois compatibilities identify the resulting subspace as a rational structure before scalar extension.
3. Descend the finite-dimensional regulator image, not each arbitrarily chosen complex symbol individually.

**Acceptance.**

- For genus zero the image is the zero-dimensional rational structure.
- For X0(11), Q_K has zero regulator but P_K has a one-dimensional regulator image.

**Depends on.** this roadmap: `ER.7/isotypic-regulator-image`, `ER.7/real-structure-of-the-regulator`; layers of other roadmaps: `GL2AutomorphicRepresentationsAndTransfer:R16.4`.

**Needed by.** this roadmap: `ER.7/beilinson-determinant-formula`.

**Lean.** module `TauCeti/NumberTheory/EllipticRegulators/Modular`, namespace `EllipticRegulators.Modular`.

**Sources.**

- `SS.1988`, 1.1.2(i), 1.2.4–1.2.9: “rD (PK ) is a Q-structure” — Exact target statement, with convention and gap qualifications given in the proof outline.

### Beilinson’s modular determinant formula

`ER.7/beilinson-determinant-formula` · theorem · ER.7 part

In the determinant line of H¹_B(X_{K/R},R(1)), det_Q r_D(P_K)=L^{(g)}(H¹(X_K),0)·det_Q H¹_B(X_{K/R},Q(1)), with equality of rational lines (hence modulo Q×). L^{(g)} denotes the g-th derivative at 0; replacing it by the leading Taylor coefficient divides by g! and gives the same rational line. For disconnected X_K, g is the sum of genera.

**Hypotheses.**

- The rational-structure theorem and the motive/automorphic L-factor comparison with all finite Euler factors hold.
- Use the arithmetic weight-two L-normalization, not unitary s↦1−s.

**Proof outline.**

1. Take determinants of the isotypic image theorem with multiplicities m(π,K).
2. Compare Betti and automorphic period determinants using 1.2.4 and the full product L(H¹(X_K),s)=∏πL(π,s)^m.
3. Each factor has its simple trivial zero at s=0; the total order is g. Multiply leading terms and restore g! if using derivatives.
4. Coefficient conjugation permutes π and π̌ with equal multiplicities, so the global product is rationally defined.

**Acceptance.**

- For g=1 the derivative and leading coefficient coincide.
- For g=0 the empty determinant is Q and the L-value convention agrees.

**Depends on.** this roadmap: `ER.7/beilinson-rational-structure`, `ER.7/isotypic-regulator-image`; layers of other roadmaps: `GL2AutomorphicRepresentationsAndTransfer:R16.4`, `ModularCurvesPartII:R14.6`.

**Needed by.** this roadmap: `ER.7/modular-elliptic-regulator-line`.

**Lean.** module `TauCeti/NumberTheory/EllipticRegulators/Modular`, namespace `EllipticRegulators.Modular`.

**Sources.**

- `SS.1988`, 1.1.2(ii), 1.2.2–1.2.6: “Let g be the genus” — Exact target statement, with convention and gap qualifications given in the proof outline.

### Normalized reduction of a modular unit

`ER.7/ordinary-unit-reduction` · construction · ER.7 part

For a bad-fibre component C, put e_C=ord_C(p)>0. For u a modular unit define its normalized reduction u_C as the residue of u^{e_C}/p^{ord_C(u)}, which has valuation zero. In a DVR presentation with valuation v:F×→Z and angular component ac:F×→κ(C)× this is ac(u)^{v(p)}/ac(p)^{v(u)}. It is independent of the uniformizer used to present ac, and is a unit on the ordinary locus. The tame boundary ∂_C{u,p} agrees up to the conventional sign (torsion killed after rationalization).

**Hypotheses.**

- Use the regular full-level model with n=mp^k, m≥3 and p∤m.
- For actual geometric reduction the angular component and valuation arise from the component DVR; arbitrary algebraic input does not establish that identification.

**Construction.**

1. The numerator and denominator have equal C-valuation e_C ord_C(u), so their quotient has a well-defined nonzero residue.
2. SS 7.2.3 supplies the component map to the prime-to-p modular curve, degree p^kφ(p^k), and ordinary-locus unit statement.
3. Multiplicativity, powers and change of uniformizer follow by the valuation homomorphism and angular-component law; the correction exponent is e_C, not 1.

**API.**

- `EllipticRegulators.Modular.normalizedUnitReduction_formula` (data): For groups F×,κ×, homomorphisms v:F×→Multiplicative(Z) and ac:F×→κ×, the value is ac(u)^{v(p)}/ac(p)^{v(u)}, reading v additively.
- `EllipticRegulators.Modular.normalizedUnitReduction_mul` (structure): reduction(p,uv)=reduction(p,u)reduction(p,v).
- `EllipticRegulators.Modular.normalizedUnitReduction_inv` (simp): reduction(p,u⁻¹)=reduction(p,u)⁻¹.
- `EllipticRegulators.Modular.normalizedUnitReduction_zpow` (simp): reduction(p,u^a)=reduction(p,u)^a for every integer a.
- `EllipticRegulators.Modular.normalizedUnitReduction_orderZero` (characterisation): If v(u)=0 then reduction(p,u)=ac(u)^{v(p)}.
- `EllipticRegulators.Modular.normalizedUnitReduction_multiplyBase` (relation): reduction(p,up^a)=reduction(p,u) for every integer a.
- `EllipticRegulators.Modular.normalizedUnitReduction_changeAngular` (compatibility): For t∈κ×, replacing ac(x) by ac(x)t^{−v(x)} leaves the reduction unchanged; this is change of DVR uniformizer.

**Unit tests.**

- `EllipticRegulators.Modular.normalizedUnitReduction_test_base` (degenerate): reduction(p,p)=1; the integral tame symbol has a possible sign, which must not survive the rational comparison.
- `EllipticRegulators.Modular.normalizedUnitReduction_test_unramified` (compatibility): If v(p)=1 and v(u)=0 then the reduction equals ac(u), the usual residue of a unit.
- `EllipticRegulators.Modular.normalizedUnitReduction_test_ramified` (computation): If v(p)=2 and v(u)=0 then the reduction equals ac(u)². Taking κ=Q and ac(u)=2 gives 4, not 2.
- `EllipticRegulators.Modular.normalizedUnitReduction_test_baseMultiple` (characterisation): Multiplying u by p³ does not change its normalized reduction, even when v(u)≠0.

**Acceptance.**

- Account for ramification e_C at p.
- A tame-symbol sign convention change does not alter rational vanishing.

**Uses.**

- SS 7.2.4–7.2.5: The ordinary unit has supersingular orders controlled by Hecke action.
- SS 7.3.1: Computes vertical tame boundaries for horizontally compact modular-unit combinations.

**Depends on.** other roadmaps: `EllipticKTheory:E.3/naturality-for-finite-transfer`; layers of other roadmaps: `KatoEulerSystems:L0`, `ModularCurvesPartII:R13.5`.

**Needed by.** this roadmap: `ER.7/supersingular-orders-of-modular-units`.

**Lean.** module `TauCeti/NumberTheory/EllipticRegulators/Modular`, namespace `EllipticRegulators.Modular`; declaration `EllipticRegulators.Modular.normalizedUnitReduction`.

**Sources.**

- `SS.1988`, 7.2.3–7.2.4: “uC = ∂C {u, p}” — Exact target statement, with convention and gap qualifications given in the proof outline.

### Uniform supersingular orders

`ER.7/supersingular-orders-of-modular-units` · theorem · ER.7 part

For the regular full-level model at p of level n=mp^k, m≥3, p∤m, the orders of the normalized reduction u_C at supersingular points of each component C are all equal. The statement refers to the divisor pulled through the finite component map of 7.2.3, with its ramification multiplicities.

**Hypotheses.**

- Use the ordinary reduction construction and the supersingular Hecke module Qbar[Σ]/Qbar[S] of 7.1.1.
- The component geometry and compatible away-from-p Hecke action are supplied.

**Proof outline.**

1. The cusp divisor of u belongs to an Eisenstein Hecke module from Kato L0 and the inherited modular-unit divisor theorem.
2. The supersingular divisor modulo component constants is cuspidal by 7.1.1; its automorphic summands have local representation sp(1) at p.
3. Hecke separation forces the image of the unit-divisor module in this quotient to vanish.
4. Thus the supersingular content lies in the component-constant subspace Q[S], exactly the equal-order conclusion of 7.2.5.

**Acceptance.**

- Uniformity is on each component; equality between unrelated constant-field components is not asserted.
- The quotient by Q[S] cannot be omitted.

**Depends on.** this roadmap: `ER.7/ordinary-unit-reduction`; layers of other roadmaps: `ModularCurvesPartII:R14.6`, `ModularCurvesPartII:R13.5`, `KatoEulerSystems:L0`.

**Needed by.** this roadmap: `ER.7/full-level-modular-symbol-integrality`.

**Lean.** module `TauCeti/NumberTheory/EllipticRegulators/Modular`, namespace `EllipticRegulators.Modular`.

**Sources.**

- `SS.1988`, 7.1.1 and 7.2.5: “has the same order at each supersingular point” — Exact target statement, with convention and gap qualifications given in the proof outline.

### Integrality at full modular level

`ER.7/full-level-modular-symbol-integrality` · theorem · ER.7 part

For a full level n chosen divisible by two coprime factors each at least 3, every class in Q_n lies in the integral rational weight-two part im(K2^(2)(X(n)/Z)→K2^(2)(X(n))). In particular, every vertical boundary of a horizontally compact linear combination of modular-unit symbols vanishes after tensoring with Q. Small levels are reached by refinement and transfer, not by applying the stated model argument outside its hypotheses.

**Hypotheses.**

- Use a regular proper arithmetic-surface model and its weight-two K/G localization comparison.
- The horizontal boundary vanishes for the total class, not necessarily each pair-symbol summand.

**Proof outline.**

1. At p∤n, use the proper smooth special fibre in model localization: its weight-one K1 is its global units tensored with Q, hence zero over a finite constant field. Do not assert that the open-fibre K1 boundary target is zero or that modular units extend across cusps.
2. At p|n, write n=mp^k with p∤m and m≥3. The horizontal/vertical residue compatibility square (7.3.0) makes the vertical boundary have zero cusp orders.
3. The preceding theorem makes its supersingular orders uniform on each component; total divisor degree zero then forces all those orders to vanish.
4. The boundary therefore extends to a unit on each complete normalized component. Its finite constant field makes it torsion; rationalize to get zero.
5. Use arithmetic-surface localization including codimension-two terms and Adams weights to lift to the integral part. Killing only generic component orders without this comparison is insufficient.

**Acceptance.**

- The finite-field torsion argument is explicitly present; a zero divisor over a number field would not suffice.
- No assertion says every modular unit is integral at every bad prime.

**Depends on.** this roadmap: `ER.7/fixed-level-beilinson-subspace`, `ER.7/supersingular-orders-of-modular-units`; other roadmaps: `SchemeKTheoryOperations:S.3/arithmetic-surface-localisation`, `SchemeKTheoryOperations:S.6/scheme-weight-decomposition`, `SchemeKTheoryOperations:S.6/residue-weight-shift`; layers of other roadmaps: `ModularCurvesPartII:R13.5`.

**Needed by.** this roadmap: `ER.7/integral-beilinson-subspace`.

**Lean.** module `TauCeti/NumberTheory/EllipticRegulators/Modular`, namespace `EllipticRegulators.Modular`.

**Sources.**

- `SS.1988`, 7.3.0–7.3.2, especially the proof of 7.3.1 printed after 7.3.2: “the total degree of the divisor” — SS 7.3.1 and its proof after 7.3.2 give full-level integrality under the coprime-factor hypothesis; 7.3.0 supplies the horizontal/vertical square.

### Integrality of the Beilinson subspace

`ER.7/integral-beilinson-subspace` · theorem · planet “Integral Beilinson subspace” · ER.7 part

For every open compact K, P_K⊂im(K2^(2)(X_K/Z)→K2^(2)(X_K))⊗Q, independently of the regular proper model. This is Schappacher–Scholl 1.1.2(iii); it is independent of the analytic determinant and nonvanishing proofs.

**Hypotheses.**

- Every finite-level correspondence admits a resolved graph on regular proper arithmetic-surface models.
- Proper pushforward and pullback on total K2 commute with restriction to the generic fibre. Rational Adams projectors commute with restriction; the generic-fibre finite transfer has the required weight-two compatibility.

**Proof outline.**

1. Refine a finite-level witness to a full level satisfying the coprime-factor hypothesis and apply full-level integrality.
2. Extend the level map using a resolved regular graph on the models. Pull back a model K2 lift, then push it forward in total K2 (or G2 identified with K2 by regularity); flat generic-fibre base change identifies its restriction with the desired curve transfer. Project the target lift to weight two using S.6. No assertion that arbitrary model pushforward preserves pure Adams weight is needed.
3. Transfer and divide by the rational covering degree. For two regular proper models choose a common regular model over them (R13.6 request). Pullback gives one inclusion of total K2 images, and proper G2 pushforward, Cartan equivalence and flat generic-fibre base change give the reverse inclusion. Apply the restriction-compatible weight-two projector to lifts. This proves the required general-curve model independence; the elliptic-only E.6 declaration is not its supplier.
4. Use the actual vertical-residue proof. The false integral Manin–Drinfeld assertion, corrected in SS 7.4, is not a substitute.

**Acceptance.**

- A transfer of a full-level class remains integral after resolving the graph.
- The function Δ(pz)/Δ(z) prevents an all-bad-primes integral-unit Manin–Drinfeld assertion.

**Depends on.** this roadmap: `ER.7/beilinson-subspace`, `ER.7/full-level-modular-symbol-integrality`; other roadmaps: `SchemeKTheoryOperations:S.2/k-theory-proper-pushforward`, `SchemeKTheoryOperations:S.2/k-theory-pullback`, `SchemeKTheoryOperations:S.2/g-theory-proper-pushforward`, `SchemeKTheoryOperations:S.2/cartan-equivalence`, `SchemeKTheoryOperations:S.2/k-theory-base-change`, `SchemeKTheoryOperations:S.6/scheme-weight-decomposition`; layers of other roadmaps: `ModularCurvesPartII:R13.6`.

**Needed by.** this roadmap: `ER.7/modular-elliptic-regulator-line`.

**Lean.** module `TauCeti/NumberTheory/EllipticRegulators/Modular`, namespace `EllipticRegulators.Modular`.

**Sources.**

- `SS.1988`, 1.1.2(iii), 7.3.2 (graph correspondence) and 7.4 (counterexample): “to a correspondence on the regular models over Z.” — SS 1.1.2(iii) is deduced in 7.3.2 by graph correspondences on regular models. The 7.4 counterexample rules out an integral Manin–Drinfeld shortcut.

### The elliptic image of Beilinson classes

`ER.7/elliptic-beilinson-subspace` · definition · ER.7 part

Given a nonconstant Q-morphism φ:X_K→E to a smooth elliptic curve E/Q, define P_E,φ=φ_*(P_K)⊂K2^(2)(E)⊗Q. This is an image Q-submodule. Its nonzero regulator is proved from the modular isotypic theorem and φ^*ω_E≠0; it does not follow from nonzero norm of every individual symbol.

**Hypotheses.**

- The compact class source and the finite proper transfer have been constructed.
- No surjectivity or injectivity of φ_* on all K2 is assumed.

**Construction.**

1. A nonconstant map of smooth projective curves is finite. Use the imported proper K2 transfer.
2. Take Mathlib Submodule.map of P_K; retain the witness from P_K and its finite-level origin.
3. Use regulator adjointness for the nonvanishing assertion, separately from this definition.

**API.**

- `EllipticRegulators.Modular.ellipticBeilinsonSubspace_mem` (characterisation): For a linear push:A→B, β∈ellipticBeilinsonSubspace(push,P) iff β=push(ξ) for some ξ∈P.
- `EllipticRegulators.Modular.ellipticBeilinsonSubspace_id` (compatibility): With push=id the image is P, agreeing with Submodule.map_id.
- `EllipticRegulators.Modular.ellipticBeilinsonSubspace_comp` (functoriality): For f:A→B and g:B→C the image under g∘f equals the image under g of the image under f.
- `EllipticRegulators.Modular.ellipticBeilinsonSubspace_zero` (simp): The zero linear push gives the zero image submodule.
- `EllipticRegulators.Modular.ellipticBeilinsonSubspace_regulator` (compatibility): If r_B∘push=t∘r_A, then r_B(P_E,φ)=t(r_A(P_K)) as image submodules.
- `EllipticRegulators.Modular.ellipticBeilinsonSubspace_integral` (compatibility): If P≤I_A and push(I_A)≤I_B, the elliptic image lies in I_B. For geometry these are model-independent integral parts.

**Unit tests.**

- `EllipticRegulators.Modular.ellipticBeilinsonSubspace_test_identity` (compatibility): For identity push on Q², a one-dimensional submodule stays the same submodule.
- `EllipticRegulators.Modular.ellipticBeilinsonSubspace_test_zero` (degenerate): Zero push maps a nonzero source submodule to zero.
- `EllipticRegulators.Modular.ellipticBeilinsonSubspace_test_projection` (non-example): The first-coordinate projection Q²→Q maps span{(0,1)} to zero, despite its nonzero source generator.
- `EllipticRegulators.Modular.ellipticBeilinsonSubspace_test_degree` (computation): Multiplication by 3 on Q has full image; rational transfer degree does not shrink it.

**Acceptance.**

- Constant algebraic maps in the prototype have zero image; geometric nonconstancy is indispensable for the elliptic theorem.

**Uses.**

- General elliptic application: Names the precise integral subspace with the asserted regulator line.
- Rational descent: Performs Galois descent after pushforward on E, using the exact E.7 supplier.

**Depends on.** this roadmap: `ER.7/beilinson-subspace`; other roadmaps: `EllipticKTheory:E.5/pullback-and-pushforward`; libraries: `mathlib:Submodule.map`.

**Needed by.** this roadmap: `ER.7/elliptic-regulator-adjointness`, `ER.7/modular-elliptic-regulator-line`.

**Lean.** module `TauCeti/NumberTheory/EllipticRegulators/Modular`, namespace `EllipticRegulators.Modular`; declaration `EllipticRegulators.Modular.ellipticBeilinsonSubspace`.

**Sources.**

- `SS.1988`, 1.2.9 (adjointness), 1.1.2 applied to an elliptic quotient: “adjointness property” — The image under an elliptic quotient is a consumer definition, using proper transfer in SS 1.2.9; it is not a separately named definition in SS.

### Regulator adjointness and rational descent on E

`ER.7/elliptic-regulator-adjointness` · comparison · ER.7 part

For a finite Q-map φ:X_K→E and a compact rational weight-two class ξ, the properly normalized real Deligne regulator satisfies ⟨r_E(φ_*ξ),ω_E⟩=⟨r_{X_K}(ξ),φ^*ω_E⟩. For a finite Galois extension F/Q, an invariant pushed class β_F∈K2(E_F)⊗Q descends as β=(1/[F:Q])Norm(β_F), with res(β)=β_F. No nonzero-regulator conclusion is drawn from an unweighted trace of a single non-invariant character class.

**Hypotheses.**

- Same regulator, Tate twist, complex orientation and wedge order on both curves.
- The proper cycle-map interface from the early real Deligne supplier is supplied.
- Compact K2 classes are used, not arbitrary function-field symbols without boundary control.

**Proof outline.**

1. Deninger–Scholl (2.6)–(2.8) constructs the regulator with supports; proper covariance gives r_Eφ_*=φ_*r_X. A finite map of curves has relative codimension zero, hence no degree or Tate shift.
2. Poincaré duality pairs cohomological pushforward with form pullback; ER.2 converts this canonical normalization to Brunault’s explicit pairing.
3. Use EllipticKTheory E.7 rational Galois descent after pushing to E; Norm∘res=[F:Q] and res∘Norm=Σσ prove the formula for invariant β_F.
4. Before using a character class, project or combine the coefficient representation so that an invariant class with a proved nonzero real regulator exists. Trace can otherwise vanish.
5. For integral classes use a resolved regular graph: pull back a model K2 lift, push forward in total K2/G2 using Cartan comparison and generic-fibre base change, then apply the restriction-compatible target weight-two projector. The R13.6 regular-graph extension remains requested in G6.

**Acceptance.**

- Identity map gives equality without a factor of two or a degree.
- A non-invariant class with σβ=−β has trace zero; rational descent does not certify its nonvanishing.

**Depends on.** this roadmap: `ER.7/elliptic-beilinson-subspace`, `ER.2/the-normalisation-factor`; other roadmaps: `EllipticKTheory:E.5/pullback-and-pushforward`, `EllipticKTheory:E.7/rational-galois-descent`, `EllipticKTheory:E.7/transfer-of-certified-classes`, `SchemeKTheoryOperations:S.2/k-theory-proper-pushforward`, `SchemeKTheoryOperations:S.2/k-theory-pullback`, `SchemeKTheoryOperations:S.2/g-theory-proper-pushforward`, `SchemeKTheoryOperations:S.2/cartan-equivalence`, `SchemeKTheoryOperations:S.2/k-theory-base-change`, `SchemeKTheoryOperations:S.6/scheme-weight-decomposition`; layers of other roadmaps: `ModularCurvesPartII:R13.6`.

**Needed by.** this roadmap: `ER.7/modular-elliptic-regulator-line`.

**Lean.** module `TauCeti/NumberTheory/EllipticRegulators/Modular`, namespace `EllipticRegulators.Modular`.

**Sources.**

- `DS.1991`, (1.3)(1),(6); (2.6) (functoriality), (2.7)–(2.8) (construction): “co- and contravariant functorial homomorphism” — DS (1.3)(1),(6) gives proper shifts and rational Galois descent; (2.6) asserts regulator covariance, with construction in (2.8). Pairing against pullback forms gives the compact-curve specialization.

### Beilinson’s theorem for a modular elliptic curve

`ER.7/modular-elliptic-regulator-line` · theorem · ER.7 part

Let E/Q have conductor N and let φ:X0(N)→E be a nonconstant Q-parametrization with φ^*ω_E=c_φ·2πi f(z)dz, c_φ∈Q×, f the normalized weight-two newform having L(f,s)=L(E,s) including bad factors. Then P_E,φ is contained in the integral rational K2 part and r_D(P_E,φ)=L′(E,0)H¹_B(E/R,Q(1)) as rational lines in H¹_B(E/R,R(1)). For each nonzero rational Betti generator b there is an integral rational K2 class β with r_D(β)=L′(E,0)b. The modularity supplier makes this conclusion applicable to every elliptic curve over Q. No claim is made about the dimension of full K2(E)⊗Q.

**Hypotheses.**

- Use the exact-conductor modularity theorem and the nonconstant Q-parametrization; no optimality or c_φ=1 hypothesis.
- G1, period comparisons and the early proper regulator interface are supplied.
- The functional equation gives L′(E,0)≠0 from the absolutely convergent L(E,2)≠0.

**Proof outline.**

1. Apply the full isotypic regulator image to the rational newform component containing φ^*ω_E; this differential is nonzero.
2. Regulator adjointness identifies the pushforward image with the nonzero elliptic period line. Pullback followed by pushforward on Betti cohomology multiplies by deg φ, a nonzero rational scalar.
3. The elliptic motive factor and its rational Betti comparison identify the line as L′(E,0) times the Betti Q-line; an unspecified period representative cannot change a rational-line equality.
4. The integral Beilinson theorem and resolved-graph proper transfer on total model K2, followed by the target weight-two projector, give the integral inclusion. Choose a rational multiple of a nonzero image class to get the prescribed generator b.
5. Import EllipticCurveModularity R29.6 for the unconditional existence of f and R29.5 for φ. The primitive-even-same-level condition is never used.

**Acceptance.**

- For E=X0(11), same-level Q_K has zero regulator while P_E,φ gives the required nonzero line.
- Replacing ω_E by a rational multiple changes c_φ consistently and leaves the rational line unchanged.
- This is existence with transfers, not an explicit same-level formula for every conductor.

**Depends on.** this roadmap: `ER.7/elliptic-beilinson-subspace`, `ER.7/elliptic-regulator-adjointness`, `ER.7/integral-beilinson-subspace`, `ER.7/isotypic-regulator-image`, `ER.7/beilinson-determinant-formula`, `ER.6/the-beilinson-statement`; other roadmaps: `EllipticCurveModularity:R29.5/modular-parametrisation`, `EllipticCurveModularity:R29.6/modularity-theorem`, `SchemeKTheoryOperations:S.6/scheme-weight-decomposition`; layers of other roadmaps: `ModularCurvesPartII:R13.6`; libraries: `tauceti:HeckeRing.GL2.Newform`.

**Lean.** module `TauCeti/NumberTheory/EllipticRegulators/Modular`, namespace `EllipticRegulators.Modular`.

**Sources.**

- `SS.1988`, 1.1.2, 1.2.6–1.2.9; elliptic quotient specialization: “Beilinson’s theorem exhibits” — Elliptic-quotient consequence of SS 1.1.2 and 1.2.6–1.2.9, conditional on the explicitly imported parametrization and exact modularity theorem. SS does not itself prove modularity of every E/Q.

## ER.8 — p-adic comparison and worked examples

*18 nodes: 6 from the parent packet and 12 from the ER.8 part. Planets (4): Syntomic regulator comparison; Frobenius regulator; Corrected torsion symbol; Transfer of a torsion symbol.*

The layer gives the p-adic comparison for good reduction and the four worked examples of the stage text.

- **The p-adic side.** The parent node states the specialisation of PadicHodgeRegulators D.5's syntomic regulator, with Coleman integration from ColemanIntegration L1 and the p-adic L-function from ModularSymbolsPadicLFunctions L2, and records that no p-adic conjecture enters ER.5. The ER.8 part makes this exact:
  - the Coleman constant-term formula for Tr(reg_syn(u) ∪ η) on symbols;
  - the Frobenius correction reg_syn = (1 − p^{−2}Φ)·log_BK reg_ét, with pairing factor 1 − 1/(pγ), distinct from the scalar's 1 − p/γ;
  - the Frobenius-normalised scalar (1 − p/γ)B(r, v)/B(ω, v);
  - the dictionary between Néron periods and the refined p-adic L-function;
  - the common rational-scalar relation;
  - the weight-two p-adic Beilinson conjecture of Asakura–Chida, stated as a conjecture.
- **The examples.**
  - P¹ normalisation (parent): ∫_γ η(z, 1 − z) = D(b) − D(a).
  - Bloch's CM class on 36a1 (y² = x³ + 1), C = 6, Γ = 3. The ER.8 part gives the full six-torsion certificate schema (ψ6 with pole order 35, the Miller functions, every tame row) and the corrected scalar L(E, 2) = π R_q(U)/(324i) = (2π/3) Σ D_E(a), with no factor |μ_κ| = 6.
  - A non-rational torsion point on 36a1 over ℚ(ζ₃), with transfer. The ER.8 part gives the corrected symbol β = 6{ℓ, x} + {f_T, c_T} + {f_A, c_A} + {f_B, c_B}, its residue table, the rational identity for N_{L/ℚ}β and its regulator trace.
  - The integral modular-unit class on X₁(11) = 11a3, with its regulator on ω0 = (dx/(2y + 1))/Ω^+, and an unramified non-integral class. The ER.8 part checks admissibility at good p > 2.
  - Conductors 14, 35 and 54 (parent).
- **Imported certificates.** The symbol and integrality certificates are EllipticKTheory E.7's and E.8's (RT-AREA-ktheory-2/10). The Coleman and modular-symbol inputs are imported by node id (RT-AREA-ktheory-2/11).

The layer is planned, not closed. The ER.8 part records three gaps: the exact D.5 interface with the full regulator vector; the CM coordinate dictionary and an exact proof of the one-point identity Σ D_E(a) = −D_E((2, 3)); and the geometric signatures absent from the suggested Lean file.

**Coverage.**

- **In the parent packet: partial.** The P¹ and integrality examples are now fully specified with values. Revised by REV-EllipticRegulators.
  - Remaining: Syntomic elliptic specialisation (gap).
  - Remaining: CM example: the certificate of U and the instance of (11.2.4) for 36a1 depend on ER.5.
  - Remaining: Non-rational example: explicit class β over Q(√−3) to be written.
- **In the ER.8 part: planned.** Every target of the parent coverage record is represented or imported at target granularity. The exact quadratic beta and transfer are filled; the CM certificate is a full symbolic schema. The p-adic character dictionary is fixed by the finite-Fourier derivation and the odd-character test. Supplier and CM coordinate gaps remain, so this stage is not closed.
  - Remaining: Discharge the five supplier requests, including the full syntomic regulator vector and general elliptic Coleman trace compatibility.
  - Remaining: Instantiate the CM torsion-coordinate dictionary and prove the one-point D-sum identity exactly.
  - Remaining: Replace the explicitly omitted geometric suggested signatures with the actual owner types when supplied.

The ER.8 part accounts for the layer's targets as follows.

| Target | Nodes | Imported or requested |
|---|---|---|
| Syntomic elliptic specialisation | `ER.8/good-reduction-elliptic-pairing`, `ER.8/elliptic-syntomic-etale-factor`, `ER.8/frobenius-regulator-scalar`, `ER.8/neron-refinement-period-dictionary`, `ER.8/weight-two-beilinson-relation`, `ER.8/weight-two-padic-beilinson-conjecture` | `ER.8/the-syntomic-comparison` |
| CM class U, exact certificate schema and corrected 36a1 scalar | `ER.8/cm36-full-torsion-certificate`, `ER.8/cm36-corrected-l-value` | `ER.8/the-CM-worked-example`, `ER.5/the-class-U`, `ER.5/the-L-value-theorem` |
| Explicit nonrational β, norm residues and regulator trace | `ER.8/quadratic-corrected-symbol`, `ER.8/quadratic-transfer-certificate`, `ER.8/quadratic-regulator-trace` | `ER.8/the-nonrational-torsion-example` |
| Arithmetic-model integrality test | `ER.8/integral-example-padic-eligibility` | `ER.8/the-integrality-worked-example`, `EllipticKTheory:E.6/the-integral-part`, `EllipticKTheory:E.8/worked-example-bad-fibre` |
| P1 normalisation and modular-unit examples already completed by the parent | `ER.8/good-reduction-elliptic-pairing`, `ER.8/integral-example-padic-eligibility` | `ER.8/the-normalisation-example`, `ER.8/the-conductor-14-example` |

### The p-adic side: syntomic regulator and p-adic integrals

`ER.8/the-syntomic-comparison` · comparison · parent packet

Let E/Q have good reduction at a prime p. PadicHodgeRegulators:D.5 constructs the syntomic regulator reg_p : K2(E) ⊗ Q → H¹_dR(E/Q_p) of a smooth proper curve with good reduction and compares it on symbols with an explicit formula in Coleman integrals (ColemanIntegration:L1). This node specialises that comparison to the classes this roadmap constructs: for a class supported on torsion points (ER.4) or pushed forward from modular units (ER.7), ⟨reg_p(ξ), ω⟩ is expressed by the same finite combinatorics as ER.4's divisor formula, with the complex elliptic dilogarithm replaced by its p-adic (Coleman) counterpart; the formula is NOT decomposed here (no p-adic source read: gap). A p-adic Beilinson statement for E is formulated only after its ingredients are defined: the p-adic L-function of E (ModularSymbolsPadicLFunctions:L2, with the p-stabilisation and its Euler factors), the period normalisation (ModularSymbolsPadicLFunctions:L1) and the exceptional factors at p. The real-regulator theorem of ER.5 uses none of this.

**Hypotheses.**

- Good reduction at p, as D.5 and ColemanIntegration:L1 require; bad or semistable reduction needs the additional logarithmic input D.5 names and is not claimed.
- No p-adic statement is asserted; the node fixes the order of definitions and the suppliers.
- ER.5 and ER.7 are real-regulator statements and do not depend on this node.

**Proof outline.**

1. Import reg_p and its comparison with the explicit symbol formula from PadicHodgeRegulators:D.5.
2. Import Coleman integration on E from ColemanIntegration:L1.
3. Record, as a gap, the elliptic specialisation (Coleman-de Shalit's p-adic elliptic dilogarithm; Besser's formula for K2 of curves).
4. Record the prerequisites of a p-adic Beilinson statement and their owners.
5. Record that no p-adic object enters ER.5.

**Acceptance.**

- Every p-adic ingredient named has an owner outside this roadmap.
- No p-adic conjecture is stated before L_p(E, ·), its periods and its exceptional factors are defined.
- ER.5's theorem is independent of this node.
- Import the chosen period normalization and exceptional Euler factors from ModularSymbolsPadicLFunctions L1/L2. Good reduction alone does not identify the ordinary and supersingular p-adic L-function theories.

**Depends on.** this roadmap: `ER.4/the-divisor-formula`; layers of other roadmaps: `PadicHodgeRegulators:D.5`, `ColemanIntegration:L1`, `ModularSymbolsPadicLFunctions:L2`, `ModularSymbolsPadicLFunctions:L1`.

**Needed by.** this roadmap: `ER.8/good-reduction-elliptic-pairing`.

**Sources.**

- `Brunault.These.2005`, Définition 16, (1.27), p. 19: “L'application régulateur r_X associée à X est définie par r_X : K2(C(X)) → Hom_C(Ω^{1,0}(X), C)” — The complex regulator whose p-adic analogue D.5 constructs; no p-adic source was read (gap). The locator was 'p. 26', which is wrong.

**Assembly note.** The ER.8 part covers this example's target “Syntomic elliptic specialisation” with `ER.8/good-reduction-elliptic-pairing`, `ER.8/elliptic-syntomic-etale-factor`, `ER.8/frobenius-regulator-scalar`, `ER.8/neron-refinement-period-dictionary`, `ER.8/weight-two-beilinson-relation`, `ER.8/weight-two-padic-beilinson-conjecture`.

**Assembly note.** The parent's eleventh gap (the syntomic side is stated, not decomposed) is answered by the ER.8 part's six nodes, with one exception. The exact D.5 interface, including the full two-coordinate regulator vector, remains the ER.8 part's first gap and D.5 request. Besser's original paper on K₂ of curves was not obtained, so Besser–de Jeu, Remark 1.10, is the source used.

### The first worked example: a normalisation check on the projective line

`ER.8/the-normalisation-example` · comparison · parent packet

On P¹_C with coordinate z, for every path γ in C − {0, 1} from a to b: ∫_γ η(z, 1 − z) = D(b) − D(a), where η(f, g) = log|f| d arg g − log|g| d arg f is ER.2's form and D(z) = Im Li2(z) + arg(1 − z) log|z| is the Bloch-Wigner function. For γ the segment from 1/2 to e^{iπ/3}: ∫_γ η(z, 1 − z) = D(e^{iπ/3}) = 1.0149416064096536250212025542745…. Equivalently, on any compact Riemann surface X and f ∈ C(X) − {0, 1}: log|f| · ω ∧ ∂̄ log|1 − f| = (i/2) d((D∘f + i log|f| log|1 − f|) ω), so r_X({f, 1 − f}) = 0. The check fixes the factor and the sign relating η to D, and, through ⟨r_X({f, g}), ω⟩ = −(i/2)∫_X ω ∧ η(f, g), the factor between the two regulator formulas used in ER.2 and ER.7.

**Hypotheses.**

- The regulator of a symbol on P¹ itself is zero (Ω^{1,0}(P¹) = 0), and a symbol on P¹_Q with trivial tame symbols lies in the image of K2(Q), which is torsion; so the check is an identity of forms and path integrals, not a regulator value.
- The Bloch-Wigner function is Polylogarithms:P.1's.
- The identity is exact; the numerical value is a check.

**Proof outline.**

1. Differentiate D along γ: dD(z) = η(z, 1 − z) (Polylogarithms:P.1/bloch-wigner-differential).
2. Integrate along γ.
3. Evaluate at 1/2 (D = 0 on R) and e^{iπ/3}.
4. Derive the form identity (1.26) by the same computation with ω, and deduce r_X({f, 1 − f}) = 0 by Stokes.
5. Record that a factor or sign error in η or in the regulator formula shows up here.

**Acceptance.**

- ∫_γ η(z, 1 − z) = D(e^{iπ/3}) exactly; numerically 1.01494160640965362502120255427 (checker C, mpmath, 30 digits).
- r_X({f, 1 − f}) = 0 for every compact Riemann surface X.
- ⟨r_X({f, g}), ω⟩ = −(i/2)∫_X ω ∧ η(f, g).

**Depends on.** this roadmap: `ER.2/the-eta-form-and-its-differential-identity`, `ER.2/the-normalisation-factor`; other roadmaps: `Polylogarithms:P.1/bloch-wigner-dilogarithm`, `Polylogarithms:P.1/bloch-wigner-differential`.

**Needed by.** this roadmap: `ER.8/integral-example-padic-eligibility`.

**Sources.**

- `Brunault.These.2005`, Lemme 15 and (1.26), p. 19: “Lemme 15. Pour toute fonction méromorphe f ∈ C(X) − {0, 1} et toute forme différentielle holomorphe ω ∈ Ω^{1,0}(X), nous avons ∫_X log|f| · ω ∧ ∂̄ log|1 − f| = 0.” — The vanishing on Steinberg symbols; (1.26) gives the form identity.
- `Brunault.These.2005`, (3.106), p. 100: “De plus, elle est “exacte sur les relations de Steinberg” : nous avons η(f, 1 − f) = d(D ∘ f) (f ∈ C(X), f ≠ 0, 1), où D est la fonction de Bloch-Wigner.” — The identity the example evaluates.
- `Brunault.These.2005`, (3.110), p. 101: “⟨r_X({f, g}), ω⟩ = −(i/2) ∫_X ω ∧ η(f, g).” — The factor between the two regulator formulas.

**Assembly note.** The ER.8 part covers this example's target “P1 normalisation and modular-unit examples already completed by the parent” with `ER.8/good-reduction-elliptic-pairing`, `ER.8/integral-example-padic-eligibility`.

### The second worked example: Bloch's CM class on y² = x³ + 1

`ER.8/the-CM-worked-example` · comparison · parent packet

Take E : y² = x³ + 1 (Cremona 36a1), with CM by Z[ζ3], class number one, conductor 36 = 3·N(f) with f = 2√−3, so C = fg = 6 with g = −√−3 in ER.5's notation. The class U of ER.5 is built from Bloch's S_a at the 6-torsion points and descended to Q. The example exhibits (i) the divisors, uniformisers and leading units of every function in U and a certificate of vanishing tame symbols in EllipticKTheory:E.7/symbol-certificates format; (ii) the regulator of U by ER.4's divisor formula; (iii) ER.5's identity (11.2.4) with all its constants. Numerical targets (not proofs): L(E, 2) = 0.94001300738822578150…, L'(E, 0) = 0.85718907492991773072…, and, with the orientation ∫_{E(R)} dx/(2y) > 0 and P = (2, 3) of order 6, D_E(P) = −0.44882315008954339…, D_E((2ζ3, 3)) = 0.22441157504477169… = −D_E(P)/2, and L(E, 2) = −(2/3)·π·D_E(P) = (4/3)·π·D_E((2ζ3, 3)) to 19 digits.

**Hypotheses.**

- The curve, C, f, g and the finite character are fixed as above; the certificate is in EllipticKTheory:E.7's format and uses K2SymbolsBrauer's tame-symbol convention.
- The points of order 6 are not all rational: the class is constructed over a field containing E[6] and descended, which is also the non-rational example's situation.
- The numerical identity L(E, 2) = −(2/3)πD_E(P) is an observation to 19 digits; the proved statement is ER.5's theorem specialised.

**Proof outline.**

1. Write the functions ρ and f_a of Bloch's construction for C = 6 and their divisors on E[6].
2. Certify the tame symbols (EllipticKTheory:E.7/symbol-certificates, E.7/bloch-classes).
3. Descend U to Q (EllipticKTheory:E.7/rational-galois-descent).
4. Evaluate its regulator with ER.4/the-divisor-formula.
5. Instantiate ER.5/the-L-value-theorem and compare with the numerical targets.

**Acceptance.**

- The certificate of U has all four fields.
- ER.5's identity holds for this curve with every constant explicit.
- The numerical targets are reproduced (a check, not a proof).
- The explicit class U and its regulator come from ER.5; any assertion of arithmetic integrality requires the E.6 model/vertical certificate in addition to generic-fibre symbol certificates.

**Depends on.** this roadmap: `ER.5/the-class-U`, `ER.5/the-L-value-theorem`, `ER.4/the-divisor-formula`; other roadmaps: `EllipticKTheory:E.7/symbol-certificates`, `EllipticKTheory:E.7/bloch-classes`, `EllipticKTheory:E.7/rational-galois-descent`, `EllipticKTheory:E.6/the-regular-proper-model`.

**Needed by.** this roadmap: `ER.8/cm36-full-torsion-certificate`.

**Sources.**

- `Brunault.These.2005`, §0.5, p. 11: “Dans le cas où E est à multiplication complexe, Bloch a montré comment exprimer L(E, 2) comme combinaison linéaire de valeurs de D_E.” — The statement the example instantiates. The locator was 'p. 12', which is wrong.

**Assembly note.** The ER.8 part covers this example's target “CM class U, exact certificate schema and corrected 36a1 scalar” with `ER.8/cm36-full-torsion-certificate`, `ER.8/cm36-corrected-l-value`.

**Assembly note.** The ER.8 part fixes the scalar: L(E, 2) = π·R_q(U)/(324i) = (2π/3)·Σ_a D_E(a), summed over the three index points of ER.5, with no factor |μ_κ| = 6. The reduction of that sum to −(2π/3)·D_E((2, 3)) has been checked only numerically; it is the ER.8 part's second gap.

### The fourth worked example: an integral modular-unit class on X1(11) and its regulator, and an unramified non-integral class

`ER.8/the-integrality-worked-example` · comparison · parent packet

(a) Positive case. E = X1(11) : y² + y = x³ − x² (11a3), P = (0, 0) of order 5, (x) = [P] + [4P] − 2[O], (y) = 2[P] + [3P] − 3[O] (x, y are modular units supported on the cusps). The class ξ = {x, y} + {−1, x} has trivial tame symbols and is integral on the minimal model (EllipticKTheory:E.8/worked-example-bad-fibre (a), split multiplicative fibre at 11). With ω = (dx/(2y + 1))/Ω^+, Ω^+ = ∫_{E(R)} dx/(2y + 1) = 6.3460465213977671…, and the orientation making Ω^+ > 0: r_E(ξ)(ω) = ∫_{E(C)} log|x| ω ∧ ∂̄ log|y| = (i/2) Σ ord_a(x) ord_b(y) D_E(a − b) = −(i/2)·D_E((x)◇(y)) = −(5i/4) D_E(P) = −(11i/(8π)) L(E, 2) = −(πi/2) L'(E, 0) = −0.23899217135541461969… i, where (x)◇(y) = 8[O] − 7[P] + 3[2P] − 2[3P] − 2[4P] (second minus first) and D_E((x)◇(y)) = 5(D_E(2P) − D_E(P)) = (5/2)D_E(P). So ξ is a non-zero class in the integral part with an explicit rational regulator/L-value ratio. (b) Negative case. EllipticKTheory:E.8/worked-example-bad-fibre (b): on y² = x(x + 1)(x + 1/9) the certified class α is unramified on the generic fibre but no non-zero multiple is integral (vertical tame value at a component of the I_4 fibre at 3); only the rational K2 statement may be quoted for it.

**Hypotheses.**

- The integral part and vertical residues are EllipticKTheory's (E.6/the-integral-part, E.6/vertical-residues); the certificates are E.8's.
- The regulator value uses ER.4's divisor formula in Brunault's normalisation (1.29) + (1.64) and Brunault's Théorème 8 for the L-value.
- The constant symbol {−1, x} contributes nothing to the regulator.

**Proof outline.**

1. Import the integral certificate (a) and the non-integrality (b) from EllipticKTheory:E.8/worked-example-bad-fibre.
2. Compute (x)◇(y) and apply the divisor formula.
3. Use D_E(2P) = (3/2)D_E(P) and L(E, 2) = (10/11)πD_E(P) (ER.7/the-X1-11-example) and L'(E, 0) = 11L(E, 2)/(4π²) (root number +1).
4. State the honest conclusions: (a) a constructed integral class with non-zero regulator (first kind of ER.6); (b) the rational statement only.

**Acceptance.**

- (a) r_E(ξ)(ω) = −(5i/4)D_E(P) = −(πi/2)L'(E, 0). Direct numerical integration of ∫ log|x| ω ∧ ∂̄ log|y| over the period parallelogram gives −0.2389921521 i on an 800×800 grid (−0.23899186 i at 200, −0.23899209 i at 400), converging to −0.2389921713554 i (checker C, regint.gp).
- (b) T_η(mα) ≠ 1 for every non-zero integer m.
- Asserting integrality without the vertical check is what the example exists to prevent.

**Depends on.** this roadmap: `ER.4/the-divisor-formula`, `ER.7/the-X1-11-example`, `ER.6/the-vertical-step-that-is-required`; other roadmaps: `EllipticKTheory:E.8/worked-example-bad-fibre`, `EllipticKTheory:E.8/worked-example-certificate`, `EllipticKTheory:E.6/vertical-residues`.

**Needed by.** this roadmap: `ER.8/integral-example-padic-eligibility`.

**Sources.**

- `Brunault.These.2005`, Proposition 17, (1.29), p. 19: “Proposition 17. Pour toutes fonctions méromorphes f, g ∈ C(X)*, nous avons l'égalité r_X({f, g}) = Σ_{x∈(f)} Σ_{y∈(g)} ord_x(f) ord_y(g) R_X(x, y)” — The divisor formula in the source's normalisation.
- `Brunault.These.2005`, Proposition 26, (1.64), p. 26: “Alors nous avons R_ω(P, Q) = (i/2) D_E(P − Q) (P, Q ∈ E(R)), et ω = η*dz ∈ Ω^{1,0}(E(C)) est l'unique forme différentielle vérifiant ∫_{E^0(R)} ω = 1” — The normalisation of ω and of D_E used in (a).
- `Brunault.These.2005`, Remarques after Proposition 17, p. 19: “La localisation en K-théorie algébrique induit une inclusion K2^{(2)}(X_Q) ↪ K2(Q(X)) ⊗ Q” — The unramified classes; the integral ones are cut out by the vertical conditions (EllipticKTheory). The locator was 'p. 27', which is wrong.

**Assembly note.** The ER.8 part covers this example's target “Arithmetic-model integrality test” with `ER.8/integral-example-padic-eligibility`.

**Assembly note.** The ER.8 part re-derives admissibility at good p > 2 (`ER.8/integral-example-padic-eligibility`). The regulator value refers to ω0 = (dx/(2y + 1))/Ω^+, the positive period-one differential; on the unnormalised Néron differential it is multiplied by Ω^+ (REV-EllipticRegulators--ER.8).

### The third worked example: a non-rational torsion point, transfer and the trace formula

`ER.8/the-nonrational-torsion-example` · comparison · parent packet · added by REV-EllipticRegulators

On E : y² = x³ + 1 (36a1) the point T = (2ζ3, 3) of order 6 is defined over L = Q(√−3), with conjugate T' = (2ζ3², 3). Take a class β ∈ K2(E_L) supported on {O, T, T', (2, 3), (0, ±1), (−1, 0)} with trivial tame symbols over L (certificate over L), push it to Q by the transfer N_{L/Q}, and check: (i) the tame symbols of Nβ over Q are the residue-field norms of those of β (EllipticKTheory:E.7/transfer-of-certified-classes; the non-rational residue computation of EllipticKTheory:E.8/worked-example-nonrational-residue on the same curve is the model); (ii) the trace formula of ER.4: r(Nβ) at the complex place of Q equals the sum of r(σβ) over the two embeddings σ of L. The values D_E(T) = D_E(T') = 0.22441157504477169… = −D_E((2,3))/2 (checker C) enter through the divisor formula.

**Hypotheses.**

- L/Q is quadratic, so the norms are not the identity.
- The certificate format and tame-symbol convention are EllipticKTheory's and K2SymbolsBrauer's.
- Numerical values accompany the identities; they do not replace them.

**Proof outline.**

1. Exhibit β with its divisors and leading units over L and certify it.
2. Compute Nβ and its tame symbols by the norm-residue formula.
3. Evaluate r(σβ) for both embeddings by the divisor formula and compare their sum with r(Nβ).
4. Record what this tests beyond the first two examples: norms at a degree-two place and the trace formula.

**Acceptance.**

- The residues of Nβ are the norms of those of β.
- The trace formula holds in this instance.
- The class and all divisors are explicit.

**Depends on.** this roadmap: `ER.4/transfer-and-the-trace-formula`, `ER.4/the-divisor-formula`; other roadmaps: `EllipticKTheory:E.7/transfer-of-certified-classes`, `EllipticKTheory:E.8/worked-example-nonrational-residue`.

**Needed by.** this roadmap: `ER.8/quadratic-corrected-symbol`.

**Sources.**

- `Brunault.These.2005`, Corollaire 37, p. 40: “Corollaire 37. Soit l (resp. m) un diviseur de degré 0 sur X (resp. Y). Nous avons φ_* R_X(l, φ^* m) = R_Y(φ_* l, m).” — The geometric compatibility the source proves; the trace formula for a constant-field extension is ER.4's.

**Assembly note.** The ER.8 part covers this example's target “Explicit nonrational β, norm residues and regulator trace” with `ER.8/quadratic-corrected-symbol`, `ER.8/quadratic-transfer-certificate`, `ER.8/quadratic-regulator-trace`.

### A second modular-unit example: conductors 14, 35 and 54

`ER.8/the-conductor-14-example` · comparison · parent packet · added by REV-EllipticRegulators

For E_k : y² + kxy + y = x³ (k = −1, −2, −3; isomorphic to 14a4, 35a3, 54a3) and A = (0, 0) of order 3, (x) = (A) + (−A) − 2(O), (y) = 3(A) − 3(O), the tame symbols of {x, y} at O, A, −A are 1, −1, −1, so {x, y} ∈ K2(E_k) ⊗ Q; Brunault (2016) proves L(E_{−1}, 2) = (9π/7)D_{E−1}(A), L(E_{−2}, 2) = (36π/35)D_{E−2}(A), L(E_{−3}, 2) = (2π/3)D_{E−3}(A) through the modular-unit expression of x and y. This is the level-14 case that Théorème 4 cannot reach (no primitive characters mod 14).

**Hypotheses.**

- The curves are parametrised by modular units supported on rational torsion; the identities are proved in the cited paper by its Theorem 1, not by Théorème 4 of the thesis.
- Orientation: the one making ∫_{E(R)} dx/(2y + kx + 1) > 0.

**Proof outline.**

1. Record the divisors and the tame symbols of {x, y}.
2. Record the regulator of {x, y} by the divisor formula: it is a rational multiple of D_E(A).
3. Record the proved identities and their numerical check.

**Acceptance.**

- Numerically (checker C, PARI): L(E_{−1}, 2) = 0.64147133708796867992…, D(A) = 0.15881185312116081245…, ratio 9/7; L(E_{−2}, 2) = 0.94932492663132852534…, ratio 36/35; L(E_{−3}, 2) = 0.84677583812591668994…, ratio 2/3, each to at least 19 digits.

**Depends on.** this roadmap: `ER.4/the-divisor-formula`, `ER.7/symbols-of-modular-units-in-K2`, `ER.3/the-elliptic-dilogarithm`.

**Needed by.** this roadmap: `ER.8/integral-example-padic-eligibility`.

**Sources.**

- `Brunault.SiegelUnits.2016`, Theorem 24, §5.1, p. 13: “Theorem 24. — We have the identities L(E−1, 2) = (9π/7) DE−1(A), L(E−2, 2) = (36π/35) DE−2(A), L(E−3, 2) = (2π/3) DE−3(A).” — The identities, transcribed (fractions reconstructed from the text layer and confirmed numerically).
- `Brunault.SiegelUnits.2016`, §5.1, p. 12: “The tame symbols of {x, y} at 0, A, −A are respectively equal to 1, −1, −1, so that {x, y} defines an element of K2(Ek) ⊗ Q.” — The class.

**Assembly note.** The ER.8 part covers this example's target “P1 normalisation and modular-unit examples already completed by the parent” with `ER.8/good-reduction-elliptic-pairing`, `ER.8/integral-example-padic-eligibility`.

### Coleman formula for an elliptic syntomic regulator

`ER.8/good-reduction-elliptic-pairing` · comparison · ER.8 part

Let K/Q_p be finite, p>2, and let X/O_K be a smooth proper elliptic model with generic fibre E. Fix a p-adic logarithm branch. Let u lie in K2(X)^(2) tensor Q, and let its restriction to K(E) have finite symbol presentation Σ_i n_i{f_i,g_i}, n_i rational, with all horizontal tame symbols trivial. For every holomorphic differential η on E, Tr(reg_syn(u) cup η)=Σ_i n_i Σ_P ord_P(f_i) Tr_(K(P)/K)(CT_P(int log(g_i) η)). Here CT is the log-free constant term of a Coleman primitive in a local parameter, computed after finite extension; it is parameter independent for this primitive, and the degree-zero divisor makes the sum independent of its additive constant. This formula specialises the D.5 symbol comparison to elliptic symbols and their E.7 certificates. It determines the pairing with holomorphic η, not the whole two-dimensional de Rham regulator vector.

**Hypotheses.**

- K is a finite p-adic field; E has the stated smooth proper good-reduction model.
- The weight-two regulator, cup/trace pairing and restriction come from PadicHodgeRegulators:D.5; the model class must be supplied, not postulated.
- Coleman primitives must admit the stated expansions; general elliptic pullback and finite-extension descent inherit the supplier hypothesis/gap.

**Proof outline.**

1. Import the actual D.5 regulator and cup/trace comparison and the E.6 good-reduction extension of rational unramified classes.
2. Specialise Besser–de Jeu Remark 1.10 to E. Write log(g)=m log(t)+analytic and η=analytic dt: integration of t^n log(t) has a t^(n+1) factor, so changing the parameter does not change the constant term.
3. Use Coleman L1 for integration, Galois equivariance and finite-extension descent. For closed points use residue-field trace, not one chosen conjugate value.
4. Use the D.5 symbol formula to descend through Steinberg relations and presentation changes; local expansion alone is not that proof. Sum ord_P(f)[K(P):K]=0 to remove the primitive constant.

**Acceptance.**

- Changing a primitive by a constant does not change a principal-divisor evaluation.
- For a degree-two point, both conjugate evaluations enter via the residue-field trace.
- On P1 the Steinberg symbol {z,1-z} is zero; its proper-curve syntomic regulator is zero, although a based dilogarithm primitive on the punctured line need not vanish.
- The same corrected symbol can be presented in two ways without changing this pairing.

**Depends on.** this roadmap: `ER.8/the-syntomic-comparison`; other roadmaps: `ColemanIntegration:L1/coleman-integral`, `ColemanIntegration:L1/coleman-pullback`, `EllipticKTheory:E.7/symbol-certificates`, `EllipticKTheory:E.6/good-reduction-primes-impose-no-condition`; layers of other roadmaps: `PadicHodgeRegulators:D.5`, `ColemanIntegration:L1`.

**Needed by.** this roadmap: `ER.8/weight-two-padic-beilinson-conjecture`, `ER.8/integral-example-padic-eligibility`.

**Lean.** module `TauCeti/NumberTheory/EllipticRegulator/Examples`, namespace `TauCeti.EllipticRegulator.ER8`.

**Sources.**

- `BdJ2012`, Introduction, Remark 1.10, p. 4: “syntomic regulator” — Public restatement of the K2 Coleman–de Shalit formula, with the constant-term and closed-point conventions on pp. 3–4; no K4 theorem is imported.

### Frobenius correction in the elliptic regulator comparison

`ER.8/elliptic-syntomic-etale-factor` · theorem · planet “Syntomic regulator comparison” · ER.8 part

Let E/Q have good reduction at p>2. Extend its Q_p-linear untwisted crystalline Frobenius and cup pairing from H_dR^1(E/Q_p) to a coefficient field K containing γ. Under the D.5 identification of the weight-two syntomic regulator target with this extended de Rham space, let Φ be that extended linear operator, and let z=log_BK(reg_et(u)). Then reg_syn(u)=(1-p^(-2)Φ)z. With B(a,b)=Tr(a cup b), B(Φ a,Φ b)=p B(a,b). For Φ v=γ v, γ nonzero, B(reg_syn(u),v)=(1-1/(p γ)) B(z,v). Consequently the scalar normalised in this packet is (1-p/γ)(1-1/(p γ)) B(z,v)/B(ω,v), with B(ω,v) nonzero. The two factors have different origins and neither is omitted.

**Hypotheses.**

- E is defined over Q and p>2 is a good prime; K is a coefficient extension containing the selected eigenvalue. This is not an assertion of K-linearity for the semilinear crystalline Frobenius of an arbitrary curve over K.
- Use the untwisted H_dR^1 Frobenius (eigenpolynomial X²-a_p X+p); the Tate twist has already been accounted for in p^(-2).
- The étale regulator and Bloch–Kato logarithm and their domains are supplied by D.5/D.2.

**Proof outline.**

1. Import the cohomological identity from D.5, with the convention recorded in Asakura–Chida footnote 10 (Besser Proposition 9.11).
2. From Frobenius similitude and Φ v=γ v obtain B(Φ z,v)=p/γ B(z,v).
3. Expand B((1-p^(-2)Φ)z,v). Apply the scalar definition for the second displayed expression.

**Acceptance.**

- The linear-algebra signature assumes Frobenius similitude and the eigenvector equation, not the claimed regulator equality.
- For p=5,γ=2 the pairing factor is 9/10, not 1 or 3/5.

**Depends on.** this roadmap: `ER.8/frobenius-regulator-scalar`; layers of other roadmaps: `PadicHodgeRegulators:D.5`, `PadicHodgeRegulators:D.2`; libraries: `mathlib:LinearMap.BilinForm.smul_left`, `mathlib:LinearMap.BilinForm.smul_right`.

**Needed by.** this roadmap: `ER.8/weight-two-padic-beilinson-conjecture`.

**Lean.** module `TauCeti/NumberTheory/EllipticRegulator/Examples`, namespace `TauCeti.EllipticRegulator.ER8`.

**Sources.**

- `AC2023AM`, §6, footnote 10: “regsyn” — States the identity (1-p^(-2)Phi)log(reg_f)=reg_syn and its eigenvector pairing.
- `AC2023VOR`, Public publisher preview, footnote 10: “Proposition 9.11” — The published preview independently confirms the correction identity; its body was not read.

### The Frobenius-normalised weight-two regulator scalar

`ER.8/frobenius-regulator-scalar` · definition · planet “Frobenius regulator” · ER.8 part

For a characteristic-zero coefficient field K, a K-vector space H, a K-bilinear pairing B, ω,v,r in H and p,γ in K, define frobeniusRegulatorScalar(p,γ,B,ω,v,r)=(1-p/γ) B(r,v)/B(ω,v). The coordinate formula is total, but its geometric use requires γ nonzero and B(ω,v) nonzero. In the elliptic case H=H_dR^1(E/K), B=Tr(cup), r=reg_syn(ξ), ω is the selected Néron differential and Φ v=γ v. It is linear in r, invariant under multiplying v by a nonzero scalar, and scales by c^(-1) when ω is multiplied by c. At n=0 Γ·(-n)=1.

**Hypotheses.**

- Geometric use has p>2, p not dividing the conductor, γ a selected root of X²-a_p X+p, v nonzero in its eigenspace, and Φ(ω) not equal to γ ω.
- For the algebraic definition the geometric types are not assumed or reconstructed; denominator nonvanishing is explicit in its API.

**Construction.**

1. Use the n=0 definition of Rp,γ in Asakura–Chida §3.4.
2. Instantiate the existing bilinear-form interface. Derive linearity and scaling by bilinearity and cancellation with nonzero denominators.
3. Keep the denominator guard as part of every geometric invocation; field division at zero is not an admissible period coordinate.

**API.**

- `TauCeti.EllipticRegulator.ER8.frobeniusRegulatorScalar_eq` (data): The scalar is exactly (1-p/γ)B(r,v)/B(ω,v).
- `TauCeti.EllipticRegulator.ER8.frobeniusRegulatorScalar_zero` (simp): The scalar at r=0 is zero.
- `TauCeti.EllipticRegulator.ER8.frobeniusRegulatorScalar_add` (structure): R(r+s)=R(r)+R(s).
- `TauCeti.EllipticRegulator.ER8.frobeniusRegulatorScalar_smul` (structure): R(c r)=c R(r).
- `TauCeti.EllipticRegulator.ER8.frobeniusRegulatorScalar_scale_eigenvector` (characterisation): For c nonzero, γ nonzero and B(ω,v) nonzero, replacing v by c v leaves R unchanged.
- `TauCeti.EllipticRegulator.ER8.frobeniusRegulatorScalar_scale_differential` (compatibility): For c nonzero, replacing ω by c ω gives c^(-1)R; this is the same scaling as the Néron-normalised L-function period.

**Unit tests.**

- `TauCeti.EllipticRegulator.ER8.frobenius_scalar_small` (computation): Over Q² with B((a,b),(c,d))=ad-bc, p=5,γ=2,ω=(1,0),v=(0,1),r=(3,0), the scalar is -9/2.
- `TauCeti.EllipticRegulator.ER8.frobenius_scalar_zero` (degenerate): With the same data and r=0 the scalar is 0.
- `TauCeti.EllipticRegulator.ER8.frobenius_scalar_eigenvector` (compatibility): With the same data and v=(0,7), the scalar is still -9/2.
- `TauCeti.EllipticRegulator.ER8.frobenius_scalar_bad_denominator` (non-example): For B above and ω=v=(1,0), B(ω,v)=0. Such a coordinate is inadmissible even though the total field expression evaluates to 0.

**Acceptance.**

- The definition has no choice of eigenvector scale in its output.
- The denominator is checked before the scalar is used in a ratio.

**Uses.**

- Asakura–Chida §3.4, Conjecture 3.3 at n=0: Provides the p-adic denominator in the common rational-scalar relation.
- EllipticRegulators:ER.8/elliptic-syntomic-etale-factor: Separates the eigenline normalisation from the syntomic-to-étale Frobenius correction.
- EllipticRegulators:ER.8/integral-example-padic-eligibility: Evaluates an integral class only after selecting a good-prime eigenline and checking the cup denominator.

**Depends on.** this roadmap: `ER.1/primitive-real-regulator-cycles`; libraries: `mathlib:LinearMap.BilinForm.smul_left`, `mathlib:LinearMap.BilinForm.smul_right`.

**Needed by.** this roadmap: `ER.8/elliptic-syntomic-etale-factor`, `ER.8/weight-two-beilinson-relation`, `ER.8/integral-example-padic-eligibility`.

**Lean.** module `TauCeti/NumberTheory/EllipticRegulator/Examples`, namespace `TauCeti.EllipticRegulator.ER8`.

**Sources.**

- `AC2023AM`, §3.4, definition before Conjecture 3.3: “linearly independent” — Pins the cup/trace quotient, (1-p/gamma), eigenvector independence and the forbidden dependent case.

### Néron periods and the weight-two refined L-function

`ER.8/neron-refinement-period-dictionary` · theorem · ER.8 part

Let E/Q have conductor N, p>2 with p not dividing N, ω a Néron differential, and primitive integral cycles u+ and u- in the conjugation eigenspaces oriented by Ω+=∫_(u+)ω>0 and Ω-/i>0. Let f_E be its newform and γ a root of X²-a_p X+p with slope<1, or slope=1 with the refinement not θ-critical. Select the L1 period bases by the exact symbols λ±(a,m)=π i/Ω± times (∫_∞^(a/m) f_γ dz ± ∫_∞^(-a/m) f_γ dz). Import the resulting L2 (or L3) eigen-distribution μ_γ, and set Lp(E,χ,s)=int χ(x)<x>^(s-1)dmu_γ. For τ(χ)=sum χ(a)exp(2π i a/p^ν) and L(E,χ,s)=sum χ(n)a_n n^(-s), a nontrivial primitive χ has Lp(E,χ,1)=γ^(-ν)τ(χ)L(E,χ^(-1),1)/Ω^(χ(-1)). The trivial character has (1-γ^(-1))²L(E,1)/Ω+. Lp(E,ω_Teich^(-1),0) is the inverse-x moment, not a classical interpolation value. At critical slope use the eigenlift, not uniqueness from classical moments.

**Hypotheses.**

- The periods belong to primitive cycles; the whole real locus can have index two and is not silently substituted.
- The owner period-line basis must be matched to the specified Néron symbols; the pullback differential factor of a modular parametrisation must be included when used.
- The character convention is the reviewed L1/L2 convention. E29 corrects the accepted-manuscript formula in its displayed finite-coset convention.

**Proof outline.**

1. Import the L1 period lines and twisted Mellin formula, and the L2 p-adic distribution and interpolation theorem.
2. At weight two put j=0 in the owner moment formula; the stabilisation supplies the second Euler factor when χ is trivial.
3. For slope one import L3 non-theta-critical-lift and critical-slope-interpolation. Classical interpolation alone does not determine this distribution.
4. Track differential rescaling in both the periods and the regulator coordinate. Use L4 euler-factor-comparison as the explicit good-prime two-factor cross-check.

**Acceptance.**

- At χ=1 the Euler factor is the square (1-1/γ)².
- For primitive χ of conductor p^ν the factor is γ^(-ν), and its complex twist is χ^(-1).
- Replacing ω by c ω rescales Lp and Rp by c^(-1).
- The CM split critical refinement does not satisfy the stated non-θ-critical hypothesis.
- For the odd quadratic character modulo 3, τ²=-3, so 3/τ=-τ; this detects the accepted-manuscript sign error that even quadratic characters miss.

**Depends on.** this roadmap: `ER.1/primitive-real-regulator-cycles`, `ER.1/regulator-period-handoff`; other roadmaps: `ModularSymbolsPadicLFunctions:L1/period-lines`, `ModularSymbolsPadicLFunctions:L1/twisted-mellin-formula`, `ModularSymbolsPadicLFunctions:L2/p-adic-l-function`, `ModularSymbolsPadicLFunctions:L2/interpolation-and-uniqueness`, `ModularSymbolsPadicLFunctions:L3/non-theta-critical-lift`, `ModularSymbolsPadicLFunctions:L3/critical-slope-interpolation`, `ModularSymbolsPadicLFunctions:L4/euler-factor-comparison`.

**Needed by.** this roadmap: `ER.8/weight-two-padic-beilinson-conjecture`.

**Lean.** module `TauCeti/NumberTheory/EllipticRegulator/Examples`, namespace `TauCeti.EllipticRegulator.ER8`.

**Sources.**

- `AC2023AM`, §2.2 and §3.4: “Néron” — The Néron periods and weight-two specialisation; interpolation uses the corrected reviewed supplier convention.
- `AC2020`, §2.3, critical-slope discussion: “critical slope” — Explains why the theta-critical refinement is excluded.

### The common rational-scalar Beilinson relation

`ER.8/weight-two-beilinson-relation` · definition · ER.8 part

Let M be a Q-vector space (geometrically, the arithmetic-integral weight-two motivic group), K a characteristic-zero field, r_∞:M to R and r_p:M to K linear over Q, and A in R, B in K. Define WeightTwoBeilinsonRelation(r_∞,r_p,A,B) to mean: there exist ξ in M, q in Q and ε in {1,-1} such that ξ,q,r_∞(ξ),r_p(ξ) are nonzero, A=q r_∞(ξ), and B=ε q r_p(ξ), with q embedded separately in R and K. This is an explicit predicate on supplied maps; it neither constructs the motivic group nor asserts the conjecture. The ratios then equal q and ε q respectively. A common rational scalar is not an equality between elements of R and Q_p.

**Hypotheses.**

- The geometric r_∞ uses reg_D(ξ)(u-)/(2π i), and r_p uses frobeniusRegulatorScalar with actual syntomic regulator.
- The group M is the integral part, not the whole unramified generic-fibre group.
- Both regulator values and q are nonzero; no division-by-zero convention can make the relation hold.

**Construction.**

1. At n=0 cross-multiply the ratio in Asakura–Chida Conjecture 3.3 with nonzero regulators.
2. Retain the rationality of the real ratio as its Beilinson component rather than comparing the two coefficient fields.
3. Use Q-linearity to transport witnesses under nonzero rational scaling.

**API.**

- `TauCeti.EllipticRegulator.ER8.weightTwoBeilinsonRelation_iff` (characterisation): The predicate is equivalent to the displayed witnesses and equations.
- `TauCeti.EllipticRegulator.ER8.weightTwoBeilinsonRelation_ratios` (relation): A/r_∞(ξ)=q and B/r_p(ξ)=ε q for every witness.
- `TauCeti.EllipticRegulator.ER8.weightTwoBeilinsonRelation_rescale_witness` (functoriality): For c in Q nonzero, a witness ξ,q,ε becomes c ξ,q/c,ε.
- `TauCeti.EllipticRegulator.ER8.weightTwoBeilinsonRelation_change_sign` (compatibility): Replacing r_∞ by -r_∞ changes q to -q and ε to -ε, preserving the predicate.

**Unit tests.**

- `TauCeti.EllipticRegulator.ER8.beilinson_relation_small` (computation): On M=Q, K=Q, r_∞(x)=x and r_p(x)=2x, A=3,B=6 satisfy the relation with ξ=1,q=3,ε=1.
- `TauCeti.EllipticRegulator.ER8.beilinson_relation_zero` (degenerate): With r_p identically zero the relation is false for every A,B.
- `TauCeti.EllipticRegulator.ER8.beilinson_relation_wrong_ratio` (non-example): With the same nonzero maps, A=3,B=5 do not satisfy the relation.
- `TauCeti.EllipticRegulator.ER8.beilinson_relation_negative_sign` (compatibility): With those maps A=3,B=-6 satisfy the relation with ε=-1.

**Acceptance.**

- The predicate has an actual existential body with its equations.
- Zero regulator values are rejected.

**Uses.**

- EllipticRegulators:ER.8/weight-two-padic-beilinson-conjecture: States the n=0 conjecture without comparing elements of different coefficient fields.
- Asakura–Chida §3.4, regulator and period rescaling: Explains the Q× and sign ambiguities with exact transformation laws.

**Depends on.** this roadmap: `ER.8/frobenius-regulator-scalar`, `ER.2/chern-character-symbol-comparison`, `ER.2/oriented-period-coordinate-comparison`; other roadmaps: `EllipticKTheory:E.6/the-integral-part`.

**Needed by.** this roadmap: `ER.8/weight-two-padic-beilinson-conjecture`.

**Lean.** module `TauCeti/NumberTheory/EllipticRegulator/Examples`, namespace `TauCeti.EllipticRegulator.ER8`.

**Sources.**

- `AC2023AM`, §3.4, Conjecture 3.3 and preceding rationality sentence: “rational” — The cross-field equality is recorded through its common rational scalar and sign.

### Weight-two p-adic Beilinson conjecture for elliptic curves

`ER.8/weight-two-padic-beilinson-conjecture` · application · ER.8 part

Conjecture, not a proved theorem: let E/Q have good reduction at p>2, fix Néron ω and oriented primitive cycles as in neron-refinement-period-dictionary, and select γ with slope<1 or slope=1 non-θ-critical. Assume Φ(ω) is not γ ω. Put M=H_M^2(E,Q(2))_Z, r_∞(ξ)=reg_D(ξ)(u-)/(2π i), r_p(ξ)=(1-p/γ)Tr(reg_syn(ξ) cup v_γ)/Tr(ω cup v_γ), A=Lprime(E,0) and B=Lp(E,ω_Teich^(-1),0). The conjecture asserts WeightTwoBeilinsonRelation(r_∞,r_p,A,B). In a concrete example a proposed witness needs both an arithmetic-integral certificate and an exact L-value comparison; numerical agreement is an acceptance diagnostic, not a proof.

**Hypotheses.**

- All slope, good-reduction, orientation and denominator hypotheses of the normalisation nodes.
- The rationality of A/r_∞ is the real Beilinson component; the source p-adic ratio statement alone must not be read as a proof of it.
- The L-function uses the exact finite-coset dictionary in this packet, including the version-scoped source corrections E28–E29.

**Proof outline.**

1. Import the integral part from E.6, the Deligne comparison from ER.2 and the syntomic map from D.5.
2. Specialise Asakura–Chida Conjecture 3.3 to n=0 and their preceding real rationality formulation.
3. Apply the two normalisation nodes and the relation predicate. Retain conjectural status throughout.

**Acceptance.**

- Its label remains conjecture even when a numerical example passes.
- A horizontally unramified class with a nonzero vertical residue is not accepted as a witness.
- A CM split θ-critical refinement is not accepted by this statement.

**Depends on.** this roadmap: `ER.8/weight-two-beilinson-relation`, `ER.8/neron-refinement-period-dictionary`, `ER.8/good-reduction-elliptic-pairing`, `ER.8/elliptic-syntomic-etale-factor`; other roadmaps: `EllipticKTheory:E.6/the-integral-part`; layers of other roadmaps: `PadicHodgeRegulators:D.5`.

**Needed by.** this roadmap: `ER.8/integral-example-padic-eligibility`.

**Lean.** module `TauCeti/NumberTheory/EllipticRegulator/Examples`, namespace `TauCeti.EllipticRegulator.ER8`.

**Sources.**

- `AC2023AM`, §3.4, Conjecture 3.3 at n=0: “non-zero element” — Pins the integral motivic witness, slope alternatives and the ratio; the predicate also records the real Beilinson rationality component.

### Full six-torsion certificate for the CM class on 36a1

`ER.8/cm36-full-torsion-certificate` · application · ER.8 part

Let E:y²=x³+1, κ=Q(√(-3)), τ=(1+√(-3))/2 and L=κ(E[6]). In L(E) put ψ6=6xy(x³+4)(x³-8)(x^9+228x^6+48x³+64) and ρ=1/ψ6, so div(ρ)=35[O]-Σ_(b in E[6],b not O)[b]. For every nonzero b in E[6], let f_b be the leading-coefficient-one Miller function with div(f_b)=6[b]-6[O], using t_O=-x/y. It is computed by the fixed chain 1,2,3,6: f_1=1, f_2=h_(b,b)/v_(2b), f_3=f_2 h_(2b,b)/v_(3b), f_6=f_3² h_(3b,3b)/v_(6b), normalised at O; v_O=1; h_(P,Q)=v_P when P+Q=O with P,Q nonzero, h_(O,P)=h_(P,O)=v_P and h_(O,O)=1, so the quotient h_(P,Q)/v_(P+Q) is one if an input is O. For each chosen a, put c_(a,b)=tame_b{ρ,f_a}. For finite b not a this is f_a(b); at a it is r_a^6 u_a, where r_a and u_a are the leading units of ρ and f_a in the specified local parameter; at O it is 6^6. Set S_a=(6{ρ,f_a}+Σ_(b not O){f_b,c_(a,b)})/6. Each numerator has tame value one at every point, including O. For ER.5 the three a are the images under the fixed CM uniformisation of 1/6,(5+4τ)/6,(3+2τ)/6. Sum these S_a, then descend by N/[L:Q], to obtain exactly ER.5 U in rational K2.

**Hypotheses.**

- L contains all six-torsion points; the quadratic field alone does not suffice.
- The leading coefficient at O is one for f_b; ρ has leading coefficient -1/6 there. At finite b take t_b=x-x_b if y_b is nonzero, and t_b=y if y_b=0.
- The uniformisation and character are exactly those of ER.1/ER.5; their algebraic-coordinate dictionary is a supplier request.
- The generic-fibre certificate asserts no arithmetic integrality.

**Proof outline.**

1. Evaluate the pinned division-polynomial recurrence at E to obtain the displayed Ψ6. Use CoordinateRing.mk_ψ and evaluation at a point satisfying the curve equation to pass to ψ6, then the pinned ψ-zero/annihilation theorems and zsmul_fromAffine_eq_zero_iff to pass to affine six-torsion. Check that the displayed factors have simple zeros on the curve; the pole order is 35.
2. Import the pinned existence of principal torsion divisors and E.7 principal-divisors-on-rational-torsion over L. For the particular Miller functions given here, verify div(h_(P,Q)/v_(P+Q))=[P]+[Q]-[P+Q]-[O] by the line intersection formula, including the displayed vertical/infinity cases. The fixed chain has div(f_n)=n[b]-[nb]-(n-1)[O] at n=2,3,6 and is normalised at O. This is the explicit instance computation, not an additional Miller algorithm attributed to E.7.
3. Use orders (-1,0) at b not a, (-1,6) at a and (35,-6) at O to obtain the stated leading-unit residues.
4. At b not O the corrected numerator has residue c_(a,b)^6 c_(a,b)^(-6)=1; outside E[6] it is 1. At O reciprocity over the fully split field gives c_(a,O) product_(b not O)c_(a,b)=1, hence the numerator residue is 1.
5. Invoke E.7 choice independence over a number field and rational descent to match ER.5 U. The schema specifies all 35 finite rows for each of the three a, rather than omitting nonrational rows.

**Acceptance.**

- The certificate has support E[6], all residue fields L, the specified parameters and leading units, and a tame value one for every corrected row.
- ψ6 has pole order 35, not 36; ρ has the required divisor.
- At O the uncorrected residue is 6^6 and the corrected one is one.
- The three index points come from ER.5; substituting the quadratic β for U is not an acceptance test.

**Certificate.**

- *support*: All 36 points E[6]; each has residue field L=κ(E[6]).
- *parameters*: t_b=x-x_b when y_b is nonzero, t_b=y when y_b=0; t_O=-x/y.
- *leadingUnits*: ρ has order -1 at finite b and leading unit r_b=1/(coefficient of t_b in ψ6); at O it has order 35 and leading unit -1/6. f_a has order 6 and leading unit u_a at a, value f_a(b) at b not a,O, and order -6 with leading unit 1 at O.
- *tameRows*: c_(a,b)=f_a(b) for b not a,O; c_(a,a)=r_a^6 u_a; c_(a,O)=6^6. The corrected numerator has tame c_(a,b)^6 c_(a,b)^(-6)=1 at finite b, and (c_(a,O) product_(b not O)c_(a,b))^6=1 at O. These formulas specify every row from the fixed Miller functions and algebraic point coordinates.

**Depends on.** this roadmap: `ER.8/the-CM-worked-example`, `ER.5/the-class-U`, `ER.1/regulator-period-handoff`; other roadmaps: `EllipticKTheory:E.7/bloch-classes`, `EllipticKTheory:E.7/bloch-correction`, `EllipticKTheory:E.7/rational-galois-descent`, `EllipticKTheory:E.7/principal-divisors-on-rational-torsion`; layers of other roadmaps: `ComplexMultiplicationAndExplicitReciprocity:CM.1`, `ComplexMultiplicationAndExplicitReciprocity:CM.2`; libraries: `mathlib:WeierstrassCurve.Ψ`, `mathlib:WeierstrassCurve.preΨ_even`, `tauceti:WeierstrassCurve.zsmul_eq_zero_of_evalEval_ψ_eq_zero`, `tauceti:WeierstrassCurve.evalEval_ψ_eq_zero_of_zsmul_eq_zero`, `tauceti:WeierstrassCurve.Affine.exists_principal_zsmul_pointPlace_sub_infinity`, `mathlib:WeierstrassCurve.Affine.CoordinateRing.mk_ψ`, `tauceti:WeierstrassCurve.zsmul_fromAffine_eq_zero_iff`.

**Needed by.** this roadmap: `ER.8/cm36-corrected-l-value`.

**Lean.** module `TauCeti/NumberTheory/EllipticRegulator/Examples`, namespace `TauCeti.EllipticRegulator.ER8`.

**Sources.**

- `ERparent`, ER.5/the-class-U; ER.8/the-CM-worked-example: “The rational class U” — Specialises the accepted U and its index set, without defining U again.
- `MathlibDivision`, Ψ and preΨ_even definitions and recurrence: “division polynomials” — The polynomial is a computation of existing division polynomials, not a new general theory.

### The corrected CM L-value identity on 36a1

`ER.8/cm36-corrected-l-value` · application · ER.8 part

For the preceding U on E:y²=x³+1, use ER.5 f=2√(-3), g=-√(-3), C=6, y²=(Im τ)²=3/4 and the corrected Fourier transform with kernel <dual,input>. The reviewed character evaluation is χ_hat(gbar)g=3. Therefore L(E,2)=π/(324 i) R_q(U)=(2π/3) Σ_(a in the three ER.5 index points)D_E(a), where R_q(U)=i 6³ Σ_a D_E(a). There is no additional factor |μ_κ|=6. The parent numerical check L(E,2)=0.94001300738822578150… and Lprime(E,0)=0.85718907492991773072… remains a diagnostic. Reducing this sum to the parent empirical identity -(2π/3)D_E((2,3)) requires the explicit point/distribution identity and is recorded as a gap rather than inferred from decimal agreement.

**Hypotheses.**

- Use the twist-sensitive Hecke character of this rational model and ER.5 equality with the full elliptic Euler product.
- The regulator is Bloch R_q=J_q+iD_q in the reviewed convention; translating to the Beilinson period coordinate requires ER.2.
- No p-adic L-value theorem for U is inferred from this complex formula.

**Proof outline.**

1. Import ER.5 the CM setup, class U, Fourier transform and corrected L-value theorem, including inherited E7–E9.
2. Substitute C=6, y²=3/4 and χ_hat(gbar)g=3 into π χ_hat(gbar)g/(i y² C⁴), obtaining π/(324i).
3. Use ER.4 R_q(S_a)=C³R_q(a) and the real-valued L-series to remove the J-sum.
4. Keep the one-point numerical identity separate until the supplier point/distribution dictionary supplies an exact proof.

**Acceptance.**

- The complex scalar is π/(324i).
- The sum has three six-torsion index points, not all 35 nonzero points and not a sum over Q-rational points.
- The extra factor six in the printed book formula is absent.

**Depends on.** this roadmap: `ER.8/cm36-full-torsion-certificate`, `ER.5/the-CM-setup-and-the-hecke-character`, `ER.5/the-L-value-theorem`, `ER.5/fourier-transform-on-O-mod-C`, `ER.4/the-regulator-of-the-corrected-classes`, `ER.2/chern-character-symbol-comparison`.

**Lean.** module `TauCeti/NumberTheory/EllipticRegulator/Examples`, namespace `TauCeti.EllipticRegulator.ER8`.

**Sources.**

- `ERparent`, ER.5/the-L-value-theorem and its corrected 36a1 constants: “Bloch's theorem” — Uses the accepted correction rather than repeating the restricted book statement as if newly checked.

### An explicit corrected symbol at a quadratic six-torsion point

`ER.8/quadratic-corrected-symbol` · construction · planet “Corrected torsion symbol” · ER.8 part

Let L=Q(ζ), ζ²+ζ+1=0, E:y²=x³+1, T=(2ζ,3), A=(0,1), B=(0,-1). Then 2T=A,3T=(-ζ,0),6T=O and B=-A. Put ℓ=y-2ζ²x+1, m=y-ζ²x-1, fT=ℓ²m²/((ζ²x)²(ζ²x+1)), fA=(y-1)² and fB=(y+1)². These have divisors div(ℓ)=2[T]+[B]-3[O], div(x)=[A]+[B]-2[O], div(fT)=6[T]-6[O], div(fA)=6[A]-6[O], div(fB)=6[B]-6[O]. Set cT=1/(4ζ²), cA=2, cB=2ζ² and β=6{ℓ,x}+{fT,cT}+{fA,cA}+{fB,cB}. With tame{f,g}=(-1)^(ord f ord g)(f^(ord g)/g^(ord f))(P), the uncorrected symbol has values cT,cA,cB,1 at T,A,B,O. The corrected β has value one at every place. It defines a class in K2T(E_L), hence a unique rational K2(E_L) lift by E.3. Its raw representative quadraticSymbol is an element of the existing free abelian group on pairs of units; the symbol quotient and certificate are imported. Its support is the subset {T,A,B,O} of the parent target support.

**Hypotheses.**

- Characteristic zero; the selected complex embedding has ζ=exp(2π i/3).
- Use the same E.7 symbol certificate and tame convention as the parent.
- Unramifiedness is horizontal. A global arithmetic-integral certificate is a separate E.6/E.7 obligation.

**Construction.**

1. Substitute the tangent line into the curve: (2ζ²x-1)²-x³-1=-x(x-2ζ)²; the secant gives -x(x-2ζ)(x+ζ). Together with div(x), these prove the displayed divisors and fT.
2. At T use x-2ζ, at A and B use x, and at O use -x/y. At B ℓ/x has leading value -2ζ², so the tame sign gives +2ζ².
3. Compute cT cA cB=1. At each finite support point the residue is c^6 c^(-6)=1. At O the correction residues multiply to (cT cA cB)^6=1; outside the support all entries are units.
4. Apply E.7 symbol-certificates and the E.3 rational lift. Keep the raw free-group expansion as a prototype until the supplier quotient exists.

**API.**

- `TauCeti.EllipticRegulator.ER8.quadraticFunctionT_val` (data): The unit fT has value ℓ²m²/((ζ²x)²(ζ²x+1)) in the pinned function field.
- `TauCeti.EllipticRegulator.ER8.quadraticFunctionA_val` (data): The unit fA has value (y-1)².
- `TauCeti.EllipticRegulator.ER8.quadraticFunctionB_val` (data): The unit fB has value (y+1)².
- `TauCeti.EllipticRegulator.ER8.quadraticFunctionT_principal` (compatibility): Its Tau Ceti principal divisor is 6[T]-6[O], using the existing point places.
- `TauCeti.EllipticRegulator.ER8.quadraticSymbol_expand` (data): The raw representative is 6 of(ℓ,x)+of(fT,cT)+of(fA,cA)+of(fB,cB).
- `TauCeti.EllipticRegulator.ER8.quadraticSymbol_map` (universal-property): For every additive homomorphism out of the free group, its value is six times the first generator value plus the three correction values; after the supplier projection this is the stated β.
- `TauCeti.EllipticRegulator.ER8.quadraticSymbol_certified` (compatibility): The supplier tame/certificate map sends the raw representative to the unramified class β, with the stated four-point table.

**Unit tests.**

- `TauCeti.EllipticRegulator.ER8.quadratic_function_divisor` (compatibility): The Tau Ceti principal divisor of fT is 6[T]-6[O]; the existence of some such function alone does not certify this formula.
- `TauCeti.EllipticRegulator.ER8.quadratic_symbol_tameT_table` (computation): Evaluate the raw representative using the finite T-residue table: {ℓ,x} maps to cT, {fT,cT} to cT^(-6), the two other displayed generators to 1. The value is 1.
- `TauCeti.EllipticRegulator.ER8.quadratic_symbol_tameB_table` (computation): Use the B-table: {ℓ,x} maps to 2ζ², {fB,2ζ²} to (2ζ²)^(-6), and the other displayed generators to 1. The corrected value is 1; the uncorrected symbol has value 2ζ², not -2ζ².
- `TauCeti.EllipticRegulator.ER8.quadratic_symbol_infinity_table` (computation): The infinity-table value of the raw representative is cT^6 cA^6 cB^6=1.
- `TauCeti.EllipticRegulator.ER8.quadratic_uncorrected_nonexample` (non-example): The uncorrected generator {ℓ,x} has T-table value cT=1/(4ζ²), which is not 1.

**Acceptance.**

- The raw symbol is genuinely written with specific functions and constants.
- All local leading units and signs are checked, including O.
- The generic-fibre certificate is not called an arithmetic-integral certificate.

**Certificate.**

- *support*: T=(2ζ,3); A=(0,1); B=(0,-1); O
- *residueFields*: Every row is L=Q(ζ). All other points have tame value one because the entries are units.

| point | uniformiser | ℓ: (order,leading unit) | x: (order,leading unit) | fT: (order,leading unit) | fA: (order,leading unit) | fB: (order,leading unit) | uncorrected tame | corrected tame |
|---|---|---|---|---|---|---|---|---|
| T | x-2ζ | (2,ζ/3) | (0,2ζ) | (6,1/108) | (0,4) | (0,16) | 1/(4ζ²) | 1 |
| A | x | (0,2) | (1,1) | (0,4) | (6,1/4) | (0,4) | 2 | 1 |
| B | x | (1,-2ζ²) | (1,1) | (0,16) | (0,4) | (6,1/4) | 2ζ² | 1 |
| O | -x/y | (-3,-1) | (-2,1) | (-6,1) | (-6,1) | (-6,1) | 1 | 1 |

**Uses.**

- Parent ER.8/the-nonrational-torsion-example: Supplies the formerly unspecified β with its full horizontal certificate.
- EllipticRegulators:ER.8/quadratic-transfer-certificate: Provides a concrete norm computation over a quadratic field.
- EllipticRegulators:ER.8/quadratic-regulator-trace: Its specific divisors determine the complex regulator by ER.4.
- EllipticRegulators:ER.8/good-reduction-elliptic-pairing: At good p>3, after local model extension, supplies an elliptic symbol input; no conjectural L-value identity is claimed for it.

**Depends on.** this roadmap: `ER.8/the-nonrational-torsion-example`; other roadmaps: `EllipticKTheory:E.7/symbol-certificates`, `EllipticKTheory:E.7/bloch-correction`, `EllipticKTheory:E.3/what-the-sequence-does-not-identify`; libraries: `mathlib:FreeAbelianGroup`, `mathlib:FreeAbelianGroup.of`, `mathlib:FreeAbelianGroup.lift`, `mathlib:WeierstrassCurve.Affine.FunctionField`, `tauceti:WeierstrassCurve.Affine.genericX`, `tauceti:WeierstrassCurve.Affine.genericY`, `tauceti:WeierstrassCurve.Affine.equation_genericX_genericY`, `tauceti:WeierstrassCurve.Affine.isFunctionField`, `tauceti:TauCeti.Divisor.principal`, `tauceti:WeierstrassCurve.Affine.exists_principal_zsmul_pointPlace_sub_infinity`.

**Needed by.** this roadmap: `ER.8/quadratic-transfer-certificate`.

**Lean.** module `TauCeti/NumberTheory/EllipticRegulator/Examples`, namespace `TauCeti.EllipticRegulator.ER8`.

**Sources.**

- `ERparent`, ER.8/the-nonrational-torsion-example: “non-rational torsion point” — The explicit construction fills the accepted target. The displayed functions and residue table are this packet's direct algebraic computation; the general correction is E.7.

### Quadratic transfer and its degree-two residue certificate

`ER.8/quadratic-transfer-certificate` · theorem · planet “Transfer of a torsion symbol” · ER.8 part

For β above, let β_bar be its ζ-to-ζ² conjugate. In K2(Q(E)) tensor Q the transfer N_(L/Q)β equals γ=6{H,x}+{F,1/4}+{fA,4}+{fB,4}, where H=(y+1)²+2x(y+1)+4x²=ℓ ℓ_bar, J=(y-1)²+x(y-1)+x²=m m_bar, and F=H²J²/[x^4(x²-x+1)]=fT fT_bar. This is a rational identity: rewriting cT=ζ/4 and cB=2ζ² discards symbols with a root-of-unity entry, killed by 3. At the Q-closed point Z=(x²+2x+4=0,y=3), with x0=2ζ, the tame value of {H,x} is 1/x0²=1/(4ζ²) in Q(ζ), not its norm 1/16. Its value to the sixth power is (1/4)^6 and cancels {F,1/4}. At A and B the uncorrected value is 4 and cancels the corresponding order-six correction. At O the value of the corrected expression is (1/4)^12 4^6 4^6=1. Thus γ has an exact horizontal certificate over Q; the integral transfer N β itself is certified by E.7 transfer-of-certified-classes. No equality of these integral representatives is asserted.

**Hypotheses.**

- L/Q is the actual quadratic constant-field extension; residue-field norms are taken only in the transfer boundary formula.
- The rational representative discards 3-torsion and is not an integral formula for N β.

**Proof outline.**

1. Apply the E.7 projection formula to the terms with second entry in Q. For the others use bilinearity and the root-of-unity torsion before tensoring with Q.
2. Compute H,J,F exactly using ζ²+ζ+1=0 and y²=x³+1.
3. Compute div(H)=2[T]+2[Tbar]+2[B]-6[O] and div(F)=6[T]+6[Tbar]-12[O]. At Z use x-x0 over its own residue field and compute 1/x0².
4. Check the remaining A,B,O rows directly and compare them with the E.7 norm-residue formula. The result is the full certificate, not just the normed-product reciprocity check.

**Acceptance.**

- The residue at Z is tested in Q(ζ) before its norm is taken.
- Root-of-unity terms disappear only after rationalisation.
- All four Q-closed support rows Z,A,B,O have tame value one.

**Certificate.**

- *support*: Z=(x²+2x+4=0,y=3); A; B; O

| point | residueField | uniformiser | uncorrected | correction | value |
|---|---|---|---|---|---|
| Z | Q(ζ) | x-x0, x0=2ζ in its residue field | 1/(4ζ²) | (1/4)^(-6) | (1/(4ζ²))^6 (1/4)^(-6)=1 |
| A | Q | x | 4 | 4^(-6) | 4^6 4^(-6)=1 |
| B | Q | x | 4 | 4^(-6) | 4^6 4^(-6)=1 |
| O | Q | -x/y | 1 | (1/4)^12 4^6 4^6 | 1 |

**Depends on.** this roadmap: `ER.8/quadratic-corrected-symbol`; other roadmaps: `EllipticKTheory:E.7/transfer-of-certified-classes`, `EllipticKTheory:E.7/rational-galois-descent`, `EllipticKTheory:E.8/worked-example-nonrational-residue`.

**Needed by.** this roadmap: `ER.8/quadratic-regulator-trace`.

**Lean.** module `TauCeti/NumberTheory/EllipticRegulator/Examples`, namespace `TauCeti.EllipticRegulator.ER8`.

**Sources.**

- `ERparent`, ER.8/the-nonrational-torsion-example, transfer acceptance: “transfer” — This packet computes the target transfer; residue-field norms and rational torsion are owned by E.7.

### Regulator trace of the explicit quadratic class

`ER.8/quadratic-regulator-trace` · application · ER.8 part

Use ER.4 diamond (f) diamond (g)=sum m_P n_Q[Q-P] and R_q=J_q+iD_q, with r_source(ξ)(dz)=one half conjugate R_q(diamond ξ). For ℓ and x the diamond is 7[O]+2[T]-5[2T]+2[3T]-2[4T]-4[5T]. Since 2T=A,4T=-A,5T=-T and 3T is two-torsion, its odd evaluation is 6R_q(T)-3R_q(A). Constant-entry corrections have zero regulator, so r_source(β)(dz)=18 conjugate R_q(T)-9 conjugate R_q(A). The transfer trace is r_source(N β)(dz)=18 conjugate(R_q(T)+R_q(Tbar)-R_q(A)). For the rational transferred class and the real-adapted differential its real part vanishes, hence r_source(N β)(dz)=-18i(D_E(T)+D_E(Tbar)-D_E(A)). Neither the individual β regulator nor the trace is identified with the Néron-cycle R_∞ without the ER.2 factor-two and period conversion.

**Hypotheses.**

- Use the parent ER.1 orientation and ER.3 odd q-invariant function.
- T and Tbar correspond to the two embeddings of L; A is rational.
- The full complex identity precedes the imaginary-coordinate simplification.

**Proof outline.**

1. Expand the finite diamond and apply oddness. Check the coefficients before applying any numerical values.
2. Apply ER.4 divisor formula; all constant-symbol corrections contribute zero.
3. Apply the existing constant-field trace theorem, then the rational real-structure comparison to obtain the imaginary expression.
4. Convert to the Deligne period only through ER.2. Parent decimals for D(T),D(Tbar) are diagnostics and do not prove a distribution identity or a p-adic L-value equality.

**Acceptance.**

- The coefficient of D(T)+D(Tbar)-D(A) in the source regulator is -18i.
- Reversing the diamond convention reverses the odd regulator sign and fails this test.
- One does not replace r_source(β) by its imaginary part before taking the trace.

**Depends on.** this roadmap: `ER.8/quadratic-transfer-certificate`, `ER.4/the-diamond-convolution`, `ER.4/the-divisor-formula`, `ER.4/transfer-and-the-trace-formula`, `ER.3/the-companion-and-Bloch-convention`, `ER.2/chern-character-symbol-comparison`, `ER.2/oriented-period-coordinate-comparison`.

**Lean.** module `TauCeti/NumberTheory/EllipticRegulator/Examples`, namespace `TauCeti.EllipticRegulator.ER8`.

**Sources.**

- `ERparent`, ER.4/transfer-and-the-trace-formula; ER.8/the-nonrational-torsion-example: “TRACE FORMULA” — Instantiates the reviewed constant-field transfer theorem and divisor convention with the new beta.

### Arithmetic integrality and admissibility of the worked examples

`ER.8/integral-example-padic-eligibility` · application · ER.8 part

On E11:y²+y=x³-x² (11a3), import ξ={x,y}+{-1,x}, its rational lift and its arithmetic-integral certificate on the regular minimal proper model over Z. The discriminant is -11; the fibre at 11 is split I1 and irreducible, and x,y have vertical order zero. Thus ξ is an admissible integral input at every good p>2 with p not equal to 11, after the eigenline and period conditions above. Its complex source regulator evaluated on ω0=(dx/(2y+1))/Ω_plus is -11i/(8π)L(E11,2)=-π i/2 Lprime(E11,0), where Ω_plus is the positive primitive real-cycle period of dx/(2y+1) fixed by the parent orientation. This is the period-one differential, not the unnormalised Néron differential. In contrast the u=1/3 example y²=x(x+1)(x+1/9) has the vertical residue 1/w of infinite order on the component V=0 at 3 of the E.8 model, so no nonzero rational multiple of its horizontally certified class lies in the global integral part. A regulator can be evaluated locally at a good prime without making that second class an integral witness for the global Beilinson conjecture. The quadratic β and CM U need an independent vertical certificate for any global integral claim.

**Hypotheses.**

- The arithmetic model, integral part and vertical boundary maps are owned by E.6, and their certificate by E.7/E.8.
- The E11 real regulator is r_source evaluated on the period-one ω0=(dx/(2y+1))/Ω_plus, not directly the Deligne cycle coordinate. The Néron-differential evaluation scales by Ω_plus.
- No p-adic numerical L-value comparison for E11, β or U is asserted.

**Proof outline.**

1. Import both sides of the parent integrality example and E.8 worked-example-bad-fibre.
2. Apply E.6 vertical-residues and E.7 integral-certificates to the irreducible E11 fibres, whose x,y valuations vanish.
3. At good p obtain the local smooth proper model and invoke the pairing and scalar contracts, checking the selected refinement.
4. For the negative example retain the nonzero infinite-order vertical residue, even though its horizontal certificate and reciprocity tests pass.

**Acceptance.**

- The positive ξ carries both horizontal and vertical certificates.
- The nonzero 1/w vertical residue rejects every nonzero rational multiple of the negative class.
- Good p excludes 11 for E11 and excludes 2,3 for E36.
- The parent P1 and conductor-14/35/54 examples remain imported, with their original orientation and numerical qualifications.
- The E11 scalar is quoted only with its period-one differential; evaluating on dx/(2y+1) multiplies it by Ω_plus.

**Depends on.** this roadmap: `ER.8/the-integrality-worked-example`, `ER.8/the-normalisation-example`, `ER.8/the-conductor-14-example`, `ER.8/good-reduction-elliptic-pairing`, `ER.8/frobenius-regulator-scalar`, `ER.8/weight-two-padic-beilinson-conjecture`; other roadmaps: `EllipticKTheory:E.6/the-regular-proper-model`, `EllipticKTheory:E.6/the-integral-part`, `EllipticKTheory:E.6/vertical-residues`, `EllipticKTheory:E.7/integral-certificates`, `EllipticKTheory:E.8/worked-example-bad-fibre`.

**Lean.** module `TauCeti/NumberTheory/EllipticRegulator/Examples`, namespace `TauCeti.EllipticRegulator.ER8`.

**Sources.**

- `ERparent`, ER.8/the-integrality-worked-example, revised acceptance: “integral” — Imports the complete positive and negative examples and specialises their arithmetic eligibility without rebuilding models or K-theory.

## Mistakes found in the sources

These are recorded under PROTOCOL.md section 18, and every node above uses the corrected statement. The independent review of the part that records each finding checked it at its locator.

- **The parent packet** lists 23, E1–E23: 13 in Brunault's thesis (with Merel's appendix), 9 in Bloch's monograph and 1 in Zagier's paper.
- **The ER.2 part** adds E24–E27, four misprints in the author copy of Nekovář's *Beilinson's conjectures*.
- **The ER.3 part** adds E-ER3-1, a sign in Zagier's Theorem 1. **The ER.4 part** adds ER4-E1, an endpoint in Bloch's §10.3 as transcribed publicly.
- **The ER.7 part** adds a misprint in Schappacher–Scholl 3.1.8, recorded under the id `EllipticRegulators/E24`, which the ER.2 part already uses for a different finding. The two records are printed separately below. The register `research/errata/REGISTER.md` and `data/source-issues.json` carry both under the same id, so one of them must be renumbered; the handoff note proposes `EllipticRegulators/E30` for the ER.7 finding.
- **The ER.8 part** adds E28 and E29, against the Asakura–Chida preprint and accepted manuscript.
- **The ER.5 part** records no new finding; it re-confirms E7, E8 and E9 in its own review. **The ER.3 part** reuses E2, E3, E5, E6 and Polylogarithms E11–E12.

### EllipticRegulators/E1 — misprint (affects nothing)

- **Source:** `Brunault.These.2005`, §1.1, Remarques, item 3, p. 20 (arXiv v1).
- **Printed:** La proposition 1.23 jointe à la relation de Steinberg {f, 1 − f} = 0 entraîne la relation suivante pour la fonction RX
- **Correction:** La proposition 17 (formule (1.28)) jointe à la relation de Steinberg ...
- **Reason:** There is no Proposition 1.23; (1.23) is the display of the regulator map r_X. The relation (1.31) is (1.28) applied to g = 1 − f, together with Lemma 15.
- **Known:** new. Searched: arXiv listing of math/0602186 (v1 is the only version)
- **Review:** confirmed by REV-EllipticRegulators. Found by checker A: there is no Proposition 1.23; (1.31) is (1.28) with g = 1 − f and Lemma 15.
- **Recorded in:** the parent packet.

### EllipticRegulators/E2 — gap (affects the proof)

- **Source:** `Brunault.These.2005`, §1.2, proof of Proposition 24, pp. 25–26 (arXiv v1).
- **Printed:** Cela résulte d'un calcul sans difficulté combinant la définition de Rω et la proposition 22. [...] En intervertissant les signes Σ et ∫, il vient
- **Correction:** The interchange needs a justification: pair G_E(P, ·) in the Sobolev space H^{1/2}(E) with ω ∧ ∂̄G_E(Q, ·) in H^{−1/2}(E), where Parseval holds, or insert the Gaussian factor e^{−δ‖λ‖²} and let δ → 0; the resulting series Σ' χ_λ η(λ)/‖λ‖⁴ is absolutely convergent.
- **Reason:** The Fourier series of G_E is not absolutely convergent (the source's own Remarque 23), G_E(Q, ·) is not C¹ and ∂̄G_E(Q, ·) ~ 1/(2|t − Q|) is not in L²(E), so neither termwise integration nor L²-Parseval applies as written. The stated result (1.61) is true: 2R_ω(P, 0) from (1.62) agrees with −J(q; x) + iD_q(x) to 7 digits at τ = 0.23 + 1.05i.
- **Known:** new. Searched: arXiv listing of math/0602186 (v1 only)
- **Review:** confirmed by REV-EllipticRegulators. Found by checker A: the source's own Remarque 23 says the Green-function series is not absolutely convergent, so the interchange needs the stated justification; the result (1.61) was confirmed numerically to 7 digits.
- **Recorded in:** the parent packet.

### EllipticRegulators/E3 — gap (affects nothing)

- **Source:** `Brunault.These.2005`, §1.2, after Théorème 21, pp. 23–24 (arXiv v1).
- **Printed:** Cette dernière fonction est liée à la fonction Jq de Bloch [12, (8.1.4), p. 62] ; elle coïncide avec l'opposée de la fonction J(q; x) définie par Zagier [79, p. 616].
- **Correction:** True as stated, but asserted without proof; a proof is the imaginary part of the Kronecker expansion, established as for Théorème 21 (Bloch (10.3.1) with Lemma 10.2.3 for the m = 0 terms) and extended by continuity.
- **Reason:** Numerically J_{E,η} = −(Im τ)²/π Im Σ' χ_λ/(η(λ)² conj η(λ)) equals −J(q; x) to 15 digits at three points (τ = 0.23 + 1.05i, 0.8i, 1/2 + 0.9i).
- **Known:** new. Searched: arXiv listing of math/0602186 (v1 only)
- **Review:** confirmed by REV-EllipticRegulators. Found by checker A; the identity J_{E,η} = −J(q; ·) was confirmed to 15 digits at three points.
- **Recorded in:** the parent packet.

### EllipticRegulators/E4 — misprint (affects nothing)

- **Source:** `Bloch.CRM11`, Lecture 8, proof of Lemma 8.1.4, printed p. 63.
- **Printed:** J_{q,G}(qx) − J_{q,G}(x) = Σ e_k (log|β_k x|)² = Σ e_k (log|β_k|)²; J_{q,G}(q^n x) − J_{q,G}(x) = Σ n e_k (log|β_k|)²; ... = Σ −d_j n_j e_k (log|β_k|)² = 0.
- **Correction:** J_{q,G}(qx) − J_{q,G}(x) = −Σ e_k (log|β_k x|)² = −Σ e_k (log|β_k|)²; J_{q,G}(q^n x) − J_{q,G}(x) = −n Σ e_k (log|β_k|)²; the last line becomes Σ d_j n_j e_k (log|β_k|)², still 0 because Σ d_j n_j = 0.
- **Reason:** By (8.1.5), J_q(qx) − J_q(x) = −(log|x|)² (confirmed numerically: −1.25787121131 = −(log|x|)² at τ = 0.23 + 1.05i, x = exp(2πi(0.31 + 0.17τ))).
- **Known:** new. Searched: the supplied scan only; no errata list for CRM Monograph Series 11 was available to this checker
- **Review:** confirmed by REV-EllipticRegulators. Found by checker A from the scan; the sign follows from (8.1.5), confirmed numerically.
- **Recorded in:** the parent packet.

### EllipticRegulators/E5 — gap (affects the proof)

- **Source:** `Bloch.CRM11`, Lecture 9, proof of Theorem 9.1.1, printed p. 69; Lecture 8, Lemma 8.2.3, printed p. 66.
- **Printed:** Further, since the expression J_q(f⊗(K−f)) is continuous as a function of the divisors (f) and (K−f), we may assume K ≠ 0, 1, and f is general [...]; Assume also (for simplicity) that all e_k = ±1.
- **Correction:** Prove the continuity used: for fixed f, K ↦ J_q(f ⊗ (K − f)) is continuous on C^× (uniform continuity of J_{F,q}, Lemma 9.1.5, plus continuity of the roots of F − K), and F − K has multiple zeros for only finitely many K (critical values of f); the case of multiple zeros then follows by continuity.
- **Reason:** The reduction to simple zeros is asserted, and Lemma 8.2.3 is only proved under e_k = ±1; the general case of the theorem rests on the unproved continuity.
- **Known:** new. Searched: the supplied scan only
- **Review:** confirmed by REV-EllipticRegulators. Found by checker A: the reduction to simple zeros rests on a continuity that is not proved.
- **Recorded in:** the parent packet.

### EllipticRegulators/E6 — misprint (affects a stated result)

- **Source:** `Zagier.BWR.1990`, §2, p. 616 (Math. Ann. 286; author's scanned copy).
- **Printed:** D(q; x) − iJ(q; x) = (i/π) ℑ(τ)² Σ'_{m,n} sin(2π(nξ − mη))/((mτ + n)²(mτ̄ + n)), where q = e^{2πiτ}, x = e^{2πiu} with u = ξτ + η
- **Correction:** D(q; x) − iJ(q; x) = −(i/π) ℑ(τ)² Σ'_{m,n} sin(2π(nξ − mη))/((mτ + n)²(mτ̄ + n)), equivalently with sin(2π(mη − nξ)).
- **Reason:** At τ = 0.23 + 1.05i, ξ = 0.17, η = 0.31: D(q; x) − iJ(q; x) = 0.5029402595 − 0.4335230780i from the orbit sums (25 digits), while the printed right-hand side (lattice sum over |m|, |n| ≤ 120) is −0.5029403073 + 0.4335231634i. Brunault's (1.50), with J_{E,η} = −J(q; ·) and the complex orientation of the intersection pairing, gives the corrected sign.
- **Known:** new as far as searched. Searched: Zagier's MPIM publication page (the copy read); the Zagier–Gangl survey was not consulted
- **Review:** confirmed by REV-EllipticRegulators. Found by checker A: the printed sign disagrees with the orbit sums at a test point by −1; Brunault's (1.50) has the corrected sign.
- **Recorded in:** the parent packet.

### EllipticRegulators/E7 — error (affects a stated result)

- **Source:** `Bloch.CRM11`, Lecture 11, (11.1.1) p. 87, (11.1.2) and Lemma 11.1.2 p. 88 (printed pages; supplied scan of the 2000 CRM edition).
- **Printed:** (11.1.1) f̂(k + ℓτ) = (1/C) Σ_{a,b=0}^{C−1} f(a + bτ)e^{2πi[(−aℓ+bk)/C]}. … (11.1.2) Σ f̂(k + ℓτ)R_q(S_{(k+ℓτ)/C}) = (iy²C⁴/π) Σ_{(m,n)≠(0,0)} f(m + nτ)/((m + nτ)²(m + nτ̄)). LEMMA 11.1.2. R_q(S_{(a+bτ)/C}) = (y²C³/π) Σ sin(2π[an − bm]/C)/((m + nτ)²(m + nτ̄))
- **Correction:** With the kernel as printed in (11.1.1), (11.1.2) holds with −iy²C⁴/π, and Lemma 11.1.2 holds with sin(2π[bm − an]/C). Equivalently, keep (11.1.2) and define f̂(k + ℓτ) = (1/C) Σ f(a + bτ)e^{2πi(aℓ − bk)/C} = (1/C)Σ_y f(y)⟨x, y⟩, which is the transform the proof of Lemma 11.1.7 (p. 91) actually uses.
- **Reason:** Substituting f(m, n) = F(n + mτ) into Theorem 10.2.1 gives f̂₁₀(k, ℓ) = C^{-2}Σ_y F(y)⟨k+ℓτ, y⟩ = C^{-1}·F̂(k+ℓτ), the kernel e^{2πi(aℓ−bk)/C}, not the printed one; the two differ by the sign for odd F. Numerically (reviewer): for the odd CM characters of ℚ(i) (C = 4), ℚ(√−3) (C = 6), ℚ(√−7) (C = 7, 14), Σ F̂R_q(S)/(iy²C⁴/π·Σ F(w)/(w²w̄)) = −1.000000000 with the printed kernel and +1 with the corrected one, while Theorem 10.2.1 itself checks to ratio 1; the lattice sum of Lemma 11.1.2 at τ = 0.1 + 1.1i, C = 4, (a,b) = (1,0), truncated at 400, is +0.51972 − 59.43843i against R_q(S) = −0.51972 + 59.43858i.
- **Known:** new. Searched: the supplied scan itself (no errata page); web search for errata of CRM Monograph Series 11 and of Theorem 11.2.1 (none found); Brunault's thesis, which uses only Lecture 10 (Theorem 10.2.1, Lemma 10.2.2), not (11.1.1)
- **Review:** confirmed by REV-EllipticRegulators. Found by checker B: Theorem 10.2.1 with f(m, n) = F(n + mτ) gives the kernel ⟨x, y⟩, which is also what the proof of Lemma 11.1.7 uses; the printed kernel reverses the sign for odd characters (checked for four CM fields).
- **Recorded in:** the parent packet.

### EllipticRegulators/E8 — error (affects a stated result)

- **Source:** `Bloch.CRM11`, Lecture 11, (11.2.1) p. 91 and Theorem 11.2.1, (11.2.4) p. 92.
- **Printed:** (11.2.1) L(2, χ^Gross) = (π/(iy²C⁴)) Σ_{w∈O/CO} χ̂(w)R_q(S_{w/C}) … (11.2.4) L(2, χ^Gross) = (π|μ_κ|χ̂(ḡ)g/(iy²C⁴)) R_q(U).
- **Correction:** (11.2.1) L(2, χ^Gross) = (π/(iy²C⁴|μ_κ|)) Σ_w χ̂(w)R_q(S_{w/C}), and (11.2.4) L(2, χ^Gross) = (πχ̂(ḡ)g/(iy²C⁴)) R_q(U) (with χ̂ taken with the kernel of the proof of Lemma 11.1.7; with the printed (11.1.1) kernel the right side carries an extra minus sign, E7).
- **Reason:** The right side of (11.1.2) is a sum over the nonzero elements w of O; since χ(ζh)·(ζh)‾ = χ(h)h̄ for ζ ∈ μ_κ, Σ_{w≠0} χ(w)w̄/|w|⁴ = |μ_κ|·Σ_𝔞 χ^Gross(𝔞)N𝔞^{−2}, and L(s, χ^Gross) is the sum over ideals (it has an Euler product and equals ζ_Q(s)ζ_Q(s−1)/ζ_{E_Q}(s) by Remark 11.2.2(i)). The later passage to (O/CO)^×/μ_κ correctly multiplies by |μ_κ|, which should then cancel. Numerically (reviewer): the printed (11.2.4) gives −4·L(E,2) for 32a2 (C = 4), −6·L(E,2) for 36a1 (C = 6) and −2·L(E,2) for 49a1 (C = 7), i.e. −|μ_κ|·L in each case, with L(E,2) from PARI's lfun and R_q(U) from the q-series of D_q and J_q (also recomputed through the divisor formula with Bloch's lifts (10.2.3)); the corrected formula agrees to 25 digits.
- **Known:** new. Searched: the supplied scan (no errata page); web search for errata of Bloch's monograph and for corrections of Theorem 11.2.1 (none found)
- **Review:** confirmed by REV-EllipticRegulators. Found by checker B and re-checked by the reviewer: for 32a2 (τ = i, C = 4) the corrected formula gives L(E, 2) = (π/2)[D_q(i) + D_q(e^{2πi(3+2i)/4})], which the reviewer computed as 0.91705063531865498864380552… (mpmath orbit sums) against L(E, 2) = 0.91705063531865498864380552… (PARI lfun); the printed factor |μ_κ| = 4 is spurious.
- **Recorded in:** the parent packet.

### EllipticRegulators/E9 — gap (affects a stated result)

- **Source:** `Bloch.CRM11`, Lecture 11, §11.2, pp. 91–92, the step from Σ_{x∈(O/f̄O)*} to Σ_{x∈(O/CO)*} via Corollary 11.1.6, and Theorem 11.2.1.
- **Printed:** = (πχ̂(ḡ)/(iy²C⁴)) Σ_{x∈(O/f̄O)*} χ̄(x̄)R_q(S_{xf̄^{-1}}) = (πχ̂(ḡ)g/(iy²C⁴)) Σ_{x∈(O/CO)*} χ̄(x̄)R_q(S_{x/C}) … Let f be a generator for the conductor ideal and let fg = C ∈ Z, g ∈ O.
- **Correction:** Corollary 11.1.6 turns the sum over x ∈ (O/f̄O)* into a sum over all w ∈ O/CO invertible modulo f̄, which is (O/CO)* only when every prime dividing g divides f. Either add that hypothesis to Theorem 11.2.1, or define U as the sum over {x ∈ O/CO : x invertible modulo f}/μ_κ.
- **Reason:** κ = ℚ(√−7), f = √−7, C = 14, g = −2√−7 (2 splits and does not divide f): with U summed over (O/14O)*/±1 (21 orbits), the corrected formula of E8 gives 2·L(E,2) for 49a1; with the sum over x invertible modulo f (84 orbits) it gives L(E,2) exactly (reviewer's computation). Bloch's own remark 11.2.2(ii) takes g = 1 when possible, and all the classical examples (C = 4, 6, 7) satisfy the hypothesis.
- **Known:** new. Searched: the supplied scan; web search (none found)
- **Review:** confirmed by REV-EllipticRegulators. Found by checker B: for ℚ(√−7) with C = 14 the printed index set doubles the value; the hypothesis restores it.
- **Recorded in:** the parent packet.

### EllipticRegulators/E10 — error (affects a stated result)

- **Source:** `Bloch.CRM11`, Lecture 11, Lemma 11.1.3 and its proof, pp. 88–89.
- **Printed:** LEMMA 11.1.3. Let τ′ = (ατ+β)/(γτ+δ) … Then R_{q′}(S_{(a′+b′τ′)/C}) = (γτ + δ)²(γτ̄ + δ)R_q(S_{(a+bτ)/C}). PROOF. … R_{q′}(S_{(a′+b′τ′)/C}) = (yC³/π) Σ sin(2π[a′ℓ′ − b′k′]/C)/((k′ + ℓ′τ′)²(k′ + ℓ′τ̄′))
- **Correction:** R_{q′}(S_{(a′+b′τ′)/C}) = (γτ̄ + δ)^{-1} R_q(S_{(a+bτ)/C}). The proof uses Lemma 11.1.2 with y in place of y′² = (y/|γτ+δ|²)²; with y′² the factor (γτ+δ)²(γτ̄+δ) from the lattice sum combines with |γτ+δ|^{-4} to (γτ̄+δ)^{-1}.
- **Reason:** Reviewer's computation with ER.3's R_q at τ = 0.3 + 1.2i and a generic point: for (α, β, γ, δ) = (0, −1, 1, 0) and (2, 1, 1, 1) the ratio R_{q′}(z/(γτ+δ))/R_q(z) equals 1/(γτ̄+δ) to 12 digits, while (γτ+δ)²(γτ̄+δ) = 0.459 + 1.836i and 4.069 + 3.756i respectively.
- **Known:** new. Searched: the supplied scan (the lemma is stated to be not used later); web search (none found)
- **Review:** confirmed by REV-EllipticRegulators. Found by checker B: the corrected factor 1/(γτ̄ + δ) agrees to 12 digits for two matrices; it is the rule of ER.3/lattice-basis-change, which checker A checked numerically.
- **Recorded in:** the parent packet.

### EllipticRegulators/E11 — misprint (affects nothing)

- **Source:** `Bloch.CRM11`, Lecture 10, Lemma 10.2.3, p. 79.
- **Printed:** 4π²y² Σ_{k,ℓ=0}^{C−1} f̂(k, ℓ)(ℓ³/3c³ − ℓ²/2C² + ℓ/6C) = (iy²/π) Σ_{n∈Z, n≠0} f(0, n)/n³.
- **Correction:** ℓ³/3C³ (capital C, as in Lemma 10.2.2 and in the proof).
- **Reason:** The same expression appears with C³ in Lemma 10.2.2 and on the next line of the proof.
- **Known:** new. Searched: the supplied scan
- **Review:** confirmed by REV-EllipticRegulators. Found by checker B: C³ as on the neighbouring lines.
- **Recorded in:** the parent packet.

### EllipticRegulators/E12 — misprint (affects nothing)

- **Source:** `Bloch.CRM11`, Lecture 11, §11.1, first sentence, p. 87.
- **Printed:** In this final lecture, we will show how Theorem 10.3.2 leads to a regulator formula for the value at s = 2 of the zeta function of an elliptic curve E with complex multiplication
- **Correction:** Theorem 10.2.1 (there is no Theorem 10.3.2; §10.3 contains Propositions 10.3.1, 10.3.3 and Lemmas 10.3.2, 10.3.4, 10.3.5).
- **Reason:** The regulator formula is derived from (11.1.2), which is Theorem 10.2.1 rewritten.
- **Known:** EllipticKTheory/E13 (confirmed by REV-EllipticKTheory). Searched: research/blueprint/packets/EllipticKTheory.json sourceIssues
- **Review:** confirmed by REV-EllipticRegulators. Found by checker B; the same misprint is EllipticKTheory/E13, confirmed by REV-EllipticKTheory.
- **Recorded in:** the parent packet.

### EllipticRegulators/E13 — error (affects nothing)

- **Source:** `Bloch.CRM11`, Lecture 11, Remark 11.2.2(i), pp. 92–93.
- **Printed:** L(s, χ^Gross) is related to the zeta function of E_Q, ζ_{E_Q} (defined to be the product over all p ∈ Z such that E has non-degenerate reduction modp of the zeta function of the corresponding curve over F_p), by ζ_{E_Q}(s) = ζ_Q(s)ζ_Q(s − 1)L(s, χ^Gross)^{-1}.
- **Correction:** ζ_{E_Q}(s) = ζ_Q(s)ζ_Q(s − 1)L(s, χ^Gross)^{-1} · Π_{p bad} (1 − p^{−s})(1 − p^{1−s}); equivalently the identity holds with ζ_Q(s)ζ_Q(s−1) replaced by its Euler product over the primes of good reduction.
- **Reason:** At a bad prime p (additive for a CM curve) the left side has no factor while the right side keeps the factor 1/((1 − p^{−s})(1 − p^{1−s})) of ζ_Q(s)ζ_Q(s − 1) and the Hecke factor 1.
- **Known:** new. Searched: the supplied scan
- **Review:** confirmed by REV-EllipticRegulators. Found by checker B: ζ_{E_Q} omits the bad Euler factors.
- **Recorded in:** the parent packet.

### EllipticRegulators/E14 — misprint (affects nothing)

- **Source:** `Brunault.These.2005`, §0.5, p. 11 of the arXiv PDF (arXiv:math/0602186v1).
- **Printed:** La généralisation de cet énoncé à toute courbe elliptique est connu sous le nom de conjecture de Zagier pour L(E, 2)
- **Correction:** est connue (agreement with 'la généralisation').
- **Reason:** Grammatical agreement; the packet silently corrected it inside a quoted excerpt.
- **Known:** new. Searched: arXiv:math/0602186 has only v1
- **Review:** confirmed by REV-EllipticRegulators. Found by checker B: grammatical agreement; the packet had silently corrected it inside a quotation.
- **Recorded in:** the parent packet.

### EllipticRegulators/E15 — error (affects a stated result)

- **Source:** `Brunault.These.2005`, Appendice (L. Merel), §5, Théorème D, p. 154 (arXiv v1); used as (3.148), p. 118.
- **Printed:** Res_{s=2} L(f ⊗ f, s) = (2πi/((N + 1)(N − 1)²)) Σ_{χ,χ',χχ'(−1)=−1} Λ(f ⊗ χ', 1)Λ(f ⊗ χ, 1)/τ(χχ')
- **Correction:** With L(f ⊗ f, s) = Σ a_n² n^{−s} as defined on the same page, the right-hand side is one quarter of the residue: the constant should be 8πi/((N + 1)(N − 1)²) (or the normalisation of ⟨f, f⟩ in 'Res = 12π⟨f, f⟩' and Théorème C must be corrected by the same factor).
- **Reason:** For f the newform of 11a (N = 11) the printed right-hand side is 0.1473411600116474455941788836812566 while the residue is 0.5893646400465897823767155347250266 = L(Sym²f, 2)/(ζ(2)(1 + 1/11)); the partial sums 2Σ_{n≤X} a_n²/X² are 0.58849, 0.58861, 0.58953 for X = 1, 2, 4 × 10⁵. For 19a (N = 19): 0.1339731468105180230 against 0.5358925872420720920. The ratio is 4 to 30 digits in both cases (checker C, thmD.gp, res.gp; Λ(f ⊗ χ, 1) = (N/2π)L(f, χ, 1), ordered pairs (χ, χ')).
- **Known:** new. Searched: arXiv listing of all of F. Brunault's papers (export.arxiv.org API, 21 entries, 2026-09-25); the published version of Théorèmes 4-5, Bull. Soc. Math. France 135 (2007) 215-246 (numdam), which does not contain Théorèmes 1-2, 8 or the appendix; arXiv math/0602186 has only v1
- **Review:** confirmed by REV-EllipticRegulators. Found by checker C: Merel's Théorème D against the residue of Σ a_n² n^{−s} at s = 2 differs by the factor 4 to 30 digits for 11a and 19a.
- **Recorded in:** the parent packet.

### EllipticRegulators/E16 — error (affects a stated result)

- **Source:** `Brunault.These.2005`, (3.145), p. 116, taken from the specialisation of Théorème A on p. 155 of the appendix; consequences Théorème 1, (4) p. 8 and (3.142) p. 115, Théorème 2, (6) p. 9 and (3.146) p. 118, and (8) p. 9 / (3.149) p. 118.
- **Printed:** ξ_f(x) = (w(E)/(2π (p − 1))) Σ_{χ≠1_p} τ(χ̄)χ(x)L(f, χ, 1) (x ∈ (Z/pZ)*); hence L(E, 2)L(E, χ, 1) = (p w(E) τ(χ)/(8πi(p − 1))) Σ_{χ'} c_{χ,χ'} L(E, χ', 1)
- **Correction:** The even part has the opposite sign: ξ_f(x) = −(w(E)/(2π(p − 1))) Σ_{χ≠1_p} τ(χ̄)χ(−x)L(f, χ, 1). Consequently Théorème 1 holds with w(E) replaced by −w(E), i.e. by the root number ε(E) (Λ(E, s) = ε(E)Λ(E, 2 − s)); Théorème 2 and (8) change sign likewise.
- **Reason:** Manin symbols ξ_f(x, 1) = −i∫_0^{1/x} f(z)dz computed from the definition (10) by two independent methods (via W_p, and via a Γ0(p)-period with both endpoints at height 1/|c|) agree to 30 digits, satisfy the Manin relations and (3.138); compared with the printed (3.145) their odd parts agree and their even parts are opposite, for 11a (x = 2, ..., 10) and 19a (x = 2, 3, 4). Théorème 3 in the form (3.144), with ξ_f^+ from the definition, holds to 38 digits for the four even non-trivial χ mod 11, while the printed Théorème 1 (with w(E) = −1 for 11a) gives exactly −L(E, 2)L(E, χ, 1) (45 digits) (checker C, xi.gp, xi2.gp, xi3.gp, thm1.gp, thm3.gp).
- **Known:** new. Searched: arXiv listing of all of F. Brunault's papers (export.arxiv.org API, 21 entries, 2026-09-25); the published version of Théorèmes 4-5, Bull. Soc. Math. France 135 (2007) 215-246 (numdam), which does not contain Théorèmes 1-2, 8 or the appendix; arXiv math/0602186 has only v1
- **Review:** confirmed by REV-EllipticRegulators. Found by checker C: Théorème 1 as printed equals −L(E, 2)L(E, χ, 1) for all four even non-trivial χ mod 11 (45 digits); the Manin symbols computed from their definition disagree with (3.145) in their even parts for 11a and 19a. The reviewer re-checked Corollaire 101 on 11a3 (L(E, 2)/(π D_E(P)) = 10/11), which the corrected sign does not affect.
- **Recorded in:** the parent packet.

### EllipticRegulators/E17 — misprint (affects a stated result)

- **Source:** `Brunault.These.2005`, (8), p. 9, and (3.149), p. 118.
- **Printed:** L(E, 2) = (p² i w(E)/(8(p − 1) π²)) · Σ_{χ,χ'} λ_{χ,χ'} L(E, χ, 1)L(E, χ', 1) / Σ_{χ,χ'} τ(χ̄χ̄') L(E, χ, 1)L(E, χ', 1)
- **Correction:** π in place of π² (and −w(E) in place of w(E), by E16): L(E, 2) = (p² i ε(E)/(8(p − 1)π)) · Σ λ L L / Σ τ(χ̄χ̄') L L.
- **Reason:** Substituting (3.148) into (6) and using 1/τ(χχ') = −τ(χ̄χ̄')/p for χχ' odd gives the factor p² i w/(8(p − 1)π). Numerically for 11a the printed formula gives −L(E, 2)/π (ratio −3.14159265358979323846...), and with π it gives −L(E, 2) (thm2b.gp). This formula does not depend on E15, since the residue cancels.
- **Known:** new. Searched: arXiv listing of all of F. Brunault's papers (export.arxiv.org API, 21 entries, 2026-09-25); the published version of Théorèmes 4-5, Bull. Soc. Math. France 135 (2007) 215-246 (numdam), which does not contain Théorèmes 1-2, 8 or the appendix; arXiv math/0602186 has only v1
- **Review:** confirmed by REV-EllipticRegulators. Found by checker C: substituting (3.148) into (6) gives π, not π².
- **Recorded in:** the parent packet.

### EllipticRegulators/E18 — misprint (affects nothing)

- **Source:** `Brunault.These.2005`, Proof of Corollaire 101, (3.155) and (3.156), pp. 120-121.
- **Printed:** L(E, 2) = (2²·5·π/11²) · ((7 − η)/(ζ − ζ̄))((ζ − ζ̄)D_E(P) + (ζ² − ζ̄²)D_E(2P)) = (2²·5·π/11²) · (7 − η)(D_E(P) + ηD_E(2P)), and (3.156) with (8 + η)
- **Correction:** (1 + 3η) in place of (7 − η) in (3.155) and (−2 − 3η) in place of (8 + η) in (3.156), as (3.150) requires; (3.157) and (3.151) are then correct as printed.
- **Reason:** (3.150) has the factor (1 + 3η)/(ζ − ζ̄) = (7 − η)/((ζ − ζ̄)(1 + 2η)); the factor 1/(1 + 2η) was dropped. With the printed factor the right side is ±1.2210005279570372 instead of L(E, 2) = 0.5460480362150135; with (1 + 3η) it is L(E, 2) to 38 digits, and eliminating η between the corrected (3.155), (3.156) gives the printed (3.157) (t11b.gp).
- **Known:** new. Searched: arXiv listing of all of F. Brunault's papers (export.arxiv.org API, 21 entries, 2026-09-25); the published version of Théorèmes 4-5, Bull. Soc. Math. France 135 (2007) 215-246 (numdam), which does not contain Théorèmes 1-2, 8 or the appendix; arXiv math/0602186 has only v1
- **Review:** confirmed by REV-EllipticRegulators. Found by checker C: (3.150) requires the corrected coefficients.
- **Recorded in:** the parent packet.

### EllipticRegulators/E19 — gap (affects the proof)

- **Source:** `Brunault.These.2005`, Proof of Théorème 8, p. 120.
- **Printed:** Le signe dans cette dernière égalité est déterminé en évaluant numériquement L(f, χ, 1), par exemple grâce au package ComputeL [26] écrit pour le logiciel Pari (nous ne connaissons pas d'autre méthode). Nous trouvons le signe moins.
- **Correction:** The sign must be fixed by a certified numerical bound (an interval evaluation of L(f, χ, 1) with rigorous error) or by an exact modular-symbol computation that tracks the orientation; the sign minus is correct.
- **Reason:** An uncertified numerical evaluation is not a proof. Checker C confirms L(f, χ, 1) = −αΩ^+/(5τ(χ̄)) for the four even non-trivial χ mod 11 to 40 digits (the twisted L-function passes PARI's functional-equation check to 191 bits).
- **Known:** new. Searched: arXiv listing of all of F. Brunault's papers (export.arxiv.org API, 21 entries, 2026-09-25); the published version of Théorèmes 4-5, Bull. Soc. Math. France 135 (2007) 215-246 (numdam), which does not contain Théorèmes 1-2, 8 or the appendix; arXiv math/0602186 has only v1
- **Review:** confirmed by REV-EllipticRegulators. Found by checker C: the source fixes the sign by an uncertified numerical evaluation.
- **Recorded in:** the parent packet.

### EllipticRegulators/E20 — gap (affects a stated result)

- **Source:** `Brunault.These.2005`, Remarques after Théorème 4, 1., p. 11 (against Remarque 82, p. 91, and Remarque 87, p. 96).
- **Printed:** L'hypothèse χ primitif n'est pas essentielle. On a une formule analogue sans cette hypothèse.
- **Correction:** Without primitivity the source has a formula (Théorème 81) only for the function-field symbol {u_χ, α*u_χ̂'}, which is not shown to lie in K2(X1(N)) ⊗ C; for the symbol of Théorème 4 no formula was found (Remarque 82).
- **Reason:** Remarque 82: 'Sans l'hypothèse χ primitif, nous n'avons pas trouvé de formule satisfaisante pour ⟨r_N({u_ψχ, u_χ̄}), f⟩'; Remarque 87: the tame symbols of {u_f, u_g} need not be trivial when f or g is not supported on (Z/NZ)*.
- **Known:** Bull. Soc. Math. France 135 (2007), Remarque 1.2, p. 217: 'Il serait donc utile de lever l'hypothèse χ primitif dans le théorème 1.1'. Searched: arXiv listing of all of F. Brunault's papers (export.arxiv.org API, 21 entries, 2026-09-25); the published version of Théorèmes 4-5, Bull. Soc. Math. France 135 (2007) 215-246 (numdam), which does not contain Théorèmes 1-2, 8 or the appendix; arXiv math/0602186 has only v1
- **Review:** confirmed by REV-EllipticRegulators. Found by checker C against the body of the thesis (Remarques 82 and 87) and the published version's Remarque 1.2.
- **Recorded in:** the parent packet.

### EllipticRegulators/E21 — misprint (affects nothing)

- **Source:** `Brunault.These.2005`, §0.3, p. 10.
- **Printed:** le choix de du caractère χ, et donc de l'entier N', n'est pas précisé
- **Correction:** le choix du caractère χ
- **Reason:** Duplicated article.
- **Known:** new. Searched: arXiv listing of all of F. Brunault's papers (export.arxiv.org API, 21 entries, 2026-09-25); the published version of Théorèmes 4-5, Bull. Soc. Math. France 135 (2007) 215-246 (numdam), which does not contain Théorèmes 1-2, 8 or the appendix; arXiv math/0602186 has only v1
- **Review:** confirmed by REV-EllipticRegulators. Found by checker C: 'de du'.
- **Recorded in:** the parent packet.

### EllipticRegulators/E22 — misprint (affects nothing)

- **Source:** `Brunault.These.2005`, Proof of Proposition 86, p. 95.
- **Printed:** La proposition 3.76 montre que
- **Correction:** La proposition 80 (formule (3.76)) montre que
- **Reason:** (3.76) is an equation of Proposition 80; there is no proposition 3.76.
- **Known:** new. Searched: arXiv listing of all of F. Brunault's papers (export.arxiv.org API, 21 entries, 2026-09-25); the published version of Théorèmes 4-5, Bull. Soc. Math. France 135 (2007) 215-246 (numdam), which does not contain Théorèmes 1-2, 8 or the appendix; arXiv math/0602186 has only v1
- **Review:** confirmed by REV-EllipticRegulators. Found by checker C: the proof refers to Proposition 80 by a wrong number.
- **Recorded in:** the parent packet.

### EllipticRegulators/E23 — gap (affects nothing)

- **Source:** `Brunault.These.2005`, Proof of Lemme 77, p. 82.
- **Printed:** Nous avons les estimations T_n = O(n^{1/2+ε}) et σ_{χ1,χ2}(n) = O(n^{1+ε})
- **Correction:** The bound T_n = O(n^{1/2+ε}) is the Ramanujan–Petersson bound in weight two (Eichler–Shimura–Igusa), cited without reference; Hecke's bound T_n = O(n) suffices, giving (3.47) for Re(s) > 3, which is enough since both sides are then continued.
- **Reason:** The lemma is only used through analytic continuation to s = 1 in (3.45).
- **Known:** new. Searched: arXiv listing of all of F. Brunault's papers (export.arxiv.org API, 21 entries, 2026-09-25); the published version of Théorèmes 4-5, Bull. Soc. Math. France 135 (2007) 215-246 (numdam), which does not contain Théorèmes 1-2, 8 or the appendix; arXiv math/0602186 has only v1
- **Review:** confirmed by REV-EllipticRegulators. Found by checker C: the bound is cited without reference; Hecke's bound suffices.
- **Recorded in:** the parent packet.

### EllipticRegulators/E24 (ER.2 part, Nekovář) — misprint (affects nothing)

- **Source:** `Nekovar.AuthorCopy`, Nekovar.AuthorCopy, §7.5 p.24, the paragraph and calculation before (7.5.1); findings apply only to this author copy, not the inaccessible publisher version..
- **Printed:** H¹(U(C), R(2))
- **Correction:** Use H¹(U(C),R(1)) in the sentence describing the symbol regulator image.
- **Reason:** The immediately preceding isomorphism is H²_D(U,R(2)) ≅ H¹(U(C),R(1)); the cup representative uses π₁, whose coefficient line is R(1).
- **Known:** new; no published correction located in the searches listed; not a claim about the version of record.. Searched: Nekovář author publications page https://webusers.imj-prg.fr/~jan.nekovar/pu/ and indexed entry [5], searched 2026-10-05; direct page/PDF access failed.; Public web searches for Nekovar/Nekovář Beilinson erratum, correction and exact (7.5.1), 2026-10-05; no correction located.; AMS Motives vol.55.1 contents https://www.ams.org/books/pspum/055.1/pspum055.1-endmatter.pdf identifies the published pp.537–570; a publisher PDF access attempt did not retrieve the chapter. The findings are confined to the hashed Stanford author copy.; Brunault thesis Definition63, (2.107), Remark64 and Proposition67, pp.66–70, cross-checked against the author copy’s earlier (7.3.2).
- **Review:** confirmed by REV-EllipticRegulators--ER.2. Confirmed in the p.24 page image: the preceding displayed comparison and π₁-valued representative have R(1) coefficients; R(2) in the next sentence is a coefficient-index slip.
- **Recorded in:** the ER.2 part.

### EllipticRegulators/E25 — misprint (affects nothing)

- **Source:** `Nekovar.AuthorCopy`, Nekovar.AuthorCopy, §7.5 p.24, the paragraph and calculation before (7.5.1); findings apply only to this author copy, not the inaccessible publisher version..
- **Printed:** ψ = log|f| darg(g) − log|g| darg(f)
- **Correction:** The R(1)-valued cup representative is ψ=i(log|f| darg(g)−log|g| darg(f)) with standard real darg.
- **Reason:** From (7.3.2), π₁(dlog g)=(dlog g−conj(dlog g))/2=i darg(g). The missing i is also visible by comparing Brunault (2.107), which explicitly cites (7.3.2).
- **Known:** new; no published correction located in the searches listed; not a claim about the version of record.. Searched: Nekovář author publications page https://webusers.imj-prg.fr/~jan.nekovar/pu/ and indexed entry [5], searched 2026-10-05; direct page/PDF access failed.; Public web searches for Nekovar/Nekovář Beilinson erratum, correction and exact (7.5.1), 2026-10-05; no correction located.; AMS Motives vol.55.1 contents https://www.ams.org/books/pspum/055.1/pspum055.1-endmatter.pdf identifies the published pp.537–570; a publisher PDF access attempt did not retrieve the chapter. The findings are confined to the hashed Stanford author copy.; Brunault thesis Definition63, (2.107), Remark64 and Proposition67, pp.66–70, cross-checked against the author copy’s earlier (7.3.2).
- **Review:** confirmed by REV-EllipticRegulators--ER.2. Confirmed in the p.24 page image and checked against (7.3.2): π₁(dlog g)=i darg(g) for real darg, so the last expression for ψ omits i. Brunault (2.107) gives the intended imaginary-valued form.
- **Recorded in:** the ER.2 part.

### EllipticRegulators/E26 — misprint (affects nothing)

- **Source:** `Nekovar.AuthorCopy`, Nekovar.AuthorCopy, §7.5 p.24, (7.5.1) and preceding calculation; findings apply only to this author copy, not the inaccessible publisher version..
- **Printed:** (1/(2πi)) ∫_{E(C)} log|g| dlog(conj g) ∧ ω
- **Correction:** Replace g in the conjugated differential by f: log|g| conj(dlog f)∧ω, equivalently after integration by parts -log|f| conj(dlog g)∧ω or 2log|f| ω∧bar∂log|g|. The pairing equals r_E({f,g})(ω)/(πi).
- **Reason:** The printed expression depends only on g, so cannot be an alternating two-function regulator. Expanding (7.3.2) and integrating d(log|f|log|g|ω) gives the corrected expression and factor. The conjugation bar is present in the page image but absent in extracted text; the same wrong variable appears immediately before (7.5.1).
- **Known:** new; no published correction located in the searches listed; not a claim about the version of record.. Searched: Nekovář author publications page https://webusers.imj-prg.fr/~jan.nekovar/pu/ and indexed entry [5], searched 2026-10-05; direct page/PDF access failed.; Public web searches for Nekovar/Nekovář Beilinson erratum, correction and exact (7.5.1), 2026-10-05; no correction located.; AMS Motives vol.55.1 contents https://www.ams.org/books/pspum/055.1/pspum055.1-endmatter.pdf identifies the published pp.537–570; a publisher PDF access attempt did not retrieve the chapter. The findings are confined to the hashed Stanford author copy.; Brunault thesis Definition63, (2.107), Remark64 and Proposition67, pp.66–70, cross-checked against the author copy’s earlier (7.3.2).
- **Review:** confirmed by REV-EllipticRegulators--ER.2. Confirmed in the p.24 page image: the bar is present, but both displayed integrands use g twice. Expanding the alternating cup representative and integrating d(log|f|log|g|ω) replaces the differential variable by f and gives the stated r_E/(πi) pairing.
- **Recorded in:** the ER.2 part.

### EllipticRegulators/E27 — misprint (affects nothing)

- **Source:** `Nekovar.AuthorCopy`, Nekovar.AuthorCopy, §7.5 p.24, sentence describing r_D(f) immediately after the two comparison isomorphisms; this finding concerns only the hashed author copy..
- **Printed:** df = π₀(ω_f), for ω_f = ∂f/f
- **Correction:** Replace df by dφ_f, where φ_f=log|f|: dφ_f=π₀(ω_f).
- **Reason:** The pair model (7.3.1) requires the differential of the real-valued φ_f, and (7.4.1) gives φ_f=log|f|. For the local holomorphic unit f=e^z at z=0, df=dz while π₀(df/f)=dx=dlog|f|; the printed equation cannot hold.
- **Known:** new; no correction found in the searches listed; no assertion about the publisher’s version of record.. Searched: Public web searches for Nekovar/Nekovář Beilinson erratum, corrigendum, (7.5.1), and the unit-regulator df/log formula, 2026-10-05; no relevant correction found.; Author publications page https://webusers.imj-prg.fr/~jan.nekovar/pu/ indexed entry [5]; direct page and https://webusers.imj-prg.fr/~jan.nekovar/pu/mot.pdf access failed (403), 2026-10-05.; AMS https://www.ams.org/books/pspum/055.1/pspum055.1-endmatter.pdf access failed (403), 2026-10-05. Publisher chapter not retrieved; finding scoped to the Stanford author copy.; Cross-checked (7.3.1) and (7.4.1), author-copy pp.22–23, and the p.24 page image.
- **Review:** confirmed by REV-EllipticRegulators--ER.2. The p.24 page image prints df. The local unit f=e^z distinguishes df from the required dφ_f=π₀(df/f), confirming a variable slip with no change to the intended regulator.
- **Recorded in:** the ER.2 part.

### EllipticRegulators/E-ER3-1 — error (affects a stated result)

- **Source:** `Zagier.BWR.1990`, Theorem 1, p. 619, author-hosted typeset 1990 scan; restricted here to a+b=3.
- **Printed:** D_{a,b}(q;x) = ((τ−τ̄)^r/(2πi)) Σ′ exp(2πi(nξ−mη))/((mτ+n)^a(mτ̄+n)^b), r=a+b−1.
- **Correction:** For weight two (a+b=3), with the same character, the right side is −((τ−τ̄)^2/(2πi)) Σ′ exp(2πi(nξ−mη))/((mτ+n)^b(mτ̄+n)^a). In particular D_{1,2}=2(J+iD) and D_{2,1}=2(J−iD), by the definitions on pp. 617–618. No claim about other weights is made.
- **Reason:** Average D_{1,2}(q;x) over η at fixed ξ. Proposition 2(iii) leaves (8π²y²/3)B₃(ξ). Its frequency-one coefficient is −2iy²/π by the exact Bernoulli Fourier formula. The printed theorem gives +2iy²/π from its (m,n)=(0,1) term. The nonzero horizontal coefficients calculated by unfolding the disc series also require the reversed denominator exponents. The p. 616 sine formula’s sign discrepancy is already parent issue EllipticRegulators/E6; it is not duplicated here.
- **Known:** new. Searched: Zagier’s MPIM publication list and its linked author copy, accessed 2026-10-06; no attached erratum found.; Web searches for the exact title with erratum, correction, and Theorem 1, on 2026-10-06; no correction located.; The DOI-linked author-hosted typeset scan, visually inspected at pp. 616–619.
- **Review:** confirmed by REV-EllipticRegulators--ER.3. Visually checked Theorem 1 on printed p. 619 and Proposition 2(ii)–(iii) on p. 618 in the identical-hash author-hosted typeset scan. At r=2 their definitions give D₁,₂=2(𝒥+iD). Its η-average is (8π²y²/3)B₃(ξ), whose frequency-one coefficient is −2iy²/π, while the printed theorem gives +2iy²/π. Independently integrated the positive and negative half-line coefficients to verify that the weight-two denominator exponents must also be exchanged. The report gives both exact computations. No claim about other weights or a separately accessed publisher copy is made. Fresh exact-title erratum/correction searches found no correction.
- **Recorded in:** the ER.3 part.

### EllipticRegulators/ER4-E1 — error (affects the proof)

- **Source:** `Bloch.CRM11.public`, Public digitization of CRM 11, §10.3, p.80, parenthesis preceding (10.3.2).
- **Printed:** |xqⁿ| < 1 for n ≥ 0
- **Correction:** For canonical torsion lifts, |xqⁿ|≤1 for n≥0; equality occurs precisely when ℓ=n=0. Treat that logarithmic weighted term as zero, and retain the absolutely convergent unit-circle Li₂ series.
- **Reason:** Take k=1,ℓ=0,C=3,n=0. Then x=exp(2πi/3), so |x|=1. Log’s open-disc expansion cannot be applied to that term. The factor log|x| is zero; the Li₂ series is absolutely summable at |x|=1. The source’s M₂ calculation already retains that boundary. This correction changes a convergence justification, not the final identity.
- **Known:** new. Searched: Bloch author publications page https://math.uchicago.edu/~bloch/publications.html, opened 2026-10-06: no correction for this passage found.; Search on 2026-10-06 for Bloch Higher Regulators elliptic curves errata Lecture 10; no matching published correction found.; Parent accepted sourceIssues: E11 supplies the capital-C typo; none covers this strict-boundary assertion.; AMS PDF endpoints returned HTTP 403; finding scoped to the accessible public digitization text, without claiming original-page collation.
- **Review:** confirmed by REV-EllipticRegulators--ER.4. Independently located the strict forward-boundary assertion in the accessible CRM 11 digitization immediately before (10.3.2), p.80. For ℓ=n=0 the canonical lift has norm one, so the assertion is false. The weighted logarithmic term vanishes, whereas the closed-disc Li₂ series remains absolutely summable and must be retained in M₂. Confirmation is scoped to that text layer; unavailable AMS page images are not certified. Author-publications and errata searches found no matching correction.
- **Recorded in:** the ER.4 part.

### EllipticRegulators/E24 (ER.7 part, Schappacher–Scholl; to be renumbered) — misprint (affects a stated result)

- **Source:** `SS.1988`, SS 3.1.8, author retypeset p.8 and published-pagination mirror p.286; both checked from rendered page images..
- **Printed:** The residue of ηφ at the cusp k is equal to φ(k)/w(k,K).
- **Correction:** With 3.0.1 q_w=exp(2πiz/w), 3.1.7 Eφ=−2πyφ+O(1), and ηφ=2∂Eφ, the residue is w(k,K)φ(k), not φ(k)/w(k,K).
- **Reason:** Since log|q_w|=−2πy/w, Eφ=wφ log|q_w|+O(1). Thus 2∂Eφ=wφ dq_w/q_w plus a regular term. SS 3.5.0 defines div(u)=ord_c(u)/w(c), and 3.5.1 η_div(u)=dlog(u) confirms this product convention. For width w=2 and φ=1, the residue is 2 rather than 1/2.
- **Known:** new; no published correction located in the sources searched. Searched: Author RSS.pdf retypeset copy dated 2010, checked 2026-10-06.; nLab-hosted published-pagination copy SchappacherScholl.pdf, checked 2026-10-06.; Scholl’s public preprint/publication page and web search for the paper title with 3.1.8 and errata, 2026-10-06.
- **Review:** confirmed by REV-EllipticRegulators--ER.7. Independently inspected the displayed inverse-width residue in both page images. With q_w=exp(2πiz/w), Eφ=−2πyφ+O(1)=wφ log|q_w|+O(1), hence 2∂Eφ=wφ dq_w/q_w. Width two gives residue two, not one half; 3.5.0–3.5.1 confirm the product convention.
- **Recorded in:** the ER.7 part.

### EllipticRegulators/E28 — misprint (affects a stated result)

- **Source:** `AC2020`, arXiv:2003.08888v2, §2.2, Theorem 2.2(1), p. 6; compared with accepted manuscript Theorem 2.2(1), p. 7.
- **Printed:** ∫_(a+p^nu Z_p) x^j dmu_f,alpha^± = lambda_f,alpha^±(a,p^nu)(X^j Y^(k-j))
- **Correction:** Insert alpha^(-nu) multiplying the finite-coset modular-symbol value, as the accepted manuscript already does.
- **Reason:** The displayed lambda is defined from f_alpha and the periods without alpha^(-nu). The U_p eigenrelation makes the sum of level-(nu+1) unscaled lambda values equal alpha times the level-nu value; only alpha^(-nu) makes the masses additive. The accepted manuscript provides direct version evidence for the correction.
- **Known:** Already corrected in the 2023 author accepted manuscript deposited at HUSCAP. The publisher preview does not expose Theorem 2.2, so the version-of-record body was not verified.. Searched: arXiv version history and v2 PDF accessed 2026-10-06; HUSCAP author accepted manuscript, Theorem 2.2(1), accessed 2026-10-06; Publisher DOI page public preview and author publication page; no separate erratum was found in the inspected material
- **Review:** confirmed by REV-EllipticRegulators--ER.8. Confirmed by direct comparison of arXiv v2 Theorem 2.2(1), p.6, with the inspected accepted manuscript, p.7: the former omits alpha^(-nu), while the latter includes it. The displayed lambda convention needs this factor for U_p-compatible coset additivity. The finding remains restricted to the preprint.
- **Recorded in:** the ER.8 part.

### EllipticRegulators/E29 — error (affects a stated result)

- **Source:** `AC2023AM`, Author accepted manuscript, §2.2 Theorem 2.3 and §3.4 nontrivial-character interpolation formula, pp. 7 and 16; the displayed lambda convention is on pp. 7 and 16.
- **Printed:** Lp,gamma(E,chi,1)=(p/gamma)^nu L(E,chi,1)/(tau(chi) Omega^(chi(-1)))
- **Correction:** In the displayed coset convention with tau(chi)=sum chi(a)exp(2pi i a/p^nu) and the standard twist sum chi(n)a_n/n^s, use gamma^(-nu)tau(chi)L(E,chi^(-1),1)/Omega^(chi(-1)). Equivalently this is chi(-1)(p/gamma)^nu L(E,chi^(-1),1)/(tau(chi^(-1)) Omega^(chi(-1))).
- **Reason:** Sum the displayed alpha^(-nu)lambda^±(a,p^nu) masses against chi(a). The sign-part gives 2pi i/Omega times sum chi(a)int_infty^(a/p^nu)f_gamma(z)dz, whose finite Fourier transform is tau(chi)L(f_gamma,chi^(-1),1)/Omega. The primitive p-power twist removes the stabilisation term. Already for the odd quadratic character modulo 3, tau=exp(2pi i/3)-exp(4pi i/3), tau²=-3, so 3/tau=-tau: the printed and derived factors have opposite signs regardless of whether a twist uses chi or chi^(-1), which coincide here. The reviewed L1/L2 owner independently gives the derived formula. Even quadratic tests conceal the error.
- **Known:** No correction found in the inspected material. This finding is scoped to the author accepted manuscript and its stated coset convention; the version-of-record body was not available, so no claim is made about that unread version.. Searched: arXiv:2003.08888 v2 and its version history, accessed 2026-10-06; HUSCAP author accepted manuscript, displayed lambda, Theorem 2.3 and §3.4, accessed 2026-10-06; Publisher DOI page public preview; Masataka Chida publication page https://www.cck.dendai.ac.jp/math/~chida/, accessed 2026-10-06; neither inspected page supplied a separate correction for this formula
- **Review:** confirmed by REV-EllipticRegulators--ER.8. Confirmed at accepted-manuscript Theorem 2.3, p.7, and section 3.4, p.16. The explicitly defined Gauss sum and positive Fourier exponent in the displayed integral give gamma^(-nu) tau(chi) L(E,chi^(-1),1)/Omega^sign. For the odd quadratic character mod 3, chi=chi^(-1) and tau^2=-3; the printed p^nu/tau has the opposite sign. Checked against the owner twisted Mellin and L2 interpolation statements. No separate correction was found in the searched public material; no verdict is given on the unread published theorem body.
- **Recorded in:** the ER.8 part.

### Findings re-confirmed by the ER.5 part

- `EllipticRegulators/E7` (confirmed by REV-EllipticRegulators; used here without a duplicate erratum record). Handling: Dual-first kernel exp2πi(aℓ−bk)/C; opposite printed kernel is negative on odd inputs. Re-confirmed by REV-EllipticRegulators--ER.5: Confirmed mathematically: coordinate reindexing gives H=C fhat₁₀ at the same output; an odd input changes sign under the opposite kernel. Exact Gaussian Gauss sums give 1+i versus −1−i. The public §11.1 labels and proof are checked, but lost overlines are not certified from OCR.
- `EllipticRegulators/E8` (confirmed by REV-EllipticRegulators; used here without a duplicate erratum record). Handling: The element/ideal factor |μ| cancels the residue/orbit factor; final coefficient has no |μ|. Re-confirmed by REV-EllipticRegulators--ER.5: Confirmed: class-number-one element-to-ideal fibers have |μ| generators and free W-to-orbit fibers have the same |μ|. These cancel. Independently evaluated Gaussian, Eisenstein and √−7 data yield the corrected coefficients π/2, 2π/3, 4π/7.
- `EllipticRegulators/E9` (confirmed by REV-EllipticRegulators; used here without a duplicate erratum record). Handling: Use W invertible modulo conductor, or explicitly impose primes(g)⊆primes(f). Re-confirmed by REV-EllipticRegulators--ER.5: Confirmed: conductor fibers partition W, not full-level units. Exact cyclotomic/ring arithmetic at √−7, C=14 gives 168 versus 42 residues and 84 versus 21 orbits. Separate 60-digit regulator diagnostics reproduce the factor-two discrepancy; that decimal comparison is not an exact proof.

### Findings reused by the ER.3 part

- EllipticRegulators/E2: Green-pairing interchange gap
- EllipticRegulators/E3: companion asserted without proof, supplied by this part’s complex Fourier calculation
- EllipticRegulators/E5: multiple-root continuity gap
- EllipticRegulators/E6: p. 616 sine-formula sign, used in corrected form
- Polylogarithms/E11 and E12: Chow Steinberg factor and real normalization

## Gaps

The nine packets record 29 gaps: 14 in the parent packet and the rest in the parts. Many of the parent's gaps are answered or refined by a part, and each gap below carries a status line saying which. A gap is never papered over: where the answer is a request to another roadmap, the request is listed in the next section.

### Gaps of the parent packet

#### Brunault's normalisation of Deligne cohomology against the universal regulator

Replaces the gap 'Deligne cohomology has no source in this packet', which is false: Brunault §2.5 (pp. 63–67) recalls Deligne cohomology from Schneider [65] and Nekovář [52] and proves Proposition 67, which fixes the factor (r_Beil = 2 r_E). What the sources read do not contain is the comparison of that normalisation with M.8's universal regulator. NEXT SOURCE ACTION: read Schneider, 'Introduction to the Beilinson conjectures', §§1–3, and Nekovář, 'Beilinson's conjectures', §7. Added by REV-EllipticRegulators.

Needed by: `ER.2/the-normalisation-factor`, `ER.2/the-deligne-cohomology-target`.

Status: **Refined, open.** The ER.2 part reads Schneider and Nekovář and specialises the sign comparison (`ER.2/chern-character-symbol-comparison`). The comparison with the universal regulator still rests on the early M.8 export, which is the ER.2 part's gap. The ER.6 part inherits this gap.

#### Hurewicz comparison for the first homology of a torus

Neither pinned library has the Hurewicz isomorphism H_1 ≅ π_1^ab; Tau Ceti has singular homology of pairs (TopPair.singularHomology) and π_1 of the 2-torus (AddCircle.prodFundamentalGroupMulEquiv). ER.1 uses the deck group Λ_ω as H_1(E(C), Z); its identification with singular H_1 is open. Added by REV-EllipticRegulators.

Needed by: `ER.1/periods-and-the-comparison-isomorphism`.

Status: **Superseded.** The ER.1 part replaces the deck-group reading of H_1 by its requests to Tau Ceti AlgebraicTopology stages 5 and 6 and to C6. No Hurewicz theorem is planned; see the Assembly note on `ER.1/periods-and-the-comparison-isomorphism`.

#### Bloch's Lectures 5–6 were not read

Lectures 8–9 cite Definition 5.3.1 (Steinberg function), the map (5.3.1), Corollary 6.1.2 and 'D is a relative Steinberg function'. The J-part on the projective line (Lemma 8.1.3) and the bounds are proved in the proposed nodes, and the D-part on the projective line is checked numerically; its proof from Polylogarithms P.5's projective-line nodes is not written. NEXT SOURCE ACTION: read printed pp. 35–50 (PDF 47–62) of the supplied scan. Added by REV-EllipticRegulators.

Needed by: `ER.3/steinberg-relation-on-the-projective-line`, `ER.3/bloch-wigner-bounds-at-zero`.

Status: **Partly answered.** The D-part on the projective line is proved by `ER.3/relative-projective-line-chow-bridge`; the J-part and the bounds were already proved here. Collation with Lectures 5–6 remains in the ER.3 part's coverage record.

#### Bloch §10.3 was read only through (10.3.1)

The proof of (10.3.1) (Proposition 10.3.1 onwards, printed pp. 80–86, PDF 92–98) is not decomposed. The Fourier node's statement is checked numerically at three points and agrees with Brunault's Théorème 21. NEXT SOURCE ACTION: read printed pp. 80–86. Added by REV-EllipticRegulators. Checker B read §10.3 and notes that Bloch's direct route to Theorem 10.2.1 needs Lemma 10.2.3 and Propositions 10.3.1 and 10.3.3 as nodes; ER.4/bloch-theorem-10-2-1 is stated, its proof from them is not decomposed.

Needed by: `ER.3/fourier-and-kronecker-eisenstein`, `ER.4/bloch-theorem-10-2-1`.

Status: **Answered.** For `ER.4/bloch-theorem-10-2-1`, the ER.4 part's direct proof decomposes Lemma 10.2.3 and Propositions 10.3.1 and 10.3.3 (`ER.4/direct-series-convergence` through `ER.4/direct-regularized-fourier-identity`). For `ER.3/fourier-and-kronecker-eisenstein`, the ER.3 part's coefficient calculation and reconstruction answer it. The two parent nodes do not yet cite these nodes; see their Assembly notes.

#### No published source for the integrality of all unramified classes under potentially good reduction

The lemma K_2(E)_{ℤ,ℚ} = K_2(E) ⊗ ℚ for E with potentially good reduction everywhere is proved in the node by the reviewer's tree argument on vertical residues; no source was read that states it. NEXT SOURCE ACTION: look for it in Schappacher–Scholl (Beilinson's theorem on modular curves, 1988) and in the literature on the integrality condition for K_2 of curves, and cite it or keep the node's proof. Added by REV-EllipticRegulators.

Needed by: `ER.6/potentially-good-reduction-integrality`.

Status: **Answered.** `ER.6/potentially-good-integrality-by-local-descent` gives the published proof (Scholl, *Integral elements* I and II), subject to the ER.6 part's request to E.6 for local integral images.

#### Schappacher–Scholl, Beilinson's theorem on modular curves, not obtained

Needed for Theorem 1.1.2 with its integral-image proof, the correction to the integral Manin–Drinfeld argument and §7, and for the integrality K_N ⊂ K2(X1(N))_Z ⊗ Q that Brunault quotes (Remarques 84, 2). NEXT SOURCE ACTION: obtain the paper (Perspectives in Math. 4, 1988). Added by REV-EllipticRegulators.

Needed by: `ER.7/the-pushforward-and-its-hypotheses`, `ER.7/symbols-of-modular-units-in-K2`.

Status: **Answered.** The ER.6 and ER.7 parts read the authors' copy. Theorem 1.1.2 is planned in its three assertions, and the integrality argument of §7 is decomposed (`ER.7/integral-beilinson-subspace`).

#### Merel's appendix: Théorème A and the proofs of Corollaire 2 and Théorème D not read; Théorème D off by a factor 4

Corollaire 2 (non-vanishing of a primitive twist) and Théorème A (Manin symbols in terms of twisted L-values) are inputs of Lemme 99 and of (3.145). Numerically, the even part of the specialisation of Théorème A used as (3.145) has the wrong sign (p = 11, 19) and Théorème D gives one quarter of the residue (p = 11, 19). NEXT SOURCE ACTION: read the appendix pp. 143-155 in full and locate both discrepancies. Added by REV-EllipticRegulators.

Needed by: `ER.7/nonvanishing-of-a-twisted-value`, `ER.7/the-explicit-theorem-for-an-elliptic-curve`, `ER.7/prime-level-L-value-formula`.

Status: **Partly answered.** The ER.7 part read the whole appendix. The analytic location of E15 and E16 and the composite-level adapter remain its gap G3.

#### Kronecker's limit formulas and the continuation of E_x(z, s): Siegel's lectures not read

Brunault follows Siegel, Advanced Analytic Number Theory (Tata, 1961/1980), pp. 1-73, and omits the proofs. NEXT SOURCE ACTION: read Siegel's Theorems 1-3 (pp. 17, 40, 69). Added by REV-EllipticRegulators.

Needed by: `ER.7/kronecker-limit-formulas`, `ER.7/real-analytic-eisenstein-series`.

Status: **Answered as to reading.** The ER.7 part read Siegel's §§1, 3 and 5. The analytic adapters (Poisson hypotheses, contour estimates, Abel summation, interchanges) remain its gap G6.

#### Manin–Drinfeld: proof source not read

Brunault cites Manin (1972) and Drinfeld (1973) without proof. NEXT SOURCE ACTION: read Drinfeld, 'Two theorems on modular curves' (1973), or an equivalent textbook proof via Eichler–Shimura and the Weil bound. Added by REV-EllipticRegulators.

Needed by: `ER.7/manin-drinfeld`.

Status: **Answered.** Schappacher–Scholl 3.4.0, with `ER.7/cuspidal-hecke-separation`. The requests to R12.5 and R14.6 remain.

#### Regulator compatibility with the norm along a finite morphism of curves, and descent of the pushed class

Brunault proves only the projection-formula analogue for Goncharov's function (Corollaire 37) and never pushes a modular-unit class to a general E (only N = 11, where E = X1(11)). NEXT SOURCE ACTION: Schappacher–Scholl §7 or Deninger–Scholl, 'The Beilinson conjectures' (1991), for the compatibility of the regulator with pushforward, and the descent to K2(E) ⊗ Q. Added by REV-EllipticRegulators.

Needed by: `ER.7/regulator-under-finite-pushforward`, `ER.7/the-pushforward-and-its-hypotheses`.

Status: **Partly answered.** The compact-class case and rational descent are `ER.7/elliptic-regulator-adjointness` (Deninger–Scholl (2.6)–(2.8)). Arbitrary function-field symbols remain the ER.7 part's gap G2, which is also the ER.4 part's gap.

#### The syntomic side is stated, not decomposed

NEXT SOURCE ACTION: Besser, 'Syntomic regulators and p-adic integration II: K2 of curves' (Israel J. Math. 120, 2000), and Coleman–de Shalit, 'p-adic regulators on curves and special values of p-adic L-functions' (Invent. Math. 93, 1988), for the elliptic specialisation; the construction itself is PadicHodgeRegulators:D.5's. Added by REV-EllipticRegulators.

Needed by: `ER.8/the-syntomic-comparison`.

Status: **Answered,** by the ER.8 part's six comparison nodes, except for the exact D.5 interface (the ER.8 part's first gap).

#### The sign of L(f, χ, 1) in Théorème 8 is fixed only numerically in the source

Brunault determines the sign in L(f, χ, 1) = ±αΩ^+/(5τ(χ̄)) with ComputeL (source issue E5). The sign is minus (checker C, 40 digits), but a proof needs a certified error bound (Polylogarithms:P.2/certified-numerics style) or an exact modular-symbol computation with orientation tracking. Added by REV-EllipticRegulators.

Needed by: `ER.7/the-X1-11-example`.

Status: **Open.** This is the ER.7 part's gap G4.

#### Early M.8 supplier must be split before it can be a dependency

The generic real Deligne complex is requested through M.8 but requires a separately accepted early prefix. Do not add the whole M.8→consumer edge: it imports late D.2/R.7 work and can close a cycle. No new stage ID is fabricated here.

Needed by: `ER.2/the-deligne-cohomology-target`, `ER.2/the-normalisation-factor`.

Status: **Open.** This is the ER.2 part's gap; the ER.7 part's M.8 request is of the same kind.

#### Early modular-unit K₂ interface

KatoEulerSystems L0 already supplies modular units. The L1 request is for the early symbol and functoriality interface only; identify a concrete supplier before adding a whole-stage dependency. Brunault’s character-specific unramifiedness and pushforward proofs remain here.

Needed by: `ER.7/symbols-of-modular-units-in-K2`.

Status: **Open.** This is the ER.7 part's gap G1.

### Gaps of the ER.2 part

#### Acyclic early M.8 Deligne and Chern export

No suitable early Deligne node or stage id exists in the current M.8 packet/reservations. M.8 still requires late BorelRegulators:R.7 and PadicHodgeRegulators:D.2. The requested generic complex/regulator belongs there, but listing all of M.8 as an ER.2 prerequisite would import the late comparison loop. The exact mathematical contract is supplied above and verified in Schneider/Nekovář/Brunault; the owner must expose it before these cohomological comparison claims can be closed. The elliptic source/sign comparison is established at the planning level; this is the remaining supplier gap, not an uncomputed normalization constant.

Needed by: `ER.2/elliptic-deligne-specialisation-contract`, `ER.2/archimedean-rank-from-orbits`, `ER.2/chern-character-symbol-comparison`.

Status: **Open.**

### Gaps of the ER.3 part

#### Normalized Green kernel is a supplier boundary

GZ.2 owns the general Green kernel. Its current stage states the required direction, but no declaration-sized supplier node for the exact normalization and local estimates was found. The request records every property used. No new Green construction is duplicated here.

Needed by: `ER.3/green-function-of-the-curve`, `ER.3/goncharov-function-and-the-regulator`.

Status: **Open.**

#### Gaussian regularisation must converge in the Green pairing

The source’s Proposition 24 exchanges a non-absolutely-convergent Green series and an integral. A Gaussian factor exp(−δ‖λ‖²) gives smooth kernels and valid exchanges for δ>0. To close the limit prove convergence of the smoothed G in L³ and of its antiholomorphic derivative in L^(3/2), or provide the equivalent H^(1/2)/H^(−1/2) duality argument. Local singularity estimates alone do not prove this approximation theorem. The absolutely convergent final |λ|^(−3) series then admits dominated convergence. This part proves the orbit-sum Fourier identity independently and does not assume this limit.

Needed by: `ER.3/goncharov-function-and-the-regulator`.

Status: **Open.**

#### Multiple roots and exceptional constants in Lecture 9

The parent sourceIssue EllipticRegulators/E5 remains open: Bloch reduces to simple zeros and generic K without spelling out continuity in the divisors. Supply continuity of the weighted divisor evaluation as roots of f−K collide, using the uniform logarithmic modulus, and account for K=0,1 and constant functions. The new projective-line bridge covers K≠0,1 and supports in C×; it does not silently close this limiting step.

Needed by: `ER.3/zeros-of-truncated-products`, `ER.3/steinberg-for-the-companion`, `ER.3/steinberg-for-the-dilogarithm`, `ER.3/the-steinberg-relation-by-truncation`.

Status: **Open.**

### Gaps of the ER.4 part

#### Inherited geometric regulator/transfer compatibility remains ER.7’s

The ER.4 transfer target is supplied for constant-field extensions by its accepted parent node. The stronger statement r_Y(N_φ ξ)(ω)=r_X(ξ)(φ*ω) for every ξ in K₂(C(X)) is EllipticRegulators:ER.7/regulator-under-finite-pushforward, whose parent node itself records a gap. Projection on symbols {f,φ*g} alone does not establish a generating family for all ξ. This follow-up neither asserts that reduction nor replans ER.7. Assembly must retain the supplier’s gap.

Needed by: `ER.7/regulator-under-finite-pushforward`.

Status: **Open,** and assigned to ER.7: it is part of the ER.7 part's gap G2.

### Gaps of the ER.6 part

#### Inherited ER.2 comparison with the universal regulator

The parent packet explicitly leaves open the comparison of its Brunault/Bloch symbol normalisation with MotivicEtaleKTheory M.8’s universal Deligne regulator (parent gap “Brunault’s normalisation of Deligne cohomology against the universal regulator”). All determinant statements here use the fixed ER.2 Betti rational structure and the imported restricted universal regulator, and their generic linear algebra is independent of this comparison. An exact formula for the Bloch class in those determinant coordinates cannot be inferred from nonvanishing alone. The ER.2 follow-up must supply the comparison with the exact Tate twists and rational factors; this job does not replan that object or claim to discharge that inherited source gap.

Needed by: `ER.6/regulator-determinant-in-betti-coordinates`, `ER.6/integral-nonzero-bloch-class`.

Status: **Open.** It is the parent's first gap.

### Gaps of the ER.7 part

#### Early pair-symbol interface and full-level cusp adapters

The concrete early Kato L1 node supplies its distinguished pair on Y(M,N), not the arbitrary rational pair span with fixed tame-symbol convention needed here. The correction node now gives a full-level proof of span membership using F-rational cusps, L0 principal cusp units and SchemeKTheoryOperations Weil reciprocity. Their precise component-field and unit-realization adapters, together with the accepted early L1 boundary, remain supplier obligations. Bloch Chapter VIII Lemma 5.2 was not read, and no general version is claimed. No arbitrary norm-generation or noncancelling trace argument is used.

Needed by: `ER.7/fixed-level-beilinson-subspace`, `ER.7/constant-symbol-regulator-correction`, `ER.7/regulator-nonvanishing-after-level-change`, `ER.7/isotypic-regulator-image`.

Status: **Open.**

#### Early regulator normalization and proper cycle-map prefix

Canonical proper covariance was read in Deninger–Scholl, but the original ER.2 normalization node still requires the accepted early M.8 prefix. Spell out the compact/open projection and the factor comparing SS’s (1/(2πi))∫log|u|conjugate(dlog(v))∧ω and Brunault’s ∫η(u,v)∧ω with real Tate twists and orientation. No whole late M.8 edge is activated. The new compact adjointness theorem does not close the stronger inherited arbitrary-function-field-symbol assertion; its compact/open functorial extension remains an obligation.

Needed by: `ER.7/constant-symbol-regulator-correction`, `ER.7/regulator-period-inclusion`, `ER.7/elliptic-regulator-adjointness`, `ER.7/modular-elliptic-regulator-line`, `ER.7/regulator-under-finite-pushforward`.

Status: **Open.**

#### Merel composite-level Fourier adapter and analytic error location

The complete appendix was read. Theorem A’s conductor filters and P_p/Q_p Euler corrections require a normalized period adapter supplied by ModularForms Part II. The accepted E15 (factor four) and E16 (even-sign) corrections are imported without upgrading their numerical verification to a proof. Derive both analytically from oriented Mellin periods and the first-linear/index-normalized Petersson/Haberland formula; distinguish Σa_n²/n^s from the full tensor-product Euler L-function. E17 follows algebraically after the corrected convention.

Needed by: `ER.7/prime-level-L-value-formula`, `ER.7/rational-combination-for-L-E-2`, `ER.7/nonvanishing-of-a-twisted-value`.

Status: **Open.**

#### Certified sign in the X1(11) worked example

Inherited source issue E19 requires exact oriented modular-symbol evaluation or a rigorous tail-bound computation. No new uncertified numerical run is a proof; the general transfer theorem is independent of this example.

Needed by: `ER.7/the-X1-11-example`.

Status: **Open.**

#### Primitive even twist at exactly the original modulus

Brunault BSMF Remark 1.2 does not establish existence of a primitive even χ of conductor N avoiding 1 and ψbar with nonzero L(f,χ,1). Merel’s parity/conductor-dividing statement is weaker. Retain the explicit formula conditionally; use SS’s freely chosen auxiliary conductor and local level refinement for the general theorem. No assertion about the present research status of this question is made.

Needed by: `ER.7/the-pushforward-and-its-hypotheses`.

Status: **Open.**

#### Imported analytic and special-fibre supplier proofs

The exact R12.3, R12.5, R13.5, R13.6, R14.6, R16.2, R16.4, R16.5 and PS.1 contracts are requested stages rather than completed declaration-level suppliers. Shimura pp.212–214 were read: the two-prime argument resolves finite-exception avoidance at unrestricted auxiliary level. Its period algebraicity and modular-symbol generator results invoke earlier 1976 work, not read; the normalized all-conjugates PS.1 adapter is still requested. Siegel’s limit proofs were read, but the pinned power-kernel Poisson hypotheses, branch-cut contour estimates, Abel summation bounds and the separate Gaussian theta/Mellin continuation and all interchanges/eta constants still need a Lean-level analytic adapter, building on Completed/ContourIntegration. These are recorded obligations, not missing target nodes. R13.6 must additionally supply resolution/common domination for regular mixed-characteristic arithmetic surfaces. Existing elliptic E.6 nodes do not quantify over general modular curves, and ordinary characteristic-zero resolution alone is insufficient. S.2 total K/G transfer and base change, with S.6 restriction-compatible weight projectors, are imported explicitly; the special-fibre localization/weight adapter remains open.

Needed by: `ER.7/cuspidal-hecke-separation`, `ER.7/regulator-period-inclusion`, `ER.7/regulator-nonvanishing-after-level-change`, `ER.7/supersingular-orders-of-modular-units`, `ER.7/full-level-modular-symbol-integrality`, `ER.7/integral-beilinson-subspace`, `ER.7/kronecker-limit-formulas`, `ER.7/elliptic-regulator-adjointness`, `ER.7/modular-elliptic-regulator-line`.

Status: **Open.**

### Gaps of the ER.8 part

#### Exact good-reduction elliptic regulator interface and full vector

D.5/D.2 have stage contracts but no exact existing degree-two node providing all the required maps and normalisations. Besser–de Jeu Remark 1.10 supplies the public K2 pairing formula, but the original Besser II proof was not obtained. The request specifies the exact inputs and the full regulator vector; the suggested file does not invent geometric cohomology or regulator types. General elliptic Coleman pullback also inherits the supplier gap.

Needed by: `ER.8/good-reduction-elliptic-pairing`, `ER.8/elliptic-syntomic-etale-factor`, `ER.8/weight-two-padic-beilinson-conjecture`.

Status: **Open.**

#### CM index-point coordinates and the one-point numerical identity

The full six-torsion certificate schema and corrected three-point scalar are specified. The CM.1/CM.2 requests must supply the matching algebraic coordinate/orientation dictionary. An exact derivation that the three-point D-sum equals -D_E((2,3)) remains to be given using that dictionary and the ER.5 distribution identities; the parent decimal agreement is not a proof.

Needed by: `ER.8/cm36-full-torsion-certificate`, `ER.8/cm36-corrected-l-value`.

Status: **Open.**

#### Geometric signatures absent from the pinned prototype

The suggested file prototypes the scalar, explicit rational-scalar predicate, actual elliptic function-field functions, raw free-group symbol and finite residue tables. Actual K2 certificate/quotient, transfer, arithmetic model, motivic/cohomology and refined-distribution signatures await the imported owners and are named explicitly in comments. Their absence is not represented by arbitrary Prop-valued fields or an assumed conclusion. Elaborating the fragment does not validate these omitted signatures.

Needed by: `ER.8/good-reduction-elliptic-pairing`, `ER.8/elliptic-syntomic-etale-factor`, `ER.8/neron-refinement-period-dictionary`, `ER.8/weight-two-padic-beilinson-conjecture`, `ER.8/cm36-full-torsion-certificate`, `ER.8/cm36-corrected-l-value`, `ER.8/quadratic-corrected-symbol`, `ER.8/quadratic-transfer-certificate`, `ER.8/quadratic-regulator-trace`, `ER.8/integral-example-padic-eligibility`.

Status: **Open.**

## Requests

The nine packets file 75 requests with 27 supplier roadmaps. Each request names the supplier layer, the exact statement needed and the consuming nodes. Several of the parent packet's requests are refined or replaced by a part; each carries a status line. Requests to Tau Ceti layers stay requests, because Tau Ceti roadmaps are never planned here.

### AdditiveCombinatorics — Additive combinatorics, higher Fourier analysis and primes

- **AdditiveCombinatorics:AC.0**, from the parent packet: RT-AREA-combinatorics/14: export the missing finite-abelian character coefficient/comparison interface once. For finite abelian G, A(f)(χ)=|G|⁻¹ Σ_x f(x) conj(χ(x)); normalized convolution uses |G|⁻¹. Export inversion f(x)=Σ_χ A(f)(χ)χ(x), Parseval |G|⁻¹Σ|f|²=Σ|A(f)|² and convolution-to-product. Compare A with AddChar.complexBasis.repr, counting coefficients |G|A, unitary coefficients sqrt(|G|)A, and pinned ZMod.dft. Reuse AddChar basis/orthogonality and CommGroup.sum_monoidHom_apply_eq_ite; the Peter–Weyl/Haar results are existing ingredients, with the character/coefficient identification still to supply. Compare upstream coding/modular-form specializations when available without making their entire stages prerequisites. ER.4 specializes G=(Z/C)², |G|=C², and ER.5 uses unitary scale C. Reviewed audit AUDIT-16 correctly says partly built; its missing Tau Ceti column-orthogonality citation is recorded in this packet baseline and the fix report, without editing the frozen audit.
  - Needed by: `ER.4/finite-fourier-transform`, `ER.5/fourier-transform-on-O-mod-C`.
  - Status: Open. The ER.4 and ER.5 parts cite AC.0's planned nodes `AdditiveCombinatorics:AC.0/fourier-transform` and `AdditiveCombinatorics:AC.0/fourier-parseval` directly (RT-AREA-combinatorics/14).

### AutomorphicLFunctionsAndLocalFactors — Automorphic L-functions and local factors

- **AutomorphicLFunctionsAndLocalFactors:AL.1**, from the parent packet: Hecke L-functions of the CM Grössencharacter (RS-14 link).
  - Needed by: `ER.5/the-CM-setup-and-the-hecke-character`.
  - Status: Replaced by the ER.5 part's imports of the nodes `AutomorphicLFunctionsAndLocalFactors:AL.1/unramified-local-theory` and `AutomorphicLFunctionsAndLocalFactors:AL.1/ramified-local-theory` (REV-EllipticRegulators--ER.5).
- **AutomorphicLFunctionsAndLocalFactors:AL.3**, from the parent packet: The Rankin–Selberg residue Res_{s=2} Σ a_n² n^{−s} = 12π⟨f, f⟩ (with a stated Petersson normalisation) used by Théorème 2.
  - Needed by: `ER.7/prime-level-L-value-formula`.
  - Status: Still needed by `ER.7/prime-level-L-value-formula`. The ER.7 part reaches AL.3 through its R16.5 request.

### ColemanIntegration — Coleman integration and noncritical Dirichlet L-values

- **ColemanIntegration:L1**, from the parent packet: Coleman integration on curves with good reduction (the 'p-adic elliptic integrals' of the ER.8 stage text; audit duplicate).
  - Needed by: `ER.8/the-syntomic-comparison`.
  - Status: Refined by the ER.8 part's L1 request.
- **ColemanIntegration:L1**, from the ER.8 part: For a good-reduction proper elliptic curve over a finite p-adic field and a holomorphic η, provide parameter-independent constant-term evaluation of int log(g)η at every zero/pole of g, invariance of evaluation on a principal degree-zero divisor under additive primitive constants, and finite-extension Galois/trace compatibility. State the integral-etale-coordinate/uniform-Taylor hypotheses or discharge the existing general elliptic pullback gap; punctured-line functoriality alone does not supply it.
  - Needed by: `ER.8/good-reduction-elliptic-pairing`.

### ComplexComparisonPartII — Complex Comparison PartII

- **ComplexComparisonPartII:C5**, from the parent packet: The algebraic de Rham–Betti comparison H^1_dR(E/k) ⊗_k C ≅ H^1(E(C), C) for an elliptic curve over k ⊂ C, compatible with the Hodge filtration F^1 = Ω^{1,0}, with integration over cycles, and with F² H^1_dR = 0.
  - Needed by: `ER.1/periods-and-the-comparison-isomorphism`, `ER.2/the-deligne-cohomology-target`.
  - Status: Refined. The additive comparison is the node `ComplexComparisonPartII:C5/repair-proper-de-rham-betti`, and F² = 0 needs no Hodge input. Integral integration and conjugation are the subject of the ER.1 and ER.2 parts' C5 requests.
- **ComplexComparisonPartII:C5**, from the ER.1 part: The existing proper de Rham–Betti comparison node with its integration map on the integral Betti lattice before complexification, naturality under base change along every field embedding and conjugation. The abstract complex vector-space isomorphism alone does not supply these integral maps.
  - Needed by: `ER.1/regulator-period-handoff`.
- **ComplexComparisonPartII:C5**, from the ER.2 part: For each smooth projective elliptic Eσ, supplement C5/repair-proper-de-rham-betti with real-conjugation compatibility and the oriented Poincaré/cup/period pairing. Its finer node already supplies the additive Betti–de Rham comparison. F²=0 follows from Ω^{≥2}=0 on a smooth curve and requires no new Hodge-decomposition theorem. The accepted ER.1 period nodes supply the specialised lattice data.
  - Needed by: `ER.2/elliptic-deligne-specialisation-contract`.
- **ComplexComparisonPartII:C6**, from the parent packet: Hodge filtration/decomposition and conjugation for the elliptic H¹ comparison, compatible with C5 integration and the oriented period lattice. ER.1 specializes the comparison, it does not rebuild generic Hodge theory.
  - Needed by: `ER.1/periods-and-the-comparison-isomorphism`, `ER.1/all-embeddings-and-the-conjugation-action`.
  - Status: Refined by the ER.1 part's C6 request.
- **ComplexComparisonPartII:C6**, from the ER.1 part: The owning elliptic acceptance computation: identify the Hodge line with the invariant differential, construct integration H1_sing(E(C),Z) → Λ_ω, show it is an integral isomorphism, send the projected path t↦t·λ to λ, and compare the polarized intersection form with the complex orientation. Provide the real conjugation action, fixed primitive rank-one lattice and integration naturality at all embeddings. A period matrix and its nondegeneracy, if needed by PS.0, remain this owner’s computation.
  - Needed by: `ER.1/oriented-regulator-period-data`, `ER.1/conjugate-oriented-periods`, `ER.1/real-period-shape`, `ER.1/primitive-real-regulator-cycles`, `ER.1/regulator-period-handoff`.

### ComplexMultiplicationAndExplicitReciprocity — Complex multiplication and explicit reciprocity

- **ComplexMultiplicationAndExplicitReciprocity:CM.1**, from the parent packet: CM elliptic curve and endomorphism-order interface; ER.5 specializes CM.4’s Hecke character to Bloch’s maximal-order, class-number-one E/Q case, retaining conductor, bad Euler factors and the explicit class U.
  - Needed by: `ER.5/the-CM-setup-and-the-hecke-character`.
  - Status: Refined by the ER.5 and ER.8 parts' CM.1 requests.
- **ComplexMultiplicationAndExplicitReciprocity:CM.1**, from the ER.5 part: Import the CM endomorphism/order action and oriented ideal-lattice uniformization for maximal-order E/ℚ, together with the finite unit group and principal ideal generator ambiguity. ER.5 does not classify CM orders or reconstruct the CM curve. For the Bloch model, certify compatibility of the selected analytic uniformization with the natural complex-conjugation action. For other ℚ-twists supply the actual transported real structure instead; ER.5 does not infer natural conjugation from an abstract CM order or a homothety of complex tori.
  - Needed by: `ER.5/cm-gauss-coefficient`, `ER.5/principal-generator-L-series-comparison`.
- **ComplexMultiplicationAndExplicitReciprocity:CM.1**, from the ER.8 part: For E:y²=x³+1 with ER.1 real-adapted Néron differential, fix the analytic-to-algebraic map C/(Ω(Z+Ztau)) to E(C), τ=(1+√(-3))/2, and expose the algebraic coordinates over κ(E[6]) of the three index points 1/6,(5+4τ)/6,(3+2τ)/6 and all six-torsion points. Match its chosen orientation with ER.5, so the certificate schema and D_E values refer to the same points.
  - Needed by: `ER.8/cm36-full-torsion-certificate`, `ER.8/cm36-corrected-l-value`.
- **ComplexMultiplicationAndExplicitReciprocity:CM.2**, from the parent packet: The action of Gal(κ(E[C])/κ) on E[C] through the Grössencharakter (Bloch p. 92: the ray class group (O/CO)^×/μ_κ acts by x·(y/C) = x^{-1}χ(x)y/C), and the action of complex conjugation, for a CM curve over ℚ.
  - Needed by: `ER.5/the-class-U`.
  - Status: Refined by the ER.5 part's CM.2 request: the Galois action through the ray representation, and the real structure.
- **ComplexMultiplicationAndExplicitReciprocity:CM.2**, from the ER.5 part: At C divisible by conductor, import the actual torsion-field Galois image and action y/C↦z⁻¹χ(z)y/C for ray residues z, plus complex conjugation. It is enough that Gal(κ(E[C])/κ) acts through this ray representation; do not assert it equals the entire ray class group. This supplies invariance of the parent U. For the Bloch model, certify compatibility of the selected analytic uniformization with the natural complex-conjugation action. For other ℚ-twists supply the actual transported real structure instead; ER.5 does not infer natural conjugation from an abstract CM order or a homothety of complex tori.
  - Needed by: `ER.5/the-class-U`.
- **ComplexMultiplicationAndExplicitReciprocity:CM.2**, from the ER.8 part: Supply the full torsion-level Galois action over L=κ(E[6]) for the twist y²=x³+1 and the fixed CM character, including conjugation; match ER.5 x acting on y/C by x^(-1)χ(x)y/C. This certifies the three-summand U descent, not descent of each summand separately.
  - Needed by: `ER.8/cm36-full-torsion-certificate`.
- **ComplexMultiplicationAndExplicitReciprocity:CM.4**, from the parent packet: For E/ℚ with CM by the maximal order O_κ (class number one): the Grössencharakter in Bloch's form χ^{Gross}((h)) = h̄·χ(h) with χ : (O/fO)^× → μ_κ restricting to the chosen embedding on μ_κ, its conductor f (with f̄ = f), Lang's identity χ(x̄) = χ̄(x), its infinity type, and Deuring's equality of every Euler factor with Mathlib's WeierstrassCurve.LSeries, including the factor 1 at each (additive) bad prime.
  - Needed by: `ER.5/the-CM-setup-and-the-hecke-character`, `ER.5/the-class-U`, `ER.5/the-L-value-theorem`.
  - Status: Refined by the ER.5 part's CM.4 request: ψ as a `MultiplicativeIdealWeight`, f̄O = fO, and all local factors.
- **ComplexMultiplicationAndExplicitReciprocity:CM.4**, from the ER.5 part: Import ψ as the existing TauCeti.MultiplicativeIdealWeight κ, zero at ideals divisible by conductor primes, with primitive χ:(O/fO)×→μ, χ|μ the embedding, χ(x̄)=χ̄(x), (f̄)=(f), ψ((h))=h̄χ(h), and ‖ψ(I)‖=N(I)^(1/2) on conductor-prime-to ideals. Export Deuring’s comparison to the pinned WeierstrassCurve.LSeries on Re s>3/2 with ALL local factors, including additive bad factors1 and conductor N_E=|discκ|N(f). Twists must select their own χ; maximal order/class number one is the exact consumer scope.
  - Needed by: `ER.5/the-CM-setup-and-the-hecke-character`, `ER.5/cm-gauss-coefficient`, `ER.5/principal-generator-L-series-comparison`, `ER.5/cm-ideal-series-at-two`.

### EllipticCurveModularity — Modularity and modular parametrisations of elliptic curves over Q

- **EllipticCurveModularity:R29.5**, from the parent packet: A non-constant morphism X0(N) → E over Q sending the rational cusp to O (the actual modular parametrisation, RS-06), for the pushforward and for comparing Ω_E^+ with the periods of f.
  - Needed by: `ER.7/the-pushforward-and-its-hypotheses`, `ER.7/rational-combination-for-L-E-2`.
- **EllipticCurveModularity:R29.6**, from the parent packet: For E/Q of conductor N, a newform f ∈ S2(Γ0(N)) with L(E, s) = L(f, s) (all local factors), hence the analytic continuation and functional equation of L(E, s).
  - Needed by: `ER.6/the-beilinson-statement`, `ER.6/beilinson-forms-equivalent`, `ER.7/the-explicit-theorem-for-an-elliptic-curve`, `ER.7/the-pushforward-and-its-hypotheses`, `ER.7/nonvanishing-of-a-twisted-value`, `ER.7/rational-combination-for-L-E-2`, `ER.7/prime-level-L-value-formula`.
  - Status: Open. The ER.6 part refines it for the continued function and nonvanishing at two.
- **EllipticCurveModularity:R29.6**, from the ER.6 part: Consume R29.6/l-function-continuation without redefining its objects, and expose an actual continued L-function whose equality with WeierstrassCurve.LSeries is asserted in the convergence region. Supply the conductor N>0, root sign w=±1, full completed identity, functional equation, and L(E,2)≠0 (or positive real value) from the convergent full Euler product and Hasse bounds, with all bad factors. The existing named continuation node supplies the FE transfer; this request pins its analytic interface and the nonvanishing input used for exact order. This is the explicit R29.6→ER.6 edge required by RT-AREA-ktheory-2/9.
  - Needed by: `ER.6/modularity-supplied-leading-term-limit`.

### EllipticKTheory — K-theory of curves and elliptic curves

- **EllipticKTheory:E.6**, from the ER.6 part: Extend the existing integral-part API with the following exact specialisations of Scholl I §1 and II §2: for E over a number field or a characteristic-zero nonarchimedean local field with finite residue field and finite extension F′/F, α∈I(E/F) iff α_(F′)∈I(E_(F′)/F′); pullback is injective after rationalisation. Over a number field, α∈I(E/F) iff α_(F_v) lies in I(E/F_v) for every finite v. Supply these for the full rational K₂ image, justifying the passage from Scholl’s Adams-weight motivic statements using S.6’s finite weight decomposition; keep regular models and the generic-fibre maps explicit. The existing E.6 definition/model-independence/good-prime nodes do not themselves state this reflection/local-global API. Explicitly construct I(E/F_v) and I(E/L_v) as images from regular proper flat models over the local integer rings, prove local model independence, and prove I(E/L_v)=K₂(E/L_v)⊗Q when E/L_v has good reduction, by S.3 localisation and E.5 torsion of K₁ of the smooth proper finite-field fibre. The current number-field E.6 statements do not by themselves cover local fields.
  - Needed by: `ER.6/potentially-good-integrality-by-local-descent`.

### EllipticRegulators — Elliptic regulators, explicit K₂ classes and L-values

- **EllipticRegulators:ER.2**, from the ER.6 part: Expose the Betti rational structure B=H¹(E(C),Q(1))^− (Q(1)=2πiQ, minus for the geometric c* acting on the disjoint union over all embeddings). Give its inclusion into H¹(E(C),R(1))^− and the canonical scalar-extension isomorphism R⊗Q B≃H²_D(E_R,R(2)), using the already owned real-target comparison. Prove dim_Q B=[F:Q] by rational conjugation eigenspaces, including complex pairs, and specify its determinant rational line. The existing ER.2/the-deligne-cohomology-target node states the real comparison and dimension, while ER.6/the-beilinson-statement mentions this rational structure without constructing its API. Retain the existing Tate twist and combined-conjugation convention; this request is separate from the universal-regulator normalisation gap.
  - Needed by: `ER.6/regulator-determinant-in-betti-coordinates`.

### GL2AutomorphicRepresentationsAndTransfer — GL₂ Automorphic Representations And Transfer

- **GL2AutomorphicRepresentationsAndTransfer:R16.2**, from the ER.7 part: Local Kirillov/Whittaker test-vector statements SS 4.5.2–4.5.4 with ψ_p(p^−r)=exp(−2πip^−r), vol(Z_p×)=1, and arithmetic s-normalization: spherical Euler quotient at good primes; at bad primes compactly supported vectors can be chosen with I(1)=1 after shrinking their stabilizers. A fixed-level newvector nonvanishing assertion is insufficient.
  - Needed by: `ER.7/regulator-period-inclusion`, `ER.7/regulator-nonvanishing-after-level-change`.
- **GL2AutomorphicRepresentationsAndTransfer:R16.4**, from the ER.7 part: The global modular tower Ω¹⊗Qbar=⊕πV_π, irreducibility of V_π^K under the finite-level Hecke algebra, semisimplicity and coefficient-Galois descent, with full oldvector multiplicities and contragredient duality. Use actual small-level/stabilizer degrees rather than blindly substituting an abstract group index.
  - Needed by: `ER.7/isotypic-regulator-image`, `ER.7/beilinson-rational-structure`, `ER.7/beilinson-determinant-formula`.
- **GL2AutomorphicRepresentationsAndTransfer:R16.5**, from the ER.7 part: Import AutomorphicLFunctionsAndLocalFactors:AL.3 (the Rankin–Selberg owner in the current R16.5 stage and RS-21) for the global finite-adelic Rankin–Selberg factorization in SS 4.5.3 and unfolding 5.1.0: algebraic local factor A times L(π,2)L(π⊗χ,1)/L(ωπχ,2), Haar vol(GL2(Zhat))=1, analytic prefactor πiΓ(s+1)/(4π)^(s−1) times [GL2(Zhat):±K]. This request consumes the general theory, and adds only its classical arithmetic normalization adapter.
  - Needed by: `ER.7/regulator-period-inclusion`.

### GrossZagierAndArithmeticHeights — Gross–Zagier formulas and arithmetic heights

- **GrossZagierAndArithmeticHeights:GZ.2**, from the parent packet: At an infinite place: existence, uniqueness, symmetry and Arakelov normalisation of the Green kernel G_X of a compact Riemann surface (∂∂̄G = πi(vol − δ), logarithmic singularity, ∫ G vol = 0).
  - Needed by: `ER.3/green-function-of-the-curve`.
  - Status: Refined by the ER.3 part's GZ.2 request.
- **GrossZagierAndArithmeticHeights:GZ.2**, from the ER.3 part: For a compact complex Riemann surface supply the real normalized Green kernel G(P,t), smooth off the diagonal, symmetric, mean zero against the canonical probability volume, with ∂∂̄G=πi(vol−δ_P) as currents and G(P,t)−log|z(t)−z(P)| smooth in a coordinate near P. Include its resulting local derivative bound O(1/r), hence G(P,·)∈L^p for every finite p and ∂̄G(P,·)∈L^p for 1≤p<2. On an elliptic torus identify this normalization with the explicit kernel of the imported ER.3 node.
  - Needed by: `ER.3/green-function-of-the-curve`, `ER.3/goncharov-function-and-the-regulator`.

### KatoEulerSystems — Kato classes and explicit reciprocity for modular forms

- **KatoEulerSystems:L0**, from the parent packet: Siegel units with q-expansions, divisors at the cusps and Galois descent; ER.7 identifies u_f with C-linear combinations of them (Kronecker's second limit formula) instead of re-planning them.
  - Needed by: `ER.7/modular-units-and-their-divisors`.
  - Status: Refined by the ER.7 part's L0 request (sole owner, RT-AREA-ktheory-2/6).
- **KatoEulerSystems:L0**, from the ER.7 part: Single owner of Siegel/modular units, componentwise cusp-divisor realization after rationalization, q-product normalization, Galois action and descent to the algebraic modular curve. Supply units integral on the good open model over Z[1/n]. Do not assert every modular unit is an integral unit at all bad primes; SS §7 proves integrality of compact K2 combinations instead.
  - Needed by: `ER.7/constant-symbol-regulator-correction`, `ER.7/regulator-period-inclusion`, `ER.7/regulator-nonvanishing-after-level-change`, `ER.7/ordinary-unit-reduction`, `ER.7/supersingular-orders-of-modular-units`.
- **KatoEulerSystems:L1**, from the parent packet: An early interface for K₂ symbols of the Siegel units supplied by L0, with restriction, descent and norm compatibility. ER.7 retains its character combinations, boundary certificates, Manin–Drinfeld argument and regulator/Rankin–Selberg evaluations; it does not require the late Iwasawa Euler-system stage as a whole.
  - Needed by: `ER.7/symbols-of-modular-units-in-K2`.
  - Status: Refined by the ER.7 part's L1 request (early prefix only).
- **KatoEulerSystems:L1**, from the ER.7 part: Extend the concrete early pair-symbol declaration to the bilinear rational symbol interface on Y_K, arbitrary pairs of the L0 Siegel units and their rational span, compatible with field extension and transfer. Supply its tame-symbol convention and bilinearity for rational constants from the full-level component field. The ER.7 correction proof uses cusp-unit realization from L0 and Weil reciprocity from SchemeKTheoryOperations S.3; no generic Bloch correction is replanned in L1. L1 owns this before any modular-parametrization/Iwasawa machinery; no whole L1 edge is activated until an accepted early-prefix boundary exists.
  - Needed by: `ER.7/fixed-level-beilinson-subspace`, `ER.7/constant-symbol-regulator-correction`.
  - supplierNode: KatoEulerSystems:L1/beilinson-element-in-K2-of-Y-M-N
  - dependencyPolicy: Concrete early L1 nodes are imported; missing early interface is gap G1, not a whole-stage prerequisite.

### ModularCurvesPartII — Modular Curves PartII

- **ModularCurvesPartII:R12.1**, from the parent packet: The uniformisation E(C) ≅ C/Λ_ω, P ↦ ∫_0^P ω, of the Weierstrass scheme of EllipticKTheory E.1 over C (and after base change along each embedding of a number field), compatible with the origin and the group law, with ω pulled back to dz; the converse construction from a lattice (g₂³ − 27g₃² ≠ 0) and homothety invariance (RS-06: R12.1 owns these).
  - Needed by: `ER.1/complex-uniformisation`, `ER.1/the-q-parameter-and-the-multiplicative-presentation`, `ER.1/periods-and-the-comparison-isomorphism`, `ER.2/the-eta-form-and-its-differential-identity`.
  - Status: Refined by the ER.1 part's R12.1 request.
- **ModularCurvesPartII:R12.1**, from the ER.1 part: The actual complex Lie group E(C), the uniformisation by C/Λ_ω with origin and group law, compatibility of the existing algebraic invariant differential with dz, and descent of the scalar normalized coordinate. Its current part packet contains no R12.1 nodes.
  - Needed by: `ER.1/oriented-regulator-period-data`.
- **ModularCurvesPartII:R12.3**, from the parent packet: The compact curve X1(N)(C) with its cusps, local parameters and widths, identified with the analytification of the algebraic curve.
  - Needed by: `ER.7/modular-units-and-their-divisors`, `ER.7/manin-drinfeld`, `ER.7/harmonicity-of-eisenstein-series`, `ER.7/rationality-of-modular-units`.
  - Status: Open; refined by the ER.7 part's R12.3 request.
- **ModularCurvesPartII:R12.3**, from the ER.7 part: Full-level n≥3 compactification component over F=Q(μ_n), with its reduced generic cusp locus consisting of F-rational points, and finite full-level covers refining any K. Supply component constant fields and analytic/algebraic cusp identification; no assertion that an arbitrary integral cusp fibre is reduced.
  - Needed by: `ER.7/constant-symbol-regulator-correction`.
- **ModularCurvesPartII:R12.5**, from the parent packet: Weight-two cusp forms as holomorphic differentials, f ↦ ω_f = 2πi f(z)dz, with the q-expansion conventions.
  - Needed by: `ER.7/rankin-selberg-integral`.
  - Status: Open; refined by the ER.7 part's R12.5 request.
- **ModularCurvesPartII:R12.5**, from the ER.7 part: The same geometric good-prime T_p acts on cusp divisors, Pic⁰ and holomorphic differentials; its Jacobian characteristic polynomial annihilates Pic⁰ and its eigenvalues satisfy |a_p|≤2√p. Include the finite-level weight-two differential/form comparison and pullback/trace adjointness with ω=2πif(z)dz.
  - Needed by: `ER.7/cuspidal-hecke-separation`, `ER.7/isotypic-regulator-image`.
- **ModularCurvesPartII:R12.6**, from the parent packet: The model of X1(N) over Q with the cusp ∞ rational, the fields of definition of the cusps and the Galois action on them, and compatibility with level change, diamond operators and complex conjugation.
  - Needed by: `ER.7/rationality-of-modular-units`, `ER.7/explicit-beilinson-theorem-degeneracy`, `ER.7/real-structure-of-the-regulator`.
- **ModularCurvesPartII:R13.5**, from the ER.7 part: The regular full-level model for n=mp^k, m≥3 and p∤m: reduced components indexed by constant-field components and P¹(Z/p^k), and their normalization maps to the prime-to-p special fibre with degree p^kφ(p^k), total supersingular ramification and the GZ/m action, as in SS 7.2.2–7.2.3. Include ordinary-locus unit reduction and the horizontal/vertical residue-content square of 7.3.0.
  - Needed by: `ER.7/ordinary-unit-reduction`, `ER.7/supersingular-orders-of-modular-units`, `ER.7/full-level-modular-symbol-integrality`.
- **ModularCurvesPartII:R13.6**, from the ER.7 part: Resolved regular graphs of finite modular level maps and finite Q-parametrizations on regular proper arithmetic-surface models, and a common regular dominating model for any two regular proper models of the same smooth generic curve. This is an explicit surface-resolution extension of R13.6, not an assertion supplied by its existing bad-fibre graph description or by characteristic-zero R09.7 resolution. With SchemeKTheoryOperations S.2 proper K/G transfer, Cartan comparison and flat generic-fibre base change, these graphs must realize the generic-fibre transfer on total model K2. Use S.6 restriction-compatible rational Adams projectors to obtain weight-two lifts; do not require arbitrary arithmetic-model pushforward to preserve pure weights.
  - Needed by: `ER.7/integral-beilinson-subspace`, `ER.7/elliptic-regulator-adjointness`, `ER.7/modular-elliptic-regulator-line`.
- **ModularCurvesPartII:R14.1**, from the parent packet: Degeneracy maps X1(N) → X1(M), diamond operators and Hecke correspondences on the algebraic curves.
  - Needed by: `ER.7/manin-drinfeld`, `ER.7/explicit-beilinson-theorem-degeneracy`.
- **ModularCurvesPartII:R14.6**, from the parent packet: The special-fibre Eichler–Shimura relation (for Manin–Drinfeld) and the rational cusp with the normalised Abel–Jacobi map used by the parametrisation (for the pushforward). It does NOT supply the modular curve with its cusps; that is R12.3/R12.6.
  - Needed by: `ER.7/the-pushforward-and-its-hypotheses`, `ER.7/manin-drinfeld`.
  - Status: Open; refined by the ER.7 part's R14.6 request.
- **ModularCurvesPartII:R14.6**, from the ER.7 part: Full Hecke-equivariant comparison of motive H¹(X_K) and weight-two automorphic factors, including bad Euler factors and oldvector multiplicities. At p, supply SS 7.1.1: Qbar[Σ]/Qbar[S] is the sum of cuspidal supersingular modules with local representation sp(1); Q[S] consists of component constants. This is a specific model/Hecke comparison beyond merely a graph Laplacian.
  - Needed by: `ER.7/cuspidal-hecke-separation`, `ER.7/beilinson-determinant-formula`, `ER.7/supersingular-orders-of-modular-units`.

### ModularSymbolsPadicLFunctions — Modular symbols and analytic p-adic L-functions of modular forms

- **ModularSymbolsPadicLFunctions:L1**, from the parent packet: Period lines Ω_f^±, Birch's formula L(f, α, 1) = −(1/N)Σ α̂(a)∫_{a/N}^∞ ω_f and the algebraicity ξ_f^+(x) ∈ Q·Ω^+/(2π) (Manin–Drinfeld for modular symbols); the period normalisation of the p-adic side.
  - Needed by: `ER.7/the-pushforward-and-its-hypotheses`, `ER.7/spanning-for-prime-level`, `ER.7/nonvanishing-of-a-twisted-value`, `ER.7/rational-combination-for-L-E-2`, `ER.8/the-syntomic-comparison`.
- **ModularSymbolsPadicLFunctions:L2**, from the parent packet: The p-adic L-function of the newform of E at p (p-stabilisation, Euler-factor change, interpolation), which must be defined before any p-adic Beilinson statement.
  - Needed by: `ER.8/the-syntomic-comparison`.

### MotivicEtaleKTheory — Motivic and étale methods for arithmetic K-theory

- **MotivicEtaleKTheory:M.8**, from the parent packet: As an early part needing no BorelRegulators input (RT-AREA-ktheory-2/7 and /24, confirmed): the real Deligne–Beilinson complex R(n)_D of a smooth variety over R with its hypercohomology, products and the exact sequence 0 → F²H^1_dR → H^1(X(C), R(1)) → H^2_D(X_C, R(2)) → 0 for curves; Beilinson's regulator K_2^{(2)} → H^2_D(X_R, R(2)) with its compatibility with pull-back to open subsets and with cup products, the cup-product formula r{F, G} = [η_B(F, G)] (Nekovář (7.3.2)), and the comparison of Schneider's normalisation (the one Brunault uses) with the universal Chern/Deligne regulator. FIX-RT-AREA-ktheory-2~2: require an EARLY real Deligne complex interface, before D.2 and BorelRegulators:R.7. The current atlas M.8 remains unsplit and depends on those later comparisons; this request is not a dependency on all of M.8 and does not claim the prefix already exists.
  - Needed by: `ER.2/the-deligne-cohomology-target`, `ER.2/the-normalisation-factor`.
  - Status: Open. The ER.2 and ER.7 parts restate it as a request for an early prefix that does not exist yet; this is a gap.
- **MotivicEtaleKTheory:M.8**, from the ER.2 part: EARLY archimedean interface only: for smooth varieties over R/C construct the real Deligne complex, logarithmic/nonproper variant, hypercohomology, Tate lines, exact cone comparison and products; construct the higher-K Chern-character regulator with ch_{i,j}=(-1)^{j-1}c_{i,j}/(j-1)! for i≥1, unit log regulator, pullback/open restriction, conjugation and norm/product compatibility. At a proper curve export the i=2,p=2 comparison and the unit cup representative. This must precede the late R.7/D.2/Selmer/Iwasawa work and take no ER.2 input.
  - Needed by: `ER.2/elliptic-deligne-specialisation-contract`, `ER.2/archimedean-rank-from-orbits`, `ER.2/chern-character-symbol-comparison`.
  - dependencyPolicy: Request addressed to the current owner, not an edge from the whole unsplit M.8 stage. Until the early export has an actual stage/node id, the missing prerequisite is recorded as a gap, as in the accepted base packet; no nonexistent id or cyclic M.8 prerequisite is inserted.
- **MotivicEtaleKTheory:M.8**, from the ER.7 part: Accepted early real Deligne cycle-map prefix only: compact/open projection, proper covariance with supports for rational weight-two K2 of curves, real structure and Poincaré duality. Fix the identification of the canonical r_D pairing (1/(2πi))∫log|u|conjugate(dlog(v))∧ω with the inherited Brunault r_N convention, including the factor-two comparison in ER.2. Do not activate the whole late M.8 stage, whose D.2/R.7 dependencies can close a cycle.
  - Needed by: `ER.7/constant-symbol-regulator-correction`, `ER.7/regulator-period-inclusion`, `ER.7/elliptic-regulator-adjointness`.
  - dependencyPolicy: Consumes EllipticRegulators:ER.2/the-normalisation-factor; its early-prefix split remains inherited gap G2.

### NeronModelsAndSemistableAbelianVarieties — Néron models and semistable abelian varieties

- **NeronModelsAndSemistableAbelianVarieties:R11.6**, from the parent packet: The Néron differential and real period Ω_E^+ of E/Q and the equation/scheme comparison of the invariants used, for the Manin-type constant c_φ with φ*ω_E = c_φ ω_f (RS-06 link).
  - Needed by: `ER.7/the-pushforward-and-its-hypotheses`, `ER.7/rational-combination-for-L-E-2`.

### PadicHodgeRegulators — P-adic regulators and the local K₃ calculation

- **PadicHodgeRegulators:D.2**, from the ER.8 part: Expose the finite local étale regulator and Bloch–Kato logarithm on the weight-two elliptic motivic classes supplied to D.5, with their H_dR¹ target, base change and cup/trace identification; this is the actual z in (1-p^(-2)Φ)z, not an arbitrary vector declared to be a regulator.
  - Needed by: `ER.8/elliptic-syntomic-etale-factor`.
- **PadicHodgeRegulators:D.5**, from the parent packet: The degree-two syntomic regulator of a smooth proper curve with good reduction and its comparison with the explicit symbol formula, with pullback/pushforward.
  - Needed by: `ER.8/the-syntomic-comparison`.
  - Status: Refined by the ER.8 part's D.5 request.
- **PadicHodgeRegulators:D.5**, from the ER.8 part: Expose the weight-two regulator K2(X)^(2) tensor Q to H_syn²(E,K(2)), its identified H_dR¹ vector, cup/trace normalisation and the Coleman symbol formula for smooth proper good-reduction curves. Give the full two-coordinate regulator (or a reconstruction algorithm) used for pairing with a Frobenius eigenvector; a holomorphic pairing alone is insufficient. Import ColemanIntegration:L1 for the integration step, addressing the missing supplier edge in RT-AREA-ktheory-2/11. Specialise the étale comparison to reg_syn=(1-p^(-2)Φ)log_BK reg_et in these conventions.
  - Needed by: `ER.8/good-reduction-elliptic-pairing`, `ER.8/elliptic-syntomic-etale-factor`, `ER.8/weight-two-padic-beilinson-conjecture`.

### PeriodsAndSpecialValues — Periods, motivic L-values and special-value conjectures

- **PeriodsAndSpecialValues:PS.1**, from the ER.7 part: SS 2.2.0–2.3 and Shimura 1977 pp.212–214 Theorems 1–2 plus the two-prime remark (read): even auxiliary χ of unrestricted conductor, excluding 1 and ωπ⁻¹, with all conjugate L(π⊗χ,1) nonzero; exact Shimura–Blasius algebraicity of L(π,2)L(π⊗χ,1)/L(ωπχ,2) in c⁺(π)L′(π̌,0)·Qbar, tracking all embeddings, Gauss sums and arithmetic functional equations. Merel’s conductor-dividing-N corollary alone does not prove the finite-exception exclusion. The factor 2πi belongs to the regulator integral in SS 1.3.2 and 5.2, not to the L-value quotient in 2.3.
  - Needed by: `ER.7/regulator-period-inclusion`, `ER.7/regulator-nonvanishing-after-level-change`.

### SchemeKTheoryOperations — K-theory of schemes, localisation and operations

- **SchemeKTheoryOperations:S.3**, from the parent packet: On a regular two-dimensional scheme, the composite of the residue maps K_2(F) → ⊕_D k(D)^× → ⊕_x ℤ is zero (the Gersten/Kato complex in low degrees); routed to ER.6 by RS-18.
  - Needed by: `ER.6/potentially-good-reduction-integrality`.
  - Status: Answered on the supplier side. SchemeKTheoryOperations' packet supplies this composite as `SchemeKTheoryOperations:S.4/residue-composite-vanishes`, and proposes the link S.4 → ER.6 so that the prerequisite can cite that node. The ER.6 part's descent proof also needs its E.6 request.

### tauceti:TauCetiRoadmap/AlgebraicCurves

- **tauceti:TauCetiRoadmap/AlgebraicCurves#layer-12-the-dictionary--function-fields--curves-and-the-comparison-contracts**, from the parent packet: The function-field/curve dictionary on whose complex points ER.1 works (RS-18 link).
  - Needed by: `ER.1/complex-uniformisation`.

### tauceti:TauCetiRoadmap/AlgebraicTopology

- **tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent**, from the ER.1 part: Integral singular homology of the two-torus from the product/cellular maps, with the two projected coordinate loops as its basis and naturality under integral matrices. Transport through the real-linear period-coordinate homeomorphism and the R12.1 uniformisation. The old deck-group H1 alias is replaced by this actual map-level homology input; no general Hurewicz theorem is newly planned in ER.1.
  - Needed by: `ER.1/oriented-regulator-period-data`.
- **tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality**, from the ER.1 part: The integral oriented intersection pairing on the two-torus, with the two positive coordinate loops having intersection +1 and compatibility under orientation-preserving and orientation-reversing maps. C6 supplies its elliptic/integration specialization.
  - Needed by: `ER.1/oriented-regulator-period-data`.

### tauceti:TauCetiRoadmap/ArithmeticDirichletSeries

- **tauceti:TauCetiRoadmap/ArithmeticDirichletSeries#layer-0-arithmetic-functions-on-nonzero-ideals**, from the parent packet: Dirichlet series indexed by the nonzero ideals of O_κ and their Euler products, for L(s, χ^{Gross}) = Σ_𝔞 χ^{Gross}(𝔞)N𝔞^{−s} and its non-vanishing at s = 2.
  - Needed by: `ER.5/the-L-value-theorem`, `ER.5/nonvanishing-and-what-is-not-claimed`.
  - Status: Obsolete. The ER.5 part uses the pinned Tau Ceti ideal L-series declarations (its second restructure entry).

### tauceti:TauCetiRoadmap/EllipticCurves

- **tauceti:TauCetiRoadmap/EllipticCurves#layer-0-the-function-field-places-and-divisors**, from the parent packet: Places, divisors and principal divisors of the function field of E, on which the diamond convolution and the modular-unit divisors on X1(11) = 11a3 are computed (RS-18 link).
  - Needed by: `ER.4/the-diamond-convolution`, `ER.4/the-regulator-of-the-corrected-classes`, `ER.8/the-integrality-worked-example`.
- **tauceti:TauCetiRoadmap/EllipticCurves#layer-1-isogenies-the-dual-the-invariant-differential-and-formal-groups-aec-ii2-iii46-iv**, from the parent packet: The invariant differential ω = dx/(2y + a₁x + a₃) of a Weierstrass curve with div ω = 0 and translation invariance (only the definition is at the pin: tauceti WeierstrassCurve.Affine.invariantDifferential).
  - Needed by: `ER.1/complex-uniformisation`.
- **tauceti:TauCetiRoadmap/EllipticCurves#layer-2-torsion-the-weil-pairing-and-the-tate-module-aec-iii68**, from the parent packet: Torsion points and the Weil pairing, for the classes built from torsion (RS-18 link).
  - Needed by: `ER.4/the-regulator-of-the-corrected-classes`, `ER.4/bloch-theorem-10-2-1`, `ER.8/the-CM-worked-example`, `ER.8/the-nonrational-torsion-example`.
- **tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1**, from the parent packet: The Hasse bound |a_2| ≤ 2√2, used to exclude a_2 = 3 in the proof of Lemme 99.
  - Needed by: `ER.7/nonvanishing-of-a-twisted-value`.
- **tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv**, from the ER.6 part: Consume, without replanning, the existing HasPotentialGoodReduction definition using a finite extension of a complete DVR fraction field and minimisation after base change, and its j-integrality criterion. Use good reduction to obtain a smooth proper regular model through E.6; the upstream equation layer does not itself construct that scheme. Needed for the local extension step and the j=0,1728 acceptance examples.
  - Needed by: `ER.6/potentially-good-integrality-by-local-descent`, `ER.6/integral-nonzero-bloch-class`.

### tauceti:TauCetiRoadmap/GlobalNumberFields

- **tauceti:TauCetiRoadmap/GlobalNumberFields#layer-10-archimedean-characters-infinity-types-and-cyclotomic-arithmetic**, from the parent packet: The algebraic infinity type of χ^{Gross} (type (1, 0) or (0, 1) at the complex place) and |χ^{Gross}(𝔭)| = N𝔭^{1/2}, which gives absolute convergence at s = 2; routed to ER.5 by RS-14.
  - Needed by: `ER.5/the-CM-setup-and-the-hecke-character`, `ER.5/nonvanishing-and-what-is-not-claimed`.
- **tauceti:TauCetiRoadmap/GlobalNumberFields#layer-10-archimedean-characters-infinity-types-and-cyclotomic-arithmetic**, from the ER.5 part: Import the algebraic infinity-type (0,1) in ψ((h))=h̄χ(h) for the chosen embedding and its ideal norm N(I)^(1/2). The opposite embedding conjugates this convention. This identifies the incoming CM weight used in the already-built ideal convergence/Euler APIs.
  - Needed by: `ER.5/cm-ideal-series-at-two`.
- **tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters**, from the parent packet: The carriers HeckeCharacter and RayClassCharacter with conductors and primitivity, for χ (a character of (O/fO)^×) and χ^{Gross}; routed to ER.5 by RS-14.
  - Needed by: `ER.5/the-CM-setup-and-the-hecke-character`, `ER.5/the-L-value-theorem`.
- **tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters**, from the ER.5 part: Import finite ray characters with exact conductor and zero extension, finite quotient cardinalities, reduction of units modulo a multiple ideal onto conductor units by CRT, and their conductor-primitivity interface. Keep the idelic character owner and its ideal-weight comparison; no generic conductor theory is planned here.
  - Needed by: `ER.5/primitive-gauss-normalization`, `ER.5/conductor-fiber-regulator-evaluation`.

### tauceti:TauCetiRoadmap/JacobianChallenge

- **tauceti:TauCetiRoadmap/JacobianChallenge#layer-f-abeljacobi-and-the-universal-property**, from the parent packet: The Abel–Jacobi map and the Jacobian of X1(N), in which the cuspidal divisor classes of the Manin–Drinfeld theorem live (RS-06 link).
  - Needed by: `ER.7/manin-drinfeld`.

### tauceti:TauCetiRoadmap/ModularForms

- **tauceti:TauCetiRoadmap/ModularForms#layer-0-diamond-operators-and-modular-forms-with-character-nebentypus**, from the parent packet: Diamond operators and forms with nebentypus on Γ1(N) (RS-14 link for ER.5; used by the character decomposition T ⊗ C = Π T^ψ in ER.7).
  - Needed by: `ER.7/rankin-selberg-integral`, `ER.5/the-CM-setup-and-the-hecke-character`.
- **tauceti:TauCetiRoadmap/ModularForms#layer-7-l-functions**, from the parent packet: L(f, s) and L(f, χ, s) of a newform of weight two for Γ1(N) with character, their Euler products and analytic continuation (owner of the modular L-function after RS-06); for ER.6 also the functional equation with conductor and gamma factor.
  - Needed by: `ER.7/dirichlet-series-convolution`, `ER.7/rankin-selberg-integral`, `ER.7/the-explicit-theorem-for-an-elliptic-curve`, `ER.6/the-beilinson-statement`.
- **tauceti:TauCetiRoadmap/ModularForms#layer-8-modular-symbols-the-integral-hecke-algebra-and-coefficient-fields**, from the parent packet: Manin symbols ξ(x) = {g_x0, g_x∞}, the Manin relations, generation of relative homology by Manin symbols, and the action of T_2 on Manin symbols (Merel's formula (3.134)).
  - Needed by: `ER.7/spanning-for-prime-level`, `ER.7/manin-cycle-and-its-boundary`, `ER.7/cycle-formula`, `ER.7/nonvanishing-of-a-twisted-value`.
- **tauceti:TauCetiRoadmap/ModularForms#layer-8-modular-symbols-the-integral-hecke-algebra-and-coefficient-fields**, from the ER.7 part: Use the existing modular-symbol period maps, parity injectivity and rational Hecke algebra. A ModularForms Part II adapter must supply Merel appendix Theorem A (§§1–3): its finite multiplicative Fourier expansion for ξ_f(u,v)=−i∫_{g0}^{g∞}f(z)dz, exact conductor N′, the conditions m_{χ,S},m_{ψχ,Sbar}|N′, Euler corrections P_p,Q_p, partial Atkin–Lehner pseudo-eigenvalues and completed Mellin values. Include the parity argument of Corollary 2 and the first-linear/index-normalized Petersson conversion of Theorem C. The prime-level specializations must use the corrected E15/E16/E17 statements and locate the sign and factor-four errors analytically before claiming proof closure.
  - Needed by: `ER.7/nonvanishing-of-a-twisted-value`, `ER.7/rational-combination-for-L-E-2`, `ER.7/prime-level-L-value-formula`.

### tauceti:TauCetiRoadmap/StableReduction

- **tauceti:TauCetiRoadmap/StableReduction#layer-5-regular-and-minimal-models**, from the parent packet: The minimal regular model of an elliptic curve and the Kodaira types of its fibres; for potentially good reduction the fibre components are genus-0 curves forming a tree; routed to ER.6 by RS-18.
  - Needed by: `ER.6/potentially-good-reduction-integrality`, `ER.6/the-regulator-on-the-integral-part`, `ER.7/the-pushforward-and-its-hypotheses`.

### WeilConjectures — Weil conjectures and cohomological zeta functions

- **WeilConjectures:WC.5**, from the parent packet: The bound |a_ℓ(f)| ≤ 2√ℓ for weight-two newforms (point counts on the reductions, via Eichler–Shimura), used to show T_ℓ − 1 − ℓ⟨ℓ⟩ is an isogeny in the proof of Manin–Drinfeld.
  - Needed by: `ER.7/manin-drinfeld`.

### Requests filed with this roadmap

No packet of another roadmap files a request with this roadmap or cites one of its nodes or layers as a prerequisite. The one request with an ER supplier is internal: the ER.6 part asks ER.2 for the Betti ℚ-structure (above, under EllipticRegulators). No node supplies it yet. It is the one internal request this document leaves open; the Assembly note on `ER.2/the-deligne-cohomology-target` records it.

## Structural proposals

The packets record 18 proposals: 12 in the parent packet and 6 in the parts. Each is given as its packet records it, with a status line.

### ER.1 keeps only the lattice-choice specialisation (RS-06)

*ownership, rescope; from the parent packet; roadmaps: EllipticRegulators, ModularCurvesPartII.* RS-06 made ModularCurvesPartII:R12.1 the owner of the complex uniformisation, the converse Weierstrass construction, homothety and the invariant-differential/Weil-pairing comparison, and linked R12.1 → ER.1. The packet planned all of it again in ER.1/complex-uniformisation. Added by REV-EllipticRegulators.

**Proposal.** ER.1/complex-uniformisation becomes the normalised uniformisation η : E(C) ≅ C/(Z + τZ) of an oriented basis, importing R12.1; its planet is removed. The ER.1 stage text should say that the uniformisation is imported from R12.1.

**Status.** Applied in the packets and settled by RS-06 (accepted). The ER.1 stage text should still say that the uniformisation is imported from R12.1.

### ER.2 specialises P.5's η and M.8's Deligne complex

*ownership, rescope; from the parent packet; roadmaps: EllipticRegulators, MotivicEtaleKTheory, Polylogarithms.* Confirmed findings RT-AREA-ktheory-2/7 and /24 and the accepted Polylogarithms review: P.5 owns η(f, g) with its Steinberg, residue and period statements; the real Deligne complex is an early part of M.8. The packet planned both in ER.2. Added by REV-EllipticRegulators.

**Proposal.** Amend the ER.2 stage text: 'Import the real Deligne complex and its exact sequence from M.8 and the form η(f, g) with its differential identity, Steinberg relation and residues from Polylogarithms P.5; compute the elliptic target H²_D(E_R, R(2)) ≅ H¹(E(C), R(1))⁻ with its dimension [F : Q] and normalisation; construct the source's regulator (Brunault (1.27)) and fix its factor by Brunault's Proposition 67 (r_Beil = 2 r_E) and M.8's comparison.'

**Status.** Applied in the packets, following RT-AREA-ktheory-2/7 and /24. The stage-text amendment awaits the maintainer, and the early M.8 prefix does not exist yet.

### ER.3's stage text conflates Bloch's J_q with its Bernoulli regularisation

*stage-text, rescope; from the parent packet; roadmaps: EllipticRegulators.* Bloch's J_q (8.1.4) needs no correction to converge and is not q-invariant (8.1.5); the q-invariant function is Zagier's J(q; x) = J_q(x) + (1/3) log²|q| B_3(log|x|/log|q|), whose Bernoulli term also appears in Bloch's Lemma 10.2.2. Brunault's complex function is 2R_ω(P, 0) = −conj(R_q). Added by REV-EllipticRegulators.

**Proposal.** Replace 'construct the regularised logarithmic companion J_q. Prove convergence, the Bernoulli-polynomial correction, invariance under z ↦ qz' by 'construct Bloch's companion J_q (8.1.4) with (8.1.5) and its well-definedness on divisors (Lemma 8.1.4), and the q-invariant regularisation J(q; x) with the Bernoulli term; prove invariance of the latter under z ↦ qz, inversion, conjugation and lattice-basis change (R_q ↦ R_q/(cτ̄ + d)). Pin Bloch's convention R_q = J + iD_q and record Brunault's 2R_ω(P, 0) = −conj(R_q).'

**Status.** A stage-text edit, awaiting the maintainer. The packets already follow it.

### Bloch's monograph is readable; Brunault is a second source

*note-source-boundary, rescope; from the parent packet; roadmaps: EllipticRegulators.* The packet's first restructure entry and first gap assume the scan cannot be read. It renders with pdftoppm; Lectures 8–10 were read for this review. Bloch defines R_q on K_2(ℂ(E)) by the divisor formula and never compares it with the integral ∫ log|f| ω ∧ ∂̄log|g|; that comparison (Brunault Propositions 17, 24, 26) is what fixes the factor ½ and the complex conjugation in ER.4. The packet's first structural note (name Brunault because the scan could not be read) is obsolete in its motivation but right in its conclusion for ER.4. Added by REV-EllipticRegulators.

**Proposal.** Keep Brunault as a permitted second source for ER.2–ER.4 (Propositions 17, 26, 67 are the bridge between Bloch's R_q and the Deligne regulator) and decompose ER.3–ER.5 from Bloch's Lectures 8–11. Name Brunault §§1.1–1.2 in the ER.4 stage text as the source of the comparison between Bloch's R_q and the regulator of ER.2.

**Status.** A note; applied. The ER.3–ER.5 parts read the public transcriptions of Bloch and the thesis.

### ER.5's stage text pins a false formula

*stage-text-correction, rescope; from the parent packet; roadmaps: EllipticRegulators.* The ER.5 stage text transcribes (11.2.4) faithfully from the scan as L(2, χ^Gross) = π|μ_κ|χ̂(ḡ)g/(iy²C⁴)·R_q(U) and pins the Fourier kernel exp(2πi(−aℓ+bk)/C) of (11.1.1). Two independent calculations (PARI's L(E,2) and the elliptic dilogarithm sums, for 32a2, 36a1, 49a1) show that with this kernel the correct formula is L(2, χ^Gross) = −πχ̂(ḡ)g/(iy²C⁴)·R_q(U): the factor |μ_κ| is spurious and the sign is reversed. With the kernel exp(2πi(aℓ−bk)/C) used in the proof of Lemma 11.1.7 the formula is L(2, χ^Gross) = πχ̂(ḡ)g/(iy²C⁴)·R_q(U). In addition the stage text writes S_{x̄χ(x)/C}; the scan has S_{xχ̄(x)/C}. Added by REV-EllipticRegulators.

**Proposal.** Replace the displayed formula and the kernel sentence of the ER.5 stage text by the corrected statement, add the hypothesis that every prime dividing g divides f (or sum U over x invertible modulo f), and cite EllipticRegulators/E1–E3.

**Status.** Awaiting the maintainer. The atlas stage text of ER.5 (`content/campaign/EllipticRegulators/README.md`) still displays the printed (11.2.4) and the printed kernel. The ER.5 part's first restructure entry gives the replacement: L(E, 2) = πΓ R_q(U)/(iy²C⁴) with the dual-first kernel and U indexed by W/μ. This entry cites 'EllipticRegulators/E1–E3' for the findings; they are E7–E9.

### Modular units: Siegel units are KatoEulerSystems:L0's

*ownership, rescope; from the parent packet; roadmaps: EllipticRegulators, KatoEulerSystems.* The reviewed audit records KatoEulerSystems:L0 (Siegel units, divisors, descent) and L1 (symbols of Siegel units) as duplicates of ER.7's modular units and modular-curve K2 classes. The packet did not address this. Added by REV-EllipticRegulators.

**Proposal.** KatoEulerSystems:L0 owns Siegel functions and units with q-expansions, divisors at cusps and Galois descent. ER.7 keeps the Manin–Drinfeld theorem, the C-linear units u_f of Brunault's Proposition 79 (with an API item identifying them with combinations of Siegel units), the membership of their symbols in K2 of the COMPLETE curve (Proposition 86) and the archimedean regulator. KatoEulerSystems:L1 keeps the étale/syntomic realisation on the open curves. Link KatoEulerSystems:L0 → EllipticRegulators:ER.7.

**Status.** Settled by RT-AREA-ktheory-2/6 and the ER.7 part's rescope. The document applies its consequence for the planets.

### ER.8's certificate and integrality examples are EllipticKTheory:E.8's

*ownership, rescope; from the parent packet; roadmaps: EllipticRegulators, EllipticKTheory.* EllipticKTheory:E.8 already has a certified symbol, a non-rational residue on 36a1 and an integrality test on 11a3 and on a curve with an I_4 fibre. Added by REV-EllipticRegulators.

**Proposal.** ER.8 imports those certificates by node id and adds only the regulator and L-value halves (the corrected ER.8 nodes do this).

**Status.** Applied: the ER.8 part imports the E.7 and E.8 certificates by node id.

### p-adic elliptic integrals are ColemanIntegration:L1's

*ownership, rescope; from the parent packet; roadmaps: EllipticRegulators, ColemanIntegration, PadicHodgeRegulators.* The audit records ColemanIntegration:L1 as owning the Coleman integrals of ER.8's second target. Added by REV-EllipticRegulators.

**Proposal.** ER.8 keeps only the elliptic specialisation of D.5's comparison, importing Coleman integration from ColemanIntegration:L1 and the p-adic L-function from ModularSymbolsPadicLFunctions:L2.

**Status.** Applied in the ER.8 part (RT-AREA-ktheory-2/11). Its D.5 request asks D.5 to import Coleman L1.

### ER.5 and ER.7 stage texts should classify their conclusions

*stage-text, rescope; from the parent packet; roadmaps: EllipticRegulators.* Revised from the packet's third note, whose classification of ER.7 was wrong: Théorème 1 is an analytic identity with no K2 class, Théorème 4 and 81 are explicit regulator identities for constructed classes on X1(N), and Théorème 5 is a spanning statement. The packet's structural note says ER.5 proves a statement of the first kind only. For E/ℚ the target is one-dimensional, Bloch's U is integral (potentially good reduction everywhere), and the corrected (11.2.4) is an explicit L-value relation for the line ℚ·U: a statement of the second kind. What ER.5 does not give is the injectivity half of the third. Added by REV-EllipticRegulators.

**Proposal.** ER.5: 'a constructed class with non-zero regulator and an explicit L-value identity (first kind)'. ER.7: 'explicit regulator identities for constructed modular-unit classes (first kind), spanning of the regulator target of X1(p) by such classes, and analytic formulas for L(E, 2); none is a statement of the third kind'. In the classification requested for the ER.5 and ER.7 stage texts, record ER.5 as kinds (1) and (2), and Brunault's Théorème 5 as the surjectivity half of (3) for X_1(p).

**Status.** A stage-text edit, awaiting the maintainer.

### M.8 must not take ER.2's identifications back

*ownership, rescope; from the parent packet; roadmaps: EllipticRegulators, MotivicEtaleKTheory.* ER.2 now imports the real Deligne complex from MotivicEtaleKTheory M.8 (RT-AREA-ktheory-2/24), and so does Polylogarithms P.5/regulator-induces-beilinson, on which ER.2's normalisation rests. M.8's stage text says 'R and ER provide the archimedean analytic identifications'. If M.8's blueprint cites ER.2 for them, the two roadmaps form a cycle. Added by REV-EllipticRegulators.

**Proposal.** Split the real Deligne complex and its exact sequence into an early part of M.8 that needs no ER input (as RT-AREA-ktheory-2/24 intends); the archimedean identifications that M.8 takes from ER come from ER.4-ER.7, which ER.2 does not depend on.

**Status.** Open: it waits for the split of M.8.

### RT-AREA-ktheory-2/7,18,24: early foundations before comparisons

*note-duplicate-boundary; from the parent packet.* Maintainer: split the requested early finite-Chern and real-Deligne interfaces from M.8’s late comparison work. Retain finite coefficients, naturality, products, twists and real conjugation; P.5 retains Goncharov’s concrete current complex and the comparison with generic Deligne cohomology. The packet requests record missing exports without introducing M.8→R.7 or M.8→D.2 cycles.

**Status.** A note for the maintainer; open.

### RT-AREA-ktheory-2/5–12: imports and retained elliptic work

*note-duplicate-boundary; from the parent packet.* CM.1/CM.4, C5/C6, Kato L0 and an early L1 symbol interface are the suppliers. ER.2 retains elliptic dimensions, embeddings/conjugation, period normalization and torsion lifts; P.5 supplies the generic η-form. ER.5 retains Bloch’s explicit U/Fourier/Hecke specialization. ER.6’s potential-good-reduction integrality is a legitimate application of E.6, not a duplicate to delete. R29.6, ER.5, Coleman L1 and modular-symbol L1/L2 imports already existed and are retained with their hypotheses. Schappacher source gaps remain open.

**Status.** A record of how the red-team findings were handled; applied.

### rescope: EllipticRegulators, ComplexComparisonPartII, PeriodsAndSpecialValues

*rescope; from the ER.1 part; roadmaps: EllipticRegulators, ComplexComparisonPartII, PeriodsAndSpecialValues.* Confirmed finding RT-AREA-ktheory-2/8 assigns general comparison and the elliptic Hodge/period computation to C5/C6. The parent periods-and-the-comparison-isomorphism node mixes imported comparison with period choice and records a deck-group/singular-homology gap.

**Proposal.** Keep C5 as the general comparison owner and C6 as its elliptic Hodge-line/integral-period computation. ER.1 consumes both through the prerequisites and requests of this packet, retaining chosen oriented bases, q, conjugation and regulator-normalized periods. PS.0 must point its elliptic comparison-matrix acceptance test to the same C6 calculation. During assembly replace the parent mixed comparison node’s imported-comparison and deck-group alias portions by these supplier contracts. No source, data or other packet is edited by this job.

**Status.** Applied in this document by the Assembly note on `ER.1/periods-and-the-comparison-isomorphism`. PeriodsAndSpecialValues PS.0's acceptance test should point to C6; that roadmap has no packet yet.

### rescope: MotivicEtaleKTheory, Polylogarithms, EllipticRegulators

*rescope; from the ER.2 part; roadmaps: MotivicEtaleKTheory, Polylogarithms, EllipticRegulators.* RT-AREA-ktheory-2/7 and /24: generic Deligne theory and Chern classes have one early owner; P.5 owns the general curve formula/current/comparison; ER.2 owns the elliptic embedding, dimension, period-coordinate and torsion specialisations. The whole current M.8 stage has late prerequisites, so adding it to ER.2 is unsafe.

**Proposal.** Split an early archimedean foundation from M.8, depending only on generic K-theory/Chern classes, analytic sheaf/derived constructions and Betti–de Rham theory. It constructs the smooth-variety real Deligne complex, products and universal regulator, with no ER, D.2, R.7, Selmer or Iwasawa input. Add early-foundation→P.5 and early-foundation→ER.2, and P.5→ER.2; retain these as named-node dependencies until the stage split is accepted. M.8 late comparison may consume ER.4–ER.7 but must not expect ER.2 to supply generic Deligne theory. ER.4 trace should import early M.8 norm compatibility. Do not edit M.8 or ER.4 from this one-stage job.

**Status.** Awaiting the maintainer; it is the same split as the parent's tenth and eleventh entries.

### rescope: EllipticRegulators, AdditiveCombinatorics

*rescope; from the ER.4 part; roadmaps: EllipticRegulators, AdditiveCombinatorics.* Apply RT-AREA-combinatorics/14 to ER.4: arbitrary finite-abelian Fourier theory has exactly one owner, AC.0. The accepted parent already narrows its Fourier node; this follow-up preserves that decision.

**Proposal.** AC.0 → EllipticRegulators:ER.4. Import AC.0/fourier-transform, /fourier-parseval and /fourier-nconv. The existing AlgebraicCodingTheory Layer 3, ModularForms Layer 0, ZMod.dft and haarProb comparisons belong to AC.0, not a second ER.4 theory.

**Status.** Settled by RS-03 (accepted); the link AC.0 → ER.4 is in `data/restructure/RS-03.result.json`.

### Import CM theory and correct the Bloch specialization

*rescope; from the ER.5 part; roadmaps: EllipticRegulators, ComplexMultiplicationAndExplicitReciprocity.* RT-AREA-ktheory-2/5: CM.1 and CM.4 are the owners of the action, character, conductor and Frobenius identities. RS-14 generic links do not replace these imports. The accepted parent already records E7/E8/E9; this part supplies their proof and preserves owner boundaries.

**Proposal.** Add CM.1→ER.5 and CM.4→ER.5, and retain CM.2→ER.5 for torsion descent. ER.5 keeps only the maximal-order, class-number-one E/ℚ specialization C=fg, primitive finite character/Gauss normalization, U and its regulator. Replace stage (11.2.4) by L(E,2)=πΓ/(iy²C⁴)R_q(U), with H dual-first and U indexed by W/μ. Unit indexing requires primes(g)⊆primes(f). Keep K₂ integrality in ER.6 and generation as an unproved conjecture. State the real-structure compatibility needed for the natural conjugation action on the chosen Bloch model; arbitrary twists require their transported action.

**Status.** Applied in the packets. The replacement of the ER.5 stage text awaits the maintainer, as in the parent's fifth entry.

### Replace the ideal-series request by its pinned library result

*rescope; from the ER.5 part; roadmaps: EllipticRegulators.* The reviewed ER.5 audit and actual Tau Ceti source contain the ideal carrier, norm regrouping and nonvanishing theorem. The parent’s ArithmeticDirichletSeries request and its natural-number Euler near miss are obsolete for this target.

**Proposal.** Use TauCeti.MultiplicativeIdealWeight, LSeries_normCoeff, norm_idealTerm, summable_absNorm_rpow_ideal_iff and LSeries_ne_zero_of_summable_idealTerm. Do not add an ideal Euler-product node. RS-14 Mathlib Dirichlet and modular nebentypus links are generic adjacent contracts, not prerequisites for the CM regulator example; their uses in ER.7 remain outside this scope.

**Status.** Applied in the ER.5 part. The parent's ArithmeticDirichletSeries layer-0 request is obsolete.

### rescope: EllipticRegulators, KatoEulerSystems

*rescope; from the ER.7 part; roadmaps: EllipticRegulators, KatoEulerSystems.* RT-AREA-ktheory-2/6: modular units and generic pair-symbol theory were duplicated; whole L1 or late M.8 dependencies can introduce irrelevant or cyclic prerequisites.

**Proposal.** KatoEulerSystems:L0 is sole owner of Siegel units, cusp divisors, good-base integrality and algebraic descent; add L0→EllipticRegulators:ER.7. Keep generic pair-symbol construction in an accepted early L1 prefix and import its concrete nodes without Iwasawa prerequisites. ER.7 retains Manin–Drinfeld, character-specific compactness, regulator/Rankin–Selberg, vertical K2 integrality and pushforward/nonvanishing. Generic M.8 regulators require a separately accepted early prefix; no new stage id is fabricated. On assembly remove the inherited modular-unit and generic pair-symbol planets from ER.7, retaining Explicit Beilinson theorem, Rankin–Selberg integral, Manin–Drinfeld theorem and L(E,2) from geodesic periods, and add the two new planets Beilinson subspace and Integral Beilinson subspace. The combined layer has six planets.

**Status.** The ownership is settled by RT-AREA-ktheory-2/6. This document shows the six planets the entry asks for; the parent packet still marks the two removed planets (see the handoff note).

## Dependencies between the layers

Within the roadmap, the nodes of each layer use the nodes of these other layers. The graph of nodes of all nine packets is acyclic, also through every node of every other packet that it reaches.

- **ER.1** uses no other layer.
- **ER.2** uses ER.1.
- **ER.3** uses ER.1, ER.2.
- **ER.4** uses ER.2, ER.3.
- **ER.5** uses ER.1, ER.4.
- **ER.6** uses ER.2, ER.5.
- **ER.7** uses ER.2, ER.3, ER.4, ER.6.
- **ER.8** uses ER.1, ER.2, ER.3, ER.4, ER.5, ER.6, ER.7.

The atlas requirements of each layer:

- **ER.1** requires `EllipticKTheory:E.1`, `UPSTREAM:EllipticFunctions`.
- **ER.2** requires `EllipticKTheory:E.5`, `EllipticRegulators:ER.1`, `Polylogarithms:P.2`.
- **ER.3** requires `EllipticRegulators:ER.2`.
- **ER.4** requires `EllipticKTheory:E.7`, `EllipticRegulators:ER.3`.
- **ER.5** requires `DirichletPadicLFunctions:L0`, `EllipticRegulators:ER.4`.
- **ER.6** requires `EllipticKTheory:E.6`, `EllipticRegulators:ER.5`.
- **ER.7** requires `EllipticCurveModularity:R29.6`, `EllipticKTheory:E.6`, `EllipticKTheory:E.7`, `EllipticRegulators:ER.4`, `ModularCurvesPartII:R14.6`.
- **ER.8** requires `EllipticRegulators:ER.4`, `PadicHodgeRegulators:D.5`.

**Node edges that the atlas does not draw.** 10 node prerequisites run to a layer that is not upstream of the consumer in the atlas stage graph:

- `ER.8/the-CM-worked-example` uses `ER.5/the-class-U`.
- `ER.8/the-CM-worked-example` uses `ER.5/the-L-value-theorem`.
- `ER.8/the-integrality-worked-example` uses `ER.7/the-X1-11-example`.
- `ER.8/the-integrality-worked-example` uses `ER.6/the-vertical-step-that-is-required`.
- `ER.8/the-conductor-14-example` uses `ER.7/symbols-of-modular-units-in-K2`.
- `ER.7/modular-elliptic-regulator-line` uses `ER.6/the-beilinson-statement`.
- `ER.8/cm36-full-torsion-certificate` uses `ER.5/the-class-U`.
- `ER.8/cm36-corrected-l-value` uses `ER.5/the-CM-setup-and-the-hecke-character`.
- `ER.8/cm36-corrected-l-value` uses `ER.5/the-L-value-theorem`.
- `ER.8/cm36-corrected-l-value` uses `ER.5/fourier-transform-on-O-mod-C`.

None of them closes a cycle. ER.8 has no consumer inside the roadmap, and no ER.6 node uses ER.7. They are not drawn because promotion turns only prerequisites in another roadmap into stage links (`scripts/blueprints.py`): a prerequisite in the same roadmap adds no edge. The ER.8 part's red-team disposition says its direct ER.5 imports "give the requested ER.5 -> ER.8 ... edges under promotion". That holds for the E.6 → ER.8 edge but not for ER.5 → ER.8. For the atlas to show these dependencies, the maintainer should add the declared stage edges ER.5 → ER.8, ER.6 → ER.8, ER.7 → ER.8 and ER.6 → ER.7. RT-AREA-ktheory-2/10 asks for the first.

**Cross-part references.** Every prerequisite of a part that points into the parent packet names an existing node id: 90 references from the eight parts. The ER.5 part also cites 3 ER.4-part nodes, and the ER.8 part cites 4 ER.1-part and 5 ER.2-part nodes. The parent packet never refers to the parts. The parts' new proofs of three parent nodes are not yet cited by those nodes: `ER.3/fourier-and-kronecker-eisenstein`, `ER.3/steinberg-relation-on-the-projective-line` and `ER.4/bloch-theorem-10-2-1`. Each edge is acyclic and is listed in the handoff note for a job that owns the packets.

## What this blueprint does not claim

- **Generation.** No constructed class is claimed to generate K₂(E) ⊗ ℚ or its integral part. Bloch's Conjecture 11.2.4 and the rank statement of Beilinson's conjecture (ER.6) are recorded as conjectures. ER.5 gives a nonzero class with an explicit L-value relation for one line, and ER.7 gives Schappacher–Scholl's rational structure and determinant formula on the subspace of modular-unit classes. Neither gives injectivity of the regulator on the whole integral part.
- **Integrality from unramifiedness.** A class that is unramified on the generic fibre is not claimed integral without the vertical step. That step is supplied for potentially good reduction everywhere (ER.6) and for modular-unit classes on modular curves (ER.7). The genus-one example of ER.6 shows that it can fail.
- **Normalisation of the universal regulator.** The regulator is pinned to Brunault's and Beilinson's normalisations (r_Beil = 2r_E). Its identification with the universal Chern–Deligne regulator waits for the early part of MotivicEtaleKTheory M.8, and statements that need it (ER.6's nonzero universal regulator of U) are conditional on it.
- **Analytic inputs.** The functional equation of L(E, s) is imported for E/ℚ from EllipticCurveModularity R29.6 and is a hypothesis over other number fields. The Green kernel of a compact Riemann surface is GrossZagierAndArithmeticHeights GZ.2's. Kronecker's limit formulas, the Rankin–Selberg unfolding and the Petersson conversions carry the analytic adapters recorded in the ER.7 part's gap G6.
- **Numerics.** The decimal values in the examples are diagnostics, not proofs. The X₁(11) sign (gap G4), the one-point identity on 36a1 (the ER.8 part's second gap) and the corrections E15–E17 to Merel's appendix are checked numerically. They still need an exact or certified argument.
- **The p-adic conjecture.** The weight-two p-adic Beilinson conjecture of ER.8 is stated as a predicate on supplied maps, not proved. No p-adic statement enters ER.5.
- **Formalisation.** Nothing here is formalised. The suggested Lean file names the objects and states signatures, API items and unit tests with proofs left open, and it records as comments what the pinned libraries cannot express.
