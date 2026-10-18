# FIX-PKG-ArithmeticStatisticsPartV~adv

Issue #10306; agent Codex; session `codex-Zm9pfz`. Claimed on 2026-10-17. This is a completed package repair for independent review, not a checkpoint. Only the four deliverables were changed. The review date remains the date specified in the issue.

The repair follows the adversarial review's permitted conditional resolution of the general Galois bound. The arithmetic induction now has the simple-group inequality as an explicit hypothesis; the unconditional endpoint remains open. This submission does not claim a proof of classification or of that unconditional endpoint. The other findings have source-to-proof routes or explicit independent arguments in the README. The Lean file records signatures, not formal proofs of the roadmap.

## Finding → change

| Confirmed finding | Repair and disposition |
| --- | --- |
| Nonabelian-simple large-subgroup input | Split `galois_count_threeEighths_of_largeSubgroups` from the open unconditional `galois_count_threeEighths`. Retained the exact missing inequality and added the maintainer request below. Expanded the arithmetic induction, its uniform relative Schmidt estimate, discriminant saving, elementary-abelian maximum, S₃ exception and inflation–restriction refinement. This is the conditional resolution explicitly allowed in the review. |
| Alexander–Hirschowitz interpolation | Added Brambilla–Ottaviani [140], Theorem 1.1, p.1, and the critical-rank differential-Horace proof chain, with the residual ranks, initial cases and all exceptions. Stated algebraic closure and characteristic zero. Checked the strict inequality used by the mixed-trace application. |
| Generic finite fibres / Bézout | Added `polynomialMap_finiteFibres`, with a nonzero polynomial on the target, every algebraically closed extension, finite fibres and the coordinate-degree product bound. The proof goes through algebraic independence, finite function-field extension, localization to a finite algebra, and affine isolated-intersection Bézout. Bad fibres and components at infinity are accounted for. Added the signature and negative controls to Lean. |
| Relative cubic-order identity and wild three | Replaced the printed isomorphism-class/generic-automorphism weight by Aut(order) mass, proved the conversion by orbit–stabilizer, and supplied all five Datskovsky–Wright local factors [144], Theorems 3.1 and 6.1. Distinguished squarefree Euler ideals from field conductors. Added order propagation and the ray-character bound including bounded wild-three conductors. Recorded the published-source issue below. |
| Siegel primitive indefinite mean | Added the conductor/order-class and totally positive unit-index comparison. Proved the all-order L(1,χ_D) mean directly by truncation and quadratic character sums, including even indices and removal of principal square discriminants before taking L-values. Abel summation gives π²/(18ζ(3)) and O(X log X); content summation gives the separately normalized all-form corollary. No unavailable original Siegel proof is claimed to have been read. |
| Wright abelian series / positivity / C₃ cyclotomic pole | Used the complete alternate supplier Frei–Loughran–Newton [141], Theorem 1.7 and §§2–4, with subgroup inversion, Poisson, pole extraction and the noncancellation argument. Fixed the discriminant convention, surjective-character labels, Aut(A) divisor and residue/a normalization. C₃ over Q(ζ₃) has pole order two. Local-condition positivity requires realization and (1.4). The corrigendum's scope is distinguished. |
| Baily uniform arbitrary-resolvent-subfamily bound | Proved a fixed-K upper bound before summing over an arbitrary specified C. Used Cohen–Thorne [143] for the extension dictionary, all dyadic discriminants and square-norm ideals. Supplied the cubic ideal bound A_K(T) ≪ T log²(2D_K) uniformly in K and T, using a smoothed contour estimate and the elementary divisor bound on the other range. Does not infer subfamily uniformity from an unrestricted secondary citation. |
| Q₈ odd restricted residues and mean | Computed the exact odd-prime Euler residue, isolated the two dyadic values, and gave the uniform √(3/5) ramified-prime loss. Proved the squarefree odd progression first moment separately for each sign, also with fixed R dividing n. Counted admissible factor pairs by a half-fibre, then used positivity and the correct order of limits to obtain divergence. Does not transfer an unrestricted mean without proof. |
| Governing-field PID | Gave f=T⁸+6T⁴+1, explicit ζ₈ and β, an irreducibility/splitting-field proof, an eight-element integral basis, its discriminant, all 255 half-coset maximality tests, and a norm-two generator. The Minkowski bound is below13; explicit irreducible factorizations at3,5,7,11 rule out every other small-norm prime ideal. The resulting class-number-one proof uses no conditional class-group computation. |
| Historical Pell lower bounds | Derived the numerical Blomer inequality from the stronger FK positive lower density and the existing restricted Landau denominator. Added an independent fixed-t Legendre-pattern proof with the hyperbolic cutoff retained in Cauchy–Schwarz; combined it with the narrow Rédei criterion and the existing symmetric-matrix count. This gives liminf ≥ q_t ≥ α, including the negligible even subfamily. The original Cremona–Odoni λ_t notation is not identified with q_t without verification. |
| D₅ / order-20 quintic remainders | Used Bhargava [142], Lemma14 and §3.2, pp.1587–1588, for a stronger common o(X) remainder for all nonsymmetric quintic fields. Explained primitivity plus a transposition, the fixed-prime congruence sieve, cusp error, bounded stabilizer weight and the order of limits. This includes D₅, C₅⋊C₄ and A₅. |

