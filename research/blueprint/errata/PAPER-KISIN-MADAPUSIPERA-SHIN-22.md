# KMPS errata: independent-review checkpoint

Paper: Kisin–Madapusi Pera–Shin, *Honda–Tate theory for Shimura varieties*, Duke Mathematical Journal 171 (2022), 1559–1614, [DOI](https://doi.org/10.1215/00127094-2021-0063).

Original errata: Claude Code, `cc-fb70e5`, 22 September 2026, job ERRATA-PAPER-KISIN-MADAPUSIPERA-SHIN-22. Independent checkpoint: Codex, `codex-a71f92`, 23 September 2026, issue #1798, job REV-ERRATA-PAPER-KISIN-MADAPUSIPERA-SHIN-22.

Independent continuation: Codex, `codex-7e92bd`, 23 September 2026. The first checkpoint's E1–E7 arguments and source history are preserved below; this continuation independently reconciles the extraction's E8–E12 and checks related literature for E13.

## Status and version boundary

**Partial, not a completed independent review.** All seven original findings were checked against the exact named author PDF, including page images. Their local mathematical defects are supported, with the refinements below. A further direct-sum/similitude defect is recorded as E13. No finding receives a final `review` verdict in this checkpoint, and no completion report is written under `reviews/`.

The continuation adds E8, E9, E11 and E12 to the JSON, making twelve recorded findings. E10 is a rejected extraction candidate, documented below and deliberately excluded from the errata JSON; its identifier remains reserved. E9 is strengthened from a gap to a failed proof step by an example within the Hodge-type setup. These are author-version conclusions, pending journal collation.

The published text has not been obtained or collated. Therefore this work does not assert that these defects survive in the journal version or remain uncorrected there. The provisional `known: new` fields mean only that no external correction was found in the bounded searches recorded; they do not certify the journal text.

Sources independently used:

- [Shin's author PDF](https://math.berkeley.edu/~swshin/HT.pdf): 41 pages, created 27 January 2021; SHA-256 `fd22990bc3eff8a726375cf8f0c9015828c39f1c32b0717347a9ef23ce9b52db`. This exactly matches the errata's named version.
- [Kisin's earlier PDF](https://people.math.harvard.edu/~kisin/dvifiles/newton2.pdf): 34 pages, created 18 August 2018; SHA-256 `f3f2b164540a1c8524a947b413bd9facdd261441ff4665dc5d4ef0dc699f2f70`. Its corresponding passages retain E1–E3 and E7. It is not the published text.
- [Shin's errata](https://math.berkeley.edu/~swshin/errata.pdf): both pages read; they concern three other papers. SHA-256 `0c84c8d54cbfd222e6810677f4e765eac9b27c6070ac4df5572b64780ab782be`.
- [Crossref record](https://api.crossref.org/works/10.1215/00127094-2021-0063), the three authors' publication pages, and bounded title/DOI/correction/arXiv searches: no later correction located. The publisher article/PDF and Crossref download links returned challenge HTML rather than article text. No access control was bypassed.

The first checkpoint's source-read coverage is §§1.1.2–1.1.4; Proposition 1.1.13 through Corollary 1.1.17; Proposition 1.2.5 and its proof; Corollary 2.1.9 and its setup; §§2.2.6–2.2.13 including the accommodating reduction, Lemma 2.2.8, Lemma 2.2.11 and its torus application; and A.2–A.3 with the surrounding appendix setup. Its page images checked: 6, 11, 14, 26, 27, 28, 29, 37.

The continuation reacquired the same 41-page author PDF and Shin errata PDF, with exactly the hashes above. It read the Hodge-type setup on p.15, §§1.3.8–1.3.18 on pp.18–20, §§2.1.1–2.1.5 on pp.21–22, the auxiliary constructions on pp.27–28, and Lemma 2.3.10/Proposition 2.3.11 on pp.33–34, with images 19–21, 27 and 34 checked. It also read [Kisin–Zhou, arXiv:2103.09945v2](https://arxiv.org/pdf/2103.09945v2), p.10 Definition 2.2.4/Remark 2.2.5, p.40 §4.3.7 and pp.43–45 §§4.4.5–4.4.10. This 63-page PDF has SHA-256 `62d26eb931f271404c333c4b9a929e85239222788834cf16dcec1dff230c34c8`.

Crossref, the author pages, the title/DOI correction searches and the publisher routes were checked again. [OpenAlex's DOI record](https://api.openalex.org/works/https://doi.org/10.1215/00127094-2021-0063) supplies no open-access full-text location. The published PDF and Noot §2.3 remain unavailable through the public routes located. Related results in Kisin–Zhou are not being labelled a KMPS erratum.

## E1 — decency equation

The printed product has r+1 copies of b, but the r-th power of bσ has r. For G=G_m and b=p, the left side has valuation r+1 **for every c**, since v(c)=v(σ^r(c)); the right side has valuation r. This handles the existential choice of c, which the original numerical example left implicit.

The endpoint must be σ^{r−1}(b), as in the paper's own (1.1.4.1), p.7. Misprint; intended mathematics unchanged. This checkpoint does not claim an independent reading of Kottwitz's original reference.

## E2 — relative versus absolute Weyl group

For G=GL₃, M=GL₁×GL₂, μ=(0,1,0), and b_M=diag(p,1,1), Newton and dominant Hodge points in G both equal (1,0,0), with κ_G=1. But κ_M(b_M)=(1,0) and κ_M(μ)=(0,1).

The normalizer of this Levi preserves the distinct-dimensional summands, hence N_G(M)=M. The relative Weyl group cannot repair the discrepancy; swapping coordinates 1 and 2 in the absolute Weyl group can. Proposition 1.1.13 supplies that absolute-Weyl conjugate on the quasi-split inner form, and the corollary's comparison of Kottwitz/Newton invariants transports it back. Use a geometric maximal torus and compatible conjugacies; do not add an unwarranted rationality requirement on μ or the Weyl representative.

This is an error affecting the corollary as stated. Corollary 1.1.17's proof on p.13 uses the absolute-Weyl statement, referring to the quasi-split Proposition 1.1.13 as a lemma. In the general case that step should use the corrected Corollary 1.1.15. This is a check of the identified downstream step, not every later theorem.

## E3 — missing inverse

The hypothesis of Proposition 1.2.5 and the proof use the inverse Hodge cocharacter. Its conclusion must have b_bas(μ_x^{-1}), not b_bas(μ_x). The construction starts with μ_p^{-1}, transfers to μ_T^{-1}, and ends by realizing μ_T as μ_x. The intended inverse convention is consistent throughout that proof. Misprint; intended mathematics unchanged.

## E4 — circular accommodating definition

The final definition in §2.2.6 refers to accommodating factors, without a base case or a decreasing condition. Taking the one-factor identity diagram shows that this does not define the desired restriction. The immediately preceding paragraph defines the strictly accommodating basic factors; inserting “strictly” makes the intended finite-product construction meaningful.

This supports the local misprint. The original report additionally claimed agreement with Noot §2.3. The independent checkpoint reached [Noot's author page](https://irma.math.unistra.fr/~noot/publications/jlms.html), but its journal link did not provide the full text and the discovered publisher PDF returned HTTP 403. That external comparison remains unchecked and is no longer presented as an independent verification.

## E5 — auxiliary group and descent in Lemma 2.2.8

For G=GSp₂ and a CM maximal torus T, the element (1,2·1) of G×T scales the two blocks of ψ⊕ψ by 1 and 4. Thus the claimed symplectic-similitude embedding does not exist. This is reclassified from a gap to an **error affecting the proof**, in the protocol's sense of a step that fails.

The descent obstruction can be stated without pretending that the failed construction has produced a valid Shimura point: on G×T, the composite to T and then G^ab is nontrivial on the kernel 1×T of the projection to G. A surjection alone never implies the desired factorization.

The proposed repair G′=G×_{G^ab}T addresses both issues:

1. The similitude character factors through G^ab, so the two blocks have equal multipliers.
2. The abelianized Hodge homomorphism is constant on X, so X×{h_T} factors through G′.
3. The projection G′→G is a central torus extension with kernel 1×(T∩G^der). After constructing the lifted point, Corollary 2.1.9 identifies the local I-groups with Frobenius centralizers. Their projection is surjective: over an algebraic closure, a central-torus extension is a product with its connected center up to central isogeny, and centralizing a semisimple element is unchanged on the derived factor.
4. The kernel maps trivially to G^ab over Q_ℓ. Faithfully flat base change gives the same assertion over Q, so the Q-group map descends.

This verifies the local construction/descent repair. It does not certify the entire preceding reduction in Proposition 2.2.2: E13 records a separate defect there.

## E6 — reducedness, separatedness, and reach

Choose k=Q and W={1}. The automorphism ε↦2ε on Spec Q[ε]/(ε²) fixes the unique dense rational point but is not the identity. On the reduced line with doubled origin over Q, exchanging the origins fixes the dense set Q× but again is not the identity. Specifying an infinite field is necessary for this second dense-rational-point example.

For reduced separated S, one of the finitely many Γ_w is dense by irreducibility. Its equalizer with σ is closed by separatedness; the defining ideal lies in every prime, hence is zero because S is reduced. This proves the corrected lemma.

The lemma itself is false without the extra hypotheses, so the errata's `affects` changes from `nothing` to `a stated result`. The later extraction already made this reach correction. Its application on p.30 is to a smooth affine torus and is unaffected.

## E7 — open complement and log structure

Since D⊂S, D−S is empty. The open set must be S−D. The divisorial log structure is O_S∩j_*O_U^×→O_S.

The original rationale that a sheaf of rings cannot be a log structure was too imprecise: it has an underlying multiplicative monoid. The actual obstruction is that j_*O_U contains functions with poles along D. For S=Spec W[x] and D=(x), it contains x^{-1}; a monoid map to O_S agreeing with the identity on U would force x to be a unit. Restricting to regular functions invertible on U gives the intended structure. Misprint; intended mathematics unchanged.

## E8 — ordinary classes need not exist for inner forms

The unqualified existence assertion in §1.3.15, p.20, fails locally. Let D be the quaternion division algebra over Q_p, put G=D×, and split it over L with Frobenius σ_D=Int(J)σ, where J=[[0,p],[1,0]] and J²=p·1. The map b↦bJ identifies the twisted σ-conjugacy classes with ordinary GL₂ classes. It raises κ by 1 and each Newton slope by 1/2: the adjoint Frobenius actions coincide, while determinant valuations differ by 1.

For the minuscule cocharacter μ_m=(m+1,m), an ordinary class would give GL₂ slopes (m+3/2,m+1/2). Two distinct slopes in dimension two have rank-one summands and hence must be integral. Thus this class does not exist. More precisely, admissibility bounds both GL₂ slopes to [m+1/2,m+3/2] with sum 2m+2. If distinct, both would be integers, but that interval contains only m+1. The basic vector (m+1,m+1) is realized by b=p^mJ, so the unique admissible G-vector is (m+1/2,m+1/2), strictly below μ_m. The choice m=−1 gives the inverse-Hodge representative (0,−1).

Kisin–Zhou's Definition 2.2.4 defines the ordinary class conditionally, and Remark 2.2.5 expressly distinguishes a greatest admissible class from one attaining the Hodge average. Quasi-splitness suffices for the latter. This supports an **error affecting a stated result**, with a precise local scope. The quaternion calculation is not a constructed counterexample satisfying every global integral-model hypothesis of the following density corollaries. Such a downstream audit remains open.

## E9 — the full generated category has a smaller group

In Corollary 1.3.13, p.19, preservation of the chosen Hodge tensors gives an inclusion H⊂G_s0 for the actual Tannakian group H; it does not give equality. There is an example inside the paper's Hodge-type setting, beyond the extraction's abstract unit-object example.

Take E:y²=x³−x with CM by Q(i), the torus Shimura datum T=Res_{Q(i)/Q}G_m, and p=5. The discriminant is a 5-adic unit. The numbers of affine points over x=0,1,2,3,4 are 1,1,2,2,1, respectively. Including infinity gives #E(F₅)=8, trace −2, and ordinary slopes 0 and 1. On a geometric component of this zero-dimensional Shimura variety, D is the sum of the unit isocrystal and the rank-one slope-one isocrystal (or their duals, depending on convention).

The full Tannakian category generated by D, after scalar extension to L, is Rep_L G_m: its objects are sums of integral powers of that rank-one object, with the slope-zero summand already the tensor unit. But the selected CM Hodge tensors have stabilizer T_L≅G_m². The dimension discrepancy disproves the printed equivalence. Accordingly E9 changes from **gap** to **error affecting the proof**.

Evaluation must be followed by forgetting Frobenius to obtain a Vec_L-valued fibre functor; F-Isoc(s0) is Q_p-linear, as §1.3.11 itself says. Restriction from G_s0 to H can still give an exact faithful functor, so the final tensor-functor assertion is not refuted. Its construction and descent require all the needed invariant morphisms and idempotents, not merely a declaration that the two groups agree. This checkpoint does not complete that repair.

## E10 — rejected extraction candidate: rational-point intersection

The extraction called I_s0(Q_p) a misprint in the intersection defining I_s0(Z_(p)) on p.21, because the proof on p.22 writes I_s0(Q). Both expressions define the same subgroup.

Set A=Aut_Q(A_s0), an algebraic group over Q, and I=I_s0, explicitly a closed Q-subgroup of A. Inside A(Q_p), one has

`I(Q_p) ∩ A(Q) = I(Q)`.

Indeed, if a rational point of A lies in I after extension to Q_p, every rational defining equation of I vanishes on it in Q_p and therefore in Q. Equivalently, factorization through a closed subscheme descends along the faithfully flat extension Q→Q_p. Since Aut(A_s0), interpreted up to prime-to-p isogeny, is a subgroup of A(Q), intersecting either side with it proves the equality in question.

The p.22 notation is more explicit but supplies no counterexample to p.21. **Reject the proposed misprint on mathematical grounds.** E10 was never in the original errata JSON and is not added to it. This section preserves its identifier and rationale for the eventual completed review; the extraction is outside this job's editable files.

## E11 — tensor exponents interchanged

The p.19 proof defines V_m,n=V^⊗n⊗V*^⊗m but assigns it D^⊗m⊗D*^⊗n. The case (m,n)=(0,1) would send V to D*, although the functor is required to send V to D. Swap the exponents in the image. This is a **misprint affecting nothing**, independent of E9's categorical defect.

## E12 — retain inverse Hodge cocharacters consistently

Lemma 1.3.9, p.18, places δ in B(G,{μ_X^{-1}}), and Lemma 2.3.10, p.33, explicitly uses μ_x^{-1} in the Frobenius κ formula. In Proposition 2.3.11, p.34, choose a crystalline cocharacter λ_T∈{μ_X^{-1}} with Nλ_T=ν_δ. Use λ_T^{-1} for the complex Hodge cocharacter and the special pair (T,h_x), while retaining λ_T in the Newton and κ calculations.

Both Frobenius elements then have κ=m log_p(q)·λ_T^♯ after taking sufficiently divisible m; the preceding lemma compares them up to a further power. Merely reversing the first conjugacy class and leaving the subsequent Hodge identification unchanged would not suffice. With this consistent convention, the intended argument is clear: **misprint affecting nothing**.

## E13 — another missing common multiplier

In §2.2.7, p.27, the identity component of G′×_{G^ad}G is asserted to act by similitudes on (V⊕V′,ψ⊕ψ′). Passing to the adjoint fibre product does not equate central multipliers.

Take G′=G=GSp₂ with the same standard Siegel embedding. This is an allowed accommodating type-C example. The curve a↦(a·1,1) lies in the identity component of the fibre product over PGL₂. At a=2 the two multipliers are 4 and 1, so the asserted embedding fails. This is another error affecting the proof, separate from E5.

Impose equality of the two multiplier characters and then take the identity component. The paired Hodge homomorphism has equal multipliers, so it factors through this subgroup. The subsequent lifting, centralizer and quotient assertions still require a full audit with this corrected group; this checkpoint does not silently declare them proved.

The new finding uses **E13**, not E8: E8–E12 already refer to different findings in the newer extraction.

The continuation found the proposed common-multiplier construction explicitly in Kisin–Zhou §4.3.7, p.40: (G₂×_{G^ad,G_m}G)^0 with the direct-sum representation and paired Hodge homomorphism. Its Proposition 4.4.10, p.45, includes the product projections among the tensors, constructs central-kernel endomorphisms by specialization, and checks exactness of the I-group sequences after extension to Q_ℓ using Frobenius centralizers. These passages clarify the needed next checks. They have additional group and integral-model assumptions, so citing them does not finish the KMPS reduction in its original generality.

## Remaining review work

The extraction's E8–E12 have now been independently reconciled in the author version: retain E8, E9, E11 and E12 with the refinements above; reject E10. Obtain the journal text and compare every relevant passage, finish the external Noot §2.3 comparison, and audit E13's repaired lifting, centralizers and quotients before issuing the completed review. E9's full functor repair and E8's downstream global scope are explicitly not established here.

No claim is made here that the paper's main theorems are false, that all downstream proofs have been repaired, or that anything has been formalized.
