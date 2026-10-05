# BP-DirichletPadicLFunctions--L2: All Dirichlet characters

Codex / codex-7e92bd, issue #5880. Winning claim5989797471 was confirmed by bot5989799599, then the whole issue was reread. This is a continuation of the same worker's split packet, not an independent review.

The planning pass is complete. L2 is planned with two precise supplier gaps, and is not closed. It contains252 unchecked nodes:248 inherited mathematical contracts retained whole and four additions. Every stated stage target has an explicit target-map route. The obsolete frontier pointing next to logarithmic coefficients is removed because that work belongs to L3.

The additions prove the native tame/wild product has its product conductor, identify the primitive Euler value at p, assemble primitive integral interpolation, and state uniqueness from positive ordinary moments. The last uses a new request for PMIA L2 to separate native O-valued unit measures by all positive moments. Its existing L3 theorem concerns Z_p-valued measures only. The earlier PMIA L3 canonical coefficient-field character evaluator request remains open; the consuming signatures still retain the explicit evaluator and its concrete test equality.

The standalone reader and suggested file are supplied. All248 inherited node statements, hypotheses, proofs, prerequisites, API entries, tests and planet records are unchanged. Counts are21 definitions/constructions,162 API records (132 on definitions/constructions),543 tests (89 on definitions/constructions),360 distinct named declaration/API signatures,543 typed examples, six planets,326 baseline records, two requests and two gaps. All three source findings and all inherited sourceVersions are unchanged. The historical combined-packet checks are retained under an explicitly historical key, not presented as current split validation.

The version-of-record source, RJW physical PDF40–48 / printed139–147, all of §§5.1–5.2, was freshly read at SHA25678d0479b4b7e3f03d2f9c9a75a772ebd75b58091a3b4f8a1558869b8283b44a6. Existing E11/E12/E13 record the smoothing scalar, alternating sign and Gauss normalization corrections. No new source issue, novelty claim or independent verdict is supplied. Three new native declaration statements were read at the pinned Mathlib commit; all126 cited native source files were authenticated. The323 inherited statement-read records and other historical source readings remain attributed to their own earlier sessions. This pass does not claim to have freshly reread every inherited node or every source in the combined bibliography.

The full final suggested module was **NOT COMPILED**. The L1 split supplier prototype is absent and the current supplier module closure has no matching existing compiled artifacts. WORKERS.md prohibits creating a new library build. No new build, cache download, Lake setup or Lean server was run. The projected L2 signatures import their L0/L1/PMIA owners and do not duplicate supplier carriers.

Two bounded files were checked serially in the existing pinned Mathlib build. PrimitiveProbe.lean proves the actual native coprime-product conductor theorem with zero errors, warnings or placeholders. PrimitiveSignatures.lean contains exactly the two new primitive-character signatures and four examples; it compiles with zero errors and six expected admission warnings. Its initial level-one example exposed a level type mismatch; the corrected final file is the one authenticated by Typing.json. Neither bounded check includes the new measure-valued interpolation or uniqueness signature. The bounded import cone authenticates1402 pinned Mathlib source modules. Compiler version is4.34.0-rc2, commit6a10ac8c22beadecabdbb0919c2b50214762f91d. Both processes ended normally.

The252 exact finite assertions cover29 pairs of primitive characters of coprime levels, the inflated-modulus counterexample, Bernoulli values2/3,−2,46, the eight low-degree Euler-deletion identities and the even-moment nonuniqueness control. They are finite checks, not a construction of measures or a proof of coefficient-general separation.

The indexed blueprint checker reports zero errors and warnings. Source-issue/version checks, actual four-deliverable intake checks, declaration/API/test coverage and whole-node preservation pass. The immutable atlas comparison has no unresolved references, no cycles, no missing accepted restructure paths, and unchanged sibling and foreign roadmap payloads. Exact graph counts and the publication guard are in Verification.json. The original mathematical base is7c28ebbdd216a82f1bef9a8b797779c521467c66. The public recovery helper binds the final deliverables, archived scripts, exact compiler receipts, source hashes, target map, input guard, graph and verifier output.

Retain only the handoff-linked evidence after opening the PR; remove the downloaded PDF and extracted source text. The independent reviewer should particularly assess the primitive-conductor normalization and the exact generic separation contract. The two supplier requests are the remaining work, with their exact consumers named in the packet.

## Script: extend.py

