# BP-LocallyAnalyticDistributions: reciprocal-resultant scalar limit

Codex — codex-7e92bd. Issue 641; fresh claim 5858682186 confirmed by exact bot 5858683384.
Whole issue read before and after winning claim. Partial checkpoint, all nodes unchecked.

## Delivered

162 unchecked nodes: 3 definitions, 17 constructions, 99 lemmas, 26 theorems and 17 comparisons; 89 API items (85 on definitions/constructions), 109 packet tests (70 on definitions/constructions), 109 typed examples, 6 planets and 214 baseline citations. Eight gaps, five requests, two inherited source findings and zero closed stages remain.

Ten L4 declarations give proof plans for the finite reciprocal identity,
coefficient convergence of monic quotients and remainders, continuity of a
fixed coefficient resultant, the entire-resultant truncation limit, and the
fixed and simultaneous spectral scalar limits in Coleman A3.8(11).
All 152 preceding whole nodes, 206 baseline records, 5 requests, 2 findings and
6 planets are preserved. Prior Lean bytes remain between two native imports
and the appended declarations. No new carrier or general quotient topology
is introduced. The general entire D remains explicitly unconstructed.

## Reciprocal resultants and the scalar truncation limit

Fix a nontrivial complete ultrametric normed commutative ring A with
norm(1)=1, a monic polynomial Q of degree d, and an entire series F. Write
F_n=trunc(n+1,F), so the truncation includes degree n. Let Q*=Q.reverse,
B=1−Q*, and use the preceding finite spectral transform D_(n,m).

The finite identity, valid over every commutative ring, is

D_(n,d)(1−Q*,P)(1)=Res(Q,P) whenever P.natDegree≤n.

The proof uses the native bounded Sylvester matrix. Its first m columns
contain translates of g and its last n columns translates of f. Reversing
both axes simultaneously swaps the reflected factors. The determinant is
unchanged because both axes use the same permutation, giving
Res(reflect_m f,reflect_n g;m,n)=Res(g,f;n,m). This also handles empty matrices,
zero rings and coefficients with nilpotents. Specializing the existing finite
spectral transform at 1 and using native monic bound-independence proves the
displayed identity. There is no separate permutation-sign calculation.

The fixed right bound d is important. The identity itself does not require
P(0)=1. For Q=T² and P=2, the bound d=2 gives D_(0, 2)(0, 2)(1)=4; replacing it
by the actual degree 0 of B gives D_(0, 0)(0, 2)(1)=1. The normalized condition
P(0)=1 remains necessary when changing that auxiliary bound.

For the analytic step, use the existing monic entire quotient S_Q(F), defined
by reciprocal tails. Its kth coefficient is the convergent sum
Σ_j a_(k+d+j)b_j, where b_j is a coefficient of the inverse of Q*. For F_n,
this is exactly the initial sum through k+d+j≤n. Ordinary convergence of
partial sums proves convergence of every quotient coefficient. Finite
coefficient convolution then proves that every coefficient of F_n mod Q
converges to the coefficient of the existing remainder R_Q(F).

The resultant can be computed from these remainders using a fixed-size
Sylvester matrix. Native quotient-class equality and the norm/resultant
comparison give

Res(Q,F_n)=Res(Q,F_n mod Q;d,d).

Encode the remainder by its coefficients 0,…,d in a native finite product.
For fixed bounds, every Sylvester entry is a coefficient projection, a fixed
coefficient of Q or0. The existing continuity of finite determinants proves
continuity of this function of the coefficient vector. Consequently
Res(Q,F_n) converges to Res(Q,R_Q(F)), which is the preceding entire resultant
Res(Q,F) by its quotient-norm definition. No topology on AdjoinRoot Q or
continuity of its algebra norm is assumed.

Thus D_(n,d)(B,F_n)(1) converges to Res(Q,F). If F(0)=1, the simultaneous
source sequence has the same limit: eventually trunc(n+1,B)=B, and the existing
monic-reversal and right-bound API identifies D_(n,n)(B,F_n) with D_(n,d)(B,F_n).
This proves the scalar limiting step in Coleman A3.8(11).

