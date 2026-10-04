# BP-DirichletPadicLFunctions--L4

Agent: Codex — codex-7e92bd. Refs #5882. Claim 5983996960 was confirmed by bot comment 5983998042; the whole issue was reread after confirmation.

## Result and scope

This completes the L4 planning pass under the current breadth-before-depth rule. The packet has 192 nodes: 28 constructions, 58 lemmas, 64 theorems and 42 comparisons. It contains 169 API items, 111 construction tests (358 tests across all nodes), six planets, 180 pinned baseline declarations, five gaps and three supplier requests. L4 is planned, not closed; all implementation statuses remain unchecked.

All 182 inherited mathematical contracts, APIs and tests are unchanged. Twenty-one library-declaration metadata records are completed or namespace-qualified. Ten new nodes plan the fixed-component unit-power estimate and non-interpolation obstruction, finite principal tame Euler deletion on the actual localization, its ordinary constant, classical comparison and cleared congruences, and the primitive nontrivial-left full-family comparison. Seven baseline records are added from statements read at the pins.

The principal constant retains 2(aδ_a−1); at p=2,D=3,e=3 its value is 91/120. No principal tame zero kernel is substituted for this constant. Classical primitive-pair forms are requested from the existing ModularForms Layer 0. Character order, conductor levels, primitivity, parity and admissibility hypotheses are explicit. No generic measure algebra, Eisenstein-form owner or geometric p-adic-family theory is duplicated.

## Reading and provenance

Reading.json states the fresh and reused scopes. Current L4 stage, accepted RS-14 ownership, reviewed audit, source corrections, selected inherited contracts and exact new baseline statements were read. Published RJW physical pages 59–62 (printed 158–161) were freshly read after HTTP retrieval and hash comparison. Stein's primitive-pair and constant formulas were read online; the cited Miyake proof was not read. Existing E53/E54 findings are credited to their extraction; the two inherited L4 source findings and version records are preserved, without claiming independent review.

The original combined packet and source were authored by this worker and authenticated over HTTP during PR6099. OriginalPublicReceipt.json binds their bytes to public head 94522a22ab89f975cbf508d57515456e56f6fbb6. Their previous library/source reading remains historical evidence; this pass does not claim a fresh proof reread of every inherited node. InputGuard.json binds 119 inputs to the mathematical base. PublicationChanges.json records every changed guarded input reviewed before publication. No outside paper or book text is archived here.

## Validation and Lean boundary

The actual repository indexed packet checker reports zero errors and zero warnings. Actual source/version and intake functions accept the four named deliverables. The actual atlas assembler checks both immutable bases, preserving sibling stages and foreign roadmaps, with no new skipped links. All 12 accepted restructuring paths involving L4 are reachable. Mathematical and publication reports record exact world and dependency counts.

The suggested file contains 301 distinct typed node/API signatures and 358 examples. It preserves the inherited 288 signatures and 350 examples by scope-aware projection, retains one explicit unstatable completed-coordinate comparison comment, and appends 13 named signatures and eight examples. The final static index has no duplicate declarations. This source accounting does not prove elaboration.

Only Obstruction.lean was checked against the existing pinned Mathlib build: three theorem signatures and three examples, exit 0, zero errors, six expected sorry warnings. Typing.json binds its exact source and normalized logs, including the two failed import attempts. Before the successful serial run, available memory was 38 GiB; the command used one thread, an 8 GiB Lean cap and a 20-minute timeout. Compiler commit 6a10ac8c22beadecabdbb0919c2b50214762f91d and package commits were checked. No builds, cache downloads or language servers were started.

The full suggested file is NOT COMPILED: L1/L2 prototype files and the required exact pinned Tau artifact closure are unavailable. Principal.lean and the inherited split projection remain unelaborated. All proofs remain planning/admission placeholders; the bounded signature check is not a proof certificate. runcheck.py permits an optional serial replay only with an existing pinned build and a fresh 20 GiB memory guard; the normal verifier executes no Lean.

## Remaining work

1. Discharge the two existing PMIA requests: the actual completed-group-algebra equivalence and joint quotient projections; and the generic character-twist ring equivalence.
2. Obtain the actual primitive-pair forms and Bernoulli/Fourier translation from ModularForms Layer 0. Keep the inherited nonprincipal-right comparison conditional on its supplied classical form.
3. Finish principal finite-character evaluation using an actual coefficient-field ring map and admissible shifted denominator. Preserve L2's primitive-root and nonzero-Gauss-sum hypotheses.
4. Complete conductor-change and imprimitive Euler-factor synthesis, and the classical owner's separate weight-one and exceptional weight-two contracts.
5. Elaborate the whole split file when its owner prototypes and exact pinned native dependencies exist. Full RJW §§2–8 acceptance includes the separately owned L0–L3 layers; affinoid/Hida–Coleman geometry remains PadicFamilies work.

The standalone reader gives all node statements, hypotheses, proof outlines, APIs, tests, dependencies and uses. TargetMap.json maps every L4 target to nodes and precise open boundaries. Independent review should inspect the new finite Euler deletion and classical comparison proofs first, then the retained exceptional-weight and character gaps. This handoff records a completed planning pass, not closure or formalization.

## Reproduction

The public recovery section below binds the named evidence and exact helpers. The verifier checks the original source receipt, unchanged inherited mathematical bodies, metadata edits, new nodes, complete reader coverage, regenerated signature indices and projection, bounded typing receipt, immutable input guards, and actual repository checker/intake/atlas results. MathematicalVerification.json uses base.txt; Verification.json uses publication-base.txt. Recovered results were compared byte-for-byte before opening the PR. No source re-download or Lean execution is part of that verification.

## Script: extend.py

