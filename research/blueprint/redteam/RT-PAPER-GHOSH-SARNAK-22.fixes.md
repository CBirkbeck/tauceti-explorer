# FIX-RT-PAPER-GHOSH-SARNAK-22

Codex `codex-J6LwjP`, 30 September 2026. Refs #4999. Input: `RT-PAPER-GHOSH-SARNAK-22.review.json`, all nine confirmed findings, on repository base `ca79b1b`. The issue excerpts three findings; this fix applies the verifier's full nine-finding result. Claim confirmed by bot comment 5916367587; the full issue was reread after confirmation.

## Result and scope

The extraction now has 64 items: 4 library, 2 planned, 58 missing, each missing item routed exactly once across six routes. Its source ledger has 24 entries. The CA.4 packet gains three nodes and 26 requests (25 exact source items and one FF.1 comparison contract), with nine total gaps and explicit partial CA.4 coverage. These are plans with `implementationStatus: unchecked`. The fix does not claim to finish the future CA.4 blueprint or its general level-k proof closure.

Only the four assigned deliverables and this job's handoff are changed. No upstream roadmap, generated queue, atlas data, other worker's extraction/review, or unassigned CA reader/suggested file is edited. Source and calculation scratch is removed after submission; the reproduction code below preserves the fresh calculations.

## Confirmed findings applied

1. **RT-PAPER-GHOSH-SARNAK-22/1 — exceptional inequality.** Item 5 now states h_M(k)≥h⁺_M(k)+1 for exceptional k≥5. New paper issue E21 and packet issue E507 record the false printed direction, with no copied review verdict. The packet nodes `markoff-positive-root-orbits` and `markoff-exceptional-class-number-lower-bound` isolate the injection and the additional orbit. The proof checks the large-coordinate component: in (4.1) the bracket is positive for k≥5 and |x_j|≥3 without genericity; negative roots have only increasing moves, a positive vertex has one decreasing move, and increasing moves stay in the large locus. An orbit beginning at a negative root therefore cannot meet a small-coordinate point or a second negative root. Outstanding carrier, Δ and finiteness inputs are explicit requests, not silently assumed formalized. At k=5, (0,1,2) exists and F⁺ is empty (minimum polynomial value 54). Independent enumeration found 7105 exceptional values with empty F⁺ up to 100800, including 5,58,100792. This does not change the §7 means, which count F± directly, or the generic fundamental-domain and almost-all statements.

2. **/2 — routed sources absent from live jobs and packet.** The packet now names this source and has one exact request per missing CA.4 item: 3–17,24–26,35–39,61–62. Each gives the extraction id, full mathematical contract, locator and consuming scope. CA.4 is changed from `source_decomposed` to `partial`; existing coefficient-three nodes cannot satisfy all-level-k coverage. Route 5 explicitly makes the general V_k/Γ/fundamental-set imports conditional. Fresh issue reads found no Ghosh–Sarnak mention in #1025, #1040, #1030, #1021, #1022, but did find it in #3367. The maintainer queue-refresh action is recorded below, coalesced with CHEN-24/5 and GAMBURD-MAGEE-RONAN-19/7 rather than a new infrastructure job. Requests make the owned fix concrete without worker edits to generated files.

3. **/3 — RS-03 Gauss-sum ownership.** Route 1 is CA.4 only. Item 25 and the Appendix B analytic route import finite-field normalization from `FiniteFieldsAndCharacterSums:FF.1`; the underlying square identity is already `mathlib:gaussSum_sq`. The packet has the precise FF.1 request. The reviewed CA.4/FF.1 audits and RS-03 boundary were read. Freshly reading the pinned declaration and section variables also caught an overstatement in item 28: the theorem assumes a finite field R and a commutative integral domain of values, not any finite commutative ring. That directly related extraction error is corrected. No prime-power Gauss-sum theorem is falsely inferred from the finite-field result. The old independent review's stale RS-03 sentence is a scoped maintainer correction below.

4. **/4 — ring-valued Fricke owner.** Item 23 is missing again: BelyiMaps only plans SL₂(ℝ), whereas §6 uses ℤ/pⁿℤ. A sixth route uses exactly the accepted Chen route's coalescing id/title/area, `NonabelianLevelStructures`; no corresponding atlas stage currently exists, so the item is not marked planned. The brief separates early commutative-ring trace algebra (before CA.4) from later character varieties (which may import CA.4), preventing a circular ownership request. No upstream change is requested. For the local point, direct substitution works: f=e⁻¹, c=(e−f)⁻², x₁=2−(k−4)c, x₂=e+f, x₃=e−f+fx₁. With e=2 this is valid for p≥5; 720 modular cases passed. This removes the need for a completed character-variety layer merely to obtain Corollary 6.3.

