# FIX-PKG-InductionRestrictionPartII~adv

Refs [#10389](https://github.com/CBirkbeck/tauceti-explorer/issues/10389).
Fix author: Codex, session `codex-FxDbZE`. Work completed on 21 October 2026.
The review marker retains the issue's expressly prescribed date, 18 October 2026.

**Complete.** The package fixes and fresh adversarial pass are finished. There is no
unresolved confirmed finding. This is a fixes report, not an independent review of this
session's work. The mathematical results remain roadmap targets; elaboration does not
prove the admitted theorem targets.

## Inputs and scope

Read both existing reports, `REV-PKG-InductionRestrictionPartII.md` and
`REV-PKG-InductionRestrictionPartII~2.md`, the package marker, the complete README and
suggested file, the accepted packet, the revision handoff, and the current worker,
protocol, package-review and upstream instructions. There is no report named
`REV-PKG-InductionRestrictionPartII~adv.md` in this checkout. No additional findings
are attributed to a nonexistent report. The first report's scope objection was already
resolved by revision 2; the second report accepted that revision with corrections.
Those repairs were checked again and preserved.

Only the four deliverables of #10389 change: this note, the package README,
Suggested.lean and review.json. The historical packet, metadata, supplier packages,
current libraries and upstream roadmaps are unchanged. No second issue was claimed.

## Finding-by-finding disposition

| Finding or requirement | Disposition in this submission |
| --- | --- |
| Original blocking finding: 43 targets duplicate IG.3.4–IG.3.5 | Already removed by revision 2. Rechecked the live supplier at PR #850 head `ee4bec5fc35c570ebea14c757c3ddf2c62dc9219`. Reduced multipliers/covers, markings, universal extensions, class degrees, compatible covers, power corrections/actions and twists remain imports. RS.2 and RS.5 do not reappear. |
| Additional RS.0 overlap: universal coefficients, class map, Schur-cover comparison and complement conjugacy | Already imported. RS.0 retains full homological exactness, positive-degree homology finiteness and Hall coinvariants, with their differences from the supplier explicit. No local reimplementation of the imported objects. |
| Revision-wide title, scope, prerequisites, layer numbering and downstream ownership | Revision 2's retained numbering and contracts are preserved. ArithmeticStatistics and ArithmeticStatisticsPartV are consumers. Their arithmetic identifications do not become prerequisites of abstract finite-group certificates. Existing retargeting notes remain in the earlier revision handoff; no out-of-scope consumer file is edited. |
| Revision-2 review: generic parity weight enumerator duplicates current Tau Ceti | Its removal is preserved. `Set.weightPolynomial`, its coefficient theorem and evaluation at one are suppliers. Only the lower-bound translation and integer formal degree series remain targets here. |
| Original source locators: LWZB journal pagination, start of Wood §4.1, Hatcher evaluation page | Existing LWZB pp.104–105 and 110–112 and Wood pp.398–401 corrections are preserved; accessible arXiv locations were read. Hatcher's evaluation construction no longer belongs to this package after the ownership change. No excerpt was inserted. |
| InductionRestriction Layer 7 was credited with an unstated kernel-order theorem | The corrected contract is preserved: it supplies the representation group with cohomological kernel; IG supplies the oriented comparison with integral H₂. The two Schur-multiplier carriers remain distinct. |
| Factor-set splitting requires transport from the extension built from the factor set | Existing contract through `factorSetToGroupExtensionEquiv` is preserved; no arbitrary-extension application bypasses it. The current character-transgression interface is identified as cohomological. |
| Torsion of the universal kernel requires a torsion reduced multiplier | Imported IG contract explicitly assumes finite G in this package. This does not become a new universal-kernel target. |
| LWZB warning about the group structure of the unit action | Preserved the direct multiplicativity proof on the central kernel only, with failure on the full nonabelian marked extension as a negative control. The action remains supplied by IG. |
| Original power-law proof established only natural powers | Retained its exact native natural-power boundary and added the integer-power law and `commutator_zpow_boundary`. The inverse identity follows from the three-chain boundary and the unit boundary, so the stronger statement has a proof route and a negative-exponent Check. |
| Original and revision-2 sign, normalization and missing-hypothesis corrections | Preserved the oriented cycle, correction sign, generation assumptions, individual-class normalization and common-image commutation hypotheses. Preserved the computed C₂² homology-image Check, precise binary-map notation, specified signature cosets, survival wording and the single-conjugacy-class Table 2 hypothesis. |
| Revision-2 lift-square scope | Strengthened further to any central extension above an element whose square is one. Added its native signature without finiteness, marking, generation or a reduced-cover hypothesis; the reduced-cover application remains explicit. |
| Unnecessary centrality in the derived-kernel abelianization consequence | Removed it from the README and `abelianization_map_bijective_of_stem`. The derived-kernel condition alone gives bijectivity; the full earlier five-term statement still assumes centrality. |
| Fresh domain defect in `all_fixed_fibers` | The statement now first sends incompatible degrees to the empty fiber. It forms b and tests the obstruction only on the compatible branch, matching `squareObstruction`'s specified domain. Retained g in c∪{1}, integer degrees and the zero-or-torsion count. |
| Generality and an unstated readily expressible product milestone | Added `multiplier_prod` for arbitrary groups, with the tensor of their abelianizations, naturality and the oriented cross-factor generator. Kept `multiplier_prod_abelian` as a specialization. Added the native finite-abelian exterior-square signature already supported by the pinned carrier and the stated finite-decomposition proof. |
| Original Lean corrections: generation scope, perfect-base model, docstrings and missing-carrier inventory | Existing repairs remain. Native available carriers are now used for central lift squares, product H₂ and the finite exterior square; these are removed from the absent-carrier list. The stronger Hall, reduced-cover and actual marked-fiber targets remain fully stated in the README. |
| Current 19 October rule: admitted examples are forbidden; at most two proved examples per light definition | Every example now has an actual proof. Boundary controls outside that allowance have named theorem targets, with their README Checks retained. In particular the C₇ sign witness, C₄ no-solution control and q=1 control are proved named theorems. See the inventory below. |
| Preserve all targets, Checks, hypotheses and supplier contracts; README ≤350 KB | No retained target, Check or contract was dropped. The domain correction and justified generalizations are explicit. Final README is 102,819 bytes, far below the limit. |

## Fresh adversarial pass

Each row covers the definition, every API assertion, proof route and Check in that
numbered subsection, including its named specializations. All 41 retained subsections
are covered. Native signature parameters and their surrounding `variable` blocks were
also compared with the README. Trivial groups, zero-dimensional spaces, empty markings,
orders/exponents 0, 1 and 2, p=2 and q=1 were used where meaningful. Field/DVR,
compactness and residue-characteristic distinctions do not occur in these discrete
integral-group and finite binary statements; no such hypotheses are implicit.

| Statements | Instances tried and calculation | Result and change |
| --- | --- | --- |
| RS.0.1: full five-term sequence, abelianization maps and stem consequences | Split A×G; C₄→C₂; D₈→C₂²; noncentral S₃→C₂. In free presentations R⊆T for E and G, the kernel of (T∩[F,F])/[F,T]→T/R is the image of (R∩[F,F])/[F,R]. | Exactness has the stated orientation. Centrality identifies kernel coinvariants with A; it is unnecessary for the tail. Removed it from the derived-kernel bijectivity consequence only. |
| RS.0.2: all positive-degree finiteness and order annihilation | G=1; cyclic groups in positive odd/even degrees; H₀(C₂,ℤ)=ℤ. Finite bar groups in each degree give finite generation. | Bounded exponent plus finite generation gives finiteness; positive degree is essential. Retained the named degree-zero negative control. |
| RS.0.3: Hall coinvariants and inclusion/transfer maps | Trivial complement; inversion on C₃²; C₂×C₂ with the coprimality removed. Exterior-square inversion acts by +1. | Transfer norm becomes the index on coinvariants; it is invertible on the Hall primary part. Noncoprime cross terms show why the Hall hypothesis is necessary. No spectral-sequence or opposite-norm API is falsely credited to the library. |
| RS.1.1: oriented cycle, T boundary, powers and order annihilation | All a,b commuting with y in S₃×C₂, including a,b that do not commute with each other; all commuting x,y and n=−5…5; ordered generators of ℤ². | dT=z(a,y)+z(b,y)−z(ab,y). The unit boundary handles n=0. Added negative powers; n=−1 reverses the sign. All 1,320 finite chain checks pass. |
| RS.1.2: local normalization and all choice/conjugacy interfaces | Kernel elements; S₃ transpositions; C₃'s two distinct nontrivial individual classes. | Uniqueness is within a lift's conjugacy class over a chosen element of one image class. A normalization to one representative for two different image classes fails. Preserved the precise domain. |
| RS.1.3: commutation of normalized factors | Central kernel factors and two lifts of the same projected element; independent elements lifted in D₈. | A common projected element or the identity suffices. Arbitrary distinct commuting projected elements need not suffice in an unreduced cover. Signature and README agree. |
| RS.1.4: homology image equals Q_c | C₂² with c empty and with all nonidentity elements; D₈/Q₈ before reduction and the identity reduced cover after reduction. | Images are zero and the whole C₂ multiplier respectively. The full exact sequence gives equality; the supplied zero composite alone would not. Preserved. |
| RS.3.1: kernel action automorphism | Central kernel coordinates versus noncommuting S₃ coordinates under inversion. | Kernel power and correction maps multiply; the whole-extension power map does not. No global automorphism claim is introduced. |
| RS.3.2: finite-level action | Trivial group, modulus 1; C₃ with units 2 and 11 modulo 9; exponent of a finite reduced cover. | The order-squared bound determines cover powers and corrections even when the universal marked extension is infinite. Preserved. |
| RS.3.3: bounded degree slice and restrictions | Empty D, including negative total; Fin 1 with n=0,M=1; Fin 2 with n=3,M=1. | Exactly {(1,2),(2,1)} in the last case. The slice is a finite set, not a subgroup. Both light-definition examples are now proved. |
| RS.3.4: fixed degree lattice and orbit coordinates | Identity permutation; two-coordinate swap; a three-cycle with odd prescribed degree. | Fixed coordinates are constant on orbits and total degree uses orbit sizes. The swap and identity examples now prove the actual fixed-lattice definition. |
| RS.3.5: degree orbit set | C₃ swap orbits of (1,4), (4,1), (2,3), and unequal totals. | The first two agree; the third has the same total but a different orbit. The orbit set is not confused with the supplied cyclotomic twist. Preserved. |
| RS.4.1: central lift squares | Identity image; Q₈ and D₈ over C₂², including empty marking. | Projection puts X² in the kernel, then centrality applies. Squaring need not be a homomorphism. Generalized to all central extensions and added the native signature. |
| RS.4.2: b, square class, parity, choice and compatibility | g=1,m=0; m=e_k above class k; incompatible degrees; C₈ squares; the C₁₄ model's nonidentity square representative. | Lift changes insert squares; parity suffices for β but not for b. A formal square cannot make an incompatible fiber nonempty. Preserved the compatible domain. |
| RS.4.3: signed fixed-fiber equation | W_q(e_i)=X_i^(1−q); C₁₄→C₂ with kernel generator a=X², g nontrivial, m=3, q=3. | b=a⁻² and h²=a² has h=a, whereas h=a⁻¹ fails. The actual lift coordinates were checked as well as the kernel equation. The Lean sign theorem is proved by finite decision. This fixture is not asserted to be a Schur cover. |
| RS.4.4: square-times-torsion equivalence | All cyclic orders 1…32, all b and r=0…32; r=0 separately in the algebraic proof. | Solvability of 2r h=r b is equivalent to b in 2A+A[r]. Holds for arbitrary commutative A, without finiteness. |
| RS.4.5: every fiber and zero-or-torsion count | Same cyclic enumeration; C₄ with b a generator and q=3; q=1; incompatible degree. | An obstructed fiber has zero points despite nonzero torsion. At q=1 every compatible fiber has |A| points. Fixed the domain branching; both boundary controls have proved named signatures. |
| RS.4.6: one odd class parity | m=e_k and m≡e_k mod 2, including negative coordinates. | The square class vanishes for the matching g∈c_k; the torsion count follows. Actual degree compatibility is retained. |
| RS.4.7: all-even identity parity | m=0 and arbitrary even positive/negative coordinates, g=1. | β=0, and compatibility holds. No unwarranted lower-bound condition is used. Preserved. |
| RS.4.8: image filtration, monotonicity and exhaustion | Odd-order A; t=0; generator of C₂ at t=1; C₈ at t=0…3. | The image in A/A² differs from A[2^t]. C₈ has zero image until t=3. Added proved t=0 and C₂ membership examples; retained the C₈ boundary theorem. |
| RS.4.9: threshold minimum, zero criterion and cyclic formula | Identity; C₂ generator; every element of C₄×C₈ for t=0…4; C₈ generator. | Exhaustion for finite A makes the minimum meaningful. Mixed thresholds 2 and 3 are correct; the C₈ threshold is not 1. Added proved zero and first-positive examples. |
| RS.4.10: two-adic survival | Cyclic orders 1…32, positive r through 32, q=2r+1; odd groups; q=1 excluded. | Survival iff v₂(q−1)≥threshold+1. No coprimality between q and an arbitrary algebraic fixture A is smuggled in. The actual action retains its own exponent hypothesis. |
| RS.4.11: elementary-2 abelianization and spanning | Empty generating marking of the trivial group; S₃ and S₆ involution classes. | Generation gives exponent two and surjectivity of the actual class-image map. No arbitrary binary map is substituted for it. Preserved. |
| RS.4.12: lift-square columns | Lift multiplied by a central a; conjugate representative; identity lift. | The square changes by a²; the column is well-defined. Preserved. |
| RS.4.13: parity square map and class-image map | S₆ classes with equal abelianized image; two equal nonzero square columns on a binary algebraic fixture. | s(e₁+e₂)=0 while each column is nonzero. Actual a and s remain tied to the group construction; fixture labels remain explicit. |
| RS.4.14: compatible affine parities and obstruction | g=1 and g in a chosen class; dimension zero; every binary signature translate in dimensions 0…4. | Compatibility is v_g+ker a and β=s(v_g+ε). Empty and identity cases agree. Preserved. |
| RS.4.15: joint map and its full API | a=0,s=id,W=0; a=id,s=0; W=top; nested W. | Both coordinates are necessary. W=top gives ker a. The actual light-definition kernel example is now proved. |
| RS.4.16: surviving affine kernel coset | All binary row pairs and every translate in dimensions 0…4, with W zero/full. | Both degree compatibility and the obstruction quotient are imposed. The coset formula agrees with direct enumeration; conditions on the actual power action remain. |
| RS.4.17: rank counts and threshold histogram | Same binary maps; zero dimension; nested kernels and first step with K_(−1)=0; equal-sized affine cosets of different weights. | Counts are powers of two by rank-nullity; natural subtraction is justified by inclusion. Weight counts require the actual coset. Preserved. |
| RS.4.18: lower-bound translation and degree series | Dimensions 0…3, bounds 0…3, every parity subset, totals 0…12. Bound 1, two coordinates, parity set {00,11}. | The parity shift by the lower bound is necessary; coefficient of X⁴ in the last case is 3. The denominator has unit constant term over ℤ formal series. Current-library weight polynomial remains an import. |
| RS.4.19: independent class images | Empty vector space; C₂'s unique nontrivial class; three dependent nontrivial classes of C₂². | Surjectivity and independence together give unique compatible parity and zero obstruction. Independence alone does not supply generation. Preserved. |
| RS.6.1: odd-index-two reduction | Odd normal H with quotient C₂; trivial H; even H=C₂² as a failed extension of scope. | The Hall comparison yields odd multiplier and involution relations vanish. The Lean signature is explicitly the odd-cardinality consequence, while the complete coinvariant and reduced statements stay in the README. |
| RS.6.2: centralizer commutator homomorphism | D₈ kernel commutators; general X,Y,Z with both projected commutators trivial; a noncentral projected pair as negative control. | Central commutators give multiplicativity in the second argument. No commutation between Y and Z is required. Native hypotheses match. |
| RS.6.3: reduction from centralizer generators | Cyclic centralizer; identity and redundant generators; noncentralizer elements in D₈. | The homomorphism from the centralizer determines all relations from its generators. Generators of G outside the centralizer cannot replace them. Preserved. |
| RS.6.4: finite certificate | Trivial group; D₈ ordinary cover of C₂² followed by reduction; C₄→C₂ with the right sort of central surjection but no cover identification. | Independent justification of an ordinary Schur cover and its class isomorphism remains mandatory. Multiplication tables and kernel size alone do not prove that identification. |
| RS.6.5: finite parity algorithm | Trivial certified kernel; C₈ filtration as an algebraic fixture; the binary/threshold enumerations above. | Conditional algorithm uses certified actual a, s and B_t and retains affine translates. It does not supply an oracle for ordinary covers. Preserved. |
| RS.6.6: order-96 model and marking | Explicit permutations of A₄, quotient by V₄, sum-kernel pairs, swap multiplication and conjugation. | Base kernel 48, total 96, twelve outside involutions, one conjugacy class, generated group 96. All four assertions pass. |
| RS.6.7: reduced multiplier of the order-96 model | Compare the specified A₄ model and source row 8; test certificate requirements rather than infer a multiplier from group order. | C₂ remains a finite certificate target with proof obligations. The permutation enumeration does not claim to compute a Schur cover. Preserved. |
| RS.6.8: anti-diagonal model, marking, Künneth and exterior square | C₁,C₃,C₂; cyclic, rank-two and rank-three odd bases; trivial and infinite factors; S₃×S₃; ordered generators of ℤ². | Generation works for any abelian base; oddness is necessary for one class. Added arbitrary-group product formula, with cross tensor of abelianizations; S₃×S₃ has multiplier C₂. Finite abelian exterior square is stated on the existing native carrier. Inversion acts by +1 on it. |
| RS.6.9: sum-kernel, graph and perfect models, all light adapters | C₃ pairs (1,2) versus (1,1); A₄; SL₂(𝔽₃); order-21 base; perfect A₅; involutive θ, inverse transpose on SL₃(𝔽₂). Identity versus pure swap outside marking. | Sum, not difference, is required. Graph multiplication needs the stated involution. Cardinality is 2|G||[G,G]|. Perfect bases give the full wreath subgroup. All kept adapter examples now have proofs. |
| RS.6.10: all 31 table targets and models | Compared every row with Wood's Table 2, arXiv p.34; nineteen abelian rows use the exterior-square formula. Checked the stated nonabelian model laws and the Appendix A₄ construction. | All values agree. Perfect bases do not force trivial reduced multiplier. Nonabelian values still require their planned certificates; no arithmetic-type enumeration is imported upward. |

## Lean shape and signature audit

The file has 9 light real-bodied definitions, 3 abbreviations, 33 named theorem
declarations and 14 proved examples, in 499 lines. There are no admitted examples,
admitted data, placeholder carriers, `True` targets, auxiliary theory developments or
library-reproduction definitions. The three abbreviations are `Multiplier`, `C₂` and
`SwapWreath`, all supplied-carrier aliases.

| Light definition | Proved examples retained |
| --- | --- |
| `boundedDegreeSlice` | The two-element bounded slice; the empty one-coordinate slice |
| `powerFixedDegree` | Swap iff equal coordinates; identity fixes everything |
| `torsionImageFiltration` | Step zero is bottom; C₂ generator belongs at step one |
| `obstructionThreshold` | Identity has threshold zero; C₂ generator has threshold one |
| `jointParityMap` | Zero a and identity s with W=0 have zero kernel |
| `swapAction` | Nonidentity swaps and identity fixes the same C₃ pair, in one example |
| `abelianizedSum` | C₃ pair with zero sum and pair with nonzero sum, in one example |
| `sumKernelModel` | Corresponding membership and nonmembership, in one example |
| `outsideInvolutions` | Identity excluded; pure swap included |

The boundary targets `extensionFiveTerm_test_4`, `integralHomology_test_3`,
`torsionImageFiltration_test_2`, `obstructionThreshold_test_3` and
`sumKernelModel_test_2` retain their named README Checks and admitted theorem
signatures. `allFixedFibers_test`, `fixed_fiber_sign_test` and
`fixed_fiber_at_one` are proved named theorems. Moving a boundary control out of
`example` did not remove its mathematical claim or its Check.

All 33 theorem signatures were checked with their variable contexts, including the
arbitrary-extension abelianization tail, n+1 positive integral homology, natural and
integer boundary laws, central lift squares, arbitrary commutative square-torsion
solvability, finite-A exhaustion/minimum/valuation, actual involution generation,
joint-map kernel, finite binary rank count, centralizer commutators and the finite
model cardinalities. New product signatures impose neither finiteness nor
commutativity; the exterior-square signature matches the README's finite abelian
comparison. The reduced-multiplier and marked-fiber carriers that are absent at the
pins remain README targets. Both files now explicitly describe the signatures as
representative, with the README definitive.

## Sources, libraries and ownership

Read declarations at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`, including extension exactness,
native low-degree differentials and H₂ quotients, abelianization, cyclic homology,
elementary-2 quotients, exterior-power carriers and finite linear algebra. The
library audit has no separate entry for this Part II; related InductionRestriction
entries concern the distinct cohomological multiplier. Current Tau Ceti
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` supplies transfer and the generic weight
polynomial, with their actual statements read. Neither is reconstructed.

The read-only current TauCetiRoadmap main was
`0d144d044dacebca17b654695b6f1ad58f159b27`. Object searches covered current roadmaps,
including Completed and the roadmaps newer than the atlas snapshot. The relevant
InductionRestriction and AlgebraicTopology statements and their suggested files
were read. Continuous cohomological exactness does not provide this integral
homology theorem; the singular Künneth comparison does not provide the native bar
comparison. IG.3.4–IG.3.5 at the current PR #850 head above remain the owner of the
shared reduced-Schur and marked-action constructions. No ownership is moved upward.

Source verification on 21 October used these freely readable versions. These are
locators for statements and conventions, not source excerpts or source summaries.
The package's direct deductions are identified as such in its proof sketches.

| Source | Locations read for the pass |
| --- | --- |
| Wood, *Nonabelian Cohen–Lenstra moments* (2019), [arXiv v2](https://arxiv.org/pdf/1702.04644v2) | §2.3 p.8; Definition 3.1 p.9; Lemmas 3.3–3.4 pp.10–11; §4.1, Proposition 4.1, equations (5)–(6), Remark 4.2 pp.18–19; all Table 2 rows p.34 and Appendix p.35. The package also preserves the corresponding journal locators. |
| Wood, *An algebraic lifting invariant of Ellenberg, Venkatesh, and Westerland* (2021), [author copy](https://people.math.harvard.edu/~mmwood/Publications/lifting.pdf) | §2.1 p.2, Lemmas 2.2–2.4 and Theorem 2.5 pp.3–4; action formula (4) and Remark 4.1 p.8. |
| Liu–Wood–Zureick-Brown, [arXiv v2](https://arxiv.org/pdf/1907.05002v2) | §12, degree lattice and action pp.47–48; fixed-degree notation and Proposition 12.7 p.50; Lemma 12.10 and ensuing proof pp.53–54. |
| Löh, *Group Cohomology*, [30 July 2019 notes](https://loeh.app.uni-regensburg.de/teaching/grouphom_ss19/lecture_notes.pdf) | Theorems 1.4.1 p.20, 1.5.1 p.30, 1.7.15 pp.63–64, 3.2.12 p.123 and 3.2.18 pp.129–131; Proposition 3.2.13 p.124; Corollaries 1.6.13 p.49 and 3.2.23 p.136. |
| Ellenberg–Venkatesh–Westerland, [arXiv v1](https://arxiv.org/pdf/1212.0923v1), withdrawn | §7.3 p.34 for the homology-image formulation; Example 9.3.2 p.57 for the odd-index-two setting. Withdrawal is already identified in the package. |

The four downloaded public PDFs have SHA-256 values, respectively: Wood 2019
`2eacf07f9c79a08a65bbfa332b964f0f9bd4ab5abb93e5db8be72e43669be1bd`;
LWZB `7f1e85da49b23f80fc7abe9a68dbc5384ab216dfa5d55cd5e3223ba3268abed9`;
Löh `d4f2d819bfa85c57277db74bf749d05f03e85833c76e89eab99127f077d2cd76`;
EVW `3cd5624f85450b06f4be8b37d08fb480dde8dc7c68f9a5bd7ffc57c15c04a4e4`.
Wood 2021 was read through the browser. No restricted book or uncleared copy was
used. No fetched text was executed, and no suspicious instruction was encountered
in the untrusted material read for this job.

## Reproducible finite-check scope

A fresh enumeration, separate from the previous review's calculations, passed
**78,070 assertions**. To reproduce the checks, use finite residues, permutations,
binary bit vectors and integer chain coefficients with the following bounds:

| Check family | Construction and expected comparison | Assertions |
| --- | --- | ---: |
| Cyclic solvability | n=1…32, every b∈ℤ/n and r=0…32; solve 2rh=rb and compare with b∈2A+A[r] | 17,424 |
| Cyclic fiber cardinality | Same ranges; compare the solution count with zero or the kernel cardinality of multiplication by 2r | 17,424 |
| Positive-r survival | Same ranges with r>0; compare with v₂(2r)≥threshold+1 | 16,896 |
| Product threshold | All elements of C₄×C₈, t=0…4; threshold is the maximum of 2 and 3 for the respective odd coordinates, or zero if neither is odd | 160 |
| Binary rank | Dimensions 0…4, all pairs of binary row maps a,s, W=0 and W=full; compare kernel size with 2^(dimension−rank), using binary row elimination | 682 |
| Nested kernels | Same row pairs; check inclusion and size of the set difference for W=0⊆full | 341 |
| Affine parity sets | Same maps and every translate v_g; compare direct simultaneous constraints with the translated kernel | 9,362 |
| Degree coefficients | Dimensions 0…3, bounds 0…3, totals 0…12, every subset of binary parity vectors; compare direct integer-vector enumeration with the binomial formula, treating dimension zero separately | 14,456 |
| Bar bilinearity | All triples in S₃×C₂ whose first two entries individually commute with the third; expand the three integral boundaries | 528 |
| Bar integer powers | All commuting pairs in S₃×C₂ and n=−5…5; compare dB_n with nz(x,y)−z(x^n,y) | 792 |
| A₄ sum-kernel model | Permutation multiplication, explicit quotient A₄/V₄; orders 96 and 48, twelve outside involutions, their conjugacy and generation | 4 |
| Signed actual lifts | In C₁₄ with X generator, m=3, q=3 and correction X⁻⁶, compare lifts Xa and Xa⁻¹ | 1 |

For the negative chain checks, if n=−k use
`B_(−k)(x,y)=−k(T(x,x⁻¹;y)+T(1,1;y))+B_k(x⁻¹,y)`.
Together with dT this gives exactly `−k z(x,y)−z(x^(−k),y)`.
No enumeration computes an ordinary Schur cover or proves a nonabelian multiplier
value. These calculations discriminate errors in the roadmap statements and their
conventions; the planned proofs remain necessary.

## Validation and handoff

- `lean-check research/blueprint/packages/InductionRestrictionPartII/Suggested.lean`:
  exit 0 at the required pins, 30 warnings, all `declaration uses sorry`; no errors
  or other warnings. The 14 examples and three named boundary controls above are
  proved, while 30 named theorem targets remain admitted.
- `python3 scripts/check_sorry_data.py` on the suggested file: exit 0.
- `python3 scripts/check_blueprint.py research/blueprint/packets/InductionRestrictionPartII.json`:
  0 errors and 0 warnings; the historical packet is unchanged.
- `python3 research/blueprint/intake.py check-files` on the four deliverables:
  passes. JSON parses, no private paths, only the authorized output paths.
- `git diff --check`: clean. README 102,819 bytes; Lean 499 lines.

Nothing remains to resume for this fix. Independent review and eventual
formalization are subsequent jobs, not claims made by this session.
