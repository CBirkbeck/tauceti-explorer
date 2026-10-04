# Three-step chosen normalization coherence — checkpoint

Codex — codex-rtOQ9t. Refs #3403. Partial; every implementation remains unchecked.

For an actual chosen-frame root p=(u,y) of f over a commutative A-algebra B, retain the bundled unit u, equation u*y^n=image(f), and existing normalization algebra Dp=B[T]/(T^n-u). Arbitrary A-algebra maps phi:B to C,psi:C to D,chi:D to E give the exact existing framedRootChange objects and normalization spectrum maps.

normalizationPastingIso bundles the native pullbackRightPullbackFstIso and the exact pullback.congrHom for Spec composition. Its source is Spec D times over Spec C with (Spec C times over Spec B with Spec Dp); its target is the chosen direct pullback. Both forward and inverse projection equations and native roundtrips hold.

Pull the entire existing normalizationIteratedBaseChangeIso(phi,psi,p) back along Spec(chi), using pullback.map with identity maps on Spec E and Spec D. Its exact first projection makes the map compatible; native pullback.map_isIso and asIso give normalizationTripleTransportIso, with all four projection equations. Compose the actual normalizationBaseChangeIso(chi,psi(phi p)) with that transport to obtain normalizationTripleBaseChangeIso. Its first projection is the actual changed normalizationSpecMap to Spec E. All three second projections give exactly normalizationChangeSpecMap(chi composed with (psi composed with phi),p). Both inverse equations and roundtrips hold.

normalizationTriplePastingIso collapses the three nested chosen pullbacks by first pulling back normalizationPastingIso(phi,psi,p) along Spec(chi), then using normalizationPastingIso(psi composed with phi,chi,p). It has all four projection formulas and roundtrips. The whole isomorphism equals the alternate route that first combines the last two changes: native pullbackRightPullbackFstIso for Spec(psi), the phi pullback first projection and Spec(chi); native Spec-composition pullback.congrHom; normalizationPastingIso(phi,chi composed with psi,p); and finally the explicit pullback.congrHom induced by the spectrum of AlgHom.comp_assoc. Keeping that final identification explicit avoids relying on expensive implicit conversion of the actual scheme maps. The inverse whole route also agrees, reversing all four isomorphisms.

Composing normalizationTripleBaseChangeIso with normalizationTriplePastingIso equals the entire direct normalizationBaseChangeIso for chi composed with (psi composed with phi), as native scheme isomorphisms. The inverse collapse followed by inverse normalization comparison equals the direct inverse. For positive exponent, all three second projections followed by the actual chart map equal the changed actual chart map. No substitute carrier, section cancellation or flatness assumption is used.

Nine proved typed examples check all four pasting projections; all four transport projections; all four actual triple normalization projections; all four triple collapse projections, both roundtrips, the whole alternate route and reversed inverse route; the whole direct comparison and inverse; exponent zero; wild characteristic; and the zero ring. For Z/4 to Z/2 followed by two identities, p=(1,2) at f=0,n=2 has a nonzero square-zero normalized section killed by the actual triple composite algebra map, while the prescribed comparison projection and roundtrip still hold. At exponent3 over Z/3 the exponent vanishes in the base, yet the actual chart triangle and direct singleton fppf covering remain valid. The zero-ring covering statement requires no point of its empty spectrum. Every natural exponent is allowed for scheme comparisons; chart and covering assertions use positive exponent. There is no injectivity, surjectivity, reducedness, nontriviality, exponent-invertibility or section-regularity assumption.

All676 incoming node objects and336 baseline records remain unchanged. This adds25 nodes (4 constructions and21 lemmas),21 API references and15 references to9 distinct typed examples. Every construction has at least three API items,three tests and explicit consumers. Two baseline declarations are added after reading the exact pinned statements and ambient hypotheses. The packet has701 nodes,338 baseline records,566 raw API references and538 raw test references. All40 planets,ten partial stages,eight gaps,thirteen requests,both paper routes,eleven source findings,version receipts and the full omission ledger retain their scope. Only the RS0 description/coverage and TOWER-TYPING detail gain this frontier.

Three-step chosen-scheme coherence is established. Higher coherence,native sheaf RootObject comparison,local frame existence,fppf stackification,effective fpqc descent,infinite genuine2-limits and higher-universe adapters remain open. The reserved key retains arbitrary scheme and stack bases,actual invertible sheaves with sections,and every positive exponent in the fppf topology. Relative closed subschemes,nonreduced fibres,étale/DM invertibility hypotheses,both paper routes and all supplier obligations retain their original scope.

## Reading and provenance

The whole19646-character issue was read before claim5982646979 and after exact bot confirmation5982648051, each in complete contiguous ranges[0,13000] and[13000,19646]. The bodies match, SHA25680b1094ef57ffa9199903d436336938209a197a5eaf2f0c909560918668f0ed5. Whole WORKERS was refreshed in the preceding continuous loop job and its complete239 lines were freshly reread here in bounded ranges1–210/211–239. Complete blueprint/expansion/upstream protocols retain this same worker's original scopes at unchanged authenticated hashes; blueprint115–245/325–410 was also refreshed here.

All eight complete reviewed FA0–FA7 audit rows and whole REV-AUDIT20 were read in bounded complete outputs. No PartII audit row exists. The whole reserved key and actual root-stack key definition,native RootObject,normalizationBaseChangeIso,normalizationIteratedBaseChangeIso,its whole pasting node,and actual scheme-map composition node were read. An initially truncated aggregate was replaced by complete targeted reads for the consumed iterated objects. Whole JAC-A/TOWER-AFF requests,the RS0 description last4000 characters and TOWER-TYPING last3000 were refreshed. All remaining original source,supplier,route and omission scopes are retained only through guarded own readings.

Own incoming PR6082 at headb3cb01d23a0d894a5aacb297c653b43f50e75d42 was recovered by actual public HTTP from archive6e49272c430d395d074f4e72c5e3886d828ab1d4. Manifestcd0d1293173238248c4f3d5327555d86a3e0ec1f0fb1830387d1d14b23efa19e authenticates79 artifacts,ten helpers and five final files. Both original actual immutable verifier reports were rerun at their exact mathematical/publication bases and matched the archived reports byte-for-byte. All five current incoming files equal actual public bytes. Its handoff first13000 characters and all ten consumed helpers were read in complete bounded scopes; no fresh whole-fenced-handoff reading is claimed.

OwnPreviousReading/InputGuard/Candidate are bound to that actual6082 manifest. OwnInheritedManifest/Reading/InputGuard and the original OwnInheritedReadingReceipt/OwnOriginal6036Reading retain the exact nested authenticated own provenance and originally attributed scopes. The parent FunctionFieldArithmetic and upstream AlgebraicCurves/JacobianChallenge documents,governing protocols and selected source passages are reused only within the originally recorded same-worker continuous-session scopes. Eighteen external controls are unchanged; five owned files advanced. All676 incoming nodes,336 baseline objects and every incoming mathematical contract equal own6082 exactly. No peer personal reading receipt is adopted and no historical reading scope is enlarged.

Complete incoming21-declaration NewProofs and9-example NewTests were read. Focused actual Native8900–8945,9193–9235,10182–10245 cover the framed groupoid,algebra-change functor and chosen normalization comparison. The whole10844-line inherited Native was authenticated and recompiled as Context; no fresh complete manual reread is claimed. All25 new declarations,nine proved examples and exact admitted header projections were personally checked.

