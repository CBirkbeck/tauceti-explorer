# RT-PAPER-SHANKAR-SHANKAR-TANG-ETAL-22

Codex · `codex-rtOQ9t` · 1 October 2026 · complete. Refs #4242.

The audit read all 49 pages of the [published paper](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/C60FC9A4F852F9138CF1ACD020F215D9/S2050508622000142a.pdf/exceptional-jumps-of-picard-ranks-of-reductions-of-k3-surfaces-over-number-fields.pdf) and all 97 extracted items. It reports five findings: four high under the protocol's false-statement criterion and one medium for limited proof slips. These do not refute the main Picard-rank-jump theorem.

| Finding | Severity | Affected material |
| --- | --- | --- |
| 1 | High | /40–/41: dyadic reduction exponent |
| 2 | High | /66: finite part of the Green function |
| 3 | Medium | /56, /68: cutoffs and missing norm shell |
| 4 | High | /4: Gamma/Pochhammer domain |
| 5 | High | /93: Picard versus numerical divisor classes |

## Finding 1

The extracted dyadic reduction formula is false because s_i counts Jordan blocks rather than their total rank. Rank-two blocks occur at 2; the odd-prime formulas do not expose the error.

Published p.16 defines s_i as the “size of S_i” and Lemma 4.2(2) uses p^(r−s_0) for the bad-to-good multiplicity. Items /40 and /41 repeat both. Hanke 2004, printed p.360, instead defines s_i=Σ_{j∈S_i} dim(Q_j). Take Q(a,b,c,d,t)=ab+cd+2t², L=U⊕U⊕⟨4⟩, rank r=5 and signature (3,2). This is maximal: its discriminant quadratic module is Z/4 with q(j)=j²/8 mod Z, whose only isotropic element is zero. At 2 there are two rank-two blocks of exponent 0 and one unary block of exponent 1, so the printed s_0 is 2 whereas the rank sum is 4. For m=2, n=1, bad solutions modulo 4 have a,b,c,d even and t odd: exactly 32. Q′=2ab+2cd+t² has 16 good norm-1 solutions modulo 2. The printed formula predicts 2^(5−2)·16=128; the corrected formula gives 2^(5−4)·16=32. Exhaustive enumeration also gives 640 versus 320 at n=2 (printed prediction 2560, corrected 640). The published page image confirms the definition and exponent; E1–E6 do not register it.

**Fix.** Replace s_i=#S_i by s_i=Σ_{j:ν_j=i} rank(L_j) in /40 and carry that convention through /41 and every dyadic consumer and route brief. Preserve the formulas after this replacement; for odd p the two conventions coincide. Add a sourceIssues error at p.16, affecting Lemma 4.2 as stated, with Hanke p.360 as the correct original source. Include the U⊕U⊕⟨4⟩ counts as a regression example. This does not refute the main Picard-jump theorem.

## Finding 2

The exact regularized Green-function decomposition drops a nonzero finite Laurent term when it replaces a holomorphic Gamma factor by its value at the pole. Its limit alone does not justify the equality in (5.8)–(5.9).

Published p.24 (5.3), p.25 (5.4) and p.28 (5.8)–(5.9), also item /66. Put k=1+b/2 and A(s)=2Γ(k−1+s)/Γ(k+2s). Write the series in (5.3) at parameter k/2+s as S(s), so φ_m(x,k/2+s)=A(s)S(s), A(0)=4/b and Res_{s=0}(AS)=−c(m). The printed tildeφ_m(x,0)+R_x(0,m) is FP(A(0)S), whereas φ_m(x)=FP(AS). Their difference is A′(0)Res(S)=−c(m)[ψ(k−1)−2ψ(k)], with ψ=Γ′/Γ. For b=4 this is c(m)(2−γ), nonzero for represented m. A compatible maximal example is U²⊕A₂, and m=1 is represented. The page images verify all factors and the residue sign. None of E1–E6 treats this regularization correction.

**Fix.** Keep the definitions of tildeφ and R, and replace the exact identity by φ_m(x)=tildeφ_m(x,0)+R_x(0,m)−c(m)[ψ(k−1)−2ψ(k)]. Alternatively absorb this explicit scalar into a newly distinguished corrected R, updating every identity about R consistently. Add a sourceIssues error against (5.8)–(5.9), affecting that exact identity. Explain that the scalar is O(|c(m)|)=O(m^(b/2)), so Proposition 5.4 and the stated downstream asymptotic orders survive; do not withdraw the main theorem. Use the finite-part product rule as the regression check.

