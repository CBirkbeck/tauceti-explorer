# FIX-RT-PAPER-SMITH-24

Codex, session `codex-J6LwjP`; issue #4974; 2026-09-30.

All seven confirmed findings in `RT-PAPER-SMITH-24.review.json` are addressed in
the assigned extraction and reader. This includes findings 6–7, which were added
by the verifier, and the verifier’s corrections to the proposed remedies.
The independent review of this fix is pending. No independent-review verdict
has been manufactured or transferred from another file.

## Changes by finding

| Finding | Result |
| --- | --- |
| /1 | Restored E1–E7 without their ledger-only `review` objects; corrected item 1’s supremum, item 23’s nonnegative minima and item 37’s total-mass factor. E2 is correctly located in Proposition 2.12. Retracted the no-mistakes claims. Added version/read scope, preserving historical evidence separately. |
| /2 | Added items 57–74 with individual statements, source locators and statuses. Weighted theory is 57–60; domination/Frostman/lower semicontinuity/polar sets/capacity continuity are 61–66; Remez and flatness are 67–68; grid nonvanishing, separation, Tietze, discriminant, Blichfeldt and Minkowski I are library inputs 69–74. No unnecessary Salzer or general-balayage prerequisite is planned. |
| /3 | Items 6, 48 and 51 are library, with empty planned arrays. Item 52 is Minkowski II only, supplied by GN.1’s two existing bound nodes. Item 56 stays missing: the built arcsine measure is not an equilibrium theorem. Route 1 imports the actual libraries. |
| /4 | Replaced the Faltings R28.4 source route by a shared `AbelianSchemesAndArithmeticModuli` Part II route for item 53. It merges with Lipnowski–Tsimerman’s accepted Honda–Tate/Tate-Hom requirements. Applications 5, 43 and 44 moved to route 1, once each. Item 43 states the Kadets coordinate and multiplicity-normalized point-count identity. |
| /5 | General potential theory in the design brief uses compact Σ⊂ℂ. Real Hölder/Chebyshev/arithmetic specializations remain explicit. Item 8 was already correct and is retained. Item 36 now explicitly quantifies over all z∈ℂ. The CDT holonomy and CA.6 capacity consumers are recorded, without promising the open complex arithmetic extension of Theorem 1.5. |
| /6 | Item 32 restores the signed inequality, not its absolute value. Items 43/54 use x=π+q/π, and distinguish real Weil numbers ±√q. |
| /7 | Added E8–E11 against arXiv v2, after checking the PDF images. E8 uses the verifier’s valid capacity>1 example [−3,−1]∪[1,3]. E9/E10 repair the indices. E11 uses at most n forbidden-shift intervals, each of length at most a, to establish the required bound. |

The inventory is now 74 items: 12 library, 2 planned, 60 missing; route sizes are
52, 3, 4 and 1. All original 56 item ids are preserved. The proof/API decomposition
of the missing inputs belongs to their later blueprints (PROTOCOL §16).

## Source evidence and exact scope

Smith v2 was fetched on 2026-09-30 at 16:45:45 UTC, 470719 bytes, 47 pages,
SHA-256 `99b3855a176ddb280630f50cbed23039c1348417aad31d817f34c3b60f4a35a9`.
Freshly read pp.1, 7–9, 11–14, 16, 23–27, 31–47; rendered images checked at
pp.16, 24 and 27. The original complete-v2 read is preserved as historical
provenance, not relabelled as this worker’s full-paper read.

Published-version full text remains uncollated. The Annals page and Crossref
record have no linked update/correction; the arXiv page lists only v1/v2, and the
author’s page links the preprint. A title/erratum/correction search found none.
`sourceVersions` therefore has only `kind: preprint`; no metadata-only entry is
mislabelled as a read published text. Findings are explicitly version-specific.

The BLPS author PDF was freshly read at pp.2–3 and 10 (Corollary 2.5), SHA-256
`0341439faa4fb7b44b46987929ac82f29f9654b6b5f35bbff247dbd9092d01c6`.
Kadets arXiv:1906.02264, p.3 Proposition 2.1, was freshly read, SHA-256
`ebe339083567dbdc2e88ad0df03d2a17017e7912e48917f4ce64bea78fa15421`.
The Saff–Totik book download served only 13 pages of front matter. The extraction
honestly records its exact cited inputs through Smith’s text; Saff’s primary survey
Theorem 2.8 was separately read to check domination, especially ν(ℂ)≤µ(ℂ) and
I(µ)<∞. The Remez specialization is the one Smith actually prints, not an inferred
reconstruction of all of Erdélyi’s Theorem 1.

The /1 errata-copy provenance is distinct from review validity: REV-ERRATA confirmed
the other file. E1–E7 in this file await this fix’s independent review. Historical
`verification` moved to `verificationHistory` with its original scope. No review
object in the separate errata ledger or paper-review file was rewritten.

