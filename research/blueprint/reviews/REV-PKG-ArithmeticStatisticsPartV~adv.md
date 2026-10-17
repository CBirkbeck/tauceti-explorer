# Independent package review: ArithmeticStatisticsPartV

Issue #10278; reviewer `independent-review-REV-PKG-ArithmeticStatisticsPartV~adv`; 2026-10-17; agent Codex, session `codex-5Wt18f`.

**Verdict: needs_changes.** The fixes below remove several false edge cases, restore explicit interfaces and correct source locators. The package is not ready for an upstream draft: its unconditional general Galois bound still needs a nonabelian-simple-group input that neither the current library nor CFSGStatement proves. Mixed-trace interpolation and generic finite-fibre inputs, the corrected all-conductor relative cubic-order identity, and several classical counting/residue inputs also lack complete proof contracts. These are mathematical closure defects, not Lean elaboration failures. This is a completed independent review, not a checkpoint of an unfinished review.

## Scope, coverage and ownership

I read the full Part V README and suggested file, the seven original ArithmeticStatistics packets, the pre-split package at commit `270eb2332`, the split package at baseline `d58cd8c669399b17e6446044ec13c8f3f8874489`, the binding review/protocol instructions and the reviewed library audit. All 111 original named target anchors remain. Their theorem scope, API and existing mathematical Checks survive the split; the existing genuine index-two cubic-suborder comparison was retained with its process aside removed. Thirty targets that previously had no Checks now have explicit controls. No packet was edited, and `metadata.toml` remains `math.NT`.

The opening now states ownership of Layer 3 only. Earlier Parts I–IV and AnalyticNumberTheory Part II are linked to their actual supplying subsections. AnalyticNumberTheory has no reverse dependency; ModularityAndLanglandsExtensions remains a downstream consumer. I checked the remaining named suppliers against the tier order. There are no upward later-part citations, `FoundationsAndLibraryIntegration` ids or `UPSTREAM:` placeholders in the README.

Current-upstream comparison covered the nine newer roadmaps (AlgebraicVectorBundles, DifferentialGeometry, IntegralLattices, LocalGaloisGroups, OperatorTheory, OrthogonalSpinGroups, PeripheralActions, ProfiniteArithmetic and RealAlgebraicGeometry), the Completed roadmaps ContourIntegration, EffectiveBounds, OrthogonalL2Bases and RestrictedProducts, and the current Tau Ceti source. Searches used field-discriminant/counting predicates, ideal/class-group norm kernels, real and integral Gram reduction, singular decompositions, moment determinacy, polynomial discriminants, root separation, Pell governing fields and class-group torsion, rather than just proposed declaration names. I read the relevant IntegralLattices, NumberFieldArithmetic, Hermite and CFSGStatement interfaces, and the PolarDecomposition and EffectiveBounds README/Lean models.

The following duplicate claims were removed from the target prose and retained only as boundary deferrals:

| Existing owner | Removal or retained specialization |
| --- | --- |
| Current Tau Ceti `NumberTheory.NumberField.Index.Discriminant:TauCeti.NumberField.IntegralPrimitiveElement.index_eq_one_of_squarefree_discr` and `NumberTheory.NumberField.Global.Orders.Discriminant:TauCeti.GlobalNumberFields.NumberFieldOrder.eq_maximal_of_squarefree_discr` | Removed a second squarefree-discriminant maximality theorem from the polynomial target. The retained variant proves the normal closure has group S_n and applies the existing index/maximality result. |
| Current Tau Ceti `NumberTheory.NumberField.Monogenic:TauCeti.NumberField.IsMonogenic` | Reuses the existing property. The new objects are counts and asymptotic predicates, not a new definition of monogenicity. |
| AnalyticNumberTheory Part II §5.7 | Removed the duplicate general cumulative degree-at-most-three bound. The retained quadratic-only target has the sharper h₂(F)D_F^εX dependence. The thin-two-group argument now explicitly consumes §5.7. |
| OperatorTheory/PolarDecomposition PD-C09–PD-C18 | Reuses the finite-dimensional singular-system supplier for the compact transporter argument; no general singular-decomposition target is added. |
| IntegralLattices §2G | Reuses integral-lattice reduction at the boundary. The retained polynomial-order metric is a positive-definite real Gram matrix and may be nonintegral. Its prefix-minimum predicate and existence contract are stated explicitly. |
| InductionRestriction Part II RS.1, RS.3, RS.6.4–6.6 | Reduced multipliers, powers, reduction/parity certificates and the order-96 type are imports. The source of the order-96 type is §6.6, not the distinct multiplier target at §6.7. |

