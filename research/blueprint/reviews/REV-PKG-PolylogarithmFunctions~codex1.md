# Independent package review: PolylogarithmFunctions

Job: `REV-PKG-PolylogarithmFunctions~codex1` · Issue: #11451  
Reviewer: Codex, session `codex-wBaEgC` · Date: 2026-10-20  
Verdict: **accepted after the corrections in this review**.

The package supplies the analytic polylogarithm theory before Polylogarithms, K3BlochGroups and PeriodsAndSpecialValues. Its seven layers retain the integer-weight classical functions, continuation of the coherent tower, functional equations, all-weight single-valued functions, the Bloch–Wigner five-term relation, interval Rogers theory and quantitative estimates. No algebraic Bloch group, regulator or Tate-thesis theorem is imported or asserted. No unresolved package defect remains from this review; acceptance concerns a roadmap, not a completed formalisation.

## Input and method

The input package was written by Claude Code, session `claude-Q4iaEF`, and merged in #11446. I did not author it. The issue's revision-round boilerplate names an earlier review report and review.json that are absent from the checked-out main; there were consequently no earlier findings available to replay. The actual package and its 45-node packet were reviewed independently. The unrelated Lawrence–Venkatesh subtitle in that boilerplate was not used to determine scope.

I read WORKERS.md, PACKAGE_REVIEW.md, the applicable PROTOCOL.md sections, the expansion source rules and UPSTREAM_GUIDE.md. Form was compared with the atlas ClassFieldTheory example and the current ConformalMapping and BelyiMaps roadmaps, including their Suggested.lean files. The library audit's former Polylogarithms P.1 entry and its nearby analytic consumers were checked. The packet was read without editing it. Every defining formula and theorem was checked for its weight range, branch domain, endpoints, denominators and dependency direction; the adversarial instances below record the main controls.

## Fidelity and dependency coverage

| Packet layer and node suffixes | README destination |
|---|---|
| PF.1: principal, integrability, disc-series, rational-weights, analytic-recursion, conjugation, closed-disc (7) | §§1.1–1.7, respectively; unrestricted continuity at 1 is now explicit in §1.7 |
| PF.2: continuation, loop-generators, monodromy, jump (4) | §§2.1–2.2; Scope and ownership plus the BelyiMaps §5.2/§5.6 supplier contract; §2.3; §2.4 |
| PF.3: distribution, inversion, reflection, abel, continued-identities, dilog-values (6) | §§3.1–3.6; the golden-ratio part of dilog-values is retained in §6.5 after its proof inputs |
| PF.4: bernoulli-parity, single-valued, branch-independence, real-analytic, differential, symmetries, sphere-endpoints, trilogarithm-diagnostics (8) | §§4.1–4.8, respectively |
| PF.5: bloch-wigner, single-valued-two, sixfold, differential, laplacian, positivity, five-term, projective-five-term (8) | §§5.1–5.8, respectively |
| PF.6: rogers, rogers-calculus, rogers-reflection, rogers-pentagon, rogers-values (5) | §§6.1–6.5, respectively |
| PF.7: disc-tail, circle-tail, branch-growth, endpoint-estimates, compact-derivatives, bloch-wigner-logarithmic, global-bounds (7) | §§7.1–7.7, respectively |

The 21 baseline declarations and all 45 nodes remain accounted for. Loop generation is consumed from its existing owner rather than reconstructed. The packet checker reports 7 closed stages, 31 API entries, 22 tests, 27 planets, no requests and no gaps. These counts are bookkeeping evidence, not a mathematical proof.

Two proof cycles were repaired. The golden-ratio values previously appeared in §3.6 with a proof using §6.5, while §6.1 depended on §3.6; §3.6 now gives only its independent values, and §6.5 gives the golden values as a named complex-valued theorem. In §4, symmetry used sphere continuity while sphere continuity used inversion. The revised §4.6 extends identities on U using the already established real analyticity of §4.4, checks the assigned puncture values directly, and uses closed-disc radial limits for distribution at roots of unity. Section 4.7 then uses §4.6 for infinity. Section 2.4 obtains the jump directly from the radial integral, so neither the inversion proof nor the monodromy proof is needed for it.

