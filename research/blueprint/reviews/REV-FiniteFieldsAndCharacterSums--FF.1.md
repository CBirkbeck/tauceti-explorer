# Independent review: FiniteFieldsAndCharacterSums, FF.1

**Verdict: needs_changes.** Review of BP-FiniteFieldsAndCharacterSums--FF.1 by Codex, session `codex-yVbmxa`, on 5 October 2026, for [issue #6305](https://github.com/CBirkbeck/tauceti-explorer/issues/6305). The original author was Codex in session `codex-LExbxM`; this reviewer did none of that work.

The corrected mathematical packet is a sound, complete target-level planning pass. All eight nodes and all 32 baseline citations are justified. Its explicit analytic gap does not prevent acceptance of a planning pass. Acceptance is withheld because the accompanying reader still presents the rejected E750 allegation as a published source error. The issue authorizes edits to the packet, suggested file and review report, but not the reader. The precise remaining correction is supplied below.

## Counts and changes

| Item | Result |
| --- | --- |
| Nodes | 8: 7 theorems, 1 construction |
| Node verdicts | 4 verified, 4 corrected, 0 added, 0 unverifiable |
| Baseline declarations | 32 confirmed: 31 Mathlib, 1 Tau Ceti; none removed, replaced or added |
| API items | 6, unchanged |
| Definition tests | 5, including 1 added by this review |
| Planets | 4, unchanged |
| Public source files | 5; all recorded SHA-256 hashes independently matched |
| Source allegations | E750 rejected; E751 confirmed; none added |
| Requests / gaps | 2 / 1, unchanged |
| Coverage | FF.1 planned; packet complete; neither stage nor packet closed |

The complete change ledger is:

1. Record Kowalski's actual edition, 14 September 2021.
2. Remove the predecessor's nontrivial-only Fourier expansion from the boundary coefficient node's direct prerequisites. The proof derives the formula from the exact AC.0 comparison and native character lemmas. The older target remains an application/comparison in the proof outline.
3. Correct E750's literal source transcription and explanation, retain its identifier as a rejected historical allegation, and add its independent review verdict. Correct the product completion proof and chosen-root supplier request wherever they repeated the allegation.
4. Add the independent confirmation of E751 from Cohen's own errata.
5. Add `projectiveEvalTests.finite_nonzero_linear` and its matching suggested example: over F₃, evaluation of X at the finite point 2, with ambient degree 2, is 2. Update the construction's acceptance count from four tests to five.
6. Remove norm/trace lifts from the product-factorisation node's direct prerequisites. They are application data; the proof needs only the native Gauss sum and finite product/sum interchange. The application discussion remains.
7. Add the top-level review object, with a verdict for every node, this report, and the required job handoff.

No declaration target was weakened or renamed. No accepted predecessor, reader, atlas data or supplier packet was edited.

## Public source verification

The URLs below are the actual downloaded texts; the recorded hashes and editions identify them. Every node locator and excerpt was checked, with source hypotheses distinguished from the specializations or elementary extensions derived by this packet.

| Source | Sections read and result |
| --- | --- |
| [Kowalski, elementary notes](https://people.math.ethz.ch/~kowalski/exponential-sums-elementary.pdf) | Proposition 1.10 and its proof, pp.12–13; Proposition 1.13, p.14; multiplicative zero convention p.15; Gauss sums and transport pp.17–18. The normalized finite additive-group Fourier identities support the field-coordinate comparison. The author's trivial multiplicative character convention is explicitly translated to native zero extension. |
| [Cohen, Volume II, public 2007 scan](https://maths.dur.ac.uk/users/herbert.gangl/ch.pdf) | Theorem 11.6.14 and complete proof pp.372–375; Theorem 11.7.5 and Corollary 11.7.6 pp.386–387; Lemma 11.7.12 and comparison pp.390–391; complete §11.7.4 proofs pp.392–395. These support the cyclic Gamma/digit argument and exact product formula, including characteristic two. |
| [Conrad, Gauss and Jacobi sums](https://kconrad.math.uconn.edu/blurbs/gradnumthy/Gauss-Jacobi-sums.pdf) | Appendix p.19, formula (A.6) and footnotes 8–9. The product starts at j=1 on the left and j=0 on the right; native g(1,ψ)=−1 accounts for the alternative sign convention. Characters with trivial powers are allowed. |
| [Bergström–Faber–Payne, arXiv v2](https://arxiv.org/pdf/2206.07759v2) | Lemma 5.2 proof pp.8–9, including the all-polynomial interpolation argument and the separate squarefree induction. The packet isolates the former and derives its stronger uniform-fiber formulation; it does not claim the full squarefree lemma. |
| [Cohen's errata, 30 November 2008](https://www.math.u-bordeaux.fr/~cohen/deabookerrata.pdf) | Volume II entries pp.3–5 and whole-file search. The p.372 entry on PDF p.4 confirms replacing n by N twice. |

**E750 is not a source error.** On printed pp.390–391, corresponding to PDF pp.412–413, Cohen prints the fraktur ideal 𝔭 in the chosen-root congruence. Independently rendered page images show this; PDF font extraction identifies both modulus glyphs as EUFM10, while the ordinary integer p in π^(p−1)=−p uses CMMI10. The intended maximal-ideal condition is already the printed condition. The p=3 calculation in the original extraction refutes a stronger congruence modulo the rational integer 3 that Cohen never states. It therefore cannot establish a misprint. E750 now records this rejection, and no author correction is attributed to this locator.

**E751 is confirmed and already known.** The scan's n/N mismatch in the first line of Theorem 11.6.14 is precisely the correction in Cohen's errata. It has no mathematical effect on this packet's consistently named multiplier.

Robert's detailed analytic proof is not an independently read source of this review. The packet imports the exact interfaces and provenance already recorded by the L3 owner and leaves their RD.6 supply open. This is an explicit source/dependency boundary.

## Pinned baseline and library audit

Actual declaration statements and surrounding variables were read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Name indices were only locating aids. The reviewed FF.0–FF.5 library coverage and accepted RS-03 narrowing were also checked. The packet consumes the existing characters, orthogonality, basic Gauss/Jacobi identities, quadratic reciprocity, polynomial submodule and coefficient maps; it does not re-plan them.

| Confirmed declarations | Hypotheses/conventions checked |
| --- | --- |
| `AddChar`, `AddChar.IsPrimitive`, `AddChar.FiniteField.primitiveChar` | Native maps send zero to one; primitivity means nonzero shifts are nontrivial. The finite-field constructor uses a trace and cyclotomic target of different characteristic, rather than supplying an already chosen complex character. |
| `AddChar.to_mulShift_inj_of_isPrimitive`, `AddChar.card_eq`, `AddChar.complexBasis`, `AddChar.complexBasis_apply` | Primitive shifts inject; the complex additive dual has cardinality q; the native basis vector is the character. Together with the predecessor these justify reindexing, not replacement by a cyclic group of order q. |
| `AddChar.sum_eq_ite`, `AddChar.sum_apply_eq_ite` | Row and complex column orthogonality, with card at the trivial/zero argument and zero otherwise. |
| `MulChar`, `MulChar.sum_eq_zero_of_ne_one`, `MulChar.sum_one_eq_card_units` | Native characters vanish on nonunits, including the trivial character. The domain-valued row sum vanishes for a nontrivial character; the trivial sum counts units, hence q−1 over a field. |
| `gaussSum`, `gaussSum_mulShift_eq`, `star_gaussSum_eq`, `gaussSum_one_left` | Native finite-ring sum; the shift multiplier must be a unit and contributes χ⁻¹; conjugation inverts both characters; trivial multiplicative sum is −1 over a finite field with domain values and nontrivial additive character. |
| `gaussSum_mul_gaussSum_eq_card`, `gaussSum_ne_zero_of_nontrivial`, `gaussSum_sq` | Nontrivial multiplicative character and primitive additive character; nonvanishing needs card nonzero in the target. The quadratic square has the χ(−1) factor. All extra target hypotheses hold over ℂ. |
| `jacobiSum_one_one`, `jacobiSum_eq_gaussSum_mul_gaussSum_div_gaussSum`, `jacobiSum_mul_jacobiSum_inv`, `gaussSum_pow_eq_prod_jacobiSum` | Native J(1,1)=q−2. Division requires nontrivial product and nonzero card. The inverse product requires both characters and their product nontrivial, and different characteristics. The order-power formula has the stated finite interval and order at least two. These are imports, not new targets. |
| `legendreSym.quadratic_reciprocity` | Odd distinct primes and the native sign exponent; retained solely as existing baseline context. |
| `Polynomial.degreeLT`, `Polynomial.degreeLTEquiv`, `Polynomial.monomial_coe_mem_degreeLT`, `Polynomial.lcoeff`, `Polynomial.leval` | Native coefficient-vanishing submodule, coefficient linear equivalence, indexed monomial membership, and actual linear coefficient/evaluation maps. These implement the construction without a new polynomial carrier. |
| `Nat.digits` | Least-significant-first native digits and the empty digit list at zero; hence digit sum zero and factorial product one at zero. |
| `Fintype.prod_sum` | Finite dependent product/sum interchange over a commutative semiring, with the needed finite/decidable instances; includes empty products. |
| `TauCetiCommGroup.sum_monoidHom_apply_eq_ite` | Finite commutative-group character orthogonality with its `HasEnoughRootsOfUnity` hypothesis. Verified at the Tau Ceti pin; not silently generalized to an arbitrary value ring. |

All 32 entries provide their stated baseline material. None required replacement or a missing adapter node.

## Nodes, closure and API

| Node suffix | Verdict | Independent check |
| --- | --- | --- |
| `finite-field-fourier-transport` | verified | Exact AC.0 transform/Parseval nodes and their native basis-coordinate API supply the normalized formulas. The predecessor supplies the primitive shift bijection. Both identities use that same field reindexing. |
| `multiplicative-fourier-boundary-coefficients` | corrected | At a=0 use the native row sum; at a≠0 conjugation gives −a and native Gauss transport gives χ⁻¹(−a). For χ=1 the coefficients are (q−1)/q and −1/q. The redundant older target dependency was removed. |
| `digit-product-distribution` | verified | Padded cyclic digits and fractional-part distribution give the sum equality. The exact L3 Gamma identity at k=mb, sharp reduction at precision one, and recurrence at −r₀ give 1/h(r) and the displayed m exponent. b=0, m=1 and p=2 are handled explicitly. |
| `hasse-davenport-product-completion` | corrected | Character exponents reduce by permutation to b in [0,d). b=0 uses the trivial factor −1. For b>0 exact Gamma multiplication gives χ(m)^(−m), and m source-negative Gauss factors occur on each side. Prime-to-p root uniqueness, with exponent p−1=1 at p=2, avoids the old arbitrary-root argument. Corrected E750 attribution; analytic supply remains open. |
| `projective-polynomial-evaluation` | corrected | The actual definition composes the native submodule inclusion with leval or lcoeff. At infinity it uses the prescribed degree, not leadingCoeff. Added the fifth finite-point test. |
| `projective-two-evaluation-uniform` | verified | For two finite points, solve the constant/linear coefficients with determinant y−x. With one infinite point, fix the top coefficient and solve the constant term. There are d−1 free coefficients, including the d=1 boundary. |
| `projective-two-point-character-sum` | verified | Uniform fibers give q^(d−1) times the two row sums, proving both the stronger all-character formula and the nontrivial vanishing theorem. No monic or squarefree restriction is introduced. |
| `gauss-sum-finite-product-factorisation` | corrected | For explicitly factored native characters, unfold the finite sum and use `Fintype.prod_sum`. No classification of product-algebra characters is asserted. Norm/trace lifts are applications, not direct proof inputs. |

The exact statements of all direct suppliers were read: the accepted predecessor's convention, shift, Teichmuller, cyclotomic-prime and transport nodes; AC.0's Fourier transform and Parseval; L3's Morita Gamma, recurrence, sharp reduction, exact source multiplication, orbit-power, Teichmuller quotient and Robert comparison; and RD.6's Dwork node. The normalized Gamma quotient and its binary case agree with the consumer. RD.6's inverse Frobenius factor does not already export the Robert-sign coefficient series or its chosen-root trace-character sum.

A recursive dependency traversal after the edits reaches 137 nodes and 590 edges, with no cycle. Its only stage leaf is RD.6, covered by the two precise requests. This graph check supplements the mathematical checks of direct suppliers; it is not a claim that every remote blueprint has been independently reviewed here.

The sole construction has six useful API items: finite/infinite evaluation, monomial formula, addition, scalar multiplication and vanishing below the ambient degree. Native `LinearMap` and `degreeLT` APIs provide zero preservation, extensionality and coefficient coordinates. No new universal property, quotient carrier or general interpolation object is needed for these uses. All five definition tests have matching suggested examples. The four planets describe the central Fourier comparison, product formula, projective evaluation and two-point character sum. Assembly must attach the product completion to the original product target and keep its single planet.

## Confirmed red-team findings and remaining work

The four assigned findings and their verifier qualifications were read, together with the accepted historical EXT-08 review and RS-03 scope.

| Finding | Result in this part |
| --- | --- |
| RT-AREA-finitefields/7 | Already built orthogonality, Gauss/Jacobi identities and reciprocity remain imports. The missing field-coordinate comparison is distinct from the generic AC.0 transform. FF.2 retains its geometric duality material. |
| RT-AREA-finitefields/8 | The accepted predecessor keeps the elementary norm/trace lifting theorem with source-negative sign. The present product theorem is a separate relation, with Conrad's exact endpoints and all-character boundaries. |
| RT-AREA-finitefields/9 | Lang torsors, Gauss cohomological realization, duality and Euler–Poincaré/Swan remain geometric FF.2 content with their external owners. The elementary product-of-fields sum comparison neither relocates nor replaces them. |
| RT-AREA-finitefields/10 | Historical EXT-08 acceptance does not imply its missing integration happened. This part correctly builds on the accepted blueprint and records maintainer assembly/integration separately. No extraction queue, decisions, atlas data or historical packet was altered. |

The Dwork requests are precise: actual Robert-sign native formal coefficients with the normalized local-field norm bound, and the actual coefficient tsum on Teichmuller lifts equal to the chosen trace character, including compatible π and ζ and p=2. These are one honest analytic gap. The complete/planned status is therefore correct under section 0; it must not be changed to closed. Existing remaining work on supplier instantiation and predecessor assembly remains precise and is not a reason to reject the pass.

**Required reader revision before acceptance.** In `research/blueprint/readmes/FiniteFieldsAndCharacterSums--FF.1.md`, replace the two source-audit paragraphs beginning “The source audit records two corrections” and “The n/N mismatch” (currently lines 166 and 168) with the following prose:

> The source audit confirms one known correction and rejects one proposed correction. Cohen's public scan is the 2007 Springer edition. Lemma 11.7.12, printed pp.390–391, already states the chosen-root ratio congruence modulo the fraktur prime ideal 𝔭, giving the intended maximal-ideal normalization. The PDF images and distinct fraktur font confirm this. The earlier E750 allegation confused 𝔭 with the rational integer p; its p=3 calculation does not refute the printed statement. Independent review rejects E750, and no correction to this source passage is required.
>
> The n/N mismatch in Theorem 11.6.14's first line is corrected in Cohen's November 2008 errata and confirmed as E751. The plan uses N consistently. Its exact Gamma route uses the printed maximal-ideal normalization, and does not infer that an arbitrary root of unity reducing to one is trivial.

Also update the definition-test paragraph (currently line 191) to say five tests and describe `finite_nonzero_linear`: E₂(some 2,X)=2 over F₃ catches evaluation at zero for every finite point. The old four tests remain valid. These reader changes require a revision job authorized to edit that deliverable and a fresh independent acceptance check. No mathematical node remains unverifiable after this review's corrections.

## Validation

`python3 scripts/check_blueprint.py research/blueprint/packets/FiniteFieldsAndCharacterSums--FF.1.json` reports **0 errors and 0 warnings**. The revised suggested file elaborated through `lean-check` at the pinned Mathlib with only `sorry` warnings and no errors. It imports Mathlib only; the pinned Tau Ceti citation was checked separately at its exact commit. Compilation checks signatures and examples, not admitted proofs.

Independent finite checks passed: 11,038 digit/factorial cases for p∈{2,3,5,7}, 1≤f≤4, every divisor m and every allowed b; 144 two-point/degree cases over F₂, F₃ and F₅ with d=1,2,3; F₄ Fourier inversion/Parseval and trivial coefficients; and 310 Hasse–Davenport character cases over prime fields through F₁₃ and F₄. The last check is numerical and is only a convention/boundary check, not a proof of the general target.
