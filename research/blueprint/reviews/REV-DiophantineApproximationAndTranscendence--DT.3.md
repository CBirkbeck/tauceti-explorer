# Independent review of quantitative logarithmic forms, DT.3

Job `REV-DiophantineApproximationAndTranscendence--DT.3`, issue #9279.
Reviewer: Codex, session `codex-JBRvYx`, 13 October 2026.
Input: `BP-DiophantineApproximationAndTranscendence--DT.3`, issue #9321,
PR #9436, commit `b1f49bb29`, by session `codex-37Jw43`.
This reviewer did none of that work.

**Accepted after corrections.** This accepts a completed planning pass, with
DT.3 still **planned**, no stage closed, and every implementation status
`unchecked`. All 52 nodes have individual verdicts in the packet: 31 corrected
and 21 verified. The eight proof/calibration gaps and seven supplier requests
remain explicit. In particular acceptance does not establish the sharp
Waldschmidt/Matveev/LMN constants or the numerical Yu end theorem.

## Extent and counts

| Item | Input | Reviewed |
| --- | ---: | ---: |
| Nodes | 52 | 52 |
| Theorems / comparisons / definitions / constructions | 24 / 14 / 8 / 6 | unchanged |
| API items | 54 | 54 |
| Unit checks | 53 | 54 |
| Baseline declarations | 23 | 23 confirmed |
| New planets / retained original planets | 0 / 6 | 0 / 6 |
| Supplier requests / explicit gaps | 7 / 8 | 7 / 8 |
| Source findings | 9 | 11, all confirmed |
| Suggested Lean lines | 129 | 129 |

No node or baseline citation was added or removed. The source and gap receipts
were corrected, and all changed mathematical text was synchronized with the
reader. The coverage `remaining` list was synchronized with the corrected gaps.

## Sources and mathematical checks

I read the cited passages in the public primary texts and inspected rendered
pages where extraction obscured equations. The six source URLs, printed-page
locators and SHA-256 receipts are in the packet and reader. The four existing
PDF hashes match; hashes were added for the published Yu correction and the
English Matveev article. No source passages or source files enter the repository.

The complex checks cover height normalization, the Laurent filtration and
Hilbert leading form, the subgroup and transverse-jet estimates, the two Delta
conventions, alternant vanishing, perturbation, rank, both bounds on the same
minor, and the M=1 rounded-parameter criterion. I checked the passage from
the weighted sum hypothesis to the conservative pointwise constant:
scaling each logarithmic height by m repairs the sum, costs m^m in their
product, and `log(mB)≤m log B` supplies the remaining factor m. The resulting
`Csafe(m)=2^(m+25)m^(4m+10)` is the packet's consumer constant. This does not
settle the sharper pointwise constant.

For Matveev I read the English notation on pp.1217–1218 and Corollary 2.3 on
p.1219, including its explicit option to use the ordinary maximum coefficient
instead of the weighted parameter. Its n=2, D=1, real-field specialization
gives exactly the stated `min(e·30^5·2^(7/2),2^32)` factor. This checks the
specialization, not the undecomposed primary proof in §§3–21.

The local checks cover the two valuation normalizations, strict exp/log
threshold and order isometry, normal series, normalized Hermite jets and
factorial costs, Liouville, the separate one-power estimate, rational-integer
relative Siegel, radical relations, finite monomial bases, torsion splitting,
grid extrapolation and contraction, independent/dependent saturation, nonunit
elimination, and the generated-field versus containing-field distinction.
The MPIM precursor supplies the analytic passages with its own pagination;
it was not substituted for the untraced terminal lemma in the 1989 journal paper.

## Corrections made

### Hypotheses, fields and proof interfaces

- **Theta counting bound.** Its definition allows transverse degree zero,
  but the cited lower bound needs `n≥2,T0≥1,L≥1`. At `(n,T0,L)=(2,0,3)`
  the actual minimum is 3 and the proposed lower bound is 9/2. The API was
  restricted and a check for this excluded input added. The zero-transverse
  identity remains valid. The analytic-minor node now explicitly assumes
  `d,T0,T1≥1` as its source does.
