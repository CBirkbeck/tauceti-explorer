# Independent revision review: Banach–Colmez geometry and families

Job `REV-VectorBundlesAndIsocrystals--VB3~2`, issue #7098. Reviewer: Codex,
session `codex-mYMhYB`, 8 October 2026. The original blueprint was written by
`codex-tqenam`, and revision round 2 by `codex-yQWzkB`; this session participated
in neither. This is a completed review.

**Verdict: accepted at target level.** All 76 nodes are verified or corrected,
all 13 baseline citations are confirmed, and the reader and suggested-file
contract index agree with the corrected packet. The five stages remain
`planned`, with ten explicit gaps. Acceptance records a sound mathematical
plan, with its stated proof obligations, rather than completed formalization
or gap-free closure. Every declaration remains `unchecked`.

## Counts and checks

| Item | Result |
| --- | --- |
| Nodes | 76: 58 verified, 18 corrected, 0 added, 0 unverifiable |
| Kinds | 10 definitions, 3 constructions, 46 theorems, 13 comparisons, 3 applications, 1 lemma |
| Definition/construction API and tests | 70 API items, 52 discriminating tests; each definition/construction has at least three tests |
| Planets | 18, with stable identifiers and appropriate mathematical names |
| Scope | VB3 and its three substages, VB4: five planned stages, none closed |
| Target coverage | 69 rows, including all routed CN/KL additions and explicit companion imports |
| Baseline | 13 declarations confirmed; none removed or replaced |
| Public sources | Seven current downloads reproduce all seven packet hashes |
| Source findings | 18 inherited findings confirmed; E34 and E35 added and confirmed |
| Gaps and requests | Ten gaps and 18 precise supplier requests retained |
| Combined companion and VB3 node graph | 127 nodes, acyclic after the additional purity prerequisite |
| Packet checker | 0 errors, 0 warnings, using the available declaration index |
| Suggested Lean file | `lean-check` exited 0; 154 admitted-proof warnings, no other diagnostics |
| Artifact consistency | All 76 contracts, hypotheses and direct imports match the reader and Lean index; all 70 API and 52 test contracts match |

The per-node findings are in `review.checked` in the packet. They identify
the mathematical convention, source restriction or unresolved proof boundary
that was checked, rather than merely recording that a file was opened.

## Previous review and revision

I read the first review and the revision handoff, then checked the revision
independently. Before this review's edits, all 76 reader statements,
hypotheses, proof steps and acceptance items already matched the revised
packet, as did the 70 API and 52 test contracts. The first review's reader
synchronization blocker has therefore been resolved.

The substantive earlier corrections are present: fibrewise semistability
in the positive presentations; punctured spatial **diamonds** and smooth
scalar quotients; the negative-case diamond argument; the divisor converse;
CN's countable-residue-field standing hypothesis; constant-sheaf rather
than scalar-valued global sections; correct standard-block ranks; the
RD.2 polygon input; the integral boundary hypotheses; and the three added
API items. The reader also contains the added prerequisites, concrete
acceptance examples, E31–E33 and RT-AREA-padic-1/21 boundary.

The revision removed source excerpts. This review preserves that rule and
rephrases several remaining source-like descriptions in our own words.

## Corrections made in this review

Every applicable correction is reflected in the packet, reader and Lean
contract index. The executable Lean content is unchanged; one explanatory
comment now also names the finite BC hypothesis.

