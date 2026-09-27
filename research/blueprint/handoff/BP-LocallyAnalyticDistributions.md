# BP-LocallyAnalyticDistributions: finite triangular characteristic comparison

Codex — codex-7e92bd. Issue641; claim5855627763 confirmed by exact bot5855628726.
Whole issue read before and after claim. Partial checkpoint; all statuses unchecked.

## Delivered

137 unchecked nodes (16 comparison, 15 construction, 3 definition, 80 lemma, 23 theorem), 80 API entries, 90 packet tests, 90 typed examples, six planets and 171 baseline records. Eight gaps, five requests, two source findings and zero closed stages remain.

Thirteen new L4 entries: fixed-rank reflection and degree, characteristic-series
scalar extension and similarity, triangular product diagonals, polynomial
triangularity and diagonals, characteristic factors, triangular spectral
comparison, polynomial-calculus similarity and scalar extension, comparison
from a triangularizing similarity, and faithful scalar-extension descent.

The native reverse characteristic polynomial P_M(T)=det(1−TM) is used directly.
Its rank parameter is the matrix size N, even if its actual polynomial degree
falls. All scalar-extension statements preserve that rank. The comparison
D_(N,m)(B,P_M)=P_(B(M)) is established here with explicit triangularization
hypotheses over arbitrary commutative rings; repeated and zero diagonal entries
and nilpotent coefficients are retained. No condition B(0)=0 is needed at fixed
finite rank. Such a condition remains essential for rank-padding stability and
the infinite functional-calculus problem.

The proof first treats an upper triangular matrix, then a matrix with a given
triangularizing unit, then descends an equality from a given injective scalar
extension with a triangularizing unit. These are distinct, explicit hypotheses.
An arbitrary ring need not embed into a field, and split characteristic
polynomials over rings do not automatically provide triangularizing bases.
Specialization only to residue fields does not detect nilpotents. The
unrestricted finite theorem therefore remains a separate obligation.


## Reading and validation

All 124 preceding whole node objects, 151 baseline records, both findings,
five requests, six planets and all prior suggested Lean bytes are preserved.
The five reviewed AUDIT25 rows, accepted RS16 boundaries and prior handoff were
read. Binding rules, expansion protocol, two upstream model documents and all
28 touching link files match the preceding complete readings. This checkpoint
creates no new mathematical carrier, construction, planet or source finding.

The complete published Coleman printed432–436/PDF16–20 was freshly reread,
including the full A3.9 proof and A4.1 application. The published PDF at
https://kundudeb.github.io/1997_Coleman.pdf has
SHA25632ff34f60fc2ef4608506daa169c3cc61e07520f019d63928e86b093a16b1973.
The triangular-matrix adapters are worker deductions making one finite part of
the source precise. Twenty exact indexed native declarations and their ambient
hypotheses were read, adding twenty baseline records. Native reverse
characteristic polynomials, triangular matrices, algebra evaluation and bounded
resultants are reused.

The bounded upstream title screen found zero open charpoly PRs and five open
triangular PRs. Mathlib PR39834 at head40f737f29fcf7fd0b4ec5706db1aad8bcbc8f078
uses native flags and block-triangular matrices for field triangularization;
PR39837 at head8578d0ce997a6020fac0188a45a716768166098a specializes to inner
products. Their bodies and relevant patches were read; neither supplies a
pinned theorem here. The linked prerequisite PR39829 was screened. A targeted
Zulip search found no exact spectral-comparison discussion. This is a bounded
screen, not a global absence claim. No upstream code was copied and no new
triangularizability predicate is introduced. Needed field triangularization
must be built in that API shape without waiting for an upstream merge.


Indexed blueprint: zero errors and warnings. Four-file intake: zero problems.
Versioned errata, whole-predecessor preservation, reader/signature/test parity
and scope checks pass. The graph has 137 reachable nodes,
546 acyclic edges and 166 native baseline leaves.
The only stage leaf remains the preserved AdicSpacesPartII:R3 generality request.