```python
"""Target-first continuation of the inherited L4 packet."""
from pathlib import Path
import copy,json,sys
S=Path(sys.argv[1]); p=json.loads((S/'Incoming.json').read_text())
RID='DirichletPadicLFunctions'; SID=RID+':L4'
save=lambda n,x:(S/n).write_text(json.dumps(x,ensure_ascii=False,indent=2)+'\n')
names=['positiveEisensteinMeasure','positiveEisensteinMeasure_apply','positiveEisensteinMeasure_moment','positiveEisensteinMeasure_mul_p','divisorSum_eulerDeletion','positiveEisensteinMeasure_euler_moment','positiveEisensteinMeasure_moment_congr']
for n,name in zip(p['nodes'][:7],names):n['library']['declaration']='DirichletPadic.'+name
# Normalize declaration-name metadata, without changing any mathematical contract.
for n in p['nodes']:
 if '.'not in n['library']['declaration']:n['library']['declaration']=n['library']['namespace']+'.'+n['library']['declaration']
save('InheritedNamed.json',p)
new=[]
source={'sourceId':'RJW-published','locator':'Published §8, printed159 / physicalPDF60, non-interpolation argument; complete pp.158–161 freshly read 4October2026.','excerpt':'there was indeed a measure','match':'Decomposition of the corrected argument recorded as PAPER-RODRIGUES-JACINTO-WILLIAMS-23/E53. Use the explicit sequence k+(p−1)pⁿ and uniform convergence in the continuous-test norm; include p=2 without a cyclic-unit assumption.'}
def add(slug,title,statement,hyp,proof,prereq,decl,tests=None,kind='lemma',src=None,api=None,uses=None):
 n=dict(id=SID+'/'+slug,parentStageId=SID,realises=[SID],title=title,kind=kind,statement=statement,hypotheses=hyp,proofSteps=proof,prerequisites=prereq,acceptance=['Preserve every displayed carrier, hypothesis and normalization; a conditional input is not a completed supplier proof.'],library={'module':'TauCeti/NumberTheory/DirichletPadic/EisensteinTargets','namespace':'DirichletPadic','declaration':'DirichletPadic.'+decl},sources=[copy.deepcopy(src or source)],implementationStatus='unchecked')
 if tests:n['tests']=[{'name':'SuggestedEisensteinTargetTests.'+name,'kind':k,'statement':s}for name,k,s in tests]
 if api:n['api']=[{'name':'DirichletPadic.'+name,'role':r,'statement':s}for name,r,s in api]
 if uses:n['uses']=[{'where':w,'how':h}for w,h in uses]
 new.append(n);return n
h=['p is any prime, U=(ℤ_p)ˣ with its native compact topology. For e≥0 write j_e∈C(U,ℚ_p) for u↦(u:ℚ_p)^e. All norms of tests are the native supremum norm.']
add('unit-power-totient-precision','Uniform precision of unit powers',
 'For every k,n≥0, ‖j_(k+(p−1)pⁿ)−j_k‖≤p^(−(n+1)).',h,
 ['Map each actual unit u to (ℤ/p^(n+1)ℤ)ˣ using Units.map(PadicInt.toZModPow). ZMod.pow_totient and Nat.totient_prime_pow_succ give u^((p−1)pⁿ)=1 after reduction.',
 'Multiplication by u^k shows u^(k+(p−1)pⁿ)−u^k lies in ker(toZModPow(n+1)). Rewrite this kernel as the ideal generated by p^(n+1).',
 'PadicInt.norm_le_pow_iff_mem_span_pow gives the pointwise bound; PadicInt.norm_def preserves it under ℤ_p→ℚ_p. ContinuousMap.norm_le converts the uniform pointwise bound into the supremum-norm bound. This uses no Teichmüller splitting.'],
 ['mathlib:ZMod.pow_totient','mathlib:Nat.totient_prime_pow_succ','mathlib:PadicInt.toZModPow','mathlib:PadicInt.ker_toZModPow','mathlib:PadicInt.norm_le_pow_iff_mem_span_pow','mathlib:PadicInt.norm_def','mathlib:ContinuousMap.norm_le'],
 'unitPower_totient_precision',[
 ('dyadic_uniform_precision','compatibility','For p=2, k=0, n=2, the test u↦u⁴−1 has supremum norm at most1/8.'),
 ('odd_torsion_retained','computation','At p=3,u=−1,k=0,n=2, u^18−1=0.'),
 ('wrong_component_fails','non-example','At p=3,u=−1 the sequence u^(3ⁿ) is constantly−1, and never tends to1.')])
add('unit-power-sequence-convergence','Convergence within a fixed weight component',
 'For each k≥0 the sequence j_(k+(p−1)pⁿ) tends to j_k in C(U,ℚ_p).',h,
 ['The preceding uniform bound tends to zero because p>1. Apply the metric characterization of convergence to the norm of the difference.',
 'The exponents are all congruent to k modulo p−1, tend to k in ℤ_p, and tend to infinity as natural numbers. The specified sequence handles the dyadic case as well. Mere p-adic convergence of arbitrary exponents is not substituted for the fixed-component assertion.'],
 [SID+'/unit-power-totient-precision','mathlib:tendsto_pow_atTop_nhds_zero_of_norm_lt_one'],
 'unitPower_sequence_tendsto')
add('prime-power-moments-impossible','No unit measure interpolates prime powers',
 'There is no μ∈AbstractMeasure U ℚ_p ℚ_p with μ(j_e)=(p:ℚ_p)^e for every e≥0.',h,
 ['Apply continuity of the native continuous linear functional AbstractMeasure.toCLMEquiv μ to the preceding convergence with k=0. Its values would tend to μ(1)=1.',
 'The alleged moments on the same sequence are p^((p−1)pⁿ). Since ‖p‖=p⁻¹<1 and (p−1)pⁿ tends to infinity, these values tend to0 by the native power-limit theorem.',
 'Uniqueness of limits in ℚ_p gives1=0, contradicting the field structure. Thus deletion of p-divisible divisors is essential, rather than a choice of an unavailable Dirac mass at p.'],
 [SID+'/unit-power-sequence-convergence','mathlib:AbstractMeasure.toCLMEquiv','mathlib:Padic.norm_p_lt_one','mathlib:tendsto_pow_atTop_nhds_zero_of_norm_lt_one'],
 'not_exists_primePower_moments',kind='theorem')
euler_source={'sourceId':'RJW-published','locator':'Definition8.1, Theorem8.2 and proof, published159–160 / physicalPDF60–61, freshly read4October2026; Stein equation(4) specifies the corresponding divisor coefficients.','excerpt':'taking p-stabilisations','match':'Worker-derived finite tame Euler deletion on the existing localized principal family. The new formulas are not quoted as a theorem of RJW. Classical existence uses the already owned modular-form level-raising maps; finite-character value identification remains a separately recorded gap.'}
eh=['p is any prime. Z=ℤ_p, U=Zˣ and M=AbstractMeasure U Z Z carry the existing commutative convolution algebra. For a∈U let S_a=Localization.Away(2·eisensteinTwistedDenominator(p,a)) and i_a:M→S_a be its canonical map.',
 'D>0 and p∤D. Let P be the native finite set of prime divisors of D. For T⊆P put d_T=∏ℓ∈T ℓ and let u_T∈U have underlying value d_T. Empty products are1. Every d_T is prime to p, so its native unit exists.',
 'Use E_a=eisensteinAwaySeries(p,a), A₀,a=eisensteinAwayConstant(p,a) and the existing positive coefficient measures. No principal tame kernel of L2 is identified with this localized zeta family.']
add('principal-tame-eisenstein-series','The principal tame Eisenstein family',
 'Define E_(a,D)=Σ_(T⊆P)(−1)^|T| C(i_a(δ_(u_T)))·expand_(d_T)(E_a) in the native S_a[[q]]. This finite Euler deletion retains exactly the divisors prime to pD.',eh,
 ['The native prime-factor finset has no repetition. Its subset product is positive and divides D; hence its ℤ_p image is a unit. Use that actual unit and the existing native Dirac measure, independent of its membership certificate.',
 'Apply native PowerSeries.expand at the positive integer d_T, multiply by the constant series of the indicated coefficient and sum over P.powerset. This is a finite algebraic construction on E_a; there is no convergence assumption or new completed-algebra carrier.',
 'For D=1 the powerset contains only the empty subset and δ_1 is the convolution identity, so E_(a,1)=E_a. Since the definition depends only on primeFactors(D), repeated prime factors have no additional effect.',
 'The coefficient and specialization lemmas below identify the retained divisor measures and the Euler-deleted constant. The construction uses the localized constant, which may fail integral ordinary-pseudomeasure membership.'],
 [SID+'/full-eisenstein-away-series',SID+'/eisenstein-away-constant',SID+'/positive-eisenstein-measure','PadicMeasuresIwasawaAlgebras:L1/commutative-convolution','mathlib:PowerSeries.expand','mathlib:PowerSeries.C','mathlib:AbstractMeasure.dirac'],
 'principalTameEisensteinAwaySeries',kind='construction',src=euler_source,
 api=[('principalTameEisensteinAwaySeries_def','constructor','The series equals the displayed finite subset sum.'),('principalTameEisensteinAwaySeries_one','simp','At D=1 it equals E_a, including its actual localized constant.'),('principalTameEisensteinAwaySeries_primeFactors','compatibility','Equal prime-factor sets give equal series, under the stated positivity and coprimality hypotheses.'),('principalTameEisensteinAwaySeries_coeff_pos','projection','For n>0 its coefficient is i_a(Σ_(d|n,gcd(d,pD)=1)δ_(u(d))). Promoted below.'),('principalTameEisensteinAwaySeries_constant','projection','The constant is (∏_(ℓ∈P)(1−i_a(δ_(u(ℓ)))))A₀,a. Promoted below.')],
 tests=[('principal_level_one_keeps_constant','compatibility','D=1 returns E_a, not the zero-constant level-one tame kernel.'),('principal_repeated_prime','compatibility','For p=2, tame levels3 and9 give the same principal family.'),('principal_first_coefficient','computation','For every allowed D the first coefficient is1 in S_a.')],
 uses=[('L4 principal tame-character specialization','Supplies the constant missing from the level-one-zero tame kernel.'),('L4 integral q-expansion congruences','Finite Euler operators commute with clearing and preserve integral coefficient formulas.')])
add('principal-tame-positive-coefficients','Tame Euler deletion of positive coefficients',
 'For n>0, coeff_n(E_(a,D))=i_a(Σ_(d|n,gcd(d,pD)=1)δ_(u(d))).',eh,
 ['Use the native coefficient formula for expand and C-multiplication on each subset term. A summand contributes only when d_T divides n.',
 'The original positive coefficient formula and convolution δ_(u_T)δ_(u(b))=δ_(u(d_Tb)) reindex each contributing pair by the divisor d=d_Tb of n.',
 'For each fixed p-prime divisor d, the signed subset sum ranges over prime factors of D dividing d. It is the product of 1−1 over those primes: it is1 exactly when gcd(d,D)=1 and0 otherwise. This proves the displayed finite sum, retaining the native unit rather than its residue representative.'],
 [SID+'/principal-tame-eisenstein-series',SID+'/full-eisenstein-away-coefficients',SID+'/positive-eisenstein-measure','PadicMeasuresIwasawaAlgebras:L1/convolution-dirac','mathlib:PowerSeries.coeff_expand'],
 'principalTameEisensteinAwaySeries_coeff_pos',src=euler_source)
add('principal-tame-constant','The principal tame localized constant',
 'coeff₀(E_(a,D))=(∏_(ℓ∈P)(1−i_a(δ_(u(ℓ)))))A₀,a.',eh,
 ['Every expand_(d_T) preserves coefficient zero because d_T>0. Pull A₀,a out of the finite sum.',
 'Use the actual Dirac multiplication law to write δ_(u_T) as the product of the δ_(u(ℓ)). The finite distributive expansion of ∏(1−i_a(δ_(u(ℓ)))) is exactly the signed subset sum.',
 'The factor is1 when D=1. There is no division by2 inside ℤ_p and no claim that the displayed constant is an integral measure.'],
 [SID+'/principal-tame-eisenstein-series',SID+'/full-eisenstein-away-coefficients','PadicMeasuresIwasawaAlgebras:L1/convolution-dirac','mathlib:PowerSeries.constantCoeff_expand'],
 'principalTameEisensteinAwaySeries_constant',src=euler_source)
add('principal-tame-ordinary-constant','Ordinary arithmetic values of the principal tame constant',
 'For canonical a with value p+1 and e≥0, the actual evaluator E_(a,e) sends coeff₀(E_(a,D)) to −(1−p^e)B_(e+1)/(2(e+1))·∏_(ℓ∈P)(1−ℓ^e), viewed in ℚ_p.',eh+['The evaluator is the already constructed eisensteinAwayMoment, and all rational expressions are mapped directly to ℚ_p.'],
 ['Map the preceding product formula through the existing ring homomorphism E_(a,e). The inherited integral-evaluation theorem and Dirac evaluation send i_a(δ_(u(ℓ))) to ℓ^e.',
 'Apply eisenstein-away-constant-value to A₀,a and multiply by the finite Euler factors. No character evaluation on the entire total quotient ring is used.',
 'At p=2,D=3,e=3 the value is(−7/240)(1−27)=91/120. At D=1 recover−7/240; neither is replaced by zero.'],
 [SID+'/principal-tame-constant',SID+'/eisenstein-away-integral-evaluation',SID+'/eisenstein-away-constant-value','mathlib:AbstractMeasure.dirac_apply'],
 'principalTameEisensteinAwaySeries_constant_moment',src=euler_source,
 tests=[('principal_dyadic_cubic_constant','computation','At p=2,D=3 and arithmetic exponent3 the constant is91/120 in ℚ₂.')])
add('principal-tame-classical-comparison','Classical comparison of principal tame Euler deletion',
 'For every even w≥4 and canonical a, there is an actual g_D∈ModularForm(Γ₀(pD),w) whose value at z is Σ_(T⊆P)(−1)^|T|d_T^(w−1)·pStabilizedEisenstein(p,w)(d_Tz). Its q-expansion and the specialization of E_(a,D) at x^(w−1) are the separate complex and p-adic images of one unique rational power series.',eh,
 ['For each T, d_T>0 and d_T divides D. Apply the native levelRaise to the existing modular form at Γ₀(p), then the native subgroup inclusion from Γ₀(pD) into Γ₀(pd_T). Sum with the displayed rational scalar. This constructs an actual modular form and does not invoke an imprimitive Eisenstein existence assertion.',
 'Native level-raising q-expansions turn the finite sum into Σ_T(−1)^|T|d_T^(w−1)expand_(d_T)(F), where F is the unique rational series already supplied by full-eisenstein-common-series.',
 'Map the constructor’s finite subset formula through the existing admissible moment homomorphism. Dirac evaluation gives d_T^(w−1), and native map_expand commutes with both coefficient embeddings. The resulting p-adic series is the same rational expression.',
 'Uniqueness follows from injectivity of the rational-to-complex coefficient map. At D=1 recover the original actual p-stabilization and common rational series, including the constant.'],
 [SID+'/principal-tame-eisenstein-series',SID+'/full-eisenstein-common-series',SID+'/eisenstein-away-integral-evaluation','tauceti:TauCeti.ModularForm.levelRaise','tauceti:TauCeti.ModularForm.qExpansion_levelRaise','tauceti:ModularForm.ofLe','tauceti:TauCeti.Gamma0_map_le_conjAct_scaleGL','mathlib:PowerSeries.map_expand','mathlib:PowerSeries.map_injective'],
 'principalTameEisensteinAwaySeries_classical',kind='comparison',src=euler_source)
add('principal-tame-cleared-congruence','Integral precision of the principal tame family',
 'For canonical a, put F_(e,D)=map(E_(a,e))(E_(a,D)) and Δ_e=2(a^(e+1)−1) in ℚ_p. If r≥1 and e≡e′ modulo p^(r−1)(p−1), then every q-coefficient of Δ_e′F_(e′,D)−Δ_eF_(e,D) has norm at most p^(−r).',eh,
 ['The constructor and Dirac evaluation express Δ_eF_(e,D) as the finite sum Σ_T(−1)^|T|d_T^e expand_(d_T)(N_e), where N_e is the included actual integral cleared Eisenstein moment series.',
 'The inherited full-cleared-eisenstein-weight-congruence bounds each coefficient of N_e′−N_e. Every coefficient of N_e is integral, and each d_T is prime to p.',
 'The native totient congruence implies d_T^e′−d_T^e is divisible by p^r. Expand d_T^e′N_e′−d_T^eN_e into d_T^e′(N_e′−N_e)+(d_T^e′−d_T^e)N_e. Both terms have coefficient norm at most p^(−r).',
 'The ultrametric finite-sum inequality preserves the same bound. Expansion inserts zero coefficients and does not weaken it. Retain both weight-dependent clearing factors; the theorem does not assert integral congruences for the uncleared constant or an integral half at p=2.'],
 [SID+'/principal-tame-eisenstein-series',SID+'/full-cleared-eisenstein-weight-congruence',SID+'/full-eisenstein-cleared-specialization',SID+'/full-eisenstein-cleared-field-congruence','mathlib:Nat.pow_totient_mod','mathlib:Nat.totient_prime_pow','mathlib:PowerSeries.map_expand'],
 'principalTameEisensteinAwaySeries_cleared_congr',kind='theorem',src=euler_source)
owner='tauceti:TauCetiRoadmap/ModularForms#layer-0-diamond-operators-and-modular-forms-with-character-nebentypus'
stein={'sourceId':'Stein-Eisenstein-online','locator':'Definition5.1; Explicit Basis equation(4), following constant formula, Theorem5.8, restricted to weight≥3. Freshly read4October2026.','excerpt':'primitive Dirichlet characters','match':'Import the primitive-pair classical form from its existing ModularForms owner. The arithmetic measure, Euler deletion and comparison on a common coefficient field are L4 work. No claim to have read the cited Miyake proof or to construct an exceptional-weight form.'}
add('nontrivial-left-full-family','The full family with nontrivial primitive left character',
 'For primitive ψ modulo u>1 and primitive φ modulo v, and weight w≥3 with ψ(−1)φ(−1)=(−1)^w, the existing integral positive-series measure specializes to the full q-expansion of the p-stabilized owned classical E_w^(ψ,φ), through its unique common coefficient-field series. The constant is zero.',
 ['Use the same characteristic-zero field F with separate embeddings into ℂ and a complete ultrametric K as in integral-twisted-classical-full-comparison. The native integer subring O⊆K, integral arithmetic test κ^O_(0,1,w−1) and ordered characters are unchanged.',
 'The positive conductor levels u,v are prime to p; ψ and φ are primitive at their stated levels, u>1, w≥3 and the stated parity holds. The classical owner supplies an actual f∈ModularForm(Γ₁(uv),w) with coefficients Σ_(d|n)ψ(n/d)φ(d)d^(w−1) and constant0.',
 'Use the actual native inclusion and p-level raising to form g=f−φ(p)p^(w−1)V_p f on Γ₁(puv). No product primitivity is inferred and no exceptional-weight existence theorem is used.'],
 ['Request the actual classical form with these hypotheses and its zero constant from the existing ModularForms Layer0. Its character carrier and Bernoulli/Fourier construction are not recreated in this packet.',
 'Apply integral-twisted-classical-full-comparison to that form with c=0. Its constant term after stabilization is(1−φ(p)p^(w−1))·0=0, so the existing actual positive measure gives the whole series.',
 'The inherited integral test and weight congruences now cover every coefficient, including degree0. They require no factor1/2 even at p=2, unlike the nonprincipal-right/left-trivial constant family.'],
 [SID+'/integral-twisted-classical-full-comparison',SID+'/integral-twisted-positive-series-test-congruence',SID+'/integral-twisted-positive-series-weight-congruence',owner],
 'integralTwistedPositiveEisensteinSeries_nontrivial_left_full',kind='comparison',src=stein,
 tests=[('nontrivial_left_zero_constant','degenerate','For a primitive left character of conductor greater than1, both the full integral family and its stabilized classical series have coefficient zero equal to0.')])
p['requests'].append({'supplier':owner,'need':'Export actual primitive-pair Eisenstein forms in the native character eigenspaces and hence ModularForm(Γ₁(uv),w), for positive conductors u,v, primitive ψ,φ, w≥3 and ψ(−1)φ(−1)=(−1)^w, raising parameter1. Their positive coefficient is the native twistedDivisorSum(w−1,ψ,φ); the constant is0 when u>1 and −B_(w,φ)/(2w) when u=1. Supply the exact finite Bernoulli polynomial comparison through each specified coefficient embedding. The owner supplies the Fourier/Gauss translation to native Eisenstein series. For the nonprincipal tame application the right character θ=ηχ must separately satisfy primitivity at Dp^t; no primitivity of a product is inferred. Retain the owner’s separate weight1 and weight2 trivial-pair correction contracts; this request does not import them as ordinary w≥3 cases.','neededBy':[SID+'/nontrivial-left-full-family',SID+'/tame-actual-classical-full-comparison']})
p['nodes']+=new
save('NewNodes.json',new);save('Candidate.json',p);save('DirichletPadicLFunctions--L4.json',p)
print('Preserved mathematical nodes:',182,'new:',len(new))
```

