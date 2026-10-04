# BP-ComputationalNumberTheory

Codex — codex-7e92bd. Refs #1026. Claim comment 5984911497 was confirmed by bot comment 5984913585; the issue was reread before work. This is a new 108-node planning packet, preserving the four legacy decomposition ids, with its matching reader and suggested Lean file.

All six stages are planned under Protocol 0, with 22 original-target ledger entries and all nine routed paper items mapped. The pass is complete; no stage is closed. It has 187 API items, 183 definition/construction tests, 24 planets, 31 native baseline citations, 18 supplier requests, 26 explicit gaps and 22 source issues. Every declaration remains unchecked. The publication policy assigns lemma level (distance 4, threshold 5); the remaining lemma refinements are named precisely rather than represented as completed proofs.

CN.0 separates exact native carriers, isolated-root and p-adic presentations, and RAM/bit costs. CN.1 separates finite prime/factor certificates from discovery and probable-prime bounds. CN.2 retains torsion in unit stopping, requires factor-base completeness for class groups, and specifies order, integral-basis, local expansion and first-order residual certificates. CN.3 imports intrinsic symbols/curve algorithms, binds finite data through the native Sturm theorem, and gives complete common-eigensystem targets for the BCG examples. CN.4 evaluates imported analytic functions and certifies enclosures and Gram witnesses. The finite CT dataset checker realises the mathematical portion of CN.5; removal of that process layer remains a proposal, with its accepted outgoing supplier paths preserved.

The exact pins are Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. The suggested file compiled serially using an existing pinned build: Lean 4.34.0-rc2, compiler commit 6a10ac8c22beadecabdbb0919c2b50214762f91d, 35 GiB available before compilation, 3724 source modules authenticated, zero errors and 447 admission warnings, with no other warnings. These are admitted signatures and examples, not formal proofs. The Ore prototype explicitly omits the local ramification/residue-degree carrier comparison that its owner must supply.

The namespace-aware command index resolves all 295 proposed declaration/API names with no missing, duplicate or alternate names. The supplied declaration index omits the ModularForm namespace on L and Λ. The qualified-index helper preserves all original bytes and appends exactly those two source-confirmed aliases; both the original index hash and the two repairs are recorded. The ordinary checker and the checker with this repaired pinned index pass with no errors or warnings. The genuine immutable intake and source-issue checks and actual atlas assembly are rerun by verify.py, not replaced by a bespoke schema check.

Exact integer arithmetic independently reproduced the coefficients 1, −48, −195804 and 35830422465487817813321292 of ΔE₄²E₆ at indices 1, 2, 3 and 107; the last is −1 modulo 107. For weight 38 the integral Miller basis gives T₇₉ modulo 79 as [[3,17],[25,10]], with determinant zero and gcd(37,80)=1. The code also checks the two elementary Hecke identities at 4 and 6 and the excluded p=151 gcds. It does not replay the complete companion, Platt or CT datasets.

The mathematical base is 48ee1b070788204448f09aaeb5c240816c0439a1; the publication base is recorded separately in publication-base.txt. The actual stage graph, own-node graph and recursively expanded supplier graph are acyclic. All 32 accepted restructuring paths touching this roadmap survive. Foreign semantic payloads are preserved; incoming/outgoing edge metadata may reflect the new dependencies. The old bundled RAM-to-AKS planet edge is replaced by separate correctness and cost targets. The MF.11 trace request and the proposed CN.4-to-CM.5 forwarding are explicitly reported if the assembler does not draw them. The newer GN.5 packet provides LLL bounds, not the requested exact Fincke–Pohst enumeration, so the precise supplier request remains.

Resume mathematical refinement from targetInventory, sourceRouting, coverage.remaining and gaps. Priorities are finite root-count/separation witnesses; source-specific primality/factorization and bit-cost lemmas; maximal-order and square-free residual assembly; class/unit discovery with independent exact stopping; general-level and congruence q-expansion comparison; effective analytic tails; and complete CT/Platt/companion certificate replay. The CT intrinsic infinity-type/formula comparison belongs to its new design owner, whose stable stage identifiers are not available at this base. Never replace that missing bridge with an arbitrary predicate or infer exact vanishing from a small enclosure.

New source corrections include the reversed high-power containment in Stevenhagen Proposition 9.3 and the sine-centre typo in Arb v1; Arb's tangent branch typo is already corrected in the author source. Earlier reviewed CT/BCG issues retain their provenance. The BCG cohomological convention gives the companion coefficient exponent 81 at (p,k)=(107,26); a proposed exponent 25 in a downstream finding is corrected as an upstream note. No unverified CL proof suspicion is promoted to an erratum.

Only the issue's four authorized deliverables are changed. Public evidence recovery authenticates the packet, reader, suggested file, source/version ledger, checks and exact helper scripts. Full paper PDFs and temporary compilation environments are not published. After submission, retain only the named evidence and recovery receipts; delete disposable scratch. Independent review must assess all remaining mathematical gaps and source claims.

## Script: build.py

```python
"""Author the new blueprint and its matched typed signatures, from read sources."""
import json, pathlib, collections
S=pathlib.Path(__file__).resolve().parent
W=pathlib.Path.cwd()
RID='ComputationalNumberTheory'
N=[]; CODE=[]; BASE=[]; GAPS=[]; REQUESTS=[]
def nid(stage,slug):return f'{RID}:CN.{stage}/{slug}'
def src(name,locator,excerpt,match):return dict(sourceId=name,locator=locator,excerpt=excerpt,match=match)
def base(ref,module,provides,kind='theorem'):
    if ref not in [x['ref'] for x in BASE]:BASE.append(dict(ref=ref,kind=kind,module=module,provides=provides,checked='Full statement read at the pinned commit; hypotheses retained.'))
    return ref
def req(supplier,need,consumers):
    REQUESTS.append(dict(supplier=supplier,need=need,neededBy=consumers));return supplier
def gap(title,detail,consumers):GAPS.append(dict(title=title,detail=detail,neededBy=consumers))
def add(stage,slug,title,kind,statement,steps,deps,sources,lean,api=(),tests=(),uses=(),planet=None,hypotheses=(),acceptance=()):
    ident=nid(stage,slug)
    n=dict(id=ident,parentStageId=f'{RID}:CN.{stage}',realises=[f'{RID}:CN.{stage}'],title=title,kind=kind,statement=statement,hypotheses=list(hypotheses),proofSteps=list(steps),prerequisites=list(deps),sources=list(sources),acceptance=list(acceptance) or [x[2] for x in tests],implementationStatus='unchecked',library=dict(module=f'TauCeti/NumberTheory/Computational/Layer{stage}',namespace='TauCeti.Computational',declaration=lean[0]))
    if kind in ('definition','construction'):
        assert len(tests)>=3 and api and uses,ident
        n['api']=[dict(name=x[0],role=x[1],statement=x[2])for x in api]
        n['tests']=[dict(name=x[0],kind=x[1],statement=x[2])for x in tests]
        n['uses']=[dict(where=x[0],how=x[1])for x in uses]
    else:assert n['acceptance'],ident
    if planet:n['planet']=dict(name=planet)
    N.append(n)
    CODE.append('\n/- '+ident+' -/\n'+lean[1]+'\n')
    for x in api:CODE.append(x[3]+'\n')
    for x in tests:CODE.append('-- '+x[0]+'\n'+x[3]+'\n')
    return ident

interval=base('mathlib:NonemptyInterval','Mathlib/Order/Interval/Basic.lean','Closed nonempty intervals represented by ordered endpoints; use ℚ directly.','structure')
lucas=base('mathlib:lucas_primality','Mathlib/NumberTheory/LucasPrimality.lean','Lucas criterion in ZMod n with a full prime-divisor test for n−1.')
rev_lucas=base('mathlib:reverse_lucas_primality','Mathlib/NumberTheory/LucasPrimality.lean','Every prime admits a witness satisfying the full Lucas criterion.')
factors=base('mathlib:Nat.primeFactorsList','Mathlib/Data/Nat/Factors.lean','The executable sorted prime factor list, empty at 0 and 1.','def')
factor_prod=base('mathlib:Nat.prod_primeFactorsList','Mathlib/Data/Nat/Factors.lean','For n≠0 the product of the prime factor list is n.')
factor_prime=base('mathlib:Nat.prime_of_mem_primeFactorsList','Mathlib/Data/Nat/Factors.lean','Every member of the prime factor list is prime.')
reg_index=base('mathlib:NumberField.Units.regOfFamily_div_regulator','Mathlib/NumberTheory/NumberField/Units/Regulator.lean','The regulator ratio equals the index of the subgroup generated by the proposed units together with all torsion units. Infinite index is represented by zero.')
padic_trunc=base('mathlib:PadicInt.toZModPow','Mathlib/NumberTheory/Padics/RingHoms.lean','The ring homomorphism ℤ_p→ZMod(p^n), with underlying approximation function.','def')

for name in ['cn0','cn0_extra','cn1','cn1_extra','cn2','cn2_extra','cn3','cn3_extra','cn4','cn4_extra','finish_nodes']:
    p=S/(name+'.py')
    if p.exists():exec(compile(p.read_text(),str(p),'exec'))

sources=[]
names={'CL':('Formes automorphes et voisins de Kneser des réseaux de Niemeier','Gaëtan Chenevier and Jean Lannes','arXiv:1409.7616, French 461-page preprint'), 'PrattNotes':('Pratt’s primality proofs','Vašek Chvátal','Author lecture notes, 5 pages'), 'Thery':('Primality Tests and Prime Certificate','Laurent Théry','arXiv:2203.16341'), 'Platt':('Numerical computations concerning the GRH','David Platt','arXiv:1305.3087, 15-page preprint'), 'Shoup':('A Computational Introduction to Number Theory and Algebra','Victor Shoup','Version 2'), 'Arb':('Arb: efficient arbitrary-precision midpoint-radius interval arithmetic','Fredrik Johansson','arXiv:1611.02831v1'), 'NumberRings':('The arithmetic of number rings','Peter Stevenhagen','MSRI 44 (2008), pp.209–266'), 'Stein':('Modular Forms: A Computational Approach','William Stein','Author PDF'), 'GMN':('Newton polygons of higher order in algebraic number theory','Jordi Guàrdia, Jesús Montes, Enric Nart','arXiv:0807.2620v2'), 'CarusoPublished':('Computations with p-adic numbers','Xavier Caruso','Les cours du CIRM 5 (2017), no.1, II'), 'CT':('Discrete series multiplicities for classical groups over Z and level 1 algebraic cusp forms','Gaëtan Chenevier, Olivier Taïbi','Publ. Math. IHÉS 131 (2020), 261–323'), 'BCG':('Cuspidal cohomology classes for GL_n(Z)','George Boxer, Frank Calegari, Toby Gee','JAMS 38 (2025), 509–520'), 'BennettSiksek':('A conjecture of Erdős, supersingular primes and short character sums','Michael Bennett, Samir Siksek','Annals of Mathematics 191 (2020), 355–392')}
for r in json.loads((S/'PublicSources.json').read_text()):
    if r['name'] in names:
        title,authors,edition=names[r['name']]
        sources.append(dict(id=r['name'],title=title,authors=authors,edition=edition,url=r['url'],sha256=r['sha256'],accessed='2026-10-04',readSections=['See the page-level ReadingProgress evidence; node citations identify the passages used.'],acquisition=r['acquisition']))
p=dict(roadmapId=RID,protocol='blueprint-v1',part=None,scope=[f'{RID}:CN.{i}'for i in range(6)],status='partial',summary='Certified computational number theory extends exact library carriers with independently checked finite certificates, source-scoped algorithm guarantees and validated enclosures. This pass separates discovery from verification, conditional running times from unconditional certificate soundness, and numerical inequalities from exact identities. It imports the finite-field algorithms, intrinsic number-field theory, normal forms and geometric constructions from their owners.',baseline=dict(tauceti='f790474821cf4256814db967cb154e7af3d0c369',mathlib='082e2d37e8b0463410cdb532e111cd43d5a66174',declarations=BASE),sources=sources,nodes=N,requests=REQUESTS,gaps=GAPS,coverage=[dict(stageId=f'{RID}:CN.{i}',status='partial',remaining=['Finish the target inventory and source-to-signature closure for this stage.'])for i in range(5)]+[dict(stageId=f'{RID}:CN.5',status='partial',remaining=['Approval of the process-layer removal and retargeting of accepted supplier links.'],note='AUDIT-17 classifies this as process. It receives no mathematical nodes. Concrete checking mathematics belongs to CN.0–CN.4; existing accepted CN.5 supplier links remain in force until the removal proposal is approved.')],restructure=[dict(action='rescope',roadmaps=[RID],detail='AUDIT-17 identifies CN.5 as reproducibility process, not mathematics.',proposal='Remove CN.5 as a mathematical layer, retain reproducibility requirements in every certificate handoff, and relocate concrete CT numerical and finite-enumeration checking targets to CN.4. Preserve accepted RS-03 outgoing CN.5 links until the maintainer approves their retargeting.')])
for f,key in [('SourceIssues.json','sourceIssues'),('SourceVersions.json','sourceVersions'),('TargetInventory.json','targetInventory')]:
    if (S/f).exists():p[key]=json.loads((S/f).read_text())
exec(compile((S/'finalize.py').read_text(),str(S/'finalize.py'),'exec'))
readpages=json.loads((S/'ReadingProgress.json').read_text())['publicSourcesPages']
for a in p['sources']:
    z=readpages.get(a['id'],'Node-level passages specified; scope recorded in ReadingProgress.')
    a['readSections']=['PDF pages '+', '.join(map(str,z)) if isinstance(z,list) else z]
raw=json.dumps(p,ensure_ascii=False,indent=2)+'\n';json.loads(raw);(S/'Candidate.json').write_text(raw);(W/f'research/blueprint/packets/{RID}.json').write_text(raw)
header='''/-
This file is not the roadmap and is not exhaustive. The roadmap document is definitive.
These signatures suggest names and Lean forms so contributors and reviewers can converge.
All proofs are admitted planning prototypes; no formalisation is claimed.
-/
import Mathlib.NumberTheory.ModularForms.LFunction
import Mathlib.RingTheory.AdjoinRoot
import Mathlib.NumberTheory.LSeries.DirichletContinuation
import Mathlib.NumberTheory.NumberField.ClassNumber
import Mathlib.FieldTheory.IsAlgClosed.AlgebraicClosure
import Mathlib.Analysis.SpecialFunctions.Gamma.Digamma
import Mathlib.FieldTheory.AlgebraicClosure
import Mathlib.Algebra.Order.Interval.Basic
import Mathlib.Data.Nat.Factors
import Mathlib.NumberTheory.LucasPrimality
import Mathlib.NumberTheory.CarmichaelNumber
import Mathlib.NumberTheory.Padics.RingHoms
import Mathlib.NumberTheory.Padics.Hensel
import Mathlib.NumberTheory.NumberField.Units.Regulator
import Mathlib.Algebra.Polynomial.Eval.Defs
import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.Data.Nat.Factorization.Basic
import Mathlib.NumberTheory.ModularForms.LevelOne.DimensionFormula

noncomputable section
namespace TauCeti.Computational
open scoped BigOperators
open Polynomial Module

'''
lean=(header+''.join(CODE)+'\nend TauCeti.Computational\n').replace('≤',' ≤ ').replace('<',' < ');lean='\n'.join(line.rstrip()for line in lean.splitlines()).rstrip()+'\n';(S/'Suggested.lean').write_text(lean);(W/f'research/blueprint/suggested/{RID}.lean').write_text(lean)
reader='# Certified computational number theory and arithmetic data\n\n'+p['summary']+'\n\nThis document is a plan against the recorded library pins. This breadth-first pass is complete under Protocol 0: all six stages are planned and all nine routed items are mapped, with the explicit refinements below. No stage is closed and every declaration is unchecked. The sources and proof obligations below distinguish mathematical assumptions from data a checker must verify.\n\n'
for i in range(6):
    reader+=f'## CN.{i}\n\n'
    if i==5:reader+=p['coverage'][-1]['note']+'\n\n'
    for n in N:
        if n['parentStageId']!=f'{RID}:CN.{i}':continue
        reader+='### '+n['title']+'\n\n**'+n['id']+'**. Proposed declaration: '+n['library']['declaration']+'.\n\n'+n['statement']+'\n\n'
        if n['hypotheses']:reader+='Hypotheses: '+' '.join(n['hypotheses'])+'\n\n'
        reader+='Construction or proof: '+' '.join(n['proofSteps'])+'\n\nPrerequisites: '+', '.join(n['prerequisites'])+'.\n\n'
        for a in n.get('api',[]):reader+='- **'+a['name']+'** ('+a['role']+'): '+a['statement']+'\n'
        reader+='\n'
        for a in n.get('tests',[]):reader+='- Test **'+a['name']+'** ('+a['kind']+'): '+a['statement']+'\n'
        reader+='\nAcceptance: '+' '.join(n['acceptance'])+'\n\nSources: '+'; '.join(a['sourceId']+', '+a['locator']for a in n['sources'])+'.\n\n'
reader+='## Target coverage and ownership\n\n'+p['completionReason']+'\n\n'
for t in p['targetInventory']:
    reader+='- **'+t['stageId']+': '+t['target']+'** — '+', '.join(t['nodes']+t['imports'])+'. '+t['note']+'\n'
reader+='\n'
for t in p['importedTargets']:
    reader+='**'+t['target']+'**. '+t['detail']+' Suppliers: '+', '.join(t['providers'])+'.\n\n'
reader+='## Routed source targets\n\n'
for t in p['sourceRouting']:reader+='- '+t['id']+' → '+', '.join(t['nodes'])+'. '+t['note']+'\n'
reader+='\n## Requested supplier contracts\n\n'
for t in REQUESTS:reader+='- **'+t['supplier']+'**: '+t['need']+' Consumers: '+', '.join(t['neededBy'])+'.\n'
reader+='\n## Open mathematical inputs\n\n'
for g in GAPS:reader+='- **'+g['title']+'**: '+g['detail']+'\n'
reader+='\n## Native baseline\n\n'
for b in BASE:reader+='- **'+b['ref']+'** ('+b['module']+'): '+b['provides']+'\n'
reader+='\n## Source versions and reading\n\n'
for a in p['sources']:reader+='- **'+a['id']+'**: '+a['authors']+', '+a['title']+', '+a['edition']+'. '+a['url']+'. SHA-256 '+a['sha256']+'. Read: '+'; '.join(a['readSections'])+'.\n'
reader+='\n## Source corrections\n\n'
for a in p.get('sourceIssues',[]):reader+='**'+a['id']+'** ('+a['source']+', '+a['locator']+'). '+a['correction']+' '+a['reason']+' Status: '+a['known']+' Search: '+' '.join(a['searched'])+'\n\n'
reader+='## Upstream and structural notes\n\n'
for a in p['upstreamNotes']:reader+='- **'+a['where']+'**: '+a['note']+'\n'
reader+='\nEvery numerical example remains a theorem target. Exact coefficient replays, compiler results and archive recovery evidence are reported in the handoff; none proves an admitted Lean statement.\n'
reader='\n'.join(line.rstrip()for line in reader.splitlines()).rstrip()+'\n'
(S/'Reader.md').write_text(reader);(W/f'research/blueprint/readmes/{RID}.md').write_text(reader)
print(json.dumps(dict(nodes=len(N),byKind=dict(collections.Counter(n['kind']for n in N)),API=sum(len(n.get('api',[]))for n in N),tests=sum(len(n.get('tests',[]))for n in N),gaps=len(GAPS),requests=len(REQUESTS))))
```

## Script: cn0.py

```python
ramSource=[src('Shoup','§3.2, printed pp.53–55','random access machine','Exact instruction model, with explicit failure for undefined addresses or division by zero.')]
instr=add(0,'ram-instruction','RAM instruction','definition',
'RAMInstruction has arithmetic, branch and halt constructors. An operand is either an integer literal or a pair (indirect,address), with address in ℕ. A destination is such a pair, without the literal alternative. Arithmetic operations are indexed 0,1,2,3 for addition, subtraction, multiplication and floor division. Branch comparisons are indexed 0,…,5 for equality, inequality, less, greater, less-or-equal and greater-or-equal. Programs are finite lists of instructions.',
['Use an inductive instruction type, existing sum and product types for operands and destinations, and finite indices for the operation tables.'],[],ramSource,
('TauCeti.Computational.RAMInstruction','''inductive RAMInstruction where
 | arithmetic (op : Fin 4) (dst : Bool × ℕ) (a b : ℤ ⊕ (Bool × ℕ))
 | branch (cmp : Fin 6) (a b : ℤ ⊕ (Bool × ℕ)) (target : ℕ)
 | halt
 deriving DecidableEq'''),
api=[('TauCeti.Computational.ramInstruction_halt_ne_arithmetic','characterisation','Halt and arithmetic instructions are distinct.','theorem ramInstruction_halt_ne_arithmetic (op : Fin 4) (dst : Bool × ℕ) (a b : ℤ ⊕ (Bool × ℕ)) : RAMInstruction.halt ≠ .arithmetic op dst a b := by sorry'),
('TauCeti.Computational.ramInstruction_branch_injective','extensionality','Branch instructions with a common comparison and operands agree precisely when their targets agree.','theorem ramInstruction_branch_injective (cmp : Fin 6) (a b : ℤ ⊕ (Bool × ℕ)) (i j : ℕ) : RAMInstruction.branch cmp a b i = .branch cmp a b j ↔ i=j := by sorry'),
('TauCeti.Computational.ramInstruction_arithmetic_injective','extensionality','Arithmetic instructions with common destinations and operands agree precisely when their operations agree.','theorem ramInstruction_arithmetic_injective (op oq : Fin 4) (dst : Bool × ℕ) (a b : ℤ ⊕ (Bool × ℕ)) : RAMInstruction.arithmetic op dst a b = .arithmetic oq dst a b ↔ op=oq := by sorry')],
tests=[('TauCeti.Computational.test_ram_halt','degenerate','The one-instruction halt program has length one.','example : ([RAMInstruction.halt]).length = 1 := by sorry'),
('TauCeti.Computational.test_ram_assignment','computation','The literal assignment 2+3 to cell 0 is a well-formed arithmetic instruction.','example : ∃ i : RAMInstruction, i = .arithmetic 0 (false,0) (.inl 2) (.inl 3) := by sorry'),
('TauCeti.Computational.test_ram_branch_distinct','non-example','Changing a branch target changes its syntax.','example : RAMInstruction.branch 0 (.inl 1) (.inl 1) 0 ≠ .branch 0 (.inl 1) (.inl 1) 1 := by sorry')],uses=[('Shoup §3.2','Fixes the meaning of one machine instruction in running-time claims.'),('CN.1 AKS analysis','Supplies the declared computation model.')])

read=add(0,'ram-operand-evaluation','RAM operand evaluation','construction',
'ramRead m evaluates an integer literal as itself, a direct operand (false,i) as m(i), and an indirect operand (true,i) as m(m(i)) when m(i)≥0. A negative indirect address returns none. Memory m is the exact existing function type ℕ→ℤ.',
['Inspect the operand tag. Check nonnegativity before converting an indirect address from ℤ to ℕ.'],[instr],ramSource,
('TauCeti.Computational.ramRead','''def ramRead (m : ℕ → ℤ) : (ℤ ⊕ (Bool × ℕ)) → Option ℤ
 | .inl z => some z
 | .inr (false,i) => some (m i)
 | .inr (true,i) => if 0≤m i then some (m (m i).toNat) else none'''),
api=[('TauCeti.Computational.ramRead_literal','simp','Literals evaluate to themselves.','theorem ramRead_literal (m : ℕ → ℤ) (z : ℤ) : ramRead m (.inl z)=some z := by sorry'),
('TauCeti.Computational.ramRead_direct','simp','Direct addressing reads the selected cell.','theorem ramRead_direct (m : ℕ → ℤ) (i : ℕ) : ramRead m (.inr (false,i))=some (m i) := by sorry'),
('TauCeti.Computational.ramRead_indirect','characterisation','Indirect evaluation succeeds exactly at nonnegative stored addresses.','theorem ramRead_indirect (m : ℕ → ℤ) (i : ℕ) : ramRead m (.inr (true,i)) = if 0≤m i then some (m (m i).toNat) else none := by sorry')],
tests=[('TauCeti.Computational.test_ram_literal_negative','computation','Negative literal values are allowed.','example : ramRead (fun _ => 0) (.inl (-3))=some (-3) := by sorry'),
('TauCeti.Computational.test_ram_zero_memory','degenerate','Indirect cell 0 in zero memory reads zero.','example : ramRead (fun _ => 0) (.inr (true,0))=some 0 := by sorry'),
('TauCeti.Computational.test_ram_negative_address','non-example','A negative stored address is rejected, rather than truncated to zero.','example : ramRead (fun _ => -1) (.inr (true,0))=none := by sorry')],uses=[('Shoup §3.2','Defines direct and indirect addressing used in every step.')])

step=add(0,'ram-step','Partial RAM transition','construction',
'ramStep P (pc,m) returns an error if pc is outside P, an operand or destination has a negative indirect address, or a floor-division denominator is zero. Halt returns a successful none. A successful arithmetic step writes its result to the resolved destination and increments pc; a branch preserves memory and jumps to its target exactly when its comparison holds, otherwise increments pc. Floor division is floor of the rational quotient, including negative denominators.',
['Resolve the instruction and operands with ramRead. For arithmetic, resolve the destination using the old memory, evaluate the indexed operation, and update exactly one cell. For branch, evaluate the indexed comparison. Errors remain distinct from normal halt.'],[instr,read],ramSource,
('TauCeti.Computational.ramStep','def ramStep (P : List RAMInstruction) (c : ℕ × (ℕ → ℤ)) : Except String (Option (ℕ × (ℕ → ℤ))) := by sorry'),
api=[('TauCeti.Computational.ramStep_halt','simp','Executing a halt instruction terminates successfully.','theorem ramStep_halt (P : List RAMInstruction) (pc : ℕ) (m : ℕ → ℤ) (h : P[pc]?=some .halt) : ramStep P (pc,m)=.ok none := by sorry'),
('TauCeti.Computational.ramStep_empty','simp','An empty program fails at every counter.','theorem ramStep_empty (pc : ℕ) (m : ℕ → ℤ) : ∃ e, ramStep [] (pc,m)=.error e := by sorry'),
('TauCeti.Computational.ramStep_deterministic','characterisation','The partial semantics has a unique result at each configuration.','theorem ramStep_deterministic (P : List RAMInstruction) (c : ℕ × (ℕ → ℤ)) (a b : Except String (Option (ℕ × (ℕ → ℤ)))) (ha : ramStep P c=a) (hb : ramStep P c=b) : a=b := by sorry')],
tests=[('TauCeti.Computational.test_ram_add','computation','Literal 2+3 writes 5 to cell 0.','example : ramStep [.arithmetic 0 (false,0) (.inl 2) (.inl 3)] (0,fun _ => 0) = .ok (some (1,Function.update (fun _ => 0) 0 5)) := by sorry'),
('TauCeti.Computational.test_ram_floor','non-example','Floor division 3/(−2) gives −2, not −1.','example : ramStep [.arithmetic 3 (false,0) (.inl 3) (.inl (-2))] (0,fun _ => 0) = .ok (some (1,Function.update (fun _ => 0) 0 (-2))) := by sorry'),
('TauCeti.Computational.test_ram_halts','degenerate','Halt is a successful termination rather than an error.','example : ramStep [.halt] (0,fun _ => 0)=.ok none := by sorry')],uses=[('CN.0 costed traces','Fixes the exact transitions being counted.'),('Shoup §3.2','Makes the high-level RAM model precise.')])

trace=add(0,'ram-machine-model-and-bit-complexity','Finite RAM execution','definition',
'A RAMExecution P is a nonempty list of configurations (pc,m) beginning at counter zero. Each adjacent pair c,d satisfies ramStep P c=ok(some d); the final configuration satisfies ramStep P c=ok none. Its instruction count is the list length, including the final halt. The input-size and memory-magnitude bounds are separate obligations, not part of the raw execution type. This refines the retained legacy model node.',
['Store a positive length T and configurations indexed by Fin T. Require counter zero initially, the transition equations for successive indices, and final halt.'],[step],ramSource,
('TauCeti.Computational.RAMExecution','''structure RAMExecution (P : List RAMInstruction) where
 length : ℕ
 positive : 0<length
 config : Fin length → ℕ × (ℕ → ℤ)
 initial : (config ⟨0,positive⟩).1=0
 transition : ∀ (i : ℕ) (h : i+1<length), ramStep P (config ⟨i,by sorry⟩) = .ok (some (config ⟨i+1,h⟩))
 halts : ramStep P (config ⟨length-1,by sorry⟩) = .ok none'''),
api=[('TauCeti.Computational.RAMExecution.instructionCount_pos','projection','Every successful execution has at least its final halt instruction.','theorem RAMExecution.instructionCount_pos {P : List RAMInstruction} (e : RAMExecution P) : 0<e.length := by sorry'),
('TauCeti.Computational.RAMExecution.first_pc','simp','The first counter is zero.','theorem RAMExecution.first_pc {P : List RAMInstruction} (e : RAMExecution P) : (e.config ⟨0,e.positive⟩).1=0 := by sorry'),
('TauCeti.Computational.RAMExecution.final_halts','characterisation','The final configuration halts successfully.','theorem RAMExecution.final_halts {P : List RAMInstruction} (e : RAMExecution P) : ramStep P (e.config ⟨e.length-1,by sorry⟩)=.ok none := by sorry')],
tests=[('TauCeti.Computational.test_ram_execution_halt','computation','The halt-only program has an execution of length one.','example : ∃ e : RAMExecution [.halt], e.length=1 := by sorry'),
('TauCeti.Computational.test_ram_execution_empty','degenerate','The empty program has no successful execution.','example : IsEmpty (RAMExecution []) := by sorry'),
('TauCeti.Computational.test_ram_execution_loop','non-example','An unconditional self-jump has no finite successful execution.','example : IsEmpty (RAMExecution [.branch 0 (.inl 0) (.inl 0) 0]) := by sorry')],uses=[('Shoup §§3.2,3.6','Separates instruction counts from bit-operation simulation costs.'),('CN.1 algorithm analysis','Provides the finite traces whose length is bounded.')],planet='Random access machine')

cost=add(0,'costed-ram-trace','Cost of a RAM execution','definition',
'Given a successful execution e and an explicit nonnegative natural cost C(pc,m) for simulating each instruction in bits, bitCost C e is the sum of C over all executed configurations. The model accepts no default equality between this sum and the unit-cost instruction count.',
['Sum the supplied cost over Fin e.length. The cost function must include address, operand and arithmetic costs of the chosen bit implementation.'],[trace],[src('Shoup','§3.6, printed p.72','model of computation','Unit-cost RAM arithmetic and bit/circuit costs are distinct.')],
('TauCeti.Computational.bitCost','def bitCost {P : List RAMInstruction} (C : (ℕ × (ℕ → ℤ)) → ℕ) (e : RAMExecution P) : ℕ := ∑ i, C (e.config i)'),
api=[('TauCeti.Computational.bitCost_one','compatibility','The constant unit charge recovers the instruction count.','theorem bitCost_one {P : List RAMInstruction} (e : RAMExecution P) : bitCost (fun _ => 1) e=e.length := by sorry'),
('TauCeti.Computational.bitCost_add','relation','Costs add pointwise.','theorem bitCost_add {P : List RAMInstruction} (C D : (ℕ × (ℕ → ℤ)) → ℕ) (e : RAMExecution P) : bitCost (fun c => C c+D c) e=bitCost C e+bitCost D e := by sorry'),
('TauCeti.Computational.bitCost_mono','functoriality','Pointwise larger instruction charges give a larger total.','theorem bitCost_mono {P : List RAMInstruction} (C D : (ℕ × (ℕ → ℤ)) → ℕ) (e : RAMExecution P) (h : ∀ c, C c≤D c) : bitCost C e≤bitCost D e := by sorry')],
tests=[('TauCeti.Computational.test_bitCost_zero','degenerate','Zero charge gives total zero.','example {P : List RAMInstruction} (e : RAMExecution P) : bitCost (fun _ => 0) e=0 := by sorry'),
('TauCeti.Computational.test_bitCost_two','computation','Constant charge two gives twice the execution length.','example {P : List RAMInstruction} (e : RAMExecution P) : bitCost (fun _ => 2) e=2*e.length := by sorry'),
('TauCeti.Computational.test_bitCost_not_unit','non-example','Constant charge two is strictly greater than the unit count for every successful execution.','example {P : List RAMInstruction} (e : RAMExecution P) : e.length<bitCost (fun _ => 2) e := by sorry')],uses=[('RT-AREA-computational/7','Prevents the false constant-factor identification of RAM and bit complexity.'),('CN.1 verification bounds','Charges modular arithmetic according to its actual operand widths.')])

add(0,'costed-trace-upper-bound','Bounded instruction costs give a total bound','lemma',
'If every executed configuration in e has bit-simulation charge at most B, then bitCost C e≤e.length·B. Instantiating B by a proved function of the largest address and operand width is necessary before transferring a RAM running-time estimate to bit complexity.',
['Compare each summand with B and evaluate the finite constant sum.'],[cost],[src('Shoup','§§3.2,3.6, pp.55,72','model of computation','A quantitative transfer with an explicit per-instruction bound, without a constant-factor claim.')],
('TauCeti.Computational.bitCost_le','theorem bitCost_le {P : List RAMInstruction} (C : (ℕ × (ℕ → ℤ)) → ℕ) (e : RAMExecution P) (B : ℕ) (h : ∀ i, C (e.config i)≤B) : bitCost C e≤e.length*B := by sorry'),acceptance=['A bound growing with operand width remains visible in B.'])

gap('Exact presentation and model refinements','Add real/complex algebraic-root presentations and their comparison operations, the p-adic finite-precision representation, precise imports of CA.3 ideal/lattice normal forms and FF.0 finite-field presentations. State Shoup’s polynomial memory-magnitude restriction and the exact big-integer verification charges before claiming concrete bit bounds.',[f'{RID}:CN.0'])
```

## Script: cn0_extra.py

```python
alg=base('mathlib:algebraicClosure','Mathlib/FieldTheory/AlgebraicClosure.lean','The relative algebraic closure as a native intermediate field; use algebraicClosure ℚ ℂ as the exact complex algebraic-number carrier.','def')
algmem=base('mathlib:mem_algebraicClosure_iff','Mathlib/FieldTheory/AlgebraicClosure.lean','Membership is existence of a nonzero rational polynomial annihilating the element.')
valrat=base('mathlib:padicValRat','Mathlib/NumberTheory/Padics/PadicVal/Basic.lean','Rational p-adic valuation; its value at zero is the library default zero, so precision routines must branch at zero.','def')
formal=[src('Arb','§§5–5.3, pp.7–8','set inclusions','The presentation and decoding below are formalization designs: exact root identity is separate from an enclosing rectangle. This source motivates enclosures, not a proved algebraic root-isolation algorithm.')]
root=add(0,'algebraic-root-certificate','Isolated algebraic root certificate','definition',
'An AlgebraicRootCertificate stores a nonzero polynomial f∈ℚ[X], two closed rational intervals R,I, and a proof that exactly one complex z satisfies f(z)=0 and Re(z)∈R, Im(z)∈I. Repeated polynomial roots are permitted: uniqueness concerns distinct roots, not their multiplicities. The exact carrier is the native relative algebraic closure of ℚ in ℂ; the finite polynomial and rectangle are presentation data, not a replacement field. The uniqueness proof is a separate checked obligation, not inferred from small diameter.',
['Use native Polynomial and NonemptyInterval for finite data. Define the root-and-rectangle predicate explicitly and require unique existence. The certificate is a semantic specification; a terminating finite verifier needs a root-count certificate, recorded as a gap.'],[alg,algmem,interval],formal,
('TauCeti.Computational.AlgebraicRootCertificate','''structure AlgebraicRootCertificate where
 polynomial : Polynomial ℚ
 nonzero : polynomial ≠ 0
 re : NonemptyInterval ℚ
 im : NonemptyInterval ℚ
 isolates : ∃! z : ℂ, aeval z polynomial=0 ∧ (re.fst:ℝ)≤z.re ∧ z.re≤re.snd ∧ (im.fst:ℝ)≤z.im ∧ z.im≤im.snd'''),
api=[('TauCeti.Computational.AlgebraicRootCertificate.value','projection','Decode the unique root as a native complex algebraic number.','def AlgebraicRootCertificate.value (c : AlgebraicRootCertificate) : algebraicClosure ℚ ℂ := by sorry'),
('TauCeti.Computational.AlgebraicRootCertificate.value_spec','characterisation','The decoded value is a root lying in both displayed intervals.','''theorem AlgebraicRootCertificate.value_spec (c : AlgebraicRootCertificate) :
 aeval (c.value:ℂ) c.polynomial=0 ∧ (c.re.fst:ℝ)≤(c.value:ℂ).re ∧ (c.value:ℂ).re≤c.re.snd ∧ (c.im.fst:ℝ)≤(c.value:ℂ).im ∧ (c.value:ℂ).im≤c.im.snd := by sorry'''),
('TauCeti.Computational.AlgebraicRootCertificate.value_unique','extensionality','Any root in the rectangle equals the decoded value.','''theorem AlgebraicRootCertificate.value_unique (c : AlgebraicRootCertificate) (z : ℂ)
 (h : aeval z c.polynomial=0 ∧ (c.re.fst:ℝ)≤z.re ∧ z.re≤c.re.snd ∧ (c.im.fst:ℝ)≤z.im ∧ z.im≤c.im.snd) : z=c.value := by sorry''')],
tests=[('TauCeti.Computational.test_algebraic_zero','degenerate','X with both intervals [0,0] isolates zero.','example : ∃ c : AlgebraicRootCertificate, c.polynomial=X ∧ (c.value:ℂ)=0 := by sorry'),
('TauCeti.Computational.test_algebraic_repeated','computation','X² with the singleton zero rectangle is allowed.','example : ∃ c : AlgebraicRootCertificate, c.polynomial=X^2 ∧ (c.value:ℂ)=0 := by sorry'),
('TauCeti.Computational.test_algebraic_ambiguous','non-example','X²−1 cannot isolate a unique root in [−2,2]×[0,0].','example : ¬ ∃! z : ℂ, aeval z (X^2-1:Polynomial ℚ)=0 ∧ (-2:ℝ)≤z.re ∧ z.re≤2 ∧ z.im=0 := by sorry')],uses=[('EffectiveDiophantineMethods:ED.0','Exact algebraic inputs with certified embeddings.'),('ArithmeticDynamics:DY.3','Distinguish conjugate roots with the same polynomial.')],planet='Algebraic root certificate')
ratroot=add(0,'rational-root-presentation','Exact rational root presentation','construction',
'For r∈ℚ, rationalRootCertificate r consists of X−r, the singleton real interval [r,r] and singleton imaginary interval [0,0]. Its decoded value is the native embedding of r into the complex algebraic numbers. Integers and rationals themselves use native ℤ and normalized ℚ; no new arithmetic carrier is introduced.',
['The linear polynomial has exactly the root r. The rational casts commute with addition and multiplication by the existing field homomorphism laws.'],[root],formal,
('TauCeti.Computational.rationalRootCertificate','def rationalRootCertificate (r : ℚ) : AlgebraicRootCertificate := by sorry'),
api=[('TauCeti.Computational.rationalRootCertificate_value','compatibility','Decoding is the rational algebra map.','theorem rationalRootCertificate_value (r : ℚ) : ((rationalRootCertificate r).value:ℂ)=(r:ℂ) := by sorry'),
('TauCeti.Computational.rationalRootCertificate_add','compatibility','Rational addition commutes with decoding.','theorem rationalRootCertificate_add (r s : ℚ) : (rationalRootCertificate (r+s)).value=(rationalRootCertificate r).value+(rationalRootCertificate s).value := by sorry'),
('TauCeti.Computational.rationalRootCertificate_mul','compatibility','Rational multiplication commutes with decoding.','theorem rationalRootCertificate_mul (r s : ℚ) : (rationalRootCertificate (r*s)).value=(rationalRootCertificate r).value*(rationalRootCertificate s).value := by sorry')],
tests=[('TauCeti.Computational.test_rational_zero','degenerate','Zero decodes to zero.','example : (rationalRootCertificate 0).value=0 := by sorry'),
('TauCeti.Computational.test_rational_half','computation','One half plus one third decodes as five sixths.','example : (rationalRootCertificate (1/2)).value+(rationalRootCertificate (1/3)).value=(rationalRootCertificate (5/6)).value := by sorry'),
('TauCeti.Computational.test_rational_distinct','non-example','One half and one third have different decoded values.','example : (rationalRootCertificate (1/2)).value≠(rationalRootCertificate (1/3)).value := by sorry')],uses=[('CN.0 input conversions','Supplies the base rational and integer inputs for algebraic computations.')])
for slug,title,op,expr,pre in [('algebraic-add-certificate','Addition of isolated algebraic numbers','add','a.value+b.value',''),('algebraic-mul-certificate','Multiplication of isolated algebraic numbers','mul','a.value*b.value',''),('algebraic-inv-certificate','Inversion of a nonzero algebraic number','inv','a.value⁻¹',' (ha : a.value≠0)')]:
 args='(a b : AlgebraicRootCertificate)' if op!='inv' else '(a : AlgebraicRootCertificate)'+pre
 add(0,slug,title,'theorem',
 'Given isolated algebraic inputs '+('a,b' if op!='inv' else 'a with nonzero decoded value')+', there exists an isolated-root certificate whose value is their '+{'add':'sum','mul':'product','inv':'inverse'}[op]+'. An effective implementation must construct an annihilating polynomial, isolate its relevant distinct root and prove this value equation. The theorem specifies the exact operation; no running time or implemented checker is asserted.',
 ['Closure of the native algebraic-number field gives an annihilating rational polynomial. Its finite distinct root set allows a rational rectangle isolating the desired root. Effective elimination and root-count witnesses remain explicit refinements.'],[root,alg],formal,
 ('TauCeti.Computational.algebraic_'+op+'_certificate',f'theorem algebraic_{op}_certificate {args} : ∃ c : AlgebraicRootCertificate, c.value={expr} := by sorry'),acceptance=['The decoded equality distinguishes different embeddings of the same abstract field. The inverse contract rejects zero.'])
gap('Effective algebraic root verification and arithmetic','Split finite rational rectangle root-count certificates, root separation, resultant elimination and refinement into exact declarations with a freely readable source and terminating algorithms. Current existence targets and semantic isolation data do not establish a computable equality test or arithmetic cost. Equality of overlapping boxes is not certified without a common-root argument.',[root,nid(0,'algebraic-add-certificate'),nid(0,'algebraic-mul-certificate'),nid(0,'algebraic-inv-certificate')])

ps=[src('CarusoPublished','§2.1.1, pp.17–19','floating-point','Finite precision is a coset; the zero-centered case and absolute precision are explicit.')]
pa=add(0,'padic-approximation','Canonical finite p-adic approximation','definition',
'For prime p, PadicApproximation p stores integers N,v and a natural mantissa s. It is either (N,N,0), or v<N with 0<s<p^(N−v) and p∤s. Its centre is p^v·s∈ℚ and its denotation is {x∈ℚ_p | ‖x−centre‖≤p^(−N)}. N is absolute precision and N−v is relative precision in the nonzero case. Zero mantissa means the entire ball p^Nℤ_p, not the exact number zero.',
 ['Store the two normalization alternatives. Use a rational centre and the native p-adic field/norm to define the closed ball. Prime p is a hypothesis of semantic theorems; syntax is parameterized by p.'],[valrat,padic_trunc],ps,
 ('TauCeti.Computational.PadicApproximation','''structure PadicApproximation (p : ℕ) where
 precision : ℤ
 valuation : ℤ
 mantissa : ℕ
 canonical : (valuation=precision ∧ mantissa=0) ∨
   (valuation<precision ∧ 0<mantissa ∧ mantissa<p^((precision-valuation).toNat) ∧ ¬p∣mantissa)'''),
api=[('TauCeti.Computational.PadicApproximation.center','projection','The exact rational centre is p^v s.','def PadicApproximation.center {p : ℕ} (a : PadicApproximation p) : ℚ := (p:ℚ)^a.valuation*a.mantissa'),
('TauCeti.Computational.PadicApproximation.denotation','projection','The ball has radius p^(−N) in the native p-adic field.','def PadicApproximation.denotation {p : ℕ} [Fact p.Prime] (a : PadicApproximation p) : Set ℚ_[p] := {x | ‖x-(a.center:ℚ_[p])‖≤(p:ℝ)^(-a.precision)}'),
('TauCeti.Computational.PadicApproximation.center_mem','simp','The centre always belongs to its ball.','theorem PadicApproximation.center_mem {p : ℕ} [Fact p.Prime] (a : PadicApproximation p) : (a.center:ℚ_[p])∈a.denotation := by sorry'),
('TauCeti.Computational.PadicApproximation.zero_mem_iff','characterisation','Zero belongs precisely to the zero-mantissa ball.','theorem PadicApproximation.zero_mem_iff {p : ℕ} [Fact p.Prime] (a : PadicApproximation p) : (0:ℚ_[p])∈a.denotation ↔ a.mantissa=0 := by sorry')],
tests=[('TauCeti.Computational.test_padic_zero_ball','degenerate','The canonical zero ball at precision N has valuation N.','example (p : ℕ) (a : PadicApproximation p) (h : a.mantissa=0) : a.valuation=a.precision := by sorry'),
('TauCeti.Computational.test_padic_negative_precision','computation','The tuple (N,v,s)=(0,−1,1) is permitted at p=3 and has centre 1/3.','example : ∃ a : PadicApproximation 3, a.precision=0 ∧ a.valuation= -1 ∧ a.mantissa=1 ∧ a.center=1/3 := by sorry'),
('TauCeti.Computational.test_padic_nonunit_mantissa','non-example','A nonzero mantissa divisible by p cannot be canonical.','example (p : ℕ) [Fact p.Prime] (a : PadicApproximation p) (h : p∣a.mantissa) : a.mantissa=0 := by sorry')],uses=[('CN.4 p-adic arithmetic','Propagate absolute precision with zero-centred inputs handled separately.'),('EffectiveDiophantineMethods:ED.0','Attach an honest coset to each finite p-adic input.')],planet='Finite p-adic approximation')

mem=add(0,'ram-polynomial-magnitude','Polynomial magnitude bound for RAM memory','definition',
'PolynomialRAMMagnitude e n A b C means that every memory entry in every configuration of an execution e on n input cells has absolute value at most A·(n+e.length)^b+C. The parameters A,b,C are fixed independently of input in an algorithm-family theorem. This bounds stored integers, including indirect addresses; arbitrary large mathematical integers must be encoded as digit arrays.',
 ['Express the uniform integer magnitude inequality. A single-trace bound does not prove an algorithm family has fixed constants or that multiplying machine words has constant bit cost.'],[trace],[src('Shoup','§3.2, printed pp.54–55','bounded in absolute value','Retains the source’s magnitude condition separately from raw machine executions.')],
 ('TauCeti.Computational.PolynomialRAMMagnitude','def PolynomialRAMMagnitude {P : List RAMInstruction} (e : RAMExecution P) (n A b C : ℕ) : Prop := ∀ i j, ((e.config i).2 j).natAbs ≤ A*(n+e.length)^b+C'),
api=[('TauCeti.Computational.polynomialRAMMagnitude_iff','characterisation','The predicate is the uniform bound on all stored values.','theorem polynomialRAMMagnitude_iff {P : List RAMInstruction} (e : RAMExecution P) (n A b C : ℕ) : PolynomialRAMMagnitude e n A b C ↔ ∀ i j, ((e.config i).2 j).natAbs≤A*(n+e.length)^b+C := by sorry'),
('TauCeti.Computational.polynomialRAMMagnitude_mono_constant','functoriality','Increasing C preserves the bound.','theorem polynomialRAMMagnitude_mono_constant {P : List RAMInstruction} (e : RAMExecution P) (n A b C D : ℕ) (h : C≤D) : PolynomialRAMMagnitude e n A b C → PolynomialRAMMagnitude e n A b D := by sorry'),
('TauCeti.Computational.polynomialRAMMagnitude_mono_input','functoriality','Increasing the input-size allowance preserves the bound.','theorem polynomialRAMMagnitude_mono_input {P : List RAMInstruction} (e : RAMExecution P) (n m A b C : ℕ) (h : n≤m) : PolynomialRAMMagnitude e n A b C → PolynomialRAMMagnitude e m A b C := by sorry')],
tests=[('TauCeti.Computational.test_ram_zero_bound','degenerate','An execution with all-zero memories has zero magnitude bound.','example {P : List RAMInstruction} (e : RAMExecution P) (h : ∀ i j, (e.config i).2 j=0) : PolynomialRAMMagnitude e 0 0 0 0 := by sorry'),
('TauCeti.Computational.test_ram_magnitude_projection','computation','Every selected cell satisfies the bound.','example {P : List RAMInstruction} (e : RAMExecution P) (h : PolynomialRAMMagnitude e 1 2 3 4) (i : Fin e.length) : ((e.config i).2 0).natAbs≤2*(1+e.length)^3+4 := by sorry'),
('TauCeti.Computational.test_ram_nonzero_excluded','non-example','A nonzero cell contradicts the all-zero bound.','example {P : List RAMInstruction} (e : RAMExecution P) (i : Fin e.length) (j : ℕ) (h : (e.config i).2 j≠0) : ¬PolynomialRAMMagnitude e 0 0 0 0 := by sorry')],uses=[('CN.1 AKS cost theorem','States the machine-model precondition before claiming bit complexity.')])
```

## Script: cn1.py

```python
sh=lambda loc,match:src('Shoup',loc,'Miller–Rabin test',match)
lcsrc=[src('PrattNotes','pp.1–4, formal proof system and its length bound','formal proof system','Recursive-tree packaging of the same Lucas prime-divisor checks; n≥2 guards are explicit.') ]
cert=add(1,'pratt-certificate','Recursive Pratt certificate','definition',
'A PrattCertificate is either the leaf two or a node (n,a,children), where n and a are natural numbers and children is a finite list of Pratt certificates. Its value is 2 at the leaf and n at a node. Repeated children encode repeated prime factors of n−1. This raw syntax contains no unverified primality proof.',
['Define a finite inductive tree with the leaf and node constructors. Define value by pattern matching.'],[lucas,rev_lucas,factors],lcsrc,
('TauCeti.Computational.PrattCertificate', '''inductive PrattCertificate where
 | two : PrattCertificate
 | node (n a : ℕ) (children : List PrattCertificate) : PrattCertificate

def PrattCertificate.value : PrattCertificate → ℕ
 | .two => 2
 | .node n _ _ => n'''),
api=[('TauCeti.Computational.PrattCertificate.value_two','simp','The leaf has value 2.','theorem PrattCertificate.value_two : PrattCertificate.two.value = 2 := by sorry'),
('TauCeti.Computational.PrattCertificate.value_node','projection','A node stores its claimed value n.','theorem PrattCertificate.value_node (n a : ℕ) (cs : List PrattCertificate) : (PrattCertificate.node n a cs).value=n := by sorry'),
('TauCeti.Computational.PrattCertificate.node_injective','extensionality','Two nodes are equal precisely when all their raw data are equal.','theorem PrattCertificate.node_injective (n m a b : ℕ) (cs ds : List PrattCertificate) : PrattCertificate.node n a cs = .node m b ds ↔ n=m ∧ a=b ∧ cs=ds := by sorry')],
tests=[('TauCeti.Computational.test_pratt_leaf','degenerate','The base leaf represents 2.','example : PrattCertificate.two.value = 2 := by sorry'),
('TauCeti.Computational.test_pratt_three','computation','The candidate (3,2,[two]) represents 3.','example : (PrattCertificate.node 3 2 [.two]).value = 3 := by sorry'),
('TauCeti.Computational.test_pratt_untrusted','non-example','A malformed node may represent 1; existence of raw syntax is not primality.','example : (PrattCertificate.node 1 0 []).value = 1 := by sorry')],
uses=[('CN.1 factorization certificates','Each asserted prime carries independently checked recursive evidence.'),('Mathlib LucasPrimality TODO','Provides the finite syntax that the existing criterion lacks.')],planet='Pratt certificate')

check=add(1,'pratt-certificate-checker','Pratt certificate checker','construction',
'The checker accepts the leaf two. It accepts node(n,a,cs) iff n≥3, 0<a<n, every child checks, the product of child values is n−1, a^(n−1) mod n=1, and a^((n−1)/q) mod n≠1 for every child value q. Empty products are 1. The checker terminates by recursion on the finite tree.',
['Recursively check the children; use exact natural modular powers and products. No probable-prime predicate enters the checker.'],[cert,lucas],lcsrc,
('TauCeti.Computational.PrattCertificate.check','def PrattCertificate.check : PrattCertificate → Bool := by sorry'),
api=[('TauCeti.Computational.PrattCertificate.check_two','simp','The leaf is accepted.','theorem PrattCertificate.check_two : PrattCertificate.two.check=true := by sorry'),
('TauCeti.Computational.PrattCertificate.check_node_iff','characterisation','Acceptance is exactly the conjunction of recursive, product and modular conditions.','''theorem PrattCertificate.check_node_iff (n a : ℕ) (cs : List PrattCertificate) :
 (PrattCertificate.node n a cs).check=true ↔ 3≤n ∧ 0<a ∧ a<n ∧
 (∀ c∈cs, c.check=true) ∧ (cs.map PrattCertificate.value).prod=n-1 ∧
 a^(n-1)%n=1 ∧ ∀ c∈cs, a^((n-1)/c.value)%n≠1 := by sorry'''),
('TauCeti.Computational.PrattCertificate.check_value_ge_two','other','Acceptance excludes 0 and 1.','theorem PrattCertificate.check_value_ge_two (c : PrattCertificate) (h : c.check=true) : 2≤c.value := by sorry')],
tests=[('TauCeti.Computational.test_pratt_check_three','computation','Witness 2 with the factor 2 certifies 3.','example : (PrattCertificate.node 3 2 [.two]).check=true := by sorry'),
('TauCeti.Computational.test_pratt_check_one','degenerate','The malformed value-one node is rejected.','example : (PrattCertificate.node 1 0 []).check=false := by sorry'),
('TauCeti.Computational.test_pratt_check_nine','non-example','The candidate for 9 with three factors 2 and witness 2 is rejected.','example : (PrattCertificate.node 9 2 [.two,.two,.two]).check=false := by sorry')],uses=[('CN.1 primality outputs','Converts untrusted trees to a decidable acceptance result.')])

sound=add(1,'pratt-certificate-sound','Soundness of Pratt certificates','theorem',
'For every finite Pratt certificate c, c.check=true implies Nat.Prime(c.value).',
['Induct on the certificate tree. The children are prime by induction. Every prime divisor of the product n−1 occurs among the child values, so the checked modular inequalities supply all hypotheses of lucas_primality.'],[check,lucas,factor_prime],lcsrc,
('TauCeti.Computational.PrattCertificate.sound','theorem PrattCertificate.sound (c : PrattCertificate) (h : c.check=true) : Nat.Prime c.value := by sorry'),acceptance=['A tree asserting a composite value cannot pass even if its product identity is correct.'])

add(1,'pratt-certificate-complete','Completeness of Pratt certificates','theorem',
'Every prime n is the value of a Pratt certificate accepted by the checker.',
['Use strong induction on n, with leaf 2. For n≥3, reverse_lucas_primality supplies a Lucas witness; take its representative in 1,…,n−1. Factor n−1 using primeFactorsList. Every factor q≤n−1<n has a recursively accepted certificate.'],[check,rev_lucas,factors,factor_prod,factor_prime],lcsrc,
('TauCeti.Computational.PrattCertificate.complete','theorem PrattCertificate.complete (n : ℕ) (hn : Nat.Prime n) : ∃ c : PrattCertificate, c.value=n ∧ c.check=true := by sorry'),acceptance=['The completeness proof is mathematical existence; it supplies no polynomial bound for finding a factorization of n−1.'])

mr=add(1,'strong-liar','Strong Miller–Rabin liar','definition',
'For n,a∈ℕ write h=v₂(n−1) and t=(n−1)/2^h. StrongLiar n a means n>1 is odd, 0<a<n, and in ZMod n either a^t=1 or a^(t·2^j)=−1 for some j<h. The sample space is the nonzero residues 1,…,n−1; it is not restricted to units. Guards reject n=0,1 and all even n, which the primality wrapper handles separately.',
['Use the multiplicity of 2 in n−1 via Nat.factorization and exact exponentiation in ZMod n.'],[],[sh('§10.2, pp.308–310','The strong-liar set with the actual uniform sampling space.')],
('TauCeti.Computational.StrongLiar','''def StrongLiar (n a : ℕ) : Prop :=
 let h := (n-1).factorization 2
 let t := (n-1)/2^h
 1<n ∧ Odd n ∧ 0<a ∧ a<n ∧
 ((a:ZMod n)^t=1 ∨ ∃ j<h, (a:ZMod n)^(t*2^j) = -1)'''),
api=[('TauCeti.Computational.strongLiar_iff','characterisation','The defining modular alternatives use the odd part of n−1.','''theorem strongLiar_iff (n a : ℕ) : StrongLiar n a ↔
 1<n ∧ Odd n ∧ 0<a ∧ a<n ∧
 ((a:ZMod n)^((n-1)/2^((n-1).factorization 2))=1 ∨
 ∃ j<(n-1).factorization 2, (a:ZMod n)^(((n-1)/2^((n-1).factorization 2))*2^j) = -1) := by sorry'''),
('TauCeti.Computational.strongLiar_coprime','compatibility','A strong liar is coprime to n, although the sampling space contains nonunits.','theorem strongLiar_coprime {n a : ℕ} (h : StrongLiar n a) : Nat.Coprime a n := by sorry'),
('TauCeti.Computational.strongLiar_one','simp','The base 1 passes for every odd n>1.','theorem strongLiar_one (n : ℕ) (hn : 1<n) (ho : Odd n) : StrongLiar n 1 := by sorry')],
tests=[('TauCeti.Computational.test_strongLiar_prime','computation','Base 3 passes for 7.','example : StrongLiar 7 3 := by sorry'),
('TauCeti.Computational.test_strongLiar_one_input','degenerate','Input 1 is rejected.','example : ¬StrongLiar 1 0 := by sorry'),
('TauCeti.Computational.test_strongLiar_composite','non-example','2047 is composite but passes the strong base-2 test.','example : StrongLiar 2047 2 ∧ ¬Nat.Prime 2047 := by sorry')],uses=[('Shoup Theorem 10.3','Bounds the fraction of accepting bases for an odd composite.'),('CN.1 probabilistic outputs','Keeps a passing random test distinct from proved primality.')],planet='Strong liar')

add(1,'strong-liar-prime','Prime inputs pass every admissible base','theorem',
'If n is an odd prime and 0<a<n, then StrongLiar n a.',
['Fermat gives a^(n−1)=1. In the repeated-squaring chain in the field ZMod n, the predecessor of the first 1 is either absent (a^t=1) or is −1, since the only square roots of 1 are ±1.'],[mr],[sh('Theorem 10.2, pp.308–309','No false rejection for odd prime inputs.')],
('TauCeti.Computational.strongLiar_of_prime','theorem strongLiar_of_prime (n a : ℕ) (hp : Nat.Prime n) (ho : Odd n) (ha : 0<a) (han : a<n) : StrongLiar n a := by sorry'),acceptance=['The wrapper returns prime for n=2 without using the odd-input test.'])

bound=add(1,'miller-rabin-probabilistic-primality','Miller–Rabin strong-liar bound','theorem',
'For odd composite n>1, the number of bases a with 0<a<n and StrongLiar n a is at most (n−1)/4. Equivalently, four times this cardinality is at most n−1. This refines the legacy bundled node to its central declaration.',
['Split prime powers from numbers with at least two distinct prime factors. On prime powers use the cyclic-unit power-map kernel count; on at least two factors apply the CRT and the common 2-adic exponent to bound the two permitted fibres. The cyclic kernel, CRT fibre count, and Carmichael-at-least-three-primes steps remain explicit refinement obligations.'],[mr],[sh('Theorem 10.3, pp.309–312','Exact one-quarter bound; denominator n−1 rather than φ(n).')],
('TauCeti.Computational.strongLiar_card_le','''theorem strongLiar_card_le (n : ℕ) (hn : 1<n) (ho : Odd n) (hc : ¬Nat.Prime n) :
 4 * Nat.card {a : Fin n // StrongLiar n a.val} ≤ n-1 := by sorry'''),acceptance=['For n=9 there are two strong liars, so equality holds against (n−1)/4.'],planet='Miller–Rabin bound')
gap('Strong-liar counting lemmas','Split the cyclic prime-power kernel count, the CRT two-fibre estimate, and the deduction that a Carmichael number has at least three prime divisors from the native Korselt theorem. These are nonroutine named inputs in Shoup’s proof, not library claims.',[bound])

add(1,'miller-rabin-independent-rounds','Error bound for independent Miller–Rabin rounds','theorem',
'For odd composite n>1 and k∈ℕ, among all (n−1)^k equally likely tuples of bases in {1,…,n−1}, at most (n−1)^k/4^k tuples pass every strong test. Equivalently, 4^k times the number of accepting tuples is at most (n−1)^k. This counting formulation is the uniform independent product distribution; it makes no promise for correlated or adversarially chosen bases.',
['An accepting tuple is a function into the strong-liar subset, so its cardinality is the kth power of the one-round cardinality. Raise the one-round bound to k.'],[bound],[sh('§10.2 algorithm and Theorem 10.3, pp.309–312','Independent repetition gives error at most 4^(−k).')],
('TauCeti.Computational.millerRabin_rounds_bound','''theorem millerRabin_rounds_bound (n k : ℕ) (hn : 1<n) (ho : Odd n) (hc : ¬Nat.Prime n) :
 4^k * Nat.card {a : Fin k → Fin (n-1) // ∀ i, StrongLiar n ((a i).val+1)} ≤ (n-1)^k := by sorry'''),acceptance=['At k=0 the single empty tuple passes and the bound is 1. Repeating base 2 on 2047 is not independent uniform sampling.'])

aksSrc=lambda loc,match:src('Shoup',loc,'deterministic primality test',match)
ap=add(1,'aks-parameter','AKS order parameter','construction',
'For n>1, aksParameter n is the least r>1 such that gcd(n,r)>1 or gcd(n,r)=1 and the multiplicative order of n modulo r is greater than 4·len(n)², where len(n)=floor(log₂n)+1. Set aksParameter n=0 for n≤1. The choice is deterministic and finite because r=n is always admissible.',
['Search r=2,…,n in increasing order using exact gcd and modular-power computations. The candidate n terminates the search.'],[],[aksSrc('§21.2, pp.548–549','Uses Shoup’s exact parameter search, not a silently substituted AKS variant.')],
('TauCeti.Computational.aksParameter','def aksParameter (n : ℕ) : ℕ := by sorry'),
api=[('TauCeti.Computational.aksParameter_valid','characterisation','The output is between 2 and n and satisfies the exact order-or-gcd disjunction.','''theorem aksParameter_valid (n : ℕ) (hn : 1<n) :
 1<aksParameter n ∧ aksParameter n≤n ∧
 (1<Nat.gcd n (aksParameter n) ∨ Nat.Coprime n (aksParameter n) ∧
 4*(Nat.log2 n+1)^2 < orderOf (n:ZMod (aksParameter n))) := by sorry'''),
('TauCeti.Computational.aksParameter_minimal','other','No smaller r>1 satisfies the search criterion.','''theorem aksParameter_minimal (n r : ℕ) (hn : 1<n) (hr : 1<r) (h : r<aksParameter n) :
 Nat.gcd n r=1 ∧ orderOf (n:ZMod r)≤4*(Nat.log2 n+1)^2 := by sorry'''),
('TauCeti.Computational.aksParameter_small','simp','Inputs 0 and 1 use sentinel zero.','theorem aksParameter_small (n : ℕ) (h : n≤1) : aksParameter n=0 := by sorry')],
tests=[('TauCeti.Computational.test_aksParameter_two','computation','Input 2 has parameter 2.','example : aksParameter 2=2 := by sorry'),
('TauCeti.Computational.test_aksParameter_nine','computation','Input 9 has parameter 3, exposing a factor.','example : aksParameter 9=3 := by sorry'),
('TauCeti.Computational.test_aksParameter_one','degenerate','Input 1 uses zero and is rejected by the primality wrapper.','example : aksParameter 1=0 := by sorry')],uses=[('Shoup §21.2','The stopping parameter of the deterministic AKS test.')])

ident=add(1,'aks-polynomial-identities','AKS polynomial congruences','definition',
'AKSIdentities n r ℓ means that for each integer j with 1≤j≤ℓ, (X+j)^n and X^n+j have the same remainder on division by X^r−1 in (ZMod n)[X]. The definition is a finite family of decidable polynomial identities, separate from claims that the coefficient ring is a field.',
['Use Polynomial.modByMonic over the commutative ring ZMod n. The algorithm supplies r>1, so the modulus is monic of degree r.'],[],[aksSrc('§21.2, pp.548–549','The polynomial checks in the actual ring modulo n.')],
('TauCeti.Computational.AKSIdentities','''def AKSIdentities (n r ell : ℕ) : Prop := ∀ j : ℕ, 1≤j → j≤ell →
 ((X+C (j:ZMod n))^n) %ₘ (X^r-1) = (X^n+C (j:ZMod n)) %ₘ (X^r-1)'''),
api=[('TauCeti.Computational.aksIdentities_zero','simp','The empty check range holds.','theorem aksIdentities_zero (n r : ℕ) : AKSIdentities n r 0 := by sorry'),
('TauCeti.Computational.aksIdentities_mono','functoriality','Passing a larger check range implies passing a smaller one.','theorem aksIdentities_mono (n r ell m : ℕ) (h : m≤ell) : AKSIdentities n r ell → AKSIdentities n r m := by sorry'),
('TauCeti.Computational.aksIdentities_iff','characterisation','The predicate is exactly the finite remainder comparison.','''theorem aksIdentities_iff (n r ell : ℕ) : AKSIdentities n r ell ↔ ∀ j : ℕ, 1≤j → j≤ell →
 ((X+C (j:ZMod n))^n) %ₘ (X^r-1) = (X^n+C (j:ZMod n)) %ₘ (X^r-1) := by sorry''')],
tests=[('TauCeti.Computational.test_aksIdentities_prime','computation','The characteristic-5 identity passes at every r and every check range.','example (r ell : ℕ) : AKSIdentities 5 r ell := by sorry'),
('TauCeti.Computational.test_aksIdentities_vacuous','degenerate','With no bases, even input 9 passes the identity predicate.','example : AKSIdentities 9 3 0 := by sorry'),
('TauCeti.Computational.test_aksIdentities_not_prime','non-example','The empty identity test is not a primality criterion.','example : AKSIdentities 9 3 0 ∧ ¬Nat.Prime 9 := by sorry')],uses=[('Shoup Lemmas 21.6–21.11','Supplies the congruence hypotheses of the algebraic correctness proof.')])

alg=add(1,'aks-algorithm','Shoup’s AKS algorithm','construction',
'aks n rejects n≤1 and every perfect power a^b with a,b>1. For the remaining n let r=aksParameter n. Return true if r=n; reject if gcd(n,r)>1; otherwise return whether AKSIdentities n r (2·len(n)·floor(√r)+1) holds. This declaration fixes the variant before any complexity statement.',
['Decide perfect-power membership using a,b≤n. Execute the bounded parameter search. Decide the finite polynomial equalities using exact coefficients modulo n.'],[ap,ident],[aksSrc('§21.2, pp.548–549','All branches and the precise truncation parameter of the source algorithm.')],
('TauCeti.Computational.aks','def aks (n : ℕ) : Bool := by sorry'),
api=[('TauCeti.Computational.aks_small','simp','Inputs at most 1 are rejected.','theorem aks_small (n : ℕ) (h : n≤1) : aks n=false := by sorry'),
('TauCeti.Computational.aks_perfect_power','simp','Nontrivial perfect powers are rejected before the polynomial checks.','theorem aks_perfect_power (a b : ℕ) (ha : 1<a) (hb : 1<b) : aks (a^b)=false := by sorry'),
('TauCeti.Computational.aks_check_iff','characterisation','For a non-power input with coprime parameter r<n, acceptance is exactly the prescribed identity test.','''theorem aks_check_iff (n : ℕ) (hn : 1<n)
 (hpow : ¬∃ a b : ℕ, 1<a ∧ 1<b ∧ a^b=n)
 (hr : aksParameter n<n) (hc : Nat.Coprime n (aksParameter n)) :
 aks n=true ↔ AKSIdentities n (aksParameter n) (2*(Nat.log2 n+1)*Nat.sqrt (aksParameter n)+1) := by sorry''')],
tests=[('TauCeti.Computational.test_aks_two','computation','2 is accepted.','example : aks 2=true := by sorry'),
('TauCeti.Computational.test_aks_one','degenerate','1 is rejected.','example : aks 1=false := by sorry'),
('TauCeti.Computational.test_aks_nine','non-example','9 is rejected as a perfect power.','example : aks 9=false := by sorry')],uses=[('CN.1 deterministic primality','Provides an unconditional decision algorithm with source-scoped costs.')],planet='AKS algorithm')

ac=add(1,'aks-deterministic-primality','Correctness of the AKS algorithm','theorem',
'For every natural n, aks n=true iff n is prime. This retains the legacy AKS node ID for the correctness declaration; parameter and algorithm data are separate nodes.',
['Prime inputs satisfy the polynomial identities by Frobenius. For a composite that reaches the final branch choose a prime p dividing n; the parameter search gives p>r and gcd(n,r)=1. Shoup’s quotient-algebra endomorphisms, upper bound on the evaluation image and lower bound from products of distinct linear factors contradict the order and length bounds. Those nonroutine algebraic estimates are still recorded proof-refinement gaps.'],[alg,ident,ap],[aksSrc('§21.2 and Lemmas 21.6–21.11, pp.549–558','Unconditional correctness, separately from the cost model.')],
('TauCeti.Computational.aks_correct','theorem aks_correct (n : ℕ) : aks n=true ↔ Nat.Prime n := by sorry'),acceptance=['Both directions include n=0,1,2 and nontrivial prime powers.'],planet='AKS correctness')
gap('AKS quotient-algebra proof and costs','Decompose Shoup Lemmas 21.6–21.11: substitution automorphisms on F_p[X]/(X^r−1), multiplicative congruence sets, evaluation at a primitive rth root, image size at most n^(2 floor√t), and size at least 2^min(t,ℓ)−1. Also give the r=O(len(n)^5) lemma and the source RAM O(len(n)^16.5) accounting. The RAM exponent is not a proved identical bit-complexity exponent.',[ac])

pockSrc=[src('Thery','Theorem 6.1 and corrected Theorem 6.2, p.9','Pocklington','The read proof gives the partial-factor criterion; replace the printed F>N by F²>N.')]
pl=add(1,'pocklington-prime-divisor','Pocklington prime-divisor congruence','theorem',
'Let n>1, F>1 and F∣n−1. Suppose that for each prime q∣F there is an integer a with a^(n−1)≡1 modulo n and gcd(a^((n−1)/q)−1,n)=1. Then every prime divisor p of n satisfies F∣p−1. The witness a may depend on q; F and (n−1)/F need not be coprime.',
['For every prime-power q^e∣F, the order of a modulo p divides n−1 but does not divide (n−1)/q. Thus its q-adic exponent is at least e, and q^e divides p−1. Combine these prime powers.'],[],pockSrc,
('TauCeti.Computational.pocklington_prime_divisor','''theorem pocklington_prime_divisor (n F : ℕ) (hn : 1<n) (hF : 1<F) (hdiv : F∣n-1)
 (hw : ∀ q : ℕ, Nat.Prime q → q∣F → ∃ a : ℤ,
  (a:ZMod n)^(n-1)=1 ∧ Int.gcd (a^((n-1)/q)-1) (n:ℤ)=1)
 (p : ℕ) (hp : Nat.Prime p) (hpn : p∣n) : F∣p-1 := by sorry'''),acceptance=['Do not replace the gcd condition by mere inequality in ZMod n; nonzero residues need not be units.'])

add(1,'pocklington-primality','Pocklington primality criterion','theorem',
'Under the prime-divisor criterion’s hypotheses, if F²>n then n is prime.',
['If n were composite it would have a prime divisor p≤√n<F. The preceding congruence F∣p−1 contradicts 0<p−1<F.'],[pl],pockSrc,
('TauCeti.Computational.pocklington_prime','''theorem pocklington_prime (n F : ℕ) (hn : 1<n) (hF : 1<F) (hdiv : F∣n-1)
 (hlarge : n<F^2) (hw : ∀ q : ℕ, Nat.Prime q → q∣F → ∃ a : ℤ,
  (a:ZMod n)^(n-1)=1 ∧ Int.gcd (a^((n-1)/q)-1) (n:ℤ)=1) : Nat.Prime n := by sorry'''),acceptance=['The square-root threshold concerns the certified part F, not the largest discovered factor alone.'],planet='Pocklington criterion')

gap('Remaining factorization and certificate costs','Add a finite Pocklington witness package using recursively certified prime factors, the integer/rational-polynomial certificate interface and the finite-field consumer adapter. Native integer trial-division factorization is reused, not re-planned. Chvátal pp.3–4 supplies a logarithmic proof-line bound, but converting it to an explicit O(log² n) bit encoding and verification charge still requires a declared encoding.',[f'{RID}:CN.1'])
```

## Script: cn1_extra.py

```python
ic=add(1,'integer-factorization-certificate','Integer factorization with prime certificates','definition',
'An IntegerFactorCertificate stores a sign ε∈{−1,1} and a list of raw Pratt certificates. Its value is ε times the product of their natural values, viewed in ℤ. It checks against z precisely when every Pratt tree checks and this product equals z. Units ±1 have an empty factor list. Zero has no accepted certificate, and repeated primes remain repeated list entries.',
 ['Use a Bool for the sign and a finite list of existing Pratt trees. Decode by an integer product and check each tree. This certifies a discovered factorization independently of the algorithm that found it.'],[check,sound,factors,factor_prod],lcsrc,
 ('TauCeti.Computational.IntegerFactorCertificate','''structure IntegerFactorCertificate where
 negative : Bool
 factors : List PrattCertificate'''),
api=[('TauCeti.Computational.IntegerFactorCertificate.value','projection','Decode the signed product.','def IntegerFactorCertificate.value (c : IntegerFactorCertificate) : ℤ := (if c.negative then -1 else 1)*(c.factors.map (fun q => (q.value:ℤ))).prod'),
('TauCeti.Computational.IntegerFactorCertificate.check','constructor','Check exact equality and all prime certificates.','def IntegerFactorCertificate.check (c : IntegerFactorCertificate) (z : ℤ) : Bool := c.factors.all PrattCertificate.check && decide (c.value=z)'),
('TauCeti.Computational.IntegerFactorCertificate.check_iff','characterisation','Acceptance is the product equation together with acceptance of all prime witnesses.','theorem IntegerFactorCertificate.check_iff (c : IntegerFactorCertificate) (z : ℤ) : c.check z=true ↔ c.value=z ∧ ∀ q∈c.factors, q.check=true := by sorry')],
tests=[('TauCeti.Computational.test_integer_factor_unit','degenerate','The negative sign and empty list certify −1.','example : (IntegerFactorCertificate.mk true []).check (-1)=true := by sorry'),
('TauCeti.Computational.test_integer_factor_twelve','computation','Two copies of 2 and the accepted certificate for 3 certify 12.','example : (IntegerFactorCertificate.mk false [.two,.two,.node 3 2 [.two]]).check 12=true := by sorry'),
('TauCeti.Computational.test_integer_factor_zero','non-example','No zero product certificate is accepted.','example (c : IntegerFactorCertificate) : c.check 0=false := by sorry')],uses=[('CN.2 discriminant primes','The list of possible index primes comes from a fully factored discriminant.'),('CN.1 factor discovery','Unconditional verification is separate from heuristic search costs.')],planet='Checked integer factorization')
add(1,'integer-factorization-sound','Soundness of integer factorization certificates','theorem',
'An accepted certificate for z gives z≠0 and a list of prime absolute factors whose signed product is z. Thus every prime divisor of |z| occurs among its child values; no completeness inference is made from a partial list.',
 ['Apply Pratt soundness to each child. Prime factors are positive and nonzero, so their signed product is nonzero. Euclid’s lemma identifies prime divisors of the product.'],[ic,sound],lcsrc,
 ('TauCeti.Computational.IntegerFactorCertificate.sound','''theorem IntegerFactorCertificate.sound (c : IntegerFactorCertificate) (z : ℤ) (h : c.check z=true) :
 z≠0 ∧ c.value=z ∧ (∀ q∈c.factors, Nat.Prime q.value) ∧
 ∀ p : ℕ, Nat.Prime p → (p∣z.natAbs ↔ ∃ q∈c.factors, q.value=p) := by sorry'''),acceptance=['For z=−12 the prime support is exactly {2,3}; for ±1 it is empty.'])
add(1,'integer-factorization-complete','Every nonzero integer admits a factor certificate','theorem',
'Every nonzero integer z admits an accepted IntegerFactorCertificate. Use the native primeFactorsList of |z| and Pratt completeness, retaining the sign of z.',
 ['The native product theorem reconstructs the positive absolute value. Each list element is prime and therefore has an accepted Pratt tree. Restore the sign.'],[ic,nid(1,'pratt-certificate-complete'),factor_prod,factor_prime],lcsrc,
 ('TauCeti.Computational.IntegerFactorCertificate.complete','theorem IntegerFactorCertificate.complete (z : ℤ) (hz : z≠0) : ∃ c : IntegerFactorCertificate, c.check z=true := by sorry'),acceptance=['Existence is unconditional. It does not bound the search by a polynomial in the bit length.'])
pc=add(1,'pocklington-certificate','Finite Pocklington certificate','definition',
'PocklingtonCertificate n stores a list of Pratt trees and one integer witness for each occurrence. Its certified part F is the product of the child values. The checker requires n>1, F>1, F∣n−1, n<F², all children accepted, and for each (q,a), a^(n−1)≡1 mod n and gcd(a^((n−1)/q)−1,n)=1. Repeated q encode multiplicity. The uncatalogued cofactor is allowed to remain unfactored.',
 ['Represent the entries as a finite list of pairs. Every prime divisor of F is a certified child, so the list supplies the universal witnesses needed by the Pocklington criterion.'],[check,sound,nid(1,'pocklington-primality')],pockSrc,
 ('TauCeti.Computational.PocklingtonCertificate','structure PocklingtonCertificate where\n entries : List (PrattCertificate × ℤ)'),
api=[('TauCeti.Computational.PocklingtonCertificate.factor','projection','F is the product of certified child values.','def PocklingtonCertificate.factor (c : PocklingtonCertificate) : ℕ := (c.entries.map (fun x => x.1.value)).prod'),
('TauCeti.Computational.PocklingtonCertificate.check','constructor','Execute all bounds, divisibility, recursive and gcd tests.','def PocklingtonCertificate.check (c : PocklingtonCertificate) (n : ℕ) : Bool := by sorry'),
('TauCeti.Computational.PocklingtonCertificate.check_iff','characterisation','No prime-divisor quantification remains in the checker.','''theorem PocklingtonCertificate.check_iff (c : PocklingtonCertificate) (n : ℕ) : c.check n=true ↔
 1<n ∧ 1<c.factor ∧ c.factor∣n-1 ∧ n<c.factor^2 ∧
 ∀ x∈c.entries, x.1.check=true ∧ (x.2:ZMod n)^(n-1)=1 ∧ Int.gcd (x.2^((n-1)/x.1.value)-1) (n:ℤ)=1 := by sorry''')],
tests=[('TauCeti.Computational.test_pocklington_seventeen','computation','F=8 with three factors 2 and witness 3 certifies 17.','example : (PocklingtonCertificate.mk [(.two,3),(.two,3),(.two,3)]).check 17=true := by sorry'),
('TauCeti.Computational.test_pocklington_empty','degenerate','An empty factor list is rejected.','example (n : ℕ) : (PocklingtonCertificate.mk []).check n=false := by sorry'),
('TauCeti.Computational.test_pocklington_insufficient','non-example','A single factor 2 cannot certify 17 because 2²≤17.','example : (PocklingtonCertificate.mk [(.two,3)]).check 17=false := by sorry')],uses=[('CN.1 large prime discovery','A partial factorization of n−1 can suffice for unconditional verification.')],planet='Pocklington certificate')
add(1,'pocklington-certificate-sound','Soundness of finite Pocklington certificates','theorem',
'If the finite Pocklington checker accepts n, then n is prime.',
 ['Pratt soundness makes every child value prime. Every prime divisor of F occurs in the list, so select its recorded integer witness and apply the Pocklington criterion.'],[pc,sound,nid(1,'pocklington-primality')],pockSrc,
 ('TauCeti.Computational.PocklingtonCertificate.sound','theorem PocklingtonCertificate.sound (c : PocklingtonCertificate) (n : ℕ) (h : c.check n=true) : Nat.Prime n := by sorry'),acceptance=['The inference is deterministic even when factor discovery used randomized or heuristic algorithms.'])
ffdep='FiniteFieldsAndCharacterSums:FF.3/factorization-certificate-sound'
ff=add(1,'polynomial-factorization-over-finite-fields','Transport of certified finite-field factors','theorem',
'Let e:F≃+*K be a certified change from a computable finite-field presentation to the intrinsic finite field. For nonzero f=c∏g_i with c≠0 and all g_i monic irreducible, mapping coefficients by e yields map(e,f)=e(c)∏map(e,g_i), again with monic irreducible factors. The FF.3 checker and its search algorithm supply the data; CN.1 only checks the presentation boundary and reconstructs the intrinsic factorization. The retained legacy ID no longer owns DDF, EDF or Berlekamp algorithms.',
 ['Import the accepted nonzero finite-field certificate contract. A field isomorphism preserves leading coefficients, products and irreducibility. Check the presentation’s explicit inverse before transport.'],[ffdep,'FiniteFieldsAndCharacterSums:FF.0/presentation-change-isomorphism'],[src('Shoup','Theorem 19.14, pp.515–516; Chapter 20','finite fields','The finite-field algorithms remain FF.3 imports; this declaration transports their checked output through a fixed presentation.')],
 ('TauCeti.Computational.transport_finite_factorization','''theorem transport_finite_factorization {F K : Type*} [Field F] [Field K] [Finite F] [Finite K]
 (e : F ≃+* K) (f : Polynomial F) (hf : f≠0) (c : F) (hc : c≠0) (gs : List (Polynomial F))
 (hg : ∀ g∈gs, g.Monic ∧ Irreducible g) (hprod : f=C c*gs.prod) :
 f.map e.toRingHom=C (e c)*(gs.map (fun g => g.map e.toRingHom)).prod ∧
 ∀ g∈gs, (g.map e.toRingHom).Monic ∧ Irreducible (g.map e.toRingHom) := by sorry'''),acceptance=['The explicit f≠0 and c≠0 hypotheses avoid the supplier definition’s zero-polynomial ambiguity. Zero is handled by a separate zero result, never an irreducible factor list.'])

qfc=add(1,'rational-polynomial-factor-certificate','Rational polynomial factor certificate','definition',
'For f∈ℚ[X], RationalFactorCertificate f consists of a nonzero rational leading factor c, a finite list of monic polynomials, proofs that each is irreducible over ℚ, and the exact identity f=c∏g_i. Multiplicity is represented by repeated factors. The definition uses actual irreducibility proofs; a CAS assertion or irreducibility modulo a single prime without a valid lifting criterion is insufficient. For f∈ℤ[X], certify its coefficientwise rational image and separately retain integer content and primitive-factor normalization.',
 ['Store finite polynomial data and exact proof obligations. This wraps an output of discovery, not a new factorization theory. The factory must obtain each rational irreducibility proof by a justified criterion, with exhaustive modular recombination when one-prime irreducibility is unavailable.'],[],[src('Shoup','§16.5–16.6, pp.439–441','minimal polynomial','Uses exact rational polynomials and irreducibility; a complete integer/rational factor search and its source decomposition remain a stated gap.')],
 ('TauCeti.Computational.RationalFactorCertificate','''structure RationalFactorCertificate (f : Polynomial ℚ) where
 scalar : ℚ
 nonzero : scalar≠0
 factors : List (Polynomial ℚ)
 irreducible : ∀ g∈factors, g.Monic ∧ Irreducible g
 product : f=C scalar*factors.prod'''),
api=[('TauCeti.Computational.RationalFactorCertificate.reconstruct','projection','The certificate reconstructs f exactly.','theorem RationalFactorCertificate.reconstruct {f : Polynomial ℚ} (c : RationalFactorCertificate f) : f=C c.scalar*c.factors.prod := by sorry'),
('TauCeti.Computational.RationalFactorCertificate.input_nonzero','other','No certificate exists for the zero polynomial.','theorem RationalFactorCertificate.input_nonzero {f : Polynomial ℚ} (c : RationalFactorCertificate f) : f≠0 := by sorry'),
('TauCeti.Computational.RationalFactorCertificate.leadingCoeff','compatibility','The scalar equals the leading coefficient of f because every listed factor is monic.','theorem RationalFactorCertificate.leadingCoeff {f : Polynomial ℚ} (c : RationalFactorCertificate f) : c.scalar=f.leadingCoeff := by sorry')],
tests=[('TauCeti.Computational.test_rational_factor_one','degenerate','The unit polynomial uses scalar 1 and an empty list.','example : Nonempty (RationalFactorCertificate (1:Polynomial ℚ)) := by sorry'),
('TauCeti.Computational.test_rational_factor_repeated','computation','(X−1)² has the repeated linear list [X−1,X−1].','example : ∃ c : RationalFactorCertificate ((X-1)^2), c.factors=[X-1,X-1] := by sorry'),
('TauCeti.Computational.test_rational_factor_zero','non-example','The zero polynomial has no such factor certificate.','example : IsEmpty (RationalFactorCertificate (0:Polynomial ℚ)) := by sorry')],uses=[('CN.2 number-field inputs','Certify rational defining polynomials and factor decompositions.'),('CN.1 factorization acceptance','The reconstructed polynomial and irreducibility proofs are independent of discovery.')],planet='Rational factor certificate')
gap('Rational factorization discovery and finite irreducibility evidence','Give the integer content/primitive-part bridge to ℚ, coefficient bounds, square-free reduction, modular factor selection, exact FF.3 Hensel lifts, bounded recombination and termination. A rational irreducible polynomial need not have an irreducible reduction at any prime; the certificate factory cannot assume that. No full freely readable proof has yet been decomposed. Existing certified rational outputs remain sound because actual irreducibility proofs are required.',[qfc])
req('FiniteFieldsAndCharacterSums:FF.3','Consume finite-field factor search and coprime Hensel lifting as already-owned algorithms, with nonzero input and degree-preserving reductions. The downstream rational recombination algorithm is CN.1; supply explicit finite-level factor data and uniqueness in the needed presentation.',[qfc])
qalg=add(1,'certified-rational-factorization','Certified rational polynomial factorization','construction',
'For nonzero f∈ℚ[X], certifiedRationalFactorization returns a RationalFactorCertificate f. Clear denominators and content, separate repeated factors, factor a suitable finite-field reduction via FF.3, lift factors to a precision exceeding a proved coefficient bound, and perform exhaustive exact recombination. The result is deterministic once every search branch and stopping bound is fixed; a randomized finite-field search may discover candidates but cannot weaken the final certificate checks.',
 ['The semantic result type requires exact reconstruction and genuine rational irreducibility. The modular lifting and recombination proof is a recorded missing source decomposition; single-prime irreducibility is a sufficient shortcut only when its hypotheses hold, not a complete general algorithm.'],[qfc,'FiniteFieldsAndCharacterSums:FF.3/hensel-lifting-modulo-prime-powers',ff], [src('Shoup','§16.5–16.6, pp.439–441','minimal polynomial','Exact-field output contract. The full integer/rational algorithm is a target with a separately recorded unread proof source, not attributed as a theorem of these sections.')],
 ('TauCeti.Computational.certifiedRationalFactorization','def certifiedRationalFactorization (f : Polynomial ℚ) (hf : f≠0) : RationalFactorCertificate f := by sorry'),
api=[('TauCeti.Computational.certifiedRationalFactorization_product','compatibility','The returned factors reconstruct f.','theorem certifiedRationalFactorization_product (f : Polynomial ℚ) (hf : f≠0) : f=C (certifiedRationalFactorization f hf).scalar*(certifiedRationalFactorization f hf).factors.prod := by sorry'),
('TauCeti.Computational.certifiedRationalFactorization_irreducible','projection','Every returned factor is monic and irreducible over ℚ.','theorem certifiedRationalFactorization_irreducible (f : Polynomial ℚ) (hf : f≠0) (g : Polynomial ℚ) (hg : g∈(certifiedRationalFactorization f hf).factors) : g.Monic ∧ Irreducible g := by sorry'),
('TauCeti.Computational.certifiedRationalFactorization_scalar','projection','The scalar is the input leading coefficient.','theorem certifiedRationalFactorization_scalar (f : Polynomial ℚ) (hf : f≠0) : (certifiedRationalFactorization f hf).scalar=f.leadingCoeff := by sorry')],
tests=[('TauCeti.Computational.test_factorization_constant','degenerate','A nonzero constant produces an empty irreducible-factor list.','example : (certifiedRationalFactorization (C 2:Polynomial ℚ) (by sorry)).factors=[] := by sorry'),
('TauCeti.Computational.test_factorization_repeated','computation','(X−1)² produces two copies of X−1.','example : (certifiedRationalFactorization ((X-1)^2:Polynomial ℚ) (by sorry)).factors=[X-1,X-1] := by sorry'),
('TauCeti.Computational.test_factorization_Q_not_C','non-example','X²+1 stays irreducible over ℚ even though it splits over ℂ.','example : (certifiedRationalFactorization (X^2+1:Polynomial ℚ) (by sorry)).factors=[X^2+1] := by sorry')],uses=[('CN.1 polynomial factorization','Makes the algorithm target explicit while its proof refinements remain open.'),('CN.2 defining polynomials','Returns the actual field-specific irreducibility proof.')])
```

## Script: cn2.py

```python
nr=lambda loc,match:src('NumberRings',loc,'number rings',match)
radical=base('mathlib:Ideal.radical','Mathlib/RingTheory/Ideal/Operations.lean','Ideal radical, defined by existence of a power in the ideal.','def')
frobenius=base('mathlib:FiniteField.frobeniusAlgHom','Mathlib/FieldTheory/Finite/Basic.lean','The algebra endomorphism x↦x^q on every commutative algebra over a finite field of q elements, including nonreduced finite algebras.','def')

mult=add(2,'multiplier-ring','Multiplier ring of an integral lattice','construction',
'For a field K of characteristic zero and an integer submodule I⊆K, multiplierRing I is the ℤ-subalgebra {x∈K | xI⊆I}. This definition also permits I=0, in which case the multiplier ring is all of K. Finiteness and the full-lattice condition are hypotheses of the maximal-order theorems, not hidden in this carrier.',
['The stabilizing condition is closed under addition, multiplication and negation. Every integer scalar stabilizes I. Package the subset as the existing Subalgebra ℤ K type.'],[],[nr('§9, Proposition 9.3, pp.234–235','The multiplier ring of the p-radical is the improving overorder.')],
('TauCeti.Computational.multiplierRing','def multiplierRing {K : Type*} [Field K] [CharZero K] (I : Submodule ℤ K) : Subalgebra ℤ K := by sorry'),
api=[('TauCeti.Computational.mem_multiplierRing','characterisation','Membership means preservation of every lattice element by multiplication.','theorem mem_multiplierRing {K : Type*} [Field K] [CharZero K] (I : Submodule ℤ K) (x : K) : x∈multiplierRing I ↔ ∀ y∈I, x*y∈I := by sorry'),
('TauCeti.Computational.multiplierRing_zero','simp','The zero lattice has the whole field as multiplier ring.','theorem multiplierRing_zero {K : Type*} [Field K] [CharZero K] : multiplierRing (⊥ : Submodule ℤ K)=⊤ := by sorry'),
('TauCeti.Computational.multiplierRing_smul','compatibility','Multiplying a lattice by a nonzero field element does not change its multiplier ring.','theorem multiplierRing_smul {K : Type*} [Field K] [CharZero K] (I : Submodule ℤ K) (a : K) (ha : a≠0) : multiplierRing (Submodule.map (LinearMap.mul ℤ K a) I)=multiplierRing I := by sorry')],
tests=[('TauCeti.Computational.test_multiplier_zero','degenerate','The zero lattice must not be treated as a finite order.','example : multiplierRing (⊥ : Submodule ℤ ℚ)=⊤ := by sorry'),
('TauCeti.Computational.test_multiplier_Z','compatibility','The lattice generated by 1 in ℚ has only integral multipliers.','example (x : ℚ) : x∈multiplierRing (Submodule.span ℤ ({1}:Set ℚ)) ↔ ∃ z : ℤ, (z:ℚ)=x := by sorry'),
('TauCeti.Computational.test_multiplier_half','non-example','1/2 does not stabilize the lattice ℤ inside ℚ.','example : (1/2:ℚ)∉multiplierRing (Submodule.span ℤ ({1}:Set ℚ)) := by sorry')],uses=[('Stevenhagen Proposition 9.3','Computes an overorder from the p-radical.'),('CN.2 integral-basis certification','Provides a local maximality stopping condition.')],planet='Multiplier ring')

pmax=add(2,'p-maximal-order','Local maximality of an order','definition',
'For a ℤ-subalgebra R of a characteristic-zero field K and a prime p, IsPMaximal R p means that for every x∈K integral over ℤ there is an integer a not divisible by p with a·x∈R. For a full finite order R this says its localization at p equals that of the maximal order, or equivalently p does not divide its index. The predicate is meaningful at arbitrary p, but arithmetic theorems assume primality.',
['Express equality after localization by clearing a denominator prime to p. Keep the intrinsic integral closure as the target.'],[],[nr('§9, pp.233–235','The p-primary overorder and the condition that R already equals its p-saturation.')],
('TauCeti.Computational.IsPMaximal','''def IsPMaximal {K : Type*} [Field K] [CharZero K] (R : Subalgebra ℤ K) (p : ℕ) : Prop :=
 ∀ x : K, IsIntegral ℤ x → ∃ a : ℤ, ¬(p:ℤ) ∣ a ∧ (a:K)*x∈R'''),
api=[('TauCeti.Computational.isPMaximal_iff','characterisation','Local maximality is the stated prime-to-p denominator-clearing property.','''theorem isPMaximal_iff {K : Type*} [Field K] [CharZero K] (R : Subalgebra ℤ K) (p : ℕ) :
 IsPMaximal R p ↔ ∀ x : K, IsIntegral ℤ x → ∃ a : ℤ, ¬(p:ℤ) ∣ a ∧ (a:K)*x∈R := by sorry'''),
('TauCeti.Computational.isPMaximal_mono','functoriality','Enlarging R preserves local maximality.','theorem isPMaximal_mono {K : Type*} [Field K] [CharZero K] {R S : Subalgebra ℤ K} (p : ℕ) (h : R≤S) : IsPMaximal R p → IsPMaximal S p := by sorry'),
('TauCeti.Computational.isPMaximal_top','simp','The whole field satisfies the predicate at primes; finiteness must be imposed separately for orders.','theorem isPMaximal_top {K : Type*} [Field K] [CharZero K] (p : ℕ) (hp : Nat.Prime p) : IsPMaximal (⊤ : Subalgebra ℤ K) p := by sorry')],
tests=[('TauCeti.Computational.test_pMaximal_Z','computation','The usual copy of ℤ in ℚ is p-maximal at every prime.','example (p : ℕ) (hp : Nat.Prime p) : IsPMaximal (⊥ : Subalgebra ℤ ℚ) p := by sorry'),
('TauCeti.Computational.test_pMaximal_one','non-example','At p=1 no denominator passes, so the predicate is false.','example (R : Subalgebra ℤ ℚ) : ¬IsPMaximal R 1 := by sorry'),
('TauCeti.Computational.test_pMaximal_overorder','compatibility','Every overorder of a p-maximal order remains p-maximal.','example {K : Type*} [Field K] [CharZero K] (p : ℕ) (R S : Subalgebra ℤ K) (h : R≤S) (hr : IsPMaximal R p) : IsPMaximal S p := by sorry')],uses=[('CN.2 Round 2','Specifies exactly what each prime-index computation certifies.'),('CN.2 integral basis','Check each prime capable of dividing the index.')],planet='p-maximal order')

nil=add(2,'finite-algebra-frobenius-nilradical','Nilradical from a Frobenius kernel','theorem',
'Let A be a finite-dimensional commutative algebra over ZMod p, p prime, and let p^k≥dim A. Then x is nilpotent iff x^(p^k)=0. Consequently the nilradical is the kernel of the kth iterate of the Frobenius algebra endomorphism, computable by linear algebra in any supplied basis.',
['A nilpotent multiplication operator on the d-dimensional space has nilpotency exponent at most d. Thus x^d=0 and x^(p^k)=0. The reverse implication is the definition of nilpotence. The basis-to-matrix kernel computation is imported from CA.3.'],[frobenius,radical],[nr('§9, pp.233–234','Computing the p-radical as a Frobenius kernel in R/pR.')],
('TauCeti.Computational.nilpotent_iff_frobenius_zero','''theorem nilpotent_iff_frobenius_zero (p k : ℕ) [Fact p.Prime]
 (A : Type*) [CommRing A] [Algebra (ZMod p) A] [FiniteDimensional (ZMod p) A]
 (h : Module.finrank (ZMod p) A ≤ p^k) (x : A) : IsNilpotent x ↔ x^(p^k)=0 := by sorry'''),acceptance=['For A=F_p[ε]/(ε²), a nonzero ε belongs to the kernel as soon as p^k≥2. A reduced finite algebra has zero kernel.'])
gap('Finite-dimensional nilpotence bound','Locate the exact pinned theorem or add the separate multiplication-operator nilpotence lemma proving x^dim(A)=0 for nilpotent x. The currently read Frobenius construction does not itself prove this dimension bound.',[nil])

stop=add(2,'units-complete-of-regulator-bound','Fundamental units from a regulator index bound','theorem',
'Let K be a number field and u a family of rank(K) units whose logarithmic images are linearly independent. If regOfFamily(u)<2·regulator(K), then the subgroup generated by u together with the torsion units is the full unit group. To claim generation by a displayed finite list alone, that list must separately generate all torsion units.',
['The native regulator ratio is the subgroup index. Full logarithmic rank makes the index positive. The strict bound makes it a positive integer below 2, hence one; index one is equivalent to the subgroup being the whole group.'],[reg_index],[nr('§12, pp.248–250','Corrects the torsion convention when using the regulator as a stopping certificate.')],
('TauCeti.Computational.units_complete_of_regulator_bound','''theorem units_complete_of_regulator_bound (K : Type*) [Field K] [NumberField K]
 (u : Fin (NumberField.Units.rank K) → (NumberField.RingOfIntegers K)ˣ)
 (hu : NumberField.Units.IsMaxRank u)
 (h : NumberField.Units.regOfFamily u < 2 * NumberField.Units.regulator K) :
 Subgroup.closure (Set.range u) ⊔ NumberField.Units.torsion K = ⊤ := by sorry'''),acceptance=['In rank zero the regulator supplies no information about whether the displayed list contains roots of unity.'],planet='Regulator stopping certificate')

joint=add(2,'joint-class-unit-index-certificate','Joint class and unit stopping bound','theorem',
'Suppose h>0 divides h′, and u is a full logarithmic-rank family of units of a number field K. If h′·regOfFamily(u)<2h·regulator(K), then h′=h and u together with all torsion units generates the unit group. In the class-group algorithm h′ is the order of the quotient by certified found relations, and h is the true class number; the surjection from that quotient must first establish h∣h′.',
['The ratio is the product of two positive integers: h′/h and the native unit index. A product below 2 forces both factors to be 1. Apply the unit stopping argument.'],[stop,reg_index],[nr('§12, pp.248–252','Separates relation-lattice completeness from mere discovery and makes the positive-integer stopping argument explicit.')],
('TauCeti.Computational.joint_class_unit_bound','''theorem joint_class_unit_bound (K : Type*) [Field K] [NumberField K]
 (u : Fin (NumberField.Units.rank K) → (NumberField.RingOfIntegers K)ˣ)
 (hu : NumberField.Units.IsMaxRank u) (h h' : ℕ) (hh : 0<h) (hd : h∣h')
 (hh' : 0<h') (hb : (h':ℝ)*NumberField.Units.regOfFamily u <
 2*(h:ℝ)*NumberField.Units.regulator K) :
 h'=h ∧ Subgroup.closure (Set.range u) ⊔ NumberField.Units.torsion K = ⊤ := by sorry'''),acceptance=['The hypothesis h′>0 excludes infinite quotients encoded with zero cardinality. Neither an approximate Euler product nor a terminated relation search supplies the strict bound.'])

gap('Remaining number-field certificate targets','Specify full order-basis and integral-basis certificates, the p-radical multiplier criterion and terminating p-index descent, prime decomposition at index divisors, φ-adic Newton residual data and higher-order types, local expansions, finite class-group relation quotients with a proven factor-base bound, and rigorous analytic stopping intervals. Import CA.3 normal forms and ordinary Newton slopes with their opposite geometric sign; import NFA.3 and NFA.7 intrinsic and rank-one certificates. Do not claim a full algorithm from the five current local target nodes.',[f'{RID}:CN.2'])
```

## Script: cn2_extra.py

```python
hnf='ClassicalArithmeticCompletion:CA.3/hermite-normal-form-certificate'
snf='ClassicalArithmeticCompletion:CA.3/smith-normal-form-certificate'
ob=add(2,'order-basis-certificate','Finite order basis certificate','definition',
'For a number field K and n∈ℕ, an OrderBasisCertificate stores b₀,…,bₙ₋₁∈K forming a ℚ-basis, integer coordinates for 1, and integer structure constants b_i b_j=Σ_k m_ijk b_k. These finite identities prove that the integer span of b is a full order. The certificate does not assert maximality.',
 ['Check rational linear independence and spanning, the coordinate equation for 1, and all n² multiplication equations. The integer span is then closed under multiplication. CA.3 normal forms supply coordinate reconstruction.'],[hnf],[nr('§9, pp.233–235','General full-order coordinates replace the initial monogenic basis after an overorder step.')],
 ('TauCeti.Computational.OrderBasisCertificate','''structure OrderBasisCertificate (K : Type*) [Field K] [NumberField K] (n : ℕ) where
 basis : Basis (Fin n) ℚ K
 oneCoordinates : Fin n → ℤ
 multiplication : Fin n → Fin n → Fin n → ℤ
 one_eq : ∑ i, (oneCoordinates i:K)*basis i=1
 mul_eq : ∀ i j, basis i*basis j=∑ k, (multiplication i j k:K)*basis k'''),
api=[('TauCeti.Computational.OrderBasisCertificate.order','projection','Package the integer span as a native ℤ-subalgebra of K.','def OrderBasisCertificate.order {K : Type*} [Field K] [NumberField K] {n : ℕ} (b : OrderBasisCertificate K n) : Subalgebra ℤ K := by sorry'),
('TauCeti.Computational.OrderBasisCertificate.mem_order','characterisation','Membership is existence of integer coordinates in b.','theorem OrderBasisCertificate.mem_order {K : Type*} [Field K] [NumberField K] {n : ℕ} (b : OrderBasisCertificate K n) (x : K) : x∈b.order ↔ ∃ c : Fin n → ℤ, x=∑ i, (c i:K)*b.basis i := by sorry'),
('TauCeti.Computational.OrderBasisCertificate.coordinates_unique','extensionality','Integer coordinates in the basis are unique.','theorem OrderBasisCertificate.coordinates_unique {K : Type*} [Field K] [NumberField K] {n : ℕ} (b : OrderBasisCertificate K n) (c d : Fin n → ℤ) (h : (∑ i, (c i:K)*b.basis i)=∑ i, (d i:K)*b.basis i) : c=d := by sorry')],
tests=[('TauCeti.Computational.test_order_Q','computation','The singleton basis 1 presents ℤ in ℚ.','example : ∃ b : OrderBasisCertificate ℚ 1, b.basis 0=1 ∧ b.order=⊥ := by sorry'),
('TauCeti.Computational.test_order_rank_zero','degenerate','A number field has no rank-zero order certificate.','example (K : Type*) [Field K] [NumberField K] : IsEmpty (OrderBasisCertificate K 0) := by sorry'),
('TauCeti.Computational.test_order_half','non-example','The singleton rational basis 1/2 is not closed under multiplication over ℤ.','example : ¬∃ b : OrderBasisCertificate ℚ 1, b.basis 0=1/2 := by sorry')],uses=[('Stevenhagen Pohst–Zassenhaus algorithm','Every overorder is represented by a full integral basis and multiplication table.'),('CN.2 ideal arithmetic','A common order basis fixes ideal coordinate matrices.')],planet='Order basis certificate')
obi=add(2,'order-basis-integrality','Order coordinates imply integrality','theorem',
'Every element in the order of an OrderBasisCertificate is integral over ℤ.',
 ['Its multiplication matrix in the displayed integer basis has integral entries. Cayley–Hamilton supplies a monic annihilating polynomial. The intrinsic finite-algebra integrality theorem belongs to the number-field/library supplier; this declaration specializes it to checked coordinates.'],[ob], [nr('§6 and §9, pp.224–225,233–235','Finite multiplication-stable lattices consist of integral elements.')],
 ('TauCeti.Computational.OrderBasisCertificate.isIntegral','theorem OrderBasisCertificate.isIntegral {K : Type*} [Field K] [NumberField K] {n : ℕ} (b : OrderBasisCertificate K n) (x : K) (h : x∈b.order) : IsIntegral ℤ x := by sorry'),acceptance=['A full rational basis alone does not imply integrality: the multiplication table is essential.'])
pr=add(2,'p-radical-lattice','The p-radical in field coordinates','construction',
'For a full order R⊆K and prime p, pRadicalLattice R p is the integer lattice of x∈R with x^k∈pR for some k≥1. It is the inverse image of the nilradical of R/pR. The exponent excludes the empty-power convention. This is a coordinate adapter for the native ideal radical, not a second definition of radical.',
 ['Take the native radical of pR in R and map its underlying integer module through the inclusion R→K. Finite-field linear algebra computes it from the Frobenius kernel.'],[radical,nil,hnf],[nr('Equation (9-2) and following paragraph, pp.234–235','The p-radical and its finite-algebra computation.')],
 ('TauCeti.Computational.pRadicalLattice','def pRadicalLattice {K : Type*} [Field K] [NumberField K] (R : Subalgebra ℤ K) (p : ℕ) : Submodule ℤ K := by sorry'),
api=[('TauCeti.Computational.mem_pRadicalLattice','characterisation','Membership is a positive power in pR.','theorem mem_pRadicalLattice {K : Type*} [Field K] [NumberField K] (R : Subalgebra ℤ K) (p : ℕ) (x : K) : x∈pRadicalLattice R p ↔ x∈R ∧ ∃ k : ℕ, 0<k ∧ ∃ y∈R, x^k=(p:K)*y := by sorry'),
('TauCeti.Computational.pRadicalLattice_contains_p','simp','The element p belongs to the p-radical.','theorem pRadicalLattice_contains_p {K : Type*} [Field K] [NumberField K] (R : Subalgebra ℤ K) (p : ℕ) : (p:K)∈pRadicalLattice R p := by sorry'),
('TauCeti.Computational.pRadicalLattice_mul','structure','The lattice is stable under multiplication by its order.','theorem pRadicalLattice_mul {K : Type*} [Field K] [NumberField K] (R : Subalgebra ℤ K) (p : ℕ) (r x : K) (hr : r∈R) (hx : x∈pRadicalLattice R p) : r*x∈pRadicalLattice R p := by sorry')],
tests=[('TauCeti.Computational.test_pRadical_zero','degenerate','For a characteristic-zero field the zero-radical of an order is zero.','example {K : Type*} [Field K] [NumberField K] (R : Subalgebra ℤ K) : pRadicalLattice R 0=⊥ := by sorry'),
('TauCeti.Computational.test_pRadical_Z','computation','The p-radical of ℤ inside ℚ is pℤ for prime p.','example (p : ℕ) (hp : Nat.Prime p) (z : ℤ) : (z:ℚ)∈pRadicalLattice (⊥ : Subalgebra ℤ ℚ) p ↔ (p:ℤ)∣z := by sorry'),
('TauCeti.Computational.test_pRadical_one_not','non-example','1 does not belong to the p-radical of ℤ at a prime.','example (p : ℕ) (hp : Nat.Prime p) : (1:ℚ)∉pRadicalLattice (⊥ : Subalgebra ℤ ℚ) p := by sorry')],uses=[('CN.2 p-maximality checker','The stabilizer of this lattice decides the local stopping condition.')])
criterion=add(2,'p-radical-maximality-criterion','Multiplier criterion for p-maximality','theorem',
'For a full order R presented by an OrderBasisCertificate and a prime p, the multiplier ring of pRadicalLattice R p equals R iff IsPMaximal R p. In the nonmaximal case it is a strictly larger integral overorder contained in (1/p)R; its quotient over R is p-primary.',
 ['Apply Stevenhagen Proposition 9.3 to the p-primary saturation. If the order is already p-maximal, the multiplier ring lies between R and its p-primary saturation, forcing equality. Otherwise Proposition 9.3 supplies a multiplier outside R. Finite-lattice coordinate conversion is provided by CA.3.'],[ob,obi,pr,mult,pmax], [nr('Proposition 9.3 and its proof, p.235','The exact local stopping criterion; no monogenic or unramified assumption is added.')],
 ('TauCeti.Computational.pRadical_multiplier_eq_iff','''theorem pRadical_multiplier_eq_iff {K : Type*} [Field K] [NumberField K] {n : ℕ}
 (b : OrderBasisCertificate K n) (p : ℕ) (hp : Nat.Prime p) :
 multiplierRing (pRadicalLattice b.order p)=b.order ↔ IsPMaximal b.order p := by sorry'''),acceptance=['A ramified maximal order can have nonzero p-radical modulo p and still pass. Nilradical zero is sufficient but not necessary.'],planet='Pohst–Zassenhaus criterion')
gap('Multiplier criterion intrinsic lemmas','Split the p-primary saturation, finite-index bound, integrality of the multiplier ring, containment in (1/p)R, and the radical-extension/intersection step in Proposition 9.3. Check the source’s direction of the sentence about high radical powers against ideal nilpotence; the required implication is eventual containment in a sufficiently high p-power, not an unjustified reversed inclusion.',[criterion])
ib=add(2,'integral-basis-certificate','Integral basis certificate','definition',
'An IntegralBasisCertificate K is an OrderBasisCertificate of some finite rank together with a proof that its order is exactly the set of elements integral over ℤ. Thus its basis spans the native ring of integers, not merely a suborder. A practical finite certificate proves this maximality by checking the p-radical multiplier criterion at every prime whose square divides the starting discriminant.',
 ['Store the full order basis and the exact maximality equation. The finite local checks are converted to this equation by the discriminant-index theorem; the resulting basis transports to the native RingOfIntegers carrier.'],[ob,obi,criterion,ic], [nr('§9, pp.233–235','The p-primary overorders at all critical primes generate the maximal order.')],
 ('TauCeti.Computational.IntegralBasisCertificate','''structure IntegralBasisCertificate (K : Type*) [Field K] [NumberField K] where
 rank : ℕ
 orderBasis : OrderBasisCertificate K rank
 maximal : ∀ x : K, x∈orderBasis.order ↔ IsIntegral ℤ x'''),
api=[('TauCeti.Computational.IntegralBasisCertificate.mem_iff','characterisation','The certificate identifies the order with the integral closure.','theorem IntegralBasisCertificate.mem_iff {K : Type*} [Field K] [NumberField K] (b : IntegralBasisCertificate K) (x : K) : x∈b.orderBasis.order ↔ IsIntegral ℤ x := by sorry'),
('TauCeti.Computational.IntegralBasisCertificate.rank_eq','compatibility','The rank is the rational field degree.','theorem IntegralBasisCertificate.rank_eq {K : Type*} [Field K] [NumberField K] (b : IntegralBasisCertificate K) : b.rank=Module.finrank ℚ K := by sorry'),
('TauCeti.Computational.IntegralBasisCertificate.integerBasis','projection','Transport the checked coordinates to a native ℤ-basis of the ring of integers.','def IntegralBasisCertificate.integerBasis {K : Type*} [Field K] [NumberField K] (b : IntegralBasisCertificate K) : Basis (Fin b.rank) ℤ (NumberField.RingOfIntegers K) := by sorry')],
tests=[('TauCeti.Computational.test_integral_basis_Q','computation','ℚ has an integral basis certificate of rank one.','example : ∃ b : IntegralBasisCertificate ℚ, b.rank=1 := by sorry'),
('TauCeti.Computational.test_integral_basis_rank_zero','degenerate','A certificate has positive rank.','example {K : Type*} [Field K] [NumberField K] (b : IntegralBasisCertificate K) : 0<b.rank := by sorry'),
('TauCeti.Computational.test_integral_basis_half','non-example','The rational 1/2 is excluded by the certificate for ℚ.','example (b : IntegralBasisCertificate ℚ) : (1/2:ℚ)∉b.orderBasis.order := by sorry')],uses=[('CN.2 ideal decomposition','Correct integral coordinates are needed at common index divisors.'),('ClassicalArithmeticCompletion:CA.5','Imports certified integral bases without duplicating intrinsic number-field structure.')],planet='Integral basis certificate')
iba=add(2,'integral-basis-algorithm','Certified integral-basis algorithm','construction',
'Given a full order basis in K, integralBasisAlgorithm returns an IntegralBasisCertificate K for an overorder containing the input. Factor the absolute discriminant exactly, compute p-radicals and multiplier overorders at all critical primes, and stop each local loop only when the multiplier ring is unchanged. Each strict enlargement drops the p-exponent of the index in the maximal order, so the local loops terminate. No polynomial bit-time claim is made for the required integer factorization.',
 ['Use the checked integer factorization for the critical prime list. Apply the multiplier criterion and CA.3 HNF coordinate changes at each step. A positive finite index strictly decreases under proper enlargement. The discriminant-index square identity proves that no unchecked prime can divide the final index.'],[ib,criterion,ic,hnf], [nr('§9, pp.233–235','The local-to-global Pohst–Zassenhaus algorithm with an independent stopping criterion.')],
 ('TauCeti.Computational.integralBasisAlgorithm','def integralBasisAlgorithm {K : Type*} [Field K] [NumberField K] {n : ℕ} (b : OrderBasisCertificate K n) : IntegralBasisCertificate K := by sorry'),
api=[('TauCeti.Computational.integralBasisAlgorithm_contains','compatibility','The returned maximal order contains the input order.','theorem integralBasisAlgorithm_contains {K : Type*} [Field K] [NumberField K] {n : ℕ} (b : OrderBasisCertificate K n) : b.order≤(integralBasisAlgorithm b).orderBasis.order := by sorry'),
('TauCeti.Computational.integralBasisAlgorithm_maximal','characterisation','The returned order equals the intrinsic integral closure.','theorem integralBasisAlgorithm_maximal {K : Type*} [Field K] [NumberField K] {n : ℕ} (b : OrderBasisCertificate K n) (x : K) : x∈(integralBasisAlgorithm b).orderBasis.order ↔ IsIntegral ℤ x := by sorry'),
('TauCeti.Computational.integralBasisAlgorithm_rank','compatibility','The returned rank equals the input rank.','theorem integralBasisAlgorithm_rank {K : Type*} [Field K] [NumberField K] {n : ℕ} (b : OrderBasisCertificate K n) : (integralBasisAlgorithm b).rank=n := by sorry')],
tests=[('TauCeti.Computational.test_integral_basis_algorithm_Q','computation','Every order in ℚ returns the usual integer ring.','example {n : ℕ} (b : OrderBasisCertificate ℚ n) : (integralBasisAlgorithm b).orderBasis.order=⊥ := by sorry'),
('TauCeti.Computational.test_integral_basis_algorithm_one','degenerate','The returned order contains 1.','example {K : Type*} [Field K] [NumberField K] {n : ℕ} (b : OrderBasisCertificate K n) : (1:K)∈(integralBasisAlgorithm b).orderBasis.order := by sorry'),
('TauCeti.Computational.test_integral_basis_algorithm_idempotent','compatibility','Applying the algorithm to its output preserves the order, though not necessarily the basis.','example {K : Type*} [Field K] [NumberField K] {n : ℕ} (b : OrderBasisCertificate K n) : (integralBasisAlgorithm (integralBasisAlgorithm b).orderBasis).orderBasis.order=(integralBasisAlgorithm b).orderBasis.order := by sorry')],uses=[('CN.2 algorithms','Supplies a certified maximal-order presentation before ideal arithmetic.')])
gap('Integral-basis algorithm termination and exact linear algebra','Promote strict p-index descent, discriminant-index square identity in these coordinates, certified prime coverage, quotient basis construction and termination to individual lemmas. The construction signature specifies a total output but its admitted prototype is not an executable implementation. The integer factorization cost remains separate.',[iba])
classnum=base('mathlib:NumberField.classNumber','Mathlib/NumberTheory/NumberField/ClassNumber.lean','The finite cardinality of the native ideal class group.','def')
mink=base('mathlib:NumberField.exists_ideal_in_class_of_norm_le','Mathlib/NumberTheory/NumberField/ClassNumber.lean','Every class has a nonzero integral ideal representative satisfying the explicit Minkowski bound.')
classmap=base('mathlib:ClassGroup.mk0','Mathlib/RingTheory/ClassGroup/Basic.lean','Multiplicative map from nonzero integral ideals to their native ideal classes.','def')
CODE.append('open scoped nonZeroDivisors\n')
primecert=add(2,'prime-ideal-factor-certificate','Prime-ideal decomposition certificate','definition',
'For K a number field and a rational prime p, a PrimeIdealFactorCertificate K p stores a finite list of pairwise distinct nonzero prime ideals P_i of the native ring of integers, positive exponents e_i, and the identity pO_K=∏P_i^e_i. Each ideal is presented in the certified integral basis. Primality may be checked by an explicit finite-field quotient presentation. At primes dividing the index of a chosen power basis, the computation must use the maximal order or a proved higher-order method.',
 ['Use native ideals, ideal multiplication and primality. The exact product and prime checks certify the decomposition without trusting a discovered factor list. Import FF.0 quotient-field presentations and the integral basis coordinates.'],[ib,'FiniteFieldsAndCharacterSums:FF.0/certified-presentation-of-a-finite-field'],[nr('§9, pp.234–235; §12, p.248','General maximal-order quotient algebra computations handle common index divisors.')],
 ('TauCeti.Computational.PrimeIdealFactorCertificate','''structure PrimeIdealFactorCertificate (K : Type*) [Field K] [NumberField K] (p : ℕ) where
 factors : List (Ideal (NumberField.RingOfIntegers K) × ℕ)
 distinct : (factors.map Prod.fst).Nodup
 prime : ∀ x∈factors, x.1.IsPrime ∧ x.1≠⊥ ∧ 0<x.2
 product : Ideal.span ({(p:NumberField.RingOfIntegers K)}:Set (NumberField.RingOfIntegers K))=(factors.map (fun x => x.1^x.2)).prod'''),
api=[('TauCeti.Computational.PrimeIdealFactorCertificate.reconstruct','projection','The product is exactly the rational prime ideal.','theorem PrimeIdealFactorCertificate.reconstruct {K : Type*} [Field K] [NumberField K] {p : ℕ} (c : PrimeIdealFactorCertificate K p) : Ideal.span ({(p:NumberField.RingOfIntegers K)}:Set (NumberField.RingOfIntegers K))=(c.factors.map (fun x => x.1^x.2)).prod := by sorry'),
('TauCeti.Computational.PrimeIdealFactorCertificate.exponent_pos','projection','Every listed exponent is strictly positive.','theorem PrimeIdealFactorCertificate.exponent_pos {K : Type*} [Field K] [NumberField K] {p : ℕ} (c : PrimeIdealFactorCertificate K p) (x) (h : x∈c.factors) : 0<x.2 := by sorry'),
('TauCeti.Computational.PrimeIdealFactorCertificate.nonempty','other','For prime p the decomposition cannot be empty.','theorem PrimeIdealFactorCertificate.nonempty {K : Type*} [Field K] [NumberField K] {p : ℕ} (hp : p.Prime) (c : PrimeIdealFactorCertificate K p) : c.factors≠[] := by sorry')],
tests=[('TauCeti.Computational.test_prime_factor_Q','computation','A rational prime stays a single prime of exponent one over ℚ.','example (p : ℕ) (hp : p.Prime) : ∃ c : PrimeIdealFactorCertificate ℚ p, c.factors.length=1 ∧ ∀ x∈c.factors, x.2=1 := by sorry'),
('TauCeti.Computational.test_prime_factor_zero_exponent','non-example','A zero exponent cannot pad the output.','example {K : Type*} [Field K] [NumberField K] {p : ℕ} (c : PrimeIdealFactorCertificate K p) (I : Ideal (NumberField.RingOfIntegers K)) : (I,0)∉c.factors := by sorry'),
('TauCeti.Computational.test_prime_factor_bottom','degenerate','The zero ideal cannot occur.','example {K : Type*} [Field K] [NumberField K] {p : ℕ} (c : PrimeIdealFactorCertificate K p) (e : ℕ) : (⊥,e)∉c.factors := by sorry')],uses=[('CN.2 factor bases','Enumerate all prime ideals below a certified norm bound.'),('CN.2 local expansions','Fix the exact prime and ramification exponent being completed.')],planet='Prime-ideal certificate')
gap('Prime-ideal discovery at index divisors','Refine the reduced quotient algebra decomposition into primitive idempotents, finite-field quotient maps, lifted prime ideals, ramification exponents and the product reconstruction. The ordinary Kummer–Dedekind theorem requires p prime to the power-basis index; the certificate deliberately does not infer that condition from a factorization of the defining polynomial.',[primecert])

relation=add(2,'class-relation-lattice','Checked class-group relation lattice','definition',
'For n nonzero integral ideals I_i, classRelationLattice I is the integer submodule of ℤⁿ consisting of a with ∏[I_i]^(a_i)=1 in the native class group. A found relation matrix contributes a sublattice L contained in this kernel, certified by principal fractional-ideal generators. The relation kernel exists intrinsically; discovering rows does not show L equals it.',
 ['Use ClassGroup.mk0 for the ideal classes. Their product-of-powers map is a homomorphism from the additive integer coordinate module to the class group, written multiplicatively. Its kernel is closed under integer linear combinations.'],[classmap],[nr('§12, exact sequence and relation matrix, p.248','The found relation lattice is a sublattice of the full relation kernel.')],
 ('TauCeti.Computational.classRelationLattice','''def classRelationLattice {K : Type*} [Field K] [NumberField K] {n : ℕ}
 (I : Fin n → (Ideal (NumberField.RingOfIntegers K))⁰) : Submodule ℤ (Fin n → ℤ) := by sorry'''),
api=[('TauCeti.Computational.mem_classRelationLattice','characterisation','Membership is the exact ideal-class product equation.','''theorem mem_classRelationLattice {K : Type*} [Field K] [NumberField K] {n : ℕ}
 (I : Fin n → (Ideal (NumberField.RingOfIntegers K))⁰) (a : Fin n → ℤ) :
 a∈classRelationLattice I ↔ ∏ i, (ClassGroup.mk0 (I i))^(a i)=1 := by sorry'''),
('TauCeti.Computational.classRelationLattice_zero','simp','The zero vector is a relation.','theorem classRelationLattice_zero {K : Type*} [Field K] [NumberField K] {n : ℕ} (I : Fin n → (Ideal (NumberField.RingOfIntegers K))⁰) : (0:Fin n → ℤ)∈classRelationLattice I := by sorry'),
('TauCeti.Computational.classRelationLattice_neg','structure','A relation remains valid after negating all exponents.','theorem classRelationLattice_neg {K : Type*} [Field K] [NumberField K] {n : ℕ} (I : Fin n → (Ideal (NumberField.RingOfIntegers K))⁰) (a : Fin n → ℤ) : -a∈classRelationLattice I ↔ a∈classRelationLattice I := by sorry')],
tests=[('TauCeti.Computational.test_relations_empty','degenerate','For an empty factor base the unique exponent vector is a relation.','example {K : Type*} [Field K] [NumberField K] (I : Fin 0 → (Ideal (NumberField.RingOfIntegers K))⁰) : classRelationLattice I=⊤ := by sorry'),
('TauCeti.Computational.test_relations_unit_ideals','computation','A factor base consisting of unit ideals has the whole relation lattice.','example {K : Type*} [Field K] [NumberField K] (n : ℕ) : classRelationLattice (fun _ : Fin n => (1:(Ideal (NumberField.RingOfIntegers K))⁰))=⊤ := by sorry'),
('TauCeti.Computational.test_relations_subtraction','compatibility','Subtracting two checked relations is valid.','example {K : Type*} [Field K] [NumberField K] {n : ℕ} (I : Fin n → (Ideal (NumberField.RingOfIntegers K))⁰) (a b : Fin n → ℤ) (ha : a∈classRelationLattice I) (hb : b∈classRelationLattice I) : a-b∈classRelationLattice I := by sorry')],uses=[('CN.2 class-group certificates','Determines the quotient that a relation matrix approximates.'),('Stevenhagen §12','Makes the distinction between found and complete relations explicit.')])
relcover=add(2,'class-relation-quotient-cover','Relation quotient covers the class group','theorem',
'Let the classes of I₁,…,I_n generate Cl(K), and let L⊆classRelationLattice I be a full-rank integer submodule. Then the native class number divides the finite index [ℤⁿ:L]. The quotient ℤⁿ/L maps surjectively to Cl(K); equality of cardinalities is a separate completeness condition.',
 ['The class product map is surjective by factor-base generation. The inclusion L⊆kernel lets it descend to the quotient. A surjection of finite groups makes the target order divide the source order.'],[relation,classnum,snf],[nr('§12, formula for h′, p.248','The relation quotient order is an integer multiple of the true class number.')],
 ('TauCeti.Computational.classNumber_dvd_relation_index','''theorem classNumber_dvd_relation_index {K : Type*} [Field K] [NumberField K] {n : ℕ}
 (I : Fin n → (Ideal (NumberField.RingOfIntegers K))⁰) (L : Submodule ℤ (Fin n → ℤ))
 (hL : L≤classRelationLattice I)
 (hgen : Subgroup.closure (Set.range (fun i => ClassGroup.mk0 (I i)))=⊤)
 (hfin : Finite ((Fin n → ℤ) ⧸ L)) :
 NumberField.classNumber K ∣ Nat.card ((Fin n → ℤ) ⧸ L) := by sorry'''),acceptance=['A relation matrix of deficient rank yields an infinite quotient and cannot supply the positive stopping integer.'])
fb=add(2,'minkowski-factor-base-generation','Certified Minkowski factor-base generation','theorem',
'Let B be a nonnegative real number at least the native Minkowski bound for K. If a finite list I includes every nonzero prime ideal of norm at most B, its classes generate the class group. A larger rational upper bound is sufficient. Replacing it by a Bach-type logarithmic bound requires its stated GRH hypothesis and separate proof.',
 ['Take a small-norm ideal representative of each class using the native Minkowski theorem. Factor it into prime ideals. Every prime factor has norm at most that ideal’s norm, so all its factors occur in the list.'],[mink,primecert,classmap],[nr('§12, pp.245–248','An unconditional complete factor base comes from Minkowski, independent of relation discovery.')],
 ('TauCeti.Computational.minkowski_factorBase_generates','''theorem minkowski_factorBase_generates {K : Type*} [Field K] [NumberField K] {n : ℕ}
 (I : Fin n → (Ideal (NumberField.RingOfIntegers K))⁰) (B : ℝ)
 (hB : (4/Real.pi)^NumberField.InfinitePlace.nrComplexPlaces K *
 ((Module.finrank ℚ K).factorial / (Module.finrank ℚ K:ℝ)^(Module.finrank ℚ K) * Real.sqrt |(NumberField.discr K:ℝ)|) ≤ B)
 (hcover : ∀ P : (Ideal (NumberField.RingOfIntegers K))⁰, (P:Ideal (NumberField.RingOfIntegers K)).IsPrime →
 (Ideal.absNorm (P:Ideal (NumberField.RingOfIntegers K)):ℝ)≤B → P∈Set.range I) :
 Subgroup.closure (Set.range (fun i => ClassGroup.mk0 (I i)))=⊤ := by sorry'''),acceptance=['The prime list is exhaustive up to an upper bound; a random list of small ideals gives no surjectivity certificate.'],planet='Complete factor base')
add(2,'certified-class-unit-completeness','Certified completion of class and unit computations','theorem',
'With a complete factor base I, a checked full-rank relation sublattice L, and a full-logarithmic-rank unit family u, let h′=card(ℤⁿ/L). If h′·regOfFamily(u)<2·classNumber(K)·regulator(K), then h′ equals the class number and u together with all torsion units generates the unit group. The analytic bound must be certified by enclosing intervals and a rigorous remainder estimate; a numerical Euler-product guess is not a stopping certificate.',
 ['Combine factor-base generation, the relation-quotient divisibility theorem and the joint positive-integer bound. A separately validated lower bound on hR and upper bound on h′R′ can discharge the strict inequality without knowing h or R individually.'],[relcover,fb,joint], [nr('§12, pp.248–252','This is the actual joint completeness condition, with torsion retained.')],
 ('TauCeti.Computational.certified_class_unit_complete','''theorem certified_class_unit_complete {K : Type*} [Field K] [NumberField K] {n : ℕ}
 (I : Fin n → (Ideal (NumberField.RingOfIntegers K))⁰) (L : Submodule ℤ (Fin n → ℤ))
 (hL : L≤classRelationLattice I) (hgen : Subgroup.closure (Set.range (fun i => ClassGroup.mk0 (I i)))=⊤)
 (hfin : Finite ((Fin n → ℤ) ⧸ L))
 (u : Fin (NumberField.Units.rank K) → (NumberField.RingOfIntegers K)ˣ)
 (hu : NumberField.Units.IsMaxRank u)
 (hb : (Nat.card ((Fin n → ℤ) ⧸ L):ℝ)*NumberField.Units.regOfFamily u <
 2*(NumberField.classNumber K:ℝ)*NumberField.Units.regulator K) :
 Nat.card ((Fin n → ℤ) ⧸ L)=NumberField.classNumber K ∧
 Subgroup.closure (Set.range u) ⊔ NumberField.Units.torsion K=⊤ := by sorry'''),acceptance=['Every relation row must have a principal-ideal witness. Unit rank and torsion generators are separate checks.'])
gap('Effective class/unit discovery and analytic stopping','Split ideal factor-base enumeration, principal relation witnesses, HNF/SNF quotient order and unit extraction from the integer kernel. Decompose a rigorous residue/Euler-product tail bound for hR and directed regulator determinant enclosures. Discovery may be heuristic but returned completeness must be unconditional unless an explicit GRH assumption is attached. Existing rank-one upstream certificates do not supply this general-rank algorithm.',[relation,relcover,fb,nid(2,'certified-class-unit-completeness')])
phs=[src('GMN','§1.2, Definition 1.6, p.7','φ-adic development','Euclidean division by a monic positive-degree polynomial gives the exact expansion used by the residual polygon algorithm.')]
phi=add(2,'phi-adic-expansion','Exact φ-adic polynomial expansion','construction',
'For a commutative ring R and monic φ∈R[X] of positive degree m, phiExpansion φ f returns coefficients a_i∈R[X] of degree less than m, zero for i>floor(natDegree f/m), with f=Σa_iφ^i. It uses successive division by the monic polynomial φ; the coefficients are polynomials, not scalar coefficients of f. The zero polynomial has all coefficients zero.',
 ['Repeated monic quotient/remainder division lowers degree. The remainders are the a_i. Induction gives reconstruction, the degree bound and uniqueness.'],[],phs,
 ('TauCeti.Computational.phiExpansion','def phiExpansion {R : Type*} [CommRing R] (φ : Polynomial R) (hφ : φ.Monic) (hm : 0<φ.natDegree) (f : Polynomial R) : ℕ → Polynomial R := by sorry'),
api=[('TauCeti.Computational.phiExpansion_reconstruct','characterisation','The finite φ-adic sum is f.','theorem phiExpansion_reconstruct {R : Type*} [CommRing R] (φ : Polynomial R) (hφ : φ.Monic) (hm : 0<φ.natDegree) (f : Polynomial R) : f=∑ i∈Finset.range (f.natDegree/φ.natDegree+1), phiExpansion φ hφ hm f i*φ^i := by sorry'),
('TauCeti.Computational.phiExpansion_degree','projection','Each coefficient has degree strictly below deg φ.','theorem phiExpansion_degree {R : Type*} [CommRing R] (φ : Polynomial R) (hφ : φ.Monic) (hm : 0<φ.natDegree) (f : Polynomial R) (i : ℕ) : (phiExpansion φ hφ hm f i).natDegree<φ.natDegree := by sorry'),
('TauCeti.Computational.phiExpansion_eventually_zero','simp','Indices beyond the quotient-degree bound have zero coefficient.','theorem phiExpansion_eventually_zero {R : Type*} [CommRing R] (φ : Polynomial R) (hφ : φ.Monic) (hm : 0<φ.natDegree) (f : Polynomial R) (i : ℕ) (hi : f.natDegree/φ.natDegree<i) : phiExpansion φ hφ hm f i=0 := by sorry')],
tests=[('TauCeti.Computational.test_phi_zero','degenerate','The expansion of zero is identically zero.','example (φ : Polynomial ℤ) (hφ : φ.Monic) (hm : 0<φ.natDegree) : phiExpansion φ hφ hm 0=0 := by sorry'),
('TauCeti.Computational.test_phi_X','compatibility','For φ=X the coefficients are the constant polynomials C(f.coeff i).','example (f : Polynomial ℤ) (i : ℕ) : phiExpansion X (by sorry) (by sorry) f i=C (f.coeff i) := by sorry'),
('TauCeti.Computational.test_phi_shift','computation','For φ=X−1, X² has coefficients 1,2,1.','example : phiExpansion (X-1:Polynomial ℤ) (by sorry) (by sorry) (X^2) 1=C 2 := by sorry')],uses=[('GMN Definition 1.6','The valuations of polynomial coefficients a_i determine the φ-polygon.'),('CN.2 local prime decomposition','Supports residual factorization beyond ordinary coefficient Newton polygons.')],planet='φ-adic expansion')
phval=add(2,'phi-coefficient-valuation','Valuation of a φ-coefficient','definition',
'For prime p and a∈ℤ[X], coefficientValuation p a is infinity if a=0, and otherwise the minimum v_p(a_i) over the nonzero coefficients. It uses WithTop ℕ, so the zero polynomial has infinite valuation; the native default v_p(0)=0 is never inserted into the minimum.',
 ['Take the finite minimum over the support of a, with top for the empty support. This is the Gauss valuation used only to compute the points of the φ-adic polygon. The general ordinary Newton-polygon theory remains CA.3.'],[phi,valrat],[src('GMN','§1.2, p.7','min','The coefficientwise valuation on integral polynomials, including zero at infinity.')],
 ('TauCeti.Computational.coefficientValuation','def coefficientValuation (p : ℕ) (a : Polynomial ℤ) : WithTop ℕ := by sorry'),
api=[('TauCeti.Computational.coefficientValuation_zero','simp','Zero has infinite valuation.','theorem coefficientValuation_zero (p : ℕ) : coefficientValuation p 0=⊤ := by sorry'),
('TauCeti.Computational.coefficientValuation_const','compatibility','A nonzero constant has its usual integer valuation.','theorem coefficientValuation_const (p : ℕ) (a : ℤ) (ha : a≠0) : coefficientValuation p (C a)=((padicValInt p a:ℕ):WithTop ℕ) := by sorry'),
('TauCeti.Computational.coefficientValuation_ge_iff','characterisation','A lower valuation bound means coefficientwise divisibility by p^N.','theorem coefficientValuation_ge_iff (p : ℕ) (hp : p.Prime) (a : Polynomial ℤ) (N : ℕ) : (N:WithTop ℕ)≤coefficientValuation p a ↔ ∀ i, (p:ℤ)^N∣a.coeff i := by sorry')],
tests=[('TauCeti.Computational.test_gauss_zero','degenerate','The zero polynomial gives top.','example : coefficientValuation 3 0=⊤ := by sorry'),
('TauCeti.Computational.test_gauss_three','computation','3X+9 has 3-adic coefficient valuation 1.','example : coefficientValuation 3 (C 3*X+C 9)=1 := by sorry'),
('TauCeti.Computational.test_gauss_missing_coefficient','non-example','X² has valuation zero, regardless of its zero constant coefficient.','example : coefficientValuation 3 (X^2)=0 := by sorry')],uses=[('CN.2 residual polygon','Builds lower polygon data with the correct infinite coefficient convention.')])
gap('Higher-order Newton and residual factorization targets','The target chain is GMN Definition 1.8 principal polygon, Definition 1.9 residual coefficients, residual polynomial on each slope −h/e, product theorem 1.13, polygon theorem 1.15, residual factor theorem 1.19, higher-order types (§2) and the index theorem 4.18. Their target nodes and general complete discretely valued base-field signatures still need to be added. This pass has read the first-order proofs through Theorem 1.19, not the complete higher-order proof. The geometric negative slopes must be compared to CA.3’s positive root-valuation convention; they are not the same declaration.',[phi,phval,primecert])
lr0=req('tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-0-local-fields-and-their-finite-extensions','Reuse the complete discretely valued field, uniformizer, residue-field representatives and their lifting/expansion theorem. CN.2 supplies finite coordinate certificates and verifies the remainder; it does not construct a second local field or valuation.',[nid(2,'local-expansion-certificate')])
localcert=add(2,'local-expansion-certificate','Finite local expansion certificate','definition',
'For a normed field L, chosen nonzero uniformizer π with ‖π‖<1, element x and digit count N, a LocalExpansionCertificate stores an integer initial exponent v, digits d₀,…,dₙ₋₁ of norm at most one, and a proved remainder bound ‖x−π^vΣd_iπ^i‖≤‖π‖^(v+N). Intrinsic local-field structure and residue representatives come from the owner. Without a fixed residue section these finite digits are not canonical; equality of decoded approximations is not asserted to imply equality of digits.',
 ['Store exact native field elements and the norm inequality. Constructing digits uses the imported residue lifting theorem. Comparing coordinate or quotient computations with x must preserve the chosen prime, embedding and uniformizer normalization.'],[lr0,pa,primecert],[src('CarusoPublished','§2.1.1, pp.17–19','precision','The finite p-adic remainder convention extends to a supplied discretely valued local field; field structure and residue lifts are imported.')],
 ('TauCeti.Computational.LocalExpansionCertificate','''structure LocalExpansionCertificate (L : Type*) [NormedField L] (π x : L) (N : ℕ) where
 valuation : ℤ
 digits : Fin N → L
 integral : ∀ i, ‖digits i‖≤1
 remainder : ‖x-π^valuation*(∑ i, digits i*π^i.val)‖≤‖π‖^(valuation+(N:ℤ))'''),
api=[('TauCeti.Computational.LocalExpansionCertificate.center','projection','The exact finite centre is π^v times the digit polynomial.','def LocalExpansionCertificate.center {L : Type*} [NormedField L] {π x : L} {N : ℕ} (c : LocalExpansionCertificate L π x N) : L := π^c.valuation*(∑ i, c.digits i*π^i.val)'),
('TauCeti.Computational.LocalExpansionCertificate.error_bound','compatibility','The supplied exact x lies in the certified local ball.','theorem LocalExpansionCertificate.error_bound {L : Type*} [NormedField L] {π x : L} {N : ℕ} (c : LocalExpansionCertificate L π x N) : ‖x-c.center‖≤‖π‖^(c.valuation+(N:ℤ)) := by sorry'),
('TauCeti.Computational.LocalExpansionCertificate.integral_digits','projection','Every exact digit has norm at most one.','theorem LocalExpansionCertificate.integral_digits {L : Type*} [NormedField L] {π x : L} {N : ℕ} (c : LocalExpansionCertificate L π x N) (i : Fin N) : ‖c.digits i‖≤1 := by sorry')],
tests=[('TauCeti.Computational.test_local_zero','degenerate','Zero has a certificate with zero digits at every finite length.','example {L : Type*} [NormedField L] (π : L) (hπ : π≠0) (N : ℕ) : ∃ c : LocalExpansionCertificate L π 0 N, c.valuation=0 ∧ c.digits=0 := by sorry'),
('TauCeti.Computational.test_local_inverse_uniformizer','computation','π⁻¹ has a length-one exact expansion with initial exponent −1 and digit 1.','example {L : Type*} [NormedField L] (π : L) (hπ : π≠0) : ∃ c : LocalExpansionCertificate L π π⁻¹ 1, c.valuation= -1 ∧ c.digits 0=1 := by sorry'),
('TauCeti.Computational.test_local_false_zero_approximation','non-example','A precision-one zero centre at v=0 cannot represent 1 when ‖π‖<1.','example {L : Type*} [NormedField L] (π : L) (hπ : ‖π‖<1) : ¬∃ c : LocalExpansionCertificate L π 1 1, c.valuation=0 ∧ c.digits=0 := by sorry')],uses=[('CN.2 local expansions','Checks finite coefficients against an intrinsic local value.'),('CN.4 error propagation','Makes the exact local remainder available independently of digit discovery.')],planet='Local expansion certificate')
gap('Finite local-expansion factory and presentation comparison','Instantiate the imported uniformizer/residue-section theorem on each certified completion and finite residue-field presentation, then implement digit extraction with its termination and remainder proof. Add change-of-uniformizer and embedding comparisons. The present certificate type alone is not an extraction algorithm and does not impose canonical digits without a section.',[localcert])
```

## Script: cn3.py

```python
stein=lambda loc,match:src('Stein',loc,'Miller basis',match)
dim=base('mathlib:ModularForm.dimension_level_one','Mathlib/NumberTheory/ModularForms/LevelOne/DimensionFormula.lean','Dimension of level-one modular forms of even natural weight; the k≡2 mod12 branch is retained.')
sturm=base('mathlib:ModularForm.sturm_bound_levelOne_nat','Mathlib/NumberTheory/ModularForms/LevelOne/DimensionFormula.lean','A natural-weight level-one modular form with q-order greater than floor(k/12) is zero.')
CODE.append('open scoped MatrixGroups\nopen UpperHalfPlane ModularForm\n')

ml=add(3,'integral-q-expansion-lattice','Integral q-expansion lattice','definition',
'For integer weight k, integralModularLattice k is the ℤ-submodule of ModularForm SL₂(ℤ) k consisting of forms whose width-one q-expansion coefficients all belong to the image of ℤ in ℂ. This is a coefficient lattice inside the space of forms. It is distinct from the upstream integral modular-symbol module, which lives on the homological side.',
['Use the existing modular-form carrier and q-expansion. Close the integral coefficient condition under addition and integer scalar multiplication.'],[dim,sturm],[stein('Lemma 2.20 and Remark 2.21, pp.20–21','Defines the integral structure whose explicit basis is certified; keep cusp and full modular spaces distinct.')],
('TauCeti.Computational.integralModularLattice','def integralModularLattice (k : ℤ) : Submodule ℤ (ModularForm 𝒮ℒ k) := by sorry'),
api=[('TauCeti.Computational.mem_integralModularLattice','characterisation','Membership is integrality of every q coefficient.','theorem mem_integralModularLattice (k : ℤ) (f : ModularForm 𝒮ℒ k) : f∈integralModularLattice k ↔ ∀ n, ∃ a : ℤ, (qExpansion 1 f).coeff n=(a:ℂ) := by sorry'),
('TauCeti.Computational.integralModularLattice_zero','simp','The zero form is integral.','theorem integralModularLattice_zero (k : ℤ) : (0:ModularForm 𝒮ℒ k)∈integralModularLattice k := by sorry'),
('TauCeti.Computational.integralModularLattice_ext','extensionality','Elements agree if their underlying modular forms agree.','theorem integralModularLattice_ext (k : ℤ) (f g : integralModularLattice k) (h : (f:ModularForm 𝒮ℒ k)=(g:ModularForm 𝒮ℒ k)) : f=g := by sorry')],
tests=[('TauCeti.Computational.test_integral_modular_zero','degenerate','Zero is in the weight-zero lattice.','example : (0:ModularForm 𝒮ℒ 0)∈integralModularLattice 0 := by sorry'),
('TauCeti.Computational.test_integral_E4','compatibility','Mathlib’s unit-constant E₄ is integral.','example : ModularForm.E₄∈integralModularLattice 4 := by sorry'),
('TauCeti.Computational.test_half_E4','non-example','One half of E₄ is not integral because its constant term is 1/2.','example : ((1/2:ℂ) • ModularForm.E₄)∉integralModularLattice 4 := by sorry')],uses=[('BCG §2.3','Reduction of the normalized level-one form modulo 107.'),('CN.3 congruence certificates','Defines integrality before reducing q-expansions.')],planet='Integral q-expansion lattice')

sl=add(3,'integral-cusp-lattice','Integral cusp-form lattice','definition',
'integralCuspLattice k is the ℤ-submodule of CuspForm SL₂(ℤ) k consisting of forms with every width-one q coefficient in ℤ⊆ℂ. Its inclusion in the modular-form coefficient lattice is the native cusp-to-modular inclusion. It contains no Eisenstein summand.',
['Restrict the integral q-coefficient condition to the native cusp-form carrier.'],[ml],[stein('Lemma 2.20, pp.20–21','The Miller basis is a basis of cusp forms with integral coefficients.')],
('TauCeti.Computational.integralCuspLattice','def integralCuspLattice (k : ℤ) : Submodule ℤ (CuspForm 𝒮ℒ k) := by sorry'),
api=[('TauCeti.Computational.mem_integralCuspLattice','characterisation','Membership is integrality of all coefficients.','theorem mem_integralCuspLattice (k : ℤ) (f : CuspForm 𝒮ℒ k) : f∈integralCuspLattice k ↔ ∀ n, ∃ a : ℤ, (qExpansion 1 f).coeff n=(a:ℂ) := by sorry'),
('TauCeti.Computational.integralCuspLattice_coeff_zero','compatibility','Its constant coefficient is zero by native cuspidality.','theorem integralCuspLattice_coeff_zero (k : ℤ) (f : integralCuspLattice k) : (qExpansion 1 (f:CuspForm 𝒮ℒ k)).coeff 0=0 := by sorry'),
('TauCeti.Computational.integralCuspLattice_ext','extensionality','Equality is equality of underlying cusp forms.','theorem integralCuspLattice_ext (k : ℤ) (f g : integralCuspLattice k) (h : (f:CuspForm 𝒮ℒ k)=(g:CuspForm 𝒮ℒ k)) : f=g := by sorry')],
tests=[('TauCeti.Computational.test_integral_delta','computation','The normalized discriminant is in the weight-12 lattice.','example : CuspForm.discriminant∈integralCuspLattice 12 := by sorry'),
('TauCeti.Computational.test_cusp_weight_zero','degenerate','The weight-zero cusp lattice is zero.','example : integralCuspLattice 0=⊥ := by sorry'),
('TauCeti.Computational.test_half_delta','non-example','One half of Δ fails integrality at the first coefficient.','example : ((1/2:ℂ) • CuspForm.discriminant)∉integralCuspLattice 12 := by sorry')],uses=[('Stein Algorithm 2.18','Integral triangular elimination.'),('BCG Remark 3.3','Integral Hecke matrices reduced modulo a prime.')])

miller=add(3,'miller-basis','Integral Miller basis','construction',
'For even k∈ℕ and d=dimℂ S_k(SL₂(ℤ)), millerBasis k is a ℤ-basis f₁,…,f_d of integralCuspLattice k satisfying a_j(f_i)=δ_ij for 1≤i,j≤d. Use unit-constant F₄=1+240Σσ₃(n)qⁿ and F₆=1−504Σσ₅(n)qⁿ. They agree with Mathlib E₄,E₆; Stein’s unnormalized symbols require his scaling factors.',
['Choose a,b≥0 with 4a+6b≤14 and congruent to k modulo 12, choosing a=b=0 when k≡0. The forms Δ^j F₆^(2(d−j)+b) F₄^a have leading coefficient 1 at q^j. Integral triangular elimination gives the Kronecker first-d coefficients. The native dimension bound shows these span over ℂ; the leading coefficients then force integral coordinates for each integral cusp form.'],[sl,dim,sturm],[stein('Algorithm 2.18 and Lemma 2.20, pp.19–21','Constructs the unitriangular integral basis, with normalization explicit.')],
('TauCeti.Computational.millerBasis','''def millerBasis (k : ℕ) (hk : Even k) :
 Basis (Fin (Module.finrank ℂ (CuspForm 𝒮ℒ (k:ℤ)))) ℤ (integralCuspLattice (k:ℤ)) := by sorry'''),
api=[('TauCeti.Computational.millerBasis_coeff','characterisation','The first d positive coefficients form the identity matrix.','''theorem millerBasis_coeff (k : ℕ) (hk : Even k)
 (i j : Fin (Module.finrank ℂ (CuspForm 𝒮ℒ (k:ℤ)))) :
 (qExpansion 1 ((millerBasis k hk i : integralCuspLattice (k:ℤ)):CuspForm 𝒮ℒ (k:ℤ))).coeff (j.val+1)
 = if i=j then 1 else 0 := by sorry'''),
('TauCeti.Computational.millerBasis_repr','projection','The i-th integral coordinate is the (i+1)-st q coefficient.','''theorem millerBasis_repr (k : ℕ) (hk : Even k) (f : integralCuspLattice (k:ℤ))
 (i : Fin (Module.finrank ℂ (CuspForm 𝒮ℒ (k:ℤ)))) :
 (((millerBasis k hk).repr f i : ℤ):ℂ) = (qExpansion 1 (f:CuspForm 𝒮ℒ (k:ℤ))).coeff (i.val+1) := by sorry'''),
('TauCeti.Computational.millerBasis_unique','extensionality','A basis with the same first-d coefficient normalization is this basis.','''theorem millerBasis_unique (k : ℕ) (hk : Even k)
 (b : Basis (Fin (Module.finrank ℂ (CuspForm 𝒮ℒ (k:ℤ)))) ℤ (integralCuspLattice (k:ℤ)))
 (h : ∀ i j, (qExpansion 1 (b i:CuspForm 𝒮ℒ (k:ℤ))).coeff (j.val+1) = if i=j then 1 else 0) : b=millerBasis k hk := by sorry''')],
tests=[('TauCeti.Computational.test_miller_weight_zero','degenerate','At weight zero the basis index type is empty.','example : Module.finrank ℂ (CuspForm 𝒮ℒ 0)=0 := by sorry'),
('TauCeti.Computational.test_miller_delta','computation','At weight 12 the sole basis form is Δ.','example (i : Fin (Module.finrank ℂ (CuspForm 𝒮ℒ (12:ℤ)))) : (millerBasis 12 (by sorry) i : CuspForm 𝒮ℒ 12) = CuspForm.discriminant := by sorry'),
('TauCeti.Computational.test_miller_weight_two','non-example','Weight two has no cusp basis vector.','example : Module.finrank ℂ (CuspForm 𝒮ℒ 2)=0 := by sorry')],uses=[('BCG weight 38 and 82 examples','Build integral matrices before reduction modulo p.'),('Stein Lemma 2.20','Makes the integral coordinate lattice explicit.')],planet='Miller basis')
gap('Miller basis proof refinements','Promote normalized E₄/E₆ and Δ coefficient integrality, the exact dimension-compatible monomial family, its leading q powers, and integral unitriangular elimination to prerequisite lemmas. The full modular lattice needs an Eisenstein generator with the correct denominator normalization; a cusp basis does not supply it.',[miller,ml,sl])

sturmMod=add(3,'level-one-congruence-sturm','Level-one congruence Sturm bound','theorem',
'Let k∈ℕ and f belong to integralModularLattice k. For a prime p, if every coefficient a_n(f) for 0≤n≤floor(k/12) is divisible by p, then every coefficient is divisible by p. This is a congruence statement in the integral lattice, not the characteristic-zero identity theorem.',
['Use the integral triangular basis at level one to propagate divisibility from the initial coefficients to all integral coordinates. Stein’s alternative proof uses the integral polynomial-in-j expansion and multiplication by Δ. The full modular integral basis is an explicit missing input, recorded rather than inferred from the complex Sturm theorem.'],[ml,sturm,miller],[stein('Theorem 9.18, pp.171–172, level-one case','Congruence vanishing with the prime-ideal reduction condition.')],
('TauCeti.Computational.levelOne_congruence_sturm','''theorem levelOne_congruence_sturm (k p : ℕ) (hp : Nat.Prime p)
 (f : integralModularLattice (k:ℤ))
 (h : ∀ n≤k/12, ∃ a : ℤ, (p:ℤ)∣a ∧ (qExpansion 1 (f:ModularForm 𝒮ℒ (k:ℤ))).coeff n=(a:ℂ)) :
 ∀ n, ∃ a : ℤ, (p:ℤ)∣a ∧ (qExpansion 1 (f:ModularForm 𝒮ℒ (k:ℤ))).coeff n=(a:ℂ) := by sorry'''),acceptance=['The bound includes the constant coefficient. Congruence to zero is not equality to zero as a complex modular form.'],planet='Congruence Sturm bound')
gap('Full-level modular lattice congruence proof','The source proof and corrected signs have been read, but its integral polynomial-in-j lemma and the full modular integral basis must be split before the level-one congruence proof closes. General congruence subgroups also require the algebraic q-expansion principle, bounded denominators and cusp rationality from their owner.',[sturmMod])

bcg=add(3,'weight-26-coefficient-107','The coefficient at 107 of ΔE₄²E₆','application',
'With the unit-constant Mathlib E₄,E₆ and normalized discriminant Δ, the coefficient at q^107 of ΔE₄²E₆ equals 35830422465487817813321292. This exact integer is −1 modulo 107. The coefficient theorem certifies ordinarity once the existing eigenform and reduction interfaces are supplied.',
['Use the exact integral coefficient formulas and truncate products beyond degree 107. Multiply over ℤ, then compare the resulting coefficient through the native q-expansion multiplication map. The finite convolution certificate is checked independently of any CAS label.'],[ml,sl],[src('BCG','§2.3, proof of Theorem 2.4, p.515','a107(f)','The stated exact coefficient and ordinary reduction, with unit-constant Eisenstein normalization.')],
('TauCeti.Computational.weight26_coeff_107','''theorem weight26_coeff_107 :
 (qExpansion 1 (fun z : ℍ => ModularForm.discriminant z * ModularForm.E₄ z ^ 2 * ModularForm.E₆ z)).coeff 107
 = (35830422465487817813321292:ℂ) := by sorry'''),acceptance=['The first coefficients are 1, −48, −195804; changing Eisenstein normalization fails these checks.'])
add(3,'weight-26-ordinary-107','Ordinary reduction at 107','lemma',
'The certified coefficient 35830422465487817813321292 reduces to −1 in ZMod 107, hence is nonzero.',
['Reduce the exact numeral modulo 107. This arithmetic check uses the certified coefficient theorem for its interpretation as a Hecke eigenvalue.'],[bcg],[src('BCG','§2.3, p.515','a107(f)','Separates exact coefficient recovery from its short modular check.')],
('TauCeti.Computational.weight26_ordinary_107','theorem weight26_ordinary_107 : (35830422465487817813321292:ZMod 107) = -1 := by sorry'),acceptance=['107 is prime; the residue equals 106.'])

gap('Remaining modular and curve targets','Add the exact Hecke matrix adapter and its level/character convention, modular-symbol data import, owner-provided point counts, isogenies and descent outputs, the weight-82 companion congruence, weight-38 nonordinary certificate at 79, exhaustive small-prime checks, and the corrected Remark 3.3 lists. Two separate T₂/T₃ characteristic-polynomial roots do not identify a common eigensystem or a companion form. General congruence Sturm bounds need the owner’s integral q-expansion principle.',[f'{RID}:CN.3'])
```

## Script: cn3_extra.py

```python
mf8='tauceti:TauCetiRoadmap/ModularForms#layer-8-modular-symbols-the-integral-hecke-algebra-and-coefficient-fields'
mf9='tauceti:TauCetiRoadmap/ModularForms#layer-9-the-lmfdb-invariant-layer'
mf11='tauceti:TauCetiRoadmap/ModularForms#layer-11-the-eichlerselberg-trace-formula-level-one'
rec=base('tauceti:HeckeRing.GL2.qExpansion_coeff_heckeSlashGamma1CuspFormEnd_diagCosetGamma1_of_mem_cuspFormCharSpace','TauCeti/NumberTheory/ModularForms/HeckeSlash/Recurrence.lean','Good-prime coefficient recurrence with nebentypus; requires prime p, coprime(p,N), and membership in the specified character space. Level-one specialization has trivial character.')
hr=add(3,'level-one-prime-recurrence','Level-one Hecke recurrence contract','definition',
'For natural k≥2 and prime p, HasLevelOnePrimeRecurrence k p T records the coefficient formula a_m(Tf)=a_pm(f)+p^(k−1)a_(m/p)(f) when p∣m, with second term zero otherwise, for every level-one cusp form f. T is a supplied complex linear endomorphism on the native space. The canonical operator comes from the upstream Hecke action and its pinned coefficient theorem; this predicate only specifies the computational comparison.',
 ['State the native recurrence on the level-one cusp space after identifying Γ₁(1) with SL₂(ℤ). Keep p and k explicit.'],[rec,sl], [stein('Chapter 2, Hecke action; Lemma 2.20','The coefficient recurrence in an integral basis determines exact matrices.')],
 ('TauCeti.Computational.HasLevelOnePrimeRecurrence','''def HasLevelOnePrimeRecurrence (k p : ℕ) (T : Module.End ℂ (CuspForm 𝒮ℒ (k:ℤ))) : Prop :=
 ∀ (f : CuspForm 𝒮ℒ (k:ℤ)) (m : ℕ), (qExpansion 1 (T f)).coeff m=
 (qExpansion 1 f).coeff (p*m) + if p∣m then (p:ℂ)^(k-1)*(qExpansion 1 f).coeff (m/p) else 0'''),
api=[('TauCeti.Computational.heckeRecurrence_coeff_one','simp','The first coefficient of T_p f is a_p(f) for p>1.','theorem heckeRecurrence_coeff_one (k p : ℕ) (hp : 1<p) (T : Module.End ℂ (CuspForm 𝒮ℒ (k:ℤ))) (h : HasLevelOnePrimeRecurrence k p T) (f : CuspForm 𝒮ℒ (k:ℤ)) : (qExpansion 1 (T f)).coeff 1=(qExpansion 1 f).coeff p := by sorry'),
('TauCeti.Computational.heckeRecurrence_unique','extensionality','At fixed k,p the recurrence determines the endomorphism uniquely.','theorem heckeRecurrence_unique (k p : ℕ) (T U : Module.End ℂ (CuspForm 𝒮ℒ (k:ℤ))) (hT : HasLevelOnePrimeRecurrence k p T) (hU : HasLevelOnePrimeRecurrence k p U) : T=U := by sorry'),
('TauCeti.Computational.heckeRecurrence_preserves_integrality','compatibility','The endomorphism preserves the integral cusp lattice.','theorem heckeRecurrence_preserves_integrality (k p : ℕ) (T : Module.End ℂ (CuspForm 𝒮ℒ (k:ℤ))) (h : HasLevelOnePrimeRecurrence k p T) (f : CuspForm 𝒮ℒ (k:ℤ)) (hf : f∈integralCuspLattice (k:ℤ)) : T f∈integralCuspLattice (k:ℤ) := by sorry')],
tests=[('TauCeti.Computational.test_hecke_weight_two','degenerate','The zero-dimensional weight-two space has the zero endomorphism satisfying the recurrence.','example : HasLevelOnePrimeRecurrence 2 2 0 := by sorry'),
('TauCeti.Computational.test_hecke_delta','computation','At weight 12 and p=2, T₂ acts by −24.','example : HasLevelOnePrimeRecurrence 12 2 ((-24:ℂ) • (LinearMap.id:Module.End ℂ (CuspForm 𝒮ℒ 12))) := by sorry'),
('TauCeti.Computational.test_hecke_zero_wrong','non-example','The zero endomorphism does not represent T₂ at weight 12.','example : ¬HasLevelOnePrimeRecurrence 12 2 0 := by sorry')],uses=[('BCG computations','Turns finite coefficient computations into the matrix of the actual Hecke operator.'),('CN.3 basis changes','Prevents a matrix from being certified against an unspecified operator.')])
hmat=add(3,'integral-hecke-matrix','Integral Hecke matrix in the Miller basis','construction',
'For even k≥2, prime p and an endomorphism T satisfying the level-one recurrence, integralHeckeMatrix k p T is its integer matrix in the Miller basis, using column vectors. Entry (i,j) is a_(i+1)(T f_j), uniquely read as an integer; the recurrence computes it from coefficients of f_j through degree p·d. It represents an operator on the forms lattice, distinct from the dual modular-symbol matrix.',
 ['The recurrence preserves the integral cusp lattice. Restrict T to a ℤ-linear map and apply the native matrix-of-linear-map construction to the Miller basis. Its first-d coefficient property gives the entry formula.'],[hr,miller],[stein('Lemma 2.20 and the Hecke coefficient recurrence','Exact integer coordinates precede reduction modulo a prime.')],
 ('TauCeti.Computational.integralHeckeMatrix','''def integralHeckeMatrix (k p : ℕ) (hk : Even k)
 (T : Module.End ℂ (CuspForm 𝒮ℒ (k:ℤ))) (hT : HasLevelOnePrimeRecurrence k p T) :
 Matrix (Fin (Module.finrank ℂ (CuspForm 𝒮ℒ (k:ℤ)))) (Fin (Module.finrank ℂ (CuspForm 𝒮ℒ (k:ℤ)))) ℤ := by sorry'''),
api=[('TauCeti.Computational.integralHeckeMatrix_entry','characterisation','Column j consists of the integral coefficients a_(i+1)(T f_j).','''theorem integralHeckeMatrix_entry (k p : ℕ) (hk : Even k)
 (T : Module.End ℂ (CuspForm 𝒮ℒ (k:ℤ))) (hT : HasLevelOnePrimeRecurrence k p T)
 (i j : Fin (Module.finrank ℂ (CuspForm 𝒮ℒ (k:ℤ)))) :
 ((integralHeckeMatrix k p hk T hT i j:ℤ):ℂ)=
 (qExpansion 1 (T (millerBasis k hk j:CuspForm 𝒮ℒ (k:ℤ)))).coeff (i.val+1) := by sorry'''),
('TauCeti.Computational.integralHeckeMatrix_repr','compatibility','The matrix acts on the native integer coordinate column of every lattice form.','''theorem integralHeckeMatrix_repr (k p : ℕ) (hk : Even k)
 (T : Module.End ℂ (CuspForm 𝒮ℒ (k:ℤ))) (hT : HasLevelOnePrimeRecurrence k p T)
 (f g : integralCuspLattice (k:ℤ)) (hg : (g:CuspForm 𝒮ℒ (k:ℤ))=T (f:CuspForm 𝒮ℒ (k:ℤ))) :
 (millerBasis k hk).repr g=Finsupp.equivFunOnFinite.symm ((integralHeckeMatrix k p hk T hT).mulVec (fun i => (millerBasis k hk).repr f i)) := by sorry'''),
('TauCeti.Computational.integralHeckeMatrix_unique','extensionality','The coefficient comparison uniquely determines the integer matrix.','''theorem integralHeckeMatrix_unique (k p : ℕ) (hk : Even k)
 (T : Module.End ℂ (CuspForm 𝒮ℒ (k:ℤ))) (hT : HasLevelOnePrimeRecurrence k p T)
 (A : Matrix (Fin (Module.finrank ℂ (CuspForm 𝒮ℒ (k:ℤ)))) (Fin (Module.finrank ℂ (CuspForm 𝒮ℒ (k:ℤ)))) ℤ)
 (hA : ∀ i j, (A i j:ℂ)=(qExpansion 1 (T (millerBasis k hk j:CuspForm 𝒮ℒ (k:ℤ)))).coeff (i.val+1)) : A=integralHeckeMatrix k p hk T hT := by sorry''')],
tests=[('TauCeti.Computational.test_hecke_matrix_empty','degenerate','The weight-two matrix has dimension zero and determinant one.','example (T : Module.End ℂ (CuspForm 𝒮ℒ 2)) (hT : HasLevelOnePrimeRecurrence 2 2 T) : (integralHeckeMatrix 2 2 (by sorry) T hT).det=1 := by sorry'),
('TauCeti.Computational.test_hecke_matrix_delta','computation','The weight-12 T₂ determinant is −24.','example (T : Module.End ℂ (CuspForm 𝒮ℒ 12)) (hT : HasLevelOnePrimeRecurrence 12 2 T) : (integralHeckeMatrix 12 2 (by sorry) T hT).det= -24 := by sorry'),
('TauCeti.Computational.test_hecke_matrix_ordinary','non-example','At p=2, weight 12 is nonordinary: −24 reduces to zero.','example : (-24:ZMod 2)=0 := by sorry')],uses=[('BCG Remark 3.3','Exact finite determinant computations before reduction.'),('CN.3 reproducible Hecke data','Every matrix is compared with a named intrinsic operator.')],planet='Certified Hecke matrix')
add(3,'weight-38-nonordinary-determinant','Nonordinary determinant at weight 38 and prime 79','application',
'The determinant of the level-one T₇₉ matrix on the integral weight-38 cusp lattice is divisible by 79. Together with the imported simultaneous eigenform and reduction theorem, this yields a characteristic-zero eigenform with a₇₉ in a prime above 79. Also gcd(37,80)=1. The determinant statement alone is kept separate from that eigenform-lifting input.',
 ['Construct the dimension-two Miller basis, compute the recurrence through degree 158, and reduce its exact integer determinant modulo 79. Use the upstream Hecke eigenform decomposition to interpret singular reduction.'],[hmat], [src('BCG','Corollary 3.2 proof, p.518','non-ordinary','The finite determinant witness for the routed weight-38 example.')],
 ('TauCeti.Computational.weight38_nonordinary_det','''theorem weight38_nonordinary_det (T : Module.End ℂ (CuspForm 𝒮ℒ 38))
 (hT : HasLevelOnePrimeRecurrence 38 79 T) :
 ((integralHeckeMatrix 38 79 (by sorry) T hT).det:ZMod 79)=0 ∧ Nat.Coprime 37 80 := by sorry'''),acceptance=['The exact matrix must be reconstructed; a stored floating determinant is insufficient.'])
nonord=add(3,'nonordinary-level-one-pair','Certified nonordinary weight-prime pair','definition',
'NonordinaryLevelOnePair k p means p is prime, k≥2 is even, and the determinant of an integral matrix for the intrinsic level-one T_p action on S_k vanishes modulo p. The matrix must satisfy the complete coefficient recurrence, which determines the operator uniquely. To export existence of a characteristic-zero eigenform with nonordinary reduction, use the owner’s integral Hecke eigensystem and lifting theorem.',
 ['Use the matrix construction and reduce its integer determinant into ZMod p. The empty matrix has determinant one, so zero-dimensional spaces never pass.'],[hmat,hr],[src('BCG','Corollary 3.2 and Remark 3.3, p.518','non-ordinary','Exact determinant criterion for the finite computations; the Galois interpretation is imported.')],
 ('TauCeti.Computational.NonordinaryLevelOnePair','''def NonordinaryLevelOnePair (k p : ℕ) : Prop :=
 p.Prime ∧ 2≤k ∧ ∃ hk : Even k, ∃ T : Module.End ℂ (CuspForm 𝒮ℒ (k:ℤ)),
 ∃ hT : HasLevelOnePrimeRecurrence k p T, ((integralHeckeMatrix k p hk T hT).det:ZMod p)=0'''),
api=[('TauCeti.Computational.nonordinary_pair_prime','projection','A certified pair has prime residue characteristic.','theorem nonordinary_pair_prime {k p : ℕ} (h : NonordinaryLevelOnePair k p) : p.Prime := by sorry'),
('TauCeti.Computational.nonordinary_pair_even','projection','A certified pair has even positive weight.','theorem nonordinary_pair_even {k p : ℕ} (h : NonordinaryLevelOnePair k p) : Even k ∧ 2≤k := by sorry'),
('TauCeti.Computational.nonordinary_pair_nonzero_dimension','other','The cusp space of a certified pair has positive dimension.','theorem nonordinary_pair_nonzero_dimension {k p : ℕ} (h : NonordinaryLevelOnePair k p) : 0<Module.finrank ℂ (CuspForm 𝒮ℒ (k:ℤ)) := by sorry')],
tests=[('TauCeti.Computational.test_nonordinary_38_79','computation','The routed pair (38,79) passes.','example : NonordinaryLevelOnePair 38 79 := by sorry'),
('TauCeti.Computational.test_nonordinary_weight_two','degenerate','No weight-two pair passes.','example (p : ℕ) : ¬NonordinaryLevelOnePair 2 p := by sorry'),
('TauCeti.Computational.test_nonordinary_26_107','non-example','The weight-26 form is ordinary at 107.','example : ¬NonordinaryLevelOnePair 26 107 := by sorry')],uses=[('BCG Remark 3.3','Expresses a finite exhaustive search with all weights and primes quantified.')])
add(3,'smallest-nonordinary-primes','The first two nonordinary level-one primes','theorem',
'Among primes p≤79, a level-one nonordinary eigenform of even weight 2≤k<p exists exactly for p=59 or p=79. The determinant witnesses occur at weights 16 and 46 for 59, and 38 and 44 for 79. The weight-16 witness at 59 fails gcd(k−1,p+1)=1, whereas weight 38 at 79 passes it.',
 ['Enumerate every prime p≤79 and every even weight below p. For each, reconstruct the Miller basis and T_p matrix by exact q-expansion arithmetic, then check the determinant. The Sturm/basis comparison proves these are the intrinsic operators; dimension-zero cases contribute determinant one.'],[nonord,hmat],[src('BCG','Remark 3.3, p.518','second smallest','A finite exhaustive theorem, not only two positive examples.')],
 ('TauCeti.Computational.small_nonordinary_primes','''theorem small_nonordinary_primes (p : ℕ) (hp : p≤79) :
 (∃ k : ℕ, k<p ∧ NonordinaryLevelOnePair k p) ↔ p=59 ∨ p=79 := by sorry'''),acceptance=['The record must include the failed tests at every smaller prime and eligible weight. Finding 59 and 79 alone is not minimality.'])
add(3,'nonordinary-list-below-200','Nonordinary pairs below 200','theorem',
'For prime p<200 and even 2≤k<p, the nonordinary pairs (p,k) are exactly (59,16),(59,46),(79,38),(79,44),(107,28),(107,82),(131,40),(131,94),(139,36),(139,106),(151,60),(151,94),(173,24),(173,152),(193,72),(193,124). Filtering by gcd(k−1,p+1)=1 gives the primes 79,151,173,193 used in the nonordinary part of BCG Remark 3.3.',
 ['Run the same exact finite matrix checks on the larger range and retain every result. Then perform the integer gcd filter. The list is a planning target from the reviewed route, not a claim that this worker has replayed the complete dataset.'],[nonord,hmat],[src('BCG','Remark 3.3, p.518; reviewed routed item','non-ordinary','The routed exhaustive pair table, with its stated range.')],
 ('TauCeti.Computational.nonordinary_pairs_lt_200','''theorem nonordinary_pairs_lt_200 (p k : ℕ) (hp : p<200) (hk : k<p) :
 NonordinaryLevelOnePair k p ↔ (p,k)∈([(59,16),(59,46),(79,38),(79,44),(107,28),(107,82),(131,40),(131,94),(139,36),(139,106),(151,60),(151,94),(173,24),(173,152),(193,72),(193,124)] : List (ℕ×ℕ)) := by sorry'''),acceptance=['The paired weights both belong in the unfiltered list. The gcd filter is applied only afterwards.'])
comp=add(3,'weight-82-companion-system','Complete companion eigensystem at weight 82','theorem',
'Let a_n be the exact integer coefficients of f=ΔE₄²E₆. The level-one integral Hecke matrices at weight 82 admit a common nonzero eigenvector over an algebraic closure of 𝔽₁₀₇, with eigenvalue ℓ⁸¹a_ℓ for every prime ℓ≠107. Equivalently a_ℓ(f)=ℓ²⁵a_ℓ(g) modulo 107. This coefficient convention matches BCG’s cohomological Galois normalization ρ̄_f≅ε̄⁻²⁵ρ̄_g, whose determinant is ε̄^(1−k). A common root of two separate characteristic polynomials is insufficient.',
 ['Construct a common residual eigensystem, apply the mod-p theta/Hasse weight comparison, and prove the full congruence with a congruence Sturm bound. The theta weight convention, eigensystem lift and Galois trace comparison are requested from their owners. These proof inputs are not inferred from two Hecke eigenvalues.'],[hmat,sturmMod,bcg],[src('BCG','Theorem 2.4 proof, p.515','cohomological normalization','The complete companion target, with the inverse cyclotomic convention translated explicitly.')],
 ('TauCeti.Computational.weight82_companion_system','''theorem weight82_companion_system [Fact (Nat.Prime 107)]
 (a : ℕ → ℤ)
 (ha : ∀ n, (a n:ℂ)=(qExpansion 1 (fun z : ℍ => ModularForm.discriminant z * ModularForm.E₄ z^2 * ModularForm.E₆ z)).coeff n)
 (T : ℕ → Module.End ℂ (CuspForm 𝒮ℒ 82))
 (hT : ∀ ℓ, ℓ.Prime → HasLevelOnePrimeRecurrence 82 ℓ (T ℓ)) :
 ∃ v : Fin (Module.finrank ℂ (CuspForm 𝒮ℒ 82)) → AlgebraicClosure (ZMod 107), v≠0 ∧
 ∀ (ℓ : ℕ) (hℓ : ℓ.Prime), ℓ≠107 →
 (fun i => ∑ j, ((integralHeckeMatrix 82 ℓ (by sorry) (T ℓ) (hT ℓ hℓ) i j:ℤ):AlgebraicClosure (ZMod 107))*v j)
 = fun i => (ℓ:AlgebraicClosure (ZMod 107))^81*(a ℓ:AlgebraicClosure (ZMod 107))*v i := by sorry'''),acceptance=['At primes away from 107, 25+81=106 gives reciprocal twists. Track arithmetic versus geometric Frobenius before comparing Galois representations.'],planet='Certified companion form')
req('AlgebraicModularFormsAndSerreWeights:R15.3','The mod-p theta operator, Hasse invariant weight change and common-weight comparison needed to turn the complete companion coefficient test into a finite congruence Sturm certificate. Use a_f(ℓ)=ℓ^(k−1)a_g(ℓ), with BCG’s cohomological normalization retained.',[comp])
req(mf8,'Integral Hecke eigensystems, simultaneous eigenform decomposition and lifting a residual eigensystem to a characteristic-zero eigenform with a prime of its coefficient field. The symbol-side lattice is not a lattice inside complex forms; compare via the dual period map with the correct transpose.',[nonord,comp])
gap('BCG companion and corrected ordinary-list completion','The weight-82 common-eigenvector target still needs its finite theta/Sturm certificate and lift to a characteristic-zero eigenform. Add the ordinary companion witnesses at p=107,139,173,179,191,193 with their respective weights, and exclude p=151 from the Theorem 2.1 list because gcd(150,51)=gcd(150,99)=3. The cohomological twist must not be translated as a_g=ℓ^25 a_f; for the 107 example it is a_g=ℓ^81 a_f. The complete finite data have not been replayed in this pass.',[comp,nonord])
oc=add(3,'ordinary-companion-pair','Ordinary level-one companion pair','definition',
'For a prime p, OrdinaryCompanionPair p k means 2≤k<p, both k and k′=p+1−k are even, and the integral level-one Hecke operators in these weights have common residual eigensystems over an algebraic closure of 𝔽_p. The first eigensystem has eigenvalues a_ℓ and a_p≠0. For every prime ℓ≠p the companion eigenvalue is ℓ^(p−k)a_ℓ, equivalently a_ℓ=ℓ^(k−1)b_ℓ. Each eigensystem is represented by one nonzero vector simultaneously for all prime Hecke matrices, not a collection of independently chosen eigenvalues.',
 ['Use the integer Hecke matrices and coefficientwise reduction into the algebraic closure. Record both operator families, their intrinsic recurrence comparisons, two nonzero simultaneous eigenvectors and their eigenvalue function. Characteristic-zero lifting and the cohomological Galois comparison are owner inputs.'],[hmat,hr,comp],[src('BCG','Theorem 2.1 and §2.3, pp.513–515; Remark 3.3, p.518','companion form','The complete residual eigenvalue convention for the ordinary computation.')],
 ('TauCeti.Computational.OrdinaryCompanionPair','''def OrdinaryCompanionPair (p k : ℕ) [Fact p.Prime] : Prop :=
 let F := AlgebraicClosure (ZMod p)
 2≤k ∧ k<p ∧ ∃ hk : Even k, ∃ hk' : Even (p+1-k),
 ∃ T : ℕ → Module.End ℂ (CuspForm 𝒮ℒ (k:ℤ)),
 ∃ U : ℕ → Module.End ℂ (CuspForm 𝒮ℒ ((p+1-k:ℕ):ℤ)),
 ∃ hT : ∀ ℓ, ℓ.Prime → HasLevelOnePrimeRecurrence k ℓ (T ℓ),
 ∃ hU : ∀ ℓ, ℓ.Prime → HasLevelOnePrimeRecurrence (p+1-k) ℓ (U ℓ),
 ∃ v : Fin (Module.finrank ℂ (CuspForm 𝒮ℒ (k:ℤ))) → F,
 ∃ w : Fin (Module.finrank ℂ (CuspForm 𝒮ℒ ((p+1-k:ℕ):ℤ))) → F,
 ∃ a : ℕ → F, v≠0 ∧ w≠0 ∧ a p≠0 ∧
 (∀ (ℓ : ℕ) (hℓ : ℓ.Prime),
   (fun i => ∑ j, ((integralHeckeMatrix k ℓ hk (T ℓ) (hT ℓ hℓ) i j:ℤ):F)*v j)=fun i => a ℓ*v i) ∧
 (∀ (ℓ : ℕ) (hℓ : ℓ.Prime), ℓ≠p →
   (fun i => ∑ j, ((integralHeckeMatrix (p+1-k) ℓ hk' (U ℓ) (hU ℓ hℓ) i j:ℤ):F)*w j)=
     fun i => (ℓ:F)^(p-k)*a ℓ*w i)'''),
api=[('TauCeti.Computational.ordinaryCompanionPair_weight','projection','The weight is even and strictly between 1 and p.','theorem ordinaryCompanionPair_weight (p k : ℕ) [Fact p.Prime] (h : OrdinaryCompanionPair p k) : 2≤k ∧ k<p ∧ Even k := by sorry'),
('TauCeti.Computational.ordinaryCompanionPair_dimension','compatibility','The first cusp space has positive dimension. Ordinarity belongs to the selected eigensystem; other eigensystems in the same space may be nonordinary.','theorem ordinaryCompanionPair_dimension (p k : ℕ) [Fact p.Prime] (h : OrdinaryCompanionPair p k) : 0<Module.finrank ℂ (CuspForm 𝒮ℒ (k:ℤ)) := by sorry'),
('TauCeti.Computational.ordinaryCompanionPair_companion_dimension','other','The companion cusp space is also nonzero.','theorem ordinaryCompanionPair_companion_dimension (p k : ℕ) [Fact p.Prime] (h : OrdinaryCompanionPair p k) : 0<Module.finrank ℂ (CuspForm 𝒮ℒ ((p+1-k:ℕ):ℤ)) := by sorry')],
tests=[('TauCeti.Computational.test_companion_107','computation','Weight 26 at 107 has companion weight 82.','example [Fact (Nat.Prime 107)] : OrdinaryCompanionPair 107 26 := by sorry'),
('TauCeti.Computational.test_companion_low_prime','degenerate','There is no eligible weight for p=2.','example [Fact (Nat.Prime 2)] (k : ℕ) : ¬OrdinaryCompanionPair 2 k := by sorry'),
('TauCeti.Computational.test_companion_weight_two','non-example','Weight two has no cusp eigensystem.','example (p : ℕ) [Fact p.Prime] : ¬OrdinaryCompanionPair p 2 := by sorry')],uses=[('BCG Remark 3.3','Certifies complete ordinary companion witnesses with their exact weights.'),('BCG Theorem 2.1','The coprimality hypothesis is checked separately from existence of a companion.')])
add(3,'corrected-ordinary-companion-list','Corrected ordinary companion witnesses','theorem',
'For (p,k)=(107,26),(139,20),(173,68),(179,30),(191,30),(193,48), an OrdinaryCompanionPair p k exists and gcd(k−1,p−1)=1. These supply the corrected finite ordinary examples from the reviewed route. The candidate at p=151 has weights 52 and 100, and gcd(51,150)=gcd(99,150)=3, so those companion forms do not satisfy BCG Theorem 2.1. No exhaustive statement about all primes is made.',
 ['Produce a complete simultaneous eigensystem certificate for each pair, apply the owner’s lift/Galois comparison, and check the integer gcd. The reviewed T₂/T₃ checks are discovery evidence only; full congruence certificates remain required.'],[oc,sturmMod], [src('BCG','Remark 3.3, p.518, corrected source issue E7','companion form','Retains the valid primes and explicitly removes the failed 151 witnesses.')],
 ('TauCeti.Computational.corrected_ordinary_companion_list','''theorem corrected_ordinary_companion_list (p k : ℕ) [Fact p.Prime]
 (h : (p,k)∈([(107,26),(139,20),(173,68),(179,30),(191,30),(193,48)] : List (ℕ×ℕ))) :
 OrdinaryCompanionPair p k ∧ Nat.Coprime (k-1) (p-1) := by sorry'''),acceptance=['The 151 exclusion is the exact check gcd(51,150)=3 and gcd(99,150)=3. It is not fixed by increasing numerical precision.'])
```

## Script: cn4.py

```python
arb=lambda loc,match:src('Arb',loc,'enclosures',match)
car=lambda loc,match:src('CarusoPublished',loc,'intervals',match)
def fq(n):return 'TauCeti.Computational.'+n

mul=add(4,'rational-interval-product','Rational interval multiplication','construction',
'For I=[a,b] and J=[c,d] with rational endpoints, intervalMul I J is [min(ac,ad,bc,bd), max(ac,ad,bc,bd)]. These are enclosing intervals in ℝ under the rational embedding. The existing monotone interval multiplication does not apply to arbitrary signed rational endpoints.',
['Evaluate all four corner products. Their minimum is at most their maximum; package these as the endpoints of the existing NonemptyInterval ℚ carrier.'],[interval],[arb('§2, pp.2–4','Exact rational endpoint specialization of enclosing interval multiplication; no claim of midpoint-radius optimality.')],
(fq('intervalMul'),'''def intervalMul (I J : NonemptyInterval ℚ) : NonemptyInterval ℚ :=
  ⟨(min (min (I.fst*J.fst) (I.fst*J.snd)) (min (I.snd*J.fst) (I.snd*J.snd)),
    max (max (I.fst*J.fst) (I.fst*J.snd)) (max (I.snd*J.fst) (I.snd*J.snd))), by sorry⟩'''),
api=[(fq('intervalMul_lower'),'projection','The lower endpoint is the minimum of the four corner products.','''theorem intervalMul_lower (I J : NonemptyInterval ℚ) :
 (intervalMul I J).fst = min (min (I.fst*J.fst) (I.fst*J.snd)) (min (I.snd*J.fst) (I.snd*J.snd)) := by sorry'''),
(fq('intervalMul_comm'),'relation','Multiplication is symmetric in its two intervals.','theorem intervalMul_comm (I J : NonemptyInterval ℚ) : intervalMul I J = intervalMul J I := by sorry'),
(fq('intervalMul_pure'),'compatibility','Singleton intervals multiply as rational numbers.','theorem intervalMul_pure (a b : ℚ) : intervalMul (NonemptyInterval.pure a) (NonemptyInterval.pure b) = NonemptyInterval.pure (a*b) := by sorry')],
tests=[(fq('test_intervalMul_signed'),'computation','[−2,3] times [−4,5] is [−12,15].','example : intervalMul ⟨(-2,3), by sorry⟩ ⟨(-4,5), by sorry⟩ = ⟨(-12,15), by sorry⟩ := by sorry'),
(fq('test_intervalMul_zero'),'degenerate','The singleton zero times any interval is the singleton zero.','example (I : NonemptyInterval ℚ) : intervalMul (NonemptyInterval.pure 0) I = NonemptyInterval.pure 0 := by sorry'),
(fq('test_intervalMul_crossing'),'non-example','[−1,1] times itself has lower endpoint −1, not +1.','example : (intervalMul ⟨(-1,1), by sorry⟩ ⟨(-1,1), by sorry⟩).fst = -1 := by sorry')],
uses=[('CT §2.4.3','Signed Gram-matrix entries and products must remain enclosed.'),('ComplexMultiplicationAndExplicitReciprocity:CM.5','Certified coefficient recovery consumes enclosing arithmetic.')],planet='Interval multiplication')

mulsound=add(4,'rational-interval-product-sound','Enclosure under multiplication','theorem',
'For x,y∈ℝ, if a≤x≤b and c≤y≤d, then xy lies between the endpoints of intervalMul [a,b] [c,d], with all rational endpoints cast into ℝ.',
['Split each input interval at zero. In each of the four sign cases, order compatibility of multiplication bounds xy by the corresponding corner products.'],[mul],[arb('§2, pp.2–4','Inclusion property needed for rigorous arithmetic.')],
(fq('intervalMul_sound'),'''theorem intervalMul_sound (I J : NonemptyInterval ℚ) (x y : ℝ)
 (hx : (I.fst:ℝ) ≤ x ∧ x ≤ (I.snd:ℝ)) (hy : (J.fst:ℝ) ≤ y ∧ y ≤ (J.snd:ℝ)) :
 ((intervalMul I J).fst:ℝ) ≤ x*y ∧ x*y ≤ ((intervalMul I J).snd:ℝ) := by sorry'''),acceptance=['The signed crossing-zero test is covered; no nonnegative-input hypothesis is imposed.'])

inv=add(4,'rational-interval-inverse','Partial interval reciprocal','construction',
'intervalInv I returns none when 0∈I and otherwise returns the interval [1/I.upper,1/I.lower]. Failure is data and carries no assertion that the mathematical reciprocal exists at zero.',
['Decide whether the rational endpoints straddle zero. On either remaining sign component, inversion reverses order.'],[interval],[arb('§2, p.4','Division requires a nonzero denominator enclosure.')],
(fq('intervalInv'),'''def intervalInv (I : NonemptyInterval ℚ) : Option (NonemptyInterval ℚ) :=
 if h : I.fst ≤ 0 ∧ 0 ≤ I.snd then none else some ⟨(I.snd⁻¹,I.fst⁻¹), by sorry⟩'''),
api=[(fq('intervalInv_involutive'),'relation','Successful inversion twice recovers the input interval.','theorem intervalInv_involutive (I J : NonemptyInterval ℚ) (h : intervalInv I=some J) : intervalInv J=some I := by sorry'),
(fq('intervalInv_none'),'characterisation','Failure is equivalent to the input interval containing zero.','theorem intervalInv_none (I : NonemptyInterval ℚ) : intervalInv I = none ↔ I.fst ≤ 0 ∧ 0 ≤ I.snd := by sorry'),
(fq('intervalInv_endpoints'),'projection','Successful output has reciprocals of the reversed input endpoints.','theorem intervalInv_endpoints (I J : NonemptyInterval ℚ) (h : intervalInv I = some J) : J.fst = I.snd⁻¹ ∧ J.snd = I.fst⁻¹ := by sorry')],
tests=[(fq('test_intervalInv_positive'),'computation','The reciprocal of [2,4] is [1/4,1/2].','example : intervalInv ⟨(2,4), by sorry⟩ = some ⟨(1/4,1/2), by sorry⟩ := by sorry'),
(fq('test_intervalInv_zero'),'degenerate','The singleton zero is rejected.','example : intervalInv (NonemptyInterval.pure 0) = none := by sorry'),
(fq('test_intervalInv_negative'),'computation','The reciprocal of [−4,−2] is [−1/2,−1/4].','example : intervalInv ⟨(-4,-2), by sorry⟩ = some ⟨(-1/2,-1/4), by sorry⟩ := by sorry')],
uses=[('CT §4.3, Proposition 4.4','Reciprocal powers in convergent tails.'),('CN.4 L-value evaluation','Division by constants with certified nonzero enclosures.')])

add(4,'rational-interval-inverse-sound','Enclosure under reciprocal','theorem',
'If intervalInv I=some J and x∈ℝ lies in I, then x≠0 and 1/x lies in J.',
['Unfold the successful branch and distinguish positive and negative intervals; apply order reversal of inversion in that sign component.'],[inv],[arb('§2, p.4','Soundness of reciprocal arithmetic.')],
(fq('intervalInv_sound'),'''theorem intervalInv_sound (I J : NonemptyInterval ℚ) (x : ℝ)
 (h : intervalInv I = some J) (hx : (I.fst:ℝ) ≤ x ∧ x ≤ (I.snd:ℝ)) :
 x ≠ 0 ∧ (J.fst:ℝ) ≤ x⁻¹ ∧ x⁻¹ ≤ (J.snd:ℝ) := by sorry'''),acceptance=['An interval touching zero at an endpoint is rejected.'])

rounding=add(4,'outward-dyadic-rounding','Outward dyadic rounding','construction',
'For precision p∈ℕ, dyadicHull p [a,b]=[floor(2^p a)/2^p,ceil(2^p b)/2^p]. Negative endpoints use floor and ceiling, not truncation toward zero. The representation remains NonemptyInterval ℚ.',
['Use the integer floor and ceiling of each scaled endpoint. Positivity of 2^p proves the endpoints are ordered.'],[interval],[arb('§2, pp.2–4','Round the exact rational enclosure outward to a chosen binary grid.')],
(fq('dyadicHull'),'''def dyadicHull (p : ℕ) (I : NonemptyInterval ℚ) : NonemptyInterval ℚ :=
 ⟨(((⌊(2:ℚ)^p*I.fst⌋:ℤ):ℚ)/(2:ℚ)^p,
    ((⌈(2:ℚ)^p*I.snd⌉:ℤ):ℚ)/(2:ℚ)^p), by sorry⟩'''),
api=[(fq('dyadicHull_grid'),'characterisation','Both output endpoints lie on the 2^(−p) rational grid.','theorem dyadicHull_grid (p : ℕ) (I : NonemptyInterval ℚ) : (∃ a : ℤ, (dyadicHull p I).fst=(a:ℚ)/(2:ℚ)^p) ∧ ∃ b : ℤ, (dyadicHull p I).snd=(b:ℚ)/(2:ℚ)^p := by sorry'),
(fq('dyadicHull_contains'),'compatibility','The original interval is contained in the rounded interval.','theorem dyadicHull_contains (p : ℕ) (I : NonemptyInterval ℚ) : (dyadicHull p I).fst ≤ I.fst ∧ I.snd ≤ (dyadicHull p I).snd := by sorry'),
(fq('dyadicHull_idempotent'),'relation','Rounding again at the same precision does not change the interval.','theorem dyadicHull_idempotent (p : ℕ) (I : NonemptyInterval ℚ) : dyadicHull p (dyadicHull p I) = dyadicHull p I := by sorry')],
tests=[(fq('test_dyadicHull_third'),'computation','At p=2 the singleton 1/3 becomes [1/4,1/2].','example : dyadicHull 2 (NonemptyInterval.pure (1/3)) = ⟨(1/4,1/2), by sorry⟩ := by sorry'),
(fq('test_dyadicHull_negative'),'non-example','At p=0 the singleton −1/3 becomes [−1,0].','example : dyadicHull 0 (NonemptyInterval.pure (-1/3)) = ⟨(-1,0), by sorry⟩ := by sorry'),
(fq('test_dyadicHull_zero'),'degenerate','Exact zero remains exact at every precision.','example (p : ℕ) : dyadicHull p (NonemptyInterval.pure 0) = NonemptyInterval.pure 0 := by sorry')],uses=[('Arb §2','Explicit rounding control.'),('CT numerical certificates','Portable rational endpoints with a chosen precision.')])

add(4,'outward-rounding-width','Width added by dyadic rounding','lemma',
'The width of dyadicHull p I is less than width(I)+2·2^(−p). The strict bound includes exact endpoints.',
['Each endpoint moves outward by strictly less than 2^(−p); add the two floor/ceiling error inequalities.'],[rounding],[arb('§2, pp.2–4','Quantified rounding error for the exact-grid adapter.')],
(fq('dyadicHull_width'),'''theorem dyadicHull_width (p : ℕ) (I : NonemptyInterval ℚ) :
 (dyadicHull p I).snd - (dyadicHull p I).fst < I.snd-I.fst + 2/(2:ℚ)^p := by sorry'''),acceptance=['The bound tends to zero as precision increases.'])

unique=add(4,'unique-integer-in-enclosure','Unique integer extraction','construction',
'uniqueInteger I returns the integer ceil(I.lower) precisely when ceil(I.lower)=floor(I.upper); otherwise it returns none. It asserts uniqueness inside the closed interval, not that an unknown real number in it is integral.',
['Compute the smallest and largest integers in the rational interval. Compare them exactly.'],[interval],[arb('§3, pp.5–6','Exact recovery from a rigorous enclosure also requires integrality of the target.')],
(fq('uniqueInteger'),'''def uniqueInteger (I : NonemptyInterval ℚ) : Option ℤ :=
 if (⌈I.fst⌉:ℤ) = (⌊I.snd⌋:ℤ) then some ⌈I.fst⌉ else none'''),
api=[(fq('uniqueInteger_mem'),'projection','A returned integer lies in the input interval.','theorem uniqueInteger_mem (I : NonemptyInterval ℚ) (z : ℤ) (h : uniqueInteger I=some z) : I.fst≤(z:ℚ) ∧ (z:ℚ)≤I.snd := by sorry'),
(fq('uniqueInteger_iff'),'characterisation','The output is z iff z is the unique integer in I.','''theorem uniqueInteger_iff (I : NonemptyInterval ℚ) (z : ℤ) : uniqueInteger I = some z ↔
 (I.fst ≤ (z:ℚ) ∧ (z:ℚ) ≤ I.snd) ∧ ∀ w : ℤ, I.fst ≤ (w:ℚ) → (w:ℚ) ≤ I.snd → w=z := by sorry'''),
(fq('uniqueInteger_pure'),'simp','A singleton integer is recovered.','theorem uniqueInteger_pure (z : ℤ) : uniqueInteger (NonemptyInterval.pure (z:ℚ)) = some z := by sorry')],
tests=[(fq('test_uniqueInteger_one'),'computation','[3/4,5/4] contains exactly the integer 1.','example : uniqueInteger ⟨(3/4,5/4), by sorry⟩ = some 1 := by sorry'),
(fq('test_uniqueInteger_two'),'non-example','[0,1] is rejected because both endpoints are integers.','example : uniqueInteger ⟨(0,1), by sorry⟩ = none := by sorry'),
(fq('test_uniqueInteger_empty'),'degenerate','The singleton 1/2 contains no integer and is rejected.','example : uniqueInteger (NonemptyInterval.pure (1/2)) = none := by sorry')],uses=[('ComplexMultiplicationAndExplicitReciprocity:CM.5','Integer class-polynomial coefficients are recovered only after an integrality theorem and a unique-integer enclosure.')],planet='Certified integer recovery')

add(4,'integer-recovery-sound','Recovery of a known integral value','theorem',
'If z is an integer, its real image belongs to I, and uniqueInteger I=some w, then z=w. An enclosure around zero alone never proves that a general real or complex analytic value vanishes.',
['Cast the rational endpoint inequalities and apply uniqueInteger_iff to the known integer z.'],[unique],[arb('§3, pp.5–6','Separates numerical enclosure from the independent integrality input.')],
(fq('uniqueInteger_sound'),'''theorem uniqueInteger_sound (I : NonemptyInterval ℚ) (z w : ℤ)
 (hz : (I.fst:ℝ) ≤ (z:ℝ) ∧ (z:ℝ) ≤ (I.snd:ℝ)) (h : uniqueInteger I = some w) : z=w := by sorry'''),acceptance=['A nonintegral real in [−1/4,1/4] is not asserted to be zero.'])

eff=add(4,'effective-gram-lower-bound','Entrywise lower bounds on effective vectors','theorem',
'Let A,B be real n×n matrices. If B_ij≤A_ij for every i,j and x_i≥0 for every i, then Σ_ij B_ij x_i x_j≤Σ_ij A_ij x_i x_j. Symmetry is unnecessary for this inequality. The nonnegative-coordinate hypothesis is essential.',
['Every x_i x_j is nonnegative. Multiply each entry inequality by this number and sum.'],[mulsound],[src('CT','Remark 2.11, pp.281–282','effective elements','The effectivity restriction makes entrywise rational lower bounds sufficient.')],
(fq('effectiveGram_lower'),'''theorem effectiveGram_lower {n : ℕ} (A B : Matrix (Fin n) (Fin n) ℝ) (x : Fin n → ℝ)
 (h : ∀ i j, B i j ≤ A i j) (hx : ∀ i, 0 ≤ x i) :
 (∑ i, ∑ j, B i j*x i*x j) ≤ ∑ i, ∑ j, A i j*x i*x j := by sorry'''),acceptance=['For x=(1,−1), entrywise comparison alone is insufficient.'],planet='Effective Gram lower bound')

add(4,'loewner-gram-lower-bound','Loewner lower bounds on unrestricted vectors','theorem',
'For symmetric real matrices A and B with A−B positive semidefinite, xᵀBx≤xᵀAx for every real vector x, including mixed signs.',
['Evaluate the positive-semidefinite inequality on x and expand the difference.'],[],[src('CT','Remark 2.11, pp.281–282','effective elements','Explicit general-vector alternative; the source uses the weaker effective-vector condition.')],
(fq('loewnerGram_lower'),'''theorem loewnerGram_lower {n : ℕ} (A B : Matrix (Fin n) (Fin n) ℝ)
 (h : ∀ x : Fin n → ℝ, 0 ≤ ∑ i, ∑ j, (A i j-B i j)*x i*x j) (x : Fin n → ℝ) :
 (∑ i, ∑ j, B i j*x i*x j) ≤ ∑ i, ∑ j, A i j*x i*x j := by sorry'''),acceptance=['The hypothesis explicitly quantifies over every vector and is stronger than entrywise comparison.'])

neg=add(4,'gram-negativity-certificate','Rational witness of Gram negativity','definition',
'For an n×n matrix I of rational enclosing intervals and a rational vector t, NegativeGramCertificate I consists of t_i≥0 for every i, t≠0, and the strictly negative rational upper bound Σ_ij I_ij.upper t_i t_j<0. It does not store an approximate eigenvalue as evidence.',
['The fields are exact rational inequalities. Nonnegativity permits endpointwise upper bounding.'],[interval,eff],[src('CT','Algorithm 2.4.4, pp.282–283','Check rigorously','Only the final rigorous inequality certifies the search result.')],
(fq('NegativeGramCertificate'),'''structure NegativeGramCertificate {n : ℕ} (I : Matrix (Fin n) (Fin n) (NonemptyInterval ℚ)) where
 vector : Fin n → ℚ
 nonneg : ∀ i, 0 ≤ vector i
 nonzero : vector ≠ 0
 upper_neg : (∑ i, ∑ j, (I i j).snd*vector i*vector j) < 0'''),
api=[(fq('NegativeGramCertificate.upper_negative'),'projection','The stored endpoint quadratic value is strictly negative.','theorem NegativeGramCertificate.upper_negative {n : ℕ} {I : Matrix (Fin n) (Fin n) (NonemptyInterval ℚ)} (c : NegativeGramCertificate I) : (∑ i, ∑ j, (I i j).snd*c.vector i*c.vector j)<0 := by sorry'),
(fq('NegativeGramCertificate.vector_ne_zero'),'projection','The witness vector is nonzero.','theorem NegativeGramCertificate.vector_ne_zero {n : ℕ} {I : Matrix (Fin n) (Fin n) (NonemptyInterval ℚ)} (c : NegativeGramCertificate I) : c.vector ≠ 0 := by sorry'),
(fq('NegativeGramCertificate.scale'),'functoriality','Multiplying the vector by a positive rational preserves certification.','def NegativeGramCertificate.scale {n : ℕ} {I : Matrix (Fin n) (Fin n) (NonemptyInterval ℚ)} (c : NegativeGramCertificate I) (r : ℚ) (hr : 0<r) : NegativeGramCertificate I := by sorry'),
(fq('NegativeGramCertificate.scale_vector'),'simp','The scaled certificate uses exactly r times the original vector.','theorem NegativeGramCertificate.scale_vector {n : ℕ} {I : Matrix (Fin n) (Fin n) (NonemptyInterval ℚ)} (c : NegativeGramCertificate I) (r : ℚ) (hr : 0<r) : (c.scale r hr).vector=fun i => r*c.vector i := by sorry')],
tests=[(fq('test_negativeGram_one'),'computation','The one-dimensional interval [−2,−1] admits vector 1.','example : Nonempty (NegativeGramCertificate (n:=1) (fun _ _ => ⟨(-2,-1), by sorry⟩)) := by sorry'),
(fq('test_negativeGram_zero_dim'),'degenerate','Dimension zero admits no nonzero vector certificate.','example (I : Matrix (Fin 0) (Fin 0) (NonemptyInterval ℚ)) : IsEmpty (NegativeGramCertificate I) := by sorry'),
(fq('test_negativeGram_crossing'),'non-example','The one-dimensional enclosure [−1,1] certifies no negative value by this rule.','example : IsEmpty (NegativeGramCertificate (n:=1) (fun _ _ => ⟨(-1,1), by sorry⟩)) := by sorry')],uses=[('CT Algorithms 2.4.4–2.4.5','Store and replay each tuple of parameters and positive weights after analytic entries have been enclosed.')],planet='Gram negativity certificate')

add(4,'gram-negativity-sound','Soundness of the negativity certificate','theorem',
'If A_ij lies in interval I_ij and c is a NegativeGramCertificate I, then c.vectorᵀ A c.vector<0 over ℝ.',
['Cast the exact rational upper inequality to ℝ. Sum entrywise upper bounds weighted by nonnegative vector products.'],[neg,eff],[src('CT','Algorithm 2.4.4, step 4, pp.282–283','Check rigorously','The exact endpoint check implies the real quadratic inequality.')],
(fq('NegativeGramCertificate.sound'),'''theorem NegativeGramCertificate.sound {n : ℕ}
 {I : Matrix (Fin n) (Fin n) (NonemptyInterval ℚ)} (c : NegativeGramCertificate I)
 (A : Matrix (Fin n) (Fin n) ℝ)
 (hA : ∀ i j, ((I i j).fst:ℝ) ≤ A i j ∧ A i j ≤ ((I i j).snd:ℝ)) :
 (∑ i, ∑ j, A i j*(c.vector i:ℝ)*(c.vector j:ℝ)) < 0 := by sorry'''),acceptance=['Every stored CT witness must pass this exact check after all analytic entries are enclosed.'])

gap('Full validated-numerics target inventory','This first saved batch covers rational arithmetic and Gram witnesses only. Add certified root isolation, complex boxes, analytic L-function series and tail bounds, CT evaluation formulas and finite enumeration, the Platt conductor computation, and p-adic precision propagation before treating CN.4 as planned.',[f'{RID}:CN.4'])
```

## Script: cn4_extra.py

```python
pcs=[src('CarusoPublished','§2.1.1, pp.17–19, corrected error computation','precision','Uses the read absolute-precision formulas, correcting the printed second-order and inverse-radius slips.')]
pnorm=add(4,'padic-normalization','Normalize a rational p-adic ball','construction',
'For prime p, rational centre c and absolute precision N∈ℤ, padicNormalize p c N returns the unique canonical PadicApproximation at precision N with denotation {x | ‖x−c‖≤p^(−N)}. Its valuation field is N if c=0, and min(v_p(c),N) otherwise. For v<N the mantissa is the unique residue in [1,p^(N−v)) prime to p representing c·p^(−v) modulo p^(N−v).',
 ['Separate the zero and high-valuation cases. Otherwise invert the denominator prime to p modulo p^(N−v) and reduce the scaled numerator. Native p-adic truncation compares this residue with the original rational centre.'],[pa,padic_trunc,valrat],pcs,
 ('TauCeti.Computational.padicNormalize','def padicNormalize (p : ℕ) [Fact p.Prime] (c : ℚ) (N : ℤ) : PadicApproximation p := by sorry'),
api=[('TauCeti.Computational.padicNormalize_precision','projection','Absolute precision is retained.','theorem padicNormalize_precision (p : ℕ) [Fact p.Prime] (c : ℚ) (N : ℤ) : (padicNormalize p c N).precision=N := by sorry'),
('TauCeti.Computational.padicNormalize_denotation','characterisation','Normalization preserves the entire rational-centred ball.','theorem padicNormalize_denotation (p : ℕ) [Fact p.Prime] (c : ℚ) (N : ℤ) : (padicNormalize p c N).denotation={x : ℚ_[p] | ‖x-(c:ℚ_[p])‖≤(p:ℝ)^(-N)} := by sorry'),
('TauCeti.Computational.padicNormalize_valuation','compatibility','The zero branch avoids the native valuation-at-zero default.','theorem padicNormalize_valuation (p : ℕ) [Fact p.Prime] (c : ℚ) (N : ℤ) : (padicNormalize p c N).valuation=if c=0 then N else min (padicValRat p c) N := by sorry'),
('TauCeti.Computational.padicNormalize_id','simp','Normalizing an already canonical centre and precision recovers the approximation.','theorem padicNormalize_id {p : ℕ} [Fact p.Prime] (a : PadicApproximation p) : padicNormalize p a.center a.precision=a := by sorry')],
tests=[('TauCeti.Computational.test_normalize_zero','degenerate','Zero at precision 5 has valuation 5 and mantissa zero.','example [Fact (Nat.Prime 3)] : (padicNormalize 3 0 5).valuation=5 ∧ (padicNormalize 3 0 5).mantissa=0 := by sorry'),
('TauCeti.Computational.test_normalize_five','computation','5 modulo 3 normalizes to mantissa 2.','example [Fact (Nat.Prime 3)] : (padicNormalize 3 5 1).mantissa=2 := by sorry'),
('TauCeti.Computational.test_normalize_cancellation','non-example','9 at absolute precision 2 is a zero-centred ball, not a unit with valuation zero.','example [Fact (Nat.Prime 3)] : (padicNormalize 3 9 2).valuation=2 ∧ (padicNormalize 3 9 2).mantissa=0 := by sorry')],uses=[('CN.4 arithmetic','Every output is normalized without losing its absolute-precision semantics.'),('CN.2 local expansions','Compare integer residue computations with native p-adic elements.')])
for op,prec,center,expr in [('add','min a.precision b.precision','a.center+b.center','x+y'),('mul','min (a.valuation+b.precision) (a.precision+b.valuation)','a.center*b.center','x*y')]:
 slug='padic-'+op
 node=add(4,slug,{'add':'Certified p-adic addition','mul':'Certified p-adic multiplication'}[op],'construction',
 ('Add' if op=='add' else 'Multiply')+' two canonical p-adic approximations by normalizing the '+('sum' if op=='add' else 'product')+' of centres at absolute precision '+('min(N,N′)' if op=='add' else 'min(v+N′,N+v′)')+'. For every independently chosen x in the first ball and y in the second, the '+('sum' if op=='add' else 'product')+' lies in the output ball. This enclosure does not recover correlations between repeated occurrences of an uncertain input.',
 ['Expand the error around the exact rational centres and apply the ultrametric inequality.'+(' For multiplication the mixed error has valuation at least N+N′, which is no smaller than either retained bound because v≤N and v′≤N′.' if op=='mul' else '')],[pnorm,pa],pcs,
 ('TauCeti.Computational.padic'+op.title(),f'def padic{op.title()} {{p : ℕ}} [Fact p.Prime] (a b : PadicApproximation p) : PadicApproximation p := padicNormalize p ({center}) ({prec})'),
api=[('TauCeti.Computational.padic'+op.title()+'_precision','projection','The output has the stated absolute precision.',f'theorem padic{op.title()}_precision {{p : ℕ}} [Fact p.Prime] (a b : PadicApproximation p) : (padic{op.title()} a b).precision={prec} := by sorry'),
('TauCeti.Computational.padic'+op.title()+'_sound','compatibility','The output contains every result from independently chosen inputs.',f'theorem padic{op.title()}_sound {{p : ℕ}} [Fact p.Prime] (a b : PadicApproximation p) (x y : ℚ_[p]) (hx : x∈a.denotation) (hy : y∈b.denotation) : {expr}∈(padic{op.title()} a b).denotation := by sorry'),
('TauCeti.Computational.padic'+op.title()+'_comm','relation','The canonical result is symmetric in its inputs.',f'theorem padic{op.title()}_comm {{p : ℕ}} [Fact p.Prime] (a b : PadicApproximation p) : padic{op.title()} a b=padic{op.title()} b a := by sorry')],
tests=[('TauCeti.Computational.test_padic_'+op+'_zero','degenerate','The operation on two precision-zero zero-centred balls contains zero.',f'example {{p : ℕ}} [Fact p.Prime] : (0:ℚ_[p])∈(padic{op.title()} (padicNormalize p 0 0) (padicNormalize p 0 0)).denotation := by sorry'),
('TauCeti.Computational.test_padic_'+op+'_centres','computation','The exact operation on the centres lies in the output.',f'example {{p : ℕ}} [Fact p.Prime] (a b : PadicApproximation p) : (({center}:ℚ):ℚ_[p])∈(padic{op.title()} a b).denotation := by sorry'),
('TauCeti.Computational.test_padic_'+op+'_unequal_precision','compatibility','The declared precision includes different input precisions and zero centres.',f'example [Fact (Nat.Prime 3)] : (padic{op.title()} (padicNormalize 3 0 2) (padicNormalize 3 1 5)).precision={2 if op=="add" else 2} := by sorry')],uses=[('Caruso finite-precision arithmetic','Tracks absolute accuracy through each operation.')])
pinv=add(4,'padic-inverse','Partial p-adic inversion','construction',
'padicInverse rejects a zero-mantissa approximation, because its ball contains zero. Otherwise it returns the normalized reciprocal of the rational centre at absolute precision N−2v. Every element in the input ball is nonzero and its inverse lies in this output. The input relative precision N−v is preserved.',
 ['Write x=c+h with v(h)≥N>v(c). Then x has the same valuation as c and x⁻¹−c⁻¹=−h/(cx), of valuation at least N−2v.'],[pnorm,pa],pcs,
 ('TauCeti.Computational.padicInverse','def padicInverse {p : ℕ} [Fact p.Prime] (a : PadicApproximation p) : Option (PadicApproximation p) := if a.mantissa=0 then none else some (padicNormalize p a.center⁻¹ (a.precision-2*a.valuation))'),
api=[('TauCeti.Computational.padicInverse_none_iff','characterisation','Rejection is exactly the presence of zero in the input ball.','theorem padicInverse_none_iff {p : ℕ} [Fact p.Prime] (a : PadicApproximation p) : padicInverse a=none ↔ (0:ℚ_[p])∈a.denotation := by sorry'),
('TauCeti.Computational.padicInverse_precision','projection','A successful output has precision N−2v.','theorem padicInverse_precision {p : ℕ} [Fact p.Prime] (a b : PadicApproximation p) (h : padicInverse a=some b) : b.precision=a.precision-2*a.valuation := by sorry'),
('TauCeti.Computational.padicInverse_sound','compatibility','A successful output encloses reciprocals of every input value.','theorem padicInverse_sound {p : ℕ} [Fact p.Prime] (a b : PadicApproximation p) (h : padicInverse a=some b) (x : ℚ_[p]) (hx : x∈a.denotation) : x≠0 ∧ x⁻¹∈b.denotation := by sorry')],
tests=[('TauCeti.Computational.test_padic_inverse_zero','degenerate','The zero-centred ball is rejected.','example {p : ℕ} [Fact p.Prime] (N : ℤ) : padicInverse (padicNormalize p 0 N)=none := by sorry'),
('TauCeti.Computational.test_padic_inverse_unit','computation','Inverting a precision-four unit preserves absolute precision four.','example [Fact (Nat.Prime 3)] (b : PadicApproximation 3) (h : padicInverse (padicNormalize 3 1 4)=some b) : b.precision=4 := by sorry'),
('TauCeti.Computational.test_padic_inverse_loss','non-example','Inverting 3+O(3⁴) loses two absolute digits, yielding precision two.','example [Fact (Nat.Prime 3)] (b : PadicApproximation 3) (h : padicInverse (padicNormalize 3 3 4)=some b) : b.precision=2 := by sorry')],uses=[('CN.2 local computation','Division must reject balls containing zero and account for lost precision.'),('CM.5 computation','Supplies generic validated precision arithmetic, without re-planning CM objects.')],planet='p-adic precision propagation')

arbs=[src('Arb','§5 and §5.3, pp.7–8','rectangular complex intervals','Product boxes preserve enclosure semantics and make branch-cut crossings explicit.')]
cb=add(4,'complex-box-denotation','Rational complex-box denotation','definition',
'A complex box is represented by the native pair (R,I) of closed nonempty rational intervals. complexBoxSet(R,I) is {z∈ℂ | Re(z)∈R and Im(z)∈I}. No new complex-number carrier or rounded value equality is introduced. Degenerate boxes and boxes meeting branch cuts are allowed; analytic evaluators must account for their entire image.',
 ['Define the four real endpoint inequalities using rational casts.'],[interval],arbs,
 ('TauCeti.Computational.complexBoxSet','def complexBoxSet (B : NonemptyInterval ℚ × NonemptyInterval ℚ) : Set ℂ := {z | (B.1.fst:ℝ)≤z.re ∧ z.re≤B.1.snd ∧ (B.2.fst:ℝ)≤z.im ∧ z.im≤B.2.snd}'),
api=[('TauCeti.Computational.mem_complexBoxSet','characterisation','Membership is membership of both real components in their endpoint intervals.','theorem mem_complexBoxSet (B : NonemptyInterval ℚ × NonemptyInterval ℚ) (z : ℂ) : z∈complexBoxSet B ↔ (B.1.fst:ℝ)≤z.re ∧ z.re≤B.1.snd ∧ (B.2.fst:ℝ)≤z.im ∧ z.im≤B.2.snd := by sorry'),
('TauCeti.Computational.complexBoxSet_nonempty','other','Every nonempty component pair denotes a nonempty complex set.','theorem complexBoxSet_nonempty (B : NonemptyInterval ℚ × NonemptyInterval ℚ) : (complexBoxSet B).Nonempty := by sorry'),
('TauCeti.Computational.complexBoxSet_mono','functoriality','Expanding each component interval expands the denotation.','theorem complexBoxSet_mono (B C : NonemptyInterval ℚ × NonemptyInterval ℚ) (hr : C.1.fst≤B.1.fst ∧ B.1.snd≤C.1.snd) (hi : C.2.fst≤B.2.fst ∧ B.2.snd≤C.2.snd) : complexBoxSet B⊆complexBoxSet C := by sorry')],
tests=[('TauCeti.Computational.test_box_zero','degenerate','The pair of singleton zero intervals contains only zero.','example : complexBoxSet (⟨(0,0),by sorry⟩,⟨(0,0),by sorry⟩)={0} := by sorry'),
('TauCeti.Computational.test_box_i','computation','The box [0,0]×[1,1] contains i.','example : Complex.I∈complexBoxSet (⟨(0,0),by sorry⟩,⟨(1,1),by sorry⟩) := by sorry'),
('TauCeti.Computational.test_box_positive_nonzero','non-example','A strictly positive real lower endpoint excludes zero.','example (B : NonemptyInterval ℚ × NonemptyInterval ℚ) (h : 0<B.1.fst) : (0:ℂ)∉complexBoxSet B := by sorry')],uses=[('CN.4 L-value evaluation','A complex enclosure certifies nonvanishing only when zero is excluded.'),('CN.0 algebraic root certificates','The same rational rectangle convention identifies a unique conjugate.')])
clsrc=[src('CL','§3.16, Proposition 3.17 and numerical comments (3), printed pp.304–307, French preprint','restes','Public French counterpart of CL19 Proposition 9.3.18 and p.277; the English publication was not collated in this pass.')]
dig=base('mathlib:Complex.digamma','Mathlib/Analysis/SpecialFunctions/Gamma/Digamma.lean','Native logarithmic derivative of Γ. Its totalized value at zero is zero; numerical algorithms avoid the pole set.','def')
digshift=base('mathlib:Complex.digamma_apply_add_nat','Mathlib/Analysis/SpecialFunctions/Gamma/Digamma.lean','Shift ψ(s+n)=ψ(s)+Σ(s+j)⁻¹ away from nonpositive integers.')
ker=add(4,'odlyzko-tail-kernel','Odlyzko tail kernel','definition',
'ctTailKernel(x)=2π²exp(−x)/(x²+π²)² for real x. It is positive everywhere and decreases on [0,∞). This is the scalar exponentially decaying kernel in both unconditional F_ℓ and conditional G_ℓ evaluation formulas; positivity of the test functions and the GRH-dependent explicit-formula implication belong to the automorphic owner.',
 ['Use native real exp and π. Positivity follows from π≠0. On the nonnegative half-line both the exponential factor decreases and the positive denominator increases.'],[],clsrc,
 ('TauCeti.Computational.ctTailKernel','def ctTailKernel (x : ℝ) : ℝ := 2*Real.pi^2*Real.exp (-x)/(x^2+Real.pi^2)^2'),
api=[('TauCeti.Computational.ctTailKernel_pos','other','The kernel is strictly positive.','theorem ctTailKernel_pos (x : ℝ) : 0<ctTailKernel x := by sorry'),
('TauCeti.Computational.ctTailKernel_zero','simp','At zero its value is 2/π².','theorem ctTailKernel_zero : ctTailKernel 0=2/Real.pi^2 := by sorry'),
('TauCeti.Computational.ctTailKernel_geometric','relation','For x,t≥0, r(x+t)≤exp(−t)r(x).','theorem ctTailKernel_geometric (x t : ℝ) (hx : 0≤x) (ht : 0≤t) : ctTailKernel (x+t)≤Real.exp (-t)*ctTailKernel x := by sorry')],
tests=[('TauCeti.Computational.test_tail_kernel_zero','degenerate','The zero value is positive and finite.','example : 0<ctTailKernel 0 := by sorry'),
('TauCeti.Computational.test_tail_kernel_one','computation','r(1) is strictly below r(0).','example : ctTailKernel 1<ctTailKernel 0 := by sorry'),
('TauCeti.Computational.test_tail_kernel_not_even','non-example','The kernel is not even: r(−1)>r(1).','example : ctTailKernel 1<ctTailKernel (-1) := by sorry')],uses=[('CT Proposition 4.4','The s₁ and s₂ remainders.'),('CL Proposition 3.17','The r₁, r₂ and r₃ remainders.')])
tail=add(4,'odlyzko-geometric-tail','Geometric bound for the Odlyzko tail','theorem',
'For α>0, b≥0 and N∈ℕ, the series Σr(α(b+n)) converges and its tail after indices 0,…,N−1 lies in [0,r(α(b+N))/(1−exp(−α))]. N=0 includes the entire series.',
 ['The preceding kernel inequality gives a geometric majorant with ratio exp(−α)<1. Sum that majorant and use termwise positivity.'],[ker],clsrc,
 ('TauCeti.Computational.ctTailKernel_tail','''theorem ctTailKernel_tail (α b : ℝ) (hα : 0<α) (hb : 0≤b) (N : ℕ) :
 Summable (fun n : ℕ => ctTailKernel (α*(b+n))) ∧
 0≤(∑' n : ℕ, ctTailKernel (α*(b+n)))-(∑ n∈Finset.range N, ctTailKernel (α*(b+n))) ∧
 (∑' n : ℕ, ctTailKernel (α*(b+n)))-(∑ n∈Finset.range N, ctTailKernel (α*(b+n)))
 ≤ctTailKernel (α*(b+N))/(1-Real.exp (-α)) := by sorry'''),acceptance=['No omitted sum is silently replaced by zero. Positive α is essential for the geometric denominator.'])
alt=add(4,'odlyzko-alternating-tail','Alternating Odlyzko tail bound','theorem',
'For α>0 and b≥0, the absolute error after the first N terms of Σ(−1)^n r(α(b+n)) is at most r(α(b+N)). The weighted n·r(αn) variant used by J_F(1−ε) needs its own monotonicity threshold; α(N+1)≥1 is a sufficient rationally checkable replacement for the sharper decimal threshold in the source.',
 ['The kernel decreases to zero, so apply the alternating-series remainder theorem. For the weighted variant, differentiate log(xr(x)); it is decreasing for x≥1.'],[ker,tail],clsrc,
 ('TauCeti.Computational.ctTailKernel_alternating_tail','''theorem ctTailKernel_alternating_tail (α b : ℝ) (hα : 0<α) (hb : 0≤b) (N : ℕ) :
 |(∑' n : ℕ, (-1:ℝ)^n*ctTailKernel (α*(b+n)))-
 (∑ n∈Finset.range N, (-1:ℝ)^n*ctTailKernel (α*(b+n)))| ≤ ctTailKernel (α*(b+N)) := by sorry'''),acceptance=['The first omitted index is N, avoiding a one-term truncation error.'])
form=add(4,'ct-explicit-formula-values','Closed scalar formulas for CT evaluation','definition',
'ctExplicitFormula ℓ w selects one of eight scalar expressions, for ℓ>0 and w∈ℕ. Put r=ctTailKernel, φ(z)=(ψ((z+1)/2)−ψ(z/2))/2, b_F=1/2+w/4 and b_G=(1+w)/2. Indices 0,…,7 are F̂_ℓ(0), F̂_ℓ(i/4π), J_Fℓ(I_w), J_Fℓ(1−ε), Ĝ_ℓ(0), Ĝ_ℓ(i/4π), J_Gℓ(I_w), J_Gℓ(1−ε). Their explicit expressions are those of CL Proposition 3.17 and CT Proposition 4.4, with the Fourier/Laplace dictionary F̂(0)=Φ_F(1/2), F̂(i/4π)=Φ_F(0). This declaration defines the numerical right-hand sides; identification with the intrinsic automorphic linear functional remains an imported obligation.',
 ['Use the native digamma function and its derivative, the displayed exponentially convergent tails, and elementary real/complex operations. Both formulas for F̂(i/4π) and Ĝ(0) equal 8ℓ/π². Distinguish the F and G gamma shifts and the weighted alternating tail.'],[ker,tail,alt,dig,digshift],clsrc+[src('CT','Proposition 4.4 and proof, pp.298–299','formulas','The G formulas and the Fourier normalization; the positivity implication has a separate GRH hypothesis.')],
 ('TauCeti.Computational.ctExplicitFormula','''def ctExplicitFormula (ℓ : ℝ) (w : ℕ) : Fin 8 → ℝ :=
 let φ : ℂ → ℂ := fun z => (Complex.digamma ((z+1)/2)-Complex.digamma (z/2))/2
 let z₀ : ℂ := 1/2 + Complex.I*(Real.pi/ℓ:ℝ)
 let z₁ : ℂ := 1 + Complex.I*(Real.pi/ℓ:ℝ)
 let bF : ℝ := 1/2+(w:ℝ)/4
 let bG : ℝ := (1+(w:ℝ))/2
 let zF : ℂ := bF + Complex.I*(Real.pi/(2*ℓ):ℝ)
 let zG : ℂ := bG + Complex.I*(Real.pi/ℓ:ℝ)
 ![4*(φ z₀).re-4/Real.pi*(φ z₀).im+4/ℓ*(deriv φ z₀).re+
      4*ℓ*(∑' n : ℕ, (-1:ℝ)^n*ctTailKernel (ℓ*((n:ℝ)+1/2))),
   8*ℓ/Real.pi^2,
   Real.log Real.pi-(Complex.digamma zF).re+1/Real.pi*(Complex.digamma zF).im-
      1/(2*ℓ)*(deriv Complex.digamma zF).re+2*ℓ*(∑' n : ℕ, ctTailKernel (2*ℓ*(bF+n))),
   1+2*Real.pi/ℓ*(φ z₁).im+2*Real.pi/ℓ^2*(deriv φ z₁).im+
      2*ℓ*(∑' n : ℕ, (-1:ℝ)^(n+2)*(n+1)*ctTailKernel (ℓ*(n+1))),
   8*ℓ/Real.pi^2,
   4*Real.pi^2*ℓ*(1+Real.cosh (ℓ/2))/(ℓ^2/4+Real.pi^2)^2,
   Real.log (2*Real.pi)-(Complex.digamma zG).re+1/Real.pi*(Complex.digamma zG).im-
      1/ℓ*(deriv Complex.digamma zG).re+ℓ*(∑' n : ℕ, ctTailKernel (ℓ*(bG+n))),
   (φ z₀).re-1/Real.pi*(φ z₀).im+1/ℓ*(deriv φ z₀).re+
      ℓ*(∑' n : ℕ, (-1:ℝ)^n*ctTailKernel (ℓ*((n:ℝ)+1/2)))]'''),
api=[('TauCeti.Computational.ctExplicitFormula_shared_value','compatibility','The unconditional imaginary Fourier value equals the conditional zero Fourier value.','theorem ctExplicitFormula_shared_value (ℓ : ℝ) (w : ℕ) : ctExplicitFormula ℓ w 1=ctExplicitFormula ℓ w 4 := by sorry'),
('TauCeti.Computational.ctExplicitFormula_fourier','simp','Their value is 8ℓ/π².','theorem ctExplicitFormula_fourier (ℓ : ℝ) (w : ℕ) : ctExplicitFormula ℓ w 1=8*ℓ/Real.pi^2 := by sorry'),
('TauCeti.Computational.ctExplicitFormula_G_imag','projection','The conditional imaginary Fourier value has the cosh closed formula.','theorem ctExplicitFormula_G_imag (ℓ : ℝ) (w : ℕ) : ctExplicitFormula ℓ w 5=4*Real.pi^2*ℓ*(1+Real.cosh (ℓ/2))/(ℓ^2/4+Real.pi^2)^2 := by sorry')],
tests=[('TauCeti.Computational.test_ct_fourier_positive','computation','For every positive ℓ the shared Fourier value is positive.','example (ℓ : ℝ) (h : 0<ℓ) (w : ℕ) : 0<ctExplicitFormula ℓ w 1 := by sorry'),
('TauCeti.Computational.test_ct_fourier_zero','degenerate','At ℓ=0 the totalized formula is zero, and is excluded from every evaluation theorem.','example (w : ℕ) : ctExplicitFormula 0 w 1=0 := by sorry'),
('TauCeti.Computational.test_ct_fourier_linear','compatibility','Doubling ℓ doubles the shared Fourier value.','example (ℓ : ℝ) (w : ℕ) : ctExplicitFormula (2*ℓ) w 1=2*ctExplicitFormula ℓ w 1 := by sorry')],uses=[('CT Algorithms 2.4.4–2.4.5','Evaluate all scalar entries before building the Gram matrix.'),('CT Proposition 4.4','Separates the numerically valid G formulas from the GRH-dependent application.')],planet='Certified explicit-formula evaluation')
encl=add(4,'ct-scalar-enclosure','Certified rational enclosures of CT quantities','construction',
'For rational ℓ>0, weight w, quantity index q∈{0,…,7} and precision P∈ℕ, ctEnclosure returns rational endpoints containing ctExplicitFormula ℓ w q, with width at most 2^(−P). It evaluates exp, log, π, ψ and ψ′ with directed error bounds and adds the explicit series remainder. The two identical Fourier-value indices 1 and 4 use the same evaluation path. An approximate eigenvalue search does not enter this checker.',
 ['Bound argument-reduction and elementary-function errors, shift digamma arguments within the right half-plane using the native recurrence, and apply a certified Euler–Maclaurin or Spouge remainder. Choose tail truncation from the kernel bounds. Round the final interval outward, increasing internal precision until the requested width is achieved. The special-function remainder and termination proof are explicit refinements.'],[form,rounding,tail,alt,digshift],clsrc+[arb('§5, pp.7–8','The finite approximation, propagated rounding and rigorous truncation error are separate steps.')],
 ('TauCeti.Computational.ctEnclosure','def ctEnclosure (ℓ : ℚ) (hℓ : 0<ℓ) (w : ℕ) (q : Fin 8) (P : ℕ) : NonemptyInterval ℚ := by sorry'),
api=[('TauCeti.Computational.ctEnclosure_sound','characterisation','The exact scalar lies between the returned endpoints.','theorem ctEnclosure_sound (ℓ : ℚ) (hℓ : 0<ℓ) (w : ℕ) (q : Fin 8) (P : ℕ) : ((ctEnclosure ℓ hℓ w q P).fst:ℝ)≤ctExplicitFormula (ℓ:ℝ) w q ∧ ctExplicitFormula (ℓ:ℝ) w q≤((ctEnclosure ℓ hℓ w q P).snd:ℝ) := by sorry'),
('TauCeti.Computational.ctEnclosure_width','projection','The rational width meets the requested binary accuracy.','theorem ctEnclosure_width (ℓ : ℚ) (hℓ : 0<ℓ) (w : ℕ) (q : Fin 8) (P : ℕ) : (ctEnclosure ℓ hℓ w q P).snd-(ctEnclosure ℓ hℓ w q P).fst≤1/(2:ℚ)^P := by sorry'),
('TauCeti.Computational.ctEnclosure_shared','compatibility','The equal Fourier-value indices use the same enclosure.','theorem ctEnclosure_shared (ℓ : ℚ) (hℓ : 0<ℓ) (w P : ℕ) : ctEnclosure ℓ hℓ w 1 P=ctEnclosure ℓ hℓ w 4 P := by sorry')],
tests=[('TauCeti.Computational.test_ct_enclosure_unit','computation','At ℓ=1 and precision 8 the shared Fourier value lies inside (4/5,41/50).','example (w : ℕ) : 4/5<(ctEnclosure 1 (by sorry) w 1 8).fst ∧ (ctEnclosure 1 (by sorry) w 1 8).snd<41/50 := by sorry'),
('TauCeti.Computational.test_ct_enclosure_weight_zero','degenerate','Weight zero is an allowed I₀ evaluation, with a nonempty enclosure.','example (ℓ : ℚ) (hℓ : 0<ℓ) (P : ℕ) : (ctEnclosure ℓ hℓ 0 2 P).fst≤(ctEnclosure ℓ hℓ 0 2 P).snd := by sorry'),
('TauCeti.Computational.test_ct_enclosure_not_exact','non-example','The rational interval cannot be a singleton for 8/π².','example (w P : ℕ) : (ctEnclosure 1 (by sorry) w 1 P).fst<(ctEnclosure 1 (by sorry) w 1 P).snd := by sorry')],uses=[('CT stored witnesses','Supplies the certified analytic entries for exact rational negativity checks.')])
gap('CT analytic formula and evaluator refinements','Import the intrinsic F/G test functions, K∞, J_F and Fourier conventions from the proposed LevelOneAutomorphicFormsForClassicalGroups owner routed by PAPER-CHENEVIER-TAIBI-20; it has no atlas stage to cite yet. Split the comparison with the eight numerical right-hand sides, weighted alternating remainder, certified elementary and digamma/trigamma evaluators, argument reduction and precision-increasing termination. The numerical G formulas hold without GRH; their automorphic positivity application requires GRH. Only the French public CL Proposition 3.17 and comments pp.304–307 were read, not the English published Proposition 9.3.18.',[form,encl])
riso=add(4,'certified-polynomial-root-isolation','Complete isolation of rational-polynomial roots','construction',
'For nonzero f∈ℚ[X], isolatePolynomialRoots f returns a finite list of AlgebraicRootCertificate objects, each using f, with pairwise disjoint closed rational rectangles, and whose decoded values are exactly the distinct complex roots of f. Multiplicities are retained separately by square-free factorization; the output list counts distinct roots. A constant nonzero polynomial returns the empty list.',
 ['Use exact square-free factorization and certified complex root counting in rational rectangles. Subdivide until each remaining rectangle contains a single distinct root and all roots are accounted for. A separation bound and a global degree/count argument prove termination and completeness; these are explicit proof obligations, not supplied by approximate root locations.'],[root,qfc],[arb('§5, pp.7–8','Enclosures and precision refinement are the numerical framework; the exact root-count and separation algorithm still requires its own source proof.')],
 ('TauCeti.Computational.isolatePolynomialRoots','def isolatePolynomialRoots (f : Polynomial ℚ) (hf : f≠0) : List AlgebraicRootCertificate := by sorry'),
api=[('TauCeti.Computational.isolatePolynomialRoots_polynomial','projection','Every output uses the input polynomial.','theorem isolatePolynomialRoots_polynomial (f : Polynomial ℚ) (hf : f≠0) (c : AlgebraicRootCertificate) (hc : c∈isolatePolynomialRoots f hf) : c.polynomial=f := by sorry'),
('TauCeti.Computational.isolatePolynomialRoots_complete','characterisation','The decoded values are exactly all distinct roots.','theorem isolatePolynomialRoots_complete (f : Polynomial ℚ) (hf : f≠0) (z : ℂ) : aeval z f=0 ↔ ∃ c∈isolatePolynomialRoots f hf, (c.value:ℂ)=z := by sorry'),
('TauCeti.Computational.isolatePolynomialRoots_nodup','other','No root occurs twice.','theorem isolatePolynomialRoots_nodup (f : Polynomial ℚ) (hf : f≠0) : ((isolatePolynomialRoots f hf).map AlgebraicRootCertificate.value).Nodup := by sorry'),
('TauCeti.Computational.isolatePolynomialRoots_disjoint','other','Different output rectangles are disjoint.','theorem isolatePolynomialRoots_disjoint (f : Polynomial ℚ) (hf : f≠0) (a b : AlgebraicRootCertificate) (ha : a∈isolatePolynomialRoots f hf) (hb : b∈isolatePolynomialRoots f hf) (hab : a≠b) : Disjoint (complexBoxSet (a.re,a.im)) (complexBoxSet (b.re,b.im)) := by sorry')],
tests=[('TauCeti.Computational.test_isolate_constant','degenerate','A nonzero constant has no roots.','example : isolatePolynomialRoots (1:Polynomial ℚ) (by sorry)=[] := by sorry'),
('TauCeti.Computational.test_isolate_repeated','non-example','X² returns one distinct root, not two boxes containing zero.','example : (isolatePolynomialRoots (X^2:Polynomial ℚ) (by sorry)).length=1 := by sorry'),
('TauCeti.Computational.test_isolate_complex','computation','X²+1 returns two distinct complex roots.','example : (isolatePolynomialRoots (X^2+1:Polynomial ℚ) (by sorry)).length=2 := by sorry')],uses=[('CN.4 certified roots','Counts all roots and proves the selected enclosures isolate them.'),('CN.2 archimedean embeddings','Attach each numerical root to an exact embedding.')],planet='Certified root isolation')
gap('Polynomial root-isolation proof','Acquire and decompose an exact complex root-count method, rational rectangle subdivision, root separation and termination. The output contracts are explicit but no root-count algorithm or proof has yet been read in full. For real-valued analytic functions, sign-change enclosures additionally require continuity; uniqueness requires monotonicity or a derivative condition.',[riso])

lfunc=base('mathlib:DirichletCharacter.LFunction','Mathlib/NumberTheory/LSeries/DirichletContinuation.lean','The meromorphic continuation of a Dirichlet L-function; the raw totalized Dirichlet series is not used outside Re(s)>1.','def')
primitive=base('mathlib:DirichletCharacter.IsPrimitive','Mathlib/NumberTheory/DirichletCharacter/Basic.lean','The character conductor equals its modulus.','def')
lenc=add(4,'dirichlet-l-value-enclosure','Certified continued Dirichlet L-values','construction',
'For a primitive complex Dirichlet character χ of positive modulus q, a rational complex point z away from the principal-character pole at s=1, and requested precision P, dirichletLBox returns a rational complex rectangle containing the native continued LFunction(χ,z), with each component width at most 2^(−P). Character values require certified algebraic presentations. Euler–Maclaurin or an approximate functional equation supplies analytic continuation evaluation; the raw Dirichlet series is used only where it converges.',
 ['Import the native continued function. Evaluate finite character sums and special-function terms with enclosing arithmetic, then add a proved uniform remainder. The principal-character pole is rejected by hypothesis. For nonrational evaluation points, consume a shrinking input enclosure and a local derivative bound in the same evaluator.'],[lfunc,primitive,cb,root], [src('Platt','§§4–6 and §7, pp.3–15','Euler-MacLaurin','The computational target uses the continued function and independently bounded analytic errors. Only the specified passages, not the complete algorithm proof, have been read.')],
 ('TauCeti.Computational.dirichletLBox','''def dirichletLBox (q : ℕ) [NeZero q] (χ : DirichletCharacter ℂ q)
 (z : ℚ × ℚ) (hz : χ≠1 ∨ (z.1:ℂ)+(z.2:ℂ)*Complex.I≠1) (P : ℕ) :
 NonemptyInterval ℚ × NonemptyInterval ℚ := by sorry'''),
api=[('TauCeti.Computational.dirichletLBox_sound','compatibility','The native meromorphic L-value is enclosed.','theorem dirichletLBox_sound (q : ℕ) [NeZero q] (χ : DirichletCharacter ℂ q) (z : ℚ × ℚ) (hz : χ≠1 ∨ (z.1:ℂ)+(z.2:ℂ)*Complex.I≠1) (P : ℕ) : DirichletCharacter.LFunction χ ((z.1:ℂ)+(z.2:ℂ)*Complex.I)∈complexBoxSet (dirichletLBox q χ z hz P) := by sorry'),
('TauCeti.Computational.dirichletLBox_width','projection','Both component widths are at most 2^(−P).','theorem dirichletLBox_width (q : ℕ) [NeZero q] (χ : DirichletCharacter ℂ q) (z : ℚ × ℚ) (hz : χ≠1 ∨ (z.1:ℂ)+(z.2:ℂ)*Complex.I≠1) (P : ℕ) : (dirichletLBox q χ z hz P).1.snd-(dirichletLBox q χ z hz P).1.fst≤1/(2:ℚ)^P ∧ (dirichletLBox q χ z hz P).2.snd-(dirichletLBox q χ z hz P).2.fst≤1/(2:ℚ)^P := by sorry'),
('TauCeti.Computational.dirichletLBox_nonvanishing','other','Exclusion of zero certifies nonvanishing.','theorem dirichletLBox_nonvanishing (q : ℕ) [NeZero q] (χ : DirichletCharacter ℂ q) (z : ℚ × ℚ) (hz : χ≠1 ∨ (z.1:ℂ)+(z.2:ℂ)*Complex.I≠1) (P : ℕ) (h : (0:ℂ)∉complexBoxSet (dirichletLBox q χ z hz P)) : DirichletCharacter.LFunction χ ((z.1:ℂ)+(z.2:ℂ)*Complex.I)≠0 := by sorry')],
tests=[('TauCeti.Computational.test_lbox_zeta_two','computation','The modulus-one value at 2 encloses ζ(2).','example (P : ℕ) : riemannZeta 2∈complexBoxSet (dirichletLBox 1 1 (2,0) (by sorry) P) := by sorry'),
('TauCeti.Computational.test_lbox_pole','non-example','The principal modulus-one input at 1 fails the pole guard.','example : ¬((1:DirichletCharacter ℂ 1)≠1 ∨ ((1:ℚ):ℂ)+((0:ℚ):ℂ)*Complex.I≠1) := by sorry'),
('TauCeti.Computational.test_lbox_critical_line','compatibility','The central point uses the continued L-function, even though its raw Dirichlet series is outside absolute convergence.','example (q : ℕ) [NeZero q] (χ : DirichletCharacter ℂ q) (P : ℕ) : DirichletCharacter.LFunction χ (1/2)∈complexBoxSet (dirichletLBox q χ (1/2,0) (by sorry) P) := by sorry')],uses=[('Platt Theorem 7.2','Central-value exclusion certificates.'),('CN.4 continued L-value evaluation','Exact analytic function plus validated arithmetic and tails.')],planet='Certified L-value enclosure')
pls=[src('Platt','Theorems 7.1–7.2, pp.14–15','primitive character modulus','The published computation is a target to certify; no machine data or Turing certificates have been replayed in this pass.')]
pgrh=add(4,'platt-bounded-height-grh','Platt’s finite-conductor zero certificate target','theorem',
'For primitive χ of modulus q≤400000, every zero s of the native LFunction in 0<Re(s)<1 with |Im(s)|≤H(q) has Re(s)=1/2, where H(q)=max(10⁸/q,7.5·10⁷/q+200) for even q and max(10⁸/q,3.75·10⁷/q+200) for odd q. This parity is the modulus parity, not character parity. The unconditional finite computation is not an assumption of global GRH.',
 ['Reconstruct the character enumeration, interval evaluations, sign-change zero isolations and Turing upper count. Equality between the isolated zero count and the upper count excludes missed off-line zeros. This chain and its datasets remain recorded gaps.'],[lenc,lfunc,primitive],pls,
 ('TauCeti.Computational.platt_bounded_height','''theorem platt_bounded_height (q : ℕ) [NeZero q] (χ : DirichletCharacter ℂ q)
 (hχ : χ.IsPrimitive) (hq : q≤400000) (s : ℂ) (hs : 0<s.re ∧ s.re<1)
 (ht : |s.im|≤max (100000000/(q:ℝ)) ((if Even q then 75000000 else 37500000)/(q:ℝ)+200))
 (hz : DirichletCharacter.LFunction χ s=0) : s.re=1/2 := by sorry'''),acceptance=['Height zero is included. Endpoint and central zeros need their explicit count conventions.'])
pcen=add(4,'platt-central-nonvanishing','Platt’s central nonvanishing target','theorem',
'For every primitive complex Dirichlet character of modulus q≤2000000, LFunction(χ,1/2)≠0. This is a separate finite certificate target from the bounded-height zero-line theorem.',
 ['Enumerate every primitive character and produce an interval for its central value excluding zero. Increase certified precision in every unresolved case; never accept a box merely because its midpoint is nonzero.'],[lenc,lfunc,primitive],pls,
 ('TauCeti.Computational.platt_central_nonvanishing','theorem platt_central_nonvanishing (q : ℕ) [NeZero q] (χ : DirichletCharacter ℂ q) (hχ : χ.IsPrimitive) (hq : q≤2000000) : DirichletCharacter.LFunction χ (1/2)≠0 := by sorry'),acceptance=['Every unresolved interval requires a higher-precision certificate. A finite list of already resolved characters is not completeness.'])
add(4,'small-conductor-real-zero-exclusion','No real zeros for conductor at most 400000','theorem',
'For primitive χ of modulus q≤400000 and real s with 0<s<1, the native continued LFunction(χ,s) is nonzero. This is the exact computation input used by Bennett–Siksek Proposition 7.2.',
 ['A hypothetical real zero has height zero, so the bounded-height theorem forces s=1/2. The separate central nonvanishing theorem excludes that value.'],[pgrh,pcen],pls+[src('BennettSiksek','§7, proof of Proposition 7.2, p.376','real zeros','The routed application combines both Platt computations.')],
 ('TauCeti.Computational.small_conductor_no_real_zero','theorem small_conductor_no_real_zero (q : ℕ) [NeZero q] (χ : DirichletCharacter ℂ q) (hχ : χ.IsPrimitive) (hq : q≤400000) (s : ℝ) (hs : 0<s ∧ s<1) : DirichletCharacter.LFunction χ (s:ℂ)≠0 := by sorry'),acceptance=['The open real interval excludes the pole at 1 and trivial zeros outside the range.'])
gap('Platt analytic and data certification','Read and split the complete Euler–Maclaurin/FFT evaluation, error bounds, sampling and upsampling, real completed-function normalization, Turing count and primitive-character enumeration. Recover and verify the actual full finite datasets or regenerate certificates. This pass read the result and selected sampling/error passages only; it does not claim the 400000-modulus computation or the two-million central checks have been formalized or replayed.',[lenc,pgrh,pcen])
coverSupplier=req('GeometryOfNumbersAndQuadraticArithmetic:GN.5','Exact Fincke–Pohst enumeration with a completeness theorem: for symmetric positive-definite rational B and rational c≥0, return every integer vector x with xᵀBx≤c. An LLL short-vector output is insufficient. Expose the exact cutoff and allow an enlarged cover whose excess vectors are retained explicitly.',[nid(4,'effective-ellipsoid-cover')])
cover=add(4,'effective-ellipsoid-cover','Effective vectors from a certified ellipsoid cover','construction',
'Given a certified finite cover S of all integer vectors x with xᵀBx≤c, effectiveEllipsoidCover filters S by nonnegative coordinates and the exact rational bound xᵀBx≤c. If B is entrywise below the real target Gram matrix A, then every effective integer x with xᵀAx≤c remains in the output. The result may contain vectors failing the true A-bound, so it is a cover of the required set, not an exact list for A. A safety factor such as 1.001 must appear in the supplied c and never be silently described as the original cutoff.',
 ['Import GN.5’s complete exact enumeration. Filter with decidable integer/rational inequalities. The effective Gram comparison proves that each required A-short vector is B-short and therefore was enumerated.'],[coverSupplier,eff],[src('CT','Remark 2.11 and §2.4.3, pp.281–282','effective elements','The downstream effectivity filter and its completeness implication; generic Fincke–Pohst enumeration belongs to GN.5.')],
 ('TauCeti.Computational.effectiveEllipsoidCover','''def effectiveEllipsoidCover {n : ℕ} (B : Matrix (Fin n) (Fin n) ℚ) (c : ℚ)
 (S : Finset (Fin n → ℤ)) : Finset (Fin n → ℤ) := by
 classical
 exact S.filter (fun x => (∀ i, 0≤x i) ∧ (∑ i, ∑ j, B i j*(x i:ℚ)*(x j:ℚ))≤c)'''),
api=[('TauCeti.Computational.mem_effectiveEllipsoidCover','characterisation','Membership is membership in S plus the two exact filter conditions.','theorem mem_effectiveEllipsoidCover {n : ℕ} (B : Matrix (Fin n) (Fin n) ℚ) (c : ℚ) (S : Finset (Fin n → ℤ)) (x : Fin n → ℤ) : x∈effectiveEllipsoidCover B c S ↔ x∈S ∧ (∀ i, 0≤x i) ∧ (∑ i, ∑ j, B i j*(x i:ℚ)*(x j:ℚ))≤c := by sorry'),
('TauCeti.Computational.effectiveEllipsoidCover_subset','projection','Filtering never invents a vector.','theorem effectiveEllipsoidCover_subset {n : ℕ} (B : Matrix (Fin n) (Fin n) ℚ) (c : ℚ) (S : Finset (Fin n → ℤ)) : effectiveEllipsoidCover B c S⊆S := by sorry'),
('TauCeti.Computational.effectiveEllipsoidCover_complete','compatibility','Every nonnegative B-short vector is retained when S is exhaustive.','theorem effectiveEllipsoidCover_complete {n : ℕ} (B : Matrix (Fin n) (Fin n) ℚ) (c : ℚ) (S : Finset (Fin n → ℤ)) (hS : ∀ x : Fin n → ℤ, (∑ i, ∑ j, B i j*(x i:ℚ)*(x j:ℚ))≤c → x∈S) (x : Fin n → ℤ) (hx : ∀ i, 0≤x i) (hB : (∑ i, ∑ j, B i j*(x i:ℚ)*(x j:ℚ))≤c) : x∈effectiveEllipsoidCover B c S := by sorry')],
tests=[('TauCeti.Computational.test_effective_cover_zero','degenerate','The zero vector survives any nonnegative cutoff when supplied.','example {n : ℕ} (B : Matrix (Fin n) (Fin n) ℚ) (c : ℚ) (hc : 0≤c) : (0:Fin n → ℤ)∈effectiveEllipsoidCover B c {0} := by sorry'),
('TauCeti.Computational.test_effective_cover_negative','non-example','A negative coordinate is rejected even inside the ellipsoid.','example : (fun _ : Fin 1 => (-1:ℤ))∉effectiveEllipsoidCover (fun _ _ => (1:ℚ)) 2 {fun _ => (-1:ℤ)} := by sorry'),
('TauCeti.Computational.test_effective_cover_boundary','computation','A vector on the exact rational boundary is retained.','example : (fun _ : Fin 1 => (1:ℤ))∈effectiveEllipsoidCover (fun _ _ => (1:ℚ)) 1 {fun _ => (1:ℤ)} := by sorry')],uses=[('CT Remark 2.11','Enumerate every short effective infinity type.'),('CT source correction E4','Keep exact-cut membership separate from an inflated safety cover.')],planet='Certified effective-vector cover')
ngcheck=add(4,'check-gram-negativity','Finite Gram-negativity checker','construction',
'checkNegativeGram I t is true exactly when every rational coordinate of t is nonnegative, t is not the zero vector, and the rational quadratic sum using upper interval endpoints is strictly negative. It verifies a raw proposed witness, independently of how t was found. For mixed-sign vectors this endpoint checker deliberately rejects the witness; use full interval products or a different certified bound instead.',
 ['All arithmetic and comparisons are rational and finite. A successful check constructs the previously specified NegativeGramCertificate with exactly the supplied vector.'],[neg,eff],[src('CT','Algorithms 2.4.4–2.4.5, pp.282–284','Check rigorously','Raw numerical search output is accepted only after this exact inequality.')],
 ('TauCeti.Computational.checkNegativeGram','''def checkNegativeGram {n : ℕ} (I : Matrix (Fin n) (Fin n) (NonemptyInterval ℚ)) (t : Fin n → ℚ) : Bool := by
 classical
 exact decide ((∀ i, 0≤t i) ∧ t≠0 ∧ (∑ i, ∑ j, (I i j).snd*t i*t j)<0)'''),
api=[('TauCeti.Computational.checkNegativeGram_iff','characterisation','Acceptance is exactly the three finite rational conditions.','theorem checkNegativeGram_iff {n : ℕ} (I : Matrix (Fin n) (Fin n) (NonemptyInterval ℚ)) (t : Fin n → ℚ) : checkNegativeGram I t=true ↔ (∀ i, 0≤t i) ∧ t≠0 ∧ (∑ i, ∑ j, (I i j).snd*t i*t j)<0 := by sorry'),
('TauCeti.Computational.checkNegativeGram_certificate','constructor','Success supplies a certificate with the same vector.','theorem checkNegativeGram_certificate {n : ℕ} (I : Matrix (Fin n) (Fin n) (NonemptyInterval ℚ)) (t : Fin n → ℚ) (h : checkNegativeGram I t=true) : ∃ c : NegativeGramCertificate I, c.vector=t := by sorry'),
('TauCeti.Computational.checkNegativeGram_scale','functoriality','Scaling by a positive rational preserves the Boolean verdict.','theorem checkNegativeGram_scale {n : ℕ} (I : Matrix (Fin n) (Fin n) (NonemptyInterval ℚ)) (t : Fin n → ℚ) (r : ℚ) (hr : 0<r) : checkNegativeGram I (fun i => r*t i)=checkNegativeGram I t := by sorry')],
tests=[('TauCeti.Computational.test_check_negative','computation','Upper endpoint −1 and vector 1 pass.','example : checkNegativeGram (n:=1) (fun _ _ => ⟨(-2,-1),by sorry⟩) (fun _ => 1)=true := by sorry'),
('TauCeti.Computational.test_check_zero_vector','degenerate','The zero vector never passes.','example {n : ℕ} (I : Matrix (Fin n) (Fin n) (NonemptyInterval ℚ)) : checkNegativeGram I 0=false := by sorry'),
('TauCeti.Computational.test_check_ambiguous_sign','non-example','An interval straddling zero fails even if its lower endpoint is negative.','example : checkNegativeGram (n:=1) (fun _ _ => ⟨(-2,1),by sorry⟩) (fun _ => 1)=false := by sorry')],uses=[('CT stored triples','Replays a proposed rational vector against certified analytic entries.'),('CN.5 routed certificate lists','Supplies genuine finite checking mathematics while provenance remains a handoff requirement.')])
ngdataset=add(4,'check-gram-dataset','Finite family of Gram certificates','construction',
'A raw Gram row is a dimension n, an n×n rational interval matrix and an n-coordinate rational vector. checkGramDataset applies checkNegativeGram to every row and returns their Boolean conjunction. Acceptance says exactly that every listed witness certifies a negative real quadratic value, assuming the analytic entries are enclosed. It does not assert that the list exhausts a mathematical search space; coverage comes separately from the enumeration certificate. Source identifiers, software pins and file hashes are handoff provenance, not new mathematical structures.',
 ['Use a dependent pair over n and a finite List. Check each row independently; prove the all-members equivalence by list induction.'],[ngcheck,encl,cover],[src('CT','Stored certificates of §§2.4.6,4.1–4.3','certificates','Replay every listed witness, while retaining the separate completeness and admissibility obligations.')],
 ('TauCeti.Computational.checkGramDataset','''def checkGramDataset
 (rows : List (Σ n : ℕ, Matrix (Fin n) (Fin n) (NonemptyInterval ℚ) × (Fin n → ℚ))) : Bool :=
 rows.all (fun r => checkNegativeGram r.2.1 r.2.2)'''),
api=[('TauCeti.Computational.checkGramDataset_iff','characterisation','All rows pass iff every member’s finite checker passes.','theorem checkGramDataset_iff (rows : List (Σ n : ℕ, Matrix (Fin n) (Fin n) (NonemptyInterval ℚ) × (Fin n → ℚ))) : checkGramDataset rows=true ↔ ∀ r∈rows, checkNegativeGram r.2.1 r.2.2=true := by sorry'),
('TauCeti.Computational.checkGramDataset_append','relation','Checking concatenation is the conjunction of the two checks.','theorem checkGramDataset_append (a b : List (Σ n : ℕ, Matrix (Fin n) (Fin n) (NonemptyInterval ℚ) × (Fin n → ℚ))) : checkGramDataset (a++b)=(checkGramDataset a && checkGramDataset b) := by sorry'),
('TauCeti.Computational.checkGramDataset_perm','functoriality','Reordering rows does not change acceptance.','theorem checkGramDataset_perm (a b : List (Σ n : ℕ, Matrix (Fin n) (Fin n) (NonemptyInterval ℚ) × (Fin n → ℚ))) (h : a.Perm b) : checkGramDataset a=checkGramDataset b := by sorry')],
tests=[('TauCeti.Computational.test_dataset_empty','degenerate','The empty list passes, proving nothing about coverage.','example : checkGramDataset []=true := by sorry'),
('TauCeti.Computational.test_dataset_single','computation','A one-row negative certificate passes.','example : checkGramDataset [⟨1,((fun _ _ => ⟨(-2,-1),by sorry⟩),(fun _ => 1))⟩]=true := by sorry'),
('TauCeti.Computational.test_dataset_bad_row','non-example','Adding a zero-vector row makes the entire dataset fail.','example (rows : List (Σ n : ℕ, Matrix (Fin n) (Fin n) (NonemptyInterval ℚ) × (Fin n → ℚ))) : checkGramDataset (rows++[⟨1,((fun _ _ => ⟨(-2,-1),by sorry⟩),(fun _ => 0))⟩])=false := by sorry')],uses=[('PAPER-CHENEVIER-TAIBI-20/certificates','The finite checking portion routed from CN.5 is placed in CN.4.'),('FiniteFieldsAndCharacterSums:FF.5 and EffectiveDiophantineMethods:ED.6','Preserve accepted CN.5 supplier links until their process-layer retargeting is approved.')],planet='Certified data verification')
N[-1]['realises'].append(f'{RID}:CN.5')
gap('CT dataset admissibility and complete replay','Bind each row to its exact infinity types, multiplicities and δ∈{0,1}; verify ε(U_iU_j)∈{−1,1} whenever δ_iδ_j=1. Prove the corrected multiplicity Gram reduction (diagonal A/m_i, lift weights t_i/m_i), retain the distinction between 12293 cover rows and the smaller exact cut, and replay every required list. The reviewed counts and seven sample evaluations are inherited evidence only, not a new full replay. No conditional δ=2 computation may be treated as an admissible certificate.',[ngdataset,encl,cover])
add(4,'multiplicity-gram-lift','Correct multiplicity lift for Gram witnesses','lemma',
'Let m_i>0 be block sizes, A∈ℝ and K an n×n real matrix. On the expanded index set {(i,r):0≤r<m_i}, put B_(i,r),(j,s)=A·δ_(i,r),(j,s)−K_ij. For any vector t, the expanded vector x_(i,r)=t_i/m_i satisfies xᵀBx=tᵀβt, where β_ij=(A/m_i)δ_ij−K_ij. Thus a certified negative value for β gives one for B. The lift is t_i/m_i; replacing it by t_i/√m_i changes the off-diagonal normalization. This equality does not assert equality of Euclidean unit-sphere minima.',
 ['Sum each constant block contribution and the diagonal terms separately. Each diagonal block contributes A·m_i·(t_i/m_i)²=A t_i²/m_i, while each off-diagonal block contributes −K_ij t_i t_j.'],[neg],[src('CT','§2.3 reduction, pp.275–276; corrected source issue E3','quadratic form','The numerical adapter uses the corrected diagonal and witness lift, not a false equality of unit-sphere minima.')],
 ('TauCeti.Computational.multiplicityGram_lift','''theorem multiplicityGram_lift {n : ℕ} (m : Fin n → ℕ) (hm : ∀ i, 0<m i)
 (A : ℝ) (K : Matrix (Fin n) (Fin n) ℝ) (t : Fin n → ℝ) :
 (∑ i : (Σ j : Fin n, Fin (m j)), ∑ j : (Σ k : Fin n, Fin (m k)),
 ((if i=j then A else 0)-K i.1 j.1)*(t i.1/(m i.1:ℝ))*(t j.1/(m j.1:ℝ)))
 = ∑ i, ∑ j, ((if i=j then A/(m i:ℝ) else 0)-K i j)*t i*t j := by sorry'''),acceptance=['With one block m=2, A=2, K=0 and t=1, both displayed quadratic values are 1. The square-root lift instead has value 2.'])
```

## Script: finish_nodes.py

```python
qname=lambda s:'TauCeti.Computational.'+s
prsize=add(1,'pratt-encoding-size','Bit size of a Pratt tree','definition',
'prattBitSize assigns one tag bit to the leaf. A node contributes 1 plus the binary lengths of n, a and its child count, plus the sizes of the children. Binary length is log₂(x)+1, including one bit for zero. A self-delimiting serialization has size at most a fixed constant multiple of this measure; that encoding comparison is a separate obligation.',
['Recurse over the existing finite tree; retain repeated factors and charge every occurrence.'],[cert],lcsrc,
(qname('prattBitSize'),'def prattBitSize : PrattCertificate → ℕ := by sorry'),
api=[(qname('prattBitSize_two'),'simp','The leaf costs one bit.','theorem prattBitSize_two : prattBitSize .two=1 := by sorry'),
(qname('prattBitSize_node'),'characterisation','The charge is the sum of header lengths and all child charges.','theorem prattBitSize_node (n a : ℕ) (cs : List PrattCertificate) : prattBitSize (.node n a cs)=1+(Nat.log2 n+1)+(Nat.log2 a+1)+(Nat.log2 cs.length+1)+(cs.map prattBitSize).sum := by sorry'),
(qname('prattBitSize_pos'),'other','Every finite tree has positive size.','theorem prattBitSize_pos (c : PrattCertificate) : 0<prattBitSize c := by sorry')],
tests=[(qname('test_size_leaf'),'degenerate','The leaf has size one.','example : prattBitSize .two=1 := by sorry'),
(qname('test_size_three'),'computation','The tree certifying 3 has size seven.','example : prattBitSize (.node 3 2 [.two])=7 := by sorry'),
(qname('test_size_repeated'),'non-example','Repeated children are charged repeatedly, not silently shared as a DAG.','example : prattBitSize (.node 5 2 [.two,.two])=10 := by sorry')],uses=[('Chvátal pp.3–4','Converts a logarithmic proof-length argument into an explicitly measured certificate target.')])
add(1,'pratt-quadratic-size','Quadratic bit-size bound for Pratt certificates','theorem',
'There is an absolute natural constant C such that every prime n has an accepted Pratt tree c of value n and prattBitSize(c)≤C·(log₂(n)+1)². This is an existence bound for certificates, not a bound on the cost of discovering the factorization of n−1.',
['Induct using the prime factors of n−1 with multiplicity, as in the source proof-length bound. Bound every header by a constant times the binary length of n. Sum the recursive charges. The translation of the source proof lines to this tree measure remains an explicit proof refinement.'],[prsize,nid(1,'pratt-certificate-complete')],lcsrc,
(qname('pratt_small_certificate'),'theorem pratt_small_certificate : ∃ C : ℕ, ∀ n : ℕ, n.Prime → ∃ c : PrattCertificate, c.value=n ∧ c.check=true ∧ prattBitSize c≤C*(Nat.log2 n+1)^2 := by sorry'),acceptance=['The constant is uniform in n. The accepted leaf handles n=2.'])

side=add(2,'phi-newton-side','A finite negative φ-Newton side','definition',
'For prime p and monic positive-degree φ∈ℤ[X], IsPhiNewtonSide p φ f s u e h d certifies the entire supporting side from (s,u) to (s+ed,u−hd), with slope −h/e. Require e,h,d>0, gcd(e,h)=1 and hd≤u. The two endpoint coefficient valuations equal their displayed ordinates. Every φ-expansion point lies on or above the line e·v_p(a_i)+h·i=e·u+h·s, and every point on that line has s≤i≤s+ed. Zero coefficients have valuation infinity. The φ-divisible initial segment has slope −∞ and is recorded separately by its multiplicity; it is not encoded with a finite e,h.',
['Use the already specified φ-expansion and coefficient Gauss valuation. Clear the slope denominator to use exact integer inequalities. This is a checked side of a φ-polygon, not a second owner of the generic Newton-polygon geometry in CA.3.'],[phi,phval,'ClassicalArithmeticCompletion:CA.3'],[src('GMN','Definitions 1.6–1.9, pp.7–8','negative rational number','Exact finite side certificate with maximal contact segment and the source’s negative geometric slope.')],
(qname('IsPhiNewtonSide'),'''def IsPhiNewtonSide (p : ℕ) (φ : Polynomial ℤ) (hφ : φ.Monic) (hm : 0<φ.natDegree)
 (f : Polynomial ℤ) (s u e h d : ℕ) : Prop :=
 0<e ∧ 0<h ∧ 0<d ∧ Nat.Coprime e h ∧ h*d≤u ∧
 coefficientValuation p (phiExpansion φ hφ hm f s)=(u:WithTop ℕ) ∧
 coefficientValuation p (phiExpansion φ hφ hm f (s+e*d))=((u-h*d:ℕ):WithTop ℕ) ∧
 (∀ i, ((e*u+h*s:ℕ):WithTop ℕ)≤(e:WithTop ℕ)*coefficientValuation p (phiExpansion φ hφ hm f i)+(h*i:ℕ)) ∧
 (∀ i, (e:WithTop ℕ)*coefficientValuation p (phiExpansion φ hφ hm f i)+(h*i:ℕ)=((e*u+h*s:ℕ):WithTop ℕ) → s≤i ∧ i≤s+e*d)'''),
api=[(qname('phiSide_denominator_pos'),'projection','The slope denominator is positive.','theorem phiSide_denominator_pos (p : ℕ) (φ : Polynomial ℤ) (hφ : φ.Monic) (hm : 0<φ.natDegree) (f : Polynomial ℤ) (s u e h d : ℕ) (H : IsPhiNewtonSide p φ hφ hm f s u e h d) : 0<e := by sorry'),
(qname('phiSide_left_nonzero'),'other','The left endpoint coefficient is nonzero.','theorem phiSide_left_nonzero (p : ℕ) (φ : Polynomial ℤ) (hφ : φ.Monic) (hm : 0<φ.natDegree) (f : Polynomial ℤ) (s u e h d : ℕ) (H : IsPhiNewtonSide p φ hφ hm f s u e h d) : phiExpansion φ hφ hm f s≠0 := by sorry'),
(qname('phiSide_length_pos'),'other','A side has strictly positive horizontal length ed.','theorem phiSide_length_pos (p : ℕ) (φ : Polynomial ℤ) (hφ : φ.Monic) (hm : 0<φ.natDegree) (f : Polynomial ℤ) (s u e h d : ℕ) (H : IsPhiNewtonSide p φ hφ hm f s u e h d) : 0<e*d := by sorry')],
tests=[(qname('test_phiSide_eisenstein'),'computation','X²−3 has the single 3-adic side of slope −1/2.','example : IsPhiNewtonSide 3 X (by sorry) (by sorry) (X^2-3) 0 1 2 1 1 := by sorry'),
(qname('test_phiSide_zero'),'degenerate','The zero polynomial has no finite side.','example (p : ℕ) (φ : Polynomial ℤ) (hφ : φ.Monic) (hm : 0<φ.natDegree) (s u e h d : ℕ) : ¬IsPhiNewtonSide p φ hφ hm 0 s u e h d := by sorry'),
(qname('test_phiSide_wrong_slope'),'non-example','The slope of X²−3 is not −1.','example : ¬IsPhiNewtonSide 3 X (by sorry) (by sorry) (X^2-3) 0 2 1 1 2 := by sorry')],uses=[('GMN Theorems 1.15 and 1.19','Certifies the slope attached to each local factor.')],planet='φ-Newton polygon')
req('ClassicalArithmeticCompletion:CA.3','Generic lower convex hull, supporting-line and slope ordering contracts. The φ-adic coefficient conversion and residual-polynomial arithmetic are CN.2; geometric negative slopes must be negated when comparing with positive root valuations.',[side])
resid=add(2,'phi-residual-polynomial','Residual polynomial of a φ-Newton side','construction',
'For side data (s,u,e,h,d), phiResidualPolynomial has coefficient at Y^j equal to the reduction in F_φ=(ℤ/pℤ)[X]/(φ mod p) of a_(s+ej)/p^(u−hj), for 0≤j≤d. Divide each integer coefficient exactly before reducing. For a certified side the divisions are exact; points strictly above the side give zero. The endpoint coefficients are nonzero when φ mod p is irreducible, so the residual degree is d and Y does not divide it. Uniformizer p and reduction of the chosen φ are fixed conventions.',
['Use integer coefficient division, the native quotient AdjoinRoot and the finite monomial sum. Reduction and exact divisibility lemmas remain separate refinement inputs.'],[side,'FiniteFieldsAndCharacterSums:FF.0/certified-presentation-of-a-finite-field'],[src('GMN','Definition 1.9, p.8','residual polynomial','Coefficient-normalized residual data; no division takes place in characteristic p.')],
(qname('phiResidualPolynomial'),'''def phiResidualPolynomial (p : ℕ) (φ : Polynomial ℤ) (hφ : φ.Monic) (hm : 0<φ.natDegree)
 (f : Polynomial ℤ) (s u e h d : ℕ) : Polynomial (AdjoinRoot (φ.map (Int.castRingHom (ZMod p)))) :=
 ∑ j∈Finset.range (d+1), monomial j (AdjoinRoot.mk (φ.map (Int.castRingHom (ZMod p)))
 (((phiExpansion φ hφ hm f (s+e*j)).sum (fun i a => monomial i (a/(p:ℤ)^(u-h*j)))).map (Int.castRingHom (ZMod p))))'''),
api=[(qname('phiResidual_degree_le'),'other','No coefficient above d occurs.','theorem phiResidual_degree_le (p : ℕ) (φ : Polynomial ℤ) (hφ : φ.Monic) (hm : 0<φ.natDegree) (f : Polynomial ℤ) (s u e h d : ℕ) : (phiResidualPolynomial p φ hφ hm f s u e h d).natDegree≤d := by sorry'),
(qname('phiResidual_degree'),'compatibility','On a certified side over an irreducible residue polynomial the degree is exactly d.','theorem phiResidual_degree (p : ℕ) [Fact p.Prime] (φ : Polynomial ℤ) (hφ : φ.Monic) (hm : 0<φ.natDegree) (hirr : Irreducible (φ.map (Int.castRingHom (ZMod p)))) (f : Polynomial ℤ) (s u e h d : ℕ) (H : IsPhiNewtonSide p φ hφ hm f s u e h d) : (phiResidualPolynomial p φ hφ hm f s u e h d).natDegree=d := by sorry'),
(qname('phiResidual_constant_ne_zero'),'projection','The left endpoint gives a nonzero constant coefficient.','theorem phiResidual_constant_ne_zero (p : ℕ) [Fact p.Prime] (φ : Polynomial ℤ) (hφ : φ.Monic) (hm : 0<φ.natDegree) (hirr : Irreducible (φ.map (Int.castRingHom (ZMod p)))) (f : Polynomial ℤ) (s u e h d : ℕ) (H : IsPhiNewtonSide p φ hφ hm f s u e h d) : (phiResidualPolynomial p φ hφ hm f s u e h d).coeff 0≠0 := by sorry')],
tests=[(qname('test_residual_eisenstein'),'computation','For X²−3 the residual polynomial is Y−1, not Y or Y²−1.','example : phiResidualPolynomial 3 X (by sorry) (by sorry) (X^2-3) 0 1 2 1 1=X-1 := by sorry'),
(qname('test_residual_zero'),'degenerate','Raw zero input gives zero residual output.','example (p : ℕ) (φ : Polynomial ℤ) (hφ : φ.Monic) (hm : 0<φ.natDegree) (s u e h d : ℕ) : phiResidualPolynomial p φ hφ hm 0 s u e h d=0 := by sorry'),
(qname('test_residual_repeated'),'non-example','(X−3)² has repeated residual (Y−1)², so a square-free residual hypothesis cannot be omitted.','example : phiResidualPolynomial 3 X (by sorry) (by sorry) ((X-3)^2) 0 2 1 1 2=(X-1)^2 := by sorry')],uses=[('GMN Theorem 1.19 and Corollary 1.20','Separates prime factors and detects when first-order data are insufficient.')])
ore=add(2,'ore-residual-irreducibility','Ore residual irreducibility criterion','theorem',
'Let p be prime, φ and f monic in ℤ[X], deg φ>0, and φ mod p irreducible. Suppose f mod p=(φ mod p)^n, n>0, and the whole φ-polygon is the finite side from (0,hd) to (ed,0), with n=ed and coprime positive h,e. If its residual polynomial is irreducible over F_φ, then f is irreducible over ℚ_p. For a root θ the resulting local extension has ramification index e and residue degree deg(φ)·deg(R); these intrinsic invariants and their normalization are supplied by LocalFieldsRamification.',
['Use the product theorem for φ-polygons and residual polynomials, the polygon factorization theorem and residual factorization theorem. An irreducible residual factor of exponent one admits only one irreducible local factor. The native local degree formula then gives the ramification and residue degrees.'],[resid,lr0,'FiniteFieldsAndCharacterSums:FF.3/hensel-lifting-modulo-prime-powers'],[src('GMN','Theorem 1.19 and Corollary 1.20, pp.14–15','number of irreducible factors','Single residual factor of multiplicity one; finite side and all integrality hypotheses retained.')],
(qname('ore_residual_irreducible'),'''theorem ore_residual_irreducible (p : ℕ) [Fact p.Prime]
 (φ f : Polynomial ℤ) (hφ : φ.Monic) (hm : 0<φ.natDegree) (hf : f.Monic)
 (hirr : Irreducible (φ.map (Int.castRingHom (ZMod p)))) (e h d : ℕ)
 (H : IsPhiNewtonSide p φ hφ hm f 0 (h*d) e h d)
 (hred : f.map (Int.castRingHom (ZMod p))=(φ.map (Int.castRingHom (ZMod p)))^(e*d))
 (hR : Irreducible (phiResidualPolynomial p φ hφ hm f 0 (h*d) e h d)) :
 Irreducible (f.map (Int.castRingHom ℚ_[p])) := by sorry
-- Intrinsic ramification/residue-degree conclusions require the owner's local-extension
-- carrier and normalization bridge; those conclusions are omitted here, as Protocol 13 requires.
'''),acceptance=['X²−3 is irreducible over ℚ₃, e=2 and residue degree 1. The repeated residual polynomial of (X−3)² does not meet the hypothesis.'],planet='Ore residual criterion')
gap('First-order Newton factorization refinements','Prove admissible-development invariance and the product theorem; separate the polygon factorization theorem from residual factorization. Add the explicit square-free residual assembly and compare each factor’s e and residue degree with the native local-extension invariants. The integer presentation suffices for the current global number-field inputs; general finite local base fields use the same construction after the owner’s valuation-ring bridge. Repeated residual factors require further refinement or the independent maximal-order algorithm, never a first-order separability assertion.',[side,resid,ore,primecert])
aeq=add(0,'algebraic-equality-check','Equality of isolated algebraic numbers','construction',
'algebraicEqual compares the decoded native algebraic numbers of two certified isolated-root presentations. Its Boolean answer is true exactly when the values are equal. Finite verification uses polynomial gcd and a common-root isolation argument; overlapping rectangles alone do not prove equality, and disjoint rectangles are only a sufficient inequality test.',
['Compare the annihilating polynomials and isolate their common roots. Terminating certified root-count and separation algorithms are recorded missing proof inputs. The prototype is a specification of the exact answer.'],[root],formal,
(qname('algebraicEqual'),'def algebraicEqual (a b : AlgebraicRootCertificate) : Bool := by sorry'),
api=[(qname('algebraicEqual_iff'),'characterisation','Acceptance is equality in the native relative algebraic closure.','theorem algebraicEqual_iff (a b : AlgebraicRootCertificate) : algebraicEqual a b=true ↔ a.value=b.value := by sorry'),
(qname('algebraicEqual_refl'),'simp','Every presentation equals itself.','theorem algebraicEqual_refl (a : AlgebraicRootCertificate) : algebraicEqual a a=true := by sorry'),
(qname('algebraicEqual_symm'),'relation','The verdict is symmetric.','theorem algebraicEqual_symm (a b : AlgebraicRootCertificate) : algebraicEqual a b=algebraicEqual b a := by sorry')],
tests=[(qname('test_algebraic_equal_zero'),'degenerate','Two rational zero inputs compare equal.','example : algebraicEqual (rationalRootCertificate 0) (rationalRootCertificate 0)=true := by sorry'),
(qname('test_algebraic_equal_fraction'),'computation','Different rational expressions for the same number compare equal.','example : algebraicEqual (rationalRootCertificate (2/4)) (rationalRootCertificate (1/2))=true := by sorry'),
(qname('test_algebraic_unequal_fraction'),'non-example','One half and one third compare unequal.','example : algebraicEqual (rationalRootCertificate (1/2)) (rationalRootCertificate (1/3))=false := by sorry')],uses=[('CN.0 exact comparisons','Separates native value equality from presentation equality.')])
nativeL=base('mathlib:ModularForm.L','Mathlib/NumberTheory/ModularForms/LFunction.lean','The continued modular L-function, defined from the completed Mellin transform; positive weight and arithmetic subgroup are parameters.','def')
base('mathlib:ModularForm.Λ','Mathlib/NumberTheory/ModularForms/LFunction.lean','Completed L-function from the native weak functional-equation pair, for positive weight and arithmetic subgroup.','def')
base('mathlib:CuspForm.differentiable_Λ','Mathlib/NumberTheory/ModularForms/LFunction.lean','The completed L-function of a positive-weight cusp form on an arithmetic subgroup is entire.')
base('mathlib:CuspForm.differentiable_L','Mathlib/NumberTheory/ModularForms/LFunction.lean','The uncompleted continuation is entire for a positive-weight cusp form.')
base('tauceti:CuspForm.hasEntireExtension_qExpansion_coeff','TauCeti/NumberTheory/ModularForms/LFunction.lean','For a positive-weight cusp form on an arithmetic subgroup, the coefficient Dirichlet series has entire extension width^(−s)·L(s); agreement requires Re(s)>k/2+1.')
base('tauceti:TauCeti.ModularForm.eq_of_sturm_bound','TauCeti/NumberTheory/ModularForms/SturmBound.lean','Equal weight, finite relative index, discrete strict periods and coefficients through (k·relativeIndex).toNat/12 imply equality; uses the actual strict cusp width.')
base('mathlib:AdjoinRoot','Mathlib/RingTheory/AdjoinRoot.lean','The native quotient R[X]/(f), reused for the residual coefficient field.','def')
base('mathlib:AdjoinRoot.mk','Mathlib/RingTheory/AdjoinRoot.lean','Canonical polynomial-to-root-quotient ring homomorphism.','def')
mlbox=add(4,'cusp-l-value-enclosure','Certified cusp-form L-value enclosure','construction',
'For positive integer weight k, a level-one cusp form f with integral q-expansion, a rational complex argument z and precision P, cuspLBox returns a rational rectangle containing the native continued ModularForm.L(k,f,z), with each coordinate width at most 2^(−P). The finite coordinates of f are supplied through the certified Miller basis. The algorithm uses the imported functional equation and a smoothed series with effective coefficient and truncation bounds; it does not use the raw Dirichlet series outside its convergence half-plane. General levels, algebraic coefficient embeddings and Fricke-transformed data are supplier refinements of the same evaluation contract.',
['Obtain exact finite coordinates through the integral lattice and Miller basis. Import the native continuation and functional equation. Enclose finite sums and bound both smoothed tails before outward rounding. Effective constants and the general-level normalization comparison remain recorded proof inputs.'],[nativeL,cb,miller,sl], [src('Arb','§§5–6, pp.7–10','rigorous','Numerical enclosure design applied to the already existing continued function, not a theorem constructing its continuation.')],
(qname('cuspLBox'),'''def cuspLBox (k : ℕ) (hk : 0<(k:ℤ)) (f : CuspForm 𝒮ℒ (k:ℤ))
 (hf : f∈integralCuspLattice k) (z : ℚ × ℚ) (P : ℕ) : NonemptyInterval ℚ × NonemptyInterval ℚ := by sorry'''),
api=[(qname('cuspLBox_contains'),'compatibility','The rectangle encloses the native continuation at the rational point.','theorem cuspLBox_contains (k : ℕ) (hk : 0<(k:ℤ)) (f : CuspForm 𝒮ℒ (k:ℤ)) (hf : f∈integralCuspLattice k) (z : ℚ × ℚ) (P : ℕ) : ModularForm.L hk f ((z.1:ℂ)+(z.2:ℂ)*Complex.I)∈complexBoxSet (cuspLBox k hk f hf z P) := by sorry'),
(qname('cuspLBox_width'),'other','Both coordinate widths satisfy the requested absolute precision.','theorem cuspLBox_width (k : ℕ) (hk : 0<(k:ℤ)) (f : CuspForm 𝒮ℒ (k:ℤ)) (hf : f∈integralCuspLattice k) (z : ℚ × ℚ) (P : ℕ) : let B:=cuspLBox k hk f hf z P; B.1.snd-B.1.fst≤(2:ℚ)^(-(P:ℤ)) ∧ B.2.snd-B.2.fst≤(2:ℚ)^(-(P:ℤ)) := by sorry'),
(qname('cuspLBox_excludes_zero'),'other','Excluding zero proves nonvanishing and never an exact vanishing claim.','theorem cuspLBox_excludes_zero (k : ℕ) (hk : 0<(k:ℤ)) (f : CuspForm 𝒮ℒ (k:ℤ)) (hf : f∈integralCuspLattice k) (z : ℚ × ℚ) (P : ℕ) (H : (0:ℂ)∉complexBoxSet (cuspLBox k hk f hf z P)) : ModularForm.L hk f ((z.1:ℂ)+(z.2:ℂ)*Complex.I)≠0 := by sorry')],
tests=[(qname('test_cuspL_zero'),'degenerate','A zero cusp form has an enclosure containing zero.','example (P : ℕ) : (0:ℂ)∈complexBoxSet (cuspLBox 12 (by sorry) 0 (by sorry) (1,0) P) := by sorry'),
(qname('test_cuspL_precision'),'computation','At precision eight both widths are at most 1/256.','example (f : CuspForm 𝒮ℒ 12) (hf : f∈integralCuspLattice 12) : let B:=cuspLBox 12 (by sorry) f hf (1,0) 8; B.1.snd-B.1.fst≤1/256 ∧ B.2.snd-B.2.fst≤1/256 := by sorry'),
(qname('test_cuspL_no_zero_inference'),'non-example','A rational rectangle containing zero also contains a nonzero number.','example : (0:ℂ)∈complexBoxSet (⟨(-1,1),by sorry⟩,⟨(-1,1),by sorry⟩) ∧ (1:ℂ)∈complexBoxSet (⟨(-1,1),by sorry⟩,⟨(-1,1),by sorry⟩) := by sorry')],uses=[('RT-AREA-computational/1–2','Numerical nonvanishing is exported to the BSD owner, which assembles exact rank certificates.'),('ModularForms layer 7','Evaluate its existing analytic object with explicit tails.')])
gap('Effective modular L evaluation','Split the smoothed functional-equation identity, effective coefficient-growth constant, incomplete-gamma enclosure and truncation bound. General level requires the correct cusp width and Fricke image, with nebentypus, bad-prime and embedding conventions supplied by the owner. Exact lower derivatives and analytic rank are assembled in RankZeroOneBSD, not inferred from a box containing zero.',[mlbox])
mdata=add(3,'modular-data-equality','Exact equality of certified modular data','construction',
'modularDataEqual B a b checks equality of two arrays of isolated algebraic coefficients indexed by 0,…,B. For two same-weight modular forms on a finite-index subgroup Γ of SL₂(ℤ), set B=(k·[SL₂(ℤ):Γ]).toNat/12 and require that the decoded arrays equal the forms’ coefficients at their actual strict cusp width. Acceptance then proves equality by the native Sturm bound. An LMFDB orbit label is accepted only after the owner’s level, character and embedding convention identifies which intrinsic forms these arrays describe; a label alone does not provide either binding proof.',
['Apply the exact algebraic-value comparison at each index. Use the two coefficient binding proofs and the native Sturm theorem, including coefficient zero. Modular symbols, integral Hecke algebras, orbit labels and trace formulas are imported from their respective ModularForms layers.'],[aeq,'tauceti:TauCeti.ModularForm.eq_of_sturm_bound'],[src('Stein','Theorem 9.18, pp.171–172; §9.4','Sturm','The finite-data adapter uses the already built characteristic-zero equality theorem. Congruence modulo a prime is a separate node.')],
(qname('modularDataEqual'),'''def modularDataEqual (B : ℕ) (a b : Fin (B+1) → AlgebraicRootCertificate) : Bool := by
 classical
 exact decide (∀ i, algebraicEqual (a i) (b i)=true)'''),
api=[(qname('modularDataEqual_iff'),'characterisation','Acceptance is coefficientwise equality of native algebraic values.','theorem modularDataEqual_iff (B : ℕ) (a b : Fin (B+1) → AlgebraicRootCertificate) : modularDataEqual B a b=true ↔ ∀ i, (a i).value=(b i).value := by sorry'),
(qname('modularDataEqual_sound'),'compatibility','Correctly bound finite-index modular forms coincide on acceptance.','''theorem modularDataEqual_sound (Γ : Subgroup SL(2,ℤ)) [Γ.FiniteIndex] (k : ℤ)
 (f g : ModularForm (Γ.map (Matrix.SpecialLinearGroup.mapGL ℝ)) k)
 (a b : Fin ((k*Γ.index).toNat/12+1) → AlgebraicRootCertificate)
 (ha : ∀ i, ((a i).value:ℂ)=(qExpansion (Γ.map (Matrix.SpecialLinearGroup.mapGL ℝ)).strictWidthInfty f).coeff i.val)
 (hb : ∀ i, ((b i).value:ℂ)=(qExpansion (Γ.map (Matrix.SpecialLinearGroup.mapGL ℝ)).strictWidthInfty g).coeff i.val)
 (H : modularDataEqual ((k*Γ.index).toNat/12) a b=true) : f=g := by sorry'''),
(qname('modularDataEqual_symm'),'relation','Swapping the arrays preserves the verdict.','theorem modularDataEqual_symm (B : ℕ) (a b : Fin (B+1) → AlgebraicRootCertificate) : modularDataEqual B a b=modularDataEqual B b a := by sorry')],
tests=[(qname('test_modular_data_constant'),'degenerate','Bound zero still checks the constant coefficient.','example : modularDataEqual 0 (fun _ => rationalRootCertificate 0) (fun _ => rationalRootCertificate 1)=false := by sorry'),
(qname('test_modular_data_equal'),'computation','Identical arrays pass.','example (B : ℕ) (a : Fin (B+1) → AlgebraicRootCertificate) : modularDataEqual B a a=true := by sorry'),
(qname('test_modular_data_delta'),'non-example','Matching constant terms do not suffice at weight twelve: the first Δ coefficient differs from zero.','example : modularDataEqual 1 (fun i => rationalRootCertificate (if i.val=0 then 0 else 1)) (fun _ => rationalRootCertificate 0)=false := by sorry')],uses=[('ModularForms layer 9 orbit labels','Attach exact coefficient evidence to a named intrinsic form.'),('CN.3 equality acceptance','Retain weight, relative index and cusp width before truncating.')])
```

## Script: finalize.py

```python
"""Coverage and ownership reconciliation, applied by build.py after all nodes exist."""
byid={n['id']:n for n in N}
def attach(supplier,need,consumers):
    req(supplier,need,consumers)
    for ident in consumers:
        if ident in byid and supplier not in byid[ident]['prerequisites']:byid[ident]['prerequisites'].append(supplier)
# Fine Hensel suppliers already exist. Remove the obsolete coarse discovery request.
REQUESTS[:]=[r for r in REQUESTS if not(r['supplier']=='FiniteFieldsAndCharacterSums:FF.3' and r['neededBy']==[qfc])]
for r in REQUESTS:
    for ident in r['neededBy']:
        if ident in byid and r['supplier'] not in byid[ident]['prerequisites']:byid[ident]['prerequisites'].append(r['supplier'])
mfroot='tauceti:TauCetiRoadmap/ModularForms#'
mf7=mfroot+'layer-7-l-functions'
mf9=mfroot+'layer-9-the-lmfdb-invariant-layer'
mf10=mfroot+'layer-10-the-modular-curve-γℍ-and-the-dimension-formulas'
mf11=mfroot+'layer-11-the-eichlerselberg-trace-formula-level-one'
attach(mf7,'Use the existing functional equation with its actual Fricke sign, weight, level, character and coefficient embedding. Supply the normalization comparison for smoothed numerical evaluation; the native entire continuation is already built.',[mlbox])
attach(mf8,'Supply the native modular-symbol module and integral Hecke algebra, the finite Manin presentation at specified level and weight, and its period-dual comparison with forms. Retain torsion and transpose conventions. CN.3 computes matrices and binds finite coefficient arrays to these intrinsic objects.',[mdata,nid(3,'integral-hecke-matrix')])
attach(mf9,'Supply orbit-label invariants and their exact identification with an intrinsic newform, its coefficient field and chosen embedding. A database label alone never supplies the coefficient binding used by the equality checker.',[mdata])
attach(mf10,'Supply the exact congruence subgroup, cusp widths, index and dimension conventions of the requested modular-form space. Use the built Sturm equality theorem with these actual parameters.',[mdata])
attach('AlgebraicModularFormsAndSerreWeights:R15.2','Supply integral models, bounded denominators and the q-expansion principle at all required cusps for the general congruence-subgroup version of the congruence Sturm test. Characteristic-zero Sturm equality is a distinct native import.',[sturmMod])
# Existing owners cover the intrinsic curve algorithms. Their contracts are imported
# by the target ledger; no artificial dependency is added to a level-one form node.
imports=[]
def imported(stage,target,providers,detail):
    imports.append(dict(stageId=f'{RID}:CN.{stage}',target=target,providers=providers,detail=detail))
imported(0,'Exact finite-field presentations and embeddings',[
'FiniteFieldsAndCharacterSums:FF.0/certified-presentation-of-a-finite-field',
'FiniteFieldsAndCharacterSums:FF.0/presentation-embedding-from-root',
'FiniteFieldsAndCharacterSums:FF.0/presentation-change-isomorphism'],
'Use the native field, generator and quotient/evaluation maps; no parallel field carrier. Transport checked factorizations only for nonzero input.')
imported(0,'Ideal and lattice coordinate presentations',[
'ClassicalArithmeticCompletion:CA.3/hermite-normal-form-certificate',
'ClassicalArithmeticCompletion:CA.3/hermite-basis-of-a-sublattice',
'ClassicalArithmeticCompletion:CA.3/index-eq-prod-hermite-pivots',
'ClassicalArithmeticCompletion:CA.3/smith-normal-form-certificate'],
'Use CA.3 matrix and lattice normal forms on the coordinate lattice of the CN.2 order basis. Do not import CA.5 backwards: its certified number-field algorithms consume CN.2.')
imported(3,'Modular symbols, orbit labels and trace checks',[mf8,mf9,mf10,mf11],
'The upstream layers own Manin relations, integral Hecke algebras, label invariants, dimensions and trace formulas. CN.3 binds finite data and exact matrices to those objects. General-level/bad-prime presentation comparisons remain refinements, not a new modular-symbol carrier.')
imported(3,'Point counts',[
'FiniteFieldsAndCharacterSums:FF.3/naive-point-count',
'FiniteFieldsAndCharacterSums:FF.3/point-count-certificate-sound'],
'The general enumeration includes infinity and accepts any Weierstrass model; identifying the native elliptic point group requires nonsingularity. The fast character-sum certificate is restricted to odd q and a₁=a₃=0. Characteristic two uses the general enumeration.')
ecowners=[]
# The bindings evidence has a flattened layers object, so select the explicit owner records.
rs=json.loads((S/'RS03Bindings.json').read_text())
for x in rs['owners']:
    if f'{RID}:CN.3' in x.get('formerly',[]) and str(x.get('owner','')).startswith('tauceti:TauCetiRoadmap/EllipticCurves#'):
        ecowners.append(x['owner'])
imported(3,'Isogenies, finite-field normalization and descent',ecowners+['EffectiveDiophantineMethods:ED.3'],
'Import the isogeny/dual/differential comparison, intrinsic q+1−trace point count, existing Mordell–Weil and two-descent algorithms, and Selmer/local conditions. ED.3 supplies the new local-image and saturation service. CN.3 does not re-plan any of them; accepted RS-03 supplier edges remain intact.')
imported(4,'Continuation and exact analytic-rank inputs',[
'mathlib:DirichletCharacter.LFunction','mathlib:ModularForm.L',mf7,
'AutomorphicLFunctionsAndLocalFactors:AL.1','AnalyticNumberTheory:AN.4'],
'Evaluate the imported continuation. RankZeroOneBSD assembles exact vanishing below r and nonvanishing of the rth derivative; a box containing zero proves neither exact vanishing nor a rank lower bound. No extra BSD-to-CN.4 dependency is needed for this scope.')
p['importedTargets']=imports
for imp in imports:
    for supplier in imp['providers']:
        if supplier.startswith('mathlib:') or '/' in supplier.split(':',1)[-1] and not supplier.startswith('tauceti:TauCetiRoadmap/'):continue
        if any(r['supplier']==supplier for r in REQUESTS):continue
        req(supplier,imp['detail'],[imp['stageId']])

replacements={
'Exact presentation and model refinements':'The exact carriers and presentation targets are present. Refine certified root-count/separation and algebraic equality discovery, generic presentation-change costs, the digit-array encoding and uniform RAM-to-bit simulation. CA.3 and FF.0 supply the specialized lattice and field presentations in importedTargets.',
'Remaining factorization and certificate costs':'The integer and rational factor certificates, finite Pocklington data, FF.3 consumer and quadratic Pratt size target are present. Refine the tree-to-self-delimiting encoding and charged verifier, integer discovery complexity under explicit assumptions, rational recombination termination and Shoup’s precise RAM exponent; no bit exponent is inferred from unit-cost instructions.',
'Remaining number-field certificate targets':'The order/integral-basis, prime decomposition, relation quotient, torsion-aware unit/class stopping and local expansion targets are present. Refine finite class/unit discovery, exact log/regulator enclosures and analytic class-number stopping bounds; any GRH-based speedup belongs in its cost theorem and never weakens unconditional product/index checks.',
'Higher-order Newton and residual factorization targets':'Finite φ-side and residual-polynomial data and the exponent-one Ore criterion are now explicit. Refine the square-free residual factor assembly and native ramification comparison. Repeated residual factors cannot be declared prime; use higher-order refinement or the separately specified maximal-order algorithm.',
'Remaining modular and curve targets':'The integral lattices, matrix and finite-data adapters, BCG examples and exact owner imports are present. Refine general level/character and bad-prime matrices, integral Manin-presentation comparisons, norm-based congruence Sturm proofs and the complete simultaneous-eigensystem certificates. Native characteristic-zero Sturm equality is already available.',
'BCG companion and corrected ordinary-list completion':'The weight-82 common-eigenvector and corrected ordinary-list targets are present. Supply finite theta/Sturm certificates and lifts to characteristic-zero eigenforms for every listed common eigensystem. At p=151 the weights 52 and 100 fail the gcd condition. BCG’s cohomological normalization gives a_g(ℓ)=ℓ^81 a_f(ℓ) at p=107,k=26. Complete datasets have not been replayed here.',
'Full validated-numerics target inventory':'Real interval multiplication/inversion and rounding, complex boxes, p-adic propagation, polynomial roots, Dirichlet and cusp L evaluation, CT formulas/tails/Gram checks, and Platt targets are present. Refine terminating special-function enclosures, exact root counts, all analytic truncation constants and complete source datasets. CN.4 exports nonvanishing; exact rank assembly is owned by RankZeroOneBSD.',
'CT dataset admissibility and complete replay':'Bind every row to exact infinity types, positive multiplicities and δ∈{0,1}; prove ε(U_iU_j) is real whenever δ_iδ_j=1. Apply the explicit multiplicity Gram lift with diagonal A/m_i and weights t_i/m_i. Verify every required list and distinguish the 12293 cover rows from the smaller exact cut. Inherited counts/sample evaluations are not a fresh full replay; δ=2 is never silently accepted.'}
for g in GAPS:
    if g['title'] in replacements:g['detail']=replacements[g['title']]
    if g['title']=='Effective algebraic root verification and arithmetic':g['neededBy'].append(aeq)
    if g['title']=='Remaining factorization and certificate costs':g['neededBy']+=[prsize,nid(1,'pratt-quadratic-size')]
gap('Supplier-stage and forwarding bindings','Requests for imported-only targets identify the owning stage and exact contract but do not by themselves add a drawn atlas edge. Preserve the existing accepted RS-03/RS-06/RS-07 links. The new MF.11 trace import and CN.4→CM.5 rounding supply need explicit maintainer graph binding if no node-level consumer edge draws them; this pass does not edit foreign packets or generated data.',[f'{RID}:CN.3',f'{RID}:CN.4'])
p['upstreamNotes']=[
dict(where='FiniteFieldsAndCharacterSums:FF.3/factorization-certificate-sound',note='The supplier certificate allows scalar zero, while the normalized-factor soundness conclusion needs a nonzero polynomial (or an explicit zero case). The CN.1 transport requires f≠0 and nonzero scalar. No foreign packet is edited.'),
dict(where='RT-AREA-computational/4 and PAPER-BOXER-CALEGARI-GEE-25/companion-weight-82',note='BCG uses cohomological determinant ε^(1−k). In ordinary Hecke coefficients the companion relation is a_f=ℓ^(k−1)a_g, hence a_g=ℓ^(p−k)a_f away from p. The exponent at (107,26) is 81, not 25. Two characteristic-polynomial roots are not a simultaneous companion certificate.'),
dict(where='ComplexMultiplicationAndExplicitReciprocity:CM.5',note='Forward CN.4 validated arithmetic and unique-integer recovery to CM.5. The CM owner retains class-polynomial height/precision, CRT and endomorphism-ring certificates. This requested structural link is not claimed as a drawn edge until the assembled graph confirms it.'),
dict(where='LevelOneAutomorphicFormsForClassicalGroups',note='The new CT design route owns intrinsic K∞, admissibility, Fourier conventions, J_F and automorphic consequences. Its precise stage identifiers are not available in this base. CN.4 provides numerical RHS functions and Gram checks; the intrinsic comparison remains a named gap rather than an invented supplier id.')]
planets={0:['ram-machine-model-and-bit-complexity','algebraic-root-certificate','padic-approximation'],1:['pratt-certificate','miller-rabin-probabilistic-primality','aks-algorithm','pocklington-certificate','integer-factorization-certificate','rational-polynomial-factor-certificate'],2:['p-radical-maximality-criterion','integral-basis-certificate','prime-ideal-factor-certificate','units-complete-of-regulator-bound','phi-newton-side','ore-residual-irreducibility'],3:['integral-q-expansion-lattice','miller-basis','level-one-congruence-sturm','integral-hecke-matrix','weight-82-companion-system'],4:['outward-dyadic-rounding','gram-negativity-certificate','ct-scalar-enclosure','certified-polynomial-root-isolation','dirichlet-l-value-enclosure','effective-ellipsoid-cover']}
for n in N:
    i=int(n['parentStageId'].split('.')[-1])
    if n['id'].split('/')[-1] not in planets.get(i,[]):n.pop('planet',None)

inventory=[]
def target(stage,label,slugs=(),providers=(),note=''):
    entry=dict(stageId=f'{RID}:CN.{stage}',target=label,nodes=[nid(stage,s)for s in slugs],imports=list(providers),note=note)
    assert all(x in byid for x in entry['nodes']),entry
    assert entry['nodes']or entry['imports'],entry
    inventory.append(entry)
target(0,'Native integer/rational and algebraic presentations, conversions and comparisons',['rational-root-presentation','algebraic-root-certificate','algebraic-add-certificate','algebraic-mul-certificate','algebraic-inv-certificate','algebraic-equality-check'])
target(0,'Finite-field presentations and embeddings',providers=imports[0]['providers'])
target(0,'Ideal/lattice coordinates',providers=imports[1]['providers'],note='Use the CN.2 full order basis for the ambient number field; retain CA.3→CN.0 direction.')
target(0,'Finite p-adic presentations',['padic-approximation'])
target(0,'RAM, bit costs, randomness and precision',['ram-machine-model-and-bit-complexity','costed-ram-trace','costed-trace-upper-bound','ram-polynomial-magnitude'],[nid(1,'miller-rabin-independent-rounds'),nid(4,'padic-mul')])
target(1,'Pratt/Pocklington certificates and size',['pratt-certificate','pratt-certificate-checker','pratt-certificate-sound','pratt-certificate-complete','pratt-quadratic-size','pocklington-certificate','pocklington-certificate-sound'])
target(1,'Deterministic/probabilistic primality',['aks-algorithm','aks-deterministic-primality','miller-rabin-probabilistic-primality','miller-rabin-independent-rounds'])
target(1,'Integer and rational polynomial factors',['integer-factorization-certificate','integer-factorization-sound','integer-factorization-complete','rational-polynomial-factor-certificate','certified-rational-factorization'])
target(1,'Finite-field factorization consumer',['polynomial-factorization-over-finite-fields'],['FiniteFieldsAndCharacterSums:FF.3/certified-factorization-algorithm'])
target(2,'Orders and certified integral bases',['order-basis-certificate','p-radical-lattice','p-radical-maximality-criterion','integral-basis-certificate','integral-basis-algorithm'])
target(2,'Prime decomposition and first-order Newton data',['prime-ideal-factor-certificate','phi-adic-expansion','phi-coefficient-valuation','phi-newton-side','phi-residual-polynomial','ore-residual-irreducibility'])
target(2,'Class/unit completeness and conditional cost separation',['class-relation-lattice','class-relation-quotient-cover','minkowski-factor-base-generation','certified-class-unit-completeness','units-complete-of-regulator-bound','joint-class-unit-index-certificate'])
target(2,'Local expansions',['local-expansion-certificate'],[lr0])
target(3,'Symbols, Hecke matrices, q-expansions and labels',['integral-q-expansion-lattice','integral-cusp-lattice','miller-basis','integral-hecke-matrix','modular-data-equality'],imports[2]['providers'])
target(3,'Sturm equality and congruence',['level-one-congruence-sturm','modular-data-equality'],['tauceti:TauCeti.ModularForm.eq_of_sturm_bound','AlgebraicModularFormsAndSerreWeights:R15.2'])
target(3,'Curve point counts, isogenies and descent',providers=imports[3]['providers']+imports[4]['providers'],note=imports[3]['detail']+' '+imports[4]['detail'])
target(4,'Validated real/complex arithmetic and precision',['rational-interval-product','rational-interval-inverse','outward-dyadic-rounding','complex-box-denotation','unique-integer-in-enclosure'])
target(4,'p-adic arithmetic and precision',['padic-normalization','padic-add','padic-mul','padic-inverse'])
target(4,'Certified roots',['certified-polynomial-root-isolation'])
target(4,'L-values and imported continuation',['dirichlet-l-value-enclosure','cusp-l-value-enclosure'],imports[5]['providers'],note=imports[5]['detail'])
target(4,'CT validated formulas, tails and Gram witnesses',['ct-explicit-formula-values','ct-scalar-enclosure','odlyzko-geometric-tail','odlyzko-alternating-tail','gram-negativity-certificate','effective-ellipsoid-cover','multiplicity-gram-lift'])
target(5,'Finite dataset checks, reproducible inputs and verification cost',providers=[nid(4,'check-gram-dataset'),nid(4,'check-gram-negativity'),nid(0,'costed-ram-trace')],note='Concrete mathematical checking is in CN.4 and realises CN.5. Hashes, software pins, data coverage and discovery-versus-verification costs are required handoff metadata. The process-layer removal is a proposal, with accepted CN.5→FF.5/ED.6 links preserved.')
p['targetInventory']=inventory
(S/'TargetInventory.json').write_text(json.dumps(inventory,ensure_ascii=False,indent=2)+'\n')
routes={
'PAPER-BENNETT-SIKSEK-20/90':[nid(4,'small-conductor-real-zero-exclusion')],
'PAPER-BOXER-CALEGARI-GEE-25/weight-26-coefficients':[nid(3,'weight-26-coefficient-107'),nid(3,'weight-26-ordinary-107')],
'PAPER-BOXER-CALEGARI-GEE-25/companion-weight-82':[nid(3,'weight-82-companion-system')],
'PAPER-BOXER-CALEGARI-GEE-25/nonordinary-weight-38':[nid(3,'weight-38-nonordinary-determinant')],
'PAPER-BOXER-CALEGARI-GEE-25/remark-3-3-small-primes':[nid(3,'smallest-nonordinary-primes'),nid(3,'nonordinary-list-below-200')],
'PAPER-BOXER-CALEGARI-GEE-25/remark-3-3-lists':[nid(3,'corrected-ordinary-companion-list'),nid(3,'nonordinary-list-below-200')],
'PAPER-CHENEVIER-TAIBI-20/certified-evaluation':[nid(4,'ct-explicit-formula-values'),nid(4,'ct-scalar-enclosure')],
'PAPER-CHENEVIER-TAIBI-20/fincke-pohst-effective':[nid(4,'effective-ellipsoid-cover')],
'PAPER-CHENEVIER-TAIBI-20/certificates':[nid(4,'check-gram-dataset'),nid(4,'multiplicity-gram-lift')]}
assert set(routes)=={x['id']for x in json.loads((S/'RoutedItems.json').read_text())}
p['sourceRouting']=[dict(id=k,nodes=v,status='planned',note='Source-scoped target with the explicit prerequisite and gap ledger; no formalisation or complete dataset replay is claimed.')for k,v in routes.items()]
p['coverage']=[dict(stageId=f'{RID}:CN.{i}',status='planned',remaining=[g['title']+': '+g['detail']for g in GAPS if any(x.startswith(f'{RID}:CN.{i}')for x in g['neededBy'])])for i in range(6)]
p['coverage'][5]['remaining']=['Approve or reject the process-layer removal and retarget accepted CN.5 supplier links. Complete the separately recorded CT dataset bindings, admissibility and replay in CN.4.']
p['coverage'][5]['note']=inventory[-1]['note']
p['planningLevel']='lemma'
p['granularityNote']='Publication detail.json assigns lemma level (recorded distance 4, threshold 5). This Protocol 0 breadth-first pass represents every target and names the remaining lemma refinements explicitly; it does not claim source decomposition or closure.'
p['status']='complete'
p['completionReason']='Every original stage target and all nine routed source items have a target declaration or an explicit native/owner import. This breadth-first pass stops below the 300-node budget under Protocol 0. All stages remain planned, with named proof refinements and supplier gaps; no stage is claimed closed.'
p['requests']=REQUESTS;p['gaps']=GAPS
```

## Script: index_lean.py

```python
"""Index inherited top-level Lean commands, respecting comments and strings."""
from pathlib import Path
import collections,json,re,sys
S=Path(sys.argv[1]);t=(S/(sys.argv[2]if len(sys.argv)>2 else'Inherited.lean')).read_text();p=json.loads((S/(sys.argv[3]if len(sys.argv)>3 else'InheritedNamed.json')).read_text());prefix=sys.argv[4]if len(sys.argv)>4 else''
def mask(text):
 out=list(text);i=0;depth=0;string=False;line=False
 while i<len(text):
  if depth:
   if text.startswith('/-',i):out[i:i+2]=[' ',' '];depth+=1;i+=2;continue
   if text.startswith('-/',i):out[i:i+2]=[' ',' '];depth-=1;i+=2;continue
   if text[i]!='\n':out[i]=' '
   i+=1;continue
  if line:
   if text[i]=='\n':line=False
   else:out[i]=' '
   i+=1;continue
  if string:
   if text[i]=='\\':out[i]=' ';i+=1;out[i]=' ';i+=1;continue
   if text[i]=='"':string=False
   if text[i]!='\n':out[i]=' '
   i+=1;continue
  if text.startswith('/-',i):out[i:i+2]=[' ',' '];depth=1;i+=2;continue
  if text.startswith('--',i):out[i:i+2]=[' ',' '];line=True;i+=2;continue
  if text[i]=='"':out[i]=' ';string=True
  i+=1
 assert not depth and not string
 return ''.join(out)
m=mask(t)
pat=re.compile(r'^[ \t]*(?:@\[[^\n]*\]\s*)?(?:(?:noncomputable|private|protected|local|unsafe)\s+)*(def|theorem|lemma|abbrev|inductive|structure|class|instance|example|namespace|section|end|variable|open|universe|set_option|attribute|notation|infixl?|infixr|prefix|postfix|macro|syntax|scoped|import|export|omit|include)\b',re.M)
hits=list(pat.finditer(m));stack=[];commands=[]
for i,h in enumerate(hits):
 a=h.start();b=hits[i+1].start()if i+1<len(hits)else len(t)
 # Attach trailing whitespace/comments to the next command where possible.
 last=b
 while last>a and m[last-1].isspace():last-=1
 kind=h.group(1);tail=m[h.end():last].strip();name=None
 if kind in ['namespace','section']:
  label=tail.split()[0]if tail else '';stack.append((kind,label))
 elif kind=='end':
  label=tail.split()[0]if tail else ''
  assert stack,(t.count('\n',0,a)+1,label)
  typ,opened=stack.pop();assert not label or opened==label,(t.count('\n',0,a)+1,label,opened)
 elif kind in ['def','theorem','lemma','abbrev','inductive','structure','class','instance']:
  name=tail.split()[0]if tail else None
  if name and name[0] in '({[:':name=None
  if name:
   ns='.'.join(x[1]for x in stack if x[0]=='namespace')
   name=(ns+'.'if ns else '')+name
 commands.append({'kind':kind,'name':name,'start':a,'end':last,'line':t.count('\n',0,a)+1,'namespaces':[x[1]for x in stack if x[0]=='namespace']})
assert all(k=='section' and not n for k,n in stack),stack
found={c['name']for c in commands if c['name']}
names=set();resolved={};alternate={};ambiguous={}
for node in p['nodes']:
 library=node.get('library',{})
 for name in ([library['declaration']]if library.get('declaration')else[])+[a['name']for a in node.get('api',[])]:
  full=name if name in found else (library.get('namespace','')+'.'+name).lstrip('.')
  if full not in found:
   matches=sorted(n for n in found if n.endswith('.'+name))
   if len(matches)==1:alternate[full]=matches[0];full=matches[0]
   elif matches:ambiguous[full]=matches
  names.add(full);resolved[name]=full
missing=sorted(names-found);dups={n:v for n,v in collections.Counter(c['name']for c in commands if c['name']).items()if v>1}
(S/(prefix+'LeanCommands.json')).write_text(json.dumps(commands,indent=2)+'\n')
(S/(prefix+'LeanIndexReport.json')).write_text(json.dumps({'wanted':len(names),'found':len(found),'missing':missing,'duplicates':dups,'resolvedNames':resolved,'alternateNamespaces':alternate,'ambiguousSuffixes':ambiguous,'nodesWithoutDeclarationMetadata':sum(not n.get('library',{}).get('declaration')for n in p['nodes'])},indent=2)+'\n')
print(json.dumps({'commands':len(commands),'wanted':len(names),'missing':missing[:50],'duplicateCount':len(dups)},indent=2))
```

## Script: qualified_index.py

```python
"""Preserve the supplied pinned index and append two source-confirmed namespace repairs."""
import hashlib,json,sys
from pathlib import Path
S=Path(sys.argv[1]);idx=Path(sys.argv[2]);raw=idx.read_bytes()
assert hashlib.sha256(raw).hexdigest()=='86649a7d5f35d1178a45fe7aa4713741d03d43ff3b37bb8c91a1da1c794c8ce1'
rows=[line.split('\t')for line in raw.decode().splitlines()]
aliases=[]
for short,line in [('Λ','91'),('L','134')]:
    matches=[r for r in rows if r[:2]==['mathlib',short]and r[3:5]==['Mathlib/NumberTheory/ModularForms/LFunction.lean',line]]
    assert len(matches)==1
    original=matches[0];qualified=original.copy();qualified[1]='ModularForm.'+short
    aliases.append(dict(original=original,qualified=qualified,reason='The pinned source opens namespace ModularForm before these definitions. The index lost that namespace around the anonymous asymptotics section. The existing rows and every other byte are retained.'))
supplement=''.join('\t'.join(a['qualified'])+'\n'for a in aliases).encode()
assert raw.endswith(b'\n')
(S/'QualifiedDeclarations.tsv').write_bytes(raw+supplement)
(S/'IndexNamespaceRepairs.json').write_text(json.dumps(dict(originalSha256=hashlib.sha256(raw).hexdigest(),qualifiedSha256=hashlib.sha256(raw+supplement).hexdigest(),aliases=aliases),ensure_ascii=False,indent=2)+'\n')
print(json.dumps(dict(appendedAliases=len(aliases),originalBytesPreserved=True)))
```

## Script: verify.py

```python
"""Verify this planning pass with immutable repository code; do not execute Lean."""
from pathlib import Path
import ast,hashlib,json,os,re,subprocess,sys
S=Path(sys.argv[1]).resolve();R=Path.cwd().resolve();IDX=Path(sys.argv[2]).resolve();RID='ComputationalNumberTheory'
sha=lambda b:hashlib.sha256(b).hexdigest()
data=lambda n:json.loads((S/n).read_text())
MATH=(S/'base.txt').read_text().strip();BASE=os.environ.get('ROOT_ACTION_VALIDATE_BASE',(S/'publication-base.txt').read_text().strip())
def blob(ref,path):return subprocess.check_output(['git','show',ref+':'+path],cwd=R)
(S/(RID+'.json')).write_bytes((S/'Candidate.json').read_bytes())
p=data('Candidate.json');assert p['roadmapId']==RID and p['status']=='complete'
assert len(p['nodes'])==108 and len(p['gaps'])==26 and len(p['requests'])==18
assert len(p['baseline']['declarations'])==31 and len(p['sourceIssues'])==22
assert all(c['status']=='planned'and c['remaining']for c in p['coverage'])and len(p['coverage'])==6
own={n['id']:n for n in p['nodes']};assert len(own)==108
assert {n['id']for n in data('Decomposition.json')['nodes']}<=set(own)
assert all(n['implementationStatus']=='unchecked'for n in own.values())
defs=[n for n in own.values()if n['kind']in ['definition','construction']]
assert len(defs)==61 and all(len(n['api'])>=3 and len(n['tests'])>=3 and n['uses']for n in defs)
assert sum(len(n.get('api',[]))for n in own.values())==187
assert sum(len(n.get('tests',[]))for n in own.values())==183
assert len(p['targetInventory'])==22 and p['targetInventory']==data('TargetInventory.json')
assert {r['id']for r in p['sourceRouting']}=={r['id']for r in data('RoutedItems.json')}
assert all(set(t['nodes'])<=set(own)and(t['nodes']or t['imports'])for t in p['targetInventory'])
assert all(set(t['nodes'])<=set(own)for t in p['sourceRouting'])
reader=(S/'Reader.md').read_text();lean=(S/'Suggested.lean').read_text()
for n in own.values():
 assert n['id']in reader and n['statement']in reader,n['id']
 for item in n.get('api',[])+n.get('tests',[]):assert item['name']in reader and item['statement']in reader and item['name'].split('.')[-1]in lean,item['name']
for name,cmd in [('LeanIndexReport.json',['index_lean.py',str(S),'Suggested.lean','Candidate.json']),('ArithmeticChecks.json',['ArithmeticChecks.py',str(S)]),('IndexNamespaceRepairs.json',['qualified_index.py',str(S),str(IDX)])]:
 before=(S/name).read_bytes()
 subprocess.run([sys.executable,str(S/cmd[0]),*cmd[1:]],check=True,capture_output=True)
 assert(S/name).read_bytes()==before,name
idx=data('LeanIndexReport.json');assert idx['wanted']==295 and not idx['missing']and not idx['duplicates']and not idx['ambiguousSuffixes']and not idx['alternateNamespaces']
typing=data('Typing.json');assert typing['sourceSha256']==sha(lean.encode())and typing['logSha256']==sha((S/'Compile.log').read_bytes())
assert typing['exitCode']==typing['errors']==0 and typing['warnings']==447 and not typing['otherWarnings']and typing['availableGiB']>=20 and typing['serial']
assert typing['mathlib']==p['baseline']['mathlib']and typing['tauceti']==p['baseline']['tauceti']and len(data('SourceAudit.json'))==3724
receipt=data('ClaimReceipt.json');assert receipt['claimComment']==5984911497 and receipt['confirmationComment']==5984913585
allowed={r['path']:r for r in data('PublicationChanges.json')}
for g in data('InputGuard.json'):
 assert sha(blob(MATH,g['path']))==g['sha256']
 now=sha(blob(BASE,g['path']))
 if now!=g['sha256']:assert g['path']in allowed and allowed[g['path']]['after']==now and allowed[g['path']]['reviewed'],g['path']
jobs=[]
for ref in [MATH,BASE]:
 job=next(j for j in json.loads(blob(ref,'research/blueprint/queue.json'))['jobs']if j['id']=='BP-'+RID)
 jobs.append({k:v for k,v in job.items()if k not in ['state','note']})
assert jobs[0]==jobs[1]
paths=['research/blueprint/'+folder+'/'+('BP-'if folder=='handoff'else'')+RID+'.'+ext for folder,ext in [('packets','json'),('readmes','md'),('suggested','lean'),('handoff','md')]]
contents={path:(S/name).read_text()for path,name in zip(paths,['Candidate.json','Reader.md','Suggested.lean','PublicHandoff.md'if(S/'PublicHandoff.md').exists()else'Handoff.md'])}
for path,t in contents.items():
 assert t.endswith('\n')and not t.endswith('\n\n')and not re.search(r'/(?:home|tmp|Users)/|file'+r'://|[ \t]+$',t,re.M),path
if(S/'artifact-manifest.json').exists():
 for name,m in data('artifact-manifest.json').items():
  b=(S/name).read_bytes();assert sha(b)==m['sha256']and len(b)==m['bytes']and len(b.splitlines())==m['lines'],name
os.environ['ROOT_ACTION_VALIDATE_BASE']=BASE;sys.path.insert(0,str(S))
import immutable_view
for path,t in contents.items():immutable_view.TRACKED.add(path);immutable_view.CACHE[path]=t.encode()
immutable_view.install();sys.path.insert(0,str(R/'scripts'))
import check_blueprint,check_errata,source_issues
assert check_blueprint.NODE_BUDGET==300
index=check_blueprint.load_index(S/'QualifiedDeclarations.tsv')
errors,warnings,summary=check_blueprint.check(S/(RID+'.json'),index,check_blueprint.world())
assert not errors and not warnings,(errors,warnings);summary['packet']=paths[0]
issues=source_issues.check_issues(p['sourceIssues'],RID)+check_errata.versions_checked(p,p['sourceIssues']);assert not issues,issues
tree=ast.parse((R/'research/blueprint/intake.py').read_text());wanted={'file_problems','auto_refusals','own_files','independent_of'}
picked=[n for n in tree.body if isinstance(n,ast.Assign)and any(isinstance(t,ast.Name)and t.id in {'ALLOWED','PRIVATE'}for t in n.targets)or isinstance(n,ast.FunctionDef)and n.name in wanted]
env={'json':json,'re':re};exec(compile(ast.Module(body=picked,type_ignores=[]),'actual-intake','exec'),env)
job=next(j for j in json.loads((R/'research/blueprint/queue.json').read_text())['jobs']if j['id']=='BP-'+RID)
problems=[x for path in paths for x in env['file_problems'](path,contents[path])];refusals=env['auto_refusals'](job,paths,False,{'codex-7e92bd'},set());assert not problems and not refusals,(problems,refusals)
graph=json.loads(subprocess.check_output([sys.executable,str(S/'graph.py'),str(S)],cwd=R,text=True,env={**os.environ,'ROOT_ACTION_VALIDATE_BASE':BASE}))
assert graph['worldCommit']==BASE and graph['stageDAG']['acyclic']and graph['scopedDAG']['acyclic']and not graph['missingDrawnPaths']
print(json.dumps(dict(checker=summary,warnings=warnings,sourceIssueErrors=issues,intakeProblems=problems,intakeRefusals=refusals,typing=typing,signatureIndex=idx,indexNamespaceRepairs=data('IndexNamespaceRepairs.json'),arithmetic=data('ArithmeticChecks.json'),inputGuards=len(data('InputGuard.json')),publicationChanges=data('PublicationChanges.json'),mathematicalBase=MATH,immutableBase=BASE,graph=graph,fullSuggestedCompiled=True,LeanExecuted=False,currentPassRequiresIndependentReview=True),ensure_ascii=False,indent=2))
```

## Script: graph.py

```python
from pathlib import Path
import sys,json,collections,copy
R=Path.cwd(); S=Path(sys.argv[1]);RID='ComputationalNumberTheory';STEM=RID;SCOPE={RID+':'+x for x in ['CN.0','CN.1','CN.2','CN.3','CN.4','CN.5']}
sys.path.insert(0,str(S))
import immutable_view
immutable_view.install()
sys.path.insert(0,str(R/'scripts'))
import check_blueprint,build,blueprints
p=json.loads((S/'Candidate.json').read_text())
packets,docs,defs=blueprints.load_promoted(R);keep=[x for x in packets if x[0]!=STEM]
docs[STEM]='research/blueprint/readmes/'+STEM+'.md'
def assemble(candidate):
 build.load_promoted=lambda *args:(copy.deepcopy(keep+([]if candidate is None else[(STEM,candidate)])),copy.deepcopy(docs),copy.deepcopy(defs))
 return build.assemble(require_distances=False)[0]
a=assemble(p);b=assemble(None)
se={(e['source'],e['target']) for e in a['stageEdges']};controlEdges={(e['source'],e['target']) for e in b['stageEdges']};assert all(x.startswith(RID+':') and y.startswith(RID+':')for x,y in controlEdges-se),{'removed':sorted(controlEdges-se)}
stages={s['id'] for s in a['stages']}|set(check_blueprint.world()[1]);world={}
for folder in ['data/decompositions','data/blueprints','research/blueprint/packets']:
 for f in sorted((R/folder).glob('*.json')):
  for n in json.loads(f.read_text()).get('nodes',[]):world.setdefault(n['id'],n)
nodes={n['id']:n for n in p['nodes']};world.update(nodes)
def dag(vertices,edges):
 vertices=set(vertices)|{v for e in edges for v in e};out=collections.defaultdict(set);indeg={v:0 for v in vertices}
 for x,y in edges:
  if y not in out[x]:out[x].add(y);indeg[y]+=1
 todo=[v for v in vertices if indeg[v]==0];done=0
 while todo:
  x=todo.pop();done+=1
  for y in out[x]:
   indeg[y]-=1
   if indeg[y]==0:todo.append(y)
 assert done==len(vertices),[v for v,k in indeg.items() if k][:20]
 return {'vertices':len(vertices),'edges':len(edges),'acyclic':True}
todo=list(nodes);seen=set();deps=set();leaves=set();unresolved=set()
while todo:
 n=todo.pop()
 if n in seen:continue
 seen.add(n)
 for d in world[n].get('prerequisites',[]):
  if d.startswith(('mathlib:','tauceti:')) and d not in stages:leaves.add(d);continue
  deps.add((d,n))
  if d in world:todo.append(d)
  elif d not in stages:unresolved.add(d)
assert not unresolved,unresolved
deps|={(world[n]['parentStageId'],n) for n in seen if world[n].get('parentStageId')}
deps|={(r['supplier'],n)for r in p.get('requests',[])for n in r.get('neededBy',[])if r['supplier']!=n}
out=collections.defaultdict(set)
for x,y in se:out[x].add(y)
def reachable(x,y):
 todo=[x];seen=set()
 while todo:
  z=todo.pop()
  if z==y:return True
  if z not in seen:seen.add(z);todo+=list(out[z])
 return False
pairs=set()
for f in (R/'research/blueprint/restructure').glob('*.result.json'):
 q=json.loads(f.read_text())
 if q.get('review',{}).get('status')=='accepted':pairs|={(e['source'],e['target']) for e in q.get('links',[]) if SCOPE.intersection([e.get('source'),e.get('target')])}
upstream=sorted((x,y) for x,y in pairs if x.startswith('UPSTREAM:') or y.startswith('UPSTREAM:'))
missing=sorted((x,y) for x,y in pairs if (x,y) not in upstream and not reachable(x,y))
assert not missing,missing
ar={r['id']:r for r in a['roadmaps']};br={r['id']:r for r in b['roadmaps']}
def skips(r):return r.get('blueprint',{}).get('skippedLinks',[]),r.get('pendingLinks',[])
assert all(skips(ar[x])==skips(br[x]) for x in br)
result={'stageDAG':dag(stages,se),'ownDAG':dag(nodes,{(d,n) for n in nodes for d in nodes[n]['prerequisites'] if d in nodes}),'scopedDAG':dag(stages|seen,se|deps),'reachableDeclarations':len(seen),'baselineLeaves':len(leaves),'unresolved':sorted(unresolved),'restructurePairs':len(pairs),'undrawnUpstreamContracts':upstream,'missingDrawnPaths':missing,'addedStageEdges':sorted(se-controlEdges),'removedStageEdges':sorted(controlEdges-se),'allSkipsMatchControl':True,'ownAssembly':ar[RID].get('blueprint')}
def semantic(r):
 return {k:v for k,v in r.items()if k not in {'requires','consumers','prerequisites','blueprint'}}
foreign=[]
for key in br:
 if key!=RID:
  assert semantic(ar[key])==semantic(br[key]),('foreign roadmap',key)
  if ar[key]!=br[key]:foreign.append(key)
bs={s['id']:s for s in b['stages']if s.get('owner')!=RID}
for st in a['stages']:
 if st.get('owner')!=RID:assert semantic(st)==semantic(bs[st['id']]),('foreign stage',st['id'])
result['foreignEdgeMetadataChanged']=foreign
result['otherStageSemanticPayloadsUnchanged']=True
result['inheritedMissingRequestStagePaths']=sorted({(r['supplier'],(nodes[n]['parentStageId']if n in nodes else n))for r in p.get('requests',[])for n in r.get('neededBy',[])if not reachable(r['supplier'],(nodes[n]['parentStageId']if n in nodes else n))})
result['requestedCM5ForwardingDrawn']=reachable(RID+':CN.4','ComplexMultiplicationAndExplicitReciprocity:CM.5')
result['removedLegacyEdgeReason']='The old bundled RAM-to-AKS planet edge is replaced by distinct algorithm-correctness and cost-model targets; no foreign edge is removed.'
result['worldCommit']=immutable_view.BASE
result['foreignSemanticPayloadsUnchanged']=True
result['readPathHashes']={path:__import__('hashlib').sha256(immutable_view.blob(path)).hexdigest()for path in sorted(immutable_view.READS)}
print(json.dumps(result,ensure_ascii=False,indent=2))
```

## Script: immutable_view.py

```python
"""Read the immutable audit tree without creating a repository snapshot."""
import fnmatch
import importlib.abc
import importlib.util
import io
from pathlib import Path
import subprocess
import sys

import os
REPO = Path(os.environ.get('TAUCETI_REPO', str(Path.cwd())))
BASE = os.environ.get('ROOT_ACTION_VALIDATE_BASE', (Path(__file__).resolve().parent / 'publication-base.txt').read_text().strip())
TRACKED = set(subprocess.check_output(['git', 'ls-tree', '-r', '--name-only', BASE], cwd=REPO, text=True).splitlines())
CACHE = {}
READS = set()
ORIGINAL = {name: getattr(Path, name) for name in ('read_text', 'read_bytes', 'exists', 'is_file', 'is_dir', 'glob', 'rglob', 'open', 'write_text', 'write_bytes')}

def relative(path):
    try:
        return str(path.resolve().relative_to(REPO.resolve()))
    except ValueError:
        return None

def blob(key):
    if key not in TRACKED:
        raise FileNotFoundError(key)
    READS.add(key)
    if key not in CACHE:
        CACHE[key] = subprocess.check_output(['git', 'show', BASE + ':' + key], cwd=REPO)
    return CACHE[key]

def read_text(path, encoding=None, errors=None):
    key = relative(path)
    if key is None:
        return ORIGINAL['read_text'](path, encoding=encoding, errors=errors)
    return blob(key).decode('utf-8' if encoding in (None,'locale') else encoding, errors or 'strict')

def read_bytes(path):
    key = relative(path)
    return ORIGINAL['read_bytes'](path) if key is None else blob(key)

def is_file(path):
    key = relative(path)
    return ORIGINAL['is_file'](path) if key is None else key in TRACKED

def is_dir(path):
    key = relative(path)
    return ORIGINAL['is_dir'](path) if key is None else any(s.startswith(key.rstrip('/') + '/') for s in TRACKED) or key == '.'

def exists(path):
    key = relative(path)
    return ORIGINAL['exists'](path) if key is None else is_file(path) or is_dir(path)

def glob(path, pattern, recursive=False):
    key = relative(path)
    if key is None:
        yield from ORIGINAL['rglob' if recursive else 'glob'](path, pattern)
        return
    prefix = '' if key == '.' else key.rstrip('/') + '/'
    for candidate in sorted(TRACKED):
        if not candidate.startswith(prefix):
            continue
        tail = candidate[len(prefix):]
        if fnmatch.fnmatch(tail, pattern) and (recursive or '/' not in tail):
            yield REPO / candidate

def open_path(path, mode='r', buffering=-1, encoding=None, errors=None, newline=None):
    key = relative(path)
    if key is None:
        return ORIGINAL['open'](path, mode, buffering, encoding, errors, newline)
    if mode not in ('r', 'rb'):
        raise PermissionError('audit tree is read-only')
    return io.BytesIO(blob(key)) if mode == 'rb' else io.StringIO(blob(key).decode('utf-8' if encoding in (None,'locale') else encoding, errors or 'strict'))

def write_text(path, *args, **kwargs):
    if relative(path) is not None:
        raise PermissionError('audit tree is read-only')
    return ORIGINAL['write_text'](path, *args, **kwargs)

def write_bytes(path, *args, **kwargs):
    if relative(path) is not None:
        raise PermissionError('audit tree is read-only')
    return ORIGINAL['write_bytes'](path, *args, **kwargs)

class Loader(importlib.abc.Loader):
    def __init__(self, key):
        self.key = key
    def create_module(self, spec):
        return None
    def exec_module(self, module):
        module.__file__ = str(REPO / self.key)
        exec(compile(blob(self.key), module.__file__, 'exec'), module.__dict__)

class Finder(importlib.abc.MetaPathFinder):
    def find_spec(self, fullname, path=None, target=None):
        key = 'scripts/' + fullname + '.py'
        if '.' not in fullname and key in TRACKED:
            return importlib.util.spec_from_loader(fullname, Loader(key))

def install():
    for name, function in [('read_text', read_text), ('read_bytes', read_bytes), ('exists', exists), ('is_file', is_file), ('is_dir', is_dir), ('glob', glob), ('rglob', lambda path, pattern: glob(path, pattern, True)), ('open', open_path), ('write_text', write_text), ('write_bytes', write_bytes)]:
        setattr(Path, name, function)
    sys.meta_path.insert(0, Finder())
```

## Script: compile.py

```python
"""Check the exact full suggested file using existing pinned libraries only."""
from pathlib import Path
import hashlib,json,os,re,subprocess,sys
S=Path(sys.argv[1]).resolve();M=Path(sys.argv[2]).resolve();B=Path(sys.argv[3]).resolve();T=Path(sys.argv[4]).resolve();L=Path(sys.argv[5]).resolve()
sha=lambda b:hashlib.sha256(b).hexdigest()
pin='082e2d37e8b0463410cdb532e111cd43d5a66174';taupin='f790474821cf4256814db967cb154e7af3d0c369'
assert subprocess.check_output(['git','rev-parse','HEAD'],cwd=M,text=True).strip()==pin
assert subprocess.check_output(['git','rev-parse','HEAD'],cwd=B/'mathlib',text=True).strip()==pin
assert subprocess.check_output(['git','rev-parse','HEAD'],cwd=B/'TauCeti',text=True).strip()==taupin
for root in [M,B/'mathlib',B/'TauCeti']:assert not subprocess.check_output(['git','status','--porcelain','--untracked-files=no'],cwd=root,text=True).strip()
version=subprocess.check_output([str(L),'--version'],text=True).strip();assert '6a10ac8c22beadecabdbb0919c2b50214762f91d'in version and '4.34.0-rc2'in version
native={};old={}
libs=[M/'.lake/build/lib/lean'];packages={}
for item in json.loads((M/'lake-manifest.json').read_text())['packages']:
 pkg=M.parent/item['name'];lib=pkg/'.lake/build/lib/lean'
 if not lib.is_dir():assert item['name']=='Cli';continue
 assert subprocess.check_output(['git','rev-parse','HEAD'],cwd=pkg,text=True).strip()==item['rev'];libs.append(lib);packages[item['name']]=item['rev']
def imports(t):
 out=[];i=0;depth=0
 while i<len(t):
  if t.startswith('/-',i):depth+=1;i+=2;continue
  if depth:
   if t.startswith('-/',i):depth-=1;i+=2;continue
   if t[i]=='\n':out.append('\n')
   i+=1;continue
  if t.startswith('--',i):j=t.find('\n',i);i=len(t)if j<0 else j;continue
  out.append(t[i]);i+=1
 found=[]
 for line in ''.join(out).splitlines():
  line=line.strip()
  if not line or line in ['module','prelude']:continue
  m=re.fullmatch(r'(?:(?:public|private|meta) )*import\s+(\S+)',line)
  if m:found.append(m[1])
  else:break
 return found
seen={}
def scan(name):
 if name in seen or name.split('.')[0]not in ['Mathlib','TauCeti']:return
 ismath=name.startswith('Mathlib.');root=B/('mathlib'if ismath else'TauCeti');rel=name.replace('.','/');b=(root/(rel+'.lean')).read_bytes();seen[name]=sha(b)
 if ismath:assert (M/(rel+'.lean')).read_bytes()==b and(M/'.lake/build/lib/lean'/(rel+'.olean')).exists(),name
 else:assert name in native,name
 for n in imports(b.decode()):scan(n)
for n in imports((S/'Suggested.lean').read_text()):scan(n)
(S/'SourceAudit.json').write_text(json.dumps(seen,sort_keys=True,indent=2)+'\n')
free=subprocess.check_output(['free','-g'],text=True);available=int(free.splitlines()[1].split()[-1]);assert available>=20,free
receipt=dict(mathlib=pin,tauceti=taupin,compiler=version,availableGiB=available,packages=packages,nativeArtifactHashes=native,nativeSourceHashes=old,sourceModules=len(seen),sourceSha256=sha((S/'Suggested.lean').read_bytes()),serial=True,timeoutSeconds=1200,memoryLimitMiB=8192)
(S/'CompilePreflight.json').write_text(json.dumps(receipt,indent=2)+'\n');print(json.dumps(receipt,indent=2),flush=True)
env={**os.environ,'LEAN_PATH':os.pathsep.join(str(p)for p in libs)}
r=subprocess.run(['timeout','1200',str(L),'-j','1','-M','8192',str(S/'Suggested.lean')],cwd=S,env=env,text=True,capture_output=True)
raw=r.stdout+r.stderr;log=raw.replace(str(S)+'/', '')
(S/'Compile.log').write_text(log);receipt.update(exitCode=r.returncode,errors=len(re.findall(r'error(?:\(|:)',log)),warnings=log.count('warning:'),otherWarnings=[l for l in log.splitlines()if 'warning:'in l and 'declaration uses `sorry`'not in l],logSha256=sha(log.encode()),originalLogSha256=sha(raw.encode()))
(S/'Typing.json').write_text(json.dumps(receipt,indent=2)+'\n');print(json.dumps({k:receipt[k]for k in ['exitCode','errors','warnings','otherWarnings']},indent=2))
raise SystemExit(r.returncode)
```

## Script: ArithmeticChecks.py

```python
"""Independent exact arithmetic for the two concrete BCG targets, no CAS input."""
import json,math,sys
from pathlib import Path
S=Path(sys.argv[1]);N=158
def sigma(k):
    a=[0]*(N+1)
    for d in range(1,N+1):
        for n in range(d,N+1,d):a[n]+=d**k
    return a
def mul(a,b):return [sum(a[j]*b[n-j]for j in range(n+1))for n in range(N+1)]
def power(a,k):
    z=[1]+[0]*N
    for _ in range(k):z=mul(z,a)
    return z
s1=sigma(1);E4=[1]+[240*x for x in sigma(3)[1:]];E6=[1]+[-504*x for x in sigma(5)[1:]]
D=[0]*(N+1);D[1]=1
for n in range(2,N+1):
    num=-24*sum(s1[j]*D[n-j]for j in range(1,n));assert num%(n-1)==0
    D[n]=num//(n-1)
f26=mul(mul(D,power(E4,2)),E6)
assert [f26[1],f26[2],f26[3],f26[107]]==[1,-48,-195804,35830422465487817813321292]
assert f26[107]%107==106 and f26[6]==f26[2]*f26[3]and f26[4]==f26[2]**2-2**25
v=mul(mul(D,power(E4,5)),E6);b2=mul(mul(power(D,2),power(E4,2)),E6)
assert v[1]==1 and b2[1]==0 and b2[2]==1 and v[2]==672
b1=[a-672*b for a,b in zip(v,b2)];assert b1[1:3]==[1,0]
mat=[[b1[79]%79,b2[79]%79],[b1[158]%79,b2[158]%79]]
det=(mat[0][0]*mat[1][1]-mat[0][1]*mat[1][0])%79
assert det==0 and math.gcd(37,80)==1
out=dict(method='Exact integer divisor sums; delta coefficients from DΔ=E₂Δ, with exact divisibility checked at every step. Miller vectors ΔE₄⁵E₆−672Δ²E₄²E₆ and Δ²E₄²E₆. The Hecke recurrence at coefficients 1,2 uses a₇₉ and a₁₅₈; its second summand vanishes.',truncation=N,weight26={str(i):f26[i]for i in [1,2,3,4,6,107]},ordinary107Residue=f26[107]%107,weight38MatrixMod79=mat,determinantMod79=det,gcd37_80=1,excluded151Gcds=[math.gcd(150,51),math.gcd(150,99)],fullCompanionOrPlattOrCTReplay=False,formalProof=False)
(S/'ArithmeticChecks.json').write_text(json.dumps(out,ensure_ascii=False,indent=2)+'\n')
print(json.dumps(out,ensure_ascii=False))
```

## Script: package.py

```python
"""Archive the named completion evidence and bind a public recovery helper."""
from pathlib import Path
import base64,hashlib,json,re,sys,zlib
S=Path(sys.argv[1]).resolve();R=Path.cwd();mode=sys.argv[2]
STEM='ComputationalNumberTheory'
sha=lambda b:hashlib.sha256(b).hexdigest()
helpers=['build.py','cn0.py','cn0_extra.py','cn1.py','cn1_extra.py','cn2.py','cn2_extra.py','cn3.py','cn3_extra.py','cn4.py','cn4_extra.py','finish_nodes.py','finalize.py','index_lean.py','qualified_index.py','verify.py','graph.py','immutable_view.py','compile.py','ArithmeticChecks.py','package.py']
names="""Candidate.json Reader.md Suggested.lean Atlas.json Audit.json Decomposition.json Findings.json RoutedItems.json
RS03Bindings.json LinksTouching.json RestructureTouching.json SourceRoutes.json PublicSources.json PriorReadingReuse.json ReadingProgress.json
SourceIssues.json SourceVersions.json TargetInventory.json FFSuppliers.json ClaimReceipt.json
InputGuard.json PublicationChanges.json IndexNamespaceRepairs.json SourceAudit.json CompilePreflight.json Typing.json Compile.log LeanCommands.json LeanIndexReport.json ArithmeticChecks.json
HandoffText.md HandoffBase.md Handoff.md MathematicalVerification.json Verification.json base.txt publication-base.txt""".split()+helpers
assert len(names)==len(set(names))
suggested=R/'research/blueprint/suggested'/(STEM+'.lean')
handoff=R/'research/blueprint/handoff'/('BP-'+STEM+'.md')
if mode=='handoff':
 text=(S/'HandoffText.md').read_text()
 for n in helpers:text+='\n## Script: '+n+'\n\n```python\n'+(S/n).read_text()+'```\n'
 (S/'HandoffBase.md').write_text(text);(S/'Handoff.md').write_text(text);handoff.write_text(text)
elif mode=='archive':
 meta={n:dict(sha256=sha((S/n).read_bytes()),bytes=len((S/n).read_bytes()),lines=len((S/n).read_bytes().splitlines()))for n in names}
 mb=(json.dumps(meta,indent=2,sort_keys=True)+'\n').encode();(S/'artifact-manifest.json').write_bytes(mb)
 payload={n:dict(sha256=sha((S/n).read_bytes()),data=base64.b64encode(zlib.compress((S/n).read_bytes(),9)).decode())for n in names+['artifact-manifest.json']}
 pb=(json.dumps(payload,sort_keys=True,separators=(',',':'))+'\n').encode()
 report=dict(artifacts=len(names),helpers=len(helpers),manifestSha256=sha(mb),payloadSha256=sha(pb));(S/'package.json').write_text(json.dumps(report,indent=2)+'\n')
 suggested.write_bytes((S/'Suggested.lean').read_bytes()+b'\n/- BEGIN ARCHIVED PLANNING PASS COMPLETION PAYLOAD\n'+pb+b'END ARCHIVED PLANNING PASS COMPLETION PAYLOAD -/\n')
 print(json.dumps(report,indent=2))
elif mode=='final':
 archive=sys.argv[3];assert re.fullmatch('[0-9a-f]{40}',archive)
 p=json.loads((S/'package.json').read_text());expected={k:sha((S/n).read_bytes())for k,n in [('packets','Candidate.json'),('readmes','Reader.md'),('suggested','Suggested.lean')]}
 code='''"""Recover public completion evidence, authenticate artifacts, never execute Lean."""
from pathlib import Path
import base64,hashlib,json,re,sys,urllib.request,zlib
S=Path(sys.argv[1]).resolve();S.mkdir(parents=True,exist_ok=True)
HEAD=sys.argv[2];assert re.fullmatch('[0-9a-f]{40}',HEAD)
ROOT='https://raw.githubusercontent.com/CBirkbeck/tauceti-explorer/'
STEM='ComputationalNumberTheory'
ARCHIVE=__ARCHIVE__
MANIFEST_SHA=__MANIFEST__
PAYLOAD_SHA=__PAYLOAD__
EXPECTED=__EXPECTED__
sha=lambda b:hashlib.sha256(b).hexdigest()
def fetch(ref,path):
 with urllib.request.urlopen(ROOT+ref+'/'+path,timeout=30)as r:return r.read()
raw=fetch(ARCHIVE,'research/blueprint/suggested/'+STEM+'.lean').decode()
pb=raw.rsplit('/- BEGIN ARCHIVED PLANNING PASS COMPLETION PAYLOAD\\n',1)[1].split('END ARCHIVED PLANNING PASS COMPLETION PAYLOAD -/',1)[0].encode()
assert sha(pb)==PAYLOAD_SHA;payload=json.loads(pb)
def unpack(name):
 b=zlib.decompress(base64.b64decode(payload[name]['data']));assert sha(b)==payload[name]['sha256'],name
 return b
mb=unpack('artifact-manifest.json');assert sha(mb)==MANIFEST_SHA;meta=json.loads(mb)
assert set(payload)==set(meta)|{'artifact-manifest.json'}
for name,m in meta.items():
 assert Path(name).name==name and name not in {'.','..'}
 b=unpack(name);assert sha(b)==m['sha256']and len(b)==m['bytes']and len(b.splitlines())==m['lines'],name
 (S/name).write_bytes(b)
(S/'artifact-manifest.json').write_bytes(mb)
public={}
for folder,ext,name in [('packets','json','Candidate.json'),('readmes','md','Reader.md'),('suggested','lean','Suggested.lean'),('handoff','md','PublicHandoff.md')]:
 path='research/blueprint/'+folder+'/'+('BP-'if folder=='handoff'else'')+STEM+'.'+ext
 b=fetch(HEAD,path)
 if folder in EXPECTED:assert sha(b)==EXPECTED[folder]and b==(S/name).read_bytes(),path
 (S/name).write_bytes(b);public[path]=sha(b)
(S/(STEM+'.json')).write_bytes((S/'Candidate.json').read_bytes())
handoff=(S/'PublicHandoff.md').read_text();assert handoff.startswith((S/'HandoffBase.md').read_text())
def script(name):
 tag='\\n## Script: '+name+'\\n\\n'+chr(96)*3+'python\\n'
 a=handoff.rindex(tag)+len(tag);b=handoff.index('\\n'+chr(96)*3,a)
 return handoff[a:b]+'\\n'
for name in meta:
 if name.endswith('.py'):assert script(name)==(S/name).read_text(),name
code=script('recover.py');assert code==Path(__file__).read_text()
(S/'recover.py').write_text(code)
receipt=dict(head=HEAD,archive=ARCHIVE,artifactsVerified=len(meta),archivedHelpersVerified=sum(n.endswith('.py')for n in meta),publicDeliverables=public,recoverySha256=sha(code.encode()),LeanExecuted=False)
(S/'public-recovery.json').write_text(json.dumps(receipt,indent=2)+'\\n');print(json.dumps(receipt,indent=2))
'''
 for k,v in [('__ARCHIVE__',archive),('__MANIFEST__',p['manifestSha256']),('__PAYLOAD__',p['payloadSha256']),('__EXPECTED__',expected)]:code=code.replace(k,repr(v))
 compile(code,'recover.py','exec');(S/'recover.py').write_text(code)
 prose=f'''
## Public recovery and verification

Archive commit `{archive}` is an ancestor changing only this issue’s named deliverables. It holds {p['artifacts']} inert named artifacts, including {p['helpers']} exact helpers. Manifest SHA256 `{p['manifestSha256']}`; payload SHA256 `{p['payloadSha256']}`. The final suggested file contains no archive payload.

Save the final Python fence as recover.py and run `python3 recover.py REPLAY_DIR FULL_PR_HEAD_SHA`. It fetches the public immutable archive and all four deliverables, authenticates every artifact and helper, and checks its own code against the public handoff. Keep REPLAY_DIR outside an existing repository checkout. Inspect the recovered helpers, then from that checkout run `PYTHONDONTWRITEBYTECODE=1 python3 REPLAY_DIR/verify.py REPLAY_DIR DECLARATION_INDEX`. Use the pinned declarations.tsv (SHA256 86649a7d5f35d1178a45fe7aa4713741d03d43ff3b37bb8c91a1da1c794c8ce1). Output must equal Verification.json. Set ROOT_ACTION_VALIDATE_BASE to the base in base.txt to reproduce MathematicalVerification.json. Both bases must exist locally. The verifier runs the actual immutable checker, source-issue/intake functions and atlas assembler, and authenticates the new packet, source ledger and command index without executing Lean.

The verifier authenticates 108 unchecked nodes, all original target and paper routes, the exact signatures, 22 source issues and the recorded compiler output. It reruns the two exact BCG arithmetic checks and the actual repository intake/graph checks at both immutable bases. The full suggested file compiled with zero errors and 447 admission warnings. The two qualified-name repairs to the supplied index are authenticated and reproduced. All 32 accepted restructuring paths remain reachable; missing drawing of requested supplier/forwarding edges is reported explicitly. Neither recovery nor the verifier executes Lean or proves any admitted mathematical claim. Both recovered reports were reproduced byte for byte before this PR was opened.


## Script: recover.py

'''
 text=(S/'HandoffBase.md').read_text()+prose+'```python\n'+code+'```\n'
 (S/'PublicHandoff.md').write_text(text);handoff.write_text(text);suggested.write_bytes((S/'Suggested.lean').read_bytes())
 print(json.dumps(dict(archive=archive,recoverySha256=sha(code.encode()),finalHandoffSha256=sha(text.encode())),indent=2))
else:raise ValueError(mode)
```

## Public recovery and verification

Archive commit `7ac33dc8db97e02195b4e50a92a6e28b64fe32cb` is an ancestor changing only this issue’s named deliverables. It holds 58 inert named artifacts, including 21 exact helpers. Manifest SHA256 `62bb53460fc76616f347554db5ee4e31e05f13a397899d2c4363d2b4bae1a31b`; payload SHA256 `0451072d6aa0ebe01a1377a0b0c85251c6c7524ea56ef51ad6df1913272ca8bb`. The final suggested file contains no archive payload.

Save the final Python fence as recover.py and run `python3 recover.py REPLAY_DIR FULL_PR_HEAD_SHA`. It fetches the public immutable archive and all four deliverables, authenticates every artifact and helper, and checks its own code against the public handoff. Keep REPLAY_DIR outside an existing repository checkout. Inspect the recovered helpers, then from that checkout run `PYTHONDONTWRITEBYTECODE=1 python3 REPLAY_DIR/verify.py REPLAY_DIR DECLARATION_INDEX`. Use the pinned declarations.tsv (SHA256 86649a7d5f35d1178a45fe7aa4713741d03d43ff3b37bb8c91a1da1c794c8ce1). Output must equal Verification.json. Set ROOT_ACTION_VALIDATE_BASE to the base in base.txt to reproduce MathematicalVerification.json. Both bases must exist locally. The verifier runs the actual immutable checker, source-issue/intake functions and atlas assembler, and authenticates the new packet, source ledger and command index without executing Lean.

The verifier authenticates 108 unchecked nodes, all original target and paper routes, the exact signatures, 22 source issues and the recorded compiler output. It reruns the two exact BCG arithmetic checks and the actual repository intake/graph checks at both immutable bases. The full suggested file compiled with zero errors and 447 admission warnings. The two qualified-name repairs to the supplied index are authenticated and reproduced. All 32 accepted restructuring paths remain reachable; missing drawing of requested supplier/forwarding edges is reported explicitly. Neither recovery nor the verifier executes Lean or proves any admitted mathematical claim. Both recovered reports were reproduced byte for byte before this PR was opened.


## Script: recover.py

```python
"""Recover public completion evidence, authenticate artifacts, never execute Lean."""
from pathlib import Path
import base64,hashlib,json,re,sys,urllib.request,zlib
S=Path(sys.argv[1]).resolve();S.mkdir(parents=True,exist_ok=True)
HEAD=sys.argv[2];assert re.fullmatch('[0-9a-f]{40}',HEAD)
ROOT='https://raw.githubusercontent.com/CBirkbeck/tauceti-explorer/'
STEM='ComputationalNumberTheory'
ARCHIVE='7ac33dc8db97e02195b4e50a92a6e28b64fe32cb'
MANIFEST_SHA='62bb53460fc76616f347554db5ee4e31e05f13a397899d2c4363d2b4bae1a31b'
PAYLOAD_SHA='0451072d6aa0ebe01a1377a0b0c85251c6c7524ea56ef51ad6df1913272ca8bb'
EXPECTED={'packets': 'd5e1c1c21d781818d3786928cdc4e7eb775fbf092a077ebd0555a2cf146c5223', 'readmes': '5be4fb4f62ee16e4d887d8811c51c3bec577ae958bc8cc53541a28029c3e0517', 'suggested': '6e6701098e23ca63efa9778c500017d2c9557f927971f0df16e1c854d125a798'}
sha=lambda b:hashlib.sha256(b).hexdigest()
def fetch(ref,path):
 with urllib.request.urlopen(ROOT+ref+'/'+path,timeout=30)as r:return r.read()
raw=fetch(ARCHIVE,'research/blueprint/suggested/'+STEM+'.lean').decode()
pb=raw.rsplit('/- BEGIN ARCHIVED PLANNING PASS COMPLETION PAYLOAD\n',1)[1].split('END ARCHIVED PLANNING PASS COMPLETION PAYLOAD -/',1)[0].encode()
assert sha(pb)==PAYLOAD_SHA;payload=json.loads(pb)
def unpack(name):
 b=zlib.decompress(base64.b64decode(payload[name]['data']));assert sha(b)==payload[name]['sha256'],name
 return b
mb=unpack('artifact-manifest.json');assert sha(mb)==MANIFEST_SHA;meta=json.loads(mb)
assert set(payload)==set(meta)|{'artifact-manifest.json'}
for name,m in meta.items():
 assert Path(name).name==name and name not in {'.','..'}
 b=unpack(name);assert sha(b)==m['sha256']and len(b)==m['bytes']and len(b.splitlines())==m['lines'],name
 (S/name).write_bytes(b)
(S/'artifact-manifest.json').write_bytes(mb)
public={}
for folder,ext,name in [('packets','json','Candidate.json'),('readmes','md','Reader.md'),('suggested','lean','Suggested.lean'),('handoff','md','PublicHandoff.md')]:
 path='research/blueprint/'+folder+'/'+('BP-'if folder=='handoff'else'')+STEM+'.'+ext
 b=fetch(HEAD,path)
 if folder in EXPECTED:assert sha(b)==EXPECTED[folder]and b==(S/name).read_bytes(),path
 (S/name).write_bytes(b);public[path]=sha(b)
(S/(STEM+'.json')).write_bytes((S/'Candidate.json').read_bytes())
handoff=(S/'PublicHandoff.md').read_text();assert handoff.startswith((S/'HandoffBase.md').read_text())
def script(name):
 tag='\n## Script: '+name+'\n\n'+chr(96)*3+'python\n'
 a=handoff.rindex(tag)+len(tag);b=handoff.index('\n'+chr(96)*3,a)
 return handoff[a:b]+'\n'
for name in meta:
 if name.endswith('.py'):assert script(name)==(S/name).read_text(),name
code=script('recover.py');assert code==Path(__file__).read_text()
(S/'recover.py').write_text(code)
receipt=dict(head=HEAD,archive=ARCHIVE,artifactsVerified=len(meta),archivedHelpersVerified=sum(n.endswith('.py')for n in meta),publicDeliverables=public,recoverySha256=sha(code.encode()),LeanExecuted=False)
(S/'public-recovery.json').write_text(json.dumps(receipt,indent=2)+'\n');print(json.dumps(receipt,indent=2))
```