- **Rounding check.** `floor x≥x/2` at x=2 reads `2≥1`; the false claim
  of equality was removed, with numerical checks at 2 and 5/2 stated.
- **Rank direction.** The invariant operator `∂X0+Y∂Y` uses the direction
  `(1,0,…,0,1)`. The proof sketch now retains its torus component and cites
  the newly recorded misprint E610.
- **Matveev coefficient parameter.** The proof uses the source's B* option.
  An alternative weighted-parameter argument must first put the largest
  height parameter last. The bound itself is unchanged.
- **Delta denominators.** Yu 1994 Lemma 1.3 states J≥1. The planned J=0
  extension is justified separately by integer-input derivative integrality
  from Yu 1990 Lemma 1.6 and multiplication by the additional integer q-power.
- **Short relations.** The height input distinguishes algebraic integers,
  nonintegral algebraic numbers, and torsion. In the nonintegral case a
  primitive minimal polynomial has leading coefficient at least 2, giving
  `h≥log 2/d>1/(2d³)` directly. Torsion requires the nonzero logarithmic
  branch contribution. The original covolume argument remains G4.
- **Analytic rescaling.** For rational θ the symbol `p^(−θ)` cannot be
  presumed to denote a scalar in the original completion. A finite complete
  extension and a chosen scalar aθ with `vp(aθ)=θ` are now specified. The
  normalized auxiliary function uses `cA f(aθ⁻¹z)`, where `vp(cA)=A`, in a
  finite extension containing both scalars. This analytic extension does not
  change the arithmetic polynomial field or its degree.
- **Initial algebraic rows.** The torsion root ζ need not lie in K. In a
  fixed class Ct and at an integer point s, division by the common unit
  `ζ^((r+tG1)s)` leaves a K-valued row, since the remaining torsion powers
  are powers of `ζ^G0=α0^(p^v)`. Relative Siegel is applied only after that
  factor has been removed.
- **Extrapolation field.** Integer-grid evaluations use the same unit
  removal; fractional-grid evaluations use the compatible ξ factor. The
  cleared latter polynomial lies in the radical field of degree
  `q^(n+1)D`. The analytic scalar extension is not charged as its degree.
- **Generated-field heights.** The source's lower threshold is
  `(1/2)(f0/D0)^2 log p`, not `f0 log p/(2D0)`. The exact source threshold
  is now stated. The simpler Φ consumer still has the stronger `hj≥log p`.
- **Coefficient input at the rational consumer.** Its parameter may start
  at Binput≥1, whereas the numerical source uses B≥3. The proof now uses
  `B=max(3,Binput)` and `log(max(3,Binput))≤2log(eBinput)` explicitly.
- **Gap and version bookkeeping.** The effective-house and subsequent
  proof-gap wording agrees between packet and reader; the parameter gap has
  corrected equation/page locations; the coverage list incorporates those
  corrections and the new Appendix finding. No gap was silently closed.

### Source locators