5. **/5 — false blanket version history.** All E1–E20 `searched` fields drop the unsupported assertion that all statements persist in every preprint. E11 distinguishes the known exponent correction from the independently reviewed constant-1 issue. Actual downloaded PDF pagination is v1 p.5 and v2 p.6 for Theorem 1.2(i), versus v3 p.5; the verifier's v1 p.4/v2 p.5 locators point into figures. The exponent changes from −1/4 to −1/2; Loughran–Mitankin v3 pp.2–3 explicitly discusses it. E21 separately records the inequality where actually read: v1 p.5, v2 p.3, v3 p.5. New E24 records the logarithmic denominator omitted in Remark 1.3(a)'s contextual count, against Loughran–Mitankin Theorem 1.4. All old independent verdict objects remain unchanged; new entries are unreviewed.

6. **/6 — version provenance.** Added structured `sourceVersions`: the original full v3 reading is attributed to its original worker/date; the current focused v3, v1, v2 and Loughran–Mitankin readings each have dates, URLs, SHA-256 and exact scopes. The new packet source has the focused provenance too. The main published PDF/text was not obtained, and no full published read is claimed. Springer does expose appendices in HTML, so the access note does not inaccurately call the entire article inaccessible. These appendices were not freshly audited here. A separate `sourceAccess` entry records that limitation; no `kind: published` unread entry is supplied, since collation interprets that kind as a published reading. The §18 source-issue and version checks pass.

7. **/7 — shared carrier and zero-fibre reuse.** Items 3,4,7,8 explicitly coalesce the n=3,a=1 specialization of GMR/1 and its descent machinery GMR/5 in CA.4, retaining Γ's additional double-sign action and level-specific hypotheses. Item 10 keeps only the new Δ minimum. New item 64 is planned in CA.4 via `markoff-coefficient-one-zero-orbits`, using the existing coefficient-three carrier, moves and `markoff-root-generation`. The mod-3 proof treats both cases: three unit coordinates make sum-of-squares zero but product nonzero; a zero coordinate forces the remaining squares both zero. Over ℤ divide by 3; normalize signs for a nonzero solution, then apply root generation. This does not transport statements through multiplication by 3 modulo 3. All 27 residue triples and 41 bounded integer points with their move identities passed the regression.

8. **/8 — missed slips and residue nuance.** E22 corrects §10 p.34's Hasse-failure cross-reference from §7 to §8. E23 changes its admissibility cross-reference from §3 to §1/§4.1/Proposition 6.1. Item 36 explains that the prime-factor condition in Proposition 8.1(ii) excludes 3, so the listed residues 0,±3 mod 9 are redundant. This is not recorded as a false hypothesis. The positive ν<50 satisfying all conditions are 23,31,41,49, and k=1062 is admissible/generic with empty F⁺.

9. **/9 — reader/count/design synchronization.** Rewrote the reader to match 64 items, 4/2/58 statuses, six routes and E1–E24. Route 5 and the reader record that `DESIGN-ArithmeticDynamicsPartIIMarkoff` is superseded into pending `DESIGN-ArithmeticDynamicsPartII` #3367; the old roadmap id is only a coalescing proposal key. Historic verification is distinguished from the fresh fix computations. All original item ids remain intact.

## Source record

All fresh findings refer to arXiv texts, not an unread published version. Downloads and reads were on 2026-09-30; v3's historic full read was recorded on 2026-09-22 by Claude Code `cc-fb70e5`.

