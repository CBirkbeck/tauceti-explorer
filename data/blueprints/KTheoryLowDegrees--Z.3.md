# Grothendieck groups, Cartan maps, and Euler forms, Part II: explicit ring and curve K₀ and stable-matrix K₁

*Roadmap `KTheoryLowDegrees`, part Z.3: stages Z.3–Z.6. The companion part `KTheoryLowDegrees--U.1` has Z.1, Z.2 and U.1–U.6.*

This is a complete target-inventory pass with explicit open boundaries below; complete describes the planning pass, not mathematical closure. Its machine form is the packet `research/blueprint/packets/KTheoryLowDegrees--Z.3.json`, from which it is generated, so that the two agree. The suggested Lean file `research/blueprint/suggested/KTheoryLowDegrees--Z.3.lean` is a naming proposal, not an implementation; implementationStatus is `unchecked` for every node. Pins: Mathlib `082e2d3`, Tau Ceti `f790474`.

*Independent round-3 review accepted on 7 October 2026 by Codex codex-aqyVCP: 260 nodes (240 verified, 20 corrected), 375 pinned declarations confirmed, 30 source findings confirmed. See [the review](../reviews/REV-KTheoryLowDegrees--Z.3~3.md). Three supplier gaps and 31 native omission contracts remain open; all implementations are unchecked and the full Lean file did not elaborate.*

## Purpose and scope

This part develops the tensor, exterior-power, λ, determinant and arithmetic calculus of degree-zero algebraic K-theory, and its geometric and comparison counterparts on curves. It extends the existing GrothendieckEulerForms roadmap and uses its actual categorical carriers: it neither rebuilds categorical Grothendieck groups nor treats a library audit as a proof of a theorem's full hypotheses. Its first prerequisite is GrothendieckEulerForms. Existing comodule categories are imported from the pinned ReductiveGroups library; this part adds their exact K₀ comparison and its use in ring K₀.

- **Z.3.**
  - The K₀ ring of a commutative ring comes from the tensor product, with rank a ring homomorphism into H⁰(Spec R, ℤ).
  - Exterior powers of finite projectives, with the canonical filtration of an extension.
  - The pre-λ structure on virtual classes by the total operation λ_t, and the abstract λ-ring algebra: pre-λ and special λ-rings, the universal polynomials, the identity principle, Adams operations, augmented λ-rings and the γ-filtration.
  - The special λ-structure of K₀ by Serre's representation-ring route.
  - The componentwise determinant K₀ → Pic, a group homomorphism, never a ring map, and rank ⊕ det as a ring homomorphism onto H⁰ ⊕ Pic.
  - F¹_γ is the augmentation ideal, F²_γ = SK₀ and F¹/F² ≅ Pic.
- **Z.4.**
  - Steinitz, with the zero module separate, and I ⊕ J ≅ A ⊕ IJ.
  - (rank, det) : K₀(A) ≅ ℤ ⊕ Pic(A) for a Dedekind domain, with its inverse, its independence from ideal representatives, its multiplication law, and the comparison with ClassGroup.equivPic.
  - O_F and O_{F,S}, with the actual localisation and its class-group quotient.
  - Base change, extension of number fields, and the norm transfer det_R(Res Q) = N(det_S Q)·det_R(S)^{rank Q}.
  - The nonprincipal ideal (2, 1 + √−5) of ℤ[√−5].
- **Z.5.**
  - K₀ of vector bundles with the genuine exact structure, and the determinant bundle.
  - K₀(X) ≅ ℤ ⊕ Pic(X) for a connected regular noetherian curve, with no properness or base field assumed.
  - The structure-sheaf, skyscraper and divisor class formulas through the K/G comparison, and Cl ≅ Pic. The origin-dependent elliptic expression is exported to EllipticKTheory E.2.
- **Z.6.**
  - Agreement with π₀K, localisation of classes, Euler classes of perfect complexes, and the one Cartan map.
  - Tests: fields, ℤ, F × F, the ℤ[√−5] class, an elliptic curve, a pointless conic, and P¹_F with the change of basis (r, d) ↦ (r + d, −d) against the projective-bundle basis (1, [O(−1)]).

## Boundaries

The accepted restructuring RS-18 governs scope and ownership:
- Early ring tensor, λ, determinant and γ theory is Z.3's. SchemeKTheoryOperations S.6 and S.7 consume its normalisation and never supply a backward prerequisite for it.
- The general regular-curve rank–determinant theorem is Z.5's. The origin-dependent elliptic specialisation belongs to EllipticKTheory E.2 and is imported only by Z.6.
- General projective bundles belong to SchemeKTheoryOperations S.5. Z.6 owns the explicit P¹ change of basis.

**Suppliers.**
- **KTheoryLowDegrees--U.1.** Z.1 (ring K₀ as SplitK0 of the finite projectives, scalar extension) and Z.2 (the rank as a locally constant function, K₀ of fields and products, the non-free ideal of ℤ[√−5]). They are cited by node id, replacing the checkpoint's stage request.
- **SchemeKTheoryOperations.** S.1 (the resolution property), S.2 (K and G of schemes, the Cartan equivalence, π₀) and S.5 (the projective-bundle theorem for P¹), for Z.5 and Z.6 only.
- **EllipticKTheory.** E.2, for the elliptic test of Z.6 only.
- **The Tau Ceti roadmaps.** GrothendieckEulerForms (layers 3 and 4: the Euler class and the Cartan map), JacobianChallenge layer A (line bundles and divisors), AlgebraicCurves layer 12 (the divisor dictionary) and ClassicalGroups layer 4 (characters and Schur polynomials), all as requests.
- **The libraries.**
  - Tau Ceti: SplitK0 and ExactK0 of finiteProjectiveModules, the S-integer class groups and relative norms, invertible sheaves, line-bundle classes, Weil divisors, repRing and Euler classes.
  - Mathlib: exterior powers, CommRing.Pic, ClassGroup, Dedekind domains, Set.integer, schemes and sheaves of modules.

**The abstract λ-ring algebra.** It moves here from SchemeKTheoryOperations S.6, which lies downstream and cannot supply it. The restructure entry lists which S.6 node each new Z.3 node replaces, and S.6 is to cite these in its continuation.

**Consumers.**
- ArithmeticKTheory N.1–N.3, ClassicalArithmeticCompletion CA.7 and SchemeKTheoryOperations S.3: Z.4/rank-pic-equivalence.
- SchemeKTheoryOperations S.2, S.6 and S.7, and KTheoryLowDegrees U.5: the Z.3 ring, λ, γ and determinant nodes.
- EllipticKTheory E.2 and E.5: Z.5's curve theorem and Z.6's P¹ comparison.

## Conventions

- **Carriers.** For a commutative unital ring R, including the zero ring, the module carrier is the existing full subcategory TauCeti.finiteProjectiveModules, whose exact structure is already proved to be the split one. Ring K₀ is its SplitK0, the Z.1 node KTheoryLowDegrees:Z.1/ring-k0. Addition is induced by direct sum and multiplication by tensor product; the unit is [R]. In the suggested file FP, K0 and cls abbreviate these pinned objects and their class map.
- **Rank.** Rank is Z.2's homomorphism K₀(R) → H⁰(Spec R, ℤ) = LocallyConstant(Spec R, ℤ). A disconnected spectrum has no single integer rank.
- **Picard group.** Pic is Mathlib's CommRing.Pic, written multiplicatively, with actual invertible-module representatives. The determinant is a group homomorphism from additive K₀ to Pic (through Additive), never a ring map. rank ⊕ det is a ring map onto H⁰ ⊕ Pic only with the multiplication (m, L)(n, M) = (mn, Lⁿ M^m).
- **Determinant and virtual classes.** For an actual finite projective P of constant rank r ≥ 0, det([P]) = Pic.mk(ΛʳP), while λʳ[P] = [ΛʳP] is a K₀ class. For a virtual class x = [P] − [Q], det(x) = det(P)det(Q)⁻¹; its top λ coefficient at rank(x) does not compute its determinant. If L is a nontrivial invertible module, x = [L] − [R] has rank zero and det(x) = Pic.mk(L) ≠ 1, whereas λ⁰(x) = 1.
- **Exterior powers.** These are the existing alternating quotient, in every characteristic. Dividing antisymmetrisation by n! would restrict the coefficient rings.
- **λ-rings.** λ-rings are special λ-rings over pre-λ-rings. The Adams operations are given by the Newton formula; the γ-operations by γⁿ(x) = λⁿ(x + (n − 1)); and the γ-filtration is the ideal generated by weighted γ-products. For n ≥ 1 it equals Soulé's additive-subgroup form.
- **Weak line elements.** The native degree-one-series predicate says λⁿ(ℓ) = 0 for n ≥ 2 and includes zero. Weibel’s line elements additionally belong to a positive structure and have augmentation one, hence are units. No equivalence of the two predicates is asserted.
- **S-integers.** S is a finite set of finite places, and O_{F,S} is Mathlib's Set.integer.
- **P¹.** The rank/degree coordinates (r, d) correspond to (r + d, −d) in the basis (1, [O(−1)]). A rational skyscraper is 1 − [O(−1)].
- **K-book locators.** The chapter PDFs of September 2012 have chapter-local pages. The combined draft of 29 August 2013 has PDF page = book page + 8.

## Sources

The exterior/Picard-power arguments additionally use the online Stacks texts read on 26 September 2026: [0FIC](https://stacks.math.columbia.edu/tag/0FIC), [00AK](https://stacks.math.columbia.edu/tag/00AK), [00AM](https://stacks.math.columbia.edu/tag/00AM), and [01CR](https://stacks.math.columbia.edu/tag/01CR). Their separate version records and hashes are in the packet. Locally constant exponents are the explicit construction given here, built on the ordinary integer powers, not a quotation of a Stacks theorem.

Statements below follow the sources or give explicitly identified extensions and proof expansions; locators name the supporting passages and their pages. Excerpts are quoted literally, from the LaTeX source or the PDF text.

- **The K-book, Chapter I: Projective Modules and Vector Bundles**, Charles A. Weibel. Author-hosted September 2012 chapter PDF; page numbers are chapter-local. Compared with the author-hosted 29 August 2013 combined draft where indicated. [Kbook.I](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.I.pdf).
- **The K-book, Chapter II: The Grothendieck group K₀**, Charles A. Weibel. Author-hosted September 2012 chapter PDF; page numbers are chapter-local. Compared with the author-hosted 29 August 2013 combined draft where indicated. [Kbook.II](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.II.pdf).
- **Advanced Topics in Computational Number Theory**, Henri Cohen. Author manuscript Advanced Computational Algebraic Number Theory, version 11 July 2001, hosted by the University of Toronto; corresponding to GTM 193. PDF page 15 starts printed page 1. [Cohen](https://www.math.utoronto.ca/~ila/Cohen%20--%20Advanced%20topics%20in%20computational%20number%20theory.pdf).
- **The K-book: an introduction to algebraic K-theory**, Charles A. Weibel. Author-hosted combined draft dated 29 August 2013; not asserted identical to the printed edition. [Kbook-published](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf).
- **Algebraic K-theory of rings of integers, in Handbook of K-theory**, Charles A. Weibel. Handbook I.5, §5.2, printed pp.143–144; PDF pp.157–158. [Handbook](https://www.maths.ed.ac.uk/~v1ranick/papers/handktheory.pdf).
- **Errata et Addenda to the First Printing of Advanced Topics in Computational Number Theory**, Henri Cohen. DVI headed 20000615 Version, three pages. [Cohen-errata](https://www.math.u-bordeaux.fr/~hecohen/errataadv1.dvi).
- **Groupes de Grothendieck des schémas en groupes réductifs déployés**, Jean-Pierre Serre. Publications mathématiques de l'IHÉS 34 (1968), 37–52 (NUMDAM scan; the text layer is OCR, excerpts containing formulae were checked against the page images) [Serre.1968](https://www.numdam.org/item/PMIHES_1968__34__37_0.pdf).
- **Opérations en K-théorie algébrique**, Christophe Soulé. Canadian Journal of Mathematics 37 (1985), no. 3, 488–550 (published version, from the journal's open archive; text layer of the scan) [Soule.1985](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/S0008414X00008427).
- **Algebraic Number Theory**, J. S. Milne. Course notes, version 3.08, 19 July 2020 (166 pages); PDF page = printed page + 2. [Milne.ANT.2020](https://www.jmilne.org/math/CourseNotes/ANT.pdf).
- **The K-book: an introduction to algebraic K-theory**, Charles A. Weibel. Author-hosted combined draft of 29 August 2013 (Kbook.pdf), the same file as this packet's source Kbook-published; PDF page = book page + 8; the published AMS GSM 145 numbering differs. [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf).
- **The Stacks project**, The Stacks project authors. Chapter PDFs, version ed88ff78 compiled 14 July 2026, downloaded 25 September 2026; results cited by tag (hashes of each chapter file in sourceVersions). [Stacks](https://stacks.math.columbia.edu).
- **The resolution property for schemes and stacks**, Burt Totaro. arXiv:math/0207210v1 (23 July 2002), 23 pages; published J. reine angew. Math. 577 (2004); the published version was not compared. [Totaro.2004](https://arxiv.org/pdf/math/0207210).
- **The Stacks project, tag 0FIC**, The Stacks project authors. Online text accessed 26 September 2026 [Stacks.0FIC.20260926](https://stacks.math.columbia.edu/tag/0FIC).
- **The Stacks project, tag 00AK**, The Stacks project authors. Online text accessed 26 September 2026 [Stacks.00AK.20260926](https://stacks.math.columbia.edu/tag/00AK).
- **The Stacks project, tag 00AM**, The Stacks project authors. Online text accessed 26 September 2026 [Stacks.00AM.20260926](https://stacks.math.columbia.edu/tag/00AM).
- **The Stacks project, tag 01CR**, The Stacks project authors. Online text accessed 26 September 2026 [Stacks.01CR.20260926](https://stacks.math.columbia.edu/tag/01CR).
- **Projectivity of the Witt vector affine Grassmannian**, Bhargav Bhatt and Peter Scholze. arXiv:1507.06490v3 (21 February 2017), 61 pages; publication Inventiones mathematicae 209 (2017), 329–423. Publisher PDF attempt returned subscription landing page; no full published/preprint collation asserted. [BS17.v3](https://arxiv.org/pdf/1507.06490v3).

The acquired source versions, with their SHA-256 when available and the scope of each read:

- author copy: https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.I.pdf, read 2026-09-25, SHA-256 `f9662904b3f3477a05025175f1f8fd2d063156d6599f6b806137cbb2cc61fd76`.
- author copy: https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.II.pdf, read 2026-09-25, SHA-256 `529ea8a5853e9fa55279e7ad79047155409b10847bd924b56f708f0950ebc607`.
- author copy: https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf, read 2026-09-25, SHA-256 `a04f53c9393b20672fab2a6818279b2f9996dbc7cf74735789ed13804b058845`.
- author copy: https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.errata.pdf, read 2026-09-25, SHA-256 `ef7ed6d08a5f99d0f0a0b08aff0284bc6670ee76def317804706d89474a0ca5e`.
- published: http://www.numdam.org/item/10.1007/BF02684589.pdf, read 2026-09-25, SHA-256 `09bb5044332281b29d02116a0582e41d17651b929584e76e442d8135d39e60e2`.
- published: https://www.cambridge.org/core/services/aop-cambridge-core/content/view/S0008414X00008427, read 2026-09-25, SHA-256 `50af5bf3a9763946f00e7133405b7fbd1acc6618503b73eeff94936280e2f6dc`.
- author copy: https://web.archive.org/web/2024/https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.errata.pdf, read 2026-09-25, SHA-256 `ef7ed6d08a5f99d0f0a0b08aff0284bc6670ee76def317804706d89474a0ca5e`.
- preprint: https://www.math.utoronto.ca/~ila/Cohen%20--%20Advanced%20topics%20in%20computational%20number%20theory.pdf, read 2026-09-25, SHA-256 `0b01c8f1755378c216c563c7d75e05edbf1c3a95843524f4ede6f0216a1cb159`.
- author copy: https://www.jmilne.org/math/CourseNotes/ANT.pdf, read 2026-09-25, SHA-256 `24b83c789a89f25aebffb3cbe4ae5ca29edd0075acc072de093d140770630847`.
- preprint: https://arxiv.org/pdf/math/0207210, read 2026-09-25, SHA-256 `e549d6a3b8f9772b91227e4126d9278da154abf076bb0c6da71917ae42f7224a`.
- published: https://stacks.math.columbia.edu/download/perfect.pdf, read 2026-09-25, SHA-256 `f79e0ebb628734948a51efd20b75d75c8e5341e4ab493e54f7fc710ebf72fb02`.
- published: https://stacks.math.columbia.edu/download/more-algebra.pdf, read 2026-09-25, SHA-256 `ab69179738e642603ddbde651f2838e1cb5d8711e8bcd7c447cbf02a8bb6a5d2`.
- published: https://stacks.math.columbia.edu/download/modules.pdf, read 2026-09-25, SHA-256 `7effc55750a81b6969a94ca3432fb71c366b3d91acdd4016ea4149dd28b475e6`.
- published: https://stacks.math.columbia.edu/download/divisors.pdf, read 2026-09-25, SHA-256 `0527740ac9877baff00aaad784e66aae83ff541dad40d4939028059f9f28a493`.
- published: https://stacks.math.columbia.edu/download/varieties.pdf, read 2026-09-25, SHA-256 `ed339c312c86721e3f830876da14cabe89a96e83e454a78b7cd355555f4bca45`.
- published: https://stacks.math.columbia.edu/download/chow.pdf, read 2026-09-25, SHA-256 `28aaf3c7a76d359c3be56f1c86167ab42fcb40bc35b1ae6ef3b47cb41f9a41f5`.
- published: https://stacks.math.columbia.edu/download/properties.pdf, read 2026-09-25, SHA-256 `2f5b9ba41e07dd3a888da40496e07afae6caedd550597d96313ab16db4380316`.
- published: https://stacks.math.columbia.edu/download/morphisms.pdf, read 2026-09-25, SHA-256 `0bebe1d93baa7e4e99cb4f36fe50c7bcb6094772b8a2f760885a492892eca75f`.
- published: https://stacks.math.columbia.edu/download/schemes.pdf, read 2026-09-25, SHA-256 `fa2b63e8fd245fcd24998767887cd5f993188eabcfb849f21be19519d58fb803`.
- published: https://stacks.math.columbia.edu/tag/0FIC, read 2026-09-26, SHA-256 `20e3fbbf8bee98aa94380bae99d2d1538179746c157b0a314a891cd340920c0a`.
- published: https://stacks.math.columbia.edu/tag/00AK, read 2026-09-26, SHA-256 `347ecf70bb9879c764862d6c23fe8bb1cf0cee1f06134c8773d7840649c3867c`.
- published: https://stacks.math.columbia.edu/tag/00AM, read 2026-09-26, SHA-256 `bbf406529b0eb22ea75e9025dce3fc85c062174cf91a76d636cde1afac6dd76b`.
- published: https://stacks.math.columbia.edu/tag/01CR, read 2026-09-26, SHA-256 `406066717992b9748b50331e56fdf0573122a5cd23ffbd6f88608ce06c1f3e4e`.
- published: https://www.numdam.org/item/PMIHES_1968__34__37_0.pdf, read 2026-09-26, SHA-256 `09bb5044332281b29d02116a0582e41d17651b929584e76e442d8135d39e60e2`.
- preprint: https://arxiv.org/pdf/1507.06490v3, read 2026-10-04, SHA-256 `b4d5a4e0a6591971c6b8521d790e5db6e61112f1350a0e4a05a8d98b6e0b961e`.
- author copy: https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf, read 2026-10-04, SHA-256 `a04f53c9393b20672fab2a6818279b2f9996dbc7cf74735789ed13804b058845`. 29 August 2013 author draft, fresh PDF pp.155,180,395 for the red-team counterexample; version of record not collated.
- published: https://www.cambridge.org/core/services/aop-cambridge-core/content/view/S0008414X00008427, read 2026-10-05, SHA-256 `f2b559ea3150c7d72a3e662835212e90e1ad0fc2b2b56083cb63d8e670cf5bdd`. Current journal scan: physical pp.1–6 read. Served file has a timestamped download footer; no byte or full-content collation with the older recorded hash asserted.
- author copy: https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf, read 2026-10-05, SHA-256 `a04f53c9393b20672fab2a6818279b2f9996dbc7cf74735789ed13804b058845`. 29 August 2013 author draft; review source findings E23/E25/E26 concern this public copy only. Published edition not acquired.
- author copy: https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.II.pdf, read 2026-10-05, SHA-256 `529ea8a5853e9fa55279e7ad79047155409b10847bd924b56f708f0950ebc607`. Codex codex-u29mo2 round-2 revision: physical PDF pages 5, 8, 11, 26, 27, 28, 29, 30, 31, 32, 33, 35, 36 reread to check the review corrections. Scoped reading; no fresh full-source or published/preprint collation claimed.
- preprint: https://www.math.utoronto.ca/~ila/Cohen%20--%20Advanced%20topics%20in%20computational%20number%20theory.pdf, read 2026-10-05, SHA-256 `0b01c8f1755378c216c563c7d75e05edbf1c3a95843524f4ede6f0216a1cb159`. Codex codex-u29mo2 round-2 revision: physical PDF pages 23, 24, 29, 30, 94, 95 reread to check the review corrections. Scoped reading; no fresh full-source or published/preprint collation claimed.
- published: https://www.numdam.org/item/PMIHES_1968__34__37_0.pdf, read 2026-10-05, SHA-256 `09bb5044332281b29d02116a0582e41d17651b929584e76e442d8135d39e60e2`. Codex codex-u29mo2 round-2 revision: physical PDF pages 9, 10, 15, 16, 17 reread to check the review corrections. Scoped reading; no fresh full-source or published/preprint collation claimed.
- published: https://www.cambridge.org/core/services/aop-cambridge-core/content/view/S0008414X00008427, read 2026-10-05, SHA-256 `f0de85367ce35443ba6ab371d9b93f52d590bb047b7a4a020ae97b0274adc2eb`. Codex codex-u29mo2 round-2 revision: physical PDF pages 1, 2, 3, 4, 5, 6 reread to check the review corrections. Scoped reading; no fresh full-source or published/preprint collation claimed. The served Cambridge scan differs from both historical recorded downloads; those receipts are retained, and no historical byte/content collation is asserted.
- author copy: https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf, read 2026-10-05, SHA-256 `a04f53c9393b20672fab2a6818279b2f9996dbc7cf74735789ed13804b058845`. Codex codex-u29mo2 round-2 revision: physical PDF pages 54, 55, 58, 64, 65, 66, 70, 134, 154, 395 reread to check the review corrections. Scoped reading; no fresh full-source or published/preprint collation claimed.
- preprint: https://arxiv.org/pdf/1507.06490v3, read 2026-10-05, SHA-256 `b4d5a4e0a6591971c6b8521d790e5db6e61112f1350a0e4a05a8d98b6e0b961e`. Codex codex-u29mo2 round-2 revision: physical PDF pages 19, 56, 57, 58, 59 reread to check the review corrections. Scoped reading; no fresh full-source or published/preprint collation claimed.
- author copy: https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.I.pdf, read 2026-10-06, SHA-256 `f9662904b3f3477a05025175f1f8fd2d063156d6599f6b806137cbb2cc61fd76`. Independent REV-KTheoryLowDegrees--Z.3~2: source passages cited by this packet and their surrounding hypotheses read in the downloaded public version; this records that version, not an assertion that a separately published edition was collated.
- author copy: https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.II.pdf, read 2026-10-06, SHA-256 `529ea8a5853e9fa55279e7ad79047155409b10847bd924b56f708f0950ebc607`. Independent REV-KTheoryLowDegrees--Z.3~2: source passages cited by this packet and their surrounding hypotheses read in the downloaded public version; this records that version, not an assertion that a separately published edition was collated.
- preprint: https://www.math.utoronto.ca/~ila/Cohen%20--%20Advanced%20topics%20in%20computational%20number%20theory.pdf, read 2026-10-06, SHA-256 `0b01c8f1755378c216c563c7d75e05edbf1c3a95843524f4ede6f0216a1cb159`. Independent REV-KTheoryLowDegrees--Z.3~2: source passages cited by this packet and their surrounding hypotheses read in the downloaded public version; this records that version, not an assertion that a separately published edition was collated.
- author copy: https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf, read 2026-10-06, SHA-256 `a04f53c9393b20672fab2a6818279b2f9996dbc7cf74735789ed13804b058845`. Independent REV-KTheoryLowDegrees--Z.3~2: source passages cited by this packet and their surrounding hypotheses read in the downloaded public version; this records that version, not an assertion that a separately published edition was collated.
- author copy: https://www.math.u-bordeaux.fr/~hecohen/errataadv1.dvi, read 2026-10-06, SHA-256 `210e6dcbb0bbfc1c673c26fd73e6c1e45ab39b78202196813c06a1e624f3c350`. Independent REV-KTheoryLowDegrees--Z.3~2: all three pages of the public 15 June 2000 errata DVI decoded and read.
- published: https://www.numdam.org/item/PMIHES_1968__34__37_0.pdf, read 2026-10-06, SHA-256 `09bb5044332281b29d02116a0582e41d17651b929584e76e442d8135d39e60e2`. Independent REV-KTheoryLowDegrees--Z.3~2: source passages cited by this packet and their surrounding hypotheses read in the downloaded public version; this records that version, not an assertion that a separately published edition was collated.
- published: https://www.cambridge.org/core/services/aop-cambridge-core/content/view/S0008414X00008427, read 2026-10-06, SHA-256 `f0de85367ce35443ba6ab371d9b93f52d590bb047b7a4a020ae97b0274adc2eb`. Independent REV-KTheoryLowDegrees--Z.3~2: source passages cited by this packet and their surrounding hypotheses read in the downloaded public version; this records that version, not an assertion that a separately published edition was collated.
- author copy: https://www.jmilne.org/math/CourseNotes/ANT.pdf, read 2026-10-06, SHA-256 `24b83c789a89f25aebffb3cbe4ae5ca29edd0075acc072de093d140770630847`. Independent REV-KTheoryLowDegrees--Z.3~2: source passages cited by this packet and their surrounding hypotheses read in the downloaded public version; this records that version, not an assertion that a separately published edition was collated.
- preprint: https://arxiv.org/pdf/math/0207210, read 2026-10-06, SHA-256 `e549d6a3b8f9772b91227e4126d9278da154abf076bb0c6da71917ae42f7224a`. Independent REV-KTheoryLowDegrees--Z.3~2: source passages cited by this packet and their surrounding hypotheses read in the downloaded public version; this records that version, not an assertion that a separately published edition was collated.
- published: https://stacks.math.columbia.edu/tag/0FIC, read 2026-10-06, SHA-256 `20e3fbbf8bee98aa94380bae99d2d1538179746c157b0a314a891cd340920c0a`. Independent REV-KTheoryLowDegrees--Z.3~2: source passages cited by this packet and their surrounding hypotheses read in the downloaded public version; this records that version, not an assertion that a separately published edition was collated.
- published: https://stacks.math.columbia.edu/tag/00AK, read 2026-10-06, SHA-256 `347ecf70bb9879c764862d6c23fe8bb1cf0cee1f06134c8773d7840649c3867c`. Independent REV-KTheoryLowDegrees--Z.3~2: source passages cited by this packet and their surrounding hypotheses read in the downloaded public version; this records that version, not an assertion that a separately published edition was collated.
- published: https://stacks.math.columbia.edu/tag/00AM, read 2026-10-06, SHA-256 `bbf406529b0eb22ea75e9025dce3fc85c062174cf91a76d636cde1afac6dd76b`. Independent REV-KTheoryLowDegrees--Z.3~2: source passages cited by this packet and their surrounding hypotheses read in the downloaded public version; this records that version, not an assertion that a separately published edition was collated.
- published: https://stacks.math.columbia.edu/tag/01CR, read 2026-10-06, SHA-256 `406066717992b9748b50331e56fdf0573122a5cd23ffbd6f88608ce06c1f3e4e`. Independent REV-KTheoryLowDegrees--Z.3~2: source passages cited by this packet and their surrounding hypotheses read in the downloaded public version; this records that version, not an assertion that a separately published edition was collated.
- preprint: https://arxiv.org/pdf/1507.06490v3, read 2026-10-06, SHA-256 `b4d5a4e0a6591971c6b8521d790e5db6e61112f1350a0e4a05a8d98b6e0b961e`. Independent REV-KTheoryLowDegrees--Z.3~2: source passages cited by this packet and their surrounding hypotheses read in the downloaded public version; this records that version, not an assertion that a separately published edition was collated.
- published: https://stacks.math.columbia.edu/download/modules.pdf, read 2026-10-06, SHA-256 `7effc55750a81b6969a94ca3432fb71c366b3d91acdd4016ea4149dd28b475e6`. Independent REV-KTheoryLowDegrees--Z.3~2: source passages cited by this packet and their surrounding hypotheses read in the downloaded public version; this records that version, not an assertion that a separately published edition was collated.
- published: https://stacks.math.columbia.edu/download/divisors.pdf, read 2026-10-06, SHA-256 `0527740ac9877baff00aaad784e66aae83ff541dad40d4939028059f9f28a493`. Independent REV-KTheoryLowDegrees--Z.3~2: source passages cited by this packet and their surrounding hypotheses read in the downloaded public version; this records that version, not an assertion that a separately published edition was collated.
- published: https://stacks.math.columbia.edu/download/varieties.pdf, read 2026-10-06, SHA-256 `ed339c312c86721e3f830876da14cabe89a96e83e454a78b7cd355555f4bca45`. Independent REV-KTheoryLowDegrees--Z.3~2: source passages cited by this packet and their surrounding hypotheses read in the downloaded public version; this records that version, not an assertion that a separately published edition was collated.
- published: https://stacks.math.columbia.edu/download/chow.pdf, read 2026-10-06, SHA-256 `28aaf3c7a76d359c3be56f1c86167ab42fcb40bc35b1ae6ef3b47cb41f9a41f5`. Independent REV-KTheoryLowDegrees--Z.3~2: source passages cited by this packet and their surrounding hypotheses read in the downloaded public version; this records that version, not an assertion that a separately published edition was collated.
- published: https://stacks.math.columbia.edu/download/properties.pdf, read 2026-10-06, SHA-256 `2f5b9ba41e07dd3a888da40496e07afae6caedd550597d96313ab16db4380316`. Independent REV-KTheoryLowDegrees--Z.3~2: source passages cited by this packet and their surrounding hypotheses read in the downloaded public version; this records that version, not an assertion that a separately published edition was collated.
- published: https://stacks.math.columbia.edu/download/morphisms.pdf, read 2026-10-06, SHA-256 `0bebe1d93baa7e4e99cb4f36fe50c7bcb6094772b8a2f760885a492892eca75f`. Independent REV-KTheoryLowDegrees--Z.3~2: source passages cited by this packet and their surrounding hypotheses read in the downloaded public version; this records that version, not an assertion that a separately published edition was collated.
- published: https://stacks.math.columbia.edu/download/schemes.pdf, read 2026-10-06, SHA-256 `fa2b63e8fd245fcd24998767887cd5f993188eabcfb849f21be19519d58fb803`. Independent REV-KTheoryLowDegrees--Z.3~2: source passages cited by this packet and their surrounding hypotheses read in the downloaded public version; this records that version, not an assertion that a separately published edition was collated.
- published: https://stacks.math.columbia.edu/download/perfect.pdf, read 2026-10-06, SHA-256 `f79e0ebb628734948a51efd20b75d75c8e5341e4ab493e54f7fc710ebf72fb02`. Independent REV-KTheoryLowDegrees--Z.3~2: source passages cited by this packet and their surrounding hypotheses read in the downloaded public version; this records that version, not an assertion that a separately published edition was collated.
- published: https://stacks.math.columbia.edu/download/more-algebra.pdf, read 2026-10-06, SHA-256 `ab69179738e642603ddbde651f2838e1cb5d8711e8bcd7c447cbf02a8bb6a5d2`. Independent REV-KTheoryLowDegrees--Z.3~2: source passages cited by this packet and their surrounding hypotheses read in the downloaded public version; this records that version, not an assertion that a separately published edition was collated.
- author copy: https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.errata.pdf, read 2026-10-06. Independent REV-KTheoryLowDegrees--Z.3~2: direct PDF download unavailable. Search-indexed opening page read, including corrections at p.80 and p.101. No new PDF hash or full errata collation claimed.
- author copy: https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.I.pdf, read 2026-10-07, SHA-256 `f9662904b3f3477a05025175f1f8fd2d063156d6599f6b806137cbb2cc61fd76`. Codex codex-xKpLDv round-3 revision: September 2012 chapter, physical PDF pp. 11, 24, 43 and local context read to check the eleven corrections. Scoped reading; no fresh full-source or published/preprint collation claimed.
- author copy: https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.II.pdf, read 2026-10-07, SHA-256 `529ea8a5853e9fa55279e7ad79047155409b10847bd924b56f708f0950ebc607`. Codex codex-xKpLDv round-3 revision: September 2012 chapter, physical PDF pp. 27–28 and local context read to check the eleven corrections. Scoped reading; no fresh full-source or published/preprint collation claimed.
- author copy: https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf, read 2026-10-07, SHA-256 `a04f53c9393b20672fab2a6818279b2f9996dbc7cf74735789ed13804b058845`. Codex codex-xKpLDv round-3 revision: 29 August 2013 author draft, physical PDF pp. 55, 100–101, 154–155, 157, 327, 336 and local context read to check the eleven corrections. Scoped reading; no fresh full-source or published/preprint collation claimed.
- preprint: https://www.math.utoronto.ca/~ila/Cohen%20--%20Advanced%20topics%20in%20computational%20number%20theory.pdf, read 2026-10-07, SHA-256 `0b01c8f1755378c216c563c7d75e05edbf1c3a95843524f4ede6f0216a1cb159`. Codex codex-xKpLDv round-3 revision: 11 July 2001 author manuscript, physical PDF pp. 25, 30, 94–95 and local context read to check the eleven corrections. Scoped reading; no fresh full-source or published/preprint collation claimed.
- published: https://stacks.math.columbia.edu/tag/0FDS, read 2026-10-07, SHA-256 `d90a47cd6a10c5fa09bfeb464e69d864a5d281a2202118f6c7e4d607ace9d313`. Codex codex-xKpLDv round-3 revision: current tag statement and proof read; scoped receipt, no full chapter or historical-version collation claimed.
- published: https://stacks.math.columbia.edu/tag/09N9, read 2026-10-07, SHA-256 `98390ad213ae4a25a616fe6772f1b01557f600e227c9c971d80ec21611a31a64`. Codex codex-xKpLDv round-3 revision: current tag statement and proof read; scoped receipt, no full chapter or historical-version collation claimed.
- published: https://stacks.math.columbia.edu/tag/0F8A, read 2026-10-07, SHA-256 `0ba45d1142c2a8691eb75a2529a497090358ddb85fd190f740f37eab0a600174`. Codex codex-xKpLDv round-3 revision: current tag statement and proof read; scoped receipt, no full chapter or historical-version collation claimed.
- author copy: https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.errata.pdf, read 2026-10-07. Codex codex-xKpLDv round-3 revision: direct PDF download returned 404. Search-indexed opening page read, specifically p.101 Example 4.3 plus signs and p.101 line −8 positive exponential. No fresh PDF hash, full errata reading or published-book collation claimed.

Scoped revision checks on 7 October 2026 reread the author-hosted Weibel chapters, the combined 29 August 2013 draft and Cohen’s 11 July 2001 manuscript at the passages listed in the packet’s appended version receipts. Current Stacks [09N9](https://stacks.math.columbia.edu/tag/09N9), [0F8A](https://stacks.math.columbia.edu/tag/0F8A) and [0FDS](https://stacks.math.columbia.edu/tag/0FDS) were also read. The [author’s K-book errata](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.errata.pdf) opening page was read through the search index; direct download returned 404. No fresh full errata or published-book collation is claimed.

Independent round-3 review receipts (Codex codex-aqyVCP, 7 October 2026). These append to the historical receipts above; each records only the stated reading scope.

- author copy: https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.I.pdf, read 2026-10-07, SHA-256 `f9662904b3f3477a05025175f1f8fd2d063156d6599f6b806137cbb2cc61fd76`. Codex codex-aqyVCP independent round-3 review: September 2012 author-hosted chapter: all cited node passages and local context, including I.3, I.5.3, Exercises3.4–3.8 and 5.4; source findings independently rechecked. No published-book collation.
- author copy: https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.II.pdf, read 2026-10-07, SHA-256 `529ea8a5853e9fa55279e7ad79047155409b10847bd924b56f708f0950ebc607`. Codex codex-aqyVCP independent round-3 review: September 2012 author-hosted chapter: all cited node passages and local context, including II.2, II.4 and II.8; source findings independently rechecked. The standing positive-structure/splitting-principle context of Theorem 4.8 is retained. No published-book collation.
- preprint: https://www.math.utoronto.ca/~ila/Cohen%20--%20Advanced%20topics%20in%20computational%20number%20theory.pdf, read 2026-10-07, SHA-256 `0b01c8f1755378c216c563c7d75e05edbf1c3a95843524f4ede6f0216a1cb159`. Codex codex-aqyVCP independent round-3 review: 11 July 2001 author manuscript: all cited module, pseudo-basis, index and norm passages and local context. Proposition 2.2.13 is printed 82/PDF 96; its fractional-ideal proof requires denominator clearing (E29). No publisher-edition collation.
- author copy: https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf, read 2026-10-07, SHA-256 `a04f53c9393b20672fab2a6818279b2f9996dbc7cf74735789ed13804b058845`. Codex codex-aqyVCP independent round-3 review: 29 August 2013 combined author draft: all cited node passages and local context in I.3/I.5, II.2/II.6–II.9 and V.3; draft-scoped source findings independently rechecked. Not asserted identical to the printed AMS edition.
- published: https://www.maths.ed.ac.uk/~v1ranick/papers/handktheory.pdf, read 2026-10-07, SHA-256 `688664d1309f053fae66a6616138a5ad7e486260ea478b625637c7c60db8e421`. Codex codex-aqyVCP independent round-3 review: Published Handbook, I.5 §5.2 printed 143–144/PDF 157–158 only; class-group/rank target checked. No full Handbook reading.
- author copy: https://www.math.u-bordeaux.fr/~hecohen/errataadv1.dvi, read 2026-10-07, SHA-256 `210e6dcbb0bbfc1c673c26fd73e6c1e45ab39b78202196813c06a1e624f3c350`. Codex codex-aqyVCP independent round-3 review: Author DVI headed 20000615 Version, all three pages decoded and read. No fractional-ideal norm correction corresponding to E29 found; publisher edition not collated.
- published: https://www.numdam.org/item/PMIHES_1968__34__37_0.pdf, read 2026-10-07, SHA-256 `09bb5044332281b29d02116a0582e41d17651b929584e76e442d8135d39e60e2`. Codex codex-aqyVCP independent round-3 review: Published NUMDAM scan, printed 37–52. All cited contexts independently read; the source coalgebra hypotheses, integral comparison and arbitrary-field formal-character theorem are distinguished.
- published: https://www.cambridge.org/core/services/aop-cambridge-core/content/view/S0008414X00008427, read 2026-10-07, SHA-256 `f0de85367ce35443ba6ab371d9b93f52d590bb047b7a4a020ae97b0274adc2eb`. Codex codex-aqyVCP independent round-3 review: Published journal archive, §1.1–1.6 and local context on physical pp. 2–6. Fresh download hash differs from the historical receipt; no claim of byte identity or collation of the rest of the paper.
- preprint: https://arxiv.org/pdf/math/0207210, read 2026-10-07, SHA-256 `e549d6a3b8f9772b91227e4126d9278da154abf076bb0c6da71917ae42f7224a`. Codex codex-aqyVCP independent round-3 review: arXiv:math/0207210v1, §1 p. 2: doubled affine space and affine diagonal. No collation against the published J. reine angew. Math. paper.
- published: https://stacks.math.columbia.edu/tag/0FIC, read 2026-10-07, SHA-256 `20e3fbbf8bee98aa94380bae99d2d1538179746c157b0a314a891cd340920c0a`. Codex codex-aqyVCP independent round-3 review: Current official tag statement, proof and available comments read; for 0FDJ the history was also checked for the three proof misprints. Scoped reading only.
- published: https://stacks.math.columbia.edu/tag/00AK, read 2026-10-07, SHA-256 `347ecf70bb9879c764862d6c23fe8bb1cf0cee1f06134c8773d7840649c3867c`. Codex codex-aqyVCP independent round-3 review: Current official tag statement, proof and available comments read; for 0FDJ the history was also checked for the three proof misprints. Scoped reading only.
- published: https://stacks.math.columbia.edu/tag/00AM, read 2026-10-07, SHA-256 `bbf406529b0eb22ea75e9025dce3fc85c062174cf91a76d636cde1afac6dd76b`. Codex codex-aqyVCP independent round-3 review: Current official tag statement, proof and available comments read; for 0FDJ the history was also checked for the three proof misprints. Scoped reading only.
- published: https://stacks.math.columbia.edu/tag/01CR, read 2026-10-07, SHA-256 `406066717992b9748b50331e56fdf0573122a5cd23ffbd6f88608ce06c1f3e4e`. Codex codex-aqyVCP independent round-3 review: Current official tag statement, proof and available comments read; for 0FDJ the history was also checked for the three proof misprints. Scoped reading only.
- preprint: https://arxiv.org/pdf/1507.06490v3, read 2026-10-07, SHA-256 `b4d5a4e0a6591971c6b8521d790e5db6e61112f1350a0e4a05a8d98b6e0b961e`. Codex codex-aqyVCP independent round-3 review: arXiv:1507.06490v3, all cited contexts: pp. 18–20, 24–25, 54–59. E20–E22 independently checked, retaining the smooth-lifting/continuity gap. No publisher/preprint collation.
- published: https://stacks.math.columbia.edu/download/modules.pdf, read 2026-10-07, SHA-256 `7effc55750a81b6969a94ca3432fb71c366b3d91acdd4016ea4149dd28b475e6`. Codex codex-aqyVCP independent round-3 review: Stacks ed88ff78 compiled 14 July 2026, modules.pdf: cited tags and local proof context checked; no full-chapter reading asserted.
- published: https://stacks.math.columbia.edu/download/divisors.pdf, read 2026-10-07, SHA-256 `0527740ac9877baff00aaad784e66aae83ff541dad40d4939028059f9f28a493`. Codex codex-aqyVCP independent round-3 review: Stacks ed88ff78 compiled 14 July 2026, divisors.pdf: cited tags and local proof context checked; no full-chapter reading asserted.
- published: https://stacks.math.columbia.edu/download/varieties.pdf, read 2026-10-07, SHA-256 `ed339c312c86721e3f830876da14cabe89a96e83e454a78b7cd355555f4bca45`. Codex codex-aqyVCP independent round-3 review: Stacks ed88ff78 compiled 14 July 2026, varieties.pdf: cited tags and local proof context checked; no full-chapter reading asserted.
- published: https://stacks.math.columbia.edu/download/chow.pdf, read 2026-10-07, SHA-256 `28aaf3c7a76d359c3be56f1c86167ab42fcb40bc35b1ae6ef3b47cb41f9a41f5`. Codex codex-aqyVCP independent round-3 review: Stacks ed88ff78 compiled 14 July 2026, chow.pdf: cited tags and local proof context checked; no full-chapter reading asserted.
- published: https://stacks.math.columbia.edu/download/properties.pdf, read 2026-10-07, SHA-256 `2f5b9ba41e07dd3a888da40496e07afae6caedd550597d96313ab16db4380316`. Codex codex-aqyVCP independent round-3 review: Stacks ed88ff78 compiled 14 July 2026, properties.pdf: cited tags and local proof context checked; no full-chapter reading asserted.
- published: https://stacks.math.columbia.edu/download/more-algebra.pdf, read 2026-10-07, SHA-256 `ab69179738e642603ddbde651f2838e1cb5d8711e8bcd7c447cbf02a8bb6a5d2`. Codex codex-aqyVCP independent round-3 review: Stacks ed88ff78 compiled 14 July 2026, more-algebra.pdf: cited tags and local proof context checked; no full-chapter reading asserted.
- author copy: https://www.jmilne.org/math/CourseNotes/ANT.pdf?download=1, read 2026-10-07, SHA-256 `24b83c789a89f25aebffb3cbe4ae5ca29edd0075acc072de093d140770630847`. Codex codex-aqyVCP independent round-3 review: Course notes version3.08, 19 July 2020: all cited class-group/norm/S-unit examples and local context. The ordinary URL returned 406; this successful download used ?download=1.
- published: https://stacks.math.columbia.edu/download/perfect.pdf, read 2026-10-07, SHA-256 `f79e0ebb628734948a51efd20b75d75c8e5341e4ab493e54f7fc710ebf72fb02`. Codex codex-aqyVCP independent round-3 review: Stacks ed88ff78 compiled 14 July 2026, perfect.pdf: cited tags and local proof context checked; no full-chapter reading asserted. Derived Categories of Schemes, 0F8A/0FDI/0FDJ on physical pp. 93, 98–99; E30 rechecked against current HTML.
- published: https://stacks.math.columbia.edu/tag/0FDJ, read 2026-10-07, SHA-256 `be432ae99014e9bfc2df585f7cde2c768d2e33ade4dc5b6b7157ba5622b7c036`. Codex codex-aqyVCP independent round-3 review: Current official tag statement, proof and available comments read; for 0FDJ the history was also checked for the three proof misprints. Scoped reading only.
- published: https://stacks.math.columbia.edu/tag/0F8A, read 2026-10-07, SHA-256 `0ba45d1142c2a8691eb75a2529a497090358ddb85fd190f740f37eab0a600174`. Codex codex-aqyVCP independent round-3 review: Current official tag statement, proof and available comments read; for 0FDJ the history was also checked for the three proof misprints. Scoped reading only.
- published: https://stacks.math.columbia.edu/tag/0FDI, read 2026-10-07, SHA-256 `583ded5c201622ff240d3b6c7f28ec6c1c326bcfa7e7c1ce83db69ab512c34c4`. Codex codex-aqyVCP independent round-3 review: Current official tag statement, proof and available comments read; for 0FDJ the history was also checked for the three proof misprints. Scoped reading only.
- published: https://stacks.math.columbia.edu/tag/0FDJ/history, read 2026-10-07, SHA-256 `8ccde9d6a1020b257065d4e75e2aa523f9f1e8bcae033c103021ab9f8fa9f2e0`. Codex codex-aqyVCP independent round-3 review: Current official tag statement, proof and available comments read; for 0FDJ the history was also checked for the three proof misprints. Scoped reading only.
- author copy: https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.errata.pdf, read 2026-10-07. Codex codex-aqyVCP independent round-3 review: direct download returned 404; the search-indexed opening author-errata page corroborates the algebraically-closed correction and E13/E14 plus normalization with positive exponential. No fresh full PDF hash, full errata reading or published-book collation.

## Signed determinant source interface

Bhatt and Scholze's [Witt Grassmannian paper](https://arxiv.org/pdf/1507.06490v3), read in arXiv v3 §§5 and12 and Lemma6.11, adds the determinant at the groupoid and connective-spectrum level. Its target is a graded line with an integer-valued locally constant rank. The symmetry multiplies an ordinary line swap by the parity sign of the product of the grades. Consequently the component group is Pic × locally constant integers, but that component group loses unit automorphisms and cannot serve as the determinant groupoid. Two odd lines over the rationals have self-braiding minus identity. Forgetting the grade is monoidal and retracts the degree-zero inclusion as spaces; it generally does not preserve symmetry and provides no splitting of spectra.

The ring determinant starts with the maximal subgroupoid of finite projectives under direct sum. Its block-swap sign is what makes this functor symmetric. Group completion, the first connective truncation and Picard 1-types are imported from the homotopy owners, with explicit mapping-space and coherence requests. The local-ring rank/units computation belongs to Z.2 and U.3; no general SK₁ vanishing is asserted. The affine comparison becomes an equivalence only after Zariski sheafification of groupoids.

The geometric refinement imports perfect-complex K and supported Witt K. The latter takes complexes acyclic after p inversion, on qcqs perfect characteristic-p schemes. Its determinant extends the ordinary determinant with a contractible space of compatible natural choices. Finite filtrations give determinant products through their actual cofiber triangles; an equality in a component group does not supply the required isomorphisms or their coherence. Lemma6.11 says the product line for a constant finite-length Witt module is trivializable. Its grade is the length and need not be zero, and a trivializable line is not a canonically chosen basis.

Early graded lines and the ring determinant remain in Z.3. The ten perfect-complex and Witt-support comparison refinements belong to Z.6: actual atlas assembly detected that importing S.2/S.3 directly into Z.3 would create cycles. Generic support K, spectra and v-descent stay with their existing owners. The exact new supplier gap records their stronger missing interfaces. The regular-perfection argument retains extraction E31's smooth-approximation correction; no unjustified lift is inferred merely from affineness.

The verified doubled-origin finding is already correctly reflected in the incoming doubled-line node. The line has K₀(Vect)=G₀=ℤ²; the plane has K₀(Vect)=ℤ and G₀=ℤ². The GeneralAlgebraicKTheory acceptance correction belongs to its owner. The old S.6→Z.5 and S.7→Z.6 links require the recorded assembly correction: blueprint promotion only adds links. The Calegari–Geraghty congruence-subgroup source addition belongs to U.4, outside these four stages.

The sourceVersions distinguish the scoped round-2 readings, the independent reviewer’s full audit and earlier acquisition records. All 260 reviewed declarations, 375 baseline references and 28 source findings are retained. The reader carries the corrected packet’s statements and source limitations. Historical compilation receipts do not establish elaboration of this suggested file.

## Baseline declarations

- **tauceti:TauCeti.finiteProjectiveModules** (TauCeti/Algebra/Category/ModuleCat/CartanMap.lean): Existing object property and essentially small additive full subcategory of finite projective R-modules. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.finiteProjectiveModulesExactStructure_eq_split** (TauCeti/Algebra/Category/ModuleCat/CartanMap.lean): Every conflation in the existing finite-projective exact structure splits. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.ExactK0.fromSplitEquiv** (TauCeti/CategoryTheory/GrothendieckGroup/Exact.lean): Canonical comparison with ExactK0 when every conflation splits; carries each object class to itself. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.SplitK0.instCommRing** (TauCeti/CategoryTheory/GrothendieckGroup/Monoidal.lean): Existing commutative ring on SplitK0 of an essentially small braided monoidal preadditive category with binary biproducts. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.SplitK0.of_mul_of** (TauCeti/CategoryTheory/GrothendieckGroup/Monoidal.lean): Product of object classes is the class of their tensor product. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.SplitK0.liftEquiv** (TauCeti/CategoryTheory/GrothendieckGroup/Split.lean): Universal additive-invariant extension to the existing split Grothendieck group. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.SplitK0.of_congr** (TauCeti/CategoryTheory/GrothendieckGroup/Split.lean): Isomorphic objects have equal classes. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.SplitK0.of_biprod** (TauCeti/CategoryTheory/GrothendieckGroup/Split.lean): Binary biproduct class is the sum of classes. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:CategoryTheory.ObjectProperty.fullMonoidalSubcategory** (Mathlib/CategoryTheory/Monoidal/Subcategory.lean): Restricts an existing monoidal structure to a property containing the unit and closed under tensor. Preadditivity and braiding are inherited. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:Module.Projective.tensorProduct** (Mathlib/Algebra/Module/Projective.lean): Tensor products of projectives are projective, in particular over one commutative ring. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:Module.Projective.iff_split** (Mathlib/Algebra/Module/Projective.lean): Any projective is a retract of a free module. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:Module.Projective.of_split** (Mathlib/Algebra/Module/Projective.lean): Retracts of projective modules are projective. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:exteriorPower.instFinite** (Mathlib/LinearAlgebra/ExteriorPower/Basis.lean): Exterior powers of finite modules are finite. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:exteriorPower.instFree** (Mathlib/LinearAlgebra/ExteriorPower/Basis.lean): Exterior powers of free modules are free. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:exteriorPower.finrank_eq** (Mathlib/LinearAlgebra/ExteriorPower/Basis.lean): Over a nontrivial commutative ring, the n-th exterior power of a finite free rank-r module has rank choose(r,n). Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:exteriorPower.map_id** (Mathlib/LinearAlgebra/ExteriorPower/Basic.lean): Exterior powers preserve identity maps. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:exteriorPower.map_comp** (Mathlib/LinearAlgebra/ExteriorPower/Basic.lean): Exterior powers preserve composites. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:exteriorPower.zeroEquiv** (Mathlib/LinearAlgebra/ExteriorPower/Basic.lean): The zeroth exterior power is the scalar module. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:exteriorPower.oneEquiv** (Mathlib/LinearAlgebra/ExteriorPower/Basic.lean): The first exterior power is the original module. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:CommRing.Pic** (Mathlib/RingTheory/PicardGroup.lean): Existing multiplicatively written group of invertible-module isomorphism classes, with actual module representatives. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:Module.Finite.tensorProduct** (Mathlib/RingTheory/TensorProduct/Finite.lean): Finite generation is preserved by tensor product. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:exteriorPower.alternatingMapLinearEquiv** (Mathlib/LinearAlgebra/ExteriorPower/Basic.lean): Universal property of each exterior power as linearized alternating maps. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:PowerSeries.isUnit_iff_constantCoeff** (Mathlib/RingTheory/PowerSeries/Inverse.lean): A power series over a ring is a unit exactly when its constant coefficient is a unit. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:PowerSeries.coeff_one_mul** (Mathlib/RingTheory/PowerSeries/Basic.lean): First-coefficient Cauchy formula for a product. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:Module.rankAtStalk** (Mathlib/RingTheory/Spectrum/Prime/FreeLocus.lean): Natural-valued rank of a module localized at a prime; this is not yet the virtual rank map. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:CommRing.Pic.mapAlgebra** (Mathlib/RingTheory/PicardGroup.lean): Existing extension-of-scalars homomorphism on invertible-module classes. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:CommRing.Pic.mk_tensor** (Mathlib/RingTheory/PicardGroup.lean): Tensor products of invertible modules represent the product in Pic. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:PowerSeries.coeff_mul** (Mathlib/RingTheory/PowerSeries/Basic.lean): Cauchy product coefficient formula, indexed by the finite antidiagonal. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:Ring.choose** (Mathlib/RingTheory/Binomial.lean): Integral generalized binomial coefficient; used only in the integer target of rank, not as a BinomialRing structure on K₀. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:CommRing.Pic.mk** (Mathlib/RingTheory/PicardGroup.lean): Canonical class of an invertible module, with an actual linear-equivalent representative. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:exteriorPower.topEquiv** (TauCeti/LinearAlgebra/ExteriorPower.lean): A chosen Fin n basis identifies the top exterior power with R. This is the finite-free special case only. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:dualTensorHomEquiv** (Mathlib/LinearAlgebra/Contraction.lean): For finite projective M and every module N, dual(M)⊗N is naturally linearly equivalent to Hom(M,N). Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:bijective_of_isLocalized_maximal** (Mathlib/RingTheory/LocalProperties/Exactness.lean): A linear map is bijective if all its localizations at maximal ideals are bijective. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:Module.subsingleton_of_localization_maximal** (Mathlib/RingTheory/LocalProperties/Submodule.lean): A module is zero if its localizations at all maximal ideals are zero. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:Module.Finite.exists_comp_eq_id_of_projective** (Mathlib/RingTheory/Finiteness/Projective.lean): A finite projective is a retract of an explicitly finite free module; includes embedding, projection and composite identity. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:IsDedekindDomain.flat_iff_torsion_eq_bot** (Mathlib/RingTheory/Flat/TorsionFree.lean): Over a Dedekind domain, torsion-free modules are flat; the file also supplies the instance. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:Module.finitePresentation_of_finite** (Mathlib/Algebra/Module/FinitePresentation.lean): Finite modules over a Noetherian ring are finitely presented. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:Module.Flat.projective_of_finitePresentation** (Mathlib/RingTheory/Flat/EquationalCriterion.lean): Finitely presented flat modules are projective. Together with the preceding two facts this already proves finite torsion-free projectivity over Dedekind domains. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:Ideal.isCoprime_iff_exists** (Mathlib/RingTheory/Ideal/Operations.lean): Coprime ideals admit elements i,j with i+j=1. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:Ideal.mul_eq_inf_of_isCoprime** (Mathlib/RingTheory/Ideal/Operations.lean): Product equals intersection for coprime ideals. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:LinearMap.exists_rightInverse_of_surjective** (Mathlib/Algebra/Module/Projective.lean): A surjective map onto a projective module has a linear right inverse. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:Module.Invertible.exists_linearEquiv_ideal** (Mathlib/RingTheory/PicardGroup.lean): An invertible module is isomorphic to an ideal when the fraction-ring Pic group is trivial, including every domain. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:ClassGroup.equivPic** (Mathlib/RingTheory/PicardGroup.lean): Existing multiplicative equivalence between ClassGroup and Pic for every commutative domain. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:FractionalIdeal.mk0** (Mathlib/RingTheory/ClassGroup/Basic.lean): Nonzero integral ideals in a Dedekind domain give units in its fractional-ideal monoid. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:IsDedekindDomain.exists_add_spanSingleton_mul_eq** (Mathlib/RingTheory/DedekindDomain/Factorization.lean): For nonzero fractional ideals a,b with a≤c, produces α with a+αb=c. Applied with c=R it directly supplies a coprime integral representative. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:FractionalIdeal.mem_singleton_mul** (Mathlib/RingTheory/FractionalIdeal/Operations.lean): Membership in αJ is equivalent to being α times an element of J. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:FractionalIdeal.unitsMulEquivSubmodule** (Mathlib/RingTheory/FractionalIdeal/Operations.lean): Multiplicative equivalence from invertible fractional ideals to invertible submodules of a localization. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:Submodule.tensorEquivMul** (Mathlib/RingTheory/PicardGroup.lean): For two invertible submodules of a faithful algebra, multiplication induces a linear equivalence from their tensor product to their product. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:CommRing.Pic.mk_eq_mk_iff** (Mathlib/RingTheory/PicardGroup.lean): Two invertible modules represent the same Pic class exactly when they are linearly isomorphic. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:CommRing.Pic.mul_eq_tensor** (Mathlib/RingTheory/PicardGroup.lean): Multiplication of existing Pic classes agrees with the tensor product of their actual module representatives. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:AddMonoidAlgebra** (Mathlib/Algebra/MonoidAlgebra/Defs.lean): The monoid algebra R[M] of finite formal combinations with convolution product; ℤ[M] for the monoid λ-ring. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:BinomialRing** (Mathlib/RingTheory/Binomial.lean): Binomial rings: torsion-free rings with Pochhammer quotients, hence Ring.choose. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:CommRing.Pic.mapRingHom** (Mathlib/RingTheory/PicardGroup.lean): The homomorphism Pic R →* Pic S induced by a ring homomorphism R →+* S. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:CommRing.Pic.mapRingHom_comp_mapRingHom** (Mathlib/RingTheory/PicardGroup.lean): Functoriality: (mapRingHom g).comp (mapRingHom f) = mapRingHom (g.comp f). Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:CommRing.Pic.mk_eq_one_iff** (Mathlib/RingTheory/PicardGroup.lean): Pic.mk R M = 1 ↔ Nonempty (M ≃ₗ[R] R). Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:CommRing.Pic.mk_self** (Mathlib/RingTheory/PicardGroup.lean): Pic.mk R R = 1. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:CompleteOrthogonalIdempotents** (Mathlib/RingTheory/Idempotents.lean): Complete families of orthogonal idempotents (pairwise products 0, sum 1). Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:CompleteOrthogonalIdempotents.bijective_pi** (Mathlib/RingTheory/Idempotents.lean): A complete orthogonal family gives R ≃+* ∏ R ⧸ (1 − e_i). Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:ExteriorAlgebra.gradedAlgebra** (Mathlib/LinearAlgebra/ExteriorAlgebra/Grading.lean): The exterior algebra is graded by the exterior powers ⋀[R]^i M, so ⋀^i · ⋀^j ⊆ ⋀^{i+j}. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:ExteriorAlgebra.ιMulti_mul_ιMulti** (Mathlib/LinearAlgebra/ExteriorAlgebra/Basic.lean): ιMulti a * ιMulti b = ιMulti (Fin.append a b): exterior multiplication concatenates wedges. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:Ideal.span** (Mathlib/RingTheory/Ideal/Span.lean): The ideal generated by a subset. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:Ideal.span_mul_span** (Mathlib/RingTheory/Ideal/Operations.lean): span S * span T = span (S * T). Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:Int.instBinomialRing** (Mathlib/RingTheory/Binomial.lean): ℤ is a binomial ring. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:IsLocalizedModule.map** (Mathlib/Algebra/Module/LocalizedModule/Basic.lean): A linear map M → N induces the map of localised modules. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:IsLocallyConstant.range_finite** (Mathlib/Topology/LocallyConstant/Basic.lean): A locally constant function on a compact space has finite range. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:LaurentPolynomial** (Mathlib/Algebra/Polynomial/Laurent.lean): Laurent polynomials R[T;T⁻¹] = AddMonoidAlgebra R ℤ. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:LinearMap.det_comp** (Mathlib/LinearAlgebra/Determinant.lean): det (f ∘ g) = det f · det g. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:Localization.existsUnique_algebraMap_eq_of_span_eq_top** (Mathlib/RingTheory/Localization/Away/Basic.lean): The sheaf condition of the structure sheaf for a cover of Spec R by basic opens D(s), s in a set spanning the unit ideal. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:LocallyConstant** (Mathlib/Topology/LocallyConstant/Basic.lean): Bundled locally constant functions X → Y; H⁰(Spec R, ℤ) = LocallyConstant (PrimeSpectrum R) ℤ. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:LocallyConstant.map** (Mathlib/Topology/LocallyConstant/Basic.lean): Post-composition of a locally constant function with any map. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:Matrix.Pivot.exists_list_transvec_mul_diagonal_mul_list_transvec** (Mathlib/LinearAlgebra/Matrix/Transvection.lean): Over a field every square matrix is a product of transvections, a diagonal matrix and transvections. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:Matrix.det_kronecker** (Mathlib/LinearAlgebra/Matrix/Kronecker.lean): det (A ⊗ₖ B) = det A ^ card n · det B ^ card m. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:Module.Basis.exteriorPower** (Mathlib/LinearAlgebra/ExteriorPower/Basis.lean): The basis of ⋀^n M indexed by n-element subsets, from a basis of M. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:Module.FinitePresentation.exists_free_localizedModule_powers** (Mathlib/RingTheory/Localization/Free.lean): If a finitely presented M becomes free over a nontrivial localisation R_S, then for some r∈S it is free after inverting r, with the same finrank. The pinned declaration requires Nontrivial R_S; prime-local applications satisfy it. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:Module.FinitePresentation.isLocalizedModule_map** (Mathlib/Algebra/Module/FinitePresentation.lean): For finitely presented M, Hom localises: IsLocalizedModule S (IsLocalizedModule.map S f g). Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:Module.Invertible** (Mathlib/RingTheory/PicardGroup.lean): M is invertible if the evaluation Mᵛ ⊗ M → R is bijective; invertible modules are finite projective (instances in the same file). Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:Module.Invertible.linearEquiv** (Mathlib/RingTheory/PicardGroup.lean): The evaluation isomorphism Mᵛ ⊗[R] M ≃ₗ R for invertible M. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:Module.rankAtStalk_eq_of_equiv** (Mathlib/RingTheory/Spectrum/Prime/FreeLocus.lean): Isomorphic modules have equal rankAtStalk. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:Module.rankAtStalk_tensorProduct** (Mathlib/RingTheory/Spectrum/Prime/FreeLocus.lean): For both M and N finite flat over a commutative ring R, rankAtStalk (M⊗[R]N)=rankAtStalk M·rankAtStalk N. The finite/flat hypotheses on M are the section variables at line286; citing projective nodes supply them. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:MvPolynomial.IsSymmetric** (Mathlib/RingTheory/MvPolynomial/Symmetric/Defs.lean): Symmetric multivariate polynomials. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:MvPolynomial.esymm** (Mathlib/RingTheory/MvPolynomial/Symmetric/Defs.lean): The n-th elementary symmetric polynomial. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:MvPolynomial.esymmAlgEquiv** (Mathlib/RingTheory/MvPolynomial/Symmetric/FundamentalTheorem.lean): Fundamental theorem: MvPolynomial (Fin n) R ≃ₐ symmetric polynomials in n variables, X_i ↦ e_i. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:MvPolynomial.esymmAlgHom_fin_injective** (Mathlib/RingTheory/MvPolynomial/Symmetric/FundamentalTheorem.lean): Algebraic independence of e₁,…,e_n in m ≥ n variables. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:MvPolynomial.mul_esymm_eq_sum** (Mathlib/RingTheory/MvPolynomial/Symmetric/NewtonIdentities.lean): Newton's identities: k·e_k = (−1)^{k+1} Σ (−1)^a e_a p_{k−a}. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:MvPolynomial.psum** (Mathlib/RingTheory/MvPolynomial/Symmetric/Defs.lean): The power sums p_n = Σ X_i^n. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:MvPolynomial.psum_eq_mul_esymm_sub_sum** (Mathlib/RingTheory/MvPolynomial/Symmetric/NewtonIdentities.lean): Newton's identities solved for the power sums. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:Polynomial.eval** (Mathlib/Algebra/Polynomial/Eval/Defs.lean): Evaluation of a polynomial; the sum of the coefficients is the value at 1. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:PowerSeries** (Mathlib/RingTheory/PowerSeries/Basic.lean): Formal power series R⟦X⟧. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:PowerSeries.HasSubst** (Mathlib/RingTheory/PowerSeries/Substitution.lean): Substitutability of a series (nilpotent constant coefficient). Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:PowerSeries.HasSubst.of_constantCoeff_zero'** (Mathlib/RingTheory/PowerSeries/Substitution.lean): A power series with zero constant coefficient can be substituted. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:PowerSeries.binomialSeries** (Mathlib/RingTheory/PowerSeries/Binomial.lean): The series (1 + X)^r = Σ Ring.choose r n Xⁿ for r in a binomial ring. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:PowerSeries.binomialSeries_add** (Mathlib/RingTheory/PowerSeries/Binomial.lean): binomialSeries (r + s) = binomialSeries r · binomialSeries s. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:PowerSeries.binomialSeries_coeff** (Mathlib/RingTheory/PowerSeries/Binomial.lean): coeff n (binomialSeries r) = Ring.choose r n • 1. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:PowerSeries.binomialSeries_nat** (Mathlib/RingTheory/PowerSeries/Binomial.lean): binomialSeries (d : R) = (1 + X)^d. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:PowerSeries.coeff** (Mathlib/RingTheory/PowerSeries/Basic.lean): The n-th coefficient of a power series, as a linear map. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:PowerSeries.derivative** (Mathlib/RingTheory/PowerSeries/Derivative.lean): The formal derivative as a derivation of R⟦X⟧. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:PowerSeries.invOneSubPow_val_eq_mk_sub_one_add_choose_of_pos** (Mathlib/RingTheory/PowerSeries/WellKnown.lean): (1 − X)^{−d} = Σ C(d − 1 + n, d − 1) Xⁿ for d > 0. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:PowerSeries.map** (Mathlib/RingTheory/PowerSeries/Basic.lean): The ring homomorphism R⟦X⟧ →+* S⟦X⟧ induced by R →+* S. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:PowerSeries.subst** (Mathlib/RingTheory/PowerSeries/Substitution.lean): Substitution of a power series into a power series. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:PowerSeries.subst_mul** (Mathlib/RingTheory/PowerSeries/Substitution.lean): subst a (f * g) = subst a f * subst a g for substitutable a. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:Ring.add_choose_eq** (Mathlib/RingTheory/Binomial.lean): Chu–Vandermonde: choose (r + s) k = Σ choose r i · choose s j in a binomial ring. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:Ring.choose_natCast** (Mathlib/RingTheory/Binomial.lean): choose (n : R) k = Nat.choose n k. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:Ring.choose_succ_succ** (Mathlib/RingTheory/Binomial.lean): Pascal's rule choose (r + 1) (k + 1) = choose r k + choose r (k + 1). Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:RingHom.ker** (Mathlib/RingTheory/Ideal/Maps.lean): The kernel of a ring homomorphism as an ideal. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:TensorProduct.AlgebraTensorModule.distribBaseChange** (Mathlib/LinearAlgebra/TensorProduct/Tower.lean): A ⊗[R] (N ⊗[R] Q) ≃ₗ[A] (A ⊗[R] N) ⊗[A] (A ⊗[R] Q). Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:TrivSqZeroExt** (Mathlib/Algebra/TrivSqZeroExt/Basic.lean): The trivial square-zero extension R × M with (r₁ + m₁)(r₂ + m₂) = r₁r₂ + r₁m₂ + r₂m₁. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:exteriorPower.map** (Mathlib/LinearAlgebra/ExteriorPower/Basic.lean): The linear map ⋀^n M → ⋀^n N induced by M → N. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:MvPolynomial.IsSymmetric.exists_aeval_esymm** (TauCeti/RingTheory/MvPolynomial/Symmetric/Substitution.lean): Unbundled fundamental theorem: a symmetric polynomial in n variables is a polynomial in e₁,…,e_n. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.AffineGroup.Product.pointsMulEquiv** (TauCeti/Algebra/AlgebraicGroup/Product.lean): Points of Spec(H₁ ⊗ H₂) are pairs of points: the product of affine group schemes. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.Comodule** (TauCeti/Algebra/Coalgebra/Comodule/Basic.lean): Right comodules over a coalgebra (coassociative, counital coaction). Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.Comodule.tensor** (TauCeti/Algebra/Coalgebra/Comodule/TensorProduct.lean): The tensor product comodule structure on M ⊗ N over a commutative bialgebra. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.ExactK0** (TauCeti/CategoryTheory/GrothendieckGroup/Exact.lean): The Grothendieck group of an exact structure on an essentially small additive category. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.ExactK0.lift** (TauCeti/CategoryTheory/GrothendieckGroup/Exact.lean): The homomorphism out of exact K₀ induced by a conflation-additive invariant, with lift_of. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.GeneralLinear.coordinateHopfAlgebra** (TauCeti/Algebra/AlgebraicGroup/GeneralLinear/Coordinate/HopfAlgebra.lean): The coordinate Hopf algebra R[X_ij][det⁻¹] of GL_n over R. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.GeneralLinear.diagonalTorus** (TauCeti/Algebra/AlgebraicGroup/GeneralLinear/DiagonalTorus/Basic.lean): The diagonal torus of GL_N as a morphism from the split torus group scheme. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.GeneralLinear.pointsMulEquiv** (TauCeti/Algebra/AlgebraicGroup/GeneralLinear/FunctorOfPoints.lean): The A-points of the GL_n coordinate Hopf algebra form GL_n(A). Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.GeneralLinear.standardComodule** (TauCeti/Algebra/AlgebraicGroup/GeneralLinear/StandardComodule.lean): The standard comodule structure on Rⁿ over the GL_n coordinate Hopf algebra. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.HopfAlgebra.pointRepresentationEquivComodule** (TauCeti/Algebra/AlgebraicGroup/Representation/Comodule/Basic.lean): Natural point representations on V are equivalent to right H-comodule structures on V. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.SplitK0.hom_ext** (TauCeti/CategoryTheory/GrothendieckGroup/Split.lean): Two homomorphisms out of split K₀ agreeing on object classes are equal. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:exteriorPower.map_top_eq_det_smul** (TauCeti/LinearAlgebra/ExteriorPower.lean): An endomorphism of a free rank-n module acts on ⋀ⁿ by its determinant. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:ClassGroup.mk0** (Mathlib/RingTheory/ClassGroup/Basic.lean): The class of a nonzero integral ideal of a Dedekind domain. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:ClassGroup.mk0_eq_mk0_iff** (Mathlib/RingTheory/ClassGroup/Basic.lean): mk0 I = mk0 J iff (x)I = (y)J for nonzero x, y. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:ClassGroup.mk0_surjective** (Mathlib/RingTheory/ClassGroup/Basic.lean): Every class is the class of a nonzero integral ideal. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:ClassGroup.mulEquivUnitsSubmoduleQuotRange** (Mathlib/RingTheory/ClassGroup/Basic.lean): ClassGroup R ≃* invertible submodules of Frac R modulo principal ones; the first factor of equivPic. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:ClassGroup.mulEquiv** (Mathlib/RingTheory/ClassGroup/Basic.lean): A ring isomorphism R ≃+* R′ induces ClassGroup R ≃* ClassGroup R′. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:FractionalIdeal.coe_mk0** (Mathlib/RingTheory/ClassGroup/Basic.lean): The fractional ideal underlying FractionalIdeal.mk0 K I is I. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:ClassGroup.extendedHom** (Mathlib/RingTheory/ClassGroup/ExtendedHom.lean): Extension of ideal classes along an injective extension of domains. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:ClassGroup.extendedHom_mk0** (Mathlib/RingTheory/ClassGroup/ExtendedHom.lean): extendedHom (mk0 I) = mk0 (I·B) for Dedekind A, B. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:Submodule.unitsQuotEquivRelPic** (Mathlib/RingTheory/PicardGroup.lean): Invertible submodules of a faithful algebra modulo principal ones ≃* relPic; the second factor of equivPic. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:Submodule.unitsToPic** (Mathlib/RingTheory/PicardGroup.lean): An invertible submodule I of a faithful algebra gives Pic.mk R I. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:Submodule.equivMapOfInjective** (Mathlib/Algebra/Module/Submodule/Map.lean): A submodule is linearly equivalent to its image under an injective linear map. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:CommRing.Pic.mk_eq_one_iff_free** (Mathlib/RingTheory/PicardGroup.lean): Pic.mk R M = 1 iff M is free. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:CommRing.Pic.mk_eq_self** (Mathlib/RingTheory/PicardGroup.lean): Pic.mk of the representative of M is M. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:CommRing.Pic.AsModule** (Mathlib/RingTheory/PicardGroup.lean): The representative module of a Picard class. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:CommRing.Pic.mk_dual** (Mathlib/RingTheory/PicardGroup.lean): Pic.mk (Dual R M) = (Pic.mk R M)⁻¹. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:CommRing.Pic.mapRingHom_algebraMap** (Mathlib/RingTheory/PicardGroup.lean): mapRingHom (algebraMap R A) = mapAlgebra R A. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:Ideal.relNorm** (Mathlib/RingTheory/Ideal/Norm/RelNorm.lean): Relative ideal norm Ideal S →*₀ Ideal R for a finite torsion-free extension of Dedekind domains, the span of the element norms. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:Ideal.relNorm_singleton** (Mathlib/RingTheory/Ideal/Norm/RelNorm.lean): relNorm (span {r}) = span {Algebra.intNorm R S r}. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:Ideal.spanNorm_singleton** (Mathlib/RingTheory/Ideal/Norm/RelNorm.lean): spanNorm (span {r}) = span {Algebra.intNorm R S r}. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:Ideal.spanIntNorm_localization** (Mathlib/RingTheory/Ideal/Norm/RelNorm.lean): spanNorm commutes with localisation at M ≤ R⁰: spanNorm Rₘ (I Sₘ) = (spanNorm R I) Rₘ. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:Algebra.intNorm_eq_norm** (Mathlib/RingTheory/IntegralClosure/IntegralRestrict.lean): intNorm = Algebra.norm when B is finite free over A. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:Algebra.norm_apply** (Mathlib/RingTheory/Norm/Defs.lean): Algebra.norm R x = LinearMap.det (lmul R S x). Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:Ideal.eq_of_localization_maximal** (Mathlib/RingTheory/LocalProperties/Basic.lean): Ideals agreeing after localisation at every maximal ideal are equal. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:IsDedekindDomain.isPrincipalIdealRing_localization_over_prime** (Mathlib/RingTheory/DedekindDomain/PID.lean): For a Dedekind domain R, a finite torsion-free domain R-algebra S, a nonzero prime p, and Sₚ localising S at the image of R∖p with the scalar tower and an IsDedekindDomain Sₚ instance, Sₚ is a principal ideal ring. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:IsLocalization.isDedekindDomain** (Mathlib/RingTheory/DedekindDomain/Dvr.lean): For a Dedekind domain A and M≤A⁰, a domain Aₘ with Algebra A Aₘ and IsLocalization M Aₘ is a Dedekind domain; the declaration takes IsDomain Aₘ explicitly. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:Module.free_of_finite_type_torsion_free'** (Mathlib/LinearAlgebra/FreeModule/PID.lean): A finite torsion-free module over a PID is free. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:IsLocalization** (Mathlib/RingTheory/Localization/Defs.lean): The localisation predicate (units, surjectivity, kernel). Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:IsLocalization.algEquiv** (Mathlib/RingTheory/Localization/Basic.lean): Two localisations at M are R-isomorphic. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:Ideal.exists_le_prime_disjoint** (Mathlib/RingTheory/Ideal/Maximal.lean): An ideal disjoint from a submonoid lies in a prime disjoint from it. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:Set.integer** (Mathlib/RingTheory/DedekindDomain/SInteger.lean): The R-subalgebra of S-integers {x : v(x) ≤ 1 for v ∉ S} of K. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:IsDedekindDomain.integer_empty** (Mathlib/RingTheory/DedekindDomain/SInteger.lean): ∅.integer K = ⊥, i.e. R. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:IsDedekindDomain.HeightOneSpectrum** (Mathlib/RingTheory/DedekindDomain/Ideal/Lemmas.lean): Nonzero prime ideals of a Dedekind domain. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:IsDedekindDomain.HeightOneSpectrum.valuation_eq_one_iff_notMem** (Mathlib/RingTheory/DedekindDomain/AdicValuation.lean): v(r) = 1 iff r ∉ v for r ∈ R. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:NumberField.RingOfIntegers** (Mathlib/NumberTheory/NumberField/Basic.lean): The ring of integers 𝓞 K; the anonymous instance at line 317 makes it a Dedekind domain. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:NumberField.RingOfIntegers.instFintypeClassGroup** (Mathlib/NumberTheory/NumberField/ClassNumber.lean): The class group of 𝓞 K is finite. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:NumberField.classNumber** (Mathlib/NumberTheory/NumberField/ClassNumber.lean): The class number, Fintype.card (ClassGroup (𝓞 K)). Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:NumberField.classNumber_eq_one_iff** (Mathlib/NumberTheory/NumberField/ClassNumber.lean): classNumber K = 1 iff 𝓞 K is a PID. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:NumberField.RingOfIntegers.extension_isNoetherian** (Mathlib/NumberTheory/NumberField/Basic.lean): 𝓞 L is a Noetherian 𝓞 K-module for number fields K ⊆ L. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:IsFractionRing.finrank_eq** (Mathlib/LinearAlgebra/Dimension/Localization.lean): finrank K L = finrank A B for fraction fields of an extension of domains. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:IsIntegralClosure.isLocalization** (Mathlib/RingTheory/DedekindDomain/IntegralClosure.lean): For a domain A with fraction field K, an algebraic field extension L/K, and C an integral closure of A in L with the displayed compatible algebra structures and scalar towers, L localises C at the image of A⁰. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:IsIntegralClosure.of_isIntegrallyClosed** (Mathlib/RingTheory/IntegralClosure/IntegrallyClosed.lean): An integrally closed ring integral over S is the integral closure of S in its fraction field. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:Module.finrank_mul_finrank** (Mathlib/LinearAlgebra/Dimension/Free.lean): Tower law for finrank of free modules. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:Module.Flat.lTensor_preserves_injective_linearMap** (Mathlib/RingTheory/Flat/Basic.lean): Tensoring with a flat module preserves injective maps. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:TensorProduct.rid** (Mathlib/LinearAlgebra/TensorProduct/Associator.lean): M ⊗[R] R ≃ₗ[R] M. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:Ideal.map_span** (Mathlib/RingTheory/Ideal/Maps.lean): map f (span s) = span (f '' s). Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:LinearEquiv.ofInjective** (Mathlib/Algebra/Module/Submodule/Equiv.lean): An injective linear map is an equivalence onto its range. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:Zsqrtd** (Mathlib/NumberTheory/Zsqrtd/Basic.lean): The ring ℤ[√d]. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:Zsqrtd.lift** (Mathlib/NumberTheory/Zsqrtd/Basic.lean): Ring maps ℤ√d →+* R correspond to square roots of d in R. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:Zsqrtd.lift_injective** (Mathlib/NumberTheory/Zsqrtd/Basic.lean): lift r is injective if d is not a square and R has characteristic zero. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:Set.mem_integer_iff** (TauCeti/RingTheory/DedekindDomain/SInteger/Basic.lean): Membership in Set.integer is the valuation condition. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:Algebra.denIdeal** (TauCeti/RingTheory/Localization/DenIdeal.lean): The denominator ideal (R : x) of x ∈ K. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:Algebra.denIdeal_ne_bot** (TauCeti/RingTheory/Localization/DenIdeal.lean): The denominator ideal of an element of the fraction field is nonzero. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:Algebra.mem_denIdeal_iff** (TauCeti/RingTheory/Localization/DenIdeal.lean): r ∈ denIdeal x iff r·x is the image of some s ∈ R. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:IsDedekindDomain.denIdeal_not_le** (TauCeti/RingTheory/DedekindDomain/SInteger/Basic.lean): If w(x) ≤ 1 then denIdeal x ⊄ w. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:IsDedekindDomain.integer_extendedHom_surjective** (TauCeti/RingTheory/DedekindDomain/SInteger/ClassGroup.lean): Extension Cl(R) → Cl(S.integer K) is surjective. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:IsDedekindDomain.ker_integer_extendedHom** (TauCeti/RingTheory/DedekindDomain/SInteger/ClassGroup.lean): Its kernel is generated by the classes of the primes in S. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:IsDedekindDomain.integerClassGroupEquiv** (TauCeti/RingTheory/DedekindDomain/SInteger/ClassGroup.lean): Cl(S.integer K) ≃* Cl(R) ⧸ ⟨[v] : v ∈ S⟩ (the file also provides the IsDedekindDomain instance on S.integer K). Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:IsDedekindDomain.integerClassGroupEquiv_extendedHom** (TauCeti/RingTheory/DedekindDomain/SInteger/ClassGroup.lean): integerClassGroupEquiv (extendedHom c) = the class of c in the quotient. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:IsDedekindDomain.finite_integer_classGroup** (TauCeti/RingTheory/DedekindDomain/SInteger/ClassGroup.lean): Cl(S.integer K) is finite when Cl(R) is. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:IsDedekindDomain.HeightOneSpectrum.classGroupMk** (TauCeti/RingTheory/ClassGroup/Basic.lean): The class of a height-one prime. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:ClassGroup.mulEquiv_mk0** (TauCeti/NumberTheory/ClassGroup/Equiv.lean): ClassGroup.mulEquiv f (mk0 I) = mk0 (Ideal.map f I). Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:ClassGroup.relNorm** (TauCeti/RingTheory/ClassGroup/RelNorm.lean): The relative norm ClassGroup S →* ClassGroup R induced by Ideal.relNorm. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:ClassGroup.relNorm_mk0** (TauCeti/RingTheory/ClassGroup/RelNorm.lean): relNorm (mk0 I) = mk0 (Ideal.relNorm0 R I). Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:ClassGroup.relNorm_extendedHom** (TauCeti/RingTheory/ClassGroup/RelNorm.lean): relNorm (extendedHom c) = c ^ finrank R S. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:Ideal.relNorm0** (TauCeti/RingTheory/ClassGroup/RelNorm.lean): Ideal.relNorm restricted to nonzero ideals. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:NumberField.adjoin_gen_eq_top_of_mod_four_ne_one** (TauCeti/NumberTheory/NumberField/Quadratic/RingOfIntegers.lean): For a number field K, θ∈𝓞 K with minpoly ℤ θ=X²−C d, Algebra.adjoin ℚ {(θ:K)}=⊤, Squarefree d and d%4≠1, Algebra.adjoin ℤ {θ}=⊤ in the ring of integers. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.NumberField.exists_minpoly_eq_X_sq_add_five_and_adjoin_eq_top** (TauCeti/NumberTheory/Multiquadratic/MinusFive/Basic.lean): AdjoinRoot (X² + 5) has an integral generator θ with minpoly X² + 5 generating it over ℚ. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.NumberField.irreducible_X_sq_add_five** (TauCeti/NumberTheory/Multiquadratic/MinusFive/Basic.lean): X² + 5 is irreducible over ℚ, so AdjoinRoot (X² + 5) is a field. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.NumberField.classNumber_adjoinRoot_sqrt_neg_five_eq_two** (TauCeti/NumberTheory/Multiquadratic/MinusFive/ClassNumber.lean): The class number of AdjoinRoot (X² + 5) is 2. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:AlgebraicGeometry.IsAffineHom** (Mathlib/AlgebraicGeometry/Morphisms/Affine.lean): Affine morphisms of schemes Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:AlgebraicGeometry.IsAffineOpen** (Mathlib/AlgebraicGeometry/AffineScheme.lean): Affine open subsets of a scheme Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:AlgebraicGeometry.IsIntegral** (Mathlib/AlgebraicGeometry/Properties.lean): Integral schemes Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:AlgebraicGeometry.IsLocallyNoetherian** (Mathlib/AlgebraicGeometry/Noetherian.lean): Locally noetherian schemes Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:AlgebraicGeometry.IsNoetherian** (Mathlib/AlgebraicGeometry/Noetherian.lean): Noetherian schemes Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:AlgebraicGeometry.IsSeparated** (Mathlib/AlgebraicGeometry/Morphisms/Separated.lean): Separated morphisms Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:AlgebraicGeometry.Proj.affineOpenCover** (Mathlib/AlgebraicGeometry/ProjectiveSpectrum/Basic.lean): The standard affine open cover of Proj Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:AlgebraicGeometry.Proj.basicOpenIsoSpec** (Mathlib/AlgebraicGeometry/ProjectiveSpectrum/Basic.lean): The basic open D₊(f) of Proj is the spectrum of the degree-zero localisation Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:AlgebraicGeometry.Scheme.Hom.residueDegree** (Mathlib/AlgebraicGeometry/ResidueField.lean): The residue degree of a morphism at a point Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:AlgebraicGeometry.Scheme.Modules** (Mathlib/AlgebraicGeometry/Modules/Sheaf.lean): The category X.Modules of sheaves of O_X-modules on a scheme Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:AlgebraicGeometry.Scheme.Modules.pullback** (Mathlib/AlgebraicGeometry/Modules/Sheaf.lean): Pullback of O-modules along a morphism of schemes Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:AlgebraicGeometry.Scheme.Modules.pullbackComp** (Mathlib/AlgebraicGeometry/Modules/Sheaf.lean): Pullback along a composite is the composite of pullbacks Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:AlgebraicGeometry.Scheme.Modules.pullbackId** (Mathlib/AlgebraicGeometry/Modules/Sheaf.lean): Pullback along the identity is the identity Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:AlgebraicGeometry.Scheme.Modules.pullbackPushforwardAdjunction** (Mathlib/AlgebraicGeometry/Modules/Sheaf.lean): Pullback is left adjoint to pushforward Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:AlgebraicGeometry.Scheme.Modules.restrictFunctor** (Mathlib/AlgebraicGeometry/Modules/Sheaf.lean): Restriction of O-modules along an open immersion Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:AlgebraicGeometry.Scheme.functionField** (Mathlib/AlgebraicGeometry/FunctionField.lean): The function field of an integral scheme Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:AlgebraicGeometry.Scheme.ord** (Mathlib/AlgebraicGeometry/OrderOfVanishing.lean): The order of vanishing of a rational function at a point Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:AlgebraicGeometry.ringKrullDim_stalk_eq_coheight** (Mathlib/AlgebraicGeometry/Properties.lean): The Krull dimension of the stalk at x is the coheight of x Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:AlgebraicGeometry.tilde.functor** (Mathlib/AlgebraicGeometry/Modules/Tilde.lean): The functor M ↦ M~ from R-modules to O_{Spec R}-modules Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:AlgebraicGeometry.tildeEquiv** (Mathlib/AlgebraicGeometry/Modules/Tilde.lean): tilde is an equivalence from R-modules to quasi-coherent O_{Spec R}-modules Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:CategoryTheory.ObjectProperty.ContainsZero** (Mathlib/CategoryTheory/ObjectProperty/ContainsZero.lean): Object properties containing a zero object Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:CategoryTheory.ObjectProperty.EssentiallySmall** (Mathlib/CategoryTheory/ObjectProperty/Small.lean): An object property is essentially small if a small family of objects represents all isomorphism classes Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:CategoryTheory.ObjectProperty.FullSubcategory** (Mathlib/CategoryTheory/ObjectProperty/FullSubcategory.lean): The full subcategory on an object property Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:CategoryTheory.ObjectProperty.IsClosedUnderBinaryProducts** (Mathlib/CategoryTheory/ObjectProperty/FiniteProducts.lean): Object properties closed under binary products Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:CategoryTheory.ObjectProperty.IsClosedUnderExtensions** (Mathlib/CategoryTheory/ObjectProperty/Extensions.lean): Object properties closed under extensions in a category with short exact sequences Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:CategoryTheory.ObjectProperty.IsClosedUnderIsomorphisms** (Mathlib/CategoryTheory/ObjectProperty/ClosedUnderIsomorphisms.lean): Object properties closed under isomorphism Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:CategoryTheory.ShortComplex.ShortExact** (Mathlib/Algebra/Homology/ShortComplex/ShortExact.lean): Short exact short complexes Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:ExteriorAlgebra.exteriorPower** (Mathlib/LinearAlgebra/ExteriorAlgebra/Basic.lean): The n-th exterior power of a module over a commutative ring Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:IsDedekindDomain** (Mathlib/RingTheory/DedekindDomain/Basic.lean): Dedekind domains Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:IsDiscreteValuationRing** (Mathlib/RingTheory/DiscreteValuationRing/Basic.lean): Discrete valuation rings Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:IsDiscreteValuationRing.TFAE** (Mathlib/RingTheory/DiscreteValuationRing/TFAE.lean): Equivalent characterisations of a DVR among noetherian local domains that are not fields Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:IsLocalization.AtPrime.isDiscreteValuationRing_of_dedekind_domain** (Mathlib/RingTheory/DedekindDomain/Dvr.lean): Localisations of a Dedekind domain at nonzero primes are DVRs Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:IsLocalizedModule** (Mathlib/Algebra/Module/LocalizedModule/Basic.lean): Localised modules, characterised by a universal property; equal to base change to the localised ring Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:IsRegularLocalRing** (Mathlib/RingTheory/RegularLocalRing/Defs.lean): Regular local rings Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:LocalizedModule** (Mathlib/Algebra/Module/LocalizedModule/Basic.lean): The localisation S⁻¹M of a module Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:LocallyConstant.const** (Mathlib/Topology/LocallyConstant/Basic.lean): Constant locally constant functions Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:Order.coheight** (Mathlib/Order/KrullDimension.lean): Coheight of an element of a preorder (here: codimension of a point) Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:PresheafOfModules** (Mathlib/Algebra/Category/ModuleCat/Presheaf.lean): Presheaves of modules over a presheaf of rings Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:PresheafOfModules.sheafification** (Mathlib/Algebra/Category/ModuleCat/Presheaf/Sheafification.lean): Sheafification of presheaves of modules Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:SheafOfModules.IsFiniteType** (Mathlib/Algebra/Category/ModuleCat/Sheaf/Generators.lean): Sheaves of modules locally generated by finitely many sections Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:SheafOfModules.IsLocallyFree** (Mathlib/Algebra/Category/ModuleCat/Sheaf/LocallyFree.lean): Locally free sheaves of modules (local bases of arbitrary cardinality) Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:SheafOfModules.IsQuasicoherent** (Mathlib/Algebra/Category/ModuleCat/Sheaf/Quasicoherent.lean): Quasi-coherent sheaves of modules; locally free sheaves are quasi-coherent Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:SheafOfModules.LocalGeneratorsData** (Mathlib/Algebra/Category/ModuleCat/Sheaf/Generators.lean): Local generator data of a sheaf of modules: a cover with a generating family of sections on each member Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:SheafOfModules.LocalGeneratorsData.IsFiniteType** (Mathlib/Algebra/Category/ModuleCat/Sheaf/Generators.lean): Local generator data whose generating families are finite Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:SheafOfModules.LocalGeneratorsData.IsLocallyFreeData** (Mathlib/Algebra/Category/ModuleCat/Sheaf/LocallyFree.lean): Local generator data whose generating families are free Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:SheafOfModules.LocalGeneratorsData.isLocallyFree** (Mathlib/Algebra/Category/ModuleCat/Sheaf/LocallyFree.lean): Locally free data exhibits IsLocallyFree Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:SheafOfModules.free** (Mathlib/Algebra/Category/ModuleCat/Sheaf/Free.lean): The free sheaf of modules on a type Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:SheafOfModules.free.generatingSections** (Mathlib/Algebra/Category/ModuleCat/Sheaf/LocallyFree.lean): The free generating sections of a free sheaf of modules Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:TopologicalSpace.Opens** (Mathlib/Topology/Sets/Opens.lean): The (u-small) type of open subsets of a topological space Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:exteriorPower.ιMulti** (Mathlib/LinearAlgebra/ExteriorPower/Basic.lean): The alternating map to the exterior power Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:SheafOfModules.LocalGeneratorsData.IsLocallyFreeData.isFinitePresentation** (TauCeti/Algebra/Category/ModuleCat/Sheaf/FinitePresentation.lean): Locally free data with finite local bases gives a finitely presented sheaf Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.AbelianK0** (TauCeti/CategoryTheory/GrothendieckGroup/Abelian.lean): Abelian K₀ of an essentially small abelian category Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.AbelianK0.eulerChar** (TauCeti/CategoryTheory/GrothendieckGroup/EulerCharacteristic.lean): The alternating class of the terms of a bounded complex in abelian K₀ Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.AbelianK0.of_shortExact** (TauCeti/CategoryTheory/GrothendieckGroup/Abelian.lean): The defining relation of abelian K₀ Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.AlgebraicGeometry.CodimensionOnePoint** (TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/Basic.lean): Points of coheight one of a scheme Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.AlgebraicGeometry.FinitelyPresentedSheaf** (TauCeti/AlgebraicGeometry/FinitelyPresentedSheaf/Basic.lean): The full subcategory of finitely presented O_X-modules (coherent sheaves on a locally noetherian scheme) Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.AlgebraicGeometry.InvertibleSheaf** (TauCeti/AlgebraicGeometry/LineBundle/Basic.lean): Invertible sheaves on a scheme Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.AlgebraicGeometry.LineBundleClass** (TauCeti/AlgebraicGeometry/LineBundle/Class.lean): Isomorphism classes of invertible sheaves Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.AlgebraicGeometry.LineBundleClass.mk** (TauCeti/AlgebraicGeometry/LineBundle/Class.lean): The class of an invertible sheaf Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.AlgebraicGeometry.LineBundleClass.mk_eq_mk_iff** (TauCeti/AlgebraicGeometry/LineBundle/Class.lean): Equality of line-bundle classes is isomorphism Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.AlgebraicGeometry.LineBundleClass.mk_tensorProduct** (TauCeti/AlgebraicGeometry/LineBundle/Class.lean): The class of a tensor product of line bundles Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.AlgebraicGeometry.LineBundleClass.mk_trivial** (TauCeti/AlgebraicGeometry/LineBundle/Class.lean): The class of the trivial bundle is 1 Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.AlgebraicGeometry.Scheme.rationalFunctions** (TauCeti/AlgebraicGeometry/Modules/RationalFunctions.lean): The constant sheaf K_X of rational functions on an integral scheme Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.AlgebraicGeometry.SchemeWeilDivisor** (TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/Basic.lean): Weil divisors on a scheme Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.AlgebraicGeometry.SchemeWeilDivisor.classGroupToLineBundleClass** (TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/LineBundle.lean): The map from divisor classes to line-bundle classes Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.AlgebraicGeometry.SchemeWeilDivisor.classGroupToLineBundleClassHom** (TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/TensorProduct.lean): The divisor-to-line-bundle map as an additive homomorphism Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.AlgebraicGeometry.SchemeWeilDivisor.classGroupToLineBundleClass_add** (TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/TensorProduct.lean): Additivity of the divisor-to-line-bundle map Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.AlgebraicGeometry.SchemeWeilDivisor.classGroupToLineBundleClass_injective** (TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/LineBundle.lean): Injectivity of the divisor-to-line-bundle map Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.AlgebraicGeometry.SchemeWeilDivisor.isLocallyPrincipal_of_forall_coheight_le_one** (TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/LocallyPrincipal.lean): Every Weil divisor is locally principal in dimension ≤ 1 with DVR codimension-one stalks Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.AlgebraicGeometry.SchemeWeilDivisor.isUnit_toLineBundleClass** (TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/TensorProduct.lean): The class of O_X(D) is a unit Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.AlgebraicGeometry.SchemeWeilDivisor.relativeDegree** (TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/Degree.lean): The degree of a Weil divisor weighted by residue degrees Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.AlgebraicGeometry.SchemeWeilDivisor.relativeDegree_ofPoint** (TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/Degree.lean): The relative degree of a point divisor is its residue degree Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.AlgebraicGeometry.SchemeWeilDivisor.sheaf** (TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/Sheaf.lean): The sheaf O_X(D) of a Weil divisor Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.AlgebraicGeometry.SchemeWeilDivisor.sheafHomOfLE** (TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/Sheaf.lean): The inclusion O_X(D) → O_X(E) for D ≤ E Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.AlgebraicGeometry.SchemeWeilDivisor.sheafMulIso** (TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/Sheaf.lean): Multiplication by a nonzero rational function g: O_X(D) ≅ O_X(D − div g) Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.AlgebraicGeometry.SchemeWeilDivisor.toInvertibleSheaf** (TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/LineBundle.lean): O_X(D) packaged as an invertible sheaf Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.AlgebraicGeometry.SchemeWeilDivisor.toLineBundleClass** (TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/LineBundle.lean): The line-bundle class of O_X(D) Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.AlgebraicGeometry.SchemeWeilDivisor.toLineBundleClass_add** (TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/TensorProduct.lean): O_X(D + E) ≅ O_X(D) ⊗ O_X(E) on classes Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.AlgebraicGeometry.SchemeWeilDivisor.toLineBundleClass_zero** (TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/LineBundle.lean): O_X(0) has the trivial class Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.AlgebraicGeometry.SchemeWeilDivisor.unitIsoSheafZero** (TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/Invertible.lean): O_X ≅ O_X(0) Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.AlgebraicGeometry.WeilDivisor.OrderSystem.ClassGroup** (TauCeti/AlgebraicGeometry/WeilDivisor/Principal/Basic.lean): The divisor class group of an order system Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.AlgebraicGeometry.WeilDivisor.OrderSystem.divisorClass** (TauCeti/AlgebraicGeometry/WeilDivisor/Principal/Basic.lean): The class of a divisor Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.AlgebraicGeometry.WeilDivisor.OrderSystem.ofScheme** (TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/Principal.lean): The order system of a noetherian integral scheme Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.AlgebraicGeometry.WeilDivisor.OrderSystem.principalDivisor** (TauCeti/AlgebraicGeometry/WeilDivisor/Principal/Basic.lean): The principal divisor of a nonzero rational function Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.AlgebraicGeometry.WeilDivisor.ofPoint** (TauCeti/AlgebraicGeometry/WeilDivisor/Basic.lean): The prime divisor of a single codimension-one point Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.ExactK0.BiadditiveInvariant** (TauCeti/CategoryTheory/GrothendieckGroup/Exact.lean): Isomorphism-invariant invariants of two objects, additive on conflations in each variable Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.ExactK0.BiadditiveInvariant.bilift** (TauCeti/CategoryTheory/GrothendieckGroup/Exact.lean): Descent of a biadditive invariant to a biadditive map on exact K₀ Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.ExactK0.BiadditiveInvariant.bilift_of_of** (TauCeti/CategoryTheory/GrothendieckGroup/Exact.lean): Evaluation of bilift on pairs of object classes Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.ExactK0.hom_ext** (TauCeti/CategoryTheory/GrothendieckGroup/Exact.lean): Homomorphisms out of exact K₀ agreeing on object classes are equal Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.ExactK0.induction_on** (TauCeti/CategoryTheory/GrothendieckGroup/Exact.lean): Induction on classes of objects in exact K₀ Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.ExactK0.liftEquiv** (TauCeti/CategoryTheory/GrothendieckGroup/Exact.lean): Universal property of exact K₀ Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.ExactK0.lift_of** (TauCeti/CategoryTheory/GrothendieckGroup/Exact.lean): Evaluation of lift on an object class Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.ExactK0.map** (TauCeti/CategoryTheory/GrothendieckGroup/Exact.lean): A conflation-exact functor induces a homomorphism of exact K₀ Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.ExactK0.mapEquiv** (TauCeti/CategoryTheory/GrothendieckGroup/Exact.lean): An exact equivalence induces an isomorphism of exact K₀ Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.ExactK0.map_of** (TauCeti/CategoryTheory/GrothendieckGroup/Exact.lean): Evaluation of an induced map on object classes Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.ExactK0.of** (TauCeti/CategoryTheory/GrothendieckGroup/Exact.lean): The class of an object in exact K₀ Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.ExactK0.of_biprod** (TauCeti/CategoryTheory/GrothendieckGroup/Exact.lean): Classes are additive on biproducts Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.ExactK0.of_conflation** (TauCeti/CategoryTheory/GrothendieckGroup/Exact.lean): The class of the middle term of a conflation is the sum of the outer classes Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.ExactK0.of_eq_zero_of_isZero** (TauCeti/CategoryTheory/GrothendieckGroup/Exact.lean): The class of a zero object vanishes Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.ExactStructure.IsConflationExact** (TauCeti/CategoryTheory/Exact/Functor.lean): Conflation-exact functors Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.ExactStructure.IsExtensionClosed** (TauCeti/CategoryTheory/Exact/ExtensionClosed.lean): Extension-closed object properties of an exact category Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.ExactStructure.abelian** (TauCeti/CategoryTheory/Exact/Abelian.lean): The canonical exact structure of an abelian category (all short exact sequences) Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.ExactStructure.abelian_conflation** (TauCeti/CategoryTheory/Exact/Abelian.lean): Conflations of the abelian exact structure are the short exact sequences Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.ExactStructure.eulerClassOf_eq** (TauCeti/CategoryTheory/GrothendieckGroup/ProjectiveResolution.lean): Every finite P-resolution computes the chosen Euler class when P consists of E-projectives (hproj : P ≤ E.isProjective), with the induced extension-closed structure and the section’s additive/zero/biproduct/smallness hypotheses; not independence for arbitrary resolving subcategories. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.ExactStructure.fullSubcategory** (TauCeti/CategoryTheory/Exact/ExtensionClosed.lean): The exact structure induced on an extension-closed full subcategory Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.ExactStructure.fullSubcategory_conflation_iff** (TauCeti/CategoryTheory/Exact/ExtensionClosed.lean): Conflations of the induced structure are the ambient conflations with terms in the subcategory Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.ExactStructure.isExtensionClosed_abelian_iff** (TauCeti/CategoryTheory/Exact/ExtensionClosed.lean): For the abelian exact structure, extension closure is Mathlib's IsClosedUnderExtensions Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.SheafOfModules.IsInvertible** (TauCeti/Algebra/Category/ModuleCat/Sheaf/Invertible/Basic.lean): Invertible sheaves: locally free of rank one Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.SheafOfModules.IsInvertible.isLocallyFree** (TauCeti/Algebra/Category/ModuleCat/Sheaf/Invertible/Basic.lean): An invertible sheaf is locally free Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.SheafOfModules.IsInvertible.of_iso** (TauCeti/Algebra/Category/ModuleCat/Sheaf/Invertible/Basic.lean): Invertibility transports along isomorphisms (the template for vector bundles) Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.SheafOfModules.tensorProduct** (TauCeti/Algebra/Category/ModuleCat/Sheaf/TensorProduct/Basic.lean): The tensor product of sheaves of modules Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.SheafOfModules.tensorProductAssoc** (TauCeti/Algebra/Category/ModuleCat/Sheaf/TensorProduct/Associator.lean): Associator of the sheaf tensor product Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.SheafOfModules.tensorProductComm** (TauCeti/Algebra/Category/ModuleCat/Sheaf/TensorProduct/Basic.lean): Symmetry of the sheaf tensor product Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.SheafOfModules.tensorProductUnitIsoLeft** (TauCeti/Algebra/Category/ModuleCat/Sheaf/TensorProduct/Basic.lean): Left unitor of the sheaf tensor product Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.SplitK0.finrankEquiv** (TauCeti/CategoryTheory/GrothendieckGroup/FiniteDimensionalVectorSpace.lean): K₀ of finite-dimensional vector spaces is ℤ by dimension Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.TriangulatedK0** (TauCeti/CategoryTheory/GrothendieckGroup/Triangulated.lean): Triangulated K₀ of an essentially small pretriangulated category Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.TriangulatedK0.of_shift_one** (TauCeti/CategoryTheory/GrothendieckGroup/Triangulated.lean): In triangulated K₀, [X[1]] = −[X] Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.cartanEquiv** (TauCeti/Algebra/Category/ModuleCat/CartanMap.lean): The Cartan map is an isomorphism when every finite module has a finite projective resolution Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.cartanEquivOfIsSemisimpleRing** (TauCeti/Algebra/Category/ModuleCat/CartanMap.lean): The Cartan map of a semisimple ring is an isomorphism Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.cartanMap** (TauCeti/Algebra/Category/ModuleCat/CartanMap.lean): The Cartan map K₀(proj R) → G₀(mod R) Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.cartanMap_of** (TauCeti/Algebra/Category/ModuleCat/CartanMap.lean): The Cartan map on the class of a finitely generated projective Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.finiteModulesExactStructure** (TauCeti/Algebra/Category/ModuleCat/CartanMap.lean): The exact structure of finitely generated modules Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.finiteProjectiveModulesExactStructure** (TauCeti/Algebra/Category/ModuleCat/CartanMap.lean): The exact structure of finitely generated projective modules Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.moduleEulerClassOf** (TauCeti/Algebra/Category/ModuleCat/CartanMap.lean): The alternating class of a finite projective resolution in K₀(proj R) Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:exteriorPower.eq_zero_of_finrank_lt** (TauCeti/LinearAlgebra/ExteriorPower.lean): An exterior power above the rank of a finite free module is zero Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:IsLocallyConstant.isClopen_fiber** (Mathlib/Topology/LocallyConstant/Basic.lean): Fibres of a locally constant map are clopen, without compactness. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:LocallyConstant.comap** (Mathlib/Topology/LocallyConstant/Basic.lean): Pullback by a continuous map is precomposition, without finite-image hypotheses. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:TrivSqZeroExt.commRing** (Mathlib/Algebra/TrivSqZeroExt/Basic.lean): Commutative ring on the trivial extension of a commutative ring by a central bimodule; both left and opposite-ring module structures are required. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:TrivSqZeroExt.snd_mul** (Mathlib/Algebra/TrivSqZeroExt/Basic.lean): The module coordinate of a product is r·n + m·s, with the second summand using the right action. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:TrivSqZeroExt.inr_mul_inr** (Mathlib/Algebra/TrivSqZeroExt/Basic.lean): Two elements in the module summand multiply to zero, for left and right module actions. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.Comodule.Hom.range** (TauCeti/Algebra/Coalgebra/Subcomodule/Basic.lean): The image of a comodule morphism as a subcomodule, with underlying linear-map range. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.ExactK0.AdditiveInvariant** (TauCeti/CategoryTheory/GrothendieckGroup/Exact.lean): Isomorphism-invariant, conflation-additive functions on objects, exactly the inputs to ExactK0.lift. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.FGComoduleCat** (TauCeti/Algebra/Coalgebra/Comodule/Finite/Basic.lean): The existing finite-underlying-module comodule category over a commutative semiring. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.Comodule.Hom.ker** (TauCeti/Algebra/Coalgebra/Subcomodule/Comap.lean): Kernel subcomodule; requires flat coefficient coalgebra over a commutative ring. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.Comodule.Hom.ker_finite** (TauCeti/Algebra/Coalgebra/Subcomodule/Comap.lean): Kernel is finite when the source module is noetherian, with flat coefficient coalgebra. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.Subcomodule.instComoduleQuotient** (TauCeti/Algebra/Coalgebra/Subcomodule/Quotient.lean): The quotient by a subcomodule carries the induced coaction. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.Subcomodule.mkQ** (TauCeti/Algebra/Coalgebra/Subcomodule/Quotient.lean): The quotient map is a comodule morphism. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.Subcomodule.comap** (TauCeti/Algebra/Coalgebra/Subcomodule/Comap.lean): Inverse-image subcomodule under a comodule map, assuming flat coefficient coalgebra. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.Comodule.Hom.cofreeUnit** (TauCeti/Algebra/Coalgebra/Comodule/Cofree.lean): Coaction as a comodule map to E⊗C with its cofree structure. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.Comodule.Hom.cofreeMap** (TauCeti/Algebra/Coalgebra/Comodule/Cofree.lean): An underlying linear map induces a map between cofree comodules. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.Subcomodule.exists_finite_subcomodule_of_setFinite** (TauCeti/Algebra/Coalgebra/Subcomodule/Finite.lean): Every finite set lies in a finite subcomodule when the coefficient coalgebra is Module.Free; this is not a flat-coalgebra theorem. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.ExactStructure.isConflationExact_ι** (TauCeti/CategoryTheory/Exact/ExtensionClosed.lean): Inclusion of the induced extension-closed exact subcategory is conflation-exact. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:LinearMap.rTensor_surjective** (Mathlib/LinearAlgebra/TensorProduct/RightExactness.lean): Tensoring a surjective linear map on the right remains surjective. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:Module.Flat.lTensor_exact** (Mathlib/RingTheory/Flat/Basic.lean): Tensoring with a flat module preserves exactness of pairs of linear maps; injection and surjection preservation are checked separately for the short exact structure. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.Comodule.baseChange** (TauCeti/Algebra/Coalgebra/Comodule/BaseChange.lean): For commutative scalar rings, transports a comodule to the scalar-extended module over the scalar-extended coefficient coalgebra; selected explicitly as a local instance. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.Comodule.Hom.baseChange** (TauCeti/Algebra/Coalgebra/Comodule/BaseChange.lean): Scalar extension of a comodule morphism, over the simultaneously extended coefficient coalgebra; underlying map is LinearMap.baseChange. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.FGComoduleCat.of** (TauCeti/Algebra/Coalgebra/Comodule/Finite/Basic.lean): Packages an unbundled right comodule finite over its base in the existing finite-comodule category. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.FGComoduleCat.ofHom** (TauCeti/Algebra/Coalgebra/Comodule/Finite/Basic.lean): Packages an existing comodule morphism between finite comodules as a categorical morphism, retaining its function. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.Comodule.weightSpace** (TauCeti/Algebra/Coalgebra/Comodule/MonoidAlgebra/Basic.lean): The native x-weight submodule of an R[X]-comodule, characterized by coaction v↦v⊗[x]. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.Comodule.Hom.map_mem_weightSpace** (TauCeti/Algebra/Coalgebra/Comodule/MonoidAlgebra/Basic.lean): A comodule morphism preserves every native weight submodule. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.Comodule.Hom.map_weightProj** (TauCeti/Algebra/Coalgebra/Comodule/MonoidAlgebra/Basic.lean): Comodule morphisms commute with weight projections, giving exactness of each weight. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.Comodule.weightProj_of_mem** (TauCeti/Algebra/Coalgebra/Comodule/MonoidAlgebra/Basic.lean): A weight projection fixes vectors of its own weight. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.Comodule.weightProj_mem_weightSpace** (TauCeti/Algebra/Coalgebra/Comodule/MonoidAlgebra/Basic.lean): The projected vector belongs to the corresponding weight space. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.Comodule.isInternal_weightSpace** (TauCeti/Algebra/Coalgebra/Comodule/MonoidAlgebra/Basic.lean): The native comodule is the internal direct sum of its weight spaces, over any commutative semiring. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.Comodule.range_weightProj** (TauCeti/Algebra/Coalgebra/Comodule/MonoidAlgebra/Basic.lean): The range of a weight projection is exactly its native weight space. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.Comodule.finite_setOf_weightSpace_ne_bot** (TauCeti/Algebra/Coalgebra/Comodule/MonoidAlgebra/Basic.lean): A finite R[X]-comodule has finitely many nonzero weight spaces. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.Comodule.tensorCoeffEquiv** (TauCeti/Algebra/Coalgebra/Comodule/MonoidAlgebra/Basic.lean): The linear equivalence V⊗R[X]≃(X→₀V), with its pure-tensor and inverse-single formulas. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.FGComoduleCat.corestrict** (TauCeti/Algebra/Coalgebra/Comodule/Finite/Corestrict.lean): Native corestriction along a coalgebra map, keeping underlying finite modules and maps. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:CoalgEquiv** (Mathlib/RingTheory/Coalgebra/Equiv.lean): The existing type of invertible coalgebra morphisms, including its underlying linear equivalence. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:Module.finrank_baseChange** (Mathlib/LinearAlgebra/Dimension/Constructions.lean): Freeness and strong rank conditions give finrank_R(R⊗_S M)=finrank_S(M); the integral weight is finite free in this application. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.GeneralLinear.coordinateHopfAlgebraBaseChangeBialgEquiv** (TauCeti/Algebra/AlgebraicGroup/GeneralLinear/Coordinate/BaseChange.lean): For every commutative R-algebra K, the chosen base-changed GL coordinate Hopf algebra is K-bialgebra-isomorphic to the direct K-model; no flatness required. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.GeneralLinear.coordinateHopfAlgebraBaseChangeBialgEquiv_one_tmul_X** (TauCeti/Algebra/AlgebraicGroup/GeneralLinear/Coordinate/BaseChange.lean): The single-factor base-change equivalence sends 1⊗X_ab to the corresponding generic entry over K. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.GeneralLinear.coordinateHopfAlgebra_algHom_ext** (TauCeti/Algebra/AlgebraicGroup/GeneralLinear/Coordinate/HopfAlgebra.lean): Algebra maps from the bundled GL coordinate algebra are determined by localized generic entries, including rank zero. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.GeneralLinear.diagonalTorusCoordinateMap** (TauCeti/Algebra/AlgebraicGroup/GeneralLinear/DiagonalTorus/Basic.lean): The native bialgebra map to the group algebra of the ULift-indexed diagonal character lattice. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.GeneralLinear.diagonalTorusCoordinateMap_X** (TauCeti/Algebra/AlgebraicGroup/GeneralLinear/DiagonalTorus/Basic.lean): Generic entries map to their positive coordinate monomial on the diagonal and zero off the diagonal. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.GeneralLinear.diagonalTorusCoordinateMap_baseChange** (TauCeti/Algebra/AlgebraicGroup/GeneralLinear/DiagonalTorus/Basic.lean): The single-factor coordinate/base-change square commutes using the canonical GL and diagonalizable-group identifications. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.MonoidAlgebra.scalarTensorBialgEquiv** (TauCeti/Algebra/Bialgebra/MonoidAlgebra/BaseChange.lean): The bialgebra equivalence K⊗_R R[X]≃K[X], for commutative semiring extensions and commutative monoids. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.MonoidAlgebra.scalarTensorBialgEquiv_tmul** (TauCeti/Algebra/Bialgebra/MonoidAlgebra/BaseChange.lean): The forward equivalence extends coefficients and multiplies by the new-base scalar. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.MonoidAlgebra.scalarTensorBialgEquiv_symm_single** (TauCeti/Algebra/Bialgebra/MonoidAlgebra/BaseChange.lean): The inverse sends a[x] to a⊗[x]. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.Bialgebra.TensorProduct.includeLeft** (TauCeti/Algebra/Bialgebra/TensorProduct.lean): Bialgebra inclusion x↦x⊗1. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.Bialgebra.TensorProduct.includeRight** (TauCeti/Algebra/Bialgebra/TensorProduct.lean): Bialgebra inclusion y↦1⊗y. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.Bialgebra.TensorProduct.projectLeft_comp_includeLeft** (TauCeti/Algebra/Bialgebra/TensorProduct.lean): The counit-based left projection retracts the left inclusion. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.Bialgebra.TensorProduct.projectRight_comp_includeRight** (TauCeti/Algebra/Bialgebra/TensorProduct.lean): The counit-based right projection retracts the right inclusion. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.Bialgebra.TensorProduct.baseChangeTensorBialgEquiv** (TauCeti/Algebra/Bialgebra/TensorProduct.lean): The bialgebra equivalence distributing base change over a tensor product. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **tauceti:TauCeti.Bialgebra.TensorProduct.baseChangeTensorBialgEquiv_tmul** (TauCeti/Algebra/Bialgebra/TensorProduct.lean): The distribution equivalence sends a⊗(x⊗y) to (a⊗x)⊗(1⊗y). Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:Bialgebra.TensorProduct.rid** (Mathlib/RingTheory/Bialgebra/TensorProduct.lean): The bialgebra right-unit equivalence A⊗_R R≃A, with the larger scalar ring permitted by its tower hypotheses. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:Bialgebra.TensorProduct.map** (Mathlib/RingTheory/Bialgebra/TensorProduct.lean): Tensor products of bialgebra maps, allowing the base-extension scalar tower. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:Bialgebra.mulBialgHom** (Mathlib/RingTheory/Bialgebra/TensorProduct.lean): Multiplication of a commutative bialgebra as a bialgebra map from its tensor square. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:MonoidAlgebra.mapDomainBialgHom** (Mathlib/RingTheory/Bialgebra/MonoidAlgebra.lean): An indexing-monoid homomorphism induces a bialgebra map of monoid algebras. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:MonoidAlgebra.mapDomainBialgHom_single** (Mathlib/RingTheory/Bialgebra/MonoidAlgebra.lean): The induced map sends a single coefficient at x to that coefficient at the image of x. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:Matrix.det** (Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean): Matrix determinant over a commutative ring, by the Leibniz alternating formula. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:CategoryTheory.Core** (Mathlib/CategoryTheory/Core.lean): The maximal subgroupoid has the original objects and isomorphisms as morphisms. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:CategoryTheory.SymmetricCategory** (Mathlib/CategoryTheory/Monoidal/Braided/Basic.lean): Two braidings compose to identity; self-braiding need not itself be identity. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:Module.Dual** (Mathlib/LinearAlgebra/Dual/Defs.lean): The linear dual M→ₗ[R]R over a semiring, used here for a commutative ring. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:TensorProduct.lift** (Mathlib/LinearAlgebra/TensorProduct/Basic.lean): The semilinear tensor-product universal map from a bilinear map; with the identity ring homomorphism it supplies the linear evaluation map. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.
- **mathlib:LinearMap.range** (Mathlib/Algebra/Module/Submodule/Range.lean): The range submodule of a semilinear map with surjective coefficient homomorphism; the identity coefficient map here is surjective. Independent REV-KTheoryLowDegrees--Z.3: actual declaration and surrounding hypotheses read at the recorded pin; module bytes match its pinned Git blob; all citing node uses checked.

## Coverage

| Stage | Status | Nodes | Planets |
| --- | --- | ---: | ---: |
| KTheoryLowDegrees:Z.3 | planned | 152 | 6 |
| KTheoryLowDegrees:Z.4 | source_decomposed | 43 | 6 |
| KTheoryLowDegrees:Z.5 | planned | 40 | 5 |
| KTheoryLowDegrees:Z.6 | planned | 25 | 1 |

## KTheoryLowDegrees:Z.3

All targets of the stage text are realised by nodes: the ring structure (finite-projective-monoidal, rank-ring-hom, map-ring-hom); exterior powers and the exterior filtration of an extension (projective-exterior-power, exterior-direct-sum, exterior-extension-filtration, exterior-extension-graded); the λ-ring identities on K₀ with their extension to virtual classes (total-lambda … lambda-add, ring-k0-pre-lambda, and the special identities ring-k0-special); the componentwise determinant and its comparison with Pic (determinant-projective … determinant-surjective, determinant-tensor, determinant-exterior-power, determinant-mul, rank-det-ring-hom, sk-zero); det as an additive-group homomorphism, not a ring homomorphism (determinant-hom and its non-example test); the augmentation and its relation with the γ-filtration (augmentation, ring-k0-augmented, gamma-filtration-one, gamma-filtration-two, gamma-first-graded, gamma-filtration-eq-span); and the degree-zero normalisation of the Adams operations (adams-operations, adams-first-graded, ring-k0-adams-line, ring-k0-adams-rank-det). The abstract λ-ring algebra that SchemeKTheoryOperations S.6 planned is owned here (restructure). The identities F²_γ = SK₀, det(ψ^k x) = det(x)^k and the determinant identities are proved without any splitting principle; the Sylvester–Franke identity (compound-matrix-determinant), the exterior filtration's graded pieces and the ideal/span comparison are proved from library facts, their statements being exercises or absent in the sources read. The open inputs to ring-k0-special are the integral coefficient-freeness, direct-model K₀/character transport and arbitrary-field character-image boundaries recorded below. This continuation adds eleven declaration-sized steps for Serre §§2.4–2.7 over ℤ and a free coefficient coalgebra. The generic-fibre isomorphism is conditional on surjective decomposition maps; the GL coefficient and character inputs remain as stated in the gap. The integral formal-character square and its conditional isomorphism consequence are now decomposed for a free C and specified coalgebra restriction to a split torus. The coefficient algebra and diagonal square for products are now decomposed using pinned single-factor inputs. Exact K₀/character transport and the arbitrary-field character image theorem remain open, as does integral coefficient freeness. BS17 source route is now inventoried in the graded-line, coherent determinant and supported Witt determinant nodes, with generic inputs requested once.

Refinements still required:

- The finite-free comparison and generic/residue-fibre argument are decomposed over ℤ for a free coefficient coalgebra C. Eight further nodes now supply native torus weight exactness, coefficient and weight base-change comparisons, integral formal characters, restriction, Ch_𝔽p∘d_p=Ch_ℚ, and the conditional isomorphism from equal injective character images. This removes the generic formal-character compatibility subproblem for a specified r:C→ℤ[X], but not the GL application. Establish freeness of the pinned integral GL coordinate coalgebra using the big-cell embedding in Serre p. 51 Remark 1, or supply the general flat/noetherian finite-hull extension; localization at the determinant gives flatness but not by itself freeness. The pinned single-factor coefficient and diagonal-torus identifications are reused, and eight new nodes now give the finite-product coefficient algebra, factor inclusions, generator extensionality, coefficient base change, diagonal restriction and their commuting square. Package corestriction along this coefficient equivalence as an equivalence of the finite-comodule exact categories and the induced direct-model exact K₀ comparison; prove its formal-character compatibility with restrictedCharacter and the existing ofGL.character. The underlying coefficient square is now available, but these categorical and K₀ identifications are not asserted as completed by it. Supply Serre Lemma 5 over those fields, including absolute simplicity and descent, then finite dominance intervals and the unitriangular character proof that the images are exactly the same ℤ[X]^W. ClassicalGroups layers 3–4 provide only their complex comparison; the existing ReductiveGroups Part II proposal retains the missing owner direction without inventing a supplier stage. SchemeKTheoryOperations S.5 remains downstream.
- Implement/check supplier coherences and perfect v-descent interfaces recorded in the new gap, and refine BS17 Cor.5.6 through smooth approximation where arbitrary regular R₀ is needed. This pass inventories the targets; it proves none of them in Lean.

### Tensor closure of finite projectives

**KTheoryLowDegrees:Z.3/finite-projective-monoidal** · theorem · implementation unchecked.

The object property finiteProjectiveModules R (finitely generated projective R-modules in ModuleCat R) contains the tensor unit R and is closed under the tensor product ⊗[R] of ModuleCat R. Hence its full subcategory is a full monoidal subcategory, inheriting the symmetric monoidal and monoidal-preadditive structure of ModuleCat R, and the existing commutative ring structure of TauCeti.SplitK0 applies to RingK0 R = SplitK0 (finiteProjectiveModules R).FullSubcategory (Z.1/ring-k0): the unit is 1 = [R] and [P]·[Q] = [P ⊗[R] Q] for all finitely generated projective P, Q. No second presentation of K₀(R) is introduced.

**Hypotheses.**

- R is a commutative unital ring; the zero ring is allowed.

**Construction or proof.**

- R is finite free of rank one, so R ∈ finiteProjectiveModules R.
- If P, Q are finitely generated projective then P ⊗[R] Q is finitely generated (Module.Finite.tensorProduct) and projective (Module.Projective.tensorProduct); this is the closure under ⊗.
- Package the two closure facts as the monoidal closure data of an object property and apply ObjectProperty.fullMonoidalSubcategory; the braiding and preadditive compatibility restrict from ModuleCat R.
- Apply TauCeti.SplitK0.instCommRing to the resulting essentially small braided monoidal preadditive category with biproducts; TauCeti.SplitK0.of_mul_of gives [P]·[Q] = [P ⊗ Q] and the unit is the class of the tensor unit R.

**Acceptance.**

- [R]·[P] = [P] and [0]·[P] = 0 for every finitely generated projective P.
- [R^m]·[R^n] = [R^{mn}], so m[R]·n[R] = mn[R].
- For an invertible module L, [L]·[L^∨] = [R] (Lemma I.3.1: the evaluation L^∨ ⊗ L → R is an isomorphism).
- For R = k × k (k a field), [k × 0]·[0 × k] = [(k × 0) ⊗ (0 × k)] = [0] = 0: the ring K₀(k × k) ≅ ℤ² has zero divisors (Z.2/k0-field-product).

**Prerequisites.**

- KTheoryLowDegrees:Z.1/ring-k0
- tauceti:TauCeti.finiteProjectiveModules
- mathlib:Module.Projective.tensorProduct
- mathlib:Module.Finite.tensorProduct
- mathlib:CategoryTheory.ObjectProperty.fullMonoidalSubcategory
- tauceti:TauCeti.SplitK0.instCommRing
- tauceti:TauCeti.SplitK0.of_mul_of

**Sources.**

- Kbook.II, II §2, p. 5 (K₀ of a ring). The ring structure; the node supplies the closure of finitely generated projectives under ⊗ needed to instantiate the existing categorical ring structure on split K₀.

### Exterior powers preserve projectivity

**KTheoryLowDegrees:Z.3/projective-exterior-power** · lemma · implementation unchecked.

For every projective R-module M and n ≥ 0, the exterior power ⋀[R]^n M is a projective R-module; if M is moreover finitely generated then ⋀[R]^n M is finitely generated (exteriorPower.instFinite), so ⋀^n preserves finitely generated projectives. No finiteness of M is needed for projectivity.

**Hypotheses.**

- R is a commutative unital ring; the zero ring is allowed.

**Construction or proof.**

- By Module.Projective.iff_split choose a free module F and linear maps i: M → F, s: F → M with s ∘ i = id_M.
- Functoriality of exterior powers (exteriorPower.map, with exteriorPower.map_comp and exteriorPower.map_id) gives ⋀^n s ∘ ⋀^n i = id, so ⋀^n M is a retract of ⋀^n F.
- ⋀^n F is free (exteriorPower.instFree, the basis of increasing index sets), hence projective; a retract of a projective is projective (Module.Projective.of_split). The argument is integral: no division by n! occurs.
- Finite generation: exteriorPower.instFinite.

**Acceptance.**

- Over R = ℤ/2ℤ, ⋀²(R²) ≅ R is projective; no antisymmetrisation denominator is used.
- For n = 0 and n = 1 the statement reduces to exteriorPower.zeroEquiv (⋀⁰M ≅ R) and exteriorPower.oneEquiv (⋀¹M ≅ M).
- For P = eR ⊕ ((1 − e)R)² with e idempotent, ⋀²P ≅ (1 − e)R, a projective that is not free when e ≠ 0, 1.

**Prerequisites.**

- mathlib:Module.Projective.iff_split
- mathlib:Module.Projective.of_split
- mathlib:exteriorPower.instFree
- mathlib:exteriorPower.map_id
- mathlib:exteriorPower.map_comp
- mathlib:exteriorPower.instFinite

**Sources.**

- Kbook.I, I §3, p. 16 (determinant line bundle). Weibel's projectivity statement for exterior powers of finitely generated projectives; the node proves it by the retract argument, without the constant-rank hypothesis.

### Exterior powers of a direct sum

**KTheoryLowDegrees:Z.3/exterior-direct-sum** · lemma · implementation unchecked.

For arbitrary R-modules M, N and n ≥ 0 there is an R-linear isomorphism ⋀^n(M × N) ≅ ⊕_{i=0}^{n} ⋀^i M ⊗[R] ⋀^{n−i} N (the Sum Formula), natural in M and N. The summand (i, n − i) maps by (m₁ ∧ ⋯ ∧ m_i) ⊗ (n₁ ∧ ⋯ ∧ n_{n−i}) ↦ (m₁, 0) ∧ ⋯ ∧ (m_i, 0) ∧ (0, n₁) ∧ ⋯ ∧ (0, n_{n−i}), placing the M-factors before the N-factors.

**Hypotheses.**

- R is a commutative unital ring; the zero ring is allowed.

**Construction or proof.**

- For each i the displayed formula is multilinear and alternating separately in the m's and in the n's; by the universal property of each exterior power (exteriorPower.alternatingMapLinearEquiv, twice) and of ⊗ it defines φ_i : ⋀^i M ⊗ ⋀^{n−i} N → ⋀^n(M × N); sum over i.
- The inverse ψ is defined on generators by expanding (m₁, n₁) ∧ ⋯ ∧ (m_n, n_n) multilinearly: the term for a subset S ⊆ {1, …, n} with |S| = i is ε(S)·(∧_{s∈S} m_s) ⊗ (∧_{s∉S} n_s), where ε(S) is the sign of the shuffle moving the positions of S in front. The resulting map is alternating (a repeated argument cancels in pairs), so it descends to ⋀^n(M × N).
- ψ ∘ φ = id on generators of each summand and φ ∘ ψ = id on generators of ⋀^n(M × N), by the alternating relations; everything is integral, with no factorial denominators.
- Naturality in M and N is checked on generators with exteriorPower.map.

**Acceptance.**

- For n = 1 the isomorphism is the identification M × N ≅ M ⊕ N.
- For M = N = R and n = 2, ⋀²(R²) ≅ ⋀²R ⊕ (R ⊗ R) ⊕ ⋀²R = 0 ⊕ R ⊕ 0, generated by (1, 0) ∧ (0, 1).
- Ranks: for free M, N of ranks a, b the formula recovers the Vandermonde identity C(a + b, n) = Σ_i C(a, i)C(b, n − i).

**Prerequisites.**

- mathlib:exteriorPower.alternatingMapLinearEquiv
- mathlib:exteriorPower.map_id
- mathlib:exteriorPower.map_comp

**Sources.**

- Kbook.I, I §3, p. 16, fact (iii). The Sum Formula, stated for all modules; Weibel cites Bourbaki, Algèbre ch. 2 for it (text layer reproduced literally; rendered ⊕_{i=0}^k).

### Exterior-class convolution

**KTheoryLowDegrees:Z.3/exterior-class-sum** · lemma · implementation unchecked.

For finitely generated projective R-modules P, Q and n ≥ 0: [⋀^n(P × Q)] = Σ_{i=0}^{n} [⋀^i P]·[⋀^{n−i} Q] in the ring K₀(R).

**Hypotheses.**

- R is a commutative unital ring; the zero ring is allowed.

**Construction or proof.**

- Every ⋀^i P, ⋀^{n−i} Q is finitely generated projective (Z.3/projective-exterior-power), hence so is each tensor product (Z.3/finite-projective-monoidal).
- Apply RingK0.of_congr to the Sum Formula (Z.3/exterior-direct-sum), then additivity of classes over the finite biproduct (SplitK0.of_biprod, iterated) and [A ⊗ B] = [A]·[B] (SplitK0.of_mul_of) on each summand.

**Acceptance.**

- P = Q = R, n = 2: [⋀²(R²)] = [R] = [⋀⁰R][⋀²R] + [⋀¹R][⋀¹R] + [⋀²R][⋀⁰R] = 0 + 1 + 0.
- Q = 0: the formula reduces to [⋀^n P] = [⋀^n P]·[R].

**Prerequisites.**

- KTheoryLowDegrees:Z.3/projective-exterior-power
- KTheoryLowDegrees:Z.3/finite-projective-monoidal
- KTheoryLowDegrees:Z.3/exterior-direct-sum
- mathlib:exteriorPower.instFinite
- tauceti:TauCeti.SplitK0.of_congr
- tauceti:TauCeti.SplitK0.of_biprod
- tauceti:TauCeti.SplitK0.of_mul_of

**Sources.**

- Kbook.II, II Example 4.1.2, p. 25. The class identity behind the λ-semiring structure on P(R).

### Exterior powers commute with scalar extension

**KTheoryLowDegrees:Z.3/exterior-base-change** · lemma · implementation unchecked.

For a homomorphism of commutative rings R → S (S an R-algebra), every R-module M and n ≥ 0, there is an S-linear isomorphism S ⊗[R] ⋀[R]^n M ≅ ⋀[S]^n (S ⊗[R] M), natural in M and in S, sending 1 ⊗ (m₁ ∧ ⋯ ∧ m_n) to (1 ⊗ m₁) ∧ ⋯ ∧ (1 ⊗ m_n).

**Hypotheses.**

- R is a commutative unital ring; the zero ring is allowed.

**Construction or proof.**

- The map M^n → ⋀[S]^n(S ⊗ M), (m_i) ↦ ∧(1 ⊗ m_i), is R-multilinear and alternating; by exteriorPower.alternatingMapLinearEquiv and extension of scalars it gives the S-linear map of the statement.
- For an S-module N, S-alternating maps (S ⊗ M)^n → N and R-alternating maps M^n → N correspond (restriction along m ↦ 1 ⊗ m); both sides of the statement therefore represent the same functor, and the two universal factorisations give mutually inverse maps.
- Naturality follows from the uniqueness clauses of the universal properties. The separate exterior-rank node supplies the stalk-rank formula.

**Acceptance.**

- n = 0 gives S ⊗[R] R ≅ S; n = 1 gives the identity of S ⊗[R] M.
- For R = ℤ, S = ℤ/2ℤ and M = ℤ²: (ℤ/2) ⊗ ⋀²ℤ² ≅ ℤ/2 ≅ ⋀²((ℤ/2)²). The comparison uses alternating maps (vanishing on repeated arguments), not merely antisymmetric ones, which differ in characteristic 2.

**Prerequisites.**

- mathlib:exteriorPower.alternatingMapLinearEquiv

**Sources.**

- Kbook.I, I §3, p. 16, fact (ii). The base-change isomorphism; its rank consequence is the separate exterior-rank node.

### Exterior powers above local rank vanish

**KTheoryLowDegrees:Z.3/exterior-above-rank** · lemma · implementation unchecked.

For a finitely generated projective R-module M and n ≥ 0: if rankAtStalk M p < n for every prime p of R, then ⋀^n M = 0. In particular ⋀^k P = 0 for k > n when P has constant rank n, and ⋀^k L = 0 for k ≥ 2 when L is invertible.

**Hypotheses.**

- R is a commutative unital ring; the zero ring is allowed.

**Construction or proof.**

- Let 𝔪 be a maximal ideal. By Z.3/exterior-base-change (S = R_𝔪) the localisation (⋀^n M)_𝔪 is ⋀^n of M_𝔪, which is free of rank r = rankAtStalk M 𝔪 < n (Z.2/local-freeness).
- The exterior power of a free module of rank r < n has the empty basis (no n-element subsets of an r-element set; exteriorPower.instFree with exteriorPower.finrank_eq), so it is zero.
- A module whose localisations at all maximal ideals vanish is zero (Module.subsingleton_of_localization_maximal).

**Acceptance.**

- For an invertible L, ⋀²L = 0 (rank one).
- The strict inequality is needed: ⋀⁰0 = R ≠ 0 for R ≠ 0.
- For R = k × k and M = k × 0 (rank 1 at one point, 0 at the other), ⋀²M = 0 although M has no constant rank.

**Prerequisites.**

- KTheoryLowDegrees:Z.3/exterior-base-change
- mathlib:exteriorPower.finrank_eq
- mathlib:exteriorPower.instFree
- mathlib:Module.subsingleton_of_localization_maximal
- KTheoryLowDegrees:Z.2/local-freeness

**Sources.**

- Kbook.I, I §3, p. 16. The vanishing above the rank; the node makes its local-rank hypothesis explicit and allows non-constant rank.

### Dual base change for finite projectives

**KTheoryLowDegrees:Z.3/projective-dual-base-change** · lemma · implementation unchecked.

For every commutative R-algebra S and finite projective M, there is an S-linear equivalence S⊗RHom_R(M,R) ≅ Hom_S(S⊗RM,S), taking s⊗f to the functional t⊗m ↦ st f(m).

**Hypotheses.**

- R is a commutative unital ring; the zero ring is allowed.

**Construction or proof.**

- Commute the tensor factors and apply the existing dualTensorHomEquiv with N=S. This gives an R-linear equivalence with Hom_R(M,S).
- Use the scalar-extension adjunction to identify Hom_R(M,S) with Hom_S(S⊗RM,S). The displayed pure-tensor formula shows that the composite and its inverse respect the S-action.
- The formula also proves compatibility with dual evaluation, which is the precise local input to the top-exterior determinant proof.

**Acceptance.**

- For M = R the comparison is S ⊗[R] R^∨ ≅ S ≅ S^∨, s ⊗ id ↦ (t ↦ st).
- No flatness of R → S is needed: for R = ℤ, S = ℤ/2ℤ and M = ℤ² both sides are (ℤ/2)².
- The comparison commutes with the evaluation pairings: ev_S ∘ (comparison ⊗ id) = S ⊗ ev_R under S ⊗ (M^∨ ⊗ M) ≅ (S ⊗ M^∨) ⊗_S (S ⊗ M).

**Prerequisites.**

- mathlib:dualTensorHomEquiv

**Sources.**

- Kbook.I, I §3, proof of Lemma 3.1, p. 15. The local-to-global argument for the dual evaluation map, whose localisation step needs the dual to commute with base change; the node supplies that comparison for finitely generated projectives.

### Total exterior operation on virtual classes

**KTheoryLowDegrees:Z.3/total-lambda** · construction · implementation unchecked.

Define λ_t : K₀(R) → (1 + tK₀(R)[[t]])^×, the unique homomorphism from the additive group of K₀(R) to the multiplicative group of power series with constant coefficient 1, with λ_t([P]) = Σ_{n≥0} [⋀^n P] tⁿ for every finitely generated projective P. The series λ_t([P]) is a polynomial (⋀^n P = 0 for n above the rank). The target is realised inside the units of the power-series ring K₀(R)[[t]]; negative classes go to inverse series, which are in general not polynomials: λ_t(−[R]) = (1 + t)^{−1}.

**Hypotheses.**

- R is a commutative unital ring; the zero ring is allowed.

**Construction or proof.**

- For finitely generated projective P, Σ[⋀^n P]tⁿ has constant coefficient [⋀⁰P] = [R] = 1 (exteriorPower.zeroEquiv), so it is a unit (PowerSeries.isUnit_iff_constantCoeff); it depends only on the isomorphism class of P, since exteriorPower.map of an isomorphism is an isomorphism (exteriorPower.map_comp).
- For P, Q: the coefficient of tⁿ in λ_t([P])λ_t([Q]) is Σ_i [⋀^i P][⋀^{n−i} Q] (PowerSeries.coeff_mul), which equals [⋀^n(P × Q)] (Z.3/exterior-class-sum). So the object function is additive on biproducts: an additive invariant with values in the multiplicative group.
- Apply the universal property of split K₀ (TauCeti.SplitK0.liftEquiv) with target the additive group Additive((1 + tK₀(R)[[t]])^×); uniqueness is part of the universal property.
- For the polynomial assertion, choose a finite-free retract R^N of P using Module.Finite.exists_comp_eq_id_of_projective. Localising the split injection gives rankAtStalk P ≤ N at every prime. Exterior-above-rank then gives Λ^n P = 0 for every n>N. In the zero ring every coefficient vanishes; no nontriviality assumption is introduced.

**Acceptance.**

- λ_t(0) = 1 and λ_t([R]) = 1 + t.
- λ_t(−[R]) = (1 + t)^{−1} = Σ (−1)ⁿ tⁿ, so infinitely many coefficients of a virtual class can be nonzero.
- λ_t(2[R]) = (1 + t)² = 1 + 2t + t²: the t² coefficient is [⋀²R²] = [R].

**Prerequisites.**

- KTheoryLowDegrees:Z.3/exterior-class-sum
- KTheoryLowDegrees:Z.3/exterior-above-rank
- tauceti:TauCeti.SplitK0.liftEquiv
- mathlib:exteriorPower.zeroEquiv
- mathlib:exteriorPower.map_comp
- mathlib:PowerSeries.isUnit_iff_constantCoeff
- mathlib:PowerSeries.coeff_mul
- mathlib:Module.Finite.exists_comp_eq_id_of_projective

**Uses.**

- K-book II Example 4.1.2: K₀(R) is a λ-ring: the coefficients of λ_t are the operations λ^k
- KTheoryLowDegrees:Z.3/lambda and Z.3/ring-k0-pre-lambda: coefficient extraction defines λ^n on virtual classes and the pre-λ-ring instance
- SchemeKTheoryOperations:S.6/degree-zero-comparison: the degree-zero operations of higher K-theory are compared with these on K₀(A)

**Public API.**

- TauCeti.RingK0.lambdaTotal_constant (simp): Every λₜ(x) has constant coefficient 1.
- TauCeti.RingK0.lambdaTotal_of (simp): The coefficient of tⁿ in λₜ([P]) is [ΛⁿP].
- TauCeti.RingK0.lambdaTotal_unique (universal-property): An additive-to-multiplicative map with these values on finite-projective classes equals λₜ.
- TauCeti.RingK0.lambdaTotal_add (structure): λ_t(x + y) = λ_t(x)·λ_t(y) and λ_t(−x) = λ_t(x)^{−1}.

**Unit tests.**

- TauCeti.RingK0.lambdaTotal_zero_test (degenerate): λ_t(0) = 1.
- TauCeti.RingK0.lambdaTotal_unit_test (computation): λ_t([R]) = 1 + t.
- TauCeti.RingK0.lambdaTotal_neg_unit_test (computation): For every n, the coefficient of tⁿ in λ_t(−[R]) is (−1)ⁿ[R].
- TauCeti.RingK0.lambdaTotal_two_test (non-example): λ_t(2[R]) = 1 + 2t + t², not 1 + 2t: a definition that extends λ^n additively (λ^n(x + y) = λ^n x + λ^n y) fails here, since [⋀²(R²)] = [R] ≠ 0 for R ≠ 0.

**Sources.**

- Kbook.II, II §4, 4.1 and the λ-semiring paragraph, p. 25. The group-completion construction of λ_t; applied to the λ-semiring P(R) of Example 4.1.2 it is this node.

### Constant coefficient of the total operation

**KTheoryLowDegrees:Z.3/total-lambda-constant** · lemma · implementation unchecked.

For all x∈K₀(R), coeff₀(λₜ(x))=1.

**Hypotheses.**

- R is a commutative unital ring; the zero ring is allowed.

**Construction or proof.**

- The object series has constant term one. The constant coefficient is multiplicative, and products and inverses of such series retain constant term one.

**Acceptance.**

- For x = −[R]: coeff₀((1 + t)^{−1}) = 1.
- For the zero ring every coefficient is 0 = 1, consistently.

**Prerequisites.**

- KTheoryLowDegrees:Z.3/total-lambda

**Sources.**

- Kbook.II, II §4, 4.1, p. 25. The target group 1 + tK[[t]] of series with constant coefficient 1.

### Total operation on a projective class

**KTheoryLowDegrees:Z.3/total-lambda-of** · lemma · implementation unchecked.

For every finite projective P and n≥0, coeffₙ λₜ([P])=[ΛⁿP].

**Hypotheses.**

- R is a commutative unital ring; the zero ring is allowed.

**Construction or proof.**

- Evaluate the baseline universal additive lift on the object P.

**Acceptance.**

- For P = R², coeff₂ λ_t([R²]) = [⋀²R²] = [R].
- For an invertible L, λ_t([L]) = 1 + [L]t (⋀^k L = 0 for k ≥ 2, Z.3/exterior-above-rank).

**Prerequisites.**

- KTheoryLowDegrees:Z.3/total-lambda

**Sources.**

- Kbook.II, II Example 4.1.2, p. 25. The value of the total operation on an object class.

### Virtual exterior coefficients

**KTheoryLowDegrees:Z.3/lambda** · definition · implementation unchecked.

For n ≥ 0 and x ∈ K₀(R), λⁿ(x) := coeff_n(λ_t(x)), the coefficient of tⁿ in the total operation of Z.3/total-lambda. These are Weibel's λ-operations on K₀(R): λⁿ[P] = [⋀ⁿP] (Z.3/lambda-of), and they make K₀(R) a pre-λ-ring (Z.3/ring-k0-pre-lambda).

**Hypotheses.**

- R is a commutative unital ring; the zero ring is allowed.

**Construction or proof.**

- Extract the n-th coefficient of the unit-valued total operation.

**Acceptance.**

- λ²(2[R]) = [R] and λ²(−[R]) = [R].
- λⁿ(0) = 0 for n > 0 and λ⁰(x) = 1 for all x.

**Prerequisites.**

- KTheoryLowDegrees:Z.3/total-lambda

**Uses.**

- KTheoryLowDegrees:Z.3/determinant-hom and Z.3/gamma: for an actual constant-rank projective P, λ^r[P] is the K₀-class of the determinant module Λ^rP; shifted coefficients define γ. No top-exterior formula for arbitrary virtual classes is asserted.
- SchemeKTheoryOperations:S.6/quillen-hiller-operations and S.6/degree-zero-comparison: the degree-zero part of the higher λ-operations must be λⁿ[P] = [⋀ⁿP] on every projective class
- SchemeKTheoryOperations:S.6/vector-bundle-lambda-ring: for X = Spec A the scheme operations restrict to these

**Public API.**

- TauCeti.RingK0.lambda_zero (simp): λ⁰(x)=1.
- TauCeti.RingK0.lambda_one (simp): λ¹(x)=x.
- TauCeti.RingK0.lambda_of (compatibility): λⁿ([P])=[ΛⁿP] for every finite projective P.

**Unit tests.**

- TauCeti.RingK0.lambda_rank_two_test (computation): λ²(2[R]) = [R] and λ³(2[R]) = 0.
- TauCeti.RingK0.lambda_neg_unit_test (non-example): λ²(−[R]) = [R] although −[R] has negative rank: λⁿ of a virtual class is not [⋀ⁿ] of any module attached to it, and is not 0 for n above |rank|.
- TauCeti.RingK0.lambda_zero_class_test (degenerate): λⁿ(0) = 0 for every n > 0.
- TauCeti.RingK0.lambda_line_test (compatibility): For an invertible module L, λ¹[L] = [L] and λⁿ[L] = 0 for n ≥ 2, so [L] is a line element of the pre-λ-ring K₀(R).

**Sources.**

- Kbook.II, II §4, λ-semiring paragraph, p. 25. The operations are the coefficients of the extended total operation.

### Zeroth virtual exterior coefficient

**KTheoryLowDegrees:Z.3/lambda-zero** · lemma · implementation unchecked.

λ⁰(x)=1 for every virtual class x.

**Hypotheses.**

- R is a commutative unital ring; the zero ring is allowed.

**Construction or proof.**

- Unfold coefficient extraction and use total-lambda-constant.

**Acceptance.**

- λ⁰(−[R]) = 1.
- λ⁰ of the zero class is 1, not 0.

**Prerequisites.**

- KTheoryLowDegrees:Z.3/lambda
- KTheoryLowDegrees:Z.3/total-lambda-constant

**Sources.**

- Kbook.II, II §4, 4.1, p. 25. The first pre-λ-ring axiom.

### First virtual exterior coefficient

**KTheoryLowDegrees:Z.3/lambda-one** · lemma · implementation unchecked.

λ¹(x)=x for every virtual class x.

**Hypotheses.**

- R is a commutative unital ring; the zero ring is allowed.

**Construction or proof.**

- For series with constant term one, their first coefficient is additive under multiplication. Thus coeff₁λₜ is an additive homomorphism.
- On each object class, total-lambda-of and exteriorPower.oneEquiv give the identity. Apply the uniqueness clause of the existing K₀ universal property.

**Acceptance.**

- λ¹([P] − [Q]) = [P] − [Q].
- λ¹(−[R]) = −[R].

**Prerequisites.**

- KTheoryLowDegrees:Z.3/lambda
- KTheoryLowDegrees:Z.3/total-lambda-constant
- KTheoryLowDegrees:Z.3/total-lambda-of
- mathlib:exteriorPower.oneEquiv
- tauceti:TauCeti.SplitK0.liftEquiv
- mathlib:PowerSeries.coeff_one_mul

**Sources.**

- Kbook.II, II §4, 4.1, p. 25. The second pre-λ-ring axiom, on virtual classes.

### Virtual operation on an actual module

**KTheoryLowDegrees:Z.3/lambda-of** · lemma · implementation unchecked.

λⁿ([P])=[ΛⁿP] for finite projective P.

**Hypotheses.**

- R is a commutative unital ring; the zero ring is allowed.

**Construction or proof.**

- Unfold coefficient extraction and use total-lambda-of.

**Acceptance.**

- λ²[R³] = [⋀²R³] = 3[R].
- For P = k × k² over R = k × k: λ²[P] = [⋀²P] = [0 × k].

**Prerequisites.**

- KTheoryLowDegrees:Z.3/lambda
- KTheoryLowDegrees:Z.3/total-lambda-of

**Sources.**

- Kbook.II, II Example 4.1.2, p. 25. The operations on object classes.

### Exterior convolution for virtual sums

**KTheoryLowDegrees:Z.3/lambda-add** · lemma · implementation unchecked.

For every x,y∈K₀(R) and n≥0, λⁿ(x+y)=Σ_{i=0}ⁿ λⁱ(x)λⁿ⁻ⁱ(y).

**Hypotheses.**

- R is a commutative unital ring; the zero ring is allowed.

**Construction or proof.**

- The total operation sends addition to multiplication. Take the n-th coefficient and apply the finite Cauchy-product formula.

**Acceptance.**

- λ²(x + y) = λ²x + xy + λ²y.
- λ²([R] + [R]) = 0 + [R] + 0 = [R], matching λ²[R²].

**Prerequisites.**

- KTheoryLowDegrees:Z.3/lambda
- KTheoryLowDegrees:Z.3/total-lambda
- mathlib:PowerSeries.coeff_mul

**Sources.**

- Kbook.II, II §4, 4.1, p. 25. The sum formula, for all virtual classes (text layer; rendered Σ_{i=0}^k).

### Exterior coefficients of finite free modules

**KTheoryLowDegrees:Z.3/lambda-free** · lemma · implementation unchecked.

For all m,n≥0, λ^n(m[R]) = Nat.choose m n [R]. In particular λ^k([R])=0 for k≥2 and λ_t([R])=1+t, the unit normalisation used in the gamma substitution identity. Negative free classes are the separate lambda-negative-free node.

**Hypotheses.**

- R is a commutative unital ring; the zero ring is allowed.

**Construction or proof.**

- ⋀^k R = 0 for k ≥ 2 (Z.3/exterior-above-rank, R has rank one), and ⋀⁰R = R, ⋀¹R = R, so λ_t([R]) = 1 + t (Z.3/lambda-of).
- The total operation is additive-to-multiplicative, so λ_t(m[R])=(1+t)^m. Its coefficients are Nat.choose m n by lambda-nat-cast. No assertion about negative classes is bundled into this declaration.

**Acceptance.**

- λ²(3[R])=3[R] and λ³(2[R])=0.
- For m=0, λ^0(0)=1 and λ^n(0)=0 for n>0.
- For the zero ring all identities hold trivially.

**Prerequisites.**

- KTheoryLowDegrees:Z.3/lambda-of
- KTheoryLowDegrees:Z.3/total-lambda
- KTheoryLowDegrees:Z.3/exterior-above-rank
- KTheoryLowDegrees:Z.3/lambda-nat-cast
- mathlib:exteriorPower.zeroEquiv
- mathlib:exteriorPower.oneEquiv

**Sources.**

- Kbook.II, II Exercise 4.1, p. 35. With P = 0 this is the negative binomial formula; with λ_t([R]) = 1 + t it is the positive one (text layer; rendered λ^k([P] − n) = Σ(−1)^i C(n+i−1, i)[∧^{k−i}P]).
- Kbook.II, II §4, γ-operations, p. 29. The hypothesis this node verifies for K₀(R).

### Rank of virtual exterior coefficients

**KTheoryLowDegrees:Z.3/rank-lambda** · lemma · implementation unchecked.

For every x ∈ K₀(R), every prime p and n ≥ 0: rank(λⁿx)(p) = Ring.choose (rank(x)(p)) n, the generalised binomial coefficient of the integer rank(x)(p) (C(−1, n) = (−1)ⁿ). Equivalently rank : K₀(R) → H⁰(Spec R, ℤ) = LocallyConstant (PrimeSpectrum R) ℤ is a homomorphism of pre-λ-rings to the binomial pre-λ-ring of Z.3/binomial-lambda-ring, and the augmentation ideal I_R is a λ-ideal.

**Hypotheses.**

- R is a commutative unital ring; the zero ring is allowed.

**Construction or proof.**

- For a finitely generated projective P: rank(⋀ⁿP)(p) = C(rankAtStalk P p, n) (Z.3/exterior-rank), so rank ∘ λ_t = (1 + t)^{rank} on object classes, coefficientwise in H⁰(Spec R, ℤ)[[t]].
- Both x ↦ rank-coefficientwise(λ_t(x)) and x ↦ (1 + t)^{rank x} (Z.3/binomial-lambda-ring) are homomorphisms from K₀(R) to the multiplicative group 1 + tH⁰[[t]] (rank is additive, Z.2/rank-hom; it is a ring homomorphism, Z.3/rank-ring-hom, so it commutes with products of series); they agree on object classes, hence everywhere (TauCeti.SplitK0.hom_ext).
- Compare coefficients; no rationalisation of K₀(R) is involved (Ring.choose on ℤ is integral).

**Acceptance.**

- At local rank −1 the rank of λⁿ is (−1)ⁿ; at local rank 0 every positive coefficient has rank 0.
- For P = k × k² over k × k: rank λ²[P] = (0, 1).

**Prerequisites.**

- KTheoryLowDegrees:Z.3/lambda-of
- KTheoryLowDegrees:Z.3/exterior-rank
- KTheoryLowDegrees:Z.3/total-lambda
- KTheoryLowDegrees:Z.3/rank-ring-hom
- KTheoryLowDegrees:Z.3/binomial-lambda-ring
- KTheoryLowDegrees:Z.2/rank-hom
- tauceti:TauCeti.SplitK0.hom_ext
- mathlib:Ring.choose

**Sources.**

- Kbook.II, II Example 4.1.2, p. 25. Rank is a λ-ring morphism to the binomial ring H⁰(R).

### Positive exterior powers of the zero class

**KTheoryLowDegrees:Z.3/lambda-zero-class** · lemma · implementation unchecked.

In every pre-λ-ring K (Z.3/pre-lambda-ring), λⁿ(0) = 0 for n > 0; that is, λ_t(0) = 1. In particular this holds in K₀(R).

**Hypotheses.**

- K is a pre-λ-ring (commutative, unital; the zero ring allowed).

**Construction or proof.**

- λ_t is a homomorphism from (K, +) to the multiplicative group 1 + tK[[t]] (Z.3/pre-lambda-ring), so λ_t(0) is the unit series 1, whose positive coefficients vanish.

**Acceptance.**

- In ℤ with λⁿ(m) = C(m, n): λⁿ(0) = C(0, n) = 0 for n > 0.
- λ⁰(0) = 1, not 0.

**Prerequisites.**

- KTheoryLowDegrees:Z.3/pre-lambda-ring
- KTheoryLowDegrees:Z.3/pre-lambda-hom

**Sources.**

- Kbook.II, II §4, 4.1, p. 25. A group homomorphism sends 0 to the identity series 1.

### Integral inverse-series recursion

**KTheoryLowDegrees:Z.3/lambda-neg-recursion** · lemma · implementation unchecked.

In every pre-λ-ring K and for n > 0: λⁿ(−x) = −Σ_{i=0}^{n−1} λ^{n−i}(x)λ^i(−x); equivalently λ_t(−x) = λ_t(x)^{−1}. The recursion is integral and determines λⁿ(−x) as a universal integer polynomial in λ¹(x), …, λⁿ(x). In K₀(R) this gives Weibel's formula λ^k([P] − n) = Σ_i (−1)^i C(n + i − 1, i)[⋀^{k−i}P] (with Z.3/lambda-free).

**Hypotheses.**

- K is a pre-λ-ring (commutative, unital; the zero ring allowed).

**Construction or proof.**

- Apply the sum formula (pre-λ-ring axiom) to x + (−x) = 0: for n > 0 the n-th coefficient Σ_{i=0}^{n} λ^{n−i}(x)λ^i(−x) vanishes (Z.3/lambda-zero-class).
- Separate the term i = n, which is λ⁰(x)λⁿ(−x) = λⁿ(−x), and rearrange.

**Acceptance.**

- n = 1: λ¹(−x) = −x.
- n = 2: λ²(−x) = x² − λ²(x).
- In K₀(R): λ²(−[R]) = [R]² − λ²[R] = [R].

**Prerequisites.**

- KTheoryLowDegrees:Z.3/pre-lambda-ring
- KTheoryLowDegrees:Z.3/lambda-zero-class

**Sources.**

- Kbook.II, II §4, 4.1, p. 25. The inverse in the multiplicative group 1 + tK[[t]] gives the negative operations.
- Kbook.II, II Exercise 4.1, p. 35. The K₀ instance of the recursion.

### γ-operations of a pre-λ-ring

**KTheoryLowDegrees:Z.3/gamma** · definition · implementation unchecked.

Let K be a pre-λ-ring (Z.3/pre-lambda-ring), for example K₀(R) with the λ-operations of Z.3/lambda. The γ-operations γⁿ : K → K (n ≥ 0) are the coefficients of γ_t(x) := λ_s(x) with s = t/(1 − t), that is γ_t(x) = Σ_{j≥0} λʲ(x) tʲ(1 − t)^{−j} ∈ 1 + tK[[t]]. Thus γ⁰ = 1, γ¹ = id (Z.3/gamma-one), γ_t(x + y) = γ_t(x)γ_t(y) (Z.3/gamma-add), and, when λ^k(1) = 0 for k ≥ 2, γⁿ(x) = λⁿ(x + n − 1) for n ≥ 1 (Z.3/gamma-series). On K₀(R) these are Weibel's γ-operations; γⁿ is not λⁿ.

**Hypotheses.**

- K is a pre-λ-ring (commutative, unital; the zero ring allowed). The shifted formula needs λ^k(1) = 0 for k ≥ 2, which holds in K₀(R) (Z.3/lambda-free) and in every special λ-ring.

**Construction or proof.**

- The series t/(1 − t) = Σ_{j≥1} tʲ has zero constant coefficient, so substitution s ↦ t/(1 − t) is a well-defined ring endomorphism of K[[t]] fixing constants (mathlib:PowerSeries.subst with PowerSeries.HasSubst).
- Apply it to λ_t(x) and take coefficients; the constant coefficient stays 1.

**Acceptance.**

- γ²(x) = λ²(x) + x when λ²(1) = 0.
- In K₀(R): γⁿ([R]) = [R] for n ≥ 1 and γ²(−[R]) = 0.

**Prerequisites.**

- KTheoryLowDegrees:Z.3/pre-lambda-ring
- mathlib:PowerSeries.subst
- mathlib:PowerSeries.HasSubst
- KTheoryLowDegrees:Z.3/pre-lambda-hom

**Uses.**

- KTheoryLowDegrees:Z.3/gamma-filtration: weighted products of γ-operations on rank-zero classes generate the γ-filtration
- SchemeKTheoryOperations:S.6/soule-gamma-bound: γ^k on K₀(A), vanishing above the stable rank
- SchemeKTheoryOperations:S.6/degree-zero-comparison and S.7/scheme-gamma-filtration: the higher and scheme γ-operations restrict to these on K₀(A)

**Public API.**

- TauCeti.LambdaRing.gammaTotal (data): γ_t : K → 1 + tK[[t]], γ_t(x) = λ_{t/(1−t)}(x), an additive-to-multiplicative homomorphism.
- TauCeti.LambdaRing.gamma (constructor): γⁿ(x) = coeff_n(γ_t(x)).
- TauCeti.LambdaRing.gamma_zero (simp): γ⁰(x) = 1.
- TauCeti.LambdaRing.gamma_one (simp): γ¹(x) = x (Z.3/gamma-one).
- TauCeti.LambdaRing.gamma_add (simp): γⁿ(x + y) = Σ_{i=0}^{n} γⁱ(x)γ^{n−i}(y) (Z.3/gamma-add).
- TauCeti.LambdaRing.gamma_eq_lambda_add (characterisation): If λ^k(1) = 0 for k ≥ 2: γⁿ(x) = λⁿ(x + n − 1) for n ≥ 1 (Z.3/gamma-series).
- TauCeti.LambdaRing.gamma_two (relation): γ²(x) = λ²(x) + x when λ²(1) = 0.
- TauCeti.LambdaRing.gamma_map (functoriality): A pre-λ-ring homomorphism f satisfies f(γⁿx) = γⁿ(f x).
- TauCeti.RingK0.gamma_ringK0 (compatibility): On K₀(R) with Z.3/lambda: γⁿ(x) = λⁿ(x + (n − 1)[R]) for n ≥ 1.

**Unit tests.**

- TauCeti.LambdaRing.gamma_int_test (computation): In ℤ with λ^k(m) = C(m, k): γ^k(m) = C(m + k − 1, k); for instance γ²(3) = 6 (Weibel Example 4.5.1).
- TauCeti.RingK0.gamma_unit_test (computation): In K₀(R): γⁿ([R]) = [R] for every n ≥ 1, since λ_s([R]) = 1 + s = 1/(1 − t) (Weibel Example 4.5.2).
- TauCeti.RingK0.gamma_neg_unit_test (non-example): In K₀(R), R ≠ 0: γ_t(−[R]) = 1 − [R]t, so γ²(−[R]) = 0, whereas λ²(−[R]) = [R]; a definition γⁿ = λⁿ fails.
- TauCeti.LambdaRing.gamma_zero_class_test (degenerate): γⁿ(0) = 0 for every n > 0.
- TauCeti.RingK0.gamma_line_test (characterisation): For an invertible module L: γ^k([L]) = [L] for k ≥ 1 and γ^k([L] − [R]) = 0 for k ≥ 2 (Weibel Example 4.5.2 and Lemma 4.5.3).

**Sources.**

- Kbook.II, II §4, γ-operations, p. 29. Weibel's definition of γ_t by the substitution s = t/(1 − t).

### Gamma substitution identity

**KTheoryLowDegrees:Z.3/gamma-series** · lemma · implementation unchecked.

Let K be a pre-λ-ring with λ^k(1) = 0 for k ≥ 2. For every n ≥ 1 and x ∈ K: γⁿ(x) = λⁿ(x + n − 1) = Σ_{j=1}^{n} C(n − 1, j − 1) λʲ(x). In particular γ²(x) = λ²(x) + x and γ³(x) = λ³(x) + 2λ²(x) + x (Weibel's Formula 4.5).

**Hypotheses.**

- K is a pre-λ-ring with λ^k(1) = 0 for k ≥ 2 (for K₀(R), Z.3/lambda-free).

**Construction or proof.**

- The coefficient of tⁿ in tʲ(1 − t)^{−j} is C(n − 1, j − 1) for 1 ≤ j ≤ n and 0 for j > n, and for j = 0 it is 0 when n ≥ 1 (the coefficients C(j − 1 + m, j − 1) of (1 − t)^{−j}, mathlib:PowerSeries.invOneSubPow_val_eq_mk_sub_one_add_choose_of_pos).
- On the other side λⁿ(x + n − 1) = Σ_j λʲ(x)λ^{n−j}(n − 1) (sum formula) and λ^{n−j}(n − 1) = C(n − 1, n − j) = C(n − 1, j − 1) (Z.3/lambda-nat-cast); the j = 0 term is C(n − 1, n) = 0.

**Acceptance.**

- n = 2: γ²(x) = λ²(x) + x.
- n = 3: γ³(x) = λ³(x) + 2λ²(x) + x.
- In ℤ: γ³(2) = C(4, 3) = 4 = λ³(4).

**Prerequisites.**

- KTheoryLowDegrees:Z.3/gamma
- KTheoryLowDegrees:Z.3/pre-lambda-ring
- KTheoryLowDegrees:Z.3/lambda-nat-cast
- mathlib:PowerSeries.invOneSubPow_val_eq_mk_sub_one_add_choose_of_pos

**Sources.**

- Kbook.II, II Formula 4.5, p. 29. Weibel's shifted formula, whose verification he leaves as an elementary calculation.

### First gamma operation

**KTheoryLowDegrees:Z.3/gamma-one** · lemma · implementation unchecked.

In every pre-λ-ring K: γ¹(x) = x for all x.

**Hypotheses.**

- K is a pre-λ-ring (commutative, unital; the zero ring allowed).

**Construction or proof.**

- The coefficient of t in Σ_j λʲ(x)tʲ(1 − t)^{−j} is λ¹(x) (only j = 1 contributes), and λ¹(x) = x (pre-λ-ring axiom).

**Acceptance.**

- In K₀(R): γ¹([P] − [Q]) = [P] − [Q].
- γ¹ is additive, as the sum formula requires.

**Prerequisites.**

- KTheoryLowDegrees:Z.3/gamma
- KTheoryLowDegrees:Z.3/pre-lambda-ring

**Sources.**

- Kbook.II, II §4, γ-operations, p. 29. The first two γ-operations.

### Gamma convolution

**KTheoryLowDegrees:Z.3/gamma-add** · lemma · implementation unchecked.

In every pre-λ-ring K: γ_t(x + y) = γ_t(x)γ_t(y); that is, γⁿ(x + y) = Σ_{i=0}^{n} γⁱ(x)γ^{n−i}(y) for all n ≥ 0. So the γⁿ satisfy the pre-λ-ring axioms (Weibel: the γ-operations satisfy the axioms for a λ-ring structure).

**Hypotheses.**

- K is a pre-λ-ring (commutative, unital; the zero ring allowed).

**Construction or proof.**

- Substitution of t/(1 − t) is a ring homomorphism of power series (mathlib:PowerSeries.subst_mul, HasSubst since the constant term is zero).
- Apply it to λ_t(x + y) = λ_t(x)λ_t(y) (pre-λ-ring axiom) and take coefficients with PowerSeries.coeff_mul.

**Acceptance.**

- γ²(x + y) = γ²(x) + xy + γ²(y).
- γⁿ(x − x) = 0 for n > 0.

**Prerequisites.**

- KTheoryLowDegrees:Z.3/gamma
- KTheoryLowDegrees:Z.3/pre-lambda-ring
- mathlib:PowerSeries.subst_mul
- mathlib:PowerSeries.HasSubst.of_constantCoeff_zero'
- mathlib:PowerSeries.coeff_mul
- KTheoryLowDegrees:Z.3/pre-lambda-hom

**Sources.**

- Kbook.II, II §4, γ-operations, p. 29. The multiplicativity of γ_t, which needs no special λ-ring identity.

### Augmentation ideal

**KTheoryLowDegrees:Z.3/augmentation** · definition · implementation unchecked.

The augmentation ideal of K₀(R) is I_R := ker(rank) = K̃₀(R), the kernel of the ring homomorphism rank : K₀(R) → H⁰(Spec R, ℤ) = LocallyConstant (PrimeSpectrum R) ℤ (Z.2/rank-hom, multiplicative by Z.3/rank-ring-hom), normalised by rank[P](p) = rankAtStalk P p. Neither connectedness of Spec R nor a single global rank is assumed. I_R is the augmentation ideal of the augmented λ-ring of Z.3/ring-k0-augmented, and K₀(R) ≅ H⁰(Spec R, ℤ) ⊕ I_R (Z.2/rank-section).

**Hypotheses.**

- R is a commutative unital ring; the zero ring is allowed.

**Construction or proof.**

- Take the kernel ideal RingHom.ker of the ring homomorphism rank (Z.3/rank-ring-hom).
- The splitting K₀(R) ≅ H⁰ ⊕ I_R, x ↦ (rank x, x − rankSection(rank x)), is Z.2/rank-section.

**Acceptance.**

- For a field k, I_k = 0.
- For R = k × k, I_R = 0 (K₀ ≅ H⁰ ≅ ℤ², Z.2/k0-field-product) although R is disconnected.
- For a Dedekind domain A, I_A ≅ Pic(A) (Z.4/rank-pic-equivalence).

**Prerequisites.**

- KTheoryLowDegrees:Z.3/rank-ring-hom
- KTheoryLowDegrees:Z.2/rank-hom
- KTheoryLowDegrees:Z.2/rank-section

**Uses.**

- K-book II §4, positive structure on K₀(R) and Corollary 4.7.1: the kernel of the augmentation; F¹_γ = K̃₀(R)
- KTheoryLowDegrees:Z.3/gamma-filtration: only rank-zero classes enter the weighted γ-generators
- SchemeKTheoryOperations:S.6/degree-zero-comparison and S.7/scheme-gamma-filtration: the affine degree-zero rank filtration uses this ideal

**Public API.**

- TauCeti.RingK0.augmentationIdeal (constructor): I_R := RingHom.ker rank, an ideal of K₀(R).
- TauCeti.RingK0.mem_augmentationIdeal (characterisation): x ∈ I_R ↔ rank x = 0 (Z.3/augmentation-membership).
- TauCeti.RingK0.sub_rankSection_mem (constructor): x − rankSection(rank x) ∈ I_R for every x.
- TauCeti.RingK0.of_sub_mem_augmentationIdeal (constructor): For P of constant rank n: [P] − n[R] ∈ I_R.
- TauCeti.RingK0.augmentationIdeal_isLambdaIdeal (structure): λⁿ(I_R) ⊆ I_R for n ≥ 1 (Z.3/rank-lambda).

**Unit tests.**

- TauCeti.RingK0.augmentation_zero_test (degenerate): 0 ∈ I_R, and for the zero ring I_R = K₀(R) = 0.
- TauCeti.RingK0.augmentation_unit_test (non-example): For a nonzero ring R, [R] ∉ I_R; and for R = k × k, [k × 0] − [0 × k] ∉ I_R although its 'total rank' 1 − 1 = 0: the rank is a function on Spec R, not an integer.
- TauCeti.RingK0.augmentation_line_test (compatibility): For every invertible module L, [L] − [R] ∈ I_R (RingK0.rank_of_invertible of Z.2/rank-hom).
- TauCeti.RingK0.augmentation_field_test (computation): For a field k, I_k = 0, so every positive-weight γ-product vanishes and F¹_γ K₀(k) = 0.

**Sources.**

- Kbook.II, II Definition 2.3, p. 8. The augmentation ideal K̃₀(R) and the decomposition K₀(R) ≅ H⁰(R) ⊕ K̃₀(R).

### Rank-zero membership

**KTheoryLowDegrees:Z.3/augmentation-membership** · lemma · implementation unchecked.

For x ∈ K₀(R): x ∈ I_R if and only if rank(x) = 0 in H⁰(Spec R, ℤ), i.e. rank(x)(p) = 0 for every prime p.

**Hypotheses.**

- R is a commutative unital ring; the zero ring is allowed.

**Construction or proof.**

- Unfold the kernel ideal.

**Acceptance.**

- [L] − [R] ∈ I_R for invertible L.
- [P] − [Q] ∈ I_R whenever P and Q have the same rank function.

**Prerequisites.**

- KTheoryLowDegrees:Z.3/augmentation

**Sources.**

- Kbook.II, II Definition 2.3, p. 8. Membership in a kernel.

### Positive gamma coefficients have rank zero

**KTheoryLowDegrees:Z.3/gamma-rank-zero** · lemma · implementation unchecked.

Let (K, H, ε) be an augmented pre-λ-ring (Z.3/augmented-lambda-ring). Then γⁿ(ker ε) ⊆ ker ε for every n ≥ 1. In particular γⁿ(I_R) ⊆ I_R for K₀(R) with the rank augmentation (Z.3/ring-k0-augmented).

**Hypotheses.**

- (K, H, ε) is an augmented pre-λ-ring; ε commutes with every λ^k.

**Construction or proof.**

- ε commutes with λ^k, hence with the substitution defining γ_t, so ε(γⁿx) = γⁿ(εx) (API gamma_map of Z.3/gamma).
- For x ∈ ker ε, γⁿ(ε x) = γⁿ(0) = 0 for n ≥ 1 (γ_t(0) = 1, Z.3/lambda-zero-class).

**Acceptance.**

- In K₀(R): γ²([L] − [R]) = 0 ∈ I_R.
- For n = 0 the statement fails: γ⁰(x) = 1 ∉ ker ε unless the ring is zero.

**Prerequisites.**

- KTheoryLowDegrees:Z.3/gamma
- KTheoryLowDegrees:Z.3/augmented-lambda-ring
- KTheoryLowDegrees:Z.3/lambda-zero-class
- KTheoryLowDegrees:Z.3/ring-k0-augmented

**Sources.**

- Kbook.II, II Example 4.1.2, p. 25. The augmentation ideal is stable under the operations, hence under the γ-operations.

### The γ-filtration of an augmented λ-ring

**KTheoryLowDegrees:Z.3/gamma-filtration** · definition · implementation unchecked.

Let (K, H, ε) be an augmented pre-λ-ring (Z.3/augmented-lambda-ring). For n ≥ 0, F^n_γ K is the ideal of K generated by the finite products γ^{k₁}(x₁)⋯γ^{k_m}(x_m) with m ≥ 0, x_j ∈ ker ε, k_j ≥ 1 and k₁ + ⋯ + k_m ≥ n (the weight is the sum of the degrees, not the number of factors; the empty product 1 has weight 0). Thus F⁰_γ = K (Z.3/gamma-filtration-zero), F¹_γ = ker ε (Z.3/gamma-filtration-one), and for n ≥ 2 this is exactly Weibel's ideal-generated F^n_γ K. For K₀(R) with the rank augmentation (Z.3/ring-k0-augmented) it is the γ-filtration of K₀(R): F¹ = I_R and F² = SK₀(R) (Z.3/gamma-filtration-two). The ideal coincides with the additive subgroup generated by the products (Soulé's form) whenever H is additively generated by idempotents that commute with the λ-operations in the sense of Z.3/gamma-filtration-eq-span, in particular for K₀(R).

**Hypotheses.**

- (K, H, ε) is an augmented pre-λ-ring (commutative, unital; the zero ring allowed) (then 1 = ι(1) is a line element, so λ^k(1) = 0 for k ≥ 2 automatically).

**Construction or proof.**

- Take Ideal.span of the set of weighted products of total weight ≥ n; the generator data are a finite index set, positive degrees k_j and elements x_j of ker ε.

**Acceptance.**

- F⁰_γ K = K; F¹_γ K = ker ε; F²_γ contains γ²(x) and xy for x, y ∈ ker ε.
- For K₀ of a field, F¹_γ = 0.

**Prerequisites.**

- KTheoryLowDegrees:Z.3/gamma
- KTheoryLowDegrees:Z.3/augmented-lambda-ring
- mathlib:Ideal.span

**Uses.**

- K-book II Corollary 4.7.1 and Proposition 4.9: F¹ = K̃₀(R), F² = SK₀(R) and the Adams action on the graded pieces
- KTheoryLowDegrees:Z.3/gamma-filtration-two and Z.3/gamma-first-graded: the first two steps compared with rank and determinant kernels
- SchemeKTheoryOperations:S.7/scheme-gamma-filtration and S.7/gamma-first-graded-pieces: the scheme γ-filtration restricts to this one on affine schemes
- SchemeKTheoryOperations:S.6 (Soulé's γ-filtration on K(A)): the filtration of the augmented λ-ring on the degree-zero part

**Public API.**

- TauCeti.LambdaRing.gammaFiltration (constructor): F^n_γ K as an Ideal K.
- TauCeti.LambdaRing.gamma_prod_mem_gammaFiltration (constructor): A weighted product of total weight ≥ n lies in F^n_γ (Z.3/gamma-filtration-generators).
- TauCeti.LambdaRing.gammaFiltration_zero (simp): F⁰_γ = ⊤ (Z.3/gamma-filtration-zero).
- TauCeti.LambdaRing.gammaFiltration_one (characterisation): F¹_γ = ker ε (Z.3/gamma-filtration-one).
- TauCeti.LambdaRing.gammaFiltration_antitone (structure): F^{n+1}_γ ≤ F^n_γ.
- TauCeti.LambdaRing.gammaFiltration_mul (structure): F^i_γ · F^j_γ ≤ F^{i+j}_γ (Z.3/gamma-filtration-mul).
- TauCeti.LambdaRing.gammaFiltration_eq_span (characterisation): Under the idempotent hypothesis, F^n_γ equals the additive span of the weighted products (Z.3/gamma-filtration-eq-span).
- TauCeti.LambdaRing.gammaFiltration_map (functoriality): An augmented pre-λ-ring homomorphism maps F^n_γ into F^n_γ.
- TauCeti.RingK0.gammaFiltration_two (characterisation): For K₀(R): F²_γ = SK₀(R) (Z.3/gamma-filtration-two).

**Unit tests.**

- TauCeti.LambdaRing.gammaFiltration_zero_test (degenerate): F⁰_γ K = K (empty product); for K = ℤ with H = ℤ, F¹_γ = 0.
- TauCeti.LambdaRing.gammaFiltration_weight_two_test (characterisation): γ²(x) ∈ F²_γ for x ∈ ker ε: the weight counts degrees, not factors.
- TauCeti.LambdaRing.gammaFiltration_product_test (compatibility): (ker ε)ⁿ ⊆ F^n_γ; for the monoid λ-ring ℤ[u, u^{−1}] with ε(u) = 1, F^n_γ = ((u − 1))ⁿ (Weibel Ex. II.4.3 and II.4.4(a)).
- TauCeti.LambdaRing.gammaFiltration_not_finite_test (non-example): For K = ℤ[σ]/(σ² − 1) = ℤ[C₂] with σ a line element and ε(σ) = 1: F^n_γ = 2^{n−1}(σ − 1)ℤ ≠ 0 for all n ≥ 1 (Weibel Example 4.8.3), so the filtration need not be finite and F^n_γ is not F¹_γ for n ≥ 2.
- TauCeti.RingK0.gammaFiltration_ringK0_test (computation): For R = ℤ[√−5]: F¹_γ K₀(R)/F²_γ K₀(R) ≅ Pic(R) ≅ ℤ/2 (Z.3/gamma-first-graded with Z.4), so F²_γ ≠ F¹_γ.

**Sources.**

- Kbook.II, II §4, the γ-filtration, p. 30. Weibel's definition, for n ≥ 2, as the ideal generated by weighted products (text layer; rendered F^n_γK, x_i ∈ K̃, Σk_i ≥ n).
- Kbook.II, II §4, the γ-filtration, p. 30. The first two steps, which the uniform formula reproduces.
- Soule.1985, §1.5 (p. 493). Soulé's γ-filtration of the augmented λ-ring K(A), defined with additive subgroups; Z.3/gamma-filtration-eq-span compares the two forms.

### Membership of a weighted generator

**KTheoryLowDegrees:Z.3/gamma-filtration-generators** · lemma · implementation unchecked.

In the situation of Z.3/gamma-filtration, every weighted product γ^{k₁}(x₁)⋯γ^{k_m}(x_m) with x_j ∈ ker ε and Σ k_j ≥ n lies in F^n_γ K; in particular γ^k(x) ∈ F^n_γ K for x ∈ ker ε and k ≥ n.

**Hypotheses.**

- (K, H, ε) is an augmented pre-λ-ring with λ^k(1) = 0 for k ≥ 2.

**Construction or proof.**

- Apply the existing subset-of-ideal-span inclusion to the displayed witness.

**Acceptance.**

- γ³(x) ∈ F²_γ for x ∈ ker ε.
- x·γ²(y) ∈ F³_γ for x, y ∈ ker ε.

**Prerequisites.**

- KTheoryLowDegrees:Z.3/gamma-filtration

**Sources.**

- Kbook.II, II §4, the γ-filtration, p. 30. The generators lie in the filtration.

### Zeroth filtration ideal

**KTheoryLowDegrees:Z.3/gamma-filtration-zero** · lemma · implementation unchecked.

In the situation of Z.3/gamma-filtration, F⁰_γ K = K.

**Hypotheses.**

- (K, H, ε) is an augmented pre-λ-ring with λ^k(1) = 0 for k ≥ 2.

**Construction or proof.**

- The empty product is 1 and its empty total weight is 0. An ideal containing 1 is the whole ring.

**Acceptance.**

- For the zero ring, F⁰_γ = 0 = K.
- F⁰_γ ≠ F¹_γ for K₀ of a nonzero ring, since [R] ∉ I_R.

**Prerequisites.**

- KTheoryLowDegrees:Z.3/gamma-filtration-generators

**Sources.**

- Kbook.II, II §4, the γ-filtration, p. 30. The zeroth step.

### First filtration ideal

**KTheoryLowDegrees:Z.3/gamma-filtration-one** · theorem · implementation unchecked.

Let (K, H, ε) be an augmented pre-λ-ring with λ^k(1) = 0 for k ≥ 2. Then F¹_γ K = ker ε, and F⁰_γ/F¹_γ ≅ H via ε. For K₀(R): F¹_γ K₀(R) = I_R = K̃₀(R) and F⁰_γ/F¹_γ ≅ H⁰(Spec R, ℤ) (Weibel Corollary 4.7.1, first part).

**Hypotheses.**

- (K, H, ε) is an augmented pre-λ-ring with λ^k(1) = 0 for k ≥ 2.

**Construction or proof.**

- ⊆: a product of positive weight has at least one factor γ^{k}(x) with k ≥ 1 and x ∈ ker ε, which lies in ker ε (Z.3/gamma-rank-zero); ker ε is an ideal, so the ideal span lies in it.
- ⊇: for x ∈ ker ε the one-factor product γ¹(x) = x (Z.3/gamma-one) is a generator of weight one (Z.3/gamma-filtration-generators).
- ε is surjective onto H (it is the identity on H), so K/ker ε ≅ H.

**Acceptance.**

- For a field k, F¹_γ K₀(k) = 0.
- For R = ℤ[√−5], [I] − [R] ∈ F¹_γ for I = (2, 1 + √−5).

**Prerequisites.**

- KTheoryLowDegrees:Z.3/gamma-filtration
- KTheoryLowDegrees:Z.3/gamma-rank-zero
- KTheoryLowDegrees:Z.3/gamma-one
- KTheoryLowDegrees:Z.3/gamma-filtration-generators
- KTheoryLowDegrees:Z.3/augmented-lambda-ring
- KTheoryLowDegrees:Z.3/ring-k0-augmented

**Sources.**

- Kbook.II, II Corollary 4.7.1, p. 31. The first half of Corollary 4.7.1; the second half is Z.3/gamma-filtration-two.

### Multiplicativity of the gamma filtration

**KTheoryLowDegrees:Z.3/gamma-filtration-mul** · theorem · implementation unchecked.

In the situation of Z.3/gamma-filtration, F^i_γ K · F^j_γ K ⊆ F^{i+j}_γ K for all i, j ≥ 0; in particular (ker ε)ⁿ ⊆ F^n_γ K and each F^n_γ/F^{n+1}_γ is a module over K/F¹_γ ≅ H.

**Hypotheses.**

- (K, H, ε) is an augmented pre-λ-ring with λ^k(1) = 0 for k ≥ 2.

**Construction or proof.**

- The product of two weighted generators is a weighted generator (concatenate the finite index sets); the weights add.
- The product of two ideal spans is the span of the products of generators (Ideal.span_mul_span).

**Acceptance.**

- For x, y ∈ ker ε: xy ∈ F²_γ.
- In ℤ[C₂]: (σ − 1)² = −2(σ − 1) ∈ F²_γ.

**Prerequisites.**

- KTheoryLowDegrees:Z.3/gamma-filtration
- KTheoryLowDegrees:Z.3/gamma-filtration-generators
- mathlib:Ideal.span_mul_span

**Sources.**

- Kbook.II, II §4, the γ-filtration, p. 30. Multiplicativity of the filtration.

### The top exterior power is invertible

**KTheoryLowDegrees:Z.3/constant-rank-top-invertible** · lemma · implementation unchecked.

If P is a finitely generated projective R-module with rankAtStalk P p = n for every prime p, then ⋀ⁿP is an invertible R-module in Mathlib's sense (Module.Invertible R (⋀[R]^n P): the evaluation (⋀ⁿP)^∨ ⊗ ⋀ⁿP → R is bijective), finitely generated projective of constant rank one. For n = 0 it is R.

**Hypotheses.**

- R is a commutative unital ring; the zero ring is allowed.

**Construction or proof.**

- ⋀ⁿP is finitely generated projective (Z.3/projective-exterior-power) and localises to ⋀ⁿ of the free module P_p of rank n (Z.3/exterior-base-change, Z.2/local-freeness), which is free of rank one (exteriorPower.finrank_eq; tauceti:exteriorPower.topEquiv for a chosen basis).
- By Z.3/projective-dual-base-change the localisation at a maximal ideal 𝔪 of the evaluation map (⋀ⁿP)^∨ ⊗ ⋀ⁿP → R is the evaluation map of the free rank-one module (⋀ⁿP)_𝔪 over R_𝔪, which is an isomorphism.
- A linear map that is bijective at every maximal ideal is bijective (bijective_of_isLocalized_maximal); this is the defining property of Module.Invertible.

**Acceptance.**

- P = Rⁿ: ⋀ⁿP ≅ R on e₁ ∧ ⋯ ∧ eₙ (exteriorPower.topEquiv).
- P of rank zero is 0 and ⋀⁰0 = R.
- For R = ℤ[√−5] and P = I ⊕ R with I = (2, 1 + √−5): ⋀²P ≅ I is invertible but not free (Z.2/nonfree-projective-ideal).

**Prerequisites.**

- KTheoryLowDegrees:Z.3/projective-exterior-power
- KTheoryLowDegrees:Z.3/exterior-base-change
- KTheoryLowDegrees:Z.3/projective-dual-base-change
- KTheoryLowDegrees:Z.2/local-freeness
- mathlib:exteriorPower.finrank_eq
- tauceti:exteriorPower.topEquiv
- mathlib:bijective_of_isLocalized_maximal
- mathlib:Module.Invertible

**Sources.**

- Kbook.I, I §3, p. 16. The determinant line bundle of a constant-rank projective.
- Kbook.I, I §3, Lemma 3.1, p. 16. The local-to-global step used for the evaluation map.

### Componentwise determinant of a projective

**KTheoryLowDegrees:Z.3/determinant-projective** · construction · implementation unchecked.

For a finitely generated projective R-module P, let R ≅ ∏_{i=1}^{c} R_i be the decomposition along the rank fibres U_i = {rankAtStalk P = n_i} (Z.2/rank-fibre-decomposition; e_i the corresponding idempotents, P ≅ ∏ P_i with P_i = e_iP of constant rank n_i over R_i). Define det(P) := Pic.mk(∏_i ⋀^{n_i}_{R_i} P_i) ∈ Pic(R): the class of the R-module (⋀^{n₁}P₁) × ⋯ × (⋀^{n_c}P_c), which is invertible. If P has constant rank n this is Pic.mk(⋀ⁿP). Refining the partition by clopens does not change the class, so any finite clopen partition on whose pieces P has constant rank may be used.

**Hypotheses.**

- R is a commutative unital ring; the zero ring is allowed.

**Construction or proof.**

- Each ⋀^{n_i}_{R_i}P_i is an invertible R_i-module (Z.3/constant-rank-top-invertible over R_i).
- A finite product of invertible modules over the factors of R ≅ ∏ R_i is an invertible R-module: its tensor inverse is the product of the duals (Z.3/pic-product-decomposition).
- Refinement: if U = ⊔ V_j refines the fibre U_i, then ⋀^{n_i}_{R_i}P_i ≅ ∏_j ⋀^{n_i}_{R_{V_j}}(P_i)_{V_j} by Z.3/exterior-base-change along R_i → R_{V_j} and the product decomposition; regroup the finite product.

**Acceptance.**

- det(0) = 1 and det(Rⁿ) = 1.
- For R = k × k and P = k × k²: det(P) = [k × ⋀²k²] = [R] = 1, whereas ⋀²P = 0 × k is not invertible.

**Prerequisites.**

- KTheoryLowDegrees:Z.3/constant-rank-top-invertible
- KTheoryLowDegrees:Z.3/exterior-base-change
- KTheoryLowDegrees:Z.3/pic-product-decomposition
- KTheoryLowDegrees:Z.2/rank-fibre-decomposition
- mathlib:CommRing.Pic
- mathlib:CommRing.Pic.mk

**Uses.**

- K-book II Proposition 2.6: det(P ⊕ Q) ≅ det P ⊗ det Q, so det descends to K₀(R) → Pic(R)
- KTheoryLowDegrees:Z.4/rank-pic-equivalence: distinguishes a nonprincipal invertible ideal from a free module of the same rank
- SchemeKTheoryOperations:S.6/degree-zero-comparison: for an actual projective P of constant rank r, λ^r[P]=[Λ^rP] in K₀(R), whereas det(P)=Pic.mk(Λ^rP) in Pic(R).

**Public API.**

- TauCeti.RingK0.detProjective (constructor): det(P) ∈ Pic(R) for finitely generated projective P.
- TauCeti.RingK0.detProjective_congr (functoriality): P ≃ₗ Q → det(P) = det(Q) (Z.3/determinant-congr).
- TauCeti.RingK0.detProjective_free (simp): det(Rⁿ) = 1 (Z.3/determinant-free).
- TauCeti.RingK0.detProjective_line (compatibility): For invertible L: det(L) = Pic.mk L (Z.3/determinant-line).
- TauCeti.RingK0.detProjective_prod (structure): det(P × Q) = det(P)·det(Q) (Z.3/determinant-sum).
- TauCeti.RingK0.detProjective_of_constant_rank (characterisation): If P has constant rank n, det(P) = Pic.mk(⋀ⁿP).
- TauCeti.RingK0.detProjective_baseChange (functoriality): det(S ⊗ P) = Pic.mapAlgebra (det P) (Z.3/determinant-base-change).

**Unit tests.**

- TauCeti.RingK0.detProjective_zero_test (degenerate): det(0) = 1 (every rank is 0 and ⋀⁰0 = R).
- TauCeti.RingK0.detProjective_free_test (computation): det(Rⁿ) = 1 for every n ≥ 0.
- TauCeti.RingK0.detProjective_ideal_test (computation): For R = ℤ[√−5] and I = (2, 1 + √−5): det(I ⊕ R) = Pic.mk I ≠ 1.
- TauCeti.RingK0.detProjective_disconnected_test (non-example): For R = k × k and P = k × k²: det(P) = 1, while ⋀^{max rank}P = ⋀²P = 0 × k is not invertible; a definition using one global exponent fails on a disconnected spectrum.
- TauCeti.RingK0.detProjective_line_test (compatibility): det(L) = Pic.mk L for every invertible L.

**Sources.**

- Kbook.I, I §3, pp. 16–17. The componentwise definition.
- Kbook.I, I §3, p. 17. The componentwise recipe itself.

### Determinant isomorphism invariance

**KTheoryLowDegrees:Z.3/determinant-congr** · lemma · implementation unchecked.

If P ≃ₗ[R] Q are isomorphic finitely generated projective R-modules then det(P) = det(Q) in Pic(R).

**Hypotheses.**

- R is a commutative unital ring; the zero ring is allowed.

**Construction or proof.**

- An isomorphism preserves rankAtStalk (Module.rankAtStalk_eq_of_equiv), hence the rank fibres; on each fibre exteriorPower.map of the isomorphism is an isomorphism of top exterior powers (exteriorPower.map_comp, exteriorPower.map_id).
- Isomorphic invertible modules have equal Pic classes (CommRing.Pic.mk_eq_mk_iff).

**Acceptance.**

- det(P) depends only on the isomorphism class; for P ≅ Rⁿ, det(P) = 1.
- For invertible L ≅ L′, Pic.mk L = Pic.mk L′.

**Prerequisites.**

- KTheoryLowDegrees:Z.3/determinant-projective
- mathlib:Module.rankAtStalk_eq_of_equiv
- mathlib:exteriorPower.map_comp
- mathlib:exteriorPower.map_id
- mathlib:CommRing.Pic.mk_eq_mk_iff

**Sources.**

- Kbook.I, I §3, p. 17. Naturality of the top exterior power.

### Determinant of a free module

**KTheoryLowDegrees:Z.3/determinant-free** · lemma · implementation unchecked.

det(Rⁿ) = 1 in Pic(R) for every n ≥ 0; more generally det(P) = 1 whenever P is free of finite rank.

**Hypotheses.**

- R is a commutative unital ring; the zero ring is allowed.

**Construction or proof.**

- A basis of Rⁿ identifies ⋀ⁿRⁿ with R on e₁ ∧ ⋯ ∧ eₙ (tauceti:exteriorPower.topEquiv); on the zero ring every class is 1.
- Pic.mk of a module isomorphic to R is 1 (CommRing.Pic.mk_eq_one_iff, whose unit normalisation is CommRing.Pic.mk_self).

**Acceptance.**

- det(R⁰) = det(0) = 1.
- det(R³) = 1.

**Prerequisites.**

- KTheoryLowDegrees:Z.3/determinant-projective
- tauceti:exteriorPower.topEquiv
- mathlib:CommRing.Pic.mk_eq_one_iff
- mathlib:CommRing.Pic.mk_self

**Sources.**

- Kbook.I, I §3, p. 16, fact (i). The top exterior power of a free module.

### Determinant of an invertible module

**KTheoryLowDegrees:Z.3/determinant-line** · lemma · implementation unchecked.

For an invertible R-module L (Module.Invertible R L): det(L) = Pic.mk L.

**Hypotheses.**

- R is a commutative unital ring; the zero ring is allowed.

**Construction or proof.**

- L has constant rank one (RingK0.rank_of_invertible of Z.2/rank-hom), so det(L) = Pic.mk(⋀¹L), and ⋀¹L ≅ L (exteriorPower.oneEquiv).

**Acceptance.**

- det(R) = 1.
- For I = (2, 1 + √−5) ⊂ ℤ[√−5], det(I) = Pic.mk I ≠ 1.

**Prerequisites.**

- KTheoryLowDegrees:Z.3/determinant-projective
- KTheoryLowDegrees:Z.2/rank-hom
- mathlib:exteriorPower.oneEquiv
- mathlib:CommRing.Pic.mk_eq_mk_iff

**Sources.**

- Kbook.I, I §3, p. 17. The determinant of a line bundle (and of L ⊕ Rⁿ) is L.

### Determinant of a direct sum

**KTheoryLowDegrees:Z.3/determinant-sum** · lemma · implementation unchecked.

For finitely generated projective R-modules P, Q: det(P × Q) = det(P)·det(Q) in Pic(R).

**Hypotheses.**

- R is a commutative unital ring; the zero ring is allowed.

**Construction or proof.**

- Choose a finite clopen partition of Spec R on whose pieces both P and Q have constant rank (refine the two rank-fibre decompositions, Z.2/rank-fibre-decomposition); by the refinement clause of Z.3/determinant-projective both sides may be computed piecewise, so assume ranks m and n are constant.
- By the Sum Formula (Z.3/exterior-direct-sum) ⋀^{m+n}(P × Q) ≅ ⊕_{i+j=m+n} ⋀ⁱP ⊗ ⋀ʲQ; every summand with i > m or j > n vanishes (Z.3/exterior-above-rank), leaving ⋀ᵐP ⊗ ⋀ⁿQ (with the factors in this order: sourceIssues KTheoryLowDegrees/E2).
- Pic.mk of a tensor product is the product (CommRing.Pic.mk_tensor).

**Acceptance.**

- Adding a rank-zero summand: det(P × 0) = det(P).
- det(L × L′) = Pic.mk(L ⊗ L′) for invertible L, L′.

**Prerequisites.**

- KTheoryLowDegrees:Z.3/determinant-projective
- KTheoryLowDegrees:Z.3/exterior-direct-sum
- KTheoryLowDegrees:Z.3/exterior-above-rank
- KTheoryLowDegrees:Z.2/rank-fibre-decomposition
- mathlib:CommRing.Pic.mk_tensor

**Sources.**

- Kbook.II, II Proposition 2.6 and proof, p. 11. The additivity of det, with Weibel's reduction to constant rank; the proof's summand is corrected as recorded in sourceIssues (E2).

### Determinant homomorphism on K₀

**KTheoryLowDegrees:Z.3/determinant-hom** · construction · implementation unchecked.

det : K₀(R) → Pic(R) is the unique homomorphism from the additive group of K₀(R) to the multiplicative group Pic(R) (tensor product as group law) with det([P]) = det(P) for finitely generated projective P; so det(x + y) = det(x)det(y), det(−x) = det(x)^{−1}, det([P] − [Q]) = det(P)det(Q)^{−1}. It is a group homomorphism K₀(R) → Pic(R); no multiplication on Pic(R) is introduced and det is not a ring homomorphism (Z.3/determinant-mul gives det(xy)). It is surjective (Z.3/determinant-surjective), vanishes on H⁰(Spec R, ℤ) = image of rankSection, and for an actual finite projective P of constant rank r≥0, det([P])=Pic.mk(Λ^r P), while λ^r([P]) is the K₀-class of that invertible module. This top-exterior formula does not apply to arbitrary virtual classes of constant rank.

**Hypotheses.**

- R is a commutative unital ring; the zero ring is allowed.

**Construction or proof.**

- Isomorphism invariance (Z.3/determinant-congr) and additivity on biproducts (Z.3/determinant-sum) make P ↦ det(P) an additive invariant with values in Additive (Pic R).
- Apply the universal property of split K₀ (TauCeti.SplitK0.liftEquiv); uniqueness and the formulas for sums and differences follow from the group-homomorphism laws.
- Vanishing on rankSection: det of a componentwise free module is 1 (Z.3/determinant-free on each clopen piece).

**Acceptance.**

- det(n[R]) = 1 and det([L] − [R]) = Pic.mk L.
- det(2[L]) = Pic.mk(L ⊗ L).

**Prerequisites.**

- KTheoryLowDegrees:Z.3/determinant-congr
- KTheoryLowDegrees:Z.3/determinant-sum
- KTheoryLowDegrees:Z.3/determinant-free
- tauceti:TauCeti.SplitK0.liftEquiv

**Uses.**

- KTheoryLowDegrees:Z.4/rank-pic-equivalence: the determinant coordinate of K₀(A) ≅ ℤ ⊕ Pic(A)
- KTheoryLowDegrees:Z.3/gamma-filtration-two and Z.3/gamma-first-graded: F²_γ = ker(rank, det) and the inverse of Pic(R) ≅ F¹/F²
- SchemeKTheoryOperations:S.7/gamma-first-graded-pieces: the affine case of det on K₀(Vect X)

**Public API.**

- TauCeti.RingK0.detHom_of (simp): det([P])=detProjective(P).
- TauCeti.RingK0.det_add (structure): det(x+y)=det(x)det(y).
- TauCeti.RingK0.det_neg (structure): det(−x)=det(x)⁻¹.
- TauCeti.RingK0.det_rankSection (simp): det(rankSection f) = 1 for every f ∈ H⁰(Spec R, ℤ).
- TauCeti.RingK0.det_mul (relation): det(xy) = det(x)^{rank y}·det(y)^{rank x} (Z.3/determinant-mul).
- TauCeti.RingK0.det_map (functoriality): det(map f x) = Pic.mapRingHom f (det x) (Z.3/determinant-base-change).
- TauCeti.RingK0.detHom_unique (universal-property): Any additive-to-multiplicative homomorphism K₀(R)→Pic(R) agreeing with detProjective on every finite projective class equals detHom.

**Unit tests.**

- TauCeti.RingK0.det_zero_test (degenerate): det(0) = 1.
- TauCeti.RingK0.det_free_test (computation): det(n[R]) = 1 for all n ∈ ℤ.
- TauCeti.RingK0.det_line_test (compatibility): det([L]) = Pic.mk L for every invertible L, so det is surjective onto Mathlib's CommRing.Pic R.
- TauCeti.RingK0.det_not_multiplicative_test (non-example): For invertible L and y = 2[R]: det([L]·y) = det([L ⊕ L]) = Pic.mk(L ⊗ L), while det([L])·det(y) = Pic.mk L; so det(xy) ≠ det(x)det(y) whenever L ⊗ L ≇ L, i.e. whenever L ≇ R.
- TauCeti.RingK0.det_virtual_rank_zero_test (non-example): For an invertible L with Pic.mk L≠1, x=[L]−[R] has rank zero and det(x)=Pic.mk L≠1, but λ⁰(x)=1. Thus determinant of a virtual class cannot be computed as the exterior coefficient indexed by its rank.

**Sources.**

- Kbook.II, II Proposition 2.6, p. 11. The determinant homomorphism.

### Determinant of an object class

**KTheoryLowDegrees:Z.3/determinant-hom-of** · lemma · implementation unchecked.

For every finitely generated projective P: det([P]) = det(P); for invertible L, det([L]) = Pic.mk L.

**Hypotheses.**

- R is a commutative unital ring; the zero ring is allowed.

**Construction or proof.**

- Evaluate the existing universal additive lift on P.

**Acceptance.**

- det([R²]) = 1.
- det([I ⊕ R]) = Pic.mk I for I = (2, 1 + √−5) ⊂ ℤ[√−5].

**Prerequisites.**

- KTheoryLowDegrees:Z.3/determinant-hom
- KTheoryLowDegrees:Z.3/determinant-line
- tauceti:TauCeti.SplitK0.liftEquiv

**Sources.**

- Kbook.II, II Proposition 2.6, p. 11. The value on object classes.

### Surjectivity of the determinant

**KTheoryLowDegrees:Z.3/determinant-surjective** · theorem · implementation unchecked.

det : K₀(R) → Pic(R) is surjective: for every class c ∈ Pic(R), represented by an invertible module L (CommRing.Pic.mk), det([L]) = c.

**Hypotheses.**

- R is a commutative unital ring; the zero ring is allowed.

**Construction or proof.**

- Represent c∈Pic(R) by its native AsModule carrier. Module.Invertible makes it finite projective; determinant-line identifies det([c.AsModule]) with Pic.mk R c.AsModule, and the pinned CommRing.Pic.mk_eq_self identifies that class with c. CommRing.Pic.mk_self is only the separate unit calculation Pic.mk R R=1.

**Acceptance.**

- For R = ℤ[√−5], the nontrivial class of Pic(R) ≅ ℤ/2 is det([I]) for I = (2, 1 + √−5).
- For a local ring every class is trivial and det is constant 1.

**Prerequisites.**

- KTheoryLowDegrees:Z.3/determinant-hom-of
- KTheoryLowDegrees:Z.3/determinant-line
- mathlib:Module.Invertible
- mathlib:CommRing.Pic.mk_eq_self

**Sources.**

- Kbook.II, II Proposition 2.6, p. 11. Surjectivity, using the actual invertible representative.

### Rank is a ring homomorphism

**KTheoryLowDegrees:Z.3/rank-ring-hom** · lemma · implementation unchecked.

The rank rank : K₀(R) → H⁰(Spec R, ℤ) = LocallyConstant (PrimeSpectrum R) ℤ of Z.2/rank-hom is a ring homomorphism for the ring structure of Z.3/finite-projective-monoidal: rank(1) = 1 and rank(xy) = rank(x)·rank(y) for all x, y ∈ K₀(R).

**Hypotheses.**

- R is a commutative unital ring; the zero ring is allowed.

**Construction or proof.**

- rank[R] = 1 (API rank_one of Z.2/rank-hom).
- For finitely generated projective P, Q: rank[P ⊗ Q] = rankAtStalk(P ⊗ Q) = rankAtStalk P · rankAtStalk Q (mathlib:Module.rankAtStalk_tensorProduct), and [P]·[Q] = [P ⊗ Q] (Z.3/finite-projective-monoidal).
- Both (x, y) ↦ rank(xy) and (x, y) ↦ rank(x)rank(y) are biadditive and agree on pairs of object classes; two additive maps out of K₀(R) that agree on object classes are equal (tauceti:TauCeti.SplitK0.hom_ext), applied in each variable.

**Acceptance.**

- rank(2[R]·3[R]) = 6.
- For R = k × k: rank([k × 0]·[0 × k]) = rank(0) = 0 = (1, 0)·(0, 1).
- rank([L]·[L^∨]) = 1 for invertible L.

**Prerequisites.**

- KTheoryLowDegrees:Z.2/rank-hom
- KTheoryLowDegrees:Z.3/finite-projective-monoidal
- mathlib:Module.rankAtStalk_tensorProduct
- tauceti:TauCeti.SplitK0.hom_ext

**Sources.**

- Kbook.II, II §2, Rank and H⁰, p. 8. Rank is a semiring map on P(R), hence a ring map on K₀(R); this is the lemma the companion packet's restructure entry assigns to Z.3.

### Scalar extension is a ring homomorphism on K₀

**KTheoryLowDegrees:Z.3/map-ring-hom** · lemma · implementation unchecked.

For a homomorphism of commutative rings f : R → S, the additive map RingK0.map f : K₀(R) → K₀(S), [P] ↦ [S ⊗[R] P] (Z.1/ring-k0-map), is a ring homomorphism: map f [R] = [S] and map f (xy) = map f (x)·map f (y). It is compatible with rank: rank_S(map f x) = rank_R(x) ∘ Spec(f) (Z.2/rank-base-change).

**Hypotheses.**

- R is a commutative unital ring; the zero ring is allowed.
- S is a commutative ring and f : R →+* S.

**Construction or proof.**

- map f [R] = [S] (API map_one of Z.1/ring-k0-map).
- For finitely generated projective P, Q: S ⊗[R] (P ⊗[R] Q) ≅ (S ⊗[R] P) ⊗[S] (S ⊗[R] Q) (mathlib:TensorProduct.AlgebraTensorModule.distribBaseChange), so map f [P ⊗ Q] = map f [P]·map f [Q] by Z.3/finite-projective-monoidal over R and over S.
- Both sides are biadditive; conclude with tauceti:TauCeti.SplitK0.hom_ext in each variable.

**Acceptance.**

- For R → R_p (localisation), map f is the ring map K₀(R) → K₀(R_p) ≅ ℤ, x ↦ rank(x)(p).
- For R = k × k and f the first projection: map f [k × 0] = [k] and map f [0 × k] = 0.

**Prerequisites.**

- KTheoryLowDegrees:Z.1/ring-k0-map
- KTheoryLowDegrees:Z.2/rank-base-change
- KTheoryLowDegrees:Z.3/finite-projective-monoidal
- mathlib:TensorProduct.AlgebraTensorModule.distribBaseChange
- tauceti:TauCeti.SplitK0.hom_ext

**Sources.**

- Kbook.II, II §2, p. 5. Base change is a ring homomorphism on K₀.

### Scalar extension commutes with the λ-operations

**KTheoryLowDegrees:Z.3/lambda-base-change** · lemma · implementation unchecked.

For a homomorphism of commutative rings f : R → S and every x ∈ K₀(R), n ≥ 0: map f (λⁿx) = λⁿ(map f x); equivalently λ_t ∘ map f = (PowerSeries.map (map f)) ∘ λ_t. Hence map f is a pre-λ-ring homomorphism (Z.3/pre-lambda-ring), commutes with the γⁿ and ψᵏ, and preserves the augmentation ideals and γ-filtrations.

**Hypotheses.**

- R is a commutative unital ring; the zero ring is allowed.
- S is a commutative ring and f : R →+* S.

**Construction or proof.**

- On an object class: map f [⋀ⁿP] = [S ⊗ ⋀ⁿP] = [⋀ⁿ_S(S ⊗ P)] = λⁿ(map f [P]) (Z.3/exterior-base-change, Z.3/lambda-of).
- x ↦ PowerSeries.map (map f) (λ_t x) and x ↦ λ_t(map f x) are homomorphisms from (K₀(R), +) to the multiplicative group 1 + tK₀(S)[[t]] (PowerSeries.map of the ring homomorphism map f, Z.3/map-ring-hom, is multiplicative); they agree on object classes, so they are equal (tauceti:TauCeti.SplitK0.hom_ext).
- Compatibility with γ and ψ: both are defined from the λⁿ by universal formulas (Z.3/gamma, Z.3/adams-operations).

**Acceptance.**

- For f : R → R/𝔪, λⁿ of a class maps to C(r, n) times the class of the residue field, r the rank at 𝔪.
- map f (λ²(−[R])) = [S] = λ²(−[S]).

**Prerequisites.**

- KTheoryLowDegrees:Z.3/exterior-base-change
- KTheoryLowDegrees:Z.3/lambda-of
- KTheoryLowDegrees:Z.3/total-lambda
- KTheoryLowDegrees:Z.3/map-ring-hom
- KTheoryLowDegrees:Z.1/ring-k0-map
- tauceti:TauCeti.SplitK0.hom_ext
- mathlib:PowerSeries.map

**Sources.**

- Kbook.I, I §3, p. 16, fact (ii). The object-level input; the node extends it to virtual classes.

### The exterior filtration of an extension

**KTheoryLowDegrees:Z.3/exterior-extension-filtration** · construction · implementation unchecked.

Let 0 → M′ →ι M →π M″ → 0 be an exact sequence of R-modules and n ≥ 0. For 0 ≤ i ≤ n + 1 let Fⁱ ⊆ ⋀ⁿM be the image of the R-linear map ⋀ⁱM′ ⊗ ⋀^{n−i}M → ⋀ⁿM, a ⊗ b ↦ (⋀ⁱι)(a) ∧ b (multiplication in the graded exterior algebra of M), with F^{n+1} := 0. Then ⋀ⁿM = F⁰ ⊇ F¹ ⊇ ⋯ ⊇ Fⁿ ⊇ F^{n+1} = 0. The filtration is defined without choosing a splitting; it is natural for morphisms of short exact sequences and compatible with scalar extension along R → S in the following image sense: under S ⊗[R] ⋀ⁿM ≅ ⋀ⁿ_S(S ⊗[R] M), the image of S ⊗[R] Fⁱ in the ambient exterior power is the filtration defined by the base-changed first map S ⊗[R] ι. The map onto that image is an isomorphism if S is flat over R or the original sequence splits (in particular if M″ is projective). Arbitrary scalar extension need not preserve the original injection. For vector bundles the filtration is defined locally and glues.

**Hypotheses.**

- R is a commutative unital ring; the zero ring is allowed.
- The sequence is exact; no finiteness, flatness or splitting is needed for the definition. The identification of the graded pieces (Z.3/exterior-extension-graded) needs M″ projective.

**Construction or proof.**

- The map is the restriction to ⋀ⁱM′ ⊗ ⋀^{n−i}M of exterior multiplication, which sends ⋀ⁱM × ⋀ʲM into ⋀^{i+j}M (mathlib:ExteriorAlgebra.gradedAlgebra), precomposed with ⋀ⁱι (mathlib:exteriorPower.map).
- Fⁱ⁺¹ ⊆ Fⁱ: ι(m₁) ∧ ⋯ ∧ ι(m_{i+1}) ∧ b = (ι(m₁) ∧ ⋯ ∧ ι(m_i)) ∧ (ι(m_{i+1}) ∧ b) (associativity, mathlib:ExteriorAlgebra.ιMulti_mul_ιMulti).
- F⁰ = ⋀ⁿM (i = 0: the map is ⋀⁰M′ ⊗ ⋀ⁿM ≅ ⋀ⁿM) and F^{n+1} = 0 by definition; Fⁱ for i > rank of M′ vanishes when M′ is projective of that rank (Z.3/exterior-above-rank).
- Naturality follows from exterior multiplication and exteriorPower.map. Under the exterior-base-change comparison, the base-changed defining map has the same range as S ⊗[R] Fⁱ → S ⊗[R] ⋀ⁿM, because S ⊗[R] − preserves the surjection from the defining source onto Fⁱ. This proves the image equality, not injectivity of S ⊗[R] Fⁱ in the ambient module. Flatness of S preserves that injection; a split original sequence also makes Fⁱ a direct summand via exterior-direct-sum. No exactness of an arbitrary base-changed short exact sequence is asserted.

**Acceptance.**

- M′ = 0: F⁰ = ⋀ⁿM and Fⁱ = 0 for i ≥ 1.
- M = R², M′ = Re₁, n = 2: F⁰ = F¹ = ⋀²R² = R(e₁ ∧ e₂) and F² = 0.

**Prerequisites.**

- mathlib:ExteriorAlgebra.gradedAlgebra
- mathlib:ExteriorAlgebra.ιMulti_mul_ιMulti
- mathlib:exteriorPower.map
- KTheoryLowDegrees:Z.3/exterior-base-change
- KTheoryLowDegrees:Z.3/exterior-above-rank

**Uses.**

- K-book I Exercise 5.4 and II Proposition 8.8: λ_t(F) = λ_t(F′)λ_t(F″) for exact sequences of vector bundles, and det(F) ≅ det(F′) ⊗ det(F″)
- KTheoryLowDegrees:Z.3/representation-ring-of-gl: exterior powers of an extension of representations have an invariant filtration, so λ_t is additive on R_ℤ(G)
- SchemeKTheoryOperations:S.6/vector-bundle-lambda-ring and KTheoryLowDegrees:Z.5: the filtration on locally split sequences of vector bundles, glued from this canonical module filtration

**Public API.**

- TauCeti.exteriorExtensionFiltration (constructor): Fⁱ ⊆ ⋀ⁿM for a short exact sequence M′ → M → M″, as a Submodule.
- TauCeti.exteriorExtensionFiltration_antitone (structure): Fⁱ⁺¹ ≤ Fⁱ.
- TauCeti.exteriorExtensionFiltration_zero (simp): F⁰ = ⊤.
- TauCeti.exteriorExtensionFiltration_succ_n (simp): F^{n+1} = ⊥.
- TauCeti.exteriorExtensionFiltration_map (functoriality): A morphism of short exact sequences maps Fⁱ into Fⁱ.
- TauCeti.exteriorExtensionFiltration_baseChange (functoriality): Under S ⊗[R] ⋀ⁿM ≅ ⋀ⁿ_S(S ⊗[R] M), the image of S ⊗[R] Fⁱ is exteriorExtensionFiltration (ι.baseChange S) n i. The surjection onto this image is an isomorphism when S is flat over R or the original sequence splits, in particular when M″ is projective.
- TauCeti.exteriorExtensionFiltration_split (characterisation): For M = M′ × M″ with the split sequence, Fⁱ corresponds to ⊕_{j ≥ i} ⋀ʲM′ ⊗ ⋀^{n−j}M″ under the Sum Formula (Z.3/exterior-direct-sum).

**Unit tests.**

- TauCeti.exteriorExtensionFiltration_zero_sub_test (degenerate): For M′ = 0: F⁰ = ⋀ⁿM and Fⁱ = 0 for every i ≥ 1.
- TauCeti.exteriorExtensionFiltration_rank_two_test (computation): For 0 → Re₁ → R² → R → 0 and n = 2: F⁰ = F¹ = R(e₁ ∧ e₂), F² = 0.
- TauCeti.exteriorExtensionFiltration_split_test (compatibility): For the split sequence M′ → M′ × M″ → M″, Fⁱ is the image of ⊕_{j≥i} ⋀ʲM′ ⊗ ⋀^{n−j}M″ under the Sum Formula of Z.3/exterior-direct-sum.
- TauCeti.exteriorExtensionFiltration_not_splitting_test (non-example): Only the filtration is canonical, not a splitting: for 0 → Re₁ → R² → R → 0 and n = 1, F¹ = Re₁ and F⁰ = R², but a complement of F¹ such as the image of ⋀⁰M′ ⊗ ⋀¹s(M″) = R(e₂ + re₁) depends on the chosen section s.

**Sources.**

- Kbook.I, I Exercise 5.4, p. 52. The filtration for an exact sequence of locally free sheaves; the module version is this construction.
- Kbook.II, II Example 4.1.5, p. 26. The use of the filtration: additivity of λ_t on exact sequences of bundles.
- Stacks.0FIC.20260926, Lemma 45.13.1, proof, read 26 September 2026. The published online argument uses the exterior filtration to establish the lambda sum formula. The intrinsic image and lift-independence calculation here supplies its local details.

### Graded pieces of the exterior filtration

**KTheoryLowDegrees:Z.3/exterior-extension-graded** · theorem · implementation unchecked.

Let 0 → M′ →ι M →π M″ → 0 be an exact sequence of R-modules with M″ projective, n ≥ 0, and Fⁱ the filtration of Z.3/exterior-extension-filtration. For 0 ≤ i ≤ n the map ⋀ⁱM′ ⊗ ⋀^{n−i}M → Fⁱ → Fⁱ/Fⁱ⁺¹ factors through id ⊗ ⋀^{n−i}π and induces a canonical isomorphism ⋀ⁱM′ ⊗ ⋀^{n−i}M″ ≅ Fⁱ/Fⁱ⁺¹, independent of any splitting. Consequently, for finitely generated projective M′, M″: [⋀ⁿM] = Σ_{i=0}^{n} [⋀ⁱM′]·[⋀^{n−i}M″] in K₀(R), λ_t([M]) = λ_t([M′])λ_t([M″]), and det(M) = det(M′)·det(M″).

**Hypotheses.**

- R is a commutative unital ring; the zero ring is allowed.
- M″ is projective (so the sequence splits); without this the statement fails (acceptance).

**Construction or proof.**

- M″ projective gives a section s of π and an isomorphism M ≅ M′ × M″ (mathlib:LinearMap.exists_rightInverse_of_surjective).
- Under the Sum Formula (Z.3/exterior-direct-sum) Fⁱ corresponds to ⊕_{j ≥ i} ⋀ʲM′ ⊗ ⋀^{n−j}M″: expanding the second factor of a generator (⋀ⁱι)(a) ∧ b along M = ι(M′) ⊕ s(M″) gives only terms with at least i factors from M′, and every such summand is attained. Hence Fⁱ/Fⁱ⁺¹ ≅ ⋀ⁱM′ ⊗ ⋀^{n−i}M″.
- The composite ⋀ⁱM′ ⊗ ⋀^{n−i}M → Fⁱ/Fⁱ⁺¹ kills ⋀ⁱM′ ⊗ (ι(M′) ∧ ⋀^{n−i−1}M), whose image lies in Fⁱ⁺¹, and ⋀^{n−i}π is surjective with that kernel (computed in the split model), so the induced map ⋀ⁱM′ ⊗ ⋀^{n−i}M″ → Fⁱ/Fⁱ⁺¹ is defined without s; the split computation shows it is an isomorphism.
- For finitely generated projective M′, M″ the extension splits, so the class identity is Z.3/exterior-class-sum, λ_t is additive (Z.3/total-lambda) and det is additive (Z.3/determinant-sum); the filtration is what makes these identities canonical for nonsplit locally split sequences of bundles.

**Acceptance.**

- For 0 → Re₁ → R² → R → 0 and n = 2: F¹/F² ≅ ⋀¹(Re₁) ⊗ ⋀¹R ≅ R and F⁰/F¹ = 0 = ⋀⁰ ⊗ ⋀²R.
- The projectivity hypothesis is needed: for 0 → ℤ →(×2) ℤ → ℤ/2 → 0 and n = 2, ⋀²ℤ = 0, but ⋀¹ℤ ⊗ ⋀¹(ℤ/2) = ℤ/2 ≠ 0.
- det(M) ≅ det(M′) ⊗ det(M″) for an extension of projectives of constant ranks.

**Prerequisites.**

- KTheoryLowDegrees:Z.3/exterior-extension-filtration
- KTheoryLowDegrees:Z.3/exterior-direct-sum
- KTheoryLowDegrees:Z.3/exterior-class-sum
- KTheoryLowDegrees:Z.3/total-lambda
- KTheoryLowDegrees:Z.3/determinant-sum
- mathlib:LinearMap.exists_rightInverse_of_surjective

**Sources.**

- Kbook.I, I Exercise 5.4, p. 52. The statement (for locally free sheaves; the module case with projective quotient is the local form).
- Kbook.I, I Exercise 5.4, p. 52. The determinant consequence.
- Stacks.0FIC.20260926, Lemma 45.13.1, proof, read 26 September 2026. The published online argument uses the exterior filtration to establish the lambda sum formula. The intrinsic image and lift-independence calculation here supplies its local details.

### Pre-λ-rings

**KTheoryLowDegrees:Z.3/pre-lambda-ring** · definition · implementation unchecked.

A pre-λ-ring (Weibel's and Atiyah's 'λ-ring'; Grothendieck's 'pré-λ-anneau') is a commutative unital ring K with maps λⁿ : K → K (n ≥ 0) such that λ⁰(x) = 1, λ¹(x) = x and λⁿ(x + y) = Σ_{i=0}^{n} λⁱ(x)λ^{n−i}(y) for all x, y; equivalently λ_t(x) := Σ λⁿ(x)tⁿ is a homomorphism from (K, +) to the multiplicative group 1 + tK[[t]] whose t-coefficient is the identity. Terminology is fixed: this is Weibel's λ-ring and Grothendieck's pre-λ-ring; specialness is a separate structure.

**Hypotheses.**

- K is commutative with 1; the zero ring is allowed. The λⁿ are set maps.

**Construction or proof.**

- Define the structure with the three axioms; λ_t takes values in 1 + tK[[t]], a subgroup of the units of K[[t]] (mathlib:PowerSeries.isUnit_iff_constantCoeff), and the sum formula is the coefficient form of λ_t(x + y) = λ_t(x)λ_t(y) (mathlib:PowerSeries.coeff_mul).
- Conversely a homomorphism (K, +) → 1 + tK[[t]] with t-coefficient id defines a pre-λ-ring (constructor ofLambdaTotal).

**Acceptance.**

- ℤ with λⁿ(m) = C(m, n) is a pre-λ-ring (Z.3/binomial-lambda-ring).
- ℤ with λ_t(m) = (1 + t + t²)^m is a pre-λ-ring with λ²(1) = 1.

**Prerequisites.**

- mathlib:PowerSeries
- mathlib:PowerSeries.coeff
- mathlib:PowerSeries.coeff_mul
- mathlib:PowerSeries.isUnit_iff_constantCoeff

**Uses.**

- K-book II 4.1–4.5: K₀(R), K₀(X), KO(X), KU(X) and R(G) are λ-rings in this sense; γ and ψ are defined from the λⁿ
- KTheoryLowDegrees:Z.3/ring-k0-pre-lambda: the λ-structure on K₀(R) is an instance
- SchemeKTheoryOperations:S.6 (R_A(G), K(A) = ⊕K_m(A)): the pre-λ-structures S.6 constructs before proving specialness

**Public API.**

- TauCeti.PreLambdaRing (structure): A commutative ring with operations λⁿ satisfying λ⁰ = 1, λ¹ = id and the sum formula.
- TauCeti.LambdaRing.lambdaTotal (data): λ_t : K → (1 + tK[[t]], ·) as a homomorphism from the additive group.
- TauCeti.PreLambdaRing.ofLambdaTotal (constructor): A pre-λ-ring from an additive-to-multiplicative λ_t with t-coefficient id.
- TauCeti.LambdaRing.lambda_add (simp): λⁿ(x + y) = Σ_{i+j=n} λⁱ(x)λʲ(y).
- TauCeti.LambdaRing.lambda_zero_eq_one (simp): λ⁰(x) = 1.
- TauCeti.LambdaRing.lambda_one_eq_id (simp): λ¹(x) = x.
- TauCeti.LambdaRing.lambda_of_zero (simp): λⁿ(0) = 0 for n > 0 (Z.3/lambda-zero-class).
- TauCeti.LambdaRing.lambdaTotal_neg (simp): λ_t(−x) = λ_t(x)^{−1} (Z.3/lambda-neg-recursion).

**Unit tests.**

- TauCeti.PreLambdaRing.int_binomial_test (computation): In ℤ with λⁿ(m) = C(m, n): λ²(3) = 3 and λ²(−1) = 1.
- TauCeti.PreLambdaRing.zero_ring_test (degenerate): The zero ring carries a unique pre-λ-ring structure.
- TauCeti.PreLambdaRing.nonspecial_test (characterisation): ℤ with λ_t(m) = (1 + t + t²)^m is a pre-λ-ring (λ_t is additive-to-multiplicative with t-coefficient m) in which λ²(1) = 1, so λ_t(1) ≠ 1 + t.
- TauCeti.PreLambdaRing.powers_not_test (non-example): λⁿ(x) := xⁿ does not define a pre-λ-ring on ℤ: λ²(1 + 1) = 4 but λ²(1) + λ¹(1)λ¹(1) + λ²(1) = 3.
- TauCeti.PreLambdaRing.ringK0_test (compatibility): K₀(R) with Z.3/lambda is a pre-λ-ring (Z.3/ring-k0-pre-lambda) and rank is a homomorphism to the binomial pre-λ-ring H⁰(Spec R, ℤ).

**Sources.**

- Kbook.II, II §4, 4.1, p. 25. The definition (followed by the three axioms).
- Kbook.II, II §4, 4.1, p. 25. Pins the terminology.

### λ-operations on integers

**KTheoryLowDegrees:Z.3/lambda-nat-cast** · lemma · implementation unchecked.

Let K be a pre-λ-ring with λ^k(1) = 0 for all k ≥ 2 (that is, 1 is a line element and λ_t(1) = 1 + t). Then for every m ∈ ℤ: λ_t(m·1) = (1 + t)^m (for m < 0 the inverse series), so λ^k(m·1) = Ring.choose m k · 1: C(m, k) for m ≥ 0 and (−1)^k C(|m| + k − 1, k) for m < 0. In particular λ^k(m) = 0 for k > m ≥ 0. The coefficient identities are statements in the power-series ring and are also used for λ_t = total operation of Z.3/total-lambda.

**Hypotheses.**

- K is a pre-λ-ring with λ^k(1) = 0 for k ≥ 2 (the zero ring allowed).

**Construction or proof.**

- λ_t is a homomorphism from (K, +), so λ_t(m·1) = λ_t(1)^m = (1 + t)^m in the unit group of K[[t]] (zpow).
- (1 + t)^m = binomialSeries K m, the series with coefficients Ring.choose m k (mathlib:PowerSeries.binomialSeries_nat for m ≥ 0; for m < 0 use mathlib:PowerSeries.binomialSeries_add with binomialSeries 0 = 1, so binomialSeries(−m) is the inverse), and read off coefficients (mathlib:PowerSeries.binomialSeries_coeff).

**Acceptance.**

- λ²(3) = 3, λ³(2) = 0, λ²(−2) = 3, λ³(−1) = −1.
- In a pre-λ-ring with λ²(1) ≠ 0 (such as ℤ with λ_t(m) = (1 + t + t²)^m) the conclusion fails: λ²(2) = 3 there.

**Prerequisites.**

- KTheoryLowDegrees:Z.3/pre-lambda-ring
- mathlib:PowerSeries.binomialSeries
- mathlib:PowerSeries.binomialSeries_nat
- mathlib:PowerSeries.binomialSeries_add
- mathlib:PowerSeries.binomialSeries_coeff
- mathlib:Ring.choose
- KTheoryLowDegrees:Z.3/pre-lambda-hom
- KTheoryLowDegrees:Z.3/lambda-line-element

**Sources.**

- Kbook.II, II Example 4.1.1, p. 25. On integers λ_t is the binomial series.
- Kbook.II, II Example 4.5.2, p. 29. The normalisation λ_s(1) = 1 + s used throughout.

### Binomial rings as λ-rings

**KTheoryLowDegrees:Z.3/binomial-lambda-ring** · construction · implementation unchecked.

Every commutative binomial ring B (Mathlib's BinomialRing, e.g. ℤ, ℤ_p or a ℚ-algebra) is a pre-λ-ring with λ^k(b) = Ring.choose b k, so λ_t(b) = binomialSeries B b = '(1 + t)^b'; 1 is a line element. For a topological space X, the ring LocallyConstant X ℤ (= H⁰(X, ℤ), Weibel's [X, ℤ]) with the pointwise operations (λ^k f)(x) = Ring.choose (f x) k is a pre-λ-ring; ring homomorphisms ℤ → LocallyConstant X ℤ and comap along continuous maps are pre-λ-homomorphisms. For X = Spec R this is the binomial target of the rank of K₀(R) (Z.3/rank-lambda).

**Hypotheses.**

- B is a commutative ring with a BinomialRing instance; X is any topological space.
- Mathlib has no BinomialRing instance on LocallyConstant X ℤ; the pointwise binomial structure (Ring.choose computed pointwise) is part of this node, and locallyConstantInt is the pre-λ-structure it induces, so that the augmentation H = H⁰(Spec R, ℤ) of Z.3/ring-k0-augmented has no instance diamond.

**Construction or proof.**

- Ring.choose b 0 = 1, Ring.choose b 1 = b and Vandermonde's identity Ring.choose (a + b) n = Σ_{i+j=n} Ring.choose a i · Ring.choose b j (mathlib:Ring.add_choose_eq) are the three pre-λ-ring axioms; in series form this is mathlib:PowerSeries.binomialSeries_add.
- For LocallyConstant X ℤ define λ^k f := LocallyConstant.map (fun m ↦ Ring.choose m k) f (mathlib:LocallyConstant.map); the axioms hold pointwise.
- comap along a continuous map and the constant embedding commute with the pointwise operations.

**Acceptance.**

- λ²(5) = 10 and λ²(−1) = 1 in ℤ.
- For X = two points, LocallyConstant X ℤ = ℤ² with λ^k(a, b) = (C(a, k), C(b, k)).

**Prerequisites.**

- KTheoryLowDegrees:Z.3/pre-lambda-ring
- mathlib:BinomialRing
- mathlib:Ring.choose
- mathlib:Ring.add_choose_eq
- mathlib:PowerSeries.binomialSeries_add
- mathlib:LocallyConstant
- mathlib:LocallyConstant.map
- mathlib:Int.instBinomialRing
- KTheoryLowDegrees:Z.3/pre-lambda-hom
- KTheoryLowDegrees:Z.3/lambda-line-element

**Uses.**

- K-book II Example 4.1.1 and Definition 4.2.1: binomial rings H⁰ are the targets of augmentations
- KTheoryLowDegrees:Z.3/rank-lambda and Z.3/augmented-lambda-ring: rank : K₀(R) → H⁰(Spec R, ℤ) is a λ-homomorphism into this ring
- KTheoryLowDegrees:Z.3/adams-binomial: Adams operations are the identity on binomial rings

**Public API.**

- TauCeti.LambdaRing.ofBinomialRing (instance): The pre-λ-ring structure λ^k = Ring.choose · k on a binomial ring.
- TauCeti.LambdaRing.lambda_eq_choose (simp): In a binomial ring, λ^k b = Ring.choose b k.
- TauCeti.LambdaRing.lambdaTotal_eq_binomialSeries (characterisation): λ_t(b) = binomialSeries b.
- TauCeti.LambdaRing.locallyConstantInt (instance): The pointwise binomial pre-λ-ring structure on LocallyConstant X ℤ.
- TauCeti.LambdaRing.locallyConstant_lambda_apply (simp): (λ^k f)(x) = Ring.choose (f x) k.
- TauCeti.LambdaRing.locallyConstant_comap (functoriality): comap along a continuous map is a pre-λ-ring homomorphism.
- TauCeti.LambdaRing.intCast_isLambdaHom (compatibility): The canonical ring homomorphism ℤ → K is a pre-λ-homomorphism when K has λ^k(1) = 0 for k ≥ 2 (Z.3/lambda-nat-cast).

**Unit tests.**

- TauCeti.LambdaRing.int_choose_test (computation): In ℤ: λ²(5) = 10, λ³(2) = 0, λ²(−1) = 1.
- TauCeti.LambdaRing.locallyConstant_empty_test (degenerate): For X = ∅, LocallyConstant X ℤ is the zero ring.
- TauCeti.LambdaRing.locallyConstant_two_points_test (compatibility): For R = k × k, H⁰(Spec R, ℤ) = ℤ² with componentwise binomial operations, and rank : K₀(k × k) → ℤ² is a pre-λ-isomorphism (Z.2/k0-field-product, Z.3/rank-lambda).
- TauCeti.LambdaRing.polynomial_not_binomial_test (non-example): The construction does not apply to ℤ[x]: x(x − 1)/2 ∉ ℤ[x], so ℤ[x] is not binomial; the pre-λ-structure with x a line element (Z.3/monoid-lambda-ring) has λ²(x) = 0 ≠ x(x − 1)/2.

**Sources.**

- Kbook.II, II Example 4.1.1, p. 25. The binomial λ-structure (text layer; rendered λ^k(x) = C(x, k)).
- Kbook.II, II Example 4.1.1, p. 25. The pointwise structure on H⁰(X, ℤ).

### K₀(R) as a pre-λ-ring

**KTheoryLowDegrees:Z.3/ring-k0-pre-lambda** · construction · implementation unchecked.

For a commutative ring R, K₀(R) with the operations λⁿ of Z.3/lambda (λ_t of Z.3/total-lambda) is a pre-λ-ring (Z.3/pre-lambda-ring). It satisfies λ^k([R]) = 0 for k ≥ 2 (Z.3/lambda-free); classes of invertible modules are line elements; rank : K₀(R) → H⁰(Spec R, ℤ) is a pre-λ-homomorphism to the binomial pre-λ-ring (Z.3/rank-lambda), so I_R is a λ-ideal; and RingK0.map f is a pre-λ-homomorphism for every f : R → S (Z.3/lambda-base-change).

**Hypotheses.**

- R is a commutative unital ring; the zero ring is allowed.

**Construction or proof.**

- The axioms are Z.3/lambda-zero, Z.3/lambda-one and Z.3/lambda-add; build the instance with PreLambdaRing.ofLambdaTotal from Z.3/total-lambda.
- Line elements: for invertible L, ⋀^k L = 0 for k ≥ 2 (Z.3/exterior-above-rank), so λ^k[L] = 0 (Z.3/lambda-of).
- The remaining clauses are Z.3/lambda-free, Z.3/rank-lambda and Z.3/lambda-base-change.

**Acceptance.**

- λ²(2[R]) = [R].
- λ^k([P] − n[R]) = Σ_i (−1)^i C(n + i − 1, i)[⋀^{k−i}P] (Weibel Ex. II.4.1).

**Prerequisites.**

- KTheoryLowDegrees:Z.3/pre-lambda-ring
- KTheoryLowDegrees:Z.3/total-lambda
- KTheoryLowDegrees:Z.3/lambda
- KTheoryLowDegrees:Z.3/lambda-zero
- KTheoryLowDegrees:Z.3/lambda-one
- KTheoryLowDegrees:Z.3/lambda-add
- KTheoryLowDegrees:Z.3/lambda-free
- KTheoryLowDegrees:Z.3/lambda-of
- KTheoryLowDegrees:Z.3/exterior-above-rank
- KTheoryLowDegrees:Z.3/rank-lambda
- KTheoryLowDegrees:Z.3/lambda-base-change
- KTheoryLowDegrees:Z.3/pre-lambda-hom
- KTheoryLowDegrees:Z.3/lambda-ideal
- KTheoryLowDegrees:Z.3/lambda-line-element

**Uses.**

- K-book II 4.1.2, 4.2: K₀(R) is a λ-ring with positive structure
- KTheoryLowDegrees:Z.3/gamma, Z.3/adams-operations, Z.3/ring-k0-special: the abstract theory applied to K₀(R)
- SchemeKTheoryOperations:S.6/degree-zero-comparison: the degree-zero λ-ring structure

**Public API.**

- TauCeti.RingK0.instPreLambdaRing (instance): PreLambdaRing (RingK0 R) with λ_t = RingK0.lambdaTotal.
- TauCeti.RingK0.lambda_one_class (simp): λ^k(1) = 0 for k ≥ 2.
- TauCeti.RingK0.isLineElement_of_invertible (compatibility): [L] is a line element for every invertible L.
- TauCeti.RingK0.rank_isLambdaHom (compatibility): rank is a pre-λ-homomorphism to LocallyConstant (PrimeSpectrum R) ℤ.
- TauCeti.RingK0.map_isLambdaHom (functoriality): RingK0.map f is a pre-λ-homomorphism.
- TauCeti.RingK0.lambda_sub_nsmul (relation): λ^k([P] − n[R]) = Σ_i (−1)^i C(n + i − 1, i)[⋀^{k−i}P].

**Unit tests.**

- TauCeti.RingK0.preLambda_rank_two_test (computation): λ²(2[R]) = [R] and λ²(−2[R]) = 3[R].
- TauCeti.RingK0.preLambda_zero_ring_test (degenerate): For the zero ring, K₀ = 0 with its unique structure.
- TauCeti.RingK0.preLambda_field_test (compatibility): For a field k, divisionRingEquiv : K₀(k) ≅ ℤ (Z.2/division-ring-k0) is a pre-λ-isomorphism onto the binomial ring ℤ.
- TauCeti.RingK0.preLambda_not_truncated_test (non-example): Setting λ^k := 0 for k ≥ 2 on K₀(R) (R ≠ 0) is not the λ-structure: λ²[R²] = [R] ≠ 0.

**Sources.**

- Kbook.II, II Example 4.1.2, p. 25. K₀(R) is a λ-ring in Weibel's (pre-λ) sense.

### H⁰(Spec R, ℤ) as a λ-subring of K₀(R)

**KTheoryLowDegrees:Z.3/rank-section-lambda** · lemma · implementation unchecked.

The section rankSection : H⁰(Spec R, ℤ) → K₀(R) of Z.2/rank-section (f ↦ Σ_n n·[clopenModule f⁻¹(n)]) is an injective ring homomorphism and a pre-λ-homomorphism from the binomial pre-λ-ring (Z.3/binomial-lambda-ring): λ^k(rankSection f) = rankSection(Ring.choose f k). With rank ∘ rankSection = id, H⁰(Spec R, ℤ) is a binomial λ-subring of K₀(R) retracted by rank.

**Hypotheses.**

- R is a commutative unital ring; the zero ring is allowed.

**Construction or proof.**

- For clopens U, V with idempotents e_U, e_V: clopenModule U ⊗ clopenModule V ≅ clopenModule (U ∩ V) (e_UR ⊗ e_VR ≅ e_Ue_VR), so rankSection is multiplicative on indicator functions (Z.3/finite-projective-monoidal), and additive (Z.2/rank-section); 1 = indicator of Spec R ↦ [R].
- λ_t([e_UR]) = 1 + [e_UR]t (rank ≤ 1, Z.3/exterior-above-rank). For f = Σ_i n_i 1_{U_i} over a finite clopen partition, the classes e_i = [e_{U_i}R] are orthogonal idempotents of K₀(R) summing to 1, and λ_t(rankSection f) = ∏_i (1 + e_it)^{n_i} = Σ_i e_i(1 + t)^{n_i}, whose coefficients are rankSection(Ring.choose f k).
- Injectivity: rank ∘ rankSection = id (Z.2/rank-section).

**Acceptance.**

- For R = k × k: rankSection(a, b) = a[k × 0] + b[0 × k] and λ²(rankSection(3, −1)) = rankSection(3, 1).
- rankSection(const n) = n[R].

**Prerequisites.**

- KTheoryLowDegrees:Z.2/rank-section
- KTheoryLowDegrees:Z.2/componentwise-free
- KTheoryLowDegrees:Z.3/finite-projective-monoidal
- KTheoryLowDegrees:Z.3/exterior-above-rank
- KTheoryLowDegrees:Z.3/ring-k0-pre-lambda
- KTheoryLowDegrees:Z.3/binomial-lambda-ring

**Sources.**

- Kbook.II, II §2, Rank and H⁰, p. 8. H⁰(R) embedded in K₀(R) by componentwise free modules.
- Kbook.II, II §4, Positive structures, p. 26. H⁰ is a binomial λ-subring.

### Augmented λ-rings

**KTheoryLowDegrees:Z.3/augmented-lambda-ring** · definition · implementation unchecked.

An augmented pre-λ-ring (parts 1) and 2) of Weibel's positive structure, without positive elements) is a pre-λ-ring K together with a binomial ring H (Z.3/binomial-lambda-ring) and pre-λ-ring homomorphisms ι : H → K and ε : K → H with ε ∘ ι = id_H. The augmentation ideal ker ε is a λ-ideal, K = ι(H) ⊕ ker ε, and x − ι(ε x) ∈ ker ε for every x. A morphism of augmented pre-λ-rings is a pre-λ-homomorphism commuting with the ε's and ι's. For an augmented special λ-ring (Z.3/special-lambda-ring) H is special as well (Z.3/binomial-special for H = LocallyConstant X ℤ).

**Hypotheses.**

- K is a pre-λ-ring; H is a commutative binomial ring (for K₀(R): H = LocallyConstant (PrimeSpectrum R) ℤ).

**Construction or proof.**

- Record (H, ι, ε) with the two homomorphism conditions and ε ∘ ι = id.
- ε(λ^k x) = Ring.choose (ε x) k because ε is a pre-λ-homomorphism into the binomial ring; for x ∈ ker ε this is Ring.choose 0 k = 0 for k ≥ 1, so ker ε is a λ-ideal.
- The splitting x = ι(ε x) + (x − ι(ε x)) is the standard retraction decomposition.

**Acceptance.**

- ℤ[u, u^{−1}] with H = ℤ, ε(u) = 1 is augmented; ker ε = (u − 1).
- ι(1) is a line element, so λ^k(1) = 0 in K for k ≥ 2.

**Prerequisites.**

- KTheoryLowDegrees:Z.3/pre-lambda-ring
- KTheoryLowDegrees:Z.3/binomial-lambda-ring
- mathlib:RingHom.ker
- KTheoryLowDegrees:Z.3/pre-lambda-hom
- KTheoryLowDegrees:Z.3/lambda-ideal

**Uses.**

- K-book II 4.2 and the γ-filtration: F¹_γ = ker ε and the γ-generators use rank-zero elements
- KTheoryLowDegrees:Z.3/gamma-filtration: the filtration is defined for augmented pre-λ-rings
- SchemeKTheoryOperations:S.6 and S.7: K(A) and K₀(Vect X) are augmented by the rank to H⁰(X, ℤ)

**Public API.**

- TauCeti.LambdaRing.Augmentation (structure): The data (H, ι, ε) with ε ∘ ι = id, both pre-λ-homomorphisms.
- TauCeti.LambdaRing.Augmentation.ε (projection): The augmentation K → H.
- TauCeti.LambdaRing.Augmentation.ι (projection): The unit map H → K.
- TauCeti.LambdaRing.augmentationIdeal (constructor): ker ε as an ideal.
- TauCeti.LambdaRing.augmentationIdeal_isLambdaIdeal (structure): ker ε is a λ-ideal.
- TauCeti.LambdaRing.ε_lambda (simp): ε(λ^k x) = Ring.choose (ε x) k.
- TauCeti.LambdaRing.sub_ι_ε_mem (constructor): x − ι(ε x) ∈ ker ε.
- TauCeti.LambdaRing.Augmentation.Hom (functoriality): Morphisms of augmented pre-λ-rings.

**Unit tests.**

- TauCeti.LambdaRing.augmentation_laurent_test (computation): For K = ℤ[u, u^{−1}] with ε(u) = 1: ε(λ²(u + u^{−1})) = ε(1) = 1 = C(2, 2).
- TauCeti.LambdaRing.augmentation_self_test (degenerate): A binomial ring H with ι = ε = id is augmented with ker ε = 0.
- TauCeti.LambdaRing.augmentation_ringK0_test (compatibility): (K₀(R), H⁰(Spec R, ℤ), rankSection, rank) is augmented with ker ε = I_R (Z.3/ring-k0-augmented).
- TauCeti.LambdaRing.augmentation_nonexistence_test (non-example): The pre-λ-ring ℤ with λ_t(m) = (1 + t + t²)^m has no augmentation: λ²(1) = 1, while ι(1) = 1 would force λ²(1) = ι(C(1, 2)) = 0.

**Sources.**

- Kbook.II, II Definition 4.2.1, p. 26. Parts 1) and 2) of a positive structure; the positive elements of part 3) are not part of this definition.
- Soule.1985, §1.5 (p. 493). Soulé augments K(A) by the rank on the connected components of Spec A, the same augmentation on K₀(A).

### K₀(R) as an augmented λ-ring

**KTheoryLowDegrees:Z.3/ring-k0-augmented** · construction · implementation unchecked.

(K₀(R), H⁰(Spec R, ℤ), rankSection, rank) is an augmented pre-λ-ring (Z.3/augmented-lambda-ring): rank and rankSection are pre-λ-homomorphisms (Z.3/rank-lambda, Z.3/rank-section-lambda) with rank ∘ rankSection = id (Z.2/rank-section). Its augmentation ideal is I_R (Z.3/augmentation), λ^k(1) = 0 for k ≥ 2, and so the γ-operations and γ-filtration of Z.3/gamma and Z.3/gamma-filtration are defined on K₀(R).

**Hypotheses.**

- R is a commutative unital ring; the zero ring is allowed.

**Construction or proof.**

- Collect the cited homomorphism properties; H⁰(Spec R, ℤ) = LocallyConstant (PrimeSpectrum R) ℤ is binomial with the pointwise structure (Z.3/binomial-lambda-ring).

**Acceptance.**

- For a field k: ε is the isomorphism K₀(k) ≅ ℤ and I_k = 0.
- For R = ℤ[√−5]: ker ε ≅ Pic(R) ≅ ℤ/2 (Z.4/rank-pic-equivalence).

**Prerequisites.**

- KTheoryLowDegrees:Z.3/augmented-lambda-ring
- KTheoryLowDegrees:Z.3/ring-k0-pre-lambda
- KTheoryLowDegrees:Z.3/rank-lambda
- KTheoryLowDegrees:Z.3/rank-section-lambda
- KTheoryLowDegrees:Z.3/augmentation
- KTheoryLowDegrees:Z.2/rank-section
- KTheoryLowDegrees:Z.3/binomial-lambda-ring

**Uses.**

- KTheoryLowDegrees:Z.3/gamma-filtration and Z.3/gamma-filtration-two: the γ-filtration of K₀(R)
- SchemeKTheoryOperations:S.7/scheme-gamma-filtration: the affine normalisation of the scheme γ-filtration

**Public API.**

- TauCeti.RingK0.augmentation (data): The Augmentation structure on RingK0 R (a definition, since Augmentation is a structure). The checkpoint's name TauCeti.RingK0.augmentation for the augmentation ideal is now TauCeti.RingK0.augmentationIdeal (Z.3/augmentation).
- TauCeti.RingK0.augmentation_ε (simp): ε = rank.
- TauCeti.RingK0.augmentation_ι (simp): ι = rankSection.
- TauCeti.RingK0.augmentationIdeal_eq (characterisation): The augmentation ideal is I_R.

**Unit tests.**

- TauCeti.RingK0.augmented_field_test (degenerate): For a field k the augmentation is an isomorphism and ker ε = 0.
- TauCeti.RingK0.augmented_two_points_test (computation): For R = k × k: H = ℤ², ε an isomorphism, so ker ε = 0 although Spec R is disconnected.
- TauCeti.RingK0.augmented_dedekind_test (compatibility): For R = ℤ[√−5], [I] − [R] ∈ ker ε with det = Pic.mk I ≠ 1 (Z.3/determinant-hom).
- TauCeti.RingK0.augmented_total_rank_test (non-example): Using the integer 'total rank' Σ over components instead of H⁰ fails: for R = k × k the total rank of [k × 0]·[0 × k] = 0 is 0 but the product of the total ranks is 1.

**Sources.**

- Kbook.II, II §4, Positive structures, p. 26. The augmentation of K₀(R) by the rank.

### γ-operations vanish above the rank

**KTheoryLowDegrees:Z.3/gamma-vanishing-above-rank** · lemma · implementation unchecked.

Let K be a pre-λ-ring with λ^k(1) = 0 for k ≥ 2, n ≥ 0 and p ∈ K with λʲ(p) = 0 for all j > n. Then γ_t(p − n) = Σ_{j=0}^{n} λʲ(p) tʲ(1 − t)^{n−j}, a polynomial of degree ≤ n; hence γ^k(p − n) = 0 for all k > n. In K₀(R): γ^k([P] − n[R]) = 0 for k > n when P has constant rank n, and γ^k([L] − [R]) = 0 for k ≥ 2 when L is invertible.

**Hypotheses.**

- K is a pre-λ-ring with λ^k(1) = 0 for k ≥ 2.

**Construction or proof.**

- γ_t is additive-to-multiplicative (Z.3/gamma-add) and γ_t(1) = λ_s(1) = 1 + s = (1 − t)^{−1} (Z.3/lambda-nat-cast), so γ_t(−n) = (1 − t)^n.
- γ_t(p) = Σ_{j ≤ n} λʲ(p) tʲ(1 − t)^{−j} (Z.3/gamma, using λʲ(p) = 0 for j > n); multiply by (1 − t)^n.
- For K₀(R): ⋀ʲP = 0 for j > n (Z.3/exterior-above-rank).

**Acceptance.**

- For a line element ℓ: γ_t(ℓ − 1) = 1 + (ℓ − 1)t.
- For P of constant rank 2: γ_t([P] − 2) = (1 − t)² + [P]t(1 − t) + [⋀²P]t².

**Prerequisites.**

- KTheoryLowDegrees:Z.3/gamma
- KTheoryLowDegrees:Z.3/gamma-add
- KTheoryLowDegrees:Z.3/lambda-nat-cast
- KTheoryLowDegrees:Z.3/exterior-above-rank
- KTheoryLowDegrees:Z.3/ring-k0-pre-lambda

**Sources.**

- Kbook.II, II Lemma 4.5.3, p. 29. The lemma; the node's proof uses only the vanishing λʲ(p) = 0 for j > n, not positivity.

### The γ-expansion of the top exterior power

**KTheoryLowDegrees:Z.3/gamma-top-sum** · lemma · implementation unchecked.

Let K be a pre-λ-ring with λ^k(1) = 0 for k ≥ 2, n ≥ 0 and p ∈ K with λʲ(p) = 0 for j > n. Then Σ_{i=0}^{n} γⁱ(p − n) = λⁿ(p); equivalently λⁿ(p) − 1 − (p − n) = Σ_{i=2}^{n} γⁱ(p − n). In K₀(R), for P of constant rank n: [⋀ⁿP] − [R] − ([P] − n[R]) = Σ_{i=2}^{n} γⁱ([P] − n[R]).

**Hypotheses.**

- K is a pre-λ-ring with λ^k(1) = 0 for k ≥ 2; λʲ(p) = 0 for j > n.

**Construction or proof.**

- By Z.3/gamma-vanishing-above-rank, γ_t(p − n) = Σ_{j=0}^{n} λʲ(p)tʲ(1 − t)^{n−j} is a polynomial; the sum of its coefficients is its value at t = 1 (mathlib:Polynomial.eval_one-type evaluation of the polynomial), and tʲ(1 − t)^{n−j} evaluates to 1 if j = n and 0 otherwise.
- Hence Σ_i γⁱ(p − n) = λⁿ(p); subtract γ⁰ = 1 and γ¹(p − n) = p − n (Z.3/gamma-one).

**Acceptance.**

- n = 1: 1 + (p − 1) = p = λ¹(p).
- For p = ℓ₁ + ℓ₂ with line elements: γ²(p − 2) = (ℓ₁ − 1)(ℓ₂ − 1) and 1 + (ℓ₁ + ℓ₂ − 2) + (ℓ₁ − 1)(ℓ₂ − 1) = ℓ₁ℓ₂ = λ²(p).

**Prerequisites.**

- KTheoryLowDegrees:Z.3/gamma-vanishing-above-rank
- KTheoryLowDegrees:Z.3/gamma-one
- mathlib:Polynomial.eval

**Sources.**

- Kbook.II, II proof of Theorem 4.7, p. 31. Weibel's congruence p − ε(p) ≡ det(p) − 1 mod F²_γ, proved there by the Splitting Principle; the node gives it as an exact identity in every pre-λ-ring, with no splitting principle.

### The γ-filtration as an additive span

**KTheoryLowDegrees:Z.3/gamma-filtration-eq-span** · lemma · implementation unchecked.

Let (K, H, ι, ε) be an augmented pre-λ-ring with λ^k(1) = 0 for k ≥ 2, and assume H is additively generated by idempotents e with λ^k(ι(e)·x) = ι(e)·λ^k(x) for all k ≥ 1 and x ∈ K (∗). Then for every n ≥ 1 the ideal F^n_γ K of Z.3/gamma-filtration equals the additive subgroup generated by the weighted products γ^{k₁}(x₁)⋯γ^{k_m}(x_m) with m ≥ 1, x_j ∈ ker ε and Σk_j ≥ n (Soulé's definition). Condition (∗) holds for H = ℤ and for K₀(R) with H = H⁰(Spec R, ℤ), including disconnected Spec R. For n = 0 both definitions put F⁰ = K; the additive span of the products is smaller in general (for K₀(k × k) it is ℤ·1).

**Hypotheses.**

- (K, H, ι, ε) augmented, λ^k(1) = 0 for k ≥ 2, and (∗); n ≥ 1.

**Construction or proof.**

- The span S_n is contained in F^n_γ; for the converse it suffices that a·g ∈ S_n for a ∈ K and g a weighted product of weight ≥ n, and m ≥ 1 since n ≥ 1.
- Write a = ι(ε a) + a₀ with a₀ ∈ ker ε (Z.3/augmented-lambda-ring). a₀·g = γ¹(a₀)·g (Z.3/gamma-one) is a weighted product of weight ≥ n + 1.
- ι(ε a) = Σ n_e ι(e) over idempotents e; by (∗) and Z.3/gamma-series, γ^k(ι(e)x) = Σ_{j≥1} C(k − 1, j − 1)λʲ(ι(e)x) = ι(e)γ^k(x) for k ≥ 1, and ι(e)x₁ ∈ ker ε; so ι(e)·g = γ^{k₁}(ι(e)x₁)γ^{k₂}(x₂)⋯ is again a weighted product of the same weight.
- (∗) for K₀(R): for a clopen U with idempotent e, [eR]·[P] = [eP] and ⋀^k_R(eP) ≅ e⋀^k P for k ≥ 1 (Z.3/exterior-base-change along R → eR); both x ↦ λ_t([eR]x) and x ↦ 1 − [eR] + [eR]λ_t(x) are homomorphisms from (K₀(R), +) to 1 + tK₀(R)[[t]] (e idempotent), agreeing on object classes, hence equal (tauceti:TauCeti.SplitK0.hom_ext); indicator functions generate H⁰(Spec R, ℤ) additively (Z.2/rank-section).

**Acceptance.**

- For K₀ of a connected ring, F¹_γ = I_R is additively generated by the x ∈ I_R.
- For K₀(k × k), F¹_γ = 0 and the span of weight-≥1 products is 0.

**Prerequisites.**

- KTheoryLowDegrees:Z.3/gamma-filtration
- KTheoryLowDegrees:Z.3/augmented-lambda-ring
- KTheoryLowDegrees:Z.3/gamma-one
- KTheoryLowDegrees:Z.3/gamma-series
- KTheoryLowDegrees:Z.3/ring-k0-augmented
- KTheoryLowDegrees:Z.3/exterior-base-change
- KTheoryLowDegrees:Z.2/rank-section
- tauceti:TauCeti.SplitK0.hom_ext

**Sources.**

- Soule.1985, §1.5 (p. 493). Soulé's subgroup form of the filtration for i ≥ 1 (text layer of the scan reproduced literally).
- Kbook.II, II §4, the γ-filtration, p. 30. Weibel's ideal form; the lemma shows the two agree for n ≥ 1.

### Adams operations

**KTheoryLowDegrees:Z.3/adams-operations** · definition · implementation unchecked.

For a pre-λ-ring K and k ≥ 1 define ψ^k : K → K by the Newton recursion ψ^k(x) = λ¹(x)ψ^{k−1}(x) − λ²(x)ψ^{k−2}(x) + ⋯ + (−1)^k λ^{k−1}(x)ψ¹(x) + (−1)^{k−1}kλ^k(x), with ψ¹ = id; equivalently ψ^k(x) = N_k(λ¹x, …, λ^kx), N_k the Newton polynomial expressing the power sum p_k in the elementary symmetric functions (Z.3/lambda-universal-polynomials), and Σ_{k≥1} ψ^k(x)t^k = −t·(d/dt λ_{−t}(x))·λ_{−t}(x)^{−1} in K[[t]], where λ_{−t}(x) = Σ(−1)^kλ^k(x)t^k (integral: λ_{−t}(x) is a unit). For an augmented K put ψ⁰ = ι ∘ ε. Examples: ψ²(x) = x² − 2λ²(x), ψ³(x) = x³ − 3xλ²(x) + 3λ³(x). On K₀(R) these are the degree-zero Adams operations, with ψ^k[L] = [L^{⊗k}] (Z.3/ring-k0-adams-line); the duality operation ψ^{−1} and the Adams operations on higher K-groups are not part of this definition.

**Hypotheses.**

- K is a pre-λ-ring; the properties that need specialness are Z.3/adams-ring-endomorphism, Z.3/adams-composition and Z.3/adams-frobenius.

**Construction or proof.**

- Define ψ^k by strong recursion on k with the displayed formula.
- Generating function (Weibel Ex. II.4.6): multiply Σψ^k(x)t^k by λ_{−t}(x) and compare the coefficient of t^k with that of −t(d/dt)λ_{−t}(x) = Σ(−1)^{k+1}kλ^k(x)t^k (mathlib:PowerSeries.derivative, mathlib:PowerSeries.coeff_mul); the resulting identities are exactly the recursion.
- The closed forms for ψ², ψ³ are N₂ = a₁² − 2a₂ and N₃ = a₁³ − 3a₁a₂ + 3a₃ evaluated at a_i = λ^i(x).

**Acceptance.**

- In ℤ with λ^k(n) = C(n, k): ψ^k(n) = n.
- For a line element ℓ, ψ^k(ℓ) = ℓ^k.
- ψ²(2[R]) = 4[R] − 2[R] = 2[R] in K₀(R).

**Prerequisites.**

- KTheoryLowDegrees:Z.3/pre-lambda-ring
- KTheoryLowDegrees:Z.3/lambda-universal-polynomials
- mathlib:PowerSeries.derivative
- mathlib:PowerSeries.coeff_mul
- KTheoryLowDegrees:Z.3/pre-lambda-hom
- KTheoryLowDegrees:Z.3/lambda-composition-polynomial
- KTheoryLowDegrees:Z.3/lambda-newton-polynomial

**Uses.**

- K-book II Proposition 4.4, 4.9, Theorem 4.10: ring endomorphisms, eigenvalues on the γ-graded pieces, the weight decomposition
- KTheoryLowDegrees:Z.3/ring-k0-adams-rank-det: the degree-zero normalisation rank ψ^k = rank, det ψ^k = det^k
- SchemeKTheoryOperations:S.6 and S.7 (weights, Chern character, Adams–Riemann–Roch): ψ^k on K-theory, extended from this degree-zero definition

**Public API.**

- TauCeti.LambdaRing.adams (constructor): ψ^k : K → K for k ≥ 1, by the Newton recursion.
- TauCeti.LambdaRing.adams_one (simp): ψ¹ = id.
- TauCeti.LambdaRing.adams_two (simp): ψ²(x) = x² − 2λ²(x).
- TauCeti.LambdaRing.adams_newton (characterisation): The Newton recursion displayed in the statement.
- TauCeti.LambdaRing.adamsSeries (characterisation): Σ_{k≥1} ψ^k(x)t^k = −t λ′_{−t}(x) λ_{−t}(x)^{−1}.
- TauCeti.LambdaRing.adams_add (simp): ψ^k(x + y) = ψ^k(x) + ψ^k(y) (Z.3/adams-add).
- TauCeti.LambdaRing.adams_map (functoriality): A pre-λ-ring homomorphism f satisfies f ∘ ψ^k = ψ^k ∘ f.
- TauCeti.LambdaRing.adams_zero_aug (data): For an augmented K, ψ⁰ := ι ∘ ε (a definition). In a pre-λ-ring without augmentation adams 0 is set to 0.

**Unit tests.**

- TauCeti.LambdaRing.adams_int_test (computation): In ℤ with λ^k(n) = C(n, k): ψ^k(n) = n for all k ≥ 1 (ψ²(2) = 4 − 2 = 2).
- TauCeti.LambdaRing.adams_zero_test (degenerate): ψ^k(0) = 0 in every pre-λ-ring.
- TauCeti.LambdaRing.adams_ne_pow_test (non-example): ψ^k(x) ≠ x^k in general: ψ²(2) = 2 ≠ 4 in ℤ.
- TauCeti.LambdaRing.adams_line_test (characterisation): If λʲ(ℓ) = 0 for j ≥ 2 then ψ^k(ℓ) = ℓ^k (Z.3/adams-line-element).
- TauCeti.RingK0.adams_line_test (compatibility): For an invertible R-module L: ψ^k([L]) = [L^{⊗k}] in K₀(R) (Z.3/ring-k0-adams-line).

**Sources.**

- Kbook.II, II §4, Adams operations, p. 28. The Newton recursion (Weibel works with augmented λ-rings so that ψ⁰ = ε is defined).
- Kbook.II, II §4, Adams operations, p. 28. The generating function (text layer; rendered ψ_t(x) = Σψ^k(x)t^k = ε(x) − t d/dt log λ_{−t}(x)).
- Soule.1985, §1.5 (p. 493). Soulé's definition by the same recursion, with ψ^{−k} for k ≥ 1 through duality (not used here).

### Adams operations are additive

**KTheoryLowDegrees:Z.3/adams-add** · lemma · implementation unchecked.

In every pre-λ-ring K, ψ^k(x + y) = ψ^k(x) + ψ^k(y) for all x, y and k ≥ 1; hence ψ^k is a homomorphism of additive groups and ψ^k(−x) = −ψ^k(x).

**Hypotheses.**

- K is a pre-λ-ring.

**Construction or proof.**

- λ_{−t}(x + y) = λ_{−t}(x)λ_{−t}(y) (rescaling t ↦ −t of the pre-λ-ring axiom).
- The logarithmic derivative D(f) := f′·f^{−1} of a unit power series satisfies D(fg) = D(f) + D(g) (Leibniz rule, mathlib:PowerSeries.derivative); by the generating-function form of Z.3/adams-operations, Σψ^k t^k = −t·D(λ_{−t}), which is therefore additive.

**Acceptance.**

- ψ²(x + y) = (x + y)² − 2λ²(x + y) = x² − 2λ²x + y² − 2λ²y.
- In K₀(R): ψ^k([L] + [M]) = [L^{⊗k}] + [M^{⊗k}].

**Prerequisites.**

- KTheoryLowDegrees:Z.3/adams-operations
- KTheoryLowDegrees:Z.3/pre-lambda-ring
- mathlib:PowerSeries.derivative
- KTheoryLowDegrees:Z.3/pre-lambda-hom

**Sources.**

- Kbook.II, II proof of Proposition 4.4, p. 28. Additivity from the logarithm; no splitting principle is used for this part.

### Adams operations on line elements

**KTheoryLowDegrees:Z.3/adams-line-element** · lemma · implementation unchecked.

In a pre-λ-ring, if ℓ is a line element (λʲ(ℓ) = 0 for j ≥ 2) then ψ^k(ℓ) = ℓ^k for every k ≥ 1; if ℓ is moreover a unit and ℓ^{−1} is a line element, ψ^k(ℓ^{−1}) = ℓ^{−k}.

**Hypotheses.**

- K is a pre-λ-ring.

**Construction or proof.**

- λ_{−t}(ℓ) = 1 − ℓt, so −t·D(1 − ℓt) = ℓt/(1 − ℓt) = Σ_{k≥1} ℓ^k t^k (generating function of Z.3/adams-operations); equivalently, in the recursion only the terms with λ¹ survive.

**Acceptance.**

- ψ³(ℓ) = ℓ³.
- In ℤ[u, u^{−1}] with u a line element: ψ²(u + u^{−1}) = u² + u^{−2} (with Z.3/adams-add).

**Prerequisites.**

- KTheoryLowDegrees:Z.3/adams-operations

**Sources.**

- Kbook.II, II §4, Adams operations, p. 28. The first of Weibel's three facts.

### Adams operations on square-zero λ-ideals

**KTheoryLowDegrees:Z.3/adams-square-zero** · lemma · implementation unchecked.

In a pre-λ-ring K, let x satisfy λⁱ(x)λʲ(x) = 0 for all i, j ≥ 1 (for instance x in a λ-ideal I with I² = 0). Then ψ^k(x) = (−1)^{k−1}kλ^k(x) for every k ≥ 1. On a λ-ideal I with I² = 0 each λ^k (k ≥ 1) is additive.

**Hypotheses.**

- K is a pre-λ-ring; the hypothesis concerns the products λⁱ(x)λʲ(x), not merely x² = 0.

**Construction or proof.**

- By induction ψ^j(x) lies in the ideal generated by the λⁱ(x), i ≥ 1; in the Newton recursion every term λⁱ(x)ψ^{k−i}(x) with 1 ≤ i ≤ k − 1 is then a product of two such elements and vanishes, leaving (−1)^{k−1}kλ^k(x).
- Additivity: λ_t(x + y) = λ_t(x)λ_t(y) ≡ 1 + Σ(λ^k x + λ^k y)t^k modulo I², and I² = 0.

**Acceptance.**

- For K = K₀(A) ⊕ K₁(A) with zero products in positive degree (S.6): ψ²(a) = −2λ²(a) for a ∈ K₁(A).
- k = 1: ψ¹(x) = x = λ¹(x).

**Prerequisites.**

- KTheoryLowDegrees:Z.3/adams-operations
- KTheoryLowDegrees:Z.3/pre-lambda-ring
- KTheoryLowDegrees:Z.3/lambda-ideal

**Sources.**

- Kbook.II, II §4, Adams operations, p. 28. The second of Weibel's three facts.

### Adams operations on binomial rings

**KTheoryLowDegrees:Z.3/adams-binomial** · lemma · implementation unchecked.

In a binomial ring B with λ^k = Ring.choose · k (Z.3/binomial-lambda-ring), and in LocallyConstant X ℤ, every ψ^k (k ≥ 1) is the identity. Consequently, in an augmented pre-λ-ring, ψ^k ∘ ι = ι and ε ∘ ψ^k = ε.

**Hypotheses.**

- B is a commutative binomial ring (or LocallyConstant X ℤ, pointwise).

**Construction or proof.**

- By induction on k: if ψʲ(x) = x for j < k, the recursion gives ψ^k(x) = x Σ_{i=1}^{k−1}(−1)^{i−1}C(x, i) + (−1)^{k−1}kC(x, k), which equals x by the identity x Σ_{i=0}^{k−1}(−1)^i C(x, i) = (−1)^{k+1}kC(x, k).
- That identity follows from the alternating partial sum Σ_{i=0}^{k−1}(−1)^iC(x, i) = (−1)^{k−1}C(x − 1, k − 1) (Pascal's rule, induction on k) and xC(x − 1, k − 1) = kC(x, k), both valid for Ring.choose in a binomial ring (mathlib:Ring.choose_succ_succ and the multiplicativity lemmas of Mathlib.RingTheory.Binomial).
- For augmented K: ι and ε are pre-λ-homomorphisms, hence commute with ψ^k (API adams_map of Z.3/adams-operations).

**Acceptance.**

- ψ²(5) = 25 − 2·10 = 5 and ψ³(−1) = −1 − 3·(−1)·1 + 3·(−1) = −1 in ℤ.
- In K₀(R): ψ^k(n[R]) = n[R] and ψ^k(rankSection f) = rankSection f.

**Prerequisites.**

- KTheoryLowDegrees:Z.3/adams-operations
- KTheoryLowDegrees:Z.3/binomial-lambda-ring
- mathlib:Ring.choose
- mathlib:Ring.choose_succ_succ

**Sources.**

- Kbook.II, II §4, Adams operations, p. 28. The third fact, with the identity used in the proof (text layer; rendered x Σ_{i=0}^{k−1}(−1)^i C(x, i) = (−1)^{k+1} k C(x, k)).

### Adams and λ-operations on F¹_γ/F²_γ

**KTheoryLowDegrees:Z.3/adams-first-graded** · lemma · implementation unchecked.

Let (K, H, ι, ε) be an augmented pre-λ-ring with λ^k(1) = 0 for k ≥ 2 and x ∈ F¹_γ K = ker ε. Then for every k ≥ 1, modulo F²_γ K: λ^k(x) ≡ (−1)^{k−1}x and ψ^k(x) ≡ kx. (This is Weibel's Proposition 4.9 for n = 1, with the sign of E3 corrected; no splitting principle and no specialness are used.)

**Hypotheses.**

- (K, H, ι, ε) is an augmented pre-λ-ring with λ^k(1) = 0 for k ≥ 2.

**Construction or proof.**

- γⁱ(x) ∈ Fⁱ_γ ⊆ F²_γ for i ≥ 2 (Z.3/gamma-filtration-generators), so γ_t(x) ≡ 1 + xt modulo F²_γ, coefficientwise in (K/F²_γ)[[t]].
- λ_s(x) = γ_t(x) with t = s/(1 + s) (inverse substitution, Z.3/gamma); hence λ_s(x) ≡ 1 + x·s/(1 + s) = 1 + Σ_{k≥1}(−1)^{k−1}x s^k, i.e. λ^k(x) ≡ (−1)^{k−1}x.
- ψʲ(x) and λⁱ(x) lie in ker ε for i, j ≥ 1 (ε is a pre-λ-homomorphism and ψʲ(0) = λⁱ(0) = 0), so every product λⁱ(x)ψ^{k−i}(x), 1 ≤ i ≤ k − 1, lies in (ker ε)² ⊆ F²_γ (Z.3/gamma-filtration-mul, Z.3/gamma-filtration-one); the Newton recursion (Z.3/adams-operations) gives ψ^k(x) ≡ (−1)^{k−1}kλ^k(x) ≡ kx.

**Acceptance.**

- For a line element ℓ and x = ℓ − 1: ψ^k(x) = ℓ^k − 1 ≡ k(ℓ − 1) modulo (ℓ − 1)² ⊆ F²_γ.
- λ²(x) ≡ −x: for x = ℓ − 1, λ²(ℓ − 1) = 1 − ℓ (Z.3/lambda-neg-recursion with λ²ℓ = 0).

**Prerequisites.**

- KTheoryLowDegrees:Z.3/gamma
- KTheoryLowDegrees:Z.3/gamma-filtration-generators
- KTheoryLowDegrees:Z.3/gamma-filtration-mul
- KTheoryLowDegrees:Z.3/gamma-filtration-one
- KTheoryLowDegrees:Z.3/adams-operations
- KTheoryLowDegrees:Z.3/augmented-lambda-ring

**Sources.**

- Kbook.II, II Proposition 4.9, p. 32. The weight-one case of Proposition 4.9, with λ^k's sign corrected as recorded in sourceIssues (E3); the node's proof avoids the Filtered Splitting Principle.

### Adams operations on line bundles

**KTheoryLowDegrees:Z.3/ring-k0-adams-line** · lemma · implementation unchecked.

For an invertible R-module L and k ≥ 1: ψ^k([L]) = [L]^k = [L^{⊗k}] in K₀(R), and ψ^k([L^∨]) = [L^∨]^k = [L]^{−k}.

**Hypotheses.**

- R is a commutative unital ring; the zero ring is allowed.

**Construction or proof.**

- [L] is a line element of the pre-λ-ring K₀(R) (Z.3/ring-k0-pre-lambda), so ψ^k[L] = [L]^k (Z.3/adams-line-element); [L]^k = [L^{⊗k}] (Z.3/finite-projective-monoidal) and [L][L^∨] = 1 (evaluation isomorphism, mathlib:Module.Invertible.linearEquiv).

**Acceptance.**

- ψ²([R]) = [R].
- For I = (2, 1 + √−5) ⊂ ℤ[√−5]: ψ²[I] = [I ⊗ I] = [I²] and I² = (2) is principal, so ψ²[I] = [R].

**Prerequisites.**

- KTheoryLowDegrees:Z.3/ring-k0-pre-lambda
- KTheoryLowDegrees:Z.3/adams-line-element
- KTheoryLowDegrees:Z.3/finite-projective-monoidal
- mathlib:Module.Invertible.linearEquiv

**Sources.**

- Kbook.II, II §4, Positive structures, p. 26. Line bundles are the line elements of K₀(R).
- Kbook.II, II §4, Adams operations, p. 28. ψ^k on line elements.

### Degree-zero normalisation of the Adams operations

**KTheoryLowDegrees:Z.3/ring-k0-adams-rank-det** · theorem · implementation unchecked.

For every x ∈ K₀(R) and k ≥ 1: rank(ψ^k x) = rank(x) in H⁰(Spec R, ℤ) and det(ψ^k x) = det(x)^k in Pic(R). In particular ψ^k preserves I_R and ψ^k[L] = [L^{⊗k}]. This fixes the degree-zero normalisation of the Adams operations of SchemeKTheoryOperations S.6: on (rank, det) they act by (id, k-th power).

**Hypotheses.**

- R is a commutative unital ring; the zero ring is allowed.

**Construction or proof.**

- rank is a pre-λ-homomorphism to the binomial ring H⁰ (Z.3/rank-lambda), so rank(ψ^k x) = ψ^k(rank x) = rank x (API adams_map of Z.3/adams-operations, Z.3/adams-binomial).
- Write x = rankSection(rank x) + x₀ with x₀ ∈ I_R (Z.3/ring-k0-augmented). ψ^k is additive (Z.3/adams-add) and fixes rankSection(rank x) (Z.3/adams-binomial), on which det is 1 (Z.3/determinant-hom).
- ψ^k(x₀) ≡ kx₀ modulo F²_γ (Z.3/adams-first-graded) and det(F²_γ) = 1 (Z.3/determinant-kills-gamma-two), so det(ψ^k x₀) = det(kx₀) = det(x₀)^k = det(x)^k.

**Acceptance.**

- For invertible L: det(ψ^k[L]) = Pic.mk(L^{⊗k}).
- For P of constant rank 2: rank ψ²[P] = 2 and det ψ²[P] = det(P)².

**Prerequisites.**

- KTheoryLowDegrees:Z.3/rank-lambda
- KTheoryLowDegrees:Z.3/adams-operations
- KTheoryLowDegrees:Z.3/adams-binomial
- KTheoryLowDegrees:Z.3/adams-add
- KTheoryLowDegrees:Z.3/adams-first-graded
- KTheoryLowDegrees:Z.3/ring-k0-augmented
- KTheoryLowDegrees:Z.3/determinant-hom
- KTheoryLowDegrees:Z.3/determinant-kills-gamma-two

**Sources.**

- Kbook.II, II Proposition 4.9, p. 32. The weight-one congruence, combined with det(F²_γ) = 1, gives the determinant normalisation.

### Grothendieck's product polynomial

**KTheoryLowDegrees:Z.3/lambda-universal-polynomials** · construction · implementation unchecked.

For k≥1 there is a unique polynomial P_k∈ℤ[a₁,…,a_k;b₁,…,b_k] expressing e_k((ξ_iη_j)) in the elementary symmetric functions of ξ and η when n,m≥k. It is isobaric of weight k in each group and stable under adding zero variables. The normalisation is P₁=a₁b₁ (Atiyah–Tall), with Witt-series unit 1+t.

**Hypotheses.**

- k≥1; n,m≥k; coefficient ring ℤ. Specialisation to fewer variables sets higher elementary coefficients to zero.

**Construction or proof.**

- The left-hand sides are symmetric in ξ (and separately in η): a permutation of the ξ_i permutes the listed family (mathlib:MvPolynomial.IsSymmetric).
- Fundamental theorem of symmetric polynomials (mathlib:MvPolynomial.esymmAlgEquiv; unbundled tauceti:MvPolynomial.IsSymmetric.exists_aeval_esymm): apply it in ξ over ℤ[η], then in η.
- Isobaric weight: e_k of a family of monomials of degree d is homogeneous of degree kd, and the fundamental-theorem polynomial of a homogeneous symmetric polynomial of degree w has weight w.
- Independence of n: ξ_n ↦ 0 sends e_j(ξ₁..ξ_n) to e_j(ξ₁..ξ_{n−1}) (e_n ↦ 0) and the family to the family for n − 1 plus zeros; uniqueness in n − 1 ≥ k variables (mathlib:MvPolynomial.esymmAlgHom_fin_injective).

**Acceptance.**

- P₁(a₁; b₁) = a₁b₁.
- P₂ = a₁²b₂ + a₂b₁² − 2a₂b₂.
- P₂ ≠ a₂b₂ + a₁b₁: in ℤ, λ²(2·2) = 6 while λ²(2)λ²(2) + 2·2 = 5.

**Prerequisites.**

- mathlib:MvPolynomial.esymm
- mathlib:MvPolynomial.IsSymmetric
- mathlib:MvPolynomial.esymmAlgEquiv
- mathlib:MvPolynomial.esymmAlgHom_fin_injective
- tauceti:MvPolynomial.IsSymmetric.exists_aeval_esymm
- mathlib:MvPolynomial.psum
- mathlib:MvPolynomial.psum_eq_mul_esymm_sub_sum
- mathlib:MvPolynomial.mul_esymm_eq_sum

**Uses.**

- KTheoryLowDegrees:Z.3/special-lambda-ring: the product and composition axioms
- KTheoryLowDegrees:Z.3/lambda-identity-principle: identities in special λ-rings reduce to identities of these polynomials
- KTheoryLowDegrees:Z.3/adams-operations: ψ^k = N_k(λ¹, …, λ^k)

**Public API.**

- TauCeti.LambdaRing.productPoly (constructor): P_k ∈ ℤ[a₁..a_k; b₁..b_k].
- TauCeti.LambdaRing.productPoly_esymm (characterisation): e_k((ξ_iη_j)) = P_k(e(ξ); e(η)) for n, m ≥ k.
- TauCeti.LambdaRing.productPoly_unique (extensionality): A polynomial with the defining property for some n, m ≥ k equals P_k.
- TauCeti.LambdaRing.productPoly_isobaric (other): P_k is isobaric of weight k separately in the a and b variables.

**Unit tests.**

- TauCeti.LambdaRing.productPoly_one_test (computation): P₁(a₁; b₁) = a₁b₁.
- TauCeti.LambdaRing.productPoly_two_test (computation): P₂ = a₁²b₂ + a₂b₁² − 2a₂b₂.
- TauCeti.LambdaRing.productPoly_ne_naive_test (non-example): P₂ ≠ a₂b₂ + a₁b₁: in ℤ, λ²(2·2) = 6 while λ²(2)λ²(2) + 2·2 = 5.

**Sources.**

- Kbook.II, II Example 4.3, p. 27. The product polynomials; Weibel defines them through the Witt product, whose stated sign convention is corrected in sourceIssues.
- Kbook.II, II Example 4.3, p. 27. The composition polynomials.
- Soule.1985, §1.1 (p. 490). Soulé's λ-ring axioms use the same universal integral polynomials (Grothendieck, SGA 6).

### Special λ-rings

**KTheoryLowDegrees:Z.3/special-lambda-ring** · definition · implementation unchecked.

A special λ-ring (Grothendieck's λ-anneau, Atiyah's and Weibel's special λ-ring) is a pre-λ-ring K (Z.3/pre-lambda-ring) such that for all x, y ∈ K and k, l ≥ 1: λ^k(1) = 0 for k ≥ 2; λ^k(xy) = P_k(λ¹x,…,λ^kx; λ¹y,…,λ^ky); λ^k(λ^l x) = P_{k,l}(λ¹x,…,λ^{kl}x), with the polynomials of Z.3/lambda-universal-polynomials. Homomorphisms are pre-λ-ring homomorphisms. Equivalently λ_t : K → Λ(K) = 1 + tK[[t]] is a homomorphism of pre-λ-rings for Grothendieck's λ-ring structure on Λ(K) (unit 1 + t, (1 + at)∘(1 + bt) = 1 + abt). Non-unital λ-algebras (for K(A) = ⊕K_m(A) and K^Y(X)) are SchemeKTheoryOperations S.6's and build on this definition.

**Hypotheses.**

- K is a pre-λ-ring; the zero ring is allowed.

**Construction or proof.**

- Extend the pre-λ-ring structure by the three axioms (a Prop-valued mixin on PreLambdaRing).
- The quotient of a special λ-ring by a λ-ideal is special, and a pre-λ-subring of a special λ-ring is special: the axioms are identities.

**Acceptance.**

- ℤ with the binomial operations is special (Z.3/binomial-special); λ²(3·2) = 15 = P₂(3, 3; 2, 1).
- The pre-λ-ring ℤ with λ_t(m) = (1 + t + t²)^m is not special: λ²(1) = 1.

**Prerequisites.**

- KTheoryLowDegrees:Z.3/pre-lambda-ring
- KTheoryLowDegrees:Z.3/lambda-universal-polynomials
- KTheoryLowDegrees:Z.3/pre-lambda-hom
- KTheoryLowDegrees:Z.3/lambda-ideal
- KTheoryLowDegrees:Z.3/lambda-composition-polynomial

**Uses.**

- K-book II 4.3–4.12: Adams operations are ring endomorphisms, the γ-filtration and the Chern character behave as expected
- KTheoryLowDegrees:Z.3/ring-k0-special: K₀(R) is special
- SchemeKTheoryOperations:S.6 (Soulé's λ-structure on K(A), R_ℤ(GL)): special λ-rings and non-unital special λ-algebras

**Public API.**

- TauCeti.LambdaRing (structure): A pre-λ-ring satisfying λ^k(1) = 0 (k ≥ 2), the product axiom with P_k and the composition axiom with P_{k,l}.
- TauCeti.LambdaRing.lambda_mul (relation): λ^k(xy) = P_k(λ^•x; λ^•y).
- TauCeti.LambdaRing.lambda_lambda (relation): λ^k(λ^l x) = P_{k,l}(λ^•x).
- TauCeti.LambdaRing.lambda_natCast (simp): λ^k(n) = C(n, k) (Z.3/lambda-nat-cast).
- TauCeti.LambdaRing.ofSubring (constructor): A pre-λ-subring of a special λ-ring is special.
- TauCeti.LambdaRing.quotientSpecial (instance): The quotient by a λ-ideal is special.
- TauCeti.LambdaRing.int (instance): ℤ with the binomial operations (Z.3/binomial-special).

**Unit tests.**

- TauCeti.LambdaRing.int_special_test (computation): In ℤ: λ²(6) = 15 = P₂(λ¹3, λ²3; λ¹2, λ²2) = 9·1 + 3·4 − 2·3·1.
- TauCeti.LambdaRing.zero_ring_special_test (degenerate): The zero ring is a special λ-ring.
- TauCeti.LambdaRing.not_special_test (non-example): The pre-λ-ring ℤ with λ_t(m) = (1 + t + t²)^m satisfies the pre-λ axioms but λ²(1) = 1 ≠ 0, so it is not special.
- TauCeti.LambdaRing.monoid_special_test (compatibility): ℤ[M] with λ_t(m) = 1 + mt is special (Z.3/monoid-lambda-ring); for M = ℤ, λ²(u + u^{−1}) = 1.
- TauCeti.RingK0.special_test (compatibility): K₀(R) with Z.3/lambda is special (Z.3/ring-k0-special), and for X = Spec R this is the special λ-ring K₀(Vect X) of SchemeKTheoryOperations S.6.

**Sources.**

- Kbook.II, II Definition 4.3.1, p. 28. Weibel's definition (the Witt-ring convention is pinned as in Z.3/lambda-universal-polynomials; sourceIssues).
- Kbook.II, II Definition 4.3.1, p. 28. The first of the three axioms, as Weibel lists them.

### Binomial rings are special

**KTheoryLowDegrees:Z.3/binomial-special** · lemma · implementation unchecked.

ℤ with λ^k(m) = C(m, k), and more generally LocallyConstant X ℤ with the pointwise binomial operations (Z.3/binomial-lambda-ring), are special λ-rings.

**Hypotheses.**

- X is a topological space.

**Construction or proof.**

- For m, n ≥ 0, specialise the defining identities of P_k and P_{k,l} (Z.3/lambda-universal-polynomials) at ξ_i = 1 (i ≤ m), η_j = 1 (j ≤ n) in ℤ[ξ, η] with enough variables: e_j(1^m) = C(m, j), so C(mn, k) = P_k(C(m, •); C(n, •)) and C(C(m, l), k) = P_{k,l}(C(m, •)).
- Both sides are polynomials in m, n with rational coefficients; agreeing on ℕ², they agree on ℤ² (a polynomial vanishing on ℕ² is zero). λ^k(1) = C(1, k) = 0 for k ≥ 2.
- For LocallyConstant X ℤ the axioms hold pointwise.

**Acceptance.**

- λ²(−1·−1) = λ²(1) = 0 = P₂(−1, 1; −1, 1) = 1·1 + 1·1 − 2·1.
- λ²(λ²(4)) = C(6, 2) = 15 = P_{2,2}(4, 6, 4, 1) = 4·4 − 1.

**Prerequisites.**

- KTheoryLowDegrees:Z.3/binomial-lambda-ring
- KTheoryLowDegrees:Z.3/special-lambda-ring
- KTheoryLowDegrees:Z.3/lambda-universal-polynomials
- mathlib:Ring.choose_natCast
- KTheoryLowDegrees:Z.3/lambda-composition-polynomial

**Sources.**

- Kbook.II, II Example 4.3.2, p. 28. Special λ-rings as used here; ℤ is the initial one (Weibel's positive structures take H⁰ binomial).
- Kbook.II, II Example 4.1.1, p. 25. The binomial structure whose specialness the lemma proves.

### The special λ-ring of a monoid of line elements

**KTheoryLowDegrees:Z.3/monoid-lambda-ring** · construction · implementation unchecked.

For a commutative monoid M, the monoid ring ℤ[M] (mathlib:AddMonoidAlgebra ℤ M, written multiplicatively) carries a unique pre-λ-ring structure with λ_t(m) = 1 + mt for m ∈ M, and it is a special λ-ring. On x = m₁ + ⋯ + m_n, λ^k(x) = e_k(m₁,…,m_n); the Adams operations (Z.3/adams-operations) are the ring endomorphisms ψ^k(m) = m^k. Instances: the Laurent polynomial ring ℤ[u₁^{±1},…,u_s^{±1}] (M = ℤ^s, Weibel's universal W_s), the polynomial ring ℤ[ξ₁,…,ξ_n] (M = ℕ^n), and the character ring ℤ[X(T)] of a split torus T, in particular the diagonal torus of GL_N.

**Hypotheses.**

- M is a commutative monoid; ℤ[M] is torsion-free as an abelian group.

**Construction or proof.**

- Define λ_t on the free abelian group ℤ[M] as the additive-to-multiplicative extension of m ↦ 1 + mt; λ⁰ = 1 and λ¹ = id hold on generators and extend.
- Define ψ^k as the ring endomorphism induced by m ↦ m^k; it satisfies ψ^kψ^l = ψ^{kl}, commutes with every λ^l (it maps line elements to line elements), and agrees with the Newton-recursion ψ^k (both additive, equal on generators by Z.3/adams-line-element).
- Over ℚ[M] ⊇ ℤ[M], Newton's identities (mathlib:MvPolynomial.psum_eq_mul_esymm_sub_sum) express λ^k(z) by rational polynomials Q_k in ψ¹(z),…,ψ^k(z); since power sums of N ≥ k variables are algebraically independent over ℚ, the defining identities of P_k and P_{k,l} (Z.3/lambda-universal-polynomials) become polynomial identities in power sums, and ψʲ(xy) = ψʲ(x)ψʲ(y), ψʲ(λ^l x) = λ^l(ψʲx) = Q_l(ψʲx, ψ^{2j}x, …) turn them into the product and composition axioms in ℚ[M], hence in ℤ[M] (torsion-free). λ^k(1) = 0 because 1 ∈ M is a line element.
- Uniqueness: a pre-λ-structure is determined by λ_t on additive generators.

**Acceptance.**

- In ℤ[u^{±1}]: λ²(u + u^{−1}) = 1 and ψ³(u + u^{−1}) = u³ + u^{−3}.
- For M trivial, ℤ[M] = ℤ with the binomial structure.

**Prerequisites.**

- KTheoryLowDegrees:Z.3/special-lambda-ring
- KTheoryLowDegrees:Z.3/pre-lambda-ring
- KTheoryLowDegrees:Z.3/lambda-universal-polynomials
- KTheoryLowDegrees:Z.3/adams-operations
- KTheoryLowDegrees:Z.3/adams-line-element
- KTheoryLowDegrees:Z.3/adams-add
- mathlib:MvPolynomial.psum_eq_mul_esymm_sub_sum
- mathlib:AddMonoidAlgebra
- mathlib:LaurentPolynomial
- KTheoryLowDegrees:Z.3/pre-lambda-hom
- KTheoryLowDegrees:Z.3/lambda-line-element
- KTheoryLowDegrees:Z.3/lambda-composition-polynomial
- KTheoryLowDegrees:Z.3/lambda-newton-polynomial

**Uses.**

- KTheoryLowDegrees:Z.3/lambda-identity-principle: the universal case in which identities are checked
- KTheoryLowDegrees:Z.3/serre-representation-ring-theorem: R_ℤ(G) embeds as a pre-λ-subring of the character ring ℤ[X(T)]
- K-book II Ex. 4.4: the universal special λ-ring W_s and the splitting principle for the free λ-ring

**Public API.**

- TauCeti.LambdaRing.monoidAlgebra (instance): The special λ-ring structure on ℤ[M] with λ_t(m) = 1 + mt.
- TauCeti.LambdaRing.monoidAlgebra_lambda_of (simp): λ^k(m) = 0 for k ≥ 2 and m ∈ M.
- TauCeti.LambdaRing.monoidAlgebra_lambda_sum (simp): λ^k(m₁ + ⋯ + m_n) = e_k(m₁,…,m_n).
- TauCeti.LambdaRing.monoidAlgebra_adams (simp): ψ^k is the ring map induced by m ↦ m^k.
- TauCeti.LambdaRing.monoidAlgebra_map (functoriality): A monoid homomorphism M → M′ induces a λ-homomorphism ℤ[M] → ℤ[M′].
- TauCeti.LambdaRing.monoidAlgebra_lift (universal-property): For a special λ-ring K and a monoid map from M to the line elements of K there is a unique λ-homomorphism ℤ[M] → K extending it (Weibel Ex. II.4.4(c)).

**Unit tests.**

- TauCeti.LambdaRing.monoidAlgebra_lambda_two_test (computation): In ℤ[u^{±1}], λ²(u + u^{−1}) = 1.
- TauCeti.LambdaRing.monoidAlgebra_trivial_test (degenerate): For the trivial monoid the structure is the binomial one on ℤ.
- TauCeti.LambdaRing.monoidAlgebra_adams_ne_frobenius_test (non-example): ψ²(u + 1) = u² + 1 ≠ (u + 1)² in ℤ[u]: ψ² is not squaring.
- TauCeti.LambdaRing.monoidAlgebra_special_test (characterisation): λ³(λ²(ξ₁ + ξ₂ + ξ₃)) = ξ₁²ξ₂²ξ₃² in ℤ[ξ₁, ξ₂, ξ₃], the value of P_{3,2}.

**Sources.**

- Kbook.II, II Exercise 4.4, p. 35. Weibel's universal special λ-ring W_s, whose line elements are the monomials (part (a) of the exercise).
- Serre.1968, §3.4 (p. 47). The character ring of a diagonalisable group is the group algebra of its character group (text layer of the scan).

### Identities in special λ-rings are checked on sums of line elements

**KTheoryLowDegrees:Z.3/lambda-identity-principle** · lemma · implementation unchecked.

Let F, G be expressions in variables x₁,…,x_r built from integer constants, +, −, · and the operations λ^k. If F = G holds in the special λ-ring ℤ[ξ^{(1)},…,ξ^{(r)}] (Z.3/monoid-lambda-ring) for x_j = ξ^{(j)}₁ + ⋯ + ξ^{(j)}_n (disjoint sets of n variables) and all sufficiently large n, then F = G for all x₁,…,x_r in every special λ-ring. Augmented form: identities for elements of the augmentation ideal are checked on (ξ₁ − 1) + ⋯ + (ξ_n − 1). Fixed rank: an identity between integer polynomials in λ¹(p),…,λⁿ(p) holding for p = ξ₁ + ⋯ + ξ_n in ℤ[ξ₁,…,ξ_n] holds for every p with λʲ(p) = 0 for j > n.

**Hypotheses.**

- 'Sufficiently large' means n at least the largest index of a λ^k occurring after expansion.

**Construction or proof.**

- By induction on the expression, the special λ-ring axioms (sum formula, λ_t(−z) = λ_t(z)^{−1}, λ^k(n) = C(n, k), product and composition axioms) rewrite F and G as integer polynomials f, g in the elements λⁱ(x_j), by a rewriting that is the same in every special λ-ring.
- In ℤ[ξ] with x_j as stated, λⁱ(x_j) = e_i(ξ^{(j)}) (Z.3/monoid-lambda-ring), and these are algebraically independent for i ≤ n (mathlib:MvPolynomial.esymmAlgHom_fin_injective); so f(e(ξ)) = g(e(ξ)) forces f = g.
- Augmented and fixed-rank forms: λⁱ(x − n) and the λⁱ(x) are mutually integral polynomials, and the relations λʲ(p) = 0 for j > n are exactly e_j = 0 for j > n in n variables.

**Acceptance.**

- ψ^k(xy) = ψ^k(x)ψ^k(y) reduces to p_k(ξ_iη_j) = p_k(ξ)p_k(η).
- λ²(λ²x) = xλ³(x) − λ⁴(x) is checked on ξ₁ + ⋯ + ξ₄.

**Prerequisites.**

- KTheoryLowDegrees:Z.3/special-lambda-ring
- KTheoryLowDegrees:Z.3/monoid-lambda-ring
- KTheoryLowDegrees:Z.3/lambda-universal-polynomials
- KTheoryLowDegrees:Z.3/lambda-neg-recursion
- KTheoryLowDegrees:Z.3/lambda-nat-cast
- mathlib:MvPolynomial.esymmAlgHom_fin_injective
- KTheoryLowDegrees:Z.3/lambda-composition-polynomial

**Sources.**

- Kbook.II, II Exercise 4.4, p. 35. Weibel's universal case; the lemma proves the reduction by algebraic independence instead of the Filtered Splitting Principle.
- Soule.1985, §1.4 (p. 492). Soulé's method of checking identities in a universal λ-ring.

### Adams operations are λ-ring endomorphisms

**KTheoryLowDegrees:Z.3/adams-ring-endomorphism** · theorem · implementation unchecked.

In a special λ-ring K, every ψ^k (k ≥ 1) is a ring endomorphism (ψ^k(1) = 1, ψ^k(xy) = ψ^k(x)ψ^k(y)) commuting with every λ^l, hence a λ-ring endomorphism. In particular this holds in K₀(R) (Z.3/ring-k0-special).

**Hypotheses.**

- K is a special λ-ring (the product and composition axioms are used).

**Construction or proof.**

- ψ^k is additive (Z.3/adams-add) and ψ^k(1) = 1 since 1 is a line element (Z.3/adams-line-element).
- By Z.3/lambda-identity-principle check ψ^k(xy) = ψ^k(x)ψ^k(y) and ψ^k(λ^l x) = λ^l(ψ^k x) on x = Σξ_i, y = Ση_j: there ψ^k(x) = p_k(ξ) (Z.3/monoid-lambda-ring), p_k(ξ_iη_j) = p_k(ξ)p_k(η) and λ^l(p_k(ξ)) = e_l(ξ₁^k, …) = p_k applied to e_l(ξ).

**Acceptance.**

- In ℤ, ψ² = id, so ψ²(2·2) = 4 = ψ²(2)ψ²(2).
- In K₀(R): ψ²([L][M]) = [L²M²] = ψ²[L]·ψ²[M].

**Prerequisites.**

- KTheoryLowDegrees:Z.3/adams-add
- KTheoryLowDegrees:Z.3/adams-line-element
- KTheoryLowDegrees:Z.3/lambda-identity-principle
- KTheoryLowDegrees:Z.3/monoid-lambda-ring
- mathlib:MvPolynomial.psum

**Sources.**

- Kbook.II, II Proposition 4.4, p. 28. The statement; the node proves it for all special λ-rings through the identity principle.
- Soule.1985, §1.5 (p. 493). Soulé: ψ^k is an endomorphism of λ-rings (the text layer of the formulae around this phrase is unreadable).

### Composition of Adams operations

**KTheoryLowDegrees:Z.3/adams-composition** · theorem · implementation unchecked.

In a special λ-ring K, ψ^k ∘ ψ^l = ψ^{kl} for all k, l ≥ 1; in particular the ψ^k commute.

**Hypotheses.**

- K is a special λ-ring.

**Construction or proof.**

- By Z.3/lambda-identity-principle check on x = Σξ_i: ψ^k(ψ^l x) = p_k(ξ₁^l, …) = p_{kl}(ξ) = ψ^{kl}(x) (Z.3/monoid-lambda-ring).

**Acceptance.**

- ψ²ψ³ = ψ⁶ on ℤ[ξ]: both send ξ to ξ⁶.
- In K₀(R): ψ²ψ³[L] = [L⁶].

**Prerequisites.**

- KTheoryLowDegrees:Z.3/lambda-identity-principle
- KTheoryLowDegrees:Z.3/monoid-lambda-ring
- KTheoryLowDegrees:Z.3/adams-operations

**Sources.**

- Kbook.II, II Proposition 4.4, p. 28. The composition law.

### Frobenius congruence for Adams operations

**KTheoryLowDegrees:Z.3/adams-frobenius** · lemma · implementation unchecked.

In a special λ-ring K and for every prime p: ψ^p(x) ≡ x^p modulo pK.

**Hypotheses.**

- K is a special λ-ring; p is prime.

**Construction or proof.**

- ψ^p(x) − x^p = Q(λ¹x, …, λ^px) for the integer polynomial Q = N_p − a₁^p (Z.3/lambda-universal-polynomials).
- Q(e(ξ)) = p_p(ξ) − p₁(ξ)^p = p·f with f ∈ ℤ[ξ] (multinomial coefficients); f is symmetric because p·f is and ℤ[ξ] is torsion-free, so f = g(e(ξ)) with g integral (fundamental theorem), and Q = p·g by algebraic independence. Hence ψ^p(x) − x^p = p·g(λ^•x).

**Acceptance.**

- ψ²(x) = x² − 2λ²(x) ≡ x² mod 2.
- ψ³(x) = x³ − 3xλ²x + 3λ³x ≡ x³ mod 3.

**Prerequisites.**

- KTheoryLowDegrees:Z.3/adams-operations
- KTheoryLowDegrees:Z.3/lambda-universal-polynomials
- KTheoryLowDegrees:Z.3/special-lambda-ring
- mathlib:MvPolynomial.esymmAlgEquiv
- mathlib:MvPolynomial.psum

**Sources.**

- Kbook.II, II Exercise 4.7, p. 36. The congruence; the node's proof needs only the special λ-ring axioms and the fundamental theorem of symmetric polynomials.

### The representation rings R_ℤ(GL_{N₁} × ⋯ × GL_{N_r})

**KTheoryLowDegrees:Z.3/representation-ring-of-gl** · definition · implementation unchecked.

Let G = GL_{N₁} × ⋯ × GL_{N_r} be a product of general linear group schemes over ℤ, with coordinate Hopf algebra ℤ[G] = ⊗_i ℤ[GL_{N_i}] (tauceti:TauCeti.GeneralLinear.coordinateHopfAlgebra; product: tauceti:TauCeti.AffineGroup.Product.pointsMulEquiv). A representation of G is a right comodule over ℤ[G] (tauceti:TauCeti.Comodule) whose underlying ℤ-module is finite free; equivalently, for every commutative ring A, a group homomorphism G(A) → GL(A ⊗ V) natural in A (tauceti:TauCeti.HopfAlgebra.pointRepresentationEquivComodule). R_ℤ(G) is the Grothendieck group of these representations for short exact sequences of representations (TauCeti.ExactK0 of this exact category), a commutative ring under ⊗ with unit the trivial representation ℤ, and a pre-λ-ring under exterior powers Λ^k (the exterior filtration of an extension is G-stable, Z.3/exterior-extension-filtration). Restriction to the diagonal torus T = ∏ T_{N_i} and the weight decomposition of T-comodules give the character map ch : R_ℤ(G) → ℤ[X(T)] = ℤ[X_{i,a}^{±1}], a pre-λ-ring homomorphism into the special λ-ring of Z.3/monoid-lambda-ring, with ch(std_i) = X_{i,1} + ⋯ + X_{i,N_i} for the standard representation std_i of the i-th factor. The inverse limit R_ℤ(GL) = lim_N R_ℤ(GL_N) and the elements (τ(id_N − N))_N attached to natural operations are SchemeKTheoryOperations S.6's and build on this definition.

**Hypotheses.**

- G is a finite product of GL_{N_i} over ℤ (N_i ≥ 0); representations are on finite free ℤ-modules (lattices).
- Isomorphic representations have the same class; the dual representation gives an involution.

**Construction or proof.**

- The category of ℤ[G]-comodules finite free over ℤ is an exact category (extensions of finite free modules are finite free, and the comodule structure passes to kernels and cokernels of comodule maps that are split over ℤ); take its exact K₀ (tauceti:TauCeti.ExactK0).
- Tensor products and exterior powers of comodules are comodules (tauceti:TauCeti.Comodule.tensor; exterior powers as quotients of tensor powers by a subcomodule); ⊗ is biexact over ℤ-free modules, giving the ring structure.
- For an exact sequence 0 → V′ → V → V″ → 0 of representations, the filtration of Λ^kV of Z.3/exterior-extension-filtration is by subcomodules (it is canonical, so it is preserved by every g ∈ G(A)), with graded pieces Λ^iV′ ⊗ Λ^{k−i}V″ (Z.3/exterior-extension-graded, V″ free); hence λ_t(V) = λ_t(V′)λ_t(V″) and λ_t descends to R_ℤ(G) (tauceti:TauCeti.ExactK0.lift).
- Use the native ℤ[X(T)]-comodule weight spaces. The additive underlying character is latticeCharacter from torus-formal-character, composed with torus restriction after the exact-carrier identification; the coefficient square is supplied by gl-product-restriction-basechange; the induced exact K₀ and formal-character transport remains an explicit gap. This is the same rank sum ch(V)=Σ_m rank(V_m)·m. Tensor products multiply weights, and exterior powers of a graded free module with weights m_j have weights the products of k distinct m_j. These calculations give the multiplicative and pre-λ compatibility of the existing ofGL.character, with no second independently chosen character map.

**Acceptance.**

- R_ℤ(GL₁) ≅ ℤ[t, t^{−1}] with t = std₁ (the character map is an isomorphism for a torus).
- λ²(std₂) = det, the representation g ↦ det g of GL₂, and ch(det) = X₁X₂.
- Use the product coefficient and diagonal square recorded here. The single-factor equivalences and the torus coefficient comparison are pinned baseline declarations; retain the stated integral-freeness and arbitrary-field character-image boundaries.

**Prerequisites.**

- tauceti:TauCeti.GeneralLinear.coordinateHopfAlgebra
- tauceti:TauCeti.AffineGroup.Product.pointsMulEquiv
- tauceti:TauCeti.Comodule
- tauceti:TauCeti.Comodule.tensor
- tauceti:TauCeti.HopfAlgebra.pointRepresentationEquivComodule
- tauceti:TauCeti.GeneralLinear.standardComodule
- tauceti:TauCeti.GeneralLinear.diagonalTorus
- tauceti:TauCeti.ExactK0
- tauceti:TauCeti.ExactK0.lift
- KTheoryLowDegrees:Z.3/exterior-extension-filtration
- KTheoryLowDegrees:Z.3/exterior-extension-graded
- KTheoryLowDegrees:Z.3/pre-lambda-ring
- KTheoryLowDegrees:Z.3/monoid-lambda-ring
- KTheoryLowDegrees:Z.3/torus-formal-character
- KTheoryLowDegrees:Z.3/gl-product-coordinate-algebra
- KTheoryLowDegrees:Z.3/gl-product-restriction-basechange
- KTheoryLowDegrees:Z.3/pre-lambda-hom

**Uses.**

- KTheoryLowDegrees:Z.3/associated-projective-module: a tuple of projectives of constant ranks N_i gives a pre-λ-homomorphism R_ℤ(G) → K₀(R)
- KTheoryLowDegrees:Z.3/ring-k0-special: identities in R_ℤ(G) are transported to K₀(R)
- SchemeKTheoryOperations:S.6 (Soulé 1985 §1): R_ℤ(GL) = lim R_ℤ(GL_N) as the universal source of operations on higher K-theory

**Public API.**

- TauCeti.RepresentationRing.GLRep (structure): A representation of G = ∏ GL_{N_i} over ℤ: a ℤ[G]-comodule, finite free over ℤ.
- TauCeti.RepresentationRing.ofGL (constructor): R_ℤ(G), the exact K₀ of GLRep, with ⊗.
- TauCeti.RepresentationRing.ofGL.preLambda (instance): The pre-λ-ring structure by exterior powers.
- TauCeti.RepresentationRing.ofGL.std (constructor): The classes std_i of the standard representations, and det_i = λ^{N_i}(std_i).
- TauCeti.RepresentationRing.ofGL.character (constructor): ch : R_ℤ(G) → ℤ[X(T)], a pre-λ-homomorphism.
- TauCeti.RepresentationRing.ofGL.character_std (simp): ch(std_i) = X_{i,1} + ⋯ + X_{i,N_i}.
- TauCeti.RepresentationRing.ofGL.restrict (functoriality): Restriction along homomorphisms of such products (e.g. diag(g, 1) : GL_N → GL_{N+1}) is a pre-λ-homomorphism.
- TauCeti.RepresentationRing.ofGL.dual (structure): The involution V ↦ V^∨, with det^∨ = det^{−1}.

**Unit tests.**

- TauCeti.RepresentationRing.ofGL_one_test (computation): R_ℤ(GL₁) = ℤ[t, t^{−1}] with λ^k(t) = 0 for k ≥ 2.
- TauCeti.RepresentationRing.ofGL_zero_test (degenerate): For N = 0, GL₀ is trivial and R_ℤ(GL₀) = ℤ with the binomial structure.
- TauCeti.RepresentationRing.ofGL_lambda_top_test (computation): λ^N(std_N) = det, invertible with inverse det^∨.
- TauCeti.RepresentationRing.ofGL_not_abstract_group_test (non-example): R_ℤ(GL₁) is not the representation ring of the abstract group GL₁(ℤ) = {±1}: restriction sends t to the sign character σ with σ² = 1, while t² ≠ 1 in ℤ[t^{±1}].
- TauCeti.RepresentationRing.ofGL_character_test (compatibility): ch(λ²(std₂ ⊗ std₂)) = P₂(e(X); e(X)) evaluated at X₁, X₂: the character of Λ² of the tensor square of the standard representation of GL₂.

**Sources.**

- Serre.1968, Introduction (p. 37). The definition of R_ℤ(GL_n) as a Grothendieck group for exact sequences (text layer of the scan: GL^ is GL_n).
- Serre.1968, §3.4 (p. 48). The character map of a diagonalisable group (text layer of the scan; printed: L'homomorphisme ch).
- Soule.1985, §1.1 (p. 490). Soulé's R_ℤ(GL_N).

### Serre's computation of R_ℤ(GL_N)

**KTheoryLowDegrees:Z.3/serre-representation-ring-theorem** · theorem · implementation unchecked.

Let G = GL_{N₁} × ⋯ × GL_{N_r} over ℤ with diagonal torus T and Weyl group W = ∏ Σ_{N_i}. The character map ch : R_ℤ(G) → ℤ[X(T)] of Z.3/representation-ring-of-gl is injective with image ℤ[X(T)]^W; for r = 1, R_ℤ(GL_N) = ℤ[λ¹(std), …, λ^N(std), λ^N(std)^{−1}] ≅ ℤ[λ₁,…,λ_N]_{λ_N}. Consequently R_ℤ(G) is a special λ-ring (a pre-λ-subring, via ch, of the special λ-ring ℤ[X(T)] of Z.3/monoid-lambda-ring). Serre proves this for split reductive groups over a principal ideal ring: over a field k by Théorème 4, and over ℤ by Théorème 5 (the maps R_ℤ(G) → R_ℚ(G) and R_ℚ(G) → R_{𝔽_p}(G) are isomorphisms).

**Hypotheses.**

- G is a finite product of general linear groups over ℤ (split reductive).
- The field case uses Serre's Lemma 5, the classification of simple modules of a split reductive group by highest weight, which Serre attributes to Chevalley's seminar; that input is recorded as a gap.

**Construction or proof.**

- Over a field k, the arbitrary-field highest-weight and descent input (Serre Lemma 5, recorded as a gap), Jordan–Hölder and the finite-interval triangular character argument give Theorem 4. The preceding finite-free comparison is integral-comodule-k0-comparison; integral-gl-exact-comparison identifies its carrier with the representation group. The coefficient-freeness bridge needed to apply those nodes to the integral GL coordinate algebra remains in the gap.
- For a free coefficient coalgebra over ℤ, the generic quotient, Euler reduction and residue-annihilation nodes construct d_p. The new torus-character-basechange and restriction-formal-character nodes prove Ch_𝔽p∘d_p=Ch_ℚ in decomposition-character-compatibility. If the two field characters are injective with the same image, decomposition-isomorphism-from-characters proves d_p bijective and the integral comparison. Applying this to the pinned GL model still needs its free integral coordinate coalgebra, the direct-model exact K₀/formal-character transport, and the arbitrary-field character theorem with common image ℤ[X]^W.
- For GL_N, ℤ[M]^W = ℤ[X₁^{±1},…,X_N^{±1}]^{Σ_N} = ℤ[λ₁,…,λ_N]_{λ_N}, λ_i = e_i(X) = ch(Λ^i std) (Serre §3.8; mathlib:MvPolynomial.esymmAlgEquiv for the polynomial part).
- Specialness: ch is an injective pre-λ-homomorphism into a special λ-ring, and the special axioms are identities, so they hold in R_ℤ(G) (API ofSubring of Z.3/special-lambda-ring).

**Acceptance.**

- For N = 2: λ²(λ²(std₂)) = λ²(det) = 0 and λ²(std₂ ⊗ std₂) has character e₁²e₂ + e₂e₁² − 2e₂² = P₂(e; e).
- ψ²(std₂) has character X₁² + X₂² = λ₁² − 2λ₂.
- Use the product coefficient and diagonal square recorded here. The single-factor equivalences and the torus coefficient comparison are pinned baseline declarations; retain the stated integral-freeness and arbitrary-field character-image boundaries.

**Prerequisites.**

- KTheoryLowDegrees:Z.3/representation-ring-of-gl
- KTheoryLowDegrees:Z.3/monoid-lambda-ring
- KTheoryLowDegrees:Z.3/special-lambda-ring
- mathlib:MvPolynomial.esymmAlgEquiv
- KTheoryLowDegrees:Z.3/integral-comodule-k0-comparison
- KTheoryLowDegrees:Z.3/integral-gl-exact-comparison
- KTheoryLowDegrees:Z.3/integral-comodule-generic-isomorphism
- KTheoryLowDegrees:Z.3/integral-comodule-decomposition-map
- KTheoryLowDegrees:Z.3/decomposition-character-compatibility
- KTheoryLowDegrees:Z.3/decomposition-isomorphism-from-characters
- KTheoryLowDegrees:Z.3/gl-product-coordinate-algebra
- KTheoryLowDegrees:Z.3/gl-product-restriction-basechange

**Sources.**

- Serre.1968, Théorème 4 (p. 49). The field case (checked against the page image; the text layer reads 'Uhomomorphisme ch^').
- Serre.1968, Lemma 5 and the paragraph after it (p. 49). The classification input is Chevalley's, cited and not proved; recorded as a gap (checked against the page image).
- Serre.1968, Théorème 5 (p. 51). The comparison over a principal ideal ring (text layer; printed d_v (v ∈ V)).
- Soule.1985, §1.1 (p. 490). Soulé's statement that R_ℤ(GL_N) is a special λ-ring (text layer; printed λ-anneau).

### Associated projective modules and the λ-map from R_ℤ(GL)

**KTheoryLowDegrees:Z.3/associated-projective-module** · construction · implementation unchecked.

Let R be commutative and P₁,…,P_r finitely generated projective R-modules of constant ranks N₁,…,N_r; put G = GL_{N₁} × ⋯ × GL_{N_r}. For a representation V of G (Z.3/representation-ring-of-gl) the associated module V(P) is obtained by open patching: choose s₁,…,s_c ∈ R generating the unit ideal with every P_i[1/s_a] free, bases, and transition matrices g^{(i)}_{ab} ∈ GL_{N_i}(R[1/s_as_b]); V(P) is the finitely generated projective module patched from the free modules R[1/s_a] ⊗ V along the images of (g^{(1)}_{ab},…,g^{(r)}_{ab}) under the representation. V ↦ V(P) is independent of the choices up to canonical isomorphism, exact, compatible with ⊗, Λ^k and scalar extension, and std_i(P) ≅ P_i. Hence τ_P : R_ℤ(G) → K₀(R), [V] ↦ [V(P)], is a pre-λ-ring homomorphism with τ_P(std_i) = [P_i].

**Hypotheses.**

- R is a commutative unital ring; the zero ring is allowed.
- Each P_i has constant rank N_i (in general, decompose Spec R into the finitely many clopens of constant ranks, Z.2/rank-fibre-decomposition).

**Construction or proof.**

- Local triviality: each P_i is locally free (Z.2/local-freeness); by quasi-compactness of Spec R choose finitely many s_a generating the unit ideal with all P_i[1/s_a] free (mathlib:Module.FinitePresentation.exists_free_localizedModule_powers).
- The transition matrices satisfy g_aa = 1 and g_ab g_bc = g_ac; a representation V gives group homomorphisms G(A) → GL(A ⊗ V) natural in A, so the images ρ_V(g_ab) satisfy the same cocycle identities; open patching (Weibel I.2.5, with the equaliser description of Z.3/projective-sheaf-condition) produces a finitely generated projective V(P) with V(P)[1/s_a] ≅ R[1/s_a] ⊗ V.
- Changing bases by h_a ∈ G(R[1/s_a]) changes the cocycle to h_a g_ab h_b^{−1}, and ρ_V(h_a) glue to an isomorphism; two covers are compared on a common refinement. So [V(P)] is well defined.
- Exactness, ⊗ and Λ^k: an exact sequence, tensor product or exterior power of representations gives the same construction on each R[1/s_a] ⊗ V, compatibly with the transition maps, and a sequence of modules is exact if it is so on a cover (Weibel I.5.3: patching extends natural operations on free modules); hence τ_P is additive on exact sequences, multiplicative and commutes with λ^k (Z.3/lambda-of).
- For V = std_i the cocycle is g^{(i)}_{ab} itself, which recovers P_i (Weibel I.2.5).

**Acceptance.**

- For r = 1, P = Rⁿ free: τ_P = rank-type map [V] ↦ [R ⊗ V] = (rank V)[R].
- τ_P(det_i) = [⋀^{N_i}P_i] in K₀(R); the Picard class of this top exterior line is det(P_i) (Z.3/determinant-projective).

**Prerequisites.**

- KTheoryLowDegrees:Z.3/representation-ring-of-gl
- KTheoryLowDegrees:Z.3/projective-sheaf-condition
- KTheoryLowDegrees:Z.3/lambda-of
- KTheoryLowDegrees:Z.3/ring-k0-pre-lambda
- KTheoryLowDegrees:Z.2/local-freeness
- KTheoryLowDegrees:Z.2/rank-fibre-decomposition
- mathlib:Module.FinitePresentation.exists_free_localizedModule_powers
- tauceti:TauCeti.GeneralLinear.pointsMulEquiv
- tauceti:TauCeti.ExactK0.lift

**Uses.**

- KTheoryLowDegrees:Z.3/ring-k0-special: identities in the special λ-ring R_ℤ(G) are transported to K₀(R)
- SchemeKTheoryOperations:S.6/vector-bundle-lambda-ring: the scheme version of associated bundles (Gillet–Soulé), which restricts to this on affine schemes
- K-book I 5.3: patching extends natural operations on free modules to locally free ones

**Public API.**

- TauCeti.RingK0.associatedModule (constructor): V(P) for a representation V of ∏ GL_{N_i} and projectives P_i of constant ranks N_i.
- TauCeti.RingK0.associatedModule_std (simp): std_i(P) ≃ₗ P_i.
- TauCeti.RingK0.associatedModule_tensor (structure): (V ⊗ W)(P) ≃ₗ V(P) ⊗ W(P).
- TauCeti.RingK0.associatedModule_exteriorPower (structure): (Λ^kV)(P) ≃ₗ ⋀^k(V(P)).
- TauCeti.RingK0.associatedModule_exact (structure): V ↦ V(P) takes exact sequences of representations to exact sequences.
- TauCeti.RingK0.associatedModule_baseChange (functoriality): S ⊗[R] V(P) ≃ₗ V(S ⊗ P) for R → S.
- TauCeti.RingK0.associatedLambdaHom (constructor): τ_P : R_ℤ(G) → K₀(R), a pre-λ-ring homomorphism with τ_P(std_i) = [P_i].

**Unit tests.**

- TauCeti.RingK0.associatedModule_free_test (degenerate): For free P_i = R^{N_i}: V(P) ≅ R ⊗ V, so τ_P([V]) = (rank V)[R].
- TauCeti.RingK0.associatedModule_det_test (computation): det(P)(P) = ⋀ⁿP for the determinant representation of GL_n; for I ⊕ R over ℤ[√−5] it is I.
- TauCeti.RingK0.associatedModule_lambda_test (compatibility): τ_P(λ^k std) = [⋀^kP] = λ^k[P] (Z.3/lambda-of).
- TauCeti.RingK0.associatedModule_not_abstract_test (non-example): The construction needs representations of the group scheme, not of an abstract group: the representation of GL₁(ℤ) = {±1} on ℤ² in which −1 swaps the coordinates is not the restriction of any representation of the group scheme GL₁ (those are ℤ-graded, so −1 acts diagonally in some basis over ℤ, while the swap is not diagonalisable over ℤ), and it cannot be evaluated on a cocycle g_ab ∈ GL₁(R[1/s_as_b]) = R[1/s_as_b]^×.

**Sources.**

- Kbook.I, I 2.5, Open Patching Data, p. 11. The patching construction of projective modules from free modules and a GL_n-cocycle.
- Kbook.I, I 5.3, Patching and Operations, p. 43. Associated modules for a representation are such a natural operation.
- Kbook.I, I Exercise 3.3, p. 24. The case V = det of the construction.

### K₀ of a commutative ring is a special λ-ring

**KTheoryLowDegrees:Z.3/ring-k0-special** · theorem · implementation unchecked.

For every commutative ring R, the pre-λ-ring K₀(R) of Z.3/ring-k0-pre-lambda is a special λ-ring (Z.3/special-lambda-ring): λ^k(1) = 0 for k ≥ 2, λ^k(xy) = P_k(λ^•x; λ^•y) and λ^k(λ^l x) = P_{k,l}(λ^•x) for all virtual classes x, y. Consequently the Adams operations of K₀(R) are λ-ring endomorphisms with ψ^kψ^l = ψ^{kl} and ψ^p(x) ≡ x^p mod p. The proof is Serre's representation-ring route and uses no projective-bundle theorem; it rests on the classification input of Z.3/serre-representation-ring-theorem, recorded as a gap.

**Hypotheses.**

- R is a commutative unital ring; the zero ring is allowed.

**Construction or proof.**

- λ^k(1) = 0 for k ≥ 2 is Z.3/lambda-free.
- Reduction to constant ranks: given finitely many classes, write each as [P] − [Q] (Z.1/ring-k0-class-induction) and choose a finite clopen partition of Spec R on whose pieces all the modules have constant rank (Z.2/rank-fibre-decomposition). K₀(R) ≅ ∏_j K₀(R_j) (Z.2/k0-pi) by the maps map(R → R_j), which are pre-λ-homomorphisms (Z.3/lambda-base-change) and ring homomorphisms (Z.3/map-ring-hom); an identity holds in K₀(R) if it holds in every K₀(R_j).
- Constant ranks: for x = [P₁] − [P₂], y = [P₃] − [P₄] with P_i of constant ranks N_i, let G = ∏_{i=1}^{4} GL_{N_i} and x_u = std₁ − std₂, y_u = std₃ − std₄ ∈ R_ℤ(G). R_ℤ(G) is special (Z.3/serre-representation-ring-theorem), so λ^k(x_u y_u) = P_k(λ^•x_u; λ^•y_u) and λ^k(λ^l x_u) = P_{k,l}(λ^•x_u).
- Apply the pre-λ-ring homomorphism τ_P : R_ℤ(G) → K₀(R) of Z.3/associated-projective-module, which sends x_u ↦ x and y_u ↦ y and commutes with sums, products and every λ^k; the identities hold for x and y.
- The consequences are Z.3/adams-ring-endomorphism, Z.3/adams-composition and Z.3/adams-frobenius.

**Acceptance.**

- λ²([P][Q]) = [P]²λ²[Q] + λ²[P][Q]² − 2λ²[P]λ²[Q]; for P = Q = R²: λ²[R⁴] = 6[R] = 4 + 4 − 2.
- For invertible L, M: λ²([L][M]) = λ²[L ⊗ M] = 0 = P₂([L], 0; [M], 0).
- ψ²([P][Q]) = ψ²[P]·ψ²[Q].

**Prerequisites.**

- KTheoryLowDegrees:Z.3/ring-k0-pre-lambda
- KTheoryLowDegrees:Z.3/special-lambda-ring
- KTheoryLowDegrees:Z.3/lambda-free
- KTheoryLowDegrees:Z.3/serre-representation-ring-theorem
- KTheoryLowDegrees:Z.3/associated-projective-module
- KTheoryLowDegrees:Z.3/lambda-base-change
- KTheoryLowDegrees:Z.3/map-ring-hom
- KTheoryLowDegrees:Z.1/ring-k0-class-induction
- KTheoryLowDegrees:Z.2/rank-fibre-decomposition
- KTheoryLowDegrees:Z.2/k0-pi

**Sources.**

- Kbook.II, II Corollary 8.8.3, p. 83 (the same in the combined draft, PDF p. 161). The statement; Weibel's proof goes through the flag-bundle splitting principle II.8.8.1 and the projective bundle theorem II.8.5, which lie downstream (SchemeKTheoryOperations S.5) and are not used here.
- Soule.1985, §1.2 (p. 490). Soulé's statement (λ-anneau = special λ-ring; text layer reads À-anneau); his §1.4 derives identities on K(A) from R_ℤ(GL), the route followed here.

### Gluing elements of a finitely generated projective module

**KTheoryLowDegrees:Z.3/projective-sheaf-condition** · lemma · implementation unchecked.

Let M be a finitely generated projective R-module and s₁,…,s_c ∈ R generate the unit ideal. The map M → ∏_a M[1/s_a] is injective, and its image consists of the families (m_a) whose images in M[1/(s_as_b)] agree for all a, b. In particular compatible local elements of M (and, applied to Hom(D, E), compatible local linear maps between finitely generated projectives) glue uniquely.

**Hypotheses.**

- R is a commutative unital ring; the zero ring is allowed.

**Construction or proof.**

- For M = R this is mathlib:Localization.existsUnique_algebraMap_eq_of_span_eq_top (the sheaf condition of the structure sheaf for a basic-open cover); it holds coordinatewise for Rⁿ, localisation commuting with finite products.
- M is a retract of some Rⁿ (mathlib:Module.Finite.exists_comp_eq_id_of_projective): i : M → Rⁿ, p : Rⁿ → M with p ∘ i = id. Glue the images i(m_a) in Rⁿ using the free-module sheaf condition, and apply p; uniqueness follows from the jointly injective family Rⁿ → ∏_a Rⁿ[1/s_a] and the injective retract map i. Individual localisation maps need not be injective.

**Acceptance.**

- For c = 1, s₁ = 1 the statement is trivial.
- For R = k × k with s₁ = (1, 0), s₂ = (0, 1): M = M₁ × M₂ and the condition is vacuous (s₁s₂ = 0).

**Prerequisites.**

- mathlib:Localization.existsUnique_algebraMap_eq_of_span_eq_top
- mathlib:Module.Finite.exists_comp_eq_id_of_projective
- mathlib:IsLocalizedModule.map

**Sources.**

- Kbook.I, I 2.5, Open Patching Data, p. 11. The patched module is the equaliser of the localisations; the lemma is the corresponding gluing statement for a given projective.

### Compatible local isomorphisms of invertible modules glue

**KTheoryLowDegrees:Z.3/invertible-local-iso** · lemma · implementation unchecked.

Let D, E be invertible R-modules and s₁,…,s_c generate the unit ideal. Given R[1/s_a]-linear isomorphisms φ_a : D[1/s_a] ≅ E[1/s_a] that agree after localisation at s_as_b, there is a unique isomorphism φ : D ≅ E localising to the φ_a; in particular Pic.mk D = Pic.mk E. Frame form: if D[1/s_a] and E[1/s_a] have generators d_a, e_a with the same transition units, d_a = u_ab d_b and e_a = u_ab e_b in the localisations at s_as_b, then D ≅ E by d_a ↦ e_a.

**Hypotheses.**

- R is a commutative unital ring; the zero ring is allowed.

**Construction or proof.**

- Hom_R(D, E) is finitely generated projective (D is finitely presented, projective) and its localisations are Hom(D[1/s], E[1/s]) (mathlib:Module.FinitePresentation.isLocalizedModule_map).
- Glue the φ_a to φ ∈ Hom(D, E) by Z.3/projective-sheaf-condition; φ is bijective because it is so after localising at each s_a (a linear map is bijective if it is so on a basic-open cover; mathlib:bijective_of_isLocalized_maximal after refining to maximal ideals).
- Frame form: φ_a(d_a) := e_a is compatible because the transition units agree.

**Acceptance.**

- D = E, φ_a = id glue to id.
- For R = ℤ[√−5] and I = (2, 1 + √−5), no family of local isomorphisms I[1/s_a] ≅ R[1/s_a] can be compatible: I is not principal.

**Prerequisites.**

- KTheoryLowDegrees:Z.3/projective-sheaf-condition
- mathlib:Module.FinitePresentation.isLocalizedModule_map
- mathlib:bijective_of_isLocalized_maximal
- mathlib:Module.Invertible
- mathlib:CommRing.Pic.mk_eq_mk_iff

**Sources.**

- Kbook.I, I Exercise 3.2, p. 24. Line bundles are compared through their patching units; the lemma is the gluing statement behind this.
- Kbook.I, I 5.3, Patching and Operations, p. 43. Locally defined isomorphisms glue.

### The Picard group of a finite product

**KTheoryLowDegrees:Z.3/pic-product-decomposition** · lemma · implementation unchecked.

Let e₁,…,e_c be complete orthogonal idempotents of R and R ≅ ∏ R_i the corresponding decomposition (R_i = R/(1 − e_i); mathlib:CompleteOrthogonalIdempotents.bijective_pi). Then Pic(R) → ∏_i Pic(R_i), L ↦ (R_i ⊗ L)_i (CommRing.Pic.mapRingHom), is a group isomorphism, with inverse (L_i) ↦ Pic.mk(∏_i L_i) (∏ L_i an R-module through R ≅ ∏ R_i). For the rank-fibre decomposition of a projective P this identifies det(P) with (Pic.mk ⋀^{n_i}P_i)_i.

**Hypotheses.**

- R is a commutative unital ring; the zero ring is allowed.

**Construction or proof.**

- Every R-module M is M ≅ ∏ e_iM with e_iM ≅ R_i ⊗ M (idempotent decomposition).
- M is invertible iff each e_iM is invertible over R_i: the dual, the tensor product and the evaluation map decompose factorwise, and a product of maps is bijective iff each factor is (Module.Invertible is defined by bijectivity of the evaluation).
- Isomorphisms of R-modules between such products are products of isomorphisms; so the map is bijective, and it is a homomorphism because mapRingHom is.

**Acceptance.**

- For R = k × k: Pic(R) = Pic(k) × Pic(k) = 1.
- For R = ℤ[√−5] × ℚ: Pic(R) ≅ ℤ/2 × 1.

**Prerequisites.**

- mathlib:CompleteOrthogonalIdempotents
- mathlib:CompleteOrthogonalIdempotents.bijective_pi
- mathlib:CommRing.Pic.mapRingHom
- mathlib:Module.Invertible
- mathlib:CommRing.Pic.mk_eq_mk_iff

**Sources.**

- Kbook.I, I §2, p. 10. The product decomposition along clopens.
- Kbook.I, I §3, p. 17. A product of line bundles over the factors is a line bundle over the product.

### Pic(R) as a module over H⁰(Spec R, ℤ)

**KTheoryLowDegrees:Z.3/pic-locally-constant-power** · construction · implementation unchecked.

For L ∈ Pic(R) and f ∈ H⁰(Spec R, ℤ) = LocallyConstant (PrimeSpectrum R) ℤ define L^f ∈ Pic(R) componentwise: if f takes the value n_i on the clopen U_i of a finite partition with idempotents e_i, then under Pic(R) ≅ ∏ Pic(R_i) (Z.3/pic-product-decomposition) L^f := (L_i^{n_i})_i. This is independent of the partition and makes the abelian group Pic(R) (written multiplicatively) a module over the ring H⁰(Spec R, ℤ): L^{f+g} = L^fL^g, L^{fg} = (L^f)^g, (LM)^f = L^fM^f, L^1 = L. For constant f = n it is L^n.

**Hypotheses.**

- R is a commutative unital ring; the zero ring is allowed.

**Construction or proof.**

- The value set of f is finite and its fibres are clopen (mathlib:IsLocallyConstant.range_finite); decompose R along them.
- Independence of the partition: on a common refinement the components of L are the base changes of those of the coarser partition (CommRing.Pic.mapRingHom_comp_mapRingHom), and powers commute with base change.
- The module axioms hold componentwise, where they are the ℤ-module axioms of the abelian groups Pic(R_i).

**Acceptance.**

- For connected Spec R, L^f = L^n with n the value of f.
- For R = k × k all powers are trivial.

**Prerequisites.**

- KTheoryLowDegrees:Z.3/pic-product-decomposition
- mathlib:LocallyConstant
- mathlib:IsLocallyConstant.range_finite
- mathlib:CommRing.Pic.mapRingHom_comp_mapRingHom
- KTheoryLowDegrees:Z.2/rank-fibre-decomposition

**Uses.**

- K-book II Corollary 2.6.2: the ring H⁰(R) ⊕ Pic(R) with Pic(R) a square-zero ideal
- KTheoryLowDegrees:Z.3/determinant-mul and Z.3/rank-det-ring: det(xy) = det(x)^{rank y}det(y)^{rank x} with locally constant exponents

**Public API.**

- TauCeti.PicardGroup.zpowLocallyConstant (constructor): L^f for L ∈ Pic R and f ∈ LocallyConstant (PrimeSpectrum R) ℤ.
- TauCeti.PicardGroup.zpowLocallyConstant_const (simp): L^{const n} = L^n.
- TauCeti.PicardGroup.zpowLocallyConstant_add (simp): L^{f+g} = L^f·L^g.
- TauCeti.PicardGroup.zpowLocallyConstant_mul (simp): L^{fg} = (L^f)^g.
- TauCeti.PicardGroup.mul_zpowLocallyConstant (simp): (LM)^f = L^f·M^f.
- TauCeti.PicardGroup.module (instance): Additive (Pic R) is a module over LocallyConstant (PrimeSpectrum R) ℤ.
- TauCeti.PicardGroup.zpowLocallyConstant_map (functoriality): mapRingHom f (L^g) = (mapRingHom f L)^{g ∘ Spec f}.

**Unit tests.**

- TauCeti.PicardGroup.zpow_const_test (computation): For I = (2, 1 + √−5) ⊂ ℤ[√−5]: [I]^{const 2} = [I²] = 1.
- TauCeti.PicardGroup.zpow_zero_test (degenerate): L^0 = 1 and 1^f = 1.
- TauCeti.PicardGroup.zpow_indicator_test (characterisation): For R = R₁ × R₂ and f = (1, 0): (L₁, L₂)^f = (L₁, 1).
- TauCeti.PicardGroup.zpow_not_integer_test (non-example): Choose C≠1 in Pic(A), put R=A×A, L=(C,C), and f=(1,2). Then L^f=(C,C²) is not L^n=(C^n,C^n) for any integer n, since equality would give C=C², hence C=1. The nonconstant exponent cannot be represented by one integer on this L.

**Sources.**

- Kbook.II, II Corollary 2.6.2, p. 11. The ring H⁰(R) ⊕ Pic(R) needs Pic(R) as an H⁰(R)-module; the node constructs that module structure.

### The determinant commutes with scalar extension

**KTheoryLowDegrees:Z.3/determinant-base-change** · lemma · implementation unchecked.

For a homomorphism of commutative rings f : R → S and x ∈ K₀(R): det(map f x) = Pic.mapRingHom f (det x) in Pic(S); on object classes det(S ⊗[R] P) = Pic.mapAlgebra (det P). Hence the diagram K₀(R) → K₀(S) over det, Pic(R) → Pic(S) commutes; for localisations and for extensions of number rings this is the determinant half of the induced maps of KTheoryLowDegrees Z.4.

**Hypotheses.**

- R is a commutative unital ring; the zero ring is allowed.
- S is commutative and f : R →+* S.

**Construction or proof.**

- On an object class of constant rank n: S ⊗ ⋀ⁿP ≅ ⋀ⁿ_S(S ⊗ P) (Z.3/exterior-base-change), and S ⊗ P has constant rank n on the preimage (Z.2/rank-base-change); for non-constant rank decompose along the rank fibres, which base change to clopen decompositions of Spec S.
- Both sides are homomorphisms from (K₀(R), +) to Pic(S) agreeing on object classes (Z.3/determinant-hom-of, Z.1/ring-k0-map), hence equal (tauceti:TauCeti.SplitK0.hom_ext).

**Acceptance.**

- For S = R/𝔪 a field, det(map f x) = 1 for every x (Pic of a field is trivial).
- For ℤ[√−5] → ℚ(√−5), det of [I] maps to the trivial class.

**Prerequisites.**

- KTheoryLowDegrees:Z.3/determinant-hom
- KTheoryLowDegrees:Z.3/determinant-hom-of
- KTheoryLowDegrees:Z.3/exterior-base-change
- KTheoryLowDegrees:Z.2/rank-base-change
- KTheoryLowDegrees:Z.1/ring-k0-map
- mathlib:CommRing.Pic.mapRingHom
- mathlib:CommRing.Pic.mapAlgebra
- tauceti:TauCeti.SplitK0.hom_ext

**Sources.**

- Kbook.I, I Proposition 3.2, p. 16. Functoriality of Pic; the node shows det is natural for it.

### Determinant of an exterior power of a matrix (Sylvester–Franke)

**KTheoryLowDegrees:Z.3/compound-matrix-determinant** · lemma · implementation unchecked.

For a commutative ring A, n ≥ 1, 1 ≤ j ≤ n and an endomorphism g of Aⁿ: det(⋀ʲg) = det(g)^{C(n−1, j−1)}, where ⋀ʲg = exteriorPower.map j g is the endomorphism of the free module ⋀ʲAⁿ of rank C(n, j). For g ∈ GL_n(A) this is an identity of units.

**Hypotheses.**

- A is a commutative ring; the zero ring is allowed.

**Construction or proof.**

- Both sides are polynomial functions of the entries of g with integer coefficients (the matrix of ⋀ʲg in the basis of j-subsets consists of j × j minors, mathlib:Module.Basis.exteriorPower), so it suffices to prove the identity for the generic matrix over ℤ[g_{ab}], hence over its fraction field K.
- Over a field, both sides are multiplicative in g (⋀ʲ is a functor, mathlib:exteriorPower.map_comp, and mathlib:LinearMap.det_comp); GL_n(K) is generated by transvections and diagonal matrices (mathlib:Matrix.Pivot.exists_list_transvec_mul_diagonal_mul_list_transvec); for a transvection both sides are 1 (⋀ʲ of a unipotent triangular map is unipotent triangular in a suitable order of the j-subsets), and for diag(x₁,…,x_n), ⋀ʲg is diagonal with entries ∏_{i∈S}x_i, whose product over |S| = j is ∏ x_i^{C(n−1,j−1)}.
- The generic matrix is invertible over K, which gives the polynomial identity.

**Acceptance.**

- j = 1: det(g) = det(g)¹; j = n: det(⋀ⁿg) = det(g)¹ (tauceti:exteriorPower.map_top_eq_det_smul).
- n = 3, j = 2: det(⋀²g) = det(g)² (checked symbolically for the generic 3 × 3 matrix, and numerically for random integer 4 × 4 and 5 × 5 matrices and all j).

**Prerequisites.**

- mathlib:exteriorPower.map
- mathlib:exteriorPower.map_comp
- mathlib:Module.Basis.exteriorPower
- mathlib:LinearMap.det_comp
- mathlib:Matrix.Pivot.exists_list_transvec_mul_diagonal_mul_list_transvec
- tauceti:exteriorPower.map_top_eq_det_smul

**Sources.**

- Kbook.I, I §3, p. 17. The case j = n; the general exponent C(n − 1, j − 1) (the Sylvester–Franke theorem) is not stated in the sources read and is proved here from the generation of GL_n over a field.

### Determinant of a tensor product

**KTheoryLowDegrees:Z.3/determinant-tensor** · lemma · implementation unchecked.

Let P, Q be finitely generated projective R-modules of constant ranks p and q. There is a natural isomorphism det(P)^{⊗q} ⊗ det(Q)^{⊗p} ≅ det(P ⊗ Q), characterised locally: where P and Q are free with bases (e_i), (f_j) it sends (e₁ ∧ ⋯ ∧ e_p)^{⊗q} ⊗ (f₁ ∧ ⋯ ∧ f_q)^{⊗p} to ∧_{i,j}(e_i ⊗ f_j) (lexicographic order). Hence det(P ⊗ Q) = det(P)^q·det(Q)^p in Pic(R); for non-constant ranks, det(P ⊗ Q) = det(P)^{rank Q}·det(Q)^{rank P} with the exponents of Z.3/pic-locally-constant-power.

**Hypotheses.**

- R is a commutative unital ring; the zero ring is allowed.
- For the displayed isomorphism, P and Q have constant ranks p, q.

**Construction or proof.**

- Choose s_a generating the unit ideal with P[1/s_a], Q[1/s_a] free (Z.2/local-freeness, as in Z.3/associated-projective-module) and bases; define the local isomorphisms by the displayed formula.
- Under a change of bases g ∈ GL_p, h ∈ GL_q the left generator changes by det(g)^q det(h)^p and the right one by det(g ⊗ h) = det(g)^q det(h)^p (mathlib:Matrix.det_kronecker, with tauceti:exteriorPower.map_top_eq_det_smul for top exterior powers); so the local isomorphisms agree on overlaps and glue (Z.3/invertible-local-iso).
- Naturality in P and Q is checked locally. Non-constant ranks: decompose along a common refinement of the rank fibres (Z.3/pic-product-decomposition).
- The pinned Matrix.det_kronecker has only commutative-ring hypotheses; the basis-change calculation therefore includes rings with nilpotents and positive characteristic. The order of the tensor basis is i first, then j; empty bases give the rank-zero case.

**Acceptance.**

- P = Q = R²: det(R⁴) = 1 = 1²·1².
- For invertible L and Q = R^q: det(L ⊗ R^q) = det(L^{⊕q}) = L^q, matching L^q·1.
- For R = ℤ[√−5], I = (2, 1 + √−5): det(I ⊗ R²) = [I]² = [I²] = 1.
- A transposition in rank m = 2 tensored with the identity in rank n = 3 changes the top wedge by −1, not +1.
- Over ℤ/4, A = (3) and B = ((1,1),(0,3)) are invertible and det(A ⊗ₖ B) = 3 = 3²·3. No reduced-ring assumption is allowed.
- If E = L ⊕ O and F = M ⊕ O, the determinant of E ⊗ F is L²M²; rank zero gives the trivial line.

**Prerequisites.**

- KTheoryLowDegrees:Z.3/determinant-projective
- KTheoryLowDegrees:Z.3/invertible-local-iso
- KTheoryLowDegrees:Z.3/pic-product-decomposition
- KTheoryLowDegrees:Z.3/pic-locally-constant-power
- KTheoryLowDegrees:Z.2/local-freeness
- mathlib:Matrix.det_kronecker
- tauceti:exteriorPower.map_top_eq_det_smul

**Sources.**

- Kbook.I, I Exercise 3.4, p. 24. The statement; the exercise's hint formula is not well defined (sourceIssues), and the node constructs the isomorphism by gluing.
- Kbook.II, II Exercise 8.5, p. 86. The same identity for vector bundles.

### Determinant of an exterior power

**KTheoryLowDegrees:Z.3/determinant-exterior-power** · lemma · implementation unchecked.

Let P be a finitely generated projective R-module of constant rank n ≥ 1 and 1 ≤ j ≤ n. Then det(⋀ʲP) ≅ det(P)^{⊗C(n−1, j−1)}; hence det([⋀ʲP]) = det(P)^{C(n−1,j−1)} in Pic(R), and for j > n, det(⋀ʲP) = 1.

**Hypotheses.**

- R is a commutative unital ring; the zero ring is allowed.
- P has constant rank n (for j = 0, ⋀⁰P = R and det = 1).

**Construction or proof.**

- ⋀ʲP is finitely generated projective of constant rank C(n, j) (Z.3/projective-exterior-power, Z.3/exterior-rank).
- On a cover by basic opens where P is free with a basis e, ⋀ʲP is free with the basis of j-subsets (mathlib:Module.Basis.exteriorPower); send the corresponding generator of det(⋀ʲP) to (e₁ ∧ ⋯ ∧ e_n)^{⊗C(n−1,j−1)}.
- A change of basis g multiplies the first generator by det(⋀ʲg) and the second by det(g)^{C(n−1,j−1)}; these agree (Z.3/compound-matrix-determinant), so the local isomorphisms glue (Z.3/invertible-local-iso).

**Acceptance.**

- j = n: det(⋀ⁿP) = det(P).
- j = 1: det(P) = det(P).
- n = 3, j = 2: det(⋀²P) = det(P)².

**Prerequisites.**

- KTheoryLowDegrees:Z.3/projective-exterior-power
- KTheoryLowDegrees:Z.3/exterior-base-change
- KTheoryLowDegrees:Z.3/compound-matrix-determinant
- KTheoryLowDegrees:Z.3/invertible-local-iso
- KTheoryLowDegrees:Z.3/determinant-projective
- KTheoryLowDegrees:Z.2/local-freeness
- mathlib:Module.Basis.exteriorPower
- KTheoryLowDegrees:Z.3/exterior-rank

**Sources.**

- Kbook.I, I Exercise 3.3, p. 24. The determinant is patched by the determinants of the transition matrices; applied to ⋀ʲP, whose transition matrices are ⋀ʲg_ij, this gives the node with the Sylvester–Franke identity.

### The determinant of a product

**KTheoryLowDegrees:Z.3/determinant-mul** · lemma · implementation unchecked.

For all x, y ∈ K₀(R): det(xy) = det(x)^{rank y}·det(y)^{rank x} in Pic(R), with the H⁰(Spec R, ℤ)-exponents of Z.3/pic-locally-constant-power. In particular det(xy) = 1 whenever rank x = rank y = 0, and det(xy) = det(y)^{rank x} if det x = 1.

**Hypotheses.**

- R is a commutative unital ring; the zero ring is allowed.

**Construction or proof.**

- For object classes [P], [Q] this is Z.3/determinant-tensor (with the componentwise exponents).
- Both sides are biadditive maps K₀(R) × K₀(R) → Additive (Pic R): the left because det is additive and multiplication is bilinear; the right because rank is additive (Z.2/rank-hom) and L ↦ L^f is a module structure (Z.3/pic-locally-constant-power). Agreement on object classes gives equality (tauceti:TauCeti.SplitK0.hom_ext in each variable).

**Acceptance.**

- det(2[L]) = det([L]·2[R]) = L²·1^{1} = L².
- det(([L] − 1)([M] − 1)) = 1.

**Prerequisites.**

- KTheoryLowDegrees:Z.3/determinant-tensor
- KTheoryLowDegrees:Z.3/determinant-hom
- KTheoryLowDegrees:Z.3/pic-locally-constant-power
- KTheoryLowDegrees:Z.2/rank-hom
- KTheoryLowDegrees:Z.3/rank-ring-hom
- tauceti:TauCeti.SplitK0.hom_ext

**Sources.**

- Kbook.II, II Definition 2.6.1, p. 11. Weibel's computation of det(x·Q), the special case of the product formula.

### The ring H⁰(R) ⊕ Pic(R)

**KTheoryLowDegrees:Z.3/rank-det-ring** · construction · implementation unchecked.

H⁰(R) ⊕ Pic(R) is the commutative ring whose additive group is H⁰(Spec R, ℤ) × Additive(Pic R) and whose multiplication is (a, L)(b, M) = (ab, L^b·M^a), with unit (1, 1) and the exponents of Z.3/pic-locally-constant-power. Pic(R) = {0} × Pic(R) is an ideal of square zero, and the first projection is a ring homomorphism onto H⁰. It is the trivial square-zero extension of H⁰(Spec R, ℤ) by the H⁰-module Pic(R) (Mathlib's TrivSqZeroExt).

**Hypotheses.**

- R is a commutative unital ring; the zero ring is allowed.

**Construction or proof.**

- Define the ring as TrivSqZeroExt (LocallyConstant (PrimeSpectrum R) ℤ) (Additive (Pic R)) (mathlib:TrivSqZeroExt), using the module structure of Z.3/pic-locally-constant-power; its product is (a, u)(b, v) = (ab, a·v + b·u), which in multiplicative notation for Pic is (ab, M^a L^b).

**Acceptance.**

- (2, L)·(3, M) = (6, L³M²).
- (0, L)·(0, M) = (0, 1): Pic is square-zero.

**Prerequisites.**

- KTheoryLowDegrees:Z.3/pic-locally-constant-power
- mathlib:TrivSqZeroExt
- mathlib:LocallyConstant

**Uses.**

- K-book II Corollary 2.6.2–2.6.3: rank ⊕ det is a ring homomorphism, an isomorphism for one-dimensional noetherian rings
- KTheoryLowDegrees:Z.4/rank-pic-equivalence: the multiplication law (m, L)(n, M) = (mn, L^n M^m) on K₀(A) ≅ ℤ ⊕ Pic(A)
- SchemeKTheoryOperations:S.7/gamma-first-graded-pieces: the ring homomorphism rank ⊕ det on K₀(Vect X)

**Public API.**

- TauCeti.RingK0.RankPic (constructor): RankPic R := TrivSqZeroExt (LocallyConstant (PrimeSpectrum R) ℤ) (Additive (Pic R)).
- TauCeti.RingK0.RankPic.mul_def (simp): (a, L)(b, M) = (ab, L^b M^a).
- TauCeti.RingK0.RankPic.fst (projection): The ring homomorphism to H⁰(Spec R, ℤ).
- TauCeti.RingK0.RankPic.inr_mul_inr (simp): (0, L)(0, M) = 0.
- TauCeti.RingK0.RankPic.map (functoriality): A ring homomorphism R → S induces a ring homomorphism RankPic R → RankPic S.

**Unit tests.**

- TauCeti.RingK0.RankPic_mul_test (computation): (2, L)(3, M) = (6, L³M²).
- TauCeti.RingK0.RankPic_trivial_test (degenerate): For a local ring (Pic = 1) the ring is H⁰ = ℤ.
- TauCeti.RingK0.RankPic_square_zero_test (characterisation): {0} × Pic(R) is an ideal with square zero, and the ring is the trivial square-zero extension.
- TauCeti.RingK0.RankPic_not_product_test (non-example): For L≠1 in Pic(R), (2,1)(1,L)=(2,L²) differs from the componentwise-tensor rule (2,L), since L²=L would force L=1. Pic(R) is being used as an additive module, not as a unital ring with its tensor law as multiplication.

**Sources.**

- Kbook.II, II Corollary 2.6.2, p. 11. The ring (the multiplication is the one for which rank ⊕ det is multiplicative, Z.3/rank-det-ring-hom).

### Rank and determinant as a ring homomorphism

**KTheoryLowDegrees:Z.3/rank-det-ring-hom** · theorem · implementation unchecked.

rank ⊕ det : K₀(R) → H⁰(R) ⊕ Pic(R), x ↦ (rank x, det x), is a surjective ring homomorphism to the ring of Z.3/rank-det-ring, with kernel SK₀(R) := ker(rank) ∩ ker(det) (Z.3/sk-zero). The determinant alone is only a group homomorphism K₀(R) → Pic(R).

**Hypotheses.**

- R is a commutative unital ring; the zero ring is allowed.

**Construction or proof.**

- Additivity: rank and det are additive (Z.2/rank-hom, Z.3/determinant-hom). Unit: rank[R] = 1, det[R] = 1.
- Multiplicativity: rank(xy) = rank(x)rank(y) (Z.3/rank-ring-hom) and det(xy) = det(x)^{rank y}det(y)^{rank x} (Z.3/determinant-mul), which is the product formula of Z.3/rank-det-ring.
- Surjectivity: (a, L) = rank ⊕ det of rankSection(a) + [L] − [R] (Z.2/rank-section, Z.3/determinant-surjective; det(rankSection a) = 1).

**Acceptance.**

- For a Dedekind domain it is the isomorphism K₀(A) ≅ ℤ ⊕ Pic(A) (Z.4/rank-pic-equivalence; Weibel Corollary 2.6.3).
- [L]·[M] ↦ (1, L)(1, M) = (1, LM) and [L ⊕ R] ↦ (2, L).

**Prerequisites.**

- KTheoryLowDegrees:Z.3/rank-det-ring
- KTheoryLowDegrees:Z.3/rank-ring-hom
- KTheoryLowDegrees:Z.3/determinant-mul
- KTheoryLowDegrees:Z.3/determinant-hom
- KTheoryLowDegrees:Z.3/determinant-surjective
- KTheoryLowDegrees:Z.2/rank-hom
- KTheoryLowDegrees:Z.2/rank-section

**Sources.**

- Kbook.II, II Corollary 2.6.2, p. 11. The theorem.

### The ideal SK₀(R)

**KTheoryLowDegrees:Z.3/sk-zero** · definition · implementation unchecked.

SK₀(R) := ker(rank ⊕ det) = {x ∈ K₀(R) : rank x = 0 and det x = 1}, an ideal of K₀(R) (the kernel of the ring homomorphism of Z.3/rank-det-ring-hom). Equivalently (Weibel Definition 2.6.1) the set of classes [P] − [R^m] with P of constant rank m and ⋀ᵐP ≅ R, on each piece of a clopen decomposition; K̃₀(R)/SK₀(R) ≅ Pic(R) via det. It equals F²_γK₀(R) (Z.3/gamma-filtration-two).

**Hypotheses.**

- R is a commutative unital ring; the zero ring is allowed.

**Construction or proof.**

- Take RingHom.ker of rank ⊕ det (Z.3/rank-det-ring-hom).
- Weibel's description: every x ∈ I_R is [P] − [R^m] componentwise (Z.1/ring-k0-class-induction with rankSection, Z.2/rank-section), and det x = det P.
- K̃₀(R)/SK₀(R) ≅ Pic(R): det restricted to I_R is surjective (x = [L] − [R]).

**Acceptance.**

- For a field, SK₀ = 0; for a Dedekind domain, SK₀ = 0 (Z.4/rank-pic-equivalence).
- [L] − [R] ∈ SK₀(R) iff L ≅ R.

**Prerequisites.**

- KTheoryLowDegrees:Z.3/rank-det-ring-hom
- KTheoryLowDegrees:Z.3/augmentation
- KTheoryLowDegrees:Z.1/ring-k0-class-induction
- KTheoryLowDegrees:Z.2/rank-section
- mathlib:RingHom.ker

**Uses.**

- K-book II 2.6.1–2.6.2 and Corollary 4.7.1: the kernel of rank ⊕ det and F²_γ = SK₀(R)
- KTheoryLowDegrees:Z.3/gamma-filtration-two: the second step of the γ-filtration
- SchemeKTheoryOperations:S.7/gamma-first-graded-pieces: SK₀(X) = F²_γ for schemes, restricting to this on affines

**Public API.**

- TauCeti.RingK0.SK0 (constructor): SK₀(R) as an Ideal (RingK0 R).
- TauCeti.RingK0.mem_SK0_iff (characterisation): x ∈ SK₀(R) ↔ rank x = 0 ∧ det x = 1.
- TauCeti.RingK0.SK0_le_augmentationIdeal (structure): SK₀(R) ≤ I_R.
- TauCeti.RingK0.augmentationIdeal_quot_SK0 (equivalence): I_R/SK₀(R) ≃ Additive (Pic R) via det.
- TauCeti.RingK0.SK0_eq_gammaFiltration_two (characterisation): SK₀(R) = F²_γ K₀(R) (Z.3/gamma-filtration-two).
- TauCeti.RingK0.SK0_map (functoriality): map f (SK₀ R) ≤ SK₀ S (Z.3/determinant-base-change, Z.2/rank-base-change).

**Unit tests.**

- TauCeti.RingK0.SK0_field_test (degenerate): SK₀(k) = 0 for a field k.
- TauCeti.RingK0.SK0_line_test (characterisation): [L] − [R] ∈ SK₀(R) ↔ L ≅ R.
- TauCeti.RingK0.SK0_dedekind_test (computation): SK₀(ℤ[√−5]) = 0 while I_R ≅ ℤ/2 (Z.4).
- TauCeti.RingK0.SK0_not_ker_det_test (non-example): For a nontrivial R, SK₀(R) differs from ker det: [R] lies in ker det but rank[R]=1≠0. In the zero ring K₀(R)=0 and both kernels coincide.

**Sources.**

- Kbook.II, II Definition 2.6.1, p. 11. The definition.

### Rank-zero classes modulo F²_γ

**KTheoryLowDegrees:Z.3/determinant-gamma-congruence** · lemma · implementation unchecked.

For every x ∈ I_R = F¹_γK₀(R): x ≡ [det x] − [R] modulo F²_γK₀(R), where [det x] is the class of an invertible module representing det x ∈ Pic(R).

**Hypotheses.**

- R is a commutative unital ring; the zero ring is allowed.

**Construction or proof.**

- Constant rank: for P of constant rank n, [⋀ⁿP] − [R] − ([P] − n[R]) = Σ_{i≥2}γⁱ([P] − n[R]) ∈ F²_γ (Z.3/gamma-top-sum; each γⁱ, i ≥ 2, of a rank-zero class is a generator, Z.3/gamma-filtration-generators), and ⋀ⁿP represents det P.
- General x ∈ I_R: on a finite clopen partition (idempotents e_j) write x = Σ_j ([P_j] − n_j[e_jR]) with P_j of constant rank n_j over e_jR. Put Q_j := P_j × ((1 − e_j)R)^{n_j}, of constant rank n_j over R, so [P_j] − n_j[e_jR] = [Q_j] − n_j[R] ≡ [det Q_j] − [R].
- For invertible L, M: ([L] − [R]) + ([M] − [R]) − ([L ⊗ M] − [R]) = −([L] − [R])([M] − [R]) ∈ F²_γ (Z.3/gamma-filtration-mul); so Σ_j([det Q_j] − [R]) ≡ [⊗_j det Q_j] − [R], and ⊗_j det Q_j = det x (Z.3/determinant-sum, Z.3/determinant-hom).

**Acceptance.**

- For x = [L] − [R] the congruence is an equality.
- For P = I ⊕ R over ℤ[√−5]: [P] − 2[R] ≡ [I] − [R].

**Prerequisites.**

- KTheoryLowDegrees:Z.3/gamma-top-sum
- KTheoryLowDegrees:Z.3/gamma-filtration-generators
- KTheoryLowDegrees:Z.3/gamma-filtration-mul
- KTheoryLowDegrees:Z.3/ring-k0-augmented
- KTheoryLowDegrees:Z.3/determinant-hom
- KTheoryLowDegrees:Z.3/determinant-sum
- KTheoryLowDegrees:Z.3/exterior-above-rank
- KTheoryLowDegrees:Z.2/rank-fibre-decomposition
- KTheoryLowDegrees:Z.2/componentwise-free

**Sources.**

- Kbook.II, II proof of Theorem 4.7, p. 31. Weibel's congruence; the node proves it without the Splitting Principle, including disconnected rank.

### The determinant is trivial on F²_γ

**KTheoryLowDegrees:Z.3/determinant-kills-gamma-two** · lemma · implementation unchecked.

det(F²_γK₀(R)) = 1: for every x ∈ F²_γK₀(R), det x = 1 in Pic(R).

**Hypotheses.**

- R is a commutative unital ring; the zero ring is allowed.

**Construction or proof.**

- F²_γ is the ideal generated by weighted products g = γ^{k₁}(x₁)⋯γ^{k_m}(x_m), x_j ∈ I_R, Σk_j ≥ 2; discard all γ⁰ factors, which equal 1, so the remaining k_j are positive; det is additive, so it suffices that det(a·g) = 1 for a ∈ K₀(R). Since rank g = 0, det(a·g) = det(g)^{rank a} (Z.3/determinant-mul); so it suffices that det g = 1.
- If m ≥ 2, g = y·z with y, z ∈ I_R (γ-operations preserve I_R, Z.3/gamma-rank-zero) and det(yz) = 1 (Z.3/determinant-mul).
- If m = 1, g = γ^k(x) with k ≥ 2 and x ∈ I_R. Decompose along a finite clopen partition as in Z.3/determinant-gamma-congruence (det and γ are compatible with the decomposition, Z.3/determinant-base-change, Z.3/lambda-base-change, Z.3/pic-product-decomposition), so x = [P] − n[R] with P of constant rank n. Then γ^k(x) = Σ_{j=0}^{min(n,k)} (−1)^{k−j}C(n − j, k − j)[⋀ʲP] (coefficient of t^k in Z.3/gamma-vanishing-above-rank), and det(γ^k x) = det(P)^{e} with e = Σ_{j=1}^{min(n,k)}(−1)^{k−j}C(n − j, k − j)C(n − 1, j − 1) (Z.3/determinant-exterior-power).
- If n = 0, P = 0, hence x = 0 and γ^k(x) = 0 for k ≥ 1. For n ≥ 1, Σ_{k≥0} e_k t^k = Σ_{j=1}^{n} C(n − 1, j − 1) t^j (1 − t)^{n−j} = t·(t + (1 − t))^{n−1} = t. The coefficient formula uses only j ≤ k, so no negative binomial index or negative exponent occurs. Thus e_k = 0 for k ≥ 2 and det(γ^k x) = 1.

**Acceptance.**

- det(γ²([P] − n)) = det(⋀²P)·det(P)^{−(n−1)} = 1 for P of constant rank n.
- det(([L] − 1)([M] − 1)) = 1.

**Prerequisites.**

- KTheoryLowDegrees:Z.3/gamma-filtration
- KTheoryLowDegrees:Z.3/determinant-mul
- KTheoryLowDegrees:Z.3/gamma-rank-zero
- KTheoryLowDegrees:Z.3/gamma-vanishing-above-rank
- KTheoryLowDegrees:Z.3/determinant-exterior-power
- KTheoryLowDegrees:Z.3/determinant-hom
- KTheoryLowDegrees:Z.3/determinant-base-change
- KTheoryLowDegrees:Z.3/lambda-base-change
- KTheoryLowDegrees:Z.3/pic-product-decomposition
- KTheoryLowDegrees:Z.3/ring-k0-augmented

**Sources.**

- Kbook.II, II proof of Theorem 4.7, p. 31. The statement; Weibel derives it from the Filtered Splitting Principle, the node from the determinant identities for tensor products and exterior powers.

### F²_γ K₀(R) = SK₀(R)

**KTheoryLowDegrees:Z.3/gamma-filtration-two** · theorem · implementation unchecked.

For every commutative ring R, F²_γK₀(R) = SK₀(R) = ker(rank ⊕ det), and F²_γ ⊆ F¹_γ = I_R with F¹_γ/F²_γ ≅ Pic(R) (Z.3/gamma-first-graded). This is the second half of Weibel's Corollary 4.7.1; the proof uses neither the Splitting Principle nor specialness of K₀(R), and allows disconnected Spec R.

**Hypotheses.**

- R is a commutative unital ring; the zero ring is allowed.

**Construction or proof.**

- ⊆: F²_γ ⊆ F¹_γ = I_R = ker rank (Z.3/gamma-filtration-one) and det(F²_γ) = 1 (Z.3/determinant-kills-gamma-two).
- ⊇: for x ∈ SK₀(R), x ∈ I_R and x ≡ [det x] − [R] = [R] − [R] = 0 modulo F²_γ (Z.3/determinant-gamma-congruence).

**Acceptance.**

- For a field or a Dedekind domain both sides are 0.
- For R = ℤ[√−5], F²_γ = 0 ≠ F¹_γ ≅ ℤ/2.

**Prerequisites.**

- KTheoryLowDegrees:Z.3/gamma-filtration-one
- KTheoryLowDegrees:Z.3/determinant-kills-gamma-two
- KTheoryLowDegrees:Z.3/determinant-gamma-congruence
- KTheoryLowDegrees:Z.3/sk-zero

**Sources.**

- Kbook.II, II Corollary 4.7.1, p. 31. The statement, deduced there from Theorem 4.7 and the Splitting Principle.

### The first graded piece of the γ-filtration is Pic

**KTheoryLowDegrees:Z.3/gamma-first-graded** · theorem · implementation unchecked.

The map Pic(R) → F¹_γK₀(R)/F²_γK₀(R), L ↦ [L] − [R], is a group isomorphism with inverse induced by det; and F⁰_γ/F¹_γ ≅ H⁰(Spec R, ℤ) via rank. (Weibel Corollary 4.7.1: F⁰/F¹ ≅ H⁰(R), F¹/F² ≅ Pic(R).)

**Hypotheses.**

- R is a commutative unital ring; the zero ring is allowed.

**Construction or proof.**

- Homomorphism: ([L] − 1) + ([M] − 1) − ([L ⊗ M] − 1) = −([L] − 1)([M] − 1) ∈ F²_γ (Z.3/gamma-filtration-mul).
- det induces F¹_γ/F²_γ → Pic(R) (Z.3/determinant-kills-gamma-two), and det([L] − 1) = L (Z.3/determinant-line).
- Surjectivity of L ↦ [L] − 1: every x ∈ F¹_γ is ≡ [det x] − 1 (Z.3/determinant-gamma-congruence). F⁰/F¹ is Z.3/gamma-filtration-one.

**Acceptance.**

- For R = ℤ[√−5]: F¹_γ/F²_γ ≅ ℤ/2, generated by [I] − 1.
- For a local ring, F¹_γ = F²_γ = 0 is compatible with Pic = 1.

**Prerequisites.**

- KTheoryLowDegrees:Z.3/gamma-filtration-mul
- KTheoryLowDegrees:Z.3/determinant-kills-gamma-two
- KTheoryLowDegrees:Z.3/determinant-line
- KTheoryLowDegrees:Z.3/determinant-gamma-congruence
- KTheoryLowDegrees:Z.3/gamma-filtration-one

**Sources.**

- Kbook.II, II Theorem 4.7 and Corollary 4.7.1, pp. 30–31. The two graded pieces.

### The finite-comodule exact category

**KTheoryLowDegrees:Z.3/integral-comodule-exact-category** · construction · implementation unchecked.

Give the existing category E_R(C)=FGComoduleCat R C the exact structure whose conflations are precisely the short sequences injective, surjective and exact on underlying R-modules. Set G₀(C)=ExactK0(E_R(C)) and gcls(E)=[E]. This introduces an exact structure on the existing carrier, not a new comodule or Grothendieck-group presentation. The category is essentially small.

**Hypotheses.**

- R is a principal ideal domain; C is an R-coalgebra flat as an R-module. Finite means finite over R, and coactions have target E ⊗_R C.

**Construction or proof.**

- A kernel is the pinned Comodule.Hom.ker; flatness of C is essential for its coaction. A cokernel is the quotient by the pinned image subcomodule. Over the noetherian ring R, these stay finite; the underlying kernel, image and quotient identities give the kernel-cokernel property.
- Compute a pullback as ker(f−g) inside a direct sum and a pushout as the cokernel of (f,−g). The underlying module computations give preservation of injections and surjections and the Quillen composition and base-change axioms. These computations define only the exact structure needed here, not a replacement comodule category.
- For essential smallness, present every finite underlying module as a quotient of R^n; submodules of each R^n form a set, as do linear coaction maps on each quotient. Transport these representatives and their coactions along linear isomorphisms.
- Apply the existing ExactK0 carrier and its object-class universal property to this exact structure.

**Acceptance.**

- For a nonzero a∈R and an R-free finite comodule P, the exact sequence P —a→ P → P/aP gives [P/aP]=0 in G₀(C), although P/aP need not be zero as an object.
- Conflations need not split as comodule sequences; underlying exactness is the convention.

**Prerequisites.**

- tauceti:TauCeti.FGComoduleCat
- tauceti:TauCeti.Comodule.Hom.ker
- tauceti:TauCeti.Comodule.Hom.ker_finite
- tauceti:TauCeti.Subcomodule.instComoduleQuotient
- tauceti:TauCeti.Subcomodule.mkQ
- tauceti:TauCeti.ExactK0
- tauceti:TauCeti.ExactK0.of_conflation
- tauceti:TauCeti.Comodule.Hom.range

**Uses.**

- Serre 1968, §2.3, Proposition 4, and KTheoryLowDegrees:Z.3/serre-representation-ring-theorem: Compares the exact Grothendieck groups of finite modules with coaction and their finite-free subcategory before the generic/residue-fibre comparison. No split Grothendieck group is substituted.

**Public API.**

- TauCeti.IntegralComodule.finiteExactStructure (constructor): The exact structure on FGComoduleCat R C determined by underlying-module short exact sequences.
- TauCeti.IntegralComodule.finiteExactStructure_conflation_iff (characterisation): A short complex is a conflation exactly when its first map is injective, its second map is surjective, and the underlying maps are exact.
- TauCeti.IntegralComodule.G0 (data): The existing ExactK0 of finiteExactStructure, with its induced additive commutative group.
- TauCeti.IntegralComodule.gcls (constructor): The class of a finite C-comodule in G₀(C).
- TauCeti.IntegralComodule.gcls_iso (compatibility): Isomorphic finite comodules have equal classes.
- TauCeti.IntegralComodule.gcls_exact (relation): For a conflation E′→E→E″, gcls(E)=gcls(E′)+gcls(E″).

**Unit tests.**

- TauCeti.IntegralComodule.gcls_zero_test (degenerate): The zero comodule has class zero.
- TauCeti.IntegralComodule.gcls_biprod_test (compatibility): gcls(E⊕F)=gcls(E)+gcls(F).
- TauCeti.IntegralComodule.gcls_scalar_quotient_test (non-example): If a≠0 and P is R-free, every quotient map P→Q exact after multiplication by a has gcls(Q)=0, including the nonzero object R/(a) with trivial coaction when C comes from a group scheme.

**Sources.**

- Serre.1968, §1.3 and §2.3, pp. 39 and 41–42; right coactions obtained from the source’s left coactions by the tensor flip. The specified part of Serre’s argument is specialized to a PID; the free-coalgebra restriction permits the pinned finite-subcomodule theorem. The source itself allows flat coalgebras. Additivity is expanded through the two kernels described in the proof steps.

### The finite-free comodule exact category

**KTheoryLowDegrees:Z.3/integral-free-comodule-exact-category** · construction · implementation unchecked.

Let F_R(C) be the full subcategory of E_R(C) on objects free over R. Its inherited exact structure has all underlying-module short exact sequences with three finite-free terms. Define R₀(C)=ExactK0(F_R(C)); inclusion induces α:R₀(C)→G₀(C). The word free refers only to the underlying R-module, never projectivity in the comodule category.

**Hypotheses.**

- R is a principal ideal domain; C is an R-coalgebra flat as an R-module. Finite means finite over R, and coactions have target E ⊗_R C.

**Construction or proof.**

- If the outer terms of an exact sequence are R-free, the sequence splits as R-modules because the quotient is projective over R; its middle term is R-free. No equivariant section is selected or asserted.
- Use this extension-closed property with ExactStructure.fullSubcategory. Its inclusion is conflation-exact by the pinned isConflationExact_ι; descend it using ExactK0.map. Finite-free objects inherit zero objects, direct sums, and essential smallness from the finite category.
- The defining relations are exact-sequence relations. For instance, the integral regular C₂-representation has class equal to the sign plus the trivial representation, even though the augmentation to the trivial representation has no equivariant integral section.

**Acceptance.**

- For C=O(C₂)=R^{C₂} over R=ℤ, the regular lattice → trivial lattice has invariant elements with even augmentation; hence it is not split as comodules. Its kernel is the sign lattice, and [regular]=[sign]+[trivial] holds in R₀(C).

**Prerequisites.**

- KTheoryLowDegrees:Z.3/integral-comodule-exact-category
- tauceti:TauCeti.ExactStructure.fullSubcategory
- tauceti:TauCeti.ExactStructure.isConflationExact_ι
- tauceti:TauCeti.ExactK0.map

**Uses.**

- Serre 1968, §2.3, Proposition 4, and KTheoryLowDegrees:Z.3/serre-representation-ring-theorem: Compares the exact Grothendieck groups of finite modules with coaction and their finite-free subcategory before the generic/residue-fibre comparison. No split Grothendieck group is substituted.

**Public API.**

- TauCeti.IntegralComodule.isFree (characterisation): The object property Module.Free R E on the existing finite-comodule category.
- TauCeti.IntegralComodule.FreeCategory (data): The full subcategory defined by isFree.
- TauCeti.IntegralComodule.isFree_extensionClosed (compatibility): The finite-free property is extension closed in finiteExactStructure.
- TauCeti.IntegralComodule.freeExactStructure (constructor): The exact structure induced by finiteExactStructure on FreeCategory.
- TauCeti.IntegralComodule.freeExactStructure_conflation_iff (characterisation): A short complex of finite-free comodules is a conflation exactly when it is short exact on underlying modules.
- TauCeti.IntegralComodule.R0 (data): The existing ExactK0 of freeExactStructure.
- TauCeti.IntegralComodule.rcls (constructor): The class of a finite-free comodule in R₀(C).
- TauCeti.IntegralComodule.inclusion (functoriality): The additive map α:R₀(C)→G₀(C) induced by inclusion.
- TauCeti.IntegralComodule.inclusion_rcls (simp): α(rcls(P))=gcls(P).

**Unit tests.**

- TauCeti.IntegralComodule.rcls_zero_test (degenerate): The zero finite-free comodule has class zero.
- TauCeti.IntegralComodule.rcls_biprod_test (compatibility): rcls(P⊕Q)=rcls(P)+rcls(Q).
- TauCeti.IntegralComodule.rcls_exact_test (non-example): Every underlying-module short exact sequence of finite-free comodules gives [P]=[P′]+[P″], without an equivariant-splitting hypothesis.

**Sources.**

- Serre.1968, §2.3, p. 42, definition of Com_P and the map α. The specified part of Serre’s argument is specialized to a PID; the free-coalgebra restriction permits the pinned finite-subcomodule theorem. The source itself allows flat coalgebras. Additivity is expanded through the two kernels described in the proof steps.

### Finite-free covers of comodules

**KTheoryLowDegrees:Z.3/integral-comodule-free-cover** · theorem · implementation unchecked.

If C is free over the PID R, every finite C-comodule E is the image of a surjective comodule morphism P→E with P finite free as an R-module.

**Hypotheses.**

- R is a principal ideal domain and C is a right coefficient coalgebra over R, free as an R-module. Objects and morphisms are the pinned FGComoduleCat and Comodule.Hom.

**Construction or proof.**

- Choose an ordinary surjection L→E from a finite free R-module. The pinned cofreeMap gives a surjection L⊗C→E⊗C by LinearMap.rTensor_surjective. The cofreeUnit E is the coaction and is injective because the counit splits it as an R-linear map.
- Take the inverse-image subcomodule F of the image of E in E⊗C. It maps surjectively to E and embeds in the free module L⊗C. Lift finitely many R-module generators of E into F.
- Apply the pinned exists_finite_subcomodule_of_setFinite to these lifts. Its Module.Free R C premise is supplied explicitly. The resulting finite subcomodule P still surjects onto E. It is torsion-free as a submodule of L⊗C, hence free over the PID by Module.free_of_finite_type_torsion_free′.

**Acceptance.**

- For C=R and E=R/(a), the usual map R→R/(a) is a cover. There is no assertion that arbitrary maps out of P lift equivariantly.

**Prerequisites.**

- KTheoryLowDegrees:Z.3/integral-free-comodule-exact-category
- tauceti:TauCeti.Comodule.Hom.cofreeUnit
- tauceti:TauCeti.Comodule.Hom.cofreeMap
- tauceti:TauCeti.Subcomodule.comap
- tauceti:TauCeti.Subcomodule.exists_finite_subcomodule_of_setFinite
- mathlib:LinearMap.rTensor_surjective
- mathlib:Module.free_of_finite_type_torsion_free'
- tauceti:TauCeti.Comodule.Hom.range

**Sources.**

- Serre.1968, §2.2, Proposition 3, p. 41; uses §1.4 (cofree embedding) and §1.5, Proposition 2 (finite subcomodule). The specified part of Serre’s argument is specialized to a PID; the free-coalgebra restriction permits the pinned finite-subcomodule theorem. The source itself allows flat coalgebras. Additivity is expanded through the two kernels described in the proof steps.

### Length-one finite-free comodule resolutions

**KTheoryLowDegrees:Z.3/integral-comodule-free-resolution** · theorem · implementation unchecked.

Every finite C-comodule E, for C free over a PID R, admits a short exact sequence 0→P₁→P₀→E→0 with P₀ and P₁ finite free over R.

**Hypotheses.**

- R is a principal ideal domain and C is a right coefficient coalgebra over R, free as an R-module. Objects and morphisms are the pinned FGComoduleCat and Comodule.Hom.

**Construction or proof.**

- Choose the cover supplied by integral-comodule-free-cover. Its kernel is the pinned Comodule.Hom.ker, whose underlying submodule is the linear-map kernel.
- The kernel is finite because R is noetherian and P₀ is finite; it is torsion-free as a submodule of a free module. Apply the pinned PID freeness theorem. The kernel inclusion and the chosen surjection form the required short exact sequence.

**Acceptance.**

- For E=R/(a) with a≠0 and trivial coaction, use R —a→ R → R/(a); for an R-free E, use 0→E→E.

**Prerequisites.**

- KTheoryLowDegrees:Z.3/integral-comodule-free-cover
- tauceti:TauCeti.Comodule.Hom.ker
- tauceti:TauCeti.Comodule.Hom.ker_finite
- mathlib:Module.free_of_finite_type_torsion_free'

**Sources.**

- Serre.1968, §2.2, Corollary to Proposition 3, p. 41. The specified part of Serre’s argument is specialized to a PID; the free-coalgebra restriction permits the pinned finite-subcomodule theorem. The source itself allows flat coalgebras. Additivity is expanded through the two kernels described in the proof steps.

### Independence of the comodule resolution class

**KTheoryLowDegrees:Z.3/integral-comodule-euler-independence** · lemma · implementation unchecked.

Two length-one finite-free comodule resolutions P₁→P₀→E and Q₁→Q₀→E give the same element [P₀]−[P₁]=[Q₀]−[Q₁] in R₀(C). The terms need only be free over R.

**Hypotheses.**

- R is a principal ideal domain and C is a right coefficient coalgebra over R, free as an R-module. Objects and morphisms are the pinned FGComoduleCat and Comodule.Hom.

**Construction or proof.**

- Form B=P₀×_E Q₀ as the kernel of the difference map P₀⊕Q₀→E. Both projections are surjective by surjectivity of the covers; their kernels are Q₁ and P₁ respectively.
- B is finite and torsion-free over the PID, hence finite free. Thus Q₁→B→P₀ and P₁→B→Q₀ are conflations in the finite-free category.
- The two ExactK0 relations give [B]=[Q₁]+[P₀]=[P₁]+[Q₀]; subtract and rearrange. This uses no projective lifting property and no choice of equivariant splittings.

**Acceptance.**

- Adding the same finite-free summand to both terms of a resolution leaves the alternating class unchanged. For R/(a), both displayed terms have the class of R, so the alternating class is zero.

**Prerequisites.**

- KTheoryLowDegrees:Z.3/integral-free-comodule-exact-category
- tauceti:TauCeti.Comodule.Hom.ker
- tauceti:TauCeti.Comodule.Hom.ker_finite
- mathlib:Module.free_of_finite_type_torsion_free'
- tauceti:TauCeti.ExactK0.of_conflation

**Sources.**

- Serre.1968, §2.3, Proposition 4, p. 42, comparison of two resolutions; the source uses the kernel of the sum map, equivalent to this fibre product by negating the second coordinate. The specified part of Serre’s argument is specialized to a PID; the free-coalgebra restriction permits the pinned finite-subcomodule theorem. The source itself allows flat coalgebras. Additivity is expanded through the two kernels described in the proof steps.

### Additivity of the comodule resolution class

**KTheoryLowDegrees:Z.3/integral-comodule-euler-additivity** · lemma · implementation unchecked.

For a short exact sequence E′→E→E″ of finite comodules, the alternating classes of any length-one finite-free resolutions satisfy β(E)=β(E′)+β(E″) in R₀(C).

**Hypotheses.**

- R is a principal ideal domain and C is a right coefficient coalgebra over R, free as an R-module. Objects and morphisms are the pinned FGComoduleCat and Comodule.Hom.

**Construction or proof.**

- Choose one finite-free cover P→E. Let K=ker(P→E) and Q=ker(P→E″). Both are finite free over the PID, and K⊆Q.
- Restriction of P→E gives a short exact sequence K→Q→E′: lift each element of E′ along P→E; its image in E″ vanishes. Also Q→P→E″ and K→P→E are resolutions.
- Their alternating classes are [Q]−[K], [P]−[Q], and [P]−[K]. Cancellation gives additivity for these choices; integral-comodule-euler-independence gives it for all choices. No horseshoe lemma is invoked.

**Acceptance.**

- When the sequence is P′→P→P″ with all terms finite free, this is exactly the defining exact-sequence relation of R₀(C), including nonsplit equivariant extensions.

**Prerequisites.**

- KTheoryLowDegrees:Z.3/integral-comodule-free-cover
- KTheoryLowDegrees:Z.3/integral-comodule-euler-independence
- tauceti:TauCeti.Comodule.Hom.ker
- tauceti:TauCeti.Comodule.Hom.ker_finite
- mathlib:Module.free_of_finite_type_torsion_free'
- KTheoryLowDegrees:Z.3/integral-comodule-free-resolution

**Sources.**

- Serre.1968, §2.3, Proposition 4, p. 42, additivity assertion; the two-kernel argument here expands the source’s omitted verification. The specified part of Serre’s argument is specialized to a PID; the free-coalgebra restriction permits the pinned finite-subcomodule theorem. The source itself allows flat coalgebras. Additivity is expanded through the two kernels described in the proof steps.

### The finite-free comodule Euler map

**KTheoryLowDegrees:Z.3/integral-comodule-euler-map** · construction · implementation unchecked.

The alternating resolution class descends to a unique homomorphism β:G₀(C)→R₀(C) sending [E] to [P₀]−[P₁] for every length-one finite-free resolution. In particular β([P])=[P] for a finite-free object P.

**Hypotheses.**

- R is a principal ideal domain and C is a right coefficient coalgebra over R, free as an R-module. Objects and morphisms are the pinned FGComoduleCat and Comodule.Hom.

**Construction or proof.**

- Choose a resolution using integral-comodule-free-resolution. Integral-comodule-euler-independence removes dependence on the choice and implies invariance under comodule isomorphism.
- Integral-comodule-euler-additivity supplies an ExactK0.AdditiveInvariant. Use the pinned ExactK0.lift to obtain β; its class formula follows from lift_of.
- For a finite-free P, take 0→P→P. Any additive map with this value on free objects must agree on [E]=[P₀]−[P₁] in G₀(C); ExactK0.hom_ext gives uniqueness.

**Acceptance.**

- For R=ℤ and the trivial comodule ℤ/p, β([ℤ/p])=0. Ordinary reduction ℤ/p⊗𝔽_p is nonzero, so the Euler construction must not be replaced with naive tensor reduction.

**Prerequisites.**

- KTheoryLowDegrees:Z.3/integral-comodule-free-resolution
- KTheoryLowDegrees:Z.3/integral-comodule-euler-independence
- KTheoryLowDegrees:Z.3/integral-comodule-euler-additivity
- tauceti:TauCeti.ExactK0.AdditiveInvariant
- tauceti:TauCeti.ExactK0.lift
- tauceti:TauCeti.ExactK0.lift_of
- tauceti:TauCeti.ExactK0.hom_ext

**Uses.**

- Serre 1968, §2.3, Proposition 4, and KTheoryLowDegrees:Z.3/serre-representation-ring-theorem: Compares the exact Grothendieck groups of finite modules with coaction and their finite-free subcategory before the generic/residue-fibre comparison. No split Grothendieck group is substituted.

**Public API.**

- TauCeti.IntegralComodule.euler (constructor): The additive map β:G₀(C)→R₀(C) induced by alternating finite-free resolution classes.
- TauCeti.IntegralComodule.euler_resolution (simp): For every short exact P₁→P₀→E with P₀,P₁ finite free, β(gcls(E))=rcls(P₀)−rcls(P₁).
- TauCeti.IntegralComodule.euler_free (simp): β(gcls(P))=rcls(P) for finite-free P.
- TauCeti.IntegralComodule.euler_unique (universal-property): An additive map G₀(C)→R₀(C) agreeing with rcls on all finite-free objects equals β.

**Unit tests.**

- TauCeti.IntegralComodule.euler_zero_test (degenerate): β(0)=0.
- TauCeti.IntegralComodule.euler_free_test (compatibility): β(gcls(P))=rcls(P).
- TauCeti.IntegralComodule.euler_scalar_quotient_test (non-example): For a≠0, P finite free, and P→Q exact after scalar multiplication by a, β(gcls(Q))=0; for the trivial ℤ/p comodule this differs from its nonzero naive reduction.

**Sources.**

- Serre.1968, §2.3, Proposition 4, p. 42, construction of β. The specified part of Serre’s argument is specialized to a PID; the free-coalgebra restriction permits the pinned finite-subcomodule theorem. The source itself allows flat coalgebras. Additivity is expanded through the two kernels described in the proof steps.

### Serre’s finite-free comodule comparison

**KTheoryLowDegrees:Z.3/integral-comodule-k0-comparison** · construction · implementation unchecked.

Inclusion of finite-free comodules into finite comodules induces an additive equivalence α:R₀(C)≃G₀(C), with inverse the Euler map β, for C free over a PID R. This is the free-coalgebra case of Serre’s Proposition 4, not the subsequent generic-fibre isomorphism of Theorem 5.

**Hypotheses.**

- R is a principal ideal domain and C is a right coefficient coalgebra over R, free as an R-module. Objects and morphisms are the pinned FGComoduleCat and Comodule.Hom.

**Construction or proof.**

- On a finite-free class [P], β α[P]=[P] by integral-comodule-euler-map. Extend this identity using ExactK0.hom_ext.
- For a finite E and a resolution P₁→P₀→E, α β[E]=[P₀]−[P₁]=[E] by the exact-sequence relation in G₀(C). Extend by hom_ext again.
- Package the existing inclusion homomorphism and Euler map as an AddEquiv. There is no new quotient and no claim that free R-modules are projective comodules.

**Acceptance.**

- For C=R this is the familiar rank isomorphism between K₀ of finite-free modules and G₀ of finite modules over a PID; the torsion classes vanish.
- The equivalence is additive. A coalgebra need not have a multiplication, so no ring equivalence is asserted at this level.

**Prerequisites.**

- KTheoryLowDegrees:Z.3/integral-comodule-euler-map
- KTheoryLowDegrees:Z.3/integral-free-comodule-exact-category
- tauceti:TauCeti.ExactK0.of_conflation
- tauceti:TauCeti.ExactK0.hom_ext

**Uses.**

- Serre 1968, §2.3, Proposition 4, and KTheoryLowDegrees:Z.3/serre-representation-ring-theorem: Compares the exact Grothendieck groups of finite modules with coaction and their finite-free subcategory before the generic/residue-fibre comparison. No split Grothendieck group is substituted.

**Public API.**

- TauCeti.IntegralComodule.k0Equiv (equivalence): The additive equivalence with forward map inclusion and inverse euler.
- TauCeti.IntegralComodule.k0Equiv_rcls (simp): k0Equiv(rcls(P))=gcls(P).
- TauCeti.IntegralComodule.k0Equiv_symm_eq_euler (compatibility): The additive homomorphism of the inverse equivalence is euler.
- TauCeti.IntegralComodule.k0Equiv_unique (universal-property): The forward homomorphism is uniquely determined by sending each finite-free object class to its class in G₀(C).

**Unit tests.**

- TauCeti.IntegralComodule.k0Equiv_zero_test (degenerate): k0Equiv(0)=0.
- TauCeti.IntegralComodule.k0Equiv_roundtrip_test (characterisation): euler(k0Equiv(x))=x for every x∈R₀(C).
- TauCeti.IntegralComodule.k0Equiv_biprod_test (compatibility): k0Equiv(rcls(P⊕Q))=gcls(P)+gcls(Q).

**Sources.**

- Serre.1968, §2.3, Proposition 4, p. 42, the two inverse identities. The specified part of Serre’s argument is specialized to a PID; the free-coalgebra restriction permits the pinned finite-subcomodule theorem. The source itself allows flat coalgebras. Additivity is expanded through the two kernels described in the proof steps.

### Identification with the existing GL representation group

**KTheoryLowDegrees:Z.3/integral-gl-exact-comparison** · comparison · implementation unchecked.

For a PID R and G=∏ GL_{N_i}, with flat coordinate coalgebra C=R[G], the existing representation group R_R(G) of representation-ring-of-gl is canonically additively isomorphic to R₀(C) of integral-free-comodule-exact-category, carrying the class of each representation to itself. Thus the finite-free comodule comparison applies to this same representation-group carrier once freeness of C has been established.

**Hypotheses.**

- R is a principal ideal domain; C is an R-coalgebra flat as an R-module. Finite means finite over R, and coactions have target E ⊗_R C.

**Construction or proof.**

- Both exact categories are the same full subcategory of the pinned FGComoduleCat R C on finite-free underlying R-modules; compare their forgetful functors and the identical underlying-exactness predicates.
- Use ExactK0.mapEquiv for that exact equivalence. Its object-class formula identifies the representation classes. This bridge invokes neither highest-weight classification nor the generic/residue-fibre theorem.

**Acceptance.**

- For the empty product C=R, the class of the trivial rank-one object maps to the same generator; no abstract point-group representation ring is used.

**Prerequisites.**

- KTheoryLowDegrees:Z.3/integral-free-comodule-exact-category
- KTheoryLowDegrees:Z.3/representation-ring-of-gl
- tauceti:TauCeti.ExactK0.mapEquiv

**Sources.**

- Serre.1968, §3.3, p. 47, identification of the group-scheme Grothendieck groups with the coalgebra construction of §2.3. The specified part of Serre’s argument is specialized to a PID; the free-coalgebra restriction permits the pinned finite-subcomodule theorem. The source itself allows flat coalgebras. Additivity is expanded through the two kernels described in the proof steps.

### Generic-fibre map on comodule K₀

**KTheoryLowDegrees:Z.3/integral-comodule-generic-map** · construction · implementation unchecked.

Construct i:G₀(C)→G₀(Cℚ), Cℚ=ℚ⊗ℤC, by extension of scalars. On a finite comodule E, i[E]=[ℚ⊗ℤE] with the pinned base-changed coaction. Its underlying functor preserves all short exact sequences.

**Hypotheses.**

- C is a coalgebra over ℤ, free as a ℤ-module; coactions are right coactions E→E⊗ℤC. The groups G₀ and R₀ are the existing exact Grothendieck groups, with underlying-module exact sequences.

**Construction or proof.**

- Package the existing Comodule.baseChange and Comodule.Hom.baseChange on finite objects; their identity and composition laws and module finiteness provide the finite-comodule functor. This is a wrapper around the pinned coefficient-coalgebra base change, not the similarly named functor that forgets the coaction.
- Tensoring with ℚ preserves injections and exactness because ℚ is flat over ℤ; right exactness preserves surjections. Thus the functor preserves the specified finiteExactStructure.
- Apply ExactK0.map and its object-class formula.

**Acceptance.**

- Construct i:G₀(C)→G₀(Cℚ), Cℚ=ℚ⊗ℤC, by extension of scalars. On a finite comodule E, i[E]=[ℚ⊗ℤE] with the pinned base-changed coaction. Its underlying functor preserves all short exact sequences.

**Prerequisites.**

- KTheoryLowDegrees:Z.3/integral-comodule-exact-category
- tauceti:TauCeti.Comodule.baseChange
- tauceti:TauCeti.Comodule.Hom.baseChange
- tauceti:TauCeti.FGComoduleCat.of
- tauceti:TauCeti.FGComoduleCat.ofHom
- mathlib:Module.Flat.lTensor_exact
- tauceti:TauCeti.ExactK0.map

**Uses.**

- KTheoryLowDegrees:Z.3/serre-representation-ring-theorem: Supplies the generic/residue-fibre comparison before applying the separate arbitrary-field formal-character theorem.

**Public API.**

- TauCeti.IntegralComodule.fieldBaseChange (constructor): For a field k, the functor E↦k⊗ℤE, using the existing base-changed coefficient coalgebra and coaction; only k=ℚ is asserted exact on every finite object.
- TauCeti.IntegralComodule.fieldBaseChange_map_tmul (simp): On a pure tensor a⊗e the map induced by f sends it to a⊗f(e).
- TauCeti.IntegralComodule.genericFibre_exact (compatibility): fieldBaseChange ℚ preserves the underlying-module exact structures.
- TauCeti.IntegralComodule.genericFibre (constructor): The induced additive homomorphism i.
- TauCeti.IntegralComodule.genericFibre_gcls (simp): i(gcls E)=gcls(ℚ⊗ℤE).
- TauCeti.IntegralComodule.genericFibre_unique (extensionality): An additive map with that value on every object class is i.

**Unit tests.**

- TauCeti.IntegralComodule.genericFibre_zero_test (degenerate): The zero comodule has zero generic fibre.
- TauCeti.IntegralComodule.genericFibre_unit_test (computation): For C=ℤ with the unit coalgebra, the class of ℤ maps to the class of the one-dimensional rational comodule, whose dimension is 1.
- TauCeti.IntegralComodule.genericFibre_torsion_test (non-example): A nonzero finite comodule killed by a nonzero integer has zero generic fibre; rational base change is not faithful on these objects.

**Sources.**

- Serre.1968, §2.4, p. 42, definition of i; §2.1, p. 41, the coefficient coalgebra C_K. Specialize the published flat-coalgebra argument to ℤ and a free coefficient coalgebra, retaining the stronger hypothesis needed by the pinned finite-hull theorem. The proof steps expand the cited argument; no equivariant splitting of a finite-free comodule is assumed.

### Residue inclusion on comodule K₀

**KTheoryLowDegrees:Z.3/integral-comodule-residue-inclusion** · construction · implementation unchecked.

For a prime p, construct j_p:G₀(C𝔽p)→G₀(C) by viewing a finite C𝔽p-comodule as a ℤ-comodule killed by p. Its coaction is transported through E⊗𝔽p(𝔽p⊗ℤC)≅E⊗ℤC. The functor is fully faithful and exact, with essential image the finite comodules annihilated by p.

**Hypotheses.**

- C is a coalgebra over ℤ, free as a ℤ-module; coactions are right coactions E→E⊗ℤC. The groups G₀ and R₀ are the existing exact Grothendieck groups, with underlying-module exact sequences.

**Construction or proof.**

- For a 𝔽p-module E, use the scalar-balancing tensor isomorphism to transport its coaction to E⊗ℤC. Coassociativity and the counit commute with this isomorphism. Morphisms retain their underlying functions.
- A ℤ-linear map between modules killed by p is 𝔽p-linear, and the transported coaction condition is equivalent to the original condition. This proves full faithfulness; the same identification supplies the inverse on the annihilated full subcategory.
- Finite-dimensional 𝔽p-modules are finitely generated over ℤ; forgetting scalars preserves injections, surjections and exactness. Descend the functor by ExactK0.map.

**Acceptance.**

- For a prime p, construct j_p:G₀(C𝔽p)→G₀(C) by viewing a finite C𝔽p-comodule as a ℤ-comodule killed by p. Its coaction is transported through E⊗𝔽p(𝔽p⊗ℤC)≅E⊗ℤC. The functor is fully faithful and exact, with essential image the finite comodules annihilated by p.

**Prerequisites.**

- KTheoryLowDegrees:Z.3/integral-comodule-exact-category
- tauceti:TauCeti.ExactK0.map

**Uses.**

- KTheoryLowDegrees:Z.3/serre-representation-ring-theorem: Supplies the generic/residue-fibre comparison before applying the separate arbitrary-field formal-character theorem.

**Public API.**

- TauCeti.IntegralComodule.residueRestriction (constructor): The finite-comodule functor from C𝔽p to C with the same underlying additive group.
- TauCeti.IntegralComodule.residueRestriction_exact (compatibility): Residue restriction preserves the given exact structures.
- TauCeti.IntegralComodule.residueRestriction_killed (characterisation): Multiplication by p annihilates its underlying module, and every finite C-comodule with that property comes from residue restriction.
- TauCeti.IntegralComodule.residueInclusion (constructor): The additive map j_p induced by residue restriction.
- TauCeti.IntegralComodule.residueInclusion_gcls (simp): j_p[E]=[residueRestriction(E)].
- TauCeti.IntegralComodule.genericFibre_residueInclusion (compatibility): i∘j_p=0, because the underlying modules are p-torsion.
- TauCeti.IntegralComodule.residueRestrictionUnderlying (compatibility): The underlying ℤ-module of residue restriction is linearly isomorphic to the original residue module with scalars forgotten.
- TauCeti.IntegralComodule.residueTensorEquiv (compatibility): The canonical ℤ-linear balancing isomorphism E⊗𝔽p(𝔽p⊗ℤC)≃E⊗ℤC.
- TauCeti.IntegralComodule.residueTensorEquiv_tmul (simp): The balancing map sends e⊗(a⊗c) to (ae)⊗c.
- TauCeti.IntegralComodule.residueRestriction_coact (characterisation): Under residueRestrictionUnderlying, the restricted coaction is the original residue coaction followed by residueTensorEquiv.
- TauCeti.IntegralComodule.residueRestriction_essentialImage (characterisation): Every finite integral comodule annihilated by p is isomorphic to the restriction of a finite residue comodule.

**Unit tests.**

- TauCeti.IntegralComodule.residueRestriction_zero_test (degenerate): The zero residue comodule restricts to zero.
- TauCeti.IntegralComodule.residueRestriction_unit_test (computation): The one-dimensional trivial residue comodule for the unit coalgebra restricts to the nonzero group ℤ/pℤ, killed by p; it is not the zero object.
- TauCeti.IntegralComodule.residueRestriction_not_free_test (non-example): That restricted nonzero object is not ℤ-free, so this functor does not land in FreeCategory.

**Sources.**

- Serre.1968, §2.1, p. 41 (residue-comodule identification); §2.4, p. 42, definition of j_v. Specialize the published flat-coalgebra argument to ℤ and a free coefficient coalgebra, retaining the stronger hypothesis needed by the pinned finite-hull theorem. The proof steps expand the cited argument; no equivariant splitting of a finite-free comodule is assumed.

### Stable lattices in rational comodules

**KTheoryLowDegrees:Z.3/integral-comodule-stable-lattice** · lemma · implementation unchecked.

Every finite-dimensional Cℚ-comodule V is isomorphic to ℚ⊗ℤL for a finite-free C-comodule L. Equivalently V contains a full ℤ-lattice stable under the C-coaction.

**Hypotheses.**

- C is a coalgebra over ℤ, free as a ℤ-module; coactions are right coactions E→E⊗ℤC. The groups G₀ and R₀ are the existing exact Grothendieck groups, with underlying-module exact sequences.

**Construction or proof.**

- Regard V as a C-comodule by V⊗ℚ(ℚ⊗ℤC)≅V⊗ℤC; its underlying ℤ-module need not be finite.
- Take the finite set given by a rational basis of V. The pinned finite-subcomodule theorem, using freeness of C, places it in a finite C-subcomodule L.
- L is torsion-free because it embeds in a rational vector space, hence is free over ℤ. The inclusion induces ℚ⊗ℤL→V; it is onto because L contains the chosen basis, and injective by localization. The map respects the coactions.

**Acceptance.**

- The zero vector space has the zero stable lattice. A stable lattice is free over ℤ, without any claim that it is projective as a C-comodule.

**Prerequisites.**

- KTheoryLowDegrees:Z.3/integral-comodule-generic-map
- KTheoryLowDegrees:Z.3/integral-free-comodule-exact-category
- tauceti:TauCeti.Subcomodule.exists_finite_subcomodule_of_setFinite
- mathlib:Module.free_of_finite_type_torsion_free'

**Sources.**

- Serre.1968, §2.4, Lemma 2(a), p. 43; §1.5, Proposition 2, p. 40. Specialize the published flat-coalgebra argument to ℤ and a free coefficient coalgebra, retaining the stronger hypothesis needed by the pinned finite-hull theorem. The proof steps expand the cited argument; no equivariant splitting of a finite-free comodule is assumed.

### Torsion classes come from residue fibres

**KTheoryLowDegrees:Z.3/integral-comodule-torsion-devissage** · lemma · implementation unchecked.

Let T(C)⊆G₀(C) be the sum of the images of all j_p. If a finite C-comodule E is killed by a nonzero integer, then [E]∈T(C). Only finitely many primes and classes are needed for each E.

**Hypotheses.**

- C is a coalgebra over ℤ, free as a ℤ-module; coactions are right coactions E→E⊗ℤC. The groups G₀ and R₀ are the existing exact Grothendieck groups, with underlying-module exact sequences.

**Construction or proof.**

- Replace the annihilator by its positive absolute value N. If N=1 the object is zero. Otherwise factor N as a finite product of primes, with repetition.
- Filter E by the images of multiplication by the successive partial products. These images are finite subcomodules because scalar multiplication is a comodule map. The final term is zero.
- Each successive quotient is killed by the next prime and is a residue comodule by residueRestriction_killed. Apply the exact-K₀ relation to each short sequence and sum the finitely many relations. This avoids an unjustified infinite sum or an assumption of semisimplicity.

**Acceptance.**

- For a comodule killed by p², both successive p-primary layers enter the devissage formula. Replacing this formula by the class of only E/pE omits a layer, although the two resulting classes may happen to agree or vanish in particular coalgebras. The unit-annihilator case is zero.

**Prerequisites.**

- KTheoryLowDegrees:Z.3/integral-comodule-residue-inclusion
- tauceti:TauCeti.Comodule.Hom.range
- tauceti:TauCeti.Subcomodule.instComoduleQuotient
- tauceti:TauCeti.ExactK0.of_conflation

**Sources.**

- Serre.1968, §2.4, p. 43, torsion-category remark and proof of Lemma 2(b). Specialize the published flat-coalgebra argument to ℤ and a free coefficient coalgebra, retaining the stronger hypothesis needed by the pinned finite-hull theorem. The proof steps expand the cited argument; no equivariant splitting of a finite-free comodule is assumed.

### Stable lattice classes agree modulo torsion

**KTheoryLowDegrees:Z.3/integral-comodule-lattice-class-independence** · lemma · implementation unchecked.

If L and L′ are stable full lattices in the same rational comodule, their classes agree in G₀(C)/T(C).

**Hypotheses.**

- C is a coalgebra over ℤ, free as a ℤ-module; coactions are right coactions E→E⊗ℤC. The groups G₀ and R₀ are the existing exact Grothendieck groups, with underlying-module exact sequences.

**Construction or proof.**

- Their intersection is a finite subcomodule. Finite generation of both lattices and clearing finitely many rational denominators gives a nonzero integer a with aL⊆L′ and aL′⊆L. Thus their intersection is full and each quotient is killed by a.
- Use torsion devissage for L/(L∩L′) and L′/(L∩L′), then the two exact sequences. Both lattice classes agree with the intersection class modulo T(C).
- Transport along an isomorphism of rational comodules to compare abstract lattices whose generic fibres are isomorphic.

**Acceptance.**

- Equality is in the quotient G₀(C)/T(C); equality already in G₀(C) requires the separate surjectivity hypothesis on decomposition maps.

**Prerequisites.**

- KTheoryLowDegrees:Z.3/integral-comodule-stable-lattice
- KTheoryLowDegrees:Z.3/integral-comodule-torsion-devissage
- tauceti:TauCeti.ExactK0.of_conflation

**Sources.**

- Serre.1968, §2.4, Lemma 2(b), p. 43. Specialize the published flat-coalgebra argument to ℤ and a free coefficient coalgebra, retaining the stronger hypothesis needed by the pinned finite-hull theorem. The proof steps expand the cited argument; no equivariant splitting of a finite-free comodule is assumed.

### Generic fibre as the quotient by residue classes

**KTheoryLowDegrees:Z.3/integral-comodule-generic-quotient** · construction · implementation unchecked.

The generic-fibre map induces an additive equivalence G₀(C)/T(C)≃G₀(Cℚ). Hence i is surjective and ker(i)=T(C). The inverse sends the class of a rational comodule to the class of any stable lattice modulo T(C).

**Hypotheses.**

- C is a coalgebra over ℤ, free as a ℤ-module; coactions are right coactions E→E⊗ℤC. The groups G₀ and R₀ are the existing exact Grothendieck groups, with underlying-module exact sequences.

**Construction or proof.**

- Since i∘j_p=0, i descends to the quotient. Choose a stable lattice in each rational object; lattice-class independence makes its class well defined and invariant under isomorphism.
- For an exact sequence V′→V→V″, take one stable lattice L in V, its intersection L′ with V′, and its image L″ in V″. These are full lattices: rational localization is exact and finite denominators give spanning. The exact sequence L′→L→L″ proves additivity of their quotient classes.
- Use ExactK0.lift to obtain the inverse. One composite is the identity on rational object classes. For a finite integral E, its torsion subcomodule is finite and killed by a common nonzero integer (choose generators); E modulo torsion embeds as a lattice in its generic fibre. Devissage and its exact sequence show the other composite fixes [E].
- Apply object-class extensionality and the quotient universal property to conclude the two inverse identities.

**Acceptance.**

- The generic-fibre map induces an additive equivalence G₀(C)/T(C)≃G₀(Cℚ). Hence i is surjective and ker(i)=T(C). The inverse sends the class of a rational comodule to the class of any stable lattice modulo T(C).

**Prerequisites.**

- KTheoryLowDegrees:Z.3/integral-comodule-generic-map
- KTheoryLowDegrees:Z.3/integral-comodule-residue-inclusion
- KTheoryLowDegrees:Z.3/integral-comodule-stable-lattice
- KTheoryLowDegrees:Z.3/integral-comodule-torsion-devissage
- KTheoryLowDegrees:Z.3/integral-comodule-lattice-class-independence
- tauceti:TauCeti.ExactK0.lift
- tauceti:TauCeti.ExactK0.hom_ext

**Uses.**

- KTheoryLowDegrees:Z.3/serre-representation-ring-theorem: Supplies the generic/residue-fibre comparison before applying the separate arbitrary-field formal-character theorem.

**Public API.**

- TauCeti.IntegralComodule.torsionClasses (data): The additive subgroup generated by the images of residueInclusion p for all primes p; this is a sum of subgroups, hence each element uses only finitely many terms.
- TauCeti.IntegralComodule.genericQuotientEquiv (constructor): The additive equivalence G₀(C)/torsionClasses≃G₀(Cℚ) induced by i.
- TauCeti.IntegralComodule.genericQuotientEquiv_mk (simp): The class modulo torsion of [E] maps to [ℚ⊗E].
- TauCeti.IntegralComodule.genericQuotientEquiv_symm_lattice (characterisation): For a stable lattice L in V, the inverse of [V] is the quotient class of [L].
- TauCeti.IntegralComodule.genericFibre_surjective (universal-property): The generic-fibre map i is surjective.
- TauCeti.IntegralComodule.genericFibre_ker (characterisation): ker(i)=torsionClasses.

**Unit tests.**

- TauCeti.IntegralComodule.genericQuotient_zero_test (degenerate): The zero class and zero lattice correspond.
- TauCeti.IntegralComodule.genericQuotient_unit_test (computation): For the unit coalgebra, the lattice ℤ in ℚ corresponds to the class of the one-dimensional rational comodule.
- TauCeti.IntegralComodule.genericQuotient_commensurable_test (compatibility): L and aL have the same quotient class for nonzero a, although L/aL can be a nonzero finite comodule.

**Sources.**

- Serre.1968, §2.4, Theorem 1 and its proof, p. 43. Specialize the published flat-coalgebra argument to ℤ and a free coefficient coalgebra, retaining the stronger hypothesis needed by the pinned finite-hull theorem. The proof steps expand the cited argument; no equivariant splitting of a finite-free comodule is assumed.

### Euler reduction to a residue fibre

**KTheoryLowDegrees:Z.3/integral-comodule-euler-reduction** · construction · implementation unchecked.

For a prime p, define q_p:G₀(C)→G₀(C𝔽p) by first applying the finite-free Euler comparison and then reducing a finite-free comodule modulo p. For any finite-free resolution P₁→P₀→E, q_p[E]=[P₀/pP₀]−[P₁/pP₁].

**Hypotheses.**

- C is a coalgebra over ℤ, free as a ℤ-module; coactions are right coactions E→E⊗ℤC. The groups G₀ and R₀ are the existing exact Grothendieck groups, with underlying-module exact sequences.

**Construction or proof.**

- Restrict the pinned coefficient-coalgebra base change to FreeCategory. Every inherited conflation has a free underlying quotient, so it splits as a sequence of ℤ-modules. Tensoring this splitting with 𝔽p proves underlying exactness after reduction; the splitting need not be equivariant.
- Descend reduction from R₀(C) to G₀(C𝔽p) using ExactK0.map. Compose with the existing euler:G₀(C)→R₀(C). The resolution formula and uniqueness follow from the corresponding properties of euler and object-class extensionality.
- Do not descend ordinary tensor reduction directly from all finite comodules: tensoring 0→ℤ —p→ ℤ→ℤ/pℤ→0 is not left exact. Euler reduction of the torsion quotient is zero, unlike its ordinary mod-p reduction.

**Acceptance.**

- For a prime p, define q_p:G₀(C)→G₀(C𝔽p) by first applying the finite-free Euler comparison and then reducing a finite-free comodule modulo p. For any finite-free resolution P₁→P₀→E, q_p[E]=[P₀/pP₀]−[P₁/pP₁].

**Prerequisites.**

- KTheoryLowDegrees:Z.3/integral-comodule-generic-map
- KTheoryLowDegrees:Z.3/integral-comodule-euler-map
- KTheoryLowDegrees:Z.3/integral-free-comodule-exact-category
- tauceti:TauCeti.ExactK0.map

**Uses.**

- KTheoryLowDegrees:Z.3/serre-representation-ring-theorem: Supplies the generic/residue-fibre comparison before applying the separate arbitrary-field formal-character theorem.

**Public API.**

- TauCeti.IntegralComodule.freeReduction (constructor): The functor from finite-free C-comodules to finite C𝔽p-comodules, using the existing base-changed coaction.
- TauCeti.IntegralComodule.freeReduction_exact (compatibility): Reduction is conflation-exact on FreeCategory.
- TauCeti.IntegralComodule.eulerReduction (constructor): q_p is reduction on exact K₀ composed with euler.
- TauCeti.IntegralComodule.eulerReduction_resolution (characterisation): q_p[E]=[P₀/pP₀]−[P₁/pP₁] for every finite-free resolution.
- TauCeti.IntegralComodule.eulerReduction_free (simp): q_p[L]=[L/pL] for a finite-free comodule L.
- TauCeti.IntegralComodule.eulerReduction_unique (extensionality): Agreement on all finite-free comodule classes characterizes q_p.

**Unit tests.**

- TauCeti.IntegralComodule.eulerReduction_zero_test (degenerate): The zero object and zero resolution have Euler reduction zero.
- TauCeti.IntegralComodule.eulerReduction_free_test (computation): The trivial lattice ℤ has reduction equal to the nonzero class of its one-dimensional scalar extension over 𝔽p.
- TauCeti.IntegralComodule.eulerReduction_torsion_test (non-example): For the unit coalgebra, Euler reduction of [ℤ/pℤ] is zero, whereas ordinary tensor reduction is the nonzero one-dimensional residue object.

**Sources.**

- Serre.1968, §2.5, p. 44, definition of q_v using the identification in Proposition 4. Specialize the published flat-coalgebra argument to ℤ and a free coefficient coalgebra, retaining the stronger hypothesis needed by the pinned finite-hull theorem. The proof steps expand the cited argument; no equivariant splitting of a finite-free comodule is assumed.

### Euler reduction annihilates residue inclusions

**KTheoryLowDegrees:Z.3/integral-comodule-reduction-kills-residues** · lemma · implementation unchecked.

For any primes p and ℓ, q_p∘j_ℓ=0.

**Hypotheses.**

- C is a coalgebra over ℤ, free as a ℤ-module; coactions are right coactions E→E⊗ℤC. The groups G₀ and R₀ are the existing exact Grothendieck groups, with underlying-module exact sequences.

**Construction or proof.**

- Write a finite C𝔽ℓ-comodule, after residue restriction, as P/Q using a finite-free cover P and its finite-free kernel Q. Then ℓP⊆Q, and q_p j_ℓ[E]=[P/pP]−[Q/pQ].
- For p≠ℓ, multiplication by p is invertible on E=P/Q. To prove Q/pQ→P/pP is injective, if q=px∈Q, the class of x in E is killed by p and hence zero, so x∈Q. For surjectivity, write each class of x in E as p times a class of y, so x−py∈Q. The induced isomorphism respects coactions.
- For p=ℓ use 0→pP/pQ→Q/pQ→P/pP→P/Q→0. The first injection uses pP⊆Q; its middle kernel is pP/pQ. Multiplication by p identifies P/Q with pP/pQ because P is torsion-free. Split the four-term sequence at the image into two short exact sequences and cancel the equal end classes.
- Both cases give equal residue classes of P/pP and Q/pQ. Apply exact-K₀ object-class extensionality to conclude the composite vanishes.

**Acceptance.**

- The equal-prime case does not identify Q/pQ→P/pP as an isomorphism: for P=ℤ and Q=pℤ that induced map is zero. Equality of their K₀ classes follows from the four-term relation.

**Prerequisites.**

- KTheoryLowDegrees:Z.3/integral-comodule-residue-inclusion
- KTheoryLowDegrees:Z.3/integral-comodule-free-resolution
- KTheoryLowDegrees:Z.3/integral-comodule-euler-reduction
- tauceti:TauCeti.ExactK0.of_conflation
- tauceti:TauCeti.ExactK0.hom_ext

**Sources.**

- Serre.1968, §2.5, Lemma 3 and its proof, p. 44. Specialize the published flat-coalgebra argument to ℤ and a free coefficient coalgebra, retaining the stronger hypothesis needed by the pinned finite-hull theorem. The proof steps expand the cited argument; no equivariant splitting of a finite-free comodule is assumed.

### Decomposition homomorphism

**KTheoryLowDegrees:Z.3/integral-comodule-decomposition-map** · construction · implementation unchecked.

For each prime p there is a unique additive map d_p:G₀(Cℚ)→G₀(C𝔽p) with d_p∘i=q_p. If L is any stable lattice in V, then d_p[V]=[L/pL]. The class is independent of the lattice.

**Hypotheses.**

- C is a coalgebra over ℤ, free as a ℤ-module; coactions are right coactions E→E⊗ℤC. The groups G₀ and R₀ are the existing exact Grothendieck groups, with underlying-module exact sequences.

**Construction or proof.**

- The preceding annihilation theorem says q_p vanishes on each residue image, hence on their sum T(C). Factor it through the quotient group.
- Compose this quotient map with the inverse of genericQuotientEquiv. The factorization identity follows on integral object classes and then by homomorphism extensionality.
- Surjectivity of i proves uniqueness. For a stable lattice L, substitute i[L]=[V] and eulerReduction_free to obtain the lattice formula. Applying the same formula to two lattices proves equality of their reduction classes; do not assume their reduced objects are isomorphic.

**Acceptance.**

- For each prime p there is a unique additive map d_p:G₀(Cℚ)→G₀(C𝔽p) with d_p∘i=q_p. If L is any stable lattice in V, then d_p[V]=[L/pL]. The class is independent of the lattice.

**Prerequisites.**

- KTheoryLowDegrees:Z.3/integral-comodule-generic-quotient
- KTheoryLowDegrees:Z.3/integral-comodule-reduction-kills-residues
- KTheoryLowDegrees:Z.3/integral-comodule-euler-reduction

**Uses.**

- KTheoryLowDegrees:Z.3/serre-representation-ring-theorem: Supplies the generic/residue-fibre comparison before applying the separate arbitrary-field formal-character theorem.

**Public API.**

- TauCeti.IntegralComodule.decomposition (constructor): The additive map d_p obtained from the generic quotient and Euler reduction.
- TauCeti.IntegralComodule.decomposition_genericFibre (compatibility): d_p∘i=q_p.
- TauCeti.IntegralComodule.decomposition_lattice (characterisation): For any lattice L with generic fibre V, d_p[V]=[L/pL].
- TauCeti.IntegralComodule.decomposition_unique (universal-property): Every additive map satisfying the factorization through i equals d_p.
- TauCeti.IntegralComodule.decomposition_lattice_independent (compatibility): Two stable lattices in the same rational comodule have equal reduction classes in exact K₀.

**Unit tests.**

- TauCeti.IntegralComodule.decomposition_zero_test (degenerate): The zero rational comodule maps to zero.
- TauCeti.IntegralComodule.decomposition_unit_test (computation): The trivial one-dimensional rational comodule maps to the trivial one-dimensional residue class.
- TauCeti.IntegralComodule.decomposition_scaled_lattice_test (compatibility): L and pL give the same class after reduction, although the map pL/p²L→L/pL induced by inclusion is zero. The comparison uses abstract lattice isomorphism, not that inclusion.

**Sources.**

- Serre.1968, §2.5, Theorem 2, p. 44; §2.7, p. 45, the lattice formula. Specialize the published flat-coalgebra argument to ℤ and a free coefficient coalgebra, retaining the stronger hypothesis needed by the pinned finite-hull theorem. The proof steps expand the cited argument; no equivariant splitting of a finite-free comodule is assumed.

### Residue inclusion vanishes after decomposition

**KTheoryLowDegrees:Z.3/integral-comodule-residue-after-decomposition** · lemma · implementation unchecked.

For each prime p, j_p∘d_p=0.

**Hypotheses.**

- C is a coalgebra over ℤ, free as a ℤ-module; coactions are right coactions E→E⊗ℤC. The groups G₀ and R₀ are the existing exact Grothendieck groups, with underlying-module exact sequences.

**Construction or proof.**

- Choose a stable finite-free lattice L in a rational object V. The lattice formula identifies j_p d_p[V] with the integral class [L/pL].
- The exact sequence 0→pL→L→L/pL→0 gives [L/pL]=[L]−[pL]. Multiplication by p is an equivariant isomorphism from L onto pL, because L is torsion-free.
- Therefore the class is zero; extend to the Grothendieck group by object-class extensionality. This proves only the composite vanishes. Vanishing of j_p itself additionally requires surjectivity of d_p.

**Acceptance.**

- Multiplication by p is an isomorphism L→pL, not an automorphism L→L. For L=ℤ its image has index p.

**Prerequisites.**

- KTheoryLowDegrees:Z.3/integral-comodule-stable-lattice
- KTheoryLowDegrees:Z.3/integral-comodule-decomposition-map
- tauceti:TauCeti.ExactK0.of_conflation
- tauceti:TauCeti.ExactK0.hom_ext

**Sources.**

- Serre.1968, §2.7, Lemma 4, p. 45 (all nonzero primes of ℤ are principal). Specialize the published flat-coalgebra argument to ℤ and a free coefficient coalgebra, retaining the stronger hypothesis needed by the pinned finite-hull theorem. The proof steps expand the cited argument; no equivariant splitting of a finite-free comodule is assumed.

### Integral comparison from surjective decomposition maps

**KTheoryLowDegrees:Z.3/integral-comodule-generic-isomorphism** · theorem · implementation unchecked.

Assume every d_p is surjective. Then i:G₀(C)→G₀(Cℚ) is an additive isomorphism. Composing with the finite-free comparison gives R₀(C)≃G₀(Cℚ), carrying every finite-free class to its rational scalar extension.

**Hypotheses.**

- C is a coalgebra over ℤ, free as a ℤ-module; coactions are right coactions E→E⊗ℤC. The groups G₀ and R₀ are the existing exact Grothendieck groups, with underlying-module exact sequences.

**Construction or proof.**

- From j_p∘d_p=0 and surjectivity of d_p, conclude j_p=0 for every prime p. Their image sum T(C) is therefore zero.
- The generic quotient theorem gives surjectivity of i and ker(i)=T(C)=0, hence injectivity. Bundle this existing map and its inverse as an additive equivalence.
- Compose with k0Equiv:R₀(C)≃G₀(C). Its object-class formula gives the finite-free comparison. No surjectivity or isomorphism assertion is made for decomposition maps of an arbitrary coalgebra.

**Acceptance.**

- The hypothesis is checked separately for the split GL application through the formal-character theorem. The theorem may not be invoked merely because C is free or because the base is a PID.

**Prerequisites.**

- KTheoryLowDegrees:Z.3/integral-comodule-residue-after-decomposition
- KTheoryLowDegrees:Z.3/integral-comodule-generic-quotient
- KTheoryLowDegrees:Z.3/integral-comodule-k0-comparison

**Sources.**

- Serre.1968, §2.7, Theorem 3 and Corollary, p. 45. Specialize the published flat-coalgebra argument to ℤ and a free coefficient coalgebra, retaining the stronger hypothesis needed by the pinned finite-hull theorem. The proof steps expand the cited argument; no equivariant splitting of a finite-free comodule is assumed.

### Exactness of torus weight spaces

**KTheoryLowDegrees:Z.3/torus-weight-exactness** · lemma · implementation unchecked.

For a PID R and every short exact sequence of finite R[X]-comodules, taking the x-weight space gives a short exact sequence of R-modules. Weight spaces are finite; those of an R-free object are R-free.

**Hypotheses.**

- X is a commutative group, written multiplicatively; for GLₙ it is the character lattice ℤⁿ written multiplicatively. All representations are rational comodules over the indicated coordinate coalgebra. Formal characters lie in ℤ[X], not in the coefficient field and not in functions on rational points.
- R is a commutative domain and principal ideal ring.

**Construction or proof.**

- Use the pinned Comodule.weightSpace; restrict a comodule morphism using Hom.map_mem_weightSpace. No new weight-space carrier is introduced.
- Injection is inherited from the underlying map. For a target weight vector, choose an arbitrary preimage and apply the x-weight projection. Hom.map_weightProj proves that this is a weight preimage, giving surjectivity. For a kernel vector, apply the same projection to its preimage under the first map to prove exactness.
- Finiteness follows because R is noetherian and a weight space is a submodule of a finite module. Freeness follows for a submodule of a free module over a PID. The exactness argument itself uses no averaging and no division by the order of a group of rational points.

**Acceptance.**

- The short sequence ℤ —p→ ℤ→ℤ/pℤ in a fixed weight remains exact after taking that weight; this assertion does not say that reduction of the sequence is left exact.
- The suggested weightMap is the restriction of the original map on vectors, with weight_exact, weight_finite and weight_free giving the specified contracts.

**Prerequisites.**

- KTheoryLowDegrees:Z.3/integral-comodule-exact-category
- tauceti:TauCeti.Comodule.weightSpace
- tauceti:TauCeti.Comodule.Hom.map_mem_weightSpace
- tauceti:TauCeti.Comodule.Hom.map_weightProj
- tauceti:TauCeti.Comodule.weightProj_of_mem
- tauceti:TauCeti.Comodule.weightProj_mem_weightSpace

**Uses.**

- KTheoryLowDegrees:Z.3/torus-formal-character: Proves additivity of each integer weight coefficient in a short exact sequence.

**Public API.**

- TauCeti.IntegralComodule.weightMap (constructor): Restrict a native comodule morphism to its x-weight submodules.
- TauCeti.IntegralComodule.weightMap_apply (simp): After inclusion in the ambient target, weightMap applies the original linear map.
- TauCeti.IntegralComodule.weight_exact (relation): The restricted maps in every conflation are injective, surjective, and exact in the middle.
- TauCeti.IntegralComodule.weight_finite (instance): Every weight of a finite comodule over a PID is finite over the base.
- TauCeti.IntegralComodule.weight_free (instance): Every weight of a free comodule over a PID is free over the base.

**Unit tests.**

- TauCeti.IntegralComodule.weightMap_zero_test (degenerate): The restricted zero morphism sends every weight vector to zero.
- TauCeti.IntegralComodule.weightMap_identity_test (compatibility): Restricting the identity acts as the identity on each weight space.
- TauCeti.IntegralComodule.weightMap_comp_test (compatibility): Restricting a composite equals the composite of the restricted linear maps.

**Sources.**

- Serre.1968, §3.4, pp. 47–48 (grading and exactness); §3.4, Proposition 7, p. 48. Expands the weight-by-weight argument and the two commuting diagrams in the published proof of Theorem 5. The specialization to ℤ retains the free coefficient-coalgebra hypothesis used by the preceding decomposition construction. The native comodule, corestriction and weight-space definitions are imported.

### Torus coefficient base change

**KTheoryLowDegrees:Z.3/torus-coefficient-basechange** · construction · implementation unchecked.

For every field k, reuse the pinned scalarTensorBialgEquiv ℤ k and forget its algebra structure to identify k⊗ℤℤ[X] with k[X] as coalgebras, by a⊗n[x]↦an[x]. The new construction in this node is the finite-comodule functor torusBaseChange, formed by fieldBaseChange followed by native corestriction through that equivalence.

**Hypotheses.**

- X is a commutative group, written multiplicatively; for GLₙ it is the character lattice ℤⁿ written multiplicatively. All representations are rational comodules over the indicated coordinate coalgebra. Formal characters lie in ℤ[X], not in the coefficient field and not in functions on rational points.

**Construction or proof.**

- Import TauCeti.MonoidAlgebra.scalarTensorBialgEquiv. Its statement is more general: every commutative semiring extension and commutative indexing monoid. Here use ℤ→k and the character group X. Its existing coalgebra equivalence is the helper torusCoefficientBaseChange; do not reconstruct or reprove it.
- The pinned scalarTensorBialgEquiv_tmul and inverse-single formula give the forward and inverse coefficient formulas. This makes the specified torus coefficient comparison identical to the native comparison used in the GL diagonal base-change theorem.
- Compose the existing finite-comodule fieldBaseChange with FGComoduleCat.corestrict. The object module is k⊗ℤE with the transported coaction, and maps send a⊗v to a⊗f(v). No exactness on all finite integral objects is asserted.

**Acceptance.**

- Distinct basis weights stay distinct over every field, including 𝔽₂. The coefficient equivalence is reused from the pinned library; only its composition with the finite-comodule base-change functor is planned here.

**Prerequisites.**

- KTheoryLowDegrees:Z.3/integral-comodule-generic-map
- tauceti:TauCeti.MonoidAlgebra.scalarTensorBialgEquiv
- tauceti:TauCeti.MonoidAlgebra.scalarTensorBialgEquiv_tmul
- tauceti:TauCeti.MonoidAlgebra.scalarTensorBialgEquiv_symm_single
- tauceti:TauCeti.FGComoduleCat.corestrict

**Uses.**

- KTheoryLowDegrees:Z.3/decomposition-character-compatibility: Computes integral formal characters of a stable lattice on its rational and residue fibres.
- KTheoryLowDegrees:Z.3/serre-representation-ring-theorem: Supplies the character-compatibility step of Serre Theorem 5, conditional on the separate GL coefficient and arbitrary-field character inputs.

**Public API.**

- TauCeti.IntegralComodule.torusCoefficientBaseChange (equivalence): Reuse the coalgebra equivalence underlying the pinned scalarTensorBialgEquiv; this helper is not a new library target.
- TauCeti.IntegralComodule.torusCoefficientBaseChange_single (simp): It sends a⊗n[x] to an[x], for a∈k and n∈ℤ.
- TauCeti.IntegralComodule.torusBaseChange (constructor): The finite-comodule functor using fieldBaseChange and native corestriction.
- TauCeti.IntegralComodule.torusBaseChange_map_tmul (functoriality): The underlying map on a pure tensor is a⊗f(v); identity and composition are inherited from the composed functors.

**Unit tests.**

- TauCeti.IntegralComodule.torusCoefficientBaseChange_zero_test (degenerate): The coefficient equivalence sends zero to zero.
- TauCeti.IntegralComodule.torusCoefficientBaseChange_value_test (computation): Over ℚ, 2⊗3[x] maps to 6[x].
- TauCeti.IntegralComodule.torusCoefficientBaseChange_distinct_test (non-example): For every prime p and distinct weights x,y, the images of 1⊗[x] and 1⊗[y] in 𝔽p[X] are unequal.

**Sources.**

- Serre.1968, §3.4, pp. 47–48 (diagonalizable coefficient coalgebra); §3.7, p. 51 (the same character group after base change). Expands the weight-by-weight argument and the two commuting diagrams in the published proof of Theorem 5. The specialization to ℤ retains the free coefficient-coalgebra hypothesis used by the preceding decomposition construction. The native comodule, corestriction and weight-space definitions are imported.

### Base change of a torus weight

**KTheoryLowDegrees:Z.3/torus-weight-basechange** · construction · implementation unchecked.

For a finite ℤ[X]-comodule E, any field k and any weight x, the natural map k⊗ℤE_x→(k⊗ℤE)_x is a k-linear equivalence, using torusBaseChange on the target. It sends a⊗v to the same tensor in k⊗E and is natural in E. If E is ℤ-free, the dimension of the new x-weight space equals rankℤ(E_x).

**Hypotheses.**

- X is a commutative group, written multiplicatively; for GLₙ it is the character lattice ℤⁿ written multiplicatively. All representations are rational comodules over the indicated coordinate coalgebra. Formal characters lie in ℤ[X], not in the coefficient field and not in functions on rational points.

**Construction or proof.**

- Import the native internal direct sum of weight spaces and its projections. Every weight inclusion is split by its projection. Tensoring a split pair preserves its two inverse-on-image identities, even for the nonflat ℤ-algebra 𝔽p.
- Using the coefficient comparison, calculate the base-changed coaction on a⊗v. Its x-coefficient is a⊗π_x(v); hence the base-changed weight projection equals the tensor extension of π_x. The split image is exactly the x-weight space. This constructs the equivalence and its pure-tensor formula.
- Apply Hom.map_weightProj to prove naturality. If E is free, torus-weight-exactness gives a finite free E_x; use the pinned finrank_baseChange and the equivalence to obtain dimension equality. Do not infer dimension invariance for a torsion lattice.

**Acceptance.**

- The weight-space equivalence applies to torsion E, but the rank/dimension equality requires E free: a nonzero fixed-weight ℤ/pℤ has zero generic fibre and one-dimensional residue fibre.

**Prerequisites.**

- KTheoryLowDegrees:Z.3/torus-coefficient-basechange
- KTheoryLowDegrees:Z.3/torus-weight-exactness
- tauceti:TauCeti.Comodule.isInternal_weightSpace
- tauceti:TauCeti.Comodule.range_weightProj
- tauceti:TauCeti.Comodule.Hom.map_weightProj
- mathlib:Module.finrank_baseChange

**Uses.**

- KTheoryLowDegrees:Z.3/decomposition-character-compatibility: Computes integral formal characters of a stable lattice on its rational and residue fibres.
- KTheoryLowDegrees:Z.3/serre-representation-ring-theorem: Supplies the character-compatibility step of Serre Theorem 5, conditional on the separate GL coefficient and arbitrary-field character inputs.

**Public API.**

- TauCeti.IntegralComodule.weightBaseChange (equivalence): The natural k-linear equivalence k⊗E_x≃(torusBaseChange E)_x.
- TauCeti.IntegralComodule.weightBaseChange_tmul (simp): The inclusion into k⊗E carries the image of a⊗v to a⊗v.
- TauCeti.IntegralComodule.weightBaseChange_natural (functoriality): The square for the scalar extension of weightMap and weightMap of torusBaseChange commutes.
- TauCeti.IntegralComodule.weightBaseChange_finrank (compatibility): For E free, dim_k((k⊗E)_x)=rankℤ(E_x).

**Unit tests.**

- TauCeti.IntegralComodule.weightBaseChange_zero_test (degenerate): The zero vector maps to zero under the weight equivalence.
- TauCeti.IntegralComodule.weightBaseChange_inclusion_test (compatibility): Over ℚ the image of 1⊗v includes into ℚ⊗E as the original 1⊗v.
- TauCeti.IntegralComodule.weightBaseChange_rank_one_test (computation): A rank-one weight space in a finite free lattice reduces to a one-dimensional weight space at every prime.

**Sources.**

- Serre.1968, §3.4, pp. 47–48; §3.7, p. 51, second commuting diagram in the proof of Theorem 5. Expands the weight-by-weight argument and the two commuting diagrams in the published proof of Theorem 5. The specialization to ℤ retains the free coefficient-coalgebra hypothesis used by the preceding decomposition construction. The native comodule, corestriction and weight-space definitions are imported.

### Integral formal characters of torus comodules

**KTheoryLowDegrees:Z.3/torus-formal-character** · construction · implementation unchecked.

For a field k, define ch_k:G₀(k[X])→ℤ[X] by ch_k[E]=Σ_x dim_k(E_x)[x]. It is an additive isomorphism. For finite free integral torus comodules define ch_ℤ:R₀(ℤ[X])→ℤ[X] by the analogous ranks. Both maps are uniquely characterized by these object-class formulas.

**Hypotheses.**

- X is a commutative group, written multiplicatively; for GLₙ it is the character lattice ℤⁿ written multiplicatively. All representations are rational comodules over the indicated coordinate coalgebra. Formal characters lie in ℤ[X], not in the coefficient field and not in functions on rational points.

**Construction or proof.**

- Use finite_setOf_weightSpace_ne_bot to prove that the weight-rank coefficient function has finite support. Package it in the native MonoidAlgebra carrier with integer coefficients, even when k has characteristic p.
- The preceding exactness of each weight and finite-dimensional dimension additivity prove the field formula is additive on every conflation and invariant under isomorphism. For free integral objects, weight submodules are finite free; a conflation gives exact weight sequences with free quotients, hence additive ranks. Apply the existing ExactK0.lift separately to the two additive invariants; hom_ext gives uniqueness.
- For each x construct the one-dimensional comodule L_x with underlying module k and coaction a↦a⊗[x]. Its character is [x]. Every finite k[X]-comodule is the finite direct sum of its weight spaces; choose a basis in each weight to identify its K₀ class with Σ_x dim(E_x)[L_x]. Thus the additive map sending the basis [x] of ℤ[X] to [L_x] is a two-sided inverse to ch_k.
- This node is the additive character comparison needed by Serre. The tensor and exterior-power compatibility of representation-ring-of-gl remains in its existing owner node; it is not inferred merely from the additive equivalence.

**Acceptance.**

- p copies of L_x over 𝔽p have character p[x]≠0 in ℤ[X].
- For G_m over 𝔽₂, weights 0 and 1 have distinct formal characters although their functions on 𝔽₂× agree.

**Prerequisites.**

- KTheoryLowDegrees:Z.3/torus-weight-exactness
- KTheoryLowDegrees:Z.3/integral-free-comodule-exact-category
- tauceti:TauCeti.Comodule.finite_setOf_weightSpace_ne_bot
- tauceti:TauCeti.Comodule.isInternal_weightSpace
- tauceti:TauCeti.ExactK0.lift
- tauceti:TauCeti.ExactK0.hom_ext

**Uses.**

- KTheoryLowDegrees:Z.3/decomposition-character-compatibility: Computes integral formal characters of a stable lattice on its rational and residue fibres.
- KTheoryLowDegrees:Z.3/serre-representation-ring-theorem: Supplies the character-compatibility step of Serre Theorem 5, conditional on the separate GL coefficient and arbitrary-field character inputs.

**Public API.**

- TauCeti.IntegralComodule.torusObjectCharacter (constructor): The finite integral sum of the weight dimensions of a field comodule.
- TauCeti.IntegralComodule.torusObjectCharacter_coeff (projection): Its coefficient at x is the integer dim_k(E_x).
- TauCeti.IntegralComodule.torusObjectCharacter_exact (relation): For a conflation E₁→E₂→E₃ the characters satisfy ch(E₂)=ch(E₁)+ch(E₃).
- TauCeti.IntegralComodule.torusCharacter (constructor): The induced additive homomorphism on exact G₀.
- TauCeti.IntegralComodule.torusCharacter_gcls (simp): Evaluation on an object class is torusObjectCharacter.
- TauCeti.IntegralComodule.torusCharacter_unique (universal-property): Those values on every object class determine the homomorphism uniquely.
- TauCeti.IntegralComodule.weightLine (constructor): The one-dimensional rational torus comodule of weight x.
- TauCeti.IntegralComodule.weightLineUnderlying (equivalence): Its underlying k-module is k.
- TauCeti.IntegralComodule.weightLine_coact (characterisation): Every vector has coaction v⊗[x].
- TauCeti.IntegralComodule.torusCharacter_weightLine (simp): The class of weightLine x maps to [x].
- TauCeti.IntegralComodule.torusCharacter_bijective (equivalence): The inverse sends [x] to the class of weightLine x.
- TauCeti.IntegralComodule.latticeObjectCharacter (constructor): The finite integral sum of weight ranks for a finite free integral comodule.
- TauCeti.IntegralComodule.latticeObjectCharacter_coeff (projection): Its coefficient at x is rankℤ(E_x).
- TauCeti.IntegralComodule.latticeCharacter (constructor): The induced additive map from R₀ of finite free integral torus comodules.
- TauCeti.IntegralComodule.latticeCharacter_rcls (simp): Evaluation on a free object class is latticeObjectCharacter.
- TauCeti.IntegralComodule.latticeCharacter_unique (universal-property): The values on all finite free object classes determine latticeCharacter uniquely.

**Unit tests.**

- TauCeti.IntegralComodule.torusCharacter_zero_test (degenerate): The field character homomorphism maps zero to zero.
- TauCeti.IntegralComodule.torusCharacter_weight_test (computation): A one-dimensional weight-x comodule has formal character [x].
- TauCeti.IntegralComodule.torusCharacter_integer_test (non-example): Over 𝔽p the character of p copies of the weight-x line is p[x], which is nonzero in ℤ[X].
- TauCeti.IntegralComodule.torusCharacter_formal_test (non-example): Distinct weights give different formal characters over every residue field.
- TauCeti.IntegralComodule.latticeCharacter_zero_test (degenerate): The integral lattice-character homomorphism maps zero to zero.
- TauCeti.IntegralComodule.latticeCharacter_reduction_test (compatibility): For a finite free integral torus comodule, the formal characters of its rational and mod-p fibres are equal.
- TauCeti.IntegralComodule.torusCharacter_point_collision_test (non-example): The weight-0 and weight-1 monomials in ℤ[ℤ] differ, while u⁰=u¹ for every unit u of 𝔽₂.

**Sources.**

- Serre.1968, §3.4, Proposition 7, p. 48, and its inverse from the weight functors; §3.7, p. 51. Expands the weight-by-weight argument and the two commuting diagrams in the published proof of Theorem 5. The specialization to ℤ retains the free coefficient-coalgebra hypothesis used by the preceding decomposition construction. The native comodule, corestriction and weight-space definitions are imported.

### Torus characters preserve lattice ranks

**KTheoryLowDegrees:Z.3/torus-character-basechange** · lemma · implementation unchecked.

For every finite free ℤ[X]-comodule L and field k, ch_k[k⊗ℤL]=ch_ℤ[L] in ℤ[X]. In particular its rational and mod-p formal characters agree coefficient by coefficient.

**Hypotheses.**

- X is a commutative group, written multiplicatively; for GLₙ it is the character lattice ℤⁿ written multiplicatively. All representations are rational comodules over the indicated coordinate coalgebra. Formal characters lie in ℤ[X], not in the coefficient field and not in functions on rational points.
- L is finite free over ℤ; ordinary reduction of arbitrary finite torsion objects is excluded.

**Construction or proof.**

- Apply torus-weight-basechange to each x and use its finrank identity. Both character coefficients are precisely the resulting common integer.
- Use coefficient extensionality for the native monoid algebra. Finite support has already been proved by torus-formal-character, so no infinite sum is introduced.

**Acceptance.**

- A weight-x free line has character [x] both over ℚ and over 𝔽p; rank-one weight spaces do not disappear modulo p.
- The suggested theorem torusCharacter_baseChange and latticeCharacter_reduction_test state the equality on the native object classes.

**Prerequisites.**

- KTheoryLowDegrees:Z.3/torus-weight-basechange
- KTheoryLowDegrees:Z.3/torus-formal-character

**Sources.**

- Serre.1968, §3.7, p. 51, the triangle for the torus character maps. Expands the weight-by-weight argument and the two commuting diagrams in the published proof of Theorem 5. The specialization to ℤ retains the free coefficient-coalgebra hypothesis used by the preceding decomposition construction. The native comodule, corestriction and weight-space definitions are imported.

### Restriction character on a coefficient fibre

**KTheoryLowDegrees:Z.3/restriction-formal-character** · construction · implementation unchecked.

For k a field, let r_k:k⊗ℤC→k[X] be the base change of r followed by the torus coefficient identification. The existing corestriction functor along r_k is exact. Composing its ExactK0.map with ch_k gives Ch_k:G₀(k⊗ℤC)→ℤ[X]. Corestriction commutes with integral base change by the canonical identity on k⊗E.

**Hypotheses.**

- X is a commutative group, written multiplicatively; for GLₙ it is the character lattice ℤⁿ written multiplicatively. All representations are rational comodules over the indicated coordinate coalgebra. Formal characters lie in ℤ[X], not in the coefficient field and not in functions on rational points.
- C is a ℤ-coalgebra free over ℤ, and r:C→ℤ[X] is a coalgebra morphism. For a group scheme with a chosen split torus, r is the restriction morphism on coordinate coalgebras. No injectivity of the resulting character map is assumed.

**Construction or proof.**

- Define r_k on a⊗c as the image of a⊗r(c) under torusCoefficientBaseChange. The balancing law and the coalgebra identities of r make this a coalgebra morphism.
- Use native FGComoduleCat.corestrict: it keeps the underlying module and map. Thus it preserves addition and all underlying-module short exact sequences. Apply the existing ExactK0.map and compose with torusCharacter.
- For an integral comodule E compare the two coactions on k⊗E. Each is obtained by tensoring its coaction and then applying r_k on the coefficient factor. Equality on pure tensors gives the natural comparison isomorphism; both underlying maps are the identity. This proof uses no choice of a basis of E.
- The value on an object class follows from ExactK0.map_of and torusCharacter_gcls. ExactK0.hom_ext gives uniqueness. In the GL application use the coefficient square of gl-product-restriction-basechange; its exact K₀ and formal-character transport remains to be packaged.

**Acceptance.**

- Restriction along an arbitrary r need not make Ch_k injective. The subsequent isomorphism criterion includes that as an explicit separate hypothesis.

**Prerequisites.**

- KTheoryLowDegrees:Z.3/torus-coefficient-basechange
- KTheoryLowDegrees:Z.3/torus-formal-character
- KTheoryLowDegrees:Z.3/integral-comodule-generic-map
- tauceti:TauCeti.FGComoduleCat.corestrict
- tauceti:TauCeti.ExactK0.map

**Uses.**

- KTheoryLowDegrees:Z.3/decomposition-character-compatibility: Computes integral formal characters of a stable lattice on its rational and residue fibres.
- KTheoryLowDegrees:Z.3/serre-representation-ring-theorem: Supplies the character-compatibility step of Serre Theorem 5, conditional on the separate GL coefficient and arbitrary-field character inputs.

**Public API.**

- TauCeti.IntegralComodule.torusRestrictionCoefficient (constructor): The coefficient coalgebra map r_k:k⊗C→k[X].
- TauCeti.IntegralComodule.torusRestrictionCoefficient_tmul (simp): On a⊗c it is the coefficient comparison applied to a⊗r(c).
- TauCeti.IntegralComodule.torusRestriction (constructor): Native finite-comodule corestriction along r_k.
- TauCeti.IntegralComodule.torusRestriction_exact (compatibility): The functor preserves the specified underlying-module exact structures; it is additive.
- TauCeti.IntegralComodule.restrictedCharacter (constructor): The additive map Ch_k obtained from exact corestriction and the formal torus character.
- TauCeti.IntegralComodule.restrictedCharacter_gcls (simp): Ch_k[E] is the torusObjectCharacter of the restricted object.
- TauCeti.IntegralComodule.restrictedCharacter_unique (universal-property): Agreement on every restricted object character characterizes Ch_k.
- TauCeti.IntegralComodule.restrictionBaseChange (compatibility): The natural comodule isomorphism between restriction after base change and base change after integral restriction, with underlying identity on k⊗E.
- TauCeti.IntegralComodule.restrictionBaseChange_hom_tmul (simp): The forward comparison map sends a⊗v to the same a⊗v. This fixes the canonical map and implies naturality.

**Unit tests.**

- TauCeti.IntegralComodule.restrictedCharacter_zero_test (degenerate): The restricted character of zero is zero.
- TauCeti.IntegralComodule.restrictedCharacter_add_test (compatibility): The character of a sum of exact K₀ classes is the sum of the characters.
- TauCeti.IntegralComodule.restrictedCharacter_weight_test (computation): An object whose torus restriction is a weight-x line has restricted character [x].

**Sources.**

- Serre.1968, §3.5, p. 48 (restriction); §3.7, p. 51, the square involving restriction and decomposition. Expands the weight-by-weight argument and the two commuting diagrams in the published proof of Theorem 5. The specialization to ℤ retains the free coefficient-coalgebra hypothesis used by the preceding decomposition construction. The native comodule, corestriction and weight-space definitions are imported.

### Formal characters commute with decomposition

**KTheoryLowDegrees:Z.3/decomposition-character-compatibility** · theorem · implementation unchecked.

For each prime p, Ch_𝔽p∘d_p=Ch_ℚ as maps G₀(Cℚ)→ℤ[X]. This is an equality of integral formal characters, including their integer multiplicities.

**Hypotheses.**

- X is a commutative group, written multiplicatively; for GLₙ it is the character lattice ℤⁿ written multiplicatively. All representations are rational comodules over the indicated coordinate coalgebra. Formal characters lie in ℤ[X], not in the coefficient field and not in functions on rational points.
- C is a ℤ-coalgebra free over ℤ, and r:C→ℤ[X] is a coalgebra morphism. For a group scheme with a chosen split torus, r is the restriction morphism on coordinate coalgebras. No injectivity of the resulting character map is assumed.

**Construction or proof.**

- It suffices to compare the maps on finite rational comodule classes by ExactK0.hom_ext. Choose a stable finite free integral lattice L using integral-comodule-stable-lattice.
- The decomposition lattice formula gives d_p[V]=[𝔽p⊗L]. The restriction/base-change comparison identifies the torus restriction of each fibre with the corresponding fibre of the integral torus comodule obtained by corestricting L along r. Its underlying module is still finite free.
- Apply torus-character-basechange to both ℚ and 𝔽p. Their formal characters equal the same integral weight-rank sum. Transport along the chosen generic-fibre isomorphism, then extend equality to all K₀ classes. The independence of stable lattices was established in the decomposition-map node; no isomorphism of the reduced objects is asserted.

**Acceptance.**

- For C=ℤ[X] and r the identity, the coefficient fibre identifications give ch_𝔽p∘d_p=ch_ℚ, and one-dimensional weight classes keep their weight.
- At p=2 the equality still distinguishes weights 0 and 1 of G_m, even though all rational-point character values agree.

**Prerequisites.**

- KTheoryLowDegrees:Z.3/integral-comodule-stable-lattice
- KTheoryLowDegrees:Z.3/integral-comodule-decomposition-map
- KTheoryLowDegrees:Z.3/restriction-formal-character
- KTheoryLowDegrees:Z.3/torus-character-basechange
- tauceti:TauCeti.ExactK0.hom_ext

**Sources.**

- Serre.1968, §3.7, Theorem 5 proof, p. 51, identity (*) and the two commuting diagrams. Expands the weight-by-weight argument and the two commuting diagrams in the published proof of Theorem 5. The specialization to ℤ retains the free coefficient-coalgebra hypothesis used by the preceding decomposition construction. The native comodule, corestriction and weight-space definitions are imported.

### Decomposition isomorphism from a common character image

**KTheoryLowDegrees:Z.3/decomposition-isomorphism-from-characters** · theorem · implementation unchecked.

If Ch_ℚ and Ch_𝔽p are injective and have equal images in ℤ[X], then d_p is bijective. If these conditions hold for every prime p, the existing genericFibre map G₀(C)→G₀(Cℚ) is bijective, and its composition with the finite-free comparison gives the integral representation-group comparison.

**Hypotheses.**

- X is a commutative group, written multiplicatively; for GLₙ it is the character lattice ℤⁿ written multiplicatively. All representations are rational comodules over the indicated coordinate coalgebra. Formal characters lie in ℤ[X], not in the coefficient field and not in functions on rational points.
- C is a ℤ-coalgebra free over ℤ, and r:C→ℤ[X] is a coalgebra morphism. For a group scheme with a chosen split torus, r is the restriction morphism on coordinate coalgebras. No injectivity of the resulting character map is assumed.
- The injectivity and equality-of-image conditions are additional hypotheses. In Serre Theorem 5 the common image is ℤ[X]^W, supplied by the arbitrary-field theorem, not by the present conditional argument.

**Construction or proof.**

- For injectivity, d_p(a)=d_p(b) implies Ch_ℚ(a)=Ch_ℚ(b) by the preceding compatibility; use injectivity of Ch_ℚ.
- Given b in the residue group, equality of the two character images supplies a rational class a with Ch_ℚ(a)=Ch_𝔽p(b). Compatibility and injectivity of Ch_𝔽p imply d_p(a)=b. Merely knowing that both characters land in the invariants is insufficient.
- When this is available at every prime, apply integral-comodule-generic-isomorphism to their surjectivity and compose with k0Equiv. The unrestricted GL theorem still depends on coordinate freeness, exact K₀/character transport across the product coefficient square, and the arbitrary-field character theorem.

**Acceptance.**

- For a split torus the two field character maps are bijective onto all of ℤ[X] by torus-formal-character and the coefficient comparison, so the criterion applies.
- The criterion is not applied from coefficient freeness alone or from rational-point character values.

**Prerequisites.**

- KTheoryLowDegrees:Z.3/decomposition-character-compatibility
- KTheoryLowDegrees:Z.3/integral-comodule-generic-isomorphism
- KTheoryLowDegrees:Z.3/integral-comodule-k0-comparison

**Sources.**

- Serre.1968, §3.7, Theorem 5 proof, p. 51, deduction from the field character isomorphisms and §2.7 Theorem 3. Expands the weight-by-weight argument and the two commuting diagrams in the published proof of Theorem 5. The specialization to ℤ retains the free coefficient-coalgebra hypothesis used by the preceding decomposition construction. The native comodule, corestriction and weight-space definitions are imported.

### Coefficient algebra of a product of general linear groups

**KTheoryLowDegrees:Z.3/gl-product-coordinate-algebra** · definition · implementation unchecked.

Use the existing H_R([])=R and H_R(n::Ns)=O_R(GLₙ)⊗_R H_R(Ns), with the native tensor-product Hopf structure. Promote this previously internal glCoordinate helper to a declaration node because the coefficient comparisons consume it. For a singleton the right-unit bialgebra equivalence identifies H_R([n]) with the pinned O_R(GLₙ).

**Hypotheses.**

- R and K are commutative rings with a specified R-algebra structure on K whenever base change occurs. No field, flatness, nontriviality or positive-rank assumption is imposed.
- Ns is a finite list of natural numbers, allowing the empty list and zero entries. H_R(Ns) denotes the existing iterated tensor product glCoordinate R Ns. X(Ns) is the existing character lattice ⨁ᵢ ℤ^{Nsᵢ}, indexed by the sigma type of factor and coordinate indices; write ℤ[X] with this additive lattice viewed multiplicatively.

**Construction or proof.**

- Retain the existing glCoordinate definition verbatim. Each factor is the bundled coordinateHopfAlgebra, whose selected coalgebra is matrix multiplication, not the group-like structure of a polynomial monoid algebra.
- The empty product has coordinate algebra R. Recursively apply the native tensor-product Hopf structure. The right unit equivalence gives the singleton comparison x⊗r↦rx.
- The zero-rank factor is R: its matrix-variable type is empty and its determinant is 1, so the polynomial algebra and localization both reduce to R. Do not replace tensor products of coordinate algebras by Cartesian products of rings.

**Acceptance.**

- The suggested definition is the inherited one; the new node gives its API and tests. Zero-rank factors and the empty product are included without changing the existing list convention.

**Prerequisites.**

- tauceti:TauCeti.GeneralLinear.coordinateHopfAlgebra
- mathlib:Bialgebra.TensorProduct.rid

**Uses.**

- KTheoryLowDegrees:Z.3/gl-product-restriction-basechange: Identifies the actual coefficient maps in the restriction/base-change square used by Serre §3.7.
- KTheoryLowDegrees:Z.3/representation-ring-of-gl: Uses the existing list of GL factors and sigma-indexed character lattice to define restriction and coefficient transport without a second representation carrier.
- KTheoryLowDegrees:Z.3/serre-representation-ring-theorem: Provides coefficient identifications needed to apply the generic decomposition-character comparison; the integral freeness and field character-image hypotheses are separate.

**Public API.**

- TauCeti.RepresentationRing.glCoordinate_nil (simp): The empty list gives the unit Hopf algebra R.
- TauCeti.RepresentationRing.glCoordinate_cons (simp): Adding a head n gives O_R(GLₙ)⊗_R H_R(Ns), with the existing tensor Hopf structure.
- TauCeti.RepresentationRing.glCoordinate_singleton (equivalence): The singleton comparison is the native right-unit bialgebra equivalence, x⊗r↦rx.

**Unit tests.**

- TauCeti.RepresentationRing.glCoordinate_empty_test (computation): In H_ℤ([]), 2·3=6.
- TauCeti.RepresentationRing.glCoordinate_zero_rank_test (degenerate): H_R([0]) is bialgebra-isomorphic to R.
- TauCeti.RepresentationRing.glCoordinate_singleton_test (compatibility): The singleton comparison sends x⊗1 to the same x in the pinned GL coefficient algebra.

**Sources.**

- Serre.1968, §3.7, p. 51, coefficient identifications and the first commuting diagram; §3.8, p. 52, GL example. Expands the coordinate-model comparison used in the proof of Theorem 5 for a finite product of GL factors. This is a planning specialization: the source does not give these list-indexed declarations. The pinned single-factor GL and diagonal-torus constructions, bialgebra tensor product, and monoid-algebra base-change equivalence are reused. No arbitrary-field character classification or integral freeness follows from these comparisons.

### Inclusion of a general linear coefficient factor

**KTheoryLowDegrees:Z.3/gl-product-factor-inclusion** · construction · implementation unchecked.

For each factor index i define ι_i:O_R(GL_{Nsᵢ})→H_R(Ns), inserting the supplied coefficient into slot i and units into all other slots. It is a bialgebra map and is injective. The counits of the other factors give a left inverse.

**Hypotheses.**

- R and K are commutative rings with a specified R-algebra structure on K whenever base change occurs. No field, flatness, nontriviality or positive-rank assumption is imposed.
- Ns is a finite list of natural numbers, allowing the empty list and zero entries. H_R(Ns) denotes the existing iterated tensor product glCoordinate R Ns. X(Ns) is the existing character lattice ⨁ᵢ ℤ^{Nsᵢ}, indexed by the sigma type of factor and coordinate indices; write ℤ[X] with this additive lattice viewed multiplicatively.

**Construction or proof.**

- Use the native bialgebra includeLeft for the head. For a tail index, compose its recursively constructed inclusion with includeRight. This uses the original list index, so repeated ranks do not identify distinct factors.
- On an elementary tensor, the map has the chosen element in its specified slot. The bialgebra laws follow from native composition and the tensor inclusions.
- Construct a left inverse by recursively applying projectLeft or projectRight and the relevant factor counits. The native projection/inclusion identities prove the left-inverse identity and hence injectivity. This argument is valid over the zero ring too.

**Acceptance.**

- The test with two GL₁ factors distinguishes their generic entries over ℤ; the scalar test confirms that common scalars are identified in the tensor product.

**Prerequisites.**

- KTheoryLowDegrees:Z.3/gl-product-coordinate-algebra
- tauceti:TauCeti.Bialgebra.TensorProduct.includeLeft
- tauceti:TauCeti.Bialgebra.TensorProduct.includeRight
- tauceti:TauCeti.Bialgebra.TensorProduct.projectLeft_comp_includeLeft
- tauceti:TauCeti.Bialgebra.TensorProduct.projectRight_comp_includeRight

**Uses.**

- KTheoryLowDegrees:Z.3/gl-product-restriction-basechange: Identifies the actual coefficient maps in the restriction/base-change square used by Serre §3.7.
- KTheoryLowDegrees:Z.3/representation-ring-of-gl: Uses the existing list of GL factors and sigma-indexed character lattice to define restriction and coefficient transport without a second representation carrier.
- KTheoryLowDegrees:Z.3/serre-representation-ring-theorem: Provides coefficient identifications needed to apply the generic decomposition-character comparison; the integral freeness and field character-image hypotheses are separate.

**Public API.**

- TauCeti.RepresentationRing.glFactor (constructor): The bialgebra inclusion of the factor at index i.
- TauCeti.RepresentationRing.glFactor_head (simp): For n::Ns, the head inclusion is x↦x⊗1.
- TauCeti.RepresentationRing.glFactor_tail (simp): For n::Ns, the successor-index inclusion is x↦1⊗ι_i(x).
- TauCeti.RepresentationRing.glFactor_injective (characterisation): Each factor inclusion is injective, with the other-factor counits furnishing a left inverse.

**Unit tests.**

- TauCeti.RepresentationRing.glFactor_singleton_test (compatibility): For a singleton, the factor inclusion followed by glCoordinate_singleton is the identity.
- TauCeti.RepresentationRing.glFactor_scalar_test (computation): The second inclusion for [1,1] sends the integral scalar 3 to 3.
- TauCeti.RepresentationRing.glFactor_distinct_test (non-example): The generic GL₁ entry in the first slot differs from that in the second slot over ℤ. Evaluate the two coordinates at independent Laurent variables to detect the difference.

**Sources.**

- Serre.1968, §3.7, p. 51, coefficient identifications and the first commuting diagram; §3.8, p. 52, GL example. Expands the coordinate-model comparison used in the proof of Theorem 5 for a finite product of GL factors. This is a planning specialization: the source does not give these list-indexed declarations. The pinned single-factor GL and diagonal-torus constructions, bialgebra tensor product, and monoid-algebra base-change equivalence are reused. No arbitrary-field character classification or integral freeness follows from these comparisons.

### Generic entries determine a product coordinate map

**KTheoryLowDegrees:Z.3/gl-product-coordinate-ext** · lemma · implementation unchecked.

Two R-algebra maps from H_R(Ns) to a commutative R-algebra A are equal if they agree on every ι_i(X_ab), where X_ab is the native generic entry of the i-th GL factor. There is no separate condition on inverse determinants.

**Hypotheses.**

- R and K are commutative rings with a specified R-algebra structure on K whenever base change occurs. No field, flatness, nontriviality or positive-rank assumption is imposed.
- Ns is a finite list of natural numbers, allowing the empty list and zero entries. H_R(Ns) denotes the existing iterated tensor product glCoordinate R Ns. X(Ns) is the existing character lattice ⨁ᵢ ℤ^{Nsᵢ}, indexed by the sigma type of factor and coordinate indices; write ℤ[X] with this additive lattice viewed multiplicatively.

**Construction or proof.**

- For one GL factor apply the pinned coordinateHopfAlgebra_algHom_ext. An algebra map must send an inverse determinant to the inverse of the determinant image, so generic entries suffice.
- Induct on the list. Agreement on the head entries identifies the restrictions to the first tensor factor; agreement on the remaining entries and induction identify the restrictions to the second factor. The universal property of the tensor product identifies the maps.
- For the empty list, an R-algebra map out of R is uniquely determined by scalars. A zero-rank factor has no generic entries and its coefficient algebra is likewise scalar, so the induction includes it.

**Acceptance.**

- Use this node as the extensionality input for the product restriction square. The hypothesis concerns algebra maps; plain linear maps are not determined by the finitely many generic entries.

**Prerequisites.**

- KTheoryLowDegrees:Z.3/gl-product-coordinate-algebra
- KTheoryLowDegrees:Z.3/gl-product-factor-inclusion
- tauceti:TauCeti.GeneralLinear.coordinateHopfAlgebra_algHom_ext

**Sources.**

- Serre.1968, §3.7, p. 51, coefficient identifications and the first commuting diagram; §3.8, p. 52, GL example. Expands the coordinate-model comparison used in the proof of Theorem 5 for a finite product of GL factors. This is a planning specialization: the source does not give these list-indexed declarations. The pinned single-factor GL and diagonal-torus constructions, bialgebra tensor product, and monoid-algebra base-change equivalence are reused. No arbitrary-field character classification or integral freeness follows from these comparisons.

### Base change of general linear product coefficients

**KTheoryLowDegrees:Z.3/gl-product-coefficient-basechange** · construction · implementation unchecked.

Construct a canonical K-bialgebra equivalence β_Ns:K⊗_R H_R(Ns)≃H_K(Ns) by distributing base change over the recursive tensor product and applying the pinned single-factor GL equivalence. In the empty case β(a⊗r)=a·r. In a successor case β(a⊗(x⊗y))=β_n(a⊗x)⊗β_Ns(1⊗y).

**Hypotheses.**

- R and K are commutative rings with a specified R-algebra structure on K whenever base change occurs. No field, flatness, nontriviality or positive-rank assumption is imposed.
- Ns is a finite list of natural numbers, allowing the empty list and zero entries. H_R(Ns) denotes the existing iterated tensor product glCoordinate R Ns. X(Ns) is the existing character lattice ⨁ᵢ ℤ^{Nsᵢ}, indexed by the sigma type of factor and coordinate indices; write ℤ[X] with this additive lattice viewed multiplicatively.

**Construction or proof.**

- The empty-list map is the native right-unit bialgebra equivalence K⊗_R R≃K.
- For n::Ns first use native baseChangeTensorBialgEquiv to obtain (K⊗_R O_R(GLₙ))⊗_K(K⊗_R H_R(Ns)). Apply coordinateHopfAlgebraBaseChangeBialgEquiv on the first factor and the induction equivalence on the second. Tensor their forward and inverse bialgebra maps; pure tensors prove both inverse identities.
- The native pure-tensor formula places a in the first factor. For the inverse, two scalar coefficients multiply: β⁻¹(β_n(a⊗x)⊗β_Ns(b⊗y))=ab⊗(x⊗y). The tensor balancing relation ensures this also represents placement of a in any other factor.

**Acceptance.**

- This is a bialgebra equivalence between the actual bundled models, not only a ring equivalence. It applies to ℤ→𝔽p, despite that scalar map being nonflat. It does not prove the integral coefficient module free.

**Prerequisites.**

- KTheoryLowDegrees:Z.3/gl-product-coordinate-algebra
- tauceti:TauCeti.GeneralLinear.coordinateHopfAlgebraBaseChangeBialgEquiv
- tauceti:TauCeti.Bialgebra.TensorProduct.baseChangeTensorBialgEquiv
- mathlib:Bialgebra.TensorProduct.map
- mathlib:Bialgebra.TensorProduct.rid

**Uses.**

- KTheoryLowDegrees:Z.3/gl-product-restriction-basechange: Identifies the actual coefficient maps in the restriction/base-change square used by Serre §3.7.
- KTheoryLowDegrees:Z.3/representation-ring-of-gl: Uses the existing list of GL factors and sigma-indexed character lattice to define restriction and coefficient transport without a second representation carrier.
- KTheoryLowDegrees:Z.3/serre-representation-ring-theorem: Provides coefficient identifications needed to apply the generic decomposition-character comparison; the integral freeness and field character-image hypotheses are separate.

**Public API.**

- TauCeti.RepresentationRing.glCoefficientBaseChange (equivalence): The recursive K-bialgebra equivalence β_Ns.
- TauCeti.RepresentationRing.glCoefficientBaseChange_nil (simp): In the empty case a⊗r maps to a times the image of r.
- TauCeti.RepresentationRing.glCoefficientBaseChange_cons (simp): On a⊗(x⊗y), use the single-factor comparison on a⊗x and the tail comparison on 1⊗y.
- TauCeti.RepresentationRing.glCoefficientBaseChange_symm_cons (simp): The inverse map multiplies the two new-base scalars a and b.

**Unit tests.**

- TauCeti.RepresentationRing.glCoefficientBaseChange_empty_test (computation): β for ℤ→ℚ and the empty list sends 2⊗3 to 6.
- TauCeti.RepresentationRing.glCoefficientBaseChange_nonflat_test (non-example): For ℤ→𝔽₂, β sends 1⊗2x to zero for every list and coefficient x; no injectivity of integral reduction is asserted.
- TauCeti.RepresentationRing.glCoefficientBaseChange_two_factors_test (computation): For [1,1] over ℚ, the inverse of β sends the tensor of images with scalar coefficients 2 and 3 to 6⊗(x⊗y), not to 2⊗(x⊗y) or 3⊗(x⊗y).

**Sources.**

- Serre.1968, §3.7, p. 51, coefficient identifications and the first commuting diagram; §3.8, p. 52, GL example. Expands the coordinate-model comparison used in the proof of Theorem 5 for a finite product of GL factors. This is a planning specialization: the source does not give these list-indexed declarations. The pinned single-factor GL and diagonal-torus constructions, bialgebra tensor product, and monoid-algebra base-change equivalence are reused. No arbitrary-field character classification or integral freeness follows from these comparisons.

### Base change respects each coefficient factor

**KTheoryLowDegrees:Z.3/gl-product-basechange-factor** · lemma · implementation unchecked.

For every factor i, scalar a∈K and coefficient x∈O_R(GL_{Nsᵢ}), β_Ns(a⊗ι_i(x))=ι_i(β_{Nsᵢ}(a⊗x)), where the right-hand β is the pinned single-factor GL equivalence.

**Hypotheses.**

- R and K are commutative rings with a specified R-algebra structure on K whenever base change occurs. No field, flatness, nontriviality or positive-rank assumption is imposed.
- Ns is a finite list of natural numbers, allowing the empty list and zero entries. H_R(Ns) denotes the existing iterated tensor product glCoordinate R Ns. X(Ns) is the existing character lattice ⨁ᵢ ℤ^{Nsᵢ}, indexed by the sigma type of factor and coordinate indices; write ℤ[X] with this additive lattice viewed multiplicatively.

**Construction or proof.**

- Induct on Ns and split the factor index into the head or a successor. Expand the recursive definitions of β and ι, using the native tensor/base-change formula.
- In the head case all tail factors are units and stay units. In the successor case tensor balancing moves the scalar into the tail and the induction hypothesis applies. No freeness or exactness argument is involved.

**Acceptance.**

- This consumed factor-compatibility statement is a separate node. Specializing x to a generic entry gives the entry identity used in the restriction square.

**Prerequisites.**

- KTheoryLowDegrees:Z.3/gl-product-factor-inclusion
- KTheoryLowDegrees:Z.3/gl-product-coefficient-basechange
- tauceti:TauCeti.Bialgebra.TensorProduct.baseChangeTensorBialgEquiv_tmul
- tauceti:TauCeti.GeneralLinear.coordinateHopfAlgebraBaseChangeBialgEquiv_one_tmul_X

**Sources.**

- Serre.1968, §3.7, p. 51, coefficient identifications and the first commuting diagram; §3.8, p. 52, GL example. Expands the coordinate-model comparison used in the proof of Theorem 5 for a finite product of GL factors. This is a planning specialization: the source does not give these list-indexed declarations. The pinned single-factor GL and diagonal-torus constructions, bialgebra tensor product, and monoid-algebra base-change equivalence are reused. No arbitrary-field character classification or integral freeness follows from these comparisons.

### Diagonal restriction for a product of general linear groups

**KTheoryLowDegrees:Z.3/gl-product-diagonal-restriction** · construction · implementation unchecked.

Construct the bialgebra map r_R:H_R(Ns)→R[X(Ns)] induced by the product diagonal torus. For factor i, compose the pinned diagonalTorusCoordinateMap with the monoid-algebra map induced by the inclusion of its character lattice into the i-th block of X(Ns). Multiply these factor images through the tensor-product universal property. The empty-product map sends r to r[0].

**Hypotheses.**

- R and K are commutative rings with a specified R-algebra structure on K whenever base change occurs. No field, flatness, nontriviality or positive-rank assumption is imposed.
- Ns is a finite list of natural numbers, allowing the empty list and zero entries. H_R(Ns) denotes the existing iterated tensor product glCoordinate R Ns. X(Ns) is the existing character lattice ⨁ᵢ ℤ^{Nsᵢ}, indexed by the sigma type of factor and coordinate indices; write ℤ[X] with this additive lattice viewed multiplicatively.

**Construction or proof.**

- For a single factor use the pinned diagonalTorusCoordinateMap, preserving its coordinate convention. Remove its ULift index by the canonical equivalence and embed its finitely supported exponent vector in the sigma-indexed block i. The existing mapDomainBialgHom supplies the induced character-algebra map.
- Combine the factor maps recursively with the native tensor map followed by mulBialgHom of the commutative target bialgebra. The empty case is its scalar unit map. Thus counit and comultiplication are preserved by construction.
- The inverse determinant is the inverse of the diagonal determinant: its character is minus the sum of the basis weights of the factor, with coefficient 1. For rank zero the sum is zero and the image is 1. This pins Laurent, rather than polynomial, coordinates.

**Acceptance.**

- The target uses the original character lattice of representation-ring-of-gl. All factor indices, including factors of equal rank, remain distinct. No replacement torus or comodule carrier is introduced.

**Prerequisites.**

- KTheoryLowDegrees:Z.3/gl-product-coordinate-algebra
- KTheoryLowDegrees:Z.3/gl-product-factor-inclusion
- tauceti:TauCeti.GeneralLinear.diagonalTorusCoordinateMap
- mathlib:MonoidAlgebra.mapDomainBialgHom
- mathlib:Bialgebra.TensorProduct.map
- mathlib:Bialgebra.mulBialgHom

**Uses.**

- KTheoryLowDegrees:Z.3/gl-product-restriction-basechange: Identifies the actual coefficient maps in the restriction/base-change square used by Serre §3.7.
- KTheoryLowDegrees:Z.3/representation-ring-of-gl: Uses the existing list of GL factors and sigma-indexed character lattice to define restriction and coefficient transport without a second representation carrier.
- KTheoryLowDegrees:Z.3/serre-representation-ring-theorem: Provides coefficient identifications needed to apply the generic decomposition-character comparison; the integral freeness and field character-image hypotheses are separate.

**Public API.**

- TauCeti.RepresentationRing.glDiagonal (constructor): The bialgebra map for diagonal restriction into the original character lattice.
- TauCeti.RepresentationRing.glDiagonal_nil (simp): For the empty list, r maps to the single coefficient r at weight zero.
- TauCeti.RepresentationRing.glDiagonal_counit (compatibility): The target counit composed with r_R is the source counit.
- TauCeti.RepresentationRing.glDiagonal_det_inv (simp): The inverse determinant of factor i maps to the monomial with exponent minus the sum of its coordinate weights and coefficient 1.

**Unit tests.**

- TauCeti.RepresentationRing.glDiagonal_empty_test (degenerate): For the empty list over ℤ, 3 maps to 3[0].
- TauCeti.RepresentationRing.glDiagonal_off_diagonal_test (computation): For GL₂ over ℤ, the image of the (0,1) generic entry is zero.
- TauCeti.RepresentationRing.glDiagonal_factor_distinction_test (non-example): For GL₁×GL₁ over ℤ, the two diagonal entries have unequal images: their distinct block weights must not be collapsed.

**Sources.**

- Serre.1968, §3.7, p. 51, coefficient identifications and the first commuting diagram; §3.8, p. 52, GL example. Expands the coordinate-model comparison used in the proof of Theorem 5 for a finite product of GL factors. This is a planning specialization: the source does not give these list-indexed declarations. The pinned single-factor GL and diagonal-torus constructions, bialgebra tensor product, and monoid-algebra base-change equivalence are reused. No arbitrary-field character classification or integral freeness follows from these comparisons.

### Diagonal restriction on a factor entry

**KTheoryLowDegrees:Z.3/gl-product-diagonal-entry** · lemma · implementation unchecked.

The product diagonal map sends ι_i(X_ab) to the basis monomial [e_{i,a}] if a=b, and to zero if a≠b. Its coefficient is 1 in the base ring. Here e_{i,a} is the original sigma-indexed basis exponent.

**Hypotheses.**

- R and K are commutative rings with a specified R-algebra structure on K whenever base change occurs. No field, flatness, nontriviality or positive-rank assumption is imposed.
- Ns is a finite list of natural numbers, allowing the empty list and zero entries. H_R(Ns) denotes the existing iterated tensor product glCoordinate R Ns. X(Ns) is the existing character lattice ⨁ᵢ ℤ^{Nsᵢ}, indexed by the sigma type of factor and coordinate indices; write ℤ[X] with this additive lattice viewed multiplicatively.

**Construction or proof.**

- Restrict the tensor-product construction of r_R to the i-th factor; all other factor units map to units.
- Apply the pinned diagonalTorusCoordinateMap_X. The pinned mapDomainBialgHom_single sends the ULift-indexed basis exponent to the sigma-indexed exponent e_{i,a}. It preserves the coefficient and sends zero to zero.

**Acceptance.**

- Promoted to its own lemma node because the restriction/base-change proof consumes it. The formula includes off-diagonal vanishing and the sign convention for positive coordinate weights.

**Prerequisites.**

- KTheoryLowDegrees:Z.3/gl-product-factor-inclusion
- KTheoryLowDegrees:Z.3/gl-product-diagonal-restriction
- tauceti:TauCeti.GeneralLinear.diagonalTorusCoordinateMap_X
- mathlib:MonoidAlgebra.mapDomainBialgHom_single

**Sources.**

- Serre.1968, §3.7, p. 51, coefficient identifications and the first commuting diagram; §3.8, p. 52, GL example. Expands the coordinate-model comparison used in the proof of Theorem 5 for a finite product of GL factors. This is a planning specialization: the source does not give these list-indexed declarations. The pinned single-factor GL and diagonal-torus constructions, bialgebra tensor product, and monoid-algebra base-change equivalence are reused. No arbitrary-field character classification or integral freeness follows from these comparisons.

### The product diagonal square under base change

**KTheoryLowDegrees:Z.3/gl-product-restriction-basechange** · lemma · implementation unchecked.

The two K-bialgebra maps from K⊗_R H_R(Ns) to K[X(Ns)] agree: r_K∘β_Ns = α_X∘(id_K⊗r_R), where α_X is the pinned scalarTensorBialgEquiv. Thus the original product GL coefficients and the original diagonal restriction identify compatibly over ℚ and every 𝔽p.

**Hypotheses.**

- R and K are commutative rings with a specified R-algebra structure on K whenever base change occurs. No field, flatness, nontriviality or positive-rank assumption is imposed.
- Ns is a finite list of natural numbers, allowing the empty list and zero entries. H_R(Ns) denotes the existing iterated tensor product glCoordinate R Ns. X(Ns) is the existing character lattice ⨁ᵢ ℤ^{Nsᵢ}, indexed by the sigma type of factor and coordinate indices; write ℤ[X] with this additive lattice viewed multiplicatively.

**Construction or proof.**

- Use tensor-product extensionality to reduce to the restriction on 1⊗H_R(Ns); the maps already agree on K-scalars. Apply gl-product-coordinate-ext to the resulting R-algebra maps.
- For 1⊗ι_i(X_ab), gl-product-basechange-factor and the native single-factor entry formula transport X_ab to the same generic entry over K. Apply gl-product-diagonal-entry on both sides. Native scalarTensorBialgEquiv sends the same basis monomial with coefficient 1 to itself and sends zero to zero.
- Consequently both maps agree on every factor entry, hence everywhere. This agrees with the pinned single-factor diagonalTorusCoordinateMap_baseChange and uses its same character group. Corestriction therefore gives compatible coactions after coefficient transport; packaging the direct-model exact K₀ and formal-character comparison is a separate remaining task.

**Acceptance.**

- Assert equality of bialgebra maps, not equality only on rational points. The square applies to nonflat scalar extensions and does not imply the source module is free or the formal-character image is the Weyl invariants.

**Prerequisites.**

- KTheoryLowDegrees:Z.3/gl-product-coordinate-ext
- KTheoryLowDegrees:Z.3/gl-product-basechange-factor
- KTheoryLowDegrees:Z.3/gl-product-diagonal-entry
- tauceti:TauCeti.GeneralLinear.diagonalTorusCoordinateMap_baseChange
- tauceti:TauCeti.MonoidAlgebra.scalarTensorBialgEquiv
- tauceti:TauCeti.MonoidAlgebra.scalarTensorBialgEquiv_tmul

**Sources.**

- Serre.1968, §3.7, p. 51, coefficient identifications and the first commuting diagram; §3.8, p. 52, GL example. Expands the coordinate-model comparison used in the proof of Theorem 5 for a finite product of GL factors. This is a planning specialization: the source does not give these list-indexed declarations. The pinned single-factor GL and diagonal-torus constructions, bialgebra tensor product, and monoid-algebra base-change equivalence are reused. No arbitrary-field character classification or integral freeness follows from these comparisons.

### Graded line bundles

**KTheoryLowDegrees:Z.3/graded-line-groupoid** · definition · implementation unchecked.

Pic^Z(X) has objects (L,f), L an invertible O_X-module and f:X→ℤ locally constant. A morphism (L,f)→(M,g) consists of equality f=g and an O_X-linear isomorphism L≅M. Composition is composition of sheaf isomorphisms with transported grade equality. It is a groupoid, not the set Pic(X)×H⁰(X,ℤ).

**Hypotheses.**

- All schemes and categories are in fixed universes. R denotes a commutative unital ring; X is a scheme. A perfect F_p-scheme in the Witt-support results is qcqs, as in BS17 §1. Constructions on all schemes are distinguished from K(X), whose determinant statement assumes X qcqs.

**Construction or proof.**

- Use the existing invertible-sheaf category and its maximal subgroupoid; pair each object with a native locally constant integer function.
- Define the hom set by grade equality and sheaf isomorphism, with identity and composition inherited. A grade equality has no extra automorphisms; every morphism is invertible.

**Acceptance.**

- Over Spec ℚ the object (O,0) has automorphism −1, although its isomorphism class is one point.

**Prerequisites.**

- tauceti:TauCetiRoadmap/JacobianChallenge#layer-a-line-bundles-divisors-picard-group-degree
- mathlib:CategoryTheory.Core
- mathlib:LocallyConstant

**Uses.**

- Bhatt–Scholze §5 and §12: The signed determinant must retain automorphisms and coherent sums before spectrum group completion and geometric descent.
- KTheoryLowDegrees:Z.3/determinant-hom; KTheoryLowDegrees:U.3 and U.6: Components recover rank and determinant; loops recover the determinant on units without asserting SK₁ vanishes globally.

**Public API.**

- TauCeti.GradedDeterminant.graded_line_groupoid_mk (constructor): Construct (L,f) from an invertible sheaf and a locally constant grade.
- TauCeti.GradedDeterminant.graded_line_groupoid_line (projection): The underlying line of (L,f) is L.
- TauCeti.GradedDeterminant.graded_line_groupoid_grade (projection): The grade of (L,f) is f.
- TauCeti.GradedDeterminant.graded_line_groupoid_hom (characterisation): Hom((L,f),(M,g)) is empty unless f=g, and then is Isom(L,M).
- TauCeti.GradedDeterminant.graded_line_groupoid_iso_ext (extensionality): Two morphisms agree exactly when their sheaf isomorphisms agree after the unique grade transport.

**Unit tests.**

- TauCeti.GradedDeterminant.graded_line_groupoid_point (computation): Over Spec ℚ, (O,1) is a graded line.
- TauCeti.GradedDeterminant.graded_line_groupoid_empty (degenerate): Over the empty scheme the groupoid is contractible.
- TauCeti.GradedDeterminant.graded_line_groupoid_unequal (non-example): Over Spec ℚ there is no isomorphism (O,0)≅(O,1).
- TauCeti.GradedDeterminant.graded_line_groupoid_automorphism (compatibility): Aut((O,0)) over Spec ℚ is ℚˣ, not the trivial group.

**Sources.**

- BS17.v3, Construction 5.1 p.18; Example 12.2(iii) p.55. Source construction or consequence at this locator, retaining morphisms, signs and coherence; proof refinements are named as requested interfaces or recorded gaps.

### Koszul sign on integer grades

**KTheoryLowDegrees:Z.3/koszul-sign** · definition · implementation unchecked.

For integers a,b and a commutative ring R set ε_R(a,b)=1 in Rˣ if ab is even, and ε_R(a,b)=−1 otherwise. This defines (−1)^{ab} without a negative natural exponent. Evaluate pointwise on locally constant grades.

**Hypotheses.**

- All schemes and categories are in fixed universes. R denotes a commutative unital ring; X is a scheme. A perfect F_p-scheme in the Witt-support results is qcqs, as in BS17 §1. Constructions on all schemes are distinguished from K(X), whose determinant statement assumes X qcqs.

**Construction or proof.**

- The parity map ℤ→ℤ/2 sends ab to the product of the parity classes. Lift its two values to the units 1 and −1.
- Products of locally constant functions are locally constant; composition with this discrete two-valued function gives the sign section.

**Acceptance.**

- Negative grades obey the same parity rule; zero-ring and characteristic-two signs may coincide.

**Prerequisites.**

- mathlib:LocallyConstant

**Uses.**

- Bhatt–Scholze §5 and §12: The signed determinant must retain automorphisms and coherent sums before spectrum group completion and geometric descent.
- KTheoryLowDegrees:Z.3/determinant-hom; KTheoryLowDegrees:U.3 and U.6: Components recover rank and determinant; loops recover the determinant on units without asserting SK₁ vanishes globally.

**Public API.**

- TauCeti.GradedDeterminant.koszul_sign_zero_left (simp): ε_R(0,b)=1.
- TauCeti.GradedDeterminant.koszul_sign_zero_right (simp): ε_R(a,0)=1.
- TauCeti.GradedDeterminant.koszul_sign_comm (compatibility): ε_R(a,b)=ε_R(b,a).
- TauCeti.GradedDeterminant.koszul_sign_add_left (compatibility): ε_R(a+b,c)=ε_R(a,c)ε_R(b,c).
- TauCeti.GradedDeterminant.koszul_sign_add_right (compatibility): ε_R(a,b+c)=ε_R(a,b)ε_R(a,c).
- TauCeti.GradedDeterminant.koszul_sign_base_change (functoriality): A ring homomorphism maps ε_R(a,b) to ε_S(a,b).

**Unit tests.**

- TauCeti.GradedDeterminant.koszul_sign_odd (computation): ε_ℤ(1,1)=−1.
- TauCeti.GradedDeterminant.koszul_sign_zero (degenerate): ε_ℤ(0,−3)=1.
- TauCeti.GradedDeterminant.koszul_sign_negative (computation): ε_ℤ(−1,1)=−1.
- TauCeti.GradedDeterminant.koszul_sign_char_two (compatibility): ε_{𝔽₂}(1,1)=1.

**Sources.**

- BS17.v3, Construction 5.1 p.18; Example 12.2(iii) p.55. Source construction or consequence at this locator, retaining morphisms, signs and coherence; proof refinements are named as requested interfaces or recorded gaps.

### Tensor product of graded lines

**KTheoryLowDegrees:Z.3/graded-line-tensor** · construction · implementation unchecked.

Define (L,f)⊗(M,g)=(L⊗M,f+g), with unit (O_X,0), ordinary line-bundle associator and unit constraints. The braiding is ε(f,g) times the ordinary swap.

**Hypotheses.**

- All schemes and categories are in fixed universes. R denotes a commutative unital ring; X is a scheme. A perfect F_p-scheme in the Witt-support results is qcqs, as in BS17 §1. Constructions on all schemes are distinguished from K(X), whose determinant statement assumes X qcqs.

**Construction or proof.**

- Tensor invertible sheaves and add grades; tensor morphisms through the sheaf tensor functor.
- Keep the ordinary associator and unit constraints. The bilinearity of ε supplies both hexagons, and ε(f,g)ε(g,f)=1 supplies symmetry.

**Acceptance.**

- A symmetric braiding squares to identity; this does not require its self-braiding to be identity.

**Prerequisites.**

- KTheoryLowDegrees:Z.3/graded-line-groupoid
- KTheoryLowDegrees:Z.3/koszul-sign
- tauceti:TauCetiRoadmap/JacobianChallenge#layer-a-line-bundles-divisors-picard-group-degree
- mathlib:CategoryTheory.SymmetricCategory

**Uses.**

- Bhatt–Scholze §5 and §12: The signed determinant must retain automorphisms and coherent sums before spectrum group completion and geometric descent.
- KTheoryLowDegrees:Z.3/determinant-hom; KTheoryLowDegrees:U.3 and U.6: Components recover rank and determinant; loops recover the determinant on units without asserting SK₁ vanishes globally.

**Public API.**

- TauCeti.GradedDeterminant.graded_line_tensor_object (characterisation): The tensor object is (L⊗M,f+g).
- TauCeti.GradedDeterminant.graded_line_tensor_unit (constructor): The unit is (O_X,0).
- TauCeti.GradedDeterminant.graded_line_tensor_hom (functoriality): Tensor isomorphisms tensor their underlying sheaf maps.
- TauCeti.GradedDeterminant.graded_line_tensor_braiding (data): On local pure tensors, β(l⊗m)=ε(f,g)m⊗l.
- TauCeti.GradedDeterminant.graded_line_tensor_symmetry (compatibility): β_{B,A}β_{A,B}=id.
- TauCeti.GradedDeterminant.graded_line_tensor_pullback (compatibility): Pullback commutes with the tensor object and signed braiding.

**Unit tests.**

- TauCeti.GradedDeterminant.graded_line_tensor_odd_swap (non-example): On (O,1)⊗(O,1) over Spec ℚ, self-braiding is −id.
- TauCeti.GradedDeterminant.graded_line_tensor_zero_grade (compatibility): In grade zero the ordinary line-bundle tensor and braiding are recovered.
- TauCeti.GradedDeterminant.graded_line_tensor_unit_test (degenerate): Tensoring with (O,0) preserves the object and unit constraint.
- TauCeti.GradedDeterminant.graded_line_tensor_mixed (computation): Grades 1 and 2 exchange with sign +1.

**Sources.**

- BS17.v3, Construction 5.1 p.18; Example 12.2(iii) p.55. Source construction or consequence at this locator, retaining morphisms, signs and coherence; proof refinements are named as requested interfaces or recorded gaps.

### Dual of a graded line

**KTheoryLowDegrees:Z.3/graded-line-inverse** · construction · implementation unchecked.

The inverse of (L,f) is (L^∨,−f). Evaluation and coevaluation identify its tensor product with (O_X,0), with order-specific signed symmetry retained. Thus Pic^Z(X) is a Picard groupoid.

**Hypotheses.**

- All schemes and categories are in fixed universes. R denotes a commutative unital ring; X is a scheme. A perfect F_p-scheme in the Witt-support results is qcqs, as in BS17 §1. Constructions on all schemes are distinguished from K(X), whose determinant statement assumes X qcqs.

**Construction or proof.**

- Import the sheaf dual and invertible-line evaluation isomorphism. Tensor with the opposite integer grade.
- Use ordinary evaluation in one fixed order; transport to the other order through the signed braiding rather than identifying both evaluations silently.

**Acceptance.**

- Negation applies to the grade as well as dualization to the line.

**Prerequisites.**

- KTheoryLowDegrees:Z.3/graded-line-tensor
- tauceti:TauCetiRoadmap/JacobianChallenge#layer-a-line-bundles-divisors-picard-group-degree

**Uses.**

- Bhatt–Scholze §5 and §12: The signed determinant must retain automorphisms and coherent sums before spectrum group completion and geometric descent.
- KTheoryLowDegrees:Z.3/determinant-hom; KTheoryLowDegrees:U.3 and U.6: Components recover rank and determinant; loops recover the determinant on units without asserting SK₁ vanishes globally.

**Public API.**

- TauCeti.GradedDeterminant.graded_line_inverse_object (characterisation): inv(L,f)=(L^∨,−f).
- TauCeti.GradedDeterminant.graded_line_inverse_eval (equivalence): (L,f)⊗inv(L,f)≅(O,0).
- TauCeti.GradedDeterminant.graded_line_inverse_double_dual (compatibility): inv(inv(L,f))≅(L,f).
- TauCeti.GradedDeterminant.graded_line_inverse_grade (projection): grade(inv A)=−grade A.
- TauCeti.GradedDeterminant.graded_line_inverse_pullback (functoriality): Pullback of the inverse is canonically the inverse of the pullback.

**Unit tests.**

- TauCeti.GradedDeterminant.graded_line_inverse_odd (computation): The inverse of (O,1) has grade −1.
- TauCeti.GradedDeterminant.graded_line_inverse_zero (degenerate): The unit is its own inverse.
- TauCeti.GradedDeterminant.graded_line_inverse_wrong_grade (non-example): (O,1)⊗(O,1) cannot be isomorphic to the unit over Spec ℚ.
- TauCeti.GradedDeterminant.graded_line_inverse_affine (compatibility): In grade zero affine duality agrees with Module.Invertible and CommRing.Pic inverse.

**Sources.**

- BS17.v3, Definition 12.14 p.58; Construction 5.1 p.18. Source construction or consequence at this locator, retaining morphisms, signs and coherence; proof refinements are named as requested interfaces or recorded gaps.

### Pullback of graded lines

**KTheoryLowDegrees:Z.3/graded-line-pullback** · construction · implementation unchecked.

For a scheme morphism h:Y→X, pullback sends (L,f) to (h*L,f∘h), defines a symmetric monoidal functor Pic^Z(X)→Pic^Z(Y), and has coherent identity and composition isomorphisms.

**Hypotheses.**

- All schemes and categories are in fixed universes. R denotes a commutative unital ring; X is a scheme. A perfect F_p-scheme in the Witt-support results is qcqs, as in BS17 §1. Constructions on all schemes are distinguished from K(X), whose determinant statement assumes X qcqs.

**Construction or proof.**

- Import invertible-sheaf pullback; compose the locally constant function with the continuous underlying map.
- Scalar extension preserves −1 and hence ε. Combine ordinary sheaf pullback constraints with equality of composed grades; check coherence using the supplier pullback coherence.

**Acceptance.**

- Disconnected grades are pulled back componentwise.

**Prerequisites.**

- KTheoryLowDegrees:Z.3/graded-line-tensor
- KTheoryLowDegrees:Z.3/graded-line-inverse
- tauceti:TauCetiRoadmap/JacobianChallenge#layer-a-line-bundles-divisors-picard-group-degree

**Uses.**

- Bhatt–Scholze §5 and §12: The signed determinant must retain automorphisms and coherent sums before spectrum group completion and geometric descent.
- KTheoryLowDegrees:Z.3/determinant-hom; KTheoryLowDegrees:U.3 and U.6: Components recover rank and determinant; loops recover the determinant on units without asserting SK₁ vanishes globally.

**Public API.**

- TauCeti.GradedDeterminant.graded_line_pullback_object (characterisation): h*(L,f)=(h*L,f∘h).
- TauCeti.GradedDeterminant.graded_line_pullback_id (simp): Identity pullback is naturally isomorphic to identity.
- TauCeti.GradedDeterminant.graded_line_pullback_comp (functoriality): (h∘g)*≅g*∘h* coherently.
- TauCeti.GradedDeterminant.graded_line_pullback_tensor (compatibility): h*(A⊗B)≅h*A⊗h*B.
- TauCeti.GradedDeterminant.graded_line_pullback_braiding (compatibility): The pullback constraint intertwines both signed braidings.

**Unit tests.**

- TauCeti.GradedDeterminant.graded_line_pullback_point (computation): Pullback to a point evaluates the grade at that point.
- TauCeti.GradedDeterminant.graded_line_pullback_empty (degenerate): Pullback to the empty scheme yields its unique object.
- TauCeti.GradedDeterminant.graded_line_pullback_product (non-example): On Spec(ℚ×ℚ), grades (0,1) remain distinct; there is no single global integer rank.
- TauCeti.GradedDeterminant.graded_line_pullback_affine (compatibility): On affine grade-zero classes, pullback agrees with CommRing.Pic.mapRingHom.

**Sources.**

- BS17.v3, Construction 5.1 p.18; Proposition 5.3 pp.18–19. Source construction or consequence at this locator, retaining morphisms, signs and coherence; proof refinements are named as requested interfaces or recorded gaps.

### Components of the graded Picard groupoid

**KTheoryLowDegrees:Z.3/graded-line-components** · comparison · implementation unchecked.

There is a natural abelian-group isomorphism π₀Pic^Z(X)≅Pic(X)×H⁰(X_et,ℤ), sending [(L,f)] to ([L],f); here H⁰ denotes locally constant functions, with its additive operation. This is not an equivalence of groupoids.

**Hypotheses.**

- All schemes and categories are in fixed universes. R denotes a commutative unital ring; X is a scheme. A perfect F_p-scheme in the Witt-support results is qcqs, as in BS17 §1. Constructions on all schemes are distinguished from K(X), whose determinant statement assumes X qcqs.

**Construction or proof.**

- An isomorphism fixes the grade and identifies precisely the ordinary line-bundle class.
- Tensor becomes the product of the Picard operation and grade addition; the inverse is dual plus grade negation.

**Acceptance.**

- Over Spec ℚ this component calculation loses ℚˣ automorphisms.

**Prerequisites.**

- KTheoryLowDegrees:Z.3/graded-line-inverse
- KTheoryLowDegrees:Z.3/graded-line-pullback
- StableHomotopyKTheory:H.4

**Sources.**

- BS17.v3, Construction 5.1 p.18. Source construction or consequence at this locator, retaining morphisms, signs and coherence; proof refinements are named as requested interfaces or recorded gaps.

### Automorphisms of a graded line

**KTheoryLowDegrees:Z.3/graded-line-automorphisms** · lemma · implementation unchecked.

For any (L,f), scalar multiplication identifies Aut((L,f))≅Γ(X,O_X)ˣ, naturally under pullback. In the connective spectrum of Pic^Z, π₁ is this unit group and π_i=0 for i>1.

**Hypotheses.**

- All schemes and categories are in fixed universes. R denotes a commutative unital ring; X is a scheme. A perfect F_p-scheme in the Witt-support results is qcqs, as in BS17 §1. Constructions on all schemes are distinguished from K(X), whose determinant statement assumes X qcqs.

**Construction or proof.**

- Locally trivialize L; its endomorphism sheaf is O_X. Gluing identifies automorphisms with invertible global scalars.
- A groupoid nerve is a 1-type; import the spectrum/nerve comparison to identify its homotopy groups, rather than treating an isoclass quotient as a 1-type.

**Acceptance.**

- Over Spec ℚ the automorphism −1 is nontrivial; over Spec 𝔽₂ the units are trivial.

**Prerequisites.**

- KTheoryLowDegrees:Z.3/graded-line-groupoid
- tauceti:TauCetiRoadmap/JacobianChallenge#layer-a-line-bundles-divisors-picard-group-degree
- StableHomotopyKTheory:H.5:spectra
- StableHomotopyKTheory:H.4

**Sources.**

- BS17.v3, Construction 5.1 p.18; pp.55–56,59. Source construction or consequence at this locator, retaining morphisms, signs and coherence; proof refinements are named as requested interfaces or recorded gaps.

### Grade fibre sequence

**KTheoryLowDegrees:Z.3/graded-line-fibre** · theorem · implementation unchecked.

The inclusion L↦(L,0) and grade projection give a fibre sequence of connective spectra Pic(X)→Pic^Z(X)→H⁰(X_et,ℤ), and as X varies a fibre sequence of étale sheaves. The last term is the discrete connective spectrum.

**Hypotheses.**

- All schemes and categories are in fixed universes. R denotes a commutative unital ring; X is a scheme. A perfect F_p-scheme in the Witt-support results is qcqs, as in BS17 §1. Constructions on all schemes are distinguished from K(X), whose determinant statement assumes X qcqs.

**Construction or proof.**

- The homotopy fibre over zero consists of the grade-zero objects and their isomorphisms.
- Both functors preserve the signed symmetric structure (sign is one on the inclusion and grade target). Import the Picard-groupoid/connective-spectrum correspondence and étale descent.

**Acceptance.**

- The sequence does not have a symmetric-monoidal retraction obtained by forgetting the grade.

**Prerequisites.**

- KTheoryLowDegrees:Z.3/graded-line-tensor
- KTheoryLowDegrees:Z.3/graded-line-components
- KTheoryLowDegrees:Z.3/graded-line-automorphisms
- StableHomotopyKTheory:H.5:spectra
- SchemeAndStackFoundations:SF.1

**Sources.**

- BS17.v3, Construction 5.1 p.18. Source construction or consequence at this locator, retaining morphisms, signs and coherence; proof refinements are named as requested interfaces or recorded gaps.

### Forgetting the integer grade

**KTheoryLowDegrees:Z.3/forget-grade** · construction · implementation unchecked.

The functor η:Pic^Z(X)→Pic(X), (L,f)↦L, preserves tensor with ordinary monoidal constraints and retracts the grade-zero inclusion. It is generally not symmetric monoidal. It splits the fibre sequence as spaces and E₁-spaces; no splitting of spectra is claimed.

**Hypotheses.**

- All schemes and categories are in fixed universes. R denotes a commutative unital ring; X is a scheme. A perfect F_p-scheme in the Witt-support results is qcqs, as in BS17 §1. Constructions on all schemes are distinguished from K(X), whose determinant statement assumes X qcqs.

**Construction or proof.**

- Keep sheaf isomorphisms and forget grade equality. Use the ordinary tensor and unit constraints.
- The signed braiding on two odd lines maps to −swap, whereas the ordinary braiding is swap. Over Spec ℚ these differ; the functor is only monoidal.

**Acceptance.**

- The distinction survives although π₀ is a product.

**Prerequisites.**

- KTheoryLowDegrees:Z.3/graded-line-tensor
- KTheoryLowDegrees:Z.3/graded-line-fibre

**Uses.**

- Bhatt–Scholze §5 and §12: The signed determinant must retain automorphisms and coherent sums before spectrum group completion and geometric descent.
- KTheoryLowDegrees:Z.3/determinant-hom; KTheoryLowDegrees:U.3 and U.6: Components recover rank and determinant; loops recover the determinant on units without asserting SK₁ vanishes globally.

**Public API.**

- TauCeti.GradedDeterminant.forget_grade_object (projection): η(L,f)=L.
- TauCeti.GradedDeterminant.forget_grade_tensor (compatibility): η(A⊗B)≅ηA⊗ηB.
- TauCeti.GradedDeterminant.forget_grade_unit (simp): η(O,0)=O.
- TauCeti.GradedDeterminant.forget_grade_retract (compatibility): η composed with grade-zero inclusion is identity.
- TauCeti.GradedDeterminant.forget_grade_space_split (equivalence): The underlying E₁-space decomposes as Pic(X)×H⁰(X,ℤ).

**Unit tests.**

- TauCeti.GradedDeterminant.forget_grade_even (computation): On grade-zero objects η preserves the braiding.
- TauCeti.GradedDeterminant.forget_grade_odd (non-example): On (O,1) over Spec ℚ it sends self-braiding to −id, not ordinary +id.
- TauCeti.GradedDeterminant.forget_grade_char_two (compatibility): The odd sign obstruction vanishes over Spec 𝔽₂; this does not imply a general symmetric retraction.
- TauCeti.GradedDeterminant.forget_grade_empty (degenerate): Over the empty scheme forgetting grade is the unique functor.

**Sources.**

- BS17.v3, Construction 5.1 p.18; Remark 5.4 p.19. Source construction or consequence at this locator, retaining morphisms, signs and coherence; proof refinements are named as requested interfaces or recorded gaps.

### Self-braiding detects parity

**KTheoryLowDegrees:Z.3/graded-self-braiding** · lemma · implementation unchecked.

For A=(L,f), β_{A,A} is scalar multiplication by (−1)^f on L⊗L. In BS17 Definition 12.1, “strict” means β_{A,A}=id for every A, not that the associator and unitors are identity. Pic^Z(Spec ℚ) fails this property.

**Hypotheses.**

- All schemes and categories are in fixed universes. R denotes a commutative unital ring; X is a scheme. A perfect F_p-scheme in the Witt-support results is qcqs, as in BS17 §1. Constructions on all schemes are distinguished from K(X), whose determinant statement assumes X qcqs.

**Construction or proof.**

- The ordinary self-swap of a line is identity, checked locally on a generator.
- Use ε(f,f)=ε(f,1) since f²≡f mod 2. Apply to grade one over ℚ.

**Acceptance.**

- SymmetricCategory only asserts two successive braidings are identity.

**Prerequisites.**

- KTheoryLowDegrees:Z.3/graded-line-tensor
- KTheoryLowDegrees:Z.3/koszul-sign

**Sources.**

- BS17.v3, Definition 12.1 p.54; Example 12.2(iii) p.55. Source construction or consequence at this locator, retaining morphisms, signs and coherence; proof refinements are named as requested interfaces or recorded gaps.

### Sign of exchanging projective summands

**KTheoryLowDegrees:Z.3/projective-block-swap** · lemma · implementation unchecked.

For finite projectives P,Q over R, with locally constant ranks r,s, the determinant of the swap P⊕Q≅Q⊕P, transported through the ordered determinant sum isomorphisms, is (−1)^{rs} times ordinary line swap.

**Hypotheses.**

- All schemes and categories are in fixed universes. R denotes a commutative unital ring; X is a scheme. A perfect F_p-scheme in the Witt-support results is qcqs, as in BS17 §1. Constructions on all schemes are distinguished from K(X), whose determinant statement assumes X qcqs.

**Construction or proof.**

- Localize where both projectives are free, keeping their ordered bases.
- The block permutation crosses r basis vectors past s others; its rs inversions give the sign. Local determinant identifications glue by naturality.

**Acceptance.**

- For P=Q=R over ℤ the exchange has determinant −1, disproving an unsigned symmetric determinant.

**Prerequisites.**

- KTheoryLowDegrees:Z.3/determinant-sum
- KTheoryLowDegrees:Z.3/determinant-base-change
- KTheoryLowDegrees:Z.3/koszul-sign
- mathlib:Matrix.det

**Sources.**

- BS17.v3, Proposition 12.3 p.55. Source construction or consequence at this locator, retaining morphisms, signs and coherence; proof refinements are named as requested interfaces or recorded gaps.

### Graded determinant of finite projectives

**KTheoryLowDegrees:Z.3/projective-graded-det** · construction · implementation unchecked.

On the maximal subgroupoid of finite projective R-modules with direct sum, Det^Z(P)=(det_R P,rk P), and isomorphisms act by their top exterior powers componentwise. This is a natural symmetric monoidal functor to Pic^Z(Spec R).

**Hypotheses.**

- All schemes and categories are in fixed universes. R denotes a commutative unital ring; X is a scheme. A perfect F_p-scheme in the Witt-support results is qcqs, as in BS17 §1. Constructions on all schemes are distinguished from K(X), whose determinant statement assumes X qcqs.

**Construction or proof.**

- Use componentwise determinant-projective and rank from the companion packet; retain top-exterior maps on isomorphisms.
- Use determinant-sum as the tensor comparison, determinant of zero as unit, and projective-block-swap for symmetry. Associativity follows from ordered exterior concatenation, not from equality of classes.

**Acceptance.**

- The input monoidal operation is direct sum, not tensor product.

**Prerequisites.**

- KTheoryLowDegrees:Z.3/graded-line-tensor
- KTheoryLowDegrees:Z.3/projective-block-swap
- KTheoryLowDegrees:Z.3/determinant-projective
- KTheoryLowDegrees:Z.3/determinant-sum
- KTheoryLowDegrees:Z.2/rank-hom
- mathlib:CategoryTheory.Core

**Uses.**

- Bhatt–Scholze §5 and §12: The signed determinant must retain automorphisms and coherent sums before spectrum group completion and geometric descent.
- KTheoryLowDegrees:Z.3/determinant-hom; KTheoryLowDegrees:U.3 and U.6: Components recover rank and determinant; loops recover the determinant on units without asserting SK₁ vanishes globally.

**Public API.**

- TauCeti.GradedDeterminant.projective_graded_det_object (characterisation): Det^Z(P)=(det P,rk P).
- TauCeti.GradedDeterminant.projective_graded_det_map (functoriality): Det^Z(u) is the induced top-exterior isomorphism.
- TauCeti.GradedDeterminant.projective_graded_det_zero (simp): Det^Z(0)≅(R,0).
- TauCeti.GradedDeterminant.projective_graded_det_sum (compatibility): Det^Z(P⊕Q)≅Det^Z(P)⊗Det^Z(Q).
- TauCeti.GradedDeterminant.projective_graded_det_symmetry (compatibility): The direct-sum swap maps to signed Picard braiding.
- TauCeti.GradedDeterminant.projective_graded_det_base_change (functoriality): The functor commutes coherently with scalar extension.

**Unit tests.**

- TauCeti.GradedDeterminant.projective_graded_det_line (computation): Det^Z(R)=(R,1).
- TauCeti.GradedDeterminant.projective_graded_det_zero_test (degenerate): Det^Z(0)=(R,0).
- TauCeti.GradedDeterminant.projective_graded_det_swap (non-example): Over ℤ, swapping two free rank-one summands maps to −1.
- TauCeti.GradedDeterminant.projective_graded_det_product (compatibility): For R=F×F and P=e₁R, the grade is (1,0), agreeing with companion rank.

**Sources.**

- BS17.v3, Proposition 12.3 p.55. Source construction or consequence at this locator, retaining morphisms, signs and coherence; proof refinements are named as requested interfaces or recorded gaps.

### Determinant on the ring K-spectrum

**KTheoryLowDegrees:Z.3/ring-spectrum-det** · construction · implementation unchecked.

The graded determinant induces a natural connective-spectrum map Det_R:K(R)→Pic^Z(Spec R). Here K(R) is group completion of the nerve of the finite-projective isomorphism groupoid under direct sum, identified with the agreed algebraic K model.

**Hypotheses.**

- All schemes and categories are in fixed universes. R denotes a commutative unital ring; X is a scheme. A perfect F_p-scheme in the Witt-support results is qcqs, as in BS17 §1. Constructions on all schemes are distinguished from K(X), whose determinant statement assumes X qcqs.

**Construction or proof.**

- Apply the H.4 group-completion universal property to projective-graded-det; Pic^Z is already grouplike.
- Import the E∞-monoid/connective-spectrum correspondence and projective group-completion comparison. These are owner interfaces, not new generic K-theory nodes.

**Acceptance.**

- Functoriality is a coherent spectrum map, not a freely chosen homomorphism of π₀.

**Prerequisites.**

- KTheoryLowDegrees:Z.3/projective-graded-det
- KTheoryLowDegrees:Z.3/graded-line-inverse
- StableHomotopyKTheory:H.4
- StableHomotopyKTheory:H.5:spectra
- GeneralAlgebraicKTheory:K.4:construction

**Uses.**

- Bhatt–Scholze §5 and §12: The signed determinant must retain automorphisms and coherent sums before spectrum group completion and geometric descent.
- KTheoryLowDegrees:Z.3/determinant-hom; KTheoryLowDegrees:U.3 and U.6: Components recover rank and determinant; loops recover the determinant on units without asserting SK₁ vanishes globally.

**Public API.**

- TauCeti.GradedDeterminant.ring_spectrum_det_object (compatibility): [P] maps to (det P,rk P).
- TauCeti.GradedDeterminant.ring_spectrum_det_natural (functoriality): Scalar-extension K maps commute with graded determinant.
- TauCeti.GradedDeterminant.ring_spectrum_det_sum (compatibility): The map preserves coherently the direct-sum group law.
- TauCeti.GradedDeterminant.ring_spectrum_det_pi_zero (compatibility): On π₀ it is the existing rank and determinant pair.
- TauCeti.GradedDeterminant.ring_spectrum_det_pi_one (compatibility): On automorphism loops it is the determinant in Rˣ; arbitrary SK₁ may remain.

**Unit tests.**

- TauCeti.GradedDeterminant.ring_spectrum_det_field (compatibility): Over a field, π₀ is rank and π₁ is the usual determinant.
- TauCeti.GradedDeterminant.ring_spectrum_det_negative (computation): −[R] has grade −1 and the dual determinant line.
- TauCeti.GradedDeterminant.ring_spectrum_det_zero (degenerate): The zero-ring K-spectrum and Pic^Z are contractible.
- TauCeti.GradedDeterminant.ring_spectrum_det_not_ordinary_pic (non-example): [R] over ℚ cannot map into the grade-zero Pic inclusion because its grade is one.

**Sources.**

- BS17.v3, Corollary 12.17 p.59; Definition 12.13 p.58. Source construction or consequence at this locator, retaining morphisms, signs and coherence; proof refinements are named as requested interfaces or recorded gaps.

### Determinant through the first truncation

**KTheoryLowDegrees:Z.3/determinant-truncation** · lemma · implementation unchecked.

Since Pic^Z is 1-truncated, Det_R factors canonically through τ≤1K(R). The factor is unique in the homotopy-coherent mapping space; this does not make K(R) itself 1-truncated.

**Hypotheses.**

- All schemes and categories are in fixed universes. R denotes a commutative unital ring; X is a scheme. A perfect F_p-scheme in the Witt-support results is qcqs, as in BS17 §1. Constructions on all schemes are distinguished from K(X), whose determinant statement assumes X qcqs.

**Construction or proof.**

- Apply the universal property of connective-spectrum truncation to the target whose π_i vanish for i>1.

**Acceptance.**

- Higher K-groups are not discarded from the source theory.

**Prerequisites.**

- KTheoryLowDegrees:Z.3/ring-spectrum-det
- KTheoryLowDegrees:Z.3/graded-line-automorphisms
- StableHomotopyKTheory:H.5:spectra

**Sources.**

- BS17.v3, Paragraph preceding Proposition 12.18 p.59. Source construction or consequence at this locator, retaining morphisms, signs and coherence; proof refinements are named as requested interfaces or recorded gaps.

### Determinant on a local ring

**KTheoryLowDegrees:Z.3/local-det-equivalence** · comparison · implementation unchecked.

For a nonzero commutative local ring R, Det_R induces isomorphisms on π₀ and π₁: K₀(R)≅ℤ and K₁(R)≅Rˣ. Consequently τ≤1K(R)→Pic^Z(Spec R) is an equivalence.

**Hypotheses.**

- All schemes and categories are in fixed universes. R denotes a commutative unital ring; X is a scheme. A perfect F_p-scheme in the Witt-support results is qcqs, as in BS17 §1. Constructions on all schemes are distinguished from K(X), whose determinant statement assumes X qcqs.

**Construction or proof.**

- Import local freeness and the rank isomorphism from Z.2 and SK₁ vanishing for commutative local rings from U.3.
- Pic(R) is trivial and Spec R is connected; identify the grade coordinate with ℤ and loops with Rˣ. Apply the 1-truncated Whitehead criterion supplied by H.5:spectra.

**Acceptance.**

- No K₁(R)=Rˣ assertion for an arbitrary commutative ring; no zero-ring K₀=ℤ assertion.

**Prerequisites.**

- KTheoryLowDegrees:Z.3/determinant-truncation
- KTheoryLowDegrees:Z.3/graded-line-components
- KTheoryLowDegrees:Z.3/graded-line-automorphisms
- KTheoryLowDegrees:Z.2
- KTheoryLowDegrees:U.3
- StableHomotopyKTheory:H.5:spectra

**Sources.**

- BS17.v3, Proposition 12.18 p.59. Source construction or consequence at this locator, retaining morphisms, signs and coherence; proof refinements are named as requested interfaces or recorded gaps.

### Sheafified first K-truncation

**KTheoryLowDegrees:Z.3/zariski-sheafified-det** · theorem · implementation unchecked.

On affine schemes, Det:τ≤1K→Pic^Z is an equivalence after Zariski sheafification as presheaves of groupoids. It need not be an objectwise equivalence before sheafification.

**Hypotheses.**

- All schemes and categories are in fixed universes. R denotes a commutative unital ring; X is a scheme. A perfect F_p-scheme in the Witt-support results is qcqs, as in BS17 §1. Constructions on all schemes are distinguished from K(X), whose determinant statement assumes X qcqs.

**Construction or proof.**

- Import sheafification of groupoid-valued presheaves and its local equivalence criterion.
- At every local-ring stalk use local-det-equivalence; Pic^Z has effective line and grade descent. Stalkwise equivalences imply equivalence of the sheafified 1-types.

**Acceptance.**

- The proof compares both π₀ and π₁; a π₀-only calculation is insufficient.

**Prerequisites.**

- KTheoryLowDegrees:Z.3/local-det-equivalence
- KTheoryLowDegrees:Z.3/graded-line-pullback
- SchemeAndStackFoundations:SF.1
- StableHomotopyKTheory:H.5:spectra

**Sources.**

- BS17.v3, Proposition 12.18 p.59. Source construction or consequence at this locator, retaining morphisms, signs and coherence; proof refinements are named as requested interfaces or recorded gaps.

### Descent of graded lines on perfect schemes

**KTheoryLowDegrees:Z.3/graded-pic-v-descent** · theorem · implementation unchecked.

On qcqs perfect F_p-schemes, X↦Pic^Z(X) is a v-stack. The grades form a v-sheaf; ordinary line bundles and their isomorphisms satisfy effective v-descent.

**Hypotheses.**

- All schemes and categories are in fixed universes. R denotes a commutative unital ring; X is a scheme. A perfect F_p-scheme in the Witt-support results is qcqs, as in BS17 §1. Constructions on all schemes are distinguished from K(X), whose determinant statement assumes X qcqs.

**Construction or proof.**

- Import the perfect-scheme v-site and effective v-descent of line bundles from the assigned foundations source route.
- Descend the locally constant integer grades and the lines, then their isomorphisms. The fibre sequence makes the homotopy-coherent Picard structure compatible with this descent.

**Acceptance.**

- Étale or fpqc descent alone is not v-descent; the requested stronger supplier is recorded as a gap.

**Prerequisites.**

- KTheoryLowDegrees:Z.3/graded-line-fibre
- SchemeAndStackFoundations:SF.1

**Sources.**

- BS17.v3, Proposition 5.2 p.18; Theorem 4.1(ii) used there. Source construction or consequence at this locator, retaining morphisms, signs and coherence; proof refinements are named as requested interfaces or recorded gaps.

### Stalk rank of an exterior power

**KTheoryLowDegrees:Z.3/exterior-rank** · lemma · implementation unchecked.

For every finite projective R-module P, every prime p of R and every n≥0, rankAtStalk (Λ^n P) p = Nat.choose (rankAtStalk P p) n.

**Hypotheses.**

- R is a commutative unital ring; the zero ring is allowed.

**Construction or proof.**

- Localise the exterior-base-change comparison at p. The local ring R_p is nontrivial, and local-freeness identifies P_p with a finite free module of rank rankAtStalk P p. Apply the pinned exteriorPower.finrank_eq and the definition of rankAtStalk. If R is the zero ring there is no prime p, so the statement is vacuous.

**Acceptance.**

- At either prime of k×k, the module k×k² has second-exterior stalk ranks 0 and 1, respectively.
- For n=0 the stalk rank is one; for n above the local rank it is zero.

**Prerequisites.**

- KTheoryLowDegrees:Z.3/exterior-base-change
- KTheoryLowDegrees:Z.2/local-freeness
- mathlib:exteriorPower.finrank_eq
- mathlib:Module.rankAtStalk

**Sources.**

- Kbook.I, I §3, p. 16, fact (ii). The local-rank consequence of fact (ii), checked after localisation to a nontrivial local ring.

### Exterior coefficients of negative free classes

**KTheoryLowDegrees:Z.3/lambda-negative-free** · lemma · implementation unchecked.

For every m,n≥0, λ^n(−m[R]) = (−1)^n Nat.choose (m+n−1) n [R], with truncated natural subtraction in the binomial coefficient. This includes m=0: λ^0(0)=1 and λ^n(0)=0 for n>0.

**Hypotheses.**

- R is a commutative unital ring; the zero ring is allowed.

**Construction or proof.**

- The total operation sends −m[R] to the inverse of (1+t)^m. Apply lambda-nat-cast to the negative integer −m and read its integral negative-binomial coefficients; for m=0 use total-lambda-constant and lambda-zero-class.

**Acceptance.**

- λ²(−2[R])=3[R] and λ³(−[R])=−[R].
- For m=0, n=0 the binomial term is choose(0,0)=1; for n>0 it is choose(n−1,n)=0.
- All identities hold in the zero ring.

**Prerequisites.**

- KTheoryLowDegrees:Z.3/lambda-nat-cast
- KTheoryLowDegrees:Z.3/total-lambda
- KTheoryLowDegrees:Z.3/lambda-free
- KTheoryLowDegrees:Z.3/lambda-zero-class
- KTheoryLowDegrees:Z.3/total-lambda-constant

**Sources.**

- Kbook.II, II Exercise 4.1, p. 35. Exercise 4.1 with P=0 gives the negative-binomial coefficients. The m=0 boundary follows separately from the pre-λ axioms.

### Homomorphisms of pre-λ-rings

**KTheoryLowDegrees:Z.3/pre-lambda-hom** · definition · implementation unchecked.

For pre-λ-rings K,L, PreLambdaRing.Hom K L consists of ring homomorphisms commuting with every λⁿ. Identity and composition are those of ring homomorphisms.

**Hypotheses.**

- The indicated rings are commutative pre-λ-rings; zero rings are allowed.

**Construction or proof.**

- Package a RingHom with the equations f(λⁿx)=λⁿ(fx). Identity commutes by reflexivity; composition commutes by applying the two preservation equations. Equality is equality of the underlying ring homomorphisms, since preservation is propositional.

**Acceptance.**

- The identity of the binomial pre-λ-ring ℤ preserves λ²(3)=3.
- Composing two identity maps is identity, including the zero ring.
- The identity ring map from binomial ℤ to ℤ with λ_t(m)=(1+t+t²)^m is not a pre-λ-homomorphism: λ²(1) is respectively 0 and 1.

**Prerequisites.**

- KTheoryLowDegrees:Z.3/pre-lambda-ring

**Uses.**

- K-book II 4.1–4.5: K₀(R), K₀(X), KO(X), KU(X) and R(G) are λ-rings in this sense; γ and ψ are defined from the λⁿ
- KTheoryLowDegrees:Z.3/ring-k0-pre-lambda: the λ-structure on K₀(R) is an instance
- SchemeKTheoryOperations:S.6 (R_A(G), K(A) = ⊕K_m(A)): the pre-λ-structures S.6 constructs before proving specialness

**Public API.**

- TauCeti.PreLambdaRing.Hom (constructor): Bundle a ring homomorphism and its operation-preservation equations.
- TauCeti.PreLambdaRing.Hom.id (constructor): The identity homomorphism.
- TauCeti.PreLambdaRing.Hom.comp (functoriality): Composition of pre-λ-homomorphisms.
- TauCeti.PreLambdaRing.Hom.ext (extensionality): Underlying ring-map equality implies Hom equality.

**Unit tests.**

- TauCeti.PreLambdaRing.Hom.id_test (compatibility): The identity of the binomial pre-λ-ring ℤ preserves λ²(3)=3.
- TauCeti.PreLambdaRing.Hom.comp_test (degenerate): Composing two identity maps is identity, including the zero ring.
- TauCeti.PreLambdaRing.Hom.different_structures_test (non-example): The identity ring map from binomial ℤ to ℤ with λ_t(m)=(1+t+t²)^m is not a pre-λ-homomorphism: λ²(1) is respectively 0 and 1.

**Sources.**

- Kbook.II, II §4, 4.1, p. 25. The definition (followed by the three axioms).
- Kbook.II, II §4, 4.1, p. 25. Pins the terminology.

### λ-ideals

**KTheoryLowDegrees:Z.3/lambda-ideal** · definition · implementation unchecked.

A λ-ideal I of a pre-λ-ring K is an ideal such that λⁿ(x)∈I for x∈I and n≥1. In particular the kernel of a pre-λ-homomorphism is a λ-ideal.

**Hypotheses.**

- The indicated rings are commutative pre-λ-rings; zero rings are allowed.

**Construction or proof.**

- Package positive-degree stability as a proposition on an existing Ideal. For a kernel, preservation by its defining homomorphism reduces membership to λⁿ(0)=0 for n>0.

**Acceptance.**

- The zero ideal is stable because all positive λⁿ(0) vanish.
- The whole ring is a λ-ideal; degree zero is not included in the definition.
- The ideal (2) in binomial ℤ is not a λ-ideal: λ²(2)=1∉(2).

**Prerequisites.**

- KTheoryLowDegrees:Z.3/pre-lambda-ring
- KTheoryLowDegrees:Z.3/pre-lambda-hom
- KTheoryLowDegrees:Z.3/lambda-zero-class

**Uses.**

- K-book II 4.1–4.5: K₀(R), K₀(X), KO(X), KU(X) and R(G) are λ-rings in this sense; γ and ψ are defined from the λⁿ
- KTheoryLowDegrees:Z.3/ring-k0-pre-lambda: the λ-structure on K₀(R) is an instance
- SchemeKTheoryOperations:S.6 (R_A(G), K(A) = ⊕K_m(A)): the pre-λ-structures S.6 constructs before proving specialness

**Public API.**

- TauCeti.LambdaRing.IsLambdaIdeal (structure): Positive-degree λ-stability of an ideal.
- TauCeti.LambdaRing.IsLambdaIdeal.lambda_mem (characterisation): For x∈I and n≥1, λⁿx∈I.
- TauCeti.PreLambdaRing.Hom.isLambdaIdeal_ker (relation): The kernel of a pre-λ-homomorphism is a λ-ideal.

**Unit tests.**

- TauCeti.LambdaRing.lambdaIdeal_bot_test (degenerate): The zero ideal is stable because all positive λⁿ(0) vanish.
- TauCeti.LambdaRing.lambdaIdeal_top_test (computation): The whole ring is a λ-ideal; degree zero is not included in the definition.
- TauCeti.LambdaRing.lambdaIdeal_two_test (non-example): The ideal (2) in binomial ℤ is not a λ-ideal: λ²(2)=1∉(2).

**Sources.**

- Kbook.II, II §4 opening definition, p.25. The definition; kernel stability follows from preservation and positive operations of zero.

### Quotient by a λ-ideal

**KTheoryLowDegrees:Z.3/pre-lambda-quotient** · construction · implementation unchecked.

For a λ-ideal I of a pre-λ-ring K, the quotient K/I carries the unique induced pre-λ-structure with λⁿ[x]=[λⁿx]. Its projection is a pre-λ-homomorphism.

**Hypotheses.**

- The indicated rings are commutative pre-λ-rings; zero rings are allowed.

**Construction or proof.**

- If i∈I, the sum axiom gives λⁿ(x+i)−λⁿ(x)=Σ_{j<n}λʲ(x)λ^{n−j}(i)∈I for n>0; degree zero is constant. Hence each operation descends. The three axioms descend by the surjective quotient map; uniqueness follows by quotient induction.

**Acceptance.**

- The quotient by ⊥ has the original operations under the canonical isomorphism.
- The quotient by ⊤ is the zero pre-λ-ring.
- No induced quotient formula exists for binomial ℤ/(2): 2=0 in the quotient but λ²(2)=1 and λ²(0)=0.

**Prerequisites.**

- KTheoryLowDegrees:Z.3/pre-lambda-ring
- KTheoryLowDegrees:Z.3/pre-lambda-hom
- KTheoryLowDegrees:Z.3/lambda-ideal

**Uses.**

- K-book II 4.1–4.5: K₀(R), K₀(X), KO(X), KU(X) and R(G) are λ-rings in this sense; γ and ψ are defined from the λⁿ
- KTheoryLowDegrees:Z.3/ring-k0-pre-lambda: the λ-structure on K₀(R) is an instance
- SchemeKTheoryOperations:S.6 (R_A(G), K(A) = ⊕K_m(A)): the pre-λ-structures S.6 constructs before proving specialness

**Public API.**

- TauCeti.LambdaRing.quotient (instance): The induced pre-λ-ring structure on K/I.
- TauCeti.LambdaRing.quotient_mk_lambda (simp): The quotient map commutes with λⁿ.
- TauCeti.LambdaRing.quotient_unique (universal-property): The displayed quotient formula uniquely determines the operations.

**Unit tests.**

- TauCeti.LambdaRing.quotient_bot_test (compatibility): The quotient by ⊥ has the original operations under the canonical isomorphism.
- TauCeti.LambdaRing.quotient_top_test (degenerate): The quotient by ⊤ is the zero pre-λ-ring.
- TauCeti.LambdaRing.quotient_two_not_test (non-example): No induced quotient formula exists for binomial ℤ/(2): 2=0 in the quotient but λ²(2)=1 and λ²(0)=0.

**Sources.**

- Kbook.II, II §4, 4.1, p. 25. The sum axiom at this locator proves the quotient construction by the explicit congruence argument above; a separate quoted quotient theorem is not claimed.

### Degree-one elements of a pre-λ-ring

**KTheoryLowDegrees:Z.3/lambda-line-element** · definition · implementation unchecked.

A line element ℓ of a pre-λ-ring is an element with λⁿ(ℓ)=0 for all n≥2, equivalently λ_t(ℓ)=1+ℓt. It need not be invertible.

**Hypotheses.**

- The indicated rings are commutative pre-λ-rings; zero rings are allowed.

**Construction or proof.**

- Define positive-degree vanishing starting at two. The series characterization follows coefficientwise from λ⁰=1, λ¹=id and this vanishing.

**Acceptance.**

- 0 is a line element in every pre-λ-ring.
- 1 is a line element in binomial ℤ.
- 2 is not a line element in binomial ℤ because λ²(2)=1.

**Prerequisites.**

- KTheoryLowDegrees:Z.3/pre-lambda-ring

**Uses.**

- K-book II 4.1–4.5: K₀(R), K₀(X), KO(X), KU(X) and R(G) are λ-rings in this sense; γ and ψ are defined from the λⁿ
- KTheoryLowDegrees:Z.3/ring-k0-pre-lambda: the λ-structure on K₀(R) is an instance
- SchemeKTheoryOperations:S.6 (R_A(G), K(A) = ⊕K_m(A)): the pre-λ-structures S.6 constructs before proving specialness

**Public API.**

- TauCeti.LambdaRing.IsLineElement (characterisation): λⁿ(ℓ)=0 for n≥2.
- TauCeti.LambdaRing.lambdaTotal_of_isLineElement (relation): The total series is 1+ℓt.
- TauCeti.LambdaRing.isLineElement_zero (simp): Zero is a line element; invertibility is not part of this predicate.

**Unit tests.**

- TauCeti.LambdaRing.lineElement_zero_test (degenerate): 0 is a line element in every pre-λ-ring.
- TauCeti.LambdaRing.lineElement_one_test (computation): 1 is a line element in binomial ℤ.
- TauCeti.LambdaRing.lineElement_two_test (non-example): 2 is not a line element in binomial ℤ because λ²(2)=1.

**Sources.**

- Kbook.II, II Definition 4.2.1 and following paragraph, p.26. The native IsLineElement predicate deliberately generalises this to degree-one λ-series without positivity or invertibility. Weibel’s positive line elements are units and satisfy this predicate; the reverse implication is not asserted.

### Grothendieck's composition polynomial

**KTheoryLowDegrees:Z.3/lambda-composition-polynomial** · construction · implementation unchecked.

For k,l≥1 there is a unique integral polynomial P_{k,l} in a₁,…,a_{kl} whose value on elementary symmetric functions in n≥kl variables is e_k of their l-fold distinct products. It is isobaric of weight kl and independent of n.

**Hypotheses.**

- k,l≥1; n≥kl; coefficient ring ℤ. Identities in fewer variables follow by adjoining zero variables.

**Construction or proof.**

- The elementary symmetric function of the l-fold products is symmetric in the original variables. Apply the pinned fundamental theorem of symmetric polynomials over ℤ. Homogeneity bounds its isobaric weight by kl. Setting extra variables to zero and uniqueness prove stability; no division is used.

**Acceptance.**

- P_{2,2}=a₁a₃−a₄.
- P_{k,1}=a_k and P_{1,l}=a_l.
- For four variables all equal to 1, P_{2,2}(4,6,4,1)=15, the second exterior coefficient of a rank-six exterior square.

**Prerequisites.**

- mathlib:MvPolynomial.esymm
- mathlib:MvPolynomial.IsSymmetric
- mathlib:MvPolynomial.esymmAlgEquiv
- mathlib:MvPolynomial.esymmAlgHom_fin_injective
- tauceti:MvPolynomial.IsSymmetric.exists_aeval_esymm
- mathlib:MvPolynomial.psum
- mathlib:MvPolynomial.psum_eq_mul_esymm_sub_sum
- mathlib:MvPolynomial.mul_esymm_eq_sum

**Uses.**

- KTheoryLowDegrees:Z.3/special-lambda-ring: the product and composition axioms
- KTheoryLowDegrees:Z.3/lambda-identity-principle: identities in special λ-rings reduce to identities of these polynomials
- KTheoryLowDegrees:Z.3/adams-operations: ψ^k = N_k(λ¹, …, λ^k)

**Public API.**

- TauCeti.LambdaRing.compPoly (constructor): The integral polynomial P_{k,l}.
- TauCeti.LambdaRing.compPoly_esymm (characterisation): Evaluation on elementary symmetric functions gives the defining expression.
- TauCeti.LambdaRing.compPoly_unique (extensionality): The defining identity in n≥kl variables characterizes P_{k,l}.
- TauCeti.LambdaRing.compPoly_isobaric (relation): P_{k,l} has isobaric weight kl.

**Unit tests.**

- TauCeti.LambdaRing.compPoly_two_two_test (computation): P_{2,2}=a₁a₃−a₄.
- TauCeti.LambdaRing.compPoly_one_test (degenerate): P_{k,1}=a_k and P_{1,l}=a_l.
- TauCeti.LambdaRing.compPoly_rank_four_test (compatibility): For four variables all equal to 1, P_{2,2}(4,6,4,1)=15, the second exterior coefficient of a rank-six exterior square.

**Sources.**

- Kbook.II, II Example 4.3, p. 27. The product polynomials; Weibel defines them through the Witt product, whose stated sign convention is corrected in sourceIssues.
- Kbook.II, II Example 4.3, p. 27. The composition polynomials.
- Soule.1985, §1.1 (p. 490). Soulé's λ-ring axioms use the same universal integral polynomials (Grothendieck, SGA 6).

### Newton polynomials

**KTheoryLowDegrees:Z.3/lambda-newton-polynomial** · construction · implementation unchecked.

For k≥1 there is a unique integral polynomial N_k in a₁,…,a_k expressing the power sum p_k as N_k(e₁,…,e_k). It is determined by Newton recursion, without dividing by k.

**Hypotheses.**

- k≥1; coefficient ring ℤ; at least k variables for the uniqueness comparison.

**Construction or proof.**

- Use the pinned integral Newton identities recursively to solve for p_k in the earlier power sums and elementary symmetric functions. Equivalently apply the symmetric-polynomial fundamental theorem to p_k. Uniqueness follows from algebraic independence of the first k elementary symmetric polynomials in k variables.

**Acceptance.**

- N₁=a₁.
- N₂=a₁²−2a₂.
- N₃=a₁³−3a₁a₂+3a₃.

**Prerequisites.**

- mathlib:MvPolynomial.esymm
- mathlib:MvPolynomial.IsSymmetric
- mathlib:MvPolynomial.esymmAlgEquiv
- mathlib:MvPolynomial.esymmAlgHom_fin_injective
- tauceti:MvPolynomial.IsSymmetric.exists_aeval_esymm
- mathlib:MvPolynomial.psum
- mathlib:MvPolynomial.psum_eq_mul_esymm_sub_sum
- mathlib:MvPolynomial.mul_esymm_eq_sum

**Uses.**

- KTheoryLowDegrees:Z.3/special-lambda-ring: the product and composition axioms
- KTheoryLowDegrees:Z.3/lambda-identity-principle: identities in special λ-rings reduce to identities of these polynomials
- KTheoryLowDegrees:Z.3/adams-operations: ψ^k = N_k(λ¹, …, λ^k)

**Public API.**

- TauCeti.LambdaRing.newtonPoly (constructor): The integral power-sum polynomial N_k.
- TauCeti.LambdaRing.newtonPoly_esymm (characterisation): N_k evaluated on elementary symmetric functions equals p_k.
- TauCeti.LambdaRing.newtonPoly_unique (extensionality): The defining power-sum identity determines N_k.

**Unit tests.**

- TauCeti.LambdaRing.newtonPoly_one_test (degenerate): N₁=a₁.
- TauCeti.LambdaRing.newtonPoly_two_test (computation): N₂=a₁²−2a₂.
- TauCeti.LambdaRing.newtonPoly_three_test (computation): N₃=a₁³−3a₁a₂+3a₃.

**Sources.**

- Kbook.II, II §4, Adams operations, p.28. The displayed integral Newton recursion; the symmetric-polynomial implementation is justified by the pinned Newton identities and algebraic independence.

## KTheoryLowDegrees:Z.4

Every target of the stage text is realised. Steinitz (Z.4/steinitz, with the zero module as its first alternative) rests on the ideal decomposition and on I ⊕ J ≅ A ⊕ IJ (Z.4/ideal-sum, via the coprime representative and the coprime identity, no Bass cancellation); the classification by rank and determinant and cancellation (Z.4/projective-classification); (rank, det) : K₀(A) ≃ ℤ ⊕ Pic(A) (Z.4/rank-pic-equivalence) with the explicit inverse (n, L) ↦ (n − 1)[A] + [L] for every integer n and its independence from representatives (Z.4/rank-pic-inverse, Z.4/ideal-class-representative-independence, Z.4/rank-class-group-equivalence); the multiplication law (m, L)(n, M) = (mn, LⁿMᵐ) and the ring isomorphism (Z.4/rank-pic-mul, Z.4/rank-pic-ring-equiv, the Dedekind case of Z.3's rank ⊕ det); the comparison with Mathlib's ClassGroup.equivPic (Z.4/class-group-pic-mk0). Specialisation: O_F (Z.4/k0-ring-of-integers) and O_{F,S} as Mathlib's Set.integer with Tau Ceti's Cl(O_S) ≅ Cl(R)/⟨[v]⟩ (Z.4/k0-s-integers); the actual localised ring R_M, identified with the S_M-integers (Z.4/localization-eq-integer), with its class-group quotient by the primes meeting M (Z.4/localization-class-group) and its K₀ map (Z.4/k0-localization). Induced maps: base change (Z.4/k0-base-change-coordinates, Z.4/pic-map-extended-hom), extension of number fields (Z.4/number-field-extension-k0), and finite-flat restriction of scalars through the normalised norm (Z.4/pic-norm, the transport of Tau Ceti's ClassGroup.relNorm) and the determinant formula det_R(Res Q) = N(det_S Q)·det_R(S)^{rank Q} (Z.4/restriction-determinant, from the index-ideal lemma Z.4/index-ideal-eq-rel-norm), on K₀ as (r, c) ↦ (dr, N(c)·𝔰^r) (Z.4/k0-transfer-coordinates) and with varying rank over a product of Dedekind domains (Z.4/restriction-determinant-product). The actual nonprincipal ideal (2, 1 + √−5) of ℤ[√−5] is computed at the rank/Pic level, with K₀ ≅ ℤ ⊕ ℤ/2 (Z.4/nonprincipal-ideal-class). Imported inputs: Z.1 (ring K₀, base change, transfer), Z.2 (rank, the domain and product cases, the module-level facts on (2, 1 + √−5)), Z.3 (determinant, its base change, the tensor identity and the ring H⁰ ⊕ Pic), Mathlib (Pic, ClassGroup, equivPic, relNorm) and Tau Ceti (S-integers, class-group norm, exterior top power, class number of ℚ(√−5)). The presentation of O_{F,S} as a localisation, the finite projectivity of O_{F′,S′} over O_{F,S}, and the projection formula are consumers' (ArithmeticKTheory N.1, KTheoryLowDegrees U.5), downstream of this stage. The source routes not followed are Bass cancellation (Weibel I.3.4) and the invariant factor theorem (Cohen 1.2.35, Milne 3.32); the replacements are Z.4/ideal-sum and the localisation argument of Z.4/index-ideal-eq-rel-norm.


### Coprime representative of an ideal class

**KTheoryLowDegrees:Z.4/coprime-ideal-representative** · lemma · implementation unchecked.

Let I and J be nonzero ideals of R. There are α ∈ K^× and a nonzero ideal J′ of R such that J′ = α·J as R-submodules of K and I + J′ = R. Multiplication by α restricts to an R-linear equivalence J ≃ J′. If I = R one may take α = 1 and J′ = J.

**Hypotheses.**

- R is a Dedekind domain (Mathlib's IsDedekindDomain R: a Noetherian integrally closed domain of Krull dimension at most one; a field is allowed) with fraction field K = FractionRing R.
- I and J are nonzero ideals of R.

**Construction or proof.**

- If I = R, take α = 1 and J′ = J.
- Otherwise apply IsDedekindDomain.exists_add_spanSingleton_mul_eq to the fractional ideals a = I, b = J and c = 1 (the fractional ideal R): a ≤ c because I is integral, and a, b ≠ 0. It gives α ∈ K with I + α·J = R in FractionalIdeal R⁰ K.
- In particular α·J ≤ R, so α·J is the image in K of the integral ideal J′ := {r ∈ R : algebraMap R K r ∈ α·J}, and the identity I + α·J = R pulls back to I + J′ = R in R (algebraMap R K is injective).
- α ≠ 0, since α = 0 would give I = R. Multiplication by α is an injective R-linear map K → K taking J onto α·J (FractionalIdeal.mem_singleton_mul), so it restricts to an R-linear equivalence J ≃ J′; J′ ≠ 0 because J ≠ 0.

**Acceptance.**

- When I = R, J itself is a valid representative.
- R = ℤ, I = 6ℤ, J = 4ℤ: α = 1/4 gives J′ = ℤ, which is coprime to 6ℤ.
- The scalar α is nonzero and J′ is nonzero; a zero scalar would make J′ = 0 (compare source issue E6 on Cohen, Lemma 1.2.20).

**Prerequisites.**

- mathlib:IsDedekindDomain.exists_add_spanSingleton_mul_eq
- mathlib:FractionalIdeal.mem_singleton_mul

**Sources.**

- Cohen, Corollary 1.2.11, printed p. 5 (PDF p. 19). The statement with m = I and a = J. Cohen proves it by weak approximation; the proof here uses Mathlib's approximation lemma for fractional ideals instead, which gives the same α.

### The coprime ideal sum identity

**KTheoryLowDegrees:Z.4/coprime-ideal-sum** · lemma · implementation unchecked.

Let R be a commutative ring and I, J ideals with I + J = R. The R-linear map f : I × J → R, (x, y) ↦ x + y, is surjective with a section; its kernel is {(z, −z) : z ∈ I ∩ J}, which is isomorphic to I ∩ J = IJ; hence I × J ≃ₗ[R] R × IJ. Explicitly, if i ∈ I and j ∈ J satisfy i + j = 1, the section is r ↦ (ri, rj) and the equivalence is v ↦ (f(v), v − (f(v)i, f(v)j)).

**Hypotheses.**

- R is a commutative ring; no Dedekind hypothesis is needed.
- I and J are ideals of R with I + J = R (IsCoprime I J).

**Construction or proof.**

- Ideal.isCoprime_iff_exists gives i ∈ I and j ∈ J with i + j = 1. The map s(r) = (ri, rj) is R-linear with f ∘ s = id, so f is surjective and split.
- The kernel of f consists of the pairs (z, −z) with z ∈ I and −z ∈ J, i.e. z ∈ I ∩ J; z ↦ (z, −z) is an R-linear equivalence I ∩ J ≃ ker f. The split surjection gives I × J ≃ R × ker f by v ↦ (f(v), v − s(f(v))).
- Ideal.mul_eq_inf_of_isCoprime gives I ∩ J = IJ, so I × J ≃ₗ[R] R × IJ.

**Acceptance.**

- I = R and J = 0: the identity reads R × 0 ≃ R × 0.
- R = ℤ, I = 2ℤ, J = 3ℤ: with i = −2 and j = 3 the section is r ↦ (−2r, 3r) and the kernel is identified with 6ℤ, so 2ℤ × 3ℤ ≃ ℤ × 6ℤ.
- In ℤ[√−5], I = (2, 1 + √−5) and J = (3, 1 − √−5) are coprime (3 − 2 = 1) with IJ = (1 − √−5) principal, so I × J ≃ A × A (used in Z.4/nonprincipal-ideal-class).

**Prerequisites.**

- mathlib:Ideal.isCoprime_iff_exists
- mathlib:Ideal.mul_eq_inf_of_isCoprime

**Sources.**

- Cohen, Lemma 1.2.20, proof, printed p. 9 (PDF p. 23). The split surjection f; the section is written explicitly from i + j = 1 instead of by projectivity of R.
- Cohen, Lemma 1.2.20, proof, printed p. 9 (PDF p. 23). The kernel computation and I ∩ J = IJ for coprime ideals; this part needs no Dedekind hypothesis.

### The two-ideal Steinitz identity

**KTheoryLowDegrees:Z.4/ideal-sum** · theorem · implementation unchecked.

For nonzero ideals I and J of R there is an R-linear equivalence I × J ≃ₗ[R] R × IJ.

**Hypotheses.**

- R is a Dedekind domain (Mathlib's IsDedekindDomain R: a Noetherian integrally closed domain of Krull dimension at most one; a field is allowed) with fraction field K = FractionRing R.
- I and J are nonzero ideals of R.

**Construction or proof.**

- Z.4/coprime-ideal-representative gives α ∈ K^× and a nonzero ideal J′ = α·J with I + J′ = R and J ≃ J′.
- Z.4/coprime-ideal-sum gives I × J′ ≃ R × IJ′.
- Inside K, IJ′ = I·(α·J) = α·(IJ) (FractionalIdeal.mem_singleton_mul), and multiplication by α restricts to an R-linear equivalence IJ ≃ IJ′.
- Compose: I × J ≃ I × J′ ≃ R × IJ′ ≃ R × IJ.

**Acceptance.**

- J = R: the identity is the swap I × R ≃ R × I.
- R = ℤ: 2ℤ × 3ℤ ≃ ℤ × 6ℤ.
- If I² is principal (for example I = (2, 1 + √−5) in ℤ[√−5], where I² = (2)), then I × I ≃ R × R although I itself is not free.

**Prerequisites.**

- KTheoryLowDegrees:Z.4/coprime-ideal-representative
- KTheoryLowDegrees:Z.4/coprime-ideal-sum
- mathlib:FractionalIdeal.mem_singleton_mul

**Sources.**

- Cohen, Lemma 1.2.20, printed p. 9 (PDF p. 23). The statement for nonzero integral ideals; Cohen's fractional ideals are nonzero.
- Cohen, Lemma 1.2.20, proof, printed p. 9 (PDF p. 23). The reduction to coprime ideals, which is the first and third proof steps here. The preceding sentence of the source scales by an arbitrary k ∈ R, which must be nonzero (source issue E6).

### Decomposition into ideals

**KTheoryLowDegrees:Z.4/projective-ideal-summands** · theorem · implementation unchecked.

Every finitely generated projective R-module P is R-linearly equivalent to a finite product I₁ × ⋯ × I_m of nonzero ideals of R, where m = rankℤ [P] (the rank of Z.2/rank-connected, equal to finrank_K (K ⊗[R] P) by Z.2/rank-domain). The empty product is allowed: m = 0 exactly when P = 0.

**Hypotheses.**

- R is a Dedekind domain (Mathlib's IsDedekindDomain R: a Noetherian integrally closed domain of Krull dimension at most one; a field is allowed) with fraction field K = FractionRing R.
- P is a finitely generated projective R-module in the universe of R.

**Construction or proof.**

- Module.Finite.exists_comp_eq_id_of_projective gives an injective R-linear g : P → R^N with a linear retraction. Argue by induction on N for finitely generated projective submodules of R^N.
- Let π : R^N → R be the last coordinate and I := π(g(P)), an ideal of R. If I = 0 then g(P) ⊆ R^{N−1} and the induction hypothesis applies.
- Otherwise I is a nonzero ideal; it is finitely generated (R is Noetherian) and torsion-free, hence flat (IsDedekindDomain.flat_iff_torsion_eq_bot), finitely presented (Module.finitePresentation_of_finite) and projective (Module.Flat.projective_of_finitePresentation).
- The surjection π ∘ g : P → I therefore splits (LinearMap.exists_rightInverse_of_surjective), so P ≃ ker × I. The kernel embeds in R^{N−1} and is a direct summand of P, hence finitely generated projective (Module.Projective.of_split); apply the induction hypothesis to it and append I.
- The count: rankℤ is additive (Z.2/rank-connected) and every nonzero ideal has rankℤ equal to 1 (Z.2/rank-domain), so m = rankℤ [P]; m = 0 exactly when P = 0 (the API item rank_of_eq_zero_iff of Z.2/rank-hom). No cancellation theorem is used.

**Acceptance.**

- P = 0: m = 0 and the product is empty; no artificial nonzero ideal is attached to the zero module.
- A nonzero ideal I is its own one-factor decomposition, m = 1.
- R^n decomposes as n copies of R.

**Prerequisites.**

- mathlib:Module.Finite.exists_comp_eq_id_of_projective
- mathlib:IsDedekindDomain.flat_iff_torsion_eq_bot
- mathlib:Module.finitePresentation_of_finite
- mathlib:Module.Flat.projective_of_finitePresentation
- mathlib:LinearMap.exists_rightInverse_of_surjective
- mathlib:Module.Projective.of_split
- KTheoryLowDegrees:Z.2/rank-domain
- KTheoryLowDegrees:Z.2/rank-connected
- KTheoryLowDegrees:Z.2/rank-hom

**Sources.**

- Kbook.I, §3, Dedekind domains, p. 18. The same induction, with a coordinate projection of a finite free module containing P in place of F^{n+1}, so that the summands are integral ideals rather than fractional ideals.

### Steinitz classification of projectives

**KTheoryLowDegrees:Z.4/steinitz** · theorem · implementation unchecked.

Let P be a finitely generated projective R-module. Either P = 0, which happens exactly when rankℤ [P] = 0, or there are n ≥ 0 and a nonzero ideal I of R with P ≃ₗ[R] (Fin n → R) × I. In the second case rankℤ [P] = n + 1 and Pic.mk R I = det P (the determinant of Z.3/determinant-projective); in particular the class of I in Pic(R), and hence in ClassGroup R (Z.4/class-group-pic-mk0), depends only on P.

**Hypotheses.**

- R is a Dedekind domain (Mathlib's IsDedekindDomain R: a Noetherian integrally closed domain of Krull dimension at most one; a field is allowed) with fraction field K = FractionRing R.
- K₀(R) is RingK0 R (KTheoryLowDegrees:Z.1/ring-k0: the split Grothendieck group of finiteProjectiveModules R), a commutative ring by KTheoryLowDegrees:Z.3/finite-projective-monoidal; [P] is the class of a finitely generated projective P. Spec R is connected (Z.2/rank-domain), rank is the integer rank RingK0.rankℤ of Z.2/rank-connected, and det is RingK0.detHom : K₀(R) → Pic(R) of Z.3/determinant-hom, with Pic(R) = CommRing.Pic R written multiplicatively.
- P is a finitely generated projective R-module.

**Construction or proof.**

- Z.4/projective-ideal-summands gives P ≃ I₁ × ⋯ × I_m with m = rankℤ [P]. If m = 0, P = 0.
- If m ≥ 1, apply Z.4/ideal-sum m − 1 times: I₁ × I₂ ≃ R × I₁I₂, then I₁I₂ × I₃ ≃ R × I₁I₂I₃, and so on. Products of nonzero ideals are nonzero because R is a domain. This gives P ≃ R^{m−1} × I with I = I₁⋯I_m and n = m − 1.
- By Z.3/determinant-congr, Z.3/determinant-sum, Z.3/determinant-free and Z.3/determinant-line, det P = det(R^n)·det(I) = Pic.mk R I. The rank is n + 1 because rankℤ [R] = 1 and rankℤ [I] = 1 (Z.2/rank-domain).

**Acceptance.**

- The first alternative is the zero module itself: Theorem 1.2.19 of the source is stated only for positive rank here (source issue on its n = 0 case).
- A rank-one nonprincipal ideal is the case n = 0 with I itself; it is not free.
- R² × I with I nonprincipal: n = 2 and det = Pic.mk R I.

**Prerequisites.**

- KTheoryLowDegrees:Z.4/projective-ideal-summands
- KTheoryLowDegrees:Z.4/ideal-sum
- KTheoryLowDegrees:Z.3/determinant-congr
- KTheoryLowDegrees:Z.3/determinant-sum
- KTheoryLowDegrees:Z.3/determinant-free
- KTheoryLowDegrees:Z.3/determinant-line
- KTheoryLowDegrees:Z.2/rank-domain
- KTheoryLowDegrees:Z.2/rank-connected

**Sources.**

- Cohen, Theorem 1.2.19, printed p. 9 (PDF p. 23). The positive-rank statement. The printed form has R^{n−1} at n = 0; the zero module is the first alternative here.
- Cohen, Proof of Theorem 1.2.19, printed p. 10 (PDF p. 24). The source's proof treats rank zero separately, as this node does.
- Kbook.I, §3, Dedekind domains, p. 18. The ideal is the determinant. Weibel reaches R^n ⊕ I through Proposition 3.4 (a cancellation theorem); here it comes from Z.4/ideal-sum.

### Classification by rank and determinant

**KTheoryLowDegrees:Z.4/projective-classification** · theorem · implementation unchecked.

For finite projective modules P,Q over a Dedekind domain R, P ≃ₗ[R] Q if and only if rankℤ[P]=rankℤ[Q] and det P=det Q.

**Hypotheses.**

- R is a Dedekind domain (Mathlib's IsDedekindDomain R: a Noetherian integrally closed domain of Krull dimension at most one; a field is allowed) with fraction field K = FractionRing R.
- K₀(R) is RingK0 R (KTheoryLowDegrees:Z.1/ring-k0: the split Grothendieck group of finiteProjectiveModules R), a commutative ring by KTheoryLowDegrees:Z.3/finite-projective-monoidal; [P] is the class of a finitely generated projective P. Spec R is connected (Z.2/rank-domain), rank is the integer rank RingK0.rankℤ of Z.2/rank-connected, and det is RingK0.detHom : K₀(R) → Pic(R) of Z.3/determinant-hom, with Pic(R) = CommRing.Pic R written multiplicatively.
- P,Q are finite projective R-modules.

**Construction or proof.**

- ⇒: isomorphic modules have equal classes (TauCeti.SplitK0.of_congr) and equal determinants (Z.3/determinant-congr).
- ⇐: if the common rank is 0 then P = Q = 0 (Z.4/steinitz). Otherwise Z.4/steinitz gives P ≃ R^n × I and Q ≃ R^n × J with Pic.mk R I = det P = det Q = Pic.mk R J; CommRing.Pic.mk_eq_mk_iff gives I ≃ J, hence P ≃ Q.

**Acceptance.**

- A nonprincipal ideal I and R both have rank one; the determinant separates them.
- Cancellation of a free summand: I × R ≃ J × R forces I ≃ J (Cohen, Corollary 1.2.24).
- For rank zero the rank alone decides: the only such module is 0.

**Prerequisites.**

- KTheoryLowDegrees:Z.4/steinitz
- KTheoryLowDegrees:Z.3/determinant-congr
- KTheoryLowDegrees:Z.3/determinant-hom
- KTheoryLowDegrees:Z.3/determinant-hom-of
- KTheoryLowDegrees:Z.2/rank-connected
- mathlib:CommRing.Pic.mk_eq_mk_iff
- tauceti:TauCeti.SplitK0.of_congr

**Sources.**

- Kbook.I, Proposition 3.4, p. 17. The classification for Dedekind domains; Weibel proves it for every one-dimensional Noetherian ring through Bass cancellation, and here it follows from Z.4/steinitz.
- Cohen, Corollary 1.2.26, printed p. 12 (PDF p. 26). The cancellation corollary.
- Cohen, Corollary 1.2.24, printed p. 11 (PDF p. 25). Uniqueness of the Steinitz ideal class, which is the step ⇐.

### Additive class formula for tensor products of lines

**KTheoryLowDegrees:Z.4/line-class-product** · lemma · implementation unchecked.

For invertible R-modules L and M: [L ⊗[R] M] = [L] + [M] − [R] in K₀(R). Equivalently, ([L] − [R])·([M] − [R]) = 0 in the ring K₀(R).

**Hypotheses.**

- R is a Dedekind domain (Mathlib's IsDedekindDomain R: a Noetherian integrally closed domain of Krull dimension at most one; a field is allowed) with fraction field K = FractionRing R.
- K₀(R) is RingK0 R (KTheoryLowDegrees:Z.1/ring-k0: the split Grothendieck group of finiteProjectiveModules R), a commutative ring by KTheoryLowDegrees:Z.3/finite-projective-monoidal; [P] is the class of a finitely generated projective P. Spec R is connected (Z.2/rank-domain), rank is the integer rank RingK0.rankℤ of Z.2/rank-connected, and det is RingK0.detHom : K₀(R) → Pic(R) of Z.3/determinant-hom, with Pic(R) = CommRing.Pic R written multiplicatively.
- L and M are invertible R-modules (Module.Invertible), hence finitely generated projective.

**Construction or proof.**

- Module.Invertible.exists_linearEquiv_ideal applies because FractionRing R is a field, whose Picard group is trivial (Mathlib's instance for local rings): L ≃ I and M ≃ J for ideals I, J of R, both nonzero because L and M are faithful (R is nontrivial).
- Z.4/ideal-sum gives I × J ≃ R × IJ. The invertible submodules of K attached to I and J (FractionalIdeal.mk0 and FractionalIdeal.unitsMulEquivSubmodule) satisfy I ⊗ J ≃ IJ by Submodule.tensorEquivMul, so I × J ≃ R × (L ⊗ M).
- TauCeti.SplitK0.of_congr and TauCeti.SplitK0.of_biprod give [L] + [M] = [R] + [L ⊗ M].
- TauCeti.SplitK0.of_mul_of gives [L]·[M] = [L ⊗ M] in the ring K₀(R); expanding, ([L] − [R])([M] − [R]) = [L ⊗ M] − [L] − [M] + [R] = 0.

**Acceptance.**

- L = M = R: [R] = [R] + [R] − [R].
- For a nontrivial class L, [L] − [R] ≠ 0 while its square is zero.
- [L] + [Dual R L] = 2[R], since L ⊗ Dual R L ≃ R (CommRing.Pic.mk_dual).

**Prerequisites.**

- KTheoryLowDegrees:Z.4/ideal-sum
- mathlib:Module.Invertible.exists_linearEquiv_ideal
- mathlib:Submodule.tensorEquivMul
- mathlib:FractionalIdeal.unitsMulEquivSubmodule
- mathlib:FractionalIdeal.mk0
- mathlib:CommRing.Pic.mul_eq_tensor
- tauceti:TauCeti.SplitK0.of_congr
- tauceti:TauCeti.SplitK0.of_biprod
- tauceti:TauCeti.SplitK0.of_mul_of
- KTheoryLowDegrees:Z.3/finite-projective-monoidal

**Sources.**

- Kbook.II, Corollary 2.6.2, p. 11. For a Dedekind domain the square-zero ideal is the rank-zero part; this lemma is that statement in K₀(R) itself, proved from Z.4/ideal-sum.
- Kbook.I, Proposition 3.5, p. 17. Line bundles over a domain are ideals, and I ⊗ J ≅ IJ, the two facts used in the first two steps.

### The reduced class of a line bundle

**KTheoryLowDegrees:Z.4/reduced-line-class** · construction · implementation unchecked.

RingK0.picToK0 : Additive (Pic R) →+ K₀(R) sends Additive.ofMul L to [L] − [R], where [L] is the class of the representative module CommRing.Pic.AsModule L (invertible, hence finitely generated projective). It is a group homomorphism from the multiplicative group Pic(R) to the additive group K₀(R); its image lies in ker rankℤ, det (picToK0 (Additive.ofMul L)) = L, and picToK0 a · picToK0 b = 0 for all a, b.

**Hypotheses.**

- R is a Dedekind domain (Mathlib's IsDedekindDomain R: a Noetherian integrally closed domain of Krull dimension at most one; a field is allowed) with fraction field K = FractionRing R.
- K₀(R) is RingK0 R (KTheoryLowDegrees:Z.1/ring-k0: the split Grothendieck group of finiteProjectiveModules R), a commutative ring by KTheoryLowDegrees:Z.3/finite-projective-monoidal; [P] is the class of a finitely generated projective P. Spec R is connected (Z.2/rank-domain), rank is the integer rank RingK0.rankℤ of Z.2/rank-connected, and det is RingK0.detHom : K₀(R) → Pic(R) of Z.3/determinant-hom, with Pic(R) = CommRing.Pic R written multiplicatively.

**Construction or proof.**

- Well defined: the representative of L is invertible, hence Module.Finite and Module.Projective (Mathlib instances), so [L] ∈ K₀(R); it depends only on L up to isomorphism (TauCeti.SplitK0.of_congr).
- Zero: the representative of 1 is isomorphic to R (CommRing.Pic.mk_eq_one_iff with mk_eq_self), so the image of 1 is [R] − [R] = 0.
- Additivity: the representative of L·M is isomorphic to L ⊗ M (CommRing.Pic.mul_eq_tensor), and Z.4/line-class-product gives [L ⊗ M] − [R] = ([L] − [R]) + ([M] − [R]).
- Rank and determinant: rankℤ [L] = 1 (the API item rank_of_invertible of Z.2/rank-hom) and det [L] = L (Z.3/determinant-line with mk_eq_self), while rankℤ [R] = 1 and det [R] = 1.
- Square zero: Z.4/line-class-product.

**Acceptance.**

- picToK0 (Additive.ofMul 1) = 0.
- picToK0 (Additive.ofMul L⁻¹) = [R] − [L], i.e. [Dual R L] = 2[R] − [L].
- det ∘ picToK0 = id, so picToK0 is injective.

**Prerequisites.**

- KTheoryLowDegrees:Z.4/line-class-product
- mathlib:CommRing.Pic.AsModule
- mathlib:CommRing.Pic.mk_eq_one_iff
- mathlib:CommRing.Pic.mk_eq_self
- mathlib:CommRing.Pic.mul_eq_tensor
- tauceti:TauCeti.SplitK0.of_congr
- KTheoryLowDegrees:Z.2/rank-hom
- KTheoryLowDegrees:Z.2/rank-connected
- KTheoryLowDegrees:Z.3/determinant-line
- KTheoryLowDegrees:Z.3/determinant-hom
- KTheoryLowDegrees:Z.1/ring-k0

**Uses.**

- Z.4/rank-pic-equivalence: the inverse is (n, L) ↦ n•[R] + picToK0 (Additive.ofMul L)
- Z.4/k0-localization: the kernel of K₀(R) → K₀(R_M) is generated by the reduced classes [v] − [R] of the primes meeting M
- ArithmeticKTheory:N.2/the-three-classical-rows and SchemeKTheoryOperations:S.3/dedekind-localisation-sequence: e_𝔭 ↦ [R/𝔭] = [R] − [𝔭] = −picToK0 (Additive.ofMul (Pic.mk R 𝔭))
- KTheoryLowDegrees:Z.3/gamma-first-graded: for Dedekind R, F²_γ = 0 and picToK0 lifts the map L ↦ [L] − 1 into F¹_γ = ker rankℤ

**Public API.**

- TauCeti.RingK0.picToK0 (constructor): picToK0 : Additive (Pic R) →+ RingK0 R.
- TauCeti.RingK0.picToK0_apply (simp): picToK0 (Additive.ofMul L) = [L] − [R].
- TauCeti.RingK0.picToK0_ofAdd_mk (simp): For an invertible R-module N: picToK0 (Additive.ofMul (Pic.mk R N)) = [N] − [R].
- TauCeti.RingK0.rankℤ_picToK0 (simp): rankℤ (picToK0 a) = 0.
- TauCeti.RingK0.det_picToK0 (simp): det (picToK0 (Additive.ofMul L)) = L.
- TauCeti.RingK0.picToK0_mul_picToK0 (relation): picToK0 a * picToK0 b = 0 in the ring K₀(R).
- TauCeti.RingK0.picToK0_injective (other): picToK0 is injective, with left inverse Additive.ofMul ∘ det.
- TauCeti.RingK0.range_picToK0 (characterisation): The range of picToK0 is ker rankℤ.

**Unit tests.**

- TauCeti.RingK0.picToK0_zero_test (degenerate): picToK0 0 = 0: the trivial line bundle has reduced class [R] − [R].
- TauCeti.RingK0.picToK0_dual_test (computation): [L] + [Dual R L] = 2 • [R] for every invertible L, i.e. picToK0 (Additive.ofMul L⁻¹) = −picToK0 (Additive.ofMul L).
- TauCeti.RingK0.picToK0_det_test (compatibility): RingK0.detHom (picToK0 (Additive.ofMul L)) = L (Z.3's determinant) and RingK0.rankℤ (picToK0 (Additive.ofMul L)) = 0 (Z.2's rank).
- TauCeti.RingK0.picToK0_not_class_test (non-example): L ↦ [L] without subtracting [R] is not additive: it sends 1 · 1 = 1 to [R], whereas [R] + [R] has rank 2.

**Sources.**

- Kbook.II, Lemma 2.3.1, p. 8. The rank-one case n = 1; additivity over a Dedekind domain is Z.4/line-class-product.
- Kbook.II, Definition 2.3, p. 8. The rank-zero summand of K₀(R); picToK0 is its identification with Pic(R) for a Dedekind domain.

### Rank and determinant normal form

**KTheoryLowDegrees:Z.4/projective-class-normal-form** · lemma · implementation unchecked.

For every finitely generated projective R-module P, including P = 0: [P] = (rankℤ [P] − 1)•[R] + [det P] in K₀(R), where [det P] is the class of the representative module of det P ∈ Pic(R). Equivalently [P] = rankℤ [P]•[R] + picToK0 (Additive.ofMul (det P)).

**Hypotheses.**

- R is a Dedekind domain (Mathlib's IsDedekindDomain R: a Noetherian integrally closed domain of Krull dimension at most one; a field is allowed) with fraction field K = FractionRing R.
- K₀(R) is RingK0 R (KTheoryLowDegrees:Z.1/ring-k0: the split Grothendieck group of finiteProjectiveModules R), a commutative ring by KTheoryLowDegrees:Z.3/finite-projective-monoidal; [P] is the class of a finitely generated projective P. Spec R is connected (Z.2/rank-domain), rank is the integer rank RingK0.rankℤ of Z.2/rank-connected, and det is RingK0.detHom : K₀(R) → Pic(R) of Z.3/determinant-hom, with Pic(R) = CommRing.Pic R written multiplicatively.
- P is a finitely generated projective R-module.

**Construction or proof.**

- P = 0: rankℤ [0] = 0 and det 0 = 1, so the right side is −[R] + [R] = 0.
- P ≠ 0: Z.4/steinitz gives P ≃ R^n × I with rankℤ [P] = n + 1 and det P = Pic.mk R I. Then [P] = n•[R] + [I] (TauCeti.SplitK0.of_biprod and the API item of_free of Z.1/ring-k0).
- The representative module of Pic.mk R I is isomorphic to I (CommRing.Pic.mk_eq_mk_iff with mk_eq_self), so [det P] = [I], and n = rankℤ [P] − 1. The second form is the definition of Z.4/reduced-line-class.

**Acceptance.**

- P = 0: the integer coefficient is −1 and the line contributes +[R].
- P = I a nonprincipal ideal: the formula reads [I] = [I]; it does not collapse [I] to [R].
- P = R^n: [P] = (n − 1)[R] + [R].

**Prerequisites.**

- KTheoryLowDegrees:Z.4/steinitz
- KTheoryLowDegrees:Z.4/reduced-line-class
- KTheoryLowDegrees:Z.3/determinant-free
- KTheoryLowDegrees:Z.3/determinant-line
- KTheoryLowDegrees:Z.3/determinant-sum
- mathlib:CommRing.Pic.mk_eq_mk_iff
- tauceti:TauCeti.SplitK0.of_biprod
- KTheoryLowDegrees:Z.1/ring-k0
- KTheoryLowDegrees:Z.2/rank-connected

**Sources.**

- Kbook.I, Proposition 3.4, p. 17. The class-level form of P ≅ L ⊕ R^f with L = det P and f = rank P − 1; the zero module is added.

### Rank and Picard group classification

**KTheoryLowDegrees:Z.4/rank-pic-equivalence** · construction · implementation unchecked.

RingK0.rankPicEquiv : K₀(R) ≃+ ℤ × Additive (Pic R), x ↦ (rankℤ x, Additive.ofMul (det x)). Its inverse sends (n, Additive.ofMul L) to (n − 1)•[R] + [L] = n•[R] + picToK0 (Additive.ofMul L) for every n ∈ ℤ, negative n included, and every L ∈ Pic R; the inverse depends on L only through its class, not on the representative module.

**Hypotheses.**

- R is a Dedekind domain (Mathlib's IsDedekindDomain R: a Noetherian integrally closed domain of Krull dimension at most one; a field is allowed) with fraction field K = FractionRing R.
- K₀(R) is RingK0 R (KTheoryLowDegrees:Z.1/ring-k0: the split Grothendieck group of finiteProjectiveModules R), a commutative ring by KTheoryLowDegrees:Z.3/finite-projective-monoidal; [P] is the class of a finitely generated projective P. Spec R is connected (Z.2/rank-domain), rank is the integer rank RingK0.rankℤ of Z.2/rank-connected, and det is RingK0.detHom : K₀(R) → Pic(R) of Z.3/determinant-hom, with Pic(R) = CommRing.Pic R written multiplicatively.

**Construction or proof.**

- The forward map is additive: rankℤ is additive (Z.2/rank-connected) and det is an additive-to-multiplicative homomorphism (Z.3/determinant-hom).
- The inverse ψ(n, a) = n•[R] + picToK0 a is additive (Z.4/reduced-line-class); it depends only on the class of L (TauCeti.SplitK0.of_congr).
- Forward ∘ ψ = id: rankℤ [R] = 1, rankℤ ∘ picToK0 = 0, det [R] = 1 (Z.3/determinant-free) and det ∘ picToK0 = id.
- ψ ∘ forward = id: both sides are additive endomorphisms of K₀(R) and agree on every class [P] by Z.4/projective-class-normal-form; conclude by the extensionality item RingK0.hom_ext of Z.1/ring-k0 (uniqueness in TauCeti.SplitK0.liftEquiv).

**Acceptance.**

- The zero module and negative integers are covered: (0, 1) ↦ 0 and (−1, 1) ↦ −[R].
- [R] − [I] ↦ (0, Additive.ofMul (Pic.mk R I)⁻¹) for a nonzero ideal I, the normalisation SchemeKTheoryOperations S.3 and ArithmeticKTheory N.2 use for e_𝔭 ↦ [R/𝔭].
- The actual module and K₀ carriers are kept: no quotient of isomorphism classes is introduced.

**Prerequisites.**

- KTheoryLowDegrees:Z.4/line-class-product
- KTheoryLowDegrees:Z.4/reduced-line-class
- KTheoryLowDegrees:Z.4/projective-class-normal-form
- KTheoryLowDegrees:Z.3/determinant-hom
- KTheoryLowDegrees:Z.3/determinant-hom-of
- KTheoryLowDegrees:Z.3/determinant-line
- KTheoryLowDegrees:Z.3/determinant-free
- tauceti:TauCeti.SplitK0.liftEquiv
- tauceti:TauCeti.SplitK0.of_congr
- KTheoryLowDegrees:Z.2/rank-connected
- KTheoryLowDegrees:Z.2/rank-domain
- KTheoryLowDegrees:Z.2/rank-hom
- KTheoryLowDegrees:Z.1/ring-k0

**Uses.**

- Weibel, K-book II Corollary 2.6.3: computes K₀ of a Dedekind domain with an explicit inverse and an ideal-class coordinate
- ArithmeticKTheory:N.1/norms-transfers-and-pullbacks and N.2: K₀(O_{F,S}) ≅ ℤ ⊕ Cl, and e_𝔭 ↦ (0, [𝔭]⁻¹) in the classical rows
- SchemeKTheoryOperations:S.3/dedekind-localisation-sequence: identifies the image of ⊕_𝔭 ℤ in K₀(R) with the class group
- ClassicalArithmeticCompletion:CA.7/locally-free-class-group: for Λ = A the locally free class group is the rank-zero part Pic(A) = Cl(A)
- KTheoryLowDegrees:Z.5 and Z.6: the affine case of the curve theorem and the nonprincipal-ideal test

**Public API.**

- TauCeti.RingK0.rankPicEquiv (equivalence): rankPicEquiv : RingK0 R ≃+ ℤ × Additive (Pic R).
- TauCeti.RingK0.rankPicEquiv_apply (simp): rankPicEquiv x = (rankℤ x, Additive.ofMul (det x)).
- TauCeti.RingK0.rankPicEquiv_symm (constructor): rankPicEquiv.symm (n, Additive.ofMul L) = (n − 1)•[R] + [L] for all n ∈ ℤ.
- TauCeti.RingK0.rankPicEquiv_ext (extensionality): x = y ↔ rankℤ x = rankℤ y ∧ det x = det y.
- TauCeti.RingK0.rankPicEquiv_of (simp): rankPicEquiv [P] = (Module.finrank R P, Additive.ofMul (det P)) (Z.2/rank-domain).
- TauCeti.RingK0.rankPicEquiv_one (simp): rankPicEquiv [R] = (1, 0).
- TauCeti.RingK0.rankPicEquiv_symm_zero_ofAdd (simp): rankPicEquiv.symm (0, Additive.ofMul L) = picToK0 (Additive.ofMul L) = [L] − [R].
- TauCeti.RingK0.ker_rankℤ_equiv_pic (characterisation): ker rankℤ ≃+ Additive (Pic R) by det, with inverse picToK0 (Weibel's K̃₀(R) ≅ Pic(R)).
- TauCeti.RingK0.rankPicEquiv_isPrincipalIdealRing (compatibility): If R is a PID, Pic R is trivial and the first coordinate is Z.2/pid-k0's rankℤ : RingK0 R ≃+ ℤ.

**Unit tests.**

- TauCeti.RingK0.rankPic_zero_test (degenerate): rankPicEquiv 0 = (0, 0), i.e. the zero class has rank 0 and determinant 1.
- TauCeti.RingK0.rankPic_negative_test (computation): rankPicEquiv.symm (−1, 0) = −[R].
- TauCeti.RingK0.rankPic_nontrivial_test (non-example): For L ≠ 1 in Pic R, the rank-zero class [L] − [R] is nonzero: a rank-only classification would identify it with 0.
- TauCeti.RingK0.rankPic_pid_test (compatibility): For R = ℤ: Pic ℤ is trivial and rankPicEquiv [ℤ³] = (3, 0), matching Z.2/pid-k0.
- TauCeti.RingK0.rankPic_ideal_test (characterisation): For a nonzero ideal I: rankPicEquiv ([R] − [I]) = (0, Additive.ofMul (Pic.mk R I)⁻¹).

**Sources.**

- Kbook.II, Corollary 2.6.3, p. 11. A Dedekind domain is one-dimensional Noetherian (or a field) with connected spectrum, so H⁰(R) = ℤ.
- Kbook.II, Definition 2.3, p. 8. The splitting K₀ = H⁰ ⊕ K̃₀ behind the two coordinates.
- Milne.ANT.2020, Theorem 3.31 and following remarks, printed p. 58 (PDF p. 60). The same computation stated for the Grothendieck group of all finitely generated modules, which agrees here.

### Coordinates of a virtual class

**KTheoryLowDegrees:Z.4/rank-pic-apply** · lemma · implementation unchecked.

For every x ∈ K₀(R): rankPicEquiv x = (rankℤ x, Additive.ofMul (det x)); for a finitely generated projective P, rankPicEquiv [P] = (Module.finrank R P, Additive.ofMul (det P)).

**Hypotheses.**

- R is a Dedekind domain (Mathlib's IsDedekindDomain R: a Noetherian integrally closed domain of Krull dimension at most one; a field is allowed) with fraction field K = FractionRing R.
- K₀(R) is RingK0 R (KTheoryLowDegrees:Z.1/ring-k0: the split Grothendieck group of finiteProjectiveModules R), a commutative ring by KTheoryLowDegrees:Z.3/finite-projective-monoidal; [P] is the class of a finitely generated projective P. Spec R is connected (Z.2/rank-domain), rank is the integer rank RingK0.rankℤ of Z.2/rank-connected, and det is RingK0.detHom : K₀(R) → Pic(R) of Z.3/determinant-hom, with Pic(R) = CommRing.Pic R written multiplicatively.

**Construction or proof.**

- Unfold Z.4/rank-pic-equivalence; for a class [P] use Z.3/determinant-hom-of and Z.2/rank-domain.

**Acceptance.**

- rankPicEquiv [R] = (1, 0).
- rankPicEquiv [I] = (1, Additive.ofMul (Pic.mk R I)) for a nonzero ideal I.

**Prerequisites.**

- KTheoryLowDegrees:Z.4/rank-pic-equivalence
- KTheoryLowDegrees:Z.3/determinant-hom-of
- KTheoryLowDegrees:Z.2/rank-domain

**Sources.**

- Kbook.II, Corollary 2.6.3, p. 11. Evaluation of the isomorphism rank ⊕ det.

### Inverse rank/Pic coordinates

**KTheoryLowDegrees:Z.4/rank-pic-inverse** · lemma · implementation unchecked.

rankPicEquiv.symm (n, Additive.ofMul L) = (n − 1)•[R] + [L] for every n ∈ ℤ and L ∈ Pic R.

**Hypotheses.**

- R is a Dedekind domain (Mathlib's IsDedekindDomain R: a Noetherian integrally closed domain of Krull dimension at most one; a field is allowed) with fraction field K = FractionRing R.
- K₀(R) is RingK0 R (KTheoryLowDegrees:Z.1/ring-k0: the split Grothendieck group of finiteProjectiveModules R), a commutative ring by KTheoryLowDegrees:Z.3/finite-projective-monoidal; [P] is the class of a finitely generated projective P. Spec R is connected (Z.2/rank-domain), rank is the integer rank RingK0.rankℤ of Z.2/rank-connected, and det is RingK0.detHom : K₀(R) → Pic(R) of Z.3/determinant-hom, with Pic(R) = CommRing.Pic R written multiplicatively.

**Construction or proof.**

- Unfold the inverse of Z.4/rank-pic-equivalence and Z.4/reduced-line-class.

**Acceptance.**

- n = 0: [L] − [R].
- n = −1 and L = 1: −[R].

**Prerequisites.**

- KTheoryLowDegrees:Z.4/rank-pic-equivalence
- KTheoryLowDegrees:Z.4/reduced-line-class

**Sources.**

- Kbook.I, Proposition 3.4, p. 17. The inverse is read off from P ≅ L ⊕ R^f with f = rank P − 1.

### Multiplication law in rank/Pic coordinates

**KTheoryLowDegrees:Z.4/rank-pic-mul** · theorem · implementation unchecked.

For x, y ∈ K₀(R) with rankPicEquiv x = (m, Additive.ofMul L) and rankPicEquiv y = (n, Additive.ofMul M): rankPicEquiv (x·y) = (m·n, Additive.ofMul (Lⁿ·Mᵐ)), integer exponents. Equivalently rankℤ(xy) = rankℤ x · rankℤ y and det(xy) = det(x)^{rankℤ y}·det(y)^{rankℤ x}.

**Hypotheses.**

- R is a Dedekind domain (Mathlib's IsDedekindDomain R: a Noetherian integrally closed domain of Krull dimension at most one; a field is allowed) with fraction field K = FractionRing R.
- K₀(R) is RingK0 R (KTheoryLowDegrees:Z.1/ring-k0: the split Grothendieck group of finiteProjectiveModules R), a commutative ring by KTheoryLowDegrees:Z.3/finite-projective-monoidal; [P] is the class of a finitely generated projective P. Spec R is connected (Z.2/rank-domain), rank is the integer rank RingK0.rankℤ of Z.2/rank-connected, and det is RingK0.detHom : K₀(R) → Pic(R) of Z.3/determinant-hom, with Pic(R) = CommRing.Pic R written multiplicatively.

**Construction or proof.**

- rankℤ is multiplicative: Z.3/rank-ring-hom specialised to the constant functions of the connected spectrum (Z.2/rank-connected).
- det(xy) = det(x)^{rank y}·det(y)^{rank x}: Z.3/determinant-mul, where the locally constant exponents are the constants rankℤ y and rankℤ x (Z.3/pic-locally-constant-power).
- Combine with Z.4/rank-pic-apply.

**Acceptance.**

- (1, L)(1, M) = (1, LM): [L]·[M] = [L ⊗ M] for invertible L and M.
- (2, 1)(1, L) = (2, L²): det([R²]·[L]) = L², not L; det is not multiplicative.
- (0, L)(0, M) = (0, 1). Cross-check without Z.3/determinant-mul: Z.4/line-class-product gives ([L] − [R])([M] − [R]) = 0, and writing x = m[R] + picToK0 L, y = n[R] + picToK0 M gives xy = mn[R] + picToK0(Lⁿ Mᵐ).

**Prerequisites.**

- KTheoryLowDegrees:Z.4/rank-pic-equivalence
- KTheoryLowDegrees:Z.4/rank-pic-apply
- KTheoryLowDegrees:Z.4/line-class-product
- KTheoryLowDegrees:Z.4/reduced-line-class
- KTheoryLowDegrees:Z.3/rank-ring-hom
- KTheoryLowDegrees:Z.3/determinant-mul
- KTheoryLowDegrees:Z.3/pic-locally-constant-power
- KTheoryLowDegrees:Z.2/rank-connected

**Sources.**

- Kbook.II, Definition 2.6.1, p. 11. The determinant of a product has exponents given by the ranks (Ex. I.3.4).
- Kbook.I, Exercise 3.4, p. 24. The tensor determinant identity behind Z.3/determinant-mul.

### The ring H⁰(R) ⊕ Pic(R) of a Dedekind domain

**KTheoryLowDegrees:Z.4/rank-pic-ring-equiv** · construction · implementation unchecked.

For a Dedekind domain R the surjective ring homomorphism rank ⊕ det : K₀(R) → H⁰(Spec R, ℤ) ⊕ Pic(R) of Z.3/rank-det-ring-hom (onto the ring Z.3/rank-det-ring, (a, L)(b, M) = (ab, L^b M^a)) is bijective: SK₀(R) = 0. Composed with H⁰(Spec R, ℤ) ≅ ℤ (constant functions, Spec R connected) it is a ring isomorphism RingK0.rankPicRingEquiv : K₀(R) ≃+* ℤ ⊕ Pic(R) whose underlying additive equivalence is rankPicEquiv, with (m, L)(n, M) = (mn, Lⁿ Mᵐ) and square-zero ideal 0 ⊕ Pic(R).

**Hypotheses.**

- R is a Dedekind domain (Mathlib's IsDedekindDomain R: a Noetherian integrally closed domain of Krull dimension at most one; a field is allowed) with fraction field K = FractionRing R.
- K₀(R) is RingK0 R (KTheoryLowDegrees:Z.1/ring-k0: the split Grothendieck group of finiteProjectiveModules R), a commutative ring by KTheoryLowDegrees:Z.3/finite-projective-monoidal; [P] is the class of a finitely generated projective P. Spec R is connected (Z.2/rank-domain), rank is the integer rank RingK0.rankℤ of Z.2/rank-connected, and det is RingK0.detHom : K₀(R) → Pic(R) of Z.3/determinant-hom, with Pic(R) = CommRing.Pic R written multiplicatively.

**Construction or proof.**

- Z.3/rank-det-ring-hom is a ring homomorphism with kernel SK₀(R) (Z.3/sk-zero).
- Its kernel is zero: an element of rank 0 and determinant 1 is 0 by Z.4/rank-pic-equivalence.
- H⁰(Spec R, ℤ) = LocallyConstant (PrimeSpectrum R) ℤ is ℤ via constants because Spec R is connected (Z.2/rank-connected, Z.2/rank-domain); under it the ring homomorphism is x ↦ (rankℤ x, det x), which is bijective by Z.4/rank-pic-equivalence. Package the bijective ring homomorphism as RingEquiv.ofBijective.
- The multiplication formula is Z.4/rank-pic-mul.

**Acceptance.**

- [R] ↦ (1, 1), the unit.
- For invertible L: [L]² = 2[L] − [R], since (1, L)² = (1, L²).
- If Pic R is trivial (R a PID), the ring is ℤ.

**Prerequisites.**

- KTheoryLowDegrees:Z.4/rank-pic-equivalence
- KTheoryLowDegrees:Z.4/rank-pic-mul
- KTheoryLowDegrees:Z.3/rank-det-ring-hom
- KTheoryLowDegrees:Z.3/rank-det-ring
- KTheoryLowDegrees:Z.3/sk-zero
- KTheoryLowDegrees:Z.2/rank-connected
- KTheoryLowDegrees:Z.2/rank-domain

**Uses.**

- Weibel, K-book II Corollaries 2.6.2–2.6.3: the ring structure on K₀ of a Dedekind domain
- ArithmeticKTheory:N.1/norms-transfers-and-pullbacks: i_*i^* is multiplication by (d, 𝔰) in this ring
- Z.4/k0-transfer-coordinates: transfer ∘ base change is multiplication by [S] = (d, 𝔰)
- KTheoryLowDegrees:Z.5/curve-k-zero-ring: the affine case of the curve ring structure

**Public API.**

- TauCeti.RingK0.rankPicRingEquiv (equivalence): rankPicRingEquiv : RingK0 R ≃+* (ℤ ⊕ Pic R with the square-zero multiplication of Z.3/rank-det-ring).
- TauCeti.RingK0.rankPicRingEquiv_toAddEquiv (compatibility): The underlying additive equivalence is rankPicEquiv.
- TauCeti.RingK0.rankPicRingEquiv_fst (simp): The first coordinate of rankPicRingEquiv x is rankℤ x.
- TauCeti.RingK0.rankPicRingEquiv_snd (simp): The second coordinate of rankPicRingEquiv x is det x.
- TauCeti.RingK0.rankPicRingEquiv_symm_one (simp): rankPicRingEquiv.symm (1, 1) = [R] = 1.
- TauCeti.RingK0.sk0_eq_bot (characterisation): SK₀(R) = 0 (Z.3/sk-zero) for a Dedekind domain R.
- TauCeti.RingK0.ker_rankℤ_sq_eq_bot (relation): The product of two rank-zero classes is zero: (ker rankℤ)² = 0.
- TauCeti.RingK0.rankℤ_ringHom (other): rankℤ : K₀(R) →+* ℤ is a ring homomorphism, split by n ↦ n•[R].

**Unit tests.**

- TauCeti.RingK0.rankPicRing_line_sq_test (computation): For every invertible L: [L] * [L] = 2 • [L] − [R] in K₀(R).
- TauCeti.RingK0.rankPicRing_pid_test (degenerate): If Pic R is trivial (for example R = ℤ), rankPicRingEquiv makes K₀(R) ≃+* ℤ.
- TauCeti.RingK0.rankPicRing_det_not_mul_test (non-example): For a nontrivial Picard class L≠1, det (2•[R] * [L]) = L² ≠ L = det (2•[R]) · det [L]. The rank–Pic pair is multiplicative for the displayed twisted product; determinant alone does not preserve tensor multiplication in this example.
- TauCeti.RingK0.rankPicRing_rank_test (compatibility): The first coordinate is Z.2's RingK0.rankℤ and the second is Z.3's RingK0.detHom; for R a field this is Z.2/division-ring-k0.

**Sources.**

- Kbook.II, Corollary 2.6.2, p. 11. The ring and the ring homomorphism, for every commutative ring.
- Kbook.II, Corollary 2.6.3, p. 11. Bijectivity in dimension one, here for Dedekind domains.

### The ideal class of I is the Picard class of I

**KTheoryLowDegrees:Z.4/class-group-pic-mk0** · lemma · implementation unchecked.

For every nonzero ideal I of R: ClassGroup.equivPic R (ClassGroup.mk0 I) = Pic.mk R I, the Picard class of the R-module I.

**Hypotheses.**

- R is a Dedekind domain (Mathlib's IsDedekindDomain R: a Noetherian integrally closed domain of Krull dimension at most one; a field is allowed) with fraction field K = FractionRing R.
- I is a nonzero ideal of R, so I ∈ (Ideal R)⁰.

**Construction or proof.**

- By definition ClassGroup.equivPic is mulEquivUnitsSubmoduleQuotRange followed by Submodule.unitsQuotEquivRelPic (and relPic R K = ⊤, K = FractionRing R). The first map sends mk0 I to the class of the invertible submodule of K underlying FractionalIdeal.mk0 K I (FractionalIdeal.unitsMulEquivSubmodule, FractionalIdeal.coe_mk0), namely the image of I in K.
- Submodule.unitsQuotEquivRelPic sends the class of an invertible submodule 𝔞 ⊆ K to Submodule.unitsToPic 𝔞 = Pic.mk R 𝔞.
- The image of I in K is linearly equivalent to I by Submodule.equivMapOfInjective (algebraMap R K is injective), so Pic.mk R (image) = Pic.mk R I by CommRing.Pic.mk_eq_mk_iff.

**Acceptance.**

- I = R: both sides are 1.
- I = (a) principal with a ≠ 0: both sides are 1.
- I nonprincipal: both sides are ≠ 1 (ClassGroup.mk0_eq_one_iff, CommRing.Pic.mk_eq_one_iff_free).

**Prerequisites.**

- mathlib:ClassGroup.equivPic
- mathlib:ClassGroup.mulEquivUnitsSubmoduleQuotRange
- mathlib:Submodule.unitsQuotEquivRelPic
- mathlib:Submodule.unitsToPic
- mathlib:FractionalIdeal.unitsMulEquivSubmodule
- mathlib:FractionalIdeal.coe_mk0
- mathlib:ClassGroup.mk0
- mathlib:Submodule.equivMapOfInjective
- mathlib:CommRing.Pic.mk_eq_mk_iff

**Sources.**

- Kbook.I, Proposition 3.5, p. 17. Line bundles over a domain are invertible ideals, so Pic is the ideal class group; Mathlib's equivPic realises this and the lemma evaluates it on an ideal.
- Kbook.I, §3, Dedekind domains, p. 18. Pic(R) as isomorphism classes of ideals; the ideals must be nonzero (source issue).

### Independence of the ideal representative

**KTheoryLowDegrees:Z.4/ideal-class-representative-independence** · lemma · implementation unchecked.

For nonzero ideals I and J of R: ClassGroup.mk0 I = ClassGroup.mk0 J if and only if I ≃ₗ[R] J, and then [I] = [J] in K₀(R). Hence the assignment (n, mk0 I) ↦ (n − 1)•[R] + [I] is independent of the ideal I chosen in its class.

**Hypotheses.**

- R is a Dedekind domain (Mathlib's IsDedekindDomain R: a Noetherian integrally closed domain of Krull dimension at most one; a field is allowed) with fraction field K = FractionRing R.
- K₀(R) is RingK0 R (KTheoryLowDegrees:Z.1/ring-k0: the split Grothendieck group of finiteProjectiveModules R), a commutative ring by KTheoryLowDegrees:Z.3/finite-projective-monoidal; [P] is the class of a finitely generated projective P. Spec R is connected (Z.2/rank-domain), rank is the integer rank RingK0.rankℤ of Z.2/rank-connected, and det is RingK0.detHom : K₀(R) → Pic(R) of Z.3/determinant-hom, with Pic(R) = CommRing.Pic R written multiplicatively.
- I and J are nonzero ideals of R.

**Construction or proof.**

- By Z.4/class-group-pic-mk0, ClassGroup.mk0 I = ClassGroup.mk0 J is equivalent to Pic.mk R I = Pic.mk R J (equivPic is injective), which is equivalent to I ≃ₗ[R] J by CommRing.Pic.mk_eq_mk_iff.
- Concretely, ClassGroup.mk0_eq_mk0_iff gives x, y ≠ 0 with (x)I = (y)J, and multiplication by x and by y are injective because R is a domain.
- Isomorphic modules have equal classes (TauCeti.SplitK0.of_congr).

**Acceptance.**

- I and xI (x ≠ 0) have the same ideal class and the same K₀ class.
- In ℤ[√−5], (2, 1 + √−5) and (3, 1 − √−5) are equivalent: multiplication by (1 − √−5)/2 carries 2 to 1 − √−5 and 1 + √−5 to 3.
- A nonprincipal I is not equivalent to R.

**Prerequisites.**

- KTheoryLowDegrees:Z.4/class-group-pic-mk0
- mathlib:CommRing.Pic.mk_eq_mk_iff
- mathlib:ClassGroup.mk0_eq_mk0_iff
- tauceti:TauCeti.SplitK0.of_congr
- KTheoryLowDegrees:Z.1/ring-k0

**Sources.**

- Milne.ANT.2020, Theorem 3.31 and following remarks, printed p. 58 (PDF p. 60). The equivalence of ideal classes with isomorphism classes.
- Cohen, Corollary 1.2.24, printed p. 11 (PDF p. 25). The same statement with free summands, which is what makes the inverse independent of the representative.

### Rank and Steinitz class coordinates

**KTheoryLowDegrees:Z.4/rank-class-group-equivalence** · construction · implementation unchecked.

RingK0.rankClassGroupEquiv : K₀(R) ≃+ ℤ × Additive (ClassGroup R), the composite of rankPicEquiv with id × (ClassGroup.equivPic R).symm. It sends [P] to (Module.finrank R P, St(P)), where St(P) = ClassGroup.mk0 I for any presentation P ≃ R^n × I (Cohen's Steinitz class), and its inverse sends (n, mk0 I) to (n − 1)•[R] + [I], independently of the nonzero ideal I chosen in the class.

**Hypotheses.**

- R is a Dedekind domain (Mathlib's IsDedekindDomain R: a Noetherian integrally closed domain of Krull dimension at most one; a field is allowed) with fraction field K = FractionRing R.
- K₀(R) is RingK0 R (KTheoryLowDegrees:Z.1/ring-k0: the split Grothendieck group of finiteProjectiveModules R), a commutative ring by KTheoryLowDegrees:Z.3/finite-projective-monoidal; [P] is the class of a finitely generated projective P. Spec R is connected (Z.2/rank-domain), rank is the integer rank RingK0.rankℤ of Z.2/rank-connected, and det is RingK0.detHom : K₀(R) → Pic(R) of Z.3/determinant-hom, with Pic(R) = CommRing.Pic R written multiplicatively.

**Construction or proof.**

- Compose Z.4/rank-pic-equivalence with the inverse of ClassGroup.equivPic on the second factor.
- On [P] with P ≃ R^n × I: det P = Pic.mk R I (Z.4/steinitz) = equivPic (mk0 I) (Z.4/class-group-pic-mk0).
- On (n, mk0 I): Z.4/rank-pic-inverse with L = equivPic (mk0 I) = Pic.mk R I, whose representative module is isomorphic to I; independence of I is Z.4/ideal-class-representative-independence.

**Acceptance.**

- [R] ↦ (1, 0), [I] ↦ (1, mk0 I), [R] − [I] ↦ (0, (mk0 I)⁻¹).
- For R = ℤ the class group is trivial and the map is rankℤ.

**Prerequisites.**

- KTheoryLowDegrees:Z.4/rank-pic-equivalence
- KTheoryLowDegrees:Z.4/rank-pic-inverse
- KTheoryLowDegrees:Z.4/steinitz
- KTheoryLowDegrees:Z.4/class-group-pic-mk0
- KTheoryLowDegrees:Z.4/ideal-class-representative-independence
- mathlib:ClassGroup.equivPic

**Uses.**

- ArithmeticKTheory:N.1/norms-transfers-and-pullbacks: K₀(O_{F,S}) ≅ ℤ ⊕ Cl(O_{F,S}) and the transfer and pullback on the class-group coordinate
- ArithmeticKTheory:N.2/the-three-classical-rows: the class map e_𝔭 ↦ [𝔭]⁻¹
- Z.4/k0-s-integers and Z.4/k0-localization: S-integer and localisation specialisations
- ClassicalArithmeticCompletion:CA.7/locally-free-class-group: for Λ = A, Cl(A) is the rank-zero part

**Public API.**

- TauCeti.RingK0.rankClassGroupEquiv (equivalence): rankClassGroupEquiv : RingK0 R ≃+ ℤ × Additive (ClassGroup R).
- TauCeti.RingK0.steinitzClass (data): steinitzClass : RingK0 R →+ Additive (ClassGroup R), the second coordinate, Additive.ofMul ∘ equivPic.symm ∘ det.
- TauCeti.RingK0.steinitzClass_of_prod_ideal (simp): steinitzClass [(Fin n → R) × I] = Additive.ofMul (ClassGroup.mk0 I).
- TauCeti.RingK0.rankClassGroupEquiv_symm_mk0 (simp): rankClassGroupEquiv.symm (n, Additive.ofMul (mk0 I)) = (n − 1)•[R] + [I].
- TauCeti.RingK0.rankClassGroupEquiv_ideal (simp): rankClassGroupEquiv [I] = (1, Additive.ofMul (mk0 I)).
- TauCeti.RingK0.rankClassGroupEquiv_one_sub_ideal (simp): rankClassGroupEquiv ([R] − [I]) = (0, Additive.ofMul (mk0 I)⁻¹).
- TauCeti.RingK0.rankClassGroupEquiv_eq (compatibility): rankClassGroupEquiv = (AddEquiv.refl ℤ).prodCongr (equivPic R).symm.toAdditive ∘ rankPicEquiv.

**Unit tests.**

- TauCeti.RingK0.rankClassGroup_int_test (computation): For R = ℤ: rankClassGroupEquiv [ℤ³] = (3, 0), ClassGroup ℤ being trivial.
- TauCeti.RingK0.rankClassGroup_zero_test (degenerate): rankClassGroupEquiv 0 = (0, 0) and rankClassGroupEquiv [R] = (1, 0); the zero module has no Steinitz ideal attached.
- TauCeti.RingK0.rankClassGroup_representative_test (characterisation): If x, y ≠ 0 and (x)I = (y)J then rankClassGroupEquiv.symm (1, Additive.ofMul (mk0 I)) = [I] = [J].
- TauCeti.RingK0.rankClassGroup_nonprincipal_test (non-example): For a nonprincipal I, [I] and [R] have equal rank but rankClassGroupEquiv [I] = (1, mk0 I) ≠ (1, 0).
- TauCeti.RingK0.rankClassGroup_equivPic_test (compatibility): Composing the second coordinate with ClassGroup.equivPic gives rankPicEquiv.

**Sources.**

- Cohen, Corollary 1.2.24 and the following paragraph, printed p. 11 (PDF p. 25). The Steinitz class, which is the second coordinate.
- Milne.ANT.2020, Theorem 3.31 and following remarks, printed p. 58 (PDF p. 60). K₀ as Cl(A) ⊕ ℤ.

### Base change on Pic is extension of ideals

**KTheoryLowDegrees:Z.4/pic-map-extended-hom** · lemma · implementation unchecked.

Let R → S be an injective homomorphism of Dedekind domains (Algebra R S, Module.IsTorsionFree R S). For every c ∈ ClassGroup R: Pic.mapAlgebra R S (equivPic R c) = equivPic S (ClassGroup.extendedHom R S c). On a nonzero ideal I of R, S ⊗[R] I ≃ₗ[S] I·S and Pic.mapAlgebra R S (Pic.mk R I) = Pic.mk S (I·S).

**Hypotheses.**

- R is a Dedekind domain (Mathlib's IsDedekindDomain R: a Noetherian integrally closed domain of Krull dimension at most one; a field is allowed) with fraction field K = FractionRing R.
- S is a Dedekind domain with an R-algebra structure whose structure map is injective.

**Construction or proof.**

- Write c = mk0 I (ClassGroup.mk0_surjective). Then equivPic R c = Pic.mk R I (Z.4/class-group-pic-mk0), and Pic.mapAlgebra R S (Pic.mk R I) = Pic.mk S (S ⊗[R] I) by the definition of CommRing.Pic.mapAlgebra.
- S is torsion-free, hence flat, over the Dedekind domain R (IsDedekindDomain.flat_iff_torsion_eq_bot), so the S-linear map S ⊗[R] I → S ⊗[R] R ≃ S (lTensor of the inclusion, then TensorProduct.rid) is injective (Module.Flat.lTensor_preserves_injective_linearMap). Its image is the ideal of S generated by the image of I, which is I·S = Ideal.map (algebraMap R S) I (Ideal.map_span). So S ⊗[R] I ≃ₗ[S] I·S.
- ClassGroup.extendedHom_mk0: extendedHom (mk0 I) = mk0 (I·S), I·S ≠ 0 by injectivity; Z.4/class-group-pic-mk0 over S gives equivPic S (mk0 (I·S)) = Pic.mk S (I·S). Combine with CommRing.Pic.mk_eq_mk_iff.

**Acceptance.**

- S = R: both maps are the identity.
- R → R_𝔭 for a maximal ideal 𝔭: both sides are 1, since R_𝔭 is local (Pic trivial).
- The flatness step needs R → S injective; for R → R/𝔭, mapAlgebra is still defined but extendedHom is not.

**Prerequisites.**

- KTheoryLowDegrees:Z.4/class-group-pic-mk0
- mathlib:ClassGroup.mk0_surjective
- mathlib:ClassGroup.extendedHom
- mathlib:ClassGroup.extendedHom_mk0
- mathlib:CommRing.Pic.mapAlgebra
- mathlib:IsDedekindDomain.flat_iff_torsion_eq_bot
- mathlib:Module.Flat.lTensor_preserves_injective_linearMap
- mathlib:TensorProduct.rid
- mathlib:Ideal.map_span
- mathlib:CommRing.Pic.mk_eq_mk_iff

**Sources.**

- Kbook.I, Proposition 3.2, p. 16. Mathlib's Pic.mapAlgebra is this functor.
- Kbook.I, Exercise 3.5, p. 24. The same flatness argument, for an extension ring instead of a second ideal.

### Base change in rank/Pic coordinates

**KTheoryLowDegrees:Z.4/k0-base-change-coordinates** · theorem · implementation unchecked.

Let f : R → S be a ring homomorphism between Dedekind domains (not necessarily injective). For every x ∈ K₀(R): rankPicEquiv_S (RingK0.map f x) = (rankℤ x, Additive.ofMul (Pic.mapRingHom f (det x))), i.e. base change is (n, L) ↦ (n, S ⊗[R] L). If f is injective (S torsion-free over R), then in the coordinates of rankClassGroupEquiv it is (n, c) ↦ (n, ClassGroup.extendedHom R S c).

**Hypotheses.**

- R is a Dedekind domain (Mathlib's IsDedekindDomain R: a Noetherian integrally closed domain of Krull dimension at most one; a field is allowed) with fraction field K = FractionRing R.
- K₀(R) is RingK0 R (KTheoryLowDegrees:Z.1/ring-k0: the split Grothendieck group of finiteProjectiveModules R), a commutative ring by KTheoryLowDegrees:Z.3/finite-projective-monoidal; [P] is the class of a finitely generated projective P. Spec R is connected (Z.2/rank-domain), rank is the integer rank RingK0.rankℤ of Z.2/rank-connected, and det is RingK0.detHom : K₀(R) → Pic(R) of Z.3/determinant-hom, with Pic(R) = CommRing.Pic R written multiplicatively.
- S is a Dedekind domain and f : R →+* S a ring homomorphism, made into an algebra.

**Construction or proof.**

- Rank: rankℤ (map f x) = rankℤ x (the API item rankℤ_map of Z.2/rank-connected; both spectra are connected by Z.2/rank-domain; equivalently Z.2/rank-base-change).
- Determinant: det_S (map f x) = Pic.mapRingHom f (det_R x) (Z.3/determinant-base-change).
- Injective case: CommRing.Pic.mapRingHom_algebraMap and Z.4/pic-map-extended-hom convert Pic.mapAlgebra into ClassGroup.extendedHom; conclude with Z.4/rank-class-group-equivalence.

**Acceptance.**

- R → R/𝔭 = κ(𝔭), a field: (n, L) ↦ n; the class coordinate dies.
- R → K: K₀(R) → K₀(K) = ℤ is rankℤ.
- For an injective extension the class coordinate moves by extension of ideals, not by a norm.

**Prerequisites.**

- KTheoryLowDegrees:Z.4/rank-pic-equivalence
- KTheoryLowDegrees:Z.4/rank-class-group-equivalence
- KTheoryLowDegrees:Z.4/pic-map-extended-hom
- KTheoryLowDegrees:Z.1/ring-k0-map
- KTheoryLowDegrees:Z.2/rank-connected
- KTheoryLowDegrees:Z.2/rank-base-change
- KTheoryLowDegrees:Z.2/rank-domain
- KTheoryLowDegrees:Z.3/determinant-base-change
- mathlib:CommRing.Pic.mapRingHom
- mathlib:CommRing.Pic.mapRingHom_algebraMap

**Sources.**

- Kbook.II, Example 2.8.1, p. 13. The base change map on K₀.
- Kbook.I, Proposition 3.2, p. 16. Its effect on the Picard coordinate.

### A localisation is a ring of S-integers

**KTheoryLowDegrees:Z.4/localization-eq-integer** · lemma · implementation unchecked.

Let M ≤ R⁰ be a submonoid and S_M := {v ∈ HeightOneSpectrum R : ∃ m ∈ M, m ∈ v.asIdeal}, the height-one primes meeting M. Then the R-subalgebra S_M.integer K = {x ∈ K : v(x) ≤ 1 for every v ∉ S_M} of K (Mathlib's Set.integer) is a localisation of R at M: IsLocalization M (S_M.integer K). Consequently every localisation R_M of R at M is R-isomorphic to S_M.integer K (IsLocalization.algEquiv), compatibly with the maps to K.

**Hypotheses.**

- R is a Dedekind domain (Mathlib's IsDedekindDomain R: a Noetherian integrally closed domain of Krull dimension at most one; a field is allowed) with fraction field K = FractionRing R.
- M is a submonoid of R contained in the non-zero-divisors R⁰ (0 ∉ M).

**Construction or proof.**

- Units: for m ∈ M, m ≠ 0 and algebraMap R K m has inverse y = m⁻¹ in K. For v ∉ S_M, m ∉ v.asIdeal, so v(m) = 1 (IsDedekindDomain.HeightOneSpectrum.valuation_eq_one_iff_notMem) and v(y) = 1 ≤ 1; thus y ∈ S_M.integer K (Set.mem_integer_iff) and m is a unit there.
- Surjectivity: let x ∈ S_M.integer K and 𝔡 := Algebra.denIdeal K x = {r ∈ R : r·x ∈ R}, a nonzero ideal (Algebra.denIdeal_ne_bot). Suppose 𝔡 ∩ M = ∅. Ideal.exists_le_prime_disjoint gives a prime 𝔮 ⊇ 𝔡 disjoint from M; 𝔮 ≠ 0, so 𝔮 is a height-one prime v with v ∉ S_M. Then v(x) ≤ 1, and IsDedekindDomain.denIdeal_not_le says 𝔡 ⊄ v, a contradiction. Hence some m ∈ M lies in 𝔡: m·x = algebraMap R K r for some r ∈ R (Algebra.mem_denIdeal_iff).
- The kernel condition holds because R → S_M.integer K is injective (take the element 1 of M).
- These are the three conditions of IsLocalization; IsLocalization.algEquiv gives R_M ≃ₐ[R] S_M.integer K.

**Acceptance.**

- M = {1}: S_M = ∅ and ∅.integer K = R (Mathlib's IsDedekindDomain.integer_empty).
- M = R ∖ 𝔭 for a maximal 𝔭: S_M consists of all v ≠ 𝔭, and S_M.integer K = R_𝔭.
- R = ℤ, M = {2^k}: S_M = {(2)} and S_M.integer ℚ = ℤ[1/2].
- The converse fails: if Cl(R) ≅ ℤ is generated by the class of one prime v, then {v}.integer K is not a localisation of R (Tau Ceti's SInteger/Basic docstring). This lemma is only the direction from localisations to S-integers.

**Prerequisites.**

- mathlib:Set.integer
- tauceti:Set.mem_integer_iff
- mathlib:IsDedekindDomain.HeightOneSpectrum
- mathlib:IsDedekindDomain.HeightOneSpectrum.valuation_eq_one_iff_notMem
- tauceti:Algebra.denIdeal
- tauceti:Algebra.denIdeal_ne_bot
- tauceti:Algebra.mem_denIdeal_iff
- tauceti:IsDedekindDomain.denIdeal_not_le
- mathlib:Ideal.exists_le_prime_disjoint
- mathlib:IsLocalization
- mathlib:IsLocalization.algEquiv
- mathlib:IsDedekindDomain.integer_empty

**Sources.**

- Kbook.I, §3, The Weil divisor class group, p. 19. Applied to the Dedekind domain R_M, whose height-one primes are the v not meeting M: R_M is the intersection of the corresponding valuation rings, which is S_M.integer K.
- Kbook.I, Exercise 3.8, p. 25. S_M is the set of primes meeting the multiplicative set.
- Milne.ANT.2020, §5, S-units, printed p. 90 (PDF p. 92). The ring of S-integers as the intersection of the valuation rings off S.

### Class group of a localisation

**KTheoryLowDegrees:Z.4/localization-class-group** · theorem · implementation unchecked.

Let M ≤ R⁰ and let R_M be a localisation of R at M (IsLocalization M R_M; R_M is a Dedekind domain by IsLocalization.isDedekindDomain). Then ClassGroup.extendedHom R R_M is surjective and its kernel is the subgroup generated by the classes HeightOneSpectrum.classGroupMk v of the height-one primes v meeting M; hence ClassGroup R_M ≃* ClassGroup R ⧸ ⟨[v] : v ∩ M ≠ ∅⟩. The same holds for Pic.mapAlgebra R R_M : Pic R → Pic R_M (Z.4/pic-map-extended-hom).

**Hypotheses.**

- R is a Dedekind domain (Mathlib's IsDedekindDomain R: a Noetherian integrally closed domain of Krull dimension at most one; a field is allowed) with fraction field K = FractionRing R.
- M is a submonoid of R with M ≤ R⁰; R_M is an R-algebra with IsLocalization M R_M.

**Construction or proof.**

- Z.4/localization-eq-integer gives φ : R_M ≃ₐ[R] S_M.integer K.
- ClassGroup.mulEquiv φ is an isomorphism ClassGroup R_M ≃* ClassGroup (S_M.integer K), and on the class of an ideal it is mk0 of the image ideal (Tau Ceti's ClassGroup.mulEquiv_mk0). Since φ is an R-algebra map, Ideal.map φ (I·R_M) = I·(S_M.integer K); with ClassGroup.extendedHom_mk0 this gives mulEquiv φ ∘ extendedHom R R_M = extendedHom R (S_M.integer K).
- Tau Ceti's IsDedekindDomain.integer_extendedHom_surjective and IsDedekindDomain.ker_integer_extendedHom give surjectivity and the kernel for S_M.integer K; transport along mulEquiv φ. IsDedekindDomain.integerClassGroupEquiv gives the quotient description.
- For Pic, compose with ClassGroup.equivPic on both sides (Z.4/pic-map-extended-hom).

**Acceptance.**

- M = R ∖ 𝔭: every class contains an ideal coprime to 𝔭 (Z.4/coprime-ideal-representative), so the quotient is trivial and R_𝔭 is a PID.
- If every prime meeting M is principal, extension is an isomorphism (compare the source's Exercise 3.8(b)).
- For 𝓞 of ℚ(√−5) and M = {2^k}: the only prime meeting M is P with P² = (2), and Cl(𝓞[1/2]) = Cl/⟨[P]⟩ = 1.

**Prerequisites.**

- KTheoryLowDegrees:Z.4/localization-eq-integer
- KTheoryLowDegrees:Z.4/pic-map-extended-hom
- KTheoryLowDegrees:Z.4/class-group-pic-mk0
- mathlib:IsLocalization.isDedekindDomain
- mathlib:ClassGroup.extendedHom
- mathlib:ClassGroup.extendedHom_mk0
- mathlib:ClassGroup.mulEquiv
- tauceti:ClassGroup.mulEquiv_mk0
- tauceti:IsDedekindDomain.integer_extendedHom_surjective
- tauceti:IsDedekindDomain.ker_integer_extendedHom
- tauceti:IsDedekindDomain.integerClassGroupEquiv
- tauceti:IsDedekindDomain.HeightOneSpectrum.classGroupMk

**Sources.**

- Kbook.I, Exercise 3.8(a), p. 25. The part D(R, R_S) → Cl(R) → Cl(R_S) → 0 of the sequence, for a Dedekind domain where Cl = Pic. The source leaves it as an exercise; the proof here reduces to Tau Ceti's integerClassGroupEquiv.
- Kbook.I, Exercise 3.8(c), p. 25. Surjectivity on Pic, which holds as every prime is invertible.

### Localisation on K₀ of a Dedekind domain

**KTheoryLowDegrees:Z.4/k0-localization** · theorem · implementation unchecked.

Let M ≤ R⁰ and R_M a localisation of R at M. In the coordinates of rankClassGroupEquiv, RingK0.map (algebraMap R R_M) : K₀(R) → K₀(R_M) is (n, c) ↦ (n, ClassGroup.extendedHom R R_M c). It is surjective, its kernel is the subgroup generated by the classes [v] − [R] of the height-one primes v meeting M, and K₀(R_M) ≃+ ℤ × Additive (ClassGroup R ⧸ ⟨[v] : v ∩ M ≠ ∅⟩).

**Hypotheses.**

- R is a Dedekind domain (Mathlib's IsDedekindDomain R: a Noetherian integrally closed domain of Krull dimension at most one; a field is allowed) with fraction field K = FractionRing R.
- K₀(R) is RingK0 R (KTheoryLowDegrees:Z.1/ring-k0: the split Grothendieck group of finiteProjectiveModules R), a commutative ring by KTheoryLowDegrees:Z.3/finite-projective-monoidal; [P] is the class of a finitely generated projective P. Spec R is connected (Z.2/rank-domain), rank is the integer rank RingK0.rankℤ of Z.2/rank-connected, and det is RingK0.detHom : K₀(R) → Pic(R) of Z.3/determinant-hom, with Pic(R) = CommRing.Pic R written multiplicatively.
- M ≤ R⁰ is a submonoid and IsLocalization M R_M.

**Construction or proof.**

- Z.4/k0-base-change-coordinates in the injective case (R → R_M is injective since M ≤ R⁰) gives the formula.
- Surjectivity: the rank coordinate is unchanged and extendedHom is surjective (Z.4/localization-class-group).
- Kernel: (n, c) ↦ 0 exactly when n = 0 and c lies in ker extendedHom, the subgroup generated by the [v] with v ∩ M ≠ ∅ (Z.4/localization-class-group). The element (0, [v]) is picToK0 (Additive.ofMul (Pic.mk R v)) = [v] − [R] (Z.4/rank-class-group-equivalence, Z.4/reduced-line-class), and the image of a generated subgroup is generated by the images.
- The last description combines Z.4/rank-class-group-equivalence for R_M with IsDedekindDomain.integerClassGroupEquiv as in Z.4/localization-class-group.

**Acceptance.**

- M = R ∖ {0}: R_M = K, K₀(K) = ℤ and the map is rankℤ; the kernel is the whole rank-zero part, generated by all [v] − [R].
- M = R ∖ 𝔭: K₀(R_𝔭) = ℤ.
- 𝓞 of ℚ(√−5) → 𝓞[1/2]: [P] − [𝓞] ↦ 0 although it is nonzero in K₀(𝓞).

**Prerequisites.**

- KTheoryLowDegrees:Z.4/k0-base-change-coordinates
- KTheoryLowDegrees:Z.4/localization-class-group
- KTheoryLowDegrees:Z.4/rank-class-group-equivalence
- KTheoryLowDegrees:Z.4/reduced-line-class
- KTheoryLowDegrees:Z.1/ring-k0-map
- tauceti:IsDedekindDomain.integerClassGroupEquiv
- mathlib:IsLocalization.isDedekindDomain

**Sources.**

- Kbook.I, Exercise 3.8(a), p. 25. The class-group part of the K₀ map.
- Kbook.II, Example 2.8.1, p. 13. The K₀ map is base change.

### K₀ of the ring of integers of a number field

**KTheoryLowDegrees:Z.4/k0-ring-of-integers** · application · implementation unchecked.

Let F be a number field and 𝓞_F = NumberField.RingOfIntegers F (a Dedekind domain). Then rankClassGroupEquiv gives K₀(𝓞_F) ≃+ ℤ × Additive (ClassGroup 𝓞_F) with [𝓞_F] ↦ (1, 0). The class group is finite of order the class number h_F = NumberField.classNumber F, so K₀(𝓞_F) is a finitely generated abelian group of rank one whose torsion subgroup ker rankℤ ≅ Cl(𝓞_F) has order h_F; K₀(𝓞_F) ≃+ ℤ exactly when h_F = 1, i.e. when 𝓞_F is a PID (NumberField.classNumber_eq_one_iff).

**Hypotheses.**

- F is a number field; 𝓞_F carries Mathlib's IsDedekindDomain instance.
- K₀, rankℤ and det are those of the Dedekind hypotheses, for the ring 𝓞_F.

**Construction or proof.**

- Apply Z.4/rank-class-group-equivalence to 𝓞_F.
- ClassGroup 𝓞_F is finite (NumberField.RingOfIntegers.instFintypeClassGroup) of cardinality NumberField.classNumber F; ℤ is torsion-free, so the torsion subgroup is 0 × Cl and it equals ker rankℤ.
- h_F = 1 ⇔ Cl trivial ⇔ 𝓞_F a PID (NumberField.classNumber_eq_one_iff).

**Acceptance.**

- F = ℚ: h = 1 and K₀(𝓞_ℚ) ≅ ℤ, as for ℤ in Z.2/pid-k0.
- F = ℚ(√−5), modelled by AdjoinRoot (X² + 5): h = 2 (Tau Ceti's classNumber_adjoinRoot_sqrt_neg_five_eq_two), so K₀(𝓞_F) ≅ ℤ × ℤ/2 (Z.4/nonprincipal-ideal-class).
- The rank alone sees only ℤ; the class coordinate is the torsion.

**Prerequisites.**

- KTheoryLowDegrees:Z.4/rank-class-group-equivalence
- mathlib:NumberField.RingOfIntegers
- mathlib:NumberField.RingOfIntegers.instFintypeClassGroup
- mathlib:NumberField.classNumber
- mathlib:NumberField.classNumber_eq_one_iff

**Sources.**

- Kbook.I, §3, Dedekind domains, p. 19. Pic(O_F) is the ideal class group, and it is finite.
- Milne.ANT.2020, Theorem 3.31 and following remarks, printed p. 58 (PDF p. 60). K₀ = Cl ⊕ ℤ.

### K₀ of the S-integers of a number field

**KTheoryLowDegrees:Z.4/k0-s-integers** · application · implementation unchecked.

Let F be a number field, S a set of height-one primes of 𝓞_F (finite in the arithmetic applications) and O_{F,S} := S.integer F (Mathlib's Set.integer, a Dedekind domain with fraction field F by Tau Ceti's SInteger/Basic). Then K₀(O_{F,S}) ≃+ ℤ × Additive (ClassGroup 𝓞_F ⧸ ⟨[𝔭] : 𝔭 ∈ S⟩), the composite of rankClassGroupEquiv for O_{F,S} with IsDedekindDomain.integerClassGroupEquiv F S, and the class-group factor is finite. The base change K₀(𝓞_F) → K₀(O_{F,S}) is (n, c) ↦ (n, c mod ⟨[𝔭] : 𝔭 ∈ S⟩); it is surjective with kernel generated by the classes [𝔭] − [𝓞_F], 𝔭 ∈ S.

**Hypotheses.**

- F is a number field and S ⊆ HeightOneSpectrum 𝓞_F finite (the pinned convention; the result holds for any S, and Tau Ceti's integerClassGroupEquiv needs no finiteness).
- No presentation of O_{F,S} as a localisation is used; that identification is ArithmeticKTheory N.1's (N.1/S-integers-as-a-localisation), downstream of this stage.

**Construction or proof.**

- Z.4/rank-class-group-equivalence for the Dedekind domain S.integer F, followed on the second factor by IsDedekindDomain.integerClassGroupEquiv.
- Finiteness: IsDedekindDomain.finite_integer_classGroup, Cl(𝓞_F) being finite (NumberField.RingOfIntegers.instFintypeClassGroup).
- Base change: 𝓞_F → S.integer F is injective (both are subrings of F), so Z.4/k0-base-change-coordinates gives (n, c) ↦ (n, extendedHom c), and IsDedekindDomain.integerClassGroupEquiv_extendedHom turns extendedHom into the quotient map. Surjectivity and the kernel: IsDedekindDomain.integer_extendedHom_surjective and IsDedekindDomain.ker_integer_extendedHom, with (0, [𝔭]) = [𝔭] − [𝓞_F] (Z.4/reduced-line-class).

**Acceptance.**

- S = ∅: O_{F,∅} = 𝓞_F (IsDedekindDomain.integer_empty) and the quotient is Cl(𝓞_F) (Z.4/k0-ring-of-integers).
- If the classes of the primes in S generate Cl(𝓞_F), K₀(O_{F,S}) ≅ ℤ.
- F = ℚ(√−5) and S = {P}, P the prime over 2: [P] generates Cl ≅ ℤ/2, so K₀(O_{F,S}) ≅ ℤ.

**Prerequisites.**

- KTheoryLowDegrees:Z.4/rank-class-group-equivalence
- KTheoryLowDegrees:Z.4/k0-base-change-coordinates
- KTheoryLowDegrees:Z.4/reduced-line-class
- KTheoryLowDegrees:Z.4/k0-ring-of-integers
- mathlib:Set.integer
- mathlib:NumberField.RingOfIntegers
- mathlib:NumberField.RingOfIntegers.instFintypeClassGroup
- mathlib:IsDedekindDomain.integer_empty
- tauceti:IsDedekindDomain.integerClassGroupEquiv
- tauceti:IsDedekindDomain.integerClassGroupEquiv_extendedHom
- tauceti:IsDedekindDomain.ker_integer_extendedHom
- tauceti:IsDedekindDomain.integer_extendedHom_surjective
- tauceti:IsDedekindDomain.finite_integer_classGroup

**Sources.**

- Milne.ANT.2020, §5, S-units, printed p. 90 (PDF p. 92). The ring O_K(S) of S-integers.
- Kbook.I, Exercise 3.8(a), p. 25. The class group of the S-integers is the class group modulo the primes in S; Tau Ceti proves it for Set.integer.

### ℤ[√−5] is the ring of integers of ℚ(√−5)

**KTheoryLowDegrees:Z.4/zsqrtd-neg-five-integers** · lemma · implementation unchecked.

Let K = AdjoinRoot (X² − C(−5)) over ℚ (Tau Ceti's model of ℚ(√−5), a number field) and θ ∈ 𝓞 K the integral generator with minimal polynomial X² + 5 given by TauCeti.NumberField.exists_minpoly_eq_X_sq_add_five_and_adjoin_eq_top. Then θ·θ = −5 and Zsqrtd.lift ⟨θ, θ·θ = −5⟩ : ℤ[√−5] →+* 𝓞 K (Mathlib's Zsqrtd (−5)) is a ring isomorphism sending √−5 to θ.

**Hypotheses.**

- K = AdjoinRoot (X² − C(−5)) with Tau Ceti's instance TauCeti.NumberField.irreducible_X_sq_add_five.

**Construction or proof.**

- θ² = −5: θ is a root of its minimal polynomial X² + 5.
- Injective: Zsqrtd.lift_injective, since −5 is not the square of an integer and 𝓞 K ⊆ K has characteristic zero.
- Surjective: the range of Zsqrtd.lift ⟨θ, _⟩ is the ℤ-subalgebra generated by θ, which is ⊤ by Tau Ceti's NumberField.adjoin_gen_eq_top_of_mod_four_ne_one (−5 is squarefree and −5 mod 4 = 3 ≠ 1), using Algebra.adjoin ℚ {θ} = ⊤ from the same Tau Ceti theorem.
- Package as RingEquiv.ofBijective.

**Acceptance.**

- The image of 1 + √−5 is 1 + θ, of norm 6.
- The image of the ideal (2, 1 + √−5) is the prime of 𝓞 K over 2.

**Prerequisites.**

- mathlib:Zsqrtd
- mathlib:Zsqrtd.lift
- mathlib:Zsqrtd.lift_injective
- tauceti:NumberField.adjoin_gen_eq_top_of_mod_four_ne_one
- tauceti:TauCeti.NumberField.exists_minpoly_eq_X_sq_add_five_and_adjoin_eq_top
- tauceti:TauCeti.NumberField.irreducible_X_sq_add_five

**Sources.**

- Milne.ANT.2020, Example 4.6, printed p. 71 (PDF p. 73). Milne computes in 𝓞_K = ℤ[√−5]; the lemma identifies Mathlib's ℤ[√−5] with Tau Ceti's number-field model.

### The nonprincipal ideal of ℤ[√−5] in K₀

**KTheoryLowDegrees:Z.4/nonprincipal-ideal-class** · application · implementation unchecked.

Let A = ℤ[√−5] (Zsqrtd (−5)), I = (2, 1 + √−5) and x := [I] − [A] ∈ K₀(A). (a) rankℤ x = 0 and det x = Pic.mk A I ≠ 1, so x ≠ 0; I × I ≃ₗ[A] A × A, so 2•x = 0. (b) Through Z.4/zsqrtd-neg-five-integers and Tau Ceti's class number two, K₀(A) ≃+ K₀(𝓞 K) ≃+ ℤ × Additive (ClassGroup 𝓞 K) ≅ ℤ × ℤ/2, with [A] ↦ (1, 0), [I] ↦ (1, 1) and x ↦ (0, 1).

**Hypotheses.**

- A = Zsqrtd (−5); K = AdjoinRoot (X² − C(−5)) as in Z.4/zsqrtd-neg-five-integers.
- K₀ is RingK0 (Z.1/ring-k0); rank and det as in the Dedekind hypotheses, A being a domain.

**Construction or proof.**

- Rank: I is finitely generated projective of constant rank 1 (Z.2/nonfree-projective-ideal), so rankℤ [I] = 1 = rankℤ [A] and rankℤ x = 0.
- Determinant: a rank-one finitely generated projective is invertible (Z.3/constant-rank-top-invertible with exteriorPower.oneEquiv), and det [I] = Pic.mk A I (Z.3/determinant-line). I is not free (Z.2/nonfree-projective-ideal), so Pic.mk A I ≠ 1 (CommRing.Pic.mk_eq_one_iff_free); hence det x ≠ 1 and x ≠ 0.
- Let J = (3, 1 − √−5). Then I + J = A (3 − 2 = 1) and IJ = (1 − √−5): its generators 6, 2 − 2√−5, 3 + 3√−5 are multiples of 1 − √−5 (6 = (1 − √−5)(1 + √−5), 3 + 3√−5 = (1 − √−5)(−2 + √−5)), and 1 − √−5 = (3 + 3√−5) − (2 − 2√−5) − 6√−5 lies in IJ. Z.4/coprime-ideal-sum gives I × J ≃ A × IJ ≃ A × A.
- J ≃ I: for a ∈ I, (1 − √−5)·a ∈ I·I = (2) (Z.2/nonfree-projective-ideal proves I² = (2); 1 − √−5 = 2 − (1 + √−5) ∈ I), so a ↦ (1 − √−5)a/2 is an injective A-linear map I → A; it sends 2 to 1 − √−5 and 1 + √−5 to 3, so its image is J. Hence I × I ≃ I × J ≃ A × A and 2[I] = 2[A] (TauCeti.SplitK0.of_biprod, of_congr).
- (b) RingK0.mapEquiv along the ring isomorphism of Z.4/zsqrtd-neg-five-integers (Z.1/ring-k0-map), then Z.4/k0-ring-of-integers. ClassGroup 𝓞 K has two elements (TauCeti.NumberField.classNumber_adjoinRoot_sqrt_neg_five_eq_two), hence is ℤ/2; the image of I has nontrivial class by (a) transported, so [I] ↦ (1, 1) and x ↦ (0, 1).

**Acceptance.**

- x ≠ 0 and 2x = 0: K₀(ℤ[√−5]) has a nonzero torsion element that no rank-only invariant sees.
- [I]·[I] = [A] in the ring K₀(A), since I ⊗ I ≃ I² = (2) ≃ A; in coordinates (1, c)² = (1, c²) = (1, 1).
- (2, 1 + √−5) and (3, 1 − √−5) are isomorphic A-modules, and I × I is free although I is not.

**Prerequisites.**

- KTheoryLowDegrees:Z.2/nonfree-projective-ideal
- KTheoryLowDegrees:Z.2/rank-hom
- KTheoryLowDegrees:Z.2/rank-connected
- KTheoryLowDegrees:Z.3/constant-rank-top-invertible
- KTheoryLowDegrees:Z.3/determinant-line
- KTheoryLowDegrees:Z.3/determinant-hom-of
- KTheoryLowDegrees:Z.4/coprime-ideal-sum
- KTheoryLowDegrees:Z.4/zsqrtd-neg-five-integers
- KTheoryLowDegrees:Z.4/k0-ring-of-integers
- KTheoryLowDegrees:Z.1/ring-k0-map
- mathlib:CommRing.Pic.mk_eq_one_iff_free
- mathlib:exteriorPower.oneEquiv
- tauceti:TauCeti.NumberField.classNumber_adjoinRoot_sqrt_neg_five_eq_two
- tauceti:TauCeti.SplitK0.of_biprod
- tauceti:TauCeti.SplitK0.of_congr

**Sources.**

- Milne.ANT.2020, Example 4.6, printed p. 71 (PDF p. 73). The ideal (2, 1 + √−5) is not principal, and Milne concludes that the class group has order 2.
- Kbook.II, Corollary 2.6.3, p. 11. K₀ ≅ ℤ ⊕ Pic, here computed as ℤ ⊕ ℤ/2.

### The norm on Picard groups of Dedekind domains

**KTheoryLowDegrees:Z.4/pic-norm** · construction · implementation unchecked.

Let R → S be as in the hypotheses (a finite injective extension of Dedekind domains, d = finrank R S). CommRing.Pic.relNorm R S : Pic S →* Pic R is the transport of Tau Ceti's ClassGroup.relNorm along ClassGroup.equivPic on both sides: relNorm c = equivPic R (ClassGroup.relNorm ((equivPic S).symm c)). It is normalised by relNorm (Pic.mk S J) = Pic.mk R (Ideal.relNorm R J) for every nonzero ideal J of S, and relNorm (Pic.mapAlgebra R S c) = c^d.

**Hypotheses.**

- R and S are Dedekind domains with an R-algebra structure on S such that S is a finite R-module (Module.Finite R S) and the structure map is injective (Module.IsTorsionFree R S); d := Module.finrank R S, which equals [Frac S : Frac R] (Mathlib's IsFractionRing.finrank_eq).

**Construction or proof.**

- Definition: the composite of the MulEquiv (equivPic S).symm, the MonoidHom ClassGroup.relNorm and the MulEquiv equivPic R.
- Normalisation: (equivPic S).symm (Pic.mk S J) = mk0 J by Z.4/class-group-pic-mk0 over S; ClassGroup.relNorm_mk0 gives mk0 (Ideal.relNorm0 R J), whose underlying ideal is Ideal.relNorm R J; apply Z.4/class-group-pic-mk0 over R.
- Extension: Z.4/pic-map-extended-hom turns Pic.mapAlgebra into ClassGroup.extendedHom, and Tau Ceti's ClassGroup.relNorm_extendedHom gives relNorm (extendedHom c) = c^{finrank R S}.

- Source comparison: Cohen Proposition 2.2.13 is on printed p.82, physical PDF p.96. For a fractional ideal its printed approximation proof must first clear denominators (E29); prove the integral-ideal case for δI and divide the element norms by N(δ). This source repair is not an extra prerequisite for the construction, which transports the pinned ClassGroup.relNorm.

**Acceptance.**

- S = R: relNorm R R is the identity (d = 1, mapAlgebra R R = id).
- relNorm 1 = 1: the norm is normalised, unlike the determinant of the restriction (Z.4/restriction-determinant).
- For R = ℤ the target is trivial.

**Prerequisites.**

- KTheoryLowDegrees:Z.4/class-group-pic-mk0
- KTheoryLowDegrees:Z.4/pic-map-extended-hom
- mathlib:ClassGroup.equivPic
- tauceti:ClassGroup.relNorm
- tauceti:ClassGroup.relNorm_mk0
- tauceti:ClassGroup.relNorm_extendedHom
- tauceti:Ideal.relNorm0
- mathlib:Ideal.relNorm
- mathlib:CommRing.Pic.mapAlgebra

**Uses.**

- Z.4/restriction-determinant: the norm term of det_R(Res Q) = N(det_S Q)·det_R(S)^r
- Z.4/k0-transfer-coordinates and Z.4/number-field-extension-k0: the class coordinate of the transfer
- ArithmeticKTheory:N.1/norms-transfers-and-pullbacks: the transfer of an ideal class is (n, c′) ↦ (d·n, N(c′)·𝔰^n) with N Tau Ceti's ClassGroup.relNorm

**Public API.**

- CommRing.Pic.relNorm (constructor): relNorm R S : Pic S →* Pic R.
- CommRing.Pic.relNorm_equivPic (compatibility): relNorm (equivPic S c) = equivPic R (ClassGroup.relNorm c).
- CommRing.Pic.relNorm_mk_ideal (simp): For a nonzero ideal J of S: relNorm (Pic.mk S J) = Pic.mk R (Ideal.relNorm R J).
- CommRing.Pic.relNorm_mapAlgebra (relation): relNorm (Pic.mapAlgebra R S c) = c ^ Module.finrank R S.
- CommRing.Pic.relNorm_self (simp): relNorm R R = MonoidHom.id (Pic R).
- CommRing.Pic.relNorm_relNorm (functoriality): For a tower R → T → S of finite injective extensions of Dedekind domains, (relNorm R T).comp (relNorm T S) = relNorm R S (Mathlib's Ideal.relNorm_relNorm).
- CommRing.Pic.relNorm_det_restrict (characterisation): For an invertible S-module L: det_R (restrictScalars L) = relNorm (Pic.mk S L) · det_R S (Z.4/restriction-determinant with rank one).

**Unit tests.**

- CommRing.Pic.relNorm_self_test (degenerate): relNorm R R = MonoidHom.id (Pic R).
- CommRing.Pic.relNorm_integers_test (computation): For ℤ → 𝓞 K with K = ℚ(√−5): Pic ℤ is trivial (Mathlib's instance for GCD domains), so relNorm kills the nontrivial class of Pic 𝓞 K ≅ ℤ/2; the norm is not injective.
- CommRing.Pic.relNorm_equivPic_test (compatibility): relNorm ∘ equivPic S = equivPic R ∘ ClassGroup.relNorm, and for a nonzero generator x and its principal ideal relNorm (Pic.mk S (span {x})) = 1 = Pic.mk R (span {Algebra.intNorm R S x}).
- CommRing.Pic.relNorm_unnormalised_test (non-example): The unnormalised L ↦ det_R (restrictScalars L) sends 1 = Pic.mk S S to det_R S, which is ≠ 1 whenever S is not a free R-module; relNorm 1 = 1.
- CommRing.Pic.relNorm_ext_test (characterisation): relNorm (mapAlgebra R S c) = c^d: for d = 2 and c of order 2 this is 1, not c.

**Sources.**

- Cohen, Definition 2.2.11, printed p. 80 (PDF p. 94). The relative norm as an index-ideal, which is how it enters the determinant formula.
- Cohen, Proposition 2.2.13, printed p. 82 (PDF p. 96), author manuscript of 11 July 2001. Mathlib's Ideal.relNorm is defined as this span of element norms (Ideal.spanNorm).

### Index ideal of a map of invertible modules

**KTheoryLowDegrees:Z.4/invertible-injection-class** · lemma · implementation unchecked.

For a commutative domain R, invertible R-modules L,N and an injective f:L→N, Pic.mk R L = Pic.mk R 𝔠(f) · Pic.mk R N, where 𝔠(f) carries the invertibility structure supplied by index-ideal-evaluation.

**Hypotheses.**

- R is a commutative domain; L, N are invertible R-modules (Module.Invertible) and f is injective.

**Construction or proof.**

- Pic.mk R 𝔠(f) = Pic.mk R (Dual N ⊗ L) = (Pic.mk R N)⁻¹ · Pic.mk R L (CommRing.Pic.mk_tensor, CommRing.Pic.mk_dual, CommRing.Pic.mk_eq_mk_iff).

**Acceptance.**

- f = id: 𝔠(f) = R.
- R = ℤ, L = N = ℤ and f multiplication by 6: 𝔠(f) = 6ℤ.
- If 𝔠(f) is principal, (ii) gives Pic.mk L = Pic.mk N.

**Prerequisites.**

- KTheoryLowDegrees:Z.4/index-ideal-evaluation
- mathlib:CommRing.Pic.mk_tensor
- mathlib:CommRing.Pic.mk_dual
- mathlib:CommRing.Pic.mk_eq_mk_iff

**Sources.**

- Cohen, Definition 1.2.33(2), printed p. 15 (PDF p. 29). The index-ideal of P into Q. For invertible modules this node gives its determinantal form: for top exterior powers it computes [Q : P] (Z.4/index-ideal-eq-rel-norm).

### The top exterior power of an ideal inclusion

**KTheoryLowDegrees:Z.4/top-exterior-inclusion-injective** · lemma · implementation unchecked.

Let R → S be as in the hypotheses and J a nonzero ideal of S, viewed as an R-module by restriction. Then J and S are finitely generated projective R-modules of constant rank d (rankAtStalk = d at every prime), Λ^d_R J and Λ^d_R S are invertible R-modules (Z.3/constant-rank-top-invertible), and the map Λ^d_R(ι) : Λ^d_R J → Λ^d_R S induced by the inclusion ι : J ↪ S (Mathlib's exteriorPower.map) is injective.

**Hypotheses.**

- R and S are Dedekind domains with an R-algebra structure on S such that S is a finite R-module (Module.Finite R S) and the structure map is injective (Module.IsTorsionFree R S); d := Module.finrank R S, which equals [Frac S : Frac R] (Mathlib's IsFractionRing.finrank_eq).
- J is a nonzero ideal of S.

**Construction or proof.**

- J and S are finitely generated over R (R is Noetherian and S is a finite R-module) and torsion-free (they lie in the domain S, and R → S is injective), hence flat, finitely presented and projective (IsDedekindDomain.flat_iff_torsion_eq_bot, Module.finitePresentation_of_finite, Module.Flat.projective_of_finitePresentation).
- Rank: S is integrally closed and integral over R, so it is the integral closure of R in L = Frac S (IsIntegralClosure.of_isIntegrallyClosed) and L is the localisation of S at the image of R⁰ (IsIntegralClosure.isLocalization). Hence K ⊗[R] J is a nonzero L-submodule of L, i.e. all of L, as is K ⊗[R] S; both have K-dimension finrank K L = d (IsFractionRing.finrank_eq), and Z.2/rank-domain turns this into rankAtStalk = d.
- Λ^d commutes with the base change to K (Z.3/exterior-base-change), and K ⊗ ι is an isomorphism, so K ⊗ Λ^d(ι) is an isomorphism. As K is flat, K ⊗ ker Λ^d(ι) = 0, so the kernel is torsion; it is contained in the projective, hence torsion-free, module Λ^d J (Z.3/projective-exterior-power), so it is zero.

**Acceptance.**

- J = S: Λ^d(id) = id.
- ℤ ⊆ ℤ[i], J = (1 + i): d = 2, and in the bases (1, i) of S and (1 + i, −1 + i) of J the map Λ²(ι) is multiplication by det [[1, −1], [1, 1]] = 2 = N(1 + i).
- The equal rank d makes these top exterior powers invertible and the fraction-field map an isomorphism. Injectivity of exterior powers of an injection between finite projectives over a domain holds in every degree; it does not require equality of their ranks.

**Prerequisites.**

- KTheoryLowDegrees:Z.3/constant-rank-top-invertible
- KTheoryLowDegrees:Z.3/exterior-base-change
- KTheoryLowDegrees:Z.3/projective-exterior-power
- KTheoryLowDegrees:Z.2/rank-domain
- mathlib:IsDedekindDomain.flat_iff_torsion_eq_bot
- mathlib:Module.finitePresentation_of_finite
- mathlib:Module.Flat.projective_of_finitePresentation
- mathlib:IsIntegralClosure.of_isIntegrallyClosed
- mathlib:IsIntegralClosure.isLocalization
- mathlib:IsFractionRing.finrank_eq
- mathlib:exteriorPower.map
- mathlib:Module.Flat.lTensor_preserves_injective_linearMap

**Sources.**

- Cohen, Definition 1.2.33(2), printed p. 15 (PDF p. 29). The two lattices J ⊆ S of the same rank whose index-ideal is computed.
- Cohen, Theorem 1.2.35, proof, printed p. 16 (PDF p. 30). The source compares the Steinitz classes of N ⊆ M of the same rank through a common pseudo-basis; here their top exterior powers are compared instead.

### The index ideal is the relative norm

**KTheoryLowDegrees:Z.4/index-ideal-eq-rel-norm** · lemma · implementation unchecked.

In the setting of Z.4/top-exterior-inclusion-injective, the index ideal 𝔠(Λ^d_R ι) of Z.4/invertible-injection-class equals Ideal.relNorm R J.

**Hypotheses.**

- R and S are Dedekind domains with an R-algebra structure on S such that S is a finite R-module (Module.Finite R S) and the structure map is injective (Module.IsTorsionFree R S); d := Module.finrank R S, which equals [Frac S : Frac R] (Mathlib's IsFractionRing.finrank_eq).
- J is a nonzero ideal of S; ι : J ↪ S and d = finrank R S.

**Construction or proof.**

- Both sides are ideals of R, so by Ideal.eq_of_localization_maximal it suffices to compare their images in R_𝔭 for every maximal ideal 𝔭. (If R is a field, S is a field, J = S, and both sides are R.)
- Let S_𝔭 be the localisation of S at the image of R ∖ 𝔭. It is a PID (IsDedekindDomain.isPrincipalIdealRing_localization_over_prime) and a finitely generated torsion-free, hence free, module of rank d over the DVR R_𝔭 (Module.free_of_finite_type_torsion_free', IsLocalization.isDedekindDomain). So J·S_𝔭 = x·S_𝔭 for some nonzero x ∈ S_𝔭.
- By Z.4/index-ideal-localisation and Z.3/exterior-base-change, 𝔠(Λ^d ι)·R_𝔭 is the index ideal of Λ^d of the inclusion x·S_𝔭 ↪ S_𝔭. Precompose with the isomorphism S_𝔭 ≃ x·S_𝔭, s ↦ xs; Z.4/index-ideal-congr identifies its index ideal with that of Λ^d(lmul x). The latter map is det(lmul x)·id by exteriorPower.map_top_eq_det_smul for a basis indexed by Fin d, and det(lmul x) = Algebra.norm R_𝔭 x by Algebra.norm_apply. Z.4/index-ideal-free identifies its index ideal with the principal ideal generated by Algebra.norm R_𝔭 x.
- Ideal.spanIntNorm_localization: (Ideal.relNorm R J)·R_𝔭 = spanNorm R_𝔭 (x·S_𝔭) = span {Algebra.intNorm R_𝔭 S_𝔭 x} (Ideal.spanNorm_singleton) = span {Algebra.norm R_𝔭 x} (Algebra.intNorm_eq_norm, S_𝔭 being free and finite over R_𝔭). The two localisations agree.

**Acceptance.**

- J = S: both sides are R.
- J = x·S principal: 𝔠 = (Algebra.intNorm R S x) = Ideal.relNorm R (x·S) (Ideal.relNorm_singleton).
- ℤ ⊆ ℤ[i], J = (1 + i): both sides are 2ℤ.

**Prerequisites.**

- KTheoryLowDegrees:Z.4/invertible-injection-class
- KTheoryLowDegrees:Z.4/top-exterior-inclusion-injective
- KTheoryLowDegrees:Z.3/exterior-base-change
- mathlib:Ideal.eq_of_localization_maximal
- mathlib:IsDedekindDomain.isPrincipalIdealRing_localization_over_prime
- mathlib:Module.free_of_finite_type_torsion_free'
- mathlib:IsLocalization.isDedekindDomain
- tauceti:exteriorPower.map_top_eq_det_smul
- mathlib:Algebra.norm_apply
- mathlib:Ideal.spanIntNorm_localization
- mathlib:Ideal.spanNorm_singleton
- mathlib:Algebra.intNorm_eq_norm
- mathlib:Ideal.relNorm
- mathlib:Ideal.relNorm_singleton
- KTheoryLowDegrees:Z.4/index-ideal-localisation
- KTheoryLowDegrees:Z.4/index-ideal-congr
- KTheoryLowDegrees:Z.4/index-ideal-free

**Sources.**

- Cohen, Definition 2.2.11, printed p. 80 (PDF p. 94). The norm is the index-ideal; this lemma proves that characterisation for Mathlib's Ideal.relNorm, in the determinantal form.
- Cohen, Proposition 2.2.12(3), proof, printed p. 81 (PDF p. 95). The local computation: on a principal ideal the index is the determinant of multiplication, the norm.

### Determinant of an ideal as a module over the base

**KTheoryLowDegrees:Z.4/ideal-restriction-determinant** · theorem · implementation unchecked.

For R → S as in the hypotheses and a nonzero ideal J of S: det_R(J) = Pic.mk R (Ideal.relNorm R J) · det_R(S) in Pic R, where det_R is the determinant of Z.3/determinant-projective of the finitely generated projective R-modules J and S (both of constant rank d, so det_R = Pic.mk R Λ^d_R). Equivalently det_R(J) = relNorm (Pic.mk S J) · det_R(S).

**Hypotheses.**

- R and S are Dedekind domains with an R-algebra structure on S such that S is a finite R-module (Module.Finite R S) and the structure map is injective (Module.IsTorsionFree R S); d := Module.finrank R S, which equals [Frac S : Frac R] (Mathlib's IsFractionRing.finrank_eq).
- J is a nonzero ideal of S.

**Construction or proof.**

- Z.4/top-exterior-inclusion-injective: Λ^d_R ι : Λ^d_R J → Λ^d_R S is an injective map of invertible R-modules.
- Z.4/invertible-injection-class: Pic.mk Λ^d J = Pic.mk 𝔠(Λ^d ι) · Pic.mk Λ^d S.
- Z.4/index-ideal-eq-rel-norm: 𝔠(Λ^d ι) = Ideal.relNorm R J.
- For a module of constant rank d, Z.3/determinant-projective is Pic.mk of Λ^d (a single rank fibre); the second form is the normalisation of Z.4/pic-norm.

**Acceptance.**

- J = S: det_R(S) = det_R(S).
- J = xS principal: Ideal.relNorm R (xS) is principal, so det_R(xS) = det_R(S), as xS ≃ S.
- R = ℤ: Pic ℤ is trivial; the content is for bases with nontrivial class group.

**Prerequisites.**

- KTheoryLowDegrees:Z.4/top-exterior-inclusion-injective
- KTheoryLowDegrees:Z.4/invertible-injection-class
- KTheoryLowDegrees:Z.4/index-ideal-eq-rel-norm
- KTheoryLowDegrees:Z.4/pic-norm
- KTheoryLowDegrees:Z.3/determinant-projective

**Sources.**

- Cohen, Theorem 1.2.35, proof, printed p. 16 (PDF p. 30). With M = S and N = J of the same rank: St(J) = St(S)·∏dᵢ and ∏dᵢ = [S : J] = N(J) (Definition 2.2.11). The proof here localises instead of using the invariant factor theorem.
- Cohen, Corollary 1.2.25, printed p. 11 (PDF p. 25). The Steinitz class of a pseudo-basis presentation is the product of its ideals, which is det.

### Rank of a restriction of scalars

**KTheoryLowDegrees:Z.4/restriction-rank** · lemma · implementation unchecked.

For R → S as in the hypotheses and a finitely generated projective S-module Q: the R-module obtained by restricting scalars is finitely generated projective (Z.1/restrict-scalars-finite-projective) and rankℤ_R [Q] = d · rankℤ_S [Q].

**Hypotheses.**

- R and S are Dedekind domains with an R-algebra structure on S such that S is a finite R-module (Module.Finite R S) and the structure map is injective (Module.IsTorsionFree R S); d := Module.finrank R S, which equals [Frac S : Frac R] (Mathlib's IsFractionRing.finrank_eq).
- Q is a finitely generated projective S-module.

**Construction or proof.**

- S is a finitely generated projective R-module (finite and torsion-free over the Dedekind domain R: IsDedekindDomain.flat_iff_torsion_eq_bot, Module.finitePresentation_of_finite, Module.Flat.projective_of_finitePresentation), so Z.1/restrict-scalars-finite-projective applies.
- L = Frac S is the localisation of S at the image of R⁰ (IsIntegralClosure.of_isIntegrallyClosed, IsIntegralClosure.isLocalization), so K ⊗[R] Q ≅ L ⊗[S] Q as K-vector spaces.
- Tower law: finrank_K (L ⊗[S] Q) = finrank_K L · finrank_L (L ⊗[S] Q) (Module.finrank_mul_finrank), with finrank_K L = d (IsFractionRing.finrank_eq).
- Z.2/rank-domain identifies both ranks with these dimensions.

**Acceptance.**

- Q = S: rank d.
- Q = 0: rank 0.
- ℤ ⊆ ℤ[i] and Q = ℤ[i]²: rank 4.

**Prerequisites.**

- KTheoryLowDegrees:Z.1/restrict-scalars-finite-projective
- KTheoryLowDegrees:Z.2/rank-domain
- KTheoryLowDegrees:Z.2/rank-connected
- mathlib:IsDedekindDomain.flat_iff_torsion_eq_bot
- mathlib:Module.finitePresentation_of_finite
- mathlib:Module.Flat.projective_of_finitePresentation
- mathlib:IsIntegralClosure.of_isIntegrallyClosed
- mathlib:IsIntegralClosure.isLocalization
- mathlib:Module.finrank_mul_finrank
- mathlib:IsFractionRing.finrank_eq

**Sources.**

- Kbook.II, Example 2.8.1, p. 13. The forgetful functor behind the transfer; its effect on rank is the tower law.
- Kbook.II, Exercise 2.2, p. 14. The setting: A finitely generated projective of rank n over R.

### Determinant of a restriction of scalars

**KTheoryLowDegrees:Z.4/restriction-determinant** · theorem · implementation unchecked.

For R → S as in the hypotheses, let 𝔰 := det_R(S) ∈ Pic R (the determinant of the algebra, the Steinitz class of S over R). For every finitely generated projective S-module Q of rank r = rankℤ_S [Q]: det_R(restrictScalars Q) = CommRing.Pic.relNorm R S (det_S Q) · 𝔰^r. For Q = 0 both sides are 1, and for Q = S the formula reads 𝔰 = 𝔰.

**Hypotheses.**

- R and S are Dedekind domains with an R-algebra structure on S such that S is a finite R-module (Module.Finite R S) and the structure map is injective (Module.IsTorsionFree R S); d := Module.finrank R S, which equals [Frac S : Frac R] (Mathlib's IsFractionRing.finrank_eq).
- Q is a finitely generated projective S-module.

**Construction or proof.**

- r = 0: Q = 0 (Z.4/steinitz over S), and det_R 0 = 1 = relNorm 1 · 𝔰⁰.
- r ≥ 1: Z.4/steinitz over S gives Q ≃ S^{r−1} × J with J a nonzero ideal of S and Pic.mk S J = det_S Q. Restriction of scalars commutes with finite products.
- Z.3/determinant-congr and Z.3/determinant-sum over R: det_R(Res Q) = 𝔰^{r−1} · det_R(J).
- Z.4/ideal-restriction-determinant: det_R(J) = relNorm (Pic.mk S J) · 𝔰, so det_R(Res Q) = relNorm (det_S Q) · 𝔰^r.

**Acceptance.**

- Q = S^r: det_R = 𝔰^r and relNorm 1 = 1.
- Q = J of rank one: relNorm (Pic.mk S J) · 𝔰.
- Two plausible wrong formulas fail: det_R(Res Q) = relNorm (det_S Q) omits 𝔰^r and fails for Q = S whenever 𝔰 ≠ 1; det_R(Res Q) = (det_S Q)^d does not even have the right target.

**Prerequisites.**

- KTheoryLowDegrees:Z.4/steinitz
- KTheoryLowDegrees:Z.4/ideal-restriction-determinant
- KTheoryLowDegrees:Z.4/pic-norm
- KTheoryLowDegrees:Z.4/restriction-rank
- KTheoryLowDegrees:Z.1/restrict-scalars-finite-projective
- KTheoryLowDegrees:Z.3/determinant-sum
- KTheoryLowDegrees:Z.3/determinant-congr

**Sources.**

- Cohen, Corollary 1.2.25, printed p. 11 (PDF p. 25). Steinitz classes multiply over direct sums, which is the passage from J to S^{r−1} × J.
- Cohen, §2.2, printed p. 77 (PDF p. 91). The algebra-determinant term: 𝔰 = St(Z_L) need not be trivial.

### The transfer on K₀ in rank/Pic coordinates

**KTheoryLowDegrees:Z.4/k0-transfer-coordinates** · theorem · implementation unchecked.

For R → S as in the hypotheses, with d = finrank R S and 𝔰 = det_R(S): for every x ∈ K₀(S), rankPicEquiv_R (RingK0.transfer (algebraMap R S) x) = (d·r, Additive.ofMul (relNorm (det_S x) · 𝔰^r)) with r = rankℤ_S x (any integer). In class-group coordinates it is (r, c) ↦ (d·r, ClassGroup.relNorm c · St^r), St = (equivPic R).symm 𝔰. Consequently transfer (map y) = [S]·y for y ∈ K₀(R), i.e. (n, c) ↦ (d·n, c^d·𝔰^n), which is multiplication by d on every coordinate only when 𝔰 = 1.

**Hypotheses.**

- R and S are Dedekind domains with an R-algebra structure on S such that S is a finite R-module (Module.Finite R S) and the structure map is injective (Module.IsTorsionFree R S); d := Module.finrank R S, which equals [Frac S : Frac R] (Mathlib's IsFractionRing.finrank_eq).
- K₀(R) is RingK0 R (KTheoryLowDegrees:Z.1/ring-k0: the split Grothendieck group of finiteProjectiveModules R), a commutative ring by KTheoryLowDegrees:Z.3/finite-projective-monoidal; [P] is the class of a finitely generated projective P. Spec R is connected (Z.2/rank-domain), rank is the integer rank RingK0.rankℤ of Z.2/rank-connected, and det is RingK0.detHom : K₀(R) → Pic(R) of Z.3/determinant-hom, with Pic(R) = CommRing.Pic R written multiplicatively. The same conventions hold for S.

**Construction or proof.**

- Both sides are additive in x: (r, a) ↦ (d r, relNorm a · 𝔰^r) is a homomorphism ℤ × Pic S → ℤ × Pic R, and RingK0.transfer is additive (Z.1/ring-k0-transfer).
- On a class [Q] they agree: the rank is Z.4/restriction-rank and the determinant is Z.4/restriction-determinant; conclude by RingK0.hom_ext (Z.1/ring-k0).
- Composite: Z.4/k0-base-change-coordinates gives map y = (n, mapAlgebra c); relNorm (mapAlgebra c) = c^d (Z.4/pic-norm). The value (d n, c^d 𝔰^n) is (d, 𝔰)·(n, c) in the ring of Z.4/rank-pic-ring-equiv, and (d, 𝔰) = rankPicEquiv [S].

**Acceptance.**

- transfer [S] = (d, 𝔰) = [restrictScalars S]: the determinant of the algebra appears.
- ℤ → 𝓞 K with K = ℚ(√−5) (d = 2, 𝔰 = 1 as Pic ℤ = 1): transfer [P] = 2[ℤ] for the prime P over 2, and transfer ([P] − [𝓞 K]) = 0 although [P] − [𝓞 K] ≠ 0.
- transfer ∘ map is multiplication by [S] = (d, 𝔰), not by d: they differ at y = [R] whenever 𝔰 ≠ 1.

**Prerequisites.**

- KTheoryLowDegrees:Z.4/restriction-rank
- KTheoryLowDegrees:Z.4/restriction-determinant
- KTheoryLowDegrees:Z.4/pic-norm
- KTheoryLowDegrees:Z.4/rank-pic-equivalence
- KTheoryLowDegrees:Z.4/rank-pic-ring-equiv
- KTheoryLowDegrees:Z.4/k0-base-change-coordinates
- KTheoryLowDegrees:Z.4/rank-class-group-equivalence
- KTheoryLowDegrees:Z.1/ring-k0-transfer
- KTheoryLowDegrees:Z.1/ring-k0
- KTheoryLowDegrees:Z.3/determinant-hom

**Sources.**

- Kbook.II, Example 2.8.1, p. 13. The transfer map.
- Kbook.II, Exercise 2.2(b), p. 14. The composite transfer ∘ base change is multiplication by [S]; the other composite is not (source issue).

### Transfer from a product of Dedekind domains

**KTheoryLowDegrees:Z.4/restriction-determinant-product** · theorem · implementation unchecked.

Varying rank. Let ι be a finite type, (S_i) Dedekind domains, each a finite injective R-algebra as in the hypotheses, with d_i = finrank R S_i and 𝔰_i = det_R(S_i), and S := Π i, S_i with the componentwise R-algebra structure. S is a finitely generated projective R-module and det_R(S) = ∏ 𝔰_i. For x ∈ K₀(S) with components x_i = RingK0.map π_i x (Z.2/k0-pi) and r_i = rankℤ x_i: rankℤ_R (transfer x) = Σ d_i r_i and det_R (transfer x) = ∏ relNorm_{S_i/R} (det x_i) · 𝔰_i^{r_i}. The rank of x is the locally constant function equal to r_i on Spec S_i ⊆ Spec S, and 𝔰^{rank x} has meaning only as ∏ 𝔰_i^{r_i}.

**Hypotheses.**

- R is a Dedekind domain; ι is finite; each S_i satisfies the hypotheses of Z.4/pic-norm over R.

**Construction or proof.**

- Z.2/k0-pi: x = Σ_i transfer π_i x_i, the projections π_i : S → S_i making S_i a finitely generated projective S-module (Z.2/pi-ring-modules (a)).
- transfer_comp of Z.1/ring-k0-transfer: transfer (algebraMap R S) ∘ transfer π_i = transfer (algebraMap R S_i), since π_i ∘ algebraMap R S = algebraMap R S_i.
- Apply Z.4/k0-transfer-coordinates to each S_i and add in ℤ × Additive (Pic R).
- S ≃ Π S_i as R-modules, so det_R(S) = ∏ det_R(S_i) (Z.3/determinant-sum).

**Acceptance.**

- S = R × R (d_i = 1, 𝔰_i = 1): transfer (r₁, L₁; r₂, L₂) = (r₁ + r₂, L₁ L₂).
- No single exponent: for S = R × S′ with det_R(S′) = 𝔰′ ≠ 1, x with components (r₁, 1) and (r₂, 1) goes to (r₁ + d′r₂, 𝔰′^{r₂}), which depends on r₂ alone.
- ι empty: S = 0, K₀(S) = 0 and the transfer is 0.

**Prerequisites.**

- KTheoryLowDegrees:Z.4/k0-transfer-coordinates
- KTheoryLowDegrees:Z.2/k0-pi
- KTheoryLowDegrees:Z.2/pi-ring-modules
- KTheoryLowDegrees:Z.1/ring-k0-transfer
- KTheoryLowDegrees:Z.3/determinant-sum
- KTheoryLowDegrees:Z.2/rank-hom

**Sources.**

- Kbook.I, §3, determinant line bundle, p. 17. Determinants over a product are taken componentwise, which is why no single power of det_R(S) appears.
- Kbook.II, Example 2.8.1, p. 13. The transfer for S finitely generated projective over R.

### Extension of number fields on K₀

**KTheoryLowDegrees:Z.4/number-field-extension-k0** · application · implementation unchecked.

Let F ⊆ F′ be number fields (Algebra F F′), d = [F′ : F], R = 𝓞_F, S = 𝓞_{F′}, 𝔰 = det_{𝓞_F}(𝓞_{F′}) and St = (equivPic 𝓞_F).symm 𝔰 the Steinitz class of 𝓞_{F′}. Then 𝓞_{F′} is a finite injective 𝓞_F-algebra of rank d, and in the coordinates K₀ ≅ ℤ × Cl: base change K₀(𝓞_F) → K₀(𝓞_{F′}) is (n, c) ↦ (n, ClassGroup.extendedHom c); transfer K₀(𝓞_{F′}) → K₀(𝓞_F) is (n, c′) ↦ (d·n, ClassGroup.relNorm c′ · St^n); and transfer ∘ base change is (n, c) ↦ (d·n, c^d · St^n).

**Hypotheses.**

- F ⊆ F′ are number fields with the ring-of-integers algebra 𝓞_F → 𝓞_{F′} of Mathlib.

**Construction or proof.**

- Hypotheses: 𝓞_{F′} is a Noetherian, hence finite, 𝓞_F-module (NumberField.RingOfIntegers.extension_isNoetherian) and torsion-free (Mathlib's instance), of rank d = finrank F F′ (IsFractionRing.finrank_eq).
- Base change: Z.4/k0-base-change-coordinates with Z.4/pic-map-extended-hom.
- Transfer: Z.4/k0-transfer-coordinates with the class-group form of Z.4/pic-norm.
- Composite: Tau Ceti's ClassGroup.relNorm_extendedHom.

**Acceptance.**

- F = F′: d = 1 and both maps are the identity.
- F = ℚ: Cl(𝓞_ℚ) is trivial and the transfer is (n, c′) ↦ (d n, 1); for ℚ(√−5), transfer [P] = 2[𝓞_ℚ].
- The composite is multiplication by [𝓞_{F′}] = (d, St), not by d, when 𝓞_{F′} is not free over 𝓞_F (Cohen, Exercise 2.22, gives F = ℚ(√10), F′ = F(√−1)).

**Prerequisites.**

- KTheoryLowDegrees:Z.4/k0-base-change-coordinates
- KTheoryLowDegrees:Z.4/pic-map-extended-hom
- KTheoryLowDegrees:Z.4/k0-transfer-coordinates
- KTheoryLowDegrees:Z.4/pic-norm
- KTheoryLowDegrees:Z.4/rank-class-group-equivalence
- mathlib:NumberField.RingOfIntegers
- mathlib:NumberField.RingOfIntegers.extension_isNoetherian
- mathlib:IsFractionRing.finrank_eq
- tauceti:ClassGroup.relNorm
- tauceti:ClassGroup.relNorm_extendedHom

**Sources.**

- Cohen, §2.2, printed p. 77 (PDF p. 91). 𝓞_{F′} need not be free over 𝓞_F, so St can be nontrivial.
- Kbook.II, Exercise 2.2(b), p. 14. The composite f_*f^* is multiplication by [A].

### Projective classes determine projective modules

**KTheoryLowDegrees:Z.4/projective-class-injective** · lemma · implementation unchecked.

Over a Dedekind domain R, equality [P]=[Q] in K₀(R) for finite projective modules implies P ≃ₗ[R] Q.

**Hypotheses.**

- R is a Dedekind domain (Mathlib's IsDedekindDomain R: a Noetherian integrally closed domain of Krull dimension at most one; a field is allowed) with fraction field K = FractionRing R.
- K₀(R) is RingK0 R (KTheoryLowDegrees:Z.1/ring-k0: the split Grothendieck group of finiteProjectiveModules R), a commutative ring by KTheoryLowDegrees:Z.3/finite-projective-monoidal; [P] is the class of a finitely generated projective P. Spec R is connected (Z.2/rank-domain), rank is the integer rank RingK0.rankℤ of Z.2/rank-connected, and det is RingK0.detHom : K₀(R) → Pic(R) of Z.3/determinant-hom, with Pic(R) = CommRing.Pic R written multiplicatively.
- P, Q, M, N are finitely generated projective R-modules.

**Construction or proof.**

- Apply rankℤ and det to the class equality. determinant-hom-of identifies the determinant of a class with detProjective; projective-classification then gives the linear equivalence.

**Acceptance.**

- The rank-one free module and a nonprincipal invertible ideal have distinct K₀ classes.
- The zero class is represented only by the zero projective.

**Prerequisites.**

- KTheoryLowDegrees:Z.4/projective-classification
- KTheoryLowDegrees:Z.3/determinant-hom-of
- KTheoryLowDegrees:Z.2/rank-connected

**Sources.**

- Kbook.I, Proposition 3.4, p. 17. The classification for Dedekind domains; Weibel proves it for every one-dimensional Noetherian ring through Bass cancellation, and here it follows from Z.4/steinitz.
- Cohen, Corollary 1.2.26, printed p. 12 (PDF p. 26). The cancellation corollary.
- Cohen, Corollary 1.2.24, printed p. 11 (PDF p. 25). Uniqueness of the Steinitz ideal class, which is the step ⇐.

### Cancellation of projective summands

**KTheoryLowDegrees:Z.4/projective-cancellation** · lemma · implementation unchecked.

If R is a Dedekind domain and P,M,N are finite projective, P⊕M ≃ₗ[R] P⊕N implies M ≃ₗ[R] N.

**Hypotheses.**

- R is a Dedekind domain (Mathlib's IsDedekindDomain R: a Noetherian integrally closed domain of Krull dimension at most one; a field is allowed) with fraction field K = FractionRing R.
- K₀(R) is RingK0 R (KTheoryLowDegrees:Z.1/ring-k0: the split Grothendieck group of finiteProjectiveModules R), a commutative ring by KTheoryLowDegrees:Z.3/finite-projective-monoidal; [P] is the class of a finitely generated projective P. Spec R is connected (Z.2/rank-domain), rank is the integer rank RingK0.rankℤ of Z.2/rank-connected, and det is RingK0.detHom : K₀(R) → Pic(R) of Z.3/determinant-hom, with Pic(R) = CommRing.Pic R written multiplicatively.
- P, Q, M, N are finitely generated projective R-modules.

**Construction or proof.**

- Take ranks and determinants of the displayed equivalence; cancel the common integer rank and the invertible determinant of P. Apply projective-classification to M and N.

**Acceptance.**

- R⊕I ≃ R⊕J implies I ≃ J.
- The assertion includes a zero summand P.

**Prerequisites.**

- KTheoryLowDegrees:Z.4/projective-classification
- KTheoryLowDegrees:Z.3/determinant-sum
- KTheoryLowDegrees:Z.3/determinant-congr
- KTheoryLowDegrees:Z.2/rank-connected

**Sources.**

- Kbook.I, Proposition 3.4, p. 17. The classification for Dedekind domains; Weibel proves it for every one-dimensional Noetherian ring through Bass cancellation, and here it follows from Z.4/steinitz.
- Cohen, Corollary 1.2.26, printed p. 12 (PDF p. 26). The cancellation corollary.
- Cohen, Corollary 1.2.24, printed p. 11 (PDF p. 25). Uniqueness of the Steinitz ideal class, which is the step ⇐.

### Index ideal of a linear map

**KTheoryLowDegrees:Z.4/index-ideal** · definition · implementation unchecked.

For a commutative ring R, R-modules L,N and f:L→ₗ[R]N, define 𝔠(f) as the image ideal of c_f: N∨⊗L→ₗ[R]R, φ⊗l↦φ(f(l)). No injectivity or invertibility is needed for this definition.

**Hypotheses.**

- R is a commutative ring; L,N are R-modules and f is an R-linear map.

**Construction or proof.**

- Evaluation after composing a functional with f is bilinear, so TensorProduct.lift gives c_f. Its linear-map range is an R-submodule of R, hence an ideal.

**Acceptance.**

- For f=id_R the index ideal is R.
- For multiplication by 6 on ℤ it is (6).
- The zero map has zero index ideal.

**Prerequisites.**

- mathlib:Module.Dual
- mathlib:TensorProduct.lift
- mathlib:LinearMap.range

**Uses.**

- KTheoryLowDegrees:Z.4/invertible-injection-class: records the Picard class of an injective map of invertible modules
- KTheoryLowDegrees:Z.4/index-ideal-eq-rel-norm: applies the evaluation-image ideal to top exterior powers of an ideal inclusion

**Public API.**

- Module.Invertible.indexIdeal (constructor): The image ideal of the evaluation map c_f:N∨⊗L→R.
- Module.Invertible.indexIdeal_zero (simp): The index ideal of the zero map is ⊥.
- Module.Invertible.mem_indexIdeal (characterisation): r∈𝔠(f) iff r=c_f(t) for some t∈N∨⊗L.
- Module.Invertible.indexIdeal_tmul (compatibility): For φ∈N∨ and l∈L, φ(f(l)) belongs to 𝔠(f).
- Module.Invertible.indexIdeal_congr (functoriality): Pre- and post-composition with invertible-module automorphisms preserve the ideal (index-ideal-congr).
- Module.Invertible.indexIdeal_localisation (compatibility): For finite projective N, localisation commutes with the image ideal (index-ideal-localisation).

**Unit tests.**

- Module.Invertible.indexIdeal_id_test (computation): For id:ℤ→ℤ, 𝔠(id)=⊤.
- Module.Invertible.indexIdeal_six_test (compatibility): For f(n)=6n on ℤ, 𝔠(f)=Ideal.span {6}.
- Module.Invertible.indexIdeal_zero_test (degenerate): For the zero map ℤ→ℤ, 𝔠(0)=⊥, distinguishing it from the identity.

**Sources.**

- Cohen, Definition 1.2.33(2), printed p. 15 (PDF p. 29). Cohen defines the index of equal-rank torsion-free modules over a Dedekind domain. This node proves the stated evaluation-image formulation in its explicit broader hypotheses; it does not attribute the broader formulation to Cohen.

### The evaluation image is an invertible ideal

**KTheoryLowDegrees:Z.4/index-ideal-evaluation** · lemma · implementation unchecked.

For a commutative domain R, invertible R-modules L,N and an injective f:L→N, c_f is injective and identifies N∨⊗L with the nonzero invertible ideal 𝔠(f).

**Hypotheses.**

- R is a commutative domain; L, N are invertible R-modules (Module.Invertible) and f is injective.

**Construction or proof.**

- c_f is the composite of lTensor (Dual R N) f and the evaluation Dual R N ⊗ N ≃ R (Module.Invertible.linearEquiv). Dual R N is invertible, hence projective and flat, so lTensor f is injective (Module.Flat.lTensor_preserves_injective_linearMap). Thus c_f is injective and Dual N ⊗ L ≃ 𝔠(f) (LinearEquiv.ofInjective); Dual N ⊗ L is invertible (Mathlib instances), and nonzero since L ≠ 0.

**Acceptance.**

- The identity has image R.
- Multiplication by a nonzero nonunit has a proper, nonzero invertible image.

**Prerequisites.**

- KTheoryLowDegrees:Z.4/index-ideal
- mathlib:Module.Invertible.linearEquiv
- mathlib:Module.Flat.lTensor_preserves_injective_linearMap
- mathlib:LinearEquiv.ofInjective

**Sources.**

- Cohen, Definition 1.2.33(2), printed p. 15 (PDF p. 29). Cohen defines the index of equal-rank torsion-free modules over a Dedekind domain. This node proves the stated evaluation-image formulation in its explicit broader hypotheses; it does not attribute the broader formulation to Cohen.

### Index ideal is invariant under isomorphisms

**KTheoryLowDegrees:Z.4/index-ideal-congr** · lemma · implementation unchecked.

For invertible modules L,N and automorphisms h of L and g of N, 𝔠(g∘f∘h)=𝔠(f).

**Hypotheses.**

- R is a commutative domain; L, N are invertible R-modules (Module.Invertible) and f is injective.

**Construction or proof.**

- Replacing f by g ∘ f ∘ h composes c_f with the linear equivalence (Dual g) ⊗ h, which does not change the range.

**Acceptance.**

- Changing either free rank-one basis multiplies the generator by a unit and preserves its ideal.

**Prerequisites.**

- KTheoryLowDegrees:Z.4/index-ideal
- mathlib:Module.Invertible.linearEquiv

**Sources.**

- Cohen, Definition 1.2.33(2), printed p. 15 (PDF p. 29). Cohen defines the index of equal-rank torsion-free modules over a Dedekind domain. This node proves the stated evaluation-image formulation in its explicit broader hypotheses; it does not attribute the broader formulation to Cohen.

### Index ideal in free rank one

**KTheoryLowDegrees:Z.4/index-ideal-free** · lemma · implementation unchecked.

If L,N are free rank-one R-modules on l,n and f(l)=a·n, then 𝔠(f)=Ideal.span {a}.

**Hypotheses.**

- R is commutative; l,n are bases of the free rank-one modules L,N. Injectivity is not required.

**Construction or proof.**

- Free case: Dual N is free on the dual basis n*, and c_f(n* ⊗ l) = a generates the range.

**Acceptance.**

- Multiplication by 6 over ℤ has index (6).
- a=0 gives the zero ideal.

**Prerequisites.**

- KTheoryLowDegrees:Z.4/index-ideal

**Sources.**

- Cohen, Definition 1.2.33(2), printed p. 15 (PDF p. 29). Cohen defines the index of equal-rank torsion-free modules over a Dedekind domain. This node proves the stated evaluation-image formulation in its explicit broader hypotheses; it does not attribute the broader formulation to Cohen.

### Index ideal commutes with localisation

**KTheoryLowDegrees:Z.4/index-ideal-localisation** · lemma · implementation unchecked.

For a prime 𝔭 of a commutative ring R, finite projective N, and a linear f:L→N, the ideal generated by 𝔠(f) in R_𝔭 equals the evaluation image ideal 𝔠(f_𝔭).

**Hypotheses.**

- R is a commutative ring; N is finite projective; L is an R-module; f:L→N is linear; 𝔭 is prime.

**Construction or proof.**

- projective-dual-base-change identifies the local dual with R_𝔭⊗N∨. Tensor base change identifies the evaluation maps on pure tensors. Both image ideals are generated by the same localised values φ(f(l)); fractions supply the converse inclusion.

**Acceptance.**

- Localising the image (6) at (5) gives the unit ideal.
- Localising at (2) retains the principal ideal generated by 6.

**Prerequisites.**

- KTheoryLowDegrees:Z.4/index-ideal
- KTheoryLowDegrees:Z.3/projective-dual-base-change
- mathlib:Ideal.map_span

**Sources.**

- Cohen, Definition 1.2.33(2), printed p. 15 (PDF p. 29). Cohen defines the index of equal-rank torsion-free modules over a Dedekind domain. This node proves the stated evaluation-image formulation in its explicit broader hypotheses; it does not attribute the broader formulation to Cohen.

## KTheoryLowDegrees:Z.5

RS-18 narrows Z.5 to the general regular-curve theorem with its vector-bundle realisation, class formulas and dictionaries; the elliptic formula K₀(E) ≅ ℤ² ⊕ E(F) is EllipticKTheory E.2's and is not planned here. Targets and nodes. (1) 'Apply the categorical construction to finite locally free sheaves': vector-bundle (the interface: Mathlib's IsLocallyFree with finite local bases, compatible with Tau Ceti's IsInvertible and FinitelyPresentedSheaf), vector-bundle-extension-closed (the genuine exact structure induced from X.Modules, not the split one), vector-bundle-essentially-small, vector-bundle-k-zero (Tau Ceti's ExactK0), vector-bundle-affine-comparison, vector-bundle-k-zero-pullback, vector-bundle-k-zero-ring, vector-bundle-rank; exterior powers and determinants of vector bundles: sheaf-exterior-power, exterior-power-vector-bundle, exterior-power-extension-filtration, determinant-bundle, determinant-bundle-extension, determinant-bundle-tensor, vector-bundle-determinant, rank-determinant-surjective (Weibel II.8.1), picard-affine-comparison. (2) 'For a connected regular noetherian curve prove rank and determinant give K₀(X) ≅ ℤ ⊕ Pic(X)': regular-curve-integral (the hypothesis package), regular-curve-resolution-property (every noetherian scheme of dimension ≤ 1 has affine diagonal, so a regular one has the resolution property, Stacks 09N9 + 0F8A; separatedness is not needed), regular-curve-finite-resolution, curve-rank-determinant-equivalence, curve-k-zero-ring, dedekind-curve-comparison (agreement with Z.4 on Spec of a Dedekind domain), doubled-line-example (the theorem for a non-separated curve). (3) 'the structure-sheaf and skyscraper-sheaf class formulas through the K/G comparison, so that a divisor class agrees with the line-bundle class': regular-curve-cartan-iso (through SchemeKTheoryOperations S.2's vector-bundle comparison and Poincaré duality), skyscraper-class, effective-divisor-class, principal-divisor-class-vanishes, generic-rank-kernel, point-class-map (det ∘ cl = Tau Ceti's classGroupToLineBundleClassHom), line-bundle-divisorial (Cl(X) ≅ Pic(X) for every regular noetherian curve, the general-curve dictionary RS-18 leaves to Z.5; JacobianChallenge layer A is its smooth proper case). (4) The elliptic paragraph: exported to EllipticKTheory E.2 by RS-18 (E.2 cites curve-rank-determinant-equivalence, skyscraper-class, curve-k-zero-ring, line-bundle-divisorial); the non-rational-origin gate is kept in the acceptance of curve-rank-determinant-equivalence and in KTheoryLowDegrees:Z.6/pointless-conic-test. Weibel's proof of II.8.2.1 passes through an affine complement X − P justified only for curves over a field; the plan uses the generic-point localisation sequence instead (source issue). Locally constant Picard powers are supplied by pic-disjoint-cover-ext, pic-locally-constant-module, pic-locally-constant-pullback and pic-locally-constant-affine. Exterior and tensor-determinant exercise arguments are explicitly expanded; rank-determinant uses the existing square-zero extension. This does not close the general Picard supplier request or the representation-theoretic gap.

Refinements still required:

- The group structure of Pic(X) for a general scheme (inverse by the dual) is requested from JacobianChallenge layer A; on regular curves line-bundle-divisorial supplies it independently.
- Apply the confirmed S.6→Z.5/S.7→Z.6 edge removals and the early vector-bundle sub-layer proposal during assembly; the packet imports S.2/S.3 and Z.3 as mathematically required.

### Vector bundles on a scheme

**KTheoryLowDegrees:Z.5/vector-bundle** · definition · implementation unchecked.

Let X be a scheme and E an object of X.Modules (Mathlib's SheafOfModules X.ringCatSheaf). E is a vector bundle (a finite locally free O_X-module) if it admits local generator data q (Mathlib's SheafOfModules.LocalGeneratorsData) with q.IsLocallyFreeData and q.IsFiniteType: there is an open cover {U_i} of X and, for each i, a finite family of sections of E over U_i freely generating E|U_i, so that E|U_i ≅ O_{U_i}^{⊕n_i}. This is the object property isVectorBundle X on X.Modules; Vect(X) := (isVectorBundle X).FullSubcategory, with morphisms all O_X-module maps. For x ∈ X the rank rank_x(E) is the rank of the free O_{X,x}-module E_x, equal to n_i for every U_i ∋ x; x ↦ rank_x(E) is locally constant. A vector bundle of constant rank one is exactly an invertible sheaf in Tau Ceti's sense (TauCeti.SheafOfModules.IsInvertible), and every vector bundle is finitely presented, so on a locally noetherian X it is coherent.

**Hypotheses.**

- X is an arbitrary scheme; the stalks O_{X,x} are nonzero local rings, so the rank at a point is well defined (invariant basis number).
- The rank may vary between connected components; the zero sheaf is a vector bundle of rank 0 everywhere.
- Mathlib's IsLocallyFree alone allows infinite local bases; finiteness of every local basis is part of the definition.

**Construction or proof.**

- Define isVectorBundle X E :⇔ ∃ q : LocalGeneratorsData E, q.IsLocallyFreeData ∧ q.IsFiniteType, following Tau Ceti's rank-one analogue TauCeti.SheafOfModules.IsInvertible (whose index types are nonempty subsingletons).
- Closure under isomorphism: transport local generator data along an isomorphism, exactly as TauCeti.SheafOfModules.IsInvertible.of_iso does; so isVectorBundle X is closed under isomorphisms (an ObjectProperty.IsClosedUnderIsomorphisms instance).
- Free sheaves: for a finite type I, SheafOfModules.free I with SheafOfModules.free.generatingSections I is a vector bundle (its generating sections are free, Mathlib's IsLocallyFreeData instance).
- Comparisons: a vector bundle is IsLocallyFree (LocalGeneratorsData.isLocallyFree) and IsFiniteType, hence quasi-coherent (Mathlib's instance for IsLocallyFree) and finitely presented (Tau Ceti's LocalGeneratorsData.IsLocallyFreeData.isFinitePresentation); an invertible sheaf is a vector bundle whose local bases are singletons (IsInvertible.isLocallyFree plus finiteness of a subsingleton type), and conversely a vector bundle of constant rank one has local bases that are nonempty subsingletons.
- Rank: at x, E_x ≅ O_{X,x}^{⊕n_i} for any U_i ∋ x (stalks commute with finite direct sums), and a nonzero commutative local ring has invariant basis number, so n_i depends only on x; it is constant on U_i, hence locally constant (Stacks 01C9).

**Acceptance.**

- O_X^{⊕3} is a vector bundle of rank 3 at every point; the zero sheaf has rank 0.
- On an integral curve the skyscraper k(y) at a closed point is coherent but not a vector bundle: its stalk at y is a nonzero torsion O_{X,y}-module.

**Prerequisites.**

- mathlib:AlgebraicGeometry.Scheme.Modules
- mathlib:SheafOfModules.LocalGeneratorsData
- mathlib:SheafOfModules.LocalGeneratorsData.IsLocallyFreeData
- mathlib:SheafOfModules.LocalGeneratorsData.IsFiniteType
- mathlib:SheafOfModules.LocalGeneratorsData.isLocallyFree
- mathlib:SheafOfModules.IsLocallyFree
- mathlib:SheafOfModules.IsFiniteType
- mathlib:SheafOfModules.free
- mathlib:SheafOfModules.free.generatingSections
- mathlib:SheafOfModules.IsQuasicoherent
- tauceti:SheafOfModules.LocalGeneratorsData.IsLocallyFreeData.isFinitePresentation
- tauceti:TauCeti.SheafOfModules.IsInvertible
- tauceti:TauCeti.SheafOfModules.IsInvertible.isLocallyFree
- tauceti:TauCeti.SheafOfModules.IsInvertible.of_iso
- tauceti:TauCeti.AlgebraicGeometry.FinitelyPresentedSheaf
- mathlib:CategoryTheory.ObjectProperty.FullSubcategory
- mathlib:CategoryTheory.ObjectProperty.IsClosedUnderIsomorphisms

**Uses.**

- Kbook.2013 II.7.1.3: VB(X) is the exact category whose K_0 is K_0(X)
- KTheoryLowDegrees:Z.5/vector-bundle-k-zero: the objects of the exact category
- SchemeKTheoryOperations:S.1/vector-bundle-comparison: A = Vect(X), the additive category of finite locally free modules
- SchemeKTheoryOperations:S.6/vector-bundle-lambda-ring: λ^k[E] = [Λ^kE] is defined on vector bundles
- EllipticKTheory:E.2/K0-of-a-curve: classes [L] of line bundles and of vector bundles on a curve

**Public API.**

- TauCeti.AlgebraicGeometry.isVectorBundle (constructor): isVectorBundle X : ObjectProperty X.Modules, E ↦ ∃ q, q.IsLocallyFreeData ∧ q.IsFiniteType.
- TauCeti.AlgebraicGeometry.VectorBundle (structure): VectorBundle X := (isVectorBundle X).FullSubcategory, a full additive subcategory of X.Modules.
- TauCeti.AlgebraicGeometry.isVectorBundle_iff_locallyIso_free (characterisation): E is a vector bundle iff every point has an open neighbourhood U and n ∈ ℕ with E|U ≅ O_U^{⊕n}.
- TauCeti.AlgebraicGeometry.isVectorBundle.isClosedUnderIsomorphisms (instance): isVectorBundle X is closed under isomorphisms.
- TauCeti.AlgebraicGeometry.isVectorBundle_free (example): For a finite type I, SheafOfModules.free I is a vector bundle; in particular O_X is.
- TauCeti.AlgebraicGeometry.isVectorBundle.isLocallyFree (compatibility): A vector bundle is IsLocallyFree and IsFiniteType, hence IsQuasicoherent.
- TauCeti.AlgebraicGeometry.isVectorBundle.isFinitePresentation (compatibility): A vector bundle is finitely presented, so it defines an object of FinitelyPresentedSheaf X.
- TauCeti.AlgebraicGeometry.isInvertible_iff_isVectorBundle_rankOne (compatibility): TauCeti.SheafOfModules.IsInvertible E ↔ isVectorBundle X E ∧ ∀ x, rankAt E x = 1.
- TauCeti.AlgebraicGeometry.VectorBundle.rankAt (data): rankAt E x ∈ ℕ, the rank of the free O_{X,x}-module E_x.
- TauCeti.AlgebraicGeometry.VectorBundle.isLocallyConstant_rankAt (other): x ↦ rankAt E x is locally constant; it is constant on a connected X.
- TauCeti.AlgebraicGeometry.VectorBundle.rankAt_eq_of_iso (simp): Isomorphic vector bundles have the same rank function.
- TauCeti.AlgebraicGeometry.isVectorBundle_restrict (functoriality): For an open immersion j: U → X, E|U is a vector bundle with rankAt (E|U) u = rankAt E (j u).

**Unit tests.**

- TauCeti.AlgebraicGeometry.isVectorBundle_zero_test (degenerate): The zero O_X-module is a vector bundle and rankAt 0 x = 0 for every x.
- TauCeti.AlgebraicGeometry.rankAt_free_three_test (computation): rankAt (SheafOfModules.free (Fin 3)) x = 3 for every x ∈ X.
- TauCeti.AlgebraicGeometry.isVectorBundle_weilDivisorSheaf_test (compatibility): For X integral noetherian of dimension ≤ 1 with DVR codimension-one stalks and D a Weil divisor, the underlying sheaf of Tau Ceti's SchemeWeilDivisor.toInvertibleSheaf D is a vector bundle of rank 1.
- TauCeti.AlgebraicGeometry.not_isVectorBundle_free_nat_test (non-example): For X nonempty, SheafOfModules.free ℕ is IsLocallyFree but not a vector bundle: it is not of finite type.
- TauCeti.AlgebraicGeometry.not_isVectorBundle_skyscraper_test (non-example): On Spec ℤ the coherent sheaf (ℤ/2)~ is not a vector bundle: its stalk at (2) is nonzero and killed by 2, so it is not free.

**Sources.**

- Kbook.2013, I.5, Definition 5.1, PDF p. 54 (book p. 46). The definition; here the ringed space is a scheme and the finiteness is carried by finite local bases.
- Stacks, Sheaves of Modules, Definition 14.1 (tag 01C6). The same notion, in the local-generator form Mathlib's SheafOfModules.LocalGeneratorsData encodes.
- Stacks, Sheaves of Modules, Lemma 14.4 (tag 01C9). The rank function, finite-valued for a vector bundle.

### Vector bundles form an exact subcategory

**KTheoryLowDegrees:Z.5/vector-bundle-extension-closed** · lemma · implementation unchecked.

Let X be a scheme. (1) isVectorBundle X contains a zero object and is closed under binary biproducts. (2) It is extension closed for Tau Ceti's canonical exact structure ExactStructure.abelian X.Modules: if 0 → E′ → E → E″ → 0 is a short exact sequence of O_X-modules with E′ and E″ vector bundles, then E is a vector bundle, and every point has an open neighbourhood U over which the sequence splits, E|U ≅ E′|U ⊕ E″|U. (3) Vect(X) is closed under kernels of epimorphisms: the kernel of an epimorphism E → E″ of vector bundles is a vector bundle. Consequently ExactStructure.fullSubcategory gives the exact structure vectorBundleExactStructure X on Vect(X); its conflations are exactly the short exact sequences of O_X-modules whose three terms are vector bundles, and they need not split globally.

**Hypotheses.**

- X is an arbitrary scheme; the stalks of O_X are local rings (used in (3)).

**Construction or proof.**

- (1) The zero sheaf has the empty local basis. For E, F with locally free finite data on covers {U_i}, {V_j}, restrict both to the common refinement {U_i ∩ V_j} and take the disjoint union of the two finite bases; this is locally free finite data for E ⊞ F.
- (2) Let x ∈ X and U ∋ x open with E″|U free on sections t_1, …, t_m. An epimorphism of sheaves of modules is locally surjective on sections, so after shrinking U the t_j lift to s_j ∈ E(U). The map O_U^{⊕m} → E|U, e_j ↦ s_j, is a section of E|U → E″|U, so E|U ≅ E′|U ⊕ E″|U; shrinking U until E′|U is free as well, E|U is finite free. Hence E is a vector bundle and the sequence is locally split.
- (3) For an epimorphism E → E″ of vector bundles with kernel K, the local splitting of (2) exhibits K|U as a direct summand of the finite free E|U; since the stalks of O_X are local rings, a direct summand of a finite locally free module is finite locally free (Stacks 0BCI).
- The induced exact structure is ExactStructure.fullSubcategory for the extension-closed property ((2) with Tau Ceti's ExactStructure.isExtensionClosed_abelian_iff and Mathlib's ObjectProperty.IsClosedUnderExtensions); its conflations are identified by ExactStructure.fullSubcategory_conflation_iff and ExactStructure.abelian_conflation.

**Acceptance.**

- On P¹_F the Euler sequence 0 → O(−2) → O(−1)^{⊕2} → O → 0 is a conflation of Vect(P¹_F) that does not split (Hom(O, O(−1)^{⊕2}) = 0).
- 0 → O(−y) → O → k(y) → 0 on a curve is exact in X.Modules but is not a conflation of Vect(X): k(y) is not a vector bundle.

**Prerequisites.**

- KTheoryLowDegrees:Z.5/vector-bundle
- tauceti:TauCeti.ExactStructure.abelian
- tauceti:TauCeti.ExactStructure.abelian_conflation
- tauceti:TauCeti.ExactStructure.IsExtensionClosed
- tauceti:TauCeti.ExactStructure.isExtensionClosed_abelian_iff
- tauceti:TauCeti.ExactStructure.fullSubcategory
- tauceti:TauCeti.ExactStructure.fullSubcategory_conflation_iff
- mathlib:CategoryTheory.ObjectProperty.IsClosedUnderExtensions
- mathlib:CategoryTheory.ObjectProperty.ContainsZero
- mathlib:CategoryTheory.ObjectProperty.IsClosedUnderBinaryProducts
- mathlib:CategoryTheory.ShortComplex.ShortExact

**Sources.**

- Kbook.2013, II.7, Example 7.1.3, PDF p. 138 (book p. 130). The exact structure induced from O_X-mod; the extension closure is what makes it an exact subcategory.
- Kbook.2013, II.7, Example 7.1.3, PDF p. 138 (book p. 130). The conflations need not split globally.
- Stacks, Sheaves of Modules, Section 26 (tag 0B37). The admissible maps, which is (3) together with (2).
- Stacks, Sheaves of Modules, Lemma 14.6 (tag 0BCI). The input for kernels of surjections.

### Vector bundles form an essentially small category

**KTheoryLowDegrees:Z.5/vector-bundle-essentially-small** · lemma · implementation unchecked.

For a scheme X : Scheme.{u}, the full subcategory Vect(X) of X.Modules is essentially small in universe u (ObjectProperty.EssentiallySmall.{u} (isVectorBundle X)): there is a family of vector bundles indexed by a u-small type such that every vector bundle is isomorphic to one of them. This is the smallness hypothesis of TauCeti.ExactK0.

**Hypotheses.**

- X : Scheme.{u}; X.Modules is not small, so the statement is about isomorphism classes only.

**Construction or proof.**

- A vector bundle E is determined up to isomorphism by gluing data: an open cover of X indexed by a set of opens (a u-small type, since Opens X is), a function assigning each member its rank n_i, and transition matrices g_ij ∈ GL_{n_ij}(O_X(U_i ∩ U_j)) satisfying the cocycle condition; E is isomorphic to the sheaf glued from the O_{U_i}^{⊕n_i} along the g_ij.
- The type of all such gluing data is u-small (the opens, the ranks and the matrices over the rings O_X(W) all live in universe u), so the glued sheaves form the required family (ObjectProperty.EssentiallySmall via a small family of representatives).
- This is Stacks' argument for invertible modules (Sheaves of Modules, Lemma 25.8), with local bases of finite cardinality r(j) in place of rank one.

**Acceptance.**

- Every invertible sheaf on X is isomorphic to a member of the family, so the Picard classes form a u-small type (Stacks 01CW).
- TauCeti.ExactK0 (vectorBundleExactStructure X) is defined without raising the universe.

**Prerequisites.**

- KTheoryLowDegrees:Z.5/vector-bundle
- mathlib:CategoryTheory.ObjectProperty.EssentiallySmall
- mathlib:TopologicalSpace.Opens

**Sources.**

- Stacks, Sheaves of Modules, Section 26 (tag 0B37). The statement; the source omits the proof.
- Stacks, Sheaves of Modules, Lemma 25.8 (tag 01CW), proof. The gluing argument, which applies verbatim to finite local bases.

### K₀ of vector bundles on a scheme

**KTheoryLowDegrees:Z.5/vector-bundle-k-zero** · definition · implementation unchecked.

For a scheme X, K₀(Vect X) := TauCeti.ExactK0 (vectorBundleExactStructure X), the exact Grothendieck group of Vect(X) with the exact structure of KTheoryLowDegrees:Z.5/vector-bundle-extension-closed: the free abelian group on isomorphism classes of vector bundles modulo [E] = [E′] + [E″] for every short exact sequence 0 → E′ → E → E″ → 0 of vector bundles. Write [E] := ExactK0.of E. It is not the split Grothendieck group of Vect(X): non-split extensions impose relations. No new presentation is introduced; the whole ExactK0 API (of_conflation, lift, liftEquiv, hom_ext, induction_on, map, mapEquiv, BiadditiveInvariant.bilift) applies.

**Hypotheses.**

- X is an arbitrary scheme (Vect(X) is essentially small by KTheoryLowDegrees:Z.5/vector-bundle-essentially-small).
- Weibel writes K₀(X) for this group only for quasi-projective X; for general X it can differ from K₀(X) := K₀(D_perf(O_X)) (the plane with doubled origin), and the comparison is KTheoryLowDegrees:Z.6/vector-bundle-k-zero-pi-zero under the resolution property.

**Construction or proof.**

- Instantiate TauCeti.ExactK0 at the exact structure of KTheoryLowDegrees:Z.5/vector-bundle-extension-closed; the smallness instance is KTheoryLowDegrees:Z.5/vector-bundle-essentially-small.
- The defining relation for a short exact sequence of vector bundles is ExactK0.of_conflation through ExactStructure.fullSubcategory_conflation_iff; biproducts and zero objects give ExactK0.of_biprod and ExactK0.of_eq_zero_of_isZero.
- Additive invariants: a function on vector bundles, invariant under isomorphism and additive on short exact sequences, descends by ExactK0.lift (universal property ExactK0.liftEquiv); two homomorphisms agreeing on classes agree (ExactK0.hom_ext).

**Acceptance.**

- [O_X^{⊕n}] = n[O_X]; for a line bundle L on P¹_F, [O(−2)] + [O] = 2[O(−1)] (Euler sequence).
- K₀(Vect ∅) = 0.

**Prerequisites.**

- KTheoryLowDegrees:Z.5/vector-bundle-extension-closed
- KTheoryLowDegrees:Z.5/vector-bundle-essentially-small
- tauceti:TauCeti.ExactK0
- tauceti:TauCeti.ExactK0.of
- tauceti:TauCeti.ExactK0.of_conflation
- tauceti:TauCeti.ExactK0.of_biprod
- tauceti:TauCeti.ExactK0.of_eq_zero_of_isZero
- tauceti:TauCeti.ExactK0.lift
- tauceti:TauCeti.ExactK0.lift_of
- tauceti:TauCeti.ExactK0.liftEquiv
- tauceti:TauCeti.ExactK0.hom_ext
- tauceti:TauCeti.ExactK0.induction_on

**Uses.**

- Kbook.2013 II.8.1: rank and determinant are defined on K₀VB(X)
- KTheoryLowDegrees:Z.5/curve-rank-determinant-equivalence: the group computed as ℤ ⊕ Pic(X) for a regular curve
- SchemeKTheoryOperations:S.2/vector-bundle-k-theory-comparison: K₀(Vect X) ≅ K₀(X) under the resolution property
- SchemeKTheoryOperations:S.6/vector-bundle-lambda-ring: the λ-ring K₀(Vect X)
- SchemeKTheoryOperations:S.7/scheme-gamma-filtration: the γ-filtration of K₀(Vect X)
- EllipticKTheory:E.2/K0-of-an-elliptic-curve: K₀(E) ≅ ℤ² ⊕ E(F) is a statement about this group

**Public API.**

- TauCeti.AlgebraicGeometry.KTheory.VectorBundleK0 (structure): VectorBundleK0 X := ExactK0 (vectorBundleExactStructure X), an AddCommGroup.
- TauCeti.AlgebraicGeometry.KTheory.VectorBundleK0.of (constructor): of E = [E] for a vector bundle E.
- TauCeti.AlgebraicGeometry.KTheory.VectorBundleK0.of_congr (simp): E ≅ F → [E] = [F].
- TauCeti.AlgebraicGeometry.KTheory.VectorBundleK0.of_shortExact (relation): For a short exact sequence 0 → E′ → E → E″ → 0 of O_X-modules with vector bundle terms, [E] = [E′] + [E″].
- TauCeti.AlgebraicGeometry.KTheory.VectorBundleK0.of_biprod (simp): [E ⊞ F] = [E] + [F]; [0] = 0.
- TauCeti.AlgebraicGeometry.KTheory.VectorBundleK0.of_free (simp): [O_X^{⊕n}] = n • [O_X].
- TauCeti.AlgebraicGeometry.KTheory.VectorBundleK0.lift (universal-property): lift c : VectorBundleK0 X →+ G for c isomorphism-invariant and additive on short exact sequences of vector bundles; lift_of, lift_unique.
- TauCeti.AlgebraicGeometry.KTheory.VectorBundleK0.hom_ext (extensionality): Two additive maps out of VectorBundleK0 X agreeing on every [E] are equal.
- TauCeti.AlgebraicGeometry.KTheory.VectorBundleK0.induction_on (other): Induction on classes of vector bundles, with zero, [E] and subtraction steps.
- TauCeti.AlgebraicGeometry.KTheory.VectorBundleK0.exists_eq_sub (characterisation): Every x ∈ K₀(Vect X) is [E] − [F] for vector bundles E, F.
- TauCeti.AlgebraicGeometry.KTheory.VectorBundleK0.fromSplit (compatibility): The canonical surjection SplitK0 Vect(X) → K₀(Vect X), [E] ↦ [E] (ExactK0.fromSplit), not injective in general.

**Unit tests.**

- TauCeti.AlgebraicGeometry.KTheory.VectorBundleK0.empty_test (degenerate): For X = ∅ the group VectorBundleK0 X is trivial.
- TauCeti.AlgebraicGeometry.KTheory.VectorBundleK0.free_test (computation): [O_X^{⊕2} ⊞ O_X] = 3 • [O_X] in VectorBundleK0 X.
- TauCeti.AlgebraicGeometry.KTheory.VectorBundleK0.spec_field_test (compatibility): For a field F, VectorBundleK0 (Spec F) ≃+ ℤ, [E] ↦ rank E, through KTheoryLowDegrees:Z.5/vector-bundle-affine-comparison and RingK0.divisionRingEquiv F.
- TauCeti.AlgebraicGeometry.KTheory.VectorBundleK0.euler_sequence_test (characterisation): On P¹_F, [O(−1)^{⊕2}] = [O(−2)] + [O] in VectorBundleK0, although O(−1)^{⊕2} ≇ O(−2) ⊞ O.
- TauCeti.AlgebraicGeometry.KTheory.VectorBundleK0.not_split_test (non-example): On P¹_F the canonical map SplitK0 Vect(P¹_F) → VectorBundleK0 P¹_F is not injective: [O(−1) ⊞ O(−1)] − [O(−2) ⊞ O] lies in its kernel (Euler sequence) but is nonzero in SplitK0, because the biproduct-additive invariant E ↦ dim_F Γ(P¹_F, E) takes the values 0 and 1 on the two bundles.

**Sources.**

- Kbook.2013, II.7, Example 7.1.3, PDF p. 138 (book p. 130). The group; the notation K₀(Vect X) keeps it distinct from K₀ of perfect complexes on a general scheme.
- Stacks, Sheaves of Modules, Section 26 (tag 0B37). The same group, with the presentation by short exact sequences of finite locally free modules.

### Vector bundles on an affine scheme are finite projective modules

**KTheoryLowDegrees:Z.5/vector-bundle-affine-comparison** · comparison · implementation unchecked.

Let R be a commutative ring and X = Spec R. The functor P ↦ P~ (Mathlib's tilde.functor) restricts to an exact equivalence between the finitely generated projective R-modules, with Tau Ceti's finiteProjectiveModulesExactStructure R (the split structure), and Vect(Spec R) with vectorBundleExactStructure; its quasi-inverse is global sections. Consequently every conflation of Vect(Spec R) splits, and ExactK0.mapEquiv gives RingK0 R ≃+ K₀(Vect Spec R), [P] ↦ [P~], composing with KTheoryLowDegrees:Z.1/ring-k0-exact. Under it rank_x(P~) = rankAtStalk P x.

**Hypotheses.**

- R is a commutative ring; the zero ring gives the empty scheme and both groups are zero.

**Construction or proof.**

- tildeEquiv identifies R-modules with quasi-coherent O_{Spec R}-modules; a vector bundle is quasi-coherent (KTheoryLowDegrees:Z.5/vector-bundle), so it is M~ for M = Γ(Spec R, E).
- M~ is a vector bundle iff M is finitely generated projective: if M~ is free of finite rank on each D(f_i) of a cover then each M_{f_i} is finite free, so M is finitely presented and locally free, hence finite projective; conversely a finite projective module is locally free of finite rank on a Zariski cover by basic opens (Weibel I.5.1.2, Lemma I.5.1.3(4)).
- Short exact sequences correspond under the exact functor tilde (exactness of tilde and of Γ on quasi-coherent sheaves over an affine scheme), and a short exact sequence of finitely generated projective modules splits, so the equivalence is exact in both directions (TauCeti.finiteProjectiveModulesExactStructure_eq_split).
- Apply ExactK0.mapEquiv, then KTheoryLowDegrees:Z.1/ring-k0-exact to pass from ExactK0 of the finite projectives to RingK0 R; the rank statement is Z.2/rank-hom's normalisation read at stalks (P~)_p = P_p.

**Acceptance.**

- For a field F: K₀(Vect Spec F) ≅ RingK0 F ≅ ℤ by dimension (KTheoryLowDegrees:Z.2/division-ring-k0).
- For R = ℤ[√−5] and I = (2, 1 + √−5), I~ is a line bundle on Spec R not isomorphic to O (KTheoryLowDegrees:Z.2/nonfree-projective-ideal).

**Prerequisites.**

- KTheoryLowDegrees:Z.5/vector-bundle-k-zero
- KTheoryLowDegrees:Z.5/vector-bundle-extension-closed
- KTheoryLowDegrees:Z.1/ring-k0
- KTheoryLowDegrees:Z.1/ring-k0-exact
- KTheoryLowDegrees:Z.2/rank-hom
- mathlib:AlgebraicGeometry.tilde.functor
- mathlib:AlgebraicGeometry.tildeEquiv
- tauceti:TauCeti.finiteProjectiveModulesExactStructure
- tauceti:TauCeti.finiteProjectiveModulesExactStructure_eq_split
- tauceti:TauCeti.ExactK0.mapEquiv
- tauceti:TauCeti.finiteProjectiveModules

**Sources.**

- Kbook.2013, I.5, Example 5.1.2, PDF p. 54–55 (book pp. 46–47). The equivalence underlying the comparison.
- Kbook.2013, I.5, Lemma 5.1.3, PDF p. 55 (book p. 47). Condition (4) of the lemma, the local characterisation used on basic opens. Only valid condition (4) is used; condition (2) needs finite presentation, recorded in E23.

### Pullback on K₀ of vector bundles

**KTheoryLowDegrees:Z.5/vector-bundle-k-zero-pullback** · construction · implementation unchecked.

For a morphism of schemes f : X → Y, Mathlib's AlgebraicGeometry.Scheme.Modules.pullback f sends vector bundles to vector bundles (f*O_V^{⊕n} ≅ O_{f⁻¹V}^{⊕n}) and short exact sequences of vector bundles to short exact sequences (they are locally split, KTheoryLowDegrees:Z.5/vector-bundle-extension-closed), so it induces f* : K₀(Vect Y) →+ K₀(Vect X), f*[E] = [f*E], by ExactK0.map. Pullback is functorial: (g ∘ f)* = f* ∘ g* and id* = id, through Mathlib's pullbackComp and pullbackId. For an open immersion j : U → X, j*[E] = [E|U]; for Spec S → Spec R given by R → S, under KTheoryLowDegrees:Z.5/vector-bundle-affine-comparison f* is scalar extension KTheoryLowDegrees:Z.1/ring-k0-map.

**Hypotheses.**

- f is an arbitrary morphism of schemes; no flatness is needed because conflations of vector bundles are locally split.

**Construction or proof.**

- Pullback preserves vector bundles: f* commutes with restriction to opens and f*(O_V^{⊕n}) ≅ O^{⊕n} (pullback is a left adjoint, Mathlib's pullbackPushforwardAdjunction, so it preserves finite biproducts and sends O to O).
- Pullback preserves conflations of Vect(Y): a locally split short exact sequence stays locally split, hence exact, after applying the additive functor f*.
- Apply ExactK0.map to the conflation-exact functor; functoriality is ExactK0.map_comp and ExactK0.map_congr with pullbackComp and pullbackId.
- Affine case: pullback along Spec S → Spec R sends M~ to (S ⊗_R M)~ on quasi-coherent modules, which on classes is [P] ↦ [S ⊗_R P], Z.1/ring-k0-map.

**Acceptance.**

- j*[O_X] = [O_U] for an open immersion j.
- For the closed point i : Spec F_p → Spec ℤ, i*[ℤ~] = [F_p~].

**Prerequisites.**

- KTheoryLowDegrees:Z.5/vector-bundle-k-zero
- KTheoryLowDegrees:Z.5/vector-bundle-extension-closed
- KTheoryLowDegrees:Z.5/vector-bundle-affine-comparison
- KTheoryLowDegrees:Z.1/ring-k0-map
- mathlib:AlgebraicGeometry.Scheme.Modules.pullback
- mathlib:AlgebraicGeometry.Scheme.Modules.pullbackComp
- mathlib:AlgebraicGeometry.Scheme.Modules.pullbackId
- mathlib:AlgebraicGeometry.Scheme.Modules.pullbackPushforwardAdjunction
- mathlib:AlgebraicGeometry.Scheme.Modules.restrictFunctor
- tauceti:TauCeti.ExactK0.map
- tauceti:TauCeti.ExactK0.map_of
- tauceti:TauCeti.ExactStructure.IsConflationExact

**Uses.**

- Kbook.2013 II.8: K₀ is a contravariant functor from schemes to commutative rings
- KTheoryLowDegrees:Z.6/localisation-projective-class: restriction to an open subscheme sends [E] to [E|U]
- KTheoryLowDegrees:Z.6/vector-bundle-k-zero-pi-zero: naturality of the comparison with π₀K(X)
- EllipticKTheory:E.2/K0-of-a-curve: naturality of the curve equivalence for pullback along open immersions and finite morphisms

**Public API.**

- TauCeti.AlgebraicGeometry.KTheory.VectorBundleK0.pullback (constructor): pullback f : VectorBundleK0 Y →+ VectorBundleK0 X for f : X ⟶ Y.
- TauCeti.AlgebraicGeometry.KTheory.VectorBundleK0.pullback_of (simp): pullback f [E] = [f*E].
- TauCeti.AlgebraicGeometry.KTheory.VectorBundleK0.pullback_id (functoriality): pullback (𝟙 X) = id.
- TauCeti.AlgebraicGeometry.KTheory.VectorBundleK0.pullback_comp (functoriality): pullback (f ≫ g) = pullback f ∘ pullback g.
- TauCeti.AlgebraicGeometry.KTheory.VectorBundleK0.pullback_restrict (simp): For an open immersion j : U ⟶ X, pullback j [E] = [E|U].
- TauCeti.AlgebraicGeometry.KTheory.VectorBundleK0.pullback_spec (compatibility): Under the affine comparison, pullback (Spec.map φ) = RingK0.map φ.

**Unit tests.**

- TauCeti.AlgebraicGeometry.KTheory.VectorBundleK0.pullback_id_test (degenerate): pullback (𝟙 X) x = x for every x.
- TauCeti.AlgebraicGeometry.KTheory.VectorBundleK0.pullback_unit_test (computation): pullback f [O_Y] = [O_X]; pullback f (3 • [O_Y]) = 3 • [O_X].
- TauCeti.AlgebraicGeometry.KTheory.VectorBundleK0.pullback_spec_test (compatibility): For ℤ → ℚ, pullback (Spec ℚ → Spec ℤ) corresponds to RingK0.map (algebraMap ℤ ℚ), and [ℤ~] ↦ [ℚ~].
- TauCeti.AlgebraicGeometry.KTheory.VectorBundleK0.pullback_not_injective_test (non-example): For A = ℤ[√−5] and the generic point Spec ℚ(√−5) → Spec A, pullback kills [I~] − [O] with I = (2, 1 + √−5), a nonzero class: pullback is not injective.

**Sources.**

- Kbook.2013, II.8, introduction, PDF p. 153 (book p. 145). The pullback homomorphism.
- Stacks, Sheaves of Modules, Lemma 14.3 (tag 01C8). Pullback preserves (finite) local freeness.

### The ring structure on K₀ of vector bundles

**KTheoryLowDegrees:Z.5/vector-bundle-k-zero-ring** · construction · implementation unchecked.

For a scheme X, the tensor product of O_X-modules (Tau Ceti's TauCeti.SheafOfModules.tensorProduct) preserves vector bundles (O^{⊕m} ⊗ O^{⊕n} ≅ O^{⊕mn} locally) and is exact in each variable on Vect(X) (tensoring a locally split sequence with a vector bundle gives a locally split sequence). The resulting biadditive invariant (E, F) ↦ [E ⊗ F] descends by ExactK0.BiadditiveInvariant.bilift to a multiplication on K₀(Vect X) with [E]·[F] = [E ⊗ F], making K₀(Vect X) a commutative ring with unit 1 = [O_X]; the associator, unitors and braiding of Tau Ceti's sheaf tensor product give associativity, unit and commutativity on classes, hence everywhere by ExactK0.hom_ext. Pullback f* (KTheoryLowDegrees:Z.5/vector-bundle-k-zero-pullback) is a ring homomorphism, and for X = Spec R the affine comparison is a ring isomorphism with Z.3's ring K₀ (KTheoryLowDegrees:Z.3/finite-projective-monoidal).

**Hypotheses.**

- X is an arbitrary scheme; commutativity uses the symmetric structure of the tensor product of sheaves of modules.

**Construction or proof.**

- Vector bundles are closed under ⊗: restrict to a common trivialising open and use tensorProduct of free sheaves (TauCeti.SheafOfModules.tensorProductFreePUnitIsoLeft style unit isomorphisms and distributivity over finite biproducts).
- Exactness: for a conflation E′ → E → E″ and a vector bundle F, E′ ⊗ F → E ⊗ F → E″ ⊗ F is locally the tensor of a split sequence with a free sheaf, hence exact; so (E, F) ↦ [E ⊗ F] is a BiadditiveInvariant.
- Define the multiplication by BiadditiveInvariant.bilift; [E]·[F] = [E ⊗ F] is bilift_of_of.
- Ring axioms on classes: associativity from TauCeti.SheafOfModules.tensorProductAssoc, unit from tensorProductUnitIsoLeft/Right, commutativity from tensorProductComm; extend by ExactK0.hom_ext in each variable.
- f*(E ⊗ F) ≅ f*E ⊗ f*F and f*O = O give multiplicativity of pullback; on Spec R the tilde equivalence is monoidal ((M ⊗_R N)~ ≅ M~ ⊗ N~), giving the ring isomorphism with Z.3's product.

**Acceptance.**

- 1·[E] = [E]; [O(1)]·[O(−1)] = [O] on P¹_F.
- On a regular curve, ([O] − [O(−y)])·([O] − [O(−z)]) = 0 for closed points y, z (KTheoryLowDegrees:Z.5/curve-k-zero-ring).

**Prerequisites.**

- KTheoryLowDegrees:Z.5/vector-bundle-k-zero
- KTheoryLowDegrees:Z.5/vector-bundle-extension-closed
- KTheoryLowDegrees:Z.5/vector-bundle-k-zero-pullback
- KTheoryLowDegrees:Z.5/vector-bundle-affine-comparison
- KTheoryLowDegrees:Z.3/finite-projective-monoidal
- tauceti:TauCeti.SheafOfModules.tensorProduct
- tauceti:TauCeti.SheafOfModules.tensorProductAssoc
- tauceti:TauCeti.SheafOfModules.tensorProductComm
- tauceti:TauCeti.SheafOfModules.tensorProductUnitIsoLeft
- tauceti:TauCeti.ExactK0.BiadditiveInvariant
- tauceti:TauCeti.ExactK0.BiadditiveInvariant.bilift
- tauceti:TauCeti.ExactK0.BiadditiveInvariant.bilift_of_of

**Uses.**

- Kbook.2013 II.8.1: rank ⊕ det is a ring map for the twisted product on H⁰(X;ℤ) ⊕ Pic(X)
- KTheoryLowDegrees:Z.5/curve-k-zero-ring: the multiplication in rank–determinant coordinates on a curve
- EllipticKTheory:E.2/ring-structure-of-K0-of-a-curve: the actual tensor multiplication transported to ℤ ⊕ Pic(X)
- SchemeKTheoryOperations:S.6/vector-bundle-lambda-ring: the λ-ring structure lives on this commutative ring

**Public API.**

- TauCeti.AlgebraicGeometry.KTheory.VectorBundleK0.instCommRing (instance): CommRing (VectorBundleK0 X).
- TauCeti.AlgebraicGeometry.KTheory.VectorBundleK0.of_mul_of (simp): [E] * [F] = [E ⊗ F].
- TauCeti.AlgebraicGeometry.KTheory.VectorBundleK0.one_def (simp): 1 = [O_X].
- TauCeti.AlgebraicGeometry.KTheory.VectorBundleK0.pullbackRingHom (functoriality): pullback f is a ring homomorphism.
- TauCeti.AlgebraicGeometry.KTheory.VectorBundleK0.affineRingEquiv (compatibility): RingK0 R ≃+* VectorBundleK0 (Spec R), the affine comparison with Z.3's product.

**Unit tests.**

- TauCeti.AlgebraicGeometry.KTheory.VectorBundleK0.one_mul_test (degenerate): 1 * x = x, and [0] * x = 0.
- TauCeti.AlgebraicGeometry.KTheory.VectorBundleK0.free_mul_test (computation): [O^{⊕2}] * [O^{⊕3}] = 6 • [O_X].
- TauCeti.AlgebraicGeometry.KTheory.VectorBundleK0.affine_mul_test (compatibility): For X = Spec R, the product agrees with SplitK0.of_mul_of on RingK0 R through the affine comparison.
- TauCeti.AlgebraicGeometry.KTheory.VectorBundleK0.not_product_ring_test (non-example): On P¹_F with x = [O] − [O(−1)], x * x = 0 while x ≠ 0: the ring is not the product ring ℤ × ℤ in the basis ([O], x), where (0, 1)² = (0, 1).

**Sources.**

- Kbook.2013, II.7, Application 7.4.2, PDF p. 141 (book p. 133). The construction; the source adds that the product is commutative and associative.

### The rank on K₀ of vector bundles

**KTheoryLowDegrees:Z.5/vector-bundle-rank** · construction · implementation unchecked.

For a scheme X, E ↦ (x ↦ rank_x(E)) is additive on short exact sequences of vector bundles and invariant under isomorphism, so it induces rank : K₀(Vect X) →+ LocallyConstant X ℤ (the ring H⁰(X; ℤ) of continuous integer-valued functions), with rank[E](x) = rank_{O_{X,x}} E_x. It is a ring homomorphism (rank of a tensor product is the product of ranks, checked at stalks). It is split surjective: for a locally constant f : X → ℕ the componentwise free sheaf O_X^{f} (equal to O^{⊕n} on the clopen set f⁻¹(n)) has rank f, and the classes [O^f] − [O^g] form a subring of K₀(Vect X) isomorphic to H⁰(X; ℤ). The reduced group K̃₀(X) := ker(rank) is an ideal. On a connected X, rank takes values in ℤ; for X = Spec R it is Z.2's rank under the affine comparison.

**Hypotheses.**

- X arbitrary; on a quasi-compact X a locally constant integer function has finite image, so O^f is a vector bundle (finitely many clopen pieces); on a general X, O^f is still a vector bundle because each piece is open and closed.

**Construction or proof.**

- For a conflation of vector bundles, the stalk sequence at x is a short exact sequence of finite free O_{X,x}-modules, which splits, so ranks add; isomorphic bundles have isomorphic stalks.
- Descend by ExactK0.lift to LocallyConstant X ℤ; multiplicativity on classes from (E ⊗ F)_x ≅ E_x ⊗ F_x, and extend with the ring structure of KTheoryLowDegrees:Z.5/vector-bundle-k-zero-ring.
- Section: X is the disjoint union of the clopen sets f⁻¹(n); O^f := ⊕-glued free sheaves has rank f, and f ↦ [O^{f⁺}] − [O^{f⁻}] is an additive and multiplicative section of rank.
- Affine case: (P~)_p = P_p, so rank[P~] = rankAtStalk P = RingK0.rank [P] (KTheoryLowDegrees:Z.2/rank-hom).

**Acceptance.**

- rank[O_X] = 1; rank([O] − [L]) = 0 for a line bundle L.
- For X = Spec(F × F), rank takes the values (1, 0) and (0, 1) on the two points for the two factors.

**Prerequisites.**

- KTheoryLowDegrees:Z.5/vector-bundle
- KTheoryLowDegrees:Z.5/vector-bundle-k-zero
- KTheoryLowDegrees:Z.5/vector-bundle-k-zero-ring
- KTheoryLowDegrees:Z.5/vector-bundle-affine-comparison
- KTheoryLowDegrees:Z.2/rank-hom
- KTheoryLowDegrees:Z.2/rank-connected
- mathlib:LocallyConstant
- mathlib:LocallyConstant.const
- tauceti:TauCeti.ExactK0.lift

**Uses.**

- Kbook.2013 II.8.1.1: K̃₀(X) is the kernel of the rank map
- KTheoryLowDegrees:Z.5/curve-rank-determinant-equivalence: the first coordinate of the equivalence
- SchemeKTheoryOperations:S.7/scheme-gamma-filtration: the augmentation of the λ-ring K₀(Vect X)
- KTheoryLowDegrees:Z.6/field-product-test: the disconnected case, where the rank is not a single integer

**Public API.**

- TauCeti.AlgebraicGeometry.KTheory.VectorBundleK0.rank (constructor): rank : VectorBundleK0 X →+* LocallyConstant X ℤ.
- TauCeti.AlgebraicGeometry.KTheory.VectorBundleK0.rank_of (simp): rank [E] x = rankAt E x.
- TauCeti.AlgebraicGeometry.KTheory.VectorBundleK0.rank_one (simp): rank 1 = 1.
- TauCeti.AlgebraicGeometry.KTheory.VectorBundleK0.rankSection (constructor): rankSection : LocallyConstant X ℤ →+* VectorBundleK0 X with rank ∘ rankSection = id.
- TauCeti.AlgebraicGeometry.KTheory.VectorBundleK0.reduced (structure): reduced X := ker rank, an ideal (K̃₀(X)).
- TauCeti.AlgebraicGeometry.KTheory.VectorBundleK0.rankℤ (constructor): For connected X, rankℤ : VectorBundleK0 X →+* ℤ with rank = const ∘ rankℤ.
- TauCeti.AlgebraicGeometry.KTheory.VectorBundleK0.rank_pullback (functoriality): rank (pullback f x) = (rank x) ∘ f.
- TauCeti.AlgebraicGeometry.KTheory.VectorBundleK0.rank_affine (compatibility): For X = Spec R, rank corresponds to RingK0.rank under the affine comparison.

**Unit tests.**

- TauCeti.AlgebraicGeometry.KTheory.VectorBundleK0.rank_empty_test (degenerate): For X = ∅, rank is the zero map to the zero ring.
- TauCeti.AlgebraicGeometry.KTheory.VectorBundleK0.rank_free_test (computation): rank (3 • [O_X] − [O_X^{⊕2}]) = 1.
- TauCeti.AlgebraicGeometry.KTheory.VectorBundleK0.rank_affine_test (compatibility): For X = Spec R and P finitely generated projective, rank [P~] = RingK0.rank [P] as locally constant functions on Spec R.
- TauCeti.AlgebraicGeometry.KTheory.VectorBundleK0.rank_disconnected_test (non-example): For X = Spec(F × F), rank [(F × 0)~] is not constant, so rank does not factor through ℤ.

**Sources.**

- Kbook.2013, II.8, Theorem 8.1, PDF p. 153 (book p. 145). The statement; the proof given there is the stalkwise additivity used here.
- Stacks, Sheaves of Modules, Section 26 (tag 0B37). The same homomorphism for a ringed space with nonzero stalks.

### Exterior powers of a sheaf of modules

**KTheoryLowDegrees:Z.5/sheaf-exterior-power** · construction · implementation unchecked.

Let X be a scheme, F an O_X-module and n ∈ ℕ. Λⁿ F is the sheafification (Mathlib's PresheafOfModules.sheafification) of the presheaf of O_X-modules U ↦ ⋀ⁿ_{O_X(U)} F(U) (Mathlib's ExteriorAlgebra.exteriorPower over the ring O_X(U)), whose restriction maps are the maps induced on exterior powers by F(U) → F(V) along O_X(U) → O_X(V), i.e. exteriorPower.map of the O_X(V)-linear map O_X(V) ⊗_{O_X(U)} F(U) → F(V) composed with the base-change identification of KTheoryLowDegrees:Z.3/exterior-base-change. It comes with the alternating map F^{×n} → Λⁿ F (local sections s_1, …, s_n ↦ s_1 ∧ ⋯ ∧ s_n), is functorial in F for all O_X-module maps (Λⁿ(φ)(s_1 ∧ ⋯ ∧ s_n) = φ s_1 ∧ ⋯ ∧ φ s_n), and satisfies Λ⁰F ≅ O_X and Λ¹F ≅ F. Its stalk at x is ⋀ⁿ_{O_{X,x}} F_x, it commutes with restriction to open subschemes and with pullback along morphisms of schemes.

**Hypotheses.**

- X is an arbitrary scheme and F an arbitrary O_X-module; no finiteness is needed for the construction.
- The exterior power of modules is Mathlib's; the base change of exterior powers along ring maps is KTheoryLowDegrees:Z.3/exterior-base-change.

**Construction or proof.**

- Presheaf: for V ⊆ U the restriction F(U) → F(V) is O_X(U)-linear for the O_X(U)-module structure on F(V) through O_X(U) → O_X(V); it induces ⋀ⁿ_{O_X(U)} F(U) → ⋀ⁿ_{O_X(U)} F(V) → ⋀ⁿ_{O_X(V)} F(V) (the second map from the scalar extension O_X(V) ⊗ ⋀ⁿ_{O_X(U)} F(V) ≅ ⋀ⁿ_{O_X(V)}(O_X(V) ⊗ F(V)) → ⋀ⁿ_{O_X(V)} F(V)); functoriality of these maps is exteriorPower.map_id and exteriorPower.map_comp.
- Sheafify with PresheafOfModules.sheafification (Mathlib) to obtain an O_X-module; its universal property gives functoriality in F and the alternating map from F^{×n}.
- Λ⁰ and Λ¹: exteriorPower.zeroEquiv and exteriorPower.oneEquiv on each U, then sheafification of O_X and F, which are already sheaves.
- Stalks: sheafification does not change stalks and ⋀ⁿ commutes with filtered colimits of modules, so (ΛⁿF)_x ≅ ⋀ⁿ_{O_{X,x}} F_x (Stacks 01CH); pullback and restriction as in Stacks 01CI.

**Acceptance.**

- Λ²(O_X^{⊕2}) ≅ O_X, generated by e_1 ∧ e_2.
- Λⁿ(O_X^{⊕r}) = 0 for n > r.

**Prerequisites.**

- KTheoryLowDegrees:Z.3/exterior-base-change
- mathlib:ExteriorAlgebra.exteriorPower
- mathlib:exteriorPower.map
- mathlib:exteriorPower.map_id
- mathlib:exteriorPower.map_comp
- mathlib:exteriorPower.zeroEquiv
- mathlib:exteriorPower.oneEquiv
- mathlib:exteriorPower.ιMulti
- mathlib:PresheafOfModules
- mathlib:PresheafOfModules.sheafification
- mathlib:AlgebraicGeometry.Scheme.Modules

**Uses.**

- Kbook.2013 I.5.3: det(F) = ∧ⁿ(F) for F locally free of rank n
- KTheoryLowDegrees:Z.5/determinant-bundle: the determinant is the componentwise top exterior power
- SchemeKTheoryOperations:S.6/vector-bundle-lambda-ring: λ^k[E] = [Λ^kE]
- SchemeKTheoryOperations:S.5/projective-bundle-koszul: the Koszul resolution involves π*(ΛⁱE) ⊗ O(−i)

**Public API.**

- TauCeti.SheafOfModules.exteriorPower (constructor): exteriorPower n F : X.Modules, the sheafified U ↦ ⋀ⁿ_{O_X(U)} F(U).
- TauCeti.SheafOfModules.exteriorPower.ιMulti (data): The alternating map from n local sections of F to local sections of ΛⁿF.
- TauCeti.SheafOfModules.exteriorPower.map (functoriality): Λⁿ(φ) : ΛⁿF ⟶ ΛⁿG for φ : F ⟶ G, with map_id and map_comp.
- TauCeti.SheafOfModules.exteriorPower.zeroIso (simp): Λ⁰F ≅ O_X.
- TauCeti.SheafOfModules.exteriorPower.oneIso (simp): Λ¹F ≅ F.
- TauCeti.SheafOfModules.exteriorPower.stalkIso (characterisation): (ΛⁿF)_x ≅ ⋀ⁿ_{O_{X,x}} F_x, compatible with ιMulti.
- TauCeti.SheafOfModules.exteriorPower.restrictIso (functoriality): Λⁿ(F|U) ≅ (ΛⁿF)|U for an open immersion U ⟶ X.
- TauCeti.SheafOfModules.exteriorPower.pullbackIso (functoriality): f*(ΛⁿF) ≅ Λⁿ(f*F) for f : Y ⟶ X.
- TauCeti.SheafOfModules.exteriorPower.tildeIso (compatibility): On Spec R, Λⁿ(M~) ≅ (⋀ⁿ_R M)~.

**Unit tests.**

- TauCeti.SheafOfModules.exteriorPower_zero_test (degenerate): exteriorPower 0 F ≅ O_X for every F, including F = 0.
- TauCeti.SheafOfModules.exteriorPower_free_test (computation): exteriorPower 2 (SheafOfModules.free (Fin 3)) ≅ SheafOfModules.free (Fin 3) (C(3,2) = 3), with basis e_i ∧ e_j, i < j.
- TauCeti.SheafOfModules.exteriorPower_tilde_test (compatibility): For X = Spec R and P finitely generated projective, exteriorPower n (P~) ≅ (⋀[R]^n P)~, Mathlib's exterior power.
- TauCeti.SheafOfModules.exteriorPower_not_presheaf_test (non-example): On P¹_k let F=O(1)⊕O(−1) and n=2. The exterior square of Γ(F)=k² is k, but both global sections lie in the rank-one O(1) summand, so their wedge restricts to zero on every trivialising affine open. This presheaf is not separated and must be sheafified. For a quasi-coherent F on an affine U, including a vector bundle, the natural comparison (ΛⁿF)(U)≅Λⁿ_{O(U)}F(U) is an isomorphism.

**Sources.**

- Stacks, Sheaves of Modules, Lemma 21.1 (tag 01CG). The construction.
- Stacks, Sheaves of Modules, Lemma 21.2 (tag 01CH). The stalks.
- Kbook.2013, I.5.3 (Patching and Operations), PDF p. 58 (book p. 50). The K-book obtains the same sheaf by patching the local exterior powers; the sheafified presheaf restricts to it on trivialising opens.

### Exterior powers of vector bundles

**KTheoryLowDegrees:Z.5/exterior-power-vector-bundle** · lemma · implementation unchecked.

Let X be a scheme and E a vector bundle. For every n, ΛⁿE is a vector bundle with rank_x(ΛⁿE) = C(rank_x E, n); if E|U ≅ O_U^{⊕r} then (ΛⁿE)|U ≅ O_U^{⊕C(r,n)}, with basis the e_{i_1} ∧ ⋯ ∧ e_{i_n}, i_1 < ⋯ < i_n. In particular ΛⁿE = 0 on the open and closed set where rank E < n, and Λ^rE is invertible on the open and closed set where rank E = r. For an affine open U = Spec R ⊆ X with E|U = P~, (ΛⁿE)(U) = ⋀ⁿ_R P. Λⁿ restricts to a functor Vect(X) → Vect(X) sending isomorphisms to isomorphisms.

**Hypotheses.**

- E is a vector bundle (KTheoryLowDegrees:Z.5/vector-bundle).

**Construction or proof.**

- Restriction to U commutes with Λⁿ (KTheoryLowDegrees:Z.5/sheaf-exterior-power), so it suffices to treat E = O_U^{⊕r}. The presheaf U′ ↦ ⋀ⁿ O(U′)^{⊕r} is the free presheaf on the basis e_I (Mathlib's exteriorPower.instFree and exteriorPower.finrank_eq, finrank C(r, n)), which is already the sheaf O^{⊕C(r,n)}; so sheafification does nothing.
- The vanishing above the rank is Tau Ceti's exteriorPower.eq_zero_of_finrank_lt on each trivialising open; for n = r the top power is free of rank one (Tau Ceti's exteriorPower.topEquiv), hence Λ^rE is invertible there (Tau Ceti's IsInvertible).
- On an affine open with E|U = P~, the presheaf is ⋀ⁿ_{R_f} P_f on basic opens, which is the quasi-coherent sheaf (⋀ⁿ_R P)~ (exterior powers commute with localisation, KTheoryLowDegrees:Z.3/exterior-base-change), so its sections on U are ⋀ⁿ_R P.

**Acceptance.**

- Λ²(O ⊕ L) ≅ L for a line bundle L.
- Λ³ of a rank-2 bundle is 0.

**Prerequisites.**

- KTheoryLowDegrees:Z.5/sheaf-exterior-power
- KTheoryLowDegrees:Z.5/vector-bundle
- KTheoryLowDegrees:Z.3/exterior-base-change
- KTheoryLowDegrees:Z.3/projective-exterior-power
- mathlib:exteriorPower.instFree
- mathlib:exteriorPower.finrank_eq
- tauceti:exteriorPower.eq_zero_of_finrank_lt
- tauceti:exteriorPower.topEquiv
- tauceti:TauCeti.SheafOfModules.IsInvertible

**Sources.**

- Stacks, Sheaves of Modules, Lemma 21.5 (tag 01CK), part (6). Local freeness is preserved; the rank C(r, n) is read off from the local bases.
- Kbook.2013, I.5.3, PDF p. 58 (book p. 50). The statement for vector bundles.

### The exterior filtration of an extension of vector bundles

**KTheoryLowDegrees:Z.5/exterior-power-extension-filtration** · lemma · implementation unchecked.

Let 0 → E′ → E → E″ → 0 be a short exact sequence of vector bundles on a scheme X and n ≥ 0. Then ΛⁿE has a canonical filtration by O_X-submodules ΛⁿE = F⁰ ⊇ F¹ ⊇ ⋯ ⊇ Fⁿ⁺¹ = 0, where Fⁱ is the image of Λⁱ E′ ⊗ Λⁿ⁻ⁱ E → ΛⁿE, with successive quotients Fⁱ/Fⁱ⁺¹ ≅ ΛⁱE′ ⊗ Λⁿ⁻ⁱE″, with every Fⁱ a vector bundle. The canonical graded maps are natural in morphisms of short exact sequences and commute with arbitrary scheme pullback. Consequently [ΛⁿE] = Σ_{i=0}^{n} [ΛⁱE′ ⊗ Λⁿ⁻ⁱE″] in K₀(Vect X). This is the sheaf form of the module-level canonical filtration KTheoryLowDegrees:Z.3/exterior-extension-filtration, globalised because it is canonical.

**Hypotheses.**

- The sequence is a conflation of Vect(X) (KTheoryLowDegrees:Z.5/vector-bundle-extension-closed); it is locally split but need not split globally.

**Construction or proof.**

- For 0 ≤ i ≤ n define Fⁱ as the image subsheaf of ΛⁱE′ ⊗ Λⁿ⁻ⁱE → ΛⁿE, and set Fⁱ = 0 for i > n. Wedge multiplication shows Fⁱ⁺¹ ⊆ Fⁱ and F⁰ = ΛⁿE. The terminal zero is prescribed, not the image formula with a truncated negative degree.
- Local splitting follows from finite local freeness of E″: choose a basis on an open neighbourhood, lift its finitely many sections locally through the epimorphism, and shrink to their common domain. The lifts give a section E″ → E; shrink again to trivialise E′. This is the local-splitting argument of vector-bundle-extension-closed, not a global splitting assertion.
- In the resulting split model E = E′ ⊕ E″, exterior-direct-sum identifies Fⁱ with the sum of the summands ΛʲE′ ⊗ Λⁿ⁻ʲE″ for j ≥ i. Expanding a generator gives the inclusion into this sum; basis wedges with at least i E′ factors give the reverse inclusion. Thus each Fⁱ and each graded quotient is locally finite free.
- For the canonical graded map, wedge i sections from E′ with local lifts of n−i sections from E″, then pass to Fⁱ/Fⁱ⁺¹. Changing any lift adds a wedge with at least i+1 E′ factors, hence zero in the quotient. Multilinearity and alternation give the map on exterior powers. Its local descriptions agree on overlaps and glue by Stacks 00AK; the split calculation identifies it with the identity on the i-th summand, proving it is an isomorphism.
- A morphism of short exact sequences respects the wedge-and-lift formula, hence the induced graded maps. Pullback is checked on these same split neighbourhoods: both Fⁱ and the graded pieces are direct sums of tensor products of exterior powers, whose base-change maps are the ones of sheaf-exterior-power. No assertion that arbitrary pullback preserves images or arbitrary short exact sequences is used.
- The conflations Fⁱ⁺¹ → Fⁱ → grⁱ have all terms vector bundles. Add their exact K₀ relations to obtain the stated class identity. The zero-degree case has F⁰ = O_X and F¹ = 0.

**Acceptance.**

- For n = 1: 0 → E′ → E → E″ → 0 itself.
- For n = rank E: only the piece i = rank E′ is nonzero, giving det E ≅ det E′ ⊗ det E″ (KTheoryLowDegrees:Z.5/determinant-bundle-extension).
- For ranks(E′, E″) = (1, 2) and n = 2, the successive graded ranks are 1, 2, 0 and the filtration ranks are 3, 2, 0, 0.
- On Spec ℤ, 0 → ℤ →(×2) ℤ → ℤ/2 → 0 is not a vector-bundle conflation: Λ²ℤ = 0 while the proposed degree-one graded piece ℤ ⊗ ℤ/2 is nonzero. Reduction modulo 2 also destroys injectivity. The suggested signature must carry the vector-bundle hypotheses.

**Prerequisites.**

- KTheoryLowDegrees:Z.5/sheaf-exterior-power
- KTheoryLowDegrees:Z.5/exterior-power-vector-bundle
- KTheoryLowDegrees:Z.5/vector-bundle-extension-closed
- KTheoryLowDegrees:Z.5/vector-bundle-k-zero
- KTheoryLowDegrees:Z.3/exterior-direct-sum
- KTheoryLowDegrees:Z.3/exterior-extension-filtration
- KTheoryLowDegrees:Z.3/exterior-extension-graded
- KTheoryLowDegrees:Z.5/vector-bundle-k-zero-ring

**Sources.**

- Kbook.2013, I.5, Exercise 5.4, PDF p. 68 (book p. 60). The statement, for 0 → E → F → G → 0; the source leaves the proof as an exercise, and the proof here is the local-splitting argument.
- Stacks.0FIC.20260926, Lemma 45.13.1, proof, read 26 September 2026. The published online argument uses the exterior filtration to establish the lambda sum formula. The intrinsic image and lift-independence calculation here supplies its local details.
- Stacks.00AK.20260926, Lemmas 6.33.1–6.33.2, proofs, read 26 September 2026. Compatible local sheaf maps glue uniquely; the stated construction glues sections by the sheaf axiom. Only disjoint covers allow arbitrary local class equalities to produce such maps.

### The determinant line bundle

**KTheoryLowDegrees:Z.5/determinant-bundle** · construction · implementation unchecked.

Let X be a scheme and E a vector bundle. X is the disjoint union of the open and closed subsets X_r := {x : rank_x E = r}, r ∈ ℕ. det E is the O_X-module whose restriction to each X_r is Λ^r(E|X_r) (KTheoryLowDegrees:Z.5/sheaf-exterior-power); since the X_r are disjoint and open, no gluing condition arises. det E is invertible (TauCeti.SheafOfModules.IsInvertible): an invertible sheaf in Tau Ceti's sense, i.e. an object of InvertibleSheaf X, whose isomorphism class is an element of LineBundleClass X. An isomorphism φ : E ≅ F induces det φ : det E ≅ det F; det O_X^{⊕r} ≅ O_X canonically (e_1 ∧ ⋯ ∧ e_r ↦ 1); det L ≅ L for an invertible L; det 0 ≅ O_X. If E is trivialised on U_i with transition matrices g_ij ∈ GL_r(O(U_i ∩ U_j)), det E is trivialised with transition functions det g_ij (Tau Ceti's exteriorPower.map_top_eq_det_smul). For X = Spec R, det(P~) ≅ (detProjective P)~ with Z.3's componentwise determinant.

**Hypotheses.**

- E is a vector bundle; on a quasi-compact X only finitely many X_r are nonempty, on a general X the decomposition may be infinite but remains a disjoint union of open sets.

**Construction or proof.**

- The X_r are open (rank is locally constant, KTheoryLowDegrees:Z.5/vector-bundle) and their union is X, so they are also closed.
- Define det E by its restrictions Λ^r(E|X_r); a sheaf on a disjoint union of opens is the same as a family of sheaves on the pieces.
- Invertibility: on a trivialising open U ⊆ X_r, Λ^r(O_U^{⊕r}) ≅ O_U (KTheoryLowDegrees:Z.5/exterior-power-vector-bundle, Tau Ceti's exteriorPower.topEquiv), which gives rank-one local generator data (TauCeti.SheafOfModules.IsInvertible).
- Functoriality in isomorphisms from Λ^r(φ); the transition-function description is Tau Ceti's exteriorPower.map_top_eq_det_smul applied on overlaps; the affine case compares Λ^r(P~) with (⋀^r_R P)~ on each clopen piece of Spec R, which is KTheoryLowDegrees:Z.3/determinant-projective.

**Acceptance.**

- det(O ⊕ L) ≅ L; det(L ⊕ M) ≅ L ⊗ M.
- det of O(a) ⊕ O(b) on P¹_F is O(a + b).

**Prerequisites.**

- KTheoryLowDegrees:Z.5/sheaf-exterior-power
- KTheoryLowDegrees:Z.5/exterior-power-vector-bundle
- KTheoryLowDegrees:Z.5/vector-bundle
- KTheoryLowDegrees:Z.3/determinant-projective
- KTheoryLowDegrees:Z.3/constant-rank-top-invertible
- tauceti:exteriorPower.map_top_eq_det_smul
- tauceti:TauCeti.AlgebraicGeometry.InvertibleSheaf
- tauceti:TauCeti.AlgebraicGeometry.LineBundleClass
- tauceti:TauCeti.AlgebraicGeometry.LineBundleClass.mk

**Uses.**

- Kbook.2013 II.8.1: det is additive on short exact sequences and induces det: K₀(X) → Pic(X)
- KTheoryLowDegrees:Z.5/vector-bundle-determinant: the determinant homomorphism on K₀(Vect X)
- SchemeKTheoryOperations:S.7/gamma-first-graded-pieces: det[E] = Λ^{rk E}E componentwise identifies F¹_γ/F²_γ with Pic(X)
- SchemeKTheoryOperations:S.5/projective-bundle-cohomology: the twist by (Λ^rE)^∨ in R^{r−1}π_*O(n)

**Public API.**

- TauCeti.AlgebraicGeometry.VectorBundle.det (constructor): det E : InvertibleSheaf X for a vector bundle E.
- TauCeti.AlgebraicGeometry.VectorBundle.det_restrict (characterisation): (det E)|X_r ≅ Λ^r(E|X_r) where X_r = {rank E = r}.
- TauCeti.AlgebraicGeometry.VectorBundle.detIso (functoriality): det φ : det E ≅ det F for φ : E ≅ F, with detIso_refl and detIso_trans.
- TauCeti.AlgebraicGeometry.VectorBundle.det_free (simp): det (O_X^{⊕r}) ≅ O_X.
- TauCeti.AlgebraicGeometry.VectorBundle.det_invertible (simp): det L ≅ L for an invertible sheaf L.
- TauCeti.AlgebraicGeometry.VectorBundle.det_zero (simp): det 0 ≅ O_X.
- TauCeti.AlgebraicGeometry.VectorBundle.det_pullback (functoriality): det (f*E) ≅ f*(det E).
- TauCeti.AlgebraicGeometry.VectorBundle.det_tilde (compatibility): On Spec R, det (P~) ≅ (RingK0.detProjective P)~, Z.3's determinant.

**Unit tests.**

- TauCeti.AlgebraicGeometry.VectorBundle.det_zero_test (degenerate): det of the zero sheaf is O_X (the empty wedge).
- TauCeti.AlgebraicGeometry.VectorBundle.det_free_test (computation): LineBundleClass.mk (det (O_X^{⊕5})) = 1.
- TauCeti.AlgebraicGeometry.VectorBundle.det_tilde_test (compatibility): For R = ℤ[√−5] and I = (2, 1 + √−5), det (ℤ[√−5] ⊕ I)~ ≅ I~, matching Z.3's detProjective (A ⊕ I) ≅ I.
- TauCeti.AlgebraicGeometry.VectorBundle.det_not_top_power_test (non-example): For X = Spec(F × F) and E = (F × F²)~ (ranks 1 and 2 on the two points), det E is invertible while Λ¹E and Λ²E are not: neither single exterior power is the determinant when the rank varies.

**Sources.**

- Stacks, Sheaves of Modules, Section 26 (tag 0B37), Determinants. The construction, verbatim in the componentwise form.
- Kbook.2013, I.5.3, The Picard group and determinant bundles, PDF p. 58 (book p. 50). The K-book's definition.

### The determinant of an extension

**KTheoryLowDegrees:Z.5/determinant-bundle-extension** · lemma · implementation unchecked.

For a short exact sequence 0 → E′ → E → E″ → 0 of vector bundles on a scheme X there is a canonical isomorphism γ : det E′ ⊗ det E″ ≅ det E. On the open and closed set where E′ and E″ have constant ranks r′ and r″, γ(s′_1 ∧ ⋯ ∧ s′_{r′} ⊗ s″_1 ∧ ⋯ ∧ s″_{r″}) = s′_1 ∧ ⋯ ∧ s′_{r′} ∧ s̃_1 ∧ ⋯ ∧ s̃_{r″} for any local lifts s̃_j of the s″_j. γ is natural for isomorphisms of short exact sequences. In particular det(E ⊞ F) ≅ det E ⊗ det F, and LineBundleClass.mk (det E) = LineBundleClass.mk (det E′) * LineBundleClass.mk (det E″).

**Hypotheses.**

- The sequence is a conflation of Vect(X); it need not split.

**Construction or proof.**

- Decompose X into the open and closed pieces where E′ and E″ have constant ranks; there E has constant rank r′ + r″.
- Well-definedness: two lifts of s″_j differ by a local section of E′, and a wedge of r′ + 1 sections of E′ vanishes in Λ^{r′+1}E′ = 0 (KTheoryLowDegrees:Z.5/exterior-power-vector-bundle); the formula is O_X-multilinear and alternating in each group, so it defines a map of sheaves.
- Isomorphism: locally the sequence splits and γ is the module isomorphism det P′ ⊗ det P″ ≅ det(P′ ⊕ P″) of KTheoryLowDegrees:Z.3/determinant-sum; a map of O_X-modules that is locally an isomorphism is an isomorphism.
- Equivalently, γ is the top case n = rank E of KTheoryLowDegrees:Z.5/exterior-power-extension-filtration, where only the graded piece i = r′ survives; naturality holds because the formula involves no choices beyond lifts.

**Acceptance.**

- For 0 → O(−2) → O(−1)^{⊕2} → O → 0 on P¹_F: det of the middle is O(−2), consistent with O(−1) ⊗ O(−1).
- For a split sequence, γ is the isomorphism det(E′ ⊞ E″) ≅ det E′ ⊗ det E″.

**Prerequisites.**

- KTheoryLowDegrees:Z.5/determinant-bundle
- KTheoryLowDegrees:Z.5/exterior-power-vector-bundle
- KTheoryLowDegrees:Z.5/exterior-power-extension-filtration
- KTheoryLowDegrees:Z.5/vector-bundle-extension-closed
- KTheoryLowDegrees:Z.3/determinant-sum
- tauceti:TauCeti.SheafOfModules.tensorProduct
- tauceti:TauCeti.AlgebraicGeometry.LineBundleClass.mk_tensorProduct

**Sources.**

- Stacks, Sheaves of Modules, Lemma 26.1 (tag 0B38). The statement; the source gives the formula with local lifts and omits the details, which are the steps above.
- Stacks, More on Algebra, Lemma 120.3 (tag 0FJC). Naturality of the module-level map, which makes the local isomorphisms glue.

### The determinant of a tensor product

**KTheoryLowDegrees:Z.5/determinant-bundle-tensor** · lemma · implementation unchecked.

Let E and F be vector bundles on a scheme X of constant ranks m and n. Then there is a canonical isomorphism det(E ⊗ F) ≅ (det E)^{⊗n} ⊗ (det F)^{⊗m}; without the constancy hypothesis the same holds on each open and closed piece where both ranks are constant. Hence LineBundleClass.mk (det (E ⊗ F)) = (mk (det E))^{rank F} * (mk (det F))^{rank E} on a connected X.

**Hypotheses.**

- Constant ranks m and n (or componentwise); for a line bundle F the statement reads det(E ⊗ L) ≅ det E ⊗ L^{⊗m}.

**Construction or proof.**

- On a simultaneous trivialising open choose ordered bases e₁,…,e_m and f₁,…,f_n. In lexicographic order with i first, send the wedge of the e_i ⊗ f_j to (e₁∧⋯∧e_m)^{⊗n} ⊗ (f₁∧⋯∧f_n)^{⊗m}. Both sides are free lines, including the empty-wedge convention when one rank is zero.
- Under changes of bases A and B, the tensor basis changes by A ⊗ₖ B. Matrix.det_kronecker over every commutative ring gives det(A ⊗ₖ B) = det(A)^n det(B)^m. exteriorPower.map_top_eq_det_smul identifies these scalars with the actions on the top wedges. Therefore the local isomorphisms, not merely their classes, agree on overlaps.
- Glue the isomorphisms and their inverses by Stacks 00AK. The same basis-change check proves naturality for bundle isomorphisms; the formula also commutes with restriction and pullback. For varying ranks use the disjoint common clopen rank partition; no quasi-compactness or bounded-rank assumption is needed.
- Pass to classes using LineBundleClass.mk_tensorProduct. This is the sheaf version of Z.3/determinant-tensor; it does not construct a second determinant or rely on diagonalisation, eigenvalues, characteristic zero or reducedness.

**Acceptance.**

- det(L ⊗ M) ≅ L ⊗ M for line bundles.
- det(O^{⊕2} ⊗ L) ≅ L^{⊗2}.
- A transposition in rank m = 2 tensored with the identity in rank n = 3 changes the top wedge by −1, not +1.
- Over ℤ/4, A = (3) and B = ((1,1),(0,3)) are invertible and det(A ⊗ₖ B) = 3 = 3²·3. No reduced-ring assumption is allowed.
- If E = L ⊕ O and F = M ⊕ O, the determinant of E ⊗ F is L²M²; rank zero gives the trivial line.

**Prerequisites.**

- KTheoryLowDegrees:Z.5/determinant-bundle
- KTheoryLowDegrees:Z.5/vector-bundle-k-zero-ring
- KTheoryLowDegrees:Z.3/determinant-tensor
- tauceti:exteriorPower.map_top_eq_det_smul
- tauceti:TauCeti.AlgebraicGeometry.LineBundleClass.mk_tensorProduct
- mathlib:Matrix.det_kronecker

**Sources.**

- Kbook.2013, II.8, Exercise 8.5, PDF p. 165 (book p. 157). The statement; the source leaves it as an exercise, proved here by the transition-function computation det(g ⊗ h) = det(g)^n det(h)^m.
- Stacks.00AK.20260926, Lemmas 6.33.1–6.33.2, proofs, read 26 September 2026. Compatible local sheaf maps glue uniquely; the stated construction glues sections by the sheaf axiom. Only disjoint covers allow arbitrary local class equalities to produce such maps.

### The determinant on K₀ of vector bundles

**KTheoryLowDegrees:Z.5/vector-bundle-determinant** · construction · implementation unchecked.

For a scheme X, E ↦ LineBundleClass.mk (det E) is invariant under isomorphism and multiplicative on short exact sequences of vector bundles (KTheoryLowDegrees:Z.5/determinant-bundle-extension), so it induces an additive-to-multiplicative homomorphism det : K₀(Vect X) →+ Additive (Pic X), det[E] = [det E], hence det([E] − [F]) = [det E]·[det F]⁻¹. Here Pic(X) is the group of isomorphism classes of invertible sheaves under ⊗: Tau Ceti's commutative monoid LineBundleClass X, which is a group because L ⊗ Hom(L, O_X) ≅ O_X (Stacks 01CT; JacobianChallenge layer A). No multiplication on Pic(X) other than ⊗ is used, and det is not a ring homomorphism. For X = Spec R it is Z.3's detHom under the affine comparisons.

**Hypotheses.**

- X is an arbitrary scheme.
- The group structure of Pic(X) (inverses) is JacobianChallenge layer A's (requested); on an integral regular noetherian scheme of dimension ≤ 1 every class is a unit already by KTheoryLowDegrees:Z.5/line-bundle-divisorial.
- Tau Ceti's LineBundleClass X is a commutative monoid; until JacobianChallenge layer A supplies Pic(X) as a group, Pic X is read as its unit group (LineBundleClass X)ˣ, and det lands there because det E is invertible.

**Construction or proof.**

- Additivity: for a conflation, det E ≅ det E′ ⊗ det E″ (KTheoryLowDegrees:Z.5/determinant-bundle-extension), so mk(det E) = mk(det E′) * mk(det E″) (LineBundleClass.mk_tensorProduct).
- Descend the invariant with values in Additive (Pic X) by ExactK0.lift; uniqueness by ExactK0.hom_ext.
- Affine case: det(P~) ≅ (detProjective P)~ (KTheoryLowDegrees:Z.5/determinant-bundle) and line bundles on Spec R are invertible modules (KTheoryLowDegrees:Z.5/picard-affine-comparison), so det corresponds to KTheoryLowDegrees:Z.3/determinant-hom.

**Acceptance.**

- det[O_X^{⊕n}] = 1; det([L] − [O]) = [L].
- det([O] − [O(−y)]) = [O(y)] on a curve (KTheoryLowDegrees:Z.5/skyscraper-class).

**Prerequisites.**

- KTheoryLowDegrees:Z.5/determinant-bundle
- KTheoryLowDegrees:Z.5/determinant-bundle-extension
- KTheoryLowDegrees:Z.5/vector-bundle-k-zero
- KTheoryLowDegrees:Z.3/determinant-hom
- tauceti:TauCeti.AlgebraicGeometry.LineBundleClass
- tauceti:TauCeti.AlgebraicGeometry.LineBundleClass.mk_tensorProduct
- tauceti:TauCeti.AlgebraicGeometry.LineBundleClass.mk_trivial
- tauceti:TauCeti.ExactK0.lift
- tauceti:TauCeti.ExactK0.hom_ext

**Uses.**

- Kbook.2013 II.8.1: the second coordinate of rank ⊕ det
- KTheoryLowDegrees:Z.5/curve-rank-determinant-equivalence: the Picard coordinate of the curve equivalence
- SchemeKTheoryOperations:S.7/gamma-first-graded-pieces: det kills F²_γ and inverts ℓ ↦ [L] − 1
- EllipticKTheory:E.2/K0-of-an-elliptic-curve: the degree and point coordinates are read off det

**Public API.**

- TauCeti.AlgebraicGeometry.KTheory.VectorBundleK0.det (constructor): det : VectorBundleK0 X →+ Additive (Pic X).
- TauCeti.AlgebraicGeometry.KTheory.VectorBundleK0.det_of (simp): det [E] = ofMul (LineBundleClass.mk (VectorBundle.det E)).
- TauCeti.AlgebraicGeometry.KTheory.VectorBundleK0.det_sub (simp): toMul (det ([E] − [F])) = mk (det E) * (mk (det F))⁻¹.
- TauCeti.AlgebraicGeometry.KTheory.VectorBundleK0.det_invertible (simp): det [L] = ofMul (mk L) for an invertible sheaf L.
- TauCeti.AlgebraicGeometry.KTheory.VectorBundleK0.det_pullback (functoriality): det (pullback f x) is the pullback of the line-bundle class det x along f (det (f*E) ≅ f*(det E)).
- TauCeti.AlgebraicGeometry.KTheory.VectorBundleK0.det_affine (compatibility): On Spec R, det corresponds to RingK0.detHom under the affine and Picard comparisons.

**Unit tests.**

- TauCeti.AlgebraicGeometry.KTheory.VectorBundleK0.det_zero_test (degenerate): det 0 = 0 (the trivial class).
- TauCeti.AlgebraicGeometry.KTheory.VectorBundleK0.det_free_test (computation): det (n • [O_X]) = 0 in Additive (Pic X) for every n ∈ ℤ.
- TauCeti.AlgebraicGeometry.KTheory.VectorBundleK0.det_affine_test (compatibility): For R = ℤ[√−5], det ([I~] − [O]) corresponds to CommRing.Pic.mk I ≠ 1 for I = (2, 1 + √−5).
- TauCeti.AlgebraicGeometry.KTheory.VectorBundleK0.det_not_ringHom_test (non-example): On P¹_F, det ([O^{⊕2}] * [O(1)]) = det [O(1)^{⊕2}] = [O(2)], whereas det [O^{⊕2}] = 1 and det [O(1)] = [O(1)]: the determinant of a product is not a function of the two determinants, so det is not a ring homomorphism for any multiplication on Pic; the correct formula is the rank-twisted product of KTheoryLowDegrees:Z.5/rank-determinant-surjective.

**Sources.**

- Stacks, Sheaves of Modules, Section 26 (tag 0B37), Determinants. The construction.
- Stacks, Sheaves of Modules, Definition 25.9 (tag 01CX). The target group.
- Kbook.2013, II.8, Theorem 8.1, PDF p. 153 (book p. 145). The determinant homomorphism (its surjectivity is KTheoryLowDegrees:Z.5/rank-determinant-surjective).

### Picard classes on a disjoint open cover

**KTheoryLowDegrees:Z.5/pic-disjoint-cover-ext** · lemma · implementation unchecked.

Let (U_i) be a pairwise disjoint open cover of X. Restriction Pic(X) → ∏_i Pic(U_i) is injective: if L|U_i = M|U_i for every i, then L = M. Pic(X) uses the existing LineBundleClass X, with its group structure supplied by JacobianChallenge A; the prototype uses its unit group. No such injectivity is asserted for an arbitrary overlapping cover.

**Hypotheses.**

- X is an arbitrary scheme; no quasi-compactness, connectedness or bounded-image assumption.

**Construction or proof.**

- Choose invertible-sheaf representatives for L and M in the existing skeleton. Equality of restricted classes is equivalent to existence of sheaf isomorphisms by LineBundleClass.mk_eq_mk_iff.
- Choose one such isomorphism on each U_i. Distinct overlaps are empty, where maps are unique, so these isomorphisms and their inverses satisfy the compatibility condition. Stacks 00AK glues both families; their composites are identities because that equality holds on the cover. This gives an isomorphism of the global representatives.
- Use LineBundleClass.mk_eq_mk_iff, then injectivity of the inclusion of units, to conclude equality of Picard classes. The argument uses actual compatible maps; it does not treat Pic as a sheaf on arbitrary covers.

**Acceptance.**

- On X = U ⊔ V equality is exactly equality of the two restrictions.
- O and O(1) on P¹ are isomorphic on each standard affine chart but not globally; disjointness cannot be dropped.

**Prerequisites.**

- tauceti:TauCeti.AlgebraicGeometry.LineBundleClass.mk_eq_mk_iff
- mathlib:AlgebraicGeometry.Scheme.Modules.restrictFunctor
- tauceti:TauCetiRoadmap/JacobianChallenge#layer-a-line-bundles-divisors-picard-group-degree

**Sources.**

- Stacks.00AK.20260926, Lemmas 6.33.1–6.33.2, proofs, read 26 September 2026. Compatible local sheaf maps glue uniquely; the stated construction glues sections by the sheaf axiom. Only disjoint covers allow arbitrary local class equalities to produce such maps.

### Locally constant powers in the Picard group

**KTheoryLowDegrees:Z.5/pic-locally-constant-module** · construction · implementation unchecked.

Equip Additive(Pic X) with a module structure over H⁰(X, ℤ) = LocallyConstant X ℤ. For a locally constant a and a line-bundle class L, a·L is the class of the invertible sheaf equal to (L|U_n)^{⊗n} on U_n = a⁻¹(n). Negative powers use the dual; zero gives O. The operation L^a is independent of the representative and agrees with ordinary integer powers for constant a. It is a structure on the existing Picard carrier, not a new quotient or a new Picard-group construction.

**Hypotheses.**

- X is an arbitrary scheme; no quasi-compactness, connectedness or bounded-image assumption.

**Construction or proof.**

- The fibres U_n are disjoint clopen subsets covering X by IsLocallyConstant.isClopen_fiber. Use the ordinary integer tensor powers and their duality isomorphisms from JacobianChallenge A, with the conventions of Stacks 01CR. Their inverses are the powers with exponent −n.
- For an open V define sections of the glued sheaf as ∏_n Γ(V∩U_n, (L|U_n)^{⊗n}), with coordinatewise O_X(V)-action through restriction. Restrictions are coordinatewise; matching sections glue separately in each coordinate. Projection to the n-th factor on U_n is an isomorphism because all other intersections are empty. Thus this is an O_X-module, locally free of rank one, for arbitrary image of a. This is the disjoint specialization of Stacks 00AM, not an infinite tensor product or an assertion that the module of global sections is finite projective.
- An isomorphism of representatives induces compatible isomorphisms of their powers (for negative powers use the dual of the inverse map). They glue, so the resulting class is independent of choices in LineBundleClass X and is a unit with inverse the class glued from exponent −a. Restrictions to any open on which a = n are the ordinary n-th powers.
- Compare on the common disjoint partition U_{r,s} = {a=r, b=s}. Ordinary tensor-power identities there give L^{a+b}=L^aL^b and L^{ab}=(L^a)^b. Likewise (LM)^a=L^aM^a, L^0=1, L^1=L and 1^a=1. Apply pic-disjoint-cover-ext, not local equality of classes on an overlapping trivialising cover. These identities give exactly the Module axioms on Additive(Pic X).

**Acceptance.**

- The class is represented by a line bundle even when a is unbounded on infinitely many components.
- On P¹ ⊔ P¹, L=(O(1),O(2)) and a=(2,−1) give (O(2),O(−2)). A single global exponent cannot describe this operation.

**Prerequisites.**

- KTheoryLowDegrees:Z.5/pic-disjoint-cover-ext
- mathlib:LocallyConstant
- mathlib:IsLocallyConstant.isClopen_fiber
- tauceti:TauCeti.AlgebraicGeometry.LineBundleClass.mk_eq_mk_iff
- tauceti:TauCeti.AlgebraicGeometry.LineBundleClass.mk_tensorProduct
- tauceti:TauCetiRoadmap/JacobianChallenge#layer-a-line-bundles-divisors-picard-group-degree

**Uses.**

- KTheoryLowDegrees:Z.5/rank-determinant-surjective: The rank functions act on determinant classes, providing the module in the existing trivial square-zero extension.
- Weibel II.8.1 and SchemeKTheoryOperations:S.7/gamma-first-graded-pieces: The product of rank/determinant coordinates uses locally constant, not necessarily constant, exponents.

**Public API.**

- TauCeti.AlgebraicGeometry.KTheory.Pic.zpowLocallyConstant (constructor): For L ∈ Pic(X), a ∈ H⁰(X,ℤ), the class L^a constructed on the clopen fibres.
- TauCeti.AlgebraicGeometry.KTheory.Pic.zpowLocallyConstant_const (simp): L^{const n}=L^n for every integer n, including 0 and −1.
- TauCeti.AlgebraicGeometry.KTheory.Pic.zpowLocallyConstant_restrict (characterisation): If a is constantly n on an open U, restriction of L^a to U is (L|U)^n.
- TauCeti.AlgebraicGeometry.KTheory.Pic.zpowLocallyConstant_add (relation): L^{a+b}=L^a L^b.
- TauCeti.AlgebraicGeometry.KTheory.Pic.zpowLocallyConstant_mul (relation): L^{ab}=(L^a)^b.
- TauCeti.AlgebraicGeometry.KTheory.Pic.mul_zpowLocallyConstant (relation): (LM)^a=L^a M^a.
- TauCeti.AlgebraicGeometry.KTheory.Pic.module (instance): The Module H⁰(X,ℤ) Additive(Pic X) instance has a·ofMul L=ofMul(L^a).

**Unit tests.**

- TauCeti.AlgebraicGeometry.KTheory.Pic.zero_test (degenerate): L^0=1 for every class L, including on the empty scheme.
- TauCeti.AlgebraicGeometry.KTheory.Pic.signed_test (computation): L^{const 2 + const (−3)}=L⁻¹, not L⁵.
- TauCeti.AlgebraicGeometry.KTheory.Pic.disconnected_test (compatibility): For X=U⊔V, a|U=2 and a|V=−1, the restrictions of L^a are (L|U)² and (L|V)⁻¹.
- TauCeti.AlgebraicGeometry.KTheory.Pic.unbounded_test (non-example): For a disjoint cover by nonempty opens U_n indexed by natural numbers and a|U_n=n, (L^a)|U_n=(L|U_n)^n for every n, with no finite-image premise. The model X=⊔_n P¹, L|U_n=O(1), yields O(n) on each component.

**Sources.**

- Stacks.01CR.20260926, Definition 17.25.6 and Lemmas 17.25.3–17.25.5, read 26 September 2026. Ordinary integer powers use tensor powers and the dual; pullback preserves invertibility. Locally constant exponents and the module laws below are an explicit extension, not a statement quoted from this section.
- Stacks.00AM.20260926, Lemma 6.33.3, proof, read 26 September 2026. The gluing construction carries the module operations. The disjoint-cover specialization has no nonempty overlap conditions.

### Pullback of locally constant Picard powers

**KTheoryLowDegrees:Z.5/pic-locally-constant-pullback** · lemma · implementation unchecked.

For f:Y→X, L∈Pic(X) and a∈LocallyConstant X ℤ, f*(L^a)=(f*L)^{a∘f}. Thus Picard pullback is semilinear for H⁰(X,ℤ)→H⁰(Y,ℤ), a↦a∘f, and agrees with the module structure for identity and composed morphisms.

**Hypotheses.**

- X is an arbitrary scheme; no quasi-compactness, connectedness or bounded-image assumption.

**Construction or proof.**

- The inverse images f⁻¹(U_n) are a disjoint open cover of Y on which a∘f=n. Restrict both sides to this cover.
- On each piece, pullback commutes with tensor products, the unit and the dual of an invertible sheaf by the Picard pullback interface supplied by JacobianChallenge A. Hence it commutes with every integer power. Apply pic-disjoint-cover-ext on Y to compare the global classes. Do not commute pullback with the infinite product formula for sections.
- Identity and composition follow from the supplier pullback laws and LocallyConstant.comap_id/comap_comp; this is semilinearity, not linearity over one unchanged ring of functions.

**Acceptance.**

- Restriction to one of the two components selects its exponent, not a chosen exponent on the other component.
- A morphism collapsing several source components to one target component pulls the target exponent back to the same integer on each.

**Prerequisites.**

- KTheoryLowDegrees:Z.5/pic-locally-constant-module
- KTheoryLowDegrees:Z.5/pic-disjoint-cover-ext
- mathlib:LocallyConstant.comap
- mathlib:AlgebraicGeometry.Scheme.Modules.pullback
- tauceti:TauCetiRoadmap/JacobianChallenge#layer-a-line-bundles-divisors-picard-group-degree

**Sources.**

- Stacks.01CR.20260926, Definition 17.25.6 and Lemmas 17.25.3–17.25.5, read 26 September 2026. Ordinary integer powers use tensor powers and the dual; pullback preserves invertibility. Locally constant exponents and the module laws below are an explicit extension, not a statement quoted from this section.
- Stacks.00AK.20260926, Lemmas 6.33.1–6.33.2, proofs, read 26 September 2026. Compatible local sheaf maps glue uniquely; the stated construction glues sections by the sheaf axiom. Only disjoint covers allow arbitrary local class equalities to produce such maps.

### Affine comparison for locally constant powers

**KTheoryLowDegrees:Z.5/pic-locally-constant-affine** · comparison · implementation unchecked.

For every commutative ring R, let e:Pic(R)≃Pic(Spec R) be the actual tilde equivalence of picard-affine-comparison, characterized on invertible modules by P↦[P~]. Then e(L^a)=e(L)^a for every L and a∈LocallyConstant(Spec R,ℤ), where the left operation is Z.3/pic-locally-constant-power and the right is Z.5/pic-locally-constant-module. The zero ring is included.

**Hypotheses.**

- R is a commutative unital ring, including the zero ring; e is the tilde comparison, not an arbitrary Picard-group isomorphism.

**Construction or proof.**

- Only for Spec R use quasi-compactness and IsLocallyConstant.range_finite to obtain finitely many nonempty exponent fibres, hence the finite idempotent decomposition of Z.3/pic-product-decomposition.
- Under the actual monoidal tilde equivalence of picard-affine-comparison, the ring-level factor on a fibre is the ordinary integer tensor power of the restricted line bundle. Both constructions therefore have the same restriction on every fibre. Apply pic-disjoint-cover-ext. This proves compatibility for the tilde map, not merely the existence of an unrelated abstract group isomorphism.
- For the zero ring the spectrum is empty and both Picard groups are trivial, so the comparison holds without assuming a nonempty spectrum.

**Acceptance.**

- For R=R₁×R₂, the comparison respects independent exponents on the two factors.
- For R=ℤ[√−5] and the nonprincipal ideal I=(2,1+√−5), constant exponent −1 is carried to the dual ideal sheaf, not to a rank-only invariant.

**Prerequisites.**

- KTheoryLowDegrees:Z.5/pic-locally-constant-module
- KTheoryLowDegrees:Z.5/pic-disjoint-cover-ext
- KTheoryLowDegrees:Z.5/picard-affine-comparison
- KTheoryLowDegrees:Z.3/pic-locally-constant-power
- KTheoryLowDegrees:Z.3/pic-product-decomposition
- mathlib:IsLocallyConstant.range_finite

**Sources.**

- Stacks.01CR.20260926, Definition 17.25.6 and Lemmas 17.25.3–17.25.5, read 26 September 2026. Ordinary integer powers use tensor powers and the dual; pullback preserves invertibility. Locally constant exponents and the module laws below are an explicit extension, not a statement quoted from this section.
- Stacks.00AM.20260926, Lemma 6.33.3, proof, read 26 September 2026. The gluing construction carries the module operations. The disjoint-cover specialization has no nonempty overlap conditions.

### Rank and determinant jointly

**KTheoryLowDegrees:Z.5/rank-determinant-surjective** · theorem · implementation unchecked.

Let X be a scheme. Then rank ⊕ det : K₀(Vect X) → H⁰(X; ℤ) ⊕ Pic(X), x ↦ (rank x, det x), is surjective, with (f, L) the image of [O^{f−1}] + [L] when f ≥ 1 and in general of rankSection(f − 1) + [L]; for a line bundle L, [L] − [O_X] has rank 0 and determinant L. It is a ring homomorphism when H⁰(X; ℤ) ⊕ Pic(X) carries the product (a₁, L₁)·(a₂, L₂) = (a₁a₂, L₁^{a₂} ⊗ L₂^{a₁}) (a commutative ring with unit (1, O_X), in which 0 ⊕ Pic(X) is an ideal of square zero). The kernel of the rank is K̃₀(X) and SK₀(X) := ker(rank ⊕ det) is an ideal of K₀(Vect X). The target is Mathlib’s existing trivial square-zero extension TrivSqZeroExt(H⁰(X,ℤ), Additive(Pic X)), using the central scalar action; it is not the direct-product ring.

**Hypotheses.**

- X is an arbitrary scheme. The locally constant scalar action on Pic(X) is Z.5/pic-locally-constant-module; the underlying Picard group and duality remain supplied by JacobianChallenge A.

**Construction or proof.**

- Surjectivity: rank is split surjective (KTheoryLowDegrees:Z.5/vector-bundle-rank) and det[L] = L, det[O^f] = 1, so (rank, det)(rankSection(f − 1) + [L]) = (f, L) (Weibel II.8.1).
- Multiplicativity on classes of vector bundles E, F of constant ranks on a clopen piece: rank(E ⊗ F) = rank E · rank F, and det(E ⊗ F) ≅ det(E)^{rank F} ⊗ det(F)^{rank E} (KTheoryLowDegrees:Z.5/determinant-bundle-tensor), which is the displayed product of (rank E, det E) and (rank F, det F).
- Use Z.5/pic-locally-constant-module to supply the left H⁰-module action and the identical right action through commutativity. TrivSqZeroExt.commRing gives the target ring; TrivSqZeroExt.snd_mul gives its displayed product, and inr_mul_inr gives square zero. On the common disjoint rank partition the canonical tensor determinant isomorphism proves multiplicativity for bundle classes. Apply pic-disjoint-cover-ext, then ExactK0.hom_ext in each variable to extend this biadditive identity to all virtual classes.
- Kernels of ring homomorphisms are ideals, giving the ideal statements for K̃₀ and SK₀.

**Acceptance.**

- For a line bundle L: (rank, det)([L]) = (1, L) and ([L] − 1)² ↦ (0, L)·(0, L) = (0, 1).
- For X = Spec R, R a Dedekind domain, the kernel SK₀ is 0 (KTheoryLowDegrees:Z.4/rank-pic-equivalence).
- The unit is (1,O); (0,L)(0,M)=(0,O), whereas (1,L)(1,M)=(1,L⊗M). These distinguish square-zero from direct-product multiplication.

**Prerequisites.**

- KTheoryLowDegrees:Z.5/vector-bundle-rank
- KTheoryLowDegrees:Z.5/vector-bundle-determinant
- KTheoryLowDegrees:Z.5/determinant-bundle-tensor
- KTheoryLowDegrees:Z.5/vector-bundle-k-zero-ring
- tauceti:TauCeti.ExactK0.hom_ext
- mathlib:LocallyConstant
- KTheoryLowDegrees:Z.5/pic-locally-constant-module
- KTheoryLowDegrees:Z.5/pic-disjoint-cover-ext
- mathlib:TrivSqZeroExt
- mathlib:TrivSqZeroExt.commRing
- mathlib:TrivSqZeroExt.snd_mul
- mathlib:TrivSqZeroExt.inr_mul_inr

**Sources.**

- Kbook.2013, II.8, Theorem 8.1, PDF p. 153 (book p. 145). The statement; the source proves surjectivity and refers the ring-map property to Ex. II.8.5, which is KTheoryLowDegrees:Z.5/determinant-bundle-tensor.
- Kbook.2013, II.8, Definition 8.1.1, PDF p. 154 (book p. 146). The ideal SK₀(X).

### Connected regular curves are integral

**KTheoryLowDegrees:Z.5/regular-curve-integral** · lemma · implementation unchecked.

Let X be a locally noetherian scheme all of whose local rings are regular local rings, of Krull dimension ≤ 1 (equivalently coheight x ≤ 1 for every x, by Mathlib's ringKrullDim_stalk_eq_coheight). Then X is normal and is the disjoint union of its connected components, each of which is an integral normal scheme. If X is connected and noetherian, X is integral and satisfies the regular-curve package: its generic stalk is the function field X.functionField and its stalks at codimension-one points are discrete valuation rings. Conversely every X satisfying the package is a connected regular noetherian scheme of dimension ≤ 1. So the stage's 'connected regular noetherian curve' is exactly a scheme satisfying the package with dim X = 1; for dim X = 0 the package gives X = Spec K with K a field.

**Hypotheses.**

- X locally noetherian with regular local rings of dimension ≤ 1; no separatedness.

**Construction or proof.**

- Regular local rings are normal domains, so X is normal (Stacks 0569).
- A locally noetherian normal scheme is the disjoint union of integral normal schemes (Stacks 033M, 033N); connected forces a single piece, so X is integral; a noetherian X has finitely many pieces.
- For integral X of dimension ≤ 1, a point of coheight one has a noetherian local domain of dimension one as stalk (ringKrullDim_stalk_eq_coheight), whose maximal ideal is generated by dim = 1 element by regularity; a noetherian local domain that is not a field with principal maximal ideal is a DVR (Mathlib's IsDiscreteValuationRing.TFAE, item (maximalIdeal R).IsPrincipal).
- Conversely, under the package the generic stalk is the field X.functionField (regular of dimension 0) and the other stalks are DVRs, which are regular local rings of dimension 1; X is connected because it is irreducible.

**Acceptance.**

- Spec ℤ, Spec O_F for a number field F, and P¹_F satisfy the package.
- Spec(F × F) is regular of dimension 0 but not connected: it is the disjoint union of two copies of Spec F.

**Prerequisites.**

- mathlib:IsRegularLocalRing
- mathlib:IsDiscreteValuationRing
- mathlib:IsDiscreteValuationRing.TFAE
- mathlib:AlgebraicGeometry.ringKrullDim_stalk_eq_coheight
- mathlib:AlgebraicGeometry.IsIntegral
- mathlib:AlgebraicGeometry.IsNoetherian
- mathlib:AlgebraicGeometry.IsLocallyNoetherian
- mathlib:AlgebraicGeometry.Scheme.functionField
- mathlib:Order.coheight
- tauceti:TauCeti.AlgebraicGeometry.CodimensionOnePoint

**Sources.**

- Stacks, Properties of Schemes, Lemma 9.4 (tag 0569). The first step.
- Stacks, Properties of Schemes, Remark 7.8 (tag 033O). For a normal (in particular regular) locally noetherian X, connected is integral.
- Kbook.2013, II.8, Proposition 8.2.1, proof, PDF p. 154 (book p. 146). The source's reduction to the integral case.

### Regular curves have the resolution property

**KTheoryLowDegrees:Z.5/regular-curve-resolution-property** · lemma · implementation unchecked.

Every regular noetherian scheme X of dimension ≤1 has the resolution property: each coherent O_X-module is a quotient of a vector bundle. Separatedness is not required.

**Hypotheses.**

- X is regular noetherian of dimension ≤1.

**Construction or proof.**

- curve-affine-diagonal gives affine diagonal. Apply Stacks 0F8A, the regular quasi-compact affine-diagonal case of the imported resolution-property interface.

**Acceptance.**

- Spec A for A a Dedekind domain: every coherent sheaf is a quotient of a free sheaf.
- The affine line with doubled origin (KTheoryLowDegrees:Z.5/doubled-line-example).

**Prerequisites.**

- KTheoryLowDegrees:Z.5/curve-affine-diagonal
- SchemeKTheoryOperations:S.1/resolution-property

**Sources.**

- Stacks, Derived Categories of Schemes, Lemma 36.8 (tag 0F8A). The input for (b).

### Vector-bundle resolutions of length one

**KTheoryLowDegrees:Z.5/regular-curve-finite-resolution** · lemma · implementation unchecked.

Let X be a regular noetherian scheme of dimension ≤ 1 and F a coherent O_X-module. Then there is a short exact sequence 0 → E₁ → E₀ → F → 0 of O_X-modules with E₀ and E₁ vector bundles. More precisely, for every surjection E₀ → F from a vector bundle, the kernel is a vector bundle.

**Hypotheses.**

- X regular noetherian of dimension ≤ 1; not necessarily connected or separated.

**Construction or proof.**

- By KTheoryLowDegrees:Z.5/regular-curve-resolution-property, F is a quotient of a vector bundle E₀ (SchemeKTheoryOperations:S.1/resolution-property).
- The kernel E₁ is coherent (X noetherian). At x ∈ X, (E₁)_x is a submodule of the finite free (E₀)_x over O_{X,x}, which is a field or a DVR (KTheoryLowDegrees:Z.5/regular-curve-integral); a finitely generated torsion-free module over a principal ideal domain is free (Mathlib's Module.free_of_finite_type_torsion_free′), so (E₁)_x is free.
- A coherent module with free stalks is locally free of finite rank (Weibel I.5.1.3, (3) ⇒ (1)); so E₁ is a vector bundle (KTheoryLowDegrees:Z.5/vector-bundle).

**Acceptance.**

- For a closed point y of a curve: 0 → O(−y) → O → k(y) → 0 (KTheoryLowDegrees:Z.5/skyscraper-class).
- On Spec ℤ, for n≠0: 0 → ℤ --n--> ℤ → ℤ/n → 0. For n=0 the displayed first map is not injective.

**Prerequisites.**

- KTheoryLowDegrees:Z.5/regular-curve-resolution-property
- KTheoryLowDegrees:Z.5/regular-curve-integral
- KTheoryLowDegrees:Z.5/vector-bundle
- SchemeKTheoryOperations:S.1/resolution-property
- mathlib:Module.free_of_finite_type_torsion_free'

**Sources.**

- Kbook.2013, II.8, Theorem 8.2, PDF p. 154 (book p. 146). The source's statement (for separated X, citing SGA 6); in dimension ≤ 1 separatedness is replaced by KTheoryLowDegrees:Z.5/regular-curve-resolution-property and the resolution has length one.
- Kbook.2013, I.5, Lemma 5.1.3, PDF p. 55 (book p. 47). Condition (3), equivalent to being a vector bundle.

### The Cartan isomorphism for a regular curve

**KTheoryLowDegrees:Z.5/regular-curve-cartan-iso** · theorem · implementation unchecked.

Let X be a regular noetherian scheme of dimension ≤ 1 (not necessarily connected or separated), Coh(X) its abelian category of coherent sheaves and G₀(X) := AbelianK0 (Coh X), the degree-zero group of SchemeKTheoryOperations:S.2/g-theory-of-a-scheme. The inclusion Vect(X) ⊂ Coh(X) is conflation-exact and induces the vector-bundle Cartan map c_X : K₀(Vect X) → G₀(X), [E] ↦ [E] (ExactK0.map). Then c_X is an isomorphism, and its inverse sends [F] to [E₀] − [E₁] for any resolution 0 → E₁ → E₀ → F → 0 by vector bundles. Moreover c_X is the composite of the isomorphisms K₀(Vect X) ≅ K₀(X) := π₀K(Perf X) of SchemeKTheoryOperations:S.2/vector-bundle-k-theory-comparison (valid because X has the resolution property) and π₀ of the Poincaré-duality equivalence K(X) ≃ G(X) of SchemeKTheoryOperations:S.2/cartan-equivalence; so K₀(Vect X) ≅ K₀(X) ≅ G₀(X), and this is the K/G comparison through which the class formulas are stated.

**Hypotheses.**

- X regular noetherian of dimension ≤ 1.
- Separatedness is not needed (KTheoryLowDegrees:Z.5/regular-curve-resolution-property); the failure of K₀(Vect X) ≅ G₀(X) for non-separated regular schemes (the plane with doubled origin) does not occur in dimension one.
- Tau Ceti's finitely presented sheaves carry no abelian instance at the pinned commit, so G₀(X) is formed as ExactK0 of the coherent sheaves with the exact structure induced from X.Modules (the same group).

**Construction or proof.**

- The inclusion Vect(X) → Coh(X) is conflation-exact: a conflation of vector bundles is a short exact sequence of coherent sheaves (KTheoryLowDegrees:Z.5/vector-bundle-extension-closed, vector bundles are finitely presented); define c_X by ExactK0.map.
- By KTheoryLowDegrees:Z.5/regular-curve-resolution-property X has the resolution property, so SchemeKTheoryOperations:S.2/vector-bundle-k-theory-comparison gives K₀(Vect X) ≅ K₀(X), [E] ↦ [E[0]].
- SchemeKTheoryOperations:S.2/cartan-equivalence (regular noetherian, any dimension, not necessarily separated) gives π₀K(X) ≅ π₀G(X), sending [E[0]] to [E] for a vector bundle E (SchemeKTheoryOperations:S.2/cartan-map, cartan_class_vectorBundle); and π₀G(X) = AbelianK0 (Coh X), class for class (SchemeKTheoryOperations:S.2/g-theory-of-a-scheme with GeneralAlgebraicKTheory:K.1/pi1-BQ-equals-K0).
- The composite of these isomorphisms and c_X agree on every [E], hence are equal (ExactK0.hom_ext); so c_X is an isomorphism.
- Inverse formula: for 0 → E₁ → E₀ → F → 0 (KTheoryLowDegrees:Z.5/regular-curve-finite-resolution), [F] = [E₀] − [E₁] in G₀(X) (AbelianK0.of_shortExact), which is c_X([E₀] − [E₁]).

**Acceptance.**

- For a closed point y: c_X⁻¹[O_y] = [O] − [O(−y)].
- For X = Spec A with A Dedekind: c_X is Tau Ceti's cartanEquiv A under the affine identifications (KTheoryLowDegrees:Z.6/cartan-map-comparison).

**Prerequisites.**

- KTheoryLowDegrees:Z.5/vector-bundle-k-zero
- KTheoryLowDegrees:Z.5/vector-bundle-extension-closed
- KTheoryLowDegrees:Z.5/regular-curve-resolution-property
- KTheoryLowDegrees:Z.5/regular-curve-finite-resolution
- SchemeKTheoryOperations:S.2/vector-bundle-k-theory-comparison
- SchemeKTheoryOperations:S.2/cartan-equivalence
- SchemeKTheoryOperations:S.2/cartan-map
- SchemeKTheoryOperations:S.2/g-theory-of-a-scheme
- SchemeKTheoryOperations:S.2/k-zero-of-a-scheme
- GeneralAlgebraicKTheory:K.1/pi1-BQ-equals-K0
- tauceti:TauCeti.AbelianK0
- tauceti:TauCeti.AbelianK0.of_shortExact
- tauceti:TauCeti.ExactK0.map
- tauceti:TauCeti.ExactK0.hom_ext

**Sources.**

- Kbook.2013, II.8, Theorem 8.2, PDF p. 154 (book p. 146). The statement for separated regular noetherian X; here proved for every regular noetherian X of dimension ≤ 1 through S.2.
- Stacks, Derived Categories of Schemes, Lemma 38.4 (tag 0FDI). The perfect-complex form of the Cartan isomorphism in degree zero.
- Stacks, Derived Categories of Schemes, Lemma 38.5 (tag 0FDJ). The vector-bundle comparison used.

### The class of a skyscraper sheaf

**KTheoryLowDegrees:Z.5/skyscraper-class** · lemma · implementation unchecked.

Under the regular-curve package, c_X⁻¹[O_y]=[O_X]−[O(−y)] has rank zero and determinant O(y). Thus the skyscraper class has rank–determinant coordinates (0,O(y)).

**Hypotheses.**

- The regular-curve package: X is a noetherian integral scheme (IsNoetherian X, IsIntegral X) of dimension ≤ 1 (∀ y, coheight y ≤ 1) whose local rings at codimension-one points are discrete valuation rings ([∀ y : CodimensionOnePoint X, IsDiscreteValuationRing (X.presheaf.stalk y)]), Tau Ceti's hypotheses for SchemeWeilDivisor.toLineBundleClass. No separatedness is assumed.
- Neither library has a skyscraper sheaf of modules; O_y is formed as the cokernel of O(−y) → O_X, which is i_{y,*}k(y) for a closed point of codimension one.

**Construction or proof.**

- By KTheoryLowDegrees:Z.5/point-skyscraper-exact-sequence and AbelianK0.of_shortExact, [O_y] = [O_X] − [O(−y)] in G₀(X) = c_X([O_X] − [O(−y)]) (KTheoryLowDegrees:Z.5/regular-curve-cartan-iso); rank is 1 − 1 = 0 and det([O] − [O(−y)]) = [O(−y)]⁻¹ = [O(y)] (KTheoryLowDegrees:Z.5/vector-bundle-determinant).

**Acceptance.**

- On Spec ℤ at y = (p): [O_y] = [ℤ] − [pℤ] = 0, since pℤ ≅ ℤ.
- On P¹_F at the rational point ∞: [O_∞] = [O] − [O(−1)] ↦ (0, O(1)).

**Prerequisites.**

- KTheoryLowDegrees:Z.5/point-skyscraper-exact-sequence
- KTheoryLowDegrees:Z.5/point-divisor-line-inverse
- KTheoryLowDegrees:Z.5/regular-curve-cartan-iso
- KTheoryLowDegrees:Z.5/vector-bundle-determinant
- KTheoryLowDegrees:Z.5/vector-bundle-rank
- tauceti:TauCeti.AbelianK0.of_shortExact

**Sources.**

- Kbook.2013, II.8, Proposition 8.2.1, proof, PDF p. 155 (book p. 147). The formula, verbatim; L(−P) is O(−y) here.

### The class of an effective divisor

**KTheoryLowDegrees:Z.5/effective-divisor-class** · lemma · implementation unchecked.

Let X satisfy the regular-curve package and let D = Σ n_y y be an effective Weil divisor (n_y ≥ 0, finitely many nonzero). Then O(−D) ⊆ O_X is the ideal sheaf with stalks m_y^{n_y}, there is a short exact sequence 0 → O(−D) → O_X → O_D → 0 with O_D = ⊕_y i_{y,*}(O_{X,y}/m_y^{n_y}), and [O_D] = Σ_y n_y [O_y] in G₀(X). Consequently c_X⁻¹[O_D] = [O_X] − [O(−D)] = Σ_y n_y ([O_X] − [O(−y)]), of rank 0 and determinant [O(D)] = toLineBundleClass D.

**Hypotheses.**

- The regular-curve package: X is a noetherian integral scheme (IsNoetherian X, IsIntegral X) of dimension ≤ 1 (∀ y, coheight y ≤ 1) whose local rings at codimension-one points are discrete valuation rings ([∀ y : CodimensionOnePoint X, IsDiscreteValuationRing (X.presheaf.stalk y)]), Tau Ceti's hypotheses for SchemeWeilDivisor.toLineBundleClass. No separatedness is assumed.

**Construction or proof.**

- As in KTheoryLowDegrees:Z.5/skyscraper-class, O(−D) = SchemeWeilDivisor.sheaf (−D) ⊆ O_X has stalk m_y^{n_y} at y and O_{X,z} at the other points; the quotient is supported on the finitely many y with n_y > 0 and is the displayed direct sum of skyscrapers.
- The finite-length O_{X,y}-module O_{X,y}/m_y^{n} has the filtration by m_y^k/m_y^n with quotients m_y^k/m_y^{k+1} ≅ k(y) (O_{X,y} is a DVR), so [i_{y,*}(O_{X,y}/m_y^n)] = n[O_y] in G₀(X) (AbelianK0.of_shortExact repeatedly).
- Apply c_X⁻¹ (KTheoryLowDegrees:Z.5/regular-curve-cartan-iso): [O_D] = [O_X] − [O(−D)]; and the determinant is [O(−D)]⁻¹ = [O(D)] by toLineBundleClass_add; equality with Σ n_y([O] − [O(−y)]) follows since both have the same image under c_X.

**Acceptance.**

- D = 0: O_D = 0 and the class is 0.
- On Spec ℤ, D = 2·(3): O_D = ℤ/9 and [ℤ/9] = 2[ℤ/3] = 0 in G₀(ℤ) = ℤ.

**Prerequisites.**

- KTheoryLowDegrees:Z.5/skyscraper-class
- KTheoryLowDegrees:Z.5/regular-curve-cartan-iso
- KTheoryLowDegrees:Z.5/vector-bundle-determinant
- tauceti:TauCeti.AlgebraicGeometry.SchemeWeilDivisor.sheaf
- tauceti:TauCeti.AlgebraicGeometry.SchemeWeilDivisor.toLineBundleClass_add
- tauceti:TauCeti.AbelianK0.of_shortExact

**Sources.**

- Kbook.2013, II.8, Example 8.2.2, PDF p. 155 (book p. 147). The classes of subschemes, here the finite subschemes D of a curve.
- Stacks, Chow Homology, Lemma 23.2 (tag 02S9), proof. The length filtration giving [O_D] = Σ n_y [O_y].

### Principal divisors have zero class

**KTheoryLowDegrees:Z.5/principal-divisor-class-vanishes** · lemma · implementation unchecked.

Let X satisfy the regular-curve package and g ∈ X.functionField, g ≠ 0, with principal divisor div g = Σ_y ord_y(g) y (Tau Ceti's OrderSystem.principalDivisor). Then Σ_y ord_y(g)[O_y] = 0 in G₀(X), and hence Σ_y ord_y(g)([O_X] − [O(−y)]) = 0 in K₀(Vect X).

**Hypotheses.**

- The regular-curve package: X is a noetherian integral scheme (IsNoetherian X, IsIntegral X) of dimension ≤ 1 (∀ y, coheight y ≤ 1) whose local rings at codimension-one points are discrete valuation rings ([∀ y : CodimensionOnePoint X, IsDiscreteValuationRing (X.presheaf.stalk y)]), Tau Ceti's hypotheses for SchemeWeilDivisor.toLineBundleClass. No separatedness is assumed.

**Construction or proof.**

- Write div g = D₀ − D_∞ with D₀, D_∞ effective (zeros and poles).
- Multiplication by g is an isomorphism O(−D_∞) ≅ O(−D_∞ − div g) = O(−D₀) (Tau Ceti's SchemeWeilDivisor.sheafMulIso with D = −D_∞); here O(−D_∞) is the ideal of denominators of g and O(−D₀) = g·O(−D_∞).
- So [O(−D₀)] = [O(−D_∞)] in K₀(Vect X), hence by KTheoryLowDegrees:Z.5/effective-divisor-class [O_{D₀}] = [O_X] − [O(−D₀)] = [O_X] − [O(−D_∞)] = [O_{D_∞}] in G₀(X), i.e. Σ_{ord>0} ord_y(g)[O_y] = Σ_{ord<0} (−ord_y g)[O_y].
- Stacks 0FDS prints the quotient-class difference with the opposite sign (E27); either sign maps to zero, and the point/divisor normalization here uses the corrected order.

**Acceptance.**

- On P¹_F with g = t (zero at 0, pole at ∞): [O_0] = [O_∞].
- On Spec ℤ with g = 2/3: [ℤ/2] − [ℤ/3] = 0.

**Prerequisites.**

- KTheoryLowDegrees:Z.5/effective-divisor-class
- tauceti:TauCeti.AlgebraicGeometry.SchemeWeilDivisor.sheafMulIso
- tauceti:TauCeti.AlgebraicGeometry.WeilDivisor.OrderSystem.principalDivisor
- tauceti:TauCeti.AlgebraicGeometry.WeilDivisor.OrderSystem.ofScheme

**Sources.**

- Stacks, Chow Homology, Lemma 23.4 (tag 0FDS), proof. The two exact sequences give [O_X/I] = [O_X/fI] in G₀. As cycles, [O_X/fI] − [O_X/I] is div(f), with the corrected order explained in E27.
- Stacks, Chow Homology, Lemma 23.4 (tag 0FDS), proof. The printed cycle difference has the opposite sign: it is −div(f), as the DVR test in E27 shows. Either order vanishes in G₀, so the principal-divisor vanishing conclusion remains valid.

### Skyscrapers generate the rank-zero part of G₀

**KTheoryLowDegrees:Z.5/generic-rank-kernel** · lemma · implementation unchecked.

Let X satisfy the regular-curve package, with generic point η and function field K. The generic rank [F] ↦ dim_K F_η is a surjective homomorphism G₀(X) → ℤ with kernel generated by the classes [O_y] of the skyscrapers at the closed points: ⊕_y ℤ → G₀(X) → ℤ → 0 is exact, the first map sending the generator at y to [O_y]. On K₀(Vect X), generic rank ∘ c_X is the rank.

**Hypotheses.**

- The regular-curve package: X is a noetherian integral scheme (IsNoetherian X, IsIntegral X) of dimension ≤ 1 (∀ y, coheight y ≤ 1) whose local rings at codimension-one points are discrete valuation rings ([∀ y : CodimensionOnePoint X, IsDiscreteValuationRing (X.presheaf.stalk y)]), Tau Ceti's hypotheses for SchemeWeilDivisor.toLineBundleClass. No separatedness is assumed.

**Construction or proof.**

- This is the degree-zero end of the localisation sequence of a one-dimensional noetherian scheme (SchemeKTheoryOperations:S.3/one-dimensional-localisation-sequence): ⊕_y K₀(k(y)) → G₀(X) → K₀(k(η)) → 0, with (i_y)_*[k(y)] = [O_y] and K₀(K) ≅ ℤ by dimension (KTheoryLowDegrees:Z.2/division-ring-k0).
- The map G₀(X) → G₀(K) is restriction to the generic point, [F] ↦ [F_η], and for a vector bundle E, dim_K E_η is the (constant) rank of E (KTheoryLowDegrees:Z.5/vector-bundle-rank).

**Acceptance.**

- On Spec ℤ: ker(G₀(ℤ) → ℤ) is generated by the [ℤ/p], all of which vanish; so G₀(ℤ) = ℤ.
- On P¹_F the kernel is generated by the [O_y] and is ≅ ℤ by degree (KTheoryLowDegrees:Z.6/projective-line-rank-pic).

**Prerequisites.**

- SchemeKTheoryOperations:S.3/one-dimensional-localisation-sequence
- KTheoryLowDegrees:Z.2/division-ring-k0
- KTheoryLowDegrees:Z.5/vector-bundle-rank
- KTheoryLowDegrees:Z.5/regular-curve-cartan-iso

**Sources.**

- Kbook.2013, II.6, Application 6.4.2, PDF p. 129 (book p. 121). The localisation sequence in degree zero; passing to the limit over the opens U containing η gives the generic rank.
- Kbook.2013, II.6, Exercise 6.9(b), PDF p. 134 (book p. 126). The affine shape of the result: the rank-zero part is generated by point classes.

### The divisor-class map to K₀

**KTheoryLowDegrees:Z.5/point-class-map** · construction · implementation unchecked.

Let X satisfy the regular-curve package and Cl(X) := (OrderSystem.ofScheme X).ClassGroup (Tau Ceti). The homomorphism SchemeWeilDivisor X → K₀(Vect X), D = Σ n_y y ↦ Σ n_y ([O_X] − [O(−y)]) = c_X⁻¹(Σ n_y [O_y]), kills principal divisors (KTheoryLowDegrees:Z.5/principal-divisor-class-vanishes) and so descends to cl : Cl(X) →+ K₀(Vect X), with values in K̃₀(X) = ker(rank). For D effective, cl[D] = [O_X] − [O(−D)] = c_X⁻¹[O_D]. The divisor class agrees with the line-bundle class: det ∘ cl equals Tau Ceti's classGroupToLineBundleClassHom, i.e. det(cl[D]) = [O_X(D)].

**Hypotheses.**

- The regular-curve package: X is a noetherian integral scheme (IsNoetherian X, IsIntegral X) of dimension ≤ 1 (∀ y, coheight y ≤ 1) whose local rings at codimension-one points are discrete valuation rings ([∀ y : CodimensionOnePoint X, IsDiscreteValuationRing (X.presheaf.stalk y)]), Tau Ceti's hypotheses for SchemeWeilDivisor.toLineBundleClass. No separatedness is assumed.

**Construction or proof.**

- Define the map on Weil divisors (a free abelian group on codimension-one points, Tau Ceti's SchemeWeilDivisor = WeilDivisor (CodimensionOnePoint X)) by its values on the points ofPoint y; it vanishes on principal divisors by KTheoryLowDegrees:Z.5/principal-divisor-class-vanishes, so it factors through the quotient ClassGroup.
- Effective divisors: KTheoryLowDegrees:Z.5/effective-divisor-class.
- Rank zero: rank([O] − [O(−y)]) = 0 (KTheoryLowDegrees:Z.5/skyscraper-class).
- Determinant: det(cl[ofPoint y]) = [O(y)] = classGroupToLineBundleClass [ofPoint y] (KTheoryLowDegrees:Z.5/skyscraper-class); both sides are additive in D (toLineBundleClass_add, classGroupToLineBundleClass_add), so they agree on Cl(X).

**Acceptance.**

- cl 0 = 0; on Spec ℤ, cl is zero because Cl(ℤ) = 0.
- On P¹_F, cl[∞] = [O] − [O(−1)].

**Prerequisites.**

- KTheoryLowDegrees:Z.5/skyscraper-class
- KTheoryLowDegrees:Z.5/effective-divisor-class
- KTheoryLowDegrees:Z.5/principal-divisor-class-vanishes
- KTheoryLowDegrees:Z.5/regular-curve-cartan-iso
- KTheoryLowDegrees:Z.5/vector-bundle-determinant
- tauceti:TauCeti.AlgebraicGeometry.SchemeWeilDivisor
- tauceti:TauCeti.AlgebraicGeometry.WeilDivisor.OrderSystem.ClassGroup
- tauceti:TauCeti.AlgebraicGeometry.WeilDivisor.OrderSystem.divisorClass
- tauceti:TauCeti.AlgebraicGeometry.SchemeWeilDivisor.classGroupToLineBundleClass
- tauceti:TauCeti.AlgebraicGeometry.SchemeWeilDivisor.classGroupToLineBundleClassHom
- tauceti:TauCeti.AlgebraicGeometry.SchemeWeilDivisor.classGroupToLineBundleClass_add
- tauceti:TauCeti.AlgebraicGeometry.SchemeWeilDivisor.classGroupToLineBundleClass_injective

**Uses.**

- Kbook.2013 II.8.2.1: the diagram chase identifies K̃₀(X) with Pic(X) through the classes of points
- KTheoryLowDegrees:Z.5/curve-rank-determinant-equivalence: every rank-zero class is cl of a divisor class
- EllipticKTheory:E.2/K0-of-an-elliptic-curve: the point P with det ≅ O(P + (d − 1)O) is read from divisor classes
- SchemeKTheoryOperations:S.7/cycle-class-to-graded-k0: cycles map onto the coniveau graded pieces of K₀

**Public API.**

- TauCeti.AlgebraicGeometry.KTheory.pointClass (constructor): pointClass : Cl(X) →+ VectorBundleK0 X.
- TauCeti.AlgebraicGeometry.KTheory.pointClass_ofPoint (simp): pointClass [ofPoint y] = [O_X] − [O(−y)].
- TauCeti.AlgebraicGeometry.KTheory.pointClass_effective (simp): For D ≥ 0, pointClass [D] = [O_X] − [O(−D)].
- TauCeti.AlgebraicGeometry.KTheory.cartan_pointClass (compatibility): cartan (pointClass [D]) = Σ n_y [O_y] in G₀(X).
- TauCeti.AlgebraicGeometry.KTheory.rank_pointClass (simp): rank (pointClass c) = 0.
- TauCeti.AlgebraicGeometry.KTheory.det_pointClass (compatibility): det (pointClass c) = classGroupToLineBundleClassHom c.
- TauCeti.AlgebraicGeometry.KTheory.pointClass_injective (characterisation): pointClass is injective (det is a left inverse after classGroupToLineBundleClass_injective).
- TauCeti.AlgebraicGeometry.KTheory.pointClass_functionFieldDivisor (compatibility): For X a regular projective curve over a field k with function field F, precomposed with the identification of Cl(X) with the function-field class group Cl(F) of AlgebraicCurves layer 12D (requested), pointClass sends the class of a place P to [O_X] − [O(−P)].

**Unit tests.**

- TauCeti.AlgebraicGeometry.KTheory.pointClass_zero_test (degenerate): pointClass 0 = 0.
- TauCeti.AlgebraicGeometry.KTheory.pointClass_int_test (computation): On Spec ℤ, pointClass [ofPoint (p)] = [ℤ] − [pℤ] = 0 for every prime p.
- TauCeti.AlgebraicGeometry.KTheory.det_pointClass_test (compatibility): det (pointClass c) = classGroupToLineBundleClassHom c for every c, Tau Ceti's divisor-to-line-bundle map.
- TauCeti.AlgebraicGeometry.KTheory.pointClass_not_sheafClass_test (non-example): D ↦ [O_X(D)] is not additive: [O(y + z)] and [O(y)] + [O(z)] have ranks 1 and 2; the correct map subtracts [O_X] from each point term.

**Sources.**

- Kbook.2013, II.8, Proposition 8.2.1, proof, PDF p. 154 (book p. 146). The divisor/line-bundle agreement this construction records at the level of K₀.
- Kbook.2013, II.8, Example 8.2.2, PDF p. 155 (book p. 147). The classes of point subschemes.

### Every line bundle on a regular curve comes from a divisor

**KTheoryLowDegrees:Z.5/line-bundle-divisorial** · theorem · implementation unchecked.

Let X satisfy the regular-curve package. Every invertible sheaf L on X is isomorphic to O_X(D) for a Weil divisor D; explicitly, for a nonzero rational section s of L, L ≅ O_X(div_L s) with div_L s = Σ_y ord_y(s/s_y) y (s_y a local generator at y). Hence Tau Ceti's classGroupToLineBundleClass : Cl(X) → LineBundleClass X is bijective, every element of LineBundleClass X is a unit, so LineBundleClass X is a group without any appeal to duals, and classGroupToLineBundleClassHom is an isomorphism Cl(X) ≃+ Additive (Pic X). On a smooth proper curve over a field this is JacobianChallenge layer A's Cl(X) ≅ Pic X (the same map D ↦ O(D)); the present statement covers every regular noetherian curve, possibly nonproper or arithmetic, such as Spec O_{F,S}.

**Hypotheses.**

- The regular-curve package: X is a noetherian integral scheme (IsNoetherian X, IsIntegral X) of dimension ≤ 1 (∀ y, coheight y ≤ 1) whose local rings at codimension-one points are discrete valuation rings ([∀ y : CodimensionOnePoint X, IsDiscreteValuationRing (X.presheaf.stalk y)]), Tau Ceti's hypotheses for SchemeWeilDivisor.toLineBundleClass. No separatedness is assumed.
- No separatedness is assumed (Weibel's Proposition I.5.15 assumes it; Stacks 0BE9 does not).

**Construction or proof.**

- Generic trivialisation: X is integral and L is locally free of rank one, so its stalk at the generic point is a one-dimensional K-vector space; choose a nonzero s in it. On an open U with generator e_U of L|U write s = f_U e_U, f_U ∈ K^×; on overlaps f_U/f_V ∈ O(U ∩ V)^× (Weibel I.5.12: L embeds in L ⊗ K ≅ K).
- Define D(y) := ord_y(f_U) for any U ∋ y (independent of U since f_U/f_V is a unit at y); D has finite support because X is noetherian and each f_U is a unit on a dense open of U.
- The map t ↦ t/s sends L(U) = O(U)e_U onto f_U⁻¹·O(U) = {h ∈ K : ord_y h ≥ −D(y) for codimension-one y ∈ U}, which is O_X(D)(U) (SchemeWeilDivisor.sheaf; O(U) = ⋂_y O_{X,y} as X is normal of dimension ≤ 1, SchemeWeilDivisor.unitIsoSheafZero). These isomorphisms are compatible on overlaps, so L ≅ O_X(D) (Stacks 0BE9).
- Surjectivity of classGroupToLineBundleClass follows; injectivity is Tau Ceti's classGroupToLineBundleClass_injective; units: isUnit_toLineBundleClass. So the additive map classGroupToLineBundleClassHom is a bijection onto the (group) LineBundleClass X.

**Acceptance.**

- On P¹_F: every line bundle is O(m) = O(m·∞) (KTheoryLowDegrees:Z.6/projective-line-regular-curve).
- On Spec A, A Dedekind: every invertible A-module is isomorphic to a fractional ideal, and Cl(Spec A) ≅ Pic(A) (Mathlib's ClassGroup.equivPic).

**Prerequisites.**

- tauceti:TauCeti.AlgebraicGeometry.SchemeWeilDivisor.classGroupToLineBundleClass
- tauceti:TauCeti.AlgebraicGeometry.SchemeWeilDivisor.classGroupToLineBundleClass_injective
- tauceti:TauCeti.AlgebraicGeometry.SchemeWeilDivisor.classGroupToLineBundleClassHom
- tauceti:TauCeti.AlgebraicGeometry.SchemeWeilDivisor.isUnit_toLineBundleClass
- tauceti:TauCeti.AlgebraicGeometry.SchemeWeilDivisor.sheaf
- tauceti:TauCeti.AlgebraicGeometry.SchemeWeilDivisor.unitIsoSheafZero
- tauceti:TauCeti.AlgebraicGeometry.Scheme.rationalFunctions
- tauceti:TauCeti.AlgebraicGeometry.InvertibleSheaf
- tauceti:TauCeti.AlgebraicGeometry.LineBundleClass
- tauceti:TauCeti.AlgebraicGeometry.LineBundleClass.mk_eq_mk_iff
- mathlib:AlgebraicGeometry.Scheme.ord
- mathlib:ClassGroup.equivPic

**Sources.**

- Stacks, Divisors, Lemma 28.7 (tag 0BE9). The statement; DVRs and fields are UFDs, and no separatedness is needed. Stacks' map L ↦ div_L(s) is inverse to Tau Ceti's D ↦ O(D).
- Kbook.2013, I.5, Proposition 5.12, proof, PDF p. 64 (book p. 56). The generic trivialisation step.
- Kbook.2013, I.5, Proposition 5.15, PDF p. 66 (book p. 58). The K-book's version, with a separatedness hypothesis the argument does not need.

### K₀ of a regular curve by rank and determinant

**KTheoryLowDegrees:Z.5/curve-rank-determinant-equivalence** · theorem · implementation unchecked.

Let X be a connected regular noetherian scheme of dimension ≤ 1 (equivalently, X satisfies the regular-curve package, KTheoryLowDegrees:Z.5/regular-curve-integral); X need not be separated, proper or defined over a field. Then (rank, det) : K₀(Vect X) → ℤ × Additive (Pic X) is an additive equivalence, with inverse (n, L) ↦ (n − 1)[O_X] + [L] for every n ∈ ℤ. Equivalently SK₀(X) = 0 and det restricts to an isomorphism K̃₀(X) ≅ Pic(X) with inverse L ↦ [L] − [O_X]. Class formulas: [O_X] ↦ (1, O_X); [L] ↦ (1, L) for a line bundle; a vector bundle E ↦ (rank E, det E); the skyscraper at a closed point, c_X⁻¹[O_y] = [O_X] − [O(−y)] ↦ (0, O(y)); cl[D] ↦ (0, O(D)). Through the Cartan isomorphism, G₀(X) ≅ K₀(X) ≅ ℤ ⊕ Pic(X) ≅ ℤ ⊕ Cl(X), [F] ↦ (generic rank F, det of any vector-bundle resolution of F).

**Hypotheses.**

- The regular-curve package: X is a noetherian integral scheme (IsNoetherian X, IsIntegral X) of dimension ≤ 1 (∀ y, coheight y ≤ 1) whose local rings at codimension-one points are discrete valuation rings ([∀ y : CodimensionOnePoint X, IsDiscreteValuationRing (X.presheaf.stalk y)]), Tau Ceti's hypotheses for SchemeWeilDivisor.toLineBundleClass. No separatedness is assumed.
- Connectedness is needed for the single integer rank; for a disconnected regular scheme of dimension ≤ 1 the same holds componentwise with H⁰(X; ℤ) in place of ℤ.
- This theorem makes no use of an elliptic or genus-one structure; the origin-dependent K₀(E) ≅ ℤ² ⊕ E(F) is EllipticKTheory:E.2's.

**Construction or proof.**

- Surjectivity and the inverse on the image: KTheoryLowDegrees:Z.5/rank-determinant-surjective, with (rank, det)((n − 1)[O] + [L]) = (n − 1 + 1, L).
- Injectivity: let x have rank 0 and det x = 1. By KTheoryLowDegrees:Z.5/generic-rank-kernel, c_X(x) = Σ n_y [O_y] for some divisor D = Σ n_y y, so x = cl[D] (KTheoryLowDegrees:Z.5/point-class-map and injectivity of c_X, KTheoryLowDegrees:Z.5/regular-curve-cartan-iso).
- Then 1 = det x = classGroupToLineBundleClass [D] (KTheoryLowDegrees:Z.5/point-class-map), so [D] = 0 in Cl(X) (classGroupToLineBundleClass_injective) and x = cl[D] = 0.
- The class formulas are KTheoryLowDegrees:Z.5/skyscraper-class and KTheoryLowDegrees:Z.5/point-class-map; K̃₀(X) ≅ Pic(X) ≅ Cl(X) with KTheoryLowDegrees:Z.5/line-bundle-divisorial; the G₀ form is KTheoryLowDegrees:Z.5/regular-curve-cartan-iso.
- This replaces the source's reduction to the affine complement X − P of one closed point, whose justification (Hartshorne Ex. IV.1.3) covers only curves over a field; the argument above uses no affine complement.

**Acceptance.**

- For X = Spec A, A a Dedekind domain, this is KTheoryLowDegrees:Z.4/rank-pic-equivalence (KTheoryLowDegrees:Z.5/dedekind-curve-comparison).
- For X = P¹_F: K₀ ≅ ℤ ⊕ ℤ by (rank, deg det) (KTheoryLowDegrees:Z.6/projective-line-rank-pic).
- A rank-only implementation fails: for A = ℤ[√−5] the class [I~] − [O] ≠ 0 has rank 0 (KTheoryLowDegrees:Z.6/nonprincipal-ideal-test).
- For a genus-one curve C over F without a rational point the theorem still gives K₀(C) ≅ ℤ ⊕ Pic(C), but no rational point splits the degree; the decomposition ℤ² ⊕ E(F) requires EllipticKTheory:E.2's rational origin (see also KTheoryLowDegrees:Z.6/pointless-conic-test for the genus-zero analogue).

**Prerequisites.**

- KTheoryLowDegrees:Z.5/regular-curve-integral
- KTheoryLowDegrees:Z.5/rank-determinant-surjective
- KTheoryLowDegrees:Z.5/generic-rank-kernel
- KTheoryLowDegrees:Z.5/point-class-map
- KTheoryLowDegrees:Z.5/regular-curve-cartan-iso
- KTheoryLowDegrees:Z.5/skyscraper-class
- KTheoryLowDegrees:Z.5/line-bundle-divisorial
- KTheoryLowDegrees:Z.5/vector-bundle-rank
- KTheoryLowDegrees:Z.5/vector-bundle-determinant
- tauceti:TauCeti.AlgebraicGeometry.SchemeWeilDivisor.classGroupToLineBundleClass_injective

**Sources.**

- Kbook.2013, II.8, Proposition 8.2.1, PDF p. 154 (book p. 146). The statement; here without separatedness and with the explicit inverse.
- Kbook.2013, II.8, Proposition 8.2.1, proof, PDF p. 154 (book p. 146). The route taken here: the Cartan isomorphism followed by the G₀ computation of points and divisors.
- Stacks, Chow Homology, Lemma 69.3 (tag 02SC). For k = 0 on a curve of finite type over a field this is the injectivity of Cl(X) → G₀(X); here injectivity comes from the determinant instead, which needs no base.

### The ring K₀ of a regular curve

**KTheoryLowDegrees:Z.5/curve-k-zero-ring** · lemma · implementation unchecked.

Let X be a connected regular noetherian scheme of dimension ≤ 1. Under the equivalence of KTheoryLowDegrees:Z.5/curve-rank-determinant-equivalence, the tensor-product ring structure of K₀(Vect X) (KTheoryLowDegrees:Z.5/vector-bundle-k-zero-ring) becomes (a, L)·(b, M) = (ab, L^{⊗b} ⊗ M^{⊗a}) with unit (1, O_X). In particular K̃₀(X)² = 0: ([L] − 1)([M] − 1) = 0, i.e. [L ⊗ M] = [L] + [M] − 1 for line bundles; the product of two skyscraper classes c_X⁻¹[O_y]·c_X⁻¹[O_z] is 0; [L]·c_X⁻¹[O_y] = c_X⁻¹[O_y]. This is not the product ring ℤ × Pic(X).

**Hypotheses.**

- X connected regular noetherian of dimension ≤ 1.

**Construction or proof.**

- KTheoryLowDegrees:Z.5/rank-determinant-surjective shows rank ⊕ det is a ring homomorphism for the displayed product; by KTheoryLowDegrees:Z.5/curve-rank-determinant-equivalence it is bijective, hence a ring isomorphism.
- (0, L)·(0, M) = (0, L⁰ ⊗ M⁰) = (0, O_X), so K̃₀(X) has square zero; (1, L)·(0, O(y)) = (0, O(y)) gives [L]·c_X⁻¹[O_y] = c_X⁻¹[O_y].

**Acceptance.**

- On P¹_F: (1 − [O(−1)])² = 0.
- If O(y) is nontrivial in Pic(X), the nonzero square-zero class (0,O(y)) is not idempotent. For a principal point divisor this class is zero and is idempotent.

**Prerequisites.**

- KTheoryLowDegrees:Z.5/curve-rank-determinant-equivalence
- KTheoryLowDegrees:Z.5/rank-determinant-surjective
- KTheoryLowDegrees:Z.5/vector-bundle-k-zero-ring

**Sources.**

- Kbook.2013, II.8, Theorem 8.1, PDF p. 153 (book p. 145). The ring structure transported.

### Line bundles on an affine scheme are invertible modules

**KTheoryLowDegrees:Z.5/picard-affine-comparison** · comparison · implementation unchecked.

Let R be a commutative ring. Under the tilde equivalence of KTheoryLowDegrees:Z.5/vector-bundle-affine-comparison, invertible R-modules (Mathlib's Module.Invertible; finitely generated projective of constant rank one) correspond to invertible sheaves on Spec R (Tau Ceti's IsInvertible), and (P ⊗_R Q)~ ≅ P~ ⊗ Q~. Hence P ↦ LineBundleClass.mk (P~) is a monoid isomorphism CommRing.Pic R ≃* LineBundleClass (Spec R); in particular LineBundleClass (Spec R) is a group. It is compatible with determinants: det(P~) corresponds to Z.3's detProjective P, so under the affine identifications the determinant of KTheoryLowDegrees:Z.5/vector-bundle-determinant is KTheoryLowDegrees:Z.3/determinant-hom.

**Hypotheses.**

- R commutative; no noetherian hypothesis.

**Construction or proof.**

- An invertible R-module is finitely generated projective (Mathlib's Module.Invertible instances) with P_p ≅ R_p at every prime (Pic of a local ring is trivial), so P~ is a vector bundle of rank one, i.e. invertible; conversely an invertible sheaf on Spec R is M~ with M finitely generated projective of rank one, and such M is invertible (M ⊗ Hom(M, R) ≅ R, checked locally).
- The tilde functor is monoidal on quasi-coherent modules, (M ⊗_R N)~ ≅ M~ ⊗ N~ (compare sections over basic opens), so the bijection on isomorphism classes (CommRing.Pic.mk_eq_mk_iff, LineBundleClass.mk_eq_mk_iff) is multiplicative (CommRing.Pic.mk_tensor, LineBundleClass.mk_tensorProduct).
- Determinants: det(P~) ≅ (detProjective P)~ (KTheoryLowDegrees:Z.5/determinant-bundle), so the two determinant homomorphisms agree on classes, hence everywhere.

**Acceptance.**

- For R a PID, both groups are trivial.
- For R = ℤ[√−5], the class of I = (2, 1 + √−5) is nontrivial in both groups and has order 2.

**Prerequisites.**

- KTheoryLowDegrees:Z.5/vector-bundle-affine-comparison
- KTheoryLowDegrees:Z.5/determinant-bundle
- KTheoryLowDegrees:Z.5/vector-bundle-determinant
- KTheoryLowDegrees:Z.3/determinant-hom
- mathlib:CommRing.Pic
- mathlib:CommRing.Pic.mk
- mathlib:CommRing.Pic.mk_eq_mk_iff
- mathlib:CommRing.Pic.mk_tensor
- mathlib:Module.Invertible
- tauceti:TauCeti.AlgebraicGeometry.LineBundleClass.mk_eq_mk_iff
- tauceti:TauCeti.AlgebraicGeometry.LineBundleClass.mk_tensorProduct

**Sources.**

- Kbook.2013, I.5.3, The Picard group and determinant bundles, PDF p. 58 (book p. 50). The comparison.

### The affine case is the Dedekind classification

**KTheoryLowDegrees:Z.5/dedekind-curve-comparison** · comparison · implementation unchecked.

Let A be a Dedekind domain that is not a field and X = Spec A (so X satisfies the regular-curve package). Under RingK0 A ≃+ K₀(Vect X) (KTheoryLowDegrees:Z.5/vector-bundle-affine-comparison) and CommRing.Pic A ≃* Pic(X) (KTheoryLowDegrees:Z.5/picard-affine-comparison), the equivalence of KTheoryLowDegrees:Z.5/curve-rank-determinant-equivalence is KTheoryLowDegrees:Z.4/rank-pic-equivalence: both send x to (rank x, det x) and both have inverse (n, L) ↦ (n − 1)[A] + [L]. For a maximal ideal 𝔭, the skyscraper class is [A] − [𝔭] ↦ (0, [𝔭]⁻¹), and O(y) for y = 𝔭 is the fractional ideal 𝔭⁻¹. In particular this holds for A = 𝓞_F and A = O_{F,S} (Mathlib's Set.integer), where Pic ≅ Cl by ClassGroup.equivPic.

**Hypotheses.**

- A Dedekind domain, not a field; the field case is KTheoryLowDegrees:Z.6/field-test.

**Construction or proof.**

- Spec A is integral noetherian of dimension 1 with DVR local rings at maximal ideals (Mathlib's IsLocalization.AtPrime.isDiscreteValuationRing_of_dedekind_domain).
- Rank: RingK0.rank corresponds to the vector-bundle rank (KTheoryLowDegrees:Z.5/vector-bundle-rank); determinant: KTheoryLowDegrees:Z.5/picard-affine-comparison. So the two maps agree, and so do their inverses by the formula.
- The skyscraper at 𝔭 is (A/𝔭)~ and O(−y) = 𝔭~; det([A] − [𝔭]) = [𝔭]⁻¹ (KTheoryLowDegrees:Z.5/skyscraper-class).

**Acceptance.**

- A = ℤ: K₀ ≅ ℤ, Pic trivial.
- A = ℤ[√−5]: K₀ ≅ ℤ ⊕ ℤ/2 (KTheoryLowDegrees:Z.6/nonprincipal-ideal-test).

**Prerequisites.**

- KTheoryLowDegrees:Z.5/curve-rank-determinant-equivalence
- KTheoryLowDegrees:Z.5/vector-bundle-affine-comparison
- KTheoryLowDegrees:Z.5/picard-affine-comparison
- KTheoryLowDegrees:Z.5/vector-bundle-rank
- KTheoryLowDegrees:Z.5/skyscraper-class
- KTheoryLowDegrees:Z.4/rank-pic-equivalence
- mathlib:IsDedekindDomain
- mathlib:IsLocalization.AtPrime.isDiscreteValuationRing_of_dedekind_domain
- mathlib:ClassGroup.equivPic

**Sources.**

- Kbook.2013, II.8, Proposition 8.2.1, proof, PDF p. 154 (book p. 146). The affine case, which is the ring-level Dedekind classification.

### The affine line with doubled origin

**KTheoryLowDegrees:Z.5/doubled-line-example** · application · implementation unchecked.

Let k be a field and X = A¹_k ∪_{A¹∖0} A¹_k, two copies U′, U″ of Spec k[t] glued along Spec k[t, t⁻¹], with origins 0′, 0″. X is noetherian, integral, regular of dimension 1 and not separated, but it has affine diagonal and the resolution property (KTheoryLowDegrees:Z.5/regular-curve-resolution-property). Cl(X) ≅ ℤ, generated by [0′] with [0″] = −[0′] (div t = 0′ + 0″), so Pic(X) ≅ ℤ with generator the line bundle glued from O on the two charts by t. KTheoryLowDegrees:Z.5/curve-rank-determinant-equivalence gives K₀(Vect X) ≅ ℤ ⊕ ℤ ≅ G₀(X), with c_X⁻¹[O_{0′}] ↦ (0, 1). This is the corrected form of Weibel's Remark V.3.4.2, which asserts K₀VB(X) = ℤ for this scheme; K₀VB = ℤ ≠ G₀ holds for the plane with doubled origin (SchemeKTheoryOperations:S.1/doubled-plane-counterexample).

**Hypotheses.**

- k a field; X as displayed.

**Construction or proof.**

- X is covered by two affine opens with affine intersection Spec k[t, t⁻¹], so it is noetherian with affine diagonal; its local rings are those of A¹_k, so it is regular of dimension 1 and integral (the charts share their generic point); it is not separated (0′ and 0″ are not separated by the diagonal).
- Divisors: away from the origins X is A¹ ∖ 0, where every closed point is the divisor of an irreducible polynomial not divisible by t; div t = 0′ + 0″; hence Cl(X) = ℤ0′ ⊕ ℤ0″/(0′ + 0″) ≅ ℤ. By KTheoryLowDegrees:Z.5/line-bundle-divisorial, Pic(X) ≅ ℤ.
- Apply KTheoryLowDegrees:Z.5/curve-rank-determinant-equivalence and KTheoryLowDegrees:Z.5/regular-curve-cartan-iso.

**Acceptance.**

- K₀(Vect X) ≅ ℤ² ≇ ℤ, while for the plane with doubled origin K₀(Vect X) ≅ ℤ.
- Restriction to either chart U′ ≅ A¹_k or U″ ≅ A¹_k sends every rank-zero class to 0 (Pic(A¹_k) = 0), so c_X⁻¹[O_{0′}] ↦ (0, 1) is a nonzero class of K₀(Vect X) that vanishes on both charts.

**Prerequisites.**

- KTheoryLowDegrees:Z.5/regular-curve-resolution-property
- KTheoryLowDegrees:Z.5/curve-rank-determinant-equivalence
- KTheoryLowDegrees:Z.5/regular-curve-cartan-iso
- KTheoryLowDegrees:Z.5/line-bundle-divisorial
- SchemeKTheoryOperations:S.1/doubled-plane-counterexample

**Sources.**

- Totaro.2004, §1, p. 2. The affine diagonal of the doubled line.
- Kbook.2013, V.3, Remark 3.4.2, PDF p. 395 (book p. 387). The printed claim, which this application corrects (recorded as SchemeKTheoryOperations/E1): for the line, K₀VB(X) ≅ ℤ ⊕ ℤ.

### Affine diagonal in dimension at most one

**KTheoryLowDegrees:Z.5/curve-affine-diagonal** · lemma · implementation unchecked.

Every noetherian scheme X of dimension ≤1 has affine diagonal: intersections of two affine opens are affine.

**Hypotheses.**

- X is noetherian of dimension ≤1; regularity and separatedness are not needed.

**Construction or proof.**

- (a) X noetherian implies every open subset is quasi-compact, so U ∩ V is a quasi-compact open of the affine scheme U, all of whose local rings are noetherian of dimension ≤ 1; such an open is affine (Stacks 09N9). The diagonal pulls U × V back to U ∩ V, and the U × V cover X × X, so the diagonal is affine (affine morphisms are local on the target, Stacks 01S8).

**Acceptance.**

- The affine line with doubled origin has affine diagonal.
- The dimension-two doubled plane is outside the hypothesis.

**Prerequisites.**

- mathlib:AlgebraicGeometry.IsAffineHom
- mathlib:AlgebraicGeometry.IsAffineOpen
- mathlib:AlgebraicGeometry.IsNoetherian

**Sources.**

- Stacks, Varieties, Lemma 38.2 (tag 09N9). The input for (a).
- Totaro.2004, §1, p. 2. The doubled line is covered by (a) and (b); the doubled plane is not.

### Ample line bundles on separated curves

**KTheoryLowDegrees:Z.5/curve-ample-line-bundle** · lemma · implementation unchecked.

A noetherian separated scheme X of dimension ≤1 admits an ample invertible sheaf.

**Hypotheses.**

- X is noetherian, separated and of dimension ≤1.

**Construction or proof.**

- (c) A noetherian separated scheme of dimension 1 has an ample invertible sheaf (Stacks 09NZ), which gives the resolution property directly (Stacks 0F87).
- For dimension zero, X is a finite disjoint union of spectra of artinian local rings, hence affine; O_X is ample. The dimension-one case is precisely Stacks 09NZ.

**Acceptance.**

- O(1) on P¹ is ample.
- For a zero-dimensional noetherian affine scheme the structure sheaf is ample.

**Prerequisites.**

- mathlib:AlgebraicGeometry.IsNoetherian
- mathlib:AlgebraicGeometry.IsSeparated

**Sources.**

- Stacks, Varieties, Proposition 38.12 (tag 09NZ). The separated case (c).

### Ideal sheaf of a codimension-one point

**KTheoryLowDegrees:Z.5/point-ideal-sheaf** · lemma · implementation unchecked.

Under the regular-curve package, O(−y)→O_X is the ideal sheaf of the reduced closed codimension-one point y. Its stalk at y is m_y and at every z≠y is O_{X,z}.

**Hypotheses.**

- The regular-curve package: X is a noetherian integral scheme (IsNoetherian X, IsIntegral X) of dimension ≤ 1 (∀ y, coheight y ≤ 1) whose local rings at codimension-one points are discrete valuation rings ([∀ y : CodimensionOnePoint X, IsDiscreteValuationRing (X.presheaf.stalk y)]), Tau Ceti's hypotheses for SchemeWeilDivisor.toLineBundleClass. No separatedness is assumed.
- Neither library has a skyscraper sheaf of modules; O_y is formed as the cokernel of O(−y) → O_X, which is i_{y,*}k(y) for a closed point of codimension one.

**Construction or proof.**

- (1) A rational function f is a section of O(0) = O_X over U iff ord_z f ≥ 0 at every codimension-one z ∈ U (Tau Ceti's SchemeWeilDivisor.sheaf, unitIsoSheafZero); it is a section of O(−y) iff moreover ord_y f ≥ 1 when y ∈ U, i.e. f vanishes at y. So O(−y) ⊆ O_X with the displayed stalks.

**Acceptance.**

- At y=(p) on Spec ℤ its stalk is pℤ_(p).
- At a different prime the stalk is the whole local ring.

**Prerequisites.**

- tauceti:TauCeti.AlgebraicGeometry.SchemeWeilDivisor.sheaf
- tauceti:TauCeti.AlgebraicGeometry.SchemeWeilDivisor.sheafHomOfLE
- tauceti:TauCeti.AlgebraicGeometry.SchemeWeilDivisor.unitIsoSheafZero
- tauceti:TauCeti.AlgebraicGeometry.SchemeWeilDivisor.isLocallyPrincipal_of_forall_coheight_le_one
- tauceti:TauCeti.AlgebraicGeometry.SchemeWeilDivisor.toInvertibleSheaf
- tauceti:TauCeti.AlgebraicGeometry.SchemeWeilDivisor.toLineBundleClass
- tauceti:TauCeti.AlgebraicGeometry.SchemeWeilDivisor.toLineBundleClass_add
- tauceti:TauCeti.AlgebraicGeometry.SchemeWeilDivisor.toLineBundleClass_zero
- tauceti:TauCeti.AlgebraicGeometry.WeilDivisor.ofPoint

**Sources.**

- Kbook.2013, II.8, Proposition 8.2.1, proof, PDF p. 155 (book p. 147). The formula, verbatim; L(−P) is O(−y) here.

### Exact sequence of a closed point

**KTheoryLowDegrees:Z.5/point-skyscraper-exact-sequence** · lemma · implementation unchecked.

Under the regular-curve package, 0→O(−y)→O_X→O_y→0 is short exact, where O_y is the cokernel sheaf and identifies with i_{y,*}k(y).

**Hypotheses.**

- The regular-curve package: X is a noetherian integral scheme (IsNoetherian X, IsIntegral X) of dimension ≤ 1 (∀ y, coheight y ≤ 1) whose local rings at codimension-one points are discrete valuation rings ([∀ y : CodimensionOnePoint X, IsDiscreteValuationRing (X.presheaf.stalk y)]), Tau Ceti's hypotheses for SchemeWeilDivisor.toLineBundleClass. No separatedness is assumed.
- Neither library has a skyscraper sheaf of modules; O_y is formed as the cokernel of O(−y) → O_X, which is i_{y,*}k(y) for a closed point of codimension one.

**Construction or proof.**

- (2) The quotient O_X/O(−y) has stalk O_{X,y}/m_y = k(y) at y and 0 elsewhere, which is the skyscraper i_{y,*}k(y).
- The monomorphism is point-ideal-sheaf; cokernels in the abelian sheaf-module category give the displayed short exact sequence.

**Acceptance.**

- The quotient stalk at y is k(y) and all other stalks are zero.

**Prerequisites.**

- KTheoryLowDegrees:Z.5/point-ideal-sheaf
- tauceti:TauCeti.AbelianK0.of_shortExact

**Sources.**

- Kbook.2013, II.8, Proposition 8.2.1, proof, PDF p. 155 (book p. 147). The formula, verbatim; L(−P) is O(−y) here.

### Opposite point divisors give inverse lines

**KTheoryLowDegrees:Z.5/point-divisor-line-inverse** · lemma · implementation unchecked.

Under the regular-curve package, O(−y) and O(y) are invertible sheaves and their classes multiply to the unit in LineBundleClass X.

**Hypotheses.**

- The regular-curve package: X is a noetherian integral scheme (IsNoetherian X, IsIntegral X) of dimension ≤ 1 (∀ y, coheight y ≤ 1) whose local rings at codimension-one points are discrete valuation rings ([∀ y : CodimensionOnePoint X, IsDiscreteValuationRing (X.presheaf.stalk y)]), Tau Ceti's hypotheses for SchemeWeilDivisor.toLineBundleClass. No separatedness is assumed.
- Neither library has a skyscraper sheaf of modules; O_y is formed as the cokernel of O(−y) → O_X, which is i_{y,*}k(y) for a closed point of codimension one.

**Construction or proof.**

- (3) Every Weil divisor is locally principal on such X (Tau Ceti's isLocallyPrincipal_of_forall_coheight_le_one), so both sheaves are invertible (toInvertibleSheaf); O(y) ⊗ O(−y) ≅ O(0) ≅ O_X by toLineBundleClass_add and toLineBundleClass_zero.

**Acceptance.**

- On P¹ this is O(−1)⊗O(1)≅O.

**Prerequisites.**

- tauceti:TauCeti.AlgebraicGeometry.SchemeWeilDivisor.sheaf
- tauceti:TauCeti.AlgebraicGeometry.SchemeWeilDivisor.sheafHomOfLE
- tauceti:TauCeti.AlgebraicGeometry.SchemeWeilDivisor.unitIsoSheafZero
- tauceti:TauCeti.AlgebraicGeometry.SchemeWeilDivisor.isLocallyPrincipal_of_forall_coheight_le_one
- tauceti:TauCeti.AlgebraicGeometry.SchemeWeilDivisor.toInvertibleSheaf
- tauceti:TauCeti.AlgebraicGeometry.SchemeWeilDivisor.toLineBundleClass
- tauceti:TauCeti.AlgebraicGeometry.SchemeWeilDivisor.toLineBundleClass_add
- tauceti:TauCeti.AlgebraicGeometry.SchemeWeilDivisor.toLineBundleClass_zero
- tauceti:TauCeti.AlgebraicGeometry.WeilDivisor.ofPoint

**Sources.**

- Kbook.2013, II.8, Proposition 8.2.1, proof, PDF p. 155 (book p. 147). The formula, verbatim; L(−P) is O(−y) here.
## KTheoryLowDegrees:Z.6

RS-18 narrows Z.6 to map-level comparisons and tests. Targets and nodes. 'Prove that these definitions and maps agree with π₀K from K': ring-k-zero-pi-zero (ring K₀ = π₁BQP(A) = π₀ of the plus model, natural in ring maps, with products) and vector-bundle-k-zero-pi-zero (K₀(Vect X) = π₀K(X) under the resolution property, natural in pullback, affine square). 'localisation sends a projective class to its localised class and a perfect complex to its Euler class': localisation-projective-class and perfect-complex-euler-class (Weibel II.9.2.2, II.9.7.5, II.9.8; Tau Ceti's moduleEulerClassOf is the existing Euler class of GrothendieckEulerForms layer 3). 'Compare the Cartan map to G₀ with the existing general Cartan map': cartan-map-comparison (one map: Tau Ceti's cartanMap, π₀ of S.2's). Tests: field-test, integers-test, field-product-test (disconnected spectrum), nonprincipal-ideal-test (ℤ[√−5], I = (2, 1 + √−5), from Z.4/nonprincipal-ideal-class: order two, invisible to every localisation at a prime, skyscraper and Euler class), projective-line-regular-curve, projective-line-rank-pic, projective-line-change-of-basis ((r, d) ↦ (r + d, −d) against the basis (1, [O(−1)]) of S.5/projective-line-k-theory, which is imported, not reproved), elliptic-test (imports EllipticKTheory E.2 for the origin-dependent formula; rank-only and rank-and-degree implementations fail), pointless-conic-test (the rational-point hypothesis in genus zero). 'A rank-only implementation fails the nonprincipal-ideal and elliptic tests' is part of those two nodes. BS17 adds the downstream perfect-complex and Witt-support determinant comparisons, importing the early signed normalization from Z.3.

Refinements still required:

- Verify the homotopy-coherent perfect/support K and perfect v-descent interfaces in the common determinant gap; implement map-level compatibility with the existing Euler and rank/Pic maps. Native signatures for these unavailable enhanced carriers remain explicit omissions.

### Ring K₀ is π₀ of K-theory

**KTheoryLowDegrees:Z.6/ring-k-zero-pi-zero** · comparison · implementation unchecked.

Let A be a ring and K(A) := K(P(A)) Quillen's K-theory of the exact category of finitely generated projective A-modules (GeneralAlgebraicKTheory K.1, K.2:plus). The composite RingK0 A ≃+ ExactK0 (finiteProjectiveModulesExactStructure A) (KTheoryLowDegrees:Z.1/ring-k0-exact) ≃+ π₁(BQP(A), 0) = K₀P(A) (GeneralAlgebraicKTheory:K.1/pi1-BQ-equals-K0) is an isomorphism RingK0 A ≅ π₀K(A) sending [P] to the class of Weibel's loop 0 ↣ P ↞ 0; under ΩBQP(A) ≃ K₀(A) × BGL(A)⁺ (GeneralAlgebraicKTheory:K.2:plus/plus-equals-Q) it is the identification of the components. It is natural: for a ring homomorphism f : A → B, π₀K(f) (induced by the exact functor B ⊗_A −) corresponds to RingK0.map f (KTheoryLowDegrees:Z.1/ring-k0-map). For commutative A it is a ring isomorphism, the product on π₀K(A) from the biexact tensor pairing (GeneralAlgebraicKTheory:K.7, requested below) corresponding to the product of KTheoryLowDegrees:Z.3/finite-projective-monoidal. This is a map-level comparison: the two groups are identified by a specific isomorphism characterised on classes of projectives, not merely shown abstractly isomorphic.

**Hypotheses.**

- A an associative unital ring (commutative for the product statement); P(A) is essentially small, with a chosen zero object as basepoint.

**Construction or proof.**

- Z.1/ring-k0-exact identifies RingK0 A with the exact K₀ of P(A) (every conflation of projectives splits).
- K.1/pi1-BQ-equals-K0 identifies the exact K₀ of the small exact category P(A) with π₁(BQP(A), 0), the class [P] with the loop 0 ↣ P ↞ 0; the inverse is defined by the universal property of K₀, not by a cardinality argument.
- Naturality: B ⊗_A − is an exact functor P(A) → P(B) (KTheoryLowDegrees:Z.1/extend-scalars-projective-functor); BQ is functorial in exact functors (GeneralAlgebraicKTheory:K.1/K-groups-of-exact-categories) and the loop of P goes to the loop of B ⊗_A P, while on RingK0 the map is Z.1/ring-k0-map; both are determined by classes, so the square commutes (ExactK0.hom_ext).
- Components: K.2:plus/plus-equals-Q gives ΩBQP(A) ≃ K₀(A) × BGL(A)⁺ with π₀ the group of step 2.
- Products: The request to GeneralAlgebraicKTheory:K.7 specifies that its K₀ product is the classical one, [P][Q] = [P ⊗ Q].

**Acceptance.**

- π₀K(ℤ) ≅ ℤ, [ℤⁿ] ↦ n.
- π₀K(F × F) ≅ ℤ², [F × 0] ↦ (1, 0).
- π₀K(ℤ[√−5]) ≅ ℤ ⊕ ℤ/2, [I] − [A] ↦ (0, 1) (KTheoryLowDegrees:Z.6/nonprincipal-ideal-test).

**Prerequisites.**

- KTheoryLowDegrees:Z.1/ring-k0
- KTheoryLowDegrees:Z.1/ring-k0-exact
- KTheoryLowDegrees:Z.1/ring-k0-map
- KTheoryLowDegrees:Z.1/extend-scalars-projective-functor
- KTheoryLowDegrees:Z.3/finite-projective-monoidal
- GeneralAlgebraicKTheory:K.1/pi1-BQ-equals-K0
- GeneralAlgebraicKTheory:K.1/K-groups-of-exact-categories
- GeneralAlgebraicKTheory:K.2:plus/plus-equals-Q
- GeneralAlgebraicKTheory:K.7
- tauceti:TauCeti.ExactK0.hom_ext
- tauceti:TauCeti.finiteProjectiveModulesExactStructure

**Sources.**

- Kbook.2013, IV.6, Proposition 6.2, PDF p. 327 (book p. 319). The class-level identification used.
- Kbook.2013, IV.7, Corollary 7.2, PDF p. 336 (book p. 328). The components of the K-theory space are K₀(R).

### K₀ of vector bundles is π₀ of scheme K-theory

**KTheoryLowDegrees:Z.6/vector-bundle-k-zero-pi-zero** · comparison · implementation unchecked.

Let X be a quasi-compact quasi-separated scheme with the resolution property (for example an affine scheme, a scheme with an ample family of line bundles, or any regular noetherian scheme of dimension ≤ 1 by KTheoryLowDegrees:Z.5/regular-curve-resolution-property). Then the isomorphism K₀(Vect X) ≅ K₀(X) = π₀K(X) of SchemeKTheoryOperations:S.2/vector-bundle-k-theory-comparison sends [E] to [E[0]], and it is the map induced on K₀ by the exact functor E ↦ E[0] into perfect complexes; K₀(X) is identified with TriangulatedK0 (D_perf(O_X)) by SchemeKTheoryOperations:S.2/k-zero-of-a-scheme. It is natural: for f : X′ → X with both schemes as above, π₀ of SchemeKTheoryOperations:S.2/k-theory-pullback ([Lf*E]) corresponds to KTheoryLowDegrees:Z.5/vector-bundle-k-zero-pullback ([f*E]), because Lf*E = f*E for E locally free. It is a ring isomorphism for the tensor products (SchemeKTheoryOperations:S.2/tensor-product-pairings, KTheoryLowDegrees:Z.5/vector-bundle-k-zero-ring). For X = Spec A the square formed with RingK0 A ≅ K₀(Vect Spec A) (KTheoryLowDegrees:Z.5/vector-bundle-affine-comparison), SchemeKTheoryOperations:S.2/affine-k-theory-comparison and KTheoryLowDegrees:Z.6/ring-k-zero-pi-zero commutes. Without the resolution property the map can fail to be an isomorphism (the plane with doubled origin).

**Hypotheses.**

- X quasi-compact quasi-separated with the resolution property; this is a hypothesis to be proved in each application, never assumed by definition.

**Construction or proof.**

- The degree-zero statement of SchemeKTheoryOperations:S.2/vector-bundle-k-theory-comparison (Stacks 0FDJ) is an isomorphism whose value on [E] is [E[0]]; its inverse sends a perfect complex represented by a bounded complex E• of vector bundles to Σ(−1)ⁱ[Eⁱ] (Stacks 0FDJ, proof).
- Pullback: for E locally free, E is flat, so Lf*E ≅ f*E (SchemeKTheoryOperations:S.2/k-theory-pullback evaluates on K₀ as [Lf*E]); both sides are determined by classes (ExactK0.hom_ext).
- Products: E ⊗^L F ≅ E ⊗ F for locally free E, so the pairing of SchemeKTheoryOperations:S.2/tensor-product-pairings restricts to [E][F] = [E ⊗ F].
- Affine square: [P] ↦ [P~] ↦ [P~[0]] and [P] ↦ [P] ↦ [P~[0]] agree on generators.

**Acceptance.**

- For X = Spec F: K₀(Vect X) ≅ K₀(X) ≅ ℤ.
- For P¹_F: [O(−1)] ↦ [O(−1)[0]], and [O] − [O(−1)] ↦ the class of the skyscraper at ∞ as a perfect complex.

**Prerequisites.**

- KTheoryLowDegrees:Z.5/vector-bundle-k-zero
- KTheoryLowDegrees:Z.5/vector-bundle-k-zero-pullback
- KTheoryLowDegrees:Z.5/vector-bundle-k-zero-ring
- KTheoryLowDegrees:Z.5/vector-bundle-affine-comparison
- KTheoryLowDegrees:Z.5/regular-curve-resolution-property
- KTheoryLowDegrees:Z.6/ring-k-zero-pi-zero
- SchemeKTheoryOperations:S.2/vector-bundle-k-theory-comparison
- SchemeKTheoryOperations:S.2/k-zero-of-a-scheme
- SchemeKTheoryOperations:S.2/k-theory-pullback
- SchemeKTheoryOperations:S.2/tensor-product-pairings
- SchemeKTheoryOperations:S.2/affine-k-theory-comparison
- SchemeKTheoryOperations:S.1/doubled-plane-counterexample
- tauceti:TauCeti.ExactK0.hom_ext
- tauceti:TauCeti.TriangulatedK0

**Sources.**

- Stacks, Derived Categories of Schemes, Lemma 38.5 (tag 0FDJ). The comparison in degree zero.
- Kbook.2013, II.8, Example 8.2.4, PDF p. 155 (book p. 147). Why the resolution property is a hypothesis: the example is affine n-space with doubled origin, n ≥ 2.

### The class of a perfect complex is its Euler class

**KTheoryLowDegrees:Z.6/perfect-complex-euler-class** · comparison · implementation unchecked.

(1) Let A be a ring and P• a bounded complex of finitely generated projective A-modules (a strictly perfect complex). Under π₀K(A) ≅ K₀(D_perf(A)) (SchemeKTheoryOperations:S.2/k-zero-of-a-scheme with SchemeKTheoryOperations:S.2/affine-k-theory-comparison) and KTheoryLowDegrees:Z.6/ring-k-zero-pi-zero, the class [P•] is the Euler class χ(P•) = Σ_i (−1)ⁱ [Pⁱ] ∈ RingK0 A; in particular [P•[1]] = −[P•] (TriangulatedK0.of_shift_one) and quasi-isomorphic complexes have the same Euler class. (2) If an A-module M admits a finite resolution by finitely generated projective modules, the class of M[0] is Tau Ceti's moduleEulerClassOf M, the alternating class of any such resolution, independent of the resolution. (3) For a quasi-compact quasi-separated scheme X with the resolution property, a perfect complex E represented by a bounded complex of vector bundles E• (SchemeKTheoryOperations:S.1/vector-bundle-comparison) has class Σ(−1)ⁱ [Eⁱ] ∈ K₀(Vect X) under KTheoryLowDegrees:Z.6/vector-bundle-k-zero-pi-zero. (4) For a multiplicative set S ⊆ A of central elements, the degree-zero map K₀(A on S) → K₀(A) of the support sequence (GeneralAlgebraicKTheory K.5) sends a perfect complex P• with S⁻¹P• exact to χ(P•).

**Hypotheses.**

- A arbitrary for (1), (2) and (4); X qcqs with the resolution property for (3). The affine-scheme notation Spec A and the S.2 affine comparison are used only when A is commutative; for a general ring use the perfect-module K comparison of K.4:construction.

**Construction or proof.**

- (1): the stupid-truncation cofibration sequences σ_{≥n}P• → σ_{≥n−1}P• → P^{n−1}[1−n] give [P•] = Σ(−1)ⁱ[Pⁱ[0]] (SchemeKTheoryOperations:S.2/k-zero-of-a-scheme), and [Pⁱ[0]] corresponds to [Pⁱ] (SchemeKTheoryOperations:S.2/affine-k-theory-comparison, KTheoryLowDegrees:Z.6/ring-k-zero-pi-zero). For a noncommutative A the same argument takes place in D_perf(A), using K.4:construction rather than Spec A.
- (2): a finite projective resolution Q• → M is a quasi-isomorphism, so [M[0]] = [Q•] = χ(Q•), which is the telescoped alternating class TauCeti.moduleEulerClassOf M (its independence of the resolution is TauCeti.ExactStructure.eulerClassOf_eq).
- (3): SchemeKTheoryOperations:S.1/vector-bundle-comparison represents E by E•, and the argument of (1) in Perf(X) gives [E] = Σ(−1)ⁱ[Eⁱ[0]], which is the inverse of the vector-bundle comparison (KTheoryLowDegrees:Z.6/vector-bundle-k-zero-pi-zero).
- (4): the map K₀(A on S) → K₀(A) is induced by the inclusion Ch^b_S P(A) ⊂ Ch^b P(A) (SchemeKTheoryOperations:S.3/affine-support-comparison), and K₀ Ch^b P(A) ≅ K₀(A) is χ by (1).

**Acceptance.**

- On Spec ℤ, the complex ℤ --n--> ℤ has Euler class 0 for every n; it resolves ℤ/n in degree zero when n≠0.
- For A = ℤ[√−5] and I = (2, 1 + √−5), the complex I → A resolving A/I has Euler class [A] − [I] ≠ 0 (KTheoryLowDegrees:Z.6/nonprincipal-ideal-test).

**Prerequisites.**

- KTheoryLowDegrees:Z.6/ring-k-zero-pi-zero
- KTheoryLowDegrees:Z.6/vector-bundle-k-zero-pi-zero
- SchemeKTheoryOperations:S.2/k-zero-of-a-scheme
- SchemeKTheoryOperations:S.2/affine-k-theory-comparison
- SchemeKTheoryOperations:S.1/vector-bundle-comparison
- tauceti:TauCeti.moduleEulerClassOf
- tauceti:TauCeti.ExactStructure.eulerClassOf_eq
- tauceti:TauCeti.TriangulatedK0.of_shift_one
- tauceti:TauCeti.AbelianK0.eulerChar
- GeneralAlgebraicKTheory:K.4:construction
- SchemeKTheoryOperations:S.3/affine-support-comparison
- SchemeKTheoryOperations:S.3/localisation-fibre-sequence

**Sources.**

- Kbook.2013, II.9, Theorem 9.2.2, PDF p. 170 (book p. 162). The Euler-class identity for bounded complexes (the source also gives the exact-category version for P(R)).
- Kbook.2013, II.9, Example 9.7.5, PDF p. 177 (book p. 169). Perfect complexes compute the same K₀.

### Localisation on K₀

**KTheoryLowDegrees:Z.6/localisation-projective-class** · comparison · implementation unchecked.

(1) Let A be a commutative ring and S ⊆ A a multiplicative set. Under KTheoryLowDegrees:Z.6/ring-k-zero-pi-zero, the degree-zero map π₀K(A) → π₀K(S⁻¹A) of the localisation (support) sequence K(A on S) → K(A) → K(S⁻¹A) (GeneralAlgebraicKTheory K.5; SchemeKTheoryOperations:S.3/affine-support-comparison) is RingK0.map (algebraMap A (S⁻¹A)), sending [P] to [S⁻¹P] (S⁻¹A ⊗_A P ≅ S⁻¹P, Mathlib's IsLocalizedModule), and K₀(A on S) → K₀(A) → K₀(S⁻¹A) is exact, the first map being the Euler class (KTheoryLowDegrees:Z.6/perfect-complex-euler-class). (2) For an open immersion j : U → X of quasi-compact quasi-separated schemes with the resolution property, π₀(j*) (SchemeKTheoryOperations:S.2/k-theory-pullback, the restriction map of SchemeKTheoryOperations:S.3/localisation-fibre-sequence) corresponds to [E] ↦ [E|U] on K₀ of vector bundles (KTheoryLowDegrees:Z.5/vector-bundle-k-zero-pullback). (3) For a Dedekind domain A and S = A ∖ ⋃_{𝔭∈T} 𝔭 the map is (n, c) ↦ (n, ext c) in rank–Pic coordinates (KTheoryLowDegrees:Z.4/k0-localization).

**Hypotheses.**

- A commutative, S multiplicative (so S⁻¹A is commutative and the support sequence of K.5 applies); X, U as stated for (2).

**Construction or proof.**

- (1): the functor S⁻¹A ⊗_A − : P(A) → P(S⁻¹A) is the scalar extension of KTheoryLowDegrees:Z.1/ring-k0-map, so by the naturality of KTheoryLowDegrees:Z.6/ring-k-zero-pi-zero π₀ of the localisation map is RingK0.map; S⁻¹A ⊗_A P ≅ S⁻¹P because the localisation of a module is its base change (IsLocalizedModule).
- Exactness in degree zero is the end of the support-localisation fibre sequence of SchemeKTheoryOperations:S.3/localisation-fibre-sequence (Weibel V.2.6.3, and II.9.8 in degree zero), identified with the affine support sequence by SchemeKTheoryOperations:S.3/affine-support-comparison; the first map is χ by KTheoryLowDegrees:Z.6/perfect-complex-euler-class (4).
- (2): π₀(j*)[E[0]] = [j*E[0]] = [E|U [0]] (SchemeKTheoryOperations:S.2/k-theory-pullback), which corresponds to KTheoryLowDegrees:Z.5/vector-bundle-k-zero-pullback under KTheoryLowDegrees:Z.6/vector-bundle-k-zero-pi-zero.
- (3) is KTheoryLowDegrees:Z.4/k0-localization.

**Acceptance.**

- ℤ → ℚ: K₀(ℤ) → K₀(ℚ) is the identity of ℤ; K₀(ℤ on ℤ ∖ 0) → K₀(ℤ) is zero.
- For A = ℤ[√−5] and a prime 𝔮, [I] − [A] ↦ 0 in K₀(A_𝔮), although [I] − [A] ≠ 0 (KTheoryLowDegrees:Z.6/nonprincipal-ideal-test).

**Prerequisites.**

- KTheoryLowDegrees:Z.6/ring-k-zero-pi-zero
- KTheoryLowDegrees:Z.6/perfect-complex-euler-class
- KTheoryLowDegrees:Z.6/vector-bundle-k-zero-pi-zero
- KTheoryLowDegrees:Z.5/vector-bundle-k-zero-pullback
- KTheoryLowDegrees:Z.1/ring-k0-map
- KTheoryLowDegrees:Z.4/k0-localization
- SchemeKTheoryOperations:S.3/affine-support-comparison
- SchemeKTheoryOperations:S.3/localisation-fibre-sequence
- SchemeKTheoryOperations:S.2/k-theory-pullback
- mathlib:IsLocalizedModule
- mathlib:LocalizedModule
- mathlib:IsLocalization

**Sources.**

- Kbook.2013, II.9, Theorem 9.8, PDF p. 178 (book p. 170). The degree-zero localisation sequence, with K₀(R on S) the K₀ of bounded projective complexes that become exact over S⁻¹R.

### There is one Cartan map

**KTheoryLowDegrees:Z.6/cartan-map-comparison** · comparison · implementation unchecked.

(1) For a noetherian scheme X with the resolution property, the vector-bundle Cartan map c_X : K₀(Vect X) → G₀(X) = AbelianK0 (Coh X) (ExactK0.map of Vect(X) ⊂ Coh(X), as in KTheoryLowDegrees:Z.5/regular-curve-cartan-iso) equals π₀ of SchemeKTheoryOperations:S.2/cartan-map precomposed with K₀(Vect X) ≅ π₀K(X) (KTheoryLowDegrees:Z.6/vector-bundle-k-zero-pi-zero): both send [E] to [E]. (2) For X = Spec R with R noetherian, under RingK0 R ≅ K₀(Vect Spec R) and G₀(Spec R) ≅ ExactK0 (finiteModulesExactStructure R) (SchemeKTheoryOperations:S.2/affine-k-theory-comparison), c_X is Tau Ceti's TauCeti.cartanMap R; for R regular it is TauCeti.cartanEquiv R, whose inverse is the alternating projective-resolution class. So the degree-zero Cartan maps of this layer, of SchemeKTheoryOperations S.2 and of GrothendieckEulerForms layer 4 are one map; no second Cartan map is defined. (3) For R = k[ε]/(ε²) the Cartan map is multiplication by 2 on ℤ, not an isomorphism.

**Hypotheses.**

- X noetherian with the resolution property for (1); R noetherian for (2).

**Construction or proof.**

- (1): SchemeKTheoryOperations:S.2/cartan-map sends [E[0]] to [E] for a vector bundle E (its API item cartan_class_vectorBundle); c_X sends [E] to [E] (ExactK0.map_of); compose with KTheoryLowDegrees:Z.6/vector-bundle-k-zero-pi-zero and use ExactK0.hom_ext.
- (2): for P finitely generated projective, cartanMap R [P] = [P] (TauCeti.cartanMap_of) and c_X[P~] = [P~]; the identifications preserve classes (KTheoryLowDegrees:Z.5/vector-bundle-affine-comparison, SchemeKTheoryOperations:S.2/affine-k-theory-comparison), so the maps agree; the regular case is SchemeKTheoryOperations:S.2/cartan-degree-zero-compatibility, giving cartanEquiv.
- (3) is SchemeKTheoryOperations:S.2/cartan-singular-non-example.

**Acceptance.**

- For R = ℤ both groups are ℤ and the map is the identity.
- For a regular curve X, c_X is the isomorphism of KTheoryLowDegrees:Z.5/regular-curve-cartan-iso.

**Prerequisites.**

- KTheoryLowDegrees:Z.5/regular-curve-cartan-iso
- KTheoryLowDegrees:Z.5/vector-bundle-affine-comparison
- KTheoryLowDegrees:Z.6/vector-bundle-k-zero-pi-zero
- SchemeKTheoryOperations:S.2/cartan-map
- SchemeKTheoryOperations:S.2/cartan-degree-zero-compatibility
- SchemeKTheoryOperations:S.2/affine-k-theory-comparison
- SchemeKTheoryOperations:S.2/cartan-singular-non-example
- tauceti:TauCeti.cartanMap
- tauceti:TauCeti.cartanMap_of
- tauceti:TauCeti.cartanEquiv
- tauceti:TauCeti.finiteModulesExactStructure
- tauceti:TauCeti.ExactK0.map_of
- tauceti:TauCeti.ExactK0.hom_ext

**Sources.**

- Kbook.2013, II.7, Example 7.1.3, PDF p. 138 (book p. 130). The Cartan map on vector bundles, compared here with the existing categorical and spectral ones.

### Test: fields

**KTheoryLowDegrees:Z.6/field-test** · application · implementation unchecked.

Let F be a field. All degree-zero models agree and are ℤ by dimension: RingK0 F ≃+ ℤ, [V] ↦ dim_F V (KTheoryLowDegrees:Z.2/division-ring-k0); K₀(Vect Spec F) ≅ RingK0 F (KTheoryLowDegrees:Z.5/vector-bundle-affine-comparison); π₀K(F) ≅ ℤ (KTheoryLowDegrees:Z.6/ring-k-zero-pi-zero); K₀(Spec F) = K₀(D_perf(F)) ≅ ℤ with [C•] ↦ Σ(−1)ⁱ dim Hⁱ(C•) (KTheoryLowDegrees:Z.6/perfect-complex-euler-class); G₀(F) ≅ ℤ and the Cartan map is the identity (KTheoryLowDegrees:Z.6/cartan-map-comparison; Tau Ceti's cartanEquivOfIsSemisimpleRing). Rank and determinant: Pic(F) is trivial, so (rank, det) is the dimension, the dimension-zero case of KTheoryLowDegrees:Z.5/curve-rank-determinant-equivalence. For a field extension F → E, the map K₀(F) → K₀(E) is the identity of ℤ (naturality of KTheoryLowDegrees:Z.6/ring-k-zero-pi-zero for the scalar extension).

**Hypotheses.**

- F a field (for the ring statements a division ring suffices).

**Construction or proof.**

- Combine the cited identifications; each sends the class of F (or O_{Spec F}, or F[0]) to 1, and each is additive, so they agree (ℤ is generated by 1).
- E ⊗_F F^n ≅ E^n gives the identity map on ℤ.

**Acceptance.**

- [F³] ↦ 3; the complex F --0--> F has Euler class 0 and cohomology F ⊕ F[−1].
- Non-example: the dimension is over F itself: for F = ℂ, [ℂ] ↦ 1, not dim_ℝ ℂ = 2.

**Prerequisites.**

- KTheoryLowDegrees:Z.2/division-ring-k0
- KTheoryLowDegrees:Z.5/vector-bundle-affine-comparison
- KTheoryLowDegrees:Z.5/curve-rank-determinant-equivalence
- KTheoryLowDegrees:Z.6/ring-k-zero-pi-zero
- KTheoryLowDegrees:Z.6/perfect-complex-euler-class
- KTheoryLowDegrees:Z.6/cartan-map-comparison
- tauceti:TauCeti.cartanEquivOfIsSemisimpleRing
- tauceti:TauCeti.SplitK0.finrankEquiv
- KTheoryLowDegrees:Z.1/ring-k0-map

**Sources.**

- Kbook.2013, II.2, before Lemma 2.1, PDF p. 76 (book p. 68). The K-book's computation for fields, which every model here reproduces.

### Test: the integers

**KTheoryLowDegrees:Z.6/integers-test** · application · implementation unchecked.

For A = ℤ: RingK0 ℤ ≃+ ℤ, [ℤⁿ] ↦ n (KTheoryLowDegrees:Z.2/pid-k0), and Pic(ℤ) is trivial, so the rank–Pic equivalence of KTheoryLowDegrees:Z.4/rank-pic-equivalence is ℤ ⊕ 1 = ℤ. On the scheme side Spec ℤ satisfies the regular-curve package and KTheoryLowDegrees:Z.5/curve-rank-determinant-equivalence gives K₀(Vect Spec ℤ) ≅ ℤ ⊕ Pic(Spec ℤ) = ℤ; every skyscraper class vanishes: c⁻¹[ℤ/p] = [ℤ] − [pℤ] = 0 (KTheoryLowDegrees:Z.5/skyscraper-class), consistent with the Euler class of the perfect complex ℤ --p--> ℤ being 0 (KTheoryLowDegrees:Z.6/perfect-complex-euler-class). G₀(ℤ) ≅ ℤ and the Cartan map is the identity, equal to Tau Ceti's cartanEquiv ℤ (KTheoryLowDegrees:Z.6/cartan-map-comparison). Localisation K₀(ℤ) → K₀(ℚ) is the identity of ℤ, with K₀(ℤ on ℤ ∖ 0) → K₀(ℤ) the zero map (KTheoryLowDegrees:Z.6/localisation-projective-class). π₀K(ℤ) ≅ ℤ (KTheoryLowDegrees:Z.6/ring-k-zero-pi-zero); the higher groups K_n(ℤ), n ≥ 1, are not computed here.

**Hypotheses.**

- A = ℤ, a principal ideal domain.

**Construction or proof.**

- Z.2/pid-k0 gives K₀(ℤ) ≅ ℤ; a PID has trivial class group, hence trivial Picard group (Mathlib's ClassGroup.equivPic).
- pℤ ≅ ℤ, so [ℤ] − [pℤ] = 0; the Euler class of ℤ --p--> ℤ is [ℤ] − [ℤ] = 0.
- The remaining identifications are the cited comparison nodes.

**Acceptance.**

- [ℤ/6] = 0 in G₀(ℤ), and every finite abelian group has class 0.
- A rank-only implementation is correct here: ℤ is the case where rank alone detects K₀.

**Prerequisites.**

- KTheoryLowDegrees:Z.2/pid-k0
- KTheoryLowDegrees:Z.4/rank-pic-equivalence
- KTheoryLowDegrees:Z.5/curve-rank-determinant-equivalence
- KTheoryLowDegrees:Z.5/skyscraper-class
- KTheoryLowDegrees:Z.6/perfect-complex-euler-class
- KTheoryLowDegrees:Z.6/cartan-map-comparison
- KTheoryLowDegrees:Z.6/localisation-projective-class
- KTheoryLowDegrees:Z.6/ring-k-zero-pi-zero
- mathlib:ClassGroup.equivPic

**Sources.**

- Kbook.2013, II.2, before Lemma 2.1, PDF p. 76 (book p. 68). The PID case.

### Test: a product of two fields

**KTheoryLowDegrees:Z.6/field-product-test** · application · implementation unchecked.

Let F be a field and A = F × F. Spec A = Spec F ⊔ Spec F is regular of dimension 0 but not connected. RingK0 A ≃+ LocallyConstant (Spec A) ℤ ≅ ℤ² by the rank, [F × 0] ↦ (1, 0), [0 × F] ↦ (0, 1), [A] ↦ (1, 1) (KTheoryLowDegrees:Z.2/k0-field-product); the same holds for K₀(Vect Spec A) with the vector-bundle rank (KTheoryLowDegrees:Z.5/vector-bundle-rank), and π₀K(A) ≅ π₀K(F) ⊕ π₀K(F) (KTheoryLowDegrees:Z.6/ring-k-zero-pi-zero with the product formula of GeneralAlgebraicKTheory:K.1/K-groups-of-exact-categories). Pic(A) is trivial, so K₀ = H⁰(Spec A; ℤ) ⊕ Pic(A) = ℤ² with a non-constant rank, while the connected form ℤ ⊕ Pic of KTheoryLowDegrees:Z.5/curve-rank-determinant-equivalence does not apply. Localisation at e = (1, 0) (A[e⁻¹] = F) is (a, b) ↦ a, killing the projective class [0 × F] (KTheoryLowDegrees:Z.6/localisation-projective-class).

**Hypotheses.**

- F a field; A = F × F.

**Construction or proof.**

- Z.2/k0-field-product and the affine comparison give the first two statements; the rank on Spec A takes the value 1 at one point and 0 at the other on [F × 0].
- Pic(A) is trivial because A has finitely many maximal ideals (Mathlib's Subsingleton (Pic R) instance for a finite maximal spectrum).
- A[e⁻¹] ≅ F via the first projection, and F ⊗_A (0 × F) = 0.

**Acceptance.**

- [F × 0] + [0 × F] = [A].
- Non-example: an integer rank [P] ↦ finrank_A P is 0 on F × 0 (no nonzero A-linearly independent element), so it is not the rank.

**Prerequisites.**

- KTheoryLowDegrees:Z.2/k0-field-product
- KTheoryLowDegrees:Z.2/k0-pi
- KTheoryLowDegrees:Z.5/vector-bundle-rank
- KTheoryLowDegrees:Z.5/vector-bundle-affine-comparison
- KTheoryLowDegrees:Z.5/curve-rank-determinant-equivalence
- KTheoryLowDegrees:Z.6/ring-k-zero-pi-zero
- KTheoryLowDegrees:Z.6/localisation-projective-class
- GeneralAlgebraicKTheory:K.1/K-groups-of-exact-categories
- mathlib:CommRing.Pic

**Sources.**

- Kbook.2013, II.2, after Example 2.1.3, PDF p. 77 (book p. 69). The product formula for K₀.

### Test: a nonprincipal ideal

**KTheoryLowDegrees:Z.6/nonprincipal-ideal-test** · application · implementation unchecked.

Let A = ℤ[√−5] (Mathlib's Zsqrtd (−5), the ring of integers of ℚ(√−5)) and I = (2, 1 + √−5). (a) The class x := [I] − [A] ∈ K₀(A) has rank 0 and determinant [I] ≠ 1 in Pic(A), so x ≠ 0, and 2x = 0 because I² = (2) ≅ A (KTheoryLowDegrees:Z.4/nonprincipal-ideal-class); since Cl(A) has order 2 (Tau Ceti's classNumber_adjoinRoot_sqrt_neg_five_eq_two), K₀(A) ≅ ℤ ⊕ ℤ/2 with x ↦ (0, 1). A rank-only implementation sends x to 0 and fails. (b) On X = Spec A, I is the maximal ideal 𝔭 of the closed point with A/𝔭 = 𝔽₂ and the skyscraper class is c⁻¹[O_𝔭] = [A] − [I] = −x ↦ (0, [I]⁻¹) = (0, [I]) ≠ 0 (KTheoryLowDegrees:Z.5/skyscraper-class, KTheoryLowDegrees:Z.5/dedekind-curve-comparison). (c) The perfect complex I → A resolving A/I has Euler class [A] − [I] = −x ≠ 0 (KTheoryLowDegrees:Z.6/perfect-complex-euler-class); it becomes exact over K = ℚ(√−5), so −x lies in the image of K₀(A on A ∖ 0) and in the kernel of K₀(A) → K₀(K) (KTheoryLowDegrees:Z.6/localisation-projective-class). (d) For every prime 𝔮, x ↦ 0 in K₀(A_𝔮) ≅ ℤ since I_𝔮 is free: x is invisible to every localisation at a prime, but nonzero. (e) In G₀(A), [A/I] = c(−x) ≠ 0 (KTheoryLowDegrees:Z.6/cartan-map-comparison).

**Hypotheses.**

- A = ℤ[√−5], a Dedekind domain; I = (2, 1 + √−5).

**Construction or proof.**

- (a) is KTheoryLowDegrees:Z.4/nonprincipal-ideal-class (module-level facts from KTheoryLowDegrees:Z.2/nonfree-projective-ideal: I is projective of rank one and not free), with the order-two class group from the class-number computation.
- (b): A/I ≅ 𝔽₂ (2 and 1 + √−5 map to 0, so √−5 ↦ 1), so I is maximal; apply the skyscraper formula on Spec A.
- (c), (d): 0 → I → A → A/I → 0 is a finite projective resolution. At the generic point its quotient vanishes and the inclusion becomes an isomorphism. At any prime 𝔮, I_𝔮 is free of rank one, so [I_𝔮]−[A_𝔮]=0; at 𝔮=I the nonzero torsion quotient prevents splitting of the localised sequence. No local splitting is needed for (d).
- (e): the Cartan map is an isomorphism for the regular ring A.

**Acceptance.**

- 2x = 0 and x ≠ 0.
- The skyscraper at the closed point (3, 1 + √−5) also has nonzero class, while the skyscraper at the principal prime (√−5) has class 0.

**Prerequisites.**

- KTheoryLowDegrees:Z.4/nonprincipal-ideal-class
- KTheoryLowDegrees:Z.2/nonfree-projective-ideal
- KTheoryLowDegrees:Z.5/skyscraper-class
- KTheoryLowDegrees:Z.5/dedekind-curve-comparison
- KTheoryLowDegrees:Z.6/perfect-complex-euler-class
- KTheoryLowDegrees:Z.6/localisation-projective-class
- KTheoryLowDegrees:Z.6/cartan-map-comparison
- tauceti:TauCeti.NumberField.classNumber_adjoinRoot_sqrt_neg_five_eq_two
- mathlib:Zsqrtd
- mathlib:NumberField.RingOfIntegers

**Sources.**

- Milne.ANT.2020, Introduction, printed p. 10 (PDF p. 12). The relation giving 2x = 0 (checked on the rendered page; the text layer garbles the radicals).
- Kbook.2013, II.9, Theorem 9.8, PDF p. 178 (book p. 170). The localisation sequence in which the Euler class of I → A lies.

### The projective line as a regular curve

**KTheoryLowDegrees:Z.6/projective-line-regular-curve** · lemma · implementation unchecked.

Let F be a field and P¹_F := P(O^{⊕2}) = Proj F[T₀, T₁] over Spec F (SchemeKTheoryOperations S.5's convention, from AlgebraicModuliForArithmeticGeometry R09.1), with O(m), m ∈ ℤ, and the rational points 0 = V(T₁), ∞ = V(T₀). Then P¹_F is noetherian, integral, separated and regular of dimension 1 (the charts D₊(T₀), D₊(T₁) are Spec F[t] and Spec F[t⁻¹], glued along Spec F[t, t⁻¹]), so it satisfies the regular-curve package. m ↦ O(m) is an isomorphism ℤ ≅ Pic(P¹_F); O(m) ≅ O(m·[∞]) (Tau Ceti's SchemeWeilDivisor.sheaf), and for a closed point y with residue degree d = [k(y) : F], O(y) ≅ O(d). The degree deg : Pic(P¹_F) ≅ ℤ, deg O(m) = m, is the relative degree of divisors over Spec F (Tau Ceti's relativeDegree).

**Hypotheses.**

- F a field.

**Construction or proof.**

- The two basic opens are the spectra of the degree-zero parts of F[T₀, T₁] localised at T₀ and T₁ (Mathlib's Proj.basicOpenIsoSpec), i.e. polynomial rings in one variable, which are PIDs of dimension one; the cover is finite, so P¹_F is noetherian, and the charts share the generic point, so it is integral; the local rings at closed points are localisations of PIDs at maximal ideals, hence DVRs.
- Pic(P¹_R) ≅ ℤ via O(m) for a UFD R (Stacks 0BXJ), here R = F: a line bundle is trivial on both charts (Pic of a PID is trivial) and is given by a unit of F[t, t⁻¹], i.e. c·tᵐ, and c is a coboundary.
- The section T₀ of O(1) vanishes exactly at ∞ to order one, so O(1) ≅ O([∞]) and O(m) ≅ O(m[∞]); a closed point y ≠ ∞ is V(p) for a monic irreducible p ∈ F[t] of degree d, and div p = y − d·∞, so O(y) ≅ O(d).

**Acceptance.**

- Pic(P¹_F) ≅ ℤ with O(−1) ↦ −1.
- A closed point with residue field F(i) for F = ℝ has degree 2 and O(y) ≅ O(2).

**Prerequisites.**

- KTheoryLowDegrees:Z.5/regular-curve-integral
- KTheoryLowDegrees:Z.5/line-bundle-divisorial
- SchemeKTheoryOperations:S.5/projective-bundle-cohomology
- AlgebraicModuliForArithmeticGeometry:R09.1
- mathlib:AlgebraicGeometry.Proj.basicOpenIsoSpec
- mathlib:AlgebraicGeometry.Proj.affineOpenCover
- tauceti:TauCeti.AlgebraicGeometry.SchemeWeilDivisor.relativeDegree
- tauceti:TauCeti.AlgebraicGeometry.SchemeWeilDivisor.relativeDegree_ofPoint
- tauceti:TauCeti.AlgebraicGeometry.SchemeWeilDivisor.sheaf

**Sources.**

- Stacks, Divisors, Lemma 29.5 (tag 0BXJ). Pic(P¹_F) ≅ ℤ.
- Kbook.2013, I.5, Example 5.15.1, PDF p. 66 (book p. 58). The same, with the class-group description.

### K₀ of the projective line by rank and Pic

**KTheoryLowDegrees:Z.6/projective-line-rank-pic** · application · implementation unchecked.

For a field F, KTheoryLowDegrees:Z.5/curve-rank-determinant-equivalence and KTheoryLowDegrees:Z.6/projective-line-regular-curve give K₀(Vect P¹_F) ≅ ℤ ⊕ Pic(P¹_F) ≅ ℤ², x ↦ (r, d) := (rank x, deg det x), with inverse (r, d) ↦ (r − 1)[O] + [O(d)]. Values: [O(m)] ↦ (1, m); the skyscraper at a closed point y, c⁻¹[O_y] ↦ (0, [k(y) : F]); at the rational point ∞, [O] − [O(−1)] ↦ (0, 1). The ring structure is (r, d)(r′, d′) = (rr′, rd′ + r′d) (KTheoryLowDegrees:Z.5/curve-k-zero-ring), so z := [O] − [O(−1)] satisfies z² = 0. The same group is K₀(P¹_F) of perfect complexes and G₀(P¹_F) (KTheoryLowDegrees:Z.5/regular-curve-cartan-iso), and F²_γ = SK₀ = 0.

**Hypotheses.**

- F a field.

**Construction or proof.**

- Apply the curve equivalence with Pic(P¹_F) ≅ ℤ by degree.
- Values: rank O(m) = 1, det O(m) = O(m); the skyscraper formula gives (0, O(y)) and O(y) ≅ O(deg y).
- The product formula in coordinates: (1, L)(1, M) = (1, L ⊗ M) and (0, L)(0, M) = (0, 1), transported through deg.
- For the last γ assertion, use Z.5/exterior-power-extension-filtration to descend λ_t[E]=Σ[Λ^iE]t^i to the exact vector-bundle K₀ of this curve. This only needs the pre-λ identities, not the generic scheme specialness theorem. Put L=[O(1)]=1+z, where z²=0. Every class is r·1+d·z; additivity and λ_t(L)=1+Lt give λ_t(d·z)=((1+Lt)/(1+t))^d=1+d·z·t/(1+t) for every integer d. Substituting t/(1−t) as in Z.3/gamma gives γ_t(d·z)=1+d·z·t. The rank kernel is ℤz, so every weight≥2 generator is zero: its factors either contain γ^k(dz)=0 for k≥2 or a product of two multiples of z. Thus F²_γ=0, and injective rank–determinant gives SK₀=0. This calculation imports no S.6/S.7 theorem.

**Acceptance.**

- [O(2)] = 3[O] − 2[O(−1)] ↔ (1, 2).
- The Euler sequence gives [O(−2)] + [O] = 2[O(−1)] ↔ (1, −2) + (1, 0) = 2(1, −1).

**Prerequisites.**

- KTheoryLowDegrees:Z.5/curve-rank-determinant-equivalence
- KTheoryLowDegrees:Z.5/curve-k-zero-ring
- KTheoryLowDegrees:Z.5/regular-curve-cartan-iso
- KTheoryLowDegrees:Z.5/skyscraper-class
- KTheoryLowDegrees:Z.6/projective-line-regular-curve
- KTheoryLowDegrees:Z.5/exterior-power-extension-filtration
- KTheoryLowDegrees:Z.3/gamma
- KTheoryLowDegrees:Z.3/gamma-filtration

**Sources.**

- Kbook.2013, II.8, Corollary 8.6, PDF p. 157 (book p. 149). For r = 1: z² = 0 and z is the class of a rational point, as found here by rank and Pic.

### The two bases of K₀ of the projective line

**KTheoryLowDegrees:Z.6/projective-line-change-of-basis** · theorem · implementation unchecked.

Let F be a field. By SchemeKTheoryOperations:S.5/projective-line-k-theory, every x ∈ K₀(P¹_F) is uniquely x = a[O] + b[O(−1)] with a, b ∈ ℤ (projective-bundle coordinates); by KTheoryLowDegrees:Z.6/projective-line-rank-pic it is determined by (r, d) = (rank x, deg det x). The two coordinate systems are related by (r, d) = (a + b, −b) and (a, b) = (r + d, −d): the change-of-basis matrix [[1, 1], [0, −1]] is its own inverse and has determinant −1. Equivalently a = χ(x) = π_*(x) = r + d (Riemann–Roch on P¹) and r = σ*(x) for either standard section σ. The rank–Pic basis {[O], [O] − [O(−1)]} (rank one with trivial determinant; rank zero with determinant of degree one, the class of a rational point) is the second basis of S.5, and [O(m)] has projective-bundle coordinates (m + 1, −m). Both calculations give K₀(P¹_F) ≅ ℤ², related as stated.

**Hypotheses.**

- F a field; the projective-bundle theorem is imported from SchemeKTheoryOperations S.5 and not reproved.

**Construction or proof.**

- rank [O] = 1, rank [O(−1)] = 1; deg det [O] = 0, deg det [O(−1)] = −1; so (r, d)(a[O] + b[O(−1)]) = (a + b, −b) by additivity of rank and deg ∘ det.
- Solving gives b = −d and a = r + d; the matrix identity [[1, 1], [0, −1]]² = I is direct.
- Consistency with S.5 (c)–(d): π_*[O] = 1 and π_*[O(−1)] = 0 give π_*(x) = a = r + d; σ*[O(k)] = 1 gives σ*(x) = a + b = r; and S.5's [O(m)] ↦ (m + 1, −m) is the image of (1, m).
- The rational skyscraper [O_∞] = [O] − [O(−1)] (SchemeKTheoryOperations:S.5/projective-line-k-theory (d)) has (r, d) = (0, 1) (KTheoryLowDegrees:Z.5/skyscraper-class), so {[O], [O] − [O(−1)]} is the rank–Pic basis.

**Acceptance.**

- (r, d) = (2, 3) ↔ (a, b) = (5, −3): 5[O] − 3[O(−1)] has rank 2 and determinant O(3).
- (r, d) = (0, 1) ↔ (1, −1), the rational point; (1, −1) ↔ (0, 1), i.e. [O(−1)] itself.
- Non-example: over the real conic without real points no class of rank zero has determinant of degree one (KTheoryLowDegrees:Z.6/pointless-conic-test), so the second basis needs a rational point.

**Prerequisites.**

- SchemeKTheoryOperations:S.5/projective-line-k-theory
- KTheoryLowDegrees:Z.6/projective-line-rank-pic
- KTheoryLowDegrees:Z.6/projective-line-regular-curve
- KTheoryLowDegrees:Z.5/skyscraper-class
- KTheoryLowDegrees:Z.5/curve-rank-determinant-equivalence

**Sources.**

- Kbook.2013, II.8, Projective Bundle Theorem 8.5, PDF p. 157 (book p. 149). The projective-bundle basis, here for P¹ over Spec F.
- Kbook.2013, II.8, Proposition 8.2.1, PDF p. 154 (book p. 146). The rank–Pic description of the same group.

### Test: an elliptic curve

**KTheoryLowDegrees:Z.6/elliptic-test** · application · implementation unchecked.

Let E be an elliptic curve over a field F with rational origin O. E is a connected regular noetherian curve, so KTheoryLowDegrees:Z.5/curve-rank-determinant-equivalence gives K₀(E) ≅ ℤ ⊕ Pic(E); EllipticKTheory:E.2/K0-of-an-elliptic-curve refines it, using the origin, to ℤ² ⊕ E(F), x ↦ (r, d, P) with r = rank x, d = deg det x and det x ≅ O(P + (d − 1)O). The two descriptions agree: E.2's (d, P) is the image of Z.5's det under Pic(E) ≅ ℤ ⊕ E(F) (EllipticKTheory:E.2/picard-decomposition-and-the-point-group). For a rational point P, the skyscraper c⁻¹[O_P] = [O] − [O(−P)] ↦ (0, O(P)) ↦ (0, 1, P). Example: for y² = x³ − x over 𝔽₅, E(𝔽₅) ≅ ℤ/4 ⊕ ℤ/2 (8 points; (2, 1) has order 4) and K₀(E) ≅ ℤ² ⊕ ℤ/4 ⊕ ℤ/2; the class c⁻¹[O_P] − c⁻¹[O_O] for P = (0, 0) has rank 0 and degree 0 but is nonzero (↦ (0, 0, P)), so a rank-only or rank-and-degree implementation fails this test.

**Hypotheses.**

- E elliptic over F with its rational origin O; the origin-dependent formula is EllipticKTheory E.2's and is only imported here.

**Construction or proof.**

- The Z.5 equivalence applies because E is smooth, proper and geometrically connected of dimension 1, hence connected, regular and noetherian.
- Compatibility: E.2's coordinates are defined from rank and det (EllipticKTheory:E.2/K0-of-an-elliptic-curve), so they are the composite of the Z.5 equivalence with the Picard decomposition.
- Skyscraper: KTheoryLowDegrees:Z.5/skyscraper-class gives (0, O(P)); O(P) = O(P + (1 − 1)O) has degree 1 and point P.
- Example: counting x ∈ 𝔽₅ with x³ − x a square gives 7 affine points and O; the three 2-torsion points (0,0), (1,0), (4,0) are rational, and the tangent at (2, 1) has slope (3·4 − 1)/2 = 3, so x(2P) = 9 − 4 = 0 and 2(2, 1) = (0, 0); hence E(𝔽₅) ≅ ℤ/4 ⊕ ℤ/2.

**Acceptance.**

- (0, 1, O) is the class of the skyscraper at O and squares to 0 (EllipticKTheory:E.2/ring-structure-of-K0-of-a-curve).
- c⁻¹[O_P] − c⁻¹[O_O] ≠ 0 for P ≠ O rational.

**Prerequisites.**

- KTheoryLowDegrees:Z.5/curve-rank-determinant-equivalence
- KTheoryLowDegrees:Z.5/skyscraper-class
- EllipticKTheory:E.2/K0-of-an-elliptic-curve
- EllipticKTheory:E.2/picard-decomposition-and-the-point-group
- EllipticKTheory:E.2/ring-structure-of-K0-of-a-curve

**Sources.**

- Kbook.2013, II.8, Proposition 8.2.1, PDF p. 154 (book p. 146). The rank–Pic description that E.2 refines with the origin.

### Test: a conic without rational points

**KTheoryLowDegrees:Z.6/pointless-conic-test** · application · implementation unchecked.

Let C ⊆ P²_ℝ be the conic X² + Y² + Z² = 0. C is smooth (char 0 and the gradient (2X, 2Y, 2Z) vanishes nowhere on C), connected, regular of dimension 1 and has no ℝ-points, so every closed point y has residue field ℂ and residue degree 2 over Spec ℝ. KTheoryLowDegrees:Z.5/curve-rank-determinant-equivalence still gives K₀(C) ≅ ℤ ⊕ Pic(C), and by KTheoryLowDegrees:Z.5/line-bundle-divisorial every rank-zero class is cl[D] for a Weil divisor D, whose relative degree over Spec ℝ is even. The line bundle O_C(1) is O_C(y₀) for the degree-two point y₀ = C ∩ {Z = 0}. So, although C ⊗ ℂ ≅ P¹_ℂ, no class of rank zero has determinant of odd degree: the P¹ basis {[O], class of a rational point} of KTheoryLowDegrees:Z.6/projective-line-change-of-basis does not exist on C, and an implementation identifying K₀ of a genus-zero curve with ℤ² by rank and degree fails here. This is the genus-zero form of the rational-point hypothesis that EllipticKTheory E.2 keeps for genus one.

**Hypotheses.**

- C the real conic X² + Y² + Z² = 0.

**Construction or proof.**

- C(ℝ) = ∅ since a sum of three real squares vanishes only at 0; a closed point has residue field finite over ℝ, hence ℝ or ℂ, and ℝ is excluded.
- Relative degree: for D = Σ n_y y, relativeDegree D = Σ n_y·[k(y) : ℝ] = 2Σ n_y (Tau Ceti's relativeDegree_ofPoint), which is even.
- Z = 0 meets C in X² + Y² = 0, the single closed point [1 : ±i : 0] of degree 2, and the section Z of O(1) vanishes there to order one, so O_C(1) ≅ O_C(y₀).
- Apply the curve equivalence and KTheoryLowDegrees:Z.5/point-class-map.

**Acceptance.**

- c⁻¹[O_{y₀}] ↦ (0, O_C(1)), whose degree is 2.
- Over ℂ the pullback of c⁻¹[O_{y₀}] is the class of two rational points of P¹_ℂ, i.e. 2([O] − [O(−1)]).

**Prerequisites.**

- KTheoryLowDegrees:Z.5/curve-rank-determinant-equivalence
- KTheoryLowDegrees:Z.5/line-bundle-divisorial
- KTheoryLowDegrees:Z.5/point-class-map
- KTheoryLowDegrees:Z.5/skyscraper-class
- tauceti:TauCeti.AlgebraicGeometry.SchemeWeilDivisor.relativeDegree
- tauceti:TauCeti.AlgebraicGeometry.SchemeWeilDivisor.relativeDegree_ofPoint
- mathlib:AlgebraicGeometry.Scheme.Hom.residueDegree

**Sources.**

- Kbook.2013, I.5, Exercise 5.12(b), PDF p. 70 (book p. 62). The role of a rational point in splitting off the degree, which this test exhibits for k(x) = ℂ ≠ ℝ.

### Determinant of perfect complexes

**KTheoryLowDegrees:Z.6/scheme-spectrum-det** · construction · implementation unchecked.

For each qcqs scheme X there is a natural connective-spectrum map Det_X:K(Perf X)→Pic^Z(X), whose affine restriction is ring-spectrum-det under the perfect/projective K comparison.

**Hypotheses.**

- All schemes and categories are in fixed universes. R denotes a commutative unital ring; X is a scheme. A perfect F_p-scheme in the Witt-support results is qcqs, as in BS17 §1. Constructions on all schemes are distinguished from K(X), whose determinant statement assumes X qcqs.

**Construction or proof.**

- Import Perf, derived pullback, affine K comparison and K-theory Zariski descent from S.1/S.2 and the Waldhausen comparison.
- Use Zariski-sheafified-det locally and Pic^Z Zariski descent to glue the compatible affine maps. Compare on overlaps through scalar-extension naturality.

**Acceptance.**

- This works for singular qcqs schemes; it does not assert K(Vect X)=K(Perf X) without resolution property.

**Prerequisites.**

- KTheoryLowDegrees:Z.3/ring-spectrum-det
- KTheoryLowDegrees:Z.3/zariski-sheafified-det
- SchemeKTheoryOperations:S.1
- SchemeKTheoryOperations:S.2
- GeneralAlgebraicKTheory:K.4:construction
- SchemeAndStackFoundations:SF.1

**Uses.**

- Bhatt–Scholze §5 and §12: The signed determinant must retain automorphisms and coherent sums before spectrum group completion and geometric descent.
- KTheoryLowDegrees:Z.3/determinant-hom; KTheoryLowDegrees:U.3 and U.6: Components recover rank and determinant; loops recover the determinant on units without asserting SK₁ vanishes globally.

**Public API.**

- TauCeti.GradedDeterminant.scheme_spectrum_det_affine (compatibility): On Spec R the map agrees with Det_R under the specified affine comparison.
- TauCeti.GradedDeterminant.scheme_spectrum_det_object (compatibility): A vector bundle maps to (det E,rk E).
- TauCeti.GradedDeterminant.scheme_spectrum_det_pullback (functoriality): Derived pullback commutes coherently with Det_X.
- TauCeti.GradedDeterminant.scheme_spectrum_det_shift (compatibility): Det(C[1])≅Det(C) inverse.
- TauCeti.GradedDeterminant.scheme_spectrum_det_triangle (compatibility): Every distinguished triangle induces Det(C)≅Det(C′)⊗Det(C″) coherently.

**Unit tests.**

- TauCeti.GradedDeterminant.scheme_spectrum_det_line (computation): An invertible sheaf in degree zero maps to itself with grade one.
- TauCeti.GradedDeterminant.scheme_spectrum_det_zero (degenerate): The zero complex maps to (O,0).
- TauCeti.GradedDeterminant.scheme_spectrum_det_shift_test (compatibility): O[1] has grade −1 and determinant O.
- TauCeti.GradedDeterminant.scheme_spectrum_det_nonseparated (non-example): On the doubled plane do not replace Perf K by vector-bundle K; the Cartan groups differ.

**Sources.**

- BS17.v3, Proposition 5.3 pp.18–19. Source construction or consequence at this locator, retaining morphisms, signs and coherence; proof refinements are named as requested interfaces or recorded gaps.

### Coherent determinant additivity

**KTheoryLowDegrees:Z.6/determinant-triangle** · lemma · implementation unchecked.

A distinguished triangle C′→C→C″→C′[1] in Perf(X) supplies a natural isomorphism Det(C)≅Det(C′)⊗Det(C″), compatible with maps of triangles and the octahedral refinement.

**Hypotheses.**

- All schemes and categories are in fixed universes. R denotes a commutative unital ring; X is a scheme. A perfect F_p-scheme in the Witt-support results is qcqs, as in BS17 §1. Constructions on all schemes are distinguished from K(X), whose determinant statement assumes X qcqs.

**Construction or proof.**

- Import the additivity homotopy and filtered-object coherence from the construction owner.
- Apply the connective-spectrum determinant; paths in the target 1-type give actual isomorphisms, with the homotopies of paths giving coherence.

**Acceptance.**

- An equality of isomorphism classes alone does not determine this isomorphism.

**Prerequisites.**

- KTheoryLowDegrees:Z.6/scheme-spectrum-det
- GeneralAlgebraicKTheory:K.4:construction

**Sources.**

- BS17.v3, Proposition 5.3 p.19; Theorem 5.7 p.20. Source construction or consequence at this locator, retaining morphisms, signs and coherence; proof refinements are named as requested interfaces or recorded gaps.

### Determinant of a bounded projective complex

**KTheoryLowDegrees:Z.6/bounded-complex-det** · comparison · implementation unchecked.

For a bounded complex P• of finite projectives or vector bundles, Det(P•) identifies with the ordered tensor of det(P^i)^{(−1)^i} and grade Σ_i(−1)^i rk(P^i). This identifies the π₀ map with the existing Euler-class map.

**Hypotheses.**

- All schemes and categories are in fixed universes. R denotes a commutative unital ring; X is a scheme. A perfect F_p-scheme in the Witt-support results is qcqs, as in BS17 §1. Constructions on all schemes are distinguished from K(X), whose determinant statement assumes X qcqs.

**Construction or proof.**

- Filter the complex by its stupid truncations. Each graded term is the shifted term P^i[−i].
- Iterate determinant-triangle and the shift/inverse law, keeping increasing cohomological order and the signed interchange constraints. Compare its component with perfect-complex-euler-class.

**Acceptance.**

- The two-term identity complex has trivial determinant; cancellation keeps the natural evaluation isomorphism.

**Prerequisites.**

- KTheoryLowDegrees:Z.6/determinant-triangle
- KTheoryLowDegrees:Z.3/graded-line-inverse
- KTheoryLowDegrees:Z.6/perfect-complex-euler-class

**Sources.**

- BS17.v3, Proposition 5.3 pp.18–19 (bounded-complex consequence). Source construction or consequence at this locator, retaining morphisms, signs and coherence; proof refinements are named as requested interfaces or recorded gaps.

### Class determinant is the component map

**KTheoryLowDegrees:Z.6/graded-det-pi-zero** · comparison · implementation unchecked.

On π₀, scheme-spectrum-det recovers rank and the existing vector-bundle determinant. Forgetting the integer grade at the level of component groups recovers det:K₀→Pic; this group homomorphism does not imply a symmetric-monoidal factorization through ordinary Pic.

**Hypotheses.**

- All schemes and categories are in fixed universes. R denotes a commutative unital ring; X is a scheme. A perfect F_p-scheme in the Witt-support results is qcqs, as in BS17 §1. Constructions on all schemes are distinguished from K(X), whose determinant statement assumes X qcqs.

**Construction or proof.**

- Use the object formula and the universal property of the existing exact K₀ class map where the vector-bundle comparison is proved.
- For a general perfect complex use bounded-complex-det locally and the agreed π₀ comparison, with resolution property only where needed.

**Acceptance.**

- The ring-level determinant-hom stays an additive-group homomorphism with the Picard tensor operation.

**Prerequisites.**

- KTheoryLowDegrees:Z.6/scheme-spectrum-det
- KTheoryLowDegrees:Z.6/bounded-complex-det
- KTheoryLowDegrees:Z.5/vector-bundle-determinant
- KTheoryLowDegrees:Z.6/vector-bundle-k-zero-pi-zero

**Sources.**

- BS17.v3, Remark 5.4 p.19; Proposition 12.3 p.55. Source construction or consequence at this locator, retaining morphisms, signs and coherence; proof refinements are named as requested interfaces or recorded gaps.

### Supported Witt perfect complexes

**KTheoryLowDegrees:Z.6/witt-supported-input** · construction · implementation unchecked.

For a qcqs perfect F_p-scheme X use the support category Perf(W(X) on X) of W(O_X)-perfect complexes acyclic after p is inverted. Its K-theory is K(W(X) on X). Import this category and its K-theory from S.1/S.3; the determinant-specific datum is the natural map α_X:K(X)→K(W(X) on X) induced by restriction of scalars along W(O_X)→O_X.

**Hypotheses.**

- All schemes and categories are in fixed universes. R denotes a commutative unital ring; X is a scheme. A perfect F_p-scheme in the Witt-support results is qcqs, as in BS17 §1. Constructions on all schemes are distinguished from K(X), whose determinant statement assumes X qcqs.

**Construction or proof.**

- Perfection makes W(O_X) p-torsion-free; O_X has the two-term W(O_X)-resolution by multiplication by p. Thus restriction carries O_X-perfect complexes to supported W-perfect complexes.
- Use the supplier exact/enhanced functor and support K functoriality. No comparison equivalence is asserted for arbitrary X at this step.

**Acceptance.**

- The support condition is acyclicity after p inversion, not merely an arbitrary Witt module.

**Prerequisites.**

- SchemeKTheoryOperations:S.1
- SchemeKTheoryOperations:S.3
- GeneralAlgebraicKTheory:K.4:construction

**Uses.**

- Bhatt–Scholze §5 and §12: The signed determinant must retain automorphisms and coherent sums before spectrum group completion and geometric descent.
- KTheoryLowDegrees:Z.3/determinant-hom; KTheoryLowDegrees:U.3 and U.6: Components recover rank and determinant; loops recover the determinant on units without asserting SK₁ vanishes globally.

**Public API.**

- TauCeti.GradedDeterminant.witt_supported_input_support (characterisation): Every input C has C[1/p]≃0.
- TauCeti.GradedDeterminant.witt_supported_input_alpha (constructor): α_X is induced by O_X-perfect restriction to W(O_X).
- TauCeti.GradedDeterminant.witt_supported_input_object (compatibility): α sends C to the same supported restriction-of-scalars complex.
- TauCeti.GradedDeterminant.witt_supported_input_natural (functoriality): α is natural in perfect-scheme pullback through the specified derived comparison.
- TauCeti.GradedDeterminant.witt_supported_input_zero (simp): α sends the zero object and K basepoint to zero.

**Unit tests.**

- TauCeti.GradedDeterminant.witt_supported_input_field (computation): Over a perfect field k, k is represented by W(k) --p→ W(k).
- TauCeti.GradedDeterminant.witt_supported_input_zero_test (degenerate): The zero complex satisfies the support condition.
- TauCeti.GradedDeterminant.witt_supported_input_unsupported (non-example): W(k) in degree zero is excluded, since it remains nonzero after p inversion.
- TauCeti.GradedDeterminant.witt_supported_input_filtration (compatibility): W(k)/p² has two k graded pieces in its p-adic filtration.

**Sources.**

- BS17.v3, Paragraph after Remark 5.4 p.19; Theorem 5.7 p.20. Source construction or consequence at this locator, retaining morphisms, signs and coherence; proof refinements are named as requested interfaces or recorded gaps.

### Witt support comparison on a regular perfection

**KTheoryLowDegrees:Z.6/witt-regular-perfection-comparison** · comparison · implementation unchecked.

For R the perfection of a regular noetherian F_p-algebra R₀, α_Spec R is an equivalence K(R)≃K(W(R) on R). The smooth affine case suffices for the alteration descent proving Theorem 5.7.

**Hypotheses.**

- All schemes and categories are in fixed universes. R denotes a commutative unital ring; X is a scheme. A perfect F_p-scheme in the Witt-support results is qcqs, as in BS17 §1. Constructions on all schemes are distinguished from K(X), whose determinant statement assumes X qcqs.

**Construction or proof.**

- Import regular immersion dévissage and support localization from S.3/K.3. For smooth R₀, choose the deformation and Frobenius lift; compare supported perfect categories before and after p-completion, then take the compatible filtered K colimit.
- For unrestricted regular R₀, the sentence identifying all obstructions with coherent cohomology requires the correction of extraction E31: use a smooth Popescu system and filtered support K continuity. This stronger extension is requested, not asserted proved by affine cohomology.

**Acceptance.**

- Determinant localization or flatness alone is not a proof of this equivalence.

**Prerequisites.**

- KTheoryLowDegrees:Z.6/witt-supported-input
- SchemeKTheoryOperations:S.3
- GeneralAlgebraicKTheory:K.3

**Sources.**

- BS17.v3, Corollary 5.6 pp.19–20, corrected proof boundary E31. Source construction or consequence at this locator, retaining morphisms, signs and coherence; proof refinements are named as requested interfaces or recorded gaps.

### First K-truncation on the perfect site

**KTheoryLowDegrees:Z.6/v-sheafified-first-k** · theorem · implementation unchecked.

On the perfect F_p v-site, both τ≤1K(X)→Pic^Z(X) and τ≤1K(X)→τ≤1K(W(X) on X) become equivalences after v-sheafification.

**Hypotheses.**

- All schemes and categories are in fixed universes. R denotes a commutative unital ring; X is a scheme. A perfect F_p-scheme in the Witt-support results is qcqs, as in BS17 §1. Constructions on all schemes are distinguished from K(X), whose determinant statement assumes X qcqs.

**Construction or proof.**

- For the first map, use the Zariski local calculation and graded-pic-v-descent.
- For the supported comparison, import alteration v-covers by perfections of smooth schemes and the regular-perfection comparison. Descent is performed on presheaves of groupoids/1-types, keeping homotopies.

**Acceptance.**

- No claim that the unsheafified support comparison is an equivalence for all perfect X.

**Prerequisites.**

- KTheoryLowDegrees:Z.3/zariski-sheafified-det
- KTheoryLowDegrees:Z.3/graded-pic-v-descent
- KTheoryLowDegrees:Z.6/witt-regular-perfection-comparison
- SchemeAndStackFoundations:SF.1
- StableHomotopyKTheory:H.5:spectra

**Sources.**

- BS17.v3, Proof of Theorem 5.7 p.20. Source construction or consequence at this locator, retaining morphisms, signs and coherence; proof refinements are named as requested interfaces or recorded gaps.

### Determinant with Witt support

**KTheoryLowDegrees:Z.6/witt-supported-det** · construction · implementation unchecked.

For X a qcqs perfect F_p-scheme, construct a natural connective-spectrum map Det~_X:K(W(X) on X)→Pic^Z(X) extending Det_X along α_X.

**Hypotheses.**

- All schemes and categories are in fixed universes. R denotes a commutative unital ring; X is a scheme. A perfect F_p-scheme in the Witt-support results is qcqs, as in BS17 §1. Constructions on all schemes are distinguished from K(X), whose determinant statement assumes X qcqs.

**Construction or proof.**

- Map supported K to its 1-truncation and then its v-sheafification.
- Use v-sheafified-first-k to identify that sheafification with Pic^Z, choosing the comparison compatible with the ordinary determinant. Sheafification universal properties provide naturality and coherent extension.

**Acceptance.**

- The construction is on the supported perfect category and retains the integer grade.

**Prerequisites.**

- KTheoryLowDegrees:Z.6/witt-supported-input
- KTheoryLowDegrees:Z.6/v-sheafified-first-k
- KTheoryLowDegrees:Z.6/scheme-spectrum-det
- StableHomotopyKTheory:H.5:spectra
- SchemeAndStackFoundations:SF.1

**Uses.**

- Bhatt–Scholze §5 and §12: The signed determinant must retain automorphisms and coherent sums before spectrum group completion and geometric descent.
- KTheoryLowDegrees:Z.3/determinant-hom; KTheoryLowDegrees:U.3 and U.6: Components recover rank and determinant; loops recover the determinant on units without asserting SK₁ vanishes globally.

**Public API.**

- TauCeti.GradedDeterminant.witt_supported_det_extension (compatibility): Det~_X∘α_X≃Det_X coherently.
- TauCeti.GradedDeterminant.witt_supported_det_pullback (functoriality): Perfect-scheme pullback commutes with Det~.
- TauCeti.GradedDeterminant.witt_supported_det_additivity (compatibility): Supported distinguished triangles give tensor determinant isomorphisms.
- TauCeti.GradedDeterminant.witt_supported_det_zero (simp): The zero supported complex has determinant (O,0).
- TauCeti.GradedDeterminant.witt_supported_det_unique (universal-property): The space of natural extending maps with extension compatibility is contractible.

**Unit tests.**

- TauCeti.GradedDeterminant.witt_supported_det_residue (compatibility): The supported residue module k maps to (k,1).
- TauCeti.GradedDeterminant.witt_supported_det_length_two (computation): Over a perfect field, W(k)/p² maps to (k,2) up to the canonical filtration identification.
- TauCeti.GradedDeterminant.witt_supported_det_zero_test (degenerate): The zero supported object maps to the tensor unit.
- TauCeti.GradedDeterminant.witt_supported_det_unsupported (non-example): No value on W(k)[1/p] is supplied by this supported determinant construction.

**Sources.**

- BS17.v3, Theorem 5.7 p.20. Source construction or consequence at this locator, retaining morphisms, signs and coherence; proof refinements are named as requested interfaces or recorded gaps.

### Contractible determinant extension

**KTheoryLowDegrees:Z.6/witt-det-uniqueness** · theorem · implementation unchecked.

The space of natural Det~ extending the ordinary determinant along α, including the specified extension homotopy, is contractible. This is stronger than equality of induced π₀ maps.

**Hypotheses.**

- All schemes and categories are in fixed universes. R denotes a commutative unital ring; X is a scheme. A perfect F_p-scheme in the Witt-support results is qcqs, as in BS17 §1. Constructions on all schemes are distinguished from K(X), whose determinant statement assumes X qcqs.

**Construction or proof.**

- A map to the v-sheaf Pic^Z factors uniquely through sheafification in the mapping-space sense.
- The comparison α becomes an equivalence after 1-truncation and sheafification. Precomposition is therefore an equivalence of mapping spaces; its fibre over ordinary Det is contractible.

**Acceptance.**

- Do not quantify over arbitrary maps for a single X without naturality and extension data.

**Prerequisites.**

- KTheoryLowDegrees:Z.6/witt-supported-det
- KTheoryLowDegrees:Z.6/v-sheafified-first-k
- StableHomotopyKTheory:H.5:spectra
- SchemeAndStackFoundations:SF.1

**Sources.**

- BS17.v3, Theorem 5.7 and proof p.20. Source construction or consequence at this locator, retaining morphisms, signs and coherence; proof refinements are named as requested interfaces or recorded gaps.

### Determinant through a supported filtration

**KTheoryLowDegrees:Z.6/witt-filtration-det** · comparison · implementation unchecked.

If a supported perfect complex has a finite filtration with graded pieces from Perf(X) and specified cofiber triangles, Det~ identifies coherently with the ordered product of their ordinary graded determinants. It is independent of the chosen filtration through the supported K additivity comparison.

**Hypotheses.**

- All schemes and categories are in fixed universes. R denotes a commutative unital ring; X is a scheme. A perfect F_p-scheme in the Witt-support results is qcqs, as in BS17 §1. Constructions on all schemes are distinguished from K(X), whose determinant statement assumes X qcqs.

**Construction or proof.**

- Iterate the specified filtered-object additivity homotopies, apply Det~, and use its extension compatibility on every graded piece.
- Compare refinements and alternate filtrations through the common supported K class and its coherent additive paths; a π₀ equality alone is not the claimed canonical comparison.

**Acceptance.**

- Do not assume every arbitrary perfect-scheme object admits such a global filtration.

**Prerequisites.**

- KTheoryLowDegrees:Z.6/witt-supported-det
- KTheoryLowDegrees:Z.6/witt-det-uniqueness
- GeneralAlgebraicKTheory:K.4:construction

**Sources.**

- BS17.v3, Theorem 5.7 explanatory paragraph p.20. Source construction or consequence at this locator, retaining morphisms, signs and coherence; proof refinements are named as requested interfaces or recorded gaps.

### Constant finite-length Witt determinant

**KTheoryLowDegrees:Z.6/finite-length-det-trivial** · theorem · implementation unchecked.

Let k be a perfect field, Q a finite-length W(k)-module, and X a qcqs perfect k-scheme. For a finite exhaustive filtration of Q_X=Q⊗_{W(k)}W(O_X) whose graded pieces are finite projective O_X-modules, the ordinary line ⊗_i det(gr_i Q_X) is trivial. Its graded determinant has grade length_{W(k)}Q, which need not be zero.

**Hypotheses.**

- All schemes and categories are in fixed universes. R denotes a commutative unital ring; X is a scheme. A perfect F_p-scheme in the Witt-support results is qcqs, as in BS17 §1. Constructions on all schemes are distinguished from K(X), whose determinant statement assumes X qcqs.

**Construction or proof.**

- Use witt-filtration-det to identify the product with the underlying line of Det~(Q_X).
- Naturality identifies it with the pullback of the k-line underlying Det~(Q), hence a trivializable line. This does not choose a canonical basis of that k-line. The direct geometric proof via flag varieties is not required by the determinant source route.

**Acceptance.**

- For Q=k the line is trivial but grade is one; replacing the graded output by the unit would be false.

**Prerequisites.**

- KTheoryLowDegrees:Z.6/witt-filtration-det
- KTheoryLowDegrees:Z.3/forget-grade
- KTheoryLowDegrees:Z.6/witt-supported-det

**Sources.**

- BS17.v3, Lemma 6.11 pp.24–25 (K-theoretic proof at top of p.25). Source construction or consequence at this locator, retaining morphisms, signs and coherence; proof refinements are named as requested interfaces or recorded gaps.

## Open gaps

### General Picard duality and pullback supplier boundary

The native LineBundleClass is only a commutative monoid. General sheaf dual evaluation and coherent tensor/pullback on arbitrary schemes remain requested from JacobianChallenge layer A. The suggested units carrier does not prove every invertible sheaf class has these supplier interfaces. The current validator resolves the actual stage; its three previously unresolved stage edges have been restored. The mathematical request remains open.

Consumers: KTheoryLowDegrees:Z.5/pic-disjoint-cover-ext, KTheoryLowDegrees:Z.5/pic-locally-constant-module, KTheoryLowDegrees:Z.5/pic-locally-constant-pullback, KTheoryLowDegrees:Z.5/vector-bundle-determinant, KTheoryLowDegrees:Z.5/rank-determinant-surjective, KTheoryLowDegrees:Z.3/graded-line-groupoid, KTheoryLowDegrees:Z.3/graded-line-inverse.

### Serre's coefficient and arbitrary-field character inputs

The finite-free comparison and generic/residue-fibre argument are decomposed over ℤ for a free coefficient coalgebra C. Eight further nodes now supply native torus weight exactness, coefficient and weight base-change comparisons, integral formal characters, restriction, Ch_𝔽p∘d_p=Ch_ℚ, and the conditional isomorphism from equal injective character images. This removes the generic formal-character compatibility subproblem for a specified r:C→ℤ[X], but not the GL application. Establish freeness of the pinned integral GL coordinate coalgebra using the big-cell embedding in Serre p. 51 Remark 1, or supply the general flat/noetherian finite-hull extension; localization at the determinant gives flatness but not by itself freeness. The pinned single-factor coefficient and diagonal-torus identifications are reused, and eight new nodes now give the finite-product coefficient algebra, factor inclusions, generator extensionality, coefficient base change, diagonal restriction and their commuting square. Package corestriction along this coefficient equivalence as an equivalence of the finite-comodule exact categories and the induced direct-model exact K₀ comparison; prove its formal-character compatibility with restrictedCharacter and the existing ofGL.character. The underlying coefficient square is now available, but these categorical and K₀ identifications are not asserted as completed by it. Supply Serre Lemma 5 over those fields, including absolute simplicity and descent, then finite dominance intervals and the unitriangular character proof that the images are exactly the same ℤ[X]^W. ClassicalGroups layers 3–4 provide only their complex comparison; the existing ReductiveGroups Part II proposal retains the missing owner direction without inventing a supplier stage. SchemeKTheoryOperations S.5 remains downstream.

Consumers: KTheoryLowDegrees:Z.3/serre-representation-ring-theorem, KTheoryLowDegrees:Z.3/ring-k0-special.

### Homotopy-coherent determinant and perfect-site descent suppliers

Native line sheaves, Core, SymmetricCategory, Pic class groups and locally constant functions do not supply a Picard-groupoid spectrum or the determinant functor coherences. Import H.4/H.5:spectra for connective spectrum mapping spaces, truncation, Picard 1-types and group completion; S.1/S.2/S.3 and K.4:construction for enhanced perfect complexes, support K, descent and coherent filtered additivity; SF.1 for the perfect v-site, line-bundle v-descent and alteration covers. These exact additions exceed SF.1’s current fpqc/fppf text and H.5’s homotopy-category-only surface; the rescope proposal records them. Corollary 5.6 for arbitrary regular R₀ also requires smooth approximation and supported K continuity, as extraction E31 explains. No opaque proposition-valued surrogate or fresh generic construction is introduced here. The geometric/source comparison nodes are placed in Z.6 because S.2/S.3 already depend on early Z.3; no S.2/S.3→Z.3 edge is proposed. Their mathematical source is the common determinant route in Z.3, specialized at the downstream perfect-complex comparison stage.

Consumers: KTheoryLowDegrees:Z.3/graded-line-components, KTheoryLowDegrees:Z.3/graded-line-automorphisms, KTheoryLowDegrees:Z.3/graded-line-fibre, KTheoryLowDegrees:Z.3/ring-spectrum-det, KTheoryLowDegrees:Z.3/determinant-truncation, KTheoryLowDegrees:Z.3/local-det-equivalence, KTheoryLowDegrees:Z.3/zariski-sheafified-det, KTheoryLowDegrees:Z.6/scheme-spectrum-det, KTheoryLowDegrees:Z.6/determinant-triangle, KTheoryLowDegrees:Z.3/graded-pic-v-descent, KTheoryLowDegrees:Z.6/witt-supported-input, KTheoryLowDegrees:Z.6/witt-regular-perfection-comparison, KTheoryLowDegrees:Z.6/v-sheafified-first-k, KTheoryLowDegrees:Z.6/witt-supported-det, KTheoryLowDegrees:Z.6/witt-det-uniqueness, KTheoryLowDegrees:Z.6/witt-filtration-det.

## Supplier requests

- **tauceti:TauCetiRoadmap/RepresentationTheory/ClassicalGroups#layer-4-characters-and-schur-polynomials**: ClassicalGroups layer 4 with layer 3: the complex rational-representation character map for products of GL_n(ℂ), with det-twisted Schur characters and injectivity into symmetric Laurent polynomials. This is solely the complex comparison within Z.3/serre-representation-ring-theorem. It does not supply highest-weight classification over ℚ or 𝔽_p, descent, or Serre’s integral comparison. Those precise additional needs are recorded as gaps and a Part II proposal, in accord with this supplier’s stated base field ℂ. Consumers: KTheoryLowDegrees:Z.3/serre-representation-ring-theorem.
- **tauceti:TauCetiRoadmap/JacobianChallenge#layer-a-line-bundles-divisors-picard-group-degree**: Layer A: 'Invertible sheaves on a scheme; the Picard group Pic X under ⊗' — the group structure on Tau Ceti's commutative monoid LineBundleClass X, the inverse of [L] being [Hom(L, O_X)] with L ⊗ Hom(L, O_X) ≅ O_X (Stacks 01CT), so that the determinant K₀(Vect X) → Pic(X) of KTheoryLowDegrees:Z.5/vector-bundle-determinant is a homomorphism of groups for every scheme; and the smooth-curve 'Cl(X) ≅ Pic X', which must be the same map D ↦ O_X(D) as KTheoryLowDegrees:Z.5/line-bundle-divisorial (which proves it for every integral regular noetherian scheme of dimension ≤ 1, possibly nonproper or arithmetic, as RS-18 assigns to Z.5). The same interface includes ordinary integer tensor powers, covariant transport along line-bundle isomorphisms (dual of the inverse for negative powers), and Picard pullback induced by Scheme.Modules.pullback, preserving unit, tensor, dual, identity and composition. Z.5 owns only the additional locally constant-exponent module structure, not these general Picard constructions. Consumers: KTheoryLowDegrees:Z.5/vector-bundle-determinant, KTheoryLowDegrees:Z.5/rank-determinant-surjective, KTheoryLowDegrees:Z.5/line-bundle-divisorial, KTheoryLowDegrees:Z.5/pic-disjoint-cover-ext, KTheoryLowDegrees:Z.5/pic-locally-constant-module, KTheoryLowDegrees:Z.5/pic-locally-constant-pullback.
- **tauceti:TauCetiRoadmap/AlgebraicCurves#layer-12-the-dictionary--function-fields--curves-and-the-comparison-contracts**: Layer 12D: 'Weil divisors on X_F ≅ Divisor k F, matching degrees, principal divisors, and linear equivalence — so Pic-style class groups agree with Cl(F)', used only for the compatibility items of KTheoryLowDegrees:Z.5/point-class-map and Z.5/line-bundle-divisorial on a regular projective curve over a field (RS-18: 'on regular projective function-field models reuse Algebraic Curves 12'); nothing of 12 is re-planned. Consumers: KTheoryLowDegrees:Z.5/point-class-map, KTheoryLowDegrees:Z.5/line-bundle-divisorial.
- **tauceti:TauCetiRoadmap/GrothendieckEulerForms#layer-4-finite-dimensional-algebras-and-the-cartan-map**: RS-18's owner of 'the existing categorical Cartan map': TauCeti.cartanMap, TauCeti.cartanMap_of and TauCeti.cartanEquiv, already built at the pin and cited as baseline; Z.6 proves that the vector-bundle Cartan map of Z.5 and π₀ of SchemeKTheoryOperations S.2's Cartan map are this map, and defines no second one. Consumers: KTheoryLowDegrees:Z.6/cartan-map-comparison.
- **tauceti:TauCetiRoadmap/GrothendieckEulerForms#layer-3-finite-resolutions-and-the-resolution-theorem**: RS-18's supplier of the finite-resolution Euler class ('Euler class of a resolution ... independent of its length, zero padding, and choice of resolution'), built at the pin in the projective case as TauCeti.ExactStructure.eulerClassOf / TauCeti.moduleEulerClassOf with TauCeti.ExactStructure.eulerClassOf_eq and cited as baseline; Z.6 identifies it with the class of a perfect complex in π₀K. Consumers: KTheoryLowDegrees:Z.6/perfect-complex-euler-class.
- **AlgebraicModuliForArithmeticGeometry:R09.1**: R09.1: 'Construct projective bundles, Grassmannians and flag schemes with their quotient/subbundle universal properties, universal sheaves and base-change laws' — here only P¹_F = P(O^{⊕2}) = Proj F[T₀, T₁] over Spec F with its twisting sheaves O(m) and the standard affine cover, the convention SchemeKTheoryOperations S.5 uses. Consumers: KTheoryLowDegrees:Z.6/projective-line-regular-curve.
- **StableHomotopyKTheory:H.5:spectra**: Connective-spectrum mapping spaces and truncation with universal properties; Picard groupoids as 1-truncated connective spectra, homotopy groups and discrete H⁰. Retain coherent, rather than only homotopy-category, maps in BS17 §5/§12. Consumers: KTheoryLowDegrees:Z.3/graded-line-fibre, KTheoryLowDegrees:Z.3/graded-line-automorphisms, KTheoryLowDegrees:Z.3/determinant-truncation, KTheoryLowDegrees:Z.6/witt-det-uniqueness.
- **StableHomotopyKTheory:H.4**: BS17 §12 generic symmetric-monoidal groupoid group completion and its E∞ coherence. The Segal subset model must include the empty-family unit. Import π₀ as ordinary group completion from GrothendieckEulerForms, not a second K₀ owner; compare finite-projective completion with the agreed K model. Consumers: KTheoryLowDegrees:Z.3/ring-spectrum-det, KTheoryLowDegrees:Z.3/graded-line-components.
- **SchemeAndStackFoundations:SF.1**: Perfect F_p v-site, effective v-descent of line bundles and their isomorphisms (BS17 Theorem 4.1(ii)), locally constant integer v-sheaf (Prop.5.2), sheafification of 1-types and alteration covers by regular/smooth perfections. Existing fpqc/fppf descent does not imply these stronger statements; extend the foundations direction by the rescope below. Consumers: KTheoryLowDegrees:Z.3/graded-pic-v-descent, KTheoryLowDegrees:Z.6/v-sheafified-first-k, KTheoryLowDegrees:Z.6/witt-det-uniqueness.
- **GeneralAlgebraicKTheory:K.4:construction**: Map-level group-completion/Waldhausen projective comparison and additivity paths for perfect distinguished triangles and finite filtrations, including octahedral/refinement coherence. Generic construction and additivity stay with this owner. Consumers: KTheoryLowDegrees:Z.3/ring-spectrum-det, KTheoryLowDegrees:Z.6/determinant-triangle, KTheoryLowDegrees:Z.6/witt-filtration-det.
- **SchemeKTheoryOperations:S.3**: Support Perf(W(X) on X), restriction α from Perf(X), regular immersion dévissage, supported p-completion comparison and filtered K continuity. For arbitrary regular R₀ in BS17 Cor.5.6 use smooth approximation; no general Frobenius lift follows from affine coherent cohomology without finite-projective cotangent input. Consumers: KTheoryLowDegrees:Z.6/witt-supported-input, KTheoryLowDegrees:Z.6/witt-regular-perfection-comparison.
- **KTheoryLowDegrees:U.3**: Local-ring K₁=units via determinant and SK₁ vanishing supplies BS17 Prop.12.18 π₁ calculation; U.6 compares this loop map with the agreed homotopy K model. This Z-part plans only the common graded determinant and imports the K₁ calculation. Consumers: KTheoryLowDegrees:Z.3/local-det-equivalence.
- **SchemeKTheoryOperations:S.1**: Enhanced perfect complexes, derived pullback and affine comparison, including the p-torsion-free Witt restriction support case. No resolution-property equivalence is asserted for arbitrary schemes. Consumers: KTheoryLowDegrees:Z.6/scheme-spectrum-det, KTheoryLowDegrees:Z.6/witt-supported-input.
- **SchemeKTheoryOperations:S.2**: K(Perf X), natural affine projective/perfect comparison and K-theory Zariski descent for qcqs schemes. Keep the one Cartan map and its actual regularity hypotheses. Consumers: KTheoryLowDegrees:Z.6/scheme-spectrum-det.
- **GeneralAlgebraicKTheory:K.3**: Regular immersion devissage and comparison with supported K via the specified Waldhausen/abelian localization interfaces. Replace the verified false doubled-line counterexample in the supplier acceptance by the doubled plane. Consumers: KTheoryLowDegrees:Z.6/witt-regular-perfection-comparison.
- **GeneralAlgebraicKTheory:K.7**: For finite projective modules over any commutative ring, the biexact tensor-product pairing on Quillen/Waldhausen K-theory induces on π₀ the product [P]·[Q]=[P⊗Q], compatible with scalar extension and the K.1 ExactK0/π₁BQ comparison. The previously cited K.7/biexact-pairings-and-products node does not exist in the reviewed input; this is a request to the actual K.7 stage, not a claimed supplied theorem. Consumers: KTheoryLowDegrees:Z.6/ring-k-zero-pi-zero.

## Restructuring and ownership

- The special-λ question: the representation-ring route and its Serre inputs: The special λ-structure uses the representation-ring route: construct the exact representation group R_ℤ(G), embed it by formal characters into the special λ-ring ℤ[X(T)], and transport the identities along associated-projective-module maps to K₀(R), with enough GL factors to represent each virtual class and clopen reduction to constant ranks. The exact K₀ comparison in Serre Proposition 4 is decomposed for a free coefficient coalgebra over a PID. The generic/residue-fibre comparison and its formal-character compatibility are decomposed for a free coefficient coalgebra and specified torus restriction. The product GL coefficient/base-change square now reuses the native single-factor and torus identifications. Integral coefficient freeness, direct-model exact K₀/formal-character transport, and arbitrary-field highest-weight classification, descent and common character image remain distinct inputs in the Serre gap. The complex ClassicalGroups request supplies only a complex comparison. Weibel’s flag-bundle splitting-principle route uses SchemeKTheoryOperations S.5 downstream of Z.3 and cannot provide a prerequisite here. The existing F²_γ=SK₀, first graded piece, determinant formulas, and rank/determinant normalization of Adams operations retain their independent proofs.
- The abstract λ-ring algebra moves from SchemeKTheoryOperations S.6 to KTheoryLowDegrees Z.3: node replacement list: Accepting S.6's restructure entry 'The abstract λ-ring algebra should be owned by KTheoryLowDegrees Z.3', Z.3 now plans the algebra that Z.3 itself needs, with statements, sources and tests re-verified. Replacements (S.6 node → Z.3 nodes): S.6/lambda-universal-polynomials → Z.3/lambda-universal-polynomials; S.6/lambda-ring → Z.3/pre-lambda-ring (pre-λ-rings, homomorphisms, λ-ideals, quotients) and Z.3/special-lambda-ring (special λ-rings), with the ℤ instance in Z.3/binomial-lambda-ring and Z.3/binomial-special; S.6 keeps only the non-unital λ-algebra clause (for K(A) = ⊕K_m(A) and K^Y(X)) as a node over Z.3/special-lambda-ring; S.6/laurent-lambda-ring → Z.3/monoid-lambda-ring; S.6/lambda-identity-principle → Z.3/lambda-identity-principle; S.6/adams-operations → Z.3/adams-operations; S.6/adams-additivity-square-zero → Z.3/adams-add (a), Z.3/adams-line-element (b), Z.3/adams-square-zero (c), Z.3/adams-binomial (d); S.6/adams-multiplicative-composition → Z.3/adams-ring-endomorphism, Z.3/adams-composition, Z.3/adams-frobenius; S.6/gamma-filtration → Z.3/augmented-lambda-ring, Z.3/gamma, Z.3/gamma-add, Z.3/gamma-series, Z.3/gamma-vanishing-above-rank (γ^k(ℓ − 1) = 0), Z.3/gamma-filtration, Z.3/gamma-filtration-mul, Z.3/gamma-filtration-one and Z.3/gamma-filtration-eq-span (the ideal/span comparison for H = ℤ and H⁰(X, ℤ)); the filtration on the non-unital part K_m stays in S.6; S.6/representation-ring-of-gl → Z.3/representation-ring-of-gl (the rings R_ℤ(∏GL_{N_i}) and their character maps; S.6 keeps R_ℤ(GL) = lim_N R_ℤ(GL_N) and the elements (τ(id_N − N))_N as a node over it); S.6/serre-representation-ring-theorem → Z.3/serre-representation-ring-theorem (S.6 keeps only the passage to the limit R_ℤ(GL)); S.6's gap 'Serre's theorem on representation rings of split reductive groups' and its request to ClassicalGroups layer 4 move with it. Z.3 keeps its existing ids Z.3/gamma and Z.3/gamma-filtration and restates them for pre-λ-rings (resp. augmented pre-λ-rings) with K₀(R) the main instance, so no second γ declaration exists. Not moved (S.6 keeps them and should cite the Z.3 nodes above): S.6/adams-eigenvalue-on-gamma-graded (its weight-one case is Z.3/adams-first-graded), S.6/rational-weight-decomposition, S.6/bott-cannibalistic-class and S.6/representation-ring (R_A(G) of abstract groups), which Z.3's targets do not use.
- What S.6, S.7 and the companion packet should cite in Z.3: S.6/vector-bundle-lambda-ring: for X = Spec A cite Z.3/ring-k0-special, and Z.3/exterior-extension-filtration for the filtration of Λ^k of an extension (K-book Ex. I.5.4); its associated-bundle step is the scheme version of Z.3/associated-projective-module. S.6/degree-zero-comparison: for an actual projective P of constant rank r, λ^r[P] is the K₀ class of det P; no formula is asserted for arbitrary virtual rank-r classes (Z.3/determinant-hom API) and the affine F¹/F² ≅ Pic is Z.3/gamma-first-graded. S.7/gamma-first-graded-pieces: for X = Spec A the statements F²_γ = ker(rank, det), Pic ≅ F¹/F² and the ring homomorphism rank ⊕ det are Z.3/gamma-filtration-two, Z.3/gamma-first-graded and Z.3/rank-det-ring-hom, proved there without the splitting principle, and the determinant identities det(E ⊗ F) and det(Λ^jE) it uses are Z.3/determinant-tensor and Z.3/determinant-exterior-power. The companion packet's restructure entry 'The rank is a ring homomorphism only once Z.3 has the ring structure' is realised as Z.3/rank-ring-hom, cited by Z.3/augmentation; its mapping of the checkpoint's Z.2 request to node ids has been applied (Z.2/rank-hom, Z.2/rank-section, Z.2/rank-fibre-decomposition, Z.2/componentwise-free, Z.2/local-freeness, Z.2/rank-base-change), and the Z.2 request is withdrawn.
- Ring-level determinant inputs for KTheoryLowDegrees Z.4: Z.4's multiplication law (m, L)(n, M) = (mn, L^n M^m) is the Dedekind case of Z.3/rank-det-ring and Z.3/rank-det-ring-hom (Weibel Corollary 2.6.2); the induced maps under localisation and extension of rings on the determinant coordinate are Z.3/determinant-base-change with Z.3/map-ring-hom; and SK₀(A) = 0 for a Dedekind domain is the kernel statement of Z.3/sk-zero. Z.4 should cite these node ids rather than re-plan them.
- Corrections to the checkpoint's Z.3 nodes: (1) The checkpoint said Weibel's γ-filtration is an additive subgroup and left 'agreement with the additive gamma filtration' as a gap; Weibel defines F^n_γ as the ideal generated by the weighted products (Chapter II, p. 30, both the 2012 chapter and the 2013 draft); the additive-subgroup form is Soulé's, for K(A). Z.3/gamma-filtration now matches Weibel, and Z.3/gamma-filtration-eq-span proves the two forms agree for n ≥ 1 (for n = 0 the span is smaller), including disconnected Spec R; the gap is withdrawn. (2) Every excerpt of the checkpoint's nodes was a fragment of a formula (for example '∧kP', 'rank', 'F n γ K'); each is replaced by a literal sentence of the 2012 chapters, and the vacuous acceptance items were replaced by concrete checks. (3) Prerequisites on the stage KTheoryLowDegrees:Z.2 were replaced by the node ids of the companion packet. (4) Z.3/gamma, gamma-series, gamma-one, gamma-add, lambda-zero-class, lambda-neg-recursion, gamma-rank-zero and the γ-filtration nodes are restated for (augmented) pre-λ-rings, with K₀(R) the main instance, since their proofs never used modules.
- Z.4 ids for the requests of ArithmeticKTheory N.1–N.3, ClassicalArithmeticCompletion CA.7 and SchemeKTheoryOperations S.3: ArithmeticKTheory--N.1's request to KTheoryLowDegrees:Z.4 resolves to node ids: (1) K₀(A) ≅ ℤ ⊕ Pic(A) is Z.4/rank-pic-equivalence (kept), with the class-group form Z.4/rank-class-group-equivalence and, for A = S.integer F with Tau Ceti's IsDedekindDomain.integerClassGroupEquiv, Z.4/k0-s-integers; the ring structure (m, a)(n, b) = (mn, aⁿbᵐ) used in N.1's fourth proof step is Z.4/rank-pic-ring-equiv. (2) The restriction-of-scalars formula det_R(Res P) = Norm(det P)·det_R(R′)^{rank P} is Z.4/restriction-determinant, stated for every finite injective extension of Dedekind domains, with the norm Z.4/pic-norm (the transport of Tau Ceti's ClassGroup.relNorm) and the K₀ form Z.4/k0-transfer-coordinates; N.1 supplies the hypotheses for O_{F,S} ⊂ O_{F′,S′} from N.1/S-integers-in-a-finite-extension. N.1/norms-transfers-and-pullbacks should cite these ids in place of the stage KTheoryLowDegrees:Z.4. N.3/quillen-finiteness-criterion's use ('finitely many isomorphism classes of projectives of each rank because Pic(R) is finite') is Z.4/projective-classification. SchemeKTheoryOperations S.3/dedekind-localisation-sequence and N.2/the-three-classical-rows use the normalisation [R] − [𝔭] ↦ (0, [𝔭]⁻¹), an API item of Z.4/rank-pic-equivalence and Z.4/rank-class-group-equivalence. ClassicalArithmeticCompletion CA.7/locally-free-class-group keeps Z.4/rank-pic-equivalence.
- Localisations are S-integer rings: a Z.4 lemma that ArithmeticKTheory N.1 can cite: Z.4/localization-eq-integer proves that every localisation R_M of a Dedekind domain at M ≤ R⁰ is S_M.integer K for S_M the height-one primes meeting M. This is the direction (ii) ⇒ (i) of ArithmeticKTheory:N.1/S-integers-as-a-localisation with S = S_M. Z.4 needs it for the class group of the actual localised ring; N.1 keeps the converse and the presentation of O_{F,S} as a localisation for a torsion class group (N.1/S-integers-localisation-of-torsion-class-group). Proposal: N.1's (ii) ⇒ (i) cites Z.4/localization-eq-integer instead of proving it again.
- The Dedekind ring structure is the Dedekind case of Z.3's rank ⊕ det: Weibel's Corollary 2.6.2 (H⁰ ⊕ Pic is a ring and rank ⊕ det a surjective ring homomorphism with kernel SK₀) is planned in Z.3 (Z.3/rank-det-ring, Z.3/rank-det-ring-hom, Z.3/sk-zero, Z.3/determinant-mul). Z.4 plans only its Dedekind specialisation: SK₀ = 0, the ring isomorphism K₀(R) ≃+* ℤ ⊕ Pic(R) (Z.4/rank-pic-ring-equiv) and the multiplication law in rank/Pic coordinates (Z.4/rank-pic-mul). The square-zero identity of Z.4/line-class-product gives an independent check of the law. Z.4/reduced-line-class lifts Z.3/gamma-first-graded's L ↦ [L] − 1 into K₀(R) itself, which is possible because F²_γ = SK₀ = 0 for Dedekind domains.
- The nonprincipal-ideal test of Z.6 imports Z.4/nonprincipal-ideal-class: Z.4/nonprincipal-ideal-class gives, for A = ℤ[√−5] and I = (2, 1 + √−5), the rank/Pic facts (rank 0, determinant Pic.mk I ≠ 1, 2([I] − [A]) = 0 through I × I ≃ A × A) and K₀(A) ≅ ℤ ⊕ ℤ/2 through Z.4/zsqrtd-neg-five-integers and Tau Ceti's class number of ℚ(√−5). KTheoryLowDegrees:Z.6/nonprincipal-ideal-test should cite it for these facts and add only the localisation, skyscraper and Euler-class comparisons.
- The checkpoint's request to KTheoryLowDegrees:Z.2 is withdrawn for Z.4: Following the U.1 packet's entry 'Resolution of the companion packet’s references to KTheoryLowDegrees:Z.2', the Z.4 nodes cite Z.2/rank-connected (integer rank), Z.2/rank-domain (fraction-field normalisation and connectedness), Z.2/rank-hom (rank_of_invertible, rank_of_eq_zero_iff), Z.2/rank-base-change, Z.2/k0-pi and Z.2/pi-ring-modules in place of the stage.
- Split Z.5 into Z.5:vector-bundles (upstream of SchemeKTheoryOperations S.1, S.2, S.6, S.7) and Z.5:curves: SchemeKTheoryOperations uses, without a node, exactly the objects the Z.5 stage text asks this layer to build ('Apply the categorical construction to finite locally free sheaves'): Vect(X) in S.1/vector-bundle-comparison, K(Vect X) in S.2/vector-bundle-k-theory-comparison, K₀(Vect X) and Λᵏ of vector bundles in S.6/vector-bundle-lambda-ring, and K₀(Vect X), the rank, det: K₀(Vect X) → Pic(X) and the ring map rank ⊕ det in S.7/scheme-gamma-filtration and S.7/gamma-first-graded-pieces. The atlas has S.6 → Z.5, S.7 → Z.6 and S.2 → Z.5, so those S nodes cannot cite the Z.5 ids. The nodes KTheoryLowDegrees:Z.5/vector-bundle, KTheoryLowDegrees:Z.5/vector-bundle-extension-closed, KTheoryLowDegrees:Z.5/vector-bundle-essentially-small, KTheoryLowDegrees:Z.5/vector-bundle-k-zero, KTheoryLowDegrees:Z.5/vector-bundle-affine-comparison, KTheoryLowDegrees:Z.5/vector-bundle-k-zero-pullback, KTheoryLowDegrees:Z.5/vector-bundle-k-zero-ring, KTheoryLowDegrees:Z.5/vector-bundle-rank, KTheoryLowDegrees:Z.5/sheaf-exterior-power, KTheoryLowDegrees:Z.5/exterior-power-vector-bundle, KTheoryLowDegrees:Z.5/exterior-power-extension-filtration, KTheoryLowDegrees:Z.5/determinant-bundle, KTheoryLowDegrees:Z.5/determinant-bundle-extension, KTheoryLowDegrees:Z.5/determinant-bundle-tensor, KTheoryLowDegrees:Z.5/vector-bundle-determinant, KTheoryLowDegrees:Z.5/rank-determinant-surjective, KTheoryLowDegrees:Z.5/picard-affine-comparison depend only on KTheoryLowDegrees Z.1–Z.3, Mathlib and Tau Ceti (none cites an S node). Proposal: make them the sub-layer 'KTheoryLowDegrees:Z.5:vector-bundles — Vector bundles and their K₀', with edges Z.5:vector-bundles → SchemeKTheoryOperations S.1, S.2, S.6, S.7 and S.6/S.7 citing these ids in place of their vocabulary; the remaining nodes KTheoryLowDegrees:Z.5/regular-curve-integral, KTheoryLowDegrees:Z.5/regular-curve-resolution-property, KTheoryLowDegrees:Z.5/regular-curve-finite-resolution, KTheoryLowDegrees:Z.5/regular-curve-cartan-iso, KTheoryLowDegrees:Z.5/skyscraper-class, KTheoryLowDegrees:Z.5/effective-divisor-class, KTheoryLowDegrees:Z.5/principal-divisor-class-vanishes, KTheoryLowDegrees:Z.5/generic-rank-kernel, KTheoryLowDegrees:Z.5/point-class-map, KTheoryLowDegrees:Z.5/line-bundle-divisorial, KTheoryLowDegrees:Z.5/curve-rank-determinant-equivalence, KTheoryLowDegrees:Z.5/curve-k-zero-ring, KTheoryLowDegrees:Z.5/dedekind-curve-comparison, KTheoryLowDegrees:Z.5/doubled-line-example form 'KTheoryLowDegrees:Z.5:curves — Regular curves', which imports S.2 and S.3, removing the unnecessary S.6 edge as confirmed by RT-AREA-ktheory-2/41 and the outgoing edges to Z.6 and EllipticKTheory E.2. The split creates no cycle: the foundation sub-layer has no prerequisite in S.
- EllipticKTheory E.2 and E.5 should cite the Z.5 and Z.6 node ids: E.2/K0-of-a-curve and E.2/K0-of-an-elliptic-curve should cite KTheoryLowDegrees:Z.5/curve-rank-determinant-equivalence and Z.5/skyscraper-class; E.2/ring-structure-of-K0-of-a-curve should cite Z.5/curve-k-zero-ring; E.2/picard-group-is-the-divisor-class-group should cite Z.5/line-bundle-divisorial, which proves the surjectivity 'Cl(X) ≅ Pic(X) for an integral noetherian scheme of dimension one with DVR local rings' that E.2 requests from JacobianChallenge layer A (RS-18 assigns the general regular-curve dictionary to Z.5; layer A covers smooth curves). E.2's hypothesis 'separated' is not needed and its remark 'separatedness matters, II.8.2.4 gives a regular non-separated scheme with K_0 ≠ G_0' does not apply in dimension one: II.8.2.4 is affine n-space with doubled origin for n ≥ 2, while every noetherian scheme of dimension ≤ 1 has affine diagonal (KTheoryLowDegrees:Z.5/regular-curve-resolution-property, Z.5/doubled-line-example). E.5/the-projective-line-and-the-projective-bundle-theorem should cite KTheoryLowDegrees:Z.6/projective-line-change-of-basis.
- rescope: The current ClassicalGroups supplier covers complex representations, whereas the Serre route requires characteristic-p algebraic representations and descent to split base fields. General flat integral-coalgebra finite hulls also exceed its scope. The pinned comodule carriers already belong to ReductiveGroups layer 1 and are reused. Keep the present low-degree exact K₀ comparison in Z.3 and import all existing comodule carriers. Rescope the existing ReductiveGroupsPartII extension with a separate foundational representation-theory stage for the missing arbitrary-field highest-weight/descent theory and, if chosen, general flat integral-coalgebra finite hulls. Its current RG2.0–RG2.5 local-structure and arithmetic-model stages do not cover these statements. The added stage must retain ReductiveGroups as the first prerequisite and specify split GL products over ℚ and every 𝔽_p, absolute simplicity/descent and formal integral characters. Existing ReductiveGroups layer 1 and ClassicalGroups layer 4 are not asserted to cover the stronger inputs. No new roadmap or stage is created by this four-file job.
- rescope: BS17 determinant descent requires homotopy-coherent connective spectra and perfect v-descent, beyond the current stated supplier surfaces. Extend the foundations Part II direction with the perfect v-site and line-bundle descent/alteration interfaces of the SF.1 request. Add the Picard 1-type and coherent truncation interface to H.5:spectra, importing general enhanced categorical foundations once. Keep graded Picard signs and determinant functors in Z.3; keep Witt-support and generic K additivity with S.3/K.4:construction. These are proposals within the existing supplier directions, not newly created stages.
- rescope: Confirmed RT-AREA-ktheory-2/41: higher λ/Adams stages are not inputs to the curve rank/determinant theorem or degree-zero comparisons. Remove S.6→Z.5 and S.7→Z.6 inherited edges. Use Z.3→Z.5 and S.2→Z.5; for Z.6 retain S.2 and S.5 and the E.2 test. The packet has no S.6/S.7 prerequisite. Keep the early vector-bundle sub-layer proposal; its foundational nodes have no S prerequisites. Outside this four-stage job, route S.6→M.4 replacement by S.6→M.6b to the motivic owner. Promotion only adds edges; an assembly/maintainer action is required to remove the old ones.
- rescope: The BS17 source route names Z.3 for the shared determinant, but scheme/support K are downstream of Z.3 in the live atlas. Direct S.2/S.3→Z.3 imports were correctly skipped by the assembler. Keep graded Picard objects, signs, projective/ring determinant and local/sheafified normalization in Z.3; place scheme perfect-complex and Witt-supported determinant comparison nodes in Z.6, importing S.2/S.3. This refines the existing Z.6 map-level comparison target and keeps the supplier construction owners unchanged. Do not add the two cyclic edges. No source result is dropped.

## Source corrections

- **KTheoryLowDegrees/E1** (Kbook.I), September 2012 Chapter I, Exercise 3.8(b), p.25; compared with combined August 2013 draft, printed p.29/PDF p.37.: With the single prime element s specified in (b), the final factor is ℤ. Every unit has a unique expression u s^m. The integer n occurs in part (a), which inverts n nonassociate primes, but is absent from the hypotheses of (b). Known correction: Corrected in the author-hosted 29 August 2013 combined draft, I Exercise 3.8(b), printed p.29: final factor ℤ.. Independent verdict: confirmed (REV-KTheoryLowDegrees--Z.3~3).
- **KTheoryLowDegrees/E2** (Kbook.II), September 2012 Chapter II, Proposition 2.6 proof, p.11; combined draft, printed p.74/PDF p.82.: The summand must be (ΛⁱP)⊗(ΛʲQ), consistent with rank(P)=m, rank(Q)=n and the following i>m or j>n vanishing argument. For P=R and Q=0, m=1,n=0, the transposed summand indexed (0,1) is nonzero despite j>n. The corrected exterior direct-sum formula gives the claimed surviving term. Known correction: new. Independent verdict: confirmed (REV-KTheoryLowDegrees--Z.3~3).
- **KTheoryLowDegrees/E3** (Kbook.II), September 2012 Chapter II, Proposition 4.9, p.32; combined draft printed p.97/PDF p.105.: Replace the sign by (−1)^{k−1}. The last line of the printed proof gives precisely this correction. At k=1, λ¹ is the identity, whereas the displayed statement gives its negative on the associated graded. Known correction: new. Independent verdict: confirmed (REV-KTheoryLowDegrees--Z.3~3).
- **KTheoryLowDegrees/E4** (Kbook.II), September 2012 Chapter II, Example 2.5.4, p.11. The author erratum locates the printed-edition correction at p.80 line 15.: For a characteristic-zero field, the number n of simple factors need not equal the number c of conjugacy classes. Add the algebraically closed hypothesis to conclude n=c and K₀(k[G])≅ℤ^c. For k=ℚ and G=C₃, ℚ[G]≅ℚ×ℚ(ζ₃), so K₀ has rank two, whereas C₃ has three conjugacy classes. Known correction: Author K-book errata, p.80 line 15, explicitly replaces c by n and adds the algebraically closed hypothesis; verified in cached author errata text. Full PDF unavailable at the linked URL.. Independent verdict: confirmed (REV-KTheoryLowDegrees--Z.3~3).
- **KTheoryLowDegrees/E5** (Kbook.II), September 2012 Chapter II, Example 4.5.4, p.29; combined draft printed p.95/PDF p.103.: For a commutative Noetherian ring of finite Krull dimension d, use rank at most d in the reduced projective representative. The asserted gamma-dimension bound at most d is unchanged. A Dedekind domain with a nonprincipal invertible ideal I has dimension one and a nonzero reduced class [I]−1 detected by determinant. Rank strictly below one would force the projective representative to be zero, contradicting that class. Known correction: new. Independent verdict: confirmed (REV-KTheoryLowDegrees--Z.3~3).
- **KTheoryLowDegrees/E6** (Cohen), Author manuscript version 11 July 2001, Lemma 1.2.20 proof, printed p.9/PDF p.23.: Require k≠0 when scaling a nonzero fractional ideal. For R=ℤ and I=ℤ, k=0 gives kI=0, which is not isomorphic to I. Every denominator-clearing scalar used in the proof can and must be chosen nonzero. Known correction: new. Independent verdict: confirmed (REV-KTheoryLowDegrees--Z.3~3).
- **KTheoryLowDegrees/E7** (Kbook.II), September 2012 Chapter II, Theorem 4.10(2)–(3) and proof, p.32; same omission in combined draft printed p.98/PDF p.106.: Restrict the single-Adams eigenspace description and its independence to integers k>1. The k=1 operation is the identity and cannot distinguish weights. Take the binomial lambda-ring K=ℤ. Its augmentation ideal is zero, so the weight-one associated graded is zero. The ψ¹-eigenspace for 1¹ is all ℚ, while the ψ²-eigenspace for 2¹ is zero. The proof also uses distinct numbers 1,k,k²,…, which fails at k=1. Known correction: new. Independent verdict: confirmed (REV-KTheoryLowDegrees--Z.3~3).
- **KTheoryLowDegrees/E8** (Kbook-published), Combined author draft dated 29 August 2013, II4.11(CC1), printed p.98/PDF p.106.: Use n>ε(p) in the dimension-vanishing axiom. A line bundle can have a nonzero first Chern class. With p a positive line element and n=1, the printed inequality would force every first Chern class to vanish. The top Chern class is allowed to be nonzero. Known correction: new. Independent verdict: confirmed (REV-KTheoryLowDegrees--Z.3~3).
- **KTheoryLowDegrees/E9** (Kbook-published), Combined author draft dated 29 August 2013, Theorem II4.10 proof, printed p.98/PDF p.106.: Use the minimal polynomial in the divisibility assertion; fix k>1 as in E7. An annihilating square-free product implies that the minimal polynomial divides that product and proves diagonalizability. It does not constrain eigenvalue multiplicities in the characteristic polynomial: for example, the identity on a two-dimensional space is annihilated by t−1 but has characteristic polynomial (t−1)². The source supplies no one-dimensionality assertion for its weight spaces, and diagonalizability needs only the minimal-polynomial conclusion. Known correction: new. Independent verdict: confirmed (REV-KTheoryLowDegrees--Z.3~3).
- **KTheoryLowDegrees/E10** (Kbook.II), September 2012 Chapter II, Example 4.11.2, p.33.: Use the convolution c_i(p+q)=Σ_{a+b=i} c_a(p)c_b(q). Only c₁ is additive in general. Extend the total Chern series multiplicatively to virtual classes. The displayed preceding axiom CC2 contains the missing mixed terms. For two copies of O(1) on projective 2-space, c₂(L⊕L)=c₁(L)² is nonzero while c₂(L)+c₂(L)=0. Known correction: new. Independent verdict: confirmed (REV-KTheoryLowDegrees--Z.3~3).
- **KTheoryLowDegrees/E11** (Kbook.II), September 2012 Chapter II, Example 4.11.2, p.33.: The rank-zero restriction is necessary for a torsion-kernel assertion about the total Chern class. A full K₀ comparison must retain rank as an additional coordinate. Any cokernel assertion must specify the multiplicative positive-degree target and its completion. Axiom CC0 makes c(n[R])=1 for every integer n. Already for the binomial lambda-ring K=ℤ, the total Chern map kills all of ℤ, so its kernel is not torsion. Known correction: new. Independent verdict: confirmed (REV-KTheoryLowDegrees--Z.3~3).
- **KTheoryLowDegrees/E12** (Kbook.II), September 2012 Chapter II, Example 4.11.2, p.33, coefficient of c_n on weight n.: For n≥1 the coefficient is (−1)^{n−1}(n−1)!. At weight one, the defining class c₁(x)=γ¹(x)=x in F¹/F² is the identity, whereas the printed coefficient is −1. Newton identities give the corrected sign in every positive weight. Known correction: new. Independent verdict: confirmed (REV-KTheoryLowDegrees--Z.3~3).
- **KTheoryLowDegrees/E13** (Kbook.II), Chapter II, Example 4.3 and Definition 4.3.1, pp. 27–28 (September 2012 chapter); the same text in the combined draft of 29 August 2013, II.4.3 and 4.3.1 (PDF pp. 100–101).: With λ_t(x) = Σ λ^k(x)t^k, the ring of Witt vectors must be normalised with unit 1 + t and (1 + rt) ∗ f(t) = f(rt) (Atiyah–Tall's Λ(K)); equivalently keep Weibel's ring W(K) with unit 1 − t and use x ↦ λ_{−t}(x) in Definition 4.3.1. The universal polynomials P_n of the Definition are those of this normalisation (P₁ = a₁b₁). λ_t(1) = 1 + t is not the stated unit 1 − t of W(K), so λ_t cannot be a ring homomorphism. With the printed product, (1 + at) ∗ (1 + bt) = f(rt) for f = 1 + bt and r = −a, that is 1 − abt, so P₁(a₁; b₁) = −a₁b₁, and the second bullet of Definition 4.3.1 would give λ¹(xy) = −xy, false in ℤ. Known correction: Author errata for GSM 145, p.101 Example 4.3: plus normalization; https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.errata.pdf (opening page read through the search index, 2026-10-06).. Independent verdict: confirmed (REV-KTheoryLowDegrees--Z.3~3).
- **KTheoryLowDegrees/E14** (Kbook.II), Chapter II, Example 4.3, p. 27 (September 2012 chapter); the same formula in the combined draft (PDF p. 101) and at printed p. 101 line −8 of GSM 145.: In the plus-normalized Witt ring of E13, the isomorphism is (r₁,r₂,…) ↦ ∏ exp(r_n tⁿ/n), as the author erratum prescribes. If the minus-normalized Witt ring is retained instead, use ∏ exp(−r_n tⁿ/n). In either convention remove the spurious constant 1 inside each exponential. exp(1 − r_n tⁿ/n) has constant term e, so the product does not lie in W(R) = 1 + tR[[t]]. Known correction: Author errata for GSM 145, p.101 line −8: exp(r_n tⁿ/n), with the plus normalization of Example 4.3; https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.errata.pdf (opening page read through the search index, 2026-10-06).. Independent verdict: confirmed (REV-KTheoryLowDegrees--Z.3~3).
- **KTheoryLowDegrees/E15** (Kbook.I), Chapter I, Exercise 3.4, hint, p. 24 (September 2012 chapter); the same hint in the combined draft, Exercise I.3.4 (PDF p. 36).: The assignment is not alternating in the entries of a single factor, so it does not define a map on (det P)^{⊗n} ⊗ (det Q)^{⊗m}. Define the isomorphism locally from bases, (e₁∧⋯∧e_m)^{⊗n} ⊗ (f₁∧⋯∧f_n)^{⊗m} ↦ ∧_{i,j}(e_i ⊗ f_j); a change of bases g, h multiplies both sides by det(g)ⁿdet(h)ᵐ (det(g ⊗ h) = det(g)ⁿdet(h)ᵐ), so the local maps glue. The statement of the exercise is correct. m = n = 2, P = Q = R² over R = ℤ with bases e, f: take the first P-factor p₁₁ ∧ p₂₁ = e₁ ∧ e₁ = 0, p₁₂ = e₂, p₂₂ = e₁ + e₂, and q₁₁ = f₁, q₁₂ = f₂, q₂₁ = f₂, q₂₂ = f₁. The input tensor is 0, but (e₁⊗f₁) ∧ (e₂⊗f₂) ∧ (e₁⊗f₂) ∧ ((e₁+e₂)⊗f₁) = ±(e₁f₁ ∧ e₁f₂ ∧ e₂f₁ ∧ e₂f₂) ≠ 0 (the 4 × 4 determinant is 1). Reading the indices the other way (P-factors p_{i1} ∧ p_{i2}) gives −1 for the analogous choice. Known correction: new. Independent verdict: confirmed (REV-KTheoryLowDegrees--Z.3~3).
- **KTheoryLowDegrees/E16** (Kbook.II), September 2012 Chapter II, Exercise 2.2(b)–(c), p. 14; same text in the combined draft of 29 August 2013, printed p. 78 (PDF p. 86).: Only f_*f^* : K₀(R) → K₀(R) is multiplication by [A] (by the projection formula of part (a)). f^*f_* : K₀(A) → K₀(A) sends [Q] to [A ⊗_R Q] and is not multiplication by [A] in general; part (c)'s claim that its kernel is killed by a power of n fails as well. Take R = ℚ and A = ℚ × ℚ, n = 2. Then K₀(A) = ℤ², K₀(R) = ℤ, f^*(m) = (m, m) and f_*(a, b) = a + b. So f^*f_*(1, 0) = (1, 1), while multiplication by [A] = 2 ∈ K₀(R) sends (1, 0) to (2, 0). The kernel of f^*f_* is {(a, −a)} ≅ ℤ, which no power of 2 annihilates. Known correction: new. Independent verdict: confirmed (REV-KTheoryLowDegrees--Z.3~3).
- **KTheoryLowDegrees/E17** (Cohen), Author manuscript of 11 July 2001, Theorem 1.2.19, printed p. 9 (PDF p. 23).: The second assertion needs n ≥ 1; a torsion-free module of rank 0 is M = 0, which is not of the form R^{n−1} ⊕ I. State: either M = 0, or n ≥ 1 and M ≃ R^{n−1} ⊕ I with I a nonzero ideal. For n = 0, R^{n−1} is undefined and M = 0; a nonzero ideal I has rank 1. The proof itself treats rank zero separately ('If the rank of M is zero, then M is torsion, and since M is torsion-free, M = {0}'). Known correction: new. Independent verdict: confirmed (REV-KTheoryLowDegrees--Z.3~3).
- **KTheoryLowDegrees/E18** (Kbook.I), September 2012 Chapter I, §3, Dedekind domains, p. 18; same text in the combined draft, printed p. 21 (PDF p. 29).: Pic(R) is the set of isomorphism classes of nonzero ideals of R. The zero ideal is an actual ideal whose isomorphism class is not a line bundle: it has rank 0. Every nonzero ideal of a Dedekind domain is invertible, and those are exactly the classes of Pic(R). Known correction: new. Independent verdict: confirmed (REV-KTheoryLowDegrees--Z.3~3).
- **KTheoryLowDegrees/E19** (Kbook.2013), II.8, proof of Proposition 8.2.1 (Nonsingular Curves), PDF p. 154, book p. 146, in the author-hosted draft of 29 August 2013: The Proposition is stated for every 1-dimensional separated regular noetherian scheme, but the affineness of X − P is justified only by an exercise in Hartshorne's chapter on curves, which works with curves of finite type over an algebraically closed field; likewise the exactness of the bottom row 0 → ℤ → Pic(X) → Pic(R) → 0 is referred to Ex. I.5.12, stated for smooth curves over a field. The conclusion stands with a different argument: by the Cartan isomorphism (Theorem 8.2) and the localisation sequence to the generic point, every rank-zero class is Σ n_y([O] − [O(−y)]) for a divisor Σ n_y y; its determinant is O(Σ n_y y); and a principal divisor has class zero in G₀ (Stacks 0FDS argument). This is the route the author mentions ('Given Theorem 8.2, this does follow from Ex. 6.10') and the one KTheoryLowDegrees:Z.5/curve-rank-determinant-equivalence follows. The cited results concern curves over a field, while the hypotheses allow any one-dimensional separated regular noetherian scheme (for example regular schemes that are neither affine nor of finite type over a field); no argument is given that X − P is affine, or that n ↦ L(nP) is injective, in that generality. The alternative proof uses only the localisation sequence, the skyscraper formula and the vanishing of principal divisors, all valid for every integral regular noetherian scheme of dimension one (separated or not). Known correction: new. Independent verdict: confirmed (REV-KTheoryLowDegrees--Z.3~3).
- **KTheoryLowDegrees/E20** (BS17.v3), arXivv3 Remark12.11 p58: Use π0 ΩBX=π1 BX. Freshly read the cited v3 passage; use the extraction correction for E20. For the discrete grouplike space Z, π1X=0 but π0ΩBZ=Z. (cc-442dc5) Reclassified to affect nothing: a misprint whose intended form, given in the correction, is fixed by the objects named in the surrounding argument; the argument goes through with it. Known correction: Previously recorded and independently confirmed as PAPER-BHATT-SCHOLZE-17/E20 by REV-PAPER-BHATT-SCHOLZE-17; scoped to arXiv v3, no published collation.. Independent verdict: confirmed (REV-KTheoryLowDegrees--Z.3~3).
- **KTheoryLowDegrees/E21** (BS17.v3), arXiv v3 p. 19, proof of Corollary 5.6: Justify the lift as written only when Ω_{R_0/F_p} is finite projective, e.g. R_0 smooth, essentially of finite type, or F-finite. For general regular R_0, reduce to the smooth case: write R_0 = colim R_λ with R_λ smooth (Popescu), and use that both K(R) and K(W(R) on R) commute with this filtered colimit. For the latter, use the p-completion argument of the proof applied to colim W(R_{λ,perf}), together with TT90 Prop. 3.20. The displayed affine coherent-cohomology argument is not a justification for the general cotangent-complex Ext obstruction. Flatness of Ω alone does not provide the finite-projective reduction needed by that argument. The proof is sound in the smooth case; extending it to arbitrary regular R₀ requires a separate smooth-approximation and supported-K continuity argument. This is a gap in the proof as written, not an exhibited nonzero lifting obstruction or a false Corollary 5.6. Known correction: Previously recorded and independently confirmed as PAPER-BHATT-SCHOLZE-17/E31 by REV-PAPER-BHATT-SCHOLZE-17; scoped to arXiv v3, no published collation.. Independent verdict: confirmed (REV-KTheoryLowDegrees--Z.3~3).
- **KTheoryLowDegrees/E22** (BS17.v3), Construction 12.5, pp. 56–57: Add the nullary case: require an isomorphism X_∅ ≅ 1 such that X_{∅⊔T} ≅ X_∅⊗X_T ≅ 1⊗X_T is the unit constraint. Equivalently, index the family by nonempty T and set X_∅ = 1, as in the naive model of Remark 12.6, where an empty tensor product is 1. A property-only fix also works: require X_∅ to be isomorphic to 1. The groupoid of pairs (X_∅ ≅ 1, φ) satisfying the associativity condition is then contractible, and associativity for (∅,∅,T) forces unit compatibility. With either fix, N(C)([0]) ≃ * and N(C)([1]) ≃ N(C). Freshly read the cited v3 passage; use the extraction correction for E54. Take S∖{s} = ∅. The data are then an object X_∅ with an isomorphism X_∅ ≅ X_∅ ⊗ X_∅ (from T = T′ = ∅), and nothing forces X_∅ ≅ 1. Counterexample: let C be the discrete symmetric monoidal groupoid of the commutative monoid {1, e}, e² = e, with all constraints identities. Both (1, id) and (e, id) satisfy every associativity and commutativity compatibility. So N(C)([0]) has two points, and the Segal condition for n = 0 (X([0]) contractible, which the paper uses on p. 56) fails. Likewise N(C)([1]) = {(1,1), (1,e), (e,e)}, which is not ≃ C. An associativity or commutativity condition on the given isomorphisms cannot repair this: stating unit compatibility needs a map X_∅ → 1, which is extra data. Segal's original version avoids the problem, because there families are functors on subsets that take disjoint unions to sums, and that forces X_∅ to be initial ([Seg74, §2, p. 299]). The case for the defence: the authors explicitly leave the compatibility to the first reading, and they present §12 as conveying meaning, not proofs. In both cases the paper uses, the literal definition already gives the right answer. For Vect(R) under ⊕, X ≅ X ⊕ X forces X = 0, uniquely. For a Picard groupoid, X_∅ is invertible, hence ≅ 1, and the groupoid of pairs (X_∅, φ) is contractible (φ corresponds to u ∈ Aut(1), and v acts by u ↦ vu). So it is an incomplete definition with a standard fix, and no result is affected. Known correction: Previously recorded and independently confirmed as PAPER-BHATT-SCHOLZE-17/E54 by REV-PAPER-BHATT-SCHOLZE-17; scoped to arXiv v3, no published collation.. Independent verdict: confirmed (REV-KTheoryLowDegrees--Z.3~3).
- **KTheoryLowDegrees/E23** (Kbook.2013), I.5.1.3(2), physical PDF p.55, book p.47, author draft 29 August 2013: Add finite presentation to condition (2). Conditions (3) and (4), which the packet actually uses, remain valid. Take A=∏_{n∈ℕ} F₂ and I=⊕_{n∈ℕ} F₂, the finite-support ideal. I is not finitely generated: finitely many generators have a common finite support. At a prime corresponding to a principal ultrafilter I_p=A_p=F₂; at any other prime all finite-support idempotents vanish after localization, so I_p=0. Thus the quasi-coherent sheaf I~ has finite free stalks everywhere. If it were finite locally free on Spec A, affine quasi-compactness would make I finite projective, a contradiction. Finitely presented sheaves with free stalks are finite locally free. The reviewed nodes use only (3)/(4), never the invalid (2). Known correction: new. Independent verdict: confirmed (REV-KTheoryLowDegrees--Z.3~3).
- **KTheoryLowDegrees/E24** (Cohen), Theorem 1.2.35, uniqueness proof, printed p.16, physical PDF p.30, author manuscript 11 July 2001: Replace the final free summand by b_{n+1}⊕⋯⊕b_m. The torsion summand and uniqueness of its invariant factors are unchanged. Take N=R as the first direct summand of M=R⊕I, with I a nonprincipal invertible ideal over a Dedekind domain. Then M/N=I, whereas the printed complement R^{m−n} is R. In a simultaneous pseudo-basis the complement is ⊕_{j>n}b_j, a projective module. This correction leaves the torsion invariant factors and theorem intact. Known correction: new. Independent verdict: confirmed (REV-KTheoryLowDegrees--Z.3~3).
- **KTheoryLowDegrees/E25** (Kbook.2013), I.5.15.1, physical PDF p.66, book p.58, author draft 29 August 2013: For a hyperplane H, its ideal sheaf I_H is O(−1); its associated divisor line O(H) is O(1). The homogeneous hyperplane equation gives 0→O(−1)→O→O_H→0 in the draft’s standard Proj twisting convention (I.5.3.1). I.5.13.1 explicitly distinguishes an ideal from its inverse divisor line. The Picard generator theorem remains true, with O(1) the positive divisor line; the packet uses O(D), not the ideal as the positive class. Known correction: new. Independent verdict: confirmed (REV-KTheoryLowDegrees--Z.3~3).
- **KTheoryLowDegrees/E26** (Kbook.2013), I.5, Weil divisors paragraph, physical PDF p.65, book p.57, author draft 29 August 2013: Separatedness gives uniqueness of a centre when a centre exists. Only valuations with a codimension-one centre identify prime divisors on X; existence is not supplied by separatedness. For X=A¹_k, the discrete valuation ord_∞ on k(t) has no centre on X: t has negative valuation. X is integral, separated and noetherian normal. Conversely each prime divisor does give the stated DVR valuation. The class-group dictionary in the packet indexes actual codimension-one points and does not use the invalid converse. Known correction: new. Independent verdict: confirmed (REV-KTheoryLowDegrees--Z.3~3).
- **KTheoryLowDegrees/E27** (Stacks), Chow Homology, tag 0FDS, Lemma 23.4 proof, physical PDF p.41, ed88ff78 compiled 14 July 2026: Reverse the two quotient classes: [O_X/fI]_k−[O_X/I]_k=div(f). Equivalently retain their order and replace div(f) by −div(f). For a DVR A=k[[t]], f=t and I=A, the printed left coefficient is length(A/A)−length(A/tA)=−1, whereas ord_A(t)=1. Both quotient-class differences map to zero in G₀ by the displayed exact sequences, so the principal-divisor vanishing theorem and its use here remain true. Known correction: new. Independent verdict: confirmed (REV-KTheoryLowDegrees--Z.3~3).
- **KTheoryLowDegrees/E28** (Stacks), Divisors, tag 0BXJ, Lemma 29.5, physical PDF p.70, ed88ff78 compiled 14 July 2026: Require n≥1; for n=0 the Picard group is Pic(R)=0 when R is a UFD. P⁰_R≃Spec R and O(m) is trivial for every m. Lemma 29.4 gives Pic(Spec R)=0, so the displayed Z→Pic(P⁰_R) cannot be injective. The cocycle proof requires at least two standard charts. The packet’s application is P¹ over a field, which satisfies n≥1. Known correction: new. Independent verdict: confirmed (REV-KTheoryLowDegrees--Z.3~3).

- **KTheoryLowDegrees/E29** (Cohen), Proposition 2.2.13 proof, printed p. 82, physical PDF p. 96, author manuscript Advanced Computational Algebraic Number Theory, 11 July 2001: For a fractional ideal first choose nonzero δ ∈ Z_L with δI integral. Apply the proof to δI and use N(δI)=N(δ)N(I), dividing the resulting element norms by N(δ). The theorem is unchanged; the literal integral β demanded for fractional I need not exist. Take L=K=ℚ and I=(1/2)ℤ. The proof requires an algebraic integer β with v₂(β)=v₂(I)=−1, which is impossible. Merely dropping β∈Z_L also leaves the earlier assertion α∈I unjustified when fractional valuations above a base prime cancel. Clearing denominators reduces all relevant valuations to nonnegative ones and repairs both steps. Known correction: new. Independent verdict: confirmed (REV-KTheoryLowDegrees--Z.3~3).
- **KTheoryLowDegrees/E30** (Stacks), Derived Categories of Schemes, tag0FDJ, Lemma 38.5 proof, physical perfect.pdf p. 99, ed88ff78 compiled 14 July 2026; current official HTML read7 October 2026: The second short exact sequence ends in 𝓕^{a+2}; write c(𝓔^•)=Σ_n(−1)^n[𝓔^n]; and use C(a)^• for the cone of the chain map a introduced in the preceding sentence. The first short exact sequence defines 𝓕^{a+1}=coker(𝓔^a→𝓔^{a+1})=Im(d^{a+1}). Thus the next is 0→𝓕^{a+1}→𝓔^{a+2}→𝓕^{a+2}→0. Alternating signs make adjacent exact terms cancel; the printed constant minus sign would give −2[𝓔] even for the contractible identity complex 𝓔→𝓔 in degrees 0, 1. The constructed chain map is named a. The surrounding argument makes all three intended corrections unambiguous, and the K₀ theorem is unaffected. Known correction: new. Independent verdict: confirmed (REV-KTheoryLowDegrees--Z.3~3).

## Suggested-file coverage

All 260 nodes have full node tags in the suggested source. The reviewed signatures, API and tests are retained, including the actual-projective determinant formula and virtual rank-zero counterexample. There are 31 explicit node-level omission contracts: one partial and 30 omitted. Their named APIs and tests remain specified where the enhanced groupoid, spectrum, support or geometric supplier carriers are unavailable. Additional outline-only interfaces identify their missing inputs at their use sites. Source inspection and matching imports are not elaboration.

Round 2 adds nine missing native API outlines, the named index-ideal localisation omission contract, and nineteen test labels, including the concrete binomial identity test. The packet and reader give the complete mathematical contracts for these declarations.

The full suggested file remains uncompiled. The 7 October 2026 `lean-check` attempt stopped before elaboration because the shared build lacks the prebuilt `TauCeti.Algebra.AlgebraicGroup.GeneralLinear.DiagonalTorus.Basic` import. No existing build matching both pins is recorded. Earlier compiled excerpts and historical whole-file receipts have their own limited scope. Every node remains implementation unchecked.

Round 3 independently confirms all prior repairs and corrects the exterior-filtration image/base-change prose, the finite determinant/γ coefficient bounds (including rank zero), seventeen test-kind labels, and the Cohen norm source locator. It adds manuscript-scoped E29 and Stacks E30 without adding nodes. The signed determinant interfaces, three supplier gaps and 31 omission contracts remain explicit.