```python
from pathlib import Path
import copy,json
S=Path(__file__).resolve().parent;p=json.loads((S/'Incoming.json').read_text());sid='DirichletPadicLFunctions:L2'
save=lambda name,x:(S/name).write_text(json.dumps(x,ensure_ascii=False,indent=2)+'\n')
source={'sourceId':'RJW-published','locator':'Theorem 5.7 and Remark 5.8, printed 143 / physical PDF 44; proof, Lemmas 5.9–5.12 and Definition 5.13, printed 144–146 / physical PDF 45–47. Version of record freshly read 5 October 2026.','excerpt':'unique measure','match':'Worker decomposition of the primitive-conductor and uniqueness clauses. The integral construction and common-field moment identity are inherited nodes. The primitive-product conductor argument is derived from the pinned native conductor inequalities. Coefficient-general positive-moment separation is requested from its existing PMIA owner, not asserted to follow from the narrower Z_p-coefficient theorem.'}
h=['p is a prime, including 2; D>1, n≥0, and p∤D. Put M=p^n and N=DM. E is a characteristic-zero field with Algebra Q E. The native characters η:DirichletCharacter E D and χ:DirichletCharacter E M are primitive at their stated levels. Let θ=η.changeLevel(D∣N)·χ.changeLevel(M∣N). All values at integers use the native zero extension at the specified level. D and M are coprime.']
new=[]
def add(slug,title,statement,hyp,proof,deps,decl,tests=None,kind='lemma'):
 n={'id':sid+'/'+slug,'parentStageId':sid,'realises':[sid],'title':title,'kind':kind,'statement':statement,'hypotheses':hyp,'proofSteps':proof,'prerequisites':deps,'acceptance':['Keep the actual native characters and measure carriers, all coefficient embeddings, and the positive-degree restriction. No implementation or supplier completion is asserted.'],'library':{'module':'TauCeti/NumberTheory/DirichletPadic/PrimitiveInterpolation','namespace':'DirichletPadic','declaration':'DirichletPadic.'+decl},'sources':[copy.deepcopy(source)],'implementationStatus':'unchecked'}
 if tests:n['tests']=[{'name':'SuggestedPrimitiveInterpolationTests.'+name,'kind':k,'statement':s}for name,k,s in tests]
 new.append(n)
add('tame-wild-product-primitive','Primitivity of the tame and wild product',
 'The native product-level character θ has conductor N, hence is primitive.',h,
 ['Write α=changeLevel η and β=changeLevel χ at level N. Native conductor_changeLevel and the two primitive hypotheses give cond(α)=D and cond(β)=M.',
  'Set c=cond(αβ). Apply conductor_mul_dvd_lcm_conductor to (αβ,β⁻¹), simplify (αβ)β⁻¹=α, and use conductor_inv. This gives D∣lcm(c,M), hence D∣cM. Coprimality gives D∣c. Apply the same argument to ((αβ),α⁻¹) to get M∣c.',
  'Coprimality implies DM∣c. The native conductor_dvd_level gives c∣DM, so equality follows. This proof uses no unsupported equality for arbitrary products of characters with intersecting conductors.'],
 ['mathlib:DirichletCharacter.IsPrimitive','mathlib:DirichletCharacter.conductor_changeLevel','mathlib:DirichletCharacter.conductor_inv','mathlib:DirichletCharacter.conductor_mul_dvd_lcm_conductor','mathlib:DirichletCharacter.conductor_dvd_level'],
 'tameWildProduct_isPrimitive',[
 ('quadratic_product_conductor','computation','For primitive quadratic characters of levels 3 and 4, the product at level 12 has conductor 12.'),
 ('zero_level_product','degenerate','For n=0 the primitive level-one character gives conductor D for the product.'),
 ('overlapping_conductors_fail','non-example','The square of the nontrivial quadratic character modulo 3 has conductor 1, not 9 or 3.')])
add('primitive-tame-wild-euler-value','The primitive Euler value at p',
 'At the primitive conductor of θ, θ.primitiveCharacter(p)=η(p)χ(p). It is η(p) when n=0 and zero when n≥1. Thus the factor is 1−η(p)p^(k−1) in the trivial wild case and 1 in positive primitive wild conductor.',h,
 ['The preceding conductor equality says θ already has its primitive level. changeLevel_primitiveCharacter, specialized to that level equality, identifies its primitive character pointwise with θ; no evaluation at a nonunit is transported across a genuine enlargement of level.',
  'For n=0, the native modulus-one character is identically 1 and the level D product is η. For n≥1, p is a nonunit modulo p^n and N, so native character zero extension makes both χ(p) and θ(p) zero.',
  'The level-positive principal character is not primitive and is outside these hypotheses. For p=2 and η quadratic modulo 3, the induced character at level 6 has value zero at 2, whereas its primitive character at level 3 has value −1. This prevents replacing primitive-conductor evaluation by an arbitrary chosen modulus.'],
 [sid+'/tame-wild-product-primitive',sid+'/prime-power-character','mathlib:DirichletCharacter.changeLevel_primitiveCharacter','mathlib:MulChar.map_nonunit'],
 'tameWildProduct_primitive_eval_prime',[
 ('principal_inflation_changes_euler_value','non-example','For η quadratic modulo 3 inflated to level 6, the level-6 value at 2 is 0 while the primitive-conductor value is −1.')])
hk=h+['K is a complete nontrivially normed ultrametric characteristic-zero field, with Algebra Z_p K, IsBoundedSMul Z_p K and Algebra Q K. Fix field homomorphisms ιC:E→C and ιK:E→K. The image of D is a unit. Let O be the existing norm-valuation integer subring of K, ζO,U the existing intrinsicIntegralTameZetaMeasure for ηK=η.ringHomComp ιK, and κO_(n,χK,k) the existing integralPrimePowerArithmeticCharacter.']
add('primitive-integral-interpolation','Primitive character interpolation for the integral tame measure',
 'For k≥1 let b=(1−θ.primitiveCharacter(p)p^(k−1))·(−N^(k−1)/k)Σ_(a mod N)θ(a)B_k(a.val/N) in E. Its complex image is (1−ιC(θ.primitiveCharacter(p))p^(k−1))L(θ.ringHomComp ιC,1−k), and its K-image is the inclusion of ζO,U(κO_(n,χK,k)). In particular b has integral image in K. The Euler value is computed at the primitive conductor, including n=0.',hk,
 ['Primitivity of η and D>1 imply η≠1 using native conductor_one. The existing intrinsic integral common-character-value comparison applies with the same native product character and separate embeddings.',
  'The primitive-product lemma and its evaluation comparison replace only θ(p) by θ.primitiveCharacter(p) in that existing common algebraic value. No map C→K is introduced, and the finite Bernoulli expression remains at the now primitive level N.',
  'The integral-character comparison identifies the field-valued arithmetic moment with the included O-valued native measure evaluation. Membership in O follows from that inclusion. Apply the preceding Euler-value lemma for n=0 and n≥1.',
  'For an imprimitive input use the existing native conductor-change and primitive-measure comparison nodes, keeping their distinct-prime Euler factors. Do not apply this primitive theorem to an arbitrarily inflated principal character.'],
 [sid+'/tame-wild-product-primitive',sid+'/primitive-tame-wild-euler-value',sid+'/intrinsic-integral-tame-common-value','mathlib:DirichletCharacter.conductor_one'],
 'intrinsicIntegralTameZetaMeasure_primitive_interpolation',[
 ('dyadic_trivial_wild_first_value','computation','At p=2, η quadratic modulo 3, n=0 and k=1, the moment is 2/3, including the Euler factor 1−η(2)=2.'),
 ('quadratic_wild_weight_two','computation','At p=2, η quadratic modulo 3, χ quadratic modulo 4 and k=2, the moment is −2.'),
 ('quadratic_wild_weight_four','computation','With the same primitive characters and k=4, the moment is 46.')],kind='theorem')
# Obtain actual existing node IDs from declaration metadata rather than inventing aliases.
bydecl={n['library']['declaration']:n['id']for n in p['nodes']}
for n in new:
 n['prerequisites']=[bydecl['DirichletPadic.intrinsicIntegralTameZetaMeasure_common_character_value'] if x==sid+'/intrinsic-integral-tame-common-value'else x for x in n['prerequisites']]
u='tame-integral-interpolation-unique'
add(u,'Uniqueness from positive arithmetic moments',
 'Let ν be an O-valued native measure on U=(Z_p)ˣ. If, for every k≥1, its value on κO_(0,1,k) equals that of ζO,U, then ν=ζO,U. Consequently an integral measure satisfying all primitive interpolation identities above is unique: already the trivial wild character and all positive weights determine it.',hk,
 ['Subtract ζO,U from ν in the existing O-valued measure module. The zero-level arithmetic-character formula identifies κO_(0,1,k) with u↦(algebraMap(Z_p,K)(u))^k, lifted to O through its norm bound.',
  'Apply the requested PMIA L2 separation theorem for actual O-valued unit measures and all positive ordinary moments to the difference, then cancel subtraction. The existing PMIA L3 theorem supplies only Z_p-valued measures; no coefficient-general conclusion is inferred from it.',
  'If both measures satisfy primitive interpolation, take n=0, χ=1 and each k≥1. The preceding common-field comparison and injectivity O→K give the required equalities. No degree-zero interpolation formula and no equality of arbitrary test values are assumed.'],
 [sid+'/primitive-integral-interpolation',bydecl['DirichletPadic.integralPrimePowerArithmeticCharacter'],bydecl['DirichletPadic.primePowerArithmeticCharacter_zero_level'],'PadicMeasuresIwasawaAlgebras:L2'],
 'intrinsicIntegralTameZetaMeasure_unique_positive_moments',[
 ('even_weights_insufficient','non-example','The nonzero native O-valued measure δ_1−δ_(−1) on U kills all even power tests, including for p=2; all positive degrees are required.')],kind='theorem')
need='For every prime p and complete nontrivially normed ultrametric characteristic-zero field K with Algebra Z_p K and IsBoundedSMul Z_p K, let O be its native norm-valuation integer subring and U=(Z_p)ˣ. Supply positive ordinary-moment separation on the actual AbstractMeasure U O O: a measure μ with μ(t_k)=0 for every k≥1 is zero, where t_k(u) is the canonical integral lift of (algebraMap Z_p K (u:Z_p))^k. Build the canonical scalar action on O from the given bounded embedding; do not require a separately chosen incompatible action. Include injectivity after O→K, transport to the native integral arithmetic tests, and the finite-extension case of RJW Theorem5.7. The existing L3/unit-positive-moment-separation has coefficients Z_p only, so does not discharge this request. This generic separation theorem belongs to PMIA; Dirichlet L2 uses it only to identify its already constructed arithmetic measure.'
p['requests'].append({'supplier':'PadicMeasuresIwasawaAlgebras:L2','need':need,'neededBy':[sid+'/'+u]})
p['gaps']=[g for g in p['gaps']if g['title']!='L2 remaining source decomposition and interfaces']
p['gaps'].append({'title':'Positive-moment separation for the native coefficient integer ring','detail':need,'neededBy':[sid+'/'+u]})
p['nodes']+=new
p['status']='complete';p['summary']='All Dirichlet characters: arithmetic twists, roots-of-unity and Gauss calculations, integral tame measures, primitive-conductor interpolation and uniqueness, coefficient-field descent and conductor change. The L2 planning pass is complete with two precise PMIA supplier gaps; all declarations remain unchecked.'
p['coverage']=[{'stageId':sid,'status':'planned','remaining':['Discharge the PMIA L2 positive-moment separation request on the native coefficient integer ring to complete interpolation uniqueness.','Discharge the PMIA L3 canonical coefficient-field character evaluation request for actual pseudomeasures; the existing arithmetic ratio signatures retain their explicit evaluation homomorphism.']}]
newrefs={d for n in new for d in n['prerequisites']if d.startswith('mathlib:')}-{d['ref']for d in p['baseline']['declarations']}
provides={'DirichletCharacter.IsPrimitive':'Primitivity is equality of conductor and level.','DirichletCharacter.conductor_changeLevel':'Increasing a positive character level preserves its conductor.','DirichletCharacter.conductor_mul_dvd_lcm_conductor':'The conductor of a product divides the least common multiple of the two conductors; equality is not asserted.','DirichletCharacter.changeLevel_primitiveCharacter':'Changing the native primitive character to the original level returns the original character.'}
for ref in sorted(newrefs):
 name=ref.removeprefix('mathlib:');assert name in provides,name
 p['baseline']['declarations'].append({'ref':ref,'kind':'def'if name.endswith('IsPrimitive')else'lemma','module':'Mathlib/NumberTheory/DirichletCharacter/Basic.lean','provides':provides[name],'checked':'Statement freshly read at pinned Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174, 5 October 2026; source excerpts and file hash retained.'})
p['provenance']['l2TargetCompletion']={'worker':'Codex — codex-7e92bd','issue':5880,'date':'2026-10-05','inheritedNodes':248,'newNodes':len(new),'scope':'Historical provenance entries above describe the combined same-worker packet. Current split checks replace the historical checks object. No independent review is claimed.','newReading':'RJW published physical PDF40–48, printed139–147, all of §§5.1–5.2; same authenticated digest. Inherited statement-read and source records are retained as historical own-session evidence, not a claim of freshly rereading every inherited node or all ten sources.','historicalFrontierCorrection':'The old next log-coefficient task is owned by L3. L2 now covers each stated target and stops at252 nodes with two exact supplier requests.'}
p['checks']={}
save('NewNodes.json',new);save('Candidate.json',p);save('BaselineAdditions.json',[d for d in p['baseline']['declarations']if d['ref']in newrefs]);print('nodes',len(p['nodes']),'new',len(new),'newrefs',newrefs)
```

