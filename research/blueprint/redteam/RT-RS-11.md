# RT-RS-11 — Main conjectures and automorphic congruences

Codex, session `codex-rtOQ9t`, 30 September 2026. Issue #5107.
Baseline: `e1d958f420eb6f860b7980dd833e3e053854c4a0`.
I neither authored RS-11 nor reviewed it. The author was ChatGPT Astra Pro
(`astra-7c41e9`), and the reviewer was Claude (`cc-39fac3`).

The audit is complete, with **three medium findings**. The substantive
narrowings conserve their targets. The remaining defects concern proof owners
and branch order. All three intersect previously confirmed area findings;
this report records precisely what the accepted RS-11 still fails to resolve,
and credits the repairs it already contains. It does not present those older
discoveries as new ones.

Here `C` abbreviates AutomorphicCongruences, `I` ModularIwasawaMainConjectures,
and `K` KatoEulerSystems. Layer identifiers below are otherwise unchanged.

## What was read and conserved

I read the family input, original report, accepted result, review, both complete
member documents, all 17 reviewed coverage entries, five owner records, six
corrected links and ten family evidence rows. The accepted JSON is operative:
the original report's invented chain I.L2 → I.L3 → I.L4 is not used.

| Contract | Result of the target-conservation check |
| --- | --- |
| I.L2 narrowed to import C.L4 | FW 1.7's residual, local-at-p, auxiliary-prime, even-weight/half-weight-twist, tame-level and coefficient conditions survive. Ordinary and crystalline signed consequences remain confined to the intersection of the imported hypotheses. No scalar p-adic L-function at every bad-reduction point is inferred. |
| I.L3 narrowed to import C.L5b | BCS 1.1.2 retains good ordinary p > 3 and irreducibility for torsion/equality after inverting p; the integral conclusion retains the actual rank-one-image condition. Curve/form, period and Tate-lattice comparisons remain construction targets here. Residual surjectivity is not substituted for that condition. |
| I.L4 narrowed to import C.L4 | The universal theorem remains over the regular coefficient subring O[[X1,X2,X3]], not an arbitrary singular deformation ring. Additional derived specialization and Euler/local/Tor comparisons remain. LLZ's signed, basis-dependent and image-of-Coleman comparisons are retained. |
| C.L0, L1, L2, L2s | Source-specific local verification is retained; SU U(2,2), FW U(3,1), and CLW semi-ordinary GU(3,1) are not collapsed into one theorem. The ordinary FW owner is nevertheless wrong: finding /1. |
| C.L3, L4 | Universal zeta construction precedes the integral main conjecture. Generic determinant machinery is imported from PMIA L5, consistently with RS-16. The FW pointwise and universal proofs have one owner at C.L4. |
| C.L5, L5w, L5a, L5b | The aggregate is explicitly not another proof owner. Wan–Fujiwara's hypothesis-bearing theorem and its Hilbert/quartic-CM construction remain; the BCS child supplies both cyclotomic endpoints. The locator correction is right. Findings /2 and /3 concern the remaining dependencies and shared comparison. |
| I.L0, L1, L5, L6 | Common formulations and normalization maps, ordinary two-bound assembly, arithmetic consequences and late branch comparisons remain. RS-14's analytic existence proposition stays at AutomorphicPadicLFunctions L5. The I.L1 ordinary seed is early enough for C.L4. |

The FW source check distinguishes height-one integrality (Proposition 5.5),
classical seeds (5.6), the unit conclusion (5.7) and subsequent pointwise
specialization (5.8). The pointwise/family proof owner therefore need not
import I.L2 or I.L4 backwards. The ordinary seed from I.L1 is appropriate once
its own reverse-bound owner is corrected.

## Findings and prior work

