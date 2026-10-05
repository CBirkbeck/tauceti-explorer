# BP-DirichletPadicLFunctions--L1 — planning completion

Refs #5879. Worker: Codex — codex-7e92bd. The claim comment is 5991059388 and the confirming bot reply is 5991061816; the whole issue was reread after confirmation. Selection followed WORKERS: the available higher-priority finished-plan reviews were this worker's own work, and no eligible restructuring or owns-key-definitions job preceded this choice. Selection.json records the exclusions.

The planning pass is **complete** and L1 is **planned**, with five precise supplier gaps. Nothing is claimed implemented or closed. The 134 nodes comprise 1 definition, 10 constructions, 65 lemmas, 42 theorems and 16 comparisons. There are 99 API items and 181 test contracts in total, six planets and 139 native baseline declarations. The checker reports the narrower definition/construction subset as 95 API items and 59 unit tests.

## What changed

All 121 inherited mathematical statements, hypotheses, proofs, dependencies, APIs, tests and citations are retained. Twenty-four missing declaration names were added and eight short names qualified. The six planets now represent the full layer, including the actual Kubota–Leopoldt pseudomeasure, interpolation and Kummer congruences. Historical combined-roadmap provenance and checks are preserved and explicitly separated from this pass.

Thirteen new declarations finish the target map. Nine specialize the existing PMIA character evaluator to the arithmetic pseudomeasure: clearing, scalar ratio, positive powers, odd-character vanishing, finite combinations, the normalized-test Kummer bound, the loss from two denominators, the integral-unit denominator corollary, and weight congruences in a fixed integral-character component. Four comparisons state arithmetic transport to the completed algebra, the odd-prime plus corner, the sign quotient, and finite coefficient extension through actual supplier maps.

At p=3 the degree 2 and 4 arithmetic values differ by 23/60, of norm 3; their normalized denominators explain this loss. The smoothed difference is 15/4, of norm 1/3. Integral parity and odd-character vanishing retain p=2. Integral plus/minus corners require odd p, have identity e⁺ rather than the ambient identity, and use normalized orbit sums. No full-total-quotient character evaluator or unrestricted field-valued inverse-limit measure is inferred.

## Remaining work and ownership

Five PMIA requests specify the exact missing contracts: the actual completed-algebra equivalence; localization, pseudomeasure and quotient-evaluation transport; the normalized odd-prime sign quotient and corner decomposition; finite-extension bounded-measure coefficient maps; and finite-extension admissible pseudomeasure evaluation. Each request names its arithmetic consumers and gives carrier, scalar, denominator and compatibility hypotheses. Each has a matching gap.

The completed group algebra is already owned by upstream ProfiniteProPGroups Layer 9. This packet does not define it again. PMIA owns the generic comparisons; L1 retains only the arithmetic instances. LocallyAnalyticDistributions owns positive-order distributions and analytic transforms; no new such input is needed for these bounded-measure character statements. L2 and L3 are consumers, not new reverse suppliers. The inherited exact node dependency on L2/smoothed-translation-sum is retained for the finite-residue proof; it introduces no new cycle.

A follow-up must discharge these supplier requests, instantiate the four omitted comparison signatures, and elaborate the complete suggested file against matching current supplier modules. The reader gives the exact target matrix and declaration catalogue. No further unnamed L1 target remains outside that matrix.

## Lean boundary

**The current suggested file was not compiled.** No authenticated compiled module matching the current 436-node PMIA supplier was available in the configured existing build. The historical 332-node artifact is not a current compilation receipt. WORKERS prohibits building library dependencies. No compiler was run for this pass; compiler errors and warning counts are unavailable, not zero.

The suggested file carries 157 inherited named signatures and all 163 inherited examples, plus nine new character signatures and eighteen examples. The command index therefore finds 166 named signatures and 181 examples, without duplicate declarations or missing test labels. Four named comparison signatures are explicitly omitted because their owned carriers and maps are unavailable. They are linked to the supplier gaps and are not replaced by assertion fields or fabricated carriers. All implementation statuses remain unchecked.

## Sources and checks

The exact reviewed L1 library-audit row, accepted RS-14 boundaries, touching RS-14/RS-16 links and current stage edges were read. The two complete upstream reader examples were AdicSpaces and ArithmeticDirichletSeries; the specific ProfiniteProPGroups Layer 9 completed-algebra contract was also read. The inherited L1 packet was read in full, with the corresponding split signatures, the split reader's introduction and relevant arithmetic/coverage sections, and the old handoff. Current PMIA character-evaluation and coefficient-test contracts were checked directly; all 60 direct foreign node inputs are bound by InputGuard.json.

Fresh source reading is bounded: published RJW physical pages 16–18, 22–24, 30–33, 37–40, 71–73 and 75–76, plus arXiv v2 pages 26–28 and 55. Published physical page 76 was also inspected visually. SourceAcquisition.json records the PDF and page-text hashes. It does not claim a fresh reading of the whole paper. The published digest is 78d0479b4b7e3f03d2f9c9a75a772ebd75b58091a3b4f8a1558869b8283b44a6; the v2 digest is efa1e10168fb092ffb072bbf147f85f07bea72d2a8f4907d6e9e4fd559c039c4.

The five inherited findings remain unchanged. E34–E36 adopt the previously independently confirmed paper E64–E66 with fresh text/image collation: the minus-component correction, the degree-one Euler-factor and measure-domain correction in Corollary 11.4, and the augmentation paragraph's bound-variable slip. Their prior review is attributed; no own independent verdict or discovery claim is made. A fresh bounded correction search found no correcting publication and does not establish absence or priority.

All 139 inherited native statement readings retain their original dates and provenance. This pass freshly authenticated the 50 cited source files against the Mathlib pin. Exact finite controls make 30,692 assertions using rational Bernoulli values, residue masses, weight periods, denominator losses and the C₂×C₃ sign-quotient normalization. They are finite controls, not proofs of the general measure or localization statements.

The indexed packet checker, source-issue/version checks, four-file intake checks and immutable atlas assembly pass at both the mathematical base and the publication base. The verifier compares all inherited mathematical content, declaration/example indices, finite controls and both immutable dependency graphs. Planet changes alter only the intended L1 atlas points; the explicit PMIA L1 request adds its direct consumer link. Foreign roadmap content and sibling stages remain unchanged.

Only this issue's four deliverables are changed. The public recovery procedure below retains the exact inputs, finite checks and verifier; PDFs and extracted source text are excluded. No Lean process or background job is left running.

## Script: build_nodes.py

