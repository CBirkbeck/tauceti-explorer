# Independent fixing review: Gross–Zagier formulas and arithmetic heights

Job `REV-PKG-GrossZagierAndArithmeticHeights~3`, issue #11037. Codex (GPT-6),
session `codex-ngpVoR`, 19 October 2026. I wrote none of the three package
revisions or the preceding fixing job. This is a completed package review.

**Verdict: accepted with the corrections below.** The six interfaces left
unverified by the second review now have directly read public sources for
their statements. Two substantial proof inputs still use the YZZ book; they
are explicit targets, with public restatements of their hypotheses and
conclusions, rather than unassigned prerequisites. This review does not claim
to have read that book or independently verified its proofs.

## Scope and standard

Read WORKERS.md, PACKAGE_REVIEW.md, PROTOCOL.md, the expansion protocol,
UPSTREAM_GUIDE.md, the upstream ordering, the library audit, the two earlier
reviews and the fixing-job handoff. Compared with the current JacobianChallenge
and ArithmeticDirichletSeries roadmaps and their suggested files, and with
the nearby EllipticCurves, ModularForms and ModularCurves material.

Read the mathematical statements and assumptions of all 287 target blocks,
their definition APIs and Checks. The layer counts remain
12, 5, 15, 13, 7, 6, 78, 109, 20, 22. All 85 blocks with explicit definition
APIs have at least three discriminating Checks. No target was dropped, and
the general quaternionic comparison remains in scope.

## Corrections applied

1. **7.4, nonzero degenerate data.** Data (D) alone do not imply a nonzero
   toric contraction: a mismatched local sign makes the toric Hom space zero.
   Added the matching condition Σ(𝔅)=Σ(σ,χ) to item 3, its API, proof outline
   and global reduction, with that zero-Hom instance as a negative control.
   Items 1–2 retain their broader scope.
2. **7.47, projection versus construction.** Added that same hypothesis
   specifically to item 5, which invokes 7.5. Items 1–4 retain their scope.
   Replaced the impossible S′=∅ Check (S′ contains S₁, whose size is at least
   two) by individual good-place vanishing. Added the nearby-algebra witness:
   if the incoherent distinction set differs only at v, B(v) can carry the
   σ-component, so coherent-kernel orthogonality cannot be used unrestrictedly.
3. **6.77, zero and square classes.** A zero central value has no class in
   M_f^×/(M_f^×)². Kept the norm identity at zero, restricted its multiplicative
   square-class consequence to nonzero values, and made the weight-two definite
   setting, nondegenerate pairing and nonzero normalizing factors explicit.
   Added checks at a_K=0, a_K=2 and under e↦2e.
4. **8.17, finite versus completed normalization.** The previous expression
   mixed a finite derivative with incompletely specified completed auxiliary
   values and a curve-volume convention. Replaced it by the explicit
   specialization of CST Theorem 1.5/Special case 2, preserving both of Skinner's
   cases. With c=1, Σ is empty and Σ_D consists of the μ(N,D) common primes;
   solving for the K-relative height gives

   ```text
   height = 2^μ u_K² √|D| / (8π² (f,f))
              · L'_finite(f,K,1) · (f1 ∘ f2^∨)^ι.
   ```

   Specified trivial nebentypus, normalized f, the unramified quadratic
   Steinberg twist, the induced curve morphism, the coefficient-field height
   component and the base field of the height. In the ramified modular case
   a_ℓ=−1 gives CST's test-vector condition for χ=1. The finite trace already
   occurs in CST's numerator: its probability average divides the height by
   h_K². Added checks against 8.15, extra units, the factor at each common
   level prime, averaging, and scaling the polarization or parametrization.
5. **8.15, extra-unit fields.** HE.1's cited CM-pair interface excludes
   D_K=−3,−4, so it cannot supply the two exceptional fields. Pointed to the
   displayed cyclic pair on proper O_c-ideals, keeping stabilizers; at c=1
   this is the owned 0.5 construction. Extra units occur only at c=1.
