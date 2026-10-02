# Function-field arithmetic Part II — native coaction proof checkpoint

Worker: Codex — codex-rtOQ9t. Date: 2026-10-02. Refs #3403.
Branch: codex-rtOQ9t/functionfield-partii-second-continuation.
Publication/audit base: 50a5391786116e4f2caa037fabe6ea063abb4034.
Claim5956198709; bot5956201718 confirmed this worker. The full19,646-character issue was read before claiming and reread after confirmation.

## Result and precise boundary

All119 inherited node IDs and mathematical statements survive. There are now123 unchecked nodes:9 definitions,18 constructions,50 lemmas,35 theorems,10 comparisons,1 application. Required definition/construction coverage is88 API items and90 tests; including lemma tests there are94 tests. The39 planets, all ten partial stages, eight gaps, thirteen supplier requests, all source coverage/version/finding records and the complete AV sibling restructuring contracts are retained. Of the119 inherited node objects,113 remain byte-for-byte equal as parsed JSON. The other six gain exact prerequisite references or the comparison branch-image test; their mathematical statements are unchanged.

Four new lemmas supply the actual quotient relation tⁿ=f, Euclidean reduction tᵏ=f^⌊k/n⌋•t^(k mod n), native character powers e₁ⁱ=e_i, and the promoted coaction root API. They do not replan general polynomial quotients, μ_n or tensor algebras.

The suggested file now constructs δ through native AdjoinRoot.liftAlgHom, proves its root/constant/unique/weight APIs and the counit and coassociativity equations with actual native Hopf maps. It constructs Θ through native Algebra.TensorProduct.lift and proves its pure-tensor, left-root, right-factor, uniqueness and monomial formulas. Six acceptance computations cover exponent one, F₂ wild roots/characters, the regular nonunit2 over Z, the nilpotent parameter2 over Z/4 and the general n=2 branch-image formula. The old coaction weight signature is corrected to parenthesize its right root power; without these parentheses Lean parsed a power of the entire tensor. Its packet statement already had the correct mathematics.

The Mathlib-only extraction contains361 lines and14 examples. It uses the actual proved coaction, not an admitted coaction scaffold. Sixteen algebra declarations were audited for axioms; each depends only on propext, Classical.choice and Quot.sound, with no admission axiom. This targeted proof check does not certify the complete Tau Ceti file or any stage. The full file remains uncompiled because no exact-pin compiled Tau Ceti line-bundle/roots-of-unity import set is available. No Lake setup, cache download, library build or Lean server was started.

## Reading and ownership

Fresh reading: Talpo–Vistoli arXiv:1410.1164v2 §3.1 pp14–16, finite chart setup and character grading; full Lemma3.7, Proposition3.10, Lemma3.12 and Corollary3.13 statements and proofs. Downloaded715,504 bytes; SHA-25692a90d1e3d9ac46e17de8cc9d9524c1621d5e2a8caea7938de61d6503ec2a6c2. This is source motivation for the explicit native-algebra derivations, not a claim that the paper states the kernel or matrix formula verbatim. Broader YZ19/AGV/B24/AV reading and inherited source findings remain predecessor evidence.

Read the whole latest predecessor handoff; full reviewed FA.0–FA.7 target/evidence/duplication records in the current aggregate under REV-AUDIT-20 (checked240/corrected89); there is no PartII audit row. Read both exact paper-route briefs, the28-item YZ route and the38-item AV route inventory IDs; this does not recertify all38 AV detailed contracts. Read the actual SF.1/SF.3 and R09.3–R09.5 descriptions and reserved root-stack owner entry. Root stacks remain FunctionFieldArithmeticPartII:key/root-stacks. StableReductionPartII owns moduli of curves. General quotient/descent/Picard infrastructure remains with its suppliers; no source route or sibling ownership changed.

At Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174, read the native AdjoinRoot evaluation/lift/ext statements, tensor lift/includeRight/power/ext formulas, MonoidAlgebra.single_pow, the actual character counit/comultiplication formulas, ofAdd_nsmul and ZMod.natCast_self. At Tau Ceti f790474821cf4256814db967cb154e7af3d0c369, read the actual generator abbreviation Multiplicative.ofAdd1. Seven added baseline records specify only these native capabilities. Existing line-bundle and geometric baseline receipts remain attributed to the earlier workers.