| Target (DT.3 suffix) | Corrected locator |
| --- | --- |
| absolute-height-calculus-adapter | Waldschmidt §3.2, Property 3.3, pp.75–76 |
| absolute-height-conjugate-size-adapter | §3.5.1, (3.13), pp.82–83 |
| polynomial-length-and-block-degree | §3.2 p.76; §3.5.2 Proposition 3.14 pp.83–84; §3.5.5 Lemma 3.15 pp.85–86 |
| multiblock-liouville-height-adapter | §3.5.2, Proposition 3.14, pp.83–84 |
| laurent-hilbert-leading-form | Proposition 8.3 p.236 |
| additive-one-torus-subgroups | Propositions 5.6–5.7 pp.157–159; Theorem 5.13 pp.161–163; Lemma 8.13 p.241 |
| laurent-complete-intersection-degree-bound | Theorem 8.4 pp.236–238; Lemma 8.7 p.239; Theorem 8.8 pp.239–240 |
| invariant-jets-and-transverse-jet-coordinates | (8.10), Lemma 8.11 pp.240–241; Lemma 8.13 p.241; (8.10) is an equation |
| transverse-jet-multiplicity-bound | Lemmas 8.14–8.16 and Theorem 8.18 pp.242–245 |
| delta-polynomial-adapter; delta-denominators-and-growth | Yu 1990 (1.9) p.25 and Lemma 1.6 pp.26–27 |
| partial-alternant-order-and-schwarz | Waldschmidt Lemma 7.2 pp.192–193; Lemma 7.5 pp.196–197; Lemmas 9.14–9.15 pp.277–278 |
| perturbed-determinant-upper-bound | §7.3, Lemma 7.4, pp.195–196 |
| interpolation-determinant-arithmetic-bound | §3.5.5, Lemma 3.15, pp.85–86 |
| waldschmidt-independent-estimate-proof | §9.3, Proposition 9.18 p.286; proof §9.3.4 pp.298–302 |
| yu-normal-schwarz-extrapolation | Yu 1990 Lemma 1.2 p.23 |
| yu-improved-parameter-selection | Yu 1994 budget (2.28)–(2.30) pp.254–255; lengths (2.31) p.256; induction pp.262–263; calibration pp.263–266 |
| yu-absolute-height-phi-adapter | Yu 1990 §2.6, proof of Theorem 2.2, pp.64–66 |

### Constant table verification

I recomputed all seven finite-row endpoint ratios using exact decimal
rationals, reading the table in Yu 1994 pp.251–252. Each row's ratio increases
with n, so these endpoints verify all n=2,…,7 inputs. The shared η factors in
the last regime cancel.

| Regime | Endpoint | Small-row / uniform-row ratio, approximately |
| --- | ---: | ---: |
| p=2 | 7 | 0.9759338051 |
| p=3 or p=5,e≥2 | 4 | 0.6340273605 |
| same | 7 | 0.8745596774 |
| p≥7,e≥2 | 4 | 0.5824510585 |
| same | 7 | 0.8629583985 |
| p≥5,e=1 | 4 | 0.6199074090 |
| same | 7 | 0.8718202956 |

The proof now identifies each regime rather than listing three ambiguous
ratio bounds. Its W hypothesis uses `1/(ρn)`, which is a conservative
strengthening of the source's `(n−1)/(ρn²)` coefficient in (2.12), p.250.
This verifies table domination; the rounded interpolation budgets remain G6.

### Source findings

E601–E609 were checked at their locators and all confirmed. E605–E607 agree
with the three entries of Yu's published correction, p.307. E608 is explicitly
corrected in Yu 1994 p.253. The author-copy findings remain scoped to that copy.

Two missed findings were added with independent verdicts:

- **E610:** Waldschmidt's author PDF, Lemma 9.17 proof, Step 3 p.282, has a
  zero torus component in the direction for `∂X0+Y∂Y`. The following tangent
  calculation on p.283 uses the required component 1. This is a misprint with
  an unambiguous correction.
- **E611:** Yu 1990's published Appendix lemma, pp.111–112, already contains
  the max-versus-lcm residue-degree error, at p=2 and p≡3 mod4. Its splitting
  argument requires even residue degree, rather than every degree at least 2.
  The lemma itself is false in the odd-degree branch. The published p.307
  correction does not address it. E609 is the corresponding dyadic proof
  formula in the later paper. Neither finding is presented as a counterexample
  to the final logarithmic-form estimates; the corrected numerical comparison
  remains G8.

Both new findings record searches of primary publication/correction pages and
web searches for an existing correction. All eleven records have `confirmed`
review verdicts, reasons and this review job id.

## Baseline, ownership and closure

