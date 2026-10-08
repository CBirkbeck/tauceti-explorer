# Independent review: MP.8 revision 2

Job `REV-MetaplecticAutomorphicForms--MP.8~2`, issue #7075. Reviewer: Codex, session `codex-ua9lQs`, 2026-10-08. I authored neither the original plan nor its revision. Reviewed the packet, suggested Lean file and reader against the previous independent review and revision handoff.

**Accepted after in-place corrections.** This accepts a target-level planning pass. MP.8 remains **planned**, all 85 implementations remain **unchecked**, and the nine named proof/source gaps remain open. The missing proof inputs are explicitly scoped follow-up work, not assertions that those proofs have been checked or implemented. The archived scoped round-4 fix review is preserved; its restriction to the Jacobi ownership finding is respected.

| Item | Result |
|---|---:|
| Nodes verified / corrected / added / unverifiable | 58 / 27 / 0 / 0 |
| Definitions / constructions / lemmas / theorems / comparisons | 16 / 18 / 6 / 41 / 4 |
| API items / proposed tests / planets | 107 / 104 / 6 |
| Baseline declarations confirmed / removed / replaced | 28 / 0 / 0 |
| Supplier requests / recorded gaps | 15 / 9 |
| Source issues confirmed / rejected / newly added | 8 / 0 / 0 |
| Stages planned / closed | 1 / 0 |

## Evidence and previous review requirements

Read all 85 node statements, hypotheses, prerequisites, proof routes, acceptance criteria, API/test sketches and signature boundaries, and the entire suggested Lean file. Checked the reader node by node, including its introduction and supplier, gap, source-issue, baseline and coverage appendices. The original reader revision requirements are satisfied: AF.5 dictionary versus AF.1 smoothing; native Gaussian inputs; corrected gamma cancellation and torus conditions; the signed global divisor and two new repair gaps; original-f versus transformed-cusp coefficients; s-dependent extracted families; the corrected mixed root modulus and unchanged table; all three local exponents and the fixed first beta-difference exponent; N-adapted divisor representatives; and all baseline/request/gap and planet names. The remaining cut-off dependency descriptions and the additional errors found below were corrected in all affected artifacts.