The complete suggested file compiles with zero errors and 276 warnings, all
proof placeholders. Its recursive source audit covers 2,203 pinned Mathlib
modules and four pinned TauCeti modules. All four TauCeti modules were rebuilt
from pinned sources with zero errors and warnings. There are no proposed
supplier imports. All 90 typed examples elaborate, including four new controls.

A separate complete native proof file contains two constructions and 38 proved
lemmas, with zero errors, warnings or placeholders. Twenty-one lemmas and the
two constructions reproduce the preceding finite spectral algebra proof; the
seventeen additions prove all thirteen new statements and four tests. Its
recursive audit covers 2,794 pinned Mathlib modules and the same four native
TauCeti modules. The tests include an empty matrix, the fixed-rank B=1 zero
matrix, and the nonzero off-diagonal Jordan block over ZMod8, for which
B(Y)=Y+Y² gives rows (6,5),(0,6) and characteristic series1+4T+4T².
These checks do not turn the public blueprint into an implementation claim.

Before publication, the PMIA249→265 supplier refresh was matched byte-for-byte
to own merged PR3252. Registry7,575→7,576 adds DirichletPadicLFunctions/E10,
a consumer record of the previously read PMIA/E13 smoothing-denominator issue;
the full new record and generated register delta were read. All7,575 prior
records are unchanged. No LAD finding, hypothesis or supplier boundary changed.


At publication base `f850a8a3d451af3b9a6f87f3ad4adc113c494920`, all48 captured input blobs, all four predecessor outputs, the unchanged issue body and exact fresh winning claim match. Exactly four authorized files are published through Git Data REST. No git command, manual merge, label edit or own-work review is performed.

## Resume

The finite characteristic comparison is now decomposed for upper triangular matrices, matrices with a supplied triangularizing similarity, and matrices admitting such a similarity after a supplied injective coefficient map. Prove the unrestricted comparison for every finite matrix over an arbitrary commutative ring. One route is a universal matrix over an integral polynomial ring, an injective map to an algebraic closure of its fraction field, triangularization there, faithful descent to the universal ring, and specialization to every target ring; each universal polynomial identity and specialization step must be justified. Do not assert that an arbitrary ring embeds into a field, that a split characteristic polynomial over a ring implies triangularizability, or that checking residue fields detects nilpotents. Build any needed triangularization API here in the shape of the cited upstream work, without waiting for it. The entire-input limit, coefficient estimates, A3.8(11), A3.9 and the preserved topology, tensor and distribution-family gaps remain.

