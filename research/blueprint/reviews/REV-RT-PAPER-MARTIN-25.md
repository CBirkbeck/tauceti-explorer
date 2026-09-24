# REV-RT-PAPER-MARTIN-25

**Complete: the single finding is confirmed, medium severity.** Refs #1738. Codex / `codex-7e92bd`, 24 September 2026.

Queue regeneration loses three accepted briefs when four papers share `ArithmeticDynamicsPartIIMarkoff`. It emits four design jobs and four review jobs with the same respective IDs, while retaining only the last brief in their shared prompt. This is a reproducible handoff defect. The finding does not require a mathematical correction to Martin's extraction.

## Independence and evidence

The extraction was by `codex-c83e7a`, its review by `cc-fb70e5`, and this red team by `codex-a71f92`. This session did none of those jobs.

I read the finding and report, all four accepted routes and their review verdicts, their registry order, and the actual queue-generation code. Initial public input snapshot: `c32d613232d8ba5593d05ad592a45ce769f844fe`. I executed the unchanged generator in a disposable archive of that snapshot, observing its return locals without replacing route-selection or job-generation logic. All 577 tracked files opened during that execution matched their Git blob hashes. This is input-integrity verification, not a claim to have manually audited all 577 files.

Publication checks detected concurrent queue, result/review and unrelated Calegari–Geraghty input updates. I refreshed the full disposable snapshot and repeated the complete dry run, finally with inputs matching `e056b0d0a8966511f4da3b48457296585777758a`; the same defect remained, with all 585 tracked execution inputs byte-verified. Production files and live issues were not modified by either run. The dry run creates its ordinary lock only in the disposable directory.

Primary code evidence, read on 24 September 2026:

- [`accepted_routes`, lines 389–401](https://github.com/CBirkbeck/tauceti-explorer/blob/c32d613232d8ba5593d05ad592a45ce769f844fe/research/blueprint/make_queue.py#L389), which requires an accepted paper review and accepted individual route.
- [`add`, lines 720–726](https://github.com/CBirkbeck/tauceti-explorer/blob/c32d613232d8ba5593d05ad592a45ce769f844fe/research/blueprint/make_queue.py#L720), which appends jobs while assigning one prompt per path.
- [Paper-route accumulation and design generation, lines 822–864](https://github.com/CBirkbeck/tauceti-explorer/blob/c32d613232d8ba5593d05ad592a45ce769f844fe/research/blueprint/make_queue.py#L822).
- [Final queue merge and dry-run return, lines 1088–1115](https://github.com/CBirkbeck/tauceti-explorer/blob/c32d613232d8ba5593d05ad592a45ce769f844fe/research/blueprint/make_queue.py#L1088), which does not collapse duplicate generated IDs.

## Independent reproduction

| Accepted source | Route | Item references | Complete brief in final prompt | Item references in final prompt |
| --- | ---: | ---: | --- | ---: |
| Chen 2024 | 2 | 13 | No | 0 |
| Gamburd–Magee–Ronan 2019 | 2 | 18 | No | 0 |
| Martin 2025 | 2 | 35 | No | 0 |
| Ghosh–Sarnak 2022 | 5 | 5 | Yes | 5 |

The references are 71 distinct source-qualified IDs. All four route records agree on Part II kind, parent `ArithmeticDynamics`, title and area `arithmeticgeometry`. Each individual route is accepted in its paper review. This rules out an unaccepted draft or incompatible metadata as the explanation.

The generator creates one `paper_designs` tuple per route. At line 851, the comprehension filters against the built-in `designs` list as it existed before the append; it does not deduplicate repeated destinations within `paper_designs`. Each iteration then emits a design/review pair. All four designs use the same prompt path, and the dictionary assignment in `add` replaces the earlier prompt. The later merge preserves each generated record. Thus the result is four `DESIGN-ArithmeticDynamicsPartIIMarkoff` records and four `REV-DESIGN-ArithmeticDynamicsPartIIMarkoff` records, not just four harmless provenance references.

Both runs checked that `PAPER-MARTIN-25/20` and the extended-Penner-weight instruction are absent. The generated text's reference to coalescing with Martin does not include Martin's brief or item list.

A minimal reproduction from a disposable checkout of the cited snapshot is:

```python
import sys
from collections import Counter
from pathlib import Path
sys.path.insert(0, str(Path('research/blueprint').resolve()))
import make_queue

observed = {}
def trace(frame, event, arg):
    if event == 'return' and frame.f_code is make_queue.main.__code__:
        observed.update(frame.f_locals)
    return trace

sys.argv = ['make_queue', '--library', 'public-only',
            '--baseline', 'pinned-baseline', '--workers', 'scratch-workers',
            '--dry-run']
sys.settrace(trace)
try:
    make_queue.main()
finally:
    sys.settrace(None)

job = 'DESIGN-ArithmeticDynamicsPartIIMarkoff'
counts = Counter(j['id'] for j in observed['merged']
                 if j['id'] in (job, 'REV-' + job))
assert counts == {job: 4, 'REV-' + job: 4}
prompt = observed['prompts'][f'research/blueprint/prompts/{job}.md']
refs = []
for pid, count, retained in [
    ('PAPER-CHEN-24', 13, False),
    ('PAPER-GAMBURD-MAGEE-RONAN-19', 18, False),
    ('PAPER-MARTIN-25', 35, False),
    ('PAPER-GHOSH-SARNAK-22', 5, True),
]:
    route, = [r for r in make_queue.accepted_routes(pid)
              if r['roadmap'] == 'ArithmeticDynamicsPartIIMarkoff']
    assert len(route['items']) == count
    assert (route['brief'] in prompt) == retained
    assert sum(item in prompt for item in route['items']) == (count if retained else 0)
    refs.extend(route['items'])
assert len(refs) == len(set(refs)) == 71
assert 'PAPER-MARTIN-25/20' not in prompt
assert 'extended Penner weights' not in prompt
```

## Scope and correct repair

I separately read [live design issue #1700](https://github.com/CBirkbeck/tauceti-explorer/issues/1700) on 24 September. Martin's entire accepted brief and all 35 item IDs remain in it. The red team's distinction between regeneration and the live issue is accurate. The earlier Harpaz–Wittenberg review's §4 also describes the shared-ID risk for another owner, but this verdict relies on the actual four-source reproduction, not on that prior warning.

The appropriate fix is to group accepted new/Part II routes by destination before emitting jobs; validate matching parent, title and area; and emit one design/review pair with every accepted brief and item list labelled by source/route. Preserve coefficient conventions, shared-carrier instructions, Martin's prime-three regression, weights, BGS bridge and effective endpoint. A regression must check unique job IDs **and** the presence of all four briefs and all 71 references. Only deduplicating the job list would leave the prompt loss unfixed. Overlapping mathematical constructions still have one owner.

The repair requires authorization for `research/blueprint/make_queue.py` and the relevant queue regression tests in the maintainer/fix workflow, followed by normal prompt and issue regeneration. This review changes only its two deliverables; the sound paper route, accepted verdicts and other sources are preserved.

This sole finding is about repository code and accepted design inputs. No published mathematical theorem or Lean declaration is needed to establish it. I do not claim a new full reading of Martin/BGS or an independent rerun of the red team's finite-field tests, and no Lean compilation was performed.

## Validation

**PASS:** red-team checker; exact coverage of the single supplied finding ID; two-file intake with zero problems. All 414 control blobs (including every paper-result/review input), the paper input path set and both output guards matched fresh main `e056b0d0a8966511f4da3b48457296585777758a`. The bot-confirmed claim and issue instructions were unchanged. The full dry-run reproducer passed on all three input snapshots; 585 tracked execution input files were byte-verified on the final refreshed run.