## Script: assemble.py

```python
from pathlib import Path
import json,collections,hashlib
S=Path(__file__).resolve().parent;P=Path.cwd();STEM='DirichletPadicLFunctions--L2';p=json.loads((S/'Candidate.json').read_text())
save=lambda n,x:(S/n).write_text(json.dumps(x,ensure_ascii=False,indent=2)+'\n')
imports=[];bodies=[]
for name in ['InheritedProjection.lean','Primitive.lean']:
 t=(S/name).read_text()
 for line in t.splitlines():
  if line.startswith('import ')and line not in imports:imports.append(line)
 bodies.append('\n'.join(line for line in t.splitlines()if not line.startswith('import ')))
lean=('\n'.join(imports)+'\n\n'+'\n\n'.join(bodies)).rstrip()+'\n';(S/'Suggested.lean').write_text(lean)
counts={'nodes':len(p['nodes']),'inherited':248,'new':4,'kinds':dict(collections.Counter(n['kind']for n in p['nodes'])),'API':sum(len(n.get('api',[]))for n in p['nodes']),'tests':sum(len(n.get('tests',[]))for n in p['nodes']),'definitionConstructionTests':sum(len(n.get('tests',[]))for n in p['nodes']if n['kind']in ['definition','construction']),'planets':sum(bool(n.get('planet'))for n in p['nodes']),'baseline':len(p['baseline']['declarations']),'gaps':len(p['gaps']),'requests':len(p['requests'])};save('Counts.json',counts)
rows=[
 ('Actual p-power twists and roots-of-unity calculations',[0,3,4,6,7,89,90,91,92,101,102,103,104,106,119,120,121,122],'The native locally constant character weights the existing smoothed measure. Positive wild levels have unit support. Finite Fourier and resolvent identities produce the formal kernel and common special values; generic weighting, restriction and Amice transforms come from PMIA.'),
 ('Integral tame measure and its Gauss normalization',[8,10,12,14,17,18,19,21,23,28,30,40,46,135,143,243,244,245,246,247],'Finite polynomial denominator clearing constructs the bounded coefficients without pretending that a geometric series in 1+T converges T-adically. Actual primitive Gauss norm-one and integer-ring unit certificates discharge the normalization hypotheses.'),
 ('Primitive positive-weight interpolation',[52,53,54,55,56,57,58,147,248,249,250],'The primitive product has conductor Dp^n. Its value at p is evaluated at that conductor. A single algebraic Bernoulli element has separate complex and p-adic images, and the p-adic image is the inclusion of the actual integral unit-measure value.'),
 ('Uniqueness in Theorem 5.7',[251],'Already the trivial wild character and every positive ordinary weight determine the integral measure. This uses the precise coefficient-general separation request to PMIA L2, recorded as a gap; its existing Z_p-valued theorem is narrower.'),
 ('Trivial characters and tame conductor one',[5,37,119,123,132,133,148,150],'The n=0 test is the trivial character on the whole p-adic integers; positive-level principal tests are unit projectors. The D=1 tame constructor is zero and is not the principal zeta pseudomeasure. The principal zeta family is imported from L1 and its canonical coefficient-field evaluator remains the existing PMIA L3 request.'),
 ('Coefficient extension and descent',[166,167,168,169,174,179,180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,195,206,207,208,209,210],'Native character fields, complete-field embeddings, the norm-valuation integer ring, and field-valued and integral measure comparisons are retained. Joint fields contain the tame and wild values; arbitrary complex numbers are never transported to a p-adic field.'),
 ('Conductor change and primitive/imprimitive comparison',[211,212,213,214,215,216,219,225,226,227,228,229,230,231,232,233,234,235,236,237,238,239,240,241,242],'Increasing tame level inserts one Euler deletion for each new prime, with coefficients of the inducing character. Integral versions retain integral coefficients and actual pushforwards. Inflated principal wild characters are handled by their native level formulas, not the primitive theorem.')]
targets=[dict(target=a,nodes=[p['nodes'][i]['id']for i in ids],boundary=b)for a,ids,b in rows];save('TargetMap.json',targets)
intro='''# All Dirichlet characters

This layer constructs character twists of arithmetic p-adic measures, the integral tame zeta measure, and its primitive-character interpolation. It includes the finite roots-of-unity calculations, Gauss normalization, the field generated by the character values, and exact conductor-change formulas. Generic measure operators and coefficient integration belong to PadicMeasuresIwasawaAlgebras; analytic branches and logarithmic special values belong to Dirichlet L3 and its suppliers.

## Conventions and objects

Fix any prime p, including 2, and put Z=ℤ_p and U=Zˣ with their native topologies. Measures use the native continuous-linear-functional carrier. For a complete ultrametric coefficient field K use its norm-valuation integer subring O. Integral measures take values in O, with an explicit inclusion into K. A separately chosen scalar action on O is never silently identified with the one induced by Z→K.

A Dirichlet character retains its level and the native zero extension at nonunits. A level-one character is identically 1. A principal character at a positive p-power level is instead the indicator of p-adic units when pulled back to Z. The corresponding twists agree on U, but their ambient measures and their L-functions at the chosen levels require the recorded support and Euler comparisons.

For D>1 prime to p and a primitive tame character η of conductor D, set Y=1+T. The finite numerator Qη satisfies TQη=−Σ_(a mod D)η(a)Y^a. Dividing by q_D=(Y^D−1)/T uses its unit constant D; it gives Fη=Qη/q_D and (1−Y^D)Fη=Ση(a)Y^a. The coefficients are bounded by 1. Mahler inversion produces the actual integral measure μη, whose field-valued moments are the finite Bernoulli expression −D^k/(k+1)Ση(a)B_(k+1)(a/D).

The primitive Gauss formula is a second description of this same series. Its denominator is G(η⁻¹), not the inverse of G(η). Expanding a factor 1/(ε^a(1+T)−1) introduces (−1)^k in its kth coefficient. The native finite Fourier argument proves that the relevant primitive tame Gauss scalar has norm 1 and therefore gives an actual unit of O. It does not apply a finite-field Gauss identity at an arbitrary composite modulus.

The relation ψμη=η(p)μη gives the unit restriction Euler factor. Weighting the unit restriction by the inverse coordinate defines ζη; its integral version and its intrinsic measure on U are compared through actual extension by zero and restriction. The positive shift says ζη(χx^k)=(unitRestriction(weight(χ)μη))(x^(k−1)) for k≥1. It makes no assertion about a degree-zero special value.

## Primitive interpolation

Take primitive χ of conductor p^n, n≥0, and η as above. Their native product at level N=Dp^n is primitive. To prove this, raise both characters to level N, call their conductors D and p^n, and apply the native conductor bound to the product times each inverse factor. Coprimality forces both conductors to divide the product conductor. The reverse divisibility is the native conductor-divides-level theorem.

Consequently the Euler value at p equals η(p) when n=0 and is 0 when n≥1. This is an evaluation at the primitive conductor. For comparison, the quadratic character modulo 3 inflated to level 6 has value 0 at 2, whereas its primitive character has value −1 there. An arbitrary larger modulus would therefore produce the wrong explicit Euler factor if paired with the primitive L-function.

For k≥1 define, in a common characteristic-zero field E containing the character values,

b=(1−θ.primitiveCharacter(p)p^(k−1))·(−N^(k−1)/k)Σ_(a mod N)θ(a)B_k(a/N).

The separate embeddings E→ℂ and E→K identify its images with the Euler-corrected complex L-value and the included integral moment ζη(χx^k), respectively. This is the meaning of equality with an L-value in the p-adic formula; it requires no map from ℂ to K. At p=2 with η quadratic modulo 3, the trivial wild character has first moment 2/3. For the primitive quadratic χ modulo 4, the second and fourth moments are −2 and 46.

Uniqueness uses every positive ordinary degree with the trivial wild character. Subtract two alleged integral realizations and apply the coefficient-general positive-moment separation contract of PMIA L2. The existing PMIA L3 statement concerns Z-valued measures and does not establish this O-valued conclusion. No hypothesis equating all continuous-test values is substituted for the interpolation hypothesis. The example δ_1−δ_(−1) kills every even degree but is nonzero, also at p=2.

## Fields and conductor change

The coefficient field generated by η's values is constructed as a native intermediate field. Its algebraicity, finite dimension, completeness and compatible embeddings support descent of the field-valued measure and of its integral realization. For twisted arithmetic values the joint field includes χ's values as well. Scalar-extension equalities are evaluated on actual continuous tests with the specified compatible coefficient maps.

Increasing a tame level inserts exactly one deletion factor for each new prime. At a unit arithmetic test χx^w the factor for q is 1−η(q)χ(q)q^w/q. The primitive comparison uses the inducing primitive character's value η₀(q), not the inflated character's zero at q. Integral comparisons retain actual integral coefficients and pushforwards and do not divide by q inside an unrelated ring.

Tame conductor one has a separate principal zeta construction in L1. The finite tame numerator at D=1 is zero, so its measure must not be relabelled as the principal pseudomeasure. The existing character-evaluation signatures for principal pseudomeasures retain an explicit ring homomorphism and its test-evaluation equality until PMIA supplies the requested canonical coefficient-field map.

## Target map

'''
for row in targets:intro+='### '+row['target']+'\n\n'+row['boundary']+'\n\n'+', '.join(row['nodes'])+'.\n\n'
intro+='## Open supplier boundaries\n\nThe L2 stage is planned and this planning pass is complete, with two precise gaps. Neither planning status nor the bounded Lean checks assert that the layer is implemented or closed.\n\n'
for r in p['requests']:intro+='### '+r['supplier']+'\n\n'+r['need']+'\n\nConsumers: '+', '.join(r['neededBy'])+'.\n\n'
intro+='''## Sources and validation boundary

The source is Rodrigues Jacinto–Williams, [*An introduction to p-adic L-functions*](https://msp.org/ent/2025/4-1/p03.xhtml), version of record, §§5.1–5.2, Theorems 5.1 and 5.7 and their supporting calculations. The published physical PDF pages 40–48, printed pages 139–147, were freshly read for this pass against SHA256 78d0479b4b7e3f03d2f9c9a75a772ebd75b58091a3b4f8a1558869b8283b44a6. The inherited source findings E11, E12 and E13 retain the missing smoothing scalar, alternating sign and Gauss-normalization corrections. They are existing own-session records, not newly discovered or independently reviewed findings. The historical source-version records and baseline statement readings remain attributed to their earlier passes.

Every inherited mathematical node, API item and test is retained. Four declarations complete the target map. The reader catalogue and split suggested file name every declaration, API item and test. The full suggested file is uncompiled because required split supplier prototypes and matching compiled modules are unavailable. A separate native conductor proof compiles without placeholders, errors or warnings; a separate file containing the two primitive-product signatures and four examples compiles with six expected admission warnings. Neither check compiles the measure-valued interpolation or uniqueness signatures. Exact finite character and Bernoulli controls accompany the retained evidence.

## Declaration catalogue

'''
for n in p['nodes']:
 intro+='### '+n['title']+'\n\n'+n['id']+'\n\nDeclaration: '+n['library']['declaration']+'\n\nKind: '+n['kind']+'. Implementation: unchecked.\n\n'+n['statement']+'\n\n'
 for key,label in [('hypotheses','Hypotheses'),('proofSteps','Construction or proof outline'),('prerequisites','Prerequisites'),('acceptance','Acceptance')]:
  if n.get(key):intro+='**'+label+'**\n\n'+'\n'.join('- '+x for x in n[key])+'\n\n'
 for key,label in [('api','API'),('tests','Tests')]:
  if n.get(key):intro+='**'+label+'**\n\n'+'\n'.join('- '+x['name']+': '+x['statement']for x in n[key])+'\n\n'
 for key,label in [('uses','Uses'),('sources','Sources')]:
  if n.get(key):intro+='**'+label+'**\n\n'+'\n'.join('- '+(x['where']+': '+x['how']if key=='uses'else x['sourceId']+', '+x['locator']+'. '+x.get('match',''))for x in n[key])+'\n\n'
reader=intro.rstrip()+'\n';(S/'Reader.md').write_text(reader)
p['checks']={'inheritedCombinedHistory':{'scope':'Historical own-session combined-packet checks, not checks of the current L2 split.','record':json.loads((S/'Incoming.json').read_text())['checks']},'currentL2':{'counts':counts,'allImplementationUnchecked':True,'inheritedNodesPreservedWhole':248,'fullSuggestedCompiled':False,'typing':json.loads((S/'Typing.json').read_text()),'finiteControls':json.loads((S/'Finite.json').read_text()),'sourceReading':'Published §§5.1–5.2 freshly read at the recorded digest; three inherited source issues retained unchanged.','baseline':'326 native records;323 inherited own-session statement reads retained,3 new statements freshly read. All126 cited source files authenticated at the pin.','closure':'Two precisely requested PMIA inputs remain; stage planned, not closed.'}}
save('Candidate.json',p);save(STEM+'.json',p)
for folder,ext,name in [('packets','json','Candidate.json'),('readmes','md','Reader.md'),('suggested','lean','Suggested.lean')]:
 (P/'research/blueprint'/folder/(STEM+'.'+ext)).write_bytes((S/name).read_bytes())
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
names={n['library']['declaration']for n in p['nodes']}|{a['name']if '.'in a['name']else n['library']['namespace']+'.'+a['name']for n in p['nodes']for a in n.get('api',[])}
found={c['name']for c in commands if c['name']}
missing=sorted(names-found);dups={n:v for n,v in collections.Counter(c['name']for c in commands if c['name']).items()if v>1}
(S/(prefix+'LeanCommands.json')).write_text(json.dumps(commands,indent=2)+'\n')
(S/(prefix+'LeanIndexReport.json')).write_text(json.dumps({'wanted':len(names),'found':len(found),'missing':missing,'duplicates':dups},indent=2)+'\n')
print(json.dumps({'commands':len(commands),'wanted':len(names),'missing':missing[:50],'duplicateCount':len(dups)},indent=2))
```

