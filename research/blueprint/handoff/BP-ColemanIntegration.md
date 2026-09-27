# BP-ColemanIntegration — scalar five-term transport checkpoint

Issue #698. Codex — `codex-7e92bd`. 27 September 2026.
Claim 5852011342, confirmed by bot 5852012056; full issue read before and after.
Input snapshot: `448c011da57461d093d2d686960fcb157870374c`.

## Status and preservation

**Partial checkpoint.** Fourteen new nodes give the signed scalar transformations
and exhaustive norm reduction to the special-unit subcase. They build on the
predecessor's nested-disc Abel argument. No stage is newly closed and every
implementation status remains unchecked.

Totals: **132 nodes** — 19 definitions, 9 constructions, 62 lemmas, 32 theorems,
10 comparisons; **242 API entries**; **121 definition/construction tests** and
five inherited lemma tests; **22 planets**, **95 baseline references**, **20
requests**, **5 gaps**, **0 closed stages**. The 14 new nodes have 15 typed named
declarations and four typed regression examples in the suggested file.

All 118 inherited node IDs survive. **117 node objects are unchanged**; only
`L2/five-term-relation` gains the scalar reduction dependency and updated proof
boundary. All 24 source findings, 92 baseline records, 19 earlier requests and
inherited executable suggested-file text are preserved. The last request to
Polylogarithms is clarified: its field-general projective identities remain
needed for cyclic comparison/Bloch descent, not for this scalar reduction.
The L2 coverage, one gap and the semistable scope proposal reflect that boundary.
No new planet is added because L2 already has six.

