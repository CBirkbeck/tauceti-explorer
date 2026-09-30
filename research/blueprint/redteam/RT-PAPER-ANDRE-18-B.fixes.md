# FIX-RT-PAPER-ANDRE-18-B

Codex, session `codex-J6LwjP`, 30 September 2026. Refs #5023.
Input: `RT-PAPER-ANDRE-18-B.review.json`, which confirms findings /1–/6.
The issue quotes /1–/4; this fix also applies the verifier’s /5 and /6.
Base inspected: `d16da7c7f87f6f6779529b6bb3c21b6d2657f3b1`.

The extraction now contains **204 items: 23 library, 10 planned, 171 missing**.
All original 191 IDs remain. Thirteen explicit inputs were added. Every missing
item has exactly one route. The four current routes have 111, 43, 10 and 7
missing items respectively; route 3 also retains one planned source item.
The extraction remains complete under PROTOCOL §16. Missing implementations and
an unproved, explicitly routed comparison adapter are blueprint work, not claims
of formalization.

The paper JSON and reader are changed. This issue permits those files, this
report and the fix handoff. Exact changes needed in other jobs’ files are below;
they were not applied outside the allowed paths. Independent `REV-FIX` review
is still required, including review of new source finding E26.

## /1 — Put the missing interfaces in concrete owners

The six A.4 items `almost-pure-module`, `almost-pure-left-adjoint`,
`almost-hom-lift`, `almost-ext-class`, `almost-pure-ring-adjoint` and
`almost-pure-left-factor` move to DirectSummandsAndBigCohenMacaulay’s **early**
purity prefix. This prefix imports P0’s generic almost bases, module adjoints and
algebra (!!) adjoint. It precedes the ramification layer, which consumes its
ordinary/almost-purity interfaces. The route brief explicitly forbids using
later perfectoid applications to prove these early lemmas.

The six §1.2 Weierstrass items move to the **first layer** of PerfectoidRamification.
`coordinate-tower-perfectoid` moves there too. `uniform-banach-algebra` becomes
planned at the existing AdicSpacesPartII R0/R3 contracts:

- `R0/tate-ring-norm`, `R0/spectral-seminorm`, `R0/uniformization`;
- `R3/uniform-iff-power-bound`, `R3/uniform-spectral-seminorm`.

The norm hypotheses were compared with those nodes. Over a nontrivially valued
field, a scalar pseudouniformizer has the required multiplicative norm behavior.
The raw unit ball still depends on the norm. The algebraic-extension
`spectralNorm` from minimal polynomials is not this supplier. Upstream AdicSpaces
Layers 3–4 are imported; no Tau Ceti roadmap is replanned.

P0’s existing adjoint/basic-setup nodes now have exact `plannedNodes` citations.
Its packet is **partial with a needs_changes checkpoint**, not accepted. The
four genuine P0 planned items stay planned. P1/P2’s genuine planned imports also
stay. Former routes 2, 3 and 6 are removed after their missing items are moved.

`cyclotomic-perfectoid-field` stays planned at P1: the stage describes general
compatible-root fields, but its node currently states only the Q_p example.
Request `P1-WITT` records the precise missing generalization, without pretending
the current node already has it.

**Maintainer/PerfectoidSpaces continuation edit:** in
`research/blueprint/packets/PerfectoidSpaces--P0.json`, generalize
`PerfectoidSpaces:P1/cyclotomic-perfectoid-field` to every perfect field k of
characteristic p: the completion of the union of
`Frac(W(k))(ζ_(p^j))` for compatible primitive roots is perfectoid. Preserve the
existing Q_p statement as k=F_p. Add tests with k an algebraic closure of F_p
and arbitrary infinite perfect k; do not use local compactness. The coordinate
power-series algebra remains PerfectoidRamification’s contract. Update that
packet’s own reader/suggested file consistently when its continuation applies
the request. No invented future stage or declaration ID is used here.