## Finding 3

Two printed lattice-counting proof slips remain unregistered. Item /68 repeats a count without its norm-shell constraint, making that count infinite; the source weight construction for /56 has the wrong sign on the negative plane and insufficient positive-plane support.

Published p.31, first display, and /68 omit Q(λ)=1 from #{√mλ∈L: |Q(λ_x)|≤1}; all neighboring sums retain it. For any rank-(b+2) lattice with b≥3 this unconstrained strip contains infinitely many lattice points. Projection to the two-dimensional negative plane either has a nonzero lattice kernel (use its multiples), or has a nondiscrete rank-(b+2) image, hence infinitely many points near zero. Corollary 4.12 bounds only the norm shell. Published p.22, proof of Corollary 4.12, requires ω_P≥1 for Q(λ_x)<T although Q is negative definite on P: this demands ω_P≥1 everywhere and cannot give the claimed compact support. Also, on Q(λ)=1 with −Q(λ_x)≤T≤1, Q(λ_{x⊥})=1−Q(λ_x) ranges up to 2, but the printed positive-plane cutoff is only ≥1 up to 1 and vanishes at 2. Images at pp.22 and 31 confirm these slips; existing E4–E5 cover other errors, not these.

**Fix.** Restore Q(λ)=1 in /68 and the reader count. For /56 retain the correct theorem and supply cutoffs with ω_P≥1 on −Q≤T, vanishing for −Q≥2T, and ω_{P⊥}≥1 on Q≤2, vanishing for Q≥3. Smooth nonnegative bounded cutoffs then majorize the required shell; the singular integral is still O(T). Add separate sourceIssues misprints for the omitted shell and the cutoff signs/radii, affects:the proof, and link their corrected forms to /56 and /68. Preserve the theorem conclusions.

## Finding 4

The unguarded Gamma quotient for the Pochhammer symbol is not the cited pinned-library identity. At nonpositive integral parameters Mathlib totalizes Gamma to zero, whereas ascPochhammer is a polynomial.

Item /4 writes (a)_n=Γ(a+n)/Γ(a) without a parameter restriction; published p.24 introduces this for complex parameters. At Mathlib 082e2d3, RingTheory/Polynomial/Pochhammer.lean:51–60 defines ascPochhammer 0=1 and ascPochhammer 1=X. Analysis/SpecialFunctions/Gamma/Basic.lean:340–344 proves Complex.Gamma_zero and Gamma_neg_nat_eq_zero. Thus a=0,n=0 gives 1 on the polynomial side but 0/0=0 on the totalized quotient side. The actual theorem Complex.Gamma_add_nat_div_Gamma_eq, Gamma/Beta.lean:460–461, explicitly assumes ∀k:ℕ, a≠−k. OrdinaryHypergeometric.lean:66–82 uses polynomial coefficients, with totalized division; existence of these definitions does not remove the analytic parameter guards.

**Fix.** Define (a)_n by ascPochhammer for all a; state the Gamma-quotient equality only for a outside the nonpositive integers (or explicitly as meromorphic continuation with removable values restored). For the classical analytic series distinguish c outside the nonpositive integers from Mathlib’s totalized definition. Cite the guarded pinned theorem and show that the parameters actually used near k/2 satisfy the guards. Retain status:library for the correctly scoped primitives and add the p.24 source-domain diagnostic. Test a=0,n=0 and a=−1,n=1; these concern the general interface, not failure of the paper’s positive-real-part application.

## Finding 5

The extraction generalizes the K3 application of Hodge index to the full Picard group of every smooth projective surface. For a general surface the nondegenerate form is on real numerical divisor classes, not on its full Picard group.

Item /93 states the signature (1,ρ−1) on Pic for a smooth projective surface. Published p.44 applies this only to a K3 surface, where the first Chern map is a primitive embedding. Counterexample to the extracted generalization: over C take X=E×P¹ with E an elliptic curve and choose a nontorsion M∈Pic⁰(E). The nontrivial nontorsion class pr_E^*M has zero first Chern class, hence zero intersection with every divisor, and survives in Pic(X)⊗R. The form there has a nonzero radical and does not have the asserted nondegenerate signature. SF.5 is the correct Hodge-index owner; this is a statement-domain error, not a reason to create another roadmap.

