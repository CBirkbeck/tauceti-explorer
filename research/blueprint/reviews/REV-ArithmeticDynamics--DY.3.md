# Independent review: Arithmetic dynamics, DY.3 continuation

Accepted after corrections. Reviewer: Claude (Claude Code, session claude-XUtvk7), job
REV-ArithmeticDynamics--DY.3 (#9275), 14 October 2026. The input was written by Codex, session
codex-bJ9jrz, in BP-ArithmeticDynamics--DY.3 (#9317, PR #9626). This review shares no session with it.

## Scope and counts

The packet continues the accepted parent plan at DY.3. It adds 23 nodes:

- 4 definitions and 5 constructions, with 65 API items (one added here) and 27 unit tests;
- 10 theorems and 4 comparisons.

The parent's DY.3 nodes and six planets are cited by id and were not under review. I checked every
field of every new node: statement, hypotheses, proof steps, acceptance, uses, API, tests, sources and
prerequisites. In `review.checked`, 16 nodes are `verified` and 7 are `corrected`. No node was added
and none is unverifiable.

The packet has 3 gaps (G1–G3) and 11 requests. Coverage of DY.3 stays `planned`: each of the four
remaining items of the parent coverage record is planned here, either down to a node or to a named gap
or request. `check_blueprint.py` with the pinned declaration index reports 0 errors and 0 warnings.

## Sources

I downloaded all seven PDFs again. Their SHA-256 hashes equal the recorded ones. The Acta Arithmetica
host serves an anti-bot page to browser user agents, but the PDF it serves otherwise has the recorded
hash. I checked every locator. The formulas behind E9301 and E9302 I read on the rendered pages (Gao–Ou
pp. 3 and 10), not in the text layer.

Page offsets:

- Gao–Ou: printed page = PDF page.
- Morton 1992: printed = PDF + 342.
- Morton 1996: printed = PDF + 317, because Numdam adds a cover page.

arXiv lists only v1 of Gao–Ou, under the title *The dynatomic curves for unimodel polynomials are
smooth and irreducible*. HAL hal-00814484 is the same preprint, and I found no journal version. The
packet's `edition` field and a new `sourceVersions` list now record this.

Two locators were wrong and are fixed:

- Gao–Ou §2.3 is on pp. 9–10, not pp. 8–10.
- Gao–Ou Theorem 3.1 is on p. 11, not pp. 10–11.

## Recomputation

I checked every numerical claim with exact arithmetic, using scripts in scratch.

- **Genus and ramification.** ν(n), bₙ, the satellite counts ν(e)φ(n/e), eₙ, g₀(n) and g₁(n) for
  n ≤ 10. They reproduce FPS Table 1. With the stated ramification data, Hurwitz gives the stated
  genera: n = 2 and the n = 6 example (different degree 24 on X₀(6), and 147 + 27 on X₁(6)).
- **Necklaces.** Brute force for n ≤ 8 gives ν₂(n) primitive words, ν₂(n)/n necklaces and
  1, 1, 1, 2, 3, 5, 9, 16 complement orbits. These are the packet's formulas.
- **Kneading.** ν(1/7) = 12102⋆ for d = 3, and ν(28/31) = 3213⋆ with expansion .32130 for d = 4.
  Gao–Ou Lemma 3.2 holds for every maximal periodic angle with d ≤ 4 and n ≤ 6.
- **Morton.** I checked every identity at 300 random rational points:
  - the parametrization (8)–(9) lies on Φ₃ and is 3-periodic;
  - the inverse t(c(t), x(t)) = t;
  - the rotation (t + 3)/(1 − t);
  - η-invariance, and c = −(η² − 2η + 29)/16;
  - the symmetric form (35);
  - ζ⁴(Y² − 4X³ + 11X² − 8X) = (ζ − 2)·H(t, u), and the inverse map (36).

  Also checked: the exceptional values υ = −1 at ζ = 0 and υ = 1 at ζ = 2;
  Φ₃(x, −7/4) = (x³ + x²/2 − 9x/4 − 1/8)², whose cubic has no rational root; the cycle of −29/16 with
  coordinates 3, −3, 0; and g(2) = 73, g(−2) = 33.
- **Levin and Epstein.** All three of Levin's pushforward formulas (Gao–Ou Lemma 2.4) hold numerically
  for d = 2, 3, 4, and so does the sign in Lemma 2.8 (d = 3, m = 2). Lemma 2.6 I re-derived by hand.

## Corrections

1. **unicritical-ray-landing.** The statement contained a broken sentence: "For approaching
   parameters along a landing ray, For the compactified critical-value ray R, …". It now states the
   exact contract that the proofs of Propositions 3.13 (p. 25) and 3.15 (p. 27) take from
   Petersen–Ryd:
   - c_m → c₀ along the parameter ray of angle θ;
   - R(c) = R_c(θ) ∪ {c, ∞} and S(c) = f_c⁻¹(R(c));
   - after passing to a subsequence, R(c_m) → R and S(c_m) → S, with S = f_{c₀}⁻¹(R);
   - R ∩ (ℂ∖K) is the dynamic ray, R ∩ ∂K is the parabolic point, and R meets int K only inside the
     immediate basin.

   "Primitive when the two ray orbits are distinct" is now "primitive exactly when …", as on p. 18.
2. **relative-height-candidate-adapter.** The node called the inherited height absolute, and asked for
   the radius exp([K:ℚ]·B). But the parent's `height-bound-for-preperiodic-points` bounds Mathlib's
   native `Height.logHeight`, which is relative to the field. `ED.0/bounded-height-enumeration` uses
   the same normalization. So the inherited bound needs D ≥ exp(B), and the factor [K:ℚ] enters only
   when the bound is absolute, as for DY.1's absolute heights.
   - Corrected: the statement, the second hypothesis, the first proof step, the first acceptance check
     and the source match. The reader's worked example is corrected to match.
   - Added the prerequisite `DY.1/weil-height-eq-log-height-div-finrank`.
   - The suggested file keeps `relativeHeightCandidateBound` (the absolute case), which is correct, and
     adds `nativeHeightCandidateBound`.
3. **polynomial-quadratic-pushforward.**
   - Mathlib at the pin has the field trace and the degree [K(X) : K(f)]. The prerequisite on
     AlgebraicCurves Layer 6 is replaced by four Mathlib declarations: `RatFunc.finrank_eq_max_natDegree`,
     `Algebra.trace`, `trace_eq_sum_embeddings` and `Algebra.trace_trace`. The Layer 6 request now
     serves only the rotation quotient.
   - Transversality (Lemma 2.8) needs Levin's double-pole formula. The node did not state it. It is now
     in the statement and is the new API item `unicriticalPushforward_double`.
4. **parabolic-parameter-transversality.** Added the direct prerequisite on the pushforward node. The
   third proof step now cites the double-pole formula.
5. **unicritical-external-ray-system.** Böttcher coordinates and rays use no kneading data. The
   prerequisite `unicritical-kneading-sequence` is replaced by `mathlib:AddCircle` for the angles.
6. **Locators.** Two locators fixed (see *Sources*).
7. **Findings.** Each source finding now names its source id.
8. **Prose.** The packet and reader had lost the space before numerals and symbols, as in "Lemma3.9",
   "multiplier1", "genus2", "overℚ" and "Acta Arithmetica62 (1992),343–372". A whitelist rule
   restored it in about 230 places. The rule protects ids, names, code spans, URLs and hashes.

## Baseline

All 8 cited declarations exist at Mathlib 082e2d3 under the cited names and modules, and their
statements supply what the nodes use. One line number was wrong: `NumberField.mulHeight₁_eq` is on
line 112, not 111.

Four declarations were added for the pushforward:

- `RatFunc.finrank_eq_max_natDegree`;
- `Algebra.trace`;
- `trace_eq_sum_embeddings`, which is in the root namespace at the pin;
- `Algebra.trace_trace`.

Nothing was removed.

## Closure and cross-roadmap prerequisites

- **AlgebraicCurves.** I read Layers 0–3, 6–8, 11 and 12 at TauCetiRoadmap 0d144d0. Their headings are
  identical to the atlas snapshot. They supply each requested contract:
  - Layer 7: the tame different and Hurwitz in cross-multiplied form;
  - Layer 8: genus invariance over perfect fields;
  - Layer 11: F/F^G is Galois with group G;
  - Layer 12: regular projective models by normalizing ℙ¹.
- **ConformalMapping.** L4 has continuation, reflection and the monodromy theorem. Its request
  correctly excludes polynomial dynamics.
- **CN.0.** The accepted CN packet has no exact number-field carrier, so the request is needed. It is
  precise.
- **EffectiveDiophantineMethods.** The seven ED nodes cited, from ED.0, ED.3 and ED.4, state exactly
  the contracts the DY.3 nodes use, including the rank gates.
- **Library audit.** It shows DY.3 as not built. No Tau Ceti roadmap or library file plans dynatomic
  curves, kneading or quadratic-differential pushforward.
- **Re-pointing at assembly.** The parent cannot be edited here. Five new `restructure` entries record
  what the assembly does:
  - add `analytic-dynatomic-identification` to the parent's smooth-irreducible endpoint, replacing its
    gap by G1/G2;
  - point the X₁/X₀ names of `dynatomic-curve` at the new model nodes;
  - move the parent's "at most one rational 3-cycle" clause into `morton-rational-three-cycle-reduction`.
    The parent node itself cannot depend on the reduction, because the Morton chain cites it;
  - re-point the enumeration's ED.0/CN.0 stage anchors at `ED.0/bounded-height-enumeration` and
    `exact-dynamical-runtime-adapter`;
  - carry the rank J(C₁(3₂))(ℚ) ≤ 1 gate through the Poonen type-(3,2) chain, and point the
    FPS/Stoll nodes at their ED nodes.

  I checked that the joint graph of parent, part, ED and CN stays acyclic with all of these edges.
  The coverage `remaining` list now names the assembly step.

## Mistakes in sources

| Id | Verdict | Finding |
|---|---|---|
| E9301 | confirmed | Gao–Ou Lemma 2.2 and Corollary 2.3, p. 3. The strict inequality and f_*Q ≠ Q fail for Q = 0, and the corollary fails for f the identity. With Q ≠ 0 and deg f ≥ 2 the printed proof works, and every use has both. |
| E9302 | confirmed | Gao–Ou Lemma 2.9, p. 10. The page says q is asymptotic to 1/(z − z₀), but Q has a double pole and the integral uses 1/r². The chain D(z₀,ε) ⊂ U_ε − V_ε cannot hold, since z₀ ∈ V_ε. The estimate needs V_ε − U_ε, which lies in a thin annulus. |
| E9303 | confirmed | Morton's 2011 corrigendum repairs the Hensel step of Theorem 15, Case 2, and of Proposition 17 (p. 346), and renumbers references [17–20] as [16–19]. The characteristic-zero §3 results used here are unaffected. |

No further mistake was found. Two things I checked turned out correct: Gao–Ou's Lemma 3.2 examples, and
the sign of ρ̇/ρ in Lemma 2.8.

## API, tests, planets

Every definition and construction has at least three discriminating tests, and their values were
recomputed. The API outlines let a user work with each object without unfolding it. The one gap was
the double-pole formula, now added.

No planet is added. The parent layer already has six, which is the limit.

## Suggested file and reader

The suggested file elaborates with `lean-check` at Tau Ceti f790474 and Mathlib 082e2d3. Its only
warnings are `declaration uses sorry`, before and after the changes. The changes:

- The trivial example `(1 : ℚ) + (-1) = 0` is replaced by named theorems carrying the packet's six
  Morton test names, proved by `norm_num`.
- `morton_elliptic_quotient_map_2` shows a real hazard. Lean's totalized division sends the excluded
  point (1, −1) to (0, 0), which is the genuine image of (−1, −1). So the guard ζ ≠ 0 matters.
- `nativeHeightCandidateBound` is added.
- A closing block lists the 73 packet API and test names whose carriers are not at the pins.

All 92 packet API and test names now occur in the file and in the reader.

The reader's node sections are rendered from the packet. My renderer reproduced the original reader
byte for byte before any change, and was rerun after the corrections. Also added to the reader:

- a section *Re-pointing of parent declarations at assembly*;
- the four new baseline lines;
- the review verdicts on each source finding;
- the corrected height example and supplier ledger.

## Questions for the orchestrator

1. **ED is not accepted.** The EffectiveDiophantineMethods packet ended its third review round at
   `needs_changes`. DY.3, like its parent, uses seven ED node contracts as stated. Accepting DY.3 does
   not certify them.
2. **Planets.** X₁(n)/X₀(n) and their genus formulas are natural planets, but the DY.3 layer is full.
   At assembly, "Effectivity of dynatomic cycles" could give way to "Genus formulas for dynatomic
   curves".
3. **Open supplier work.** G1 needs the primary ray and basin sources: Douady–Hubbard, Eberlein,
   Petersen–Ryd. The CN.0 request, for an exact number-field carrier, needs a CN follow-up.
