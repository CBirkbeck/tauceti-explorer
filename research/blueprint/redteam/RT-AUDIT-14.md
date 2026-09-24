# RT-AUDIT-14: independent attack on AUDIT-14

Agent: Codex — codex-c83e7a. Issue: #1578. Read date: 2026-09-24. Status: complete.

Rechecked all 169 targets, 411 citation occurrences and 119 ownership overlaps. Found two false mathematical statements (Tate convergence and the Habiro product basis), one omitted existing matrix formula, and one minor continuity-description error. The broad partial/absent classifications remain appropriate; no additional owner conflict was established.

The reviewed input is `research/blueprint/audit/AUDIT-14.result.json` at `f74afabf1583b51e9cf5e3240c91fe9e864b3ecb` (unchanged from the claim snapshot). This report proposes corrections; it does not edit the accepted audit or certify new Lean implementations. Finding numbers use zero-based target indices.

## Findings

### RT-AUDIT-14/1 — Tate convergence must carry the quasi-character exponent (high)

**Location:** research/blueprint/audit/AUDIT-14.result.json — AutomorphicLFunctionsAndLocalFactors:AL.1, targets[0].target (zero-based).

The local Tate integral is asserted to converge for Re(s)>0 for an arbitrary quasi-character χ. Its convergence half-plane depends on the real exponent of χ; the assertion is false without a unitary hypothesis or a shift.

**Evidence.** Tate, Fourier Analysis in Number Fields and Hecke's Zeta-Functions (1950), §2.3 and Definition 2.4.1/Lemma 2.4.1, printed pp. 2.07, 2.09–2.10 (PDF pp. 14, 16–17), https://sites.math.rutgers.edu/~alexk/2023S572/Tate1950.pdf, read 2026-09-24: the integral is “defined for all quasi-characters of exponent greater than 0”. If |χ(x)|=|x|^a, χ(x)|x|^s has exponent a+Re(s). Counterexample: F_v=Q_p, f=1_{Z_p}, χ(x)=|x|_p^(-1), s=1, and vol(Z_p^×)=1. Each annulus p^m Z_p^×, m≥0, contributes 1, so the integral diverges although Re(s)>0.

**Correction.** Replace the convergence clause by Re(s)+a(χ)>0, explicitly defining |χ(x)|=|x|^a(χ), or restrict this particular assertion to unitary χ and treat norm twists separately. Retain the partial verdict and the existing archimedean ingredients. Propagate the corrected target into integrated coverage through the audit-fix intake.

### RT-AUDIT-14/2 — The inverse-transpose characteristic polynomial is already available (medium)

**Location:** research/blueprint/audit/AUDIT-14.result.json — AutomorphicLFunctionsAndLocalFactors:AL.4, targets[1].note and declarations.

The assertion that no characteristic-polynomial formula for the contragredient exists misses two pinned Mathlib theorems. They already give the formula for the inverse transpose of an invertible matrix. This does not supply the still-missing Satake comparison or tensor-product formula.

**Evidence.** Mathlib at 082e2d37e8b0463410cdb532e111cd43d5a66174: Matrix.charpoly_inv, Mathlib/LinearAlgebra/Matrix/Charpoly/Coeff.lean:314, states A⁻¹.charpoly = (-1)^Fintype.card n * C A.det⁻¹ʳ * A.charpolyRev under h : IsUnit A. Matrix.charpoly_transpose, Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean:167, states (Mᵀ).charpoly = M.charpoly. Statements, ambient CommRing/Fintype/DecidableEq hypotheses and proofs were read. Applying the second theorem to A⁻¹ gives the contragredient matrix formula immediately. Pinned links: https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Matrix/Charpoly/Coeff.lean#L314 and https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean#L167 .

**Correction.** Add both declarations as existing linear-algebra ingredients, with IsUnit A explicit, and replace the claimed absence of the contragredient formula by its inverse-transpose construction. Keep the compound target partial; separately retain the unbuilt tensor-product formula and the identification with actual Satake parameters.

### RT-AUDIT-14/3 — GSWZ finite support belongs to Pochhammer exponents (high)

**Location:** research/blueprint/audit/AUDIT-14.result.json — HabiroNahmSeries:HB.8, targets[0].target together with targets[2].target.

The audit defines c_{n,i} using individual factors (1-q^{i/2}x^n), then attributes finite i-support for those exponents to GSWZ Theorem 6. GSWZ uses infinite q-Pochhammer factors (q^i t^n;q)_∞. Removing the Pochhammer changes the exponents and makes the attributed finite-support conclusion false, already in rank one.

**Evidence.** Garoufalidis–Scholze–Wheeler–Zagier, The Habiro Ring of a Number Field, Definition 1.7 and equations (28)–(29), p. 12, and Theorem 6/equation (81), p. 24, https://guests.mpim-bonn.mpg.de/stavros/publications/habiro-ring-number-field.pdf, read 2026-09-24. Theorem 6 says “for fixed n all but finitely many i satisfy c_{n,i}=0” for the product of (q^i t^n;q)_∞. Set A=(1) in its displayed sum: [t]F_A=-q/(1-q). The audit's individual-factor product with finite i-support would instead give [t]F_A=-Σ_i c_{1,i}q^{i/2}, a finite Laurent polynomial in q^(1/2), which cannot equal -q/(1-q). Equation (29) has L_n(q)=Σ_i c_{n,i}q^i; the denominator 1-q comes from the Pochhammer itself.

**Correction.** Replace targets[0]'s product by ∏_{0≠n∈N^N}∏_{i∈Z}(q^i t^n;q)_∞^{c_{n,i}}, and specify the ambient formal series interpretation and lower-bounded i-support before admissibility. Identify these same c_{n,i} in targets[2], where Theorem 6 upgrades lower-bounded to finite support for F_A. If half-powers are deliberately retained, provide a change-of-variable convention without dropping the Pochhammer factors. Keep the current partial/absent library verdicts; this is a source-faithfulness correction.

### RT-AUDIT-14/4 — Continuous operators do not imply separate continuity (low)

**Location:** research/blueprint/audit/AUDIT-14.result.json — CompletedCohomologyPartII:CC.2, targets[4].note.

Calling ContRepresentation “separately continuous” overstates its group-variable requirement. The structure only requires each group element to act by a continuous linear operator; it does not require continuity in the group variable at all. The audit correctly rejects it as a proof of joint continuity, so this is a wording correction without a verdict change.

**Evidence.** Mathlib at 082e2d37e8b0463410cdb532e111cd43d5a66174, Mathlib/RepresentationTheory/Continuous/Basic.lean:46–57: the ambient variables assume [Monoid G] but no TopologicalSpace G, and ContRepresentation has the single field toMonoidHom : G →* V →L[R] V. Pinned declaration: https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Continuous/Basic.lean#L54 .

**Correction.** Replace both occurrences of “separately continuous” in this note by “a representation by continuous linear operators”, and say explicitly that group-variable continuity and joint continuity are additional requirements. Retain the absent verdict for the p-adic Banach representation construction.

For finding 1, the annuli are pairwise disjoint and multiplication by $p^m$ preserves multiplicative Haar measure. On every annulus the integrand is $|x|_p^{-1}|x|_p=1$. The partial integrals therefore equal $N+1$ on the first $N+1$ annuli. As a control, a unitary character gives absolute annular contributions $p^{-m\operatorname{Re}(s)}$, converging when $\operatorname{Re}(s)>0$. The defect is the omitted character shift, not a problem with Tate's theorem.

For finding 3, put $u=q^{1/2}$. Finite support in the audit's proposed exponents would make the linear coefficient an element of $\mathbb Z[u,u^{-1}]$. But $-u^2/(1-u^2)$ has a pole at $u=1$ and cannot be such a Laurent polynomial. Higher $t$-degree factors cannot alter this coefficient. By contrast, a single source factor $(qt;q)_\infty$ already has linear coefficient $-q/(1-q)$: infinitely many individual binomials are contained in one Pochhammer. This proves the contradiction without assuming a general q-binomial identity or identifying the entire rank-one series.

Finding 2 is limited to the matrix identity. In a finite basis the dual representation matrix is $(A^{-1})^T$. The two theorems compose to give its characteristic polynomial, and the audit already cites `Matrix.charpolyRev`. This does not manufacture an L-group, Satake parameter, tensor-product formula or compatibility theorem.

## Scope and method

- Independence: the accepted AUDIT-14 and REV-AUDIT-14 history was checked; neither was authored or reviewed by this session. Read the entire issue #1578 and the confirmed claim for Codex — codex-c83e7a.
- Read all five roadmap documents, the accepted AUDIT-14 result and REV-AUDIT-14, integrated library coverage and the matching atlas stage descriptions. The actual census is 41 layers and 169 targets: 108 absent, 54 partial, five mathlib and two both. The review's older 142-target wording was not used as the scope.
- Opened every one of the 411 citation occurrences (374 distinct declarations, 309 distinct source files) at Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369; compared actual statements, surrounding variables, structure fields and hypotheses with the claimed fit. Verified the cited file bytes against pinned GitHub tree blobs. Supplemented statements containing internal let-bindings and structure fields, rather than treating truncated declaration headers as statements.
- For absent targets and the missing parts of partial targets, ran 41 stage-specific alternate-name query groups against declarations.tsv first and then the complete pinned Lean source trees. Triaged substantive hits: finite-group induction versus local smooth induction, low-degree corestriction versus all degrees, ordinary versus q-Pochhammer, continuous duals over fields versus integral topological duality, classical modular forms versus adelic representations. The report records the queries and conclusions.
- Resolved and compared all 119 overlap records against the current descriptions of all 92 distinct cited owners, including the reviewed additions for Habiro, quadratic-form invariants, induction/restriction and modular forms. Checked current packets/decompositions, links and reserved IDs for conflicting scope. Planned owners were not treated as pinned library results.
- Read the public Tate thesis convergence statement and its exponent convention; checked the nonarchimedean annulus counterexample and the unitary-character control. Read both missing characteristic-polynomial theorems in their ambient sections.
- Read CGZ §7 (especially Theorems 7.1 and 7.5, the nonvanishing caveat, positive-definite rational A and distinguished solution) and GSWZ Definition 1.7, equations (28)–(31), Theorems 3–6, Lemma 2.6 and the finite-support proof. Checked the rank-one coefficient obstruction to the audit's product and the separation of analytic asymptotics, formal admissibility and integral Habiro membership.
- Refreshed all 634 repository inputs from the initial d44d12968fa9ee224afb96c3b48e93c6019a986b snapshot to f74afabf1583b51e9cf5e3240c91fe9e864b3ecb; no input changed. The two deliverables were absent when claimed. Only those two deliverables are submitted. This is a research audit; no Lean implementation or compilation is claimed.

### Target census

| Roadmap | Layers | Targets | absent | partial | mathlib | both |
|---|---:|---:|---:|---:|---:|---:|
| AutomorphicLFunctionsAndLocalFactors | 6 | 35 | 20 | 13 | 2 | 0 |
| AutomorphicSpectralTheory | 7 | 31 | 22 | 8 | 1 | 0 |
| CompletedCohomologyPartII | 9 | 36 | 18 | 16 | 1 | 1 |
| GL2AutomorphicRepresentationsAndTransfer | 12 | 40 | 30 | 10 | 0 | 0 |
| HabiroNahmSeries | 7 | 27 | 18 | 7 | 1 | 1 |

The earlier review mentions 142 targets, but its substantive Habiro checks and the current audit include 169. No omission finding is based on that stale count. All current targets, including the additional Habiro layers, were in this attack.