## Script: project.py

```python
"""Project exact inherited L2 commands and tests; import sibling prototype owners."""
from pathlib import Path
import collections,hashlib,json,re,sys
S=Path(sys.argv[1]);t=(S/'SplitSuggested.lean').read_text();p=json.loads((S/'Incoming.json').read_text());cs=json.loads((S/'LeanCommands.json').read_text())
names={n['library']['declaration']for n in p['nodes']}
for n in p['nodes']:
 for a in n.get('api',[]):names.add(a['name']if '.'in a['name']else n['library']['namespace']+'.'+a['name'])
blocked=set()
names-=blocked
tests={x['name']for n in p['nodes']for x in n.get('tests',[])}
for i,c in enumerate(cs):
 c['index']=i
 if c['kind']=='instance'and c['name']and c['name'].endswith('.:'):c['name']=None
 if c['kind']=='example':
  previous=i-1
  if previous>=0 and cs[previous]['kind']=='include':previous-=1
  prior=t[cs[previous]['end']if previous>=0 else 0:c['start']]
  comments=re.findall(r'^\s*--\s*([\w.]+)',prior,re.M)
  ns='.'.join(c['namespaces']);tag=comments[-1]if comments else ''
  choices=[tag,ns+'.'+tag,(ns+'.'+tag).removeprefix('DirichletPadic.')]
  c['test']=next((x for x in choices if x in tests),None)
found={c['name']for c in cs if c['name']in names};foundtests={c.get('test')for c in cs if c.get('test')}
missingnames=sorted(names-found);missingtests=sorted(tests-foundtests)
if missingnames or missingtests:
 print(json.dumps({'missingNames':missingnames,'missingTests':missingtests},indent=2));raise SystemExit(1)
root={'children':[],'start':None,'end':None};stack=[root]
declkinds={'def','theorem','lemma','abbrev','structure','class','instance','example'}
for c in cs:
 if c['kind']in ['namespace','section']:
  node={'start':c,'end':None,'children':[]};stack[-1]['children'].append(node);stack.append(node)
 elif c['kind']=='end':stack.pop()['end']=c
 else:stack[-1]['children'].append(c)
def active(node):
 if 'children'in node:return any(active(x)for x in node['children'])
 return node['name']in names or bool(node.get('test'))
kept=[]
def render(node):
 if 'children'not in node:
  if node['kind']in declkinds and node['name']not in names and not node.get('test')and node['kind']!='instance':return ''
  if node['kind']=='import':return ''
  kept.append(node['index'])
  prefix='-- '+node['test']+'\n'if node.get('test')else ''
  return prefix+t[node['start']:node['end']].rstrip()+'\n\n'
 if not active(node):return ''
 out=''
 if node['start']:
  c=node['start'];kept.append(c['index']);out+=t[c['start']:c['end']].rstrip()+'\n'
 for child in node['children']:out+=render(child)
 if node['end']:
  c=node['end'];kept.append(c['index']);out+=t[c['start']:c['end']].rstrip()+'\n\n'
 return out
body=render(root)
imports='\n'.join(t[c['start']:c['end']]for c in cs if c['kind']=='import' and not t[c['start']:c['end']].startswith('import TauCeti.'))+'\n'
imports+='import research.blueprint.suggested.«DirichletPadicLFunctions--L0»\nimport research.blueprint.suggested.«DirichletPadicLFunctions--L1»\n'
note='\n/-!\n# Dirichlet L2: All Dirichlet characters\n\nThis file is not the roadmap and is not exhaustive. The roadmap document is\ndefinitive. These signatures and examples suggest names and types for review;\nall implementation statuses remain unchecked.\n\nThe inherited L2 declarations are projected from the combined source.\nL0 and L1 arithmetic prototypes and PMIA are imported from their owners.\nThe L1 split module and matching compiled supplier modules are unavailable.\nThe full split file is NOT COMPILED; any separate checks in the handoff\ncertify only the identified bounded files. No supplier object is replaced.\n-/\n'
out=(imports+note+body).rstrip()+'\n'
(S/'InheritedProjection.lean').write_text(out)
report={'inheritedSha256':hashlib.sha256(t.encode()).hexdigest(),'selectedCommandIndices':kept,'declarationAndAPINames':sorted(names),'testNames':sorted(tests),'ownedNodes':len(p['nodes']),'unstatableInheritedNames':sorted(blocked),'namedSignatures':len(names),'testCount':len(tests),'exampleCount':len(re.findall(r'^[ \t]*example\b',out,re.M)),'lines':len(out.splitlines()),'sha256':hashlib.sha256(out.encode()).hexdigest(),'compiled':False,'plannedSiblingImports':['L0','L1'],'unavailableSiblingFiles':['L1']}
(S/'Projection.json').write_text(json.dumps(report,indent=2)+'\n')
print(json.dumps({k:v for k,v in report.items()if k not in ['selectedCommandIndices','declarationAndAPINames','testNames']},indent=2))
```