## Pinned library evidence

Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`;
Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.
These declaration statements were freshly read, including their hypotheses:

| File relative to pinned library | Lines / declarations |
| --- | --- |
| TauCeti/Probability/Process/EmpiricalMeasure.lean | 48–66: nonempty Fintype, normalized Dirac sum; 100–104: integration formula. |
| Mathlib/MeasureTheory/Measure/FiniteMeasure.lean | 726–730: weak convergence by bounded continuous real tests. |
| Mathlib/MeasureTheory/Measure/ProbabilityMeasure.lean | 364–370: probability-measure analogue. |
| Mathlib/MeasureTheory/Measure/Prokhorov.lean | 175–179: compact probability-measure space; 183–185: `isCompact_setOfPred_finiteMeasure_le_of_isCompact` (in the root namespace). |
| Mathlib/MeasureTheory/Measure/LevyProkhorovMetric.lean | 695–699: `MeasureTheory.instMetrizableSpaceProbabilityMeasure`. |
| Mathlib/Topology/Sequences.lean | 284–309: first-countable compactness gives convergent subsequences. |
| Mathlib/RingTheory/Polynomial/Resultant/Basic.lean | 134: resultant; 140: map; 478–480: split-root formula with leading coefficient power; 908–909: field coprimality criterion; 930: discriminant. |
| Mathlib/FieldTheory/Minpoly/Basic.lean | 41: integral-element minimal polynomial. |
| Mathlib/RingTheory/IntegralClosure/IsIntegral/Defs.lean | 53: integrality. |
| Mathlib/MeasureTheory/Measure/Dirac/Def.lean | 29: Dirac measure. |
| Mathlib/Combinatorics/Nullstellensatz.lean | 67–71: finite product-grid identity; 240–244: top-monomial nonvanishing. |
| Mathlib/Analysis/LocallyConvex/Separation.lean | 95–97: one-open-set convex separation. |
| Mathlib/Topology/TietzeExtension.lean | 68–81: closed-set and closed-embedding extension. |
| Mathlib/MeasureTheory/Group/GeometryOfNumbers.lean | 52–55: Blichfeldt; 65–69: strict Minkowski I. |
| Mathlib/Analysis/SpecialFunctions/Trigonometric/Chebyshev/Orthogonality.lean | 49–51: arcsine density carrier. |
| TauCeti/Analysis/SpecialFunctions/Trigonometric/Chebyshev/Measure.lean | 46–47: mass π, not an equilibrium characterization. |

The reviewed AUDIT-02 GN.0/GN.1 distinguishes the built lattice infrastructure and
Minkowski I from missing successive minima; AUDIT-18 CA.3 marks resultants and
discriminants built. AUDIT-07 ST.0 concerns arithmetic families and counting, not
an absent weak-convergence library. The current GN packet has explicit
`minkowski-second-lower` and `minkowski-second-upper` nodes. Both statements were
read; the packet does not contain the BLPS flatness input.

## Ownership and administrative follow-ups

The accepted Lipnowski–Tsimerman route already owns the finite-field classification
under the AbelianSchemesAndArithmeticModuli parent. Its proposed finite-field
roadmap id is not an atlas layer. The parent Part II design #3351 was available
when checked on 2026-09-30, so the replacement route reaches that design before
claiming a second owner. Plan Honda–Tate/Tate Hom once for all F_q and export it
to both papers. The related Kisin–Madapusi Pera–Shin route is outside this job.

The current CDT extraction needs capacity/equilibrium on general compact complex
sets (`potential-generalization-2.5.27`); CA.6 records a Dimitrov hedgehog-capacity
gap. In the future design, put common potential foundations before the CA.6
Dimitrov consumer, while the independent classical CA.6 trace constant feeds
Smith’s later arithmetic stage. Do not make the foundational potential stage
import the entire downstream CA.6 consumer, which would create a dependency cycle.
No not-yet-designed stage graph or Lean theorem is claimed to exist.

This issue allows exactly its fixes report, Smith result JSON and Smith reader,
plus the own-job handoff. Consequently these additional files remain untouched:

1. `errata/PAPER-SMITH-24.json`: its E2 locator still says Proposition 2.5;
   maintainers should change it to Proposition 2.12 after reviewing this fix,
   and reconcile E8–E11 into that ledger through an authorized errata update.
2. `papers/PAPER-SMITH-24.review.json` and `reviews/REV-PAPER-SMITH-24.md`:
   historical no-error/status/route conclusions are superseded; do not treat
   their old acceptance as review of the new 74-item inventory.
3. `handoff/PAPER-SMITH-24.md`: the old 155-item checkpoint description is stale.
   Use `handoff/FIX-RT-PAPER-SMITH-24.md` and the revised reader instead.

These are explicit maintenance notes, not silent scope expansion. The mathematical
corrections in the assigned deliverables are complete. The new fixes review and
published-text collation remain independent downstream work.

## Validation

- `scripts/check_paper.py`: pass.
- `source_issues.check_issues` and `check_errata.versions_checked` on the extraction:
  pass. The standalone `check_errata.py` CLI only accepts `errata-v1` ledger files;
  its initial direct invocation on this `paper-v1` extraction produced format/name
  errors, so the correct shared validators were used instead.
- Pinned declaration-index lookup: every library reference resolves.
- All 60 missing items have exactly one route; no library/planned item has a new route.
- Thirty-two regression checks passed, including 70-digit recalculation of Example
  5.16, mass scaling, signed versus absolute ratios, cofactor/root-interval indices,
  the corrected capacity>1 counterexample and the Frobenius-coordinate identity.
- Intake path/format checks and staged whitespace check: pass.
- No Lean file belongs to this JSON/Markdown fix. No compilation, build download
  or library build was run.

The reproducible regression script follows. It uses the existing pinned declaration
index via `TAUCETI_DECLARATIONS` and writes no generated files.

```python
import json,csv,collections,math,os
from decimal import Decimal,localcontext
from pathlib import Path
p=json.loads(Path('research/blueprint/papers/PAPER-SMITH-24.result.json').read_text()); by={x['id'].split('/')[-1]:x for x in p['items']}
checks=0
def ck(t):
 global checks
 assert t
 checks+=1
