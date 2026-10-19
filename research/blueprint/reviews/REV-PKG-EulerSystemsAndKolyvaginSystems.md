# REV-PKG-EulerSystemsAndKolyvaginSystems — independent fixing review

Issue #11034. Reviewer: Codex, session `codex-jdVzGD`, 2026-10-19. Package author: `codex-EJ3wee`; this reviewer did none of that package job. The review is complete. Verdict: **needs_changes**, because the five specific mathematical defects below remain after the in-place corrections. This is not a checkpoint and is not an acceptance for an upstream draft.

## Scope, conservation and shape

Read the assembled accepted packet, the package README and Suggested.lean, the reviewed library audit, WORKERS, both protocols, UPSTREAM_GUIDE and PACKAGE_REVIEW. LocalGaloisGroups and ProfiniteArithmetic were the two upstream shape models. The README retains its full scope: all 149 numbered sections, plus propagation/duality and the finite Euler-characteristic supplier statements at the opening boundary, account for the assembled plan's 151 targets. The 27 local and 124 imported packet nodes, 26 requests and two inherited limitations were not edited. No general target was deleted to fit the Lean file.

The package already has Summary, ownership, conventions, exact supplier contracts, ordered Layers 0–8, Examples/Dependencies, consumers and edition-specific references. The compact Lean file contains nine real-bodied definitions, representative end statements, and proved examples on existing carriers; it develops no arithmetic theory. Its 349 lines are below the 5,000-line limit. No sorry-backed data definition, admitted example, True placeholder or hypothesis containing its conclusion was found. Heavy arithmetic definitions remain in the README and closing comment. Added `moduleOfLValues` and the general `blindSpot` there so the two names introduced in the README have explicit coverage.

## Corrections applied

- In 5.6, 6.6 and 6.8, restricted “equality iff primitive” to a nonzero leading class. For a nonzero system of positive order, both extended bounds are ∞ even after nonunit scaling; ∞=∞ does not detect primitivity. Retained the positive-order structure theorem. In 6.6, defined the stable minimum and restricted elementary-divisor differences to finite-index levels i≥ord, avoiding ∞−∞.
- In 5.8, restricted the iteration to a rank-one core vertex to odd parity, with the required nonzero class. Even residual eigendimensions (1,1) have total dimension two and cannot end at a one-dimensional core by an assertion valid for both parities.
- In 8.11, restricted universal-norm unramifiedness to q∤p. Kept Rubin's condition (*) at all completely split primes as stated in the source. A cyclotomic p-unit norm family for ℤ_p(1) supplies a nonzero local p-class, although H¹_ur(ℚ_p,ℤ_p(1))=0.
- In 4.2, specified the actual four submodules S₀⊂S_n,S_{nℓ}⊂S₁ and the orientations of all four quotient lengths before applying their dual identities. A one-dimensional finite/transverse diamond fixes (a,b,c,d)=(0,1,1,0), with the complementary dual pattern. Added MR04 Lemma 4.1.6 to the locator.
- In 8.12 and 8.17, corrected the explanation of raw weak systems: they already obey the finite–singular edge relation. The correction removes their unwanted finite localization at conductor primes. Added separate tests for transversality and the edge equation.
- In 1.18, distinguished a ramified Dirichlet value ρ(p)=0 from a Frobenius value at an unramified p. In 2.9, restored the 8∣D_K canonical-CM branch for higher weight, alongside the odd-discriminant branch; this agrees with Castella–Hsieh §§4.1 and 6.
- In 2.8, made the χ-ray fields, character action, support and three χ-rigidity alternatives explicit, including the shifted character in the semilocal formula. The unresolved local formula is marked as gap D4 below; it was not replaced by an unjustified copy of the ordinary ray congruence.
- Expanded checks in 0.6, 1.11, 2.8, 3.3, 4.3, 4.10, 4.11, 5.2, 6.2, 6.5, 6.7 and 7.1. New controls distinguish saturated from unsaturated modules, whole-system from leading-term vanishing, rational from integral coinvariants, image-ideal sums from intersections, genuine inverse-limit compatibility, monodromy, one-sided hub directions, and determinant/contraction signs. Removed a duplicated elliptic core-rank example. Existing API outlines and worked examples remain.

- In 1.13, found a field mismatch in MR16 v1 and the published paper, §4 pp.154–155. Corrected the local Frobenius lemma to use H_M(T), supplied a concrete 𝔽₅-character counterexample to the printed H_M version, and made the intended general finite-L contract explicit. The global proof audit for this repair is D5.

## Exact defects still requiring changes