## Script: verify.py

```python
"""Replay immutable L2 checks and authenticate retained evidence; never execute Lean."""
from pathlib import Path
import ast,hashlib,json,os,re,subprocess,sys
S=Path(sys.argv[1]).resolve();R=Path.cwd();STEM='DirichletPadicLFunctions--L2';SID='DirichletPadicLFunctions:L2';sha=lambda b:hashlib.sha256(b).hexdigest();data=lambda n:json.loads((S/n).read_text());txt=lambda n:(S/n).read_text()
BASE=os.environ.get('ROOT_ACTION_VALIDATE_BASE',txt('publication-base.txt').strip());MATH=txt('base.txt').strip();blob=lambda ref,path:subprocess.check_output(['git','show',ref+':'+path],cwd=R)
p=data('Candidate.json');old=data('Incoming.json');assert p['nodes'][:248]==old['nodes'];assert p['nodes'][248:]==data('NewNodes.json');assert len(p['nodes'])==252
assert p['status']=='complete'and p['coverage'][0]['status']=='planned'and len(p['requests'])==len(p['gaps'])==2
assert p['sourceIssues']==old['sourceIssues']and p['sourceVersions']==old['sourceVersions']
assert p['baseline']['declarations'][:323]==old['baseline']['declarations'];assert p['baseline']['declarations'][323:]==data('BaselineAdditions.json')
assert p['checks']['inheritedCombinedHistory']['record']==old['checks'];assert p['checks']['currentL2']['counts']==data('Counts.json')
assert all(n['implementationStatus']=='unchecked'for n in p['nodes'])
for n in p['nodes']:
 assert n['id']in txt('Reader.md')and n['statement']in txt('Reader.md')
 if n['kind']in ['definition','construction']:assert len(n['api'])>=3 and len(n['tests'])>=3 and n['uses']
 for a in n.get('api',[])+n.get('tests',[]):assert a['name']in txt('Reader.md')and a['statement']in txt('Reader.md')
assert sum(bool(n.get('planet'))for n in p['nodes'])==6
for row in data('InputGuard.json'):
 assert sha(blob(MATH,row['path']))==row['sha256']==sha(blob(BASE,row['path'])),row['path']
 if row.get('artifact'):assert sha((S/row['artifact']).read_bytes())==row['sha256']
assert data('PublicationChanges.json')==[]
claim=data('ClaimReceipt.json');assert claim['claimComment']==5989797471 and claim['confirmationComment']==5989799599 and claim['rereadAfterConfirmation']
assert sha(data('IssueAfter.json')['body'].encode())==claim['bodySha256']==sha(data('IssuePublication.json')['body'].encode())
regenerated=['LeanCommands.json','LeanIndexReport.json','InheritedProjection.lean','Projection.json','FinalLeanCommands.json','FinalLeanIndexReport.json']
before={n:(S/n).read_bytes()for n in regenerated}
for script,args in [('index_lean.py',['SplitSuggested.lean','Incoming.json']),('project.py',[]),('index_lean.py',['Suggested.lean','Candidate.json','Final'])]:
 subprocess.run([sys.executable,str(S/script),str(S)]+args,check=True,capture_output=True)
for n,b in before.items():assert (S/n).read_bytes()==b,n
assert data('LeanIndexReport.json')['missing']==data('FinalLeanIndexReport.json')['missing']==[]
assert not data('FinalLeanIndexReport.json')['duplicates']and data('FinalLeanIndexReport.json')['found']==360
projection=data('Projection.json');assert projection['ownedNodes']==248 and projection['namedSignatures']==356 and projection['testCount']==projection['exampleCount']==535 and not projection['compiled']
imports=[];body=[]
for name in ['InheritedProjection.lean','Primitive.lean']:
 t=txt(name);body.append('\n'.join(x for x in t.splitlines()if not x.startswith('import ')))
 for x in t.splitlines():
  if x.startswith('import ')and x not in imports:imports.append(x)
assert ('\n'.join(imports)+'\n\n'+'\n\n'.join(body)).rstrip()+'\n'==txt('Suggested.lean')
assert len(re.findall(r'^\s*example\b',txt('Suggested.lean'),re.M))==543
for n in p['nodes'][248:]:
 for test in n.get('tests',[]):assert '-- '+test['name'].rsplit('.',1)[-1]+'\n'in txt('Primitive.lean')
primitive=txt('Primitive.lean');expected='import Mathlib.NumberTheory.DirichletCharacter.Basic\nnamespace DirichletPadic\nnoncomputable section\n'+primitive[primitive.index('section PrimitiveProduct'):primitive.index('end PrimitiveProduct')+len('end PrimitiveProduct')]+'\nnamespace SuggestedPrimitiveInterpolationTests\n'+primitive[primitive.index('section CharacterTests'):primitive.index('end CharacterTests')+len('end CharacterTests')]+'\nend SuggestedPrimitiveInterpolationTests\nend\nend DirichletPadic\n'
assert txt('PrimitiveSignatures.lean')==expected
assert 'sorry'not in txt('PrimitiveProbe.lean')and'axiom'not in txt('PrimitiveProbe.lean')
assert data('ProbeSourceAudit.json')['count']==1402
for row in data('Typing.json')['checks']:
 assert sha((S/row['source']).read_bytes())==row['sha256'];log=txt(row['log']);assert sha(log.encode())==row['logSha256']
 assert row['exitCode']==row['errors']==0 and 'Exit status: 0'in log and 'error:'not in log and 'error('not in log
 assert log.count('warning: declaration uses `sorry`')==row['sorryWarnings']
finite=subprocess.check_output([sys.executable,str(S/'finite.py')],text=True);assert finite==txt('Finite.json');assert data('Finite.json')['exactAssertions']==252
assert data('BaselineAudit.json')['records']==326 and len(data('BaselineAudit.json')['modules'])==126
assert data('SourceAcquisition.json')['read']and data('SourceAcquisition.json')['sha256']=='78d0479b4b7e3f03d2f9c9a75a772ebd75b58091a3b4f8a1558869b8283b44a6'
if(S/'artifact-manifest.json').exists():
 for name,m in data('artifact-manifest.json').items():
  b=(S/name).read_bytes();assert sha(b)==m['sha256']and len(b)==m['bytes']and len(b.splitlines())==m['lines'],name
paths=['research/blueprint/'+f+'/'+('BP-'if f=='handoff'else'')+STEM+'.'+e for f,e in [('packets','json'),('readmes','md'),('suggested','lean'),('handoff','md')]]
contents={path:txt(name)for path,name in zip(paths,['Candidate.json','Reader.md','Suggested.lean','PublicHandoff.md'if(S/'PublicHandoff.md').exists()else'Handoff.md'])}
for path,t in contents.items():assert t.endswith('\n')and not re.search(r'/(?:home|tmp|Users)/|file'+'://|[ \t]+$',t,re.M),path
assert blob(MATH,paths[0])==(S/'Incoming.json').read_bytes()==blob(BASE,paths[0])
os.environ['ROOT_ACTION_VALIDATE_BASE']=BASE;sys.path.insert(0,str(S));import immutable_view
for path,t in contents.items():immutable_view.TRACKED.add(path);immutable_view.CACHE[path]=t.encode()
immutable_view.install();sys.path.insert(0,str(R/'scripts'));import check_blueprint,source_issues,check_errata
assert sha(Path(sys.argv[2]).read_bytes())=='86649a7d5f35d1178a45fe7aa4713741d03d43ff3b37bb8c91a1da1c794c8ce1'
index=check_blueprint.load_index(Path(sys.argv[2]));assert index[0]is not None
errors,warnings,summary=check_blueprint.check(S/(STEM+'.json'),index,check_blueprint.world());assert not errors and not warnings,(errors,warnings);summary['packet']=paths[0]
issues=source_issues.check_issues(p['sourceIssues'],'DirichletPadicLFunctions')+check_errata.versions_checked(p,p['sourceIssues']);assert not issues,issues
mod=ast.parse((R/'research/blueprint/intake.py').read_text());wanted={'file_problems','auto_refusals','own_files','independent_of'}
parts=[n for n in mod.body if isinstance(n,ast.Assign)and any(isinstance(t,ast.Name)and t.id in {'ALLOWED','PRIVATE'}for t in n.targets)or isinstance(n,ast.FunctionDef)and n.name in wanted]
env={'json':json,'re':re};exec(compile(ast.Module(body=parts,type_ignores=[]),'actual-intake','exec'),env)
job=next(j for j in json.loads((R/'research/blueprint/queue.json').read_text())['jobs']if j['id']=='BP-'+STEM)
problems=[x for f in paths for x in env['file_problems'](f,contents[f])];refusals=env['auto_refusals'](job,paths,False,{'codex-7e92bd'},set());assert not problems and not refusals,(problems,refusals)
graph=json.loads(subprocess.check_output([sys.executable,str(S/'graph.py'),str(S)],cwd=R,text=True,env={**os.environ,'ROOT_ACTION_VALIDATE_BASE':BASE}));assert graph['worldCommit']==BASE
print(json.dumps({'checker':summary,'warnings':warnings,'sourceIssueErrors':issues,'intakeProblems':problems,'intakeRefusals':refusals,'preservedWholeNodes':248,'newNodes':4,'counts':data('Counts.json'),'projection':{k:v for k,v in projection.items()if k not in ['selectedCommandIndices','declarationAndAPINames','testNames']},'finalNamedSignatures':360,'finalExamples':543,'boundedTyping':data('Typing.json'),'finiteControls':data('Finite.json'),'inputGuards':len(data('InputGuard.json')),'mathematicalBase':MATH,'immutableBase':BASE,'graph':graph,'fullSuggestedCompiled':False,'LeanExecutedByVerifier':False},ensure_ascii=False,indent=2))
```