```python
"""Arithmetic adapters only; generic carriers remain supplier requests."""
from pathlib import Path
import json,copy
S=Path(__file__).resolve().parent
p=json.loads((S/'ProjectionInput.json').read_text());old=json.loads((S/'Incoming.json').read_text())
SID='DirichletPadicLFunctions:L1';PM='PadicMeasuresIwasawaAlgebras:'
def own(x):return SID+'/'+x
def sup(x):return PM+x
H=[
 'p is any prime, including 2. Z=ℤ_p, K=ℚ_p, U=Zˣ and M=D(U,Z) have their native structures and the supplied commutative multiplicative convolution ring. Q=FractionRing M is a total quotient ring, not assumed to be a field. ζ_p is the existing kubotaLeopoldtPseudomeasure in Iwasawa.pseudomeasures δ Q.',
 'κ,η:U→Z are native ContinuousMonoidHom characters. Every evaluated character is explicitly nontrivial. E_κ denotes the existing PMIA unitCharacterEval, evaluated at ζ_p; it is an additive map on the pseudomeasure module, not a ring map on all of Q. Put d_κ(g)=κ(g)−1 in Z, and include it in K when dividing.',
 'λ_g is the existing padicIntrinsicNumerator on U. For natural a with p∤a, let g∈U have value a; λ_g then equals the existing intrinsicSmoothedNumerator λ_a. Retain the bounded Z-scalar action on K when extending λ_a to the actual K-valued measure μ_a=extendIntegralUnitCoefficients λ_a.'
]
src=[{'sourceId':'RJW-published','locator':'Definition 3.34 and equation (3-11), printed 129–130 / PDF30–31; Lemma 3.36, printed 130–131 / PDF31–32; §4, printed 136–139 / PDF37–40; Remark 2.18, printed 117 / PDF18.',
 'excerpt':'independent','match':'Worker arithmetic specializations of the existing generic character evaluator and the integral smoothing construction. The finite-combination and denominator-loss estimates are derived here, not separately numbered source theorems. The unsmoothed blanket congruence is corrected as recorded in E10; no value at the trivial character is asserted.'}]
new=[]
def test(name,kind,statement):return {'name':'SuggestedArithmeticCharacterTests.'+name,'kind':kind,'statement':statement}
def add(slug,title,kind,statement,steps,deps,tests,accept,hyp=None,source=None,decl=None):
 n={'id':own(slug),'parentStageId':SID,'realises':[SID],'title':title,'kind':kind,'statement':statement,'hypotheses':hyp or H,'proofSteps':steps,'prerequisites':deps,'library':{'module':'TauCeti/NumberTheory/DirichletPadic/ArithmeticCharacters','namespace':'DirichletPadic','declaration':'DirichletPadic.'+(decl or slug.replace('-','_'))},'sources':source or src,'tests':tests,'acceptance':accept,'implementationStatus':'unchecked'}
 new.append(n);return n
add('arithmetic-character-clearing','Character evaluation of every arithmetic numerator','lemma',
 'For every g∈U, λ_g(κ), included in K, equals d_κ(g) E_κ(ζ_p). This includes κ(g)=1.',
 ['Apply the exact supplier unitCharacterEval_numerator to the actual ζ_p. Its numerator is the supplier Iwasawa.numerator at g.',
  'Substitute arithmetic-pseudomeasure-numerator, which identifies that numerator with λ_g as an integral measure. The inclusion Z→K carries the scalar evaluation. No division or regularity condition on θ_g is used.'],
 [own('arithmetic-pseudomeasure-numerator'),sup('L3/actual-unit-character-numerator')],
 [test('identity_clearing','degenerate','At g=1, both sides are zero for every nontrivial κ.'),test('zero_denominator_numerator','compatibility','If κ(g)=1, λ_g(κ)=0 even when λ_g is not the zero measure.')],
 ['A zero scalar denominator gives a vanishing numerator, not a value for the trivial character.'],decl='kubotaLeopoldt_character_clearing')
add('arithmetic-character-ratio','The arithmetic character ratio','theorem',
 'If κ(g)≠1, E_κ(ζ_p)=λ_g(κ)/d_κ(g) in K. For g of natural value a, the numerator is λ_a(κ).',
 ['Apply the supplier actual-unit-character-ratio to ζ_p at this g; its hypothesis is κ(g)≠1, not regularity of δ_g−1.',
  'Replace the supplier numerator using arithmetic-pseudomeasure-numerator. For a natural g, use padic-intrinsic-natural. Division occurs only in K, where the indicated scalar is nonzero.'],
 [own('arithmetic-pseudomeasure-numerator'),own('padic-intrinsic-natural'),sup('L3/actual-unit-character-ratio')],
 [test('ratio_sign_parameter','compatibility','For κ(−1)=−1, the numerator and the ratio at g=−1 are zero, including p=2.'),test('ratio_two_parameters','characterisation','Two units g,h with κ(g)≠1 and κ(h)≠1 give equal ratios.')],
 ['A torsion parameter may evaluate to a nonzero scalar although its difference is a zero divisor in M.'],decl='kubotaLeopoldt_character_ratio')
add('arithmetic-character-positive','Power characters recover the interpolation values','comparison',
 'If k≥1 and κ(u)=u^k for all u∈U, then E_κ(ζ_p)=−(1−p^(k−1))B_k/k in K.',
 ['Use the exact supplier actual-unit-character-positive-moment comparison at the same native character and exponent.',
  'Apply arithmetic-positive-bernoulli to the resulting positivePseudoMoment. The rational Bernoulli expression is included canonically in K. At k=1 the Euler factor gives zero.'],
 [own('arithmetic-positive-bernoulli'),sup('L3/actual-unit-character-positive-moment')],
 [test('positive_first','degenerate','The character u↦u has value zero for every p.'),test('positive_ternary_second','computation','At p=3, the character u↦u² has arithmetic value 1/6.')],
 ['Nontriviality remains explicit in the signature and is available for every positive power from the supplier positive-character admissibility. No complex-to-p-adic field map is used.'],decl='kubotaLeopoldt_character_positive')
add('arithmetic-character-odd','Odd characters vanish','theorem',
 'If κ(−1)=−1, then E_κ(ζ_p)=0 for every prime p.',
 ['The scalar d_κ(−1)=−2 is nonzero in K, including K=ℚ₂. Also κ cannot be the trivial character, since Z has characteristic zero.',
  'Use arithmetic-character-ratio at g=−1 and padic-intrinsic-negative-identity to make its numerator zero. This proves vanishing without constructing an integral half-idempotent.'],
 [own('arithmetic-character-ratio'),own('padic-intrinsic-negative-identity')],
 [test('odd_dyadic','compatibility','At p=2 every character with κ(−1)=−1 has arithmetic value zero.'),test('odd_is_nontrivial','non-example','The trivial character does not satisfy κ(−1)=−1.')],
 ['This arithmetic vanishing statement is valid at p=2; the integral plus-corner comparison requires p odd.'],decl='kubotaLeopoldt_character_odd')
add('arithmetic-character-combination','Finite character combinations through one smoothing measure','lemma',
 'For finite I, characters κ_i≠1, coefficients c_i∈K and a common natural smoothing parameter a with d_i=κ_i(g)−1≠0, ∑_i c_i E_(κ_i)(ζ_p)=μ_a(f), where f(u)=∑_i (c_i/d_i)κ_i(u) in C(U,K).',
 ['Apply arithmetic-character-ratio separately to each κ_i at the same natural-valued g. The natural numerator comparison changes λ_g to λ_a.',
  'The exact integral-unit-extension-test-function compares μ_a on the scalar-extended κ_i with the inclusion of λ_a(κ_i). All κ_i are continuous integral tests, so this supplier applies.',
  'Use K-linearity of the existing continuous functional μ_a to combine the finite sum and the scalar c_i/d_i. The result is evaluation at the displayed continuous function.'],
 [own('arithmetic-character-ratio'),own('intrinsic-numerator'),sup('L2/integral-unit-extension-test-function'),'mathlib:AbstractMeasure.toCLMEquiv'],
 [test('combination_empty','degenerate','For the empty index set, both sides are zero.'),test('combination_single','compatibility','For one character with c=d_κ(g), the identity gives d_κ(g)E_κ(ζ_p)=μ_a(κ).')],
 ['The same integral measure evaluates every summand; allowing a different smoothing measure in each term would not yield this identity.'],decl='kubotaLeopoldt_character_combination')
add('arithmetic-character-kummer','Denominator-qualified character Kummer bound','theorem',
 'Under arithmetic-character-combination, if B≥0 and ‖∑_i(c_i/d_i)κ_i(u)‖≤B for every u∈U, then ‖∑_i c_i E_(κ_i)(ζ_p)‖≤B.',
 ['The function f in arithmetic-character-combination is a continuous K-valued function on compact U. Its pointwise bound gives its native supremum norm at most B.',
  'The existing intrinsic-numerator-norm gives ‖toCLMEquiv μ_a‖≤1. The native continuous-linear-map operator-norm bound gives ‖μ_a(f)‖≤B.',
  'Replace μ_a(f) by the exact finite combination. The case B=p^(−r), r≥0, is the denominator-cleared congruence; no denominators are silently discarded.'],
 [own('arithmetic-character-combination'),own('intrinsic-numerator-norm'),'mathlib:ContinuousMap.norm_le','mathlib:ContinuousLinearMap.le_opNorm_of_le'],
 [test('kummer_zero_function','characterisation','If the normalized test sum is identically zero, the character-value combination is zero.'),test('kummer_ternary_control','computation','At p=3,a=2, d₂ E₂−d₄ E₄=15/4 has norm 1/3, whereas E₂−E₄=23/60 has norm 3.')],
 ['The normalized continuous test is the hypothesis. This does not assert a uniform bound for ζ_p as a field-valued measure; arithmetic-no-field-measure rules that out.'],decl='kubotaLeopoldt_character_kummer')
add('arithmetic-character-difference','Precision loss from the two smoothing denominators','theorem',
 'For κ,η≠1, natural a prime to p with g of value a, and nonzero d_κ(g),d_η(g), if ε≥0 and ‖κ(u)−η(u)‖≤ε for all u∈U, then ‖E_κ(ζ_p)−E_η(ζ_p)‖≤ε/(‖d_κ(g)‖‖d_η(g)‖).',
 ['Use arithmetic-character-combination with the two coefficients 1 and −1. The normalized test is κ/d_κ−η/d_η.',
  'Clear its two nonzero scalar denominators. Its numerator is d_η(κ−η)+(d_η−d_κ)η. Character values are units of Z because characters are monoid maps from U; hence their K-norm is one. Integral d_η has norm at most one.',
  'The global pointwise difference bound also bounds d_η−d_κ=η(g)−κ(g). The ultrametric inequality therefore bounds the cleared numerator by ε. Divide by the positive norms of the two denominators.',
  'Apply arithmetic-character-kummer to this pointwise bound. No proximity assumption on a or regularity of δ_g−1 is required.'],
 [own('arithmetic-character-combination'),own('arithmetic-character-kummer'),'mathlib:PadicInt.norm_units','mathlib:PadicInt.norm_le_one'],
 [test('difference_equal_characters','degenerate','For η=κ and ε=0 the arithmetic difference is zero.'),test('difference_ternary_loss','computation','At p=3,a=2, κ(u)=u² and η(u)=u⁴ are congruent modulo 3; the bound is (1/3)/((1/3)(1/3))=3 and is attained by 23/60.')],
 ['Both denominator norms are indispensable. The ternary example disproves replacement of the right side by ε without further hypotheses.'],decl='kubotaLeopoldt_character_difference')
add('arithmetic-character-unit-denominators','Integral-unit denominators preserve character precision','theorem',
 'Under arithmetic-character-difference, if both d_κ(g) and d_η(g) are units in Z, then ‖E_κ(ζ_p)−E_η(ζ_p)‖≤ε.',
 ['The native p-adic unit norm is one for each denominator. Substitute those norms into arithmetic-character-difference.'],
 [own('arithmetic-character-difference'),'mathlib:PadicInt.norm_units'],
 [test('unit_denominator_quinary','computation','At p=5,a=2, the degree 2 and 6 denominators are units; the arithmetic difference −760/63 has norm 1/5.'),test('dyadic_no_unit_denominator','non-example','At p=2 every integral character value is a unit congruent to 1 modulo 2, so κ(g)−1 is never an integral unit.')],
 ['The fixed-character application includes character components without importing an analytic branch or a Teichmüller splitting from L3. The unit-denominator corollary has no dyadic instances.'],decl='kubotaLeopoldt_character_unit_denominators')
add('arithmetic-fixed-character-weight-period','Weight congruences in a fixed character component','theorem',
 'Fix an integral continuous character α. Suppose κ(u)=α(u)u^k and η(u)=α(u)u^l, with k,l≥1, r≥1 and k≡l mod p^(r−1)(p−1). If both smoothing denominators at the same natural parameter a are integral units, then ‖E_κ(ζ_p)−E_η(ζ_p)‖≤p^(−r).',
 ['Map u to a unit modulo p^r. The native Euler theorem, the prime-power totient formula and the equality-of-powers theorem for congruent exponents give equal kth and lth powers in ZMod(p^r).',
  'The native reduction kernel and its ideal/norm-ball comparison imply ‖u^k−u^l‖≤p^(−r). Multiply by α(u), whose norm is one, to obtain the required difference bound between κ(u) and η(u). This calculation is the finite-unit argument already used for smoothed weight periods, not an analytic branch construction.',
  'Apply arithmetic-character-unit-denominators. The denominator-unit hypotheses in particular exclude trivial evaluated characters; their nontriviality certificates are retained explicitly in the signature.'],
 [own('arithmetic-character-unit-denominators'),'mathlib:PadicInt.toZModPow','mathlib:PadicInt.ker_toZModPow','mathlib:PadicInt.norm_le_pow_iff_mem_span_pow','mathlib:ZMod.pow_totient','mathlib:Nat.totient_prime_pow','mathlib:pow_eq_pow_of_modEq','mathlib:PadicInt.norm_units','mathlib:PadicInt.norm_def'],
 [test('fixed_component_identity','degenerate','For k=l the arithmetic difference is zero for every fixed α satisfying the stated denominator conditions.'),test('fixed_component_trivial_factor','compatibility','For α=1 the statement agrees with the existing unit-denominator Bernoulli congruence after the positive-character comparison and its minus sign.')],
 ['The finite-order Teichmüller components are instances of α, once supplied by their existing owner. No finite-order hypothesis is needed for this stronger integral-character version.'],decl='kubotaLeopoldt_fixed_character_weight_period')

transportsrc=[{'sourceId':'RJW-published','locator':'Proposition 3.16, printed 122–123 / PDF23–24; Definition 3.34 and Lemma 3.36, printed 130–131 / PDF31–32; Definitions 4.9–4.10 and Proposition 4.11, printed 138–139 / PDF39–40; Lemmas 11.1–11.3 and Corollary 11.4, printed 174–175 / PDF75–76.','excerpt':'pseudo-measure','match':'Arithmetic transport through the completed-algebra, sign-quotient and coefficient maps requested from their existing PMIA owners. The generic comparison proofs are not duplicated here. Lemma 11.3 uses the minus component for odd moments (paper E64); Corollary 11.4 requires the k=1 Euler factor and application to integral numerators (paper E65).'}]
T=[H[0],
 'A=completedGroupAlgebra p U is the existing upstream Layer 9 carrier. E:M≃ₐ[Z]A is the requested PMIA measure/completed-algebra comparison, with E(δ_g)=[g]. E_Q:FractionRing M≃ₐ[Z]FractionRing A is its requested localization extension and sends the actual pseudomeasure submodule to P_A. Its construction and finite-level normalization are supplier obligations, not hypotheses replacing arithmetic proof.',
 'Write ζ_A=E_Q(ζ_p) and λ_g^A=E(λ_g) only as notation for these images; no second generic pseudomeasure or measure carrier is introduced.'
]
add('arithmetic-completed-transport','Completed-algebra form of the arithmetic pseudomeasure','comparison',
 'The image ζ_A has cleared numerator ([g]−1)ζ_A=λ_g^A for every g. It is the unique element of P_A with these numerators, and equals λ_u^A/([u]−1) for every regular smoothing parameter u.',
 ['Apply E_Q to arithmetic-pseudomeasure-clearing, using its compatibility with the integral algebra maps and E(δ_g)=[g]. This proves the full integral numerator family in A.',
  'For uniqueness, pull any competing pseudomeasure back along the supplier equivalence P_M≃P_A and apply arithmetic-pseudomeasure-unique.',
  'Transport arithmetic-pseudomeasure-regular-parameter using preservation and reflection of regular elements under E. The native localization extension is unique, so this image agrees with the source fraction at every admissible regular smoothing parameter.'],
 [own('arithmetic-pseudomeasure-clearing'),own('arithmetic-pseudomeasure-unique'),own('arithmetic-pseudomeasure-regular-parameter'),sup('L1'),sup('L3')],[],
 ['At g=1 and g=−1 the cleared numerators are zero. The transport is not an identification of M with an arbitrary formal power-series ring. Its exact Lean statement awaits the owned completed-algebra comparison carrier and maps.'],hyp=T,source=transportsrc,decl='kubotaLeopoldt_completed_comparison')
add('arithmetic-plus-corner','The arithmetic element in the odd-prime plus corner','lemma',
 'For p odd, with e⁺=(1+[−1])/2 in A, e⁺ζ_A=ζ_A and e⁺λ_g^A=λ_g^A for every g.',
 ['Transport the all-prime integral parity equations for ζ_p and λ_g through E_Q and E.',
  'Since p is odd, 2 is a unit of Z; distribute the scalar half over the sum of the identity and sign actions. Both terms fix the arithmetic objects, giving the asserted equalities.',
  'The corner A⁺=e⁺A has identity e⁺. Treating its inclusion into A as a unital homomorphism would be wrong; use the requested product decomposition A≃A⁺×A⁻ for localization comparisons.'],
 [own('arithmetic-completed-transport'),own('arithmetic-pseudomeasure-even'),own('padic-intrinsic-even'),sup('L1')],[],
 ['At p=2 only the inherited integral parity is asserted. No integral division by 2 or plus/minus splitting is inferred. The corner carriers and their localization maps await the exact PMIA request.'],hyp=T+['p≠2; A⁺ and A⁻ are the requested actual idempotent corner rings.'],source=transportsrc,decl='kubotaLeopoldt_completed_plus')
add('arithmetic-sign-quotient','Arithmetic descent through the sign quotient','comparison',
 'For p odd, the actual quotient q:U→U/{±1} and its completed-algebra map q_* send ζ_A to a pseudomeasure ζ_bar with ([q(g)]−1)ζ_bar=q_*(λ_g^A) for every g. Under the supplier plus-corner equivalence its lift is ζ_A, and even nontrivial character evaluations agree.',
 ['The requested normalized plus-corner equivalence sends e⁺[g] to [q(g)]. The unnormalized orbit sum [g]+[−g] maps to 2[q(g)], which is why the scalar half is retained.',
  'Use the supplier product decomposition and total-quotient projection to send the arithmetic image ζ_A to the plus component and then the quotient ring. Its plus-corner identity is supplied by arithmetic-plus-corner.',
  'Apply the resulting localization map to every clearing identity. For any quotient unit h choose a lift g along the surjective q; its integral numerator q_*(λ_g^A) proves actual pseudomeasure membership. If g is replaced by −g, the intrinsic cocycle and λ_−1=0 identify the numerators.',
  'For an even nontrivial character κ, its unique descended character κ_bar is nontrivial. Choose a g with κ(g)≠1. The supplier evaluation naturality and the arithmetic character ratio give identical numerator values and nonzero scalar denominators. Their ratios agree.'],
 [own('arithmetic-plus-corner'),own('arithmetic-character-ratio'),own('padic-intrinsic-cocycle'),own('padic-intrinsic-negative-identity'),sup('L1'),sup('L3')],[],
 ['Uniqueness of the lifted arithmetic element uses the actual plus-corner equivalence; no arbitrary choice of representative defines a measure. Exact quotient, corner and localization signatures are omitted until their supplier maps exist.'],hyp=T+['p≠2. The supplier uses the closed sign subgroup {1,−1}, the actual topological quotient group, its completed group algebra and its normalized plus-corner equivalence.'],source=transportsrc,decl='kubotaLeopoldt_sign_quotient_comparison')
add('arithmetic-coefficient-naturality','Coefficient extension of the arithmetic pseudomeasure','comparison',
 'For finite complete valued extensions K⊂L of ℚ_p with compatible continuous scalar embeddings, the requested bounded-measure localization maps carry ζ_p to ζ_K and then to ζ_L. They carry λ_g to its actual coefficient extensions and preserve every admissible character value; extension to ℚ_p agrees with the existing integral-to-field measure extension.',
 ['The supplier constructs the continuous coefficient extension on actual bounded unit measures and proves that the smoothing denominator at a=p+1 remains regular. Map the defining arithmetic fraction using these actual localization maps.',
  'Coefficient extension commutes with the actual inverse weighting, restriction and unit inclusion by the requested operator comparison; thus the mapped numerator is the coefficient extension of the existing λ_g. Apply the all-unit clearing identity to obtain pseudomeasure membership over each coefficient field.',
  'For a character κ:U→Kˣ with κ(g)≠1, the requested admissible evaluation is its integral numerator value divided by κ(g)−1. Injectivity of K→L preserves this nonzero condition; compatibility of integral evaluation gives exactly the image scalar in L.',
  'Identity and composition follow from the supplier coefficient maps and uniqueness of localization extension. The integral Q_p descent and inclusion square already present in nodes 54 and 65 supply the base comparison; no L1 dependency on its L2/L3 consumers is added.'],
 [own('arithmetic-pseudomeasure'),own('arithmetic-pseudomeasure-clearing'),own('smoothed-extension-integral-descent'),own('intrinsic-numerator-extension-inclusion'),sup('L2'),sup('L3')],[],
 ['The target is the bounded K-valued measure algebra. It is not the unrestricted inverse limit of K-valued finite measures. General coefficients do not justify evaluating a zero smoothing denominator, and no map ℂ→K is used. Exact finite-extension localization and evaluator signatures await their supplier.'],hyp=[H[0],'K and L are finite extensions of ℚ_p with their complete ultrametric field structures; embeddings are continuous, injective and compatible with the given ℤ_p-algebra maps. All coefficient operator and localization maps are the exact requested PMIA maps.'],source=transportsrc,decl='kubotaLeopoldt_coefficient_naturality')

# Resolve spellings against the existing packet before exposing dependencies.
ids={n['id']for n in p['nodes']+new}
for n in p['nodes']:
 if 'weight' in n['id'] and 'congruence' in n['id']:print('weight candidate',n['id'])
for n in new:
 for d in n['prerequisites']:
  if d.startswith(SID+'/')and d not in ids:print('UNRESOLVED',d)
requests=[
 {'supplier':sup('L1'),'neededBy':[own('arithmetic-completed-transport')],'need':'Supply the actual Z_p-algebra homeomorphism E:D(Z_pˣ,Z_p)≃completedGroupAlgebra p Z_pˣ over the native upstream ProfiniteProPGroups Layer 9 carrier. Match all finite quotient coefficients through the cofinal unit-reduction kernels; E(δ_g)=[g], E(1)=1, and E preserves the existing multiplicative convolution. Supply inverse and quotient-pushforward naturality. Current PMIA finite unit coordinates and their topology are inputs, not already this comparison.'},
 {'supplier':sup('L3'),'neededBy':[own('arithmetic-completed-transport'),own('arithmetic-sign-quotient')],'need':'Extend the actual measure/completed-algebra isomorphism to the native localizations at nonZeroDivisors and to the existing pseudomeasure submodules, with integral-inclusion and numerator naturality. For the odd-prime product decomposition A≃A⁺×A⁻, supply the genuine projection FractionRing A→FractionRing A⁺ and the extension of A⁺≃completedGroupAlgebra p (U/{±1}); prove preservation of regular denominators via the product decomposition, all-unit numerator membership, and admissible even-character evaluation compatibility. No ring evaluator on the whole total quotient is assumed.'},
 {'supplier':sup('L1'),'neededBy':[own('arithmetic-plus-corner'),own('arithmetic-sign-quotient')],'need':'For p≠2, supply the native closed sign quotient U/{±1}, the actual completed-algebra quotient map, corners A⁺=e⁺A and A⁻=e⁻A with their own identities e⁺,e⁻, the product decomposition, and the normalized isomorphism A⁺≃completedGroupAlgebra p (U/{±1}) sending e⁺[g] to [q(g)]. Derive this on compatible finite quotients before passage to the limit. The unscaled orbit sum maps to twice the quotient basis vector; make that normalization explicit. This generic source Lemma 11.2 interface is owned by PMIA, not duplicated in L1.'},
 {'supplier':sup('L2'),'neededBy':[own('arithmetic-coefficient-naturality')],'need':'Extend the existing actual integral coefficient-extension maps to compatible finite complete valued extensions K⊂L of Q_p on bounded continuous-dual measures over U and Z_p. Supply identity/composition, integral-test evaluation, convolution/Dirac compatibility, and commuting squares for intrinsic restriction, unit inclusion, psi, Frobenius and inverse weighting on their stated domains. Preserve bounded scalar hypotheses. This is the finite-extension measure carrier, not the unrestricted inverse limit of field-valued finite measures.'},
 {'supplier':sup('L3'),'neededBy':[own('arithmetic-coefficient-naturality')],'need':'For those actual bounded finite-extension coefficient maps, prove preservation of regular elements needed for localization (in particular θ_(p+1)), construct the corresponding native total-quotient and pseudomeasure maps, and the admissible continuous K-valued character evaluator with its numerator ratio and base-change law. Prove nonzero scalar denominators persist under the injective coefficient embedding. The current Q_p-valued integral-character evaluator is reused in its scope; a finite-extension evaluator or entire-total-quotient ring evaluator is not silently inferred.'}
]
(S/'NewNodes.json').write_text(json.dumps(new,ensure_ascii=False,indent=2)+'\n')
(S/'Requests.json').write_text(json.dumps(requests,ensure_ascii=False,indent=2)+'\n')
print('new nodes',len(new),'requests',len(requests))
```