All 23 baseline statements were read independently at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` or Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. None was removed or replaced.

- Height: `Height.logHeight₁_inv`, `logHeight₁_pow`, `logHeight₁_zpow`,
  `logHeight₁_mul_le`, `logHeight₁_add_le`, `NumberField.totalWeight_eq_finrank`,
  `Rat.logHeight₁_eq_log_max`, `NumberField.mulHeight₁_eq`,
  `NumberField.absMulHeight₁`, `NumberField.absLogHeight₁`.
- Carriers and analysis: `MvPolynomial`, `AddMonoidAlgebra`,
  `Complex.dist_le_mul_div_pow_of_mapsTo_ball_of_isLittleO`,
  `AnalyticAt.exists_eventuallyEq_sum_add_pow_mul`, `padicValNat_factorial`,
  `sub_one_mul_padicValNat_factorial_lt_of_ne_zero`,
  `MvPowerSeries.IsRestricted`, `TauCeti.Huber.restrictedMvPowerSeriesSubring`,
  `TauCeti.Huber.mem_restrictedMvPowerSeriesSubring`.
- Binomials: `autEquivRootsOfUnity`,
  `X_pow_sub_C_irreducible_iff_of_prime_pow_of_ne_two`,
  `X_pow_sub_C_irreducible_iff_of_prime`, `X_pow_mul_sub_C_irreducible`.

The height sum constant is relative total weight; absolute normalization uses
the rational degree. The complex Schwarz declaration has the little-o
assumption and exponent n+1; the Taylor remainder is local and analytic.
The factorial results require prime p. The Kummer prime-power criterion
excludes 2 and requires a positive exponent; the dyadic exception is separately
planned. The absolute multiplicative height's actual nonalgebraic branch is
1, as the packet correctly states, despite the pinned docstring's wording.

The reviewed library audit for DT.0–DT.5 was read. Existing analytic and
restricted-series infrastructure is imported. The current upstream roadmaps
were checked at `0d144d044dacebca17b654695b6f1ad58f159b27`, with the current
library checked separately from the pins. The relevant ownership contracts are
LocalFieldsRamification Layers 1–2, NumberFieldArithmetic Layer 5,
GlobalNumberFields Layer 0 and Completed/EffectiveBounds. No existing local
completion, exp/log, unramified extension, height or general Siegel carrier is
replanned here.

I read the original DT.0/DT.3 supplier statements, SF.0's existing scope, and
the seven request contracts. The generic multigraded Hilbert/primary-length
and effective-house inputs are explicit Part II requests, not assertions that
the current suppliers already prove them. ArithmeticHeights Layer 5.6 was
checked against upstream PR #287 at head
`b8aec35b6cd8e68031df1038a2cae63088be4a17`: it provides the relative,
integer-coefficient, product-row-height form, not merely a house bound over ℤ.
It remains an upstream dependency rather than a declaration at these pins.

The 52-node internal dependency graph is acyclic. The original qualitative
DT.3 targets remain imported, and `targetCoverage` preserves the sharp targets
while distinguishing their conservative replacements and unresolved proofs.
All 14 definitions/constructions have at least three checks, with computed,
degenerate, compatibility or excluded-input examples. The six existing named
planets are retained; none is added to exceed the layer limit.

## Validation and handoff

- `python3 scripts/check_blueprint.py` on the packet: **0 errors, 0 warnings**.
  The worker declaration index was unavailable; every baseline statement was
  therefore checked manually in its pinned source, independently of this check.
- `research/blueprint/intake.py check-files` on the submitted files: passed.
- The packet source-finding validator and source-version validator: passed
  with the roadmap id, including E611's stated-lemma reach.
- Individual verdict coverage, internal DAG, test counts and packet/reader
  mathematical-text synchronization: passed. Table separators were unescaped
  only for the synchronization comparison.
- `scripts/check_sorry_data.py` and `git diff --check`: passed.
- `lean-check` on the unchanged 129-line suggested file: **elaborates**, with
  exactly ten `declaration uses sorry` warnings and no errors or other warnings.
  Three light polynomial definitions have real bodies; the six examples and
  four end milestones use honest theorem placeholders.

No question needs an answer to accept this planning pass. For the orchestrator,
the remaining work is the existing G1–G8 and seven owner requests. Packaging
must retain their precise boundaries, the conservative complex constant, the
conditional sharp two-log replacement and the corrected residue-degree
comparison obligation. The handoff lists the corrected resume locations.
