# PAPER-SHENDE-TSIMERMAN-17 — finite counting handoff

Codex — codex-c83e7a; 23 September 2026; Refs #1334. **Partial.**

Read N1–N5 of the current report first. This continuation has 150 items
(13 library, 22 planned, 115 missing), 14 existing routes, 99 missing items
routed once, 40 definition/construction API/test blocks, 60 selected DAG
edges and 21 proposed v1 source findings. All 131 prior item statements and
statuses, original routes and 16 withheld claims are preserved. E9/E12 gain
explicit proof evidence. The previous weighted-Abel work remains intact.

New work:

- Degree-one divisor: choose extension points over consecutive n,n+1 with
  q^n>4g², and subtract their pushforward divisors. Uses WC.5; does not
  assume a rational point or claim a new implementation of Weil bounds.
- Finite-field Picard comparison: normalize a semilinear Frobenius descent
  isomorphism by a scalar of prescribed finite-field norm. Its cyclic
  cocycle then descends using JC.C/D. Flat base change gives injectivity
  and the rational-effectivity comparison.
- Picard quotient Q has 2h elements and h per degree parity. Unique
  degree representatives give exact tail counts. Coordinates contain the
  carry c=κ−2D₀; the set bijection need not split the group.
- Exact formulas ν(L)=2e(L)−deg L+g+1 and the involution identity keep the
  ratio inverse and unique κ-twist explicit. Joint intersection counts
  have denominator 2h, or h conditionally, independent of dimension bounds.
- Curves y²=2((x^p−x)²+1) over F₃/F₅ have no rational points but explicit
  degree-one divisors P₃−P₂ and P₅−2P₂. The F₃ genus-two example has h=4
  and finite bundle masses 1/2, 3/8, 1/8 at indices 0, 1, 3.

Resume:

1. Obtain and match the final 44-page Duke text; fresh canonical requests
   still returned security HTML. All findings concern v1 only.
2. Do not redo index-one/finite-normalization as an unexplained gap.
   General Galois sheaf descent, coherent flat base change and the
   scheme/function-field adapters remain imported upstream proof tasks.
3. G3 still needs the contour/class-number asymptotic and original
   analytic supplier proof closure. G1 still needs the stack/adelic
   inverse-automorphism comparison, with the ramified unit model in G8.
4. G2 retains the previous characteristic-five weighted-fiber
   counterexample. Restricted downstream weights, septuple rank and
   all-characteristic theta geometry remain unresolved.
5. Continue G4–G7: signed Morse/IC comparison, polar multiplicities and
   constants, full later Sawin proof, small-ratio dynamics and varying
   split-place uniformity. Keep all 16 withheld items withheld.

Fresh sources: main v1 selected pp.7–16 and 29–34, images 30/33; Milne
Jacobian Varieties (2021 author version) §1 and §11, pp.2–5 and 35–37.
Earlier full 40-page main reading and selected AT/IY/MS/Sawin readings stay
attributed to previous submissions. Milne's references for the general
Galois-descent proof were not acquired. Four generic library statements
were read at the exact pins; none is an implemented application theorem.

The embedded standard-library regression passes 141022 exact checks.
No Lean file was requested, written or compiled. Final paper/intake and
preservation/route/DAG checks are recorded in the report and JSON.

---

## Previous handoff (preserved with attribution)

# PAPER-SHENDE-TSIMERMAN-17 — continuation handoff

Codex — codex-a71f92; 22 September 2026; Refs #1334. **Partial.**

Start with W1–W4 of the current report, not an attempt to prove unrestricted
characteristic-p weighted finiteness: the new explicit example shows it
false. The earlier report/handoff remain below with attribution.

On C:y²=x⁵−x in characteristic five, for P=(a,b) with b≠0,a²⁵≠a, put
Q=(a²⁵,−b²⁵), t=x−a, H=b⁶+2b⁴t+3b²t²+4t³, G=b⁵y−H.
The exact norm identity is G(b⁵y+H)=t⁵(b¹⁰+b²−t).
Local orders give div(G)=5P+Q−6∞. The open one-dimensional family has
h⁰(P+Q)=1 but infinitely many divisors in |6∞|. No Jacobian Frobenius
identification is assumed. This does not refute the later equidistribution
theorems or by itself Corollary 2.20's restricted weights 1 and 2.

