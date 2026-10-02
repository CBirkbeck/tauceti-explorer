# DESIGN-HodgeStructuresPartII — determinant frame bridge checkpoint

Agent: Codex — codex-a71f92. Refs #3371. Claim 5953381486 confirmed by bot 5953384526; full issue reread afterward. Immutable audit base f9cfbaf2b11b46e79508bfaa1c4d60823bd266de. This is a partial checkpoint, not a completed blueprint or formalization.

## Delivered

Five declaration-sized finite-coordinate plans, with full hypothesis/proof/acceptance/prerequisite outlines and native suggested signatures:

- determinant-derivation-rows: differentiate the permutation formula and reindex single-row replacements; no matrix-unit assumption.
- determinant-row-action: determinant row linearity and duplicate-row vanishing give trace(A)det(S).
- determinant-gauge-matrix: trace(A′)=trace(A)−λdet(G⁻¹)δdet(G) for s′=Gs.
- determinant-gauge: exact connection equality under the native one-by-one unit induced by det(G).
- determinant-alternating-operator: determinant evaluation of the sum of section-operator replacements matches the line operator. A family stored as rows has action S*Aᵀ, not A*S; the proof explicitly reindexes the row sum to a column sum before transposing.

The generic Jacobi identity was found in **ColemanPowerSeries:L1/derivation-determinant-unit**, already planned in exactly the arbitrary commutative-algebra/native-derivation/matrix-unit generality needed. Its whole node and proof outline were read; it is imported, not restated or moved. The fifth request names that exact existing declaration, and H.0 explicitly requires ColemanPowerSeries:L1 so a provisional projection retains the supplier link even before its declaration is promoted. Matrix.trace_mul_comm matches its trace orientation.

Native determinants, alternating maps, units, scalar homomorphisms and derivations are reused. Pinned Tau Ceti already proves Matrix.sum_det_updateRow_mul_row for column weights d_j*S_rj. Its whole module was read; that built special case is neither replanned nor mislabeled as general Jacobi.

All 55 previous node objects are unchanged, as are their 103 API items, 89 planned definition/construction tests and six planets. Totals: 60 nodes (12 definitions, 16 constructions, 14 lemmas, 13 theorems, five comparisons), 43 baseline declarations, five requests and ten gaps. No new definition/construction is introduced. All 35 global omission entries are byte-identical. The eight routeManifest entries, 149-item obligations, sourceIssues and restructuring intent are retained; H.0 stays partial and H.1–H.8 stay not_read.

## Sources and ownership