## Script: assemble.py

```python
from pathlib import Path
import json,collections,hashlib
S=Path(__file__).resolve().parent;R=Path.cwd();STEM='DirichletPadicLFunctions--L1';SID='DirichletPadicLFunctions:L1'
save=lambda n,x:(S/n).write_text(json.dumps(x,ensure_ascii=False,indent=2)+'\n')
old=json.loads((S/'Incoming.json').read_text());p=json.loads((S/'ProjectionInput.json').read_text());new=json.loads((S/'NewNodes.json').read_text())
p['nodes']+=new;p['requests']=json.loads((S/'Requests.json').read_text())
p['sourceIssues']+=json.loads((S/'SourceIssueAdditions.json').read_text())
# Retain all mathematics; make the planet selection represent the full target.
planets={'smoothed-series':'Smoothed power series','smoothed-measure':'Smoothed measure','unit-smoothed-moment':'Unit Euler-factor formula','arithmetic-pseudomeasure':'Kubota–Leopoldt pseudomeasure','arithmetic-positive-interpolation':'Kubota–Leopoldt interpolation','unit-denominator-kummer':'Kummer congruences'}
for n in p['nodes']:
 n.pop('planet',None)
 if n['id'].rsplit('/',1)[-1]in planets:n['planet']={'name':planets[n['id'].rsplit('/',1)[-1]]}
p['status']='complete';p['summary']='Complete L1 planning pass: preserve 121 arithmetic nodes, expose 32 inherited declaration names, and add 13 character/congruence and transport comparisons. Integral parity includes p=2. Five precise PMIA requests remain, with four corresponding Lean comparison signatures explicitly omitted until their owned carriers/maps exist. Nothing is claimed implemented or closed.'
titles=['Actual completed-algebra comparison','Localization and quotient evaluation transport','Normalized odd-prime sign quotient','Finite-extension bounded measure coefficients','Finite-extension admissible pseudomeasure evaluation']
p['gaps']=[{'title':title,'neededBy':r['neededBy'],'detail':r['need']}for title,r in zip(titles,p['requests'])]
p['coverage']=[{'stageId':SID,'status':'planned','remaining':[title+': '+r['need']for title,r in zip(titles,p['requests'])]+['Elaborate the exact L1 suggested file against a matching current PMIA artifact; supply its four explicitly omitted comparison signatures when the owned carriers and maps exist. Current compilation is unavailable, not successful.']}]
p['provenance']['l1TargetCompletion']={'by':'Codex — codex-7e92bd','job':'BP-'+STEM,'issue':5879,'mathematicalBase':(S/'base.txt').read_text().strip(),'preservation':'All 121 inherited mathematical statements, hypotheses, proof steps, prerequisites, APIs, tests and source entries are unchanged. 24 absent declaration names were added, eight short names qualified, and six planet selections reconciled with the complete layer. Historical combined-packet records remain attributed to their original continuations.','freshReading':json.loads((S/'SourceAcquisition.json').read_text()),'scope':'Only L1. The maintainer-added DKV inputs belong to L3. RJW character, logarithmic and Eisenstein targets remain in their existing L0/L2/L3/L4 owners. Generic completed algebra, corner, coefficient and localization theory is requested from PMIA; its upstream algebra carrier is owned by ProfiniteProPGroups Layer 9.','sourceFindings':'E34–E36 adopt the already independently confirmed paper E64–E66 with fresh local collation; no new discovery or own independent review verdict is asserted.'}
counts={'nodes':len(p['nodes']),'inherited':121,'new':len(new),'kinds':dict(collections.Counter(n['kind']for n in p['nodes'])),'API':sum(len(n.get('api',[]))for n in p['nodes']),'tests':sum(len(n.get('tests',[]))for n in p['nodes']),'planets':sum(bool(n.get('planet'))for n in p['nodes']),'baseline':len(p['baseline']['declarations']),'gaps':len(p['gaps']),'requests':len(p['requests']),'sourceIssues':len(p['sourceIssues'])};save('Counts.json',counts)
p['checks']={'inheritedCombinedHistory':{'scope':'Historical combined-roadmap checks, preserved as history rather than checks of the current split L1 file.','record':old['checks']},'currentL1':{'counts':counts,'allImplementationUnchecked':True,'typing':json.loads((S/'Typing.json').read_text()),'finiteControls':json.loads((S/'Finite.json').read_text()),'baseline':'139 existing statement-read records retained with their original provenance. All 50 cited source modules freshly authenticated at the Mathlib pin; no declaration was added to the native baseline.','closure':'Every stated L1 target is represented by its existing arithmetic nodes or the 13 new arithmetic adapters. Five supplier gaps remain; planned does not mean closed or implemented.'}}
rows=[
 ('Integral cancellation and the actual smoothing measure',range(0,24),'The native binomial denominator has unit constant a. Its inverse constructs F_a without inverting T; native Amice inversion constructs μ_a and the Bernoulli moments.'),
 ('Restriction, inverse weighting and integral numerators',range(24,67),'The exact PMIA operators supply restriction, Frobenius, psi, inverse weighting and intrinsic extension/restriction. L1 proves the arithmetic identities and coefficient comparisons.'),
 ('All-unit construction and the arithmetic pseudomeasure',range(72,108),'Binomial-ring coefficients extend smoothing to every p-adic unit. Cross numerators and the actual regular denominator at p+1 construct ζ_p, with positive interpolation and uniqueness. Integral parity includes 2.'),
 ('Qualified Kummer congruences',list(range(67,72))+list(range(121,130)),'The new continuous-character arithmetic evaluations reuse PMIA. Finite combinations and the two-denominator estimate expose exactly when an unsmoothed congruence is valid.'),
 ('Nonintegrality, unboundedness and finite residue masses',range(108,121),'Bernoulli valuations exclude every bounded field-valued measure with these pseudomoments. The actual finite projections retain their carry counts and integral bounds.'),
 ('Completed algebra, sign quotient and coefficients',range(130,134),'Four arithmetic comparisons state the remaining targets through five precise generic supplier requests. Odd-prime corners use identity e⁺ and normalized orbit sums; finite coefficient extension uses bounded measures.')]
targets=[{'target':t,'nodes':[p['nodes'][i]['id']for i in ids],'boundary':b}for t,ids,b in rows];save('TargetMap.json',targets)
reader='''# The smoothed measure and Kubota–Leopoldt

This layer plans the integral smoothing construction, its arithmetic pseudomeasure and its positive interpolation values, together with qualified Kummer congruences and the comparisons used by the character and logarithmic applications. The planning pass is complete at 134 declarations. L1 is planned, with five explicit supplier gaps; it is neither closed nor implemented.

## Objects and conventions

Fix any prime p, including 2. Write Z=ℤ_p, K=ℚ_p and U=Zˣ with their native topologies. D(X,R) is the existing continuous-linear-functional measure carrier. The unit-domain algebra M=D(U,Z) uses multiplicative convolution; the ambient measure space D(Z,Z) uses the additive group when convolution is mentioned. Unit inclusion is a linear pushforward, not a homomorphism between those two convolution algebras.

For a natural a prime to p, put q_a(T)=Σ_n binomial(a,n+1)T^n and b_a(T)=Σ_n binomial(a,n+2)T^n. The constant of q_a is the unit a. The integral series F_a=b_a/q_a satisfies Tq_aF_a=q_a−a. Native multiplication-by-T injectivity proves the cleared identities even over coefficient rings with zero divisors. No inverse of T is used. At a=2, F_a=1/(2+T), with constant 1/2; this fixes the source's incorrect sign in its geometric expansion.

The native inverse Amice transform gives μ_a. Its kth ordinary moment is (1−a^(k+1))B_(k+1)/(k+1), using B_1=−1/2. The supplied psi operator fixes μ_a. Unit restriction therefore has moments multiplied by 1−p^k. Inverse weighting by the existing p-adic inverse, zero outside the units, gives the unit-supported numerator ν_a; intrinsic restriction gives λ_a on U. For k≥1 its moment is (1−p^(k−1))(1−a^k)B_k/k. Its degree-one value is zero because of the Euler factor, although ζ(0)=−1/2.

The binomial-ring construction extends these objects to every u∈U, with coefficientwise and weak continuity as stated in the catalogue. The boundary measures are μ_1=0 and μ_−1=−δ_0, but both intrinsic numerators λ_1 and λ_−1 are zero. Inverse weighting removes the scalar from the raw smoothing cocycle, giving λ_(uv)=λ_u+δ_uλ_v. Thus (δ_v−1)λ_u=(δ_u−1)λ_v. All these are integral identities, also at p=2.

Let Q=FractionRing M be the native localization at non-zero-divisors; it is not assumed to be a field. The actual unit of value p+1 has a regular Dirac difference by PMIA. It need not generate the full unit group. The fraction ζ_p=λ_(p+1)/(δ_(p+1)−1) clears every unit difference to the integral numerator λ_g. This proves membership in the existing pseudomeasure submodule and independence of every regular smoothing denominator. A torsion difference such as δ_−1−1 is not regular, although it remains a valid index of a cleared numerator.

The positive pseudomoments are −(1−p^(k−1))B_k/k, k≥1. The comparison with the complex zeta value uses a shared rational number with separate embeddings; it does not posit a map from ℂ to K. Every positive degree is needed for the uniqueness theorem. The growing Bernoulli norms show that these values cannot be the moments of any bounded K-valued measure.

## Characters and precision

A character is the existing native ContinuousMonoidHom U Z. The evaluator is PMIA's additive map on the pseudomeasure module and is used only at a nontrivial character. For every g, λ_g(κ)=d_κ(g)E_κ(ζ_p), where d_κ(g)=κ(g)−1. If this scalar is nonzero, division in K gives the arithmetic ratio. Regularity of δ_g−1 is not needed for scalar evaluation. At κ(−1)=−1, using λ_−1=0 proves vanishing, including in ℚ₂.

At a common natural smoothing parameter, a finite linear combination of character values is evaluation of the single bounded measure μ_a=extendIntegralUnitCoefficients λ_a at the function Σ_i(c_i/d_i)κ_i. Its operator norm is at most one. A pointwise bound B≥0 for this normalized test therefore bounds the arithmetic combination by B.

For two characters that differ pointwise by at most ε, the difference of their arithmetic values is bounded by ε/(‖d_κ‖‖d_η‖). To see the loss, the numerator of κ/d_κ−η/d_η is d_η(κ−η)+(d_η−d_κ)η. Character values have norm one, and the two terms have norm at most ε. Removing both denominator norms requires that both denominators be units of Z.

At p=3,a=2, degrees 2 and 4 have smoothed difference 15/4 of norm 1/3. Their unsmoothed arithmetic difference is 23/60 of norm 3, attaining the denominator-loss bound. At p=5,a=2, degrees 2 and 6 have unit denominators and difference −760/63 of norm 1/5. At p=2 every integral character value is a unit congruent to 1 modulo 2, so the unit-denominator corollary has no instances; the smoothed bounds still apply.

Fixing an integral character α and comparing α(u)u^k with α(u)u^l gives a precise component statement. For k,l≥1 and r≥1, congruence modulo p^(r−1)(p−1) makes the unit powers agree modulo p^r by the finite Euler theorem. Multiplication by α preserves the norm. The arithmetic congruence follows with the same two denominator-unit hypotheses. Teichmüller components are instances through their existing owner; no analytic branch or coefficient field is constructed here.

## Comparison boundaries

The completed algebra is the existing ProfiniteProPGroups Layer 9 object. PMIA must supply its actual measure-algebra equivalence, finite-quotient compatibility and localization extension. Transporting the arithmetic clearing equations then characterizes the same ζ in this carrier. An abstract ring with a field asserting the desired comparison would not supply this missing construction.

For odd p, the transported arithmetic element and its numerators lie in the plus corner. Its identity is e⁺=(1+[−1])/2. Under the actual sign quotient, e⁺[g] maps to [q(g)], whereas [g]+[−g] maps to twice that basis vector. PMIA must construct the corner decomposition and the induced total-quotient maps. Surjectivity of the quotient gives all-unit numerator witnesses; the integral cocycle identifies the two sign-related lifts. Even nontrivial character evaluations then agree through the same numerator ratio. Integral parity alone does not give a dyadic idempotent splitting.

Finite valued coefficient extensions use the actual bounded measure algebras and continuous compatible scalar maps. The PMIA requests specify preservation of the required regular denominators, actual localization and pseudomeasure maps, and admissible evaluation naturality. The arithmetic image is obtained by mapping its defining fraction and its integral numerators. The target is not the unrestricted inverse limit of field-valued finite measures. Existing ℚ_p descent and intrinsic inclusion squares are retained; L2 and L3 consume this arithmetic comparison and are not new reverse suppliers.

## Target map

'''
for row in targets:reader+='### '+row['target']+'\n\n'+row['boundary']+'\n\n'+', '.join(row['nodes'])+'.\n\n'
reader+='## Exact supplier requests\n\n'
for title,r in zip(titles,p['requests']):reader+='### '+title+'\n\nOwner: '+r['supplier']+'.\n\n'+r['need']+'\n\nConsumers: '+', '.join(r['neededBy'])+'.\n\n'
reader+='''## Sources and validation scope

The primary source is Rodrigues Jacinto–Williams, [*An introduction to p-adic L-functions*](https://msp.org/ent/2025/4-1/p03.xhtml), especially §4, the evaluation construction in §3.6, Remark 2.18, and §11.1. This pass freshly read the complete published physical pages 16–18, 22–24, 30–33, 37–40, 71–73 and 75–76, and preprint v2 pages 26–28 and 55. Published page 175 / physical 76 was also checked as an image. The source acquisition receipt records hashes and this bounded scope, not a whole-paper reading claim.

The five inherited L1 source findings retain their original evidence. E34–E36 adopt the already independently confirmed paper findings E64–E66: the odd-moment proof needs the minus component; the parity corollary needs the zero degree-one Euler factor and a measure-level application to cleared numerators; and the augmentation paragraph has an inconsistent bound variable. The adoption is not a new independent review or discovery claim.

All 121 inherited mathematical nodes, APIs and tests remain unchanged. Historical combined-roadmap compilation and source-read records remain history. The current pass authenticates all 50 source files for the 139 cited native declarations. The fresh exact controls make 30,692 rational and finite-group assertions, including the normalized sign quotient and the unsmoothed negative control. They do not prove the infinite-level comparison requests.

The current full suggested file was not compiled: no authenticated compiled module matching the current PMIA supplier is available in the configured existing build, and building library dependencies is prohibited. Nine new character signatures and eighteen examples are written against the actual supplier objects. Four comparison signatures are explicitly omitted until their owned carriers and maps exist. These omissions are tied to the five supplier gaps, not replaced by invented structures or assertion fields. No current compiler error or warning count is claimed.

## Declaration catalogue

'''
for n in p['nodes']:
 reader+='### '+n['title']+'\n\n'+n['id']+'\n\nDeclaration: '+n['library']['declaration']+'\n\nKind: '+n['kind']+'. Implementation: unchecked.\n\n'+n['statement']+'\n\n'
 for key,label in [('hypotheses','Hypotheses'),('proofSteps','Construction or proof outline'),('prerequisites','Prerequisites'),('acceptance','Acceptance')]:
  if n.get(key):reader+='**'+label+'**\n\n'+'\n'.join('- '+x for x in n[key])+'\n\n'
 for key,label in [('api','API'),('tests','Tests')]:
  if n.get(key):reader+='**'+label+'**\n\n'+'\n'.join('- '+x['name']+': '+x['statement']for x in n[key])+'\n\n'
 for key,label in [('uses','Uses'),('sources','Sources')]:
  if n.get(key):reader+='**'+label+'**\n\n'+'\n'.join('- '+(x['where']+': '+x['how']if key=='uses'else x['sourceId']+', '+x['locator']+'. '+x.get('match',''))for x in n[key])+'\n\n'
reader=reader.replace('later ','')
(S/'Reader.md').write_text(reader.rstrip()+'\n');save('Candidate.json',p);save(STEM+'.json',p)
# Lean source is authored only in the authorized file; retain an inert exact copy.
(S/'Suggested.lean').write_bytes((R/'research/blueprint/suggested'/ (STEM+'.lean')).read_bytes())
for folder,ext,name in [('packets','json','Candidate.json'),('readmes','md','Reader.md')]:
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
"""Project exact inherited L1 commands and tests; import sibling prototype owners."""
from pathlib import Path
import collections,hashlib,json,re,sys
S=Path(sys.argv[1]);t=(S/'SplitSuggested.lean').read_text();p=json.loads((S/'ProjectionInput.json').read_text());cs=json.loads((S/'LeanCommands.json').read_text())
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
note='\n/-!\n# Dirichlet L1: The smoothed measure and Kubota–Leopoldt\n\nThis file is not the roadmap and is not exhaustive. The roadmap document is\ndefinitive. These signatures and examples suggest names and types for review;\nall implementation statuses remain unchecked.\n\nInherited L1 declarations are projected from the combined source. Generic\nmeasure and pseudomeasure operations remain imported from PMIA. The current\nPMIA prototype has no matching authenticated compiled module available; the\nfull file is NOT COMPILED. Missing completed-algebra comparison carriers are\nrecorded explicitly, not replaced by fabricated structures or Prop fields.\n-/\n'
out=(imports+note+body).rstrip()+'\n'
(S/'InheritedProjection.lean').write_text(out)
report={'inheritedSha256':hashlib.sha256(t.encode()).hexdigest(),'selectedCommandIndices':kept,'declarationAndAPINames':sorted(names),'testNames':sorted(tests),'ownedNodes':len(p['nodes']),'unstatableInheritedNames':sorted(blocked),'namedSignatures':len(names),'testCount':len(tests),'exampleCount':len(re.findall(r'^[ \t]*example\b',out,re.M)),'lines':len(out.splitlines()),'sha256':hashlib.sha256(out.encode()).hexdigest(),'compiled':False,'plannedSiblingImports':[],'unavailableSupplierModules':['PadicMeasuresIwasawaAlgebras (current version)']}
(S/'Projection.json').write_text(json.dumps(report,indent=2)+'\n')
print(json.dumps({k:v for k,v in report.items()if k not in ['selectedCommandIndices','declarationAndAPINames','testNames']},indent=2))
```

