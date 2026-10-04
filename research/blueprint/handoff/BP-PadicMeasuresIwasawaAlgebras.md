# BP-PadicMeasuresIwasawaAlgebras — budget pass complete

Refs #555. Codex — codex-7e92bd; claim 5984314644, exact bot confirmation 5984315743. Mathematical base is recorded in base.txt; publication base in publication-base.txt. Only this issue's four deliverables change.

## Result and open work

The incoming 369 nodes already exceed the protocol's 300-node budget. This pass adds no nodes and preserves every mathematical node object, all 273 API entries, 260 test records (187 attached to definitions/constructions), 22 planets, 350 baseline records, seven sources, two source versions, 15 historical source findings and two requests. It marks the pass complete, not the mathematics closed. Five stages remain partial and L0a/L5/L6 remain not_read at the source-decomposition level. Ten explicit gaps include two newly recorded inherited-contract/correspondence defects.

The reader covers the eight target frontiers and all 59 issue-routed extraction records, with explicit ownership and hypothesis boundaries. It preserves the prior reader verbatim and supplements exact packet wording where that reader paraphrased it. Current frontier text overrides older completion language. The confirmed RT-AREA-iwasawa-2/4 remains open: selected-character image orders, square/projective presentations, higher Fitting and exterior-bidual/transpose comparisons need decomposition, and the missing L6→I.6/I.7 supplier paths need an accepted graph amendment. No external files or stage links were edited. Basic Fitting algebra comes from StableReduction:L1 under RS-16, not the obsolete IHG pointer. The right compound-adjugate identity and R_Ψ→R_(Ψ inverse) coefficient transport are required; arbitrary image orders are not assumed Gorenstein.

**Counterexample requiring independent review:** L4/projective-dimension-and-resolution assigns d₀=dim H⁰(Γ,M)/p to the generator count. For M=Λ with the usual action, ker(T)=0 but M/(p,T)M=F_p. Its displayed resolution cannot be correct with this convention. Re-read NSW 5.3.20 and correct all ranks/indexing together. The node is retained unchecked for traceability; this is a packet defect, not an asserted source erratum. Its separate freeness criterion supplies the nearby Castella route only subject to review.

**Suggested-file boundary:** the entire existing file plus a planning-only comment compiled at the pinned Mathlib 082e2d3 and Tau Ceti f790474 sources, Lean 4.34.0-rc2 commit 6a10ac8c22beadecabdbb0919c2b50214762f91d. Result: exit 0, zero errors, 740 admission warnings, no other warnings. Available memory was 37 GiB; one process, 1200-second timeout and 8192 MiB Lean limit. Exact source/dependency pins, the 2 native cached artifacts and 2891 import-source modules were authenticated. No Lake setup, cache download or library build occurred. This is signature elaboration, not a proof or complete packet encoding: 495 named commands and 258 examples; 42 explicit L4 declaration/API names absent, four generic imported API names also outside this file's command index, and 57 node records without an explicit declaration metadata field. The exact omissions and unmatched-count caveat are preserved. The compiler was not rerun by the verifier.

## Reading and continuation

Fresh reading covered the whole issue before and after claim confirmation, eight AUDIT-26 rows and targets, accepted RS-16 PMIA ownership and report/review, 82 touching records (44 distinct bodies), 59 routed extraction records and their PMIA review routes, the confirmed red-team finding and current handoff/coverage plus selected L4 statements. The original papers and all 369 proof outlines were not independently reread. Source citations/findings remain attributed to their predecessors. Own PR3268 upstream reading is reused only where exact hashes agree: LocalFieldsRamification, Multiquadratic and ProfiniteProPGroups are among those inputs. PriorReadingReuse.json lists changes explicitly.

After independent review, split/follow-up by the recorded stage frontiers. Start with the L4 counterexample and missing signature correspondence, then the undecomposed L0a, L5 and L6 targets. Import owned completed carriers and native algebra; do not grow this over-budget aggregate with more declarations. Keep the finite-index, coefficient-topology, dyadic, weak/strong and arithmetic-owner boundaries in RouteMap.json. Do not report the confirmed red-team finding resolved merely because its missing contracts are now listed.

## Evidence and replay

The handoff publishes exact helper scripts below and a recoverable immutable artifact archive. Named artifacts include Incoming.json, IncomingReader.md, Incoming.lean, IncomingHandoff.md, Candidate.json, Reader.md, Suggested.lean, Plan.json, Counts.json, Audit.json, RoutedItems.json, RouteMap.json, TouchingEntries.json, ClaimReceipt.json, Reading.json, InputGuard.json, PublicationChanges.json, PriorReadingReuse.json, Own3268Snapshot.json, Own3268Handoff.md, Own3268SourceAudit.json, OldNativeBuild.json, CompilePreflight.json, SourceAudit.json, Typing.json, Compile.log, LeanCommands.json, LeanIndexReport.json, WORKLIST.md, both base files and both immutable verification reports. These are retained after submission; disposable scratch is removed.

The actual indexed checker, source/version validators, intake file/ownership functions and atlas assembler are executed against immutable trees. The graph check compares the candidate with the inherited packet, checks actual source→consumer paths from accepted restructurings, checks scoped prerequisite acyclicity and requires all foreign stages/roadmaps and pending/skipped links to match the control. These checks establish mechanical consistency, not the mathematical correctness of inherited nodes. Public recovery verifies the archive and all four final deliverables, then both verifier reports are reproduced byte-for-byte before PR submission.

## Script: author.py

