# Independent review: Stable, periodic, and curved homological algebra links

**Accepted after correction.** Job `REV-LINK-tauceti_TauCetiRoadmap_StablePeriodicCurved`, issue #135, 2026-09-23. Reviewer: Codex, session `codex-hjdg0j`. The original work was by ChatGPT Pro sessions `cgp-6fac5ad10e2c` (PR #538) and `cgp-0d58f52c658d` (PR #783); neither was this reviewer.

The six incoming links have valid supplier-to-consumer directions. All four overlaps remain: three `keep` decisions and a documentation `rescope`. No directed pair was added or withdrawn. The significant correction is that R-RELATIVE must import existing pinned foundations, rather than commission duplicate predicates. Acceptance covers this link map, not every theorem of the source roadmaps or an implementation claim.

## Inputs and reading

Repository snapshot: `0dcfabef140a4c8d95ae763a2bb34aef5b74a8b3`. Read WORKERS, blueprint PROTOCOL (especially §§9–11), the expansion protocol and upstream guide, the original packet and handoff, the complete StablePeriodicCurved document, every linked/overlap endpoint, and focused completeness candidates. Relevant external layers are GEF 0/2/3, DG/A∞ 0/1/5/11, Zigzag 2 and QuiverRepresentations 6. GEF abbreviates GrothendieckEulerForms below.

Read all nine reviewed SPC entries in `data/library-coverage.json` and `REV-AUDIT-23.md`; the reviewed GEF audit, `REV-AUDIT-22.md`, supplies the exact-functor boundary. The library commits are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Named declarations below were read at those commits, not inferred from README inventories. No Lean file was changed or compiled.

## Each directed contract

| Supplier → consumer | Decision and exact boundary |
| --- | --- |
| GEF 0 → SPC 0 | Retain, explicit. The consumer imports genuine Quillen exact structures, admissible squares, opposites and conflation-exact functors. The foundation is largely implemented. Relative projective/injective predicates, enoughness and `IsFrobenius` are imports too. General exact-derived categories are not exported by GEF. |
| DG/A∞ 0 → SPC 5 | Retain, inferred. Integer grading, homogeneous maps and Koszul conventions match. Noncentral curvature and the signed opposite are consumer obligations. A square-zero DG predicate cannot be reused unchanged as the curved predicate. |
| DG/A∞ 1 → SPC 5 | Retain, inferred. The supplier's enriched DG-category, closed degree-zero and H⁰ interfaces apply to Hom complexes of modules of the same curvature. The enrichment is a planned supplier export; the existence of uncurved DG modules does not establish it. |
| DG/A∞ 5 → SPC 4 | Retain, inferred. `pretr` supplies finite sums, shifts, cones and finite semi-free objects for the DG-orbit hull comparison. Keep positive period, compatible signs and universes, bounded compression, finite-dimensional algebra and finite global dimension. The consumer proves full faithfulness, gradability and generation. `tria` precedes `Perf`/Karoubi completion. |
| GEF 0 → SPC 1 | Retain, explicit. Exact-functor calculus supports stable functoriality. Preservation of admissible pushouts/pullbacks is part of the supplier's planned contract, not certified as already built by AUDIT-22. Preservation of projective-injectives is an additional hypothesis. The consumer still constructs stable descent and the suspension comparison and proves the triangle-functor law. |
| GEF 0 → SPC 2 | Retain, explicit. Import the canonical abelian and induced extension-closed exact structures. The consumer proves repleteness, zero/biproduct and extension closure of Gproj, constructs complete resolutions, and proves enoughness/Frobenius and Buchweitz. Two-sided noetherian and Iwanaga–Gorenstein hypotheses remain visible. |

The crucial common-curvature check is elementary but substantive. For a degree-r homogeneous right-linear map f, let δ(f) = d_N f − (−1)^r f d_M. Expanding twice cancels the mixed terms, leaving δ²(f) = d_N² f − f d_M². At common right curvature w this evaluates to f(m)w − f(mw) = 0. Individual module differentials still square to multiplication by w. The zero-curvature specialization, signed opposite curvature −op(w), and tensor handedness must be proved separately.

The six confidence labels are retained: both GEF/SPC documents identify the ownership direction; the DG contracts have only unilateral naming and remain conservatively inferred. Every original link quotation is literal and relevant; the new overlap quotations are literal too.

## Overlaps and existing outgoing links

