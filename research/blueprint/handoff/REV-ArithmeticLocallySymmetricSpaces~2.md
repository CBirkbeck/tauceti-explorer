# REV-ArithmeticLocallySymmetricSpaces~2: checkpoint handoff

Refs #6908. Agent: ChatGPT Pro. Session: `chatgpt-20261007-c7a942`. Date: 2026-10-07.

**Partial review checkpoint, not a finished independent review.** Read the [report](../reviews/REV-ArithmeticLocallySymmetricSpaces~2.md) first. This PR adds only that report and this handoff. It does not change the live packet, reader or suggested Lean file and does not replace the historical review object.

## Established findings

The report gives an explicit F-neat but not Q-neat `GL_2/Q(sqrt(5))` level with an orientation-reversing element; fixes the corresponding norm argument's restriction-of-scalars hypothesis; propagates orientability to a compact-support acceptance criterion; identifies the unregistered unquotiented Borel–Serre bordification prerequisite in the properness proof; and clarifies open normality in relative perfectness. The existing PGL2/Q counterexample and the valid Q-neat GL_m result are retained.

The guarded patcher below was run locally against the exact three input blobs. The candidate passed `scripts/check_blueprint.py` with zero packet errors and zero packet warnings, **but with the separate missing-declaration-index warning, so baseline existence was not checked**. Thirty-four additional arithmetic, inverse-order, cardinality, synchronization and local-DAG assertions passed. Lean was not compiled: no existing build at both pins was available, and no build/cache/project/server was started.

| Candidate after applying the patcher | Git blob |
|---|---|
| Packet | `44c2933dcd4030166bc47766f9f8c550e34a3a29` |
| Reader | `f5ebe9ad2e498881a6afe03d541692411fe7edb7` |
| Suggested Lean | `e67bdeebea2a0bcef198bb29b7ef9c1f4210a65b` |

Counts remain 66 nodes, 132 API items, 88 tests and 31 planets; local prerequisite references increase from 179 to 180. No new declarations or planets are introduced. The patch changes only prose, hypotheses, one dependency, and an existing mathematical regression specification; it does not manufacture executable Lean signatures.

## Resume in this order

1. Check that this issue has been released and claim it normally. Re-read current WORKERS/PROTOCOL and the current issue. Inspect this report, then apply the patcher on your own job branch, or port its edits if any guarded input has changed. Its write set is exactly the packet, reader and suggested file named by the issue.
2. Finish the independent review: the detailed mathematical pass reached the early ALS.0/ALS.1 nodes; only selected geometry and later source statements were checked. Do not assume an all-node audit. Start the remaining full node/proof/source/API pass at ALS.2, while also completing unresolved early source comparisons.
3. Complete the reviewed library-coverage audit and all 36 baseline-declaration checks at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. This session read the pinned local-coefficient definitions and monodromy source, not the entire baseline.
4. Obtain and inspect Borel–Serre and the Douady–Hérault appendix directly; their scans were not accessible here. Verify every remaining source locator/excerpt. Do not inherit the previous worker's source-access claims as your own. The published Newton–Thorne pages 41, 48 and 55 and Milne pages 15 and 34 were independently rendered and inspected for this checkpoint's findings.
5. Preserve the accepted RS-09 finite-level boundary for ALS.6. Reconcile the remaining supplier requests, documented gaps, suggested-form omissions and stage interleavings. Replace the historical packet review object only when the actual independent review is complete, naming `independent-review-REV-ArithmeticLocallySymmetricSpaces~2`. Run the checker again with the declaration index; elaborate only if a matching existing build is available under WORKERS' resource rules.

## Reproducible candidate patch

The following standard-library Python program is the checkpoint's proposed edit, **not an instruction to treat the review as accepted**. It aborts before writing anything if an input Git blob differs. Run from the repository root on the next claimed worker's own branch, after inspecting the changes. It preserves the historical review object and every node identifier. No executable Lean is changed; only the relevant omission-catalogue prose is synchronized.