The only roadmap suppliers are the existing BelyiMaps Layer 5 and ConformalMapping L4 interfaces. Their actual sections were read. The peripheral isomorphism's direction is now explicit: π₁ → FreeGroup sends peripheral classes to free generators; its inverse has the opposite assignment. No upward supplier citation, FoundationsAndLibraryIntegration placeholder or UPSTREAM id remains. Downstream consumer mentions are ownership statements, not prerequisites.

## Source audit

No locator was marked unverified by the input author. I inspected more than the required 15 additional locators, spread across all six cited public texts. The table records the mathematical matches in my own words; it does not reproduce source passages. Page numbers are printed pages.

| Source and inspected locator | Match and action |
|---|---|
| Oesterlé [O93] §1.1, (1)–(3), p. 50 | Series, logarithmic base weight and recursive integration; matches §§1.1, 1.3, 1.5. The repeated radial formula is derived by Fubini. |
| [O93] §1.2, (4), p. 50 | Positive-weight distribution; negative and zero weights are separately justified by their rational series. |
| [O93] §1.3, (5)–(7), p. 51 | Bernoulli inversion, the cut jump and logarithmic growth; the README states the lower boundary convention explicitly. |
| [O93] §1.4, p. 51 | Finite zeta limit at 1 in weights at least 2; the package now gives a full complex-limit proof input. |
| [O93] §2 introduction and §2.1, pp. 51–52 | Cover by path classes and determinations through sections; matches the branch construction. |
| [O93] §2.2, Proposition 1, (8)–(9), p. 53 | Generator monodromy; checked signs against the actual loops and Tau Ceti's inverse-prefix action. |
| [O93] §2.3, remark and (15), p. 54 | Unipotent differential system; corrected the former p. 53/remark-after-(11) locator. |
| [O93] §3.1, (18)–(19), p. 57 | Bernoulli combination and P₂ = iD; corrected its conflation with Zagier's real-valued convention. |
| [O93] §3.2, (23)–(24), p. 58 | Symmetry and endpoint values of the single-valued family, after translating the even-weight codomain. |
| [O93] §3.3, (27)–(28), p. 58 | All-weight differential; the package's directional real differential uses the corresponding scalar parity projection. |
| [O93] §4.1, (29)–(32), p. 59 | Reflection, Abel identity and sixfold symmetries; degeneracies are handled separately under Lean totalisation. |
| [O93] §4.1, (33)–(38), p. 60 | Alternating relation, cross-ratio normalization, permutation signs and five-point form. |
| Zagier [Z07] Part I introduction, p. 5 | Disc definition, recursion and slit-plane continuation. |
| [Z07] Part I §1, pp. 6–7 | Endpoint, midpoint and golden-ratio dilogarithm values; the logarithmic corrections agree after ρ = 1/φ. |
| [Z07] Part I §2, pp. 8–9 | Classical reflection, inversion, distribution and the cyclic organization of five-term arguments. |
| [Z07] Part I §3, pp. 10–11, (3)–(6) | Bloch–Wigner formula, sixfold symmetries, affine and projective five-term identities. |
| [Z07] Part II §1.A, pp. 23–24 | Rogers correction, exact interval reflection and pentagon, midpoint and golden values; no modulo-period identity is substituted for an interval equality. |
| Zagier [Z90] §7, (33)–(35), p. 413 | Real parity projection and Bernoulli coefficients. Its auxiliary Li₀ = −1/2 was distinguished from this roadmap's rational Li₀. |
| [Z90] §7, p. 414 | Even generating transform, continuity, P₂ = D and the exceptional P₁ convention. Corrected the P₂ locator from p. 413 to p. 414. |
| Goncharov [G95] §1.0, (1.1)–(1.2), p. 201 | Recursive classical functions and continuous sphere-valued Bloch–Wigner formula. |
| Goncharov [G00] §4, Proposition 4.1, (28), p. 17; Lemma 4.2, (29)–(32), p. 18 | Single-valued Bernoulli expression, symmetries and distribution, with projection convention translated. |
| Goncharov–Rudenko [GR] §1.1, (1) and following projection, p. 3 | Real single-valued family and weight-two specialization. |
| [GR] §1.1, (3)–(4) and footnote 1, p. 4 | Bracket normalization and cyclic relation. Removed an attribution to a nonexistent remark about a product of brackets; the needed coordinate cancellation is now stated as elementary algebra. |