## /2 — Replace unaccepted companion imports by local missing inputs

The companion still has `status: partial`, review `revise`; none of its routes
is an accepted supplier. These six inputs now have local items on route 2:

| New local ID suffix | Published companion locator | Consumer |
|---|---|---|
| `uniform-root-algebra` | Exemples 2.9.3(2), (2.29)–(2.30), p.33 | root constructions |
| `uniform-tubular-colimit` | Proposition 2.9.2, (2.31), pp.33–34 | root/tube comparison |
| `root-as-tubular-colimit` | Corollary 2.9.3, (2.32), p.34 | `kummer-tube-comparison`, `kummer-perfectoid` |
| `perfectoid-root-variables` | Exemples 3.2.3(1), p.37 | `coordinate-tower-perfectoid` |
| `perfectoid-root-algebra` | §3.6.1, p.48 | `kummer-perfectoid` |
| `perfectoid-riemann-integral-closure` | §4.2.3, Theorem 4.2.2 and Lemma 4.2.3, pp.55–56 | `weak-functoriality-regular-target` |

The root-variable contract includes the universal property. The root-as-colimit
contract includes the unit-ball comparison and the discrete/nondiscrete
convention for `*` from Sorite 2.3.1(2)(b), footnote 11. The Riemann input states
complete integral closure, with compatible g-roots and the nonzerodivisor
hypothesis in Theorem 4.2.2. Merely citing Lemma 4.2.3 was insufficient.

These contracts align with the three additional inputs already identified by
`RT-AREA-padic-1.fixes.md` /2, edit 3. All six are treated alike: **missing here,
routed here**. Old companion IDs survive only as `reconciliationIds`, to coalesce
the source records if that extraction is later accepted. The unchecked informal
`imports` fields were removed; consumers now have local dependencies.

The same area fix’s Abhyankar repair is also made concrete. The new
`abhyankar-integral-comparison` item records the cited integral-model,
almost-finite-étale and trace conclusions in the ramified root-ideal base, with
an explicit pending input from PAPER-BHATT-SCHOLZE-22/60, Theorem 10.9 with
J=(g), in its Galois form. That accepted paper’s route 3 is the single generic
owner: `PerfectoidQuotientsPartIIIntegralPerfectoidization`, grouped by parent
under `DESIGN-PerfectoidQuotientsPartII`. The comparison remains a missing
adapter; this fix does **not** claim to prove that Remark 10.10 alone supplies
all of André’s model, ideal and trace assertions. `abhyankar-faithfulness` and
`abhyankar-mod-p` consume this local adapter.

Stage order matters: BS22 10.9 uses André’s flatness. Thus Kummer flatness comes
before integral almost purity, which comes before this Abhyankar comparison
and the late direct-summand applications. There is no dependency of the
Kummer-flatness proof on the complete later ramification package.

## /3 — Share arbitrary-module CM and splinter vocabulary

New early route-1 definitions `big-cm-module`, `balanced-big-cm-module` and
`splinter` state Bhatt et al. §2.2’s generality. Modules need not be finite;
weak regularity and `M/mM ≠ 0` are separate conditions. The definitions have API
outlines, consumer uses and positive/negative tests. Existing
`big-cm-fixed` and `big-cm-balanced` derive the algebra forms, using the pinned
regular-sequence predicates. `direct-summand` now also states: **every
Noetherian regular ring is a splinter**.

On 30 September, design issues #3361, #3479 and #3480 were still open and
available. PAPER-BHATT-18 route 9 already uses the same new-route key; it creates
no additional owner. SchemeAndStackFoundations Part II can import the early
predicates without a cycle: they depend only on local algebra, parameters,
splitting and pinned regular sequences, not on that geometric Part II.

**Exact cross-file edits for the maintainer and the two design jobs:**

