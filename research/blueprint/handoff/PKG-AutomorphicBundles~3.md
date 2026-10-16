# Handoff: PKG-AutomorphicBundles~3 — issue #9882

Codex, session `codex-4LzF4T`, 16 October 2026. Branch
`codex-4LzF4T-automorphic-bundles`. The bot confirmed the claim in
[comment 6211890398](https://github.com/CBirkbeck/tauceti-explorer/issues/9882#issuecomment-6211890398).
This is a completed package revision, submitted for independent review, not a checkpoint.
No packet, partner package, atlas data or upstream checkout was changed. The existing
`review.json` remains untouched for the next reviewer.

## What changed

The README retains all 94 targets of the round-2 review and adds 20 prerequisite
targets, each with source locators, hypotheses, construction/proof route, Needs,
Lean status and discriminating Checks. New constructions have planning APIs.
All 114 targets now have at least three Checks, including the previous theorem
targets with only one or two. The previous convention corrections and worked
examples are retained.

The added layers address the two substantive repair families in
`REV-PKG-AutomorphicBundles~2.md`:

| New targets | Construction and consumers |
|---|---|
| B3.Hilbert.1 | Deligne–Pappas boundary construction, ordinary gluing with the Pappas–Rapoport splitting model, projectivity and minimal contraction; used by B4.15 and B5.16–B5.19. |
| B3.Hilbert.2 | Semi-abelian splitting-filtration lines, their different/determinant factors, level/isogeny transport and arbitrary coefficient base change. |
| B3.Hilbert.3 | Toroidal and minimal line-valued cusp completions, full stabilizer descent, coefficient-module series and reduced boundary ideals. |
| B3.Hilbert.4 | Fine-level geometric residue-component detection by cusps, using determinant classes, strong approximation and smooth-proper Stein factorization. |
| B3.log.1 | Horizontal Kummer/pro-Kummer sites, root bases, induced logarithms on strata, acyclicity and arithmetic function descent. |
| B3.log.2 | Canonical finite-quotient Kummer coefficients, derived integral systems, lattice independence and geometric unipotent boundary monodromy. |
| B3.log.3 | Structural log periods, filtered Poincaré lemma and the full-rank nilpotent-residue tensor comparison for de Rham coefficients. |
| B3.log.4 | Ordinary log primitive and filtered de Rham comparison, degeneration and the canonical Galois-equivariant graded C-comparison. |
| B3.log.5 | Boundary period kernels and alternating strata resolutions, compact-support primitive/filtered comparison, degeneration and duality. |
| B3.BGG.1 | Relative type-C₂ Kostant calculation and BGG resolution, beyond generic Verma/PBW theory. |
| B3.BGG.2 | Geometric filtered dual BGG complex and its boundary-twisted version, including differential operators and induced connection on the boundary ideal. |
| B3.BGG.3 | Coherent graded pieces, ordinary/compact degeneration and the positive-root/BCGP convention dictionary. |
| B3.HT.1 | Small-Hasse weak/strong canonical subgroups, uniqueness, test-point congruence, quotient identities and polarized compatibility, including p=2. |
| B3.HT.2 | Actual Siegel anticanonical affinoids, Frobenius lifts, completed integral ring estimates and perfectoid limit. |
| B3.HT.3 | Specific boundary Hebbarkeit/good-triple construction and normalized trace estimates needed to add level. |
| B3.HT.4 | Full-level minimal Siegel perfectoid tower, continuous then analytic period map, translate cover and boundary extension. |
| B3.HT.5 | Modified integral toroidal charts, perfectoid abelian-base and root-monoid directions, and the actual toroidal limit. |
| B3.HT.6 | Strictly compatible toroidal Hodge-type embeddings and their perfectoid closed-limit construction. |
| B3.HT.7 | Rational Levi period torsor and cyclotomic twist comparison through faithful tensor frames. |
| B3.HT.8 | Function descent, finite-algebraic VB⁰, actual subcanonical coefficient systems and smooth admissible finite-level cohomology. |

The old `HodgeTateVBInput`, `LogHodgeTateInput`, `DualBGGInput` and ramified
boundary gap contracts are replaced by these constructions. B4.21/B5.20 use
the rational tower/torsor/descent chain. B5.21/B5.22 use the independent
finite-level log/BGG chain; neither requires a perfectoid Shimura tower or
completed cohomology. Their ordinary and compact-support left sides remain
distinct. B4.15 and the ramified Hilbert expansion targets use the actual
splitting-model boundary, rather than substituting C6's Dimitrov model.

`Suggested.lean` changes only its closing README-target inventory, adding the
20 names. Its existing 16 theorem statements, real-bodied light definitions
and examples are unchanged. Heavy geometric carriers remain README targets;
no sorry'd carrier or data definition was introduced. The file is 499 lines.
Metadata remains exactly `topic = "math.NT"`.

## Ownership and plan corrections for coordination

The issue permits only the package and this handoff. The following are durable
instructions for reconciling the unchanged plans; they are not omitted package
deliverables.

1. **Move the needed rational theory down from later roadmaps.**
   HodgeTateAndCanonicalSubgroups T3's small-Hasse canonical subgroup portion
   now imports B3.HT.1. Its general finite-BT, degree, integral differential,
   larger-region and Harder–Narasimhan results remain there. T1/T2's rational
   automorphic tensor/Levi comparisons import B3.log.3 and B3.HT.7; the local
   p-divisible Hodge–Tate sequence is still supplied by the lower-tier
   FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1.19, not moved here.
   PerfectoidShimuraVarieties' Siegel construction (Layer 1, including the
   good-triple/trace route) and its toroidal Hodge-type/period pullbacks
   (Layers 2–3, in the range constructed here) import B3.HT.2–7. General-data
   diamonds, abelian-type descent, arbitrary-level extensions, additional
   compactification comparisons and locally analytic coefficients stay there.
   HigherHidaAndColemanTheory can import B3.HT.8's finite-algebraic VB⁰
   specialization; this does not assert exactness of general locally analytic VB.