The general entire series D(B,F) still needs its own construction and
quantitative coefficient estimates. Coefficientwise convergence alone would
not justify evaluating the limit at 1. The scalar sequence theorem here will
identify that value once the required entire convergence and evaluation
comparison are supplied. Multiplicativity A3.8(10), the infinite-operator
A3.9 theorem and the existing finite-module topology and rank questions remain
separate targets.

## Reading and checks

The current handoff, reviewed AUDIT25 L4 row and relevant preceding quotient,
resultant and finite spectral nodes were reread in full. The earlier whole
predecessor, five reviewed audit rows, accepted RS16, two upstream models,
roadmap descriptions and link readings retain their continuous-session
provenance. All 48 captured input hashes initially matched the prior job.
The published Coleman printed 433–435/PDF 17–19 was freshly read, including
all of A3.8(11). Its SHA256 is
32ff34f60fc2ef4608506daa169c3cc61e07520f019d63928e86b093a16b1973.
No new source issue or independent review is asserted.

Eight native baseline records are added after reading their full statements
and relevant ambient hypotheses, together with the reused Sylvester, reversal,
truncation, ofFn, monic-resultant and quotient-norm statements. The index omits
generated additive names, so HasProd.tendsto_prod_nat is the indexed citation
for its explicitly generated additive partial-sum theorem; both the statement
and the to_additive annotation were read. The continuity statement uses the
native finite product and matrix determinant, not a private topology.

The bounded open-PR resultant/reverse query returned unrelated arithmetic
and tactic titles; the archive queries likewise found no exact supplier.
This is a bounded search, not a global absence claim. A full pinned-source
search found no existing resultant-reflection or resultant-continuity
adapter. Existing native constructions and API shapes are retained.

The full suggested file compiles at the pinned baseline with 0 errors and 326
warnings, all and only the expected placeholders. Its source closure checks
2207 Mathlib modules and 4 previously built pinned TauCeti modules. No native
library was built and no planned supplier module is imported. The existing
AdicSpacesPartII:R3 signature stub and its generality request are preserved.
No full proof of the ten new declarations is claimed. Suggested SHA256:
1ad621fce22f80c52d095d7ab1eeaee6c074cddda53ba11dce94974246776d41.

Indexed blueprint: 0 errors, 0 warnings. Four-file intake: 0 problems. Errata,
whitespace, whole-object preservation, reader/signature/test parity and scope
checks pass. The graph has 162 reachable nodes, 662 acyclic edges, 209 baseline
leaves and exactly the preserved AdicSpacesPartII:R3 stage request leaf.
Eight explicit gaps and five requests remain.

Exact arithmetic checks 560 simultaneous Sylvester reversals, 560 reciprocal
resultant identities and 448 finite spectral evaluations over ZMod 1, 2, 3, 4, 8, 9, 25.
Forty exact rational finite-truncation remainder/resultant comparisons and 36
successive remainder valuations check the series Σ2^(k²)T^k at four monic
divisors, including nonintegral dyadic roots. These computations validate
conventions and finite examples, not the general convergence theorem.

One persistent checkout and existing pinned builds were used, with one own
Lean process at a time. No compiler, watcher or language server remains.
Retained scratch evidence for this job: inputs.json, WORKLIST.md, claim.json,
claim-bot.json, issue-before.json, issue-claimed.json, issue-publication.json,
comments-after.json, upstream-resultant.json, baseline-read.json,
new-nodes.json, append.lean, compile.py, lean-source-audit.json,
suggested-compile.log, arithmetic.py, arithmetic-results.json,
verification.json, publication-guard.json, submission.json, intake-pr.json,
and handoff-evidence containing the four final deliverables. The source PDF
and four native artifacts retain the preceding handoff's provenance; no new
source copy, repository snapshot or native build is kept with this job.

At publication main ef2687ade0070151552d31cac1632d7fec022dab, 47 of 48 guarded input blobs and all
four predecessor deliverables are unchanged. The PMIA 276→282 change is exactly
our preceding PR 3276, merged automatically as ae513df953f34c808ccadc5115c53e079c838cd0; all six
coefficient-algebra moment additions were authored and read in this session.
The issue body and the bot's exact fresh claim confirmation were checked
again. Exactly four authorized files are submitted from the own job branch.