6. **Classical source numbering.** Corrected the ramified-order displays in
   7.62 to III (9.8)–(9.10); the inert lattice, norm, ideals and norm relation
   in 7.75 to (9.3)–(9.6); the references in 7.84 to (9.5) and (9.7); and
   the ramified model in 7.99 to (9.8)–(9.10). The finite-prime assembly in
   7.102 and 8.6 now cites the actual Propositions (9.2), (9.7), (9.11), as
   Gross–Zagier V §1 does on p.307. Removed the unrelated Conrad Appendix
   (A.9)–(A.10) reference from 7.99; retained Theorem A.20.
7. **Public locators and prose.** Removed the redundant unverified book page
   at 1.1, retaining Conrad's exact public Poincaré-height construction.
   Removed the unverified book-page alternative at 7.25 and the unsupported
   introductory book-page alternatives at 7.5, 7.47 and 8.1. Their precise
   public counterparts remain. Replaced 6.38's inaccessible book/draft
   alternatives by Yuan–Zhang §8.1 and Disegni §§1.9, 5.3, including the
   starred central average and the measure-rescaling factor. Renamed the
   ε(N)=1 weight-two setting as a central-derivative setting. Removed the
   dated supplier-PR status paragraph and merge-status parentheticals.
8. **Suggested.lean.** Its mathematical declarations already have the
   prescribed light shape. Added `bdpRootPeriodTransport` to the closing list
   of README-only definitions. No new carrier, admitted data definition or
   weakened geometric theorem was introduced.

## Six previously unverified interfaces

| Target | Directly read public evidence | Disposition |
| --- | --- | --- |
| 1.1 | Conrad, K/k-trace §9, (9.8), (9.9), Remark 9.9 and Theorem 9.10, pp.33–34 | Field extension, dual adjointness, Poincaré height and full polarization are explicit; removed the unverified book-page alternative. |
| 7.4 | Disegni §6.1, Assumptions 6.1.1–6.1.5, pp.50–51, Lemma 6.1.6 p.51; Yuan–Zhang pp.587, 591; Yuan §1.5 pp.7–8 | Both S¹ inequalities, the full Weil-orbit S² condition, exceptional sets and level conditions are stated. The nonzero-data claim needs the added distinction hypothesis. |
| 7.5 | Disegni, proof after Theorem 8.3.2, p.58 | Nearby coherent terms disappear after pairing with the selected cuspidal constituent, through Tunnell–Saito and Waldspurger; the functions need not be zero. |
| 7.25 | Yuan–Zhang Lemmas 7.4–7.6, pp.592–596, and Lemma 8.7, pp.617–619; Disegni Proposition 8.3.1(1)–(2), p.57 | The explicit good-place formulas have their stated standard-function, ramification and level restrictions. No assertion that a density argument proves bad-place identities. |
| 7.47 | Disegni Proposition 8.3.1(3), p.57 and proof; Yuan–Zhang Lemma 6.1 pp.582–583 and §9.1 pp.624–627 | Deep-level i/j parts are theta series of actual Schwartz functions; the public restatement identifies YZZ Theorem 7.8(4). Pseudo-theta assembly and projection are separately specified. |
| 8.1 | Yuan §1.5 pp.7–8, footnote 7; Disegni Proposition 5.4.3 pp.49–50 and Theorem 8.3.2/proof pp.57–58 | Confirms the factor-two projected identity, strict local assumptions and multiplicity-one extension from nonzero test data. |

The proofs of nonzero degenerate data at S₁ (YZZ Proposition 5.8) and the
deep-level geometric nonsingularity (YZZ Theorem 7.8(4)) are not reproduced in
these public sources. The README identifies those proof boundaries. A source
containing an exact statement is sufficient to source a roadmap target; it
does not make its proof part of the existing library. No cleared or uncleared
private copy of YZZ was used.

## Reproducible random source sample

Used `random.Random(11037).sample(targets, 15)` on the 287 target headings in
README order. These are source/printed pages, with arXiv versions fixed below.
Every listed passage was opened and read.

