# Handoff: REV-PKG-LocalGaloisDeformationRings~2

Issue #7938. Independent reviewer Codex, session `codex-iR5BNX`, 13 October 2026. Claim confirmed by the bot on issue comment 6156972306. This session authored neither the original nor revised package. **Complete; accepted with fixes.** No second job was claimed.

## Delivered

- Reviewed and corrected the package README and Suggested.lean, replaced review.json with the independent accepted verdict, and wrote [the full review report](../reviews/REV-PKG-LocalGaloisDeformationRings~2.md).
- Kept all 157 targets and 247 API entries. The 43 definition/construction interfaces each retain at least three discriminating prose tests; heavy constructions have named closing-comment entries rather than sorry-defined Lean carriers. There are 47 Checks blocks overall, including light definitions and the new GL₃ sign tests.
- Kept the metadata unchanged: `topic = "math.NT"`.
- Applied the 12 October package-shape rule, which supersedes the issue's older 200 KB limit and the older review's demand for heavy typed interfaces. README full detail is preserved; Suggested.lean only states mathematics expressible at the pins.

The report contains the 15-target independent source sample (seed 7938), the source-locator repairs, an adversarial mathematics table covering every target, ten Lean signature comparisons and the outcome of each earlier revision group. No source excerpts, copied restricted materials, compiled artifacts or scratch files are deliverables.

## Mathematical corrections to preserve

1. **1.6:** Fontaine–Laffaille jumps determine labelled HT weights. Only the rank-one ℚ_p dictionary is stated as inertia ε^(−i); arbitrary higher-rank inertia does not split into those characters. The split representation 𝒪⊕𝒪(ε⁻¹) and its dual fix the convention.
2. **1.10 and dependencies:** Bounds are relative over 𝒪. Ten consumers that permit p|d now depend on general fixed-determinant quotients instead of the p∤d integral scalar split: 1.18, 1.20, 1.24, 3.4, 5.2, 5.6, 5.7, 5.13, 8.2 and 8.11.
3. **2.16/2.23:** The Calegari–Geraghty fixed-unramified-determinant condition in §8.5.1 uses scalar inertia on both blocks, ψ_Aψ_B^(d−1)=1, for p>d≥2. Its extra tangent direction is not the condition with unramified complement B in BCGP. The latter is retained separately in 2.23, without a dependency on 2.16. The rank-one fixed determinant has no extra ramified tangent direction.
4. **3.7:** Kisin (2.7.5) is setup. The point criterion is Theorem (2.7.6)/Corollary (2.7.7), author DVI p. 23; coefficient compatibility also uses Proposition (2.7.2), pp. 22–23, and flat base change from R03.1. Do not infer reducedness of an arbitrary generic family merely from its field-valued points.
5. **5.2:** The dyadic ordinary quotient here uses unit-class H¹_f and has crystalline points; ψ is unramified. A general semistable Tate-curve extension is excluded. The residual split-distinct exception is stated explicitly.
6. **6.16/8.6:** Scalar/trace-zero splitting needs p∤d. In general the unframed fixed-determinant tangent lies in ker[H¹(ad)→H¹(k)], with the category subspace imposed. For Schur d=2,p=2, δ(1) in H¹(ad⁰) is nonzero but is a strict coboundary in H¹(ad). The compiled trace control records the obstruction to scalar splitting.
7. **6.21:** Preserve the corrected γαγ coefficient **−1−b′+c′**, not the conflicting printed alternative. The README derives it from LLHLM's matching calculation on arXiv v4 p. 47. The 𝔽₇₉ example distinguishes zero from 63; first-component tests distinguish a product relation from just its second factor. Other inherited Table 3/4 corrections were retained.
8. Concrete flag-image, strict-conjugacy, closure, rigidity, finite-flat model, GL₁ inertia, eigenvalue nilpotent and WD self-twist controls were strengthened. The full report identifies the affected sections and computed values.

## Upstream ownership and consumer routing

Current read-only upstream checked at `0d144d044dacebca17b654695b6f1ad58f159b27`; current Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Searched targets by objects and hypotheses across the newer roadmaps and Completed roadmaps, as well as the current library. No Lake command was run in either checkout.

The preceding revision already deferred local Φ_p finite generation, full tame groups, the current coefficient-p tame character, basic Kummer maps, algebraic pseudodeterminants and the rank-two symplectic multiplier identity. This review added current finite discrete Tate duality to the scope boundary: `NumberTheory/ClassFieldTheory/Local/Duality/FiniteModule` and its `dualityMap0_kummerCoeff_bijective`, `dualityMap1_kummerCoeff_bijective`, `dualityMap2_kummerCoeff_bijective`. Natural-topology κ-linear cohomology/duality remains an exact supplier extension. No additional target was removed or renumbered.

