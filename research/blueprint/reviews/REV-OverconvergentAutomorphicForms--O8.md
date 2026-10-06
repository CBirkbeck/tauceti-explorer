# Independent review of OverconvergentAutomorphicForms O8

**Verdict: accepted with the corrections below.** Reviewer: Codex, session
`codex-HAn2v5`, job `REV-OverconvergentAutomorphicForms--O8`, issue #523,
6 October 2026. The author of BP issue #1017 was a different session,
`codex-kZNXQQ`; this reviewer did none of that work.

The reviewed packet is a complete **target-level planning pass**, with O8
**planned**, not closed. Its eighteen nodes account for all five target groups:
Siegel analytic coefficients, determinant/Hodge lines, finite Levi coefficients,
supplied non-Siegel reductions, and general toroidal diamond coefficients.
Acceptance certifies the mathematical plan and its explicitly conditional
interfaces. It does not certify implementation or prove the three recorded gaps.

## Counts and scope

| Item | Result |
| --- | --- |
| Nodes | 18: 8 lemmas, 8 theorems, 1 construction, 1 application |
| Node verdicts | 15 verified, 3 corrected, 0 added, 0 unverifiable |
| Baseline declarations | All 17 confirmed; 0 removed or replaced |
| Construction API and unit tests | All 6 API items and 4 tests checked |
| Planets | 6; all mathematical names, at most 60 characters |
| Cross-owner requests | 8, with 3 clarified |
| Explicit gaps | 3 retained; source-review obligation replaced by published-version collation |
| Source findings | Original 14 confirmed; 2 added and confirmed; 0 rejected |
| Finding kinds | 9 misprints, 5 errors, 2 gaps |
| Suggested Lean file | Elaborates at pinned Mathlib; 29 expected `sorry` warnings, no errors |

All original node IDs, baseline references, planets and implementation statuses
are preserved. No node was split: the proof sketches have the granularity required
by the target-level brief. The suggested file needed no edits.

## Source verification and editions

Every node's locator, short excerpt, mathematical hypotheses and proof route was
checked against these public documents:

- Diao–Rosso–Wu, [arXiv:2106.00094v3](https://arxiv.org/pdf/2106.00094v3),
  9 April 2026, 108 pages. SHA-256:
  `41ced4964ca50027e9fb93813047820a2853b9632fed221cbd5690be4d3294a8`.
  The review inspected the row/symplectic convention, levels, graph calculation,
  Hodge frame, induced coefficients, comparisons, canonical charts and every
  finding at its individual locator. Page images were additionally checked for
  the critical formulas on pp.22, 36, 42, 47 and 104.
- Boxer–Pilloni, [Higher Coleman Theory, public author manuscript](https://www.imo.universite-paris-saclay.fr/~pilloni/HigherColeman.pdf),
  180 pages. SHA-256:
  `d340c9a020cc5fdbca781a8630b6fae35e14607142bed700d6ab82334faa80ae`.
  Relevant checks include §3.5.1 (pp.46–47), Remark 4.4.28 (p.76),
  §§4.4.38–4.4.40 (pp.79–80), §§4.6.8–4.6.14 and the pushout (pp.92–95),
  §4.6.18 (pp.96–97), §6.2.11 (p.150), and §§6.3.1–6.3.6 (pp.153–154).

Both downloaded PDF hashes match the packet. The DRW
[version of record](https://link.springer.com/article/10.1007/s40687-026-00610-5)
is Research in the Mathematical Sciences 13, article 31 (2026), published
31 March 2026. The publisher served metadata and an abstract/access preview;
its PDF endpoint returned HTML marked `access=No`, not the article PDF. Full
published statements and proofs were not read. Earlier arXiv versions were not
collated. **Every finding below is confirmed only in the hashed v3 preprint.**

The arXiv version history, author research page and public title/author correction
searches were checked. No applicable correction was located in those searches;
the author's linked erratum concerns a different article. This is neither an
exhaustive search nor a claim of priority. The packet now has the mandatory
`sourceVersions` records, including the publisher-access limitation.

## Corrections made

1. **Atkin–Lehner source locator and excerpt.** The matrix display is Remark
   3.6.2 on p.43, rather than p.42. The excerpt now quotes its AL domain/codomain
   display; `Z′ = −pZ` is identified as the coordinate consequence of the row
   calculation. Page 42 remains cited for the preceding canonical chart.
2. **Toroidal actions.** Both toroidal nodes previously required a `G(Qp)`
   action on the tower for a fixed cone system. Their hypotheses and acceptance
   conditions now use the supplied deck actions preserving that system. General
   Hecke maps require compatible levels/cones and common refinements. The S6
   request says the same. DRW Remark 2.5.1, p.18 explicitly distinguishes the
   integral action from cone-changing rational Hecke maps; BP Remark 4.4.28 and
   §4.6.18 corroborate the distinction. The coefficient constructions and Tate
   twist are unchanged.
3. **Source review.** Each of the original fourteen findings now has a separate
   independent verdict and reason. Their stale unreviewed status is replaced.
   E-O8-15 and E-O8-16 are added with `addedBy` and independent verdicts.
4. **Supplier requests and remaining work.** T3 now explicitly requires primed
   canonical-chart coordinates; O0 requires a coefficient module rather than a
   general fixed-weight algebra. The coverage summary and third gap replace
   the completed independent source review with the still-open published-version
   collation. The quantitative uniformity and corrected intertwiner proofs remain
   genuine supplier obligations.
5. **Review metadata.** Added the top-level accepted verdict and one checked
   entry for every node, with no unverified node verdicts.

## Baseline and ownership

The following source statements were read at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174`, including their surrounding
typeclass assumptions. The supplied declaration index is a secondary check;
existence was not inferred from names.

| Declaration | Statement/hypothesis check |
| --- | --- |
| `Matrix.fromCols` | Existing rectangular row graph, using a sum column index |
| `Matrix.fromCols_mul_fromBlocks` | Exact two-block product, finite intermediate indices, semiring |
| `Matrix.mul_fromCols` | Left multiplication distributes over the column partition |
| `Matrix.fromBlocks_multiply` | Four blocks in the required order; weaker nonunital/nonassociative semiring assumptions suffice |
| `Matrix.isUnit_iff_isUnit_det` | Square finite matrix over a commutative ring; determinant unit iff matrix unit |
| `Matrix.mul_nonsing_inv` | Right inverse only under `IsUnit A.det` |
| `Matrix.nonsing_inv_mul` | Left inverse under the same determinant-unit hypothesis |
| `Matrix.GeneralLinearGroup.det` | Bundled homomorphism into units, over a commutative ring |
| `Matrix.det_mul` | Exact multiplicativity, with finite decidable square indices |
| `Matrix.transpose_mul` | Product order reverses; commutative entry multiplication is enough |
| `mul_zpow` | Product formula in a division commutative monoid, applicable to the unit group |
| `map_inv` | Group homomorphism into a division monoid preserves inversion |
| `Module.Basis.det_apply` | Coordinate-family determinant over the stated commutative-ring module |
| `AlternatingMap.eq_smul_basis_det` | Top scalar-valued alternating map is its basis value times the basis determinant |
| `LinearMap` | Bundled semilinear map; specializes to the pointwise function module |
| `Matrix.GeneralLinearGroup.mkOfDetNeZero` | Field and nonzero determinant, exactly as in the rational matrix tests |
| `Matrix.det_transpose` | Determinant unchanged by transpose |

There are no Tau Ceti baseline declaration citations to verify. The reviewed
AUDIT-15 O8 row and all four of its targets were read. Additional searches of
Tau Ceti at `f790474821cf4256814db967cb154e7af3d0c369` and pinned Mathlib
found no matching Siegel geometry or coefficient sheaf implementation. Complex
modular actions, algebraic matrix operations, period-ring ingredients and toroidal
knot grids do not implement these targets. No existing library theorem is
replanned, and the audit's B4/S6 ownership warnings are respected.

The exact imported AutomorphicBundles nodes were read:
`B0/hodge-parabolic-convention`, `B0/sections-equivariant`,
`B2/levi-highest-weight-convention`, `B3.general/general-canonical-extension`,
and `B4/siegel-coefficient`. They supply opposite parabolics, the right-torsor
inverse coefficient convention, the highest-weight/dual conversion, the normalized
boundary extension and the finite Schur/determinant bundles. The S1/S3/S6,
T3/T6:comparison, B4, O0 and O1 stage contracts were checked. Their absent finer
implementations are explicit requests, not silently assumed baseline facts.
The current O0 packet contains Hilbert weight/unit/norm results and does not
provide general GL-g analytic induction.

## Per-node mathematical check

IDs below have prefix `OverconvergentAutomorphicForms:O8/`; the packet's
`review.checked` contains the individual detailed verdicts.

| Node | Verdict and decisive check |
| --- | --- |
| `graph-normalisation` | Verified: row multiplication and unit-only cancellation |
| `factor-composition` | Verified: block expansion retains the shifted point and product order |
| `coordinate-composition` | Verified: two unit denominators permit graph-factor cancellation |
| `antidiagonal-dual-factor` | Verified: transpose reversal gives `A‡ + C‡Z` |
| `determinant-character-cocycle` | Verified: homomorphisms and scalar commutativity justify the inverse formula |
| `hodge-frame-transformation` | Verified: the exact S3 dual-Lagrangian comparison transports the source frame law |
| `determinant-frame-transformation` | Verified: top exterior power and the two basis-determinant statements |
| `scalar-coefficient-identification` | Verified: analytic character extension and O1 equalizer, with inverse scalar factor |
| `determinant-hodge-specialisation` | Verified: invariant `fη^m`, with dual frames for negative integers |
| `algebraic-levi-specialisation` | Verified: actual right-frame associated bundle, finite descent and explicit similitude convention |
| `determinant-line-map` | Verified: concrete linear map, identity left inverse, translation API and four tests |
| `siegel-analytic-instance` | Verified: full Borel equivariance, transpose-left action, radius `w > 1+r`, module structure |
| `algebraic-induced-injection` | Verified: regular-function restriction and monomorphism descent, retaining B2 conversion |
| `atkin-lehner-chart` | Corrected locator/excerpt; arbitrary scalar row identity and unit-only inverse verified |
| `toroidal-coefficient-instance` | Corrected fixed-cone action; applies the genuine BP diamond/torsor input |
| `toroidal-algebraic-comparison` | Corrected fixed-cone action; associated finite bundle retains its μ-cyclotomic twist |
| `supplied-domain-instance` | Verified: actual reduction, coefficient action and effective descent are explicit inputs |
| `bruhat-reduced-family` | Verified: actual projected subgroup, reduction inequality, field enlargement and Weyl/root shift |

The determinant construction's six API items let a user evaluate the map,
recover its scalar, establish injectivity, translate on either side and compare
with the trivial character. Its bundled linear-map type supplies the module laws.
The four tests distinguish a constant map, a wrong determinant value and a
noninjective map. The surrounding examples also detect singular cancellation,
matrix-order reversal, antidiagonal reversal, integer-weight sign mistakes and
Atkin–Lehner sign/scalar mistakes. These are specification tests with placeholder
proofs, not executed mathematical proofs.

The six planets name the actual factor, Hodge bundle, finite automorphic bundles,
analytic sheaves, toroidal coefficients and Bruhat-domain families. No source
locator or diagnostic is used as a planet.

## Independent source-issue verdicts

All sixteen verdicts are **confirmed in DRW v3 only**. Existing classifications
and the limited reach of the two proof gaps are preserved.

| Finding | Locator | Independent check |
| --- | --- | --- |
| E-O8-1 | Def.2.2.1(iv), Rem.2.2.2, pp.10–11 | A genus-one line stabilizer contains unipotents and is larger than the diagonal torus |
| E-O8-2 | §2.3 p.14 versus §2.1 p.7 | At the zero graph the displayed pairing is negative identity |
| E-O8-3 | Lem.2.2.5 p.13 | Strict-Iwahori pushforward target requires the plus |
| E-O8-4 | Rem.3.1.7 p.22 | Residue cosets have radius `p^(-ceil r)` |
| E-O8-5 | Def.3.1.6(iii), Rem.3.1.7 p.22 | The stated polynomial is pointwise integral but its analytic Gauss norm is p |
| E-O8-6 | Rem.3.1.12 p.23 | A multiplicative character is 1 on the unipotent subgroup |
| E-O8-7 | Def.3.1.14(v) p.25 | The strict-Iwahori colimit must retain its level |
| E-O8-8 | Rem.3.3.9 p.34 | Principal-level invariants require larger-group representatives for the quotient action |
| E-O8-9 | Prop.3.3.10, Φ, p.36 | The printed target excludes zero; the correct condition is right-unipotent invariance |
| E-O8-10 | Prop.3.3.10, intertwiners, pp.35–36 | Genus two produces opposite diagonal factors under the two multiplication orders |
| E-O8-11 | §3.4 pp.37–38 | A torus-invariant regular function need not be upper-unipotent invariant |
| E-O8-12 | Rem.3.6.5(i) p.44 | Divisibility becomes weaker when the radius exponent decreases |
| E-O8-13 | Cor.3.6.13 versus Prop.3.6.12 p.47 | Missing `n−1` hypothesis and an omitted step from pointwise to uniform bounds |
| E-O8-14 | Appendix B.2 p.104 versus B.1 p.102 | The two quotient lattices have different ranks, including the maximal isotropic test |
| **E-O8-15 added** | Canonical-domain display p.42 | `[0,I]` has primed coordinates but no unprimed graph coordinates; the radius formula drops the prime |
| **E-O8-16 added** | Def.3.1.14(ii) p.24 | Multiplication changes κ to κ²; already in genus one `f(u)=u` has a square outside the same weight |

These checks establish the specified local misprints, errors and proof gaps.
In particular E-O8-10 does not on its own disprove the main comparison theorem,
and E-O8-13 supplies no counterexample to cofinality. Corrected intertwiners and
uniform bounds still need proofs from their owners.

## Validation and remaining assembly work

`python3 scripts/check_blueprint.py
research/blueprint/packets/OverconvergentAutomorphicForms--O8.json` reports
**0 errors and 0 warnings**. The section-18 `versions_checked` and `check_issues`
validators also pass, and each node/finding has exactly its required review entry.
`git diff --check` passes. The suggested file was checked with `lean-check` in
the shared pinned Mathlib build after confirming adequate memory; exit status 0,
only the 29 expected placeholder warnings. It contains six finite matrix lemmas,
one construction, six API lemmas, four named tests and twelve additional examples.
The eleven geometric signatures remain honestly omitted until supplier types exist.

Questions/actions for the orchestrator:

1. Synchronize the reader in an authorized assembly/revision job. It is outside
   this review's deliverables and was read without editing. Its Atkin–Lehner
   source line still says p.42; both toroidal hypothesis lists still require the
   fixed-cone `G(Qp)` action; its S6 request, fourteen-finding count, unreviewed
   paragraph and remaining-source-review language need the corrections above.
   The new findings and their T3/O0 clarifications should also be carried over.
2. Route the precise higher-rank O0/O1, S1/S3/S6, T3/T6 and analytic B4 requests
   to their owners. Replace stage-level dependencies by verified node IDs as
   those interfaces arrive. The Bruhat reduction is not a substitute for T3's
   Siegel canonical-domain theorem.
3. Obtain the DRW full published text for version-of-record collation. Preserve
   the preprint-only scope until that comparison is made.

No further correction is needed in the reviewed packet or finite prototype for
this target-level pass. The three explicit gaps and eight requests explain the
remaining work without an unresolved contradiction in the reviewed statements.