## Script: graph.py

```python
from pathlib import Path
import sys,json,collections,copy
R=Path.cwd(); S=Path(sys.argv[1]);RID='DirichletPadicLFunctions';STEM=RID+'--L2';SID=RID+':L2'
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
 if q.get('review',{}).get('status')=='accepted':pairs|={(e['source'],e['target']) for e in q.get('links',[]) if SID in [e.get('source'),e.get('target')]}
upstream=sorted((x,y) for x,y in pairs if x.startswith('UPSTREAM:') or y.startswith('UPSTREAM:'))
missing=sorted((x,y) for x,y in pairs if (x,y) not in upstream and not reachable(x,y))
assert not missing,missing
ar={r['id']:r for r in a['roadmaps']};br={r['id']:r for r in b['roadmaps']}
def skips(r):return r.get('blueprint',{}).get('skippedLinks',[]),r.get('pendingLinks',[])
assert all(skips(ar[x])==skips(br[x]) for x in br)
result={'stageDAG':dag(stages,se),'ownDAG':dag(nodes,{(d,n) for n in nodes for d in nodes[n]['prerequisites'] if d in nodes}),'scopedDAG':dag(stages|seen,se|deps),'reachableDeclarations':len(seen),'baselineLeaves':len(leaves),'unresolved':sorted(unresolved),'restructurePairs':len(pairs),'undrawnUpstreamContracts':upstream,'missingDrawnPaths':missing,'stageEdgesUnchanged':True,'allSkipsMatchControl':True,'ownAssembly':ar[RID].get('blueprint')}
assert {x:r for x,r in ar.items()if x!=RID}=={x:r for x,r in br.items()if x!=RID}
assert {s['id']:s for s in a['stages']if s.get('owner')!=RID}=={s['id']:s for s in b['stages']if s.get('owner')!=RID}
assert {s['id']:s for s in a['stages']if s['id']!=SID}=={s['id']:s for s in b['stages']if s['id']!=SID}
result['siblingStagesUnchanged']=True
result['inheritedMissingRequestStagePaths']=sorted({(r['supplier'],SID)for r in p.get('requests',[])if not reachable(r['supplier'],SID)})
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

## Script: runcheck.py

```python
"""Serial pinned Lean replay; use only an existing build, never Lake setup."""
from pathlib import Path
import os,sys,subprocess,json
out=Path(sys.argv[1]).resolve();mathlib=Path(sys.argv[2]).resolve();lean=Path(sys.argv[3]).resolve()
name=sys.argv[4];assert name in {'Native.lean','Canonical.lean','Published.lean','AdmittedTyping.lean','Prototype.lean','Sketch.lean','Context.lean','Obstruction.lean','PrimitiveProbe.lean','PrimitiveSignatures.lean'}
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