```python
"""Complete the budgeted PMIA pass without adding or altering inherited nodes."""
from pathlib import Path
import collections,copy,hashlib,json,sys
S=Path(sys.argv[1]).resolve();R=Path.cwd();RID='PadicMeasuresIwasawaAlgebras'
load=lambda n:json.loads((S/n).read_text())
def save(n,x):(S/n).write_text(json.dumps(x,ensure_ascii=False,indent=2)+'\n')
p=load('Incoming.json');old=copy.deepcopy(p)
add={
'L0':[
'Routed RJW 67–68, 74, 83–84: retain surjectivity in the definition of an orthonormal basis and the value-group hypothesis for its existence; separate weak-dual reflexivity from strong reflexivity, bounded field-valued clopen data from unrestricted additive data, and the unbounded p-adic Haar distribution from bounded measures.',
'Pilloni §2.3 widens the coefficient setting: for R complete Noetherian local with finite residue field and M flat, complete and separated, lifts of a residue-field basis identify M with the m-adic completion of a direct sum of copies of R (coefficients tend to zero), not the unrestricted product. Prove the finite-level flat/free comparison and passage to the limit. A semilocal Iwasawa algebra needs a factorwise argument; it is not thereby a DVR.'
],
'L0a':[
'RJW 166, 242 and 294 require the scalar continuous-character functor and its rigid representation (p−1 open discs for odd p). This packet has no L0a nodes. Ordinary continuous evaluation in prescribed families at L3 does not prove representability or analyticity. LocallyAnalyticDistributions:L3 owns analytic Mellin evaluation, L4 the family action; Dirichlet owns the Eisenstein arithmetic and its x^(k−1) normalization, and PadicFamilies owns modular geometry.'
],
'L1':[
'Fu finite-group-ring-coefficients: prove O_K ⊗_Zp Z_p[[G]] ≅ O_K[[G]] with its finite-module topology, then invert p. Retain bounded denominators in K[[G]]; it is not lim_U K[G/U]. Finite free coefficient extension includes ramified K and does not repair the unrelated Ore argument in Fu.',
'Rubin IV Lemma 3.3(i)–(ii), routed by PAPER-KOLYVAGIN-90: for finite-index H in profinite abelian G construct the coefficient-projection Hom restriction/coinduction isomorphism; derive Ext¹ vanishing under freeness over R[[H]]. Complete the finite-index norm/action projection formulas on the owned carrier.',
'RJW 369: for odd p identify the plus corner of the completed group algebra with the quotient by complex conjugation. Its identity is e+, not ambient 1; the finite orbit basis maps to twice the quotient basis. Never divide by 2 integrally at p=2. Construct continuous twisting and inversion automorphisms before L4 consumes them.'
],
'L2':[
'RJW 102 requires the additive-convolution multiplicativity of Amice, beyond its existing linear/isometric signatures. RJW 132 gives a linear unit-support inclusion, not a subalgebra: δ_1 * δ_(-1)=δ_0. Preserve that counterexample in every completed-algebra comparison.'
],
'L3':[
'RJW 145, 148–149 and 373: compare completed augmentation with the compatible finite kernels, prove procyclic principality using compact lifts, and supply a genuine integer topological generator with its hypotheses. The existing regular clearing element p+1 need not generate all units. The finite cyclic augmentation lemma (RJW 147) is already a library input according to the accepted extraction; it does not by itself prove the completed statement.',
'RJW 370: combine positive-moment separation with the sign involution to identify plus measures by vanishing odd moments. Use the corrected plus/minus convention. Handle finite-extension coefficients and p=2 separately; current native positive-moment nodes alone do not assert this parity theorem.'
],
'L4':[
'Add the continuity assertions for the imported Weierstrass division/preparation operations with the precise adic topology and completeness assumptions. Mathlib already supplies algebraic existence and uniqueness, noetherianity and the one-variable UFD input; do not re-plan those results.',
'The Castella et al. Lemma 1.1.2 freeness criterion is the (ii) clause of projective-dimension-and-resolution: X[T]=0 and X/TX free over Z_p imply X free over Λ, with rank read after reduction. Its independent source proof and rank interface still require review. The separate resolution-rank clause of that same inherited node has the counterexample recorded below and must not be reused.',
'Dasgupta–Kakde 42–44 supply integral prime-to-p character components while retaining the p-Sylow group ring. The existing character-decomposition node is nearby, but the local O[G_p] component and image-order comparisons are not decomposed; arbitrary character quotients are not products of coefficient rings and need not be Gorenstein.'
],
'L5':[
'Read and decompose the Iwasawa-specific determinant/base-change, Tor-error and specialization formulas after importing the perfect-complex carrier from SchemeKTheoryOperations:S.1 and the exact complete-local input from DeformationAndDerivedPatchingAlgebra:P7. State finite-presentation/perfectness and actual flatness/Tor hypotheses at every step.',
'RJW 451 and 457: compact Hausdorff inverse-limit exactness is not finite generation implying Mittag–Leffler. Topological Nakayama must prove finite generation from the compact module and residue quotient, not assume it via algebraic Nakayama. Resolve the L4-use/L5-owner ordering at the stage architecture level before adding a prerequisite; no reverse cycle is introduced here.'
],
'L6':[
'Confirmed RT-AREA-iwasawa-2/4 remains open: decompose R_Ψ as the image of O[G] in the selected character product (often a nonmaximal order), its local finite p-adic algebra comparisons, square and locally quadratic presentations, regular determinants and cardinality, Fitting base change/extensions/fibre products, exterior-bidual integrality, higher minors and transpose identities. Import the basic Fitting-ideal carrier from StableReduction:L1 under accepted RS-16, not from the obsolete IHG pointer in older extraction notes.',
'For # use R_Ψ ≅ R_(Ψ inverse), an endomorphism only when Ψ is inversion-stable. Distinguish O-linear, R-linear and contragredient/derived duals; state the Gorenstein hypothesis where needed rather than assume every image order has it. Finite Artinian group rings can be self-injective; the infinite completed group ring is not automatically so (Rubin IV Remark 3.5).',
'Reuse native abstract Auslander–Reiten transpose machinery where its hypotheses apply. Stable independence of arbitrary finite projective presentations over orders is a separate contract; a theorem about minimal presentations over a semiprimary algebra does not supply it. For the higher-adjugate image argument use C_r(A′) adj_r(A′)=det(A′) I on the right of the rectangular compound matrix; the left identity quoted in the source argument alone does not prove preservation of its image.',
'Generic algebra belongs here; the trivial-zero character choice, Ritter–Weiss modules, Selmer/class-group comparisons and arithmetic specializations remain IntegralIwasawaTheory:I.6/I.7. The confirmed missing L6→I.6/I.7 supplier paths require an accepted graph amendment (I.7 may receive transitively through I.6). Recording this gap does not apply that amendment or resolve the red-team finding. Euler/Kolyvagin system operations remain at ES6–8.'
]}
resolution='Inherited node L4/projective-dimension-and-resolution writes d₀=dim_Fp H⁰(Γ,M)/p for the number of generators in its minimal free resolution. With the usual continuous-cohomology convention and M=Λ=Z_p[[T]], invariants are ker(T)=0, whereas M/(p,T)M=F_p and M requires one generator. The displayed resolution therefore cannot be correct as written. Re-read NSW 5.3.20 and fix the cohomological indexing and all three ranks together before reuse. This is a packet-statement defect identified by a counterexample, not a newly verified erratum in NSW; its freeness criterion is a separate clause. The inherited mathematical object is preserved for independent review and stays unchecked.'
missing='The existing suggested file compiles, but compilation does not cover every planned declaration: 42 explicit TauCeti.Iwasawa L4 declaration/API names have no command in it. Four further indexed names refer to generic imported API. There are 57 node records without an explicit library.declaration field; those are not automatically missing signatures. Preserve the source and attach the exact name index; complete the L4 signatures only after checking their carriers and the resolution defect, and reconcile the 260 packet test records with the 258 Lean example commands. These counts do not establish a one-to-one test mapping.'
for c in p['coverage']:
 stage=c['stageId'].split(':')[1]
 if stage=='L4':
  excluded=c['remaining'].pop();assert "Jannsen"in excluded
  c['notes']+=' Scope boundary: '+excluded
 c['remaining']+=add[stage]
 if stage=='L4':c['remaining'] += [resolution,missing]
 c['notes']=c.get('notes','')+' Current budget pass adds no nodes; coverage status retains the inherited source-decomposition boundary.'
for g,c in zip(p['gaps'],p['coverage']):
 assert c['stageId'].split(':')[1] in g['title']
 g['detail']+=' Budget-pass frontier: '+' '.join(add[c['stageId'].split(':')[1]])
p['gaps'] += [dict(title='Inherited L4 resolution formula needs correction',neededBy=[RID+':L4/projective-dimension-and-resolution'],detail=resolution),dict(title='Suggested declaration and test correspondence remains incomplete',neededBy=[],detail=missing)]
p['status']='complete'
p['summary']='Budgeted planning pass complete under PROTOCOL section 0: preserve all 369 inherited unchecked nodes and add none above the 300-node budget. L0, L1, L2, L3 and L4 remain partial; L0a, L5 and L6 remain not_read at the source-decomposition level. Reconcile all 59 issue-routed extraction records, retain the 15 historical source findings, and state the unresolved character-order, determinant, scalar-family and completed-algebra frontiers. This is not mathematical closure: the inherited L4 resolution formula has a concrete counterexample, and the compiled suggested file lacks 42 explicitly named L4 signatures.'
p['checks']={'agent':'Codex — codex-7e92bd','date':'2026-10-04','pass':'Budget completion and source-route reconciliation','newNodes':0,'preservedNodes':369,'nodeBudget':300,'routedItems':59,'compile':'Full Suggested.lean elaborated at the exact pinned Mathlib and Tau Ceti sources using authenticated existing artifacts: exit 0, zero errors, 740 admission warnings, no other warnings. This does not prove the declarations or complete their correspondence with the packet.','previous':old['checks'],'signatureCoverage':missing,'mathematicalCounterexample':resolution}
p['provenance']['budgetCompletion']={'agent':'Codex — codex-7e92bd','issue':555,'claim':5984314644,'confirmation':5984315743,'nodesUnchanged':True,'freshReading':'Current targets, all eight AUDIT-26 rows, RS-16 ownership/review, 82 touching link records (44 distinct bodies), all 59 routed extraction records and their PMIA review routes, confirmed RT-AREA-iwasawa-2/4. No fresh full-paper or all-369-node proof review is claimed.','reusedReading':'Own PR3268 reading is reused only for byte-identical inputs, including three nearby upstream documents; PriorReadingReuse.json records changed and unchanged guards. Other predecessor source reads remain attributed historical evidence.','sourceBoundary':'No source finding is added for the inherited resolution formula: its source passage was not freshly checked. All 15 sourceIssues, seven sources, two sourceVersions and 350 baseline records are preserved.','evidence':'Reproducible immutable checker, source/version, intake and assembly results, full typing receipt, exact source/name index and public recovery are in the handoff.'}
save('Candidate.json',p);save(RID+'.json',p)
changed=[k for k in p if p[k]!=old[k]];save('Plan.json',dict(changedFields=changed,newNodes=0,**{k:p[k]for k in changed}))
# Individual routing dispositions, read against the accepted extraction records.
route={}
def rows(prefix,entries):
 for key,stage,status,note in entries:route[prefix+'/'+str(key)]=dict(stage=RID+':'+stage,status=status,note=note)
rows('PAPER-FU-24',[('finite-group-ring-coefficients','L1','open',add['L1'][0])])
rows('PAPER-CASTELLA-ETAL-22',[(7,'L4','existing_clause_with_review_gap',add['L4'][1])])
rows('PAPER-PILLONI-20',[('topological-basis-flat-complete-module','L0','open',add['L0'][1])])
rows('PAPER-KOLYVAGIN-90',[(k,st,'open',note)for k,st,note in [
('r4-lem-3.3i-hom-restriction','L1','Finite-index coefficient projection identifies the two completed Hom modules; do not replace the carrier.'),
('r4-lem-3.3ii-ext-vanishing','L6','Use the finite-index Hom/coinduction isomorphism and the stated freeness over R[[H]] to prove Ext¹ vanishing.'),
('r4-rem-3.5-not-injective','L6','Self-injectivity is the finite Artinian group-ring statement, not an automatic property of the infinite completed ring.')]])
rjw={67:('L0','open','Surjective orthonormal isometry, not only a norm equality.'),68:('L0','open','Basis existence retains the norm value-group condition.'),74:('L0','open','Weak-dual reflexivity and point separation; no strong-reflexivity claim.'),83:('L0','partial_input','Bounded clopen data and native locally constant approximation; general comparison still open.'),84:('L0','open','Haar masses p^(-n) are unbounded p-adically.'),89:('L1','partial_input','Native unit-coordinate inverse exists; identify it with the owned completed algebra.'),91:('L1','upstream_import','Basic Z_p completed group carrier and procyclic coordinates belong to ProfiniteProPGroups Layer9; PMIA supplies coefficient generality.'),102:('L2','open','Convolution multiplicativity is stronger than the existing linear Amice equivalence.'),132:('L2','partial_input','Unit inclusion is linear and not an additive-convolution subalgebra; δ_1*δ_(-1)=δ_0.'),145:('L3','open','Completed augmentation kernel equals the compatible finite kernels; closure is essential.'),147:('L3','reported_library_input','Accepted extraction identifies the finite-cyclic library input; no new baseline citation or fresh statement verification is claimed here.'),148:('L3','open','Odd-prime integer topological generator requires mod-p and mod-p² conditions; p+1 is only a regular clearing element.'),149:('L3','open','Procyclic principal augmentation, compact lifts and regular denominator precede the fraction.'),166:('L0a','open','Representable scalar character space, p−1 discs for odd p.'),242:('L0a','owner_boundary','Scalar components here; analytic Mellin branches at LocallyAnalyticDistributions:L3.'),294:('L0a','owner_boundary','Supply the space only; corrected x^(k−1) Eisenstein arithmetic is Dirichlet-owned and family geometry is PadicFamilies-owned.'),369:('L1','open','Odd-prime plus corner has unit e+ and identifies with the quotient by conjugation; no integral dyadic halving.'),370:('L3','partial_input','Existing positive-moment separation needs the corrected plus/odd-moment parity comparison.'),373:('L3','open','Procyclic augmentation requires completed principality, not algebraic span alone.'),451:('L5','open','Use compact Hausdorff exactness, not finite generation implying Mittag–Leffler.'),457:('L5','open','Compact Nakayama proves finite generation; resolve the L4/L5 ordering before adding edges.')}
rows('PAPER-RODRIGUES-JACINTO-WILLIAMS-23',[(i,*v)for i,v in rjw.items()])
dk={19:'Import the basic Fitting carrier from StableReduction:L1; prove/use Fitt(M)⊆Ann(M).',20:'Pontryagin-dual annihilator under the contragredient # convention; retain finite-module hypotheses.',31:'Exterior-bidual integrality lattice; Euler-system contractions remain ES-owned.',42:'Character components require enough coefficient roots and the stated odd-prime scope.',43:'R_Ψ is an image order, not the full character product.',44:'Keep O[G_p] inside prime-to-p character factors; localness needs proof.',46:'Kernel of the selected-character quotient is the subgroup norm ideal, via invariant coefficients.',47:'Apply the subgroup-norm comparison on a character component with the exact selected set.',48:'Square presentations by finite free modules; record ranks and exactness.',49:'Fitt of a square presentation is the determinant ideal, using the imported carrier.',50:'Finite-index order in a product of PIDs; nonzerodivisor determinant and finite quotient are essential to cardinality.',52:'Product of character determinant values computes quotient cardinality under regularity/finiteness.',54:'Fitting multiplicativity for the exact sequence uses a quadratically presented quotient and the appropriate finite-presentation hypotheses.',55:'Construct square presentations for extensions of square-presented modules.',56:'Fibre-product comparison of two extensions of the common quotient; retain both square-presentation assumptions.',65:'Import Fitting base change; use injective selected-character evaluation only on its image order.',78:'Fitting monotonicity under surjections, over the imported basic carrier.',79:'Fitt(M/N) annihilates the exterior-power cokernel; repair the compound-adjugate proof using the right identity.',81:'Rectangular compound matrices and higher adjugates; the right identity is needed for image preservation.',92:'Only supply the generic O[G_p]_χ algebra; arithmetic Σ/Σ′ and their choices belong to I.6/I.7.',100:'Unit detection uses a nonempty selected character set and the proved local image ring; it is not generic character evaluation.',109:'Contragredient R#-dual versus ordinary R-dual; extend from finite group rings to the stated coefficient orders.',111:'Reuse native transpose where applicable; arbitrary projective presentations over orders require stable independence, beyond minimal semiprimary presentations.',112:'R_Ψ → R_(Ψ inverse) is the # isomorphism; only inverse-stable Ψ gives an endomorphism.',113:'The #-transpose of a square matrix yields the Fitting involution comparison over R#.',168:'Supply the generic selected-character image ring; arithmetic trivial-zero selection is I.7-owned.',202:'Prove the finite selected-character quotient is complete local, using p-group-ring localness and coefficient completeness.',317:'Import higher determinantal Fitting ideals from the basic owner, then the order/exterior interfaces here.',318:'Supply generic higher-Fitting transpose comparison; Ritter–Weiss, Selmer and class-group identifications belong to I.6.',325:'The zeroth Fitting definition has an upstream owner StableReduction:L1; obsolete IHG attribution is not reused.',326:'Equal constant-rank projective presentations; semilocal freeness and arithmetic realizations require their respective hypotheses/owners.',332:'Rectangular presentation with s excess generators: Fitt⁰(M^tr)=(Fittˢ(M))# via maximal minors, with R# coefficient transport; arithmetic applications stay I.6/I.7.'}
rows('PAPER-DASGUPTA-KAKDE-23',[(i,'L4'if i in [42,44]else'L6','owner_boundary'if i in [92,168,318]else'upstream_import'if i in [19,49,65,78,317,325]else'open',v)for i,v in dk.items()])
items=load('RoutedItems.json');assert set(route)=={r['item']['id']for r in items}and len(route)==59
routed=[dict(id=x['item']['id'],name=x['item']['name'],file=x['file'],locator=x['item']['locator'],**route[x['item']['id']])for x in items];save('RouteMap.json',routed)
counts=dict(nodes=len(p['nodes']),kinds=dict(collections.Counter(n['kind']for n in p['nodes'])),API=sum(len(n.get('api',[]))for n in p['nodes']),tests=sum(len(n.get('tests',[]))for n in p['nodes']),constructionTests=sum(len(n.get('tests',[]))for n in p['nodes']if n['kind']in ['definition','construction']),planets=sum(bool(n.get('planet'))for n in p['nodes']),baseline=len(p['baseline']['declarations']),gaps=len(p['gaps']),requests=len(p['requests']),sourceIssues=len(p['sourceIssues']),namedLeanCommands=sum(bool(c['name'])for c in load('LeanCommands.json')),LeanExamples=sum(c['kind']=='example'for c in load('LeanCommands.json')));save('Counts.json',counts)
front='# p-adic measures and Iwasawa algebras: completed budget pass\n\n'+p['summary']+'\n\nAll mathematical node objects, APIs, tests, planets, baseline citations and historical findings below are inherited unchanged. The counterexample and correspondence gaps in this front matter override any older assertion of completion. Nothing is claimed formalised.\n\n## Coverage and next work\n\n'
for c in p['coverage']:
 front+='### '+c['stageId']+' — '+c['status']+'\n\n'+'\n\n'.join(c['remaining'])+'\n\n'
front+='## Source-route register\n\nThese are dispositions of all 59 records named by issue #555, checked against their accepted extraction routes. This pass read those records, not the complete source papers anew. A route marked open or partial is a follow-up obligation, not a new declaration. The confirmed RT-AREA-iwasawa-2/4 algebra/graph finding remains unresolved as specified in L6.\n\n'
for x in routed:front+='- **'+x['id']+'** ('+x['stage']+'; '+x['status']+'): '+x['note']+'\n'
front+='\n## Validation boundary\n\nThe full existing suggested file plus a planning comment compiled at the pinned sources with 740 expected admission warnings and no errors. Its 495 named commands and 258 examples do not cover all 369 node/API/test contracts. '+missing+'\n\n## Inherited reader, preserved verbatim\n\nThe following checkpoint text is historical; current status and limitations are above.\n\n'
reader=front+(S/'IncomingReader.md').read_text()
# Supply verbatim contract text where the older reader paraphrased it.
reader+='\n## Exact inherited contracts supplement\n\nThe following clauses retain the packet wording wherever the inherited reader used a paraphrase. They are unchecked, including the defective resolution clause identified above.\n\n'
for n in p['nodes']:
 clauses=[]
 if n['id']not in reader or n['statement']not in reader:clauses+=['Statement: '+n['statement']]
 for label,key in [('API','api'),('Test','tests')]:
  for a in n.get(key,[]):
   if a['name']not in reader or a['statement']not in reader:clauses += [label+' '+a['name']+': '+a['statement']]
 if clauses:reader+='### '+n['id']+'\n\n'+'\n\n'.join(clauses)+'\n\n'
reader=reader.rstrip()+'\n';(S/'Reader.md').write_text(reader)
for folder,n,ext in [('packets','Candidate.json','json'),('readmes','Reader.md','md'),('suggested','Suggested.lean','lean')]: (R/'research/blueprint'/folder/(RID+'.'+ext)).write_bytes((S/n).read_bytes())
print(json.dumps(counts,indent=2))
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
pat=re.compile(r'^[ \t]*(?:@\[[^\n]*\]\s*)?(?:(?:noncomputable|private|protected|local|unsafe)\s+)*(def|theorem|lemma|abbrev|structure|class|instance|example|namespace|section|end|variable|open|universe|set_option|attribute|notation|infixl?|infixr|prefix|postfix|macro|syntax|scoped|import|export|omit|include)\b',re.M)
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
 elif kind in ['def','theorem','lemma','abbrev','structure','class','instance']:
  name=tail.split()[0]if tail else None
  if name and name[0] in '({[:':name=None
  if name:
   ns='.'.join(x[1]for x in stack if x[0]=='namespace')
   name=(ns+'.'if ns else '')+name
 commands.append({'kind':kind,'name':name,'start':a,'end':last,'line':t.count('\n',0,a)+1,'namespaces':[x[1]for x in stack if x[0]=='namespace']})
assert all(k=='section' and not n for k,n in stack),stack
names={(n['library']['declaration']if '.'in n['library']['declaration']else n['library']['namespace']+'.'+n['library']['declaration'])for n in p['nodes']if n['library'].get('declaration')}|{a['name']if '.'in a['name']else n['library']['namespace']+'.'+a['name']for n in p['nodes']for a in n.get('api',[])}
found={c['name']for c in commands if c['name']}
missing=sorted(names-found);dups={n:v for n,v in collections.Counter(c['name']for c in commands if c['name']).items()if v>1}
(S/(prefix+'LeanCommands.json')).write_text(json.dumps(commands,indent=2)+'\n')
(S/(prefix+'LeanIndexReport.json')).write_text(json.dumps({'wanted':len(names),'found':len(found),'missing':missing,'duplicates':dups},indent=2)+'\n')
print(json.dumps({'commands':len(commands),'wanted':len(names),'missing':missing[:50],'duplicateCount':len(dups)},indent=2))
```

