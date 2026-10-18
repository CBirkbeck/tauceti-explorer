# Independent package review: InductionRestrictionPartII, revision 2

Refs [#10391](https://github.com/CBirkbeck/tauceti-explorer/issues/10391).
Reviewer: Codex, session `codex-Gl4gSC`, 18 October 2026.

**Verdict: accepted with the corrections in this review.** The revised package imports the
shared Inverse Galois constructions and retains the additional homological, fixed-fiber and
finite-calculation targets. One further overlap with the current weight-polynomial library
was removed. No unresolved package defect remains from this pass.

## Independence and material reviewed

Neither the original package nor its revision was written by this reviewer. The input is
commit `b414aef35a7d5580933394d54bfed36c1bdab988` from
[PR #10392](https://github.com/CBirkbeck/tauceti-explorer/pull/10392), following the original
package in PR #9631. Read the complete package README and Suggested.lean, its metadata,
the previous independent review, the revision handoff, and the accepted packet's retained
statements, APIs and Checks. The historical packet is unchanged.

The form was compared with the current RepresentationTheory/InductionRestriction and
AlgebraicTopology READMEs and suggested files, with ProfiniteArithmetic and AlgebraicCodingTheory
also read for their interfaces. The README keeps the full statements, sources, dependencies,
definition APIs and worked examples; the suggested file states only targets whose carriers
exist at the pins. Its short real-bodied adapters do not develop the missing Schur-cover theory.

Read `data/library-coverage.json`; this new Part II has no dedicated entry there. The relevant
pinned declarations were therefore inspected directly, including their variable contexts:
Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. These include extension exactness and section data,
the native bar differentials and H2 quotient, homology functoriality with its coefficient map,
the H1 tensor comparison and cyclic homology, finite abelian decomposition, elementary-2
quotients, factor sets, finite-vector-space cardinality and rank-nullity.

## Ownership and closure

The duplication audit used the read-only current roadmap main
`0d144d044dacebca17b654695b6f1ad58f159b27` and current Tau Ceti
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Searches covered all current README/suggested
files, including Completed and the nine roadmaps newer than the atlas snapshot, and the
current library. Searches used the homology coefficient system, central extensions, Hall
coinvariants, commuting-pair cycles, square quotients, finite binary maps and marked wreath
models as well as declaration names. The continuous cohomological five-term APIs do not
supply the discrete integral homology sequence here; singular-chain product theorems do
not supply its native bar-complex comparison.

The authoritative Inverse Galois supplier was also read at
[TauCetiRoadmap PR #850](https://github.com/TauCetiProject/TauCetiRoadmap/pull/850), head
`164e3b19e90ef83d80c3c51722ad429cedfc7f02`, specifically all of IG.3.4–IG.3.5.
The revision's removal of the previous review's 43 overlapping targets is correct. The full
old-to-new ownership and numbering maps are in
[the revision handoff](../handoff/PKG-InductionRestrictionPartII~2.md).
Reduced multipliers, reduced covers, marked presentations and fiber products, class degrees,
coprime compatible covers, unit corrections/actions and twists are now supplier contracts.
The extra RS.0 universal-coefficient, class-map, cover-comparison and complement-conjugacy
material is likewise imported rather than reconstructed. The remaining stronger variants
state their difference explicitly.

One additional removal was necessary in this review:

| Removed local item | Existing supplier | Retained addition |
| --- | --- | --- |
| `parityWeightEnumerator`, including its Lean definition and two examples | `TauCeti/InformationTheory/Coding/Weight/Enumerator.lean`, `Set.weightPolynomial`, on arbitrary finite sets of words | RS.4.18 lower-bound translation of a parity set and its integer-degree generating series |
| `parityWeightEnumerator_coefficient` | The same module, `Set.coeff_weightPolynomial` and `Set.weightDistribution` | No second coefficient theorem |
| `parityWeightEnumerator_at_one` | The same module, `Set.eval_one_weightPolynomial` | No second cardinality evaluation theorem |

The current polynomial has coefficients in integers, so the retained counting series is stated
over integer formal power series. The polynomial and its generic API are deferred only in the
ownership section. The coordinate lower-bound translation remains a new adapter, with a
unique coordinate decomposition and an explicit coefficient formula. The current module is
absent at the pins; its consumer is a README target, not a reconstructed Lean definition.

| Retained layer | Prerequisite closure and distinction |
| --- | --- |
| RS.0 | Uses IG.3.4's oriented class map and primary/complement comparison. Owns full five-term exactness, all-positive-degree finiteness and Hall coinvariants. Current Tau Ceti supplies transfer and corestriction-after-transfer; the opposite norm identity remains an explicit proof obligation here. |
| RS.1 | Uses IG's cycles, covers and individual-class bijections. Owns the power-law boundary, local normalization and the stronger equality of the homology image with Q_c. The latter uses RS.0 exactness, not merely the supplied zero composite. |
| RS.3 | Uses IG.3.4–IG.3.5. Owns multiplicativity restricted to the central kernel, the finite-level bound, and the bounded/fixed/orbit degree restrictions. No second action or twist is built. |
| RS.4 | Uses the marked model, elementary-2 quotient and finite abelian/linear algebra. Gives the signed power equation, zero-or-torsion counts, filtration, threshold, affine cosets and counting series, with proofs for the derived claims. |
| RS.6 | Uses earlier layers and IG's Schur-cover identification. Certificates require a separately justified ordinary cover. The native degree-two Künneth comparison belongs to the anti-diagonal target; its exterior-square map and naturality are now explicit. ArithmeticStatistics supplies downstream embedded-type identifications, not prerequisites for the abstract certificates. |

The tier-order check found no retained upward arithmetic dependency and no
`FoundationsAndLibraryIntegration` or `UPSTREAM:` placeholder. No ownership was moved upward.

## Source checks

There were no author-flagged unverified locators. For the required random sample, sampled
15 of the 41 numbered subsections in document order using Python `random.Random(10391)`.
Each selected source was opened and its stated label and location checked:

| Subsection sampled | Location read and result |
| --- | --- |
| RS.6.4 | Wood 2019, arXiv v2 §2.3 p.8, Table 2 p.34, Appendix opening p.35: reduced relations and finite examples. The certificate format is the roadmap's addition. |
| RS.4.6 | Wood 2019, Proposition 4.1 and equations (5)–(6), pp.18–19: the single odd class-degree case. |
| RS.4.17 | Same fixed-fiber equation; rank-nullity and the nested-kernel histogram are deductions, explicitly identified as such. |
| RS.0.3 | Löh, Theorem 1.7.15 pp.63–64; Theorem 3.2.12 p.123 and Proposition 3.2.13 p.124; LWZB Lemma 12.10 p.53; EVW Example 9.3.2 p.57. These support transfer, conjugation and the coprime comparison. |
| RS.4.19 | Wood 2019 pp.18–19 plus the stated surjectivity/independence argument, not a separately numbered source theorem. |
| RS.4.4 | Wood 2019 equation (6) pp.18–19; the square-times-torsion equivalence is proved directly in the package, including r=0. |
| RS.6.2 | Wood 2019 §2.3 p.8; multiplicativity follows by expanding central commutators, with Table 2 and Appendix pp.34–35 providing the application. |
| RS.3.2 | Wood 2021, Remark 4.1, author PDF p.8: the group-order-squared modulus. |
| RS.4.5 | Wood 2019 Proposition 4.1 pp.18–19; the general compatible-fiber formulation follows from the displayed equation and a homomorphism-fiber bijection. |
| RS.4.7 | Wood 2019 Proposition 4.1 pp.18–19: even degrees above the identity. |
| RS.4.9 | Wood 2019 equation (6) pp.18–19, followed by the package's cyclic-factor computation of the threshold. |
| RS.4.16 | Same equation and the package's two simultaneous binary linear constraints; no separate source theorem claimed. |
| RS.4.12 | Same equation, with central lift changes multiplying squares by squares. |
| RS.1.1 | Wood 2021 §2.1 p.2: oriented two-cycle; the three-chain boundary is a direct calculation against the pinned differential. |
| RS.4.11 | Wood 2019 pp.18–19 and the explicit generation argument in the abelianization. |

Additionally read Wood 2021 §2 and Theorem 2.5 pp.2–4, and the action formula (4) on p.8;
LWZB §12 pp.47–48, the paragraph before Proposition 12.7 p.50, and the proof following
Lemma 12.10 pp.53–54; EVW §7.3 p.34; and Löh's transfer, low-degree spectral-sequence
and Künneth passages. All thirty-one values were compared with Wood's Table 2, arXiv v2 p.34,
including the order-96 construction on p.35. This is source verification of the listed values,
not an independent computation of their Schur covers.

The kernel-automorphism statement in RS.3.1 is justified by the package's coordinate calculation:
both the kernel power map and the correction map are multiplicative there. The warning about
nonmultiplicativity in LWZB's discussion does not replace that calculation; nonmultiplicativity
on the full marked extension is retained as a negative control.

Source retrieval on 18 October 2026:

| Source | Freely readable version used | SHA-256 of downloaded PDF |
| --- | --- | --- |
| Wood 2019 | [arXiv v2](https://arxiv.org/pdf/1702.04644v2) | `2eacf07f9c79a08a65bbfa332b964f0f9bd4ab5abb93e5db8be72e43669be1bd` |
| Löh | [30 July 2019 author notes](https://loeh.app.uni-regensburg.de/teaching/grouphom_ss19/lecture_notes.pdf) | `d4f2d819bfa85c57277db74bf749d05f03e85833c76e89eab99127f077d2cd76` |
| EVW | [arXiv v1](https://arxiv.org/pdf/1212.0923v1), withdrawn | `3cd5624f85450b06f4be8b37d08fb480dde8dc7c68f9a5bd7ffc57c15c04a4e4` |
| Liu–Wood–Zureick-Brown | [arXiv v2](https://arxiv.org/pdf/1907.05002v2) | `7f1e85da49b23f80fc7abe9a68dbc5384ab216dfa5d55cd5e3223ba3268abed9` |
| Wood 2021 | [Author PDF](https://people.math.harvard.edu/~mmwood/Publications/lifting.pdf), read through the browser | No local PDF hash; direct download returned HTTP 403 |

The NSF journal downloads were unavailable during this review. The package already supplies
the arXiv crosswalks, which were used above; the journal-PDF pagination was not independently
rechecked. Löh's printed pages are eight less than the PDF page numbers. The Wood 2021 link
was changed to the accessible author host. No source passages were added to the repository.

## Definitions and adversarial mathematics

Every retained definition was checked for domain, API and at least three discriminating
Checks. The inventory covers `localClassNormalization`; `boundedDegreeSlice`,
`powerFixedDegree`, `DegreeOrbitSet`; `squareObstruction`, `torsionImageFiltration`,
`obstructionThreshold`, `paritySquareMap`, `jointParityMap`; `ReductionCertificate`,
`finiteParityAlgorithm`, `order96Type`, `antidiagonalModel`, `sumKernelModel` and `graphModel`.
The light `swapAction`, `SwapWreath`, `abelianizedSum` and `outsideInvolutions` adapters now
have explicit independent Checks too. `Multiplier` and `C₂` are abbreviations of supplied
carriers. The replacement RS.4.18 has degenerate, nonzero, lower-bound and coefficient Checks.

| Statements and conventions checked | Instances and reasoning | Correction or outcome |
| --- | --- | --- |
| RS.0.1, all exactness and stem consequences | Split central extension; C4 over C2; D8 over C2 squared; noncentral S3 over C2; arbitrary free-presentation kernels R contained in T | Tail exactness needs no centrality. The earlier terms do. No unsupported spectral-sequence API is assumed. |
| RS.0.2, positive-degree annihilation and finiteness | Trivial group; even/odd positive cyclic degrees; H0 equal to integers | Positive degree is essential. Finite generation plus bounded exponent supplies finiteness. |
| RS.0.3, Hall coinvariants and maps | Trivial complement; inversion on C3 squared; C2 times C2 without coprimality | Transfer norm is index on coinvariants. Inversion acts positively on the exterior square. Noncoprime cross terms prevent the claimed splitting. |
| RS.1.1, signs and powers | Expand the three-chain boundary without requiring its first two entries to commute; telescope at n=0,1,2 and higher | The unit boundary is necessary in unnormalized chains. Reversing the oriented pair changes sign. |
| RS.1.2–RS.1.3, normalization and commutation | Kernel elements; S3 transpositions; distinct C3 classes; independent D8 quotient coordinates | Replaced the vague multiclass non-example by C3 residues 1 and 2. Centrality and a common projected element explain commutation. |
| RS.1.4, homology image equality | Empty c and all nonidentity c in C2 squared, using D8/Q8 and the identity quotient | Images are respectively zero and the entire multiplier. Exactness gives equality; the zero composite alone does not. |
| RS.3.1–RS.3.2, kernel automorphisms and finite level | S3 noncommuting coordinates at the inverse unit; C3 residues 2 and 11 modulo 9; trivial group modulus 1 | Restricted kernel multiplicativity and the cover exponent bound give the asserted scope. |
| RS.3.3–RS.3.5, all degree restrictions | Empty class set and negative total degree; two-coordinate bound 1 and total 3; C3 swap, unequal totals and equal-total distinct orbits | Added n=-1 to the empty-set Check. Fixed-orbit total degree is weighted by orbit size. No slice is treated as a subgroup. |
| RS.4.1, lift squares | Q8 and D8 over C2 squared with empty c | Generalized this elementary lemma to any x with x squared equal to 1, independent of generation or membership in c, so the examples satisfy its hypotheses. Later fixed-fiber targets keep generation. |
| RS.4.2–RS.4.3, obstruction choices and sign | Identity degree; one marked generator; incompatible degrees; square classes in C8; C14 over C2 with kernel C7, degree 3 and q=3 | Added a nontrivial representative with zero square class and a signed solution h=a versus the wrong h=a inverse. The central model is explicitly not claimed to be a reduced cover. Lean pins the kernel sign. |
| RS.4.4–RS.4.7, solvability and all fiber counts | r=0; q=1; C4 obstruction with two torsion elements but no solution; odd/even and negative degrees | The zero-or-torsion alternative is essential. q=1 is treated directly; the valuation criterion excludes it. |
| RS.4.8–RS.4.10, filtration, minimum and valuation | Odd groups; every cyclic order 1 through 32; C8; C4 times C8; q=3 through 65 | Image in the square quotient differs from the torsion subgroup. Exhaustion justifies the minimum. Thresholds 2 and 3 distinguish mixed cyclic factors. |
| RS.4.11–RS.4.13, abelianization and square columns | S3 and S6 involution classes; lift change by a central factor; two equal nonzero binary columns | Added a nonzero-column adapter Check; s(e1+e2)=0 rejects a zero map and set-union behavior. It is labelled an algebraic fixture. |
| RS.4.14–RS.4.17, affine conditions, ranks and histograms | Every pair of binary row maps in dimensions 0 through 4; zero/full filtration spaces; every signature translate | Compatibility and obstruction are both necessary. Replaced a repeated Check with a=id, s=0 to detect dropping the first coordinate. Nested kernels justify natural subtraction. |
| RS.4.18, lower bounds and counting series | N=0 through 3, bounds 0 through 3, every parity subset and totals 0 through 12; bound-1 examples with one and two coordinates | Removed the duplicate polynomial API. The formal denominator is a unit with constant coefficient 1; N=0 is explicit. The coefficient of X4 for N=2, bound 1 and C={00,11} is 3. |
| RS.4.19, independent classes | Empty vector space; C2 with its sole class; dependent three nonidentity classes of C2 squared | Surjectivity plus independence gives the unique compatible parity; independence alone does not replace generation. |
| RS.6.1–RS.6.3, odd-index reduction and centralizer relations | Odd Hall subgroup with C2 quotient; failure for even H; D8 lift commutators; noncommuting projected pairs | Odd multiplier order kills all involution relations. Centralizer generators suffice only after restricting the second argument to that centralizer. |
| RS.6.4–RS.6.5, certificate and algorithm | Trivial group; D8 reduction; rejection of C4 over C2; trivial kernel; C8 algebraic threshold fixture | A central surjection and kernel size alone do not certify a Schur cover. The algorithm is conditional on its certified input. |
| RS.6.6–RS.6.7, order-96 target | Enumerated A4 modulo V4, sum-kernel pairs, swap multiplication, outside involutions and conjugacy | Kernel order 48; total order 96; twelve outside involutions in one generating class. Reduced multiplier C2 remains a certificate target, not a result of this enumeration. |
| RS.6.8, anti-diagonal model and multiplier | C1, C3 and C2; products of outside elements; conjugation by squares; cyclic, rank-two and rank-three odd bases | Specified the multiplicative ZMod carrier. Added the natural exterior-square map through oriented commuting classes and its Künneth proof route; inversion acts positively. Oddness is necessary for the one-class claim. |
| RS.6.9, sum-kernel, graph and perfect models | C3 sum versus difference; A4, SL2(F3), order-21 group; perfect A5; involutive theta, inverse transpose versus transpose | Membership, embedding multiplication and stated group orders agree. The marking requires square 1 as well as a nontrivial swap coordinate. |
| RS.6.10, all thirty-one rows | Compared every source value; abelian exterior-square formula; rows 8,29,31 and the explicit nonabelian models | No value changed. Perfect bases do not imply trivial reduced multiplier. Arithmetic-type enumeration stays downstream. |

Independent Python enumeration passed **78,050 assertions**. To reproduce its scope: enumerate
all residues b in C_n for n=1..32 and r=0..32; compare power-equation solution sets with
squares times r-torsion, their zero-or-kernel cardinality, and the positive-r valuation criterion.
This gives 17,424, 17,424 and 16,896 checks respectively. Enumerate all 32 elements of C4 times
C8 for t=0..4 (160 checks). For binary dimensions 0..4 enumerate every pair of row maps a,s,
both zero/full obstruction quotients and every translate: 682 rank counts, 682 nested-kernel
checks and 9,362 affine-set comparisons. Compare direct bounded degree enumeration with the
binomial coefficient formula for every parity subset in dimensions 0..3, bounds 0..3 and
totals 0..12 (14,456 coefficients). Expand the oriented three-chain boundary for all triples
in S3 times C2 satisfying the two required commuting conditions (528), then telescope all
commuting pairs for n=0..5 (432). Three A4 model assertions and the C14 sign witness complete
the total. These computations test statements; they do not replace their planned proofs.

## Lean signature comparison and validation

Compared more than ten signatures directly with the README:

| Lean declaration | Scope checked |
| --- | --- |
| `abelianization_map_surjective`, `abelianization_exact_of_extension` | Arbitrary extensions, multiplicative tail, correct image and kernel |
| `abelianization_map_bijective_of_stem` | Stem hypothesis explicit; no finiteness requirement |
| `integralHomology_card_smul`, `integralHomology_finite` | Native integral carrier; positive degree encoded by n+1 |
| `commutator_order_boundary` | Arbitrary group, commuting x,y and natural n, with the same oriented difference |
| `local_factors_commute` | Central extension; both elements over 1 or the same c0 |
| `boundedDegreeSlice`, `powerFixedDegree` | Integer bounds and totals; fixed subgroup of a coordinate permutation |
| `square_torsion_solvability` | Arbitrary commutative group, including r=0 |
| `torsionImageFiltration`, `obstructionThreshold` | Correct square quotient and torsion image; finite hypothesis on the minimum |
| `two_adic_survival` | Arbitrary finite commutative kernel, odd q and q>1; no unnecessary bound on q |
| `involution_abelianization` | General generated group and x squared equal to 1, as explicitly stated in prose |
| `jointParityMap`, `jointParityMap_kernel` | General F2 modules, both coordinates retained |
| `rank_parity_count` | Finite domain, unrestricted codomain, arbitrary affine translate |
| `odd_index_two_reduction`, `centralizer_commutator_hom` | Normal odd Hall subgroup of index two; separately central projected commutators |
| `sumKernelModel_card`, `sumKernelModel_eq_top_of_perfect` | Correct product of cardinalities and perfect-group specialization |
| `antidiagonal_marking`, `antidiagonal_multiplier` | Generation for every abelian base; odd finite base for conjugacy and the homology comparison |

Every README definition is represented by a light declaration, its stated specialization, or
the closing list of targets requiring missing carriers. The additional Künneth/exterior-square
names and lower-bound consumer are included there. No supplied IG carrier was redeclared.

- Final `lean-check` on package Suggested.lean: **exit 0, 37 warnings, all declarations using
  `sorry`; no errors or other warnings**. The file has 375 lines. This is elaboration, not
  proof verification.
- `python3 scripts/check_sorry_data.py` on Suggested.lean: exit 0, no offenders.
- `python3 scripts/check_blueprint.py research/blueprint/packets/InductionRestrictionPartII.json`:
  exit 0, zero errors and warnings; 109 historical nodes, 124 API items, 96 tests, 30 planets.
- `python3 research/blueprint/intake.py check-files` on the four changed deliverables and own
  handoff: zero problems.
- `git diff --check`: clean. No local paths, quoted source passages, process placeholders or
  unverified-source claims were added to the roadmap.

The package is ready for the maintainer's upstream draft PR, with IG.3.4–IG.3.5 as its named
supplier. The earlier handoff records downstream references needing their owners' retargeting;
this review does not edit those other packages or certify their work.