1. In `research/blueprint/papers/PAPER-BHATT-ETAL-23.result.json`, remove
   `/big-cm`, `/balanced-cm` and `/splinter` from route 10’s `items`. Keep all
   three `status: missing`; replace their `ownerRoute` value `BCM` by a new
   distinct value `DirectSummands`. Append a route with exactly this key:

   ```json
   {
     "route": "new",
     "roadmap": "DirectSummandsAndBigCohenMacaulay",
     "title": "Direct summands and big Cohen–Macaulay algebras",
     "area": "commutative",
     "items": [
       "PAPER-BHATT-ETAL-23/big-cm",
       "PAPER-BHATT-ETAL-23/balanced-cm",
       "PAPER-BHATT-ETAL-23/splinter"
     ],
     "reason": "Coalesce these arbitrary-module predicates with PAPER-ANDRE-18-B route 1 and PAPER-BHATT-18 route 9. SchemeAndStackFoundations Part II consumes the early definitions; it does not redeclare them.",
     "brief": "Use the early prefix of Direct summands and big Cohen–Macaulay algebras. Define big and balanced big Cohen–Macaulay predicates for arbitrary modules over a Noetherian local ring, using weak regularity of parameter systems and a nonzero residual quotient. Define reduced Noetherian splinter rings through linear retractions of finite injective extensions. Derive the algebra forms used by André. Import parameters and finite local algebra from DeformationAndDerivedPatchingAlgebra R03.1/R03.3 and pinned regular sequences. Export the predicates to SchemeAndStackFoundations Part II for closure vanishing, BCM test ideals and B⁰. These early definitions have no dependency on the geometric Part II or on perfectoid applications. Coalesce the source records with André and Bhatt’s identically keyed routes."
   }
   ```

2. Replace route 10’s brief sentence beginning “Build big/balanced/cohomological
   CM predicates” by: “Import big/balanced CM and splinter predicates from the
   early DirectSummandsAndBigCohenMacaulay prefix. Build the cohomological CM and
   geometric comparison/closure-vanishing package, BCM test ideals, B⁰ and
   their later applications here.” Keep the remaining consumers in route 10.
   Retain each item’s current uses/dependencies; an `imports` status is not valid.

3. For `/plus-completion-cm`, split out a missing item
   `PAPER-BHATT-ETAL-23/plus-cm-char-p` with the statement of this fix’s
   `absolute-integral-closure-big-cm-char-p`, locator HH1992 Theorem 1.1 as
   quoted in §2.2 Theorem 2.5, and put it on the same new route. The existing
   `/plus-completion-cm` becomes the shared final corollary using this item for
   characteristic p and its existing Bhatt/parameter-completion inputs in mixed
   characteristic. Thus both branches have one supplier each; do not route
   Bhatt’s mixed-characteristic theorem to HH1992. Cross-reference the matching
   local André item as reconciliation metadata.

4. Update that paper’s reader and let its authorized independent review accept
   the changed route 10 and newly appended route, with the actual resulting
   index. Do not copy or fabricate a review verdict. The design jobs #3361 and
   #3479 must use the shared early prefix and its import direction.

5. In PAPER-BHATT-18 route 9’s brief, replace its outdated assertion that the
   splinter predicate belongs to BHATT-ETAL-23 route 10 by an import from the
   same early DirectSummands prefix. Its kind/id/title/area already coalesce;
   leave that route key unchanged.

These edits are concrete but **not yet applied** to the other extractions;
their paths are not authorized outputs of #5023. This is the remaining
cross-file reconciliation work, not a completed global rerouting claim.

## /4 — Restore equal-characteristic inputs

`big-cm-equal-characteristic` states balanced big-CM existence for every
Noetherian local ring containing a field, with a direct dependency from
`big-cm-existence`, `big-cm-reductions` and `finite-cover-flat-domination`.
`absolute-integral-closure-big-cm-char-p` states the sharper excellent local
domain theorem of HH1992 and names the common BHATT-ETAL-23 characteristic-p
consumer. Both are on the same owner route as /3.