1. **SPC 0 / Zigzag 2 — keep.** A generic Frobenius functional and a graph-specific trace computation have different roles. The generic predicates, dual-module comparison, Nakayama identity and both self-injectivity results already exist. They must not be rebuilt. Zigzag's graph basis and trace calculations instantiate that interface; its own reviewed audit controls how much of those calculations remains. The directed pair SPC 0 → Zigzag 2 already appears in the Zigzag packet. Its two quotations and current presence were checked; no reverse or duplicate edge was added.
2. **SPC 2 / GEF 2 — keep.** GEF explicitly excludes the general Quillen exact-derived construction. The consumer needs Dᵇ(E) from exact-acyclic localization for the Keller–Vossieck comparison. The abelian derived-category baseline is useful, but Kᵇ(E)/Kᵇ(ProjInj E) is not a replacement. Added direct two-sided evidence.
3. **SPC 6 / DG/A∞ 11 — keep.** Curved right modules and the coalgebraic Koszul setting do not yet have an identified common carrier or adapter. Share generic closure/localization machinery once totalizations, products/coproducts and opposite conventions are specified. The existing thick envelope is useful; coproduct/product-closed triangulated generation and the particular comparisons remain obligations. No directed edge follows solely from “coderived”.
4. **GEF 0/3 / SPC 0 — rescope documentation.** The import boundary and construction verbs disagree. Their historical proposal is superseded by the pinned predicates and comparisons. Align the documents with the existing exact-category foundation; do not add a reverse SPC → GEF dependency. Even the Frobenius-exact predicate already exists. Factoring ideals, stable categories, module-category applications and triangulation remain SPC work. A named exact-equivalence transport theorem for relative predicates was not established here; it remains an explicit API check, not an assertion that every requested adapter exists.

The preserved SPC 0 → QuiverRepresentations 6 pair is present in the current Quiver packet. Both historical evidence quotations and the partner's two current quotations were checked literally. The consumer needs the additive quotient by maps through projectives (dually, injectives), finite-biproduct closure and opposite/handedness compatibility. An arbitrary finite-dimensional bound-quiver algebra need not be self-injective. Neither the Frobenius condition nor Happel triangulation is supplied by this edge. Checking these two incident partner pairs does not approve either whole partner packet.

## Pinned baseline corrections

| API read in the pinned sources | Consequence for the packet |
| --- | --- |
| `TauCeti.MorphismIdeal`, `.rel`, `.Quotient`, `.homAddEquiv`, `.lift`, and `.exists_quotientFunctor_comp_eq_iff`, in `TauCeti/CategoryTheory/Preadditive/MorphismIdeal/Basic.lean` | The additive ideal quotient and its additive factorization criterion already exist. The chosen-object factoring ideal, stable quotient and further functor/opposite adapters are separate targets. |
| `TauCeti.ExactStructure.isProjective`, `ProjectivePresentation`, `EnoughProjectives`, `split_isProjective`, `abelian_isProjective_iff`, in `CategoryTheory/Exact/Projective.lean`; their injective counterparts in `Injective.lean` | Predicates depend on the specified exact structure; enoughness contains actual conflation presentations. Split and canonical-abelian comparisons are available. |
| `isInjective_iff_isProjective_op`, `isProjective_iff_isInjective_op`, and the two enoughness-op equivalences, in `Injective.lean` | The opposite part of R-RELATIVE already exists, including presentation transport. This is not merely an informal duality slogan. |
| `TauCeti.ExactStructure.IsFrobenius`, `.IsFrobenius.op`, and `.split_isFrobenius`, in `CategoryTheory/Exact/Frobenius.lean` | Enough projectives, enough injectives and equality of predicates are already packaged. This supplies neither the general stable category nor its triangulation. |
| `LinearMap.IsFrobeniusFunctional`, `.IsSymmetricFrobeniusFunctional`, `.exists_isFrobeniusFunctional_iff`, `.IsFrobeniusFunctional.apply_mul_nakayamaAut`, `.moduleInjective_self`, `.moduleInjective_op_self`, in `TauCeti/Algebra/Algebra/Frobenius/Basic.lean` | The regular-right-module/dual comparison explicitly uses the action ψ·c = (b ↦ ψ(cb)); finite-dimensional field hypotheses apply to the equivalence, Nakayama and self-injectivity results. Generic functional predicates already work over a commutative ring. Algebra self-injectivity does not itself install a Frobenius exact structure on finite modules. |
| `TauCeti.IsDGRightModule`, in `TauCeti/Algebra/Homology/DG/Module/Right/Defs.lean` | It explicitly contains `sq_zero`; it is the uncurved boundary, not an implementation of curved modules. |
| Mathlib `ComplexShape.refl`, `ComplexShape.up'`, and `HomologicalComplexUpToQuasiIso.Qh`, in `Algebra/Homology/ComplexShape.lean` and `Localization.lean` | General complex shapes and localization infrastructure are reusable. Qh requires the homotopy-factorization/localization hypotheses; the reviewed audit establishes their cyclic-shape use. They do not establish periodic shifts, Happel's theorem or the Verdier/triangle comparison. |

