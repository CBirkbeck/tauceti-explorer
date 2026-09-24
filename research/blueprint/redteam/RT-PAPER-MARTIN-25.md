# RT-PAPER-MARTIN-25

Codex — `codex-a71f92`, 24 September 2026. Refs #1739.

One medium finding: the accepted Part II handoff is lossy when the queue is regenerated with the other papers now routed to the same owner. No new mathematical correction to Martin's extraction was found. This worker neither wrote the extraction (`codex-c83e7a`) nor reviewed it (`cc-fb70e5`).

The attack used repository snapshot `0ba46f9a37abb04b3b436c797818417fa8bab41b`. Preflight at `f1491f30e3b171fab8bd8bb2542492b61ba04e9e` changes none of the target, the queue generator or the four relevant paper routes. Only this report and the red-team result are deliverables; the extraction and production scripts are unchanged.

## Source and inventory attack

Read all four pages, including the bibliography, of the [published Martin paper](https://link.springer.com/content/pdf/10.1007/s00222-025-01346-9.pdf), freshly retrieved on 24 September. SHA-256:

`3e1f4b7f99f18b71159463aaf2d9e649e11317272782f9105299a9d72369097c`.

This is exactly the extraction's source. Pages 624–625 were also rendered and read as images. In particular, the published Theorem 1.3 really does give the exceptional-prime bound stated in item 43: the earlier review's uncertainty about that version is now resolved.

All 54 items were read. Six are library items; 48 are missing; no planned supplier is asserted. Every missing item occurs exactly once in the two routes, with 13 in CA.4 and 35 in the proposed Part II. The following coverage was checked statement by statement:

| Source material | Extracted coverage |
| --- | --- |
| Equation (1.1), positive integer solutions, mutations and tree | 1–13 |
| Vieta graph versus permutation-enlarged group | 14–18, 35, 54 |
| Weight definition (2.1), including all zero-coordinate branches | 19–22 |
| Complementary weights (2.3)–(2.4) and fixed points | 23–26 |
| Invariant-set averaging (2.5), sum (2.2) and cancellation | 27–34, with 51–52 as library inputs |
| BGS inputs and connectivity/strong-approximation consequences | 36–43, 53 |
| Maximal divisors, effective bound and change of coefficient | 44–46 |
| Baragar's conjecture as a proposition, not a theorem | 47 |
| Residue-field and graph substrate | 18, 48–52 |

The integer descent is valid. For `1≤a≤b≤c`, put `q(t)=t²−3abt+a²+b²`. Except at `a=b=1`, `q(b)<0`, so the other positive root is strictly below `b`; the exceptional nonroot is `(1,1,2)`. There is exactly one height-decreasing mutation away from `(1,1,1)`. A cycle would have a height maximum with two descending neighbours. Lifting and reducing the resulting positive root orbit proves the reduction interface without assuming primitivity. Twenty-two exact positive triples found in a finite search also passed positivity, unique descent and small-prime nonzero-reduction checks. This search was a sample, not a completeness bound for integral solutions.

The zero-coordinate test needs a field: `(2,0,0)` is a nonzero solution over `Z/4Z` with two zero coordinates. Item 19 does not make that invalid generalisation. Over a field, the weight branches are unambiguous. Reindexing a finite invariant sum by each involution gives twice that sum equal to the cardinality, including fixed points and the empty set. Summing the three coordinates then gives cardinality zero in `Fp`.

At `p=2` the four vertices form a star, with additional fixed labelled moves. At `p=3` the eight vertices are `{±1}³` and the moves flip independent signs. Thus the published unqualified divisibility sentence is false only at the excluded prime three; items 31–34 already say so. `research/blueprint/errata/PAPER-MARTIN-25.json` has the independently confirmed E1, plus two preprint-only mistakes corrected in publication. The old extraction's missing inline `sourceIssues` field is not a reason to report this already-recorded correction again.

## External theorem boundaries

Fresh [BGS arXiv:1607.01530v1](https://arxiv.org/pdf/1607.01530v1), SHA-256 `50f3dcde0c4a3a841f4eb3556838ecd162a7988ea3d3c1235f53c9c427b03e9e`: read pp.1–5, particularly the action and Theorems 1–2. BGS's `Γ` includes coordinate permutations; its larger `Δ` also includes double sign changes. The extraction preserves this distinction. The giant-orbit complement is bounded by `p^ε` with a non-strict inequality; the exceptional-prime count is bounded by `T^ε` for sufficiently large `T`.

A giant `Γ`-orbit need not itself be one Vieta component. The extraction avoids that shortcut. The Vieta subgroup is normalised by permutations, and `(1,1,1)` is permutation-fixed. Thus the two root orbits coincide. First prove component divisibility; then a giant `Γ`-orbit with complement smaller than `p` exhausts the graph, because every other orbit contains a nonempty Vieta component of size at least `p`. Only then deduce Vieta connectivity and its giant-component consequence. There is no circular use of item 42 as an input to item 39.

Fresh [Eddy–Fuchs–Litman–Martin–Tripeny author PDF](https://www.math.ucdavis.edu/~efuchs/Markoffconnectivity.pdf), SHA-256 `0795f7cd9c28c147ed642392919cd0879714a36e461ca353b379f7ea66bee8c0`: read pp.1–4, including Definition 1.2, Theorem 1.4 and the graph-convention comparison. The exact threshold is

`T=(863#)(53#)(13#)(7#)(5#)·3³·2⁵`.

Independent integer arithmetic gives a 393-digit integer beginning `344804838267768` and verifies `T < 3489·10^389`. This supports Martin's sufficient bound without interpreting a rounded decimal as exact. The source's coefficient-one equation is conjugate by scaling by three only when three is invertible. The maximal-divisor test `n=12,x=6` gives `{4,6}`.

The publisher DOI for Eddy et al. returned HTTP 403 in this run. I therefore do not independently certify the extraction's observation about that HTML page's decimal typo. The exact product was read in the public author PDF and independently evaluated. The full BGS proof and Eddy et al.'s complete threshold algorithm were not re-proved here; the extraction explicitly requires their later source decomposition. Neither Chen's moduli-of-covers machinery nor decorated Teichmüller theory is a hidden input to Martin's elementary weight proof.

## Pinned libraries and ownership

Pins: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

Every library declaration claimed by the six items was opened at the pin:

| Declaration | Mathlib source |
| --- | --- |
| `ZMod`, `.fintype`, `.card` | `Data/ZMod/Defs.lean:142,158,166` |
| Prime field instance | `Algebra/Field/ZMod.lean:18–40` |
| `SimpleGraph.Reachable` | `Combinatorics/SimpleGraph/Connectivity/Connected.lean:52` |
| `reachable_fromEdgeSet_fromRel_eq_reflTransGen` | same file, line 119 |
| `ConnectedComponent`, `.supp` | same file, lines 390, 548 |
| `Fintype.sum_equiv` | additive declaration from `Algebra/BigOperators/Group/Finset/Defs.lean:738–744` |
| `ZMod.natCast_eq_zero_iff` | `Data/ZMod/Basic.lean:519` |

The symmetric-relation reachability theorem handles loop deletion. The finite-sum theorem is the claimed reindexing interface, not a built Markoff weight theorem. `Finset.sum_involution`, also inspected, is a cancellation theorem; the specialised balance lemma is not falsely claimed to exist. Searches of both full pinned Lean trees, with ignored files included, found no specialised Markoff/Penner implementation. This is stronger evidence than relying only on a declaration-name index, though not a claim of machine-checked mathematical nonexistence.

Read the reviewed audits for DY.0, CA.0, CA.4, FF.0, FF.5 and AC.0, the seven ArithmeticDynamics layers, CA.4 and the EffectiveDiophantineMethods layers. Their statements justify the proposed split: integer equation/descent at CA.4, affine group dynamics in the Part II, existing residue arithmetic imported, and no new theorem owned by process layer FF.5. The Part II's title, parent and corrected area `arithmeticgeometry` are consistent.

Specialised searches of current atlas extracts, integrated decompositions, packets, links, restructurings and new-roadmap definitions found no implemented Markoff blueprint supplier. Four accepted papers now share the proposed Part II, so the original report's historical statement that Chen had no accepted result is no longer a description of current state. Reading those accepted routes shows intentional shared ownership, not a reason to create another roadmap. Their proof inventories were not independently re-reviewed in this job.

## Finding 1: the shared Part II brief is overwritten on regeneration

**Medium; downstream omission.** Relevant production locations are `research/blueprint/make_queue.py:720–726` and `834–864`. The target is Martin's second accepted route as handed to its design job, not the correctness of the route's mathematics.

In registry order, the accepted inputs are:

| Paper | Route | Part II item references |
| --- | --- | ---: |
| Chen 2024 | 2 | 13 |
| Gamburd–Magee–Ronan 2019 | 2 | 18 |
| Martin 2025 | 2 | 35 |
| Ghosh–Sarnak 2022 | 5 | 5 |

All four name `ArithmeticDynamicsPartIIMarkoff`, with matching parent, title and area. They contain 71 distinct source-qualified references. The generator appends a design tuple for each accepted route. Its `add` function appends every job but assigns `prompts[path] = prompt_text`, replacing earlier text at the shared path.

A dry-run of the actual, unchanged generator reproduced **four design records and four review records with the same respective IDs**. The final design prompt contains the complete Ghosh–Sarnak brief and its five item references, but not the complete Chen, Gamburd–Magee–Ronan or Martin briefs and item lists. `PAPER-MARTIN-25/20` and its extended-Penner-weight instruction are absent. A sentence that the last brief coalesces with Martin is not the required combination of accepted obligations.

This effect has a related prior warning: `research/blueprint/reviews/REV-PAPER-HARPAZ-WITTENBERG-23.md`, section 4, notes the same generic generator collision for a different shared owner. It remains present in the code inspected here; this finding supplies a concrete four-paper reproduction affecting the attacked route.

**Important limit:** live [design issue #1700](https://github.com/CBirkbeck/tauceti-explorer/issues/1700) was read separately on 24 September. It still contains Martin's original complete brief. This report does not claim that live issue has already been overwritten, or that an existing blueprint omits Martin's proof. The defect is in reproducible regeneration from the currently accepted routes; the old live issue also does not supply their four-way combined brief.

The following reproduces the defect from the repository snapshot, in a disposable snapshot directory. It observes the actual generator's return locals; it does not replace its route-building logic or write generated prompts. Dry-run can create its ordinary queue lock in that disposable directory.

```python
import sys
from collections import Counter
from pathlib import Path
sys.path.insert(0, str(Path('research/blueprint').resolve()))
import make_queue

captured = {}
def trace(frame, event, arg):
    if frame.f_code is make_queue.main.__code__ and event == 'return':
        captured.update(frame.f_locals)
    return trace

sys.argv = ['make_queue', '--library', 'public-only',
            '--baseline', 'pinned-baseline', '--workers', 'scratch-workers',
            '--dry-run']
sys.settrace(trace)
try:
    make_queue.main()
finally:
    sys.settrace(None)

target = 'DESIGN-ArithmeticDynamicsPartIIMarkoff'
counts = Counter(j['id'] for j in captured['merged']
                 if j['id'] in (target, 'REV-' + target))
assert counts == {target: 4, 'REV-' + target: 4}
prompt = captured['prompts'][f'research/blueprint/prompts/{target}.md']
papers = ['PAPER-CHEN-24', 'PAPER-GAMBURD-MAGEE-RONAN-19',
          'PAPER-MARTIN-25', 'PAPER-GHOSH-SARNAK-22']
for pid in papers:
    route, = [r for r in make_queue.accepted_routes(pid)
              if r['roadmap'] == 'ArithmeticDynamicsPartIIMarkoff']
    print(pid, len(route['items']), route['brief'] in prompt,
          all(i in prompt for i in route['items']))
assert 'PAPER-MARTIN-25/20' not in prompt
assert 'extended Penner weights' not in prompt
```

The four printed triples are respectively `13 False False`, `18 False False`, `35 False False`, `5 True True`.

**Fix contract.** Group accepted routes by destination before constructing jobs. Validate compatible parent/title/area; create one design and one review job; combine all accepted briefs with source/route provenance and all item references. Preserve the shared-carrier instructions, coefficient conventions, Martin's prime-three regression, complete weight proof, BGS bridge and effective endpoint. Construct overlapping mathematics once rather than erasing a source or inventing separate owner IDs. Add a regression for these four routes requiring unique job IDs and preservation of all four complete briefs and all 71 references. Regenerate and refresh the live job through the normal maintainer workflow. The two red-team deliverables do not themselves implement that out-of-scope engine change.

## Independent finite checks and validation

A separate exact-arithmetic scratch program enumerated every triple for each of the 26 primes at most 101: **76,224 nonzero vertices**. It checked equation preservation, involutivity, permutation invariance, the at-most-one-zero-coordinate property, weight sums, complementary-edge weights, all component sums and divisibility with the prime-three exception. It counted **3,186 labelled fixed moves**. Scaling by three bijected the full coefficient-three and coefficient-one carriers and intertwined every labelled move for each prime other than three. All assertions passed. Every tested graph happened to be connected; no all-prime theorem is inferred from this.

Named cases included `(0,1,2)` over `F5` with weights `(0,3,3)`, and `(2,1,5)` over `F11`, fixed by the first move with weight `6=1/2`. The empty invariant sum, the characteristic-three collapse, the nonfield counterexample, maximal divisors of 12, and the exact primorial inequality were checked separately. These computations independently exercise the paper's most fragile conventions; they supplement the proof reading rather than replace it.

Validation passed: the red-team schema checker; the paper checker on the unchanged target; intake `check-files` on the two deliverables (zero problems); and all 56 tests in `tests.test_check_paper`, `tests.test_check_redteam`, `tests.test_papers_queue`, `tests.test_redteam_queue` and `tests.test_intake`. Both independent scratch diagnostics passed. No Lean file belongs to this red-team job, and no Lean compilation or formalisation is claimed.