## Script: verify.py

```python
"""Replay the immutable L1 audit without executing Lean or fetching dependencies."""
from pathlib import Path
import ast,copy,hashlib,json,os,re,subprocess,sys
S=Path(sys.argv[1]).resolve();R=Path.cwd();STEM='DirichletPadicLFunctions--L1';SID='DirichletPadicLFunctions:L1'
sha=lambda b:hashlib.sha256(b).hexdigest();data=lambda n:json.loads((S/n).read_text());txt=lambda n:(S/n).read_text()
BASE=os.environ.get('ROOT_ACTION_VALIDATE_BASE',txt('publication-base.txt').strip());MATH=txt('base.txt').strip()
blob=lambda ref,path:subprocess.check_output(['git','show',ref+':'+path],cwd=R)
p=data('Candidate.json');old=data('Incoming.json');assert len(p['nodes'])==134 and p['nodes'][121:]==data('NewNodes.json')
for before,after in zip(old['nodes'],p['nodes'][:121]):
 a=copy.deepcopy(before);b=copy.deepcopy(after)
 for n in [a,b]:n.pop('planet',None);n['library'].pop('declaration',None)
 assert a==b,before['id']
assert len(data('NameAdditions.json'))==32
assert p['baseline']==old['baseline'] and p['sourceVersions']==old['sourceVersions']
assert p['sourceIssues'][:5]==old['sourceIssues'] and p['sourceIssues'][5:]==data('SourceIssueAdditions.json')
assert all('review'not in x for x in p['sourceIssues'][5:])
assert p['checks']['inheritedCombinedHistory']['record']==old['checks']
assert p['status']=='complete'and p['coverage'][0]['status']=='planned'
assert len(p['gaps'])==len(p['requests'])==5 and p['requests']==data('Requests.json')
assert all(n['implementationStatus']=='unchecked'for n in p['nodes'])
for n in p['nodes']:
 assert n['id']in txt('Reader.md') and n['statement']in txt('Reader.md')
 if n['kind']in ['definition','construction']:assert len(n['api'])>=3 and len(n['tests'])>=3 and n['uses']
 for a in n.get('api',[])+n.get('tests',[]):assert a['name']in txt('Reader.md')and a['statement']in txt('Reader.md')
assert sum(bool(n.get('planet'))for n in p['nodes'])==6
for row in data('InputGuard.json'):
 assert sha(blob(MATH,row['path']))==row['sha256']==sha(blob(BASE,row['path'])),row['path']
assert data('PublicationChanges.json')==[]
claim=data('ClaimReceipt.json');assert claim['claimComment']==5991059388 and claim['confirmationComment']==5991061816 and claim['rereadAfterConfirmation']
assert sha(data('IssueAfter.json')['body'].encode())==claim['issueBodySha256']==sha(data('IssuePublication.json')['body'].encode())
regenerated=['LeanCommands.json','LeanIndexReport.json','InheritedProjection.lean','Projection.json','FinalLeanCommands.json','FinalLeanIndexReport.json']
before={n:(S/n).read_bytes()for n in regenerated}
for script,args in [('index_lean.py',['SplitSuggested.lean','ProjectionInput.json']),('project.py',[]),('index_lean.py',['Suggested.lean','Candidate.json','Final'])]:
 subprocess.run([sys.executable,str(S/script),str(S)]+args,check=True,capture_output=True)
for n,b in before.items():assert (S/n).read_bytes()==b,n
assert data('LeanIndexReport.json')['missing']==[]
fi=data('FinalLeanIndexReport.json');assert fi['missing']==sorted(data('Typing.json')['unstatableComparisons'])and not fi['duplicates']
assert fi['wanted']==170 and fi['found']==166
projection=data('Projection.json');assert projection['ownedNodes']==121 and projection['namedSignatures']==157 and projection['exampleCount']==projection['testCount']==163
assert txt('Suggested.lean').startswith(txt('InheritedProjection.lean').rstrip()+'\n')
tests={a['name']for n in p['nodes']for a in n.get('tests',[])};assert len(tests)==181
seen=[];cs=data('FinalLeanCommands.json');lean=txt('Suggested.lean')
for i,c in enumerate(cs):
 if c['kind']!='example':continue
 j=i-1
 if j>=0 and cs[j]['kind']=='include':j-=1
 prefix=lean[cs[j]['end']if j>=0 else 0:c['start']]
 tags=re.findall(r'^\s*--\s*([\w.]+)',prefix,re.M);assert tags,c['line']
 tag=tags[-1];ns='.'.join(c['namespaces']);choices=[tag,ns+'.'+tag,(ns+'.'+tag).removeprefix('DirichletPadic.')]
 matched=[x for x in choices if x in tests];assert matched,(c['line'],choices)
 seen.append(matched[0])
assert len(seen)==len(set(seen))==181 and set(seen)==tests
assert data('Typing.json')['checks']==[]and not data('Typing.json')['fullSuggestedCompiled']
assert data('BaselineAudit.json')['records']==139 and len(data('BaselineAudit.json')['modules'])==50
for record in data('SourceAcquisition.json'):assert record['read']and record['physicalPagesRead']
finite=subprocess.check_output([sys.executable,str(S/'finite.py')],text=True);assert finite==txt('Finite.json')and data('Finite.json')['exactAssertions']==30692
if(S/'artifact-manifest.json').exists():
 for name,m in data('artifact-manifest.json').items():
  b=(S/name).read_bytes();assert sha(b)==m['sha256']and len(b)==m['bytes']and len(b.splitlines())==m['lines'],name
paths=['research/blueprint/'+folder+'/'+('BP-'if folder=='handoff'else'')+STEM+'.'+ext for folder,ext in [('packets','json'),('readmes','md'),('suggested','lean'),('handoff','md')]]
contents={path:txt(name)for path,name in zip(paths,['Candidate.json','Reader.md','Suggested.lean','PublicHandoff.md'if(S/'PublicHandoff.md').exists()else'Handoff.md'])}
for path,t in contents.items():assert t.endswith('\n')and not re.search(r'/(?:home|tmp|Users)/|file'+'://|[ \t]+$',t,re.M),path
assert blob(MATH,paths[0])==(S/'Incoming.json').read_bytes()==blob(BASE,paths[0])
assert sha(blob(MATH,'research/blueprint/split/DirichletPadicLFunctions.lean'))==sha((S/'SplitSuggested.lean').read_bytes())
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
print(json.dumps({'checker':summary,'warnings':warnings,'sourceIssueErrors':issues,'intakeProblems':problems,'intakeRefusals':refusals,'preservedMathematicalNodes':121,'nameMetadataChanges':32,'newNodes':13,'counts':data('Counts.json'),'namedSignatures':166,'writtenExamples':181,'omittedComparisonSignatures':fi['missing'],'typing':data('Typing.json'),'finiteControls':data('Finite.json'),'inputGuards':len(data('InputGuard.json')),'mathematicalBase':MATH,'immutableBase':BASE,'graph':graph,'fullSuggestedCompiled':False,'LeanExecutedByVerifier':False},ensure_ascii=False,indent=2))
```