The following SHA-256 values identify the public PDFs inspected on 2026-10-20; each matches the packet's source inventory. No PDF or extracted source text is included in this submission.

| Source | Public copy | SHA-256 |
|---|---|---|
| Z07 | [author](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/978-3-540-30308-4_1/fulltext.pdf) | `05079cf525c6ba0f0d00b5c0d948bad202d291bc4910149d5d4abbab0515e7a0` |
| Z90 | [author](https://people.mpim-bonn.mpg.de/zagier/files/scanned/PolylogsDedekindZetaAndKTheory/fulltext.pdf) | `96bbb5f616dfac26e28c1da4657b2c5ae9cefa462213279797ccd44b71e1bb19` |
| O93 | [Numdam](https://www.numdam.org/item/SB_1992-1993__35__49_0.pdf) | `5a4afb63044e56a50b1cd76c3de388d64fca2017f495afcbeadb8ff6725fba54` |
| G95 | [author](https://sasha-goncharov.github.io/Advances1995.pdf) | `434fd9093d2e27e96fae240f8f591ca532baa2f9cc7cdfeb8bc087f5235f5344` |
| G00 | [arXiv v1](https://arxiv.org/pdf/math/0003086v1) | `47a616bada4abeaee1672679593e5b69e6d293b2cf98e08de6b726072f9a69ea` |
| GR | [arXiv v5](https://arxiv.org/pdf/1803.08585v5) | `d7694f411ff344af087768a951a871aef6ebd4bbed571af6d6c045560d6ed8df` |

## Adversarial mathematics pass and fixes

| Statements/conventions checked | Instances and result |
|---|---|
| Radial definition and integrability, §§1.1–1.3 | n = 0, 1, 2, −1; z = 0, 1 and real z > 1. The moving logarithmic singularity cannot have the claimed common pointwise majorant. Replaced that argument with a named uniform-integrability target: fixed control near t = 0 and uniformly small logarithmic L¹ mass away from 0. |
| Rational weights, §1.4 | r = 0, 1, 2 give the expected poles of order r+1. Strengthened the Lean numerator condition to p(1) = r!, matching the README instead of only p(1) ≠ 0. |
| Holomorphy, recursion, conjugation and endpoints, §§1.5–1.7 | Derivative at z = 0 is 1 for every integer weight. The total value at the weight-one pole does not give continuity. Qualified the cut-conjugation failure to positive weights; real rational nonpositive weights have no cut jump. Added unrestricted continuity at 1 for n ≥ 2. |
| Tower and its ODE, §§2.1–2.2 | Height N = 0 has only Log; at 3 it is analytic, whereas positive heights are not. Added the initial-germ hypothesis and valid index ranges to the ODE. Named the principal-entry comparison on paths in Ω∩U, which permits logarithm winding and retains the full principal polylogarithm domain. |
| Peripheral action and monodromy, §2.3 | Li₁ changes by −2πi around 1; the upper-minus-lower cut jump is +2πi. The T₁T₀ versus T₀T₁ weight-two difference is +4π². Fixed the inductive monodromy proof's undetermined constants using the shrinking loop at 1 and Log 1 = 0. |
| Jump and inversion, §§2.4, 3.2 | At x = 3, Im Li₂(x) = −π log 3. The radial integral gives the jump independently. Checked n = 1, 2 and nonpositive inversion, including the exceptional constant −1 at weight 0 and exclusion of the interval [0,1]. |
| Distribution and classical identities, §§3.1, 3.3–3.6 | m = 1, m = 2, n = 0 and n < 0 pin integer powers; x = 0, 1 in reflection pin totalisation. Abel's small-domain hypotheses keep every logarithm on a coherent principal branch. Golden values were moved after their pentagon proof inputs. |
| Bernoulli and source normalization, §§4.1–4.2 | c₁ = −1, c₂ = 1/3 and the first two odd even-transform coefficients vanish. At i, Zagier's P₂ is real D(i), Oesterlé's is iD(i). Corrected the codomain conflation and the auxiliary Li₀/weight-one distinction. |
| Branch cancellation and real analyticity, §§4.3–4.4 | Both peripheral generators and their inverses are covered by the even transform; arbitrary words use the BelyiMaps free-group contract. Noncommuting words are not replaced by winding numbers. The canceled function extends across the positive cut. |
| All-weight differential and symmetries, §§4.5–4.8 | n = 2, 3, 4, 5; z = −1, 1, 0 and unit-circle roots. Checked the Li₀ term and real derivative contribution in the last summand. Inversion signs alternate; L₃(−1) = −3ζ(3)/4 and the real derivative of L₃ at 1 is zero. Repaired the symmetry/continuity dependency cycle. |
| D formula, one-form, Laplacian and positivity, §§5.1–5.6 | D(2) = 0 by cancellation, D(i) > 0, D(conj i) < 0. The Laplacian at i is −1. The real-axis boundary and the limit at infinity meet the supplied weak/strong minimum-principle contracts. |
| Three five-term forms, §5.7 | x = y, x = 1, y = 1 and zero inputs were computed with totalised division. The alternating identity needs x,y ≠ 0; the Abel form extends to all finite x,y; the cyclic form keeps xy ≠ 1. The corresponding Li₂ pentagon has a logarithmic defect: at x = y = 1/2 it is log²(3/2). |
| Cross-ratios, §5.8 | Corrected the claim that coincident entries always give 1: r(0,0,1,2) = 1 but r(0,0,0,2) = 0. Both values now form a proved Lean negative control. Distinct projective tuples and finite totalised degeneracies are distinguished. |
| Projective signs, §5.8 | For (0,1,2,i,1+i), the alternating D-sum is numerically zero while the unsigned sum is about 2.85526. Replaced the unreproducible random-tuple value. The bracket is 1−r on distinct tuples; the cyclic bracket cancellation is stated with its own bᵢ notation. |
| Rogers theory, §§6.1–6.5 | R(0) = 0, R(1) = π²/6, R(1/2) = π²/12. The interval pentagon denominators are positive. At x = y = ρ it gives 2R(ρ) = 3R(ρ²); the Li₂ correction is −log²ρ in both golden values. Added the named Lean target. |
| Estimates, §§7.1–7.7 | N = 0 in the geometric bound, N = 1 in the closed-disc tail, n = 1 versus n ≥ 2, and approach from both half-planes. Added Aₙ > 0 to the endpoint statement. Clarified the trilogarithm difference quotient in the endpoint non-example. |

Numerical diagnostics were independent complex-series calculations, not proof certificates: the Fourier truncation error at t = 1, N = 20 was about 1.99·10⁻⁵ (bound 1/20); directional finite differences for L₂ through L₅ at z = 0.3+0.7i agreed with §4.5 to below 7.1·10⁻¹¹; the five-point alternating residual was below 10⁻¹⁵. The analytic arguments and exact hypotheses, rather than these floating-point values, support the verdict.

## Definitions, signatures and library boundaries

Each README definition has a named API and at least three discriminating Checks. The checks distinguish the integral/rational weight cases, tower indexing and branch paths, Bernoulli sign, odd/even projection and endpoints, sphere infinity value, cut cancellation for D, cross-ratio signs/degeneracies and the unshifted Rogers interval normalization. The constructed branch and sphere cross-ratio remain README targets with their checks. Suggested.lean has eight light real-bodied definitions, 67 named theorem targets, 15 proved examples and five library-pinning #checks. No admitted example, sorry'd data definition, computational construction, auxiliary theory chain or option change occurs; there are at most two examples per kept definition. Definitions omitted from Lean are named in its closing comment.

I compared the signatures throughout the file with the prose, including these explicit samples:

| Lean declaration | README and hypothesis check |
|---|---|
| `intervalIntegrable_polylog_integrand` | §1.2; arbitrary k and z, including a cut singularity |
| `hasSum_polylog_of_norm_lt` | §1.3; integer n and strict open-disc hypothesis, integer exponent |
| `exists_polylog_neg_eq_div` | §1.4; r natural, z ≠ 1 and exact p(1) = r! |
| `mul_deriv_polylog_add_one` | §1.5; all integer n, z in Ω, includes z = 0 |
| `continuousAt_polylog_one` | §1.7; n ≥ 2, full neighbourhood rather than closed-disc approach |
| `continuesInside_polylogTower` | §2.1; arbitrary finite height, basepoint 1/2, avoids both punctures |
| `polylogTower_monodromy_one` | §2.3; exact loop, initial germ, index-zero exception, factorial and negative sign |
| `tendsto_polylog_jump` | §2.4; n ≥ 1, x > 1, t → 0 from above and positive jump sign |
| `polylog_distribution` | §3.1; m > 0, all rotated arguments in Ω, integer n−1 exponent |
| `polylog_inversion` | §3.2; n ≥ 1, complement of [0,1], principal Log(−z) |
| `polylog_reflection` | §3.3; all finite z, with the stated total values |
| `singleValued_differential` | §4.5; n ≥ 2, z ≠ 0,1, derivative over ℝ and all tangent vectors |
| `continuous_singleValuedSphere` | §4.7; full OnePoint sphere and n ≥ 2 |
| `laplacian_blochWigner` | §5.5; both denominators excluded, correct Euclidean sign |
| `blochWigner_fiveTerm` | §5.7; x,y ≠ 0 and the exact alternating order |
| `blochWigner_crossRatio_fiveTerm` | §5.8; injective Fin 5 tuple, signs +−+−+ |
| `rogers_pentagon` | §6.4; both variables in (0,1), equality in ℝ |
| `polylog_two_golden` | §6.5; both complex values, same negative logarithmic correction |
| `norm_polylog_sub_partialSum_le` | §7.1; n ≥ 1, 0 ≤ r < 1, N arbitrary |
| `not_differentiableAt_blochWigner_zero` | §7.6; real differentiability on the complex plane, not merely a complex derivative |

Pinned statements were read in Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`: logarithm/Taylor series, meromorphic logarithmic integrability, differentiation under the integral, primitives on discs, identity principles, zeta/exponential-zeta series, Bernoulli polynomial derivative and reflection, Fourier series, connected complements and zero-derivative constancy; continuation uniqueness/concatenation, monodromy/global branches, continuous logarithms, universal-cover action and both minimum principles. The continuation space is the complete finite product Fin (N+1) → ℂ. General library theorems are consumed with their open/connected/compact/nonvanishing hypotheses, not replanned.

For duplication I inspected current TauCetiRoadmap at `0d144d044dacebca17b654695b6f1ad58f159b27`, including Completed and the nine roadmaps newer than the atlas snapshot, and current Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Searches by the series, logarithmic corrections, cross-ratio quotient, functional equations and analytic objects found one removable duplicate: the affine Möbius cross-ratio invariance target. It is now deleted from the §5.8 API and consumed under Scope and ownership from `TauCeti.crossRatio_comp_eq_of_sub_eq_div`, `TauCeti/Algebra/Field/LinearFractional.lean`. Its contract is stronger than a single Möbius calculation: factorized differences over a field, a nonzero scalar and denominators nonzero on the set. This current-library declaration postdates the pin, so no unavailable import was added to Suggested.lean. The finite coordinate definition is retained as the analytic normalization dictionary; the new targets are its sphere extension and D-valued projective identities. No Liₙ, Zagier Lₙ, Bloch–Wigner or Rogers implementation was found in those suppliers.

## Validation and remaining work

- `lean-check` on the final Suggested.lean: exit 0; exactly 67 declaration-uses-`sorry` warnings, no errors or other warnings. All 15 examples are proved. This checks elaboration and those examples, not the admitted theorem targets.
- `python3 scripts/check_blueprint.py research/blueprint/packets/PolylogarithmFunctions.json`: 0 errors, 0 warnings. The packet is unchanged.
- `python3 research/blueprint/intake.py check-files` on the submitted deliverables: 0 problems.
- `git diff --check`: clean.
- README: 118,040 bytes, below the issue's 200 KB limit; Suggested.lean: 575 lines, below 5,000. `metadata.toml` is the unchanged single line `topic = "math.CV"`.

Remaining package corrections: none. The roadmap's theorem targets remain work for formalisation, as intended. The handoff records the supplier wording observation for the maintainer; it is not an unfilled analytic prerequisite.