2. **Move the required horizontal-log and relative BGG constructions down.**
   HodgeTateAndCanonicalSubgroups' horizontal log comparison consumers import
   B3.log.1–5. The ordinary local period theory remains PadicHodgeTheory P8,
   and generic nilpotent canonical extensions remain ComplexComparisonPartII
   C5.6. CohomologyComparisons Layer 6.1 already constructs the one-variable
   modular-curve specialization; B3.log extends the chart range and support
   constructions, with the same root/connection normalization. Its broader
   horizontal machinery is the new owner for higher-dimensional consumers.
   LieHighestWeightPartIICompletedCategoryO's relevant Siegel relative-BGG
   consumers import B3.BGG.1–3; Tau Ceti LieHighestWeight retains generic
   highest weights, central characters, enveloping algebras and PBW.
3. **Keep the ramified model distinction.** ShimuraCompactifications C6
   remains the Dimitrov-model construction with its own level/base hypotheses.
   B3.Hilbert.1–4 own the Diamond splitting-model variant. C0–C5 supply generic
   toric degeneration, gluing, formal and contraction machinery; the new layer
   verifies their application to the Deligne–Pappas boundary and the unique
   ordinary splitting filtration. The projective flag-model and finite
   polarized moduli-map arguments are stated, rather than inferring properness
   merely from gluing. No ramified prime or different is inverted.
4. **Correct supplier scope, not just spelling.** The lower-tier proper
   algebraic/analytic comparison used here is the current
   ClassicalAdicEtaleCohomology package Layer 8, §8.2 (arbitrary proper algebraic
   varieties and torsion coefficients), not an extrapolation from its old
   curve-only H5 reader section. Finite coefficient finiteness is from
   SchemeAndStackFoundations SF.2 and PadicHodgeTheory P8's
   `constructible-primitive-comparison`. The filtered comparison interface is
   PadicHodgeTheory P8 `filtered-derived-period-interface`; EnhancedDerivedSheaves
   E4 alone is coefficient completion, not a theorem of spectral-sequence
   degeneration. The relative abelian inputs use actual P8 targets
   `relative-bdr-plus-local-system-comparison`,
   `relative-hodge-tate-filtration`, `relative-hodge-tate-first-step`.
