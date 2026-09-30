# Red team: K₂ symbols, residues and reciprocity, T.3–T.7

Issue #4452; agent **Codex**, session **codex-rtOQ9t**; 2026-09-30.
Target: `BP-K2SymbolsBrauer--T.3`, accepted after `REV-K2SymbolsBrauer--T.3`.
Snapshot: `1f2461e7b57c187571c03e84c2ce991ae231712f`.
I neither wrote nor reviewed the target. This attack is complete; the target
remains an accepted **partial** plan, with its nine recorded gaps intact.

Five new findings: **three high, one medium, one low**. The high findings have
counterexamples, including one detected by another theorem in the same Lean file.
The JSON is the machine-readable record; the details below make the findings
independently reproducible.

## Inputs and boundary of the check

Read the 58 nodes, their 119 API items and 69 planned tests, the seven coverage
records, 24 requests, seven restructuring notes and eleven sourceIssues. Checked
the suggested Lean definitions and theorem/test signatures across T.3–T.7,
the companion T.1 packet where imported, the campaign roadmap and the review.
The readme predates the review's corrections; its regeneration is already requested
by that review and is not presented here as a new discovery.

The source read on 2026-09-30 was [Weibel's author-hosted K-book draft](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf),
dated 29 August 2013. Its SHA-256 is
`a04f53c9393b20672fab2a6818279b2f9996dbc7cf74735789ed13804b058845`, matching the
accepted review. PDF page numbers are one-based; printed page numbers are eight
less in the portions used here. Pages 235 and 237 were also rendered and inspected
visually, to check the relative presentation and the differential detector.
The detailed source passages checked are listed in the JSON. This audit does not
claim a new reading of the published edition or of the review's archived errata.

All 69 baseline entries were opened at the required commits and their actual
statements or carriers compared with the claimed supply: Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. The references cover valuations and
residue units, function-field places/divisors, norms, presentations and cardinality,
relative/square-zero ring carriers, roots of unity, Kummer theory and cup products.
Additional pinned declarations for the second finding are linked below. No new
false baseline citation was established. The reviewed library audit continues to
mark the K-theoretic constructions as missing; the presence of supporting carriers
is not a claim that K₂ or its reciprocity laws have been formalized.

## 1. High: the relative presentation imposes invalid extra D3 relations

Location: suggested file `relDSRel`, lines 2367–2376; its quotient at 2380,
`relDennisSteinGroup.toRelK2` at 2388 and `relative_presentation` at 2398.
Node: `K2SymbolsBrauer:T.6/relative-presentation`.

The source's relative D3 is restricted to triples with **an entry** in the ideal
(III.5.11.1(b), PDF 235, printed 227). The Lean definition only requires each of
the three resulting pairs to be a relative generator:

```lean
(h  : r ∈ I ∨ s * t ∈ I)
(h₁ : r * s ∈ I ∨ t ∈ I)
(h₂ : t * r ∈ I ∨ s ∈ I)
```

Those conditions permit triples whose entries all lie outside the ideal. This is
not merely a stronger presentation that happens to give the same group.

Set `R = F₃[x,y]/(x²,y²)`, `z=xy`, and `I=(z)`. The ring has basis `1,x,y,z`
over F₃, its maximal ideal is `(x,y)`, and `I²=0`; therefore the required
`I ≤ Ideal.jacobson ⊥` holds. For `r=x`, `s=y`, `t=x+y`, no entry is in `I`,
but `rs=st=tr=z`. The present quotient sets

\[
 q=\langle x,z\rangle-\langle z,x+y\rangle-\langle z,y\rangle
\]

to zero, in additive notation.

Exercise III.5.14(a), PDF 237, supplies the detector
`δ : K₂(R,I) → I ⊗_R Ω¹_{(R/I)/ℤ}` with
`δ⟨u,a⟩ = u⊗dā` for `u∈I`; D1 gives the negative formula when the ideal entry
is second. The suggested file itself asserts this detector in
`relative_square_zero_kaehler` at line 2453.

Here `R/I=F₃[x,y]/(x²,xy,y²)`. The action of `(x,y)` on `I` is zero, so the
tensor target is the two-dimensional F₃-vector space with basis
`z⊗dx, z⊗dy`: the relations in its differential module have coefficients in
`(x,y)` and vanish after tensoring with `I`. In these coordinates,

| Relative symbol | Image under δ |
|---|---|
| `⟨x,z⟩` | `(2,0)` |
| `⟨z,x+y⟩` | `(1,1)` |
| `⟨z,y⟩` | `(0,1)` |
| `q` | **`(1,1)`** |

Thus the prescribed generator map from the current quotient cannot descend to
relative K₂. Absolute D3 does not rescue it: the absolute Dennis–Stein group
forgets the information that this relative detector sees.

The exact-arithmetic reproducer below independently annihilates **all** valid
relative D1/D2/D3 relations in this ring. It checks 477 D1 relations, 20,385 D2
triples and 56,889 source-allowed D3 triples. Of the 13,824 extra triples admitted
by the Lean condition, 12,960 have nonzero detector image. This verifies the
counterexample without relying on a sign guess about differentials.

**Fix:** require `r ∈ I ∨ s ∈ I ∨ t ∈ I` in the D3 clause, derive the pair
membership proofs, recheck quotient descent and add this non-example to the
relative presentation tests. The node already describes the intended source
restriction; its formal realization must enforce it.

## 2. High: global reciprocity is false at m=1

Location: packet node `K2SymbolsBrauer:T.7/global-reciprocity` (line 4552),
and suggested theorem `global_reciprocity`, lines 2798–2814.

Take **F=ℚ, m=1, a=b=−1**. All hypotheses hold: 1 is nonzero and invertible,
and every field and completion has enough first roots of unity. At the pin:

- [rootsOfUnity_one](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/RootsOfUnity/Basic.lean#L78)
  identifies `rootsOfUnity 1 M` with the trivial subgroup; line 111 also gives
  its subsingleton instance.
- [The exponent-one instance](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/RootsOfUnity/EnoughRootsOfUnity.lean#L113)
  supplies `HasEnoughRootsOfUnity M 1` for every commutative monoid.

Every value of the theorem's finite-place family `c` must therefore equal 1.
There is one real place of ℚ. Its factor is the **unconditional quadratic sign**
of `{-1,-1}`, namely −1 (III.6.2.1, PDF 240; also `realSignSymbol_symbol` and
`signSymbolAt_rat` in the suggested file). The proposed equality becomes `−1=1`.
The prose assertion that `{±1}` is a subgroup of `μ_m(F)` fails in the same case.
No unresolved normalization or unproved local comparison can change the unique
value of a symbol with target `μ₁`.

**Fix:** use real factor 1 for m=1 and the sign for m=2. Under the primitive-root
hypothesis no real place exists for m>2. Update the prose, Lean theorem and proof,
and test the trivial m=1 law separately from the m=2 real/dyadic cancellation.
Restricting the theorem to `2≤m` and separately supplying m=1 is also valid.

## 3. High: the real-conic compatibility test includes zero inputs

Location: suggested file lines 2673–2675:

```lean
example (r s : ℝ) : conicSymbol ℝ r s = -1 ↔ r < 0 ∧ s < 0 := by
  sorry
```

At `(r,s)=(0,0)`, the defining conic equation is `0*x²+0*y²=1`, which has no
solution. By `conicSymbol` at line 2597 the left side is true, but the right side
is false. The source's real Steinberg symbol is on **units** (III.6.2–6.2.1,
PDF 240), and `hilbertK2_real` at line 2634 correctly retains `r s : ℝˣ`.
Only the nearby test drops the domain restriction. The false test elaborates
because its proof is `sorry`; it cannot be proved with this signature.

**Fix:** take unit arguments or require both arguments nonzero, and make the
packet test's domain explicit. If the total auxiliary `conicSymbol` remains,
add a zero-input non-example. For all real inputs its no-solution criterion
would use `r≤0 ∧ s≤0`, which is a different statement from the Hilbert criterion
on units.

## 4. Medium: arbitrary base change lacks the ramification lemma it invokes

Locations: `T.4/transfer-base-change`, proof step 2 (packet line 2546), and
`T.3/higher-ramification-formula` (packet line 1635; Lean line 938).

The consumer permits arbitrary `F′/F`. Its proof applies the higher ramification
formula to `F′(t)/F(t)`, including the infinite extensions needed for completion.
The supplier still assumes `E/F` finite, and the Lean signature explicitly has
`[FiniteDimensional F E]`. Taking `F′=F(u)` with u transcendental already prevents
that instantiation. SourceIssue E10 correctly identifies the need to enlarge the
finite scope of Ex.III.7.7 for the completion argument in Ex.III.7.9 (PDF 265–266),
but the required enlargement has stopped at the consumer.

This is a missing proof input, not a counterexample to the intended base-change
identity. The supplier's existing uniformizer/unit proof works for any field
embedding with `ord_w|F=e·ord_v`, positive e and normalized surjective valuations.
It uses no finite-dimensional argument.

**Fix:** generalize that supplier and its signature, retain the finite version
as a corollary if needed, and include an infinite-extension instance in the tests.
Do not undo E10 by shrinking the base-change theorem back to finite extensions.

## 5. Low: two proof steps retain the old inverse comparison

Locations: `T.4/projective-line-reciprocity`, proof step 3 (packet line 2399),
and `T.4/weil-reciprocity-symbol-form`, proof step 2 (packet line 2454).

Both steps call the degree-two residue the inverse of the roadmap tame symbol.
The corrected T.3 convention and `milnorResidue_two` (Lean line 852) identify them
directly. For example, both send `{2,5}` over ℚ at 5 to **2** in F₅×, whose
inverse is **3**. Only the separately named K-book normalization is inverted.
The product-one reciprocity conclusion survives inverting every factor, so this
is a presentation error rather than another false reciprocity theorem.

**Fix:** use equality in these two steps; qualify any inverse statement explicitly
as a comparison with the K-book convention.

## Ownership, closure and known issues

The scope check kept the review's corrections: residues precede transfer
construction; the ring localization comparison supplies S.3/E.3; finite-field K₂
is imported from T.2; arithmetic computations consume T.5's certificates; relative
K₂ is distinguished from a mere kernel; and the Galois/twist/local-invariant
interfaces come from their named owners. The independent audit found no reason
to reconstruct those theories here.

Checked the relevant supplier stage texts: K.3/K.5/K.7, U.4/U.5, N.2/N.6/N.8,
M.1/M.3, L.3, AlgebraicCurves 12, ClassFieldTheory 5/6/10/14 and
QuadraticFormInvariants 6C. M.1 imports general twist carriers and supplies the
K-theory-facing interface; T.7 must continue to use that supply. CFT 14 owns the
quadratic product law, while the packet's general-m comparison is still a source
gap. General Milnor norm/residue compatibility, the completion decomposition,
Milnor's upper bound for K₂(ℤ), the non-field Dennis–Stein proofs and the
Keune–Loday comparison remain explicitly recorded gaps, not new findings here.

A dependency check used the assembled production atlas, its `requires`, and
accepted research restructuring/link edges: 2,840 stages and 8,399 distinct
edges. The graph of 1,664 accepted-packet/companion nodes had no cycle involving
a prerequisite edge of one of the target's 58 nodes, and no unknown nonlibrary
prerequisite was found. The proposed residue-to-transfer edge has no reverse
path. Requests to N.6/N.8 are explicitly consumer acknowledgments; interpreting
them as suppliers would create artificial reverse dependencies. Four requested
T.7 routes (CFT 4, 6, 14 and QFI 6C) are still absent in that graph; they are
already explicit requests, so they are not counted as newly omitted suppliers.
This does not claim that every request has been fulfilled or every source gap
has been closed.

## Reproduce the finite-ring obstruction

Run this standalone Python 3 code; it uses no downloaded package or Lean build.
Tuples represent coefficients of `1,x,y,xy`, and pairs represent coefficients of
`z⊗dx,z⊗dy`.

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

Expected relation counts are `D1=477`, `D2=20385`, `D3_source=56889`,
`D3_extra=13824`, `D3_extra_nonzero=12960`; the displayed counterexample has
`lhs=[2,0]`, `rhs=[1,2]`, `defect=[1,1]`.

## Validation

- `scripts/check_blueprint.py` on the target: 0 errors, 0 warnings in its packet
  result, with 58 nodes, 119 API items and 69 tests. The separately printed
  diagnostic says its declaration-index check is **form-only**; the direct
  pinned-source reads above supply the substantive baseline check.
- `check_redteam.check(result, "RT-BP-K2SymbolsBrauer--T.3")` returns no errors;
  `research/blueprint/intake.py check-files` reports two files and zero problems;
  `git diff --check` passes.
- **Tooling defect:** the required `scripts/check_redteam.py` CLI fails with six
  identifier errors because it uses `path.name.split(".")[0]`. It expects
  `RT-BP-K2SymbolsBrauer--T`, truncating this job's literal `T.3` suffix. The result
  and finding IDs retain the correct full job identity. The workflow invokes that
  CLI and will require a maintainer tooling correction before automatic intake.
  The concrete correction is to remove the terminal `.result.json` or
  `.review.json` suffix instead of splitting at the first dot. That script is
  outside this issue's permitted deliverables and has not been edited here.
- The finite-ring code above was run and produced the expected counts and defect.

No target packet or suggested Lean file is modified by this report. No Lean
compilation was run: no matching pre-existing complete build was identified, and
WORKERS.md forbids constructing one. The old review's elaboration result is not
claimed as a fresh check; the false examples demonstrate why elaboration with
`sorry` does not establish mathematical correctness.
