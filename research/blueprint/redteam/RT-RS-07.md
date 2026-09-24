# RT-RS-07 — analytic number theory and arithmetic statistics

Codex — `codex-a71f92`, 2026-09-24. Refs #1619. Complete bounded red-team report, not a blueprint or a proof audit.

One medium finding: the accepted dependency reversal is lost in integration. The ownership decisions themselves, including the independent review's quartic/Davenport corrections, survived the checks below.

Input snapshot: [9bafe01650e531e445ddc4c723d239c061dfb6ee](https://github.com/CBirkbeck/tauceti-explorer/tree/9bafe01650e531e445ddc4c723d239c061dfb6ee). RS-07 was authored by ChatGPT `g6-astra-20260921-r7c4` and reviewed by Codex `codex-c83e7a`; neither is this worker. Claim comment 5805715446 was confirmed by bot comment 5805716864 before work began. The reviewed proposal and `data/restructure/RS-07.result.json` agree.

## Finding /1: a scope change without its supplier edge

Let A = `AnalyticNumberTheory:AN.3` and S = `SieveMethodsAndPrimePatterns:SV.2`. The accepted plan removes A → S, then adds S → A: large-sieve/bilinear estimates supply the chosen zero-density route, not the other way round. This is explicit in both layer decisions, the link rationale and [RS-07.md §6](https://github.com/CBirkbeck/tauceti-explorer/blob/9bafe01650e531e445ddc4c723d239c061dfb6ee/research/blueprint/restructure/RS-07.md#6-integration-order-consumer-repair-and-cycle-rejection).

The current [application function](https://github.com/CBirkbeck/tauceti-explorer/blob/9bafe01650e531e445ddc4c723d239c061dfb6ee/scripts/restructure.py#L27) starts with the old edges, updates annotations, and inserts links only if they do not close a cycle. It has no preceding operation consuming the removal ledger. Consequently it sees A → S and rejects S → A. Nevertheless A's `restructured.suppliedBy` includes S.

| Check | Accepted plan | Actual application |
| --- | --- | --- |
| A → S / A in S.requires | absent | present |
| S → A / S in A.requires | present | absent |
| S in A.restructured.suppliedBy | present | present |
| Directed cycle | absent | absent, because the new edge was skipped |

The defect reproduces with RS-07 alone, all promoted proposals, and `build.assemble(require_distances=False)`. The first two runs add respectively 31 and 29 previously absent stage edges. Both record 17 skipped entries: 16 `UPSTREAM:` source addresses, plus the one real-stage edge S → A. The source addresses are not stage IDs, so their absence from the stage graph is not treated as another defect.

Minimal read-only reproduction from the repository root:

```python
import json, sys
from pathlib import Path
sys.path.insert(0, "scripts")
from restructure import apply_restructurings
from build import assemble
p = json.loads(Path("research/blueprint/restructure/RS-07.result.json").read_text())
a = json.loads(Path("data/atlas.json").read_text())
A, S = "AnalyticNumberTheory:AN.3", "SieveMethodsAndPrimePatterns:SV.2"
out, _ = apply_restructurings(a, [p])
for label, data in [("isolated", out), ("assembled", assemble(require_distances=False)[0])]:
    stages = {s["id"]: s for s in data["stages"]}
    pairs = {(e["source"], e["target"]) for e in data["stageEdges"]}
    print(label, (A, S) in pairs, (S, A) in pairs,
          A in stages[S]["requires"], S in stages[A]["requires"],
          S in stages[A]["restructured"]["suppliedBy"])
# Both: True False True False True
```

The corrected tuple is `False True False True True`. Apply removals before insertions and keep adjacency, `requires`, `consumers` and scope metadata consistent. Retain SV.1 → SV.2, AN.2 → AN.3 and the downstream SV.2/AN.3 → SV.3 inputs. Test the isolated proposal, all accepted proposals and full assembly. Do not weaken the cycle guard or reverse the mathematically justified ownership decision.

This is the same generic application mechanism as [RT-RS-15/1](RT-RS-15.result.json), submitted in [PR #2604](https://github.com/CBirkbeck/tauceti-explorer/pull/2604), now independently reproduced on RS-07. Coordinate a shared integration correction. This submission changes neither the engine nor the accepted proposal.

## Conservation and ownership attack

Read all three member documents and all 22 layer decisions, the complete ADS document, EC Layers 6–8, the original report and independent review. The 29 overlap leads reduce to 21 unordered pairs; each has a kept/imported boundary. The accepted inventory is 6 keep, 13 narrow, 3 drop; 32 distinct owner targets; 58 distinct links. The old report's 7/12 and ST.1 `keep` entries predate its review. The review explicitly identifies its corrections and says the original report was not edited, so those stale counts are not reported as a new mathematical defect.

| Layers | Conservation checks |
| --- | --- |
| AN.0–1, dropped | Rational arithmetic/series/Abel/Mellin and continued zeta/Dirichlet functions remain library imports; ideal-indexed refinements and Perron remain ADS-owned. Preserve convergence, primitive/imprimitive factors and endpoint conditions. |
| AN.2–4 | Quantitative regions and actual PNT instances remain AN.2; explicit formulas, density/mean-value estimates and RH/GRH register remain AN.3; arithmetic/Tate comparison, boundary analysis and Artin distinctions remain AN.4. ADS's conditional transfer is not an unconditional PNT. |
| AN.5–6 | AN.5 keeps pretentious/smooth/divisor/moment and Beurling branches. The AN.6 register is redistributed to actual producers; no stage consumer of AN.6 exists. |
| AN.7–9 | General Lerch branches/comparisons remain beyond the circle-valued API. ST.0–1 supplies arithmetic data to analytic PVS zeta, not a second orbit bijection. Spectral zeta/determinants and Bost–Connes/KMS remain distinct retained branches. |
| ST.0–1 | EC.8 owns the canonical curve-height carrier. ST.0 owns quartic I/J, relative weights, eligible pairs and height comparison. ST.1 imports these and proves orbit/stabilizer/local-solubility/Selmer comparisons. |
| ST.2–5 | GN.4 owns the specified generic Davenport estimate; ST.2 retains moving-domain applicability, cusps and uniform tails. Field/class-group statistics, Selmer averages/rank deductions and higher moments remain separate targets, not consequences of per-field or per-curve formulas alone. |
| SV.0–2 | Library weighted-sieve data and lambda-squared upper bounds are imported. Remainder-sum distribution, lower bounds, optimization/fundamental lemma, parity and large-sieve/Vaughan estimates remain explicit work. |
| SV.3–5 | BV retains its quantified range/losses; bounded-gap weights and admissibility do not assert twin primes; weighted/Chen/affine branches retain distinct hypotheses and multiplicity conventions. |

Checked outside-family contracts AC.4, AL.0–3, CN.4, ES.4, GN.4, ML.3, PS.1, PM.0 and GlobalNumberFields Layer 9. The proposal retains consumer work rather than treating Fourier theory as a completed spectral-zeta theorem, a GL1 comparison as the full Sato–Tate input, or a point-height as curve height. No new link targets a Tau Ceti stage. Isolated application leaves upstream content and prerequisites unchanged; new derived consumer entries are expected.

All five surviving consumers of deleted stages have replacement imports: PM.0/SV.0 from AN.0 and AN.2/AN.7/PS.1 from AN.1. All narrowed-layer `suppliedBy` entries have corresponding proposal links. The complete raw graph has 3,508 edges. Removing the incident edges of the three dropped stages and A → S, then adding all 58 links, yields an acyclic 3,545-edge graph, counting `UPSTREAM:` source-address vertices. There are 11 raw removals; LI.2 → AN.0 belongs to an already retired roadmap, hence 10 active removals as the previous review reported. An additive-only application fails the cycle test; the actual engine instead skips the new edge.

Inspected all 18 inherited node statements/parent assignments and their migration destinations: ten analytic nodes, eight statistics nodes, six analytic links and nine statistics links. All node statements and all 15 links survive full assembly. Both packets are still partial. Four Tate analytic nodes are assigned to AL.1 with AL.0 input; the arithmetic-series comparison and Artin interface remain AN.4; the two AN.1 nodes become import/provenance records. The statistics chain preserves quartic data → orbit comparison → counting/uniformity → Selmer average → statistical rank deduction. This preservation test does not claim the future node migration is already implemented or certify the inherited proofs. Tate's admissible Z class, zero residues, near-line versus whole-plane Artin continuation, small-height zero-free extension and explicit-formula endpoint gates stay open exactly as the accepted restructuring requires.

## Primary-source and pinned-library checks

Re-fetched [Bhargava–Shankar, arXiv:1006.1002v3](https://arxiv.org/pdf/1006.1002v3) on 2026-09-24; SHA-256 `7670970aca5df135af4ab4da926d3b2e3acc937dd5a6c918f802552c528712cf`. Proposition 2.6, printed p.12, has the bounded semialgebraic multiset, maximum projection-volume error and uniform complexity dependence now assigned to GN.4. The following paragraph explains the multiset reduction. Printed p.22 fixes the minimal-pair carrier, I = −3A and J = −27B; its height comparison is exactly the retained ST.0 contract. This targeted reading is not a new full reading of the paper or Davenport's original proof.

Direct statement reads used Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`:

- [Convolution](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/LSeries/Convolution.lean#L149), `LSeries_convolution'`; [derivative](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/LSeries/Deriv.lean#L80), `LSeries_hasDerivAt`; [Abel](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/AbelSummation.lean#L129), `sum_mul_eq_sub_sub_integral_mul`; [Mellin inversion](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/MellinInversion.lean#L92), `mellinInv_mellin_eq`. Their summability, strict-abscissa, differentiability/integrability, positivity and continuity hypotheses remain required.
- [Dirichlet continuation](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/LSeries/DirichletContinuation.lean): `LFunction_eq_LSeries`, `LFunction_changeLevel`, `IsPrimitive.completedLFunction_one_sub`; [nonvanishing](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/LSeries/Nonvanishing.lean#L387), with principal-pole exclusion; [Riemann zeta](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/LSeries/RiemannZeta.lean#L173), trivial zeros, functional equation and statement-only RH.
- [Character conductor/primitive reduction](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/DirichletCharacter/Basic.lean#L246) and [orthogonality](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/DirichletCharacter/Orthogonality.lean#L58), keeping nonzero level, roots of unity, domain and unit hypotheses. Finite-field characters alone do not replace composite-modulus Dirichlet characters.
- [Dedekind zeta](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/NumberField/DedekindZeta.lean#L77): a real right-limit residue, not complex continuation. [Hurwitz/expZeta](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/LSeries/HurwitzZeta.lean#L130): the exponential series corresponds to z·Phi(z,s,1), with the first positive-index term, not Phi alone.
- [Selberg sieve](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/SelbergSieve.lean): `BoundingSieve`, `SelbergSieve.level`, `siftedSum_le_mainSum_errSum_of_upperMoebius`, `lambdaSquared`, `upperMoebius_lambdaSquared`. Weight truncation is not remainder-sum control; the upper-Mobius construction needs weight 1 equal to 1.
- Tau Ceti [Perron Basic](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/ArithmeticDirichletSeries/Perron/Basic.lean#L203) and [Formula](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/ArithmeticDirichletSeries/Perron/Formula.lean#L221): arctan endpoint, off-endpoint error, and off-natural-cutoff arithmetic formula. [SelmerGroup](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/SelmerGroup.lean#L104): explicit subgroup and rank estimate with `AddGroup.FG` and `Finite S`, not a standalone finiteness proof.

Reviewed coverage records were consulted as ownership/status evidence. Their remaining absence assertions are not promoted to new independently exhaustive library-search claims. Tate/Kedlaya PDFs and inherited proof hashes were not re-fetched for this restructuring attack. No theorem is claimed formalized by this work.

## Validation

Passed `check_restructure.py` on RS-07, `check_redteam.py` on this result, two-file intake validation, 58 restructuring/red-team/queue/intake unit tests, and the scratch inventory/conservation/graph/application assertions described above. The reproduction exposes a semantic integration failure despite those standard checks passing. No Lean deliverable is requested; Lean was not run. Only this report and its result JSON are submitted; accepted files, anchors and generated data are untouched.
