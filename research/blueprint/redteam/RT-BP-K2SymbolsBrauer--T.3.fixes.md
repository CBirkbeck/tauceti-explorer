# FIX-RT-BP-K2SymbolsBrauer--T.3

Refs #5557. Codex — codex-a71f92; 1 October 2026.
Claim 5942410446 confirmed by bot 5942412233; the whole issue was reread
after confirmation. Audit base: `169ef5d8d483f3344684f74ebfc4d4f145f26cdf`.

**Outcome:** all five findings confirmed by
`RT-BP-K2SymbolsBrauer--T.3.review.json` are addressed at blueprint/signature
level. The issue body lists /1–/4; the verifier also confirms /5, which is
included. This is a complete fix submission, not a new acceptance of the
underlying partial blueprint and not a review of this session's own changes.

Only the four named deliverables change: this report, the T.3 packet, its
reader and suggested Lean file. No atlas/campaign/library files are edited.

## 1. Relative D3: require an entry of the triple in the ideal

`relDSRel` now quantifies `hI3 : r ∈ I ∨ s ∈ I ∨ t ∈ I`.
The three relative-generator membership witnesses are derived from this
guard by the pinned ideal multiplication lemmas. They are no longer free
hypotheses admitting triples with all entries outside I.

The quotient remains the free abelian group on the actual relative generator
subtype modulo the additive closure of D1/D2 and guarded D3. The generator
map's descent obligation explicitly splits D3 on hI3; D1 swaps an ideal entry
to the relative-symbol position when needed. This is a planning proof, not
a claimed implementation. Completeness still cites III.5.11.1(b); the
unobtained Keune/Maazen–Stienstra proof gap is preserved.

New API entries record the existing generator, relation set, quotient and
descent map. Three tests cover the zero ideal, the excluded triple and its
nonzero differential detector. The suggested non-example uses the actual
`DualNumber (DualNumber (ZMod 3))` carrier, not an abstract replacement ring;
its tensor-coordinate test uses the actual
`I ⊗[R] Ω[(R ⧸ I)⁄ℤ]` target.

I reran the red-team's exact-arithmetic reproducer, included below. For
R = F_3[x,y]/(x²,y²), z = xy, I = (z), r = x, s = y, t = x+y,
no triple entry lies in I but rs = st = tr = z. The target is F_3² with basis
z⊗dx,z⊗dy: the maximal ideal kills I, and the differential relations have
coefficients in that maximal ideal. The extra D3 defect has image (1,1), not 0.
All 477 D1, 20,385 D2 and 56,889 source-allowed D3 relations have zero image;
12,960 of the 13,824 formerly admitted extra D3 triples have nonzero image.

## 2. m = 1 reciprocity: retain the existing correction and test it

The current packet/signature already incorporated the independent area
review's conditional real factor: 1 for m = 1, quadratic sign for m = 2.
That correction is retained; the stale reader is synchronised.

The new full-product test at F = ℚ, m = 1, a = b = −1 uses the constant
first-root family and its empty multiplicative support. The finite-place
equalities use the pinned subsingleton first-root group; the conditional
real product is 1. This case needs no unresolved higher-power sign.
The separate m = 2 test has real and dyadic values −1, with product 1;
the odd-prime factors are 1. For m > 2 the primitive-root hypothesis excludes
real places.

The comparison proof now separates those cases and retains the independently
corrected invariant coordinate `(ℚ/ℤ)[m] ≅ ZMod m`, [a/m] ↦ a.
It does not reintroduce multiplication by m inside ℚ/ℤ as an exponent.
The higher-power local-comparison source/sign gap is not closed.

## 3. Real Hilbert comparison: units, with a zero-input non-example

The false `example (r s : ℝ)` now has `r s : ℝˣ`, with explicit
real coercions in the negative-sign criterion. Packet hypotheses, API, test,
acceptance and reader make that domain explicit. The already-correct
`hilbertK2_real` is retained.

The total `conicSymbol` definition is retained, with a new test
`conicSymbol ℝ 0 0 = -1 ∧ ¬ (0 < 0 ∧ 0 < 0)`.
The equation 0 = 1 has no solution; this demonstrates why the strict-negative
criterion cannot be a statement about all real inputs. An all-real criterion
would instead use two nonpositive entries; no such replacement theorem is
silently asserted here.

