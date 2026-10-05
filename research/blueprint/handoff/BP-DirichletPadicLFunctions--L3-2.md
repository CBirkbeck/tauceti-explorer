# BP-DirichletPadicLFunctions--L3-2 handoff

Worker: Codex, session `codex-707vA6`, issue #6340, 2026-10-05.

This target-level follow-up pass is complete. Its sole stage,
`DirichletPadicLFunctions:L3`, has coverage **planned**, with nothing claimed
closed or implemented. The packet has 79 new declarations: 9 definitions,
66 lemmas and 4 theorems, with 27 promoted API items, 31 acceptance tests,
5 planets, 26 pinned Mathlib baseline declarations, 5 gaps and 8 requests.
The predecessor's one planet brings the combined L3 selection to six.
Every new declaration has implementation status `unchecked`.

The packet, reader and suggested file are the three `DirichletPadicLFunctions--L3-2`
deliverables. New node ids begin `DirichletPadicLFunctions:L3/rjw2-`.
The accepted first L3 packet and its 1,663 nodes, 16 gaps and 13 requests are
unchanged; the follow-up imports its actual cyclotomic constants, complex
value at one, Morita Gamma and chosen-root Gross–Koblitz comparison.

## What this pass establishes as a plan

* Actual integral branch adapters using the native continuous dual and Mahler
  additive character, including the inverse Teichmüller convention and the
  dyadic chart with generator 5. Full finite characters, including wild parts,
  are absorbed using PMIA L2 measure weighting before applying LAD L3's
  torsion-component Mellin transform with trivial torsion factor.
* Interpolation through the primitive inducer and its actual Euler factor;
  the arithmetic analytic numerator, denominator and branch germ; a simple
  principal pole from the actual numerator mass and denominator derivative;
  nonprincipal analyticity and the coordinate-dependent function residue.
* Leopoldt's value at one in the tame, pure p-power and mixed-conductor cases.
  The tame primitive retains its cyclotomic logarithm constant. The pure-power
  case uses the regular smoothed primitive, the positive Gauss twist, the
  reduction-kernel trace cancellation, and an explicit clearing factor.
* A finite-period, positive-residue permutation, normalized antidifference
  and uniformly bounded coefficient-limit proof route for Ferrero–Greenberg.
  The Euler correction, exceptional interpolation zero, derivative evaluation
  and arithmetic nonvanishing are separate declarations.

## Confirmed red-team findings

**RT-AREA-iwasawa-2/1:** Morita Gamma remains owned by this roadmap's accepted
first L3 packet: existence, continuity uniqueness and both recurrences are
imported. Its Gross–Koblitz formula is also imported. The new root comparison
retains the integral congruence modulo the square of the root ideal, rather
than a vacuous field ideal, and gives the separate dyadic choice
pi = -2, zeta = -1. The original RD.6 supplier obligations remain explicit.

**RT-AREA-iwasawa-2/2:** Ferrero–Greenberg follows Leopoldt in the reader.
The formula uses primitive odd chi and the even branch chi times omega.
The exceptional hypothesis chi(p)=1 is explicit in its zero and simplified
derivative declarations. Nonvanishing requires an additional arithmetic
character-projection argument; it is not inferred from the derivative
identity or from Baker–Brumer alone.

## Where to resume

Resolve the five named gaps and the coverage record's remaining list:

1. PMIA L0a must expose the standard odd/dyadic native character chart;
   PMIA L3 must extend actual admissible pseudomeasure evaluation to finite
   coefficient extensions. Replace the corresponding conditional native
   probes by these actual supplier interfaces.
2. Three LAD L1 requests specify the native p-adic exponential germ and
   exp/log agreement, the normalized continuous Mahler antidifference, and
   uniform analytic coefficient-limit differentiation. The latter must
   establish convergence on a positive radius, not differentiate a pointwise
   limit. The existing LAD L3 component Mellin exports are reused.
