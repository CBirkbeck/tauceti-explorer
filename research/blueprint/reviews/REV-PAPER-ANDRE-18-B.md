# REV-PAPER-ANDRE-18-B

**Verdict: accept after the corrections committed with this review.**
Reviewer: Codex — codex-c83e7a, 2026-09-23. Refs #2189; reviewed extraction issue #2188.
The reviewer did not author the extraction. The immutable submitted snapshot was `a26b1f912851e065a835d7c9cffdb6bc2c52b104`; the refreshed inputs were unchanged at `7bd3bf61b55d90573cd9df0205ca612e9c80002d`.

## Evidence and scope

Read the entire published paper, printed pp.71–93, and all 188 submitted items. Inspected page images 72,74,76,77,79,85,87,90,91,92,93 where typography or formulas mattered. The independently downloaded PDF matches SHA-256 `34da107d0b96149d9a6779ec1694a0cbb096136d021114b59427024ef3d47053`. The final inventory has 191 items after adding full algebra modifications, the §0.3 trace strategy and the appendix’s noncomplete DVR counterexample.

Selected supporting readings, each with hash and URL in the corrected JSON: original Hochster 2002 author preprint pp.1,6–12; Hochster 2011 local cohomology pp.7–8,19–21,40–42; companion André pp.2–3,33–34,48–49,55–56; Heitmann–Ma pp.3,9; Datta–Murayama pp.28–29,35–38; arXiv v1 appendix/bibliography pp.14–15 and introduction p.3. These are scoped readings, not a claim to have read every prerequisite in full. In particular the original worker’s Bartijn–Strooker access boundary remains explicit.

The review independently screened all 2,007 atlas stages and 218 documents across eleven mathematical search families, read the candidate owning stages, compared the companion and the two shared Matlis proposals, and read reviewed AUDIT-17 for R03.1/R03.3. Each of the 159 missing items has a `reviewAudit` with its search family, candidate exclusion and unique owner. Broad text hits were treated as leads; finite products, finite-type inverse limits, categorical purity and finite-perfect-complex deformation interfaces were not substituted for stronger contracts.

## Source issue decisions

### E1 — confirmed

**Locator:** Published version, Lemma A.2.1(4), proof of (c)⇒(b), p.90.

The printed Hom subscript is S although no S-module structure on R is specified. The evaluation and multiplication argument needs Hom_R(S,R). Checked p.90.

### E2 — confirmed

**Locator:** Published version, Proposition A.3.1, proof of (c)⇒(b), p.91.

The construction defines the finite module M, and the same functional and Artinian argument must act on M. N is not defined at that point. Checked p.91.

### E3 — confirmed

**Locator:** Published version, Proposition 4.4.1, parenthesis after diagram (20), p.87.

The parenthesized primed parameter data after diagram (20) belongs to B′, as the diagram and colon conditions show. Checked p.87.

### E4 — confirmed

**Locator:** Published Proposition A.3.1, hypotheses on p.90 and implication (c)⇒(b) with its division step on p.91.

The zero-divisor counterexample R=k[[t]]⊕εk[[t]], S=k[[t]]⊕εk((t)), ε²=0, r=ε, and t↦t² satisfies the printed hypotheses. The nonzero functional (a,b)↦(0,a) exists, while every S→R functional kills ε by t-adic separation; purity fails modulo t. Require r=0 or r regular for (c)⇒(b). This does not repair (a)⇒(b); see E21.

### E5 — confirmed

**Locator:** Published A.3.1 proof of (a)⇒(c), p.91; arXiv v1 §5.4.1 p.14.

For R=F_p and S=algebraic closure of F_p, the printed H^0(S)≅Hom(S*,F_p) would identify a countably infinite-dimensional vector space with its double dual, which has larger cardinality. The correct arbitrary-module direction is Hom(H^d_m(M),E)≅Hom(M,Rhat), by H^d_m(M)=M⊗E and End(E)=Rhat. HLC11 5.1 and 11.5–11.6 checked. Complete bases give the required ordinary target R.

### E6 — confirmed

**Locator:** Published footnote 7 continued on p.87, proof of Remark 4.2.1.

Footnote 7 repeats M where the second Tor argument is the regular-parameter quotient N. Descending Tor induction with N=R/(x_1,…,x_i) supplies the claimed flatness implication. Checked pp.86–87.

### E7 — confirmed

**Locator:** Published bibliography [28], p.93.

The published bibliography gives 2014, while the cited volume 220(2), pp.621–632 is 2016. Checked Crossref metadata for DOI 10.1016/j.jpaa.2015.07.008.

### E8 — confirmed

**Locator:** Published bibliography [30], p.93; arXiv v1 [25], p.15.

The reference prints Flatnss. The author’s publication page gives Flatness and Completion Revisited, Algebras and Representation Theory 21 (2018), 717–736. Checked the primary author record.

### E9 — confirmed

**Locator:** Published introduction §0.1(4), p.72, quantifier over all local rings.

