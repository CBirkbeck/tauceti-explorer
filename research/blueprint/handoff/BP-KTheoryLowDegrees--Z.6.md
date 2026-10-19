# BP-KTheoryLowDegrees--Z.6 — completed planning pass

Issue: #10820. Agent: Codex (GPT-6), session `codex-FZqxps`. Branch: `codex-FZqxps-z6`. Base: `456f314b5b04cfdf735bf2cfbe4dc3317972c1ce`.

The bot [confirmed this session's claim](https://github.com/CBirkbeck/tauceti-explorer/issues/10820#issuecomment-6268591547). Only the three issue deliverables and this handoff are changed. No second issue was claimed. No roadmap, library, dependency file or source text was modified or copied.

## Delivered

The new packet imports all 25 accepted Z.6 targets from `KTheoryLowDegrees--Z.3.json` and adds eight target-level comparison/coherence refinements. It does not repeat their IDs or create another K₀, Cartan map, Euler class, support category, geometric determinant or projective-bundle theorem. The reader includes the imported construction APIs and at least three discriminating tests each, every new statement/hypothesis/proof plan, exact source locators, and worked degree-zero tests. Three new planets plus the retained projective-line planet give four for the layer.

Coverage is **planned**, packet status **complete**, rather than mathematical closure or implementation. All targets have dispositions. The ordinary comparison contracts, support signs, affine/noncommutative boundaries, projective-line functorial coordinates and determinant extension construction have their proof routes. Three explicit supplier gaps group four requests:

- H.5's Picard/1-truncated-spectrum mapping-groupoid comparison and S.4's Picard-stack sheafification mapping adjunction, including units and extension homotopies;
- K.4's enhanced finite-filtration additivity and refinement/octahedral coherence;
- S.3's already recorded Popescu/supported-continuity bridge for arbitrary regular noetherian F_p-algebras. The smooth finite-type alteration-basis route suffices for the supported determinant; the broader inherited Corollary5.6 target retains this gap.

No additional work is needed to finish this planning pass. Independent review should assess those supplier requests and the eight refinement contracts, retaining the old target IDs. Implementation resumes with the actual enhanced carriers from those owners. Do not treat native omission as a proof of those targets or mark their implementation status checked.

## Ownership and reading

Read WORKERS, both protocols, detail.json, UPSTREAM_GUIDE, the reviewed library audit, the issue and accepted Z.3 review. Read current GrothendieckEulerForms and AlgebraicVectorBundles readers and relevant Suggested signatures. Current roadmap commit: `0d144d044dacebca17b654695b6f1ad58f159b27`. In particular finite-locally-free tensor, dual, pullback and determinant geometry belongs to AlgebraicVectorBundles L0A–L0C; no replacement geometry is planned. No notions were moved between roadmap owners.

Read the relevant declarations at Tau Ceti pin `f790474821cf4256814db967cb154e7af3d0c369` and checked current Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The existing CartanMap source at the pin has Git blob `2fee1cb54d9c3b880174857c3bc0a4169c25ab51`, matching the shared checking build. Current main moved it to `CartanMap/Basic.lean`; the companion uses the pin's path. Mathlib is pinned at `082e2d37e8b0463410cdb532e111cd43d5a66174`.

Fresh target-directed source reading on 2026-10-19:

- Weibel's combined author draft dated 29 August 2013, II.2; II.8 pp.145–149; II.9.2, II.9.7.5–9.8; IV.6.1–6.2, IV.7.1–7.2; V.1.5.4, V.2.7.2–2.7.4. Printed page +8 is the PDF page. [Source](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), SHA-256 `a04f53c9393b20672fab2a6818279b2f9996dbc7cf74735789ed13804b058845`.
- Bhatt–Scholze arXiv v3 (21 February 2017), §5 pp.18–20, Lemma6.11 and its proofs pp.24–25, §12 pp.54–59. [Source](https://arxiv.org/pdf/1507.06490v3), SHA-256 `b4d5a4e0a6591971c6b8521d790e5db6e61112f1350a0e4a05a8d98b6e0b961e`.

No new source finding is proposed. The known BS17/E31 limitation is retained as a supplier gap; no published/preprint collation is asserted. All prose is target-based and in the worker's own words; no source passage or source file is committed.

## Validation receipts

- `python3 scripts/check_blueprint.py research/blueprint/packets/KTheoryLowDegrees--Z.6.json --index "$TAUCETI_BASELINE/declarations.tsv"`: **0 errors, 0 warnings**, using the available pinned declaration index. Eight nodes, three new planets, eight baseline declarations, 52 blueprint-node edges, two integrated-node edges, eight baseline edges, ten internal edges; one planned stage, three gaps, four requests.
- `lean-check research/blueprint/suggested/KTheoryLowDegrees--Z.6.lean`: **exit 0**, whole **111-line** file, **nine intentional proof-admission warnings and no other warnings**. Fresh available memory was 83 GiB. One invocation, through the shared wrapper; no build, update, cache fetch, project creation or language server. The two categorical end statements and arithmetic checks elaborate at the pins. Full enhanced K/Perf/Picard/site statements remain explicitly inventoried reader targets.
- `git diff --check`: passed.
- Structural audit: all 25 inherited target IDs accounted for exactly once; eight distinct new IDs; every external node edge resolves; no existing packet node depends on a new node, and the new internal graph is acyclic, so these additions introduce no cross-packet cycle. This is not a claim to have repaired all older graph cycles or broad stage edges.
- Independent finite arithmetic: 6,561 projective-line coordinate-product cases over integers −4 through 4; 201 twist values −100 through 100; all eight points of y²=x³−x over F₅, all group-law closure and associativity cases, the order-four point (2,1), and exactly three nonidentity points of order two. These computations test the worked examples, not the admitted K-theory comparisons.

The following self-contained finite replay uses only Python's standard library; all essential information survives deletion of scratch. The native signatures and packet can be checked with the commands above in an existing pinned environment.

```python
from itertools import product
T = lambda x: (x[0] + x[1], -x[1])
for a, b, c, d in product(range(-4, 5), repeat=4):
    assert T(T((a, b))) == (a, b)
    r, e = T((a, b)); s, f = T((c, d))
    assert T((a*c-b*d, a*d+b*c+2*b*d)) == (r*s, r*f+s*e)
for m in range(-100, 101):
    assert T((m+1, -m)) == (1, m)
points = [None] + [(x, y) for x in range(5) for y in range(5)
                   if (y*y-x*x*x+x) % 5 == 0]
def add(P, Q):
    if P is None: return Q
    if Q is None: return P
    x, y = P; u, v = Q
    if x == u and (y+v) % 5 == 0: return None
    m = ((3*x*x-1)*pow(2*y, -1, 5) if P == Q
         else (v-y)*pow(u-x, -1, 5)) % 5
    w = (m*m-x-u) % 5
    return w, (m*(x-w)-y) % 5
assert len(points) == 8
assert add((2, 1), (2, 1)) == (0, 0)
assert sum(P is not None and add(P, P) is None for P in points) == 3
assert all(add(P, Q) in points for P in points for Q in points)
assert all(add(add(P, Q), R) == add(P, add(Q, R))
           for P in points for Q in points for R in points)
assert add((2, 1), (2, 4)) is None
```

The submission PR is the durable delivery; the session's PR record is written when it opens. Scratch contains no unique handoff information and is deleted after opening the PR, as WORKERS requires.