## Script: graph.py

```python
from pathlib import Path
import sys,json,collections,copy
R=Path.cwd(); S=Path(sys.argv[1]);RID='DirichletPadicLFunctions';STEM=RID+'--L1';SID=RID+':L1'
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
se={(e['source'],e['target']) for e in a['stageEdges']};beforeEdges={(e['source'],e['target']) for e in b['stageEdges']}
added=se-beforeEdges;removed=beforeEdges-se
assert all(any(v.startswith(SID+'/')for v in e)for e in removed),removed
assert all(any(v.startswith(SID+'/')for v in e)or e in {(r['supplier'],SID)for r in p['requests']}for e in added),added
stages={s['id'] for s in a['stages']}|set(check_blueprint.world()[1]);world={}
for folder in ['data/decompositions','data/blueprints','research/blueprint/packets']:
 for f in sorted((R/folder).glob('*.json')):
  for n in json.loads(f.read_text()).get('nodes',[]):world[n['id']]=n
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
result={'stageDAG':dag(stages,se),'ownDAG':dag(nodes,{(d,n) for n in nodes for d in nodes[n]['prerequisites'] if d in nodes}),'scopedDAG':dag(stages|seen,se|deps),'reachableDeclarations':len(seen),'baselineLeaves':len(leaves),'unresolved':sorted(unresolved),'restructurePairs':len(pairs),'undrawnUpstreamContracts':upstream,'missingDrawnPaths':missing,'addedStageEdges':sorted(added),'removedStageEdges':sorted(removed),'allSkipsMatchControl':True,'ownAssembly':ar[RID].get('blueprint')}
assert {x:r for x,r in ar.items()if x!=RID}=={x:r for x,r in br.items()if x!=RID}
fa={s['id']:s for s in a['stages']if not s['id'].startswith(RID+':')};fb={s['id']:s for s in b['stages']if not s['id'].startswith(RID+':')}
consumerChanges=[]
for k in set(fa)|set(fb):
 if fa.get(k)==fb.get(k):continue
 assert k in fa and k in fb
 before=copy.deepcopy(fb[k]);after=copy.deepcopy(fa[k])
 assert (k,SID)in added
 bc=before.pop('consumers',[]);ac=after.pop('consumers',[])
 assert before==after and ac==bc+[SID],k
 consumerChanges.append({'stage':k,'addedConsumer':SID})
result['declaredSupplierConsumerChanges']=sorted(consumerChanges,key=lambda x:x['stage'])
assert {s['id']:s for s in a['stages']if s['id'].startswith(RID+':') and s['id']!=SID and not s['id'].startswith(SID+'/')}=={s['id']:s for s in b['stages']if s['id'].startswith(RID+':') and s['id']!=SID and not s['id'].startswith(SID+'/')}
result['siblingStagesUnchanged']=True
result['inheritedMissingRequestStagePaths']=sorted({(r['supplier'],SID)for r in p.get('requests',[])if not reachable(r['supplier'],SID)})
result['worldCommit']=immutable_view.BASE
result['foreignRoadmapsUnchanged']=True
result['foreignStagesUnchangedExceptDeclaredConsumer']=True
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

## Script: finite.py

```python
"""Exact rational controls; these neither implement measures nor prove theorems."""
from fractions import Fraction as F
from math import comb,gcd
import json
count=0;groups={}
def check(group,prop):
 global count
 assert prop,group
 count+=1;groups[group]=groups.get(group,0)+1