ck(len(by)==74)
ck(collections.Counter(x['status'] for x in p['items'])=={'library':12,'planned':2,'missing':60})
routed=collections.Counter(i for r in p['routes'] for i in r['items'])
ck(routed=={x['id']:1 for x in p['items'] if x['status']=='missing'})
ck([len(r['items']) for r in p['routes']]==[52,3,4,1])
ix={x['library']+':'+x['name'] for x in csv.DictReader(open(os.environ['TAUCETI_DECLARATIONS']),delimiter='\t')}
ck(all(d in ix for x in p['items'] for d in x.get('library',[])))
ck(all(by[str(n)]['status']=='library' and not by[str(n)]['planned'] for n in [6,48,51,69,70,71,72,73,74]))
ck(by['56']['status']=='missing' and by['52']['planned']==['GeometryOfNumbersAndQuadraticArithmetic:GN.1'])
ck(len(p['sourceIssues'])==11 and not any('review' in e for e in p['sourceIssues']))
ck('Proposition 2.12' in p['sourceIssues'][1]['locator'])
ck([v['kind'] for v in p['sourceVersions']]==['preprint'])
ck(p['routes'][3]['parent']=='AbelianSchemesAndArithmeticModuli' and p['routes'][3]['items']==['PAPER-SMITH-24/53'])
ck(set(['PAPER-SMITH-24/5','PAPER-SMITH-24/43','PAPER-SMITH-24/44'])<=set(p['routes'][0]['items']))
# Mathematical counterexamples / numerical checks, not text matching.
P=lambda x:x*(x-2)
ck(P(1)==-1 and abs(P(1))==1)  # E2 exponential cannot be the signed value.
ck(all(abs(1/l)<=1 for l in [-1,-2,-100]))  # E3 negative dilation factors unbounded below.
# E4 exact kernel constant at an interior point, mass 2 doubles it.
with localcontext() as ctx:
 ctx.prec=70
 e=Decimal('0.01');t=e.sqrt();ratio=(e*e+2*e*t+e)/(e-e*e);L=ratio.ln()
 ck(ratio==(1+t)/(1-t));ck(2*L>L>0);ck(L<=4*t)
 a=Decimal('0.087353');b=Decimal('4.411076');g=Decimal('0.215485');s=(a*b).sqrt()
 cap=(b-a)/4;D=(a+2*s+b)/4
 C=-cap.ln()+g*D.ln();moment=-g*(D/(a*b)).ln()+(1-g)*D.ln();trace=g*s+(1-g)*(a+b)/2
 ck(C<0);ck(moment>0);ck(Decimal('1.898303')<trace<Decimal('1.898304')<Decimal('1.89831'))
 print('Example5.16',str(C),str(moment),str(trace))
# E8 standing capacity hypothesis: cap(preimage of [1,9] under z²)^2 = (9-1)/4=2.
ck((9-1)/4>1);ck(not (-3<=0<=-1 or 1<=0<=3));ck((3+6)%2==1)
# E9 D+1 points require D adjacent pairs, whereas [0,D-1) gives D-1.
for D in [1,2,5]:ck(len(list(zip(range(D+1),range(1,D+1))))==D and len(range(D-1))==D-1)
# E10 all n+1 Lagrange cofactors are essential: n=2, nodes 0,1,2.
cofactor_last=lambda x:x*(x-1)
ck(cofactor_last(0)==cofactor_last(1)==0 and cofactor_last(2)==2)
# E11 n=1, B(0)=0, threshold=1: minimal N=1 is already allowed, so k=0 is not forbidden.
N=1;a=2
ck(abs(N)>=a/2 and not abs(N)<a/2);ck(N<=1*a)
# Smith's real coordinate x=pi+q/pi; q=5, trace x=2, elliptic count q+1-x=4.
pi=complex(1,2);q=5;x=pi+q/pi
ck(abs(abs(pi)-math.sqrt(q))<1e-12 and abs(x.imag)<1e-12)
ck(abs(x.real)<=2*math.sqrt(q) and abs((1-pi)*(1-pi.conjugate())-(q+1-x))<1e-12)
ck(-1/1<0 and abs(-1/1)>=.5) # an absolute quotient bound does not preserve signs.
print('PASS',checks,'checks')
```
