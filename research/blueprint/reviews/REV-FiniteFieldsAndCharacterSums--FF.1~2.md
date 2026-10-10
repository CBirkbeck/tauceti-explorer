# Independent review of FF.1, revision round 2

Job: `REV-FiniteFieldsAndCharacterSums--FF.1~2`, issue #6467. Reviewer:
Codex, session `codex-mANpiX`. Date: 2026-10-10. This session did neither
blueprint round and did not perform the preceding review.

**Verdict: accepted.** All eight nodes are justified as planning targets.
The two reader discrepancies that prevented the preceding review's acceptance
are corrected. The unconditional Hasse–Davenport product target still has its
explicit analytic dependency gap; acceptance does not discharge that gap.

The packet is a complete pass at target granularity under PROTOCOL §0 and §2.
FF.1 is correctly `planned`, with precise remaining work, rather than `closed`.
Every implementation flag remains `unchecked`.

| Item | Result |
| --- | --- |
| Nodes | 8 checked: 7 theorems and 1 construction; all verified |
| Mathematical nodes added, removed or corrected | 0 |
| Pinned baseline declarations | 32 confirmed; none added, removed or replaced |
| Direct supplier interfaces | 15 node statements checked, plus the requested RD.6 stage |
| Construction API and definition tests | 6 API items and 5 tests, all matched |
| Planets | 4, within the six-planet limit |
| Public source versions | 5 freshly obtained, with matching recorded hashes |
| Source issues | E750 rejected; E751 confirmed |
| Outstanding mathematics | 1 recorded analytic gap, comprising 2 supplier requests |

## Revision and corrections

I read the preceding review and round-two handoff, then checked the current
packet, reader and suggested file independently. The reader's source-audit
paragraph now identifies Cohen's fraktur prime ideal correctly and rejects
E750. It separately explains the author-confirmed multiplier erratum E751.
Its evaluation paragraph now describes all five tests, including evaluation
of X at the nonzero finite point 2 over F₃. Those were the preceding review's
two outstanding acceptance blockers.

The preceding in-place mathematical corrections are retained: the Fourier
boundary theorem does not depend on the older nontrivial-only expansion;
the product proof uses an exact Gamma quotient rather than arbitrary-root
uniqueness from reduction; and finite-product factorisation depends directly
only on the native Gauss sum and finite product/sum interchange.

This review changes only evidence and review metadata in the packet. It
replaces both source-issue `printed` fields with authored descriptions,
refreshes the source-access and baseline-reading receipts, supplies this
round's two source-issue verdicts, and replaces the top-level review with
eight individual verified entries. No mathematical statement, dependency,
API, test, planet or suggested declaration changes. The suggested file and
reader require no further correction.

## Source evidence and node checks

All readings below were performed on 2026-10-10. These are statement and proof
checks at the cited locators; no source passage is added to the repository.

