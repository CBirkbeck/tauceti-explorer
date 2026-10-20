# Handoff: PKG-FunctionFieldArithmetic (issue #10767)

Worker: Claude (Opus 5.5), session `claude-gOlGsn`, 20 October 2026. Refs #10767. This is a complete
package, not a checkpoint. I took no part in the design, the plan or the reviews of this roadmap.

## Deliverables

- `research/blueprint/packages/FunctionFieldArithmetic/README.md` (about 1,770 lines): `**Summary.**`,
  Scope and ownership, Conventions, Exact supplier contracts (Mathlib, Tau Ceti, other roadmaps),
  How to read the build, Layers 0–7 with `### k.n` subsections, `**Checks.**` (three or more per
  definition and target), `### Examples` and `### Dependencies` for every layer, four worked examples,
  Downstream consumers and References.
- `research/blueprint/packages/FunctionFieldArithmetic/Suggested.lean` (272 lines): `import Mathlib`
  plus `TauCeti.FieldTheory.FunctionField.ConstantField` and
  `TauCeti.FieldTheory.FunctionField.RiemannRoch.ClassNumber`; namespace
  `TauCetiRoadmap.FunctionFieldArithmetic`. Real-bodied light definitions: `artinSchreierWitt`
  (`Frob − id` on Mathlib Witt vectors), `aswQuotient`, `effectiveDivisorCount`, `zeta`, `placeCount`,
  `pointCount`, the Prop `IsLPolynomialData`. One proved theorem (`effectiveDivisorCount_zero`), ten
  `sorry`'d milestones (`finite_exact_constants`, `exists_divisor_degree_eq_one`,
  `divisor_degree_surjective`, `zeta_logDeriv`, `pointCount_ratFunc`, `effectiveDivisorCount_of_large`,
  `zeta_rationality`, `IsLPolynomialData.unique`, `lPolynomial_isLPolynomialData`) and eight proved
  `example`s (at most two per definition). No sorry'd data. A closing comment lists, by layer, the
  README targets whose carriers are not at the pins.
- `research/blueprint/packages/FunctionFieldArithmetic/metadata.toml`: `topic = "math.NT"`.

## Checks run

- `lean-check research/blueprint/packages/FunctionFieldArithmetic/Suggested.lean` at Mathlib
  `082e2d37e8` and Tau Ceti `f790474`: exit 0, 9 warnings, all `declaration uses 'sorry'`, no errors,
  no other warnings. File SHA-256 `d270b63968a0a362e85154375de93d9294ad8d7a98eb991a85eb63ac82049466`.
- `python3 research/blueprint/intake.py check-files` on the three package files: 0 problems.
- A Sonnet subagent cross-checked every cross-roadmap citation of the README (section numbers,
  target titles and attributed Lean names) against fetched copies of the upstream READMEs (the PR
  heads of ArithmeticGaloisDuality 567ff2b, AutomorphicLFunctionsAndLocalFactors d1996dc,
  ArithmeticGaloisRepresentations 7223685, DeligneWeightsAndPurity c18e4b5, WeilConjectures daa3895,
  InverseGalois ee4bec5, AutomorphicSpectralTheory 89c7d58, ReductiveGroupsPartII/SmoothRepresentations
  0d37c3f, AdelicAlgebraicGroups 58ecae2, GeometryOfNumbers 01c64f0, Metaplectic 297a40c, and current
  TauCetiRoadmap main 45d7a14 for AlgebraicCurves, ClassFieldTheory, LocalFieldsRamification,
  SchemeAndStackFoundations and EtaleCohomologyFoundations). It found six slips, all fixed: *Restricted
  tensor realizations* sits in AL's Representation prerequisites, not AL.3; the AL.3 title is *The
  `GL(n)` cuspidal Fourier expansion*; EtaleCohomologyFoundations §F.4.4 does not state torsion-freeness
  of `H¹(X_k̄, ℤ₂)` (now derived from the Kummer sequence and the Tate module); AlgebraicCurves 12D and
  Layer 8 pointers reworded to what they state; a vague ClassFieldTheory Layer 1 pointer replaced by
  Mathlib infinite Galois theory.
- Process-word grep of the README (packet, job, review, checkpoint, coverage, request, gap, optional,
  deferred, later): clean. Odd-backtick and odd-emphasis scan: only italic titles that wrap over a line.
- The eleven public sources of the plan that the kept targets rest on were downloaded again and
  their SHA-256 values match the plan's records (Yu, Ciubotaru–Harris, Abdurrahman–Venkatesh,
  Feng–Yun–Zhang, Kosters–Wan, Parshin, Roquette, Harder, BHKT, Yoshida, Hess); the locators taken
  from them were re-read in page-marked text. Milne ADT (README 0.4) and Li–Zhang (README 7.4) keep
  the plan's reviewed locators and were not downloaded again. New locators are listed below.

## Structural decisions (read before reviewing)

