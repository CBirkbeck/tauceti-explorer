# Independent review: Dirichlet p-adic L-functions, L2

Accepted as a finished planning pass. This review covers job `REV-DirichletPadicLFunctions--L2`, issue #5875, by Codex — codex-5ebb6f on 5 October 2026. It is independent of the foreign L2 planner and its latest primitive-interpolation continuation, merged in PR #6145. The reviewed input is the L2 packet at commit `7c3d1877a81b890e25576ebd24be4be8a0aedb88`. The original packet SHA256 is `57f211e5604ffee10d6a06803f601638ff3b4a58be6839b67eac41f566c6d702`.

Every one of the 252 nodes was read, together with all its hypotheses, proof steps, prerequisites, API, uses, tests, acceptance conditions and source fields. Every one of the 326 baseline declarations was checked against its actual pinned source statement, ambient variables and relevant preceding context; file bytes were compared with the pinned Git objects. All 67 referenced fine supplier contracts and the two requested PMIA stage scopes were independently read. All 6,706 suggested Lean lines and 543 named typed test examples were read. The 21 definitions and constructions each have at least three tests. No node was added or removed, and every implementation status remains unchecked.

The acceptance record contains 245 verified and seven corrected nodes. Six packet node objects changed; the seventh correction is the typed even-weight counterexample. Seventeen baseline declaration-kind fields changed without replacing their names, statements or module ownership. Five source findings are confirmed, including two records added by this review. The indexed blueprint checker reports zero errors and zero warnings. The 1,626 independently written exact arithmetic assertions all pass. These checks establish finite and formal examples and source agreement; the Lean file was not compiled.

The stage remains `planned` and the packet remains `complete` in the protocol’s planning sense. Its two supplier requests are explicit dependencies, not undisclosed mathematical claims. The pseudomeasure signatures retain a supplied evaluator and concrete evaluation equality; the uniqueness signature retains the requested positive-moment separation property. Neither request is declared implemented or discharged by an inadequate coefficient-specialized theorem.

## Source reading and version comparison

The source of record is Joaquín Rodrigues Jacinto and Chris Williams, [An introduction to p-adic L-functions, Essential Number Theory 4 (2025), 101–216](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf). The comparison version is [arXiv:2309.15692v2](https://arxiv.org/pdf/2309.15692v2). Both were freshly acquired with HTTP 200 on 5 October 2026; their hashes agree with the versions used for the reviewed mathematics.

- `RJW-published`: SHA256 `78d0479b4b7e3f03d2f9c9a75a772ebd75b58091a3b4f8a1558869b8283b44a6`; 3983735 bytes.
- `RJW-v2`: SHA256 `efa1e10168fb092ffb072bbf147f85f07bea72d2a8f4907d6e9e4fd559c039c4`; 950625 bytes.

Fresh complete text readings cover published printed pages 110–112, 123–150, 159–161 and 179–180. Formula images on printed 142, 144 and 145 were also read at original detail. In v2, physical pages 31–33 were read as complete images, page 32 also as complete text, and physical 35–37 as complete text. This covers all 49 distinct source locators appearing on the L2 nodes, as well as the cited coefficient, restriction, ordinary-moment, Mellin, inverse-dilation and parity context. It is not a whole-paper reading. The older reading histories on the source record remain their authors’ provenance.

The source’s finite-extension formulation is distinguished from the worker’s generic coefficient-field deductions. The larger coefficient hypotheses are justified by the actual native measure, valuation and scalar APIs, not attributed verbatim to the source. Complex special values use separate compatible embeddings of a common character field into C and K; there is no map C→K. Native integer rings refer to the norm valuation of the specified field. Classical modularity and analytic weight-space conclusions are outside this L2 acceptance.

The source comparisons use the Bernoulli convention B₁=−1/2, the inverse character in the tame Gauss formula, the actual primitive conductor in Euler factors, and the integral inverse-coordinate weight in the final measure. Modulus one and positive-level principal characters are kept separate. All positive arithmetic weights are required for uniqueness; an even-weight-only formulation is explicitly refuted.

Correction searches checked the arXiv version history, the versions themselves and three bounded primary-source searches for the relevant correction and errata. The publisher HTML request failed and supplies no evidence. No author was contacted, and absence from these searches is not an exhaustive claim of novelty. Existing paper-extraction findings receive credit below.

### DirichletPadicLFunctions/E11

**kind**: misprint

**locator**: Proof of Lemma5.5, published printed142/PDF43; arXiv v2p.31, first two Mellin integral displays and following Dirichlet-series display.

**printed**: e^(−akt)ε^(−akc); χ(−1)∑χ(−k)k^(−s)

**correction**: Retain the scalar a before the second exponential in both integral displays. In the final Dirichlet-series display either change the summand to χ(k) when χ(−1) is factored out, or keep χ(−k) with no extra parity factor outside. The stated Lemma5.5 formula remains unchanged.

**reason**: The definition on published141 multiplies its second rational summand by a, which survives geometric expansion. Its Mellin scaling is therefore a·a^(−s)=a^(1−s); the printed integrands without a would instead give a^(−s). Also χ(−k)=χ(−1)χ(k); the printed outside χ(−1) counts that sign twice for odd characters. Restoring a and using the parity factor exactly once gives precisely the lemma statement. These are proof-display slips, not a refutation of the stated interpolation formula.

**affects**: the proof

**known**: Also recorded and confirmed in PAPER-RODRIGUES-JACINTO-WILLIAMS-23/E29; own inherited finding retained, with no novelty claim.

**searched**: ["27 September2026: complete published printed139–144/PDF40–45 freshly read in batches of at most3 physical pages. Published142 and144 visually inspected; full arXiv v2PDF30–32 collated. Both source digests match sourceVersions.","The snapshot atlas register was screened by relevant Dirichlet, PMIA and Coleman owners and these locators; no matching existing finding was identified. This is not a priority or novelty claim, and no independent-review verdict is supplied.","Current-session checks of https://arxiv.org/abs/2309.15692, https://sites.google.com/site/joaquinrj/home, https://chriswilliams1404.wixsite.com/website/publications-preprints and https://msp.org/ent/2025/4-1/p03.xhtml are retained from the immediately preceding Kummer continuation. The listing showed latest v2,19 December2024. Journal direct HTTP succeeded after the browser route failed; no correction entry was identified.","27 September2026: additional bounded exact-identifier/5.5+correction, geometric+correction and article-title+errata web searches found no identified correcting publication. Unrelated errata search results were discarded. These checks do not establish absence; no authors were contacted.","Independent2026-10-05 complete affected published and v2 page images collated; the current atlas register identifies the matching already confirmed paper-extraction record. Current arXiv listing still has v2 of19December2024. Bounded primary-domain correction searches found source copies and earlier notes, not an identified correction. No exhaustive absence claim or author contact."]

**review**: {"verdict":"confirmed","reason":"Independently read the complete published142 and v2physical31 page images against the defining expression on141. The second rational summand has a scalar a, which survives expansion and Mellin scaling as a^(1−s); factoring chi(−1) requires chi(k) in the remaining series. The correctly qualified lemma statement is unchanged.","by":"REV-DirichletPadicLFunctions--L2"}

### DirichletPadicLFunctions/E12

**kind**: misprint

**locator**: Geometric expansion immediately after equation(5-3), published printed144/PDF45; arXiv v2p.32.

**printed**: ε^(kc)/(ε^c−1)^(k+1)

**correction**: Insert (−1)^k in the coefficient of T^k: the reciprocal of (1+T)ε^c−1 expands as Σ_{k≥0}(−1)^k ε^(kc)/(ε^c−1)^(k+1)·T^k.

**reason**: Factor the denominator as (ε^c−1)(1+ε^c T/(ε^c−1)); its inverse is the alternating geometric series. The displayed sum without the sign represents F_η(−T), not F_η(T). For the primitive quadratic character modulo3, with ε²+ε+1=0 and G(η)=ε−ε², the defining rational sum reduces to (1+T)/(T²+3T+3). Its T³ coefficient is1/9; the printed unsigned expansion gives−1/9. This is also a tame example at p=2. Multiplying coefficients by signs preserves integrality, so the ensuing integral-coefficient conclusion is unaffected.

**affects**: the proof

**known**: Also recorded and confirmed in PAPER-RODRIGUES-JACINTO-WILLIAMS-23/E30; own inherited finding retained, with no novelty claim.

**searched**: ["27 September2026: complete published printed139–144/PDF40–45 freshly read in batches of at most3 physical pages. Published142 and144 visually inspected; full arXiv v2PDF30–32 collated. Both source digests match sourceVersions.","The snapshot atlas register was screened by relevant Dirichlet, PMIA and Coleman owners and these locators; no matching existing finding was identified. This is not a priority or novelty claim, and no independent-review verdict is supplied.","Current-session checks of https://arxiv.org/abs/2309.15692, https://sites.google.com/site/joaquinrj/home, https://chriswilliams1404.wixsite.com/website/publications-preprints and https://msp.org/ent/2025/4-1/p03.xhtml are retained from the immediately preceding Kummer continuation. The listing showed latest v2,19 December2024. Journal direct HTTP succeeded after the browser route failed; no correction entry was identified.","27 September2026: additional bounded exact-identifier/5.5+correction, geometric+correction and article-title+errata web searches found no identified correcting publication. Unrelated errata search results were discarded. These checks do not establish absence; no authors were contacted.","Independent2026-10-05 complete affected published and v2 page images collated; the current atlas register identifies the matching already confirmed paper-extraction record. Current arXiv listing still has v2 of19December2024. Bounded primary-domain correction searches found source copies and earlier notes, not an identified correction. No exhaustive absence claim or author contact."]

**review**: {"verdict":"confirmed","reason":"Independently read the complete published144 and v2physical32 page images. Inverting (epsilon−1)+epsilon*T gives coefficient (−1)^n epsilon^n/(epsilon−1)^(n+1). The root-free quadratic-modulo3 rational expression has cubic coefficient1/9; its unsigned expansion reverses that sign. Integrality is unchanged.","by":"REV-DirichletPadicLFunctions--L2"}

### DirichletPadicLFunctions/E13

**kind**: misprint

**locator**: Proof of Lemma5.10, first display for (φ∘ψ)(F_η), published printed145/PDF46; arXiv v2p33.

**printed**: pG(η)⁻¹

**correction**: Replace the denominator pG(η)⁻¹ by pG(η⁻¹), keeping the common coefficient −1/(pG(η⁻¹)) inherited from equation(5-3) and root averaging.

**reason**: The Gauss sum of the inverse character is not the inverse of its Gauss sum. The defining series has coefficient −1/G(η⁻¹), and averaging contributes1/p. The following line of the same proof already uses the corrected normalization. For the primitive quadratic character modulo3, η⁻¹=η and G(η)²=−3, so the printed coefficient differs by the nontrivial factor−3; this is also tame at p=2. Correcting the coefficient preserves the stated psi-eigenrelation.

**affects**: the proof

**known**: Also recorded and confirmed in PAPER-RODRIGUES-JACINTO-WILLIAMS-23/E31; own inherited finding retained, with no novelty claim.

**searched**: ["27 September2026: complete published139–147/PDF40–48 read in consecutive batches; full arXiv v2PDF33–35 collated and published145 visually inspected. Both canonical digests match sourceVersions. The error is present in both versions.","The atlas source register was screened by Dirichlet, PMIA and Coleman owners and all relevant locators; no prior matching entry was identified. Own E11/E12 are retained whole. No priority claim or independent verdict is supplied.","Current-session arXiv/author/journal checks from the preceding Kummer and character-twist slices remain their own provenance; latest listed arXiv revision v2,19December2024. Additional identifier+Lemma5.10+correction and authors+Gauss+errata queries identified no correcting publication; unrelated results were discarded.","The search surfaced https://warwick.ac.uk/fac/sci/maths/people/staff/cwilliams/lecturenotes/lecturenotes-change.pdf. Its title page and complete pp23–25 were read; metadata creation/modification date is8February2018, not a newly dated correction. The same typo occurs in Lemma4.10 onp24. SHA256500774707f990324aaf1ccb43def197089d39907177024471d30dfc9ee52feb9. This older note is not substituted for the version of record.","These are bounded checks, not an exhaustive absence or novelty claim; no authors contacted.","Independent2026-10-05 complete affected published and v2 page images collated; the current atlas register identifies the matching already confirmed paper-extraction record. Current arXiv listing still has v2 of19December2024. Bounded primary-domain correction searches found source copies and earlier notes, not an identified correction. No exhaustive absence claim or author contact."]

**review**: {"verdict":"confirmed","reason":"Independently read the complete published145 and v2physical33 page images. The previous defining expression has normalization −1/G(eta inverse), and root averaging adds1/p; neither operation changes the argument of the Gauss sum to its inverse value. The next line uses the correct inverse-character Gauss sum. For quadratic conductor3, G(eta)^2=−3 distinguishes the two scalars.","by":"REV-DirichletPadicLFunctions--L2"}

### DirichletPadicLFunctions/E34

**kind**: misprint

**locator**: Published printed144/PDF45, after equation(5-3), explanation that epsilon_D^c−1 is an integral unit; arXivv2physical32 has the same wording.

**printed**: since it has norm dividing D

**correction**: Use the order of the root epsilon_D^c, not a divisibility property of its norm or of epsilon_D^c−1: for unit c it is a nontrivial root of order D, prime to p, and therefore epsilon_D^c−1 is a unit of the p-adic integer ring.

**reason**: A root of unity has p-adic norm1 regardless of whether its order is divisible by p; norm1 alone does not imply its difference from1 is a unit. For a primitive pth root that difference has positive valuation. The intended tame argument uses D>1 and p not dividing D: the nontrivial root epsilon satisfies sum_(j<D) epsilon^j=0. If epsilon−1 reduced to0, this equation would reduce to D=0 in the residue field, contrary to p not dividing D. Thus its difference is a unit. The final integrality assertion is correct; the printed explanatory word and its referent need repair.

**affects**: the proof

**known**: new

**searched**: ["Hash-verified published PDF https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf, SHA25678d0479b4b7e3f03d2f9c9a75a772ebd75b58091a3b4f8a1558869b8283b44a6, acquired2026-10-05; selected full chapter5 pages139–147 read. Exact affected published page images completely read.","Hash-verified arXivv2 PDF https://arxiv.org/pdf/2309.15692v2, SHA256efa1e10168fb092ffb072bbf147f85f07bea72d2a8f4907d6e9e4fd559c039c4, acquired2026-10-05; complete physical31–33 images checked. Official arXiv record https://arxiv.org/abs/2309.15692 still identifies v2 of19December2024. No full-paper claim.","Three bounded primary-domain searches on2026-10-05 for exact title/norm-dividing/correction, authors/Lemma5.5/correction and exact title/errata at MSP, arXiv and Warwick returned paper copies, author-index entries, earlier notes and unrelated entries, not an identified matching correction. The MSP XHTML record was rejected by the browser content-type route. No exhaustive later-paper survey or historical novelty claim; no author contacted.","Current atlas register screened for the exact wording and the affected published page, alongside the known E12/E30 geometric-sign finding; no matching norm/order wording finding located. Current Dirichlet sibling packets contain no E34 id. Earlier broad unrelated-citation outputs do not count as a full register reading."]

**review**: {"verdict":"confirmed","reason":"Complete affected published144 and v2physical32 images independently read. The reduction-of-finite-geometric-sum proof supplies the intended tame unit argument and separates root order from its always-one norm. No failure of the integral series theorem is claimed.","by":"REV-DirichletPadicLFunctions--L2"}

### DirichletPadicLFunctions/E35

**kind**: gap

**locator**: Published printed145/PDF46, proof of Lemma5.10, the geometric series proving equation(5-4); arXivv2physical33 identical.

**printed**: Expanding each summand as a geometric series

**correction**: Prove the root-average identity as a finite rational-function identity, clearing denominators: sum_(xi^p=1) 1/(y*xi−1)=p/(y^p−1). Then substitute y=(1+T)epsilon_D^c using the genuine unit constant denominators. A finite factorization/logarithmic derivative proof works also at p=2; the original infinite Y-series is not a convergent T-adic expansion.

**reason**: The displayed terms ((1+T)xi epsilon_D^c)^n have unit constant terms at every n, so they do not tend to zero in the T-adic topology. On the p-adic open unit disc, at T=0 their values are roots of unity of norm1 and likewise do not tend to zero. Thus the displayed summation is not justified as a series identity there. The finite rational identity is true, so the psi eigenrelation remains correct. The present packet already supplies an independent finite-residue/actual-measure route rather than relying on this expansion.

**affects**: the proof

**known**: Already recorded and confirmed as PAPER-RODRIGUES-JACINTO-WILLIAMS-23/E104. Added to this packet for the affected source proof, not a new discovery.

**searched**: ["Hash-verified published PDF https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf, SHA25678d0479b4b7e3f03d2f9c9a75a772ebd75b58091a3b4f8a1558869b8283b44a6, acquired2026-10-05; selected full chapter5 pages139–147 read. Exact affected published page images completely read.","Hash-verified arXivv2 PDF https://arxiv.org/pdf/2309.15692v2, SHA256efa1e10168fb092ffb072bbf147f85f07bea72d2a8f4907d6e9e4fd559c039c4, acquired2026-10-05; complete physical31–33 images checked. Official arXiv record https://arxiv.org/abs/2309.15692 still identifies v2 of19December2024. No full-paper claim.","Three bounded primary-domain searches on2026-10-05 for exact title/norm-dividing/correction, authors/Lemma5.5/correction and exact title/errata at MSP, arXiv and Warwick returned paper copies, author-index entries, earlier notes and unrelated entries, not an identified matching correction. The MSP XHTML record was rejected by the browser content-type route. No exhaustive later-paper survey or historical novelty claim; no author contacted.","Exact current atlas E104 row completely read; its source observation is reused with attribution. Its finite factorization example was stated for odd p; this record uses an all-prime rational identity and keeps the dyadic case explicit. Current Dirichlet sibling packets contain no E35 id."]

**review**: {"verdict":"confirmed","reason":"Independent complete published145 and v2physical33 images confirm the geometric step. Constant terms provide a symbolic nonconvergence test; the all-prime finite rational identity repairs the proof. Native packet nodes26–31 use the finite residue route and do not assume the invalid geometric summation.","by":"REV-DirichletPadicLFunctions--L2"}

The second added finding E35 is the already identified finite-product sign/geometric-expansion issue in paper-extraction record E104. The review records its exact proof consequence and the finite rational-identity replacement, without claiming an independent first discovery. E11–E13 likewise acknowledge the matching existing records E29–E31. E34 distinguishes root order from absolute norm; p-prime order, rather than norm alone, proves the denominator is a unit.

## Corrections and precise scope

### tests

- {"nodeIndex":3,"name":"SuggestedCharacterTwistTests.principal_positive_moment","before":"At p=3,a=2, the principal modulus3 twist has first moment1/2.","after":"Over Q_3, at p=3,a=2, the principal modulus3 twist has first moment1/2.","reason":"Specify the same coefficient field as the existing typed example; rational-value distinctions may collapse in eligible positive-characteristic coefficient rings."}
- {"nodeIndex":3,"name":"SuggestedCharacterTwistTests.principal_zero_level_moment","before":"At p=3,a=2, the modulus1 twist has first moment−1/4, different from the positive-level principal twist.","after":"Over Q_3, at p=3,a=2, the modulus1 twist has first moment−1/4, different from the positive-level principal twist.","reason":"Specify the same coefficient field as the existing typed example; rational-value distinctions may collapse in eligible positive-characteristic coefficient rings."}
- {"nodeIndex":3,"name":"SuggestedCharacterTwistTests.dyadic_principal_moment","before":"At p=2,a=3, the principal modulus2 twist has first moment2/3.","after":"Over Q_2, at p=2,a=3, the principal modulus2 twist has first moment2/3.","reason":"Specify the same coefficient field as the existing typed example; rational-value distinctions may collapse in eligible positive-characteristic coefficient rings."}
- {"nodeIndex":3,"name":"SuggestedCharacterTwistTests.inverse_twist_unit_projection","before":"At p=3,a=2, twisting the modulus3 χ-twist again by χ⁻¹ recovers I_Qρ_2, the unit projection of the smoothed measure.","after":"Over Q_3, at p=3,a=2, twisting the modulus3 χ-twist again by χ⁻¹ recovers I_Qρ_2, the unit projection of the smoothed measure.","reason":"Specify the same coefficient field as the existing typed example; rational-value distinctions may collapse in eligible positive-characteristic coefficient rings."}

### hypotheses

- {"nodeIndex":175,"id":"DirichletPadicLFunctions:L2/integral-arithmetic-character-field-comparison","before":"K and L are normed ultrametric fields with Algebra ℤ_p and bounded scalar action, an actual K-algebra on L, IsScalarTower ℤ_p K L and Valuation.HasExtension vK vL. Use exactly the native integer rings and map c as above. For this pointwise identity completeness, nontrivial norms and ContinuousSMul K L are not required.","after":"K and L are normed ultrametric fields with Algebra ℤ_p and bounded scalar action, an actual K-algebra on L, and IsScalarTower ℤ_p K L. Let vK=NormedField.valuation(K), vL=NormedField.valuation(L), OK=vK.integer and OL=vL.integer be the native valuation integer subrings with inherited norms and topologies. Assume Valuation.HasExtension vK vL and use its native instAlgebraInteger map c=algebraMap OK OL, whose included field value is ι=algebraMap K L. For this pointwise identity completeness, nontrivial norms and ContinuousSMul K L are not required.","reason":"Make the receiver valuations, actual integer subrings and native coefficient map explicit locally instead of referring to unspecified names as above; exact baseline219–221 independently checked."}
- {"nodeIndex":241,"fieldIndex":0,"before":"Use the preceding coefficient-field, p and arithmetic-character hypotheses. Now η has positive tame level N and is nonprincipal, f=η.conductor and η₀=η.primitiveCharacter are the existing native objects. hF and hpF are the derived conductor constructor certificates, and the local NeZero f instance is provided by conductor_ne_zero.","after":"p is any prime, including 2. K is a complete nontrivially normed ultrametric field with Algebra Z_p K and IsBoundedSMul Z_p K. n,w are nonnegative integers and chi is an arbitrary native DirichletCharacter K (p^n). The tame character eta has positive level N and is nonprincipal, with hN:IsUnit(N:K) and hpN:p does not divide N. f=eta.conductor and eta_0=eta.primitiveCharacter are the native objects; hF and hpF are their derived unit and tame constructor certificates, and conductor_ne_zero supplies NeZero f.","reason":"Name all local coefficient, wild-character and tame constructor hypotheses rather than an unnamed preceding context; no mathematical strengthening."}
- {"nodeIndex":242,"fieldIndex":0,"before":"Use the preceding coefficient-field, p and arithmetic-character hypotheses. Now η has positive tame level N and is nonprincipal, f=η.conductor and η₀=η.primitiveCharacter are the existing native objects. hF and hpF are the derived conductor constructor certificates, and the local NeZero f instance is provided by conductor_ne_zero.","after":"p is any prime, including 2. K is a complete nontrivially normed ultrametric field with Algebra Z_p K and IsBoundedSMul Z_p K. n,w are nonnegative integers and chi is an arbitrary native DirichletCharacter K (p^n). The tame character eta has positive level N and is nonprincipal, with hN:IsUnit(N:K) and hpN:p does not divide N. f=eta.conductor and eta_0=eta.primitiveCharacter are the native objects; hF and hpF are their derived unit and tame constructor certificates, and conductor_ne_zero supplies NeZero f.","reason":"Name all local coefficient, wild-character and tame constructor hypotheses rather than an unnamed preceding context; no mathematical strengthening."}

### sourceMatches

- {"index":32,"before":"Worker formal-algebra decomposition of the source ordinary-moment and unit-moment formulas. The finite numerator route extends from primitive to all nonprincipal characters at a positive modulus. Complex special values import the existing QSeries periodic-L-value nodes; the field-general measure moment identity is explicitly requested from PMIA L2. No new generic Bernoulli carrier or analytic convergence assertion.","after":"Worker formal-algebra decomposition of the source ordinary-moment and unit-moment formulas. The finite numerator route extends from primitive to all nonprincipal characters at a positive modulus. Complex special values import the existing QSeries periodic-L-value nodes; the field-general ordinary-moment identity uses the now supplied PMIA L2 coefficient-extension and formal-exponential interfaces through tame-measure-ordinary-moment. No new generic Bernoulli carrier or analytic convergence assertion.","reason":"Resolve historical source-match prose against the current whole packet and actual supplier interfaces."}
- {"index":40,"before":"Arithmetic specialization of the source inverse weighting to the actual tame measure. General weighting and continuity of the native p-adic unit inverse are imported from PMIA. Only the untwisted positive-power comparison is established at blueprint level; conductor-product twists and the coefficient-field ordinary-moment request remain explicit.","after":"Arithmetic specialization of the source inverse weighting to the actual tame measure. General weighting and continuity of the native p-adic unit inverse are imported from PMIA. The untwisted and conductor-product positive-power comparisons are planned below through the supplied PMIA ordinary-moment interfaces. The two remaining requests concern canonical pseudomeasure character evaluation and coefficient-general positive-moment separation.","reason":"Resolve historical source-match prose against the current whole packet and actual supplier interfaces."}

### baselineKinds

- {"index":14,"ref":"mathlib:PadicInt.norm_natCast_eq_one_iff","before":"theorem","after":"lemma","reason":"Actual declaration and its prime/coefficient ambient context independently read at the pinned commit."}
- {"index":17,"ref":"mathlib:AbstractMeasure.injective_amiceTransform","before":"theorem","after":"lemma","reason":"Actual declaration and its prime/coefficient ambient context independently read at the pinned commit."}
- {"index":159,"ref":"mathlib:Equiv.prod_comp","before":"theorem","after":"lemma","reason":"Exact pinned declaration and ambient hypotheses independently read in this review."}
- {"index":161,"ref":"mathlib:DirichletCharacter.level_one","before":"theorem","after":"lemma","reason":"Exact pinned declaration and ambient hypotheses independently read in this review."}
- {"index":162,"ref":"mathlib:DirichletCharacter.map_zero'","before":"theorem","after":"lemma","reason":"Exact pinned declaration and ambient hypotheses independently read in this review."}
- {"index":163,"ref":"mathlib:AbstractMeasure.map_dirac","before":"theorem","after":"lemma","reason":"Exact pinned declaration and ambient hypotheses independently read in this review."}
- {"index":214,"ref":"mathlib:IsUltrametricDist.isNonarchimedean_norm","before":"theorem","after":"lemma","reason":"Full pinned native lemma and hypotheses independently read."}
- {"index":289,"ref":"mathlib:Nat.primeFactors","before":"definition","after":"def","reason":"Exact declaration keyword at the pinned source and declaration index."}
- {"index":298,"ref":"mathlib:DirichletCharacter.conductor","before":"definition","after":"def","reason":"Exact declaration keyword at the pinned source and declaration index."}
- {"index":301,"ref":"mathlib:DirichletCharacter.primitiveCharacter","before":"definition","after":"def","reason":"Exact declaration keyword at the pinned source and declaration index."}
- {"index":306,"ref":"mathlib:Units.coeHom","before":"definition","after":"def","reason":"Exact declaration keyword at the pinned source and declaration index."}
- {"index":308,"ref":"mathlib:Nat.Prime.not_dvd_mul","before":"lemma","after":"theorem","reason":"Exact declaration keyword at the pinned source and declaration index."}
- {"index":309,"ref":"mathlib:Finset.prod_div_distrib","before":"lemma","after":"theorem","reason":"Exact declaration keyword at the pinned source and declaration index."}
- {"index":311,"ref":"mathlib:AddChar.sum_mulShift","before":"lemma","after":"theorem","reason":"Exact declaration keyword at the pinned source and declaration index."}
- {"index":312,"ref":"mathlib:AddChar.zmodChar_primitive_of_primitive_root","before":"lemma","after":"theorem","reason":"Exact declaration keyword at the pinned source and declaration index."}
- {"index":324,"ref":"mathlib:DirichletCharacter.conductor_changeLevel","before":"lemma","after":"theorem","reason":"Exact declaration keyword at the pinned source and declaration index."}
- {"index":325,"ref":"mathlib:DirichletCharacter.conductor_mul_dvd_lcm_conductor","before":"lemma","after":"theorem","reason":"Exact declaration keyword at the pinned source and declaration index."}

The Lean correction is at the even-weight counterexample: `AbstractMeasure.dirac` takes the explicit coefficient ring before its point. Both atoms now supply O and a point typed in U. This matches the pinned native constructor in `Mathlib/NumberTheory/Padics/Measure/Basic.lean`, rather than treating the coefficient argument as implicit. It does not change the mathematical example. The entire final file remains 6,706 lines and has SHA256 `c17e92e90269b44ddcec5b1f4f72c0e1a877c3298bd675fc1156bf96cca026cb`.

## Closure, ownership and granularity

The internal dependency graph has 252 nodes and 515 distinct prerequisite edges. Topological traversal visits all 252 nodes, with no unresolved reference and no cycle. Every external reference resolves to one of the 67 read fine contracts or the two explicitly requested supplier stages. No blanket stage citation is substituted for a fine contract where one exists.

The arithmetic chain starts with native p-power character evaluation and weighting, separates ambient modulus-one support from positive-level unit support, constructs the tame rational kernel with its nonprincipal numerator and unit denominator, proves integral coefficient bounds, establishes finite residue translation and refinement, then derives the psi eigenrelation and ordinary-moment Euler restriction. Mahler-density comparisons use the supplied coefficient hypotheses and the actual native measure carrier. Integral inclusion, restriction, coefficient-field comparison and descent are separate nodes. Conductor comparisons count each new prime once, use primitive rather than inflated character values, and prove the coprime product conductor with both inequalities. Composite-modulus Fourier/Gauss arguments are separate from finite-field Gauss identities.

The reviewed library audit’s exact L2 entries and owner boundaries were read, including REV-AUDIT24 and accepted RS14. The PMIA owner supplies general integration, unit restriction, phi/psi, localization and pseudomeasure APIs. Dirichlet L0 supplies the normalized Mellin and smooth-kernel results. L1 owns the rational Kubota–Leopoldt branch. ModularForms owns generic Bernoulli and composite Gauss input; AutomorphicCongruencesII supplies its existing finite-quotient interfaces. No upstream Tau Ceti roadmap is re-planned. The two upstream reader documents previously read in full by this worker remain unchanged: `ArithmeticDirichletSeries/README.md` (424 lines, SHA256 `f375fdc7ee7cfda441216b12da86773f5b94f3aea10bf94400a50562f422ea8a`) and `ModularForms/README.md` (1,601 lines, SHA256 `f39069611e8c70ee1314029b0af3db5ea9b387d860e775cabb5f7769db945578`). This is a reuse of this session’s earlier complete readings, not a fresh reading claim.

### Request to PadicMeasuresIwasawaAlgebras:L3

For every prime p, U=Z_pˣ, M=D(U,Z_p), complete ultrametric normed characteristic-zero field K with a Z_p-algebra structure and bounded scalar action, and native continuous monoid homomorphism κ:U→K, supply a canonical ring homomorphism fκ:M→K whose value at μ is extendIntegralUnitCoefficients(μ)(κ.toContinuousMap), sending δ_u to κ(u). Prove the required compatibility with multiplicative convolution and the Z_p scalar action; the existing coefficient-extension function only supplies additive, scalar and Dirac APIs, while characterIntegralAlgHom uses matching measure/character coefficients. For κ≠1, use the existing generic admissible evaluator to supply an additive map from the actual Iwasawa.pseudomeasures(diracHom,FractionRing M) to K with ratio I_U,K(n_u(z))(κ)/(κ(u)−1) whenever κ(u)≠1. Include independence of u, integral-measure agreement, numerator and integral-measure scalar laws, and agreement with the existing Z_p-valued-character/Q_p-output evaluator after the specified compatible coefficient embeddings. This belongs to PMIA L3 with its own L1/L2 coefficient-integration support; do not assume a ring-map extension on all of FractionRing M. The consuming signatures currently retain an explicit ring map and its concrete evaluation equality, so they do not pretend this canonical construction exists.

Consumers: `DirichletPadicLFunctions:L2/pseudomeasure-character-evaluation-ratio`, `DirichletPadicLFunctions:L2/pseudomeasure-common-character-value`.

### Request to PadicMeasuresIwasawaAlgebras:L2

For every prime p and complete nontrivially normed ultrametric characteristic-zero field K with Algebra Z_p K and IsBoundedSMul Z_p K, let O be its native norm-valuation integer subring and U=(Z_p)ˣ. Supply positive ordinary-moment separation on the actual AbstractMeasure U O O: a measure μ with μ(t_k)=0 for every k≥1 is zero, where t_k(u) is the canonical integral lift of (algebraMap Z_p K (u:Z_p))^k. Build the canonical scalar action on O from the given bounded embedding; do not require a separately chosen incompatible action. Include injectivity after O→K, transport to the native integral arithmetic tests, and the finite-extension case of RJW Theorem5.7. The existing L3/unit-positive-moment-separation has coefficients Z_p only, so does not discharge this request. This generic separation theorem belongs to PMIA; Dirichlet L2 uses it only to identify its already constructed arithmetic measure.

Consumers: `DirichletPadicLFunctions:L2/tame-integral-interpolation-unique`.

All p are covered, including p=2. The positive-moment request is for general complete characteristic-zero K and its canonical native O, including the finite-extension specialization in Theorem5.7. The existing Z_p-coefficient L3 separation theorem cannot discharge it. The pseudomeasure request is a clearing-denominator evaluator on actual pseudomeasures, with convolution and scalar compatibility; it is not a map on the whole fraction ring. The two requests and two gaps therefore remain honest and precisely owned.

The source Theorems5.1 and5.7 and their primitive interpolation clauses are represented at lemma-level granularity, including special-value evaluation, primitive product conductor, Euler normalization, integral inclusion and uniqueness. The supporting coefficient-field and conductor adapters are explicitly worker deductions. The existing six planets name the important constructions and named formulas rather than source page numbers: Dirichlet-character twists, Tame character kernel measure, Gauss formula for the tame series, Integral tame measure, Tame psi eigenrelation, Tame unit-moment Euler factor.

## Typed examples and exact controls

All 543 distinct packet test names map uniquely to a comment marker in the correct namespace and a following typed Lean example. Every line of those examples was read as part of the full suggested-file reading. There are no missing or duplicate markers. The 21 definitions and constructions have 132 API outline entries and 89 tests, each with at least three tests. The whole packet records 162 API entries and 61 downstream uses. These checks assess the written signatures; they do not assert elaboration or theorem proofs.

Independent exact controls use rational arithmetic, Q[u]/(u²+u+1) for the cubic roots and Q(i) for quartic character values, finite residue sums, finite polynomial identities and finite formal-series coefficients. The source’s alternating tame expansion gives coefficients 1/3,0,−1/9,1/9 for the quadratic character modulo3. Its Gauss sum is 1+2u with square −3. The wrong alternating sign and wrong inverse-Gauss normalization fail these checks. The dyadic trivial-wild first special value is 2/3; quadratic wild weights2 and4 give −2 and46. The principal inflated character at level6 has value0 at2, while the primitive level3 value is −1.

The atom δ₁−δ₋₁ annihilates even ordinary powers but has a nonzero odd moment, including in the dyadic characteristic-zero case. The inverse-weight atomic model checks the coordinate and dilation factor; it is a finite model, not a computation of the arithmetic zeta measure’s mass. Tame coefficient integrality controls explicitly omit p=3 where the conductor3 hypothesis fails, and reject that missing-hypothesis example. Finite residue/eigenvalue controls include a quartic character so that inverse-eigenvalue mistakes do not pass accidentally on quadratic characters.

| Exact control group | Assertions |
| --- | ---: |
| alternating-Gauss-cubic | 1 |
| inverse-character-Gauss-orientation | 1 |
| alternating-Gauss-all-coefficients | 13 |
| wrong-Gauss-sign-rejected | 1 |
| wrong-psi-Gauss-factor-rejected | 1 |
| finite-root-fraction-identity | 4 |
| trivial-wild-Euler-value | 1 |
| quadratic-wild-weight-two | 1 |
| quadratic-wild-weight-four | 1 |
| formal-Bernoulli-moments | 39 |
| residue-mass | 24 |
| residue-translation | 422 |
| finite-projection-refinement | 422 |
| psi-eigenvalue | 422 |
| quartic-psi-inverse-rejected | 1 |
| prime-level-finite-polynomial | 12 |
| prime-level-ordinary-moments | 96 |
| distinct-prime-level-moments | 90 |
| principal-regularization-counterexample | 1 |
| coprime-product-conductor | 1 |
| zero-level-conductor | 1 |
| overlap-conductor-counterexample | 1 |
| principal-inflation-Euler-counterexample | 1 |
| atomic-inverse-weight-transport | 18 |
| even-moments-insufficient | 8 |
| odd-moment-distinguishes-atoms | 1 |
| rational-tame-coefficient-integrality | 39 |
| missing-tame-hypothesis-rejected | 3 |

Total: **1,626**, all passing. Exact finite and formal-coefficient controls only. No Lean elaboration, analytic convergence, all-continuous-test equality, local-field Gauss norm certification or arithmetic zeta mass computation.

For reproducibility, the complete independently written control script follows. It uses Python’s standard library and prints a JSON assertion summary. It is an arithmetic control, not Lean code or a replacement formal proof. SHA256: `d60a2d6ba55ebe7a677a4b26307a33cff91f49b162d15c717f66cd764054ae08`.

```python
from fractions import Fraction as F
from math import comb, factorial, gcd, prod
from collections import Counter
import json
from pathlib import Path
counts=Counter()
def check(group, condition):
    assert condition, group
    counts[group]+=1
# Exact quadratic arithmetic in Q[u]/(u^2-A-B*u).
class Q:
    def __init__(self,a=0,b=0,A=-1,B=-1): self.a,self.b,self.A,self.B=F(a),F(b),A,B
    def lift(self,x): return x if isinstance(x,Q) else Q(x,A=self.A,B=self.B)
    def __add__(self,x):
        x=self.lift(x); return Q(self.a+x.a,self.b+x.b,self.A,self.B)
    __radd__=__add__
    def __neg__(self): return Q(-self.a,-self.b,self.A,self.B)
    def __sub__(self,x): return self+-self.lift(x)
    def __rsub__(self,x): return self.lift(x)+-self
    def __mul__(self,x):
        x=self.lift(x);return Q(self.a*x.a+self.A*self.b*x.b,self.a*x.b+self.b*x.a+self.B*self.b*x.b,self.A,self.B)
    __rmul__=__mul__
    def inverse(self):
        d=self.a*self.a+self.a*self.b*self.B-self.b*self.b*self.A
        assert d;return Q((self.a+self.b*self.B)/d,-self.b/d,self.A,self.B)
    def __truediv__(self,x): return self*self.lift(x).inverse()
    def __rtruediv__(self,x): return self.lift(x)*self.inverse()
    def __pow__(self,n):
        if n<0:return self.inverse()**(-n)
        z=self.lift(1)
        for _ in range(n):z=z*self
        return z
    def __eq__(self,x):
        x=self.lift(x);return self.a==x.a and self.b==x.b and self.A==x.A and self.B==x.B
    def __repr__(self):return f'({self.a})+({self.b})u'
u=Q(0,1)
i=Q(0,1,B=0)
eta=lambda a:{0:0,1:1,2:-1}[a%3]
chi4=lambda a:{0:0,1:1,2:0,3:-1}[a%4]
quartic=lambda a:{0:0,1:1,2:i,3:-i,4:-1}[a%5]
def lift(ch,M):return lambda a:ch(a) if gcd(a,M)==1 else 0
# Formal coefficients after cancellation of the vanishing constant term.
def series(D,ch,N=12):
    num=[sum(ch(a)*comb(a,k) for a in range(D) if a>=k) for k in range(N+2)]
    den=[-comb(D,k+1) if k+1<=D else 0 for k in range(N+1)]
    out=[]
    for k in range(N+1):out.append((num[k+1]-sum(den[j]*out[k-j] for j in range(1,k+1)))/F(den[0]))
    return out
f=series(3,eta)
check('alternating-Gauss-cubic',f[:4]==[F(1,3),0,F(-1,9),F(1,9)])
G=sum(eta(a)*u**a for a in range(3))
check('inverse-character-Gauss-orientation',G==1+2*u and G*G==-3)
for n in range(13):
    rhs=-G.inverse()*((-1)**n)*sum(eta(a)*(u**a)**n/(u**a-1)**(n+1) for a in [1,2])
    check('alternating-Gauss-all-coefficients',rhs==f[n])
check('wrong-Gauss-sign-rejected',-f[3]!=f[3])
check('wrong-psi-Gauss-factor-rejected',2*G!=2/G)
# Finite rational root sum; it needs no geometric-series convergence.
for y in [F(2),F(3),F(-2),F(1,2)]:
    check('finite-root-fraction-identity',sum(1/(y*u**a-1) for a in range(3))==3/(y**3-1))
# Exact Bernoulli polynomials with B1=-1/2.
B=[F(1)]
for m in range(1,14):B.append(-sum(F(comb(m+1,j))*B[j] for j in range(m))/F(m+1))
def bern(k,x):return sum(F(comb(k,j))*B[j]*x**(k-j) for j in range(k+1))
def ordinary(D,ch,k):return -F(D**k,k+1)*sum(ch(a)*bern(k+1,F(a,D)) for a in range(D))
def primitive_moment(D,ch,p,k):return (1-ch(p)*p**(k-1))*ordinary(D,ch,k-1)
check('trivial-wild-Euler-value',primitive_moment(3,eta,2,1)==F(2,3))
product=lambda a:eta(a)*chi4(a)
check('quadratic-wild-weight-two',primitive_moment(12,product,2,2)==-2)
check('quadratic-wild-weight-four',primitive_moment(12,product,2,4)==46)
# Moment conversion from Mahler coefficients via finite Stirling numbers.
S=[[0]*14 for _ in range(14)];S[0][0]=1
for n in range(1,14):
    for k in range(1,n+1):S[n][k]=S[n-1][k-1]+k*S[n-1][k]
for D,ch in [(3,eta),(4,chi4),(5,quartic)]:
    fs=series(D,ch)
    for k in range(13):check('formal-Bernoulli-moments',sum(S[k][j]*factorial(j)*fs[j] for j in range(k+1))==ordinary(D,ch,k))
# Native p-power residue formula, translation, refinement and psi orientation.
def cells(D,ch,p,n):
    M=p**n;return [-sum(ch(a+M*j)*j for j in range(D))/F(D) for a in range(M)]
for D,ch in [(3,eta),(4,chi4),(5,quartic)]:
    for p in [2,3,5]:
        if D%p==0:continue
        for n in range(4):
            M=p**n;c=cells(D,ch,p,n);cn=cells(D,ch,p,n+1)
            check('residue-mass',sum(c)==ordinary(D,ch,0))
            for a in range(M):
                check('residue-translation',c[a]-c[(a-D)%M]==sum(ch(b) for b in range(D) if b%M==a))
                check('finite-projection-refinement',c[a]==sum(cn[a+j*M] for j in range(p)))
                check('psi-eigenvalue',cn[p*a]==ch(p)*c[a])
check('quartic-psi-inverse-rejected',cells(5,quartic,2,1)[0]!=(-i)*sum(cells(5,quartic,2,1)))
# Prime and arbitrary-level finite-polynomial/moment formulas.
def poly(D,ch):return [ch(a) for a in range(D)]
for D,ch in [(3,eta),(4,chi4),(5,quartic)]:
    for q in [2,3,5,7]:
        N=q*D;cn=lift(ch,N);expected=[0]*N
        for a in range(D):
            for j in range(q):expected[a+j*D]+=ch(a)
            expected[q*a]-=ch(q)*ch(a)
        check('prime-level-finite-polynomial',poly(N,cn)==expected)
        for k in range(8):check('prime-level-ordinary-moments',ordinary(N,cn,k)==(1-ch(q)*q**k)*ordinary(D,ch,k))
    for N in [D,D*D,D*6,D*25,D*49]:
        primes=lambda m:{q for q in range(2,m+1) if m%q==0 and all(q%r for r in range(2,int(q**0.5)+1))}
        new=primes(N)-primes(D)
        for k in range(6):check('distinct-prime-level-moments',ordinary(N,lift(ch,N),k)==prod((1-ch(q)*q**k for q in new),start=1)*ordinary(D,ch,k))
check('principal-regularization-counterexample',series(3,lambda a:int(gcd(a,3)==1))[0]==-1 and series(9,lambda a:int(gcd(a,9)==1))[0]==-3)
# Exhaustive least inducing modulus by unit fibres.
def conductor(D,ch):
    for d in range(1,D+1):
        if D%d:continue
        fibres={};ok=True
        for a in range(D):
            if gcd(a,D)!=1:continue
            if a%d in fibres and fibres[a%d]!=ch(a):ok=False;break
            fibres[a%d]=ch(a)
        if ok:return d
check('coprime-product-conductor',conductor(12,product)==12)
check('zero-level-conductor',conductor(3,eta)==3)
check('overlap-conductor-counterexample',conductor(3,lambda a:eta(a)**2)==1)
check('principal-inflation-Euler-counterexample',conductor(6,lift(eta,6))==3 and lift(eta,6)(2)==0 and eta(2)==-1)
# The signed atom model tests pullbacks and inverse scalars only, not arithmetic zeta mass.
for q in [3,5,7]:
    atoms={1:F(2),-1:F(-3),5:F(1)};e=-1
    push={q*x:v for x,v in atoms.items()};corrected=Counter(atoms)
    for x,v in push.items():corrected[x]-=F(e,q)*v
    for k in range(6):check('atomic-inverse-weight-transport',sum(v*x**k for x,v in corrected.items())==(1-F(e,q)*q**k)*sum(v*x**k for x,v in atoms.items()))
for k in range(8):check('even-moments-insufficient',1**(2*k)-(-1)**(2*k)==0)
check('odd-moment-distinguishes-atoms',1-(-1)==2)
# Rational coordinate integrality, never a claimed characterization of extension O.
def v(x,p):
    if not x:return 1000
    a,b=x.numerator,x.denominator;r=0
    while a%p==0:a//=p;r+=1
    while b%p==0:b//=p;r-=1
    return r
for p in [2,5,7]:
    for x in f:check('rational-tame-coefficient-integrality',v(x,p)>=0)
for x in [F(1,3),F(-1,9),F(1,9)]:check('missing-tame-hypothesis-rejected',v(x,3)<0)
result={'exactAssertions':sum(counts.values()),'groups':dict(counts),'values':{'quadraticGauss':str(G),'quadraticSeriesFirstFour':[str(x) for x in f[:4]],'primitiveFirst':'2/3','productWeightTwo':'-2','productWeightFour':'46'},'limits':'Exact finite and formal-coefficient controls only. No Lean elaboration, analytic convergence, all-continuous-test equality, local-field Gauss norm certification or arithmetic zeta mass computation.'}
Path(__file__).with_name('controls84.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps(result,indent=2))
```

## Baseline and compilation

Mathlib pin: `082e2d37e8b0463410cdb532e111cd43d5a66174`. Tau Ceti pin: `f790474821cf4256814db967cb154e7af3d0c369`. The declaration index SHA256 is `86649a7d5f35d1178a45fe7aa4713741d03d43ff3b37bb8c91a1da1c794c8ce1`. The 326 declarations span 126 actual source modules. Their actual statement and ambient hypotheses were read, including a separately repaired preceding-variable block in `IteratedDeriv/Lemmas.lean`. Whole-module proof reading is not claimed.

No Lean compilation was attempted. The existing build uses Tau Ceti `cf386627e9176a3827c1a5fe804989fd94a4d216`, which differs from the required pin; its Mathlib matches the pin. Its toolchain is `leanprover/lean4:v4.34.0-rc2`. It lacks the required suggested PMIA/L0/L1 imports, and the L1 suggested source is absent from the worker repository too. No build setup, dependency build, harness, cache acquisition or Lean language server was used. Earlier compilation claims in the packet are their authors’ historical evidence, not this review’s result. Errors and warnings for this review’s Lean run are unavailable because there was no run.

## Atlas replay and handoff

A read-only `build.assemble(require_distances=False)` replay retained every existing promoted supplier and overlaid the corrected L2 packet in memory; no L2 promoted packet was present before the overlay. The atlas changes from 3341 stages and 9208 edges to 3347 stages and 9212 edges. It lists all 252 L2 declarations, adds the six intended planets and four internal planet edges, skips no link and creates no cycle. The 51 existing orphan endpoints remain unchanged; none is introduced. No atlas, promotion, status, label or upstream file was written.

The four added edges are:

- `DirichletPadicLFunctions:L2/tame-measure` → `DirichletPadicLFunctions:L2/tame-integral-measure`.
- `DirichletPadicLFunctions:L2/tame-measure` → `DirichletPadicLFunctions:L2/tame-psi`.
- `DirichletPadicLFunctions:L2/tame-measure` → `DirichletPadicLFunctions:L2/tame-unit-moments`.
- `DirichletPadicLFunctions:L2/tame-psi` → `DirichletPadicLFunctions:L2/tame-unit-moments`.

The existing L2 layer supplies these eleven foreign consumer stages in the assembled graph; this verifies the graph links only, not the entire foreign consumer packets:

- `AutomorphicCongruences:L5`.
- `AutomorphicCongruences:L5w`.
- `AutomorphicPadicLFunctions:KU-hilberteisenstein`.
- `AutomorphicPadicLFunctions:L0`.
- `AutomorphicPadicLFunctions:L3`.
- `AutomorphicPadicLFunctions:L3h`.
- `AutomorphicPadicLFunctions:L4`.
- `IntegralIwasawaTheory:I.3`.
- `IntegralIwasawaTheory:I.5`.
- `IntegralIwasawaTheory:I.6`.
- `PadicFamilies:L5`.

Orchestrator handoff: the reader document is outside this issue’s three deliverable paths. Reconcile its four numerical twist tests with the explicit Q_2/Q_3 fields; spell out the native integer-ring field-comparison hypotheses and the full primitive interpolation contexts; remove the stale statements that the formal coefficient/moment adapters and product interpolation are still open requests. Carry the confirmed source corrections, especially E34 root order and E35 the finite rational identity, into the reader’s proof commentary. Keep the two PMIA requests open with their exact generic coefficient scope. No additional node, source formula, target or planet is requested. This handoff is embedded here because a fourth repository path would violate the issue’s allowlist.

## Individual node ledger

Each entry below records an actual full node reading, source comparison, direct-dependency assessment and typed-example assessment. The baseline, supplier and test ledgers below identify the concrete supporting declarations and examples. “Verified” is a planning-review verdict, never an implementation status.

### 1. DirichletPadicLFunctions:L2/prime-power-character

**Verified** · construction · Continuous p-power Dirichlet character. Native ContinuousMap composition preserves the actual character at p-power level; modulus1 gives constant1, positive-level principal characters give the unit indicator. Existing weighting/support carrier is imported, not duplicated. Final review resolves the indicated supplier and pin checks against the retained individual ledgers.

### 2. DirichletPadicLFunctions:L2/prime-power-character-support

**Verified** · lemma · Vanishing of character lifts off the units. For positive n the residue ring is nontrivial and reduction is a surjective local hom; nonunits reduce to nonunits and character support vanishes. The modulus1 case is excluded explicitly. Final review resolves the indicated pinned local-hom check.

### 3. DirichletPadicLFunctions:L2/prime-power-character-level

**Verified** · comparison · Independence of a positive p-power level. Positive-level change agrees on units by native cast compatibility and on nonunits by support vanishing. The excluded n0 counterexample prevents a false global equality.

### 4. DirichletPadicLFunctions:L2/twisted-smoothed-measure

**Corrected** · construction · Dirichlet-character twist of the smoothed measure. Actual arithmetic twist is imported weighting of the canonical coefficient extension. Smoothing1 gives zero and modulus1 retains the ambient measure rather than its unit projection. Numeric first-moment distinctions must specify the typed Q_3/Q_2 fields; coefficient specializations can collapse them. Numeric test fields now explicitly match the typed Q_2/Q_3 examples.

### 5. DirichletPadicLFunctions:L2/twisted-smoothed-support

**Verified** · lemma · Unit support of the actual character twist. The actual unit projector equals multiplication by its indicator; pointwise e*w=w plus measure extensionality proves the support equality. Only positive levels have this property.

### 6. DirichletPadicLFunctions:L2/twisted-smoothed-principal

**Verified** · comparison · The principal twist is the unit projection. Principal positive-level lift equals the native unit indicator, and canonical coefficient extension commutes with the original unit projector. Its first-moment difference from level0 is a Q_3 comparison.

### 7. DirichletPadicLFunctions:L2/twisted-smoothed-level

**Verified** · comparison · Positive-level compatibility of arithmetic twists. Exact positive-level lift equality substitutes directly into the same imported weight. This is level independence, not invariance of the primitive Euler-factor calculation under arbitrary imprimitive extension.

### 8. DirichletPadicLFunctions:L2/twisted-smoothed-product

**Verified** · lemma · Successive character twists of the arithmetic measure. Native successive weighting plus the pointwise character-product identity proves the original product equality. The field-only inverse test gives the unit projection rather than the ambient smoothed measure.

### 9. DirichletPadicLFunctions:L2/tame-numerator

**Verified** · construction · Finite numerator for a tame character. Finite numerator is the negative character-weighted sum of existing q_a. Actual ZMod representatives and polynomial degrees retain modulus1=zero; no chosen root, Gauss inverse or generalized Bernoulli carrier is introduced.

### 10. DirichletPadicLFunctions:L2/tame-numerator-cancellation

**Verified** · lemma · Cancellation of the character pole. Existing T*q_a identity and the native nonprincipal-character sum-zero theorem cancel the constant term over a domain. The principal example prevents dropping eta!=1.

### 11. DirichletPadicLFunctions:L2/tame-series

**Verified** · construction · The tame unit-denominator series. Actual unit inverse at constant coefficient D gives q_D*F=Q. The antidiagonal coefficient recurrence includes n0, all signs and the unique solution; the wild field constructor is distinct from an integral bound.

### 12. DirichletPadicLFunctions:L2/tame-generating-equation

**Verified** · comparison · Finite Dirichlet generating equation. The formal identity Y^D-1=T*q_D and the cancelled numerator give the finite periodic generating equation with two cancelling minus signs. No divergent Y-adic geometric expansion at T0 is used.

### 13. DirichletPadicLFunctions:L2/tame-coefficient-bound

**Verified** · lemma · Integral bound for tame coefficients. Integral q_D inverse maps into K and every mapped coefficient is bounded by1. Finite scalar character sums then use native ultrametric sum bounds. Completeness enters the later measure construction; primitive/nonprincipal hypotheses are not needed for this bound.

### 14. DirichletPadicLFunctions:L2/tame-coefficient-sequence

**Verified** · construction · Bounded tame coefficient sequence. Native bounded continuous function on discrete naturals packages the actual coefficient sequence; it is not an unrestricted power-series inverse transform. Supremum bound follows from actual pointwise bound.

### 15. DirichletPadicLFunctions:L2/tame-measure

**Verified** · construction · Measure of the finite tame kernel. The exact imported bounded inverse transform yields the native K-valued measure with the specified Amice coefficients. Its mass and second moment agree with the quadratic tame controls; source Gauss normalization and integer-ring transport remain separate comparisons.

### 16. DirichletPadicLFunctions:L2/tame-measure-norm

**Verified** · lemma · Norm bound for the tame kernel measure. Supremum bound transfers through the exact native bounded-inverse norm identity over a nontrivially normed field; no topology or norm is invented on an integral completed group ring.

### 17. DirichletPadicLFunctions:L2/tame-measure-unique

**Verified** · comparison · Characterization by the arithmetic denominator. A unit arithmetic denominator fixes the Amice series uniquely; the imported bounded-inverse uniqueness then identifies the original actual measure. Gauss agreement is not assumed.

### 18. DirichletPadicLFunctions:L2/tame-gauss-generating

**Verified** · lemma · Finite Gauss denominator equation. Native primitive-character Fourier identity at all frequencies, including nonunits, supplies finite denominator clearing. Nonzero Gauss and actual root assumptions are retained; the characteristic/composite-modulus Gauss-product overclaim is avoided.

### 19. DirichletPadicLFunctions:L2/tame-gauss-series

**Verified** · theorem · Gauss formula for the tame series. Both finite generating identities have the same nonzero multiplier -T*q_D. Domain cancellation gives equality with the root-free series, retaining D invertible and Gauss nonzero. Root choices affect individual Gauss data but cancel in this normalized expression.

### 20. DirichletPadicLFunctions:L2/tame-gauss-coefficients

**Verified** · lemma · Alternating Gauss coefficient formula. Native unit-denominator inverse coefficients and rescaling give the exact alternating sign. Nonunit character weights are zero before any totalized inverse cancellation; alpha1 inverse0 is not Laurent1/T.

### 21. DirichletPadicLFunctions:L2/tame-gauss-measure

**Verified** · comparison · Gauss transform of the tame measure. Existing Amice identity composed with the conditional finite Gauss comparison gives the same actual K-valued measure; integral-ring lift and special values are separate consumers.

### 22. DirichletPadicLFunctions:L2/tame-integral-series

**Verified** · construction · The integral tame series. Actual bounded coefficients are bundled in the native integer subring of the norm valuation, with inclusion preserving the original series. No arbitrary valuation is identified with the norm.

### 23. DirichletPadicLFunctions:L2/tame-integral-test-bound

**Verified** · lemma · Integral test bound for the tame measure. All O-valued continuous tests have supremum norm at most1 and the native inclusion is isometric. The stronger homogeneous operator bound by norm(f), rather than only by1, supplies continuity.

### 24. DirichletPadicLFunctions:L2/tame-integral-measure

**Verified** · construction · The integral tame measure. Restriction of the same actual K-valued functional to integral-valued tests is O-linear and has a homogeneous continuity estimate. The native O-linear measure constructor does not require O to be a field or a prechosen Z_p action.

### 25. DirichletPadicLFunctions:L2/tame-integral-amice

**Verified** · comparison · Integral Amice coefficient transport. Actual integral Mahler tests compare under an explicitly compatible scalar tower. Factoring the bounded Z_p embedding through the norm integer subring supplies the canonical action; arbitrary incompatible actions are not identified.

### 26. DirichletPadicLFunctions:L2/tame-integral-measure-unique

**Verified** · lemma · Uniqueness on integral-valued tests. Injectivity of the native subtype inclusion compares all actual integral-valued tests and yields measure equality. No density theorem or generic field-coefficient extension is assumed.

### 27. DirichletPadicLFunctions:L2/tame-translation

**Verified** · lemma · Translation equation for the tame measure. Specific Mahler translation identity follows from finite Vandermonde at dense natural points, then native Amice injectivity turns the finite generating equation into the actual measure translation.

### 28. DirichletPadicLFunctions:L2/tame-residue-coefficients

**Verified** · lemma · Exact finite tame residue masses. Canonical representative finite weighted sums solve the translation recurrence and total-mass equation. Characteristic zero is explicit because the constant ambiguity is removed by cancelling p^n; the characteristic-three non-example detects omission.

### 29. DirichletPadicLFunctions:L2/tame-psi

**Verified** · theorem · The tame psi eigenrelation. Exact residue coefficients give the eta(p) eigenvalue, and explicit uniform approximations by p-power reductions pass to Mahler tests. No unjustified all-finite-map cofinality is assumed. Native source/pinned approximation details remain to check. Final supplier and baseline reading verifies the complete reduction-continuity, kernel, representative estimate, compact-uniform-continuity, pairing and Amice route.

### 30. DirichletPadicLFunctions:L2/tame-integral-psi

**Verified** · comparison · Integral tame psi comparison. Actual integral scalar eta(p) is in the native integer subring; all integral-valued tests transport the already obtained field-valued psi identity through the injective inclusion.

### 31. DirichletPadicLFunctions:L2/tame-unit-restriction

**Verified** · theorem · Tame restriction to units. The existing identity E=id-phi*psi and linearity give the same ambient unit projection with eta(p) scalar. A separate unit carrier is not silently introduced.

### 32. DirichletPadicLFunctions:L2/tame-unit-moments

**Verified** · theorem · Euler factor for ordinary tame moments. Native phi evaluates monomials at p*x, giving exponent k in the ordinary-moment Euler factor. The degree-two quadratic dyadic factor5 preserves the original -2/9 moment and yields -10/9.

### 33. DirichletPadicLFunctions:L2/tame-bernoulli-generating

**Corrected** · lemma · Finite Bernoulli generating identity. Native rational Bernoulli generating function rescaled at D and character-weighted finite sum give the exact formal equation. Nonprincipality cancels the constant term, and nonzero D/X are cancelled without inverting exp(DX)-1. Corrected the obsolete ordinary-moment supplier-request description. Corrected stale source-match commentary: already supplied formal-series and moment adapters are no longer described as open requests.

### 34. DirichletPadicLFunctions:L2/tame-exponential-coefficients

**Verified** · lemma · Exponential coefficients of the tame kernel. Zero-constant exponential substitution is native and legal. The finite generating identities have common nonzero factor with linear coefficient -D, whose cancellation yields the factorial-divided coefficient formula.

### 35. DirichletPadicLFunctions:L2/tame-formal-moments

**Verified** · theorem · Formal ordinary tame moments. The owned Mahler/exponential coefficient theorem multiplies by k!, leaving denominator k+1 rather than (k+1)!. Concrete quadratic fourth moment2/3 differs from its exponential coefficient1/36.

### 36. DirichletPadicLFunctions:L2/tame-algebraic-value-map

**Verified** · comparison · Coefficient transport of tame arithmetic values. Common Bernoulli elements transport through characteristic-zero field maps fixing rational scalars; no map from C to the p-adic field or topological embedding is assumed. Historical scratch checks are not replayed in this review.

### 37. DirichletPadicLFunctions:L2/tame-complex-special-values

**Verified** · theorem · Complex tame special values. Complex special-value comparison separates positive k and the k=0 endpoint using the owned QSeries/Hurwitz suppliers. The argument uses representatives in (0,1], with eta(D)=0 for primitive D>1; it does not apply a negative Hurwitz formula at zero. Quartic eta(2)=i fixes the Gauss and conjugation orientation.

### 38. DirichletPadicLFunctions:L2/tame-ordinary-moments

**Verified** · theorem · Bernoulli moments of the actual tame measure. The actual PMIA algebra-ordinary-moment supplier applies to the same measure and Amice identity. Independent Q- and Z_p-algebra structures suffice; no map from Q to Z_p is used. Supplier existence and precise hypotheses remain to be checked in the supplier pass.

### 39. DirichletPadicLFunctions:L2/tame-special-value-comparison

**Verified** · comparison · Common algebraic tame special value. The common Bernoulli element in E has separate embeddings into C and K. Field-map injectivity preserves nonprincipality and the two evaluations; it neither identifies C with K nor conjugates eta.

### 40. DirichletPadicLFunctions:L2/tame-unit-special-value-comparison

**Verified** · comparison · Common algebraic unit special value. Unit projection has Euler factor 1-eta(p)*p^k on the common ordinary moment. The inverse-weight construction later shifts the exponent; it cannot be substituted here. The quadratic dyadic fourth moment example has value 34/3.

### 41. DirichletPadicLFunctions:L2/tame-zeta-measure

**Corrected** · construction · The tame zeta measure. The same ambient K-valued continuous dual carries zeta_eta = weight(zero-extended Z_p inverse)(E mu_eta). Its weight vanishes on nonunits and is continuous by the owned supplier. Principal constructors remain permitted but value comparisons require the later nonprincipal assumptions. The dyadic quadratic first moment differs from the first ordinary projected moment. Corrected obsolete prose that omitted the now planned conductor-product moments. Corrected stale source-match commentary: already supplied formal-series and moment adapters are no longer described as open requests.

### 42. DirichletPadicLFunctions:L2/tame-zeta-support

**Verified** · lemma · Unit support of the tame zeta measure. The unit indicator is idempotent, so E zeta_eta=zeta_eta; the precise unit-support/psi supplier then gives psi zeta_eta=0. This is support expressed by continuous tests, not MeasureTheory.support, and needs no extra characteristic-zero assumption.

### 43. DirichletPadicLFunctions:L2/tame-zeta-weight

**Verified** · theorem · Multiplication by x recovers the unit measure. Multiplication by the coordinate recovers the projected measure because native inversion cancels only on Z_p units; no division by a nonunit is used.

### 44. DirichletPadicLFunctions:L2/tame-zeta-moment-shift

**Verified** · lemma · Positive moments of the tame zeta measure. Weight evaluation shifts positive moments, including the first moment to projected mass; it says nothing about the zero-th zeta moment.

### 45. DirichletPadicLFunctions:L2/tame-zeta-norm

**Verified** · theorem · Boundedness of the tame zeta measure. Bounded Z_p scalar action sends every Z_p integer to norm at most one. All-test weight and measure bounds give norm at most one without a factor 1/|p| or an isometry assumption on the algebra map.

### 46. DirichletPadicLFunctions:L2/tame-zeta-common-special-value

**Verified** · comparison · Shifted algebraic tame special values. Degree k-1 in the previous common-element comparison gives the displayed Euler exponent, Bernoulli index and L argument for k>=1. No value at L(eta,1) follows.

### 47. DirichletPadicLFunctions:L2/tame-integral-zeta-measure

**Verified** · construction · The integral tame zeta measure. The inverse weight is bundled directly in the fixed native norm-valuation integer ring using the bounded scalar action and continuity. This constructs an actual O-valued continuous dual without requiring a separately chosen Z_p action or a field operator norm on O.

### 48. DirichletPadicLFunctions:L2/tame-integral-zeta-inclusion

**Verified** · comparison · Inclusion of integral tame zeta values. Expansion of both actual evaluations and multiplicative inclusion proves the comparison for all continuous O-tests. Native subring value and sup norms give the bound.

### 49. DirichletPadicLFunctions:L2/tame-integral-zeta-support

**Verified** · lemma · Unit support of integral tame zeta. A second unit indicator is idempotent, and the exact psi/support supplier gives psi_O zeta_O=0. No division or coefficient-characteristic restriction is needed.

### 50. DirichletPadicLFunctions:L2/tame-integral-zeta-unique

**Verified** · theorem · Uniqueness of the integral tame zeta realization. Subtype inclusion is injective and the assumed comparison is for all O-tests; native continuous-dual extensionality gives uniqueness without scalar extension or moment separation.

### 51. DirichletPadicLFunctions:L2/tame-zeta-value-integral

**Verified** · theorem · Integrality of positive tame zeta values. The coordinate has a canonical continuous O-valued lift by bounded scalar action. Shifted moments identify its actual integral-measure value with the displayed K-valued Euler-Bernoulli scalar; k may be divisible by p since division occurs only in K.

### 52. DirichletPadicLFunctions:L2/tame-integral-zeta-amice

**Verified** · comparison · The Amice comparison for integral tame zeta. Coefficientwise inclusion of Amice transforms uses the explicitly compatible O action and scalar tower. No injectivity or inverse transform over O is asserted.

### 53. DirichletPadicLFunctions:L2/twisted-tame-measure

**Verified** · construction · Character twists of the actual tame measure. The twist is weighting the existing actual measure. Modulus one, level zero and positive principal character cases are separate; native finite-character norm bounds give all-test boundedness.

### 54. DirichletPadicLFunctions:L2/twisted-tame-psi

**Verified** · lemma · Psi and unit restriction for tame twists. At positive p-power levels, support gives psi=0 and theta(p)=0 at the product level, including principal chi. Level zero uses the tame psi theorem with its nonprincipal and characteristic-zero hypotheses.

### 55. DirichletPadicLFunctions:L2/twisted-tame-translation

**Verified** · lemma · Finite translation equation for a tame twist. A finite telescope through M translates, canonical representatives b+D*t, periodicity of the weight and native changeLevel on units give the exact product-level translation equation. Nonunits require a separate zero-factor argument.

### 56. DirichletPadicLFunctions:L2/twisted-tame-amice

**Verified** · comparison · The product-level Amice series of a tame twist. Coprime factor-through-gcd theory keeps theta nonprincipal. The translation equation gives the same formal generating equation; its factor has nonzero linear term -N and is cancelled in K[[T]], not inverted. A wild product-level coefficient bound is not imported from the tame theorem.

### 57. DirichletPadicLFunctions:L2/twisted-tame-moments

**Verified** · theorem · Bernoulli moments of the actual tame twist. The finite Bernoulli difference identity, evaluated on actual continuous K-tests, directly converts the translation equation to ordinary moments. Denominators N and k+1 are inverted in K only, with correct negative sign; no primitivity or Amice moment supplier is needed for this route.

### 58. DirichletPadicLFunctions:L2/tame-zeta-character-shift

**Verified** · lemma · Character moments of the tame zeta measure. The existing weight identity on character-times-power tests gives the positive-degree shift. At positive level support removes the projector; level zero retains the Euler factor. Degree-zero character integrals are not identified.

### 59. DirichletPadicLFunctions:L2/tame-zeta-character-common-value

**Verified** · comparison · Common algebraic character-twisted special values. The complex and p-adic images of the same finite E-valued Bernoulli element use the displayed product-level theta and separate embeddings. Positive-level theta(p)=0 and its L-function already removes the p Euler factor; replacing theta by primitiveCharacter requires a separate comparison.

### 60. DirichletPadicLFunctions:L2/integral-tame-character-measure

**Verified** · construction · Integral character twists of tame zeta. Native character norm bounds lift the multiplier into the fixed O. Weighting the actual integral zeta measure gives every advertised constructor/support/bound law. Its existing unit support permits level raising even from zero and permits principal twists at all levels to agree without asserting global equality of the lifted functions.

### 61. DirichletPadicLFunctions:L2/integral-tame-character-inclusion

**Verified** · comparison · Inclusion of integral character values. All-test integral inclusion follows from multiplication-preserving subtype inclusion, with no arbitrary extension of coefficients. Degree-zero mass remains an unidentified arithmetic value.

### 62. DirichletPadicLFunctions:L2/integral-tame-character-inverse

**Verified** · theorem · Cancellation of an inverse character on tame zeta. Inverse native character weighting cancels on units; unit support suffices to recover zeta_O at every level. Positive-level products remain zero off units, so the proof does not imply cancellation for arbitrary ambient measures.

### 63. DirichletPadicLFunctions:L2/tame-character-value-integral

**Verified** · theorem · Integrality of character-twisted tame values. Coordinate lifts and actual all-test comparison identify the displayed field-valued Bernoulli expression with an O-valued measure evaluation at k>=1. The argument permits imprimitive characters and p dividing the weight, using no rational action on O.

### 64. DirichletPadicLFunctions:L2/integral-tame-character-amice

**Verified** · comparison · Amice compatibility for integral character twists. The mapped Amice comparison uses the actual character-weighted K-measure and every native Mahler coefficient, with explicitly compatible O action/tower. No inverse transform over O is assumed.

### 65. DirichletPadicLFunctions:L2/tame-character-finite-values

**Verified** · lemma · Finite linear combinations of tame character values. Finite K-linear evaluation gives the exact sum of individually displayed product-level Bernoulli values; different character levels need not be unified.

### 66. DirichletPadicLFunctions:L2/tame-character-kummer

**Verified** · theorem · Finite character congruences for tame values. The uniform hypothesis is on all p-adic units. Unit projection extends the bound to a genuine continuous test, and the all-test measure bound yields the finite-value inequality. Actual |p| is retained; neither sampled residues nor an unproved norm/ideal identification replaces the hypothesis.

### 67. DirichletPadicLFunctions:L2/tame-atoms-reflection

**Verified** · lemma · Reflection of the finite tame source. Nonprincipality rules out modulus one and removes the zero residue. Negation of each other canonical representative is D-a.val, so the finite atomic reindexing is exact; the sum reindexing name is generated by the cited to_additive declaration.

### 68. DirichletPadicLFunctions:L2/tame-measure-reflection

**Verified** · theorem · Reflection parity of the tame kernel measure. Reflection of the translation equation gives a translation-fixed difference. The explicit unit constant of q_D and nonzero T make the formal factor nonzero; domain cancellation and native Amice injectivity prove reflection without monomial moment density or division by two.

### 69. DirichletPadicLFunctions:L2/tame-zeta-reflection

**Verified** · theorem · Reflection parity of the tame zeta measure. The existing unit projector commutes with negation. Native zero-extended integer inversion is odd on units and vanishes off units, contributing the second negative sign to the zeta reflection formula.

### 70. DirichletPadicLFunctions:L2/tame-character-zeta-reflection

**Verified** · lemma · Reflection of a character-weighted tame zeta measure. The native reduced character has parity chi(-1), including modulus one. Weight projection under the involution combines it with eta(-1), without primitive-conductor or Gauss assumptions.

### 71. DirichletPadicLFunctions:L2/integral-tame-character-reflection

**Verified** · comparison · Integral reflection of tame character values. Norm bounds put both parity factors in the fixed O. All-test inclusion of reflected evaluations reduces the integral identity to its K-valued counterpart; subtype injectivity suffices without an integral half-projector.

### 72. DirichletPadicLFunctions:L2/tame-character-parity-test

**Verified** · theorem · Vanishing of tests with incompatible reflection parity. The explicit inequality epsilon!=c permits field cancellation of (epsilon-c)*value. Integral vanishing follows by inclusion. Only the ±1 odd-mass corollary needs characteristic zero; even-character degree-zero values remain unidentified.

### 73. DirichletPadicLFunctions:L2/tame-character-value-parity

**Verified** · theorem · Parity vanishing of the Euler–Bernoulli values. The coordinate power has parity (-1)^k. The positive-degree Bernoulli comparison yields scalar and integral-test vanishing for mismatched parity; matching parity alone does not prove nonzero values.

### 74. DirichletPadicLFunctions:L2/tame-complex-kernel

**Verified** · construction · The smooth complex tame kernel. The total real divided-difference constructor removes the origin singularity before complex inclusion. Its positive exponential orientation and subtracted constants permit principal constructors but prohibit the unsmoothed principal L-comparison. The quartic origin fixes character rather than inverse orientation.

### 75. DirichletPadicLFunctions:L2/tame-complex-regularity

**Verified** · theorem · Regularity across the tame removable point. Real local power series for the divided difference at zero, quotient analyticity away from zero and the supplied real beta regularity give global real analyticity. No entire complex t-variable function is asserted.

### 76. DirichletPadicLFunctions:L2/tame-complex-origin-derivatives

**Verified** · theorem · Tame kernel derivatives and Bernoulli values. Differentiating the finite identity k+1 times leaves D*(k+1)*f^(k)(0). Zero character sum supplies the missing Bernoulli term, yielding the unsigned derivative value; the later Mellin evaluation contributes (-1)^k. Unique differentiability handles the endpoint within [0,infinity).

### 77. DirichletPadicLFunctions:L2/tame-complex-positive-series

**Verified** · lemma · The decaying tame exponential expansion. Absolute geometric summability justifies finite residue-class reindexing. Negating nonzero canonical representatives introduces exactly one factor -eta(-1), including the even-character negative kernel. Principal characters fail the unsmoothed expansion as shown by the log2 control.

### 78. DirichletPadicLFunctions:L2/tame-complex-positive-derivatives

**Verified** · theorem · Termwise derivatives of the tame exponential series. The induction supplies a summable uniform derivative majorant on (t/2,infinity), convergence at t and equality on that interval. The exact native differentiation theorem is applicable; convergence of the original series alone would not be sufficient.

### 79. DirichletPadicLFunctions:L2/tame-complex-derivative-decay

**Verified** · theorem · Exponential bounds for every tame kernel derivative. For each fixed order and positive cutoff the explicit weighted exponential bound yields order-dependent constants with rate one. Smoothness and unique derivatives make ordinary/within derivatives eventually equal; this is an archimedean statement.

### 80. DirichletPadicLFunctions:L2/tame-complex-mellin-convergent

**Verified** · lemma · Convergence of the tame Mellin integral. Smoothness gives local integrability and a bounded small-t estimate; the native exponential Mellin theorem gives exactly Re(s)>0, independently of the later absolute series half-plane.

### 81. DirichletPadicLFunctions:L2/tame-complex-mellin-gamma-l

**Verified** · comparison · The tame Mellin integral and the native L-series. The native hasSum_mellin theorem supplies a justified interchange for positive natural frequencies and the summable Re(s)>1 coefficient majorant. The character zero term vanishes, and the exact native LFunction/LSeries comparison is used only in its half-plane.

### 82. DirichletPadicLFunctions:L2/tame-complex-mellin-entire

**Verified** · theorem · Entire continuation of the tame Mellin transform. The supplied L0 continuation applies to the actual smooth half-line kernel and every separately bounded derivative with positive decay rate. Entireness is in the Mellin variable only.

### 83. DirichletPadicLFunctions:L2/tame-complex-mellin-comparison

**Verified** · comparison · Global tame Mellin comparison. Gamma cancellation is justified in Re(s)>1; both functions are then entire under nonprincipality and agree near 2. The native whole-plane preconnected analytic identity principle gives the global comparison, including s=1.

### 84. DirichletPadicLFunctions:L2/tame-complex-mellin-values

**Verified** · theorem · Negative integral values of the tame Mellin continuation. The supplied negative-value theorem gives (-1)^k times the unsigned kernel derivative. The independent global factor -eta(-1) agrees by parity vanishing; the even-character k=1 control has the required extra minus sign.

### 85. DirichletPadicLFunctions:L2/complex-gauss-denominator

**Verified** · lemma · Nonvanishing of the real-axis Gauss denominators. Primitive roots have complex absolute norm one. A real exp(t) multiple can equal one only at t=0, where nonzero representatives contradict primitive-root nontriviality. The zero residue is explicitly excluded.

### 86. DirichletPadicLFunctions:L2/complex-gauss-regularity

**Verified** · theorem · Regularity of the weighted Gauss expression. The zero-residue weighted term is identically zero under totalized division; every other denominator is nonzero on the real line. Finite analytic division proves regularity even when the totalized Gauss normalizer is zero.

### 87. DirichletPadicLFunctions:L2/complex-gauss-generating

**Verified** · lemma · The finite scalar Gauss equation. The exact all-residue primitive Gauss inversion and finite geometric identity produce the scalar generating equation. Zero weights are removed before denominator cancellation, and nonzero G is explicit; no finite-field nonvanishing is used for composite modulus.

### 88. DirichletPadicLFunctions:L2/complex-gauss-kernel-comparison

**Verified** · comparison · The actual complex Gauss kernel comparison. Away from zero finite scalar cancellation gives equality; continuity gives equality at the origin. Both root choices must recompute their Gauss normalizers for independence. The actual Mellin comparison follows from equality of functions.

### 89. DirichletPadicLFunctions:L2/complex-tame-formal-derivatives

**Verified** · comparison · The formal and analytic tame derivative comparison. The analytic jet and iterated formal Mahler constant equal the same finite Bernoulli sum. The exponential coefficient divides the derivative by k!, without evaluating arbitrary formal series at exp(t)-1.

### 90. DirichletPadicLFunctions:L2/prime-power-character-gauss

**Verified** · lemma · Finite Gauss expansion of the prime-power lift. The exact native primitive Gauss identity holds at all reduced residues, including nonunits; multiplying by the explicitly nonzero inverse gives the pointwise character lift. No units-only replacement is allowed.

### 91. DirichletPadicLFunctions:L2/smoothed-additive-twist

**Verified** · construction · Additive-character weights of the smoothing measure. Additive weighting acts on the exact supplied extension of the integral smoothing measure. Continuity comes from the discrete finite quotient, and boundary values at zero index, trivial additive character and a=1 are separate from positive-level Gauss hypotheses. The dyadic sign first moment detects loss of the weight.

### 92. DirichletPadicLFunctions:L2/twisted-smoothed-gauss

**Verified** · lemma · Gauss decomposition of the arithmetic twist. Pointwise finite Gauss expansion and actual K-linear all-test evaluation give equality of measures, not merely masses or coefficients. The a=1 zero boundary involves no smoothing denominator.

### 93. DirichletPadicLFunctions:L2/twisted-smoothed-gauss-amice

**Verified** · comparison · Amice series of the finite Gauss decomposition. Native bundled Amice linearity transports the finite measure equality to transforms and individual Mahler coefficients; coefficient2 is not the second ordinary moment.

### 94. DirichletPadicLFunctions:L2/smoothed-translation-sum

**Verified** · lemma · A finite translation identity for the smoothing measure. Finite Mahler translation and the exact smoothed-extension series identity give Q_a(Y)*A=B_a(Y). Native Amice injectivity transfers this to the finite translation/atom identity on actual measures.

### 95. DirichletPadicLFunctions:L2/smoothed-additive-translation

**Verified** · lemma · The additive-weighted finite translation identity. Additive character covariance beta(x+i)=epsilon^i beta(x) and the exact weight/pushforward supplier produce the weighted translation equation. Atomic coefficients carry epsilon^j, matching the dyadic 2*delta0-delta1 control.

### 96. DirichletPadicLFunctions:L2/smoothed-additive-amice-cancellation

**Verified** · lemma · Polynomial cancellation for the additive Amice series. Native Amice linearity and the finite translation calculation yield ordinary polynomial multiplication Q_a(epsilon*Y)*A=B_a(epsilon*Y), without substituting a nonzero constant into an infinite series. The dyadic denominator/numerator signs are correct.

### 97. DirichletPadicLFunctions:L2/smoothed-additive-denominator

**Verified** · lemma · Nonvanishing of the additive smoothing denominator. For epsilon=1 the smoothing parameter is a mapped native unit; otherwise vanishing of the finite sum makes epsilon^a=1. Its order also divides p^n, so coprimality forces epsilon=1, a contradiction. This proves the smoothing denominator, not the Gauss denominator.

### 98. DirichletPadicLFunctions:L2/smoothed-additive-rational

**Verified** · comparison · The rational Amice series of an additive twist. The finite smoothing denominator has a nonzero constant coefficient, exactly matching the native inverse equivalence. Identity roots use the pole-cancelled polynomial quotient; dyadic coefficients distinguish Mahler coefficient2 from ordinary moment2.

### 99. DirichletPadicLFunctions:L2/twisted-smoothed-gauss-rational

**Verified** · comparison · Rational Gauss expression for the arithmetic twist. Replacing each actual additive transform in the finite Gauss sum gives the normalized rational expression. Smoothing denominators are proved; Gauss nonvanishing remains an independent explicit hypothesis.

### 100. DirichletPadicLFunctions:L2/smoothed-additive-root-power

**Verified** · lemma · Nonidentity after a valid smoothing power. The proved finite smoothing sum times epsilon-1 equals epsilon^a-1, so nonidentity survives an admissible smoothing power. The excluded even dyadic parameter explains the necessity of coprimality.

### 101. DirichletPadicLFunctions:L2/smoothed-additive-fractions

**Verified** · lemma · The two-fraction form of an additive twist. Both linear and powered denominators have separately justified nonzero constant coefficients. Finite polynomial identities recover the two-fraction expression inside K[[T]]. At the identity root both native inverses vanish and cannot replace the actual polynomial quotient.

### 102. DirichletPadicLFunctions:L2/twisted-smoothed-gauss-fractions

**Verified** · comparison · The source two-fraction Gauss formula. Primitive-root nonidentity handles every nonzero residue, while zero/nonunit character weights remove their terms before inverse cancellation. The factor a in the second fraction is retained.

### 103. DirichletPadicLFunctions:L2/prime-power-resolvent-reindex

**Verified** · lemma · Reindexing the smoothing resolvent. The unit permutation c->a*c gives character factor chi(a), rather than its inverse. Additive frequency multiplication accounts for root powers; no denominator is cancelled, so all residues remain valid.

### 104. DirichletPadicLFunctions:L2/prime-power-resolvent-substitution

**Verified** · lemma · Substitution in the weighted Gauss resolvent. The substitution Y^a-1 has zero constant coefficient. Unit-inverse transport applies at nonzero residues, and the zero character weight removes the identity-root term even at a=0.

### 105. DirichletPadicLFunctions:L2/prime-power-amice-formal-kernel

**Verified** · comparison · The prime-power twist and the formal finite kernel. The prime-power modulus uses only the existing formal finite kernel, with its field unit certificate. It never instantiates a tame actual measure at a wild modulus. Finite reindexing and legal substitution give -F+a*chi(a)*subst(F).

### 106. DirichletPadicLFunctions:L2/prime-power-exponential-coefficients

**Verified** · lemma · Exponential coefficients of the prime-power twist. Legal exponential substitution composition and rescaling contribute a^k in addition to the outer a. The negative finite-kernel coefficient changes the prefactor to 1-chi(a)*a^(k+1), with denominator (k+1)! retained.

### 107. DirichletPadicLFunctions:L2/prime-power-ordinary-moments

**Verified** · theorem · Ordinary moments of the prime-power smoothed measure. The exact coefficient-algebra ordinary-moment supplier multiplies by k!, giving denominator k+1. All field/root/Gauss hypotheses remain visible; finite controls supplement, but do not prove, the general actual-measure theorem.

### 108. DirichletPadicLFunctions:L2/smoothed-complex-character-kernel

**Verified** · construction · The smoothed complex character kernel. The actual smooth complex kernel is the finite combination -f+a*chi(a)*f(a*t), with correct removable value. The constructor permits a=0 and principal inputs, while later L comparisons state their narrower hypotheses.

### 109. DirichletPadicLFunctions:L2/smoothed-complex-regularity

**Verified** · theorem · Regularity of the smoothed character kernel. Real analytic composition with scaling and finite complex linear combination prove global real regularity, including the origin and a=0. No entire complex t-plane extension is claimed.

### 110. DirichletPadicLFunctions:L2/smoothed-complex-higher-derivatives

**Verified** · lemma · Higher derivatives of the smoothed kernel. The correct native real-scalar composition theorem handles R->C functions and contributes a^k. Multiplication by the outer smoothing scalar gives exponent k+1, including k=0 and a=0.

### 111. DirichletPadicLFunctions:L2/smoothed-complex-origin-values

**Verified** · theorem · Smoothed origin derivatives and Dirichlet values. The unsigned origin derivative multiplies the existing native special value by chi(a)*a^(k+1)-1. The within endpoint uses global smoothness/unique derivatives; normalized Mellin values later add (-1)^k.

### 112. DirichletPadicLFunctions:L2/smoothed-complex-derivative-decay

**Verified** · lemma · Decay of all smoothed kernel derivatives. Positive natural a>=1 preserves rate-one exponential decay after scaling, separately for each order. Global smoothness supplies exact within-derivative eventual equality.

### 113. DirichletPadicLFunctions:L2/smoothed-complex-gauss-comparison

**Verified** · comparison · The source complex smoothed Gauss formula. The actual complex Gauss comparison holds at all real inputs including the removable point. The unit permutation fixes the second character factor, and zero character weights precede cancellation. The explicit G!=0 assumption remains.

### 114. DirichletPadicLFunctions:L2/smoothed-mellin-convergence

**Verified** · lemma · Convergence of the smoothed Mellin integral. Positive real input scaling preserves native Mellin convergence; finite complex linearity gives Re(s)>0 for g, including chi(a)=0. No raw integral is asserted at nonpositive integers.

### 115. DirichletPadicLFunctions:L2/smoothed-mellin-gamma-l

**Verified** · theorem · The smoothed Mellin formula on a half-plane. The outer smoothing coefficient and native Mellin scaling give a^(1-s), and the tame sign contributes exactly one chi(-1). The half-plane uses actual convergent integrals and the native LFunction.

### 116. DirichletPadicLFunctions:L2/smoothed-mellin-entire

**Verified** · theorem · Entire continuation of the smoothed Mellin transform. The existing L0 entire continuation applies to global smoothness restricted to the half-line and positive rate-one decay for every derivative order. Entireness is in s.

### 117. DirichletPadicLFunctions:L2/smoothed-mellin-comparison

**Verified** · theorem · The global smoothed Dirichlet comparison. The fixed positive nonzero complex base makes a^(1-s) entire. Gamma cancellation on Re(s)>1 and whole-plane analytic uniqueness give the global nonprincipal comparison; principal a=1 tests use the zero constructor separately.

### 118. DirichletPadicLFunctions:L2/smoothed-mellin-negative-values

**Verified** · theorem · Smoothed Mellin values at nonpositive integers. The within-derivative formula yields the explicit (-1)^k normalized sign, including k=0. Native natural-power conversion and character parity reconcile the global comparison.

### 119. DirichletPadicLFunctions:L2/smoothed-gauss-mellin-comparison

**Verified** · comparison · Mellin continuation of the source Gauss kernel. Equality of actual real-variable Gauss and root-free kernels, including the origin, transports the existing normalized continuation. No formal evaluation map or unconditional Gauss nonvanishing is introduced.

### 120. DirichletPadicLFunctions:L2/prime-power-common-special-value

**Verified** · comparison · Common algebraic prime-power special values. One explicit finite element in E has separate complex and arithmetic images. Injective coefficient maps preserve nonprincipality from the actual primitive K-character; the signed element, rather than the unsigned moment, matches odd-order normalized Mellin values.

### 121. DirichletPadicLFunctions:L2/prime-power-common-positive-weight

**Verified** · comparison · Prime-power interpolation in positive weight. The explicit w>=1 permits substitution k=w-1 and gives exponent/Bernoulli index/divisor w. Weight1 includes mass/L(0); the final inverse-weighted pseudomeasure interface is still separate.

### 122. DirichletPadicLFunctions:L2/prime-power-quotient-common-value

**Verified** · comparison · Removing a nonzero smoothing factor. The explicit nonzero smoothing factor transports injectively to K, where evaluated moments can be divided. The complex b0 comparison itself needs no smoothing division; a=1 is an excluded zero denominator.

### 123. DirichletPadicLFunctions:L2/prime-power-smoothing-independent-quotient

**Verified** · theorem · Independence of the smoothed moment quotient. Each separately eligible quotient equals the same finite K-valued Bernoulli expression, giving independence without a complex embedding. This is evaluated-moment independence, not a generic localization evaluation map.

### 124. DirichletPadicLFunctions:L2/prime-power-arithmetic-character

**Verified** · construction · Arithmetic characters on p-adic units. The unit character uses only the native normed ring algebra/action and continuity assumptions; no field, completeness or ultrametric assumption enters its constructor. Its natural representative formula and minus-one sign follow from changeLevel and the native power map. The witness 1+p^(n+1) reduces to one even at level zero; positive powers need not factor through the finite quotient.

### 125. DirichletPadicLFunctions:L2/prime-power-arithmetic-character-nontrivial

**Verified** · theorem · Nontriviality in positive arithmetic weight. For a nontrivial characteristic-zero target and positive weight, the witness 1+p^(n+1)>1 has nonunit power value under injective natural casting. This proves nontriviality without assuming a nonprincipal finite character or a procyclic description and includes p=2 and level zero.

### 126. DirichletPadicLFunctions:L2/intrinsic-numerator-character-shift

**Verified** · theorem · Character values of the inverse-weighted numerator. Pulling the unit test through Units.val, intrinsic extension/inclusion and inverse weighting gives the actual ambient smoothed ordinary moment. Level n>=1 and weight w>=1 are essential: the displayed level-zero mass counterexample excludes unjustified extension to n=0. Primitive roots and Gauss values remain explicit only where needed.

### 127. DirichletPadicLFunctions:L2/two-dirac-arithmetic-character

**Verified** · lemma · The arithmetic smoothing denominator value. Dirac extension evaluates the cleared natural-unit denominator to chi(a)*a^w-1 for all levels and weights. This is an actual ring evaluation formula, requiring no primitive character, Gauss nonvanishing or localization regularity. Weight-zero trivial denominators correctly evaluate to zero.

### 128. DirichletPadicLFunctions:L2/intrinsic-numerator-common-character-value

**Verified** · comparison · Algebraic interpolation of the intrinsic numerator. The common algebraic value has separate complex and p-adic images; cancellation requires the smoothing denominator to evaluate nonzero. The existing Zp-to-Qp character evaluator does not provide the required K-valued ring homomorphism, so the precise supplier gap remains.

### 129. DirichletPadicLFunctions:L2/pseudomeasure-natural-numerator

**Verified** · lemma · Natural smoothing numerators of the pseudomeasure. The L1 arithmetic numerator for the actual unit convolution pseudomeasure agrees with the intrinsic numerator before any quotient evaluation. Native FractionRing is not asserted to be a field or domain here. The identity-unit numerator is zero and is not used as a regular denominator.

### 130. DirichletPadicLFunctions:L2/pseudomeasure-character-numerator

**Verified** · theorem · Arithmetic character values of the cleared numerator. Evaluating the actual cleared numerator uses the inverse-weight cancellation on unit support and the positive ordinary degree w-1, with n>=1 and w>=1. Principal and imprimitive positive-level characters remain covered; the identity unit gives zero without a Gauss nonvanishing assumption.

### 131. DirichletPadicLFunctions:L2/prime-power-principal-unit-value

**Verified** · lemma · Arithmetic characters at a principal unit. The principal-unit value is a promotion of the exact constructor API. Native reduction of 1+p^(n+1) is one at every level including zero, so only the actual coordinate power remains; neither primitivity nor characteristic zero is needed.

### 132. DirichletPadicLFunctions:L2/prime-power-admissible-principal-unit

**Verified** · theorem · An admissible principal unit in positive weight. Positive weight and characteristic zero make the explicit principal-unit denominator nonzero and hence a field unit. The statement correctly distinguishes its scalar image from regularity in the measure ring and excludes both the identity unit and weight-zero principal character.

### 133. DirichletPadicLFunctions:L2/pseudomeasure-character-evaluation-ratio

**Verified** · comparison · Conditional character specialization of the pseudomeasure. Generic evalAt is instantiated only on the existing pseudomeasure submodule with f.toAlgebra. The explicit functional compatibility computes numerator and denominator, and admissibility permits division. The missing canonical K-valued ring map remains an input; no map from the whole total quotient is inferred.

### 134. DirichletPadicLFunctions:L2/pseudomeasure-common-character-value

**Verified** · comparison · Conditional common-field interpolation of the pseudomeasure. The admissible scalar image reflects nonzero smoothing factor back through the field embedding, allowing the earlier common-field quotient at degree w-1. The signs cancel exactly, the complex and p-adic images remain separate, and primitive-root/Gauss hypotheses are retained for this route.

### 135. DirichletPadicLFunctions:L2/arithmetic-character-pointwise-value

**Verified** · lemma · The pointwise arithmetic character formula. The promoted formula is the defining product of finite-character restriction with the power of the actual unit coordinate. Weight zero removes only the latter factor; it does not replace an actual unit by a residue representative.

### 136. DirichletPadicLFunctions:L2/intrinsic-tame-zeta-measure

**Verified** · construction · The tame zeta measure on p-adic units. The specific intrinsic measure is the supplied linear restriction of the existing supported ambient tame measure. The supplier retraction proves uniqueness from actual pushforward, without a finite-moment determination assertion. Its modulus-one and zero-test cases and positive first moment have the correct scope.

### 137. DirichletPadicLFunctions:L2/intrinsic-tame-zeta-inclusion

**Verified** · lemma · Inclusion of the intrinsic tame zeta measure. Pushforward of restriction is the native ambient unit projector, which fixes the existing tame measure. Native map_apply yields equality on all ambient continuous tests and preserves mass; no identification of additive and multiplicative convolution is asserted.

### 138. DirichletPadicLFunctions:L2/intrinsic-tame-character-value

**Verified** · comparison · Tame values on the actual arithmetic character. The pointwise arithmetic formula identifies the pulled-back ambient test on every unit, so actual pushforward computes the character value at all levels and weights. CharacterIntegralAlgHom applies with matching K coefficients; this does not solve the different integral pseudomeasure evaluator request.

### 139. DirichletPadicLFunctions:L2/intrinsic-tame-zeta-norm

**Verified** · theorem · Norm bound on the intrinsic tame zeta measure. The supplied unit-inclusion operator norm equality and ambient tame bound give the intrinsic bound without a factor of p. Nontrivially normed field hypotheses match the native operator norm receiver; all-test and mass bounds follow from le_opNorm.

### 140. DirichletPadicLFunctions:L2/intrinsic-tame-common-character-value

**Verified** · comparison · Common-field interpolation on the unit group. The existing product-level Euler-Bernoulli common value transports through actual inclusion. At level zero the tame Euler factor remains; at positive level theta(p)=0 and the product-level imprimitive L-function already contains its missing Euler factor. Primitive-conductor replacement requires the later explicit comparison.

### 141. DirichletPadicLFunctions:L2/arithmetic-character-norm

**Verified** · lemma · Integral bound for arithmetic unit characters. Bounded scalar action bounds algebraMap(z)=z acting on one, independently of an isometric algebra map. Combining the native finite-character norm bound, norm multiplication and nonnegative powers gives a uniform bound for every weight, including zero.

### 142. DirichletPadicLFunctions:L2/integral-arithmetic-character

**Verified** · construction · Arithmetic unit characters with integral values. The norm bound puts the existing arithmetic character in the native valuation integer subtype. Subtype extensionality and continuity supply monoid laws and topology without installing a Zp algebra on the integer ring. The negative-one API retains the arithmetic power sign.

### 143. DirichletPadicLFunctions:L2/integral-arithmetic-character-coefficient

**Verified** · lemma · Coefficient inclusion of the integral arithmetic character. Coefficient inclusion is the first component of the subtype constructor at every unit. This yields an equality of the particular continuous tests and makes no claim that arbitrary K-tests lift to integral-valued tests.

### 144. DirichletPadicLFunctions:L2/intrinsic-integral-tame-zeta-measure

**Verified** · construction · The integral tame zeta measure on units. The intrinsic integral measure uses the existing normed subring and native restriction of the actual O-valued ambient measure. Retraction gives uniqueness from actual pushforward. No field, completeness instance or separately chosen scalar action on O is assumed.

### 145. DirichletPadicLFunctions:L2/intrinsic-integral-tame-inclusion

**Verified** · lemma · Ambient inclusion of the integral unit measure. The existing integral unit projector fixes the actual supported ambient measure. Applying native inclusion/restriction at coefficient ring O proves equality of measures and all ambient O-test evaluations with unchanged mass.

### 146. DirichletPadicLFunctions:L2/intrinsic-integral-tame-coefficients

**Verified** · comparison · Coefficient inclusion on all integral unit tests. Coefficient inclusion commutes with clopen zero extension pointwise on both pieces, then the ambient all-O-test comparison applies. Norm preservation and subtype injectivity give the test bound and uniqueness. No lift of arbitrary K-valued tests or general measure-extension functor is assumed.

### 147. DirichletPadicLFunctions:L2/intrinsic-integral-tame-character-value

**Verified** · comparison · Integral evaluation of arithmetic unit characters. Specializing the all-O-test comparison to the actual subtype-valued character and using its exact coefficient formula gives integral values for all weights including zero. Those endpoints remain actual integral values with no logarithmic formula asserted.

### 148. DirichletPadicLFunctions:L2/intrinsic-integral-tame-common-value

**Verified** · comparison · Integral common-field interpolation on units. The positive-weight common E-element from the product-level formula has its arithmetic image in the native integer ring by the actual O-measure evaluation. Level-zero and positive-level Euler conventions remain distinct and no root/Gauss hypotheses are added.

### 149. DirichletPadicLFunctions:L2/arithmetic-character-zero-level

**Verified** · lemma · The level-zero arithmetic character. At modulus one the native character takes one on the sole unit residue, so the existing arithmetic pointwise formula reduces to the coordinate power. The extra Eisenstein carrier notation is contextual and is not needed to strengthen the ring hypotheses.

### 150. DirichletPadicLFunctions:L2/arithmetic-character-natural-value

**Verified** · lemma · Arithmetic characters on natural-cast units. The promoted natural-unit API keeps the actual unit value a in Zp; both the residue lift and algebra map preserve that cast. The arithmetic power is not replaced by a canonical finite representative, and zero exponents and zero levels remain valid.

### 151. DirichletPadicLFunctions:L2/intrinsic-integral-tame-one-level

**Verified** · lemma · The modulus-one integral tame boundary. The native finite tame numerator at modulus one has only representative zero with an empty smoothing sum, hence is zero. The actual bounded inverse, integral subtype and both restrictions preserve this zero. This does not identify the zero tame constructor with the principal zeta pseudomeasure.

### 152. DirichletPadicLFunctions:L2/integral-arithmetic-character-weight-congruence

**Verified** · lemma · Integral congruences of arithmetic characters. Finite unit-group order at p^r gives the sufficient period p^(r-1)*(p-1). Kernel membership gives an actual Zp quotient witness, and bounded scalar action puts its image in O. Multiplication by the fixed integral finite-character value preserves divisibility even when its level exceeds r.

### 153. DirichletPadicLFunctions:L2/tame-residue-cyclic-shift

**Verified** · lemma · A cyclic shift of the actual tame residue masses. The finite residue formula reduces only character arguments modulo D. Reindexing a+qj with q a unit modulo D makes the unweighted sum zero; the finite weighted cyclic shift changes it by D*eta(a), giving the stated negative mass difference. This is not adding q within ZMod q.

### 154. DirichletPadicLFunctions:L2/tame-character-coefficient-variation

**Verified** · lemma · Variation of the tame formal coefficients. Subtracting the common finite integral-kernel decomposition before estimating preserves the sharp pointwise bound B. Every common kernel coefficient is bounded by one and the native ultrametric finite-sum law retains B. No norm or infinite root substitution on unrestricted formal series is introduced.

### 155. DirichletPadicLFunctions:L2/tame-character-measure-variation

**Verified** · lemma · Variation of the actual tame measure. The bounded coefficient difference is mapped linearly through the supplied inverse Amice isometry after toCLM. The operator norm bound and all-test bound follow on the actual dual without installing a new normed measure carrier.

### 156. DirichletPadicLFunctions:L2/dyadic-tame-quadratic-reference

**Verified** · lemma · A nearby nonprincipal quadratic tame character. For any odd D>1 a prime divisor supplies the native nonprincipal quadratic character. Injective integer casting and native change-level injectivity preserve nonprincipality, including additional nonunits. Values on units are plus/minus one, and bounded Z2 action bounds the principal difference by norm(2)<=1/2.

### 157. DirichletPadicLFunctions:L2/integral-arithmetic-character-level

**Verified** · lemma · Changing the level of an integral unit character. Reduction of the same actual unit and native changeLevel-on-units give equality of the two integral characters, including level zero. The ambient zero counterexample correctly prevents an unrestricted equality of the two character functions on Zp.

### 158. DirichletPadicLFunctions:L2/integral-arithmetic-character-product

**Verified** · lemma · Products of integral arithmetic unit characters. Integral inclusion reduces the character product to finite-character multiplication and the coordinate power-addition identity. Weights add and zero weights are allowed without inversion in O.

### 159. DirichletPadicLFunctions:L2/integral-tame-twist-unit-restriction

**Verified** · comparison · Restriction of an integral tame character twist. The ambient integral multiplier pulls back to the weight-zero integral unit character. Native weight-pushforward and restriction retraction identify actual intrinsic measures on all O-tests. Principal characters act identically on units and the modulus-one constructor remains zero.

### 160. DirichletPadicLFunctions:L2/integral-tame-twist-arithmetic-moment

**Verified** · comparison · Arithmetic moments of the restricted integral twist. Weight evaluation and the integral product identity combine chi and psi at the same displayed level while retaining the coordinate weight w. This is an actual O-valued integral at weight zero; only the existing positive common-field comparison yields special L-values.

### 161. DirichletPadicLFunctions:L2/integral-tame-twist-unit-inverse

**Verified** · theorem · Inverse finite-character weighting on the unit group. Finite-character inverse and character multiplication give the constant-one test only on actual units. Native weight multiplication then recovers the original intrinsic measure on all O-tests, including after a level raise and at level zero.

### 162. DirichletPadicLFunctions:L2/intrinsic-integral-tame-norm

**Verified** · lemma · The all-test bound for the integral unit measure. The exact existing all-test API is promoted. Pointwise norm-preserving inclusion identifies compact test norms and the field-valued tame bound gives the O-valued bound, with no operator norm on O-duals presumed.

### 163. DirichletPadicLFunctions:L2/intrinsic-integral-tame-test-congruence

**Verified** · theorem · Integral congruences on every unit test. The native valuation integer divisibility criterion converts every pointwise difference into a norm bound, including divisor zero. Compact test norm and the owned all-test measure bound give the reverse divisibility conclusion in O, retaining its integral quotient witness.

### 164. DirichletPadicLFunctions:L2/intrinsic-integral-tame-weight-congruence

**Verified** · theorem · Weight congruences of integral tame character values. The pointwise sufficient-period congruence combines with the integral all-test congruence for arbitrary fixed finite character level. It does not require that level to be below precision. The p=5 negative value difference -2/3 detects omission of p-1, and weight-zero integrals receive no extra L-value claim.

### 165. DirichletPadicLFunctions:L2/intrinsic-integral-tame-finite-congruence

**Verified** · theorem · Finite integral relations among tame character values. A finite O-linear combination of actual continuous character tests is a continuous test, and native finite linearity transfers the pointwise integral divisibility to its values. Empty families, varying levels, zero weights and zero divisor are retained; no density of finite characters is presumed.

### 166. DirichletPadicLFunctions:L2/integral-tame-twist-test-congruence

**Verified** · theorem · Integral congruences after a finite-character twist. The existing restricted twist is weighting by an actual integral character. Pointwise multiplication preserves an O-valued divisibility witness, so the all-test congruence applies to both weighted tests without inverting the ambient finite character.

### 167. DirichletPadicLFunctions:L2/tame-numerator-coefficient-map

**Verified** · lemma · Coefficient maps of the finite tame numerator. Finite numerator mapping uses preservation of sums, negation, products and the natural binomial coefficients of q_a. Native ringHomComp maps character values pointwise. This algebraic identity needs no p-adic topology, roots or field hypotheses.

### 168. DirichletPadicLFunctions:L2/tame-series-coefficient-map

**Verified** · lemma · Coefficient maps of the tame formal series. The actual unit q_D equation q_D*F=Q maps to the same equation in the target. Cancelling the target unit proves transport and independence of the unit certificate without assuming division by T or a field of fractions.

### 169. DirichletPadicLFunctions:L2/tame-measure-amice

**Verified** · lemma · The Amice coefficients of the actual tame measure. The supplier inverse-Amice identity on the bounded coefficient sequence gives the transform of the actual measure by coefficient extensionality. Its completeness, ultrametric and bounded scalar-action hypotheses are exactly retained.

### 170. DirichletPadicLFunctions:L2/tame-measure-field-comparison

**Verified** · comparison · Tame measure values under continuous field extension. The exact pinned Mahler dense-span theorem is over a complete normed commutative ring, so a nontrivial field norm is not missing here. The two continuous K-linear maps agree on mapped Mahler tests by the scalar tower and formal coefficient map. Equality extends to all original-field tests without claiming all target tests descend.

### 171. DirichletPadicLFunctions:L2/tame-zeta-unrestricted-weight

**Verified** · lemma · The tame zeta measure as a single inverse weight. The native inverse is zero on every nonunit, so multiplication by the unit indicator fixes the inverse-weight test. Evaluation on all tests proves the single-weight identity; continuity is supplied for the zero-extended inverse rather than inferred from field inversion at zero.

### 172. DirichletPadicLFunctions:L2/tame-zeta-field-comparison

**Verified** · comparison · Tame zeta values under continuous field extension. The all-test field comparison applied to gK*f transports the actual zeta value. The explicit Zp/K/L tower identifies the included native integer inverse in each field, including its zero branch. Constants compare actual masses only.

### 173. DirichletPadicLFunctions:L2/intrinsic-tame-zeta-restriction

**Verified** · lemma · The intrinsic tame zeta restriction formula. The promoted defining restriction keeps the native unit group distinct from the clopen unit-locus subtype; its evaluation uses the supplied inverse homeomorphism before zero extension.

### 174. DirichletPadicLFunctions:L2/intrinsic-tame-zeta-field-comparison

**Verified** · comparison · Intrinsic tame zeta values under field extension. Coefficient mapping commutes with clopen zero extension separately on the unit locus and its complement. Applying the ambient zeta field comparison gives equality on every original-field unit test, including constants and zero-weight arithmetic characters.

### 175. DirichletPadicLFunctions:L2/tame-integral-measure-inclusion

**Verified** · lemma · Inclusion of integral tame measure values. Taking the first component of the existing integral measure subtype gives its exact field-valued evaluation on each included O-test. No arbitrary test lift or new integral measure-extension theorem is needed.

### 176. DirichletPadicLFunctions:L2/integral-arithmetic-character-field-comparison

**Corrected** · lemma · Integral arithmetic characters under coefficient extension. Including both integral character values in L reduces their equality to pointwise character transport, power preservation and the explicit scalar tower. Subtype injectivity concludes the result. Corrected the locally incomplete first hypothesis to name both actual norm valuations, their native integer subrings, the HasExtension instance and its coefficient map explicitly, without strengthening the pointwise assumptions. The packet now spells out the actual native norm valuations, integer rings and inclusion instead of relying on “as above”.

### 177. DirichletPadicLFunctions:L2/integral-tame-measure-field-comparison

**Verified** · comparison · Integral tame measure values under field extension. The native HasExtension map between the actual norm-valuation integer rings has underlying field map, continuous by subtype lifting. The integral inclusion square and all-test field comparison then give equality in OL by subtype injectivity. Valuation equivalence suffices; isometry is not assumed.

### 178. DirichletPadicLFunctions:L2/integral-tame-zeta-field-comparison

**Verified** · comparison · Integral tame zeta values under field extension. The same native integer-ring inclusion square applies to the actual inverse-weighted zeta measures through their owned all-test inclusion laws. It preserves the native zero inverse on nonunits and compares masses without a degree-zero special-value claim.

### 179. DirichletPadicLFunctions:L2/intrinsic-integral-tame-field-comparison

**Verified** · comparison · Integral unit-group zeta values under field extension. The intrinsic all-test field comparison and native integer inclusion square give equality in OL on every transported OK-test. Arithmetic characters transport by their exact coefficient formula at all levels and weights; no new restriction or convolution map is built.

### 180. DirichletPadicLFunctions:L2/intrinsic-integral-tame-field-congruence

**Verified** · theorem · Integral zeta congruences reflected by coefficient extension. HasExtension reflects valuation order and hence integral divisibility of mapped evaluated differences. This includes divisor zero and the exact rational prime power p^r; ramification does not permit replacing it by a target uniformizer power. It does not infer pointwise congruence from evaluated congruence.

### 181. DirichletPadicLFunctions:L2/tame-character-field

**Verified** · definition · The field generated by the tame character values. The field is the native intermediate adjunction of the actual finite character range over the displayed Qp algebra. Principal and quadratic values generate bottom, while an outside value prevents bottom. No full cyclotomic field or conductor degree is identified with this field.

### 182. DirichletPadicLFunctions:L2/tame-character-field-minimal

**Verified** · lemma · Minimality of the character coefficient field. The native adjunction universal property unpacks to membership of every actual character value in the proposed intermediate field. Minimality is relative to the fixed ambient Qp embedding.

### 183. DirichletPadicLFunctions:L2/tame-character-values-algebraic

**Verified** · lemma · Algebraicity of finite character values. Nonunit character values are zero; unit values satisfy a positive finite-group-order power equation equal to one. Native of_pow gives algebraicity over the base field, including the modulus-one unit group, without Gauss or coprimality hypotheses.

### 184. DirichletPadicLFunctions:L2/tame-character-field-finite

**Verified** · theorem · Finite degree of the character coefficient field. The finite range consists of integral elements over Qp, so the exact native finiteDimensional_adjoin theorem gives finite degree. Quadratic degree one follows from bottom; no arbitrary conductor/order degree formula is inferred.

### 185. DirichletPadicLFunctions:L2/tame-character-field-complete

**Verified** · theorem · Completeness of the character coefficient field. The actual inherited norm and native NormedAlgebra structure, together with finite dimension over complete Qp, prove completeness of the generated field. Ambient completeness is unnecessary; merely being a subfield would not suffice.

### 186. DirichletPadicLFunctions:L2/tame-character-in-field

**Verified** · construction · The tame character over its generated field. The subtype-valued character has actual membership witnesses in the native generated field; monoid and nonunit-zero laws follow by inclusion injectivity. Uniqueness and nonprincipality transfer are at the same modulus with unchanged signs.

### 187. DirichletPadicLFunctions:L2/tame-character-field-recovery

**Verified** · comparison · Recovery after inclusion of the character field. The native subtype inclusion recovers the exact original bundled character pointwise, and injectivity reflects nonprincipality. This is a coefficient comparison before measure descent is instantiated.

### 188. DirichletPadicLFunctions:L2/tame-character-field-integer-tower

**Verified** · lemma · The compatible integer scalar tower on the character field. The restricted intermediate-field Zp algebra has the exact ambient scalar image because of the given Zp/Qp/K tower. Native of_algebraMap_eq supplies the required Zp/F/K tower and does not accept an unrelated algebra structure.

### 189. DirichletPadicLFunctions:L2/tame-character-field-bounded-action

**Verified** · lemma · The bounded integer action on the character field. The inherited norm and restricted action reduce the scalar estimate to the actual ambient IsBoundedSMul estimate. Native of_norm_smul_le gives the bounded action needed by the measure constructors without choosing an integer-ring action.

### 190. DirichletPadicLFunctions:L2/tame-character-field-valuation-extension

**Verified** · lemma · The norm valuation on the character field. The inherited subfield norm makes its valuation exactly the pullback of the ambient norm valuation, giving native HasExtension and the integer-ring map. Its double-subtype inclusion is continuous and reflects divisibility, including zero.

### 191. DirichletPadicLFunctions:L2/tame-measure-character-field-descent

**Verified** · comparison · Descent of the tame measure to its character field. The preceding finite completeness, bounded action, actual scalar tower and native continuous subtype field action supply every receiver hypothesis for the existing all-test tame comparison. Character recovery and proof irrelevance identify the actual constructors. Wild tests require their values in the smaller field.

### 192. DirichletPadicLFunctions:L2/tame-zeta-character-field-descent

**Verified** · comparison · Descent of the tame zeta measure to its character field. The same supplied generated-field structures instantiate the existing all-test inverse-weighted zeta comparison; recovering the original character identifies the exact ambient constructor. Only transported smaller-field tests are covered, including actual mass.

### 193. DirichletPadicLFunctions:L2/intrinsic-tame-character-field-descent

**Verified** · comparison · Descent of the intrinsic tame zeta measure. The native intrinsic all-test comparison is instantiated using the exact generated-field structures, yielding actual unit-group measure descent. Its positive coordinate moments are a specialization and do not imply arbitrary wild-character descent.

### 194. DirichletPadicLFunctions:L2/integral-tame-character-field-descent

**Verified** · comparison · Integral descent of the tame measure. The native valuation-extension integer map and already supplied field structures instantiate integral tame comparison. Recovery retains equality in the actual ambient integer ring on all transported smaller-integer tests, rather than forgetting integrality.

### 195. DirichletPadicLFunctions:L2/integral-tame-zeta-character-field-descent

**Verified** · comparison · Integral descent of the tame zeta measure. The same integer map instantiates the existing integral zeta all-test comparison under exactly the generated-field hypotheses. Character recovery preserves the actual inverse-weighted constructor and transported integral masses.

### 196. DirichletPadicLFunctions:L2/intrinsic-integral-character-field-descent

**Verified** · comparison · Integral descent of the intrinsic tame zeta measure. Integral intrinsic descent uses the existing unit-group all-test comparison and native integer map. The modulus-one constructor remains zero, and arbitrary ambient integer tests or outside wild-character values are not included.

### 197. DirichletPadicLFunctions:L2/tame-character-integer-range

**Verified** · lemma · The integer-ring image of the character field. An ambient integral element lies in the integer-ring image exactly when its field value lies in the native generated field. The reverse direction uses the inherited norm to reuse its integer-membership proof; double subtype extensionality gives the actual map witness.

### 198. DirichletPadicLFunctions:L2/tame-measure-character-field-range

**Verified** · theorem · Character-field values of tame test integrals. A continuous ambient test with pointwise generated-field values lifts continuously to the native subtype. The actual all-test descent yields an integral in that field, hence membership of the ambient value. The Dirac outside-constant control correctly prevents dropping the pointwise range condition.

### 199. DirichletPadicLFunctions:L2/tame-zeta-character-field-range

**Verified** · theorem · Character-field values of tame zeta test integrals. The same continuous subtype lift and actual zeta all-test descent prove the generated-field range property. Constants in the smaller field and actual mass are covered, without asserting that all ambient tests have the required values.

### 200. DirichletPadicLFunctions:L2/intrinsic-tame-character-field-range

**Verified** · theorem · Character-field values of intrinsic tame integrals. Continuous descent to the actual character field uses the pointwise range condition, including total mass, and the subspace topology; no arbitrary ambient measure descends.

### 201. DirichletPadicLFunctions:L2/integral-tame-character-integer-range

**Verified** · theorem · Character-integer values of tame integrals. Integral descent uses a double subtype test lift, inherited valuation bound and the actual smaller native integer-ring witness.

### 202. DirichletPadicLFunctions:L2/integral-tame-zeta-character-integer-range

**Verified** · theorem · Character-integer values of tame zeta integrals. The ambient zeta descent retains the same actual range condition and inverse weight.

### 203. DirichletPadicLFunctions:L2/intrinsic-integral-character-integer-range

**Verified** · theorem · Character-integer values of intrinsic tame integrals. The intrinsic zeta descent transports the actual unit-domain tests through continuous inclusion.

### 204. DirichletPadicLFunctions:L2/prime-power-character-pointwise-value

**Verified** · lemma · Pointwise evaluation of a lifted finite character. Character evaluation reduces definitionally to the finite residue character; level zero is constant one and needs no artificial Zp algebra assumption.

### 205. DirichletPadicLFunctions:L2/tame-character-field-quadratic

**Verified** · lemma · The character field of a quadratic character. The quadratic character field is bottom because all values are zero or plus/minus one.

### 206. DirichletPadicLFunctions:L2/tame-character-field-principal

**Verified** · lemma · The character field of a principal character. The principal character field is bottom using the native quadratic characterization, including modulus one.

### 207. DirichletPadicLFunctions:L2/arithmetic-character-values-in-character-field

**Verified** · lemma · Arithmetic-character values in their character field. The arithmetic weight lies in the character field via the explicit Zp/Qp/K tower and finite character-value generators.

### 208. DirichletPadicLFunctions:L2/intrinsic-tame-joint-character-comparison

**Verified** · comparison · Tame arithmetic moments over the joint character field. The actual intrinsic moment descends to the joint field F_eta join F_chi. Its finite dimension, completeness, bounded integer action and continuous inclusion precede the measure comparison; all weights and level zero are allowed.

### 209. DirichletPadicLFunctions:L2/intrinsic-integral-joint-character-comparison

**Verified** · comparison · Integral arithmetic moments over the joint character field. The integral joint-field moment uses the native integer ring and inherited-norm extension, not an arbitrary coefficient subring.

### 210. DirichletPadicLFunctions:L2/intrinsic-tame-joint-character-range

**Verified** · theorem · Joint-field values of tame arithmetic moments. Field membership is witnessed by the actual smaller-field integral; principal and quadratic auxiliary character fields reduce to bottom.

### 211. DirichletPadicLFunctions:L2/intrinsic-integral-joint-character-range

**Verified** · theorem · Joint-integer values of tame arithmetic moments. Integer-range membership is witnessed by the actual integral over the native joint integer ring.

### 212. DirichletPadicLFunctions:L2/tame-prime-level-character-value

**Verified** · lemma · Character values after adding one prime level. Prime-level character comparison splits units and nonunits before using the change-level unit formula; repeated primes and principal characters remain covered.

### 213. DirichletPadicLFunctions:L2/tame-prime-level-finite-sum

**Verified** · lemma · Finite character polynomial at one prime level. The finite polynomial identity subtracts the multiples of q from the block sum, works over arbitrary coefficient rings, and permits repeated primes.

### 214. DirichletPadicLFunctions:L2/tame-series-prime-level-comparison

**Verified** · comparison · Tame series after adding one prime level. The formal generating-series comparison requires a nonprincipal character and unit moduli. Substitution has zero constant coefficient. Principal mass values give a necessary counterexample.

### 215. DirichletPadicLFunctions:L2/tame-series-repeated-prime-level

**Verified** · theorem · Tame series at repeated prime levels. The repeated-prime formal identity follows because eta(q)=0; the nonprincipal hypothesis remains necessary.

### 216. DirichletPadicLFunctions:L2/tame-measure-prime-level-comparison

**Verified** · comparison · Tame measures after adding one prime level. The actual measure identity follows from Amice injectivity and finite Mahler dilation coefficients, with q a native Zp unit. Pushforward pulls tests back along multiplication by q.

### 217. DirichletPadicLFunctions:L2/tame-measure-repeated-prime-level

**Verified** · theorem · Tame measures at repeated prime levels. The repeated-prime measure equality is equality of actual measures. The principal zero example is not an assertion of the nonprincipal formula for all principal characters.

### 218. DirichletPadicLFunctions:L2/tame-measure-prime-level-moments

**Verified** · theorem · Prime level factors of ordinary tame moments. Ordinary degree-k moments have factor 1-eta(q)*q^k for every k including zero.

### 219. DirichletPadicLFunctions:L2/tame-unit-restriction-prime-level

**Verified** · comparison · Prime level changes of unit-restricted tame measures. The unit-support projector commutes with dilation because q is a Zp unit; this uses the generic restriction/dilation interface.

### 220. DirichletPadicLFunctions:L2/tame-zeta-prime-level-comparison

**Verified** · comparison · Prime level changes of tame zeta measures. Inverse weighting introduces the actual coefficient eta(q)/q, using native ring inverse at zero and the inverse law with a unit factor.

### 221. DirichletPadicLFunctions:L2/tame-zeta-repeated-prime-level

**Verified** · theorem · Tame zeta measures at repeated prime levels. Repeated-prime zeta equality follows by applying the existing inverse-weight construction to the measure equality.

### 222. DirichletPadicLFunctions:L2/intrinsic-tame-zeta-prime-level

**Verified** · comparison · Prime level changes on the native unit group. Intrinsic comparison is reflected through injective unit inclusion and its commuting dilation square, with multiplication by the actual native unit.

### 223. DirichletPadicLFunctions:L2/tame-zeta-prime-level-positive-moments

**Verified** · theorem · Prime level factors of positive tame zeta moments. Degree k+1 intrinsic moments use 1-eta(q)*q^k. Degree-zero mass is treated separately with eta(q)/q, avoiding truncated natural subtraction.

### 224. DirichletPadicLFunctions:L2/tame-prime-correction-integrality

**Verified** · lemma · Integral prime-level correction coefficients. The correction eta(q)/q is integral by character norm and the bounded image of the inverse Zp unit; lifts are unique native integer subtypes.

### 225. DirichletPadicLFunctions:L2/tame-integral-measure-prime-level

**Verified** · comparison · Prime level changes of integral tame measures. Integral measure comparison reflects the field identity using inclusion injectivity and actual O-valued tests.

### 226. DirichletPadicLFunctions:L2/tame-integral-zeta-prime-level

**Verified** · comparison · Prime level changes of integral tame zeta measures. Integral ambient zeta comparison uses the integral correction coefficient and native inverse weight; it retains the correct mass factor and repeated-prime case.

### 227. DirichletPadicLFunctions:L2/intrinsic-integral-tame-prime-level

**Verified** · comparison · Prime level changes of integral zeta measures on units. Integral intrinsic prime-level comparison reflects every O-valued test through subtype inclusion; mass is multiplied by 1-c and repeated primes have c=0.

### 228. DirichletPadicLFunctions:L2/tame-measure-arbitrary-level

**Verified** · comparison · Tame measure comparison at arbitrary larger levels. Prime-factor induction retains a downward-closed admissibility predicate. Only new prime divisors enter the signed subset sum; repeated exponents add no factor.

### 229. DirichletPadicLFunctions:L2/tame-zeta-arbitrary-level

**Verified** · comparison · Tame zeta comparison at arbitrary larger levels. The zeta subset coefficients retain eta(d)/d. All used denominators are p-adic units, and degree-zero mass is separate from positive polynomial moments.

### 230. DirichletPadicLFunctions:L2/tame-measure-primitive-conductor

**Verified** · comparison · Tame measure comparison with the primitive conductor. The native conductor supplies positivity, unit image, tameness and primitive nonprincipality. Recovery changes the actual primitive character back to the given character.

### 231. DirichletPadicLFunctions:L2/tame-zeta-primitive-conductor

**Verified** · comparison · Tame zeta comparison with the primitive conductor. Primitive ambient zeta comparison is the same native conductor specialization with inverse-product coefficients retained.

### 232. DirichletPadicLFunctions:L2/intrinsic-tame-zeta-arbitrary-level

**Verified** · comparison · Arbitrary tame level changes on the native unit group. Actual unit families exist from tameness, and native Units.coeHom identifies subset products. Injectivity through the supplied retraction reflects the ambient equality.

### 233. DirichletPadicLFunctions:L2/integral-tame-measure-arbitrary-level

**Verified** · comparison · Arbitrary level changes of integral tame measures. Every character value lifts to the native integer ring. Evaluation and subtype inclusion reflect the finite field equality on all integral tests.

### 234. DirichletPadicLFunctions:L2/integral-tame-zeta-arbitrary-level

**Verified** · comparison · Arbitrary level changes of integral tame zeta measures. Used inverse-product coefficients lift simultaneously because their denominators are prime to p. Values outside the finite powerset are irrelevant.

### 235. DirichletPadicLFunctions:L2/intrinsic-integral-tame-arbitrary-level

**Verified** · comparison · Arbitrary level changes of integral zeta measures on units. Integral intrinsic comparison uses exactly the field comparison and existing all-test inclusion; auxiliary unit and coefficient choices are unique on used indices.

### 236. DirichletPadicLFunctions:L2/intrinsic-tame-zeta-primitive-conductor

**Verified** · comparison · Primitive conductor comparison on the native unit group. Primitive intrinsic comparison keeps the same unit carrier. At new bad primes the original character is zero and its primitive character is nonzero.

### 237. DirichletPadicLFunctions:L2/integral-tame-measure-primitive-conductor

**Verified** · comparison · Primitive conductor comparison for integral tame measures. Primitive integral ordinary-measure comparison uses the un-divided character coefficients and derived conductor certificates.

### 238. DirichletPadicLFunctions:L2/integral-tame-zeta-primitive-conductor

**Verified** · comparison · Primitive conductor comparison for integral tame zeta measures. Primitive integral zeta comparison retains eta_0(d)/d; finite prime-to-p denominator integrality supplies the whole coefficient family.

### 239. DirichletPadicLFunctions:L2/intrinsic-integral-tame-primitive-conductor

**Verified** · comparison · Primitive conductor comparison for integral zeta measures on units. Primitive intrinsic integral comparison is equality on every continuous O-valued unit test, without assigning an analytic special value to mass.

### 240. DirichletPadicLFunctions:L2/tame-arithmetic-moment-level

**Verified** · comparison · Tame level Euler factors for arithmetic-character moments. Arithmetic-character evaluation turns the subset sum into a finite Euler product. Weight zero keeps q^0/q, and level zero removes only the finite character.

### 241. DirichletPadicLFunctions:L2/integral-tame-arithmetic-moment-level

**Verified** · comparison · Integral Euler factors for arithmetic-character moments. Integral Euler products use actual singleton coefficient lifts and reflect subset-product multiplicativity through O into K; there is no division in O.

### 242. DirichletPadicLFunctions:L2/tame-arithmetic-moment-primitive

**Corrected** · comparison · Primitive-conductor Euler factors for arithmetic moments. Primitive arithmetic moments use eta_0 at each new prime exactly once; the wild character and its level remain unchanged. Made its inherited coefficient/wild/tame hypotheses locally explicit. Replaced the inherited backward hypothesis reference by the complete local prime, coefficient-field, ambient-character and primitive-tame hypotheses.

### 243. DirichletPadicLFunctions:L2/integral-tame-arithmetic-moment-primitive

**Corrected** · comparison · Primitive-conductor Euler factors for integral arithmetic moments. Primitive integral moments specialize the existing finite O-valued product formula, with inclusion identifying the field product. Made the same inherited hypotheses locally explicit. Replaced the inherited backward hypothesis reference by the complete local prime, coefficient-field, ambient-character and primitive-tame hypotheses.

### 244. DirichletPadicLFunctions:L2/tame-primitive-gauss-norm

**Verified** · lemma · Norm of the tame primitive Gauss normalization. Primitive Gauss norm follows from all-residue Fourier and additive orthogonality at any positive composite modulus. The dual additive character is inverse; same-character products need parity. Both sums have norm at most one and their product is D of norm one.

### 245. DirichletPadicLFunctions:L2/tame-primitive-gauss-unit

**Verified** · lemma · The tame Gauss normalization is an integral unit. The norm-one normalization gives a native integer-ring unit by the actual valuation interface, uniquely including its inverse.

### 246. DirichletPadicLFunctions:L2/tame-gauss-series-certified

**Verified** · comparison · The tame Gauss formula with its normalization discharged. The certified Gauss series discharges nonvanishing by norm one while retaining D>1, primitivity, inverse-character orientation and alternating coefficient signs.

### 247. DirichletPadicLFunctions:L2/tame-integral-series-map

**Verified** · lemma · Inclusion of the integral tame series. Mapping the integral series is coefficientwise subtype reduction; it promotes an existing API and declaration instead of redeclaring a constructor.

### 248. DirichletPadicLFunctions:L2/tame-integral-gauss-series-certified

**Verified** · comparison · The integral tame series has the certified Gauss expression. The integral certified Gauss comparison composes the exact series inclusion with the certified field formula. An O-valued Amice statement still requires its compatible scalar action.

### 249. DirichletPadicLFunctions:L2/tame-wild-product-primitive

**Verified** · lemma · Primitivity of the tame and wild product. Coprime conductor equality follows by applying the native product-conductor divisibility twice with inverse characters, then using coprimality and conductor divides level.

### 250. DirichletPadicLFunctions:L2/primitive-tame-wild-euler-value

**Verified** · lemma · The primitive Euler value at p. The primitive Euler value equals eta(p) at wild level zero and vanishes at positive primitive wild level. Principal inflation is explicitly outside those hypotheses.

### 251. DirichletPadicLFunctions:L2/primitive-integral-interpolation

**Verified** · theorem · Primitive character interpolation for the integral tame measure. Positive-weight primitive interpolation composes the existing common algebraic Bernoulli value with primitive conductor equality and actual integral inclusion. Separate E-to-C and E-to-K embeddings are retained.

### 252. DirichletPadicLFunctions:L2/tame-integral-interpolation-unique

**Corrected** · theorem · Uniqueness from positive arithmetic moments. Uniqueness uses all positive ordinary degrees and the precisely requested O-valued moment separation. The Zp-only supplier theorem is insufficient; even-only degrees are rejected by delta_1-delta_minus1. Corrected the final Lean Dirac example to pass its explicit native O coefficient argument. Corrected the even-weight counterexample to pass the explicit coefficient-ring argument required by the pinned AbstractMeasure.dirac constructor. The exact atomic controls distinguish its odd moment and annihilate the even moments.

## Individual pinned baseline ledger

| # | Declaration and actual kind | Pinned module:line | File SHA256 | Statement and use check |
| ---: | --- | --- | --- | --- |
| 1 | `mathlib:PowerSeries.coeff_mk` (theorem) | `Mathlib/RingTheory/PowerSeries/Basic.lean:118` | `1df242ac321d5a93334dcf736f6c00b962a7a12d327af1975f8e40ebeff811fd` | Exact pinned source statement and coefficient-ring context checked. Supplies the stated coefficient construction/product/map or unit-inverse cancellation law; inverse multiplication requires the actual constant coefficient to equal the supplied unit. |
| 2 | `mathlib:PowerSeries.coeff_mul` (theorem) | `Mathlib/RingTheory/PowerSeries/Basic.lean:249` | `1df242ac321d5a93334dcf736f6c00b962a7a12d327af1975f8e40ebeff811fd` | Exact pinned source statement and coefficient-ring context checked. Supplies the stated coefficient construction/product/map or unit-inverse cancellation law; inverse multiplication requires the actual constant coefficient to equal the supplied unit. |
| 3 | `mathlib:PowerSeries.coeff_succ_X_mul` (theorem) | `Mathlib/RingTheory/PowerSeries/Basic.lean:285` | `1df242ac321d5a93334dcf736f6c00b962a7a12d327af1975f8e40ebeff811fd` | Exact pinned source statement and coefficient-ring context checked. Supplies the stated coefficient construction/product/map or unit-inverse cancellation law; inverse multiplication requires the actual constant coefficient to equal the supplied unit. |
| 4 | `mathlib:PowerSeries.map` (def) | `Mathlib/RingTheory/PowerSeries/Basic.lean:450` | `1df242ac321d5a93334dcf736f6c00b962a7a12d327af1975f8e40ebeff811fd` | Exact pinned source statement and coefficient-ring context checked. Supplies the stated coefficient construction/product/map or unit-inverse cancellation law; inverse multiplication requires the actual constant coefficient to equal the supplied unit. |
| 5 | `mathlib:PowerSeries.coeff_map` (theorem) | `Mathlib/RingTheory/PowerSeries/Basic.lean:461` | `1df242ac321d5a93334dcf736f6c00b962a7a12d327af1975f8e40ebeff811fd` | Exact pinned source statement and coefficient-ring context checked. Supplies the stated coefficient construction/product/map or unit-inverse cancellation law; inverse multiplication requires the actual constant coefficient to equal the supplied unit. |
| 6 | `mathlib:Polynomial.coeff_coe` (theorem) | `Mathlib/RingTheory/PowerSeries/Basic.lean:765` | `1df242ac321d5a93334dcf736f6c00b962a7a12d327af1975f8e40ebeff811fd` | Exact pinned source statement and coefficient-ring context checked. Supplies the stated coefficient construction/product/map or unit-inverse cancellation law; inverse multiplication requires the actual constant coefficient to equal the supplied unit. |
| 7 | `mathlib:Polynomial.coe_pow` (theorem) | `Mathlib/RingTheory/PowerSeries/Basic.lean:848` | `1df242ac321d5a93334dcf736f6c00b962a7a12d327af1975f8e40ebeff811fd` | Exact pinned source statement and coefficient-ring context checked. Supplies the stated coefficient construction/product/map or unit-inverse cancellation law; inverse multiplication requires the actual constant coefficient to equal the supplied unit. |
| 8 | `mathlib:PowerSeries.invOfUnit` (def) | `Mathlib/RingTheory/PowerSeries/Inverse.lean:84` | `f427011034644189e36355c2371a171736955f59fcc70b59e0cabbf1a784cdfc` | Exact pinned source statement and coefficient-ring context checked. Supplies the stated coefficient construction/product/map or unit-inverse cancellation law; inverse multiplication requires the actual constant coefficient to equal the supplied unit. |
| 9 | `mathlib:PowerSeries.constantCoeff_invOfUnit` (theorem) | `Mathlib/RingTheory/PowerSeries/Inverse.lean:97` | `f427011034644189e36355c2371a171736955f59fcc70b59e0cabbf1a784cdfc` | Exact pinned source statement and coefficient-ring context checked. Supplies the stated coefficient construction/product/map or unit-inverse cancellation law; inverse multiplication requires the actual constant coefficient to equal the supplied unit. |
| 10 | `mathlib:PowerSeries.mul_invOfUnit` (theorem) | `Mathlib/RingTheory/PowerSeries/Inverse.lean:102` | `f427011034644189e36355c2371a171736955f59fcc70b59e0cabbf1a784cdfc` | Exact pinned source statement and coefficient-ring context checked. Supplies the stated coefficient construction/product/map or unit-inverse cancellation law; inverse multiplication requires the actual constant coefficient to equal the supplied unit. |
| 11 | `mathlib:Polynomial.coeff_one_add_X_pow` (theorem) | `Mathlib/Algebra/Polynomial/Coeff.lean:306` | `762255ed3f7a2128ea3561b3bf79a4bde39eb0e54e27d2ca54f786dd0daf9ecc` | Exact pinned source statement and coefficient-ring context checked. Supplies the stated coefficient construction/product/map or unit-inverse cancellation law; inverse multiplication requires the actual constant coefficient to equal the supplied unit. |
| 12 | `mathlib:IsUnit.mul_left_cancel` (theorem) | `Mathlib/Algebra/Group/Units/Basic.lean:254` | `6c230b50a819ce94ec59e685a7a8365190fa629ecc0fb53072fa733e5b2e0f4f` | Exact pinned source statement and coefficient-ring context checked. Supplies the stated coefficient construction/product/map or unit-inverse cancellation law; inverse multiplication requires the actual constant coefficient to equal the supplied unit. |
| 13 | `mathlib:IsUnit.map` (theorem) | `Mathlib/Algebra/Group/Units/Hom.lean:208` | `b1ffc13bd4c6adcc882de5014ca832bb5c1038b14ecce2f679ac2ccef9097181` | Native monoid homomorphism sends an actual unit to a unit; applies to the coefficient ring map without requiring field coefficients. |
| 14 | `mathlib:PadicInt.isUnit_iff` (theorem) | `Mathlib/NumberTheory/Padics/PadicIntegers.lean:373` | `5392888b7e9833f14ab600bd3a3944da1f341366da2f3de95cd9737a19b1ff3b` | Exact pinned prime-context unit/norm/coprimality criterion supplies D invertibility when p does not divide D. Baseline14 is a lemma, not a theorem. |
| 15 | `mathlib:PadicInt.norm_natCast_eq_one_iff` (lemma) | `Mathlib/NumberTheory/Padics/PadicIntegers.lean:297` | `5392888b7e9833f14ab600bd3a3944da1f341366da2f3de95cd9737a19b1ff3b` | Exact pinned prime-context unit/norm/coprimality criterion supplies D invertibility when p does not divide D. Baseline14 is a lemma, not a theorem. |
| 16 | `mathlib:Nat.Prime.coprime_iff_not_dvd` (theorem) | `Mathlib/Data/Nat/Prime/Defs.lean:413` | `aebd695f444b13ff056ba32c43c88d31b327a5e65d2a3e0ed4784643c542a59c` | Exact pinned prime-context unit/norm/coprimality criterion supplies D invertibility when p does not divide D. Baseline14 is a lemma, not a theorem. |
| 17 | `mathlib:AbstractMeasure.amiceTransform` (def) | `Mathlib/NumberTheory/Padics/Measure/AmiceTransform.lean:75` | `7d4e2f4248a7839579ebf125c75f47a18962cf3a061000f2c6461d7c329d7dfc` | Native AbstractMeasure Amice transform has the stated continuous-action definition. Injectivity additionally requires complete ultrametric normed coefficients and bounded scalar multiplication, all retained by the consumer. Baseline17 is a lemma. |
| 18 | `mathlib:AbstractMeasure.injective_amiceTransform` (lemma) | `Mathlib/NumberTheory/Padics/Measure/AmiceTransform.lean:91` | `7d4e2f4248a7839579ebf125c75f47a18962cf3a061000f2c6461d7c329d7dfc` | Native AbstractMeasure Amice transform has the stated continuous-action definition. Injectivity additionally requires complete ultrametric normed coefficients and bounded scalar multiplication, all retained by the consumer. Baseline17 is a lemma. |
| 19 | `mathlib:PowerSeries.exp` (def) | `Mathlib/RingTheory/PowerSeries/Exp.lean:49` | `ab5f250ee7bf1347bd74a29e72ad282f028ca93e585c0945b43faea67d08ed24` | Formal exponential and rescaling statements read with their exact ring/commutative-ring and rational-algebra hypotheses; no analytic convergence or nonzero-constant formal substitution is supplied. |
| 20 | `mathlib:PowerSeries.constantCoeff_exp` (theorem) | `Mathlib/RingTheory/PowerSeries/Exp.lean:59` | `ab5f250ee7bf1347bd74a29e72ad282f028ca93e585c0945b43faea67d08ed24` | Formal exponential and rescaling statements read with their exact ring/commutative-ring and rational-algebra hypotheses; no analytic convergence or nonzero-constant formal substitution is supplied. |
| 21 | `mathlib:PowerSeries.exp_pow_eq_rescale_exp` (theorem) | `Mathlib/RingTheory/PowerSeries/Exp.lean:154` | `ab5f250ee7bf1347bd74a29e72ad282f028ca93e585c0945b43faea67d08ed24` | Formal exponential and rescaling statements read with their exact ring/commutative-ring and rational-algebra hypotheses; no analytic convergence or nonzero-constant formal substitution is supplied. |
| 22 | `mathlib:PowerSeries.rescale` (def) | `Mathlib/RingTheory/PowerSeries/Basic.lean:543` | `1df242ac321d5a93334dcf736f6c00b962a7a12d327af1975f8e40ebeff811fd` | Formal exponential and rescaling statements read with their exact ring/commutative-ring and rational-algebra hypotheses; no analytic convergence or nonzero-constant formal substitution is supplied. |
| 23 | `mathlib:PowerSeries.coeff_rescale` (theorem) | `Mathlib/RingTheory/PowerSeries/Basic.lean:567` | `1df242ac321d5a93334dcf736f6c00b962a7a12d327af1975f8e40ebeff811fd` | Native formal rescaling/substitution statement and actual commutative-ring/rational-algebra context read. The algebra homomorphism requires HasSubst; exp-1 has zero constant coefficient. No substitution at arbitrary nonzero constants or analytic convergence is supplied. |
| 24 | `mathlib:PowerSeries.rescale_X` (theorem) | `Mathlib/RingTheory/PowerSeries/Basic.lean:701` | `1df242ac321d5a93334dcf736f6c00b962a7a12d327af1975f8e40ebeff811fd` | Native formal rescaling/substitution statement and actual commutative-ring/rational-algebra context read. The algebra homomorphism requires HasSubst; exp-1 has zero constant coefficient. No substitution at arbitrary nonzero constants or analytic convergence is supplied. |
| 25 | `mathlib:PowerSeries.subst` (def) | `Mathlib/RingTheory/PowerSeries/Substitution.lean:158` | `6442dc150c2f686e966a3645a5d23885cd69598ec7b117047f14dfa643dade16` | Native formal rescaling/substitution statement and actual commutative-ring/rational-algebra context read. The algebra homomorphism requires HasSubst; exp-1 has zero constant coefficient. No substitution at arbitrary nonzero constants or analytic convergence is supplied. |
| 26 | `mathlib:PowerSeries.HasSubst.of_constantCoeff_zero'` (theorem) | `Mathlib/RingTheory/PowerSeries/Substitution.lean:67` | `6442dc150c2f686e966a3645a5d23885cd69598ec7b117047f14dfa643dade16` | Native formal rescaling/substitution statement and actual commutative-ring/rational-algebra context read. The algebra homomorphism requires HasSubst; exp-1 has zero constant coefficient. No substitution at arbitrary nonzero constants or analytic convergence is supplied. |
| 27 | `mathlib:PowerSeries.substAlgHom` (def) | `Mathlib/RingTheory/PowerSeries/Substitution.lean:171` | `6442dc150c2f686e966a3645a5d23885cd69598ec7b117047f14dfa643dade16` | Native formal rescaling/substitution statement and actual commutative-ring/rational-algebra context read. The algebra homomorphism requires HasSubst; exp-1 has zero constant coefficient. No substitution at arbitrary nonzero constants or analytic convergence is supplied. |
| 28 | `mathlib:PowerSeries.coe_substAlgHom` (theorem) | `Mathlib/RingTheory/PowerSeries/Substitution.lean:175` | `6442dc150c2f686e966a3645a5d23885cd69598ec7b117047f14dfa643dade16` | Native formal rescaling/substitution statement and actual commutative-ring/rational-algebra context read. The algebra homomorphism requires HasSubst; exp-1 has zero constant coefficient. No substitution at arbitrary nonzero constants or analytic convergence is supplied. |
| 29 | `mathlib:PowerSeries.substAlgHom_X` (theorem) | `Mathlib/RingTheory/PowerSeries/Substitution.lean:317` | `6442dc150c2f686e966a3645a5d23885cd69598ec7b117047f14dfa643dade16` | Native formal rescaling/substitution statement and actual commutative-ring/rational-algebra context read. The algebra homomorphism requires HasSubst; exp-1 has zero constant coefficient. No substitution at arbitrary nonzero constants or analytic convergence is supplied. |
| 30 | `mathlib:PowerSeries.subst_C` (theorem) | `Mathlib/RingTheory/PowerSeries/Substitution.lean:326` | `6442dc150c2f686e966a3645a5d23885cd69598ec7b117047f14dfa643dade16` | Native formal rescaling/substitution statement and actual commutative-ring/rational-algebra context read. The algebra homomorphism requires HasSubst; exp-1 has zero constant coefficient. No substitution at arbitrary nonzero constants or analytic convergence is supplied. |
| 31 | `mathlib:AbstractMeasure.dirac` (def) | `Mathlib/NumberTheory/Padics/Measure/Basic.lean:93` | `a57b5c37369359b0f68ac7efef6f779d6f50ea0f85a88a165ca1991e0c348507` | Native AbstractMeasure evaluation/Dirac or linear pushforward statement read with its ring, topological and continuous-scalar hypotheses. These act on actual continuous tests, not a new measure carrier. |
| 32 | `mathlib:AbstractMeasure.dirac_apply` (lemma) | `Mathlib/NumberTheory/Padics/Measure/Basic.lean:96` | `a57b5c37369359b0f68ac7efef6f779d6f50ea0f85a88a165ca1991e0c348507` | Native AbstractMeasure evaluation/Dirac or linear pushforward statement read with its ring, topological and continuous-scalar hypotheses. These act on actual continuous tests, not a new measure carrier. |
| 33 | `mathlib:AbstractMeasure.map` (def) | `Mathlib/NumberTheory/Padics/Measure/Basic.lean:101` | `a57b5c37369359b0f68ac7efef6f779d6f50ea0f85a88a165ca1991e0c348507` | Native AbstractMeasure evaluation/Dirac or linear pushforward statement read with its ring, topological and continuous-scalar hypotheses. These act on actual continuous tests, not a new measure carrier. |
| 34 | `mathlib:AbstractMeasure.map_apply` (lemma) | `Mathlib/NumberTheory/Padics/Measure/Basic.lean:106` | `a57b5c37369359b0f68ac7efef6f779d6f50ea0f85a88a165ca1991e0c348507` | Native map_apply evaluates the pushforward at the pulled-back continuous test, with the inherited continuous-scalar hypotheses. |
| 35 | `mathlib:AbstractMeasure` (def) | `Mathlib/NumberTheory/Padics/Measure/Basic.lean:40` | `a57b5c37369359b0f68ac7efef6f779d6f50ea0f85a88a165ca1991e0c348507` | AbstractMeasure is the native continuous-dual synonym. The definition does not supply a default operator norm for integral coefficient rings. |
| 36 | `mathlib:IsUnit.unit` (def) | `Mathlib/Algebra/Group/Units/Defs.lean:495` | `f35090c081e7903c719d1d77033bd1b443cc70a99ee4fb711dcaa2384508c77e` | IsUnit.unit constructs the native unit from a proof of invertibility. |
| 37 | `mathlib:IsUnit.unit_spec` (theorem) | `Mathlib/Algebra/Group/Units/Defs.lean:503` | `f35090c081e7903c719d1d77033bd1b443cc70a99ee4fb711dcaa2384508c77e` | IsUnit.unit_spec identifies its underlying value; it does not add a different inverse operation. |
| 38 | `mathlib:Nat.totient_prime_pow` (theorem) | `Mathlib/Data/Nat/Totient.lean:211` | `0b71be7c52540d06698cfc05437fbdbb07acfc9fe59bb1ad3255359d62b460c8` | The totient prime-power formula is scoped to a positive exponent; modulus one is handled separately. |
| 39 | `mathlib:PadicInt.toZModPow` (def) | `Mathlib/NumberTheory/Padics/RingHoms.lean:447` | `93ba84a94f41b266b73aaaab58a34982d0cb61cfb5bea592d05cb01ab31113c6` | The indexed Z_p reduction declaration includes the zero-level quotient, where the target is the trivial ring. |
| 40 | `mathlib:PadicInt.zmod_cast_comp_toZModPow` (theorem) | `Mathlib/NumberTheory/Padics/RingHoms.lean:478` | `93ba84a94f41b266b73aaaab58a34982d0cb61cfb5bea592d05cb01ab31113c6` | Reduction composition agrees with the native quotient cast and supports positive-level inflation. |
| 41 | `mathlib:PowerSeries.ext` (theorem) | `Mathlib/RingTheory/PowerSeries/Basic.lean:97` | `1df242ac321d5a93334dcf736f6c00b962a7a12d327af1975f8e40ebeff811fd` | PowerSeries.ext compares every coefficient over the native semiring; no analytic convergence is involved. |
| 42 | `mathlib:ContinuousMap.norm_coe_le_norm` (theorem) | `Mathlib/Topology/ContinuousMap/Compact.lean:199` | `cc91fa4f82ab7f5f49df5a69fb20e859e5e660cd03c8fd6f021ea5ea892fc5e6` | Continuous-function evaluation has the native sup-norm bound on a compact domain, sufficient for the homogeneous measure estimates. |
| 43 | `mathlib:IsUltrametricDist.norm_prod_le_of_forall_le_of_nonneg` (lemma) | `Mathlib/Analysis/Normed/Group/Ultra.lean:256` | `dbcc4d94a816bc62783699c8d22e32f038fb1438c862174b9e491992aaa8dc60` | The finite ultrametric sum declaration is generated by the indexed product theorem via to_additive. Its inherited nonarchimedean norm and finite-index hypotheses justify the quoted generated statement. |
| 44 | `mathlib:PowerSeries.coeff_C_mul` (theorem) | `Mathlib/RingTheory/PowerSeries/Basic.lean:261` | `1df242ac321d5a93334dcf736f6c00b962a7a12d327af1975f8e40ebeff811fd` | coeff_C_mul uses the scalar on the left in the native semiring; the packet follows that orientation. |
| 45 | `mathlib:PowerSeries.map_injective` (theorem) | `Mathlib/RingTheory/PowerSeries/Basic.lean:482` | `1df242ac321d5a93334dcf736f6c00b962a7a12d327af1975f8e40ebeff811fd` | PowerSeries.map_injective needs an injective native coefficient ring homomorphism between semirings. |
| 46 | `mathlib:mellin` (def) | `Mathlib/Analysis/MellinTransform.lean:91` | `81851086004a6e5424da555061a4b2f9d2e7cece148d9d49c3537a05adba73ff` | mellin is the unnormalised Bochner integral on the positive real half-line with complex scalar action on E. |
| 47 | `mathlib:MellinConvergent` (def) | `Mathlib/Analysis/MellinTransform.lean:45` | `81851086004a6e5424da555061a4b2f9d2e7cece148d9d49c3537a05adba73ff` | MellinConvergent is integrability of that precise half-line integrand. |
| 48 | `mathlib:mellinConvergent_of_isBigO_rpow_exp` (theorem) | `Mathlib/Analysis/MellinTransform.lean:414` | `81851086004a6e5424da555061a4b2f9d2e7cece148d9d49c3537a05adba73ff` | Exponential decay gives convergence only with local integrability, positive decay parameter and Re(s)>b matching the small-t power bound. |
| 49 | `mathlib:DifferentiableOn.analyticOnNhd` (theorem) | `Mathlib/Analysis/Complex/CauchyIntegral.lean:710` | `25c76fe24a2fcc04f6eadd8353f9be268611f8f8eeaf3f119dcaf7d140b7d33f` | Complex differentiability on an open set gives neighborhood analyticity, with the inherited complete target. |
| 50 | `mathlib:AnalyticOnNhd.eq_of_eventuallyEq` (theorem) | `Mathlib/Analysis/Analytic/Uniqueness.lean:234` | `3c095cfff0c66f30905355dfe8918c74148cf462427b0b59f5322a495e002424` | The whole-space analytic identity principle needs both whole-space analytic functions, a preconnected source and equality near a point; a right-half-plane identity alone is not an entire identity. |
| 51 | `mathlib:hasMellin_add` (theorem) | `Mathlib/Analysis/MellinTransform.lean:163` | `81851086004a6e5424da555061a4b2f9d2e7cece148d9d49c3537a05adba73ff` | hasMellin_add requires convergence of both integrands. |
| 52 | `mathlib:mellin_const_smul` (theorem) | `Mathlib/Analysis/MellinTransform.lean:108` | `81851086004a6e5424da555061a4b2f9d2e7cece148d9d49c3537a05adba73ff` | mellin_const_smul uses a normed-field scalar commuting with the complex action; convergence is not additionally required by this native statement. |
| 53 | `mathlib:Complex.Gamma_ne_zero_of_re_pos` (theorem) | `Mathlib/Analysis/SpecialFunctions/Gamma/Beta.lean:454` | `a7ac57c81c4e23a96885104166140fe33905bc46ff564203d9376b96bc494c99` | Gamma is nonzero on positive real part. This restricted assertion is sufficient for initial-half-plane normalization, not all complex points. |
| 54 | `mathlib:mellin_comp_mul_left` (theorem) | `Mathlib/Analysis/MellinTransform.lean:133` | `81851086004a6e5424da555061a4b2f9d2e7cece148d9d49c3537a05adba73ff` | Positive real scaling gives the displayed a^(-s) factor; positivity excludes branch and zero-scale ambiguity. |
| 55 | `mathlib:Real.summable_pow_mul_exp_neg_nat_mul` (lemma) | `Mathlib/Analysis/SpecialFunctions/Exp.lean:475` | `872bb4bedf06b545327750dffe0c911c29fc6bd67f1fddb2df59d0ff5b0bd84c` | Polynomial times exponentially decreasing real terms are summable for a positive decay parameter and natural polynomial degree. |
| 56 | `mathlib:hasDerivAt_tsum_of_isPreconnected` (theorem) | `Mathlib/Analysis/Calculus/SmoothSeries.lean:89` | `293196f8d3e0fc74837fda06ee2b518ba5d917aba80e72c435311681473c14a1` | The native termwise derivative theorem needs an open preconnected set, a summable uniform derivative majorant and series convergence at a point inside that set. Pointwise derivative convergence alone is insufficient. |
| 57 | `mathlib:Real.hasDerivAt_exp` (theorem) | `Mathlib/Analysis/SpecialFunctions/ExpDeriv.lean:269` | `d73b5159fee4d0c7ed3f7ff31ffd091f13cfbaf0e0006cba696bb2413a16b597` | Native Real exponential derivative is unrestricted in the real point. |
| 58 | `mathlib:iteratedDeriv_succ` (theorem) | `Mathlib/Analysis/Calculus/IteratedDeriv/Defs.lean:306` | `d6c3ace5e5e251e2943bd5985eb9c0a076a875c98fd876c961cb54c366ca50cb` | The native successor identity identifies the next iterated derivative with the derivative of the current one; regularity for subsequent uses is a separate hypothesis. |
| 59 | `mathlib:HasDerivAt.const_mul` (theorem) | `Mathlib/Analysis/Calculus/Deriv/Mul.lean:345` | `9a5f4cda6bdba50954d27879160adfdb7d408b41c49dde6343cd03a30227b242` | Constant multiplication of derivatives uses the displayed normed algebra and its scalar compatibility. |
| 60 | `mathlib:Asymptotics.IsBigO.of_bound` (theorem) | `Mathlib/Analysis/Asymptotics/Defs.lean:133` | `7a63c3a4447ea7578e1c715ece2977aeb6447bf3395c7923e6c127bfa694e042` | An eventual explicit norm inequality gives native Big-O along the same filter. |
| 61 | `mathlib:iteratedDerivWithin_eq_iteratedDeriv` (theorem) | `Mathlib/Analysis/Calculus/IteratedDeriv/Defs.lean:70` | `d6c3ace5e5e251e2943bd5985eb9c0a076a875c98fd876c961cb54c366ca50cb` | Within/ordinary iterated derivative comparison needs unique derivatives on the set, smoothness of the required order at the point and membership in the set. |
| 62 | `mathlib:HasDerivAt.ofReal_comp` (theorem) | `Mathlib/Analysis/Complex/RealDeriv.lean:102` | `a9ca5646135c0b940b16184412c0d5cb16e6cfc7b455a534e3794ac30be27097` | Inclusion of a real-valued function into C preserves the real derivative via the real continuous linear inclusion; it does not assert a complex derivative on C. |
| 63 | `mathlib:Complex.ofRealCLM` (def) | `Mathlib/Analysis/Complex/Basic.lean:317` | `36c55b3cf65b410972ed631abef1cb74c397327c8ccb30952dc5941c59c0d930` | ofRealCLM is the canonical real-linear continuous inclusion, not a complex-linear map from R. |
| 64 | `mathlib:dslope` (def) | `Mathlib/Analysis/Calculus/DSlope.lean:35` | `f0a8f117b95d786c84c618e6d6ba2766bf833242cc120930217d500a7687a205` | dslope replaces the divided difference at its center by the derivative; away from the center its denominator is the difference. |
| 65 | `mathlib:dslope_same` (theorem) | `Mathlib/Analysis/Calculus/DSlope.lean:39` | `f0a8f117b95d786c84c618e6d6ba2766bf833242cc120930217d500a7687a205` | dslope_same evaluates to the native derivative at the center by update_self. |
| 66 | `mathlib:dslope_of_ne` (theorem) | `Mathlib/Analysis/Calculus/DSlope.lean:45` | `f0a8f117b95d786c84c618e6d6ba2766bf833242cc120930217d500a7687a205` | Away from its center dslope equals the actual slope; the non-equality hypothesis is explicit. |
| 67 | `mathlib:HasFPowerSeriesAt.has_fpower_series_dslope_fslope` (theorem) | `Mathlib/Analysis/Analytic/IsolatedZeros.lean:78` | `4ce04539d25690facf2a7eb31c39789ad73f84689f197c76d7ccf67831e9e50f` | A local convergent native formal multilinear series for f yields its shifted series for dslope at the center; the analytic removable-point argument is exactly supported. |
| 68 | `mathlib:analyticAt_rexp` (theorem) | `Mathlib/Analysis/SpecialFunctions/ExpDeriv.lean:233` | `d73b5159fee4d0c7ed3f7ff31ffd091f13cfbaf0e0006cba696bb2413a16b597` | The real exponential is analytic at every real point. |
| 69 | `mathlib:AnalyticAt.div` (theorem) | `Mathlib/Analysis/Analytic/Constructions.lean:1127` | `b4ebe935f31d1c4110a0889146b48909c63e30a9e2de771e9065fa472d7d1be6` | AnalyticAt.div needs both analytic inputs, a normed division-algebra target and a nonzero denominator at the point. |
| 70 | `mathlib:AnalyticOnNhd.contDiff` (theorem) | `Mathlib/Analysis/Calculus/ContDiff/Defs.lean:1187` | `b1bbfe431bab224de42a989f3f31d7480868b415dd80abf43bf318310c05ed02` | Whole-space neighborhood analyticity gives ContDiff at every order. |
| 71 | `mathlib:iteratedDeriv_mul` (lemma) | `Mathlib/Analysis/Calculus/IteratedDeriv/Lemmas.lean:420` | `2938694d3f8f120a8c47d905efe4f8ab06579a3235d1a5a7d5a026c76e3bb797` | The higher product rule needs both inputs smooth to the stated order at the point and uses the native binomial coefficients. |
| 72 | `mathlib:iteratedDeriv_const` (theorem) | `Mathlib/Analysis/Calculus/IteratedDeriv/Defs.lean:357` | `d6c3ace5e5e251e2943bd5985eb9c0a076a875c98fd876c961cb54c366ca50cb` | The zeroth iterated derivative of a constant is that constant and each positive derivative vanishes. |
| 73 | `mathlib:iteratedDeriv_fun_id_zero` (lemma) | `Mathlib/Analysis/Calculus/IteratedDeriv/Lemmas.lean:415` | `2938694d3f8f120a8c47d905efe4f8ab06579a3235d1a5a7d5a026c76e3bb797` | The identity derivative at zero has the one nonzero first-order term used in the origin product identity. |
| 74 | `mathlib:ContinuousLinearMap.iteratedFDeriv_comp_left` (theorem) | `Mathlib/Analysis/Calculus/ContDiff/Basic.lean:255` | `4eb7b1ed75a57a692eb135aa44194a83bf68476245fa2add60deea976133e712` | Left composition by a continuous linear map commutes with iterated derivatives only under the stated smoothness and order bound; those follow from the packet global smoothness. |
| 75 | `mathlib:hasSum_mellin` (lemma) | `Mathlib/NumberTheory/LSeries/MellinEqDirichlet.lean:24` | `f60c07b6609da152e5ea8be8f06a27da7aa36e00ce5fe737c1fa285f556241d2` | hasSum_mellin supplies the sum/integral interchange with its explicit coefficient majorant, positive frequencies or zero coefficients, and positive real part. No independent unsupported interchange is needed. |
| 76 | `mathlib:hasSum_geometric_of_norm_lt_one` (theorem) | `Mathlib/Analysis/SpecificLimits/Normed.lean:357` | `6594e9b77de8a34365e762ee68394538d931aaa4dfb7c746090fbd27b3d45809` | The native geometric HasSum needs norm of the ratio below one; in the positive real exponential expansion this follows from t>0. |
| 77 | `mathlib:Real.summable_one_div_nat_add_rpow` (lemma) | `Mathlib/Analysis/PSeries.lean:453` | `d9d4d77f20ce7b777a713b21059694612f38b6498e9d5659f3e73bb921d1f595` | The shifted real p-series converges exactly for exponent greater than one, giving the half-plane absolute majorant. |
| 78 | `mathlib:sub_smul_dslope` (theorem) | `Mathlib/Analysis/Calculus/DSlope.lean:67` | `f0a8f117b95d786c84c618e6d6ba2766bf833242cc120930217d500a7687a205` | sub_smul_dslope recovers the difference at every point including the center, with no denominator cancellation at zero. |
| 79 | `mathlib:AnalyticAt.comp` (theorem) | `Mathlib/Analysis/Analytic/Composition.lean:859` | `6c8d69425e76ba05aec5a5ce528a77ce30daa780af1f8e815b8f69af3a62a49b` | Analytic composition is scoped to analyticity at f(x) and x over the same scalar field. |
| 80 | `mathlib:iteratedDeriv_comp_const_mul` (theorem) | `Mathlib/Analysis/Calculus/IteratedDeriv/Lemmas.lean:401` | `2938694d3f8f120a8c47d905efe4f8ab06579a3235d1a5a7d5a026c76e3bb797` | The constant-dilation iterated derivative formula requires global smoothness through the specified order; its c^n factor matches the beta(D*t) origin calculation. |
| 81 | `mathlib:MellinConvergent.comp_mul_left` (theorem) | `Mathlib/Analysis/MellinTransform.lean:62` | `81851086004a6e5424da555061a4b2f9d2e7cece148d9d49c3537a05adba73ff` | Positive real dilation gives an iff of native Mellin convergence. |
| 82 | `mathlib:PadicInt.compactSpace` (instance) | `Mathlib/NumberTheory/Padics/ProperSpace.lean:57` | `a7f441053a4464cfe4269f58334a1379ac54dca23a094bf1006fb50e7e6800a0` | The native p-adic integer space is compact for every prime, using its approximation estimates and completeness. Topological unit-group consequences remain separately imported. |
| 83 | `mathlib:AbstractMeasure.map_map` (lemma) | `Mathlib/NumberTheory/Padics/Measure/Basic.lean:110` | `a57b5c37369359b0f68ac7efef6f779d6f50ea0f85a88a165ca1991e0c348507` | Native continuous-dual pushforward composes in the displayed order, map g(map f mu)=map(g.comp f)mu. |
| 84 | `mathlib:PadicInt.ker_toZModPow` (theorem) | `Mathlib/NumberTheory/Padics/RingHoms.lean:459` | `93ba84a94f41b266b73aaaab58a34982d0cb61cfb5bea592d05cb01ab31113c6` | Reduction modulo p^n has kernel the native ideal generated by p^n, including n=0. |
| 85 | `mathlib:PadicInt.norm_le_pow_iff_mem_span_pow` (theorem) | `Mathlib/NumberTheory/Padics/PadicIntegers.lean:473` | `5392888b7e9833f14ab600bd3a3944da1f341366da2f3de95cd9737a19b1ff3b` | The actual p-adic integer norm ball p^(-n) equals the same span ideal. This supports uniform approximation on reduction fibers with the native norm. |
| 86 | `mathlib:pow_eq_pow_of_modEq` (theorem) | `Mathlib/GroupTheory/OrderOfElement.lean:313` | `338cd8fd86078ff1c852185399474d85bd2d11218c7c8c79a229cf21296e4650` | Equal natural exponents modulo n give equal powers only when x^n=1. |
| 87 | `mathlib:ContinuousMap.norm_le` (theorem) | `Mathlib/Topology/ContinuousMap/Compact.lean:207` | `cc91fa4f82ab7f5f49df5a69fb20e859e5e660cd03c8fd6f021ea5ea892fc5e6` | The exact native compact sup-norm criterion includes the nonnegative bound; it applies to all domain points. |
| 88 | `mathlib:ContinuousLinearMap.le_opNorm` (theorem) | `Mathlib/Analysis/Normed/Operator/Basic.lean:235` | `4c8daea8cc17e8f6647e665d5c0fad058af46758dff0e73af2b85a72976bd0e6` | Continuous-linear evaluation is bounded by operator norm times input norm under the native field/isometric scalar hypotheses. |
| 89 | `mathlib:PadicInt.norm_units` (theorem) | `Mathlib/NumberTheory/Padics/PadicIntegers.lean:406` | `5392888b7e9833f14ab600bd3a3944da1f341366da2f3de95cd9737a19b1ff3b` | Every native p-adic integer unit has norm exactly one. |
| 90 | `mathlib:DirichletCharacter` (abbrev) | `Mathlib/NumberTheory/DirichletCharacter/Basic.lean:40` | `f004670a9bedc23c4dfaeb61b90d5e613a6b604f9486640eb1ce4ae3699ef64e` | DirichletCharacter is the existing MulChar abbreviation on ZMod n, with a commutative monoid-with-zero coefficient target. |
| 91 | `mathlib:DirichletCharacter.changeLevel` (def) | `Mathlib/NumberTheory/DirichletCharacter/Basic.lean:66` | `f004670a9bedc23c4dfaeb61b90d5e613a6b604f9486640eb1ce4ae3699ef64e` | Native changeLevel inflates the homomorphism on units and extends by zero; it does not preserve arbitrary nonunit evaluations. |
| 92 | `mathlib:DirichletCharacter.changeLevel_eq_cast_of_dvd` (lemma) | `Mathlib/NumberTheory/DirichletCharacter/Basic.lean:104` | `f004670a9bedc23c4dfaeb61b90d5e613a6b604f9486640eb1ce4ae3699ef64e` | changeLevel_eq_cast_of_dvd is explicitly a units-only evaluation theorem, requiring separate nonunit arguments throughout the packet. |
| 93 | `mathlib:MulChar.map_nonunit` (theorem) | `Mathlib/NumberTheory/MulChar/Basic.lean:128` | `05a81c647229cdc583070ef8a7789e905054e00efab1cad37b1e5fda04e43809` | Every native multiplicative character vanishes on nonunits of its domain. |
| 94 | `mathlib:MulChar.one_apply` (lemma) | `Mathlib/NumberTheory/MulChar/Basic.lean:260` | `05a81c647229cdc583070ef8a7789e905054e00efab1cad37b1e5fda04e43809` | The principal native character is one on units, with the unit hypothesis explicit. |
| 95 | `mathlib:MulChar.mul_apply` (theorem) | `Mathlib/NumberTheory/MulChar/Basic.lean:271` | `05a81c647229cdc583070ef8a7789e905054e00efab1cad37b1e5fda04e43809` | Native character multiplication evaluates pointwise, requiring the commutative coefficient target. |
| 96 | `mathlib:IsLocalHom.of_surjective` (lemma) | `Mathlib/RingTheory/LocalRing/RingHom/Basic.lean:118` | `5b55f038bcbe64d45dab1df9d1882bb93f8e63f884b8608fc731bb83b8b1b218` | A surjective map from a commutative local ring into a nontrivial ring is local; the positive-level quotient is nontrivial but level zero is not. |
| 97 | `mathlib:ZMod.ringHom_surjective` (theorem) | `Mathlib/Data/ZMod/Basic.lean:1135` | `fbe19ea6fc95105cf596e1ef3c730e32dffdf9f53b74a17eaab5c668e03d1b0f` | The native ring map into ZMod n is surjective by its cast right inverse. This supplies the reduction-surjectivity input without an invented quotient map. |
| 98 | `mathlib:isUnit_map_iff` (theorem) | `Mathlib/Algebra/Group/Units/Hom.lean:283` | `b1ffc13bd4c6adcc882de5014ca832bb5c1038b14ecce2f679ac2ccef9097181` | Local monoid homomorphisms preserve and reflect units under the native IsLocalHom instance. |
| 99 | `mathlib:continuous_of_discreteTopology` (theorem) | `Mathlib/Topology/Order.lean:334` | `2705ffc65ea519f775d4e9678578a2dbb18f096325f857c6267ac2bd83af86c5` | Every function out of a discrete domain is continuous, sufficient for finite residue character bundling. |
| 100 | `mathlib:PadicInt.not_isUnit_iff` (theorem) | `Mathlib/NumberTheory/Padics/PadicIntegers.lean:392` | `5392888b7e9833f14ab600bd3a3944da1f341366da2f3de95cd9737a19b1ff3b` | Native Z_p nonunits are exactly elements of norm strictly below one. |
| 101 | `mathlib:PadicInt.norm_lt_one_iff_dvd` (theorem) | `Mathlib/NumberTheory/Padics/PadicIntegers.lean:489` | `5392888b7e9833f14ab600bd3a3944da1f341366da2f3de95cd9737a19b1ff3b` | Norm below one is precisely divisibility by p in the native integer ring, matching the positive-level zero support argument. |
| 102 | `mathlib:MulChar.ringHomComp` (def) | `Mathlib/NumberTheory/MulChar/Basic.lean:453` | `05a81c647229cdc583070ef8a7789e905054e00efab1cad37b1e5fda04e43809` | Native ringHomComp postcomposes through a coefficient ring homomorphism and preserves zero values. |
| 103 | `mathlib:MulChar.sum_eq_zero_of_ne_one` (theorem) | `Mathlib/NumberTheory/MulChar/Basic.lean:607` | `05a81c647229cdc583070ef8a7789e905054e00efab1cad37b1e5fda04e43809` | Zero total character sum needs a finite domain and an integral-domain coefficient ring, plus nonprincipality. These hold in the displayed field comparisons. |
| 104 | `mathlib:DirichletCharacter.norm_le_one` (lemma) | `Mathlib/NumberTheory/DirichletCharacter/Bounds.lean:37` | `45e06e70aba5284faf091ed18a01cbf65135df0d511f3a7de5dbedc9aa68069c` | Native finite-order character values have norm at most one in any normed field; unit values have norm exactly one. |
| 105 | `mathlib:BoundedContinuousFunction.ofNormedAddCommGroupDiscrete` (def) | `Mathlib/Topology/ContinuousMap/Bounded/Normed.lean:133` | `88bffdb3d2709fdf7280e16f427b2da6df92780e429250c677cae33370f9f6e5` | The existing discrete-domain constructor bundles a uniformly bounded coefficient function as a native bounded continuous function. |
| 106 | `mathlib:BoundedContinuousFunction.norm_le` (theorem) | `Mathlib/Topology/ContinuousMap/Bounded/Normed.lean:88` | `88bffdb3d2709fdf7280e16f427b2da6df92780e429250c677cae33370f9f6e5` | The exact native supremum criterion requires a nonnegative bound and every pointwise estimate. |
| 107 | `mathlib:gaussSum` (def) | `Mathlib/NumberTheory/GaussSum.lean:72` | `79b5b4a0a74b8535a379e51b38527af9762163a545b1e55b4ec061eb8a031247` | gaussSum is the native finite sum of multiplicative and additive character values; the character argument determines its orientation. |
| 108 | `mathlib:gaussSum_mulShift_of_isPrimitive` (lemma) | `Mathlib/NumberTheory/DirichletCharacter/GaussSum.lean:57` | `bf2f280880c365524d3af9ce2b4cd808912375f66625a4a4d86df27cb3d0d6bf` | The exact native primitive Gauss-shift identity holds at every residue of a positive modulus with domain coefficients, including nonunits and composite moduli. It does not provide unconditional nonvanishing. |
| 109 | `mathlib:DirichletCharacter.conductor_inv` (theorem) | `Mathlib/NumberTheory/DirichletCharacter/Basic.lean:405` | `f004670a9bedc23c4dfaeb61b90d5e613a6b604f9486640eb1ce4ae3699ef64e` | Native conductor_inv preserves the conductor, hence primitivity of inverse characters. |
| 110 | `mathlib:DirichletCharacter.conductor_one` (lemma) | `Mathlib/NumberTheory/DirichletCharacter/Basic.lean:259` | `f004670a9bedc23c4dfaeb61b90d5e613a6b604f9486640eb1ce4ae3699ef64e` | The principal character has conductor one at every positive level; primitive characters at modulus>1 are nonprincipal. |
| 111 | `mathlib:AddChar.zmodChar` (def) | `Mathlib/NumberTheory/LegendreSymbol/AddCharacter.lean:139` | `19b06c1956274e1e66ecafbcf1c0436fb44af084eac2e903cbcd1271140d808d` | Native zmodChar uses any root satisfying epsilon^n=1 at positive n and evaluates by canonical representatives. Primitivity is separate. |
| 112 | `mathlib:AddChar.zmodChar_apply` (theorem) | `Mathlib/NumberTheory/LegendreSymbol/AddCharacter.lean:145` | `19b06c1956274e1e66ecafbcf1c0436fb44af084eac2e903cbcd1271140d808d` | The exact native additive root-character evaluation is epsilon^a.val, matching the packet finite denominators. |
| 113 | `mathlib:AddChar.map_nsmul_eq_pow` (lemma) | `Mathlib/Algebra/Group/AddChar.lean:128` | `3da4e64b4e32d8b091585f8cc561668043cb91c883548d1808c82078e8d25fcb` | Native additive characters send natural multiples to powers, without analytic or field hypotheses. |
| 114 | `mathlib:IsPrimitiveRoot.pow_ne_one_of_pos_of_lt` (theorem) | `Mathlib/RingTheory/RootsOfUnity/PrimitiveRoots.lean:132` | `226fe247c20101f787ea6fb3bfafb92bf73fd62674150eb7b8207342354a8efb` | Primitive-root powers cannot be one at a nonzero exponent below the order; the two native representative bounds supply exactly those hypotheses. |
| 115 | `mathlib:PowerSeries.mul_inv_cancel` (theorem) | `Mathlib/RingTheory/PowerSeries/Inverse.lean:167` | `f427011034644189e36355c2371a171736955f59fcc70b59e0cabbf1a784cdfc` | A native field-coefficient series cancels its inverse only when its constant coefficient is nonzero. |
| 116 | `mathlib:PowerSeries.inv_eq_zero` (theorem) | `Mathlib/RingTheory/PowerSeries/Inverse.lean:150` | `f427011034644189e36355c2371a171736955f59fcc70b59e0cabbf1a784cdfc` | The native totalized inverse is zero iff the constant coefficient is zero, including nonzero nonunit series such as X. |
| 117 | `mathlib:PowerSeries.invUnitsSub` (def) | `Mathlib/RingTheory/PowerSeries/WellKnown.lean:38` | `f91bf57e173fe19b6b56c024e1facf5014106459fa87fa7d74bfc16f9fd96fa7` | invUnitsSub is the existing unit-geometric series with inverse-unit coefficients. |
| 118 | `mathlib:PowerSeries.coeff_invUnitsSub` (theorem) | `Mathlib/RingTheory/PowerSeries/WellKnown.lean:42` | `f91bf57e173fe19b6b56c024e1facf5014106459fa87fa7d74bfc16f9fd96fa7` | Its exact nth inverse-unit coefficient supplies the alternating linear-denominator formula after the displayed rescaling. |
| 119 | `mathlib:PowerSeries.invUnitsSub_mul_sub` (theorem) | `Mathlib/RingTheory/PowerSeries/WellKnown.lean:56` | `f91bf57e173fe19b6b56c024e1facf5014106459fa87fa7d74bfc16f9fd96fa7` | invUnitsSub multiplies C(u)-X to one in the native ring. |
| 120 | `mathlib:PowerSeries.eq_inv_iff_mul_eq_one` (theorem) | `Mathlib/RingTheory/PowerSeries/Inverse.lean:178` | `f427011034644189e36355c2371a171736955f59fcc70b59e0cabbf1a784cdfc` | The native inverse-characterization equivalence explicitly requires a nonzero constant coefficient of the candidate denominator. |
| 121 | `mathlib:ZMod.val_ne_zero` (theorem) | `Mathlib/Data/ZMod/Basic.lean:972` | `fbe19ea6fc95105cf596e1ef3c730e32dffdf9f53b74a17eaab5c668e03d1b0f` | Nonzero residues have nonzero canonical natural representatives. |
| 122 | `mathlib:ZMod.val_lt` (theorem) | `Mathlib/Data/ZMod/Basic.lean:61` | `fbe19ea6fc95105cf596e1ef3c730e32dffdf9f53b74a17eaab5c668e03d1b0f` | At positive modulus the canonical representative lies strictly below that modulus. |
| 123 | `mathlib:NormedField.valuation` (def) | `Mathlib/Topology/Algebra/Valued/NormedValued.lean:48` | `728f79ddfd2da95d279c614b303b6087a9001a824dac06d014304f9f5a3f3b04` | NormedField.valuation is the native nonarchimedean field norm valuation, with the required IsUltrametricDist instance. |
| 124 | `mathlib:NormedField.valuation_apply` (theorem) | `Mathlib/Topology/Algebra/Valued/NormedValued.lean:56` | `728f79ddfd2da95d279c614b303b6087a9001a824dac06d014304f9f5a3f3b04` | Its value is exactly nnnorm, so valuation membership matches the native norm bound. |
| 125 | `mathlib:Valuation.integer` (def) | `Mathlib/RingTheory/Valuation/Integers.lean:32` | `98b94deb6e79f1cfdc1b61a95670b335023aac26f961a333226c383ac893ade7` | Valuation.integer is the existing subring with valuation<=1; no alternate integer carrier is introduced. |
| 126 | `mathlib:Valuation.mem_integer_iff` (lemma) | `Mathlib/RingTheory/Valuation/Integers.lean:40` | `98b94deb6e79f1cfdc1b61a95670b335023aac26f961a333226c383ac893ade7` | Native valuation integer_norm_le_one gives the norm bound on the existing valuation.integer subtype; the norm is inherited from the ambient valued field. |
| 127 | `mathlib:LinearMap.mkContinuous` (def) | `Mathlib/Analysis/Normed/Operator/ContinuousLinearMap.lean:55` | `a5bc6904f1abe7b2c6e9b1e2d946095bb0633815a31bf44fa8bb3ded3aa767b1` | LinearMap.mkContinuous accepts a ring-linear map with a uniform homogeneous bound on every input. The planned integral-valued measure must establish that all-test estimate; a normed-field hypothesis on the integer ring is neither supplied nor needed. |
| 128 | `mathlib:AbstractMeasure.toCLMEquiv` (def) | `Mathlib/NumberTheory/Padics/Measure/Basic.lean:80` | `a57b5c37369359b0f68ac7efef6f779d6f50ea0f85a88a165ca1991e0c348507` | The existing abstract measure continuous linear map construction uses the native scalar continuity assumptions and reflexive action, matching the integral coefficient receiver. |
| 129 | `mathlib:AbstractMeasure.coeff_amiceTransform` (lemma) | `Mathlib/NumberTheory/Padics/Measure/AmiceTransform.lean:80` | `7d4e2f4248a7839579ebf125c75f47a18962cf3a061000f2c6461d7c329d7dfc` | Native Amice construction and its coefficient formula require the commutative topological ring algebra and continuous action. These declarations alone do not supply injectivity, completeness or the bounded-action hypotheses of the inverse equivalence. |
| 130 | `mathlib:Nat.add_choose_eq` (theorem) | `Mathlib/Data/Nat/Choose/Vandermonde.lean:31` | `2a00982f5be6eb43dd92263310602ae50ac886d2c463966cce9c757e0e5fa3ef` | The antidiagonal Vandermonde identity supplies finite natural binomial convolution with its exact index range; it does not justify infinite rearrangement. |
| 131 | `mathlib:mahler_natCast_eq` (lemma) | `Mathlib/NumberTheory/Padics/MahlerBasis.lean:110` | `fee7216cede5fa28e444e63b798a1e8a81c0ed0f4710e1dcf029cfd448a5bf83` | Native Mahler natchoose gives the polynomial test used in finite approximation; ordinary monomials and Mahler coefficients remain distinguished. |
| 132 | `mathlib:PadicInt.denseRange_natCast` (theorem) | `Mathlib/NumberTheory/Padics/RingHoms.lean:501` | `93ba84a94f41b266b73aaaab58a34982d0cb61cfb5bea592d05cb01ab31113c6` | Density of naturals in Zp is supplied through the native approximants rather than a choice of a new p-adic carrier. |
| 133 | `mathlib:ZMod.isUnit_iff_coprime` (lemma) | `Mathlib/Data/ZMod/Basic.lean:813` | `fbe19ea6fc95105cf596e1ef3c730e32dffdf9f53b74a17eaab5c668e03d1b0f` | The native ZMod unit criterion is coprimality. The finite translation-cycle consequence is derived from this bijectivity, with modulus and representative range kept explicit. |
| 134 | `mathlib:CompactSpace.uniformContinuous_of_continuous` (theorem) | `Mathlib/Topology/UniformSpace/HeineCantor.lean:40` | `bfb79da59c3164cc81af57221eaeb6c9abd25bb635e97ee810f2a1bac58f36c0` | Compact-domain uniform continuity supplies the uniform approximation step for continuous Zp tests and finite projection cells. |
| 135 | `mathlib:Metric.uniformContinuous_iff` (theorem) | `Mathlib/Topology/MetricSpace/Pseudo/Defs.lean:758` | `13cd9bc80e44bf7b61a55b5b1c2993058ac995f8803a6fb58c230c23a1d0fa35` | The epsilon-delta uniform-continuity form matches the small-cell diameter bound used to extend finite-residue identities to all continuous tests. |
| 136 | `mathlib:tendsto_pow_atTop_nhds_zero_of_lt_one` (theorem) | `Mathlib/Analysis/SpecificLimits/Basic.lean:190` | `db9f16d5ac4395791e56193d77f4ff77a37a17a400824e0d76ee66790dbd2ebb` | The positive-prime inverse-power limit makes cell diameters tend to zero; together with the native kernel norm and compact uniform continuity it supplies the finite-level approximation limit. |
| 137 | `mathlib:Polynomial.bernoulli` (def) | `Mathlib/NumberTheory/BernoulliPolynomials.lean:51` | `eef9e1ae845812a5174b897f4d3d0488674e6dce40abd38c49c6890f7e3cdf68` | The native ordinary Bernoulli polynomial formula has B1=-1/2 and the precise finite coefficient sum. The unrelated erroneous source endpoint convention is not imported into this L2 identity. |
| 138 | `mathlib:Polynomial.bernoulli_generating_function` (theorem) | `Mathlib/NumberTheory/BernoulliPolynomials.lean:259` | `eef9e1ae845812a5174b897f4d3d0488674e6dce40abd38c49c6890f7e3cdf68` | The native formal Bernoulli identity is over a commutative rational algebra, with (exp-1) times the exponential generating series equal to X times a rescaled exponential. Factorial scalars are units there; this is not a rational algebra structure on Zp. |
| 139 | `mathlib:PowerSeries.rescale_rescale` (theorem) | `Mathlib/RingTheory/PowerSeries/Basic.lean:589` | `1df242ac321d5a93334dcf736f6c00b962a7a12d327af1975f8e40ebeff811fd` | Successive formal rescaling multiplies the two scalars over a commutative semiring. This is formal coefficient rescaling, not analytic substitution at a root of unity. |
| 140 | `mathlib:Polynomial.eval_map_apply` (lemma) | `Mathlib/Algebra/Polynomial/Eval/Defs.lean:580` | `324a019feeb6134861ed550dcbdff5425ff062b8894024ef852643d5dc873a7b` | Mapped polynomial evaluation at the mapped point equals the mapped original value over semirings, matching the separate rational Bernoulli embeddings. |
| 141 | `mathlib:Polynomial.eval₂_at_apply` (theorem) | `Mathlib/Algebra/Polynomial/Eval/Defs.lean:261` | `324a019feeb6134861ed550dcbdff5425ff062b8894024ef852643d5dc873a7b` | Native eval2_at_apply evaluates through an actual ring homomorphism at its image point and preserves the original value; it justifies the common-field polynomial transports. |
| 142 | `mathlib:DirichletCharacter.LFunction` (def) | `Mathlib/NumberTheory/LSeries/DirichletContinuation.lean:61` | `7ef38fb53f462e19dfd6746fc1826423e55bb5e2672c2b5667e2fd4889f401b6` | The native Dirichlet LFunction is ZMod.LFunction on the same character and requires a nonzero modulus. It is distinct from the everywhere-defined LSeries, which is zero outside its convergence range. |
| 143 | `mathlib:MulChar.ringHomComp_ne_one_iff` (lemma) | `Mathlib/NumberTheory/MulChar/Basic.lean:508` | `05a81c647229cdc583070ef8a7789e905054e00efab1cad37b1e5fda04e43809` | Nonprincipality is preserved and reflected only for an injective coefficient ring homomorphism. The field embeddings used in the common-value route provide this hypothesis. |
| 144 | `mathlib:bernoulliFun` (def) | `Mathlib/NumberTheory/ZetaValues.lean:48` | `27aa982f5c473d7e8c6e6030ead08ffce081a7ff616b2acd9130d04772f8c672` | The real Bernoulli function is evaluation of the native rational polynomial mapped to R, making its rational-to-real comparison exact. |
| 145 | `mathlib:bernoulliFun_one` (theorem) | `Mathlib/NumberTheory/ZetaValues.lean:58` | `27aa982f5c473d7e8c6e6030ead08ffce081a7ff616b2acd9130d04772f8c672` | Native bernoulliFun_one is x-1/2 at every real x, including zero; the first-value convention used in the finite rational controls matches this. |
| 146 | `mathlib:MulChar.map_zero` (theorem) | `Mathlib/NumberTheory/MulChar/Basic.lean:232` | `05a81c647229cdc583070ef8a7789e905054e00efab1cad37b1e5fda04e43809` | MulChar.map_zero explicitly requires a nontrivial domain. Positive modulus greater than one supplies it; the zero ring at modulus one cannot be silently included. |
| 147 | `mathlib:PadicInt.inv` (def) | `Mathlib/NumberTheory/Padics/PadicIntegers.lean:154` | `5392888b7e9833f14ab600bd3a3944da1f341366da2f3de95cd9737a19b1ff3b` | The native PadicInt inverse is the field inverse only at norm one and is zero on every nonunit. The planned inverse weighting uses this exact total function. |
| 148 | `mathlib:PadicInt.inv_mul` (theorem) | `Mathlib/NumberTheory/Padics/PadicIntegers.lean:371` | `5392888b7e9833f14ab600bd3a3944da1f341366da2f3de95cd9737a19b1ff3b` | inv_mul gives one only with the norm-one hypothesis; cancellation in unit-supported tests meets it and is not applied to nonunits. |
| 149 | `mathlib:PadicInt.norm_le_one` (theorem) | `Mathlib/NumberTheory/Padics/PadicIntegers.lean:216` | `5392888b7e9833f14ab600bd3a3944da1f341366da2f3de95cd9737a19b1ff3b` | Every native p-adic integer has norm at most one by its subtype proof, including the zero-extended inverse. This supplies the tame norm bound without division by p. |
| 150 | `mathlib:norm_smul_le` (theorem) | `Mathlib/Analysis/Normed/MulAction.lean:34` | `cd7a02a58acf58c767b49c5cbd355b634656a39583aaa92c588518275394308d` | The exact norm_smul_le assumes IsBoundedSMul and bounds scalar norm times vector norm, supplying the algebra-image and inverse-weight estimates. |
| 151 | `mathlib:continuous_algebraMap` (theorem) | `Mathlib/Topology/Algebra/Algebra.lean:49` | `b654b0d4a7c2854c16b499ba33c40642b4e66ab82dac9d0f934796d2f4da1017` | The actual algebra map is continuous under ContinuousSMul. Bounded scalar action in the consuming normed receiver supplies that native continuity instance; arbitrary ring-map automatic continuity is not asserted. |
| 152 | `mathlib:ContinuousLinearMap.opNorm_le_bound` (theorem) | `Mathlib/Analysis/Normed/Operator/Basic.lean:197` | `4c8daea8cc17e8f6647e665d5c0fad058af46758dff0e73af2b85a72976bd0e6` | Native operator norm bound requires the displayed nontrivially normed scalar fields and a nonnegative homogeneous all-input bound. The K-valued tame dual meets these hypotheses; this declaration is not applied as an O-field operator norm. |
| 153 | `mathlib:Continuous.subtype_mk` (theorem) | `Mathlib/Topology/Constructions.lean:416` | `47de73fc60746ec4c31fa6e3fcb6d7fe8fbbcf5dbc88c0471fc017040a26467f` | Continuous.subtype_mk lifts a continuous map with pointwise subtype membership. It provides continuity of the actual integral-valued arithmetic maps without a new coefficient carrier. |
| 154 | `mathlib:DirichletCharacter.factorsThrough_gcd` (theorem) | `Mathlib/NumberTheory/DirichletCharacter/Basic.lean:173` | `f004670a9bedc23c4dfaeb61b90d5e613a6b604f9486640eb1ce4ae3699ef64e` | factorsThrough_gcd requires nonzero initial modulus and equality of inflated characters at the product modulus. The coprime tame and wild argument uses this exact equality to force principality at level one. |
| 155 | `mathlib:DirichletCharacter.factorsThrough_one_iff` (lemma) | `Mathlib/NumberTheory/DirichletCharacter/Basic.lean:224` | `f004670a9bedc23c4dfaeb61b90d5e613a6b604f9486640eb1ce4ae3699ef64e` | Factoring through one is exactly being the native principal character, including the same change-level convention that extends by zero on nonunits. |
| 156 | `mathlib:PowerSeries.coeff_one_pow` (lemma) | `Mathlib/RingTheory/PowerSeries/Basic.lean:652` | `1df242ac321d5a93334dcf736f6c00b962a7a12d327af1975f8e40ebeff811fd` | The coefficient-one power formula is valid over a commutative semiring for every exponent. At Y=1+T it gives coefficient N and characteristic-zero nonvanishing of 1-Y^N when that stronger argument is used. |
| 157 | `mathlib:Polynomial.bernoulli_comp_one_add_X` (theorem) | `Mathlib/NumberTheory/BernoulliPolynomials.lean:182` | `eef9e1ae845812a5174b897f4d3d0488674e6dce40abd38c49c6890f7e3cdf68` | Native Bernoulli polynomial finite difference is B_n(1+X)-B_n(X)=n*X^(n-1), with n=0 handled by zero scalar. It supplies the actual finite monomial primitive over the rational coefficient field. |
| 158 | `mathlib:Polynomial.aeval_comp` (theorem) | `Mathlib/Algebra/Polynomial/AlgebraMap.lean:318` | `f99248e0da1e1cd1b6ffd8f90dc07291c0ee6cb27ab302776eab7dbc70012d9b` | The native aeval_comp substitutes polynomial evaluation inside polynomial evaluation under the displayed algebra assumptions, matching the finite Bernoulli difference calculation. |
| 159 | `mathlib:Polynomial.continuous_aeval` (theorem) | `Mathlib/Topology/Algebra/Polynomial.lean:80` | `d78fd83744050fc71be1b8649b5bfab2f61fd66ac486c2a9a355ce921b4e610d` | continuous_aeval requires only a topological target semiring and algebra. It proves continuity of fixed polynomial tests without requiring continuity of the rational coefficient map. |
| 160 | `mathlib:Equiv.prod_comp` (lemma) | `Mathlib/Algebra/BigOperators/Group/Finset/Defs.lean:750` | `e935efa96ad9381658f3158f900d04589c46d7e933cab15f4d8632e1af85527f` | The pinned generator is lemma Equiv.prod_comp with an explicit to_additive attribute producing Equiv.sum_comp. Correct its catalogue kind from theorem to lemma; no absent additive declaration is invented. |
| 161 | `mathlib:ZMod.val_neg_of_ne_zero` (theorem) | `Mathlib/Data/ZMod/Basic.lean:1038` | `fbe19ea6fc95105cf596e1ef3c730e32dffdf9f53b74a17eaab5c668e03d1b0f` | Canonical negation has representative n-a.val only under nonzero modulus and nonzero residue, supplied as NeZero. Zero residues are split separately in the reflection proof. |
| 162 | `mathlib:DirichletCharacter.level_one` (lemma) | `Mathlib/NumberTheory/DirichletCharacter/Basic.lean:202` | `f004670a9bedc23c4dfaeb61b90d5e613a6b604f9486640eb1ce4ae3699ef64e` | The pinned level_one declaration is a lemma proving every modulus-one character principal; correct the catalogue kind. |
| 163 | `mathlib:DirichletCharacter.map_zero'` (lemma) | `Mathlib/NumberTheory/DirichletCharacter/Basic.lean:217` | `f004670a9bedc23c4dfaeb61b90d5e613a6b604f9486640eb1ce4ae3699ef64e` | The pinned map_zero-prime declaration is a lemma with explicit modulus-not-one hypothesis. Correct its catalogue kind and preserve the modulus-one boundary. |
| 164 | `mathlib:AbstractMeasure.map_dirac` (lemma) | `Mathlib/NumberTheory/Padics/Measure/Basic.lean:120` | `a57b5c37369359b0f68ac7efef6f779d6f50ea0f85a88a165ca1991e0c348507` | Native map_dirac is a lemma identifying pushforward of an atom with the atom at its image, under the existing measure scalar continuity assumptions. Correct the catalogue kind. |
| 165 | `mathlib:iteratedDeriv_exp_const_mul` (theorem) | `Mathlib/Analysis/SpecialFunctions/ExpDeriv.lean:393` | `d73b5159fee4d0c7ed3f7ff31ffd091f13cfbaf0e0006cba696bb2413a16b597` | The native real exponential derivative formula retains the factor c^n for every derivative order. This supports real-to-complex kernels only after the explicit coefficient inclusion. |
| 166 | `mathlib:Nat.sumByResidueClasses` (lemma) | `Mathlib/Analysis/SumOverResidueClass.lean:104` | `f14050037bebca9603d5aa8551d9c07abfc830fa966c8764f048426e2ae7c90e` | Splitting a natural infinite series into residue classes requires absolute Summable, positive modulus, completeness and a separated uniform additive target. The positive-halfline majorant supplies these before the split. |
| 167 | `mathlib:LSeries_def₀` (lemma) | `Mathlib/NumberTheory/LSeries/Basic.lean:173` | `a8a5e0f3f9f1a5aeca34960f5f53741088dc3a394dcef28f0f9768c5450fc6c8` | The native LSeries quotient spelling requires the sequence vanish at zero; the nonprincipal positive-modulus character meets that boundary. It does not establish convergence by itself. |
| 168 | `mathlib:DirichletCharacter.LFunction_eq_LSeries` (lemma) | `Mathlib/NumberTheory/LSeries/DirichletContinuation.lean:75` | `7ef38fb53f462e19dfd6746fc1826423e55bb5e2672c2b5667e2fd4889f401b6` | Native LFunction agrees with LSeries only for real part greater than one, matching the initial-halfplane Mellin comparison. |
| 169 | `mathlib:DirichletCharacter.differentiable_LFunction` (lemma) | `Mathlib/NumberTheory/LSeries/DirichletContinuation.lean:98` | `7ef38fb53f462e19dfd6746fc1826423e55bb5e2672c2b5667e2fd4889f401b6` | Global differentiability of LFunction requires a nonprincipal character. The analytic continuation comparison retains that hypothesis, with coefficient-embedding injectivity used to reflect it. |
| 170 | `mathlib:geom_sum_mul` (lemma) | `Mathlib/Algebra/Ring/GeomSum.lean:232` | `fa716192e3640a250181738b02d8be769b66d6dfb72fd955942cb158138134b4` | geom_sum_mul is a finite ring identity for every x and exponent, supplying denominator-clearing without evaluating an infinite geometric series. |
| 171 | `mathlib:ContinuousLinearMap.analyticAt` (theorem) | `Mathlib/Analysis/Analytic/Linear.lean:61` | `995d73465fe898120c008f5e4080d9396841d786a18cecc1df45c6daf854e8f8` | A native continuous linear map is analytic at every point over the displayed normed-field spaces. The real-to-complex coefficient inclusion meets these scalar hypotheses. |
| 172 | `mathlib:Real.exp_injective` (theorem) | `Mathlib/Analysis/Complex/Exponential.lean:319` | `d27425575f2e2b71072c952ce38dced80e97498900b83d1da5d7c623adaeac4e` | The real exponential is injective; combined with complex-root norm one it identifies the only possible real denominator zero, which the nonzero residue excludes. |
| 173 | `mathlib:IsPrimitiveRoot.norm'_eq_one` (theorem) | `Mathlib/RingTheory/RootsOfUnity/Complex.lean:139` | `a403d79d20137cc03f3e8899594a4c5c63333a690cfb4b77b066018dc3925a53` | The primitive complex root norm is one for nonzero order. This concerns the complex absolute value and is not the erroneous p-adic order-versus-norm wording of source E34. |
| 174 | `mathlib:ContinuousMonoidHom` (structure) | `Mathlib/Topology/Algebra/ContinuousMonoidHom.lean:57` | `af3ea79082730bc9ebcd385ccc9c22a41464f0353b0d9271273f5ce1fa2c14b5` | The native continuous monoid homomorphism bundles both an existing monoid homomorphism and continuous map, matching the arithmetic and integral character interfaces. |
| 175 | `mathlib:PowerSeries.binomialSeries` (def) | `Mathlib/RingTheory/PowerSeries/Binomial.lean:47` | `a6b92b59f164c0546bf4d2f332cf613103fde60b586d1476125ac3f8554e00f8` | Native binomialSeries is coefficientwise mk of Ring.choose(r,n) acting on one under the BinomialRing hypotheses. Natural specializations and unit-parameter continuity use this native carrier. |
| 176 | `mathlib:AddChar.mulShift_apply` (lemma) | `Mathlib/Algebra/Group/AddChar.lean:441` | `3da4e64b4e32d8b091585f8cc561668043cb91c883548d1808c82078e8d25fcb` | Native additive-character mulShift evaluates at r*x over a ring domain and commutative monoid target, matching the finite Gauss argument. |
| 177 | `mathlib:mul_geom_sum` (lemma) | `Mathlib/Algebra/Ring/GeomSum.lean:237` | `fa716192e3640a250181738b02d8be769b66d6dfb72fd955942cb158138134b4` | mul_geom_sum is the left-handed finite geometric multiplication identity over a ring, requiring no commutativity or infinite-series convergence. |
| 178 | `mathlib:AddChar.map_add_eq_mul` (lemma) | `Mathlib/Algebra/Group/AddChar.lean:113` | `3da4e64b4e32d8b091585f8cc561668043cb91c883548d1808c82078e8d25fcb` | Native additive characters map addition to multiplication, under an additive monoid domain and monoid target; this is the finite translation covariance law. |
| 179 | `mathlib:orderOf_dvd_of_pow_eq_one` (theorem) | `Mathlib/GroupTheory/OrderOfElement.lean:273` | `338cd8fd86078ff1c852185399474d85bd2d11218c7c8c79a229cf21296e4650` | In a monoid a power equal to one implies that the native order divides its exponent, supplying the p-power root-order bound. |
| 180 | `mathlib:orderOf_eq_one_iff` (theorem) | `Mathlib/GroupTheory/OrderOfElement.lean:262` | `338cd8fd86078ff1c852185399474d85bd2d11218c7c8c79a229cf21296e4650` | Native order equals one exactly for the identity, so coprime-order cancellation excludes nonidentity roots. |
| 181 | `mathlib:Nat.eq_one_of_dvd_coprimes` (theorem) | `Mathlib/Data/Nat/GCD/Basic.lean:235` | `93d254fd345ac037198d7a24027a45e44ba82af80fd50124da7fc0d0f03b42ec` | A natural common divisor of two coprime naturals is one; applied to root order dividing p^n and the smoothing parameter. |
| 182 | `mathlib:PowerSeries.eq_mul_inv_iff_mul_eq` (theorem) | `Mathlib/RingTheory/PowerSeries/Inverse.lean:174` | `f427011034644189e36355c2371a171736955f59fcc70b59e0cabbf1a784cdfc` | The native formal inverse cross-multiplication law requires a nonzero constant coefficient, not merely a nonzero series. The finite denominator proof supplies this exact hypothesis. |
| 183 | `mathlib:PowerSeries.constantCoeff_inv` (theorem) | `Mathlib/RingTheory/PowerSeries/Inverse.lean:147` | `f427011034644189e36355c2371a171736955f59fcc70b59e0cabbf1a784cdfc` | The constant coefficient of the native formal inverse is the inverse of the original constant coefficient, including its zero case. This explains the identity-root negative control. |
| 184 | `mathlib:MulChar.inv_apply_eq_inv'` (theorem) | `Mathlib/NumberTheory/MulChar/Basic.lean:301` | `05a81c647229cdc583070ef8a7789e905054e00efab1cad37b1e5fda04e43809` | Evaluation of the inverse multiplicative character is inverse value over a commutative group with zero, including nonunit zero values. |
| 185 | `mathlib:MulChar.apply_ne_zero_iff` (theorem) | `Mathlib/NumberTheory/MulChar/Basic.lean:213` | `05a81c647229cdc583070ef8a7789e905054e00efab1cad37b1e5fda04e43809` | Character value is nonzero precisely on domain units when the coefficient target is nontrivial. It justifies support and inverse-character cancellations on actual units. |
| 186 | `mathlib:Units.mulLeft_bijective` (theorem) | `Mathlib/Algebra/Group/Units/Equiv.lean:67` | `445cfea1c54cac361598e9c312c30d567562683deed355c2d7d2e4b9c83c5c17` | Multiplication by a native unit is bijective on the ambient monoid, giving finite reindexing over all residues rather than units alone. |
| 187 | `mathlib:PowerSeries.constantCoeff_subst_of_constantCoeff_zero` (theorem) | `Mathlib/RingTheory/PowerSeries/Substitution.lean:280` | `6442dc150c2f686e966a3645a5d23885cd69598ec7b117047f14dfa643dade16` | Admissible substitution with zero constant coefficient preserves the outer constant coefficient through its coefficient algebra map. It is not arbitrary root substitution. |
| 188 | `mathlib:PowerSeries.subst_comp_subst_apply` (theorem) | `Mathlib/RingTheory/PowerSeries/Substitution.lean:394` | `6442dc150c2f686e966a3645a5d23885cd69598ec7b117047f14dfa643dade16` | Two HasSubst substitutions compose under the explicit scalar tower; both substituted parameters retain the required constant-zero condition. |
| 189 | `mathlib:PowerSeries.rescale_eq_subst` (lemma) | `Mathlib/RingTheory/PowerSeries/Substitution.lean:404` | `6442dc150c2f686e966a3645a5d23885cd69598ec7b117047f14dfa643dade16` | Formal coefficient rescaling is substitution by r times X over the same ring, supplying the scaled exponential comparison. |
| 190 | `mathlib:Nat.factorial_succ` (theorem) | `Mathlib/Data/Nat/Factorial/Basic.lean:56` | `7e74e5fe77931379299dc2f05ee98e7ede1cda2c58f3586cf5ef4884d989d6c3` | The native factorial successor identity gives (k+1)!=(k+1)*k!, essential when converting exponential coefficients to ordinary moments. |
| 191 | `mathlib:iteratedDeriv_comp_const_smul` (theorem) | `Mathlib/Analysis/Calculus/IteratedDeriv/Lemmas.lean:394` | `2938694d3f8f120a8c47d905efe4f8ab06579a3235d1a5a7d5a026c76e3bb797` | The exact input-scaling derivative theorem supports real-to-complex functions and inserts the factor c^n with the actual real domain scaling. |
| 192 | `mathlib:iteratedDeriv_add` (lemma) | `Mathlib/Analysis/Calculus/IteratedDeriv/Lemmas.lean:311` | `2938694d3f8f120a8c47d905efe4f8ab06579a3235d1a5a7d5a026c76e3bb797` | Iterated derivatives preserve addition at a point when both functions have the required finite smoothness, supplied by the analytic kernels. |
| 193 | `mathlib:iteratedDeriv_neg` (lemma) | `Mathlib/Analysis/Calculus/IteratedDeriv/Lemmas.lean:330` | `2938694d3f8f120a8c47d905efe4f8ab06579a3235d1a5a7d5a026c76e3bb797` | Native iterated derivatives preserve negation for arbitrary functions into the displayed normed vector space. |
| 194 | `mathlib:iteratedDeriv_const_mul_field` (theorem) | `Mathlib/Analysis/Calculus/IteratedDeriv/Lemmas.lean:376` | `2938694d3f8f120a8c47d905efe4f8ab06579a3235d1a5a7d5a026c76e3bb797` | Constant target multiplication commutes with iterated derivatives over the displayed normed division algebra, including complex target over real domain. The full long ambient variable block was additionally read and confirms these scalar assumptions. |
| 195 | `mathlib:Asymptotics.IsBigO.comp_tendsto` (theorem) | `Mathlib/Analysis/Asymptotics/Basic.lean:238` | `31c92bbc007ee307429e87d63688075d0683383966412455075accb6e29d6a93` | Big-O pulls back along an actual tending function; positive input scaling supplies the correct filter map. |
| 196 | `mathlib:Filter.tendsto_const_mul_atTop_of_pos` (theorem) | `Mathlib/Order/Filter/AtTopBot/Field.lean:32` | `b6ce875ac37da2745d10f0b6460f3fee16f326dc2824652e1c537fba95725b33` | A strictly positive scalar preserves and reflects convergence to positive infinity. The positive natural smoothing parameter supplies this hypothesis. |
| 197 | `mathlib:Asymptotics.IsBigO.const_mul_left` (theorem) | `Mathlib/Analysis/Asymptotics/Ring.lean:45` | `e947ac8ddafcf45deb1d4c36ba9c4ba5d67fa84a9401cd6f29453ebea0e0b14c` | Fixed multiplication preserves a Big-O estimate in a seminormed ring and changes only its bound, allowing constants depending on derivative order. |
| 198 | `mathlib:Asymptotics.IsBigO.add` (theorem) | `Mathlib/Analysis/Asymptotics/Arith.lean:162` | `09d628df3ef00581c5dc3a4d603bbec4db50c59c1991ef9dfa626bad508ebf4d` | Adding two Big-O bounds with the same comparison function preserves that comparison, under the seminormed additive target assumptions. |
| 199 | `mathlib:MellinConvergent.const_smul` (theorem) | `Mathlib/Analysis/MellinTransform.lean:48` | `81851086004a6e5424da555061a4b2f9d2e7cece148d9d49c3537a05adba73ff` | Mellin convergence is preserved under bounded compatible constant scalar action, as used in the smoothed finite linear combination. |
| 200 | `mathlib:Differentiable.const_cpow` (theorem) | `Mathlib/Analysis/SpecialFunctions/Pow/Deriv.lean:161` | `c2fe235348a71472ba5bf5db90f2257d4be61352d861e4d699d016ddb9951fcd` | A fixed nonzero complex base to a differentiable exponent is differentiable. Positive smoothing parameters ensure the nonzero base; the alternate zero-base condition is unused. |
| 201 | `mathlib:Complex.cpow_add` (theorem) | `Mathlib/Analysis/SpecialFunctions/Pow/Complex.lean:84` | `f0b0e01a90f834f1265cc216f97c8174622c116410c2a88b479f7a8d402d2453` | Complex powers split sums of exponents only for a nonzero base, as retained in the positive smoothing-parameter argument. |
| 202 | `mathlib:Complex.cpow_one` (theorem) | `Mathlib/Analysis/SpecialFunctions/Pow/Complex.lean:74` | `f0b0e01a90f834f1265cc216f97c8174622c116410c2a88b479f7a8d402d2453` | Complex exponent one returns the base including zero. |
| 203 | `mathlib:Complex.cpow_natCast` (theorem) | `Mathlib/Analysis/SpecialFunctions/Pow/Complex.lean:127` | `f0b0e01a90f834f1265cc216f97c8174622c116410c2a88b479f7a8d402d2453` | A natural complex exponent equals native natural exponentiation, matching interpolation at negative integers. |
| 204 | `mathlib:one_lt_pow₀` (lemma) | `Mathlib/Algebra/Order/GroupWithZero/Basic.lean:488` | `6458a83bb092cd7112133a4f3ec375f7421f6472ea9ad6f13c381129b88aa47f` | one_lt_pow-zero applies to a base above one with a nonzero natural exponent. The argument is made in naturals before characteristic-zero casting. |
| 205 | `mathlib:ZMod.natCast_self` (theorem) | `Mathlib/Data/ZMod/Basic.lean:145` | `fbe19ea6fc95105cf596e1ef3c730e32dffdf9f53b74a17eaab5c668e03d1b0f` | The modulus has zero natural image in its own native residue ring, including the level-zero modulus-one convention. |
| 206 | `mathlib:RingHom.toAlgebra` (abbrev) | `Mathlib/Algebra/Algebra/Defs.lean:197` | `8cd3931aa8f1e5295c6b7892a70dcf8f7e231df28ff0b6bed1a20b14a5f5a64c` | RingHom.toAlgebra supplies the M-algebra structure induced by the given evaluator f; its algebra map is definitionally f. The independent Zp coefficient algebra is kept separate to avoid an inferred scalar tower. |
| 207 | `mathlib:isUnit_iff_ne_zero` (theorem) | `Mathlib/Algebra/GroupWithZero/Units/Basic.lean:264` | `7a7b5c40f914ff08c6d363d455aaba017714e7c23ae8d5ecdf898301a02c9429` | In the coefficient group with zero, being a unit is exactly being nonzero; this is not asserted for the integral measure ring. |
| 208 | `mathlib:eq_div_iff_mul_eq` (lemma) | `Mathlib/Algebra/GroupWithZero/Units/Basic.lean:353` | `7a7b5c40f914ff08c6d363d455aaba017714e7c23ae8d5ecdf898301a02c9429` | Quotient equality cross-multiplies only after a nonzero denominator witness, supplied by evalAt admissibility. |
| 209 | `mathlib:pow_le_one₀` (lemma) | `Mathlib/Algebra/Order/GroupWithZero/Basic.lean:439` | `6458a83bb092cd7112133a4f3ec375f7421f6472ea9ad6f13c381129b88aa47f` | Nonnegative norm bounds at most one are preserved by every natural power, including zero. |
| 210 | `mathlib:SubringClass.toNormedCommRing` (instance) | `Mathlib/Analysis/Normed/Ring/Basic.lean:924` | `847c67049cf3e6960d54c7a8e18bd078c3ac86e3e53890baef4bb782c371b8f0` | The native induced normed commutative ring structure applies to the actual valuation integer subring without a field structure. |
| 211 | `mathlib:pow_card_eq_one` (theorem) | `Mathlib/GroupTheory/OrderOfElement.lean:1223` | `338cd8fd86078ff1c852185399474d85bd2d11218c7c8c79a229cf21296e4650` | Every element of the native finite group has its cardinal power equal to one, giving finite unit-group period before reduction back to Zp. |
| 212 | `mathlib:ZMod.card_units_eq_totient` (theorem) | `Mathlib/Data/Nat/Totient.lean:113` | `0b71be7c52540d06698cfc05437fbdbb07acfc9fe59bb1ad3255359d62b460c8` | The native ZMod unit cardinality equals totient under nonzero modulus and an explicit Fintype instance, with no hidden cyclicity assumption. |
| 213 | `mathlib:eq_div_iff` (lemma) | `Mathlib/Algebra/GroupWithZero/Units/Basic.lean:348` | `7a7b5c40f914ff08c6d363d455aaba017714e7c23ae8d5ecdf898301a02c9429` | Native equality with a quotient requires its denominator nonzero. Integral precision arguments retain that witness and do not use field divisibility as a substitute. |
| 214 | `mathlib:gaussSum_mulShift` (theorem) | `Mathlib/NumberTheory/GaussSum.lean:76` | `79b5b4a0a74b8535a379e51b38527af9762163a545b1e55b4ec061eb8a031247` | The exact multiplicative shift identity is chi(u)*G_shift=G, so normalization uses chi(u) inverse. |
| 215 | `mathlib:IsUltrametricDist.isNonarchimedean_norm` (lemma) | `Mathlib/Analysis/Normed/Group/Ultra.lean:61` | `dbcc4d94a816bc62783699c8d22e32f038fb1438c862174b9e491992aaa8dc60` | The ultrametric norm bound is a lemma at the pin; declaration-kind metadata corrected. |
| 216 | `mathlib:Fin.prod_univ_eq_prod_range` (theorem) | `Mathlib/Data/Fintype/BigOperators.lean:224` | `3b6ad1533512371145deaee91ce55bee871a5866ec70f6c0db8b3adae53173b0` | The finite product theorem also generates the required additive finite-sum identity. |
| 217 | `mathlib:ZMod.card` (theorem) | `Mathlib/Data/ZMod/Defs.lean:166` | `af793f1736a6686fe8eedc7746e05ae29c68f7b463a156f314d3d5df9f2862fc` | The finite-cardinality instance handles positive moduli, including p^0=1. |
| 218 | `mathlib:Ring.inverse_mul` (theorem) | `Mathlib/Algebra/GroupWithZero/Units/Basic.lean:162` | `7a7b5c40f914ff08c6d363d455aaba017714e7c23ae8d5ecdf898301a02c9429` | Native ring inverse multiplication requires a unit factor and handles nonunits and zero in the other factor. |
| 219 | `mathlib:ZMod.val_natCast` (theorem) | `Mathlib/Data/ZMod/Basic.lean:89` | `fbe19ea6fc95105cf596e1ef3c730e32dffdf9f53b74a17eaab5c668e03d1b0f` | The natural residue value is a modulo expression, including modulus zero. |
| 220 | `mathlib:Valuation.HasExtension` (class) | `Mathlib/RingTheory/Valuation/Extension.lean:65` | `2569d97e54cc4913c40b6c06441b2b53a8016ea0c888a1bff1882e1344c36f9c` | HasExtension is equality after valuation comap; it does not assert a stronger numeric norm isometry. |
| 221 | `mathlib:Valuation.HasExtension.instAlgebraInteger` (instance) | `Mathlib/RingTheory/Valuation/Extension.lean:119` | `2569d97e54cc4913c40b6c06441b2b53a8016ea0c888a1bff1882e1344c36f9c` | The native integer-ring algebra instance is the actual restricted field map. |
| 222 | `mathlib:Valuation.HasExtension.val_algebraMap` (theorem) | `Mathlib/RingTheory/Valuation/Extension.lean:137` | `2569d97e54cc4913c40b6c06441b2b53a8016ea0c888a1bff1882e1344c36f9c` | The underlying value of the integer-ring algebra map is the ambient field algebra map. |
| 223 | `mathlib:Valuation.HasExtension.algebraMap_injective` (theorem) | `Mathlib/RingTheory/Valuation/Extension.lean:149` | `2569d97e54cc4913c40b6c06441b2b53a8016ea0c888a1bff1882e1344c36f9c` | The integer-ring algebra map is injective through faithful scalar action and a nontrivial target. |
| 224 | `mathlib:Valuation.HasExtension.val_map_le_iff` (theorem) | `Mathlib/RingTheory/Valuation/Extension.lean:76` | `2569d97e54cc4913c40b6c06441b2b53a8016ea0c888a1bff1882e1344c36f9c` | Valuation comparison reflects the exact order relation under the extension hypothesis. |
| 225 | `mathlib:Valuation.integer.integers` (theorem) | `Mathlib/RingTheory/Valuation/Integers.lean:61` | `98b94deb6e79f1cfdc1b61a95670b335023aac26f961a333226c383ac893ade7` | The native integer-ring interface supplies injectivity, the valuation bound and the exact range description. |
| 226 | `mathlib:Valuation.Integers.dvd_iff_le` (theorem) | `Mathlib/RingTheory/Valuation/Integers.lean:143` | `98b94deb6e79f1cfdc1b61a95670b335023aac26f961a333226c383ac893ade7` | Integer divisibility has the reversed valuation inequality, including zero. |
| 227 | `mathlib:PowerSeries.coeff_C` (theorem) | `Mathlib/RingTheory/PowerSeries/Basic.lean:191` | `1df242ac321d5a93334dcf736f6c00b962a7a12d327af1975f8e40ebeff811fd` | Constant-series coefficients are the scalar only at zero and vanish at positive degrees. |
| 228 | `mathlib:Finset.prod_range_succ` (theorem) | `Mathlib/Algebra/BigOperators/Group/Finset/Basic.lean:536` | `273036de3d36eda43082685a3ebc998900735e96c3f4b18f1546b39a4f765af0` | Range products split the last factor; the generated additive statement supplies the finite sum. |
| 229 | `mathlib:Finset.prod_range_succ'` (theorem) | `Mathlib/Algebra/BigOperators/Group/Finset/Basic.lean:541` | `273036de3d36eda43082685a3ebc998900735e96c3f4b18f1546b39a4f765af0` | The first-factor range decomposition also has its generated additive statement. |
| 230 | `mathlib:Units.mulLeft` (def) | `Mathlib/Algebra/Group/Units/Equiv.lean:56` | `445cfea1c54cac361598e9c312c30d567562683deed355c2d7d2e4b9c83c5c17` | Multiplication by a native monoid unit is a permutation with inverse multiplication by its inverse. |
| 231 | `mathlib:Equiv.mulLeft` (def) | `Mathlib/Algebra/Group/Units/Equiv.lean:97` | `445cfea1c54cac361598e9c312c30d567562683deed355c2d7d2e4b9c83c5c17` | Native group left translation specializes the unit permutation and generates additive translation. |
| 232 | `mathlib:ZMod.val_natCast_of_lt` (lemma) | `Mathlib/Data/ZMod/Basic.lean:95` | `fbe19ea6fc95105cf596e1ef3c730e32dffdf9f53b74a17eaab5c668e03d1b0f` | A natural representative strictly below the modulus has that exact residue value. |
| 233 | `mathlib:PadicInt.norm_p` (theorem) | `Mathlib/NumberTheory/Padics/PadicIntegers.lean:240` | `5392888b7e9833f14ab600bd3a3944da1f341366da2f3de95cd9737a19b1ff3b` | The native norm of p is the real reciprocal of p, including p=2. |
| 234 | `mathlib:Nat.exists_prime_and_dvd` (theorem) | `Mathlib/Data/Nat/Prime/Defs.lean:402` | `aebd695f444b13ff056ba32c43c88d31b327a5e65d2a3e0ed4784643c542a59c` | Every natural unequal to one has a prime divisor, including zero in the native statement. |
| 235 | `mathlib:ZMod.ringChar_zmod_n` (theorem) | `Mathlib/Data/ZMod/Basic.lean:141` | `fbe19ea6fc95105cf596e1ef3c730e32dffdf9f53b74a17eaab5c668e03d1b0f` | The residue-ring characteristic equals its natural modulus. |
| 236 | `mathlib:quadraticChar` (def) | `Mathlib/NumberTheory/LegendreSymbol/QuadraticChar/Basic.lean:120` | `d0a5eb315197f57508bbb1b9d606dac1e76fdd85f295c420e914454ab41f0314` | The native finite-field quadratic character has integer values and vanishes on nonunits. |
| 237 | `mathlib:quadraticChar_ne_one` (theorem) | `Mathlib/NumberTheory/LegendreSymbol/QuadraticChar/Basic.lean:207` | `d0a5eb315197f57508bbb1b9d606dac1e76fdd85f295c420e914454ab41f0314` | Nonprincipality of the finite-field quadratic character requires characteristic different from two. |
| 238 | `mathlib:quadraticChar_isQuadratic` (theorem) | `Mathlib/NumberTheory/LegendreSymbol/QuadraticChar/Basic.lean:199` | `d0a5eb315197f57508bbb1b9d606dac1e76fdd85f295c420e914454ab41f0314` | The native quadratic character has only zero and plus/minus one values. |
| 239 | `mathlib:Int.castRingHom` (def) | `Mathlib/Data/Int/Cast/Lemmas.lean:85` | `96045cabdced9868db60ce14a08ed828dab1291951937b2d05ab8d7c476853b3` | The integer cast is the existing ring map into any nonassociative ring. |
| 240 | `mathlib:Int.cast_injective` (lemma) | `Mathlib/Data/Int/Cast/Lemmas.lean:69` | `96045cabdced9868db60ce14a08ed828dab1291951937b2d05ab8d7c476853b3` | Injectivity of integer cast requires characteristic zero. |
| 241 | `mathlib:MulChar.IsQuadratic` (def) | `Mathlib/NumberTheory/MulChar/Basic.lean:441` | `05a81c647229cdc583070ef8a7789e905054e00efab1cad37b1e5fda04e43809` | Quadratic means the pointwise disjunction of zero and plus/minus one. |
| 242 | `mathlib:MulChar.IsQuadratic.comp` (theorem) | `Mathlib/NumberTheory/MulChar/Basic.lean:513` | `05a81c647229cdc583070ef8a7789e905054e00efab1cad37b1e5fda04e43809` | Ring-homomorphism postcomposition preserves the quadratic disjunction. |
| 243 | `mathlib:DirichletCharacter.changeLevel_eq_one_iff` (lemma) | `Mathlib/NumberTheory/DirichletCharacter/Basic.lean:89` | `f004670a9bedc23c4dfaeb61b90d5e613a6b604f9486640eb1ce4ae3699ef64e` | Nonzero target level and surjectivity on units make change-level principal exactly for a principal original character. |
| 244 | `mathlib:PadicInt.cast_toZModPow` (theorem) | `Mathlib/NumberTheory/Padics/RingHoms.lean:496` | `93ba84a94f41b266b73aaaab58a34982d0cb61cfb5bea592d05cb01ab31113c6` | Reduction followed by casting to a smaller p-power level is direct reduction, including level zero. |
| 245 | `mathlib:PadicInt.dense_span_mahler` (theorem) | `Mathlib/NumberTheory/Padics/MahlerBasis.lean:398` | `fee7216cede5fa28e444e63b798a1e8a81c0ed0f4710e1dcf029cfd448a5bf83` | The full native Mahler dense-span theorem is over a normed commutative Zp algebra with completeness, ultrametricity and bounded scalar action. It does not require a nontrivially normed field and validates the exact receiver used in node169. |
| 246 | `mathlib:ContinuousLinearMap.ext_on` (theorem) | `Mathlib/Topology/Algebra/Module/ContinuousLinearMap/Basic.lean:250` | `04b6ffb02b37ff3328fec9301b8e2a880f7b134014059db93bcfa81cfe6c2a5c` | Native continuous-linear-map ext_on compares maps on a set whose scalar-linear span is dense; only a Hausdorff target is added. This gives the all-original-test equality from Mahler values. |
| 247 | `mathlib:ContinuousLinearMap.compLeftContinuous` (def) | `Mathlib/Topology/ContinuousMap/Algebra.lean:595` | `9c3ac0cc3b6fffb9911f3e0d9c39c59a9924aac2e2ed20555f5984bcf8addd86` | Native compLeftContinuous bundles continuous coefficient postcomposition on continuous test spaces using the exact module actions. It preserves the actual test topology without an operator norm argument. |
| 248 | `mathlib:ContinuousLinearMap.restrictScalars` (def) | `Mathlib/Topology/Algebra/Module/ContinuousLinearMap/RestrictScalars.lean:35` | `8770ba0f510fc10924a723453580bc94be4aedbefc51f815edf92ac17378a29e` | Native restrictScalars retains the underlying continuous map under CompatibleSMul. The displayed scalar tower supplies the compatibility for the K-linear comparison. |
| 249 | `mathlib:algebraMapCLM` (def) | `Mathlib/Topology/Algebra/Algebra.lean:88` | `b654b0d4a7c2854c16b499ba33c40642b4e66ab82dac9d0f934796d2f4da1017` | Native algebraMapCLM uses ContinuousSMul to bundle the coefficient algebra map as a continuous linear map, exactly matching the field-comparison assumptions. |
| 250 | `mathlib:IsScalarTower.algebraMap_apply` (theorem) | `Mathlib/Algebra/Algebra/Tower.lean:131` | `80c681c1674d180828b520f3533b549f302153ee5042c2e65ea7733c8c8c9e38` | Scalar-tower composition is an equality of the actual algebra maps. |
| 251 | `mathlib:DFunLike.ext` (theorem) | `Mathlib/Data/FunLike/Basic.lean:194` | `09f0cf00d0136c6b2e3c9300981bd73287bacfcde7b4dba5b688522b8e92d2b8` | Native DFunLike extensionality applies to every continuous test on the actual measure carrier. |
| 252 | `mathlib:IntermediateField.adjoin` (def) | `Mathlib/FieldTheory/IntermediateField/Adjoin/Defs.lean:34` | `acccf606573e67aeb67d1354c50e8f0531ede578922f22bc4fa376b74b22d967` | Intermediate-field adjunction is native subfield closure of the base image and generators. |
| 253 | `mathlib:IntermediateField.subset_adjoin` (theorem) | `Mathlib/FieldTheory/IntermediateField/Adjoin/Defs.lean:331` | `acccf606573e67aeb67d1354c50e8f0531ede578922f22bc4fa376b74b22d967` | Each specified generator belongs to the actual adjunction. |
| 254 | `mathlib:IntermediateField.adjoin_le_iff` (theorem) | `Mathlib/FieldTheory/IntermediateField/Adjoin/Defs.lean:55` | `acccf606573e67aeb67d1354c50e8f0531ede578922f22bc4fa376b74b22d967` | Containment of adjunction is equivalent to containment of its generators. |
| 255 | `mathlib:IntermediateField.finiteDimensional_adjoin` (theorem) | `Mathlib/FieldTheory/IntermediateField/Adjoin/Basic.lean:611` | `8c664a4e82492fe856642f7b55db4650986c13845a94712998da5d769cfbdc7b` | A finite set of integral generators yields finite dimension of its intermediate field. |
| 256 | `mathlib:isIntegral_zero` (theorem) | `Mathlib/RingTheory/IntegralClosure/IsIntegral/Basic.lean:116` | `8f4f47147ea5786a0140f9c443408bdd88e22cfc96ebbf1d224c474033f11c49` | Zero is integral via the native algebra-map polynomial certificate. |
| 257 | `mathlib:isIntegral_one` (theorem) | `Mathlib/RingTheory/IntegralClosure/IsIntegral/Basic.lean:122` | `8f4f47147ea5786a0140f9c443408bdd88e22cfc96ebbf1d224c474033f11c49` | One is integral via the same native image certificate. |
| 258 | `mathlib:IsIntegral.of_pow` (theorem) | `Mathlib/RingTheory/IntegralClosure/IsIntegral/Basic.lean:125` | `8f4f47147ea5786a0140f9c443408bdd88e22cfc96ebbf1d224c474033f11c49` | Integrality of a positive power implies integrality of the element; exponent positivity is necessary. |
| 259 | `mathlib:MulChar.ext'` (theorem) | `Mathlib/NumberTheory/MulChar/Basic.lean:121` | `05a81c647229cdc583070ef8a7789e905054e00efab1cad37b1e5fda04e43809` | Whole-domain pointwise equality implies equality of native multiplicative characters. |
| 260 | `mathlib:SubfieldClass.toNormedField` (instance) | `Mathlib/Analysis/Normed/Field/Basic.lean:356` | `613a9c9fb6f2b6d4d517fa2b09b6ec59c6a1b78f402d72c7b8e3be85082241ba` | The subfield inherits the ambient normed-field structure through injective subtype inclusion. |
| 261 | `mathlib:Subalgebra.toNormedAlgebra` (instance) | `Mathlib/Analysis/Normed/Module/Basic.lean:404` | `48336bbf5471da024e41fbacc686d5f553588ea8473847cb871673ae106a3230` | The native subalgebra inherits a normed algebra when the ambient algebra is normed. |
| 262 | `mathlib:FiniteDimensional.complete` (theorem) | `Mathlib/Topology/Algebra/Module/FiniteDimension.lean:509` | `aae1cf2eb90fc1b11375074ec2bb8eccc904e3221d1ee4bfa65b806d971d9367` | Finite-dimensional completeness needs a complete nontrivially normed base, Hausdorff uniform module and continuous scalar action. |
| 263 | `mathlib:Algebra.charZero_of_charZero` (lemma) | `Mathlib/Algebra/Algebra/Basic.lean:387` | `851902371aa2dc7f9ee1f3041a6d1f4abe1e174164abcf55c59c266f52aaf031` | Characteristic zero transports through the faithful algebra map; faithfulness is part of the actual ambient context. |
| 264 | `mathlib:IntermediateField.algebra'` (instance) | `Mathlib/FieldTheory/IntermediateField/Basic.lean:408` | `1ddd696fbd51d9f38d6941e2761652bfe7fb88dccf1addab7b55e3a984d60d98` | The intermediate-field scalar algebra is restricted from a genuine compatible ambient tower. |
| 265 | `mathlib:IsScalarTower.of_algebraMap_eq` (theorem) | `Mathlib/Algebra/Algebra/Tower.lean:114` | `80c681c1674d180828b520f3533b549f302153ee5042c2e65ea7733c8c8c9e38` | Pointwise algebra-map composition supplies the scalar-tower instance. |
| 266 | `mathlib:IsBoundedSMul.of_norm_smul_le` (theorem) | `Mathlib/Analysis/Normed/MulAction.lean:77` | `cd7a02a58acf58c767b49c5cbd355b634656a39583aaa92c588518275394308d` | The norm scalar-product bound supplies bounded scalar action on the actual module. |
| 267 | `mathlib:IsUltrametricDist.subtype` (instance) | `Mathlib/Topology/MetricSpace/Ultra/Basic.lean:70` | `c1993f5790f1d61e0ecaea4d1ce82c0ef499b06368f961fd3a37a8f5408955f1` | The inherited subtype metric is ultrametric. |
| 268 | `mathlib:IntermediateField.continuousSMul` (instance) | `Mathlib/Topology/Algebra/IntermediateField.lean:27` | `fe963899c0b2fbb1bcc7e68eebf404300b3a40e5fdd509bc11f4f9a8adc3ae36` | The native intermediate field restricts a continuous ambient scalar action. |
| 269 | `mathlib:ContinuousMap` (structure) | `Mathlib/Topology/ContinuousMap/Defs.lean:33` | `f399f1505dacf24ed14005c2ab6acd8f20201dbc54992444eea1768ae9c9c9da` | ContinuousMap is the existing function with continuity certificate, not a new test carrier. |
| 270 | `mathlib:ContinuousMap.ext` (theorem) | `Mathlib/Topology/ContinuousMap/Defs.lean:114` | `f399f1505dacf24ed14005c2ab6acd8f20201dbc54992444eea1768ae9c9c9da` | Continuous-map extensionality is pointwise equality of their actual evaluations. |
| 271 | `mathlib:MulChar.isQuadratic_iff_sq_eq_one` (lemma) | `Mathlib/NumberTheory/MulChar/Basic.lean:558` | `05a81c647229cdc583070ef8a7789e905054e00efab1cad37b1e5fda04e43809` | Quadratic values are equivalent to square-principal for a nontrivial integral-domain coefficient ring. |
| 272 | `mathlib:IntermediateField.finiteDimensional_sup` (instance) | `Mathlib/FieldTheory/IntermediateField/Adjoin/Basic.lean:78` | `8c664a4e82492fe856642f7b55db4650986c13845a94712998da5d769cfbdc7b` | The native supremum of two finite-dimensional intermediate fields is finite-dimensional. |
| 273 | `mathlib:IntermediateField.inclusion` (def) | `Mathlib/FieldTheory/IntermediateField/Basic.lean:602` | `1ddd696fbd51d9f38d6941e2761652bfe7fb88dccf1addab7b55e3a984d60d98` | Intermediate-field inclusion is the existing algebra homomorphism to a containing field. |
| 274 | `mathlib:IntermediateField.coe_inclusion` (theorem) | `Mathlib/FieldTheory/IntermediateField/Basic.lean:619` | `1ddd696fbd51d9f38d6941e2761652bfe7fb88dccf1addab7b55e3a984d60d98` | The ambient value of native intermediate-field inclusion is definitionally unchanged. |
| 275 | `mathlib:IntermediateField.algebraMap_mem` (theorem) | `Mathlib/FieldTheory/IntermediateField/Basic.lean:153` | `1ddd696fbd51d9f38d6941e2761652bfe7fb88dccf1addab7b55e3a984d60d98` | Every intermediate field contains the actual base algebra-map image. |
| 276 | `mathlib:Nat.isCoprime_iff_coprime` (theorem) | `Mathlib/RingTheory/Coprime/Lemmas.lean:51` | `406ffe2fb9f644cf67c7aae6c95f386ccc322807a8708eb4b4e8f52811f9bc77` | Natural coprimality equals integer IsCoprime after casting. |
| 277 | `mathlib:DirichletCharacter.changeLevel_eq_cast_of_dvd'` (lemma) | `Mathlib/NumberTheory/DirichletCharacter/Basic.lean:108` | `f004670a9bedc23c4dfaeb61b90d5e613a6b604f9486640eb1ce4ae3699ef64e` | The integer change-level evaluation formula requires coprimality to the target modulus; nonunits need a separate case. |
| 278 | `mathlib:ZMod.finEquiv` (def) | `Mathlib/Data/ZMod/Basic.lean:45` | `fbe19ea6fc95105cf596e1ef3c730e32dffdf9f53b74a17eaab5c668e03d1b0f` | The finite ring equivalence from Fin n to ZMod n requires nonzero n. |
| 279 | `mathlib:ZMod.natCast_zmod_val` (theorem) | `Mathlib/Data/ZMod/Basic.lean:205` | `fbe19ea6fc95105cf596e1ef3c730e32dffdf9f53b74a17eaab5c668e03d1b0f` | Casting the canonical representative recovers an element at nonzero modulus. |
| 280 | `mathlib:ZMod.isUnit_prime_iff_not_dvd` (lemma) | `Mathlib/Data/ZMod/Basic.lean:825` | `fbe19ea6fc95105cf596e1ef3c730e32dffdf9f53b74a17eaab5c668e03d1b0f` | A prime is a residue-ring unit exactly when it does not divide the modulus. |
| 281 | `mathlib:mul_neg_geom_sum` (lemma) | `Mathlib/Algebra/Ring/GeomSum.lean:245` | `fa716192e3640a250181738b02d8be769b66d6dfb72fd955942cb158138134b4` | The geometric sum identity is finite and valid over rings without convergence assumptions. |
| 282 | `mathlib:PowerSeries.binomialSeries_nat` (lemma) | `Mathlib/RingTheory/PowerSeries/Binomial.lean:70` | `a6b92b59f164c0546bf4d2f332cf613103fde60b586d1476125ac3f8554e00f8` | Natural binomial series equals (1+X)^d over the displayed binomial-ring algebra. |
| 283 | `mathlib:PowerSeries.coeff_subst'` (theorem) | `Mathlib/RingTheory/PowerSeries/Substitution.lean:247` | `6442dc150c2f686e966a3645a5d23885cd69598ec7b117047f14dfa643dade16` | Admissible substitution coefficients are native finsums, reduced to finite ranges by an actual support proof. |
| 284 | `mathlib:PowerSeries.le_order_pow_of_constantCoeff_eq_zero` (theorem) | `Mathlib/RingTheory/PowerSeries/Order.lean:226` | `7d045704b9eed2f634accda12eb68d6efe3d790f74b043d328f4d2c9252a381b` | A zero constant coefficient forces order of the nth power at least n. |
| 285 | `mathlib:PowerSeries.coeff_of_lt_order` (theorem) | `Mathlib/RingTheory/PowerSeries/Order.lean:90` | `7d045704b9eed2f634accda12eb68d6efe3d790f74b043d328f4d2c9252a381b` | Coefficients strictly below order vanish. |
| 286 | `mathlib:finprod_eq_prod_of_mulSupport_subset` (theorem) | `Mathlib/Algebra/BigOperators/Finprod.lean:351` | `922c8db4353b1872ea2a6c010732450a6e20f28812bd343b93b371207f7a3621` | The finite-support product identity generates the additive finsum-to-finset restriction used here. |
| 287 | `mathlib:ContinuousMap.smul_apply'` (lemma) | `Mathlib/Topology/ContinuousMap/Algebra.lean:822` | `9c3ac0cc3b6fffb9911f3e0d9c39c59a9924aac2e2ed20555f5984bcf8addd86` | Continuous scalar-function action evaluates pointwise; it is distinct from constant-scalar action. |
| 288 | `mathlib:PadicInt.mul_inv` (theorem) | `Mathlib/NumberTheory/Padics/PadicIntegers.lean:361` | `5392888b7e9833f14ab600bd3a3944da1f341366da2f3de95cd9737a19b1ff3b` | The extended native p-adic inverse cancels only at norm-one elements. |
| 289 | `mathlib:Units.ext` (theorem) | `Mathlib/Algebra/Group/Units/Defs.lean:119` | `f35090c081e7903c719d1d77033bd1b443cc70a99ee4fb711dcaa2384508c77e` | Native unit equality is reflected by underlying value equality. |
| 290 | `mathlib:Nat.primeFactors` (def) | `Mathlib/Data/Nat/PrimeFin.lean:37` | `92a5630a19bff74ade4088f1253cf75b0ac8143c002e6b604ac0b77a39c9ecf6` | Prime support is a finset of primeFactorsList, removing multiplicities; kind corrected to def. |
| 291 | `mathlib:Nat.mem_primeFactors` (lemma) | `Mathlib/Data/Nat/PrimeFin.lean:41` | `92a5630a19bff74ade4088f1253cf75b0ac8143c002e6b604ac0b77a39c9ecf6` | Prime-support membership includes primality, divisibility and nonzero level. |
| 292 | `mathlib:Nat.primeFactors_mul` (lemma) | `Mathlib/Data/Nat/PrimeFin.lean:97` | `92a5630a19bff74ade4088f1253cf75b0ac8143c002e6b604ac0b77a39c9ecf6` | Prime support of a product is union when both factors are nonzero. |
| 293 | `mathlib:Nat.Prime.primeFactors` (lemma) | `Mathlib/Data/Nat/PrimeFin.lean:94` | `92a5630a19bff74ade4088f1253cf75b0ac8143c002e6b604ac0b77a39c9ecf6` | The prime support of a prime is its singleton. |
| 294 | `mathlib:induction_on_primes` (lemma) | `Mathlib/Data/Nat/Factorization/Induction.lean:84` | `a16cb40bc212255bc2e88aa12c773aead9a14c16d31b5a68979e7dfab038d538` | Native induction covers zero, one and prime multiplication, with admissibility encoded in the motive. |
| 295 | `mathlib:Finset.prod_powerset_insert` (lemma) | `Mathlib/Algebra/BigOperators/Group/Finset/Powerset.lean:32` | `83ef256b00eaabc046b2d245e2adc8c1576f7ab1aa25321266acbd7fdf864470` | The powerset insertion product lemma generates the required additive splitting of subsets. |
| 296 | `mathlib:Finset.prod_sub` (lemma) | `Mathlib/Algebra/BigOperators/Ring/Finset.lean:259` | `3260deb025880a9c56b258bc0d9c53106aab2452599141b1e1c8f5bb0f589aa3` | The product of differences is the exact signed powerset sum over a commutative ring. |
| 297 | `mathlib:DirichletCharacter.changeLevel_self` (lemma) | `Mathlib/NumberTheory/DirichletCharacter/Basic.lean:94` | `f004670a9bedc23c4dfaeb61b90d5e613a6b604f9486640eb1ce4ae3699ef64e` | Changing level to the same modulus preserves the actual character. |
| 298 | `mathlib:DirichletCharacter.changeLevel_trans` (lemma) | `Mathlib/NumberTheory/DirichletCharacter/Basic.lean:100` | `f004670a9bedc23c4dfaeb61b90d5e613a6b604f9486640eb1ce4ae3699ef64e` | Successive changes of level equal direct change, with the displayed orientation. |
| 299 | `mathlib:DirichletCharacter.conductor` (def) | `Mathlib/NumberTheory/DirichletCharacter/Basic.lean:246` | `f004670a9bedc23c4dfaeb61b90d5e613a6b604f9486640eb1ce4ae3699ef64e` | The conductor is the native infimum of inducing levels; kind corrected to def. |
| 300 | `mathlib:DirichletCharacter.conductor_dvd_level` (lemma) | `Mathlib/NumberTheory/DirichletCharacter/Basic.lean:251` | `f004670a9bedc23c4dfaeb61b90d5e613a6b604f9486640eb1ce4ae3699ef64e` | The native conductor divides the given level. |
| 301 | `mathlib:DirichletCharacter.conductor_ne_zero` (lemma) | `Mathlib/NumberTheory/DirichletCharacter/Basic.lean:255` | `f004670a9bedc23c4dfaeb61b90d5e613a6b604f9486640eb1ce4ae3699ef64e` | A nonzero level gives nonzero conductor. |
| 302 | `mathlib:DirichletCharacter.primitiveCharacter` (def) | `Mathlib/NumberTheory/DirichletCharacter/Basic.lean:307` | `f004670a9bedc23c4dfaeb61b90d5e613a6b604f9486640eb1ce4ae3699ef64e` | The native primitive character is the chosen inducing character at its conductor; kind corrected to def. |
| 303 | `mathlib:DirichletCharacter.changeLevel_primitiveCharacter` (theorem) | `Mathlib/NumberTheory/DirichletCharacter/Basic.lean:310` | `f004670a9bedc23c4dfaeb61b90d5e613a6b604f9486640eb1ce4ae3699ef64e` | Native recovery changes that primitive character back to the original level. |
| 304 | `mathlib:DirichletCharacter.primitiveCharacter_isPrimitive` (lemma) | `Mathlib/NumberTheory/DirichletCharacter/Basic.lean:314` | `f004670a9bedc23c4dfaeb61b90d5e613a6b604f9486640eb1ce4ae3699ef64e` | The native primitive character is primitive, including the separately handled zero-conductor branch. |
| 305 | `mathlib:IsUnit.mul_iff` (theorem) | `Mathlib/Algebra/Group/Units/Defs.lean:481` | `f35090c081e7903c719d1d77033bd1b443cc70a99ee4fb711dcaa2384508c77e` | Unit-product equivalence needs a Dedekind-finite monoid, supplied by the commutative field. |
| 306 | `mathlib:AbstractMeasure.map_id` (lemma) | `Mathlib/NumberTheory/Padics/Measure/Basic.lean:116` | `a57b5c37369359b0f68ac7efef6f779d6f50ea0f85a88a165ca1991e0c348507` | Native pushforward by identity preserves the measure definitionally. |
| 307 | `mathlib:Units.coeHom` (def) | `Mathlib/Algebra/Group/Units/Hom.lean:111` | `b1ffc13bd4c6adcc882de5014ca832bb5c1038b14ecce2f679ac2ccef9097181` | The native unit value map is a monoid homomorphism preserving finite products; kind corrected to def. |
| 308 | `mathlib:Nat.dvd_of_mem_primeFactors` (lemma) | `Mathlib/Data/Nat/PrimeFin.lean:65` | `92a5630a19bff74ade4088f1253cf75b0ac8143c002e6b604ac0b77a39c9ecf6` | Every member of the prime-support finset divides the original level. |
| 309 | `mathlib:Nat.Prime.not_dvd_mul` (theorem) | `Mathlib/Data/Nat/Prime/Basic.lean:153` | `b71a7d5f51c626ae6b70cbe36bab7b77a691f9a214373cfb98e170bd7e6f9aeb` | A prime dividing neither factor divides no product; kind corrected to theorem. |
| 310 | `mathlib:Finset.prod_div_distrib` (theorem) | `Mathlib/Algebra/BigOperators/Group/Finset/Defs.lean:679` | `e935efa96ad9381658f3158f900d04589c46d7e933cab15f4d8632e1af85527f` | Finite products distribute division in a division commutative monoid; kind corrected to theorem. |
| 311 | `mathlib:Nat.cast_prod` (lemma) | `Mathlib/Algebra/BigOperators/Ring/Finset.lean:342` | `3260deb025880a9c56b258bc0d9c53106aab2452599141b1e1c8f5bb0f589aa3` | Natural cast preserves finite products into a commutative semiring. |
| 312 | `mathlib:AddChar.sum_mulShift` (theorem) | `Mathlib/NumberTheory/LegendreSymbol/AddCharacter.lean:258` | `19b06c1956274e1e66ecafbcf1c0436fb44af084eac2e903cbcd1271140d808d` | Additive orthogonality applies to a finite commutative source ring and domain coefficient ring; kind corrected to theorem. |
| 313 | `mathlib:AddChar.zmodChar_primitive_of_primitive_root` (theorem) | `Mathlib/NumberTheory/LegendreSymbol/AddCharacter.lean:184` | `19b06c1956274e1e66ecafbcf1c0436fb44af084eac2e903cbcd1271140d808d` | A native primitive root gives a primitive additive residue character at nonzero modulus; kind corrected to theorem. |
| 314 | `mathlib:AddChar.norm_apply` (lemma) | `Mathlib/Analysis/Normed/Ring/Finite.lean:36` | `1d4fc7f0391407088a700e023887f2c31496610a8794f03f46f56c2e3e4c5da5` | Finite additive-character values have norm one with multiplicative norm and norm-one law. |
| 315 | `mathlib:Valuation.Integers.isUnit_iff_valuation_eq_one` (lemma) | `Mathlib/RingTheory/Valuation/Integers.lean:160` | `98b94deb6e79f1cfdc1b61a95670b335023aac26f961a333226c383ac893ade7` | Native integer-ring units are exactly the elements with field-image valuation one. |
| 316 | `mathlib:ZMod.val` (def) | `Mathlib/Data/ZMod/Basic.lean:57` | `fbe19ea6fc95105cf596e1ef3c730e32dffdf9f53b74a17eaab5c668e03d1b0f` | Residue values use least natural representatives at positive modulus and integer absolute value at zero. |
| 317 | `mathlib:PadicInt.ker_toZMod` (theorem) | `Mathlib/NumberTheory/Padics/RingHoms.lean:327` | `93ba84a94f41b266b73aaaab58a34982d0cb61cfb5bea592d05cb01ab31113c6` | The actual p-adic reduction kernel is the native maximal ideal. |
| 318 | `mathlib:PadicInt.toZMod` (def) | `Mathlib/NumberTheory/Padics/RingHoms.lean:300` | `93ba84a94f41b266b73aaaab58a34982d0cb61cfb5bea592d05cb01ab31113c6` | The concrete reduction to ZMod p is a ring map; its representative casts to Zp are not general ring maps. |
| 319 | `mathlib:LinearMap` (structure) | `Mathlib/Algebra/Module/LinearMap/Defs.lean:85` | `242ce4f144fbc775bc424e6b9e088f583fb485fa72f89135d157b5586a987ae7` | LinearMap is the existing bundled semilinear map, specializing to linearity for the identity ring map. |
| 320 | `mathlib:Nat.totient_prime` (theorem) | `Mathlib/Data/Nat/Totient.lean:216` | `0b71be7c52540d06698cfc05437fbdbb07acfc9fe59bb1ad3255359d62b460c8` | The prime totient is p-1, distinct from the separate dyadic modulus-four calculation. |
| 321 | `mathlib:Polynomial.continuous` (theorem) | `Mathlib/Topology/Algebra/Polynomial.lean:57` | `d78fd83744050fc71be1b8649b5bfab2f61fd66ac486c2a9a355ce921b4e610d` | Native polynomial evaluation is continuous in a topological semiring. |
| 322 | `mathlib:Finset.prod_range` (theorem) | `Mathlib/Algebra/BigOperators/Fin.lean:39` | `4fe78cba9cdeac4eb8badbdd6359b055031900906fb94f3e51aba6d81451dbd5` | The native finite-range product equals the product over Fin n and generates the additive counterpart. |
| 323 | `mathlib:orderOf` (def) | `Mathlib/GroupTheory/OrderOfElement.lean:182` | `338cd8fd86078ff1c852185399474d85bd2d11218c7c8c79a229cf21296e4650` | Native element order is minimal period, with zero representing infinite order. |
| 324 | `mathlib:DirichletCharacter.IsPrimitive` (def) | `Mathlib/NumberTheory/DirichletCharacter/Basic.lean:292` | `f004670a9bedc23c4dfaeb61b90d5e613a6b604f9486640eb1ce4ae3699ef64e` | Native primitivity means conductor equals level. |
| 325 | `mathlib:DirichletCharacter.conductor_changeLevel` (theorem) | `Mathlib/NumberTheory/DirichletCharacter/Basic.lean:364` | `f004670a9bedc23c4dfaeb61b90d5e613a6b604f9486640eb1ce4ae3699ef64e` | Native conductor invariance under level change needs nonzero target level; kind corrected to theorem. |
| 326 | `mathlib:DirichletCharacter.conductor_mul_dvd_lcm_conductor` (theorem) | `Mathlib/NumberTheory/DirichletCharacter/Basic.lean:433` | `f004670a9bedc23c4dfaeb61b90d5e613a6b604f9486640eb1ce4ae3699ef64e` | Product conductor divides the lcm of conductors; arbitrary equality is not asserted. Kind corrected to theorem. |

## Individual supplier-contract ledger

| Fine contract | Packet | Exact contract assessment |
| --- | --- | --- |
| `DirichletPadicLFunctions:L0/normalized-mellin-entire` | `research/blueprint/packets/DirichletPadicLFunctions--L0.json` | The exact supplied continuation uses local fixed admissible shifts, within smoothness and order-dependent positive decay rates. Its complex-valued extension is explicit and matches the L2 kernel hypotheses. |
| `DirichletPadicLFunctions:L0/normalized-mellin-initial-halfplane` | `research/blueprint/packets/DirichletPadicLFunctions--L0.json` | The native normalized continuation agrees with the convergent Gamma quotient only on Re(s)>0. |
| `DirichletPadicLFunctions:L0/normalized-mellin-negative-values` | `research/blueprint/packets/DirichletPadicLFunctions--L0.json` | The supplied endpoint integration-by-parts route yields exactly (-1)^n times the within derivative, including n=0. |
| `DirichletPadicLFunctions:L0/smooth-bernoulli-analytic` | `research/blueprint/packets/DirichletPadicLFunctions--L0.json` | The real divided difference is analytic at zero and away, and is everywhere nonzero before inversion. No entire complex kernel is claimed. |
| `DirichletPadicLFunctions:L0/smooth-bernoulli-away` | `research/blueprint/packets/DirichletPadicLFunctions--L0.json` | The punctured-line quotient identity has the nonzero real argument hypothesis needed by L2. |
| `DirichletPadicLFunctions:L0/smooth-bernoulli-derivatives` | `research/blueprint/packets/DirichletPadicLFunctions--L0.json` | The derivative recurrence agrees with native ordinary Bernoulli recurrence, including B1=-1/2; cancellation is in R. |
| `DirichletPadicLFunctions:L0/smooth-bernoulli-kernel` | `research/blueprint/packets/DirichletPadicLFunctions--L0.json` | The existing native dslope reciprocal supplies the distinguished globally continuous real extension, with origin1 rather than the literal totalized quotient0. Its advertised complex inclusion does not change the real derivative field. |
| `DirichletPadicLFunctions:L0/smooth-bernoulli-zero` | `research/blueprint/packets/DirichletPadicLFunctions--L0.json` | Native exp derivative at zero makes the divided-difference denominator1, so beta(0)=1. |
| `DirichletPadicLFunctions:L0/weighted-exponential-derivative` | `research/blueprint/packets/DirichletPadicLFunctions--L0.json` | The exact supplier uses a summable derivative majorant on a strictly positive open interval and convergence at a point, matching the L2 termwise-differentiation proof. |
| `DirichletPadicLFunctions:L0/weighted-exponential-halfline-bound` | `research/blueprint/packets/DirichletPadicLFunctions--L0.json` | The explicit termwise inequality and summability yield the stated positive-cutoff bound, with no uniform-in-order or cutoff-zero claim. |
| `DirichletPadicLFunctions:L1/arithmetic-pseudomeasure-numerator` | `research/blueprint/packets/DirichletPadicLFunctions--L1.json` | The exact supplier compares cleared numerators as actual unit-domain measures, using the native total quotient localization and its injectivity. It explicitly assumes no domain structure or field structure on the localization. |
| `DirichletPadicLFunctions:L1/intrinsic-numerator-extension-inclusion` | `research/blueprint/packets/DirichletPadicLFunctions--L1.json` | The coefficient/inclusion square concerns the exact ambient and unit-domain extensions, with full receiver completeness, ultrametric and bounded scalar hypotheses. No additive convolution or completed-algebra map is inferred. |
| `DirichletPadicLFunctions:L1/measure-one` | `research/blueprint/packets/DirichletPadicLFunctions--L1.json` | The a=1 integral smoothing measure is zero by its zero series and Amice injectivity; this does not permit division by its zero pseudomeasure denominator. |
| `DirichletPadicLFunctions:L1/measure-ordinary-moment` | `research/blueprint/packets/DirichletPadicLFunctions--L1.json` | The integral measure is evaluated before embedding its value into Q_p. The supplied exact moment-exp comparison retains the ordinary rather than Mahler test and uses no Q->Z_p exponential coefficients. |
| `DirichletPadicLFunctions:L1/padic-intrinsic-natural` | `research/blueprint/packets/DirichletPadicLFunctions--L1.json` | Equality of the actual p-adic unit with its admissible natural value identifies the two intrinsic numerator constructions under the same restriction operation. |
| `DirichletPadicLFunctions:L1/smoothed-extension-amice` | `research/blueprint/packets/DirichletPadicLFunctions--L1.json` | The supplied comparison applies to the actual extension of the Zp-valued smoothed measure under completeness, ultrametric norm and bounded scalar action. It identifies its Amice transform with the coefficient-mapped series; it does not assert an inverse Amice equivalence over every target ring. |
| `DirichletPadicLFunctions:L1/smoothed-measure` | `research/blueprint/packets/DirichletPadicLFunctions--L1.json` | The supplier constructs the native Zp measure using the native inverse Amice equivalence, including p=2. Its smoothing cocycle, reflection and ordinary-moment laws concern the actual measure and distinguish Mahler from ordinary moments. It supplies no additional KL pseudomeasure constructor. |
| `DirichletPadicLFunctions:L1/smoothed-numerator` | `research/blueprint/packets/DirichletPadicLFunctions--L1.json` | The intrinsic numerator is inverse-weight restriction of the actual smoothed measure, equivalently of its Euler-depleted part. Positive moments have the degree shift and Euler factor 1-p^(k-1); no extra smoothing scalar is inserted after inverse weighting. |
| `DirichletPadicLFunctions:L1/smoothing-denominator` | `research/blueprint/packets/DirichletPadicLFunctions--L1.json` | The native PowerSeries construction q_a has coefficient choose(a,n+1), with T*q_a=Y^a-1. Its zero, one and two cases and coefficient-map laws match the L2 finite rational construction without dividing by T. |
| `DirichletPadicLFunctions:L1/smoothing-geometric-cancellation` | `research/blueprint/packets/DirichletPadicLFunctions--L1.json` | The finite geometric identity Q_a(Y)*F_a=B_a(Y) is proved through multiplication by T and native X_mul_cancel, valid over an arbitrary commutative ring. It uses neither a domain nor an infinite geometric evaluation at a root of unity. |
| `DirichletPadicLFunctions:L1/unit-smoothed-measure` | `research/blueprint/packets/DirichletPadicLFunctions--L1.json` | The actual integral ambient unit restriction is E mu, defined independently of averaging. Euler and moment APIs are separate arithmetic laws; the numeric target tests are correctly marked unchecked rather than implemented evidence. |
| `DirichletPadicLFunctions:L1/unit-smoothed-moment` | `research/blueprint/packets/DirichletPadicLFunctions--L1.json` | The ordinary degree-k moment is (1-p^k)(1-a^(k+1))*B_(k+1)/(k+1) after evaluation and embedding in Qp. Degree zero is zero; the displayed first and third moments match the ordinary Bernoulli convention. |
| `PadicMeasuresIwasawaAlgebras:L0/clopen-zero-extension-inside` | `research/blueprint/packets/PadicMeasuresIwasawaAlgebras.json` | Native clopen gluing returns the original continuous test at subtype points of the clopen set; the compactness assumptions make the test norm well-defined without nonemptiness. |
| `PadicMeasuresIwasawaAlgebras:L0/clopen-zero-extension-outside` | `research/blueprint/packets/PadicMeasuresIwasawaAlgebras.json` | The same clopen gluing is identically zero on the complementary piece, so a nonempty complement does not preserve a nonzero constant test. |
| `PadicMeasuresIwasawaAlgebras:L1/character-integral-algebra-hom` | `research/blueprint/packets/PadicMeasuresIwasawaAlgebras.json` | With matching coefficient ring and a native continuous monoid character, right-handed convolution evaluates multiplicatively by pulling scalar factors through the two duals. The construction needs no Fubini interchange and supplies an algebra homomorphism only for D(G,R) into R. |
| `PadicMeasuresIwasawaAlgebras:L1/finite-projection-coefficient` | `research/blueprint/packets/PadicMeasuresIwasawaAlgebras.json` | The native finite coefficient is the mass of the exact fiber indicator and includes empty fibers. The receiver is a finite Finsupp without an implicit multiplication or topology. |
| `PadicMeasuresIwasawaAlgebras:L1/finite-projection-mass` | `research/blueprint/packets/PadicMeasuresIwasawaAlgebras.json` | The finite pairing with constant one gives total mass independently of the quotient, with no normalized counting measure or convolution claim. |
| `PadicMeasuresIwasawaAlgebras:L1/finite-projection-pairing` | `research/blueprint/packets/PadicMeasuresIwasawaAlgebras.json` | The finite indicator decomposition gives the exact pullback pairing for all finite functions, including empty domains. Only finite linearity is used, with no infinite rearrangement. |
| `PadicMeasuresIwasawaAlgebras:L1/integer-reduction-continuity` | `research/blueprint/packets/PadicMeasuresIwasawaAlgebras.json` | The exact reduction map is continuous because its kernel norm bound makes it locally constant, including level zero and p=2. This does not rely on automatic continuity of arbitrary ring homomorphisms. |
| `PadicMeasuresIwasawaAlgebras:L2/algebra-ordinary-moment` | `research/blueprint/packets/PadicMeasuresIwasawaAlgebras.json` | The requested K-valued ordinary-moment law is already supplied over a more general normed coefficient algebra with continuous Zp action. Iterated weighting and Amice mass give the constant Mahler-derivative coefficient; no inverse transform, scalar extension or characteristic-zero hypothesis is needed. |
| `PadicMeasuresIwasawaAlgebras:L2/algebra-ordinary-moment-exp` | `research/blueprint/packets/PadicMeasuresIwasawaAlgebras.json` | The actual ordinary-moment law combines with formal exponential substitution over the same target rational algebra. The parameter exp(T)-1 has zero constant coefficient and the factorial factor is essential. No Q-to-Zp tower or p-adic exponential evaluation is used. |
| `PadicMeasuresIwasawaAlgebras:L2/bounded-inverse` | `research/blueprint/packets/PadicMeasuresIwasawaAlgebras.json` | The supplier constructs an actual native measure from a bounded coefficient sequence via its convergent Mahler pairing and homogeneous all-test bound. Complete ultrametric ring and bounded Zp action are retained; arbitrary formal series over a field are not inputs. |
| `PadicMeasuresIwasawaAlgebras:L2/bounded-inverse-amice` | `research/blueprint/packets/PadicMeasuresIwasawaAlgebras.json` | Coefficient extensionality and the actual Mahler values prove that the existing transform of the constructed measure is precisely mk of the bounded sequence. |
| `PadicMeasuresIwasawaAlgebras:L2/bounded-inverse-norm` | `research/blueprint/packets/PadicMeasuresIwasawaAlgebras.json` | The field-valued continuous-dual operator norm equals the bounded sequence norm using the all-test upper bound and norm-one Mahler tests for the reverse bound. The nontrivially normed field receiver is retained. |
| `PadicMeasuresIwasawaAlgebras:L2/bounded-inverse-unique` | `research/blueprint/packets/PadicMeasuresIwasawaAlgebras.json` | The exact native general Amice injectivity under the complete ultrametric ring and bounded-action hypotheses gives uniqueness of the actual bounded inverse measure. |
| `PadicMeasuresIwasawaAlgebras:L2/coefficient-extension-test-function` | `research/blueprint/packets/PadicMeasuresIwasawaAlgebras.json` | Coefficient extension pairs actual image-valued continuous tests with the original measure and commutes with finite sums; it does not say every target test has a Zp-valued preimage. |
| `PadicMeasuresIwasawaAlgebras:L2/coefficient-extension-weight` | `research/blueprint/packets/PadicMeasuresIwasawaAlgebras.json` | Coefficient extension commutes with actual integral continuous weights by its defining Mahler characterization. |
| `PadicMeasuresIwasawaAlgebras:L2/exp-coefficient` | `research/blueprint/packets/PadicMeasuresIwasawaAlgebras.json` | The formal exponential coefficient equals the Mahler derivative divided by k factorial over a rational algebra; no analytic exponential is invoked. |
| `PadicMeasuresIwasawaAlgebras:L2/integral-coefficient-extension` | `research/blueprint/packets/PadicMeasuresIwasawaAlgebras.json` | Actual integral coefficient extension is built from a bounded inverse Amice sequence and supplies zero, addition, scalars, self, Dirac, maps and weights. |
| `PadicMeasuresIwasawaAlgebras:L2/integral-coefficient-image-bound` | `research/blueprint/packets/PadicMeasuresIwasawaAlgebras.json` | The integral-image bound needs bounded Zp action and the native Zp bound, rather than extra completeness assumptions. |
| `PadicMeasuresIwasawaAlgebras:L2/integral-extension-unit-projector` | `research/blueprint/packets/PadicMeasuresIwasawaAlgebras.json` | The supported coefficient extension commutes with the unit projector, which cuts all nonunits including nonzero p. |
| `PadicMeasuresIwasawaAlgebras:L2/integral-unit-coefficient-extension` | `research/blueprint/packets/PadicMeasuresIwasawaAlgebras.json` | The intrinsic unit coefficient extension is restriction after actual inclusion and coefficient extension; its linear APIs do not supply convolution multiplicativity. |
| `PadicMeasuresIwasawaAlgebras:L2/intrinsic-unit-extension-projector` | `research/blueprint/packets/PadicMeasuresIwasawaAlgebras.json` | Unit inclusion after restriction is the actual supported projector, using the clopen complement and homeomorphism. |
| `PadicMeasuresIwasawaAlgebras:L2/intrinsic-unit-restriction` | `research/blueprint/packets/PadicMeasuresIwasawaAlgebras.json` | The native unit restriction uses homeomorphism transport of clopen restriction, with the expected unit and nonunit atom laws. |
| `PadicMeasuresIwasawaAlgebras:L2/intrinsic-unit-restriction-evaluation` | `research/blueprint/packets/PadicMeasuresIwasawaAlgebras.json` | The restriction pairing explicitly transports a unit test through the inverse homeomorphism before extending it by zero. |
| `PadicMeasuresIwasawaAlgebras:L2/intrinsic-unit-restriction-section` | `research/blueprint/packets/PadicMeasuresIwasawaAlgebras.json` | The actual unit restriction is a left inverse of unit inclusion on all tests, so inclusion is injective with no p normalization. |
| `PadicMeasuresIwasawaAlgebras:L2/inverse-weight-evaluation` | `research/blueprint/packets/PadicMeasuresIwasawaAlgebras.json` | The inverse-weight pairing is integral-coefficient weighting by the actual extended native unit inverse, rather than field inversion at zero. |
| `PadicMeasuresIwasawaAlgebras:L2/mahler-dilation` | `research/blueprint/packets/PadicMeasuresIwasawaAlgebras.json` | Mahler dilation is a finite coefficient identity proved on dense natural points and extended by the Hausdorff equalizer law. |
| `PadicMeasuresIwasawaAlgebras:L2/padic-unit-inverse-continuity` | `research/blueprint/packets/PadicMeasuresIwasawaAlgebras.json` | Extended p-adic unit inverse is continuous at units by native ring inversion and at nonunits because it is locally constant zero there. |
| `PadicMeasuresIwasawaAlgebras:L2/padic-unit-inverse-identification` | `research/blueprint/packets/PadicMeasuresIwasawaAlgebras.json` | The existing p-adic inverse equals native Ring.inverse both on units and nonunits. |
| `PadicMeasuresIwasawaAlgebras:L2/phi-evaluation` | `research/blueprint/packets/PadicMeasuresIwasawaAlgebras.json` | Frobenius measure pushforward pulls tests back along multiplication by p. |
| `PadicMeasuresIwasawaAlgebras:L2/phi-psi` | `research/blueprint/packets/PadicMeasuresIwasawaAlgebras.json` | Phi after psi is the projector onto p-multiples; multiplication followed by division agrees only on that locus. |
| `PadicMeasuresIwasawaAlgebras:L2/psi-evaluation` | `research/blueprint/packets/PadicMeasuresIwasawaAlgebras.json` | Psi evaluates the characteristic-weighted pullback and has mass mu(chi), with no factor 1/p. |
| `PadicMeasuresIwasawaAlgebras:L2/unit-inclusion-operator-norm` | `research/blueprint/packets/PadicMeasuresIwasawaAlgebras.json` | Unit inclusion preserves field-valued operator norm through the homeomorphism and clopen-inclusion norm equality. |
| `PadicMeasuresIwasawaAlgebras:L2/unit-restriction` | `research/blueprint/packets/PadicMeasuresIwasawaAlgebras.json` | Unit restriction is the linear projector id-P; it kills both zero and p atoms, not just zero. |
| `PadicMeasuresIwasawaAlgebras:L2/unit-restriction-dilation` | `research/blueprint/packets/PadicMeasuresIwasawaAlgebras.json` | Unit dilation preserves the p-divisibility indicator, so actual restriction commutes with dilation for any normed commutative coefficient ring. |
| `PadicMeasuresIwasawaAlgebras:L2/unit-restriction-evaluation` | `research/blueprint/packets/PadicMeasuresIwasawaAlgebras.json` | The actual unit projector pairs with the multiplier 1-chi. |
| `PadicMeasuresIwasawaAlgebras:L2/unit-support-psi` | `research/blueprint/packets/PadicMeasuresIwasawaAlgebras.json` | The unit-supported condition is equivalent to psi zero using phi-psi, without coefficient division by p. |
| `PadicMeasuresIwasawaAlgebras:L2/weight` | `research/blueprint/packets/PadicMeasuresIwasawaAlgebras.json` | Weighting uses the existing continuous dual and continuous multiplication over a compact domain and normed commutative coefficient ring. |
| `PadicMeasuresIwasawaAlgebras:L2/weight-evaluation` | `research/blueprint/packets/PadicMeasuresIwasawaAlgebras.json` | The weight pairing follows from transported composition and is definitionally mu(g*f). |
| `PadicMeasuresIwasawaAlgebras:L2/weight-multiplication` | `research/blueprint/packets/PadicMeasuresIwasawaAlgebras.json` | Iterated weighting multiplies functions; commutativity changes the evaluation h*(g*f) into (g*h)*f. |
| `PadicMeasuresIwasawaAlgebras:L2/weight-pushforward` | `research/blueprint/packets/PadicMeasuresIwasawaAlgebras.json` | Pushforward commutes with the correctly pulled-back weight on compact source and target. |
| `PadicMeasuresIwasawaAlgebras:L3/admissible-evaluation-spec` | `research/blueprint/packets/PadicMeasuresIwasawaAlgebras.json` | Admissible pseudomeasure evaluation cancels only a mapped unit clearing factor in the stated target algebra. |
| `PadicMeasuresIwasawaAlgebras:L3/cleared-numerator-spec` | `research/blueprint/packets/PadicMeasuresIwasawaAlgebras.json` | Cleared numerator has exactly the source-sign identity i(n_g)=i(c_g)*z in the total quotient algebra. |
| `PadicMeasuresIwasawaAlgebras:L3/independence-of-clearing-factor` | `research/blueprint/packets/PadicMeasuresIwasawaAlgebras.json` | Clearing-factor independence uses the cross-numerator relation and cancellation of both mapped units, without a map from the whole quotient ring. |
| `QSeriesPartitionsAndMockModularForms:QM.5/hurwitz-zeta-at-zero` | `research/blueprint/packets/QSeriesPartitionsAndMockModularForms.json` | The degree-zero Hurwitz formula uses (0,1] representatives; zero modulo one has value -1/2 and is not substituted into the false endpoint formula. |
| `QSeriesPartitionsAndMockModularForms:QM.5/periodic-l-value-bernoulli` | `research/blueprint/packets/QSeriesPartitionsAndMockModularForms.json` | Periodic Bernoulli special values reindex zero to endpoint M. Positive degrees use B_k(0)=B_k(1), and weight one uses the separate Hurwitz endpoint theorem. |

The two requested stage scopes PMIA L2 and L3 were read separately. Their existing incomplete planning status does not imply that either newly requested generic contract has already been implemented.

## Named typed-test ledger

Every line number below is in the reviewed 6,706-line L2 suggested file. An entry verifies the packet-to-source mapping and the reviewed intended behavior. No entry claims a compiled test.

| Test name | Node | Kind | Marker / typed example line | Intended check |
| --- | --- | --- | ---: | --- |
| `SuggestedCharacterTwistTests.positive_level_zero` | `DirichletPadicLFunctions:L2/prime-power-character` | degenerate | 203 / 204 | At p=3,n=2 every lifted character vanishes at0. |
| `SuggestedCharacterTwistTests.principal_unit_and_nonunit` | `DirichletPadicLFunctions:L2/prime-power-character` | computation | 206 / 207 | The principal character at modulus3 is1 at the p-adic unit1 and0 at the nonunit3. |
| `SuggestedCharacterTwistTests.zero_level_zero` | `DirichletPadicLFunctions:L2/prime-power-character` | non-example | 210 / 211 | At p=3,n=0 every lifted character equals1 at0; positive-level support cannot be extended to n=0. |
| `SuggestedCharacterTwistTests.dyadic_sign` | `DirichletPadicLFunctions:L2/prime-power-character` | computation | 213 / 214 | The principal character at modulus4 evaluates to1 at the dyadic unit−1. |
| `SuggestedCharacterTwistTests.inverse_product_unit` | `DirichletPadicLFunctions:L2/prime-power-character` | compatibility | 216 / 217 | At p=3,n=1, χχ⁻¹ lifts to1 at2 and0 at3; inverse twisting does not recover a globally constant multiplier. |
| `SuggestedCharacterTwistTests.positive_level_change` | `DirichletPadicLFunctions:L2/prime-power-character` | compatibility | 220 / 221 | Changing a character from modulus3 to modulus9 gives the same function on Z_3. |
| `SuggestedCharacterTwistTests.zero_smoothing` | `DirichletPadicLFunctions:L2/twisted-smoothed-measure` | degenerate | 227 / 228 | At p=3,a=1 every modulus3 character twist is zero. |
| `SuggestedCharacterTwistTests.principal_positive_moment` | `DirichletPadicLFunctions:L2/twisted-smoothed-measure` | computation | 230 / 231 | Over Q_3, at p=3,a=2, the principal modulus3 twist has first moment1/2. |
| `SuggestedCharacterTwistTests.principal_zero_level_moment` | `DirichletPadicLFunctions:L2/twisted-smoothed-measure` | non-example | 234 / 235 | Over Q_3, at p=3,a=2, the modulus1 twist has first moment−1/4, different from the positive-level principal twist. |
| `SuggestedCharacterTwistTests.dyadic_principal_moment` | `DirichletPadicLFunctions:L2/twisted-smoothed-measure` | computation | 238 / 239 | Over Q_2, at p=2,a=3, the principal modulus2 twist has first moment2/3. |
| `SuggestedCharacterTwistTests.inverse_twist_unit_projection` | `DirichletPadicLFunctions:L2/twisted-smoothed-measure` | compatibility | 242 / 243 | Over Q_3, at p=3,a=2, twisting the modulus3 χ-twist again by χ⁻¹ recovers I_Qρ_2, the unit projection of the smoothed measure. |
| `SuggestedTameTests.quadratic_numerator` | `DirichletPadicLFunctions:L2/tame-numerator` | computation | 374 / 375 | For the quadratic character modulo3 over Q, Q_η=1+T. |
| `SuggestedTameTests.principal_numerator` | `DirichletPadicLFunctions:L2/tame-numerator` | non-example | 378 / 379 | For the principal character modulo3 over Q, Q_1=−3−T; its uncancelled Dirichlet numerator has nonzero value2 at Y=1. |
| `SuggestedTameTests.modulus_one_numerator` | `DirichletPadicLFunctions:L2/tame-numerator` | degenerate | 381 / 382 | The modulus-one numerator is0. |
| `SuggestedTameTests.numerator_field_extension` | `DirichletPadicLFunctions:L2/tame-numerator` | compatibility | 384 / 385 | Mapping a modulo3 numerator from Q to Q_2 equals the numerator of the mapped native character. |
| `SuggestedTameTests.quadratic_coefficients` | `DirichletPadicLFunctions:L2/tame-series` | computation | 389 / 390 | For quadratic η modulo3, F_η=(1+T)/(3+3T+T²), with coefficients1/3,0,−1/9,1/9 in degrees0,1,2,3. |
| `SuggestedTameTests.principal_generating_failure` | `DirichletPadicLFunctions:L2/tame-series` | non-example | 394 / 395 | For the principal character modulo3 over Q, (1−Y³)F_1 is not Y+Y²: evaluate constant coefficients to get0 versus2. |
| `SuggestedTameTests.modulus_one_series` | `DirichletPadicLFunctions:L2/tame-series` | degenerate | 399 / 400 | The modulus-one series is0 and does not represent the trivial Dirichlet series. |
| `SuggestedTameTests.wild_norm_failure` | `DirichletPadicLFunctions:L2/tame-series` | non-example | 402 / 403 | At p=3 for quadratic η modulo3, the constructor still exists over Q_3 but its constant coefficient1/3 has norm3, so the tame bound fails. |
| `SuggestedTameTests.dyadic_sequence_value` | `DirichletPadicLFunctions:L2/tame-coefficient-sequence` | computation | 406 / 407 | For quadratic η modulo3 at p=2, c_η(3)=1/9. |
| `SuggestedTameTests.dyadic_sequence_norm` | `DirichletPadicLFunctions:L2/tame-coefficient-sequence` | compatibility | 411 / 412 | For every character modulo3 at p=2, the actual sequence norm is at most1. |
| `SuggestedTameTests.modulus_one_sequence` | `DirichletPadicLFunctions:L2/tame-coefficient-sequence` | degenerate | 415 / 416 | At modulus1 the entire bounded sequence is0. |
| `SuggestedTameTests.dyadic_measure_mass` | `DirichletPadicLFunctions:L2/tame-measure` | computation | 419 / 420 | For quadratic η modulo3 at p=2, the actual K=Q_2 measure has mass1/3. |
| `SuggestedTameTests.dyadic_measure_moment_two` | `DirichletPadicLFunctions:L2/tame-measure` | computation | 424 / 425 | For the same measure, the second ordinary moment is−2/9, obtained as2f_2+f_1 from its Amice coefficients. |
| `SuggestedTameTests.modulus_one_measure` | `DirichletPadicLFunctions:L2/tame-measure` | degenerate | 429 / 430 | The modulus-one constructor is the zero actual measure. |
| `SuggestedGaussTests.principal_fourier_failure` | `DirichletPadicLFunctions:L2/tame-gauss-generating` | non-example | 483 / 484 | For the principal character modulo3 over Q, the proposed primitive Fourier identity at frequency0 has left side2 and right side0, independent of ε. |
| `SuggestedGaussTests.zero_gauss_normalization` | `DirichletPadicLFunctions:L2/tame-gauss-generating` | degenerate | 488 / 489 | If the normalization scalar G is replaced by0, the totalized normalized Gauss expression is0; this cannot justify cancelling G. |
| `SuggestedGaussTests.quadratic_gauss_denominator` | `DirichletPadicLFunctions:L2/tame-gauss-series` | computation | 494 / 495 | For a characteristic-zero field and primitive quadratic η modulo3 with η(2)=−1, the Gauss expression satisfies (3+3T+T²)S=1+T, retaining the primitive-root and nonzero-Gauss hypotheses. |
| `SuggestedGaussTests.principal_not_primitive` | `DirichletPadicLFunctions:L2/tame-gauss-series` | non-example | 503 / 504 | The principal character modulo3 over Q is not primitive, so it is outside this comparison. |
| `SuggestedGaussTests.quadratic_gauss_cubic` | `DirichletPadicLFunctions:L2/tame-gauss-coefficients` | computation | 506 / 507 | For quadratic η modulo3 over any characteristic-zero field, the tame kernel cubic coefficient is+1/9, consistent with the alternating Gauss formula. |
| `SuggestedGaussTests.zero_constant_inverse` | `DirichletPadicLFunctions:L2/tame-gauss-coefficients` | degenerate | 511 / 512 | At α=1 the totalized inverse of C(α)(1+T)−1 is0 in K[[T]]. |
| `SuggestedGaussTests.actual_measure_gauss` | `DirichletPadicLFunctions:L2/tame-gauss-measure` | compatibility | 514 / 515 | Under the exact measure and primitive-Gauss hypotheses, the constant coefficient of the actual measure transform is−G⁻¹Σ_aη⁻¹(a)/(ε^(a.val)−1). |
| `SuggestedGaussTests.primitive_modulus_one` | `DirichletPadicLFunctions:L2/tame-gauss-measure` | degenerate | 525 / 526 | At modulus1 the existing numerator is0; D>1 is explicitly required before using the primitive Gauss comparison. |
| `SuggestedIntegralTameTests.dyadic_integral_coefficient` | `DirichletPadicLFunctions:L2/tame-integral-series` | computation | 617 / 618 | For quadratic η modulo3 at p=2, the included cubic coefficient of F_η^O is1/9. |
| `SuggestedIntegralTameTests.modulus_one_integral_series` | `DirichletPadicLFunctions:L2/tame-integral-series` | degenerate | 622 / 623 | The modulus-one integral series is0. |
| `SuggestedIntegralTameTests.wild_coefficient_not_integral` | `DirichletPadicLFunctions:L2/tame-integral-series` | non-example | 626 / 627 | At p=3, the quadratic-modulo3 constant coefficient1/3 is outside the norm-valuation integer ring. |
| `SuggestedIntegralTameTests.dyadic_integral_mass` | `DirichletPadicLFunctions:L2/tame-integral-measure` | computation | 629 / 630 | For quadratic η modulo3 at p=2, the included mass of μ_η^O is1/3. |
| `SuggestedIntegralTameTests.modulus_one_integral_measure` | `DirichletPadicLFunctions:L2/tame-integral-measure` | degenerate | 634 / 635 | The modulus-one integral measure is0. |
| `SuggestedIntegralTameTests.integral_measure_zero_test` | `DirichletPadicLFunctions:L2/tame-integral-measure` | computation | 638 / 639 | The actual integral measure sends the zero test to0. |
| `SuggestedIntegralTameTests.integral_measure_scalar_test` | `DirichletPadicLFunctions:L2/tame-integral-measure` | compatibility | 642 / 643 | For every r∈O and O-valued continuous f, μ_η^O(rf)=rμ_η^O(f). |
| `SuggestedIntegralTameTests.integral_transform_transport` | `DirichletPadicLFunctions:L2/tame-integral-amice` | compatibility | 655 / 656 | With the compatible dyadic coefficient action, mapping A(μ_η^O) into Q_2 gives the previous tameSeries. |
| `SuggestedIntegralTameTests.integral_transform_quadratic_mass` | `DirichletPadicLFunctions:L2/tame-integral-amice` | computation | 660 / 661 | For quadratic η modulo3 at p=2, the included constant Amice coefficient of μ_η^O is1/3. |
| `SuggestedIntegralTameTests.integral_measure_uniqueness` | `DirichletPadicLFunctions:L2/tame-integral-measure-unique` | compatibility | 647 / 648 | For K=Q_2, the displayed all-test compatibility characterizes the actual integral tame measure uniquely. |
| `SuggestedResidueTameTests.quadratic_translation_source` | `DirichletPadicLFunctions:L2/tame-translation` | compatibility | 787 / 788 | For the quadratic character modulo 3 at p=2, μ−(x↦x+3)_*μ=δ_1−δ_2. |
| `SuggestedResidueTameTests.dyadic_even_cell` | `DirichletPadicLFunctions:L2/tame-residue-coefficients` | computation | 734 / 735 | For quadratic η modulo 3 at p=2, μ(2Z_2)=−1/3. |
| `SuggestedResidueTameTests.dyadic_odd_cell` | `DirichletPadicLFunctions:L2/tame-residue-coefficients` | computation | 741 / 742 | For the same data, μ(1+2Z_2)=2/3. |
| `SuggestedResidueTameTests.dyadic_four_cells` | `DirichletPadicLFunctions:L2/tame-residue-coefficients` | computation | 748 / 749 | At modulus 4 the coefficients indexed 0,1,2,3 are 1/3,1/3,−2/3,1/3. |
| `SuggestedResidueTameTests.positive_characteristic_ambiguity` | `DirichletPadicLFunctions:L2/tame-residue-coefficients` | non-example | 755 / 756 | The distinct constant functions 1 and 0 on ZMod 3 with values in ZMod 3 have the same zero translation differences and the same total; total mass alone cannot fix the constant in characteristic 3. |
| `SuggestedResidueTameTests.dyadic_psi_eigenvalue` | `DirichletPadicLFunctions:L2/tame-psi` | compatibility | 759 / 760 | For quadratic η modulo 3 at p=2, ψμ=−μ. |
| `SuggestedResidueTameTests.dyadic_psi_mass` | `DirichletPadicLFunctions:L2/tame-psi` | computation | 765 / 766 | For the same data, the mass of ψμ is −1/3, not μ(1)/2. |
| `SuggestedResidueTameTests.dyadic_integral_psi` | `DirichletPadicLFunctions:L2/tame-integral-psi` | compatibility | 770 / 771 | For quadratic η modulo 3 at p=2, the actual integral measure satisfies ψμ^O=−μ^O. |
| `SuggestedResidueTameTests.dyadic_unit_mass` | `DirichletPadicLFunctions:L2/tame-unit-restriction` | computation | 776 / 777 | For quadratic η modulo 3 at p=2, (Eμ)(1)=2/3. |
| `SuggestedResidueTameTests.dyadic_unit_second_moment` | `DirichletPadicLFunctions:L2/tame-unit-moments` | computation | 781 / 782 | For quadratic η modulo 3 at p=2, the second ordinary moment on units is −10/9. |
| `SuggestedTameMomentTests.principal_exclusion` | `DirichletPadicLFunctions:L2/tame-bernoulli-generating` | non-example | 893 / 894 | For the principal character modulo3 the actual tame series has constant coefficient−1 but the degree-zero Bernoulli expression is0; the nonprincipal hypothesis is necessary. |
| `SuggestedTameMomentTests.quadratic_zero` | `DirichletPadicLFunctions:L2/tame-exponential-coefficients` | computation | 881 / 882 | For quadratic modulo3 over ℚ the degree-zero exponential coefficient is1/3. |
| `SuggestedTameMomentTests.quadratic_second_exponential` | `DirichletPadicLFunctions:L2/tame-exponential-coefficients` | computation | 885 / 886 | For the same character the degree-two exponential coefficient is−1/9, half of the ordinary second moment. |
| `SuggestedTameMomentTests.quadratic_fourth_formal` | `DirichletPadicLFunctions:L2/tame-formal-moments` | computation | 889 / 890 | The fourth iterated Mahler constant is2/3, not the degree-four exponential coefficient1/36. |
| `SuggestedTameMomentTests.rational_transport` | `DirichletPadicLFunctions:L2/tame-algebraic-value-map` | compatibility | 899 / 900 | The rational quadratic-modulo3 second value maps to−2/9 in ℂ. |
| `SuggestedTameMomentTests.complex_zero` | `DirichletPadicLFunctions:L2/tame-complex-special-values` | computation | 904 / 905 | The quadratic character modulo3 has native complex L-value1/3 at0. |
| `SuggestedTameMomentTests.complex_second` | `DirichletPadicLFunctions:L2/tame-complex-special-values` | computation | 907 / 908 | Its value at−2 is−2/9. |
| `SuggestedTameMomentTests.quartic_complex_zero` | `DirichletPadicLFunctions:L2/tame-complex-special-values` | computation | 910 / 911 | For the quartic character modulo5 with η(2)=i the value at0 is(3+i)/5, retaining the nonreal character orientation. |
| `SuggestedTameMomentTests.dyadic_fourth` | `DirichletPadicLFunctions:L2/tame-ordinary-moments` | computation | 916 / 917 | At p=2, the quadratic character modulo3 has actual ordinary fourth moment2/3. |
| `SuggestedTameMomentTests.dyadic_unit_fourth` | `DirichletPadicLFunctions:L2/tame-unit-special-value-comparison` | computation | 921 / 922 | For quadratic modulo3 at p=2, the unit fourth moment is(1+16)·2/3=34/3. |
| `SuggestedTameZetaTests.one_level_zero` | `DirichletPadicLFunctions:L2/tame-zeta-measure` | degenerate | 1017 / 1018 | At modulus1 the actual tame zeta constructor is0. |
| `SuggestedTameZetaTests.first_moment` | `DirichletPadicLFunctions:L2/tame-zeta-measure` | computation | 1021 / 1022 | For quadratic modulo3 at p=2, the first ζ moment is2/3. |
| `SuggestedTameZetaTests.omission_of_inverse` | `DirichletPadicLFunctions:L2/tame-zeta-measure` | non-example | 1026 / 1027 | For the same data ζ differs from Eμ: their first ordinary moments are2/3 and0. |
| `SuggestedTameZetaTests.weight_compatibility` | `DirichletPadicLFunctions:L2/tame-zeta-measure` | compatibility | 1031 / 1032 | For the same data, weighting ζ by x and evaluating at1 gives the unit mass2/3, agreeing with the existing weight operation. |
| `SuggestedTameZetaTests.psi_zero` | `DirichletPadicLFunctions:L2/tame-zeta-support` | compatibility | 1037 / 1038 | At p=2 and D=3 the actual ζ measure is killed by the existing psi operator. |
| `SuggestedTameZetaTests.third_moment` | `DirichletPadicLFunctions:L2/tame-zeta-moment-shift` | computation | 1041 / 1042 | For quadratic modulo3 at p=2, ζ has third moment−10/9, the second unit moment of μ. |
| `SuggestedTameZetaTests.norm_bound` | `DirichletPadicLFunctions:L2/tame-zeta-norm` | compatibility | 1051 / 1052 | At p=2,D=3 the norm of the zero-th ζ moment is at most1; its arithmetic value is not otherwise asserted. |
| `SuggestedTameZetaTests.fifth_moment` | `DirichletPadicLFunctions:L2/tame-zeta-common-special-value` | computation | 1046 / 1047 | For quadratic modulo3 at p=2, the fifth ζ moment is34/3=(1+2⁴)·2/3. |
| `SuggestedIntegralTameZetaTests.modulus_one` | `DirichletPadicLFunctions:L2/tame-integral-zeta-measure` | degenerate | 1130 / 1131 | The actual integral tame zeta measure is zero at modulus1. |
| `SuggestedIntegralTameZetaTests.mass_inclusion` | `DirichletPadicLFunctions:L2/tame-integral-zeta-measure` | compatibility | 1134 / 1135 | For quadratic modulo3 at p=2, inclusion of the integral total mass equals the K-valued total mass. No arithmetic formula for that zero-th moment is asserted. |
| `SuggestedIntegralTameZetaTests.first_integral_value` | `DirichletPadicLFunctions:L2/tame-integral-zeta-measure` | computation | 1140 / 1141 | For quadratic modulo3 at p=2, evaluation on any O-valued lift of x includes to2/3. |
| `SuggestedIntegralTameZetaTests.wild_scalar` | `DirichletPadicLFunctions:L2/tame-integral-zeta-measure` | non-example | 1145 / 1146 | The rational scalar1/3 is not in the norm-valuation integer ring of Q_3; the tame hypothesis cannot be discarded in this construction. |
| `SuggestedIntegralTameZetaTests.mass_bound` | `DirichletPadicLFunctions:L2/tame-integral-zeta-inclusion` | compatibility | 1148 / 1149 | The integral zero-th moment has norm at most1, even though its arithmetic value remains unidentified. |
| `SuggestedIntegralTameZetaTests.integral_psi_zero` | `DirichletPadicLFunctions:L2/tame-integral-zeta-support` | compatibility | 1153 / 1154 | At p=2,D=3, the actual integral tame zeta measure lies in the kernel of psi. |
| `SuggestedIntegralTameZetaTests.third_value_integral` | `DirichletPadicLFunctions:L2/tame-zeta-value-integral` | computation | 1158 / 1159 | For quadratic modulo3 at p=2 the third moment scalar−10/9 lies in O; it is the integral measure value on the lifted cubic test. |
| `SuggestedIntegralTameZetaTests.p_divides_weight` | `DirichletPadicLFunctions:L2/tame-zeta-value-integral` | computation | 1163 / 1164 | For quadratic modulo3 at p=2, k=2 is divisible by p but its second zeta moment is0 and integral. No unit-denominator hypothesis on k is imposed. |
| `SuggestedIntegralTameZetaTests.amice_constant` | `DirichletPadicLFunctions:L2/tame-integral-zeta-amice` | compatibility | 1170 / 1171 | For any compatible continuous O-action, inclusion of coefficient0 of Amice ζO equals coefficient0 of Amice ζK. |
| `SuggestedTameCharacterTests.modulus_one` | `DirichletPadicLFunctions:L2/twisted-tame-measure` | degenerate | 1296 / 1297 | Every twist of the D=1 tame measure is zero. |
| `SuggestedTameCharacterTests.zero_level_mass` | `DirichletPadicLFunctions:L2/twisted-tame-measure` | computation | 1300 / 1301 | At p=2 with quadratic η modulo3, the n=0 twist has mass1/3. |
| `SuggestedTameCharacterTests.positive_principal_mass` | `DirichletPadicLFunctions:L2/twisted-tame-measure` | computation | 1305 / 1306 | For the same η, the principal twist at level2 has mass2/3. |
| `SuggestedTameCharacterTests.principal_not_constant` | `DirichletPadicLFunctions:L2/twisted-tame-measure` | non-example | 1310 / 1311 | The positive-level principal twist differs from the untwisted measure; their masses are2/3 and1/3. |
| `SuggestedTameCharacterTests.raised_level` | `DirichletPadicLFunctions:L2/twisted-tame-measure` | compatibility | 1315 / 1316 | The quadratic character modulo4 and its native lift to8 give equal tame twists. |
| `SuggestedTameCharacterTests.positive_psi_zero` | `DirichletPadicLFunctions:L2/twisted-tame-psi` | compatibility | 1321 / 1322 | At p=2, η quadratic modulo3 and χ quadratic modulo4, psi kills the actual twist. |
| `SuggestedTameCharacterTests.quadratic_translation` | `DirichletPadicLFunctions:L2/twisted-tame-translation` | compatibility | 1326 / 1327 | For η modulo3 and χ modulo4 both quadratic, ν−(x↦x+12)_*ν=δ1−δ5−δ7+δ11. |
| `SuggestedTameCharacterTests.quadratic_amice_mass` | `DirichletPadicLFunctions:L2/twisted-tame-amice` | computation | 1334 / 1335 | For the quadratic product character modulo12 the constant coefficient of Amice ν is0. |
| `SuggestedTameCharacterTests.quadratic_first_moment` | `DirichletPadicLFunctions:L2/twisted-tame-moments` | computation | 1338 / 1339 | For the quadratic product modulo12, ν(x)=−2. |
| `SuggestedTameCharacterTests.quadratic_third_moment` | `DirichletPadicLFunctions:L2/twisted-tame-moments` | computation | 1342 / 1343 | For the same product, ν(x³)=46. |
| `SuggestedTameCharacterTests.quadratic_shifted_second` | `DirichletPadicLFunctions:L2/tame-zeta-character-shift` | computation | 1346 / 1347 | At p=2, η quadratic modulo3 and χ quadratic modulo4, ζ_η(wχ x²)=−2. |
| `SuggestedTameCharacterTests.complex_product_value` | `DirichletPadicLFunctions:L2/tame-zeta-character-common-value` | computation | 1350 / 1351 | For rational quadratic η modulo3 and χ modulo4, the complex product character modulo12 has L(θ,−1)=−2. |
| `SuggestedTameCharacterTests.quadratic_shifted_fourth` | `DirichletPadicLFunctions:L2/tame-zeta-character-common-value` | computation | 1356 / 1357 | The corresponding character-twisted fourth moment of ζ_η is46. |
| `SuggestedIntegralCharacterTests.modulus_one` | `DirichletPadicLFunctions:L2/integral-tame-character-measure` | degenerate | 1487 / 1488 | Every character twist of the D=1 integral tame zeta measure is zero. |
| `SuggestedIntegralCharacterTests.principal_positive_level` | `DirichletPadicLFunctions:L2/integral-tame-character-measure` | compatibility | 1491 / 1492 | At p=2, the principal character modulo4 fixes ζO. |
| `SuggestedIntegralCharacterTests.zero_to_positive_level` | `DirichletPadicLFunctions:L2/integral-tame-character-measure` | compatibility | 1496 / 1497 | The principal twists at level1 and level4 agree on ζO, although the two lifted functions differ off the units. |
| `SuggestedIntegralCharacterTests.nontrivial_twist` | `DirichletPadicLFunctions:L2/integral-tame-character-measure` | non-example | 1501 / 1502 | For quadratic η modulo3 and χ modulo4, the integral character twist differs from ζO: their included second moments are−2 and0. |
| `SuggestedIntegralCharacterTests.second_integral_value` | `DirichletPadicLFunctions:L2/integral-tame-character-measure` | computation | 1505 / 1506 | For these quadratic characters, the included value on a lifted quadratic test is−2. |
| `SuggestedIntegralCharacterTests.integral_support` | `DirichletPadicLFunctions:L2/integral-tame-character-measure` | compatibility | 1516 / 1517 | The same integral character twist is killed by the native general-ring psi operator. |
| `SuggestedIntegralCharacterTests.inclusion_mass` | `DirichletPadicLFunctions:L2/integral-tame-character-inclusion` | compatibility | 1510 / 1511 | The included integral character mass equals ζK(wχ), with no asserted arithmetic value for that mass. |
| `SuggestedIntegralCharacterTests.inverse_character` | `DirichletPadicLFunctions:L2/integral-tame-character-inverse` | compatibility | 1520 / 1521 | For χ quadratic modulo4, the product-character twist χχ⁻¹ gives back the actual ζO. |
| `SuggestedIntegralCharacterTests.fourth_integral_value` | `DirichletPadicLFunctions:L2/tame-character-value-integral` | computation | 1524 / 1525 | For quadratic η modulo3 and χ modulo4 at p=2, the included fourth integral character value is46. |
| `SuggestedIntegralCharacterTests.amice_constant` | `DirichletPadicLFunctions:L2/integral-tame-character-amice` | compatibility | 1541 / 1542 | The included constant Amice coefficient of νO agrees with that of the actual K-valued character weighting. |
| `SuggestedIntegralCharacterTests.character_linear_difference` | `DirichletPadicLFunctions:L2/tame-character-finite-values` | computation | 1529 / 1530 | At p=2 for quadratic η modulo3 and χ modulo4, ζK(wχ(x²−x⁴))=−48. |
| `SuggestedIntegralCharacterTests.dyadic_character_congruence` | `DirichletPadicLFunctions:L2/tame-character-kummer` | computation | 1534 / 1535 | For quadratic η modulo3 and χ modulo4, the second and fourth zeta character values differ by−48. Their norm is1/16, hence at most1/8, consistent with x²−x⁴ divisible by8 on dyadic units. |
| `SuggestedTameParityTests.quadratic_atoms` | `DirichletPadicLFunctions:L2/tame-atoms-reflection` | computation | 1627 / 1628 | At p=2, reflection about3 sends δ1−δ2 to its negative. |
| `SuggestedTameParityTests.odd_tame_measure_even` | `DirichletPadicLFunctions:L2/tame-measure-reflection` | compatibility | 1632 / 1633 | For quadratic η modulo3 at p=2, μ is fixed by x↦−x. |
| `SuggestedTameParityTests.even_tame_measure_odd` | `DirichletPadicLFunctions:L2/tame-measure-reflection` | compatibility | 1636 / 1637 | For quadratic η modulo5 at p=2, μ changes sign under x↦−x. |
| `SuggestedTameParityTests.principal_hypothesis_needed` | `DirichletPadicLFunctions:L2/tame-measure-reflection` | non-example | 1641 / 1642 | For principal η modulo3 at p=2, μ(1)=−1, disproving the same anti-invariance without η≠1. |
| `SuggestedTameParityTests.odd_tame_zeta_odd` | `DirichletPadicLFunctions:L2/tame-zeta-reflection` | compatibility | 1645 / 1646 | For quadratic η modulo3 at p=2, ζ changes sign under x↦−x. |
| `SuggestedTameParityTests.two_odd_characters_even` | `DirichletPadicLFunctions:L2/tame-character-zeta-reflection` | compatibility | 1649 / 1650 | Quadratic η modulo3 and χ modulo4 give an even character-weighted ζ at p=2. |
| `SuggestedTameParityTests.integral_even_reflection` | `DirichletPadicLFunctions:L2/integral-tame-character-reflection` | compatibility | 1655 / 1656 | The integral χ4 twist of ζ for η3 is fixed by reflection at p=2. |
| `SuggestedTameParityTests.odd_character_mass` | `DirichletPadicLFunctions:L2/tame-character-parity-test` | computation | 1660 / 1661 | At p=2 with η3 quadratic and the level-one principal χ, the integral character mass is0. |
| `SuggestedTameParityTests.odd_test_even_twist` | `DirichletPadicLFunctions:L2/tame-character-parity-test` | compatibility | 1665 / 1666 | For quadratic η3 and χ4 at p=2, every odd continuous K-test has zero character-weighted value. |
| `SuggestedTameParityTests.mismatched_second_moment` | `DirichletPadicLFunctions:L2/tame-character-value-parity` | computation | 1670 / 1671 | For quadratic η3 at p=2, the untwisted ζ second moment vanishes. |
| `SuggestedTameParityTests.matching_second_moment_not_zero` | `DirichletPadicLFunctions:L2/tame-character-value-parity` | non-example | 1674 / 1675 | For quadratic η3 and χ4 at p=2, the character-weighted second moment−2 does not vanish. |
| `SuggestedTameParityTests.integral_mismatched_third_moment` | `DirichletPadicLFunctions:L2/tame-character-value-parity` | computation | 1678 / 1679 | For quadratic η3 and χ4 at p=2, every integral cubic lift has zero value. |
| `SuggestedTameComplexKernelTests.level_one_zero` | `DirichletPadicLFunctions:L2/tame-complex-kernel` | computation | 1784 / 1785 | The unique character modulo 1 gives the zero function. |
| `SuggestedTameComplexKernelTests.quadratic_origin` | `DirichletPadicLFunctions:L2/tame-complex-kernel` | computation | 1787 / 1788 | For the quadratic character modulo 3, f(0)=1/3. |
| `SuggestedTameComplexKernelTests.quadratic_log_two` | `DirichletPadicLFunctions:L2/tame-complex-kernel` | computation | 1790 / 1791 | For that character, f(log 2)=2/7. |
| `SuggestedTameComplexKernelTests.principal_origin` | `DirichletPadicLFunctions:L2/tame-complex-kernel` | non-example | 1793 / 1794 | The principal character modulo 3 has f(0)=−1; do not identify this subtracted kernel with its unsmoothed L-series kernel. |
| `SuggestedTameComplexKernelTests.quartic_orientation` | `DirichletPadicLFunctions:L2/tame-complex-kernel` | computation | 1796 / 1797 | For the quartic character modulo 5 with η(2)=i, f(0)=(3+i)/5, fixing the orientation of η rather than η⁻¹. |
| `SuggestedTameComplexKernelTests.analytic_at_zero` | `DirichletPadicLFunctions:L2/tame-complex-regularity` | boundary | 1800 / 1801 | Every character modulo 3, including the principal one, gives a kernel analytic at zero. |
| `SuggestedTameComplexKernelTests.quadratic_second_derivative` | `DirichletPadicLFunctions:L2/tame-complex-origin-derivatives` | computation | 1803 / 1804 | The quadratic character modulo 3 gives f″(0)=−2/9. |
| `SuggestedTameComplexKernelTests.even_first_derivative` | `DirichletPadicLFunctions:L2/tame-complex-origin-derivatives` | computation | 1807 / 1808 | The quadratic character modulo 5 gives f′(0)=−2/5. |
| `SuggestedTameComplexKernelTests.even_kernel_negative` | `DirichletPadicLFunctions:L2/tame-complex-positive-series` | computation | 1811 / 1812 | For quadratic η modulo 5, f(log 2)=−6/31, checking the even-character minus sign. |
| `SuggestedTameComplexKernelTests.odd_first_series` | `DirichletPadicLFunctions:L2/tame-complex-positive-derivatives` | compatibility | 1815 / 1816 | For quadratic η modulo 3 the first derivative series has coefficients η(m)(−m), with no extra parity minus sign. |
| `SuggestedTameComplexKernelTests.decay_to_zero` | `DirichletPadicLFunctions:L2/tame-complex-derivative-decay` | compatibility | 1820 / 1821 | For quadratic η modulo 3 the actual kernel tends to zero at +∞. |
| `SuggestedTameComplexKernelTests.convergence_before_series_halfplane` | `DirichletPadicLFunctions:L2/tame-complex-mellin-convergent` | boundary | 1824 / 1825 | For quadratic η modulo 3, the Mellin integral converges at s=1/2. |
| `SuggestedTameComplexKernelTests.gamma_two` | `DirichletPadicLFunctions:L2/tame-complex-mellin-gamma-l` | compatibility | 1828 / 1829 | For quadratic η modulo 3 at s=2, mellin(f,2)=Γ(2)η.LFunction(2). |
| `SuggestedTameComplexKernelTests.entire_even_character` | `DirichletPadicLFunctions:L2/tame-complex-mellin-entire` | compatibility | 1832 / 1833 | The quadratic character modulo 5 also yields an entire normalized Mellin continuation. |
| `SuggestedTameComplexKernelTests.odd_value_one` | `DirichletPadicLFunctions:L2/tame-complex-mellin-comparison` | boundary | 1836 / 1837 | For quadratic η modulo 3, normalizedMellinContinuation(f,1)=η.LFunction(1). |
| `SuggestedTameComplexKernelTests.even_negative_value_sign` | `DirichletPadicLFunctions:L2/tame-complex-mellin-values` | computation | 1840 / 1841 | For quadratic η modulo 5, normalizedMellinContinuation(f,−1)=2/5. |
| `SuggestedComplexGaussTests.imaginary_denominator` | `DirichletPadicLFunctions:L2/complex-gauss-denominator` | computation | 1916 / 1917 | For α=i, αexp(t)−1 is nonzero for every real t. |
| `SuggestedComplexGaussTests.zero_residue_denominator` | `DirichletPadicLFunctions:L2/complex-gauss-denominator` | non-example | 1919 / 1920 | For a=0 and t=0 the denominator is zero, so it must not be cancelled before accounting for its weight. |
| `SuggestedComplexGaussTests.zero_normalization` | `DirichletPadicLFunctions:L2/complex-gauss-regularity` | degenerate | 1922 / 1923 | If G=0 the whole normalized expression is zero for every t; comparison with the nonzero tame kernel still requires G≠0. |
| `SuggestedComplexGaussTests.quadratic_generating` | `DirichletPadicLFunctions:L2/complex-gauss-generating` | compatibility | 1927 / 1928 | For the quadratic character modulo 4, the finite numerator is exp(t)−exp(3t). |
| `SuggestedComplexGaussTests.quadratic_gauss_origin` | `DirichletPadicLFunctions:L2/complex-gauss-kernel-comparison` | computation | 1934 / 1935 | The quadratic character modulo 3 gives the normalized finite Gauss value 1/3 at zero. |
| `SuggestedComplexGaussTests.quadratic_gauss_log_two` | `DirichletPadicLFunctions:L2/complex-gauss-kernel-comparison` | computation | 1939 / 1940 | The quadratic character modulo 4 gives the finite Gauss value 2/5 at log 2. |
| `SuggestedComplexGaussTests.inverse_primitive_root` | `DirichletPadicLFunctions:L2/complex-gauss-kernel-comparison` | compatibility | 1945 / 1946 | At modulus 3, replacing ε by ε⁻¹ and recomputing the Gauss normalization leaves the actual function unchanged. |
| `SuggestedComplexGaussTests.even_gauss_negative_value` | `DirichletPadicLFunctions:L2/complex-gauss-kernel-comparison` | computation | 1954 / 1955 | For quadratic η modulo 5, the normalized Mellin value of the Gauss expression at −1 is +2/5. |
| `SuggestedComplexGaussTests.ordinary_derivative_normalization` | `DirichletPadicLFunctions:L2/complex-tame-formal-derivatives` | compatibility | 1960 / 1961 | At quadratic modulus 3 and k=2, the analytic derivative equals the iterated Mahler constant, namely −2/9. |
| `SuggestedComplexGaussTests.exponential_factorial` | `DirichletPadicLFunctions:L2/complex-tame-formal-derivatives` | computation | 1965 / 1966 | For that character the degree-two exponential coefficient is the second derivative divided by 2, namely −1/9. |
| `SuggestedPrimePowerGaussTests.gauss_lift_one` | `DirichletPadicLFunctions:L2/prime-power-character-gauss` | compatibility | 2043 / 2044 | At z=1 the normalized finite sum G⁻¹Σ_cχ⁻¹(c)e(c) is1. |
| `SuggestedPrimePowerGaussTests.gauss_lift_nonunit` | `DirichletPadicLFunctions:L2/prime-power-character-gauss` | non-example | 2048 / 2049 | At the nonunit z=p the normalized sum G⁻¹Σ_cχ⁻¹(c)e(cp) is0, also at composite q. |
| `SuggestedPrimePowerGaussTests.additive_zero_index` | `DirichletPadicLFunctions:L2/smoothed-additive-twist` | degenerate | 2053 / 2054 | At c=0, the additive twist equals I_Kμ_a for every n and e. |
| `SuggestedPrimePowerGaussTests.additive_trivial_character` | `DirichletPadicLFunctions:L2/smoothed-additive-twist` | compatibility | 2058 / 2059 | At e=1, every index c gives I_Kμ_a. |
| `SuggestedPrimePowerGaussTests.additive_one_smoothing` | `DirichletPadicLFunctions:L2/smoothed-additive-twist` | degenerate | 2063 / 2064 | For a=1, every additive twist is zero. |
| `SuggestedPrimePowerGaussTests.additive_dyadic_sign_first_moment` | `DirichletPadicLFunctions:L2/smoothed-additive-twist` | computation | 2067 / 2068 | For p=2,n=1,a=3,K=Q_2 and e(1)=−1, the c=1 additive twist has first ordinary moment−2, whereas the unweighted first moment is−2/3. |
| `SuggestedPrimePowerGaussTests.gauss_measure_total_mass` | `DirichletPadicLFunctions:L2/twisted-smoothed-gauss` | compatibility | 2073 / 2074 | The total mass of τ_n,χ,a is G⁻¹Σ_cχ⁻¹(c)μ_(n,e,c,a)(1). |
| `SuggestedPrimePowerGaussTests.gauss_measure_one_smoothing` | `DirichletPadicLFunctions:L2/twisted-smoothed-gauss` | degenerate | 2079 / 2080 | For a=1 the normalized finite sum of additive twists is the zero measure. |
| `SuggestedPrimePowerGaussTests.gauss_amice_coeff_zero` | `DirichletPadicLFunctions:L2/twisted-smoothed-gauss-amice` | compatibility | 2084 / 2085 | The constant coefficient of the twist transform equals the normalized finite sum of the constant coefficients of the additive transforms. |
| `SuggestedPrimePowerGaussTests.gauss_amice_coeff_second` | `DirichletPadicLFunctions:L2/twisted-smoothed-gauss-amice` | compatibility | 2090 / 2091 | The degree-two coefficient satisfies the same finite Gauss formula; it is a Mahler coefficient, not the ordinary second moment. |
| `SuggestedAdditiveRationalTests.translation_two` | `DirichletPadicLFunctions:L2/smoothed-translation-sum` | computation | 2148 / 2149 | At p=3,a=2,K=Q_3, I_Kμ_2+(τ_1)_*I_Kμ_2=δ_0. |
| `SuggestedAdditiveRationalTests.translation_three` | `DirichletPadicLFunctions:L2/smoothed-translation-sum` | computation | 2155 / 2156 | At p=2,a=3,K=Q_2, the sum of translates at0,1,2 is2δ_0+δ_1. |
| `SuggestedAdditiveRationalTests.weighted_translation_zero_index` | `DirichletPadicLFunctions:L2/smoothed-additive-translation` | compatibility | 2162 / 2163 | At c=0, the weighted translation equation has all scalar factors1 and the same unweighted atom sum. |
| `SuggestedAdditiveRationalTests.weighted_translation_dyadic_sign` | `DirichletPadicLFunctions:L2/smoothed-additive-translation` | computation | 2169 / 2170 | For p=2,n=1,a=3,e(1)=−1, the alternating sum of translates of the additive twist is2δ_0−δ_1. |
| `SuggestedAdditiveRationalTests.additive_cancellation_dyadic_sign` | `DirichletPadicLFunctions:L2/smoothed-additive-amice-cancellation` | computation | 2176 / 2177 | For p=2,n=1,a=3,e(1)=−1, (1+T+T²)A_(μ_(1,e,1,3))=1−T. |
| `SuggestedAdditiveRationalTests.additive_cancellation_one` | `DirichletPadicLFunctions:L2/smoothed-additive-amice-cancellation` | degenerate | 2180 / 2181 | For a=1 the additive Amice transform is0. |
| `SuggestedAdditiveRationalTests.denominator_zero_index` | `DirichletPadicLFunctions:L2/smoothed-additive-denominator` | compatibility | 2184 / 2185 | For c=0, the denominator sum equals a in K. |
| `SuggestedAdditiveRationalTests.denominator_dyadic_sign` | `DirichletPadicLFunctions:L2/smoothed-additive-denominator` | computation | 2188 / 2189 | For ε=−1 and a=3 over Q_2 the denominator is1. |
| `SuggestedAdditiveRationalTests.denominator_bad_smoothing` | `DirichletPadicLFunctions:L2/smoothed-additive-denominator` | non-example | 2191 / 2192 | For ε=−1 and a=2 over Q_2 the denominator is0; this parameter is excluded by2∤a. |
| `SuggestedAdditiveRationalTests.rational_dyadic_constant` | `DirichletPadicLFunctions:L2/smoothed-additive-rational` | computation | 2194 / 2195 | For p=2,n=1,a=3,e(1)=−1, the additive Amice constant coefficient is1. |
| `SuggestedAdditiveRationalTests.rational_dyadic_linear` | `DirichletPadicLFunctions:L2/smoothed-additive-rational` | computation | 2198 / 2199 | In the same dyadic case the linear coefficient is−2, agreeing with the earlier independent first-moment test. |
| `SuggestedAdditiveRationalTests.rational_dyadic_second` | `DirichletPadicLFunctions:L2/smoothed-additive-rational` | computation | 2202 / 2203 | In the same dyadic case the second Mahler coefficient is1; the ordinary second moment is0. |
| `SuggestedAdditiveRationalTests.gauss_rational_total_mass` | `DirichletPadicLFunctions:L2/twisted-smoothed-gauss-rational` | compatibility | 2206 / 2207 | The total mass of the actual multiplicative twist is G⁻¹Σ_cχ⁻¹(c)·[Σ_(i<a)Σ_(j<i)e(c)^j]/[Σ_(i<a)e(c)^i]. |
| `SuggestedAdditiveRationalTests.gauss_rational_one_smoothing` | `DirichletPadicLFunctions:L2/twisted-smoothed-gauss-rational` | degenerate | 2214 / 2215 | For a=1 the actual multiplicative twist has zero Amice transform. |
| `SuggestedGaussFractionTests.nonidentity_root_odd_smoothing` | `DirichletPadicLFunctions:L2/smoothed-additive-root-power` | computation | 2253 / 2254 | In Q_2, (−1)^3≠1. |
| `SuggestedGaussFractionTests.nonidentity_root_bad_smoothing` | `DirichletPadicLFunctions:L2/smoothed-additive-root-power` | non-example | 2256 / 2257 | In Q_2, (−1)^2=1; the even smoothing parameter is excluded. |
| `SuggestedGaussFractionTests.fraction_dyadic_sign` | `DirichletPadicLFunctions:L2/smoothed-additive-fractions` | computation | 2259 / 2260 | For p=2,n=1,a=3,e(1)=−1, A_μ=(−(1+T)−1)⁻¹−3(−(1+T)^3−1)⁻¹. |
| `SuggestedGaussFractionTests.fraction_identity_root_failure` | `DirichletPadicLFunctions:L2/smoothed-additive-fractions` | non-example | 2264 / 2265 | At the identity additive root for p=2,a=3, the totalized two-fraction expression has constant coefficient0 and differs from the actual additive transform, whose constant coefficient is1. |
| `SuggestedGaussFractionTests.fraction_one_smoothing` | `DirichletPadicLFunctions:L2/smoothed-additive-fractions` | degenerate | 2270 / 2271 | For a=1 and ε_c≠1, the actual additive transform is the difference of the same two inverse series and is0. |
| `SuggestedGaussFractionTests.gauss_fraction_zero_index` | `DirichletPadicLFunctions:L2/twisted-smoothed-gauss-fractions` | degenerate | 2276 / 2277 | At every positive p-power level, the zero-residue character weight times the totalized two-fraction expression is0. |
| `SuggestedGaussFractionTests.gauss_fraction_total_mass` | `DirichletPadicLFunctions:L2/twisted-smoothed-gauss-fractions` | compatibility | 2281 / 2282 | The total mass is G⁻¹Σ_cχ⁻¹(c)[(ε^(c.val)−1)⁻¹−a((ε^(c.val))^a−1)⁻¹]. |
| `SuggestedGaussFractionTests.gauss_fraction_one_smoothing` | `DirichletPadicLFunctions:L2/twisted-smoothed-gauss-fractions` | degenerate | 2291 / 2292 | For a=1 the actual multiplicative twist has zero Amice transform. |
| `SuggestedPrimePowerMomentTests.reindex_one` | `DirichletPadicLFunctions:L2/prime-power-resolvent-reindex` | degenerate | 2369 / 2370 | For a=1 at modulus3 the reindexing equality has factor1. |
| `SuggestedPrimePowerMomentTests.reindex_character_factor` | `DirichletPadicLFunctions:L2/prime-power-resolvent-reindex` | compatibility | 2374 / 2375 | At modulus9 and a=2, if the actual character has χ(2)=z then the factor is z; the exact order-three control distinguishes z from z⁻¹. |
| `SuggestedPrimePowerMomentTests.subst_one` | `DirichletPadicLFunctions:L2/prime-power-resolvent-substitution` | degenerate | 2380 / 2381 | For a=1 at modulus3, σ=T and the weighted resolvent is unchanged. |
| `SuggestedPrimePowerMomentTests.subst_zero_index` | `DirichletPadicLFunctions:L2/prime-power-resolvent-substitution` | degenerate | 2386 / 2387 | At modulus3 the substituted zero-residue weighted inverse is0 for every a, including0. |
| `SuggestedPrimePowerMomentTests.formal_one_smoothing` | `DirichletPadicLFunctions:L2/prime-power-amice-formal-kernel` | degenerate | 2406 / 2407 | For a=1 the actual transform equals −F+F=0. |
| `SuggestedPrimePowerMomentTests.formal_mass_factor` | `DirichletPadicLFunctions:L2/prime-power-amice-formal-kernel` | compatibility | 2411 / 2412 | The actual total mass is (aχ(a)−1)·constantCoeff(F). |
| `SuggestedPrimePowerMomentTests.exponential_one_smoothing` | `DirichletPadicLFunctions:L2/prime-power-exponential-coefficients` | degenerate | 2418 / 2419 | At a=1 all exponential coefficients vanish. |
| `SuggestedPrimePowerMomentTests.exponential_three_second` | `DirichletPadicLFunctions:L2/prime-power-exponential-coefficients` | computation | 2439 / 2440 | For quadratic χ modulo3 with χ(2)=−1 and a=4, the degree-two exponential coefficient is−7, under the displayed field, root and Gauss assumptions. |
| `SuggestedPrimePowerMomentTests.exponential_four_second` | `DirichletPadicLFunctions:L2/prime-power-exponential-coefficients` | computation | 2462 / 2463 | For quadratic χ modulo4 with χ(3)=−1 and a=3, the degree-two exponential coefficient is7 under the same applicable assumptions. |
| `SuggestedPrimePowerMomentTests.ordinary_one_smoothing` | `DirichletPadicLFunctions:L2/prime-power-ordinary-moments` | degenerate | 2422 / 2423 | At a=1 every actual ordinary moment vanishes. |
| `SuggestedPrimePowerMomentTests.ordinary_three_mass` | `DirichletPadicLFunctions:L2/prime-power-ordinary-moments` | computation | 2443 / 2444 | For quadratic χ modulo3, χ(2)=−1 and a=4, the total mass is1. |
| `SuggestedPrimePowerMomentTests.ordinary_three_second` | `DirichletPadicLFunctions:L2/prime-power-ordinary-moments` | computation | 2446 / 2447 | For the same character and smoothing parameter, the ordinary second moment is−14. |
| `SuggestedPrimePowerMomentTests.ordinary_four_mass` | `DirichletPadicLFunctions:L2/prime-power-ordinary-moments` | computation | 2466 / 2467 | For quadratic χ modulo4, χ(3)=−1 and a=3, the total mass is−2. |
| `SuggestedPrimePowerMomentTests.ordinary_four_second` | `DirichletPadicLFunctions:L2/prime-power-ordinary-moments` | computation | 2469 / 2470 | For the same modulus4 character and smoothing parameter, the ordinary second moment is14. |
| `SuggestedSmoothedComplexTests.kernel_level_one` | `DirichletPadicLFunctions:L2/smoothed-complex-character-kernel` | degenerate | 2543 / 2544 | The unique character modulo1 with a=3 gives the zero function. |
| `SuggestedSmoothedComplexTests.kernel_quadratic_three_mass` | `DirichletPadicLFunctions:L2/smoothed-complex-character-kernel` | computation | 2546 / 2547 | For quadratic χ modulo3 with χ(2)=−1, g_4(0)=1. |
| `SuggestedSmoothedComplexTests.kernel_quadratic_four_mass` | `DirichletPadicLFunctions:L2/smoothed-complex-character-kernel` | computation | 2550 / 2551 | For quadratic χ modulo4 with χ(3)=−1, g_3(0)=−2. |
| `SuggestedSmoothedComplexTests.kernel_one_parameter` | `DirichletPadicLFunctions:L2/smoothed-complex-character-kernel` | degenerate | 2554 / 2555 | For every χ, g_1 is identically zero. |
| `SuggestedSmoothedComplexTests.kernel_zero_parameter` | `DirichletPadicLFunctions:L2/smoothed-complex-character-kernel` | degenerate | 2557 / 2558 | For quadratic χ modulo3, g_0(0)=−1/3. |
| `SuggestedSmoothedComplexTests.regularity_principal_origin` | `DirichletPadicLFunctions:L2/smoothed-complex-regularity` | compatibility | 2561 / 2562 | The principal character modulo3 with a=2 gives a real-analytic kernel at0. |
| `SuggestedSmoothedComplexTests.derivative_order_zero` | `DirichletPadicLFunctions:L2/smoothed-complex-higher-derivatives` | compatibility | 2564 / 2565 | The order-zero formula is exactly the constructor at every real t. |
| `SuggestedSmoothedComplexTests.derivative_one_parameter` | `DirichletPadicLFunctions:L2/smoothed-complex-higher-derivatives` | degenerate | 2569 / 2570 | Every derivative of g_1 is the zero function. |
| `SuggestedSmoothedComplexTests.derivative_quadratic_three_second` | `DirichletPadicLFunctions:L2/smoothed-complex-origin-values` | computation | 2573 / 2574 | For quadratic χ modulo3 and a=4, g″(0)=−14. |
| `SuggestedSmoothedComplexTests.derivative_quadratic_four_second` | `DirichletPadicLFunctions:L2/smoothed-complex-origin-values` | computation | 2577 / 2578 | For quadratic χ modulo4 and a=3, g″(0)=14. |
| `SuggestedSmoothedComplexTests.derivative_even_character_first` | `DirichletPadicLFunctions:L2/smoothed-complex-origin-values` | computation | 2581 / 2582 | For quadratic χ modulo5, χ(2)=−1, and a=6, g′(0)=−14. |
| `SuggestedSmoothedComplexTests.decay_one_parameter` | `DirichletPadicLFunctions:L2/smoothed-complex-derivative-decay` | degenerate | 2585 / 2586 | All within derivatives of g_1 satisfy the bound because they are zero. |
| `SuggestedSmoothedComplexTests.decay_quadratic_three` | `DirichletPadicLFunctions:L2/smoothed-complex-derivative-decay` | compatibility | 2590 / 2591 | For quadratic χ modulo3 and a=4, g(t) tends to0 as t→+∞. |
| `SuggestedSmoothedComplexTests.gauss_one_parameter` | `DirichletPadicLFunctions:L2/smoothed-complex-gauss-comparison` | degenerate | 2594 / 2595 | For a=1 the displayed Gauss expression is0. |
| `SuggestedSmoothedComplexTests.gauss_zero_residue` | `DirichletPadicLFunctions:L2/smoothed-complex-gauss-comparison` | degenerate | 2602 / 2603 | At modulus3 the c=0 summand is0 at every real t, including0. |
| `SuggestedSmoothedComplexTests.kernel_quadratic_three_log_two` | `DirichletPadicLFunctions:L2/smoothed-complex-gauss-comparison` | computation | 2607 / 2608 | For quadratic χ modulo3 and a=4, g(log2)=−2/39. |
| `SuggestedSmoothedComplexTests.kernel_quadratic_four_log_two` | `DirichletPadicLFunctions:L2/smoothed-complex-gauss-comparison` | computation | 2611 / 2612 | For quadratic χ modulo4 and a=3, g(log2)=−10/13. |
| `SuggestedSmoothedMellinTests.convergence_at_one` | `DirichletPadicLFunctions:L2/smoothed-mellin-convergence` | compatibility | 2665 / 2666 | For quadratic χ modulo 3 and a=4, the actual Mellin integral converges at s=1. |
| `SuggestedSmoothedMellinTests.convergence_nonunit_parameter` | `DirichletPadicLFunctions:L2/smoothed-mellin-convergence` | compatibility | 2669 / 2670 | For quadratic χ modulo 3 and a=3, the actual Mellin integral converges at s=1/2. |
| `SuggestedSmoothedMellinTests.raw_three_at_two` | `DirichletPadicLFunctions:L2/smoothed-mellin-gamma-l` | computation | 2673 / 2674 | For quadratic χ modulo 3 and a=4, mellin(g,2)=−3/4·L(χ,2). |
| `SuggestedSmoothedMellinTests.raw_four_at_two` | `DirichletPadicLFunctions:L2/smoothed-mellin-gamma-l` | computation | 2677 / 2678 | For quadratic χ modulo 4 and a=3, mellin(g,2)=−4/3·L(χ,2). |
| `SuggestedSmoothedMellinTests.entire_at_zero` | `DirichletPadicLFunctions:L2/smoothed-mellin-entire` | compatibility | 2681 / 2682 | For quadratic χ modulo 3 and a=4, the normalized continuation is complex differentiable at s=0. |
| `SuggestedSmoothedMellinTests.entire_at_one` | `DirichletPadicLFunctions:L2/smoothed-mellin-entire` | compatibility | 2685 / 2686 | For quadratic χ modulo 4 and a=3, the normalized continuation is complex differentiable at s=1. |
| `SuggestedSmoothedMellinTests.normalized_one_parameter` | `DirichletPadicLFunctions:L2/smoothed-mellin-comparison` | degenerate | 2689 / 2690 | For every character, including principal characters, the actual zero kernel g_1 has zero normalized continuation at every s. |
| `SuggestedSmoothedMellinTests.normalized_nonunit_parameter` | `DirichletPadicLFunctions:L2/smoothed-mellin-comparison` | compatibility | 2693 / 2694 | For quadratic χ modulo 3 and a=3, the normalized continuation equals −L(χ,s) for every s. |
| `SuggestedSmoothedMellinTests.normalized_three_at_one` | `DirichletPadicLFunctions:L2/smoothed-mellin-comparison` | computation | 2697 / 2698 | For quadratic χ modulo 3 and a=4, the normalized value at s=1 is zero. |
| `SuggestedSmoothedMellinTests.normalized_four_at_one` | `DirichletPadicLFunctions:L2/smoothed-mellin-comparison` | computation | 2701 / 2702 | For quadratic χ modulo 4 and a=3, the normalized value at s=1 is −2L(χ,1). |
| `SuggestedSmoothedMellinTests.normalized_three_at_two` | `DirichletPadicLFunctions:L2/smoothed-mellin-comparison` | computation | 2705 / 2706 | For quadratic χ modulo 3 and a=4, the normalized value at s=2 is −3/4·L(χ,2). |
| `SuggestedSmoothedMellinTests.normalized_four_at_two` | `DirichletPadicLFunctions:L2/smoothed-mellin-comparison` | computation | 2709 / 2710 | For quadratic χ modulo 4 and a=3, the normalized value at s=2 is −4/3·L(χ,2). |
| `SuggestedSmoothedMellinTests.negative_zero_three` | `DirichletPadicLFunctions:L2/smoothed-mellin-negative-values` | computation | 2713 / 2714 | For quadratic χ modulo 3 and a=4, the normalized value at zero is 1. |
| `SuggestedSmoothedMellinTests.negative_zero_four` | `DirichletPadicLFunctions:L2/smoothed-mellin-negative-values` | computation | 2717 / 2718 | For quadratic χ modulo 4 and a=3, the normalized value at zero is −2. |
| `SuggestedSmoothedMellinTests.negative_two_three` | `DirichletPadicLFunctions:L2/smoothed-mellin-negative-values` | computation | 2721 / 2722 | For quadratic χ modulo 3 and a=4, the normalized value at −2 is −14. |
| `SuggestedSmoothedMellinTests.negative_two_four` | `DirichletPadicLFunctions:L2/smoothed-mellin-negative-values` | computation | 2725 / 2726 | For quadratic χ modulo 4 and a=3, the normalized value at −2 is 14. |
| `SuggestedSmoothedMellinTests.negative_one_five` | `DirichletPadicLFunctions:L2/smoothed-mellin-negative-values` | computation | 2729 / 2730 | For quadratic χ modulo 5, χ(2)=−1 and a=6, the normalized value at −1 is 14. |
| `SuggestedSmoothedMellinTests.gauss_one_parameter` | `DirichletPadicLFunctions:L2/smoothed-gauss-mellin-comparison` | degenerate | 2733 / 2734 | For a=1, the displayed finite Gauss kernel has normalized continuation zero for every complex s, without requiring primitive χ or nonzero G. |
| `SuggestedPrimePowerCommonValueTests.unit_smoothing` | `DirichletPadicLFunctions:L2/prime-power-common-special-value` | degenerate | 2835 / 2836 | For a=1 the finite common smoothed value is zero for every k and every character. |
| `SuggestedPrimePowerCommonValueTests.common_mass_three` | `DirichletPadicLFunctions:L2/prime-power-common-special-value` | computation | 2855 / 2856 | The quadratic character modulo 3 with a=4 has common mass 1 in Q, mapping to the complex zeroth derivative and the actual arithmetic mass. |
| `SuggestedPrimePowerCommonValueTests.common_second_three` | `DirichletPadicLFunctions:L2/prime-power-common-special-value` | computation | 2861 / 2862 | The same character and parameter have common second derivative and moment −14. |
| `SuggestedPrimePowerCommonValueTests.common_mass_four` | `DirichletPadicLFunctions:L2/prime-power-common-special-value` | computation | 2909 / 2910 | The quadratic character modulo 4 with a=3 has common mass −2. |
| `SuggestedPrimePowerCommonValueTests.common_quartic_mass` | `DirichletPadicLFunctions:L2/prime-power-common-special-value` | computation | 2933 / 2934 | For χ modulo 5 with ιC(χ(2))=i and a=6, the complex mass is 3+i and the arithmetic mass is 3+ιK(χ(2)). |
| `SuggestedPrimePowerCommonValueTests.normalized_even_first_five` | `DirichletPadicLFunctions:L2/prime-power-common-special-value` | computation | 2938 / 2939 | For quadratic χ modulo 5 and a=6, the common signed element 14 maps to the normalized value at −1 and the negative of the actual first moment. |
| `SuggestedPrimePowerCommonValueTests.shifted_weight_one` | `DirichletPadicLFunctions:L2/prime-power-common-positive-weight` | computation | 2868 / 2869 | Quadratic modulus 3, a=4 and w=1 gives total mass 1. |
| `SuggestedPrimePowerCommonValueTests.shifted_weight_three` | `DirichletPadicLFunctions:L2/prime-power-common-positive-weight` | computation | 2872 / 2873 | Quadratic modulus 3, a=4 and w=3 gives moment −14. |
| `SuggestedPrimePowerCommonValueTests.shifted_weight_two_even` | `DirichletPadicLFunctions:L2/prime-power-common-positive-weight` | computation | 2944 / 2945 | Quadratic modulus 5, a=6 and w=2 gives moment −14, before the signed normalized-Mellin conversion. |
| `SuggestedPrimePowerCommonValueTests.quotient_denominator_one_zero` | `DirichletPadicLFunctions:L2/prime-power-quotient-common-value` | non-example | 2839 / 2840 | At a=1 the smoothing denominator is zero for every character and every order; the quotient theorem’s additional hypothesis cannot be dropped. |
| `SuggestedPrimePowerCommonValueTests.quotient_mass_three` | `DirichletPadicLFunctions:L2/prime-power-quotient-common-value` | computation | 2876 / 2877 | For quadratic modulus 3 and a=4, divide total mass 1 by 3 to get 1/3. |
| `SuggestedPrimePowerCommonValueTests.quotient_second_three` | `DirichletPadicLFunctions:L2/prime-power-quotient-common-value` | computation | 2880 / 2881 | For quadratic modulus 3 and a=4, divide second moment −14 by 63 to get −2/9. |
| `SuggestedPrimePowerCommonValueTests.quotient_quartic_mass` | `DirichletPadicLFunctions:L2/prime-power-quotient-common-value` | computation | 2949 / 2950 | For the quartic modulus 5 character and a=6, divide the actual mass by 5 to get ιK((3+χ(2))/5). |
| `SuggestedPrimePowerCommonValueTests.independence_three_mass` | `DirichletPadicLFunctions:L2/prime-power-smoothing-independent-quotient` | computation | 2884 / 2885 | Quadratic modulus 3 gives τ_4(1)/3=τ_7(1)/6. |
| `SuggestedPrimePowerCommonValueTests.independence_three_second` | `DirichletPadicLFunctions:L2/prime-power-smoothing-independent-quotient` | computation | 2889 / 2890 | Quadratic modulus 3 gives τ_4(x_K²)/63=τ_7(x_K²)/342. |
| `SuggestedPrimePowerCommonValueTests.independence_quartic_mass` | `DirichletPadicLFunctions:L2/prime-power-smoothing-independent-quotient` | computation | 2954 / 2955 | Quartic modulus 5 gives τ_2(1)/(2ιK(χ(2))−1)=τ_6(1)/5. |
| `SuggestedArithmeticCharacterTests.character_identity` | `DirichletPadicLFunctions:L2/prime-power-arithmetic-character` | characterisation | 3073 / 3074 | Every constructed character maps the unit 1 to 1. |
| `SuggestedArithmeticCharacterTests.level_zero_weight_zero` | `DirichletPadicLFunctions:L2/prime-power-arithmetic-character` | degenerate | 3077 / 3078 | At level zero and weight zero the constructed character is the trivial continuous monoid homomorphism. |
| `SuggestedArithmeticCharacterTests.level_zero_square` | `DirichletPadicLFunctions:L2/prime-power-arithmetic-character` | compatibility | 3080 / 3081 | At level zero and weight two its value is exactly x_R(u)². |
| `SuggestedArithmeticCharacterTests.principal_sign` | `DirichletPadicLFunctions:L2/prime-power-arithmetic-character` | computation | 3111 / 3112 | For p=3, the principal character modulo 3 and weight one give κ(−1)=−1. |
| `SuggestedArithmeticCharacterTests.quadratic_weight_one_sign` | `DirichletPadicLFunctions:L2/prime-power-arithmetic-character` | computation | 3114 / 3115 | For quadratic χ modulo 3 with χ(2)=−1 and weight one, κ(−1)=1. |
| `SuggestedArithmeticCharacterTests.quadratic_weight_zero_sign` | `DirichletPadicLFunctions:L2/prime-power-arithmetic-character` | computation | 3118 / 3119 | The same character at weight zero gives κ(−1)=−1. |
| `SuggestedArithmeticCharacterTests.dyadic_quadratic_sign` | `DirichletPadicLFunctions:L2/prime-power-arithmetic-character` | computation | 3142 / 3143 | For quadratic χ modulo 4 with χ(3)=−1 and weight one, κ(−1)=1. |
| `SuggestedArithmeticCharacterTests.dyadic_one_add_pow` | `DirichletPadicLFunctions:L2/prime-power-arithmetic-character` | computation | 3146 / 3147 | At p=2,n=1,w=2, the unit represented by 5 has κ-value 25. |
| `SuggestedArithmeticCharacterTests.positive_weight_nontrivial` | `DirichletPadicLFunctions:L2/prime-power-arithmetic-character-nontrivial` | compatibility | 3084 / 3085 | At positive weight one the principal level-p character still gives a nontrivial arithmetic character. |
| `SuggestedArithmeticCharacterTests.dyadic_positive_zero_level` | `DirichletPadicLFunctions:L2/prime-power-arithmetic-character-nontrivial` | compatibility | 3150 / 3151 | At p=2 and level zero, weight one gives a nontrivial arithmetic character. |
| `SuggestedArithmeticCharacterTests.numerator_one_parameter` | `DirichletPadicLFunctions:L2/intrinsic-numerator-character-shift` | degenerate | 3090 / 3091 | At smoothing parameter a=1 the actual intrinsic numerator evaluates to zero on every arithmetic character. |
| `SuggestedArithmeticCharacterTests.principal_numerator_second` | `DirichletPadicLFunctions:L2/intrinsic-numerator-character-shift` | computation | 3122 / 3123 | At p=3,a=2, the principal character modulo 3 and weight two give the intrinsic numerator value 1/2 in Q_3. |
| `SuggestedArithmeticCharacterTests.level_zero_shift_fails` | `DirichletPadicLFunctions:L2/intrinsic-numerator-character-shift` | non-example | 3126 / 3127 | At p=3,a=2,w=1, the level-zero intrinsic value is 0 but the level-zero twisted mass is +1/2. |
| `SuggestedArithmeticCharacterTests.numerator_quadratic_weight_one` | `DirichletPadicLFunctions:L2/intrinsic-numerator-character-shift` | computation | 3173 / 3174 | For quadratic modulus 3 and a=4, with the explicit coefficient/root/Gauss hypotheses, the actual intrinsic numerator character value at weight one is 1. |
| `SuggestedArithmeticCharacterTests.numerator_quadratic_weight_three` | `DirichletPadicLFunctions:L2/intrinsic-numerator-character-shift` | computation | 3177 / 3178 | For the same data, the actual intrinsic numerator character value at weight three is −14. |
| `SuggestedArithmeticCharacterTests.denominator_identity` | `DirichletPadicLFunctions:L2/two-dirac-arithmetic-character` | degenerate | 3095 / 3096 | The difference of the two identity Dirac masses has arithmetic character value zero. |
| `SuggestedArithmeticCharacterTests.denominator_trivial_weight` | `DirichletPadicLFunctions:L2/two-dirac-arithmetic-character` | degenerate | 3101 / 3102 | For the principal character at weight zero, every two-Dirac denominator evaluates to zero. |
| `SuggestedArithmeticCharacterTests.ternary_denominator` | `DirichletPadicLFunctions:L2/two-dirac-arithmetic-character` | computation | 3131 / 3132 | Quadratic modulus 3, a=2 and weight one give denominator −3. |
| `SuggestedArithmeticCharacterTests.dyadic_denominator` | `DirichletPadicLFunctions:L2/two-dirac-arithmetic-character` | computation | 3153 / 3154 | Quadratic modulus 4, a=3 and weight one give denominator −4. |
| `SuggestedArithmeticCharacterTests.common_numerator_zero_value` | `DirichletPadicLFunctions:L2/intrinsic-numerator-common-character-value` | computation | 3181 / 3182 | For quadratic modulus 3 and a=4 at weight one, the element 1 maps to 3L(χC,0) and the actual intrinsic numerator value. |
| `SuggestedArithmeticCharacterTests.common_numerator_quotient` | `DirichletPadicLFunctions:L2/intrinsic-numerator-common-character-value` | computation | 3187 / 3188 | For the same data the element 1/3 maps to L(χC,0) and the actual intrinsic numerator value divided by 3. |
| `SuggestedPseudomeasureCharacterTests.natural_identity_numerator` | `DirichletPadicLFunctions:L2/pseudomeasure-natural-numerator` | degenerate | 3304 / 3305 | At the identity unit the actual numerator equals intrinsicSmoothedNumerator(p,1). |
| `SuggestedPseudomeasureCharacterTests.natural_arbitrary_parameter` | `DirichletPadicLFunctions:L2/pseudomeasure-natural-numerator` | compatibility | 3308 / 3309 | For every natural a prime to p and explicit unit representative u, the supplier numerator equals the existing natural intrinsic numerator. |
| `SuggestedPseudomeasureCharacterTests.numerator_weight_one` | `DirichletPadicLFunctions:L2/pseudomeasure-character-numerator` | compatibility | 3313 / 3314 | In weight one the actual cleared numerator character value equals the total mass of the twisted smoothed measure. |
| `SuggestedPseudomeasureCharacterTests.identity_character_numerator` | `DirichletPadicLFunctions:L2/pseudomeasure-character-numerator` | degenerate | 3321 / 3322 | At the identity unit the cleared numerator character value is zero for every n,w and χ. |
| `SuggestedPseudomeasureCharacterTests.principal_unit_weight_one_value` | `DirichletPadicLFunctions:L2/prime-power-principal-unit-value` | computation | 3294 / 3295 | At weight one the character value is the coefficient-ring image of 1+p^(n+1). |
| `SuggestedPseudomeasureCharacterTests.principal_unit_weight_zero_value` | `DirichletPadicLFunctions:L2/prime-power-principal-unit-value` | degenerate | 3299 / 3300 | At weight zero the character value at this principal unit is 1. |
| `SuggestedPseudomeasureCharacterTests.zero_level_positive_admissible` | `DirichletPadicLFunctions:L2/prime-power-admissible-principal-unit` | compatibility | 3327 / 3328 | At level zero and weight one the unit represented by 1+p has an invertible character denominator. |
| `SuggestedPseudomeasureCharacterTests.identity_inadmissible` | `DirichletPadicLFunctions:L2/prime-power-admissible-principal-unit` | non-example | 3332 / 3333 | The identity unit has zero character denominator for every level and weight. |
| `SuggestedPseudomeasureCharacterTests.zero_weight_principal_inadmissible` | `DirichletPadicLFunctions:L2/prime-power-admissible-principal-unit` | non-example | 3336 / 3337 | For a principal character at weight zero every unit gives zero denominator. |
| `SuggestedPseudomeasureCharacterTests.ring_map_identity_inadmissible` | `DirichletPadicLFunctions:L2/pseudomeasure-character-evaluation-ratio` | non-example | 3340 / 3341 | For the given ring map the identity clearing factor has nonunit image zero. |
| `SuggestedPseudomeasureCharacterTests.principal_unit_ring_map_admissible` | `DirichletPadicLFunctions:L2/pseudomeasure-character-evaluation-ratio` | compatibility | 3343 / 3344 | For a compatible ring map and positive weight, the image of the clearing factor at 1+p^(n+1) is a unit. |
| `SuggestedPseudomeasureCharacterTests.conditional_smoothing_independent` | `DirichletPadicLFunctions:L2/pseudomeasure-character-evaluation-ratio` | compatibility | 3350 / 3351 | For a given compatible ring map, any two admissible clearing units give the same value on ζ_p. |
| `SuggestedPseudomeasureCharacterTests.conditional_quadratic_zero_value` | `DirichletPadicLFunctions:L2/pseudomeasure-common-character-value` | computation | 3389 / 3390 | For the quadratic character modulo 3, a=4 and weight one, the actual evalAt value is 1/3 under the explicit field, root, Gauss sum and compatible ring-map hypotheses. |
| `SuggestedPseudomeasureCharacterTests.conditional_quadratic_negative_two` | `DirichletPadicLFunctions:L2/pseudomeasure-common-character-value` | computation | 3397 / 3398 | For the same character and parameter at weight three, the actual evalAt value is −2/9 under those hypotheses. |
| `SuggestedIntrinsicTameTests.arithmetic_unit_test_formula` | `DirichletPadicLFunctions:L2/arithmetic-character-pointwise-value` | characterisation | 3498 / 3499 | Every actual unit has the displayed lifted-character times coordinate-power value. |
| `SuggestedIntrinsicTameTests.arithmetic_unit_weight_zero_formula` | `DirichletPadicLFunctions:L2/arithmetic-character-pointwise-value` | degenerate | 3503 / 3504 | At weight zero the character is the restriction of the finite-order lift. |
| `SuggestedIntrinsicTameTests.trivial_tame_level` | `DirichletPadicLFunctions:L2/intrinsic-tame-zeta-measure` | degenerate | 3507 / 3508 | At D=1 the constructed intrinsic tame measure is zero. |
| `SuggestedIntrinsicTameTests.zero_test` | `DirichletPadicLFunctions:L2/intrinsic-tame-zeta-measure` | degenerate | 3511 / 3512 | Evaluation on the zero continuous test is zero. |
| `SuggestedIntrinsicTameTests.unique_pushforward` | `DirichletPadicLFunctions:L2/intrinsic-tame-zeta-measure` | characterisation | 3515 / 3516 | Every measure on U whose actual pushforward is ζ_η equals ζ_η^U. |
| `SuggestedIntrinsicTameTests.first_unit_moment` | `DirichletPadicLFunctions:L2/intrinsic-tame-zeta-measure` | computation | 3568 / 3569 | At p=2, η quadratic modulo 3 and weight one with the level-zero principal character, ζ_η^U has arithmetic character value 2/3. |
| `SuggestedIntrinsicTameTests.inclusion_all_tests` | `DirichletPadicLFunctions:L2/intrinsic-tame-zeta-inclusion` | compatibility | 3521 / 3522 | For every continuous ambient test f, ζ_η^U(f∘Units.val)=ζ_η(f). |
| `SuggestedIntrinsicTameTests.inclusion_identity_test` | `DirichletPadicLFunctions:L2/intrinsic-tame-zeta-inclusion` | compatibility | 3528 / 3529 | The intrinsic and ambient tame measures have equal total mass. |
| `SuggestedIntrinsicTameTests.zero_weight_character` | `DirichletPadicLFunctions:L2/intrinsic-tame-character-value` | degenerate | 3532 / 3533 | At weight zero the intrinsic character integral agrees with the ambient finite-character test. |
| `SuggestedIntrinsicTameTests.zero_level_zero_weight_mass` | `DirichletPadicLFunctions:L2/intrinsic-tame-character-value` | degenerate | 3538 / 3539 | At level and weight zero the principal arithmetic character evaluates to the total mass. |
| `SuggestedIntrinsicTameTests.matching_coefficient_algebra_hom` | `DirichletPadicLFunctions:L2/intrinsic-tame-character-value` | compatibility | 3544 / 3545 | The existing K-algebra character integral agrees exactly with direct evaluation of the K-valued intrinsic measure. |
| `SuggestedIntrinsicTameTests.total_mass_bound` | `DirichletPadicLFunctions:L2/intrinsic-tame-zeta-norm` | compatibility | 3550 / 3551 | The norm of the intrinsic total mass is at most one. |
| `SuggestedIntrinsicTameTests.norm_bound_all_tests` | `DirichletPadicLFunctions:L2/intrinsic-tame-zeta-norm` | compatibility | 3554 / 3555 | Every continuous K-valued unit test satisfies the displayed norm bound. |
| `SuggestedIntrinsicTameTests.quadratic_product_weight_two` | `DirichletPadicLFunctions:L2/intrinsic-tame-common-character-value` | computation | 3573 / 3574 | At p=2, η quadratic modulo 3 and χ quadratic modulo 4, the intrinsic arithmetic character value in weight two is −2. |
| `SuggestedIntrinsicTameTests.quadratic_product_weight_four` | `DirichletPadicLFunctions:L2/intrinsic-tame-common-character-value` | computation | 3577 / 3578 | For the same characters in weight four the value is 46. |
| `SuggestedIntrinsicTameTests.principal_positive_level_first` | `DirichletPadicLFunctions:L2/intrinsic-tame-common-character-value` | computation | 3581 / 3582 | At p=2, η quadratic modulo 3 and the principal character modulo 2, the weight-one value is 2/3, agreeing with level zero. |
| `SuggestedIntegralUnitTests.norm_zero_weight` | `DirichletPadicLFunctions:L2/arithmetic-character-norm` | degenerate | 3724 / 3725 | At weight zero the arithmetic character still has norm at most one. |
| `SuggestedIntegralUnitTests.norm_all_positive_weights` | `DirichletPadicLFunctions:L2/arithmetic-character-norm` | compatibility | 3728 / 3729 | Every positive integral weight satisfies the same bound on every actual unit. |
| `SuggestedIntegralUnitTests.integral_character_identity` | `DirichletPadicLFunctions:L2/integral-arithmetic-character` | characterisation | 3732 / 3733 | The constructed integral character sends the identity unit to one in O. |
| `SuggestedIntegralUnitTests.integral_character_trivial_boundary` | `DirichletPadicLFunctions:L2/integral-arithmetic-character` | degenerate | 3736 / 3737 | At level zero, weight zero and principal finite character it is the trivial continuous monoid homomorphism. |
| `SuggestedIntegralUnitTests.integral_character_principal_sign` | `DirichletPadicLFunctions:L2/integral-arithmetic-character` | non-example | 3744 / 3745 | At level zero and weight one, its value at −1 includes as −1 in K. |
| `SuggestedIntegralUnitTests.integral_character_coefficient` | `DirichletPadicLFunctions:L2/integral-arithmetic-character-coefficient` | compatibility | 3739 / 3740 | Every included integral arithmetic character value agrees exactly with the native K-valued character. |
| `SuggestedIntegralUnitTests.integral_tame_modulus_one` | `DirichletPadicLFunctions:L2/intrinsic-integral-tame-zeta-measure` | degenerate | 3747 / 3748 | At tame modulus one the intrinsic integral measure is zero. |
| `SuggestedIntegralUnitTests.integral_zero_test` | `DirichletPadicLFunctions:L2/intrinsic-integral-tame-zeta-measure` | degenerate | 3751 / 3752 | The intrinsic integral measure evaluates the zero continuous test to zero. |
| `SuggestedIntegralUnitTests.integral_unique_ambient` | `DirichletPadicLFunctions:L2/intrinsic-integral-tame-zeta-measure` | characterisation | 3755 / 3756 | Any O-valued unit measure with ambient pushforward ζO equals the constructed measure. |
| `SuggestedIntegralUnitTests.integral_inclusion_all_tests` | `DirichletPadicLFunctions:L2/intrinsic-integral-tame-inclusion` | compatibility | 3760 / 3761 | For every continuous ambient O-test f, ζO^U(f∘Units.val)=ζO(f). |
| `SuggestedIntegralUnitTests.integral_inclusion_mass` | `DirichletPadicLFunctions:L2/intrinsic-integral-tame-inclusion` | compatibility | 3765 / 3766 | Intrinsic and ambient integral measures have equal total mass in O. |
| `SuggestedIntegralUnitTests.coefficient_all_tests` | `DirichletPadicLFunctions:L2/intrinsic-integral-tame-coefficients` | compatibility | 3769 / 3770 | The coefficient comparison holds on every actual continuous O-valued unit test. |
| `SuggestedIntegralUnitTests.integral_mass_norm` | `DirichletPadicLFunctions:L2/intrinsic-integral-tame-coefficients` | compatibility | 3774 / 3775 | The total mass in O has norm at most one. |
| `SuggestedIntegralUnitTests.coefficient_unique_all_tests` | `DirichletPadicLFunctions:L2/intrinsic-integral-tame-coefficients` | characterisation | 3778 / 3779 | The all-O-test coefficient comparison uniquely determines the integral unit measure. |
| `SuggestedIntegralUnitTests.integral_character_zero_weight` | `DirichletPadicLFunctions:L2/intrinsic-integral-tame-character-value` | degenerate | 3783 / 3784 | At weight zero the included integral character integral agrees with the field-valued one. |
| `SuggestedIntegralUnitTests.integral_character_total_mass` | `DirichletPadicLFunctions:L2/intrinsic-integral-tame-character-value` | degenerate | 3790 / 3791 | The principal character at level and weight zero gives the included total mass. |
| `SuggestedIntegralUnitTests.integral_character_value_mem_integer` | `DirichletPadicLFunctions:L2/intrinsic-integral-tame-character-value` | compatibility | 3796 / 3797 | Every nonnegative-weight field-valued arithmetic character value of ζK^U belongs to the displayed native integer ring. |
| `SuggestedIntegralUnitTests.integral_common_first_value` | `DirichletPadicLFunctions:L2/intrinsic-integral-tame-common-value` | computation | 3812 / 3813 | For p=2, η quadratic modulo 3 and the principal level-zero character in weight one, the included integral value is 2/3. |
| `SuggestedIntegralUnitTests.integral_common_twisted_value` | `DirichletPadicLFunctions:L2/intrinsic-integral-tame-common-value` | computation | 3817 / 3818 | For the same η with quadratic χ modulo 4 in weight two, the included integral value is −2. |
| `SuggestedEisensteinAwayTests.zero_level_coordinate_character` | `DirichletPadicLFunctions:L2/arithmetic-character-zero-level` | compatibility | 3858 / 3859 | Over Z itself the level-zero character evaluates to the native coordinate power. |
| `SuggestedTameCongruenceTests.wild_level_above_precision` | `DirichletPadicLFunctions:L2/integral-arithmetic-character-weight-congruence` | compatibility | 3906 / 3907 | At p=2, any character of level 8 has exponents zero and one congruent modulo 2 on units. |
| `SuggestedTameCongruenceTests.dyadic_pointwise_eight` | `DirichletPadicLFunctions:L2/integral-arithmetic-character-weight-congruence` | computation | 3911 / 3912 | At p=2, fixed characters at level 4 have exponents one and five congruent modulo 8 on all units. |
| `SuggestedTameCongruenceTests.missing_totient_factor` | `DirichletPadicLFunctions:L2/integral-arithmetic-character-weight-congruence` | non-example | 3920 / 3921 | At p=5, 5 does not divide 2¹−2⁰; congruence modulo p^(r−1) alone is insufficient. |
| `SuggestedTameScalarTests.dyadic_residue_shift` | `DirichletPadicLFunctions:L2/tame-residue-cyclic-shift` | computation | 3966 / 3967 | At p=2,D=3,n=3 the masses of residues3 and1 differ by−1. |
| `SuggestedTameScalarTests.triadic_residue_shift` | `DirichletPadicLFunctions:L2/tame-residue-cyclic-shift` | computation | 3984 / 3985 | At p=3,D=4,n=2 the masses of residues2 and1 differ by−1. |
| `SuggestedTameScalarTests.adding_quotient_is_not_shift` | `DirichletPadicLFunctions:L2/tame-residue-cyclic-shift` | non-example | 3973 / 3974 | Adding the quotient modulus inside ZMod(p^n) gives zero mass difference, not the claimed cyclic shift. |
| `SuggestedTameVariationTests.coefficient_self` | `DirichletPadicLFunctions:L2/tame-character-coefficient-variation` | degenerate | 4048 / 4049 | Identical characters have zero coefficient difference. |
| `SuggestedTameVariationTests.coefficient_level_one` | `DirichletPadicLFunctions:L2/tame-character-coefficient-variation` | degenerate | 4052 / 4053 | At tame modulus one the two actual tame series have zero difference in every degree. |
| `SuggestedTameVariationTests.principal_three_coefficient_bound` | `DirichletPadicLFunctions:L2/tame-character-coefficient-variation` | computation | 4072 / 4073 | At p=2,D=3 a supplied χ with χ(2)=−1 and the principal character have all coefficient differences bounded by1/2. |
| `SuggestedTameVariationTests.measure_self` | `DirichletPadicLFunctions:L2/tame-character-measure-variation` | degenerate | 4056 / 4057 | The operator norm of the difference of a tame measure from itself is zero. |
| `SuggestedTameVariationTests.measure_evaluation` | `DirichletPadicLFunctions:L2/tame-character-measure-variation` | compatibility | 4059 / 4060 | The difference on every actual K-valued continuous test f is bounded by B times its supremum norm. |
| `SuggestedDyadicClassificationTests.reference_nine` | `DirichletPadicLFunctions:L2/dyadic-tame-quadratic-reference` | computation | 4112 / 4113 | An actual nonprincipal quadratic character at modulus9 is within1/2 of the principal character. |
| `SuggestedDyadicClassificationTests.reference_fifteen` | `DirichletPadicLFunctions:L2/dyadic-tame-quadratic-reference` | computation | 4116 / 4117 | The same existence statement holds at modulus15, including its additional nonunits. |
| `SuggestedDyadicClassificationTests.no_reference_one` | `DirichletPadicLFunctions:L2/dyadic-tame-quadratic-reference` | non-example | 4120 / 4121 | There is no nonprincipal native Dirichlet character at modulus one. |
| `SuggestedIntegralUnitTwistTests.level_zero_to_positive` | `DirichletPadicLFunctions:L2/integral-arithmetic-character-level` | degenerate | 4193 / 4194 | For every m,w, the principal arithmetic unit characters at levels p^m and1 agree. |
| `SuggestedIntegralUnitTwistTests.ambient_zero_boundary` | `DirichletPadicLFunctions:L2/integral-arithmetic-character-level` | non-example | 4259 / 4260 | For p=2 the principal ambient functions at levels1 and4 have different values at0. |
| `SuggestedIntegralUnitTwistTests.product_zero_weight` | `DirichletPadicLFunctions:L2/integral-arithmetic-character-product` | degenerate | 4198 / 4199 | Multiplying a weight-zero finite character by a weight-w arithmetic character multiplies their finite factors and preserves w. |
| `SuggestedIntegralUnitTwistTests.product_positive_weights` | `DirichletPadicLFunctions:L2/integral-arithmetic-character-product` | compatibility | 4204 / 4205 | Weights1 and2 multiply to weight3, with finite character χψ. |
| `SuggestedIntegralUnitTwistTests.restriction_all_tests` | `DirichletPadicLFunctions:L2/integral-tame-twist-unit-restriction` | characterisation | 4210 / 4211 | On every continuous f:U→O, r_UνOχ(f)=ζO^U(κO_(n,χ,0)f). |
| `SuggestedIntegralUnitTwistTests.restriction_principal` | `DirichletPadicLFunctions:L2/integral-tame-twist-unit-restriction` | compatibility | 4217 / 4218 | The restriction of every principal finite-character twist is exactly ζO^U. |
| `SuggestedIntegralUnitTwistTests.restriction_modulus_one` | `DirichletPadicLFunctions:L2/integral-tame-twist-unit-restriction` | degenerate | 4224 / 4225 | For D=1 the restricted twisted measure is zero. |
| `SuggestedIntegralUnitTwistTests.moment_zero_weight` | `DirichletPadicLFunctions:L2/integral-tame-twist-arithmetic-moment` | degenerate | 4229 / 4230 | At w=0, evaluation is the actual integral of the product finite character, without a logarithmic value claim. |
| `SuggestedIntegralUnitTwistTests.quadratic_second_moment` | `DirichletPadicLFunctions:L2/integral-tame-twist-arithmetic-moment` | computation | 4263 / 4264 | The restricted quadratic twist at p=2,D=3 evaluated on the principal weight2 test includes as−2 in ℚ_2. |
| `SuggestedIntegralUnitTwistTests.quadratic_fourth_moment` | `DirichletPadicLFunctions:L2/integral-tame-twist-arithmetic-moment` | computation | 4271 / 4272 | For the same characters the principal weight4 test includes as46 in ℚ_2. |
| `SuggestedIntegralUnitTwistTests.inverse_all_tests` | `DirichletPadicLFunctions:L2/integral-tame-twist-unit-inverse` | characterisation | 4237 / 4238 | Weighting each continuous O-test by the inverse finite character recovers its original ζO^U integral. |
| `SuggestedIntegralUnitTwistTests.inverse_after_level_raise` | `DirichletPadicLFunctions:L2/integral-tame-twist-unit-inverse` | compatibility | 4244 / 4245 | The original inverse unit character cancels the twist even after raising its finite level. |
| `SuggestedIntegralUnitCongruenceTests.zero_ideal_exact_relation` | `DirichletPadicLFunctions:L2/intrinsic-integral-tame-test-congruence` | degenerate | 4332 / 4333 | Divisibility by0 of every pointwise difference gives equality of the actual integral values. |
| `SuggestedIntegralUnitCongruenceTests.integral_test_perturbation` | `DirichletPadicLFunctions:L2/intrinsic-integral-tame-test-congruence` | compatibility | 4338 / 4339 | Changing f by b times any continuous integral test changes its integral by a multiple of b in O. |
| `SuggestedIntegralUnitCongruenceTests.wild_level_above_precision` | `DirichletPadicLFunctions:L2/intrinsic-integral-tame-weight-congruence` | compatibility | 4391 / 4392 | At p=2, every χ modulo8 has its weight1 and weight0 integrals congruent modulo2. |
| `SuggestedIntegralUnitCongruenceTests.dyadic_weight_period` | `DirichletPadicLFunctions:L2/intrinsic-integral-tame-weight-congruence` | computation | 4399 / 4400 | At p=2 and any χ modulo4, weight5 and weight1 integrals are congruent modulo8. |
| `SuggestedIntegralUnitCongruenceTests.missing_totient_factor_changes_values` | `DirichletPadicLFunctions:L2/intrinsic-integral-tame-weight-congruence` | non-example | 4416 / 4417 | At p=5 and quadratic η modulo3, the principal weight2 and weight1 values differ by−2/3, which is not divisible by5 in O. |
| `SuggestedIntegralUnitCongruenceTests.finite_family_kernel` | `DirichletPadicLFunctions:L2/intrinsic-integral-tame-finite-congruence` | characterisation | 4344 / 4345 | A pointwise zero finite O-linear combination gives an exact zero combination of the actual integral values. |
| `SuggestedIntegralUnitCongruenceTests.empty_family` | `DirichletPadicLFunctions:L2/intrinsic-integral-tame-finite-congruence` | degenerate | 4352 / 4353 | Every b divides the integral-value sum indexed by Fin0. |
| `SuggestedIntegralUnitCongruenceTests.mixed_levels_at_zero_weight` | `DirichletPadicLFunctions:L2/intrinsic-integral-tame-finite-congruence` | compatibility | 4358 / 4359 | A pointwise relation between two weight-zero characters of arbitrary different levels gives the same divisibility relation between their integrals. |
| `SuggestedIntegralUnitCongruenceTests.principal_zero_level_twist` | `DirichletPadicLFunctions:L2/integral-tame-twist-test-congruence` | degenerate | 4368 / 4369 | The principal level-zero restricted twist preserves the same b-divisibility of all-test differences. |
| `SuggestedIntegralUnitCongruenceTests.twisted_arithmetic_tests` | `DirichletPadicLFunctions:L2/integral-tame-twist-test-congruence` | compatibility | 4376 / 4377 | A pointwise b-congruence for ψ arithmetic tests induces the corresponding congruence of χψ tame character values. |
| `SuggestedTameFieldComparisonTests.mass_transport` | `DirichletPadicLFunctions:L2/tame-measure-field-comparison` | compatibility | 4453 / 4454 | The actual total mass maps by ι to the total mass of the mapped-character measure. |
| `SuggestedTameFieldComparisonTests.mahler_test_transport` | `DirichletPadicLFunctions:L2/tame-measure-field-comparison` | compatibility | 4459 / 4460 | Every native K-valued Mahler test maps to the corresponding L-valued one and their tame values agree through ι. |
| `SuggestedTameFieldComparisonTests.modulus_one_after_extension` | `DirichletPadicLFunctions:L2/tame-measure-field-comparison` | degenerate | 4467 / 4468 | The D=1 measures give zero on every original and mapped continuous test. |
| `SuggestedTameFieldComparisonTests.dyadic_quadratic_mass_in_extension` | `DirichletPadicLFunctions:L2/tame-measure-field-comparison` | computation | 4488 / 4489 | For quadratic η modulo3 over ℚ_2, the mapped measure has mass1/3 in every eligible extension L. |
| `SuggestedTameFieldComparisonTests.dyadic_quadratic_second_mahler_in_extension` | `DirichletPadicLFunctions:L2/tame-measure-field-comparison` | non-example | 4493 / 4494 | The same measure on the second Mahler test has value−1/9, not its ordinary second moment−2/9. |
| `SuggestedTameZetaFieldComparisonTests.inverse_stays_zero_on_nonunits` | `DirichletPadicLFunctions:L2/tame-zeta-unrestricted-weight` | non-example | 4555 / 4556 | In a compatible field extension, both coefficient images of PadicInt.inv x are zero for every nonunit x. |
| `SuggestedTameZetaFieldComparisonTests.ambient_mass_transport` | `DirichletPadicLFunctions:L2/tame-zeta-field-comparison` | compatibility | 4534 / 4535 | The total mass of the actual ambient zeta measure maps to the mass in L, without a special-value interpretation. |
| `SuggestedTameZetaFieldComparisonTests.positive_moment_transport` | `DirichletPadicLFunctions:L2/tame-zeta-field-comparison` | compatibility | 4540 / 4541 | Every positive ordinary moment maps to the same power test over L. |
| `SuggestedTameZetaFieldComparisonTests.ambient_modulus_one_zero` | `DirichletPadicLFunctions:L2/tame-zeta-field-comparison` | degenerate | 4548 / 4549 | At D=1 both ambient zeta evaluations are zero for every original and mapped test. |
| `SuggestedTameZetaFieldComparisonTests.intrinsic_mass_transport` | `DirichletPadicLFunctions:L2/intrinsic-tame-zeta-field-comparison` | compatibility | 4560 / 4561 | Actual intrinsic total masses agree through the coefficient map. |
| `SuggestedTameZetaFieldComparisonTests.intrinsic_arithmetic_character_transport` | `DirichletPadicLFunctions:L2/intrinsic-tame-zeta-field-comparison` | compatibility | 4566 / 4567 | Every arithmetic unit character maps both its Dirichlet value and coordinate power; n=0 and w=0 remain allowed. |
| `SuggestedTameZetaFieldComparisonTests.intrinsic_modulus_one_zero` | `DirichletPadicLFunctions:L2/intrinsic-tame-zeta-field-comparison` | degenerate | 4575 / 4576 | At D=1 every original and mapped intrinsic test has value zero. |
| `SuggestedTameZetaFieldComparisonTests.dyadic_intrinsic_first_moment_in_extension` | `DirichletPadicLFunctions:L2/intrinsic-tame-zeta-field-comparison` | computation | 4596 / 4597 | The quadratic modulo3 intrinsic first moment remains2/3 after a compatible continuous extension of ℚ_2. |
| `SuggestedTameIntegralFieldComparisonTests.trivial_arithmetic_character_transport` | `DirichletPadicLFunctions:L2/integral-arithmetic-character-field-comparison` | degenerate | 4628 / 4629 | The level-zero, weight-zero principal character maps to1 on every actual unit. |
| `SuggestedTameIntegralFieldComparisonTests.arithmetic_sign_after_extension` | `DirichletPadicLFunctions:L2/integral-arithmetic-character-field-comparison` | non-example | 4633 / 4634 | The level-zero principal character of weight one still takes value−1 at−1 after coefficient extension. |
| `SuggestedTameIntegralFieldComparisonTests.integral_tame_mass_transport` | `DirichletPadicLFunctions:L2/integral-tame-measure-field-comparison` | compatibility | 4688 / 4689 | The actual integral tame total mass maps by c to the target integral mass. |
| `SuggestedTameIntegralFieldComparisonTests.integral_tame_modulus_one` | `DirichletPadicLFunctions:L2/integral-tame-measure-field-comparison` | degenerate | 4694 / 4695 | At D=1 the original and mapped integral tame values are zero on every original and mapped test. |
| `SuggestedTameIntegralFieldComparisonTests.integral_zeta_mass_transport` | `DirichletPadicLFunctions:L2/integral-tame-zeta-field-comparison` | compatibility | 4701 / 4702 | Actual integral ambient zeta total masses compare through c, without a degree-zero L-value formula. |
| `SuggestedTameIntegralFieldComparisonTests.integral_zeta_modulus_one` | `DirichletPadicLFunctions:L2/integral-tame-zeta-field-comparison` | degenerate | 4707 / 4708 | At D=1 every original and mapped ambient integral zeta test gives zero. |
| `SuggestedTameIntegralFieldComparisonTests.integral_arithmetic_moment_transport` | `DirichletPadicLFunctions:L2/intrinsic-integral-tame-field-comparison` | compatibility | 4714 / 4715 | Actual integral unit-character values compare with both tame and wild character values mapped; n=0 and w=0 are included. |
| `SuggestedTameIntegralFieldComparisonTests.intrinsic_integral_modulus_one` | `DirichletPadicLFunctions:L2/intrinsic-integral-tame-field-comparison` | degenerate | 4723 / 4724 | At D=1 every original and mapped intrinsic integral evaluation is zero. |
| `SuggestedTameIntegralFieldComparisonTests.zero_ideal_reflects_equality` | `DirichletPadicLFunctions:L2/intrinsic-integral-tame-field-congruence` | degenerate | 4730 / 4731 | Equality of the target evaluations on mapped tests is equivalent to equality of the original evaluations. |
| `SuggestedTameIntegralFieldComparisonTests.same_rational_prime_precision` | `DirichletPadicLFunctions:L2/intrinsic-integral-tame-field-congruence` | compatibility | 4737 / 4738 | Divisibility by p^r of the evaluation difference is equivalent before and after extension, retaining exactly p^r on both sides. |
| `SuggestedTameCharacterFieldTests.principal_modulus_one_field` | `DirichletPadicLFunctions:L2/tame-character-field` | degenerate | 4801 / 4802 | The principal character modulo1 generates the bottom intermediate field. |
| `SuggestedTameCharacterFieldTests.quadratic_character_needs_only_base` | `DirichletPadicLFunctions:L2/tame-character-field` | computation | 4804 / 4805 | Every quadratic character modulo3 generates exactly the base-field image, for every p. |
| `SuggestedTameCharacterFieldTests.nonbase_value_prevents_base_field` | `DirichletPadicLFunctions:L2/tame-character-field` | non-example | 4808 / 4809 | If one actual value is outside the bottom field, Fη is not bottom. |
| `SuggestedTameCharacterFieldTests.quadratic_field_degree_one` | `DirichletPadicLFunctions:L2/tame-character-field-finite` | computation | 4828 / 4829 | A quadratic character has coefficient-field degree1 over ℚ_p. |
| `SuggestedTameCharacterFieldTests.completeness_without_ambient_completeness` | `DirichletPadicLFunctions:L2/tame-character-field-complete` | compatibility | 4844 / 4845 | The actual character field is complete although the statement does not assume the ambient normed field complete. |
| `SuggestedTameCharacterFieldTests.dyadic_character_field_complete` | `DirichletPadicLFunctions:L2/tame-character-field-complete` | computation | 4848 / 4849 | At p=2, the field generated by any character modulo5 in a normed ℚ_2-algebra is complete. |
| `SuggestedTameCharacterFieldTests.modulus_one_restricted_character` | `DirichletPadicLFunctions:L2/tame-character-in-field` | degenerate | 4813 / 4814 | The principal character modulo1 remains principal after restriction to its generated field. |
| `SuggestedTameCharacterFieldTests.restricted_character_nonunit_zero` | `DirichletPadicLFunctions:L2/tame-character-in-field` | compatibility | 4816 / 4817 | The restricted character still vanishes on every native nonunit. |
| `SuggestedTameCharacterFieldTests.restricted_quadratic_sign` | `DirichletPadicLFunctions:L2/tame-character-in-field` | non-example | 4820 / 4821 | A value−1 at residue2 modulo3 remains−1 in the generated field, detecting loss of the character sign. |
| `SuggestedTameCharacterFieldTests.nonprincipal_character_stays_nonprincipal` | `DirichletPadicLFunctions:L2/tame-character-field-recovery` | compatibility | 4824 / 4825 | A nonprincipal character remains nonprincipal over its generated field. |
| `SuggestedTameCharacterDescentTests.scalar_tower_on_integer` | `DirichletPadicLFunctions:L2/tame-character-field-integer-tower` | compatibility | 4942 / 4943 | For every x∈ℤ_p, inclusion of its native image in Fη is exactly its displayed image in K. |
| `SuggestedTameCharacterDescentTests.bounded_integer_scalar_action` | `DirichletPadicLFunctions:L2/tame-character-field-bounded-action` | compatibility | 4945 / 4946 | For every r∈ℤ_p and x∈Fη, the actual inherited action satisfies ‖r•x‖≤‖r‖‖x‖. |
| `SuggestedTameCharacterDescentTests.integer_inclusion_reflects_divisibility` | `DirichletPadicLFunctions:L2/tame-character-field-valuation-extension` | compatibility | 4948 / 4949 | The actual integer-ring inclusion preserves and reflects x∣y, for all x,y including0. |
| `SuggestedTameCharacterDescentTests.zero_ideal_is_not_vacuous` | `DirichletPadicLFunctions:L2/tame-character-field-valuation-extension` | non-example | 4951 / 4952 | j(0) divides j(x−y) if and only if x=y. |
| `SuggestedTameCharacterDescentTests.tame_mass_in_character_field` | `DirichletPadicLFunctions:L2/tame-measure-character-field-descent` | compatibility | 4954 / 4955 | The smaller-field mass includes to the original tame mass. |
| `SuggestedTameCharacterDescentTests.tame_mahler_in_character_field` | `DirichletPadicLFunctions:L2/tame-measure-character-field-descent` | compatibility | 4957 / 4958 | Every native Mahler-basis moment over Fη includes to the corresponding K-valued moment with its actual compatible ℤ_p action. |
| `SuggestedTameCharacterDescentTests.modulus_one_tame_descent_is_zero` | `DirichletPadicLFunctions:L2/tame-measure-character-field-descent` | degenerate | 4984 / 4985 | At D=1 both actual tame measures give0 on every transported continuous test. |
| `SuggestedTameCharacterDescentTests.zeta_mass_in_character_field` | `DirichletPadicLFunctions:L2/tame-zeta-character-field-descent` | compatibility | 4962 / 4963 | The smaller-field zeta mass includes to the original zeta mass. |
| `SuggestedTameCharacterDescentTests.intrinsic_positive_moment_in_character_field` | `DirichletPadicLFunctions:L2/intrinsic-tame-character-field-descent` | compatibility | 4965 / 4966 | For every w≥0, the native trivial finite character times x^(w+1) has the same intrinsic moment after inclusion from Fη to K. |
| `SuggestedTameCharacterDescentTests.integral_tame_mass_in_character_field` | `DirichletPadicLFunctions:L2/integral-tame-character-field-descent` | compatibility | 4972 / 4973 | The integral tame mass over OF maps to the original mass over OK. |
| `SuggestedTameCharacterDescentTests.integral_zeta_mass_in_character_field` | `DirichletPadicLFunctions:L2/integral-tame-zeta-character-field-descent` | compatibility | 4976 / 4977 | The integral ambient zeta mass over OF maps to the original mass over OK. |
| `SuggestedTameCharacterDescentTests.intrinsic_integral_mass_in_character_field` | `DirichletPadicLFunctions:L2/intrinsic-integral-character-field-descent` | compatibility | 4980 / 4981 | The intrinsic integral mass over OF maps to the original mass over OK. |
| `SuggestedTameCharacterDescentTests.modulus_one_intrinsic_integral_descent_is_zero` | `DirichletPadicLFunctions:L2/intrinsic-integral-character-field-descent` | degenerate | 4988 / 4989 | At D=1 both intrinsic integral tame constructors evaluate to0 on every transported OF-valued continuous test. |
| `SuggestedTameCharacterRangeTests.integer_range_contains_zero` | `DirichletPadicLFunctions:L2/tame-character-integer-range` | degenerate | 5061 / 5062 | The ambient integer0 lies in the image of OF. |
| `SuggestedTameCharacterRangeTests.integer_range_contains_one` | `DirichletPadicLFunctions:L2/tame-character-integer-range` | computation | 5064 / 5065 | The ambient integer1 lies in the image of OF. |
| `SuggestedTameCharacterRangeTests.integral_element_outside_character_field` | `DirichletPadicLFunctions:L2/tame-character-integer-range` | non-example | 5067 / 5068 | An element of OK whose K value lies outside Fη does not lie in the image of OF. |
| `SuggestedTameCharacterRangeTests.tame_mass_range` | `DirichletPadicLFunctions:L2/tame-measure-character-field-range` | compatibility | 5070 / 5071 | The actual mass belongs to Fη, using the constant-one test. |
| `SuggestedTameCharacterRangeTests.tame_constant_test_range` | `DirichletPadicLFunctions:L2/tame-measure-character-field-range` | compatibility | 5073 / 5074 | For every b∈Fη, the integral of the ambient constant test with value i(b) belongs to Fη. |
| `SuggestedTameCharacterRangeTests.zero_tame_test_range` | `DirichletPadicLFunctions:L2/tame-measure-character-field-range` | degenerate | 5100 / 5101 | The zero test has integral0, which belongs to Fη. |
| `SuggestedTameCharacterRangeTests.outside_constant_dirac_control` | `DirichletPadicLFunctions:L2/tame-measure-character-field-range` | non-example | 5103 / 5104 | If b∈K lies outside Fη, native Dirac evaluation of the constant-b test lies outside Fη. Thus field descent alone cannot imply an unrestricted ambient-test range claim. |
| `SuggestedTameCharacterRangeTests.zeta_mass_range` | `DirichletPadicLFunctions:L2/tame-zeta-character-field-range` | compatibility | 5077 / 5078 | The actual mass belongs to Fη, using the constant-one test. |
| `SuggestedTameCharacterRangeTests.zeta_constant_test_range` | `DirichletPadicLFunctions:L2/tame-zeta-character-field-range` | compatibility | 5080 / 5081 | For every b∈Fη, the integral of the ambient constant test with value i(b) belongs to Fη. |
| `SuggestedTameCharacterRangeTests.intrinsic_mass_range` | `DirichletPadicLFunctions:L2/intrinsic-tame-character-field-range` | compatibility | 5084 / 5085 | The actual mass belongs to Fη, using the constant-one test. |
| `SuggestedTameCharacterRangeTests.intrinsic_constant_test_range` | `DirichletPadicLFunctions:L2/intrinsic-tame-character-field-range` | compatibility | 5087 / 5088 | For every b∈Fη, the integral of the ambient constant test with value i(b) belongs to Fη. |
| `SuggestedTameCharacterRangeTests.integral_tame_mass_range` | `DirichletPadicLFunctions:L2/integral-tame-character-integer-range` | compatibility | 5091 / 5092 | The actual integral mass lies in the image of OF in OK, by applying the theorem to the constant-one test. |
| `SuggestedTameCharacterRangeTests.integral_zeta_mass_range` | `DirichletPadicLFunctions:L2/integral-tame-zeta-character-integer-range` | compatibility | 5094 / 5095 | The actual integral mass lies in the image of OF in OK, by applying the theorem to the constant-one test. |
| `SuggestedTameCharacterRangeTests.intrinsic_integral_mass_range` | `DirichletPadicLFunctions:L2/intrinsic-integral-character-integer-range` | compatibility | 5097 / 5098 | The actual integral mass lies in the image of OF in OK, by applying the theorem to the constant-one test. |
| `SuggestedJointCharacterMomentTests.wild_weight_zero_value_in_its_field` | `DirichletPadicLFunctions:L2/arithmetic-character-values-in-character-field` | degenerate | 5127 / 5128 | Every weight-zero wild arithmetic-character value belongs to the actual field generated by χ. |
| `SuggestedJointCharacterMomentTests.zero_level_value_in_base_field` | `DirichletPadicLFunctions:L2/arithmetic-character-values-in-character-field` | degenerate | 5131 / 5132 | The principal level-zero arithmetic test takes all values in the base-field image. |
| `SuggestedJointCharacterMomentTests.dyadic_wild_value_in_its_field` | `DirichletPadicLFunctions:L2/arithmetic-character-values-in-character-field` | computation | 5136 / 5137 | For p=2 and wild level16, every weighted unit-character value lies in its actual character field. |
| `SuggestedJointCharacterMomentTests.principal_wild_field_adds_nothing` | `DirichletPadicLFunctions:L2/intrinsic-tame-joint-character-comparison` | compatibility | 5222 / 5223 | If χ=1, the native joint field J equals Fη. |
| `SuggestedJointCharacterMomentTests.quadratic_wild_field_adds_nothing` | `DirichletPadicLFunctions:L2/intrinsic-tame-joint-character-comparison` | compatibility | 5225 / 5226 | If χ is quadratic, J equals Fη. |
| `SuggestedJointCharacterMomentTests.wild_value_outside_tame_field_enlarges_it` | `DirichletPadicLFunctions:L2/intrinsic-tame-joint-character-comparison` | non-example | 5228 / 5229 | If an actual value χ(a) is outside Fη, the joint field is strictly different from Fη. |
| `SuggestedJointCharacterMomentTests.zero_weight_joint_comparison` | `DirichletPadicLFunctions:L2/intrinsic-tame-joint-character-comparison` | degenerate | 5231 / 5232 | The same actual field comparison holds at weight0. |
| `SuggestedJointCharacterMomentTests.weight_zero_integral_joint_comparison` | `DirichletPadicLFunctions:L2/intrinsic-integral-joint-character-comparison` | degenerate | 5238 / 5239 | The integral comparison holds for the actual weight-zero test. |
| `SuggestedJointCharacterMomentTests.principal_wild_moment_in_tame_field` | `DirichletPadicLFunctions:L2/intrinsic-tame-joint-character-range` | compatibility | 5245 / 5246 | A principal wild character gives every arithmetic moment in Fη. |
| `SuggestedJointCharacterMomentTests.quadratic_wild_moment_in_tame_field` | `DirichletPadicLFunctions:L2/intrinsic-tame-joint-character-range` | compatibility | 5250 / 5251 | A quadratic wild character also gives every arithmetic moment in Fη. |
| `SuggestedJointCharacterMomentTests.modulus_one_joint_moment_is_zero` | `DirichletPadicLFunctions:L2/intrinsic-tame-joint-character-range` | degenerate | 5255 / 5256 | At tame modulus1 all actual joint-character intrinsic moments are0. |
| `SuggestedJointCharacterMomentTests.modulus_one_integral_joint_moment_is_zero` | `DirichletPadicLFunctions:L2/intrinsic-integral-joint-character-range` | degenerate | 5260 / 5261 | At tame modulus1 all actual integral joint-character intrinsic moments are0. |
| `SuggestedTamePrimeLevelTests.added_prime_zero` | `DirichletPadicLFunctions:L2/tame-prime-level-character-value` | computation | 5310 / 5311 | The lifted character takes the value0 atq. |
| `SuggestedTamePrimeLevelTests.unchanged_away_from_prime` | `DirichletPadicLFunctions:L2/tame-prime-level-character-value` | compatibility | 5314 / 5315 | At every natural a not divisible byq, the lifted value equals the original value, including zeros caused by other nonunits. |
| `SuggestedTamePrimeLevelTests.principal_lift_has_new_zero` | `DirichletPadicLFunctions:L2/tame-prime-level-character-value` | non-example | 5318 / 5319 | The principal character modulo3 lifted to6 vanishes at2, although the original character takes value1 there. |
| `SuggestedTamePrimeLevelTests.principal_polynomial_mod_three_to_six` | `DirichletPadicLFunctions:L2/tame-prime-level-finite-sum` | computation | 5322 / 5323 | For the principal character modulo6 the polynomial isY+Y^5. |
| `SuggestedTamePrimeLevelTests.repeated_prime_finite_sum` | `DirichletPadicLFunctions:L2/tame-prime-level-finite-sum` | compatibility | 5327 / 5328 | Ifq∣M, η(q)=0 and the finite identity reduces to the geometric block product. |
| `SuggestedTamePrimeLevelTests.nonprincipal_mass_factor` | `DirichletPadicLFunctions:L2/tame-series-prime-level-comparison` | compatibility | 5334 / 5335 | The constant coefficient of the lifted series is(1−η(q)) times the original constant coefficient. |
| `SuggestedTamePrimeLevelTests.principal_mass_counterexample` | `DirichletPadicLFunctions:L2/tame-series-prime-level-comparison` | non-example | 5340 / 5341 | The principal tame constructors at levels3 and9 have different constant coefficients overQ:−1 and−3. Since the principal level3 character takes value0 at3, the nonprincipal formula would incorrectly make them equal. |
| `SuggestedTamePrimeLevelTests.correct_zero_constant_substitution` | `DirichletPadicLFunctions:L2/tame-series-prime-level-comparison` | degenerate | 5346 / 5347 | The actual argument(1+T)^q−1 has zero constant coefficient, including all positive primeq. |
| `SuggestedTamePrimeLevelTests.repeated_prime_character_value_zero` | `DirichletPadicLFunctions:L2/tame-series-repeated-prime-level` | computation | 5349 / 5350 | A native character vanishes at every prime dividing its level. |
| `SuggestedTamePrimeLevelTests.repeated_prime_series_coefficients` | `DirichletPadicLFunctions:L2/tame-series-repeated-prime-level` | compatibility | 5352 / 5353 | Every coefficient of the two existing series agrees whenq∣M andη is nonprincipal. |
| `SuggestedTamePrimeMeasureTests.all_continuous_test_comparison` | `DirichletPadicLFunctions:L2/tame-measure-prime-level-comparison` | compatibility | 5399 / 5400 | For every continuousK-valued testf, the actual new integral is μ(f)−η(q)μ(f∘d_q). |
| `SuggestedTamePrimeMeasureTests.mass_euler_factor` | `DirichletPadicLFunctions:L2/tame-measure-prime-level-comparison` | computation | 5407 / 5408 | The actual total mass changes by1−η(q). |
| `SuggestedTamePrimeMeasureTests.characteristic_prime_excluded` | `DirichletPadicLFunctions:L2/tame-measure-prime-level-comparison` | non-example | 5414 / 5415 | The required target tame hypothesisp∤qM excludesq=p. |
| `SuggestedTamePrimeMeasureTests.repeated_prime_all_tests` | `DirichletPadicLFunctions:L2/tame-measure-repeated-prime-level` | compatibility | 5417 / 5418 | Every continuous test has exactly the same value under the two actual measures whenq∣M. |
| `SuggestedTamePrimeMeasureTests.repeated_prime_zero_test` | `DirichletPadicLFunctions:L2/tame-measure-repeated-prime-level` | degenerate | 5424 / 5425 | The new actual measure sends the zero test to zero, including the principal constructor where it is defined. |
| `SuggestedTamePrimeMeasureTests.dyadic_repeated_prime` | `DirichletPadicLFunctions:L2/tame-measure-repeated-prime-level` | computation | 5429 / 5430 | Atp=2, the actual measures for a nonprincipal character modulo3 and its native lift to9 coincide. |
| `SuggestedTamePrimeMeasureTests.weight_zero_is_mass` | `DirichletPadicLFunctions:L2/tame-measure-prime-level-moments` | degenerate | 5436 / 5437 | The actual weight-zero monomial integral is exactly the total mass. |
| `SuggestedTamePrimeMeasureTests.first_moment_euler_factor` | `DirichletPadicLFunctions:L2/tame-measure-prime-level-moments` | computation | 5442 / 5443 | The first ordinary moment has factor1−η(q)q. |
| `SuggestedTamePrimeMeasureTests.repeated_prime_all_moments` | `DirichletPadicLFunctions:L2/tame-measure-prime-level-moments` | compatibility | 5451 / 5452 | Whenq∣M, every nonnegative ordinary moment of the two actual measures agrees. |
| `SuggestedTamePrimeZetaTests.unit_restriction_mass_factor` | `DirichletPadicLFunctions:L2/tame-unit-restriction-prime-level` | compatibility | 5520 / 5521 | The total mass of the actual unit-restricted measure changes by1−η(q). |
| `SuggestedTamePrimeZetaTests.unit_restriction_zero_test` | `DirichletPadicLFunctions:L2/tame-unit-restriction-prime-level` | degenerate | 5529 / 5530 | The existing unit-restricted measure sends the zero test to zero. |
| `SuggestedTamePrimeZetaTests.zeta_all_continuous_tests` | `DirichletPadicLFunctions:L2/tame-zeta-prime-level-comparison` | compatibility | 5533 / 5534 | For every continuous testf, the new actualζ integral is ζ(f)−(η(q)/q)ζ(f∘d_q). |
| `SuggestedTamePrimeZetaTests.zeta_mass_inverse_factor` | `DirichletPadicLFunctions:L2/tame-zeta-prime-level-comparison` | degenerate | 5541 / 5542 | The actual weight-zero mass changes by1−η(q)/q. |
| `SuggestedTamePrimeZetaTests.inverse_weight_stays_zero` | `DirichletPadicLFunctions:L2/tame-zeta-prime-level-comparison` | non-example | 5548 / 5549 | For every nonunitx, its coefficient image of PadicInt.inv is zero, even ifx has an inverse in the ambient field. |
| `SuggestedTamePrimeZetaTests.repeated_prime_zeta_all_tests` | `DirichletPadicLFunctions:L2/tame-zeta-repeated-prime-level` | compatibility | 5551 / 5552 | All continuous test integrals are unchanged on adding a repeated prime. |
| `SuggestedTamePrimeZetaTests.dyadic_repeated_prime_zeta` | `DirichletPadicLFunctions:L2/tame-zeta-repeated-prime-level` | computation | 5558 / 5559 | Atp=2, the actual ambientζ measures for a nonprincipal character modulo3 and its lift to9 agree. |
| `SuggestedTamePrimeZetaTests.actual_dilation_unit_exists` | `DirichletPadicLFunctions:L2/intrinsic-tame-zeta-prime-level` | characterisation | 5565 / 5566 | The exact tame hypothesisp∤qM supplies a native unit ofℤ_p with underlying valueq. |
| `SuggestedTamePrimeZetaTests.unit_choice_is_unique` | `DirichletPadicLFunctions:L2/intrinsic-tame-zeta-prime-level` | compatibility | 5568 / 5569 | Any two native units with underlying valueq coincide. |
| `SuggestedTamePrimeZetaTests.intrinsic_zeta_all_tests` | `DirichletPadicLFunctions:L2/intrinsic-tame-zeta-prime-level` | compatibility | 5572 / 5573 | Every continuous unit-group test has the explicit pullback-by-multiplication formula with coefficientη(q)/q. |
| `SuggestedTamePrimeZetaTests.first_zeta_moment_factor` | `DirichletPadicLFunctions:L2/tame-zeta-prime-level-positive-moments` | computation | 5582 / 5583 | The first ordinaryζ moment changes by1−η(q). |
| `SuggestedTamePrimeZetaTests.second_zeta_moment_factor` | `DirichletPadicLFunctions:L2/tame-zeta-prime-level-positive-moments` | computation | 5591 / 5592 | The second ordinaryζ moment changes by1−η(q)q. |
| `SuggestedTamePrimeIntegralTests.actual_integral_coefficients_exist` | `DirichletPadicLFunctions:L2/tame-prime-correction-integrality` | characterisation | 5657 / 5658 | Both a and c exist uniquely under the actual tame hypothesis p∤qM. |
| `SuggestedTamePrimeIntegralTests.dyadic_inverse_coefficient_is_integral` | `DirichletPadicLFunctions:L2/tame-prime-correction-integrality` | computation | 5662 / 5663 | The concrete correction −1/3 lies in the norm-valuation integer ring of ℚ₂. |
| `SuggestedTamePrimeIntegralTests.nonunit_denominator_is_excluded` | `DirichletPadicLFunctions:L2/tame-prime-correction-integrality` | non-example | 5665 / 5666 | The inverse 1/2 does not lie in the integer ring of ℚ₂. |
| `SuggestedTamePrimeIntegralTests.integral_measure_all_tests` | `DirichletPadicLFunctions:L2/tame-integral-measure-prime-level` | compatibility | 5668 / 5669 | Every continuous O-test has the correction a times its q-dilated pullback integral. |
| `SuggestedTamePrimeIntegralTests.integral_measure_mass_factor` | `DirichletPadicLFunctions:L2/tame-integral-measure-prime-level` | computation | 5676 / 5677 | The actual integral tame mass has factor 1−a. |
| `SuggestedTamePrimeIntegralTests.integral_measure_repeated_prime` | `DirichletPadicLFunctions:L2/tame-integral-measure-prime-level` | degenerate | 5683 / 5684 | If q∣M, the two actual integral tame measures are equal. |
| `SuggestedTamePrimeIntegralTests.integral_zeta_all_tests` | `DirichletPadicLFunctions:L2/tame-integral-zeta-prime-level` | compatibility | 5690 / 5691 | Every O-valued continuous test has the correction with the integral lift of η(q)/q. |
| `SuggestedTamePrimeIntegralTests.integral_zeta_mass_factor` | `DirichletPadicLFunctions:L2/tame-integral-zeta-prime-level` | computation | 5698 / 5699 | The actual integral zeta mass has factor 1−c. |
| `SuggestedTamePrimeIntegralTests.integral_zeta_repeated_prime` | `DirichletPadicLFunctions:L2/tame-integral-zeta-prime-level` | degenerate | 5706 / 5707 | Adding a repeated prime leaves the full integral zeta measure unchanged. |
| `SuggestedTamePrimeIntegralTests.intrinsic_integral_all_tests` | `DirichletPadicLFunctions:L2/intrinsic-integral-tame-prime-level` | compatibility | 5713 / 5714 | Every continuous O-valued unit test has the explicit pullback-by-u correction. |
| `SuggestedTamePrimeIntegralTests.intrinsic_integral_mass_factor` | `DirichletPadicLFunctions:L2/intrinsic-integral-tame-prime-level` | computation | 5723 / 5724 | The actual integral intrinsic mass has factor 1−c. |
| `SuggestedTamePrimeIntegralTests.intrinsic_integral_repeated_prime` | `DirichletPadicLFunctions:L2/intrinsic-integral-tame-prime-level` | degenerate | 5731 / 5732 | Repeated primes leave the intrinsic integral measure unchanged. |
| `SuggestedTameLevelComparisonTests.level_measure_all_tests` | `DirichletPadicLFunctions:L2/tame-measure-arbitrary-level` | compatibility | 5807 / 5808 | The finite subset sum gives the equality on every continuous K-valued test. |
| `SuggestedTameLevelComparisonTests.level_measure_empty_new_primes` | `DirichletPadicLFunctions:L2/tame-measure-arbitrary-level` | degenerate | 5817 / 5818 | Equal prime support at M and N gives equality of the actual measures even when prime exponents increase. |
| `SuggestedTameLevelComparisonTests.level_measure_moment_product` | `DirichletPadicLFunctions:L2/tame-measure-arbitrary-level` | computation | 5823 / 5824 | Every ordinary moment has the product of the genuinely new Euler factors. |
| `SuggestedTameLevelComparisonTests.level_zeta_all_tests` | `DirichletPadicLFunctions:L2/tame-zeta-arbitrary-level` | compatibility | 5832 / 5833 | The all-test comparison has the inverse product d_t in each subset coefficient. |
| `SuggestedTameLevelComparisonTests.level_zeta_mass_product` | `DirichletPadicLFunctions:L2/tame-zeta-arbitrary-level` | degenerate | 5842 / 5843 | The existing zeta mass changes by the product of 1−η(q)/q. |
| `SuggestedTameLevelComparisonTests.level_zeta_positive_moment_product` | `DirichletPadicLFunctions:L2/tame-zeta-arbitrary-level` | computation | 5849 / 5850 | The moment at exponent k+1 has product factor 1−η(q)q^k. |
| `SuggestedTameLevelComparisonTests.actual_primitive_is_nonprincipal` | `DirichletPadicLFunctions:L2/tame-measure-primitive-conductor` | characterisation | 5858 / 5859 | The actual native primitive character of a nonprincipal character is nonprincipal. |
| `SuggestedTameLevelComparisonTests.conductor_constructor_certificates` | `DirichletPadicLFunctions:L2/tame-measure-primitive-conductor` | compatibility | 5861 / 5862 | Positivity, unit image and the prime-to-p condition at the conductor are derived from the actual level hypotheses. |
| `SuggestedTameLevelComparisonTests.native_primitive_recovers_character` | `DirichletPadicLFunctions:L2/tame-measure-primitive-conductor` | compatibility | 5865 / 5866 | Native changeLevel_primitiveCharacter recovers the original character exactly. |
| `SuggestedTameLevelComparisonTests.primitive_zeta_no_new_prime_factor` | `DirichletPadicLFunctions:L2/tame-zeta-primitive-conductor` | degenerate | 5869 / 5870 | If level and conductor have equal prime support, the actual ambient zeta measures coincide. |
| `SuggestedTameLevelIntegralTests.actual_unit_family_exists` | `DirichletPadicLFunctions:L2/intrinsic-tame-zeta-arbitrary-level` | characterisation | 5937 / 5938 | The actual tame hypothesis provides a whole family of native units over the new-prime set. |
| `SuggestedTameLevelIntegralTests.unit_family_irrelevant_outside_support` | `DirichletPadicLFunctions:L2/intrinsic-tame-zeta-arbitrary-level` | compatibility | 5941 / 5942 | Products over the used subsets agree for any two valid unit families. |
| `SuggestedTameLevelIntegralTests.intrinsic_field_all_tests` | `DirichletPadicLFunctions:L2/intrinsic-tame-zeta-arbitrary-level` | compatibility | 5955 / 5956 | Every continuous unit-group test satisfies the finite subset formula. |
| `SuggestedTameLevelIntegralTests.intrinsic_field_same_prime_support` | `DirichletPadicLFunctions:L2/intrinsic-tame-zeta-arbitrary-level` | degenerate | 5962 / 5963 | Equal prime support gives equality of the actual intrinsic field-valued measures. |
| `SuggestedTameLevelIntegralTests.actual_character_coefficient_family_exists` | `DirichletPadicLFunctions:L2/integral-tame-measure-arbitrary-level` | characterisation | 5947 / 5948 | The complete ordinary character-value lift into O exists. |
| `SuggestedTameLevelIntegralTests.integral_measure_all_tests` | `DirichletPadicLFunctions:L2/integral-tame-measure-arbitrary-level` | compatibility | 5967 / 5968 | Every O-valued continuous test has the integral finite subset formula. |
| `SuggestedTameLevelIntegralTests.integral_measure_mass_sum` | `DirichletPadicLFunctions:L2/integral-tame-measure-arbitrary-level` | computation | 5974 / 5975 | The actual integral tame mass has the signed finite scalar-sum factor. |
| `SuggestedTameLevelIntegralTests.integral_measure_same_prime_support` | `DirichletPadicLFunctions:L2/integral-tame-measure-arbitrary-level` | degenerate | 5981 / 5982 | Increasing only existing prime exponents preserves the full integral tame measure. |
| `SuggestedTameLevelIntegralTests.actual_subset_coefficient_family_exists` | `DirichletPadicLFunctions:L2/integral-tame-zeta-arbitrary-level` | characterisation | 5950 / 5951 | All used inverse-product coefficients lift simultaneously into O from the actual tame hypothesis. |
| `SuggestedTameLevelIntegralTests.integral_zeta_all_tests` | `DirichletPadicLFunctions:L2/integral-tame-zeta-arbitrary-level` | compatibility | 5986 / 5987 | Every continuous O-valued ambient test has the finite formula with its integral inverse-product coefficients. |
| `SuggestedTameLevelIntegralTests.integral_zeta_mass_sum` | `DirichletPadicLFunctions:L2/integral-tame-zeta-arbitrary-level` | degenerate | 5995 / 5996 | The actual integral ambient zeta mass has the finite signed scalar-sum factor. |
| `SuggestedTameLevelIntegralTests.integral_zeta_same_prime_support` | `DirichletPadicLFunctions:L2/integral-tame-zeta-arbitrary-level` | degenerate | 6004 / 6005 | Equal prime support gives equality of the actual integral ambient zeta measures. |
| `SuggestedTameLevelIntegralTests.intrinsic_integral_all_tests` | `DirichletPadicLFunctions:L2/intrinsic-integral-tame-arbitrary-level` | compatibility | 6009 / 6010 | Every continuous O-valued unit test has the finite integral formula. |
| `SuggestedTameLevelIntegralTests.intrinsic_integral_mass_sum` | `DirichletPadicLFunctions:L2/intrinsic-integral-tame-arbitrary-level` | degenerate | 6019 / 6020 | The actual intrinsic integral mass has the same signed scalar-sum factor. |
| `SuggestedTameLevelIntegralTests.intrinsic_integral_same_prime_support` | `DirichletPadicLFunctions:L2/intrinsic-integral-tame-arbitrary-level` | degenerate | 6028 / 6029 | Equal prime support gives equality on the native integral unit-group carrier. |
| `SuggestedTamePrimitiveIntegralTests.intrinsic_field_primitive_all_tests` | `DirichletPadicLFunctions:L2/intrinsic-tame-zeta-primitive-conductor` | compatibility | 6133 / 6134 | Every continuous test on the actual carrier satisfies the finite primitive-conductor formula. |
| `SuggestedTamePrimitiveIntegralTests.intrinsic_field_primitive_mass` | `DirichletPadicLFunctions:L2/intrinsic-tame-zeta-primitive-conductor` | computation | 6141 / 6142 | The actual measure mass is the primitive mass multiplied by the finite signed coefficient sum. |
| `SuggestedTamePrimitiveIntegralTests.intrinsic_field_primitive_same_support` | `DirichletPadicLFunctions:L2/intrinsic-tame-zeta-primitive-conductor` | degenerate | 6149 / 6150 | Equal prime support gives equality with the primitive measure, including repeated conductor prime powers. |
| `SuggestedTamePrimitiveIntegralTests.primitive_constructor_certificates` | `DirichletPadicLFunctions:L2/intrinsic-tame-zeta-primitive-conductor` | characterisation | 6231 / 6232 | Conductor positivity, unit image, tameness and primitive nonprincipality follow simultaneously from the original level hypotheses. |
| `SuggestedTamePrimitiveIntegralTests.integral_measure_primitive_all_tests` | `DirichletPadicLFunctions:L2/integral-tame-measure-primitive-conductor` | compatibility | 6155 / 6156 | Every continuous test on the actual carrier satisfies the finite primitive-conductor formula. |
| `SuggestedTamePrimitiveIntegralTests.integral_measure_primitive_mass` | `DirichletPadicLFunctions:L2/integral-tame-measure-primitive-conductor` | computation | 6163 / 6164 | The actual measure mass is the primitive mass multiplied by the finite signed coefficient sum. |
| `SuggestedTamePrimitiveIntegralTests.integral_measure_primitive_same_support` | `DirichletPadicLFunctions:L2/integral-tame-measure-primitive-conductor` | degenerate | 6171 / 6172 | Equal prime support gives equality with the primitive measure, including repeated conductor prime powers. |
| `SuggestedTamePrimitiveIntegralTests.primitive_bad_prime_values` | `DirichletPadicLFunctions:L2/integral-tame-measure-primitive-conductor` | computation | 6235 / 6236 | At every new bad prime the original character is zero and its actual primitive character is nonzero. |
| `SuggestedTamePrimitiveIntegralTests.integral_zeta_primitive_all_tests` | `DirichletPadicLFunctions:L2/integral-tame-zeta-primitive-conductor` | compatibility | 6177 / 6178 | Every continuous test on the actual carrier satisfies the finite primitive-conductor formula. |
| `SuggestedTamePrimitiveIntegralTests.integral_zeta_primitive_mass` | `DirichletPadicLFunctions:L2/integral-tame-zeta-primitive-conductor` | computation | 6187 / 6188 | The actual measure mass is the primitive mass multiplied by the finite signed coefficient sum. |
| `SuggestedTamePrimitiveIntegralTests.integral_zeta_primitive_same_support` | `DirichletPadicLFunctions:L2/integral-tame-zeta-primitive-conductor` | degenerate | 6197 / 6198 | Equal prime support gives equality with the primitive measure, including repeated conductor prime powers. |
| `SuggestedTamePrimitiveIntegralTests.primitive_coefficient_families` | `DirichletPadicLFunctions:L2/integral-tame-zeta-primitive-conductor` | characterisation | 6239 / 6240 | The ordinary primitive coefficient function and every used integral inverse-product coefficient exist together from the original tame level hypothesis. |
| `SuggestedTamePrimitiveIntegralTests.intrinsic_integral_primitive_all_tests` | `DirichletPadicLFunctions:L2/intrinsic-integral-tame-primitive-conductor` | compatibility | 6203 / 6204 | Every continuous test on the actual carrier satisfies the finite primitive-conductor formula. |
| `SuggestedTamePrimitiveIntegralTests.intrinsic_integral_primitive_mass` | `DirichletPadicLFunctions:L2/intrinsic-integral-tame-primitive-conductor` | computation | 6214 / 6215 | The actual measure mass is the primitive mass multiplied by the finite signed coefficient sum. |
| `SuggestedTamePrimitiveIntegralTests.intrinsic_integral_primitive_same_support` | `DirichletPadicLFunctions:L2/intrinsic-integral-tame-primitive-conductor` | degenerate | 6225 / 6226 | Equal prime support gives equality with the primitive measure, including repeated conductor prime powers. |
| `SuggestedTameMomentLevelTests.field_relative_weight_zero` | `DirichletPadicLFunctions:L2/tame-arithmetic-moment-level` | degenerate | 6317 / 6318 | At weight zero the factor retains η(q)χ(q)/q. |
| `SuggestedTameMomentLevelTests.field_relative_same_support` | `DirichletPadicLFunctions:L2/tame-arithmetic-moment-level` | degenerate | 6324 / 6325 | Equal prime support gives the same arithmetic-character moment. |
| `SuggestedTameMomentLevelTests.field_relative_positive_weight` | `DirichletPadicLFunctions:L2/tame-arithmetic-moment-level` | compatibility | 6330 / 6331 | At weight k+1 the quotient factor is η(q)χ(q)q^k. |
| `SuggestedTameMomentLevelTests.field_relative_level_zero` | `DirichletPadicLFunctions:L2/tame-arithmetic-moment-level` | degenerate | 6364 / 6365 | At n=0 the finite character disappears while the actual coordinate power remains. |
| `SuggestedTameMomentLevelTests.field_relative_trivial_mass` | `DirichletPadicLFunctions:L2/tame-arithmetic-moment-level` | computation | 6371 / 6372 | The n=w=0 specialization is the actual zeta mass factor Πq(1−η(q)/q). |
| `SuggestedTameMomentLevelTests.dyadic_quadratic_new_prime` | `DirichletPadicLFunctions:L2/tame-arithmetic-moment-level` | computation | 6446 / 6447 | At p=2, tame quadratic level3→15, wild quadratic modulo4 and weight0, the new-prime factor is6/5. |
| `SuggestedTameMomentLevelTests.integral_relative_weight_zero` | `DirichletPadicLFunctions:L2/integral-tame-arithmetic-moment-level` | degenerate | 6337 / 6338 | The integral weight-zero formula retains the integral inverse-prime coefficient. |
| `SuggestedTameMomentLevelTests.integral_relative_same_support` | `DirichletPadicLFunctions:L2/integral-tame-arithmetic-moment-level` | degenerate | 6348 / 6349 | With no new prime, every integral arithmetic-character moment is unchanged. |
| `SuggestedTameMomentLevelTests.integral_relative_factor_inclusion` | `DirichletPadicLFunctions:L2/integral-tame-arithmetic-moment-level` | compatibility | 6354 / 6355 | The actual O-valued Euler product includes as the specified K-valued product. |
| `SuggestedTameMomentLevelTests.field_primitive_weight_zero` | `DirichletPadicLFunctions:L2/tame-arithmetic-moment-primitive` | degenerate | 6391 / 6392 | The primitive weight-zero comparison retains the inverse-prime factor. |
| `SuggestedTameMomentLevelTests.field_primitive_same_support` | `DirichletPadicLFunctions:L2/tame-arithmetic-moment-primitive` | degenerate | 6399 / 6400 | Conductor and level with the same prime support have identical moments. |
| `SuggestedTameMomentLevelTests.field_primitive_positive_weight` | `DirichletPadicLFunctions:L2/tame-arithmetic-moment-primitive` | compatibility | 6406 / 6407 | At weightk+1 use the primitive character in the exponentk Euler factor. |
| `SuggestedTameMomentLevelTests.integral_primitive_weight_zero` | `DirichletPadicLFunctions:L2/integral-tame-arithmetic-moment-primitive` | degenerate | 6414 / 6415 | The primitive integral weight-zero moment keeps its actual integral correction coefficients. |
| `SuggestedTameMomentLevelTests.integral_primitive_same_support` | `DirichletPadicLFunctions:L2/integral-tame-arithmetic-moment-primitive` | degenerate | 6426 / 6427 | Same prime support gives equality in the original integer ring. |
| `SuggestedTameMomentLevelTests.integral_primitive_factor_inclusion` | `DirichletPadicLFunctions:L2/integral-tame-arithmetic-moment-primitive` | compatibility | 6433 / 6434 | The primitive integral product includes as the field product with η₀ values. |
| `SuggestedPrimitiveGaussTests.gauss_nonzero` | `DirichletPadicLFunctions:L2/tame-primitive-gauss-norm` | compatibility | 6518 / 6519 | The actual normalization G is nonzero, derived from norm1. |
| `SuggestedPrimitiveGaussTests.gauss_inverse_norm` | `DirichletPadicLFunctions:L2/tame-primitive-gauss-norm` | compatibility | 6522 / 6523 | The actual field inverse also has norm1. |
| `SuggestedPrimitiveGaussTests.gauss_modulus_one` | `DirichletPadicLFunctions:L2/tame-primitive-gauss-norm` | degenerate | 6526 / 6527 | At D=1 the native principal Gauss sum is1. |
| `SuggestedPrimitiveGaussTests.gauss_composite_norm` | `DirichletPadicLFunctions:L2/tame-primitive-gauss-norm` | computation | 6530 / 6531 | For a primitive character at composite conductor9, p∤9 gives norm1. |
| `SuggestedPrimitiveGaussTests.gauss_dyadic_norm` | `DirichletPadicLFunctions:L2/tame-primitive-gauss-norm` | computation | 6534 / 6535 | At p=2 and conductor3 the same norm-one conclusion holds. |
| `SuggestedPrimitiveGaussTests.same_additive_gauss_parity` | `DirichletPadicLFunctions:L2/tame-primitive-gauss-norm` | compatibility | 6584 / 6585 | Using the same additive character on both factors gives g(η,e)g(η⁻¹,e)=η(−1)D. |
| `SuggestedPrimitiveGaussTests.principal_composite_gauss_zero` | `DirichletPadicLFunctions:L2/tame-primitive-gauss-norm` | non-example | 6588 / 6589 | The principal character modulo9 has Gauss sum0 for a primitive ninth-root additive character; primitivity cannot be dropped. |
| `SuggestedPrimitiveGaussTests.unit_inverse_coefficient` | `DirichletPadicLFunctions:L2/tame-primitive-gauss-unit` | compatibility | 6538 / 6539 | The inverse of any unit presentation includes as the field inverse G⁻¹. |
| `SuggestedPrimitiveGaussTests.unit_presentation_unique` | `DirichletPadicLFunctions:L2/tame-primitive-gauss-unit` | characterisation | 6542 / 6543 | Two native integral units with inclusion G are equal. |
| `SuggestedPrimitiveGaussTests.unit_coefficient_product` | `DirichletPadicLFunctions:L2/tame-primitive-gauss-unit` | computation | 6546 / 6547 | Included unit and inverse multiply to1 in K. |
| `SuggestedPrimitiveGaussTests.series_gauss_mass` | `DirichletPadicLFunctions:L2/tame-gauss-series-certified` | computation | 6550 / 6551 | The constant coefficient is−G⁻¹Σ_aη⁻¹(a)/(ε^a.val−1). |
| `SuggestedPrimitiveGaussTests.series_gauss_positive_coefficient` | `DirichletPadicLFunctions:L2/tame-gauss-series-certified` | compatibility | 6554 / 6555 | Every coefficient retains the factor(−1)^n and the actual inverse character. |
| `SuggestedPrimitiveGaussTests.series_quadratic_cubic` | `DirichletPadicLFunctions:L2/tame-gauss-series-certified` | computation | 6558 / 6559 | For quadratic level3 the cubic coefficient is+1/9, with no extra Gauss hypothesis. |
| `SuggestedPrimitiveGaussTests.integral_series_map_coefficient` | `DirichletPadicLFunctions:L2/tame-integral-series-map` | compatibility | 6576 / 6577 | Every mapped coefficient equals the original tameSeries coefficient. |
| `SuggestedPrimitiveGaussTests.integral_series_map_level_one` | `DirichletPadicLFunctions:L2/tame-integral-series-map` | degenerate | 6580 / 6581 | The mapped integral series at modulus1 is0. |
| `SuggestedPrimitiveGaussTests.integral_gauss_mass` | `DirichletPadicLFunctions:L2/tame-integral-gauss-series-certified` | computation | 6562 / 6563 | The included integral constant coefficient equals the certified Gauss mass expression. |
| `SuggestedPrimitiveGaussTests.integral_gauss_coefficients` | `DirichletPadicLFunctions:L2/tame-integral-gauss-series-certified` | compatibility | 6566 / 6567 | Every included integral coefficient is the alternating Gauss coefficient. |
| `SuggestedPrimitiveGaussTests.integral_gauss_root_independence` | `DirichletPadicLFunctions:L2/tame-integral-gauss-series-certified` | characterisation | 6570 / 6571 | Both primitive-root Gauss expressions agree as K-valued formal series. |
| `SuggestedPrimitiveInterpolationTests.quadratic_product_conductor` | `DirichletPadicLFunctions:L2/tame-wild-product-primitive` | computation | 6659 / 6660 | For primitive quadratic characters of levels 3 and 4, the product at level 12 has conductor 12. |
| `SuggestedPrimitiveInterpolationTests.zero_level_product` | `DirichletPadicLFunctions:L2/tame-wild-product-primitive` | degenerate | 6663 / 6664 | For n=0 the primitive level-one character gives conductor D for the product. |
| `SuggestedPrimitiveInterpolationTests.overlapping_conductors_fail` | `DirichletPadicLFunctions:L2/tame-wild-product-primitive` | non-example | 6667 / 6668 | The square of the nontrivial quadratic character modulo 3 has conductor 1, not 9 or 3. |
| `SuggestedPrimitiveInterpolationTests.principal_inflation_changes_euler_value` | `DirichletPadicLFunctions:L2/primitive-tame-wild-euler-value` | non-example | 6670 / 6671 | For η quadratic modulo 3 inflated to level 6, the level-6 value at 2 is 0 while the primitive-conductor value is −1. |
| `SuggestedPrimitiveInterpolationTests.dyadic_trivial_wild_first_value` | `DirichletPadicLFunctions:L2/primitive-integral-interpolation` | computation | 6680 / 6681 | At p=2, η quadratic modulo 3, n=0 and k=1, the moment is 2/3, including the Euler factor 1−η(2)=2. |
| `SuggestedPrimitiveInterpolationTests.quadratic_wild_weight_two` | `DirichletPadicLFunctions:L2/primitive-integral-interpolation` | computation | 6684 / 6685 | At p=2, η quadratic modulo 3, χ quadratic modulo 4 and k=2, the moment is −2. |
| `SuggestedPrimitiveInterpolationTests.quadratic_wild_weight_four` | `DirichletPadicLFunctions:L2/primitive-integral-interpolation` | computation | 6688 / 6689 | With the same primitive characters and k=4, the moment is 46. |
| `SuggestedPrimitiveInterpolationTests.even_weights_insufficient` | `DirichletPadicLFunctions:L2/tame-integral-interpolation-unique` | non-example | 6698 / 6699 | The nonzero native O-valued measure δ_1−δ_(−1) on U kills all even power tests, including for p=2; all positive degrees are required. |