| Node | Correction and reason |
| --- | --- |
| `families-of-banach-colmez-spaces` | The dualized auxiliary term is `G^∨`, semistable of slope `−1/(2r)`, in agreement with E32 and FS II.3.3(iv)/II.3.5, pp. 78–80. Replaced the unsupported proposed counterexample to partial properness with the actual universal-H⁰ test: a nonzero unit negative term is excluded. |
| `slope-zero-local-systems` | Replaced the impossible fixed-rank example having every slope zero but a nonconstant polygon. `O(1)⊕O(−1)` tests why total degree zero is insufficient. Clarified componentwise rank and the distinction between fibrewise triviality and global descent. This also implements the binding RS15 correction. |
| `negative-sl2-example` | FS Example II.3.13 is on p. 85, rather than p. 84. |
| `diagonal-gauge-normal-form` | Lemma 7.4.4 spans KL pp. 152–153. |
| `negative-frobenius-cohomology-detection` | Linked the already corrected positive-twist formula to E34, an omitted known author correction. |
| `surjective-purity-descent` | Added KL Corollary 8.5.16 to the locator for the perfectoid-space assertion, alongside 8.5.15, p. 174. |
| `local-global-purity-counterexamples` | Added Example 8.5.18 to the locator and rewrote the examples. Preserved the corrected `B₁→B₂` substitution, coefficient field `K`, bounded-ring obstruction and sheaf-only nodal result. |
| `geometric-positive-generation` | Lemma 8.8.12 parts (a) and (b), p. 183, supply respectively vanishing and generation; citing only (a) omitted the second assertion. |
| `etale-at-point-resolution` | Added `purity-openness` as a direct prerequisite. After the discrete degree reduction, KL Theorem 7.3.7 supplies the passage from zero slopes at the chosen point to a local étale model. |
| `integral-boundary-realization` | The lattice example now fixes its rational marking. `Z_p` and `pZ_p` are different embedded lattices in `Q_p`, but isomorphic abstract integral local systems. |
| `sympathetic-vector-spaces` | Rephrased the definition, retaining connected spectral Banach algebras, p-root surjectivity, faithful C-point evaluation, separability and objectwise exactness. |
| `banach-colmez-presentations` | Rephrased the two exact-sequence construction and separated its assigned invariants from the theorem of presentation independence. |
| `standard-dimension-examples` | Rephrased the formulas and stated `h≥1`, `m≥1`; retained `d=0` in the nonnegative branch. |
| `euler-poincare-height` | Rephrased the coherent-sheaf formula and defined `h` as the reduced denominator of the standard slope. |
| `bc-hn-invariants` | Restricted the sign and reciprocal formulas to `λ≠0`. `U₀=Q_p` has BC rank 0, degree −1 and slope −∞; the zero object has no slopes. Added E35. |
| `torsion-point-realization` | Restored the period-functor argument: realization is `Λ↦M⊗B⁺_dR(Λ)`, not an extension of scalars from a ring to itself. Rephrased the point-supported calculation. |
| `torsion-vs-hom-vanishing` | Explicitly made `W` a BC object carrying a torsion period-module action, as the proof using Proposition 3.17 requires. Morphisms remain arbitrary VS natural maps; G-HOM still records their bounded-image obligation. |
| `semistable-period-example` | Expanded the CDN locator to §2.1.2, Proposition 2.5 and Lemma 2.7, author pp. 21–23. The multiplicity clause needs those representation-theoretic inputs in addition to the Dimension calculation. |

No lemma node was needed for these corrections at target granularity. No
API, test, planet, owner or scope identifier was removed or renamed.

## Baseline confirmation

The pinned commits are Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. I read each declaration's
source statement and checked its hypotheses and intended use.

| Declaration | Confirmed input and boundary |
| --- | --- |
| `SpectralSpace` | Spectral topology, including separation and compactness conditions; it does not supply diamond geometry. |
| `Specializes` | Neighborhood-filter order, with the source direction retained for generalization chains. |
| `CategoryTheory.Sheaf` | Full subcategory of presheaves for a supplied Grothendieck topology; the perfectoid site remains a supplier. |
| `DerivedCategory` | Localization of integer cochain complexes at quasi-isomorphisms, under its categorical existence assumptions. |
| `CategoryTheory.Abelian` | Generic abelian-category structure; BC abelianness must still be established. |
| `CategoryTheory.ShortComplex.ShortExact` | Exactness together with a mono first arrow and epi second arrow. |
| `Submodule` | Actual module inclusions, intersections and scalar-stable subobjects; finite lattices require extra conditions. |
| `ModuleCat` | Module objects and linear maps for evaluated VS values. |
| `NormedAlgebra` | Normed algebra carrier; completeness, spectrality, connectedness and CN's additional conditions are not supplied by this class. |
| `Module.finrank` | The finite rank used with finite-dimensional presentation kernels, rather than an unrestricted dimension theorem. |
| `CategoryTheory.Equivalence` | Functor, inverse and unit/counit coherence for comparisons. |
| `CategoryTheory.ShortComplex.homology` | Homology under the appropriate existence assumptions, applied after derived sections. |
| `TauCeti.ValuationSpectrum.spectralSpace_spa_of_pairOfDefinition` | Spectrality of `spa Aplus` for a topological commutative ring with a pair of definition and an explicit subring. Its actual hypotheses suffice for the stated concrete input. |

The final check used the existing shared build after a memory check showed
113 GB available. Mathlib is at the pin. The build's Tau Ceti HEAD differs,
so I fetched the seven transitive Tau Ceti imports of `Spa.Basic` at the
pin and compared their bytes with the build: all match. The separate
`Spa.Spectral` baseline declaration was also read at the pin; it is not
an import of this prototype or an extra assumption of its abstract
contracting-action lemma. No library build or update was performed.

## Sources and source findings

All seven public PDFs were fetched again on 8 October 2026. The full hashes
below agree with the packet's source versions. Page numbers refer to those
versions; SW printed pages are ten below PDF pages, and the FF preface and
main text have different pagination offsets.