The pinned statement audit used Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Duplication checks separately used current Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`; those newer results are ownership boundaries, not silently imported into the pinned Lean file. Relevant local statements read include `MeromorphicOn.circleAverage_log_norm` in JensenFormula (line 308), the Vandermonde determinant statements (lines 219 and 233), and the class-group relative norm/extended ideal maps. No build was run in the current-upstream checkout.

## Corrections made

1. In the quadratic-wreath admissibility argument, finite inertia in the normal closure generates the quotient needed for Minkowski's unramified-Q contradiction. Decomposition groups need not have order two: X³−X−1 modulo two is irreducible, so decomposition is C₃ while inertia is trivial. The README and a Lean negative control now distinguish these maps.
2. The two-extension constants and torsion means require tower length m≥1. The m=0 family is a singleton, not a positive linear family. Over Q the first quadratic constant is 6/π² and the first mean is 5/3, with real and imaginary means 4/3 and 2.
3. Relative narrow classes now have named norm and extension APIs, total-positivity compatibility, the degree-power composite, and the normalized section on ℓ-torsion when ℓ does not divide the degree. Extension by itself is not a section; on C₃ in degree two it must be followed by multiplication by two.
4. I checked the existing direct compactness/root-separation argument for the regular monic region and added its source/context locator. The existing full-region generator multiplicity proof gives O(Y) by a uniform inverse-Vandermonde/cofactor estimate followed by integrality; I pinned the exact Mathlib determinant supplier and added a singular negative control. The uniform constants require n≥2, c>0, C≥0 and Y≥1; the singular c=0 control is retained.
5. The stated monogenic asymptotic is restricted to n≥3. The proposed coefficient fails in degree two because trace-zero quadratic reflection fixes the model: inserting C₂=1/2 gives half the actual field-counting coefficient. The n=2 lower-bound theorem is retained separately.
6. Rank-law uniqueness has an explicit entire-function route from the pinned Jensen formula. The geometric-grid separator states the coefficient bound, base a>1, vanishing order and strict inequality ω>α−1/2. The canonical product with zeros a^m sits at the excluded boundary. Gaussian-binomial moment growth gives limiting masses O((2r+1)p^(−r²)), sufficient for the separator with α=0. This is rank-law uniqueness, not an unsupported general finite-group moment theorem.
7. The A₄ appendix now cites the actually read arXiv v2 Appendix A.1–A.3, pp.35–37, after the NSF copy failed. The same version supplies the elementary-two Dirichlet-series argument at §7, pp.29–31. The support-certificate table/appendix locators and several analytic supplier anchors were corrected.
8. The eight-rank criterion is sourced to Bruin–Hemenway, (1.1c), pp.63–64 and pp.74–75. The sixteen-rank finite-residue criterion is Koymans–Milovic's negative-Pell paper, Proposition 6.2, p.22, with Proposition 6.1 and (6.6)–(6.7), pp.20–21. The other Koymans–Milovic paper about −2p does not contain that proposition. The degree-eight governing field's PID assertion still needs an arithmetic certificate.
9. The general Galois-bound proof now exposes its actual missing simple-group lemma. Klüners–Malle Theorem 6.3, p.13, was read for the nilpotent order-eight upper bound; the upper-bound argument is separated from Shafarevich existence.
10. Mixed traces now register the exact double-point interpolation exceptions and the generic finite-fibre degree bound. The strict binomial inequality excludes the exceptional cubic/quartic cases in the requested n≥6 range; an arithmetic Hilbert-irreducibility label does not supply either geometric theorem.
11. Classical and relative counting claims now name the unsupported original inputs at their points of use. The Q₈ residue argument distinguishes the odd-discriminant subfamilies from an unrestricted positive mean. Degree-five D₅ and order-20 remainders are not inferred from a list of quoted constants.
12. I checked the existing alternating-extension transfer proof through inertia, discriminants, infinity and bounded normal-closure fibres, and added the precise source endpoint. It consumes the existing squarefree maximality result and does not assume an unverified Nakagawa restoration theorem.

## Remaining closure defects

Each row specifies what a later repair must supply. Registering a target is not a proof outline sufficient for acceptance when its essential argument is absent.

| Contract and location | Missing evidence / exact scope |
| --- | --- |
| `FieldStatistics.simpleGroup_largeProperSubgroup`, Galois three-eighths bound | Every finite nonabelian simple S has a proper H with card(H)²>card(S). Ellenberg–Venkatesh Remark 2.10, p.734, invokes classification. Current CFSGStatement only defines the classification proposition; its universe-transport implication is not a classification proof. Supply this inequality with a complete dependency chain, or separately scope an explicitly conditional theorem while preserving the unconditional endpoint as open. |
| `FieldStatistics.doublePointInterpolation`, mixed-trace bound | The Alexander–Hirschowitz codimension theorem for r≥2 variables, d≥2, n≥1 in characteristic zero, with all quadratic, cubic and quartic exceptions listed. Source [98], Theorem 3.2, p.4 records it; no lower-tier proof supplier is identified. |
| `FieldStatistics.polynomialMap_finiteFibres`, mixed-trace bound | For A^N→A^N in characteristic zero and nonzero Jacobian, a nonempty Zariski-open target with finite geometric fibres bounded by the product of the coordinate degrees. Supply the generic-finiteness and Bézout argument, including exceptional fibres. |
| Corrected relative cubic-order coefficient identity and propagation | Counts over O_F must weight by card(Aut_OF(R))⁻¹, not the automorphism group of the generic algebra, and include every conductor with wild prime-three factors. [95], Lemmas 3.13–3.14 and Proposition 3.15, pp.16–18, do not by themselves prove the repaired all-conductor statement. The original Datskovsky–Wright/Hasse comparison remains unverified. |
| Primitive indefinite quadratic order mean | Public restatements confirm the Siegel normalization ([54], Theorem 1.2(2), p.579; [137], p.186). The original argument, the native order/regulator comparison and the O(X log X) error over all orders are not supplied by merely invoking a class-number formula and Tauberian theorem. |
| Abelian conductor series / cyclic-prime counts | Wright Theorem 1.1, pp.17–18, is the intended original input, including positive leading coefficient and exact pole order. The original full text was not obtained. The C₃ series over Q(ζ₃) needs a double pole, hence a logarithm; the Q specialization alone is inadequate. |
| Baily weighted quartic count | The fixed-resolvent estimate must be uniform in K and valid after restriction to an arbitrary specified cubic-resolvent subfamily. Baily Lemma 10 and Theorems 2,4 have not been checked in the original. The secondary unrestricted displayed sum does not establish this subfamily contract. |
| Alberts Q₈ divergence | Lemmermeyer's signs and conditions at two were checked. The transfer of the Goldfeld–Hoffstein first moment to Alberts's precise odd-discriminant residue subfamilies and the fixed-factor positive residue calculation are still incomplete. This defect is separate from the D₈ harmonic-prime-progression proof. |
| Eight-rank governing field | Produce an integral basis/discriminant and a certified class-number-one calculation for E=Q(ζ₈,√(1+i)). [135], §3.1, p.7 reports a computer calculation, not its certificate. |
| Historical negative-Pell comparisons | Fouvry–Klüners Theorem 1 and Corollary 1, pp.2037–2038, were checked including odd/even radicand conversion. The original Blomer lower-bound theorem and Cremona–Odoni fixed-prime-factor comparison still lack verified theorem/page locators and proof contracts. |
| All fields in degree five | Exact D₅ and C₅⋊C₄ field-discriminant/isomorphism-class bounds giving o(X), with source theorem/page and dependencies. The cyclic C₅ case is already separated. Source [100], §7, p.24 quotes the remainders but does not prove them. |

The ordinary fact that a planned earlier-part carrier is not implemented is not itself a review defect. The rows above concern absent mathematical proof routes or unverified essential source scope, beyond those explicit normal suppliers.

## Recheck of every previously flagged support gap

The original ST.3 support-gap list has 21 entries. Their dispositions are as follows; none is silently treated as proved.

| Original support topic | Disposition after this review |
| --- | --- |
| Entire-function geometric zeros | Closed at roadmap level by the explicit Jensen/coefficient proof and sharp boundary control. |
| Native cubic secondary densities | Exact earlier-part orbit/weight/measure suppliers retained; probability Haar normalization and secondary local weights are distinguished. |
| Ring-class conductor normalization | Prime-three conductor example and native order scope retained; original all-conductor identity still open. |
| Fixed-resolvent cubic-order identity | Correct automorphism weights and full wild-three conductor scope exposed as an open contract. |
| Reduced multipliers / global lifts | Imported from exact RS.1, RS.3, RS.6 and IG.4 owners; no duplicate central-extension theory. |
| Arithmetic nonabelian moments | Native fields, rigidifications, infinity and denominators remain README targets, not opaque Lean carriers. |
| Alberts factorization and residue | Original Lemmermeyer and Alberts sources read; signs and two-conditions checked; restricted positive residues still open. |
| Mixed-trace algebraic geometry | Exact interpolation exceptions and generic finite-fibre theorem now stated; proofs/suppliers still open. |
| Original abelian / quartic counts | Wright and Baily original scope still open; fixed-resolvent Cohen–Morra/Bhargava–Shnidman input was read. |
| Governing/spin criteria | Original Bruin–Hemenway and correct Koymans–Milovic proposition located; PID certificate still open. |
| Historical Pell bounds | Fouvry–Klüners original read, including residue-height transfer; Blomer and Cremona–Odoni originals still open. |
| Real-metric reduction | Positive-definite real Gram prefix predicate and finite-ball existence argument supplied; integral Gram reduction remains an upstream boundary. |
| Polynomial-to-field multiplicity | Full regular-region O(Y) inverse-Vandermonde proof checked; binary order fibres and compact transporters retain n≥3 and uniform order dependence. |
| Restricted polynomial density / general orders | Trace-band and even-degree binary tail hypotheses retained; no full-box density is applied to a trace-zero lattice. |
| Alternating-extension restoration | Direct finite-inertia/infinity/discriminant proof and bounded-normal-closure fibres replace dependence on an unverified restoration assertion. |
| Low-degree classical counts | Wright/Baily and proper quintic remainders still open; quartic two-extension and abelian remainders distinguished from decimal constants. |
| General Galois bound | Classification consequence explicitly open; Klüners–Malle order-eight upper bound verified in the original. The abelian and character-counting cases still require the named original inputs. |
| Classical quadratic means | Mertens reduction checked; Siegel normalization verified in public restatements, native all-order proof contract still open. |
| Finite type certificates | Imported exact accepted RS.6 certificate interfaces, including the order-96 target. Numerical candidate lists are not declared verified certificates. |
| Relative narrow classes | Norm, extension, total positivity, degree power, normalized torsion section and three discriminating checks now explicit. |
| Rank marginal uniqueness | Restricted to elementary-abelian rank moments; Jensen separator, tightness and uniform-integrability route supplied. |

## Random source sample

The reproducible sample is `random.Random(10278).sample(original_111_targets, 15)`, in original README order. I opened each listed primary source and checked the indicated location; an unresolved source proves no more than the status column says. Page numbers below are printed paper pages except explicitly labelled arXiv pages. References are the Part V bibliography numbers.

| Sampled target | Checked locator | Result |
| --- | --- | --- |
| Malle invariants | [23], Definitions 1.1–1.2, p.1 | Permutation index and cyclotomic conjugacy conventions confirmed. |
| Small trace-zero element | [98], §2, p.2; [101], (1.1)–(1.2), pp.189–195 | Nonrational is weaker than generating; primitivity is retained. |
| Relative three-torsion propagation | [95], §3.3, Lemmas 3.13–3.14 and Proposition 3.15, pp.16–18 | Corrected order-weight/all-conductor comparison remains open; not certified from the printed generic-algebra formula. |
| All fields degree at most five | [100], §7, p.24 | Leading constants and quoted remainders found; original D₅/order-20 proof suppliers still absent. |
| Three-torsion counts cubic fields | [5], §8.5, (59), p.26; [21], §3, p.7 | h₃−1 and factor two checked, with the discriminant −23 example. |
| Galois three-eighths bound | [102], Proposition 1.3, p.725; Proposition 2.8 and Remark 2.10, pp.734–737 | Endpoint found; classification-based subgroup lemma exposed as missing. |
| Quartic torsion applications | [99], Theorem 1.4, p.2; §6, (8)–(9), Remark 6.1, p.10 | Weighted partial summation and fixed-base constants checked; Baily's original uniformity remains open separately. |
| No sixteen-rank governing field | [103], Theorem 3, p.3; §5, pp.22–23 | Conditional on all short-character-sum conjectures C_n, not just C₃. |
| p-adic local-specification density | [5], Lemma 32, p.25 | Maximal/all-order mass normalization checked. |
| Regular monic region | [105], §5, pp.24–27 as context; Mathlib Vandermonde | Missing locator replaced by a direct root-continuity/compactness proof; no claim that [105] states this exact arbitrary-region lemma. |
| Monic weak quasi-reduction | [105], Lemmas 5.2–5.3, pp.24–25 | Weak reduction only; no strong uniqueness imported. |
| Acceptable cubic specifications | [5], before Theorem 7, p.3; Remark 4 and (57)–(58), p.25 | Maximality, unrestricted-order mass and strong acceptability distinguished. |
| Relative three-torsion piecewise bound | [95], Theorem 3.1, Corollary 3.2, Remark 3.3, pp.10–12 | All four transition values checked; source-to-native propagation gap recorded separately. |
| Binary invariant-order fibres | [132], Theorem 2.1, Corollary 2.1, pp.5–6; Proposition 5.3, p.31; Proposition 6.1 and Lemmas 6.3–6.4, pp.32–37 | Uniform order-class bound and unit-equation dependency checked; binary n=2 transporter exception retained. |
| A₄ appendix enumerator | [50], arXiv v2, Appendix A.1, pp.35–36; A.2, p.36; A.3, p.37 | Replaced inaccessible [96] locator with checked version; exact counts distinguished from a finite-sample estimator. |

Additional originals checked include [90] for rank and Pell comparisons; [93] for ternary-conic input; [94] at length one for rank-law uniqueness; [104] for the later Pell theorem's height convention; [105]–[106] for monic/binary transfers; [108]–[109] for fixed-resolvent poles; and [134]–[139] for governing fields, nilpotent upper bounds, quadratic means and the earlier Pell inequalities. The downloaded −2p Koymans–Milovic paper and its author version were read to diagnose the wrong Proposition 6.2 attribution. The separate 2010 Spiegelungssatz paper was not mistaken for the negative-Pell original.

## Conventions and denominators

| Convention | Witness / negative control | Result |
| --- | --- | --- |
| Prime powers and Gaussian binomials | q=1 is excluded; rank zero and k=0 give mass one; factors q^i−1 use i≥1; k>rank has zero surjection count. | No zero denominator or artificial omission of the trivial group. |
| Finite cardinal and averages | Empty family has average zero by definition; limiting ratios assume a positive count. The m=0 tower has one point, not a positive linear coefficient. | Added m≥1 at the two-extension endpoints. |
| Isomorphism / embedded / rigid fields | Quadratic field has two embeddings; S₃ cubic has 18 rigidifications. | Automorphism and normalizer divisors are kept distinct. |
| Narrow norm and extension direction | On C₃ for degree two, norm after extension is multiplication by two; multiplying the extension by two gives the section. | Added the degree-coprimality condition and normalized section. |
| Twisted cubic action | Swapping x,y sends x²y to −xy²; splitting remains (1²1). | Row-variable and determinant-twist direction agree. |
| Quartic discriminant sign | x⁴−y⁴ has I=−12, J=0 and Δ=−256, satisfying 27Δ=4I³−J². | Added a Lean polynomial-discriminant control. |
| Elliptic / quartic height scale | A=−1,B=0 gives H_E=4, (I,J)=(3,0), H_IJ=27; 27H_E=4H_IJ. Scaling invariants by 2⁴,2⁶ multiplies height by 2¹². | Existing normalization retained. |
| Local Haar / global product | The p=2 cubic type counts sum to 15/16; maximal density is 21/32, not one. CRT uses actual joint residue proportions. | Coefficient probability and invariant-differential Haar are not interchanged. |
| Degree-two discriminants | d=1 is not a quadratic field; −12 is an order discriminant for p=3, not the fundamental field discriminant in the governing family. | Fundamental-discriminant exclusions retained. |
| Gram metric and direction | X²+1 has unweighted Gram diag(1,1), while X²−2 has diag(2,4). X²−1 after large root dilation has diag(2,2ρ²). | Real metric and the correct reduction direction are fixed; singular discriminant is excluded. |
| Weighted root dilation | At Y=2, (1,2) maps to (2,8); dilation by three after two gives (6,72). | Coefficient weights are i+1, not uniform scaling. |
| Polynomial / binary equivalence | Trace-zero quadratics have a reflection stabilizer; xy has an unbounded split diagonal stabilizer. | Monogenic asymptotic n≥3 and binary transporter n≥3 are essential. |
| Finite inertia / decomposition | Cubic discriminant −23 at two has inertia one and decomposition C₃. | Replaced the invalid decomposition-order-two assertion. |
| Governing-field Frobenius and spin | Conjugate Frobenius representatives have equal output; p dividing F is excluded; multiplying a prime generator by a unit square preserves the correction. | Arithmetic Frobenius and r(π)/π direction retained. |
| Conjectures and limits | Rank convergence alone does not give unbounded moment convergence; the no-governing-field theorem assumes C_n for every n. | Tightness/uniform integrability and conditional scope stated. |

## Adversarial statement audit

Every original named target has a row below. A passing example is a discriminator, not a proof of the theorem. “Retained” means the hypotheses and the mathematical Check survive; open supporting inputs are listed above. The additional supporting contracts are audited immediately after this table.

| Statement | Instances tried / computed result | Change or disposition |
| --- | --- | --- |
| [Splitting symbol and local sets of binary cubic forms](../packages/ArithmeticStatisticsPartV/README.md#splitting-symbol-and-local-sets-of-binary-cubic-forms) | Zero cubic and p=2 ramification: y³+2x³ is maximal, y³+4x³ is not; both have symbol (1³). | Retained mod-p versus mod-p² distinction. |
| [Splitting symbol determines the reduction mod p](../packages/ArithmeticStatisticsPartV/README.md#splitting-symbol-determines-the-reduction-mod-p) | x²y gives dual numbers times F_p; −83 versus its −332 index-two suborder gives different reductions at two. | Retained the genuine nonmaximal-order control; removed its process aside. |
| [Densities of splitting types](../packages/ArithmeticStatisticsPartV/README.md#densities-of-splitting-types) | All 15 nonzero binary cubics over F₂ give counts 1,3,2,6,3. | Retained and independently enumerated. |
| [Densities of splitting types of maximal forms](../packages/ArithmeticStatisticsPartV/README.md#densities-of-splitting-types-of-maximal-forms) | Ramified maximal forms have proportion (p−1)/p in either ramified symbol. | Checked both denominators, including the extra p in the totally ramified density. |
| [Densities of maximal and nowhere totally ramified forms](../packages/ArithmeticStatisticsPartV/README.md#densities-of-maximal-and-nowhere-totally-ramified-forms) | At two, maximal mass 21/32 and no-total-ramification mass 9/16. | Retained Euler products with absolute coefficient Haar mass. |
| [Maximal irreducible cubic rings are rings of integers of cubic fields](../packages/ArithmeticStatisticsPartV/README.md#maximal-irreducible-cubic-rings-are-rings-of-integers-of-cubic-fields) | Discriminant −23 is maximal; Z[∛4] is not maximal at two. | Retained field/order distinction. |
| [Davenport heilbronn count of cubic fields](../packages/ArithmeticStatisticsPartV/README.md#davenport-heilbronn-count-of-cubic-fields) | Real and complex constants sum to 1/(3ζ(3)), in ratio 1:3. | Added a numerical normalization Check. |
| [Nowhere totally ramified cubic fields and unramified cubic extensions of the resolvent](../packages/ArithmeticStatisticsPartV/README.md#nowhere-totally-ramified-cubic-fields-and-unramified-cubic-extensions-of-the-resolvent) | The −23 cubic yields an unramified C₃ resolvent extension; cyclic cubic discriminant 49 is excluded. | Retained S₃ and nowhere-total-ramification hypotheses. |
| [Three torsion of quadratic class groups counts cubic fields](../packages/ArithmeticStatisticsPartV/README.md#three-torsion-of-quadratic-class-groups-counts-cubic-fields) | h₃(−23)=3 gives one cubic; −3 and −4 give none. | Retained subtraction of one and division by two. |
| [Cubic fields totally ramified at large primes are sparse](../packages/ArithmeticStatisticsPartV/README.md#cubic-fields-totally-ramified-at-large-primes-are-sparse) | For ∛5, discriminant −675 has total ramification at five; the tail sums as X/Y. | Added a ramification/tail Check. |
| [Squarefree integers in residue classes modulo four](../packages/ArithmeticStatisticsPartV/README.md#squarefree-integers-in-residue-classes-modulo-four) | Squarefree counts in residues 1,2,3 modulo four up to 1000 are 200,204,204. | Independently enumerated; retained strict/inclusive boundary control. |
| [Count of quadratic fields](../packages/ArithmeticStatisticsPartV/README.md#count-of-quadratic-fields) | There are ten negative fundamental field discriminants between −25 and zero; discriminant one is excluded. | Added count and degree-two exclusion. |
| [Davenport heilbronn mean of three torsion](../packages/ArithmeticStatisticsPartV/README.md#davenport-heilbronn-mean-of-three-torsion) | The real/imaginary 3-torsion means are 4/3 and 2; narrow and ordinary odd torsion agree. | Retained signature and odd-prime comparison. |
| [Acceptable local specifications for cubic orders](../packages/ArithmeticStatisticsPartV/README.md#acceptable-local-specifications-for-cubic-orders) | Empty infinite selector has zero mass; maximal and all-order local sums are 1+1/p+1/p² and their scaled counterpart. | Retained all API selectors and discriminating Checks. |
| [P adic density of a local specification](../packages/ArithmeticStatisticsPartV/README.md#p-adic-density-of-a-local-specification) | Maximal local density has its prefactor; all cubic orders have normalized density one. | Retained mass normalization. |
| [Density of cubic orders with local specifications](../packages/ArithmeticStatisticsPartV/README.md#density-of-cubic-orders-with-local-specifications) | Maximal real fields have constant 1/(12ζ(3)); all orders retain ζ(2)/(2n_i). | Added normalization comparison. |
| [Roberts second order term for cubic fields](../packages/ArithmeticStatisticsPartV/README.md#roberts-second-order-term-for-cubic-fields) | ζ(1/3) is negative; the real/complex secondary ratio is √3. | Added sign and signature Checks. |
| [Second order term for the mean of three torsion](../packages/ArithmeticStatisticsPartV/README.md#second-order-term-for-the-mean-of-three-torsion) | Secondary Euler factors equal 1+O(p^(−5/3)). | Retained absolute convergence, not a primary-density replacement. |
| [Second order term for cubic orders with local specifications](../packages/ArithmeticStatisticsPartV/README.md#second-order-term-for-cubic-orders-with-local-specifications) | Unrestricted, maximal and nowhere-totally-ramified selectors have different secondary factors. | Retained strongly acceptable scope. |
| [Mertens count of positive definite binary quadratic forms](../packages/ArithmeticStatisticsPartV/README.md#mertens-count-of-positive-definite-binary-quadratic-forms) | Fundamental −3 and −4 have h=1; all-order −12 and −16 have h=2; leading coefficient π/18. | Added primitive/all-form distinction. |
| [Siegel count of indefinite binary quadratic forms](../packages/ArithmeticStatisticsPartV/README.md#siegel-count-of-indefinite-binary-quadratic-forms) | For D=5 the norm-one period uses (3+√5)/2; D=20 has a larger primitive-order period. | Retained order/regulator normalization; original mean proof remains open. |
| [Quoted classical counts for binary quadratic and cubic forms](../packages/ArithmeticStatisticsPartV/README.md#quoted-classical-counts-for-binary-quadratic-and-cubic-forms) | Radicand and field-discriminant heights differ by factors one or four, with the same exponent. | Retained height conversion; original historical inputs remain explicit gaps. |
| [Bhargava count of quartic fields](../packages/ArithmeticStatisticsPartV/README.md#bhargava-count-of-quartic-fields) | Quartic signature weights sum to 5/24 and S₄ has ten involutions. | Added constant/group checks. |
| [Bhargava count of quintic fields](../packages/ArithmeticStatisticsPartV/README.md#bhargava-count-of-quintic-fields) | Quintic signature weights sum to 13/120 and S₅ has 26 involutions; the factor at two is 37/32. | Added normalization checks. |
| [Bhargava shankar wang counts over number fields](../packages/ArithmeticStatisticsPartV/README.md#bhargava-shankar-wang-counts-over-number-fields) | For Q the weighted quadratic coefficient is 3/π², half the unweighted total. | Added automorphism-weight control. |
| [Bhargava mean of two torsion in cubic class groups](../packages/ArithmeticStatisticsPartV/README.md#bhargava-mean-of-two-torsion-in-cubic-class-groups) | Ordinary cubic 2-torsion means are 5/4 and 3/2; real narrow mean is 2. | Retained narrow/ordinary distinction. |
| [Fouvry kluners moments of four ranks](../packages/ArithmeticStatisticsPartV/README.md#fouvry-kluners-moments-of-four-ranks) | The first two Fouvry–Klüners moments use subspace counts 2 and 5; the real first mean is 3/2. | Added low-moment values. |
| [Cohen lenstra moment prediction](../packages/ArithmeticStatisticsPartV/README.md#cohen-lenstra-moment-prediction) | For u=0 the trivial target has one surjection; odd-prime predictions distinguish real 4/3 and imaginary 2 at p=3. | Retained conjectural status and all-prime scope. |
| [Malle invariants of a permutation group](../packages/ArithmeticStatisticsPartV/README.md#malle-invariants-of-a-permutation-group) | S_n gives a=b=1; regular C_p gives a=1/(p−1); C₃ over Q(ζ₃) has b=2. | Retained cyclotomic rather than ordinary conjugacy. |
| [Malle conjecture](../packages/ArithmeticStatisticsPartV/README.md#malle-conjecture) | S₂ recovers 6/π²; S₃ recovers Davenport–Heilbronn; the degree-one trivial group has no positive minimum index. | Retained nontrivial group hypothesis. |
| [Kluners counterexample to malle conjecture](../packages/ArithmeticStatisticsPartV/README.md#kluners-counterexample-to-malle-conjecture) | C₃ wreath C₂ has an extra cyclotomic logarithm; removing regular S₃ uses a bound below X^(1/2). | Retained the counterexample without an unnecessary X^(1/3) claim. |
| [Cubic conductor discriminant](../packages/ArithmeticStatisticsPartV/README.md#cubic-conductor-discriminant) | For ∛3, D_L=−243, D_K=−3 and conductor f=9. | Retained wild prime-three conductor factors. |
| [Quadratic order three torsion bound](../packages/ArithmeticStatisticsPartV/README.md#quadratic-order-three-torsion-bound) | Conductor one gives the maximal order; K=Q(√−39), f=9 has a C₃² conductor kernel. | Retained wild local extra rank and ordinary order classes. |
| [Cubic large total ramification bound](../packages/ArithmeticStatisticsPartV/README.md#cubic-large-total-ramification-bound) | For ∛3 the p=3 contribution is nonzero once X>243; the tail starts at integer M=1, not a nonexistent prime one. | Corrected the prime-one negative control. |
| [Secondary cubic lattice coefficient](../packages/ArithmeticStatisticsPartV/README.md#secondary-cubic-lattice-coefficient) | Full congruence lattice T₁=T₂=m=1 recovers the cubic X^(3/4) error. | Added specialization Check. |
| [Cubic secondary local factor evaluation](../packages/ArithmeticStatisticsPartV/README.md#cubic-secondary-local-factor-evaluation) | At two the primary U₂ mass is 21/32, distinct from its secondary factor. | Retained separate local factors. |
| [Cubic root weighted sieve identity](../packages/ArithmeticStatisticsPartV/README.md#cubic-root-weighted-sieve-identity) | The zero binary form has p+1 projective roots. | Added the zero-fibre control. |
| [Refined cubic sieve](../packages/ArithmeticStatisticsPartV/README.md#refined-cubic-sieve) | δ₁=1/24, δ₂=1/30 give exponents 13/16,4/5,7/10; n=1 has empty product γ₁=1. | Added rational exponent and degenerate-index controls. |
| [Cubic secondary orbit integral](../packages/ArithmeticStatisticsPartV/README.md#cubic-secondary-orbit-integral) | Generic separability does not imply an order is étale; primitive coefficient Haar has its own mass. | Retained positive discriminant and measure contracts. |
| [Low degree s integral parametrization](../packages/ArithmeticStatisticsPartV/README.md#low-degree-s-integral-parametrization) | For quadratic S-parametrization the dyadic place must be in S and unit-square scaling is retained. | Added base-Q and square-action checks. |
| [Low degree maximal sieve](../packages/ArithmeticStatisticsPartV/README.md#low-degree-maximal-sieve) | At M=1 the displayed logarithmic denominator fails; M≥2 avoids it and the order of X then M limits matters. | Added domain and limit-order checks. |
| [Low degree jacobian mass](../packages/ArithmeticStatisticsPartV/README.md#low-degree-jacobian-mass) | The n=2 Jacobian has archimedean factor two offset by the dyadic half; quadratic automorphisms have size two. | Added product and stabilizer controls. |
| [Quartic quintic density constants](../packages/ArithmeticStatisticsPartV/README.md#quartic-quintic-density-constants) | Quartic and quintic prefactors agree with their separate signature sums. | Added cross-normalization Check. |
| [Quadratic four rank conic formula](../packages/ArithmeticStatisticsPartV/README.md#quadratic-four-rank-conic-formula) | D=5 uses two positive divisor choices; including negative pairs would double the conic count. | Retained positivity and multiplicities. |
| [Quadratic four rank jacobi expansion](../packages/ArithmeticStatisticsPartV/README.md#quadratic-four-rank-jacobi-expansion) | Negative discriminant classes have distinct six sign/parity prefactors; the −8 case has no spurious 2^(−k). | Retained explicit sign witnesses. |
| [Fk maximal unlinked support](../packages/ArithmeticStatisticsPartV/README.md#fk-maximal-unlinked-support) | At k=1 the four-point space has maximal unlinked support size two; a singleton is not maximal. | Added passing/failing support controls. |
| [Fk main coefficient](../packages/ArithmeticStatisticsPartV/README.md#fk-main-coefficient) | At k=1,2 the subspace counts are 2,5. | Added low-rank specialization. |
| [Fk narrow wide moment comparison](../packages/ArithmeticStatisticsPartV/README.md#fk-narrow-wide-moment-comparison) | A prime divisor 3 modulo four forces the narrow/wide rank comparison; the thin condition is only a candidate criterion. | Retained direction and exceptional-family scope. |
| [Rank moments determine rank law](../packages/ArithmeticStatisticsPartV/README.md#rank-moments-determine-rank-law) | k=0 gives normalization; k=1 gives 1+p^(−u); the geometric product saturates the excluded separator boundary. | Added direct Jensen proof and strict growth boundary. |
| [Rigid embedded field family](../packages/ArithmeticStatisticsPartV/README.md#rigid-embedded-field-family) | There is one rigid degree-one field, two quadratic rigidifications and 18 for an S₃ cubic. | Retained embedding and automorphism divisors. |
| [Relative torsion splitting](../packages/ArithmeticStatisticsPartV/README.md#relative-torsion-splitting) | For L=K the relative kernel is trivial; in degree two on C₃ the normalized section uses inverse degree two. | Added norm/extension API and coprimality control. |
| [Quartic class group two torsion fibre](../packages/ArithmeticStatisticsPartV/README.md#quartic-class-group-two-torsion-fibre) | Over Q the base-character filter is vacuous; a base-pulled quadratic extension gives a product closure and is excluded. | Retained ordinary/narrow infinity filters. |
| [Low degree class group mass ratios](../packages/ArithmeticStatisticsPartV/README.md#low-degree-class-group-mass-ratios) | Real/imaginary quadratic means 4/3,2 and cubic means 5/4,3/2 retain the base h₂ factor. | Added narrow/ordinary comparisons. |
| [Uniform quadratic field bound](../packages/ArithmeticStatisticsPartV/README.md#uniform-small-degree-field-bound) | For F=Q the quadratic estimate is O(X); X<1 contains no fields. | Removed the duplicate degree≤3 bound; kept the sharper quadratic specialization. |
| [Shintani cubic order uniform bound](../packages/ArithmeticStatisticsPartV/README.md#shintani-cubic-order-uniform-bound) | At degree one ζ_Q(0)=−1/2, not zero; the Shintani threshold is D_F³h₂(F)^(2/3). | Added residue/threshold controls. |
| [Relative three torsion propagation](../packages/ArithmeticStatisticsPartV/README.md#relative-three-torsion-propagation) | The Q specialization is √X+X, and the conductor-nine wild example survives. | Corrected all-conductor input exposed as open. |
| [Relative three torsion piecewise bound](../packages/ArithmeticStatisticsPartV/README.md#relative-three-torsion-piecewise-bound) | All four adjacent regime formulae agree at their transition values, including (D,h)=(1,1),(16,8),(81,27). | Independently checked with exact fractions. |
| [Quadratic tower torsion tail](../packages/ArithmeticStatisticsPartV/README.md#quadratic-tower-torsion-tail) | When Y>√X the tower tail is empty; summation applies only at m≥2. | Added endpoint/tower-length controls. |
| [Wreath transposition fibre](../packages/ArithmeticStatisticsPartV/README.md#wreath-transposition-fibre) | H=1 gives C₂ with normalizer factor two; V₄ is not the D₄ transposition wreath type. | Retained ambient embedding requirement. |
| [Thin two group torsion](../packages/ArithmeticStatisticsPartV/README.md#thin-two-group-torsion) | The V₄ kernel support is powerful; transposition D₄ is excluded; the unit ideal is powerful. | Added nonexample and imported ANT §5.7. |
| [Quadratic tower counting constants](../packages/ArithmeticStatisticsPartV/README.md#quadratic-tower-counting-constants) | m=1 over Q gives 6/π²; m=0 is the single base field. | Added m≥1 to the positive linear asymptotic. |
| [Two extension three torsion means](../packages/ArithmeticStatisticsPartV/README.md#two-extension-three-torsion-means) | m=1 gives total mean 5/3, real 4/3 and imaginary 2; m=0 gives one. | Added m≥1 to the theorem. |
| [Relative wreath three torsion mean](../packages/ArithmeticStatisticsPartV/README.md#relative-wreath-three-torsion-mean) | For H=1, u=0,1 give means 2,4/3; unrealized signatures are excluded. | Retained relative/narrow hypotheses. |
| [Embedded quadratic wreath type](../packages/ArithmeticStatisticsPartV/README.md#embedded-quadratic-wreath-type) | The C₂ kernel in V₄ has two outside involution classes and is bad; C₃ in S₃ is good. | Retained embedded rather than abstract types. |
| [Nonabelian quadratic moment interface](../packages/ArithmeticStatisticsPartV/README.md#nonabelian-quadratic-moment-interface) | For C₃, rigid mean one becomes unrigid means 1/2 and 1/6; the A₄ order-96 row has a different automorphism normalization. | Retained the exact ambient automorphism divisor. |
| [Nonabelian admissibility and abelianization](../packages/ArithmeticStatisticsPartV/README.md#nonabelian-admissibility-and-abelianization) | At two the −23 cubic has C₃ decomposition and trivial inertia; abelianization must be generated by outside involutions. | Replaced the false decomposition assertion with finite inertia. |
| [Embedded type catalogue](../packages/ArithmeticStatisticsPartV/README.md#embedded-type-catalogue) | C₂, C₃ and A₄ examples have distinct V₄, S₃, S₄ and order-96 closures. | Retained ambient type and certificate filters. |
| [Elementary two moment euler products](../packages/ArithmeticStatisticsPartV/README.md#elementary-two-moment-euler-products) | k=1 gives 1+2·2^(−2s)+4·2^(−3s), and the T/V pole orders are two/one. | Changed to the checked arXiv version locator. |
| [Elementary two moment divergence](../packages/ArithmeticStatisticsPartV/README.md#elementary-two-moment-divergence) | k=1 yields X log X; proper images have a smaller pole; k=0 is excluded. | Retained pole and surjection subtraction. |
| [Nonabelian low degree known moments](../packages/ArithmeticStatisticsPartV/README.md#nonabelian-low-degree-known-moments) | A₃ unrigid moments are 1/2 imaginary and 1/6 real; Q₈ and D₈ use distinct divergence arguments. | Original signs checked; restricted Q₈ residues remain open. |
| [A4 appendix kernel enumerator](../packages/ArithmeticStatisticsPartV/README.md#a4-appendix-kernel-enumerator) | Odd groups have no C₂² quotient; a C₃-trivial quotient is rejected; two kernels give 48 rigid maps. | Corrected appendix locator and retained sampling versus exact counting. |
| [Small trace zero element](../packages/ArithmeticStatisticsPartV/README.md#small-trace-zero-element) | In a quadratic field √d is trace zero; in a biquadratic field a nonrational element can fail to generate. | Retained no-intermediate-field hypothesis. |
| [Schmidt field count bound](../packages/ArithmeticStatisticsPartV/README.md#schmidt-field-count-bound) | n=2 gives the linear bound and n=4 gives exponent 3/2. | Added low-degree Checks. |
| [Mixed trace finite fibres](../packages/ArithmeticStatisticsPartV/README.md#mixed-trace-finite-fibres) | For n=6,r=3, degree four gives 15≤18 while degree five gives 21>18; all AH exceptions are excluded by the exact range. | Registered interpolation and finite-fibre inputs as open. |
| [Lemke oliver thorne field bound](../packages/ArithmeticStatisticsPartV/README.md#lemke-oliver-thorne-field-bound) | The two-generator estimate first improves at n=95; finite numeric bounds require a genuine finite certificate. | Retained source theorem, not an uncomputed certificate claim. |
| [Cyclic prime field count](../packages/ArithmeticStatisticsPartV/README.md#cyclic-prime-field-count) | p=2 gives linear and p=3 square-root growth; V₄ would need a logarithm. | Original Wright pole/positivity proof remains open. |
| [Galois field three eighths bound](../packages/ArithmeticStatisticsPartV/README.md#galois-field-three-eighths-bound) | Regular S₃ has order six; A₅ has A₄ with 144>60, while C₂ has no such proper subgroup. | Made nonabelian-simple prerequisite explicit; CFSG proposition is not a proof. |
| [Fixed resolvent cubic count](../packages/ArithmeticStatisticsPartV/README.md#fixed-resolvent-cubic-count) | The fixed resolvent d=−3 has √X log X, whereas other fixed d have √X. | Retained exceptional pole and fixed-field constants. |
| [Baily weighted quartic count](../packages/ArithmeticStatisticsPartV/README.md#baily-weighted-quartic-count) | Empty resolvent subfamily gives zero; a singleton requires uniform K dependence in the weighted estimate. | Baily arbitrary-subfamily multiplicity remains open. |
| [Weighted cubic partial summation](../packages/ArithmeticStatisticsPartV/README.md#weighted-cubic-partial-summation) | Weights b=0,1 only change logarithmic losses after ε; the input power a must be positive. | Retained partial-summation domain. |
| [Quartic torsion counting applications](../packages/ArithmeticStatisticsPartV/README.md#quartic-torsion-counting-applications) | The torsion exponent a≈0.2784 produces quartic exponent ≈0.7784; constants still depend on F. | Retained weighted and fixed-base scope. |
| [Governing field interface](../packages/ArithmeticStatisticsPartV/README.md#governing-field-interface) | For d=−4,p=3, −12 is not fundamental; ramified primes impose no Frobenius condition. | Retained conjugacy and admissible-family restrictions. |
| [Eight rank governing field](../packages/ArithmeticStatisticsPartV/README.md#eight-rank-governing-field) | p=5 has h(−20)=2; p=17 has h(−68)=4 despite p≡1 mod8. | Corrected original criterion locator; PID certificate remains open. |
| [Sixteen rank spin criterion](../packages/ArithmeticStatisticsPartV/README.md#sixteen-rank-spin-criterion) | p dividing F is excluded; unit-square changes preserve corrections; p=3 does not split in Q(ζ₈). | Corrected Proposition 6.2 attribution and fixed r(π)/π direction. |
| [No sixteen rank governing field](../packages/ArithmeticStatisticsPartV/README.md#no-sixteen-rank-governing-field) | An arbitrary governing field can have unbounded degree; C₃ alone cannot handle its compositum. | Retained the assumption of every C_n. |
| [Restricted real quadratic family](../packages/ArithmeticStatisticsPartV/README.md#restricted-real-quadratic-family) | d=1 belongs to the radicand set but is not a field; d=5 and d=2 solve Pell, d=3 does not. | Retained radicand/discriminant distinction. |
| [Negative pell historical bounds](../packages/ArithmeticStatisticsPartV/README.md#negative-pell-historical-bounds) | The inequalities distinguish α,1−α and 2/3; odd/even classes control height transfer. | Checked original FK inequalities; Blomer/CO originals still open. |
| [Polynomial order lattice reduction](../packages/ArithmeticStatisticsPartV/README.md#polynomial-order-lattice-reduction) | X²+1 has Gram diag(1,1), X²−2 has diag(2,4); weighted complex embeddings would change these. | Added real-Gram reduction existence interface; no integral-metric substitution. |
| [Squarefree field discriminant sn](../packages/ArithmeticStatisticsPartV/README.md#squarefree-field-discriminant-sn) | Squarefree discriminants −23 and 229 have S₃ closure; −108 is excluded. | Removed duplicate maximality theorem; retained the S_n closure variant. |
| [Monic polynomial sieve counts](../packages/ArithmeticStatisticsPartV/README.md#monic-polynomial-sieve-counts) | n=2 has positive full-box squarefree density, but trace-zero discriminants are all divisible by four. | Retained full-dimensional box scope. |
| [Monic weak quasi reduction](../packages/ArithmeticStatisticsPartV/README.md#monic-weak-quasi-reduction) | For X²−1 the scaled Gram diag(2,2ρ²) is reduced for the stated direction; ρ=0 is singular. | Retained weak, not strong, reduction. |
| [Strong reduction ring fibres](../packages/ArithmeticStatisticsPartV/README.md#strong-reduction-ring-fibres) | Odd-degree reflection is −g(−x); binary overall sign also preserves the ring. | Retained actual orbit multiplicity rather than unique representatives. |
| [Trace restricted polynomial sieve](../packages/ArithmeticStatisticsPartV/README.md#trace-restricted-polynomial-sieve) | At n=2 the trace-zero density κ is zero; a positive trace band requires its own restricted tail. | Retained conditional trace-band theorem. |
| [Short generator field upper bound](../packages/ArithmeticStatisticsPartV/README.md#short-generator-field-upper-bound) | n=2 and n=3 short-generator exponents are two and five in generator height. | Added height-carrier controls. |
| [Regular monic region](../packages/ArithmeticStatisticsPartV/README.md#regular-monic-region) | Roots ±1 and ±i have norm one and separation two; repeated roots fail positive separation. | Added direct uniform root compactness/locator argument. |
| [Regular monic sieve](../packages/ArithmeticStatisticsPartV/README.md#regular-monic-sieve) | A trace-zero quadratic slice has zero density, and a local condition forcing p² has zero local factor. | Retained admissibility and product positivity hypotheses. |
| [Separated generator multiplicity](../packages/ArithmeticStatisticsPartV/README.md#separated-generator-multiplicity) | Quadratic translations give O(Y), not O(1), fibres; c=0 yields a singular invisible-coefficient example. | Uniform inverse-Vandermonde proof and Lean negative control. |
| [Monogenic field lower bound](../packages/ArithmeticStatisticsPartV/README.md#monogenic-field-lower-bound-target) | n=2 and n=3 give discriminant exponents one and 5/6; the generator-height numerator loses one translation parameter. | Retained lower bounds in both degrees. |
| [Monogenic field asymptotic prediction](../packages/ArithmeticStatisticsPartV/README.md#monogenic-field-asymptotic-prediction) | n=2 reflection fixes the trace-zero model, causing a factor-two coefficient error; lower bounds alone do not identify an asymptotic constant. | Restricted asymptotic conjecture to n≥3 and added three Checks. |
| [Binary discriminant local factors](../packages/ArithmeticStatisticsPartV/README.md#binary-discriminant-local-factors) | Modulo nine 42768/59049=176/243 are good; modulo four 384/1024=3/8 are good. | Independently enumerated the fixed-degree discriminant. |
| [Binary form sieve counts](../packages/ArithmeticStatisticsPartV/README.md#binary-form-sieve-counts) | Odd degree n≥3 has saving 1/(2n); even degree keeps its explicit tail hypotheses; n=2 is separate. | Retained parity and conditional scope. |
| [Binary form arithmetic Bertini](../packages/ArithmeticStatisticsPartV/README.md#binary-form-arithmetic-bertini) | n=3 uses the odd tail; n=4 retains δ,η,ξ,τ assumptions; the zeta argument is three rather than its pole at one. | Retained exact Bertini range and constants. |
| [Regular binary region sieve](../packages/ArithmeticStatisticsPartV/README.md#regular-binary-region-sieve) | Scaling a binary form by t scales Δ by t^(2n−2) and volume by t^(n+1). | Retained regularity, positive local factors and Δ≠0. |
| [Binary invariant-order fibres](../packages/ArithmeticStatisticsPartV/README.md#binary-invariant-order-fibres) | Over Z the even class-group factor is one; a general S-order retains it; n=3 has no cross-ratio parameter. | Retained uniform order-bound and ordinary GL₂ convention. |
| [Compact binary transporters](../packages/ArithmeticStatisticsPartV/README.md#compact-binary-transporters) | n=3,4 have weight gaps one and two; n=2 xy is fixed by an unbounded split torus. | Retained n≥3; used existing singular-system supplier. |
| [Binary form field lower bound](../packages/ArithmeticStatisticsPartV/README.md#binary-form-field-lower-bound-target) | n=3 gives exponent one; n=4 gives conditional 5/6 and needs the uniform order/fibre bounds. | Retained conditional binary application. |
| [Squarefree alternating-extension transfer](../packages/ArithmeticStatisticsPartV/README.md#squarefree-alternating-extension-transfer) | The −23 and 229 fields test imaginary and real quadratic resolvents; −108 fails squarefreeness. | Direct inertia/discriminant/infinity proof with bounded normal-closure fibre. |
| [Unramified alternating extension lower bound](../packages/ArithmeticStatisticsPartV/README.md#unramified-alternating-extension-lower-bound-target) | n=3 gives linear and n=4 conditional 5/6 versus monogenic 3/4; pairs are not the same as quadratic bases. | Retained pair counting and multiplicity normalization. |
| [All fields degree at most five](../packages/ArithmeticStatisticsPartV/README.md#all-fields-degree-at-most-five) | D₄ has a linear term and cannot be omitted; proper quintic D₅/F₂₀ require o(X). | Made the missing quintic remainders explicit. |
| [Kluners cyclotomic subfamily](../packages/ArithmeticStatisticsPartV/README.md#kluners-cyclotomic-subfamily) | Cyclotomic C₃ has b=2 over Q(ζ₃) versus b=1 over Q; its logarithm survives removal of C₆ and regular S₃. | Retained counterexample; general Galois dependency is exposed. |
| [Nonabelian tame local model](../packages/ArithmeticStatisticsPartV/README.md#nonabelian-tame-local-model) | C₃ in S₃ has local 1+p^(−s) and exponent zero; C₂ in V₄ has 1+2p^(−s) and exponent one. | Retained outside-class and degree-one local coefficient controls. |

The following additional supporting statements were checked separately from the 111 retained anchors:

| Supporting statement | Instances tried | Result / change |
| --- | --- | --- |
| `RankGrid.geometricZero` | Nonzero constant fails grid vanishing; the canonical geometric-zero product has α=1/2, ω=0; a=1 is forbidden. | Strict ω>α−1/2 and a>1 are essential; the Jensen lower bound and Gaussian upper bound have opposing linear terms. |
| `simpleGroup_largeProperSubgroup` | A₅/A₄ gives 60<144; C₂ gives 2>1. | Nonabelian is essential; universal proof still missing. |
| `doublePointInterpolation` | r≥2,d≥2,n≥1; quadratic range 2≤n≤r−1; cubic (r,n)=(5,7); quartic (3,5),(4,9),(5,14). | All exceptions are listed and excluded by n≥6, r≤n and the strict binomial inequality. The source theorem still needs a supplier/proof. |
| `polynomialMap_finiteFibres` | Identity has one-point fibres; t↦t² in characteristic zero has at most two; in characteristic p, t↦t^p has zero Jacobian. | Field characteristic and nonzero Jacobian are part of the contract; a global finite-fibre assertion is not made. |
| `IsMinkowskiReducedGram_exists` | Identity positive definite; diag(2,4) gives a valid integral basis; singular zero Gram has infinitely many bounded vectors. | Existence uses finite integer points in positive-definite Gram balls, minimum among extendable primitive prefixes and unimodular completion; singular matrices are excluded. |
| Normalized relative narrow section | L=K gives the identity; degree-two C₃ requires multiplication by two; when ℓ divides degree there is no inverse. | Named norm/extension laws and positivity are present, without an opaque Lean class-group carrier. |

All definition blocks retain named API targets and at least three discriminating prose Checks, including computed values, exclusions, map agreement and degenerate cases. Their meaningful names are either real-bodied declarations in the suggested file or listed in its closing comment. No definition is implemented with `sorry`.

## Lean signature and execution audit

The suggested file contains two light real-bodied definitions, three milestone theorems and nineteen examples. Every theorem/example uses `sorry`; no data definition does. Arithmetic order/orbit/cover/moment carriers absent at the pins remain README specifications. The following spot-checks cover more than ten signatures and include all three theorems:

| Lean declaration / example | Agreement with README |
| --- | --- |
| `weightedDilation` | Descending monic coefficient i is multiplied by Y^(i+1), on existing `Fin n → ℝ`. |
| `separatedRoots` | Same c,C work for every ordered pair; upper root norm uses C, lower distinct-root distance uses c. The predicate itself allows c≤0; the theorem requires c>0. |
| `weightedDilation_mul` | Multiplicative composition is valid for all real U,Y, including zero; no positivity is unnecessarily imposed. |
| `separated_generator_coefficients` | n≥2, c>0, C≥0, Y≥1; uniform K depends only on n,c,C; every embedding evaluation is bounded before any coefficient conclusion. |
| `separated_generator_high_coefficients` | Same hypotheses; Y>Y₀ and integral coefficients force degree at least two to vanish. The large-Y quantifier does not include its threshold. |
| Y=2 / Y=3 dilation examples | (1,2)↦(2,8) and composition↦(6,72). |
| Unit and zero dilation | Y=1 gives the original vector; Y=0 gives zero because all weights are positive. |
| Separated real / imaginary roots | ±1 and ±i both satisfy c=2,C=1. |
| Coincident roots | A positive c rejects the zero two-tuple. |
| Empty and singleton tuples | Empty tuple is vacuous even for negative C; singleton zero requires C≥0 and has no distinct-root obligation. This does not weaken the n≥2 theorems. |
| c=0 singular tuple | There is a nonzero integer coefficient vector invisible at the zero root tuple, so the inverse-matrix theorem cannot admit c=0. |
| Polynomial discriminants | X³−X−1, X³−4X+1, X³−2 and X⁴−1 have discriminants −23,229,−108,−256. |
| Narrow section normalization | In `ZMod 3`, two times two times x equals x, modelling inverse degree after extension. |
| Decomposition/inertia control | X³+X+1 has no root in `ZMod 2`; irreducibility of this cubic gives the nontrivial unramified decomposition example. |
| Nonabelian simplicity control | Natural inequalities 1²<2 and 60<12² pin the required boundary. |
| Quadratic reflection | (X²+C a) composed with −X is itself, so free size-two reflection orbits cannot be assumed. |
| Binary transporter | u·u⁻¹ cancels only for u≠0; the example witnesses the excluded degree-two torus. |

`lean-check` finished with exit 0 against the pins above, with exactly 22 warnings, each `declaration uses sorry`, and no other warning or error. The file has fewer than 5,000 lines and contains no sorry-bodied definition, `True` target, hypothetical conclusion-as-assumption, `#eval`, `#synth` or Lean language-server dependency. This checks elaboration, not proofs of the examples or milestones.

