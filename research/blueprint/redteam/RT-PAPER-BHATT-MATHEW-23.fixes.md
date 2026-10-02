# Bhatt–Mathew: acceptance-test fixes

**Job:** FIX-RT-PAPER-BHATT-MATHEW-23, issue #5521. **Worker:** Codex, session `codex-rtOQ9t`. **Date:** 2 October 2026. **Base:** `84110c5c24dae2dd82eed049a46681ace42e4995`.

Both independently confirmed findings are fixed in the two route briefs and explained in the reader. This session authored the original red-team attack; the fix follows the separate verifier's confirmed verdicts and supplies no self-review verdict. These are errors in acceptance tests, not new errata to Bhatt–Mathew or Bloch–Kato.

## Finding 1: derived weight one over Z_p

Route 1 now imports the existing item `/006`, owned by PrismaticCohomology PR.4/PR.5, and tests

`Z/p(1)_{Spec Z_p} ≃ Rε_*μ_p ≃ fib(p:G_m→G_m)` in `D((Spec Z_p)_et)`,

where ε maps the fppf site to the étale site. Require the cohomology sheaves `H⁰=μ_p` and `H¹=coker(p:G_m→G_m)`. The old degree-zero identification is rejected. This leaves the item, status, owners and syntomic construction unchanged.

The closed-geometric-point test takes p=3 and R the strict henselization of Z₃. Its degree-one stalk is `R×/(R×)³`, and [4] is nonzero. R has maximal ideal 3R and residue field F̄₃. If u³=4, reduction forces `(ū−1)³=0`, hence u=1+3a. Then

`u³=1+9a+27a²+27a³ ≡ 1 mod 9R`,

contradicting `4−1=3∉9R`. This proof covers the strict henselization and all its unramified residue extensions; checking cube residues of integers modulo 9 alone would not do so. It distinguishes cohomology sheaves of the derived object, rather than hypercohomology of a degree-zero sheaf.

The separate `WeightOne.generic_fibre` test restricts to Spec Q_p. Here p is invertible and its Kummer map is étale-locally surjective, so the derived complex becomes the ordinary étale μ_p in degree zero. Bhatt–Mathew Examples 1.2 and 1.5, published p. 2, state the two distinct formulas.

## Finding 2: a domain for the unit symbol

Route 2 now specifies p=3 (or another odd prime) and

`U=Spec Z_p[t,1/(t(1+pt))]`, `j:U[1/p]→U`, `i:U_Fp→U`.

With `z=(t(1+pt))⁻¹`, the inverses are `t⁻¹=(1+pt)z` and `(1+pt)⁻¹=tz`. The Kummer cup product `{1+pt,t}` is therefore defined on U[1/p]. Reducing modulo p makes `1+pt=1` and the inverted product t, so `U_Fp=Spec F_p[t,t⁻¹]=G_m,Fp`.

Restrict the symbol to `M^2_1=i^*R²j_*(μ_p^{⊗2})`. Bloch–Kato (4.3), with π=p, coefficient lift t and unit lift t, sends `t dlog t=dt` to `{1+pt,t}` in the first differential component of the U¹ comparison. The source map initially lands in a graded quotient. For the chosen odd-prime, e=1 test, `e′=p/(p−1)<2` and U²=0 by §1.2, so the U¹ class also gives the requested nearby-cycle class directly. No characteristic-two endpoint convention is silently used in this concrete test.

The verifier sharpens the original diagnosis: `1+pt` is already a unit in every henselian local ring along the special fibre because it reduces to 1. Its generic zero misses that fibre. The essential omitted restriction is removal of t=0; a p-henselization of the punctured affine line is sufficient. Inverting `1+pt` as well is harmless and makes the generic-fibre symbol global on the explicit U. The revised brief records both choices and rejects the global unit test at t=0.

This correction stays within the reused LocalFieldsPartIIKatoSwanConductors brief. It creates no owner, new roadmap, supplier request or second symbol theory. Its three routed Bloch–Kato items are unchanged.

## Evidence and source limits

Fresh bounded reads, 2 October 2026:

| Source | Scope | SHA-256 |
| --- | --- | --- |
| [Published Bhatt–Mathew](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/S205050862200021X) | pp. 2 and 23; p. 2 also viewed | `746b54e8fa02efd0e4a79fa0bee1287d0ef99034a091cfc2cb1301a01e55af1e` |
| [Bhatt–Mathew arXiv v2](https://arxiv.org/pdf/2202.04818v2) | pp. 2 and 24, comparison of Example 1.5 and symbols/Proposition 5.6 | `12eb19e417531addbcf70d85facf33b1649ba5d8845c31ade9128c6000032955` |
| [Bloch–Kato](https://www.numdam.org/item/PMIHES_1986__63__107_0.pdf) | Printed pp. 110–111 and 122: symbols, filtration and (4.3); p. 122 also viewed | `51cf9c3fe85c3d55a6af56c9789c831b810cdd4c9b2c275057dcde6c14730dc8` |

Cambridge's per-download watermark makes the published byte hash vary, as the prior review already records. The v2 PDF and Bloch–Kato hashes reproduce the original red-team artifacts. ArXiv still lists v2 as latest. This repair does not claim a fresh full-paper/e-print/prerequisite-proof audit or revise historical reading claims. Fresh readings are in `repair.supportingReadings`; the original source artifact records and all eight source issues/reviews are unchanged.

Inputs reread include both confirmed findings, the red-team packet and report, the extraction's two affected route briefs, item `/006` and the local symbol contracts, and the reader. Current PR.4/PR.5 descriptions retain the shared syntomic/derived-fibre ownership. The Bright–Newton Kato/Swan brief already owns the Bloch–Kato filtration and retains its own independent review gate; this fix does not accept that separate pending design or remove its obligations. There are no PR.4/PR.5 entries in the currently inspected reviewed library-coverage index. This limited test repair changes no library or planned-status claim and does not purport to perform a new library audit.

The baseline remains Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. No pinned-library statement is newly cited, no object is replanned, and no source issue or embedded review verdict is rewritten. The prior E6 multi-branch semistable proof gap remains in the route and reader.

## Verification

- `check_paper.py` and the three-file `intake.py check-files` pass; `git diff --check` passes.
- Exact preservation checks pass for every original top-level field except the two edited briefs: all 102 item records/statuses (1 library, 27 planned, 74 missing), all seven route memberships/owners, ten prerequisites, eight source issues/reviews, source and baseline. All 74 missing items still occur in exactly one route.
- The source-version boundary check passes. No new stated-result source criticism is introduced.
- Mathematical sanity checks pass for cube residues modulo 9, the binomial congruence, and special-fibre unit/domain reductions at p=3,5,7. The general strict-henselian proof and localization identities above supply the reasoning beyond those samples. These checks are not a formalization of derived sheaves or nearby cycles.
- Only the three authorized deliverables change. No Lean deliverable is required, produced or compiled; no library build, cache download or language server is used.