def norm(p,x):
 x=F(x)
 if not x:return F(0)
 n,d=abs(x.numerator),x.denominator;v=0
 while n%p==0:n//=p;v+=1
 while d%p==0:d//=p;v-=1
 return F(p)**(-v)
B=[F(1)]
for n in range(1,49):B.append(-sum(F(comb(n+1,j))*B[j] for j in range(n))/F(n+1))
def z(p,k):return -(1-F(p)**(k-1))*B[k]/k
def smooth(p,a,k):return (a**k-1)*z(p,k)
check('Bernoulli normalization',B[1]==F(-1,2)and B[2]==F(1,6)and B[4]==F(-1,30))
for p in [2,3,5,7]:
 for a in range(1,10):
  if gcd(p,a)!=1:continue
  for k in range(1,25):
   check('integral smoothing',norm(p,smooth(p,a,k))<=1)
   check('cleared ratio',smooth(p,a,k)==(a**k-1)*z(p,k))
   if k%2:check('odd moments including endpoint',z(p,k)==0)
   for l in range(k,25):
    for r in range(1,4):
     period=p**(r-1)*(p-1)
     if (k-l)%period:continue
     eps=F(p)**(-r);d=a**k-1;e=a**l-1
     check('smoothed weight period',norm(p,smooth(p,a,k)-smooth(p,a,l))<=eps)
     if d and e:
      check('two denominator loss',norm(p,z(p,k)-z(p,l))<=eps/(norm(p,d)*norm(p,e)))
      if norm(p,d)==norm(p,e)==1:
       check('integral unit denominator Kummer',norm(p,z(p,k)-z(p,l))<=eps)
     for t in range(0,5):
      if k+t<=48 and l+t<=48 and a>1:
       dt=a**(k+t)-1;et=a**(l+t)-1
       if norm(p,dt)==norm(p,et)==1:
        check('fixed integral character component',norm(p,z(p,k+t)-z(p,l+t))<=eps)
  for m in range(0,4):
   q=p**m;inv=pow(a,-1,q)if q>1 else 0
   masses=[F(a-1,2)+F(r-a*((inv*r)%q),q)for r in range(q)]
   check('residue total mass',sum(masses)==F(a-1,2))
   for r in range(q):
    check('residue recurrence',masses[(r-a)%q]-masses[r]==sum(1 for i in range(a)if i%q==r)-a*(r==0))
    check('residue integral bound',norm(p,masses[r])<=1)
