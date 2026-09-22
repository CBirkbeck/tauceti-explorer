# PAPER-WITASZEK-22 — mixed-characteristic positivity and quotients

Status: **partial checkpoint**. Agent: Codex, session `codex-a71f92`. Issue: [#1101](https://github.com/CBirkbeck/tauceti-explorer/issues/1101). Read and checked on 22 September 2026.

The extraction contains 157 items: 13 pinned-library imports, 5 existing-layer imports, and 139 missing items, each assigned exactly one route. Its 38 definitions/constructions have use-derived API outlines and 114 mathematical tests. These are planning statements, not Lean proofs. The whole main preprint is read, but publication collation and original-input proof closure remain open. Passing the schema checker does not close those gaps.

## Source and version

The source read completely, including every proof and the references, is [Witaszek, arXiv:2002.11915v2](https://arxiv.org/pdf/2002.11915v2), dated 23 January 2022, 46 pages. SHA-256:

`5ab792128995b0735311a5284620e5d14549ecc6c5be08595c5d8cdffedda842`.

The [publisher record](https://annals.math.princeton.edu/2022/195-2/p04) matches the author, title and DOI, Annals of Mathematics 195 (2022), 655–705, DOI 10.4007/annals.2022.195.2.4. The identified [published public deposit](https://par.nsf.gov/servlets/purl/10429755) repeatedly timed out; the journal's 51-page text has **not** been collated. The author publication list was checked, but this is not certification that no correction exists. The JSON reading log gives URLs, hashes, dates and exact reading boundaries for every acquired supporting PDF.

Selected primary proofs were read in Kollár's finite-relation and proper-action papers, Keel's 1999 paper, Cascini–Tanaka, and the Stacks Project. Keeler's uniform-vanishing statement and the entire appended 2018 corrigendum were read. BMPSTWW §2.8 was read for its correction history and later extensions. None of these supporting papers is represented as wholly extracted.

## What the paper contributes

The algebraic mechanism starts with **direct-limit multiplicative perfection**. Over mixed characteristic the p-power map need not preserve addition; the construction is a commutative monoid, and perfected line-bundle sections form sheaves of sets. The two halves of Lemma3.4 are separated: integral finite generation clears one common denominator for surjectivity, while kernel p-torsion and nilpotence, combined with binomial divisibility, yield eventual equality for injectivity.

This produces a rational-fiber pullback square for perfected sections. Separately, Theorem1.7 constructs a **2-pullback of Picard groupoids after inverting p**. It is decomposed into characteristic-p, thickening, reduction and conductor-induction steps. Isomorphisms and their automorphisms are essential: a statement only about Picard groups would lose the compatibility needed to glue sections and polarizations.

The pushout argument then uses arithmetic fiber-product rings, étale descent and affine–contraction–affine factorization. Definition2.17's “topological pushout” is deliberately weaker than a categorical pushout. A geometric pushout adds the ring-sheaf fiber product and has a genuine universal property. Geometric pushouts need not be Noetherian; Lemma2.22 supplies only a finite-type **topological** approximation.

The resulting dependencies divide into two applications:

- Finite relations and proper group actions: integral-relative quotients, finite pinching, lower-dimensional relation induction and conductor descent yield Theorems1.4 and1.5. The relation is set-theoretic on geometric points and can have nilpotents; it is not assumed to be a closed immersion into the product. The action is proper; no general GIT assertion is inferred.
- Positivity: Picard/section descent and pushouts give the separate semiample and EWM gluing theorems, reduction plus rational-fiber detection, mixed-characteristic Keel, and the surface/threefold applications.

Theorem6.1 proves the semiample criterion over an excellent base. Its EWM analogue additionally requires a base of finite type over a mixed-characteristic Dedekind domain. The final klt threefold corollary keeps absolute dimension3, projectivity and surjectivity over the Dedekind spectrum, perfect closed residue fields, and both nef-and-big assumptions. Locally finite positive-characteristic closed residue fields give semiampleness. The JSON records the plt corollary and relative surface proposition separately.

## Ownership and imports

| Route | Items | Scope |
| --- | ---: | --- |
| SchemeAndStackFoundations:SF.0 | 23 | Universal-homeomorphism algebra, direct-limit perfection and section adapters |
| SchemeAndStackFoundations:SF.1 | 64 | Algebraic-space morphism adapters, conductor/Picard patching, pinching, pushouts and quotients |
| SchemeAndStackFoundations:SF.4 | 2 | Source-scoped compactification and formal contraction inputs |
| SchemeAndStackFoundations:SF.5 | 2 | General intersection positivity and the surface Riemann–Roch calculation |
| SchemeAndStackFoundationsMixedCharacteristicPositivity | 47 | Proposed Part II: relative positivity, gluing, Keel and the exact surface/threefold applications |
| NumericalPicardAndContractionDescent | 1 | Reuse the identically named pending PAPER-SCHROER-23 Part II for finite-type numerical Picard input |

The first Part II imports the foundations roadmap first. It does not move all minimal-model theory into SF.4. Its brief states the final theorems, source guards, detailed intermediate targets and unresolved primary-source obligations.

The numerical Picard route is **the same pending proposal** already made in PAPER-SCHROER-23, not a competing roadmap. That extraction is partial and unreviewed in the inspected snapshot. The two requests must be coalesced before issuing the design. Its general numerical Picard supplier is needed by Keel's torsion argument over locally finite fields, not by a duplicate curve Jacobian construction.

StableReduction's full README, Jacobian's relevant layers and their shared contracts, the foundations roadmap, its reviewed audit, and the live restructuring layer decisions were inspected. The additional upstream comparisons include ModularCurves, ReductiveGroups and AdicSpaces. The catalogue/tree, scoped packet and paper-route searches found no general mixed-characteristic positivity owner. This is not a claim that every unrelated packet was read. A new source lemma discovered during closure must receive a fresh declaration/owner search.

The existing-layer imports are relative Spec, global generation, relative ampleness, coherent proper direct image/base change, and curve degree. StableReduction Layer2's finite-type relative Proj and polarized scheme descent are imported, not recreated. Jacobian LayerA remains the divisor/degree/Picard supplier; its curve Riemann–Roch is not general surface Riemann–Roch.

The pinned baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Actual declarations were opened before citation. In addition to invertible sheaves, integral/proper/finite morphisms and filtered colimits, the extraction imports:

- `PrimeSpectrum.isHomeomorph_comap` and the purely inseparable tensor-product base-change theorem;
- `conductor A (0 : B)`, which already gives the affine conductor of the image of A in B. Only localization/sheaf gluing and the conductor-square comparison need the new adapter.

Two near matches must not be substituted: Mathlib's `Perfection` is an **inverse limit**; Tau's `InvertibleSheaf` is a **full category** of module maps. The latter's core supplies Picard groupoids. Tau's `LineBundleClass` commutative monoid is also built, but its file explicitly does not assert inverses, and passing to classes discards automorphisms.

## Source diagnostics that change the extraction

1. The v2 EWM definition has the reversed printed inequality. The page image was checked. The intended condition is `dim f(V) < dim V`, for every integral V. [BMPSTWW Remark2.49](https://arxiv.org/pdf/2012.15801v3) separately documents the older curve-only-definition problem; it is not evidence for the inequality typo itself.
2. Lemma2.1 needs finite **surjective** pullback. A closed point in P¹ with L=O disproves the unguarded version: the point restriction is big in dimension0 but O on P¹ is not. Proposition5.2 actually chooses a component surjecting onto the target, exactly the repaired scope.
3. Theorem6.1's Dedekind restriction for EWM and Corollary6.7's perfect-residue guard are retained. Later BMPSTWW extensions do not rewrite Witaszek's proved statement; the introductory corollary's omitted perfection guard is recorded.
4. Lemma6.8's conductor on a generic fiber may be empty. The degree estimate gives at most one geometric point, not nonemptiness. This is sufficient for the connected-fiber-over-image application.
5. The cited Keel5.2 formulation, nef numerical dimension1 plus a nonzero section, is too weak. An independent diagnostic is the ruled surface P_E(O⊕M), E an elliptic curve over C, M degree-zero nontorsion, with L=O(1). It is nef, L²=0, and has degree1 on a ruling fiber, but h⁰(L^m)=1 for every m>0; every such unique section vanishes. Thus no power is generated. Witaszek's proof gives the stronger linear Euler growth and bounded H², hence growing h⁰ and κ=1. The extraction requests the guarded ν=κ=1 theorem and leaves its primary proof reconciliation open.
6. The acquired early Kollár97 preprint uses weak normalization where Witaszek cites seminormalization. Published-version comparison or an explicit transport proof is still needed.
7. [Cascini–Tanaka v3](https://arxiv.org/abs/1706.04845v3), dated June2026, reports a gap in Theorem2.30 affecting Proposition3.2 and gives a replacement proof. The four earlier lemmas used here were compared between v2 and v3: observed differences are formatting/glyph changes. That comparison does not certify all transitive dependencies.
8. The [Keeler v5 corrigendum](https://arxiv.org/pdf/math/0108068v5) changes the alteration setup by a finite faithfully flat base change. Its E2.5 preserves the needed Fujita statement. The original §5 proof and de Jong roots are not yet closed.

These are explicit diagnostics, not silent changes presented as verbatim source statements. The conjecture and work-in-progress in the introduction are excluded from proved targets.

## Checks and remaining work

The repository paper checker passes; its local bytes match the live checker blob `cf3cae9e7d2d41209bf9fa4d719fd6fe17a69f1f`. A separate audit checks unique identifiers, resolved/acyclic dependency edges, gap references, exactly one route for every missing item, and API/use/test coverage. All tests in the extraction remain unexecuted in Lean; no Lean file is required or supplied for this paper job.

The twelve named gaps are substantive. In particular, the Artin/Temkin and seminormal-conductor entries are **required interfaces whose original proof closure is open**, not claims of fully verified source imports. The remaining work includes the published paper comparison, original Stacks/Kollár/Artin/Temkin chains, corrected Keeler vanishing, surface adjunction and abundance, characteristic-zero BPF, numerical Picard finiteness, and a final complete paragraph-level decomposition. The dependency graph is syntactically closed on the recorded items; the mathematical proof graph is not yet transitively closed.

The [handoff](../handoff/PAPER-WITASZEK-22.md) gives the resumption order. Keep `status: partial` until those tasks, including the source-to-library search for newly exposed inputs, are actually done.

## Continuation: the ν=κ=1 surface theorem proved (Claude Code, cc-fb70e5, 22 September 2026)

Handoff task 2 asked for a primary-source proof, or a completed fibration proof, of the corrected input to Corollary 6.7: on a normal projective surface over an algebraically closed field, a nef L with L²=0 and κ(L)=1 is semiample. The item `surface-abundant-nef` now carries a complete, characteristic-free proof.

1. Write |mL|=|M|+F, with M the moving part and F the fixed part.
2. Nefness and L²=0 give L·M=L·F=M²=M·F=F²=0.
3. M²=0 makes the pencil |M| base-point-free, so M=f*A for a fibration f:S→C and an ample divisor A.
4. F is vertical, and Zariski's lemma on each connected fibre makes F a rational combination of full fibres.
5. So kmL∼f*(ample), and L is semiample.

Diagnostic D5 remains: the bare h⁰>0 hypothesis is insufficient. Corollary 6.7 supplies κ=1 through the linear growth of χ, which is item `surface-rr-growth` and still needs its Riemann–Roch input read.
