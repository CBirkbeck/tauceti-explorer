# FIX-RT-PAPER-SHANKAR-SHANKAR-TANG-ETAL-22

Codex · `codex-J6LwjP` · 2 October 2026. Refs [#5525](https://github.com/CBirkbeck/tauceti-explorer/issues/5525).
All five confirmed findings are applied to the extraction, route briefs and reader. This is a fix submission, not an
independent review verdict. The 97 original IDs and their statuses (4 library, 4 planned, 89 missing), nine routes,
24 prerequisites and six original reviewed source issues are retained. E7–E11 are five additions awaiting review.

## Finding 1: total Jordan ranks

Items /40–/41 now define s_i=Σ_{j:ν_j=i}rank(L_j). The cardinality and density formulas are retained with this
convention. The Corollary 4.3, stabilization, local-term and general density consumers (/42,/43,/46,/47), GN.3 route
and heights import state the same convention. At odd primes all blocks have rank one, so no formula changes there.
E7 records the published p.16 error affecting Lemma 4.2; [Hanke's original p.360](https://www.jonhanke.com/Hanke--all_papers__as_of_2015-01-14/explicit-bounds-paper.pdf)
explicitly uses the sum of block dimensions. With maximality, s_2=0 and Hanke's multiplicity p^(s_1+s_2) is p^(r−s_0).

The independently rerun U⊕U⊕⟨4⟩ example has Q=ab+cd+2t², rank five and signature (3,2). Its discriminant quadratic
module Z/4 has q(j)=j²/8 mod Z and no nonzero isotropic element, so this is a maximal lattice. At 2, s_0=4,s_1=1
and Q′=2ab+2cd+t². For m=2:

| n | Actual bad modulo 2^(n+1) | Actual good modulo 2^n | Printed block-count prediction | Corrected rank-sum prediction |
| --- | --- | --- | --- | --- |
| 1 | 32 | 16 | 128 | 32 |
| 2 | 640 | 320 | 2560 | 640 |

Both cardinality and normalized density identities pass. The reproducer already in the red-team report was rerun;
it need not be duplicated in an authorized deliverable. This corrects the local interface without refuting the headline theorem.

## Finding 2: finite Laurent term

Item /66 retains the definitions of φ̃ and R, including the original R integral identity, and now states
φ_m(x)=φ̃_m(x,0)+R_x(0,m)−c(m)[ψ(k−1)−2ψ(k)], ψ=Γ′/Γ. The name, Proposition 5.4 (/69), consumer notes
(/59,/67,/70,/71), heights brief and reader follow this exact identity. E8 records the error in published (5.8)–(5.9), p.28.

At s=k/2+u, the full prefactor is A(u)=2Γ(k−1+u)/Γ(k+2u), A(0)=4/b. For S(u)=r/u+d+O(u),
FP(AS)=A(0)d+A′(0)r, whereas FP(A(0)S)=A(0)d. The residue relation A(0)r=−c(m) gives the displayed correction,
since A′(0)/A(0)=ψ(k−1)−2ψ(k). At b=4,k=3, ψ(2)=1−γ and ψ(3)=3/2−γ give c(m)(2−γ).
Replacing a varying holomorphic factor by its limit before taking the finite part is therefore invalid here.

For fixed b the added scalar is O(|c(m)|)=O(m^{b/2}). Proposition 5.5 still bounds the **original** R; Proposition 5.6
still bounds φ̃. Their combination proves the same Proposition 5.4 and downstream asymptotic orders. No definition of R
is silently changed, and no main theorem is withdrawn. The earlier E1 proof repair remains separate and required.

## Finding 3: shell and cutoff proof slips

Item /68 now retains Q(λ)=1 in #{√mλ∈L : Q(λ)=1, |Q(λ_x)|≤1}; the reader and brief state it. E9 records the omitted
shell in the first display of published p.31 as a misprint affecting the proof, not the proposition's conclusion.
Without the shell, projection of a rank b+2≥5 lattice to the two-dimensional negative plane has a nonzero kernel or
nondiscrete image, hence infinitely many strip points. With it, Q(λ_{x⊥})=1−Q(λ_x)≤2, and the region is compact.

Item /56 retains Corollary 4.12 and supplies smooth nonnegative cutoffs bounded by 2:
ω_P≥1 on −Q≤T, zero on −Q≥2T; ω_{P⊥}≥1 on Q≤2, zero on Q≥3. Standard smooth radial bumps provide these.
On the normalized norm-one shell and T≤1 the positive norm is ≤2, so the product majorizes the target. Its shell
support lies in Ω_{≤2T}, and μ_∞(Q,ω)≤4μ_∞(Ω_{≤2T})=O_Q(T) by Lemma 4.11. The singular integral order and
error dependence on T are retained. E10 separately records both printed sign/radius slips on p.22 as proof misprints.
At the boundary T=1,−Q(λ_x)=1,Q(λ_{x⊥})=2 both corrected factors are ≥1; the printed second factor would be zero.

## Finding 4: Gamma/Pochhammer guards

Item /4 remains library for the correctly scoped primitives. It defines (a)_n by `(ascPochhammer C n).eval a` for every a,
and applies `Complex.Gamma_add_nat_div_Gamma_eq` only when ∀j∈N,a≠−j. Classical analytic ₂F₁ requires c outside
nonpositive integers; Mathlib's formal-series coefficients use totalized inverses at all parameters. The guarded identity
and totalization theorems were actually read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`:

- `ascPochhammer`, `ascPochhammer_zero`, `ascPochhammer_one`: RingTheory/Polynomial/Pochhammer.lean:51–60;
- `ordinaryHypergeometricCoefficient`, `ordinaryHypergeometricSeries`, `ordinaryHypergeometric`: Analysis/SpecialFunctions/OrdinaryHypergeometric.lean:66–82;
- `Complex.Gamma_zero`, `Gamma_neg_nat_eq_zero`: Gamma/Basic.lean:340–344;
- `Complex.Gamma_add_nat_div_Gamma_eq`: Gamma/Beta.lean:460–461 (including its explicit guard).

At a=0,n=0 the polynomial is 1 and the totalized quotient is 0; at a=−1,n=1 they are −1 and 0.
For the actual (5.3) application, with k≥5/2, s=k/2+u and |u|≤1/2, the hypergeometric parameters have
Re(k−1+u)≥1, Re(1+u)≥1/2 and Re(k+2u)≥3/2. Thus all guards hold, both initially and near regularization.
The /59 consumer, heights brief and reader carry this distinction.

E11 records the p.24 missing general domain/convention as a diagnostic (`gap`, affects `nothing`). This does not call
standard meromorphic continuation false or allege failure of the paper's positive-real-part use. Its purpose is to stop
an unrestricted pointwise Gamma quotient from being bound to the totalized library definition.

## Finding 5: numerical divisor classes

Item /93 states the general Hodge index theorem on N¹(X)_R≅NS(X)⊗R, nondegenerate of signature (1,ρ−1).
On Pic(X)⊗R the radical is the kernel of the numerical quotient. Item /92 and the K3 brief specialize using Pic⁰=0
and the primitive first-Chern embedding already supplied by the paper. The reviewed library audit and actual SF.5
contract were read; SF.5 remains the existing owner. No new roadmap or packet is invented.

For X=E×P¹, choose a nontorsion M∈Pic⁰(E). Its pullback is nonzero (a section retracts the projection) and remains
nonzero after tensoring with R, but c_1=0 and every intersection is zero. The numerical basis E×{pt},{pt}×P¹ has
matrix [[0,1],[1,0]], with signature (1,1); the pullback gives a radical direction before quotienting. This detects the
former overgeneralization. The published p.44 applies Hodge index only to the K3 case and is correct: **no source erratum**
is attributed to it. [Brosnan's author-written UMD notes, §3.3](https://math.umd.edu/~pbrosnan/notes/Surfaces/shit.html),
Corollary 3.14/Theorem 3.15, were read as a supplementary scope check; full supplier proof closure remains SF.5's work.

## Sources, correction search and validation

Read/downloaded 2 October 2026, exact URLs and hashes in `sourceVersions`:

- Published Cambridge version of record, DOI 10.1017/fmp.2022.14, 49 pages, SHA-256
  `42f6c8cb2b2c25f8531d407db641d3ff4334949146edb5cc1b96e9830303cf32`: targeted pp.15–16,21–22,24–25,27–31,44;
  rendered checks pp.16,22,24,25,28,31,44. Cambridge stamps downloads, so this byte hash differs from earlier readings.
- Hanke's author-hosted published copy, 38 pages, SHA-256 `1d574638d2a2f72fffc222ae67aaf4c40d729d958837b3b23489e19cabd2a335`:
  printed p.360 and its image; no full supplier audit.
- arXiv v3, 47 pages, SHA-256 `37adf1c13e7aa3945e41d323b1137b68481c8391de8c1f88e2a48784b5e73680`: targeted
  counterpart passages pp.15,21,23,27,29,42; not a full collation.
- Tang's currently linked author copy, 48 pages, SHA-256 `5b8895a14b27e5c7a858ed78fa33b2804d5d5c491af9364afac595c5367618d2`:
  targeted rank/cutoff/Gamma/decomposition/shell passages pp.15,21,23,27,29; not a full collation.

The bounded correction search checked indexed journal records and the downloaded published text, arXiv history (latest
v3, 29 August 2022), Tang's Berkeley and Tayou's Dartmouth publication pages, the currently linked author text, and title/
author erratum searches. No matching correction was located. The direct Cambridge HTML opening failed; no full journal
errata-list reading or universal absence-of-errata claim is made. The reported findings rest on the version of record.

Paper schema, source-version checks, intake checks for the three deliverables and whitespace checks pass. Structural
regressions preserve every original ID/status, all 24 prerequisites, nine route item lists and original E1–E6 records;
all unaffected item records remain unchanged after parsing. Each of 89 missing items is routed once, and no own
review verdict is added. Mathematical checks include exhaustive dyadic enumeration at n=1,2 (with normalized densities),
120 exact Laurent coefficient products, 2,144 rational cutoff-shell boundary cases, Gamma boundary values and parameter
bounds, and the product-surface intersection matrix. These test correction interfaces, not the main classification proof.

No Lean deliverable is authorized and no pinned compiled build is available; no Lean compilation, Lake build/cache or
language server was run. This targeted fix is not a new full-paper reading or a complete transitive supplier-proof audit.
All five correction deliverables are complete; implementation and source proof closure remain the owning blueprints' work.
