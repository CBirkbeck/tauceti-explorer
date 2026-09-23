# KMPS errata: independent-review checkpoint

Paper: Kisin–Madapusi Pera–Shin, *Honda–Tate theory for Shimura varieties*, Duke Mathematical Journal 171 (2022), 1559–1614, [DOI](https://doi.org/10.1215/00127094-2021-0063).

Original errata: Claude Code, `cc-fb70e5`, 22 September 2026, job ERRATA-PAPER-KISIN-MADAPUSIPERA-SHIN-22. Independent checkpoint: Codex, `codex-a71f92`, 23 September 2026, issue #1798, job REV-ERRATA-PAPER-KISIN-MADAPUSIPERA-SHIN-22.

## Status and version boundary

**Partial, not a completed independent review.** All seven original findings were checked against the exact named author PDF, including page images. Their local mathematical defects are supported, with the refinements below. A further direct-sum/similitude defect is recorded as E13. No finding receives a final `review` verdict in this checkpoint, and no completion report is written under `reviews/`.

The published text has not been obtained or collated. Therefore this work does not assert that these defects survive in the journal version or remain uncorrected there. The provisional `known: new` fields mean only that no external correction was found in the bounded searches recorded; they do not certify the journal text.

Sources independently used:

- [Shin's author PDF](https://math.berkeley.edu/~swshin/HT.pdf): 41 pages, created 27 January 2021; SHA-256 `fd22990bc3eff8a726375cf8f0c9015828c39f1c32b0717347a9ef23ce9b52db`. This exactly matches the errata's named version.
- [Kisin's earlier PDF](https://people.math.harvard.edu/~kisin/dvifiles/newton2.pdf): 34 pages, created 18 August 2018; SHA-256 `f3f2b164540a1c8524a947b413bd9facdd261441ff4665dc5d4ef0dc699f2f70`. Its corresponding passages retain E1–E3 and E7. It is not the published text.
- [Shin's errata](https://math.berkeley.edu/~swshin/errata.pdf): both pages read; they concern three other papers. SHA-256 `0c84c8d54cbfd222e6810677f4e765eac9b27c6070ac4df5572b64780ab782be`.
- [Crossref record](https://api.crossref.org/works/10.1215/00127094-2021-0063), the three authors' publication pages, and bounded title/DOI/correction/arXiv searches: no later correction located. The publisher article/PDF and Crossref download links returned challenge HTML rather than article text. No access control was bypassed.

The full source-read coverage is §§1.1.2–1.1.4; Proposition 1.1.13 through Corollary 1.1.17; Proposition 1.2.5 and its proof; Corollary 2.1.9 and its setup; §§2.2.6–2.2.13 including the accommodating reduction, Lemma 2.2.8, Lemma 2.2.11 and its torus application; and A.2–A.3 with the surrounding appendix setup. Page images checked: 6, 11, 14, 26, 27, 28, 29, 37.

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

## E13 — another missing common multiplier

In §2.2.7, p.27, the identity component of G′×_{G^ad}G is asserted to act by similitudes on (V⊕V′,ψ⊕ψ′). Passing to the adjoint fibre product does not equate central multipliers.

Take G′=G=GSp₂ with the same standard Siegel embedding. This is an allowed accommodating type-C example. The curve a↦(a·1,1) lies in the identity component of the fibre product over PGL₂. At a=2 the two multipliers are 4 and 1, so the asserted embedding fails. This is another error affecting the proof, separate from E5.

Impose equality of the two multiplier characters and then take the identity component. The paired Hodge homomorphism has equal multipliers, so it factors through this subgroup. The subsequent lifting, centralizer and quotient assertions still require a full audit with this corrected group; this checkpoint does not silently declare them proved.

The new finding uses **E13**, not E8: E8–E12 already refer to different findings in the newer extraction.

## Remaining review work

The errata predates completion of the extraction. The current extraction has twelve findings: its E1–E7 correspond to the original errata, while E8–E12 concern ordinary classes for inner forms, a Tannakian identification, a rational-point intersection, swapped tensor exponents, and a later inverse-Hodge convention. The old report's blanket treatment of the first two as merely open questions is therefore stale.

This checkpoint does not copy or endorse those five findings without checking their source arguments. Reconcile all five with the errata, preserving their identifiers. In particular, distinguish whether the rational-point intersection is merely an alternative expression for the same group. Obtain the journal text, compare all relevant passages, and finish the external Noot comparison before issuing the completed review.

No claim is made here that the paper's main theorems are false, that all downstream proofs have been repaired, or that anything has been formalized.