| Target | Source and locator | Result |
| --- | --- | --- |
| 7.99 | Gross–Zagier III (9.11), p.267; Conrad Theorem A.20, p.162 | Ramified prime sum and stabilizer-weighted count agree; corrected the preceding model's display numbers and removed the unrelated Appendix locator. |
| 6.37 | Gross–Zagier IV Proposition (6.2), pp.297–298 | The two cusp constants and zero Fourier coefficient have the stated logarithmic-growth scope. |
| 7.77 | Yuan–Zhang §9.1, pp.625–627 | Difference is a finite pseudo-theta sum; archimedean and vertical terms retained. |
| 7.3 | Gross–Zagier III §§1–2 pp.255–256, (4.4) p.258, (6.1) pp.259–260 | Actual integral cyclic diagrams, degree fibers and infinitesimal Hom comparison agree. |
| 7.106 | Gross–Zagier II §5, p.252, first display | Self-value orbit term and normalization agree. |
| 6.38 | Yuan–Zhang §8.1, pp.605–607; Disegni §1.9 p.17 and §5.3 p.48 | Correspondence-height kernel and starred integration are sourced explicitly; different torus measures require the recorded rescaling. |
| 7.86 | Yuan–Zhang §9.2(1), pp.627–628 | Diagonal cancellation uses the original quaternionic 𝔧, not the nearby j. |
| 7.8 | Yuan–Zhang §7.5(2), p.594, proof p.595 | Ramified norm shell retains the different correction. |
| 6.77 | Gross–Zagier V §3, p.314, definite-case paragraphs | One-dimensional eigenspace gives a square-class statement only at nonzero projection; fixed that distinction. |
| 2.13 | Yuan, Bigness Appendix A6, p.119 | Real metric descent uses conjugation invariance. |
| 9.17 | BDP Theorem 5.13, p.1137 and Assumption 5.12; Skinner Proposition 2.6.1 and proof, p.14 | Weight-two logarithm specialization retains the full BDP assumptions and the squared Euler multiplier. |
| 5.6 | CST Proposition 2.1 and (2.2), p.14 | Opposite Whittaker characters and the Petersson factorization agree; zero tensors cause no normalized quotient. |
| 7.96 | Gross–Zagier II (5.6), p.251 | The diagonal finite-part constant is λ−2κ in the resolvent normalization used here. |
| 6.44 | Gross–Zagier IV Proposition (3.2), p.277, proof pp.278–279 | Zero coefficient and its two terms match the source's normalization. |
| 7.58 | Gross–Zagier III (4.4), p.258 and §§5–6; announcement (0.3), p.252 | Half Hom count, disjointness and r_A(m)=0 restriction agree. |