| Source | Version and passages checked |
| --- | --- |
| [Kowalski, elementary exponential sums](https://people.math.ethz.ch/~kowalski/exponential-sums-elementary.pdf) | Author notes dated 14 September 2021: Proposition 1.10 and proof, printed pp.12–13; Proposition 1.13 and character conventions, pp.14–15; §2.1, pp.17–18. |
| [Cohen, Number Theory II](https://maths.dur.ac.uk/users/herbert.gangl/ch.pdf) | Publicly hosted 2007 Springer GTM 240 scan, ISBN 978-0-387-49893-5: Theorem 11.6.14 and proof, printed pp.372–375; Theorem 11.7.5 and Corollary 11.7.6, pp.386–387; Lemma 11.7.12, pp.390–391; Lemma 11.7.14, Corollary 11.7.15 and Theorem 11.7.16, pp.392–395. |
| [Conrad, Gauss and Jacobi sums](https://kconrad.math.uconn.edu/blurbs/gradnumthy/Gauss-Jacobi-sums.pdf) | Appendix (A.6), p.19, including footnote 9 and the trivial-factor convention. |
| [Bergström–Faber–Payne, arXiv v2](https://arxiv.org/pdf/2206.07759v2) | Version dated 17 October 2023: Lemma 5.2 proof, PDF pp.8–9, including its all-polynomial interpolation step and subsequent squarefree induction. |
| [Cohen, author errata](https://www.math.u-bordeaux.fr/~cohen/deabookerrata.pdf) | Dated 30 November 2008: Volume II entries, PDF pp.3–5, especially the printed-p.372 entry on PDF p.4; whole-file search for pp.390–391 and Lemma 11.7.12. |

The fresh SHA-256 values equal all five packet receipts. No unavailable
Volume I argument or private Robert text is claimed as personally read here.
The exact L3 statements, rather than a new source-reading claim, supply those
parts of the argument.

**Finite-field Fourier transport.** The actual field's additive group is
indexed through the predecessor's primitive-character shift bijection.
AC.0's `fourier_eq_basis_repr` identifies the normalized transform with the
native complex-basis coordinates, and `fourier_inversion_reindex` supplies
inversion through that indexing. Its Parseval theorem supplies the second
identity with the same coefficients. Probability normalization is on the
field side and counting normalization on the dual side. Nothing identifies
the additive group of F₄ with the cyclic group ZMod 4.

**Multiplicative Fourier boundary coefficients.** At zero frequency native
row sums give zero for a nontrivial character and (q−1)/q for the trivial
character. At a nonzero frequency, conjugation changes the additive
multiplier to −a, and the unit-shift theorem contributes χ⁻¹(−a). Since the
native trivial multiplicative character also vanishes at zero, its Gauss
sum is −1 and its nonzero Fourier coefficients are −1/q. Kowalski's differing
trivial-zero convention is explicitly converted.

**Digit and factorial distribution.** The digit arguments remain below
M=pᶠ−1, so padding to f digits and cyclic rotation are valid. Fractional-part
distribution gives the digit-sum identity. For b>0, the exact positive-fraction
Gamma multiplication theorem from L3 has no integer endpoint in this
application. Precision-one Gamma reduction and recurrence turn a cyclic
fraction into the inverse factorial of its low digit. Their product gives
the reciprocal digit-factorial product, and reduction of the Teichmuller
factor gives the stated power of m. The b=0 and m=1 boundaries are immediate
separately. Precision one is allowed at p=2; that congruence alone is never
used to identify an arbitrary binary root of unity.

**Hasse–Davenport product.** Conrad (A.6) verifies the exact target, including
χᵐ=1 and the j=0 factor. Cohen's Corollary 11.7.15 and Theorem 11.7.16(1)
provide the Gamma route. Permuting powers of the exact-order character and
reducing the exponent modulo (q−1)/m leave the target multiplier unchanged.
The zero residue case is a permutation with the trivial Gauss factor split
off. For a positive residue, digit sums cancel the π powers and the exact
Gamma quotient equals χ(m)⁻ᵐ. Each side has m source-negative Gauss factors,
so their signs cancel. Primitive-character shift transport extends the
canonical-character calculation to any primitive ψ.

I read the predecessor's character, prime-above-p and transport suppliers,
and the L3 Morita Gamma, recurrence, sharp reduction, orbit-power, exact
multiplication and Robert–Gross–Koblitz comparison statements with their
hypotheses. L3's normalized root has order dividing p−1; reduction identifies
that root. For p=2 the exponent is one, giving exact equality directly.
The proof does not infer uniqueness for unrestricted p-power roots.

The Robert comparison explicitly assumes both the actual coefficient bound
and the actual chosen-root splitting equality. RD.6's `dwork-isocrystal`
contains a prime coefficient estimate in its proof sketch and an inverse-sign
Frobenius interpretation, but does not export the two requested native
interfaces. The packet records this faithfully. Its requests specify the
formal series, normalized embedding and valuation, sign, Teichmuller lifts,
trace, root compatibility and p=2 boundary. The coefficient exponent and
valuation formulation agree after using vₚ(π)=1/(p−1). No extra analytic
closure is inferred from the exact Gamma multiplication identity.

**Projective evaluation.** The constructor uses the existing polynomial
submodule and its inclusion, followed by native `leval` at a finite point
or `lcoeff` at infinity. Infinity means the coefficient at the supplied
ambient degree, even when the polynomial has lower degree. The fixed
representatives [a:1] and [1:0] are explicit. The six API items cover
evaluation, generators, linearity and degree lowering without unfolding;
native linear-map extensionality and zero laws remain available.

**Uniform two-point evaluation.** Distinct finite points give an invertible
two-by-two system for the constant and linear coefficients. When infinity
occurs, prescribe the degree-d coefficient and solve for the constant
coefficient. Both leave d−1 free coefficients. This proves surjectivity and
the exact fibre size, including d=1. The excluded d=0 case would give a
diagonal image instead.

**Two-point character sums.** Uniform fibres give the stronger all-character
product of row sums, followed by native nontrivial-character vanishing.
The trivial/trivial boundary is qᵈ⁻¹(q−1)². This supplies BFP's interpolation
ingredient, strengthened to d≥1 and arbitrary native characters. It does
not claim the paper's separate squarefree induction or full Lemma 5.2.

**Finite-product Gauss factorisation.** The component character
factorisations are supplied as hypotheses. Unfolding the native sum and
using `Fintype.prod_sum` proves the result, including trivial components and
the empty index type. The norm and trace applications consume presentations;
neither a classification of characters nor a construction of finite étale
algebras is hidden in this node.

## Pinned baseline and ownership

I confirmed the names, enclosing typeclass hypotheses and statements of all
32 entries at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and
Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

| Module family | Declarations checked | Compatibility checked |
| --- | --- | --- |
| AddChar and finite-field AddCharacter | `AddChar`, `IsPrimitive`, `FiniteField.primitiveChar`, `to_mulShift_inj_of_isPrimitive`, `sum_eq_ite` | The built primitive character uses a cyclotomic target with different characteristic; it is not already the chosen complex trace character. Row sums and shift injection have the required domains. |
| FiniteAbelian/PontryaginDuality | `AddChar.card_eq`, `complexBasis`, `complexBasis_apply`, `sum_apply_eq_ite` | Actual finite additive commutative groups, complex values and native basis vectors. |
| MulChar/Basic | `MulChar`, `sum_eq_zero_of_ne_one`, `sum_one_eq_card_units` | Every nonunit maps to zero, including for character 1; trivial sums count units. |
| GaussSum | `gaussSum`, `gaussSum_mulShift_eq`, `star_gaussSum_eq`, `gaussSum_one_left`, `gaussSum_mul_gaussSum_eq_card`, `gaussSum_sq`, `gaussSum_ne_zero_of_nontrivial` | Native positive finite sum, inverse-character shift, primitive additive input, nontrivial multiplicative exceptions, domain/cardinality assumptions and quadratic restriction on the square theorem. |
| JacobiSum/Basic | `jacobiSum_one_one`, `jacobiSum_eq_gaussSum_mul_gaussSum_div_gaussSum`, `jacobiSum_mul_jacobiSum_inv`, `gaussSum_pow_eq_prod_jacobiSum` | Field/domain assumptions, nontrivial product and individual characters where needed, coefficient cardinality nonvanishing for division, and character order at least two for the power identity. |
| LegendreSymbol/QuadraticReciprocity | `legendreSym.quadratic_reciprocity` | Distinct odd prime assumptions and the native parity exponent. |
| Native polynomial modules | `Polynomial.degreeLT`, `degreeLTEquiv`, `monomial_coe_mem_degreeLT`, `lcoeff`, `leval` | Degree bound, finite coefficient equivalence, monomial membership and F-linear evaluation/coefficient maps. |
| Digits/Defs and BigOperators/Ring/Finset | `Nat.digits`, `Fintype.prod_sum` | Native digit order and empty digit list at zero; finite dependent product/sum interchange, including an empty index. |
| Tau Ceti CharacterOrthogonality | `CommGroup.sum_monoidHom_apply_eq_ite` | Finite commutative groups, domain coefficients with enough roots of unity, and the actual `CommGroup` namespace. |

The FF.1 library audit and accepted RS-03 ownership decision are respected:
built character and Gauss/Jacobi identities are imports, AC.0 owns generic
Fourier analysis, and FF.1 supplies the field-specific comparisons. The three
items in the predecessor's remaining list have targets here or exact supplier
nodes. Assembly must attach this route to the predecessor's product target
and replace its coarse AC.0 dependency/request; the remaining list records
that task rather than asserting that the predecessor was edited.

I read current upstream CharacterTheory and Completed/OrthogonalL2Bases as
roadmap examples and searched current upstream suggested files, including the
nine newer roadmaps, and the current Tau Ceti source tree for these targets.
No replacement owner or existing implementation of the missing product,
digit-distribution or prescribed-degree evaluation targets was found.
The inspected upstream commit is
`3c18d9fbfceed0dc5c1edb1070a3927152d19e28`; current Tau Ceti is
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Neither read-only tree was built.

I checked the original and qualified verification of RT-AREA-finitefields/7–10
and the historical EXT-08 review's finite-fields section. Their treatment is
correct: /7 imports elementary identities while preserving geometric content;
/8 retains the predecessor's signed lifting target and gives the distinct
product formula its own exact source; /9 keeps Lang/cohomology/duality in FF.2
and shared conductor infrastructure with its owners; /10 records historical
promotion and forwarding as maintainer integration work. Acceptance here
does not certify that historical queue integration has occurred.

## Source-issue verdicts

**E750: rejected.** I rendered printed pp.390–391 (PDF pp.412–413).
Both occurrences in Lemma 11.7.12 and its proof use the fraktur prime ideal.
They express the maximal-ideal normalization that the plan needs. The ordinary
rational prime in the root equation is visibly different. The stronger
rational-prime congruence challenged by the earlier allegation is not Cohen's
statement. The errata search supplies no correction at these pages.

**E751: confirmed.** Theorem 11.6.14's first line on printed p.372 names a
different multiplier from the displayed identity and proof. Cohen's errata,
PDF p.4, explicitly corrects both occurrences to N. The mathematics already
uses the corrected variable. No additional error affecting the reviewed
targets was found.

## Validation and remaining work

The recursive prerequisite traversal reaches 137 packet nodes and 590 edges,
with 244 library-reference leaves. It has no cycles, unresolved node references
or duplicate node ids in that closure. Its sole unexpanded stage leaf is the
explicitly requested RD.6 stage. This is a structural check; it does not
recertify all supplier packets' library citations.

Independent scratch calculations passed 17,517 exact digit/factorial cases
(69 at p=2) and 192 ordered projective-point/degree fibre cases over F₂, F₃
and F₅, with degrees one through four. Complex numerical checks passed 13,827
Hasse–Davenport cases, 14,830 boundary coefficient cases and 87 primitive-shift
Fourier inversion/Parseval cases over prime fields of orders 2, 3, 5, 7, 11,
13, 17 and 19 and extension fields of orders 4, 8 and 9. Of the product cases,
882 use extension fields. These check signs and boundary conventions; they
are not formal proofs or analytic-gap certificates.

The packet checker reports zero errors and zero warnings. The suggested file
elaborates through `lean-check` at the pinned Mathlib with exit zero and only
the expected declaration-uses-`sorry` warnings. Its eight node forms, six API
declarations, five named examples and companion all-character identity match
the packet and reader. The constructor is concrete; admitted theorems and
examples remain planning signatures. All four planet names denote key
constructions or theorems and avoid source locators.

No correction remains for this review. The next mathematical work is to obtain
both precise RD.6 interfaces and instantiate the L3 comparison. Assembly must
reconcile the predecessor's old root gap and coarse Fourier request with this
part, retaining one product target and planet. Historical EXT-08 integration
remains with the maintainer. No new supplier question or scope move is added.