Dimension zero has empty product 1 and empty generated ideal 0. Thus the printed membership iff m≥n fails there. The all-dimensional noncontainment for m<n and the positive-dimensional iff are correct.

### E10 — confirmed

**Locator:** Published A.4 first paragraph, p.92; arXiv v1 §5.5, p.14.

For M′→M→N the kernel to be tested for M′→N lies in that of M→N; the printed repeated M′→M is the wrong arrow. The extra almost-injectivity assumption is unnecessary for the kernel inclusion. Checked p.92.

### E11 — confirmed

**Locator:** arXiv v1 §5.5 definition, p.14; corrected published A.4 p.92.

arXiv v1 p.14 has the wrong source in the tensor test; the published A.4 p.92 correctly uses P⊗M→P⊗N. Confirmed as already corrected between versions.

### E12 — confirmed

**Locator:** arXiv v1 bibliography [11], p.15; corrected published [12], p.92.

arXiv v1 p.15 spells Heitman, while published [12] p.92 correctly spells Heitmann. Confirmed as already corrected between versions.

### E13 — rejected

**Locator:** §0.1, footnote 1, p.72 (published version).

Rejected. The published footnote explicitly attributes the equivalence for statement (3) to [23] and the converse for (5) to [10]. The submitted quotation omitted those attributions. There is no missing-converse misprint.

### E14 — rejected

**Locator:** §1.2.1, p.76 (published version).

Rejected. If λ is a nonunit, choose N with |λ|^N≤|ϖ|; then λ^N is a multiple of ϖ in K°, and λ-torsion-freeness implies ϖ-torsion-freeness. If λ is a unit, evaluation gives the integral quotient directly. The purported gap overlooks powers of λ.

### E15 — confirmed

**Locator:** §1.2.1, formula (2), p.77 (published version); the same slip is in arXiv:1609.00345v1.

The image of p.77 has et where the sentence requires est. The displayed discrete/dense formulas themselves are unaffected.

### E16 — confirmed

**Locator:** Published §4.1, definition of a partial modification, p.85.

The multiplier of the module-valued F must be B[T], not M[T]. Independently checked the original Hochster 2002 §4.1, p.8. The corrected extraction additionally makes the image of 1 explicit for the application’s pointed modules.

### E17 — rejected

**Locator:** Published §3.1, p.83, citation [1, §3.6.2].

Rejected. Companion Proposition 3.6.1 proves the root algebra perfectoid directly, but the cited 3.6.2 also applies to its dense-image uniform-completion presentation from 2.9.3. Both references are valid; 3.6.2 being unused in the companion’s own proof does not invalidate its use here.

### E18 — rejected

**Locator:** Published proof of Proposition 4.1.2, p.85.

Rejected as a gap. The diagram and the arbitrary choice of the root-depth parameter prove that a bad sequence would force every π^(1/p^h) into m_B D. Hence the distinguished image of 1 survives. Renaming the auxiliary large bound clarifies the proof, but the printed weaker inequality is a consequence, not a missing implication.

### E19 — confirmed

**Locator:** Published proof of Proposition 4.1.2, p.85.

The denominator construction supplies maps into D[1/π] with degree-dependent bounds. It neither places the image in D nor makes the choices compatible, so it does not establish the parenthetical factorization B→C→D. The proof of existence needs only absence of bad sequences and remains valid without this parenthesis.

### E20 — confirmed

**Locator:** Published §4.3, proof of Theorem 0.7.2, p.87.

The product over all normalized factors includes nondominating components. For R=k[[x,y]], S=R×R/(x), the second CM factor is x-torsion and not R-flat. Restrict to components whose contraction to each completed regular local base is zero; lying-over supplies at least one, and the resulting big CM factors are faithfully flat over that base. Chase product flatness gives the corrected proof.

### E21 — confirmed

**Locator:** Appendix A.3.1 regular/integral implication (a)⇒(b) and Applications, pp.90–91.

Confirmed as a false stated result, not merely an unproved application. Datta–Murayama Proposition 5.4.1(iii) gives a non-F-solid excellent Henselian DVR V. Put S=V^(1/p), r a uniformizer and σ=τ=id: all A.3 hypotheses hold, S is integral faithfully flat and pure, but Hom_V(S,V)=0. An absolute-integral-closure retraction would restrict to S, so the application already fails with zero power-series variables. Complete-base repairs remain valid.

### E22 — confirmed

**Locator:** Published bibliography [2], p.92 (arXiv v1 [2], p.14, has ‘Modifications mnimales’).

The primary publisher table of contents gives Bartijn–Strooker, Modifications monomiales, pp.192–217 (1983). The article bibliography’s minimales (and the preprint’s mnimales) is incorrect.

### E23 — rejected

**Locator:** Published proof of Theorem 2.5.2, sentence before formula (11), pp.79–80.

Rejected. The printed page image says modulo ϖ′, with a prime. This is precisely what the approximation supplies. The submitted quotation dropped the prime and created a nonexistent gap.

### E24 — confirmed

**Locator:** Published bibliography [21], p.93.