Read the published BFH Inventiones scan, printed pp.543–618, using OCR for prose and rendered pages for delicate formulas, including pp.547,557,559,565,582,592,602. [Public scan](https://wstein.org/papers/bib/bump-friedberg-hoffstein-nonvanishing.pdf), [publisher record](https://link.springer.com/article/10.1007/BF01233440); SHA-256 `d50ad2f11c992591de90f2cea59489ac436cce455e140e6eebf5053f49819f2c`. The [Annals paper](https://annals.math.princeton.edu/1990/131-1/p03), pp.53–127, is a different publication; only its metadata was checked. Its omitted Bessel calculation and the GR, JPSS and Maass proof references remain unread source obligations. No passages or source excerpts were added to the repository.

## Corrections

1. **Whittaker chart.** At (3.2), p.557, κ(X) is the compact factor of `[[0,w],[−w,0]]n(X)`, with `w=[[0,−1],[1,0]]`. The old `diag(w,−w)` has multiplier −1 and is outside the positive group. Corrected the proof route and suggested-file comment.
2. **Jacquet locator.** The homogeneous section is (3.11), p.559. Equation (3.10) is the preceding special-function integral. Corrected the statement, source/use range and suggested-file comment; retained the original normalization.
3. **Nondegenerate test quantifiers.** Proposition 3.12, pp.573–574, is recorded with positive y₂ chosen separately for each sign, as the Lean signature already does. The packet no longer first quantifies one y₂ and then disclaims a common value.
4. **Global divisor hypothesis.** BFH's standing assumptions on p.601 require the scalar matrix coefficient to be divisible by φ₁. Added explicit global divisibility in R_k and positive y₂ to the Fourier/Mellin interchange and polar targets, added direct test-algebra and Novodvorsky-continuation prerequisites to the polar target, and carried `IsBFHMatrixCoefficient` and `HasBFHDivisor` in its Lean signature. The raw transform arguments still need supplier-owned comparison maps; this is documented rather than represented by stored conclusions.
5. **Intertwiner convention.** Distinguished raw standard M from scalar-normalized R=c(s)⁻¹M. The unnormalized constant term and Eisenstein Weyl equation use M; the composition sketch uses R with the stated normalization and contragredient conditions. Corrected the Lean Weyl equation, which had used R while the packet used M. This is a packet/signature correction, not a newly alleged BFH misprint.
6. **Dependency prose.** Replaced 21 descriptions that ended mid-sentence with complete accounts of how the inputs are used. These occur in nodes 13,15,17–19,26–28,30,44,61,66,70,83; no source theorem was strengthened.
7. **Test classifications.** Reclassified ten internal computations/characterisations previously called `compatibility`. Protocol §12 reserves that term for agreement with a native library notion. Kept the actual native Γ₁=Sp₄(ℤ) and diagonal jacobiTheta₂ comparisons. All 34 object nodes still have at least three discriminating tests; no test or API item was removed.

The reader was synchronized with each correction, including its overview, direct dependencies, test kinds and signature boundaries. The top-level review now contains a verdict and individual note for all 85 nodes. The preceding round-4 review is appended to `reviewHistory`, and its source-qualified L2s ownership restriction is retained.

## Baseline, closure and ownership

Confirmed every declaration at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` or Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`, reading the exact statement and ambient hypotheses. The recorded module/name and `provides` boundary are correct for all 28 entries; no citation was removed or replaced. Updated the independent-check records. Particular boundaries: `symplecticGroup` is the native matrix group, not GSp or its cover; `SemidirectProduct` needs an already specified action; the PID basis theorem does not assert ordered Smith divisibility; lower Cholesky factors must be converted to BFH upper factors by reversing coordinates; and `MeromorphicOn` does not supply joint meromorphy on C².

Read nearby upstream CompactGroups and InductionRestriction roadmaps; the actual ModularForms layers 2,4,6,7; AF.1 smooth/compact-convolution and AF.5 GL₂ dictionary contracts; AL.3 local integrals, poles, boundary nonvanishing and motivic/unitary shifts; AS.1 induction/convergence and AS.2 raw/normalized intertwiner, continuation and residue contracts; MP.0–8, GN.0, GL₂ R16.2 and the QM.1, BSD.2 and AutomorphicCongruences L2/L2s consumer scopes. The 15 requests are precise refinements of these interfaces, not claims that the current supplier prose already proves all their cover, ramified or uniformity conditions. Symmetric-square comparison needs the explicitly requested normalization and denominator proof.

The reviewed `AUDIT-15` MP.8 row and pinned-source searches support its absence findings. Native matrices, quadratic forms, theta/Gaussian primitives, Möbius/PID bases and semidirect products are reused. General Jacobi theory is requested once from MP.6; MP.8 supplies its BFH rank-two instance and similitude/cover comparison. Confirmed RT-AREA-automorphic-1/20 with its independent verification and scoped round-4 review: QM.1 consumes MP.6; L2s requests a separately source-qualified unitary instance; an L2 edge does not follow from the nested L2s paragraph. The proposal adds no dependency from the supplier back to its consumers and edits no live roadmap.

Every MP.8 target is represented. The dependency graph terminates in confirmed baseline declarations, same-packet targets, named suppliers or precise gaps. In particular, ramified P-regularity uses an independent arithmetic route before E-regularity; chart divisibility is not substituted for the missing global compact transition; nonzero τ restriction is not substituted for nonzero even pushforward; and scalar slices are not substituted for joint polar meromorphy. The stage is planned rather than closed. No new nodes or orchestrator questions are needed for this review; the nine gaps, 15 requests and signature refinements are the next mathematical work.

## Source issues

All eight existing entries E-MP8-2 through E-MP8-9 are independently **confirmed**, with this job recorded in their `review.by` fields. The packet gives the exact locator, authored problem description, correction and scoped reason. No new source issue is asserted for the packet errors above.

| Entry | Independent check |
|---|---|
| E-MP8-2, p.548 | 2I₄ fixes iI₂ but is not orthogonal; the GSp⁺ stabilizer has a positive scalar factor. |
| E-MP8-3, pp.550–551 | The conductor-M completion and the auxiliary-N transform differ; the level-one weight-12 Fricke example detects the substitution. |
| E-MP8-4, p.568 | The printed one-sided region includes −i, where the explicit divisor coefficient is singular. |
| E-MP8-5, p.602 | The frequency n₂=N⁻¹ and unfolding variable change require TF± at N⁻¹y₂, also matching the boundary terms. |
| E-MP8-6, pp.562,565 | The evaluated inverse gamma factors cancel the first arguments of the corrected two pairs and leave the displayed remaining factors. |
| E-MP8-7, pp.569–570 | At X=diag(0,−2),z=1 the global divisor is −1/√10, while the positive-chart substitution is +1/√10; constant coefficients also refute arbitrary boundary vanishing. |
| E-MP8-8, p.592 | The preceding matrix modulus is α₁β₃δ₂. The concrete corrected congruence has six solutions, versus two for the printed min(a,b). |
| E-MP8-9, p.582 | Period-one symmetric translations identify D modulo CS; the printed NCS quotient repeats each class N³ times. |

Exact-title and DOI searches with erratum/correction, and [Bump's correction links](https://math.stanford.edu/~bump/), located no correction addressing these entries. This is a limited search record, not a priority claim or proof of absence. The original 2,016-case root-table reproduction was inspected and rerun: p=3,d≤3 and p=5,d≤2; m∈{1,2}, r∈{0,1,2}, n₀∈{−5,…,5}, D≠0; applicable N₁/N₂ rows with a≤d+1 and N₃ with a=b+1. Zero mismatches. The preceding review contains its reproduction code. This finite evidence supplements the matrix derivation and proves no general table theorem by itself.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/MetaplecticAutomorphicForms--MP.8.json`: 0 errors, 0 warnings.
- The errata checker passes a scratch-only `errata-v1` wrapper with this packet's eight source issues and source-version record.
- Reader parity checked all 85 statements, hypotheses, proof steps, acceptance lists, direct prerequisites, source locators/matches, uses and signature omissions, all 107 API items and all 104 test statements/kinds. No mismatch; every proposed API/test name occurs in the suggested file.
- Revised `lean-check research/blueprint/suggested/MetaplecticAutomorphicForms--MP.8.lean`: exit 0, zero errors, 316 warnings, all declaration-uses-sorry. Compiled once at a time after checking memory. The Mathlib-only imports use the exact pin; the Tau Ceti declaration was separately read at its pinned git object. Elaboration checks signatures, not proofs or absent supplier interfaces.
- 2,016 finite congruence/table checks: zero mismatches. `git diff --check` passes. Allowed edit paths, complete checked-node coverage, no source excerpt fields and unchanged unchecked implementation statuses were verified.

## Per-node ledger

Each node's precise section, equation and printed-page locator remains in the packet and reader. A verified verdict checks the stated plan and its explicitly recorded boundary; it does not certify an unread external proof or a Lean implementation.

| # | Node | Verdict | Check |
|---:|---|---|---|
| 1 | `fourier-shift` | corrected | Native integral quadratic-form shift has the required two cusp factors; its second-cusp test is a computation, not a library comparison. |
| 2 | `fourier-discriminant` | verified | The invariant retains the full quadratic form 4aQ−c(R·−)²; no positivity is added. |
| 3 | `discriminant-shift` | verified | Expanding the translated quadratic form cancels both mixed and square shift terms. |
| 4 | `residue-shift` | verified | The vector shift changes each residue by a multiple of 2a, for arbitrary integral c. |
| 5 | `recover-quadratic` | verified | Equal vector and discriminant data recover Q by cancelling 4a, using a≠0 over ℤ. |
| 6 | `shift-parameter-injective` | verified | Injectivity of the shift parameter follows by cancelling 2a in the vector coordinate. |
| 7 | `orbit-classification` | verified | The orbit criterion uses both discriminant equality and vector congruence; a≠0 is essential. |
| 8 | `unique-residue-lift` | verified | Congruence supplies an integral shift to the prescribed vector lift; the recovered quadratic form is unique. |
| 9 | `coefficient-invariants` | verified | An orbit-invariant coefficient factors through the two invariants; its analytic application requires the separate contour-shift theorem. |
| 10 | `siegel-space` | verified | Strict symmetric positive-definite imaginary part agrees with native PosDef; the asymmetric and real-matrix tests detect incorrect domains. |
| 11 | `positive-similitudes` | corrected | The positive multiplier and native symplectic restriction are correct; the scalar-action test is reclassified as a computation. |
| 12 | `siegel-action` | corrected | The fractional action and multiplier-divided determinant cocycle fix positive scalars; the scalar test is reclassified. |
| 13 | `similitude-cover` | corrected | Continuous nonzero roots give the double cover; the Fourier lift phase and the positive-scalar splitting remain distinct. Repaired its cut-off use. |
| 14 | `compact-stabilizer` | verified | The Sp stabilizer is U(2); the GSp⁺ stabilizer includes positive scalars. Upper Q with QQᵀ matches the pinned Cholesky boundary. |
| 15 | `arithmetic-subgroup` | corrected | The full lower-left block and two extra entries have the source congruences; native level-one comparison is valid. Repaired three cut-off uses. |
| 16 | `bfh-slash` | verified | The symplectic slash has the inverse-transpose W action and quadratic phase; extension to similitudes requires index transport. |
| 17 | `bfh-translation` | corrected | The translation composition phase is retained and integral on the BFH lattice when N divides m. Repaired its Fourier/carrier uses. |
| 18 | `genus-two-theta` | corrected | The residue theta sum and diagonal jacobiTheta₂ comparison agree with the source. Repaired the projection use and classified negation as characterisation. |
| 19 | `quadratic-matrix` | corrected | Mixed integral polynomial coefficients become half-integral matrix entries; the dictionary is injective. Repaired its three arithmetic/analytic uses. |
| 20 | `fourier-coefficient` | verified | The Fourier extraction retains N^(−3j), both periods and the exponential in Z_g; additive integration has sufficient continuity hypotheses. |
| 21 | `theta-pairing` | verified | The Gaussian pairing has √detY/(2a) and Jacobian detY; the root Gaussian integral is reused with positive parameter. |
| 22 | `coefficient-shift-analytic` | verified | Holomorphy and the elliptic lattice justify the contour shift; the resulting index relation uses the retained integral invariant theorem. |
| 23 | `theta-decomposition` | verified | Finite theta reconstruction uses the pairing and analytic shift, with the cusp-dependent Z and W scales. |
| 24 | `theta-fourier-transform` | verified | Poisson summation gives the 1/(2a) theta Fourier factor and branch positive at iY; residue negation follows on squaring. |
| 25 | `theta-component-fourier-law` | verified | The component Fourier factor is √(−detZ)/(2m), including the N rescaling; both residue phases are retained. |
| 26 | `bfh-jacobi-specialization` | corrected | This is the BFH coordinate instance of MP.6, not a second general Jacobi definition. Repaired the cut-off projection use. |
| 27 | `theta-components` | corrected | Projection is defined before reconstruction, with finite residue indexing and scalar linearity. Repaired the self-referential cut-off description of its reconstruction use. |
| 28 | `theta-coefficient` | corrected | Theta Fourier coefficients vanish for unrepresentable indices and recover B_j for representable U; repaired the truncated dependency account. |
| 29 | `bfh-seed` | corrected | The finite continuous K-type and weight vector are genuine defining inputs, not analytic conclusions; the positive-scalar seed test is a computation. |
| 30 | `induced-seed-family` | corrected | det(Y)^(s/2) uses the positive-base logarithm and gives holomorphic scalar coordinates; repaired its cut-off use in the Eisenstein sum. |
| 31 | `jacobi-eisenstein` | verified | The actual parabolic/arithmetic quotient and lattice sum are specified; inversion identifies native G/H with the required H\G. |
| 32 | `whittaker-functions` | corrected | BFH (3.2), p.557 uses [[0,w],[−w,0]]n(X), not diag(w,−w). Corrected the proof and Lean comment; reclassified the degenerate scaling test. |
| 33 | `whittaker-majorant` | verified | The three sufficient majorant inequalities match Proposition 3.1; no necessity assertion is introduced. |
| 34 | `whittaker-initial-convergence` | verified | Initial integrability requires Re s>2, positive y₁,y₂ and the actual weight-k compact coefficient. |
| 35 | `jacquet-two-parameter` | corrected | Corrected the section locator to (3.11), p.559; π^(−r)Γ(r+k/2) and the initial convergence chamber are retained. The scalar specialisation test is a computation. |
| 36 | `jacquet-r-reflection` | verified | Proposition 3.3 continues V in the stated cone and reflects gamma-normalized W; raw equality is restricted to its convergence chamber. |
| 37 | `jacquet-weyl-reflection` | verified | The corrected gamma pairs cancel the inverse factors on p.565; torus projection loses the original SO(2) weight condition. The GR proof gap remains. |
| 38 | `whittaker-continuation` | verified | Continuation to Re s>3/2 refers to a continued family agreeing with the original integral for Re s>2; the confluent/convolution inputs remain explicit. |
| 39 | `whittaker-rapid-decay` | verified | Nondegenerate rapid decay is polynomial-times-Schwartz uniformly on compact parameter sets; the JPSS input is recorded as an open proof requirement. |
| 40 | `degenerate-whittaker-continuation` | verified | The zero-character function scales as y₁^(4−s) and has only the asserted y₂ decay. The omitted Annals Bessel calculation remains a gap. |
| 41 | `test-coefficient-algebra` | verified | Actual U(2) matrix coefficients, SO(2) weight and the signed global divisor replace an arbitrary chart-polynomial class; density comes from the named supplier. |
| 42 | `test-coefficient-strip` | verified | The bounded imaginary strip avoids ±i and preserves uniform branch control; the printed one-sided region is independently rejected. |
| 43 | `rotated-whittaker-bound` | verified | The actual compact product and signed divisor are retained on both branches; residual compact transition and full-prefactor domination are explicitly unfinished. |
| 44 | `novodvorsky-transform` | corrected | The transform is iterated and uses dy₁/y₁ with its stated power. Repaired the cut-off continuation use without asserting joint Fubini. |
| 45 | `novodvorsky-continuation` | verified | The continued transform domain retains global φ₁ divisibility and separate small/large-tail arguments; the rotated-bound gap is not silently discharged. |
| 46 | `tau-transform` | verified | The τ kernel uses the actual compact product and branch amplitude, distinct from the degenerate W⁰ Mellin term. |
| 47 | `degenerate-mellin-coefficients` | verified | Both boundary Mellin coefficients use exponent 2s−8 and the continued W⁰ family; linearity and holomorphy need explicit domination. |
| 48 | `local-test-nonzero-f` | corrected | Corrected the quantifiers to choose positive y₂ separately for each sign, matching the Lean sketch; τ vanishes identically and φ₁φ₂ divisibility is retained. |
| 49 | `local-test-nonzero-tau` | verified | Nonzero τ requires a nonzero weighted even pushforward; chart nonzeroness alone is insufficient. That finite K-type construction stays an explicit gap. |
| 50 | `local-test-nonzero-m` | verified | Proposition 3.15 is an existential finite K-type residue test, not a seed assumption; its omitted Bessel/test construction is honestly recorded. |
| 51 | `similitude-heisenberg-comparison` | verified | The center scales by the similitude multiplier; MP.6 owns the general Heisenberg/Jacobi object and fixed-character versus index transport is separated. |
| 52 | `full-real-cover` | corrected | The conjugate-root involution gives a chosen split real extension; it does not establish adelic compatibility. Kernel-fixing is a characterisation test. |
| 53 | `arithmetic-adelic-comparison` | verified | MP.4 must supply the rational splitting, finite vector and dyadic lift before the arithmetic/adelic comparison can be typed; the signature omission is explicit. |
| 54 | `theta-levi-transform` | verified | Levi transport preserves the source Γ⁰(N) conditions and transposed residue action; the suggested native statement is an upper-unipotent specialisation. |
| 55 | `theta-unipotent-transforms` | verified | Upper and lower unipotent theta laws keep their divisibility and cover-root conditions; the Lean upper specialisation is explicitly partial. |
| 56 | `coefficient-levi-transform` | verified | Integral quadratic congruence gives yᵀTy, while full B_j/C_j covariance additionally needs the cusp subgroup and residue transport. |
| 57 | `matrix-mobius` | verified | Matrix Möbius uses scalar native Möbius on positive Smith coefficients; pinned PID bases alone do not supply ordered divisibility. |
| 58 | `primitive-symplectic-pairs` | verified | Primitive completion requires full row rank and CDᵀ=DCᵀ. Maass completion and rank-one normal form remain named unread inputs. |
| 59 | `matrix-mobius-divisor-identity` | verified | The finite lattice-divisor sum is zero for a nonunit determinant and one for a unit; it follows from the matrix Möbius product calculation. |
| 60 | `matrix-mobius-inversion` | verified | Möbius inversion retains the symmetric-pair quotient and translation invariance; the N-restricted version needs the stated adapted Hermite representatives. |
| 61 | `finite-exponential-sums` | corrected | Finite cusp sums have the corrected S₀ modulus D mod C. Repaired two cut-off uses while preserving the first-cusp NC quotient. |
| 62 | `fourier-unfolding-kernel` | verified | The kernel keeps (2mN³)⁻¹, QQᵀ, the positive-base logarithm and the R-discriminant cancellation; its full formula matches p.580. |
| 63 | `cusp-one-unfolding` | verified | First-cusp unfolding uses C₁₂≡0 mod N and all C nonsingular, with the original BFH seed rather than arbitrary scalar data. |
| 64 | `cusp-zero-rank-expansion` | verified | Opposite-cusp unfolding retains rank-two, rank-one and rank-zero terms and the N³ rescaling; no premature rank-one cancellation is made. |
| 65 | `whittaker-coefficient-extraction` | verified | Whittaker extraction uses the two actual theta-coefficient families, correct periods/frequencies and the opposite-cusp zero extension. |
| 66 | `bfh-l-dirichlet-series` | corrected | L uses a(n) of the original f. Repaired the cut-off P-comparison and three-exponent local Möbius use; P has distinct transformed cusp data. |
| 67 | `bfh-p-dirichlet-series` | corrected | P uses actual cusp-transformed coefficients, representable indices and residue periodicity; its periodicity test is characterisation, not native compatibility. |
| 68 | `first-cusp-whittaker-expansion` | verified | The first-cusp expansion has the s-dependent coefficient family and original-f series, with the exact n₂, D and exponential factors. |
| 69 | `opposite-cusp-whittaker-expansion` | verified | The opposite cusp keeps N³, σ(w), P and the rank-zero term; elliptic cuspidality kills only the extracted rank-one contribution. |
| 70 | `local-prime-root-counts` | corrected | The mixed modulus is min(a,d); direct enumeration reproduces six versus two in the concrete case. Repaired the cut-off table use. |
| 71 | `local-root-count-table` | verified | The published root table is unchanged with the corrected congruence; 2,016 finite cases reproduce its applicable N₁/N₂ and N₃ rows. |
| 72 | `local-mobius-factors` | verified | The local inverted sums retain all a,b,d exponents and four divisor coefficients; missing divisors contribute zero. |
| 73 | `unramified-euler-factors` | verified | The beta difference fixes the first exponent in S_p(a,a,d)−S_p(a,a−1,d); the unramified Satake factors and omitted bad-prime boundary match §7. |
| 74 | `squarefactor-polynomial-bound` | verified | The squarefactor polynomial bound uses actual finite Dirichlet polynomials and the original newform coefficient bound; raw functions alone are insufficient. |
| 75 | `theta-normal-convergence` | verified | Compact subsets have a uniform positive eigenvalue lower bound giving a summable Gaussian majorant and the needed derivative refinements. |
| 76 | `genuine-induced-comparison` | verified | Root magnitude contributes −1/2 and half-modulus contributes −3/2, yielding ν=s−2 and reflection 4−s; the adelic comparison remains unfinished. |
| 77 | `genuine-eisenstein-initial-convergence` | verified | The actual BFH induction and finite-cover comparison are required before importing AS.1 convergence; the native raw-function sketch flags those missing interfaces. |
| 78 | `genuine-intertwining-operators` | corrected | Separated raw M from scalar-normalized R in the statement, composition API and Lean comment. The unnormalized constant term and Weyl equation use M. |
| 79 | `genuine-constant-term` | verified | The genuine constant term contains the inducing section and long-Weyl raw M; rank-one cancellation needs elliptic cuspidality and the cover-specific comparison. |
| 80 | `genuine-eisenstein-continuation` | corrected | The Lean Weyl equation now uses raw M, matching the packet. Cover continuation, denominator pole control and the independent P input remain open obligations. |
| 81 | `opposite-cusp-zero-regularity` | verified | Ramified P-regularity uses its independent arithmetic route; deriving it from E-regularity and then proving E-regularity from P is explicitly excluded. |
| 82 | `fourier-residue-interchanges` | corrected | Added the p.601 global-divisor hypothesis for the Mellin tails; common denominators and uniform majorants are required before residue/derivative interchange. |
| 83 | `two-variable-twist-series` | corrected | The two signed D series have the exact integer congruence modulus and initial chamber. Repaired their cut-off polar-formula use. |
| 84 | `two-variable-polar-combination` | corrected | Added the p.601 global φ₁ divisor hypothesis, direct test-algebra/continuation prerequisites and native HasBFHDivisor argument. All transform arguments are N⁻¹y₂; joint charts remain required. |
| 85 | `bsd2-export` | verified | The exact incomplete ratios and quotient derivative belong to the analytic export; BSD.2 owns positivity, noncancellation, local selection and infinitude. |