The older full source routes, formulas, supplier boundaries and worklist are preserved in the immutable [predecessor handoff](https://github.com/CBirkbeck/tauceti-explorer/blob/50a5391786116e4f2caa037fabe6ea063abb4034/research/blueprint/handoff/DESIGN-FunctionFieldArithmeticPartII.md). This checkpoint does not overwrite their source claims with a new whole-paper audit.

## Validation receipts

- check_blueprint.py with the actual pinned declarations.tsv:0 errors,0 warnings;123 nodes,88 required API items,90 required tests,80 baseline declarations.
- One direct Lean process in the existing exact Mathlib build; Lean4.34.0-rc2. Memory73 GB available before final check. Exit0;20 admitted-body warnings,0 other warnings,0 errors. Those admissions are the remaining coordinate/kernel/cokernel/criterion/inverse/determinant/rank statements and eight earlier examples; none is used by the16 audited declarations.
- Independent native-coordinate arithmetic:57,628 assertions across624 quotient-ring charts with modulus1–12, n1–8 and all coefficient values, including the zero ring. It checks power reduction, coaction multiplicativity on basis pairs and general vectors, counit, coassociativity, monomial images and4,900 action-index inverse cases through n24. Finite arithmetic is evidence only, not a Lean proof or stack comparison.
- Actual build.assemble overlay:3,056 stage vertices (including51 unchanged virtual upstream endpoints),8,723 stage edges; combined graph with174 reachable declarations:3,191 vertices/9,142 edges. Own graph:123 vertices/262 edges. All DAGs acyclic; no unresolved external reference, own skipped link or pending link. Three other roadmaps' pre-existing skipped-link lists equal the control build.
- Reader has all123 declaration/Inputs records, all88 API and94 test identifiers; every recorded declaration name and every API/test is present in native signatures or the explicit omission ledger. Ten definition stages equal packet scope. All node/status/source/owner preservation assertions and git diff --check pass.

Hashes:

- native: 83618bf04d583394bb2c39d8af4fa9cfecc4be99351925cbb7803f8ca3b5a0e4
- extraction: e61e177d523bfaeecdc22d16eb7f999c0ae7caaa8e36cfc243192eb2dfb7e641
- axiomExtraction: 000158909db7fa58b2d95ea93943a60354c681ad80f7a708ee3c9e743d741f25
- axiomLog: 920236c4660f73fded568d10cc423686a714d68a71c8e940958c9c44983ad2bd
- Independent arithmetic script: 933445122e4281562738d7c976f4c7c6e94d92fbcc28f4ab50c2d36071a5f25a

## Reproducing the targeted native check

Use an already compiled Mathlib build at the exact pin, with no setup/cache/library build. Check free memory first, run one lake env lean process, and stop it at20 minutes. Extract from the submitted suggested file as below; the native generator is expanded to its exact pinned definition. An exact-pin compiled Tau Ceti import set would permit the full-file check, but the current build does not supply it.

```python
from pathlib import Path
s=Path('research/blueprint/suggested/FunctionFieldArithmeticPartII.lean').read_text();sc=Path('../scratch/DESIGN-FunctionFieldArithmeticPartII-second')
imports='\n'.join(l for l in s.splitlines() if l.startswith('import Mathlib'))
initial=s[s.index('abbrev AffineRing (f : A)'):s.index('-- TauCeti.RootStack.affineCoaction.nativePoint')]
one=s[s.index('-- TauCeti.RootStack.affineCoaction.test_one'):s.index('-- TauCeti.RootStack.affineCoaction.test_sign')]
comparison=s[s.index('section AffineTorsorComparison'):s.index('-- Native acceptance computations')]
extra=s[s.index('-- Native acceptance computations'):]
fragment=imports+'\nnoncomputable section\nuniverse u\nnamespace TauCeti.RootStack\nvariable {A : Type u} [CommRing A]\nopen scoped TensorProduct\n'+initial+one+comparison+extra
fragment=fragment.replace('TauCeti.RootsOfUnityGroup.generator n','Multiplicative.ofAdd (1 : ZMod n)')
(sc/'native-extraction.lean').write_text(fragment)
axioms=['affineRoot.pow_eq','affineCharacter.pow','affineRoot.pow_reduce','affineCoaction','affineCoaction.root','affineCoaction.constant','affineCoaction.unique','affineCoaction.weight','affineCoaction.counit','affineCoaction.coassoc','affineTorsorComparison','affineTorsorComparison.tmul','affineTorsorComparison.left_root','affineTorsorComparison.right_factor','affineTorsorComparison.unique','affineTorsorComparison.monomial']
(sc/'native-axioms.lean').write_text(fragment+'\n'+'\n'.join('#print axioms TauCeti.RootStack.'+a for a in axioms)+'\n')
print('Extracted',len(fragment.splitlines()),'lines;16 declarations for axiom audit.')
```

Run the generated native-axioms.lean. The16 printed axiom lists must exclude any admission axiom. Hashes above identify the source/extraction/log used here. The arithmetic checker is reproduced below so deleting scratch does not lose its evidence.

```python
"""Independent monic-polynomial and cyclic-group-algebra arithmetic.
No library declaration or geometric conclusion is simulated.
"""
from collections import Counter
from random import Random
import json,hashlib
from pathlib import Path
rng=Random(3403);counts=Counter()
def bmul(x,y,n,f,m):
 z=[0]*n
 for i,a in enumerate(x):
  for j,b in enumerate(y):
   q,r=divmod(i+j,n);z[r]=(z[r]+a*b*pow(f,q,m))%m
 return z
def hmul(x,y,n,f,m):
 z=[0]*(n*n)
 for i,a in enumerate(x):
  if not a:continue
  h,r=divmod(i,n)
  for j,b in enumerate(y):
   if not b:continue
   k,s=divmod(j,n);q,t=divmod(r+s,n)
   index=((h+k)%n)*n+t;z[index]=(z[index]+a*b*pow(f,q,m))%m
 return z
def delta(x,n):
 z=[0]*(n*n)
 for i,a in enumerate(x):z[i*n+i]=a
 return z
def counit(z,n,m):return [sum(z[h*n+i] for h in range(n))%m for i in range(n)]
def right(x,n):return x+[0]*(n*(n-1))
for m in range(1,13):
 for n in range(1,9):
  for f in range(m):
   counts['ringCharts']+=1
   basis=[[int(i==j)%m for i in range(n)] for j in range(n)]
   one=basis[0];t=basis[1] if n>1 else [f%m]
   power=one
   for k in range(3*n+1):
    q,r=divmod(k,n);expected=[pow(f,q,m)*a%m for a in basis[r]]
    assert power==expected;counts['rootPowerReductions']+=1
    power=bmul(power,t,n,f,m)
   for i in range(n):
    assert counit(delta(basis[i],n),n,m)==basis[i];counts['counit']+=1
    # Native character comultiplication duplicates its character index.
    z=delta(basis[i],n);left={};rightco={}
    for h in range(n):
     for r in range(n):
      if z[h*n+r]:left[h,h,r]=z[h*n+r];rightco[h,r,r]=z[h*n+r]
    assert left==rightco;counts['coassociativity']+=1
    for j in range(n):
     assert delta(bmul(basis[i],basis[j],n,f,m),n)==hmul(delta(basis[i],n),delta(basis[j],n),n,f,m)
     counts['coactionBasisProducts']+=1
     actual=hmul(delta(basis[i],n),right(basis[j],n),n,f,m)
     q,r=divmod(i+j,n);expected=[0]*(n*n);expected[i*n+r]=pow(f,q,m)
     assert actual==expected;counts['comparisonMonomials']+=1
   for _ in range(5):
    x=[rng.randrange(m) for _ in range(n)];y=[rng.randrange(m) for _ in range(n)]
    assert delta(bmul(x,y,n,f,m),n)==hmul(delta(x,n),delta(y,n),n,f,m)
    assert counit(delta(x,n),n,m)==x
    counts['coactionVectorProducts']+=1;counts['vectorCounit']+=1
for n in range(1,25):
 images=set()
 for i in range(n):
  for j in range(n):
   k=(i+j)%n;j2=k-i if k>=i else n+k-i
   assert 0<=j2<n and j2==j
   images.add((i,k));counts['comparisonIndexInverse']+=1
 assert len(images)==n*n
# Wild and nilpotent coefficient rows are present; no averaging/inverse of n was used.
assert counts['ringCharts']==624
print(json.dumps({'counts':dict(counts),'assertions':sum(v for k,v in counts.items() if k!='ringCharts'),'scriptSha256':hashlib.sha256(Path(__file__).read_bytes()).hexdigest()},indent=2))
```

## Resume here

1. Start with native affineTorsorComparison.source_coordinates and target_coordinates. Build the actual monic AdjoinRoot and character tensor bases, preserving the zero-ring treatment and unique coefficient formulas. Native δ and Θ are now available as proved maps in the extraction.
2. Derive the exact kernel and image coefficient formulas, then their specified native module kernel/cokernel equivalences. Coefficient cancellation must distinguish annihilator(f), A/(f), regular nonunits and n=1; do not replace these with an abstract linear map or algebra quotient.
3. The monomial signature proves the native formula. Its packet also gives the index permutation and two-case inverse; the inverse is checked arithmetically here and its written proof is retained, but no separate native permutation-equivalence signature was added. Supply it if the basis transport needs it.
4. Prove the remaining sharp injectivity/surjectivity/bijectivity criteria, unit-parameter inverse, signed determinant, field zero-parameter ranks and all eight nonvanishing examples. Keep the actual native coaction in every extraction; no admitted scaffold is now necessary.
5. Resolve JAC-A and the section/unit coordinate comparisons, obtain the actual geometric carriers and scheme/groupoid comparisons, and then address the infinite fpqc root tower. Preserve the fppf/fpqc correction and B24 volume235 correction. Coarse root charts at f=0 are not torsors; normalized coframes use a unit parameter.
6. ST-LISSE, ST-OPS, NORM-2EXACT, FA-APPROX, EXTERIOR-COMP, LEAN-GEOMETRY, LEAN-SECTION-COMP and TOWER-TYPING remain open. The rank-one/YZ geometric endpoints and all-degree multiplicative coherences are not established by these finite algebra proofs. All stages remain partial.

After opening this checkpoint PR, delete its scratch directory and take the next available job in WORKERS order. Never unclaim submitted work, manually merge, close issues or change labels.