## 4. Arbitrary base change: supply the full valued-embedding interface

Both the degree-two and higher ramification formulas now require only a
field embedding, normalised surjective discrete valuations and
ord_w(f(r)) = e·ord_v(r) with e > 0. Their Lean signatures no longer ask for
`FiniteDimensional F E`. The order/unit/uniformiser proof uses no algebraicity:
units remain units; f(t) = c·s^e; residues vanish on all-unit symbols and have
the prescribed e-fold value on symbols ending in t.

The verifier's qualification is also applied: `residueFieldMap` now takes
`he : 0 < e`. The restricted valuation-ring map is local because positive
orders are equivalent for nonzero elements. Every caller, including
`residueDegree`, the complete-residue statement and the finite norm-residue
sums, passes a positive index. The finite all-places unramified refinement
and all finite norm/transfer hypotheses remain finite. No infinite-extension
norm is proposed.

The arbitrary-constant base-change proof splits finite places into:

- nontrivial restrictions, where the positive-index formula applies;
- trivial restrictions, where all imported entries are units and residues
  vanish by `milnorResidue_symbol_units` and symbol generation.

For F′ = F(u), the place t−u restricts trivially to F(t): a nonzero
p(t) ∈ F[t] evaluates to p(u) ≠ 0. It is not assigned a positive index over a
nontrivial base valuation. Infinity has index 1 and residue embedding F → F′.
This supplies the missing case without narrowing arbitrary base change or
discarding the completion input in E10.

Tests/acceptance cover the actual infinite carrier ℚ → RatFunc ℚ with its
5-adic Gauss extension (e = 1, residue F_5(u)), infinite constant extension
F(t) → F(u)(t) at t, the trivial-restriction case at t−u, and the e = 1
same-residue comparison with a completion. The suggested Gauss instance
takes a valuation with the stated order identity; it does not claim that
the Gauss valuation or its residue-field equivalence was implemented here.
The e = 0 counterexample to localness has 5 a base nonunit but a target unit.

Remark III.6.3.1 and Exercise III.7.8 state finite-extension versions.
The packet/source matches explicitly call this an elementary derived
generalisation, not an assertion quoted from those finite statements.

## 5. Internal degree-two comparison: equality, not inverse

The remaining projective-line proof step now identifies the degree-two
higher residue directly with the roadmap tame symbol. The already-corrected
Weil-symbol node is byte-for-byte unchanged; its reader section is synchronised.
The existing suggested degree-two regression sends {2,5} over ℚ at 5 to
2 in F_5^×; its inverse is 3. New acceptance also records that distinction.

The K-book's separately named opposite convention remains inverse.
Its projective-line example with finite factor a⁻¹ and infinity factor a
is retained explicitly as source convention. Inverting all factors preserves
a product-one conclusion; that fact is not used to conflate the two residues.

## Sources and library supply

Read the author-hosted [K-book draft](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf),
29 August 2013, SHA-256
`a04f53c9393b20672fab2a6818279b2f9996dbc7cf74735789ed13804b058845`.
Rechecked PDF pages 235, 237, 240–243, 254, 256 and 265–266. Pages 235
(relative D3 guard) and 237 (differential detector) were also rendered and
visually inspected. No new published-edition/archived-errata acquisition is claimed.