## Resume

The scalar truncation equality in Coleman A3.8(11) is now decomposed: native Sylvester reflection/swap gives the finite reciprocal identity; convergent monic-quotient tails give remainder coefficient convergence; fixed-size resultant continuity gives Res(Q,F_n)→Res(Q,F); and normalization gives the simultaneous spectral scalar limit. Construct the general entire D(B,P), prove convergence with quantitative coefficient estimates in an entire topology that makes evaluation continuous, and then identify its value at 1 using the supplied scalar limit. Prove A3.8(10) and the infinite-operator A3.9 transport. Do not infer evaluation continuity from coefficientwise convergence or identify a scalar limit with an unconstructed series. The canonical finite-module topology, finite-projective determinants/rank over nonreduced coefficients, completed tensors and actual distribution families remain separate gaps.

- LocallyAnalyticDistributions:L0 (not_read): Read and decompose the locally analytic function-space sources: fixed-radius Banach spaces, uniform radius on compact manifolds, chart independence, restrictions, tensor products and inclusions. Construct the nonarchimedean LF topology and its strong dual/projective Banach-dual comparison; prove the required density and bounded-measure injection. Distinguish Q_p-analytic and F-analytic functions and products. The c0 operator work in L4 does not cover these targets.
- LocallyAnalyticDistributions:L1 (not_read): Read RJW Theorem 3.43 and its proof for the unbounded Amice transform and Frechet topology; only the source metadata was acquired in this pass. Extend the bounded restriction/twist/phi/psi/differentiation toolbox with actual norm and continuity statements; prove division by x only on distributions supported on units. Build local analytic primitives with locally constant ambiguity and verify logarithmic domains/cancellation at p-power roots of unity.
- LocallyAnalyticDistributions:L2 (not_read): Decompose order-h ball estimates, coefficient growth, the Amice-Velu/Vishik extension and strict degree bound, and the order-zero bounded-measure comparison. State and prove the several-variable radius/growth and determining-character theorems; do not use strict small-slope uniqueness at critical slope.
- LocallyAnalyticDistributions:L3 (not_read): Import scalar character-space representability, universal characters, generator changes and odd/dyadic components from PadicMeasuresIwasawaAlgebras:L0a, as RS-16 requires; do not duplicate that construction. Decompose scalar Mellin evaluation under coefficient extension, twists, weight derivatives and ray-class functoriality; distinguish analytic, bounded and meromorphic domains. Specify the adic/power-series comparison using affinoid and open-gluing interfaces. Diamonds are not required.
- LocallyAnalyticDistributions:L4 (partial): The generic Fredholm spine is preserved. Algebraic coordinate detection and the Neumann proof of finite generation are decomposed, but canonical finite-module topology, inverse norm bounds and completed tensors remain gaps. Construct the spectral resultant D(B,P) and transport Coleman A3.8-A3.9 to Noetherian K-Banach algebras and (Pr) modules, including the normalization in Theorem 3.3. The Hasse calculus, explicit Riesz projector and analytic adjugate coefficient estimate are now separately decomposed. Expand the remaining composite nodes and APIs, especially the finite-projective determinant/rank argument, Cayley–Hamilton and Lemmas2.12–2.13. The monic one-variable entire division bounds are supplied below. Construct the actual affinoid-valued analytic/distribution modules, integral models, completed tensor products and specialization; include the RS-16 transferred universal-character coefficient action with uniform local radii. Prove continuity and complete continuity of the actual modular-symbol/automorphic semigroup operators and scalar-extension compatibility on slope-adapted affinoids. Include positive-order nonmeasure and order-zero/multivariable acceptance tests. Complete the explicitly omitted signatures, especially completed-tensor base change and the Riesz/slope hypotheses. The present partial suggested file elaborates at the pin; this is not a formalization claim. Resolve the imported complete-continuity generality request in AdicSpacesPartII:R3 without creating a second predicate or silently importing its strict variant. The root projector and canonical topological decomposition are now separately specified. Complete the finite-projective determinant/rank and exact-slope arguments; the continuous regular inverse alone supplies neither rank nor polynomial determinant equality. The root-kernel geometric inverse and finite-projectivity chain are separately decomposed. Discharge the existing canonical finite-module-topology input, then the constant-rank and determinant argument over nonreduced coefficients; the new adapter does not settle those gaps. General one-variable monic entire division is now decomposed by reciprocal-tail estimates, native truncation remainder and entire uniqueness, with polynomial and linear compatibility. Use this completed proof plan in the resultant quotient-algebra comparison. The spectral resultant D(B,P), continuity/topology and finite-free quotient-algebra transport remain separate obligations; resolve the two inherited Coleman findings through independent review. The entire quotient and ordinary resultant unit criterion are now decomposed through native algebra. Complete spectral D(B,P) and Coleman A3.8–A3.9 transport, finite-projective determinants/rank, completed tensors and actual distribution families; no stage is closed by this slice. The finite polynomial spectral transform is now decomposed through native bounded resultants, with normalization, scalar extension, the finite factor-product law, exact zero-root padding, B(0)=0 stability, a finite quotient norm and the split root-product formula. The finite-endomorphism characteristic-polynomial comparison is now decomposed below. Complete the entire-input limit, its coefficient estimates and A3.8(11)/A3.9 transport; finite algebra alone does not discharge those analytic and operator obligations. The unrestricted finite matrix identity is now decomposed through native generic matrices, independent universal polynomial coefficients, a rational specialization detecting the generic discriminant, an eigenbasis over the algebraic closure of the universal fraction field, faithful descent and arbitrary-ring specialization. Continue with the entire-input definition and limit of D, quantitative coefficient estimates, Coleman A3.8(11) and the infinite-operator A3.9 transport. Preserve the distinction between fixed-rank finite mapping (no B(0)=0 hypothesis) and rank padding or infinite compact-operator transport (B(0)=0 required). Canonical finite-module topology, completed tensor products, determinant/rank over nonreduced coefficients and actual distribution families remain separate gaps. The scalar truncation equality in Coleman A3.8(11) is now decomposed: native Sylvester reflection/swap gives the finite reciprocal identity; convergent monic-quotient tails give remainder coefficient convergence; fixed-size resultant continuity gives Res(Q,F_n)→Res(Q,F); and normalization gives the simultaneous spectral scalar limit. Construct the general entire D(B,P), prove convergence with quantitative coefficient estimates in an entire topology that makes evaluation continuous, and then identify its value at 1 using the supplied scalar limit. Prove A3.8(10) and the infinite-operator A3.9 transport. Do not infer evaluation continuity from coefficientwise convergence or identify a scalar limit with an unconstructed series. The canonical finite-module topology, finite-projective determinants/rank over nonreduced coefficients, completed tensors and actual distribution families remain separate gaps.