5. **Avoid unprovided generic substitutes.** B3.HT.2–3 prove the actual
   Siegel uniformity, boundary and density estimates; they do not invoke the
   arbitrary-ring Frobenius criterion left as a gap in PerfectoidSpaces P7.13.
   B3.HT.6 uses its closed-subspace/limit machinery P8.14/P8.21, not P8.18's
   missing unrestricted continuous Tate-pair universal property. Generic
   completed-root, tilting, limit and gluing constructions remain in
   PerfectoidSpaces. B3.HT.3 only uses the independent trace target B5.1;
   B3.HT.8 only uses the independent section-colimit target B4.19. These
   forward helper references are explained in the construction order and
   create no cycle.
6. Packet pointers to the former conditional inputs should be updated to the
   new target IDs. The prior handoffs' independent packet cleanups remain
   coordination notes; this run did not modify or certify those packets.

## Mathematical controls checked

- The Hilbert determinant coefficient at a cusp is the different times
  `(IJ)⁻¹`, while the exponent lattice is the inverse different times `I⁻¹J`.
  Ordered ramified graded lines survive coinciding residue embeddings.
  The full cusp stabilizer phase and unit characters are retained; flat base
  change is applied to line-valued series before taking invariants. Component
  detection is at every geometric residue fibre on a fine cover, and is not
  asserted for Iwahori levels with cusp-free components.
  The Stein step uses the normal-DVR form of Stacks Lemma 37.53.6 (0AY8):
  each proper component closure has generic global functions equal to the
  fraction field, so its fibres are geometrically connected. Smoothness then
  gives irreducibility, without needing a new general component-space theorem.
- The weak Hasse exponent is `(p^m−1)/(p−1)`; the strong sufficient exponent
  is `p^m`. The uniqueness precision is `1−ε>ε`, including p=2. In genus two
  the canonical subgroup has rank `p²`, while the Frobenius map degree and
  trace normalization are `p³`. Normalized trace has denominators bounded by
  `p^{C_m}`, with `C_m→0`; it is not an assertion that its norm tends to zero.
- On a root boundary chart the supported period quotient kills all positive
  fractional roots; quotienting only by the original coordinate leaves
  nilpotents. Boundary intersections occur with alternating signs. For the
  unit coefficient on G_m, ordinary H¹ has twist −1, while compact H¹ has
  twist zero and compact H² has twist −1.
- Nilpotent residues give a tensor comparison. Arbitrary normalized
  quasi-unipotent residues do not: tensoring exponents can produce a carry.
  The BGG differentials are differential operators on abelian sheaves, not
  O-linear maps. The compact complex uses the induced logarithmic connection
  on O(−D). At the zero Siegel weight the four ranks are 1,3,3,1; the nonzero
  weight `(0,−2;2)` tests Hodge degrees 0,1,4,5 and central sign −2.
- The standard BCGP coefficient `(1,0;−1)` gives the classical bundle
  `ω_A(−1)`. The torsor comparison retains its Tate line; the B5.21/B5.22
  coherent summands are untwisted before their one displayed Tate twist.

## Source reading and reproducibility