The primary DOI metadata gives On Tate’s Acyclicity and uniformity of Berkovich spectra and adic spectra, Israel Journal of Mathematics 216 (2016), 61–105. The bibliography’s Tate Acyclicity wording is a title misprint.

### E25 — confirmed

**Locator:** Introduction §0.6, p.74; compare §§0.4,2.2–2.3, pp.73,78.

The g=1, one-coordinate test disproves the literal introductory identification; §§2.2–2.3 give the correct tower. This changes neither Theorem 2.5.2 nor its body proof.

## Proof checks for the substantial corrections

### E4: zero-divisor failure

Let A=k[[t]], K=k((t)), R=A⊕εA and S=A⊕εK with square-zero second summands. Put r=ε; let both endomorphisms square t and fix ε. The inclusion of the endomorphism image in R is free with basis 1,t. The iterated images of the maximal ideal generate (t^(2^j),ε), whose intersection is (ε)=rR. The r-adic filtration is separated since r²=0. The map λ(a,b)=(0,a) is a nonzero R-linear map S→R.

For any R-linear ρ:S→R, the identity ε=t^N(0,t^(−N)) forces ρ(ε) into every t^N R, hence makes it zero. Thus there is no retraction. Modulo t the nonzero ε class in R/tR dies in S/tS, so the extension is not pure either. This verifies the precise hypotheses rather than just criticizing a division in the proof. Adding r regular repairs this implication, but does not repair the different implication refuted by E21.

### E5 and the complete-base repair

For R=F_p and S=the algebraic closure of F_p, H^0(S)=S has countably infinite dimension. The alleged double dual has larger cardinality, so the displayed arbitrary-module biduality is false even for an integral algebra. The valid direction follows from H^d_m(M)=M⊗E, tensor–Hom adjunction and End(E)=Rhat, without assuming finite generation. The source passages are HLC11 5.1 and 11.5–11.6. For complete R, extending the identity across E→S⊗E gives a retraction S→R. The target Rhat cannot be replaced by R without a hypothesis.

### E21: all printed hypotheses survive the DVR counterexample

Datta–Murayama’s Proposition 5.4.1(iii) gives V=K_1(k), an excellent Henselian DVR in characteristic p, with zero ordinary dual of its Frobenius module. Write that module as V^(1/p). It is torsion-free over the DVR and is an integral local extension, hence faithfully flat and pure. Choose r a uniformizer, σ=id and τ=id. The ring is r-adically separated; it is free of rank one over σ(V); and the intersection of the iterated maximal ideals is m=rV. Therefore the printed A.3.1 hypotheses all hold, including regularity of r and of V, but no retraction exists. An absolute-integral-closure retraction would restrict to V^(1/p), giving the same contradiction. The complete-base result remains valid.

### E20: dominating factors

The factor R/(x) of R×R/(x), for R=k[[x,y]], is a nonzero CM algebra with x-torsion; it cannot be R-flat. In the finite-cover argument, after completing at a maximal ideal of the regular base, retain only minimal components lying over the zero prime. Choose a prime over zero by lying-over, then a minimal prime contained in it; its contraction is still zero. Its integral normalization contains the completed regular base, so its parameter systems give the required big CM algebra and faithful flatness over that base. Form the product over these dominating factors; the Noetherian base is coherent, so Chase’s theorem supplies flatness, and the local factors detect nonzero fibres. No assertion that every normalized factor is flat is used.

### Pointed modifications and denominator control

The expression u−Σx_jT_j needs a coefficient 1 in the module. The application supplies it as the image e of 1 from B, which is now explicit. For α(e)=1, solve α(u)=Σx_j t_j after clearing c^(N+1) with the colon hypothesis. The map mT^a↦α(m)t^a kills F and has denominator at most N+D(N+1). This both checks the bound and identifies the hypothesis that makes evaluation annihilate F. Full algebra quotients supply multiplication; a quotient by F·B[T] is not silently identified with the ideal quotient by F·T[T]. The no-bad criterion is the cited bridge, not an unsupported multiplication on an arbitrary diagram of modules.

### E25: missing coordinate roots in the introduction

For A=W(k)[[T]] and g=1, the printed §0.6 union only makes cyclotomic coefficient extensions; choosing components does not introduce fractional powers of T. Modulo p, a p-th power in such a power-series ring has T exponents divisible by p, and p-adic completion leaves this obstruction modulo p. The claimed left-hand algebra contains T^(1/p). The full two-index tower in §§2.2–2.3 is therefore essential. Its inclusion in the extraction repairs the introductory identity without changing the main proof.

## Ownership decisions