The roadmap lies outside the 94 Caraiani–Newton roadmaps, so it may cite all of them; but several of
them now state, in their TauCetiRoadmap pull requests, material that the accepted plan placed in
FA.2, FA.4 and FA.5. A target that exists there is removed here and cited instead.

Removed and cited (the plan node, then the owner that states it):

- FA.2/projective-adeles, FA.2/projective-ideles, FA.2/idele-divisor-exact-sequence,
  FA.2/completed-residue-functional, FA.2/differential-additive-character and the Poisson formula of
  FA.2/adelic-poisson: AutomorphicLFunctionsAndLocalFactors (PR #924) AL.3 *Curve additive analysis*
  and ArithmeticGaloisDuality (PR #858) §R02.3.2 *Function-field places, ideles and S-units*.
- FA.4/function-field-class-formation, FA.4/global-artin-norm-isomorphism,
  FA.4/global-abelian-existence (norm groups are exactly the open finite-index subgroups) and
  FA.4/profinite-reciprocity: ArithmeticGaloisDuality §R02.3.2 *The class formation of a global
  function field* (its `S`-version with `S` all places is the profinite statement). The
  constant-field Frobenius formula of FA.4/global-artin-norm-isomorphism is kept as README 0.2(4).
- FA.4/ray-class-and-generalized-picard and the geometric half of FA.4/global-abelian-existence (the
  GEO-RAY boundary): AutomorphicLFunctionsAndLocalFactors AL.3 *Ramified rank-one curve reciprocity*,
  which constructs `Pic⁰_D`, `Pic¹_D`, the Lang isogeny and the least modulus. The plan's
  request-generalized-picard to SF.3 is therefore no longer needed.
- FA.5/schmidt-degree-one: the statement is ArithmeticGaloisDuality's `ideleDegree_surjective`; README
  0.3 keeps only its divisor form (`exists_divisor_degree_eq_one`, statable at the pins), with the
  Weil-bound proof route of the plan as an alternative proof sketch.
- FA.5/degree-sensitive-chebotarev: ArithmeticGaloisRepresentations (PR #856) §5.13 *Chebotarev for
  function fields* and DeligneWeightsAndPurity (PR #929) §3.7 `finiteCover_degreeChebotarev`.
- FA.5/frobenius-semisimple-determination: ArithmeticGaloisRepresentations §5.13 (recognition).
- FA.5/artin-inertia-factor: ArithmeticGaloisRepresentations §2.5 `GaloisRep.localEulerFactor`
  (any coefficient field, inertia invariants, lift independence); its checks moved to README 5.7.
- FA.3/ramification-import-contract: a list of imports, now in the supplier contracts.
- The curve Weil bound is cited from SchemeAndStackFoundations §5.11 (on main) and
  DeligneWeightsAndPurity §1.6, not from the atlas id EDC.7.

Certificates (maintainer rule: roadmaps state mathematics, not computational certificates):

- FA.1/riemann-roch-basis-certificate removed: its content is Mathlib `Basis` plus AlgebraicCurves
  Layer 3 (`L(A) ≅ L(A′)`, `L(D) = 0` for negative degree, `L(0) = k`).
- FA.1/certified-riemann-roch-computation restated as Layer 1: Hess's two-chart description of `L(D)`
  and the reduced-basis theorem (Hess Proposition 9, Theorem 7, Corollary 11).
- FA.7/l-polynomial-certificate restated as README 5.6 (`IsLPolynomialData` and uniqueness).
- FA.7/certified-place-enumeration removed (AlgebraicCurves Layers 1, 5, 6); FA.7/normalized-completion-
  certificate removed (AlgebraicCurves Layer 9 local expansions; current Tau Ceti
  `Place.completionIntegersEquivPowerSeries`); FA.7/ray-character-conductor-certificate removed (AL.3
  least modulus; wild conductors are README 4.4); the cost model of FA.7/explicit-cost-and-examples
  removed; its four examples are the README's worked examples, recomputed by hand.

Ownership added here (the plan had recorded these as requests to suppliers that do not state them):

- README 6.1, adelic points of affine groups over a function field: AdelicAlgebraicGroups Layer 1 is
  number-field only (PR #792, §1.1 "over a number field"). Sources: Conrad, *Weil and Grothendieck
  approaches to adelic points*, Proposition 2.1 (p. 2), Example 2.3 (p. 3), Theorem 3.6 (p. 6), stated
  for any global field (author PDF SHA-256 `fe4a9193…cabb`); BHKT Proposition 8.1.
- README 6.4 for connected reductive groups (the plan's RG-RED request to RG2.4): Morris I (Canad. J.
  Math. 34 (1982) 91–168, free on Cambridge Core, SHA-256 `6757178733…2254`), §§4.1–4.3 p. 101 and
  §§5.3–5.6 pp. 104–106; the constant depends only on the level.
- README 7.2 convergence and rationality of the unitary Siegel–Eisenstein series (the plan's AS.1/AS.2
  requests; AutomorphicSpectralTheory §1.10b is `GLₙ` only): Morris I, Lemma (Godement) p. 118, p. 119,
  pp. 134 and 160–168; Morris II (Canad. J. Math. 34 (1982) 1112–1182, SHA-256 `3e38d71954…2a40`),
  pp. 1112 and 1126. The identification of the Siegel family as residual data on the Siegel Levi is
  stated in the proof sketch; a reviewer may want to check Morris II's residual theory covers it.
- README 7.4 split Hermitian local densities (the plan's request to GN.3; GeometryOfNumbers §3.2 is
  inert only): Feng–Yun–Zhang Definition 2.2, Theorem 2.3, Remarks 2.4–2.6, pp. 10–13.
- README 7.5 local Whittaker–density identity (the plan's MP.6 request; MP §6.8 is a different
  normalization): Feng–Yun–Zhang Lemma 2.7, pp. 13–14, and Kudla–Rapoport arXiv:0912.3758v2,
  Proposition 10.1, p. 37 (SHA-256 `4184d46227…1d41`).
- README 5.7 finite-coefficient `L`-functions (the plan's TORSION-DETERMINANT boundary): the statement
  is Stacks Tag 03UZ (Theorem 64.20.1, read online 2026-10-20), whose proof is omitted there and
  refers to SGA 4½ *Fonctions L modulo ℓⁿ et modulo p*, Théorème 2.2. SGA 4½ is not freely available
  and not in the cleared library; it is the one book this package would need for a full proof check.
- README 7.1 alternating cup product: owned in the proof sketch, with EtaleCohomologyFoundations
  §§0.11 and F.4.4 as inputs (the plan's EDC.2 request).

New locators checked this run: Hess Proposition 9 and Corollary 11 p. 7, Theorem 7 pp. 6–7;
Kosters–Wan Proposition 3.1 p. 6, Theorem 3.2 pp. 6–8, Theorem 3.4 pp. 8–9, Lemma 4.13 p. 22; Yoshida
Lemma 3.4 p. 416, Proposition 3.5 p. 417, Corollary 3.7 p. 418, Definition 4.10 p. 422; Roquette p. 26
(rationality, residue `h`, functional equation), p. 27 (class sum), p. 28 (numerator of degree `2g`).

## Adversarial mathematics pass

Every kept statement was instantiated by hand on the degenerate and convention-fixing cases; the
results are the README Checks. Notable computations: Hess invariants of `D = 0` on an elliptic field
are `(0, −2)` with sum `deg D + (1 − g) − n = −2`; self-dual volumes on `ℙ¹` with `ω = dt` give
`μ(∏O_v) = q`; the double Fourier transform of `1_{A(D)}` has total factor `1`; Kosters–Wan's conductor
at length two gives `m + 1` versus `pm + 1` according to `v(c_m)`; the Artin–Schreier norm group of
`y^p − y = T⁻¹` is `⟨𝔽_pˣ, T, 1 + T²O⟩` (from the Schmid–Witt formula); `L` for `y² = x³ + x + 1` over
`𝔽_5` is `1 + 3T + 5T²` (fibres `2, 0, 2, 2, 2`), over `𝔽_{25}` it is `1 + T + 25T²`; `y³ − y = t⁻²` over
`𝔽_3` has `N_1 = 4`, `g = 1`, `L = 1 + 3T²`; Yu's corrected degree shift `+n(n−1)(g − 1)` and the
uncorrected doubling; FYZ split versus inert `n = 1` densities `Σ T^i` and `Σ (−T)^i`; the measure
prefactor `q^(−n²(g−1))` belongs to the integral-volume-one normalization and disappears for
self-dual local measures. Two Lean examples pin `IsLPolynomialData` (`N_1 = 9` accepted, `N_1 = 8`
rejected); `artinSchreierWitt` is pinned on Teichmüller vectors.

## Notes for the maintainer and the next worker

- Lower-tier atlas packets still cite FunctionFieldArithmetic stages (ArithmeticGaloisDuality R02.3/
  R02.4, AutomorphicLFunctionsAndLocalFactors AL.3, ArithmeticGaloisRepresentations R01.5,
  DeligneWeightsAndPurity DWP.0, LefschetzPencils, EndoscopicTransfer, Anabelian NC.1). Their upstream
  pull requests do not; the atlas packets should be retargeted to the owners above.
- ArithmeticGaloisDuality's `ideleDegree_surjective` gives no proof route or locator for F. K.
  Schmidt's theorem; README 0.3 records two routes (the Weil bound, SF §5.11 with DWP §1.9; or the
  zeta function, Roquette p. 26 and §8.1) that the upstream roadmap could adopt.
- The PadicDifferentialEquations ownership question of the plan (geometric class field theory of curves,
  §RD.6.62) is now settled by AL.3's *Ramified rank-one curve reciprocity*; RD.6.62 can cite it.
- No untrusted text asked for any action; nothing suspicious was seen.