```python
"""Apply the scoped corrections recorded by REV-ArithmeticLocallySymmetricSpaces~2.
Run from the repository root, on the worker's own branch, after reading the review.
This is a checkpoint patch, not an acceptance or completion of the full review.
"""
import copy
import hashlib
import json
import textwrap
from pathlib import Path

base = Path('research/blueprint')
files = {
    'packet': base / 'packets/ArithmeticLocallySymmetricSpaces.json',
    'reader': base / 'readmes/ArithmeticLocallySymmetricSpaces.md',
    'lean': base / 'suggested/ArithmeticLocallySymmetricSpaces.lean',
}
expected = {
    'packet': 'ab75ce510242e0b02a8c1cb360c003aea566f317',
    'reader': '963431299fefba1e5cf39af9b56d1c2dcdec5366',
    'lean': '781e0a1a651b1f381200c2f9c8ece8271a349401',
}
def git_blob(data):
    return hashlib.sha1(b'blob ' + str(len(data)).encode() + b'\0' + data).hexdigest()

texts = {}
for key, path in files.items():
    data = path.read_bytes()
    if git_blob(data) != expected[key]:
        raise SystemExit(f'{path}: input changed; rebase the corrections by hand before applying')
    texts[key] = data.decode('utf-8')
packet = json.loads(texts['packet'])
old = copy.deepcopy(packet)
prefix = 'ArithmeticLocallySymmetricSpaces:'
by_id = {n['id'][len(prefix):]: n for n in packet['nodes']}

proper = by_id['ALS.0/proper-action-stabilizers']
proper['prerequisites'].append(prefix + 'ALS.2/borel-serre-bordification')

orientation = by_id['ALS.0/orientation-local-system']
orientation['tests'][2]['statement'] = (
    'For γ ∈ GL_m(O_F), ε(γ) = sign(N_{F/ℚ} det γ)^{m−1}; for m odd ε is trivial. '
    'Distinguish neatness over F from neatness of the restriction of scalars over ℚ: '
    'take F=ℚ(√5), u=682+305√5 with N(u)=−1, and γ=diag(u,1). '
    'At v=(11,√5−7) and w=(31,√5−6), u reduces to 1. '
    'Principal congruence at v and w, maximal integral level elsewhere, is F-neat by the '
    'two-distinct-residue-characteristics criterion, contains γ, and has ε(γ)=−1. '
    'The same γ is not neat in Res_{F/ℚ}GL_2: its eigenvalues over ℚ include u and its '
    'conjugate u′, whose product is −1.'
)
example = by_id['ALS.0/nonorientable-neat-example']
old_tail = ('while every neat level of GL_{2,ℚ} (or of Res_{F/ℚ}GL_m) gives an orientable X_K, '
            'since neatness forces N_{F/ℚ} det γ = 1.')
new_tail = (
    'while every neat level of GL_{2,ℚ} gives an orientable X_K. '
    'For GL_m over F the same norm argument applies when each arithmetic subgroup is neat '
    'for Res_{F/ℚ}GL_m as an algebraic group over ℚ: then N_{F/ℚ} det γ = 1. '
    'Neatness defined using faithful F-representations of GL_m alone does not imply this '
    'stronger hypothesis; the real-quadratic regression in orientationSystem_GL_formula '
    'is F-neat and orientation-reversing.'
)
assert example['statement'].count(old_tail) == 1
example['statement'] = example['statement'].replace(old_tail, new_tail)
example['proofSteps'][3] = (
    'For GL_m over F, compactness of the finite level implies det γ ∈ O_F^×. '
    'Under the additional hypothesis of neatness for Res_{F/ℚ}GL_m as a ℚ-group, '
    'N(det γ)=±1 is the determinant of its faithful ℚ-representation on the underlying '
    'ℚ-vector space of F^m, hence belongs to the torsion-free eigenvalue group. '
    'It must equal 1, giving ε=1. This applies to ordinary neatness when F=ℚ, but it '
    'must not be inferred from the supplier’s F-neatness predicate when F≠ℚ.'
)
comparison = by_id['ALS.1/sheaf-singular-comparison']
comparison['acceptance'][1] = (
    'For a connected orientable noncompact surface Γ\\ℍ and constant coefficients R, '
    'H^2_c(Γ\\ℍ,R)=R and H^2(Γ\\ℍ,R)=0 on both sides. Without orientability, the '
    'first formula requires the orientation coefficient system o_R instead of constant R. '
    'For the nonorientable neat PGL_2 example and R=ℚ, H^2_c(Γ\\ℍ,ℚ)=0, not ℚ.'
)
finite = by_id['ALS.1/finite-complex-model']
assert finite['statement'].count('For K′ normal in K,') == 1
finite['statement'] = finite['statement'].replace('For K′ normal in K,', 'For K′ open normal in K,')
finite['hypotheses'][1] = 'K′ open normal in K (so K/K′ is finite).'

# Replace only the matching node's section in the reader and in the omission catalogue.
# The Lean catalogue wraps prose at 100 columns; no executable Lean is changed.
def section(text, marker, next_marker):
    start = text.index(marker)
    end = text.find(next_marker, start + len(marker))
    return start, len(text) if end < 0 else end

def wrap(s):
    return textwrap.fill(s, 100, break_long_words=False, break_on_hyphens=False)

for before, after in zip(old['nodes'], packet['nodes']):
    if before == after:
        continue
    ident = after['id'][len(prefix):]
    start, end = section(texts['reader'], f'**Identifier:** `{ident}`.', '\n**Identifier:**')
    part = texts['reader'][start:end]
    prose_edits = []
    if before['statement'] != after['statement']:
        prose_edits.append((before['statement'], after['statement']))
    for field in ('proofSteps', 'hypotheses', 'acceptance'):
        for a, b in zip(before.get(field, []), after.get(field, [])):
            if a != b:
                prose_edits.append((a, b))
    for a, b in zip(before.get('tests', []), after.get('tests', [])):
        if a['statement'] != b['statement']:
            prose_edits.append((a['statement'], b['statement']))
    for a, b in prose_edits:
        assert part.count(a) == 1, (ident, a, part.count(a))
        part = part.replace(a, b)
    if before['prerequisites'] != after['prerequisites']:
        a = '; '.join(f'`{s}`' for s in before['prerequisites'])
        b = '; '.join(f'`{s}`' for s in after['prerequisites'])
        assert part.count(a) == 1
        part = part.replace(a, b)
    texts['reader'] = texts['reader'][:start] + part + texts['reader'][end:]

    start, end = section(texts['lean'], '### ' + after['id'] + ' —', '\n/-!\n### ')
    part = texts['lean'][start:end]
    for a, b in prose_edits:
        wa = wrap(a)
        if wa in part:
            assert part.count(wa) == 1
            part = part.replace(wa, wrap(b))
        elif a == before['statement'] or any(a == t['statement'] for t in before.get('tests', [])):
            raise AssertionError(('Missing required catalogue counterpart', ident, a))
    if before['prerequisites'] != after['prerequisites']:
        a = wrap('; '.join(before['prerequisites']))
        b = wrap('; '.join(after['prerequisites']))
        assert part.count(a) == 1
        part = part.replace(a, b)
    texts['lean'] = texts['lean'][:start] + part + texts['lean'][end:]

assert old['review'] == packet['review'], 'Checkpoint must not invent a completed review'
assert [n['id'] for n in old['nodes']] == [n['id'] for n in packet['nodes']]
texts['packet'] = json.dumps(packet, ensure_ascii=False, indent=1) + '\n'
# All guards run before any write.
for key, path in files.items():
    path.write_text(texts[key], encoding='utf-8')
    print(path, git_blob(path.read_bytes()))
```

All substantive findings and the portable candidate edit are retained in these two committed Markdown files; no external scratch path or inaccessible source download is needed to resume. The missing full audit must not be replaced by the previously recorded reviewer's verdicts.
