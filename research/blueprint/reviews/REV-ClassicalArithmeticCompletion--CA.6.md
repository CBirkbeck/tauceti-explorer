# REV-ClassicalArithmeticCompletion--CA.6

Independent review of `BP-ClassicalArithmeticCompletion--CA.6`, the CA.6 follow-up packet written by
Codex, session `codex-fier75` (issue #9670, pull request #9713). Done by Claude, session
`claude-eNFuVp`, issue [#9679](https://github.com/CBirkbeck/tauceti-explorer/issues/9679), on
2026-10-14. This session wrote no part of the plan under review.

**Verdict: accepted, with corrections made in place.** The packet and its reader were corrected; the
suggested Lean file needed no change. One proof step contained a mathematical error, which is
corrected. The other corrections are:

- three statements made exact;
- source citations, chiefly to Bertrandias and Saff;
- closer pinned suppliers;
- test kinds;
- the resolution of the inherited DT.0 request.

The Smyth short-gap step stays an honest gap. It is now more precise. The review object in the packet
has a verdict for every node, for the imported targets and for the request ledger, and the edits
behind each verdict.

## What the packet contains

The parent packet `ClassicalArithmeticCompletion.json` (accepted by REV~3) left CA.6 `partial`. Its two
analytic targets lacked their analytic inputs: Smyth's nonreciprocal bound and Dimitrov's
Schinzel–Zassenhaus bound. This follow-up plans those inputs as 30 new nodes:

- **Smyth chain (9 nodes).** Real Schur series, the bounded factorization, Schur's coefficient bounds,
  finite Parseval, the first-coefficient reduction, the long- and short-gap conditions, integrality of
  the Mahler measure and the end application.
- **Dimitrov chain (21 nodes).** Fekete diameters, Chebyshev norms and their limit, monic inverse
  images, lemniscate enclosures, radial hedgehogs, conformal radius, Dirichlet condenser capacity,
  Dubinin's desymmetrization and hedgehog bound, the exterior-radius identity, Hankel determinants,
  Kronecker's criterion, the n²-growth bound, Bertrandias's rationality criterion, the square-root branch
  and the end application.

It imports the parent's 45 CA.6 targets by id and binds the new nodes to them.

## Method

- **Sources.** Five public sources were fetched afresh. Four checksums match the packet. The Dubinin
  hash, which the packet did not record, is now recorded. Every locator was read on the page:
  - Dimitrov, arXiv v1, pp. 12–16;
  - Bertrandias, pp. 1–3, 5–6 and 10–13, with page images of printed pp. 1, 2 and 12;
  - Saff, pp. 167–178, 184–185 and 192–194;
  - Dubinin, pp. 267–271, as page images;
  - Iribar López, pp. 2–3, as page images.

  **Smyth (1971) could not be obtained.** The ResearchGate link and the Wiley article page both refuse
  access, and no other public copy was found. The Smyth-chain statements were therefore checked
  mathematically, and Smyth's own 2008 survey was added as a readable outline of the method.
- **Mathematics.** Every proof sketch was checked step by step. Exact rational arithmetic confirmed:
  - the long-gap identity J(S)−2S=(c³+c²−1)/(1−c);
  - its derivative bound, with numerator 3−2c−5c² over 1−c²;
  - the quartic-to-plastic comparison, since (53/40)³−53/40−1=77/64000;
  - the non-integrality of (1+√17)/4.

  Every test value was recomputed: Schur coefficients, Fekete and Chebyshev values, conformal radii 2
  and 4, annulus capacities, Hankel determinants and square-root branches.
- **Baseline.** A Sonnet agent copied the pinned signature of all 36 declarations. I compared each
  with its uses, and read the new suppliers myself.
- **Suppliers and duplication.** A Sonnet agent checked several things, and I re-read every finding I
  rely on:
  - the 45 imported targets and the 32-entry frontier against the parent;
  - the parent statements bound by the new nodes;
  - tiers;
  - the DT.0 request;
  - a duplication sweep over packets, packages, the current TauCetiRoadmap, current Tau Ceti and
    pinned Mathlib.
- **Smyth short gap.** A numerical exploration tested whether natural Parseval multipliers suffice
  (below).
- **Reader.** A renderer first reproduced all 30 committed node sections byte for byte from the
  committed packet. The corrected sections were then re-rendered, and the closing sections were edited
  to match.
- **Checks.**
  - `check_blueprint.py` with the pinned index: 0 errors, 0 warnings.
  - The source findings pass `check_errata.py`, run on an errata-form copy, since the script reads
    errata files rather than packets.
  - `lean-check` elaborates the suggested file with placeholder warnings only.
  - `intake.py check-files` reports no problems.
  - A separate proofread compared packet, reader and Lean file after the edits.

## Counts

| Item | Before | After | Notes |
| --- | ---: | ---: | --- |
| New nodes | 30 | 30 | 25 corrected, 5 verified, none added, none unverifiable |
| Imported targets | 45 | 45 | verified against the parent; frontier of 32 matches one to one |
| Baseline declarations | 36 | 46 | all 36 confirmed; 1 uncited entry removed; 11 closer suppliers added |
| Sources | 6 | 7 | Smyth's 2008 survey added |
| Source findings | 5 | 5 | all confirmed on page images; none new |
| Gaps / requests | 4 / 1 | 4 / 0 | the DT.0 request is satisfied by an accepted node |
| Restructure entries | 0 | 2 | duplicates in two roadmaps outside the tier order |
| Planets | 0 new | 0 new | the parent's six CA.6 planets stand |

Stage coverage `planned` and packet status `complete` are confirmed. Every target the CA.6 brief
asked of this part has a node. Every chain ends in the pins, in parent nodes or in a recorded gap.

## Corrections

| Node | Correction | Reason |
| --- | --- | --- |
| `diameter-exterior-radius` | Step 1 gave γ=φ′(0)/b. It is γ=1/(bφ′(0))=cr(U_b,0)/b. The cycle form of Cauchy's theorem and the bounded maximum principle (after inversion) are cited for steps 2–3. | **Error.** Ψ(z)=1/φ(b/z)=z/(bφ′(0))+O(1). For K=[0,1], b=1: cr=4, so γ=4=1/d(K), not 1/4. The node's statement d(K)=b/cr(U_b,0) was right; Saff's (3.3) has Φ=z/cap+⋯. |
| `smyth-long-gap-condition` | The statement said "no positive nonzero coefficient between k and 2k inclusive", which index k itself violates. It now says F_m=0 for k<m≤2k, and drops the non-polynomial hypothesis. | The swap to F⁻¹ in the l=2k case cannot guarantee a non-polynomial series, and the computation uses no coefficient past 2k. |
| `radial-hedgehog` | Step 2 claimed a proper inverted domain for every nonempty family. This now requires a nonzero endpoint. | For K={0}, which the node allows, the inverted domain is ℂ. |
| `dimitrov-analytic-input` | Step 2 now says why squareness passes between P₂*P₄* and P₂P₄. | S lives on the reversed product, while the parent's criterion is stated for P₂P₄. |
| `schur-coefficient-conditions` | Cites the difference-quotient Schwarz lemma and the maximum principle. | The derivative-at-centre lemma does not make the Schur transform a disc map, and the pinned disc automorphism needs \|h\|<1 first. |
| `normalized-conformal-radius` | Monotonicity is spelled out as ψ∘φ⁻¹ with Schwarz at 0, and the pinned `DifferentiableOn.invFunOn` is cited. | `IsNormalizedRiemannMapOn` carries no inverse. |
| `kronecker-hankel-rationality` | The Bertrandias citation is corrected, and `Polynomial.coeff_coe` (previously uncited) is cited. | Bertrandias's §2.1 theorem (p. 6) is a non-archimedean growth bound, not Kronecker's criterion. |
| `hankel-analytic-growth` | Bertrandias match corrected; the cycle Cauchy theorem replaces the single-curve one. | §2.6 is the non-archimedean proof, and the archimedean bound is only quoted in §3.1. Deforming a circle to the lemniscate boundary needs a cycle. |
| `bertrandias-rationality`, `exterior-laurent-continuation` | Locator corrected to §3.1, p. 12 (unnumbered). The matches record the sources' connectedness hypotheses. | Bertrandias assumes a simply connected complement and Dimitrov's Corollary 5 a connected one. The node drops this legitimately. |
| `finite-fekete-diameter`, `chebyshev-monic-norm`, `fekete-chebyshev-limit` | Saff locators rewritten. The Bertrandias disc and segment values located (1.5.1–1.5.2, p. 3). The Chebyshev extremal bound cited. | Saff's Definition 1.8 is logarithmic capacity, not the Fekete diameter, and Theorem 1.9 has no parts (a)–(b). δ_n, Lemma 1.1 and τ are on pp. 167–169; t_n and (1.18) are on p. 175. |
| `lemniscate-enclosure`, `monic-preimage-diameter` | Bertrandias matches corrected. Saff's p. 178 exercises (lemniscate capacity; additive enclosure) added. The resultant product formula cited. | §2.6 is non-archimedean. Saff states the additive enclosure exactly. |
| `smyth-bounded-factorization`, `smyth-analytic-input` | Smyth's survey added. Step 1 says how the pinned disc factor gives holomorphy past the circle. | The pinned factor is defined on `Complex.UnitDisc`. The survey is the only readable statement of the quotient's normalization. |
| `slit-dirichlet-capacity`, `dirichlet-capacity-change-variables`, `slit-radius-asymptotic` | Dubinin's normalization recorded (∬\|∇u\|², no 1/(2π), p. 269). Saff locator made exact. Holomorphic change of variables cited. Asymptotic match corrected. | Dubinin's corollary is proved with Grötzsch's lemma on conformal images of discs, letting the inner radius tend to 0. |
| `real-schur-series`, `monic-mahler-integrality`, `hedgehog-square-root-continuation` | Cited `Complex.hasSum_taylorSeries_on_ball`, `isIntegral_algebraMap_iff` and `DifferentiableAt.clog` for steps the sketches gave in prose. | Closer pinned suppliers. |
| 18 tests in 12 nodes | `computed`/`limit` set to `computation`. | PROTOCOL §12 kinds. |

Wording that used the forbidden word "later" was rephrased in six places: two source findings, the
inherited-coverage note, one `uses` entry, one proof step and one reader sentence.

## Baseline citations

All 36 declarations exist under the cited names, at the cited modules, at the pins. Each provides what
its citing nodes need, once the closer suppliers above are added. Points checked in detail:

- `Complex.norm_deriv_le_one_of_mapsTo_ball` maps the open ball into the closed ball of the same radius
  and bounds only the derivative at the centre. Hence `norm_dslope_le_div_of_mapsTo_ball` was added for
  the Schur transform.
- `TauCeti.unitDiscMoebius` lives on `Complex.UnitDisc`, so it covers the open disc only. Holomorphy past
  the circle comes from its scalar formula and `hasDerivAt_unitDiscMoebiusFormula`. The nonvanishing of
  the denominator for \|z\|<1/\|α\| is routine and stated.
- `Complex.canonicalFactor R w` is (R²−conj(w)z)/(R(z−w)), the reciprocal of a disc factor. Its
  boundary-modulus lemma needs w∈ball 0 R, which holds.
- `hasSum_sq_fourierCoeffOn` carries the 1/(b−a) normalization, as the Parseval node assumes.
- `DifferentiableOn.hasFPowerSeriesOnBall` needs a closed ball. The node uses it only on radius r<1;
  open-disc expansions use `Complex.hasSum_taylorSeries_on_ball`.
- `TauCeti.Contour.homologyCauchyTheorem` is for one closed curve. Contour deformation uses
  `TauCeti.Contour.Cycle.homologyCauchyTheorem`.
- `IsNormalizedRiemannMapOn` orders ℂ by `ComplexOrder`, so 0<deriv means a positive real derivative.

**Removed:** `TauCeti.exists_bijOn_ball_differentiableOn_invFunOn`. No node cited it, and it gives an
unnormalized map.

**Added:**

- `Complex.hasSum_taylorSeries_on_ball`
- `Complex.norm_dslope_le_div_of_mapsTo_ball`
- `Complex.eqOn_of_isPreconnected_of_isMaxOn_norm`
- `Complex.norm_le_of_forall_mem_frontier_norm_le`
- `isIntegral_algebraMap_iff`
- `Polynomial.Chebyshev.leadingCoeff_le_of_forall_abs_le_one`
- `Polynomial.resultant_eq_prod_eval`
- `DifferentiableAt.clog`
- `DifferentiableOn.invFunOn` (Tau Ceti)
- `TauCeti.lintegral_image_eq_lintegral_enorm_deriv_sq_mul`
- `TauCeti.Contour.Cycle.homologyCauchyTheorem`

`SimplyConnectedSpace.ofContractible` would shorten the hedgehog's simple-connectivity step, but it is
an instance absent from the declaration index, so the two existing citations stay.

## Source locators

| Source | Locators | Verdict |
| --- | --- | --- |
| Dimitrov, arXiv:1912.12545v1 | hedgehogs and Theorem 3, p. 12, proof pp. 12–13; Theorem 4, pp. 13–14, outline and D_k=det(a_(i+j+1)), p. 14; Corollary 5, p. 15; proof of Theorem 1, pp. 15–16 | correct. Theorem 4 and Corollary 5 assume a connected complement, now recorded. |
| Bertrandias, SDPP 5 (1963–64), exp. 3 | 1.1–1.2 p. 1; 1.3–1.4.6 p. 2; 1.5 p. 3; §2.1 Théorème p. 6 (non-archimedean); §2.6 pp. 10–12 (its proof); §3.1 Théorème p. 12 | §2.1 and §2.6 were cited as Kronecker's criterion and as archimedean contour estimates: corrected. Printed page = PDF page − 1. |
| Saff, arXiv:1010.3760 | (1.1) p. 167; Lemma 1.1 p. 168; (1.4) p. 169; Def. 1.8 and Thm 1.9 p. 172; t_n, (1.18) p. 175; Thm 1.18 pp. 176–178; Ex. 1.10–1.11 pp. 173–174; Def. 3.4 p. 184; Thm 3.5, Ex. 3.6 p. 185; Ex. 5.1, (5.3) p. 193 | Definition 1.8 and "Theorem 1.9(a)–(b)" were misattributed: corrected. Printed page = PDF page + 164. |
| Dubinin, Math. USSR Sb. 52 | Lemma 1 p. 268; Lemma 2, capacity, Theorem 1 (\|C̃\|≤\|C\|) p. 269; corollary f′_α(0)≤f′_α*(0) p. 270, proof to p. 271 | correct. The slits are closed, r≤\|z\|≤1 (the text layer misreads ≤ as <), matching the node's D(r;θ). |
| Iribar López, ETH notes | §2 Theorem 1 and proof, pp. 2–3 | correct; the three findings are confirmed on the images. |
| Smyth, BLMS 3 (1971) | §§2–5, pp. 169–175 | **unobtainable** for this review. Statements verified mathematically; locators unchecked. |
| Smyth, survey (2008), arXiv:math/0701397v2 | §5.1, pp. 327–329 | added; outlines F=f/g with f(0)=g(0)=M(P)⁻¹ and Schur's conditions. |

## Source findings

All five recorded findings were checked on page images. Each now carries a confirmed review verdict:

- **ECA6-1** (Bertrandias 1.4.5): the set is printed with "pour tout y∈A".
- **ECA6-2** (Bertrandias 1.4.6): (1+η)τ(A) fails for τ(A)=0.
- **ECA6-3** (Iribar): the reversal signs. For n=2 the determinant is −a₁², not +a₁².
- **ECA6-4** (Iribar): the matrix entries are indexed 2n+d instead of 2r+d.
- **ECA6-5** (Iribar): (5) has right side a_(m+r) where it should be 0.

No new finding. The candidate in Dubinin (open slits) was a text-layer misreading.

## The DT.0 request

The packet carried the parent's request to `DiophantineApproximationAndTranscendence:DT.0` for Siegel's
lemma in product form. That request is met. `DT.0/siegel-lemma-number-field-product`, in the DT.0
follow-up packet accepted on 2026-10-13, states exactly the requested bound, with M≥0 allowed. The
DT.0 packet's own restructure entry proposes this binding.

The request moved to a `requestResolutions` record. A consumer binding was added for
`CA.6/dobrowolski-auxiliary-polynomial`; it applies the lemma with N+1 unknowns, so the exponent is
1/(N+1−dM). The parent packet itself is not edited.

The DT package README was built before that node. So the CA package must cite a DT layer containing it,
or state the lemma itself.

## Duplication and tiers

No CA.6 prerequisite points upward. ClassicalArithmeticCompletion is tier 5; its only other-roadmap
supplier is DT, which is tier 4. Two roadmaps outside the tier order define the same notions. A tiered
plan cannot cite them, so CA.6 keeps both notions, as its `ownershipMoves` say. Two `restructure`
entries ask those roadmaps to import or compare:

- **`LogarithmicPotentialTheoryAndAlgebraicIntegers:LP.1/transfinite-diameter`** restates the Fekete
  diameters and transfinite diameter. The LP packet describes CA.6 as LP's consumer, which is the wrong
  way round under the tier rule. LP also names a roadmap `ArithmeticAlgebraizationAndHolonomyBounds`
  for Dubinin's bound; no such roadmap exists.
- **`ConformalMappingPartII:U0/conformal-radius`** gives the same number on simply connected domains.
  Its `L0/finite-blaschke-product` generalizes the products built in
  `smyth-bounded-factorization`.

Current Tau Ceti, current TauCetiRoadmap main and pinned Mathlib have none of the following:

- transfinite diameter, capacity or conformal radius;
- Dubinin's bound, hedgehogs or lemniscate enclosures;
- Hankel-determinant rationality or Bertrandias's criterion;
- the Smyth or Schinzel–Zassenhaus targets.

## The Smyth short-gap step

The gap stays. Its record now says what the review found:

- **No public source.** The 1971 article could not be obtained. Smyth's survey (§5.1) outlines the
  method without the coefficient inequalities, and so does Pathiaux's seminar note (SDPP 15, exposé
  G6).
- **Small cases agree with the quartic.** For the gap patterns (k,l)=(2,3) and (3,4), the full finite
  Schur criterion was imposed on both coefficient sequences. It forces c below about 0.734 and 0.739,
  which is consistent with 40c⁴−93c²+40≥0 (c≤0.75479).
- **The obvious multipliers are too weak.** Compressing both Toeplitz matrices to rows 0, l−k, k, l
  and columns 0, l−k, k allows c up to about 0.763. These are the three-term multipliers 1, z^(l−k)
  and z^k. Dropping row k allows c up to about 0.89. Smyth's multipliers therefore involve further
  coefficients or another choice of outputs.

The node is marked verified as a precisely recorded target, not as a proof.

## Reader and Lean file

The reader's 30 node sections were re-rendered from the corrected packet. The closing sections were
updated:

- the interfaces section gains the DT binding;
- the library table is regenerated from the baseline list;
- the corrected-conventions section adds the non-archimedean and connectedness conventions;
- the gap record and the request resolution are updated;
- a new subsection records the tierless duplicates;
- the references gain the survey.

The suggested file needed no change. Its statements match the corrected nodes, since the corrections
are in proofs and citations. It elaborates at the pins with only placeholder warnings (25).

## Questions for the orchestrator

1. **Smyth (1971) is not readable for anyone working from public sources.** The `sources` worklist
   should either buy it or adopt McKee–Smyth, *Around the Unit Circle* (Springer 2021), which contains
   the proof. Until then the short-gap gap cannot be closed from a source.
2. **The LP and ConformalMappingPartII packets** need a revision that imports from CA.6. The
   `restructure` entries here say what.
3. **At assembly**, the parent's `dobrowolski-auxiliary-polynomial` should cite
   `DT.0/siegel-lemma-number-field-product`, and its DT.0 request should close.