## Script: audit.py

```python
from pathlib import Path
import hashlib,json,re,subprocess,sys
S=Path(__file__).resolve().parent;repo=Path(sys.argv[1]);math=Path(sys.argv[2]);build=Path(sys.argv[3]);p=json.loads((S/'Candidate.json').read_text());old=json.loads((S/'Incoming.json').read_text());pin=p['baseline']['mathlib'];sha=lambda b:hashlib.sha256(b).hexdigest()
save=lambda n,x:(S/n).write_text(json.dumps(x,ensure_ascii=False,indent=2)+'\n')
assert subprocess.check_output(['git','rev-parse','HEAD'],cwd=math,text=True).strip()==pin
files={}
for d in p['baseline']['declarations']:
 assert d['ref'].startswith('mathlib:');path=d['module'];b=(math/path).read_bytes();assert b==subprocess.check_output(['git','show',pin+':'+path],cwd=math)
 files[path]=sha(b)
refs=[d['ref']for d in p['baseline']['declarations']];assert len(refs)==len(set(refs))
save('BaselineAudit.json',{'pin':pin,'records':len(refs),'modules':files,'inheritedStatementReadClaims':{'records':len(old['baseline']['declarations']),'status':'Retained unchanged own-session statement-read records; the present pass freshly authenticates file bytes, not a fresh reading of every statement.'},'freshStatementReads':[d['ref']for d in json.loads((S/'BaselineAdditions.json').read_text())]+['mathlib:DirichletCharacter.conductor_inv','mathlib:DirichletCharacter.conductor_dvd_level','mathlib:DirichletCharacter.changeLevel_primitiveCharacter','mathlib:DirichletCharacter.conductor_one']})
# Authenticate the import cone of the two bounded compiler files; no build.
seen={};todo=['Mathlib.NumberTheory.DirichletCharacter.Basic']
while todo:
 mod=todo.pop()
 if mod in seen:continue
 path=mod.replace('.','/')+'.lean';f=math/path
 if not f.is_file():continue
 b=f.read_bytes();assert b==(build/path).read_bytes()
 assert (build/'.lake/build/lib/lean'/mod.replace('.','/')).with_suffix('.olean').is_file(),mod
 seen[mod]=sha(b)
 todo += re.findall(r'^(?:public |private )?import\s+([\w.]+)',b.decode(),re.M)
save('ProbeSourceAudit.json',{'mathlib':pin,'sourceModules':seen,'count':len(seen),'sourceBytesMatchPinnedBuild':True,'existingOle anFiles'.replace(' ',''):True})
for name in ['PrimitiveProbe','PrimitiveSignatures','PrimitiveSignatures-failed']:
 log=(S/(name+'.log')).read_text();log=log.replace(str(S)+'/','EVIDENCE/').replace(str(Path(sys.argv[4])),'LEAN')
 (S/(name+'.public.log')).write_text(log)
rows=[]
for name,warnings in [('PrimitiveProbe',0),('PrimitiveSignatures',6)]:
 log=(S/(name+'.public.log')).read_text();assert 'error'in log or 'Exit status: 0'in log
 assert 'error:'not in log and 'error('not in log
 assert log.count('warning: declaration uses `sorry`')==warnings
 rows.append({'source':name+'.lean','sha256':sha((S/(name+'.lean')).read_bytes()),'log':name+'.public.log','logSha256':sha(log.encode()),'exitCode':0,'errors':0,'sorryWarnings':warnings,'otherWarnings':0,'scope':'Actual native conductor proof without placeholders.'if warnings==0 else'Two primitive-product signatures and four examples only; excludes measure-valued interpolation and uniqueness signatures.'})
save('Typing.json',{'checks':rows,'fullSuggestedCompiled':False,'reason':'The L1 split prototype module is absent, and no matching compiled current supplier modules were found. No library build is allowed by WORKERS.md.','compiler':'Lean 4.34.0-rc2 / 6a10ac8c22beadecabdbb0919c2b50214762f91d','sourceModules':len(seen)})
# Bind the fresh supplier statements used at the two remaining boundaries.
supplier=json.loads((repo/'research/blueprint/packets/PadicMeasuresIwasawaAlgebras.json').read_text())
ends=['/unit-positive-moment-separation','/positive-moments-constant-amice','/integral-unit-coefficient-extension','/coefficient-extension-unique','/character-integral-algebra-hom']
save('SupplierBoundary.json',[n for n in supplier['nodes']if any(n['id'].endswith(e)for e in ends)])
print(json.dumps({'baselineRecords':len(refs),'baselineModules':len(files),'probeSourceModules':len(seen),'typing':rows},indent=2))
```

## Script: finite.py