for p,k,l,a,expected,bound in [(3,2,4,2,F(23,60),F(3)),(5,2,6,2,F(-760,63),F(1,5))]:
 check('named difference values',z(p,k)-z(p,l)==expected)
 check('named difference norms',norm(p,expected)==bound)
check('negative unsmoothed congruence',norm(3,z(3,2)-z(3,4))>F(1,3))
check('smoothed ternary control',smooth(3,2,2)-smooth(3,2,4)==F(15,4))
check('dyadic second',z(2,2)==F(1,12)and norm(2,z(2,2))==4)
check('dyadic fourth',z(2,4)==F(-7,120)and norm(2,z(2,4))==8)
# Exact C2 x C3 group-algebra convolution, with normalized plus projection.
G=[(s,t)for s in range(2)for t in range(3)]
def atom(x):return {g:F(g==x)for g in G}
def add(x,y):return {g:x[g]+y[g]for g in G}
def scale(c,x):return {g:c*x[g]for g in G}
def mul(x,y):return {g:sum(x[h]*y[((g[0]-h[0])%2,(g[1]-h[1])%3)]for h in G)for g in G}
def quotient(x):return [x[(0,t)]+x[(1,t)]for t in range(3)]
one=atom((0,0));sign=atom((1,0));ep=scale(F(1,2),add(one,sign));em=scale(F(1,2),add(one,scale(-1,sign)))
check('corner idempotents',mul(ep,ep)==ep and mul(em,em)==em and all(v==0 for v in mul(ep,em).values()))
check('corner identities',ep!=one and add(ep,em)==one)
for g in G:
 qg=[F(t==g[1])for t in range(3)]
 check('normalized sign quotient',quotient(mul(ep,atom(g)))==qg)
 check('unnormalized orbit factor two',quotient(add(atom(g),mul(sign,atom(g))))==[2*x for x in qg])
 check('plus sign action',mul(sign,mul(ep,atom(g)))==mul(ep,atom(g)))
