# Fixes to the Calegari–Dimitrov–Tang extraction

Job: `FIX-RT-PAPER-CALEGARI-DIMITROV-TANG-25`, [issue #5529](https://github.com/CBirkbeck/tauceti-explorer/issues/5529). Worker: Codex, session `codex-rtOQ9t`; 2026-10-01. All six confirmed findings are applied. Independent fix review is pending.

Inputs are the accepted extraction and reader, the red-team result and reader, and its independent verification in `RT-PAPER-CALEGARI-DIMITROV-TANG-25.review.json`. The verifier's corrected sign-subgroup example takes precedence over the original example. This changes only this report and the two paper deliverables; it changes no atlas base or other owner's packet.

## Finding 1: retain the scalar Eisenstein denominator

The general `eisenstein-theorem` now gives positive integers c,M and, for t=x^{1/N}, c·y∈Z̄[[t/M]]. Equivalently c·y(Mt) has algebraic-integral coefficients. If y(0) is integral, variable scaling by cM absorbs the scalar in positive degrees: a_n(cM)^n=c^{n−1}(c a_nM^n) for n≥1. The constant term is unchanged by substitution. Thus the variable-only result has exactly the integral-constant hypothesis it needs.

The constant algebraic series y=1/2 is the negative test: no variable scaling makes its constant coefficient integral, whereas c=2 does. The normalized inverse branch on published p.637 has constant term zero. Its original `inverse-series-denominators` statement is retained and its note identifies this legitimate specialization. Route 2, layer 1, and the reader distinguish the general and normalized contracts. This was an extraction overgeneralization; no new source issue is attributed to the paper.

## Finding 2: distinguish geometric and linear level

`wohlfahrt-theorem`, its prerequisite description, and route 1, layer 1, now require E={±I}⊆G when concluding Γ(N)⊆G from the geometric cusp-width level N. For a congruence group without that assumption the conclusion is Γ(N)⊆⟨G,−I⟩. The published p.659 application already includes E and remains intact. This is also an extraction correction, not a new source error.

The negative example is H′={γ∈Γ(2):a≡1 mod4}. Because b,c are even, a(γγ′)≡aa′ mod4; the determinant gives d≡a mod4. H′ is a subgroup containing Γ(4), excluding −I, with ±H′=Γ(2). Its projective cusp widths are those of Γ(2), all 2, but Γ(2)⊈H′. For any conjugate of T² its diagonal entries are 1 modulo 2 and exactly one of the signs lies in H′; a conjugate of T cannot lie in Γ(2) modulo 2. This justifies the geometric level 2.

The originally proposed Γ(2)∩Γ₁(4) has the additional c≡0 mod4 condition. It does not have ±H=Γ(2): U²=(1,0;2,1) is excluded from both signs. The independent verification corrected this example, and the fixes use H′ consistently.

## Finding 3: theta has a character

`jacobi-hypergeometric-theta` retains the hypergeometric identity, integer coefficients and transcendence conclusion. θ₃² has weight one on Γ(2) with χ(γ)=χ_{−4}(d), equal to 1 for d≡1 mod4 and −1 for d≡3 mod4. Its trivial-character kernel is H′={γ∈Γ(2):d≡1 mod4}. Since a≡d mod4, this is the subgroup above. Restriction to the smaller Γ(2)∩Γ₁(4) is also valid, but that subgroup is not the full character kernel.

The scalar `modular-forms-finite-index` definition remains a trivial-character definition. Its note and route 1, layer 2, import the character convention rather than falsely treating θ₃² as a member of that space. At −I the weight-one slash operator multiplies θ₃² by −1; its constant coefficient 1 rules out trivial-character invariance.

At the Mathlib pin, `jacobiTheta_T_sq_smul` and `jacobiTheta_S_smul` in `Mathlib/NumberTheory/ModularForms/JacobiTheta/OneVariable.lean` give the generator laws. Squaring the S law gives weight-one multiplier −i; T² has multiplier 1. Therefore U²=S T⁻² S⁻¹ has multiplier 1 and −I has multiplier −1. These agree with χ_{−4}(d), which is multiplicative on Γ(2) because the off-diagonal product is divisible by 4.

QM.1 owns the theta multiplier conventions and upstream ModularForms Layer 0 owns character spaces as eigenspaces in the existing form space, including the −I parity condition. These imports follow their current descriptions and reviewed audit records. No competing bundled character-form type or library-status promotion is introduced.

New source issue E12 records the omitted character qualification at published (1.1.5), p.631, and (7.2.4), p.688; it affects the stated qualification. Version and correction-search evidence accompanies the record.

## Finding 4: identify the actual component system and missing bridge

`vvmf-connection` now constructs the rank-n complex analytic local system L_ρ from ρ restricted to Γ(2)/{±I}=π₁(Y(2)), and its associated flat bundle, with x=λ/16 and Y(2)=P¹∖{0,1/16,∞}. This quotient of H×C^n by the deck action is correctly typed over C; no free integral module is asserted.

For the scalar component f_j, its continuation space W_j is the complex span of its branches. By the weight-zero transformation law it has dimension at most n, possibly smaller, and zero for the zero component. This system has its own continuation representation and must be separated from L_ρ. Forming a flat bundle from ρ does not prove that an arbitrary holomorphic F is horizontal. The selected germ must be related to the solution system by a separate theorem.

For F=1,ρ=1, all six translates coincide. The component system has rank one and equation df/dx=0, not rank six. The unsupported rank-6n/integral-free and automatic irreducibility assertions are removed from the active construction and Theorem 7.3.3 proof note. The original statement is retained only in `sourceTarget` as source provenance.

The issue explicitly permits exact missing inputs in place of newly proving the bridge. Three `proofObligations` state their domain, required conclusion and owner:

1. A regular-singular algebraic differential module over C(x) whose solution system is the actual W_j and whose scalar germ is f_j, with the stated cusp singular locus, no extra genuine singularities, and compatibility with moderate growth and semisimple cusp action.
2. Arithmetic descent or an equation over Q̄(x), over Q(x) for a rational germ, after justified weight/denominator normalization. Its minimal module must match W_j and meet the growth and denominator hypotheses for a G-function. An arbitrary complex representation supplies none of this by itself.
3. An exact Chudnovsky/Bombieri–André/Katz supplier applied to that arithmetic operator, or a proved subquotient reduction retaining f_j, giving quasi-unipotent local monodromy. Inherited semisimplicity then gives finite cusp monodromy on the component system. No irreducibility is assumed and no conclusion about an invisible ambient summand follows.

The existing `NoncongruenceModularForms` owner carries these application-specific inputs. It imports complex ODE/local-system foundations from the existing conformal Part II, and general G-function results from DT.5 through route 4. This prevents duplication of those suppliers. The three candidate owners have no finished blueprint packet in the current checkout, so the precise statements and acceptance conditions are delivered in this extraction and route-1 brief for their design jobs. No new roadmap is needed. BG07/Gan14 remain paper references, not exact supplier contracts certified by this bounded fix.

Acceptance checks require F=1 to give rank one, zero to give rank zero, dependent components to permit smaller rank, and arithmetic descent to appear as a theorem rather than an integral-freeness assertion. New E13 records the p.690 source construction error affecting the proof. The componentwise Theorem 7.3.3 remains unchanged as a target. Neither that theorem nor the main scalar theorem is claimed false or newly proved.

## Finding 5: conclude on the effective span

The broad `def-7.3.1` statement is unchanged. The active `cor-7.3.4` concludes congruence kernel on V_F=span_C{F(τ)}; its full ambient conclusion additionally requires V_F=C^n, equivalently linearly independent component functions. The source's original unqualified conclusion is retained only as `sourceTarget`. Route 1's final target/application layer and the reader carry this qualification.

Once the component conclusions apply with their required bounded-denominator normalizations, intersect the finitely many component congruence groups. Every element fixes every F(τ), hence V_F. The value span is invariant by the transformation law. A linear functional vanishes on the value span exactly when it gives a linear relation among component functions, proving the stated equivalence.

The explicit nonzero counterexample is σ(S)=diag(1,−1), σ(R)=(2,1;−7,−3), for the presentation PSL₂(Z)=⟨S,R | S²=R³=1⟩. The relations hold, and σ(T)=σ(SR)=(2,1;7,3) has trace 5, determinant −1 and distinct eigenvalues (5±√29)/2. Its positive eigenvalue is greater than 1, hence T has infinite order, while remaining semisimple. Then ρ=1⊕σ and F=(1,0,0) are a weight-zero pair with integral coefficients. They meet the broad definition, but ρ has infinite image. V_F is the one-dimensional trivial summand. The representation factors through PSL₂, so −I causes no parity problem.

New E14 records the source's missing spanning hypothesis at Corollary 7.3.4, p.691, with Definition 7.3.1's published locus. It affects that ambient stated conclusion, not the preserved component theorem.

## Finding 6: phase and logarithm in the quotient proof

New E15 records the missing factor G(0)/|G(0)| in both the radius-r reconstruction and (2.3.2), p.640. The boundary log|G| reconstructs modulus and needs this constant phase for a complex identity. Alternatively state equality of absolute values. G=g=i with B=1 has boundary logarithm zero, so the two exponentials give 1 while G=i. Multiplying by i repairs the identity without changing any subsequent norm bound.

New E16 records the omitted logarithm on the left of the first bound on p.641: use sup_D log|h|, not sup_D|h|. The constant case g=h=1 rejects the printed inequality 1≤0 and satisfies the corrected 0≤0. Both are local proof misprints with no effect on the intended statement. The `lemma-2.3.1` statement and the entire normalized `herglotz-log` item with g(0)=1 are unchanged; its note and routes 2 and 3 direct readers to the corrected proof guidance.

## Versions, ownership and validation

Fresh bounded reading used the actual [published JAMS author offprint](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), 76 pages (journal pp.627–702), SHA-256 `867026fbcc5592728173e5c4d6a87f58d57a55b0d0d8b0109b9774e84290ee1e`, downloaded 2026-10-01. Read pp.630–631,637–641,652–653,659,688–691,695 and inspected images 640,641,690,691. The earlier full readings and selected v4 comparisons remain historical provenance, not a fresh full or v4-PDF reading.

The [arXiv version listing](https://arxiv.org/abs/2109.09040) still ends at v4, 16 September 2024. The [first author's research page](https://www.math.uchicago.edu/~fcale/research.html) links the unchanged published offprint. Fresh [Crossref metadata](https://api.crossref.org/works/10.1090/jams/1053) has no update-to entry and an empty relation object. Bounded exact-title/author correction and erratum searches found none applicable. These are limited searches, not proof that no correction exists. No author was contacted.

Read current QM.1, DT.5 and upstream ModularForms Layer 0 descriptions, matching reviewed AUDIT-15/AUDIT-07 records, and the pinned theta declarations. Baseline pins remain Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`; pinned statements were read with git show rather than relying on another worker's mutable checkout. Classification remains 148 items: 14 library, 5 planned, 129 missing. All nine route memberships remain unchanged and every missing item is routed once. All eleven old source records, including their review objects, remain unchanged; E12–E16 await independent fix review.

Passed `scripts/check_paper.py`, `research/blueprint/intake.py check-files` on all three deliverables, shared source-issue/version checks, preservation/routing checks, exact scalar and finite-matrix counterexample checks, and `git diff --check`. These verify the repairs and structural invariants; they do not prove the explicitly missing regular-singular/arithmetic bridge. No Lean artifact is required or compiled.