```python
from fractions import Fraction as F
from math import comb,gcd
import json
checks=0
def check(x):
 global checks
 assert x
 checks+=1
def char(N,vs):return lambda a:vs[a%N]
def conductor(N,c):
 for d in range(1,N+1):
  if N%d:continue
  fibres={};valid=True
  for a in range(N):
   if gcd(a,N)!=1:continue
   r=a%d
   if r in fibres and fibres[r]!=c(a):valid=False;break
   fibres[r]=c(a)
  if valid:return d
 raise AssertionError
cs=[(1,char(1,[1])),(3,char(3,[0,1,-1])),(4,char(4,[0,1,0,-1])),(5,char(5,[0,1,-1,-1,1])),(7,char(7,[0,1,1,-1,1,-1,-1])),(8,char(8,[0,1,0,-1,0,-1,0,1]))]
pairs=0
for N,c in cs:
 check(conductor(N,c)==N)
 for a in range(N):
  check(c(a)==0 if gcd(a,N)!=1 else abs(c(a))==1)
  for b in range(N):check(c(a*b)==c(a)*c(b))
for D,a in cs:
 for M,b in cs:
  if gcd(D,M)!=1:continue
  N=D*M;c=lambda x:a(x)*b(x)
  check(conductor(N,c)==N);pairs+=1
eta=cs[1][1];chi=cs[2][1]
check(conductor(3,lambda x:eta(x)**2)==1)
ind=lambda x:eta(x)*(1 if gcd(x,2)==1 else 0)
check(ind(2)==0);check(conductor(6,ind)==3);check(eta(2)==-1)
B=[F(1)]
for m in range(1,10):B.append(-sum(F(comb(m+1,j))*B[j]for j in range(m))/F(m+1))
def bern(n,x):return sum(F(comb(n,j))*B[j]*x**(n-j)for j in range(n+1))
def lv(N,c,k):return -F(N**(k-1),k)*sum(F(c(a))*bern(k,F(a,N))for a in range(N))
check(lv(3,eta,1)==F(1,3));check((1-eta(2))*lv(3,eta,1)==F(2,3))
check(lv(12,lambda x:eta(x)*chi(x),2)==-2)
check(lv(12,lambda x:eta(x)*chi(x),4)==46)
for k in range(1,9):
 check(lv(6,ind,k)==(1-eta(2)*2**(k-1))*lv(3,eta,k))
 check(1**(2*k)-(-1)**(2*k)==0)
check(1-(-1)==2)
print(json.dumps({'exactAssertions':checks,'coprimePrimitivePairs':pairs,'characterLevels':[x[0]for x in cs],'quadraticProductMoments':{'weight2':-2,'weight4':46},'trivialWildFirstMoment':'2/3','inflationCounterexample':{'level':6,'conductor':3,'valueAt2AtLevel':0,'valueAt2AtConductor':-1},'scope':'Exact finite conductor and Bernoulli controls, not a measure construction, separation proof, or numerical approximation.'},indent=2))
```

## Script: guard.py

```python
from pathlib import Path
import json,hashlib,subprocess
S=Path(__file__).resolve().parent;R=Path.cwd();sha=lambda b:hashlib.sha256(b).hexdigest();base=(S/'base.txt').read_text().strip();pub=subprocess.check_output(['git','rev-parse','origin/main'],text=True).strip();blob=lambda ref,path:subprocess.check_output(['git','show',ref+':'+path],cwd=R)
p=json.loads((S/'Candidate.json').read_text());nodes={n['id']for n in p['nodes']};foreign={d for n in p['nodes']for d in n['prerequisites']if '/'in d and d not in nodes and not d.startswith(('mathlib:','tauceti:'))};paths={}
for f in sorted((R/'research/blueprint/packets').glob('*.json')):
 q=json.loads(f.read_text());hits={n['id']for n in q.get('nodes',[])}&foreign
 if hits:paths[str(f.relative_to(R))]=sorted(hits)
assert set().union(*map(set,paths.values()))==foreign
old=json.loads((S/'InputGuard.json').read_text());indexed={r['path']:r for r in old}
for path,ids in paths.items():indexed[path]={'path':path,'sha256':sha(blob(base,path)),'supplierNodes':ids}
for path in ['research/blueprint/WORKERS.md','research/blueprint/PROTOCOL.md','research/expansion/PROTOCOL.md','research/blueprint/UPSTREAM_GUIDE.md','research/blueprint/detail.json']:
 indexed[path]={'path':path,'sha256':sha(blob(base,path))}
changes=[]
for path,row in indexed.items():
 before=sha(blob(base,path));after=sha(blob(pub,path));assert before==row['sha256']
 if before!=after:changes.append({'path':path,'before':before,'after':after})
issue=json.loads((S/'IssuePublication.json').read_text());claim=json.loads((S/'ClaimReceipt.json').read_text());assert issue['state']=='open'and'state:claimed'in [x['name']for x in issue['labels']];assert sha(issue['body'].encode())==claim['bodySha256']
(S/'InputGuard.json').write_text(json.dumps(list(indexed.values()),indent=2)+'\n');(S/'PublicationChanges.json').write_text(json.dumps(changes,indent=2)+'\n');(S/'publication-base.txt').write_text(pub+'\n')
print(json.dumps({'publicationBase':pub,'guardedPaths':len(indexed),'foreignNodeInputs':len(foreign),'changes':changes},indent=2))
```

## Script: package.py

```python
"""Archive the named completion evidence and bind a public recovery helper."""
from pathlib import Path
import base64,hashlib,json,re,sys,zlib
S=Path(sys.argv[1]).resolve();R=Path.cwd();mode=sys.argv[2]
STEM='DirichletPadicLFunctions--L2'
sha=lambda b:hashlib.sha256(b).hexdigest()
helpers=['extend.py','assemble.py','index_lean.py','project.py','verify.py','graph.py','immutable_view.py','runcheck.py','audit.py','finite.py','guard.py','package.py']
names="""Incoming.json SplitReader.md SplitSuggested.lean PriorHandoff.md Roadmap.json Audit.json
Candidate.json Reader.md Suggested.lean InheritedProjection.lean LeanCommands.json LeanIndexReport.json Projection.json FinalLeanCommands.json FinalLeanIndexReport.json
InputGuard.json PublicationChanges.json ClaimReceipt.json IssueAfter.json IssuePublication.json SourceAcquisition.json TargetMap.json NewNodes.json BaselineAdditions.json Counts.json
BaselineAudit.json ProbeSourceAudit.json SupplierBoundary.json Primitive.lean PrimitiveProbe.lean PrimitiveSignatures.lean Typing.json PrimitiveProbe.public.log PrimitiveSignatures.public.log PrimitiveSignatures-failed.public.log Finite.json WORKLIST.md
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
STEM='DirichletPadicLFunctions--L2'
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

Save the final Python fence as recover.py and run `python3 recover.py REPLAY_DIR FULL_PR_HEAD_SHA`. It fetches the public immutable archive and all four deliverables, authenticates every artifact and helper, and checks its own code against the public handoff. Keep REPLAY_DIR outside an existing repository checkout. Inspect the recovered helpers, then from that checkout run `PYTHONDONTWRITEBYTECODE=1 python3 REPLAY_DIR/verify.py REPLAY_DIR DECLARATION_INDEX`. Use the pinned declarations.tsv (SHA256 86649a7d5f35d1178a45fe7aa4713741d03d43ff3b37bb8c91a1da1c794c8ce1). Output must equal Verification.json. Set ROOT_ACTION_VALIDATE_BASE to the base in base.txt to reproduce MathematicalVerification.json. Both bases must exist locally. The verifier runs the actual immutable checker, source-issue/intake functions and atlas assembler, and authenticates the exact inherited source/projection without executing Lean.

The verifier authenticates all248 inherited L2 mathematical contracts, all three source findings and inherited sourceVersions, three new baseline records and four new nodes. It regenerates the inherited and final command/test indices from exact source, checks the bounded compiler receipts and reruns the exact finite controls. Both recovered verifier reports were reproduced before this PR was opened. Recovery and verification never execute Lean. The separate PrimitiveProbe.lean native conductor proof has zero errors, warnings or placeholders; PrimitiveSignatures.lean checks two primitive-character signatures and four examples with six expected admission warnings. The full split suggested file remains uncompiled, including the new measure-valued interpolation and uniqueness signatures.


## Script: recover.py

'''
 text=(S/'HandoffBase.md').read_text()+prose+'```python\n'+code+'```\n'
 (S/'PublicHandoff.md').write_text(text);handoff.write_text(text);suggested.write_bytes((S/'Suggested.lean').read_bytes())
 print(json.dumps(dict(archive=archive,recoverySha256=sha(code.encode()),finalHandoffSha256=sha(text.encode())),indent=2))
else:raise ValueError(mode)
```