| ID | Affected targets | Missing mathematics and evidence | Work needed before acceptance |
| --- | --- | --- | --- |
| D1 | 4.8; its all-prime CM consumer 4.12 | ClassicalArithmeticCompletion Layer 7 has maximal-order existence (7.21, 7.56), but no target for the centralizer-order maximality, hereditary/projective lattice splitting, multiplicity-sensitive Morita reduction and cyclic division-order decomposition consumed by 4.8. Its 7.60 is a reduced-norm theorem; its later lattice classification explicitly avoids hereditary splitting. Current Tau Ceti `RingTheory/Morita/Corner.lean` gives the equivalence for a supplied full idempotent, not these arithmetic order theorems. | Supply a separately planned ClassicalArithmeticCompletion Part II with exact hypotheses and proofs for these inputs, or build the inputs in the permitted owner before citing them. Merely naming the Part II contract does not close the route. The README now marks the two targets conditional. |
| D2 | General-R Selmer interfaces in Layer 0; especially 6.2–6.9 and 7.1–7.5 | SelmerIwasawaCohomology Layer 2's arithmetic coefficients are O-lattice/rational/discrete objects. Its generic kernel and mapping-fibre constructions do not themselves supply finite, self-injective R-linear arithmetic pairings, quotient/submodule duality and BSS II Theorem 3.1 (p.13). General derived cochains in ArithmeticGaloisDuality D7 are not a stated comparison producing this finite Selmer sequence with dual Hom_R(−,R). | Add the general self-injective-R arithmetic Selmer duality/propagation comparison to the lower supplier, or construct that comparison explicitly here from its exact lower inputs. Preserve the general-R higher-rank targets. The README records this as unsupplied rather than certifying it from the O-adic layer. |
| D3 | 8.34–8.36 | The coefficient-prime contract requires balanced full/zero ranks, rank-one ordinary local modules after localization at (π), obstruction vanishings and the two specific Poitou–Tate condition-change sequences including all local correction terms. SelmerIwasawaCohomology 3.3, 3.11–3.13 and 3.18–3.20 provide general control criteria, not these arithmetic verifications. The existing SelmerIwasawaCohomologyPartII concerns height pairings. | Plan and prove the coefficient-prime local and change-of-condition targets for the stated ordinary modular lattice, including the twisted higher-weight quotient and μ-zero corrections. Keep μ(X_ord,tors)=0 as the conclusion of 8.35, not supplier data. The package retains the conditional application. |
| D4 | 2.8(c), alternative χ-rigidity congruence; 3.16 and the corresponding branch of 4.20(b) | Rubin's draft IX.4.1(c), p.138, asks for the appropriate analogue of IV.8.1 rather than printing the χ-ray local congruence. Defining χ-ray fields and requesting that analogue does not state its residue norm, Frobenius action or denominator. The ordinary Nq−1 formula cannot be copied without checking the residue degree over K′. | Construct and state the χ-ray local congruence with its exact local-field transport, denominator and Frobenius action, and prove it from the class-field/residue-unit dictionary. The other rigidity alternatives are retained; the general χ theory is not restricted to the involutive case. |

| D5 | 1.13 and the MR16 branches of 6.6–6.8, including their application verifications | In the printed (H.2), L⊆H_M and τ fixes H_M. Lemma 4.5 nevertheless identifies the action on T from a Frobenius class in H_M. For T the 𝔽₅-character of ℚ(√2), τ=1 and q=11, H_M=ℚ(μ₅), q splits in H_M but acts by −1 on T, so I₁₁=R, not 0. Moreover the printed containment makes (H.2)+(H.7) impossible for rank(T)>1 over an artinian R, by primes splitting in H_M(T). Both v1 p.9 and published pp.154–155 were visually checked. | The README repairs the local assertion using H_M(T), and proposes the finite-L⊆K̄ prime-containment contract; refinement to L·H_M(T) then supplies (H.7). Audit the MR16 global proofs, quotient transitions, MR04 bridge and examples with this repaired (H.2), with exact prerequisites and finite-level compatibility. No blanket claim that the original global theorems already certify this changed record is made. |

There is also the **inherited application limitation**, kept explicit: a uniform annihilator-exponent bound in 4.12 is not Kolyvagin's all-prime square-index length theorem with a constant independent of K, requested by HeegnerPointEulerSystems HE.7. The packet already records this separately, together with the unread original Kolyvagin article. No claim about that article's wording or a proof of the stronger theorem is added. None of D1–D5 can be repaired by a Lean elaboration or by changing a citation label.

## Source inspection

Opened the two locators the author flagged as unread in the **published** Rubin book, rather than trusting draft numbering: Proposition 2.3.7, pp.42–43, has the needed Poitou–Tate sequence and points to published Corollary B.3.5; Theorem 9.3.3, pp.179–180, uses the complementary ideal ((M):a₂)a₁. Its printed formula agrees with 4.20(a). The older draft's reversed ideal is not used. These checks close the author's two locator-verification flags, but do not close the prerequisite defects above.

Independently selected 15 numbered sections with a deterministic random seed 11034, then opened every locator in those sections. The table gives the versions actually read. Page numbers below are printed page numbers, not PDF indices. Source statements are paraphrased; no source passage is reproduced.

| Sampled section | Source and locator inspected | Result |
| --- | --- | --- |
| 3.3 | Mazur–Rubin 2004, Definitions 3.1.3, 3.1.6 and 3.1.8, pp.20–21 | Families, generalized limits, blind spots and order agree; added image/whole-system controls. |
| 1.18 | Mazur–Rubin 2004, Lemma 6.1.5 and Proposition 6.1.6, pp.71–72 | Character exclusions and core ranks agree; clarified the ramified value at p. |
| 2.8 | Rubin 1999 draft, IX §1 pp.133–134; Definitions IX.3.1 p.136, IX.4.1 p.138, IX.5.1 p.140 | Finite-depth and strict variants agree; expanded χ setup and exposed D4. |
| 8.32 | Zanarella arXiv:1908.09197v1, Theorem 2.4.5 and its proof, pp.21–24 | Confirmed the normalized height-one specialization and the separate coefficient-prime branch in its stated coefficient setting. |
| 5.5 | Howard published paper, Proposition 1.4.1 and Theorem 1.4.2, pp.1448–1450 | Generalized pairing, conjugation sign and doubled finite module agree. |
| 4.2 | Mazur–Rubin 2004, Lemmas 4.1.6–4.1.7 pp.36–37, Corollary 2.3.6 p.17 | Added missing Lemma 4.1.6 locator and fixed the diamond's labels. |
| 0.3 | Mazur–Rubin 2004, Definition 1.1.4 and Lemma 1.1.5 p.8; Mazur–Rubin 2016, Definition 3.1 and Remark 3.2 p.7 | Cartesian coefficient-quotient convention agrees; arbitrary subquotients remain excluded. |
| 8.2 | Rubin draft, Hyp(K∞,T), p.27, and Remark II.2.4 p.24 | τ fixes the specified tower; rational and integral irreducibility stay distinct. |
| 6.6 | Mazur–Rubin 2016, Theorem 6.10 p.15 and Theorem 8.9 p.19; BSS II v1, Theorem 4.6 p.21 | Structure/Fitting statements retained; finite-leading equality and finite differences corrected. |
| 2.5 | Rubin draft, Proposition II.4.2 p.30 and Lemma II.4.3 p.31 | Inverse twists have the residual Euler-factor norm, not unconditional identity. |
| 6.2 | BSS II arXiv:1805.08448v1, Hypotheses 3.2–3.3 p.13, 4.2 p.20, 4.7 p.22 | Distinct arithmetic hypotheses confirmed; strengthened tests of their separate fields. |
| 1.4 | Mazur–Rubin 2004, Definition 2.2.1 p.16; Mazur–Rubin 2016, Definition 2.2 p.6; Howard published Definition 1.2.1 p.1444 | Three local conventions remain separate, including their conductor-one tensor convention. |
| 8.17 | Mazur–Rubin 2004, Theorem 5.3.3 p.61 and Appendix A pp.79–82 | Corrected the description of weak systems and the purpose of the correction. |
| 3.9 | Rubin draft, Definition IV.4.10 p.66 and Lemma IV.4.13 p.67 | Coefficient reduction, lift-independence and conductor-one case agree. |
| 3.4 | Rubin draft, Lemma IV.4.2 p.62 | Universal derivative invariance agrees, with its coefficient and conductor hypotheses. |