Read the previous review, the accepted input packets and their library audit,
the complete package, the relevant lower-tier and partner targets, the binding
protocols, and current upstream AlgebraicVectorBundles and ReductiveGroups
READMEs/Suggested files, with relevant ModularForms material and current
library searches. Current read-only TauCetiRoadmap commit:
`0d144d044dacebca17b654695b6f1ad58f159b27`; current read-only Tau Ceti library:
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. These were duplication checks,
not substitutions for the pinned Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`
and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

Public source files were read on 16 October 2026. The README bibliography
links the same editions. SHA-256 identifies undated author-hosted manuscripts.
Stacks tags 03H0 and 0AY8 were also opened and read for the component argument.

| Label / edition | Passages read for this revision | SHA-256 |
|---|---|---|
| BCGP, arXiv:2502.20645v1 | §§4.3–4.6, especially Proposition 4.3.1 p.71, finite-algebraic comparison p.78, cohomology pp.81–82; §4.8 pp.101–102 | `51d7eacca6eae394943f09ab72dfe09ee9aa6da27f563be8237c416e5da4e95c` |
| Diamond21, arXiv:2011.14128v2 | §7.1 pp.31–34, §7.2 pp.34–38, equations (17)–(26), Propositions 7.1.1 and 7.2.1–7.2.2 | `2d8f8fd3d1e1e468d57183bcd0eef454e1e8fff4a7e143c8a0e48e490692e3c2` |
| Diamond22, arXiv:2211.06922v1 | §§2.3–2.10 pp.3–8, §§6.1–6.3 pp.24–26, including §2.7 footnote 4 and Proposition 6.2.1 | `672b6b4bc3bedb9081dbad088829cba95754e2461dcbb22a1a0453cf0585b24c` |
| DLLZ, author-hosted log-adic manuscript | §§2–5 pp.7–80; Theorem 5.4.3 pp.79–80; §§6.1–6.3 pp.81–91, especially Theorem 6.2.1 pp.85–87 | `209e59836048eabbbf9735012a38c7c393fb2a30f69ce50ffac7e83b37ee1105` |
| DLLZRH, arXiv:1803.05786v4 | §§2.2–2.4 pp.11–22, §§3.2–3.6 pp.26–43, §4.1 pp.46–48, §§5.2–5.5 pp.52–64 | `6428b9263775c2967b5a82896fbe0f99a59d7e3ec1516cc5a38f77223172f2e2` |
| LLZ, author-hosted comp-dual manuscript | Boundary periods/primitive comparison pp.12–30, duality §4 pp.30–47, Theorems 5.5/5.10 pp.49–50, BGG/comparison §§6.1–6.2 pp.51–55 | `cabfead116fedbe9a96b148978d114de91c66cbe2663a06cf11a51c77c569184` |
| Pilloni–Stroh, author-hosted coco manuscript | Appendix A, Propositions A.15–A.19 pp.28–30 | `2c9f90c39f0efacd3fa076ef189b1d552da900d1968e34c3c8b3e551dcb4e3a1` |
| Lan22, author-hosted cpt-tor-imm manuscript | Propositions 4.9–4.10 p.14, Proposition 6.1 and proof pp.19–20 | `4d5c1a829c7b2f0965bfd8e911ab8816b3b80abd8c79e8b3196449d9fd0b7244` |
| Rodríguez Camargo, arXiv:2209.01057v4, 9 April 2026 | §4.2, equation (4.1), Theorem 4.2.1 and proof pp.21–23; v4 is the cited edition | `78cb3108dece0a793be5e8571c5a5f402d1df2f064796f5425337d884c701b98` |

The maintainer-cleared Faltings–Chai book was read at VI §5 pp.230–235
(especially Propositions 5.3–5.4 and Theorem 5.5), and VI §6 pp.238–241
(especially Theorem 6.2(i)). The maintainer-cleared Scholze torsion manuscript
was read at II §3 pp.20–26 and III §§2–3 pp.31–62, including the subgroup
proofs, Hasse/Frobenius estimates, traces, finite-cover construction and
period-map extension. Only those cleared copies were used for these sources;
neither their files nor extracted passages were saved elsewhere. Repository
  statements and tables are in the worker's own words, not source excerpts or
  section-by-section source summaries.

## Validation and where to resume

- `lean-check research/blueprint/packages/AutomorphicBundles/Suggested.lean`:
  exit 0; exactly 16 warnings, all declaration-uses-sorry; no errors or other
  warnings. Checked memory first, used one shared pinned compiler, and left
  no compile running. Only the final comment changed from the reviewed Lean.
- `python3 scripts/check_sorry_data.py research/blueprint/packages/AutomorphicBundles/Suggested.lean`:
  exit 0, no sorry'd data definitions.
- `python3 scripts/check_blueprint.py` on each unchanged B0 and B5 packet:
  exit 0, zero errors and warnings.
- Target audit: 114 targets, all 94 previous target IDs retained, 20 new;
  every target has Source/Needs/Lean and at least three Checks. The internal
  Needs graph, including numerical ranges, is acyclic with no missing IDs.
- `python3 research/blueprint/intake.py check-files` on the README, Suggested,
  metadata and this handoff: zero problems.
- `git diff --check`: clean.

Resume with the independent package review. In particular verify the new
boundary, log/support, BGG and rational-tower constructions against their
locators and check the ownership moves above. No independent acceptance or
formalization is claimed by this submission. The next reviewer replaces
`review.json`; the maintainer coordinates the downstream import changes.