Read the reviewed library audit for the affected K₂ stages. It marks the
K-theoretic constructions absent and supporting carriers partial/present;
it does not supply a formalised K₂ or reciprocity law. Six baseline additions
were personally read at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174`:

- `rootsOfUnity_one` and the subsingleton instance, Basic.lean:78/111;
  also read the exponent-one enough-roots instance.
- `DualNumber`, `DualNumber.eps` and square-zero identities, DualNumber.lean.
- `IsLocalRing.ResidueField.map` and `map_residue`, Basic.lean:96/121:
  the local-hom hypothesis is mandatory.
- `Ideal.mul_mem_left` and `Ideal.mul_mem_right`, Defs.lean:61/64,
  including the commutative two-sided instance.

The existing 75 baseline entries and both library pins are retained; this
is not a new claim to have reread all 75 in this fix.

## Validation and preservation

The actual audit-base `check_blueprint.check` was run against the supplied
pinned declaration index and immutable repository world: **0 errors,
0 warnings**, 62 nodes, 81 baseline declarations, 15 planets, 11 gaps,
29 requests. The checker counts 115 API items and 67 tests on definitions/
constructions. The packet totals including the theorem/lemma regression
entries are 119 API items and 74 tests; the reader gives those totals.

The actual audit-base `build.assemble(require_distances=False)` was run
through a read-only immutable-Git view, substituting the current research
packet before and after this fix (not the older promoted packet):
2,957 stages and **8,623 → 8,623** stage-dependency pairs. All stage pairs,
skipped routes and 155 internal packet prerequisite pairs are preserved;
the internal prerequisite graph has no cycle. The only new prerequisites
are the six pinned library declarations, not new stage edges.
This hypothetical check is not an approval or live promotion.

Assertions preserve all original node IDs, parent/realises ownership, planets,
the complete gaps/sourceIssues/sourceVersions, requests, restructure and
coverage, the `needs_changes` independent review and reviewHistory. The four
newer area-fix nodes and all untouched nodes remain unchanged. The arbitrary
consumer scope and finite norm scope are retained. Packet/reader/Lean names,
statements, hypotheses and changed tests are synchronised. JSON parsing and
whitespace/diff checks pass.

**Lean not compiled.** No matching pre-existing build at both pins was
identified; WORKERS forbids creating one. No Lake setup/update/cache/build
or language server was run. Every implementation status remains unchecked.
Historical compilation of an older version is explicitly labelled historical
and is not a validation of these edited definitions/signatures.

## Standalone exact-arithmetic reproducer

Copied from the confirmed attack, rerun for this fix; standard Python 3 only.

```python
from itertools import product
import json
p=3
R=list(product(range(p),repeat=4));zero=(0,0,0,0)
add=lambda r,s:tuple((a+b)%p for a,b in zip(r,s))
neg=lambda r:tuple(-a%p for a in r)
sub=lambda r,s:add(r,neg(s))
def mul(r,s):
 a,b,c,d=r;e,f,g,h=s
 return (a*e%p,(a*f+b*e)%p,(a*g+c*e)%p,(a*h+b*g+c*f+d*e)%p)
def inI(r):return r[:3]==(0,0,0)
def delta(r,s):
 assert inI(r) or inI(s)
 if inI(r):return (r[3]*s[1]%p,r[3]*s[2]%p)
 return (-s[3]*r[1]%p,-s[3]*r[2]%p)
vadd=lambda a,b:((a[0]+b[0])%p,(a[1]+b[1])%p)
vsub=lambda a,b:((a[0]-b[0])%p,(a[1]-b[1])%p)
counts={'D1':0,'D2':0,'D3_source':0,'D3_extra':0,'D3_extra_nonzero':0}
for r,s in product(R,repeat=2):
 if inI(r) or inI(s):
  assert vadd(delta(r,s),delta(s,r))==(0,0);counts['D1']+=1
for r,s,t in product(R,repeat=3):
 if (inI(r) or inI(s)) and (inI(r) or inI(t)):
  z=sub(add(s,t),mul(r,mul(s,t)))
  assert inI(r) or inI(z)
  assert vsub(vadd(delta(r,s),delta(r,t)),delta(r,z))==(0,0)
  counts['D2']+=1
 st=mul(s,t);rs=mul(r,s);tr=mul(t,r)
 if (inI(r) or inI(st)) and (inI(rs) or inI(t)) and (inI(tr) or inI(s)):
  defect=vsub(vsub(delta(r,st),delta(rs,t)),delta(tr,s))
  if inI(r) or inI(s) or inI(t):
   counts['D3_source']+=1;assert defect==(0,0)
  else:
   counts['D3_extra']+=1;counts['D3_extra_nonzero']+=defect!=(0,0)
x=(0,1,0,0);y=(0,0,1,0);t=add(x,y)
result={'ring':'F3[x,y]/(x^2,y^2)','ideal':'(xy)','counts':counts,'r':x,'s':y,'t':t,'inIdeal':[inI(z) for z in [x,y,t]],'products':[mul(x,y),mul(y,t),mul(t,x)],'lhs':delta(x,mul(y,t)),'rhs':vadd(delta(mul(x,y),t),delta(mul(t,x),y)),'defect':vsub(vsub(delta(x,mul(y,t)),delta(mul(x,y),t)),delta(mul(t,x),y))}
print(json.dumps(result, indent=2))
```