### Stage-by-stage conclusions and search probes

Each query below was run against the declaration index before the source files. Counts include textual matches and are not implementation counts. TODOs, author names, tests and unrelated uses were discarded. “Not found” describes this pinned search, not a proof that no possible composition of library tools could solve the problem.

#### AutomorphicLFunctionsAndLocalFactors:AL.0

Checked all 7 targets and 6 recorded overlaps. Real Schwartz/Fourier analysis and topological restricted products are ingredients; no adelic Schwartz–Bruhat, self-dual local measure or adelic Poisson package was found.

Alternate-name query: `Schwartz.?Bruhat|self.?dual.?[Mm]easure|Fourier.*[Aa]dele|[Pp]oisson.*[Aa]dele`. Index matches: 0; source-line matches: 0.

#### AutomorphicLFunctionsAndLocalFactors:AL.1

Checked all 7 targets and 7 recorded overlaps. Gamma and Dirichlet functional equations are actual special cases; they do not construct local quasi-character zeta integrals or general Hecke continuation. Finding 1 corrects the convergence target. Ideal weights are multiplicative ideal functions, not local quasi-characters.

Alternate-name query: `Tate.?[Zz]eta|[Zz]eta.?[Ii]ntegral|[Ll]ocal.?[Ee]psilon|[Hh]ecke.?[Cc]haracter`. Index matches: 0; source-line matches: 3.

#### AutomorphicLFunctionsAndLocalFactors:AL.2

Checked all 6 targets and 3 recorded overlaps. Matrix integration and algebraic representations do not supply Godement–Jacquet, Satake classes or local standard factors.

Alternate-name query: `Godement|Jacquet|Satake|[Ss]tandard.?[Ll][Ff]actor`. Index matches: 0; source-line matches: 0.

#### AutomorphicLFunctionsAndLocalFactors:AL.3

Checked all 6 targets and 3 recorded overlaps. Algebraic induction, tensor products and intertwining maps do not provide Whittaker/Kirillov models or their analytic integrals. Projective.tensorProduct concerns projective modules.

Alternate-name query: `Whittaker|Kirillov|Bernstein.?Zelevinsky|Rankin.?Selberg|[Pp]rojective.?[Tt]ensor|[Cc]ompleted.?[Tt]ensor`. Index matches: 1; source-line matches: 2.

#### AutomorphicLFunctionsAndLocalFactors:AL.4

Checked all 4 targets and 3 recorded overlaps. Existing determinant, conjugacy, direct-sum and base-change APIs remain usable. Finding 2 adds inverse-transpose characteristic polynomials; Satake and the compound Euler-product comparisons remain missing.

Alternate-name query: `charpoly_inv|charpoly_transpose|charpoly.*[Tt]ensor|charpoly.*[Kk]ronecker|[Aa]rtin.?[Ff]actor|[Ss]ymmetric.?[Pp]ower.*[Ll][Ff]unction`. Index matches: 2; source-line matches: 3.

#### AutomorphicLFunctionsAndLocalFactors:AL.5

Checked all 5 targets and 5 recorded overlaps. Classical special-value ingredients and generic period owners do not prove the automorphic critical-value/period comparisons. Morse/Sard critical values are unrelated search hits.

Alternate-name query: `[Dd]eligne.*[Pp]eriod|[Cc]ritical.?[Vv]alue|[Pp]etersson.*[Ll][Ff]unction|[Rr]ankin.*[Ii]ntegral`. Index matches: 0; source-line matches: 30.

#### AutomorphicSpectralTheory:AS.0

Checked all 7 targets and 1 recorded overlaps. The l2 Hilbert sum, Bochner integration, compact self-adjoint spectral theorem and test-function spaces are present. They do not provide measurable direct integrals, trace-class/nuclear theory or the analytic Fredholm family required here.

Alternate-name query: `[Dd]irect.?[Ii]ntegral|Hilbert.?Schmidt|[Tt]race.?[Cc]lass|Schatten|[Nn]uclear|[Aa]nalytic.?Fredholm|Schwartz.*[Cc]omplete|[Cc]omplete.*Schwartz`. Index matches: 0; source-line matches: 61.

#### AutomorphicSpectralTheory:AS.1

Checked all 3 targets and 2 recorded overlaps. Classical holomorphic Eisenstein series and finite GL2 principal series are not nonholomorphic adelic Eisenstein series with parabolic constant terms.

Alternate-name query: `[Nn]on.?holomorphic.?Eisenstein|Maass|[Pp]arabolic.?[Ii]nduc|[Cc]onstant.?[Tt]erm.*Eisenstein|[Ee]pstein|[Aa]utomorphic`. Index matches: 0; source-line matches: 97.

#### AutomorphicSpectralTheory:AS.2

Checked all 3 targets and 1 recorded overlaps. Algebraic intertwining maps do not give normalized meromorphic intertwining operators, their poles or scattering matrices.

Alternate-name query: `[Ii]ntertwining.?[Oo]perator|Gindikin|Karpelevich|Shahidi|[Ss]cattering.?[Mm]atrix`. Index matches: 0; source-line matches: 0.

#### AutomorphicSpectralTheory:AS.3

Checked all 4 targets and 0 recorded overlaps. No Arthur truncation or Maass–Selberg package found. Arthur in author names is not evidence of such declarations.

Alternate-name query: `Arthur|Maass.?Selberg|[Tt]runcation.*[Aa]utomorphic|[Ww]ave.?[Pp]acket|Langlands.*[Cc]ombinator`. Index matches: 0; source-line matches: 42.

#### AutomorphicSpectralTheory:AS.4

Checked all 6 targets and 3 recorded overlaps. Abstract L2 and finite representation decompositions do not construct the automorphic residual/continuous spectral decomposition or restricted tensor factorization.

Alternate-name query: `Flath|[Rr]esidual.?[Ss]pectrum|[Rr]estricted.?[Tt]ensor|[Aa]utomorphic.*[Mm]ultiplicity|[Aa]utomorphic.*[Ss]pectral`. Index matches: 0; source-line matches: 0.

#### AutomorphicSpectralTheory:AS.5

Checked all 4 targets and 2 recorded overlaps. Lie algebra representations and differential/cohomological ingredients do not provide relative (g,K) cohomology, Harish–Chandra modules or Franke comparison; Chevalley–Eilenberg TODOs are not implementation.

Alternate-name query: `Franke|[Rr]elative.*Lie.*[Cc]ohom|Chevalley.?Eilenberg|Harish.?Chandra|[Ii]nfinitesimal.?[Cc]haracter`. Index matches: 0; source-line matches: 4.

#### AutomorphicSpectralTheory:AS.6

Checked all 4 targets and 4 recorded overlaps. Algebraic traces and Selberg sieve results do not implement the invariant trace formula or weighted orbital integrals.

Alternate-name query: `[Tt]race.?[Ff]ormula|[Oo]rbital.?[Ii]ntegral|[Ww]eighted.?[Cc]haracter|Selberg|[Ii]nvariantization`. Index matches: 33; source-line matches: 16.

#### CompletedCohomologyPartII:CC.0

Checked all 5 targets and 5 recorded overlaps. Topological spaces, cochains, compact-support functions and quotient tools do not construct arithmetic towers, Borel–Serre compactifications or sheaf j! compact-support cohomology.

Alternate-name query: `[Nn]eat.?[Ss]ubgroup|[Bb]orel.?Serre|[Ll]ocally.?[Ss]ymmetric|[Ee]xtension.?[Bb]y.?[Zz]ero|[Cc]ompact.*[Ss]upport.*[Cc]ohom|[Cc]ellular.*[Cc]omplex|[Ee]tale.?[Cc]ohom`. Index matches: 0; source-line matches: 34.

#### CompletedCohomologyPartII:CC.1

Checked all 4 targets and 3 recorded overlaps. Exact filtered colimits and homology/colimit comparison exist. Mackey induction is algebraic; continuous corestriction has degree 0/1/2 normalization. The all-degree tower Hecke/trace construction is not supplied.

Alternate-name query: `[Cc]or.*[Cc]omp.*[Rr]es|[Cc]ores.*[Rr]estr|[Mm]ackey|[Hh]ecke.*[Cc]ohom|[Ss]mooth.*[Cc]olimit`. Index matches: 237; source-line matches: 912.

#### CompletedCohomologyPartII:CC.2

Checked all 5 targets and 4 recorded overlaps. Adic completion, topological limits and Type-valued Mittag–Leffler tools are real ingredients. Derived lim1/Milnor and Banach tower control are still missing. Finding 4 narrows the description of ContRepresentation.

Alternate-name query: `limOne|lim1|lim¹|Milnor|holim|[Dd]erived.*[Ll]imit|[Hh]omotopy.?[Ll]imit|Mittag|[Bb]anach.*[Rr]epresentation`. Index matches: 13; source-line matches: 58.

#### CompletedCohomologyPartII:CC.3

Checked all 5 targets and 3 recorded overlaps. Pontryagin dual carriers and compact/discrete instances are present; finite biduality and finite-projective base change do not provide integral completed-module duality. StrongDual has a general carrier, but the standard bounded/compact convergence modules inspected assume normed fields.

Alternate-name query: `[Cc]ompleted.?[Hh]omology|[Cc]ompleted.?[Gg]roup|Iwasawa.?[Aa]lgebra|[Pp]ontryagin|[Cc]ontinuous.*[Dd]ual`. Index matches: 133; source-line matches: 252.

#### CompletedCohomologyPartII:CC.4

Checked all 4 targets and 4 recorded overlaps. CW complexes, algebraic projective resolutions and K-projectivity do not construct a perfect finite cellular complex for the arithmetic tower.

Alternate-name query: `[Pp]erfect.?[Cc]omplex|[Cc]ellular.?[Hh]omology|[Cc]ellular.?[Cc]hain|[Dd]erived.?[Cc]oinvariant`. Index matches: 0; source-line matches: 0.

#### CompletedCohomologyPartII:CC.5

Checked all 3 targets and 2 recorded overlaps. Module finiteness and algebraic lattices are usable ingredients; search hits for admissible quivers and uniform products do not prove admissibility over completed group rings.

Alternate-name query: `Lazard|[Pp]owerful.?[Gg]roup|[Uu]niform.?[Pp]ro|[Aa]dmissible.*[Rr]epresentation|[Rr]epresentation.*[Aa]dmissible`. Index matches: 39; source-line matches: 28.

#### CompletedCohomologyPartII:CC.6

Checked all 3 targets and 3 recorded overlaps. Generic spectral sequences and group homology as a left derived functor do not construct the completed-cohomology Hochschild–Serre/control spectral sequence.

Alternate-name query: `Hochschild.?Serre|[Ll]ocally.?[Aa]lgebraic|[Cc]ontinuous.*[Dd]erived|[Dd]erived.*[Ii]nvariant`. Index matches: 1; source-line matches: 5.

#### CompletedCohomologyPartII:CC.7

Checked all 3 targets and 2 recorded overlaps. No torsion/control or non-Eisenstein localization package for these completed towers was found.

Alternate-name query: `[Ii]nterior.?[Cc]ohom|[Pp]arabolic.?[Cc]ohom|Eichler.?Shimura|[Cc]ompleted.?[Cc]ohom`. Index matches: 0; source-line matches: 0.

#### CompletedCohomologyPartII:CC.8