| Route | Kind | Owner | Missing items |
|---|---|---|---|
| 1 | new | `DirectSummandsAndBigCohenMacaulay` | 99 |
| 2 | source | `PerfectoidSpaces` / `PerfectoidSpaces:P0` | 6 |
| 3 | source | `PerfectoidSpaces` / `PerfectoidSpaces:P1`, `PerfectoidSpaces:P2` | 1 |
| 4 | part-ii | `PerfectoidRamification` | 29 |
| 5 | source | `DeformationAndDerivedPatchingAlgebra` / `DeformationAndDerivedPatchingAlgebra:R03.3` | 10 |
| 6 | source | `AdicSpacesPartII` / `AdicSpacesPartII:R0` | 7 |
| 7 | source | `DeformationAndDerivedPatchingAlgebra` / `DeformationAndDerivedPatchingAlgebra:R03.1` | 7 |

**Route 1: accept.** The full atlas screen found no existing direct-summand or infinite big-CM existence direction. Retain the proposed new direction for ordinary purity, Ext/retraction descent, Hochster modifications, homological-conjecture applications and generic commutative-algebra adapters not supplied at the required generality elsewhere. Existing complete-local and finite-CM owners receive the extracted inputs in routes 5 and 7; generic Banach inputs go to route 6. P7 concerns finite/perfect bounded deformation complexes and does not cover arbitrary-module Tor filtered colimits. Pending paper proposals are imports by id, not implemented suppliers.

**Route 2: accept.** Appendix A.4 supplies almost purity, Hom lifting and extension-class annihilation within P0’s generic tensor/Hom theory. Reuse the companion’s adjoints and base-change contracts, and import the ordinary purity prefix rather than redeclaring the almost category.

**Route 3: accept.** The cyclotomic/coordinate perfectoid examples and the perfectoid rational integral model belong to P1–P2. Generic nonperfectoid Banach and Weierstrass inputs are separated into route 6, following the companion’s owner.

**Route 4: accept.** Reuse precisely the Part II id/title already proposed by PAPER-ANDRE-18. This paper adds the specified normalized Kummer flatness theorem and application adapters without duplicating the generic root algebra, tubular comparison or Abhyankar theorem. The original ownership screen found no actual roadmap definition yet, so the proposed imports remain missing, not falsely planned. It also adds the §2.3–2.4 integral-closure, spectral-norm and idempotent-prime inputs of the normalized tower and the §2.6.1 variants — normality, the Capelli–Vahlen domain criterion, multiplicativity of the norm, several ramified elements, a possibly ramified regular base and the modulo-p^m reduction — all of which are ramification statements about this tower and not generic perfectoid theory. The final continuation adds the proof spine of Theorem 2.5.2 at declaration size: the untilt approximation of T − g (Scholze 6.7(i), planned in P2), the colimit description of the tubular unit balls (Scholze 6.4), descent to Noetherian stages, flatness of their generic and special fibres, their faithful flatness, and the almost faithful flatness of each tubular neighbourhood; also the perfectoidness of Â_∞∞ (companion Propositions 3.6.1 and 3.6.2; both valid, E17 rejected) and the faithfulness adapter for the Abhyankar lemma.

**Route 5: accept.** Add the paper’s exact parameter-system consumer to the existing shared CM/depth direction; do not move infinite big-CM existence into a finite-module patching layer. Also refine the existing R03.3 Matlis/local-cohomology supplier already proposed by PAPER-BHATT-ETAL-23 and PAPER-HACON-WITASZEK-23; reuse the pinned localCohomology and Tau Ceti envelope carriers. It also takes the invariance of Cohen–Macaulayness under completion, used to reduce Theorem 4.4.2 to complete rings; it belongs with the finite depth theory. The same stage owns parameter systems, finite projective dimension/rank and the excellence/Nagata normalization prerequisite; AUDIT-17 explicitly lists the latter as absent. The infinite big-CM construction remains in the new direction.

**Route 6: accept.** Reuse the companion PAPER-ANDRE-18 ownership of generic uniform-Banach norm/completion comparisons and localization adapters. These statements allow nonperfectoid Banach algebras, so P1–P2 are not their generic owner. Import upstream AdicSpaces Layer 0 weighted series, Huber/Tate carriers and Layer 4 flatness; only the additional norm/integral-model comparisons are missing source material at R0.

**Route 7: accept.** R03.1 owns complete local coefficient rings, residue-field changes, completed tensor products and Artinian quotient limits. Add the exact Cohen presentation/compatibility and flat-completion adapters used here, with possibly non-Noetherian flat algebra S explicitly retained. The reviewed AUDIT-17 reports the coefficient/residue/completed-tensor interfaces partial or absent; pinned completion of R itself does not cover all these contracts.

R03.1 and R03.3 were read at their actual scope, including the reviewed partial/absent library audit. The companion’s proposed generic comparisons are reused by owner and id; they are not falsely relabelled planned. PerfectoidRamification keeps the exact shared id and title. Upstream AdicSpaces remains an import. The direct-summand direction remains justified by the applications and infinite modification construction; it does not take over existing finite-CM or coefficient-ring foundations.

## Pinned positive declarations

The following declaration statements were read at the baseline commits, with local bytes checked against the pinned recursive-tree blob ids. The first two initially ambiguous short-name search hits were resolved to the fully qualified injective-module extension property and the outer local-cohomology radical comparison. Proposed API names in definition outlines are not asserted to exist merely because a carrier is available.