Primary public copies read:
[Gross–Zagier](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf),
[Conrad, Gross–Zagier revisited](https://library.slmath.org/books/Book49/files/05conrad.pdf),
[Conrad, K/k-trace](https://math.stanford.edu/~conrad/papers/Kktrace.pdf),
[CST, arXiv v2](https://arxiv.org/abs/1408.1733v2),
[Yuan–Zhang](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf),
[Yuan, modular heights v3](https://arxiv.org/abs/2205.13995v3),
[Disegni v3](https://arxiv.org/abs/1510.02114v3),
[Yuan, Bigness](https://math.berkeley.edu/~yxy/preprints/bigness_and_bogomolov.pdf),
[BDP](https://www.math.mcgill.ca/darmon/pub/Articles/Research/51.BDP1/duke-publishedversion.pdf),
[Skinner v1](https://arxiv.org/abs/1405.7294v1), and the
[YZZ author erratum](https://math.berkeley.edu/~yxy/preprints/erratum-GZSC.pdf).
The erratum's finite-part corrections, especially items 62–63, were checked
against the Green comparison already recorded in 7.16.

## Prerequisites and duplication

Screened all target families by mathematical objects against the provided
current TauCetiRoadmap checkout, commit
`0d144d044dacebca17b654695b6f1ad58f159b27`, its Completed directory, and
current TauCeti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. This includes all
nine roadmaps newer than the atlas snapshot, and Completed ContourIntegration,
EffectiveBounds, OrthogonalL2Bases and RestrictedProducts. Searches included
metrized line/biextension fields, quadratic forms and lattices, duality
pairings, Green operators, lift/deformation conditions, character eigenspaces,
toric matrix coefficients, theta/Whittaker kernels, and bounded moments.

Read the actual close matches: ModularCurves' normalized Poincaré bundle and
§7F ST-1; DifferentialGeometry Layer 9's de Rham integration pairing; quadratic
lattices/Clifford groups; elliptic heights and regulators; and Completed
OrthogonalL2Bases' explicit boundary excluding Laguerre/Jacobi. None supplies
the additional arithmetic height, CM length or toric kernel comparison planned
here. The existing supplier boundaries are retained. **No duplicate target
needed removal in this review.**

Two cited supplier directories were absent from the provided checkout.
Read their actual current main README and Suggested.lean files online at
upstream head `79ff03ab775937a744719a0ebe494621f1f16d95`:
[PadicMeasuresIwasawaAlgebras §2.5](https://github.com/TauCetiProject/TauCetiRoadmap/blob/79ff03ab775937a744719a0ebe494621f1f16d95/TauCetiRoadmap/PadicMeasuresIwasawaAlgebras/README.md)
supplies the complete ultrametric bounded-coefficient inverse Amice transform;
[NewtonPolygons §§6.3–6.4](https://github.com/TauCetiProject/TauCetiRoadmap/blob/79ff03ab775937a744719a0ebe494621f1f16d95/TauCetiRoadmap/NewtonPolygons/README.md)
supplies abstract complete-DVR preparation, μ/λ additivity and the open-disc
zero count without finite residue field. The consequences retained in 9.3
are additional. No repository clone or build was made for those reads.

Read the cited height definitions at pinned TauCeti f790474 and current main:
the pinned definition divides by 2·4ⁿ, the current one by 4ⁿ. Layer 0 explicitly
distinguishes these conventions. Also checked the pinned Mathlib Gammaℂ
normalization used by the derivative signature. The suggested file imports
only Mathlib and does not silently depend on a changed TauCeti height API.

All 287 internal anchors and 693 internal Needs links resolve; the dependency
graph has no cycle or edge to a later layer. All 116 distinct external packet
references resolve to nodes or stages. Transitive external returns found in
Layer 0 go to the earlier 0.5 Artin convention, not to later work. Early HE
imports use its independent ring-class/pair interfaces; later imports may use
the height-normalized construction. There is no `UPSTREAM:` or
`FoundationsAndLibraryIntegration` dependency, or a Tate-thesis theorem target.
At whole-roadmap level GZ and HE interleave; upstream sequencing must respect
the stated target-level supplier boundaries or bundle them.

## Adversarial mathematics pass

The ranges below cover every target, not just the sampled sources. I read
each statement, convention and defining property, checking applicability of
the indicated instances, zero cases, denominators and imported interfaces.
This is a mathematical specification review, not a claim of formal proofs of
the identities.

| Statements covered | Instances and distinctions checked | Result/change |
| --- | --- | --- |
| Opening conventions; 0.1–0.12 | rank zero determinant; torsion; h_x=2h_(O); H/K extension; D=−3,−4; Γℂ(1)=1/π; cyclic order-three character; real λ²=−1 | Height/pairing factors and inverse Artin convention retained; central-derivative label corrected. |
| 1.1–1.5 | zero/torsion; principal elliptic polarization; multiplication by 2; quadratic coefficient extension and trace 2; nondual eigenspaces | Full Poincaré polarization and trace-dual coefficient pairing agree; bilinear extension distinguished from Hermitian self-height. |
| 2.1–2.15 | principal divisor/product formula; genus 0,1 versus g>1; graph bridge/loop; zero divisor; real conjugation; rescaling a tangent | Genus/degree restrictions protect denominators; Green sign and squared versus unsquared metric conventions agree. |
| 3.1–3.13 | zero map excluded from degree ratios; [2] has degree 4 on elliptic curves; cusp/Hodge denominators; p=2,3 exceptional lattices; Manin scalar versus unit | No integral JL or differential saturation inferred from rational comparison; precise suppliers remain. |
| 4.1–4.7 | trivial/incorrect central character; zero toric Hom; split versus division quaternion; normalized pairing with zero denominator; nonoptimal order | Nonvanishing and local test-vector hypotheses retained; used to correct 7.4/7.47. |
| 5.1–5.6 | zero tensor; opposite Whittaker supports; φ↦2φ; local Haar rescaling; one versus two probability averages | Bilinear and measure factors agree; normalized quotients only on nonzero pairing domains. |
| 6.1–6.16 | k=1 versus k=2 projection; p₀,p₁,p₂; p_(2,0)=t²/8 and top r=k−1; t=0 excluded for q-kernel; n=0 ideal count; signed genus divisor | Weight-two logarithmic boundary terms are kept; factorial and inverse-character directions agree. |
| 6.17–6.28 | split norm shell versus inert odd valuation; dyadic different; zero Fourier term; λ=−1; two auxiliary places; proper subspace pseudo-theta support | Wild corrections and shifted Colmez parameter remain explicit; finite part must precede specialization. |
| 6.29–6.48 | N=1, zero lattice vector excluded, convergence half-plane; empty Möbius product; positive/negative Fourier index; zero coefficient | Sources and definitions precede use; 6.38 measure/source dictionary corrected. |
| 6.49–6.68 | one zero factor versus derivative of two; complementary subspace codimension; Fourier constant terms; k=1 Hecke trick; finite-part residue | Global automorphy is used only after local equations; derivative setting renamed. |
| 6.69–6.78 | ε(N)=−1 central value versus ε(N)=1 derivative; a_K=0,2; e↦2e; Petersson linearity | Square-class claim fixed at zero; central value/derivative hypotheses separated. |
| 7.1–7.8 | ordinary lift at t=0 versus π^r; canonical level zero; q=3 quasi-canonical strata; empty Hom fiber; S¹ equality threshold; Fourier translate in S²; ramified shell | Actual Artinian diagrams and nonempty lift strata required; distinction hypothesis added to existence. |
| 7.9–7.16 | split/inert/ramified local place; zero norm summands; diagonal omission; original 𝔧 versus nearby j; λ=−1 and λ→0; nonzero resolvent residue | Archimedean regularizing factor changes the finite part by its derivative times residue; erratum correction retained. |
| 7.17–7.39 | N=1 versus marked distinct cusps; r_A(m)=0 versus common support; tangent rescaling; good inert odd valuation; local ramification; genus-one metric | Good-place identities keep all support/level restrictions; disjoint and regularized symbols not conflated. |
| 7.40–7.63 | b↦−b half counts; m=0 excluded where needed; both norm ideals divisible by ramified prime; residue degree f=2; extra automorphisms; r_x+k=0 | Norm/stabilizer formulas retain their domains; classical equation locators fixed; impossible empty-S′ and unrestricted projection corrected. |
| 7.64–7.89 | compact versus cuspidal boundary; elliptic stabilizers; n=0 boundary separated; common-support eta term; norm congruences and finite count endpoints | Boundary and self-intersection corrections kept; inert/ramified model locators corrected. |
| 7.90–7.109 | r_A(m)=0 prohibits dividing by it; diagonal finite part λ−2κ; split/inert/ramified prime sum; cusp difference torsion; no bad-prime coefficient inference from good primes alone | Intrinsic κ branch retained; finite-prime proposition numbers corrected. |
| 8.1–8.10 | zero invariant pairing; mismatched sign; G trivial, C₂ sign, C₃ primitive character; characteristic dividing group order; finite sum versus average; relative class quotient | Projection and characteristic-zero arithmetic domains explicit; no analytic scalar claimed to lie in the coefficient field. |
| 8.11–8.20 | vanishing local Hom; coefficient embeddings; c=1, μ=0 or 1; u=1,2,3; nonadmissible level; principal elliptic case; λ↦nλ; finite versus completed derivative | General formula retained; 8.15 supplier corrected; 8.17 replaced by an explicit consistent CST specialization with new controls. |
| 9.1–9.6 | e<p−1 versus p=2 boundary; W=0 algebraic subgroup; torsion/product abelian variety; unbounded log(1+T); infinite residue field; Q′=Q²; Tate z=q_E; f_B↦2f_B | Saturation/transcendence/integrality are separate theorems; inverse coordinate scaling and Tate logarithm correction retained. |
| 9.7–9.14 | p=1,a=2; Hasse inequality p>1; ordinary versus p-new multiplier; vanishing root; character-dependent group-like factor; nonunit scalar | Euler nonvanishing has strict p>1; unit normalization and squared measure cannot be inferred from continuity or a single value. |
| 9.15–9.22 | trivial character outside interpolation range; character branch transport; zero Heegner point; eigencomponent versus arbitrary tensor; q=p^f with semilinear Frobenius; vanishing removed Euler factor | Full BDP hypotheses, componentwise nonvanishing input and general-local-field Frobenius convention retained. |

## Lean signature comparison and validation

Suggested.lean is 276 lines: nine light real-bodied definitions, six theorem
signatures with `sorry`, and sixteen proved examples (at most two per kept
definition). No admitted examples, data constructions, auxiliary theorem
chains or fictitious geometric carriers. Every README definition either has
its light declaration or belongs to the closing README-only list.

| Signature checked against README | Scope/convention checked |
| --- | --- |
| `unitIndex` | Rational half of torsion-unit order; arithmetic use imaginary quadratic. |
| `unitIndex_of_imaginaryQuadratic` | Number field, totally complex, degree two; discriminants −3,−4. |
| `completed_derivative_at_central_zero` | N>0, differentiability and central zero; derivative √N/π. |
| `rankinPolynomial` | Binomial coefficient and j! divisor; p₂=1−2t+t²/2. |
| `rankinKernelPolynomial` | (t/2) power and shifted factorial; valid arithmetic range r≤k−1. |
| `chiIsotypic` | Inverse-character kernel intersection for a finite representation. |
| `heegnerFinite` | χ-weighted finite sum; inverse character under the G-action. |
| `heegnerAverage` / `heegnerAverage_isotypic` | Totalized inverse gives zero in bad characteristic; no false projector claim. |
| `heegnerAverage_pairing` | Dual characters and inverse square, with invertible group order. |
| `bdpLFunction` / `bdpLFunction_evaluation` | A supplied normalization unit times the square of a supplied root; ring-map transport. |
| `bdpIncomplete` | Multiplication by supplied finite factors, including a zero factor. |
| `bdpEulerFactor_ne_zero` | Rational p,a, real Hasse inequality and strict p>1. |

Validation completed:

- Final `lean-check` exited 0 at Mathlib
  `082e2d37e8b0463410cdb532e111cd43d5a66174`; six `sorry` warnings only.
  Available memory was 77 GB. No language server, Lake build or cache update.
- `scripts/check_blueprint.py` on the three existing GZ/GZ.0/GZ.8 packets:
  zero errors and zero warnings. Packets are inputs, unchanged by this job.
- Internal anchor/Needs graph and external reference resolution as above.
- Own-word review: no source passage or source-by-source summary added to
  repository deliverables. All source descriptions above are paraphrases.
- Final `intake.py check-files` on the five changed deliverables: zero problems.

## Handoff implications

No uncorrected package defect remains from this review. The private-book
proof boundary is explicit and is not a claim of completed formalization.
The packets retain older formulations because this issue forbids packet
edits; propagate the mathematical fixes through the appropriate later job.
Preserve the exact supplier boundaries when porting, including the GZ/HE
interleaving, and do not reintroduce the mixed-normalization 8.17 constant.
No suspicious instructions were encountered in the source material read.