**Fix.** State the general theorem on N¹(X)_R (or NS(X)⊗R with the standard identification) and describe the radical when starting from Pic(X)⊗R. Then specialize to the K3 setting using Pic⁰=0 and the primitive first-Chern embedding already in /92. Keep planned:SchemeAndStackFoundations:SF.5. Record this as an extraction correction, not as an error in the published K3 argument; add E×P¹ with a nontorsion degree-zero line bundle as a domain test.

## Reproduce the dyadic check

[Hanke, printed p.360](https://www.jonhanke.com/Hanke--all_papers__as_of_2015-01-14/explicit-bounds-paper.pdf) uses the sum of block dimensions. This standalone Python enumeration uses the definitions of good and bad type, with no asymptotic approximation:

```python
from itertools import product
for n in (1, 2):
    big, small = 2 ** (n + 1), 2 ** n
    bad = sum(
        (a*b + c*d + 2*t*t - 2) % big == 0
        for a, b, c, d, t in product(range(big), repeat=5)
        if a % 2 == b % 2 == c % 2 == d % 2 == 0 and t % 2 == 1
    )
    good = sum(
        (2*a*b + 2*c*d + t*t - 1) % small == 0
        for a, b, c, d, t in product(range(small), repeat=5)
        if t % 2 == 1
    )
    print(n, bad, good, 2**3 * good, 2**1 * good)
```

Output (n, actual bad, actual good, printed prediction, corrected prediction):

```text
1 32 16 128 32
2 640 320 2560 640
```

## Finite-part check

If `S(s)=r/s+d+O(s)` and `A(s)=A0+A1*s+O(s²)`, then
`FP(A*S)=A0*d+A1*r`, while `FP(A0*S)=A0*d`. Here
`A0*r=−c(m)` and `A1/A0=ψ(k−1)−2ψ(k)`. The correction therefore has the sign stated in finding 2. At `k=3`, `ψ(2)=1−γ` and `ψ(3)=3/2−γ`, so the difference is `c(m)(2−γ)`.

## Coverage and ownership

All nine routes and 24 prerequisite records were read. The 89 missing items are routed once each. The four planned items have existing owners; finding 5 corrects the domain of one of them. All 15 library declarations were read at Mathlib `082e2d3` / Tau Ceti `f790474`; finding 4 is the precise boundary mismatch.

The atlas was assembled at `eb71205cf585f26a2839210167cd1644a051b50c` (2,907 stages, 8,322 stage edges). The reviewed coverage and owner scopes listed in the JSON were read. The orthogonal/K3 candidate names deliberately reuse Charles-16, and the higher-dimensional height proposal extends the curve-level Gross–Zagier scope. No new ownership finding is asserted. Cross-roadmap density definitions still require a common normalization at blueprint time.

Current Protocol §16 leaves proof closure of imported supplier results and detailed definition APIs to the consuming blueprint. This audit does not treat that later work as missing extraction content. Existing E1–E6 were checked against their main-paper passages and are not repackaged as new findings. Their external repair proofs were not fully re-audited.

## Versions and correction search

The main source is the published Cambridge PDF, SHA-256 `0a9acca79ad2b0e8edd124e6fbcf53ded700ddfc5a348417ed0ff0dda07cc3c5`. Hanke is the author-hosted published copy, SHA-256 `1d574638d2a2f72fffc222ae67aaf4c40d729d958837b3b23489e19cabd2a335`, read at pp.354–360. Published page images confirmed the reported signs and domains at pp.16,22,24,25,28,31.

On 1 October 2026 the search checked the [arXiv history](https://arxiv.org/abs/1909.07473), [Tang's publications](https://math.berkeley.edu/~ytang/), [Tayou's publications](https://math.dartmouth.edu/~stayou/), Cambridge's indexed article record and published PDF, Crossref metadata and title/author correction searches. No correction to these passages was located. The failed Cambridge HTML open was not substituted for reading the published PDF. The source hashes and target hashes are retained in the JSON; transient downloads need not be retained.

## Validation and limits

The red-team checker and intake file checker passed (two files, zero problems); the staged whitespace check is run before committing. The finite count above was executed. No Lean file is part of this job and no Lean compiler, Lake build/cache or language server was run. The entire transitive source literature has not been certified. An independent verifier should check the findings before they become fixes.