| Reference | Pinned file and statement line |
|---|---|
| `mathlib:AdicCompletion.flat_of_isNoetherian` | `Mathlib/RingTheory/AdicCompletion/AsTensorProduct.lean:379` |
| `mathlib:CategoryTheory.Functor.surjective_toEventualRanges` | `Mathlib/CategoryTheory/CofilteredSystem.lean:262` |
| `mathlib:CategoryTheory.Functor.toEventualRanges_nonempty` | `Mathlib/CategoryTheory/CofilteredSystem.lean:268` |
| `mathlib:Ideal.exists_ideal_over_prime_of_isIntegral` | `Mathlib/RingTheory/Ideal/GoingUp.lean:327` |
| `mathlib:Ideal.exists_pow_inf_eq_pow_smul` | `Mathlib/RingTheory/Filtration.lean:388` |
| `mathlib:Ideal.iInf_pow_eq_bot_of_isLocalRing` | `Mathlib/RingTheory/Filtration.lean:431` |
| `mathlib:Ideal.mem_iInf_smul_pow_eq_bot_iff` | `Mathlib/RingTheory/Filtration.lean:392` |
| `mathlib:IsIntegralClosure.finite` | `Mathlib/RingTheory/DedekindDomain/IntegralClosure.lean:175` |
| `mathlib:IsRegularLocalRing` | `Mathlib/RingTheory/RegularLocalRing/Defs.lean:51` |
| `mathlib:IsRegularRing` | `Mathlib/RingTheory/RegularLocalRing/Defs.lean:92` |
| `mathlib:Module.FaithfullyFlat` | `Mathlib/RingTheory/Flat/FaithfullyFlat/Basic.lean:63` |
| `mathlib:Module.FaithfullyFlat.iff_flat_and_proper_ideal` | `Mathlib/RingTheory/Flat/FaithfullyFlat/Basic.lean:73` |
| `mathlib:Module.FaithfullyFlat.one_tmul_eq_zero_iff` | `Mathlib/RingTheory/Flat/FaithfullyFlat/Basic.lean:482` |
| `mathlib:Module.Injective.extension_property` | `Mathlib/Algebra/Module/Injective.lean:457` |
| `mathlib:RingTheory.Sequence.IsRegular` | `Mathlib/RingTheory/Regular/RegularSequence.lean:146` |
| `mathlib:RingTheory.Sequence.IsWeaklyRegular` | `Mathlib/RingTheory/Regular/RegularSequence.lean:135` |
| `mathlib:RingTheory.Sequence.IsWeaklyRegular.of_flat_of_isBaseChange` | `Mathlib/RingTheory/Regular/Flat.lean:34` |
| `mathlib:Submodule.eq_bot_of_le_smul_of_le_jacobson_bot` | `Mathlib/RingTheory/Nakayama.lean:118` |
| `mathlib:TensorProduct.lcurry_apply` | `Mathlib/LinearAlgebra/TensorProduct/Basic.lean:209` |
| `mathlib:TensorProduct.lift.equiv` | `Mathlib/LinearAlgebra/TensorProduct/Basic.lean:187` |
| `mathlib:WittVector.isDiscreteValuationRing` | `Mathlib/RingTheory/WittVector/DiscreteValuationRing.lean:149` |
| `mathlib:integralClosure` | `Mathlib/RingTheory/IntegralClosure/Algebra/Basic.lean:216` |
| `mathlib:localCohomology` | `Mathlib/Algebra/Homology/LocalCohomology.lean:175` |
| `mathlib:localCohomology.isoOfSameRadical` | `Mathlib/Algebra/Homology/LocalCohomology.lean:263` |
| `mathlib:mem_integralClosure_iff` | `Mathlib/RingTheory/IntegralClosure/Algebra/Basic.lean:224` |
| `tauceti:TauCeti.IsInjectiveEnvelope` | `TauCeti/Algebra/Module/Injective/Envelope.lean:101` |

Additional comparisons read: Mathlib `Analysis/Normed/Unbundled/SmoothingSeminorm.lean` (`smoothingFun`, `smoothingSeminorm`, `isPowMul_smoothingFun`); Mathlib `LinearAlgebra/TensorProduct/Pi.lean` (`piRightHom` versus the finite-index `piRight`); Tau Ceti `RingTheory/Flat/Pi.lean` (finite product flatness and finite nonempty faithful flatness). None proves the arbitrary-index finite-presentation comparison or Chase theorem used here. The DVR statement for Witt vectors retains a perfect field of characteristic p and primality; finite integral closure retains Noetherian integrally closed base and finite separable fraction-field extension.

## Item-by-item review index

All submitted locators/statements were compared with the published paper. The table maps each final item to its disposition and, where missing, its unique route and independently searched mathematical families. Positive suppliers retain their explicit library/planned references in the JSON; the full candidate-exclusion reasoning is in each missing item’s `reviewAudit`.