Checked all 4 targets and 3 recorded overlaps. Classical modular curves/forms and elliptic-curve algebra do not construct the integral Shimura-variety tower with its automorphic/Galois comparison.

Alternate-name query: `Shimura|[Mm]odular.?[Cc]urve|[Hh]ilbert.?[Mm]odular|[Nn]on.?Eisenstein`. Index matches: 0; source-line matches: 279.

#### GL2AutomorphicRepresentationsAndTransfer:R16.1

Checked all 4 targets and 3 recorded overlaps. Local-field and Haar ingredients do not construct GL2 local smooth representation theory. Integer column reduction called unimodular is unrelated to Haar unimodularity.

Alternate-name query: `[Ii]wasawa.?[Dd]ecomposition|[Cc]artan.?[Dd]ecomposition|[Aa]delization|[Uu]nimodular.*GL|GL.*[Uu]nimodular`. Index matches: 2; source-line matches: 1.

#### GL2AutomorphicRepresentationsAndTransfer:R16.2

Checked all 3 targets and 3 recorded overlaps. Finite GL2 principal-series characters and Mackey theory are not local-field principal series, supercuspidals or newvector theory.

Alternate-name query: `[Ss]upercuspidal|GL2Cuspidal|[Jj]acquet.?[Mm]odule|[Nn]ewvector|Casselman|Satake`. Index matches: 0; source-line matches: 0.

#### GL2AutomorphicRepresentationsAndTransfer:R16.3

Checked all 3 targets and 4 recorded overlaps. The relevant missing objects remain Weil groups, Weil–Deligne representations and local Langlands; Mordell–Weil and global unramified Artin maps do not fill this gap.

Alternate-name query: `Weil.?[Gg]roup|Weil.?Deligne|[Ll]ocal.?Langlands|[Aa]rtin.?[Cc]onductor|[Ss]wan.?[Cc]onductor|[Ll]ocal.?[Aa]rtin|[Uu]pper.?[Rr]amification`. Index matches: 0; source-line matches: 7.

#### GL2AutomorphicRepresentationsAndTransfer:R16.4

Checked all 4 targets and 4 recorded overlaps. Classical newforms and strong multiplicity one are present special cases. The adelic tensor factorization and general rationality assertions still need their designated owners; coefficient-field migration claims in upstream plans are not pinned implementation.

Alternate-name query: `[Ss]trong.?[Mm]ultiplicity|[Cc]oefficient.?[Ff]ield|[Ee]igenvalue.?[Ff]ield|[Rr]estricted.?[Tt]ensor`. Index matches: 3; source-line matches: 138.

#### GL2AutomorphicRepresentationsAndTransfer:R16.5

Checked all 3 targets and 1 recorded overlaps. No Whittaker expansion or local/global zeta-integral comparison was found; Whittaker–Watson bibliography entries are unrelated.

Alternate-name query: `[Cc]onverse.?[Tt]heorem|Atkin.*[Ff]unctional|[Ff]unctional.*Atkin|Whittaker`. Index matches: 0; source-line matches: 1.

#### GL2AutomorphicRepresentationsAndTransfer:R16.6

Checked all 3 targets and 3 recorded overlaps. Classical eigensystems and level structures do not construct Hilbert cohomological automorphic representations or their full Galois compatibility.

Alternate-name query: `[Hh]ilbert.?[Mm]odular|[Cc]ohomological.?[Ww]eight|[Gg]alois.*[Mm]odular.?[Ff]orm|[Aa]delization`. Index matches: 13; source-line matches: 4.

#### GL2AutomorphicRepresentationsAndTransfer:R17.1

Checked all 3 targets and 4 recorded overlaps. Quaternion carrier, norm and explicit split-matrix equivalences are present with their hypotheses. General local classification/Hilbert-symbol conclusions are owned by the cited quadratic-form/CFT layers, not already built here.

Alternate-name query: `Hilbert.?[Ss]ymbol|Hasse.?[Ii]nvariant|[Ll]ocal.*Brauer|[Mm]aximal.?[Oo]rder|Jacquet.?Langlands`. Index matches: 0; source-line matches: 0.

#### GL2AutomorphicRepresentationsAndTransfer:R17.2

Checked all 3 targets and 2 recorded overlaps. No local Jacquet–Langlands character identity or transfer theorem was found. Fundamental lemmas in calculus and topology are unrelated.

Alternate-name query: `[Tt]ransfer.?[Ff]actor|[Ff]undamental.?[Ll]emma|[Tt]wisted.?[Oo]rbital|[Cc]yclic.*[Tt]race`. Index matches: 11; source-line matches: 13.

#### GL2AutomorphicRepresentationsAndTransfer:R17.3

Checked all 4 targets and 3 recorded overlaps. Definite finite double-coset tools and reciprocity ingredients do not prove global Jacquet–Langlands or its required ramification restrictions. Brandt graph search hits do not implement Brandt modules.

Alternate-name query: `Brandt|Eichler|Hasse.?Noether|Hilbert.?[Rr]eciprocity|[Rr]amification.*[Pp]arity`. Index matches: 0; source-line matches: 3.

#### GL2AutomorphicRepresentationsAndTransfer:R17.4

Checked all 3 targets and 1 recorded overlaps. No cyclic base change or automorphic induction theorem for GL2 was found; the cited broader transfer owner is a planned interface.

Alternate-name query: `[Aa]utomorphic.?[Bb]ase|[Cc]yclic.?[Bb]ase|[Aa]utomorphic.?[Dd]escent`. Index matches: 0; source-line matches: 0.

#### GL2AutomorphicRepresentationsAndTransfer:R17.5

Checked all 4 targets and 3 recorded overlaps. Clifford theory, factor sets, linear characters and index-two induction are real ingredients with finite/algebraic hypotheses; they do not prove Langlands–Tunnell or weight-one modularity.

Alternate-name query: `Langlands.?Tunnell|Deligne.?Serre|[Aa]utomorphic.?[Ii]nduction|[Aa]rtin.?[Rr]epresentation|[Ww]eight.?[Oo]ne`. Index matches: 69; source-line matches: 153.

#### GL2AutomorphicRepresentationsAndTransfer:R17.6

Checked all 3 targets and 1 recorded overlaps. No remaining characteristic-two automorphy endpoint is built. The classical Serre owner is correctly a downstream planned consumer.

Alternate-name query: `Rohrlich|[Rr]esidual.?[Mm]odular|[Pp]otential.?[Mm]odular`. Index matches: 0; source-line matches: 0.

#### HabiroNahmSeries:HB.10

Checked all 4 targets and 5 recorded overlaps. Rank-one examples, Bloch certificates and quantum-topology comparisons remain source-scoped targets. Formal identities and numerical examples do not establish general root-of-unity asymptotics or quantum modularity.

Alternate-name query: `Rogers.?Ramanujan|[Qq].?[Bb]inomial|[Cc]olored.?Jones|Kashaev|[Qq]uantum.?[Mm]odular|Chern.?Simons`. Index matches: 1; source-line matches: 3.

#### HabiroNahmSeries:HB.3

Checked all 4 targets and 4 recorded overlaps. Polynomial/field and algebraic ingredients do not construct the source Bloch convention, dilogarithm regulator or all Nahm solutions. Retain positive/rational versus integral distinctions.

Alternate-name query: `Nahm|[Hh]essian.*[Cc]onvex|[Cc]onvex.*[Hh]essian|[Bb]loch.?[Gg]roup|[Dd]ilogarithm|Steinberg.?[Ss]ymbol`. Index matches: 0; source-line matches: 1.

#### HabiroNahmSeries:HB.4

Checked all 4 targets and 3 recorded overlaps. Ordinary Pochhammer and generic asymptotic tools do not give q-Pochhammer or the root-of-unity Nahm expansion. CGZ Theorem 7.1 allows a vanishing formal expansion; Corollary 7.2 needs a nonzero constant.

Alternate-name query: `[Qq].?[Pp]ochhammer|[Qq].?[Bb]inomial|Euler.?Maclaurin|[Ss]addle.?[Pp]oint|[Ll]aplace.?[Aa]symptotic`. Index matches: 12; source-line matches: 48.

#### HabiroNahmSeries:HB.5

Checked all 4 targets and 2 recorded overlaps. Finite generated-group ingredients do not supply CGZ Theorem 7.5. The theorem concerns the distinguished solution and does not assert all solutions or the converse to Nahm modularity.

Alternate-name query: `[Bb]loch.*[Tt]orsion|[Ff]inite.?[Cc]hern|[Uu]nbounded.*[Tt]orsion|[Tt]orsion.*[Dd]ivisib`. Index matches: 0; source-line matches: 1.

#### HabiroNahmSeries:HB.5a

Checked all 5 targets and 1 recorded overlaps. Arithmetic subgroups, cusps, q-expansions and the general valence theorem are existing ingredients. They do not establish the modular Nahm cusp-asymptotic comparison.

Alternate-name query: `[Mm]eromorphic.?[Mm]odular|[Mm]odular.?[Ff]unction|[Ll]aurent.*[Cc]usp|[Rr]adial.*[Cc]usp`. Index matches: 0; source-line matches: 0.

#### HabiroNahmSeries:HB.8

Checked all 3 targets and 1 recorded overlaps. Generic multivariable products, Laurent polynomials and cyclotomic factors are ingredients. Finding 3 corrects the precise product basis before the missing DT finite-support theorem can be planned.

Alternate-name query: `[Pp]lethystic|[Ee]uler.?[Tt]ransform|[Qq].?[Dd]ifference|[Ff]ormal.?Gaussian|[Mm]ultivar.*[Ll]ogarithm`. Index matches: 2; source-line matches: 6.

#### HabiroNahmSeries:HB.9

Checked all 3 targets and 2 recorded overlaps. Formal series and p-adic arithmetic do not establish GSWZ Frobenius congruences or membership in the K3-indexed Habiro module. Keep localization/discriminant restrictions and formal versus analytic variables visible.

Alternate-name query: `Dieudonn[eé].?Dwork|Artin.?Hasse|Habiro|[Pp].?adic.?[Dd]ilog|[Pp].?adic.?[Rr]egulator`. Index matches: 0; source-line matches: 0.

### Ownership checks

All 119 recorded overlaps resolve to 92 distinct current stages. The claim was compared with the owner's actual description, not just its title. In particular:

- AL/AS import the general automorphic, adelic, local smooth-representation and analytic-number-theory infrastructure; AS.0 explicitly owns the further functional analysis needed for its direct integrals and operator families.
- CC keeps arithmetic tower construction distinct from generic exact colimits, enhanced derived sheaves, completed group rings, perfect complexes and p-adic representation theory. The linked geometry and completed-cohomology layers remain planned interfaces, not evidence of library completion.
- GL2 imports quaternion norms, local classification and Hilbert symbols from the quadratic-form invariants/CFT owners, projective representation and Clifford theory from induction/restriction, and the classical newform/period/coefficient-field route from modular forms. The upstream descriptions explicitly distinguish migrated work from remaining weight-one or comparison obligations.
- Habiro imports Bloch conventions and finite Chern maps from V/HB.1, cyclic dilogarithms from HB.2, polylogarithm regulators from P, formal q-series from QM.0, and relative Habiro completion/Frobenius interfaces from HR.1–2. QT.6 is restricted to exported comparisons; it does not replace the Nahm asymptotic proof.

No additional wrong-owner or duplicated-construction finding was established. The overlaps already recorded by the accepted audit are not being re-reported as newly discovered defects.

### Public primary sources