check('dyadic half not integral',norm(2,F(1,2))==2)
for p in [3,5,7]:check('odd prime half integral unit',norm(p,F(1,2))==1)
check('published odd projection negative control',quotient(mul(ep,one))[0]==1 and F(1,2)*(1+(-1))==0)
print(json.dumps({'exactAssertions':count,'groups':groups,'limits':'Finite rational and finite-group controls only; no approximation to a p-adic measure, no Lean compilation and no proof of infinite-level supplier requests.'},indent=2))
```

## Script: package.py

```python
"""Archive the named completion evidence and bind a public recovery helper."""
from pathlib import Path
import base64,hashlib,json,re,sys,zlib
S=Path(sys.argv[1]).resolve();R=Path.cwd();mode=sys.argv[2]
STEM='DirichletPadicLFunctions--L1'
sha=lambda b:hashlib.sha256(b).hexdigest()
helpers=['build_nodes.py','assemble.py','index_lean.py','project.py','verify.py','graph.py','immutable_view.py','finite.py','package.py']
names="""Incoming.json ProjectionInput.json SplitSuggested.lean Audit.json Selection.json
Candidate.json Reader.md Suggested.lean InheritedProjection.lean LeanCommands.json LeanIndexReport.json Projection.json FinalLeanCommands.json FinalLeanIndexReport.json
InputGuard.json PublicationChanges.json ClaimReceipt.json IssueAfter.json IssuePublication.json SourceAcquisition.json SourceIssueAdditions.json TargetMap.json NewNodes.json Requests.json NameAdditions.json Counts.json
BaselineAudit.json SupplierBoundary.json TouchingLinks.json Typing.json Finite.json WORKLIST.md
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
STEM='DirichletPadicLFunctions--L1'
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

The verifier authenticates all 121 inherited mathematical contracts, the five inherited source findings and sourceVersions, the 32 declaration-name metadata changes and 13 new nodes. It regenerates the inherited and final command/test indices from exact source, checks the four explicitly omitted comparison signatures, and reruns 30,692 exact finite controls. Both recovered verifier reports were reproduced before this PR was opened. Recovery and verification never execute Lean. No Lean compilation is claimed for this pass: the full suggested file remains uncompiled because a matching current PMIA module is unavailable. The source receipt scopes the fresh readings precisely and excludes PDFs and extracted paper text from this archive.


## Script: recover.py

'''
 text=(S/'HandoffBase.md').read_text()+prose+'```python\n'+code+'```\n'
 (S/'PublicHandoff.md').write_text(text);handoff.write_text(text);suggested.write_bytes((S/'Suggested.lean').read_bytes())
 print(json.dumps(dict(archive=archive,recoverySha256=sha(code.encode()),finalHandoffSha256=sha(text.encode())),indent=2))
else:raise ValueError(mode)
```