All original target anchors and mathematical Checks remain. The long closing name catalogue in Suggested.lean was deleted to follow the issue's approved shape; none of its README definitions or targets was deleted. Both real-bodied definitions and all original Lean signatures/examples remain. New arithmetic/geometric carriers remain README targets.

## Adversarial pass

The table covers every changed mathematical assertion and the new Lean controls. Rows also give the relevant degeneracies; inapplicable field/DVR/module/compactness cases are not silently generalized. Unchanged targets retain the preceding independent review's audit.

| Statement / group of tightly linked steps | Instances tried and result | Change / result |
| --- | --- | --- |
| `quadraticCharacter_intervalBound` | Q=1 and the principal character would permit linear sums; both excluded. H=0 gives0. Modulo3 the sum on {1,2} is0 and on {1} is1. Quadratic conductors may contain4 or8. | One absolute constant precedes all conductors, characters and intervals in README and Lean. Finite-field Gauss norms are extended by CRT and the explicit dyadic sums, not misapplied to composite ZMod. |
| Primitive order-class/regulator comparison | D=5 and20: ε₂₀=ε₅³. q and2q have identical stabilizer, checked by the displayed matrix. | Fundamental and nonfundamental order periods stay distinct; content scaling does not change a stabilizer. Lean mirrors the unit and matrix calculations. |
| `quadraticAllOrder_L1Mean` | Square index m=1 has density1/2; m even has only the odd discriminant class and the same φ(m)/(2m). Square D would give a principal L-series. The squarefree index b=2 gives an alternating sequence, not a nonprincipal character modulo two. T<2 handled separately. | Squares are removed in the finite truncation. N=⌊T⌋ yields O(√T log T). |
| Siegel mean and all-form corollary | Abel weight gives2/3; ζ(2)=π²/6 gives π²/(18ζ(3)); contents supply ζ(3). | Constants and O(X log X) are retained. The two valid regulator conventions are not conflated. |
| `doublePointInterpolation` | r=2 gives min(d+1,2n). Ternary quadrics at two points have rank5, not6; the explicit rational matrix has rank5. Cubics in five variables at seven points have rank34. Positive characteristic invalidates the derivative argument. | Listed all exceptions, d≥2, n≥1, algebraic closure and characteristic zero. |
| Mixed-trace strict inequality | n=6,r=3,d=4 gives15≤18, while d=5 gives21>18. Remaining AH exceptions have binomial=rn. | The strict inequality, not a weak inequality, excludes them. Lean computes the binomials. |
| `polynomialMap_finiteFibres` | N=1 linear maps have singleton fibres. (x,y)↦(x,xy) has a line over(0,0), a singleton over(a,b) for a≠0, and no point over(0,b≠0). Frobenius in characteristic two has zero derivative. N=0 is outside the stated source contract. | Exceptional target polynomial and characteristic zero are explicit. Finite geometric fibres are asserted before ncard; affine Bézout does not require a finite projective intersection. |
| `cubicOrder_resolventMass` weights | A=Q×Q(√5), p=11: three embedded index-eleven orders form orbits of sizes2 and1. Their mass is1+1/2=3/2; generic-A weighting on the two classes gives1. | Corrected coefficientwise identity; invariant and noninvariant cases both covered in README and Lean. |
| All five local order factors | Split/inert numerator identities agree with the Euler expansion. At q=3,s=1 the total-ramification factor is2187/1936 and the split factor675/484. q=1 is not a residue field. | The factor1−qu³ is retained; ramified types include residue characteristics two and three. Lean checks the two numeric factors. |
| Cubic character orthogonality | Unit ideal gives1. (1−z²u²)/(1−zu)=1+zu when the denominator is nonzero. Trivial character yields F×K with mass1/2; inverse nontrivial characters pair. | No conductor interpretation is assigned to the squarefree Euler ideal. Lean retains the nonvanishing hypothesis in the cancellation example. |
| Propagation and `cubicConductor_choices` | X=1 includes the unit ideal. X³−3 has discriminant−243=(−3)·9², so a squarefree wild conductor is false. | Threshold Y and κ_F dependence specified. U^(2e+1) consists of cubes at three; the loose degree-dependent wild bound retains every conductor. |
| `abelianDiscriminantSeries` | A=1 has a singleton family and no least prime; excluded. C₂/Q has a=1,b=1; C₃/Q has a=1/2,b=1; C₃/Q(ζ₃) has b=2; V₄/Q has b=3. | Correct base cyclotomic degree and regular action. Exact positivity requires the compatible realized family. |
| Tauberian and character-label normalization | Simple pole at a=1/2 gives leading coefficient2·residue. Each C_p field has p−1 labels. Double pole produces log X. | README and Lean distinguish pole coefficient from field-count coefficient. |
| Conditional Galois endpoint / subgroup hypothesis | C₂ has no required proper subgroup; A₅ has A₄ with144>60. A classification proposition is not its proof. | Nonabelian hypothesis and separate open endpoint retained. No unconditional dependency on an unproved classification statement. |
| Nonabelian arithmetic induction | h=60 gives1/4+1/(2√60)+1/60<3/8. H₀ has trivial core, so the intermediate field determines the closure. | Uses the uniform relative Schmidt estimate with base-discriminant saving; does not sum fixed-M constants. |
| Elementary-abelian maximum | For N₁ in[1,X^(1/h)], maximize N₁^(r/2−h/m); its sign selects the endpoint. q=1 is the already treated abelian case. | Gives a maximum of exponents rather than their erroneous sum. |
| Small Galois exceptions | V₄ has log²; order-eight groups are nilpotent; S₃ discriminant d³f⁴ gives a convergent conductor sum of weight f^(−4/3). h=2 needs inflation–restriction. | Logarithms absorbed only into ε. Refined3/16+1/6=17/48<3/8 is checked in Lean. |
| `quartic_fixedResolvent_upper` | Empty C gives0; singleton retains K dependence. A₄'s three-to-one dictionary still gives an upper bound. Both cubic signatures and primes over two are included. | Constant independent of C,K,X. No odd-conductor restriction. |
| Square-norm ideal comparison | Local types(111),(12),(3),(1²1),(1³) give subset counts3,1,0,1,0, versus degree-one counts3,1,0,2,1. | Exact finite-subset enumerations in Lean; arbitrary subsets are not counted as square norm. |
| `cubicIdealCount_uniform` | T=1, T=D_K² and both sides of that threshold. At threshold the error is D_K, smaller than D_K². | Combines divisor coefficients for small T and smoothed Perron for large T; the constant is absolute. |
| `quaternion_fixedFactor_residue` | At p=3, A_p=20/27 and the lower B_p=16/27; at p=2 that lower expression is0. χ(2)=±1 gives1/4 or3/4. | Exact positive square root, odd-prime products and separate dyadic term. Lean mirrors both signs and the bad p=2 factor. |
| Ramified-prime residue loss | q≥3 gives √(q/(q+2))≥√(3/5); 2√(3/5)>1. | Uniform positive lower bound suffices after factor-pair summation. |
| `quadraticOddRestricted_L1Mean` | Both ε signs; n=1 excluded before a principal L-value; even m does not change odd n density; b=2 is handled by its alternating progression. χ(2) varies between the two classes mod8. | Positive diagonal δ_m, squarefree Möbius error and T^(3/4)log T supplied. Fixed R permits only (m,R)=1 on the diagonal. |
| Q₈ factor pairs / divergence | n=15 has two rather than four divisors1 mod4. R=5·13·17 forces ω(n)≥3 for both sign progressions. | Uses half-fibres minus units and a positive restricted harmonic mean; field-height limit precedes enlarging the finite pair set. |
| `governingPolynomial_irreducible` / field identification | Exact reductions give z⁴=−1, β²=1+z². Norms rule out a square in Q(i,√2). The splitting field embeds in S₄ with order8. | Establishes degree8 and D₄; rules out cyclic and quaternion readings. |
| `governingField_integralBasis` | All eight basis characteristic polynomials integral; determinant1/128; trace discriminant4194304. Every one of255 half-cosets fails integrality. | Maximality follows from the discriminant's two-power support; no presupposed ring closure is needed. Independently checked all64 products too. |
| `governingField_classNumber_one` | g has the listed integral coordinates and an Eisenstein polynomial with constant2. Minkowski bound12.93514<13. Residue degrees at3,5,7,11 give norms81,25,49,14641. | Only the unique principal prime above two is small enough. The test is on ideal norm, not rational-prime size. |
| Blomer numerical inequality | X≥e gives (log X)^(1/2)≤(log X)^(31/50). Restricted squarefree denominator includes two only once. | Stronger FK lower density implies the weaker stated exponent in the same radicand ordering. No original-proof claim. |
| `fixedPrimeFactor_legendrePatterns` | t=1 is fixed-modulus PNT. For t≥2, discard two-large-prime and small-prime regions with explicit negligible counts. In the bilinear square the diagonal is positive; distinct q₁,q₂ give a primitive character. | Hyperbolic cutoff leaves an interval with min upper endpoint; no growing-modulus PNT is used. Largest-prime subtraction is O(X^(2η)). X→∞ precedes η↓0. |
| `pell_fixedPrimeFactor_lower` | Empty symmetric matrix gives q₁=1; q₂=q₃=1/2; q₄=7/16. Enumerated all edge patterns through t=6. Two-vertex Laplacians have ranks0 and1 over F₂. (5/13)=−1 and8²−65=−1; (5/41)=1 gives no criterion conclusion. | Narrow Rédei rank criterion plus the imported MacWilliams count. Even radicands have one fewer odd prime and are negligible for fixed t≥2; t=1 has only the extra integer2. |
| `quintic_nonSymmetric_negligible` | D₅, F₂₀ and A₅ all avoid transpositions; density10/120=1/12. Reducible algebras are not silently declared transitive. | Prime-degree primitivity supplies the group argument for fields. Fixed finite-prime sieve precedes the prime-set limit; finite stabilizer weights bounded by120 and cusp o(X) retained. |
| Suggested-file shape and original definitions | Weighted dilation: Y=0,1, n=0 and weights1,2; separated roots: n=0,1, c=0, C<0 and the repeated-root negative control. | Original definitions, hypotheses and tests preserved; no sorry'd data or auxiliary theory introduced. New declarations use existing Mathlib carriers and no variable/include block hides a hypothesis. |