Retain the earlier downward moves: **3.8** owns the block-centre/full-WD comparison that higher `PadicLocalLanglandsForGL2Qp:R30.5` must import, and **6.30** owns the precise GL₃ weak minimal patching existence/support input used by its all-shape component statement. Higher patching plans should import that scoped interface. No general global patching or automorphy theorem is claimed locally. Dependencies remain within existing Tau Ceti roadmaps, lower tiers or the tier-15 Global/Local deformation bundle.

## What remains and where to resume

No package defect remains open from this review. The ten inherited packet gaps and 22 requests remain unchanged; they record supplier work and historical notes, not completed formalization. The next authorized maintainer step is the draft upstream port in supplier order.

A future **authorized packet synchronization** should carry back the mathematical corrections above. Also retain the preceding revision's correction of the generic-reducedness citation to CEGS *The geometric Breuil–Mézard conjecture for two-dimensional potentially Barsotti–Tate Galois representations*, arXiv:2207.05235v2, Theorem 1.3 p. 4; the old packet names the wrong CEGS paper. Reconcile historical suggested-signature notes with the 12 October shape rule. This package review did not authorize packet edits or changes to implementation status.

In particular, do not restore the old 2.16/2.23 conflation from packet prerequisites during a later assembly, and do not replace the corrected GL₃ formula with the printed table defect. The public source locators and worked witnesses in the package/report suffice to resume without scratch.

## Validation and reproducibility

Read all nine accepted baseline declarations at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`, rather than assuming the names supply their consumers' extra theory. The Lean file imports only Mathlib.

- Final `lean-check`: exit 0, zero errors, **19 warnings, all exactly for `sorry`**; 472 lines, 15 definitions, one abbreviation, ten theorems and 37 examples. Checks were serial with 103 GB available at the last invocation; no LSP, Lake build/update/cache or background process remains.
- Packet checker: exit 0, zero errors/warnings; unchanged input has 157 nodes, 247 APIs, 162 tests, 43 planets and nine baselines.
- Inventory: all 247 API names occur in README under its namespace convention; all 43 primary definition/construction names occur in Lean or its short closing comment. The 418 internal links resolve, with an acyclic graph and no later-layer prerequisite.
- Intake on all changed deliverables and this handoff: zero problems. `git diff --check`, metadata, namespace/layer, placeholder/process and private-path checks pass.

| Final package file | SHA256 |
| --- | --- |
| README.md | `266657a50092faf236951c6dbbaf267e10d730cfbdac3710d9a6596c120ab2f0` |
| Suggested.lean | `5e4ea69543d8b68db78fc4d1e4c121798474b1b2cdbb76088d43cadbc41ee61a` |
| metadata.toml | `d303572d699e7ef5619039e39ca2cc23feb22354dad61e5014fe05151078b2a7` |

The following fingerprints identify the public copies read for the new locator repairs and mathematical controls. The other sampled source versions and hashes agree with the [preceding package handoff](PKG-LocalGaloisDeformationRings~2.md), except ACC+, whose newly fetched public version is identified here. Nothing depends on retaining a source copy in scratch.

| Public source | SHA256 of source bytes |
| --- | --- |
| [Kisin PST, def.dvi](https://people.math.harvard.edu/~kisin/dvifiles/def.dvi) | `ca85f74a47caf411dfb7fe0fa356ef30928d5dbd2cd518bafcc13943cf483dee` |
| [Kisin finite flat, bt.dvi](https://people.math.harvard.edu/~kisin/dvifiles/bt.dvi) | `242151c94cb831c526e67de6e3b70a370b65a002342074440e86fc88a2ec5f0f` |
| [Kisin 2-adic, serre2.dvi](https://people.math.harvard.edu/~kisin/dvifiles/serre2.dvi) | `a11fdea301d662ada1cd675bea21a89ba9ab0a75955e496e4a1bcdecab97bf7d` |
| [BCDT author manuscript](https://math.stanford.edu/~conrad/papers/tswfinal.pdf) | `13043cf6e9043a69dc7988882658cd92595efc88dfd4fd2f326ac3ef3cae8e06` |
| [ACC+, v2](https://arxiv.org/pdf/1812.09999v2) | `7c882c4dc7208e08a0b1f4b3ce6e5c5234c9815f139a4c3a372898378a24d08c` |
| [Clozel–Thorne accepted manuscript](https://www.dpmms.cam.ac.uk/~jat58/lrspiii.pdf) | `a3fa46fcdebdc1a41a54e8b5a9be22173e9f9f87261c51b1e7a7f29cfada3659` |
| [Calegari–Geraghty, v2](https://arxiv.org/pdf/1207.4224v2) | `67896c853258801967270f8927e5bb33c0315989d3a4188d53435a9305993ebb` |

Scratch is disposable and is removed at submission. All material needed by the maintainer is in the package, report, this handoff and the linked public sources.
