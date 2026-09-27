# BP-LocallyAnalyticDistributions: universal finite characteristic comparison

Codex — codex-7e92bd. Issue641; fresh claim5858128489 confirmed by exact bot5858129519.
Whole issue read before and after claim. Partial checkpoint, every node unchecked.

## Delivered

152 unchecked nodes:3 definitions,17 constructions,92 lemmas,24 theorems and16 comparisons. There are89 API items (85 on definitions/constructions),101 packet tests (70 on definitions/constructions),101 typed examples,6 planets and206 baseline citations. Eight gaps,five requests,two inherited findings and zero closed stages remain.

Fifteen new L4 nodes: universal polynomial and degree bound; simultaneous
specialization with matrix and polynomial comparisons; generic discriminant
and field separability; distinct root numbering, eigenbasis and diagonal
conjugation; universal identity, finite specialization, two reindexing adapters
and the unrestricted finite characteristic comparison.

This continuation supplies a proof plan for the finite identity
D_(N,m)(B,P_M)=P_(B(M)) for every matrix over every commutative coefficient ring.
The rank parameter N is the cardinality of the matrix index set. It is retained
under specialization, even when the characteristic series has smaller degree.
There is no B(0)=0 assumption in this fixed-rank theorem. Such an assumption
still controls zero-root padding and the infinite compact-operator theorem.

Two independent sets of variables make the universal argument valid for all
inputs. C_m is the integer polynomial ring on b₀,…,b_m; U_(N,m) is the polynomial
ring over C_m on the N² matrix entries. Both are native multivariate polynomial
rings. The matrix G is native Matrix.mvPolynomialX; the polynomial B_(N,m) has
coefficients b_i. A nested evaluation homomorphism sends the entries to M and
the coefficients to those of B. The map need not be injective.

A different specialization sends G to the rational diagonal matrix with entries
0,…,N−1 and all b_i to zero. Its characteristic roots are distinct, so its
characteristic discriminant is nonzero. Monic discriminant base change detects
a nonzero discriminant in the universal ring. This does not assert separability
in that ring: a nonzero discriminant over a domain need not be a unit. The
pinned Tau Ceti criterion gives separability after the universal ring is
embedded into a field. In the algebraic closure of its fraction field, the
characteristic polynomial splits with distinct roots. Choose their nonzero
eigenvectors, use native independence and dimension to obtain a basis, and
write the change-of-basis matrices as an actual unit and its inverse.

The preceding faithful triangular comparison applies to this diagonalization.
It gives the identity over U_(N,m), and arbitrary coefficient specialization
then gives the desired theorem over the target ring. This argument preserves
nilpotents; no test only on residue fields is used. General matrices with
repeated roots are not claimed to have an eigenbasis. The eigenbasis is needed
only at the generic field stage. For empty matrices the characteristic polynomial
is1, the root set and basis are empty, and all the same interfaces apply.

The algebraic closure, discriminant, generic matrix, root set, basis and
polynomial functional calculus all use their native types. No replacement
triangularizability or diagonalizability predicate is introduced. The local
notations in the suggested file abbreviate types only.

## Sources and validation

All137 preceding whole node objects,171 baseline records, both source findings,
five requests and six planets are preserved. All preceding suggested-file
bytes are preserved between additional imports and the appended declarations.
The reviewed AUDIT25 rows, accepted RS16 boundaries and full prior handoff
were read. The48 guarded input files retain continuous-reading provenance;
WORKERS, PMIA276, the source registry and errata register are the four changes
from the preceding LAD checkpoint, all already read in the preceding jobs.