## Ownership and maintainer requests

The current upstream object audit was repeated for polynomial Jacobians, finite fibres, double-point interpolation, class/order conductors, quadratic character sums, integral bases/class numbers, narrow ranks and the simple-group inequality. Current EffectiveBounds and Multiquadratic were read as complete README models, with their suggested interfaces; the newer roadmaps and relevant current Tau Ceti source were searched by objects. EffectiveBounds supplies quantitative bounds, not the analytic counting proofs above. Multiquadratic already owns genus two-rank, not the four-rank criterion or prime-pattern distribution; it is reused. CFSGStatement and `TauCeti.ClassificationStatement` still provide a proposition, not a proof of the missing subgroup theorem. No additional duplicate target was found or introduced. No build was run in the current-upstream checkout.

1. **New finite-group supplier needed.** Route `simpleGroup_largeProperSubgroup` to a finite-simple-group estimates roadmap, or a verified proof roadmap created to supply it. Exact contract: for every finite nonabelian simple S there exists H<S with |H|²>|S|; products then give a core-free subgroup of S^r of order greater than √|S^r|. A classification-based solution must supply classification as a theorem and the family/order calculations, not merely import its statement. Consumer: Part V's unconditional three-eighths endpoint. The conditional theorem is usable independently. This is the missing-mathematics maintainer note required by the issue; it does not request new definitions in CFSGStatement.
2. The permitted deliverables exclude packet edits. When synchronizing the package back to its owner, mirror the supporting README targets into ArithmeticStatistics ST.3: `quadraticAllOrder_L1Mean`, `doublePointInterpolation`, `polynomialMap_finiteFibres`, `cubicOrder_resolventMass`, `cubicConductor_choices`, `abelianDiscriminantSeries`, `quartic_fixedResolvent_upper`, `cubicIdealCount_uniform`, `quaternion_fixedFactor_residue`, `quadraticOddRestricted_L1Mean`, the three governing-field certificate targets, `quadraticCharacter_intervalBound`, `fixedPrimeFactor_legendrePatterns`, `pell_fixedPrimeFactor_lower`, `quintic_nonSymmetric_negligible`, and the explicitly conditional Galois endpoint. Their exact statements and dependencies are in the package; none is routed upward.