## Script: finalize.py

```python
"""Reconcile target coverage, baseline statements and current proof boundaries."""
from pathlib import Path
import copy,hashlib,json,sys
S=Path(sys.argv[1]);R=Path.cwd();RID='DirichletPadicLFunctions';SID=RID+':L4';STEM=RID+'--L4'
save=lambda n,x:(S/n).write_text(json.dumps(x,ensure_ascii=False,indent=2)+'\n')
p=json.loads((S/'Candidate.json').read_text());old=json.loads((S/'Incoming.json').read_text())
by={n['id']:n for n in p['nodes']}
by[SID+'/principal-tame-classical-comparison']['prerequisites'].append('tauceti:CongruenceSubgroup.Gamma0_le_Gamma0_of_dvd')
newrefs={d for n in p['nodes'][182:]for d in n['prerequisites']if d.startswith(('mathlib:','tauceti:'))and ':TauCetiRoadmap/'not in d}-{b['ref']for b in p['baseline']['declarations']}
index=[r.split('\t')for r in Path(sys.argv[2]).read_text().splitlines()]
provides={
 'Nat.totient_prime_pow_succ':'The exact totient of p^(n+1), including p=2.',
 'Padic.norm_p_lt_one':'The p-adic norm of the natural prime is strictly below one.',
 'PowerSeries.constantCoeff_expand':'Expansion at a nonzero natural index preserves the constant coefficient.',
 'ZMod.pow_totient':'Every unit modulo n has totient-th power equal to one.',
 'tendsto_pow_atTop_nhds_zero_of_norm_lt_one':'Powers of a norm-less-than-one element of a seminormed ring tend to zero.',
 'CongruenceSubgroup.Gamma0_le_Gamma0_of_dvd':'The native Gamma0 subgroups are antitone in the positive integer level.',
 'PowerSeries.map_expand':'Coefficient maps commute with nonzero-index expansion.'}
for ref in sorted(newrefs):
 lib,name=ref.split(':',1);rows=[r for r in index if r[:2]==[lib,name]];assert len(rows)==1,(ref,rows)
 r=rows[0];assert name in provides,name
 p['baseline']['declarations'].append({'ref':ref,'kind':r[2],'module':r[3],'provides':provides[name],'checked':'Statement and hypotheses read at the pinned commit on 2026-10-04; used only in the displayed generality.'})
remaining=[
 'Discharge the two inherited PMIA requests: the actual completed-algebra comparison with joint finite quotient projections, and the character-twist ring equivalence on the convolution algebra. The completed-coordinate comparison stays an explicit unstatable signature comment until its owner supplies the native carrier and maps.',
 'Obtain the actual primitive-pair classical forms and precise generalized-Bernoulli/Fourier coefficient translation from the existing ModularForms Layer0 request. The nontrivial-left comparison imports that construction; the inherited nonprincipal-right comparison still takes an actual supplied classical form. Primitive levels, parity and w≥3 are mandatory. Product primitivity and arbitrary imprimitive existence are not inferred.',
 'Complete the finite-character specialization of the principal tame localized constant, using the actual coefficient-field character ring homomorphism and an admissible shifted denominator. L2 provides a primitive p-power smoothing formula only with its actual root, nonzero Gauss sum and coefficient-field hypotheses; its general evaluator is itself conditional. Reconcile imprimitive zero extensions at the given modulus with the primitive inducing character and every removed Euler factor. The new principal construction and ordinary-weight specialization do not discharge this finite-character comparison.',
 'Extend the full two-character comparison along the exact native conductor-change and level-raising maps, retaining the zero constant for nontrivial primitive left character and the actual nonprincipal-right constant for trivial left character. The ordinary principal tame family is now specified by finite Euler deletion of the localized zeta family. Weight1 and the weight2 trivial-pair correction require the classical owner’s separate hypotheses; they are not ordinary-weight applications.',
 'Check the whole split suggested module after the L1/L2 prototype imports and exact pinned Tau dependency closure are available. The new Mathlib-only obstruction file has an admitted signature-check receipt; this is neither a proof certificate nor a compilation of the full file. The entire roadmap’s RJW §§2–8 acceptance also requires the separately owned L0–L3 work; geometric affinoid and Hida–Coleman realization remain PadicFamilies work.'
]
p['status']='complete'
p['summary']='The L4 planning pass accounts for the accepted Eisenstein-family targets with 192 nodes: 182 inherited mathematical contracts and ten new declarations. New work makes the corrected non-interpolation argument explicit, constructs principal tame Euler deletion on the actual localized family, records its constant, classical comparison and cleared congruences, and imports the primitive nontrivial-left classical form from its single owner. L4 is planned with explicit supplier, finite-character, conductor/exceptional-weight and full-signature gaps; it is not closed. All implementations remain unchecked.'
p['coverage']=[{'stageId':SID,'status':'planned','remaining':remaining}]
p['gaps'][0]={'title':'Full tame and exceptional-weight comparison boundaries','neededBy':[SID+'/principal-tame-eisenstein-series',SID+'/nontrivial-left-full-family',SID+'/tame-actual-classical-full-comparison'],'detail':'The old note described a whole-roadmap checkpoint and an obsolete checker limitation. The current checker accepts the existing ModularForms stage, now an explicit request. The principal ordinary family has finite Euler-deletion, constant, actual classical comparison and cleared-congruence nodes. The finite-character and conductor-change synthesis and the separate classical weight1/2 contracts remain open, as enumerated in coverage. No zero tame kernel is substituted for the principal localized zeta constant.'}
p['gaps'] += [
 {'title':'Principal finite-character value and conductor comparison','neededBy':[SID+'/principal-tame-eisenstein-series'],'detail':remaining[2]},
 {'title':'Classical primitive-pair construction supplied by its existing owner','neededBy':[SID+'/nontrivial-left-full-family',SID+'/tame-actual-classical-full-comparison'],'detail':remaining[1]},
 {'title':'Complete split signature integration','neededBy':[SID],'detail':remaining[4]}
]
for s in p['sources']:
 if s['id']=='RJW-published':s['readSections'].append('L4 target pass, 4October2026: complete published printed158–161 / physicalPDF59–62 freshly read, hash unchanged. The corrected fixed-component obstruction and finite tame Euler-deletion adapters are worker decompositions. Earlier source reading remains attributed history, not a fresh whole-paper read.')
 if s['id']=='Stein-Eisenstein-online':s['readSections'].append('4October2026: Definition5.1, equation(4), the two-case constant formula and Theorem5.8 freshly read. Only w≥3 primitive-pair existence is imported; the cited Miyake proof is not claimed read.')
p['checks']={'inheritedCombinedHistory':{'scope':'Historical combined roadmap evidence; not current L4 validation or compilation.','record':old['checks']},'l4PlanningPass':{'nodes':192,'inheritedMathematicalContracts':182,'declarationMetadataUpdates':21,'newNodes':10,'apiItems':169,'definitionConstructionTests':111,'rawTests':358,'planets':6,'baselineDeclarations':180,'gaps':5,'requests':3,'blueprintErrors':0,'blueprintWarnings':0,'fullSuggestedCompiled':False,'boundedObstructionCheck':{'file':'Obstruction.lean','sourceSha256':hashlib.sha256((S/'Obstruction.lean').read_bytes()).hexdigest(),'signatures':3,'examples':3,'errors':0,'expectedSorryWarnings':6,'proofsAdmitted':True},'evidence':'Exact current checker, intake and atlas results and independently recoverable artifacts are bound by the handoff.'}}
save('Candidate.json',p);save(STEM+'.json',p)
save('NewNodes.json',p['nodes'][182:]);save('BaselineAdditions.json',[b for b in p['baseline']['declarations']if b['ref']in newrefs])
changes=[]
for a,b in zip(old['nodes'],p['nodes'][:182]):
 assert {k:v for k,v in a.items()if k!='library'}=={k:v for k,v in b.items()if k!='library'}
 if a['library']!=b['library']:changes.append({'id':a['id'],'before':a['library'],'after':b['library']})
save('MetadataChanges.json',changes)
save('TargetMap.json',[
 {'target':'Actual level-one q-expansion and p-stabilization, even w≥4','nodes':['normalized-eisenstein','p-stabilized-eisenstein','p-stabilized-q-expansion','full-eisenstein-common-series'],'boundary':'Existing native classical carriers and rational/complex/p-adic coefficient comparisons.'},
 {'target':'Positive coefficient measures and impossibility of interpolating p^e','nodes':['positive-eisenstein-measure','prime-power-moments-impossible'],'boundary':'The new contradiction uses uniform unit-power convergence in a fixed component, including p=2.'},
 {'target':'Corrected localized A0 and whole-series specialization','nodes':['localized-eisenstein-constant','localized-eisenstein-twist-comparison','full-eisenstein-common-series','eisenstein-not-ordinary-pseudomeasure'],'boundary':'Retain doubled shifted denominators and the precise generic twist request; no evaluation on every fraction.'},
 {'target':'Tame-character families and common classical coefficients','nodes':['integral-doubled-tame-eisenstein-series','tame-actual-classical-full-comparison','principal-tame-eisenstein-series','principal-tame-classical-comparison','nontrivial-left-full-family'],'boundary':'Canonical primitive-pair classical input is requested; finite-character principal comparison, conductor synthesis and exceptional weights have explicit gaps.'},
 {'target':'Integral q-expansion congruences and dyadic normalization','nodes':['full-cleared-eisenstein-weight-congruence','principal-tame-cleared-congruence','integral-twisted-positive-series-weight-congruence','integral-doubled-tame-weight-congruence','all-prime-tame-half-classification'],'boundary':'Keep clearing factors and exact integral-half criteria. No division by2 in the dyadic integer ring is presumed.'},
 {'target':'Roadmap-wide acceptance and geometric realization boundaries','nodes':[],'boundary':'RJW §§2–8 acceptance includes L0–L3; Theorem6.7 belongs to ColemanIntegration. PadicFamilies owns full affinoid/Hida–Coleman geometry. This L4 planning status certifies none of those independent targets.'}
])
print(json.dumps({'nodes':len(p['nodes']),'status':p['status'],'stage':'planned','metadataUpdates':len(changes),'newBaseline':len(newrefs),'gaps':len(p['gaps']),'requests':len(p['requests'])}))
```