Paths in the exact-category rows are relative to `TauCeti/`. Source statements were checked; no claim of recompilation is made. AUDIT-23 marks SPC 0 and 3 partly built, the other seven layers not built. The old blanket missing-foundation language must not override that reviewed inventory.

## Completeness spot-check

Repeated the packet's 67 regular-expression queries and six additional terms over all 2007 stage descriptions and the available documents of the 218-roadmap union. There are 217 active roadmaps. The queries hit 115 stage records in 51 owners and documents in 54 owners, including the retired FoundationsAndLibraryIntegration entry; hits select candidates, not dependencies. Archived that retired examined row rather than treating it as a supplier. The original continuation's historical 2006-stage ledger and attribution remain labelled as historical.

All nine own layers, exceeding the required five, received an input/output check:

| Layers | Additional candidate decisions |
| --- | --- |
| 0–1 | Rechecked exact structures and both existing outgoing relationships. Frobenius functionals, Frobenius exact structures and stable triangulations remain distinct. No missing direct edge found. |
| 2 | Coefficient-orders L6 supplies self-injectivity of specified Artinian reductions, not the general Gproj/complete-resolution interface. Patching P7 concerns bounded perfect complexes over complete noetherian local rings, not bi-infinite total acyclicity. |
| 3–4 | ClassFieldTheory 0 uses existing Tate groups and cyclic periodicity. It does not request a new general periodic-module category. Floer ALG uses filtered/bigraded ordinary complexes; periodic Heegaard domains are a different notion. The dual-numbers acceptance example still separates underlying projectivity, acyclicity and contractibility. |
| 5 | Checked the signed graded representation and enriched Hom output against the actual curved equations. No second square-zero module carrier or unproved signed-opposite conversion is imported. |
| 6 | Rechecked DG/A∞ 11 and also its Layer 7 quotient contract. Homotopically flat DG replacements and a coalgebraic coderived comparison do not automatically identify the consumer's curved localization. No new adapter was established. |
| 7–8 | No separate matrix-factorization/duplex supplier was found. Preserve regular-local/nonzerodivisor, affine regular/flat-superpotential and Iwanaga–Gorenstein hypotheses separately. Forgetting to a square-zero complex requires w = 0 or base change to S/(w). |

GeneralAlgebraicKTheory K.4/K.7, EnhancedDerivedSheaves E5 and RefinedTraceMethods RT.5 were also reread: enhanced K-theory/localizing invariants cannot import a bare stable triangle equivalence as enhanced Morita data. Analytic-stack Verdier language and Habiro periodicity do not specify these algebraic quotients. No missing directed edge survived the contract checks. This is a fresh independent spot-check and search, not a claim to have sequentially reread every unrelated roadmap or proof-audited the cited books and papers.

## Validation and limits

- `scripts/check_links.py`: 6 links, 4 overlaps, 217 examined; zero errors and warnings.
- Intake file check passed for the packet, this report and the worker handoff.
- Strict substring verification: 29 current evidence quotations, 2 preserved deduplication quotations and 4 quotations in the two incident partner links.
- Unique active-catalogue coverage, valid nonretired endpoints and absence of duplicate proposed pairs passed.
- The atlas, other link packets and all 3746 stage `requires` edges form an acyclic union: 4440 distinct edges before this packet, 4446 after it at the base snapshot. A fresh check at `ace8c73cf7f3ecacc01ae259b910699cd64e7bdf`, loading the changed AlgebraicCodingTheory, GEF and LieGroups packets from scratch, also passed: 4442 before, 4448 after. Relevant documents, atlas, roadmap definitions and protocols were unchanged.

No implementation, source README, audit, other worker's packet or queue was edited. R-RELATIVE is a documented import/alignment follow-up; exact-equivalence and other missing adapters are not silently certified. Refresh deduplication and graph checks against later catalogue changes during integration. Submission uses the archive and GitHub API workflow; no git command was run.