## Published-source issue for the maintainer

The weight defect was already identified in the preceding independent package review. The following own-word record is supplied here because the issue does not permit editing a packet or errata file. It does not assert that the paper's downstream main theorems fail; the corrected mass identity supports the needed propagation estimate.

```json
{
  "sourceVersions": [
    {
      "kind": "published",
      "url": "https://www.cambridge.org/core/services/aop-cambridge-core/content/view/6AABE169B5BA8192FE036455DE4F806F/S2050508625000009a.pdf/the-average-size-of-3-torsion-in-class-groups-of-2-extensions.pdf",
      "read": "2026-10-17",
      "sha256": "d5051ab0d37f9985f1adea5cbfee2263812ce96de2b354598448765411344ce5"
    },
    {
      "kind": "preprint",
      "url": "https://arxiv.org/pdf/2110.07712v2",
      "read": "2026-10-17",
      "sha256": "fad655111b4d5864f54fbc1a94f3319ca57fb92c7adc6741bbec01d08732d935"
    },
    {
      "kind": "author copy",
      "url": "https://wangjiuya.github.io/research/3tor2ext.pdf",
      "read": "2026-10-17",
      "sha256": "91cbb5df29a7e108958d85c1dd1e0795fcebf8c30481bbfe93f29eb0d381b510"
    }
  ],
  "sourceIssues": [{
    "id": "ArithmeticStatisticsPartV/E1",
    "source": "95",
    "kind": "error",
    "locator": "Lemke Oliver–Wang–Wood, published Lemma 3.13 and its first equality, pp.16–17; also arXiv v2 and Wang author copy, Lemma 3.13, pp.14–15",
    "printed": "The sum is over isomorphism classes of orders but divides each by the generic algebra automorphism order; its first equality uses the embedded-suborder series.",
    "correction": "Weight each isomorphism class by the reciprocal automorphism order of the order itself, or sum embedded orders divided by the generic algebra automorphism order.",
    "reason": "For Q times Q(sqrt(5)), the three embedded index-eleven orders form orbits of sizes two and one. Correct mass is 3/2; generic-algebra weights on the two classes give 1. Orbit–stabilizer gives the correction.",
    "affects": "a stated result",
    "known": "Already flagged in REV-PKG-ArithmeticStatisticsPartV~adv; no author or publisher correction located in the searches below.",
    "searched": [
      "Cambridge version of record and journal-title erratum/corrigendum search",
      "arXiv:2110.07712 history (latest v2), Lemma 3.13",
      "Lemke Oliver research page and Wang author PDF, Lemma 3.13"
    ]
  }]
}
```