## Script: assemble_files.py

```python
"""Assemble the standalone L4 reader and exact inherited/new signature sections."""
from pathlib import Path
import collections,hashlib,json,re,sys
S=Path(sys.argv[1]);R=Path.cwd();STEM='DirichletPadicLFunctions--L4'
p=json.loads((S/'Candidate.json').read_text())
imports=[];body=[]
for name in ['InheritedProjection.lean','Obstruction.lean','Principal.lean']:
 t=(S/name).read_text();body.append('\n'.join(l for l in t.splitlines()if not l.startswith('import ')))
 for l in t.splitlines():
  if l.startswith('import ')and l not in imports:imports.append(l)
lean=('\n'.join(imports)+'\n\n'+'\n\n'.join(body)).rstrip()+'\n'
(S/'Suggested.lean').write_text(lean)
counts={'nodes':len(p['nodes']),'kinds':dict(collections.Counter(n['kind']for n in p['nodes'])),'rawAPI':sum(len(n.get('api',[]))for n in p['nodes']),'rawTests':sum(len(n.get('tests',[]))for n in p['nodes']),'planets':sum(bool(n.get('planet'))for n in p['nodes']),'baseline':len(p['baseline']['declarations']),'gaps':len(p['gaps']),'requests':len(p['requests'])}
(S/'Counts.json').write_text(json.dumps(counts,indent=2)+'\n')
intro='''# Dirichlet p-adic L-functions — L4: Eisenstein families

This layer constructs arithmetic Eisenstein coefficient families on the actual p-adic unit group and compares their specializations with classical modular forms through common algebraic q-expansions. The planning pass is complete: L4 is planned, with explicit gaps and supplier requests, and every implementation status remains unchecked. Planning status does not assert a gap-free proof or a compiled library.

## Objects and conventions

For each prime p, including 2, use U=(ℤ_p)ˣ and the native integral measure carrier with the supplied multiplicative convolution. Positive coefficient n is the sum of Dirac masses at the positive divisors d of n prime to p. A classical weight w uses the test x^(w−1). The finite-character factors keep their order: the left character is evaluated at n/d and the right at d. Characters retain their stated levels and zero extensions; a primitive inducing character is used only after restoring the exact Euler factors.

The arithmetic level-one normalization has constant ζ(1−w)/2=−B_w/(2w). For even w≥4, native level raising constructs E_w−p^(w−1)E_w(pz). The coefficient comparisons pass through a rational or specified character field and its separate embeddings into ℂ and a p-adic coefficient field. They never transport arbitrary complex values by an isomorphism to a p-adic field.

The constant A₀ is an element of the actual total quotient of the integral measure algebra, represented by a numerator divided by the doubled shifted denominator 2(aδ_a−1). It is the half of the coordinate twist of the arithmetic zeta pseudomeasure when the requested twist ring equivalence is supplied. It need not be an ordinary pseudomeasure for the factors δ_a−1. Evaluation uses a particular admissible localization; the inverse-coordinate character obstructs extending it to every fraction. At p=2, the factor 2 stays in the denominator and is not inverted inside the integer ring.

## The corrected obstruction

The unit tests j_e(u)=u^e satisfy a uniform norm estimate
‖j_(k+(p−1)pⁿ)−j_k‖≤p^(−n−1). Reduce each actual unit modulo p^(n+1), use the finite-unit totient exponent, then convert the reduction kernel into the p-adic norm bound. Compactness supplies the continuous-test supremum norm. This proof includes p=2 and uses no odd-order idempotents.

Consequently these tests converge to j_k in the continuous-test norm. An actual bounded ℚ_p-valued measure with moments p^e would, at k=0, send them to a sequence tending to 1. The same alleged values tend to 0 since their exponents tend to infinity and ‖p‖<1. This supplies the motivating obstruction for deleting p-divisible divisors. The fixed residue class of exponents is essential.

## Principal tame Euler deletion

The principal tame case uses the localized zeta family, rather than the modulus-one tame constructor whose constant is zero. For D>0 prime to p, let P be its distinct prime divisors. For each subset T let d_T be their product and u_T its actual unit in ℤ_p. Define

E_(a,D)=Σ_(T⊆P)(−1)^|T| C(i_a(δ_(u_T))) expand_(d_T)(E_a).

This is a finite expression in the native localization and formal-series carrier. Its positive coefficients retain exactly the divisors prime to pD. Its constant is A₀,a multiplied by ∏_(ℓ∈P)(1−i_a(δ_(u(ℓ)))). Repeated prime factors of D have no effect. The first coefficient is 1, and D=1 returns the entire original family, including the localized constant.

At arithmetic exponent e the constant becomes
−(1−p^e)B_(e+1)/(2(e+1))·∏_(ℓ∈P)(1−ℓ^e).
For p=2,D=3,e=3 this is 91/120, whereas the original D=1 constant is −7/240. Native level raising of the existing p-stabilized modular form constructs the corresponding classical finite sum at level Γ₀(pD). Coefficient maps commute with each expansion, giving a unique common rational series.

The integral congruence retains the clearing factors Δ_e=2(a^(e+1)−1). When e and e′ agree modulo p^(r−1)(p−1), every coefficient of Δ_e′F_(e′,D)−Δ_eF_(e,D) has norm at most p^(−r). The finite Euler operators preserve that precision because their divisor weights are units. This is not an integral congruence for the uncleared constants.

## Nonprincipal characters and classical ownership

The inherited nonprincipal-right family includes its actual tame constant measure, with a doubled integral normalization and an explicit scalar-integrality criterion. At p=2 a normalized half exists only under the recorded conditions. The new primitive nontrivial-left comparison has zero constant and therefore uses the entire existing integral positive-series measure, without halving.

The existing ModularForms Layer 0 owns classical primitive character Eisenstein forms, their Bernoulli quantities and Fourier/Gauss translation. The new request states the positive coefficient formula, the two constant cases, primitive levels, parity and weight w≥3. It includes no inference that a product character is primitive. Weight 1 and the weight 2 trivial-pair correction keep the owner’s separate contracts. Geometric affinoid realization and Hida–Coleman control belong to PadicFamilies.

## Target coverage and open boundaries

'''
for row in json.loads((S/'TargetMap.json').read_text()):
 intro+='### '+row['target']+'\n\n'+row['boundary']+'\n\n'
 if row['nodes']:intro+='Declarations: '+', '.join('DirichletPadicLFunctions:L4/'+n for n in row['nodes'])+'.\n\n'
intro+='## Remaining work\n\n'+'\n\n'.join(str(i+1)+'. '+x for i,x in enumerate(p['coverage'][0]['remaining']))+'\n\n'
intro+='''## Source corrections and verification boundary

The published RJW text at printed 158–161 was freshly read against its retained SHA-256. The fixed-component correction is already recorded and independently confirmed as PAPER-RODRIGUES-JACINTO-WILLIAMS-23/E53. The shifted-constant correction is recorded as E54 of that extraction; the existing all-prime obstruction here retains its own doubled-denominator precision. Those findings are credited to their existing records, not rediscovered or independently reviewed by this pass. The two inherited local findings E8 and E9 retain the weight/level correction and exponent shift. Stein’s primitive-pair coefficient and two-case constant formula were freshly read; the referenced Miyake proof is not claimed read.

All 182 inherited mathematical node contracts, API entries and tests are retained. Twenty-one declaration-name metadata records are completed or namespace-qualified to match their existing signatures. Ten new declarations cover the obstruction, principal tame construction and comparisons, and cleared congruences; the exact counts are in the catalogue and handoff. The independent reviewer must assess their proof plans and recorded gaps.

The inherited projection contains 288 distinct typed declaration/API signatures and 350 examples. The completed-algebra comparison is retained as an explicit comment because its requested native carrier is unavailable. New signatures and tests are appended with their exact bodies. The full split file is uncompiled: L1/L2 prototype files and the exact pinned Tau dependency closure are unavailable. A separate Mathlib-only file checks the three new obstruction signatures and three examples with six expected admission warnings. This is a signature check, not an implementation or proof certificate. Earlier combined-file compiler claims remain attributed historical evidence.

## Sources

'''
used={x['sourceId']for n in p['nodes']for x in n.get('sources',[])}
for src in p['sources']:
 if src['id']in used:
  intro+='### '+src['id']+'\n\n'+src['title']+' — '+src['authors']+'. '+src.get('edition','')+'\n\n'+src.get('url','')+'\n\n'
  intro+='Recorded source hash: '+src.get('sha256','not recorded')+'.\n\n'
intro+='## Supplier requests\n\n'
for req in p['requests']:intro+='### '+req['supplier']+'\n\n'+req['need']+'\n\nNeeded by: '+', '.join(req['neededBy'])+'\n\n'
intro+='## Declaration catalogue\n\n'
for n in p['nodes']:
 intro+='### '+n['title']+'\n\n'+n['id']+'\n\nDeclaration: '+n['library']['declaration']+'\n\nKind: '+n['kind']+'. Implementation: unchecked.\n\n'+n['statement']+'\n\n'
 for key,label in [('hypotheses','Hypotheses'),('proofSteps','Construction or proof outline'),('prerequisites','Prerequisites'),('acceptance','Acceptance')]:
  if n.get(key):intro+='**'+label+'**\n\n'+'\n'.join('- '+x for x in n[key])+'\n\n'
 for key,label in [('api','API'),('tests','Tests')]:
  if n.get(key):intro+='**'+label+'**\n\n'+'\n'.join('- '+x['name']+': '+x['statement']for x in n[key])+'\n\n'
 if n.get('uses'):intro+='**Uses**\n\n'+'\n'.join('- '+x['where']+': '+x['how']for x in n['uses'])+'\n\n'
 if n.get('sources'):intro+='**Sources**\n\n'+'\n'.join('- '+x['sourceId']+', '+x['locator']+'. '+x.get('match','')for x in n['sources'])+'\n\n'
intro=intro.rstrip()+'\n';(S/'Reader.md').write_text(intro)
for folder,ext,name in [('packets','json','Candidate.json'),('readmes','md','Reader.md'),('suggested','lean','Suggested.lean')]:
 (R/'research/blueprint'/folder/(STEM+'.'+ext)).write_bytes((S/name).read_bytes())
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
"""Project exact inherited L4 commands and tests; import sibling prototype owners."""
from pathlib import Path
import collections,hashlib,json,re,sys
S=Path(sys.argv[1]);t=(S/'Inherited.lean').read_text();p=json.loads((S/'InheritedNamed.json').read_text());cs=json.loads((S/'LeanCommands.json').read_text())
names={n['library']['declaration']for n in p['nodes']}
for n in p['nodes']:
 for a in n.get('api',[]):names.add(a['name']if '.'in a['name']else n['library']['namespace']+'.'+a['name'])
blocked={'DirichletPadic.positiveEisenstein_completed_projection'}
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
imports='\n'.join(t[c['start']:c['end']]for c in cs if c['kind']=='import')+'\n'
imports+='import research.blueprint.suggested.«DirichletPadicLFunctions--L0»\nimport research.blueprint.suggested.«DirichletPadicLFunctions--L1»\nimport research.blueprint.suggested.«DirichletPadicLFunctions--L2»\n'
imports+='import research.blueprint.suggested.«DirichletPadicLFunctions--L3»\n'
note='\n/-!\n# Dirichlet L4: Eisenstein coefficient families\n\nThis file is not the roadmap and is not exhaustive. The roadmap document is\ndefinitive. The signatures and examples suggest names and types for review;\nall implementation statuses remain unchecked.\n\nThe inherited L4 declarations are projected from the unchanged combined source.\nThe L0/L1/L2/L3 arithmetic prototypes are imported from their existing owners.\nL1/L2 modules are currently absent; PMIA is an unchecked prototype dependency.\nThe inherited native Tau dependency closure is unavailable at the pinned build.\nThis full split file is NOT COMPILED. Separate bounded checks, if reported in\nthe handoff, certify only the exact files identified there.\n-/\n'
blocked_text=t[t.index('/- DirichletPadicLFunctions:L4/positive-eisenstein-completed-coordinates'):t.index('No replacement carrier or theorem assuming that coordinate identity is introduced here. -/')+len('No replacement carrier or theorem assuming that coordinate identity is introduced here. -/')]
out=(imports+note+body+'\n'+blocked_text).rstrip()+'\n'
(S/'InheritedProjection.lean').write_text(out)
report={'inheritedSha256':hashlib.sha256(t.encode()).hexdigest(),'selectedCommandIndices':kept,'declarationAndAPINames':sorted(names),'testNames':sorted(tests),'ownedNodes':len(p['nodes']),'unstatableInheritedNames':sorted(blocked),'namedSignatures':len(names),'testCount':len(tests),'exampleCount':len(re.findall(r'^[ \t]*example\b',out,re.M)),'lines':len(out.splitlines()),'sha256':hashlib.sha256(out.encode()).hexdigest(),'compiled':False,'plannedSiblingImports':['L0','L1','L2','L3'],'unavailableSiblingFiles':['L1','L2']}
(S/'Projection.json').write_text(json.dumps(report,indent=2)+'\n')
print(json.dumps({k:v for k,v in report.items()if k not in ['selectedCommandIndices','declarationAndAPINames','testNames']},indent=2))
```