- LocallyAnalyticDistributions:L0 (not_read): Read and decompose the locally analytic function-space sources: fixed-radius Banach spaces, uniform radius on compact manifolds, chart independence, restrictions, tensor products and inclusions. Construct the nonarchimedean LF topology and its strong dual/projective Banach-dual comparison; prove the required density and bounded-measure injection. Distinguish Q_p-analytic and F-analytic functions and products. The c0 operator work in L4 does not cover these targets.
- LocallyAnalyticDistributions:L1 (not_read): Read RJW Theorem 3.43 and its proof for the unbounded Amice transform and Frechet topology; only the source metadata was acquired in this pass. Extend the bounded restriction/twist/phi/psi/differentiation toolbox with actual norm and continuity statements; prove division by x only on distributions supported on units. Build local analytic primitives with locally constant ambiguity and verify logarithmic domains/cancellation at p-power roots of unity.
- LocallyAnalyticDistributions:L2 (not_read): Decompose order-h ball estimates, coefficient growth, the Amice-Velu/Vishik extension and strict degree bound, and the order-zero bounded-measure comparison. State and prove the several-variable radius/growth and determining-character theorems; do not use strict small-slope uniqueness at critical slope.
- LocallyAnalyticDistributions:L3 (not_read): Import scalar character-space representability, universal characters, generator changes and odd/dyadic components from PadicMeasuresIwasawaAlgebras:L0a, as RS-16 requires; do not duplicate that construction. Decompose scalar Mellin evaluation under coefficient extension, twists, weight derivatives and ray-class functoriality; distinguish analytic, bounded and meromorphic domains. Specify the adic/power-series comparison using affinoid and open-gluing interfaces. Diamonds are not required.
- LocallyAnalyticDistributions:L4 (partial): The generic Fredholm spine is preserved. Algebraic coordinate detection and the Neumann proof of finite generation are decomposed, but canonical finite-module topology, inverse norm bounds and completed tensors remain gaps. Construct the spectral resultant D(B,P) and transport Coleman A3.8-A3.9 to Noetherian K-Banach algebras and (Pr) modules, including the normalization in Theorem 3.3. The Hasse calculus, explicit Riesz projector and analytic adjugate coefficient estimate are now separately decomposed. Expand the remaining composite nodes and APIs, especially the finite-projective determinant/rank argument, Cayley–Hamilton and Lemmas2.12–2.13. The monic one-variable entire division bounds are supplied below. Construct the actual affinoid-valued analytic/distribution modules, integral models, completed tensor products and specialization; include the RS-16 transferred universal-character coefficient action with uniform local radii. Prove continuity and complete continuity of the actual modular-symbol/automorphic semigroup operators and scalar-extension compatibility on slope-adapted affinoids. Include positive-order nonmeasure and order-zero/multivariable acceptance tests. Complete the explicitly omitted signatures, especially completed-tensor base change and the Riesz/slope hypotheses. The present partial suggested file elaborates at the pin; this is not a formalization claim. Resolve the imported complete-continuity generality request in AdicSpacesPartII:R3 without creating a second predicate or silently importing its strict variant. The root projector and canonical topological decomposition are now separately specified. Complete the finite-projective determinant/rank and exact-slope arguments; the continuous regular inverse alone supplies neither rank nor polynomial determinant equality. The root-kernel geometric inverse and finite-projectivity chain are separately decomposed. Discharge the existing canonical finite-module-topology input, then the constant-rank and determinant argument over nonreduced coefficients; the new adapter does not settle those gaps. General one-variable monic entire division is now decomposed by reciprocal-tail estimates, native truncation remainder and entire uniqueness, with polynomial and linear compatibility. Use this completed proof plan in the resultant quotient-algebra comparison. The spectral resultant D(B,P), continuity/topology and finite-free quotient-algebra transport remain separate obligations; resolve the two inherited Coleman findings through independent review. The entire quotient and ordinary resultant unit criterion are now decomposed through native algebra. Complete spectral D(B,P) and Coleman A3.8–A3.9 transport, finite-projective determinants/rank, completed tensors and actual distribution families; no stage is closed by this slice. The finite polynomial spectral transform is now decomposed through native bounded resultants, with normalization, scalar extension, the finite factor-product law, exact zero-root padding, B(0)=0 stability, a finite quotient norm and the split root-product formula. Complete the finite-endomorphism characteristic-polynomial comparison, the entire-input limit and its coefficient estimates, and A3.8(11)/A3.9 transport; finite algebra alone does not discharge those analytic and operator obligations. The finite characteristic comparison is now decomposed for upper triangular matrices, matrices with a supplied triangularizing similarity, and matrices admitting such a similarity after a supplied injective coefficient map. Prove the unrestricted comparison for every finite matrix over an arbitrary commutative ring. One route is a universal matrix over an integral polynomial ring, an injective map to an algebraic closure of its fraction field, triangularization there, faithful descent to the universal ring, and specialization to every target ring; each universal polynomial identity and specialization step must be justified. Do not assert that an arbitrary ring embeds into a field, that a split characteristic polynomial over a ring implies triangularizability, or that checking residue fields detects nilpotents. Build any needed triangularization API here in the shape of the cited upstream work, without waiting for it. The entire-input limit, coefficient estimates, A3.8(11), A3.9 and the preserved topology, tensor and distribution-family gaps remain.