| Text | Fresh pages read | SHA-256 |
| --- | --- | --- |
| [GS v3](https://arxiv.org/pdf/1706.06712v3), 55 pages | 3–5,7,9–10,12–14,18–20,22–24,34; images 5,13 | `e4ddc7a115ad4afd61f0063d0b931baf85792eee2267d1d5c232bece11d3163d` |
| [GS v1](https://arxiv.org/pdf/1706.06712v1), 52 pages | 5 | `c40c3ab2c4e135134ece520a9ab16d51c4fc2d09d18bfea0b06f4365127993b6` |
| [GS v2](https://arxiv.org/pdf/1706.06712v2), 57 pages | 3,6 | `e4b2089d52504ad050660b757f7f567122bdd7c015fa4cd4b93d571769ae05a6` |
| [Loughran–Mitankin v3](https://arxiv.org/pdf/1807.10223v3), 28 pages | 2–3 | `a8ff60af529dbfa32884818b33846d32d07277707404960561b34444a31f7036` |

The Springer article/PDF endpoint and Crossmark metadata were checked; a bounded title/DOI erratum search found no explicit correction notice. This is a report of the search, not proof that no correction exists. The pinned Mathlib declaration was read at `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti remains pinned to `f790474821cf4256814db967cb154e7af3d0c369`.

## Maintainer actions outside these deliverables

- Refresh the generated added-source sections for blueprint issues #1025, #1040, #1030, #1021 and #1022 from the accepted routes after this fix is reviewed, jointly with the existing Chen/GMR queue-refresh findings. Preserve pending parent design #3367, which already mentions this paper. Do not create a duplicate Markoff Part II or separate infrastructure fix merely for the same refresh.
- In `research/blueprint/reviews/REV-PAPER-GHOSH-SARNAK-22.md`, the old claim that no other stage is touched by restructuring should be annotated: RS-03 makes FF.1 the finite-field Gauss-sum owner. Its item-23 paragraph and route-1 summary also need a historical correction annotation: real BelyiMaps does not cover arbitrary R; coalesce with Chen's pending NonabelianLevelStructures owner. Do not copy its old verdict to a new file or pretend it has already reviewed these changes.
- The CA blueprint owner should synchronize the new three node signatures into its reader/suggested file during the source-completion work. Those files are not listed in #4999, so this fix records their exact node ids and leaves their ownership intact. Decompose the 25 explicit source contracts before restoring source-complete coverage or permitting unconditional general level-k imports.

## Validation

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-GHOSH-SARNAK-22.result.json`: pass.
- `python3 scripts/check_blueprint.py research/blueprint/packets/ClassicalArithmeticCompletion.json`, with the pinned declaration index: 0 errors, 0 warnings; 333 nodes, 45 requests, 9 gaps, partial.
- `source_issues.check_issues` and `check_errata.versions_checked` on the extraction and packet: pass. `check_errata.py` itself expects an errata-v1 ledger and is not the extraction CLI.
- Intake file checks, assigned-file boundary, unique original ids, exact-once routing, unchanged old independent verdicts, node prerequisite acyclicity and whitespace checks: pass.
- The regressions below reproduce the 7105/7630/58800 counts, 720 local points, 41 bounded rescaling cases and four eligible ν.
- No Lean file is a deliverable of this job and none was compiled. No pinned build was available; no Lake project, cache download or language server was started.

## Reproduce fresh arithmetic checks

Run with Python 3; it uses only the standard library. This is a finite regression, not a proof of the unbounded orbit statements. The proof is in the packet's three new nodes.

```python
from math import isqrt
from collections import Counter
from itertools import product
import json
K=100800
F=Counter()
a=3
while 3*a*a+a*a*a<=K:
 b=a
 while a*a+2*b*b+a*b*b<=K:
  c=b
  while (k:=a*a+b*b+c*c+a*b*c)<=K:
   F[k]+=1;c+=1
  b+=1
 a+=1
exc=set()
for u in range(isqrt(K)+1):
 for v in range(isqrt(K-u*u)+1):exc.add(u*u+v*v)
for u in range(isqrt(4*(K-1))+1):
 for v in range(isqrt((4*(K-1)-u*u)//3)+1):
  s=u*u+3*v*v
  if s%4==0:exc.add(1+s//4)
exc.update(4+u*u for u in range(isqrt(K-4)+1))
admissible=lambda k:k%4!=3 and k%9 not in (3,6)
bad=[k for k in range(5,K+1) if k in exc and not F[k]]
hf=[k for k in range(5,K+1) if admissible(k) and k not in exc and not F[k]]
assert len(bad)==7105 and max(bad)==100792
assert len(hf)==7630
assert all(k in bad for k in (5,58,100792))
assert sum(admissible(k) for k in range(1,K+1))==58800
# Test the explicit Corollary 6.3 point without using a trace theorem.
nchecks=0
for p,n,k in product((5,7,11,13),(1,2,3),range(60)):
 m=p**n;e=2;f=pow(e,-1,m);c=pow((e-f)**2,-1,m)
 x1=(2-(k-4)*c)%m;x2=(e+f)%m;x3=(e-f+f*x1)%m
 assert (x1*x1+x2*x2+x3*x3-x1*x2*x3-k)%m==0
 nchecks+=1
# Modulo 3 the coefficient-one equation only has its zero point.
assert [x for x in product(range(3),repeat=3) if (sum(t*t for t in x)-x[0]*x[1]*x[2])%3==0]==[(0,0,0)]
# Every bounded integer point scales to the existing coefficient-three carrier.
count=0
for x in product(range(-30,31),repeat=3):
 if sum(t*t for t in x)==x[0]*x[1]*x[2]:
  assert all(t%3==0 for t in x)
  y=tuple(t//3 for t in x);assert sum(t*t for t in y)==3*y[0]*y[1]*y[2]
  for i in range(3):
   j,l=[r for r in range(3) if r!=i]
   assert x[j]*x[l]-x[i]==3*(3*y[j]*y[l]-y[i])
  count+=1
# Redundant residues of Prop. 8.1(ii): prime factors 1 or 7 mod 8.
def factors(n):
 out=[];p=2
 while p*p<=n:
  while n%p==0:out.append(p);n//=p
  p+=1
 if n>1:out.append(n)
 return out
nu=[n for n in range(1,50) if n%9 in (0,3,6,4,5) and all(p%8 in (1,7) for p in factors(n))]
assert nu==[23,31,41,49]
assert 1062 in hf
result={'exceptional_empty_Fplus':len(bad),'largest':max(bad),'generic_Hasse_failures':len(hf),'admissible':58800,'corollary_6_3_cases':nchecks,'bounded_rescaled_points':count,'proposition_8_1_ii_nu_lt_50':nu}
print(json.dumps(result,indent=2))

```