## Script: verify.py

```python
"""Authenticate L4 preservation, projection, bounded typing and actual repository checks."""
from pathlib import Path
import ast,functools,hashlib,json,os,re,subprocess,sys
S=Path(sys.argv[1]).resolve();R=Path.cwd().resolve();sys.path.insert(0,str(S))
RID='DirichletPadicLFunctions';STEM=RID+'--L4';SID=RID+':L4'
sha=lambda b:hashlib.sha256(b).hexdigest()
txt=functools.lru_cache(None)(lambda n:(S/n).read_text())
data=lambda n:json.loads(txt(n))
MATH=txt('base.txt').strip();BASE=os.environ.get('ROOT_ACTION_VALIDATE_BASE',txt('publication-base.txt').strip())
def blob(ref,path):return subprocess.check_output(['git','show',ref+':'+path],cwd=R)
paths=['research/blueprint/'+f+'/'+('BP-'if f=='handoff'else'')+STEM+'.'+e for f,e in [('packets','json'),('readmes','md'),('suggested','lean'),('handoff','md')]]
contents={p:txt(n)for p,n in zip(paths,['Candidate.json','Reader.md','Suggested.lean','PublicHandoff.md'if(S/'PublicHandoff.md').exists()else'Handoff.md'])}
assert blob(MATH,paths[0])==(S/'Incoming.json').read_bytes()==blob(BASE,paths[0])
p=data('Candidate.json');old=data('Incoming.json');whole=data('OriginalWholePacket.json')
assert old['nodes']==[n for n in whole['nodes']if n['parentStageId']==SID]
assert len(p['nodes'])==192 and len(old['nodes'])==182 and p['status']=='complete'
metadata=[]
for a,b in zip(old['nodes'],p['nodes'][:182]):
 assert {k:v for k,v in a.items()if k!='library'}=={k:v for k,v in b.items()if k!='library'},a['id']
 if a['library']!=b['library']:metadata.append(dict(id=a['id'],before=a['library'],after=b['library']))
assert len(metadata)==21 and metadata==data('MetadataChanges.json')
assert p['nodes'][182:]==data('NewNodes.json')and len(data('NewNodes.json'))==10
assert len(p['coverage'])==1 and p['coverage'][0]['status']=='planned'and len(p['coverage'][0]['remaining'])==5
assert len(p['gaps'])==5 and len(p['requests'])==3
assert p['sourceIssues']==old['sourceIssues'] and p['sourceVersions']==old['sourceVersions']
assert p['baseline']['declarations'][:173]==old['baseline']['declarations']
assert p['baseline']['declarations'][173:]==data('BaselineAdditions.json')and len(p['baseline']['declarations'])==180
assert p['checks']['inheritedCombinedHistory']['record']==old['checks']
assert all(n['implementationStatus']=='unchecked'for n in p['nodes'])
assert all(len(n['tests'])>=3 and len(n['api'])>=3 for n in p['nodes']if n['kind']in['definition','construction'])
for n in p['nodes']:
 assert n['id']in txt('Reader.md') and n['statement']in txt('Reader.md')
 for item in n.get('api',[])+n.get('tests',[]):assert item['name']in txt('Reader.md')and item['statement']in txt('Reader.md')
rec=data('OriginalPublicReceipt.json');assert rec['head']=='94522a22ab89f975cbf508d57515456e56f6fbb6'and len(rec['verified'])==4
for row in rec['verified']:
 assert sha((S/row['artifact']).read_bytes())==row['sha256']and len((S/row['artifact']).read_bytes())==row['bytes']
for name,path in [('Inherited.lean','research/blueprint/split/DirichletPadicLFunctions.lean'),('InheritedReader.md','research/blueprint/split/DirichletPadicLFunctions.md'),('InheritedHandoff.md','research/blueprint/handoff/BP-DirichletPadicLFunctions.md')]:assert(S/name).read_bytes()==blob(MATH,path)==blob(BASE,path)
projection=data('Projection.json');assert projection['ownedNodes']==182 and projection['namedSignatures']==288 and projection['testCount']==projection['exampleCount']==350 and not projection['compiled']
regenerated=['LeanCommands.json','LeanIndexReport.json','InheritedProjection.lean','Projection.json','FinalLeanCommands.json','FinalLeanIndexReport.json']
before={n:(S/n).read_bytes()for n in regenerated}
for script,args in [('index_lean.py',[]),('project.py',[]),('index_lean.py',['Suggested.lean','Candidate.json','Final'])]:subprocess.run([sys.executable,str(S/script),str(S)]+args,check=True,capture_output=True)
for n,b in before.items():assert(S/n).read_bytes()==b,n
blocked=['DirichletPadic.positiveEisenstein_completed_projection']
assert data('LeanIndexReport.json')['missing']==data('FinalLeanIndexReport.json')['missing']==blocked
assert not data('FinalLeanIndexReport.json')['duplicates']and data('FinalLeanIndexReport.json')['found']==301
imports=[];body=[]
for name in ['InheritedProjection.lean','Obstruction.lean','Principal.lean']:
 t=txt(name);body.append('\n'.join(l for l in t.splitlines()if not l.startswith('import ')))
 for l in t.splitlines():
  if l.startswith('import ')and l not in imports:imports.append(l)
assert ('\n'.join(imports)+'\n\n'+'\n\n'.join(body)).rstrip()+'\n'==txt('Suggested.lean')
assert len(re.findall(r'^[ \t]*example\b',txt('Suggested.lean'),re.M))==358
for n in p['nodes'][182:]:
 for test in n.get('tests',[]):assert '-- '+test['name'].rsplit('.',1)[-1]+'\n'in txt('Suggested.lean'),test['name']
typing=data('Typing.json');assert sha((S/'Obstruction.lean').read_bytes())==typing['sourceSha256']and typing['exitCode']==typing['errors']==0 and typing['expectedSorryWarnings']==6 and not typing['fullSuggestedCompiled']
for log in typing['logs']:assert sha((S/log['artifact']).read_bytes())==log['publicSha256']
assert txt('Obstruction-3.public.log').count('warning: declaration uses `sorry`')==6 and 'error:'not in txt('Obstruction-3.public.log')and 'Exit status: 0'in txt('Obstruction-3.public.log')
assert data('ClaimReceipt.json')['claim']==5983996960 and data('ClaimReceipt.json')['confirmation']==5983998042
assert data('Reading.json')['agent']=='Codex — codex-7e92bd'
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
errors,warnings,summary=check_blueprint.check(S/(STEM+'.json'),index,check_blueprint.world());assert not errors and not warnings,(errors,warnings);summary['packet']=paths[0]
issues=source_issues.check_issues(p['sourceIssues'],RID)+check_errata.versions_checked(p,p['sourceIssues']);assert not issues,issues
tree=ast.parse((R/'research/blueprint/intake.py').read_text());wanted={'file_problems','auto_refusals','own_files','independent_of'}
picked=[n for n in tree.body if isinstance(n,ast.Assign)and any(isinstance(t,ast.Name)and t.id in {'ALLOWED','PRIVATE'}for t in n.targets)or isinstance(n,ast.FunctionDef)and n.name in wanted]
env={'json':json,'re':re};exec(compile(ast.Module(body=picked,type_ignores=[]),'actual-intake','exec'),env)
job=next(j for j in json.loads((R/'research/blueprint/queue.json').read_text())['jobs']if j['id']=='BP-'+STEM)
problems=[x for f in paths for x in env['file_problems'](f,contents[f])];refusals=env['auto_refusals'](job,paths,False,{'codex-7e92bd'},set());assert not problems and not refusals,(problems,refusals)
graph=json.loads(subprocess.check_output([sys.executable,str(S/'graph.py'),str(S)],cwd=R,text=True,env={**os.environ,'ROOT_ACTION_VALIDATE_BASE':BASE}));assert graph['worldCommit']==BASE
print(json.dumps(dict(checker=summary,warnings=warnings,sourceIssueErrors=issues,intakeProblems=problems,intakeRefusals=refusals,preservedMathematicalContracts=182,declarationMetadataUpdates=21,newNodes=10,counts=data('Counts.json'),projection={k:v for k,v in projection.items()if k not in ['selectedCommandIndices','declarationAndAPINames','testNames']},finalNamedSignatures=301,finalExamples=358,boundedTyping=typing,inputGuards=len(data('InputGuard.json')),reviewedPublicationChanges=changes,mathematicalBase=MATH,immutableBase=BASE,graph=graph,fullSuggestedCompiled=False,LeanExecutedByVerifier=False),indent=2))
```