The source-version table pins the actual files. All were read on 2026-10-17. It includes supporting originals actually used, not failed downloads. Original Wright, Baily, Siegel, Blomer and Cremona–Odoni proofs were not certified by metadata or search snippets; the replacement routes above remove dependence on their unavailable proofs. The Cremona–Odoni publisher endpoint refused access. FLN's corrigendum changes other theorems, not its counting Theorem1.7.

| Source / version and URL | SHA-256 |
| --- | --- |
| [[98], Lemke Oliver–Thorne author copy](https://lemkeoliver.github.io/papers/25-NumberFieldBounds.pdf) | `f6e84cd5da748d5f2408f3d68fb5cf0f0bb14d795c9fb4816f4bd37a3f527c1f` |
| [[95], published Cambridge version](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/6AABE169B5BA8192FE036455DE4F806F/S2050508625000009a.pdf/the-average-size-of-3-torsion-in-class-groups-of-2-extensions.pdf) | `d5051ab0d37f9985f1adea5cbfee2263812ce96de2b354598448765411344ce5` |
| [[97], published Numdam copy](https://www.numdam.org/item/JTNB_2020__32_3_631_0.pdf) | `b81dd8b0ba5a12f35d472a551b12efbc13d38a777a1069a253a72511b8390b43` |
| [[137], Goldfeld–Hoffstein author scan](https://www.math.columbia.edu/~goldfeld/Goldfeld-Hoffstein1985.pdf) | `41e47b3c8aa7ea4afdec623ea7ecb1879b84db5aa74d52e1f53c75138a31185b` |
| [[104], arXiv v1](https://arxiv.org/pdf/2201.13424v1) | `c7a93ffea06491d824d900fe067f6768246e84555fa8da8282833caac7850cbd` |
| [[102], published Annals copy](https://annals.math.princeton.edu/wp-content/uploads/annals-v163-n2-p11.pdf) | `3af8ff4cbb5e590498be44d168cd0a1404e5d48a5a55298edbd7529174b772f2` |
| [[140], arXiv v2](https://arxiv.org/pdf/math/0701409v2) | `7d3dd9e6268431f4be53740bbf57ebf46d9a76b13c3472d6911d7f6deb530aa7` |
| [[141], accepted manuscript](https://centaur.reading.ac.uk/60488/1/HNP_final.pdf) | `4119671955e254c32cedd4517334ce14acfc62aa16451e0c83eafadda374bf99` |
| [[142], published Annals copy](https://annals.math.princeton.edu/wp-content/uploads/annals-v172-n3-p02-p.pdf) | `3164388a71dbeb727a63ed065efb00902f85c59824ab93f04cc661158d4f8ee3` |
| [[143], Cohen–Thorne author copy](https://people.math.sc.edu/thornef/papers/CT-quartic.pdf) | `444507d96b2b43258f6bb16d1abb3439ecdbc6c47d26482de651b7f6412fd705` |
| [[144], published GDZ scan](https://gdz.sub.uni-goettingen.de/download/pdf/PPN243919689_0367/LOG_0007.pdf) | `2d6aa0bbbadd11bd54cf253e148330a920997cd3646a255934bc82d3b95b985c` |
| [[139], published Annals copy](https://annals.math.princeton.edu/wp-content/uploads/annals-v172-n3-p13-p.pdf) | `3c3cd7530f1fc8b3e1730d9b388e5f4ede085df819ce331f23ea9fa45d43de5b` |
| [[145], Rhoades arXiv v1](https://arxiv.org/pdf/0706.4344) | `d1552d007b49fdf7eb29bbd5d07b2bbcf615e64c0290d5f495f5e938721e119e` |
| [[95], arXiv v2](https://arxiv.org/pdf/2110.07712v2) | `fad655111b4d5864f54fbc1a94f3319ca57fb92c7adc6741bbec01d08732d935` |
| [[95], Wang author copy](https://wangjiuya.github.io/research/3tor2ext.pdf) | `91cbb5df29a7e108958d85c1dd1e0795fcebf8c30481bbfe93f29eb0d381b510` |


## Verification

- `lean-check research/blueprint/packages/ArithmeticStatisticsPartV/Suggested.lean`: exit0 at the required pins, no errors and **41 warnings, all declaration-uses-sorry**. The file has 263 lines, two real-bodied definitions and no sorry'd data. Memory was checked before each compile; only one compile ran at a time and none remains running.
- All seven original ArithmeticStatistics packets passed `scripts/check_blueprint.py`, each with zero errors and warnings. They were not edited.
- The README's literal PARI/GP snippet ran with GP2.17.3 and printed `[1,1,1,1,1,1,1,1]`, `4194304`, `0`. A separate exact run checked the norm-two element's polynomial and basis coordinates, all64 basis products, every displayed modular factorization, the power-basis discriminant 2³⁶, both z/β relations, and the D=5/20 unit-cube identity. No `bnfinit`, class-group heuristic, GRH option or downloaded certificate was used.
- A separate finite graph enumeration checked t=1,…,6, obtaining full-rank counts1/1,1/2,4/8,28/64,448/1024,13888/32768. These equal the imported symmetric-matrix product in all six cases; they are regression checks, not a proof of arithmetic equidistribution.
- Anchor comparison preserves all 149 original explicit anchors; six new source anchors are added. The 111 original Check blocks survive, with additional controls.
- Mathlib pin: `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti pin: `f790474821cf4256814db967cb154e7af3d0c369`. Current Tau Ceti's `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` was used only for the ownership audit.
- Final `intake.py check-files`: four files, zero problems. `check_sorry_data.py` and `git diff --check` pass. All 527 local README links resolve, the handoff source-issue JSON parses, and all 15 source-table hashes match the files read.

No scratch file is required to continue or review this repair: source URLs/hashes, exact mathematical certificates and the remaining finite-group boundary are all recorded here or in the README. Review the conditional boundary as such; do not promote the unconditional endpoint during synchronization.