The full preceding handoff, including earlier immutable provenance links, is at
[the predecessor revision](https://github.com/CBirkbeck/tauceti-explorer/blob/448c011da57461d093d2d686960fcb157870374c/research/blueprint/handoff/BP-ColemanIntegration.md).
Earlier GP checks, broad source readings and historical numerical claims remain
predecessor provenance; this continuation does not claim to have rerun all of them.

## New declaration chain

Write D for the existing branch-dependent p-adic dilogarithm and
R(x,y)=D(x)−D(y)+D(y/x)−D((1−1/x)/(1−1/y))+D((1−x)/(1−y)).
An admissible pair has x,y different from 0,1 and from each other.

1. `five-term-defect` defines this scalar expression. `five-term-arguments`
   checks all additional arguments are nonzero and nonone.
2. `defect-swap`, `defect-complement`, `defect-inversion`, `defect-dilation`
   prove sign minus for (y,x), (1−x,1−y), (1/x,1/y), (1/x,y/x), respectively.
   The last uses D(z/(z−1))=−D(z) and the exact two fractional arguments.
3. `defect-move-origin` and `defect-fractional` are three-move compositions,
   again with sign minus, at (x/(x−1),(y−x)/(1−x)) and
   (x/(x−1),y/(y−1)). Every intermediate pair remains admissible.
4. `defect-mixed-norm` sends 0<|x|<1<|y| to (1/y,x/y), with
   0<|x/y|<|1/y|<1. Two signs cancel.
5. `defect-separated-discs` sends x near 0 and y near 1 to mixed norms.
   `defect-close-pair` sends equal small norms with strictly closer difference
   to nested discs. The equal-spread case is kept separate.
6. `defect-small-first` exhausts all second-coordinate norms. Equal small
   norms with |x−y|=|x| use (1/x,y/x), whose second coordinate and its
   complement have norm 1.
7. `defect-special-unit-reduction` handles the arbitrary first coordinate:
   invert if large, complement if near 1, or swap if already special.
8. `five-term-from-special-units` is the explicit reduction implication:
   if R(u,v)=0 for every admissible pair with |v|=|1−v|=1, then R=0 globally.
   It neither assumes nor supplies that remaining analytic theorem.

All IDs are prefixed `ColemanIntegration:L2/`; all new declaration names are in
`TauCeti.ColemanIntegration`. The only nonlocal dependencies of the new chain
are three pinned norm facts. It introduces no generic projective carrier and
no pre-Bloch structure. None of the new nodes reaches the global target in the
dependency graph. The full graph has 505 internal edges and is acyclic.

## Inputs and source scope

Read the whole issue, owner campaign README, four-stage atlas extract, whole
predecessor handoff, 118-node inventory and relevant L2 statements/proof plans,
reader sections and seed signatures. Read the four reviewed AUDIT-23 rows and
review, touching link records and accepted RS-14/16/26 decisions. Binding worker
rules, both protocols and upstream guide were unchanged from the earlier full
reads in this session. The previously read upstream LocalFieldsRamification
and Multiquadratic models were also byte-checked unchanged. This is not a fresh
read of every line of the large inherited L0–L3 reader.

The Polylogarithms P.1 cross-ratio and Bloch–Wigner nodes are complex statements.
Their actual full statements were checked; no complex analytic theorem is used
over C_p. The K3BlochGroups and Habiro candidate screen found no owner already
providing this scalar p-adic norm reduction. Generic cross-ratios remain with
Polylogarithms; generic pre-Bloch carriers remain with K3BlochGroups. LAD and
other inherited requests are retained, with their existing dependency boundaries.

Pinned statements read directly: `PadicComplex.isNonarchimedean`, `norm_div`,
`norm_inv`. Pins: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`;
Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

Fresh primary sources:

- Rob de Jeu, [arXiv:2007.11014v1](https://arxiv.org/pdf/2007.11014v1),
  printed/PDF pp.6,7,14: normalization, branch discussion and corrected-sign
  paragraph. SHA-256
  `6d96d3d58d55e4c55506271e5cd0058b8ea8406995ca642febe868be87440b68`.
- Z. Wojtkowiak, [version of record](https://www.numdam.org/item/10.24033/bsmf.2171.pdf),
  printed pp.361–365 / PDF20–24, including limits and Proposition 4.4.
  SHA-256
  `3c29dd4f28f92bf84357ac423860d43b2aab91f840a3620333fabe84fd22e97e`.

The explicit scalar decomposition is a worker-derived elaboration, not a claim
that either source prints these lemmas or this case split. Both digests match
the packet. No new source erratum is asserted; all 24 findings are inherited.

## Validation

The complete suggested file **compiled with zero errors and 300 expected
placeholder warnings, no other warnings**. All 3,919 reached Mathlib sources
byte-match the pin. The one reached Tau Ceti logarithm module was built from
pinned source into an isolated build directory. Elaboration checks interfaces;
it does not prove any placeholder body.

Six complete scratch Lean field-algebra proofs check the argument product and
fractional substitutions, with three baseline telescope checks: no placeholders,
errors or warnings. Exact rational controls pass **154,058 assertions** on
6,162 admissible pairs and p=2,3,5,7. The 24,648 norm reductions cover 22 paths:
10,532 terminate at a strictly nested pair and 14,116 at a special unit.
All 6,162 formal defects are nonzero in the two-term quotient used for these
controls, so sign checks do not silently impose the global five-term theorem.
Reversing the fourth coefficient fails the inversion identity in 6,110 pairs.
The four seed examples include prime 2, equal norms with a close collision,
and different residue discs. Finite tests do not prove the analytic gap.

Indexed blueprint validation: **zero errors and warnings**. Official four-file
intake: **zero problems**. The errata wrapper passes for all 24 inherited findings.
Preservation, new API/test/reader parity, source hashes and scoped mutation checks
pass. The full inherited suggested declaration text is preserved after removing
comments and the new block.

Publication guard: all 53 captured inputs and the four predecessor output
blobs match main `71c43ba8cfa0f082eccf1e475e87e020f7d36bff`. The issue body and winning
claim are unchanged. The refreshed global source register adds the earlier own
Dirichlet E6 and three unrelated sieve findings; these do not alter this tranche.
Exactly the four authorized files are submitted using Git Data REST. No git
command was used.

## Where to resume

Keep this checkpoint partial. The missing analytic input is R(u,v)=0 for
**every** admissible u,v with |v|=|1−v|=1; a theorem only where all five
arguments are special is insufficient.

1. Construct the good-reduction model of P¹ minus {0,1,∞,v} for arbitrary
   special v and supply the exact L1 Coleman pullbacks for all five rational
   maps. The explicit inherited L1 model has roots-of-unity punctures and
   cannot silently stand in for this model.
2. Show the scalar defect is a Coleman function, establish its zero
   differential, then apply Coleman uniqueness and the boundary normalization.
   If first constructed over finite extensions, prove the algebraic-input case
   and justify extension by density/local analyticity on the admissible open
   locus. Arbitrary C_p points need not lie in finite extensions.
3. Apply the new scalar reduction implication. Separately obtain field-correct
   cyclic projective identities, including infinity/denominator cases, and the
   Bloch boundary/descent interface from their owners before closing the parent.
4. Retain the other inherited work: general-curve de Rham comparison, lift and
   pullback independence without globally free differentials, Besser–de Jeu's
   regulator proof decomposition, complex Artin L-function ownership, and all
   20 supplier requests. No new semistable theory is required by this tranche.

Do not infer Coleman constancy merely from local analyticity and zero derivative.
Do not replace the special-unit theorem by a structure field assuming its result.

## Reproducing the exact finite controls

The following standard-library Python uses formal rational symbols modulo only
reflection and inversion. Run in scratch space; it writes a JSON result there.

```python
from fractions import Fraction as Q
from collections import Counter
from pathlib import Path
import json
P=Path(__file__).parent;counts=Counter()
def ck(b,name):assert b,name;counts[name]+=1
def admiss(x,y):return x not in (0,1) and y not in (0,1) and x!=y
def neg(f):return {k:-v for k,v in f.items()}
def symbol(z):
 assert z not in (0,1)
 orbit=[(z,1),(1-z,-1),(1/z,-1),(1/(1-z),1),(1-1/z,1),(z/(z-1),-1)]
 key=min(t for t,s in orbit); signs={s for t,s in orbit if t==key}
 return {}if len(signs)>1 else {key:signs.pop()}
def defect(x,y,wrong=False):
 assert admiss(x,y)
 terms=[(x,1),(y,-1),(y/x,1),((1-1/x)/(1-1/y),1 if wrong else -1),((1-x)/(1-y),1)]
 out=Counter()
 for z,sgn in terms:
  for k,c in symbol(z).items():out[k]+=sgn*c
 return {k:v for k,v in out.items()if v}
def transforms(x,y):return {'swap':(y,x),'complement':(1-x,1-y),'inverse':(1/x,1/y),'dilation':(1/x,y/x),'origin':(x/(x-1),(y-x)/(1-x)),'fractional':(x/(x-1),y/(y-1))}
def pnorm(x,p):
 if x==0:return Q(0)
 n,d=abs(x.numerator),x.denominator;v=0
 while n%p==0:n//=p;v+=1
 while d%p==0:d//=p;v-=1
 return Q(p)**(-v)
# Every pair transformation is checked in the free Q-vector space on rational
# six-term orbits. No global five-term relation is imposed in this control.
vals=sorted({Q(n,d)for n in range(-9,14)for d in range(1,6)}-{Q(0),Q(1)})
pairs=[(x,y)for x in vals for y in vals if x!=y];nonzero=0;wrongrejected=0
for x,y in pairs:
 f=defect(x,y);nonzero+=bool(f)
 for name,(u,v)in transforms(x,y).items():
  ck(admiss(u,v),'admissible '+name);ck(defect(u,v)==neg(f),'signed '+name)
 a,b,c=y/x,(1-x)/(1-y),(1-1/x)/(1-1/y)
 ck(a*b==c and all(z not in (0,1)for z in (a,b,c)),'argument domain and product')
 if defect(1/x,1/y,True)!=neg(defect(x,y,True)):wrongrejected+=1
ck(nonzero>0,'control does not impose global five term');ck(wrongrejected>0,'wrong fourth sign rejected')
# Track transformations and exact norm conditions in the exhaustive reduction.
# Closed cases terminate at an actual strict nested pair; other cases at special v.
def small(x,y,p,path):
 nx,ny=pnorm(x,p),pnorm(y,p);assert nx<1
 if ny>1:return (1/y,x/y,'nested',path+['mixed:swap','mixed:dilation'])
 if ny==1:
  if pnorm(1-y,p)==1:return(x,y,'special',path+['special'])
  x,y=transforms(x,y)['fractional'];return(1/y,x/y,'nested',path+['separated:fractional','mixed:swap','mixed:dilation'])
 if ny<nx:return(x,y,'nested',path+['nested'])
 if nx<ny:return(y,x,'nested',path+['nested:swap'])
 if pnorm(x-y,p)<nx:
  u,v=transforms(x,y)['origin'];return(u,v,'nested',path+['close:origin'])
 return(1/x,y/x,'special',path+['equal:dilation'])
def reduce(x,y,p):
 nx=pnorm(x,p)
 if nx>1:return small(1/x,1/y,p,['first:inverse'])
 if nx<1:return small(x,y,p,[])
 if pnorm(1-x,p)==1:return(y,x,'special',['first:swap'])
 return small(1-x,1-y,p,['first:complement'])
paths=Counter()
for p in (2,3,5,7):
 for x,y in pairs:
  u,v,kind,path=reduce(x,y,p);ck(admiss(u,v),'terminal admissibility');paths[' / '.join(path)]+=1
  if kind=='nested':ck(0<pnorm(v,p)<pnorm(u,p)<1,'terminal nested')
  else:ck(pnorm(v,p)==pnorm(1-v,p)==1,'terminal special unit')
  # Each transformation contributes a minus; terminal labels are not transformations.
  steps=sum(s!='special'and s!='nested'for s in path)
  expected=defect(u,v)
  if steps%2:expected=neg(expected)
  ck(defect(x,y)==expected,'reduction sign transport')
# Source cases and the difficult equal-norm configurations are explicitly covered.
for p,x,y,want in [(5,Q(5),Q(25),'nested'),(2,Q(2),Q(8),'nested'),(5,Q(5),Q(30),'nested'),(5,Q(5),Q(6),'nested'),(5,Q(5),Q(10),'special'),(5,Q(5),Q(1,5),'nested')]:
 ck(reduce(x,y,p)[2]==want,'stated case classification')
r={'assertions':sum(counts.values()),'groups':dict(counts),'pairs':len(pairs),'nonzeroFormalDefects':nonzero,'wrongSignRejectedPairs':wrongrejected,'normPrimes':[2,3,5,7],'normalizationPaths':dict(paths),'scope':'Exact rational norm and formal two-term-orbit controls. No global five-term relation or analytic special-unit theorem is assumed or proved by these finite tests.'};(P/'regression-results.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r))
```