## Script: graph.py

```python
from pathlib import Path
import sys,json,collections,copy
R=Path.cwd(); S=Path(sys.argv[1]);RID='DirichletPadicLFunctions';STEM=RID+'--L4';SID=RID+':L4'
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
name=sys.argv[4];assert name in {'Native.lean','Canonical.lean','Published.lean','AdmittedTyping.lean','Prototype.lean','Sketch.lean','Context.lean','Obstruction.lean'}
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

## Script: package.py

```python
"""Archive the named completion evidence and bind a public recovery helper."""
from pathlib import Path
import base64,hashlib,json,re,sys,zlib
S=Path(sys.argv[1]).resolve();R=Path.cwd();mode=sys.argv[2]
STEM='DirichletPadicLFunctions--L4'
sha=lambda b:hashlib.sha256(b).hexdigest()
helpers=['extend.py','finalize.py','assemble_files.py','index_lean.py','project.py','verify.py','graph.py','immutable_view.py','runcheck.py','package.py']
names="""Incoming.json OriginalWholePacket.json InheritedReader.md Inherited.lean InheritedHandoff.md OriginalPublicReceipt.json
Candidate.json Reader.md Suggested.lean InheritedNamed.json InheritedProjection.lean LeanCommands.json LeanIndexReport.json Projection.json FinalLeanCommands.json FinalLeanIndexReport.json
InputGuard.json PublicationChanges.json ClaimReceipt.json Reading.json TouchingEntries.json TargetMap.json NewNodes.json MetadataChanges.json BaselineAdditions.json Counts.json
Obstruction.lean Principal.lean Typing.json Obstruction.public.log Obstruction-2.public.log Obstruction-3.public.log WORKLIST.md Own5948WORKLIST.md
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
STEM='DirichletPadicLFunctions--L4'
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

The archived OriginalPublicReceipt.json binds the four original combined files to head 94522a22ab89f975cbf508d57515456e56f6fbb6. Those files were fetched and compared over actual HTTP in the same worker’s preceding PR6099 pass; this pass authenticates the reused bytes. The verifier authenticates all 182 inherited L4 mathematical contracts, the 21 declaration-name metadata updates and ten new nodes. It regenerates the inherited and final command/test indices from exact source and checks the separately recorded bounded obstruction typing receipt. Both final recovered verifier reports were reproduced before this PR was opened. No compiler run is replayed by recovery or verification. The separate Obstruction.lean check had zero errors and six expected admission warnings; the full split suggested file remains uncompiled.


## Script: recover.py

'''
 text=(S/'HandoffBase.md').read_text()+prose+'```python\n'+code+'```\n'
 (S/'PublicHandoff.md').write_text(text);handoff.write_text(text);suggested.write_bytes((S/'Suggested.lean').read_bytes())
 print(json.dumps(dict(archive=archive,recoverySha256=sha(code.encode()),finalHandoffSha256=sha(text.encode())),indent=2))
else:raise ValueError(mode)
```

## Public recovery and verification

Archive commit `c9828b5e774c70b83be5da2801805b029b76910a` is an ancestor changing only this issue’s named deliverables. It holds 51 inert named artifacts, including 10 exact helpers. Manifest SHA256 `e16875c5343b6d4f0ebde33a16a85b53c5da69b4e68e70a8b30805db3cfb49d7`; payload SHA256 `bc1ddd2e28561cbd30a70bbc408de6f845741795e2cf0366babbda566e886cb0`. The final suggested file contains no archive payload.

Save the final Python fence as recover.py and run `python3 recover.py REPLAY_DIR FULL_PR_HEAD_SHA`. It fetches the public immutable archive and all four deliverables, authenticates every artifact and helper, and checks its own code against the public handoff. Keep REPLAY_DIR outside an existing repository checkout. Inspect the recovered helpers, then from that checkout run `PYTHONDONTWRITEBYTECODE=1 python3 REPLAY_DIR/verify.py REPLAY_DIR DECLARATION_INDEX`. Use the pinned declarations.tsv (SHA256 86649a7d5f35d1178a45fe7aa4713741d03d43ff3b37bb8c91a1da1c794c8ce1). Output must equal Verification.json. Set ROOT_ACTION_VALIDATE_BASE to the base in base.txt to reproduce MathematicalVerification.json. Both bases must exist locally. The verifier runs the actual immutable checker, source-issue/intake functions and atlas assembler, and authenticates the exact inherited source/projection without executing Lean.

The archived OriginalPublicReceipt.json binds the four original combined files to head 94522a22ab89f975cbf508d57515456e56f6fbb6. Those files were fetched and compared over actual HTTP in the same worker’s preceding PR6099 pass; this pass authenticates the reused bytes. The verifier authenticates all 182 inherited L4 mathematical contracts, the 21 declaration-name metadata updates and ten new nodes. It regenerates the inherited and final command/test indices from exact source and checks the separately recorded bounded obstruction typing receipt. Both final recovered verifier reports were reproduced before this PR was opened. No compiler run is replayed by recovery or verification. The separate Obstruction.lean check had zero errors and six expected admission warnings; the full split suggested file remains uncompiled.


## Script: recover.py

```python
"""Recover public completion evidence, authenticate artifacts, never execute Lean."""
from pathlib import Path
import base64,hashlib,json,re,sys,urllib.request,zlib
S=Path(sys.argv[1]).resolve();S.mkdir(parents=True,exist_ok=True)
HEAD=sys.argv[2];assert re.fullmatch('[0-9a-f]{40}',HEAD)
ROOT='https://raw.githubusercontent.com/CBirkbeck/tauceti-explorer/'
STEM='DirichletPadicLFunctions--L4'
ARCHIVE='c9828b5e774c70b83be5da2801805b029b76910a'
MANIFEST_SHA='e16875c5343b6d4f0ebde33a16a85b53c5da69b4e68e70a8b30805db3cfb49d7'
PAYLOAD_SHA='bc1ddd2e28561cbd30a70bbc408de6f845741795e2cf0366babbda566e886cb0'
EXPECTED={'packets': 'fd194daa8bc9b6ee3d56c262ef05b657739d2c3eb89ef53a500e9b380d67ef10', 'readmes': 'd2d3ea088164a1c6a20422654cdfbd897560235ddbe5f361b4172bf6c712c950', 'suggested': '9768ed91c8cc0df42fb24f159e4ef49d184269b6168adb8bdd059564b1fef2f6'}
sha=lambda b:hashlib.sha256(b).hexdigest()
def fetch(ref,path):
 with urllib.request.urlopen(ROOT+ref+'/'+path,timeout=30)as r:return r.read()
raw=fetch(ARCHIVE,'research/blueprint/suggested/'+STEM+'.lean').decode()
pb=raw.split('/- BEGIN ARCHIVED PLANNING PASS COMPLETION PAYLOAD\n',1)[1].split('END ARCHIVED PLANNING PASS COMPLETION PAYLOAD -/',1)[0].encode()
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