The whole displayed [Stacks04V8 subsection](https://stacks.math.columbia.edu/tag/04V8) paragraph/references and [Stacks01JO section](https://stacks.math.columbia.edu/tag/01JO), definitions1/7,lemmas2–6 and proofs,and all eight comments were freshly read. SourceReading binds actual HTTP hashes,URLs and access times. These give literature and scheme fibre-product context; the exact three-step normalization,chosen associativity,inverse and chart equations are authored deductions from the pinned native universal properties. No recursive reference audit,new source error,historical-version or whole-paper closure is claimed.

Pinned pullback.map/map_isIso/congrHom/hom_ext and lift projections with reassociated attributes; pullbackRightPullbackFstIso and projections; Iso.ext and AlgHom.comp_assoc were freshly read with ambient hypotheses. Unchanged own6082 source reading scopes supply asIso and Iso.inv_comp_eq. Reading/BaselineReading record exact hashes,ranges and indexed signatures. Specialized-name scans of the pinned Mathlib/Tau trees and packet directory and the touching-link scan including historical aliases found no matches. These bounded scans do not establish exhaustive semantic,PR or discussion absence.

## Validation

The whole Tau-dependent Canonical.lean and byte-equal Suggested.lean remain UNCOMPILED. Fresh TauProbe checks actual pinned sourcef790474821cf4256814db967cb154e7af3d0c369,a different available Tau build and four missing required compiled imports. No library build,cache download,Lake project,clone,repository snapshot or language server was created. All checks were strictly serial in the existing exact Mathlib build082e2d37e8b0463410cdb532e111cd43d5a66174 with Lean4.34.0-rc2 commit6a10ac8c22beadecabdbb0919c2b50214762f91d,one thread,8192MiB managed limit and1200-second timeout. Every launch checked fresh available memory≥20GiB,exact pins,compiler version,compiled dependencies and tracked cleanliness. Every own compiler finished.

- Native.lean: 11307 lines, 414 examples, exit0, 0 warnings; 602 dependency audits plus 1 axiom-free audits. Available memory 41GiB; elapsed 359.05 seconds; peak 4317204KiB. Source SHA256 30e46edc3e01f27cca26051f122c55f6a204a795d8f5580e3f3b05fb58fbc0e7; diagnostics SHA256 4fe1053e48980baa026ce07d5a1d4a86b6c252fbe7904514d66c248a688e8e79.
- Sketch.lean: 9170 lines, 414 examples, exit0, 528 warnings; 231 dependency audits plus 0 axiom-free audits. Available memory 41GiB; elapsed 160.44 seconds; peak 4079672KiB. Source SHA256 62e64f848ae973e88d6cdf592745f43cce39723add825623a04c4f3af377d76b; diagnostics SHA256 80e5c3a695230ffc1a0c2bc887488d3b2e75bde40d75e36acf03021a61025a5a.

Native executes the entire inherited proof certificate and all new declarations/examples together:414 examples,no errors,warnings or admissions,and602 standard dependency audits plus one axiom-free audit. All25 new declaration closures are audited and use only propext,Classical.choice and Quot.sound. Sketch is the admitted Mathlib projection with414 examples and528 admission warnings only;231 inherited audits stay clean. Its21 new lemma proofs andnine example proofs are admitted; the four construction bodies remain concrete. All25 declaration headers andnine example headers match the proved append. Full Canonical SHA2563c7a9dc5a7bdd8fcea02e29e5856d01aaedadd5d26e957170e4ed9eba36287de; neither executed Mathlib cone certifies the full Tau file.

Context and the focused Prototype compiled without errors or warnings. Exact sources,diagnostics and receipts are archived; disposable Context.olean is omitted. Earlier prototype conversion/kernel-limit failures were resolved by the explicit associativity congruence while retaining the original memory limit and mathematical claims; final executed proofs contain no admissions.

Indexed packet,source issue/version and actual immutable intake/file checks pass. Both verification reports execute those checks and the actual atlas assembler without Lean. Publication graph: stage3057/8726,own701/1525,scoped3863/11476 vertices/edges,all acyclic. All89 required supplier pairs are reachable; no owned skipped or pending links. Foreign roadmap/stage and inherited stage-edge objects match their immutable controls. The45 unrelated existing unreachable restructure pairs retain their scope.

Mathematical baseb3c2144279a099ccdbf8944dfe393469a7d07796; publication base83e3fc3aebd43b435145c35fc0b7903222b1b735. All23 input guards and queue job contract match across the bases. Prescribed index SHA25686649a7d5f35d1178a45fe7aa4713741d03d43ff3b37bb8c91a1da1c794c8ce1. Actual public HTTP recovery authenticates the archive/final files and both original actual verifier reports are reproduced before opening the PR.

## Resume

The whole three-step chosen normalization comparisons now agree with both parenthesized collapse routes and the direct comparison. Extend higher chosen coherence and carry actual framed arrows/unit labels into the native sheaf RootObject comparison. Local line-frame existence,descent,stackification and infinite genuine2-limits remain necessary. Preserve every inherited source,supplier,route and omission obligation.

## Script: assemble.py

```python
"""Retain all incoming prefixes and append exact normalization base-change data."""
from pathlib import Path
import re
from projection import project
S=Path(__file__).resolve().parent
t=lambda n:(S/n).read_text()
def prefix(n):
 text=t(n);imports=t('NewImports.lean');i=text.index('import ');return text[:i]+imports+'\n'+text[i:] if imports.strip() else text
a=project(t('NewProofs.lean'),t('NewTests.lean'));(S/'NewAdmitted.lean').write_text(a)
for out,p in [('Canonical.lean','CanonicalPrefix.lean'),('Sketch.lean','SketchPrefix.lean')]:
 (S/out).write_text(prefix(p)+'\n'+a)
(S/'Suggested.lean').write_text(t('Canonical.lean'))
names=re.findall(r'^(?:def|lemma|theorem) ([\w.]+)',t('NewProofs.lean'),re.M)
audit=''.join('#print axioms TauCeti.RootStack.'+n+'\n'for n in names);(S/'Audits.lean').write_text(audit)
(S/'Native.lean').write_text(prefix('NativePrefix.lean')+'\n'+t('NewProofs.lean')+'\n'+t('NewTests.lean')+'\n'+audit)
```

## Script: author.py

```python
"""Append actual three-step chosen normalization comparisons with unchanged incoming contracts."""
from pathlib import Path
import copy,csv,json,re,sys
S=Path(__file__).resolve().parent;RID='FunctionFieldArithmeticPartII';NS='TauCeti.RootStack.'
load=lambda n:json.loads((S/n).read_text())
def save(n,x):(S/n).write_text(json.dumps(x,ensure_ascii=False,indent=2)+'\n')
old=load('Incoming.json');p=copy.deepcopy(old);road=load('Incoming-roadmap.json')
existing={n.get('declarationName','').removeprefix(NS):n['id']for n in old['nodes']}
L='mathlib:CategoryTheory.Limits.'
specs=[]
def add(slug,name,kind,title,statement,deps,proof):specs.append((slug,'FramedRoot.'+name,kind,title,statement,deps,proof))
add('pasting','normalizationPastingIso','construction','The chosen normalization pullback pasting comparison','For arbitrary A-algebra maps phi:B to C and psi:C to D and framed root p=(u,y), construct the actual scheme isomorphism from the chosen iterated pullback Spec D times over Spec C with (Spec C times over Spec B with Spec Dp), to the chosen direct pullback Spec D times over Spec B with Spec Dp. Here Dp=B[T]/(T^n-u). Use native pullbackRightPullbackFstIso followed by pullback.congrHom for the actual Spec-composition equality.',[L+'pullbackRightPullbackFstIso',L+'pullback.congrHom','mathlib:AlgebraicGeometry.Spec.map_comp'],'Compose the actual native pasting and Spec-composition congruence isomorphisms. This comparison itself is pulled back across the third test-algebra change.')
projection_data={
'normalizationPastingIso':[
('hom_fst','The forward pasting map followed by the direct first projection equals the outer iterated first projection.'),
('hom_snd','The forward pasting map followed by the direct normalization projection equals the composite of both iterated second projections.'),
('inv_fst','The inverse pasting map followed by the outer iterated first projection equals the direct first projection.'),
('inv_snd','The inverse pasting map followed by both iterated second projections equals the direct normalization projection.')],
'normalizationTripleTransportIso':[
('hom_fst','The forward three-step transport followed by its target first projection equals the source first projection to Spec E.'),
('hom_snd','The forward three-step transport followed by its target second projection equals the source second projection followed by normalizationIteratedBaseChangeIso(phi,psi,p).hom.'),
('inv_fst','The inverse three-step transport followed by its source first projection equals its target first projection to Spec E.'),
('inv_snd','The inverse three-step transport followed by its source second projection equals its target second projection followed by normalizationIteratedBaseChangeIso(phi,psi,p).inv.')],
'normalizationTripleBaseChangeIso':[
('hom_fst','The three-step normalization comparison followed by the outer first projection equals the actual normalizationSpecMap of chi(psi(phi p)) to Spec E.'),
('hom_snd','The three-step normalization comparison followed by all three second projections equals normalizationChangeSpecMap(chi composed with (psi composed with phi),p).'),
('inv_fst','The inverse three-step normalization comparison followed by the actual changed normalizationSpecMap equals the outer first projection.'),
('inv_snd','The inverse three-step normalization comparison followed by the actual direct normalizationChangeSpecMap equals the composite of all three second projections.')],
'normalizationTriplePastingIso':[
('hom_fst','The forward three-step collapse followed by the direct first projection equals the outer first projection of the three nested chosen pullbacks.'),
('hom_snd','The forward three-step collapse followed by the direct normalization projection equals all three nested second projections.'),
('inv_fst','The inverse three-step collapse followed by the outer nested first projection equals the direct first projection.'),
('inv_snd','The inverse three-step collapse followed by all three nested second projections equals the direct normalization projection.')]}
def projections(base,slug):
 for suffix,statement in projection_data[base]:
  deps=['FramedRoot.'+base]
  if suffix.startswith('inv'):deps=['FramedRoot.'+base+'_hom_'+suffix.split('_')[1],'mathlib:CategoryTheory.Iso.inv_comp_eq']
  elif base=='normalizationTripleBaseChangeIso':deps+=['FramedRoot.normalizationTripleTransportIso_'+suffix,'FramedRoot.normalizationBaseChangeIso_'+suffix,'FramedRoot.normalizationIteratedBaseChangeIso_hom_snd','FramedRoot.normalizationChangeSpecMap_composition']
  elif base=='normalizationTriplePastingIso':deps+=['FramedRoot.normalizationPastingIso_'+suffix,L+'pullback.lift_fst',L+'pullback.lift_snd']
  elif base=='normalizationPastingIso':deps+=[L+'pullbackRightPullbackFstIso_'+suffix,L+'pullback.lift_fst',L+'pullback.lift_snd']
  else:deps+=[L+'pullback.lift_fst',L+'pullback.lift_snd']
  add(slug+'-'+suffix.replace('_','-'),base+'_'+suffix,'lemma',base+' '+suffix.replace('_',' '),statement,deps,'Compute actual native pullback map and pasting projections. For an inverse formula move the isomorphism across the corresponding forward equation, retaining every actual normalization spectrum map and nested second projection.')
projections('normalizationPastingIso','pasting')
add('transport','normalizationTripleTransportIso','construction','Transport the whole two-step comparison through a third change','For phi:B to C,psi:C to D,chi:D to E, construct the actual native isomorphism between the pullback of Spec D(psi(phi p)) along Spec(chi) and the pullback along Spec(chi) of the chosen two-step normalization pullback. Its underlying map is pullback.map with identities on Spec E and Spec D and normalizationIteratedBaseChangeIso(phi,psi,p).hom on the normalization factor.',['FramedRoot.normalizationIteratedBaseChangeIso','FramedRoot.normalizationIteratedBaseChangeIso_hom_fst',L+'pullback.map',L+'pullback.map_isIso','mathlib:CategoryTheory.asIso'],'The exact existing first projection supplies compatibility; all three pointwise maps are isomorphisms. Use native pullback.map_isIso and asIso.')
projections('normalizationTripleTransportIso','transport')
add('comparison','normalizationTripleBaseChangeIso','construction','The actual three-step normalization comparison','Construct the native scheme isomorphism from Spec D(chi(psi(phi p))) to Spec E times over Spec D with (Spec D times over Spec C with (Spec C times over Spec B with Spec Dp)). Compose normalizationBaseChangeIso(chi,psi(phi p)) with normalizationTripleTransportIso(phi,psi,chi,p).',['FramedRoot.normalizationBaseChangeIso','FramedRoot.normalizationTripleTransportIso'],'Compose the existing actual third normalization base-change comparison with the pullback transport of the entire two-step comparison.')
projections('normalizationTripleBaseChangeIso','comparison')
add('collapse','normalizationTriplePastingIso','construction','Collapse the three actual chosen pullbacks','Construct the actual native isomorphism from the three nested chosen pullbacks to the direct chosen pullback for chi composed with (psi composed with phi). First pull normalizationPastingIso(phi,psi,p) back along Spec(chi) using pullback.map with identities on the outer test scheme and common base; then compose normalizationPastingIso(psi composed with phi,chi,p).',['FramedRoot.normalizationPastingIso','FramedRoot.normalizationPastingIso_hom_fst',L+'pullback.map',L+'pullback.map_isIso','mathlib:CategoryTheory.asIso'],'Pull back the first-two-change pasting comparison and compose the remaining two-change pasting comparison. Native carriers retain the chosen pullback parentheses.')
projections('normalizationTriplePastingIso','collapse')
add('associativity','normalizationTriplePastingIso_associativity','lemma','The two three-step chosen collapse routes agree','The whole normalizationTriplePastingIso equals the alternate route which first applies pullbackRightPullbackFstIso to Spec(psi), the first projection of the phi pullback and Spec(chi), then pullback.congrHom for Spec(chi composed with psi), then normalizationPastingIso(phi,chi composed with psi,p), and finally the explicit pullback.congrHom for the spectrum of AlgHom.comp_assoc. This is equality of actual native scheme isomorphisms with the same three-nested source and direct target.',['FramedRoot.normalizationTriplePastingIso_hom_fst','FramedRoot.normalizationTriplePastingIso_hom_snd','FramedRoot.normalizationPastingIso_hom_fst','FramedRoot.normalizationPastingIso_hom_snd',L+'pullbackRightPullbackFstIso',L+'pullbackRightPullbackFstIso_hom_fst',L+'pullbackRightPullbackFstIso_hom_snd',L+'pullback.congrHom',L+'pullback.hom_ext','mathlib:CategoryTheory.Iso.ext','mathlib:AlgHom.comp_assoc'],'Apply native Iso.ext and pullback.hom_ext. Both routes have the same outer first projection and all three second projections; actual AlgHom composition identifies the direct target maps.')
add('associativity-inverse','normalizationTriplePastingIso_associativity_inverse','lemma','The inverse associativity routes agree','The inverse of normalizationTriplePastingIso equals normalizationPastingIso(phi,chi composed with psi,p).inv preceded by the inverse final AlgHom-associativity spectrum congruence and followed by the inverse Spec-composition congruence and inverse outer pullbackRightPullbackFstIso, in exactly reversed order.',['FramedRoot.normalizationTriplePastingIso_associativity'],'Apply Iso.inv to the entire actual three-step associativity equality.')
add('direct','normalizationTripleBaseChangeIso_paste','lemma','Three-step normalization equals the direct comparison','The whole normalizationTripleBaseChangeIso(phi,psi,chi,p) followed by normalizationTriplePastingIso(phi,psi,chi,p) equals normalizationBaseChangeIso(chi composed with (psi composed with phi),p) as actual native scheme isomorphisms.',['FramedRoot.normalizationTripleBaseChangeIso_hom_fst','FramedRoot.normalizationTripleBaseChangeIso_hom_snd','FramedRoot.normalizationTriplePastingIso_hom_fst','FramedRoot.normalizationTriplePastingIso_hom_snd','FramedRoot.normalizationBaseChangeIso_hom_fst','FramedRoot.normalizationBaseChangeIso_hom_snd',L+'pullback.hom_ext','mathlib:CategoryTheory.Iso.ext'],'Use Iso.ext and pullback.hom_ext; the projections are the actual third-changed normalizationSpecMap and direct normalizationChangeSpecMap.')
add('direct-inverse','normalizationTripleBaseChangeIso_paste_inverse','lemma','The inverse three-step comparison equals the direct inverse','normalizationTriplePastingIso.inv followed by normalizationTripleBaseChangeIso.inv equals normalizationBaseChangeIso(chi composed with (psi composed with phi),p).inv as actual scheme morphisms.',['FramedRoot.normalizationTripleBaseChangeIso_paste'],'Apply Iso.inv to the complete direct comparison equality, retaining reversed order.')
add('chart','normalizationTripleBaseChangeIso_chart','lemma','Three-step normalization retains the actual chart','For positive exponent, normalizationTripleBaseChangeIso.hom followed by all three second projections and p.normalizationChartMap equals normalizationChartMap(chi(psi(phi p))), as actual scheme morphisms to the existing root chart.',['FramedRoot.normalizationTripleBaseChangeIso_hom_snd','FramedRoot.normalizationChange_chart'],'Postcompose the exact triple normalization projection with the existing chart map and apply normalizationChange_chart for the direct composite.')
ids={name:RID+':RS.0/normalization-three-'+slug for slug,name,*_ in specs};sourceid='NormalizationThree-codex-rtOQ9t';nodes=[]
for slug,name,kind,title,statement,deps,proof in specs:
 nodes.append(dict(id=ids[name],parentStageId=RID+':RS.0',realises=[RID+':RS.0'],kind=kind,title=title,declarationName=NS+name,statement=statement,hypotheses=['Commutative rings A,B,C,D,E in one universe; A-algebra structures on B,C,D,E; arbitrary A-algebra maps phi:B to C,psi:C to D,chi:D to E; f in A and actual framed root p=(u,y), with u a bundled unit and u*y^n=image(f). '+('The natural exponent n is positive.'if slug=='chart'else'Every natural exponent n, including zero, is allowed.'),'No flatness, injectivity, surjectivity, reducedness, nontriviality, exponent-invertibility or section-regularity assumption. Higher coherence, native sheaf comparison, local frames, descent, stackification and infinite genuine 2-limits remain open.'],prerequisites=[d if ':'in d else ids.get(d,existing.get(d))for d in deps],proofSteps=[proof],acceptance=[statement,'Retain actual native scheme carriers and projection maps across arbitrary algebra changes, including nilpotents.'],library=dict(module='TauCeti/AlgebraicGeometry/RootStacks/RS0',namespace=NS[:-1]),sources=[dict(sourceId=sourceid,locator='Stacks Section26.17, Definition26.17.1 and Lemma26.17.2 with proof; authored three-step normalization specialization of the pinned native pullback universal properties',excerpt='universal among all diagrams',match='Scheme fibre-product context; exact three-step normalization, associativity and inverse equations are authored deductions. No stackification or infinite comparison theorem is attributed.')],api=[],tests=[],implementationStatus='unchecked'))
by={n['declarationName'].removeprefix(NS):n for n in nodes}
apis={k:['FramedRoot.'+k+'_'+suffix for suffix,_ in v]for k,v in projection_data.items()}
apis['normalizationTripleBaseChangeIso']+=['FramedRoot.normalizationTripleBaseChangeIso_'+x for x in ['paste','paste_inverse','chart']]
apis['normalizationTriplePastingIso']+=['FramedRoot.normalizationTriplePastingIso_'+x for x in ['associativity','associativity_inverse']]
testdata=[('pasting_projections','compatibility','The two-step pasting comparison has all four projection equations and both inverse roundtrips.'),('transport_projections','compatibility','Transport of the whole two-step comparison along an arbitrary third change has all four projection equations and both inverse roundtrips.'),('triple_projections','compatibility','The actual three-step normalization comparison has both forward and both inverse projection formulas and both roundtrips.'),('collapse_associativity','compatibility','The actual three-step collapse has all four projection formulas and both roundtrips; its whole isomorphism equals the alternate native pasting route and the inverse routes agree.'),('direct_comparison','compatibility','The whole actual three-step normalization comparison followed by the triple collapse equals the direct normalization isomorphism, and the inverse routes agree.'),('killed_nilpotent','non-example','For Z/4 to Z/2 followed by two identities, p=(1,2) at f=0,n=2 has a nonzero square-zero normalized section killed by the actual direct composite algebra map, while the three-step comparison retains its exact normalization projection and roundtrip.'),('wild_chart','degenerate','At exponent3 over Z/3 and arbitrary three successive algebra changes, the exponent vanishes in the base while the actual three-step chart triangle and roundtrip hold and the direct changed normalization map is singleton fppf covering.'),('exponent_zero','degenerate','For f=1,n=0 and arbitrary three changes the actual three-step comparison equals the direct chosen comparison after pasting and has both roundtrips; no positive-exponent chart or cover is asserted.'),('zero_ring','degenerate','For Z to Z/1 followed by two identities and p=(1,0),n=3, the actual three-step comparison has its first projection and both roundtrips and the changed normalization map is singleton fppf covering on the empty spectrum.')]
tests=[dict(name=NS+'normalizationThreeTests.'+a,kind=b,statement=c)for a,b,c in testdata];tb={a:t for (a,*_),t in zip(testdata,tests)}
testsets={'normalizationPastingIso':['pasting_projections','collapse_associativity','direct_comparison'],'normalizationTripleTransportIso':['transport_projections','triple_projections','zero_ring'],'normalizationTripleBaseChangeIso':['triple_projections','direct_comparison','killed_nilpotent','wild_chart','exponent_zero','zero_ring'],'normalizationTriplePastingIso':['collapse_associativity','direct_comparison','exponent_zero']}
for name,entries in apis.items():
 n=by['FramedRoot.'+name];n['api']=[dict(name=NS+x,role='compatibility',statement=by[x]['statement'])for x in entries];n['tests']=[tb[x]for x in testsets[name]];n['uses']=[dict(where=existing['normalizationFunctor'],how='Compare actual chosen normalization covers through three arbitrary test-algebra changes with whole associativity and direct-comparison equations.'),dict(where=RID+':RS.0/root-object',how='Supply coherent affine normalization comparisons for the open native sheaf comparison and local frame/descent construction.')]
p['nodes']+=nodes
rows=list(csv.reader(Path(sys.argv[1]).open(),delimiter='\t'));have={x['ref']for x in p['baseline']['declarations']};baseline=[];reading=[]
for name in sorted({x.removeprefix('mathlib:')for n in nodes for x in n['prerequisites']if x.startswith('mathlib:')}):
 row=next(r for r in rows if len(r)>5 and r[0]=='mathlib'and r[1]==name);reading.append(dict(name=name,file=row[3],line=int(row[4]),signature=row[5],scope='Exact pinned statement and ambient hypotheses read in bounded fresh ranges or authenticated unchanged own prior reading; Reading.json records scope.'))
 if 'mathlib:'+name not in have:baseline.append(dict(ref='mathlib:'+name,kind=row[2],module=row[3],line=int(row[4]),provides=row[5]+' Actual chosen normalization coherence.',checked='Codex — codex-rtOQ9t read this exact pinned declaration; Reading.json gives scope.'))
p['baseline']['declarations']+=baseline;save('BaselineReading.json',reading)
src=load('SourceReading.json')[1];p['sources'].append(dict(id=sourceid,title='Scheme fibre products and authored three-step normalization coherence',authors='The Stacks Project Authors; specialized deductions by Codex — codex-rtOQ9t',edition='Current displayed section, accessed4October2026',url=src['url'],sha256=src['sha256'],accessed='2026-10-04',readSections=[src['scope']]))
frontier='Three successive arbitrary test-algebra changes now have an actual normalization isomorphism to the three nested chosen scheme pullbacks. Pull back the complete two-step comparison along the third change and compose its normalizationBaseChangeIso. All forward and inverse projection equations and roundtrips hold. The actual triple pullback collapse agrees, as a whole native isomorphism and on its inverse, with the alternate route that first combines the last two changes. Composing the actual triple normalization comparison with either collapse route gives the direct normalizationBaseChangeIso for the triple composite. The positive-exponent actual chart triangle holds. Every natural exponent is allowed for scheme comparisons, with no flatness or injectivity assumptions; the nonflat Z/4 to Z/2 example kills a nonzero square-zero normalized section and preserves the comparison. Wild exponents and zero rings remain allowed. This establishes three-step chosen-scheme coherence only; higher coherence, native sheaf RootObject comparison, local frames, fppf stackification, effective fpqc descent, infinite genuine 2-limits and higher-universe adapters remain open with all inherited source, supplier and geometric obligations.'
p['summary']+=' Three-step chosen normalization continuation:25 declarations (4 constructions and21 lemmas),21 API references and9 distinct typed examples with15 references. All676 incoming node objects remain unchanged.'
next(x for x in p['coverage']if x['stageId']==RID+':RS.0')['remaining'].append(frontier);next(x for x in p['gaps']if x['id']=='TOWER-TYPING')['detail']+=' '+frontier;next(x for x in road['stages']if x['key']=='RS.0')['description']+=' '+frontier
for name,x in [('Candidate.json',p),(RID+'.json',p),('Candidate-roadmap.json',road),('NewNodes.json',nodes),('NewTests.json',tests)]:save(name,x)
save('Plan.json',dict(newNames=[n['declarationName']for n in nodes],apiAdditions={},newNodes=[n['id']for n in nodes],newBaseline=baseline,newBaselineRefs=[x['ref']for x in baseline],frontier=frontier,newNodesCount=len(nodes),newAPI=sum(map(len,apis.values())),newTests=len(tests),testReferences=sum(map(len,testsets.values()))))
parts=['# Three-step chosen normalization coherence\n\n'+frontier+'\n\nAll676 incoming node objects and336 baseline records retain their full scope. This adds25 nodes,21 API references and9 distinct typed examples with15 references. All40 planets,ten partial stages,eight gaps,thirteen requests,both paper routes,eleven source findings,omission ledger and version receipts retain their scope. Every implementation remains unchecked. The whole Tau-dependent suggested file is uncompiled; separate executed native Mathlib proof and admitted sketch evidence have exact scopes in the handoff.\n\n']
for n in nodes:
 parts+=['## '+n['title']+'\n\n','**'+n['declarationName']+'** — '+n['statement']+'\n\n','Hypotheses: '+' '.join(n['hypotheses'])+'\n\n','Prerequisites: '+', '.join(n['prerequisites'])+'.\n\n','Proof: '+' '.join(n['proofSteps'])+'\n\n']
 for label,key in [('Consumed API','api'),('Typed examples','tests')]:
  if n[key]:parts+=[label+':\n\n']+['- **'+x['name']+'**: '+x['statement']+'\n'for x in n[key]]+['\n']
(S/'ReaderAddition.md').write_text(''.join(parts));(S/'Reader.md').write_text(''.join(parts)+(S/'IncomingReader.md').read_text())
assert set(re.findall(r'^(?:def|lemma|theorem) ([\w.]+)',(S/'NewProofs.lean').read_text(),re.M))==set(ids)
assert len(nodes)==25 and sum(map(len,apis.values()))==21
print(json.dumps(dict(nodes=len(p['nodes']),newNodes=len(nodes),rawAPI=sum(len(n.get('api',[]))for n in p['nodes']),rawTests=sum(len(n.get('tests',[]))for n in p['nodes']),baseline=len(p['baseline']['declarations']),newBaseline=len(baseline))))
```

## Script: projection.py

```python
"""Admit lemma and example proofs while retaining actual construction bodies."""
import re
def admit_lemmas(text):
 lines=text.splitlines(keepends=True);out=[];i=0
 while i<len(lines):
  if re.match(r'^(?:lemma|theorem) |^example\b',lines[i]):
   j=i+1
   while j<len(lines)and(not lines[j].strip()or lines[j][0].isspace()):j+=1
   block=''.join(lines[i:j]);depth=0;pos=None;pending_let=0
   for k,c in enumerate(block):
    if c in '([{':depth+=1
    elif c in ')]}':depth-=1
    if depth==0 and re.match(r'let(?:I)?\b',block[k:]) and (k==0 or not (block[k-1].isalnum() or block[k-1]=='_')):
     pending_let+=1
    if block[k:k+2]==':='and depth==0:
     if pending_let:pending_let-=1
     else:pos=k;break
   assert pos is not None,block
   out.append(block[:pos]+':= by\n  sorry\n\n');i=j
  else:out.append(lines[i]);i+=1
 return ''.join(out)
def split_imports(text):
 lines=text.splitlines(keepends=True);last=max(i for i,l in enumerate(lines)if l.startswith('import '))
 assert all(not l.strip()or l.startswith(('import ','--'))for l in lines[:last+1])
 return ''.join(lines[:last+1]),''.join(lines[last+1:])

def project(proofs,tests):
 return admit_lemmas(proofs)+'\n'+admit_lemmas(tests)
```

## Script: write_handoff.py

```python
"""Render precise mathematical, personal reading and execution scopes."""
from pathlib import Path
import json,hashlib,re
S=Path(__file__).resolve().parent
text=lambda n:(S/n).read_text()
data=lambda n:json.loads(text(n))
sha=lambda b:hashlib.sha256(b).hexdigest()
def checked(name):
 r=data(name+'.receipt.json');b=(S/(name+'.lean')).read_bytes();assert r['exitStatus']==0
 return f"- {name}.lean: {len(b.splitlines())} lines, {len(re.findall(r'^example\b',b.decode(),re.M))} examples, exit0, {r['warnings']} warnings; {r['axiomAudits']} dependency audits plus {text(name+'.log').count('does not depend on any axioms')} axiom-free audits. Available memory {r['availableGiBBefore']}GiB; elapsed {r['elapsedSeconds']} seconds; peak {r['maxRssKiB']}KiB. Source SHA256 {sha(b)}; diagnostics SHA256 {r['logSha256']}.\n"
g=data('Graph.json');p=data('Candidate.json');plan=data('Plan.json');c=data('ClaimReceipt.json')
h=f'''# Three-step chosen normalization coherence — checkpoint

Codex — codex-rtOQ9t. Refs #3403. Partial; every implementation remains unchecked.

For an actual chosen-frame root p=(u,y) of f over a commutative A-algebra B, retain the bundled unit u, equation u*y^n=image(f), and existing normalization algebra Dp=B[T]/(T^n-u). Arbitrary A-algebra maps phi:B to C,psi:C to D,chi:D to E give the exact existing framedRootChange objects and normalization spectrum maps.

normalizationPastingIso bundles the native pullbackRightPullbackFstIso and the exact pullback.congrHom for Spec composition. Its source is Spec D times over Spec C with (Spec C times over Spec B with Spec Dp); its target is the chosen direct pullback. Both forward and inverse projection equations and native roundtrips hold.

Pull the entire existing normalizationIteratedBaseChangeIso(phi,psi,p) back along Spec(chi), using pullback.map with identity maps on Spec E and Spec D. Its exact first projection makes the map compatible; native pullback.map_isIso and asIso give normalizationTripleTransportIso, with all four projection equations. Compose the actual normalizationBaseChangeIso(chi,psi(phi p)) with that transport to obtain normalizationTripleBaseChangeIso. Its first projection is the actual changed normalizationSpecMap to Spec E. All three second projections give exactly normalizationChangeSpecMap(chi composed with (psi composed with phi),p). Both inverse equations and roundtrips hold.

normalizationTriplePastingIso collapses the three nested chosen pullbacks by first pulling back normalizationPastingIso(phi,psi,p) along Spec(chi), then using normalizationPastingIso(psi composed with phi,chi,p). It has all four projection formulas and roundtrips. The whole isomorphism equals the alternate route that first combines the last two changes: native pullbackRightPullbackFstIso for Spec(psi), the phi pullback first projection and Spec(chi); native Spec-composition pullback.congrHom; normalizationPastingIso(phi,chi composed with psi,p); and finally the explicit pullback.congrHom induced by the spectrum of AlgHom.comp_assoc. Keeping that final identification explicit avoids relying on expensive implicit conversion of the actual scheme maps. The inverse whole route also agrees, reversing all four isomorphisms.

Composing normalizationTripleBaseChangeIso with normalizationTriplePastingIso equals the entire direct normalizationBaseChangeIso for chi composed with (psi composed with phi), as native scheme isomorphisms. The inverse collapse followed by inverse normalization comparison equals the direct inverse. For positive exponent, all three second projections followed by the actual chart map equal the changed actual chart map. No substitute carrier, section cancellation or flatness assumption is used.

Nine proved typed examples check all four pasting projections; all four transport projections; all four actual triple normalization projections; all four triple collapse projections, both roundtrips, the whole alternate route and reversed inverse route; the whole direct comparison and inverse; exponent zero; wild characteristic; and the zero ring. For Z/4 to Z/2 followed by two identities, p=(1,2) at f=0,n=2 has a nonzero square-zero normalized section killed by the actual triple composite algebra map, while the prescribed comparison projection and roundtrip still hold. At exponent3 over Z/3 the exponent vanishes in the base, yet the actual chart triangle and direct singleton fppf covering remain valid. The zero-ring covering statement requires no point of its empty spectrum. Every natural exponent is allowed for scheme comparisons; chart and covering assertions use positive exponent. There is no injectivity, surjectivity, reducedness, nontriviality, exponent-invertibility or section-regularity assumption.

All676 incoming node objects and336 baseline records remain unchanged. This adds25 nodes (4 constructions and21 lemmas),21 API references and15 references to9 distinct typed examples. Every construction has at least three API items,three tests and explicit consumers. Two baseline declarations are added after reading the exact pinned statements and ambient hypotheses. The packet has701 nodes,338 baseline records,566 raw API references and538 raw test references. All40 planets,ten partial stages,eight gaps,thirteen requests,both paper routes,eleven source findings,version receipts and the full omission ledger retain their scope. Only the RS0 description/coverage and TOWER-TYPING detail gain this frontier.

Three-step chosen-scheme coherence is established. Higher coherence,native sheaf RootObject comparison,local frame existence,fppf stackification,effective fpqc descent,infinite genuine2-limits and higher-universe adapters remain open. The reserved key retains arbitrary scheme and stack bases,actual invertible sheaves with sections,and every positive exponent in the fppf topology. Relative closed subschemes,nonreduced fibres,étale/DM invertibility hypotheses,both paper routes and all supplier obligations retain their original scope.

## Reading and provenance

The whole19646-character issue was read before claim{c['claim']} and after exact bot confirmation{c['bot']}, each in complete contiguous ranges[0,13000] and[13000,19646]. The bodies match, SHA256{c['bodySha256']}. Whole WORKERS was refreshed in the preceding continuous loop job and its complete239 lines were freshly reread here in bounded ranges1–210/211–239. Complete blueprint/expansion/upstream protocols retain this same worker's original scopes at unchanged authenticated hashes; blueprint115–245/325–410 was also refreshed here.

All eight complete reviewed FA0–FA7 audit rows and whole REV-AUDIT20 were read in bounded complete outputs. No PartII audit row exists. The whole reserved key and actual root-stack key definition,native RootObject,normalizationBaseChangeIso,normalizationIteratedBaseChangeIso,its whole pasting node,and actual scheme-map composition node were read. An initially truncated aggregate was replaced by complete targeted reads for the consumed iterated objects. Whole JAC-A/TOWER-AFF requests,the RS0 description last4000 characters and TOWER-TYPING last3000 were refreshed. All remaining original source,supplier,route and omission scopes are retained only through guarded own readings.

Own incoming PR6082 at headb3cb01d23a0d894a5aacb297c653b43f50e75d42 was recovered by actual public HTTP from archive6e49272c430d395d074f4e72c5e3886d828ab1d4. Manifestcd0d1293173238248c4f3d5327555d86a3e0ec1f0fb1830387d1d14b23efa19e authenticates79 artifacts,ten helpers and five final files. Both original actual immutable verifier reports were rerun at their exact mathematical/publication bases and matched the archived reports byte-for-byte. All five current incoming files equal actual public bytes. Its handoff first13000 characters and all ten consumed helpers were read in complete bounded scopes; no fresh whole-fenced-handoff reading is claimed.

OwnPreviousReading/InputGuard/Candidate are bound to that actual6082 manifest. OwnInheritedManifest/Reading/InputGuard and the original OwnInheritedReadingReceipt/OwnOriginal6036Reading retain the exact nested authenticated own provenance and originally attributed scopes. The parent FunctionFieldArithmetic and upstream AlgebraicCurves/JacobianChallenge documents,governing protocols and selected source passages are reused only within the originally recorded same-worker continuous-session scopes. Eighteen external controls are unchanged; five owned files advanced. All676 incoming nodes,336 baseline objects and every incoming mathematical contract equal own6082 exactly. No peer personal reading receipt is adopted and no historical reading scope is enlarged.

Complete incoming21-declaration NewProofs and9-example NewTests were read. Focused actual Native8900–8945,9193–9235,10182–10245 cover the framed groupoid,algebra-change functor and chosen normalization comparison. The whole10844-line inherited Native was authenticated and recompiled as Context; no fresh complete manual reread is claimed. All25 new declarations,nine proved examples and exact admitted header projections were personally checked.

The whole displayed [Stacks04V8 subsection](https://stacks.math.columbia.edu/tag/04V8) paragraph/references and [Stacks01JO section](https://stacks.math.columbia.edu/tag/01JO), definitions1/7,lemmas2–6 and proofs,and all eight comments were freshly read. SourceReading binds actual HTTP hashes,URLs and access times. These give literature and scheme fibre-product context; the exact three-step normalization,chosen associativity,inverse and chart equations are authored deductions from the pinned native universal properties. No recursive reference audit,new source error,historical-version or whole-paper closure is claimed.

Pinned pullback.map/map_isIso/congrHom/hom_ext and lift projections with reassociated attributes; pullbackRightPullbackFstIso and projections; Iso.ext and AlgHom.comp_assoc were freshly read with ambient hypotheses. Unchanged own6082 source reading scopes supply asIso and Iso.inv_comp_eq. Reading/BaselineReading record exact hashes,ranges and indexed signatures. Specialized-name scans of the pinned Mathlib/Tau trees and packet directory and the touching-link scan including historical aliases found no matches. These bounded scans do not establish exhaustive semantic,PR or discussion absence.

## Validation

The whole Tau-dependent Canonical.lean and byte-equal Suggested.lean remain UNCOMPILED. Fresh TauProbe checks actual pinned sourcef790474821cf4256814db967cb154e7af3d0c369,a different available Tau build and four missing required compiled imports. No library build,cache download,Lake project,clone,repository snapshot or language server was created. All checks were strictly serial in the existing exact Mathlib build082e2d37e8b0463410cdb532e111cd43d5a66174 with Lean4.34.0-rc2 commit6a10ac8c22beadecabdbb0919c2b50214762f91d,one thread,8192MiB managed limit and1200-second timeout. Every launch checked fresh available memory≥20GiB,exact pins,compiler version,compiled dependencies and tracked cleanliness. Every own compiler finished.

'''+checked('Native')+checked('Sketch')+f'''
Native executes the entire inherited proof certificate and all new declarations/examples together:414 examples,no errors,warnings or admissions,and602 standard dependency audits plus one axiom-free audit. All25 new declaration closures are audited and use only propext,Classical.choice and Quot.sound. Sketch is the admitted Mathlib projection with414 examples and528 admission warnings only;231 inherited audits stay clean. Its21 new lemma proofs andnine example proofs are admitted; the four construction bodies remain concrete. All25 declaration headers andnine example headers match the proved append. Full Canonical SHA256{sha((S/'Canonical.lean').read_bytes())}; neither executed Mathlib cone certifies the full Tau file.

Context and the focused Prototype compiled without errors or warnings. Exact sources,diagnostics and receipts are archived; disposable Context.olean is omitted. Earlier prototype conversion/kernel-limit failures were resolved by the explicit associativity congruence while retaining the original memory limit and mathematical claims; final executed proofs contain no admissions.

Indexed packet,source issue/version and actual immutable intake/file checks pass. Both verification reports execute those checks and the actual atlas assembler without Lean. Publication graph: stage{g['stageDAG']['vertices']}/{g['stageDAG']['edges']},own{g['ownDeclarationDAG']['vertices']}/{g['ownDeclarationDAG']['edges']},scoped{g['scopedDAG']['vertices']}/{g['scopedDAG']['edges']} vertices/edges,all acyclic. All{g['requiredPairs']} required supplier pairs are reachable; no owned skipped or pending links. Foreign roadmap/stage and inherited stage-edge objects match their immutable controls. The{g['otherPreexistingUnreachableRestructurePairs']} unrelated existing unreachable restructure pairs retain their scope.

Mathematical base{text('base.txt').strip()}; publication base{text('publication-base.txt').strip()}. All23 input guards and queue job contract match across the bases. Prescribed index SHA25686649a7d5f35d1178a45fe7aa4713741d03d43ff3b37bb8c91a1da1c794c8ce1. Actual public HTTP recovery authenticates the archive/final files and both original actual verifier reports are reproduced before opening the PR.

## Resume

The whole three-step chosen normalization comparisons now agree with both parenthesized collapse routes and the direct comparison. Extend higher chosen coherence and carry actual framed arrows/unit labels into the native sheaf RootObject comparison. Local line-frame existence,descent,stackification and infinite genuine2-limits remain necessary. Preserve every inherited source,supplier,route and omission obligation.

'''
fence=chr(96)*3
for helper in ['assemble.py','author.py','projection.py','write_handoff.py','verify.py','graph.py','immutable_view.py','compile.py','runcheck.py','package.py']:
 h+='## Script: '+helper+'\n\n'+fence+'python\n'+text(helper)+fence+'\n\n'
h=h.rstrip()+'\n';(S/'HandoffBase.md').write_text(h);(S/'Handoff.md').write_text(h)
```

## Script: verify.py

```python
"""Replay exact contracts, source receipts and actual immutable checker/intake/atlas; no Lean."""
from pathlib import Path
import ast,hashlib,json,os,re,subprocess,sys
S=Path(sys.argv[1]).resolve();R=Path.cwd().resolve();sys.path.insert(0,str(S))
RID='FunctionFieldArithmeticPartII';NS='TauCeti.RootStack.'
sha=lambda b:hashlib.sha256(b).hexdigest()
def txt(n):return (S/n).read_text()
def data(n):return json.loads(txt(n))
MATH=txt('base.txt').strip();BASE=os.environ.get('ROOTS_VALIDATE_BASE',txt('publication-base.txt').strip())
def blob(ref,path):return subprocess.check_output(['git','show',ref+':'+path],cwd=R)
paths=['research/blueprint/'+f+'/'+('DESIGN-'if f=='handoff'else'')+RID+'.'+e for f,e in [('roadmaps','json'),('packets','json'),('readmes','md'),('suggested','lean'),('handoff','md')]]
names=['Candidate-roadmap.json','Candidate.json','Reader.md','Suggested.lean','Handoff.md'];contents={p:txt(n)for p,n in zip(paths,names)}
if (S/'PublicHandoff.md').exists():
 assert txt('PublicHandoff.md').startswith(txt('HandoffBase.md'))
 contents[paths[-1]]=txt('PublicHandoff.md')
 fence=chr(96)*3
 code=txt('PublicHandoff.md').split('## Script: recover.py\n\n'+fence+'python\n',1)[1].split('\n'+fence+'\n',1)[0]+'\n'
 assert code==txt('recover.py')
 if (S/'artifact-manifest.json').exists():
  for helper in data('artifact-manifest.json'):
   if helper.endswith('.py'):
    embedded=txt('PublicHandoff.md').split('## Script: '+helper+'\n\n'+fence+'python\n',1)[1].split('\n'+fence+'\n',1)[0]+'\n'
    assert embedded==txt(helper),helper

for p,n in zip(paths,['Incoming-roadmap.json','Incoming.json','IncomingReader.md','Incoming.lean','IncomingHandoff.md']):
 assert blob(MATH,p)==(S/n).read_bytes()==blob(BASE,p),p
assert sha((S/'OwnPreviousManifest.json').read_bytes())=='cd0d1293173238248c4f3d5327555d86a3e0ec1f0fb1830387d1d14b23efa19e'
for n,o in [('OwnPreviousReading.json','Reading.json'),('OwnPreviousInputGuard.json','InputGuard.json'),('OwnPreviousCandidate.json','Candidate.json'),('OwnInheritedManifest.json','OwnPreviousManifest.json'),('OwnInheritedReading.json','OwnPreviousReading.json'),('OwnInheritedInputGuard.json','OwnPreviousInputGuard.json'),('OwnInheritedReadingReceipt.json','OwnInheritedReadingReceipt.json'),('OwnOriginal6036Reading.json','OwnOriginal6036Reading.json')]:
 assert sha((S/n).read_bytes())==data('OwnPreviousManifest.json')[o]['sha256'],n
reuse=data('OwnReadingReuse.json');guards=data('OwnPreviousInputGuard.json')
assert len(guards)==len(reuse)==23 and sum(x['unchanged']for x in reuse)==18
for g,u in zip(guards,reuse):
 assert g['path']==u['path'] and g['sha256']==u['before'] and sha(blob(MATH,g['path']))==u['after']
 assert u['unchanged']==(u['before']==u['after'])
claim=data('ClaimReceipt.json');assert claim['issue']==3403 and claim['claim']==5982646979 and claim['bot']==5982648051 and claim['beforeAfterEqual']
assert claim['characters']==19646 and claim['bodySha256']=='80b1094ef57ffa9199903d436336938209a197a5eaf2f0c909560918668f0ed5'
for key in ['beforeReads','afterReads']:
 ranges=claim[key];assert ranges[0][0]==0 and ranges[-1][1]==19646 and all(a[1]==b[0]for a,b in zip(ranges,ranges[1:]))
p=data('Candidate.json');old=data('Incoming.json');road=data('Candidate-roadmap.json');oldroad=data('Incoming-roadmap.json');plan=data('Plan.json')
assert len(old['nodes'])==676 and len(p['nodes'])==701 and p['nodes'][676:]==data('NewNodes.json')
unchanged=0
for a,b in zip(old['nodes'],p['nodes']):
 expected=json.loads(json.dumps(a))
 if a['id']in plan['apiAdditions']:expected['api']+=plan['apiAdditions'][a['id']]
 else:unchanged+=1
 assert b==expected,a['id']
assert unchanged==676 and set(p)==set(old)and plan['apiAdditions']=={}and p['nodes'][:676]==old['nodes']
for k in old:
 if k not in ['nodes','summary','sources','baseline','coverage','gaps','sourceIssues','sourceVersions']:assert p[k]==old[k],k
assert p['sourceIssues']==old['sourceIssues'] and len(p['sourceIssues'])==11
assert p['sourceVersions']==old['sourceVersions']
assert p['sources'][:-1]==old['sources']and p['summary'].startswith(old['summary'])
assert {k:v for k,v in p['baseline'].items()if k!='declarations'}=={k:v for k,v in old['baseline'].items()if k!='declarations'}
assert p['baseline']['declarations'][:336]==old['baseline']['declarations']
assert [d['ref']for d in p['baseline']['declarations'][336:]]==plan['newBaselineRefs']and len(plan['newBaselineRefs'])==2
assert p['status']=='partial'and all(n['implementationStatus']=='unchecked'for n in p['nodes'])
assert len(p['requests'])==13 and len(p['gaps'])==8 and len(p['coverage'])==10
for a,b in zip(old['coverage'],p['coverage']):
 if a['stageId']==RID+':RS.0':assert b['remaining'][:-1]==a['remaining']and {k:v for k,v in a.items()if k!='remaining'}=={k:v for k,v in b.items()if k!='remaining'}
 else:assert a==b
for a,b in zip(old['gaps'],p['gaps']):
 if a['id']=='TOWER-TYPING':assert b['detail'].startswith(a['detail'])and {k:v for k,v in a.items()if k!='detail'}=={k:v for k,v in b.items()if k!='detail'}
 else:assert a==b
assert {k:v for k,v in road.items()if k!='stages'}=={k:v for k,v in oldroad.items()if k!='stages'}
for a,b in zip(oldroad['stages'],road['stages']):
 if a['key']=='RS.0':assert b['description']==a['description']+' '+plan['frontier']and {k:v for k,v in a.items()if k!='description'}=={k:v for k,v in b.items()if k!='description'}
 else:assert a==b
assert data('PreviousRecovery.json')['head']=='b3cb01d23a0d894a5aacb297c653b43f50e75d42'
assert data('PreviousRecovery.json')['artifactsVerified']==79 and data('PreviousRecovery.json')['archivedHelpersVerified']==10
assert data('IncomingReceipt.json')['bothActualVerifiersMatchRecordedExactly'] and data('IncomingReceipt.json')['fiveMathematicalBaseFilesMatchPublicHead']
for i,tag in enumerate(['04V8','01JO']):
 source=data('SourceReading.json')[i]
 assert source['sha256']==sha((S/('Stacks-'+tag+'.html')).read_bytes())
 assert source['url']=='https://stacks.math.columbia.edu/tag/'+tag
assert p['sources'][-1]['id']=='NormalizationThree-codex-rtOQ9t'
assert p['sources'][-1]['sha256']==data('SourceReading.json')[1]['sha256']
assert data('OwnContractGuard.json')=={k:data('Incoming.json')[k]==data('OwnPreviousCandidate.json')[k]for k in data('Incoming.json')if k not in ['nodes','summary','sources','baseline','coverage','gaps','sourceIssues','sourceVersions']}
assert all(data('OwnContractGuard.json').values())
assert old==data('OwnPreviousCandidate.json')
assert old['baseline']['declarations'][:336]==data('OwnPreviousCandidate.json')['baseline']['declarations']
assert data('OwnPreviousRecovery.json')['head']=='b3cb01d23a0d894a5aacb297c653b43f50e75d42' and data('OwnPreviousRecovery.json')['artifactsVerified']==79
for k in ['sourceIssues','sourceVersions']:
 assert old[k][:len(data('OwnPreviousCandidate.json')[k])]==data('OwnPreviousCandidate.json')[k]
assert data('TauProbe.json')['fullCanonicalExecution'].startswith('UNCOMPILED')
assert txt('Reader.md')==txt('ReaderAddition.md')+txt('IncomingReader.md')
from projection import project
assert txt('NewAdmitted.lean')==project(txt('NewProofs.lean'),txt('NewTests.lean'))
assert txt('CanonicalPrefix.lean')==txt('Incoming.lean')
def with_import(n):
 text=txt(n);imports=txt('NewImports.lean');i=text.index('import ');return text[:i]+imports+'\n'+text[i:] if imports.strip() else text
assert txt('Canonical.lean')==with_import('Incoming.lean')+'\n'+txt('NewAdmitted.lean')==txt('Suggested.lean')
assert txt('Sketch.lean')==with_import('SketchPrefix.lean')+'\n'+txt('NewAdmitted.lean')
for target,source in [('NativePrefix.lean','Native.lean'),('Incoming.lean','Canonical.lean'),('SketchPrefix.lean','Sketch.lean')]:
 assert sha((S/target).read_bytes())==data('IncomingManifest.json')[source]['sha256']
assert sha((S/'IncomingManifest.json').read_bytes())=='cd0d1293173238248c4f3d5327555d86a3e0ec1f0fb1830387d1d14b23efa19e'
for n,o in [('IncomingPublicationVerification-replayed.json','Verification.json'),('IncomingMathematicalVerification-replayed.json','Verification-mathematical.json')]:
 assert sha((S/n).read_bytes())==data('IncomingManifest.json')[o]['sha256']
assert sha(Path(sys.argv[2]).read_bytes())=='86649a7d5f35d1178a45fe7aa4713741d03d43ff3b37bb8c91a1da1c794c8ce1'
assert txt('Context.lean')==txt('NativePrefix.lean')
cr=data('Context.receipt.json');assert cr['exitStatus']==0 and cr['warnings']==0 and cr['sourceSha256']==sha((S/'Context.lean').read_bytes()) and cr['logSha256']==sha((S/'Context.log').read_bytes())
assert txt('Prototype.lean')=='import Context\n'+txt('NewProofs.lean')+'\n'+txt('NewTests.lean')
pr=data('Prototype.receipt.json');pl=txt('Prototype.log')
assert pr['exitStatus']==0 and pr['warnings']==0 and pr['availableGiBBefore']>=20
assert pr['sourceSha256']==sha((S/'Prototype.lean').read_bytes())and pr['logSha256']==sha(pl.encode())
assert not re.search(r'\b(?:sorry|admit|axiom)\b',txt('Prototype.lean'))
assert txt('Native.lean')==with_import('NativePrefix.lean')+'\n'+txt('NewProofs.lean')+'\n'+txt('NewTests.lean')+'\n'+txt('Audits.lean')
assert not re.search(r'\b(?:sorry|admit|axiom)\b',txt('Native.lean'))
def headers(text):
 found={}
 for m in re.finditer(r'^(structure|def|lemma|theorem|example)\b(?: ([\w.]+))?',text,re.M):
  depth=0;end=None;pending_let=0
  for i in range(m.start(),len(text)):
   c=text[i]
   if c in '([{⟨':depth+=1
   elif c in ')]}⟩':depth-=1
   if depth==0 and re.match(r'let(?:I)?\b',text[i:]) and (i==0 or not (text[i-1].isalnum() or text[i-1]=='_')):pending_let+=1
   if depth==0 and text.startswith(':=',i):
    if pending_let:pending_let-=1
    else:end=i;break
   if depth==0 and m.group(1)in {'def','structure'}and text.startswith('where',i)and text[i-1].isspace()and text[i+5].isspace():end=i;break
  assert end is not None
  label=m.group(2)if m.group(1)!='example'else'example#'+str(sum(x.startswith('example#')for x in found))
  assert label not in found;found[label]=' '.join(text[m.start():end].split())
 return found
nh=headers(txt('NewProofs.lean'));nt=headers(txt('NewTests.lean'));ch=headers(txt('NewAdmitted.lean'));assert {**nh,**nt}==ch
assert all(not re.search(r'\b(?:sorry|admit|axiom)\b',h)for h in ch.values())
assert len(nh)==25 and len(nt)==9
assert set(plan['newNames'])=={NS+n for n in nh}=={n['declarationName']for n in p['nodes'][676:]}
assert {t['name']for t in data('NewTests.json')}=={NS+n for n in re.findall(r'^-- test: (.+)$',txt('NewTests.lean'),re.M)}
for n in p['nodes'][676:]:
 if n['kind']in {'construction','definition'}:assert len(n['api'])>=3 and len(n['tests'])>=3 and n['uses']
 assert n['declarationName']in txt('Reader.md')and n['statement']in txt('Reader.md')
 for x in n['api']+n['tests']:assert x['name']in txt('Reader.md')and x['statement']in txt('Reader.md')
assert sum(len(n['api'])for n in p['nodes'][676:])+sum(map(len,plan['apiAdditions'].values()))==21 and sum(len(n['tests'])for n in p['nodes'][676:])==15
compilation={}
for name,want,audits in [('Native',0,602),('Sketch',528,231)]:
 rec=data(name+'.receipt.json');log=txt(name+'.log')
 assert rec['exitStatus']==0 and rec['availableGiBBefore']>=20
 assert rec['sourceSha256']==sha((S/(name+'.lean')).read_bytes())and rec['logSha256']==sha(log.encode())
 assert ': error'not in log and log.count('warning:')==log.count('warning: declaration uses `sorry`')==want,(name,log.count('warning:'))
 ex=len(re.findall(r'^example\b',txt(name+'.lean'),re.M));assert ex==414,(name,ex)
 a=re.findall(r'depends on axioms:\s*\[([^]]*)\]',log);assert len(a)==audits,(name,len(a))
 assert 'sorryAx'not in log and all(set(v.strip()for v in x.replace('\n',' ').split(','))<={'propext','Classical.choice','Quot.sound'}for x in a)
 compilation[name]={**rec,'lines':len(txt(name+'.lean').splitlines()),'examples':ex,'axiomFreeAudits':log.count('does not depend on any axioms')}
audited=set(re.findall(r"'([^']+)' (?:depends on axioms:|does not depend on any axioms)",txt('Native.log')))
assert set(plan['newNames'])<=audited
assert 'z ≠ 0' in nt['example#5'] and 'z ^ 2 = 0' in nt['example#5'] and 'normalizationTripleBaseChangeIso' in nt['example#5']
assert 'a ≪≫ c ≪≫ b ≪≫ d' in nt['example#3'] and 'd.inv ≫ b.inv ≫ c.inv ≫ a.inv' in nt['example#3']
assert 'e ≪≫ c' in nt['example#4'] and 'c.inv ≫ e.inv' in nt['example#4']
assert txt('NewImports.lean')==''
assert 'sorry'not in txt('NewProofs.lean') and len(re.findall(r'^def ',txt('NewProofs.lean'),re.M))==4
for g in data('InputGuard.json'):assert sha(blob(MATH,g['path']))==g['sha256']==sha(blob(BASE,g['path'])),g['path']
for qbase in [MATH,BASE]:
 jq=json.loads(blob(qbase,'research/blueprint/queue.json'));own=next(j for j in jq['jobs']if j['id']=='DESIGN-'+RID)
 contract={k:v for k,v in own.items()if k not in ['state','note']}
 if qbase==MATH:own_original=contract
 else:assert contract==own_original
if (S/'artifact-manifest.json').exists():
 for n,m in data('artifact-manifest.json').items():
  b=(S/n).read_bytes();assert sha(b)==m['sha256']and len(b)==m['bytes']and len(b.splitlines())==m['lines'],n
for path,text in contents.items():
 assert not re.search(r'/(?:home|tmp|Users)/|file'+'://',text),path
 assert not re.search(r'[ \t]+$',text,re.M),path
os.environ['ROOTS_VALIDATE_BASE']=BASE
import immutable_view;assert immutable_view.BASE==BASE
for path,t in contents.items():immutable_view.CACHE[path]=t.encode()
immutable_view.install();sys.path.insert(0,str(R/'scripts'))
import check_blueprint,source_issues,check_errata
index=check_blueprint.load_index(Path(sys.argv[2]));assert index[0]is not None
errors,warnings,summary=check_blueprint.check(S/(RID+'.json'),index,check_blueprint.world());assert not errors and not warnings,(errors,warnings)
summary['packet']=paths[1]
issues=source_issues.check_issues(p['sourceIssues'],RID)+check_errata.versions_checked(p,p['sourceIssues']);assert not issues,issues
tree=ast.parse((R/'research/blueprint/intake.py').read_text());wanted={'file_problems','auto_refusals','own_files','independent_of'}
picked=[n for n in tree.body if isinstance(n,ast.Assign)and any(isinstance(t,ast.Name)and t.id in {'ALLOWED','PRIVATE'}for t in n.targets)or isinstance(n,ast.FunctionDef)and n.name in wanted]
env={'json':json,'re':re};exec(compile(ast.Module(body=picked,type_ignores=[]),'actual-intake','exec'),env)
job=next(j for j in json.loads((R/'research/blueprint/queue.json').read_text())['jobs']if j['id']=='DESIGN-'+RID)
problems=[x for f in paths for x in env['file_problems'](f,contents[f])];refusals=env['auto_refusals'](job,paths,False,{'codex-rtOQ9t'},set());assert not problems and not refusals,(problems,refusals)
graph=json.loads(subprocess.check_output([sys.executable,str(S/'graph.py'),str(S)],cwd=R,text=True,env={**os.environ,'ROOTS_VALIDATE_BASE':BASE}));assert graph['worldCommit']==BASE
if BASE==txt('publication-base.txt').strip():assert graph==data('Graph.json')
print(json.dumps(dict(checker=summary,sourceIssueErrors=issues,intakeProblems=problems,intakeRefusals=refusals,wholeIncomingNodesUnchanged=676,incomingMathematicalContractsPreserved=676,newNodes=25,newAPIItems=21,newTests=9,newTestReferences=15,newSourceFindings=0,inheritedSourceFindingsUnchanged=len(old['sourceIssues']),matchedNewHeaders=len(ch),rawAPIItems=sum(len(n.get('api',[]))for n in p['nodes']),rawTests=sum(len(n.get('tests',[]))for n in p['nodes']),compilation=compilation,canonicalExecution='UNCOMPILED: no existing full Tau Ceti build at the exact pin; entire canonical prefix retained.',inputGuards=len(data('InputGuard.json')),indexSha256=sha(Path(sys.argv[2]).read_bytes()),immutableBase=BASE,graph=graph,LeanExecuted=False),indent=2))
```

## Script: graph.py

```python
from pathlib import Path
import sys,json,copy,collections,hashlib
S=Path(sys.argv[1]).resolve();R=Path.cwd();sys.path.insert(0,str(S));import immutable_view;immutable_view.install()
sys.path.insert(0,str(R/'scripts'));import build,blueprints,check_blueprint
RID='FunctionFieldArithmeticPartII';FILES=['research/blueprint/'+f+'/'+('DESIGN-' if f=='handoff' else '')+RID+'.'+e for f,e in [('roadmaps','json'),('packets','json'),('readmes','md'),('suggested','lean'),('handoff','md')]]
p=json.loads((S/'Candidate.json').read_text());old=json.loads((S/'Incoming.json').read_text());rd=json.loads((S/'Candidate-roadmap.json').read_text());rold=json.loads((S/'Incoming-roadmap.json').read_text());nodes={n['id']:n for n in p['nodes']}
packets,documents,definitions=blueprints.load_promoted(R)
keep=[x for x in packets if x[0]!=RID];documents[RID]=FILES[2]
def assemble(candidate,definition):
 build.load_promoted=lambda *args:(copy.deepcopy(keep+[(RID,candidate)]),copy.deepcopy(documents),copy.deepcopy([d for d in definitions if d.get('id')!=RID]+[definition]))
 return build.assemble(require_distances=False)[0]
a=assemble(p,rd);b=assemble(old,rold)
world={}
for folder in ['data/decompositions','data/blueprints','research/blueprint/packets']:
 for file in sorted((R/folder).glob('*.json')):
  for n in json.loads(file.read_text()).get('nodes',[]):world.setdefault(n['id'],n)
world.update(nodes)
listedstageids={x['id'] for x in a['stages']}
stageids=listedstageids|set(check_blueprint.world()[1])
se={(e['source'],e['target']) for e in a['stageEdges']}
before_edges={(e['source'],e['target'])for e in b['stageEdges']}
added=se-before_edges
expected=set()
assert added==expected and not(before_edges-se),{'added':sorted(added),'removed':sorted(before_edges-se)}
assert all(s in nodes and t in nodes and nodes[s].get('planet')and nodes[t].get('planet')for s,t in added)
assert all(e['kind']=='blueprint'for e in a['stageEdges']if(e['source'],e['target'])in added)
assert [e for e in a['stageEdges']if(e['source'],e['target'])not in added]==b['stageEdges']
def dag(vertices,edges):
 vertices=set(vertices)|{v for e in edges for v in e}
 following=collections.defaultdict(set);indeg={v:0 for v in vertices}
 for s,t in edges:
  if t not in following[s]:following[s].add(t);indeg[t]+=1
 todo=[v for v,k in indeg.items() if k==0];count=0
 while todo:
  v=todo.pop();count+=1
  for w in following[v]:
   indeg[w]-=1
   if indeg[w]==0:todo.append(w)
 assert count==len(vertices),[v for v,k in indeg.items() if k][:10]
 return {'vertices':len(vertices),'edges':len(edges),'acyclic':True}
ownedges={(d,nid) for nid,n in nodes.items() for d in n['prerequisites'] if d in nodes}
todo=list(nodes);seen=set();de=set();unresolved=set();baseref=set()
while todo:
 nid=todo.pop()
 if nid in seen:continue
 seen.add(nid)
 for d in world[nid].get('prerequisites',[]):
  if d.startswith(('mathlib:','tauceti:')) and d not in stageids:baseref.add(d);continue
  de.add((d,nid))
  if d in world:todo.append(d)
  elif d not in stageids:unresolved.add(d)
assert not unresolved,unresolved
de|={(world[nid]['parentStageId'],nid) for nid in seen if world[nid].get('parentStageId')}
de|={(q['supplier'],v) for q in p['requests'] for v in q.get('neededBy',[]) if v in nodes or v in stageids}
out=collections.defaultdict(set)
for s,t in se:out[s].add(t)
def reachable(source,target):
 todo=[source];seen=set()
 while todo:
  v=todo.pop()
  if v==target:return True
  if v not in seen:seen.add(v);todo.extend(out[v])
 return False
def stageof(v):
 checked=set()
 while v in world and v not in checked:checked.add(v);v=world[v].get('parentStageId')
 return v
pairs={(d,s['id']) for s in a['stages'] if s['id'].startswith(RID+':') for d in s.get('requires',[])}
pairs|={(d,stageof(nid)) for nid,n in nodes.items() for d in n['prerequisites'] if d in stageids and d not in world and d!=stageof(nid)}
pairs|={(stageof(q['supplier']),stageof(v)) for q in p['requests'] for v in q['neededBy'] if stageof(q['supplier'])!=stageof(v)}
rspairs=set()
for file in (R/'research/blueprint/restructure').glob('*.result.json'):
 q=json.loads(file.read_text())
 if q.get('review',{}).get('status')!='accepted':continue
 rspairs|={(x['source'],x['target']) for x in q.get('links',[]) if x.get('source') in stageids and x.get('target') in stageids}
assert all(reachable(s,t) for s,t in pairs),sorted((s,t) for s,t in pairs if not reachable(s,t))
missing_restructures=sorted((s,t) for s,t in rspairs if not reachable(s,t))
assert not any(s.startswith(RID+':') or t.startswith(RID+':') for s,t in missing_restructures),missing_restructures
# All inherited edges remain identical; added edges join existing owned planets only.
ar={r['id']:r for r in a['roadmaps']};br={r['id']:r for r in b['roadmaps']}
assert ar[RID]['blueprint']['declarations']==len(nodes)
assert not ar[RID]['blueprint']['skippedLinks'] and not ar[RID].get('pendingLinks',[])
def skips(r):return r.get('blueprint',{}).get('skippedLinks',[]),r.get('pendingLinks',[])
assert all(skips(ar[x])==skips(br[x]) for x in br if x!=RID)
assert {k:v for k,v in ar.items() if k!=RID}=={k:v for k,v in br.items() if k!=RID}
assert {x['id']:x for x in a['stages'] if not x['id'].startswith(RID+':')}=={x['id']:x for x in b['stages'] if not x['id'].startswith(RID+':')}
summary={'stageDAG':dag(listedstageids,se),'ownDeclarationDAG':dag(nodes,ownedges),'scopedDAG':dag(listedstageids|seen,se|de),'reachableDeclarations':len(seen),'externalDeclarations':sorted(seen-set(nodes)),'baselineLeaves':len(baseref),'requiredPairs':len(pairs),'restructurePairs':len(rspairs),'ownRestructurePairs':sum(s.startswith(RID+':') or t.startswith(RID+':') for s,t in rspairs),'otherPreexistingUnreachableRestructurePairs':len(missing_restructures),'otherUnreachableRestructurePairListSha256':hashlib.sha256(json.dumps(missing_restructures).encode()).hexdigest(),'unresolved':sorted(unresolved),'ownSkippedLinks':[],'ownPendingLinks':[],'otherSkipsMatch':True,'stageEdgesUnchanged':True,'inheritedStageEdgeObjectsUnchanged':True,'newInternalPlanetEdges':sorted(added)}

summary['worldCommit']=immutable_view.BASE
summary['foreignRoadmapsAndStagesUnchanged']=True
summary['immutableInputHashes']={path:hashlib.sha256(immutable_view.blob(path)).hexdigest() for path in sorted(immutable_view.READS)}
print(json.dumps(summary,indent=2))
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
BASE = os.environ.get('ROOTS_VALIDATE_BASE', (Path(__file__).resolve().parent/'publication-base.txt').read_text().strip())
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
    return blob(key).decode(encoding or 'utf-8', errors or 'strict')

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
    return io.BytesIO(blob(key)) if mode == 'rb' else io.StringIO(blob(key).decode(encoding or 'utf-8', errors or 'strict'))

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
"""Serial pinned Lean replay; use only an existing build, never Lake setup."""
from pathlib import Path
import os,sys,subprocess,json
out=Path(sys.argv[1]).resolve();mathlib=Path(sys.argv[2]).resolve();lean=Path(sys.argv[3]).resolve()
name=sys.argv[4];assert name in {'Native.lean','Canonical.lean','Published.lean','AdmittedTyping.lean','Prototype.lean','Sketch.lean','Context.lean'}
pin='082e2d37e8b0463410cdb532e111cd43d5a66174'
assert subprocess.check_output(['git','rev-parse','HEAD'],cwd=mathlib,text=True).strip()==pin
assert not subprocess.check_output(['git','status','--porcelain','--untracked-files=no'],cwd=mathlib,text=True).strip()
assert (mathlib/'lean-toolchain').read_text().strip()=='leanprover/lean4:v4.34.0-rc2'
version=subprocess.check_output([str(lean),'--version'],text=True).strip()
assert '4.34.0-rc2' in version and '6a10ac8c22beadecabdbb0919c2b50214762f91d' in version,version
libs=[mathlib/'.lake/build/lib/lean'];assert libs[0].is_dir()
packages=[];omitted=[]
for item in json.loads((mathlib/'lake-manifest.json').read_text())['packages']:
 package=mathlib.parent/item['name'];lib=package/'.lake/build/lib/lean'
 if not lib.is_dir():
  assert item['name']=='Cli',item['name']
  omitted.append('Cli: no compiled library directory; not in either checked import cone')
  continue
 assert subprocess.check_output(['git','rev-parse','HEAD'],cwd=package,text=True).strip()==item['rev'],item['name']
 libs.append(lib);packages.append(item['name'])
free=subprocess.check_output(['free','-g'],text=True)
available=int(free.splitlines()[1].split()[-1])
print(json.dumps({'preflight':'serial existing pinned build','availableGiB':available,'packages':packages,'omitted':omitted,'leanVersion':version}),flush=True)
if available<20:print('Memory guard refused compilation.',flush=True);sys.exit(75)
env=os.environ.copy();env['LEAN_PATH']=os.pathsep.join(str(p) for p in libs+[out])
extra=['-o',str(out/'Context.olean')]if name=='Context.lean'else[]
result=subprocess.run(['/usr/bin/time','-v','timeout','1200',str(lean),'-j','1','-M','8192']+extra+[str(out/name)],env=env,cwd=out)
sys.exit(result.returncode)
```

## Script: runcheck.py

```python
"""Serial checked replay with bounded diagnostics and apply_patch receipt writes."""
from pathlib import Path
import subprocess,sys,hashlib,json,re,time
S=Path(sys.argv[1]).resolve();name=sys.argv[4];prefix=name[:-5]
start=time.monotonic()
r=subprocess.run([sys.executable,str(S/'compile.py')]+sys.argv[1:],text=True,stdout=subprocess.PIPE,stderr=subprocess.STDOUT)
raw=r.stdout
log=raw.replace(str(S),'<SCRATCH>').replace(sys.argv[2],'<MATHLIB>').replace(sys.argv[3],'<LEAN>')
def put(n,t):
 p=S/n
 if p.exists():
  old=p.read_text()
  if old==t:return
  diff='*** Update File: '+str(p)+'\n@@\n'+''.join('-'+x+'\n' for x in old.splitlines())
 else:diff='*** Add File: '+str(p)+'\n'
 patch='*** Begin Patch\n'+diff+''.join('+'+x+'\n' for x in t.splitlines())+'*** End Patch\n'
 subprocess.run(['apply_patch'],input=patch,text=True,check=True,stdout=subprocess.DEVNULL)
 assert p.read_text()==t,n
pre=json.loads(raw.splitlines()[0]);assert pre['availableGiB']>=20
rss=re.search(r'Maximum resident set size \(kbytes\): (\d+)',raw)
record={'sourceSha256':hashlib.sha256((S/name).read_bytes()).hexdigest(),'logSha256':hashlib.sha256(log.encode()).hexdigest(),'availableGiBBefore':pre['availableGiB'],'elapsedSeconds':round(time.monotonic()-start,2),'maxRssKiB':int(rss[1]) if rss else None,'exitStatus':r.returncode,'errors':raw.count('error:' )+raw.count('error('),'warnings':raw.count('warning:'),'admissionWarnings':raw.count('warning: declaration uses'),'axiomAudits':raw.count('depends on axioms'),'sorryAxReferences':raw.count('sorryAx'),'leanVersion':pre['leanVersion']}
put(prefix+'.log',log);put(prefix+'.receipt.json',json.dumps(record,indent=2)+'\n')
print(json.dumps(record,indent=2))
if r.returncode or record['warnings']!=record['admissionWarnings']:
 print('\n'.join(x for x in log.splitlines() if 'error' in x or 'warning' in x))
sys.exit(r.returncode)
```

## Script: package.py

```python
"""Archive only named job evidence in an inert comment; write final public recovery."""
from pathlib import Path
import base64,hashlib,json,re,sys,zlib
S=Path(sys.argv[1]).resolve();R=Path.cwd();mode=sys.argv[2]
STEM='FunctionFieldArithmeticPartII'
suggested=R/'research/blueprint/suggested'/(STEM+'.lean')
sha=lambda b:hashlib.sha256(b).hexdigest()
NAMES='''Incoming-roadmap.json Incoming.json IncomingReader.md Incoming.lean IncomingHandoff.md IncomingManifest.json IncomingReceipt.json
IncomingPublicationVerification-replayed.json IncomingMathematicalVerification-replayed.json NativePrefix.lean CanonicalPrefix.lean SketchPrefix.lean NewImports.lean
Native.lean Native.log Native.receipt.json Canonical.lean Sketch.lean Sketch.log Sketch.receipt.json
NewProofs.lean NewTests.lean NewAdmitted.lean Audits.lean Candidate-roadmap.json Candidate.json Reader.md ReaderAddition.md Suggested.lean Handoff.md HandoffBase.md
ClaimReceipt.json Reading.json SourceReading.json BaselineReading.json OwnReadingReuse.json OwnContractGuard.json OwnPreviousReading.json OwnPreviousInputGuard.json OwnPreviousManifest.json OwnPreviousCandidate.json OwnInheritedManifest.json OwnInheritedReading.json OwnInheritedInputGuard.json OwnInheritedReadingReceipt.json OwnOriginal6036Reading.json OwnPreviousRecovery.json Stacks-04V8.html Stacks-01JO.html LibrarySearch.json TauProbe.json
InputGuard.json PublicationChanges.json Plan.json NewNodes.json NewTests.json PreviousRecovery.json Verification-mathematical.json Verification.json
TouchingLinks.json Graph.json base.txt publication-base.txt Context.lean Context.log Context.receipt.json Prototype.lean Prototype.log Prototype.receipt.json
assemble.py author.py projection.py write_handoff.py verify.py graph.py immutable_view.py compile.py runcheck.py package.py'''.split()
if mode=='archive':
 meta={n:dict(sha256=sha((S/n).read_bytes()),bytes=len((S/n).read_bytes()),lines=len((S/n).read_bytes().splitlines()))for n in NAMES}
 mb=(json.dumps(meta,indent=2,sort_keys=True)+'\n').encode();(S/'artifact-manifest.json').write_bytes(mb)
 payload={n:dict(sha256=sha((S/n).read_bytes()),data=base64.b64encode(zlib.compress((S/n).read_bytes(),9)).decode())for n in NAMES+['artifact-manifest.json']}
 pb=(json.dumps(payload,sort_keys=True,separators=(',',':'))+'\n').encode();(S/'payload.json').write_bytes(pb)
 report=dict(artifacts=len(NAMES),helpers=sum(n.endswith('.py')for n in NAMES),manifestSha256=sha(mb),payloadSha256=sha(pb))
 (S/'package.json').write_text(json.dumps(report,indent=2)+'\n')
 suggested.write_bytes((S/'Suggested.lean').read_bytes()+b'\n/- BEGIN ARCHIVED THREE-STEP NORMALIZATION PULLBACK PAYLOAD\n'+pb+b'END ARCHIVED THREE-STEP NORMALIZATION PULLBACK PAYLOAD -/\n')
 print(json.dumps(report,indent=2))
elif mode=='final':
 archive=sys.argv[3];assert re.fullmatch('[0-9a-f]{40}',archive)
 p=json.loads((S/'package.json').read_text());expected={k:sha((S/n).read_bytes())for k,n in [('roadmaps','Candidate-roadmap.json'),('packets','Candidate.json'),('readmes','Reader.md'),('suggested','Suggested.lean')]}
 code='''"""Recover public authenticated three-step normalization pullback evidence; never executes Lean."""
from pathlib import Path
import base64,hashlib,json,re,sys,urllib.request,zlib
S=Path(sys.argv[1]).resolve();S.mkdir(parents=True,exist_ok=True)
HEAD=sys.argv[2];assert re.fullmatch('[0-9a-f]{40}',HEAD)
ROOT='https://raw.githubusercontent.com/CBirkbeck/tauceti-explorer/'
RID='FunctionFieldArithmeticPartII'
ARCHIVE=__ARCHIVE__
MANIFEST_SHA=__MANIFEST__
PAYLOAD_SHA=__PAYLOAD__
EXPECTED=__EXPECTED__
sha=lambda b:hashlib.sha256(b).hexdigest()
def fetch(ref,path):
 with urllib.request.urlopen(ROOT+ref+'/'+path,timeout=30)as r:return r.read()
raw=fetch(ARCHIVE,'research/blueprint/suggested/'+RID+'.lean').decode()
pb=raw.split('/- BEGIN ARCHIVED THREE-STEP NORMALIZATION PULLBACK PAYLOAD\\n',1)[1].split('END ARCHIVED THREE-STEP NORMALIZATION PULLBACK PAYLOAD -/',1)[0].encode()
assert sha(pb)==PAYLOAD_SHA
payload=json.loads(pb)
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
for folder,ext,name in [('roadmaps','json','Candidate-roadmap.json'),('packets','json','Candidate.json'),('readmes','md','Reader.md'),('suggested','lean','Suggested.lean'),('handoff','md','PublicHandoff.md')]:
 path='research/blueprint/'+folder+'/'+('DESIGN-'if folder=='handoff'else'')+RID+'.'+ext
 b=fetch(HEAD,path)
 if folder in EXPECTED:assert sha(b)==EXPECTED[folder]and b==(S/name).read_bytes(),path
 (S/name).write_bytes(b);public[path]=sha(b)
(S/(RID+'.json')).write_bytes((S/'Candidate.json').read_bytes())
fence=chr(96)*3;handoff=(S/'PublicHandoff.md').read_text()
assert handoff.startswith((S/'HandoffBase.md').read_text())
code=handoff.split('## Script: recover.py\\n\\n'+fence+'python\\n',1)[1].split('\\n'+fence+'\\n',1)[0]+'\\n'
assert code==Path(__file__).read_text(),'Executed recovery script differs from public handoff.'
for helper in meta:
 if helper.endswith('.py'):
  embedded=handoff.split('## Script: '+helper+'\\n\\n'+fence+'python\\n',1)[1].split('\\n'+fence+'\\n',1)[0]+'\\n'
  assert embedded.encode()==(S/helper).read_bytes(),helper

(S/'recover.py').write_text(code)
receipt=dict(head=HEAD,archive=ARCHIVE,artifactsVerified=len(meta),archivedHelpersVerified=sum(n.endswith('.py')for n in meta),publicDeliverables=public,recoverySha256=sha(code.encode()),LeanExecuted=False)
(S/'public-recovery.json').write_text(json.dumps(receipt,indent=2)+'\\n');print(json.dumps(receipt,indent=2))
'''
 for key,val in [('__ARCHIVE__',archive),('__MANIFEST__',p['manifestSha256']),('__PAYLOAD__',p['payloadSha256']),('__EXPECTED__',expected)]:code=code.replace(key,repr(val))
 compile(code,'recover.py','exec');(S/'recover.py').write_text(code)
 prose=f'''
## Public recovery and replay

Archive commit `{archive}` is an ancestor changing only this issue's suggested file. Its {p['artifacts']} inert artifacts include all {p['helpers']} authoring, projection, handoff, package, verification, graph and compilation helpers. Manifest SHA256 `{p['manifestSha256']}`; payload SHA256 `{p['payloadSha256']}`. The final suggested file has no archive payload and equals the entire Tau-dependent Canonical.lean, which remains UNCOMPILED.

Save the Python fence below as recover.py and run `python3 recover.py REPLAY_DIR FULL_PR_HEAD_SHA`. It fetches the immutable public archive and five final deliverables, authenticates every hash, size and line count, binds this handoff's mathematical prefix and checks its own code against the public handoff. Inspect the recovered helpers. From an existing repository checkout containing both recorded bases, run `PYTHONDONTWRITEBYTECODE=1 python3 REPLAY_DIR/verify.py REPLAY_DIR DECLARATION_INDEX`. Use the exact prescribed declarations.tsv and place REPLAY_DIR outside the checkout. Its output should equal Verification.json. Set ROOTS_VALIDATE_BASE to the mathematical base to reproduce Verification-mathematical.json. The verifier executes the actual immutable checker, intake and atlas assembler without executing Lean or creating a repository snapshot. It checks the final public handoff as well as all archived artifacts.

Serial proof replay with an existing exact Mathlib build: `python3 REPLAY_DIR/runcheck.py REPLAY_DIR MATHLIB_CHECKOUT LEAN_BINARY Native.lean`, followed by the corresponding Sketch.lean command only after completion. The runner checks pins, tracked cleanliness, compiled dependencies, compiler version, memory≥20GiB and timeout. Canonical.lean and Suggested.lean are byte-equal, but neither whole file was compiled: no existing complete Tau build at the pin is available. The two bounded Mathlib checks certify only their recorded import cones. Recorded diagnostic hashes authenticate the original runs; timing and resource statistics vary on replay.

Actual public HTTP recovery and both immutable verifier reports at the final head are checked before opening the PR. Disposable scratch is removed after submission; this handoff contains all recovery references.

## Script: recover.py

'''
 text=(S/'HandoffBase.md').read_text()+prose+'```python\n'+code+'```\n'
 (S/'PublicHandoff.md').write_text(text)
 (R/'research/blueprint/handoff'/('DESIGN-'+STEM+'.md')).write_text(text)
 suggested.write_bytes((S/'Suggested.lean').read_bytes())
 print(json.dumps(dict(archive=archive,recoverySha256=sha(code.encode()),finalHandoffSha256=sha(text.encode())),indent=2))
else:raise ValueError(mode)
```

## Public recovery and replay

Archive commit `5af6a8d2c6d9546ccc3dab272699ebe08aef88d5` is an ancestor changing only this issue's suggested file. Its 79 inert artifacts include all 10 authoring, projection, handoff, package, verification, graph and compilation helpers. Manifest SHA256 `23c81eb43ec04c384f6534c0f526270691ed7d1163f2207eeb0802e7b64f7af3`; payload SHA256 `f7a3ae3633c0965065cac5f9307883948d2e8b7e108c48b47571d8dd5cf70915`. The final suggested file has no archive payload and equals the entire Tau-dependent Canonical.lean, which remains UNCOMPILED.

Save the Python fence below as recover.py and run `python3 recover.py REPLAY_DIR FULL_PR_HEAD_SHA`. It fetches the immutable public archive and five final deliverables, authenticates every hash, size and line count, binds this handoff's mathematical prefix and checks its own code against the public handoff. Inspect the recovered helpers. From an existing repository checkout containing both recorded bases, run `PYTHONDONTWRITEBYTECODE=1 python3 REPLAY_DIR/verify.py REPLAY_DIR DECLARATION_INDEX`. Use the exact prescribed declarations.tsv and place REPLAY_DIR outside the checkout. Its output should equal Verification.json. Set ROOTS_VALIDATE_BASE to the mathematical base to reproduce Verification-mathematical.json. The verifier executes the actual immutable checker, intake and atlas assembler without executing Lean or creating a repository snapshot. It checks the final public handoff as well as all archived artifacts.

Serial proof replay with an existing exact Mathlib build: `python3 REPLAY_DIR/runcheck.py REPLAY_DIR MATHLIB_CHECKOUT LEAN_BINARY Native.lean`, followed by the corresponding Sketch.lean command only after completion. The runner checks pins, tracked cleanliness, compiled dependencies, compiler version, memory≥20GiB and timeout. Canonical.lean and Suggested.lean are byte-equal, but neither whole file was compiled: no existing complete Tau build at the pin is available. The two bounded Mathlib checks certify only their recorded import cones. Recorded diagnostic hashes authenticate the original runs; timing and resource statistics vary on replay.

Actual public HTTP recovery and both immutable verifier reports at the final head are checked before opening the PR. Disposable scratch is removed after submission; this handoff contains all recovery references.

## Script: recover.py

```python
"""Recover public authenticated three-step normalization pullback evidence; never executes Lean."""
from pathlib import Path
import base64,hashlib,json,re,sys,urllib.request,zlib
S=Path(sys.argv[1]).resolve();S.mkdir(parents=True,exist_ok=True)
HEAD=sys.argv[2];assert re.fullmatch('[0-9a-f]{40}',HEAD)
ROOT='https://raw.githubusercontent.com/CBirkbeck/tauceti-explorer/'
RID='FunctionFieldArithmeticPartII'
ARCHIVE='5af6a8d2c6d9546ccc3dab272699ebe08aef88d5'
MANIFEST_SHA='23c81eb43ec04c384f6534c0f526270691ed7d1163f2207eeb0802e7b64f7af3'
PAYLOAD_SHA='f7a3ae3633c0965065cac5f9307883948d2e8b7e108c48b47571d8dd5cf70915'
EXPECTED={'roadmaps': '9790e0a62e05671abbbecef78d2e4d56a462af3b2407fd840b2130803b539543', 'packets': '9b24d43753bdd118bb47d6e29c373147a61f1d91812bc292f8081207810812cb', 'readmes': 'd35662f4548d0bd568df21efccdf1879fb6fdc48f59303fb011362dee0c69642', 'suggested': '3c7a9dc5a7bdd8fcea02e29e5856d01aaedadd5d26e957170e4ed9eba36287de'}
sha=lambda b:hashlib.sha256(b).hexdigest()
def fetch(ref,path):
 with urllib.request.urlopen(ROOT+ref+'/'+path,timeout=30)as r:return r.read()
raw=fetch(ARCHIVE,'research/blueprint/suggested/'+RID+'.lean').decode()
pb=raw.split('/- BEGIN ARCHIVED THREE-STEP NORMALIZATION PULLBACK PAYLOAD\n',1)[1].split('END ARCHIVED THREE-STEP NORMALIZATION PULLBACK PAYLOAD -/',1)[0].encode()
assert sha(pb)==PAYLOAD_SHA
payload=json.loads(pb)
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
for folder,ext,name in [('roadmaps','json','Candidate-roadmap.json'),('packets','json','Candidate.json'),('readmes','md','Reader.md'),('suggested','lean','Suggested.lean'),('handoff','md','PublicHandoff.md')]:
 path='research/blueprint/'+folder+'/'+('DESIGN-'if folder=='handoff'else'')+RID+'.'+ext
 b=fetch(HEAD,path)
 if folder in EXPECTED:assert sha(b)==EXPECTED[folder]and b==(S/name).read_bytes(),path
 (S/name).write_bytes(b);public[path]=sha(b)
(S/(RID+'.json')).write_bytes((S/'Candidate.json').read_bytes())
fence=chr(96)*3;handoff=(S/'PublicHandoff.md').read_text()
assert handoff.startswith((S/'HandoffBase.md').read_text())
code=handoff.split('## Script: recover.py\n\n'+fence+'python\n',1)[1].split('\n'+fence+'\n',1)[0]+'\n'
assert code==Path(__file__).read_text(),'Executed recovery script differs from public handoff.'
for helper in meta:
 if helper.endswith('.py'):
  embedded=handoff.split('## Script: '+helper+'\n\n'+fence+'python\n',1)[1].split('\n'+fence+'\n',1)[0]+'\n'
  assert embedded.encode()==(S/helper).read_bytes(),helper

(S/'recover.py').write_text(code)
receipt=dict(head=HEAD,archive=ARCHIVE,artifactsVerified=len(meta),archivedHelpersVerified=sum(n.endswith('.py')for n in meta),publicDeliverables=public,recoverySha256=sha(code.encode()),LeanExecuted=False)
(S/'public-recovery.json').write_text(json.dumps(receipt,indent=2)+'\n');print(json.dumps(receipt,indent=2))
```