## Script: verify.py

```python
"""Authenticate PMIA preservation/evidence and execute immutable repository checks."""
from pathlib import Path
import ast,hashlib,json,os,re,subprocess,sys
S=Path(sys.argv[1]).resolve();R=Path.cwd().resolve();sys.path.insert(0,str(S));RID='PadicMeasuresIwasawaAlgebras';STEM=RID
sha=lambda b:hashlib.sha256(b).hexdigest()
txt=lambda n:(S/n).read_text()
data=lambda n:json.loads(txt(n))
MATH=txt('base.txt').strip();BASE=os.environ.get('ROOT_ACTION_VALIDATE_BASE',txt('publication-base.txt').strip())
def blob(ref,path):return subprocess.check_output(['git','show',ref+':'+path],cwd=R)
paths=['research/blueprint/'+f+'/'+('BP-'if f=='handoff'else'')+STEM+'.'+e for f,e in [('packets','json'),('readmes','md'),('suggested','lean'),('handoff','md')]]
contents={p:txt(n)for p,n in zip(paths,['Candidate.json','Reader.md','Suggested.lean','PublicHandoff.md'if(S/'PublicHandoff.md').exists()else'Handoff.md'])}
for path,name in zip(paths,['Incoming.json','IncomingReader.md','Incoming.lean','IncomingHandoff.md']):assert blob(MATH,path)==(S/name).read_bytes()==blob(BASE,path)
p=data('Candidate.json');old=data('Incoming.json');plan=data('Plan.json')
assert set(p)==set(old)and p['nodes']==old['nodes']and len(p['nodes'])==369 and p['status']=='complete'and plan['newNodes']==0
for k in old:
 if k not in plan['changedFields']:assert p[k]==old[k],k
for k in plan['changedFields']:assert p[k]==plan[k]
assert len(p['coverage'])==8 and [c['status']for c in p['coverage']]==[c['status']for c in old['coverage']]
assert len(p['gaps'])==10 and len(p['requests'])==2 and len(p['sourceIssues'])==15 and len(p['baseline']['declarations'])==350
assert all(n['implementationStatus']=='unchecked'for n in p['nodes'])
assert all(len(n['tests'])>=3 and len(n['api'])>=3 for n in p['nodes']if n['kind']in ['definition','construction'])
reader=txt('Reader.md');assert txt('IncomingReader.md')in reader
for n in p['nodes']:
 assert n['id']in reader and n['statement']in reader,n['id']
 for item in n.get('api',[])+n.get('tests',[]):assert item['name']in reader and item['statement']in reader,item['name']
assert txt('Suggested.lean').startswith(txt('Incoming.lean'))
assert len(data('RoutedItems.json'))==len(data('RouteMap.json'))==59
assert {x['item']['id']for x in data('RoutedItems.json')}=={x['id']for x in data('RouteMap.json')}
assert len(data('TouchingEntries.json'))==82
assert data('ClaimReceipt.json')['claim']==5984314644 and data('ClaimReceipt.json')['confirmation']==5984315743
assert data('Reading.json')['agent']=='Codex — codex-7e92bd'
# Regenerate the exact command index; report omissions, do not treat typing as coverage.
before={n:(S/n).read_bytes()for n in ['LeanCommands.json','LeanIndexReport.json']}
subprocess.run([sys.executable,str(S/'index_lean.py'),str(S),'Suggested.lean','Incoming.json'],check=True,capture_output=True)
for n,b in before.items():assert(S/n).read_bytes()==b,n
idx=data('LeanIndexReport.json');assert len(idx['missing'])==46 and not idx['duplicates']
assert sum(x.startswith('TauCeti.Iwasawa.')for x in idx['missing'])==42
commands=data('LeanCommands.json');assert sum(bool(c['name'])for c in commands)==495 and sum(c['kind']=='example'for c in commands)==258
typing=data('Typing.json');assert typing['sourceSha256']==sha((S/'Suggested.lean').read_bytes())and typing['logSha256']==sha((S/'Compile.log').read_bytes())
assert typing['exitCode']==typing['errors']==0 and typing['warnings']==740 and not typing['otherWarnings']and typing['availableGiB']>=20 and typing['serial']
assert typing['mathlib']==p['baseline']['mathlib']and typing['tauceti']==p['baseline']['tauceti']
assert len(data('SourceAudit.json'))==2891
changes=data('PublicationChanges.json');allowed={r['path']:r for r in changes}
for g in data('InputGuard.json'):
 a=sha(blob(MATH,g['path']));b=sha(blob(BASE,g['path']));assert a==g['sha256']
 if a!=b:assert g['path']in allowed and allowed[g['path']]['before']==a and allowed[g['path']]['after']==b and allowed[g['path']]['reviewed'],g['path']
contracts=[]
for ref in [MATH,BASE]:
 job=next(j for j in json.loads(blob(ref,'research/blueprint/queue.json'))['jobs']if j['id']=='BP-'+STEM)
 contracts.append({k:v for k,v in job.items()if k not in ['state','note']})
assert contracts[0]==contracts[1]
if(S/'artifact-manifest.json').exists():
 for n,m in data('artifact-manifest.json').items():
  b=(S/n).read_bytes();assert sha(b)==m['sha256']and len(b)==m['bytes']and len(b.splitlines())==m['lines'],n
for path,t in contents.items():
 assert t.endswith('\n')and not t.endswith('\n\n'),path
 assert not re.search(r'/(?:home|tmp|Users)/|file'+'://|[ \t]+$',t,re.M),path
os.environ['ROOT_ACTION_VALIDATE_BASE']=BASE
import immutable_view;assert immutable_view.BASE==BASE
for path,t in contents.items():immutable_view.TRACKED.add(path);immutable_view.CACHE[path]=t.encode()
immutable_view.install();sys.path.insert(0,str(R/'scripts'))
import check_blueprint,source_issues,check_errata
assert check_blueprint.NODE_BUDGET==300
assert sha(Path(sys.argv[2]).read_bytes())=='86649a7d5f35d1178a45fe7aa4713741d03d43ff3b37bb8c91a1da1c794c8ce1'
index=check_blueprint.load_index(Path(sys.argv[2]));assert index[0]is not None
errors,warnings,summary=check_blueprint.check(S/(STEM+'.json'),index,check_blueprint.world());assert not errors,errors;summary['packet']=paths[0]
assert not warnings,warnings
issues=source_issues.check_issues(p['sourceIssues'],RID)+check_errata.versions_checked(p,p['sourceIssues']);assert not issues,issues
tree=ast.parse((R/'research/blueprint/intake.py').read_text());wanted={'file_problems','auto_refusals','own_files','independent_of'}
picked=[n for n in tree.body if isinstance(n,ast.Assign)and any(isinstance(t,ast.Name)and t.id in {'ALLOWED','PRIVATE'}for t in n.targets)or isinstance(n,ast.FunctionDef)and n.name in wanted]
env={'json':json,'re':re};exec(compile(ast.Module(body=picked,type_ignores=[]),'actual-intake','exec'),env)
job=next(j for j in json.loads((R/'research/blueprint/queue.json').read_text())['jobs']if j['id']=='BP-'+STEM)
problems=[x for f in paths for x in env['file_problems'](f,contents[f])];refusals=env['auto_refusals'](job,paths,False,{'codex-7e92bd'},set());assert not problems and not refusals,(problems,refusals)
graph=json.loads(subprocess.check_output([sys.executable,str(S/'graph.py'),str(S)],cwd=R,text=True,env={**os.environ,'ROOT_ACTION_VALIDATE_BASE':BASE}));assert graph['worldCommit']==BASE
print(json.dumps(dict(checker=summary,warnings=warnings,sourceIssueErrors=issues,intakeProblems=problems,intakeRefusals=refusals,preservedNodes=369,newNodes=0,counts=data('Counts.json'),typing=typing,signatureIndex=idx,inputGuards=len(data('InputGuard.json')),reviewedPublicationChanges=changes,mathematicalBase=MATH,immutableBase=BASE,graph=graph,fullSuggestedCompiled=True,LeanExecuted=False),ensure_ascii=False,indent=2))
```

