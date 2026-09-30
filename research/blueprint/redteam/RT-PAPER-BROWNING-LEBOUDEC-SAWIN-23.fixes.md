# RT-PAPER-BROWNING-LEBOUDEC-SAWIN-23: fixes

Fixer: Claude Code, session `cc-c2c06b`, 30 September 2026 (issue #4977, job
FIX-RT-PAPER-BROWNING-LEBOUDEC-SAWIN-23).
- Findings: `RT-PAPER-BROWNING-LEBOUDEC-SAWIN-23.result.json`.
- Verdicts: `RT-PAPER-BROWNING-LEBOUDEC-SAWIN-23.review.json`. All six findings are confirmed. This job
  applies the three medium ones (1–3), the ones the issue lists. Findings 4–6 are low and not part of
  this job.
- **Files changed:**
  - `papers/PAPER-BROWNING-LEBOUDEC-SAWIN-23.result.json`;
  - `papers/PAPER-BROWNING-LEBOUDEC-SAWIN-23.md`, which has a new closing section;
  - `packets/ArithmeticStatistics.json`: an ST.2 coverage entry and a GN.0 request.
- **Result.** 129 items (5 library, 7 planned, 117 missing). `check_paper.py` reports ok on the
  extraction and `check_blueprint.py` reports 0 errors on the packet.
- **Independence.** I did none of the extraction (Codex, cc-442dc5), its review (cc-7b31c4), the red
  team (cc-f805bf) or the verification (Codex).

## /1 (medium, other): no sourceVersions, and collation took the paper as read from print: fixed

- **The extraction now declares its reading:** `sourceVersions` has one entry, `preprint` arXiv v1, read
  2026-09-22, SHA-256 `210c746b…1efb`, the hash the verifier reproduced.
- **Its note** says that the Annals text (Ann. of Math. 197 (2023) 1115–1203, 89 pages, revised 22 July
  2022) was not obtained, and that no "published" reading is declared.
- **Result.** `check_errata.versions_checked` now reports no error. `collation.provenance()` returns
  "preprint", so the paper enters the worklist with E3.

**For the maintainer.**
- Regenerate `research/blueprint/collation/REQUESTS.md` with `collation.py --write`. It is not a
  deliverable of this job.
- The free-text fallback in `collation.provenance()` counted "The published text … is subscription-only"
  as a reading of the published text. That needs a tooling fix. RT-PAPER-CESNAVICIUS-19/3 reports the same
  defect.

## /2 (medium, duplicate): σ, ν_{d,n} and Lemma 3.11 were planned twice: fixed

**Items.** sigma, veronese and veronese-gcd are now planned at `ArithmeticStatistics:ST.5`. They moved
off route 7 and their owner field is now ST5. Each note names its blueprint node:
- ST.5/local-density-of-a-form-modulo-q, with the CRT multiplicativity (5.11);
- ST.5/coefficient-vector-form;
- ST.5/veronese-minor-valuation, prime power by prime power.

The planned field names the layer ST.5, not the node: check_paper accepts only atlas layers, and packet
nodes are not atlas layers. The notes say that these are plans in a partial packet, not formalised
results.

**Route 7's brief.**
- It no longer asks the Part II to cover unweighted Veronese coordinates or finite-modulus p-adic factors.
- It imports the three carriers from ST.5 and builds S_V(B) = σ(a_V;W(B)) and the real factor on top.
- Following the verifier, it says the restriction applies only to these shared carriers. The
  consumer-specific primitive-image and norm lemmas stay on route 7.

**The minor gcd.** GN.0 remains the proposed owner of the general maximal-minor gcd. The verifier found no
GN.0 node for it, so the fix adds an explicit request rather than an import that would not resolve:
- the packet gains a request to GeometryOfNumbersAndQuadraticArithmetic:GN.0 for G(c_1, …, c_k)
  (Definition 3.7), stating that ST.5's two-vector G(u, w) is its k = 2 case;
- minor-gcd's note says the same.

**For the maintainer.** The pending design job DESIGN-HeightsRationalPointsAndObstructionsPartII takes
route 7's brief, which now carries the import instruction.

## /3 (medium, missing): the Euclidean local density had no proof route and no owner: fixed

**pv-density-ball's note** is now the proof route, with the verifier's supplements:
- (i) the real factor is the ball fraction of the real-soluble cone, with boundary nullity by reusing
  null-singular's discriminant input, whose range must be extended;
- (ii) a uniform singular-locus bound and uniform Lang–Weil (FF.2), then Hensel lifting. FF.2's upstream
  proof gaps are named as obligations;
- (iii) the codimension ≥ 2 of the reducible locus for (d, n) ≠ (2, 2), by Poonen–Voloch's inequality,
  spread out over Z;
- (iv) the quantitative Ekedahl sieve on the ball, with tail O(1/(M log M) + 1/A), congruence
  equidistribution, boundary nullity and positivity of the product;
- (v) Möbius inversion for primitive vectors and the ± normalisation.

**conic-density's note** transfers Serre's bound by box containment with comparable total counts.

**Route 4's reason** records the owner and the suppliers.

**In the packet.** ST.2's `coverage.remaining` gains an entry for this paper's route 4, naming the three
items, the Euclidean density and the suppliers. Route 4 was previously missing from that list. The verifier
accepted a remaining entry in place of a full node.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-BROWNING-LEBOUDEC-SAWIN-23.result.json`:
  ok.
- `python3 scripts/check_blueprint.py research/blueprint/packets/ArithmeticStatistics.json`: 0 errors,
  0 warnings.
- `check_errata.versions_checked` on the extraction: no error. It failed before this fix.
- `research/blueprint/intake.py check-files` on the four deliverables: no problems.
- Both JSON files keep their own formatting (indent 2).
- No Lean was compiled.
