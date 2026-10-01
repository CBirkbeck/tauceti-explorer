# FIX-RT-PAPER-DELIGNE-74

Complete fix by Codex, session codex-J6LwjP, 2026-10-01, for [issue #5536](https://github.com/CBirkbeck/tauceti-explorer/issues/5536). Read the full red-team result and verified verdicts; all five findings are confirmed. Only the three authorized deliverables are changed.

## /1 — projective-line count in the Euler-product bound

**Fixed.** /s3-3.8-euler-product-convergence now uses NΣ_(n≥1)(q^n+1)q^(−n(1+ε)), the sum of the two convergent geometric series NΣq^(−nε) and NΣq^(−n(1+ε)). /s3-3.8-closed-point-count retains A¹’s q^n count and adds P¹’s q^n+1 count, which applies to the given open U₀⊂P¹. The dependency and route-2 explanation are synchronized. The original H¹_c(U,ℱ) and convergence radius q^(−β/2−1) are preserved. This implements existing E16, without another source-issue entry.

The proposed regression test uses F₂ and the degree-two puncture X²+X+1: 0,1,∞ remain. At ε=5 their contribution is 3/64>1/31, the old one-series bound. The new two-series upper bound is 1/31+1/63>3/64. Exact Fraction arithmetic verified both inequalities.

## /2 — actual similitude fibers and geometric Frobenius

**Fixed.** 6.10–6.13 consistently use d for the fixed odd geometric dimension of the pencil fibers, not the symplectic quotient’s rank, and a∈Ẑ for arithmetic degree. Both H and CSp_a have μ(g)=q^(−da). The locus Z_a is det(g−δ^a I)=0 in that torsor; proper-algebraic-zero-locus measure and Fubini are applied to these actual fibers of H₁→Ẑ. Unit powers extend continuously in a finite coefficient extension. The zero-rank eigenvalue case is empty and immediate; the symplectic argument concerns the nonzero quotient.

Geometric F_x has a=−deg(x), as in §1.15. In 6.13 apply 6.12 to δ_j^(-1), so (δ_j^(-1))^a=δ_j^deg(x). The geometric multiplier is q^(d·deg(x)); constant-field degree congruences remain in the Chebotarev input. This implements E8 and preserves E9’s β_j→δ_j correction. Exact checks use d=3,a=1,q=2 (multiplier 1/8, not 1/2) and degrees 1–4 for the inverse-unit/sign identity. They check the corrected contracts, not the full Haar-null theorem.

## /3 — early P¹ computation before Weil I

**Fixed.** /s7-H1-P1-constant-vanishes is planned at EtaleDualityAndPerverseSheaves:EDC.4. Its statement records the projective-bundle specialization over an algebraically closed field with ℓ≠p: H⁰=Q_ℓ, H¹=0, H²=Q_ℓ(−1) and zero other degrees; constant finite-dimensional coefficients follow by tensoring. Finite-field descent gives geometric Frobenius 1 and q on the nonzero degrees. The note no longer defers the owner/order decision to an assembler. Both DWP.4 and DWP.6 import this early calculation.

Read the actual EDC.4 projective-bundle contract and DWP.4/5/6 descriptions plus reviewed EDC.4/DWP.4 audit rows. Fresh assembly has 2,956 actual stages and 8,546 unique edges between them (8,622 total unique edge records include 76 touching external proxies). The actual graph is acyclic. EDC.4→DWP.4 and EDC.4→DWP.6 exist, as does DWP.4→DWP.5→DWP.6; no reverse DWP.6→DWP.4 edge is introduced. No campaign/data files are edited.

## /4 — one shared GOS owner

**Fixed.** Removed the general /s8-GOS-formula item from FF.2’s route. Its statement explicitly keeps the smooth projective connected curve C, genus g, finite geometric boundary D, U=C∖D, lisse finite-rank E_λ coefficients and ℓ≠p, with χ_c(U,ℱ)=rank(ℱ)(2−2g−|D|)−Σ Sw_x(ℱ). FF.2 keeps /s8-8.11-euler-characteristic, the Artin–Schreier application giving χ_c(A¹,ℱ_j)=1−d, and imports the general theorem. Route 5’s R01.3 Swan-conductor computation is preserved.

Read the confirmed RT-AREA-finitefields/3 and verifier, and the existing FiniteFieldsAndCharacterSums packet’s EDC.2 request, gap and rescope proposal. No registered EDC.2:euler-characteristic stage supplies that requested theorem. Route 6 therefore expresses the **same outstanding request** as an explicit section-16 Part II registration brief, EtaleDualityAndPerverseSheavesPartIICurveEulerCharacteristic, in the parent’s étale-duality direction. It requires coordination with the existing proposed substage: integrate at that parent layer or register the successor, with exactly one theorem owner. Neither proposed endpoint is asserted already planned. The brief names inputs EDC.2 and the equal-characteristic local conductor, the exact formula, Raynaud’s source and coefficient/compact-support proof obligations, and exports to FF.2 and the proposed Kloosterman consumer. It does not create a competing GOS construction in FF.2 or edit another job’s packet.

The five source routes now contain 41 missing items (3,4,13,19,2); route 6 contains the one missing general supplier. All 42 missing items occur exactly once. A proposed-edge simulation EDC.2→GOS, R01.3→GOS and GOS→FF.2 remains acyclic; this is a simulation, not stage registration. The maintainer/design job must answer and register the shared request before a consumer marks the theorem planned.

## /5 — purity implies the trace bound

**Fixed.** The Ramanujan–Petersson item now presents the proof direction: geometric eigenspace purity gives both root moduli, and α+β=a_p with the triangle inequality gives the trace bound. Removed the claim that trace and determinant identities alone prove equivalence. No extra normalized-reality/Hecke-adjoint equivalence lemma is claimed.

The proposed negative test is α=2ir, β=−ir/2, ε=1 and r>0. Then αβ=r² and |α+β|=3r/2≤2r, but the roots have moduli 2r and r/2. Exact rational arithmetic on the coefficients of i confirms the product and trace inequality. This refutes only the generic linear-algebra converse, not Deligne’s theorem.

## Evidence, limits and validation

On 2026-10-01 reacquired [Deligne, Weil I, Numdam published scan](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), 36 PDF pages (cover plus pp. 273–307), SHA-256 `8392b345d4854e6dc55fb42cfc0b616d941935983723627237239a87348f42e5`, matching the extraction/red-team record. Read rendered pp. 279, 286, 295, 297–298, 300, 302 and 306; OCR alone was not trusted for the formulas. Earlier whole-paper reads remain attributed to their authors.

Also read [Raynaud, Bourbaki 286](https://www.numdam.org/article/SB_1964-1966__9__129_0.pdf), text pp. 129–133 and the rendered theorem/formulas on p. 133: Part I Theorem 1 and formula (2 ter), with χ(U)=2−2g−|D|. Twenty PDF pages; SHA-256 `fd0cf10b653f40e43f2ef7211fed427b7c5c80022c42bedecbf1544b050baa40`. This is the finite-torsion/Grothendieck-group statement; the full proof and passage to ℓ-adic compact-support cohomology were not read or claimed proved. They are explicit blueprint obligations in the shared supplier brief.

- Paper checker passed.
- Three-file intake passed: three files, zero problems.
- Independent structural check: 208 unique item IDs; 165 planned / 1 library / 42 missing; every missing item routed once; all explicit prerequisites resolve and the eight-edge item prerequisite graph is acyclic. Every planned/source stage endpoint resolves in the assembled atlas.
- All 16 sourceIssues are unchanged, including E8, E16 and the rejected E5. All item IDs/statuses are preserved; the P¹ planned-stage assignment and GOS route are corrected as above.
- Actual-stage and proposed-import DAG checks and exact counterexample/sign regressions passed; `git diff --check` passed.
- No new library credit, Lean deliverable, compilation, library build or language server. Mathematical supplier statements remain planning contracts, not formalizations.