## Script: graph.py

```python
from pathlib import Path
import sys,json,collections,copy
R=Path.cwd(); S=Path(sys.argv[1]);RID='PadicMeasuresIwasawaAlgebras';STEM=RID;SCOPE={RID+':'+x for x in ['L0','L0a','L1','L2','L3','L4','L5','L6']}
sys.path.insert(0,str(S))
import immutable_view
immutable_view.install()
sys.path.insert(0,str(R/'scripts'))
import check_blueprint,build,blueprints
p=json.loads((S/'Candidate.json').read_text());old=json.loads((S/'Incoming.json').read_text())
packets,docs,defs=blueprints.load_promoted(R);keep=[x for x in packets if x[0]!=STEM]
docs[STEM]='research/blueprint/readmes/'+STEM+'.md'
def assemble(candidate):
 build.load_promoted=lambda *args:(copy.deepcopy(keep+[(STEM,candidate)]),copy.deepcopy(docs),copy.deepcopy(defs))
 return build.assemble(require_distances=False)[0]
a=assemble(p);b=assemble(old)
se={(e['source'],e['target']) for e in a['stageEdges']};assert se=={(e['source'],e['target']) for e in b['stageEdges']}
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
deps|={(r['supplier'],n)for r in p.get('requests',[])for n in r.get('neededBy',[])}
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
result={'stageDAG':dag(stages,se),'ownDAG':dag(nodes,{(d,n) for n in nodes for d in nodes[n]['prerequisites'] if d in nodes}),'scopedDAG':dag(stages|seen,se|deps),'reachableDeclarations':len(seen),'baselineLeaves':len(leaves),'unresolved':sorted(unresolved),'restructurePairs':len(pairs),'undrawnUpstreamContracts':upstream,'missingDrawnPaths':missing,'stageEdgesUnchanged':True,'allSkipsMatchControl':True,'ownAssembly':ar[RID].get('blueprint')}
assert {x:r for x,r in ar.items()if x!=RID}=={x:r for x,r in br.items()if x!=RID}
assert {s['id']:s for s in a['stages']if s.get('owner')!=RID}=={s['id']:s for s in b['stages']if s.get('owner')!=RID}
assert {s['id']:s for s in a['stages']if s['id']not in SCOPE}=={s['id']:s for s in b['stages']if s['id']not in SCOPE}
result['otherStagesUnchanged']=True
result['inheritedMissingRequestStagePaths']=sorted({(r['supplier'],nodes[n]['parentStageId'])for r in p.get('requests',[])for n in r.get('neededBy',[])if not reachable(r['supplier'],nodes[n]['parentStageId'])})
result['worldCommit']=immutable_view.BASE
result['foreignRoadmapsAndStagesUnchanged']=True
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
native={'TauCeti.NumberTheory.LocalField.UnitFiltration.Basic':'dd5e0cf19ea201a93a943cb43a135eaa20b7a2a23585fb4697ebb55080aa6ed8','TauCeti.Topology.Algebra.Group.LocallyConstant':'e66f653b6b7dc52ed9b1d01616246f9197bc3677f7861cdb459788d889edc800'}
old={r['module']:r['sha256']for r in json.loads((S/'OldNativeBuild.json').read_text())}
for name,h in native.items():
 rel=name.replace('.','/');assert sha((T/(rel+'.olean')).read_bytes())==h
 assert sha((B/'TauCeti'/(rel+'.lean')).read_bytes())==old[name]
libs=[T,M/'.lake/build/lib/lean'];packages={}
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

## Script: package.py

```python
"""Archive the named completion evidence and bind a public recovery helper."""
from pathlib import Path
import base64,hashlib,json,re,sys,zlib
S=Path(sys.argv[1]).resolve();R=Path.cwd();mode=sys.argv[2]
STEM='PadicMeasuresIwasawaAlgebras'
sha=lambda b:hashlib.sha256(b).hexdigest()
helpers=['author.py','index_lean.py','verify.py','graph.py','immutable_view.py','compile.py','package.py']
names="""Incoming.json IncomingReader.md Incoming.lean IncomingHandoff.md Candidate.json Reader.md Suggested.lean Plan.json Counts.json
Audit.json RoutedItems.json RouteMap.json TouchingEntries.json ClaimReceipt.json Reading.json InputGuard.json PublicationChanges.json
PriorReadingReuse.json Own3268Snapshot.json Own3268Handoff.md Own3268SourceAudit.json OldNativeBuild.json CompilePreflight.json SourceAudit.json Typing.json Compile.log
LeanCommands.json LeanIndexReport.json WORKLIST.md HandoffText.md HandoffBase.md Handoff.md MathematicalVerification.json Verification.json base.txt publication-base.txt""".split()+helpers
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
STEM='PadicMeasuresIwasawaAlgebras'
ARCHIVE=__ARCHIVE__
MANIFEST_SHA=__MANIFEST__
PAYLOAD_SHA=__PAYLOAD__
EXPECTED=__EXPECTED__
sha=lambda b:hashlib.sha256(b).hexdigest()
def fetch(ref,path):
 with urllib.request.urlopen(ROOT+ref+'/'+path,timeout=30)as r:return r.read()
