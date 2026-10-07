# Explicit K₂: symbols, residues and reciprocity

This roadmap develops a usable explicit theory of the second algebraic K-group. Starting from Steinberg groups and their universal central extensions, it builds unit symbols and Milnor K-theory, residues and transfers, arithmetic tame kernels and relative symbols, and the comparison with local Hilbert symbols and Brauer classes. The target is a connected library of constructions, natural maps, identities and computations: a contributor should be able to follow a symbol from an indexed group word through a valuation residue or a Kummer cup product, with its hypotheses and signs determined at every step.

The specification consists of the two packets [T.1–T.2](../packets/K2SymbolsBrauer--T.1.json) and [T.3–T.7](../packets/K2SymbolsBrauer--T.3.json), assembled below into one dependency-ordered document. Their status is **partial**. Every declaration is unchecked; source decomposition and suggested Lean signatures do not assert formalization or proof closure. The [suggested file](../suggested/K2SymbolsBrauer.lean) models the available carriers and records interfaces whose imported carriers cannot yet be stated. The [handoff](../handoff/ASM-K2SymbolsBrauer.md) collects all supply requests and ownership changes.

## Scope and boundaries

The foundational group theory covers associative unital rings, finite Steinberg rank at least three, and stabilization. Symbols of commuting units retain their commutation hypotheses; commutative rings make these automatic. Matsumoto’s presentation and the graded Milnor algebra here concern fields. The residue branch covers normalized discrete valuations, all-degree Milnor norms of finite field extensions, and reciprocity on proper regular curve models over arbitrary base fields, including inseparable residue extensions. The arithmetic rows specialize to number fields and a finite set of nonzero primes; the explicit computations include finite fields, ℤ and ℚ. The relative branch uses the source’s local-ring and Jacobson-radical hypotheses. The cohomological branch fixes an invertible coefficient integer and makes its Tate twists, primitive roots, local Artin map and archimedean factors explicit.

The boundaries follow the atlas and its link contracts. KTheoryLowDegrees U.1 supplies finite and stable general linear and elementary groups and their matrix calculus; U.4 supplies the arithmetic SK₁ theorem. GeneralAlgebraicKTheory supplies the plus space (the early K.2:plus stage), ring localization and transfers (K.3), relative homotopy fibres (K.5), and products (K.7). This roadmap owns the classical K₂ model, its comparison to π₂, and the classical tame-symbol comparison with ring localization; later low-degree, scheme and curve adapters import them. No general K-space or localization theorem is constructed a second time here.

AlgebraicCurves supplies function-field models, finite normalization in Layer 2 and the closed-point–place/residue-field dictionary in Layer 12. EllipticCurves Layer 2 supplies its divisor-evaluation setting; T.4 proves the general reciprocity theorem and its compatibility with that disjoint-support formulation. ArithmeticKTheory imports the degree-two rows and explicit ℤ/ℚ computations; its N.6 owns order certificates and the computation engine. K3BlochGroups consumes the universal-central-extension package and the degree-three Milnor map, and owns the indecomposable quotient. StableHomotopyKTheory consumes the Recognition Theorem rather than redeveloping it.

MotivicEtaleKTheory M.1 owns the Tate-twist modules and M.3 owns the general Galois symbol, étale Chern classes and arithmetic Tate theorems. T.7 supplies normalization and compatibility adapters. ClassFieldTheory Layers 5–6 provide the local invariant and arithmetic-Frobenius Artin map; Layer 10 provides the global Brauer sum, and Layer 14 provides quadratic Hilbert reciprocity. ClassicalArithmeticCompletion CA.1 owns higher power reciprocity. ProfiniteCohomology provides Kummer theory, continuous cups and restriction, while QuadraticFormInvariants provides the quadratic symbol and algebraic-Brauer/cohomological comparisons. The local all-m Hilbert-symbol ownership interface with CA.1 is an explicit maintainer question in the handoff; no circular import through T.7 supplies CA.1’s reciprocity theorem.

## Conventions

Write `[a,b] = a b a⁻¹ b⁻¹`. The finite Steinberg relations include forward chaining with coefficient `rs` and reverse chaining with coefficient `−sr`, with every distinct-index condition retained. Opposite-root commutators are not prescribed. Rank-two word models in the integer calculation are auxiliary presentations, not the rank-at-least-three Steinberg API. Splitting central extensions over `St_n(R)` for `n ≥ 5` does not itself establish centrality of `St_n(R) → E_n(R)`; any finite-rank universality consequence requires that separate input. The stable kernel has its own centrality argument.

Classical `K₂(R) = ker(St(R) → E(R))` is written multiplicatively, with identity `1`. Milnor groups are written additively, with identity `0`; the degree-two comparison uses `Additive K₂`. The Milnor tensor algebra is over ℤ on `Additive Fˣ`, quotiented by the homogeneous Steinberg ideal. In integral Milnor K-theory repeated entries need not vanish: `{a,a} = {a,−1}`, whereas `{a,−a} = 0`. Group homology uses trivial integral coefficients `Rep.trivial ℤ G ℤ`; `H₂` and extension-classifying `H²` are distinct objects. All plus-space and Hurewicz comparisons carry their chosen natural maps.

For a normalized surjective discrete valuation let `ord_v(π)=1`, write `f=πᵃu_f`, `g=πᵇu_g`, and define the roadmap’s tame symbol by

`∂_v{f,g} = (−1)ᵃᵇ · ū_fᵇ · ū_g⁻ᵃ`.

The residue map acts on valuation units. Thus `∂{u,π}=ū` and `∂{π,u}=ū⁻¹`. K-book III.6.3 uses the inverse symbol. At the 5-adic valuation, the roadmap gives `∂{5,2}=3` in `𝔽₅ˣ`, while the K-book gives `2`. Higher residues put the uniformizer **last**: `d_π(x)=λ_π(x)+∂_v(x)·Π`, and `∂{u₁,…,uₙ₋₁,π}={ū₁,…,ūₙ₋₁}`. The source’s left-coefficient residue is `∂ᴡᵇ = (−1)ⁿ⁻¹∂` on degree `n`. The residue is independent of π; the specialization is not.

The Bass–Tate direct sum ranges over finite monic irreducibles, excluding infinity. Transfers are normalized by `−∂_∞ = Σ_p N_p∂_p`, with infinity uniformizer `t⁻¹`. Restriction of residues carries the positive ramification index `e`; transfer of residues carries residue-field norms and no extra `e`. A trivially restricted valuation uses the unit-residue-zero argument, not a residue-field map with `e=0`. The finite-extension norm–residue theorem retains finite integral closure (equivalently the defectless equality in its stated setting); complete-field and curve-normalization applications must supply it. Curve reciprocity uses the regular proper normalization, without imposing smoothness over imperfect fields.

Quillen localization uses the K-book **right** product action and `∂₁[π]=+1`. Its degree-two boundary is the inverse of the roadmap tame symbol. The unit product order and the inverse adapter are part of the comparison, rather than a change in the definition of ∂. For `O_{F,S}`, the tame-kernel row uses primes **outside S**, while the relative row `O_F → O_{F,S}` uses primes **in S**. Surjectivity uses the arithmetic SK₁ input and is not asserted for every Dedekind domain.

Dennis–Stein symbols are defined when `1−rs` is a unit. The historical `1+ab` convention is `⟨−a,b⟩⁻¹` in this convention. Relative ideals are contained in the Jacobson radical; relative (D3) requires at least one of its three entries in the ideal. The classical relative group and the homotopy-fibre group are connected only through the explicit Keune–Loday comparison obligation.

For invertible `m`, the imported Galois symbol is the positive ordered cup
`h_F{a,b}=κ(a)∪κ(b) ∈ H²(F,μ_m^{⊗2})`. A primitive root ζ trivializes the twist; changing it to `ζᵘ` changes weight-j coordinates by `uʲ`, and the induced Brauer symbol by `u⁻¹`. The classical local symbol applies `Artin(a)` to an m-th root of **b**, with arithmetic Frobenius normalization. Against the root-trivialized ordered cup invariant its exponent is **−1**. The imported étale Chern class satisfies **`c₂,₂ = −h_F`** with the product convention of Soulé’s thesis. Odd-order tests are required because quadratic tests cannot detect these signs. Global reciprocity includes the real-place factor: `m=1` is trivial, `m=2` is the sign symbol, and under `μ_m ⊂ F` no real place occurs for `m>2`; complex factors are trivial.

## Sources and library baseline

The declaration inventory is inherited from the two packets at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The reviewed AUDIT-29 entries in `data/library-coverage.json` distinguish existing group presentations, group homology, valuations, place/divisor apparatus and Kummer/cup ingredients from the K₂, Milnor, localization and Tate-twist targets. A library ingredient is not an implementation of its consuming node.

Citations keep packet source identifiers. `Kbook.III.chapter` and `Weibel.KBook.III` name the same separately hosted chapter bytes; the combined K-book has a different pagination and hash. Locators always belong to the named version. Soulé’s thesis locator is not attributed to his 1979 article.

### Kbook.2013

[The K-book: An Introduction to Algebraic K-theory](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf) — Charles A. Weibel.

Version: Author-hosted combined draft dated 29 August 2013 (published as Graduate Studies in Mathematics 145, American Mathematical Society, 2013). Internal numbering (chapter.section.item) is quoted. SHA-256: `a04f53c9393b20672fab2a6818279b2f9996dbc7cf74735789ed13804b058845`.

**Read scope.**

- III.5.1-III.5.5.1: the Steinberg group, K_2, Steinberg's centre theorem, universal central extensions, the Hopf formula, the Recognition Theorem and the finite-rank splitting (PDF pp. 225-228)
- III.5.10-III.5.11.1: the star product, the Steinberg symbol, the Steinberg identity, the generation theorem and the Dennis-Stein symbols (PDF pp. 233-234)
- III.6.1-III.6.1.3: Matsumoto's theorem, K_2 of a finite field, the rational function field and the torsion kernel (PDF p. 239)
- III.7.1-III.7.3.1: Milnor K-theory, its examples, the higher tame symbols and rigidity (PDF pp. 253-254)
- IV.1.20 and Ex. IV.1.9 for the comparison with homotopy K-theory (PDF pp. 281-282)
- IV.1.7.1 and Exercise IV.1.8 (PDF pp.273,282); IV.1.10-.1 (PDF p.274); VI.4.3.2 (PDF p.490); VI.5.2.1 and VI.5.3 (PDF p.496); source edition is the author copy, not the published text.
- III.6.3 (PDF p.242) has the inverse tame-symbol convention to this roadmap; both detect {t,-1} as -1. Exercise III.7.3 (PDF p.265) explicitly states n>=2.
- re-fetched, SHA-256 matched; read III.5.3-III.5.5.1 (PDF pp. 226-228), Exercise III.5.7 (PDF p. 237), IV.1.7-IV.1.7.1 (PDF pp. 272-273) and Exercises IV.1.8-IV.1.9 (PDF p. 282).
- III.5.10-III.5.11.1: the Steinberg symbol and the Dennis-Stein symbols with their relations and presentation (PDF pp. 233-234)
- III.6.2.2-III.6.4.2: Hilbert symbols, norm-residue symbols, Moore's theorem, the tame symbol with its proof and the ramification formula, and the Bass-Tate divisibility theorems (PDF pp. 241-243)
- III.7.3-III.7.3.1: higher tame symbols, specialisation maps and rigidity (PDF p. 254)
- III.1.5.4 (PDF p. 193): a Dedekind domain with nonzero SK_1
- III.2.5 (PDF p. 202): the Bass-Milnor-Serre theorem, statement
- III.5.2.2 (PDF p. 226): K_2(Z) cyclic of order two, cited to Milnor
- III.6.1-III.6.2.1 (PDF pp. 239-240): Matsumoto, K_2 of finite fields, Lemma 6.1.4, the sign symbol
- III.6.5-III.6.5.3 (PDF p. 244): localisation for Dedekind domains, K_2(Q), function fields, Weil reciprocity on the projective line
- III Exercises 6.2 and 6.4 (PDF p. 251)
- III.7.1-III.7.6.4 (PDF pp. 253-258): Milnor K-theory, leading coefficients, Theorem 7.4 (Milnor) with Lemmas 7.4.1-7.4.2, Definitions 7.5-7.6, Weil's formula 7.5.1, the projection formula 7.5.2 and Corollary 7.5.3, Kato's theorem with Lemma 7.6.2, Corollary 7.6.3 and Proposition 7.6.4
- III Exercises 7.1-7.10 (PDF pp. 265-266)
- V.6.1-V.6.1.2 (PDF p. 414): the localization sequence and its boundary on units
- V.6.6-V.6.6.4 and V.6.8 (PDF pp. 417-420): localisation for Dedekind domains, the boundary is the tame symbol, Soulé's theorem
- V.6.12-V.6.12.1 (PDF pp. 424-425): Weil reciprocity for a projective curve (Gillet)
- III.5.7-III.5.7.1 (PDF pp. 230-231): the relative Steinberg group and the relative exact sequence
- III.5.11.1(b) (PDF p. 235) and Exercises III.5.13-III.5.14 (PDF pp. 237-238)
- III.6.9-III.6.10.4 (PDF pp. 248-251): the Galois symbol, roots of unity and Tate's comparison
- III Exercises 6.7-6.8 (PDF p. 252)
- IV.1.11 (PDF pp. 275-276): the relative groups as homotopy fibres
- V.11.9-V.11.10 (PDF p. 464): étale Chern classes on K_1 and K_2
- The author's errata list for the published edition (Wayback copy of Kbook.errata.pdf; see sourceVersions)
- V.1.2/1.2.1 (additivity) and V.3.7.2/Exercise 3.11 (base change): exact-functor justification of the field transfer base-change contract
- V.6.1.2 and V.6.6.1: degree-one boundary and right module action rechecked for revision 2


### Loeh.GroupCohomology.2019

[Group Cohomology (lecture notes, Universität Regensburg, Sommersemester 2019)](https://loeh.app.uni-regensburg.de/teaching/grouphom_ss19/lecture_notes.pdf) — Clara Löh.

Version: Author-hosted lecture notes for the summer semester 2019; printed page numbers are quoted with the PDF page (printed page + 8). SHA-256: `d4f2d819bfa85c57277db74bf749d05f03e85833c76e89eab99127f077d2cd76`.

**Read scope.**

- Theorem 1.4.1 and Corollary 1.4.6 (printed pp. 20, 23): H_1 with trivial integral coefficients is the abelianisation, and perfectness is H_1 = 0
- Theorem 1.5.1 with its proof note (printed p. 30) and Outlook 1.5.15 (printed pp. 40-41)
- Proposition 1.6.21, Remark 1.6.22 and Corollary 1.6.23 (printed pp. 55-57): the length-one free resolution over a free group and the vanishing of its homology in degrees at least two
- Theorem 3.2.12 and Remark 3.2.14 (printed pp. 123-124): the Hochschild-Serre spectral sequence and its naturality, stated without construction
- Theorem 3.2.18 with its proof (printed pp. 129-132): Hopf's formula from the Hochschild-Serre spectral sequence


### Kbook.III.chapter

[Weibel, K-book chapter III, separately hosted author chapter](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.III.pdf) — Charles A. Weibel.

Version: Separately hosted author chapter downloaded 2026-09-30; checksum and chapter-PDF pagination distinguish it from the earlier combined draft. SHA-256: `ba1bc2d25680ab25c4baadc5ab28e39d1077dc66bb12ca4e2174b6cb55f81307`.

**Read scope.**

- PDF pp.61–62: III.7.2–7.3, global Milnor groups


### Weibel.HA.Groups

[An introduction to homological algebra, Chapter6: Group Homology and Cohomology](https://math.mit.edu/~hrm/palestine/weibel/06-group_homology_and_cohomology.pdf) — Charles A.Weibel.

Version: Cambridge published chapter scan; DOI10.1017/CBO9781139644136.007; 56PDFpages, printed pp.160–215. SHA-256: `7e44c5cb4dc6201cacca2c0fd117eaaf5e7afaa51fdef177314b4cdbe15dcf95`.

**Read scope.**

- FIX-RT-AREA-ktheory-1~2, Codex codex-5ebb6f: §6.8.1–6.8.3 printed195–196/PDF36–37 text; p.196 independently rendered as image. Printed198/PDF39 Hopf computation and printed200/PDF41 perfect Hopf-extension lemma and opening of UCE existence read as text. This revision proves only the trivial-integral-coefficient five-term sequence directly from the pinned bar complex and generic exact homology sequence; it does not claim to have decomposed the full Grothendieck spectral sequence.
- Example6.8.4 printed196, read text/image: its first sentence lacks a coefficient-triviality qualification; recorded as E-central-subgroup-coefficients. Its integral-coefficient application is unaffected.


### Weibel.KBook.III

[The K-book: An introduction to algebraic K-theory, Chapter III: K1 and K2 of a ring](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.III.pdf) — Charles A. Weibel.

Version: Author's online chapter file Kbook.III.pdf; the page numbers cited are the chapter's own printed page numbers (III.6.5 is on p. 52), which differ from the combined draft's PDF pages. SHA-256: `ba1bc2d25680ab25c4baadc5ab28e39d1077dc66bb12ca4e2174b6cb55f81307`.

**Read scope.**

- III.1.7-III.1.7.1 (pp. 8-9): transfer maps on K_1, and the transfer of a finite field extension is the norm
- III.5.6-III.5.6.3 (p. 39): the finite transfer on K_2 and restriction followed by transfer
- III Exercise 5.6 (p. 46): the projection formula for the K_2 transfer
- III.6.1.4-III.6.1.6 (p. 49): K_2 of a quadratic extension and its transfer
- III.6.5-III.6.5.3 (pp. 52-53): the localisation theorem for K_2 of a Dedekind domain, K_2(Q), function fields, Weil's formula
- III.7.5-III.7.6.4 and the proof of Theorem 7.6.1 (pp. 63-66): the Milnor transfer, Weil's formula 7.5.1, Kato's theorem with Lemma 7.6.2, Corollary 7.6.3 and Proposition 7.6.4
- III Exercises 7.5-7.10 (pp. 72-73)


### Weibel.KBook.V

[The K-book: An introduction to algebraic K-theory, Chapter V: The fundamental theorems of higher K-theory](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.V.pdf) — Charles A. Weibel.

Version: Author's online chapter file Kbook.V.pdf; the page numbers cited are the chapter's own printed page numbers (V.6.6 is on p. 41). SHA-256: `52dcc8ee3a1764e5ea309c59f093ac8e2a1ea64f3b94bacc05e6a2b6125b1da8`.

**Read scope.**

- V.6.1-V.6.1.2 (p. 38): the localisation sequence for S^{-1}R and its boundary on units
- V.6.6-V.6.6.4 (pp. 41-42): localisation for Dedekind domains, the boundary is the tame symbol, and the morphism of localisation sequences for a finite extension of Dedekind domains
- V.6.7-V.6.8.1 (pp. 42-45): the split sequences for a discrete valuation ring containing a field, and Soule's theorem
- V.6.12-V.6.12.1 (p. 48): the localisation sequence of a curve and Gillet's Weil reciprocity for a projective curve


### GilleSzamuely.2006

[Central Simple Algebras and Galois Cohomology](https://www.math.ens.psl.eu/~benoist/refs/Gille-Szamuely.pdf) — Philippe Gille and Tamás Szamuely.

Version: Cambridge Studies in Advanced Mathematics 101, first edition, 2006; institutional author-hosted PDF. SHA-256: `3697582f57a11547addeb8d5d63764d788b9d670e2bd76bd7401b9f3994f1e63`.

**Read scope.**

- 7.3.6–7.3.12, pp. 198–203: arbitrary field base change, prime-degree residue argument, completion square and transitivity
- 7.4.1–7.4.4, pp. 204–206: all-degree norm–residue theorem and curve reciprocity
- Appendix A.6.4, p. 312: completion decomposition under finite integral closure; A.6.8(2), p. 313: norm valuation identity


### Milnor.1971

[Introduction to Algebraic K-Theory](https://www.math.uni-bielefeld.de/~rehmann/DML/BOOKS/milnor.ocr.djvu) — John Milnor.

Version: Annals of Mathematics Studies 72, Princeton University Press, 1971; institutional DML scan, DjVu, printed page locators. SHA-256: `41816b3a1aa683d9fc53be06fafadd22b8159f5a9062e9bf5fdb5be0b9147e25`.

**Read scope.**

- §9, Lemmas 9.1–9.10 and Theorem 9.11, pp. 71–78: monomial subgroup and its kernel
- §10, Definition 10.4, Lemmas 10.6–10.7 and Theorem 10.1/Corollary 10.2, pp. 81–92: low-rank auxiliary presentation, seven-case Silvester reduction, kernel containment and K₂(ℤ)


### Milne.CFT.4.03

[Class Field Theory](https://www.jmilne.org/math/CourseNotes/CFT.pdf) — James S. Milne.

Version: Author course notes, version 4.03, 6 August 2020. SHA-256: `50d79af78250a9f1117ad9d337e0b231704a533fc707966ed1bfa52e13d498f5`.

**Read scope.**

- III.3, Proposition 3.6(a), pp. 108–109: invariant and arithmetic local Artin map
- III.4, Steps 1–4, Theorem 4.4 and Remark 4.5, pp. 111–114: ordered Kummer cup product and Artin evaluation
- VIII.5.6, pp. 245–246: symbol-algebra convention


### Soule.Thesis.1978

[Groupes arithmétiques et K-théorie des anneaux d’entiers de corps de nombres](https://www.ihes.fr/~soule/documents/These_Christophe_Soule.pdf) — Christophe Soulé.

Version: Author-hosted typed text of the June 1978 doctoral thesis; cite thesis numbering, not the 1979 Inventiones article. SHA-256: `19bb0877616c262fcb83c9fe6ad88f98747f117f23805b6154e19174dbb659a7`.

**Read scope.**

- 2.2.1.1, pp. 34–35: finite-coefficient Galois/étale comparison
- 2.2.2.1–2.2.2.3, pp. 38–44: étale Chern maps and multiplicative formula, including its hypothesis (M)


### Stacks.Japanese

[The Stacks Project, Japanese rings](https://stacks.math.columbia.edu/tag/032N) — The Stacks Project authors.

Version: Online version read 6 October 2026; stable tags. SHA-256: `006c9c4fb36aae28dc403381cfe5600f830abe3c71dce0105fe65431e9d6944e`.

**Read scope.**

- Tags 032N, 032O and 032L: normal-hull reduction, polynomial N-2 and separable trace proof


### Pinned declaration inventory

Each entry gives its existing contribution, including the limitations of its hypotheses. Repeated references are grouped; differing contribution notes are retained.

| Declaration | Module | Contribution |
| --- | --- | --- |
| `mathlib:Abelianization` | `Mathlib/GroupTheory/Abelianization/Defs.lean` | The abelianisation G ⧸ commutator G. |
| `mathlib:Abelianization.map` | `Mathlib/GroupTheory/Abelianization/Defs.lean` | The map of abelianisations induced by a group homomorphism. |
| `mathlib:AddCircle` | `Mathlib/Topology/Instances/AddCircle/Defs.lean` | AddCircle p = 𝕜 ⧸ zmultiples p; with p = (1 : ℚ) this is Q/Z, the target of characters. |
| `mathlib:Additive` | `Mathlib/Algebra/Group/TypeTags/Basic.lean` | The additive type tag turning the unit group into a module over the integers. |
| `mathlib:Algebra.norm` | `Mathlib/RingTheory/Norm/Defs.lean` | The norm S →* R of an R-algebra (1 when S is not finite free). |
| `mathlib:Algebra.norm_eq_prod_roots` | `Mathlib/RingTheory/Norm/Transitivity.lean` | The norm of x is the product of the roots of its minimal polynomial in a splitting field, to the power [L : K⟮x⟯]. |
| `mathlib:Algebra.norm_norm` | `Mathlib/RingTheory/Norm/Transitivity.lean` | norm R (norm S a) = norm R a for a tower R → S → A with S free over R and A free over S. |
| `mathlib:AlgebraicGeometry.Scheme.ord` | `Mathlib/AlgebraicGeometry/OrderOfVanishing.lean` | The order of vanishing of f in the function field of a locally Noetherian integral scheme at a point z, with junk value 0 unless coheight z = 1. |
| `mathlib:CategoryTheory.ProjectiveResolution` | `Mathlib/CategoryTheory/Preadditive/Projective/Resolution.lean` | A projective resolution: an ℕ-indexed chain complex of projectives with a quasi-isomorphism to the object in degree zero. |
| `mathlib:CategoryTheory.ShortComplex.ShortExact.homology_exact₁` | `Mathlib/Algebra/Homology/HomologySequence.lean` | Exactness at kernel-complex homology after δ; read300–302. |
| `mathlib:CategoryTheory.ShortComplex.ShortExact.homology_exact₂` | `Mathlib/Algebra/Homology/HomologySequence.lean` | Exactness at middle-complex homology; read306–318. |
| `mathlib:CategoryTheory.ShortComplex.ShortExact.homology_exact₃` | `Mathlib/Algebra/Homology/HomologySequence.lean` | Exactness at quotient-complex homology before δ; read321–322. |
| `mathlib:CategoryTheory.ShortComplex.ShortExact.δ` | `Mathlib/Algebra/Homology/HomologySequence.lean` | Connecting homomorphism for a short exact complex of complexes at adjacent degrees; read284–290. |
| `mathlib:CategoryTheory.ShortComplex.ShortExact.δ_apply` | `Mathlib/Algebra/Homology/ConcreteCategory.lean` | A cycle lifted to the middle complex maps to the positive boundary class in the kernel complex; read103–125. |
| `mathlib:CharacterModule` | `Mathlib/Algebra/Module/CharacterModule.lean` | Characters A →+ AddCircle (1 : ℚ), i.e. homomorphisms to Q/Z. |
| `mathlib:CharacterModule.dual_surjective_of_injective` | `Mathlib/Algebra/Module/CharacterModule.lean` | Characters extend along injective maps (Q/Z is injective). |
| `mathlib:CharacterModule.eq_zero_of_character_apply` | `Mathlib/Algebra/Module/CharacterModule.lean` | An element killed by every character is zero. |
| `mathlib:DirectLimit` | `Mathlib/Order/DirectedInverseSystem.lean` | Type-level quotient of a directed system. A group structure, its homomorphism universal property and finite-representative equality must still be supplied. |
| `mathlib:DualNumber` | `Mathlib/Algebra/DualNumber.lean` | DualNumber R abbreviates TrivSqZeroExt R R. Iterating it over ZMod 3 supplies the actual ring F_3[x,y]/(x²,y²) of the relative D3 non-example. |
| `mathlib:DualNumber.eps` | `Mathlib/Algebra/DualNumber.lean` | The element TrivSqZeroExt.inr 1 of DualNumber R; eps_mul_eps and eps_pow_two in the same file assert it squares to zero. |
| `mathlib:FreeGroup` | `Mathlib/GroupTheory/FreeGroup/Basic.lean` | The free group on a type, the source of a free presentation. |
| `mathlib:FreeGroup.lift` | `Mathlib/GroupTheory/FreeGroup/Basic.lean` | Functions α → β into a group extend uniquely to homomorphisms FreeGroup α →* β; the lifting step of the Recognition Theorem. |
| `mathlib:FreeGroup.map` | `Mathlib/GroupTheory/FreeGroup/Basic.lean` | The homomorphism FreeGroup α →* FreeGroup β induced by a function α → β; it lifts a homomorphism of groups to their canonical presentations. |
| `mathlib:Function.Surjective.bijective_of_nat_card_le` | `Mathlib/SetTheory/Cardinal/Finite.lean` | A surjection from a finite set onto a set of at least the same cardinality is bijective. |
| `mathlib:Group.IsPerfect` | `Mathlib/GroupTheory/IsPerfect.lean` | Perfectness, the hypothesis of the Recognition Theorem. |
| `mathlib:Group.isPerfect_def` | `Mathlib/GroupTheory/IsPerfect.lean` | IsPerfect G ↔ commutator G = ⊤. |
| `mathlib:GroupExtension` | `Mathlib/GroupTheory/GroupExtension/Defs.lean` | Group extensions; the centrality predicate this layer needs is not part of it and is added here. |
| `mathlib:HenselianRing` | `Mathlib/RingTheory/Henselian.lean` | Rings Henselian at an ideal; Mathlib's instance IsAdicComplete.henselianRing (same file, line 170; an instance, absent from the declaration index) makes an adically complete ring Henselian at its ideal. |
| `mathlib:HomologicalComplex.HomologySequence.δ_naturality` | `Mathlib/Algebra/Homology/HomologySequenceLemmas.lean` | Naturality of δ for a morphism of short exact complexes; read35–60. |
| `mathlib:HomologicalComplex.eval_preservesLimit_of_hasKernel_f` | `Mathlib/Algebra/Homology/HomologicalComplexKernels.lean` | Evaluation preserves the kernel of a complex map whose components have kernels; read36–42. |
| `mathlib:HomotopyGroup` | `Mathlib/Topology/Homotopy/HomotopyGroup.lean` | Homotopy group of a pointed topological space, indexed by a finite coordinate TYPE N (use Fin n for degree n), not directly a natural-number argument. This supplies no Hurewicz theorem. |
| `mathlib:Ideal.mul_mem_left` | `Mathlib/RingTheory/Ideal/Defs.lean` | If b ∈ I, then a*b ∈ I; derives the relative D3 pair witnesses from the entry-in-ideal guard. |
| `mathlib:Ideal.mul_mem_right` | `Mathlib/RingTheory/Ideal/Defs.lean` | For a two-sided ideal and a ∈ I, a*b ∈ I; commutative-ring ideals have this instance. Derives the remaining relative D3 pair witnesses. |
| `mathlib:Ideal.relNorm_singleton` | `Mathlib/RingTheory/Ideal/Norm/RelNorm.lean` | For Dedekind R ⊆ S, S finite and torsion-free over R, relNorm R (span {r}) = span {Algebra.intNorm R S r}: the integral norm, which is the field norm on integral elements by Algebra.algebraMap_intNorm (IntegralRestrict.lean:410). |
| `mathlib:Ideal.sum_ramification_inertia_eq_finrank` | `Mathlib/RingTheory/RamificationInertia/Basic.lean` | For a domain R, S finite and flat over R and p a prime of R, ∑_{q over p} e(q) f(q) = Module.finrank R S — the rank of S over R, not the field degree; for a DVR and its integral closure in a finite separable extension the two agree by IsIntegralClosure.rank (Mathlib/RingTheory/DedekindDomain/IntegralClosure.lean:192). The module is RingTheory, not NumberTheory; the NumberTheory file has only the deprecated Ideal.sum_ramification_inertia. |
| `mathlib:IntermediateField.adjoinRootEquivAdjoin` | `Mathlib/FieldTheory/IntermediateField/Adjoin/Basic.lean` | AdjoinRoot (minpoly F α) ≃ₐ[F] F⟮α⟯ for α integral. |
| `mathlib:IsDedekindDomain.HeightOneSpectrum` | `Mathlib/RingTheory/DedekindDomain/Ideal/Lemmas.lean` | The nonzero prime ideals of a Dedekind domain. |
| `mathlib:IsDedekindDomain.HeightOneSpectrum.Support.finite` | `Mathlib/RingTheory/DedekindDomain/FiniteAdeleRing.lean` | An element of the fraction field of a Dedekind domain has a pole at only finitely many height-one primes; applied to f and f⁻¹ it gives finiteness of {v : ord_v f ≠ 0}. |
| `mathlib:IsDedekindDomain.HeightOneSpectrum.valuation` | `Mathlib/RingTheory/DedekindDomain/AdicValuation.lean` | The v-adic valuation on the fraction field attached to a height-one prime. |
| `mathlib:IsDiscreteValuationRing.exists_units_eq_smul_zpow_of_irreducible` | `Mathlib/RingTheory/DiscreteValuationRing/Basic.lean` | For a DVR R with fraction field K and an irreducible ϖ, every x ≠ 0 in K is u • (algebraMap ϖ)^n with u : Rˣ, n : ℤ. |
| `mathlib:IsFreeGroup` | `Mathlib/GroupTheory/FreeGroup/IsFreeGroup.lean` | A group admitting a free basis in its own universe. |
| `mathlib:IsLocalRing.ResidueField.map` | `Mathlib/RingTheory/LocalRing/ResidueField/Basic.lean` | A ring homomorphism between local rings induces a residue-field map only with an IsLocalHom instance; positivity of the valuation ramification index supplies that instance. map_residue is the compatibility used in its test. |
| `mathlib:IsPrimitiveRoot.zmodEquivZPowers` | `Mathlib/RingTheory/RootsOfUnity/PrimitiveRoots.lean` | For ζ primitive of order k, ZMod k ≃+ Additive (Subgroup.zpowers ζ). |
| `mathlib:IsPrimitiveRoot.zpowers_eq` | `Mathlib/RingTheory/RootsOfUnity/PrimitiveRoots.lean` | In a domain, the powers of a primitive k-th root of unity (as a unit) are all of rootsOfUnity k R. |
| `mathlib:Matrix.GeneralLinearGroup.transvection` | `Mathlib/LinearAlgebra/Matrix/ElementaryRowOperations.lean` | A transvection as a matrix unit for a finite index type over a COMMUTATIVE ring, with the distinct-index condition. It does not supply the general associative-ring target. |
| `mathlib:Matrix.diag2_decompose` | `Mathlib/LinearAlgebra/Matrix/SpecialLinearGroup.lean` | The decomposition of the two by two diagonal matrix diag(a, a inverse) as a product of six transvections, over a field: the matrix identity behind the lift h_ij(u). |
| `mathlib:Module.Presentation` | `Mathlib/Algebra/Module/Presentation/Basic.lean` | A presentation of a module by generators and relations, bundling relations, a solution and IsPresentation. |
| `mathlib:Module.Relations` | `Mathlib/Algebra/Module/Presentation/Basic.lean` | Generators and relations for a module: index types G, R and the relation vectors in G →₀ A. |
| `mathlib:Module.Relations.Solution` | `Mathlib/Algebra/Module/Presentation/Basic.lean` | Elements of a module satisfying the given relations. |
| `mathlib:Module.Relations.Solution.IsPresentation` | `Mathlib/Algebra/Module/Presentation/Basic.lean` | The solution is a presentation: fromQuotient is bijective. |
| `mathlib:Module.Relations.Solution.fromQuotient` | `Mathlib/Algebra/Module/Presentation/Basic.lean` | The linear map from the presented module to the target induced by a solution. |
| `mathlib:Module.Relations.Solution.surjective_fromQuotient_iff_surjective_π` | `Mathlib/Algebra/Module/Presentation/Basic.lean` | fromQuotient is onto iff the map from the free module is onto. |
| `mathlib:Module.Relations.Solution.surjective_π_iff_span_eq_top` | `Mathlib/Algebra/Module/Presentation/Basic.lean` | The map from the free module is onto iff the values of the generators span. |
| `mathlib:MonoidHom.eqLocus` | `Mathlib/Algebra/Group/Subgroup/Ker.lean` | The subgroup on which two homomorphisms agree; the carrier of the pullback of an extension. |
| `mathlib:MonoidHom.ker` | `Mathlib/Algebra/Group/Subgroup/Ker.lean` | The kernel of a group homomorphism, the kernel of a central extension. |
| `mathlib:NumberField.InfinitePlace.IsReal` | `Mathlib/NumberTheory/NumberField/InfinitePlace/Basic.lean` | A real infinite place of a number field. |
| `mathlib:NumberField.InfinitePlace.nrRealPlaces` | `Mathlib/NumberTheory/NumberField/InfinitePlace/Basic.lean` | The invariant r_1 in which the Bass-Tate answer for Milnor K-theory of a number field is stated. |
| `mathlib:NumberField.RingOfIntegers` | `Mathlib/NumberTheory/NumberField/Basic.lean` | The ring of integers of a number field. |
| `mathlib:Polynomial.degree_modByMonic_lt` | `Mathlib/Algebra/Polynomial/Div.lean` | The remainder modulo a monic q has degree less than that of q. |
| `mathlib:Polynomial.modByMonic` | `Mathlib/Algebra/Polynomial/Div.lean` | Remainder on division by a monic polynomial. |
| `mathlib:Polynomial.resultant_eq_prod_eval` | `Mathlib/RingTheory/Polynomial/Resultant/Basic.lean` | If f splits, Res(f, g) = lead(f)^n · ∏ g(α) over the roots α of f. |
| `mathlib:PresentedGroup` | `Mathlib/GroupTheory/PresentedGroup.lean` | Groups by generators and relations, the carrier of the Steinberg presentation. PresentedGroup rels = FreeGroup α modulo the normal closure of rels, with Group instance and toGroup universal property. |
| `mathlib:Rep.trivial` | `Mathlib/RepresentationTheory/Rep/Basic.lean` | Rep.trivial k G V, the trivial representation; H_n(G, Z) is groupHomology (Rep.trivial ℤ G ℤ) n, with G in Type because the homology files fix k and G in one universe. |
| `mathlib:RingQuot` | `Mathlib/Algebra/RingQuot.lean` | The ring quotient generated by a relation. It does not export a grading or the homogeneous Steinberg ideal construction. |
| `mathlib:Set.integer` | `Mathlib/RingTheory/DedekindDomain/SInteger.lean` | The S-integers of the fraction field of a Dedekind domain, for a set S of height-one primes. |
| `mathlib:Subgroup.center` | `Mathlib/GroupTheory/Subgroup/Center.lean` | The centre of a group, which Steinberg's theorem identifies with K_2. |
| `mathlib:Subgroup.map_commutator` | `Mathlib/GroupTheory/Commutator/Basic.lean` | map f ⁅H₁, H₂⁆ = ⁅map f H₁, map f H₂⁆: a surjection maps [F, F] onto [G, G]. |
| `mathlib:Sylow` | `Mathlib/GroupTheory/Sylow.lean` | Sylow p-subgroups of a group. |
| `mathlib:TensorAlgebra` | `Mathlib/LinearAlgebra/TensorAlgebra/Basic.lean` | The tensor algebra, the carrier of Milnor K-theory once applied to the units written additively. |
| `mathlib:TensorProduct.rid` | `Mathlib/LinearAlgebra/TensorProduct/Associator.lean` | M ⊗[R] R ≃ₗ[R] M, the unit isomorphism used to turn G_ab ⊗ Z into G_ab. |
| `mathlib:TrivSqZeroExt` | `Mathlib/Algebra/TrivSqZeroExt/Basic.lean` | The trivial square-zero extension R ⊕ M, the test ring of T.6. |
| `mathlib:TrivSqZeroExt.commRing` | `Mathlib/Algebra/TrivSqZeroExt/Basic.lean` | TrivSqZeroExt R M is a commutative ring for R commutative and M an R-module with the central Rᵐᵒᵖ-action. |
| `mathlib:TrivSqZeroExt.isUnit_iff_isUnit_fst` | `Mathlib/Algebra/TrivSqZeroExt/Basic.lean` | x is a unit of TrivSqZeroExt R M iff x.fst is a unit of R. |
| `mathlib:TrivSqZeroExt.kerIdeal` | `Mathlib/Algebra/TrivSqZeroExt/Ideal.lean` | The ideal 0 ⊕ M of TrivSqZeroExt R M, the kernel of fstHom. |
| `mathlib:TrivSqZeroExt.kerIdeal_sq` | `Mathlib/Algebra/TrivSqZeroExt/Ideal.lean` | kerIdeal R M ^ 2 = ⊥. |
| `mathlib:Units` | `Mathlib/Algebra/Group/Units/Defs.lean` | The unit group of a ring, the source of every symbol. The group of units of a monoid. |
| `mathlib:ValuationSubring.ker_unitGroupToResidueFieldUnits` | `Mathlib/RingTheory/Valuation/ValuationSubring.lean` | The kernel of that residue map is the principal unit group 1 + 𝔪: the kernel of Serre's map. |
| `mathlib:ValuationSubring.surjective_unitGroupToResidueFieldUnits` | `Mathlib/RingTheory/Valuation/ValuationSubring.lean` | The residue map from the units of a valuation subring to the units of its residue field is onto: surjectivity of the tame symbol and of the higher residues. |
| `mathlib:ValuationSubring.unitGroupToResidueFieldUnits` | `Mathlib/RingTheory/Valuation/ValuationSubring.lean` | The monoid homomorphism A.unitGroup →* (ResidueField A)ˣ. |
| `mathlib:ZMod` | `Mathlib/Data/ZMod/Defs.lean` | ZMod n, including ZMod 0 = Z. Useful cyclic target carriers; this is not a theorem that the multiplicative group of a finite field is cyclic. The integers modulo n, the scalar module of the trivialisations of T.7. |
| `mathlib:commutator` | `Mathlib/GroupTheory/Commutator/Basic.lean` | The commutator subgroup ⁅⊤, ⊤⁆ of a group, normal and characteristic. |
| `mathlib:commutatorElement` | `Mathlib/Algebra/Group/Commutator.lean` | The group commutator in which every Steinberg relation and every symbol is written. |
| `mathlib:groupCohomology.H2` | `Mathlib/RepresentationTheory/Homological/GroupCohomology/LowDegree.lean` | Second group cohomology, which classifies extensions with abelian kernel through the Tau Ceti factor sets. |
| `mathlib:groupHomology` | `Mathlib/RepresentationTheory/Homological/GroupHomology/Basic.lean` | Homology of the inhomogeneous chain complex of A : Rep k G; use trivial integral coefficients for the present group invariants. |
| `mathlib:groupHomology.H1` | `Mathlib/RepresentationTheory/Homological/GroupHomology/LowDegree.lean` | Degree-one homology of A : Rep k G. The vanishing/perfectness comparison still needs the trivial-integral coefficient specialization and abelianization bridge. |
| `mathlib:groupHomology.H1AddEquivOfIsTrivial` | `Mathlib/RepresentationTheory/Homological/GroupHomology/LowDegree.lean` | For a trivial representation A, H1 A ≃+ Additive (Abelianization G) ⊗[ℤ] A; with A = Z and TensorProduct.rid this is H_1(G, Z) ≅ G_ab. |
| `mathlib:groupHomology.H1CoresCoinfOfTrivial_exact` | `Mathlib/RepresentationTheory/Homological/GroupHomology/Functoriality.lean` | For S normal in G acting trivially on A, the short complex H_1(S, A) → H_1(G, A) → H_1(G/S, A) of corestriction and coinflation is exact. There is no degree-two continuation (no map H_2(G/S) → H_1(S)_G). |
| `mathlib:groupHomology.H1CoresCoinfOfTrivial_g_epi` | `Mathlib/RepresentationTheory/Homological/GroupHomology/Functoriality.lean` | In the same situation H_1(G, A) → H_1(G/S, A) is an epimorphism. |
| `mathlib:groupHomology.H1π_comp_map` | `Mathlib/RepresentationTheory/Homological/GroupHomology/Functoriality.lean` | H1π A ≫ map f φ 1 = mapCycles₁ f φ ≫ H1π B: the degree-one map on classes of 1-cycles. |
| `mathlib:groupHomology.H2` | `Mathlib/RepresentationTheory/Homological/GroupHomology/LowDegree.lean` | Degree-two homology of a representation A : Rep k G, as a ModuleCat k object. H2(G;Z) requires the trivial integral representation, not an omitted coefficient argument. |
| `mathlib:groupHomology.chainsMap` | `Mathlib/RepresentationTheory/Homological/GroupHomology/Functoriality.lean` | The chain map on the actual inhomogeneous complex, sending a tuple to its f-image and coefficients through φ; read lines58–66. |
| `mathlib:groupHomology.chainsMap_comp` | `Mathlib/RepresentationTheory/Homological/GroupHomology/Functoriality.lean` | Composition with the restriction-compatible coefficient maps; read95–101. |
| `mathlib:groupHomology.chainsMap_f_map_epi` | `Mathlib/RepresentationTheory/Homological/GroupHomology/Functoriality.lean` | Degreewise epimorphism when f is surjective and the coefficient morphism epi; read121–125. |
| `mathlib:groupHomology.chainsMap_f_single` | `Mathlib/RepresentationTheory/Homological/GroupHomology/Functoriality.lean` | Its basis-tuple evaluation; read79–82. |
| `mathlib:groupHomology.d₁₀_eq_zero_of_isTrivial` | `Mathlib/RepresentationTheory/Homological/GroupHomology/LowDegree.lean` | The degree-one differential vanishes for a trivial representation; read138–141. |
| `mathlib:groupHomology.d₂₁_single` | `Mathlib/RepresentationTheory/Homological/GroupHomology/LowDegree.lean` | Boundary of(a,b) with trivial coefficients is[b]−[ab]+[a]; read145–153. |
| `mathlib:groupHomology.d₃₂` | `Mathlib/RepresentationTheory/Homological/GroupHomology/LowDegree.lean` | The differential out of degree three in coordinates, whose image is the 2-boundaries. |
| `mathlib:groupHomology.inhomogeneousChains` | `Mathlib/RepresentationTheory/Homological/GroupHomology/Basic.lean` | The inhomogeneous (bar) chain complex, on which 2-cycles are paired with 2-cocycles. |
| `mathlib:groupHomology.map` | `Mathlib/RepresentationTheory/Homological/GroupHomology/Functoriality.lean` | The map H_n(G, A) → H_n(H, B) induced by f : G →* H and φ : A ⟶ res f B; with trivial Z coefficients and φ = 𝟙 it is H_n(f; Z). |
| `mathlib:groupHomology.mapIso` | `Mathlib/RepresentationTheory/Homological/GroupHomology/Functoriality.lean` | The isomorphism of homology groups induced by a group isomorphism and a compatible linear isomorphism of coefficients. |
| `mathlib:groupHomologyIso` | `Mathlib/RepresentationTheory/Homological/GroupHomology/Basic.lean` | groupHomology A n ≅ homology of (P ⊗ A)_G for any projective resolution P of the trivial representation k; the tool for computing H_n of a free group from a length-one resolution. |
| `mathlib:modularCyclotomicCharacter` | `Mathlib/NumberTheory/Cyclotomic/CyclotomicCharacter.lean` | For L with n n-th roots of unity, (L ≃+* L) →* (ZMod n)ˣ with g(t) = t^(χ g) on μₙ (modularCyclotomicCharacter.spec). |
| `mathlib:rootsOfUnity` | `Mathlib/RingTheory/RootsOfUnity/Basic.lean` | The subgroup {ζ : Mˣ \| ζ^k = 1}, the target μ_m of the norm residue symbol. |
| `mathlib:rootsOfUnity_one` | `Mathlib/RingTheory/RootsOfUnity/Basic.lean` | rootsOfUnity 1 M = ⊥; the same file supplies Subsingleton (rootsOfUnity 1 M), so every first-root-valued symbol and finite-place family is 1. |
| `mathlib:subgroupIsFreeOfIsFree` | `Mathlib/GroupTheory/FreeGroup/NielsenSchreier.lean` | Nielsen-Schreier: a subgroup of a free group is free. |
| `tauceti:IsDedekindDomain.integerHeightOneSpectrumEquiv` | `TauCeti/RingTheory/DedekindDomain/SInteger/Spectrum.lean` | For a Dedekind domain R with fraction field K and a set S of height-one primes, {v : HeightOneSpectrum R // v ∉ S} ≃ HeightOneSpectrum (S.integer K): the primes of the S-integers are exactly the primes of R outside S. The declaration is in namespace IsDedekindDomain, not TauCeti. |
| `tauceti:Matrix.SpecialLinearGroup.diag2nUnit_decompose` | `TauCeti/LinearAlgebra/Matrix/SpecialLinearGroup/Diagonal.lean` | The same decomposition at two coordinates of a larger matrix over a commutative ring, which is the form the stable symbol needs. |
| `tauceti:TauCeti.ContCohomology.explicitCup11` | `TauCeti/RepresentationTheory/Homological/ContCohomology/Cup/Product.lean` | The (1,1) cup H¹(G, M) →+ H¹(G, N) →+ H²(G, P) for a G-equivariant, jointly continuous biadditive pairing M →+ N →+ P, on explicit continuous cochains. |
| `tauceti:TauCeti.ContCohomology.explicitCup11_eq_neg_flip` | `TauCeti/RepresentationTheory/Homological/ContCohomology/Cup/Product.lean` | explicitCup11 μ a b = −explicitCup11 μ.flip b a on classes. |
| `tauceti:TauCeti.Divisor.eval` | `TauCeti/FieldTheory/FunctionField/Divisor/Eval.lean` | f(D) ∈ kˣ for a divisor D and f ∈ Fˣ, the product over the support of N_{k(P)/k}(f(P))^{coeff D P}, with local factor 1 where f is not a unit; classical exactly on admissible divisors. |
| `tauceti:TauCeti.Divisor.eval_eq_prod_normResidue` | `TauCeti/FieldTheory/FunctionField/Divisor/Eval.lean` | For f a unit at every place of D, f(D) = ∏_{P ∈ supp D} N(f(P))^{n_P}. |
| `tauceti:TauCeti.Divisor.isUnitAtSupport_iff_disjoint` | `TauCeti/FieldTheory/FunctionField/Divisor/Eval.lean` | For hF : IsFunctionField k F, a divisor D and f ∈ Fˣ: IsUnitAtSupport D f ↔ Disjoint D.support (principal hF f).support. |
| `tauceti:TauCeti.Divisor.principal` | `TauCeti/FieldTheory/FunctionField/Divisor/Principal.lean` | The principal divisor div z = Σ_P ord_P(z)·P of a nonzero function. |
| `tauceti:TauCeti.FactorSet.exists_cohomologyClass_eq` | `TauCeti/GroupTheory/GroupExtension/Cohomology.lean` | Every class of H²(G, M) is the class of a factor set (G M : Type). |
| `tauceti:TauCeti.FactorSet.groupExtension` | `TauCeti/GroupTheory/GroupExtension/Of/FactorSet.lean` | The group extension 1 → M → E_α → G → 1 determined by a factor set. |
| `tauceti:TauCeti.FactorSet.inl_range_le_center` | `TauCeti/GroupTheory/GroupExtension/Of/FactorSet.lean` | That an extension built from a trivial-action factor set is central, the nearest pinned statement about central extensions. |
| `tauceti:TauCeti.FactorSet.nonempty_splitting_iff_cohomologyClass_eq_zero` | `TauCeti/GroupTheory/GroupExtension/Cohomology.lean` | The extension of a factor set splits exactly when its class in H² vanishes. |
| `tauceti:TauCeti.GroupExtension.nonempty_equiv_iff_cohomologyClass_factorSet_eq` | `TauCeti/GroupTheory/GroupExtension/Cohomology.lean` | Equivalence iff the factor-set cohomology classes agree, for extensions inducing a FIXED action and chosen normalized sections. This is not by itself a classification of all central extensions; the trivial-action bridge must be proved. |
| `tauceti:TauCeti.HenselianRing.exists_pow_eq_and_sub_one_mem_of_sub_one_mem` | `TauCeti/RingTheory/Henselian.lean` | In a ring Henselian at J, for n invertible and I ≤ J, every w ≡ 1 mod I is a^n with a ≡ 1 mod I: q-divisibility of the principal units in rigidity. |
| `tauceti:TauCeti.IsIntegralClosure.finite_mvPolynomial_of_isPurelyInseparable` | `TauCeti/RingTheory/IntegralClosure/PurelyInseparable.lean` | For a field k, P = k[X_1, …, X_r] with fraction field K and a finite purely inseparable extension M/K, every integral closure of P in M is a finite P-module (Stacks 032O); no separability is assumed. The declaration is in namespace TauCeti. |
| `tauceti:TauCeti.KummerCoeff` | `TauCeti/FieldTheory/GaloisCohomology/Coefficients.lean` | μₙ = rootsOfUnity n Kˢ written additively, a discrete G_K-module (kummerCoeff_continuousSMul): the weight-one twist, fixed once as the Kummer coefficient module. |
| `tauceti:TauCeti.Place.adicOfIrreducibleResidueFieldEquiv` | `TauCeti/FieldTheory/FunctionField/Place/RatFunc/Basic.lean` | The residue field of the finite place of an irreducible q ∈ k[X] is k[X]/(q), as a k-algebra equivalence. |
| `tauceti:TauCeti.Place.finite_setOf_ord_ne_zero` | `TauCeti/FieldTheory/FunctionField/Place/Zeros.lean` | {P \| P.ord x ≠ 0} is finite, under the hypothesis IsFunctionField k F (F finite over k(x) for a transcendental x): the function-field case only. |
| `tauceti:TauCeti.Place.finite_setOf_restrict_eq` | `TauCeti/FieldTheory/FunctionField/Place/Extension/Fibre.lean` | A place has only finitely many extensions to a finite extension of function fields. |
| `tauceti:TauCeti.Place.heightOneSpectrumEquiv` | `TauCeti/FieldTheory/FunctionField/AffineModel/Prime.lean` | The bijection between places finite on an affine model R and HeightOneSpectrum R. The matching of valuations and residue degrees is not part of it: it is TauCeti.Place.valuation_ofPrime (Prime.lean:100) and TauCeti.Place.degree_ofPrime (Prime.lean:286) in the same file. |
| `tauceti:TauCeti.Place.inftyResidueFieldEquiv` | `TauCeti/FieldTheory/FunctionField/Place/RatFunc/Basic.lean` | The residue field at infinity is k. |
| `tauceti:TauCeti.Place.isUniformizer_adicOfIrreducible` | `TauCeti/FieldTheory/FunctionField/Place/RatFunc/Basic.lean` | An irreducible polynomial is a uniformiser of its own finite place of k(x). |
| `tauceti:TauCeti.Place.isUniformizer_infty` | `TauCeti/FieldTheory/FunctionField/Place/RatFunc/Basic.lean` | x⁻¹ is a uniformiser at the place at infinity. |
| `tauceti:TauCeti.Place.normResidue` | `TauCeti/FieldTheory/FunctionField/Place/Residue.lean` | The norm to k of the residue of a function that is a unit at a place (Algebra.normUnits of residueUnit). |
| `tauceti:TauCeti.Place.ord_infty` | `TauCeti/FieldTheory/FunctionField/Place/RatFunc/Basic.lean` | The order at infinity is minus the degree: ord_∞ f = −intDegree f. |
| `tauceti:TauCeti.Place.ratFuncEquiv` | `TauCeti/FieldTheory/FunctionField/Place/RatFunc/Basic.lean` | Option (HeightOneSpectrum k[X]) ≃ Place k (RatFunc k), none ↦ the place at infinity. |
| `tauceti:TauCeti.Place.residueUnit` | `TauCeti/FieldTheory/FunctionField/Place/Residue.lean` | The residue at a place P of f ∈ Fˣ with P.ord f = 0, as a unit of the residue field; it is unitGroupToResidueFieldUnits at f. |
| `tauceti:TauCeti.Place.restrict` | `TauCeti/FieldTheory/FunctionField/Place/Extension/Basic.lean` | The place of F/k that a place of a finite extension F′/k′ lies over. |
| `tauceti:TauCeti.Place.sum_ramificationIdx_mul_relativeDegree_eq_finrank_of_isSeparable` | `TauCeti/FieldTheory/FunctionField/Place/Extension/Fundamental.lean` | For a finite separable extension F'/F of function fields and a place P of F/k, Σ_{P'\|P} e(P'\|P)·f(P'\|P) = [F' : F]; the file records that separability is used only for the finiteness of the integral closure. |
| `tauceti:TauCeti.commutatorElement_transvectionUnit` | `TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/Transvection.lean` | Only the forward chaining relation [e_ij(c),e_jl(d)]=e_il(c*d), for pairwise distinct i,j,l over CommRing A. Separate declarations supply the other cases. |
| `tauceti:TauCeti.commutatorElement_transvectionUnit_reverse` | `TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/Transvection.lean` | Reverse chaining relation [e_ij(c),e_ki(d)]=e_kj(-(d*c)), with pairwise distinct i,j,k, over CommRing A. |
| `tauceti:TauCeti.commute_transvectionUnit` | `TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/Transvection.lean` | Commutativity for nonchaining index pairs i != j, k != l, j != k, l != i, over CommRing A. |
| `tauceti:TauCeti.ker_kummerMap` | `TauCeti/FieldTheory/GaloisCohomology/Kummer.lean` | The kernel of kummerMap is the subgroup of n-th powers. |
| `tauceti:TauCeti.kummerMap` | `TauCeti/FieldTheory/GaloisCohomology/Kummer.lean` | For n invertible in K, the Kummer map Kˣ →* Multiplicative (H¹(G_K, KummerCoeff K n)), the connecting map of the Kummer sequence; surjectivity (Hilbert 90) is not in the library. |
| `tauceti:TauCeti.transvectionUnit` | `TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/Transvection.lean` | Transvection unit over CommRing A with finite index type and DecidableEq; the general associative-ring bridge remains open. |
| `tauceti:TauCeti.transvectionUnit_add` | `TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/Transvection.lean` | Additivity e_ij(c+d)=e_ij(c)*e_ij(d), over CommRing A with finite indices and i != j. |
| `tauceti:Valuation.exists_eq_zpow_mul_unit_of_surjective` | `TauCeti/RingTheory/Valuation/Discrete/Order.lean` | For a surjective v : F → ℤᵐ⁰ with nontrivial value group and a uniformiser t, every f ≠ 0 is t^(ord v f) times a unit of the valuation subring. The declaration is in namespace Valuation, not TauCeti. |
| `tauceti:Valuation.exists_isUniformizer_of_surjective` | `TauCeti/RingTheory/Valuation/Discrete/Order.lean` | A surjective ℤᵐ⁰-valued valuation has a uniformiser, the t fixed in the definition of the tame symbol. |
| `tauceti:Valuation.isUnit_iff_ord_eq_zero` | `TauCeti/RingTheory/Valuation/Discrete/Order.lean` | An element of the valuation subring is a unit iff its order is zero: the uniformiser-free form of the tame symbol and the change unit t′/t. |
| `tauceti:Valuation.mem_maximalIdeal_iff_ord_pos` | `TauCeti/RingTheory/Valuation/Discrete/Order.lean` | An element is in the maximal ideal iff its order is positive: the cases of the Steinberg relation. |
| `tauceti:Valuation.ord` | `TauCeti/RingTheory/Valuation/Discrete/Order.lean` | The additive order ord_v f = −log v(f) of a ℤᵐ⁰-valued valuation (junk value 0 at 0), the exponent in the tame symbol. |
| `tauceti:Valuation.ord_add_eq_min_of_ord_ne` | `TauCeti/RingTheory/Valuation/Discrete/Order.lean` | The strict triangle equality ord(f + g) = min(ord f, ord g) when the orders differ: ord(1 − r) = ord r for ord r < 0. |
| `tauceti:Valuation.ord_mul` | `TauCeti/RingTheory/Valuation/Discrete/Order.lean` | ord_v(fg) = ord_v f + ord_v g for f, g ≠ 0: bimultiplicativity and the homomorphism d_t. |
| `tauceti:Valuation.ord_zpow` | `TauCeti/RingTheory/Valuation/Discrete/Order.lean` | ord_v(f^n) = n·ord_v f, used to see that f^{ord g}g^{−ord f} has order zero. |
| `tauceti:WeierstrassCurve.Affine.isFunctionField` | `TauCeti/AlgebraicGeometry/EllipticCurve/Affine/FunctionField/Finrank.lean` | For a Weierstrass curve W over a field F, TauCeti.IsFunctionField F W.FunctionField: the function field of W is an algebraic function field of one variable over F (no ellipticity hypothesis). |

## Layers and reading order

The following order respects the internal node graph. T.1, T.2 and T.3 are umbrellas; their sub-stages carry declarations. T.6 can be read after the Steinberg and unit-symbol branch, independently of arithmetic localization. The T.7 Chern adapter also uses T.1:plus and the imported K.7 product.

| Stage | Nodes | Planets | Coverage |
| --- | ---: | ---: | --- |
| [T.1:classical](#stage-k2symbolsbrauer-t-1-classical) — Steinberg groups and universal central extensions | 43 | 6 | partial |
| [T.1:plus](#stage-k2symbolsbrauer-t-1-plus) — Classical K₂ and the plus construction | 2 | 2 | partial |
| [T.2:symbols](#stage-k2symbolsbrauer-t-2-symbols) — Unit symbols and Milnor K-theory | 19 | 4 | partial |
| [T.2:graded-map](#stage-k2symbolsbrauer-t-2-graded-map) — The graded map to Quillen K-theory | 2 | 1 | partial |
| [T.3:symbols](#stage-k2symbolsbrauer-t-3-symbols) — Tame symbols and higher residues | 13 | 4 | source_decomposed |
| [T.4](#stage-k2symbolsbrauer-t-4) — Rational function fields, norms and reciprocity | 26 | 4 | partial |
| [T.3:localization-comparison](#stage-k2symbolsbrauer-t-3-localization-comparison) — Ring localization and Quillen transfers | 4 | 1 | partial |
| [T.5](#stage-k2symbolsbrauer-t-5) — Tame kernels and explicit arithmetic | 11 | 3 | partial |
| [T.6](#stage-k2symbolsbrauer-t-6) — Dennis–Stein symbols and relative groups | 6 | 2 | partial |
| [T.7](#stage-k2symbolsbrauer-t-7) — Hilbert symbols, Brauer classes and Chern compatibility | 8 | 1 | partial |

Total: 134 declarations, 231 API items, 150 unit tests and 28 planets. These counts describe the current packets, not implemented declarations.

### Internal cross-part contracts

Every cross-part node prerequisite links to its declaration below. The Dennis–Stein word consumes the exact diagonal-word and diagonal-lift nodes. One stage-level import remains without a supplying node: T.5’s monomial-kernel/unit-symbol theorem, recorded as `G-monomial-kernel` in the consuming T.3 packet. The semilocal generation theorem does not cover ℤ.

| Consumer | Exact prerequisite |
| --- | --- |
| [`K2SymbolsBrauer:T.3/ramification-formula`](#node-k2symbolsbrauer-t-3-ramification-formula) | [`K2SymbolsBrauer:T.2/milnor-k-theory`](#node-k2symbolsbrauer-t-2-milnor-k-theory) |
| [`K2SymbolsBrauer:T.3/higher-milnor-residues`](#node-k2symbolsbrauer-t-3-higher-milnor-residues) | [`K2SymbolsBrauer:T.2/milnor-k-theory`](#node-k2symbolsbrauer-t-2-milnor-k-theory) |
| [`K2SymbolsBrauer:T.3/localization-boundary`](#node-k2symbolsbrauer-t-3-localization-boundary) | [`K2SymbolsBrauer:T.2/matsumoto`](#node-k2symbolsbrauer-t-2-matsumoto) |
| [`K2SymbolsBrauer:T.3/localization-boundary`](#node-k2symbolsbrauer-t-3-localization-boundary) | [`K2SymbolsBrauer:T.2/graded-map`](#node-k2symbolsbrauer-t-2-graded-map) |
| [`K2SymbolsBrauer:T.3/dedekind-localization-boundary`](#node-k2symbolsbrauer-t-3-dedekind-localization-boundary) | [`K2SymbolsBrauer:T.1/k2-pi2`](#node-k2symbolsbrauer-t-1-k2-pi2) |
| [`K2SymbolsBrauer:T.3/milnor-quillen-transfer-comparison`](#node-k2symbolsbrauer-t-3-milnor-quillen-transfer-comparison) | [`K2SymbolsBrauer:T.2/matsumoto`](#node-k2symbolsbrauer-t-2-matsumoto) |
| [`K2SymbolsBrauer:T.3/milnor-quillen-transfer-comparison`](#node-k2symbolsbrauer-t-3-milnor-quillen-transfer-comparison) | [`K2SymbolsBrauer:T.1/k2-pi2`](#node-k2symbolsbrauer-t-1-k2-pi2) |
| [`K2SymbolsBrauer:T.3/tame-symbol-hom`](#node-k2symbolsbrauer-t-3-tame-symbol-hom) | [`K2SymbolsBrauer:T.2/milnor-k-theory`](#node-k2symbolsbrauer-t-2-milnor-k-theory) |
| [`K2SymbolsBrauer:T.3/tame-symbol-hom`](#node-k2symbolsbrauer-t-3-tame-symbol-hom) | [`K2SymbolsBrauer:T.2/matsumoto`](#node-k2symbolsbrauer-t-2-matsumoto) |
| [`K2SymbolsBrauer:T.3/serre-residue-algebra`](#node-k2symbolsbrauer-t-3-serre-residue-algebra) | [`K2SymbolsBrauer:T.2/milnor-k-theory`](#node-k2symbolsbrauer-t-2-milnor-k-theory) |
| [`K2SymbolsBrauer:T.3/serre-residue-algebra`](#node-k2symbolsbrauer-t-3-serre-residue-algebra) | [`K2SymbolsBrauer:T.2/milnor-alternating`](#node-k2symbolsbrauer-t-2-milnor-alternating) |
| [`K2SymbolsBrauer:T.3/serre-map-steinberg`](#node-k2symbolsbrauer-t-3-serre-map-steinberg) | [`K2SymbolsBrauer:T.2/milnor-k-theory`](#node-k2symbolsbrauer-t-2-milnor-k-theory) |
| [`K2SymbolsBrauer:T.3/serre-map-steinberg`](#node-k2symbolsbrauer-t-3-serre-map-steinberg) | [`K2SymbolsBrauer:T.2/milnor-alternating`](#node-k2symbolsbrauer-t-2-milnor-alternating) |
| [`K2SymbolsBrauer:T.3/serre-map-kernel`](#node-k2symbolsbrauer-t-3-serre-map-kernel) | [`K2SymbolsBrauer:T.2/milnor-k-theory`](#node-k2symbolsbrauer-t-2-milnor-k-theory) |
| [`K2SymbolsBrauer:T.3/serre-map-kernel`](#node-k2symbolsbrauer-t-3-serre-map-kernel) | [`K2SymbolsBrauer:T.2/milnor-alternating`](#node-k2symbolsbrauer-t-2-milnor-alternating) |
| [`K2SymbolsBrauer:T.3/higher-ramification-formula`](#node-k2symbolsbrauer-t-3-higher-ramification-formula) | [`K2SymbolsBrauer:T.2/milnor-k-theory`](#node-k2symbolsbrauer-t-2-milnor-k-theory) |
| [`K2SymbolsBrauer:T.4/bass-tate-sequence`](#node-k2symbolsbrauer-t-4-bass-tate-sequence) | [`K2SymbolsBrauer:T.2/milnor-k-theory`](#node-k2symbolsbrauer-t-2-milnor-k-theory) |
| [`K2SymbolsBrauer:T.4/leading-coefficient-splitting`](#node-k2symbolsbrauer-t-4-leading-coefficient-splitting) | [`K2SymbolsBrauer:T.2/milnor-k-theory`](#node-k2symbolsbrauer-t-2-milnor-k-theory) |
| [`K2SymbolsBrauer:T.4/degree-reduction`](#node-k2symbolsbrauer-t-4-degree-reduction) | [`K2SymbolsBrauer:T.2/milnor-k-theory`](#node-k2symbolsbrauer-t-2-milnor-k-theory) |
| [`K2SymbolsBrauer:T.4/degree-reduction`](#node-k2symbolsbrauer-t-4-degree-reduction) | [`K2SymbolsBrauer:T.2/milnor-alternating`](#node-k2symbolsbrauer-t-2-milnor-alternating) |
| [`K2SymbolsBrauer:T.4/degree-reduction`](#node-k2symbolsbrauer-t-4-degree-reduction) | [`K2SymbolsBrauer:T.2/symbol-consequences`](#node-k2symbolsbrauer-t-2-symbol-consequences) |
| [`K2SymbolsBrauer:T.4/residue-section`](#node-k2symbolsbrauer-t-4-residue-section) | [`K2SymbolsBrauer:T.2/milnor-k-theory`](#node-k2symbolsbrauer-t-2-milnor-k-theory) |
| [`K2SymbolsBrauer:T.4/prime-to-p-closure`](#node-k2symbolsbrauer-t-4-prime-to-p-closure) | [`K2SymbolsBrauer:T.2/milnor-k-theory`](#node-k2symbolsbrauer-t-2-milnor-k-theory) |
| [`K2SymbolsBrauer:T.4/p-closed-generation`](#node-k2symbolsbrauer-t-4-p-closed-generation) | [`K2SymbolsBrauer:T.2/milnor-alternating`](#node-k2symbolsbrauer-t-2-milnor-alternating) |
| [`K2SymbolsBrauer:T.5/unramified-subgroup`](#node-k2symbolsbrauer-t-5-unramified-subgroup) | [`K2SymbolsBrauer:T.2/symbols-generate`](#node-k2symbolsbrauer-t-2-symbols-generate) |
| [`K2SymbolsBrauer:T.5/unramified-subgroup`](#node-k2symbolsbrauer-t-5-unramified-subgroup) | [`K2SymbolsBrauer:T.1/k2-definition`](#node-k2symbolsbrauer-t-1-k2-definition) |
| [`K2SymbolsBrauer:T.5/s-integer-tame-kernel-sequence`](#node-k2symbolsbrauer-t-5-s-integer-tame-kernel-sequence) | [`K2SymbolsBrauer:T.2/k2-finite-field`](#node-k2symbolsbrauer-t-2-k2-finite-field) |
| [`K2SymbolsBrauer:T.5/s-integer-tame-kernel-sequence`](#node-k2symbolsbrauer-t-5-s-integer-tame-kernel-sequence) | [`K2SymbolsBrauer:T.1/k2-pi2`](#node-k2symbolsbrauer-t-1-k2-pi2) |
| [`K2SymbolsBrauer:T.5/tame-kernel-sequence`](#node-k2symbolsbrauer-t-5-tame-kernel-sequence) | [`K2SymbolsBrauer:T.2/k2-finite-field`](#node-k2symbolsbrauer-t-2-k2-finite-field) |
| [`K2SymbolsBrauer:T.5/real-sign-symbol`](#node-k2symbolsbrauer-t-5-real-sign-symbol) | [`K2SymbolsBrauer:T.2/matsumoto`](#node-k2symbolsbrauer-t-2-matsumoto) |
| [`K2SymbolsBrauer:T.5/real-sign-symbol`](#node-k2symbolsbrauer-t-5-real-sign-symbol) | [`K2SymbolsBrauer:T.1/k2-definition`](#node-k2symbolsbrauer-t-1-k2-definition) |
| [`K2SymbolsBrauer:T.5/real-sign-symbol`](#node-k2symbolsbrauer-t-5-real-sign-symbol) | [`K2SymbolsBrauer:T.2/milnor-examples`](#node-k2symbolsbrauer-t-2-milnor-examples) |
| [`K2SymbolsBrauer:T.5/k2-of-the-integers`](#node-k2symbolsbrauer-t-5-k2-of-the-integers) | [`K2SymbolsBrauer:T.2/steinberg-symbol`](#node-k2symbolsbrauer-t-2-steinberg-symbol) |
| [`K2SymbolsBrauer:T.5/k2-of-the-integers`](#node-k2symbolsbrauer-t-5-k2-of-the-integers) | [`K2SymbolsBrauer:T.1/k2-definition`](#node-k2symbolsbrauer-t-1-k2-definition) |
| [`K2SymbolsBrauer:T.5/k2-of-the-rationals`](#node-k2symbolsbrauer-t-5-k2-of-the-rationals) | [`K2SymbolsBrauer:T.2/k2-finite-field`](#node-k2symbolsbrauer-t-2-k2-finite-field) |
| [`K2SymbolsBrauer:T.5/k2-of-the-rationals`](#node-k2symbolsbrauer-t-5-k2-of-the-rationals) | [`K2SymbolsBrauer:T.1/k2-definition`](#node-k2symbolsbrauer-t-1-k2-definition) |
| [`K2SymbolsBrauer:T.6/dennis-stein-symbol`](#node-k2symbolsbrauer-t-6-dennis-stein-symbol) | [`K2SymbolsBrauer:T.1/steinberg-group-finite-rank`](#node-k2symbolsbrauer-t-1-steinberg-group-finite-rank) |
| [`K2SymbolsBrauer:T.6/dennis-stein-symbol`](#node-k2symbolsbrauer-t-6-dennis-stein-symbol) | [`K2SymbolsBrauer:T.1/stabilisation`](#node-k2symbolsbrauer-t-1-stabilisation) |
| [`K2SymbolsBrauer:T.6/dennis-stein-symbol`](#node-k2symbolsbrauer-t-6-dennis-stein-symbol) | [`K2SymbolsBrauer:T.1/k2-definition`](#node-k2symbolsbrauer-t-1-k2-definition) |
| [`K2SymbolsBrauer:T.6/dennis-stein-symbol`](#node-k2symbolsbrauer-t-6-dennis-stein-symbol) | [`K2SymbolsBrauer:T.1/k2-is-centre`](#node-k2symbolsbrauer-t-1-k2-is-centre) |
| [`K2SymbolsBrauer:T.6/dennis-stein-symbol`](#node-k2symbolsbrauer-t-6-dennis-stein-symbol) | [`K2SymbolsBrauer:T.2/steinberg-symbol`](#node-k2symbolsbrauer-t-2-steinberg-symbol) |
| [`K2SymbolsBrauer:T.6/dennis-stein-symbol`](#node-k2symbolsbrauer-t-6-dennis-stein-symbol) | [`K2SymbolsBrauer:T.2:symbols/diagonal-lift-words`](#node-k2symbolsbrauer-t-2-symbols-diagonal-lift-words) |
| [`K2SymbolsBrauer:T.6/dennis-stein-symbol`](#node-k2symbolsbrauer-t-6-dennis-stein-symbol) | [`K2SymbolsBrauer:T.2:symbols/diagonal-lift`](#node-k2symbolsbrauer-t-2-symbols-diagonal-lift) |
| [`K2SymbolsBrauer:T.6/dennis-stein-presentation`](#node-k2symbolsbrauer-t-6-dennis-stein-presentation) | [`K2SymbolsBrauer:T.2/matsumoto`](#node-k2symbolsbrauer-t-2-matsumoto) |
| [`K2SymbolsBrauer:T.6/dennis-stein-relations`](#node-k2symbolsbrauer-t-6-dennis-stein-relations) | [`K2SymbolsBrauer:T.2/steinberg-symbol`](#node-k2symbolsbrauer-t-2-steinberg-symbol) |
| [`K2SymbolsBrauer:T.6/dennis-stein-relations`](#node-k2symbolsbrauer-t-6-dennis-stein-relations) | [`K2SymbolsBrauer:T.2/steinberg-identity`](#node-k2symbolsbrauer-t-2-steinberg-identity) |
| [`K2SymbolsBrauer:T.6/relative-steinberg-group`](#node-k2symbolsbrauer-t-6-relative-steinberg-group) | [`K2SymbolsBrauer:T.1/steinberg-group-finite-rank`](#node-k2symbolsbrauer-t-1-steinberg-group-finite-rank) |
| [`K2SymbolsBrauer:T.6/relative-steinberg-group`](#node-k2symbolsbrauer-t-6-relative-steinberg-group) | [`K2SymbolsBrauer:T.1/stabilisation`](#node-k2symbolsbrauer-t-1-stabilisation) |
| [`K2SymbolsBrauer:T.6/relative-steinberg-group`](#node-k2symbolsbrauer-t-6-relative-steinberg-group) | [`K2SymbolsBrauer:T.1/k2-definition`](#node-k2symbolsbrauer-t-1-k2-definition) |
| [`K2SymbolsBrauer:T.7/symbol-formula`](#node-k2symbolsbrauer-t-7-symbol-formula) | [`K2SymbolsBrauer:T.2/matsumoto`](#node-k2symbolsbrauer-t-2-matsumoto) |
| [`K2SymbolsBrauer:T.7/classical-local-symbols`](#node-k2symbolsbrauer-t-7-classical-local-symbols) | [`K2SymbolsBrauer:T.2/matsumoto`](#node-k2symbolsbrauer-t-2-matsumoto) |
| [`K2SymbolsBrauer:T.7/hilbert-symbol-steinberg`](#node-k2symbolsbrauer-t-7-hilbert-symbol-steinberg) | [`K2SymbolsBrauer:T.2/matsumoto`](#node-k2symbolsbrauer-t-2-matsumoto) |
| [`K2SymbolsBrauer:T.7/global-reciprocity`](#node-k2symbolsbrauer-t-7-global-reciprocity) | [`K2SymbolsBrauer:T.2/matsumoto`](#node-k2symbolsbrauer-t-2-matsumoto) |
| [`K2SymbolsBrauer:T.7/chern-class-agreement`](#node-k2symbolsbrauer-t-7-chern-class-agreement) | [`K2SymbolsBrauer:T.1/k2-pi2`](#node-k2symbolsbrauer-t-1-k2-pi2) |
| [`K2SymbolsBrauer:T.7/chern-class-agreement`](#node-k2symbolsbrauer-t-7-chern-class-agreement) | [`K2SymbolsBrauer:T.2/matsumoto`](#node-k2symbolsbrauer-t-2-matsumoto) |
| [`K2SymbolsBrauer:T.5/integer-steinberg-word-model`](#node-k2symbolsbrauer-t-5-integer-steinberg-word-model) | [`K2SymbolsBrauer:T.1/steinberg-group-finite-rank`](#node-k2symbolsbrauer-t-1-steinberg-group-finite-rank) |
| [`K2SymbolsBrauer:T.5/integer-steinberg-word-model`](#node-k2symbolsbrauer-t-5-integer-steinberg-word-model) | [`K2SymbolsBrauer:T.2:symbols/diagonal-lift-words`](#node-k2symbolsbrauer-t-2-symbols-diagonal-lift-words) |
| [`K2SymbolsBrauer:T.5/integer-kernel-upper-generation`](#node-k2symbolsbrauer-t-5-integer-kernel-upper-generation) | [`K2SymbolsBrauer:T.2/steinberg-symbol`](#node-k2symbolsbrauer-t-2-steinberg-symbol) |
| [`K2SymbolsBrauer:T.5/integer-kernel-upper-generation`](#node-k2symbolsbrauer-t-5-integer-kernel-upper-generation) | [`K2SymbolsBrauer:T.1/k2-definition`](#node-k2symbolsbrauer-t-1-k2-definition) |

<a id="stage-k2symbolsbrauer-t-1-classical"></a>
## T.1:classical — Steinberg groups and universal central extensions

Construct the finite presentations and their stabilization, identify the stable central kernel, and develop the integral homology and Recognition Theorem used by its universal property. The general-ring elementary group is supplied by KTheoryLowDegrees U.1; finite-rank splitting and finite-rank centrality are separate assertions.

Coverage: **partial**.

**Remaining proof and supply obligations.**

- Independent review of this revision.
- G-matrix: associative-ring elementary calculus
- G-classification: trivial-action comparison


<a id="node-k2symbolsbrauer-t-1-steinberg-group-finite-rank"></a>
### The Steinberg group of a ring in finite rank

`K2SymbolsBrauer:T.1/steinberg-group-finite-rank` · definition · implementation unchecked

Planet: **Steinberg group**.

For a ring R and an integer n at least three define St_n(R) by generators x_ij(r), indexed by a pair of distinct integers i and j between one and n and an element r of R, subject to the Steinberg relations: x_ij(r) x_ij(s) = x_ij(r + s), and the commutator of x_ij(r) with x_kl(s) is trivial when j is different from k and i is different from l, is x_il(rs) when j equals k and i is different from l, and is x_kj(minus s r) when j is different from k and i equals l. The distinct-index hypotheses are part of each relation and are never dropped. No definition is given for n equal to two.

**Hypotheses.**

- R is an associative unital ring.
- n is at least three.
- i and j are distinct indices between one and n.


**Construction and proof.**

1. Take the free group on the indexed generator set and quotient by the normal closure of the displayed relations, using the pinned presented-group construction.
2. State the three commutator relations with their index hypotheses. They are disjoint but deliberately do not constrain the opposite-root pair (i,j),(j,i).
3. Prove the elementary consequences: x_ij(0) is the identity and x_ij(r) inverse is x_ij(minus r).
4. Prove the universal property: a group homomorphism out of St_n(R) is the same as a family of elements satisfying the relations.
5. Use the source convention n >= 3; the unprescribed opposite-root case also occurs at higher rank and is not an explanation unique to rank two.

**Acceptance.**

- x_ij(0) is the identity.
- The opposite-root commutator is not prescribed by these relations, at any rank.
- For n at least three the group is nontrivial whenever R is.


**Prerequisites.**

- `mathlib:PresentedGroup`
- `mathlib:commutatorElement`


**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `Steinberg` | data | The group St_n(R) for n at least three. |
| `Steinberg.x` | constructor | The generator x_ij(r), taking the distinctness of the indices as a hypothesis. |
| `Steinberg.x_add` | relation | x_ij(r) x_ij(s) = x_ij(r + s). |
| `Steinberg.commutator` | relation | The three commutator relations, each with its index hypothesis. |
| `Steinberg.lift` | universal-property | A family satisfying the relations induces a unique homomorphism out of St_n(R). |
| `Steinberg.x_zero` | simp | x_ij(0) is the identity. |
| `Steinberg.hom_ext` | extensionality | Two homomorphisms agreeing on every generator are equal. |
| `Steinberg.map` | functoriality | Ring maps act on parameters; identity and composition are proved on generators. |

**Consumers.**

- T.1's stabilisation — the stable group is the colimit of these
- T.1's finite-rank splitting — the splitting theorem for n at least five is a statement about these groups
- T.2's symbol — the elements w_ij and h_ij, from which the symbol is built, are words in these generators


**Unit tests.**

- `x_zero` — x_01(0)=1 in rank three.
- `x_inverse` — x_01(r)^-1=x_01(-r).
- `forward_product` — [x_01(r),x_12(s)]=x_02(r*s).
- `reverse_product_order` — Over R=M_2(Z), [x_01(r),x_20(s)]=x_21(-(s*r)); choose noncommuting r=E12 and s=E21 to distinguish s*r from r*s.
- `disjoint` — [x_01(r),x_02(s)]=1; the opposite-root case x_01,x_10 is not assigned this relation.


**Suggested placement.** module: `TauCeti/Algebra/KTheory/Steinberg`; namespace: `TauCeti.Steinberg`.

**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.5.1 (PDF p. 225).
  Excerpt: “Definition 5.1. For n >= 3 the Steinberg group St_n(R) of a ring R is the group defined by generators x_ij(r), with i, j a pair of distinct integers between 1 and n and r in R, subject to”
  Use: The definition and the three relations, as displayed.

<a id="node-k2symbolsbrauer-t-1-elementary-matrices-satisfy"></a>
### The elementary matrices satisfy the Steinberg relations

`K2SymbolsBrauer:T.1/elementary-matrices-satisfy` · lemma · implementation unchecked

For an associative unital ring R and n >= 3, elementary transvections satisfy additivity, the nonchaining commutator relation and both chaining commutator relations, with all distinct-index hypotheses as in the Steinberg presentation.

**Hypotheses.**

- R is an associative unital ring; n is at least three.


**Construction and proof.**

1. For a commutative ring, cite the four separate pinned transvection lemmas and align their index hypotheses.
2. For general associative R, construct I+rE_ij as a matrix unit with inverse I-rE_ij, then multiply matrix entries for each relation, retaining product order. This general-ring bridge remains gap G-matrix; it is not proved by the commutative-ring citations.

**Acceptance.**

- Forward chaining has coefficient r*s; reverse chaining has coefficient -(s*r).
- The nonchaining case requires both j != k and i != l.
- The opposite-root commutator is not asserted trivial.


**Prerequisites.**

- [`K2SymbolsBrauer:T.1/steinberg-group-finite-rank`](#node-k2symbolsbrauer-t-1-steinberg-group-finite-rank)
- `mathlib:Matrix.GeneralLinearGroup.transvection`
- `tauceti:TauCeti.transvectionUnit`
- `tauceti:TauCeti.commutatorElement_transvectionUnit`
- `tauceti:TauCeti.transvectionUnit_add`
- `tauceti:TauCeti.commute_transvectionUnit`
- `tauceti:TauCeti.commutatorElement_transvectionUnit_reverse`


**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.5.1.2 (PDF p. 225).
  Excerpt: “As observed in 1.3.1, the Steinberg relations are also satisfied by the elementary matrices e_ij(r) which generate the subgroup E_n(R) of GL_n(R). Hence there is a canonical group surjection phi_n : St_n(R) -> E_n(R) sending x_ij(r) to e_ij(r).”
  Use: The observation and the resulting surjection, as displayed.

<a id="node-k2symbolsbrauer-t-1-central-extension"></a>
### Central extensions and their equivalence

`K2SymbolsBrauer:T.1/central-extension` · definition · implementation unchecked

A central extension of G by an abelian group A is a GroupExtension A G whose included kernel lies in the centre of the total group. It is split if it admits a section, equivalently if it is equivalent, with identity on A and G, to the product extension. Equivalence retains the kernel and quotient identifications.

**Hypotheses.**

- G is a group; A is an abelian group.


**Construction and proof.**

1. Add the central-kernel predicate to GroupExtension; exactness identifies the image of its inclusion with the projection kernel.
2. Use the product construction and the displayed section formula to characterize splitness.
3. Use existing extension equivalences, with fixed kernel and quotient maps; no classification is asserted in this definition.

**Acceptance.**

- The split extension corresponds to the zero cohomology class.
- An extension built from a trivial-action factor set is central, which is the pinned statement.
- Equivalence is finer than isomorphism of groups: two inequivalent extensions can have isomorphic total groups.


**Prerequisites.**

- `mathlib:GroupExtension`
- `tauceti:TauCeti.FactorSet.inl_range_le_center`
- `mathlib:Subgroup.center`


**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `IsCentralExtension` | characterisation | The predicate that an extension is central. |
| `CentralExtension.split` | characterisation | Splitness. |
| `CentralExtension.Equiv` | structure | Equivalence of two extensions of G by A. |
| `CentralExtension.product` | constructor | The inclusion A -> A x G and projection A x G -> G form a split central extension. |
| `CentralExtension.section_equiv` | equivalence | A homomorphic section gives an extension equivalence to A x G, with formula (a,g) -> inl(a)*section(g). |

**Consumers.**

- T.1's universal central extension — the universal object is defined in this category
- T.1's Recognition Theorem — the characterisation by splitting of central extensions is stated here
- K3BlochGroups:V.1/steinberg-superperfect — superperfection of St(A) is the corollary of T.1:classical/uce-source-superperfect for this notion of central extension
- StableHomotopyKTheory:H.3/plus-pi2-universal-central-extension — π_2(BG⁺) is central in π_1 F(f), which is a central extension of P (K-book IV.1.7)


**Unit tests.**

- `product_extension` — For A=C2 and G=C2, the product projection is central and split.
- `cyclic_nonsplit` — The quotient C4 -> C2 modulo two is central but has no homomorphic section.
- `marked_kernel` — For C9 -> C3 modulo three, kernel inclusions C3 -> C9 given by 1 -> 3 and 1 -> 6 give inequivalent extensions although both total groups are C9: a map over C3 has multiplier 1 mod 3, whereas preserving these marked kernels would require multiplier 2 mod 3.


**Suggested placement.** module: `TauCeti/Algebra/KTheory/Steinberg`; namespace: `TauCeti.Steinberg`.

**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.5.3 (PDF p. 226).
  Excerpt: “Let G be a group and A an abelian group. A central extension of G by A is a short exact sequence of groups 1 -> A -> X -> G -> 1 such that A is in the center of X. We say that a central extension is split if it is isomorphic to an extension of the form 1 -> A -> A x G -> G -> 1.”
  Use: The definitions, as displayed.

<a id="node-k2symbolsbrauer-t-1-classical-to-elementary"></a>
### The Steinberg map onto the elementary subgroup

`K2SymbolsBrauer:T.1:classical/to-elementary` · construction · implementation unchecked

The generator assignment x_ij(r) -> e_ij(r) descends to a surjective homomorphism St_n(R) -> E_n(R), where E_n is the subgroup generated by elementary matrices imported from KTheoryLowDegrees:U.1.

**Hypotheses.**

- R is an associative unital ring; n is at least three.


**Construction and proof.**

1. Apply the presentation lift to the separately verified elementary relations.
2. The image contains each elementary generator, so it equals the elementary subgroup by subgroup-closure induction.

**Acceptance.**

- The generator assignment x_ij(r) -> e_ij(r) descends to a surjective homomorphism St_n(R) -> E_n(R), where E_n is the subgroup generated by elementary matrices imported from KTheoryLowDegrees:U.1.


**Prerequisites.**

- [`K2SymbolsBrauer:T.1/steinberg-group-finite-rank`](#node-k2symbolsbrauer-t-1-steinberg-group-finite-rank)
- [`K2SymbolsBrauer:T.1/elementary-matrices-satisfy`](#node-k2symbolsbrauer-t-1-elementary-matrices-satisfy)
- `KTheoryLowDegrees:U.1`


**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `toElementary` | constructor | The generator assignment x_ij(r) -> e_ij(r) descends to a surjective homomorphism St_n(R) -> E_n(R), where E_n is the subgroup generated by elementary matrices imported from KTheoryLowDegrees:U.1. |
| `toElementary_x` | simp | The image of x_ij(r) is e_ij(r). |
| `toElementary_surjective` | characterisation | Every element of the generated elementary subgroup has a preimage. |
| `toElementary_map` | functoriality | The square for a unital ring homomorphism commutes on each generator. |

**Consumers.**

- K2SymbolsBrauer:T.1/stabilisation — Finite-rank homomorphisms must commute with stabilization.


**Unit tests.**

- `generator_image` — x_01(2) maps to I+2E_01 over Z.
- `elementary_word` — e_01(r)*e_12(s) is the image of x_01(r)*x_12(s).
- `not_whole_gl` — Over Q, diag(2,1,1) has determinant 2 and is outside the image; surjectivity concerns E_3, not GL_3.


**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.5.1.1 (PDF p. 225).
  Excerpt: “The presentation maps onto the elementary subgroup by sending each generator to its elementary matrix.”
  Use: Paraphrase of the indicated passage; checked in the author copy, not a quotation from the published edition.

<a id="node-k2symbolsbrauer-t-1-stabilisation"></a>
### Stabilisation and the stable Steinberg group

`K2SymbolsBrauer:T.1/stabilisation` · construction · implementation unchecked

Planet: **Stable Steinberg group**.

Construct the rank-increasing maps between St_n(R) from the presentation and the stable group St(R) as their group colimit. Import the finite and stable elementary groups and their embeddings from KTheoryLowDegrees:U.1; the compatible finite Steinberg maps induce St(R) -> E(R).

**Hypotheses.**

- R is an associative unital ring.


**Construction and proof.**

1. Extend each generator index by the standard inclusion and use the presentation universal property.
2. Construct the group-colimit operations and universal property on the directed quotient; the cited DirectLimit is only a carrier. Gap G-colimit records the missing group API.
3. Verify compatibility with the imported elementary embeddings on generators.
4. Lift an elementary word at finite rank to prove the induced map onto E(R) is surjective; use finite-representative equality for well-definedness.
5. Prove ring-map identity and composition on finite generators.

**Acceptance.**

- The stable map is surjective onto E(R).
- A statement proved for St(R) does not follow for St_n(R): the two are kept distinct, which is the discipline the layer requires.
- The construction is functorial in the ring.


**Prerequisites.**

- [`K2SymbolsBrauer:T.1/steinberg-group-finite-rank`](#node-k2symbolsbrauer-t-1-steinberg-group-finite-rank)
- [`K2SymbolsBrauer:T.1:classical/to-elementary`](#node-k2symbolsbrauer-t-1-classical-to-elementary)
- `mathlib:DirectLimit`
- `KTheoryLowDegrees:U.1`


**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `Steinberg.stabilise` | constructor | The map from rank n to rank n plus one. |
| `StableSteinberg` | data | The colimit St(R). |
| `StableSteinberg.phi` | constructor | The surjection onto the stable elementary group. |
| `StableSteinberg.phi_surjective` | characterisation | That surjection is onto. |
| `StableSteinberg.map` | functoriality | Functoriality in the ring. |
| `StableSteinberg.lift` | universal-property | Compatible finite-rank homomorphisms induce a unique homomorphism from St(R). |
| `StableSteinberg.hom_ext` | extensionality | Homomorphisms agreeing on every finite-stage generator are equal. |

**Consumers.**

- T.1's definition of K_2 — K_2 is the kernel of the stable surjection
- K3BlochGroups V.1 — that layer's homological model is about this stable group and its superperfection
- T.1:plus — the comparison with the K-theory space is stated for the stable objects


**Unit tests.**

- `rank_three_generator` — The rank-three generator x_01(2) maps to the stable generator with the same parameter.
- `relation_survives` — The image of [x_01(r),x_12(s)] is x_02(r*s) after any common stabilization.
- `finite_word_lift` — A stable elementary word represented at rank five is the image of the corresponding rank-five Steinberg word.


**Suggested placement.** module: `TauCeti/Algebra/KTheory/Steinberg`; namespace: `TauCeti.Steinberg`.

**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.5.1.2 (PDF p. 225).
  Excerpt: “The Steinberg relations for n + 1 include the Steinberg relations for n, so there is an obvious map St_n(R) -> St_{n+1}(R). We write St(R) for the colimit of the St_n(R), and observe that by stabilizing the phi_n induce a surjection phi : St(R) -> E(R).”
  Use: The stabilisation and the stable surjection, as displayed.

<a id="node-k2symbolsbrauer-t-1-k2-definition"></a>
### Classical K_2 of a ring

`K2SymbolsBrauer:T.1/k2-definition` · definition · implementation unchecked

Planet: **Classical K2**.

Define classical K2(R) as ker(phi : St(R) -> E(R)). The inclusion into St(R) is injective and its image is the kernel; the stable Steinberg map is surjective. Ring maps induce maps on these kernels.

**Hypotheses.**

- R is an associative unital ring.


**Construction and proof.**

1. Take the kernel of the stable surjection.
2. Assemble the four-term exact sequence, using that E(R) is the commutator subgroup of GL(R) and that K_1(R) is the quotient, both imported.
3. Prove functoriality in the ring.
4. Record that abelianness is not part of the definition: it is Steinberg's theorem, proved next.

**Acceptance.**

- The sequence is exact at each of its four places.
- K_2 of the zero ring is trivial.
- K_2(Z) is cyclic of order two, generated by the symbol of minus one with itself; this is the acceptance test that the group is not trivially zero.


**Prerequisites.**

- [`K2SymbolsBrauer:T.1/stabilisation`](#node-k2symbolsbrauer-t-1-stabilisation)


**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `K2` | data | The group K_2(R). |
| `K2.subtype` | coercion | Its inclusion into St(R). |
| `K2.mem_iff` | characterisation | An element lies in K_2(R) exactly when its image in E(R) is trivial. |
| `K2.map` | functoriality | Functoriality in the ring. |
| `K2.ext` | extensionality | Kernel elements are equal exactly when their values in St(R) are equal. |

**Consumers.**

- T.2's symbols — every symbol is an element of this group
- T.1:plus — the comparison identifies this group with a homotopy group
- K3BlochGroups V.1 — the kernel of the universal central extension there is this group


**Unit tests.**

- `zero_ring` — K_2 of the zero ring is trivial.
- `integers` — K_2(Z) is cyclic of order two.
- `finite_field` — K_2 of a finite field is trivial.
- `not_by_definition_abelian` — Abelianness is a theorem, not part of the definition: a definition that assumes it assumes Steinberg's theorem.


**Suggested placement.** module: `TauCeti/Algebra/KTheory/Steinberg`; namespace: `TauCeti.Steinberg`.

**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.5.2 (PDF p. 225).
  Excerpt: “Definition 5.2. The group K_2(R) is the kernel of phi : St(R) -> E(R). Thus there is an exact sequence of groups 1 -> K_2(R) -> St(R) -> GL(R) -> K_1(R) -> 1.”
  Use: The definition and the exact sequence, as displayed.

<a id="node-k2symbolsbrauer-t-1-k2-is-centre"></a>
### Steinberg's theorem: K_2 is the centre of the Steinberg group

`K2SymbolsBrauer:T.1/k2-is-centre` · theorem · implementation unchecked

Planet: **K2 is the centre of St**.

For every ring R the group K_2(R) is abelian; in fact it is precisely the centre of St(R).

**Hypotheses.**

- R is an associative unital ring.


**Construction and proof.**

1. One inclusion: if an element is central in St(R) then its image is central in E(R), and the centre of E(R) is trivial, so the image is trivial and the element lies in K_2(R).
2. For the other inclusion take an element y of the kernel. Its commutator with every element of St(R) maps to the identity in E(R).
3. Choose n large enough that y is a word in the generators with indices below n. For each generator x_kn(s) with k below n, the Steinberg relations put the commutator of y with it inside the subgroup generated by the symbols x_in(r) with i below n.
4. That subgroup maps injectively into E(R), so the commutator is trivial and y commutes with every such generator.
5. By symmetry y commutes with every x_nk(s), hence with every x_kl(s) for k and l below n, since each such generator is a commutator of two of the previous ones. Let n grow to conclude that y is central.
6. Gap G-centre records the column-subgroup injectivity (Exercise III.5.2), stable E centre calculation (Exercise III.1.8), and word-normalization assertions. They are needed here and are not proved by a citation.

**Acceptance.**

- K_2(R) is abelian, which is what makes the four-term sequence a sequence of abelian groups at that spot.
- The centre of E(R) is trivial, which is the first half of the argument and is needed separately.
- The theorem is about the stable group: the centre of St_n(R) is a different question, treated in the finite-rank caveat.


**Prerequisites.**

- [`K2SymbolsBrauer:T.1/k2-definition`](#node-k2symbolsbrauer-t-1-k2-definition)
- [`K2SymbolsBrauer:T.1/stabilisation`](#node-k2symbolsbrauer-t-1-stabilisation)
- `mathlib:Subgroup.center`


**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.5.2.1 (PDF p. 225).
  Excerpt: “Theorem 5.2.1. (Steinberg) K_2(R) is an abelian group. In fact it is precisely the center of St(R).”
  Use: The theorem, with the proof of the source followed step by step.

<a id="node-k2symbolsbrauer-t-1-finite-rank-caveat"></a>
### Conditional centrality in finite rank

`K2SymbolsBrauer:T.1/finite-rank-caveat` · lemma · implementation unchecked

If the map ker(St_n(R)->E_n(R)) -> ker(St(R)->E(R)) induced by stabilization is injective, then ker(St_n(R)->E_n(R)) is central in St_n(R). This hypothesis is not asserted for arbitrary n,R.

**Hypotheses.**

- R is an associative unital ring; n is at least three.
- The stabilization map restricted to the finite-rank kernel is injective.


**Construction and proof.**

1. For z in the finite kernel and x in St_n, [z,x] is again in the finite kernel.
2. Its stable image is trivial, since the stable image of z is central by Steinberg's theorem.
3. Injectivity on the kernel makes [z,x]=1, proving centrality.

**Acceptance.**

- The proof uses injectivity on the kernel, not injectivity of the entire stabilization map.
- Without the injectivity hypothesis the stable-centre theorem alone has no finite-rank conclusion.
- Together with n>=5 splitting and perfectness, this centrality hypothesis permits a finite-rank UCE conclusion.


**Prerequisites.**

- [`K2SymbolsBrauer:T.1/k2-is-centre`](#node-k2symbolsbrauer-t-1-k2-is-centre)
- [`K2SymbolsBrauer:T.1:classical/to-elementary`](#node-k2symbolsbrauer-t-1-classical-to-elementary)


**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.5.2.1 and III.5.5.2 (PDF pp. 226, 229).
  Excerpt: “The source separates stable centrality from stabilization assertions; injectivity on the unstable kernel is an extra input to the finite-rank deduction.”
  Use: Paraphrase of the indicated passage; checked in the author copy, not a quotation from the published edition.

<a id="node-k2symbolsbrauer-t-1-classical-k2-k1-exact"></a>
### The classical low-degree exact sequence

`K2SymbolsBrauer:T.1:classical/k2-k1-exact` · lemma · implementation unchecked

The sequence 1 -> K2(R) -> St(R) -> GL(R) -> K1(R) -> 1 is exact, using the inclusion E(R) <= GL(R) and the quotient GL(R)/E(R) imported from U.1-U.2.

**Hypotheses.**

- R is an associative unital ring.


**Construction and proof.**

1. Compose the surjection St -> E with the imported subgroup inclusion.
2. Injectivity of E -> GL identifies the composite kernel with K2.
3. The image is E, which is the kernel of the imported K1 quotient; that quotient is onto.

**Acceptance.**

- The sequence 1 -> K2(R) -> St(R) -> GL(R) -> K1(R) -> 1 is exact, using the inclusion E(R) <= GL(R) and the quotient GL(R)/E(R) imported from U.1-U.2.


**Prerequisites.**

- [`K2SymbolsBrauer:T.1/k2-definition`](#node-k2symbolsbrauer-t-1-k2-definition)
- `KTheoryLowDegrees:U.1`
- `KTheoryLowDegrees:U.2`


**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.5.2 (PDF p. 225).
  Excerpt: “The classical kernel lies in the low-degree exact sequence through stable GL and K1.”
  Use: Paraphrase of the indicated passage; checked in the author copy, not a quotation from the published edition.

<a id="node-k2symbolsbrauer-t-1-classical-central-extension-hom"></a>
### Morphisms of central extensions

`K2SymbolsBrauer:T.1:classical/central-extension-hom` · definition · implementation unchecked

For central extensions p:X->G and q:Y->G define a morphism over G to be a homomorphism h:X->Y with q composed with h equal to p. Such morphisms do not require a fixed map of chosen kernel groups.

**Hypotheses.**

- G is a group; A is an abelian group.


**Construction and proof.**

1. Define the subtype of group homomorphisms satisfying the projection square.
2. Identity and composition follow from homomorphism identity and associativity; equality is equality of underlying homomorphisms.

**Acceptance.**

- For central extensions p:X->G and q:Y->G define a morphism over G to be a homomorphism h:X->Y with q composed with h equal to p. Such morphisms do not require a fixed map of chosen kernel groups.


**Prerequisites.**

- [`K2SymbolsBrauer:T.1/central-extension`](#node-k2symbolsbrauer-t-1-central-extension)


**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `HomOver.mk` | constructor | A homomorphism and proof of the projection square give a morphism. |
| `HomOver.ext` | extensionality | Equality of underlying homomorphisms implies equality of morphisms. |
| `HomOver.id_comp` | simp | Identity and composition retain the projection square; unit and associativity laws hold. |

**Consumers.**

- K2SymbolsBrauer:T.1/universal-central-extension — The universal property uses maps over G, without a fixed kernel identification.


**Unit tests.**

- `identity` — The identity on A x G lies over the product projection.
- `section` — g -> (1,g) is a morphism from id:G->G to the split projection A x G->G.
- `reject_projection_error` — For nontrivial G, the constant homomorphism G->A x G is not over id:G->G.


**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.5.3.1 (PDF p. 226).
  Excerpt: “Universality quantifies over maps of central extensions commuting with projection to G.”
  Use: Paraphrase of the indicated passage; checked in the author copy, not a quotation from the published edition.

<a id="node-k2symbolsbrauer-t-1-universal-central-extension"></a>
### Universal central extensions

`K2SymbolsBrauer:T.1/universal-central-extension` · definition · implementation unchecked

A universal central extension of G is a central extension from which there is a unique homomorphism over G to every other central extension of G. It is unique up to isomorphism over G when it exists.

**Hypotheses.**

- G is a group.


**Construction and proof.**

1. Define the universal property in the category of central extensions of G.
2. Prove uniqueness up to isomorphism over G by the usual argument with the two composites.
3. Record that existence is not automatic; for perfect groups it is perfect-uce-exists, and a group that is not perfect has none (uce-perfect).

**Acceptance.**

- The universal object is unique up to isomorphism over G.
- A group with a nontrivial abelianisation has none, which is the next lemma.
- Existence is a theorem, not part of the definition.


**Prerequisites.**

- [`K2SymbolsBrauer:T.1/central-extension`](#node-k2symbolsbrauer-t-1-central-extension)
- [`K2SymbolsBrauer:T.1:classical/central-extension-hom`](#node-k2symbolsbrauer-t-1-classical-central-extension-hom)


**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `IsUniversalCentralExtension` | characterisation | The universal property. |
| `uce_unique` | characterisation | Uniqueness up to isomorphism over G. |
| `uce_hom` | constructor | The unique homomorphism to any central extension. |
| `uce_hom_unique` | characterisation | Its uniqueness. |
| `UCE.equiv_over` | equivalence | Two universal central extensions of G have a unique equivalence commuting with their projections. |

**Consumers.**

- T.1's identification of the Steinberg group — St(R) is the universal central extension of E(R)
- K3BlochGroups:V.1/steinberg-superperfect — the source of a universal central extension is superperfect (T.1:classical/uce-source-superperfect), applied to St(A) → E(A)
- T.1:plus — the comparison with H_2 runs through the universal property
- StableHomotopyKTheory:H.3/plus-pi2-universal-central-extension — π_1 of the homotopy fibre of the plus construction relative to a perfect normal subgroup P is the universal central extension of P (K-book IV.1.7)


**Unit tests.**

- `trivial_uce` — The identity extension of the trivial group is universal: its unique map to any group is over the trivial quotient.
- `cyclic_obstruction` — The identity C2 -> C2 is not universal; it has two different lifts to C2 x C2 -> C2, given by the zero and identity first coordinates.
- `split_target` — For a universal extension X -> G and abelian A, its map to A x G -> G is (1,p(x)); perfectness forces every map X -> A to be trivial.


**Suggested placement.** module: `TauCeti/Algebra/KTheory/Steinberg`; namespace: `TauCeti.Steinberg`.

**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.5.3.1 (PDF p. 227).
  Excerpt: “Definition 5.3.1. A universal central extension of G is a central extension X -> G such that for every other central extension Y -> G there is a unique homomorphism f over G from X to Y. Clearly a universal central extension is unique up to isomorphism over G, provided it exists.”
  Use: The definition, as displayed.

<a id="node-k2symbolsbrauer-t-1-uce-perfect"></a>
### A universal central extension forces perfectness, and rigidity of maps out of a perfect extension

`K2SymbolsBrauer:T.1/uce-perfect` · lemma · implementation unchecked

If p:X->G is a universal central extension, both X and G are perfect.

**Hypotheses.**

- G is a group; X and Y are central extensions of G.


**Construction and proof.**

1. Compare the maps X -> G x X_ab with second coordinates zero and abelianization. They lie over G, so universality makes them equal; hence X_ab is trivial.
2. A surjective image of a perfect group is perfect, so G is perfect.

**Acceptance.**

- The two statements are what make the Recognition Theorem's proof work and are used separately.
- A perfect group can still have several central extensions; uniqueness is of the map, not of the extension.
- The first statement is the obstruction: a non-perfect group has no universal central extension at all.


**Prerequisites.**

- [`K2SymbolsBrauer:T.1/universal-central-extension`](#node-k2symbolsbrauer-t-1-universal-central-extension)
- `mathlib:Group.IsPerfect`


**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.5.3.2 (PDF p. 227).
  Excerpt: “Universality forces both the source and the quotient to be perfect.”
  Use: Paraphrase of the indicated passage; checked in the author copy, not a quotation from the published edition.

<a id="node-k2symbolsbrauer-t-1-classical-central-extension-classification"></a>
### Central extensions and second cohomology

`K2SymbolsBrauer:T.1:classical/central-extension-classification` · theorem · implementation unchecked

Equivalence classes of central extensions of G by a fixed abelian group A correspond to H^2(G;A) with the trivial G-action.

**Hypotheses.**

- G is a group; A is an abelian group.


**Construction and proof.**

1. Specialize the pinned fixed-action factor-set equivalence theorem to the trivial action and normalized sections.
2. Gap G-classification: prove centrality is equivalent to inducing trivial action, construct sections/factor sets, and prove surjectivity and independence before asserting the full bijection.

**Acceptance.**

- Equivalence classes of central extensions of G by a fixed abelian group A correspond to H^2(G;A) with the trivial G-action.


**Prerequisites.**

- [`K2SymbolsBrauer:T.1/central-extension`](#node-k2symbolsbrauer-t-1-central-extension)
- `tauceti:TauCeti.FactorSet.inl_range_le_center`
- `tauceti:TauCeti.GroupExtension.nonempty_equiv_iff_cohomologyClass_factorSet_eq`


**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.5.3 (PDF pp. 226-227).
  Excerpt: “For the fixed abelian kernel A, central extensions are classified by degree-two cohomology with trivial action.”
  Use: Paraphrase of the indicated passage; checked in the author copy, not a quotation from the published edition.

<a id="node-k2symbolsbrauer-t-1-classical-perfect-extension-rigidity"></a>
### Rigidity over a central quotient

`K2SymbolsBrauer:T.1:classical/perfect-extension-rigidity` · lemma · implementation unchecked

If p:X->G is surjective and X is perfect, and q:Y->G has central kernel, any two homomorphisms h,k:X->Y with qh=p=qk are equal.

**Hypotheses.**

- G is a group; X and Y are central extensions of G.


**Construction and proof.**

1. The pointwise difference h(x)k(x)^-1 lies in ker(q), hence is central.
2. Centrality makes this difference a homomorphism from X to the abelian centre.
3. A homomorphism from a perfect group to an abelian group is trivial.

**Acceptance.**

- If p:X->G is surjective and X is perfect, and q:Y->G has central kernel, any two homomorphisms h,k:X->Y with qh=p=qk are equal.


**Prerequisites.**

- [`K2SymbolsBrauer:T.1/central-extension`](#node-k2symbolsbrauer-t-1-central-extension)
- [`K2SymbolsBrauer:T.1:classical/central-extension-hom`](#node-k2symbolsbrauer-t-1-classical-central-extension-hom)
- `mathlib:Group.IsPerfect`


**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.5.3.3 (PDF p. 227).
  Excerpt: “A perfect central extension has at most one homomorphism over the common quotient to another central extension.”
  Use: Paraphrase of the indicated passage; checked in the author copy, not a quotation from the published edition.

<a id="node-k2symbolsbrauer-t-1-classical-relation-central-extension"></a>
### The central extension from relators

`K2SymbolsBrauer:T.1:classical/relation-central-extension` · construction · implementation unchecked

For any group E and normal subgroup N, the projection E/[N,E]→E/N is a central extension with kernel N/[N,E]. The earlier free-presentation case is a specialization; freeness is not used in this construction.

**Hypotheses.**

- E is an arbitrary discrete group and N normal in E; no freeness hypothesis.


**Construction and proof.**

1. Since N is normal, [N,E] <= N.
2. Every class of S commutes with every class of F after quotienting by [N,E].
3. The quotient projection is onto and its kernel consists exactly of classes of N.

**Acceptance.**

- For F free and S normal, the projection F/[S,F] -> F/S is a central extension with kernel S/[S,F].


**Prerequisites.**

- [`K2SymbolsBrauer:T.1/central-extension`](#node-k2symbolsbrauer-t-1-central-extension)


**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `relatorProjection` | constructor | The induced quotient projection E/[N,E]→E/N for any normal N in E. |
| `relatorProjection_kernel` | characterisation | Its kernel is canonically N/[N,E] and lies in the centre. |
| `relatorProjection_map` | functoriality | A map of presentations preserving relators induces a commuting map of extensions. |

**Consumers.**

- K2SymbolsBrauer:T.1/hopf-formula — Restrict to the commutator subgroup to identify the Hopf kernel.
- T.1:classical/quotient-bar-kernel-h1 — Provides the central abelian kernel N/[E,N] for any quotient map, before specializing to free presentations.


**Unit tests.**

- `no_relators` — If S=1, the extension is the identity F->F and its kernel is trivial.
- `cyclic_relation` — If F=Z and S=mZ with m>=2, the extension is Z->Z/m with kernel mZ, which is nontrivial.
- `redundant_generator` — For Free(a,b)->Z killing b, the relation kernel is nonzero, detected by the b-exponent sum.


**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.5.3.4 (PDF p. 227).
  Excerpt: “The first central extension has total group F/[S,F] and kernel S/[S,F].”
  Use: Paraphrase of the indicated passage; checked in the author copy, not a quotation from the published edition.

<a id="node-k2symbolsbrauer-t-1-classical-commutator-central-extension"></a>
### Restricting the relator extension to commutators

`K2SymbolsBrauer:T.1:classical/commutator-central-extension` · construction · implementation unchecked

The restriction [F,F]/[S,F] -> [G,G] is a central extension with kernel (S intersect [F,F])/[S,F]. If G is perfect its quotient is G.

**Hypotheses.**

- G is a group presented as a quotient of a free group F by a normal subgroup S.


**Construction and proof.**

1. Surjectivity F->G maps its commutator subgroup onto [G,G].
2. Intersect the relation-extension kernel with [F,F] to compute the kernel.
3. Centrality follows from the relator extension.

**Acceptance.**

- The restriction [F,F]/[S,F] -> [G,G] is a central extension with kernel (S intersect [F,F])/[S,F]. If G is perfect its quotient is G.


**Prerequisites.**

- [`K2SymbolsBrauer:T.1:classical/relation-central-extension`](#node-k2symbolsbrauer-t-1-classical-relation-central-extension)
- `mathlib:Group.IsPerfect`


**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `commutatorProjection` | constructor | The restricted quotient homomorphism onto [G,G]. |
| `commutatorProjection_kernel` | characterisation | Its kernel is the intersection quotient. |
| `commutatorProjection_perfect` | compatibility | For perfect G the quotient [G,G] identifies with G, preserving the projection. |

**Consumers.**

- K2SymbolsBrauer:T.1/recognition-theorem — The perfect-quotient extension is compared with the universal extension.


**Unit tests.**

- `free_presentation` — For S=1 the map [F,F]->[F,F] is the identity, with trivial kernel.
- `cyclic_quotient` — For F=Z, S=mZ, its source and target commutator groups are trivial even though the larger relation kernel is mZ.
- `abelian_rank_two` — For G=Z^2 presented by F(a,b) with S=[F,F], the quotient target is trivial and the kernel [F,F]/[[F,F],F] is nontrivial; detect [a,b] in the integral Heisenberg quotient.


**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.5.3.5 (PDF p. 227).
  Excerpt: “The second central extension has total group [F,F]/[S,F] and the Hopf intersection as kernel.”
  Use: Paraphrase of the indicated passage; checked in the author copy, not a quotation from the published edition.

<a id="node-k2symbolsbrauer-t-1-classical-central-extension-pullback"></a>
### Pulling a central extension back along a homomorphism

`K2SymbolsBrauer:T.1:classical/central-extension-pullback` · construction · implementation unchecked

Let q : Y → G be a surjective homomorphism whose kernel lies in the centre of Y, and let f : H → G be any homomorphism. The pullback P = {(h, y) ∈ H × Y : f(h) = q(y)} is a subgroup of H × Y, and its first projection pr_H : P → H is a central extension of H: it is surjective, and its kernel {(1, y) : y ∈ ker q} is central in P and isomorphic to ker q. The second projection pr_Y : P → Y satisfies q ∘ pr_Y = f ∘ pr_H, and a pair of homomorphisms a : X → H, b : X → Y with f ∘ a = q ∘ b factors uniquely through P.

**Hypotheses.**

- G, H and Y are groups; q : Y → G is surjective and ker q is contained in the centre of Y; f : H → G is a homomorphism.


**Construction and proof.**

1. P is the subgroup of H × Y on which the homomorphisms f ∘ fst and q ∘ snd agree (MonoidHom.eqLocus), so it is a group.
2. pr_H is surjective: for h in H choose y with q(y) = f(h), using that q is surjective.
3. ker pr_H = {(1, y) : q(y) = 1}. For (h', y') in P, (h', y')(1, y)(h', y')⁻¹ = (1, y'yy'⁻¹) = (1, y) because y is central in Y; so the kernel is central, and y ↦ (1, y) identifies ker q with it.
4. For a, b with f ∘ a = q ∘ b, the product homomorphism X → H × Y lands in P; it is the unique factorisation because P → H × Y is injective.

**Acceptance.**

- Along the identity of G the pullback is isomorphic over G to Y, by y ↦ (q(y), y).
- The pullback of the product projection A × G → G along f is isomorphic over H to A × H → H.
- Centrality is inherited but universality is not: along the inclusion of the trivial group the pullback is ker q → 1, which is universal only when ker q is trivial, since a universal central extension has a perfect source and ker q is abelian.


**Prerequisites.**

- [`K2SymbolsBrauer:T.1/central-extension`](#node-k2symbolsbrauer-t-1-central-extension)
- [`K2SymbolsBrauer:T.1:classical/central-extension-hom`](#node-k2symbolsbrauer-t-1-classical-central-extension-hom)
- `mathlib:MonoidHom.eqLocus`
- `mathlib:MonoidHom.ker`
- `mathlib:Subgroup.center`


**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `CentralExtension.pullback` | constructor | The subgroup P = {(h, y) : f(h) = q(y)} of H × Y, for q : Y → G central and surjective and f : H → G. |
| `CentralExtension.pullbackFst` | projection | pr_H : P → H; it is surjective and its kernel is central. |
| `CentralExtension.pullbackSnd` | projection | pr_Y : P → Y, with q ∘ pr_Y = f ∘ pr_H. |
| `CentralExtension.pullbackLift` | universal-property | For a : X → H and b : X → Y with f ∘ a = q ∘ b, the unique homomorphism X → P with pr_H ∘ lift = a and pr_Y ∘ lift = b. |
| `CentralExtension.pullbackKerEquiv` | characterisation | ker pr_H ≅ ker q, by y ↦ (1, y). |
| `CentralExtension.pullbackId` | compatibility | Along the identity of G the pullback is isomorphic to Y over G, by y ↦ (q(y), y). |

**Consumers.**

- K2SymbolsBrauer:T.1:classical/split-central-extension-universal — a central extension of G is pulled back along X → G, where condition (2) of the Recognition Theorem splits it (K-book III.5.4, '(2) ⇒ (1) is immediate')
- K2SymbolsBrauer:T.1:classical/uce-lift — the lift of a homomorphism of bases to universal central extensions factors through the pullback of the target extension


**Unit tests.**

- `pullback_id` (degenerate) — For f = id_G, y ↦ (q(y), y) is an isomorphism from Y onto P commuting with the projections to G.
- `pullback_trivial_subgroup` (computation) — For q : C_4 → C_2 reduction modulo two and f the inclusion of the trivial group, P ≅ C_2 and pr_H : C_2 → 1.
- `pullback_split` (characterisation) — The pullback of the product projection A × G → G along f : H → G is isomorphic over H to the product projection A × H → H.
- `pullback_noncentral` (non-example) — For q the sign map S_3 → C_2, whose kernel A_3 is not central, and f = id, the kernel of pr_H is not central in P ≅ S_3: the centrality hypothesis is used.


**Suggested placement.** module: `TauCeti/Algebra/KTheory/Steinberg`; namespace: `TauCeti.Steinberg`.

**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.5.4, equivalent conditions and proof (PDF p. 228, printed p. 220).
  Excerpt: “The implication (1)⇒(2) is Lemma 5.3.2 and Ex. 5.7, and (2) ⇒ (1) is immediate.”
  Use: The source calls (2) ⇒ (1) immediate: a central extension Y → G is pulled back along X → G to a central extension of X, which condition (2) splits. The pullback is not displayed in the source; this node makes it a declaration.

<a id="node-k2symbolsbrauer-t-1-classical-central-extension-comp"></a>
### Composite of central extensions with perfect middle term

`K2SymbolsBrauer:T.1:classical/central-extension-comp` · lemma · implementation unchecked

Let ρ : Y → X and π : X → G be surjective homomorphisms whose kernels are central in Y and in X. If X is perfect, then πρ : Y → G is surjective with central kernel.

**Hypotheses.**

- ker ρ is contained in the centre of Y and ker π in the centre of X; ρ and π are surjective.
- X is perfect.


**Construction and proof.**

1. Surjectivity of πρ is the composite of two surjections.
2. For z in ker(πρ), ρ(z) is central in X, so [y, z] lies in ker ρ, which is central in Y, for every y in Y.
3. Hence y ↦ [y, z] is a homomorphism from Y to the centre of Y, since [yy', z] = [y', z][y, z] when the values are central.
4. Its target is abelian, so it kills [Y, Y]; it kills ker ρ, which is central. As X is perfect, Y = [Y, Y]·ker ρ, so the homomorphism is trivial and z is central.

**Acceptance.**

- Non-example without perfectness: D_8 → D_8/Z(D_8) ≅ (Z/2)² and (Z/2)² → Z/2 are central extensions, but the composite has kernel {1, r², s, sr²}, which contains the non-central reflection s.
- With X a universal central extension (perfect by Lemma III.5.3.2) this is the first sentence of Exercise III.5.7 as the Recognition Theorem uses it.


**Prerequisites.**

- [`K2SymbolsBrauer:T.1/central-extension`](#node-k2symbolsbrauer-t-1-central-extension)
- `mathlib:Subgroup.center`
- `mathlib:Group.IsPerfect`


**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), Exercise III.5.7 (PDF p. 237, printed p. 229).
  Excerpt: “If Y →ρ X and X →π G are central extensions, show that the “composition” Y →πρ G is also a central extension. If X is a universal central extension of G, conclude that every central extension Y →ρ X splits.”
  Use: The first sentence, with the perfectness hypothesis the printed exercise omits: the D_8 example shows the printed statement is false without it (recorded as K3BlochGroups/E2 in the K3BlochGroups packet, where this lemma was first planned as V.1/central-extension-comp). The second sentence is uce-extensions-split.

<a id="node-k2symbolsbrauer-t-1-classical-uce-extensions-split"></a>
### Central extensions of a universal central extension split

`K2SymbolsBrauer:T.1:classical/uce-extensions-split` · lemma · implementation unchecked

If p : X → G is a universal central extension, then every central extension ρ : Y → X (ρ surjective with central kernel, Y in the universe of X) has a homomorphic section s : X → Y with ρ ∘ s = id_X.

**Hypotheses.**

- p : X → G is a universal central extension.
- ρ : Y → X is surjective and ker ρ lies in the centre of Y.


**Construction and proof.**

1. X is perfect (K2SymbolsBrauer:T.1/uce-perfect), so p ∘ ρ : Y → G is a central extension (central-extension-comp).
2. Universality of p gives σ : X → Y with p ∘ ρ ∘ σ = p.
3. Both ρ ∘ σ and id_X are homomorphisms X → X over G from p to p, so the uniqueness clause of universality gives ρ ∘ σ = id_X; σ is the required section.

**Acceptance.**

- For X = G trivial, every central extension A → 1 is split by the trivial homomorphism.
- Universality cannot be dropped: id : C_2 → C_2 is a central extension, and the central extension C_4 → C_2 of its source does not split.


**Prerequisites.**

- [`K2SymbolsBrauer:T.1/universal-central-extension`](#node-k2symbolsbrauer-t-1-universal-central-extension)
- [`K2SymbolsBrauer:T.1/uce-perfect`](#node-k2symbolsbrauer-t-1-uce-perfect)
- [`K2SymbolsBrauer:T.1:classical/central-extension-hom`](#node-k2symbolsbrauer-t-1-classical-central-extension-hom)
- [`K2SymbolsBrauer:T.1:classical/central-extension-comp`](#node-k2symbolsbrauer-t-1-classical-central-extension-comp)


**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), Exercise III.5.7 (PDF p. 237, printed p. 229).
  Excerpt: “If Y →ρ X and X →π G are central extensions, show that the “composition” Y →πρ G is also a central extension. If X is a universal central extension of G, conclude that every central extension Y →ρ X splits.”
  Use: The second sentence; the proof steps are the intended solution, using the first sentence with the perfectness of X that Lemma III.5.3.2 supplies.

<a id="node-k2symbolsbrauer-t-1-classical-split-extensions-kill-h2"></a>
### Split central extensions force vanishing Schur multiplier

`K2SymbolsBrauer:T.1:classical/split-extensions-kill-h2` · lemma · implementation unchecked

Let G be a group in Type. If every central extension of G by the circle group T = Q/Z (AddCircle (1 : ℚ), written multiplicatively, with trivial G-action) splits, then H_2(G, Z) = 0, integral homology with trivial coefficients. More precisely, the evaluation map H²(G; T) → Hom(H_2(G, Z), T) is surjective, and H²(G; T) = 0 under the hypothesis.

**Hypotheses.**

- G is a group in Type (Mathlib's integral group homology and the Tau Ceti factor-set classification are stated there); T carries the trivial G-action.


**Construction and proof.**

1. Pair inhomogeneous 2-cocycles G × G → T with 2-cycles; the pairing kills coboundaries against cycles and cocycles against boundaries, so it descends to ev : H²(G; T) → Hom(H_2(G, Z), T).
2. ev is surjective: a character φ of H_2(G, Z), composed with the projection from 2-cycles, extends along the inclusion of 2-cycles into the 2-chains G × G →₀ Z (CharacterModule.dual_surjective_of_injective) to a function f : G × G → T; f vanishes on boundaries, so it is a 2-cocycle with ev[f] = φ.
3. H²(G; T) = 0: every class is the class of a factor set (TauCeti.FactorSet.exists_cohomologyClass_eq), whose extension (TauCeti.FactorSet.groupExtension) is central because the action is trivial, hence splits by hypothesis, so its class is 0 (TauCeti.FactorSet.nonempty_splitting_iff_cohomologyClass_eq_zero).
4. So every character of H_2(G, Z) vanishes, and H_2(G, Z) = 0 by CharacterModule.eq_zero_of_character_apply.

**Acceptance.**

- For the standard Schur cover SL₂(𝔽₅) → A₅ with kernel C₂ = H₂(A₅, ℤ), push out the kernel along C₂ → ℚ/ℤ, 1 ↦ 1/2 mod ℤ. This is the central extension by ℚ/ℤ whose evaluation is the nonzero character and hence cannot split. The original C₂-extension itself does not have the coefficient group of this lemma.
- The lemma is Recognition (2) ⇒ (3) in degree two; it uses only extensions by Q/Z, not all central extensions.


**Prerequisites.**

- [`K2SymbolsBrauer:T.1/central-extension`](#node-k2symbolsbrauer-t-1-central-extension)
- `mathlib:groupHomology.H2`
- `mathlib:Rep.trivial`
- `mathlib:groupCohomology.H2`
- `mathlib:groupHomology.inhomogeneousChains`
- `mathlib:groupHomology.d₃₂`
- `mathlib:AddCircle`
- `mathlib:CharacterModule`
- `mathlib:CharacterModule.dual_surjective_of_injective`
- `mathlib:CharacterModule.eq_zero_of_character_apply`
- `tauceti:TauCeti.FactorSet.exists_cohomologyClass_eq`
- `tauceti:TauCeti.FactorSet.nonempty_splitting_iff_cohomologyClass_eq_zero`
- `tauceti:TauCeti.FactorSet.groupExtension`


**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.5.3 (PDF p. 227, printed p. 219).
  Excerpt: “It is well-known that the equivalence classes of central extensions of G by a fixed group A are in 1–1 correspondence with the elements of the cohomology group H2(G; A)”
  Use: The classification of central extensions by H² used in the third step, with the trivial action on T.
- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.5.4, equivalent conditions and proof (PDF p. 228, printed p. 220).
  Excerpt: “Let X be any central extension of G, the following are equivalent: (1) X is a universal central extension; (2) X is perfect, and every central extension of X splits; (3) H1(X; Z) = H2(X; Z) = 0.”
  Use: The implication (2) ⇒ (3) in degree two that this lemma supplies. First planned as K3BlochGroups:V.1/split-extensions-kill-h2 (review REV-K3BlochGroups); moved here by FIX-RT-AREA-ktheory-1.

<a id="node-k2symbolsbrauer-t-1-classical-h1-trivial-perfect"></a>
### First integral homology is the abelianisation; vanishing is perfectness

`K2SymbolsBrauer:T.1:classical/h1-trivial-perfect` · lemma · implementation unchecked

For a group G in Type, groupHomology.H1AddEquivOfIsTrivial for the trivial representation Z, followed by the unit isomorphism Additive(G_ab) ⊗_Z Z ≅ Additive(G_ab) (TensorProduct.rid), is an isomorphism H_1(G, Z) ≅ Additive(G_ab), natural in G: for f : G → H it carries groupHomology.map f to Abelianization.map f. Consequently H_1(G, Z) = 0 if and only if G is perfect.

**Hypotheses.**

- G is a group in Type; Z carries the trivial action (Rep.trivial ℤ G ℤ).


**Construction and proof.**

1. Apply groupHomology.H1AddEquivOfIsTrivial to A = Rep.trivial ℤ G ℤ and compose with TensorProduct.rid ℤ.
2. Naturality: both composites send the class of the 1-cycle single g 1 to the class of f(g) (H1AddEquivOfIsTrivial_single and groupHomology.H1π_comp_map); such classes generate H_1.
3. G_ab = G/[G, G] is trivial exactly when commutator G = ⊤, which is Group.isPerfect_def.

**Acceptance.**

- H_1(Z/2, Z) ≅ Z/2 ≠ 0, and Z/2 is not perfect.
- H_1(A_5, Z) = 0 because A_5 is perfect.
- The identification uses the trivial action: with a nontrivial coefficient module H_1 is not the abelianisation.


**Prerequisites.**

- `mathlib:groupHomology.H1`
- `mathlib:groupHomology.H1AddEquivOfIsTrivial`
- `mathlib:groupHomology.map`
- `mathlib:groupHomology.H1π_comp_map`
- `mathlib:Rep.trivial`
- `mathlib:TensorProduct.rid`
- `mathlib:Abelianization`
- `mathlib:Abelianization.map`
- `mathlib:Group.IsPerfect`
- `mathlib:Group.isPerfect_def`


**Sources.**

- [Loeh.GroupCohomology.2019](https://loeh.app.uni-regensburg.de/teaching/grouphom_ss19/lecture_notes.pdf), Corollary 1.4.6 (printed p. 23; PDF p. 31).
  Excerpt: “Corollary 1.4.6 (homological characterisation of perfect groups). Let G be a group. Then G is perfect if and only if H1(G; Z) ≅ 0.”
  Use: The characterisation of perfectness, which is what the Recognition Theorem's H_1 = 0 means.
- [Loeh.GroupCohomology.2019](https://loeh.app.uni-regensburg.de/teaching/grouphom_ss19/lecture_notes.pdf), Theorem 1.4.1 (printed p. 20; PDF p. 28).
  Excerpt: “Theorem 1.4.1 (group homology in degree 1). Let G be a group. Then (where Z carries the trivial G-action) there is a canonical isomorphism H1(G; Z) ≅ Gab.”
  Use: The natural isomorphism with the abelianisation; at the pin Mathlib supplies it as H1AddEquivOfIsTrivial up to the unit isomorphism of the tensor product.

<a id="node-k2symbolsbrauer-t-1-classical-superperfect"></a>
### Superperfect groups

`K2SymbolsBrauer:T.1:classical/superperfect` · definition · implementation unchecked

A group G in Type is superperfect if H_1(G, Z) = 0 and H_2(G, Z) = 0, where H_n(G, Z) = groupHomology (Rep.trivial ℤ G ℤ) n is Mathlib's integral group homology with trivial coefficients. Equivalently (h1-trivial-perfect), G is perfect and H_2(G, Z) = 0. This is condition (3) of the Recognition Theorem.

**Hypotheses.**

- G is a group in Type: Mathlib's group homology over ℤ puts the group in the universe of ℤ.


**Construction and proof.**

1. Define the predicate as the conjunction of the two vanishing statements, each as subsingleton-ness of the ModuleCat ℤ object.
2. Prove the characterisation by perfectness with h1-trivial-perfect.
3. Prove invariance under group isomorphisms with groupHomology.mapIso.

**Acceptance.**

- The trivial group is superperfect; Z/2 and every nontrivial free group are not.
- A_5 is perfect but not superperfect, so the predicate is strictly stronger than Group.IsPerfect.


**Prerequisites.**

- `mathlib:groupHomology`
- `mathlib:Rep.trivial`
- `mathlib:groupHomology.H1`
- `mathlib:groupHomology.H2`
- `mathlib:groupHomology.mapIso`
- `mathlib:Group.IsPerfect`
- [`K2SymbolsBrauer:T.1:classical/h1-trivial-perfect`](#node-k2symbolsbrauer-t-1-classical-h1-trivial-perfect)


**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `Group.IsSuperperfect` | characterisation | The predicate H_1(G, Z) = 0 ∧ H_2(G, Z) = 0 for a group G in Type, with trivial integral coefficients. |
| `Group.isSuperperfect_iff` | characterisation | IsSuperperfect G ↔ Group.IsPerfect G ∧ H_2(G, Z) = 0. |
| `Group.IsSuperperfect.isPerfect` | compatibility | A superperfect group is perfect in Mathlib's sense (Group.IsPerfect). |
| `Group.IsSuperperfect.of_mulEquiv` | functoriality | Superperfectness is invariant under group isomorphisms. |
| `Group.IsSuperperfect.of_subsingleton` | example | The trivial group is superperfect. |

**Consumers.**

- K2SymbolsBrauer:T.1/recognition-theorem — condition (3) of Recognition Theorem III.5.4, H_1(X; Z) = H_2(X; Z) = 0
- K3BlochGroups:V.1/steinberg-superperfect — the stable Steinberg group is superperfect, which makes BSt(A)⁺ two-connected
- StableHomotopyKTheory:H.3/plus-pi2-universal-central-extension — π_1 of the acyclic homotopy fibre of a plus construction is perfect with H_2 = 0, hence the universal central extension (K-book IV.1.7)


**Unit tests.**

- `isSuperperfect_trivial` (degenerate) — The trivial group is superperfect.
- `not_isSuperperfect_cyclic` (non-example) — Z/2 is not superperfect: H_1(Z/2, Z) ≅ Z/2.
- `not_isSuperperfect_free` (non-example) — The free group on one generator is not superperfect although its H_2 vanishes (free-group-higher-homology): a definition asking only for H_2 = 0 fails this test.
- `not_isSuperperfect_alternating` (non-example) — A_5 is perfect but not superperfect (H_2(A_5, Z) ≅ Z/2): a definition asking only for perfectness fails this test.
- `isSuperperfect_iff_perfect` (compatibility) — For every group G in Type, IsSuperperfect G ↔ Group.IsPerfect G ∧ H_2(G, Z) = 0.


**Suggested placement.** module: `TauCeti/Algebra/KTheory/Steinberg`; namespace: `TauCeti.Steinberg`.

**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.5.4, equivalent conditions and proof (PDF p. 228, printed p. 220).
  Excerpt: “Let X be any central extension of G, the following are equivalent: (1) X is a universal central extension; (2) X is perfect, and every central extension of X splits; (3) H1(X; Z) = H2(X; Z) = 0.”
  Use: Condition (3). The source does not use the word 'superperfect'; it is the standard name for this condition and the one the consuming roadmaps use.

<a id="node-k2symbolsbrauer-t-1-classical-hopf-extension-perfect"></a>
### The Hopf extension of a perfect group is perfect

`K2SymbolsBrauer:T.1:classical/hopf-extension-perfect` · lemma · implementation unchecked

Let π : F → G be a surjective homomorphism with kernel R. If G is perfect, then F = [F, F]·R and [F, F] = [[F, F], [F, F]]·[R, F]; hence [F, F]/[R, F] is a perfect group.

**Hypotheses.**

- F is a group and π : F → G is surjective with kernel R (F need not be free).
- G is perfect.


**Construction and proof.**

1. π maps [F, F] onto [G, G] = G (Subgroup.map_commutator and surjectivity), so every f in F is c·r with c in [F, F] and r in R.
2. For f = cr and f' = c'r', the commutator [f, f'] is congruent to [c, c'] modulo [R, F], because R is normal in F and its elements are central modulo [R, F].
3. Hence the commutator generators of [F, F] lie in [[F, F], [F, F]]·[R, F]; since [R, F] ⊆ [F, F], the quotient [F, F]/[R, F] equals its own commutator subgroup.

**Acceptance.**

- For F free on one generator and R = F (G trivial), [F, F]/[R, F] is trivial, hence perfect.
- Perfectness of G is needed: for F free on a, b and R = [F, F] (G = Z²), [F, F]/[[F, F], F] is a nontrivial abelian group, detected by [a, b] in the integral Heisenberg quotient, so it is not perfect.


**Prerequisites.**

- [`K2SymbolsBrauer:T.1:classical/commutator-central-extension`](#node-k2symbolsbrauer-t-1-classical-commutator-central-extension)
- `mathlib:Group.IsPerfect`
- `mathlib:commutator`
- `mathlib:Subgroup.map_commutator`


**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.5.4, equivalent conditions and proof (PDF p. 228, printed p. 220).
  Excerpt: “Given any central extension X of G, the map F → G lifts to a map h : F → X because F is free. Since h(R) is in the center of X, h([R, F]) = 1. Thus h induces a map from [F, F]/[R, F] to X over G. This map is unique by Lemma 5.3.3.”
  Use: Lemma 5.3.3 applies only to a perfect source, here [F, F]/[R, F]; the source uses its perfectness without comment, and this node supplies it.

<a id="node-k2symbolsbrauer-t-1-classical-perfect-uce-exists"></a>
### Every perfect group has a universal central extension

`K2SymbolsBrauer:T.1:classical/perfect-uce-exists` · theorem · implementation unchecked

Let G be a perfect group and π : F → G a surjection from a free group F = FreeGroup S, with kernel R. The restricted projection [F, F]/[R, F] → G (commutator-central-extension, whose target [G, G] is G) is a universal central extension of G. In particular every perfect group G has a universal central extension in its own universe, from the canonical presentation FreeGroup G → G.

**Hypotheses.**

- G is perfect.
- π : FreeGroup S → G is surjective with kernel R.


**Construction and proof.**

1. [F, F]/[R, F] → G is surjective with central kernel (R ∩ [F, F])/[R, F] (commutator-central-extension, G perfect).
2. Given a central extension q : Y → G, choose for each generator s in S a preimage in Y of π(s); FreeGroup.lift gives h : F → Y with q ∘ h = π.
3. h(R) ⊆ ker q, which is central in Y, so h([R, F]) = 1; restrict h to [F, F] and descend to a homomorphism [F, F]/[R, F] → Y over G.
4. Uniqueness: [F, F]/[R, F] is perfect (hopf-extension-perfect) and ker q is central, so perfect-extension-rigidity allows at most one homomorphism over G.
5. For existence in general take S = G and π = FreeGroup.lift id.

**Acceptance.**

- For G trivial and S empty the universal central extension is the trivial group.
- Its kernel is the Hopf quotient (R ∩ [F, F])/[R, F], which uce-kernel-h2 identifies with H_2(G, Z).
- Perfectness of G cannot be dropped: a group that is not perfect has no universal central extension (K2SymbolsBrauer:T.1/uce-perfect).


**Prerequisites.**

- [`K2SymbolsBrauer:T.1:classical/commutator-central-extension`](#node-k2symbolsbrauer-t-1-classical-commutator-central-extension)
- [`K2SymbolsBrauer:T.1:classical/relation-central-extension`](#node-k2symbolsbrauer-t-1-classical-relation-central-extension)
- [`K2SymbolsBrauer:T.1:classical/hopf-extension-perfect`](#node-k2symbolsbrauer-t-1-classical-hopf-extension-perfect)
- [`K2SymbolsBrauer:T.1:classical/perfect-extension-rigidity`](#node-k2symbolsbrauer-t-1-classical-perfect-extension-rigidity)
- [`K2SymbolsBrauer:T.1/universal-central-extension`](#node-k2symbolsbrauer-t-1-universal-central-extension)
- `mathlib:FreeGroup`
- `mathlib:FreeGroup.lift`
- `mathlib:Group.IsPerfect`


**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.5.4, statement (PDF p. 227, printed p. 219).
  Excerpt: “Recognition Theorem 5.4. Every perfect group G has a universal central extension, namely the extension (5.3.5): 1 → H2(G; Z) → [F, F]/[R, F] → G → 1.”
  Use: The existence half of the theorem, with the extension (5.3.5).
- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.5.4, equivalent conditions and proof (PDF p. 228, printed p. 220).
  Excerpt: “Given any central extension X of G, the map F → G lifts to a map h : F → X because F is free. Since h(R) is in the center of X, h([R, F]) = 1. Thus h induces a map from [F, F]/[R, F] to X over G. This map is unique by Lemma 5.3.3.”
  Use: The proof, followed step by step; the perfectness that Lemma 5.3.3 needs is hopf-extension-perfect.

<a id="node-k2symbolsbrauer-t-1-classical-free-group-higher-homology"></a>
### Integral homology of a free group vanishes above degree one

`K2SymbolsBrauer:T.1:classical/free-group-higher-homology` · lemma · implementation unchecked

Let F be a free group in Type (IsFreeGroup F; for example FreeGroup S). Then H_k(F, Z) = 0 for every k ≥ 2, with trivial integral coefficients, and H_1(F, Z) is free abelian on a basis of F.

**Hypotheses.**

- F is a group in Type with IsFreeGroup F.


**Construction and proof.**

1. For F = FreeGroup S, the complex 0 → ZF^(S) → ZF → Z → 0 with e_s ↦ s − 1 followed by the augmentation is exact (Löh, Proposition 1.6.21: the image of ∂ is the augmentation ideal, and ∂ is injective by a reduced-word support argument).
2. Its two nonzero terms are free, hence projective, representations, so it is a projective resolution of Rep.trivial ℤ F ℤ of length one (CategoryTheory.ProjectiveResolution).
3. groupHomologyIso computes H_k(F, Z) as the homology of the coinvariants of this resolution, which vanishes for k ≥ 2; in degree one ∂ becomes zero after coinvariants and leaves Z^(S).
4. For a general free group transport along the isomorphism with FreeGroup of a basis (groupHomology.mapIso).

**Acceptance.**

- H_2(Z, Z) = 0 for the free group of rank one.
- H_1 of the free group on two generators is Z².
- With Nielsen-Schreier (subgroupIsFreeOfIsFree) the lemma applies to every subgroup of a free group, as Hopf's formula needs for the relator subgroup.


**Prerequisites.**

- `mathlib:groupHomology`
- `mathlib:groupHomologyIso`
- `mathlib:CategoryTheory.ProjectiveResolution`
- `mathlib:Rep.trivial`
- `mathlib:FreeGroup`
- `mathlib:IsFreeGroup`
- `mathlib:groupHomology.mapIso`


**Sources.**

- [Loeh.GroupCohomology.2019](https://loeh.app.uni-regensburg.de/teaching/grouphom_ss19/lecture_notes.pdf), Corollary 1.6.23 with Proposition 1.6.21 (printed pp. 56-57; PDF pp. 64-65).
  Excerpt: “Corollary 1.6.23 ((co)homology of free groups). Let S be a set, let F be the free group freely generated by S, and let A be a ZF-module. Then, for all k ∈ N≥2, Hk(F; A) ≅ 0 and H^k(F; A) ≅ 0.”
  Use: The vanishing statement with the length-one free resolution of Proposition 1.6.21 that proves it; the proof steps follow Löh's.

<a id="node-k2symbolsbrauer-t-1-classical-uce-source-superperfect"></a>
### The source of a universal central extension is superperfect

`K2SymbolsBrauer:T.1:classical/uce-source-superperfect` · theorem · implementation unchecked

Let p : X → G be a universal central extension of groups in Type. Then X is superperfect: H_1(X, Z) = 0 and H_2(X, Z) = 0. Only the universal property is used. This is Recognition (1) ⇒ (3).

**Hypotheses.**

- p : X → G is a universal central extension; X and G are groups in Type.


**Construction and proof.**

1. X is perfect (K2SymbolsBrauer:T.1/uce-perfect, K-book Lemma III.5.3.2), so H_1(X, Z) = 0 (h1-trivial-perfect).
2. Every central extension of X splits (uce-extensions-split), in particular every central extension of X by Q/Z with trivial action.
3. split-extensions-kill-h2 gives H_2(X, Z) = 0.

**Acceptance.**

- For the Steinberg extension St(R) → E(R) (K2SymbolsBrauer:T.1/steinberg-is-uce) it gives H_1(St(R), Z) = H_2(St(R), Z) = 0, the corollary K3BlochGroups V.1 draws.
- Universality, not merely a perfect source, is used: the identity of A_5 is a central extension with perfect source, but H_2(A_5, Z) ≠ 0.
- For X = G trivial both homology groups vanish.


**Prerequisites.**

- [`K2SymbolsBrauer:T.1/uce-perfect`](#node-k2symbolsbrauer-t-1-uce-perfect)
- [`K2SymbolsBrauer:T.1:classical/uce-extensions-split`](#node-k2symbolsbrauer-t-1-classical-uce-extensions-split)
- [`K2SymbolsBrauer:T.1:classical/split-extensions-kill-h2`](#node-k2symbolsbrauer-t-1-classical-split-extensions-kill-h2)
- [`K2SymbolsBrauer:T.1:classical/h1-trivial-perfect`](#node-k2symbolsbrauer-t-1-classical-h1-trivial-perfect)
- [`K2SymbolsBrauer:T.1:classical/superperfect`](#node-k2symbolsbrauer-t-1-classical-superperfect)


**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.5.4, equivalent conditions and proof (PDF p. 228, printed p. 220).
  Excerpt: “Let X be any central extension of G, the following are equivalent: (1) X is a universal central extension; (2) X is perfect, and every central extension of X splits; (3) H1(X; Z) = H2(X; Z) = 0.”
  Use: The implication (1) ⇒ (3), by the route (1) ⇒ (2) ⇒ (3) the source indicates. First planned as K3BlochGroups:V.1/uce-superperfect; moved here by FIX-RT-AREA-ktheory-1 so that V.1 imports it.
- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), Exercise IV.1.9 (PDF p. 282, printed p. 274).
  Excerpt: “Suppose that A → S → P is a universal central extension (III.5.3.1). In particular, S and P are perfect groups.”
  Use: The perfectness half, in the form the plus-construction exercise uses.

<a id="node-k2symbolsbrauer-t-1-classical-split-central-extension-universal"></a>
### A perfect central extension whose central extensions split is universal

`K2SymbolsBrauer:T.1:classical/split-central-extension-universal` · lemma · implementation unchecked

Let p : X → G be surjective with central kernel. If X is perfect and every central extension of X splits, then p is a universal central extension of G. This is Recognition (2) ⇒ (1); no homology enters and there is no universe restriction beyond the one in the definition of universality.

**Hypotheses.**

- p : X → G is surjective and ker p lies in the centre of X.
- X is perfect, and every central extension of X (in the universe over which universality quantifies) splits.


**Construction and proof.**

1. Given a central extension q : Y → G, pull it back along p (central-extension-pullback): P = X ×_G Y → X is a central extension of X.
2. By hypothesis it has a section s : X → P; then pr_Y ∘ s : X → Y satisfies q ∘ pr_Y ∘ s = p ∘ pr_X ∘ s = p, a homomorphism over G.
3. Uniqueness: X is perfect and ker q is central, so perfect-extension-rigidity.

**Acceptance.**

- The Steinberg application: St(R) is perfect and every central extension of St(R) splits (glued from finite-rank splitting), so St(R) → E(R) is universal; K2SymbolsBrauer:T.1/steinberg-is-uce uses the lemma in this form.
- Perfectness of X is needed: every central extension of a nontrivial free group F splits, but the identity of F is not universal, since F is not perfect.


**Prerequisites.**

- [`K2SymbolsBrauer:T.1:classical/central-extension-pullback`](#node-k2symbolsbrauer-t-1-classical-central-extension-pullback)
- [`K2SymbolsBrauer:T.1:classical/perfect-extension-rigidity`](#node-k2symbolsbrauer-t-1-classical-perfect-extension-rigidity)
- [`K2SymbolsBrauer:T.1:classical/central-extension-hom`](#node-k2symbolsbrauer-t-1-classical-central-extension-hom)
- [`K2SymbolsBrauer:T.1/universal-central-extension`](#node-k2symbolsbrauer-t-1-universal-central-extension)
- `mathlib:Group.IsPerfect`


**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.5.4, equivalent conditions and proof (PDF p. 228, printed p. 220).
  Excerpt: “The implication (1)⇒(2) is Lemma 5.3.2 and Ex. 5.7, and (2) ⇒ (1) is immediate.”
  Use: The implication (2) ⇒ (1), which the source calls immediate; the proof steps make the pullback explicit.

<a id="node-k2symbolsbrauer-t-1-classical-uce-lift"></a>
### Lifting homomorphisms to universal central extensions

`K2SymbolsBrauer:T.1:classical/uce-lift` · construction · implementation unchecked

Let p : X → G and p' : X' → G' be universal central extensions (groups in one universe) and f : G → G' a homomorphism. There is a unique homomorphism f̃ : X → X' with p' ∘ f̃ = f ∘ p. The lift of the identity of G along p itself is the identity of X, the lift of a composite is the composite of the lifts, and f̃ maps ker p into ker p', giving a homomorphism of abelian groups ker p → ker p'.

**Hypotheses.**

- p : X → G and p' : X' → G' are universal central extensions; f : G → G' is a homomorphism.


**Construction and proof.**

1. Pull p' back along f: P = G ×_G' X' → G is a central extension of G (central-extension-pullback).
2. Universality of p gives a homomorphism X → P over G; compose with pr_X' to obtain f̃ with p' ∘ f̃ = f ∘ p.
3. Uniqueness: if h and k both satisfy p' ∘ h = f ∘ p = p' ∘ k, then (p, h) and (p, k) are homomorphisms X → P over G (pullback lift), equal by universality of p; so h = k.
4. Functoriality: the identity satisfies the defining equation for id_G, and lift(g) ∘ lift(f) satisfies it for g ∘ f; uniqueness gives both laws.
5. If p(x) = 1 then p'(f̃(x)) = f(1) = 1; kernels are central, hence abelian.

**Acceptance.**

- The lift of the trivial homomorphism is trivial: it maps X into the abelian group ker p', and X is perfect.
- For a ring map R → S the lift of E(R) → E(S) along the Steinberg extensions is the functoriality map St(R) → St(S), by uniqueness.
- Uniqueness needs a universal source: for id : C_2 → C_2, the identity of C_2 has two lifts to the split extension C_2 × C_2 → C_2.


**Prerequisites.**

- [`K2SymbolsBrauer:T.1/universal-central-extension`](#node-k2symbolsbrauer-t-1-universal-central-extension)
- [`K2SymbolsBrauer:T.1/uce-perfect`](#node-k2symbolsbrauer-t-1-uce-perfect)
- [`K2SymbolsBrauer:T.1:classical/central-extension-pullback`](#node-k2symbolsbrauer-t-1-classical-central-extension-pullback)
- [`K2SymbolsBrauer:T.1:classical/central-extension-hom`](#node-k2symbolsbrauer-t-1-classical-central-extension-hom)


**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `IsUniversalCentralExtension.lift` | constructor | The lift f̃ : X → X' of f : G → G' between universal central extensions p and p'. |
| `IsUniversalCentralExtension.proj_comp_lift` | universal-property | p' ∘ f̃ = f ∘ p. |
| `IsUniversalCentralExtension.lift_unique` | characterisation | Any homomorphism h : X → X' with p' ∘ h = f ∘ p equals f̃. |
| `IsUniversalCentralExtension.lift_id` | functoriality | The lift of id_G along p itself is id_X. |
| `IsUniversalCentralExtension.lift_comp` | functoriality | The lift of g ∘ f is the lift of g composed with the lift of f. |
| `IsUniversalCentralExtension.kerMap` | projection | The restriction of f̃ to kernels, a homomorphism of abelian groups ker p → ker p'. |

**Consumers.**

- K2SymbolsBrauer:T.1/k2-h2-elementary — naturality of K_2(R) ≅ H_2(E(R), Z) in the ring: St(R) → St(S) is the lift of E(R) → E(S)
- K2SymbolsBrauer:T.1:classical/uce-kernel-h2-natural — its kernel map is compared with H_2(f; Z)
- StableHomotopyKTheory:H.3/plus-pi2-universal-central-extension — the naturality in R that the node's acceptance asks to check on representatives


**Unit tests.**

- `lift_id_self` (degenerate) — For G' = G, p' = p and f = id_G, the lift is id_X.
- `lift_trivial_hom` (characterisation) — For the trivial homomorphism f : G → G', the lift is the trivial homomorphism X → X'.
- `lift_steinberg` (compatibility) — For a ring map φ : R → S, the lift of E(φ) along St(R) → E(R) and St(S) → E(S) sends x_ij(r) to x_ij(φ(r)).
- `lift_not_unique_nonuniversal` (non-example) — For the central extension id : C_2 → C_2, which is not universal, the identity of C_2 has two different lifts to the split extension C_2 × C_2 → C_2 (first coordinate trivial or the identity).


**Suggested placement.** module: `TauCeti/Algebra/KTheory/Steinberg`; namespace: `TauCeti.Steinberg`.

**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.5.3.1 (PDF p. 227, printed p. 219).
  Excerpt: “Definition 5.3.1. A universal central extension of G is a central extension X → G such that for every other central extension Y → G there is a unique homomorphism f over G from X to Y.”
  Use: The universal property from which the lift is derived. The source states uniqueness up to isomorphism over G but not the lift along a homomorphism of bases or its functoriality; they are derived here through the pullback.

<a id="node-k2symbolsbrauer-t-1-classical-steinberg-perfect"></a>
### Perfectness of the Steinberg group

`K2SymbolsBrauer:T.1:classical/steinberg-perfect` · lemma · implementation unchecked

For n >= 3, the finite-rank Steinberg group St_n(R) is perfect.

**Hypotheses.**

- R is an associative unital ring.
- n is at least three.
- i and j are distinct indices between one and n.
- n >= 3.


**Construction and proof.**

1. For each x_ij(r), choose k different from i,j and use x_ij(r)=[x_ik(r),x_kj(1)].
2. The generators therefore lie in the commutator subgroup; subgroup generation gives finite perfectness.

**Acceptance.**

- For n >= 3, the finite-rank Steinberg group St_n(R) is perfect.


**Prerequisites.**

- [`K2SymbolsBrauer:T.1/steinberg-group-finite-rank`](#node-k2symbolsbrauer-t-1-steinberg-group-finite-rank)
- `mathlib:Group.IsPerfect`


**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.5.1 relations and III.5.5 (PDF pp. 225, 228).
  Excerpt: “The three-index commutator relation expresses every Steinberg generator as a commutator.”
  Use: Paraphrase of the indicated passage; checked in the author copy, not a quotation from the published edition.

<a id="node-k2symbolsbrauer-t-1-finite-rank-splitting"></a>
### Every central extension of the finite-rank Steinberg group splits, for n at least five

`K2SymbolsBrauer:T.1/finite-rank-splitting` · theorem · implementation unchecked

For n at least five every central extension of St_n(R) splits. If the canonical surjection St_n(R) -> E_n(R) is separately known to have central kernel, then it is the universal central extension of E_n(R); centrality is not a consequence of splitting.

**Hypotheses.**

- R is an associative unital ring; n is at least five.


**Construction and proof.**

1. Show first that two elements of the extension lying over generators with disjoint index conditions commute, by introducing an auxiliary index distinct from the four given ones and writing one of the two as a commutator; this is where n at least five is used.
2. Choose distinct indices and elements over three generators, and show that the commutator subgroup of the subgroup they generate is abelian.
3. Use the Hall-Witt style identity to show that the element defined as a commutator of two lifts does not depend on the intermediate index nor on the chosen lifts.
4. Prove that these elements satisfy the Steinberg relations, so that they define a homomorphism from St_n(R) to the extension splitting it.
5. Gap G-lifted-relations: expand the Hall-Witt use, independence of the auxiliary index, and additivity of lifted generators; the source leaves the last calculation to the reader. Finite-rank centrality is not deduced from splitting.
6. For the conditional universality consequence, apply finite Steinberg perfectness and split-central-extension-universal to the canonical surjection to E_n(R), only after its centrality is separately supplied. This does not prove finite-rank centrality.

**Acceptance.**

- The bound n at least five is used in the first step and is recorded, not smoothed over.
- The splitting is by an explicit homomorphism, which is what makes the argument constructive.
- The statement does not say that the kernel of the finite-rank map is central, which is the separate caveat below.


**Prerequisites.**

- [`K2SymbolsBrauer:T.1/steinberg-group-finite-rank`](#node-k2symbolsbrauer-t-1-steinberg-group-finite-rank)
- [`K2SymbolsBrauer:T.1:classical/to-elementary`](#node-k2symbolsbrauer-t-1-classical-to-elementary)
- [`K2SymbolsBrauer:T.1:classical/steinberg-perfect`](#node-k2symbolsbrauer-t-1-classical-steinberg-perfect)
- [`K2SymbolsBrauer:T.1:classical/split-central-extension-universal`](#node-k2symbolsbrauer-t-1-classical-split-central-extension-universal)


**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.5.5.1 (PDF p. 228).
  Excerpt: “Proposition 5.5.1. If n >= 5, every central extension Y -> St_n(R) is split. Hence St_n(R) is the universal central extension of E_n(R).”
  Use: The splitting assertion and its proof. The printed finite-rank universality consequence requires the separate centrality input recorded in source issue K2SymbolsBrauer/E2.

<a id="node-k2symbolsbrauer-t-1-classical-stable-steinberg-perfect"></a>
### Perfectness of the stable Steinberg group

`K2SymbolsBrauer:T.1:classical/stable-steinberg-perfect` · lemma · implementation unchecked

The stable Steinberg group St(R) is perfect.

**Hypotheses.**

- R is an associative unital ring.


**Construction and proof.**

1. Every stable generator is the image of a finite-stage generator and thus a commutator by finite perfectness.
2. Stable generators generate the group, so its commutator subgroup is the whole group.

**Acceptance.**

- The stable Steinberg group St(R) is perfect.


**Prerequisites.**

- [`K2SymbolsBrauer:T.1:classical/steinberg-perfect`](#node-k2symbolsbrauer-t-1-classical-steinberg-perfect)
- [`K2SymbolsBrauer:T.1/stabilisation`](#node-k2symbolsbrauer-t-1-stabilisation)
- `mathlib:Group.IsPerfect`


**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.5.1 relations and III.5.5 (PDF pp. 225, 228).
  Excerpt: “The three-index commutator relation expresses every Steinberg generator as a commutator.”
  Use: Paraphrase of the indicated passage; checked in the author copy, not a quotation from the published edition.

<a id="node-k2symbolsbrauer-t-1-classical-quotient-bar-kernel"></a>
### The kernel complex of a surjective group map

`K2SymbolsBrauer:T.1:classical/quotient-bar-kernel` · construction · implementation unchecked

For a surjection q:E→Q of discrete groups, let C_*(E) and C_*(Q) be the pinned inhomogeneous bar complexes with trivial integral coefficients, and L(q)=ker(chainsMap(q,id)). It sits in a short exact sequence 0→L(q)→C_*(E)→C_*(Q)→0. In degree n, L(q) is the kernel of the free-abelian pushforward on E^n→Q^n, generated by [a]−[b] with q^n(a)=q^n(b). In degree0 the map is identity on Z, so L(q)_0=0.

**Hypotheses.**

- Groups are in Type at the same universe as Z, as required by the pinned groupHomology interface.
- Surjectivity of q is required for the degreewise short exactness. Coefficients are specifically trivial Z; this node does not claim arbitrary-coefficient Hochschild–Serre.


**Construction and proof.**

1. Use groupHomology.chainsMap with the identity coefficient map. Its degree-n pushforward is surjective by chainsMap_f_map_epi: coordinatewise preimages lift every bar basis element.
2. Take the categorical kernel in chain complexes. Evaluation preserves this kernel by HomologicalComplex.eval_preservesLimit_of_hasKernel_f, giving the explicit degreewise description and the short exact sequence.
3. Choose one preimage in each tuple fibre. For a finitely supported integer chain in the kernel, group coefficients fibrewise: their sum in each fibre is zero. Subtract the chosen basis representative in each term to write it as a finite sum of pair differences. The only linear relations between those differences are [a]−[b]+[b]−[c]=[a]−[c] within a fibre and their additive consequences.
4. For n=0 there is a unique tuple and the coefficient map is identity, hence the degree-zero kernel vanishes. Morphisms of quotient maps induce kernel chain maps by the commuting square and chainsMap_comp.

**Acceptance.**

- A nonsurjective group map does not give the displayed short exact sequence by this proof.
- The kernel in degree0 is zero, not an extra augmentation copy of Z.


**Prerequisites.**

- `mathlib:groupHomology.inhomogeneousChains`
- `mathlib:groupHomology.chainsMap`
- `mathlib:groupHomology.chainsMap_f_map_epi`
- `mathlib:groupHomology.chainsMap_f_single`
- `mathlib:groupHomology.chainsMap_comp`
- `mathlib:HomologicalComplex.eval_preservesLimit_of_hasKernel_f`
- `mathlib:Rep.trivial`


**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `GroupQuotient.barKernel` | data | The kernel chain complex L(q), using trivial integral bar chains. |
| `GroupQuotient.barKernelShortComplex` | data | The kernel/inclusion/pushforward short complex of chain complexes. |
| `GroupQuotient.barKernelShortExact` | characterisation | It is short exact when q is surjective. |
| `GroupQuotient.barKernel_zero` | simp | The degree-zero object is zero. |
| `GroupQuotient.barKernel_pairGenerators` | characterisation | Degree-n kernels are generated by differences of tuples with equal quotient images. |
| `GroupQuotient.barKernel_map` | functoriality | A commuting square of quotient maps induces the canonical kernel chain map. |

**Consumers.**

- T.1:classical/hopf-four-term-sequence and hopf-formula-natural — For a surjection q:E→Q of discrete groups, let C_*(E) and C_*(Q) be the pinned inhomogeneous bar complexes with trivial integral coefficients, and L(q)=ker(chainsMap(q,id)). It sits in a short exact sequence 0→L(q)→C_*(E)→C_*(Q)→0. In degree n, L(q) is the kernel of the free-abelian pushforward on E^n→Q^n, generated by [a]−[b] with q^n(a)=q^n(b). In degree0 the map is identity on Z, so L(q)_0=0.


**Unit tests.**

- `bar_kernel_identity` (degenerate) — For q=id_E the kernel complex is zero in every degree.
- `bar_kernel_zero_degree` (degenerate) — For every surjective q, L(q)_0=0.
- `bar_kernel_tuple_difference` (computation) — [a]−[b] belongs to L(q)_n exactly when the two tuple images agree.
- `bar_kernel_nonsurjective` (non-example) — For 1→C₂ the degree-one bar pushforward misses the nonidentity basis element.


**Sources.**

- [Weibel.HA.Groups](https://math.mit.edu/~hrm/palestine/weibel/06-group_homology_and_cohomology.pdf), §6.8, Low Degree Terms6.8.3, printed p.196/PDF37; read text and image 2026-10-02.
  Excerpt: “H₂(E) → H₂(Q) → H₁(N)_Q → H₁(E) → H₁(Q) → 0”
  Use: The integral trivial-coefficient five-term result. The packet gives a direct kernel-of-bar-chains proof rather than claiming that this argument is printed in the source; differential and connecting-map conventions are checked against the pinned Lean statements.

<a id="node-k2symbolsbrauer-t-1-classical-quotient-bar-kernel-h1"></a>
### First homology of the quotient bar kernel

`K2SymbolsBrauer:T.1:classical/quotient-bar-kernel-h1` · comparison · implementation unchecked

With N=ker(q), there is a canonical isomorphism H₁(L(q))≅N/[E,N], written additively. It sends the cycle [a]−[b] with q(a)=q(b) to the class of ab⁻¹. The inverse sends n to the homology class of [n]−[1]. Under this isomorphism the map H₁(L(q))→H₁(E,Z)=E_ab is the inclusion-induced map N/[E,N]→E_ab.

**Hypotheses.**

- Use the unnormalised pinned bar differential ∂[a|b]=[b]−[ab]+[a]; no silent normalized-bar replacement.
- The quotient N/[E,N] is the central abelian kernel of relation-central-extension; trivial coefficients make ∂₁ zero.


**Construction and proof.**

1. Since L₀=0, H₁(L)=L₁/im(∂₂:L₂→L₁). On fibre differences define [a]−[b]↦class(ab⁻¹). The fibre triangle relation holds because (ab⁻¹)(bc⁻¹)=ac⁻¹, so this gives a canonical homomorphism, independent of the representatives chosen to express a chain.
2. Generators of L₂ are [a|b]−[a′|b′] with q(a)=q(a′), q(b)=q(b′). Their boundaries map to class(bb′⁻¹)−class(ab(a′b′)⁻¹)+class(aa′⁻¹)=0, since ab(a′b′)⁻¹ is the product of the conjugate a(bb′⁻¹)a⁻¹ and aa′⁻¹. Thus the homomorphism descends.
3. Set v(n)=class([n]−[1]) in H₁(L). The boundary of [n|m]−[1|1] proves v(nm)=v(n)+v(m). The boundaries of [a|n]−[a|1] and [n|a]−[1|a] prove v(n)=class([an]−[a])=class([na]−[a]), giving v(ana⁻¹)=v(n). Therefore v kills [E,N] and descends to its quotient.
4. The forward composite sends v(n) to n. For q(a)=q(b), put n=ab⁻¹; the boundary of [n|b]−[1|b] identifies v(n) with class([a]−[b]). Pair generators prove the other composite identity.
5. The inclusion L₁→C₁(E) sends the inverse generator [n]−[1] to the abelianisation class n because [1] is a bar boundary. Use the pinned H1AddEquivOfIsTrivial generator formula to identify this with the actual inclusion map.

**Acceptance.**

- The quotient is by mixed commutators [E,N], not only [N,N].
- The sign is fixed by [a]−[b]↦ab⁻¹ and the pinned positive boundary ∂[a|b].
- For S₃→C₂, conjugation inverts N=C₃ and its mixed-commutator quotient is zero; abelianising N alone would incorrectly give C₃.


**Prerequisites.**

- [`K2SymbolsBrauer:T.1:classical/quotient-bar-kernel`](#node-k2symbolsbrauer-t-1-classical-quotient-bar-kernel)
- [`K2SymbolsBrauer:T.1:classical/relation-central-extension`](#node-k2symbolsbrauer-t-1-classical-relation-central-extension)
- [`K2SymbolsBrauer:T.1:classical/h1-trivial-perfect`](#node-k2symbolsbrauer-t-1-classical-h1-trivial-perfect)
- `mathlib:groupHomology.d₂₁_single`
- `mathlib:groupHomology.d₁₀_eq_zero_of_isTrivial`
- `mathlib:groupHomology.H1AddEquivOfIsTrivial`
- `mathlib:groupHomology.H1π_comp_map`


**Sources.**

- [Weibel.HA.Groups](https://math.mit.edu/~hrm/palestine/weibel/06-group_homology_and_cohomology.pdf), §6.8, Low Degree Terms6.8.3, printed p.196/PDF37; read text and image 2026-10-02.
  Excerpt: “H₂(E) → H₂(Q) → H₁(N)_Q → H₁(E) → H₁(Q) → 0”
  Use: The integral trivial-coefficient five-term result. The packet gives a direct kernel-of-bar-chains proof rather than claiming that this argument is printed in the source; differential and connecting-map conventions are checked against the pinned Lean statements.

<a id="node-k2symbolsbrauer-t-1-classical-hochschild-serre-integral-five-term"></a>
### The integral five-term sequence of a group quotient

`K2SymbolsBrauer:T.1:classical/hochschild-serre-integral-five-term` · construction · implementation unchecked

For surjective q:E→Q with N=ker(q), construct the exact sequence H₂(E,Z)→H₂(Q,Z)→ N/[E,N]→E_ab→Q_ab→0. The outside homology maps are the pinned groupHomology.map with identity integral coefficients; the middle map is the connecting map of the quotient-bar kernel short exact sequence followed by quotient-bar-kernel-h1. This owns the required discrete trivial-integral-coefficient Hochschild–Serre low-degree input in T.1:classical, before plus constructions or spectra.

**Hypotheses.**

- Use the specified actual bar kernel and its fixed H₁ isomorphism; no arbitrary carrier isomorphism is substituted.
- No claim is made here to construct the full Hochschild–Serre spectral sequence or its arbitrary-coefficient version.


**Construction and proof.**

1. Apply the pinned ShortExact.δ and homology_exact₁–₃ to 0→L(q)→C(E)→C(Q)→0 in degrees2 and1. Because H₀(L(q))=0, its long exact sequence ends with a surjection H₁(E)→H₁(Q).
2. Replace H₁(L(q)) by N/[E,N] using the explicit isomorphism. Replace H₁(E),H₁(Q) by abelianisations using the pinned generator formulas. The inclusion and quotient maps agree on all bar1-generators.
3. For a 2-cycle z of C(Q), choose a 2-chain z̃ of C(E) mapping to z. Then ∂z̃ lies in L₁ and δ[z] is its class under the specified isomorphism. The pinned ShortExact.δ_apply has this positive sign. Two lifts differ by an element of L₂, so their boundaries differ by an L-boundary. If z changes by ∂w for w in C₃(Q), lift w to C₃(E) and change z̃ by its boundary; its next boundary is unchanged because ∂²=0. Any other lift again differs by L₂. Thus the map is well defined.
4. The result is the five-term sequence stated in Weibel6.8.3, proved here directly at chain level. It does not infer injectivity from freeness until the following free-presentation specialization.

**Acceptance.**

- The transgression is the canonical positive connecting map, and exactness includes the H₂(Q) term.
- For q=id_E the sequence has identity H₂ map, zero middle quotient and identity abelianisation map.


**Prerequisites.**

- [`K2SymbolsBrauer:T.1:classical/quotient-bar-kernel`](#node-k2symbolsbrauer-t-1-classical-quotient-bar-kernel)
- [`K2SymbolsBrauer:T.1:classical/quotient-bar-kernel-h1`](#node-k2symbolsbrauer-t-1-classical-quotient-bar-kernel-h1)
- [`K2SymbolsBrauer:T.1:classical/h1-trivial-perfect`](#node-k2symbolsbrauer-t-1-classical-h1-trivial-perfect)
- `mathlib:CategoryTheory.ShortComplex.ShortExact.δ`
- `mathlib:CategoryTheory.ShortComplex.ShortExact.δ_apply`
- `mathlib:CategoryTheory.ShortComplex.ShortExact.homology_exact₁`
- `mathlib:CategoryTheory.ShortComplex.ShortExact.homology_exact₂`
- `mathlib:CategoryTheory.ShortComplex.ShortExact.homology_exact₃`
- `mathlib:groupHomology.map`


**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `GroupQuotient.transgression` | data | The specified map H₂(Q,Z)→N/[E,N] from the bar-kernel connecting map. |
| `GroupQuotient.transgression_lift` | characterisation | On a 2-cycle it is the relative class of the positive boundary of any lift. |
| `GroupQuotient.fiveTerm_exact` | relation | Exactness at H₂(Q,Z), N/[E,N] and E_ab, and surjectivity onto Q_ab. No exactness at the first term H₂(E,Z) is asserted without a preceding term. |
| `GroupQuotient.fiveTerm_maps` | compatibility | The H₂ maps and abelianisation maps are the pinned homology maps of q and inclusion. |

**Consumers.**

- T.1:classical/hopf-four-term-sequence and hopf-formula-natural — For surjective q:E→Q with N=ker(q), construct the exact sequence H₂(E,Z)→H₂(Q,Z)→δ N/[E,N]→E_ab→Q_ab→0. The outside homology maps are the pinned groupHomology.map with identity integral coefficients; the middle map is the connecting map of the quotient-bar kernel short exact sequence followed by quotient-bar-kernel-h1. This owns the required discrete trivial-integral-coefficient Hochschild–Serre low-degree input in T.1:classical, before plus constructions or spectra.


**Unit tests.**

- `five_term_identity` (degenerate) — For q=id the outside maps are identity and the middle quotient is zero.
- `five_term_abelian_extension` (computation) — For C₄→C₂ the middle quotient C₂ maps to C₄ by the element2, and the final map is reductionmod2.
- `five_term_noncentral` (non-example) — For S₃→C₂, N/[E,N]=0 although N_ab=C₃.
- `five_term_positive_sign` (computation) — For a chosen2-cycle lift the transgression uses +∂z̃, matching ShortExact.δ_apply.


**Sources.**

- [Weibel.HA.Groups](https://math.mit.edu/~hrm/palestine/weibel/06-group_homology_and_cohomology.pdf), §6.8, Low Degree Terms6.8.3, printed p.196/PDF37; read text and image 2026-10-02.
  Excerpt: “H₂(E) → H₂(Q) → H₁(N)_Q → H₁(E) → H₁(Q) → 0”
  Use: The integral trivial-coefficient five-term result. The packet gives a direct kernel-of-bar-chains proof rather than claiming that this argument is printed in the source; differential and connecting-map conventions are checked against the pinned Lean statements.

<a id="node-k2symbolsbrauer-t-1-classical-hopf-four-term-sequence"></a>
### Hopf's four-term exact sequence

`K2SymbolsBrauer:T.1:classical/hopf-four-term-sequence` · theorem · implementation unchecked

Let F be a free group in Type, N a normal subgroup and G = F/N. There is an exact sequence 0 → H_2(G, Z) → N/[F, N] → F/[F, F] → G_ab → 0 of abelian groups, in which N/[F, N] → F/[F, F] is induced by the inclusion N ⊆ F and F/[F, F] → G_ab by the projection.

**Hypotheses.**

- F is a free group in Type; N is normal in F; G = F/N; homology has trivial integral coefficients.


**Construction and proof.**

1. Apply T.1:classical/hochschild-serre-integral-five-term to F→G=F/N. Since F is free, free-group-higher-homology gives H₂(F,Z)=0, making the canonical transgression injective.
2. The resulting exact sequence is 0→H₂(G,Z)→N/[F,N]→F_ab→G_ab→0. The preceding explicit bar-kernel isomorphism identifies the middle map with inclusion, and the pinned homologyMap definition identifies the final map with quotient.
3. The low-degree corestriction/coinflation exact sequence already in Mathlib is compatible with these two degree-one maps. It supplies that tail but is not used alone to assert the missing injection. Freeness of N is not required to get this five-term specialization.

**Acceptance.**

- For N = 1 the sequence reads 0 → H_2(F, Z) → 0 → F_ab → F_ab → 0, consistent with H_2(F, Z) = 0.
- For F free on a and N generated by a^m (G = Z/m): N/[F, N] = N ≅ mZ maps injectively to F_ab = Z, so H_2(Z/m, Z) = 0 and G_ab = Z/m.
- Exactness at N/[F, N] identifies H_2(G, Z) with (N ∩ [F, F])/[F, N], which is Hopf's formula.


**Prerequisites.**

- [`K2SymbolsBrauer:T.1:classical/free-group-higher-homology`](#node-k2symbolsbrauer-t-1-classical-free-group-higher-homology)
- [`K2SymbolsBrauer:T.1:classical/h1-trivial-perfect`](#node-k2symbolsbrauer-t-1-classical-h1-trivial-perfect)
- `mathlib:groupHomology.H1CoresCoinfOfTrivial_exact`
- `mathlib:groupHomology.H1CoresCoinfOfTrivial_g_epi`
- `mathlib:groupHomology.H2`
- `mathlib:Rep.trivial`
- [`K2SymbolsBrauer:T.1:classical/hochschild-serre-integral-five-term`](#node-k2symbolsbrauer-t-1-classical-hochschild-serre-integral-five-term)


**Sources.**

- [Loeh.GroupCohomology.2019](https://loeh.app.uni-regensburg.de/teaching/grouphom_ss19/lecture_notes.pdf), Theorem 3.2.18 (printed p. 129; PDF p. 137).
  Excerpt: “Theorem 3.2.18 (Hopf's formula). Let F be a free group, let N ⊂ F be a normal subgroup, and let G := F/N. Then there is an exact sequence 0 → H2(G; Z) → H1(N; Z)G → H1(F; Z) → H1(G; Z) → 0”
  Use: The four-term sequence, with H1(N; Z)_G rewritten as N/[F, N] as Löh does at the start of the proof.
- [Loeh.GroupCohomology.2019](https://loeh.app.uni-regensburg.de/teaching/grouphom_ss19/lecture_notes.pdf), Proof of Theorem 3.2.18 (printed pp. 130-131; PDF pp. 138-139).
  Excerpt: “As subgroup of the free group F, also N is a free group (Theorem AT.2.3.52). Therefore, by Corollary 1.6.23, for all k ∈ N≥2, Hk(F; Z) ≅ 0 and Hk(N; Z) ≅ 0.”
  Use: Löh gives a spectral-sequence proof using free-group vanishing. This packet instead specializes its explicitly constructed bar-kernel five-term sequence, for which only the vanishing of H₂(F,Z) is needed; no spectral sequence construction is attributed to this passage.

<a id="node-k2symbolsbrauer-t-1-hopf-formula"></a>
### The Hopf formula and the two extensions attached to a presentation

`K2SymbolsBrauer:T.1/hopf-formula` · theorem · implementation unchecked

For a presentation G = F/S with F free and S normal, H_2(G; Z) is isomorphic to (S ∩ [F, F])/[S, F], the kernel of the commutator extension [F, F]/[S, F] → [G, G]; its naturality in the presentation is hopf-formula-natural. The coefficients are the trivial integral representation, and G is a group in Type.

**Hypotheses.**

- G is a group presented as a quotient of a free group F by a normal subgroup S.


**Construction and proof.**

1. Form the separate relation central extension F/[S, F] → G and its restricted commutator extension (relation-central-extension, commutator-central-extension).
2. Apply the four-term exact sequence 0 → H_2(G, Z) → S/[F, S] → F_ab → G_ab → 0 (hopf-four-term-sequence): exactness at S/[F, S] identifies H_2(G, Z) with the kernel of S/[F, S] → F/[F, F], which is (S ∩ [F, F])/[S, F].
3. For a perfect G the restricted extension is onto G and its kernel is this intersection quotient, which is how uce-kernel-h2 uses the formula.
4. The remaining input is gap G-Hopf, carried by hopf-four-term-sequence: the Hochschild-Serre low-degree sequence. The K-book states the formula without proof (citing Weibel's homological algebra book, 6.8.8, not obtained); the decomposition follows Löh, Theorem 3.2.18.

**Acceptance.**

- H_2 of a free group is zero, for any presentation.
- The larger relation-module kernel S/[S, F] need not vanish for a free quotient G. Example F = Free(a, b), G = Z, a ↦ 1 and b ↦ 0: the class of b survives, detected by the b-exponent sum.
- For perfect G the restricted commutator extension has quotient G, and its kernel is H_2(G; Z) (uce-kernel-h2).


**Prerequisites.**

- [`K2SymbolsBrauer:T.1/central-extension`](#node-k2symbolsbrauer-t-1-central-extension)
- `mathlib:groupHomology.H2`
- `mathlib:groupHomology`
- `mathlib:Rep.trivial`
- [`K2SymbolsBrauer:T.1:classical/relation-central-extension`](#node-k2symbolsbrauer-t-1-classical-relation-central-extension)
- [`K2SymbolsBrauer:T.1:classical/commutator-central-extension`](#node-k2symbolsbrauer-t-1-classical-commutator-central-extension)
- [`K2SymbolsBrauer:T.1:classical/hopf-four-term-sequence`](#node-k2symbolsbrauer-t-1-classical-hopf-four-term-sequence)


**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.5.3.4 and III.5.3.5 (PDF p. 227).
  Excerpt: “The group (R intersect [F, F]) / [R, F] in (5.3.5) is the homology group H_2(G; Z); this identity was discovered in 1941 by Hopf.”
  Use: Hopf's formula and the two extensions, as displayed.
- [Loeh.GroupCohomology.2019](https://loeh.app.uni-regensburg.de/teaching/grouphom_ss19/lecture_notes.pdf), Theorem 3.2.18 (printed p. 129; PDF p. 137).
  Excerpt: “Theorem 3.2.18 (Hopf's formula). Let F be a free group, let N ⊂ F be a normal subgroup, and let G := F/N. Then there is an exact sequence 0 → H2(G; Z) → H1(N; Z)G → H1(F; Z) → H1(G; Z) → 0”
  Use: The route from the four-term sequence to the formula, followed in the proof steps.

<a id="node-k2symbolsbrauer-t-1-classical-uce-kernel-h2"></a>
### The kernel of a universal central extension is the second homology

`K2SymbolsBrauer:T.1:classical/uce-kernel-h2` · theorem · implementation unchecked

Let G be a perfect group in Type and p : X → G a universal central extension with X in Type. Then ker p ≅ H_2(G, Z) as abelian groups (trivial integral coefficients): the unique isomorphism over G from X to the Hopf extension [F, F]/[R, F] of the canonical presentation F = FreeGroup G → G restricts to an isomorphism of kernels, and Hopf's formula identifies the Hopf kernel (R ∩ [F, F])/[R, F] with H_2(G, Z). That the identification does not depend on the presentation is uce-kernel-h2-natural.

**Hypotheses.**

- G is a perfect group in Type; p : X → G is a universal central extension, X in Type (universality quantifies over central extensions in that universe, which contains the Hopf model FreeGroup G).


**Construction and proof.**

1. perfect-uce-exists gives the Hopf universal central extension U = [F, F]/[R, F] → G.
2. Two universal central extensions of G are isomorphic over G by a unique isomorphism (UCE.equiv_over of K2SymbolsBrauer:T.1/universal-central-extension); it maps ker p onto ker(U → G).
3. ker(U → G) = (R ∩ [F, F])/[R, F] (commutator-central-extension), which is H_2(G, Z) by K2SymbolsBrauer:T.1/hopf-formula.

**Acceptance.**

- For G = E(R) and X = St(R) this is K_2(R) ≅ H_2(E(R), Z), which K2SymbolsBrauer:T.1/k2-h2-elementary consumes.
- For G trivial both sides are zero.
- The statement is about perfect groups: Z² has H_2 = Z but no universal central extension.


**Prerequisites.**

- [`K2SymbolsBrauer:T.1:classical/perfect-uce-exists`](#node-k2symbolsbrauer-t-1-classical-perfect-uce-exists)
- [`K2SymbolsBrauer:T.1/universal-central-extension`](#node-k2symbolsbrauer-t-1-universal-central-extension)
- [`K2SymbolsBrauer:T.1:classical/commutator-central-extension`](#node-k2symbolsbrauer-t-1-classical-commutator-central-extension)
- [`K2SymbolsBrauer:T.1/hopf-formula`](#node-k2symbolsbrauer-t-1-hopf-formula)
- `mathlib:groupHomology.H2`
- `mathlib:Rep.trivial`


**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.5.4, statement (PDF p. 227, printed p. 219).
  Excerpt: “Recognition Theorem 5.4. Every perfect group G has a universal central extension, namely the extension (5.3.5): 1 → H2(G; Z) → [F, F]/[R, F] → G → 1.”
  Use: The kernel of the displayed universal central extension is H_2(G; Z).
- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), Before Proposition IV.1.7 (PDF p. 272, printed p. 264).
  Excerpt: “Recall from III.5.4 that every perfect group P has a universal central extension E → P, and that the kernel of this extension is the abelian group H2(P; Z).”
  Use: The form in which the plus-construction chapter uses the statement, for an arbitrary universal central extension of a perfect group.

<a id="node-k2symbolsbrauer-t-1-classical-superperfect-extensions-split"></a>
### A superperfect group is its own universal central extension

`K2SymbolsBrauer:T.1:classical/superperfect-extensions-split` · lemma · implementation unchecked

Let X be a superperfect group in Type. Then the identity X → X is a universal central extension of X, and every central extension ρ : Y → X (Y in Type) splits. This is Recognition (3) ⇒ (2).

**Hypotheses.**

- X is a superperfect group in Type.


**Construction and proof.**

1. X is perfect (h1-trivial-perfect), so perfect-uce-exists gives the universal central extension U = [F, F]/[R, F] → X for F = FreeGroup X.
2. Its kernel (R ∩ [F, F])/[R, F] (commutator-central-extension) is H_2(X, Z) = 0 by K2SymbolsBrauer:T.1/hopf-formula, so U → X is an isomorphism and the identity of X is a universal central extension.
3. For a central extension ρ : Y → X, universality of the identity gives s : X → Y with ρ ∘ s = id_X.

**Acceptance.**

- For X trivial, every central extension A → 1 is split by the trivial homomorphism.
- Both vanishing conditions are needed: Z/2 has H_2 = 0 but H_1 ≠ 0, and C_4 → Z/2 does not split; A_5 is perfect with H_2 ≠ 0, and SL_2(F_5) → A_5 does not split.


**Prerequisites.**

- [`K2SymbolsBrauer:T.1:classical/superperfect`](#node-k2symbolsbrauer-t-1-classical-superperfect)
- [`K2SymbolsBrauer:T.1:classical/h1-trivial-perfect`](#node-k2symbolsbrauer-t-1-classical-h1-trivial-perfect)
- [`K2SymbolsBrauer:T.1:classical/perfect-uce-exists`](#node-k2symbolsbrauer-t-1-classical-perfect-uce-exists)
- [`K2SymbolsBrauer:T.1:classical/commutator-central-extension`](#node-k2symbolsbrauer-t-1-classical-commutator-central-extension)
- [`K2SymbolsBrauer:T.1/hopf-formula`](#node-k2symbolsbrauer-t-1-hopf-formula)
- [`K2SymbolsBrauer:T.1/universal-central-extension`](#node-k2symbolsbrauer-t-1-universal-central-extension)


**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.5.4, equivalent conditions and proof (PDF p. 228, printed p. 220).
  Excerpt: “Let X be any central extension of G, the following are equivalent: (1) X is a universal central extension; (2) X is perfect, and every central extension of X splits; (3) H1(X; Z) = H2(X; Z) = 0.”
  Use: The implication (3) ⇒ (2), which the source obtains from the existence half and the identification of the kernel with H_2.

<a id="node-k2symbolsbrauer-t-1-recognition-theorem"></a>
### The Recognition Theorem

`K2SymbolsBrauer:T.1/recognition-theorem` · theorem · implementation unchecked

Planet: **Recognition Theorem**.

Let G be a perfect group and p : X → G a central extension (p surjective, ker p central), X in Type. The following are equivalent: (1) p is a universal central extension; (2) X is perfect and every central extension of X splits; (3) H_1(X; Z) = H_2(X; Z) = 0, that is, X is superperfect. Every perfect group has a universal central extension, the Hopf extension of any free presentation (perfect-uce-exists), and its kernel is H_2(G; Z) (uce-kernel-h2).

**Hypotheses.**

- G is a perfect group; p : X → G is surjective with ker p in the centre of X; X is a group in Type, as Mathlib's integral group homology requires.


**Construction and proof.**

1. (1) ⇒ (2): X is perfect (uce-perfect) and every central extension of X splits (uce-extensions-split).
2. (2) ⇒ (3): H_1(X; Z) = 0 by h1-trivial-perfect and H_2(X; Z) = 0 by split-extensions-kill-h2.
3. (3) ⇒ (2): superperfect-extensions-split.
4. (2) ⇒ (1): split-central-extension-universal.
5. Assemble the four implications as one equivalence of three conditions; the existence and kernel statements are the separate nodes perfect-uce-exists and uce-kernel-h2, restated here for reference.
6. The composite (1) ⇒ (3) is also the named theorem uce-source-superperfect, which K3BlochGroups V.1 imports; StableHomotopyKTheory H.3 uses (3) ⇒ (1) for π_1 of the homotopy fibre of a plus construction (K-book IV.1.7).

**Acceptance.**

- For a free group the theorem is vacuous, since a free group is perfect only when trivial.
- Condition (3) is the one K3BlochGroups V.1 uses for the Steinberg group and StableHomotopyKTheory H.3 uses for π_1 of an acyclic homotopy fibre.
- Perfectness of a central-extension source alone does not imply universality; the recognition criterion also requires H_2 of that source to vanish.
- The hypotheses that p is surjective with central kernel are kept: universality is recognised on central extensions of a perfect group, not on arbitrary extensions.


**Prerequisites.**

- [`K2SymbolsBrauer:T.1/uce-perfect`](#node-k2symbolsbrauer-t-1-uce-perfect)
- [`K2SymbolsBrauer:T.1/universal-central-extension`](#node-k2symbolsbrauer-t-1-universal-central-extension)
- [`K2SymbolsBrauer:T.1:classical/uce-extensions-split`](#node-k2symbolsbrauer-t-1-classical-uce-extensions-split)
- [`K2SymbolsBrauer:T.1:classical/h1-trivial-perfect`](#node-k2symbolsbrauer-t-1-classical-h1-trivial-perfect)
- [`K2SymbolsBrauer:T.1:classical/split-extensions-kill-h2`](#node-k2symbolsbrauer-t-1-classical-split-extensions-kill-h2)
- [`K2SymbolsBrauer:T.1:classical/superperfect-extensions-split`](#node-k2symbolsbrauer-t-1-classical-superperfect-extensions-split)
- [`K2SymbolsBrauer:T.1:classical/split-central-extension-universal`](#node-k2symbolsbrauer-t-1-classical-split-central-extension-universal)
- [`K2SymbolsBrauer:T.1:classical/superperfect`](#node-k2symbolsbrauer-t-1-classical-superperfect)
- [`K2SymbolsBrauer:T.1:classical/perfect-uce-exists`](#node-k2symbolsbrauer-t-1-classical-perfect-uce-exists)
- [`K2SymbolsBrauer:T.1:classical/uce-kernel-h2`](#node-k2symbolsbrauer-t-1-classical-uce-kernel-h2)
- `mathlib:groupHomology.H1`
- `mathlib:groupHomology.H2`


**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.5.4, statement (PDF p. 227, printed p. 219).
  Excerpt: “Recognition Theorem 5.4. Every perfect group G has a universal central extension, namely the extension (5.3.5): 1 → H2(G; Z) → [F, F]/[R, F] → G → 1.”
  Use: The existence statement and the extension (5.3.5).
- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.5.4, equivalent conditions and proof (PDF p. 228, printed p. 220).
  Excerpt: “Let X be any central extension of G, the following are equivalent: (1) X is a universal central extension; (2) X is perfect, and every central extension of X splits; (3) H1(X; Z) = H2(X; Z) = 0.”
  Use: The three equivalent conditions.
- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.5.4, equivalent conditions and proof (PDF p. 228, printed p. 220).
  Excerpt: “The implication (1)⇒(2) is Lemma 5.3.2 and Ex. 5.7, and (2) ⇒ (1) is immediate.”
  Use: The source's own division of the implications, which the proof steps refine into separate nodes.

<a id="node-k2symbolsbrauer-t-1-steinberg-is-uce"></a>
### The Steinberg group is the universal central extension of the elementary group

`K2SymbolsBrauer:T.1/steinberg-is-uce` · theorem · implementation unchecked

Planet: **St(R) is the universal central extension**.

For every ring R the stable Steinberg group St(R) is the universal central extension of E(R). Consequently K_2(R) is isomorphic to the second integral homology of E(R).

**Hypotheses.**

- R is an associative unital ring.


**Construction and proof.**

1. Observe that E(R) is perfect, so the Recognition Theorem applies.
2. Prove that St(R) is a central extension of E(R), which is Steinberg's centre theorem.
3. Pull a central extension of St(R) back to St_n(R) for each n >= 5. Finite splitting gives a section; perfectness and rigidity make the sections compatible. The group-colimit universal property glues them to a section.
4. Apply split-central-extension-universal (Recognition (2) ⇒ (1)) using stable centrality, Steinberg perfectness and the glued splitting; the separate T.1:plus node makes the H2 comparison.

**Acceptance.**

- The identification of K_2 with the second homology is the statement T.1:plus starts from.
- For the ring of integers both sides are cyclic of order two.
- No finite-rank UCE conclusion is drawn without a separate centrality hypothesis.


**Prerequisites.**

- [`K2SymbolsBrauer:T.1/recognition-theorem`](#node-k2symbolsbrauer-t-1-recognition-theorem)
- [`K2SymbolsBrauer:T.1/k2-is-centre`](#node-k2symbolsbrauer-t-1-k2-is-centre)
- [`K2SymbolsBrauer:T.1/finite-rank-splitting`](#node-k2symbolsbrauer-t-1-finite-rank-splitting)
- [`K2SymbolsBrauer:T.1:classical/steinberg-perfect`](#node-k2symbolsbrauer-t-1-classical-steinberg-perfect)
- `KTheoryLowDegrees:U.1`
- [`K2SymbolsBrauer:T.1:classical/perfect-extension-rigidity`](#node-k2symbolsbrauer-t-1-classical-perfect-extension-rigidity)
- [`K2SymbolsBrauer:T.1:classical/stable-steinberg-perfect`](#node-k2symbolsbrauer-t-1-classical-stable-steinberg-perfect)
- [`K2SymbolsBrauer:T.1:classical/split-central-extension-universal`](#node-k2symbolsbrauer-t-1-classical-split-central-extension-universal)


**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.5.5 (PDF p. 228).
  Excerpt: “Theorem 5.5. (Kervaire, Steinberg) The Steinberg group St(R) is the universal central extension of E(R). Hence K_2(R) = H_2(E(R); Z).”
  Use: The theorem, as displayed.

<a id="node-k2symbolsbrauer-t-1-classical-hochschild-serre-five-term-natural"></a>
### Naturality of the integral quotient five-term sequence

`K2SymbolsBrauer:T.1:classical/hochschild-serre-five-term-natural` · lemma · implementation unchecked

A commuting square of surjections q:E→Q and q′:E′→Q′ with maps a:E→E′, b:Q→Q′ induces a commuting diagram of the integral five-term sequences. On H₂ it is groupHomology.map(a,id,2) and groupHomology.map(b,id,2); on N/[E,N] it sends class(n) to class(a(n)); every connecting square commutes with the fixed positive sign.

**Hypotheses.**

- The kernel inclusion a(N)⊂N′ follows from q′a=bq.
- Use actual chain maps and the canonical quotient isomorphism; no choice of free lift enters b’s H₂ map.


**Construction and proof.**

1. chainsMap_comp turns the group square into a commuting bar-chain square. Its restriction gives the kernel chain map and a morphism of the short exact complexes.
2. On pair generators of L₁, the kernel-H₁ comparison sends the mapped difference [a(x)]−[a(y)] to class(a(xy⁻¹)). Thus the H₁ comparison is natural.
3. Apply the pinned HomologicalComplex.HomologySequence.δ_naturality to the short-exact-complex morphism. Together with the preceding generator calculation this gives the transgression square.
4. The H₂ components are literally HomologicalComplex.homologyMap of chainsMap, which is the definition of groupHomology.map. The H₁ components agree with abelianisation on generators by H1π_comp_map. This proves map-level compatibility and sign, not only abstract isomorphism of the terms.

**Acceptance.**

- For identity and composite quotient-square maps the induced sequence maps are identity and composite.
- Different middle lifts inducing the same b have the same H₂(Q) map and hence the same induced map of Hopf kernels.


**Prerequisites.**

- [`K2SymbolsBrauer:T.1:classical/hochschild-serre-integral-five-term`](#node-k2symbolsbrauer-t-1-classical-hochschild-serre-integral-five-term)
- [`K2SymbolsBrauer:T.1:classical/quotient-bar-kernel-h1`](#node-k2symbolsbrauer-t-1-classical-quotient-bar-kernel-h1)
- `mathlib:groupHomology.chainsMap_comp`
- `mathlib:groupHomology.map`
- `mathlib:groupHomology.H1π_comp_map`
- `mathlib:HomologicalComplex.HomologySequence.δ_naturality`


**Sources.**

- [Weibel.HA.Groups](https://math.mit.edu/~hrm/palestine/weibel/06-group_homology_and_cohomology.pdf), §6.8, Low Degree Terms6.8.3, printed p.196/PDF37; read text and image 2026-10-02.
  Excerpt: “H₂(E) → H₂(Q) → H₁(N)_Q → H₁(E) → H₁(Q) → 0”
  Use: The integral trivial-coefficient five-term result. The packet gives a direct kernel-of-bar-chains proof rather than claiming that this argument is printed in the source; differential and connecting-map conventions are checked against the pinned Lean statements.

<a id="node-k2symbolsbrauer-t-1-classical-hopf-formula-natural"></a>
### Naturality of Hopf's formula

`K2SymbolsBrauer:T.1:classical/hopf-formula-natural` · theorem · implementation unchecked

Let π : F → G and π' : F' → G' be surjections from free groups in Type with kernels R and R', f : G → G' a homomorphism and φ : F → F' a homomorphism with π' ∘ φ = f ∘ π. Then φ(R) ⊆ R', φ induces a homomorphism (R ∩ [F, F])/[R, F] → (R' ∩ [F', F'])/[R', F'], and under the Hopf isomorphisms of K2SymbolsBrauer:T.1/hopf-formula this homomorphism is H_2(f; Z) = groupHomology.map f (id) 2. In particular it does not depend on φ, and for f = id the Hopf isomorphisms of two presentations of G agree.

**Hypotheses.**

- F, F' are free groups in Type; π, π' are surjective with kernels R, R'; π' ∘ φ = f ∘ π; homology has trivial integral coefficients.


**Construction and proof.**

1. From π' ∘ φ = f ∘ π, φ(R) ⊆ R'; then φ([R, F]) ⊆ [R', F'] and φ([F, F]) ⊆ [F', F'], so the map of Hopf quotients is defined.
2. Apply hochschild-serre-five-term-natural to the morphism of free-presentation quotients (φ,f). Its middle map sends class(r) to class(φ(r)) and its H₂ component is literally the pinned groupHomology.map f (id)2.
3. Restrict the commuting transgression square to the kernels of N/[F,N]→F_ab. The Hopf isomorphism is this injection followed by its image identification, so its naturality follows with the same fixed sign.
4. For a fixed f, the left H₂ map does not depend on φ. The transgression injections therefore force independence of the induced map on Hopf kernels.

**Acceptance.**

- For G' = G, F' = F and φ = id the induced map is the identity.
- Different lifts can differ on the larger relation module: for F free on a, b → Z (a ↦ 1, b ↦ 0) the lifts id and b ↦ b² of the identity differ on the class of b in R/[R, F] (b-exponent sums 1 and 2), but they agree on the Hopf quotient, which is zero here since H_2(Z, Z) = 0.
- It makes the kernel identification of uce-kernel-h2 independent of the presentation.


**Prerequisites.**

- [`K2SymbolsBrauer:T.1/hopf-formula`](#node-k2symbolsbrauer-t-1-hopf-formula)
- [`K2SymbolsBrauer:T.1:classical/hopf-four-term-sequence`](#node-k2symbolsbrauer-t-1-classical-hopf-four-term-sequence)
- [`K2SymbolsBrauer:T.1:classical/relation-central-extension`](#node-k2symbolsbrauer-t-1-classical-relation-central-extension)
- [`K2SymbolsBrauer:T.1:classical/commutator-central-extension`](#node-k2symbolsbrauer-t-1-classical-commutator-central-extension)
- `mathlib:groupHomology.map`
- `mathlib:Rep.trivial`
- [`K2SymbolsBrauer:T.1:classical/hochschild-serre-five-term-natural`](#node-k2symbolsbrauer-t-1-classical-hochschild-serre-five-term-natural)


**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.5.3.4 (PDF p. 227, printed p. 219).
  Excerpt: “Example 5.3.4. Every presentation of G gives rise to two natural central extensions as follows.”
  Use: The source calls the two extensions natural but does not prove the naturality of the Hopf identification.
- [Loeh.GroupCohomology.2019](https://loeh.app.uni-regensburg.de/teaching/grouphom_ss19/lecture_notes.pdf), Proof of Theorem 3.2.18 (printed p. 131; PDF p. 139).
  Excerpt: “By the naturality of the Hochschild-Serre spectral sequence (Remark 3.2.14), this leads to a corresponding transformation between the associated Hochschild-Serre spectral sequences”
  Use: Löh identifies degree-one maps by spectral-sequence naturality. This packet supplies the required degree-two compatibility by the pinned connecting-map naturality and the explicit bar-kernel isomorphism; it does not claim that Löh constructs the spectral sequence here.

<a id="node-k2symbolsbrauer-t-1-classical-uce-kernel-h2-natural"></a>
### Naturality of the kernel of the universal central extension

`K2SymbolsBrauer:T.1:classical/uce-kernel-h2-natural` · theorem · implementation unchecked

Let f : G → G' be a homomorphism of perfect groups in Type with universal central extensions p : X → G and p' : X' → G'. Under the isomorphisms ker p ≅ H_2(G, Z) and ker p' ≅ H_2(G', Z) of uce-kernel-h2, the kernel map of the lift f̃ (uce-lift) is H_2(f; Z) = groupHomology.map f (id) 2. Taking f = id_G shows that the isomorphism of uce-kernel-h2 does not depend on the presentation used to build it.

**Hypotheses.**

- G, G' are perfect groups in Type with universal central extensions p, p'; f : G → G' is a homomorphism.


**Construction and proof.**

1. Reduce to the Hopf models of the canonical presentations F = FreeGroup G → G and F' = FreeGroup G' → G': the isomorphisms over G and G' commute with the lifts, by the uniqueness clause of uce-lift.
2. φ = FreeGroup.map f satisfies π' ∘ φ = f ∘ π; the map it induces [F, F]/[R, F] → [F', F']/[R', F'] lies over f, so it is the lift by uniqueness.
3. Its restriction to kernels is the map of Hopf quotients, which is H_2(f; Z) by hopf-formula-natural.

**Acceptance.**

- For f = id_G the kernel map is the identity, whatever presentations are used.
- For a ring map R → S it gives the naturality of K_2(R) ≅ H_2(E(R), Z) that K2SymbolsBrauer:T.1/k2-h2-elementary asserts.


**Prerequisites.**

- [`K2SymbolsBrauer:T.1:classical/uce-kernel-h2`](#node-k2symbolsbrauer-t-1-classical-uce-kernel-h2)
- [`K2SymbolsBrauer:T.1:classical/uce-lift`](#node-k2symbolsbrauer-t-1-classical-uce-lift)
- [`K2SymbolsBrauer:T.1:classical/hopf-formula-natural`](#node-k2symbolsbrauer-t-1-classical-hopf-formula-natural)
- `mathlib:FreeGroup.map`
- `mathlib:groupHomology.map`


**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), Theorem III.5.5 (PDF p. 228, printed p. 220).
  Excerpt: “Theorem 5.5. (Kervaire, Steinberg) The Steinberg group St(R) is the universal central extension of E(R). Hence K2(R) ≅ H2(E(R); Z).”
  Use: The identification whose naturality in the ring the later chapters use; the source does not state the naturality, which is derived here from uce-lift and hopf-formula-natural.

<a id="stage-k2symbolsbrauer-t-1-plus"></a>
## T.1:plus — Classical K₂ and the plus construction

Compare the universal central extension with H₂(E(R);ℤ), then with π₂ of the plus-construction K-theory space. Import the early plus construction of GeneralAlgebraicKTheory K.2:plus; its later low-degree comparison consumes this explicit model and cannot supply the same comparison here.

Coverage: **partial**.

**Remaining proof and supply obligations.**

- Independent review of this revision.


<a id="node-k2symbolsbrauer-t-1-k2-h2-elementary"></a>
### K_2 is the second homology of the elementary group

`K2SymbolsBrauer:T.1/k2-h2-elementary` · theorem · implementation unchecked

Planet: **K2 is H2 of E(R)**.

For every ring R there is an isomorphism from K_2(R) to the second integral homology of E(R), natural in R. It is the identification of the kernel of the universal central extension with the kernel given by the Hopf formula.

**Hypotheses.**

- R is an associative unital ring.


**Construction and proof.**

1. Import that St(R) is the universal central extension of E(R) (steinberg-is-uce); E(R) is perfect.
2. uce-kernel-h2 applied to St(R) → E(R), with kernel K_2(R) (k2-definition), gives K_2(R) ≅ H_2(E(R), Z); the isomorphism is of kernels, compatible with the projections to E(R).
3. Naturality in the ring: for φ : R → S the functoriality map St(R) → St(S) is the lift of E(φ) (uce-lift, by uniqueness), and uce-kernel-h2-natural identifies its kernel map with H_2(E(φ); Z).
4. Gap G-natural-Hopf enters through hopf-formula-natural.

**Acceptance.**

- For the ring of integers both sides are cyclic of order two.
- The isomorphism is natural, which is what the comparison with homotopy needs.
- The identification is of kernels, not merely an abstract isomorphism of abelian groups; the acceptance test is the compatibility with the two projections.


**Prerequisites.**

- [`K2SymbolsBrauer:T.1/steinberg-is-uce`](#node-k2symbolsbrauer-t-1-steinberg-is-uce)
- [`K2SymbolsBrauer:T.1/hopf-formula`](#node-k2symbolsbrauer-t-1-hopf-formula)
- [`K2SymbolsBrauer:T.1/k2-definition`](#node-k2symbolsbrauer-t-1-k2-definition)
- [`K2SymbolsBrauer:T.1:classical/uce-kernel-h2`](#node-k2symbolsbrauer-t-1-classical-uce-kernel-h2)
- [`K2SymbolsBrauer:T.1:classical/uce-lift`](#node-k2symbolsbrauer-t-1-classical-uce-lift)
- [`K2SymbolsBrauer:T.1:classical/uce-kernel-h2-natural`](#node-k2symbolsbrauer-t-1-classical-uce-kernel-h2-natural)
- `mathlib:groupHomology.H2`


**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.5.5 (PDF p. 228).
  Excerpt: “Hence K_2(R) = H_2(E(R); Z).”
  Use: The identification, as displayed.

<a id="node-k2symbolsbrauer-t-1-k2-pi2"></a>
### K_2 is the second homotopy group of the K-theory space

`K2SymbolsBrauer:T.1/k2-pi2` · theorem · implementation unchecked

Planet: **K2 is the second homotopy group**.

For every ring R there is an isomorphism from K_2(R) to the second homotopy group of the plus construction on the classifying space of the stable general linear group, natural in R. It is obtained by combining the identification with the second homology of E(R) with the Hurewicz theorem applied to the simply connected space obtained from the plus construction.

**Hypotheses.**

- R is an associative unital ring.


**Construction and proof.**

1. Import the plus construction and the K-theory space, and the fact that the plus construction on the classifying space of the stable elementary group is the universal cover of the plus construction on the classifying space of the stable general linear group.
2. That space is simply connected, and its second homotopy group is its second homology by the Hurewicz theorem.
3. Its second homology is the second homology of E(R), by the homology isomorphism the plus construction provides.
4. Compose with the identification of the previous node and prove naturality.
5. Record the division of labour: the plus construction belongs to StableHomotopyKTheory, the K-theory space to GeneralAlgebraicKTheory, and this layer supplies the explicit model they are compared with.
6. Gap G-cover-Hurewicz: H.3 promises relative plus and acyclicity, but not an implemented covering comparison or a chosen Hurewicz map. These supplier interfaces and naturality must be constructed explicitly.

**Acceptance.**

- The composite isomorphism is natural in the ring.
- For a finite field both sides are trivial.
- The Hurewicz step needs simple connectivity, which is why the elementary group, and not the general linear group, appears.


**Prerequisites.**

- [`K2SymbolsBrauer:T.1/k2-h2-elementary`](#node-k2symbolsbrauer-t-1-k2-h2-elementary)
- `StableHomotopyKTheory:H.3`
- `GeneralAlgebraicKTheory:K.2:plus`
- `mathlib:HomotopyGroup`
- `KTheoryLowDegrees:U.1`


**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), IV.1.7.1 and Exercise IV.1.8 (PDF pp. 273, 282).
  Excerpt: “Classical K2 agrees with the second homotopy group of BGL(R)+; BE(R)+ supplies its simply connected covering model.”
  Use: Paraphrase of the indicated passage; checked in the author copy, not a quotation from the published edition.

<a id="stage-k2symbolsbrauer-t-2-symbols"></a>
## T.2:symbols — Unit symbols and Milnor K-theory

Build indexed diagonal lifts, commuting-unit symbols, their identities and Matsumoto’s field presentation. Define the integral graded Milnor algebra and its low-degree and arithmetic computations. Field and semilocal generation do not supply the general finite-rank monomial-kernel lemma needed over ℤ.

Coverage: **partial**.

**Remaining proof and supply obligations.**

- Independent review of this revision.
- The general form of the symbol of a unit with its negative rests on a later chapter
- Bass and Tate are cited for two Milnor K-theory computations
- G-matrix: associative-ring elementary calculus
- G-universal-negative: Laurent-ring localization injection
- G-restriction-transfer: continuity and degree
- G-algclosed: unique divisibility in degrees at least two
- G-real: complementary divisibility
- G-Bass-Tate: arithmetic Milnor computations


<a id="node-k2symbolsbrauer-t-2-star-product"></a>
### The star product of commuting matrices

`K2SymbolsBrauer:T.2/star-product` · construction · implementation unchecked

If two matrices of E(R) commute, lift them to St(R) and define their star product to be the commutator of the lifts, an element of K_2(R). The definition does not depend on the lifts, because two lifts differ by central elements. The star product is invariant under simultaneous conjugation by an element of GL(R), is skew-symmetric, and is bilinear.

**Hypotheses.**

- R is an associative unital ring; the two matrices lie in E(R) and commute.


**Construction and proof.**

1. Choose lifts and form their commutator; the image in E(R) is trivial, so it lies in K_2(R).
2. Prove independence of the lifts: two lifts differ by central elements, which drop out of a commutator.
3. Prove conjugation invariance by lifting the block diagonal matrix built from the conjugating element and its inverse, and using that the commutator is central. The block-diagonal elementary factorization is imported from U.1; its compatible generator-level factorization is gap G-Whitehead.
4. Prove skew-symmetry and bilinearity from the commutator identities.
5. Record that the construction needs the two matrices to commute; without that hypothesis the commutator does not land in K_2(R).

**Acceptance.**

- The star product of a matrix with itself is trivial.
- It is invariant under simultaneous conjugation.
- Bilinearity holds in each variable separately, for commuting arguments.


**Prerequisites.**

- [`K2SymbolsBrauer:T.1/k2-definition`](#node-k2symbolsbrauer-t-1-k2-definition)
- [`K2SymbolsBrauer:T.1/k2-is-centre`](#node-k2symbolsbrauer-t-1-k2-is-centre)
- `mathlib:commutatorElement`
- `KTheoryLowDegrees:U.1`


**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `starProduct` | constructor | The star product of two commuting elements of E(R). |
| `starProduct_lift_indep` | characterisation | It does not depend on the chosen lifts. |
| `starProduct_conj` | relation | Invariance under simultaneous conjugation by an element of GL(R). |
| `starProduct_skew` | relation | Skew-symmetry. |
| `starProduct_mul_left` | relation | For A1,A2,B in E(R), if each Ai commutes with B then (A1*A2) star B=(A1 star B)*(A2 star B). No mutual commutation of A1 and A2 is required. |
| `starProduct_mul_right` | relation | For A commuting with B1 and B2 in E(R), A star (B1*B2)=(A star B1)*(A star B2). |

**Consumers.**

- T.2's Steinberg symbol — the symbol is the star product of two specific diagonal matrices
- T.2's Steinberg identity — the identity is proved by a computation with lifts of these matrices


**Unit tests.**

- `self` — For A in E(R), A star A=1 using the same lift twice.
- `forward_vs_star` — Over Z in rank three, e_01(1) and e_12(1) do not commute; their lifted commutator maps to e_02(1), so it cannot be a K2-valued star input.
- `nontrivial_diagonal` — Over Z, diag(-1,-1,1) star diag(-1,1,-1) is {-1,-1}, the nontrivial K2(Z) class once T.5 supplies that computation.
- `multiply_commuting_inputs` — For A1,A2 each commuting with B, the product rule holds; omit either commutation proof and the construction is ill-typed.


**Suggested placement.** module: `TauCeti/Algebra/KTheory/MilnorK`; namespace: `TauCeti.MilnorK`.

**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.5 Steinberg symbols (PDF p. 233).
  Excerpt: “If two matrices A, B in E(R) commute, we can construct an element in K_2(R) by lifting their commutator to St(R). ... This definition is independent of the choice of a and b because any other lift will equal ac, bc' for central elements c, c', and [ac, bc'] = [a, b].”
  Use: The construction and its independence of lifts, as displayed.

<a id="node-k2symbolsbrauer-t-2-milnor-k-theory"></a>
### Milnor K-theory of a field

`K2SymbolsBrauer:T.2/milnor-k-theory` · definition · implementation unchecked

Planet: **Milnor K-theory**.

For a field F form the tensor algebra of the multiplicative group written additively, with the degree-one element attached to a nonzero x written l(x). Define the graded ring K^M of F as the quotient of that tensor algebra by the two-sided ideal generated by the homogeneous elements l(x) tensor l(one minus x) with x different from zero and one. The Milnor K-group in degree n is the degree-n part, presented by symbols that are multiplicative in each entry and vanish when two consecutive entries sum to one. Degree zero is the integers and degree one is the multiplicative group written additively.

**Hypotheses.**

- F is a field.
- All tensor products are over the integers.


**Construction and proof.**

1. Form the tensor algebra of the unit group, using the additive type tag and the pinned tensor algebra.
2. Form the two-sided ideal generated by the displayed homogeneous elements and take the quotient as a graded ring, using the pinned quotient construction.
3. Prove that the quotient is graded, so that the degree-n parts are defined.
4. Prove the two low-degree identifications, degree zero and degree one.
5. Prove the presentation statement: the degree-n group is generated by the symbols subject to multiplicativity in each entry and the vanishing relation.
6. Prove functoriality in the field.
7. Gap G-graded-quotient: implement the homogeneous ideal and degree decomposition, quotient universal property and field-map action on the pinned tensor algebra. RingQuot alone carries no grading.

**Acceptance.**

- Degree zero is the integers and degree one is the unit group written additively.
- Degree two has the bilinear Steinberg presentation; comparison with classical K2 is supplied by the separate Matsumoto node and remains conditional on its gap.
- The ideal is generated by homogeneous elements of degree two, so the quotient is graded; a non-homogeneous generator would destroy the grading.


**Prerequisites.**

- `mathlib:TensorAlgebra`
- `mathlib:Additive`
- `mathlib:RingQuot`
- `mathlib:Units`


**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `milnorK` | data | The graded ring, and its degree-n part. |
| `milnorK.symbol` | constructor | The symbol of an n-tuple of nonzero elements. |
| `milnorK.symbol_mul` | relation | Multiplicativity in each entry. |
| `milnorK.symbol_steinberg` | relation | Vanishing when two consecutive entries sum to one. |
| `milnorK.zero` | compatibility | Degree zero is the integers. |
| `milnorK.one` | compatibility | Degree one is the unit group written additively. |
| `milnorK.map` | functoriality | Functoriality in the field. |
| `milnorK.hom_ext` | extensionality | Graded ring maps agreeing on degree-one units are equal, since products of these generate. |
| `milnorK.lift` | universal-property | A homomorphism F× -> degree-one elements of a graded target that kills every Steinberg product extends uniquely to a graded ring map. |
| `milnorK.map_id_comp` | simp | Field maps induce graded maps respecting identity and composition on every symbol. |
| `milnorK.symbol_product` | structure | Concatenating two tuples gives the product of their symbols with degree addition. |

**Consumers.**

- T.2's Matsumoto comparison — the degree-two group is identified with K_2
- HigherLocalFieldsAndHigherClassFieldTheory HL.1 — that layer assembles these groups along a residue tower and imports rather than rebuilds them
- K3BlochGroups V.2 — the degree-three group is the source of the map whose cokernel is the indecomposable K_3


**Unit tests.**

- `degree_zero_one` — Degree zero is the integers and degree one is the unit group.
- `finite_field` — For a finite field every degree at least two vanishes.
- `graded` — The quotient is graded, because the ideal is generated in a single degree.
- `not_alternating_by_fiat` — The alternating property is a theorem, proved from skew-symmetry in degree two, not an axiom.


**Suggested placement.** module: `TauCeti/Algebra/KTheory/MilnorK`; namespace: `TauCeti.MilnorK`.

**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.7.1 (PDF p. 253).
  Excerpt: “Definition 7.1. The graded ring K^M_*(F) is defined to be the quotient of T(F^x) by the ideal generated by the homogeneous elements l(x) tensor l(1 - x) with x not 0, 1. The Milnor K-group K^M_n(F) is defined to be the subgroup of elements of degree n.”
  Use: The definition, as displayed.

<a id="node-k2symbolsbrauer-t-2-symbols-diagonal-lift-words"></a>
### Weyl lift words

`K2SymbolsBrauer:T.2:symbols/diagonal-lift-words` · definition · implementation unchecked

For i != j and a unit r, define w_ij(r)=x_ij(r)x_ji(-r^-1)x_ij(r). Its elementary image has block [[0,r],[-r^-1,0]] at coordinates i,j.

**Hypotheses.**

- R is an associative unital ring; r and s are commuting units.


**Construction and proof.**

1. Evaluate the three indexed generators under the elementary map.
2. Multiply the 2x2 block using both inverse identities, retaining the reversed indices and minus sign.
3. The general associative-ring matrix-unit interface is G-matrix; commutative specialization is checked by the pinned decomposition.

**Acceptance.**

- For i != j and a unit r, define w_ij(r)=x_ij(r)x_ji(-r^-1)x_ij(r). Its elementary image has block [[0,r],[-r^-1,0]] at coordinates i,j.


**Prerequisites.**

- [`K2SymbolsBrauer:T.1:classical/to-elementary`](#node-k2symbolsbrauer-t-1-classical-to-elementary)
- [`K2SymbolsBrauer:T.1/stabilisation`](#node-k2symbolsbrauer-t-1-stabilisation)
- `mathlib:Units`
- `mathlib:Matrix.diag2_decompose`
- `tauceti:Matrix.SpecialLinearGroup.diag2nUnit_decompose`


**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `w` | constructor | The indexed word w_ij(r) for i != j. |
| `w_phi` | compatibility | phi(w_ij(r)) has r,-r^-1 in the two off-diagonal positions. |
| `w_map` | functoriality | Unital ring homomorphisms preserve the indexed word and its elementary image. |

**Consumers.**

- K2SymbolsBrauer:T.2/steinberg-symbol — The symbol is the commutator of two indexed diagonal lifts sharing their first index.


**Unit tests.**

- `unit_sign` — w_01(1) has block [[0,1],[-1,0]].
- `negative_unit` — w_01(-1) has block [[0,-1],[1,0]].
- `indexed_inverse` — Over Q, w_12(2) has off-diagonal entries 2 and -1/2 in positions (1,2),(2,1), and entry 1 at (0,0).


**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.5.10.1 (PDF p. 233).
  Excerpt: “The source defines two indexed words and computes their elementary matrix images.”
  Use: Paraphrase of the indicated passage; checked in the author copy, not a quotation from the published edition.

<a id="node-k2symbolsbrauer-t-2-symbols-milnor-algebraically-closed"></a>
### Milnor groups of algebraically closed fields

`K2SymbolsBrauer:T.2:symbols/milnor-algebraically-closed` · lemma · implementation unchecked

For an algebraically closed field F and n >= 2, K_n^M(F) is uniquely divisible. In degree one F× is divisible but need not be uniquely divisible; degree zero is Z.

**Hypotheses.**

- F is algebraically closed.
- n >= 2.


**Construction and proof.**

1. Divisibility follows by taking roots in the first symbol entry.
2. Gap G-algclosed: decompose the no-p-torsion proof referred to Exercise III.7.3 and the degree-two norm argument III.6.4.
3. Correct the omitted degree restriction in III.7.2(b); C× has nontrivial roots of unity.

**Acceptance.**

- For an algebraically closed field F and n >= 2, K_n^M(F) is uniquely divisible. In degree one F× is divisible but need not be uniquely divisible; degree zero is Z.


**Prerequisites.**

- [`K2SymbolsBrauer:T.2/milnor-k-theory`](#node-k2symbolsbrauer-t-2-milnor-k-theory)


**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.7.2(b) and Exercise III.7.3 (PDF pp. 253, 265).
  Excerpt: “The algebraically closed calculation must be restricted to degrees at least two to exclude Z and the torsion in F×.”
  Use: Paraphrase of the indicated passage; checked in the author copy, not a quotation from the published edition.

<a id="node-k2symbolsbrauer-t-2-symbols-milnor-global-positive-characteristic"></a>
### Bass-Tate vanishing over positive-characteristic global fields

`K2SymbolsBrauer:T.2:symbols/milnor-global-positive-characteristic` · theorem · implementation unchecked

If F has transcendence degree one over a finite field and n >= 3, K_n^M(F)=0.

**Hypotheses.**

- F has transcendence degree one over a finite field.
- n >= 3.


**Construction and proof.**

1. Gap G-Bass-Tate: obtain and decompose the cited Bass-Tate argument; finite-field vanishing alone does not prove this transcendence-degree-one result.

**Acceptance.**

- If F has transcendence degree one over a finite field and n >= 3, K_n^M(F)=0.


**Prerequisites.**

- [`K2SymbolsBrauer:T.2/milnor-k-theory`](#node-k2symbolsbrauer-t-2-milnor-k-theory)


**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.7.2(a) (PDF p. 253).
  Excerpt: “Milnor groups of a positive-characteristic global field vanish in degrees at least three.”
  Use: Paraphrase of the indicated passage; checked in the author copy, not a quotation from the published edition.
- [Kbook.III.chapter](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.III.pdf), III.7.2(a),(d), PDF pp.61–62.
  Excerpt: “The general global-field Milnor theorem is already owned here; its original Bass–Tate proof remains the existing gap.”
  Use: Paraphrase of the inspected passage, not a quotation. The general global-field Milnor theorem is already owned here; its original Bass–Tate proof remains the existing gap.

<a id="node-k2symbolsbrauer-t-2-symbols-diagonal-lift"></a>
### Diagonal lift words

`K2SymbolsBrauer:T.2:symbols/diagonal-lift` · definition · implementation unchecked

For i != j and a unit r, define h_ij(r)=w_ij(r)w_ij(-1). Its elementary image is diagonal with r,r^-1 in positions i,j.

**Hypotheses.**

- R is an associative unital ring; r and s are commuting units.


**Construction and proof.**

1. Use the separately defined w word and its image.
2. Multiply the two monomial images to obtain the indexed diagonal entries.

**Acceptance.**

- For i != j and a unit r, define h_ij(r)=w_ij(r)w_ij(-1). Its elementary image is diagonal with r,r^-1 in positions i,j.


**Prerequisites.**

- [`K2SymbolsBrauer:T.2:symbols/diagonal-lift-words`](#node-k2symbolsbrauer-t-2-symbols-diagonal-lift-words)


**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `h` | constructor | For i != j and a unit r, define h_ij(r)=w_ij(r)w_ij(-1). Its elementary image is diagonal with r,r^-1 in positions i,j. |
| `h_phi` | compatibility | The image is diag(r,r^-1) on coordinates i,j. |
| `h_map` | functoriality | Ring homomorphisms preserve h_ij(r), retaining the two indices. |

**Consumers.**

- K2SymbolsBrauer:T.2/steinberg-symbol — The symbol is the commutator of two indexed diagonal lifts sharing their first index.


**Unit tests.**

- `identity_image` — h_01(1) has identity elementary image.
- `inverse_parameter` — Over Q, h_01(2) has diagonal image (2,1/2,1).
- `indexed_positions` — Over Q, h_12(2) has diagonal image (1,2,1/2).


**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.5.10.1 (PDF p. 233).
  Excerpt: “The source defines two indexed words and computes their elementary matrix images.”
  Use: Paraphrase of the indicated passage; checked in the author copy, not a quotation from the published edition.

<a id="node-k2symbolsbrauer-t-2-steinberg-symbol"></a>
### The Steinberg symbol

`K2SymbolsBrauer:T.2/steinberg-symbol` · definition · implementation unchecked

Planet: **Steinberg symbol**.

For commuting units r and s of a ring R define the Steinberg symbol as the star product of the diagonal matrix with r and r inverse at two coordinates with the diagonal matrix with s and s inverse at two coordinates chosen to overlap in exactly one index. Equivalently it is the commutator of the elements h_ij(r) and h_ik(s) of St(R), where w_ij(r) is the word x_ij(r) x_ji(minus r inverse) x_ij(r) and h_ij(r) is w_ij(r) w_ij(minus one). The symbol is skew-symmetric and bilinear.

**Hypotheses.**

- R is an associative unital ring; r and s are commuting units.


**Construction and proof.**

1. Use the separately defined indexed w and h words and their elementary images.
2. For commutative rings, the pinned diagonal decompositions check the image calculation. For associative rings, multiply the explicit 2x2 word using r*r^-1=r^-1*r=1; gap G-matrix covers its matrix-unit interface.
3. Define the symbol as the star product of the two diagonal matrices, or equivalently as the commutator of h_ij(r) and h_ik(s), and prove the two agree.
4. Prove that the symbol does not depend on the choice of the three indices.
5. Deduce skew-symmetry and bilinearity from the corresponding properties of the star product.

**Acceptance.**

- The symbol of one with anything is trivial.
- Skew-symmetry and bilinearity hold.
- The symbol is defined for commuting units of any ring, not only for a field; the field case is where Matsumoto's theorem applies.


**Prerequisites.**

- [`K2SymbolsBrauer:T.2/star-product`](#node-k2symbolsbrauer-t-2-star-product)
- [`K2SymbolsBrauer:T.1/steinberg-group-finite-rank`](#node-k2symbolsbrauer-t-1-steinberg-group-finite-rank)
- [`K2SymbolsBrauer:T.1/stabilisation`](#node-k2symbolsbrauer-t-1-stabilisation)
- `mathlib:Matrix.diag2_decompose`
- `tauceti:Matrix.SpecialLinearGroup.diag2nUnit_decompose`
- `mathlib:Units`
- [`K2SymbolsBrauer:T.2:symbols/diagonal-lift-words`](#node-k2symbolsbrauer-t-2-symbols-diagonal-lift-words)
- [`K2SymbolsBrauer:T.2:symbols/diagonal-lift`](#node-k2symbolsbrauer-t-2-symbols-diagonal-lift)


**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `steinbergSymbol` | constructor | The symbol of two commuting units. |
| `steinbergSymbol_eq_commutator` | characterisation | It is the commutator of h_ij(r) and h_ik(s). |
| `steinbergSymbol_one` | simp | The symbol with a one entry is trivial. |
| `steinbergSymbol_mul_left` | relation | Bilinearity for a pairwise commuting triple r1,r2,s of units. Over a commutative ring the commuting hypotheses are automatic. |
| `steinbergSymbol_skew` | relation | Skew-symmetry. |
| `steinbergSymbol_index_indep` | characterisation | Independence of the chosen indices. |
| `steinbergSymbol_map` | functoriality | Unital ring homomorphisms preserve the commuting-unit symbol and its indexed commutator formula. |

**Consumers.**

- T.2's Matsumoto theorem — the theorem presents K_2 of a field by these symbols
- Milnor K-theory — the degree-two Milnor symbols are identified with these
- K3BlochGroups V.5 — the decomposable class in K_3 of the rationals is built from the symbol with three minus-one entries


**Unit tests.**

- `one_entry` — The symbol with a one entry is trivial.
- `minus_one_integers` — For the integers the symbol of minus one with itself is the nontrivial element of K_2(Z).
- `bilinear` — The product rule holds for pairwise commuting units r1,r2,s; in a commutative field it has no extra condition.
- `not_alternating_integrally` — The symbol of a with itself is not trivial in general, which the next node computes.


**Suggested placement.** module: `TauCeti/Algebra/KTheory/MilnorK`; namespace: `TauCeti.MilnorK`.

**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.5.10 and III.5.10.1 (PDF p. 233).
  Excerpt: “Definition 5.10. If r, s are commuting units in a ring R, we define the Steinberg symbol {r, s} in K_2(R) to be the star product of the two displayed diagonal matrices. ... For any unit r”
  Use: The definition and the two descriptions, as displayed.

<a id="node-k2symbolsbrauer-t-2-steinberg-identity"></a>
### The Steinberg identity

`K2SymbolsBrauer:T.2/steinberg-identity` · theorem · implementation unchecked

Planet: **Steinberg identity**.

If r and 1-r are units of an associative unital ring, the Steinberg symbol {r,1-r} is 1.

**Hypotheses.**

- R is an associative unital ring; r is a unit, and for the first statement one minus r is also a unit.


**Construction and proof.**

1. Prove the first statement by the explicit computation in the Steinberg group that the source performs: rewrite the product of the three w-elements using the commutation rules, and use the four identities among r and one minus r that the source lists, to obtain the w-element of the product.
2. Multiply by the w-element at minus one to obtain the multiplicativity of the h-elements when the two arguments sum to one, and deduce that the symbol vanishes.

**Acceptance.**

- Both r and 1-r must be units.
- The two entries commute because (1-r)r=r(1-r).
- No symbol with a zero entry is constructed.


**Prerequisites.**

- [`K2SymbolsBrauer:T.2/steinberg-symbol`](#node-k2symbolsbrauer-t-2-steinberg-symbol)
- [`K2SymbolsBrauer:T.1/steinberg-group-finite-rank`](#node-k2symbolsbrauer-t-1-steinberg-group-finite-rank)


**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.5.10.2, III.5.10.3 and III.5.10.4 (PDF pp. 233-234).
  Excerpt: “Lemma 5.10.2. If both r and 1 - r are units of R, then in K_2(R) we have: {r, 1 - r} = 1 and {r, -r} = 1. ... Remark 5.10.4. The equation {r, -r} = 1 holds more generally for every unit r, even if 1 - r is not a unit.”
  Use: The lemma and the remark, as displayed, with the computation of the cited proof.

<a id="node-k2symbolsbrauer-t-2-symbols-generate"></a>
### Steinberg symbols generate K_2 of a semilocal ring

`K2SymbolsBrauer:T.2/symbols-generate` · theorem · implementation unchecked

Steinberg symbols generate K2(R) for fields and division rings as in Milnor's cited theorem, and for COMMUTATIVE local or semilocal rings as in the Dennis-Stein extension. The latter commutativity is explicit in the prose preceding III.5.10.5.

**Hypotheses.**

- R is a field or division ring; alternatively R is a commutative local or semilocal ring.


**Construction and proof.**

1. The author copy cites Milnor for fields/division rings and Dennis-Stein for commutative semilocal rings. These proofs were not obtained; this is the unresolved generation gap, not a proof step discharged by the citation.
2. Record the hypothesis: for a general ring the symbols need not generate, which is why the Dennis-Stein symbols are introduced.
3. Record the consequence used below: for a field the presentation of Matsumoto's theorem is a presentation of the whole group, not of a subgroup.

**Acceptance.**

- For a field the symbols generate, which Matsumoto's theorem then presents.
- For a general commutative ring generation is not asserted.
- The Dennis-Stein symbols are introduced precisely because of that gap.


**Prerequisites.**

- [`K2SymbolsBrauer:T.2/steinberg-symbol`](#node-k2symbolsbrauer-t-2-steinberg-symbol)
- [`K2SymbolsBrauer:T.1/k2-definition`](#node-k2symbolsbrauer-t-1-k2-definition)


**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.5.10.5 (PDF p. 234).
  Excerpt: “Theorem 5.10.5. If R is a field, division ring, local ring, or even a semilocal ring, then K_2(R) is generated by the Steinberg symbols {r, s}.”
  Use: The theorem and its hypotheses, as displayed.

<a id="node-k2symbolsbrauer-t-2-symbols-symbol-negative-unit"></a>
### The symbol of a unit and its negative

`K2SymbolsBrauer:T.2:symbols/symbol-negative-unit` · theorem · implementation unchecked

For every unit r of an associative unital ring R, {r,-r}=1, without requiring 1-r to be invertible.

**Hypotheses.**

- R is an associative unital ring; r is a unit, and for the first statement one minus r is also a unit.


**Construction and proof.**

1. First deduce the identity when 1-r is invertible by writing -r=(1-r)/(1-r^-1) and using Steinberg and bilinearity.
2. In the UNIVERSAL ring Z[t,t^-1], use injectivity on K2 into Z[t,t^-1,(1-t)^-1] to descend the identity.
3. Then specialize the Laurent polynomial ring by t -> r into R; do not require a map from the further localization into R.
4. Gap G-universal-negative: the universal localization injectivity in V.6.1.3 was not decomposed or supplied by a baseline declaration.

**Acceptance.**

- For every unit r of an associative unital ring R, {r,-r}=1, without requiring 1-r to be invertible.


**Prerequisites.**

- [`K2SymbolsBrauer:T.2/steinberg-identity`](#node-k2symbolsbrauer-t-2-steinberg-identity)
- [`K2SymbolsBrauer:T.2/steinberg-symbol`](#node-k2symbolsbrauer-t-2-steinberg-symbol)


**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.5.10.3-.4 (PDF p. 234).
  Excerpt: “The general negative-unit relation follows by first working in the universal Laurent polynomial ring.”
  Use: Paraphrase of the indicated passage; checked in the author copy, not a quotation from the published edition.

<a id="node-k2symbolsbrauer-t-2-symbol-consequences"></a>
### Skew-symmetry, and the correct value of the symbol of a unit with itself

`K2SymbolsBrauer:T.2/symbol-consequences` · lemma · implementation unchecked

The Steinberg symbols are skew-symmetric: the symbol of a with b times the symbol of b with a is trivial. The symbol of a with itself is the symbol of a with minus one, which is an element of order dividing two; it is not trivial in general. Asserting that the symbol of a with itself vanishes integrally is an error.

**Hypotheses.**

- R is an associative unital ring; a and b are commuting units.


**Construction and proof.**

1. Skew-symmetry is inherited directly from the star product, avoiding a new circular dependence on negative-unit identities.
2. From the vanishing of the symbol of a with minus a and bilinearity obtain that the symbol of a with itself is the inverse of the symbol of a with minus one.
3. Prove that the symbol of a with minus one squares to the symbol of a with one, which is trivial, so it has order dividing two; hence the symbol of a with itself equals the symbol of a with minus one.
4. Record the negative statement: skew-symmetry gives that the square of the symbol of a with itself is trivial, and nothing more.

**Acceptance.**

- For the integers the symbol of minus one with itself is the nontrivial element of K_2(Z), so the symbol of a unit with itself is not always trivial.
- For a finite field of even order the symbol of a with itself is trivial, because minus one is one there.
- Skew-symmetry holds in general and is what the alternating property of Milnor K-theory rests on.


**Prerequisites.**

- [`K2SymbolsBrauer:T.2/steinberg-identity`](#node-k2symbolsbrauer-t-2-steinberg-identity)
- [`K2SymbolsBrauer:T.2/steinberg-symbol`](#node-k2symbolsbrauer-t-2-steinberg-symbol)
- [`K2SymbolsBrauer:T.2:symbols/symbol-negative-unit`](#node-k2symbolsbrauer-t-2-symbols-symbol-negative-unit)


**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.6.1 (PDF p. 239).
  Excerpt: “Note that the calculation (5.10.3) implies that {x, -x} = 1 for all x, and this implies that the Steinberg symbols are skew-symmetric: {x, y}{y, x} = {x, -xy}{y, -xy} = {xy, -xy} = 1.”
  Use: The derivation of skew-symmetry, as displayed; the value of the symbol of a unit with itself follows from the same identity.

<a id="node-k2symbolsbrauer-t-2-matsumoto"></a>
### Matsumoto's theorem

`K2SymbolsBrauer:T.2/matsumoto` · theorem · implementation unchecked

Planet: **Matsumoto's theorem**.

For a field F the group K_2(F) is the abelian group generated by the Steinberg symbols of pairs of nonzero elements, subject only to bilinearity in each entry and the Steinberg identity that the symbol of x with one minus x is trivial for x different from zero and one. Equivalently, K_2(F) is the quotient of the tensor square of the multiplicative group by the subgroup generated by the elements x tensor one minus x.

**Hypotheses.**

- F is a field.


**Construction and proof.**

1. State the presentation and prove that the displayed relations hold, which is the content of the symbol nodes above.
2. Gap G-Matsumoto: obtain and decompose the converse/presentation argument from an accessible original source. Milnor section 12 was not read; respecting relations and symbol generation provide only a surjection.
3. Record the reformulation as a quotient of the tensor square, which is the form Milnor K-theory generalises.
4. Deduce skew-symmetry inside the presentation, by the computation already recorded.

**Acceptance.**

- The presentation gives K_2 of a finite field trivial, which is the next node and a genuine test of the presentation.
- The reformulation as a quotient of the tensor square is the degree-two case of Milnor K-theory.
- The theorem is a presentation, not merely a surjection: the normal-form argument is what distinguishes the two, and a proof that only checks the relations is incomplete.


**Prerequisites.**

- [`K2SymbolsBrauer:T.2/steinberg-symbol`](#node-k2symbolsbrauer-t-2-steinberg-symbol)
- [`K2SymbolsBrauer:T.2/steinberg-identity`](#node-k2symbolsbrauer-t-2-steinberg-identity)
- [`K2SymbolsBrauer:T.2/symbols-generate`](#node-k2symbolsbrauer-t-2-symbols-generate)
- [`K2SymbolsBrauer:T.2/symbol-consequences`](#node-k2symbolsbrauer-t-2-symbol-consequences)


**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.6.1 (PDF p. 239).
  Excerpt: “Matsumoto's Theorem 6.1. If F is a field then K_2(F) is the abelian group generated by the set of Steinberg symbols {x, y} with x, y in F^x, subject only to the relations: (Bilinearity)”
  Use: The theorem and its reformulation, as displayed.

<a id="node-k2symbolsbrauer-t-2-k2-finite-field"></a>
### K_2 of a finite field is trivial

`K2SymbolsBrauer:T.2/k2-finite-field` · theorem · implementation unchecked

For every finite field the group K_2 is trivial.

**Hypotheses.**

- F is a finite field with q elements.


**Construction and proof.**

1. Reduce by Matsumoto's theorem to showing that the generator of the tensor square of the cyclic unit group dies, that is, that the symbol of a generator with itself is trivial.
2. In even characteristic use that minus one is one, so the symbol of a generator with itself is the symbol of the generator with its negative, which is trivial.
3. In odd characteristic use skew-symmetry to see that the symbol of the generator with itself squares to the trivial element, so it equals the symbol of any odd power of the generator with any other odd power.
4. Conclude by finding a non-square u for which one minus u is also a non-square: the map sending u to one minus u is an involution of the set of elements different from zero and one, which has (q minus one) halves non-squares and only (q minus three) halves squares, so such a u exists.
5. Apply the Steinberg identity at that u.
6. Gap G-finite-units: choose and verify the pinned cyclic-unit-group theorem and implement the finite counting argument; ZMod alone supplies neither.

**Acceptance.**

- The counting step is what makes the argument work and is recorded, not asserted.
- The two characteristics are treated separately.
- The conclusion feeds the Milnor K-theory examples: all higher Milnor K-groups of a finite field vanish.


**Prerequisites.**

- [`K2SymbolsBrauer:T.2/matsumoto`](#node-k2symbolsbrauer-t-2-matsumoto)
- [`K2SymbolsBrauer:T.2/symbol-consequences`](#node-k2symbolsbrauer-t-2-symbol-consequences)
- `mathlib:ZMod`


**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.6.1.1 (PDF p. 239).
  Excerpt: “Corollary 6.1.1. K_2(F_q) = 1 for every finite field F_q.”
  Use: The corollary, with the counting proof of the source.

<a id="node-k2symbolsbrauer-t-2-rational-function-field"></a>
### K_2 of a field is a direct summand of K_2 of a rational function field, and the torsion kernel

`K2SymbolsBrauer:T.2/rational-function-field` · lemma · implementation unchecked

For a field F, K2(F) -> K2(F(t)) is a split injection. The retraction sends {f,g} to {lc(f),lc(g)}, where lc(p/q)=lc(p)/lc(q).

**Hypotheses.**

- F is a field.


**Construction and proof.**

1. Leading coefficients multiply and restrict to the identity on constants.
2. For a rational f, if deg(f)>0 then lc(1-f)=-lc(f), so the negative-unit relation kills the symbol.
3. If deg(f)<0, lc(1-f)=1. If deg(f)=0 and lc(f)!=1, lc(1-f)=1-lc(f) and use Steinberg. If deg(f)=0 and lc(f)=1, the first symbol entry is 1 even when cancellation changes the degree of 1-f.
4. The relations therefore descend through Matsumoto and give a retraction.

**Acceptance.**

- The map is a left inverse on constant symbols.
- The equal-degree cancellation case lc(f)=1 is handled separately.
- The conclusion is split injectivity for the specified rational function extension.


**Prerequisites.**

- [`K2SymbolsBrauer:T.2/matsumoto`](#node-k2symbolsbrauer-t-2-matsumoto)
- [`K2SymbolsBrauer:T.2:symbols/symbol-negative-unit`](#node-k2symbolsbrauer-t-2-symbols-symbol-negative-unit)


**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.6.1.2 (PDF p. 239).
  Excerpt: “A rational function extension splits by sending each symbol to its leading coefficients.”
  Use: Paraphrase of the indicated passage; checked in the author copy, not a quotation from the published edition.

<a id="node-k2symbolsbrauer-t-2-milnor-alternating"></a>
### Skew-symmetry of Milnor symbols

`K2SymbolsBrauer:T.2/milnor-alternating` · lemma · implementation unchecked

Permuting Milnor-symbol entries multiplies by the permutation sign. Repeated-entry symbols are killed by 2 but can be nonzero integrally; in characteristic two a repeated adjacent pair vanishes because {a,a}={a,-1} and -1=1.

**Hypotheses.**

- F is a field; the entries are nonzero.


**Construction and proof.**

1. Use that in degree two the sum of the symbol and its transpose vanishes, which is skew-symmetry proved above.
2. Deduce that interchanging two adjacent entries of an n-tuple changes the sign, since the degree-two relation can be applied in place inside the product.
3. Extend to an arbitrary transposition and then to an arbitrary permutation by decomposing it into transpositions.
4. Record what this does not say: the symbol with a repeated entry need not vanish integrally, and equals the symbol with that entry replaced by minus one in the appropriate position.

**Acceptance.**

- A transposition changes the sign.
- A symbol with a repeated entry is two-torsion but not necessarily zero, which is the same caveat as in degree two.
- A square root of -1 is NOT sufficient for integral vanishing. In F=C(t), {t,t}={t,-1} has tame residue -1 at t=0 and is nonzero, although i belongs to F. In characteristic two it vanishes; modulo 2 it vanishes if -1 is a square.


**Prerequisites.**

- [`K2SymbolsBrauer:T.2/milnor-k-theory`](#node-k2symbolsbrauer-t-2-milnor-k-theory)
- [`K2SymbolsBrauer:T.2/symbol-consequences`](#node-k2symbolsbrauer-t-2-symbol-consequences)


**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.7.1 (PDF p. 253).
  Excerpt: “Since {x_i, x_{i+1}} + {x_{i+1}, x_i} = 0 in K^M_2(F), we see that interchanging two entries in {x_1, ..., x_n} yields the inverse. It follows that these symbols are alternating.”
  Use: The derivation, as displayed.
- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.6.3 (PDF p. 242).
  Excerpt: “The tame-symbol formula sends {t,-1} at the t-adic valuation to -1, detecting its nonzero class.”
  Use: Paraphrase of the indicated passage; checked in the author copy, not a quotation from the published edition.

<a id="node-k2symbolsbrauer-t-2-milnor-examples"></a>
### Milnor K-theory of finite fields

`K2SymbolsBrauer:T.2/milnor-examples` · lemma · implementation unchecked

For a finite field Fq and n >= 2, K_n^M(Fq)=0.

**Hypotheses.**

- Fq is a finite field.
- n >= 2.


**Construction and proof.**

1. K2^M(Fq)=0 by Matsumoto and the finite-field K2 calculation.
2. Every degree-n symbol is a product of its first two entries with the remaining degree-one symbols, so it is zero for n>=2.

**Acceptance.**

- K0^M(Fq)=Z is not covered.
- K1^M(Fq)=Fq× is not asserted zero.
- Degrees at least two vanish by generation from degree two.


**Prerequisites.**

- [`K2SymbolsBrauer:T.2/milnor-k-theory`](#node-k2symbolsbrauer-t-2-milnor-k-theory)
- [`K2SymbolsBrauer:T.2/k2-finite-field`](#node-k2symbolsbrauer-t-2-k2-finite-field)


**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.7.2(a) (PDF p. 253).
  Excerpt: “All Milnor groups of a finite field in degrees at least two vanish.”
  Use: Paraphrase of the indicated passage; checked in the author copy, not a quotation from the published edition.

<a id="node-k2symbolsbrauer-t-2-symbols-extension-kernel-torsion"></a>
### Torsion in field-extension restriction kernels

`K2SymbolsBrauer:T.2:symbols/extension-kernel-torsion` · lemma · implementation unchecked

For every field extension F <= L, the kernel of K2(F) -> K2(L) is torsion.

**Hypotheses.**

- F is a field.


**Construction and proof.**

1. Using filtered-colimit compatibility, reduce a vanishing element to a finitely generated subextension.
2. Choose a finite transcendence basis; rational restriction is injective by successive leading-coefficient splittings.
3. The remaining algebraic extension L/F is finite, so L is a finite free F-module and restriction of scalars gives the Quillen transfer K2(L) -> K2(F) (GeneralAlgebraicKTheory:K.3/transfer-maps-and-projection-formula, separable or not); by its projection formula, transfer after restriction is multiplication by the class of L in K0(F) = Z, that is by [L:F], which kills the original element.
4. Continuity is imported from the early connective ring model K.2/functorial-K-theory-of-a-ring; no negative or nonunital continuity is needed.

**Acceptance.**

- For every field extension F <= L, the kernel of K2(F) -> K2(L) is torsion.


**Prerequisites.**

- [`K2SymbolsBrauer:T.2/rational-function-field`](#node-k2symbolsbrauer-t-2-rational-function-field)
- `GeneralAlgebraicKTheory:K.2/functorial-K-theory-of-a-ring`
- `GeneralAlgebraicKTheory:K.3/transfer-maps-and-projection-formula`


**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.6.1.3 (PDF p. 239).
  Excerpt: “Restriction to an arbitrary field extension has a torsion kernel, by finite extension transfer after a transcendence basis.”
  Use: Paraphrase of the indicated passage; checked in the author copy, not a quotation from the published edition.

<a id="node-k2symbolsbrauer-t-2-symbols-milnor-real"></a>
### Milnor K-theory of the real field

`K2SymbolsBrauer:T.2:symbols/milnor-real` · lemma · implementation unchecked

For n >= 1, K_n^M(R) is Z/2 generated by {-1,...,-1}, direct sum a divisible subgroup. As a graded ring, K_*^M(R)/2 is F2[epsilon], with epsilon of degree one.

**Hypotheses.**

- n >= 1 for the group decomposition.
- The base field is R.


**Construction and proof.**

1. Send a negative degree-one unit to epsilon and a positive one to zero. The Steinberg relation dies since a and 1-a cannot both be negative.
2. The all-minus-one symbol has order two and nonzero image, giving the torsion summand.
3. Gap G-real: prove the complementary divisibility by the indicated induction; degree zero is Z and is excluded from the direct-sum formula.

**Acceptance.**

- For n >= 1, K_n^M(R) is Z/2 generated by {-1,...,-1}, direct sum a divisible subgroup. As a graded ring, K_*^M(R)/2 is F2[epsilon], with epsilon of degree one.


**Prerequisites.**

- [`K2SymbolsBrauer:T.2/milnor-k-theory`](#node-k2symbolsbrauer-t-2-milnor-k-theory)
- [`K2SymbolsBrauer:T.2/milnor-alternating`](#node-k2symbolsbrauer-t-2-milnor-alternating)


**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.7.2(c) (PDF p. 253).
  Excerpt: “The real sign map detects the all-negative symbol and the positive-degree torsion summand.”
  Use: Paraphrase of the indicated passage; checked in the author copy, not a quotation from the published edition.

<a id="node-k2symbolsbrauer-t-2-symbols-milnor-number-field"></a>
### Bass-Tate calculation for number fields

`K2SymbolsBrauer:T.2:symbols/milnor-number-field` · theorem · implementation unchecked

For a number field F with r1 real embeddings and n >= 3, K_n^M(F) is (Z/2)^r1 via the symbols at its real places.

**Hypotheses.**

- F is a number field.
- n >= 3.


**Construction and proof.**

1. Construct the product of the real sign maps at the real embeddings.
2. Gap G-Bass-Tate: the source cites Bass and Tate for bijectivity; the original proof was not obtained and this node does not claim to supply it.

**Acceptance.**

- For a number field F with r1 real embeddings and n >= 3, K_n^M(F) is (Z/2)^r1 via the symbols at its real places.


**Prerequisites.**

- [`K2SymbolsBrauer:T.2/milnor-k-theory`](#node-k2symbolsbrauer-t-2-milnor-k-theory)
- [`K2SymbolsBrauer:T.2:symbols/milnor-real`](#node-k2symbolsbrauer-t-2-symbols-milnor-real)
- `mathlib:NumberField.InfinitePlace.nrRealPlaces`


**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.7.2(d) (PDF p. 254).
  Excerpt: “The sign maps give the Bass-Tate isomorphism in degrees at least three for a number field.”
  Use: Paraphrase of the indicated passage; checked in the author copy, not a quotation from the published edition.
- [Kbook.III.chapter](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.III.pdf), III.7.2(a),(d), PDF pp.61–62.
  Excerpt: “The general global-field Milnor theorem is already owned here; its original Bass–Tate proof remains the existing gap.”
  Use: Paraphrase of the inspected passage, not a quotation. The general global-field Milnor theorem is already owned here; its original Bass–Tate proof remains the existing gap.

<a id="stage-k2symbolsbrauer-t-2-graded-map"></a>
## T.2:graded-map — The graded map to Quillen K-theory

Use GeneralAlgebraicKTheory K.7’s product to construct the graded map. Its degree-two component is the comparison already fixed in T.1:plus. K3BlochGroups V.2 consumes the degree-three map and owns its indecomposable cokernel; it is not an input to this construction.

Coverage: **partial**.

**Remaining proof and supply obligations.**

- Independent review of this revision.


<a id="node-k2symbolsbrauer-t-2-graded-map"></a>
### The graded map from Milnor to Quillen K-theory

`K2SymbolsBrauer:T.2/graded-map` · construction · implementation unchecked

Planet: **Milnor to Quillen graded map**.

Construct the natural graded ring map from Milnor K-theory of a field to Quillen K-theory, determined by the products of degree-one classes. Its degree-two component is Matsumoto's isomorphism. No isomorphism is asserted in degree three or above.

**Hypotheses.**

- F is a field.


**Construction and proof.**

1. Import the products on Quillen K-theory from GeneralAlgebraicKTheory.
2. Define the map on the tensor algebra by sending the degree-one element attached to a nonzero x to the class of x in K_1(F) and extending multiplicatively.
3. Prove that it kills the Steinberg elements, using the degree-two Steinberg identity in Quillen K-theory, so that it descends to Milnor K-theory.
4. Prove that the result is a map of graded rings and is natural in the field.
5. Record what is and is not asserted: degree two is an isomorphism, by Matsumoto; degree three is a map whose cokernel defines the indecomposable K_3 in K3BlochGroups V.2; no general isomorphism is claimed.
6. Gap G-product-symbol: request the actual product-symbol compatibility from IV.1.10, not only abstract K-theory products. It is needed to identify the degree-two component with the chosen classical Matsumoto map.

**Acceptance.**

- Degree one is the identity on the unit group.
- Degree two is an isomorphism.
- Degree three is injective for every field (VI.4.3.2, owned by V.2) and need not be surjective. For Q, the source is Z/2 and the target is Z/48; having real places does not imply positive Quillen K3 rank.


**Prerequisites.**

- [`K2SymbolsBrauer:T.2/milnor-k-theory`](#node-k2symbolsbrauer-t-2-milnor-k-theory)
- [`K2SymbolsBrauer:T.2/matsumoto`](#node-k2symbolsbrauer-t-2-matsumoto)
- `GeneralAlgebraicKTheory:K.7/products-from-biexact-functors`
- `GeneralAlgebraicKTheory:K.2:plus`
- `KTheoryLowDegrees:U.3`


**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `milnorToQuillen` | constructor | The graded ring map. |
| `milnorToQuillen_one` | simp | Degree one is the identity on the unit group. |
| `milnorToQuillen_two` | characterisation | Under product-symbol compatibility and Matsumoto, the component K2^M(F)->Quillen K2(F) is an isomorphism. |
| `milnorToQuillen_map` | functoriality | Naturality in the field. |
| `milnorToQuillen_graded` | structure | It is a map of graded rings. |
| `milnorToQuillen_symbol` | compatibility | Each n-symbol maps to the ordered product of its n unit classes in Quillen K_n(F). |
| `milnorToQuillen_unique` | extensionality | A graded map with the same degree-one unit classes is equal by the Milnor universal property. |

**Consumers.**

- K3BlochGroups V.2 — the degree-three component is the map whose cokernel is the indecomposable K_3
- MotivicEtaleKTheory M.5 — the norm-residue theorem is about the mod-m reduction of the source of this map
- HigherLocalFieldsAndHigherClassFieldTheory HL.1 — that layer imports the graded source and the map


**Unit tests.**

- `degree_zero` — The degree-zero map Z->Quillen K0(F) sends 1 to the class of the one-dimensional vector space.
- `degree_one` — For F=Q, the unit 2 maps to its K1 unit class, corresponding to 2 under determinant.
- `degree_two_symbol` — {a,1-a} maps to zero, and {-1,-1} maps to the classical symbol under the K2 comparison.
- `degree_three_Q` — For F=Q the integral component is injective Z/2->Z/48 and is not onto; this computation is an external VI.5.2.1 test, not a new owned theorem.


**Suggested placement.** module: `TauCeti/Algebra/KTheory/MilnorK`; namespace: `TauCeti.MilnorK`.

**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), IV.1.10.1 (PDF p. 274), III.7.1 (PDF p. 253).
  Excerpt: “Products of unit classes define the graded Milnor-to-Quillen ring map; degree-two products agree with classical Steinberg symbols.”
  Use: Paraphrase of the indicated passage; checked in the author copy, not a quotation from the published edition.
- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.4.3.2 and VI.5.2.1 (PDF pp. 490, 496).
  Excerpt: “The integral degree-three map is injective; Q gives a non-surjective example with source Z/2 and target Z/48.”
  Use: Paraphrase of the indicated passage; checked in the author copy, not a quotation from the published edition.

<a id="node-k2symbolsbrauer-t-2-graded-map-degree-three"></a>
### The degree-three component, and what consumes it

`K2SymbolsBrauer:T.2/graded-map-degree-three` · comparison · implementation unchecked

The degree-three component K3^M(F)->Quillen K3(F) sends {a,b,c} to the ordered product of their unit classes. It is exported to the K3BlochGroups:V.2 consumer, which owns its injectivity theorem and the indecomposable cokernel; the consumer is not an incoming prerequisite for constructing this component.

**Hypotheses.**

- F is a field.


**Construction and proof.**

1. Take degree three of the supplied graded comparison.
2. Evaluate on a triple using the generator formula.
3. Export the map and its convention to V.2; do not reconstruct the quotient or reverse the producer-consumer edge.

**Acceptance.**

- The component sends a Milnor symbol of three units to the product of their classes.
- For a finite field the source vanishes.
- The injectivity theorem is not proved here; it is cited to the consuming layer.


**Prerequisites.**

- [`K2SymbolsBrauer:T.2/graded-map`](#node-k2symbolsbrauer-t-2-graded-map)


**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), IV.1.10.1 and VI.4.3.2 (PDF pp. 274, 490).
  Excerpt: “The graded product map has an injective integral degree-three component for every field; its cokernel is studied in VI.5.”
  Use: Paraphrase of the indicated passage; checked in the author copy, not a quotation from the published edition.

<a id="stage-k2symbolsbrauer-t-3-symbols"></a>
## T.3:symbols — Tame symbols and higher residues

Construct the tame pairing through valuation-unit parts and descend through Matsumoto. Build Serre’s residue algebra, the higher residues and specialization, finite support and rigidity. These higher-residue nodes also realise T.3:localization-comparison, but are parented here so that T.4 can use them before the Quillen comparison.

Coverage: **source_decomposed**.

<a id="node-k2symbolsbrauer-t-3-tame-symbol"></a>
### The tame symbol of a discrete valuation

`K2SymbolsBrauer:T.3/tame-symbol` · definition · implementation unchecked

Planet: **Tame symbol**.

Let v be a discrete valuation on the field F, taken as a surjective valuation v : F → ℤᵐ⁰ with additive order ord_v (Tau Ceti's Valuation.ord, so a uniformiser has order one), valuation ring R, residue field k and residue map R^× → k^×, u ↦ ū. Fix a uniformiser t. Every f ∈ F^× is uniquely f = t^{ord_v f}·u_f with u_f ∈ R^×. For f, g ∈ F^× define ∂_v{f,g} = (−1)^{ord_v(f)·ord_v(g)} · ū_f^{ord_v(g)} · ū_g^{−ord_v(f)} ∈ k^×. Since f^{v(g)}/g^{v(f)} = u_f^{v(g)}·u_g^{−v(f)}, this is the roadmap's (−1)^{v(f)v(g)}·(f^{v(g)}/g^{v(f)})‾, and the residue map is applied only to the units u_f and u_g. With this convention ∂_v{u,t} = ū and ∂_v{t,u} = ū^{−1} for u ∈ R^×. The K-book's tame symbol (Lemma III.6.3), ∂_v({r,s}) = (−1)^{v(r)v(s)}·(s^{v(r)}/r^{v(s)})‾, equals ∂_v{s,r} = ∂_v{r,s}^{−1} in this notation: it is the inverse of this one. Independence of t is the next node.

**Hypotheses.**

- v : F → ℤᵐ⁰ is a surjective (normalised) discrete valuation on the field F, with valuation ring R, residue field k and a chosen uniformiser t (ord_v t = 1).
- f and g are nonzero elements of F.


**Construction and proof.**

1. Choose t by Valuation.exists_isUniformizer_of_surjective, and for f ≠ 0 take u_f ∈ R^× with f = t^{ord_v f}·u_f from Valuation.exists_eq_zpow_mul_unit_of_surjective; it is unique, since u_f = f·t^{−ord_v f}. For a DVR presented as a ring with an irreducible ϖ, IsDiscreteValuationRing.exists_units_eq_smul_zpow_of_irreducible gives the same decomposition.
2. Define ∂_v{f,g} by the displayed formula, applying ValuationSubring.unitGroupToResidueFieldUnits to u_f and u_g only; the integer exponents are taken in the group k^×.
3. Evaluate on the mixed pairs: for u ∈ R^× one has u_u = u and u_t = 1, so ∂_v{u,t} = ū and ∂_v{t,u} = ū^{−1}; for two units both exponents vanish and ∂_v{u,w} = 1.
4. Record the relation to the source: substituting r = f, s = g in Lemma III.6.3 gives (−1)^{v(f)v(g)}·(g^{v(f)}/f^{v(g)})‾ = ∂_v{g,f} = ∂_v{f,g}^{−1}. No formula below is silently reversed; every comparison with the source states this inversion.

**Acceptance.**

- ∂_v{u,t} = ū and ∂_v{t,u} = ū^{−1} for every u ∈ R^×; these two values pin the convention.
- On ℚ with the 5-adic valuation and t = 5: ∂{2,5} = 2, ∂{5,2} = 3, ∂{5,5} = −1 = 4 and ∂{10,5} = 3 in F_5^×. Lemma III.6.3's formula gives ∂_5(5,2) = 2, so the two conventions differ at (5,2).
- The residue map is applied only to the unit parts u_f, u_g ∈ R^×, never to f^{v(g)}/g^{v(f)} regarded as an element of F.


**Prerequisites.**

- `tauceti:Valuation.ord`
- `tauceti:Valuation.exists_isUniformizer_of_surjective`
- `tauceti:Valuation.exists_eq_zpow_mul_unit_of_surjective`
- `mathlib:ValuationSubring.unitGroupToResidueFieldUnits`
- `mathlib:IsDiscreteValuationRing.exists_units_eq_smul_zpow_of_irreducible`
- `tauceti:TauCeti.Place.residueUnit`
- `mathlib:Units`
- `mathlib:IsLocalRing.ResidueField.map`


**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `tameSymbol` | constructor | For a surjective v : F → ℤᵐ⁰ and f, g ∈ F^×, tameSymbol v f g := (−1)^{ord f·ord g}·res(u_f)^{ord g}·res(u_g)^{−ord f} ∈ k_v^×, with unit parts taken against a uniformiser fixed by choice. |
| `tameSymbol_eq_residue` | characterisation | tameSymbol v f g = (−1)^{ord f·ord g}·res(f^{ord g}·g^{−ord f}), the element f^{ord g}g^{−ord f} lying in R^× (node T.3/tame-symbol-uniformizer-independence). |
| `tameSymbol_unit_uniformizer` | simp | If ord u = 0 and ord t = 1 then tameSymbol v u t = res u. |
| `tameSymbol_uniformizer_unit` | simp | If ord u = 0 and ord t = 1 then tameSymbol v t u = (res u)^{−1}. |
| `tameSymbol_of_ord_eq_zero` | simp | If ord f = ord g = 0 then tameSymbol v f g = 1. |
| `tameSymbol_swap` | relation | tameSymbol v g f = (tameSymbol v f g)^{−1}. |
| `tameSymbol_self` | relation | tameSymbol v f f = (−1)^{ord f}. |
| `tameSymbol_neg_self` | relation | tameSymbol v f (−f) = 1. |
| `tameSymbol_kbook` | compatibility | The K-book's ∂_v({r,s}) of Lemma III.6.3 is tameSymbol v s r = (tameSymbol v r s)^{−1}. |
| `tameSymbol_dvr` | compatibility | For a DVR R with fraction field F and irreducible ϖ, writing f = u_f·ϖ^{n_f}, tameSymbol (the valuation of R) f g = (−1)^{n_f n_g}·ū_f^{n_g}·ū_g^{−n_f}. |
| `tameSymbol_place` | compatibility | For a place P of a function field, a uniformiser t at P and f with P.ord f = 0: tameSymbol P f t = Place.residueUnit P f. |
| `TauCeti.TameSymbol.valuationSubringMap` | functoriality | For a field embedding F → E and discrete valuations with ord_w(f(r)) = e·ord_v(r), e ∈ ℕ, the restricted ring map 𝒪_v →+* 𝒪_w is defined without a finiteness assumption. |
| `TauCeti.TameSymbol.residueFieldMap` | functoriality | For the same embedding, require he : 0 < e. The valuation-ring map is local, since ord_w(f(r)) > 0 iff ord_v(r) > 0 for r ≠ 0, and IsLocalRing.ResidueField.map yields k_v →+* k_w. No finite-dimensionality assumption is used. |

**Consumers.**

- T.3/tame-symbol-hom — the homomorphism out of K^M_2(F) and K_2(F) is induced by this pairing
- T.4's reciprocity — the reciprocity product is over the tame symbols at the closed points
- T.5's tame kernel — the unramified subgroup is cut out by the vanishing of these symbols
- T.3/localization-boundary — the localisation boundary is this symbol with its arguments swapped, i.e. its inverse


**Unit tests.**

- `tameSymbol_rat_five` (computation) — On ℚ with the 5-adic valuation: tameSymbol 2 5 = 2 and tameSymbol 5 2 = 3 in F_5^×.
- `tameSymbol_rat_five_sign` (computation) — On ℚ at 5: tameSymbol 5 5 = 4 = −1 and tameSymbol 10 5 = 3; a definition without the factor (−1)^{v(f)v(g)} gives 1 and 2.
- `tameSymbol_units` (degenerate) — On ℚ at 5: tameSymbol 2 3 = 1, and tameSymbol f 1 = 1 for every f.
- `tameSymbol_ratFunc` (compatibility) — On k(t) at the place t − b (b ∈ k): tameSymbol a (t − b) = a for a ∈ k^×, whereas the K-book's Weil reciprocity 6.5.3 (PDF p. 244) uses ∂_{t−b}(a, t − b) = a^{−1} in its normalisation.
- `tameSymbol_not_kbook` (non-example) — tameSymbol 5 2 = 3 ≠ 2 = ∂_5(5,2) of Lemma III.6.3: a silent use of the source's formula fails this.
- `TauCeti.TameSymbol.residueFieldMap_residue` (compatibility) — For e > 0 and a ∈ 𝒪_v, residueFieldMap v w e he hvw (res_v a) = res_w (valuationSubringMap v w e hvw a).
- `TauCeti.TameSymbol.residueFieldMap_requires_positive` (non-example) — For ℚ → ℚ(u) with w the u-adic valuation, ord_w is zero on every nonzero rational (e = 0). The 5-adic nonunit 5 maps to a unit of 𝒪_w, so the valuation-ring map is not local and no residue-field map F_5 → ℚ is asserted.


**Suggested placement.** module: `TauCeti/Algebra/KTheory/TameSymbol`; namespace: `TauCeti.TameSymbol`.

**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), Lemma III.6.3 (PDF p. 242).
  Excerpt: “Lemma 6.3. For every discrete valuation v on F there is a Steinberg symbol K2(F) −∂v→ k×v, defined by ∂v({r, s}) = (−1)^{v(r)v(s)} \overline{(s^{v(r)}/r^{v(s)})}. This symbol is called the tame symbol of the valuation v. The tame symbol is onto, because if u ∈ R× then v(u) = 0 and ∂v(π, u) = ū.”
  Use: The source's tame symbol, with r, s in the roles of f, g. Its formula is the inverse of the roadmap's (it has s^{v(r)}/r^{v(s)} where the roadmap has f^{v(g)}/g^{v(f)}); this node defines the roadmap's and records the inversion. Surjectivity is proved in T.3/tame-symbol-hom.

<a id="node-k2symbolsbrauer-t-3-tame-symbol-uniformizer-independence"></a>
### Independence from the uniformiser

`K2SymbolsBrauer:T.3/tame-symbol-uniformizer-independence` · lemma · implementation unchecked

For f, g ∈ F^× the element f^{ord_v g}·g^{−ord_v f} has order zero, hence lies in R^×, and ∂_v{f,g} = (−1)^{ord_v(f)·ord_v(g)}·res(f^{ord_v g}·g^{−ord_v f}). The right-hand side involves no uniformiser, so ∂_v does not depend on the uniformiser t used to form the unit parts: this is the stage's displayed formula, with the bar applied to a unit.

**Hypotheses.**

- v is a surjective discrete valuation on F with valuation ring R and residue field k; t and t′ are uniformisers.
- f and g are nonzero elements of F.


**Construction and proof.**

1. ord_v(f^{ord g}·g^{−ord f}) = ord g·ord f − ord f·ord g = 0 by Valuation.ord_mul and Valuation.ord_zpow, so the element lies in R^× (Valuation.isUnit_iff_ord_eq_zero).
2. With f = t^{a}u_f and g = t^{b}u_g (a = ord f, b = ord g): f^{b}g^{−a} = t^{ab}u_f^{b}·t^{−ab}u_g^{−a} = u_f^{b}u_g^{−a}.
3. The residue map R^× → k^× is a group homomorphism, so res(u_f^{b}u_g^{−a}) = ū_f^{b}ū_g^{−a}, and ∂_v{f,g} equals the uniformiser-free expression.
4. For a second uniformiser t′ the same computation gives the same expression; the sign depends only on the orders.

**Acceptance.**

- On ℚ at 5, computing with t = 5 (u_{10} = 2, u_5 = 1) and with t = 10 (u_{10} = 1, u_5 = 1/2) both give ∂{10,5} = 3.
- The sign (−1)^{ord f·ord g} depends only on the orders.
- The residue is taken of a unit of R, as the stage requires.


**Prerequisites.**

- [`K2SymbolsBrauer:T.3/tame-symbol`](#node-k2symbolsbrauer-t-3-tame-symbol)
- `tauceti:Valuation.ord_mul`
- `tauceti:Valuation.ord_zpow`
- `tauceti:Valuation.isUnit_iff_ord_eq_zero`
- `mathlib:ValuationSubring.unitGroupToResidueFieldUnits`


**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), Lemma III.6.3, proof (PDF p. 242).
  Excerpt: “Proof. Writing r = u1π^{v1} and s = u2π^{v2} with u1, u2 ∈ R×, we must show that ∂v(r, s) = (−1)^{v1v2} ū2^{v1}/ū1^{v2} is a Steinberg symbol. By inspection, ∂v(r, s) is an element of k×v, and ∂v is bilinear.”
  Use: The source computes the symbol through unit parts against one parameter π and never discusses another; the uniformiser-free form of this node is what makes the choice irrelevant. The source's ū2^{v1}/ū1^{v2} is the inverse of the roadmap's ū_f^{ord g}ū_g^{−ord f}.

<a id="node-k2symbolsbrauer-t-3-tame-symbol-steinberg"></a>
### The tame symbol is bilinear and satisfies the Steinberg relation

`K2SymbolsBrauer:T.3/tame-symbol-steinberg` · theorem · implementation unchecked

Planet: **The tame symbol is a Steinberg symbol**.

The pairing ∂_v is bimultiplicative, ∂_v{ff′,g} = ∂_v{f,g}·∂_v{f′,g} and ∂_v{f,gg′} = ∂_v{f,g}·∂_v{f,g′}, and satisfies the Steinberg relation ∂_v{r, 1 − r} = 1 for every r ∈ F \ {0,1}. (The induced homomorphism out of K^M_2(F) and K_2(F), and its surjectivity, are T.3/tame-symbol-hom.)

**Hypotheses.**

- v is a surjective discrete valuation on F with valuation ring R, maximal ideal 𝔪 and residue field k.
- f, f′, g, g′ ∈ F^×; r ∈ F with r ≠ 0, 1.


**Construction and proof.**

1. Bimultiplicativity: for a fixed uniformiser, u_{ff′} = u_f u_{f′} and ord(ff′) = ord f + ord f′ (Valuation.ord_mul); the sign satisfies (−1)^{(a+a′)b} = (−1)^{ab}(−1)^{a′b} and the residue map is a homomorphism. The second variable is the same.
2. Let s = 1 − r, a = ord r, b = ord s. The cases below are exhaustive: if a ≥ 0 then r ∈ R, so s ∈ R and b ≥ 0; hence a = 0 with b < 0 cannot occur, and a > 0; b > 0 (then a = 0); a = b = 0; a < 0 cover everything.
3. a > 0: r ∈ 𝔪 (Valuation.mem_maximalIdeal_iff_ord_pos), so s is a unit with s̄ = 1 and b = 0; then ∂_v{r,s} = s̄^{−a} = 1. The exponent is −a in this normalisation; the source's ∂_v(r,s) = s̄^{v1} is its inverse, and both are 1.
4. b > 0: symmetrically a = 0, r̄ = 1 and ∂_v{r,s} = r̄^{b} = 1.
5. a = b = 0: all exponents vanish and ∂_v{r,s} = 1.
6. a < 0: ord(1/r) > 0, so ord(1 − r) = ord r (Valuation.ord_add_eq_min_of_ord_ne, as ord 1 = 0 ≠ ord r), i.e. b = a. By the uniformiser-free form, ∂_v{r,s} = (−1)^{a²}·res((r/s)^{a}), and r/s = (−1 + 1/r)^{−1} ≡ −1 mod 𝔪, so ∂_v{r,s} = (−1)^{a}(−1)^{a} = 1.

**Acceptance.**

- The four cases are exhaustive because r ∈ R forces 1 − r ∈ R; all four are written out.
- On ℚ at 5, with r = 1/5 and 1 − r = 4/5 (both of order −1): ∂{1/5, 4/5} = (−1)^{1}·res((1/5)^{−1}·(4/5)^{1}) = −4 = 1 in F_5^×; the formula without the sign factor would give 4.
- The relation holds in both normalisations, each being the other's inverse.


**Prerequisites.**

- [`K2SymbolsBrauer:T.3/tame-symbol`](#node-k2symbolsbrauer-t-3-tame-symbol)
- [`K2SymbolsBrauer:T.3/tame-symbol-uniformizer-independence`](#node-k2symbolsbrauer-t-3-tame-symbol-uniformizer-independence)
- `tauceti:Valuation.ord_mul`
- `tauceti:Valuation.mem_maximalIdeal_iff_ord_pos`
- `tauceti:Valuation.ord_add_eq_min_of_ord_ne`


**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), Lemma III.6.3, proof (PDF p. 242).
  Excerpt: “To see that ∂v(r, s) = 1 when r + s = 1 we consider several cases. If v1 > 0 then r is in the maximal ideal, so s = 1 − r is a unit and ∂v(r, s) = s̄^{v1} = 1. The proof when v2 > 0 is the same, and the case v1 = v2 = 0 is trivial.”
  Use: The first three cases. In the roadmap's normalisation the value in the case v1 > 0 is s̄^{−v1}, the inverse of the source's.
- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), Lemma III.6.3, proof (PDF p. 242).
  Excerpt: “If v1 < 0 then v(1/r) > 0 and (1−r)/r = −1 + 1/r is congruent to −1 (mod π). Since v(r) = v(1 − r), we have ∂v(r, 1 − r) = (−1)^{v1} ((1 − r)/r)^{v1} = (−1)^{v1}(−1)^{v1} = 1.”
  Use: The case of negative valuation, where the two orders agree and the sign cancels the residue −1.

<a id="node-k2symbolsbrauer-t-3-tame-symbol-hom"></a>
### The tame symbol as a homomorphism out of K₂

`K2SymbolsBrauer:T.3/tame-symbol-hom` · construction · implementation unchecked

The pairing ∂_v of T.3/tame-symbol-steinberg induces a group homomorphism ∂_v : K^M_2(F) → k^× (source written additively) with ∂_v{f,g} = tameSymbol v f g, and, through Matsumoto's isomorphism K^M_2(F) ≅ K_2(F), a homomorphism K_2(F) → k^× with the same value on Steinberg symbols. It is surjective: ∂_v{ũ, t} = u for any lift ũ ∈ R^× of u ∈ k^×.

**Hypotheses.**

- v is a surjective discrete valuation on F with valuation ring R, residue field k and uniformiser t.


**Construction and proof.**

1. Bimultiplicativity gives a homomorphism F^× ⊗ F^× → k^×. The homogeneous Steinberg ideal of K2SymbolsBrauer:T.2/milnor-k-theory meets degree two in the subgroup generated by the r ⊗ (1 − r), which go to 1 by the Steinberg relation, so the map descends to K^M_2(F).
2. Compose with the inverse of Matsumoto's isomorphism (K2SymbolsBrauer:T.2/matsumoto) to obtain the map on K_2(F).
3. Surjectivity: the residue map R^× → k^× is onto (ValuationSubring.surjective_unitGroupToResidueFieldUnits) and ∂_v{ũ, t} = u.

**Acceptance.**

- ∂_v is onto k^×.
- It vanishes on symbols of two units, so on the image of symbols from R^× ⊗ R^×.
- The K-book's tame symbol on K_2(F) is ∂_v composed with the swap {f,g} ↦ {g,f}, i.e. −∂_v in additive notation.


**Prerequisites.**

- [`K2SymbolsBrauer:T.3/tame-symbol-steinberg`](#node-k2symbolsbrauer-t-3-tame-symbol-steinberg)
- [`K2SymbolsBrauer:T.2/milnor-k-theory`](#node-k2symbolsbrauer-t-2-milnor-k-theory)
- [`K2SymbolsBrauer:T.2/matsumoto`](#node-k2symbolsbrauer-t-2-matsumoto)
- `mathlib:ValuationSubring.surjective_unitGroupToResidueFieldUnits`


**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `tameSymbolHom` | constructor | The homomorphism K^M_2(F) →+ Additive k^× induced by tameSymbol v. |
| `tameSymbolHom_symbol` | simp | tameSymbolHom v {f, g} = tameSymbol v f g. |
| `tameSymbolHom_surjective` | characterisation | tameSymbolHom v is surjective. |
| `tameSymbolHomK2` | compatibility | The homomorphism K_2(F) → k^× obtained through Matsumoto's isomorphism, with the same value on Steinberg symbols. |
| `tameSymbolHom_symbol_units` | simp | tameSymbolHom v {u, w} = 0 (the trivial unit) for u, w ∈ R^×. |
| `tameSymbolHom_kbook` | compatibility | The K-book's ∂_v on K_2(F) equals −tameSymbolHom v (additively). |

**Consumers.**

- T.5/unramified-subgroup — the unramified subgroup of K_2(F) is the intersection of the kernels of these homomorphisms at the finite places
- T.3/localization-boundary — the localisation boundary is compared with this homomorphism
- T.3/higher-milnor-residues — in degree two the higher residue equals this homomorphism


**Unit tests.**

- `tameSymbolHom_rat_five` (computation) — On ℚ at 5: tameSymbolHom {5, 2} = 3 and tameSymbolHom {2, 5} = 2 in F_5^×.
- `tameSymbolHom_units` (degenerate) — On ℚ at 5: tameSymbolHom {2, 3} = 0, the trivial unit.
- `tameSymbolHom_generates` (characterisation) — On ℚ at 5: tameSymbolHom {2, 5} = 2 generates F_5^×, so the map is onto.
- `tameSymbolHom_needs_sign` (non-example) — The unsigned formula res(f^{v(g)}g^{−v(f)}) sends the Steinberg element {1/5, 4/5} of K^M_2(ℚ) to 4 ≠ 1, so it does not descend; the signed one sends it to 1.
- `tameSymbolHom_self` (compatibility) — {5,5} = {5,−1} in K^M_2(ℚ) and both go to −1 = 4 in F_5^×.


**Suggested placement.** module: `TauCeti/Algebra/KTheory/TameSymbol`; namespace: `TauCeti.TameSymbol`.

**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), Lemma III.6.3 (PDF p. 242).
  Excerpt: “Lemma 6.3. For every discrete valuation v on F there is a Steinberg symbol K2(F) −∂v→ k×v, defined by ∂v({r, s}) = (−1)^{v(r)v(s)} \overline{(s^{v(r)}/r^{v(s)})}. This symbol is called the tame symbol of the valuation v. The tame symbol is onto, because if u ∈ R× then v(u) = 0 and ∂v(π, u) = ū.”
  Use: The source's Steinberg symbol K_2(F) → k_v^× and its surjectivity; the value ∂_v(π, u) = ū is the source's normalisation, whose roadmap counterpart is ∂_v{ũ, t} = u.
- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.7.1 (PDF p. 253).
  Excerpt: “By Matsumoto’s Theorem 6.1 we also have KM2(F) = K2(F), the elements {x, y} being the usual Steinberg symbols, except that the group operation in KM2(F) is written additively.”
  Use: The identification K^M_2(F) = K_2(F) through which the homomorphism is transported.

<a id="node-k2symbolsbrauer-t-3-ramification-formula"></a>
### Behaviour under a valued field embedding: the ramification formula

`K2SymbolsBrauer:T.3/ramification-formula` · lemma · implementation unchecked

Let F → E be any field embedding, v and w normalised surjective discrete valuations with ord_w(f(r)) = e·ord_v(r) and e ≥ 1; the induced local map of valuation rings gives k_v → k_w. No finite-dimensionality assumption is needed. Then tameSymbol w r₁ r₂ = (tameSymbol v r₁ r₂)^e in k_w^× for r₁, r₂ ∈ F^×; equivalently ∂_w ∘ res_{E/F} = (·)^e ∘ ∂_v on K^M_2(F). For the finite-extension refinement only, if E/F is finite and w₁, …, w_n are the valuations of E over v (the primes of the integral closure S of R over 𝔪_v) and all e_i = 1, the diagonal k_v^× → ∏_i k_{w_i}^× carries ∂_v(x) to (∂_{w_i}(x))_i. The formula reads the same in the roadmap's and in the K-book's normalisation, both sides being inverted.

**Hypotheses.**

- F → E is a field embedding; v and w are normalised surjective discrete valuations with ord_w(f(r)) = e·ord_v(r), e ≥ 1.
- For the unramified refinement only: E/F is finite, w₁, …, w_n are all its valuations over v and each e_i = 1.


**Construction and proof.**

1. The order identity gives an inclusion 𝒪_v → 𝒪_w. Positivity e > 0 gives the equivalence of positive orders for nonzero elements, hence a local map and the residue-field embedding k_v → k_w; units stay units and their residues commute with this map. This argument uses no finite-dimensionality.
2. By the uniformiser-free form (T.3/tame-symbol-uniformizer-independence): tameSymbol w r₁ r₂ = (−1)^{e²ab}·res_w(r₁^{eb}r₂^{−ea}) = ((−1)^{ab})^{e}·(res_v(r₁^{b}r₂^{−a}))^{e}, with a = ord_v r₁, b = ord_v r₂, using e² ≡ e (mod 2) for the sign.
3. On K^M_2(F): both sides are homomorphisms (T.3/tame-symbol-hom and the functoriality of K^M_2 in K2SymbolsBrauer:T.2/milnor-k-theory) agreeing on symbols.
4. The unramified refinement is the case e_i = 1 at each w_i, collected into the product.

**Acceptance.**

- ℚ ⊂ ℚ(√5), v 5-adic, w over 5 with e = 2 and k_w = F_5: tameSymbol w 5 5 = 1 = (−1)² and tameSymbol w 2 5 = 4 = 2².
- ℚ ⊂ ℚ(i) at 5 (5 splits, e₁ = e₂ = 1, residue fields F_5): both w_i give tameSymbol 2 5 = 2, the diagonal image of 2.
- The sign transforms uniformly because e² ≡ e (mod 2); no case split on the parity of e is needed.
- The formula concerns classes from F; for classes of E the relevant statement is the norm–residue formula (T.3/transfer-and-norm-residue).
- Infinite example: ℚ → ℚ(u), v the 5-adic valuation and w its Gauss extension (minimum coefficient order), e = 1, k_w = F_5(u): ∂_w{2,5} = 2. The map with w the u-adic valuation instead has trivial restriction and is not this positive-e case.


**Prerequisites.**

- [`K2SymbolsBrauer:T.3/tame-symbol-uniformizer-independence`](#node-k2symbolsbrauer-t-3-tame-symbol-uniformizer-independence)
- [`K2SymbolsBrauer:T.3/tame-symbol-hom`](#node-k2symbolsbrauer-t-3-tame-symbol-hom)
- [`K2SymbolsBrauer:T.2/milnor-k-theory`](#node-k2symbolsbrauer-t-2-milnor-k-theory)
- `tauceti:Valuation.ord`


**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), Remark III.6.3.1 (PDF p. 242).
  Excerpt: “Remark 6.3.1 (Ramification). Suppose that E is a finite extension of F, and that w is a valuation on E over the valuation v on F. Then there is an integer e, called the ramification index, such that w(r) = e · v(r) for every r ∈ F.”
  Use: The ramification index. The embedding-general statement is derived here from the order/unit calculation, not quoted from the finite source.
- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), Remark III.6.3.1 (PDF p. 242).
  Excerpt: “The natural map K2(F) → K2(E) is compatible with the tame symbols in the sense that for every r1, r2 ∈ F× we have ∂w(r1, r2) = ∂v(r1, r2)^e in k×w.”
  Use: The formula, stated in the source's normalisation; inverting both sides gives it in the roadmap's. The embedding-general statement is derived here from the order/unit calculation, not quoted from the finite source.
- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), Remark III.6.3.1, continued (PDF p. 243).
  Excerpt: “We say that S is unramified over R if the ramification indices e1, ..., en are all 1; in this case the diagonal inclusion ∆: k×v ↪ ∏i k×wi is compatible with the tame symbols in the sense that ∆∂v(r1, r2) is the product of the ∂wi(r1, r2).”
  Use: The unramified refinement.

<a id="node-k2symbolsbrauer-t-3-serre-residue-algebra"></a>
### Serre's algebra L(k) with the indeterminate Π

`K2SymbolsBrauer:T.3/serre-residue-algebra` · construction · implementation unchecked

Also realises `K2SymbolsBrauer:T.3:localization-comparison`.

For a field k let L(k) be the graded abelian group with L(k)_n = K^M_n(k) ⊕ K^M_{n−1}(k), the second summand written b·Π, with multiplication (a + bΠ)(c + dΠ) = ac + (ad + (−1)^{|c|}bc + (−1)^{|d|}bd·{−1})Π for homogeneous a, b, c, d. It is an associative, unital, graded-commutative ring (xy = (−1)^{|x||y|}yx), containing K^M_*(k) as the subring b = 0, and Π = (0, 1) ∈ L(k)_1 satisfies Π·Π = {−1}·Π and Π·{c} = −{c}·Π. The maps a + bΠ ↦ a (the λ-part) and a + bΠ ↦ a + b{−1} (the ρ-part) are graded ring homomorphisms L(k) → K^M_*(k), and for c ∈ k^× the assignment Π ↦ Π − {c} extends to a graded ring automorphism σ_c of L(k) over K^M_*(k). This is the 'graded K^M_*(k_v)-algebra generated by an indeterminate Π in L1, with the relation {Π, Π} = {−1, Π}' of the source, made explicit.

**Hypotheses.**

- k is a field; K^M_*(k) is the graded ring of K2SymbolsBrauer:T.2/milnor-k-theory, graded-commutative by K2SymbolsBrauer:T.2/milnor-alternating.


**Construction and proof.**

1. Derive the multiplication from the rules Π·c = (−1)^{|c|}c·Π and Π·Π = {−1}·Π, and check associativity and the unit on homogeneous elements; the checks use graded commutativity of K^M_*(k) and 2·{−1} = 0.
2. Graded commutativity of L(k): it holds on K^M_*(k) (K2SymbolsBrauer:T.2/milnor-alternating) and between Π and K^M_*(k) by construction; for Π with itself it holds because Π·Π is its own negative, 2·{−1} = 0.
3. The λ-part map kills Π·L(k) and is multiplicative by the formula; the ρ-part map is multiplicative because {−1}·{−1} = {−1}·{−1} and {−1} anticommutes with degree-one elements.
4. σ_c respects the relation: (Π − {c})² = {−1}Π + {c,c} and {−1}(Π − {c}) = {−1}Π − {−1,c}, and {c,c} = {c,−1} = −{−1,c} in K^M_2(k); its inverse is σ_{c^{−1}}.

**Acceptance.**

- Over k = F_5, Π·Π = {−1}·Π ≠ 0 because {−1} = 4 ≠ 1 in F_5^× = K^M_1(F_5); over a field of characteristic two, Π·Π = 0.
- L(k)_n ≅ K^M_n(k) ⊕ K^M_{n−1}(k) as groups: the source's 'direct sum' is part of the construction, not an assumption.
- Π·{c} = −{c}·Π, so L(k) is not commutative in the ungraded sense.


**Prerequisites.**

- [`K2SymbolsBrauer:T.2/milnor-k-theory`](#node-k2symbolsbrauer-t-2-milnor-k-theory)
- [`K2SymbolsBrauer:T.2/milnor-alternating`](#node-k2symbolsbrauer-t-2-milnor-alternating)


**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `serreAlgebra` | data | The graded ring L(k) with L(k)_n = K^M_n(k) × K^M_{n−1}(k). |
| `serreAlgebra.Π` | constructor | The element Π = (0, 1) of degree one. |
| `serreAlgebra.of` | constructor | The graded ring embedding K^M_*(k) → L(k), a ↦ (a, 0). |
| `serreAlgebra.mul_def` | simp | (a + bΠ)(c + dΠ) = ac + (ad + (−1)^{\|c\|}bc + (−1)^{\|d\|}bd{−1})Π. |
| `serreAlgebra.Π_mul_Π` | simp | Π·Π = {−1}·Π. |
| `serreAlgebra.Π_mul` | relation | Π·x = (−1)^{\|x\|}·x·Π for x ∈ K^M_*(k). |
| `serreAlgebra.gradedComm` | structure | L(k) is graded-commutative. |
| `serreAlgebra.decompose` | equivalence | L(k)_{n+1} ≃ K^M_{n+1}(k) ⊕ K^M_n(k) for n ≥ 0, and L(k)_0 = K^M_0(k). |
| `serreAlgebra.lambdaHom` | projection | The graded ring homomorphism L(k) → K^M_*(k), a + bΠ ↦ a. |
| `serreAlgebra.rhoHom` | projection | The graded ring homomorphism L(k) → K^M_*(k), a + bΠ ↦ a + b·{−1}. |
| `serreAlgebra.shift` | functoriality | For c ∈ k^×, the graded ring automorphism with Π ↦ Π − {c}; shift c ∘ shift c′ = shift (cc′). |
| `serreAlgebra.map` | functoriality | A field homomorphism k → k′ induces L(k) → L(k′) fixing Π, with map_id and map_comp. |

**Consumers.**

- T.3/serre-map-steinberg — the target of the map d
- T.3/higher-milnor-residues — the residue and specialisation are the two components of d
- T.3/specialisation-change-of-uniformiser — changing the uniformiser is the automorphism shift
- T.3/milnor-residue-product-formula — the product formula is the multiplication rule of L(k)


**Unit tests.**

- `serreAlgebra_pi_sq_F5` (computation) — Over F_5: Π·Π = {4}·Π, and {4} ≠ 0 in K^M_1(F_5).
- `serreAlgebra_pi_sq_char_two` (degenerate) — Over F_2 (or any field of characteristic two): Π·Π = 0.
- `serreAlgebra_anticomm_F5` (characterisation) — Over F_5: Π·{2} = {3}·Π (as −{2} = {2^{−1}} = {3}), and Π·{2} ≠ {2}·Π.
- `serreAlgebra_lambda` (compatibility) — lambdaHom ∘ of = id on K^M_*(k) and lambdaHom Π = 0.
- `serreAlgebra_not_square_zero` (non-example) — With Π·Π = 0 instead, the map d of T.3/serre-map-steinberg would send {5, −5}, which is 0 in K^M_2(ℚ), to Π·({−1} + Π) = {−1}·Π ≠ 0 over F_5; in L(k) it goes to {−1}Π + {−1}Π = 0.


**Suggested placement.** module: `TauCeti/Algebra/KTheory/Milnor/Residue`; namespace: `TauCeti.MilnorK`.

**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), Theorem III.7.3, proof (PDF p. 254).
  Excerpt: “Proof. (Serre) Let L denote the graded KM∗(kv)-algebra generated by an indeterminate Π in L1, with the relation {Π, Π} = {−1, Π}. We claim that the group homomorphism d: F× → L1 = l(k×v) ⊕ Z · Π, d(uπ^i) = l(ū) + iΠ satisfies the relation: for r ≠ 0, 1, d(r)d(1 − r) = 0 in L2.”
  Use: The algebra L and the map d; this node constructs L explicitly.
- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), Theorem III.7.3, proof (PDF p. 254).
  Excerpt: “If so, the presentation of KM∗(F) shows that d extends to a graded ring homomorphism d: KM∗(F) → L. Since Ln is the direct sum of KMn(kv) and KMn−1(kv), we get two maps: λ: KMn(F) → KMn(kv) and ∂v : KMn(F) → KMn−1(kv).”
  Use: The direct-sum decomposition of L_n that the construction provides.

<a id="node-k2symbolsbrauer-t-3-serre-map-steinberg"></a>
### Serre's map kills the Steinberg elements

`K2SymbolsBrauer:T.3/serre-map-steinberg` · lemma · implementation unchecked

Also realises `K2SymbolsBrauer:T.3:localization-comparison`.

For a surjective discrete valuation v on F with uniformiser t, the map d_t : F^× → L(k)_1, d_t(u·t^i) = {ū} + i·Π (u ∈ R^×, i ∈ ℤ), is a group homomorphism with d_t(r)·d_t(1 − r) = 0 in L(k)_2 for every r ∈ F \ {0, 1}.

**Hypotheses.**

- v is a surjective discrete valuation on F with valuation ring R, maximal ideal 𝔪, residue field k and uniformiser t.


**Construction and proof.**

1. d_t is a homomorphism: unit parts multiply and orders add (Valuation.ord_mul).
2. r ∈ R^×, r ≠ 1: if 1 − r ∈ R^× then d(r)d(1 − r) = {r̄}{1 − r̄} = 0 by the Steinberg relation in K^M_2(k) (r̄ ≠ 0, 1); if ord(1 − r) > 0 then r̄ = 1 and d(r) = {1} = 0.
3. ord r > 0: 1 − r ∈ R^× with residue 1 (Valuation.mem_maximalIdeal_iff_ord_pos), so d(1 − r) = 0.
4. r ∉ R: 1 − r = −r·(1 − r^{−1}), so d(1 − r) = d(−r) + d(1 − r^{−1}), and d(r)d(1 − r^{−1}) = −d(r^{−1})d(1 − r^{−1}) = 0 by the previous step; hence d(r)d(1 − r) = d(r)d(−r).
5. d(x)d(−x) = 0 for every x = u·t^i: ({ū} + iΠ)({−ū} + iΠ) = {ū,−ū} + i({ū} − {−ū})Π + i²{−1}Π = (i + i²){−1}Π = 0, using {ū, −ū} = 0 in K^M_2(k) (K2SymbolsBrauer:T.2/milnor-alternating), Π{a} = −{a}Π, Π² = {−1}Π, {ū} − {−ū} = {−1}, and that i + i² is even while 2{−1} = 0. This is where the relation on Π is used.

**Acceptance.**

- The case analysis covers r ∈ R^×, ord r > 0 and r ∉ R, and reduces the last to d(x)d(−x) = 0.
- With Π² = 0 the last step fails: over F_5, d(5)d(−5) = {−1}Π ≠ 0 (T.3/serre-residue-algebra, non-example).


**Prerequisites.**

- [`K2SymbolsBrauer:T.3/serre-residue-algebra`](#node-k2symbolsbrauer-t-3-serre-residue-algebra)
- [`K2SymbolsBrauer:T.3/tame-symbol`](#node-k2symbolsbrauer-t-3-tame-symbol)
- [`K2SymbolsBrauer:T.2/milnor-k-theory`](#node-k2symbolsbrauer-t-2-milnor-k-theory)
- [`K2SymbolsBrauer:T.2/milnor-alternating`](#node-k2symbolsbrauer-t-2-milnor-alternating)
- `tauceti:Valuation.ord_mul`
- `tauceti:Valuation.mem_maximalIdeal_iff_ord_pos`


**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), Theorem III.7.3, proof (PDF p. 254).
  Excerpt: “If 1 ≠ r ∈ R×, then either 1 − r ∈ R× and d(r)d(1 − r) = {r̄, 1 − r̄} = 0, or else v(1 − r) = i > 0 and d(r) = l(1) + 0 · Π = 0 so d(r)d(1 − r) = 0 · d(1 − r) = 0. If v(r) > 0 then 1 − r ∈ R× and the previous argument implies that d(1 − r)d(r) = 0.”
  Use: The cases r ∈ R^× and v(r) > 0.
- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), Theorem III.7.3, proof (PDF p. 254).
  Excerpt: “If r ∉ R then 1/r ∈ R, and we see from (5.10.3) and the above that d(r)d(1 − r) = d(1/r)d(−1/r). Therefore it suffices to show that d(r)d(−r) = 0 for every r ∈ R. If r = π this is the given relation upon L, and if r ∈ R× then d(r)d(−r) = {r, −r} = 0 by (5.10.3).”
  Use: The reduction of r ∉ R to d(x)d(−x) = 0 and the use of the relation on Π; the source's '{r, −r}' is {r̄, −r̄} in K^M_2(k_v).

<a id="node-k2symbolsbrauer-t-3-higher-milnor-residues"></a>
### Higher tame symbols and specialisation maps

`K2SymbolsBrauer:T.3/higher-milnor-residues` · construction · implementation unchecked

Planet: **Higher tame symbols and specialisation maps**.

Also realises `K2SymbolsBrauer:T.3:localization-comparison`.

For a surjective discrete valuation v on F with uniformiser t and residue field k, the homomorphism d_t of T.3/serre-map-steinberg extends uniquely to a graded ring homomorphism d_t : K^M_*(F) → L(k). Writing d_t(x) = λ_t(x) + ∂_v(x)·Π with Π on the right defines the specialisation λ_t : K^M_n(F) → K^M_n(k), a graded ring homomorphism depending on t, and the higher residue ∂_v : K^M_n(F) → K^M_{n−1}(k). On symbols, λ_t{u_1t^{i_1}, …, u_nt^{i_n}} = {ū_1, …, ū_n}, ∂_v{u_1, …, u_{n−1}, t} = {ū_1, …, ū_{n−1}} and ∂_v{u_1, …, u_n} = 0; in degree one ∂_v{f} = ord_v f, and in degree two ∂_v = tameSymbolHom of T.3/tame-symbol-hom, with no inversion. Both maps are surjective. Theorem III.7.3 reads off the coefficient with Π on the left, ∂^{Wb}{t, u_2, …, u_n} = {ū_2, …, ū_n}; since Π·y = (−1)^{n−1}y·Π for y ∈ K^M_{n−1}(k), ∂^{Wb} = (−1)^{n−1}·∂_v on K^M_n(F): the two agree in odd degree and differ by a sign in even degree, and in degree two ∂^{Wb} is the K-book's tame symbol, the inverse of T.3's.

**Hypotheses.**

- v is a surjective discrete valuation on F with valuation ring R, residue field k and a chosen uniformiser t.


**Construction and proof.**

1. By T.3/serre-map-steinberg and the universal property of the tensor algebra, d_t extends to a ring homomorphism T(F^×) → L(k) killing the Steinberg ideal, hence to d_t : K^M_*(F) → L(k) (K2SymbolsBrauer:T.2/milnor-k-theory); it is graded.
2. Define λ_t and ∂_v as the two components of d_t(x) ∈ L(k)_n = K^M_n(k) ⊕ K^M_{n−1}(k)·Π (T.3/serre-residue-algebra). λ_t = lambdaHom ∘ d_t is a graded ring homomorphism.
3. On symbols: d_t{u_1t^{i_1}, …} = ∏_j({ū_j} + i_jΠ); with all i_j = 0 the product is {ū_1, …, ū_n}, and d_t{u_1, …, u_{n−1}, t} = {ū_1, …, ū_{n−1}}·Π.
4. Degree two: ({ū_f} + aΠ)({ū_g} + bΠ) = {ū_f, ū_g} + (b{ū_f} − a{ū_g} + ab{−1})Π, so ∂_v{f,g} = (−1)^{ab}ū_f^{b}ū_g^{−a} = tameSymbol v f g (a = ord f, b = ord g).
5. Comparison with the source: Π·y = (−1)^{n−1}y·Π for y of degree n − 1, so the left coefficient is (−1)^{n−1} times the right one.
6. Surjectivity: L(k)_n is generated by {ū_1, …, ū_n} = d_t{u_1, …, u_n} and {ū_1, …, ū_{n−1}}Π = d_t{u_1, …, u_{n−1}, t}, and R^× → k^× is onto (ValuationSubring.surjective_unitGroupToResidueFieldUnits); so d_t, λ_t and ∂_v are onto. Independence of ∂_v from t and the dependence of λ_t on t are T.3/specialisation-change-of-uniformiser; the product signs are T.3/milnor-residue-product-formula.

**Acceptance.**

- Degree two: ∂_v = tameSymbolHom, so ∂_{v_5}{5, 2} = 3 in F_5^× over ℚ, whereas Theorem III.7.3's ∂ gives 2 there.
- Degree one: ∂_v{f} = ord_v f and λ_t{f} = res(f·t^{−ord f}).
- Both maps are onto.
- For v_∞ on F(t) with uniformiser t^{−1}, λ is the leading-coefficient map of Example III.7.3.2.


**Prerequisites.**

- [`K2SymbolsBrauer:T.3/serre-residue-algebra`](#node-k2symbolsbrauer-t-3-serre-residue-algebra)
- [`K2SymbolsBrauer:T.3/serre-map-steinberg`](#node-k2symbolsbrauer-t-3-serre-map-steinberg)
- [`K2SymbolsBrauer:T.3/tame-symbol-hom`](#node-k2symbolsbrauer-t-3-tame-symbol-hom)
- [`K2SymbolsBrauer:T.2/milnor-k-theory`](#node-k2symbolsbrauer-t-2-milnor-k-theory)
- `mathlib:ValuationSubring.surjective_unitGroupToResidueFieldUnits`


**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `serreMap` | constructor | The graded ring homomorphism d_t : K^M_*(F) → L(k) with d_t{f} = {ū_f} + ord(f)·Π. |
| `milnorResidue` | constructor | ∂_v : K^M_n(F) → K^M_{n−1}(k), the Π-coefficient of d_t with Π on the right. |
| `milnorSpecialisation` | constructor | λ_t : K^M_n(F) → K^M_n(k), the Π-free part of d_t. |
| `milnorResidue_symbol_units_uniformizer` | simp | ∂_v{u_1, …, u_{n−1}, t} = {ū_1, …, ū_{n−1}}. |
| `milnorResidue_symbol_units` | simp | ∂_v{u_1, …, u_n} = 0 for units u_i. |
| `milnorSpecialisation_symbol` | simp | λ_t{u_1t^{i_1}, …, u_nt^{i_n}} = {ū_1, …, ū_n}. |
| `milnorSpecialisation_mul` | structure | λ_t is a graded ring homomorphism. |
| `milnorResidue_one` | compatibility | In degree one ∂_v{f} = ord_v f. |
| `milnorResidue_two` | compatibility | In degree two ∂_v = tameSymbolHom v. |
| `milnorResidue_kbook` | compatibility | Theorem III.7.3's residue equals (−1)^{n−1}·∂_v on K^M_n(F). |
| `milnorResidue_surjective` | characterisation | ∂_v is onto. |
| `milnorSpecialisation_surjective` | characterisation | λ_t is onto. |
| `milnorResidue_indep` | characterisation | ∂_v does not depend on t (T.3/specialisation-change-of-uniformiser). |
| `milnorResidue_mul` | relation | The product formula (T.3/milnor-residue-product-formula). |

**Consumers.**

- T.4/bass-tate-sequence — the sequence is assembled from the residues at the places of the rational function field
- T.4/simple-transfer — the transfer is defined by −∂_∞ = Σ_p N_p ∂_p
- HigherLocalFieldsAndHigherClassFieldTheory HL.1 — the iterated residues along a residue tower are built from these, with the sign of the position of the parameter recorded
- Polylogarithms P.3 — the residues of the weight-three polylogarithmic complex use the degree-three case


**Unit tests.**

- `milnorResidue_degree_one` (computation) — Over ℚ at 5 with t = 5: ∂_v{50} = 2 and λ_5{50} = 2 in F_5^×.
- `milnorResidue_degree_two` (compatibility) — Over ℚ at 5: ∂_v{5, 2} = 3 = tameSymbol 5 2 and ∂_v{2, 5} = 2.
- `milnorResidue_degree_three_position` (computation) — Over ℚ(t) with the t-adic valuation: ∂{t, 5, 2} = {5, 2} and ∂{5, t, 2} = −{5, 2} in K^M_2(ℚ); they differ, since the tame symbol at 5 sends {5, 2} to 3 and −{5, 2} to 2.
- `milnorResidue_units` (degenerate) — ∂_v{u_1, …, u_n} = 0 for units u_i; for F = ℚ(t) with the t-adic valuation, ∂_t vanishes on the image of K^M_n(ℚ) and λ_t restricts to the identity there.
- `milnorSpecialisation_depends_on_uniformizer` (characterisation) — Over ℚ at 5: λ_5{5} = 1 but λ_{10}{5} = 3 in F_5^×, while ∂_v{5} = 1 for both.
- `milnorResidue_needs_serre_relation` (non-example) — With Π² = 0 in place of Π² = {−1}Π, d{5, −5} = {−1}Π ≠ 0 over F_5 although {5, −5} = 0 in K^M_2(ℚ): the construction does not descend without the relation.


**Suggested placement.** module: `TauCeti/Algebra/KTheory/TameSymbol`; namespace: `TauCeti.TameSymbol`.

**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), Theorem III.7.3 (PDF p. 254).
  Excerpt: “Theorem 7.3 (Specialization maps and higher tame symbols). For every discrete valuation v on F, there are two surjections KMn(F) −∂v→ KMn−1(kv) and KMn(F) −λ→ KMn(kv) satisfying the following conditions.”
  Use: The two surjections.
- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), Theorem III.7.3 (PDF p. 254).
  Excerpt: “If ui ∈ R×, and ūi denotes the image of ui in kv = R/(π) then λ{u1π^{i1}, . . . , unπ^{in}} = {ū1, . . . , ūn}, ∂v{π, u2, . . . , un} = {ū2, . . . , ūn}. In particular, ∂v : KM2(F) → k×v is the tame symbol of Lemma 6.3”
  Use: The formulas on symbols in the source's normalisation (Π on the left); the roadmap's residue is (−1)^{n−1} times it, and equals T.3's tame symbol in degree two.
- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), Theorem III.7.3, proof (PDF p. 254).
  Excerpt: “If so, the presentation of KM∗(F) shows that d extends to a graded ring homomorphism d: KM∗(F) → L. Since Ln is the direct sum of KMn(kv) and KMn−1(kv), we get two maps: λ: KMn(F) → KMn(kv) and ∂v : KMn(F) → KMn−1(kv).”
  Use: The extension of d to K^M_*(F) and the splitting into λ and ∂_v.

<a id="node-k2symbolsbrauer-t-3-finite-support"></a>
### Finite support of the residues

`K2SymbolsBrauer:T.3/finite-support` · lemma · implementation unchecked

Also realises `K2SymbolsBrauer:T.3:localization-comparison`.

Let V be a set of discrete valuations on F such that every f ∈ F^× has ord_v f ≠ 0 for only finitely many v ∈ V — for instance the places of a function field, or the height-one primes of a Dedekind domain with fraction field F. Then for x ∈ K^M_n(F) (n ≥ 1) written as a finite sum of symbols {f_{j,1}, …, f_{j,n}}, ∂_v(x) = 0 for every v ∈ V outside the finite union of the sets {v : ord_v f_{j,i} ≠ 0}. In degree two this is the statement for tameSymbolHom; in particular tameSymbol v f g = 1 whenever ord_v f = ord_v g = 0.

**Hypotheses.**

- V is a set of discrete valuations on F in which each nonzero element has nonzero order at only finitely many members.
- x ∈ K^M_n(F) is given as a finite sum of symbols.


**Construction and proof.**

1. Import the finiteness: TauCeti.Place.finite_setOf_ord_ne_zero for the places of a function field; for a Dedekind domain, IsDedekindDomain.HeightOneSpectrum.Support.finite applied to f and to f⁻¹ (the support of f is the set of its poles, so {v : ord_v f ≠ 0} is the union of the supports of f and f⁻¹).
2. If ord_v f_i = 0 for every entry, then d_t{f_1, …, f_n} = {f̄_1, …, f̄_n} has no Π-component, so ∂_v{f_1, …, f_n} = 0 (T.3/higher-milnor-residues).
3. Hence the support of one symbol lies in the union — not the intersection — of the supports of its entries (on ℚ at 5, ord 5 = 1 ≠ 0 = ord 2 and tameSymbol 2 5 = 2 ≠ 1), and the support of a finite sum lies in the finite union over its summands.

**Acceptance.**

- The support of {f, g} lies in the union of the supports of f and g, and can contain points where only one of them has nonzero order ({2,5} at 5).
- The support of a finite sum of symbols lies in the union of the supports of the summands.
- For units of a Dedekind domain R (order zero everywhere) the symbols are trivial at every height-one prime.
- This is what makes the maps into the direct sums of Theorem III.6.5 and Theorem III.7.4 well defined.


**Prerequisites.**

- [`K2SymbolsBrauer:T.3/higher-milnor-residues`](#node-k2symbolsbrauer-t-3-higher-milnor-residues)
- [`K2SymbolsBrauer:T.3/tame-symbol-hom`](#node-k2symbolsbrauer-t-3-tame-symbol-hom)
- `tauceti:TauCeti.Place.finite_setOf_ord_ne_zero`
- `mathlib:IsDedekindDomain.HeightOneSpectrum.Support.finite`


**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), Localization Theorem III.6.5 (PDF p. 244).
  Excerpt: “Localization Theorem 6.5. Let R be a Dedekind domain, with field of fractions F. Then the tame symbols K2(F) −∂p→ (R/p)× associated to the prime ideals of R fit into a long exact sequence ∐p K2(R/p) → K2(R) → K2(F) −∂=∐∂p→ ∐p (R/p)× → SK1(R) → 1”
  Use: The sum of the tame symbols lands in the coproduct over the primes; that presupposes the finite support this node proves.
- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), Theorem III.7.4 (PDF p. 255).
  Excerpt: “Theorem 7.4. (Milnor) There is a split exact sequence for each n, natural in the field F, and split by the map λ: 0 → KMn(F) → KMn F(t) −∂=∐∂p→ ∐p KMn−1(F[t]/p) → 0.”
  Use: The same presupposition for the higher residues, in every degree.

<a id="node-k2symbolsbrauer-t-3-serre-map-kernel"></a>
### The kernel of Serre's map

`K2SymbolsBrauer:T.3/serre-map-kernel` · lemma · implementation unchecked

Also realises `K2SymbolsBrauer:T.3:localization-comparison`.

For every n ≥ 1 the kernel of d_t : K^M_n(F) → L(k)_n is U¹·K^M_{n−1}(F), the subgroup generated by the products {a}·y with a ∈ U¹ = 1 + 𝔪 (the principal units) and y ∈ K^M_{n−1}(F).

**Hypotheses.**

- v is a surjective discrete valuation on F with valuation ring R, maximal ideal 𝔪, residue field k and uniformiser t; n ≥ 1.


**Construction and proof.**

1. ⊇: for a ∈ U¹, d_t{a} = {ā} = {1} = 0, since U¹ is the kernel of the residue map on R^× (ValuationSubring.ker_unitGroupToResidueFieldUnits), and d_t is multiplicative.
2. Generation: expanding f_j = u_jt^{i_j} multilinearly and using {t, t} = {t, −1} and graded commutativity (K2SymbolsBrauer:T.2/milnor-alternating), K^M_n(F) is generated by the symbols {u_1, …, u_n} and {u_1, …, u_{n−1}, t} with u_i ∈ R^×.
3. Lift: define ψ : L(k)_n → K^M_n(F)/U¹K^M_{n−1}(F) by {ū_1, …, ū_n} ↦ {u_1, …, u_n} and {ū_1, …, ū_{n−1}}Π ↦ {u_1, …, u_{n−1}, t}. It is well defined on the presentations of K^M_n(k) and K^M_{n−1}(k): changing a lift by a principal unit changes the symbol by an element of U¹K^M_{n−1}(F) (move the principal unit to the front by graded commutativity), and if ū_i + ū_{i+1} = 1 then u_{i+1} = (1 − u_i)·a with a ∈ U¹, so the Steinberg relation holds modulo U¹K^M_{n−1}(F).
4. ψ ∘ d_t is the quotient map on the generators of the second step, hence everywhere; so ker d_t ⊆ U¹K^M_{n−1}(F).

**Acceptance.**

- n = 1: the kernel of f ↦ ({ū_f}, ord f) on F^× is U¹.
- The kernel does not depend on t, since U¹ does not.
- Consequently ker λ_t = U¹K^M_{n−1}(F) + {t}·K^M_{n−1}(F), the second statement of Ex. III.7.2.


**Prerequisites.**

- [`K2SymbolsBrauer:T.3/higher-milnor-residues`](#node-k2symbolsbrauer-t-3-higher-milnor-residues)
- [`K2SymbolsBrauer:T.3/serre-residue-algebra`](#node-k2symbolsbrauer-t-3-serre-residue-algebra)
- [`K2SymbolsBrauer:T.2/milnor-k-theory`](#node-k2symbolsbrauer-t-2-milnor-k-theory)
- [`K2SymbolsBrauer:T.2/milnor-alternating`](#node-k2symbolsbrauer-t-2-milnor-alternating)
- `mathlib:ValuationSubring.ker_unitGroupToResidueFieldUnits`


**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), Ex. III.7.2 (PDF p. 265).
  Excerpt: “7.2. Continuing Exercise 7.1, show that the kernel of the map d: KMn(F) → Ln of Theorem 7.3 is exactly l(1 + πR) · KMn−1(F). Conclude that the kernel of the map λ is exactly l(1 + πR) · KMn−1(F) + l(π) · KMn−1(F).”
  Use: The source leaves this as an exercise and uses it in the proof of Corollary III.7.3.1; this node supplies the proof.

<a id="node-k2symbolsbrauer-t-3-rigidity"></a>
### Rigidity for a complete discretely valued field

`K2SymbolsBrauer:T.3/rigidity` · theorem · implementation unchecked

Planet: **Rigidity**.

Also realises `K2SymbolsBrauer:T.3:localization-comparison`.

Let v be a discrete valuation on F with valuation ring R, uniformiser t and residue field k, and suppose F is complete with respect to v (R is 𝔪-adically complete). For every integer q ≥ 1 prime to char(k) (any q ≥ 1 if char k = 0) and every n ≥ 0, (λ_t, ∂_v) : K^M_n(F)/q → K^M_n(k)/q ⊕ K^M_{n−1}(k)/q is an isomorphism.

**Hypotheses.**

- F is complete with respect to the discrete valuation v, with residue field k.
- q is a positive integer prime to the characteristic of k.


**Construction and proof.**

1. (λ_t, ∂_v) is d_t followed by L(k)_n ≅ K^M_n(k) ⊕ K^M_{n−1}(k) (T.3/serre-residue-algebra); d_t is onto (T.3/higher-milnor-residues) with kernel U¹·K^M_{n−1}(F) (T.3/serre-map-kernel).
2. R complete implies R Henselian at 𝔪 (Mathlib's instance IsAdicComplete.henselianRing for HenselianRing); q is a unit of R, its image in k being nonzero. So every a ∈ U¹ is b^q with b ∈ U¹ (TauCeti.HenselianRing.exists_pow_eq_and_sub_one_mem_of_sub_one_mem).
3. Hence U¹·K^M_{n−1}(F) is q-divisible: {a}·y = q·({b}·y).
4. Apply − ⊗ ℤ/q to 0 → U¹K^M_{n−1}(F) → K^M_n(F) → L(k)_n → 0: the first term becomes zero, so K^M_n(F)/q ≅ L(k)_n/q.

**Acceptance.**

- The statement is modulo q, not integral: K^M_1(ℚ_p) = ℚ_p^× is not k^× ⊕ ℤ, U¹ being uncountable.
- n = 1: F^×/q ≅ k^×/q ⊕ ℤ/q.
- The hypothesis on q is needed: for F = ℚ_p (p odd), n = 1 and q = p, F^×/p ≅ (ℤ/p)² while F_p^×/p ⊕ ℤ/p ≅ ℤ/p.
- The proof uses only that R is Henselian; the node keeps the source's completeness hypothesis.


**Prerequisites.**

- [`K2SymbolsBrauer:T.3/higher-milnor-residues`](#node-k2symbolsbrauer-t-3-higher-milnor-residues)
- [`K2SymbolsBrauer:T.3/serre-map-kernel`](#node-k2symbolsbrauer-t-3-serre-map-kernel)
- [`K2SymbolsBrauer:T.3/serre-residue-algebra`](#node-k2symbolsbrauer-t-3-serre-residue-algebra)
- `tauceti:TauCeti.HenselianRing.exists_pow_eq_and_sub_one_mem_of_sub_one_mem`
- `mathlib:HenselianRing`


**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), Corollary III.7.3.1 (PDF p. 254).
  Excerpt: “Corollary 7.3.1 (Rigidity). Suppose that F is complete with respect to the valuation v, with residue field k = kv. For every integer q prime to char(k), the maps λ ⊕ ∂v : KMn(F)/q → KMn(k)/q ⊕ KMn−1(k)/q are isomorphisms for all n.”
  Use: The corollary, with the source's hypotheses.
- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), Corollary III.7.3.1, proof (PDF p. 255).
  Excerpt: “Proof. Since the valuation ring R is complete, Hensel’s Lemma implies that the group 1 + πR is q-divisible. It follows that l(1 + πR) · KMn−1(F) is also q-divisible. But by Ex. 7.2 this is the kernel of the map d: KMn(F) → Ln ≅ KMn(kv) ⊕ KMn−1(kv).”
  Use: The proof: Hensel's lemma and the kernel of d (Ex. III.7.2, node T.3/serre-map-kernel).

<a id="node-k2symbolsbrauer-t-3-milnor-residue-product-formula"></a>
### The product formula for the higher residue

`K2SymbolsBrauer:T.3/milnor-residue-product-formula` · lemma · implementation unchecked

Also realises `K2SymbolsBrauer:T.3:localization-comparison`.

For x ∈ K^M_i(F) and y ∈ K^M_j(F): ∂_v(x·y) = λ_t(x)·∂_v(y) + (−1)^j·∂_v(x)·ρ_t(y), where ρ_t : K^M_*(F) → K^M_*(k) is the graded ring homomorphism rhoHom ∘ d_t, characterised by ρ_t{u·t^m} = {(−1)^m ū}. In particular ∂_v(x·y) = x̄·∂_v(y) when x is a product of symbols of units, so ∂_v is a homomorphism of left modules over the image of K^M_*(R^×). This is Ex. III.7.10 as printed, which holds for the roadmap's normalisation; for Theorem III.7.3's normalisation the formula is ∂^{Wb}(x·y) = (−1)^i λ_t(x)·∂^{Wb}(y) + ∂^{Wb}(x)·ρ_t(y) (recorded as a source issue).

**Hypotheses.**

- v is a surjective discrete valuation on F with uniformiser t and residue field k; x ∈ K^M_i(F), y ∈ K^M_j(F).


**Construction and proof.**

1. Write d_t(x) = λ(x) + ∂(x)Π and d_t(y) = λ(y) + ∂(y)Π and multiply in L(k) (T.3/serre-residue-algebra): the Π-coefficient of d_t(xy) = d_t(x)d_t(y) is λ(x)∂(y) + (−1)^j∂(x)λ(y) + (−1)^{j−1}∂(x)∂(y){−1}.
2. ρ_t(y) = λ(y) + ∂(y){−1}, and since 2{−1} = 0 the last two terms equal (−1)^j∂(x)ρ_t(y).
3. For x a product of unit symbols, ∂(x) = 0 and λ(x) = x̄.
4. Theorem III.7.3's residue is (−1)^{n−1}∂_v on K^M_n(F) (T.3/higher-milnor-residues); substituting gives the formula in that normalisation.

**Acceptance.**

- Over ℚ at 5, x = {5}, y = {2}: ∂{5, 2} = 0 − 1·{2} = −{2}, i.e. 3 in F_5^×, matching tameSymbol 5 2 = 3.
- x = {2}, y = {5}: ∂{2, 5} = {2}·1 − 0 = {2}, i.e. 2.
- Read with Theorem III.7.3's normalisation, the printed formula would give ∂^{Wb}{5, 2} = 3, contradicting ∂^{Wb}{5, 2} = 2 from Theorem III.7.3.


**Prerequisites.**

- [`K2SymbolsBrauer:T.3/higher-milnor-residues`](#node-k2symbolsbrauer-t-3-higher-milnor-residues)
- [`K2SymbolsBrauer:T.3/serre-residue-algebra`](#node-k2symbolsbrauer-t-3-serre-residue-algebra)


**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), Ex. III.7.10 (PDF p. 266).
  Excerpt: “7.10. If v is a valuation on F, and x ∈ KMi(F), y ∈ KMj(F), show that ∂v(xy) = λ(x)∂v(y) + (−1)^j ∂v(x)ρ(y) where ρ: KM∗(F) → KM∗(kv) is a ring homomorphism characterized by the formula ρ(l(uπ^i)) = l((−1)^i ū).”
  Use: The product formula; it holds as printed for the roadmap's normalisation and needs the sign (−1)^i on the first term for Theorem III.7.3's (source issue).

<a id="node-k2symbolsbrauer-t-3-specialisation-change-of-uniformiser"></a>
### The residue is independent of the uniformiser; the specialisation is not

`K2SymbolsBrauer:T.3/specialisation-change-of-uniformiser` · lemma · implementation unchecked

Also realises `K2SymbolsBrauer:T.3:localization-comparison`.

Let t′ = c·t be a second uniformiser (c ∈ R^×). Then ∂_v computed with t′ equals ∂_v computed with t, and λ_{t′}(x) = λ_t(x) − ∂_v(x)·{c̄} for x ∈ K^M_n(F) (product in K^M_*(k)). In particular λ depends on the uniformiser: in degree one λ_{t′}{t} = −{c̄}, i.e. c̄^{−1}. This corrects Ex. III.7.1, which asserts that λ is independent of π; Weibel's errata make the same correction.

**Hypotheses.**

- v is a surjective discrete valuation on F with valuation ring R and residue field k; t and t′ = c·t are uniformisers, c ∈ R^×.


**Construction and proof.**

1. c = t′/t has order zero, so lies in R^× (Valuation.isUnit_iff_ord_eq_zero).
2. In degree one, u·t^i = (u c^{−i})·t′^i, so d_{t′}(u t^i) = {ū} − i{c̄} + iΠ = shift_c(d_t(u t^i)), where shift_c is the automorphism Π ↦ Π − {c̄} of T.3/serre-residue-algebra.
3. Both d_{t′} and shift_c ∘ d_t are graded ring homomorphisms out of K^M_*(F) agreeing in degree one, so they agree.
4. shift_c(λ + ∂Π) = (λ − ∂{c̄}) + ∂Π: the Π-coefficient is unchanged and the Π-free part changes by −∂_v(x)·{c̄}.

**Acceptance.**

- Over ℚ at 5 with t = 5, t′ = 10 (c = 2): λ_5{5} = 1 and λ_{10}{5} = 3 = 2^{−1} in F_5^×; ∂{5} = 1 for both.
- ∂_v is independent of the uniformiser, confirming the first half of Ex. III.7.1.
- λ_t is unchanged when c̄ = 1, i.e. when t′ ≡ t modulo 𝔪².


**Prerequisites.**

- [`K2SymbolsBrauer:T.3/higher-milnor-residues`](#node-k2symbolsbrauer-t-3-higher-milnor-residues)
- [`K2SymbolsBrauer:T.3/serre-residue-algebra`](#node-k2symbolsbrauer-t-3-serre-residue-algebra)
- `tauceti:Valuation.isUnit_iff_ord_eq_zero`


**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), Ex. III.7.1 (PDF p. 265).
  Excerpt: “7.1. Let v be a discrete valuation on a field F. Show that the maps λ: KMn(F) → KMn(kv) and ∂v : KMn(F) → KMn−1(kv) of Theorem 7.3 are independent of the choice of parameter π, and that they vanish on l(u) · KMn−1(F) whenever u ∈ (1 + πR).”
  Use: The exercise's claim for ∂_v is right; its claim for λ is false (the example above), and Weibel's errata to GSM 145 (p. 280, Ex. 7.1) state that λ depends on the choice. Recorded as a source issue with that erratum as known.

<a id="stage-k2symbolsbrauer-t-4"></a>
## T.4 — Rational function fields, norms and reciprocity

Prove the Bass–Tate sequence, construct simple norms at infinity, and establish Kato’s independence and transitivity with inseparable base-change multiplicities. Deduce norm–residue and Suslin reciprocity for the regular proper model over any base field. Import AlgebraicCurves’ normalization and closed-point–place dictionary, and transport the disjoint-support case to EllipticCurves Layer 2.

Coverage: **partial**.

**Remaining proof and supply obligations.**

- Import/implement the exact AlgebraicCurves Layer 2 finite-normalization and completion contracts and the generic DVR norm support requested from LocalFieldsRamification Layer 3.
- Stage edges for the maintainer: EllipticCurves Layer 2 → T.4 and T.4 → MotivicEtaleKTheory M.4 (RT-AREA-ktheory-1/32 and /12); the link AlgebraicCurves Layer 12 → T.4 (AC-L40) already exists.


<a id="node-k2symbolsbrauer-t-3-higher-ramification-formula"></a>
### Ramification and the higher residue

`K2SymbolsBrauer:T.3/higher-ramification-formula` · lemma · implementation unchecked

Also realises `K2SymbolsBrauer:T.3:localization-comparison`.

Let F → E be any field embedding and v, w normalised surjective discrete valuations satisfying ord_w(f(r)) = e·ord_v(r), e ≥ 1, with the induced residue-field embedding k_v → k_w. No finite-dimensionality hypothesis is imposed. For x ∈ K^M_n(F): ∂_w(res_{E/F} x) = e·res_{k_w/k_v}(∂_v x) in K^M_{n−1}(k_w). In degree two this is T.3/ramification-formula. The statement reads the same in both normalisations, each side changing by (−1)^{n−1}. The finite-extension special case is Exercise III.7.8; the same elementary uniformiser/unit proof gives the stated embedding generalisation, one of the elementary Milnor residue identities Kato's proof uses (with Exercises III.7.7 and III.7.9 and Corollary III.7.6.3); it is parented in T.4, before T.4/milnor-transfer-transitivity, and realises the ramification clause of T.3:localization-comparison.

**Hypotheses.**

- F → E is an arbitrary field embedding, v and w are normalised surjective discrete valuations, ord_w(f(r)) = e·ord_v(r), and e ≥ 1. A valuation on E trivial on F is a separate case, not a positive-e extension of v.


**Construction and proof.**

1. First construct the local valuation-ring map and residue-field embedding using e > 0 (T.3/tame-symbol, residueFieldMap). Choose uniformisers t for v and s for w; then f(t) = c·s^e with c a unit of the valuation ring of w. No step uses [E : F] or algebraicity.
2. K^M_n(F) is generated by symbols {u_1, …, u_n} and {u_1, …, u_{n−1}, t} with u_i ∈ R^× (the generation step of T.3/serre-map-kernel).
3. ∂_w{u_1, …, u_n} = 0 = e·∂_v{u_1, …, u_n}; and ∂_w{u_1, …, u_{n−1}, c s^e} = ∂_w{u_1, …, u_{n−1}, c} + e·∂_w{u_1, …, u_{n−1}, s} = 0 + e·{ū_1, …, ū_{n−1}} = e·res(∂_v{u_1, …, u_{n−1}, t}).
4. For a valuation w on E whose restriction to F is trivial, every f(a), a ∈ F^×, is a unit of 𝒪_w. The residue of each imported symbol vanishes by higher-milnor-residues (milnorResidue_symbol_units), and therefore ∂_w ∘ res = 0 on the whole Milnor group by generation. Do not construct a residue-field map for e = 0.

**Acceptance.**

- n = 1: ord_w(r) = e·ord_v(r).
- n = 2: the e-th power formula of T.3/ramification-formula.
- The residue fields enter only through res_{k_w/k_v}; the inertia degree does not appear.
- Infinite constant extension F(t) → F(u)(t): at the place t, e = 1 and k_v = F → F(u) = k_w; ∂_w{a,t} is the image of a for a ∈ F^×. For F = ℚ and a = 2 this is 2, not its inverse.
- Completion F → F̂_v has e = 1 and the same residue field, so the formula gives ∂_{v̂} ∘ res = ∂_v without requiring the completion to be finite over F.
- Trivial-restriction case: the place t−u of F(u)(t) is trivial on F(t), because every nonzero polynomial p(t) ∈ F[t] has p(u) ≠ 0. Every imported Milnor symbol therefore has zero residue there.


**Prerequisites.**

- [`K2SymbolsBrauer:T.3/higher-milnor-residues`](#node-k2symbolsbrauer-t-3-higher-milnor-residues)
- [`K2SymbolsBrauer:T.3/serre-map-kernel`](#node-k2symbolsbrauer-t-3-serre-map-kernel)
- [`K2SymbolsBrauer:T.3/ramification-formula`](#node-k2symbolsbrauer-t-3-ramification-formula)
- [`K2SymbolsBrauer:T.2/milnor-k-theory`](#node-k2symbolsbrauer-t-2-milnor-k-theory)


**Unit tests.**

- `TauCeti.MilnorK.higher_ramification_infinite` (compatibility) — Instantiate higher_ramification_formula at ℚ → ℚ(u), the 5-adic valuation and its e = 1 Gauss extension: the residues commute in every degree, with k_w = F_5(u). The suggested instance has the actual RatFunc ℚ carrier and no FiniteDimensional hypothesis.
- `TauCeti.MilnorK.higher_residue_trivial_restriction` (degenerate) — For any field embedding F → E and surjective discrete w trivial on F^×, the residue of every imported symbol {a_1,…,a_{n+1}} is 0. In particular this applies to F(t) → F(u)(t) at t−u, which has no positive ramification index over a nontrivial place of F(t).


**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), Ex. III.7.8 (PDF p. 265).
  Excerpt: “7.8. Ramification and ∂v. Suppose that E is a finite extension of F, and that w is a valuation on E over the valuation v on F, with ramification index e. (See 6.3.1.) Use the formulas for ∂v and ∂w in Theorem 7.3 to show that for every x ∈ KMn(F) we have ∂w(x) = e · ∂v(x) in KMn−1(kw).”
  Use: The statement, left as an exercise in the source. The arbitrary-embedding extension is derived by the displayed uniformiser/unit calculation; the printed exercise only assumes a finite extension.

<a id="node-k2symbolsbrauer-t-4-valuation-comparison"></a>
### Closed points of the regular proper model against places: AlgebraicCurves Layer 12 imported, tame symbols transported

`K2SymbolsBrauer:T.4/valuation-comparison` · comparison · implementation unchecked

Let K be a function field of one variable over F and X the proper regular integral curve with function field K (the normalisation of ℙ¹_F in K, AlgebraicCurves Layer 12B; any proper integral curve with function field K has X as its normalisation). AlgebraicCurves Layer 12 supplies, and this node imports rather than proves: ord_x : K^× → ℤ at each regular closed point through the discrete valuation ring O_{X,x} (12A); the bijection x ↦ P_x between closed points of X and places of K/F, with Scheme.ord at x equal to the order at P_x and κ(x) ≃ₐ[F] k(P_x), degrees matching (12A–12B); and Weil divisors on X ≅ Divisor F K, matching degrees and principal divisors (12D). X is regular but need not be smooth over F when F is imperfect (Layer 12's 'regular, not smooth' convention, adopted here). What this node adds is the transport of the K_2 data: the roadmap's tame symbol at x, formed with ord_x and κ(x), is carried to the tame symbol at P_x, N_{κ(x)/F} = N_{k(P_x)/F}, and div f on X is Tau Ceti's Divisor.principal f; so the reciprocity product over X^{(1)} is the product over the places of K/F.

**Hypotheses.**

- X is integral, proper (hence projective, Layer 12B), regular and of dimension one over F; no smoothness over F is assumed.
- The dictionary is AlgebraicCurves Layer 12's (12A, 12B, 12D), imported as stated there.


**Construction and proof.**

1. Import from AlgebraicCurves Layer 12 the closed-point/place bijection with Scheme.ord equal to the place order and κ(x) ≃ₐ[F] k(P_x) (12A–12B), and the identification of Weil divisors on X with Divisor F K, principal divisors included (12D).
2. The tame symbol depends only on the discrete valuation and its residue map (T.3/tame-symbol-uniformizer-independence), so equal valuations and compatible residue maps give equal symbols, transported along κ(x) ≃ₐ[F] k(P_x).
3. Field norms, and Kato's norms in every degree, are invariant under an F-algebra equivalence of residue fields.
4. No comparison of valuations is proved here: the valuation dictionary is Layer 12's, and this node only transports the symbols along it.

**Acceptance.**

- For X = ℙ¹_F the places are those of the pinned ratFuncEquiv, including ∞.
- On an affine chart Spec R the comparison is the pinned correspondence between the places finite on R and the height-one primes of R.
- The comparison is of discrete valuations together with their residue maps: equality of orders alone would not identify the residues of the tame symbols.
- Regular, not smooth: over F = 𝔽_p(s), p odd, the curve y² = x^p − s is regular at the closed point y = 0, x^p = s (its maximal ideal is generated by y) but not smooth there (both partial derivatives vanish), and its residue field F(s^{1/p}) is purely inseparable over F.


**Prerequisites.**

- `mathlib:AlgebraicGeometry.Scheme.ord`
- [`K2SymbolsBrauer:T.3/tame-symbol`](#node-k2symbolsbrauer-t-3-tame-symbol)
- [`K2SymbolsBrauer:T.3/tame-symbol-uniformizer-independence`](#node-k2symbolsbrauer-t-3-tame-symbol-uniformizer-independence)
- `tauceti:TauCeti.Place.heightOneSpectrumEquiv`
- `tauceti:TauCeti.Place.ratFuncEquiv`
- `tauceti:TauCeti.Divisor.principal`


**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), V.6.12, Smooth Curves 6.12 (PDF p. 424; book p. 416).
  Excerpt: “Smooth Curves 6.12. Suppose that X is an irreducible curve over a field k, with function field F. For each closed point x ∈ X, the field k(x) is a finite field extension of k.”
  Use: The closed points and their residue fields, as the source uses them for Weil reciprocity.
- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.6.3 (PDF p. 242; book p. 234).
  Excerpt: “By convention, v(0) = ∞, so that the ring R of all r with v(r) ≥ 0 is a discrete valuation ring (DVR).”
  Use: The valuation-theoretic side: the tame symbol is attached to a discrete valuation ring.

<a id="node-k2symbolsbrauer-t-4-leading-coefficient-splitting"></a>
### Leading coefficients split K^M_n(F) off K^M_n F(t) (Example III.7.3.2)

`K2SymbolsBrauer:T.4/leading-coefficient-splitting` · lemma · implementation unchecked

Let F be a field and, for nonzero f ∈ F(t), let lead(f) be the quotient of the leading coefficients of its numerator and denominator. Let λ: K^M_n F(t) → K^M_n(F) be the specialisation map of T.3/higher-milnor-residues at the place at infinity (order −deg, residue field F) with respect to the uniformiser t^{−1}. Then λ{f_1, …, f_n} = {lead(f_1), …, lead(f_n)}, λ is the identity on the image of K^M_n(F), so K^M_n(F) → K^M_n F(t) is a split injection in every degree, and the residue ∂_∞ vanishes on that image.

**Hypotheses.**

- F is a field and n ≥ 0.
- The specialisation is taken with respect to the uniformiser t^{−1}; with another uniformiser it changes, so the uniformiser is part of the data.


**Construction and proof.**

1. Write a nonzero f as u·(t^{−1})^{i} with i = ord_∞(f) = −deg(f) and u a unit at infinity whose residue is lead(f), using the pinned order and uniformiser at infinity and the pinned identification of the residue field at infinity with F.
2. Apply the value of the specialisation on symbols, λ{u_1π^{i_1}, …, u_nπ^{i_n}} = {ū_1, …, ū_n} (T.3/higher-milnor-residues); no separate check of the Steinberg relation is needed, since λ is already a homomorphism on K^M_n F(t).
3. A constant c has lead(c) = c, so λ is a left inverse of the natural map.
4. Constants are units at infinity and the residue of a symbol of units vanishes, so ∂_∞ is zero on the image of K^M_n(F).

**Acceptance.**

- In degree one λ is the homomorphism f ↦ lead(f) from F(t)^× to F^×.
- In degree two λ is the leading-coefficient map of Example III.6.1.2, which the companion node K2SymbolsBrauer:T.2/rational-function-field plans for K_2; the author's errata list corrects that example's three-case check when lead(f) = 1, a case this route does not need.
- Non-example: over ℚ, with the uniformiser 2t^{−1} instead of t^{−1}, the specialisation sends {t} ∈ K^M_1 to 2 rather than 1, so the formula is tied to t^{−1} (compare the author's erratum to Exercise III.7.1: λ depends on the uniformiser).


**Prerequisites.**

- [`K2SymbolsBrauer:T.3/higher-milnor-residues`](#node-k2symbolsbrauer-t-3-higher-milnor-residues)
- [`K2SymbolsBrauer:T.2/milnor-k-theory`](#node-k2symbolsbrauer-t-2-milnor-k-theory)
- `tauceti:TauCeti.Place.ord_infty`
- `tauceti:TauCeti.Place.isUniformizer_infty`
- `tauceti:TauCeti.Place.inftyResidueFieldEquiv`


**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.7.3.2, Example 7.3.2 (PDF p. 255; book p. 247).
  Excerpt: “Example 7.3.2 (Leading Coefficients). As in Example 6.1.2, K^M_n(F) is a direct summand of K^M_n F(t). To see this, we consider the valuation v∞(f) = −deg(f) on F(t) of Example 6.5.3. Since t^{−1} is a parameter, each polynomial f = ut^{−i} has lead(f) = ū.”
  Use: The statement, with the place at infinity and its parameter t^{−1}; here f = u·t^{−i} with i = v∞(f) = −deg f.
- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.7.3.2, Example 7.3.2 (PDF p. 255; book p. 247).
  Excerpt: “The map λ: K^M_n F(t) → K^M_n(F), given by λ{f1, . . . , fn} = {lead(f1), . . . , lead(fn)}, is clearly inverse to the natural map K^M_n(F) → K^M_n F(t).”
  Use: The formula for λ and the splitting.

<a id="node-k2symbolsbrauer-t-4-degree-reduction"></a>
### Degree reduction for symbols of polynomials (Exercise III.6.2, corrected)

`K2SymbolsBrauer:T.4/degree-reduction` · lemma · implementation unchecked

Let F be a field, d ≥ 1, and L_d ⊂ K^M_n F(t) the subgroup generated by the symbols {f_1, …, f_n} whose entries are nonzero polynomials of degree at most d. (i) If e_1 ≠ e_2 are monic polynomials of degree d and h = e_1 − e_2 (nonzero, of degree < d), then {e_1, e_2} = {h, e_2} − {h, e_1} + {e_1, −1} in K^M_2 F(t). (ii) Consequently L_d is generated by L_{d−1} together with the symbols {π, a_2, …, a_n} with π monic irreducible of degree d and each a_i a nonzero polynomial of degree < d. The source's Exercise III.6.2, which allows only e_1 as an entry of degree d, is false as printed; (i) is what the source's proof of Lemma III.7.4.2 uses.

**Hypotheses.**

- F is a field, t an indeterminate, d ≥ 1 and n ≥ 1; L_0 is the image of K^M_n(F).


**Construction and proof.**

1. (i): h/e_1 + e_2/e_1 = 1 with h ≠ 0 and h ≠ e_1, so the Steinberg relation gives {h/e_1, e_2/e_1} = 0; expand by multiplicativity and use {e_1, e_1} = {e_1, −1}. For d = 1 this is the computation of Lemma III.6.1.4.
2. (ii): scale every entry of a generator of L_d to be monic; the constants lie in L_0 ⊂ L_{d−1}.
3. While two entries have degree d, bring them next to each other by the alternating property, apply (i) multiplied by the remaining entries, and note that each resulting symbol has fewer entries of degree d.
4. A reducible entry of degree d is a product of polynomials of degree < d, which puts the symbol in L_{d−1}; an irreducible one is moved to the first place by the alternating property, at the cost of a sign.

**Acceptance.**

- Over ℚ(t), {t, t − 2} has residue 1/2 at the place t = 2 (K-book normalisation), while every symbol {t, c} or {c, c′} with c, c′ ∈ ℚ^× has trivial residue there; so {t, t − 2} is not a product of such symbols, as the printed exercise would require, but (i) writes it as {2, t − 2} − {2, t} + {t, −1}.
- For d = 1, (i) is Lemma III.6.1.4.
- (ii) is exactly the generation statement that the proof of Lemma III.7.4.2 cites from Exercise III.6.2.


**Prerequisites.**

- [`K2SymbolsBrauer:T.2/milnor-k-theory`](#node-k2symbolsbrauer-t-2-milnor-k-theory)
- [`K2SymbolsBrauer:T.2/milnor-alternating`](#node-k2symbolsbrauer-t-2-milnor-alternating)
- [`K2SymbolsBrauer:T.2/symbol-consequences`](#node-k2symbolsbrauer-t-2-symbol-consequences)


**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III, Exercise 6.2 (PDF p. 251; book p. 243).
  Excerpt: “6.2. (Bass-Tate) If E = F(u) is a field extension of F, and e1, e2 ∈ E are monic polynomials in u of some fixed degree d > 0, show that {e1, e2} is a product of symbols {e1, e′2} and {e, e′′2} with e, e′2, e′′2 polynomials of degree < d. This generalizes Lemma 6.1.4.”
  Use: The exercise the proof of Lemma III.7.4.2 cites. As printed it is false (see the source issue recorded by this review); the node states the corrected form.
- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.6.1.4, Lemma 6.1.4 and its proof (PDF p. 240; book p. 232).
  Excerpt: “Lemma 6.1.4. (Bass-Tate) If E = F(u) is a field extension of F, then every symbol of the form {b1u − a1, b2u − a2} (ai, bi ∈ F) is a product of symbols {ci, di} and {ci, u − di} with ci, di ∈ F.”
  Use: The case d = 1, which is correct as printed.
- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.6.1.4, Lemma 6.1.4 and its proof (PDF p. 240; book p. 232).
  Excerpt: “Set x = u − a1, y = u − a2 and a = a2 − a1, so x = a + y. Then 1 = a/x + y/x yields the relation 1 = {a/x, y/x}. Using {x, x} = {−1, x}, this expands to the desired expression: {x, y} = {a, y}{−1, x}{a^{−1}, x}.”
  Use: The computation that (i) generalises.
- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.7.4.2, proof of Lemma 7.4.2 (PDF p. 256; book p. 248).
  Excerpt: “By Ex. 6.2, Ld is generated by Ld−1 and symbols {π, a2, . . . , an} where π has degree d and the ai have degree < d. But each such symbol is hπ of an element of K^M_{n−1}(kπ), so ⊕hπ is onto.”
  Use: How the source uses the exercise: only the generation statement (ii) is needed.

<a id="node-k2symbolsbrauer-t-4-residue-section"></a>
### The section h_π on the degree filtration (Lemma III.7.4.1)

`K2SymbolsBrauer:T.4/residue-section` · lemma · implementation unchecked

Let π ∈ F[t] be monic irreducible of degree d ≥ 1, k_π = F[t]/(π), and L_d as in T.4/degree-reduction. There is a unique homomorphism h_π : K^M_{n−1}(k_π) → L_d/L_{d−1} sending {ā_1, …, ā_{n−1}} to the class of {a_1, …, a_{n−1}, π}, where a_i ∈ F[t] is the unique representative of ā_i of degree < d. The source's h_π puts π first; the two differ by the sign (−1)^{n−1}, the same sign by which Theorem III.7.3's residue ∂^{Wb} differs from the residue ∂ of T.3/higher-milnor-residues, so each is a section of its own residue.

**Hypotheses.**

- F is a field, n ≥ 1 and π is monic irreducible of degree d; for n = 1 the source group is K^M_0(k_π) = ℤ and h_π(1) is the class of {π}.


**Construction and proof.**

1. The steps below are written, as in the source, with π in the first slot; moving π to the last slot multiplies every symbol by (−1)^{n−1} and changes none of the arguments.
2. Representatives of degree < d exist and are unique: reduction modulo the monic π (pinned modByMonic and its degree bound).
3. Multiplicativity in ā_2: if ā_2 = ā′_2·ā″_2 and a_2 ≠ a′_2a″_2, write a_2 = a′_2a″_2 + fπ with f a nonzero polynomial of degree < d; the Steinberg relation {fπ/a_2, a′_2a″_2/a_2} = 0, multiplied by {a_3, …, a_n}, gives {π, a′_2a″_2/a_2, a_3, …, a_n} ≡ 0 modulo L_{d−1}, because the remaining terms of the expansion have all entries of degree < d. The same argument works in every slot.
4. Steinberg relation: if ā_i + ā_{i+1} = 1 in k_π then a_i + a_{i+1} − 1 has degree < d and is divisible by π, so a_i + a_{i+1} = 1 in F[t] (the source says 'in F') and the symbol vanishes.
5. The multilinear map descends through the presentation of K^M_{n−1}(k_π) (T.2/milnor-k-theory); uniqueness holds because the symbols generate.

**Acceptance.**

- For n = 1, h_π(1) is the class of {π} and ∂_π{π} = 1 in ℤ.
- For d = 1, π = t − b and k_π = F, h_π{c_2, …, c_n} is the class of {c_1, …, c_{n−1}, t − b}.
- Followed by the residue ∂_π it is the identity (T.4/filtration-quotients), which pins its normalisation.


**Prerequisites.**

- [`K2SymbolsBrauer:T.4/degree-reduction`](#node-k2symbolsbrauer-t-4-degree-reduction)
- [`K2SymbolsBrauer:T.2/milnor-k-theory`](#node-k2symbolsbrauer-t-2-milnor-k-theory)
- `mathlib:Polynomial.modByMonic`
- `mathlib:Polynomial.degree_modByMonic_lt`


**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.7.4.1, Lemma 7.4.1 and the paragraph before it (PDF p. 255; book p. 247).
  Excerpt: “Then each element ā of k is represented by a unique polynomial a ∈ F[t] of degree < d. Lemma 7.4.1. There is a unique homomorphism h = hπ : K^M_{n−1}(k) → Ld/Ld−1 carrying {ā2, . . . , ān} to the class of {π, a2, . . . , an} modulo Ld−1.”
  Use: The statement, with the choice of representatives of degree < d.
- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.7.4.1, proof of Lemma 7.4.1 (PDF p. 255; book p. 247).
  Excerpt: “If a2 ≠ a′2a′′2 then there is a nonzero polynomial f of degree < d with a2 = a′2a′′2 + fπ. Since fπ/a2 = 1 − a′2a′′2/a2 we have {fπ/a2, a′2a′′2/a2} = 0. Multiplying by {a3, . . . , an} gives {π, a′2a′′2/a2, a3, . . . , an} ≡ 0 modulo Ld−1.”
  Use: The linearity argument; its last step 'ai + ai+1 = 1 in F' should read 'in F[t]' (see the source issue).

<a id="node-k2symbolsbrauer-t-4-filtration-quotients"></a>
### The graded pieces of the degree filtration (Lemma III.7.4.2)

`K2SymbolsBrauer:T.4/filtration-quotients` · lemma · implementation unchecked

For d ≥ 1 the maps h_π of T.4/residue-section, over the monic irreducible π of degree d, induce an isomorphism ⊕_{deg π = d} K^M_{n−1}(k_π) ≅ L_d/L_{d−1} whose inverse is induced by the residues ∂_π: each ∂_π with deg π = d vanishes on L_{d−1}, ∂_π ∘ h_π is the identity, and ∂_{π′} ∘ h_π = 0 for π′ ≠ π of degree d. Residues are those of T.3/higher-milnor-residues, ∂_π{u_1, …, u_{n−1}, π} = {ū_1, …, ū_{n−1}}, which in degree two is the roadmap's tame symbol; with Theorem III.7.3's ∂^{Wb} and the source's h_π (π first) the statement is the same.

**Hypotheses.**

- F is a field, n ≥ 1, d ≥ 1; the residue field of the place of π is identified with F[t]/(π) by the pinned equivalence.


**Construction and proof.**

1. π divides no nonzero polynomial of degree < d, so every entry of a generator of L_{d−1} is a unit at π and ∂_π vanishes on L_{d−1}.
2. On h_π{ā_1, …} = [{a_1, …, π}]: ∂_π gives {ā_1, …} by the formula of T.3/higher-milnor-residues, and for π′ ≠ π of degree d every entry is a unit at π′.
3. So ⊕∂̄_π ∘ ⊕h_π is the identity, and ⊕h_π is onto by T.4/degree-reduction (ii).

**Acceptance.**

- For d = 1 and F algebraically closed, L_1/L_0 ≅ ⊕_{b ∈ F} K^M_{n−1}(F), which in degree two is Example III.6.1.7.
- In degree one (n = 1) it says that the monic irreducible polynomials of degree d form a basis of the free abelian group L_d/L_{d−1}.
- ∂_π vanishes on L_{d−1} but not on L_d, which is what drives the induction on d.


**Prerequisites.**

- [`K2SymbolsBrauer:T.4/residue-section`](#node-k2symbolsbrauer-t-4-residue-section)
- [`K2SymbolsBrauer:T.4/degree-reduction`](#node-k2symbolsbrauer-t-4-degree-reduction)
- [`K2SymbolsBrauer:T.3/higher-milnor-residues`](#node-k2symbolsbrauer-t-3-higher-milnor-residues)
- `tauceti:TauCeti.Place.adicOfIrreducibleResidueFieldEquiv`
- `tauceti:TauCeti.Place.isUniformizer_adicOfIrreducible`


**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.7.4.2, Lemma 7.4.2 (PDF p. 255; book p. 247).
  Excerpt: “Lemma 7.4.2. The homomorphisms ∂(π) and hπ induce an isomorphism between Ld/Ld−1 and the direct sum ⊕π K^M_{n−1}(kπ) as π ranges over all monic irreducible polynomials of degree d in F[t].”
  Use: The statement.
- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.7.4.2, proof of Lemma 7.4.2 (PDF p. 256; book p. 248).
  Excerpt: “Proof. Since π cannot divide any polynomial of degree < d, the maps ∂(π) vanish on Ld−1 and induce maps ∂̄(π) : Ld/Ld−1 → K^M_{n−1}(kπ). By inspection, the composition of ⊕hπ with the direct sum of the ∂̄(π) is the identity on ⊕π K^M_{n−1}(kπ).”
  Use: The proof, first half.
- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.7.4.2, proof of Lemma 7.4.2 (PDF p. 256; book p. 248).
  Excerpt: “By Ex. 6.2, Ld is generated by Ld−1 and symbols {π, a2, . . . , an} where π has degree d and the ai have degree < d. But each such symbol is hπ of an element of K^M_{n−1}(kπ), so ⊕hπ is onto.”
  Use: The proof, second half: surjectivity through Exercise 6.2, here T.4/degree-reduction.

<a id="node-k2symbolsbrauer-t-4-bass-tate-sequence"></a>
### The Bass–Tate (Milnor) exact sequence for a rational function field

`K2SymbolsBrauer:T.4/bass-tate-sequence` · theorem · implementation unchecked

Planet: **Milnor's exact sequence for F(t)**.

For a field F and n ≥ 1 the sequence 0 → K^M_n(F) → K^M_n F(t) −∂→ ⊕_π K^M_{n−1}(F[t]/(π)) → 0, with π over the monic irreducible polynomials (the finite places of F(t)) and ∂ = (∂_π)_π the higher residues of T.3/higher-milnor-residues, is exact, natural in F, and split by the leading-coefficient map λ of T.4/leading-coefficient-splitting. The residue ∂_∞ at the place at infinity is not a component of ∂; since ∂_∞ vanishes on K^M_n(F), exactness makes it factor uniquely through ∂, which defines the transfers (T.4/simple-transfer) and gives the reciprocity formula for the projective line (T.4/projective-line-reciprocity). The K-book proves the sequence (Theorem III.7.4, attributed to Milnor); the roadmap calls it the Bass–Tate sequence.

**Hypotheses.**

- F is a field, t an indeterminate and n ≥ 1; for n = 0 the sequence is 0 → ℤ → ℤ → 0 → 0.
- The sum is over the finite places of F(t); the place at infinity is not among them.
- Residues are those of T.3/higher-milnor-residues; the sequence is the same for the K-book's ∂^{Wb} = (−1)^{n−1}∂, every residue in a given degree changing by the same sign.


**Construction and proof.**

1. Identify the finite places of F(t) with the monic irreducible polynomials and their residue fields with F[t]/(π) (pinned ratFuncEquiv and adicOfIrreducibleResidueFieldEquiv); the remaining place is ∞.
2. The residue sum lands in the direct sum: a symbol has nonzero residue only at the finitely many π dividing a numerator or denominator of an entry (the residue of a symbol of units vanishes; pinned finiteness of the support of ord).
3. L_0 is the image of K^M_n(F), split off by λ (T.4/leading-coefficient-splitting), and K^M_n F(t) is the union of the L_d of T.4/degree-reduction.
4. Induction on d with T.4/filtration-quotients: the residues at the π of degree ≤ d map L_d onto their direct sum with kernel L_0, because the degree-d residues vanish on L_{d−1} and induce an isomorphism on L_d/L_{d−1}; the union gives exactness in the middle and on the right.
5. Naturality in F: along F → F′ each π factors over F′ and the residues correspond with the multiplicities of the higher ramification formula (T.3/higher-ramification-formula).
6. Record the role of ∞ as in the statement.

**Acceptance.**

- In degree one it is 0 → F^× → F(t)^× → ⊕_π ℤ → 0, the divisor sequence of the affine line.
- In degree two it is the split exact sequence of Application III.6.5.2.
- Non-example: with ∂_∞ added the map is not onto; in degree one its image is the kernel of the degree map on divisors of ℙ¹, so the divisor of the single point ∞ is not in the image.


**Prerequisites.**

- [`K2SymbolsBrauer:T.4/leading-coefficient-splitting`](#node-k2symbolsbrauer-t-4-leading-coefficient-splitting)
- [`K2SymbolsBrauer:T.4/filtration-quotients`](#node-k2symbolsbrauer-t-4-filtration-quotients)
- [`K2SymbolsBrauer:T.4/degree-reduction`](#node-k2symbolsbrauer-t-4-degree-reduction)
- [`K2SymbolsBrauer:T.3/higher-milnor-residues`](#node-k2symbolsbrauer-t-3-higher-milnor-residues)
- [`K2SymbolsBrauer:T.3/finite-support`](#node-k2symbolsbrauer-t-3-finite-support)
- [`K2SymbolsBrauer:T.3/higher-ramification-formula`](#node-k2symbolsbrauer-t-3-higher-ramification-formula)
- [`K2SymbolsBrauer:T.2/milnor-k-theory`](#node-k2symbolsbrauer-t-2-milnor-k-theory)
- `tauceti:TauCeti.Place.ratFuncEquiv`
- `tauceti:TauCeti.Place.adicOfIrreducibleResidueFieldEquiv`
- `tauceti:TauCeti.Place.finite_setOf_ord_ne_zero`


**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.7.4, Theorem 7.4 (PDF p. 255; book p. 247).
  Excerpt: “Theorem 7.4. (Milnor) There is a split exact sequence for each n, natural in the field F, and split by the map λ: 0 → K^M_n(F) → K^M_n F(t) −∂=∐∂p→ ∐p K^M_{n−1}(F[t]/p) → 0.”
  Use: The theorem, attributed by the source to Milnor.
- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.7.4, proof of Theorem 7.4 (PDF p. 255; book p. 247).
  Excerpt: “Let Ld denote the subgroup of K^M_n F(t) generated by those symbols {f1, . . . , fr} such that all the polynomials fi have degree ≤ d. By Example 7.3.2, L0 is a summand isomorphic to K^M_n(F). Since K^M_n F(t) is the union of the subgroups Ld, the theorem will follow from Lemma 7.4.2”
  Use: The proof by the degree filtration, whose steps are the lemmas above; 'fr' is a misprint for 'fn'.
- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.6.5.2, Application 6.5.2 (PDF p. 244; book p. 236).
  Excerpt: “Application 6.5.2 (Function fields). If R is the polynomial ring F[t] for some field F, we know that K2(F[t]) = K2(F) (see 5.2.3). Moreover, the natural map K2(F) → K2F(t) is split by the leading coefficient symbol λ of Example 6.1.2. Therefore we have a split exact sequence”
  Use: The degree-two case (the display 1 → K2(F) → K2F(t) → ∐(F[t]/p)× → 1 follows it).

<a id="node-k2symbolsbrauer-t-4-simple-transfer"></a>
### The Milnor transfer of a simple extension (Definition III.7.5)

`K2SymbolsBrauer:T.4/simple-transfer` · construction · implementation unchecked

Planet: **Milnor transfer**.

Let E = F(a) be a finite extension, π the minimal polynomial of a, and E ≅ F[t]/(π) by t ↦ a. Since ∂_∞ vanishes on K^M_{n+1}(F) and the residue sum is surjective with kernel K^M_{n+1}(F) (T.4/bass-tate-sequence), there are unique homomorphisms N_p : K^M_n(F[t]/p) → K^M_n(F), p over the monic irreducible polynomials, with −∂_∞ = Σ_p N_p ∘ ∂_p on K^M_{n+1}F(t). The transfer N_{a/F} : K^M_n(E) → K^M_n(F) is N_π transported to E; equivalently N_{a/F}(x) = −∂_∞(y) for any y with ∂_π(y) = x and ∂_p(y) = 0 for p ≠ π. In degree zero it is multiplication by [E : F]. The projection formula and the degree formula N_{a/F} ∘ res = [E : F] are T.4/milnor-projection-formula and T.4/restriction-transfer-degree. Between the roadmap's normalisation of the residues and Theorem III.7.3's, every residue on K^M_{n+1}F(t) changes by the same sign (−1)^n, so N_{a/F} is the same in both. Independence of the generator a is Kato's theorem (T.4/milnor-transfer-transitivity), not part of this definition.

**Hypotheses.**

- E/F is a finite field extension generated by a; residues are normalised as in T.3/higher-milnor-residues.


**Construction and proof.**

1. Existence and uniqueness of the N_p: −∂_∞ factors uniquely through the residue sum by exactness of T.4/bass-tate-sequence in degree n + 1 and the vanishing of ∂_∞ on K^M_{n+1}(F) (T.4/leading-coefficient-splitting).
2. Transport N_π to E along the pinned equivalence AdjoinRoot (minpoly F a) ≃ₐ[F] F⟮a⟯, the residue field of the place of π being F[t]/(π).
3. Computation formula: a y with ∂_π(y) = x and all other finite residues zero exists by surjectivity of the residue sum.
4. Degree zero: for x = 1 take y = π; then ∂_π(π) = 1, ∂_p(π) = 0 for p ≠ π and ∂_∞(π) = −deg π, so N_{a/F}(1) = [E : F].

**Acceptance.**

- In degree zero it is multiplication by [E : F].
- If a ∈ F it is the identity.
- In degree one it is the field norm (T.4/transfer-low-degrees).


**Prerequisites.**

- [`K2SymbolsBrauer:T.4/bass-tate-sequence`](#node-k2symbolsbrauer-t-4-bass-tate-sequence)
- [`K2SymbolsBrauer:T.4/leading-coefficient-splitting`](#node-k2symbolsbrauer-t-4-leading-coefficient-splitting)
- [`K2SymbolsBrauer:T.3/higher-milnor-residues`](#node-k2symbolsbrauer-t-3-higher-milnor-residues)
- `tauceti:TauCeti.Place.ratFuncEquiv`
- `mathlib:IntermediateField.adjoinRootEquivAdjoin`


**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `milnorTransferSimple` | constructor | For a integral over F: N_{a/F} : K^M_n(F⟮a⟯) →+ K^M_n(F), defined through the residue at infinity. |
| `milnorTransferSimple_eq_neg_residueInfty` | characterisation | If ∂_π(y) = x and ∂_p(y) = 0 for every monic irreducible p ≠ π, then N_{a/F}(x) = −∂_∞(y). |
| `residueInfty_eq_neg_sum_transfer` | relation | For y ∈ K^M_{n+1}F(t), −∂_∞(y) = Σ_p N_p(∂_p y), a finite sum (Weil's formula III.7.5.1). |
| `milnorTransferSimple_degree_zero` | simp | In degree zero N_{a/F}(m) = [F⟮a⟯ : F]·m. |
| `milnorTransferSimple_of_mem` | simp | If a ∈ F then N_{a/F} is the identity of K^M_n(F). |
| `milnorTransferSimple_mul_restrict` | relation | Projection formula: N_{a/F}(res(x)·y) = x·N_{a/F}(y) for x ∈ K^M_*(F) and y ∈ K^M_*(F⟮a⟯). (T.4/milnor-projection-formula) |
| `milnorTransferSimple_restrict` | relation | N_{a/F}(res x) = [F⟮a⟯ : F]·x for x ∈ K^M_n(F). (T.4/restriction-transfer-degree) |
| `milnorTransferSimple_one_eq_norm` | compatibility | In degree one N_{a/F} is Algebra.norm F on F⟮a⟯ˣ (proved in T.4/transfer-low-degrees). |
| `milnorTransferSimple_kbook` | compatibility | N_{a/F} is the same whether the residues are normalised as in the roadmap or as in Theorem III.7.3. |

**Consumers.**

- T.4/milnor-transfer-transitivity — the transfer of any finite extension is the composite of these along a chain of generators, and Kato's theorem makes it independent of the chain
- T.4/milnor-projection-formula and T.4/restriction-transfer-degree — the projection formula and the degree formula are proved for N_{a/F}
- T.4/projective-line-reciprocity — the defining identity −∂_∞ = Σ N_p ∂_p is Weil's formula for the projective line
- T.3/transfer-and-norm-residue — the norm-residue, projection and degree formulas for the general transfer start from the simple case
- HigherLocalFieldsAndHigherClassFieldTheory HL.1 — Milnor norms of extensions of higher local fields are these transfers
- MotivicEtaleKTheory M.4 — the norms N_{k(x)/F} in the inverse of the diagonal cycle map CH^n(F, n) → K^M_n(F) are Kato's norms built from these transfers


**Unit tests.**

- `milnorTransferSimple_degree_zero_eq` (computation) — For [F⟮a⟯ : F] = d, N_{a/F}(1) = d in K^M_0(F) = ℤ, from y = π: ∂_π(π) = 1, the other finite residues vanish, and ∂_∞(π) = −d.
- `milnorTransferSimple_of_mem_eq_id` (degenerate) — If a ∈ F (π = t − a) then N_{a/F} = id: for x ∈ K^M_n(F), y = {x, t − a} has ∂_{t−a}(y) = x, no other finite residue, and ∂_∞(y) = −x.
- `milnorTransferSimple_one_eq_algebraNorm` (compatibility) — In degree one N_{a/F} = Algebra.norm F on F⟮a⟯ˣ; for ℚ(i)/ℚ, N(1 + i) = 2.
- `milnorTransferSimple_sign` (non-example) — The sign is forced: the maps defined by +∂_∞ = Σ N_p ∂_p would give N_{a/F}(1) = −[F⟮a⟯ : F] in degree zero.
- `milnorTransferSimple_projection_linear` (characterisation) — For c ∈ F^× and d ∈ F, N_{a/F}{c, a − d} = {c, N(a − d)}, from the projection formula and the degree-one case (the formula of Corollary III.6.1.5 for a quadratic extension).


**Suggested placement.** module: `TauCeti/Algebra/KTheory/Milnor/Transfer`; namespace: `TauCeti.MilnorK`.

**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.7.5, paragraph before Definition 7.5 (PDF p. 256; book p. 248).
  Excerpt: “Let v∞ be the valuation on F(t) with parameter t^{−1}. The formulas in Theorem 7.3 defining ∂∞ show that it vanishes on K^M_∗(F). By Theorem 7.4, there are unique homomorphisms Np : K^M_n(F[t]/p) → K^M_n(F) so that −∂∞ = Σp Np∂p.”
  Use: The unique N_p through −∂∞ = Σ Np∂p.
- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.7.5, Definition 7.5 (PDF p. 256; book p. 248).
  Excerpt: “Definition 7.5. Let E be a finite field extension of F generated by an element a. Then the transfer map, or norm map N = Na/F : K^M_∗(E) → K^M_∗(F), is the unique map Np defined above, associated to the kernel p of the map F[t] → E sending t to a.”
  Use: The definition.
- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.7.5, after Definition 7.5 (PDF p. 256; book p. 248).
  Excerpt: “We can calculate the norm of an element x ∈ K^M_n(E) as Np(x) = −∂v∞(y), where y ∈ K^M_{n+1}F(t) is such that ∂p(y) = x and ∂p′(y) = 0 for all p′ ≠ p. If n = 0, the transfer map N : Z → Z is multiplication by the degree [E : F] of the field extension”
  Use: The computation formula and the degree-zero case.
- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.7.5.2, Projection Formula 7.5.2 (PDF p. 256; book p. 248).
  Excerpt: “Projection Formula 7.5.2. Let E = F(a). Then for x ∈ K^M_∗(F) and y ∈ K^M_∗(E) the map N = Na/F satisfies N{x, y} = {x, N(y)}.”
  Use: The projection formula for N_{a/F}.
- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.7.5.3, Corollary 7.5.3 (PDF p. 256; book p. 248).
  Excerpt: “Corollary 7.5.3. If the extension E/F has degree d, then the composition K^M_∗(F) → K^M_∗(E) −N→ K^M_∗(F) is multiplication by d. In particular, the kernel of K^M_∗(F) → K^M_∗(E) is annihilated by d.”
  Use: Restriction followed by transfer.

<a id="node-k2symbolsbrauer-t-4-milnor-projection-formula"></a>
### The projection formula for the transfer

`K2SymbolsBrauer:T.4/milnor-projection-formula` · lemma · implementation unchecked

Also realises `K2SymbolsBrauer:T.3:localization-comparison`.

For E = F(a), x ∈ K^M_*(F) and y ∈ K^M_*(E): N_{a/F}(res_{E/F}(x)·y) = x·N_{a/F}(y). By Definition III.7.6 and Kato's theorem the same holds for N_{E/F} for every finite E/F.

**Hypotheses.**

- E = F(a) is a finite extension; x ∈ K^M_i(F), y ∈ K^M_j(E).


**Construction and proof.**

1. For x ∈ K^M_*(F) and any valuation q of F(t) trivial on F (finite or ∞), the entries of x have order zero, so ∂_q(x·z) = x̄·∂_q(z) by T.3/milnor-residue-product-formula (∂_q(x) = 0, λ(x) = x̄).
2. Choose z ∈ K^M_{j+1}F(t) with ∂_p z = y and ∂_q z = 0 for q ≠ p; then x·z has ∂_p(xz) = res(x)·y and ∂_q(xz) = 0, so N_{a/F}(res(x)·y) = −∂_∞(xz) = −x·∂_∞(z) = x·N_{a/F}(y).

**Acceptance.**

- y = 1 ∈ K^M_0(E) gives N_{a/F}(res x) = [E : F]·x (T.4/restriction-transfer-degree).
- Degree one with y = 1: N_{E/F}(x) = x^{[E:F]} for x ∈ F^×, the field-norm identity.
- The formula holds in both normalisations of the residue.


**Prerequisites.**

- [`K2SymbolsBrauer:T.4/simple-transfer`](#node-k2symbolsbrauer-t-4-simple-transfer)
- [`K2SymbolsBrauer:T.3/milnor-residue-product-formula`](#node-k2symbolsbrauer-t-3-milnor-residue-product-formula)
- [`K2SymbolsBrauer:T.4/bass-tate-sequence`](#node-k2symbolsbrauer-t-4-bass-tate-sequence)


**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), Projection Formula III.7.5.2 (PDF p. 256).
  Excerpt: “Projection Formula 7.5.2. Let E = F(a). Then for x ∈ KM∗(F) and y ∈ KM∗(E) the map N = Na/F satisfies N{x, y} = {x, N(y)}.”
  Use: The statement.
- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), Projection Formula III.7.5.2, proof (PDF p. 256).
  Excerpt: “It follows from Theorem 7.4 that each ∂p is a graded module homomorphism of degree −1. This remark also applies to v∞ and ∂∞, because F(t) = F(t−1). Therefore each Np is a graded module homomorphism of degree 0.”
  Use: The source's proof; the module property of ∂_p is the product formula with a unit factor (T.3/milnor-residue-product-formula), not Theorem III.7.4 itself.

<a id="node-k2symbolsbrauer-t-4-restriction-transfer-degree"></a>
### Restriction followed by transfer is multiplication by the degree

`K2SymbolsBrauer:T.4/restriction-transfer-degree` · lemma · implementation unchecked

Also realises `K2SymbolsBrauer:T.3:localization-comparison`.

For E = F(a) of degree d, N_{a/F} ∘ res_{E/F} = d·id on K^M_*(F); hence the kernel of res_{E/F} : K^M_*(F) → K^M_*(E) is killed by d. By composition along a generating tower the same holds for N_{E/F} and every finite E/F, degrees multiplying.

**Hypotheses.**

- E = F(a) is a finite extension of degree d.


**Construction and proof.**

1. Apply T.4/milnor-projection-formula with y = 1 ∈ K^M_0(E): N(res x) = x·N(1).
2. N(1) = d by the degree-zero case of T.4/simple-transfer.

**Acceptance.**

- Degree one: N_{E/F}(x) = x^d for x ∈ F^×.
- Degree zero: the composite ℤ → ℤ → ℤ is multiplication by d.


**Prerequisites.**

- [`K2SymbolsBrauer:T.4/milnor-projection-formula`](#node-k2symbolsbrauer-t-4-milnor-projection-formula)
- [`K2SymbolsBrauer:T.4/simple-transfer`](#node-k2symbolsbrauer-t-4-simple-transfer)


**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), Corollary III.7.5.3 (PDF p. 256).
  Excerpt: “Corollary 7.5.3. If the extension E/F has degree d, then the composition KM∗(F) → KM∗(E) −N→ KM∗(F) is multiplication by d. In particular, the kernel of KM∗(F) → KM∗(E) is annihilated by d.”
  Use: The statement.

<a id="node-k2symbolsbrauer-t-4-transfer-low-degrees"></a>
### The simple transfer in degree one is the field norm (Exercise III.7.5)

`K2SymbolsBrauer:T.4/transfer-low-degrees` · lemma · implementation unchecked

For a finite extension E = F(a), the transfer N_{a/F} : K^M_1(E) = E^× → K^M_1(F) = F^× of T.4/simple-transfer is the field norm Algebra.norm F. (The degree-zero case, multiplication by [E : F], is part of T.4/simple-transfer.)

**Hypotheses.**

- E = F(a) is a finite extension; π is the minimal polynomial of a, of degree d.


**Construction and proof.**

1. Induction on d; for d = 1 both sides are the identity.
2. For b ∈ E^× choose g ∈ F[t] of degree e < d with g(a) = b and apply the defining identity to y = {π, g} ∈ K^M_2 F(t): ∂_π(y) = b, ∂_q(y) = (π mod q)^{−ord_q g} at the monic irreducible factors q of g, and ∂_∞(y) = (−1)^{de}·lead(g)^{−d} (K-book normalisation; π is monic).
3. Hence N_{a/F}(b) = (−1)^{de}·lead(g)^{d}·∏_q N_q(π mod q)^{ord_q g}, and by induction (deg q < d) each N_q is the field norm of F[t]/(q).
4. Compare with the field norm: Algebra.norm F (g(a)) is the product of g over the roots of π (pinned norm_eq_prod_roots), that is the resultant of π and g, which equals (−1)^{de}·lead(g)^{d}·∏_{g(β)=0} π(β) (pinned resultant_eq_prod_eval); grouping the roots β by the factors q gives the same product.

**Acceptance.**

- For ℚ(i)/ℚ, N(1 + i) = 2.
- For ℚ(∛2)/ℚ and b = ∛2 (g = t, d = 3, e = 1), the factor at q = t is π(0) = −2 and the sign (−1)^{de} = −1 gives the norm 2; without the sign the answer would be wrong.
- For a constant c ∈ F^×, N_{a/F}(c) = c^{[E:F]}, which is also the projection formula applied to c and 1.


**Prerequisites.**

- [`K2SymbolsBrauer:T.4/simple-transfer`](#node-k2symbolsbrauer-t-4-simple-transfer)
- [`K2SymbolsBrauer:T.3/higher-milnor-residues`](#node-k2symbolsbrauer-t-3-higher-milnor-residues)
- `mathlib:Algebra.norm`
- `mathlib:Algebra.norm_eq_prod_roots`
- `mathlib:Polynomial.resultant_eq_prod_eval`


**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III, Exercise 7.5 (PDF p. 265; book p. 257).
  Excerpt: “7.5. Let E = F(a) be a finite extension of F, and consider the transfer map N = Na/F in Definition 7.5. Use Weil’s Formula (7.5.1) to show that when n = 0 the transfer map N : Z → Z is multiplication by [E : F], and that when n = 1 the transfer map N : E× → F× is the usual norm map.”
  Use: The exercise; the source leaves the proof to the reader, and the node's steps supply it.
- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.7.5, after Definition 7.5 (PDF p. 256; book p. 248).
  Excerpt: “We can calculate the norm of an element x ∈ K^M_n(E) as Np(x) = −∂v∞(y), where y ∈ K^M_{n+1}F(t) is such that ∂p(y) = x and ∂p′(y) = 0 for all p′ ≠ p. If n = 0, the transfer map N : Z → Z is multiplication by the degree [E : F] of the field extension”
  Use: The degree-zero case, stated after Definition 7.5.

<a id="node-k2symbolsbrauer-t-4-projective-line-reciprocity"></a>
### Weil reciprocity on the projective line (III.7.5.1 and III.6.5.3)

`K2SymbolsBrauer:T.4/projective-line-reciprocity` · theorem · implementation unchecked

For a field F and x ∈ K^M_{n+1}F(t): Σ_v N_v ∂_v(x) = 0 in K^M_n(F), the sum over all places v of F(t) trivial on F, where N_π = N_{t̄/F} is the simple transfer of F[t]/(π) = F(t̄) and N_∞ is the identity; only finitely many terms are nonzero. In degree two, for f, g ∈ F(t)^× and the roadmap's tame symbol, ∏_v N_{k(v)/F}(∂_v{f, g}) = 1 in F^× with N the field norm.

**Hypotheses.**

- F is a field; residues are normalised as in T.3/higher-milnor-residues. In degree two either normalisation may be used, since inverting every factor does not change a product equal to 1.


**Construction and proof.**

1. The identity is the defining relation −∂_∞ = Σ_π N_π ∂_π of T.4/simple-transfer; the generator t̄ of F[t]/(π) is fixed, so no independence of generators is used.
2. Finiteness: a symbol has nonzero residue only at the places dividing a numerator or denominator of an entry, and at ∞.
3. Degree two: N_π is the field norm (T.4/transfer-low-degrees) and the degree-two residue equals the roadmap's tame symbol; the product form follows.
4. Record the source's independent check in degree two: extend scalars to an algebraic closure, where K_2 F̄(t) is generated modulo K_2(F̄) by the symbols {a, t − b}, with (a, t − b)_∞ = a and ∂_{t−b}(a, t − b) = a^{−1}.

**Acceptance.**

- For {a, t − b} the factor at ∞ is a and the factor at t − b is a^{−1} (K-book normalisation); all other factors are 1.
- The place at infinity is needed: over ℚ, {2, t} has factor 1/2 at the place t and 2 at ∞ (K-book normalisation), so the finite places alone do not give 1.
- In degree one (n = 0) it says that a principal divisor on the projective line has degree zero, Σ_v deg(v)·ord_v(f) = 0.
- Roadmap convention check at 5 over ℚ: both the degree-two higher residue and tameSymbol send {2,5} to 2 in F_5^×; its inverse is 3. Only the separately named K-book residue is inverse.


**Prerequisites.**

- [`K2SymbolsBrauer:T.4/simple-transfer`](#node-k2symbolsbrauer-t-4-simple-transfer)
- [`K2SymbolsBrauer:T.4/transfer-low-degrees`](#node-k2symbolsbrauer-t-4-transfer-low-degrees)
- [`K2SymbolsBrauer:T.4/bass-tate-sequence`](#node-k2symbolsbrauer-t-4-bass-tate-sequence)
- [`K2SymbolsBrauer:T.3/finite-support`](#node-k2symbolsbrauer-t-3-finite-support)
- [`K2SymbolsBrauer:T.3/higher-milnor-residues`](#node-k2symbolsbrauer-t-3-higher-milnor-residues)
- `tauceti:TauCeti.Place.ratFuncEquiv`
- `tauceti:TauCeti.Place.normResidue`


**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.7.5.1, Weil Reciprocity Formula 7.5.1 (PDF p. 256; book p. 248).
  Excerpt: “If we let N∞ denote the identity map on K^M_n(F), and sum over the set of all discrete valuations on F(t) which are trivial on F, the definition of the Nv yields the: Weil Reciprocity Formula 7.5.1. Σv Nv∂v(x) = 0 for all x ∈ K^M_n F(t).”
  Use: The statement in all degrees, as a consequence of Definition 7.5.
- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.6.5.3, Weil Reciprocity Formula 6.5.3 (PDF p. 244; book p. 236).
  Excerpt: “The appropriate reciprocity formula first appeared in Weil’s 1940 paper on the Riemann Hypothesis for curves: (f, g)∞ · ∏p Np(f, g)p = 1 in F×. In Weil’s formula, ‘Np’ denotes the usual norm map (F[t]/p)× → F×.”
  Use: The degree-two form with field norms.
- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.6.5.3, proof of the Weil Reciprocity Formula (PDF p. 244; book p. 236).
  Excerpt: “Thus we may assume that F is algebraically closed. By Example 6.1.7, K2F(t) is generated by linear symbols of the form {a, t−b}. But (a, t−b)∞ = a and ∂t−b(a, t−b) = a^{−1}, so the formula is clear.”
  Use: The source's proof of the degree-two form.

<a id="node-k2symbolsbrauer-t-4-prime-to-p-closure"></a>
### Passing to a prime-to-p closure (Kato's key trick)

`K2SymbolsBrauer:T.4/prime-to-p-closure` · lemma · implementation unchecked

For a field F and a prime p there is an algebraic extension F′/F that is the union of its finite subextensions of degree prime to p and such that every finite extension of F′ has p-power degree. For such F′ and every n, every element of the kernel of K^M_n(F) → K^M_n(F′) is killed by an integer prime to p; in particular the kernel has no p-torsion.

**Hypotheses.**

- F is a field and p a prime.


**Construction and proof.**

1. Existence: by Zorn's lemma choose, inside an algebraic closure, a maximal subfield F′ that is a directed union of finite extensions of F of degree prime to p.
2. Every finite extension L/F′ has p-power degree: for L separable, the fixed field of a Sylow p-subgroup of the Galois group of its Galois closure has degree prime to p over F′ and is generated over F′ by an element whose minimal polynomial is defined over a finite prime-to-p subextension of F, so maximality makes it F′; for L purely inseparable its degree is a power of the characteristic, which maximality forces to be p.
3. Kernel: an element dying in K^M_n(F′) dies in K^M_n(F″) for a finite F ⊂ F″ ⊂ F′ (Milnor K-theory commutes with directed unions of fields, from its presentation), and along a chain of simple extensions from F to F″ restriction followed by the composite of the simple transfers is multiplication by [F″ : F] (T.4/restriction-transfer-degree), which is prime to p.

**Acceptance.**

- If F is algebraically closed, F′ = F.
- For F = 𝔽_q, F′ is the union of the 𝔽_{q^m} with m prime to p.
- The kernel need not vanish: for p odd the prime-to-p closure of ℝ is ℂ, and {−1, −1} ∈ K^M_2(ℝ) dies in K^M_2(ℂ); it is killed by 2, which is prime to p.


**Prerequisites.**

- [`K2SymbolsBrauer:T.4/simple-transfer`](#node-k2symbolsbrauer-t-4-simple-transfer)
- [`K2SymbolsBrauer:T.2/milnor-k-theory`](#node-k2symbolsbrauer-t-2-milnor-k-theory)
- `mathlib:Sylow`
- [`K2SymbolsBrauer:T.4/restriction-transfer-degree`](#node-k2symbolsbrauer-t-4-restriction-transfer-degree)


**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.7.6.1, the paragraph after Theorem 7.6.1 (PDF p. 257; book p. 249).
  Excerpt: “The key trick used in the proof of this theorem is to fix a prime p and pass from F to a union F′ of finite extensions of F of degree prime to p such that the degree of every finite extension of F′ is a power of p. By Corollary 7.5.3 the kernel of K^M_n(F) → K^M_n(F′) has no p-torsion.”
  Use: The trick, as the source states it.

<a id="node-k2symbolsbrauer-t-4-transfer-base-change"></a>
### Base change of the simple transfer (Exercise III.7.7)

`K2SymbolsBrauer:T.4/transfer-base-change` · lemma · implementation unchecked

Let E = F(a) be finite with minimal polynomial π, F′/F any field extension, π = ∏_i π_i^{e_i} in F′[t] with distinct monic irreducible π_i, and E_i = F′(a_i) with a_i a root of π_i. Then res_{F′/F} ∘ N_{a/F} = Σ_i e_i · N_{a_i/F′} ∘ res_i on K^M_n(E), where res_i is induced by the F-embedding E → E_i sending a to a_i.

**Hypotheses.**

- F′/F is an arbitrary field extension (finite in the source); the multiplicities e_i are those of the factorisation of π over F′.


**Construction and proof.**

1. Choose y ∈ K^M_{n+1}F(t) with ∂_π(y) = x and no other finite residue (T.4/bass-tate-sequence).
2. Along the constant-extension embedding F(t) → F′(t), a finite place w with nontrivial restriction to F(t) lies over a finite π′ with positive index e_w; by the embedding-general higher ramification formula (T.3/higher-ramification-formula), its residue is e_w times the image of ∂_{π′}(y). Hence at each factor π_i of π it is e_i·res_i(x), and at other such finite places it is zero. A finite place w restricting trivially to F(t) makes every imported nonzero entry a unit, so ∂_w(y′) = 0 by milnorResidue_symbol_units and generation; no e = 0 residue-field map is used. Infinity has index 1 with residue embedding F → F′, so ∂_∞(y′) = res ∂_∞(y). This includes transcendental constant extensions and completions.
3. Apply the computation formula of T.4/simple-transfer over F′ to y′.

**Acceptance.**

- In degree zero it is deg π = Σ_i e_i·deg π_i.
- If π stays irreducible over F′, it says res ∘ N_{a/F} = N_{a/F′} ∘ res.
- For F′ = E and E/F normal it expresses res_{E/F} ∘ N_{a/F} as a sum over the conjugates of a, which is what Lemma III.7.6.2 uses.
- For F′ = F(u) transcendental and π = t²−2 over F = ℚ, π remains irreducible and the residue/transfer comparison is available without finite-dimensionality of F′(t)/F(t). The extra place t−u has trivial restriction and zero residue on imported classes.
- For F′ = F̂_v, use the e = 1 residue comparison for completion; F̂_v/F need not be finite. This preserves the completion input required by Exercise III.7.9 and sourceIssue E10.


**Prerequisites.**

- [`K2SymbolsBrauer:T.4/simple-transfer`](#node-k2symbolsbrauer-t-4-simple-transfer)
- [`K2SymbolsBrauer:T.4/bass-tate-sequence`](#node-k2symbolsbrauer-t-4-bass-tate-sequence)
- [`K2SymbolsBrauer:T.3/higher-ramification-formula`](#node-k2symbolsbrauer-t-3-higher-ramification-formula)
- [`K2SymbolsBrauer:T.3/higher-milnor-residues`](#node-k2symbolsbrauer-t-3-higher-milnor-residues)


**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III, Exercise 7.7 (PDF p. 265; book p. 257).
  Excerpt: “7.7. Ramification and the transfer. Let F′ and E = F(a) be finite field extensions of F, and suppose that the irreducible polynomial π ∈ F[t] of a has a decomposition π = ∏ πi^ei in F′[t]. Let Ei denote F′(ai), where each ai has minimal polynomial πi. Show that the following diagram commutes.”
  Use: The exercise, for finite F′; the argument uses only the naturality of Theorem III.7.4 and the ramification formula, so the node states it for any F′, which Exercise III.7.9 needs for completions.

<a id="node-k2symbolsbrauer-t-4-p-closed-generation"></a>
### Generation by symbols with one entry outside the base (Exercise III.7.6)

`K2SymbolsBrauer:T.4/p-closed-generation` · lemma · implementation unchecked

If every finite extension of F has p-power degree and E/F has degree p, then for n ≥ 1 the group K^M_n(E) is generated by the symbols {y, x_2, …, x_n} with y ∈ E^× and x_2, …, x_n ∈ F^×.

**Hypotheses.**

- Every finite extension of F has p-power degree; [E : F] = p; n ≥ 1.


**Construction and proof.**

1. E = F(u) since the degree is prime, and every element of E is a polynomial in u of degree < p, which splits into linear factors over F because F has no extension of degree between 2 and p − 1.
2. By Lemma III.6.1.4 (the case d = 1 of T.4/degree-reduction (i), correct as printed), a symbol of two linear polynomials in u is a product of symbols {c, d} and {c, u − d} with c, d ∈ F.
3. Apply this to adjacent pairs of entries, using the alternating property, until at most one entry lies outside F^×.

**Acceptance.**

- For F = ℝ and E = ℂ (p = 2), K^M_2(ℂ) is generated by the {r, z} with r ∈ ℝ^× and z ∈ ℂ^×, as in Example III.6.1.6.
- In degree one the statement is trivial.
- The hypothesis on F is used in the first step: over ℚ, with E = ℚ(∛2), the element 1 + ∛2 + ∛4 is a quadratic polynomial in ∛2 that does not split over ℚ, so the argument does not apply.


**Prerequisites.**

- [`K2SymbolsBrauer:T.4/degree-reduction`](#node-k2symbolsbrauer-t-4-degree-reduction)
- [`K2SymbolsBrauer:T.2/milnor-alternating`](#node-k2symbolsbrauer-t-2-milnor-alternating)


**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III, Exercise 7.6 (PDF p. 265; book p. 257).
  Excerpt: “7.6. Suppose that the degree of every finite extension of a field F is a power of some fixed prime p. If E is an extension of degree p and n > 0, use Ex. 6.2 to show that K^M_n(E) is generated by elements of the form {y, x2, . . . , xn}, where y ∈ E× and the xi are in F×.”
  Use: The exercise; it cites Exercise 6.2, whose correct case d = 1 (Lemma III.6.1.4) is what is used.
- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.6.1.4, Lemma 6.1.4 and its proof (PDF p. 240; book p. 232).
  Excerpt: “Lemma 6.1.4. (Bass-Tate) If E = F(u) is a field extension of F, then every symbol of the form {b1u − a1, b2u − a2} (ai, bi ∈ F) is a product of symbols {ci, di} and {ci, u − di} with ci, di ∈ F.”
  Use: The linear case.

<a id="node-k2symbolsbrauer-t-4-kato-prime-degree"></a>
### Independence of the generator for a normal extension of prime degree (Lemma III.7.6.2)

`K2SymbolsBrauer:T.4/kato-prime-degree` · lemma · implementation unchecked

If E/F is normal of prime degree p and E = F(a) = F(b), then N_{a/F} = N_{b/F} : K^M_*(E) → K^M_*(F).

**Hypotheses.**

- E/F is normal (separable or purely inseparable) of prime degree p.


**Construction and proof.**

1. δ = N_{a/F} − N_{b/F} is annihilated by p: by T.4/transfer-base-change with F′ = E, res_{E/F} ∘ N_{a/F} and res_{E/F} ∘ N_{b/F} are the same sum over the F-automorphisms (with the inseparable multiplicity), so res_{E/F}∘δ = 0, and N_{a/F} ∘ res_{E/F} is multiplication by p (T.4/restriction-transfer-degree).
2. If δ(x) ≠ 0 it stays nonzero in K^M_n(F′) for the prime-to-p closure F′ of F (T.4/prime-to-p-closure), and δ is compatible with the base change to F′ (T.4/transfer-base-change; EF′/F′ is again of degree p).
3. Over F′, K^M_n(EF′) is generated by symbols {y, x_2, …, x_n} with x_i ∈ F′^× (T.4/p-closed-generation), and the projection formula (T.4/milnor-projection-formula) gives N{y, x_2, …} = {N(y), x_2, …} with N(y) the field norm (T.4/transfer-low-degrees), which does not depend on the generator; so δ vanishes over F′, a contradiction.

**Acceptance.**

- In degree one it is the independence of the field norm from the generator.
- In degree zero both transfers are multiplication by p.
- It is the base case of Kato's induction over maximal towers.


**Prerequisites.**

- [`K2SymbolsBrauer:T.4/simple-transfer`](#node-k2symbolsbrauer-t-4-simple-transfer)
- [`K2SymbolsBrauer:T.4/transfer-low-degrees`](#node-k2symbolsbrauer-t-4-transfer-low-degrees)
- [`K2SymbolsBrauer:T.4/transfer-base-change`](#node-k2symbolsbrauer-t-4-transfer-base-change)
- [`K2SymbolsBrauer:T.4/prime-to-p-closure`](#node-k2symbolsbrauer-t-4-prime-to-p-closure)
- [`K2SymbolsBrauer:T.4/p-closed-generation`](#node-k2symbolsbrauer-t-4-p-closed-generation)
- [`K2SymbolsBrauer:T.4/milnor-projection-formula`](#node-k2symbolsbrauer-t-4-milnor-projection-formula)
- [`K2SymbolsBrauer:T.4/restriction-transfer-degree`](#node-k2symbolsbrauer-t-4-restriction-transfer-degree)


**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.7.6.2, Lemma 7.6.2 (PDF p. 257; book p. 249).
  Excerpt: “Lemma 7.6.2. (Kato) If E is a normal extension of F, and [E : F] is a prime number p, then the map NE/F = Na/F : K^M_∗(E) → K^M_∗(F) does not depend upon the choice of a such that E = F(a).”
  Use: The statement.
- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.7.6.2, proof of Lemma 7.6.2 (PDF p. 257; book p. 249).
  Excerpt: “Proof. If also E = F(b), then from Corollary 7.5.3 and Ex. 7.7 with F′ = E we see that δ(x) = Na/F(x) − Nb/F(x) is annihilated by p.”
  Use: The first step of the proof.

<a id="node-k2symbolsbrauer-t-4-prime-degree-residue-on-generated-symbols"></a>
### The four residue cases on a symbol with base-field entries

`K2SymbolsBrauer:T.4/prime-degree-residue-on-generated-symbols` · lemma · implementation unchecked

For complete discretely valued F, normal E/F of prime degree p and α={a′,a₂,…,a_n} with a′∈E× and a_i∈F× for i≥2, one has ∂_F N_E/F α=N_l/k ∂_E α. The residue fields may be inseparable.

**Hypotheses.**

- n>0; F complete; [E:F]=p and E/F normal; all but the first entry come from F.


**Construction and proof.**

1. For n=1 this is the determinant valuation identity ord_F N(y)=f ord_E(y), since the residue norm on K₀^M is multiplication by f. For n≥2 reduce all entries after a₂ to units by multilinearity, skew symmetry and {a,−a}=0; only the first two entries can remain uniformizers, giving the four cases below.
2. For n=1 use ord_F N(y)=f ord_E(y). For n>1 use multilinearity, skew commutativity and {π,π}={π,−1} to make a₃,…,a_n units, and reduce a′ and a₂ separately to a unit or a uniformizer. Projection gives Nα={N(a′),a₂,…,a_n}. Compute first in the uniformizer-FIRST convention of GS Lemma 7.3.10; multiply both outputs by (−1)^(n−1) to recover this packet’s convention.
3. Both units: both residues are zero, since the norm of a unit is a unit. First uniformizer and a₂ unit: ord_F N(π′)=f and restriction fixes the base-unit residues, so both outputs are f{ā₂,…,ā_n}.
4. First unit and a₂=π: write π=u′(π′)^e. The upper residue is −e{ā′,ā₃,…}, its residue norm is −e{N_l/k(ā′),ā₃,…}; the lower residue is −{res N(a′),ā₃,…}. The determinant filtration identity res N(a′)=N_l/k(ā′)^e identifies them.
5. Both uniformizers: π=u′(π′)^e and N(π′)=uπ^f. The upper residue followed by norm is {(−1)^(ef)N_l/k(ū′),ā₃,…}; the lower is {(−1)^f ū⁻¹,ā₃,…}. Since ef=p, either e=1,f=p, where choose π′=π and u′=u=1, or e=p,f=1. In the latter choose π as the constant term of the Eisenstein minimal polynomial of π′, so u=(−1)^p and ū′=−1. The two expressions agree in both cases.
6. The norm identities have explicit source-backed supplier contracts: length_R(S/yS)=f ord_E y for the valuation, and the e-step π′-adic filtration of S/πS for the residue of a unit. They apply without finite residue fields; the requested upstream extension is stated honestly.

**Acceptance.**

- The both-uniformizers case retains the sign and unit correction; it is not covered by the units-only calculation.
- At n=2 the final residue is the roadmap tame symbol, obtained by negating the GS residue.


**Prerequisites.**

- [`K2SymbolsBrauer:T.4/milnor-projection-formula`](#node-k2symbolsbrauer-t-4-milnor-projection-formula)
- [`K2SymbolsBrauer:T.4/transfer-low-degrees`](#node-k2symbolsbrauer-t-4-transfer-low-degrees)
- [`K2SymbolsBrauer:T.3/milnor-residue-product-formula`](#node-k2symbolsbrauer-t-3-milnor-residue-product-formula)
- `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-3-ramification-the-tame-and-wild-cases-and-the-filtration`


**Sources.**

- [GilleSzamuely.2006](https://www.math.ens.psl.eu/~benoist/refs/Gille-Szamuely.pdf), Lemma 7.3.10, pp. 200–201; Appendix A.6.8(2), p. 313.
  Excerpt: “The compatibility of the proposition holds for symbols”
  Use: The four cases, including both uniformizers and the Eisenstein constant-term normalization.

<a id="node-k2symbolsbrauer-t-4-kato-complete-residue"></a>
### Residues commute with the transfer over a complete field (Corollary III.7.6.3)

`K2SymbolsBrauer:T.4/kato-complete-residue` · lemma · implementation unchecked

Let F be complete for a discrete valuation v with residue field k_v, E/F normal of prime degree p, and w the unique extension of v to E, with residue field k_w. Then ∂_v ∘ N_{E/F} = N_{k_w/k_v} ∘ ∂_w on K^M_n(E), where N_{E/F} is well defined by T.4/kato-prime-degree and N_{k_w/k_v} is the identity if k_w = k_v and otherwise the transfer of the normal extension k_w/k_v of degree p.

**Hypotheses.**

- F complete for v; E/F normal of prime degree p; residues normalised as in T.3/higher-milnor-residues.


**Construction and proof.**

1. Set δ=∂_F N(α)−N_l/k ∂_E α in K_(n−1)^M(k). Base-change to E: for a separable normal degree-p extension E⊗_F E is p copies of E; for a purely inseparable extension it is a local algebra of length p with residue E. Transfer-base-change and residue ramification show pδ=0 in the unramified case and p²δ=0 in the ramified or purely inseparable case (GS Proposition 7.3.9). The length p is retained in the inseparable case.
2. Use p-closed-generation over F^(p) to express the restriction of α as a finite sum of symbols with all but one entry in F^(p). The expressions, Steinberg relations and tower data involve finitely many elements, so descend to finite F′/F of degree d prime to p. E′=EF′ still has degree p and is normal over F′. F′ and E′ are complete DISCRETE valuation fields. Apply prime-degree-residue-on-generated-symbols termwise at this finite stage; do not put a normalized discrete valuation on the infinite F^(p).
3. If r=e(F′/F), k′ is its residue field and f′=[k′:k], the base-change/ramification squares give r·res_k′/k δ=0 (the relative indices for E′/E and F′/F agree, since the prime-degree extension is disjoint from F′). Apply the residue transfer: r f′ δ=dδ=0. Both r and f′ divide d and are prime to p; no ramification factor is canceled in a torsion group. Combine dδ=0 and p²δ=0 by Bézout to get δ=0.

**Acceptance.**

- In degree one it is v(N_{E/F}(y)) = f·w(y), with f = [k_w : k_v].
- For E/F unramified and n = 2 it says that the tame symbol of a norm is the norm of the tame symbol.
- Completeness is used: for a field that is not complete there may be several places above v, and the formula becomes the sum of T.4/constant-extension-residue or of T.3/transfer-and-norm-residue.


**Prerequisites.**

- [`K2SymbolsBrauer:T.4/kato-prime-degree`](#node-k2symbolsbrauer-t-4-kato-prime-degree)
- [`K2SymbolsBrauer:T.4/p-closed-generation`](#node-k2symbolsbrauer-t-4-p-closed-generation)
- [`K2SymbolsBrauer:T.4/prime-to-p-closure`](#node-k2symbolsbrauer-t-4-prime-to-p-closure)
- [`K2SymbolsBrauer:T.4/transfer-base-change`](#node-k2symbolsbrauer-t-4-transfer-base-change)
- [`K2SymbolsBrauer:T.4/transfer-low-degrees`](#node-k2symbolsbrauer-t-4-transfer-low-degrees)
- [`K2SymbolsBrauer:T.3/higher-ramification-formula`](#node-k2symbolsbrauer-t-3-higher-ramification-formula)
- [`K2SymbolsBrauer:T.3/higher-milnor-residues`](#node-k2symbolsbrauer-t-3-higher-milnor-residues)
- [`K2SymbolsBrauer:T.4/milnor-projection-formula`](#node-k2symbolsbrauer-t-4-milnor-projection-formula)
- [`K2SymbolsBrauer:T.3/milnor-residue-product-formula`](#node-k2symbolsbrauer-t-3-milnor-residue-product-formula)
- [`K2SymbolsBrauer:T.4/prime-degree-residue-on-generated-symbols`](#node-k2symbolsbrauer-t-4-prime-degree-residue-on-generated-symbols)


**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.7.6.3, Corollary 7.6.3 (PDF p. 257; book p. 249).
  Excerpt: “Corollary 7.6.3. If in addition F is a complete discrete valuation field with residue field kv, and the residue field of E is kw, the following diagram commutes.”
  Use: The statement (the diagram ∂_v ∘ N = N ∘ ∂_w).
- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.7.6.3, proof of Corollary 7.6.3 (PDF p. 257; book p. 249).
  Excerpt: “By Ex. 7.7 and Ex. 7.8 it suffices to prove that Nkw/kv∂w(u) = ∂v(NEF′/F′u) for every element u of this form. But this is an easy computation.”
  Use: The reduction and the computation, as the source gives them.
- [GilleSzamuely.2006](https://www.math.ens.psl.eu/~benoist/refs/Gille-Szamuely.pdf), Proposition 7.3.9, pp. 199–202.
  Excerpt: “commutes”
  Use: Finite descent of the generated-symbol expression, p/p² annihilation and prime-to-p detection. Ramification factors are displayed rather than treating the infinite algebraic closure as discrete.

<a id="node-k2symbolsbrauer-t-4-constant-extension-residue"></a>
### The norm-residue formula for a constant extension of prime degree (Exercise III.7.9)

`K2SymbolsBrauer:T.4/constant-extension-residue` · lemma · implementation unchecked

Let E/F be normal of prime degree p and v a place of F(t) trivial on F. Then ∂_v ∘ N_{E(t)/F(t)} = Σ_{w|v} N_{E(w)/F(v)} ∘ ∂_w on K^M_{n+1}E(t), the sum over the places w of E(t) above v; N_{E(t)/F(t)} and the residue-field transfers are well defined by T.4/kato-prime-degree, each extension involved being normal of degree 1 or p.

**Hypotheses.**

- E/F normal of prime degree p; v a place of F(t) trivial on F.


**Construction and proof.**

1. ∂_v factors through the completion F(t)_v and each ∂_w through E(t)_w: residues are computed from unit parts and uniformisers, which the completion preserves.
2. Base change N_{a/F(t)} (E = F(a)) to F′ = F(t)_v by T.4/transfer-base-change: the minimal polynomial of a factors over F(t)_v as ∏ π_i^{e_i}, the factors corresponding to the places w above v with E(t)_w = F(t)_v(a_i).
3. Apply T.4/kato-complete-residue to each F(t)_v(a_i)/F(t)_v and sum.
4. The correspondence between the places above v and the irreducible factors of the minimal polynomial over the completion is the standard description of the extensions of a complete valuation; it is used here and is to be located in the pinned libraries or proved with this node.

**Acceptance.**

- In degree zero (n + 1 = 1) it is v(N_{E(t)/F(t)}(y)) = Σ_{w|v} f(w|v)·w(y).
- If v is inert (a single w with [E(w) : F(v)] = p) it is the complete formula without completion.
- For v = ∞ it gives ∂_∞ ∘ N_{E(t)/F(t)} = N_{E/F} ∘ ∂_∞, the identity used in Proposition III.7.6.4.


**Prerequisites.**

- [`K2SymbolsBrauer:T.4/transfer-base-change`](#node-k2symbolsbrauer-t-4-transfer-base-change)
- [`K2SymbolsBrauer:T.4/kato-complete-residue`](#node-k2symbolsbrauer-t-4-kato-complete-residue)
- [`K2SymbolsBrauer:T.4/kato-prime-degree`](#node-k2symbolsbrauer-t-4-kato-prime-degree)
- [`K2SymbolsBrauer:T.3/higher-milnor-residues`](#node-k2symbolsbrauer-t-3-higher-milnor-residues)
- `tauceti:TauCeti.Place.restrict`
- `tauceti:TauCeti.Place.finite_setOf_restrict_eq`


**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III, Exercise 7.9 (PDF p. 266; book p. 258).
  Excerpt: “7.9. If E/F is a normal extension of prime degree p, and v is a valuation on F(t) trivial on F, show that ∂vNE(t)/F(t) = Σw NE(w)/F(v)∂w, where the sum is over all the valuations w of E(t) over v. Hint: If F(t)v and E(t)w denote the completions of F(t) and E(t) at v and w, respectively, use Ex. 7.7”
  Use: The exercise and its hint, which the node follows.

<a id="node-k2symbolsbrauer-t-4-kato-commuting-square"></a>
### Kato's commuting square (Proposition III.7.6.4)

`K2SymbolsBrauer:T.4/kato-commuting-square` · lemma · implementation unchecked

Let E/F be normal of prime degree p, F′ = F(a) finite and E′ = E(a). Then N_{E/F} ∘ N_{a/E} = N_{a/F} ∘ N_{E′/F′} on K^M_*(E′), the norms N_{E/F} and N_{E′/F′} being well defined by T.4/kato-prime-degree.

**Hypotheses.**

- E/F normal of prime degree p; F′ = F(a) a finite simple extension.


**Construction and proof.**

1. Let π′ ∈ E[t] be the minimal polynomial of a over E; for x ∈ K^M_n(E′) choose y ∈ K^M_{n+1}E(t) with ∂_{π′}(y) = x and no other finite residue, so that N_{a/E}(x) = −∂_∞(y).
2. By T.4/constant-extension-residue, ∂_v(N_{E(t)/F(t)} y) is N_{E′/F′}(x) at v = v_π, N_{E/F}(∂_∞ y) at v = ∞ and 0 elsewhere.
3. Two applications of the computation formula of T.4/simple-transfer give N_{a/F}(N_{E′/F′}x) = −∂_∞(N_{E(t)/F(t)}y) = −N_{E/F}(∂_∞ y) = N_{E/F}(N_{a/E}x); the source prints the last term as N_{E/F}(N_{a/F}x), which the author's errata list corrects.

**Acceptance.**

- In degree one both sides are the field norm N_{E′/F}.
- If a ∈ F both sides reduce to N_{E/F}.
- In degree zero both sides are multiplication by [E′ : F].


**Prerequisites.**

- [`K2SymbolsBrauer:T.4/kato-prime-degree`](#node-k2symbolsbrauer-t-4-kato-prime-degree)
- [`K2SymbolsBrauer:T.4/constant-extension-residue`](#node-k2symbolsbrauer-t-4-constant-extension-residue)
- [`K2SymbolsBrauer:T.4/simple-transfer`](#node-k2symbolsbrauer-t-4-simple-transfer)


**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.7.6.4, Proposition 7.6.4 (PDF p. 258; book p. 250).
  Excerpt: “Proposition 7.6.4. (Kato) Let E and F′ = F(a) be extensions of F with E/F normal of prime degree p. If E′ = E(a) denotes the composite field, the following diagram commutes.”
  Use: The statement.
- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.7.6.4, proof of Proposition 7.6.4 (PDF p. 258; book p. 250).
  Excerpt: “Two applications of Definition 7.5 give the desired calculation: Na/F(NE′/F′x) = −∂∞(NE(t)/F(t)y) = −NE/F(∂∞y) = NE/F(Na/F x).”
  Use: The final computation, whose last term is corrected in the author's errata list (p. 272 of the published edition).

<a id="node-k2symbolsbrauer-t-4-milnor-transfer-transitivity"></a>
### Milnor norms of finite extensions and Kato's transitivity theorem

`K2SymbolsBrauer:T.4/milnor-transfer-transitivity` · theorem · implementation unchecked

Planet: **Kato's theorem on Milnor norms**.

For a finite extension E = F(a_1, …, a_r), the composite N_{a_1/F} ∘ N_{a_2/F(a_1)} ∘ ⋯ ∘ N_{a_r/F(a_1, …, a_{r−1})} of the simple transfers of T.4/simple-transfer (Definition III.7.6) does not depend on the choice of generators (Kato). Hence the Milnor norm N_{E/F} : K^M_*(E) → K^M_*(F) is well defined, N_{E/F} = N_{F′/F} ∘ N_{E/F′} for every intermediate field F′, it is multiplication by [E : F] in degree zero and Algebra.norm F in degree one, and for a simple extension N_{E/F} = N_{a/F} for every generator a.

**Hypotheses.**

- E/F is a finite field extension.


**Construction and proof.**

1. Define the composite along a chain of generators (Definition III.7.6).
2. The indeterminacy is annihilated by [E : F]: compare after restriction to E (T.4/transfer-base-change with F′ = E) and use restriction followed by transfer (T.4/simple-transfer). By T.4/prime-to-p-closure it therefore suffices, for each prime p, to prove independence when every finite extension of F has p-power degree.
3. For such F every extension of degree p is normal (a subgroup of index p in a p-group is normal), so the steps of a maximal tower (all of degree p) have well-defined transfers by T.4/kato-prime-degree.
4. Two maximal towers with different first steps F_1 ≠ F′ are compared by T.4/kato-commuting-square (with E = F′F_1); induction on [E : F] gives independence of the maximal tower.
5. A simple step F ⊂ F′ = F(a) refined by a maximal tower F ⊂ F_1 ⊂ F′ satisfies N_{a/F} = N_{F_1/F} ∘ N_{F′/F_1}: this is T.4/kato-commuting-square with E = F_1 and E′ = F′.
6. Degree one: each simple step is Algebra.norm (T.4/transfer-low-degrees), and the composite is Algebra.norm by the pinned transitivity Algebra.norm_norm.

**Acceptance.**

- In degree one N_{E/F} is Algebra.norm F and transitivity is the pinned Algebra.norm_norm.
- For a simple extension N_{E/F} = N_{a/F} for every generator a, which is not part of the definition of T.4/simple-transfer.
- Independence is a theorem: the reduction to towers of prime degree and the comparison of two towers are its substance.
- Kato's independence of the chain of generators is stated here, not assumed; MotivicEtaleKTheory M.4 imports the norm with this independence (edge T.4 → M.4).


**Prerequisites.**

- [`K2SymbolsBrauer:T.4/simple-transfer`](#node-k2symbolsbrauer-t-4-simple-transfer)
- [`K2SymbolsBrauer:T.4/prime-to-p-closure`](#node-k2symbolsbrauer-t-4-prime-to-p-closure)
- [`K2SymbolsBrauer:T.4/kato-prime-degree`](#node-k2symbolsbrauer-t-4-kato-prime-degree)
- [`K2SymbolsBrauer:T.4/kato-commuting-square`](#node-k2symbolsbrauer-t-4-kato-commuting-square)
- [`K2SymbolsBrauer:T.4/transfer-base-change`](#node-k2symbolsbrauer-t-4-transfer-base-change)
- [`K2SymbolsBrauer:T.4/transfer-low-degrees`](#node-k2symbolsbrauer-t-4-transfer-low-degrees)
- `mathlib:Algebra.norm_norm`


**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.7.6, Definition 7.6 (PDF p. 257; book p. 249).
  Excerpt: “Definition 7.6. Let E = F(a1, . . . , ar) be a finite field extension of F. The transfer map NE/F : K^M_∗(E) → K^M_∗(F) is defined to be the composition of the transfer maps defined in 7.5”
  Use: The definition by composition along generators.
- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.7.6.1, Theorem 7.6.1 (PDF p. 257; book p. 249).
  Excerpt: “Theorem 7.6.1. (Kato) The transfer map NE/F is independent of the choice of elements a1, . . . , ar such that E = F(a1, . . . , ar). In particular, if F ⊂ F′ ⊂ E then NE/F = NF′/F NE/F′.”
  Use: Kato's theorem.
- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.7.6.1, proof of Theorem 7.6.1 (PDF p. 258; book p. 250).
  Excerpt: “Using the key trick of passing to a larger field, we may assume that the degree of every finite extension of F is a power of a fixed prime p. Let us call a tower of intermediate fields F = F0 ⊂ F1 ⊂ · · · ⊂ Fr = E maximal if [Fi : Fi−1] = p for all i.”
  Use: The reduction to towers of degree-p steps.

<a id="node-k2symbolsbrauer-t-4-complete-norm-residue"></a>
### The all-degree norm–residue square for a complete discretely valued field

`K2SymbolsBrauer:T.4/complete-norm-residue` · theorem · implementation unchecked

For a complete discretely valued field F and any finite E/F, with residue fields k and l, ∂_F N_E/F=N_l/k ∂_E on K_n^M(E), n>0, without separability or residue-field perfectness.

**Hypotheses.**

- F is complete for its normalized discrete valuation; E/F is finite; residues use the uniformizer-last convention.


**Construction and proof.**

1. Factor E/F through the maximal separable subextension. The purely inseparable branch is a finite tower of radical extensions of prime degree equal to char F; kato-complete-residue and norm transitivity handle every step.
2. For the separable branch fix a prime p. Over F^(p), E⊗_F F^(p) splits as a product of finite fields L_i of p-power degree, each admitting a tower of normal degree-p extensions (GS Lemma 7.3.7). Descend the finite list of polynomial coefficients, idempotents, generators and normality witnesses to finite F′/F inside F^(p). Irreducibility over F^(p) implies irreducibility at the finite stage; normality witnesses can be included there. Thus E⊗_F F′ is a product of fields E_i, each with a normal degree-p tower over F′. The degree d=[F′:F] is prime to p.
3. Every field at this finite stage is complete for a discrete valuation. Apply kato-complete-residue along each normal-prime-degree tower and use transitivity to prove the square for each E_i/F′. Infinite F^(p) is used only to find the finite algebraic data, never as a discrete or complete valuation field.
4. For δ=∂_F N(α)−N_l/k ∂_E α, transfer-base-change plus higher-ramification-formula gives r·res_k′/k δ=0, with r=e(F′/F). Transfer back on residue fields gives r[k′:k]δ=dδ=0. Both sides of the base-change identity are sums over the E_i, including their residue base-change multiplicities; equality is obtained componentwise from the preceding step (GS Proposition 7.4.1, using the diagrams of Proposition 7.3.9). For finite complete-DVR base change F′/F, put r=e(F′/F), k′ its residue field, e=e(E/F), and E⊗F F′=∏ E_i with residue l_i. Write l⊗k k′=∏ A_j with residue L_j and length t_j. Let e_i=e(E_i/F′), e′_i=e(E_i/E), with i assigned to its residue component j. Then Σ_(i over j) e′_i [l_i:L_j]=r t_j. Proof: B=S⊗R R′ and its finite normalization C=∏S_i are full R′-lattices in the same algebra, with torsion quotient D. Reduction modulo π′ has equal composition multiplicities for B and C, since the finite-length kernel and cokernel of multiplication by π′ on D have equal multiplicities by length additivity. This is an elementary module-length argument, not a new Quillen G-theory construction. The e-step filtration of S/πS gives e t_j on B, while C gives Σ e_i [l_i:L_j]. Thus Σ e_i [l_i:L_j]=e t_j. Multiply by r and use r e_i=e e′_i; cancel the positive integer e in the LENGTH identity, not in a Milnor K-group. This establishes the displayed multiplicities. Combined with restriction-transfer degree in the residue fields, it proves the r·residue-base-change square used in complete-norm-residue without assuming that composita of residue fields exhaust l_i.
5. For every prime p an integer d prime to p annihilates δ. One such d shows δ has finite order; applying the detection to its prime divisors, or Bézout to finitely many d, gives δ=0. Switching from GS’s uniformizer-first residue to the packet’s uniformizer-last residue multiplies both sides by (−1)^(n−1).

**Acceptance.**

- n=1 gives ord_F N(y)=[l:k] ord_E(y).
- Purely inseparable residue extensions use Kato’s finite-extension norm, not a separable trace.


**Prerequisites.**

- [`K2SymbolsBrauer:T.4/kato-complete-residue`](#node-k2symbolsbrauer-t-4-kato-complete-residue)
- [`K2SymbolsBrauer:T.4/milnor-transfer-transitivity`](#node-k2symbolsbrauer-t-4-milnor-transfer-transitivity)
- [`K2SymbolsBrauer:T.4/prime-to-p-closure`](#node-k2symbolsbrauer-t-4-prime-to-p-closure)
- [`K2SymbolsBrauer:T.4/transfer-base-change`](#node-k2symbolsbrauer-t-4-transfer-base-change)
- [`K2SymbolsBrauer:T.3/higher-ramification-formula`](#node-k2symbolsbrauer-t-3-higher-ramification-formula)


**Sources.**

- [GilleSzamuely.2006](https://www.math.ens.psl.eu/~benoist/refs/Gille-Szamuely.pdf), Proposition 7.4.1, p. 204; Proposition 7.3.9, pp. 200–202.
  Excerpt: “commutes”
  Use: Complete arbitrary-extension square, with inseparable steps and prime-to-p descent. The henselian stages in the source reduction are explicitly distinguished from complete base fields.

<a id="node-k2symbolsbrauer-t-3-transfer-and-norm-residue"></a>
### The norm–residue formula for Milnor norms of a finite extension

`K2SymbolsBrauer:T.3/transfer-and-norm-residue` · theorem · implementation unchecked

Also realises `K2SymbolsBrauer:T.3:localization-comparison`.

Let E/F be a finite extension, v a discrete valuation on F with valuation ring R, and suppose the integral closure S of R in E is a finite R-module (equivalently Σ_{w|v} e_w f_w = [E : F]; automatic if E/F is separable or F is complete; for arbitrary K/F(t) it follows from AlgebraicCurves Layer 2’s finite-normalization milestone). Let w run over the valuations of E over v, with residue fields k_w ⊇ k_v (possibly inseparable over k_v). Then ∂_v ∘ N_{E/F} = Σ_{w|v} N_{k_w/k_v} ∘ ∂_w on K^M_n(E), with N_{E/F} and N_{k_w/k_v} the Milnor norms of T.4/milnor-transfer-transitivity (Kato's norms, defined for every finite extension, separable or not). In degree one this is ord_v(N_{E/F} x) = Σ_w f_w·ord_w(x); residue degrees enter through N_{k_w/k_v}, and the ramification indices do not appear (they enter only the restriction formula T.3/higher-ramification-formula). This is the general Milnor norm/residue square that RS-28 assigns to T.3:localization-comparison, stated for T.4's norms and parented in T.4 because T.4/weil-reciprocity uses it; its comparison with Quillen's transfer and the localisation boundary is T.3/milnor-quillen-transfer-comparison.

**Hypotheses.**

- E/F is a finite field extension and v a discrete valuation on F.
- The integral closure of the valuation ring of v in E is a finite module over it (Σ_w e_w f_w = [E : F]). Without it the formula fails: in degree one, for x = π ∈ F, it would read [E : F] = Σ_w e_w f_w.


**Construction and proof.**

1. Let R be the DVR and S its finite integral closure. Complete R and the finite module S. The semilocal completion splits by Chinese remaindering into the completions of S_w; inverting a uniformizer gives E⊗_F F̂≅∏_w Ê_w. Finite normalization is essential to this argument. Import the completion-decomposition contract (GS Appendix A.6.4 and Corollary 7.4.3), whose exact owner request is recorded; do not treat a name search for tensor-product completion as the splitting theorem.
2. Apply transfer-base-change to F̂/F: the algebra is a product of fields, so every Artinian multiplicity is 1. This gives res_F̂/F N_E/F=Σ_w N_Ê_w/F̂ res_Ê_w/E. Completion has ramification index 1 and identical residue field, so higher residues commute with these restriction maps.
3. Apply complete-norm-residue to each Ê_w/F̂ and add. The residue fields are the original k_w and k_v, and their transfer maps are Kato’s norms even when inseparable. This proves the whole all-degree square (GS Corollary 7.4.3, using the completion diagram of Corollary 7.3.11).
4. At n=1 the residue norm on K₀^M is multiplication by f_w, giving ord_v N(x)=Σ_w f_w ord_w(x). For a base uniformizer it reads [E:F]=Σ_w e_w f_w. Thus e_w is not an additional factor on the right-hand side in any degree; it belongs to restriction, not transfer.

**Acceptance.**

- Degree one: ord_v(N_{E/F}x) = Σ_w f_w ord_w(x), e.g. ℚ(i)/ℚ at 5: N(2 + i) = 5 and the two places over 5 give 1 + 0.
- For classes from F the formula combines with T.3/higher-ramification-formula and T.4/restriction-transfer-degree into [E : F] = Σ e_w f_w, the finiteness hypothesis.
- The formula is the same in both normalisations of the residue (each side changes by (−1)^{n−1}).


**Prerequisites.**

- [`K2SymbolsBrauer:T.4/milnor-transfer-transitivity`](#node-k2symbolsbrauer-t-4-milnor-transfer-transitivity)
- [`K2SymbolsBrauer:T.4/kato-complete-residue`](#node-k2symbolsbrauer-t-4-kato-complete-residue)
- [`K2SymbolsBrauer:T.4/transfer-base-change`](#node-k2symbolsbrauer-t-4-transfer-base-change)
- [`K2SymbolsBrauer:T.4/restriction-transfer-degree`](#node-k2symbolsbrauer-t-4-restriction-transfer-degree)
- [`K2SymbolsBrauer:T.3/higher-milnor-residues`](#node-k2symbolsbrauer-t-3-higher-milnor-residues)
- `mathlib:Ideal.sum_ramification_inertia_eq_finrank`
- `mathlib:Ideal.relNorm_singleton`
- `mathlib:Algebra.norm`
- [`K2SymbolsBrauer:T.4/complete-norm-residue`](#node-k2symbolsbrauer-t-4-complete-norm-residue)


**Consumers.**

- T.4/weil-reciprocity — the reduction of reciprocity on a curve to the projective line pushes residues forward along k(X)/k(t)
- HigherLocalFieldsAndHigherClassFieldTheory HL.1 — norm–residue compatibility along a residue tower of complete fields
- T.5/unramified-subgroup — the transfer of a finite extension of number fields maps unramified classes to unramified classes
- T.3/milnor-quillen-transfer-comparison — in degree two it is compared with the norm–residue square of Quillen's transfer
- MotivicEtaleKTheory M.4 — Suslin's reciprocity law (T.4/weil-reciprocity), which the Nesterenko–Suslin/Totaro diagonal comparison uses, rests on it


**Suggested placement.** module: `TauCeti/Algebra/KTheory/TameSymbol`; namespace: `TauCeti.TameSymbol`.

**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), Ex. III.7.9 (PDF p. 266).
  Excerpt: “7.9. If E/F is a normal extension of prime degree p, and v is a valuation on F(t) trivial on F, show that ∂v NE(t)/F(t) = ∑w NE(w)/F(v) ∂w, where the sum is over all the valuations w of E(t) over v.”
  Use: The constant normal-prime-degree special case, a regression of the general GS theorem.
- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), Corollary III.7.6.3 (PDF p. 257).
  Excerpt: “Corollary 7.6.3. If in addition F is a complete discrete valuation field with residue field kv, and the residue field of E is kw, the following diagram commutes.”
  Use: The complete case for a normal extension of prime degree (node T.4/kato-complete-residue).
- [GilleSzamuely.2006](https://www.math.ens.psl.eu/~benoist/refs/Gille-Szamuely.pdf), Corollary 7.4.3, p. 205; Corollary 7.3.11, p. 202; Appendix A.6.4.
  Excerpt: “commutes”
  Use: General finite-integral-closure formula in every degree and its completion/base-change proof. The earlier K-book special cases are retained as checks, not cited as the full theorem.

<a id="node-k2symbolsbrauer-t-4-weil-reciprocity"></a>
### Suslin's reciprocity law: Weil reciprocity in every degree for a proper curve over any field

`K2SymbolsBrauer:T.4/weil-reciprocity` · theorem · implementation unchecked

Planet: **Weil–Suslin reciprocity**.

Let F be any field and K a function field of one variable over F (IsFunctionField F K), for instance the function field of a proper integral curve C over F. The places P of K/F are the closed points of the normalisation of C, which is the regular proper model of K/F (T.4/valuation-comparison, importing AlgebraicCurves Layer 12); it is regular but need not be smooth over F when F is imperfect, and each residue field k(P) is a finite extension of F, possibly inseparable. For x ∈ K^M_{n+1}(K) the residue ∂_P(x) vanishes at all but finitely many places P, and Σ_P N_{k(P)/F} ∂_P(x) = 0 in K^M_n(F), where ∂_P is the higher residue of T.3/higher-milnor-residues and N_{k(P)/F} is Kato's Milnor norm (T.4/milnor-transfer-transitivity), defined for every finite extension, separable or not. This is Suslin's reciprocity law in all degrees; its degree-two form with the roadmap's tame symbol and field norms is T.4/weil-reciprocity-symbol-form. It is stated over places (equivalently over the closed points of the regular model), never over the points of a possibly singular C and never under a smoothness hypothesis. MotivicEtaleKTheory M.4 imports it, with T.4's norms, for the Nesterenko–Suslin/Totaro comparison of Milnor K-theory with the diagonal higher Chow groups.

**Hypotheses.**

- F is a field, of any characteristic and not necessarily perfect, and K/F is a function field of one variable; residues are normalised as in T.3/higher-milnor-residues.
- The sum is over the places of K/F, the closed points of the regular proper model (the normalisation of any proper model); no smoothness over F is assumed, and the residue extensions k(P)/F may be inseparable.


**Construction and proof.**

1. Finite support: an element has nonzero order at finitely many places (pinned finite_setOf_ord_ne_zero), and the residue of a symbol of units vanishes (T.3/finite-support).
2. Choose t ∈ K transcendental over F, so that K/F(t) is finite; each place P of K lies over exactly one place v of F(t), and each fibre is finite (pinned restrict and finite_setOf_restrict_eq). When K/F is separably generated t can be chosen with K/F(t) separable; when it is not, which happens only over an imperfect F, K/F(t) is inseparable for every t.
3. Import finite normalization from AlgebraicCurves Layer 2, before its Layer 12 regular-model dictionary. For finite K/k(t), embed K in a finite normal hull M/k(t). In characteristic p, the maximal purely inseparable subextension P/k(t) has M/P separable (Stacks 032N, Fields 9.27.3); this is the pure-FIRST tower in the normal hull, not the generally unhelpful separable-first tower inside K. The pinned purely inseparable polynomial theorem makes the integral closure A′ of k[t] in P finite. It is normal Noetherian, and the separable trace/dual-basis argument (Stacks 032L, pinned IsIntegralClosure.finite) makes its integral closure B in M finite over A′. Integrality transitivity makes B the k[t]-normalization in M. The normalization in K is a k[t]-submodule of B, hence finite by Noetherianity. In characteristic zero use the separable theorem directly. Repeat for t⁻¹ and localize. This uses no perfection, smoothness, or false finiteness conclusion from Krull–Akizuki.
4. Apply transfer-and-norm-residue to K/F(t) at every base place. The normalization hypothesis has now been supplied in the mixed inseparable case too. Compose each residue norm with N_k(v)/F and use Kato transitivity to identify it with N_k(P)/F.
5. Sum and apply projective-line-reciprocity to N_K/F(t)(x). Finite support licenses regrouping by the finite fibers; this proves the statement over all places, then valuation-comparison transports it to closed points of the regular proper model.
6. GS Proposition 7.4.4 states the smooth-projective version. The extension to a regular proper model over an imperfect field is derived here from Corollary 7.4.3 and the source-backed finite-normalization contract; it is not attributed verbatim to 7.4.4. No Quillen comparison or downstream S.3 is used.

**Acceptance.**

- For K = F(t) it is T.4/projective-line-reciprocity.
- In degree one (n = 0) it says that a principal divisor has degree zero, Σ_P deg(P)·ord_P(f) = 0, the pinned Tau Ceti product formula TauCeti.Divisor.degree_principal.
- Inseparable residue fields occur and need Kato's norm: for F = 𝔽_p(s) and K = F(s^{1/p})(t), every place of K/F has residue field containing F(s^{1/p}), purely inseparable of degree p over F, and in degree one N_{F(s^{1/p})/F}(α) = α^p.
- Only finitely many terms are nonzero.
- Consumers: EllipticKTheory E.2 and EllipticRegulators use the degree-two form to construct and descend regulator classes; HigherLocalFields HL.6 uses the relation along a curve; MotivicEtaleKTheory M.4 uses it in every degree to kill the boundaries in the inverse of the diagonal cycle map (edge T.4 → M.4).
- Mixed test: k=F₃(s), K=k(s^(1/3))(u), t=u². K/k(t) has inseparable degree 3 and separable degree 2, hence total degree 6; normalization is k(s^(1/3))[u], finite over k[t]. This test is neither a separable extension nor a purely inseparable extension.


**Prerequisites.**

- [`K2SymbolsBrauer:T.4/projective-line-reciprocity`](#node-k2symbolsbrauer-t-4-projective-line-reciprocity)
- [`K2SymbolsBrauer:T.4/milnor-transfer-transitivity`](#node-k2symbolsbrauer-t-4-milnor-transfer-transitivity)
- [`K2SymbolsBrauer:T.3/transfer-and-norm-residue`](#node-k2symbolsbrauer-t-3-transfer-and-norm-residue)
- [`K2SymbolsBrauer:T.4/valuation-comparison`](#node-k2symbolsbrauer-t-4-valuation-comparison)
- [`K2SymbolsBrauer:T.3/finite-support`](#node-k2symbolsbrauer-t-3-finite-support)
- [`K2SymbolsBrauer:T.3/higher-milnor-residues`](#node-k2symbolsbrauer-t-3-higher-milnor-residues)
- `tauceti:TauCeti.Place.restrict`
- `tauceti:TauCeti.Place.finite_setOf_restrict_eq`
- `tauceti:TauCeti.Place.finite_setOf_ord_ne_zero`
- `tauceti:TauCeti.Place.sum_ramificationIdx_mul_relativeDegree_eq_finrank_of_isSeparable`
- `tauceti:TauCeti.IsIntegralClosure.finite_mvPolynomial_of_isPurelyInseparable`
- `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-2-affine-models--the-dedekind-bridge`


**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), V.6.12.1, Weil Reciprocity Formula 6.12.1 (PDF p. 424; book p. 416), proof on PDF p. 425.
  Excerpt: “Weil Reciprocity Formula 6.12.1. Let X be a projective curve over a field k, with function field F. For every a ∈ Kn+1(F) we have the following formula in Kn(k): Σx∈X Nk(x)/k ∂x(a) = 0.”
  Use: The curve formula in Quillen K-theory, proved by Gillet's argument; for n + 1 = 2 it is this node's statement, and in higher degrees the Milnor form is proved by the transfer argument of the proof steps.
- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), V.6.12, the paragraph before 6.12.1 (PDF p. 424; book p. 416).
  Excerpt: “The following result, due to Gillet, generalizes the Weil Reciprocity of III.6.5.3 for symbols {f, g} ∈ K2(F). We write ∂x for the component Kn+1(F) → Kn(x) of the map ∂ in 6.12.”
  Use: The source presents it as the generalisation of III.6.5.3.
- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.7.5.1, Weil Reciprocity Formula 7.5.1 (PDF p. 256; book p. 248).
  Excerpt: “If we let N∞ denote the identity map on K^M_n(F), and sum over the set of all discrete valuations on F(t) which are trivial on F, the definition of the Nv yields the: Weil Reciprocity Formula 7.5.1. Σv Nv∂v(x) = 0 for all x ∈ K^M_n F(t).”
  Use: The projective-line case in Milnor K-theory.
- [Weibel.KBook.III](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.III.pdf), III.7.6.1, Theorem 7.6.1 (p. 64).
  Excerpt: “Theorem 7.6.1 (Kato). The transfer map NE/F is independent of the choice of elements a1 , . . . , ar such that E = F (a1 , . . . , ar ). In particular, if F ⊂ F ′ ⊂ E then NE/F = NF ′ /F NE/F ′ .”
  Use: Kato's norm is defined for every finite extension E/F, with no separability hypothesis; the residue-field norms of the reciprocity law are these.
- [GilleSzamuely.2006](https://www.math.ens.psl.eu/~benoist/refs/Gille-Szamuely.pdf), Corollary 7.4.3 and Proposition 7.4.4, pp. 205–206.
  Excerpt: “commutes”
  Use: Valuation-level proof and its smooth-projective special case; regular/imperfect extension follows by the explicit imported normalization argument.
- [Stacks.Japanese](https://stacks.math.columbia.edu/tag/032N), Tags 032N, 032L and 032O.
  Excerpt: “finite”
  Use: Normal-hull pure-first reduction and finite normalization over a polynomial ring.

<a id="node-k2symbolsbrauer-t-4-weil-reciprocity-symbol-form"></a>
### Weil reciprocity for the tame symbol on a proper regular curve

`K2SymbolsBrauer:T.4/weil-reciprocity-symbol-form` · theorem · implementation unchecked

Let X be a proper regular integral curve over F with function field K, and f, g ∈ K^×. Then ∂_x{f, g} = 1 for all but finitely many closed points x, and ∏_{x ∈ X^{(1)}} N_{k(x)/F}(∂_x{f, g}) = 1 in F^×, where ∂_x is the roadmap's tame symbol (T.3/tame-symbol) at the discrete valuation of the local ring at x and N is the field norm. Equivalently, over the places P of K/F: ∏_P N_{k(P)/F}(∂_P{f, g}) = 1. The disjoint-support case f(div g) = g(div f), and its agreement with EllipticCurves Layer 2's milestone, is T.4/disjoint-support-reciprocity.

**Hypotheses.**

- X is integral, proper and regular of dimension one over F; f and g are nonzero rational functions.


**Construction and proof.**

1. Transport the product over X^{(1)} to the product over the places of K/F, with equal tame symbols, residue fields and norms (T.4/valuation-comparison).
2. Take n = 1 in T.4/weil-reciprocity: K^M_2(K) = K_2(K) by Matsumoto, and the degree-two residue is exactly the roadmap's tame symbol (uniformiser last), so the additive residue sum is this multiplicative product.
3. Identify N_{k(P)/F} in degree one with the field norm: along a chain of simple extensions each step is Algebra.norm (T.4/transfer-low-degrees) and the composite is Algebra.norm by the pinned transitivity; with the pinned normResidue each factor is the norm of a residue.

**Acceptance.**

- For X = ℙ¹ it is Weil's formula (f, g)_∞ · ∏_p N_p(f, g)_p = 1 of III.6.5.3.
- The sign (−1)^{v(f)v(g)} matters: on ℙ¹ over ℚ with f = t and g = t − 1 the factors are −1 at 0, 1 at 1 and −1 at ∞, with product 1; dropping the sign changes the factor at ∞, where v(f)v(g) = 1, and gives −1.
- Only finitely many factors differ from 1.
- Convention test over ℚ at 5: ∂{2,5} = 2 in 𝔽₅ˣ. Its inverse 3 is the K-book convention, not this node’s residue.


**Prerequisites.**

- [`K2SymbolsBrauer:T.4/weil-reciprocity`](#node-k2symbolsbrauer-t-4-weil-reciprocity)
- [`K2SymbolsBrauer:T.4/valuation-comparison`](#node-k2symbolsbrauer-t-4-valuation-comparison)
- [`K2SymbolsBrauer:T.4/transfer-low-degrees`](#node-k2symbolsbrauer-t-4-transfer-low-degrees)
- [`K2SymbolsBrauer:T.4/milnor-transfer-transitivity`](#node-k2symbolsbrauer-t-4-milnor-transfer-transitivity)
- [`K2SymbolsBrauer:T.3/tame-symbol`](#node-k2symbolsbrauer-t-3-tame-symbol)
- [`K2SymbolsBrauer:T.3/higher-milnor-residues`](#node-k2symbolsbrauer-t-3-higher-milnor-residues)
- `mathlib:Algebra.norm_norm`
- `tauceti:TauCeti.Place.normResidue`


**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), V.6.12, the paragraph before 6.12.1 (PDF p. 424; book p. 416).
  Excerpt: “The following result, due to Gillet, generalizes the Weil Reciprocity of III.6.5.3 for symbols {f, g} ∈ K2(F). We write ∂x for the component Kn+1(F) → Kn(x) of the map ∂ in 6.12.”
  Use: The source states the curve formula as the generalisation of III.6.5.3 for symbols {f, g} ∈ K_2(F): n = 1 in V.6.12.1.
- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.6.5.3, Weil Reciprocity Formula 6.5.3 (PDF p. 244; book p. 236).
  Excerpt: “The appropriate reciprocity formula first appeared in Weil’s 1940 paper on the Riemann Hypothesis for curves: (f, g)∞ · ∏p Np(f, g)p = 1 in F×. In Weil’s formula, ‘Np’ denotes the usual norm map (F[t]/p)× → F×.”
  Use: The projective-line case with field norms.

<a id="node-k2symbolsbrauer-t-4-disjoint-support-reciprocity"></a>
### Disjoint supports: f(div g) = g(div f), and EllipticCurves Layer 2's Weil reciprocity

`K2SymbolsBrauer:T.4/disjoint-support-reciprocity` · theorem · implementation unchecked

Let K be a function field of one variable over F and f, g ∈ K^× whose principal divisors (Tau Ceti's Divisor.principal) have disjoint supports. At a place P in the support of div g one has ord_P f = 0 and the roadmap's tame symbol is ∂_P{f, g} = f(P)^{ord_P g}; at a place P in the support of div f it is ∂_P{f, g} = g(P)^{−ord_P f}; elsewhere it is 1 (T.3/tame-symbol; the sign (−1)^{ord_P f · ord_P g} is 1 on both supports). Applying the residue-field norms N_{k(P)/F} and taking the product, T.4/weil-reciprocity-symbol-form becomes f(div g)·g(div f)^{−1} = 1, that is f(div g) = g(div f) for Tau Ceti's evaluation Divisor.eval, whose local factors are the norms N_{k(P)/F}(f(P)). In particular, for an elliptic curve — a Weierstrass curve W over F with W.IsElliptic, K = W.FunctionField, a function field of one variable by WeierstrassCurve.Affine.isFunctionField — this is the milestone 'Weil reciprocity f(div g) = g(div f)' of EllipticCurves Layer 2, a prerequisite of its divisor construction of the Weil pairing: that milestone is the disjoint-support, degree-two special case of T.4's theorem, stated with the same evaluation and the same principal divisors, and the two must be stated compatibly. The general theorem, in every degree and for every function field of one variable, stays T.4's (T.4/weil-reciprocity); the elliptic statement is a special case, not a proof of reciprocity for other curves. In the K-book's normalisation every local factor is inverted (∂^{Wb}_P{f, g} = f(P)^{−ord_P g} on the support of div g) and the identity is unchanged.

**Hypotheses.**

- K/F is a function field of one variable and f, g ∈ K^× have principal divisors with disjoint supports.
- For the elliptic instance, W is a Weierstrass curve over F with W.IsElliptic and K = W.FunctionField; its places and divisors are those of Tau Ceti's function-field library, on which EllipticCurves Layer 0 builds.


**Construction and proof.**

1. Disjoint supports are admissibility: f is a unit at every place of div g and g at every place of div f (pinned TauCeti.Divisor.isUnitAtSupport_iff_disjoint).
2. Local factors: where ord_P f = 0 and ord_P g = m, ∂_P{f, g} = (−1)^0·(f^m/g^0)‾ = f(P)^m; where ord_P g = 0 and ord_P f = m′, it is (g^{−m′})‾ = g(P)^{−m′}; where both orders vanish it is 1 (T.3/tame-symbol).
3. Norms: N_{k(P)/F}(f(P)) is Tau Ceti's normResidue, and on an admissible divisor Divisor.eval is the product of these local norms raised to the coefficients (pinned TauCeti.Divisor.eval_eq_prod_normResidue); hence ∏_P N_{k(P)/F}(∂_P{f, g}) = Divisor.eval (div g) f · (Divisor.eval (div f) g)^{−1}.
4. Apply T.4/weil-reciprocity-symbol-form over the places of K/F.
5. Elliptic instance: WeierstrassCurve.Affine.isFunctionField makes W.FunctionField a function field of one variable over F, so the previous steps apply; EllipticCurves Layer 2's milestone is this statement for K = W.FunctionField, its points being the degree-one places (EllipticCurves Layer 0), while places of higher degree contribute through their residue-field norms.

**Acceptance.**

- On ℙ¹ over ℚ with f = t and g = (t − 1)/(t − 2): f(div g) = f(1)/f(2) = 1/2 and g(div f) = g(0)/g(∞) = (1/2)/1 = 1/2.
- On the elliptic curve y² = x³ − x over ℚ, f = x/(x − 2) and g = (x − 3)/(x − 5) have div f = 2(0, 0) − P₂ and div g = P₃ − P₅, where P_c is the inert place x = c of degree two (residue fields ℚ(√6), ℚ(√6), ℚ(√30) for c = 2, 3, 5). Then f(div g) = N(3)·N(5/3)^{−1} = 9·(9/25) = 81/25 and g(div f) = (3/5)²·N(1/3)^{−1} = (9/25)·9 = 81/25; without the residue-field norms the two sides would be 9/5 and 27/25.
- In the K-book's normalisation each local factor is inverted and the identity still holds.
- A special case, not the theorem: T.4/weil-reciprocity is the statement in every degree for every function field of one variable, and this node does not replace it.


**Prerequisites.**

- [`K2SymbolsBrauer:T.4/weil-reciprocity-symbol-form`](#node-k2symbolsbrauer-t-4-weil-reciprocity-symbol-form)
- [`K2SymbolsBrauer:T.3/tame-symbol`](#node-k2symbolsbrauer-t-3-tame-symbol)
- `tauceti:TauCeti.Divisor.eval`
- `tauceti:TauCeti.Divisor.eval_eq_prod_normResidue`
- `tauceti:TauCeti.Divisor.isUnitAtSupport_iff_disjoint`
- `tauceti:TauCeti.Divisor.principal`
- `tauceti:TauCeti.Place.normResidue`
- `tauceti:WeierstrassCurve.Affine.isFunctionField`


**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.6.5.3, Weil Reciprocity Formula 6.5.3 (PDF p. 244; book p. 236).
  Excerpt: “The appropriate reciprocity formula first appeared in Weil’s 1940 paper on the Riemann Hypothesis for curves: (f, g)∞ · ∏p Np(f, g)p = 1 in F×. In Weil’s formula, ‘Np’ denotes the usual norm map (F[t]/p)× → F×.”
  Use: The degree-two reciprocity with residue-field norms, of which this node is the disjoint-support case; EllipticCurves Layer 2's milestone is read in the atlas's stage text, not in this source.

<a id="stage-k2symbolsbrauer-t-3-localization-comparison"></a>
## T.3:localization-comparison — Ring localization and Quillen transfers

After T.4, compare the classical symbol with the DVR and Dedekind ring boundary, prove the Quillen norm–residue square and identify degree-two Milnor norms with Quillen transfers. GeneralAlgebraicKTheory K.3 supplies localization and transfer constructions and K.7 supplies products. SchemeKTheoryOperations S.3 and EllipticKTheory E.3 consume this normalization.

Coverage: **partial**.

**Remaining proof and supply obligations.**

- Apply the stage change of RT-AREA-ktheory-1/28: the edge T.4 → T.3:localization-comparison (the earlier proposal T.3:localization-comparison → T.4 is withdrawn, since together they form a cycle), and move the sentence 'Develop higher Milnor residues, specialisation with a uniformiser, and their product signs' with 'Prove finite support' to T.3:symbols' text, whose nodes realise them.
- The K.3 ring boundary, the arbitrary-field base change of transfers and the right module action are planned nodes of the GeneralAlgebraicKTheory K.1 packet (K.3/localization-degree-one-index, K.3/dvr-degree-one-boundary, K.3/finite-field-transfer-base-change, K.3/localization-product-boundary), not pinned declarations; the torsion Serre quotient (K.3) and the unit product (K.7) remain requests.


<a id="node-k2symbolsbrauer-t-3-localization-boundary"></a>
### Identification with the boundary of the localisation sequence

`K2SymbolsBrauer:T.3/localization-boundary` · comparison · implementation unchecked

Let R be a discrete valuation ring with fraction field F, residue field k and uniformiser π, and let ∂ : K_2(F) → K_1(k) = k^× be the boundary of the localisation sequence ⋯ → K_2(R) → K_2(F) → K_1(k) → K_1(R) → K_1(F) → K_0(k) → ⋯ (GeneralAlgebraicKTheory K.3: localisation for the torsion modules, dévissage, resolution). With the K-book's normalisation — ∂ right K_*(R)-linear, ∂(x·y) = ∂(x)·ȳ for y ∈ K_*(R) (GeneralAlgebraicKTheory K.3/localization-product-boundary, on K.7's products), and ∂[π] = [R/πR] = 1 ∈ K_0(k) — one has, on symbols (through K^M_2(F) → K_2(F)), ∂{f,g} = tameSymbol v g f = (tameSymbol v f g)^{−1}: the boundary is the K-book's tame symbol of Lemma III.6.3, the inverse of this roadmap's. With the left-linear normalisation ∂(y·x) = ȳ·∂(x) instead, ∂{f,g} = tameSymbol v f g. The node states both and fixes the sign here, not in the symbol formula. It builds no localisation sequence; SchemeKTheoryOperations S.3 and EllipticKTheory E.3 import this comparison (RS-18), and T.3/dedekind-localization-boundary extends it to a Dedekind domain, prime by prime.

**Hypotheses.**

- R is a discrete valuation ring with fraction field F, residue field k, uniformiser π and valuation v.
- The localisation sequence and the K_*(R)-module structure of its terms are those of GeneralAlgebraicKTheory K.3 and K.7, with the side of the action fixed.


**Construction and proof.**

1. Import the ring-level localisation boundary from GeneralAlgebraicKTheory K.3 with ∂₁[s]=[R/sR] for a non-zero-divisor s (K.3/localization-degree-one-index, whose DVR case K.3/dvr-degree-one-boundary gives ∂₁[π]=1). This is the cone/cokernel calculation for multiplication by s on R (K-book V.6.1.2), before any tame-symbol theorem. Dévissage sends [R/πR] to 1 in K₀(k)=ℤ, so ∂₁[π]=1; unit classes lift from K₁(R), hence have boundary zero. S.3 imports the comparison here and supplies none of these inputs.
2. Import the right K_*(R)-module action ∂(x·j*(y))=∂(x)·i*(y) from GeneralAlgebraicKTheory:K.3/localization-product-boundary, built on K.7's biexact pairing, and K.7's unit-product contract that the K₁×K₁ product equals the Steinberg symbol. Therefore ∂₂{π,u}=ū and ∂₂{u,π}=ū⁻¹ by skew symmetry. This is K-book V.6.6.1; a left-linear variant must be negated in degree two.
3. Write f=π^r u and g=π^s v, with u,v units. Bilinearity gives {f,g}={u,v}+r{π,v}+s{u,π}+rs{π,π}. The unit-unit symbol lifts from K₂(R), so its boundary is zero. The identity {π,π}={π,−1} gives boundary −1.
4. Thus ∂₂{f,g}=(−1)^{rs}·v̄^r·ū^(−s), the inverse of the roadmap tameSymbol v f g. In particular ∂₂{2,5}=3 in 𝔽₅× whereas tameSymbol 2 5=2. This expansion determines the boundary on all field symbols by Matsumoto, without defining the boundary by the desired tame formula.

**Acceptance.**

- With the K-book's normalisation, on ℤ_(5) ⊂ ℚ: ∂{5, 2} = 2 whereas tameSymbol 5 2 = 3; ∂{2, 5} = 3.
- ∂{π, π} = −1 in both normalisations.
- Degree one: ∂[f] = ord_v(f)·[k], the valuation; this normalisation is the upstream K.3 ring boundary contract.
- No second localisation sequence is built.
- The degree-one input is the K.3 ring cone/cokernel boundary (K.3/localization-degree-one-index and K.3/dvr-degree-one-boundary); the RIGHT module action is K.3/localization-product-boundary on K.7's products. Neither input is requested from downstream S.3.


**Prerequisites.**

- [`K2SymbolsBrauer:T.3/tame-symbol-hom`](#node-k2symbolsbrauer-t-3-tame-symbol-hom)
- [`K2SymbolsBrauer:T.2/matsumoto`](#node-k2symbolsbrauer-t-2-matsumoto)
- [`K2SymbolsBrauer:T.2/graded-map`](#node-k2symbolsbrauer-t-2-graded-map)
- `GeneralAlgebraicKTheory:K.3/dvr-degree-one-boundary`
- `GeneralAlgebraicKTheory:K.3/localization-degree-one-index`
- `GeneralAlgebraicKTheory:K.3/localization-product-boundary`
- `GeneralAlgebraicKTheory:K.7`


**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), V.6.6.1 (PDF p. 417).
  Excerpt: “We claim that ∂ is the tame symbol of III.6.3 and that the above continues the sequence of III.6.5.”
  Use: The source's claim that the localisation boundary is its tame symbol.
- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), V.6.6.1, proof (PDF p. 417).
  Excerpt: “In this case, we know that ∂ in K∗(R)-linear, so if u ∈ R× has image ū ∈ R/p then ∂{π, u} = [ū] in R/p×. Similarly, ∂ sends {π, π} = {π, −1} to {∂π, −1} = [R/π] · [−1], which is the class of the unit −1.”
  Use: The computation: with the K_*(R)-linearity the source uses (on the right, since ∂{π, u} = ∂(π)·[u]), the boundary is the K-book's tame symbol, the inverse of the roadmap's. ('∂ in K∗(R)-linear' is the source's 'is'.)
- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), Example V.6.1.2 (PDF p. 414).
  Excerpt: “Example 6.1.2. It is useful to observe that any s ∈ S determines an element [s] of K1(R[1/s]) and hence G1(R[1/s]), and that ∂(s) ∈ G0(R/sR) is [R/sR] − [I], where I = {r ∈ R : sr = 0}. This formula is immediate from Ex. 5.1. In particular, when R is a domain we have ∂(s) = [R/sR].”
  Use: The degree-one normalisation ∂[π] = [R/πR] used in the computation.

<a id="node-k2symbolsbrauer-t-3-dedekind-localization-boundary"></a>
### The localisation theorem for K₂ of a Dedekind domain: the boundary is the tame symbol at each prime

`K2SymbolsBrauer:T.3/dedekind-localization-boundary` · theorem · implementation unchecked

Planet: **Localisation theorem for K₂**.

Let R be a Dedekind domain with fraction field F and, for each nonzero prime 𝔭, residue field k(𝔭) = R/𝔭 and valuation v_𝔭. The finitely generated torsion R-modules form a Serre subcategory of the finitely generated R-modules with quotient the finite-dimensional F-vector spaces; Quillen's localisation theorem, dévissage (K_*(torsion modules) ≅ ⊕_𝔭 K_*(k(𝔭))) and resolution (R and F are regular) give the exact sequence ⊕_𝔭 K_2(k(𝔭)) → K_2(R) → K_2(F) −∂→ ⊕_𝔭 K_1(k(𝔭)) → K_1(R) → K_1(F), whose maps out of the residue-field terms are the transfers along R → k(𝔭). The 𝔭-component of ∂ is the boundary of the discrete valuation ring R_𝔭, so on symbols (Steinberg K_2(F) = Quillen K_2(F) by K2SymbolsBrauer:T.1/k2-pi2) ∂{f, g} = (tameSymbol v_𝔭 g f)_𝔭 = ((tameSymbol v_𝔭 f g)^{−1})_𝔭 in the K-book's right K_*(R)-linear normalisation, and (tameSymbol v_𝔭 f g)_𝔭 in the left-linear one (T.3/localization-boundary); the values lie in the direct sum by T.3/finite-support. Hence ker ∂ is the image of K_2(R) and coker ∂ ≅ ker(K_1(R) → K_1(F)). This is the K-book's Localization Theorem III.6.5, proved in V.6.6: the degree-two boundary comparison the stage text asks of this layer, which T.5 imports. It builds no sequence beyond GeneralAlgebraicKTheory K.3's.

**Hypotheses.**

- R is a Dedekind domain with fraction field F; 𝔭 runs over the nonzero primes of R.
- Localisation, dévissage, resolution and transfers are GeneralAlgebraicKTheory K.3's; the K_*(R)-module structure used in the discrete-valuation-ring comparison is K.7's (through T.3/localization-boundary).
- The sign is the one fixed in T.3/localization-boundary; kernels and cokernels do not depend on it.


**Construction and proof.**

1. The finitely generated S-torsion modules, S = R ∖ {0}, form a Serre subcategory of M(R) with quotient M(F) (K-book V.6.1, citing II.6.4.1); apply Quillen's localisation theorem for a Serre subcategory (GeneralAlgebraicKTheory:K.3/abelian-localization-theorem).
2. Dévissage (GeneralAlgebraicKTheory:K.3/devissage-theorem): a finitely generated torsion module has a finite filtration with quotients R/𝔭, so K_*(torsion modules) ≅ ⊕_𝔭 K_*(k(𝔭)); composed with the map to G_*(R) each summand is the transfer along R → k(𝔭) (GeneralAlgebraicKTheory:K.3/transfer-maps-and-projection-formula).
3. Resolution (GeneralAlgebraicKTheory:K.3/resolution-theorem): R, F and the k(𝔭) are regular, so G_* = K_*; this is the sequence (6.6) of K-book V.6.6, of which the displayed segment is (6.6.1).
4. Naturality along the flat map R → R_𝔭 gives a morphism of localisation sequences which is the identity on K_2(F) and the projection onto the 𝔭-summand on the residue terms (a torsion module localises to its 𝔭-primary part); so the 𝔭-component of ∂ is the boundary of R_𝔭 ⊂ F.
5. Apply T.3/localization-boundary to R_𝔭, whose residue field is k(𝔭) and whose valuation is v_𝔭; T.3/finite-support puts the sum in the direct sum.
6. Exactness at ⊕_𝔭 K_1(k(𝔭)) gives coker ∂ ≅ ker(K_1(R) → K_1(F)); identifying it with SK_1(R) through the determinant is KTheoryLowDegrees U.3's, and T.5 uses only U.4's statement that the map K_1(O_{F,S}) → K_1(F) is injective.

**Acceptance.**

- For R = ℤ the segment is ⊕_p K_2(𝔽_p) → K_2(ℤ) → K_2(ℚ) → ⊕_p 𝔽_p^× → K_1(ℤ) → K_1(ℚ); in the K-book's normalisation ∂{5, 2} has 5-component 2, where T.3's tameSymbol gives 3.
- For a discrete valuation ring (one prime) it is the degree-two part of the sequence in T.3/localization-boundary.
- coker ∂ is not zero in general: for the Dedekind domain ℝ[x, y]/(x² + y² − 1) it is the nonzero SK_1 of K-book Example III.1.5.4, although every tame symbol is onto.
- No second localisation sequence is built: ArithmeticKTheory N.2's all-degree Dedekind sequence restricts in degrees at most two to this one.


**Prerequisites.**

- [`K2SymbolsBrauer:T.3/localization-boundary`](#node-k2symbolsbrauer-t-3-localization-boundary)
- [`K2SymbolsBrauer:T.3/finite-support`](#node-k2symbolsbrauer-t-3-finite-support)
- [`K2SymbolsBrauer:T.1/k2-pi2`](#node-k2symbolsbrauer-t-1-k2-pi2)
- `GeneralAlgebraicKTheory:K.3/abelian-localization-theorem`
- `GeneralAlgebraicKTheory:K.3/devissage-theorem`
- `GeneralAlgebraicKTheory:K.3/resolution-theorem`
- `GeneralAlgebraicKTheory:K.3/transfer-maps-and-projection-formula`
- `mathlib:IsDedekindDomain.HeightOneSpectrum`
- `GeneralAlgebraicKTheory:K.3`


**Suggested placement.** module: `TauCeti/Algebra/KTheory/TameSymbol`; namespace: `TauCeti.TameSymbol`.

**Sources.**

- [Weibel.KBook.III](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.III.pdf), III.6.5, Localization Theorem 6.5 (p. 52).
  Excerpt: “The following result will be proven in chapter V, but we find it useful to quote this result now. If p is a nonzero prime ideal of a Dedekind domain R, the local ring Rp is a discrete valuation ring, and hence determines a tame symbol.”
  Use: The statement is quoted in chapter III and proved in chapter V; the local rings R_𝔭 give the tame symbols.
- [Weibel.KBook.V](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.V.pdf), V.6.6 (p. 41).
  Excerpt: “Hence the localization sequence of 6.1 with S = R − {0} becomes the long exact sequence:”
  Use: The Dedekind sequence as the localisation sequence of V.6.1 with S = R ∖ {0}, after resolution.
- [Weibel.KBook.V](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.V.pdf), V.6.6.1 and the claim after it (p. 41).
  Excerpt: “We claim that ∂ is the tame symbol of III.6.3 and that the above continues the sequence of III.6.5. Since the p-component of ∂ factors through the localization K2 (R) → K2 (Rp ) and the localization sequence for Rp , we may suppose that R is a DVR with parameter π.”
  Use: The reduction to the discrete valuation ring R_𝔭; the source's 'K2(R) → K2(Rp)' is read as the morphism of localisation sequences induced by R → R_𝔭, which is how the proof uses it.
- [Weibel.KBook.V](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.V.pdf), V.6.1 (p. 38).
  Excerpt: “We saw in II.6.4.1 that the category MS (R) of finitely generated S-torsion modules is a Serre subcategory of M(R) with quotient category M(S −1 R).”
  Use: The Serre quotient identification used in the first step.

<a id="node-k2symbolsbrauer-t-3-quillen-transfer-norm-residue"></a>
### Quillen transfers and the localisation boundary: the norm–residue square

`K2SymbolsBrauer:T.3/quillen-transfer-norm-residue` · theorem · implementation unchecked

Let R ⊆ R′ be Dedekind domains with R′ finitely generated as an R-module, F ⊆ F′ their fraction fields (so F′/F is finite), and for a nonzero prime 𝔭 of R let 𝔭′ run over the primes of R′ above 𝔭. The transfers of GeneralAlgebraicKTheory K.3 along R → R′, F → F′ and k(𝔭) → k(𝔭′) (restriction of scalars; R′ is finitely generated and torsion-free, hence projective, over R) form a morphism from the localisation sequence of T.3/dedekind-localization-boundary for R′ to that for R. In particular ∂_𝔭 ∘ N_{F′/F} = Σ_{𝔭′|𝔭} N_{k(𝔭′)/k(𝔭)} ∘ ∂_{𝔭′} on K_n(F′): residue degrees enter through the transfers of the residue extensions and no ramification index appears (ramification enters restriction, T.3/ramification-formula). In degree two, the boundaries being the inverse tame symbols and the K_1-transfer of a finite field extension the field norm, tameSymbol_{v_𝔭}(N_{F′/F} x) = ∏_{𝔭′|𝔭} N_{k(𝔭′)/k(𝔭)}(tameSymbol_{v_𝔭′} x) for x ∈ K_2(F′), with N_{F′/F} Quillen's transfer; the identity holds in both normalisations. Moreover, for a finite field extension E/F restriction followed by transfer is multiplication by [E : F] on K_n(F), the projection formula applied to the class [E] = [E : F] of K_0(F) = ℤ. The Milnor-side statements are T.4's (T.3/transfer-and-norm-residue, T.4/restriction-transfer-degree, T.4/milnor-projection-formula); their agreement with these is T.3/milnor-quillen-transfer-comparison.

**Hypotheses.**

- R ⊆ R′ are Dedekind domains, R′ is a finitely generated R-module, and F ⊆ F′ are their fraction fields.
- Transfers are those of GeneralAlgebraicKTheory:K.3/transfer-maps-and-projection-formula; for fields they are the finite transfers of the forgetful functor (K-book III.1.7.1 and III.5.6.3).


**Construction and proof.**

1. Restriction of scalars carries finitely generated torsion R′-modules, finitely generated R′-modules and F′-vector spaces to the corresponding R-objects; these exact functors commute with the inclusion of torsion modules and with localisation, giving the homotopy-commutative diagram of localisation fibrations (K-book V.(6.6.3)) and so the morphism of long exact sequences V.(6.6.4).
2. On the residue terms, after dévissage, restriction of scalars sends the simple module k(𝔭′) to the k(𝔭)-vector space k(𝔭′), of dimension f(𝔭′|𝔭); the induced map ⊕_{𝔭′} K_*(k(𝔭′)) → ⊕_𝔭 K_*(k(𝔭)) is therefore ⊕ N_{k(𝔭′)/k(𝔭)}, and no ramification index appears.
3. Degree two: combine with T.3/dedekind-localization-boundary for R and for R′ (boundaries = inverse tame symbols) and with the K-book's identification of the K_1-transfer of a finite field extension with the field norm (III.1.7.1 and the paragraph after it).
4. Restriction followed by transfer: by the projection formula of GeneralAlgebraicKTheory:K.3/transfer-maps-and-projection-formula, N(res(x)·1) = x·N(1) = x·[E], and [E] = [E : F] in K_0(F) = ℤ (K-book III.5.6.3 in degree two).

**Acceptance.**

- Degree one: ord_𝔭(N_{F′/F} y) = Σ_{𝔭′|𝔭} f(𝔭′|𝔭)·ord_{𝔭′}(y); for ℚ(i)/ℚ at the ramified prime 2, N(1 + i) = 2 has ord_2 = 1 = f·ord_{(1+i)}(1 + i) with f = 1, while a formula with the ramification index e = 2 would give 2.
- For x = res(y) with y ∈ K_2(F), with T.3/ramification-formula this gives tameSymbol_{v_𝔭}(y)^{Σ e f} = tameSymbol_{v_𝔭}(y)^{[F′:F]}, the fundamental identity.
- For fields, restriction followed by transfer on K_2 is multiplication by [E : F] (K-book III.5.6.3).
- The theorem concerns Quillen's transfer; T.4's Milnor norm is compared with it in T.3/milnor-quillen-transfer-comparison, not identified with it by definition.


**Prerequisites.**

- [`K2SymbolsBrauer:T.3/dedekind-localization-boundary`](#node-k2symbolsbrauer-t-3-dedekind-localization-boundary)
- `GeneralAlgebraicKTheory:K.3/transfer-maps-and-projection-formula`
- `GeneralAlgebraicKTheory:K.3/devissage-theorem`
- `GeneralAlgebraicKTheory:K.3/abelian-localization-theorem`
- `mathlib:Algebra.norm`


**Suggested placement.** module: `TauCeti/Algebra/KTheory/TameSymbol`; namespace: `TauCeti.TameSymbol`.

**Sources.**

- [Weibel.KBook.V](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.V.pdf), V.(6.6.3)-(6.6.4) (p. 42).
  Excerpt: “Suppose that R ⊂ R′ is an inclusion of Dedekind domains, with R′ finitely generated as an R-module. Then the fraction field F ′ of R′ is finite over F , so the exact functors M(R′ ) → M(R) and M(F ′ ) → M(F ) inducing the transfer maps (IV.6.3.3) are compatible.”
  Use: The compatibility of the transfers with the localisation sequences; the diagram (6.6.4) has the residue transfers N_{p′/p} as its third column.
- [Weibel.KBook.III](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.III.pdf), III.1.7.1 and the paragraph after it (p. 9).
  Excerpt: “When j : F → E is a finite field extension, it is easy to see from 1.1.2 that the transfer map j∗ : E × → F × is the classical norm map.”
  Use: The K_1-transfer of a finite field extension is the field norm.
- [Weibel.KBook.III](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.III.pdf), III.5.6.3 (p. 39).
  Excerpt: “If R is commutative, so that K2 (R) is a K0 (R)-module by Ex. 5.4, the composition f∗ f ∗ : K2 (R) → K2 (S) → K2 (R) is multiplication by [S] ∈ K0 (R). In particular, if S is free of rank n, then f∗ f ∗ is multiplication by n.”
  Use: Restriction followed by transfer in degree two.

<a id="node-k2symbolsbrauer-t-3-milnor-quillen-transfer-comparison"></a>
### T.4's Milnor norm is Quillen's transfer on K₂

`K2SymbolsBrauer:T.3/milnor-quillen-transfer-comparison` · comparison · implementation unchecked

For a finite field extension E/F, under Matsumoto's isomorphisms K^M_2(E) ≅ K_2(E), K^M_2(F) ≅ K_2(F) (K2SymbolsBrauer:T.2/matsumoto) and the identification of Steinberg with Quillen K_2 (K2SymbolsBrauer:T.1/k2-pi2), the Milnor norm N_{E/F} of T.4/milnor-transfer-transitivity corresponds to Quillen's transfer of GeneralAlgebraicKTheory K.3. Consequently, in degree two and under the boundary identification of T.3/dedekind-localization-boundary, the Milnor norm/residue formula T.3/transfer-and-norm-residue and the Quillen norm/residue square T.3/quillen-transfer-norm-residue are the same statement, as are T.4/restriction-transfer-degree and the restriction–transfer clause of T.3/quillen-transfer-norm-residue. This is the comparison of T.3:localization-comparison's 'transfer' clause: the Milnor norms are imported from T.4 and the K-theory transfers from GeneralAlgebraicKTheory K.3, and neither is constructed here. For arbitrary finite extensions the proof uses the common arbitrary-field base-change contract, prime-to-p detection and degree-p symbol generation; quadratic extensions are a separate regression, not the scope of the result.

**Hypotheses.**

- E/F is a finite field extension.
- The two norms are compared on K_2 = K^M_2 through Matsumoto's theorem; in degrees zero and one both are the degree and the field norm.


**Construction and proof.**

1. Transport Quillen transfer to Milnor K₂ through the natural Matsumoto and T.1/k2-pi2 isomorphisms. Both transfers are transitive, obey restriction–transfer degree, and have projection formula N{res(a),b}={a,N₁(b)}; their degree-one transfer is the field norm (K-book III.1.7.1, III Ex.5.6).
2. For each prime p choose F^(p)/F from prime-to-p-closure. Write E⊗_F F^(p)=∏ B_i with residue fields L_i and lengths r_i. Both base-change formulas have the same r_i, including nonreduced inseparable factors: T.4/transfer-base-change for Milnor and GeneralAlgebraicKTheory:K.3/finite-field-transfer-base-change for Quillen, an exact-functor and composition-series argument on finite vector spaces. The latter accepts arbitrary F^(p), not just separable or finite base extensions.
3. Each finite L_i/F^(p) has p-power degree and a tower of normal degree-p extensions (GS Lemma 7.3.7; a purely inseparable step is included). Intermediate fields still have no finite extensions of degree prime to p. In each degree-p step, p-closed-generation generates K₂ by {y,res(x)} with x in the base. Both transfers give {N₁(y),x} by the projection formula and skew symmetry, hence agree on the entire group. Transitivity gives agreement for L_i/F^(p).
4. For α∈K₂^M(E), let δ=N^M(α)−N^Q(α)∈K₂^M(F). The common base-change formula implies res_F^(p)/F δ=0. Prime-to-p-closure therefore supplies an integer d_p prime to p killing δ (finite descent in the Milnor symbol presentation plus restriction–transfer degree). Taking one prime first shows δ has finite order; for each prime divisor of that order, d_p shows its p-primary part is zero. Equivalently finitely many d_p have gcd 1, so Bézout gives δ=0.
5. Transport the degree-two residue and restriction–transfer statements along the comparison. No norm–residue square is used to prove transfer equality, so there is no dependency through the desired comparison itself. Quadratic case agrees with K-book III.6.1.5.

**Acceptance.**

- For ℂ/ℝ both norms send {r, e^{iθ}} to 1 and {r, s} to {r, s}² (K-book Example III.6.1.6 and Corollary III.6.1.5).
- In degree one both are the field norm: N(1 + i) = 2 for ℚ(i)/ℚ.
- The comparison is a theorem, not a definition: T.4's norm is defined through the Bass–Tate sequence, Quillen's through restriction of scalars.
- Nonreduced test: E=F_p(s^(1/p)), F=F_p(s), F′=E gives E⊗_F E≅E[ε]/(ε^p), one residue field E and length p. Both base-change formulas read res∘N=p·id, not id.
- A nonquadratic test uses a degree-three extension over a 3-closed field and the symbols {y,x} with x in the base; a quadratic-only proof fails this case.


**Prerequisites.**

- [`K2SymbolsBrauer:T.4/milnor-transfer-transitivity`](#node-k2symbolsbrauer-t-4-milnor-transfer-transitivity)
- [`K2SymbolsBrauer:T.4/milnor-projection-formula`](#node-k2symbolsbrauer-t-4-milnor-projection-formula)
- [`K2SymbolsBrauer:T.4/prime-to-p-closure`](#node-k2symbolsbrauer-t-4-prime-to-p-closure)
- [`K2SymbolsBrauer:T.4/p-closed-generation`](#node-k2symbolsbrauer-t-4-p-closed-generation)
- [`K2SymbolsBrauer:T.4/degree-reduction`](#node-k2symbolsbrauer-t-4-degree-reduction)
- [`K2SymbolsBrauer:T.2/matsumoto`](#node-k2symbolsbrauer-t-2-matsumoto)
- [`K2SymbolsBrauer:T.1/k2-pi2`](#node-k2symbolsbrauer-t-1-k2-pi2)
- `GeneralAlgebraicKTheory:K.3/transfer-maps-and-projection-formula`
- [`K2SymbolsBrauer:T.4/transfer-base-change`](#node-k2symbolsbrauer-t-4-transfer-base-change)
- [`K2SymbolsBrauer:T.4/restriction-transfer-degree`](#node-k2symbolsbrauer-t-4-restriction-transfer-degree)
- `GeneralAlgebraicKTheory:K.3/finite-field-transfer-base-change`


**Sources.**

- [Weibel.KBook.III](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.III.pdf), III.6.1.5, Corollary 6.1.5 (p. 49).
  Excerpt: “Corollary 6.1.5. If E = F (u) is a quadratic field extension of F , then K2 (E) is generated by elements coming from K2 (F ), together with elements of the form {c, u − d}. Thus the transfer map NE/F : K2 (E) → K2 (F ) is completely determined by the formulas”
  Use: The quadratic case: the K_2 transfer is determined by the projection formula and the norm.
- [Weibel.KBook.III](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.III.pdf), III, Exercise 5.6 (p. 46).
  Excerpt: “the case i = 1 yields the useful formula f∗ {r, s} = {r, N s} for Steinberg symbols in K2 (R), where r ∈ R× , s ∈ S × and N s = f∗ (s) ∈ R× is the norm of s.”
  Use: The projection formula for the finite K_2 transfer.
- [Weibel.KBook.III](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.III.pdf), III.7.6, Definition 7.6 and Theorem 7.6.1 (p. 64).
  Excerpt: “The transfer map is well-defined by the following result of K. Kato.”
  Use: The Milnor norm compared here is the Bass–Tate/Kato one, defined in chapter III without reference to Quillen's transfer.
- [GilleSzamuely.2006](https://www.math.ens.psl.eu/~benoist/refs/Gille-Szamuely.pdf), Lemma 7.3.6–7.3.7 and proof of Theorem 7.3.2, pp. 198–203.
  Excerpt: “commutes”
  Use: Prime-to-p descent, arbitrary-base-change multiplicities and degree-p towers; the comparison of two transfers is derived here from these and the K.3 exact-functor contract, not quoted as a GS theorem.
- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), V.1.2/1.2.1; V.3.7.2 and Exercise V.3.11.
  Excerpt: “Additivity Theorem”
  Use: Additivity and base-change functoriality supporting the requested Quillen field-transfer contract.

<a id="stage-k2symbolsbrauer-t-5"></a>
## T.5 — Tame kernels and explicit arithmetic

Define the unramified subgroup before any localization identification. Derive the number-field integral and S-integer rows using the finite-field calculation and KTheoryLowDegrees U.4’s SK₁ theorem. Separate the integer word upper bound from the real-sign lower bound; their combination gives K₂(ℤ), then the rational calculation. ArithmeticKTheory consumes these rows and owns the certificate engine.

Coverage: **partial**.

**Remaining proof and supply obligations.**

- Stage changes for the maintainer: edges T.3:localization-comparison → T.5 and KTheoryLowDegrees U.4 → T.5 (RT-AREA-ktheory-1/26), T.5 → ArithmeticKTheory N.2, N.6 and N.8 (RT-AREA-ktheory-1/9); delete the paragraph 'Give certified finite presentations … complete kernel argument' and the sentence 'Include a nontrivial arithmetic example with a verified presentation in N' from T.5's text, their owner being N.6.
- Import T.2’s exact monomial-kernel unit-symbol lemma; all integer-specific word and kernel steps are now decomposed here.


<a id="node-k2symbolsbrauer-t-5-unramified-subgroup"></a>
### The unramified subgroup of K_2 of a field

`K2SymbolsBrauer:T.5/unramified-subgroup` · definition · implementation unchecked

Planet: **Unramified subgroup**.

Let F be a field with a family (v_i)_{i∈I} of discrete valuations — in the arithmetic case R is a Dedekind domain with fraction field F, I = HeightOneSpectrum R and v_𝔭 is the 𝔭-adic valuation; for a number field R = O_F and I is the set of finite places. The unramified subgroup U_I(F) ⊂ K_2(F) is the intersection over i of the kernels of the tame symbols ∂_{v_i} : K_2(F) → k(v_i)^× of T.3; for S ⊂ I the subgroup unramified outside S is the intersection over i ∉ S. The definition uses no localisation theorem; for a number field its identification with K_2(O_F) is T.5/tame-kernel-sequence.

**Hypotheses.**

- Each v_i is a discrete valuation of F with residue field k(v_i).
- When every element of F^× has nonzero valuation at only finitely many v_i (a Dedekind domain, the places of a function field), U_I(F) is the kernel of the residue sum K_2(F) → ⊕_i k(v_i)^×.


**Construction and proof.**

1. Define U_I(F) as the infimum over i of the kernels of the homomorphisms ∂_{v_i} (T.3/tame-symbol-steinberg).
2. Under finite support (T.3/finite-support) the residue sum is defined and its kernel is U_I(F).
3. Restriction along a finite extension whose family lies over the family of F maps U into U, by the ramification formula (T.3/ramification-formula); the transfer maps U back into U by the norm-residue formula (T.3/transfer-and-norm-residue).
4. For a Dedekind domain R the image of K_2(R) → K_2(F) lies in U: the map factors through K_2(R_𝔭), which is generated by Steinberg symbols of units (K2SymbolsBrauer:T.2/symbols-generate for the local ring R_𝔭), and the tame symbol of two units is trivial.

**Acceptance.**

- A class coming from K_2(O_F) is unramified, the easy inclusion of the localisation theorem.
- The symbol of two units of O_F is unramified everywhere.
- The definition does not presuppose the localisation theorem.


**Prerequisites.**

- [`K2SymbolsBrauer:T.3/tame-symbol-steinberg`](#node-k2symbolsbrauer-t-3-tame-symbol-steinberg)
- [`K2SymbolsBrauer:T.3/finite-support`](#node-k2symbolsbrauer-t-3-finite-support)
- [`K2SymbolsBrauer:T.3/ramification-formula`](#node-k2symbolsbrauer-t-3-ramification-formula)
- [`K2SymbolsBrauer:T.3/transfer-and-norm-residue`](#node-k2symbolsbrauer-t-3-transfer-and-norm-residue)
- [`K2SymbolsBrauer:T.2/symbols-generate`](#node-k2symbolsbrauer-t-2-symbols-generate)
- [`K2SymbolsBrauer:T.1/k2-definition`](#node-k2symbolsbrauer-t-1-k2-definition)
- `mathlib:IsDedekindDomain.HeightOneSpectrum`
- `mathlib:IsDedekindDomain.HeightOneSpectrum.valuation`


**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `unramifiedSubgroup` | data | For a family v : I → discrete valuations of F, ⨅ i, ker(∂_{v i}) as a subgroup of K_2(F). |
| `mem_unramifiedSubgroup_iff` | characterisation | x ∈ U ↔ ∀ i, ∂_{v i} x = 1. |
| `unramifiedOutside` | data | For S ⊆ I, ⨅ i ∉ S, ker(∂_{v i}); unramifiedOutside ∅ = unramifiedSubgroup, and it is monotone in S. |
| `unramifiedSubgroup_eq_ker_residueSum` | characterisation | Under finite support, U = ker(K_2(F) → ⨁ i, k(v i)ˣ). |
| `symbol_mem_unramifiedSubgroup` | simp | If u and w are units at every v_i then {u, w} ∈ U. |
| `range_K2_le_unramifiedSubgroup` | compatibility | For a Dedekind domain R with fraction field F and I = HeightOneSpectrum R, the image of K_2(R) → K_2(F) lies in U. |
| `unramifiedSubgroup_map_le` | functoriality | Restriction along a finite extension carrying the family into the family maps U into U. |
| `transfer_mem_unramifiedSubgroup` | relation | The transfer of a finite extension of number fields maps the unramified subgroup of the larger field into that of the smaller. |
| `unramifiedSubgroup_heightOneSpectrum` | compatibility | For I = HeightOneSpectrum R, v_𝔭 is Mathlib's HeightOneSpectrum.valuation F and k(v_𝔭) is identified with R ⧸ 𝔭. |

**Consumers.**

- T.5/s-integer-tame-kernel-sequence and T.5/tame-kernel-sequence — the image of K_2(O_{F,S}) in K_2(F) is the subgroup unramified outside S, and that of K_2(O_F) is this subgroup
- ArithmeticKTheory N.2 — N.2 specialises its all-degree localisation sequence to T.5's degree-two rows, which identify this subgroup with K_2(O_F)
- SpecialValuesBirchTate B.1 and B.7 — the orders #K_2(O_F) and #K_2(O_{F,S}) are those of this subgroup and of its outside-S variant, through T.5/tame-kernel-sequence and T.5/relative-s-integer-sequence
- ArithmeticKTheory N.6 — N.6's certificate engine presents the tame kernel, which is this subgroup; the certificate format is N.6's
- T.7's Hilbert-symbol comparison — the local symbols are evaluated on classes whose ramification is controlled


**Unit tests.**

- `neg_one_neg_one_mem` (computation) — For F = ℚ with the family of all primes, {−1, −1} ∈ U, since −1 is a unit at every prime.
- `neg_one_p_not_mem` (non-example) — For an odd prime p, {−1, p} ∉ U over ℚ: its tame symbol at p is −1 ≠ 1 in 𝔽_p^×; a definition testing only symbols of units, or only one place, misses this.
- `three_three_not_mem` (non-example) — {3, 3} ∉ U over ℚ: the sign (−1)^{v(f)v(g)} makes its tame symbol at 3 equal to −1; a symbol without the sign would wrongly put {3, 3} in U.
- `two_neg_one_mem` (degenerate) — {2, −1} = 1 by the Steinberg relation (2 + (−1) = 1); correspondingly its tame symbol at 2 is −1 = 1 in 𝔽_2^× and all others are 1.
- `empty_family` (degenerate) — For the empty family U = K_2(F), and unramifiedOutside I = K_2(F).
- `mem_iff_residueSum_rat` (characterisation) — For ℚ and the primes, x ∈ U exactly when the residue sum of x in ⨁_p 𝔽_p^× vanishes.
- `heightOneSpectrum_int` (compatibility) — For R = ℤ the valuation Mathlib attaches to (p) ∈ HeightOneSpectrum ℤ is the p-adic valuation and ℤ ⧸ (p) ≅ ZMod p, so the tame symbol at (p) lands in (ZMod p)ˣ.


**Suggested placement.** module: `TauCeti/Algebra/KTheory/TameSymbol`; namespace: `TauCeti.TameSymbol`.

**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.6.3, Lemma 6.3 (PDF p. 242; book p. 234).
  Excerpt: “Lemma 6.3. For every discrete valuation v on F there is a Steinberg symbol K2(F) −∂v→ k×v, defined by ∂v({r, s}) = (−1)^{v(r)v(s)} overline(s^{v(r)}/r^{v(s)}). This symbol is called the tame symbol of the valuation v.”
  Use: The symbols whose simultaneous vanishing defines the subgroup.
- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.6.5, Localization Theorem 6.5 (PDF p. 244; book p. 236).
  Excerpt: “Localization Theorem 6.5. Let R be a Dedekind domain, with field of fractions F. Then the tame symbols K2(F) −∂p→ (R/p)× associated to the prime ideals of R fit into a long exact sequence ∐p K2(R/p) → K2(R) → K2(F) −∂=∐∂p→ ∐p (R/p)× → SK1(R) → 1”
  Use: The kernel of the residue sum, which the localisation theorem identifies with the image of K_2(R) modulo the image of ∐ K_2(R/p).

<a id="node-k2symbolsbrauer-t-5-s-integer-tame-kernel-sequence"></a>
### The tame-kernel sequence of the S-integers: residues at the primes outside S

`K2SymbolsBrauer:T.5/s-integer-tame-kernel-sequence` · theorem · implementation unchecked

Let F be a number field, S a finite set of nonzero primes of O_F (S = ∅ allowed) and O_{F,S} = Set.integer S F. The nonzero primes of O_{F,S} are the 𝔭O_{F,S} with 𝔭 ∉ S, with residue fields k(𝔭) = O_F/𝔭 (Tau Ceti's IsDedekindDomain.integerHeightOneSpectrumEquiv). Then 0 → K_2(O_{F,S}) → K_2(F) −(∂_𝔭)_{𝔭∉S}→ ⊕_{𝔭∉S} k(𝔭)^× → 0 is exact: the sum is over the finite primes OUTSIDE S. Equivalently K_2(O_{F,S}) → K_2(F) is injective with image the subgroup unramified outside S (T.5/unramified-subgroup), and the residue sum over the primes outside S is onto. The sequence is derived through the actual maps of the Dedekind localisation sequence, whose boundary is the tame symbol at each prime (T.3/dedekind-localization-boundary, from T.3:localization-comparison): injectivity because K_2 of each finite residue field vanishes, surjectivity because the cokernel of the residue sum is ker(K_1(O_{F,S}) → K_1(F)), which is zero by the Bass–Milnor–Serre theorem SK_1(O_{F,S}) = 0 (KTheoryLowDegrees U.4). The relative sequence comparing O_F with O_{F,S}, whose residues are at the primes IN S, is T.5/relative-s-integer-sequence.

**Hypotheses.**

- F is a number field and S a finite set of nonzero primes of O_F.
- K_2 is the classical group of T.1, identified with Quillen's K_2 by T.1/k2-pi2; the sign of the boundary is fixed in T.3/localization-boundary and does not affect kernels or images.


**Construction and proof.**

1. O_{F,S} is a Dedekind domain with fraction field F, a localisation of O_F; its height-one primes are the 𝔭O_{F,S} with 𝔭 ∉ S (IsDedekindDomain.integerHeightOneSpectrumEquiv), and O_{F,S}/𝔭O_{F,S} = O_F/𝔭.
2. Apply T.3/dedekind-localization-boundary to R = O_{F,S}: ⊕_{𝔭∉S} K_2(k(𝔭)) → K_2(O_{F,S}) → K_2(F) −∂→ ⊕_{𝔭∉S} k(𝔭)^× → K_1(O_{F,S}) → K_1(F) is exact, the 𝔭-component of ∂ being the inverse of the tame symbol at 𝔭.
3. Injectivity: K_2(k(𝔭)) = 0 for the finite fields k(𝔭) (K2SymbolsBrauer:T.2/k2-finite-field).
4. Image: ker ∂ is the subgroup unramified outside S, a tame symbol and its inverse having the same kernel (T.5/unramified-subgroup, unramifiedOutside S).
5. Surjectivity: coker ∂ ≅ ker(K_1(O_{F,S}) → K_1(F)), and this map is injective because SK_1(O_{F,S}) = 0 and O_{F,S}^× ⊆ F^× (KTheoryLowDegrees U.4). The surjectivity of each tame symbol and finite support do not suffice (Example III.1.5.4).

**Acceptance.**

- For F = ℚ and S = {p}: 0 → K_2(ℤ[1/p]) → K_2(ℚ) → ⊕_{ℓ≠p} 𝔽_ℓ^× → 0; the residue at p is not in the sum.
- For S = ∅ it is T.5/tame-kernel-sequence.
- Indexing test: {5, 2} ∈ K_2(ℚ) has nonzero tame symbol only at 5 (value 3 with T.3's normalisation), so it lies in the image of K_2(ℤ[1/5]) and not in that of K_2(ℤ[1/2]).


**Prerequisites.**

- [`K2SymbolsBrauer:T.3/dedekind-localization-boundary`](#node-k2symbolsbrauer-t-3-dedekind-localization-boundary)
- [`K2SymbolsBrauer:T.3/localization-boundary`](#node-k2symbolsbrauer-t-3-localization-boundary)
- [`K2SymbolsBrauer:T.5/unramified-subgroup`](#node-k2symbolsbrauer-t-5-unramified-subgroup)
- [`K2SymbolsBrauer:T.2/k2-finite-field`](#node-k2symbolsbrauer-t-2-k2-finite-field)
- [`K2SymbolsBrauer:T.1/k2-pi2`](#node-k2symbolsbrauer-t-1-k2-pi2)
- `KTheoryLowDegrees:U.4`
- `mathlib:Set.integer`
- `tauceti:IsDedekindDomain.integerHeightOneSpectrumEquiv`


**Sources.**

- [Weibel.KBook.III](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.III.pdf), III.6.5, Localization Theorem 6.5 (p. 52).
  Excerpt: “Localization Theorem 6.5. Let R be a Dedekind domain with field of fractions F . Then the tame symbols K2 (F ) −→ (R/p)× associated to the prime ideals of R fit into a long exact sequence”
  Use: The localisation theorem for any Dedekind domain, applied to O_{F,S}, whose primes are those of O_F outside S.
- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), V.6.8, Theorem 6.8 (PDF p. 420; book p. 412).
  Excerpt: “Theorem 6.8. (Soulé [171]) Let R be a Dedekind domain whose field of fractions F is a global field. Then Kn(R) ≅ Kn(F) for all odd n ≥ 3; for even n ≥ 2 the localization sequence breaks up into exact sequences: 0 → Kn(R) → Kn(F) → ⊕p Kn−1(R/p) → 0.”
  Use: Soulé's theorem for n = 2 applies to every Dedekind domain with global fraction field, in particular to O_{F,S} as well as O_F.
- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), V.6.8, proof of Theorem 6.8 (PDF p. 420; book p. 412).
  Excerpt: “Let SKn(R) denote the kernel of Kn(R) → Kn(F); from (6.6), it suffices to prove that SKn(R) = 0 for n ≥ 1. For n = 1 this is the Bass-Milnor-Serre Theorem III.2.5 (and III.2.5.1).”
  Use: Where Bass–Milnor–Serre enters.

<a id="node-k2symbolsbrauer-t-5-tame-kernel-sequence"></a>
### The tame-kernel exact sequence for the ring of integers

`K2SymbolsBrauer:T.5/tame-kernel-sequence` · theorem · implementation unchecked

For a number field F with ring of integers O_F the sequence 0 → K_2(O_F) → K_2(F) −⊕∂_𝔭→ ⊕_𝔭 k(𝔭)^× → 0 is exact, the sum over all nonzero primes of O_F and the third map the residue sum of the tame symbols (sign fixed in T.3/localization-boundary): K_2(O_F) → K_2(F) is injective with image the unramified subgroup of T.5/unramified-subgroup, and the residue sum is onto. It is the case S = ∅ of T.5/s-integer-tame-kernel-sequence: injectivity from K_2(k(𝔭)) = 0, surjectivity from SK_1(O_F) = 0 through the Dedekind localisation sequence (T.3/dedekind-localization-boundary and KTheoryLowDegrees U.4). ArithmeticKTheory N.2 imports this row and specialises its all-degree localisation sequence to it (RT-AREA-ktheory-1/9); T.5 does not import it from N.2. Surjectivity does not follow from the surjectivity of the individual tame symbols.

**Hypotheses.**

- F is a number field; 𝔭 runs over the nonzero primes of O_F and k(𝔭) = O_F/𝔭.
- K_2 is the classical group of T.1, identified with Quillen's K_2 by T.1/k2-pi2.


**Construction and proof.**

1. Take S = ∅ in T.5/s-integer-tame-kernel-sequence: Set.integer ∅ F consists of the elements of F integral at every prime of O_F, which is O_F (mathlib:NumberField.RingOfIntegers).
2. State the sequence with the residue sum of T.5/unramified-subgroup as third map; exactness in the middle says that the image of K_2(O_F) is the unramified subgroup.
3. Record where each half comes from: injectivity from K_2(k(𝔭)) = 0 (K2SymbolsBrauer:T.2/k2-finite-field); surjectivity from SK_1(O_F) = 0 (KTheoryLowDegrees U.4) through the exact segment ⊕_𝔭 k(𝔭)^× → K_1(O_F) → K_1(F) of T.3/dedekind-localization-boundary. The surjectivity of each tame symbol does not suffice: for the Dedekind domain ℝ[x, y]/(x² + y² − 1) every tame symbol is onto, but the cokernel of the residue sum is its SK_1, which is nonzero (Example III.1.5.4).

**Acceptance.**

- For F = ℚ it is 1 → K_2(ℤ) → K_2(ℚ) → ⊕_p 𝔽_p^× → 1 (Application III.6.5.1).
- The third map is onto, but not because each tame symbol is: Example III.1.5.4 gives surjective tame symbols with a nonzero cokernel.
- The same sequence holds for every Dedekind domain whose fraction field is a global field (Soulé's Theorem V.6.8, n = 2).


**Prerequisites.**

- [`K2SymbolsBrauer:T.5/s-integer-tame-kernel-sequence`](#node-k2symbolsbrauer-t-5-s-integer-tame-kernel-sequence)
- [`K2SymbolsBrauer:T.5/unramified-subgroup`](#node-k2symbolsbrauer-t-5-unramified-subgroup)
- [`K2SymbolsBrauer:T.3/dedekind-localization-boundary`](#node-k2symbolsbrauer-t-3-dedekind-localization-boundary)
- [`K2SymbolsBrauer:T.2/k2-finite-field`](#node-k2symbolsbrauer-t-2-k2-finite-field)
- `KTheoryLowDegrees:U.4`
- `mathlib:NumberField.RingOfIntegers`
- `mathlib:Set.integer`


**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.6.5, Localization Theorem 6.5 (PDF p. 244; book p. 236).
  Excerpt: “Localization Theorem 6.5. Let R be a Dedekind domain, with field of fractions F. Then the tame symbols K2(F) −∂p→ (R/p)× associated to the prime ideals of R fit into a long exact sequence ∐p K2(R/p) → K2(R) → K2(F) −∂=∐∂p→ ∐p (R/p)× → SK1(R) → 1”
  Use: The localisation sequence for a Dedekind domain: the cokernel of the residue sum is SK_1(R).
- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), V.6.8, Theorem 6.8 (PDF p. 420; book p. 412).
  Excerpt: “Theorem 6.8. (Soulé [171]) Let R be a Dedekind domain whose field of fractions F is a global field. Then Kn(R) ≅ Kn(F) for all odd n ≥ 3; for even n ≥ 2 the localization sequence breaks up into exact sequences: 0 → Kn(R) → Kn(F) → ⊕p Kn−1(R/p) → 0.”
  Use: The case of a global field.
- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), V.6.8, proof of Theorem 6.8 (PDF p. 420; book p. 412).
  Excerpt: “Let SKn(R) denote the kernel of Kn(R) → Kn(F); from (6.6), it suffices to prove that SKn(R) = 0 for n ≥ 1. For n = 1 this is the Bass-Milnor-Serre Theorem III.2.5 (and III.2.5.1).”
  Use: Where Bass–Milnor–Serre enters.
- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.1.5.4, Example 1.5.4 (PDF p. 193; book p. 185).
  Excerpt: “The ring R = ℝ[x, y]/(x2 + y2 − 1) may be embedded in the ring ℝ^{S1} by x ↦ cos(θ), y ↦ sin(θ). Since the matrix (x −y; y x) maps to A, it represents a nontrivial element of SK1(R).”
  Use: A Dedekind domain with nonzero SK_1: per-prime surjectivity does not give surjectivity of the sum.

<a id="node-k2symbolsbrauer-t-5-relative-s-integer-sequence"></a>
### The relative sequence comparing K₂(O_F) with K₂(O_{F,S}): residues at the primes in S

`K2SymbolsBrauer:T.5/relative-s-integer-sequence` · theorem · implementation unchecked

Let F be a number field and S a finite set of nonzero primes of O_F. Then 0 → K_2(O_F) → K_2(O_{F,S}) −(∂_𝔭)_{𝔭∈S}→ ⊕_{𝔭∈S} k(𝔭)^× → 0 is exact, the first map induced by O_F ⊆ O_{F,S} and the residues taken at the primes IN S (read on the image of K_2(O_{F,S}) in K_2(F)). The tame-kernel sequence of O_{F,S} itself, T.5/s-integer-tame-kernel-sequence, has its residues at the primes OUTSIDE S; the two are distinct statements. Consequently #K_2(O_{F,S}) = #K_2(O_F)·∏_{𝔭∈S}(N𝔭 − 1) whenever K_2(O_F) is finite. This is the stage text's 'exact sequence comparing their tame kernel with the integral one'.

**Hypotheses.**

- F is a number field and S a finite set of nonzero primes of O_F.


**Construction and proof.**

1. By T.5/tame-kernel-sequence and T.5/s-integer-tame-kernel-sequence, K_2(O_F) and K_2(O_{F,S}) inject into K_2(F) with images the unramified subgroup U and the subgroup U_S unramified outside S (T.5/unramified-subgroup); K_2(O_F) → K_2(O_{F,S}) → K_2(F) is K_2(O_F) → K_2(F) by functoriality, so the first map is injective with image corresponding to U ⊆ U_S.
2. U is the kernel of the residues at S restricted to U_S, which is exactness in the middle.
3. Surjectivity: given (y_𝔭)_{𝔭∈S}, extend it by 1 at the primes outside S and lift it through the surjective residue sum of T.5/tame-kernel-sequence; the lift is unramified outside S, so it lies in U_S, the image of K_2(O_{F,S}).

**Acceptance.**

- For F = ℚ and S = {p}: 0 → K_2(ℤ) → K_2(ℤ[1/p]) → 𝔽_p^× → 0, so K_2(ℤ[1/p]) has order 2(p − 1); ArithmeticKTheory N.8 demonstrates this sequence and imports it.
- Indexing: the residues are at the primes in S; for S = ∅ the sequence is the identity of K_2(O_F).
- The order formula #K_2(O_{F,S}) = #K_2(O_F)·∏_{v∈S}(Nv − 1) that SpecialValuesBirchTate B.7 consumes follows because #k(𝔭)^× = N𝔭 − 1.


**Prerequisites.**

- [`K2SymbolsBrauer:T.5/tame-kernel-sequence`](#node-k2symbolsbrauer-t-5-tame-kernel-sequence)
- [`K2SymbolsBrauer:T.5/s-integer-tame-kernel-sequence`](#node-k2symbolsbrauer-t-5-s-integer-tame-kernel-sequence)
- [`K2SymbolsBrauer:T.5/unramified-subgroup`](#node-k2symbolsbrauer-t-5-unramified-subgroup)
- `mathlib:Set.integer`


**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), V.6.8, Theorem 6.8 (PDF p. 420; book p. 412).
  Excerpt: “Theorem 6.8. (Soulé [171]) Let R be a Dedekind domain whose field of fractions F is a global field. Then Kn(R) ≅ Kn(F) for all odd n ≥ 3; for even n ≥ 2 the localization sequence breaks up into exact sequences: 0 → Kn(R) → Kn(F) → ⊕p Kn−1(R/p) → 0.”
  Use: The case of a global field.

<a id="node-k2symbolsbrauer-t-5-real-sign-symbol"></a>
### The real sign symbol (Example III.6.2.1)

`K2SymbolsBrauer:T.5/real-sign-symbol` · construction · implementation unchecked

For x, y ∈ ℝ^× put (x, y)_∞ = −1 if x < 0 and y < 0, and +1 otherwise. It is bilinear and (x, 1 − x)_∞ = 1 for x ≠ 0, 1, so by Matsumoto's theorem it defines a homomorphism K_2(ℝ) → {±1}, onto because (−1, −1)_∞ = −1. For a field F with an embedding σ : F → ℝ (a real place of a number field) the composite K_2(F) → K_2(ℝ) → {±1} is the sign symbol at σ.

**Hypotheses.**

- The target {±1} is ℤˣ; σ is a ring embedding into ℝ.


**Construction and proof.**

1. (x, y)_∞ = (−1)^{ε(x)ε(y)} with ε(x) ∈ ℤ/2 the sign bit, which is a homomorphism ℝ^× → ℤ/2; hence the pairing is bilinear.
2. Steinberg identity: x and 1 − x are never both negative.
3. Descend through Matsumoto's presentation (K2SymbolsBrauer:T.2/matsumoto); surjectivity from (−1, −1)_∞ = −1.
4. Compose with the functoriality of K_2 along σ for the sign symbol at a real place.

**Acceptance.**

- (−1, −1)_∞ = −1, so {−1, −1} ≠ 1 in K_2(ℝ).
- For a number field with r_1 real places the r_1 sign symbols give a surjection K_2(F) → {±1}^{r_1} (Exercise III.6.4).
- It is the degree-two part of the graded map K^M_*(ℝ) → (ℤ/2)[t] of Examples III.7.2(c) (K2SymbolsBrauer:T.2/milnor-examples), and it equals the Hilbert symbol of ℝ (Example III.6.2.2; T.7/classical-local-symbols proves that comparison).


**Prerequisites.**

- [`K2SymbolsBrauer:T.2/matsumoto`](#node-k2symbolsbrauer-t-2-matsumoto)
- [`K2SymbolsBrauer:T.1/k2-definition`](#node-k2symbolsbrauer-t-1-k2-definition)
- [`K2SymbolsBrauer:T.2/milnor-examples`](#node-k2symbolsbrauer-t-2-milnor-examples)
- `mathlib:NumberField.InfinitePlace.IsReal`


**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `realSignSymbol` | constructor | The homomorphism K_2(ℝ) →* ℤˣ with {x, y} ↦ −1 if x < 0 and y < 0, and 1 otherwise. |
| `realSignSymbol_symbol` | simp | Its value on a symbol {x, y}. |
| `realSignSymbol_neg_one_neg_one` | simp | realSignSymbol {−1, −1} = −1. |
| `realSignSymbol_surjective` | characterisation | It is onto ℤˣ. |
| `signSymbolAt` | functoriality | For σ : F →+* ℝ, the composite of K_2(σ) with realSignSymbol; for a number field one for each real place. |
| `realSignSymbol_eq_milnorExamples` | compatibility | Through Matsumoto's theorem, on K^M_2(ℝ): {x, y} ↦ −1 exactly when x < 0 and y < 0, which is the degree-two part of the graded map K^M_*(ℝ) → (ℤ/2)[t] of K2SymbolsBrauer:T.2/milnor-examples (a lemma with no API name to compare with). |

**Consumers.**

- T.5/k2-of-the-integers — it shows that {−1, −1} is nonzero, the lower bound of the order-two statement
- T.5/k2-of-the-rationals — it splits the tame-kernel sequence of ℚ
- ArithmeticKTheory N.6 — the model lower bound of an order certificate, a surjection onto a group of known order; the certificate format is N.6's
- T.7/classical-local-symbols — the Hilbert symbol of ℝ is this symbol


**Unit tests.**

- `realSignSymbol_values` (computation) — (−2, −3)_∞ = −1 and (−2, 3)_∞ = 1.
- `realSignSymbol_one` (degenerate) — (x, 1)_∞ = (1, y)_∞ = 1 for all x, y ∈ ℝ^×.
- `orSign_not_steinberg` (non-example) — The pairing equal to −1 when at least one entry is negative is not a Steinberg symbol: it is −1 at (2, −1) although 2 + (−1) = 1.
- `signSymbolAt_rat` (characterisation) — For the real embedding of ℚ, signSymbolAt sends {−1, −1} to −1 and {p, q} to 1 for positive p, q.
- `realSignSymbol_hilbert` (compatibility) — (x, y)_∞ = 1 exactly when x·a² + y·b² = 1 has a real solution, the Hilbert symbol of ℝ.


**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.6.2.1, Example 6.2.1 (PDF p. 240; book p. 232).
  Excerpt: “Example 6.2.1. There is a Steinberg symbol (x, y)∞ on the field R with values in the group {±1}. Define (x, y)∞ to be: −1 if both x and y are negative, and +1 otherwise. The Steinberg identity (x, 1 − x)∞ = +1 holds because x and 1 − x cannot be negative at the same time.”
  Use: The definition and the Steinberg identity.
- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.6.2.1, Example 6.2.1, continued (PDF p. 240; book p. 232).
  Excerpt: “The resulting map K2(R) → {±1} is onto because (−1, −1)∞ = −1. This shows that the symbol {−1, −1} in K2(Z) is nontrivial, as promised in 5.2.2, and even shows that K2(Z) is a direct summand in K2(R).”
  Use: Surjectivity and the consequence for K_2(ℤ).
- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III, Exercise 6.4 (PDF p. 251; book p. 243).
  Excerpt: “6.4. If F is a number field with r1 distinct embeddings F ↪ R, show that the r1 symbols ( , )∞ on F define a surjection K2(F) → {±1}^{r1}.”
  Use: The sign symbols at the real places of a number field.

<a id="node-k2symbolsbrauer-t-5-integer-steinberg-word-model"></a>
### Finite-rank integer word models for Silvester’s induction

`K2SymbolsBrauer:T.5/integer-steinberg-word-model` · construction · implementation unchecked

Define an auxiliary family S_n over ℤ: S₀=S₁=1; S₂ is Milnor’s rank-two presented group of Definition 10.4; S_n=St(n,ℤ) from T.1 for n≥3. In rank two impose x_ij(a)x_ij(b)=x_ij(a+b) and w_ij(u)x_ji(a)w_ij(−u)=x_ij(−u²a), u∈ℤ×, where w_ij(u)=x_ij(u)x_ji(−u⁻¹)x_ij(u). Let φ_n be the elementary-matrix action on row vectors ℤ^n, W_n the subgroup generated by w_ij(1), and |b|₁=Σ_i |b_i|. Use the standard rank-raising maps S_n→S_(n+1) and the map into stable St(ℤ). This auxiliary S₂ is not the rank-two group with only the usual three-index Steinberg relations.

**Hypotheses.**

- n∈ℕ; the integer ring and row-vector action are fixed; finite St(n,ℤ) is imported for n≥3.


**Construction and proof.**

1. Use PresentedGroup for the rank-two generators/relations; the elementary matrices satisfy both relation families. The rank-two relation holds in St(3,ℤ) by the conjugation calculation of diagonal-lift-words, so stabilization is well defined. Higher-rank maps are T.1’s stabilization maps.
2. Compute b·x_ij(a) by adding a b_i to coordinate j. Then w_ij(1) swaps b_i,b_j with one sign, so W_n preserves |b|₁. Over ℤ the only units are ±1 and w_ij(−1)=w_ij(1)⁻¹.
3. Represent any word as a product of x_ij(±1) followed by w∈W_n, since x_ij(a) is a signed unit-generator power. Conjugation by W_n carries such a generator to another signed unit generator; moving a W factor to the right preserves this shape.

**Acceptance.**

- For n=2, (a,b)x₁₂(1)=(a,a+b) and (a,b)x₂₁(1)=(a+b,b).
- The rank-two conjugation relation is essential; do not apply Lemma 10.7 to an unmodified two-index presentation.


**Prerequisites.**

- [`K2SymbolsBrauer:T.1/steinberg-group-finite-rank`](#node-k2symbolsbrauer-t-1-steinberg-group-finite-rank)
- [`K2SymbolsBrauer:T.2:symbols/diagonal-lift-words`](#node-k2symbolsbrauer-t-2-symbols-diagonal-lift-words)
- `mathlib:PresentedGroup`


**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `IntegerSteinbergModel` | constructor | The auxiliary S_n with the explicit rank-two relation and the standard higher-rank carrier. |
| `IntegerSteinbergModel.toElementary` | functoriality | φ_n:S_n→E(n,ℤ), satisfying φ_n(x_ij(a))=e_ij(a). |
| `IntegerSteinbergModel.stabilize` | functoriality | S_n→S_(n+1) and compatible maps into stable St(ℤ); no low-rank injectivity is asserted. |
| `IntegerSteinbergModel.monomialSubgroup` | constructor | W_n=⟨w_ij(1)⟩; its row-vector action preserves the integer ℓ¹ norm. |
| `IntegerSteinbergModel.unitWord` | characterisation | Every element is represented by signed unit generators followed by a W_n element; a norm-monotone representation is the next lemma, not part of this definition. |

**Consumers.**

- T.5/silvester-word-reduction and integer-kernel-in-monomial-subgroup — supplies the finite-rank induction, including its rank-one and rank-two bases


**Unit tests.**

- `IntegerSteinbergModel.row_two` (computation) — (2,−1)x₁₂(1)=(2,1) and (2,−1)x₂₁(1)=(1,−1).
- `IntegerSteinbergModel.w_preserves_norm` (computation) — (2,−1)w₁₂(1)=(1,2), and both vectors have ℓ¹ norm 3.
- `IntegerSteinbergModel.rank_two_guard` (non-example) — The auxiliary S₂ carries the conjugation relation of Definition 10.4; the ordinary two-index free Steinberg presentation is not substituted for it.


**Sources.**

- [Milnor.1971](https://www.math.uni-bielefeld.de/~rehmann/DML/BOOKS/milnor.ocr.djvu), Definition 10.4, p. 82; setup for Lemma 10.6, p. 85; Lemmas 9.2–9.4, pp. 71–72.
  Excerpt: “standard basis vectors”
  Use: Rank-two presentation, row-vector norm, signed permutation action and conjugation.

<a id="node-k2symbolsbrauer-t-5-silvester-word-reduction"></a>
### Silvester’s monotone integer word lemma

`K2SymbolsBrauer:T.5/silvester-word-reduction` · lemma · implementation unchecked

For n≥2, a signed standard basis vector β∈ℤ^n and z∈S_n, there exist signed unit generators g₁,…,g_r and w∈W_n with z=g₁⋯g_r w and 1≤|βg₁|₁≤⋯≤|βg₁⋯g_r|₁. The word equality holds in S_n, not just after elementary matrices.

**Hypotheses.**

- S_n, W_n and the right row action are integer-steinberg-word-model; β=±e_i; n≥2.


**Construction and proof.**

1. Take a signed unit word followed by W_n. Let σ_j=|βg₁⋯g_j|₁, σ₀=1. If a descent occurs, let λ=max{σ_j:σ_j>σ_(j+1)} and μ the last index attaining that maximum at a descent. Order (λ,μ) lexicographically. It is a pair of natural numbers, so strict decreases terminate; word length itself need not decrease.
2. Conjugate/renumber to make g_μ=x₁₂(1). Write the vector after g_μ as (a,b,c,…), so the preceding vector is (a,b−a,c,…). The maximality choice gives |b−a|≤|b|, hence |a|≤2|b| and a≠0 implies ab>0. Analyze g_(μ+1)=x_ij(ε), ε=±1. These are the source’s seven exhaustive index cases.
3. Cases 1–2: if i=1,j≥3, or both i,j≥3, commute g_(μ+1) left across x₁₂; only the peak norm drops (or its final occurrence moves earlier). Case 3: the same root x₁₂ must have ε=−1 and cancels; ε=+1 contradicts a descent and |b−a|≤|b|.
4. Case 4: i≥3,j=2 (take i=3). The two roots commute, but a plain swap need not reduce the norm. Writing x_ij=x_ij(1) and x_ij^ε=x_ij(ε), use x₁₂x₃₂^ε=x₃₂^εx₁₂=x₁₃^εx₃₂^εx₁₃^(−ε)=x₃₁^εx₁₂x₃₁^(−ε), verified by the Steinberg relations (Milnor p. 88). One decreases the peak according as |b−a|>|b−a+εc|, |c|>|c+εa|, or |a|>|a+εc|. The descent makes b and εc have opposite signs; if a≠0 it has the sign of b, forcing one of the last two inequalities; if a=0 the first holds.
5. Case 5: i=2,j=1. The sign ε=+1 contradicts the descent, so ε=−1. Replace x₁₂(1)x₂₁(−1) by x₂₁(1)w₂₁(−1), move w right by conjugation, and compare (a,b−a)→(b,b−a) with the old peak. Case 6: i=2,j≥3. Use x₁₂x₂₃^ε=x₁₃^εx₂₃^εx₁₂=x₂₃^εx₁₃^εx₁₂=x₂₁x₁₃^εx₁₂^(−1)w₁₂(1) on pp. 89–90; the possible reductions are |c|>|c+εa|, |c|>|c+εb−εa|, or |a|>|b|. The descent forces c and εb to have opposite signs and |b|<2|c|; split a=0 and a≠0 to obtain one of the three reductions.
6. Case 7: i≥3,j=1. Use x₁₂x₃₁^ε=x₃₁^εx₁₂x₃₂^(−ε)=x₃₁^εx₁₃^(−ε)x₃₂^(−ε)x₁₃^ε (p. 90). The sufficient inequalities are |b+εc|≤|b| or |c|≥|a|. Both are NONSTRICT; the original strict descent combines with them to reduce the peak pair, so equality must not be discarded. The descent gives opposite signs for a and εc and |c|<2|a|; together with |a|≤2|b| and ab>0, either |c|≤2|b| gives the first inequality, or |c|≥2|b| gives the second. Verify every replacement in S_n by its defining relations; W factors preserve the norm and conjugate subsequent signed generators to signed generators.
7. Each replacement strictly decreases (λ,μ), leaving the represented z fixed and every peak above λ untouched. Well-founded induction therefore yields the monotone word. In rank two only cases 3 and 5 occur; case 5 uses precisely the rank-two conjugation relation.

**Acceptance.**

- The result preserves the Steinberg word, not merely the resulting integer vector.
- At a=0 in Case 4 the first inequality is required; omitting that branch leaves a gap.
- The algorithm terminates by (λ,μ), not by a claimed decrease in word length.


**Prerequisites.**

- [`K2SymbolsBrauer:T.5/integer-steinberg-word-model`](#node-k2symbolsbrauer-t-5-integer-steinberg-word-model)


**Sources.**

- [Milnor.1971](https://www.math.uni-bielefeld.de/~rehmann/DML/BOOKS/milnor.ocr.djvu), Lemma 10.6 and its seven-case proof, pp. 85–90.
  Excerpt: “Steinberg generators”
  Use: Silvester word reduction, with a well-founded peak pair and actual Steinberg-word rewrites.

<a id="node-k2symbolsbrauer-t-5-integer-kernel-in-monomial-subgroup"></a>
### The integer Steinberg kernel is contained in the monomial subgroup

`K2SymbolsBrauer:T.5/integer-kernel-in-monomial-subgroup` · lemma · implementation unchecked

For every n≥1, ker(φ_n:S_n→E(n,ℤ))⊆W_n in the auxiliary finite-rank integer models.

**Hypotheses.**

- The auxiliary S₂ has Milnor’s Definition 10.4; no injectivity of stabilization is assumed.


**Construction and proof.**

1. Induct on n, starting with S₁=1. For z in the kernel and n≥2 choose β=e_n and the monotone word g₁⋯g_r w from silvester-word-reduction. Since φ_n(z)=1 and w preserves |·|₁, the first and last norms are 1, hence every prefix norm is 1.
2. A signed elementary transvection taking a signed standard vector to a vector of norm 1 must fix it: adding its nonzero coordinate to a different zero coordinate would raise the norm to 2. Induct through the prefixes to see every g_j fixes e_n. Thus none has first index n, and w fixes e_n too.
3. Use Steinberg commutators to move the factors x_in(±1) left: z=x·ι(y)·w, x=∏_(i<n)x_in(a_i), y∈S_(n−1). Since w’s signed monomial matrix fixes e_n, choose w′∈W_(n−1) with the same upper-left monomial matrix and write w=ι(w′)c with c∈W_n∩ker φ_n. The determinant-one monomial image is generated by the w_ij, by Milnor Lemma 9.1; the n=2 fixed-e₂ case has identity monomial image and w′=1.
4. The matrices of x and ι(yw′) have respectively only last-column off-diagonal entries and an upper-left block with last column e_n. Their product being 1 forces both matrices to be 1. The commuting last-column root subgroups have injective matrix map (entries are a_i), so x=1. Also yw′ lies in ker φ_(n−1), hence in W_(n−1) by induction. Therefore z=ι(yw′)c∈W_n.

**Acceptance.**

- The induction includes n=2 using the auxiliary group; omitting this base does not prove the stable bound.
- The x=1 step uses the injective matrix map on commuting last-column root subgroups, not injectivity of φ_n on all S_n.


**Prerequisites.**

- [`K2SymbolsBrauer:T.5/silvester-word-reduction`](#node-k2symbolsbrauer-t-5-silvester-word-reduction)
- [`K2SymbolsBrauer:T.5/integer-steinberg-word-model`](#node-k2symbolsbrauer-t-5-integer-steinberg-word-model)


**Sources.**

- [Milnor.1971](https://www.math.uni-bielefeld.de/~rehmann/DML/BOOKS/milnor.ocr.djvu), Lemma 10.7, pp. 90–92; Lemma 9.1, p. 71.
  Excerpt: “kernel of the natural homomorphism”
  Use: Norm-one prefix argument, last-column rearrangement and induction; it does not assert the false two-torsion bound for S₂.

<a id="node-k2symbolsbrauer-t-5-integer-kernel-upper-generation"></a>
### The upper generation bound for K₂ of the integers

`K2SymbolsBrauer:T.5/integer-kernel-upper-generation` · theorem · implementation unchecked

Every element of classical K₂(ℤ) is 1 or c={−1,−1}; this is the upper bound alone and does not assume c≠1.

**Hypotheses.**

- K₂(ℤ) is the stable Steinberg kernel; c is the unit symbol from T.2.


**Construction and proof.**

1. Represent a stable kernel element by a finite word. Its elementary matrix is already identity after a finite stabilization, so choose n≥3 where it lies in ker φ_n. Apply integer-kernel-in-monomial-subgroup to place it in W_n. No claim that every low-rank kernel maps injectively to the stable kernel is needed.
2. Import T.2’s monomial-kernel/unit-symbol theorem (Milnor Corollary 9.3 and Theorem 9.11): ker φ_n∩W_n is central and generated by {u,v} with u,v units in ℤ. Here u,v∈{1,−1}; symbols with a 1 entry vanish, so only c remains.
3. Bimultiplicativity gives c²={1,−1}=1. Therefore the cyclic subgroup generated by c has at most two elements and contains the whole kernel. Pass to the stable direct limit, preserving the same symbol c.
4. Combine this bound with real-sign-symbol only in k2-of-the-integers. The word argument supplies generation; the real sign supplies nontriviality independently.

**Acceptance.**

- The upper bound is available before the real sign and uses no calculation of K₂(ℚ).
- The rank-two auxiliary kernel is not asserted to have order two; the bound uses n≥3.


**Prerequisites.**

- [`K2SymbolsBrauer:T.5/integer-kernel-in-monomial-subgroup`](#node-k2symbolsbrauer-t-5-integer-kernel-in-monomial-subgroup)
- [`K2SymbolsBrauer:T.2/steinberg-symbol`](#node-k2symbolsbrauer-t-2-steinberg-symbol)
- [`K2SymbolsBrauer:T.1/k2-definition`](#node-k2symbolsbrauer-t-1-k2-definition)
- `K2SymbolsBrauer:T.2:symbols`


**Sources.**

- [Milnor.1971](https://www.math.uni-bielefeld.de/~rehmann/DML/BOOKS/milnor.ocr.djvu), Theorem 10.1 and Corollary 10.2, p. 81; final proof, p. 92; Theorem 9.11, pp. 77–78.
  Excerpt: “cyclic group of order 2”
  Use: Stable upper generation from finite-rank kernel containment and the monomial-kernel theorem.

<a id="node-k2symbolsbrauer-t-5-k2-of-the-integers"></a>
### K_2 of the integers is cyclic of order two, generated by {−1, −1}

`K2SymbolsBrauer:T.5/k2-of-the-integers` · theorem · implementation unchecked

Planet: **K₂ of the integers**.

K₂(ℤ) is cyclic of order two generated by c={−1,−1}. The upper generation theorem integer-kernel-upper-generation proves every element is 1 or c by Silvester’s finite-rank word reduction and monomial-kernel calculation. Independently, the real sign sends c to −1, so c≠1; bimultiplicativity gives c²=1. Consequently K₂(ℤ)→K₂(ℝ)→{±1} is an isomorphism and splits K₂(ℤ)→K₂(ℝ).

**Hypotheses.**

- K_2 is the classical K_2 of T.1; {−1, −1} is the Steinberg symbol of the unit −1 of ℤ with itself.


**Construction and proof.**

1. {−1, −1} ∈ K_2(ℤ) is a Steinberg symbol of units, and 2·{−1, −1} = {1, −1} = 0.
2. By functoriality of K_2 its image in K_2(ℝ) is {−1, −1}, which T.5/real-sign-symbol sends to −1; so {−1, −1} ≠ 1.
3. Apply integer-kernel-upper-generation, proved through silvester-word-reduction and integer-kernel-in-monomial-subgroup; no upper bound is imported from the calculation of K₂(ℚ).
4. The composite K_2(ℤ) → K_2(ℝ) → {±1} is then an isomorphism, which splits K_2(ℤ) → K_2(ℝ).

**Acceptance.**

- {−1, −1} ≠ 1 in K_2(ℤ), while {−1, −1}² = 1.
- A real place is one way, not the only way, to detect {−1, −1}: in K_2(ℤ[i]) it vanishes ({−1, −1} = {i, −1}² = 1), yet K_2(ℤ[√−7]) is cyclic of order two generated by {−1, −1} although ℚ(√−7) has no real place (Tate, cited in III.5.2.2).
- In the certificate format of ArithmeticKTheory N.6, which owns certificates (RT-AREA-ktheory-1/9): one generator {−1, −1}, the relation 2g = 0, span by integer-kernel-upper-generation and lower bound the real sign symbol; N.8 records that certificate and imports this node.


**Prerequisites.**

- [`K2SymbolsBrauer:T.5/real-sign-symbol`](#node-k2symbolsbrauer-t-5-real-sign-symbol)
- [`K2SymbolsBrauer:T.2/steinberg-symbol`](#node-k2symbolsbrauer-t-2-steinberg-symbol)
- [`K2SymbolsBrauer:T.1/k2-definition`](#node-k2symbolsbrauer-t-1-k2-definition)
- [`K2SymbolsBrauer:T.5/integer-kernel-upper-generation`](#node-k2symbolsbrauer-t-5-integer-kernel-upper-generation)


**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.5.2.2, Example 5.2.2 (PDF p. 226; book p. 218).
  Excerpt: “Example 5.2.2. The group K2(Z) is cyclic of order 2. This calculation uses the Euclidean algorithm to rewrite elements of St(Z), and is given in §10 of Milnor [131]. ... We will see in Example 6.2.1 below that {−1, −1} is still nonzero in K2(R).”
  Use: The statement and its cited proof; the source does not prove the upper bound.
- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.6.2.1, Example 6.2.1, continued (PDF p. 240; book p. 232).
  Excerpt: “The resulting map K2(R) → {±1} is onto because (−1, −1)∞ = −1. This shows that the symbol {−1, −1} in K2(Z) is nontrivial, as promised in 5.2.2, and even shows that K2(Z) is a direct summand in K2(R).”
  Use: The non-triviality and the splitting.
- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.5.2.2, Example 5.2.2, second paragraph (PDF p. 226; book p. 218).
  Excerpt: “Tate has used the same Euclidean algorithm type techniques to show that K2(Z[√−7]) and K2(Z[√−15]) are also cyclic of order 2, generated by the symbol {−1, −1}, while K2(R) = 1 for the imaginary quadratic rings R = Z[i], Z[√−3], Z[√−2] and Z[√−11].”
  Use: The imaginary quadratic examples used in the acceptance.
- [Milnor.1971](https://www.math.uni-bielefeld.de/~rehmann/DML/BOOKS/milnor.ocr.djvu), Corollary 10.2, p. 81, derived from Theorem 10.1 proved on p. 92.
  Excerpt: “cyclic of order 2”
  Use: Actual upper-bound proof, separately from the real sign lower bound.

<a id="node-k2symbolsbrauer-t-5-k2-of-the-rationals"></a>
### K_2 of the rationals (Application III.6.5.1)

`K2SymbolsBrauer:T.5/k2-of-the-rationals` · theorem · implementation unchecked

Planet: **K₂ of the rationals**.

The residue sum of the tame symbols gives a split exact sequence 1 → K_2(ℤ) → K_2(ℚ) → ⊕_p 𝔽_p^× → 1, split by the real sign symbol through the isomorphism K_2(ℤ) ≅ {±1} of T.5/k2-of-the-integers; hence K_2(ℚ) ≅ K_2(ℤ) ⊕ ⊕_p 𝔽_p^× ≅ ℤ/2 ⊕ ⊕_{p odd} 𝔽_p^× (𝔽_2^× being trivial), and K_2(ℚ) is infinite. ArithmeticKTheory N.8 imports this computation rather than repeating it.

**Hypotheses.**

- p runs over all primes (𝔽_2^× is trivial); exactness is the tame-kernel sequence for ℚ, which uses K_2(ℤ/p) = 1 and SK_1(ℤ) = 1.


**Construction and proof.**

1. Instance of T.5/tame-kernel-sequence for F = ℚ: HeightOneSpectrum ℤ is the set of primes and ℤ/(p) ≅ ZMod p.
2. Retraction: compose K_2(ℚ) → K_2(ℝ), the real sign symbol, and the inverse of the isomorphism K_2(ℤ) ≅ {±1}; a split short exact sequence of abelian groups gives the direct sum.
3. Infinite: there are infinitely many primes p ≥ 3, each with 𝔽_p^× ≠ 1, and the residue sum is onto.

**Acceptance.**

- {2, 3} is not in the image of K_2(ℤ): its tame symbol at 3 is −1 ≠ 1 in 𝔽_3^×.
- For an odd prime p, {−1, p} maps to the element −1 of 𝔽_p^× in the p-component and to 1 elsewhere.
- K_2(ℚ) is infinite while K_2(ℤ) has order two, the check ArithmeticKTheory N.8 asks for; the splitting uses the real place, and (p, q)_∞ = 1 for positive p, q.


**Prerequisites.**

- [`K2SymbolsBrauer:T.5/tame-kernel-sequence`](#node-k2symbolsbrauer-t-5-tame-kernel-sequence)
- [`K2SymbolsBrauer:T.5/k2-of-the-integers`](#node-k2symbolsbrauer-t-5-k2-of-the-integers)
- [`K2SymbolsBrauer:T.5/real-sign-symbol`](#node-k2symbolsbrauer-t-5-real-sign-symbol)
- [`K2SymbolsBrauer:T.2/k2-finite-field`](#node-k2symbolsbrauer-t-2-k2-finite-field)
- `KTheoryLowDegrees:U.4`
- [`K2SymbolsBrauer:T.1/k2-definition`](#node-k2symbolsbrauer-t-1-k2-definition)


**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.6.5.1, Application 6.5.1 (PDF p. 244; book p. 236).
  Excerpt: “Application 6.5.1 (K2Q). If R = Z then, since K2(Z/p) = 1 and SK1(Z) = 1, we have an exact sequence 1 → K2(Z) → K2(Q) −∂→ ∐ F×p → 1. As noted in Example 6.2.1, this sequence is split by the symbol (r, s)∞, so we have K2(Q) ≅ K2(Z) ⊕ ∐ F×p.”
  Use: The computation with its splitting.

<a id="stage-k2symbolsbrauer-t-6"></a>
## T.6 — Dennis–Stein symbols and relative groups

Develop the 1−rs convention, the relations and local presentation theorems, and the classical relative group for an ideal contained in the Jacobson radical. Square-zero computations use actual test rings. The Keune–Loday comparison to GeneralAlgebraicKTheory K.5’s homotopy fibre is a separate supply obligation.

Coverage: **partial**.

**Remaining proof and supply obligations.**

- Proof of (D1)–(D3) for a general commutative ring (Dennis–Stein, K-book [48]).
- Proof of Theorem III.5.11.1(a) for local rings that are not fields, and of III.5.11.1(b) (Keune [103]; Maazen–Stienstra).
- The Keune–Loday identification of K₂(R, I) with π₂ of the homotopy fibre (GeneralAlgebraicKTheory K.5), cited in K-book IV.1.11.
- Proofs of the square-zero test values Ex. III.5.14(a)–(c), which are exercises in the source.


<a id="node-k2symbolsbrauer-t-6-dennis-stein-symbol"></a>
### Dennis-Stein symbols

`K2SymbolsBrauer:T.6/dennis-stein-symbol` · definition · implementation unchecked

Planet: **Dennis-Stein symbols**.

For an associative unital ring R and commuting elements r, s of R with 1 − rs a unit, the Dennis-Stein symbol is ⟨r, s⟩ = x_ji(−s(1 − rs)⁻¹) x_ij(−r) x_ji(s) x_ij((1 − rs)⁻¹ r) (h_ij(1 − rs))⁻¹ in the stable Steinberg group St(R), for distinct indices i, j, where w_ij(u) = x_ij(u) x_ji(−u⁻¹) x_ij(u) and h_ij(u) = w_ij(u) w_ij(−1). Its image in E(R) is trivial — in the 2×2 block at (i, j) the four elementary factors multiply to diag(1 − rs, (1 − rs)⁻¹), which h_ij(1 − rs) cancels — so ⟨r, s⟩ lies in K_2(R). It does not depend on the choice of i ≠ j, it is 1 when r = 0 or s = 0, and when r is a unit it equals the Steinberg symbol {r, 1 − rs}; hence every Steinberg symbol {u, v} of commuting units is ⟨u, u⁻¹(1 − v)⟩. The convention is the modern one of the source. The pre-1980 symbol, defined when 1 + rs is a unit (the `1+ab` hypothesis of the stage text), is ⟨−r, s⟩⁻¹ in this notation; it is a different element and is not introduced as a second definition. The relations (D1)–(D3) are the node dennis-stein-relations and the relative symbol is in relative-steinberg-group.

**Hypotheses.**

- R is an associative unital ring; r and s commute and 1 − rs is a unit of R.
- i ≠ j are indices; the word is read in the stable Steinberg group St(R), and the element does not depend on i, j.
- The stage text's `1 + ab` invertibility hypothesis is the pre-1980 convention: for commuting a, b with 1 + ab a unit the old symbol is ⟨−a, b⟩⁻¹ in the notation used here, so that hypothesis is met through a ↦ −a.


**Construction and proof.**

1. Write the word in St(R) from the generators x_ij (K2SymbolsBrauer:T.1/steinberg-group-finite-rank, stabilised by K2SymbolsBrauer:T.1/stabilisation) and the elements w_ij, h_ij of K2SymbolsBrauer:T.2/steinberg-symbol.
2. Compute its image in E(R): with u = 1 − rs, the product e_ji(−s u⁻¹) e_ij(−r) e_ji(s) e_ij(u⁻¹ r) is diag(u, u⁻¹) at (i, j) — a direct 2×2 multiplication in which the off-diagonal entries vanish because rs = sr and u⁻¹ commutes with r and s — and φ(h_ij(u)) is the same diagonal matrix (K-book Example III.5.10.1). So the image is 1 and ⟨r, s⟩ ∈ K_2(R) (K2SymbolsBrauer:T.1/k2-definition).
3. Independence of i ≠ j: conjugate by w = w_ik(1) w_jl(1) w_kl(1)², which carries the word for (i, j) to the word for (k, l) by the identities of K-book Ex. III.5.8 (this is Ex. III.5.11); an element of K_2(R) is central (K2SymbolsBrauer:T.1/k2-is-centre), so the conjugate is the same element.
4. Degenerate values: x_ij(0) = 1 and h_ij(1) = w_ij(1) w_ij(−1) = 1 (Ex. III.5.8(a)), so ⟨r, 0⟩ = x_ij(−r) x_ij(r) = 1 and ⟨0, s⟩ = x_ji(−s) x_ji(s) = 1.
5. Unit case: for r a unit, rewrite the word with Ex. III.5.8 and Ex. III.5.9 into h_ij-form and compare with {r, s'} = h_ij(rs') h_ij(s')⁻¹ h_ij(r)⁻¹ to get ⟨r, s⟩ = {r, 1 − rs}, as Ex. III.5.11 asks; substituting s = u⁻¹(1 − v) gives {u, v} = ⟨u, u⁻¹(1 − v)⟩.
6. Record the convention: the modern ⟨r, s⟩ is ⟨−r, s⟩⁻¹ of the pre-1980 literature (K-book III.5.11), and state that translation as a lemma rather than defining a second symbol.

**Acceptance.**

- ⟨r, s⟩ lies in K_2(R) and does not depend on i ≠ j.
- ⟨r, 0⟩ = ⟨0, s⟩ = 1.
- For a unit r, ⟨r, s⟩ = {r, 1 − rs}; for commuting units, {u, v} = ⟨u, u⁻¹(1 − v)⟩.
- In K_2(ℤ), ⟨−1, −2⟩ = {−1, −1} ≠ 1, while the pre-1980 symbol at the same pair is trivial in K_2(ℚ).


**Prerequisites.**

- [`K2SymbolsBrauer:T.1/steinberg-group-finite-rank`](#node-k2symbolsbrauer-t-1-steinberg-group-finite-rank)
- [`K2SymbolsBrauer:T.1/stabilisation`](#node-k2symbolsbrauer-t-1-stabilisation)
- [`K2SymbolsBrauer:T.1/k2-definition`](#node-k2symbolsbrauer-t-1-k2-definition)
- [`K2SymbolsBrauer:T.1/k2-is-centre`](#node-k2symbolsbrauer-t-1-k2-is-centre)
- [`K2SymbolsBrauer:T.2/steinberg-symbol`](#node-k2symbolsbrauer-t-2-steinberg-symbol)
- [`K2SymbolsBrauer:T.2:symbols/diagonal-lift-words`](#node-k2symbolsbrauer-t-2-symbols-diagonal-lift-words)
- [`K2SymbolsBrauer:T.2:symbols/diagonal-lift`](#node-k2symbolsbrauer-t-2-symbols-diagonal-lift)


**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.K2.dennisStein` | constructor | For commuting r, s : R and a proof that 1 − r s is a unit, the element ⟨r, s⟩ : K₂(R). |
| `TauCeti.K2.coe_dennisStein` | characterisation | (⟨r, s⟩ : St(R)) = x_ji(−s u⁻¹) x_ij(−r) x_ji(s) x_ij(u⁻¹ r) h_ij(u)⁻¹ with u = 1 − r s, for any i ≠ j. |
| `TauCeti.K2.dennisStein_index_indep` | characterisation | The words for (i, j) and for (k, l) are equal in St(R). |
| `TauCeti.K2.phi_dennisSteinWord` | characterisation | The image in E(R) of x_ji(−s u⁻¹) x_ij(−r) x_ji(s) x_ij(u⁻¹ r) is diag(u, u⁻¹) at (i, j). |
| `TauCeti.K2.dennisStein_zero_left` | simp | ⟨0, s⟩ = 1. |
| `TauCeti.K2.dennisStein_zero_right` | simp | ⟨r, 0⟩ = 1. |
| `TauCeti.K2.dennisStein_eq_steinbergSymbol` | compatibility | For a unit r, ⟨r, s⟩ = {r, 1 − r s}. |
| `TauCeti.K2.steinbergSymbol_eq_dennisStein` | compatibility | For commuting units u, v, {u, v} = ⟨u, u⁻¹ (1 − v)⟩. |
| `TauCeti.K2.map_dennisStein` | functoriality | For a ring homomorphism f : R → R', K₂(f) ⟨r, s⟩ = ⟨f r, f s⟩. |
| `TauCeti.K2.dennisStein_neg_inv` | relation | The translation of the pre-1980 hypothesis: if 1 + ab is a unit then so is 1 − (−a)b, so the old symbol of (a, b) is ⟨−a, b⟩⁻¹. No second symbol is defined, so this is a statement about hypotheses, not an identity. |

**Consumers.**

- T.6, the presentation theorem — K₂ of a field or a commutative local ring is presented by these symbols and (D1)–(D3)
- T.6, relative-steinberg-group and the square-zero tests — the relative symbol ⟨r, s⟩ ∈ K₂(R, I), s ∈ I, is this word read in the relative Steinberg group
- K-book Ex. III.5.13 — K₂(ℤ/4) ≅ {±1} on {−1, −1} = ⟨−1, −2⟩ = ⟨2, 2⟩
- RefinedTraceMethods RT.3 — RT.3 compares its square-zero boundary maps with the low-degree K₂ symbol calculations: it consumes T.6 and is not a prerequisite of it


**Unit tests.**

- `TauCeti.K2.phi_dennisSteinWord_two` (characterisation) — In GL₂(R), with u = 1 − r s a unit and r s = s r, e₂₁(−s u⁻¹) e₁₂(−r) e₂₁(s) e₁₂(u⁻¹ r) = diag(u, u⁻¹); a word with one sign or one factor changed fails this.
- `TauCeti.K2.dennisStein_zero` (degenerate) — ⟨r, 0⟩ = 1 and ⟨0, s⟩ = 1 for all r, s.
- `TauCeti.K2.dennisStein_neg_one_neg_two` (computation) — In K₂(ℤ): ⟨−1, −2⟩ = {−1, 1 − (−1)(−2)} = {−1, −1}, which is non-trivial because the sign symbol of K2SymbolsBrauer:T.5/real-sign-symbol sends it to −1.
- `TauCeti.K2.dennisStein_not_old_convention` (non-example) — At (−1, −2) in ℚ the pre-1980 symbol is ⟨1, −2⟩⁻¹ = {1, 3}⁻¹ = 1 (1 + (−1)(−2) = 3 is a unit), while the modern ⟨−1, −2⟩ = {−1, −1} ≠ 1 in K₂(ℚ); and over ℤ the modern symbol is defined at (1, 2) because 1 − 2 = −1 is a unit, where the old hypothesis 1 + 2 = 3 fails. An implementation of the old convention fails both.
- `TauCeti.K2.steinbergSymbol_two_three` (compatibility) — In K₂(ℚ), {2, 3} = ⟨2, −1⟩, the case u = 2, v = 3 of {u, v} = ⟨u, u⁻¹(1 − v)⟩.


**Suggested placement.** module: `TauCeti/Algebra/KTheory/RelativeK2`; namespace: `TauCeti.K2`.

**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.5.11 (PDF p. 234).
  Excerpt: “Definition 5.11 (Dennis-Stein symbols). If r, s ∈ R commute and 1 − rs is a unit then the element ... of St(R) belongs to K2(R), because φ⟨r, s⟩ = 1. By Ex. 5.11, it is independent of the choice of i ≠ j, and if r is a unit of R then ⟨r, s⟩ = {r, 1 − rs}.”
  Use: The definition, membership in K2, independence of the indices and the unit case; the displayed word is written out in the statement.
- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.5.11 (PDF p. 234).
  Excerpt: “We warn the reader that the meaning of the symbol ⟨r, s⟩ changed circa 1980. We use the modern definition of this symbol, which equals ⟨−r, s⟩−1 in the old literature, including that of loc. cit.”
  Use: The modern convention and its translation from the pre-1980 one, which the stage text's 1 + ab hypothesis belongs to.

<a id="node-k2symbolsbrauer-t-6-dennis-stein-relations"></a>
### The Dennis-Stein relations (D1)–(D3)

`K2SymbolsBrauer:T.6/dennis-stein-relations` · theorem · implementation unchecked

For a commutative ring R the Dennis-Stein symbols satisfy (D1) ⟨r, s⟩⟨s, r⟩ = 1 when 1 − rs is a unit; (D2) ⟨r, s⟩⟨r, t⟩ = ⟨r, s + t − rst⟩ when 1 − rs and 1 − rt are units, the right side being defined because 1 − r(s + t − rst) = (1 − rs)(1 − rt); and (D3) ⟨r, st⟩ = ⟨rs, t⟩⟨tr, s⟩ when 1 − rst is a unit. Consequently ⟨r, 1⟩ = 1 whenever 1 − r is a unit (D3 with s = t = 1), which the source prints as ⟨r, 1⟩ = 0. When every entry involved is a unit or zero — in particular over a field — the relations follow from the unit case of the definition together with bilinearity and the Steinberg identity of Steinberg symbols. For a general commutative ring they are the identities of Dennis and Stein, which the source cites and does not prove.

**Hypotheses.**

- R is a commutative ring. The source displays (D1)–(D3) without hypotheses and cites Dennis–Stein, who work with commutative rings; the relations are not asserted for merely commuting elements of a noncommutative ring.
- Each symbol written is defined: the relevant 1 − rs, 1 − rt, 1 − rst are units.


**Construction and proof.**

1. Entries units or zero: a symbol with a zero entry is 1 (dennisStein_zero_left/right), and both sides of each relation are then 1 (for (D3) with r = 0 it reads 1 = 1·1). Otherwise substitute ⟨r, s⟩ = {r, 1 − rs}: (D1) {r, 1 − rs}{s, 1 − rs} = {rs, 1 − rs} = 1 by bilinearity and the Steinberg identity; (D2) {r, 1 − rs}{r, 1 − rt} = {r, (1 − rs)(1 − rt)} = {r, 1 − r(s + t − rst)}; (D3) {rs, 1 − rst}{tr, 1 − rst} = {r²st, 1 − rst} = {r, 1 − rst}{rst, 1 − rst} = {r, 1 − rst}.
2. General commutative ring: import (D1)–(D3) from Dennis and Stein (K-book reference [48], LNM 342), as the source does. The proof is a computation in St(R) that the source does not reproduce; recorded as a gap.
3. Derive ⟨r, 1⟩ = 1 from (D3) with s = t = 1 when 1 − r is a unit, and ⟨1, s⟩ = {1, 1 − s} = 1 from the unit case when 1 − s is a unit.

**Acceptance.**

- In K₂(ℤ/4): (D3) with (r, s, t) = (2, 1, 1) gives ⟨2, 1⟩ = 1; (D2) with (2, 1, 2) gives ⟨2, 1⟩⟨2, 2⟩ = ⟨2, −1⟩; (D3) with (2, −1, −1) gives ⟨2, −1⟩² = ⟨2, 1⟩ = 1 (since −2 = 2); (D1) gives ⟨2, −1⟩ = ⟨−1, 2⟩⁻¹ = ⟨−1, 2⟩; and 2 = −2, so ⟨2, 2⟩ = ⟨−1, −2⟩ = {−1, −1}, the identity of K-book Ex. III.5.13.
- ⟨r, 1⟩ = 1 when 1 − r is a unit; it is not a separate generator and not '0'.
- Over a field the relations are consequences of the Steinberg relations; no relation beyond (D1)–(D3) is claimed.


**Prerequisites.**

- [`K2SymbolsBrauer:T.6/dennis-stein-symbol`](#node-k2symbolsbrauer-t-6-dennis-stein-symbol)
- [`K2SymbolsBrauer:T.2/steinberg-symbol`](#node-k2symbolsbrauer-t-2-steinberg-symbol)
- [`K2SymbolsBrauer:T.2/steinberg-identity`](#node-k2symbolsbrauer-t-2-steinberg-identity)


**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.5.11 (PDF p. 234).
  Excerpt: “These elements are called Dennis-Stein symbols because they were first studied in [48], where the following identities were established. (D1) ⟨r, s⟩⟨s, r⟩= 1 (D2) ⟨r, s⟩⟨r, t⟩= ⟨r, s + t −rst⟩ (D3) ⟨r, st⟩= ⟨rs, t⟩⟨tr, s⟩(this holds in K2(R, I) if any of r, s, or t are in I.)”
  Use: The three relations, which the source cites to Dennis and Stein without proof.
- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.5.11 (PDF p. 234).
  Excerpt: “By (D3) of our definition, ⟨r, 1⟩=0 for all r.”
  Use: The consequence of (D3); the printed '=0' is a misprint for '= 1' (source issue), valid when 1 − r is a unit.
- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), Ex. III.5.13 (PDF p. 237).
  Excerpt: “If n ≥ 2, show that K2(Z/2n) ∼= K2(Z/4) ∼= {±1} on {−1, −1} = ⟨−1, −2⟩ = ⟨2, 2⟩.”
  Use: The nilpotent relative example; the identity of the three elements is derived in dennis-stein-relations.

<a id="node-k2symbolsbrauer-t-6-dennis-stein-presentation"></a>
### Presentation of K_2 of a field or a commutative local ring by Dennis-Stein symbols

`K2SymbolsBrauer:T.6/dennis-stein-presentation` · theorem · implementation unchecked

Theorem III.5.11.1(a). Let R be a commutative local ring, or a field. Then the homomorphism to K₂(R) from the abelian group D(R) generated by symbols ⟨r, s⟩ (r, s ∈ R with 1 − rs a unit) subject only to (D1), (D2) and (D3), sending each generator to the Dennis-Stein symbol, is an isomorphism. For a field this is equivalent to Matsumoto's theorem through ⟨r, s⟩ ↦ {r, 1 − rs} for r ≠ 0, ⟨0, s⟩ ↦ 1, and {a, b} ↦ ⟨a, a⁻¹(1 − b)⟩, and it is proved that way. For a commutative local ring that is not a field it is the theorem the source attributes to Maazen, Stienstra and van der Kallen, with Keune [103] as the correct reference; it is cited, not proved. No presentation is asserted for any other ring, and the source states none under a stable-range hypothesis.

**Hypotheses.**

- R is a commutative local ring, or a field.


**Construction and proof.**

1. The map D(R) → K₂(R) is well defined by K2SymbolsBrauer:T.6/dennis-stein-relations.
2. Field case, inverse map: through Matsumoto's presentation (K2SymbolsBrauer:T.2/matsumoto) send {a, b} to ⟨a, a⁻¹(1 − b)⟩, which is defined because 1 − a·a⁻¹(1 − b) = b. It is multiplicative in b by (D2), since with s = a⁻¹(1 − b), t = a⁻¹(1 − c) one has s + t − ast = a⁻¹(1 − bc). It is multiplicative in a by (D3) with (r, s, t) = (a, b, (ab)⁻¹(1 − c)) and (D1): ⟨a, a⁻¹(1 − c)⟩ = ⟨ab, (ab)⁻¹(1 − c)⟩⟨b⁻¹(1 − c), b⟩ and ⟨b⁻¹(1 − c), b⟩ = ⟨b, b⁻¹(1 − c)⟩⁻¹. It kills {a, 1 − a} because ⟨a, 1⟩ = 1.
3. Field case, the composites are identities: {a, b} ↦ ⟨a, a⁻¹(1 − b)⟩ ↦ {a, b} by the unit case; ⟨r, s⟩ ↦ {r, 1 − rs} ↦ ⟨r, s⟩ for r ≠ 0; and ⟨0, s⟩ = 1 already in D(F), because (D3) with (r, s, t) = (0, 0, s) reads ⟨0, 0⟩ = ⟨0, s⟩⟨0, 0⟩.
4. Commutative local ring that is not a field: cite Theorem III.5.11.1(a) as the source does; the proof (Keune [103]; Maazen–Stienstra; van der Kallen) was not obtained and is recorded as a gap.
5. Record the boundary the stage text asks for: the source's presentation theorems are (a) for commutative local rings and fields and (b) for radical ideals (K2SymbolsBrauer:T.6/relative-presentation); no stable-range version is stated there, none is planned, and Matsumoto's field presentation is not extended to any other ring.

**Acceptance.**

- For a field the Dennis-Stein and Matsumoto presentations correspond under {a, b} ↔ ⟨a, a⁻¹(1 − b)⟩, with ⟨0, s⟩ = 1.
- For a local ring that is not a field the statement is cited, with the reference the source names.
- No presentation is asserted outside the stated hypotheses.


**Prerequisites.**

- [`K2SymbolsBrauer:T.6/dennis-stein-symbol`](#node-k2symbolsbrauer-t-6-dennis-stein-symbol)
- [`K2SymbolsBrauer:T.6/dennis-stein-relations`](#node-k2symbolsbrauer-t-6-dennis-stein-relations)
- [`K2SymbolsBrauer:T.2/matsumoto`](#node-k2symbolsbrauer-t-2-matsumoto)


**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.5.11.1(a) (PDF p. 234).
  Excerpt: “Theorem 5.11.1. (a) Let R be a commutative local ring, or a field. Then K2(R) may be presented as the abelian group generated by the symbols ⟨r, s⟩ with r, s ∈ R such that 1 − rs is a unit, subject only to the relations (D1), (D2) and (D3).”
  Use: The theorem with its hypotheses, verbatim.
- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.5.11 (PDF p. 234).
  Excerpt: “The following result is essentially due to Maazen, Stienstra and van der Kallen. However, their work preceded the correct definition of K2(R, I) so the correct historical reference is [103].”
  Use: The attribution; the source gives no proof. [103] is F. Keune, The relativization of K2, J. Algebra 54 (1978), 159–177.

<a id="node-k2symbolsbrauer-t-6-relative-steinberg-group"></a>
### The relative Steinberg group and relative K_2 of an ideal

`K2SymbolsBrauer:T.6/relative-steinberg-group` · definition · implementation unchecked

Planet: **Relative Steinberg group**.

For a ring R and a two-sided ideal I, let R ⊕ I be the double ring with multiplication (r, x)(s, y) = (rs, ry + xs + xy), with pr(r, x) = r and add(r, x) = r + x. St′(R, I) is the normal subgroup of St(R ⊕ I) generated by the x_ij(0, v), v ∈ I; it is the kernel of St(pr). The relative Steinberg group St(R, I) is the quotient of St′(R, I) by the normal subgroup generated by the cross-commutators [x_ij(0, u), x_kl(v, −v)], u, v ∈ I (Keune and Loday's definition). St(add) induces St(R, I) → St(R), whose image is the normal subgroup generated by the x_ij(v), v ∈ I, and whose composite with St(R) → E(R) lands in E(R, I). K₂(R, I) is the kernel of St(R, I) → E(R, I). For s ∈ I and r commuting with s with 1 − rs a unit, the relative Dennis-Stein symbol ⟨r, s⟩ ∈ K₂(R, I) is the class of the Dennis-Stein word of ((r, 0), (0, s)) in St(R ⊕ I); it lies in St′(R, I) because pr sends it to ⟨r, 0⟩ = 1, and add sends it to ⟨r, s⟩ ∈ K₂(R). K₂(R, I) fits into the exact sequence K₂(R, I) → K₂(R) → K₂(R/I) → K₁(R, I) → K₁(R) → K₁(R/I) of Theorem III.5.7.1. Its identification with π₂ of the homotopy fibre of K(R) → K(R/I) (GeneralAlgebraicKTheory K.5) is due to Keune and Loday, cited in the source, and is a gap here.

**Hypotheses.**

- R is an associative unital ring and I a two-sided ideal; E(R, I), GL(I) and K₁(R, I) are those of KTheoryLowDegrees U.5.
- For the relative symbol: s ∈ I, r ∈ R commutes with s, and 1 − rs is a unit of R.


**Construction and proof.**

1. Form R ⊕ I, pr and add; St(pr) is split by St of the inclusion r ↦ (r, 0), and its kernel is the normal closure of the x_ij(0, v), giving the exact sequence 1 → St′(R, I) → St(R ⊕ I) → St(R) → 1 of the source (functoriality of K2SymbolsBrauer:T.1/stabilisation).
2. St(add) kills the cross-commutators, since it sends x_ij(0, u) to x_ij(u) and x_kl(v, −v) to x_kl(0) = 1, so it descends to St(R, I) → St(R); its image is the normal closure of the x_ij(v), v ∈ I.
3. Define K₂(R, I) as the kernel of St(R, I) → E(R, I) ⊆ E(R) (KTheoryLowDegrees:U.5).
4. Relative symbol: 1 − (r, 0)(0, s) = (1, −rs) is a unit of R ⊕ I with inverse (1, rs(1 − rs)⁻¹), which lies in 1 ⊕ I because I is an ideal; so the Dennis-Stein word of ((r, 0), (0, s)) is defined, lies in St′(R, I), and has trivial image in E(R, I).
5. Exactness (Theorem III.5.7.1): the Snake Lemma on the commutative diagram with rows K₂ → St → GL → K₁ for (R, I), R and R/I, with Ex. III.5.1, as in the source.

**Acceptance.**

- K₂(R, 0) is trivial.
- The image of K₂(R, I) → K₂(R) is the kernel of K₂(R) → K₂(R/I).
- For s ∈ I the relative symbol maps to the absolute Dennis-Stein symbol ⟨r, s⟩.


**Prerequisites.**

- [`K2SymbolsBrauer:T.1/steinberg-group-finite-rank`](#node-k2symbolsbrauer-t-1-steinberg-group-finite-rank)
- [`K2SymbolsBrauer:T.1/stabilisation`](#node-k2symbolsbrauer-t-1-stabilisation)
- [`K2SymbolsBrauer:T.1/k2-definition`](#node-k2symbolsbrauer-t-1-k2-definition)
- [`K2SymbolsBrauer:T.6/dennis-stein-symbol`](#node-k2symbolsbrauer-t-6-dennis-stein-symbol)
- `KTheoryLowDegrees:U.5`


**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.K2.RelSteinberg` | data | St(R, I): the normal closure of the x_ij(0, v) in St(R ⊕ I), modulo the cross-commutators [x_ij(0, u), x_kl(v, −v)]. |
| `TauCeti.K2.RelSteinberg.add` | projection | The homomorphism St(R, I) → St(R) induced by add. |
| `TauCeti.K2.RelSteinberg.range_add` | characterisation | Its range is the normal subgroup of St(R) generated by the x_ij(v), v ∈ I. |
| `TauCeti.K2.relK2` | data | K₂(R, I), the kernel of St(R, I) → E(R, I). |
| `TauCeti.K2.relK2.toK2` | projection | The map K₂(R, I) → K₂(R). |
| `TauCeti.K2.relK2.exact` | structure | Exactness of K₂(R, I) → K₂(R) → K₂(R/I) → K₁(R, I) → K₁(R) → K₁(R/I) (Theorem III.5.7.1). |
| `TauCeti.K2.relK2.map` | functoriality | A ring homomorphism f : R → R' with f(I) ⊆ I' induces K₂(R, I) → K₂(R', I'), with map_id and map_comp. |
| `TauCeti.K2.relK2_bot` | simp | K₂(R, ⊥) is trivial. |
| `TauCeti.K2.relDennisStein` | constructor | For s ∈ I, r commuting with s and 1 − r s a unit, the relative symbol ⟨r, s⟩ ∈ K₂(R, I). |
| `TauCeti.K2.toK2_relDennisStein` | compatibility | relK2.toK2 ⟨r, s⟩ = ⟨r, s⟩. |

**Consumers.**

- T.6, relative-presentation — Theorem III.5.11.1(b) presents this group for a radical ideal
- T.6, relative-square-zero — the square-zero test values are computations of K₂(A, I) for I² = 0
- GeneralAlgebraicKTheory K.5 — the homotopy-fibre relative K₂ of the pair is compared with this group (Keune–Loday), which is what makes the T.6 examples tests of K.5


**Unit tests.**

- `TauCeti.K2.relK2_zero_ideal` (degenerate) — For I = 0, St′(R, 0) is generated by x_ij(0, 0) = 1, so St(R, 0) and K₂(R, 0) are trivial.
- `TauCeti.K2.relK2_Z4` (computation) — For R = ℤ/4 and I = 2ℤ/4: K₂(ℤ/2) = 1 (K2SymbolsBrauer:T.2/k2-finite-field), so by exactness K₂(ℤ/4, I) → K₂(ℤ/4) is onto, and the relative symbol ⟨2, 2⟩ maps to ⟨2, 2⟩ = {−1, −1}.
- `TauCeti.K2.RelSteinberg.range_add_top` (characterisation) — For I = R the range of St(R, R) → St(R) is all of St(R), and for I = 0 it is trivial.


**Suggested placement.** module: `TauCeti/Algebra/KTheory/RelativeK2`; namespace: `TauCeti.K2`.

**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.5.7 (PDF p. 230).
  Excerpt: “Let St′(R, I) denote the normal subgroup of St(R ⊕ I) generated by all xij(0, v) with v ∈ I.”
  Use: The subgroup St′(R, I) of the double ring's Steinberg group.
- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.5.7 (PDF p. 230).
  Excerpt: “Definition 5.7. The relative Steinberg group St(R, I) is defined to be the quotient of St′(R, I) by the normal subgroup generated by all “cross-commutators” [xij(0, u), xkl(v, −v)] with u, v ∈ I.”
  Use: The definition, verbatim (Keune and Loday's, modifying Milnor's).
- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.5.7 (PDF p. 230).
  Excerpt: “We define K2(R, I) to be the kernel of the map St(R, I) → E(R, I).”
  Use: The relative K2.
- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.5.7.1 (PDF p. 231).
  Excerpt: “Theorem 5.7.1. If I is an ideal of a ring R, then the exact sequence of Proposition 2.3 extends to an exact sequence K2(R, I) → K2(R) → K2(R/I) → K1(R, I) → K1(R) → K1(R/I) → K0(I) · · ·”
  Use: The exact sequence, proved in the source by the Snake Lemma.
- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.5.11 (PDF p. 234).
  Excerpt: “If I is an ideal of R and s ∈ I then we can even consider ⟨r, s⟩ as an element of K2(R, I); see 5.7.”
  Use: The relative Dennis-Stein symbol.
- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), IV.1.11 (PDF p. 276).
  Excerpt: “Keune and Loday have shown that K2(R, I) agrees with the relative group defined in III. 5.7.”
  Use: The comparison of the homotopy-fibre relative K2 with Definition III.5.7, cited, not proved.

<a id="node-k2symbolsbrauer-t-6-relative-presentation"></a>
### Presentation of relative K_2 of a radical ideal

`K2SymbolsBrauer:T.6/relative-presentation` · theorem · implementation unchecked

Theorem III.5.11.1(b). Let I be a radical ideal (contained in the Jacobson radical) of a commutative ring R. Then K₂(R, I) is the abelian group generated by the relative Dennis-Stein symbols ⟨r, s⟩ with r ∈ R and s ∈ I, or r ∈ I and s ∈ R, subject only to (D1), (D2), and (D3) whenever r, s or t lies in I. For such pairs 1 − rs is automatically a unit, since rs lies in I and so in the Jacobson radical. The source states this theorem with part (a), attributes it as there, and does not prove it.

**Hypotheses.**

- R is a commutative ring and I ⊆ R an ideal contained in the Jacobson radical of R.


**Construction and proof.**

1. Generators: the symbols with s ∈ I are the relative symbols of K2SymbolsBrauer:T.6/relative-steinberg-group; those with r ∈ I are the words of ((0, r), (s, 0)) in St(R ⊕ I), whose image under pr is ⟨0, s⟩ = 1.
2. The relations hold in K₂(R, I): use the relative form of T.6/dennis-stein-relations. In D3 require hI3 : r ∈ I ∨ s ∈ I ∨ t ∈ I, as III.5.11.1(b) does. Derive the three pair-membership witnesses by ideal closure; their admissibility alone is not a hypothesis permitting D3. For quotient descent, check D1 and D2 as before and split D3 on hI3, using D1 to swap ideal entries where needed. This checks only the source-allowed relation set; completeness remains the cited-source gap.
3. Completeness of the relations: cite Theorem III.5.11.1(b); the proof (Keune [103]; Maazen–Stienstra) was not obtained and is recorded as a gap.

**Acceptance.**

- For I = 0 the presentation gives the trivial group.
- For I² = 0 it specialises to K2SymbolsBrauer:T.6/relative-square-zero.
- It is asserted only for a radical ideal of a commutative ring.
- Non-example: R = F_3[x,y]/(x²,y²), z = xy, I = (z), r = x, s = y, t = x+y. Here I² = 0 and I lies in the Jacobson radical; rs = st = tr = z but no entry is in I, so this triple is not admitted as relative D3. In the differential detector I ⊗_R Ω¹_{(R/I)/ℤ} ≅ F_3², ⟨x,z⟩−⟨z,x+y⟩−⟨z,y⟩ has image (1,1), not 0.


**Prerequisites.**

- [`K2SymbolsBrauer:T.6/relative-steinberg-group`](#node-k2symbolsbrauer-t-6-relative-steinberg-group)
- [`K2SymbolsBrauer:T.6/dennis-stein-relations`](#node-k2symbolsbrauer-t-6-dennis-stein-relations)
- `mathlib:DualNumber`
- `mathlib:DualNumber.eps`
- `mathlib:Ideal.mul_mem_left`
- `mathlib:Ideal.mul_mem_right`


**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.K2.RelDSGen` | data | The subtype of R × R with at least one entry in I. |
| `TauCeti.K2.relDSRel` | relation | D1 and D2 on relative generators and D3 only for r ∈ I ∨ s ∈ I ∨ t ∈ I. The three generator witnesses for D3 are derived from that entry condition, never used as a weaker substitute. |
| `TauCeti.K2.relDennisSteinGroup` | data | FreeAbelianGroup (RelDSGen I) modulo AddSubgroup.closure (relDSRel I), with the guarded D3 set. |
| `TauCeti.K2.relDennisSteinGroup.toRelK2` | compatibility | For I ≤ Ideal.jacobson ⊥, the relative generator map descends through exactly the source-allowed D1–D3 relations. Bijectivity is relative_presentation; its cited completeness proof remains unobtained. |

**Unit tests.**

- `TauCeti.K2.relative_D3_guard` (non-example) — On the actual ring DualNumber (DualNumber (ZMod 3)), let x be the inner epsilon, y the outer epsilon and I = (xy). The three D3 pairs for (x,y,x+y) are admissible but x, y and x+y are outside I; the corrected D3 clause rejects the triple.
- `TauCeti.K2.relative_D3_detector` (computation) — For the same ring/ideal, in the basis xy⊗dx, xy⊗dy of I ⊗_R Ω¹_{(R/I)/ℤ}, δ⟨x,xy⟩ = (2,0), δ⟨xy,x+y⟩ = (1,1), δ⟨xy,y⟩ = (0,1). The extra D3 defect is (1,1) ≠ 0; all source-allowed D1/D2/D3 defects vanish.
- `TauCeti.K2.relative_presentation_bot` (degenerate) — For I = ⊥, relDennisSteinGroup I and relative K₂ are trivial; the guarded quotient has no spurious nonzero generators.


**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.5.11.1(b) (PDF p. 235).
  Excerpt: “Let I be a radical ideal, contained in a commutative ring R. Then K2(R, I) may be presented as the abelian group generated by the symbols ⟨r, s⟩ with either r ∈ R and s ∈ I, or else r ∈ I and s ∈ R. ... subject only to the relations (D1), (D2), and the relation (D3) whenever r, s, or t is in I.”
  Use: Part (b) of the theorem with its hypotheses; stated, not proved.
- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.5.11 (PDF p. 234).
  Excerpt: “The following result is essentially due to Maazen, Stienstra and van der Kallen. However, their work preceded the correct definition of K2(R, I) so the correct historical reference is [103].”
  Use: The attribution; the source gives no proof. [103] is F. Keune, The relativization of K2, J. Algebra 54 (1978), 159–177.
- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), Exercise III.5.14(a), PDF p. 237 (printed p. 229).
  Excerpt: “sending ⟨x, r⟩ to x ⊗ dr (r ∈ R, x ∈ I).”
  Use: Primary-source differential detector δ⟨i,a⟩ = i⊗dā for the relative-D3 non-example; the F_3² tensor calculation and exhaustive finite-ring checks are derived here, not quoted as a worked example from the source.

<a id="node-k2symbolsbrauer-t-6-relative-square-zero"></a>
### Square-zero ideals: the simplified relations and the source's test values

`K2SymbolsBrauer:T.6/relative-square-zero` · application · implementation unchecked

Let A be a commutative ring and I an ideal with I² = 0; the test instance is A = TrivSqZeroExt R M (R commutative, M an R-module) with I = TrivSqZeroExt.kerIdeal R M, whose square is zero. Then I is a radical ideal; every ⟨a, s⟩ with a ∈ A, s ∈ I is defined, since 1 − as has inverse 1 + as; ⟨s, a⟩ = ⟨a, s⟩⁻¹; and s ↦ ⟨a, s⟩ is additive on I, because the term ast of (D2) lies in I² = 0. So by K2SymbolsBrauer:T.6/relative-presentation, K₂(A, I) is generated by the ⟨a, s⟩ with a ∈ A and s ∈ I. The source's test values, all stated as exercises, are: a surjection K₂(A, I) → I ⊗_A Ω¹_{A/I}, ⟨x, r⟩ ↦ x ⊗ dr, for any radical ideal (Ex. III.5.14(a)); for I² = 0 its kernel is generated by the ⟨x, y⟩ with x, y ∈ I (Ex. III.5.14(b)); for the dual numbers R[ε] with 1/2 ∈ R the map K₂(R[ε], ε) → Ω¹_R is an isomorphism (van der Kallen, Ex. III.5.14(c)); and K₂(ℤ/2ⁿ) ≅ K₂(ℤ/4) ≅ {±1} for n ≥ 2, on {−1, −1} = ⟨−1, −2⟩ = ⟨2, 2⟩ (Ex. III.5.13). These test the relative theory, and GeneralAlgebraicKTheory K.5's relative K₂ through the Keune–Loday comparison; they extend no field presentation to a general ring.

**Hypotheses.**

- A is a commutative ring and I ⊆ A an ideal with I² = 0 (Theorem III.5.11.1(b) needs A commutative).
- The test ring is Mathlib's TrivSqZeroExt R M with I = TrivSqZeroExt.kerIdeal R M, for R commutative and M an R-module with the central bimodule structure, so that TrivSqZeroExt R M is commutative.


**Construction and proof.**

1. I lies in the Jacobson radical because each s ∈ I has s² = 0; for a ∈ A and s ∈ I, (1 − as)(1 + as) = 1 − a²s² = 1.
2. For s, t ∈ I, (D2) reads ⟨a, s⟩⟨a, t⟩ = ⟨a, s + t⟩ because ast ∈ I² = 0, and (D1) gives ⟨s, a⟩ = ⟨a, s⟩⁻¹; so the generators with first entry in I are redundant, and K₂(A, I) is generated by the ⟨a, s⟩, s ∈ I (K2SymbolsBrauer:T.6/relative-presentation).
3. Instantiate A = TrivSqZeroExt R M: it is commutative (TrivSqZeroExt.commRing), kerIdeal R M has square zero (TrivSqZeroExt.kerIdeal_sq), and an element is a unit exactly when its first coordinate is (TrivSqZeroExt.isUnit_iff_isUnit_fst).
4. State the source's test values (Ex. III.5.13, Ex. III.5.14(a)–(c)) as acceptance statements. They are exercises in the source and their proofs are not supplied here, except ⟨2, 2⟩ = ⟨−1, −2⟩ = {−1, −1} in K₂(ℤ/4), which K2SymbolsBrauer:T.6/dennis-stein-relations derives.
5. The comparison of these computations with the boundary maps of the trace comparison is RefinedTraceMethods RT.3's own test, and RT.3 consumes this node; it is not performed here.

**Acceptance.**

- For I = 0 the relative group is trivial.
- For s, t ∈ I, ⟨a, s⟩⟨a, t⟩ = ⟨a, s + t⟩.
- For A = ℤ/4 and I = 2ℤ/4: I² = 0 and Ω¹ of 𝔽₂ is 0, so by Ex. III.5.14(a),(b) K₂(ℤ/4, I) is generated by ⟨2, 2⟩, which maps to {−1, −1} in K₂(ℤ/4).
- For the dual numbers, K₂(ℚ[ε], ε) ≅ Ω¹ of ℚ = 0, while K₂(ℚ(t)[ε], ε) ≅ Ω¹ of ℚ(t) ≠ 0 (⟨ε, t⟩ ↦ dt), by the van der Kallen isomorphism of Ex. III.5.14(c) as cited.
- No presentation of K₂ of a general ring is claimed.


**Prerequisites.**

- [`K2SymbolsBrauer:T.6/relative-steinberg-group`](#node-k2symbolsbrauer-t-6-relative-steinberg-group)
- [`K2SymbolsBrauer:T.6/relative-presentation`](#node-k2symbolsbrauer-t-6-relative-presentation)
- [`K2SymbolsBrauer:T.6/dennis-stein-relations`](#node-k2symbolsbrauer-t-6-dennis-stein-relations)
- `mathlib:TrivSqZeroExt`
- `mathlib:TrivSqZeroExt.commRing`
- `mathlib:TrivSqZeroExt.kerIdeal`
- `mathlib:TrivSqZeroExt.kerIdeal_sq`
- `mathlib:TrivSqZeroExt.isUnit_iff_isUnit_fst`
- `GeneralAlgebraicKTheory:K.5`


**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.5.11.1(b) (PDF p. 235).
  Excerpt: “Let I be a radical ideal, contained in a commutative ring R. Then K2(R, I) may be presented as the abelian group generated by the symbols ⟨r, s⟩ with either r ∈ R and s ∈ I, or else r ∈ I and s ∈ R. ... subject only to the relations (D1), (D2), and the relation (D3) whenever r, s, or t is in I.”
  Use: Part (b) of the theorem with its hypotheses; stated, not proved.
- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), Ex. III.5.14(a) (PDF p. 237).
  Excerpt: “(a) If I is a radical ideal of R, show that there is a surjection from K2(R, I) onto I ⊗R Ω1 R/I, sending ⟨x, r⟩ to x ⊗ dr (r ∈ R, x ∈ I).”
  Use: The Kähler-differential lower bound, stated as an exercise.
- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), Ex. III.5.14(b),(c) (PDF p. 238).
  Excerpt: “(b) If I2 = 0, show that the kernel of the map in (a) is generated by the Dennis-Stein symbols ⟨x, y⟩ with x, y ∈ I. (c) (Van der Kallen) The dual numbers over R is the ring R[ε] with ε2 = 0. If 1 2 ∈ R, show that the map K2(R[ε], ε) → Ω1 R of part (a) is an isomorphism.”
  Use: The square-zero and dual-number test values, stated as exercises ('1 2' is the printed fraction 1/2).
- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), Ex. III.5.13 (PDF p. 237).
  Excerpt: “If n ≥ 2, show that K2(Z/2n) ∼= K2(Z/4) ∼= {±1} on {−1, −1} = ⟨−1, −2⟩ = ⟨2, 2⟩.”
  Use: The nilpotent relative example; the identity of the three elements is derived in dennis-stein-relations.

<a id="stage-k2symbolsbrauer-t-7"></a>
## T.7 — Hilbert symbols, Brauer classes and Chern compatibility

Import Tate twists from MotivicEtaleKTheory M.1 and the general Galois symbol, étale Chern classes and arithmetic Tate theorems from M.3. Keep here the ordered-cup formula adapter, change-of-root rule, Hilbert/invariant normalization and reciprocity adapter over ClassFieldTheory and ClassicalArithmeticCompletion CA.1. QuadraticFormInvariants supplies the quadratic and algebraic-Brauer comparisons.

Coverage: **partial**.

**Remaining proof and supply obligations.**

- The cyclic-algebra form of the Brauer-valued symbol (K-book Remark III.6.10.4, cited to Tate [198]).
- The owner of the local m-th power Hilbert symbol, T.7/classical-local-symbols or ClassicalArithmeticCompletion CA.1 (RS-03's 'power-residue/Hilbert-symbol extensions'), is for the maintainer to settle (request to CA.1).
- The imported twist, Tate arithmetic and higher reciprocity requests remain; local and étale Chern normalizations are source-backed at −1.


<a id="node-k2symbolsbrauer-t-7-symbol-formula"></a>
### The symbol formula, read in the pinned Kummer map and cup product

`K2SymbolsBrauer:T.7/symbol-formula` · comparison · implementation unchecked

For a field F and an integer m invertible in F, the Galois symbol h_F : K₂(F)/m → H²(F, μ_m^{⊗2}) of MotivicEtaleKTheory M.3 sends {a, b} to κ(a) ∪ κ(b), the cup product of the two Kummer classes for the canonical equivariant pairing μ_m × μ_m → μ_m^{⊗2} (K-book (6.10.2) and Proposition III.6.10.3). This node identifies that cup product with the one the pinned library computes: κ is Tau Ceti's kummerMap F m, with values in H¹(G_F, KummerCoeff F m), and the cup is explicitCup11 at the tensor pairing KummerCoeff F m × KummerCoeff F m → μ_m^{⊗2}, which is equivariant for the diagonal action and, the modules being discrete, jointly continuous. MotivicEtaleKTheory M.3 is the single owner of the Galois symbol, of its symbol formula and of the cohomological Steinberg relation κ(a) ∪ κ(1 − a) = 0 that makes h_F well defined on K₂(F) through Matsumoto's presentation (the source proves it by factoring t^m − a and the projection formula), and of Tate's local, global and S-integer theorems (RT-AREA-ktheory-1/8). T.7 constructs none of these and proves no Tate theorem: it imports the map for a general field, before M.3's arithmetic specialisation, and identifies its formula with the pinned Kummer map and cup product. No primitive root is chosen.

**Hypotheses.**

- F is a field, m ≥ 1 is invertible in F, and a, b ∈ F^×.
- μ_m^{⊗2} is the twice-twisted module of MotivicEtaleKTheory M.1, a discrete G_F-module with the diagonal action; no primitive root is chosen.


**Construction and proof.**

1. Import the Galois symbol, its symbol formula and its Steinberg relation from MotivicEtaleKTheory:M.3, their single owner (its stage text lists 'the symbol formula' among its required public statements); nothing of M.3's is rebuilt here.
2. Identify M.3's Kummer class with Tau Ceti's kummerMap, the connecting map of the Kummer sequence; ker_kummerMap identifies its kernel with (F^×)^m, so κ descends to F^×/F^×m.
3. Identify M.3's cup product in bidegree (1, 1) with explicitCup11 at the tensor pairing, which is equivariant because G_F acts diagonally on μ_m^{⊗2}.
4. Conclude h_F{a, b} = explicitCup11 (κ a) (κ b), and record that explicitCup11 is graded-commutative with sign −1 in bidegree (1, 1) (explicitCup11_eq_neg_flip), consistent with {b, a} = {a, b}⁻¹.

**Acceptance.**

- h_F{a, b} is the explicit (1, 1) cup of the two Tau Ceti Kummer classes in H²(F, μ_m^{⊗2}), with no primitive root chosen.
- h_F{a, 1 − a} = 0, imported from M.3.
- h_F{a, b} = 0 when b ∈ (F^×)^m, because κ(b) = 0 (ker_kummerMap).


**Prerequisites.**

- `MotivicEtaleKTheory:M.3`
- `MotivicEtaleKTheory:M.1`
- [`K2SymbolsBrauer:T.2/matsumoto`](#node-k2symbolsbrauer-t-2-matsumoto)
- `tauceti:TauCeti.kummerMap`
- `tauceti:TauCeti.ker_kummerMap`
- `tauceti:TauCeti.KummerCoeff`
- `tauceti:TauCeti.ContCohomology.explicitCup11`
- `tauceti:TauCeti.ContCohomology.explicitCup11_eq_neg_flip`


**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.6.10.2 (PDF p. 250).
  Excerpt: “There are also natural cup products in cohomology, such as the product F× ⊗ F× → H1 et(F; µm) ⊗ H1 et(F; µm) ∪ −→ H2 et(F; µ⊗2 m ) (6.10.2)”
  Use: The cup product of two Kummer classes into the twice-twisted module.
- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.6.10.3 (PDF p. 250).
  Excerpt: “Proposition 6.10.3 (Galois symbol). The bilinear pairing (6.10.2) induces a Steinberg symbol K2(F)/mK2(F) → H2 et(F; µ⊗2 m ) for every m prime to char(F).”
  Use: The symbol formula and its Steinberg property; the proof (factor t^m − a, projection formula) follows on pp. 250-251.

<a id="node-k2symbolsbrauer-t-7-classical-local-symbols"></a>
### The m-th power norm residue symbol of a local field

`K2SymbolsBrauer:T.7/classical-local-symbols` · definition · implementation unchecked

Planet: **Norm residue symbol**.

Let F be a nonarchimedean local field whose group of roots of unity is μ_m, with m invertible in F. The m-th power norm residue symbol ( , )_F : F^× × F^× → μ_m is defined as in K-book Example III.6.2.3: F^×/F^×m is finite, so the Kummer extension K generated by the m-th roots of all elements of F is finite abelian of exponent m; Kummer theory identifies Gal(K/F) with Hom(F^×, μ_m), g ↦ (a ↦ g(x)/x, x^m = a); local class field theory identifies F^×/N_{K/F}K^× with Gal(K/F); and (x, y)_F is the value at y of the homomorphism attached to x. It is bilinear and nondegenerate on F^×/F^×m, it satisfies (a, 1 − a)_F = 1, and it therefore defines a homomorphism K₂(F) → μ_m by Matsumoto's theorem. The construction uses only μ_m ⊆ F, and global-reciprocity uses it in that generality; the source's hypothesis μ(F) = μ_m is what the split surjectivity needs. The split surjectivity and Moore's structure theorem are KTheoryFiniteLocalFields L.3's, and the quadratic Hilbert symbol is the node hilbert-symbol-steinberg. ClassicalArithmeticCompletion CA.1 owns the m-th power Hilbert-symbol reciprocity law (RS-03); T.7 imports it in global-reciprocity for symbols defined by this local construction, and the request to CA.1 records the normalisation it must use.

**Hypotheses.**

- F is a nonarchimedean local field (complete for a discrete valuation with finite residue field), μ(F) = μ_m (μ_m ⊆ F suffices for the construction), and m is invertible in F.
- Local reciprocity is ClassFieldTheory Layer 6's localArtinEquiv in its normResidue form, with its arithmetic-Frobenius normalisation; the symbol inherits that normalisation, and the variable order is the source's, x ↦ (x, −)_F.


**Construction and proof.**

1. F^×/F^×m is finite, by the power-class count of LocalFieldsRamification Layer 1.
2. Kummer theory: μ_m ⊆ F gives H¹(G_F, μ_m) = Hom(G_F, μ_m), and the Kummer isomorphism H¹(G_F, μ_m) ≅ F^×/F^×m (ProfiniteCohomology Layer 9; its surjectivity is Hilbert 90, which the pinned kummerMap lacks) dualises to Gal(K/F) ≅ Hom(F^×/F^×m, μ_m).
3. Local reciprocity: F^×/N_{K/F}K^× ≅ Gal(K/F) (ClassFieldTheory Layer 6); since Gal(K/F) has exponent m and both groups have order #(F^×/F^×m), N_{K/F}K^× = F^×m.
4. Define (x, y)_F and prove bilinearity and nondegeneracy from the two isomorphisms.
5. Steinberg identity: for E = F(x), x^m = a, the element 1 − a is a norm from E (it is the product of the norms of 1 − x_i over the irreducible factors of t^m − a, and F(x_i) = E because x_i/x ∈ μ_m ⊆ F); by functoriality of reciprocity under the norm (ClassFieldTheory Layer 4, artinMap_groundNorm) the Galois element attached to 1 − a fixes E, so (1 − a, a)_F = g(x)/x = 1, which is the Steinberg identity with a replaced by 1 − a.
6. Descend to K₂(F) → μ_m through Matsumoto's theorem (K2SymbolsBrauer:T.2/matsumoto).

**Acceptance.**

- (x, y)_F = 1 for all y if and only if x ∈ F^×m: the source's 'norm residue' property, read with (x, y)_F in place of the printed {x, y}.
- (a, 1 − a)_F = 1 for a ≠ 0, 1.
- For m = 2 the symbol is the Hilbert symbol of hilbert-symbol-steinberg.
- Split surjectivity onto μ_m and Moore's theorem are not claimed here: they are KTheoryFiniteLocalFields L.3's (which requires T.7).


**Prerequisites.**

- [`K2SymbolsBrauer:T.2/matsumoto`](#node-k2symbolsbrauer-t-2-matsumoto)
- `tauceti:TauCeti.kummerMap`
- `tauceti:TauCeti.KummerCoeff`
- `mathlib:rootsOfUnity`


**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.NormResidueSymbol.normResidueSymbol` | constructor | (x, y)_F ∈ μ_m for x, y ∈ F^×, F a nonarchimedean local field with μ_m ⊆ F and m invertible in F. |
| `TauCeti.NormResidueSymbol.normResidueSymbol_apply` | characterisation | (x, y)_F = σ_x(η)/η for any η in the separable closure with η^m = y, where σ_x is the image of x under local reciprocity. |
| `TauCeti.NormResidueSymbol.normResidueSymbol_mul_left` | relation | (x x', y)_F = (x, y)_F (x', y)_F. |
| `TauCeti.NormResidueSymbol.normResidueSymbol_mul_right` | relation | (x, y y')_F = (x, y)_F (x, y')_F. |
| `TauCeti.NormResidueSymbol.normResidueSymbol_pow_right` | simp | (x, y^m)_F = 1. |
| `TauCeti.NormResidueSymbol.forall_normResidueSymbol_eq_one_iff` | characterisation | (∀ y, (x, y)_F = 1) ↔ x ∈ (F^×)^m. |
| `TauCeti.NormResidueSymbol.normResidueSymbol_one_sub` | relation | (a, 1 − a)_F = 1 for a ≠ 0, 1. |
| `TauCeti.NormResidueSymbol.normResidueK2` | constructor | The homomorphism K₂(F) → μ_m, {x, y} ↦ (x, y)_F. |
| `TauCeti.NormResidueSymbol.normResidueSymbol_two` | compatibility | For m = 2, (a, b)_F = hilbertSymbol a b of QuadraticFormInvariants 6C. |

**Consumers.**

- KTheoryFiniteLocalFields L.3 — L.3 builds the map K₂(F) → μ(F) from these local symbols and proves the split surjection and Moore's structure theorem; L.3 requires T.7
- T.7, local-comparison — compared with the Kummer cup product followed by the local invariant, under a named primitive root
- T.7, global-reciprocity — the product over all places of these symbols is 1


**Unit tests.**

- `TauCeti.NormResidueSymbol.normResidueSymbol_pow` (degenerate) — (x, y^m)_F = 1 and (x, 1)_F = 1 for all x, y.
- `TauCeti.NormResidueSymbol.normResidueSymbol_Q2` (computation) — For F = ℚ₂ (μ(ℚ₂) = {±1}, m = 2), (−1, −1)_F = −1, the source's Example III.6.2.5.
- `TauCeti.NormResidueSymbol.normResidueSymbol_Q3` (characterisation) — For F = ℚ₃ (m = 2), (3, −1)_F = −1: ℚ₃(√−1) is the unramified quadratic extension, whose norms have even valuation, so 3 is not a norm from it and its reciprocity image moves √−1. The non-square 3 pairs non-trivially, as nondegeneracy requires.
- `TauCeti.NormResidueSymbol.normResidueSymbol_not_tame` (non-example) — For F = ℚ₂ and m = 2 the tame symbol of (−1, −1) is 1, both entries being units, but (−1, −1)_F = −1: when the residue characteristic divides m the norm residue symbol is not a character of the tame symbol.
- `TauCeti.NormResidueSymbol.normResidueSymbol_eq_tame_odd` (compatibility) — For F = ℚ_p, p odd, m = 2: (r, s)_F = ε(∂(r, s)) with ε : 𝔽_p^× → {±1} the surjection and ∂ the tame symbol of K2SymbolsBrauer:T.3/tame-symbol (K-book Ex. III.6.7; the inversion between the roadmap's and the source's tame symbol is invisible because ε takes values ±1).


**Suggested placement.** module: `TauCeti/NumberTheory/KTheory/NormResidueSymbol`; namespace: `TauCeti.NormResidueSymbol`.

**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.6.2.3 (PDF p. 241).
  Excerpt: “Because F ×m has finite index in F ×, there is a finite “Kummer” extension K containing the mth roots of every element of F. The Galois group GF = Gal(K/F) is canonically isomorphic to Hom(F ×, µm)”
  Use: The Kummer half of the construction.
- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.6.2.3 (PDF p. 241).
  Excerpt: “The composite F × −→F ×/NK× ∼= GF ∼= Hom(F ×, µm), written as x 7→(x, −)F , is adjoint to a nondegenerate bilinear map ( , )F : F × ⊗ F × →µm.”
  Use: The definition of the pairing through local reciprocity, with its variable order.
- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.6.2.3 (PDF p. 241).
  Excerpt: “The Steinberg identity (a, 1 −a)F = 1 is proven by noting that (1 −a) is a norm from the intermediate field E = F(x), xm = a.”
  Use: The Steinberg identity and the norm argument.

<a id="node-k2symbolsbrauer-t-7-twisted-roots-of-unity"></a>
### Trivialising a twist by a primitive root, and the change-of-root rule

`K2SymbolsBrauer:T.7/twisted-roots-of-unity` · construction · implementation unchecked

Let F be a field, m ≥ 1 invertible in F, and μ_m^{⊗j} (j ∈ ℤ) the finite Tate twists of MotivicEtaleKTheory M.1, built on Tau Ceti's KummerCoeff F m (j = 1) with the diagonal action on tensor powers, so that G_F acts on μ_m^{⊗j} through χ^j, χ the mod-m cyclotomic character. A primitive m-th root of unity ζ ∈ F determines the trivialisation τ_ζ^{(j)} : ℤ/m → μ_m^{⊗j}, 1 ↦ ζ^{⊗j} (through the dual for j < 0). It is an isomorphism of abelian groups, and it is G_F-equivariant — an isomorphism of discrete G_F-modules — because ζ ∈ F; without a primitive root in F, μ_m and ℤ/m need not be isomorphic G_F-modules. Change of root: if ζ' = ζ^u with u ∈ (ℤ/m)^×, then τ_{ζ'}^{(j)} = τ_ζ^{(j)} ∘ (u^j ·). So a statement that passes through τ_ζ names ζ, and a composite in which τ_ζ and τ_ζ⁻¹ each enter once is independent of ζ. The twists themselves are M.1's; this node owns the trivialisation and the rule, which the stage text assigns to T.7.

**Hypotheses.**

- F is a field, m ≥ 1 is invertible in F, and ζ ∈ F is a primitive m-th root of unity wherever τ_ζ is used.
- μ_m^{⊗j} carries the diagonal action, i.e. the action through χ^j; it is never identified with ℤ/m without naming ζ.


**Construction and proof.**

1. Import μ_m^{⊗j} from MotivicEtaleKTheory:M.1, with its weight-one piece the pinned KummerCoeff F m; the action on μ_m is through Mathlib's modularCyclotomicCharacter.
2. Define τ_ζ^{(1)} from IsPrimitiveRoot.zmodEquivZPowers and IsPrimitiveRoot.zpowers_eq (the powers of ζ are all of μ_m), and τ_ζ^{(j)} by tensor powers and duality.
3. Equivariance: g(ζ) = ζ for every g ∈ G_F since ζ ∈ F, so G_F fixes ζ^{⊗j} and τ_ζ^{(j)} is equivariant.
4. Change of root: τ_{ζ^u}^{(1)}(1) = ζ^u = τ_ζ^{(1)}(u), so τ_{ζ^u}^{(1)} = τ_ζ^{(1)} ∘ (u ·), hence τ_{ζ^u}^{(j)} = τ_ζ^{(j)} ∘ (u^j ·), for negative j through the dual.
5. Record where the rule is applied: the natural isomorphism H²(F, μ_m^{⊗2}) ≅ mBr(F) ⊗ μ_m (K-book Example III.6.10.1) needs no root, while brauer-valued-symbol and local-comparison pass through τ_ζ^{(1)} once.

**Acceptance.**

- τ_ζ^{(0)} is the identity, for every ζ.
- A change of root by u changes the degree-two trivialisation by u², and the degree-one trivialisation by u.
- No statement identifies a twist with ℤ/m without naming ζ.


**Prerequisites.**

- `MotivicEtaleKTheory:M.1`
- `tauceti:TauCeti.KummerCoeff`
- `mathlib:ZMod`
- `mathlib:modularCyclotomicCharacter`
- `mathlib:IsPrimitiveRoot.zmodEquivZPowers`
- `mathlib:IsPrimitiveRoot.zpowers_eq`


**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.Twist.trivialisation` | constructor | For ζ ∈ F primitive of order m and j ∈ ℤ, τ_ζ^{(j)} : ZMod m ≃+ μ_m^{⊗j}, 1 ↦ ζ^{⊗j}. |
| `TauCeti.Twist.trivialisation_one` | simp | τ_ζ^{(j)} 1 = ζ^{⊗j}. |
| `TauCeti.Twist.trivialisation_zero` | simp | τ_ζ^{(0)} is the identity of ZMod m. |
| `TauCeti.Twist.trivialisation_equivariant` | characterisation | τ_ζ^{(j)} is G_F-equivariant, ζ being in F. |
| `TauCeti.Twist.trivialisation_pow` | relation | τ_{ζ^u}^{(j)} = τ_ζ^{(j)} ∘ (u^j ·) for u ∈ (ZMod m)ˣ. |
| `TauCeti.Twist.trivialisation_tensor` | compatibility | τ_ζ^{(i)} ⊗ τ_ζ^{(j)} = τ_ζ^{(i+j)} under ZMod m ⊗ ZMod m ≅ ZMod m and μ_m^{⊗i} ⊗ μ_m^{⊗j} ≅ μ_m^{⊗(i+j)}. |
| `TauCeti.Twist.trivialisation_one_eq` | compatibility | τ_ζ^{(1)} is IsPrimitiveRoot.zmodEquivZPowers followed by IsPrimitiveRoot.zpowers_eq, read in KummerCoeff F m. |

**Consumers.**

- T.7, brauer-valued-symbol — H²(F, μ_m^{⊗2}) is identified with H²(F, μ_m) through τ_ζ^{(1)} on one factor
- T.7, local-comparison — the comparison with the norm residue symbol is made under a named ζ and shown independent of it by this rule
- ClassFieldTheory Layer 5 — kummerCupPairing ζ is the pairing μ_m × μ_m → μ_m obtained from τ_ζ^{(1)}; the rule relates the pairings for different ζ


**Unit tests.**

- `TauCeti.Twist.trivialisation_zero_indep` (degenerate) — τ_ζ^{(0)} = id for every ζ; in particular it does not depend on ζ.
- `TauCeti.Twist.trivialisation_two` (computation) — For m = 2 the only primitive root is −1, so τ^{(j)} is canonical for every j, the case ClassFieldTheory Layer 5 uses at kummerCupPairing (−1).
- `TauCeti.Twist.trivialisation_pow_five` (characterisation) — For m = 5 and ζ' = ζ²: τ_{ζ'}^{(1)} = τ_ζ^{(1)} ∘ (2 ·) and τ_{ζ'}^{(2)} = τ_ζ^{(2)} ∘ (4 ·) = τ_ζ^{(2)} ∘ (−1 ·).
- `TauCeti.Twist.twist_Q_three` (non-example) — Over ℚ with m = 3, μ_3 is not isomorphic to ℤ/3 as a G_ℚ-module (H⁰(ℚ, μ_3) = 1 but H⁰(ℚ, ℤ/3) = ℤ/3), whereas μ_3^{⊗2} ≅ ℤ/3 because the mod-3 cyclotomic character takes values ±1 and its square is trivial: a twist defined with the action χ instead of χ^j fails this.


**Suggested placement.** module: `TauCeti/FieldTheory/GaloisCohomology/Twist`; namespace: `TauCeti.Twist`.

**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.6.10 (PDF p. 250).
  Excerpt: “the tensor product µ⊗2 m = µm ⊗ µm is also a G-discrete module. Note that the three G-modules Z/m, µm and µ⊗2 m have the same underlying abelian group, but are isomorphic GF-modules only when µm ⊂ F.”
  Use: The twisted module with the diagonal action and the reason a trivialisation needs a root of unity in F.
- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.6.10.4 (PDF p. 251).
  Excerpt: “If we identify Z/m with µm via 1 ↦ ζ, we have a natural isomorphism mBr(F) ∼= mBr(F) ⊗ Z/m ∼= mBr(F) ⊗ µm ∼= H2 et(F; µ⊗2 m ). Tate showed in [198] that this isomorphism identifies the Galois symbol of Proposition 6.10.3 with the mth power norm residue symbol of Proposition 6.9.2.”
  Use: The trivialisation by a chosen root and the comparison with the cyclic-algebra symbol, cited to Tate [198] (On the torsion in K2 of fields, Kyoto 1976).

<a id="node-k2symbolsbrauer-t-7-hilbert-symbol-steinberg"></a>
### The Hilbert symbol as a Steinberg symbol

`K2SymbolsBrauer:T.7/hilbert-symbol-steinberg` · construction · implementation unchecked

For unit arguments r, s ∈ F^× and a nonarchimedean local field F in which 2 is invertible, the source's Hilbert symbol c_F(r, s) ∈ {±1}, which is +1 exactly when rx² + sy² = 1 has a solution in F, equals the Hilbert symbol hilbertSymbol r s of QuadraticFormInvariants Layer 6C (+1 exactly when s = x² − ry² is solvable), which that layer defines and proves bimultiplicative and symmetric. It satisfies c_F(r, 1 − r) = 1 (x = y = 1), so by Matsumoto's theorem it defines a Steinberg symbol K₂(F) → {±1}. For F = ℝ and r, s ∈ ℝ^×, c_ℝ is the sign symbol. The total auxiliary conicSymbol allows all field elements, but its value at (0,0) is −1 and is not governed by the strict-negative Hilbert criterion. The definition makes sense over any field of characteristic different from 2 but is not bilinear there, and no Steinberg symbol is claimed.

**Hypotheses.**

- F is a nonarchimedean local field with 2 invertible; for the real comparison, F = ℝ. The Hilbert/Steinberg comparisons require unit inputs (equivalently nonzero field elements); the total conic helper is not a symbol on all field elements.


**Construction and proof.**

1. Show c_F(r, s) = hilbertSymbol r s: both say that the ternary form rX² + sY² − Z², equivalently X² − rY² − sZ² up to the factor −1, is isotropic. A solution of rx² + sy² = 1 is an isotropic vector with Z = 1, and an isotropic vector with Z = 0 makes ⟨r, s⟩ hyperbolic, so that it represents 1; s = x² − ry² is the same statement for the second form.
2. Import bimultiplicativity and symmetry from QuadraticFormInvariants Layer 6C (its milestones 3 and 5), in place of the O'Meara citation of the source.
3. Steinberg identity: x = y = 1 solves rx² + (1 − r)y² = 1.
4. Descend to K₂(F) → {±1} through Matsumoto's theorem (K2SymbolsBrauer:T.2/matsumoto).
5. For F = ℝ and nonzero r, s, rx² + sy² = 1 is solvable unless r < 0 and s < 0, so c_ℝ is the sign symbol (K-book Example III.6.2.1), which is a Steinberg symbol because x and 1 − x are never both negative. The same map is constructed as K2SymbolsBrauer:T.5/real-sign-symbol, the lower bound for K₂(ℤ); it is not imported from there. Contrary to an earlier revision of this node, no stage cycle forbids importing it: with the edges proposed for RT-AREA-ktheory-1 both T.5 → T.7 and T.7 → T.5 are acyclic, so the choice of the owner of the real sign symbol is left to the maintainer; the test hilbertSymbol_real checks that the two maps agree.

**Acceptance.**

- c_{ℚ₂}(−1, −1) = −1.
- On ℝ^× × ℝ^×, c_ℝ is the sign symbol; the zero-input total helper is a separate non-example.
- Over ℚ the conic definition is not bilinear.


**Prerequisites.**

- [`K2SymbolsBrauer:T.2/matsumoto`](#node-k2symbolsbrauer-t-2-matsumoto)


**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.NormResidueSymbol.hilbertSymbol_eq_one_iff_conic` | characterisation | For r, s ∈ F^×, hilbertSymbol r s = 1 ↔ ∃ x y : F, r x² + s y² = 1. |
| `TauCeti.NormResidueSymbol.hilbertK2` | constructor | The Steinberg symbol K₂(F) → ℤˣ, {r, s} ↦ hilbertSymbol r s. |
| `TauCeti.NormResidueSymbol.hilbertK2_symbol` | simp | hilbertK2 {r, s} = hilbertSymbol r s. |
| `TauCeti.NormResidueSymbol.hilbertK2_real` | compatibility | For r, s ∈ ℝ^×, outside the nonarchimedean local-field hypotheses of hilbertK2, the conic symbol agrees with the real Steinberg sign: value −1 exactly when both unit entries are negative. |
| `TauCeti.NormResidueSymbol.hilbertK2_eq_normResidueK2` | compatibility | For m = 2 it equals normResidueK2. |

**Consumers.**

- KTheoryFiniteLocalFields L.3 — the Hilbert-symbol components of the map out of K₂ of a local field
- K-book Ex. III.6.8 — quadratic reciprocity over ℚ is the product formula for these symbols with the real and 2-adic ones


**Unit tests.**

- `TauCeti.NormResidueSymbol.hilbertSymbol_Q2` (computation) — c_{ℚ₂}(−1, −1) = −1, since x² + y² = −1 has no solution in ℚ₂ (K-book Example III.6.2.5).
- `TauCeti.NormResidueSymbol.hilbertSymbol_real` (compatibility) — For r, s ∈ ℝ^×, c_ℝ(r, s) = −1 exactly when (r : ℝ) < 0 and (s : ℝ) < 0: it is the sign symbol of K-book Example III.6.2.1, agreeing with T.5/real-sign-symbol. Zero inputs are excluded.
- `TauCeti.NormResidueSymbol.hilbertSymbol_eq_qfi` (compatibility) — c_F(r, s) = hilbertSymbol r s (QuadraticFormInvariants 6C) for every nonarchimedean local F with 2 invertible.
- `TauCeti.NormResidueSymbol.hilbertSymbol_degenerate` (degenerate) — c_F(1, s) = 1 (x = 1, y = 0) and c_F(r, 1 − r) = 1 (x = y = 1).
- `TauCeti.NormResidueSymbol.conicSymbol_Q_not_bilinear` (non-example) — Over ℚ, c_ℚ(3, −1) = c_ℚ(7, −1) = c_ℚ(21, −1) = −1: clearing denominators, 3a² = b² + c², 7a² = b² + c² and 21a² = b² + c² force b and c to be divisible by 3, 7 and 3 respectively (−1 is not a square modulo 3 or 7), and then a as well. So c_ℚ(21, −1) ≠ c_ℚ(3, −1) c_ℚ(7, −1), and the local-field hypothesis cannot be dropped.
- `TauCeti.NormResidueSymbol.conicSymbol_zero_not_hilbert` (non-example) — The total helper has conicSymbol ℝ 0 0 = −1, while ¬(0 < 0 ∧ 0 < 0). Thus its strict-negative comparison cannot be extended to arbitrary real inputs; the all-real no-solution criterion would use nonpositivity.


**Suggested placement.** module: `TauCeti/NumberTheory/KTheory/NormResidueSymbol`; namespace: `TauCeti.NormResidueSymbol`.

**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.6.2.2 (PDF p. 241).
  Excerpt: “Let F be a local field containing 1 2. The Hilbert (quadratic residue) symbol on F is defined by setting cF (r, s) ∈ {±1} equal to +1 or −1, depending on whether or not the equation rx2 + sy2 = 1 has a solution in F. Bilinearity is classical when F is local; see [147, p. 164].”
  Use: The definition by the conic, verbatim ('1 2' is the printed 1/2); bilinearity is cited to O'Meara.
- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.6.2.2 (PDF p. 241).
  Excerpt: “Of course, the definition of cF (r, s) makes sense for any field of characteristic ≠ 2, but it will not always be a Steinberg symbol because it can fail to be bilinear in r. It is a Steinberg symbol when F = R, because the Hilbert symbol cR(r, s) is the same as the symbol (r, s)∞”
  Use: The general-field caveat and the real case.
- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.6.2.5 (PDF p. 242).
  Excerpt: “Since x2 + y2 = −1 has no solution in F = ˆQ2 we see from definition (6.2.2) that the Hilbert symbol cF (−1, −1) = −1.”
  Use: The 2-adic worked example.

<a id="node-k2symbolsbrauer-t-7-brauer-valued-symbol"></a>
### The Brauer-valued symbol attached to a primitive root

`K2SymbolsBrauer:T.7/brauer-valued-symbol` · construction · implementation unchecked

For a field F with m invertible and a primitive m-th root of unity ζ ∈ F, the Brauer-valued symbol β_ζ : K₂(F)/m → mBr(F) is the Galois symbol h_F of symbol-formula followed by H²(F, μ_m^{⊗2}) = H²(F, μ_m ⊗ μ_m) → H²(F, μ_m), induced by id ⊗ (τ_ζ^{(1)})⁻¹, and by the injection H²(G_F, μ_m) → H²(G_F, (F^s)^×) = Br(F) with image the m-torsion (K-book Example III.6.10.1). Replacing ζ by ζ^u multiplies β_ζ by u⁻¹. The source identifies β_ζ, citing Tate [198], with the m-th power norm residue symbol {α, β} ↦ [A_ζ(α, β)] of cyclic algebras (Proposition III.6.9.2, Remark III.6.10.4); the algebraic cyclic-algebra identification is an imported QuadraticFormInvariants 7B contract; the local cohomological Artin/invariant comparison is proved in local-comparison without using that presentation. This is the 'Brauer-valued symbol' the roadmap document's T.7 contract exports after the change-of-root scalar. It is built in the cohomological Brauer group H²(G_F, (F^s)^×); exporting it as a class of central simple algebras (the algebraic Brauer group) uses QuadraticFormInvariants Layer 7B's crossed-product comparison of the two, and for m = 2 and ζ = −1 that layer's ι[(a, b)] = (a) ∪ (b) identifies β_{−1}{a, b} with the class of the quaternion algebra (a, b).

**Hypotheses.**

- F is a field, m ≥ 1 invertible in F, and ζ ∈ F a primitive m-th root of unity.


**Construction and proof.**

1. Compose h_F (K2SymbolsBrauer:T.7/symbol-formula) with the coefficient map id ⊗ (τ_ζ^{(1)})⁻¹ : μ_m ⊗ μ_m → μ_m (K2SymbolsBrauer:T.7/twisted-roots-of-unity), which is equivariant, on H².
2. Compose with H²(G_F, μ_m) → Br(F), injective with image the m-torsion by the Kummer sequence and Hilbert 90 (ProfiniteCohomology Layer 9, h2KummerToUnits).
3. Change of root: (τ_{ζ^u}^{(1)})⁻¹ = u⁻¹ (τ_ζ^{(1)})⁻¹, so β_{ζ^u} = u⁻¹ β_ζ.
4. Record the cyclic-algebra comparison of Remark III.6.10.4 as cited (Tate [198]); it is not needed by any node here.

**Acceptance.**

- β_ζ{a, 1 − a} = 0 and β_ζ{a, b} = 0 when b ∈ (F^×)^m, inherited from h_F.
- β_{ζ^u} = u⁻¹ β_ζ.
- For m = 2 and ζ = −1, β_{−1}{a, b} is the class of the quaternion algebra (a, b) under QuadraticFormInvariants' comparison; in particular β_{−1}{a, 1 − a} = 0 matches Tau Ceti's splitting of (a, 1 − a) (TauCeti.QuaternionAlgebra.steinbergEquivMatrix).


**Prerequisites.**

- [`K2SymbolsBrauer:T.7/symbol-formula`](#node-k2symbolsbrauer-t-7-symbol-formula)
- [`K2SymbolsBrauer:T.7/twisted-roots-of-unity`](#node-k2symbolsbrauer-t-7-twisted-roots-of-unity)


**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.NormResidueSymbol.brauerSymbol` | constructor | For ζ ∈ F primitive of order m, β_ζ : K₂(F) →* Multiplicative (Br F), Br F written additively, with values of order dividing m. |
| `TauCeti.NormResidueSymbol.brauerSymbol_symbol` | simp | β_ζ {a, b} = the image of (id ⊗ τ_ζ⁻¹)_*(κ a ∪ κ b) in Br(F). |
| `TauCeti.NormResidueSymbol.brauerSymbol_pow_root` | relation | β_{ζ^u} = u⁻¹ • β_ζ for u ∈ (ZMod m)ˣ. |
| `TauCeti.NormResidueSymbol.nsmul_brauerSymbol` | simp | m • β_ζ x = 0. |
| `TauCeti.NormResidueSymbol.brauerSymbol_algebraic` | compatibility | Under QuadraticFormInvariants 7B's isomorphism between BrauerGroup F and H²(G_F, (F^s)^×), β_ζ lands in the m-torsion of BrauerGroup F; for m = 2 and ζ = −1, β_{−1}{a, b} is the quaternion class (a, b). |

**Consumers.**

- T.7, local-comparison — the local invariant of β_ζ is compared with the norm residue symbol
- T.7, global-reciprocity — the sum of the local invariants of the global β_ζ is zero
- QuadraticFormInvariants Layer 7B — the comparison of the algebraic Brauer group with H² exports β_ζ as a class of central simple algebras, and identifies β_{−1}{a, b} with the quaternion class


**Unit tests.**

- `TauCeti.NormResidueSymbol.brauerSymbol_steinberg` (degenerate) — β_ζ{a, 1 − a} = 0 and β_ζ{a, c^m} = 0.
- `TauCeti.NormResidueSymbol.brauerSymbol_pow_root_five` (characterisation) — For m = 5, β_{ζ²} = 3 • β_ζ, since 2⁻¹ = 3 in ZMod 5.
- `TauCeti.NormResidueSymbol.brauerSymbol_real` (computation) — For F = ℝ, m = 2, ζ = −1: β{−1, −1} is the non-trivial element of Br(ℝ) ≅ ℤ/2, because κ(−1) generates H¹(ℤ/2, 𝔽₂) and its square generates H²(ℤ/2, 𝔽₂) (the cohomology ring is 𝔽₂[t]); and β{a, b} = 0 unless a < 0 and b < 0, positive reals being squares. Under the cited identification this is the class of the Hamilton quaternions, the cyclic algebra A_{−1}(−1, −1) of K-book Example III.6.9.
- `TauCeti.NormResidueSymbol.brauerSymbol_depends_on_root` (non-example) — For m = 3 and F = ℚ(μ_3), β_{ζ²} = −β_ζ, so a definition that does not name ζ cannot be well defined unless it is 0.


**Suggested placement.** module: `TauCeti/NumberTheory/KTheory/NormResidueSymbol`; namespace: `TauCeti.NormResidueSymbol`.

**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.6.10.1 (PDF p. 250).
  Excerpt: “1 →µm(F) →F × m −→F × →H1 et(F; µm) →1 1 →H2 et(F; µm) →Br(F) m −→Br(F) This yields isomorphisms H1 et(F; µm) ∼= F ×/F ×m and H2 et(F; µm) ∼= mBr(F).”
  Use: The Kummer sequences identifying H2(F, µm) with the m-torsion of the Brauer group.
- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.6.10.4 (PDF p. 251).
  Excerpt: “If we identify Z/m with µm via 1 ↦ ζ, we have a natural isomorphism mBr(F) ∼= mBr(F) ⊗ Z/m ∼= mBr(F) ⊗ µm ∼= H2 et(F; µ⊗2 m ). Tate showed in [198] that this isomorphism identifies the Galois symbol of Proposition 6.10.3 with the mth power norm residue symbol of Proposition 6.9.2.”
  Use: The trivialisation by a chosen root and the comparison with the cyclic-algebra symbol, cited to Tate [198] (On the torsion in K2 of fields, Kyoto 1976).
- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.6.9.2 (PDF p. 249).
  Excerpt: “Proposition 6.9.2 (nth power norm residue symbol). If F contains ζ, a primitive nth root of unity, there is a homomorphism K2(F) → Br(F) sending {α, β} to the class of the cyclic algebra Aζ(α, β).”
  Use: The Brauer-valued symbol in its cyclic-algebra form.

<a id="node-k2symbolsbrauer-t-7-local-comparison"></a>
### The norm residue symbol against the local invariant of the Kummer cup product

`K2SymbolsBrauer:T.7/local-comparison` · comparison · implementation unchecked

For a nonarchimedean local field F with m invertible, μ_m⊆F and a primitive root ζ, let β_ζ{a,b} be the Brauer image of κ(a)∪κ(b) under ζ^i⊗ζ^j↦ζ^(ij). Let e_m:(Q/Z)[m]≃Z/m send [r/m] to r. With arithmetic Frobenius and the packet’s classical symbol (a,b)_F=Artin_F(a)(b^(1/m))/b^(1/m), one has (a,b)_F=ζ^(−e_m(inv_F β_ζ{a,b})). The sign is −1 for every m; it is invisible at m=2. At m=1 both sides are 1. This is a normalization adapter, with Artin/invariant maps imported from ClassFieldTheory Layers 5–6 and the Galois symbol imported from M.3.

**Hypotheses.**

- F is a nonarchimedean local field; m≥1 is invertible in F; μ_m⊆F; ζ has order m.
- Artin sends a uniformizer to arithmetic Frobenius. β_ζ pairs the ordered cup κ(a)∪κ(b), and e_m is the torsion coordinate, not multiplication by m in Q/Z.


**Construction and proof.**

1. Trivialize the FIRST Kummer coefficient by ζ^i↦i/m∈(1/m)Z/Z. The associated character χ_a records σ(a^(1/m))/a^(1/m)=ζ^(mχ_a(σ)). Pairing χ_a with κ(b) gives the Brauer image β_ζ of the ordered cup product.
2. Milne III Proposition 3.6 (which Milne states without proof, referring to Serre's Local Fields, Annexe to Chapter XI; it is requested from ClassFieldTheory Layers 5–6 and recorded in upstreamNotes) and III.4 Steps 2–4 give inv_F(χ_a∪κ(b))=χ_a(Artin_F(b)); hence ζ^e_m(inv β_ζ{a,b})=Artin_F(b)(a^(1/m))/a^(1/m), exactly Remark 4.5. This has the arguments reversed from classical-local-symbols.
3. The cup product is skew-commutative in degree (1,1), with the tensor swap identified by the symmetric ζ-pairing. Swap a,b to get β_ζ{b,a}=−β_ζ{a,b}, and therefore the displayed minus sign for Artin(a) acting on a root of b. This proof works for every invertible m, including composite m.
4. For another primitive root ζ′=ζ^u (u invertible mod m), β_ζ′=u⁻¹β_ζ, while exponentiation by ζ′ multiplies coordinates by u. Thus the minus-sign formula is independent of ζ. At m=2 it agrees with the CFT Layer 6 and QuadraticFormInvariants 6E comparisons.
5. Cubic sign detector: F=Q₇, m=3, choose ζ with residue 2. The Kummer extension F(3^(1/3))/F is unramified cubic because X³−3 is irreducible mod 7 and 3 is invertible mod 7. On the residue field arithmetic Frobenius sends ᾱ to ᾱ⁷, so the residue of σ(α)/α is ᾱ⁶=3²=2 mod 7. Since σ(α)/α∈μ₃ and reduction is injective on μ₃, the ratio is ζ. Thus β_ζ{3,7} has invariant 1/3, but classical (3,7)=ζ⁻¹. A positive-sign comparison fails.

**Acceptance.**

- The universal exponent is −e_m(inv β_ζ), with e_m([r/m])=r.
- The Q₇ cubic test gives inv_F(β_ζ{3,7})=1/3 and (3,7)=ζ⁻¹; m=2 alone is insufficient.
- Root change cancels in the formula; m=1 and m=2 retain their earlier regressions.


**Prerequisites.**

- [`K2SymbolsBrauer:T.7/classical-local-symbols`](#node-k2symbolsbrauer-t-7-classical-local-symbols)
- [`K2SymbolsBrauer:T.7/brauer-valued-symbol`](#node-k2symbolsbrauer-t-7-brauer-valued-symbol)
- [`K2SymbolsBrauer:T.7/twisted-roots-of-unity`](#node-k2symbolsbrauer-t-7-twisted-roots-of-unity)


**Sources.**

- [Milne.CFT.4.03](https://www.jmilne.org/math/CourseNotes/CFT.pdf), III Proposition 3.6(a), pp. 108–109; III.4 Steps 2–4 and Remark 4.5, pp. 112–114.
  Excerpt: “skew-symmetric”
  Use: The arithmetic Artin/invariant evaluation, ordered cup-product definition and Artin(b) acting on a root of a; inversion is the derived conversion to this packet’s opposite argument order.
- [Milne.CFT.4.03](https://www.jmilne.org/math/CourseNotes/CFT.pdf), III Proposition 3.6 and its proof, p. 109.
  Excerpt: “PROPOSITION 3.6 For every χ ∈ Hom_cts(G, Q/Z) and a ∈ K^×, χ(φ_{L/K}(a)) = inv_K(a ∪ δχ). PROOF. See Serre 1962, “Annexe” to Chapter XI, and Serre 1967a, p. 140.”
  Use: The character-evaluation identity of proof step 2, verbatim (formula transcribed from the text layer); Milne gives no proof of his own, so the identity is an import, not a decomposed step.

<a id="node-k2symbolsbrauer-t-7-global-reciprocity"></a>
### Global reciprocity for symbols in K₂ of a number field: an adapter over the imported laws

`K2SymbolsBrauer:T.7/global-reciprocity` · theorem · implementation unchecked

Let F be a number field containing μ_m, ζ ∈ F a primitive m-th root of unity and x ∈ K₂(F). For each place v let (x)_v ∈ μ_m(F) be the image of x under the local symbol of F_v: at a finite place the norm residue symbol of classical-local-symbols (which needs only μ_m ⊆ F_v), at a real place the constant 1 symbol if m = 1 and the sign symbol if m = 2 (there are no real places if m > 2), at a complex place 1; each μ_m(F) → μ_m(F_v) is an isomorphism. Then (a) (x)_v = 1 for all but finitely many v and ∏_v (x)_v = 1: on a symbol x = {a, b} this is the m-th power Hilbert reciprocity law ∏_v (a, b)_v = 1, imported from ClassicalArithmeticCompletion CA.1 (its 'source-scoped higher reciprocity through class field theory'), and for m = 2 from ClassFieldTheory Layer 14's hilbertProductFormula through QuadraticFormInvariants 6E's sign dictionary; (b) Σ_v inv_v(res_v β_ζ(x)) = 0, ClassFieldTheory Layer 10's sumLocalInv_eq_zero applied to the Brauer class β_ζ(x) of brauer-valued-symbol, with the real-place invariants of Layer 10; (c) under local-comparison, (a) and (b) are the same statement, with ζ explicit and exponent sign −1. T.7 proves (c) and the passage from symbols to K₂(F) (Matsumoto); it does not prove the reciprocity laws themselves. For F = ℚ and m = 2, (a) is quadratic reciprocity in the form of K-book Ex. III.6.8.

**Hypotheses.**

- F is a number field with μ_m ⊆ F, ζ ∈ F a primitive m-th root of unity, and x ∈ K₂(F).
- The local symbols carry the normalisation of classical-local-symbols (arithmetic Frobenius, variable order x ↦ (x, −)_v); CA.1's law is used in that normalisation or converted to it.
- m ≥ 1; the real local factor is 1 for m = 1 and the quadratic sign for m = 2. A real embedding cannot contain a primitive m-th root when m > 2.


**Construction and proof.**

1. The local symbols define a homomorphism K₂(F) → ⊕_v μ_m(F): each is a Steinberg symbol (classical-local-symbols; the constant 1 symbol for m = 1, the sign symbol for m = 2 at the real places), and (a, b)_v = 1 at every finite v not dividing m at which a and b are units, because the Kummer extension of F_v generated by an m-th root of a unit is unramified and units are norms from unramified extensions (ClassFieldTheory Layer 6); only finitely many v divide m or have v(a) ≠ 0 or v(b) ≠ 0 (mathlib:IsDedekindDomain.HeightOneSpectrum.Support.finite). Symbols generate K₂(F) (K2SymbolsBrauer:T.2/matsumoto).
2. (a): import the m-th power Hilbert reciprocity law ∏_v (a, b)_v = 1 from ClassicalArithmeticCompletion:CA.1, read in the normalisation of classical-local-symbols (if CA.1 fixes the opposite variable order, every local factor is inverted and the product formula is unchanged); for m = 2 it is ClassFieldTheory Layer 14's hilbertProductFormula, translated into signs by QuadraticFormInvariants 6E; extend from symbols to K₂(F) by multiplicativity.
3. (b): β_ζ(x) ∈ Br(F) (brauer-valued-symbol), its restrictions to the completions are the local Brauer-valued symbols because restriction commutes with Kummer classes and the cup product (ProfiniteCohomology Layers 6 and 8), and ClassFieldTheory Layer 10's sumLocalInv_eq_zero gives Σ_v inv_v = 0.
4. For m = 1, μ_1 is trivial, β_1 = 0 and every factor (including the real factors) is 1, with the trivial coefficient group. For m = 2, the real quadratic sign agrees with Layer 10's archimedean invariant; for m > 2 a primitive m-th root cannot embed in ℝ, so there are no real places. At finite places use local-comparison, reading the invariant through the coordinate map (ℚ/ℤ)[m] ≅ ZMod m, [a/m] ↦ a (not multiplication by m inside ℚ/ℤ), and the named ζ with exponent sign −1, as proved in local-comparison from Milne III.3–4. Negating the invariant sum does not alter its vanishing.
5. Check m = 2 and F = ℚ against Ex. III.6.8.

**Acceptance.**

- (x)_v = 1 for almost all v, and ∏_v (x)_v = 1.
- For m = 2 and F = ℚ: (r, s)_∞ (r, s)_2 ∏_{p odd} (r, s)_p = +1 (K-book Ex. III.6.8), which is ClassFieldTheory Layer 14's quadratic reciprocity.
- No reciprocity law is proved here: the m-th power law is CA.1's, the quadratic law is ClassFieldTheory Layer 14's, and the vanishing of the sum of invariants is Layer 10's; T.7 contributes the statement on K₂(F) and the compatibility (c).
- m = 1, F = ℚ, x = {−1, −1}: every factor is 1, including the real place. An unconditional quadratic real factor would incorrectly make the product −1.
- m = 2, F = ℚ, x = {−1,−1}: the real factor and the dyadic factor are each −1 and cancel; each odd-prime factor is 1. This is not the m = 1 law.


**Prerequisites.**

- [`K2SymbolsBrauer:T.7/local-comparison`](#node-k2symbolsbrauer-t-7-local-comparison)
- [`K2SymbolsBrauer:T.7/brauer-valued-symbol`](#node-k2symbolsbrauer-t-7-brauer-valued-symbol)
- [`K2SymbolsBrauer:T.7/classical-local-symbols`](#node-k2symbolsbrauer-t-7-classical-local-symbols)
- [`K2SymbolsBrauer:T.2/matsumoto`](#node-k2symbolsbrauer-t-2-matsumoto)
- `ClassicalArithmeticCompletion:CA.1`
- `mathlib:IsDedekindDomain.HeightOneSpectrum.Support.finite`
- `mathlib:rootsOfUnity_one`


**Unit tests.**

- `TauCeti.NormResidueSymbol.global_reciprocity_one` (degenerate) — For m = 1, every finite-place family c valued in rootsOfUnity 1 F is identically 1 and has empty multiplicative support; the conditional real product is also 1. Instantiate the whole corrected law at F = ℚ, a = b = −1.
- `TauCeti.NormResidueSymbol.global_reciprocity_two_real_dyadic` (computation) — For F = ℚ, m = 2 and {−1,−1}, conicSymbol ℝ (−1) (−1) = −1, conicSymbol ℚ_2 (−1) (−1) = −1, and their product is 1; at odd p both entries are units and the quadratic factor is 1.


**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), Ex. III.6.8 (PDF p. 252).
  Excerpt: “Quadratic Reciprocity. If r, s ∈ Q×, and (r, s)2 is the 2-adic symbol of Ex. 6.6, show that (r, s)∞(r, s)2 ∏ p≠2((r, s))p = +1.”
  Use: The only reciprocity law the source states: the quadratic case over Q, as an exercise.

<a id="node-k2symbolsbrauer-t-7-chern-class-agreement"></a>
### Compatibility of the imported Galois symbol with the imported degree-two Chern class

`K2SymbolsBrauer:T.7/chern-class-agreement` · comparison · implementation unchecked

For every field F and integer m≥1 invertible in F, the imported degree-two étale Chern class c_{2,2} on Quillen K₂, transported along T.1/k2-pi2, factors through K₂(F)/m and equals −h_F, where h_F{a,b}=κ(a)∪κ(b) is M.3’s imported Galois symbol. Here c_{1,1} is determinant followed by the Kummer map and the K₁×K₁ product is the Steinberg symbol with the order (a,b). M.3 owns all maps, coefficient reductions and Tate/S-integer theorems; this node proves only their compatibility on the symbol presentation.

**Hypotheses.**

- F is a field and m is invertible in F.
- c_{2,2} is the étale Chern class exported by MotivicEtaleKTheory M.3 on Quillen K₂; the comparison with Steinberg K₂ is K2SymbolsBrauer:T.1/k2-pi2, which is why the stage requires T.1:plus.


**Construction and proof.**

1. Import c_{i,j} and coefficient naturality from M.3, and the Quillen/Steinberg comparison from T.1/k2-pi2. c_{1,1}(a)=κ(a) is K-book V.11.10.
2. For m=ℓ^ν, specialize Soulé’s thesis Proposition 2.2.2.3, p. 42, to i=j=1 and cohomological degrees k=k′=1. The coefficient −(i+j−1)!/((i−1)!(j−1)!) is −1. Hypothesis (M) holds here: an output c_{2,2} from K₁×K₁ has i+j=2 and k+k′=2; negative cohomological degrees vanish and the only contributing positive-index pair is (1,1),(1,1). Pull the external product over F⊗_Z F back along multiplication to the internal product over F. Therefore c_{2,2}(a·b)=−κ(a)∪κ(b).
3. Identify a·b with {a,b} by the K.7 unit-product contract. Both c_{2,2} and −h_F are homomorphisms on K₂ and agree on every Steinberg generator, so Matsumoto gives equality. The target is killed by ℓ^ν, hence both factor through K₂/ℓ^ν.
4. For composite m use M.3’s coefficient-reduction maps to each ℓ^ν∣m and the Chinese-remainder decomposition of μ_m and its diagonal tensor square. The same formula holds on each prime-power component and coefficient naturality identifies the components of c_{2,2} and h_F. Thus it holds for m; for m=1 the coefficient module is zero. No division by a factorial is used.
5. Tate’s arithmetic isomorphisms and the S-integer étale-localization statement remain M.3’s. Neither a Zariski Chern analogue nor a quadratic comparison is used to fix this étale sign.

**Acceptance.**

- c_{2,2}=−h_F on K₂(F)/m with the minus sign stated, including composite m.
- The prime-power proof explicitly checks Soulé’s (M) and the external-to-internal pullback.
- At Q₇,m=3 the root-trivialized class of c_{2,2}{3,7} has invariant −1/3, while h_F has +1/3; at m=2 the sign collapses.


**Prerequisites.**

- [`K2SymbolsBrauer:T.7/symbol-formula`](#node-k2symbolsbrauer-t-7-symbol-formula)
- `MotivicEtaleKTheory:M.3`
- [`K2SymbolsBrauer:T.1/k2-pi2`](#node-k2symbolsbrauer-t-1-k2-pi2)
- [`K2SymbolsBrauer:T.2/matsumoto`](#node-k2symbolsbrauer-t-2-matsumoto)
- `tauceti:TauCeti.kummerMap`
- `GeneralAlgebraicKTheory:K.7`


**Sources.**

- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), V.11.10 (PDF p. 464).
  Excerpt: “This yields a theory of ´etale Chern classes and hence (by 11.8) Chern class maps ci,n : Kn(X; Z/m) → H2i−n(X, Rπ∗µ⊗i m ) = H2i−n et (X, µ⊗i m ).”
  Use: Grothendieck's étale Chern classes on K-theory with finite coefficients.
- [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), V.11.10 (PDF p. 464).
  Excerpt: “Therefore the Chern class c1,1 : K1(R) → H1 et(Spec(R), µm) is the determinant K1(R) → R× followed by the Kummer map.”
  Use: The degree-one Chern class is the Kummer map.
- [Soule.Thesis.1978](https://www.ihes.fr/~soule/documents/These_Christophe_Soule.pdf), Proposition 2.2.2.3 (Structure multiplicative), pp. 42–44.
  Excerpt: “Structure multiplicative”
  Use: Actual étale Chern product rule with hypothesis (M); i=j=1 gives −1. This is the thesis source, not an unverified locator in the 1979 article.

## Proof gaps and source qualifications

The packets are partial. A decomposed source argument specifies work to prove; it does not close an unread original proof or an unfulfilled supplier contract. The following entries retain both packets’ obligations with their consuming nodes.

### T.1 gap 1: G-Matsumoto: theorem stated without normal-form decomposition

The K-book states Matsumoto's theorem and refers to Milnor's 1971 book, section 12, for a self-contained proof; that book was not obtained. The node states the theorem, records that the normal-form and presentation argument is what the proof consists of, and does not pretend that checking the relations is a proof. A continuation that obtains Milnor's book should decompose that argument.

**Needed by.** [`K2SymbolsBrauer:T.2/matsumoto`](#node-k2symbolsbrauer-t-2-matsumoto).

### T.1 gap 2: Two statements are used exactly as the K-book gives them

The injectivity of the subgroup generated by the symbols x_in(r) into E(R), which the source relegates to an exercise and which the proof of Steinberg's centre theorem needs, and the generation of K_2 by symbols for semilocal rings, attributed to Milnor and to Dennis and Stein. Neither original was obtained. The Dennis-Stein symbols themselves belong to T.6 and are owned by the companion packet for the T.3 part.

**Needed by.** [`K2SymbolsBrauer:T.1/k2-is-centre`](#node-k2symbolsbrauer-t-1-k2-is-centre), [`K2SymbolsBrauer:T.2/symbols-generate`](#node-k2symbolsbrauer-t-2-symbols-generate).

### T.1 gap 3: The general form of the symbol of a unit with its negative rests on a later chapter

The statement that the symbol of r with minus r is trivial for every unit, even when one minus r is not a unit, is deduced in the source from an injectivity between K_2 of two localisations proved in its chapter five, or from a direct proof in Milnor's book. Neither is decomposed here, and the node records the dependence.

**Needed by.** [`K2SymbolsBrauer:T.2/symbol-consequences`](#node-k2symbolsbrauer-t-2-symbol-consequences), [`K2SymbolsBrauer:T.2:symbols/symbol-negative-unit`](#node-k2symbolsbrauer-t-2-symbols-symbol-negative-unit).

### T.1 gap 4: Bass and Tate are cited for two Milnor K-theory computations

The vanishing of the Milnor K-groups in degree at least three for a global field of finite characteristic, and the isomorphism with the elementary abelian two-group of rank r_1 in degree at least three for a number field, are both attributed by the source to Bass and Tate. That paper was not obtained; the node states the results with the attribution.

**Needed by.** [`K2SymbolsBrauer:T.2:symbols/milnor-number-field`](#node-k2symbolsbrauer-t-2-symbols-milnor-number-field), [`K2SymbolsBrauer:T.2:symbols/milnor-global-positive-characteristic`](#node-k2symbolsbrauer-t-2-symbols-milnor-global-positive-characteristic).

### T.1 gap 5: G-matrix: associative-ring elementary calculus

Pinned transvection and diagonal identities inspected are commutative-ring statements. Construct the general associative-ring matrix units and prove the three index cases, reverse product order and w/h images; reconcile U.1 ownership rather than declaring this proof complete.

**Needed by.** [`K2SymbolsBrauer:T.1/elementary-matrices-satisfy`](#node-k2symbolsbrauer-t-1-elementary-matrices-satisfy), [`K2SymbolsBrauer:T.2/steinberg-symbol`](#node-k2symbolsbrauer-t-2-steinberg-symbol), [`K2SymbolsBrauer:T.1:classical/to-elementary`](#node-k2symbolsbrauer-t-1-classical-to-elementary), [`K2SymbolsBrauer:T.2:symbols/diagonal-lift-words`](#node-k2symbolsbrauer-t-2-symbols-diagonal-lift-words), [`K2SymbolsBrauer:T.2:symbols/diagonal-lift`](#node-k2symbolsbrauer-t-2-symbols-diagonal-lift).

### T.1 gap 6: G-colimit: group colimit and finite representatives

The cited DirectLimit is a Type quotient. Supply group operations, compatible homomorphism lift, homomorphism extensionality, finite-representative equality and the stable surjectivity proof.

**Needed by.** [`K2SymbolsBrauer:T.1/stabilisation`](#node-k2symbolsbrauer-t-1-stabilisation), [`K2SymbolsBrauer:T.1/steinberg-is-uce`](#node-k2symbolsbrauer-t-1-steinberg-is-uce).

### T.1 gap 7: G-centre: stable elementary centre and column injectivity

Read and decompose Exercises III.1.8 and III.5.2 plus the column normalization used by III.5.2.1. These missing lemmas cannot be replaced by Subgroup.center.

**Needed by.** [`K2SymbolsBrauer:T.1/k2-is-centre`](#node-k2symbolsbrauer-t-1-k2-is-centre).

### T.1 gap 8: G-classification: trivial-action comparison

Read the fixed-action normalized-section hypotheses in the pinned Tau Ceti theorem. Supply centrality iff trivial induced action and full classification including all classes, keeping fixed kernel identifications.

**Needed by.** [`K2SymbolsBrauer:T.1:classical/central-extension-classification`](#node-k2symbolsbrauer-t-1-classical-central-extension-classification).

### T.1 gap 9: G-lifted-relations: finite splitting details

For III.5.5.1, expand the Hall-Witt special case, intermediate-index independence and the omitted additive relation. Splitting over St_n alone does not prove centrality of St_n->E_n.

**Needed by.** [`K2SymbolsBrauer:T.1/finite-rank-splitting`](#node-k2symbolsbrauer-t-1-finite-rank-splitting).

### T.1 gap 10: G-cover-Hurewicz: chosen plus-cover and Hurewicz maps

The early K.2:plus and H.3 documents are the right owners, but require explicit BE-plus cover and natural Hurewicz comparison interfaces for the K2-pi2 composite.

**Needed by.** [`K2SymbolsBrauer:T.1/k2-pi2`](#node-k2symbolsbrauer-t-1-k2-pi2).

### T.1 gap 11: G-Whitehead: block elementary factorization

Obtain the generator-level U.1 Whitehead block factorization diag(P,P^-1) and its compatible elementary lifts to prove GL-conjugation invariance of star products.

**Needed by.** [`K2SymbolsBrauer:T.2/star-product`](#node-k2symbolsbrauer-t-2-star-product).

### T.1 gap 12: G-universal-negative: Laurent-ring localization injection

The general negative-unit identity uses the universal Laurent polynomial ring and its localization, as in V.6.1.3. That proof was not decomposed; no arbitrary-ring localization-injectivity claim is made.

**Needed by.** [`K2SymbolsBrauer:T.2:symbols/symbol-negative-unit`](#node-k2symbolsbrauer-t-2-symbols-symbol-negative-unit).

### T.1 gap 13: G-finite-units: cyclicity and finite counting

The finite-field K2 proof needs a pinned cyclicity declaration for Fq× and a finite-cardinality implementation. ZMod is only a carrier.

**Needed by.** [`K2SymbolsBrauer:T.2/k2-finite-field`](#node-k2symbolsbrauer-t-2-k2-finite-field).

### T.1 gap 14: G-graded-quotient: homogeneous ideal and grading

Construct the Steinberg ideal as homogeneous degree-two generators and prove the quotient degree decomposition, generators, universal property and symbol functoriality. TensorAlgebra and RingQuot alone do not supply this.

**Needed by.** [`K2SymbolsBrauer:T.2/milnor-k-theory`](#node-k2symbolsbrauer-t-2-milnor-k-theory), [`K2SymbolsBrauer:T.2/graded-map`](#node-k2symbolsbrauer-t-2-graded-map).

### T.1 gap 15: G-algclosed: unique divisibility in degrees at least two

Obtain/decompose Exercise III.7.3 and the norm argument from III.6.4; the algebraically closed computation is not valid in degrees zero and one.

**Needed by.** [`K2SymbolsBrauer:T.2:symbols/milnor-algebraically-closed`](#node-k2symbolsbrauer-t-2-symbols-milnor-algebraically-closed).

### T.1 gap 16: G-real: complementary divisibility

Expand the induction for the real positive-degree divisible summand; the sign map proves a nonzero Z/2 summand but not the full decomposition.

**Needed by.** [`K2SymbolsBrauer:T.2:symbols/milnor-real`](#node-k2symbolsbrauer-t-2-symbols-milnor-real).

### T.1 gap 17: G-Bass-Tate: arithmetic Milnor computations

The source attributes number-field and positive-characteristic global-field computations to Bass-Tate. These external proofs were not obtained; each result now has its own node.

**Needed by.** [`K2SymbolsBrauer:T.2:symbols/milnor-number-field`](#node-k2symbolsbrauer-t-2-symbols-milnor-number-field), [`K2SymbolsBrauer:T.2:symbols/milnor-global-positive-characteristic`](#node-k2symbolsbrauer-t-2-symbols-milnor-global-positive-characteristic).

### T.1 gap 18: G-product-symbol: equality with the chosen classical map

Read IV.1.10-.1 and request the map-level product/symbol comparison from K.7. The product map descends by the Steinberg relation, but its degree-two isomorphism needs this compatibility and Matsumoto.

**Needed by.** [`K2SymbolsBrauer:T.2/graded-map`](#node-k2symbolsbrauer-t-2-graded-map), [`K2SymbolsBrauer:T.2/graded-map-degree-three`](#node-k2symbolsbrauer-t-2-graded-map-degree-three).

### T.3 gap 1: The twisted coefficient module is missing from both libraries

Checked at the pinned commits: neither library has μ_m^{⊗j} for j ≠ 0, 1. Tau Ceti has the weight-one module TauCeti.KummerCoeff (Coefficients.lean:107) with its discrete G_K-action, and Mathlib has modularCyclotomicCharacter (CyclotomicCharacter.lean:212). The tensor-power twists are MotivicEtaleKTheory M.1's target ('Import finite/continuous Tate twists…'; the reviewed audit AUDIT-30 lists 'Finite and continuous Tate-twist coefficient modules mu_(l^r)^(x)j' under M.1), and M.1 is upstream of T.7 through M.3. They are therefore requested from M.1, not constructed in T.7. This entry is superseded by that request and should be deleted when the request is answered; ClassFieldTheory Layer 5 does not supply the module (it pairs μ_n × μ_n → μ_n through kummerCupPairing ζ).

**Needed by.** [`K2SymbolsBrauer:T.7/twisted-roots-of-unity`](#node-k2symbolsbrauer-t-7-twisted-roots-of-unity), [`K2SymbolsBrauer:T.7/symbol-formula`](#node-k2symbolsbrauer-t-7-symbol-formula), [`K2SymbolsBrauer:T.7/brauer-valued-symbol`](#node-k2symbolsbrauer-t-7-brauer-valued-symbol).

### T.3 gap 2: Imported arithmetic Tate theorems and higher reciprocity still await their owner packets

The local Artin/cup normalization is now proved from Milne III.3–4, and the étale Chern sign is proved from Soulé thesis 2.2.2.3. The remaining arithmetic Tate local/global/S-integer isomorphisms belong to M.3 and higher Hilbert reciprocity to ClassicalArithmeticCompletion CA.1; the exact existing requests are retained. T.7 proves adapters and no arithmetic Tate theorem. This entry records unfulfilled supplies, not a missing proof of the two normalization adapters.

**Needed by.** [`K2SymbolsBrauer:T.7/global-reciprocity`](#node-k2symbolsbrauer-t-7-global-reciprocity), [`K2SymbolsBrauer:T.7/symbol-formula`](#node-k2symbolsbrauer-t-7-symbol-formula).

### T.3 gap 3: The Dennis-Stein relations and the presentation theorems are cited, not proved

K-book III.5.11 (PDF p. 234) cites (D1)–(D3) to Dennis–Stein ([48], K2 of radical ideals and semilocal rings revisited, LNM 342, 1973) and attributes Theorem III.5.11.1 to Maazen, Stienstra and van der Kallen with Keune ([103], The relativization of K2, J. Algebra 54 (1978), 159–177) as the reference; neither proof is in the source. The nodes derive the field cases from Matsumoto's theorem; the relations for a general commutative ring, part (a) for local rings that are not fields, and part (b) remain open. NEXT SOURCE ACTION: obtain Keune 1978 and Dennis–Stein 1973.

**Needed by.** [`K2SymbolsBrauer:T.6/dennis-stein-relations`](#node-k2symbolsbrauer-t-6-dennis-stein-relations), [`K2SymbolsBrauer:T.6/dennis-stein-presentation`](#node-k2symbolsbrauer-t-6-dennis-stein-presentation), [`K2SymbolsBrauer:T.6/relative-presentation`](#node-k2symbolsbrauer-t-6-relative-presentation).

### T.3 gap 4: The Keune-Loday comparison with the homotopy-fibre relative group is cited, not proved

The stage text makes the square-zero examples 'tests of K.5', whose relative K-theory is the homotopy fibre of K(A) → K(A/I). The comparison of its π₂ with the relative group K₂(R, I) of K-book Definition III.5.7 is attributed to Keune and Loday in K-book IV.1.11 (PDF p. 276) and not proved there, and neither GeneralAlgebraicKTheory K.5's text nor this packet owns it. Until it is supplied the T.6 computations test the classical relative group only.

**Needed by.** [`K2SymbolsBrauer:T.6/relative-steinberg-group`](#node-k2symbolsbrauer-t-6-relative-steinberg-group), [`K2SymbolsBrauer:T.6/relative-square-zero`](#node-k2symbolsbrauer-t-6-relative-square-zero).

### T.3 gap 5: G-monomial-kernel: the finite-rank unit-symbol import has no owning node

The upper generation bound uses the finite-rank monomial-kernel theorem for every commutative ring A and n≥3: ker(St_n(A)→E_n(A))∩W_n is central and generated by unit symbols, compatibly with stabilization (Milnor Corollary 9.3 and Theorem 9.11). The companion T.2:symbols packet has diagonal words and commuting-unit symbols, but no declaration with this conclusion. Its symbols-generate theorem covers fields/division rings or commutative semilocal rings, which does not apply to ℤ. Keep the stage prerequisite K2SymbolsBrauer:T.2:symbols until its owner supplies an exact node and the central monomial-word reduction proof; do not substitute Matsumoto or the semilocal theorem. The upper bound, and hence the integer and rational calculations that consume it, remain conditional on this import.

**Needed by.** [`K2SymbolsBrauer:T.5/integer-kernel-upper-generation`](#node-k2symbolsbrauer-t-5-integer-kernel-upper-generation).

### Source qualifications

Source-issue identifiers are scoped to their originating packet: the two parts reuse `K2SymbolsBrauer/E1` and `E2` for different observations. Their identity and recorded verdicts are retained in the packets; the labels below always include the part.

#### T.1: K2SymbolsBrauer/E1

Source: `Kbook.2013`, III.7.2(b), author copy 2013-08-29, printed p.245 / PDF p.253.

Printed: “If F is algebraically closed then K_n^M(F) is uniquely divisible.”

Qualification: Insert n >= 2. In degree one the group is F× and is divisible but can have torsion; degree zero is Z.

Reason: Take F=C. K1^M(C)=C× contains -1 of order two, so multiplication by two is not injective; K0^M(C)=Z is not divisible.

#### T.1: K2SymbolsBrauer/E2

Source: `Kbook.2013`, III.5.5.1, author copy 2013-08-29, printed p.220 / PDF p.228, final sentence of statement.

Printed: “Hence St_n(R) is the universal central extension of E_n(R).”

Qualification: The splitting proof alone supplies universality only after centrality of the map St_n(R)->E_n(R) is separately justified. Retain splitting for n>=5; state a finite-rank UCE conclusion conditionally on centrality or a verified kernel-stability hypothesis.

Reason: Recognition III.5.4 starts with a central extension. The proof in III.5.5.1 splits central extensions over St_n, but does not establish that the different map St_n->E_n has central kernel. The stable centre proof increases the rank arbitrarily and cannot by itself supply that missing finite-rank input.

#### T.1: K2SymbolsBrauer/E-central-subgroup-coefficients

Source: `Weibel.HA.Groups`, Example6.8.4, printed p.196/PDF37 of the inspected Cambridge chapter scan; hash in sourceVersions; text and image read2026-10-02..

Printed: “If H is in the center of G, G/H acts trivially on H_*(H;A) and H^*(H;A).”

Qualification: For the asserted trivial quotient action, take A with trivial G-action (in particular A=Z, the following example’s coefficients). Centrality of H alone does not imply the statement for an arbitrary G-module A.

Reason: Take H=1, G=C₂ and A=Z with the nonidentity element acting by−1. Then H lies in the centre, but H₀(1;A)=A and its induced G/H action is multiplication by−1, which is nontrivial. The integral trivial-coefficient five-term construction in this packet meets the corrected qualification.

#### T.3: K2SymbolsBrauer/E1

Source: `Kbook.2013`, III.5.11, the paragraph after (D1)–(D3), PDF p. 234 (draft p. 226), author-hosted draft of 29 August 2013.

Printed: “By (D3) of our definition, ⟨r, 1⟩=0 for all r.”

Qualification: By (D3), ⟨r, 1⟩ = 1 for every r with 1 − r a unit.

Reason: (D1)–(D3) are written multiplicatively ((D1) reads ⟨r, s⟩⟨s, r⟩ = 1), and (D3) with s = t = 1 gives ⟨r, 1⟩ = ⟨r, 1⟩⟨r, 1⟩, so ⟨r, 1⟩ is the identity 1, not 0; for a unit r this agrees with ⟨r, 1⟩ = {r, 1 − r} = 1 (Lemma III.5.10.2). The symbol ⟨r, 1⟩ is defined only when 1 − r is a unit, so 'for all r' must be restricted.

#### T.3: K2SymbolsBrauer/E2

Source: `Kbook.2013`, III.6.2.3 (Example 6.2.3, norm residue symbols), PDF p. 241 (draft p. 233).

Printed: “The name “norm residue” comes from the fact that for each x, the map y ↦ {x, y} is trivial if and only if x ∈ NK×.”

Qualification: … the map y ↦ (x, y)_F is trivial if and only if x ∈ NK×.

Reason: With the Steinberg symbol {x, y} ∈ K₂(F) the 'if' direction is false. Here NK^× = F^×m (local reciprocity, as Gal(K/F) has exponent m and order #(F^×/F^×m)). If {a^m, y} = {a, y}^m were 1 for all a, y, then K₂(F), generated by symbols, would be m-torsion, forcing the uniquely divisible summand U of Moore's Theorem 6.2.4 to vanish; but K₂(F) is uncountable (Corollary III.6.3.2, since a local field contains ℚ(t) or 𝔽_p(t₁, t₂)) while μ_m is finite. With (x, y)_F the statement is the nondegeneracy of the pairing, which is how the next sentence uses it ('(ζ, x)_F ≠ 1').

#### T.3: K2SymbolsBrauer/E3

Source: `Kbook.2013`, III.6.2.3 (Example 6.2.3), last two sentences before Moore's Theorem 6.2.4, PDF p. 241 (draft p. 233).

Printed: “Since a primitive mth root of unity ζ is not a norm from K, it follows that there is an x ∈ F such that (ζ, x)F ≠ 1. Therefore the norm residue symbol is a split surjection with inverse ζi ↦ {ζi, x}.”

Qualification: Since μ_m is the whole group of roots of unity of F, ζ has order exactly m in F^×/F^×m = F^×/NK^× (if ζ^{m/p} = y^m for a prime p | m, then y would be a root of unity in F of order mp). By nondegeneracy the homomorphism (ζ, −)_F : F^× → μ_m therefore has order m and is onto, so there is x ∈ F^× with (ζ, x)_F = ζ; for such x, ζ^i ↦ {ζ^i, x} is a section (a right inverse) of the norm residue symbol.

Reason: (ζ, x)_F ≠ 1 only says that (ζ, x)_F is a non-trivial root of unity, which for composite m need not generate μ_m: for F = ℚ₅ (μ(F) = μ₄) and ζ = i, if (i, x₀)_F = i then x = x₀² has (i, x)_F = −1 ≠ 1, and ζ^i ↦ {ζ^i, x₀²} is not a section. The map is a section, not an inverse, since its kernel U is non-zero.

#### T.3: K2SymbolsBrauer/E4

Source: `Kbook.2013`, III.6.2.3 (Example 6.2.3), proof of the Steinberg identity, PDF p. 241 (draft p. 233).

Printed: “the element g of GF = Gal(K/F) corresponding to the map ζ(a) = (a, 1 −a)F from F× to µm must belong to GE, i.e., ζ must extend to a map E× →µm. But then (a, 1 −a)F = ζ(a) = ζ(x)m = 1.”

Qualification: The element g of Gal(K/F) attached to 1 − a — whose homomorphism is (1 − a, −)_F under the stated adjunction x ↦ (x, −)_F — lies in Gal(K/E) because 1 − a is a norm from E; so g fixes x, and (1 − a, a)_F = g(x)/x = 1. Replacing a by 1 − a gives (a, 1 − a)_F = 1.

Reason: Under the adjunction the source fixes one line earlier, x ↦ (x, −)_F, the element attached to 1 − a gives the homomorphism (1 − a, −)_F, not y ↦ (y, 1 − a)_F, so the variables are in the wrong order; and 'ζ(x)^m' evaluates an extension of ζ at x ∈ E, which the Kummer description over F does not provide, since x need not have an m-th root in K. The conclusion is right and the corrected argument is one line.

#### T.3: K2SymbolsBrauer/E5

Source: `Kbook.2013`, Chapter III, Exercise 6.2, PDF p. 251 (book p. 243) of the author-hosted draft of 29 August 2013.

Printed: “show that {e1, e2} is a product of symbols {e1, e′2} and {e, e′′2} with e, e′2, e′′2 polynomials of degree < d”

Qualification: {e1, e2} = {h, e2}{h, e1}^{−1}{e1, −1} with h = e1 − e2 of degree < d, so {e1, e2} is a product of symbols each having at most one entry of degree d (that entry being e1 or e2); consequently the subgroup L_d of K_2 F(t) generated by symbols of polynomials of degree ≤ d is generated by L_{d−1} and the symbols {π, a} with π irreducible of degree d and deg a < d.

Reason: Counterexample with E = ℚ(t), u = t, d = 1, e1 = t, e2 = t − 2: the tame symbol of {t, t − 2} at the place t = 2 is 1/2 (Lemma III.6.3), while every symbol {t, c} and {c, c′} with c, c′ ∈ ℚ^× is a unit at that place and has trivial tame symbol there, so {t, t − 2} is not such a product. The book's own Lemma III.6.1.4, which the exercise claims to generalise, produces a factor {a, y} with y = u − a2 of degree d. The corrected identity follows from the Steinberg relation for h/e1 + e2/e1 = 1.

#### T.3: K2SymbolsBrauer/E6

Source: `Kbook.2013`, III.7.4, proof of Theorem 7.4, PDF p. 255 (book p. 247).

Printed: “generated by those symbols {f1, . . . , fr}”

Qualification: {f1, . . . , fn}: the symbols lie in K^M_n F(t).

Reason: L_d is defined inside K^M_n F(t), whose symbols have n entries; r is not otherwise defined.

#### T.3: K2SymbolsBrauer/E7

Source: `Kbook.2013`, III.7.4.1, proof of Lemma 7.4.1, PDF p. 255 (book p. 247).

Printed: “we observe that if āi + āi+1 = 1 in k then ai + ai+1 = 1 in F.”

Qualification: then ai + ai+1 = 1 in F[t].

Reason: The a_i are the representatives in F[t] of degree < d; a_i + a_{i+1} − 1 has degree < d and is divisible by π, so it vanishes in F[t]. The a_i need not be constants.

#### T.3: K2SymbolsBrauer/E8

Source: `Kbook.2013`, III.7.6.4, proof of Proposition 7.6.4, last display, PDF p. 258 (book p. 250 of the draft; p. 272 of the published edition).

Printed: “Na/F (NE′/F′x) = −∂∞(NE(t)/F(t)y) = −NE/F (∂∞y) = NE/F (Na/F x).”

Qualification: The last term is NE/F(Na/E x).

Reason: x lies in K^M_n(E′) and N_{a/E} : K^M_n(E′) → K^M_n(E) is the map in the top row of the square being proved; N_{a/F} x is not defined.

#### T.3: K2SymbolsBrauer/E9

Source: `Kbook.2013`, Exercise III.7.1 (PDF p. 265; GSM 145 p. 280 per the errata).

Printed: “7.1. Let v be a discrete valuation on a field F. Show that the maps λ: KMn(F) → KMn(kv) and ∂v : KMn(F) → KMn−1(kv) of Theorem 7.3 are independent of the choice of parameter π, and that they vanish on l(u) · KMn−1(F) whenever u ∈ (1 + πR).”

Qualification: ∂v is independent of π; λ is not. For π′ = cπ, λ_{π′}(x) = λ_π(x) − ∂v(x)·{c̄} in the roadmap's normalisation ({c̄}·∂v(x) with a sign in Theorem III.7.3's); in degree one λ_π(π) = 1 but λ_{π′}(π) = c̄^{−1}.

Reason: On ℚ with the 5-adic valuation, λ_5{5} = 1 while λ_{10}{5} = res(5/10) = 3 in F_5^×.

#### T.3: K2SymbolsBrauer/E10

Source: `Kbook.2013`, Exercises III.7.7 and III.7.9 (PDF pp. 265–266).

Printed: “Hint: If F(t)v and E(t)w denote the completions of F(t) and E(t) at v and w, respectively, use Ex. 7.7 and Lemma 7.6.3 to show that the following diagram commutes.”

Qualification: Ex. III.7.7 is stated for 'finite field extensions' F′ of F, but the hint of Ex. III.7.9 applies it with F′ = F(t)_v, a completion, which is not finite over F(t). The statement holds for every field extension F′/F (the argument through Milnor's sequence for F′(t), node T.4/transfer-base-change, does not use finiteness), and that is the form the hint needs. 'Lemma 7.6.3' in the hint is Corollary 7.6.3.

Reason: The completion F(t)_v has infinite degree over F(t), so the left square of the hinted diagram is not an instance of Ex. III.7.7 as stated.

#### T.3: K2SymbolsBrauer/E11

Source: `Kbook.2013`, Exercise III.7.10 (PDF p. 266; p. 258 in the draft's own page numbering).

Printed: “7.10. If v is a valuation on F, and x ∈ KMi(F), y ∈ KMj(F), show that ∂v(xy) = λ(x)∂v(y) + (−1)^j ∂v(x)ρ(y) where ρ: KM∗(F) → KM∗(kv) is a ring homomorphism characterized by the formula ρ(l(uπ^i)) = l((−1)^i ū).”

Qualification: With Theorem III.7.3's normalisation ∂v{π, u2, …, un} = {ū2, …, ūn}, the formula is ∂v(xy) = (−1)^i λ(x)∂v(y) + ∂v(x)ρ(y) for x ∈ KM_i(F), y ∈ KM_j(F). The printed formula holds for the opposite normalisation ∂v{u1, …, u_{n−1}, π} = {ū1, …, ū_{n−1}}, which is (−1)^{n−1} times Theorem III.7.3's ∂v on KM_n(F) and is the one this roadmap uses.

Reason: Take F = ℚ, v the 5-adic valuation, π = 5, x = {5}, y = {2} (i = j = 1). Theorem III.7.3 gives ∂v{5, 2} = {2̄}, i.e. 2 in F_5^×. The printed formula gives λ{5}∂v{2} − ∂v{5}ρ{2} = 0 − {2̄}, i.e. 2^{−1} = 3 in F_5^×. In the algebra L of the proof of Theorem III.7.3, d(x) = λ(x) + Π·∂v(x) with Π on the left (as ∂v{π, u2, …} = {ū2, …} requires); expanding d(x)d(y) with Π·a = (−1)^{|a|}a·Π and Π² = {−1}Π gives the corrected formula, while reading the coefficient of Π on the right gives the printed one.

#### T.3: K2SymbolsBrauer/E12

Source: `Soule.Thesis.1978`, 2.2.1.1, p. 34.

Printed: “d’ordre q”

Qualification: Require a,b∈F× and say the class is killed by q, with exact order requiring additional hypotheses.

Reason: The author-hosted typed thesis says the symbol-algebra class has order q for arbitrary a,b. Even for nonzero a=b=1 it is split, so only annihilation by q is unconditional. The same paragraph initially permits a,b∈F, while the central-simple symbol algebra requires a,b nonzero. These surrounding claims are not used for the Chern product rule.

#### T.3: K2SymbolsBrauer/E13

Source: `GilleSzamuely.2006`, First edition (2006), p. 197, the paragraph before Lemma 7.3.6 and the lemma itself (PDF p. 211 of the author-hosted copy, SHA-256 3697582f…1e63).

Printed: “Let e_j be the smallest positive integer with M_j^{e_j} = 0.”

Qualification: For a general finite extension K = k(a_1, …, a_r), the multiplicity in the diagram of Lemma 7.3.6 is the composition length of the local Artinian L-algebra R_j as a module over itself, not the nilpotence index of its maximal ideal. For a simple extension K = k(a) the two coincide (R_j ≅ L[t]/(g_j^{e_j})), so the case r = 1, Lemma 7.2.6, and Kato's theorem are unaffected; the induction in the proof of Lemma 7.3.6 multiplies lengths in towers, which nilpotence indices do not satisfy.

Reason: Take k = F_p(s, t), K = k(s^{1/p}, t^{1/p}) = k(a_1, a_2) and L = K. Then K ⊗_k K ≅ K[X, Y]/((X − a_1)^p, (Y − a_2)^p) is local with residue field K, length p² and nilpotence index 2p − 1. In degree zero the norm is multiplication by the degree (Remark 7.3.1), so the upper route of the diagram sends 1 ∈ K_0^M(K) = ℤ to [K : k] = p², while the lower route with the printed e_1 gives 2p − 1: 4 against 3 for p = 2, 9 against 5 for p = 3. With the length the lower route gives p².

## Requests and ownership contracts

The complete supply requests, consumer notes and stage-graph changes are collected in [the assembly handoff](../handoff/ASM-K2SymbolsBrauer.md). They remain contracts of their listed owners. An existing upstream roadmap is imported without being replanned; a stronger scope request belongs to that owner or its Part II. The local all-m Hilbert-symbol owner between T.7 and CA.1 still requires a maintainer decision.