3. PMIA L2 must identify the actual Zhao cylinder/sign convention and provide
   the finite-projection sums and all-prime smoothed coefficient/rotation
   comparison. The predecessor's odd-prime smoothed-moment theorem is not
   treated as a theorem at 2.
4. Read a public primary proof of arithmetic nonvanishing. Gross–Dasgupta
   cites Brumer but does not supply the required ideal/character-projection
   calculation. Construct a multiplicatively independent basis of the actual
   Gauss/Jacobi orbit products modulo the common logarithm's kernel and prove
   that the primitive odd character has a nonzero coefficient vector.
   IntegralIwasawaTheory L0 is requested for generic ideal factorizations,
   and L4 for generic Baker–Brumer independence. The nonzero projection is
   Dirichlet-owned and remains a gap before applying those suppliers.
5. Preserve and refine the first packet's exact Dwork RD.6 coefficient and
   splitting requests and its Kubert frontier. Consult its original coverage,
   gaps and requests; do not duplicate or erase that accepted work.

These are the eight requests in the packet: PMIA L0a, L3, L2; LAD L1 three
distinct interfaces; IntegralIwasawaTheory L0 and L4. Their full hypotheses
and consumer ids are recorded there. No supplier files were changed.

## Sources and source finding

Fresh public reads were RJW's published 2025 article, selected sections 5.3,
6 and 7; Morita's 1975 opening definition and recurrences; Gross–Koblitz's
1979 opening root/negative-Gauss conventions and Theorem 1.7;
Gross–Dasgupta's section 2; and Zhao's published 2022 sections 3–4 and
Appendices A–B. The corresponding Zhao preprint was collated. Precise
locators, public URLs, reading date and SHA-256 hashes are in the packet and
reader. These selected passages, rather than whole papers, are claimed as
fresh reads. Robert's book was not freshly read; its accepted predecessor
locators are inherited. A full primary arithmetic nonvanishing proof and the
inherited Kubert source frontier still need reading.

New finding `DirichletPadicLFunctions/E37` records Zhao Appendix B.2's
normalized-antidifference endpoint and Gamma argument mismatch, present in
both the published article and preprint. The correction is the strict natural
interval and Gamma(x), agreeing with equation (4.4). The p=5, x=2 check
distinguishes it from the printed Gamma(x+1). Publisher metadata, arXiv
history and the author's article list yielded no correction. This finding
awaits independent review; no self-review verdict was added. Existing relevant
RJW and Coleman corrections are imported without duplicate erratum ids.

## Validation

`python3 scripts/check_blueprint.py research/blueprint/packets/DirichletPadicLFunctions--L3-2.json --json`
reports zero errors and zero warnings. Source-issue and version checks pass,
fresh source hashes agree, and every new registry declaration has a matching
native signature and reader entry.

The suggested file **compiled successfully** using `lean-check` against
Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`: exit 0, exactly 110 expected
declaration-uses-`sorry` warnings, no other warnings or errors. The shared
machine had more than 20 GB available before elaboration. No builds, cache
updates or language servers were started. The Tau Ceti baseline is
`f790474821cf4256814db967cb154e7af3d0c369`; no Tau Ceti declaration is asserted
as a baseline provider here. All 26 cited Mathlib statements were read at the
pin. No declarations index was available, so the packet checker verifies
baseline reference form; source inspection and elaboration provide the
additional checks.

Independent finite arithmetic checks validated 24,687 permutation points in
67 cases for primes 2, 3, 5 and 7, conductors 1 through 12 coprime to the prime,
and powers with exponents 1 through 4 satisfying the required congruence.
They checked the range, modular inverse, bijection and strict filtration
equivalence. Small Bernoulli carry cases were also checked. These finite
checks are sanity checks on the planned formulas, not formal proofs.

Conditional prototypes are labelled at their supplier boundaries; successful
elaboration does not turn their scalar inputs into the missing arithmetic
objects. All essential continuation information is in these four committed
deliverables; scratch sources and logs may be deleted after submission.