| Source | Exact inspected locators | PDF SHA-256 |
|---|---|---|
| [Tate thesis](https://sites.math.rutgers.edu/~alexk/2023S572/Tate1950.pdf) | §2.3; Definition 2.4.1 and Lemma 2.4.1; PDF 14, 16–17 / printed 2.07, 2.09–2.10 | `0c40f263e8ab7924d1f0a8c7e40d81d464aec6620b8ec14101f21f7b07e6f0c8` |
| [CGZ, Bloch Groups, Algebraic K-Theory, Units, and Nahm's Conjecture](https://math.uchicago.edu/~fcale/papers/Nahm.pdf) | §7, pp. 33–38, 40–41; Theorem 7.1, Corollary 7.2, Remark 7.3, Theorem 7.5 and Remarks 7.6–7.7 | `26d3e81ccbc45e588e26a51b8451c9c6fe194f6ba5091a4a22ae43f270a13dd1` |
| [GSWZ, The Habiro Ring of a Number Field](https://guests.mpim-bonn.mpg.de/stavros/publications/habiro-ring-number-field.pdf) | Definition 1.7, (28)–(31), pp. 11–12; Theorems 3–5, pp. 14–15; Lemma 2.6 and Theorem 6/proof, pp. 23–25 | `b5684e851c0dd3e7bebd251de667680606f7aaa2a8725a49c36a7a581f28d1af` |

All sources read on 2026-09-24. The three substantive findings concern the audit, not errata in those sources. The low-severity fourth finding only corrects a library description.

## Declaration inventory

The following inventory deduplicates 411 citation occurrences to 374 declarations. Links point to the immutable pins Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Every cited declaration's statement and relevant hypotheses were read; the table is a reproducible locator inventory, not a claim that the declaration proves the entire target. The stage conclusions above record the scope distinctions.

| Library | Declaration read | Used in stages |
|---|---|---|
| mathlib | [`SchwartzMap`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Distribution/SchwartzSpace/Basic.lean#L77) | AL.0, AS.0 |
| mathlib | [`Fourier.fourierIntegral`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Fourier/FourierTransform.lean#L340) | AL.0 |
| mathlib | [`VectorFourier.fourierIntegral`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Fourier/FourierTransform.lean#L82) | AL.0 |
| mathlib | [`SchwartzMap.fourierTransformCLM`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Distribution/SchwartzSpace/Fourier.lean#L51) | AL.0 |
| tauceti | [`AddChar.exists_fourierAddChar_eq`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Analysis/Fourier/AddCircle.lean#L182) | AL.0 |
| mathlib | [`RestrictedProduct`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Algebra/RestrictedProduct/Basic.lean#L79) | AL.0 |
| mathlib | [`NumberField.AdeleRing`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/NumberField/AdeleRing.lean#L50) | AL.0 |
| mathlib | [`Continuous.fourierInv_fourier_eq`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Fourier/Inversion.lean#L174) | AL.0 |
| mathlib | [`MeasureTheory.Integrable.fourierInv_fourier_eq`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Fourier/Inversion.lean#L165) | AL.0 |
| mathlib | [`VectorFourier.fourierIntegral_comp_add_right`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Fourier/FourierTransform.lean#L107) | AL.0 |
| mathlib | [`Real.fourier_comp_linearIsometry`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Fourier/FourierTransform.lean#L455) | AL.0 |
| tauceti | [`TauCeti.integral_fourierAtom_eq_charFun_neg_two_pi_smul`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Analysis/Bochner/Fourier/Convention.lean#L78) | AL.0 |
| mathlib | [`Real.tsum_eq_tsum_fourier`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Fourier/PoissonSummation.lean#L102) | AL.0 |
| mathlib | [`SchwartzMap.tsum_eq_tsum_fourier`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Fourier/PoissonSummation.lean#L219) | AL.0 |
| tauceti | [`TauCeti.GlobalNumberFields.discreteTopology_principalSubgroup`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/NumberField/Global/Adeles/Discrete.lean#L64) | AL.0 |
| mathlib | [`hasDerivAt_integral_of_dominated_loc_of_deriv_le`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Calculus/ParametricIntegral.lean#L288) | AL.0, AS.0 |
| mathlib | [`mellin`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/MellinTransform.lean#L91) | AL.0, AL.1 |
| mathlib | [`mellin_differentiableAt_of_isBigO_rpow`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/MellinTransform.lean#L401) | AL.0 |
| mathlib | [`mellinInv_mellin_eq`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/MellinInversion.lean#L92) | AL.0, R16.5 |
| mathlib | [`Complex.GammaIntegral_eq_mellin`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/SpecialFunctions/Gamma/Deriv.lean#L45) | AL.1 |
| mathlib | [`Complex.integral_cpow_mul_exp_neg_mul_Ioi`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/SpecialFunctions/Gamma/Basic.lean#L372) | AL.1 |
| mathlib | [`ArithmeticFunction.ofPowerSeries`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/ArithmeticFunction/LFunction.lean#L66) | AL.1, AL.4, AL.5 |
| mathlib | [`WeakFEPair.differentiableAt_Λ`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/LSeries/AbstractFuncEq.lean#L394) | AL.1 |
| mathlib | [`Complex.Gammaℝ`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/SpecialFunctions/Gamma/Deligne.lean#L45) | AL.1 |
| mathlib | [`DirichletCharacter.rootNumber`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/LSeries/DirichletContinuation.lean#L272) | AL.1, AL.5 |
| mathlib | [`DirichletCharacter.gammaFactor`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/LSeries/DirichletContinuation.lean#L207) | AL.1 |
| mathlib | [`Complex.Gammaℝ_div_Gammaℝ_one_sub`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/SpecialFunctions/Gamma/Deligne.lean#L157) | AL.1 |
| mathlib | [`Complex.Gammaℂ`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/SpecialFunctions/Gamma/Deligne.lean#L53) | AL.1 |
| mathlib | [`hasSum_mellin_pi_mul_sq`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/LSeries/MellinEqDirichlet.lean#L118) | AL.1 |
| mathlib | [`gaussSum`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/GaussSum.lean#L72) | AL.1, AL.3 |
| mathlib | [`gaussSum_mul_gaussSum_eq_card`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/GaussSum.lean#L188) | AL.1 |
| mathlib | [`DirichletCharacter.conductor`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/DirichletCharacter/Basic.lean#L246) | AL.1 |
| mathlib | [`DirichletCharacter.primitiveCharacter`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/DirichletCharacter/Basic.lean#L307) | AL.1 |
| mathlib | [`DirichletCharacter.IsPrimitive.completedLFunction_one_sub`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/LSeries/DirichletContinuation.lean#L284) | AL.1, AL.2 |
| mathlib | [`DirichletCharacter.LSeries_eulerProduct_hasProd`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/EulerProduct/DirichletLSeries.lean#L114) | AL.1 |
| mathlib | [`DirichletCharacter.LFunctionTrivChar_residue_one`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/LSeries/DirichletContinuation.lean#L182) | AL.1 |
| mathlib | [`NumberField.tendsto_sub_one_mul_dedekindZeta_nhdsGT`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/NumberField/DedekindZeta.lean#L77) | AL.1 |
| tauceti | [`TauCeti.dedekindZeta_eulerProduct_hasProd`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/ArithmeticDirichletSeries/EulerProduct/Analytic.lean#L386) | AL.1 |
| tauceti | [`HeckeRing.GLn.polynomialRingEquivTwo`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/HeckeRing/GLn/PolynomialRing/Injective.lean#L684) | AL.2, R16.2 |
| tauceti | [`HeckeRing.GL2.heckeT_prime_pow_recurrence`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/HeckeRing/GL2/Recurrence.lean#L210) | AL.2 |
| mathlib | [`ModularForm.weakFEPair`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/ModularForms/LFunction.lean#L61) | AL.2 |
| mathlib | [`CuspForm.differentiable_L`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/ModularForms/LFunction.lean#L190) | AL.2 |
| tauceti | [`HeckeRing.GL2.Newform.qExpansion_coeff_mul`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/ModularForms/Newforms/Coefficient.lean#L102) | AL.2, R16.6 |
| tauceti | [`HeckeRing.GL2.Newform.qExpansion_coeff_prime_pow_add_two`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/ModularForms/Newforms/Coefficient.lean#L114) | AL.2, AL.4 |
| mathlib | [`PiTensorProduct.injectiveSeminorm`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Normed/Module/PiTensorProduct/InjectiveSeminorm.lean#L78) | AL.3 |
| mathlib | [`PhragmenLindelof.vertical_strip`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Complex/PhragmenLindelof.lean#L275) | AL.3, R16.5 |
| mathlib | [`UpperHalfPlane.petersson`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/ModularForms/Petersson.lean#L31) | AL.3 |
| mathlib | [`Matrix.charpolyRev`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Matrix/Charpoly/Coeff.lean#L291) | AL.4 |
| mathlib | [`Matrix.charpoly_units_conj`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean#L285) | AL.4 |
| mathlib | [`LinearMap.charpoly_prodMap`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Charpoly/ToMatrix.lean#L63) | AL.4 |
| mathlib | [`LinearMap.charpoly_baseChange`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Charpoly/BaseChange.lean#L23) | AL.4 |
| mathlib | [`ArithmeticFunction.eulerProduct`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/ArithmeticFunction/LFunction.lean#L262) | AL.4 |
| mathlib | [`ArithmeticFunction.IsMultiplicative.eulerProduct_tprod`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/EulerProduct/Basic.lean#L261) | AL.4 |
| tauceti | [`TauCeti.MultiplicativeIdealWeight.hasProd_eulerFactor`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/ArithmeticDirichletSeries/EulerProduct/Analytic.lean#L335) | AL.4 |
| mathlib | [`DirichletCharacter.LFunction_changeLevel`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/LSeries/DirichletContinuation.lean#L150) | AL.5 |
| mathlib | [`DirichletCharacter.changeLevel_primitiveCharacter`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/DirichletCharacter/Basic.lean#L310) | AL.5 |
| tauceti | [`TauCeti.MultiplicativeIdealWeight.restrict`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/ArithmeticDirichletSeries/Weight.lean#L311) | AL.5 |
| tauceti | [`TauCeti.IdealArithmeticFunction.normCoeff_supportedPart`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/ArithmeticDirichletSeries/EulerProduct/Basic.lean#L475) | AL.5 |
| mathlib | [`riemannZeta_neg_nat_eq_bernoulli`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/LSeries/HurwitzZetaValues.lean#L251) | AL.5 |
| mathlib | [`LSeries`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/LSeries/Basic.lean#L164) | AL.5 |
| mathlib | [`IsHilbertSum`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/InnerProductSpace/l2Space.lean#L268) | AS.0 |
| mathlib | [`OrthogonalFamily.linearIsometry`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/InnerProductSpace/l2Space.lean#L193) | AS.0 |
| mathlib | [`MeasureTheory.L2.innerProductSpace`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/MeasureTheory/Function/L2Space.lean#L190) | AS.0 |
| tauceti | [`TauCeti.prodHilbertBasis`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Analysis/InnerProductSpace/L2/Product.lean#L346) | AS.0 |
| mathlib | [`ContinuousLinearMap.orthogonalComplement_iSup_eigenspaces_eq_bot`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/InnerProductSpace/Spectrum.lean#L443) | AS.0 |
| tauceti | [`ContinuousLinearMap.exists_hilbertBasis_forall_hasEigenvector`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Analysis/InnerProductSpace/Spectrum.lean#L118) | AS.0 |
| mathlib | [`IsStarNormal.instIsometricContinuousFunctionalCalculus`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/CStarAlgebra/ContinuousFunctionalCalculus/Basic.lean#L168) | AS.0 |
| tauceti | [`LinearPMap.isSelfAdjoint_iff_exists_isUnitary_complexGenerator_eq_I_smul`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Analysis/Semigroups/Group/Stone/Unbounded.lean#L115) | AS.0 |
| tauceti | [`IsSelfAdjoint.smul_sub_bijective`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Analysis/InnerProductSpace/LinearPMap/SelfAdjoint.lean#L249) | AS.0 |
| tauceti | [`TauCeti.isCompactOperator_convolutionOperator`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Compact/Convolution.lean#L564) | AS.0 |
| tauceti | [`TauCeti.ContRepresentation.trace_integratedOperator`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Compact/Integrated.lean#L332) | AS.0, AS.6 |
| mathlib | [`TestFunction`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Distribution/TestFunction.lean#L67) | AS.0 |
| mathlib | [`ContDiffMapSupportedIn`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Distribution/ContDiffMapSupportedIn.lean#L97) | AS.0 |
| mathlib | [`MeromorphicAt`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Meromorphic/Basic.lean#L38) | AS.0 |
| mathlib | [`DifferentiableOn.analyticAt`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Complex/CauchyIntegral.lean#L704) | AS.0 |
| tauceti | [`TauCeti.LinearPMap.analyticAt_resolvent`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Analysis/Normed/Operator/Resolvent/Analytic.lean#L67) | AS.0 |
| mathlib | [`IsCompactOperator.hasEigenvalue_or_mem_resolventSet`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Normed/Operator/Compact/FredholmAlternative.lean#L164) | AS.0 |
| mathlib | [`MeasureTheory.integral_prod`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/MeasureTheory/Integral/Prod.lean#L440) | AS.0 |
| mathlib | [`MeasureTheory.integral_tsum`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/MeasureTheory/Integral/DominatedConvergence.lean#L88) | AS.0 |
| mathlib | [`hasFDerivAt_integral_of_dominated_of_fderiv_le`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Calculus/ParametricIntegral.lean#L210) | AS.0 |
| mathlib | [`PointwiseConvergenceCLM.tendsto_iff_forall_tendsto`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Algebra/Module/Spaces/PointwiseConvergenceCLM.lean#L103) | AS.0 |
| mathlib | [`TemperedDistribution`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Distribution/TemperedDistribution.lean#L53) | AS.0 |
| mathlib | [`Distribution`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Distribution/Distribution.lean#L165) | AS.0 |
| mathlib | [`Representation.coind`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Coinduced.lean#L82) | AS.1 |
| mathlib | [`MeasureTheory.Measure.modularCharacter`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/MeasureTheory/Group/ModularCharacter.lean#L130) | AS.1, R16.1 |
| tauceti | [`TauCeti.Cocharacter.parabolic`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/AlgebraicGroup/Dynamic/Parabolic.lean#L293) | AS.1 |
| tauceti | [`TauCeti.Cocharacter.leviDecompositionMulEquiv`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/AlgebraicGroup/Dynamic/LeviDecomposition/Basic.lean#L193) | AS.1 |
| tauceti | [`TauCeti.GL2PrincipalSeries`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/CharacterTable/GL2/PrincipalSeries/Basic.lean#L228) | AS.1, R16.2 |
| mathlib | [`eisensteinSeries`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/ModularForms/EisensteinSeries/Defs.lean#L205) | AS.1 |
| mathlib | [`EisensteinSeries.eisensteinSeries_tendstoLocallyUniformly`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/ModularForms/EisensteinSeries/UniformConvergence.lean#L43) | AS.1 |
| mathlib | [`ModularForm.eisensteinSeriesMF`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/ModularForms/EisensteinSeries/Basic.lean#L35) | AS.1 |
| mathlib | [`EisensteinSeries.isBoundedAtImInfty_eisensteinSeriesSIF`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/ModularForms/EisensteinSeries/IsBoundedAtImInfty.lean#L57) | AS.1 |
| mathlib | [`ZLattice.summable_norm_rpow`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Module/ZLattice/Summable.lean#L226) | AS.1 |
| mathlib | [`ModularFormClass.qExpansion_coeff_eq_intervalIntegral`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/ModularForms/QExpansion.lean#L379) | AS.1 |
| mathlib | [`EisensteinSeries.E_qExpansion_coeff_zero`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/ModularForms/EisensteinSeries/QExpansion.lean#L347) | AS.1 |
| mathlib | [`Representation.IntertwiningMap`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Intertwining.lean#L36) | AS.2 |
| tauceti | [`Rep.mackeyDecomposition`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Induction/Mackey/Decomposition.lean#L390) | AS.2, CC.1 |
| tauceti | [`TauCeti.finrank_hom_indFDRep_mackey`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Induction/Mackey/Intertwining.lean#L245) | AS.2 |
| mathlib | [`WeakFEPair.functional_equation`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/LSeries/AbstractFuncEq.lean#L427) | AS.2, R16.5 |
| mathlib | [`completedRiemannZeta_one_sub`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/LSeries/RiemannZeta.lean#L106) | AS.2 |
| mathlib | [`ModularGroup.truncatedFundamentalDomain`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/Modular.lean#L940) | AS.3 |
| tauceti | [`TauCeti.dominantChamber`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/LinearAlgebra/RootSystem/Chamber.lean#L137) | AS.3 |
| mathlib | [`LinearMap.BilinForm.linearIndependent_of_pairwise_le_zero`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/QuadraticForm/Dual.lean#L164) | AS.3 |
| tauceti | [`ModularGroup.isFundamentalDomain_fdo`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/Modular.lean#L230) | AS.3, R16.1 |
| mathlib | [`ModularFormClass.exists_bound`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/ModularForms/Bounds.lean#L227) | AS.3 |
| mathlib | [`CuspFormClass.exp_decay_atImInfty`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/ModularForms/QExpansion.lean#L440) | AS.3 |
| tauceti | [`UpperHalfPlane.peterssonInner`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/ModularForms/Petersson/Basic.lean#L107) | AS.3 |
| tauceti | [`CuspForm.peterssonInnerCosets`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/ModularForms/Petersson/FiniteIndex.lean#L94) | AS.3 |
| mathlib | [`QuotientGroup.integral_mul_eq_integral_automorphize_mul`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/MeasureTheory/Measure/Haar/Quotient.lean#L398) | AS.3 |
| mathlib | [`ModularForm.cuspFormSubmodule`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/ModularForms/CuspFormSubmodule.lean#L74) | AS.4 |
| tauceti | [`TauCeti.CuspForm.isCompl_peterssonOrthogonal`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/ModularForms/Petersson/Orthogonal.lean#L201) | AS.4, R16.4 |
| tauceti | [`HeckeRing.GL2.finrank_cuspFormsNewEigenspace_le_one`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/ModularForms/Newforms/MultiplicityOne.lean#L175) | AS.4, R16.4 |
| tauceti | [`TauCeti.finiteDimensional_eigenspace_convolutionOperator`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Compact/Convolution.lean#L578) | AS.4 |
| tauceti | [`isInternal_cuspFormCharSpace`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/ModularForms/CharacterDecomp.lean#L154) | AS.4, R16.4 |
| tauceti | [`TauCeti.CuspForm.cuspFormCharSpace_le_peterssonOrthogonal_of_ne`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/ModularForms/Petersson/Unitary.lean#L215) | AS.4 |
| tauceti | [`HeckeCosetModule.mul_comm_of_antiInvolution`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/HeckeRing/Commutativity.lean#L459) | AS.4, CC.1 |
| tauceti | [`TauCeti.stdPeterWeylBasis`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Compact/PeterWeyl.lean#L700) | AS.4 |
| tauceti | [`TauCeti.rightRegularLp`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Compact/RegularRepresentation.lean#L66) | AS.4 |
| tauceti | [`TauCeti.orthogonalComplement_iSup_eigenspaces_convolutionOperator_eq_bot`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Compact/Convolution.lean#L655) | AS.4 |
| tauceti | [`TauCeti.casimirElement_mem_center`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/Lie/UniversalEnveloping/Casimir.lean#L178) | AS.5 |
| tauceti | [`TauCeti.vermaCentralCharacter`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/Lie/HighestWeight/CentralCharacter.lean#L188) | AS.5 |
| tauceti | [`TauCeti.casimir_smul_of_isHighestWeightVector_of_lieSpan_eq_top`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/Lie/HighestWeight/Casimir.lean#L320) | AS.5 |
| mathlib | [`LieModule.Cohomology.twoCocycle`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Lie/Cochain.lean#L155) | AS.5 |
| mathlib | [`groupCohomology`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Homological/GroupCohomology/Basic.lean#L186) | AS.5 |
| tauceti | [`TauCeti.LocalCoefficientSystem`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicTopology/LocalCoefficient.lean#L41) | AS.5 |
| mathlib | [`HeckeRing`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/HeckeRing/Defs.lean#L189) | AS.5, CC.1 |
| tauceti | [`TauCeti.convolutionCLM_apply_apply`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Compact/Convolution.lean#L209) | AS.6 |
| tauceti | [`TauCeti.ContRepresentation.integratedOperator`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Compact/Integrated.lean#L155) | AS.6 |
| mathlib | [`QuotientGroup.integral_eq_integral_automorphize`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/MeasureTheory/Measure/Haar/Quotient.lean#L378) | AS.6 |
| tauceti | [`TauCeti.character_ind`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Induction/Character.lean#L252) | AS.6 |
| tauceti | [`TauCeti.stdCharacterBasis`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Compact/Character/Basis.lean#L365) | AS.6 |
| mathlib | [`OpenSubgroup`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Algebra/OpenSubgroup.lean#L49) | CC.0 |
| mathlib | [`ProfiniteGrp.exist_openNormalSubgroup_sub_open_nhds_of_one`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Algebra/ClopenNhdofOne.lean#L48) | CC.0 |
| tauceti | [`TauCeti.IsTopologicallyFinitelyGenerated.exists_antitone_openNormalSubgroup_cofinal`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Topology/Algebra/Group/OpenSubgroup.lean#L166) | CC.0 |
| tauceti | [`TauCeti.hasBasis_nhds_one_unitFiltration`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/LocalField/UnitFiltration/Basic.lean#L353) | CC.0 |
| tauceti | [`TauCeti.IsProP`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Topology/Algebra/Group/Profinite/ProP/Basic.lean#L53) | CC.0 |
| tauceti | [`IsQuotientCoveringMap.isCoveringMap_of_comp`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Topology/Covering/Quotient.lean#L185) | CC.0 |
| mathlib | [`isQuotientCoveringMap_quotientMk_of_properlyDiscontinuousSMul`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Covering/Quotient.lean#L244) | CC.0 |
| tauceti | [`TauCeti.Deck.IsQuotientCoveringMap.normalizerQuotientDeckMulEquiv`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicTopology/UniversalCover/Deck/Quotient/Normalizer.lean#L264) | CC.0 |
| mathlib | [`Subgroup.IsArithmetic.properlyDiscontinuous`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/ModularForms/ProperlyDiscontinuous.lean#L31) | CC.0, CC.8 |
| mathlib | [`groupCohomologyIsoExt`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Homological/GroupCohomology/Basic.lean#L205) | CC.0, CC.6 |
| mathlib | [`groupCohomology.coindIso`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Homological/GroupCohomology/Shapiro.lean#L59) | CC.0 |
| mathlib | [`Rep.indCoindIso`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/FiniteIndex.lean#L178) | CC.0 |
| tauceti | [`TauCeti.ContCohomology.explicitShapiro1`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/Shapiro.lean#L372) | CC.0 |
| tauceti | [`TauCeti.ContCohomology.explicitCor1`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/Corestriction.lean#L457) | CC.0 |
| mathlib | [`groupHomology.coresNatTrans`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Homological/GroupHomology/Functoriality.lean#L851) | CC.0, CC.3 |
| mathlib | [`SlashInvariantForm.trace`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/ModularForms/NormTrace.lean#L55) | CC.0 |
| mathlib | [`AlgebraicTopology.singularHomologyFunctor`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicTopology/SingularHomology/Basic.lean#L52) | CC.0 |
| tauceti | [`TopPair.singularHomology`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicTopology/Singular/Relative.lean#L165) | CC.0 |
| mathlib | [`CategoryTheory.Sheaf.H`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Sites/SheafCohomology/Basic.lean#L59) | CC.0 |
| mathlib | [`AlgebraicGeometry.Scheme.EllAdicCohomology`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Sites/ElladicCohomology.lean#L75) | CC.0, CC.8 |
| mathlib | [`CategoryTheory.Limits.colim.exact_mapShortComplex`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Abelian/GrothendieckAxioms/Colim.lean#L121) | CC.1 |
| tauceti | [`TauCeti.moduleCat_ab5OfSize`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/Homology/ShortComplex/Colimit.lean#L64) | CC.1 |
| tauceti | [`TauCeti.homologicalComplexHomologyFunctor_preservesColimitsOfShape`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/Homology/ShortComplex/Colimit.lean#L242) | CC.1 |
| mathlib | [`CategoryTheory.Functor.Final.colimitIso`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Limits/Final.lean#L348) | CC.1 |
| mathlib | [`Module.DirectLimit`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Colimit/Module.lean#L59) | CC.1 |
| mathlib | [`continuousSMul_iff_stabilizer_isOpen`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Algebra/MulAction.lean#L287) | CC.1 |
| tauceti | [`TauCeti.IsSmoothDiscrete`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/SmoothDiscrete.lean#L254) | CC.1, R16.2 |
| tauceti | [`TauCeti.iSup_fixedPoints_openNormal_eq_top`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/Discrete.lean#L180) | CC.1 |
| tauceti | [`TauCeti.ContCohomology.explicitConj1`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/Conjugation.lean#L137) | CC.1 |
| tauceti | [`LeftCosetModule.deg`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/HeckeRing/Degree.lean#L106) | CC.1 |
| tauceti | [`HeckeRing.GL2.heckeSlashSum`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/ModularForms/HeckeSlash/Basic.lean#L247) | CC.1 |
| tauceti | [`TauCeti.ContCohomology.explicitCor1_comp_res1`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/Corestriction.lean#L496) | CC.1 |
| tauceti | [`TauCeti.TateCohomology.H0Res_comp_H0Cor`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/TateCohomology/Restriction.lean#L144) | CC.1 |
| mathlib | [`groupCohomology.resNatTrans`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Homological/GroupCohomology/Functoriality.lean#L543) | CC.1 |
| mathlib | [`AdicCompletion`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/AdicCompletion/Basic.lean#L171) | CC.2, HB.9 |
| mathlib | [`AdicCompletion.isAdicComplete`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/AdicCompletion/Completeness.lean#L184) | CC.2 |
| mathlib | [`IsAdic.isAdicComplete_iff`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/AdicCompletion/Topology.lean#L76) | CC.2 |
| mathlib | [`PadicInt.lift`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/Padics/RingHoms.lean#L658) | CC.2 |
| mathlib | [`CategoryTheory.Functor.rightDerived`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Abelian/RightDerived.lean#L109) | CC.2 |
| mathlib | [`CategoryTheory.Functor.IsMittagLeffler`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/CofilteredSystem.lean#L137) | CC.2 |
| mathlib | [`CategoryTheory.Functor.surjective_toEventualRanges`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/CofilteredSystem.lean#L262) | CC.2 |
| mathlib | [`CategoryTheory.Limits.Concrete.surjective_π_app_zero_of_surjective_map`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Limits/ConcreteCategory/Basic.lean#L99) | CC.2 |
| mathlib | [`AdicCompletion.pow_smul_top_eq_ker_eval`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/AdicCompletion/Completeness.lean#L154) | CC.2 |
| mathlib | [`AdicCompletion.map_exact`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/AdicCompletion/Exactness.lean#L184) | CC.2 |
| mathlib | [`groupCohomology.δ`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Homological/GroupCohomology/LongExactSequence.lean#L94) | CC.2 |
| tauceti | [`TauCeti.Submodule.rationalizationEquiv`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/Module/Lattice.lean#L203) | CC.2 |
| mathlib | [`ContRepresentation`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Continuous/Basic.lean#L54) | CC.2 |
| mathlib | [`PontryaginDual`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Algebra/PontryaginDual.lean#L37) | CC.3 |
| mathlib | [`CharacterModule`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Module/CharacterModule.lean#L44) | CC.3 |
| mathlib | [`CharacterModule.dual_bijective_iff_bijective`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Module/CharacterModule.lean#L253) | CC.3 |
| mathlib | [`StrongDual`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Algebra/Module/ContinuousLinearMap/Basic.lean#L96) | CC.3 |
| mathlib | [`AbstractMeasure.amiceTransformEquiv`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/Padics/Measure/AmiceTransform.lean#L156) | CC.3 |
| mathlib | [`Representation.dual`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Basic.lean#L671) | CC.3, R16.2 |
| tauceti | [`TauCeti.dualRightAction`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/LinearAlgebra/Dual/RightAction.lean#L52) | CC.3 |
| mathlib | [`CommGroup.monoidHomMonoidHomEquiv`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/FiniteAbelian/Duality.lean#L151) | CC.3 |
| mathlib | [`AddChar.doubleDualEquiv`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Fourier/FiniteAbelian/PontryaginDuality.lean#L174) | CC.3 |
| mathlib | [`Module.evalEquiv`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Dual/Defs.lean#L226) | CC.3 |
| tauceti | [`TauCeti.Module.Dual.baseChangeEvaluationEquiv`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/LinearAlgebra/Dual/BaseChange.lean#L109) | CC.3 |
| mathlib | [`Topology.RelCWComplex`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/CWComplex/Classical/Basic.lean#L99) | CC.4 |
| mathlib | [`SSet.chainComplex`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicTopology/SimplicialSet/Homology/Basic.lean#L76) | CC.4 |
| tauceti | [`AbstractSimplicialComplex.Realization`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicTopology/SimplicialComplex/Realization.lean#L67) | CC.4 |
| mathlib | [`AlgebraicTopology.singularChainComplexFunctor`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicTopology/SingularHomology/Basic.lean#L36) | CC.4 |
| mathlib | [`CategoryTheory.ProjectiveResolution`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Preadditive/Projective/Resolution.lean#L41) | CC.4 |
| mathlib | [`CochainComplex.IsKProjective`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Homology/HomotopyCategory/KProjective.lean#L42) | CC.4 |
| tauceti | [`TauCeti.ExactStructure.FiniteResolution`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/CategoryTheory/Exact/Resolution.lean#L128) | CC.4 |
| mathlib | [`groupHomologyIsoTor`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Homological/GroupHomology/Basic.lean#L250) | CC.4 |
| mathlib | [`Rep.Tor`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Homological/GroupHomology/Basic.lean#L99) | CC.4 |
| mathlib | [`groupHomology.indIso`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Homological/GroupHomology/Shapiro.lean#L66) | CC.4 |
| mathlib | [`Representation.Coinvariants`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Coinvariants.lean#L57) | CC.4 |
| mathlib | [`MvPowerSeries.isNoetherianRing`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/MvPowerSeries/Equiv.lean#L225) | CC.5 |
| tauceti | [`TauCeti.proPFrattini_eq_topologicalClosure`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Topology/Algebra/Group/Profinite/ProP/Frattini.lean#L201) | CC.5 |
| tauceti | [`TauCeti.IsTopologicallyFinitelyGenerated`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Topology/Algebra/Group/Generation.lean#L57) | CC.5 |
| mathlib | [`surjective_of_mkQ_comp_surjective`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/AdicCompletion/Functoriality.lean#L448) | CC.5 |
| tauceti | [`Representation.isOpen_ker_of_finite`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/GaloisLattice/FiniteQuotient.lean#L55) | CC.5 |
| mathlib | [`groupCohomology.H1InfRes_exact`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Homological/GroupCohomology/Functoriality.lean#L393) | CC.6 |
| tauceti | [`TauCeti.ContCohomology.explicitInfRes_exact`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/Inflation.lean#L336) | CC.6 |
| mathlib | [`CategoryTheory.SpectralSequence`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Homology/SpectralSequence/Basic.lean#L37) | CC.6 |
| mathlib | [`CategoryTheory.Abelian.SpectralObject.spectralSequence`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Homology/SpectralObject/SpectralSequence.lean#L481) | CC.6 |
| mathlib | [`continuousCohomology`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Homological/ContCohomology/Basic.lean#L131) | CC.6 |
| mathlib | [`ContinuousCohomology.map`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Homological/ContCohomology/Functoriality.lean#L148) | CC.6 |
| tauceti | [`TauCeti.ContCohomology.explicitFiniteQuotientColimit1`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/FiniteQuotient/Colimit.lean#L493) | CC.6 |
| tauceti | [`Representation.symmetricPower`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/SymmetricPower.lean#L47) | CC.6 |
| tauceti | [`TauCeti.Comodule.basePointsRepresentation`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/AlgebraicGroup/Representation/PointsAction.lean#L88) | CC.6 |
| mathlib | [`DerivedCategory.triangleOfSES_distinguished`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Homology/DerivedCategory/ShortExact.lean#L92) | CC.7 |
| mathlib | [`CategoryTheory.ShortComplex.ShortExact.δ`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Homology/HomologySequence.lean#L289) | CC.7 |
| tauceti | [`TopPair.singularHomologyδ`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicTopology/Singular/Relative.lean#L239) | CC.7 |
| mathlib | [`CongruenceSubgroup.Gamma`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/ModularForms/CongruenceSubgroups.lean#L41) | CC.8 |
| tauceti | [`HeckeRing.GL2.heckeRingHomCuspCharSpace`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/ModularForms/HeckeSlash/Nebentypus/Action.lean#L393) | CC.8 |
| mathlib | [`Localization.AtPrime`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Localization/AtPrime/Basic.lean#L57) | CC.8 |
| mathlib | [`RestrictedProduct.locallyCompactSpace_of_group`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Algebra/RestrictedProduct/TopologicalSpace.lean#L621) | R16.1 |
| tauceti | [`IsDedekindDomain.HeightOneSpectrum.isNonarchimedeanLocalField_adicCompletion`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RingTheory/DedekindDomain/AdicValuation/ValuativeRel.lean#L143) | R16.1 |
| mathlib | [`NumberField.InfiniteAdeleRing.locallyCompactSpace`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/NumberField/InfiniteAdeleRing.lean#L70) | R16.1 |
| mathlib | [`RestrictedProduct.unitsEquiv`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Algebra/RestrictedProduct/Units.lean#L84) | R16.1 |
| mathlib | [`Submonoid.units_isCompact`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Algebra/Group/Units.lean#L133) | R16.1 |
| tauceti | [`TauCeti.Matrix.isCompact_unitaryGroup`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Topology/Algebra/UnitaryGroup.lean#L80) | R16.1 |
| tauceti | [`Matrix.exists_smith_normal_form_of_det_pos`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/LinearAlgebra/Matrix/SmithNormalForm.lean#L721) | R16.1 |
| mathlib | [`CongruenceSubgroup.Gamma0`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/ModularForms/CongruenceSubgroups.lean#L79) | R16.1 |
| mathlib | [`UpperHalfPlane.toSL2R`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Complex/UpperHalfPlane/MoebiusAction.lean#L348) | R16.1 |
| mathlib | [`MeasureTheory.Measure.haar`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/MeasureTheory/Measure/Haar/Basic.lean#L584) | R16.1 |
| mathlib | [`MeasureTheory.QuotientMeasureEqMeasurePreimage.haarMeasure_quotient`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/MeasureTheory/Measure/Haar/Quotient.lean#L222) | R16.1 |
| mathlib | [`ModularForm`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/ModularForms/Basic.lean#L74) | R16.1 |
| tauceti | [`cuspFormCharSpace`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/ModularForms/DiamondOperators.lean#L279) | R16.1 |
| tauceti | [`Matrix.SpecialLinearGroup.map_intCast_zmod_surjective`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/LinearAlgebra/Matrix/SpecialLinearGroup/Basic.lean#L428) | R16.1 |
| tauceti | [`TauCeti.simple_GL2PrincipalSeries_iff`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/CharacterTable/GL2/PrincipalSeries/Irreducible.lean#L269) | R16.2 |
| tauceti | [`TauCeti.nonempty_iso_GL2PrincipalSeries_self`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/CharacterTable/GL2/Boundary.lean#L135) | R16.2 |
| tauceti | [`TauCeti.GL2SteinbergTwist`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/CharacterTable/GL2/Linear.lean#L203) | R16.2 |
| tauceti | [`TauCeti.isCompl_cuspFormsOld_cuspFormsNew`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/ModularForms/Newforms/Basic.lean#L247) | R16.2 |
| tauceti | [`HeckeRing.GL2.Newform`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean#L102) | R16.2, R16.6 |
| tauceti | [`TauCeti.mem_cuspFormsOld_of_forall_coprime_qExpansion_coeff_eq_zero`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/ModularForms/Newforms/MainLemma.lean#L178) | R16.2 |
| tauceti | [`TauCeti.exists_cuspForm_mem_cuspFormCharSpace_or_eq_zero`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/ModularForms/ConductorDichotomy.lean#L262) | R16.2 |
| tauceti | [`TauCeti.Nat.IsExactDivisor.isCompl_eigenspace_normalizedAtkinLehnerOperatorCusp`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/ModularForms/AtkinLehner/Normalized.lean#L483) | R16.2 |
| tauceti | [`TauCeti.NumberFieldArithmetic.artinHomAway`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/NumberField/Ideal/ArtinMap.lean#L175) | R16.3 |
| mathlib | [`Ideal.inertia`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Ideal/Defs.lean#L154) | R16.3 |
| tauceti | [`TauCeti.Place.ramificationGroup`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/FieldTheory/FunctionField/Place/Extension/RamificationGroup.lean#L109) | R16.3 |
| mathlib | [`PiTensorProduct`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/PiTensorProduct/Basic.lean#L103) | R16.4 |
| tauceti | [`HeckeRing.GL2.exists_eq_smul_of_forall_prime_heckeRingHomCusp_of_mem_cuspFormsNew`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/ModularForms/Newforms/MultiplicityOne.lean#L102) | R16.4 |
| tauceti | [`HeckeRing.GL2.Newform.eq_of_forall_notMem_eigenvalue_eq`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/ModularForms/Newforms/StrongMultiplicityOne.lean#L87) | R16.4, R17.3 |
| tauceti | [`HeckeRing.GL2.Newform.eq_of_forall_notMem_qExpansion_coeff_eq`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/ModularForms/Newforms/StrongMultiplicityOne.lean#L115) | R16.4 |
| tauceti | [`HeckeRing.GL2.EigenformAwayFromLevel.eigenvalue_eq_of_forall_notMem`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/ModularForms/Newforms/EigenvalueExtension.lean#L62) | R16.4 |
| tauceti | [`HeckeRing.GL2.EigenformAwayFromLevel.chi_eq_of_forall_prime_and_sq_eigenvalue_eq`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/ModularForms/Newforms/RingEigenvalue.lean#L188) | R16.4 |
| tauceti | [`TauCeti.ModularForm.mvPolynomialEquivModularForms`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/ModularForms/LevelOne/GradedRing.lean#L746) | R16.4 |
| mathlib | [`UpperHalfPlane.hasSum_qExpansion`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/ModularForms/QExpansion.lean#L185) | R16.5 |
| mathlib | [`ModularForm.hasSum_qExpansion`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/ModularForms/QExpansion.lean#L723) | R16.5 |
| mathlib | [`UpperHalfPlane.qExpansion_coeff_eq_intervalIntegral`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/ModularForms/QExpansion.lean#L315) | R16.5 |
| mathlib | [`CuspForm.Λ_eq_mellin`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/ModularForms/LFunction.lean#L178) | R16.5 |
| mathlib | [`CuspForm.hasSum_L`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/ModularForms/LFunction.lean#L195) | R16.5 |
| mathlib | [`LSeries.eq_of_LSeries_eventually_eq`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/LSeries/Injectivity.lean#L218) | R16.5 |
| tauceti | [`UpperHalfPlane.resToImagAxis_slash_S`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/ModularForms/ResToImagAxis.lean#L42) | R16.5 |
| mathlib | [`ModularForm.Λ`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/ModularForms/LFunction.lean#L91) | R16.5 |
| tauceti | [`CuspForm.hasEntireExtension_qExpansion_coeff`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/ModularForms/LFunction.lean#L131) | R16.5 |
| tauceti | [`HeckeRing.GL2.heckeTCuspNat`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/ModularForms/HeckeSlash/Operators.lean#L89) | R16.6 |
| tauceti | [`HeckeRing.GL2.IsEigenformAwayFromLevel`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/ModularForms/Eigenform.lean#L65) | R16.6 |
| tauceti | [`TauCeti.symPowerRep`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/ClassicalGroups/SymmetricPower.lean#L59) | R16.6 |
| tauceti | [`TauCeti.detPowerRep`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/ClassicalGroups/Determinant.lean#L44) | R16.6 |
| tauceti | [`TauCeti.DominantWeight`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/ClassicalGroups/DominantWeight.lean#L71) | R16.6 |
| tauceti | [`TauCeti.SU2.exists_nonempty_equiv_symPower`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/SU2/Exhaustion.lean#L280) | R16.6 |
| mathlib | [`cyclotomicCharacter`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/Cyclotomic/CyclotomicCharacter.lean#L307) | R16.6 |
| tauceti | [`TauCeti.character_GL2SteinbergTwist_gl2NonSplitTorusHom`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/CharacterTable/GL2/Linear.lean#L277) | R17.1 |
| tauceti | [`TauCeti.GL2NonSplitTorus.isConj_gl2NonSplitTorusHom_iff`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/ConjugacyClasses.lean#L214) | R17.1 |
| mathlib | [`Matrix.GeneralLinearGroup.IsElliptic`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/FinTwo.lean#L221) | R17.1 |
| mathlib | [`QuaternionAlgebra`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Quaternion.lean#L65) | R17.1 |
| tauceti | [`QuaternionAlgebra.normForm`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/Quaternion/NormForm.lean#L72) | R17.1 |
| tauceti | [`TauCeti.QuaternionAlgebra.oneEquivMatrix`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/Quaternion/Split.lean#L139) | R17.1 |
| tauceti | [`TauCeti.BrauerGroup.exists_eq_mk_centralDivisionRing`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/BrauerGroup/Division.lean#L69) | R17.1 |
| tauceti | [`TauCeti.Quaternion.brauerGroupMulEquiv`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/BrauerGroup/Real.lean#L102) | R17.1 |
| tauceti | [`TauCeti.indClassFun_eq_sum_of_smul_eq_self_mem`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Induction/ClassFunction.lean#L194) | R17.2 |
| tauceti | [`TauCeti.conjClassesGLFinTwoEquiv`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/ConjugacyClasses.lean#L326) | R17.2 |
| tauceti | [`TauCeti.isConj_iff_of_notMem_range_scalar`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/ConjugacyClasses.lean#L182) | R17.2 |
| mathlib | [`legendreSym.quadratic_reciprocity`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/LegendreSymbol/QuadraticReciprocity.lean#L107) | R17.3 |
| mathlib | [`NumberField.prod_abs_eq_one`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/NumberField/ProductFormula.lean#L98) | R17.3 |
| tauceti | [`TauCeti.GlobalNumberFields.finprod_normalizedAbsValue_eq_one`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/NumberField/Global/Places/Basic.lean#L209) | R17.3 |
| mathlib | [`Quaternion.instDivisionRing`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Quaternion.lean#L1170) | R17.3 |
| tauceti | [`TauCeti.Quaternion.isEmpty_algEquiv_matrix`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/Central/Quaternion.lean#L181) | R17.3 |
| tauceti | [`FDRep.clifford_restrict_iso`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Induction/Clifford/Equivalence.lean#L281) | R17.4 |
| tauceti | [`TauCeti.character_indFDRep_eq_zero_of_notMem_of_index_two`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Induction/IndexTwo.lean#L57) | R17.4 |
| tauceti | [`TauCeti.character_GL2PrincipalSeries_mul_eq_mul`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/CharacterTable/GL2/PrincipalSeries/Twist.lean#L58) | R17.4 |
| tauceti | [`FDRep.clifford_restrict_inertia_eq_top_of_coprime`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Induction/Clifford/Dimension.lean#L95) | R17.4 |
| tauceti | [`TauCeti.inertia`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Induction/Inertia.lean#L83) | R17.4 |
| tauceti | [`TauCeti.simple_indFDRep_ofLinearCharacter_iff`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Induction/Mackey/LinearCharacter.lean#L105) | R17.5 |
| tauceti | [`TauCeti.simple_indFDRep_ofLinearCharacter_dihedralRotations_iff`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Induction/Mackey/Dihedral.lean#L102) | R17.5 |
| mathlib | [`jacobiTheta_S_smul`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/ModularForms/JacobiTheta/OneVariable.lean#L43) | R17.5 |
| tauceti | [`TauCeti.GlobalNumberFields.RayClassGroup`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/NumberField/Global/RayClass/Basic.lean#L180) | R17.5 |
| mathlib | [`ADEInequality.classification`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/ADEInequality.lean#L231) | R17.5 |
| tauceti | [`TauCeti.simple_indFDRep_ofLinearCharacter_alternatingGroup`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Induction/Clifford/Alternating.lean#L94) | R17.5 |
| tauceti | [`TauCeti.schurMultiplier`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/ProjectiveRepresentation/SchurMultiplier.lean#L148) | R17.5 |
| tauceti | [`TauCeti.IsProjectiveRep.cohomologyClass_eq_zero_iff`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/ProjectiveRepresentation/SchurMultiplier.lean#L295) | R17.5 |
| tauceti | [`TauCeti.isProjectiveRepEquivExtensionHom`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/ProjectiveRepresentation/Extension.lean#L339) | R17.5 |
| tauceti | [`TauCeti.ContCohomology.exists_explicitInfl2_eq`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/FiniteQuotient/DegreeTwoDescent.lean#L108) | R17.5 |
| tauceti | [`TauCeti.Matrix.GeneralLinearGroup.not_isSolvable_fin_two`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/Solvable.lean#L36) | R17.5, R17.6 |
| tauceti | [`TauCeti.natCard_GL_fin_two`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/Card.lean#L43) | R17.6 |
| tauceti | [`TauCeti.Representation.isSemisimpleRepresentation_comp_subtype`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Induction/Clifford/Basic.lean#L325) | R17.6 |
| tauceti | [`TauCeti.clifford_restrict_character`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Induction/Clifford/Decomposition.lean#L274) | R17.6 |
| tauceti | [`Representation.finrank_intertwiningMap_baseChange`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/BaseChange.lean#L335) | R17.6 |
| mathlib | [`Polynomial.Gal.galActionHom_bijective_of_prime_degree'`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Complex/Polynomial/Basic.lean#L155) | HB.10 |
| tauceti | [`TauCeti.Multiquadratic.finrank_adjoin_I_sqrt_neg_three_sqrt_neg_seven`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/Multiquadratic/MinusTwentyOne/Examples.lean#L147) | HB.10 |
| mathlib | [`eulerFunction_eq_tprod`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Combinatorics/Enumerative/Pentagonal/EulerFunction.lean#L134) | HB.10, HB.4 |
| mathlib | [`PowerSeries.coeff_prod_one_sub_X_pow_eventually_eq`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Combinatorics/Enumerative/Pentagonal/PowerSeries.lean#L169) | HB.10 |
| mathlib | [`Nat.Partition.card_odds_eq_card_distincts`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Combinatorics/Enumerative/Partition/Glaisher.lean#L158) | HB.10 |
| tauceti | [`TauCeti.TemperleyLieb.jones`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/KnotTheory/TemperleyLieb.lean#L107) | HB.10 |
| tauceti | [`TauCeti.KnotTheory.alexander`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/KnotTheory/Alexander.lean#L312) | HB.10 |
| mathlib | [`StrictConvexOn.eq_of_isMinOn`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Convex/Function.lean#L1102) | HB.3 |
| mathlib | [`Continuous.exists_forall_le`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Order/Compact.lean#L286) | HB.3 |
| mathlib | [`IsLocalMin.fderiv_eq_zero`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Calculus/LocalExtr/Basic.lean#L181) | HB.3 |
| mathlib | [`MvPolynomial.vanishingIdeal_zeroLocus_eq_radical`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Nullstellensatz.lean#L172) | HB.3 |
| mathlib | [`finite_of_finite_type_of_isJacobsonRing`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Jacobson/Ring.lean#L676) | HB.3 |
| mathlib | [`IsAlgebraic.of_finite`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Algebraic/Integral.lean#L100) | HB.3 |
| mathlib | [`exteriorPower.ιMulti`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/ExteriorPower/Basic.lean#L56) | HB.3 |
| mathlib | [`ExteriorAlgebra.ι_add_mul_swap`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/ExteriorAlgebra/Basic.lean#L247) | HB.3 |
| tauceti | [`TauCeti.tensorSquareEquivSymmetricExterior`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/LinearAlgebra/TensorSquare.lean#L330) | HB.3 |
| mathlib | [`NumberField.InfinitePlace`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/NumberField/InfinitePlace/Basic.lean#L57) | HB.3 |
| mathlib | [`NumberField.Embeddings.range_eval_eq_rootSet_minpoly`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/NumberField/InfinitePlace/Embeddings.lean#L79) | HB.3 |
| mathlib | [`Complex.hasSum_taylorSeries_neg_log`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/SpecialFunctions/Complex/LogBounds.lean#L281) | HB.3 |
| mathlib | [`hasSum_zeta_two`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/ZetaValues.lean#L453) | HB.3 |
| mathlib | [`ModularForm.multipliable_one_sub_pow`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/ModularForms/DedekindEta.lean#L66) | HB.4 |
| mathlib | [`multipliable_one_sub_of_summable`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/SpecialFunctions/Log/Summable.lean#L199) | HB.4 |
| mathlib | [`ModularForm.eta`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/ModularForms/DedekindEta.lean#L60) | HB.4 |
| mathlib | [`Complex.tsum_exp_neg_quadratic`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/SpecialFunctions/Gaussian/PoissonSummation.lean#L86) | HB.4 |
| mathlib | [`hasSum_eulerFunction_pentagonal`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Combinatorics/Enumerative/Pentagonal/EulerFunction.lean#L114) | HB.4 |
| tauceti | [`TauCeti.multivariateGaussian_eq_withDensity`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Probability/Distributions/Gaussian/Density.lean#L166) | HB.4 |
| mathlib | [`GaussianFourier.integral_cexp_neg_sum_mul_add`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/SpecialFunctions/Gaussian/FourierTransform.lean#L276) | HB.4 |
| mathlib | [`Stirling.factorial_isEquivalent_stirling`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/SpecialFunctions/Stirling.lean#L245) | HB.4 |
| mathlib | [`trapezoidal_error_le`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/MeasureTheory/Integral/IntervalIntegral/TrapezoidalRule.lean#L233) | HB.4 |
| mathlib | [`ModularForm.eta_comp_eq_csqrt_I_inv`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/ModularForms/Discriminant.lean#L138) | HB.4 |
| mathlib | [`AddCommGroup.equiv_free_prod_directSum_zmod`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/FiniteAbelian/Basic.lean#L119) | HB.5 |
| mathlib | [`Module.free_of_finite_type_torsion_free'`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/FreeModule/PID.lean#L386) | HB.5 |
| mathlib | [`Int.eq_zero_of_abs_lt_dvd`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Order/Group/Unbundled/Int.lean#L83) | HB.5 |
| mathlib | [`Ideal.iInf_pow_smul_eq_bot_of_isTorsionFree`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Filtration.lean#L451) | HB.5 |
| tauceti | [`TauCeti.rootsOfUnityResidue_injective`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RingTheory/RootsOfUnity/LocalRing.lean#L48) | HB.5 |
| mathlib | [`Subgroup.IsArithmetic`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/ModularForms/ArithmeticSubgroups.lean#L102) | HB.5a |
| mathlib | [`Subgroup.isArithmetic_iff_finiteIndex`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/ModularForms/ArithmeticSubgroups.lean#L108) | HB.5a |
| mathlib | [`CongruenceSubgroup.IsCongruenceSubgroup`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/ModularForms/CongruenceSubgroups.lean#L163) | HB.5a |
| mathlib | [`IsCusp`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/ModularForms/Cusps.lean#L58) | HB.5a |
| mathlib | [`isCusp_SL2Z_iff`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/ModularForms/Cusps.lean#L116) | HB.5a |
| mathlib | [`OnePoint.exists_mem_SL2`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/ModularForms/Cusps.lean#L33) | HB.5a |
| mathlib | [`CuspOrbits`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/ModularForms/Cusps.lean#L168) | HB.5a |
| tauceti | [`TauCeti.ModularForm.cuspTranslationOrbitWidth`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/ModularForms/Norm/Cusps.lean#L148) | HB.5a |
| mathlib | [`SlashInvariantForm`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/ModularForms/SlashInvariantForms.lean#L34) | HB.5a |
| mathlib | [`meromorphicOrderAt`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Meromorphic/Order.lean#L50) | HB.5a |
| tauceti | [`TauCeti.qExpansionOrderAtCusp`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/ModularForms/Order/AtCusp.lean#L61) | HB.5a |
| mathlib | [`ModularForm.eq_const_of_weight_zero`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/ModularForms/NormTrace.lean#L164) | HB.5a |
| mathlib | [`Function.Periodic.qParam`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Complex/Periodic.lean#L40) | HB.5a |
| mathlib | [`OnePoint.IsZeroAt.smul_iff`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/ModularForms/BoundedAtCusp.lean#L62) | HB.5a |
| mathlib | [`UpperHalfPlane.qExpansion`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/ModularForms/QExpansion.lean#L162) | HB.5a |
| tauceti | [`TauCeti.ModularForm.orderAtCuspTranslationOrbit`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/ModularForms/Norm/Cusps.lean#L338) | HB.5a |
| mathlib | [`UpperHalfPlane.exp_decay_sub_atImInfty`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/ModularForms/QExpansion.lean#L345) | HB.5a |
| tauceti | [`TauCeti.UpperHalfPlane.cuspFunction_isBigO_pow_of_qExpansion_coeff_eq_zero`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/ModularForms/QExpansion/BigO.lean#L70) | HB.5a |
| mathlib | [`MeromorphicAt.tendsto_nhds_meromorphicTrailingCoeffAt`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Meromorphic/TrailingCoefficient.lean#L118) | HB.5a |
| mathlib | [`tendsto_cobounded_iff_meromorphicOrderAt_neg`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Meromorphic/Order.lean#L234) | HB.5a |
| mathlib | [`MvPowerSeries.WithPiTopology.multipliable_one_add_of_tendsto_weightedOrder_atTop_nhds_top`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/MvPowerSeries/PiTopology.lean#L351) | HB.8 |
| mathlib | [`Nat.Partition.hasProd_genFun`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Combinatorics/Enumerative/Partition/GenFun.lean#L170) | HB.8 |
| mathlib | [`PowerSeries.logOf`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/PowerSeries/Log.lean#L96) | HB.8 |
| mathlib | [`PowerSeries.binomialSeries`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/PowerSeries/Binomial.lean#L47) | HB.8 |
| mathlib | [`ArithmeticFunction.sum_eq_iff_sum_mul_moebius_eq`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/ArithmeticFunction/Moebius.lean#L236) | HB.8 |
| mathlib | [`MvPowerSeries.rescale`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/MvPowerSeries/Substitution.lean#L634) | HB.8 |
| tauceti | [`PowerSeries.eq_zero_of_self_eq_mul_self`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RingTheory/PowerSeries/Order.lean#L50) | HB.8 |
| mathlib | [`LaurentPolynomial`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Polynomial/Laurent.lean#L84) | HB.8 |
| mathlib | [`Polynomial.prod_cyclotomic_eq_X_pow_sub_one`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Polynomial/Cyclotomic/Basic.lean#L338) | HB.8 |
| mathlib | [`Polynomial.cyclotomic.isCoprime_rat`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Polynomial/Cyclotomic/Roots.lean#L196) | HB.8 |
| mathlib | [`dvd_sub_pow_of_dvd_sub`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/Basic.lean#L32) | HB.9 |
| mathlib | [`MvPowerSeries.map_frobenius_expand`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/MvPowerSeries/Expand.lean#L233) | HB.9 |
| mathlib | [`WittVector.ghostMap.bijective_of_invertible`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/WittVector/Basic.lean#L336) | HB.9 |
| mathlib | [`wittStructureInt_existsUnique`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/WittVector/StructurePolynomial.lean#L317) | HB.9 |
| tauceti | [`TauCeti.Cyclotomic`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RingTheory/Cyclotomic/Basic.lean#L46) | HB.9 |

The two additional positive declarations for finding 2 are linked in that finding. Other search leads were inspected only as candidates; no uncited source-search hit is being promoted to a proved endpoint.

## Validation

`python3 scripts/check_redteam.py research/blueprint/redteam/RT-AUDIT-14.result.json` passed. The JSON/Markdown finding IDs, census and inventory were cross-checked. Publication checks restrict the change to the two issue-authorized deliverables and reject concurrent edits. No suggested Lean file belongs to this issue, so Lean compilation is not applicable.