Fresh EG author-version bytes: [author PDF](https://www.mi.fu-berlin.de/users/esnault/preprints/helene/126_esn_gro.pdf), 44 pages, SHA-256 0bfa00b7dbae7a59c193d3523028df826741f15d3e88cb50526f8656a7fb8e35. Selected fresh reading: §1 p.2 opening fixed-determinant paragraph/Definition 1.1/Remark 1.2; §2.1 pp.5–6 Higgs/trace-zero definitions and complete printed Lemma 2.1 proof; §4.2 pp.23–24 parameter definition and complete printed Lemma 4.9 proof. The latter cites Simpson inputs not freshly proved here. No full-paper reading, complete Acta/author edition collation, new source error or independently verified correspondence is claimed. The five finite algebra formulas are explicitly derived adapters, not paper-named theorems.

Parent HodgeStructures and nearby ReductiveGroups documents were read fully. Parent AUDIT-02 L0/L1/L3 built and L2 partly built verdicts are imported; D3 is not built and E1 partly built. CR.1, E1, DD.1 and D3 stage descriptions were reread. No HodgeStructuresPartII entries occur in the current link maps. Ordinary connections, native sheaf tensor/finite dual/exterior carriers, generic Rees filtrations and common variations keep their existing owners.

## Verification

- Actual indexed scripts/check_blueprint.py: zero errors, zero warnings.
- Actual five-file intake/private-path checks; whitespace and all new reader/hypothesis/proof/signature parity checks pass.
- All 55 prior nodes, 29 prior baseline records, 103 API items, 89 tests, six planets, routes, sourceIssues and the global omission ledger preserved.
- Read-only actual build.assemble projection: 2,971 stages, 8,663 edges; all 19 required layer edges present, no Hodge pending or skipped links, acyclic. Combined reachable declaration/request graph: 128 vertices, acyclic, including the exact Coleman Jacobi supplier.
- Exact models: 720 matrix pairs, ranks 0–3, over Q/F₂/F₃ Laurent polynomials with nonzero square-zero ε. Seed 3371; 6,303 assertions pass. These are regressions, not proofs. Reproduction code is below.
- Full exact changed suggested file elaborates with Lean v4.34.0-rc2 at pinned Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174: exit 0, zero errors, 123 sorry warnings, no other warnings; all 48 native examples elaborate. SHA-256 **6e90608f1e0748728112b947e7f5f6bf3b1c55398d62235d80cdf7a6300ad290**. This is a signature check with admitted bodies, not formalization.

An existing top-level project supplied the build. A preliminary invocation from the nested Mathlib dependency failed on the Aesop search path and automatically fetched eight redundant nested dependency copies (57 MB). Their timestamps and clean library git status were checked; only those generated copies were moved to recoverable trash. The correct existing top-level project was then used successfully. No library build, cache retrieval or Lean language server was run. There is no process left running. The preceding compilation receipts below apply only to their historical exact bytes, not by inheritance to this changed file.

Checks used a read-only immutable Git view and in-memory overlays; no atlas snapshot, repository copy, output build or shared worktree edit was created. Only the five allowed deliverables are published. Job scratch is removed after the PR's exact remote bytes are verified.

## Resume

1. **Do not add another general Jacobi theorem.** Consume ColemanPowerSeries:L1/derivation-determinant-unit with trace orientation converted by trace_mul_comm. Its native proof is still a supplier plan.
2. Import E1 finite locally free exterior powers/determinant-line sheaves and their actual universal property. Descend the sum of section-operator replacements through the alternating quotient; prove balancing, restriction and frame compatibility. The local determinant-alternating-operator plan supplies the trace comparison, and determinant-gauge supplies the det(G) transition law. Then prove gluing, pullback and connection functoriality. None of those global steps is discharged by these matrix formulas alone.
3. Resolve the exact CR.1/E1/DD.1 contracts and replace all 35 explicit global signature omissions honestly, not with fake Prop-valued obligations. The reserved intrinsic bundle still exists as a mathematical plan, not a compiled global sheaf carrier.
4. Keep coefficient/Galois equivariance and the Liu–Zhu unbounded t-adic filtered-period/graded-base/Tate adapter separate from finite split Griffiths/Rees algebra; never invert rank or choose away a Tate action.
5. Complete H.0 depth before H.1–H.8. Preserve all binding routes, especially mandatory real Noether–Lefschetz H.8, without marking unread layers partial or closed.

## Exact-model reproduction

Run the following standalone Python 3 program; it uses only the standard library and does not read or write repository files.

```python
"""Exact Laurent-dual-number model checks; tests, not Lean proofs."""
from fractions import Fraction
from itertools import permutations
from random import Random
from collections import Counter
import hashlib,json
rng=Random(3371)
mod=0
# R=K[x,x^-1,epsilon]/epsilon^2, K=Q,F2,F3; delta=d/dx.
def norm(a):return {k:(v%mod if mod else Fraction(v)) for k,v in a.items() if (v%mod if mod else v)}
def const(v):return norm({(0,0):v})
def term(v,x=0,e=0):return norm({(x,e):v})
def add(a,b):
 c=dict(a)
 for k,v in b.items():c[k]=c.get(k,0)+v
 return norm(c)
def neg(a):return norm({k:-v for k,v in a.items()})
def sub(a,b):return add(a,neg(b))
def mul(a,b):
 c={}
 for (x,e),v in a.items():
  for (y,f),w in b.items():
   if e+f<2:c[x+y,e+f]=c.get((x+y,e+f),0)+v*w
 return norm(c)
def delta(a):return norm({(x-1,e):x*v for (x,e),v in a.items()})
def total(xs):
 out={}
 for x in xs:out=add(out,x)
 return out
def poly():return total(term(rng.randrange(-2,3),rng.randrange(-1,3),rng.randrange(2)) for _ in range(3))
def matrix(n):return [[poly() for _ in range(n)] for _ in range(n)]
def ident(n):return [[const(int(i==j)) for j in range(n)] for i in range(n)]
def matmul(a,b):
 n=len(a)
 return [[total(mul(a[i][k],b[k][j]) for k in range(n)) for j in range(n)] for i in range(n)]
def matmap(f,a):return [[f(x) for x in row] for row in a]
def matadd(a,b):return [[add(x,y) for x,y in zip(r,s)] for r,s in zip(a,b)]
def matsub(a,b):return matadd(a,matmap(neg,b))
def matscale(c,a):return matmap(lambda x:mul(c,x),a)
def trace(a):return total(a[i][i] for i in range(len(a)))
def det(a):
 n=len(a);out={}
 for p in permutations(range(n)):
  s=-1 if sum(p[i]>p[j] for i in range(n) for j in range(i+1,n))%2 else 1
  v=const(s)
  for i in range(n):v=mul(v,a[i][p[i]])
  out=add(out,v)
 return out
def replace_row(a,r,row):return [row if i==r else old for i,old in enumerate(a)]
def replace_col(a,c,col):return [[col[i] if j==c else x for j,x in enumerate(row)] for i,row in enumerate(a)]
def tangent(a,h):return total(det(replace_row(a,i,h[i])) for i in range(len(a)))
def transpose(a):return [list(row) for row in zip(*a)]
def unit(n):
 g=ident(n);gi=ident(n)
 for i in range(n):
  power=rng.randrange(-2,3)
  # Nonreduced unit x^m(1+epsilon a), inverse x^-m(1-epsilon a).
  a=rng.randrange(-2,3)
  g[i][i]=add(term(1,power),term(a,power,1))
  gi[i][i]=add(term(1,-power),term(-a,-power,1))
 if n>1:
  for _ in range(2):
   i,j=rng.sample(range(n),2);a=poly()
   h=ident(n);hi=ident(n);h[i][j]=a;hi[i][j]=neg(a)
   g=matmul(h,g);gi=matmul(gi,hi)
 assert matmul(g,gi)==ident(n)==matmul(gi,g)
 return g,gi
counts=Counter()
for characteristic in [0,2,3]:
 mod=characteristic
 for n in range(4):
  for case in range(60):
   a,s=matrix(n),matrix(n)
   ds=matmap(delta,s)
   assert delta(det(s))==tangent(s,ds);counts["rowDerivative"]+=1
   assert tangent(s,matmul(a,s))==mul(trace(a),det(s));counts["traceLeftAction"]+=1
   h=matrix(n)
   assert tangent(s,h)==total(det(replace_col(s,j,[h[i][j] for i in range(n)])) for j in range(n));counts["rowColumnReindexing"]+=1
   lam=const(rng.randrange(-2,3))
   action=matadd(matscale(lam,ds),matmul(s,transpose(a)))
   assert tangent(s,action)==add(mul(lam,delta(det(s))),mul(trace(a),det(s)));counts["alternatingOperator"]+=1
   g,gi=unit(n);dg=matmap(delta,g)
   log=trace(matmul(dg,gi))
   assert delta(det(g))==mul(det(g),log);counts["importedJacobiRegression"]+=1
   assert mul(det(g),det(gi))==const(1);counts["determinantUnit"]+=1
   aprime=matsub(matmul(matmul(g,a),gi),matscale(lam,matmul(dg,gi)))
   coeff=sub(trace(a),mul(mul(lam,det(gi)),delta(det(g))))
   assert trace(aprime)==coeff;counts["gaugeCoefficient"]+=1
   line=sub(mul(mul(det(g),trace(a)),det(gi)),mul(mul(lam,delta(det(g))),det(gi)))
   assert trace(aprime)==line;counts["lineGaugeCompatibility"]+=1
   if n>0:
    v=poly()
    assert add(mul(lam,delta(mul(det(g),v))),mul(coeff,mul(det(g),v)))==mul(det(g),add(mul(lam,delta(v)),mul(trace(a),v)))
    counts["lineOperatorGauge"]+=1
 # Explicit counterexample to unchanged determinant coefficient, lambda=1:
 # G=diag(x,1), A=0; coefficient=-x^-1.
 g=[[term(1,1),{}],[{},const(1)]]
 gi=[[term(1,-1),{}],[{},const(1)]]
 ap=matmap(neg,matmul(matmap(delta,g),gi))
 assert trace(ap)==term(-1,-1) and trace(ap)!={};counts["wrongCoefficientRejected"]+=1
 # epsilon is nonzero with square zero, so this genuinely tests nonreduced rings.
 assert term(1,0,1) and mul(term(1,0,1),term(1,0,1))=={}
result={"seed":3371,"rings":"Q,F2,F3 Laurent polynomials with nonzero square-zero epsilon","ranks":[0,1,2,3],"pairs":720,"counts":dict(counts),"assertions":sum(counts.values()),"scope":"Exact finite model regressions, not formal proof"}
print(json.dumps(result))
```

## Archived preceding checkpoint handoff

The following is the preceding codex-J6LwjP handoff, retained for its historical receipts and resume context. Current node counts, supplier import and compilation hash above supersede its unfinished affine-Jacobi step.

# DESIGN-HodgeStructuresPartII — determinant adapter checkpoint

Agent: Codex — codex-J6LwjP. Refs #3371. Claim 5952774707 confirmed by bot 5952777457; the complete issue was reread afterward. Base 72b8733. Predecessor PR #5747 is the earlier full-file elaboration checkpoint by this session, building on codex-rtOQ9t's intrinsic continuation.

## Delivered

Eight declaration-sized additions: the coordinate determinant connection, its trace coefficient projection, trace-curvature identity, flatness preservation, dual compatibility, tensor rank multiplicities, gauge-curvature invariance, and promotion of the existing gauge-curvature API to its own lemma node. The promoted gauge theorem reuses the existing native signature; there is no duplicate declaration. The construction has three API items and four native tests (rank zero, rank one, scalar rank two, and a flat determinant of a nonflat connection).

The determinant coefficient is trace(A), not det(A). The parameter remains λ, not rank·λ. Tensor coefficients have rank(W)trace(A)+rank(V)trace(B), with ranks cast into the coefficient ring and never inverted. Duals keep the minus sign. Curvature transforms by conjugation, hence the determinant curvature is gauge invariant; the connection coefficient is not asserted unchanged under a nonconstant gauge. Trace loses information, including in positive characteristic.

Totals: 55 nodes — 12 definitions, 16 constructions, 11 theorems, 11 lemmas, 5 comparisons; 103 API items; 89 planned tests; 6 planets; 29 baseline declarations; 10 gaps; 4 requests. All 47 inherited node objects, original APIs/tests, the 149 routed input IDs, historical source/baseline prefixes, source issues and restructuring proposal are preserved. E1's existing request now explicitly includes exterior/determinant carriers. All implementation statuses remain unchecked. H.0 stays partial; H.1–H.8 stay not_read; no stage is closed.

The reserved HodgeStructuresPartII:key/higgs-parameter-connections remains the general mathematical ringed-site definition. These additions are finite free coordinate adapters; they do not construct that general sheaf object or remove its omitted native forms.

## Fresh evidence and edition boundary

Read the parent L0–L3 reviewed audit targets (built/partly built), D3's absent variation scope and E1's partly built scope. No dedicated HodgeStructuresPartII audit row exists. Read the actual CR.1, E1 and DD.1 supplier stage descriptions; screened link-map entries mentioning this roadmap (none asserted) and actual definition layer requirements. Parent HodgeStructures and ReductiveGroups upstream documents were read earlier in this continuous worker run; no fresh whole-document read is claimed.

Published EG20 retrieval returned HTTP 403. Used the author-hosted 44-page preprint at https://www.mi.fu-berlin.de/users/esnault/preprints/helene/126_esn_gro.pdf, whose bytes/pagination differ from the historical published edition. Fresh selected read: §1 p.2 opening fixed-determinant paragraph/Definition 1.1/Remark 1.2; §2.1 pp.5–6 Higgs definitions, trace-zero fixed determinant and Lemma 2.1 with proof; §4.2 pp.23–24 parameter definitions and Lemma 4.9 with its printed proof. No complete version collation, new erratum or correspondence proof is claimed. Existing published/LZ/Heuer receipts and source issues remain historical.

Author PDF SHA-256: 0bfa00b7dbae7a59c193d3523028df826741f15d3e88cb50526f8656a7fb8e35. New formulas are explicit finite algebraic derivations motivated by these source requirements, not separately named source theorems. The eight new excerpts reuse a checked three-word literal.

Fourteen new canonical trace statements were read with their complete hypotheses at Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and checked in the existing pinned declaration index. Derivation.leibniz and its local variables were reread. Existing trace, Kronecker and derivation algebra is imported, never replanned. Pinned Hodge/AG source searches and Mathlib ring/module/exterior searches supplied no competing parameter/determinant-connection carrier in those searched scopes; this is not a universal absence proof.

## Validation

Entire expanded suggested file COMPILED using the existing exact-pin Mathlib build, Lean v4.34.0-rc2: 0 errors, 118 sorry warnings, 0 other warnings; all 48 native examples included. All imports are Mathlib modules, so this does not require or certify a Tau Ceti build. The 35 global nodes, 65 APIs and 54 tests in the omission ledger remain omitted. Admitted signatures are not theorem implementations. One direct Lean process ran at a time; available memory before the final check was 70 GB, runtime 2.27 seconds. No project/cache setup, downloads of library artifacts, library build, language server or background compiler was started.

Suggested SHA-256: df692430d323e907f4a419970dbde6f4a72a6d354f5759a96a1c5a42c7c154e7.
Successful compiler-output SHA-256: b80d7603656e0947d9747150790f767c08eaf021e9fcc846b064b789c708518c.

Indexed blueprint checker: zero errors/zero warnings. Five-file intake and whitespace checks pass. Exact inherited preservation and new reader/native signature/API/example parity pass. Actual read-only atlas assembly with the definition and packet: stage DAG 3022 vertices/8662 edges; combined stage/declaration DAG 3071 vertices/8862 edges. All 18 required layer edges exist, both graphs are acyclic, and no pending or skipped links occur. Six planets stay within the layer cap.

Fresh exact polynomial/Laurent-polynomial models pass over characteristics zero, two and three: 270 pairs of polynomial connection matrices of ranks one through three with parameters 0/1/2; 90 nonconstant Laurent gauge cases. They check trace curvature, dual sign, tensor rank coefficients and curvature, and the derivative correction of the invertible gauge diag(x,1). Each characteristic includes nonzero trace-zero curvature of E12/E21, showing the flat-determinant converse is false. Receipt SHA-256 c6e05c58d20ebdc98bde25972dd8eac496dd858e4a29df031c7c4d0b723eaef4. These regressions are algebraic checks, not universal proofs.

## Resume exactly here

1. Import finite locally free exterior powers and the actual determinant-line carrier/wedge/frame-change coherence from E1. Build the induced alternating parameter operator; prove trace(A) in the chosen top-wedge frame, then the det(G) transition law using the derivation Jacobi formula before descent. The affine curvature invariant alone is insufficient. Fixed determinant requires the specified line connection and its identification; trace zero is not built into every parameter connection.
2. Resolve the precise CR.1 ordinary connection/exterior convention and missing E1 sheaf tensor, finite dual, tensor exactness, pullback and descent interfaces. Resolve DD.1 finite bounded split filtration/Rees fibers. Replace all 35 global omission entries with actual native signatures, APIs and examples, reusing the existing SheafOfModules and locally free carriers.
3. Complete global exterior-power/coefficient-equivariance functoriality and Liu–Zhu's unbounded t-adic filtered-coefficient/graded-base-ring/Tate adapter. A finite split subbundle filtration does not model the unbounded period-ring filtration; a Tate basis cannot erase Galois action. Do not assume rank is invertible when splitting trace-zero endomorphisms.
4. Finish all routed H.0 definitions and nonroutine proof inputs, then H.1–H.8 from their accepted briefs. Import ShimuraData:D3's common variation carrier. H.8 real Noether–Lefschetz is mandatory. Stable moduli, Simpson correspondence, periods, logarithmic degeneration, definability and real applications are not supplied by these coordinate adapters.
5. Continue preserving all eight route-manifest entries, including both legacy DegeneratingHodgeStructures routes. Keep torsion determinant, stability, integral versus complex variation, quasi-nilpotence and boundary assumptions exact. No conjecture becomes an unconditional theorem.

The small scratch directory holds only transient sources, logs and checking scripts; remove it after PR opening. The recorded hashes, scopes, counts and exact continuation instructions above are the durable receipts.
