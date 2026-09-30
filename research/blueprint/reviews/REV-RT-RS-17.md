# Verification of RT-RS-17

Codex, session `codex-J6LwjP`, 30 September 2026. Refs #4405.
The bot confirmed claim comment 5913035961. Verification base: `eb3c2f9`.

**Accept the empty finding set.** The red team reports no new findings, so there
are no individual confirmation/rejection rows and no fix job to derive from
this review. Its structural checks reproduce, and the source and ownership
spot checks below support its stated conclusion. This does not certify that
the planned proofs are implemented or that every source dependency is closed.

I did none of RS-17 (`codex-a71f92`), REV-RS-17 (`cc-442dc5`) or RT-RS-17
(`codex-rtOQ9t`). I read the red-team JSON/report, the accepted proposal's
decision, ownership, dependency and migration discussions, and the original
review with its two corrections. I checked selected mathematical boundaries
directly rather than claiming to repeat the red team's entire source audit.

## Structural checks

The accepted research JSON and `data/restructure/RS-17.result.json` are equal.
I ran the red team's printed reproduction code from the repository root and
independently checked the inventories and original review corrections.

| Check | Result |
| --- | --- |
| Native stage set and actions | All 37 stages survive: 28 narrow, 9 keep |
| Family evidence and ownership | 68 records / 34 unordered pairs; every pair has a common ownership decision |
| Audit overlap coverage | All 62 native-audit unordered pairs covered |
| Owner and link inventory | 44 owner contracts, 300 unique link pairs |
| Supplier forwarding | Every narrowed supplier reaches the layer and its old consumers through the specified direct/base links |
| Reviewed audit inventory | 170 target records; 33 not-built and four process stage classifications |
| Integrated decomposition inventory | 29 node IDs all named in the migration report; 39 links, 37 coverage rows and 15 gaps retained as obligations |
| Target-edge cycle checks | No reverse path for an RS-17 edge with known endpoints in the assembled graph augmented by accepted research links and `requires` |
| Forbidden late prerequisites | No late DWP.7–9/EDC.7 path into R34.2, R34.3, LPV.6, the early semistable child or DWP.4 |
| Independent surface route | No DWP.1/DWP.4/WC.3/WC.5 path into the surface-alternative child |

The graph check includes accepted research edges even where the renderer might
decline an edge. It does not claim that unrelated graph components are acyclic.
The 25 `UPSTREAM:` source links remain external contracts: their absence from
the drawable stage graph is already recorded in REV-RS-17, not a newly hidden
dependency.

Both original corrections remain present: DWP.1 retains H0/H2 and finite-base-
extension compatibility; the EDC.5/6 forwarding links to the dropped
ET.2a:duality-perversity stage are absent, with their ET.5 replacements present.
The original proposal report's 302-link count is historical; the accepted JSON
and the red-team check use 300. The report explicitly distinguishes a proposed
stable-ID migration from proof that the migration has already happened.

## Mathematical boundaries sampled

I compared the current stage descriptions and the relevant `keeps` contracts
for DWP.1, DWP.2, DWP.4, DWP.9, LPV.6, LPV.7's semistable/invariant branches,
R34.1–3 and WC.5:surface-alternative. I also read the direct supplier contracts
SF.5, R01.6 and EDC.7.

- The curve seed retains Rosati/Frobenius work and the actual H1/Jacobian
  comparison. It does not import the later general RH or Faltings' theorem.
- DWP.2 retains the Q_l descent/coinvariant bridge and positive-power-series
  argument. An open Q_l monodromy image is not silently declared open after
  coefficient extension, and a Dirichlet-series theorem does not replace the
  power-series proof.
- LPV.6 retains its specified filtered-colimit support extension. The early
  semistable-curve computation remains separate from the later invariant-cycle
  input, and R34.3 imports only the early branch.
- DWP.9 keeps the absolute theorem and both support inequalities for complexes;
  EDC.7's relative/perverse theorem remains downstream. The independent surface
  child retains its own argument and spectral comparison through SF.5 and the
  independent power-sum converse.

I downloaded the two public Deligne originals. Both SHA-256 hashes reproduce
the proposal and red team:

| Source | SHA-256 | Fresh spot checks |
| --- | --- | --- |
| [Weil I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf) | `8392b345d4854e6dc55fb42cfc0b616d941935983723627237239a87348f42e5` | Printed pp.284–285 and 300 |
| [Weil II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf) | `b06eea61bf9cb2b596c162f5befcf85d1be69828910a6107c8aa3a99c4afcc71` | Printed pp.206, 208–209 and 250 |

Rendered page images confirm the pole exponent `−2k/deg(x)` in Weil I and the
valuation pair `(v(alpha), v(q^n/alpha))` in Weil II. These agree with the
already recorded correction instructions. Algebraically, the first follows
from the modulus of a root of `1−alpha^(2k)t^deg(x)`; the second sums to `n`
when `v(q)=1`. The original texts also support the non-hard-Lefschetz
dévissage in Weil I and the two support conditions in Weil II 6.2.13.
I have not independently re-read all of either paper, SGA7 or BBD.

At the exact [PR196 head](https://github.com/TauCetiProject/TauCetiRoadmap/blob/4bd72379658126cbe9be935656396f0c9dac4de0/TauCetiRoadmap/CohomologicalPointCounting/TraceFormula/README.md),
I read TraceFormula Layers 8, 13 and 14. They own the finite-level torsion/
Jacobian comparison and the zeta/L-function constructions cited by RS-17.
The retained arithmetic comparison at R01.6, integral/rational descent at WC.1
and stronger Hodge-index/surface work at SF.5 are not supplied wholesale by
those upstream plans.

I read the six cited declarations and their surrounding assumptions in
[Mathlib Charpoly/Basic.lean at 082e2d3](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Charpoly/Basic.lean):
`LinearMap.charpoly`, `eval_charpoly`, `charpoly_monic`, `charpoly_natDegree`,
`aeval_self_charpoly` and `minpoly_dvd_charpoly`. The finite/free assumptions,
degree theorem's `StrongRankCondition` and minimal-polynomial theorem's field/
finite-dimensional hypotheses agree with the report. These are algebraic
inputs, not implementations of weights, étale theory or semisimplicity.
This verification makes no new named Tau Ceti implementation claim.

## Validation and limits

`check_restructure.py` passes on the accepted target. The red-team review
checker, intake `check-files` and whitespace check pass on this submission.
Only the two review deliverables are changed. No Lean compilation, library
build or language server was run; this review has no suggested Lean file.

The source-interior gaps, upstream rendering limitation and pending
decomposition corrections already recorded by RS-17/REV-RS-17 remain work for
their owners. Accepting this empty red-team result does not mark them complete.