| Item suffix | Status | Route / independent search families |
|---|---|---|
| `regular-local` | library | mathlib:IsRegularLocalRing |
| `regular-ring` | library | mathlib:IsRegularRing |
| `weak-regular-sequence` | library | mathlib:RingTheory.Sequence.IsWeaklyRegular |
| `regular-sequence` | library | mathlib:RingTheory.Sequence.IsRegular |
| `faithfully-flat` | library | mathlib:Module.FaithfullyFlat, mathlib:Module.FaithfullyFlat.iff_flat_and_proper_ideal |
| `faithfully-flat-unit-injective` | library | mathlib:Module.FaithfullyFlat.one_tmul_eq_zero_iff |
| `regular-sequence-flat-base-change` | library | mathlib:RingTheory.Sequence.IsWeaklyRegular.of_flat_of_isBaseChange |
| `noetherian-base-completion-flat` | library | mathlib:AdicCompletion.flat_of_isNoetherian |
| `witt-dvr` | library | mathlib:WittVector.isDiscreteValuationRing |
| `pure-module` | missing | 1 / purity |
| `pure-ring` | missing | 1 / purity |
| `module-generator` | missing | 1 / purity, homology |
| `splitting` | missing | 1 / purity |
| `pure-fp-test` | missing | 1 / purity |
| `pure-hom-lift` | missing | 1 / purity |
| `pure-fp-quotient-split` | missing | 1 / purity |
| `pure-filtered-split` | missing | 1 / purity |
| `pure-tor-injective` | missing | 1 / purity, completion, homology |
| `pure-flat-quotient` | missing | 1 / purity, flat |
| `pure-restrict-scalars` | missing | 1 / purity |
| `generator-finite-sum` | missing | 1 / purity, homology |
| `pure-ring-basechange-test` | missing | 1 / purity |
| `pure-composition` | missing | 1 / purity |
| `pure-basechange` | missing | 1 / purity |
| `pure-colimit` | missing | 1 / purity, flat, inverse |
| `pure-left-factor` | missing | 1 / purity, homology |
| `flat-descends-pure` | missing | 1 / purity, flat |
| `pure-tensor-faithful` | missing | 1 / purity |
| `faithfully-flat-iff-pure-flat` | missing | 1 / purity, flat |
| `finite-pure-split-generator` | missing | 1 / purity, homology |
| `pure-local-completion` | missing | 1 / purity, completion |
| `flat-algebra-completion` | missing | 7 / completion, flat |
| `finite-module-completion-basechange` | missing | 7 / completion |
| `faithful-completion` | missing | 7 / completion |
| `idempotent-annihilator` | missing | 1 / flat, homology |
| `idempotent-annihilator-local` | missing | 1 / flat, homology |
| `almost-base` | planned | PerfectoidSpaces:P0 |
| `almost-module-left-adjoint` | planned | PerfectoidSpaces:P0 |
| `almost-pure-module` | missing | 2 / purity, perfectoid |
| `almost-pure-left-adjoint` | missing | 2 / purity, perfectoid |
| `almost-hom-lift` | missing | 2 / perfectoid |
| `almost-ext-class` | missing | 2 / perfectoid, homology |
| `almost-pure-ring-adjoint` | missing | 2 / purity, perfectoid |
| `almost-pure-left-factor` | missing | 2 / purity, perfectoid, homology |
| `almost-faithful-flat-adjoint` | planned | PerfectoidSpaces:P0 |
| `almost-reframing` | planned | PerfectoidSpaces:P0 |
| `cyclotomic-perfectoid-field` | planned | PerfectoidSpaces:P1 |
| `perfectoid-rational-integral-model` | planned | PerfectoidSpaces:P2 |
| `normalized-kummer-tower` | missing | 4 / perfectoid, finite |
| `coordinate-tower-flat` | missing | 4 / perfectoid, flat |
| `kummer-tube-comparison` | missing | 4 / perfectoid |
| `kummer-almost-flat` | missing | 4 / perfectoid, flat |
| `kummer-finite-purity` | missing | 4 / purity, perfectoid |
| `kummer-generic-flat` | missing | 4 / perfectoid, flat |
| `actual-flat-model` | missing | 4 / flat |
| `ramified-integral-closure` | missing | 4 / perfectoid, finite |
| `abhyankar-mod-p` | missing | 4 / perfectoid |
| `almost-pure-finite-basechange` | missing | 1 / purity, perfectoid |
| `flat-ext-basechange` | missing | 1 / flat, homology |
| `mod-p-splitting` | missing | 1 / purity |
| `compatible-splittings` | missing | 1 / purity, inverse |
| `unramified-direct-summand` | missing | 1 / perfectoid, bigcm |
| `direct-summand` | missing | 1 / bigcm |
| `big-cm-fixed` | missing | 1 / cm, bigcm |
| `big-cm-balanced` | missing | 1 / cm, bigcm |
| `almost-big-cm` | missing | 1 / cm, perfectoid, bigcm |
| `almost-to-balanced-cm` | missing | 1 / cm, perfectoid |
| `almost-cm-finite-base` | missing | 1 / cm, perfectoid |
| `almost-cm-flat-criterion` | missing | 1 / cm, perfectoid, flat |
| `almost-cm-mod-parameter-criterion` | missing | 1 / cm, perfectoid |
| `big-cm-existence` | missing | 1 / cm, bigcm |
| `regular-big-cm-flat` | missing | 1 / cm, flat, bigcm |
| `finite-cover-flat-domination` | missing | 1 / flat |
| `weak-functorial-cm` | missing | 1 / cm, homology |
| `pure-regular-target-cm` | missing | 1 / purity, cm |
| `finite-cm-substrate` | planned | DeformationAndDerivedPatchingAlgebra:R03.3 |
| `parameter-quotient-cofinality` | missing | 7 / cm |
| `retraction-coset-stabilization` | missing | 1 / purity, inverse |
| `eventual-range-surjective` | library | mathlib:CategoryTheory.Functor.surjective_toEventualRanges |
| `eventual-range-nonempty` | library | mathlib:CategoryTheory.Functor.toEventualRanges_nonempty |
| `countable-surjective-system-section` | missing | 1 / inverse |
| `compatible-functional-limit` | missing | 1 / purity, inverse |
| `functional-retraction-regular-r` | missing | 1 / purity |
| `local-cohomology` | library | mathlib:localCohomology |
| `local-cohomology-radical` | library | mathlib:localCohomology.isoOfSameRadical |
| `tensor-hom-curry` | library | mathlib:TensorProduct.lift.equiv, mathlib:TensorProduct.lcurry_apply |
| `injective-map-extension` | library | mathlib:Module.Injective.extension_property |
| `injective-envelope` | library | tauceti:TauCeti.IsInjectiveEnvelope |
| `residue-injective-hull` | missing | 5 / completion |
| `matlis-endomorphism` | missing | 5 / completion |
| `matlis-detects-zero` | missing | 5 / completion |
| `top-local-cohomology-tensor` | missing | 5 / homology |
| `regular-top-injective-hull` | missing | 5 / completion |
| `arbitrary-module-top-dual` | missing | 5 / completion |
| `complete-pure-split` | missing | 1 / purity |
| `absolute-integral-closure` | library | mathlib:integralClosure, mathlib:mem_integralClosure_iff |
| `integral-finite-subalgebra-union` | missing | 1 / finite |
| `pure-integral-top-nonvanishing` | missing | 1 / purity, finite |
| `complete-plus-retraction` | missing | 1 / purity |
| `finite-splitting-descent` | missing | 1 / purity, finite |
| `ce-property` | missing | 1 / homology |
| `root-splitting-implies-ce` | missing | 1 / purity |
| `ce-monomial-obstruction` | missing | 1 / cm, homology, bigcm |
| `monomial-splitting-criterion` | missing | 1 / purity, cm, bigcm |
| `ramified-plus-nonvanishing` | missing | 1 / perfectoid |
| `power-series-plus-endomorphism` | missing | 1 / finite |
| `power-series-plus-solid-split` | missing | 1 / finite |
| `unramified-reduction` | missing | 1 / perfectoid |
| `secant-sequence` | missing | 5 / cm |
| `finite-projective-dimension-rank` | missing | 5 / cm |
| `contracted-ideal-criterion` | missing | 1 / finite |
| `flat-descent-criterion` | missing | 1 / flat |
| `monomial-conjecture` | missing | 1 / cm, bigcm |
| `improved-new-intersection` | missing | 1 / cm, homology |
| `syzygy-conjecture` | missing | 1 / cm, homology |
| `homological-reformulations` | missing | 1 / finite |
| `invertible-degree-retraction` | missing | 1 / purity |
| `finite-flat-split` | missing | 1 / flat |
| `dimension-two-case` | missing | 1 / finite |
| `heitmann-dimension-three` | missing | 1 / finite |
| `non-regular-counterexample` | missing | 1 / finite |
| `frobenius-direct-summand-char-p` | missing | 1 / bigcm |
| `uniform-banach-algebra` | missing | 6 / banach |
| `weierstrass-localisation` | missing | 6 / banach |
| `weierstrass-nonzerodivisor` | missing | 6 / banach |
| `unit-ball-adic-topology` | missing | 6 / banach |
| `weierstrass-unit-ball` | missing | 6 / banach |
| `weierstrass-integral-completion` | missing | 6 / completion, banach, finite |
| `weierstrass-invariance` | missing | 6 / banach |
| `completely-integrally-closed` | missing | 4 / finite |
| `kummer-integral-closure-properties` | missing | 4 / perfectoid, finite |
| `spectral-norm-unit-ball` | missing | 4 / banach |
| `kummer-isometric-transitions` | missing | 4 / perfectoid, banach |
| `topologically-nilpotent-idempotent-prime` | missing | 4 / banach |
| `kummer-normality` | missing | 4 / perfectoid, finite |
| `kummer-integrality` | missing | 4 / perfectoid, finite |
| `kummer-norm-multiplicativity` | missing | 4 / perfectoid |
| `several-ramified-elements` | missing | 4 / perfectoid |
| `ramified-regular-base` | missing | 4 / perfectoid |
| `mod-p-power-reduction` | missing | 4 / finite |
| `fp-tensor-arbitrary-product` | missing | 1 / product |
| `pure-product` | missing | 1 / purity, product |
| `artin-rees` | library | mathlib:Ideal.exists_pow_inf_eq_pow_smul |
| `krull-intersection` | library | mathlib:Ideal.mem_iInf_smul_pow_eq_bot_iff, mathlib:Ideal.iInf_pow_eq_bot_of_isLocalRing |
| `nakayama` | library | mathlib:Submodule.eq_bot_of_le_smul_of_le_jacobson_bot |
| `faithfully-flat-proper-ideal` | library | mathlib:Module.FaithfullyFlat.iff_flat_and_proper_ideal |
| `lying-over` | library | mathlib:Ideal.exists_ideal_over_prime_of_isIntegral |
| `integral-closure-finite` | library | mathlib:IsIntegralClosure.finite |
| `mod-p-power-injective` | missing | 1 / completion |
| `reduction-to-domain` | missing | 1 / finite |
| `galois-closure-reduction` | missing | 1 / finite |
| `discriminant-element` | missing | 1 / finite |
| `partial-modification` | missing | 1 / bigcm |
| `modification-sequence` | missing | 1 / bigcm |
| `no-bad-sequence-criterion` | missing | 1 / homology, bigcm |
| `hochster-key-lemma` | missing | 1 / finite |
| `almost-cm-no-bad-sequence` | missing | 1 / cm, perfectoid, bigcm |
| `completion-balances` | missing | 1 / completion |
| `big-cm-reductions` | missing | 1 / cm, bigcm |
| `cohen-parameter-presentation` | missing | 7 / cm, completion |
| `complete-local-normalization` | missing | 5 / finite |
| `product-flat-noetherian` | missing | 1 / flat, product |
| `coefficient-ring-compatibility` | missing | 7 / completion |
| `perfect-residue-base-change` | missing | 7 / completion |
| `purity-perfect-residue` | missing | 1 / purity, completion |
| `no-unramified-square` | missing | 1 / perfectoid |
| `discriminant-pullback-obstruction` | missing | 1 / finite |
| `weak-functoriality-regular-target` | missing | 1 / homology, bigcm |
| `hh-cm-descent` | missing | 1 / cm |
| `cm-completion` | missing | 5 / cm, completion |
| `coordinate-tower-perfectoid` | missing | 3 / perfectoid |
| `kummer-perfectoid` | missing | 4 / perfectoid |
| `scholze-approximation` | planned | PerfectoidSpaces:P2 |
| `tube-sharp-approximation` | missing | 4 / perfectoid |
| `root-localisation-colimit` | missing | 4 / perfectoid, flat, inverse |
| `noetherian-stage-model` | missing | 4 / finite |
| `flatness-by-fibres` | missing | 1 / flat |
| `affinoid-rational-flat` | planned | tauceti:TauCetiRoadmap/AdicSpaces#layer-4-sheafiness-and-tate-acyclicity |
| `generic-fibre-flat` | missing | 4 / flat |
| `special-fibre-free` | missing | 4 / flat |
| `noetherian-stage-faithfully-flat` | missing | 4 / flat |
| `colimit-base-flatness` | missing | 1 / flat, inverse |
| `tube-almost-faithfully-flat` | missing | 4 / perfectoid, flat |
| `flat-colimit-coherent` | missing | 1 / flat, inverse |
| `fp-ideal-descent` | missing | 1 / finite |
| `flat-annihilator` | missing | 1 / flat, homology |
| `tor-filtered-colimit` | missing | 1 / flat, homology, inverse |
| `abhyankar-faithfulness` | missing | 4 / perfectoid |
| `full-algebra-modification` | missing | 1 / bigcm |
| `perfect-closure-trace-retraction` | missing | 1 / purity, homology, finite |
| `noncomplete-dvr-counterexample` | missing | 1 / finite |

## Validation and limits

`python3 scripts/check_paper.py research/blueprint/papers/PAPER-ANDRE-18-B.result.json` passes. The review JSON schema is checked separately by the structural verifier; `check_paper.py` validates extraction packets, not review packets. The swarm intake validation for issue #2189 passes for exactly the four authorized deliverables. A separate structural check verifies 191 unique ids, 159 missing items routed once, seven accepted route decisions, all dependency targets and DAG acyclicity, API/tests for definitions and constructions, and 25 independent source-issue dispositions (20 confirmed, five rejected). The submitted input guards are refreshed before publishing to detect concurrent edits.

No Lean file was requested, generated or compiled. This accepts the corrected source extraction and ownership decisions. It does not certify that every prerequisite paper has been fully decomposed or that an implementation blueprint is closed. Historical reading statements are attributed; the independent scope above is what this reviewer personally checked.
