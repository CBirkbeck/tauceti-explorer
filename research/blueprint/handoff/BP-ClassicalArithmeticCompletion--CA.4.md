# Handoff: BP-ClassicalArithmeticCompletion--CA.4

Follow-up part for layer CA.4 (classical Diophantine equations) of *Classical arithmetic, sequences, polynomials and
reciprocity*, written by Claude (session claude-buloOr), 2026-10-14. Issue #9668.

Deliverables:

- `research/blueprint/packets/ClassicalArithmeticCompletion--CA.4.json` (part `CA.4`, status `complete`)
- `research/blueprint/readmes/ClassicalArithmeticCompletion--CA.4.md`
- `research/blueprint/suggested/ClassicalArithmeticCompletion--CA.4.lean`

## What is closed

The packet has 43 nodes (7 definitions, 4 constructions, 28 theorems, 4 lemmas), 88 API items, 61 unit tests,
6 planets and 46 baseline declarations, each looked up in the pinned declaration index and read in its source file at
Mathlib 082e2d3 / Tau Ceti f790474. `scripts/check_blueprint.py` reports 0 errors and 0 warnings. The coverage record
for CA.4 is `planned`. Every item of the first pass's `remaining` list for CA.4 is answered:

- **Ghosh–Sarnak (all 25 CA.4 requests).** arXiv:1706.06712v3 read in §§1–6, 8 and 10 (§§7, 9 and the appendices for
  context; they are owned elsewhere). One coefficient-one carrier `markoff-level-surface`, defined as the case n = 3,
  a = 1 of `markoff-hurwitz-variety`; the group Γ in `markoff-hurwitz-moves`; `markoff-delta`, `markoff-delta-differences`,
  `markoff-delta-zero-level`; `markoff-level-classification` (admissible / exceptional / generic / Hasse failure);
  `markoff-class-number` (orbit set, h_M, F^±); the descents `markoff-descent-positive-level` (with the small-coordinate
  branch explicit, as the accepted fix asked) and `markoff-descent-negative-level`; `markoff-levels-one-to-three`;
  `markoff-fundamental-sets` (Theorem 1.1); `markoff-class-number-finite` (all k ≠ 4, including exceptional levels,
  through the coordinate-two lines); `markoff-cayley-cubic-orbits`; `markoff-first-hasse-failures`;
  `markoff-class-number-upper-bound`; the parametric nodes; `markoff-explicit-local-points` (Corollary 6.3 by direct
  algebra over any ring with 2, 3 units; the Fricke identity is not needed); `quadratic-gauss-sum-normalisation` (the
  CA.4-owned comparison with Mathlib's `gaussSum`); `markoff-type-point-count-mod-p` (Lemma 6.4);
  `markoff-local-solubility` (Proposition 6.1 with exact 2- and 3-adic points for every admissible class, PAPER-GHOSH-
  SARNAK-22/E2–E3); `markoff-reciprocity-obstruction`; Propositions 8.1–8.3 in four nodes; the infinitude of Hasse
  failures; the quantitative lower bound (gap); `markoff-class-number-enumeration` (computable searches with proven box
  bounds; reproduces A_HF(100800) = 7630 and the Table 5 rows). Conjecture 10.1 is in the document only. The packet's
  `requestResolutions` maps each request to its nodes.
- **Chen 9, 10, 90.** `markoff-level-surface` (X, X*), `markoff-coefficient-three-twist` (ξ over every ring, intertwining
  the moves, an equivalence when 3 is a unit, a bijection on ℤ-points, the zero map over 𝔽₃), `markoff-positive-zero-orbit`
  (Markoff's theorem in trace coordinates, via ξ and the first-pass root generation).
- **Gamburd–Magee–Ronan 1–5.** `markoff-hurwitz-variety`, `markoff-hurwitz-moves`, `markoff-hurwitz-exceptional`
  (Definition 15; kept distinct from Ghosh–Sarnak's exceptional levels), `markoff-hurwitz-signed-to-positive` (§2.1),
  `markoff-hurwitz-moves-outside-compact` (Proposition 16, part (3) scoped to outside K₀ per GMR/E3),
  `markoff-hurwitz-infinite-descent` (Corollary 17).
- **Koymans–Pagano 2–4.** `negative-pell-radicand-sets` (𝒟, 𝒟⁻, truncations), `negative-pell-rational-solubility`
  (elementary: a sum of two squares; d = 34 shows it is not an integral criterion), `negative-pell-prime-one-mod-four`
  (Dirichlet, via the parity of the fundamental solution; Dummit's problem set as the public proof outline).
- **Jacobi triple product and Hirschhorn's specialisations.** `jacobi-triple-product` (two forms, every commutative ring
  and unit), `jacobi-cube-identity`, `theta-product-specialisations` ((ii)–(iv) and Euler's odd-distinct identity),
  `power-series-product-specialisation`. Ownership: the *analytic* triple product is owned by
  GeometryOfNumbersAndQuadraticArithmetic (package README Layer 4, §4.3, "the finite coefficient bridge", upstream PR
  #851), which is tier 3 and precedes CA (tier 5). The formal identity is therefore planned as its counterpart
  (coefficients are Laurent polynomials; compare on ℂ^× by uniqueness of power-series coefficients, then specialise),
  with a request for GN to state the analytic identity as a named target. Pak's bijective proof is recorded as a purely
  formal alternative route.
- **Typed signatures** for the first-pass nodes `markoff-coefficient-one-zero-orbits`, `markoff-positive-root-orbits` and
  `markoff-exceptional-class-number-lower-bound` are in the suggested file (section `FirstPassSignatures`), over the
  carriers planned here.
- **The 45 first-pass review-frontier items** are dispositioned in the packet field `frontierDispositions` and in a table
  in the document: 20 target-level (the finding asks for a split that target level keeps in the proof sketch),
  15 library-supplier (pinned declarations named, each found in the index or the source), 6 supplied here, 4 open
  (named steps of `gaussian-norm-count-multiplicative`, `generalised-pell-finite-classes-and-bounded-search`,
  `ramanujan-nagell-ring-norm-euclidean` and `rational-points-of-y2-x3-plus-x` that their own targets still have to
  state; none is a missing target).

## Mistakes found in the sources (new: E551–E554)

- **E551 (error, Ghosh–Sarnak §2 p. 10).** The orbit of (0, 1, 1) on V₂(ℤ) is finite (16 points, all of V₂(ℤ)), not
  infinite. Note the first pass's request text for item /7 repeats the source's claim.
- **E552 (misprint, §5.1 p. 16).** Sign slips in the second root and the product of roots in the proof of Lemma 5.1;
  the degree argument is unaffected.
- **E553 (gap, §1 (c) p. 4).** h_M(k) ≪ |k|^{1/3+ε} is argued only for non-exceptional levels; on k = 4 + w² a search finds
  ⌊w/2⌋ + 1 orbits through the line (2, t, t + w) (w = 3, 5, 10, 20, bounded search up to coordinates 10⁵; a run with
  larger bounds timed out and was stopped), so the bound appears to fail there. The node is scoped to non-exceptional
  levels. A proof that the line classes are inequivalent was not written; the reviewer may want to confirm or weaken
  the wording of E553 to "the argument covers only non-exceptional levels".
- **E554 (error, p. 4).** The illustration k = 3685 of Theorem 1.1 is an exceptional level ((1, 32, 70) ∈ V₃₆₈₅(ℤ)), so
  h_M(3685) ≥ 7, not 6; the six points are F⁺₃₆₈₅(ℤ). The extraction PAPER-GHOSH-SARNAK-22 item /12 repeats h(3685) = 6.

Inherited and used (not re-recorded): ClassicalArithmeticCompletion/E507, E518; PAPER-GHOSH-SARNAK-22/E2, E3, E6,
E7, E8, E9, E10, E11; PAPER-GAMBURD-MAGEE-RONAN-19/E3.

## Requests and gaps

- Request `GeometryOfNumbersAndQuadraticArithmetic:GN.4`: state the analytic triple product J(z; q) = Σ(−1)^k q^{k(k−1)/2}z^k
  (0 < |q| < 1, z ≠ 0) as a named target (it is the intermediate of `jacobi_product_specialization`).
- Request `GeometryOfNumbersAndQuadraticArithmetic:GN.3/pell-automorph` (the node as planned).
- Gap: unit-class count for X² − (a² − 4)Y² = 4N (≪_ε N^ε) and the divisor bound, needed only by part (b) of
  `markoff-class-number-upper-bound`. The divisor bound is planned only at AnalyticNumberTheory AN.5 (higher tier).
- Gap: Landau–Wirsing lower bound for integers with prime factors in a half-density set, needed only by
  `markoff-hasse-failure-count-lower-bound` (AnalyticNumberTheory AN.5, higher tier).
- The first pass's Catalan–Mihăilescu gap is unchanged.

## Moved down and consumer retargets (for the assembly)

- Moved down from QSeriesPartitionsAndMockModularForms QM.0: the formal triple product, the theta-three/two/four product
  identities and Euler's odd-distinct identity (QM.0 nodes `jacobi-triple-product`, `theta-three-product-identity`,
  `theta-two-product-identity`, `gauss-theta-four-product-identity`, `euler-odd-distinct-product-identity`). QM.0 should
  import `CA.4/jacobi-triple-product`, `CA.4/jacobi-cube-identity` and `CA.4/theta-product-specialisations`; its finite and
  universal (Ramanujan f(α, β)) versions can stay there or be replaced.
- `consumerRetargets` in the packet: add the carriers planned here to the first-pass nodes `markoff-positive-root-orbits`,
  `markoff-exceptional-class-number-lower-bound`, `markoff-coefficient-one-zero-orbits`, and the triple-product nodes to
  `hirschhorn-sixth-power-identity`, `hirschhorn-logarithmic-derivative-identity`, `theta-fourth-power-lambert-series`.
- `closesGaps` lists the first-pass gaps this part closes (the triple product, the Ghosh–Sarnak level-k decomposition,
  the Markoff normalisation and higher-variable continuation, the negative-Pell adapters, the Markoff signature coverage).
- `restructure` proposes sub-layers CA.4a–e (the layer now has twelve planets across the two packets).

## Suggested Lean file

`research/blueprint/suggested/ClassicalArithmeticCompletion--CA.4.lean` (about 1000 lines) elaborates with `lean-check`
against Mathlib 082e2d3 with `sorry` as its only warning (checked 2026-10-14). It imports 21 individual Mathlib
modules (no `import Mathlib`). Light definitions have real bodies (the sets, moves, group, Δ, orbit set, class number,
fundamental sets, the computable searches, the Gauss sum, the radicand sets); every API item and unit test of the packet
appears under its packet name (checked by script). It restates the first-pass carriers `markoffSet`, `markoffVieta`,
`positiveMarkoffTriples` and `pellNormSet` verbatim so that it elaborates on its own; the assembly keeps one copy.
The triple-product statements written with `tsum` assume a Hausdorff coefficient ring.

## Sources read (all public; SHA-256 in the packet)

Ghosh–Sarnak arXiv v3; Gamburd–Magee–Ronan arXiv v3; Chen arXiv v2 (§1.2.1, §5.5); Koymans–Pagano arXiv v1 (§1);
Pak, *Partition bijections, a survey* (author PDF, §§2, 6); Andrews 1965 (Internet Archive copy of the AMS scan);
Zhu arXiv:2106.16156; Dummit, Math 4527 Homework 3; Hirschhorn 1987 (author TeX version). Not obtained: the published
Invent. Math. text of Ghosh–Sarnak (findings are scoped to arXiv v3).

## Where to resume

Nothing in scope is left unplanned. A reviewer should check in particular: the corrected 2- and 3-adic points of
`markoff-local-solubility`; the claim of `markoff-class-number-finite` for exceptional levels (the coordinate-two line
argument); E553's wording; the GN ownership decision for the triple product; and the four `open` frontier items.