**/1 — Move the ordinary FW argument out of its prerequisite.**
RS-11 C.L1 retains a supposed ordinary period refinement and tells that layer
to import C.L2 ingredients. In the primary source, FW §4.8 instead runs through
the U(3,1) theorem, Beilinson–Flach reciprocity and Poitou–Tate owned downstream
at C.L2. The graph already has C.L1 → C.L2; adding the promised reverse import
would be cyclic. Keep SU at C.L1, put the FW reverse-bound construction after
the C.L2 inputs, and retain final equality assembly at I.L1. The owner and link
reasons must agree. Confirmed RT-AREA-iwasawa-1/22 and its fixes report already
request that exact amendment to RS-11. This report independently checks the
source and the still-conflicting accepted owner.

**/2 — Finish removing the obsolete BCS prerequisites.**
The new direct K.L4 → C.L5b edge is correct. Keeping completed HE.8b → C.L5b is
not: BCS proves its cyclotomic theorem from the early product bound, control and
the four Kato bounds. Its anticyclotomic conclusion is a separate branch.
Confirmed area finding /31 already says to remove the HE.8b edge; RS-11 instead
expressly preserves it. There is a second surviving detour: the review removes
C.L4 → I.L3 to avoid waiting for FW, but C.L4 → C.L5 → I.L3 still has that
effect. I.L3 can use its named child supplier and explicit interfaces directly.
The two proposed deletions remove every C.L4 → I.L3 path in this graph. They
do not remove early local-control, period, mu or auxiliary-field work.

**/3 — Resolve the shared ordinary BSTW comparison.**
Correcting the BCS theorem number does not provide its arithmetic supplier.
BCS Theorem 4.1.3 invokes BSTW §9.3.2 and the two-variable zeta element's
reciprocity laws; Corollary 4.1.4 is the product comparison. C.L5a retains that
mathematics while BSD.6a explicitly constructs the same ordinary material as
part of its larger ordinary/supersingular scope. There is no import in either
direction. Confirmed area finding /30's fixes report proposes an ordinary
Kato L5 prefix. It is still absent from the current graph and reserved IDs.
RS-11 must record a single shared owner and imports, coordinated with that
handoff. C.L5a retains the BCS product argument; BSD.6a retains its
supersingular extension, Castella branch and BSD applications.

These are limited, repairable planning defects, rated medium consistently with
the corresponding verified area findings. No false main-conjecture conclusion
is alleged. The prior fixes report describes intended edits; it is not evidence
that they have already changed a live layer. Its /22, /30 and /31 sections were
read for the proposed corrections, rather than treated as accepted proofs of
new theorems.

## Consumers and graph checks

Fresh `scripts.build.assemble(require_distances=False)` produces 2,907 stages
and 8,322 distinct stage edges. The graph is acyclic. Every corrected RS-11
link is already present.

| Narrowed stage | Immediate consumers | Why the forwarding works |
| --- | --- | --- |
| I.L2 | I.L4, I.L5 | Each has a direct C.L4 theorem import. |
| I.L3 | I.L5 | Direct C.L5b import supplies the moved theorem; I.L3 still supplies its retained transport maps. |
| I.L4 | I.L5, BSD.6a | I.L5 has a direct C.L4 import. BSD.6a specifically needs I.L4's retained signed comparison; importing C.L4 would not replace it. |

I read BSD.6a, HE.8b and K.L4's current contracts, including their hypothesis
and construction boundaries. In particular BSD.6a expressly does not receive
a blanket supersingular equality from I.L4. I found no member packet or
decomposition and no packet request naming either member. That limited search
is not a claim that other roadmaps have no Iwasawa work.

The following experiments were checked together, not just separately:

- Adding C.L2 → C.L1 creates the two-stage cycle in finding /1.
- Adding K.L4 → C.L2 is acyclic.
- Removing HE.8b → C.L5b and C.L5 → I.L3 is acyclic.
- The prior /30 fix's proposed K.L5 takes K.L3, K.L4, PadicFamilies L4,
  PadicHodgeRegulators L3, SelmerIwasawaCohomology L3 and
  AutomorphicPadicLFunctions L3; its outputs go to C.L5a and BSD.6a.
  All eight edges are acyclic, including with the preceding edits.