The bibliography now includes the correct 1992 title, *Infinite integral
extensions and big Cohen–Macaulay algebras*, Annals 135, 53–89,
[DOI 10.2307/2946563](https://doi.org/10.2307/2946563). Characteristic-zero
existence uses HH1995’s reduction, not an assertion about R⁺ in characteristic
zero. Original HH proofs were not read in this fix; the reading log says so.
The theorem statements and distinction were read in Bhatt et al. v3, pp.12–13.

The example is `B = Z_p[[x,y]]/(px,py)`. In `Z_p[[x,y]]`,
`(px,py)=(p)∩(x,y)`. These are incomparable primes; their quotient dimensions
are 2 and 1. Hence the only minimal prime of maximal dimension is (p), and the
reduction necessarily reaches characteristic p. The one-variable example
would not force this choice. The monomial calculation is checked below; the
dimension calculation uses the standard dimensions of F_p[[x,y]] and Z_p.

`unramified-reduction` now directly depends on
`frobenius-direct-summand-char-p` and `invertible-degree-retraction`. Its
all-Noetherian-regular conclusion cannot omit those branches.

## /5 — Repair the flatness sketch; record E26

The p.81 image confirms that the printed step (a) is a sketch, not an absent
argument. It invokes flatness on the affinoid polydiscs B_r but does not justify
the descent to nonaffinoid A_j0 or the nonfinite-module base-change comparison.
The claimed flatness is true. E26 records `kind: gap`, `affects: nothing`, with
the published locator, short quotation, correction and fresh bounded search.
No author-issued correction was identified. E26 has **no** invented review.

The new `complete-module-flatness` item states the exact general criterion:
A Noetherian, ϖ regular on A and M, M ϖ-adically complete, and M/ϖM flat over
A/ϖ imply M flat over A. For n≥2 the periodic resolution over A/(ϖ^n) computes

`Tor_1(A/(ϖ), M/(ϖ^n)) = ker(ϖ on M/(ϖ^n)) / ϖ^(n−1)(M/(ϖ^n)) = 0`.

The equality uses ϖ-torsion-freeness of M. The nilpotent flatness criterion gives
flatness of all truncations. Their surjective limit is flat by
[Stacks Lemma 15.28.4, tag 0912](https://stacks.math.columbia.edu/tag/0912).
No finite-generation assumption on M is inserted.

For the application, set `C=A°_j0⟨T^(1/p^j),U⟩/(ϖ_ik U−f_ik)` and ϖ=ϖ_j.
The multiplicative norm and norm-one f_ik give the torsion-free unit-ball
identification (17), by §1.2.1. This restricted-series quotient is Noetherian
and ϖ-adically complete. Step (b) gives its free special fibre; the nonzero
closed fibre over local A°_j0 gives faithfulness. The JSON lists these inputs.
`generic-fibre-flat` now depends on the integral result and follows by inverting
p. It no longer feeds that result. `flatness-by-fibres` and
`affinoid-rational-flat` stay as optional source-inventory entries outside the
repaired proof spine, so the paper’s true cited assertions are not lost.

Pinned `AdicCompletion.flat_of_isNoetherian` only proves flatness of the
completion of the base ring. Its statement was read; it does not implement the
arbitrary complete-module criterion. No exact replacement was found in the
pinned declaration index.

## /6 — Include infinite tower indices

`kummer-finite-purity` retains its stable ID but now quantifies over all
`j,k ∈ N∪{∞}` and has an accurate title. Infinite levels are directed unions,
not completions. The annihilator argument proves the (∞,∞) case. For finite j,
`coordinate-tower-flat` makes A°_j0→A°_∞0 faithfully flat, hence pure; for j=∞
the map is the identity. Compose with the (∞,∞) map, then take the left factor
A°_j0→A°_jk→A°_∞∞. Dependencies include ordinary `pure-composition`,
`pure-left-factor`, `coordinate-tower-flat` and the faithfully-flat/pure
comparison, all ordered before the consumer.

## Review provenance and remaining maintenance

E1–E25 retain byte-for-byte equivalent source-issue objects, including their
same-file finished-review verdicts: 20 confirmed and five rejected. The overall
old acceptance and per-item ownership audits move to explicitly scoped history;
they do not certify these changes. Fresh publication `sourceVersions` records
the main paper’s hash and whole-paper reading. New E26 awaits independent review.

The external file `PAPER-ANDRE-18-B.review.json` still has seven historical route
reasons and is not an authorized output. After independent fix review, its
authorized update must use this mapping: old 1→new 1, old 4→new 2, old 5→new 3,
old 7→new 4; old 2,3,6 removed. The new reasons are the active JSON route reasons,
with the extra mathematics checked by the new reviewer. Do not apply seven
old route-index verdicts to four renumbered routes. Its prior review report and
handoff are historical, superseded for changed contracts by this fix’s reader.

The maintainer must also apply P1-WITT and the cross-file edits in /3, and
coordinate the integral almost-purity adapter’s stage with the two Part II
designs. No upstream roadmap, generated queue, atlas data, or another job’s
review file was edited.

## Readings and validation

Fresh main-paper reading: all printed pp.71–93; images pp.81,82,92. SHA-256
`34da107d0b96149d9a6779ec1694a0cbb096136d021114b59427024ef3d47053`.
Focused companion reading: pp.2–3,12–13,16–17,33–34,37,47–49,55–56; hash
`087521436778eed56e5bac98f6f2b441bc2898eef35ebba9da1c1575bf00f96a`.
Bhatt et al. arXiv:2012.15801v3 §2.2, pp.12–13,15; hash
`533218825ca5045a9e8e04da1f78ef51e05c90dd83ca4ecb7cd6e8c68dff3d80`.
Stacks 0912 statement and proof; Numdam journal page, arXiv version history and
bounded correction searches. Other inherited readings stay attributed.

The reviewed AUDIT-17 R03.1/R03.3 rows, pinned regular-sequence definitions and
base-completion flatness declaration were read. The existing P0/P1 and
AdicSpacesPartII packet contracts were compared at statement level. No suitable
existing build at both pinned commits was found. No Lean project, cache, build
or language server was started.

Checks run from repository root:

```bash
python3 scripts/check_paper.py research/blueprint/papers/PAPER-ANDRE-18-B.result.json
python3 research/blueprint/intake.py check-files research/blueprint/papers/PAPER-ANDRE-18-B.result.json research/blueprint/papers/PAPER-ANDRE-18-B.md research/blueprint/redteam/RT-PAPER-ANDRE-18-B.fixes.md research/blueprint/handoff/FIX-RT-PAPER-ANDRE-18-B.md
git diff --cached --check
```

The following reproducible regression checks are structural and mathematical;
they are not Lean proofs. The finite examples test the Tor computation and the
minimal-prime calculation, while the argument above establishes their general
forms.

```python
import collections, itertools, json, pathlib, sys
sys.path.insert(0, 'scripts')
from source_issues import check_issues
from check_errata import versions_checked
r = pathlib.Path('research/blueprint')
d = json.loads((r/'papers/PAPER-ANDRE-18-B.result.json').read_text())
P = d['paper'] + '/'
items = {x['id']: x for x in d['items']}
assert len(items) == len(d['items']) == 204
assert collections.Counter(x['status'] for x in items.values()) == {
    'library': 23, 'planned': 10, 'missing': 171}
routes = collections.Counter(i for z in d['routes'] for i in z['items'])
assert all(routes[i] == 1 for i,x in items.items() if x['status']=='missing')
done, active = set(), []
def visit(n):
    assert n in items, n
    assert n not in active, active + [n]
    if n in done: return
    active.append(n)
    for q in items[n].get('dependencies', []): visit(q)
    active.pop(); done.add(n)
for n in items: visit(n)
assert len(done) == 204
assert sum(len(x.get('dependencies', [])) for x in items.values()) == 306
assert not check_issues(d['sourceIssues'],d['paper'])
assert not versions_checked(d,d['sourceIssues'])
assert len(d['sourceIssues']) == 26
assert 'review' not in d['sourceIssues'][-1]
assert collections.Counter(x.get('review',{}).get('verdict')
    for x in d['sourceIssues']) == {'confirmed':20,'rejected':5,None:1}
for x in items.values():
    if x['kind'] in ('definition','construction') and x['status']=='missing':
        assert x.get('api') and x.get('tests'), x['id']
    assert 'imports' not in x
def all_ids(x):
    if isinstance(x,dict):
        if 'id' in x: yield x['id']
        for k,v in x.items():
            if k != 'review': yield from all_ids(v)
    elif isinstance(x,list):
        for y in x: yield from all_ids(y)
packet_ids = set()
for f in ['PerfectoidSpaces--P0.json','AdicSpacesPartII.json']:
    packet_ids.update(all_ids(json.loads((r/'packets'/f).read_text())))
for x in items.values():
    for n in x.get('plannedNodes',[]): assert n in packet_ids, n
def ancestors(n, out=None):
    if out is None: out=set()
    if n in out: return out
    out.add(n)
    for q in items[n].get('dependencies',[]): ancestors(q,out)
    return out
early = ['almost-pure-module','almost-pure-left-adjoint','almost-hom-lift',
    'almost-ext-class','almost-pure-ring-adjoint','almost-pure-left-factor',
    'pure-composition','pure-left-factor','big-cm-module',
    'balanced-big-cm-module','splinter','complete-module-flatness']
ramification=set(d['routes'][1]['items'])
for n in early: assert not (ancestors(P+n) & ramification), n
assert P+'generic-fibre-flat' not in ancestors(P+'noetherian-stage-faithfully-flat')
assert P+'noetherian-stage-faithfully-flat' in ancestors(P+'generic-fibre-flat')
for n in ['big-cm-existence','big-cm-reductions','finite-cover-flat-domination']:
    assert P+'big-cm-equal-characteristic' in items[P+n]['dependencies']
for n in ['frobenius-direct-summand-char-p','invertible-degree-retraction']:
    assert P+n in items[P+'unramified-reduction']['dependencies']
for n in ['pure-composition','pure-left-factor','coordinate-tower-flat']:
    assert P+n in items[P+'kummer-finite-purity']['dependencies']
for p in [2,3,5]:
    for n in range(2,7):
        q=p**n
        kernel={a for a in range(q) if p*a%q==0}
        image={p**(n-1)*a%q for a in range(q)}
        assert kernel==image
    # Without torsion-freeness: M=Z/p, computed over Z/p^2.
    assert {a for a in range(p) if p*a%p==0} != {0}
# Monomial exponent order: p,x,y. (px,py)=(p) intersection (x,y).
for a,b,c in itertools.product(range(4),repeat=3):
    assert ((a>=1 and b>=1) or (a>=1 and c>=1)) == (
        a>=1 and (b>=1 or c>=1))
support=[{0,1},{0,2}]
candidates=[set(s) for k in range(4) for s in itertools.combinations(range(3),k)]
hits=[s for s in candidates if all(s&t for t in support)]
minimal=[s for s in hits if not any(t<s for t in hits)]
assert minimal==[{0},{1,2}]
assert [3-len(s) for s in minimal]==[2,1]
print('204 items; 306 dependency edges; 171 uniquely routed missing items; '
      'packet references and provenance valid; 15 Tor models, '
      '3 torsion counterexamples and 64 monomial cases pass.')
```