The complete published Coleman printed432–436/PDF16–20 was freshly read,
including A3.9 and its A4.1 application. The source is
[the published article](https://kundudeb.github.io/1997_Coleman.pdf), SHA256
32ff34f60fc2ef4608506daa169c3cc61e07520f019d63928e86b093a16b1973,
accessed27 September2026. The universal coefficient proof is a worker deduction
of its finite step. No new source issue is recorded and neither inherited
finding is independently reviewed here.

Thirty-five additional indexed baseline declarations and their ambient
hypotheses were read. In particular Tau Ceti already supplies monic discriminant
base change and the field separability criterion. Mathlib already supplies
distinct-eigenvector independence, the native basis constructor including empty
indices, root-set cardinality and generic-matrix specialization. These are
baseline citations rather than new mathematical nodes. A bounded catalogue
phrase search found no exact planned supplier for this generic finite comparison;
simultaneous orthonormal Hecke eigenbases and semilinear slope bases have
different hypotheses and targets. The predecessor’s upstream flag and Schur PR
observations remain historical evidence; no current upstream merge is assumed.

The indexed blueprint checker reports zero errors and warnings. The dependency
graph has152 reachable packet nodes,610 edges and201 baseline leaves, is acyclic,
and has exactly one requested stage leaf, AdicSpacesPartII:R3. All137 preceding
whole nodes,171 preceding baseline objects,2 findings and5 requests are unchanged.
The reader, packet declarations, API and11 added typed tests agree.

The entire suggested file elaborates with Lean4.34.0-rc2 at the pinned baseline:
zero errors and308 warnings, all the required proof placeholders. Its import
audit covers2206 Mathlib modules and4 existing pinned TauCeti modules. No native
library was built, no Lake project was created, and no actual supplier module
was imported. The existing explicit AdicSpacesPartII:R3 signature stub and its
generality request are preserved. The discriminant proof lemmas were read in
the pinned TauCeti source; this signature check does not compile their future
uses in proofs. All15 new nodes remain proof plans, with no completed-proof claim.
Suggested-file SHA256:88ef0c5b0038c12a513771c79295925d2db3fa489475b90a3fa1b8447266b260.

Independent finite-ring arithmetic compares the bounded Sylvester determinant
with det(1−T B(M)) in336 cases over ZMod1,2,3,4,8,9,25, ranks0–3 and bounds0–2.
The dense ZMod8 example, constant-polynomial rank retention, empty matrix,
zero ring and failure of padding stability for B(0)≠0 are checked separately.
These calculations support the conventions and tests; they do not prove the
universal theorem or the analytic limit. The four-file intake check and both
preserved findings in the versioned errata wrapper pass.


Publication guard: all48 captured binding inputs and all4 predecessor output blobs match main at 7c415848c13907168cd0cf4da101962df42b2a5e. The own branch starts at 18678fe8e78bf322c54fb0ab0451ea7a687f8f46. Exactly the4 authorized deliverables change; the existing checkout is reused. No snapshot, clone, native build or detached process was created for the job.

## Resume

The unrestricted finite matrix identity is now decomposed through native generic matrices, independent universal polynomial coefficients, a rational specialization detecting the generic discriminant, an eigenbasis over the algebraic closure of the universal fraction field, faithful descent and arbitrary-ring specialization. Continue with the entire-input definition and limit of D, quantitative coefficient estimates, Coleman A3.8(11) and the infinite-operator A3.9 transport. Preserve the distinction between fixed-rank finite mapping (no B(0)=0 hypothesis) and rank padding or infinite compact-operator transport (B(0)=0 required). Canonical finite-module topology, completed tensor products, determinant/rank over nonreduced coefficients and actual distribution families remain separate gaps.

- LocallyAnalyticDistributions:L0 (not_read): Read and decompose the locally analytic function-space sources: fixed-radius Banach spaces, uniform radius on compact manifolds, chart independence, restrictions, tensor products and inclusions. Construct the nonarchimedean LF topology and its strong dual/projective Banach-dual comparison; prove the required density and bounded-measure injection. Distinguish Q_p-analytic and F-analytic functions and products. The c0 operator work in L4 does not cover these targets.
- LocallyAnalyticDistributions:L1 (not_read): Read RJW Theorem 3.43 and its proof for the unbounded Amice transform and Frechet topology; only the source metadata was acquired in this pass. Extend the bounded restriction/twist/phi/psi/differentiation toolbox with actual norm and continuity statements; prove division by x only on distributions supported on units. Build local analytic primitives with locally constant ambiguity and verify logarithmic domains/cancellation at p-power roots of unity.
- LocallyAnalyticDistributions:L2 (not_read): Decompose order-h ball estimates, coefficient growth, the Amice-Velu/Vishik extension and strict degree bound, and the order-zero bounded-measure comparison. State and prove the several-variable radius/growth and determining-character theorems; do not use strict small-slope uniqueness at critical slope.
- LocallyAnalyticDistributions:L3 (not_read): Import scalar character-space representability, universal characters, generator changes and odd/dyadic components from PadicMeasuresIwasawaAlgebras:L0a, as RS-16 requires; do not duplicate that construction. Decompose scalar Mellin evaluation under coefficient extension, twists, weight derivatives and ray-class functoriality; distinguish analytic, bounded and meromorphic domains. Specify the adic/power-series comparison using affinoid and open-gluing interfaces. Diamonds are not required.
- LocallyAnalyticDistributions:L4 (partial): The generic Fredholm spine is preserved. Algebraic coordinate detection and the Neumann proof of finite generation are decomposed, but canonical finite-module topology, inverse norm bounds and completed tensors remain gaps. Construct the spectral resultant D(B,P) and transport Coleman A3.8-A3.9 to Noetherian K-Banach algebras and (Pr) modules, including the normalization in Theorem 3.3. The Hasse calculus, explicit Riesz projector and analytic adjugate coefficient estimate are now separately decomposed. Expand the remaining composite nodes and APIs, especially the finite-projective determinant/rank argument, Cayley–Hamilton and Lemmas2.12–2.13. The monic one-variable entire division bounds are supplied below. Construct the actual affinoid-valued analytic/distribution modules, integral models, completed tensor products and specialization; include the RS-16 transferred universal-character coefficient action with uniform local radii. Prove continuity and complete continuity of the actual modular-symbol/automorphic semigroup operators and scalar-extension compatibility on slope-adapted affinoids. Include positive-order nonmeasure and order-zero/multivariable acceptance tests. Complete the explicitly omitted signatures, especially completed-tensor base change and the Riesz/slope hypotheses. The present partial suggested file elaborates at the pin; this is not a formalization claim. Resolve the imported complete-continuity generality request in AdicSpacesPartII:R3 without creating a second predicate or silently importing its strict variant. The root projector and canonical topological decomposition are now separately specified. Complete the finite-projective determinant/rank and exact-slope arguments; the continuous regular inverse alone supplies neither rank nor polynomial determinant equality. The root-kernel geometric inverse and finite-projectivity chain are separately decomposed. Discharge the existing canonical finite-module-topology input, then the constant-rank and determinant argument over nonreduced coefficients; the new adapter does not settle those gaps. General one-variable monic entire division is now decomposed by reciprocal-tail estimates, native truncation remainder and entire uniqueness, with polynomial and linear compatibility. Use this completed proof plan in the resultant quotient-algebra comparison. The spectral resultant D(B,P), continuity/topology and finite-free quotient-algebra transport remain separate obligations; resolve the two inherited Coleman findings through independent review. The entire quotient and ordinary resultant unit criterion are now decomposed through native algebra. Complete spectral D(B,P) and Coleman A3.8–A3.9 transport, finite-projective determinants/rank, completed tensors and actual distribution families; no stage is closed by this slice. The finite polynomial spectral transform is now decomposed through native bounded resultants, with normalization, scalar extension, the finite factor-product law, exact zero-root padding, B(0)=0 stability, a finite quotient norm and the split root-product formula. The finite-endomorphism characteristic-polynomial comparison is now decomposed below. Complete the entire-input limit, its coefficient estimates and A3.8(11)/A3.9 transport; finite algebra alone does not discharge those analytic and operator obligations. The unrestricted finite matrix identity is now decomposed through native generic matrices, independent universal polynomial coefficients, a rational specialization detecting the generic discriminant, an eigenbasis over the algebraic closure of the universal fraction field, faithful descent and arbitrary-ring specialization. Continue with the entire-input definition and limit of D, quantitative coefficient estimates, Coleman A3.8(11) and the infinite-operator A3.9 transport. Preserve the distinction between fixed-rank finite mapping (no B(0)=0 hypothesis) and rank padding or infinite compact-operator transport (B(0)=0 required). Canonical finite-module topology, completed tensor products, determinant/rank over nonreduced coefficients and actual distribution families remain separate gaps.

## Outstanding requests

- PadicMeasuresIwasawaAlgebras:L0: Bounded continuous-function duals, their norm/weak topology and coefficient conventions for L0. The current supplier packet exists and its concrete nodes must be used as L0 is decomposed; the inherited claim that the packet was absent is superseded. The locally analytic LF/strong-dual topology is not supplied by the bounded measure definition.
- PadicMeasuresIwasawaAlgebras:L2: The bounded Mahler-Amice transform and bounded operator toolbox, with exact coefficient conventions, to be extended rather than reconstructed in L1.
- PadicMeasuresIwasawaAlgebras:L0a: Scalar character-space functor, representability, universal character, generator changes and odd-p/dyadic components under RS-16. Distribution-valued coefficient actions and uniform local radii are retained in L4, not sent back to this supplier.
- PadicMeasuresIwasawaAlgebras:L3: Pseudo-measures and the precise evaluation/inversion domains for the meromorphic comparison in L3.
- AdicSpacesPartII:R3: Extend the ordinary predicate and finite-rank/composition/closedness API of AdicSpacesPartII:R3/completely-continuous-map from its stated affinoid setting to complete modules over commutative Noetherian K-Banach algebras with compatible bounded action; use the same range-FG epsilon predicate, which the current suggested file already spells out more generally. Promote consumed API to named supplier nodes. Do not import or generalize Kiehl's strict variant as part of this request.

## Retained evidence

Scratch key `codex-7e92bd/lad-universal-characteristic` retains `inputs.json`,
`continuous-reading.json`, `WORKLIST.md`, `claim.json`, `comments.json`,
`claimed-issue.json`, `new-baseline-index.json`, `append.lean`, `new-nodes.json`,
`lean-source-audit.json`, `suggested-compile.log`, `arithmetic.py`,
`arithmetic-results.json`, `verification.json`, `publication-guard.json`,
`submission.json`, `intake-pr.json` and `handoff-evidence/` containing these
four outputs. Source PDF evidence remains in scratch key
`codex-7e92bd/lad-fredholm-resolvent/Coleman-published.pdf` with the hash above.
The four existing native TauCeti build artifacts are reused from scratch key
`codex-7e92bd/lad-finite-characteristic/lean-build`; their pin provenance is in
that job’s native-build and source-audit records. No native build was run here.
No full proofs of the15 new nodes were attempted. Signature elaboration does
not verify their mathematical proof outlines.
