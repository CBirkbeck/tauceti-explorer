# REV-ShimuraData~3 — independent review

Codex, session **codex-rE68AX**, 2026-10-09. Issue [#7554](https://github.com/CBirkbeck/tauceti-explorer/issues/7554); [claim](https://github.com/CBirkbeck/tauceti-explorer/issues/7554#issuecomment-6074643722) confirmed by the bot. This session wrote none of BP-ShimuraData, BP-ShimuraData~2 or BP-ShimuraData~3. The revision author was `codex-w7eqoq` on [#7567](https://github.com/CBirkbeck/tauceti-explorer/issues/7567).

**Verdict: needs_changes. This is a completed independent review, not a checkpoint.** All nine D5 defects in [REV-ShimuraData~2](REV-ShimuraData~2.md) have been repaired. The new E17 source finding is confirmed. Five opening D0 prototypes still omit their specified conclusions. Their packet statements are sound, but the suggested signatures give abstract isomorphism consequences or a scalar calculation instead of those comparisons. The packet records the discrepancy individually and in a precise gap. Open proof leaves and honestly omitted unavailable hypotheses, permitted by PROTOCOL §13, are not the rejection reason.

## Complete register

All 123 nodes were checked for source evidence, hypotheses, direct prerequisites, proof route, granularity, API, tests, suggested signature and planet. The packet's `review.checked` has a distinct mathematical note for each; none was deferred.

| Stage | Nodes | Verified | Corrected | Unverifiable | Added |
| --- | ---: | ---: | ---: | ---: | ---: |
| D0 | 5 | 0 | 0 | 5 | 0 |
| D1 | 25 | 21 | 4 | 0 | 0 |
| D2 | 13 | 13 | 0 | 0 | 0 |
| D3 | 27 | 25 | 2 | 0 | 0 |
| D4 | 15 | 15 | 0 | 0 | 0 |
| D5 | 38 | 35 | 3 | 0 | 0 |
| Total | 123 | 109 | 9 | 5 | 0 |

No node was added, removed or renamed. Counts remain 19 definitions, 25 constructions, 53 lemmas and 26 theorems; 140 definition/construction API items and two additional categorical comparison interfaces; 132 tests; 27 planets; 45 baseline declarations; 26 supplier requests. There are now 12 source versions, 17 independently confirmed source findings and 11 gaps.

The packet's `complete` status describes a completed planning pass, not a closed implementation. All six stages remain `planned`, with zero `closed`; every node remains `unchecked`. Stage targets are represented by local nodes, existing declarations or exact requests. The five signature defects do not erase the corresponding mathematical specifications. The planets remain 1,4,4,6,6,6 across D0–D5, within the limits and named for mathematical objects or results. No naming change is needed.

## Previous revision requirements

The preceding report, the revision handoff and the first review's retained corrections were read in full. The following nine formerly insufficient signatures now state the intended conclusions, without using their exact conclusions as assumptions.

| Interface | Independent result |
| --- | --- |
| `hilbertDeterminantMap` | Actual rational datum morphism to Res_F Gm, contravariant determinant coordinate map, real S-map equation and all split determinants. The degree-d target is not replaced by a scalar norm torus. |
| `siegelRootConvention` | Native based root pairing, parity characters, compact/noncompact positives, both half-sums and G/M dominant cones in BP coordinates. |
| `siegelWeylPermutations` | Native Weyl-group equivalence, reflected permutations, standard-weight action, Levi criterion, cyclic inverse-index minimality and 2^g cardinality. |
| `kostantSequenceGeometry` | Actual flag and inverse-image Lagrangian; Bruhat-cell membership gives rank formulas, parabolic invariance and cell constancy. The ranks are conclusions. |
| `gsp4CgRoots` | Native roots and paired coroots, torus character evaluation, rho, dominant cones and parity conversion. |
| `gsp4Kostant` | Actual four minimal representatives, actions and lengths 0–3; distinct Levi/full longest actions and lengths 1/4; maximality and reversal. |
| `gsp4Unitary` | Actual orthogonal J-centralizer and native U(2), with A+iB, block recovery, inverse and unitary equations. Analytic/Lie compatibility remains a named supplier condition. |
| `gsp4PilloniConvention` | Native character/dual-lattice comparisons, half-integral duals, dot pairing, roots/coroots, corrected lower-Borel base and rho. BP's compact order remains distinct. |
| `iwahoriNeat` | Actual compact open adelic GSp₄ level; every element is strongly adelically neat, then every rational conjugate intersection is neat. The hypothesis now covers every F-place over one rational prime; E17 justifies that change. |

All fifteen clear corrections listed in the preceding report remain: finite-support Hodge API; inverse-diagonal arrow direction; three chart instances; quotient separation/countability and orbit map; GL₂ characteristic-polynomial test; product uniqueness; actual product and adjoint tests; actual principal adelic levels and component subgroup; qualified Hilbert trace obstruction; nonzero trace-sign hypothesis; separate integral GL₂ torsion lemma and AA.3 lattice input; integral polarization baseline qualification; source/provenance synchronization. The integral qualification needed the refinement below, but was not replaced by a rational predicate.

## Clear corrections made here

1. **Three Mumford–Tate nodes.** Milne's SVI aside on p.31 defines the smallest rational subgroup but does not explicitly establish both structural assertions attributed to it. Added the public published [Shimura varieties and moduli](https://www.jmilne.org/math/xnotes/svhIP.pdf), §6: definition and connectedness p.494, Corollary 6.5 p.495 for polarizable reductivity. The R0/R3 representability and H1/R6 semisimplicity leaves remain explicit. Its exact file hash, version, URL and access date are recorded.
2. **Hodge genericity.** Masser–Zannier p.637 defines it in the introduction paragraph before Theorem 1.1. The inherited `§1.2` locator pointed to a corollary number rather than that definition. Corrected the locator and match; full rational GSp remains the criterion.
3. **Integral polarized variation.** Removed the assertion that an arbitrary nondegenerate rational pairing on a fixed lattice is equivalently an integral form. The definition now uses the actual parallel ℤ-bilinear form and native `IsPolarization`, with explicit scalar-extension/Tate comparison. Nondegeneracy does not require unimodularity; multiplying by two remains valid. BKT §1.3 p.920 provides the variation context, and §4.2 p.928 explicitly uses its integral polarization form. The suggested carrier already had the correct integral pairing.
4. **Schubert families.** Replaced the ambiguous `corrected E116` locator by this packet's `ShimuraData/E4`, retaining extraction provenance `PAPER-BOXER-PILLONI-26/E116`. BP §6.1.8 p.60 distinguishes closures from open cells after this correction.
5. **GL₂ determinant API.** The old named API only calculated a matrix norm. It now gives the actual rational datum morphism to (Gm,Nm), the contravariant coordinate map, real point determinant and S-map equation. Kept the elementary calculation as `gl2DeterminantNorm`. New supplier sketches name the determinant coordinate morphism and Gm point identification; neither assumes the promised datum morphism.
6. **Torus reflex API.** Replaced a definitional `fixedField` equality by the pointwise-fixing automorphism equivalence with the actual μ class. Finite definition field and trivial torus conjugacy comparisons remain explicitly omitted supplier inputs.
7. **CM torus special-image API.** It now takes an arbitrary target datum and datum morphism and concludes that the image S-map is special. The old signature only asserted specialness inside the original torus datum. This follows from D4's rational torus-image theorem.
8. **Baseline anchors/scope.** Corrected four line anchors and the integral nondegeneracy description, detailed below.
9. **Review provenance and reader.** Preserved each inherited review object unchanged in history before adding this review; reverified all 17 source findings. E15's current verdict no longer claims that its local proof repair proves the full one-place rational theorem. Added the precise D0 gap and current verdict/counts to the reader and suggested-file introduction. All changed statements, evidence, APIs and acceptance prose are synchronized.

## Five remaining D0 signature defects

These were missed by the earlier reviews. The current review replaces their earlier verified verdicts, while preserving the original verdicts in history. Their actual statements follow the point suppliers and sources; the defect concerns the prototypes under the promised names.

| Node / signature | Present signature | Required conclusion |
| --- | --- | --- |
| `deligne-points-topology` / `delignePointsTopology` | Assumes an arbitrary topological group isomorphism and returns continuity of it and its inverse. | On the actual S(ℝ) point carrier with real-coordinate topology, establish the topological group comparison with ℂˣ and retain scalar extension z↦(z,z̄) and conjugation (a,b)↦(b̄,ā). |
| `deligne-lie-points` / `deligneLiePoints` | One scalar real-part identity at 1. | Real analyticity of the actual point comparison in both directions, differential Lie(S)(ℝ)≃ℂ, norm differential 2 Re and diagonal differential t↦t. |
| `hilbert-real-points` / `hilbertRealPoints` | Bijectivity of an arbitrary group equivalence. | Actual totally real F and Res_F GL₂ points, analytic product comparison, and the G* tuples with a common real determinant, including negative sign. |
| `hilbert-adelic-points` / `hilbertAdelicPoints` | Trivial kernel of an arbitrary group equivalence. | Actual rational and F finite-adele carriers, topological point comparison, G* diagonal-determinant locus, compact opens and rational diagonal compatibility. |
| `datum-map-points` / `datumMapPoints` | Restates an assumed abstract commuting square. | Local, real and finite-adelic maps induced by a rational algebraic/Hopf morphism, with continuity/real analyticity and rational diagonal, projection and S/Hilbert compatibilities. |

Restore these conclusions with named sketches on the existing Hopf, manifold and finite-adele carriers. Reuse RG2.0a's S and Weil restriction rather than constructing them again. Do not require suppliers to be implemented in order to write the planning signatures: unavailable hypotheses may remain explicitly omitted. The necessary carrier/atlas and point-evaluation architecture is a design change, so this review leaves precise findings rather than installing another arbitrary equivalence premise. No additional mathematical target is requested.

## Sources and all 17 findings

All eleven inherited public source files match their SHA-256 values. The added published Milne chapter is a twelfth version. Independent reading dates and exact relevant ranges are recorded per source; earlier workers' larger reading ranges remain historical. Deligne's scan was read from page images at printed pp.251–255 and p.265. Milne SVI's relevant D0–D5 locators, BP's pp.2–5,33–34,60, CG's PDF pp.7–11,28–29, Pilloni's author pp.20–24,107–108, BCGP's published pp.201–202,409, BKT pp.920,928, Benoist pp.93–95, Masser–Zannier p.637, Hansen–Johansson p.1980 and Higher Coleman pp.31–32 were checked. Author copies, preprint v1 and the CG advance-publication pagination are not attributed to unread final versions.

The packet and reader give individual own-word reasons for every finding. All are **confirmed**, scoped to their recorded copies:

| Findings | Locator / independent check |
| --- | --- |
| E1–E4 | BP author p.2 Levi/unipotent name; p.34 Levi-root test and cyclic permutation order; §6.1.8 p.60 cell/closure terminology. |
| E5–E6 | CG PDF pp.7–8 second character exponent and Levi versus full longest element. |
| E7–E10 | CG PDF pp.8–10 centralizer, transposed unitary label and missing exponential-kernel coset; p.28 fixed-coordinate character parity. |
| E11–E12, E16 | Pilloni author p.20 root/coroot/simple-base inconsistency and W-stabilizer typo; pp.23,107 rank-four identity. |
| E13–E14 | Milne p.69 GSp Lie central line and inverse-diagonal homology weight. |
| E15 | BCGP published p.409 excludes torsion individual eigenvalues; generated products/inverses need their own local bound. That repair controls only the stated four-dimensional local factor. |
| E17 | BCGP published pp.201–202 rational-group definition versus p.409 one-F-place hypothesis; the quadratic-unit example disproves that full conclusion. |

### E17 and the strengthened hypothesis

Let F=ℚ(√2), with O_F=ℤ[√2], and u=7+5√2=(1+√2)³. Its conjugate u′=7−5√2 satisfies uu′=−1, so u is an integral unit. The rational prime 7 splits: √2 reduces to 3 or 4. At v=(7,√2−3), the completion is ℚ₇ and u reduces to 1. Thus γ=uI₄ lies in Iw₁(v), and in the full integral group at every other finite place. The product of these local levels is a compact open satisfying the source's one-place condition.

The faithful rational representation on F⁴ has both u and u′ as eigenvalues. Their generated group contains −1, so γ is not rationally neat. Its diagonal adele has that obstruction at every rational prime. Its similitude u² is totally positive, so the positive-real-similitude restriction does not eliminate it. At the second place over 7, u reduces to −1, exposing the missing local factor.

For the repaired theorem, impose Iw₁ at **every** v|ℓ for one rational prime ℓ>5, with every completion absolutely unramified. Each standard local eigenvalue has difference from 1 of valuation at least 1/4, normalized by v(ℓ)=1. The full rational local spectrum contains all these factors and embeddings. Products and inverses preserve that bound, while nontrivial torsion has smaller difference valuation. This gives the strong adelic conclusion and then rational neatness for every conjugate level. F=ℚ specializes to a single place; a prime-to-p statement retains ℓ≠p. The normalized cyclotomic comparison remains an honest LF0 extension request, not a proof claimed here.

No corresponding correction was located in the [Numdam article listing](https://www.numdam.org/articles/10.1007/s10240-021-00128-2/), the arXiv version-history search or the [author publication page](https://math.uchicago.edu/~fcale/research.html) checked on 2026-10-09. This is a bounded search result, not an assertion that no corrigendum exists. No author was contacted. This finding concerns the neatness lemma; it does not dispute the paper's main potential-modularity theorem.

## Baseline, ownership and closure

All 45 baseline declarations were read with their surrounding hypotheses at Mathlib **082e2d37e8b0463410cdb532e111cd43d5a66174** and Tau Ceti **f790474821cf4256814db967cb154e7af3d0c369**. Every qualified name exists; no citation was removed or replaced. The exact pinned declaration index was also used by the packet checker. The reader lists each linked declaration and the scope used.

| Baseline group | Scope / limiting hypotheses checked |
| --- | --- |
| Native diagonalizable weights | Comodule corestriction, internal sum and finite support under `Module.Finite`. |
| Native pure Hodge theory | Opposed-filtration carrier, decomposition, conjugation, finite-dimensional dual, tensor, Tate twist and Weil sign. These do not supply rational semisimplicity or variation sheaves by themselves. |
| Native finite comodules and Hopf ideals | Lawful coaction/counit, category morphisms/isomorphisms, tensors, antipode dual and ideal supremum. Finite-type subgroup comparison is still requested. |
| Native reductive/connected group carriers and GL coordinates | Predicates/categories and rational GL coordinate algebra. None by itself proves MT connectedness, reductivity or the datum axioms. |
| Local coefficients and integral polarization | Fundamental-groupoid module functor with transport; no holomorphic bundle. `IsPolarization` directly uses a ℤ-bilinear form and its integral radical, orthogonality and positivity; no perfect/unimodular condition. |
| Fixed fields, generated subgroups and trace | Existing operations, with reflex finiteness, generated-eigenvalue semantics and nondegenerate trace-form comparison proved separately. |
| Quotient topology | Closed-subgroup Hausdorff quotient and second-countable quotient under the source topological-group hypotheses; not the algebraic orbit/atlas identification. |
| Additive valuations | Native carrier and multiplication, inverse, zero and ultrametric rules. Cyclotomic normalization is not supplied by these rules. |
| Finite adeles, integer rings and matrix maps | Existing restricted-product carrier, fraction-field inclusion, integral closure, ring-induced GL maps and GL-to-linear equivalence. No automatic rational discreteness. |
| Root pairing/base/Weyl and unitary group | Existing carriers, positivity and generated Weyl subgroup. Absolute symplectic/Borel identification and the real centralizer comparison remain owner inputs. |

Anchor corrections: `FGComoduleCat.ofHom` **174→172**, `Hodge.IsPolarization` **63→70**, `IsDedekindDomain.FiniteAdeleRing` **95→94**, `Matrix.unitaryGroup` **62→60**. The polarization `provides` text now names `Q.Nondegenerate` directly rather than describing its scalar-extended consequence as the stored condition.

The reviewed D0–D5 library audit and native HodgeStructures, ReductiveGroups and touching LieGroups documents were read. No native layer is replanned. All 26 requests remain precise about consumers and stronger extensions:

- AA.1 owns local/adelic points, rational diagonals and the full restriction-of-scalars spectral dictionary; AA.3 owns the special rational GL₂ lattice comparison. V0 remains downstream for automatic arithmeticity/discreteness and component quotients.
- RG2.0/0a own coordinate topologies, Weil restriction and S; RG2.3 owns Iw₁ reduction, RG2.5 root-datum dualization. Real component finiteness is labeled a stronger request.
- Native R0–4, R6–7 and R9 own the Hopf dictionary, representations/descent, Lie/component/tori theory, reductive structure, based roots/flags and integral Bruhat geometry. Field Bruhat theory does not supply R9 integral incidence. Affine Weil restriction does not supply Res_F ℙ¹.
- H0/H1 supply existing pure theory, geometric elliptic comparisons, rational polarization and semisimplicity. D1 adds the graded dictionary; D3 uses it for variations. The independent elliptic MT classification is requested without importing later CM.0 into D1/D4.
- ALS.0 and LieGroups layers 2,4,7,8,9 supply general real/symmetric-space and homogeneous geometry. AF.1's written (g,K)-module scope alone does not supply all requested analytic charts; that extension is recorded. Smooth Frobenius and a Borel quotient do not silently prove a parabolic holomorphic orbit theorem.
- SF.1 supplies effective projective descent; CM.0 supplies CM-type/reflex algebra for D5 only; LF0's exact cyclotomic identities are stronger than its current stage statement and are recorded as such.

The retained gaps identify effective representation descent, flat-bundle gluing, complex quotient charts, integral incidence, reflex representability, MT/classification leaves, omitted signature conditions, real-point bridges, nonaffine Hilbert flags and cyclotomic valuation. Wolf Theorem 8.7.9, BL03 I Lemma 1 and general SGA3 representability were not read or credited as established. Non-routine arithmetic GL₂ torsion remains its separate inherited lemma; no new bundled mathematical result was found that needs a new node.

RT-AREA-algebraicgeometry/27 is respected within scope: H0→D1 and H1→D3 occur in precise requests and direct prerequisites. The native outgoing edges, other consumers and atlas installation remain with the maintainer; no native roadmap or `data/` file was changed.

## API, tests, reader and validation

All 44 definitions/constructions have constructor, extensionality, working compatibility/universal-property interfaces and at least three tests. The 132 tests were inspected for plausible wrong definitions: Hodge signs/mixed weights, nonhorizontal filtration, nonunimodular integral form, false product inclusions, rational torus factorization, component caveats, generated torsion, flag/root conventions and actual example maps. Names alone did not count as verification; the three insufficient D5 APIs were corrected above. The remaining D0 problem is separate because those five nodes are lemmas/theorems.

Checks completed:

- `check_blueprint.py` with the exact pinned declaration index: **0 errors, 0 warnings**; 123 nodes, six planned stages.
- `check_errata.py` on a scratch errata-v1 wrapper containing the source findings/versions: **0 errors**.
- Structural audit: all 123 declaration names, 142 API names and 132 labels followed by actual `example` statements occur in the suggested file; every node statement, hypothesis, proof step, API/test statement and acceptance paragraph occurs in the reader. Node IDs and all previous review objects/history are preserved exactly.
- Independent exact rational/integer checks: BP cyclic criterion agrees with positive-Levi-root minimality for g=1,2,3,4, with 2,4,8,16 representatives. Their sequences are distinct and match coordinate-flag intersection ranks. BP half-sums agree for g=1–6; CG lengths/actions and reversal agree; the Pilloni parity-character/half-integral-dual basis pairing is identity. E17's cubic unit, norm −1 and reductions 1/−1 at the two split places agree.
- Individual import source paths, JSON, whitespace and five-file deliverable scope checked.

**Lean was not compiled by this review.** The existing shared build has the exact Mathlib pin but Tau Ceti cf386627e9176a3827c1a5fe804989fd94a4d216, not the required f790474. No available build with both exact pins was found. No build/update/cache operation, language server or background process was started. The revision author's focused Mathlib check remains historical evidence for those eight interfaces, not a new full-file or reviewer compilation. The newly corrected Tau Ceti interfaces are uncompiled planning signatures and all implementation statuses remain unchecked.

## Orchestrator decision

The preceding nine D5 findings are resolved; E17 is independently confirmed. The five precise D0 findings need signatures on actual supplier objects, followed by review. Since the programme normally caps revision rounds at three, the maintainer should decide how to route this narrowly scoped remaining repair. This completed review does not claim a second job or modify that queue policy. Open supplier proof leaves do not need to be implemented for the signature repair, and do not independently prevent acceptance of a sound planning pass.