raw=fetch(ARCHIVE,'research/blueprint/suggested/'+STEM+'.lean').decode()
pb=raw.split('/- BEGIN ARCHIVED PLANNING PASS COMPLETION PAYLOAD\\n',1)[1].split('END ARCHIVED PLANNING PASS COMPLETION PAYLOAD -/',1)[0].encode()
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

Save the final Python fence as recover.py and run `python3 recover.py REPLAY_DIR FULL_PR_HEAD_SHA`. It fetches the public immutable archive and all four deliverables, authenticates every artifact and helper, and checks its own code against the public handoff. Keep REPLAY_DIR outside an existing repository checkout. Inspect the recovered helpers, then from that checkout run `PYTHONDONTWRITEBYTECODE=1 python3 REPLAY_DIR/verify.py REPLAY_DIR DECLARATION_INDEX`. Use the pinned declarations.tsv (SHA256 86649a7d5f35d1178a45fe7aa4713741d03d43ff3b37bb8c91a1da1c794c8ce1). Output must equal Verification.json. Set ROOT_ACTION_VALIDATE_BASE to the base in base.txt to reproduce MathematicalVerification.json. Both bases must exist locally. The verifier runs the actual immutable checker, source-issue/intake functions and atlas assembler, and authenticates the exact inherited node objects, source and command index without executing Lean.

All 369 incoming node objects are authenticated unchanged. The recovered name index reports 42 missing explicit L4 signatures and four imported generic API names; it is not treated as a coverage certificate. The exact full-file typing receipt records zero errors and 740 admission warnings. Recovery and verification authenticate that receipt and source/log hashes without executing Lean. Both recovered verifier reports were reproduced before this PR was opened. The inherited resolution counterexample and source-decomposition gaps remain for independent review.


## Script: recover.py

'''
 text=(S/'HandoffBase.md').read_text()+prose+'```python\n'+code+'```\n'
 (S/'PublicHandoff.md').write_text(text);handoff.write_text(text);suggested.write_bytes((S/'Suggested.lean').read_bytes())
 print(json.dumps(dict(archive=archive,recoverySha256=sha(code.encode()),finalHandoffSha256=sha(text.encode())),indent=2))
else:raise ValueError(mode)
```