Resume:

1. Obtain the legitimate final 44-page 2017 text. Fresh publisher access
   again returned security HTML; all 21 sourceIssues are proposed v1-only.
2. For each downstream weighted application collect TOTAL multiplicities
   on the fixed support stratum before reducing modulo the characteristic.
   Nonzero original weights do not suffice on overlaps. Preserve the
   refined weighted-fibers statement and the rank/kernel contract W1.
3. Rework the actual residual weights and critical-locus argument,
   especially characteristic two and the separate septuple-rank error.
   Do not infer failure or validity of this branch merely from weights 5,1.
4. Match the concrete smooth model, local orders, point/divisor/line-bundle
   dictionary and family morphism to the existing AC7/10/12 and JC plans.
   Four verified generic library suppliers do not implement these adapters.
5. Continue inherited G3–G9: index-one/count normalization, signed Morse
   and étale IC, polar multiplicities, full later Sawin proof, small-ratio
   dynamics/variable split-place estimates and ramified unit-level torus
   measures. Keep all 16 inherited withheld items withheld.

Current totals:131 items (9 library,20 planned,102 missing),14 routes,
86 missing routed once,38 definition/construction API/test blocks,
12 selected edges,21 proposed main-preprint sourceIssues. Original122 IDs
and statuses preserved; only weighted-fibers has a refined original
statement. Four new missing theorem plans reuse the existing Jacobian
Part II; one model instance imports AC10/12. No new roadmap or carrier.

Fresh reading: all40pages of arXiv1307.8237v1, bibliography and appendix,
page7image; exact generic declarations at Mathlib082e2d3/TauCetif790474.
Previous AT/IY/MS/Sawin readings remain historical PR1657 evidence.
The report includes the passing exact F5 polynomial and F125 regression
(120 eligible divisors,15000 specialized identities). No Lean file
requested/written/compiled. Schema and three-file intake pass (0 problems), as do preservation,
route/API/DAG and report-extracted regression checks. Publication base:
a4a17bf2ff12608cc0f7c13a5bd6c6af7eb7ca22; relevant protocol/catalogue/audit
and checker hashes are unchanged. Successful checks do not close G0–G9.

---

## Historical handoff from PR #1657 (unchanged)

# PAPER-SHENDE-TSIMERMAN-17 handoff

Codex — `codex-c83e7a`; Refs #1334. **Partial checkpoint.**

The entire 40-page public arXiv v1 was read; the 44-page 2017 final article was not obtained or matched. Deliverables contain 122 items ({'planned': 19, 'library': 5, 'missing': 98}), 38 D/C APIs with at least three tests each, 14 ownership routes and two Part II briefs. 16 missing items are explicitly withheld. No formalization or Lean compilation is claimed.

Resume with the report's G0–G9. First obtain the final article and compare each flagged display. Then resolve the characteristic-dependent weighted Abel argument, signed Morse inequality, doubling pushforward factor and ramified torus level. Read the original supplier proofs listed in JSON; complete the étale theta comparison and the small-ratio function-field Linnik transfer. Check the later Sawin source independently, including final version and its coefficient normalization. Preserve existing GS/EDC/SF/WC/DWP/AA/ST owners; never replan upstream JC or AC. All item tests and suggested design files are in the deliverables.

Unrouted IDs: `main-single-source`, `main-joint-source`, `main-hecke-source`, `weighted-source`, `nash-source`, `septuple-rank`, `effectivity-source`, `complex-betti-source`, `morse-source`, `polar-coefficient-source`, `polar-multiplicity-source`, `trace-formula`, `linnik-transfer-source`, `maxcompact-source`, `hecke-mixing-source`, `sawin-context`.

Checks: source and semantic audit, `python3 scripts/check_paper.py research/blueprint/papers/PAPER-SHENDE-TSIMERMAN-17.result.json`, and `python3 research/blueprint/intake.py check-files research/blueprint/papers/PAPER-SHENDE-TSIMERMAN-17.result.json research/blueprint/papers/PAPER-SHENDE-TSIMERMAN-17.md research/blueprint/handoff/PAPER-SHENDE-TSIMERMAN-17.md`. The publication is a checkpoint, not completion of the paper job.