Additional checks read MR16 v1 §4 p.9 and the published §4 pp.154–155 for D5, Rubin IX §2 p.136 for (*), Mazur–Rubin's full two-prime correction, and Castella–Hsieh's author PDF pp.14–15, 26 and 28 for the canonical CM alternatives. Sources used: [MR04](https://webusers.imj-prg.fr/~christophe.cornut/ES/Ref/KolySys.pdf), [MR16 v1](https://arxiv.org/abs/1312.4052v1), [MR16 published](https://jtnb.centre-mersenne.org/item/10.5802/jtnb.933.pdf), [Rubin draft](https://swc-math.github.io/notes/files/99RubinES.pdf), [published Rubin](https://www.wstein.org/people/rubin/book/hEulerSystems.pdf), [Howard published](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/1BF8414258216C1575963BBDA814CB2F/S0010437X04000569a.pdf/the-heegner-point-kolyvagin-system.pdf), [BSS II v1](https://arxiv.org/abs/1805.08448v1), [Zanarella v1](https://arxiv.org/abs/1908.09197v1), [Castella–Hsieh](https://www.math.ntu.edu.tw/~mlhsieh/research/HCES.pdf).

## Libraries, ownership and tiers

Read the actual pinned statements underlying the retained signatures: `Module.length` (ℕ∞, submodule-lattice length), the finite torsion PID decomposition, `IsDiscreteValuationRing`, `LinearMap.charpoly` and Cayley–Hamilton, `Polynomial.divByMonic`, the X−C evaluation-divisibility lemma, `LinearMap.ker/range`, `Representation.norm` (the sum over a finite group), and the pinned Tau Ceti discrete H¹/coinduction/Shapiro/corestriction interfaces. In particular the pinned H¹ carrier is only an additive group; it is not an automatic compact R-linear Selmer module.

Current read-only TauCetiRoadmap was checked at `0d144d044dacebca17b654695b6f1ad58f159b27`, including the nine post-snapshot roadmaps and the sibling Completed directory (ContourIntegration, EffectiveBounds, OrthogonalL2Bases and RestrictedProducts). Current Tau Ceti was checked at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Searches used objects and operations: local restriction kernels, norm/coinduction, ramification and Frobenius conditions, dual pairings, biduals, order lattices and Fitting ideals, as well as names. The relevant existing discrete Shapiro, class-field, elliptic Kummer, generic Fitting and full-idempotent Morita material is already deferred at the package boundary. **No additional target removal was justified by this review.** The locally constructed ray/ring-class transverse dictionary and Selmer bidual variants specify the arithmetic additions they need; they are not generic cohomology or exterior-power replanning.

The tier guide places PadicMeasuresIwasawaAlgebras, ClassicalArithmeticCompletion and the Selmer/ArithmeticGaloisDuality foundations below this use. No FoundationsAndLibraryIntegration or UPSTREAM placeholders remain. Geometric Heegner/CM and Rubin–Stark main-conjecture verifications are explicit application premises, not upward prerequisites of generic descent. No ownership move was made in this review; the package's prior placement of bidual contraction and normalized transfer in 6.1, 6.3 and 7.2 is retained. A lower owner being named does not supply an absent theorem: D1–D3 are the remaining closure defects.

## Lean signatures and definition checks

The following independent comparison covers more than ten signatures. The README's arithmetic targets are not replaced by these algebraic statements.

| Signature | Comparison and negative case |
| --- | --- |
| expAt | Ring/module, membership in powers, zero exponent 0; Z/9 values distinguish exponent from order. |
| ordAt | Supremum over all divisibility depths, value ℕ∞, zero value ∞; no accidental use as the truncated divisibility index. |
| abundanceExponent | Recurrence has values 1,1,4,10 at 0,1,2,3; agrees with the bounded-loss constant. |
| charError | Only ℤ_p-valued characters in Lean; README separately retains the coefficient-field version. The self-inverse case gives 0. |
| eulerPoly | Reverse charpoly equals det(1−Xf), with constant term 1; not charpoly itself. |
| eulerPoly annihilator | Invertibility and the inverse endomorphism are present; Cayley–Hamilton is transported to the inverse. |
| kolyvaginDerivative | Weights i on σ^i for 0≤i<m; m=2 gives σ and m=3 gives σ+2σ². |
| liftedNorm | Sum σ^{i+1}; for m=1 it is σ, not 1 before imposing σ^m=1. |
| lifted/cyclic telescoping | General right side mσ^m−N; cyclic specialization requires σ^m=1 before replacing it by m−N. |
| fsQuotientPoly | Division by the monic X−1 is exact for P−P(1); P=1−X gives −1, fixing the sign. |
| selectedDescent | Actual image/kernel killing hypotheses, a² times a lift of ax; both composites scale by a³, not a or a². |
| scaled inverse | Actual DVR quotient and image containment π^cR^r⊆im A, c<n; output satisfies AC=CA=π^cI, including rank zero. |

All explicit definition API blocks and their Checks were read. Shared hypotheses were tested separately rather than counting three bullets as automatically three tests of every bundled definition. The additional tests above cover the weak/generalized/L-value/blind-spot bundle, sheaf predicates, four BSS records, Stark stalk/transition/system/ideal bundle, and higher-rank carrier/regulator/stub/ideal bundle. Arithmetic hypotheses with unproved global inputs are not “tested” by pretending their ring hypotheses suffice: positive instances are the stated arithmetic applications; matrix, diagram and ideal calculations are labelled as such. Prose checks are plans for future formalization, not assertions that those arithmetic objects have been implemented.

## Adversarial pass over every target and convention

Every numbered section is covered below, together with the two opening supplier statements. “Retained” means the tested boundary is consistent with the **stated hypotheses**, not a proof of the arithmetic theorem. Missing inputs and the hypothesis repair are D1–D5. No odd-prime theorem is silently applied at p=2, and O/π^n is distinguished from O/p^n when O is ramified. The equal-characteristic DVR k[[π]] is allowed for the purely algebraic module/matrix controls, while number-field Galois targets keep their mixed-characteristic coefficient assumptions.

| Section or convention | Instances and computation | Outcome |
| --- | --- | --- |
| Opening propagation/duality | Strict and relaxed conditions; quotient with non-surjective H¹ reduction | Orthogonal image is an inverse image; relaxed quotient dual need not be strict without injectivity. Retained. |
| Opening Euler characteristic | K=ℚ, μ_p, p odd, relaxed at p and strict at infinity | The p term has dimension 2 and the archimedean term 0; signed difference is 1. Ordinary H⁰ at infinity retained. |
| Coefficients and directions | Zero module; finite quotient; compact lattice versus discrete Cartier dual | Carriers stay distinct; D2 identifies the missing general-R comparison. |
| Frobenius convention | Rank-one Fr=a; elliptic polynomial 1−a_ℓX+ℓX² | Inverting Frobenius changes the polynomial as well as its argument; Nekovář Artin inversion retained. |
| Valuation and signs | Ramified O with p=uπ^e; odd field versus p=2 | Errors use the specified valuation; τ signs require 2 invertible. Two-term witnesses are retained or added below. |
| 0.1 | Empty P, two primes, finite versus discrete dual | Conductors are 1 and the four squarefree products; support and coefficient topology are part of the data. |
| 0.2 | Identity and zero scalar; O/π²→O/π³ by π | Morphism composition multiplies scalars; inclusion of ideals alone does not make the induced map injective. |
| 0.3 | R=ℤ/9 with condition 3R and reduction to R/3 | Image and scalar inverse-image conditions differ; the noncartesian example rejects arbitrary quotient propagation. |
| 0.4 | Free local rank d over a length-k ring; zero rank | Length is kd, including d=0; freeness/cartesianness is not discarded. |
| 0.5 | T/π², T/π and dual torsion inclusion | The invariant-vanishing and cartesian hypotheses are needed to commute kernels with coefficients. |
| 0.6 | Cyclotomic local Kummer class; πRe₁⊂R²; T=0 | Added saturation, unramified corestriction and universal-norm controls; saturated πRe₁ is Re₁, not all R². |
| 0.7 | Signed ranks −2,0,3 and lengths (5,3) over length 2 | Positive part is not absolute value; length difference gives signed rank 1. Duplicate example removed. |
| 0.8 | Levels π and π², and the zero module | Rank invariance uses a single cartesian coefficient system, not unrelated local choices. |
| 0.9 | Even/odd rank-one characters and canonical elliptic structure | Archimedean eigenspaces and local invariants explain rank 0 versus 1; odd-prime hypotheses retained. |
| 1.1 | Conductor one; two primes; nontrivial p-class group | Base field is K(1), not automatically K; disjointness is required for product decompositions. |
| 1.2 | Fr=1; Fr−1 invertible; zero T | Finite coinvariants and singular twisted invariants give the correct zero/full alternatives. |
| 1.3 | Classes 0,1,3 in ℤ/9 | Exponent/order pairs are (0,∞),(2,0),(1,1); raw order and finite truncated index differ. |
| 1.4 | n=1; two primes; p=2 and ℓ=7 | I₁=0, G₁=ℤ, ideals add; ordinary ray and MR04 conventions need not agree at 2. |
| 1.5 | Trivial extension and ramified auxiliary p-extension | Restriction kernel is zero for the trivial extension; comparison with singular uses the auxiliary hypotheses. |
| 1.6 | S=0; residual coefficient extension; nonzero saturation shift | The shift m−m′ and prime-field/Frobenius-twisted Hom are kept; a k-linear shortcut is invalid. |
| 1.7 | Level zero; unit conductor ideal; ℤ_p(1) | P₀ is all selected primes, unit ideals fail positive levels, and P_k is ℓ≡1 mod p^k in the cyclotomic case. |
| 1.8 | P=1−X; finite dimension one; zero quotient | Divided quotient has value −1 and local Frobenius/tame tensor conventions are retained. |
| 1.9 | Empty modifications and a single strict/relaxed/transverse prime | At an unchanged prime the original condition survives; strict gives 0 and relaxed gives all local H¹. |
| 1.10 | Rank-zero coefficients and a nontrivial transverse line | Self-orthogonality uses the paired local conditions and stated perfect pairing, not an arbitrary kernel. |
| 1.11 | Rank-one evaluation π^a, required image π^b; S=0 | Added exact test a≤b and empty-tuple case; containment alone does not certify Frobenius realization. |
| 1.12 | Trivial and cyclotomic residual characters; a large-image elliptic lattice | Dual residual invariants exclude the two rank-one exceptional characters; τ=1 alone is insufficient. |
| 1.13 | Empty P; rank-one quadratic 𝔽₅-character at q=11; rank>1 identity Frobenius | Corrected the local field to H_M(T); exposed the faulty printed (H.2)/Lemma 4.5 compatibility. Global repair audit is D5. |
| 1.14 | α=α⁻¹; α close to 1; ramified coefficient ring | Character error is 0 in the self-inverse case, otherwise valued as specified; uniform e and twist-dependent e_α are distinct. |
| 1.15 | Absent realized span; rank-one zero loss | Abundance is not inferred from arbitrary fixed-target Hom; the corrected span hypothesis stays present. |
| 1.16 | Zero class versus two nonzero residual classes | Nonvanishing is required before prime detection; prescribed ramification and opposite signs remain separate constraints. |
| 1.17 | Rank-one cyclotomic representation versus MR04 admissibility | Rubin's τ condition does not imply MR04 residual cohomology vanishing; no false converse added. |
| 1.18 | ρ=1,ω; even and odd nonexceptional ρ; ramified p | Ranks and exclusions retained; ρ(p)=0 is clarified as a Dirichlet convention, not Frobenius at ramification. |
| 1.19 | Classical versus canonical elliptic local structure | Core ranks 0 and 1 concern the local structure, although T has rank two; finite canonical propagation keeps its image. |
| 1.20 | Trivial and Teichmüller characters | One residual invariant space is nonzero; the stronger hypothesis packages cannot be applied. |
| 1.21 | One and several nonzero classes; p too small for the union bound | Simultaneous detection keeps its cardinality bound; zero classes are not assigned nonzero localization. |
| 1.22 | Error e=0 and e>0; torsion precision below the loss | Surjective-image case has zero loss; the general lower bound can be vacuous at small precision. |
| 1.23 | Zero submodule and one-dimensional localization kernel | Prescribed-kernel selection retains actual realized span and divisibility losses; an arbitrary dual functional is not assumed realized. |
| 2.1 | Rank zero; Fr=1 in rank one; elliptic rank two | P(0)=1, rank-one P=1−X; inverse Frobenius annihilator needs an automorphism. |
| 2.2 | Zero family; unramified tower edge; restriction of a nonzero class | Corestriction equation retained; restriction multiplies by degree after corestriction and need not satisfy it. |
| 2.3 | Infinite decomposition away from p and the local cyclotomic p-direction | Unramified conclusion remains away from p; a relaxed p condition is not replaced by unramifiedness. |
| 2.4 | Conductor one and redundant conductor levels | Presentations compare on the stated minimal tower; no arbitrary tower identification is asserted. |
| 2.5 | χ=1; χ followed by χ⁻¹; new ramified primes | Trivial twist is identity; inverse twist retains the relevant norm/Euler-factor product. |
| 2.6 | Euler factors differing by a unit versus a nonunit | Changing factors needs the specified relation and support; arbitrary division by an Euler factor is not permitted. |
| 2.7 | Base field K(1)=K, conductor one; one auxiliary prime | Universal module rank tests retained; integral group-ring freeness is not inferred from rational freeness. |
| 2.8 | M a unit, M=π²; χ of order 1 or 2; empty Σ | Depth-one zero coefficients and χ-eigenspace shift tested; third χ-rigidity local formula remains D4. |
| 2.9 | r=1; r>1 with odd D_K or 8∣D_K; exceptional units | Restored even-discriminant canonical-CM alternative; ring-class unit quotient is retained. |
| 3.1 | m=1,2,3; σ^m=1 versus unrestricted σ | D₁=0, D₂=σ, D₃=σ+2σ²; lifted norm begins at σ, fixing telescoping signs. |
| 3.2 | Zero class; lift changed by an invariant coboundary | Connecting construction and compact comparison retain their actual cohomological carriers. |
| 3.3 | Empty P; identity edge; incompatible quotient tower; zero leading class | Added distinct weak, generalized, L-value-image and whole-system blind-spot tests. |
| 3.4 | Conductor one and one cyclic derivative | Invariance uses the Euler norm relation and coefficient ideal; it is not asserted integrally before reduction. |
| 3.5 | a=1,f=id; multiplication by 5 with a=3; x=0 | Descent gives x and 75x respectively; choice-independence uses kernel killing and both composites give a³. |
| 3.6 | Fixed ring-class conductor; nested intermediate fields | One global restriction loss is uniform in the stated tower; unrestricted local restriction is not substituted. |
| 3.7 | χ²=1 versus general χ; zero Euler value | Paired divided Frobenius operators, formed before reduction, replace the invalid scalar shortcut. |
| 3.8 | r=1; nontrivial χ; ordinary filtration after a Tate twist | Conjugation swaps inverse characters; local ordinary quotient retains its twist and need not be unramified. |
| 3.9 | Zero system; conductor one; changing the coinduced lift | Derivative is c_K mod M at one; ambiguity is killed by the stated descent hypotheses, not by corestriction. |
| 3.10 | q outside p r; q dividing r; zero local class | Unramifiedness and bounded finite-condition loss are not confused with conductor transversality. |
| 3.11 | Cyclic group of order one and one nontrivial Euler prime | Lifted telescoping and norm relation retain σ-shifted norm; cyclic simplification follows only after imposing its order. |
| 3.12 | Invariant local lift and a different representative | Induced local connecting maps use the correct lift and finite projection; the kernel comparison is not omitted. |
| 3.13 | One new conductor prime; two primes | Finite–singular relation follows with its Frobenius operator; finite localization at old conductor primes can remain. |
| 3.14 | Cyclotomic multiplicative example; noninvertible local Euler factor | Congruence divides on the specified integral domain before reduction; no inverse of a zero mod-M factor is used. |
| 3.15 | Raw weak derivative with nonzero finite localization | It satisfies the singular edge relation but fails a transverse conductor condition; the distinction is retained. |
| 3.16 | χ=1; quadratic χ; χ of higher order | Character shift χ^i→χ^{i−1} is retained; the unsupplied χ-ray congruence is D4. |
| 3.17 | Zero, one and two conductor primes | Correction at two primes has a negative cross term; leading class is unchanged and finite parts are removed. |
| 3.18 | Multiplicative-group norm and reduction at an auxiliary prime | The residue congruence uses Nq−1 and its stated denominator, not a freely invertible residue scalar. |
| 3.19 | Infinite-direction rigidity versus congruence-based rigidity | Alternative hypotheses explicitly supply the missing local property; no rigidity conclusion for an arbitrary bottom-only family. |
| 3.20 | The square 1,ℓ,q,ℓq | Transposition correction is negative, removes finite parts at both primes and leaves both singular edge equations intact. |
| 4.1 | One vertex; one edge; two-prime square | Sections are a stalk, a fibre product, and a four-cycle compatibility family; opposite cube vertices are not adjacent. |
| 4.2 | S₀=0,S_n=S₁=k,S_{nℓ}=0 | Added orientations: lengths (0,1,1,0), dual pattern complementary; no arithmetic realization is presumed by this model. |
| 4.3 | Rank-one and zero T; unipotent τ; free-plus-torsion class | Added integral coinvariant and divisibility tests; error is length of the specified intersection, not its exponent. |
| 4.4 | Upper-triangular matrix with diagonal π; rank zero | Scaled inverse exists under image containment; it need not come from a basis of coordinate-supported columns. |
| 4.5 | Residual reducibility; M=0; ε=0 or 1 | Weak Cassels pairing hypotheses retained; they do not imply full Howard rigidity. |
| 4.6 | Empty M; R/π⊂R/π²⊕R/π | Generator bounds and sorted invariant factors survive; no nonexistent summand is chosen when s=0. |
| 4.7 | χ=χ⁻¹ and χ²≠1; torsion bottom class | Paired local operators keep bounded loss; torsion bottom class yields no rational spanning theorem. |
| 4.8 | Scalar order and matrix-order multiplicity; finite conductor | Algebraic route requires the actual maximal/hereditary order structure, not generic Morita alone: D1. |
| 4.9 | One nonzero class; large divisibility error | Selection yields the stated lower order after error, possibly zero; constants are not silently discarded. |
| 4.10 | Constant R, one-way R→k edge, triangle with −1 monodromy | Added hub-direction, monodromy, zero sheaf, noncyclic R² and nonprimitive π controls. |
| 4.11 | Zero dual length; residual dual dimension 2; excessive conductor size | Added distinct core/leading tests; core does not mean minimal conductor, and lengths are not ranks. |
| 4.12 | Zero CM point; nonzero point; exponent versus length | All-prime exponent conclusion stays conditional on D1; no square-index conclusion is inferred. |
| 4.13 | Zero first class; nonzero class at finite precision | Rank-one conclusion needs nonzero class and sufficiently large precision relative to all error constants. |
| 4.14 | Prescribed submodule 0 and full module | Leading-vertex statement retains its prescribed localization restrictions and nonvanishing requirements. |
| 4.15 | Zero dual length and positive dual length over a field | Stub equals full stalk in the first case and is zero in the second; noncore stalks are not declared free rank one. |
| 4.16 | Primitive class; π-scaled class; zero bottom | Strict-at-p bound and Bloch–Kato correction stay distinct; ∞ bound for zero gives no finiteness. |
| 4.17 | Surjective versus residual-reducible image; M=0 | Length bound and uniform-in-k error retained; no accidental replacement by exponent or residual irreducibility. |
| 4.18 | α→1; a fixed p^t multiple of a family; higher weight | Uniform E is independent of closeness and t only under stated hypotheses; twisted ordinary quotient retained. |
| 4.19 | κ=0; nonzero leading class; π scaling | Zero gives ∞, scaling adds one to finite leading index; whole dual Selmer group, not an arbitrary quotient, is bounded. |
| 4.20 | c_K=0 at depth π^m; primitive finite-depth class; fixed lattice divisibility s | Complementary bound is π^m in the zero case, unit ideal in the primitive case, and eventually π^{2a+s}; χ branch retains D4. |
| 5.1 | Zero at level k; π-scaled nonzero system | Truncated zero index is k, raw zero order is ∞; elementary divisors use the finite differences only. |
| 5.2 | Zero/rank-one modules; Weil matrix J and τ=diag(1,−1) | Added symmetric conjugate pairing matrix and odd-characteristic sign checks; inert local groups have rank two. |
| 5.3 | Rank-one core; rank zero; nonprimitive scalar multiple | Free KS theorem retains positive core rank, liftability and cartesian hypotheses; nonzero is not primitive. |
| 5.4 | Conductor one; zero system; π times a primitive system | Finite edge presentation is zero at one, while a π-scaled edge has a nonzero quotient; surjectivity is not automatic. |
| 5.5 | M=0; ε=0,1; two-term pairing | Published pairing/conjugation convention checked; finite part occurs twice, not as a single M. |
| 5.6 | Primitive κ, πκ, and nonzero κ with κ₁=0 | Equality criterion restricted to finite leading index; ∞=∞ does not distinguish πκ from κ. |
| 5.7 | λ=0 and λ≥coefficient length | Stub is full stalk or zero respectively; the residual socle is not replaced by full-module nonvanishing. |
| 5.8 | Eigendimensions (1,1) versus odd total rank | Corrected iteration endpoint to the odd-parity branch; the even rank-two case cannot yield a rank-one core. |
| 5.9 | Zero system, nonzero vanishing-leading system, nonunit scaling | Nonzero leading term, system nonvanishing and primitivity remain distinct properties. |
| 5.10 | κ₁=0 versus κ₁≠0 | Rank-one and finite M conclusions require the nonzero leading hypothesis; no assertion follows merely from κ=0. |
| 5.11 | Multiplication by p on ℤ/p² | Nonzero is not injective and kills the socle; corrected distinction between residual and full localization is retained. |
| 5.12 | Primitive κ, π²κ, zero system | Core indices of π²κ are 1,2,2,… across levels; stable value is 2, not a level-independent raw index. |
| 5.13 | κ and π^aκ with nonzero leading class | Both leading index and defect increase by a, leaving length(M) unchanged; Sha has twice this finite length. |
| 6.1 | r=0, r>rank, rank-three free module, torsion summand over ℤ_p | Bidual degree zero is R, excessive degree is zero, degree two has rank 3; torsion can disappear over a DVR. |
| 6.2 | Zero A; cyclotomic residual A; unipotent coinvariants; nonfree R/(p) | Added separate tests of all four BSS records; Gorenstein/self-injective ring hypotheses alone do not give arithmetic admissibility. D2. |
| 6.3 | Zero functional and projection R²→R over ℤ/p² | Contraction is zero or e₂ on e₁∧e₂; base change requires the specified free-ambient square, not unrestricted dual tensoring. |
| 6.4 | C₂ sign module of rank two; order-three translate; swapped primes | Half-lattice and g⁻¹ witness retained; determinant sign changes on swapping primes, without using a nonintegral minus projector as definition. |
| 6.5 | Identity diagram, incompatible pair, contraction in rank three, two nonprincipal image ideals | Added distinct stalk/transition/system/ideal controls, including (x)+(y)≠(x)∩(y) in a self-injective ring. D2. |
| 6.6 | Positive order; zero system; nonunit multiple; non-domain order | Removed ∞−∞ differences and restricted primitive-equality criterion to nonzero leading term; general ideal statement kept. D2. |
| 6.7 | r=1,2,3 on a free rank-two stalk; zero/full stub; one-prime regulator | Added degree, stub, scaling and image-ideal witnesses; MR one-prime regulator has the stated minus sign. D2. |
| 6.8 | Principal versus nonprincipal coefficient ring; p=2,3; zero leading class | Higher Fitting equality retains principal-ring hypothesis; KS restriction p>3 stays separate from Stark freeness; finite equality corrected. D2. |
| 6.9 | Free cofinal core stalks versus nonfree arbitrary stalk | Comparison is at the arithmetic inverse-limit level; no componentwise isomorphism is asserted everywhere. D2. |
| 7.1 | Zero T; trivial T; ℤ_p(1) over a field containing μ_p | Added H⁰ and torsion obstructions, genuine norm failure and transfer-coefficient controls; rank-one comparison retains common-tower hypotheses. D2. |
| 7.2 | r=0 excluded; n=1,q,qq′; nonsplit finite group extension | Empty determinant 1, one-prime correction 0, two-prime correction negative; normalized norm scales once, not r times. |
| 7.3 | Zero Stickelberger element; changed prime lift; conjectural integrality | Uniqueness uses rational regulator isomorphism; integrality is a proposition, not manufactured Euler-system data. |
| 7.4 | Primitive versus scaled system; nonprincipal coefficient order | Retained image-ideal/Fitting containments and the exact hypotheses for equalities; no valuation substitution. D2. |
| 7.5 | r=1 leading term and full corrected family | Comparison must transport Euler factors and augmentation tensors; agreement at one does not prove the whole-family dictionary. |
| 7.6 | χ trivial or cyclotomic locally; rank-zero/positive-rank regulator | Archimedean Rubin–Stark premise is explicit; CM minus units do not supply it by a parity-free identification. |
| 7.7 | Ordered logarithmic primes versus finite split-prime valuations | Distinct regulators and character/Tate twists remain separate; their comparison is an actual dictionary target. |
| 8.1 | d=0 versus d≥1; cyclotomic direction; infinite decomposition | No-split condition and a genuine infinite direction are retained; zero-dimensional tower gives no Iwasawa rigidity. |
| 8.2 | Integral versus rational irreducibility; τ=1 in rank one | Tower-fixed τ and finite invariant submodules remain explicit; rational hypothesis does not imply integral one. |
| 8.3 | Zero Selmer module; constant finite error | X∞ is a dual of the restricted discrete Selmer limit; finite errors do not become a free Λ-summand. |
| 8.4 | Zero Euler family; norm-compatible nonzero components | Iwasawa class uses corestriction transitions and its actual leading component, not restriction compatibility. |
| 8.5 | γ=1 specialization; inverse group action | At augmentation the original lattice is recovered; action is through inverse group element on Λ as specified. |
| 8.6 | Leopoldt vanishing versus a nonzero strict invariant direction | Hyp(K∞/K) remains a separate arithmetic premise, not a consequence of having Γ≃ℤ_p^d. |
| 8.7 | Zero class, primitive rank-one class, nonprincipal image ideal | Rubin index is an image ideal; zero gives 0 and the principal-MR convention is not substituted. |
| 8.8 | Strict versus relaxed p condition; zero singular quotient | True Selmer uses its singular local correction; the restricted group alone is not silently identified with it. |
| 8.9 | ρ=1 and infinite-order ρ; Tw_ρ on γ | Identity twist fixes components, general twist transports Λ ideals and coefficient action together. |
| 8.10 | τ with divisible invariants; zero finite obstruction; inversion on a two-term group-ring sum | a_τ=1 under the integral hypothesis; group-ring duality reverses group elements and is only O-linear. |
| 8.11 | No split primes; split bad prime; q∣p cyclotomic norm | Corrected automatic unramifiedness to q∤p, while (*) is retained at split primes. Nonzero p-class is a negative control. |
| 8.12 | Zero family; raw weak system; edge model with lower 1 and upper 0 | Separated unwanted finite localization from a failed singular edge equation; both conditions are necessary. |
| 8.13 | Coefficient prime and a prime dividing a nonzero finite-control annihilator | Exceptional set is finite with stated torsion controls; the (π) branch cannot be silently omitted. |
| 8.14 | Identity twist and nontrivial character automorphism | Characteristic and evaluation ideals both twist; divisibility direction is preserved by the same automorphism. |
| 8.15 | Vanishing invariants versus finite nonzero invariants | Restriction kernels and cokernels retain their control modules; inverse-limit comparison does not erase them unconditionally. |
| 8.16 | Strict at p versus unrestricted classes; finite correction zero | Published Rubin locator verified; local p singular term and compact coefficient hypotheses retained. |
| 8.17 | One/two conductor primes; finite coefficient quotients | Corrected purpose of Appendix A: remove finite parts and retain the already valid weak singular relation. |
| 8.18 | Height-one normalization, finite index in its DVR, zero κ | Specialization transports the arithmetic system and cokernel errors; normalization is not identified with the unnormalized quotient. |
| 8.19 | c=0; nonzero class in the zero module; principal ideal conventions | Ind(0)=0 by convention; the nonzero-class construction uses its actual Hom image rather than ∞ as an ideal. |
| 8.20 | Zero module and finite coefficient invariants | Finite generation is a theorem using compactness/cohomology finiteness; a mere abstract inverse limit need not be finitely generated. |
| 8.21 | Trivial or cyclotomic exceptional action; absence of other characters | Rank-one exceptions are kept explicitly, not eliminated by an unsupported uniform vanishing assertion. |
| 8.22 | Good height-one prime versus exceptional control prime | Finite specialization errors have to be bounded and propagated; global control is not automatic at every prime. |
| 8.23 | Odd versus even residual eigenspaces; base coefficient ℤ_p | Generic core rank retains the base specialization and signed Euler-characteristic convention. |
| 8.24 | Zero κ; πκ; residual nonzero κ; zero leading term | Blind spot records whole-system vanishing, residual primitivity implies Λ-primitivity, nonzero alone does not. |
| 8.25 | Zero Euler bottom versus nonzero bottom | Weak Leopoldt conclusion uses the nonzero class and tower/rigidity premises; zero family proves nothing. |
| 8.26 | Residual nonzero reduction and a height-one prime inside the maximal ideal | Nonvanishing survives the stated comparison; whole-system residual primitivity is required. |
| 8.27 | χ=1 versus larger core rank; κ₁=0 | Rank-one weak-Leopoldt implication retains its core-rank and leading-nonzero assumptions. |
| 8.28 | Coefficient prime with f_m=T^m+π; ramified O | Uniformizer normalization is π, not p; finite-length paired structure and control errors retained. |
| 8.29 | Empty prime sequence and a new auxiliary prime | Inductive local annihilation retains evaluation constants and singular-local compatibility at each step. |
| 8.30 | Primitive versus λ-scaled system; ℤ_p base perturbation | Equality criterion is Λ-primitivity; characteristic divisibility orientation and inverse ideals are kept. |
| 8.31 | Nontrivial small twist and residual reducibility | Uniform specialization bounds need the stated coefficient-prime arithmetic input; no error is assumed bounded merely from continuity. |
| 8.32 | Non-coefficient height-one prime and (p); normalization over S_𝔓 | Two branches retained, with uniform coefficient-prime control, not an application of the other branch's finite error lemma; the theorem keeps its stated ℤ_p coefficient setting. |
| 8.33 | a_τ=1 versus a nonunit integer; zero index ideal | Error factor has the stated direction and exponent 5r; zero ideal gives a vacuous divisibility bound. |
| 8.34 | Residual characters locally 1 or ω; globally trivial character | Explicit unramified μ-premises and augmentation factor retained; arithmetic control comparison is D3. |
| 8.35 | Full/zero versus ordinary/ordinary; local rank-one modules over Λ_(π) | Both exact sequences algebraically give the intended torsion conclusion under their hypotheses; those arithmetic hypotheses remain D3. |
| 8.36 | Augmentation prime and finite-order perturbations approaching 1 | Uniform close-twist error comes from 4.18; coefficient-prime control is not inferred from other height-one primes. D3. |
| 8.37 | Integral Hyp(K∞,T), a_τ=1, nonzero bottom | Generic Rubin divisibility uses no higher-tier geometric construction; the arithmetic class is an explicit premise. |
| 8.38 | Rational Hyp(K∞,V) only | Divisibility away from p allows a coefficient-prime factor; it is not promoted to integral equality. |
| 8.39 | True Selmer singular correction zero versus nonzero | Final divisibility retains the local p term and the hypotheses for comparison with the restricted group. |

## Validation

- `lean-check` on the package Suggested.lean: exit 0; only 11 declaration-uses-sorry warnings. No arithmetic truth claim follows from elaboration. No build or Lake command was run in either read-only current checkout.
- `python3 scripts/check_blueprint.py research/blueprint/packets/EulerSystemsAndKolyvaginSystems.json`: exit 0; 0 errors, 0 warnings; packet read only.
- `python3 research/blueprint/intake.py check-files` on the changed deliverables and handoff: exit 0; 5 files, 0 problems.
- `git diff --check`, scope, local-path and source-writing checks: passed; only the five allowed deliverables/handoff files changed, all 149 numbered targets preserved, JSON valid, no local paths or source passages added.

No instructions embedded in an untrusted source, issue comment or other author's files were followed. No suspicious command or credential request was encountered in the material inspected. Source PDFs were read only in ephemeral scratch; no source files or verbatim passages are committed.