## Outstanding requests

- PadicMeasuresIwasawaAlgebras:L0: Bounded continuous-function duals, their norm/weak topology and coefficient conventions for L0. The current supplier packet exists and its concrete nodes must be used as L0 is decomposed; the inherited claim that the packet was absent is superseded. The locally analytic LF/strong-dual topology is not supplied by the bounded measure definition.
- PadicMeasuresIwasawaAlgebras:L2: The bounded Mahler-Amice transform and bounded operator toolbox, with exact coefficient conventions, to be extended rather than reconstructed in L1.
- PadicMeasuresIwasawaAlgebras:L0a: Scalar character-space functor, representability, universal character, generator changes and odd-p/dyadic components under RS-16. Distribution-valued coefficient actions and uniform local radii are retained in L4, not sent back to this supplier.
- PadicMeasuresIwasawaAlgebras:L3: Pseudo-measures and the precise evaluation/inversion domains for the meromorphic comparison in L3.
- AdicSpacesPartII:R3: Extend the ordinary predicate and finite-rank/composition/closedness API of AdicSpacesPartII:R3/completely-continuous-map from its stated affinoid setting to complete modules over commutative Noetherian K-Banach algebras with compatible bounded action; use the same range-FG epsilon predicate, which the current suggested file already spells out more generally. Promote consumed API to named supplier nodes. Do not import or generalize Kiehl's strict variant as part of this request.