Independent exact-arithmetic checks completed with exit 0: fundamental/squarefree discriminant enumeration, all binary cubic forms over F₂, binary-quartic discriminants modulo four and nine, the refined-sieve rational exponents, monogenic exponent identities for n=2,…,9, the quadratic reflection factor and all four relative piecewise junctions. These computations justify the reported values, not the unresolved asymptotic source contracts.

The seven unchanged packets `ArithmeticStatistics.json` and `ArithmeticStatistics--ST.0.json` through `ArithmeticStatistics--ST.5.json` each passed `scripts/check_blueprint.py` with zero errors and warnings. `intake.py check-files` on the package, report and handoff reports zero problems. Markdown link/anchor verification found no broken local links; all 111 original named targets and existing mathematical tests remain. The README is below 350 KB and `git diff --check` passes.

## Public source retrieval record

All successful retrievals below were made on 2026-10-17. SHA-256 identifies the bytes consulted; theorem locations and conclusions are described above in my own words. These hashes are not claims that every proof in a paper was checked. No private book or source file is included in the repository.

| Reference / identification | Public URL | SHA-256 |
| --- | --- | --- |
| [5] | [public PDF](https://arxiv.org/pdf/1005.0672v3) | `d45b16cdb6b34655634f4305416ad68083d6e6e5674907aefc85a30ac8937f74` |
| [20] | [public PDF](https://arxiv.org/pdf/1512.03035) | `f913019717d4605d7b8550e484e5edb0e9dafcbe79c083e0b941fb7cb54591ac` |
| [21] | [public PDF](https://people.math.harvard.edu/~mmwood/Publications/ArithStats.pdf) | `595ec4869d94e8b7b32c84f4845a0de24189a5a3483fac4ea19e9551f651c0ba` |
| [23] | [public PDF](https://arxiv.org/pdf/math/0411486v1) | `4cfff969ec3d833ac8cd6e888346bddb9cc28f99470e5a6f15d5f743f679f71e` |
| [90] | [public PDF](https://math.uni-paderborn.de/fileadmin/mathematik/AG-Computeralgebra/Publications-klueners/ranks.pdf) | `73ca99eba727ed110f68d9c6d4a9313a05923faf9449979270b97a3743bf791f` |
| [93] | [public PDF](https://math.dartmouth.edu/~carlp/BBPnew23.pdf) | `f2d71e7757d23d77d77746b92333b7da37f88deee799e9a3c854a945b303a8d3` |
| [94] | [public PDF](https://arxiv.org/pdf/1303.7337) | `6864a1f897b121c79ec73ee0c35b43577bf3188b0682ca5c9f3aac0df33fed88` |
| [95] | [public PDF](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/6AABE169B5BA8192FE036455DE4F806F/S2050508625000009a.pdf/the-average-size-of-3-torsion-in-class-groups-of-2-extensions.pdf) | `d5051ab0d37f9985f1adea5cbfee2263812ce96de2b354598448765411344ce5` |
| [98] | [public PDF](https://lemkeoliver.github.io/papers/25-NumberFieldBounds.pdf) | `f6e84cd5da748d5f2408f3d68fb5cf0f0bb14d795c9fb4816f4bd37a3f527c1f` |
| [99] | [public PDF](https://www.math.kobe-u.ac.jp/HOME/tani/bstttz.pdf) | `bba54fd02aadec75b51f2cdbb312c702c06f44384e45a7ec57832704e4e106ec` |
| [100] | [public PDF](https://arxiv.org/pdf/2111.06507v3) | `b98647f10dbf4b74be61570d8f12fe7c8cadf24f7e47e667a1bcff6159471780` |
| [101] | [public PDF](https://www.numdam.org/article/AST_1995__228__189_0.pdf) | `52e7c0378125c2b8a0f142f006a4f5df1d8e0502efccc867146b72b9e4044ec8` |
| [102] | [public PDF](https://annals.math.princeton.edu/wp-content/uploads/annals-v163-n2-p11.pdf) | `3af8ff4cbb5e590498be44d168cd0a1404e5d48a5a55298edbd7529174b772f2` |
| [103] | [public PDF](https://arxiv.org/pdf/1809.09597v1) | `d56a738ae1b1487dd01b92b7084dd6bd4b9a041a85efdd2fac66b86afd8af433` |
| [104] | [public PDF](https://arxiv.org/pdf/2201.13424) | `c7a93ffea06491d824d900fe067f6768246e84555fa8da8282833caac7850cbd` |
| [105] | [public PDF](https://arxiv.org/pdf/1611.09806v3) | `6a7252706b283de3f1ee254fe6b56fd76e215f789550346aba12861dfd02af83` |
| [106] | [public PDF](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/FD680BEF350C0140B682AB604D45F415/S2050508625000095a.pdf/squarefree-values-of-polynomial-discriminants-ii.pdf) | `b6e5d1701f487b813e9d6a0b26f9b8671c02c414996298cbba71fe5060e90740` |
| [108] | [public PDF](https://msp.org/ant/2014/8-1/ant-v8-n1-p03-s.pdf) | `3e50bd9564506337130e775a8f7aee311c47b0ea103354de7ee9feb6c12f5ef2` |
| [109] | [public PDF](https://arxiv.org/pdf/1003.1869v1) | `2477ad5f4ff61e55246c053b832bb7ec88a8b7b643ca4c7c471124a81e26b6a0` |
| [132] | [public PDF](https://arxiv.org/pdf/math/0312234v1) | `61b4f4ae09ae0521e394f3db2b772b348e2176c344ccfb766c1081cd3624350b` |
| [50] | [public PDF](https://arxiv.org/pdf/1702.04644v2) | `2eacf07f9c79a08a65bbfa332b964f0f9bd4ab5abb93e5db8be72e43669be1bd` |
| Nilpotent | [public PDF](https://arxiv.org/pdf/math/0112318) | `f93212dc09eb846bcd7bb578a907a487a0317cdeecd10ae260cc63dba1b65bec` |
| BH | [public PDF](https://www.impan.pl/shop/publication/transaction/download/product/83557) | `d51c3e84f62cf6d5d049a5a3c77856e78388c555059afb03065b7a08746cf892` |
| KM18a | [public PDF](https://arxiv.org/pdf/1705.05505) | `dd4e6c1415f9be300e6a645276c63a1046514cb56301313f94c8aae9ac7ebb25` |
| Lemmermeyer | [public PDF](https://www.numdam.org/item/JTNB_1997__9_1_51_0.pdf) | `1f672462601132605f8215999ab752598f52b271bd64c23c17217be37ceef9b9` |
| Alberts | [public PDF](https://www.numdam.org/item/JTNB_2020__32_3_631_0.pdf) | `b81dd8b0ba5a12f35d472a551b12efbc13d38a777a1069a253a72511b8390b43` |
| KM18a-final | [public PDF](https://discovery.ucl.ac.uk/id/eprint/10071048/1/KM2version2.pdf) | `ad03c9b12493d0dcacf04ee0ef393c9ece3e81f521926da9d4d04b826b0b5258` |
| KM18b | [public PDF](https://arxiv.org/pdf/1611.10337v3) | `562325577ba48197ec63ca4fa93c9a28a4f1bab8087b0cd15d5cc33b0b556377` |
| AndradeJung | [public PDF](https://link.springer.com/content/pdf/10.1007/s00605-018-1162-2.pdf) | `dc4a2cfb44c2daadcb2a2210f8cca9e02c51f7c0ce1dcc2fb44c06517de49651` |
| FKPell-original | [public PDF](https://annals.math.princeton.edu/wp-content/uploads/annals-v172-n3-p13-p.pdf) | `3c3cd7530f1fc8b3e1730d9b388e5f4ede085df819ce331f23ea9fa45d43de5b` |
| GoldfeldHoffstein | [public PDF](https://www.math.columbia.edu/~goldfeld/Goldfeld-Hoffstein1985.pdf) | `41e47b3c8aa7ea4afdec623ea7ecb1879b84db5aa74d52e1f53c75138a31185b` |

Retrieval failures were not treated as source confirmations: [96]'s NSF PDF timed out (the checked [50] arXiv v2 supplies the cited appendix); the offered Baily and Wright PDF endpoints returned 404; an offered Fouvry–Klüners rank-paper mirror returned 403 (the explicit Jensen argument avoids depending on that unavailable proof). Publisher metadata and search snippets do not certify Wright's theorem scope. Blomer, Cremona–Odoni, the original Siegel proof and the required original Datskovsky–Wright/Hasse comparison were not obtained in the requisite scope. The cleared-library index did not provide a permitted substitute for those originals.

The [20]/[92] arXiv history has v2 dated 11 March 2026; the bibliography is corrected accordingly. [95] is Forum of Mathematics, Pi 13 (2025), e19. Goldfeld–Hoffstein's printed article begins on p.185, with Theorems 1–2 on pp.187–188; the theorem location is not the article's first page.