The prefix test certifies only graph order. The prior fix separately requests
the precise analytic-function supplier; its unresolved input and the full
ordinary arithmetic construction still require their authorized blueprint
contracts. No new stage is created by this red team.

This reproduces the decisive tests against the recorded baseline:

```python
import sys
from collections import defaultdict, deque
sys.path.insert(0, "scripts")
from build import assemble
a = assemble(require_distances=False)[0]
E = {(e["source"], e["target"]) for e in a["stageEdges"]}
C = "AutomorphicCongruences:"
I = "ModularIwasawaMainConjectures:"
K = "KatoEulerSystems:"
H = "HeegnerPointEulerSystems:HE.8b"
B = "RankZeroOneBSD:BSD.6a"
def reachable(u, v, edges):
    g = defaultdict(set)
    for x, y in edges: g[x].add(y)
    todo, seen = [u], set()
    while todo:
        x = todo.pop()
        if x == v: return True
        if x not in seen:
            seen.add(x)
            todo.extend(g[x])
    return False
def acyclic(edges):
    g, indeg = defaultdict(set), defaultdict(int)
    for u, v in edges:
        g[u].add(v)
        indeg[u] += 0
        indeg[v] += 1
    todo = deque(v for v in indeg if indeg[v] == 0)
    count = 0
    while todo:
        v = todo.popleft()
        count += 1
        for w in g[v]:
            indeg[w] -= 1
            if indeg[w] == 0: todo.append(w)
    return count == len(indeg)
assert len(a["stages"]) == 2907 and len(E) == 8322
assert acyclic(E)
assert not acyclic(E | {(C+"L2", C+"L1")})
assert {(C+"L4", C+"L5"), (C+"L5", I+"L3"), (H, C+"L5b")} <= E
assert not reachable(C+"L5a", B, E)
assert not reachable(B, C+"L5a", E)
assert K+"L5" not in {s["id"] for s in a["stages"]}
R = E - {(H, C+"L5b"), (C+"L5", I+"L3")}
assert not reachable(C+"L4", I+"L3", R)
inputs = [K+"L3", K+"L4", "PadicFamilies:L4",
          "PadicHodgeRegulators:L3", "SelmerIwasawaCohomology:L3",
          "AutomorphicPadicLFunctions:L3"]
R |= {(u, K+"L5") for u in inputs}
R |= {(K+"L5", C+"L5a"), (K+"L5", B), (K+"L4", C+"L2")}
assert acyclic(R)
```

## Sources, library scope and validation

Primary PDFs read on 30 September 2026:

- Fouquet–Wan, [arXiv:2107.13726v3](https://arxiv.org/pdf/2107.13726v3),
  103 pages. Read pp. 6–8 and 68–74; inspected the p.72 diagram visually.
  SHA-256 `39cee6cec8a5d56baf5c0b19dd892a571bc7945eab281d6ec9a9c14fa70294ee`.
- Burungale–Castella–Skinner,
  [arXiv:2405.00270v2](https://arxiv.org/pdf/2405.00270v2), 12 pages.
  Read pp. 2 and 7–11; inspected p.10's integral inequalities visually.
  SHA-256 `bf87592cdbaabb5c57004bfd44dd5b4d712cb306bbbdc36520a3daf92fa416f3`.

This is a restructuring audit, not a new full extraction of either paper or
an independent verification of every BSTW proof. BCS itself supplies the
comparison's provenance needed for finding /3. The reviewed library coverage
was used to check retained targets; its absence claims were not newly asserted.
No finding depends on an uninspected Lean declaration. Pins remain Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`.

Validation: the reproduction above, `scripts/check_redteam.py`,
`research/blueprint/intake.py check-files` for both deliverables, and staged
`git diff --check`. No Lean file is part of this issue; none was compiled and
no library build or cache was started. Only the two allowed deliverables are
changed. Upstream roadmaps and upstream-to-upstream links are untouched.