| Source | Public version and SHA-256 |
| --- | --- |
| Fargues–Scholze | [Author PDF](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf): `9ab9efbd0df251bfa3b610d1d1d88a8dfb1bdf7c397bd04f4c277280d98ae905` |
| Scholze–Weinstein, Berkeley lectures | [Author PDF](https://people.mpim-bonn.mpg.de/scholze/Berkeley.pdf): `225505171ef809aa0070c023c881ff1da844923775f2d631474c0b42eea4bffc` |
| Kedlaya–Liu | [arXiv 1301.0792v5](https://arxiv.org/pdf/1301.0792v5): `a6a117423db62aec072442bb15b70e3175bcc3b631bdcd6d74f740e3c6cfd942` |
| Fargues–Fontaine | [Author PDF](https://webusers.imj-prg.fr/~laurent.fargues/Courbe_fichier_principal.pdf): `8c020573d3dce341088ea7e83fe1063b410686c08e3a144fa3c0de634667cc79` |
| Colmez–Nizioł | [CN5.pdf](https://webusers.imj-prg.fr/~wieslawa.niziol/CN5.pdf): `bb1628cf1f4321243e6070be2abae99f72a41e237e70a7eb1ec1fc03cc2cd52a` |
| Colmez–Dospinescu–Nizioł | [GPW5.pdf](https://webusers.imj-prg.fr/~wieslawa.niziol/GPW5.pdf): `2cdb1de25b5201ed46f8af6c06c19b72fdc5cbe1dd2037b4e1d24dee30155776` |
| Scholze–Weinstein, p-divisible groups | [arXiv 1211.6357v2](https://arxiv.org/pdf/1211.6357v2): `984411ef6c3d735a713684d4c9251fbad411a40eab33cefed8ab5c8412b09f6d` |

I checked the locators and mathematical restrictions for every node, with
the surrounding arguments needed to judge its proof route. In particular
the FS H⁰/H¹ shifts, KL normalization by `a`, CN's standing assumptions
and zero boundaries, and the integral versus rational local-system sites
were checked independently. The CN findings concern the public author
copy; the paywalled Duke version was not consulted.

All E16–E33 findings are confirmed with this job's own review attribution.
Their corrected inequalities, nonzero assumptions, multiplicities,
coefficient rings, normalization signs and unresolved descent gap survive
the review.

E34 records the omitted known correction to KL Remark 7.4.12, p. 156:
large-positive-twist vanishing concerns `M(n)`. The authors confirm this
in [arXiv 1602.06899v3, Appendix A, p. 191](https://arxiv.org/pdf/1602.06899v3),
which I also read. The existing paper extraction already records it as
`PAPER-KEDLAYA-LIU-15/E53`; this is an inherited finding newly recorded in
the packet, rather than a claim of a new discovery.

E35 identifies the missing `λ≠0` restriction in CN §3.2.5, p. 16. The
same page's Remark 3.13(i), together with Example 3.3, p. 13, supplies the
separate `Q_p` boundary. No correction was located in the existing CN
extraction/review, packet findings or targeted errata search. Its scope
is the exact public author version read here.

## Closure, ownership and outstanding work

I checked the actual statements of the 38 external node suppliers and the
14 stage/upstream interfaces used as direct prerequisites. The 18
requests ask for the missing specialized clauses rather than pretending
the current suppliers already prove them. The reviewed library audit has
no dedicated entry for this roadmap; its BG3 entry records BC spaces as
absent and VB3-owned. The pinned source checks confirm that generic
categorical and topological machinery is imported, while curve and BC
geometry remains to be implemented.

The ordinary projectivized-properness branch remains independent of
classification. Relative HN consumes that properness, and positive
presentations/general BC then consume relative HN. The companion imports
are retained rather than duplicated. The combined 127-node graph has no
cycle; it is not a claim that every supplier's open proof obligation has
been discharged.

The ten retained boundaries are precise: crystalline Lubin–Tate Hom
comparison (G-LT); the contraction estimate (G-CONTRACT); the two generic
spatiality extensions (G-SPATIAL); the original Le Bras construction
(G-LEBRAS); bounded image for unrestricted VS maps (G-HOM); ring-level
nodal patching (G-PATCH); integral tensor reconstruction (G-INTEGRAL);
companion proof obligations (G-COMPANION); atomic stage-order integration
(G-ORDER); and missing geometric Lean carriers (G-LEAN).

The suggested file states available categorical, module, cochain,
numerical and topological components, with omitted geometric clauses in
its contract index. Many admitted signatures are deliberately schematic;
their generic parameters are not verified geometric models. Elaboration
checks these components and supplies no proof of the complete contracts.
Its 154 warnings are all uses of `sorry`.

No question blocks acceptance. For the orchestrator, RS15 still requires
atomic replacement of the old general-BC/VB4 stage edges; the accepted
result withholds the reverse edge until the old edge is removed. Workers
must not lift every node prerequisite to a stage edge. RT-AREA-padic-1/21
continues to require global RF3 chart maps before relative GAGA, with the
companion as owner. CN items 331–333 remain Part II consumers. This review
edits no supplier, queue, atlas or upstream roadmap and performs no
promotion.

Validation commands were `python3 scripts/check_blueprint.py` on the
packet, `lean-check` on the suggested file, `git diff --check`, and
`python3 research/blueprint/intake.py check-files` on the five deliverables.
Additional read-only checks compared each reader/Lean-index contract with
its packet node, checked all review identifiers and unchecked flags, and
traversed the combined dependency graph. No source excerpt or source file
is included in the submission.
