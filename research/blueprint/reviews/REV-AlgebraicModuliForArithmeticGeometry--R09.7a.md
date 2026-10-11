# Independent review of R09.7a–d

Accepted as a **complete target-level blueprint pass**, with all four stages **planned** and all implementations **unchecked**. Reviewer: Codex, session **codex-Ra1y4s**, job **REV-AlgebraicModuliForArithmeticGeometry--R09.7a**, issue **#347**, 2026-10-11. The input was written by the different session **codex-dtTm52** in BP-AlgebraicModuliForArithmeticGeometry--R09.7a, issue #673, merged PR #8683.

The corrected [packet](../packets/AlgebraicModuliForArithmeticGeometry--R09.7a.json) has **11 nodes: six verified and five corrected**, with no added or unverifiable nodes. These comprise three definitions, five constructions, two theorems and one application; the eight definitions/constructions have **32 API items and 25 discriminating test groups**. There are **nine planets, ten confirmed pinned baseline declarations, seven supplier requests and no unresolved mathematical contradiction**. Forty core targets are imported from the separately accepted R09.7 packet. No stage is closed.

## Corrections

1. **General blowup centres.** Changed “finite-type coherent” to **finite-type quasi-coherent** ideals on arbitrary schemes. Finite generation alone does not imply coherence over a non-Noetherian base. This matches the native ideal-sheaf carrier and StableReduction Layer 4's stated generality. Added projection-compatible restriction and nested-restriction signatures; every identity year remains present.
2. **Controlled cancellation.** Added `MarkedTower.controlled_unique`, giving the uniqueness already promised by the packet's controlled-transform API. Locally, cancellation of the regular exceptional equation and its positive power identifies the remaining ideal. The existing product equation, strict old labels, born label and total-transform formula are retained.
3. **Embedded output centres.** Added a coordinate-permissibility field to `EmbeddedTower` and made that requirement explicit in its packet statement. Smooth successive ambient spaces and boundary alone did not record this part of the imported algorithm's witness. The full preserved-pair and canonical tower comparisons remain the accepted core's obligations.
4. **Normalization ownership.** Replaced the generic A0-extension prerequisite of finite-cover compactification by **SchemeAndStackFoundations:SF.0/nagata-normalization-finite**. Its actual statement includes normalization in a finite function-field extension and the native relative-normalization carrier. Removed the redundant A0 normalization request and retained only the open-cover identification and localization refinements with SF.0. The supplemental request count is now seven. The aggregate's separate A0 analytification request remains in force.
5. **Chart tests and constructors.** Added the identity chart's actual map and unit signatures. Strengthened its identity example to inspect both, and replaced an unrelated disc-nonvanishing observation by a non-example about an actual `MonomialBoundaryChart`: an identity map cannot have exponent zero with a unit extending across the origin. This test rejects a plausible definition accepting units only on the punctured complement.
6. **Normalization after strictification.** Added a fourth finite-cover test, `singularAfterRefinement`, with a native third-Veronese spectrum. The existing quadratic-cone example establishes that normalization can be singular, but its degree-two singularity disappears after the two-axis boundary blowup. The cubic example below survives that preceding step.
7. **Source finding E1903.** Confirmed the accessed preprint's gap, added its independent verdict, and corrected its classification from **new** to the existing **author-hosted erratum**. Updated the search record and recorded the correction page under `sourceVersions`.

No baseline citation was removed or replaced. No new mathematical node, roadmap or upper-tier dependency was introduced. Each node's `review.checked` entry records its hypotheses, source and closure check.

## Source and mathematical checks

All five downloaded public PDFs match the packet's SHA-256 hashes. The six original source families were inspected at the recorded editions and locators:

- **Bierstone–Milman**, [full published article](https://www.mahalex.net/teaching/seminars/gabber/Bierstone-Milman%20Canonical%20desingularization%20in%20characteristic%20zero.pdf), Inventiones 128 (1997), pp. 207–302: finite towers and principalization, Theorem 1.10, pp. 216–217; controlled transforms, (4.3)–(4.4), p. 242; regular coefficients, Construction 4.18, Proposition 4.19 and Remark 4.20, pp. 246–247; birth history, Definitions 6.8 and 6.15, pp. 256, 259; embedded output, Theorem 11.14, pp. 290–291; preservation and comparisons, Theorems 12.2, 12.4 and 13.2, pp. 292–298. The algorithm and its proof remain imports from the accepted core.
- **Landesman–Litt**, [arXiv v4](https://arxiv.org/pdf/2205.15352v4), February 2025: Lemma 2.2.3, author p. 15, and the proof of Lemma 8.3.3, author pp. 40–41. The finite-cover geometry is separated from the representation-theoretic integrality conclusion.
- **Li–Litt–Salter–Srinivasan**, [author PDF](https://nsalter.science.nd.edu/research/sectconj.pdf), Lemma 2.1.1 and proof, author pp. 7–8: local exceptional inertia at an intersection of node divisors. The general monomial-meridian statement is a deduction here; the identification with disjoint-curve Dehn twists is a consumer premise.
- **Boxer–Pilloni**, [author PDF](https://www.ma.imperial.ac.uk/~gboxer/higherhidaSiegel.pdf), §4.1.10, Proposition-construction 4.1.11, author p. 42: arbitrary-scheme Cartier separation is imported from the core. It is not replaced by characteristic-zero smooth resolution.
- **Bakker–Klingler–Tsimerman**, [author PDF](https://benjamin-bakker.github.io/DefArith.pdf), §4.1, author p. 13: smooth compactification and local boundary-coordinate input. Definability, coverings and period-map conclusions remain with the consumer.
- **Stacks Project**, [0AVK](https://stacks.math.columbia.edu/tag/0AVK) and [§41.21](https://stacks.math.columbia.edu/tag/0CBN), including [0CBR](https://stacks.math.columbia.edu/tag/0CBR): finite relative normalization, strict versus étale normal crossings, Cartier equations supported on boundary components, and étale locality.

The completion comparison keeps the actual finite residue field κ(a), the regular coordinate derivation and restriction maps. Repeated `coeff_pderiv` gives the factorial-normalized coefficient; applying the same common-mark powers and native ideal extension gives the coefficient ideal. The Noetherian completion supplier must provide faithful flatness and the geometric algebra-map compatibilities. There is no assertion that arbitrary independently chosen formal germs descend.

Boundary strictification descends permutation-invariant original branch-stratum ideals. Blowing up higher original branch ranks separates the next centres; the coordinate fan undergoes barycentric subdivision. New boundary intersections do not restart the algorithm. Globally self-intersecting components are allowed initially and must become smooth labels at the endpoint. The axes test distinguishes reduced boundary from its nonreduced total pullback, and the nodal test distinguishes an irreducible self-intersection from a globally split pair.

Finite-cover compactification first uses finite normalization, then resolution and boundary principalization preserving the given cover. Projectivity comes from the chosen projective model and projective modifications; properness alone would not supply it. Dominance on the smooth integral source makes each pulled-back target Cartier equation nonzero. Local factoriality then yields its boundary monomial. The output map can cease to be finite, and no flat pullback argument is used for resolution.

For the stronger counterexample, start over C with the connected degree-three cover `z³=xy` of the two-dimensional torus. On the x-pivot chart of the boundary-intersection blowup, `x=u`, `y=uv`, so `z³=u²v`. Its integral closure is

`C[a³,a²b,ab²,b³]`, with `u=a³`, `v=b³`, `z=a²b` and `ab²=z²/u`.

This is the normal invariant ring for scalar μ₃ on `C[a,b]`. It is finite over `C[u,v]` and has the required fraction field. At the vertex it has dimension two and cotangent dimension four: its four degree-three generators have no linear relation modulo the square of the maximal ideal. Thus normalization remains singular even after that boundary refinement. The new Lean example states nonsmoothness of this actual subalgebra spectrum; the identification with relative normalization remains a specified SF.0 comparison.

The meridian formula follows by coordinate winding in the product of punctured discs. A unit extending without zeros over the full source polydisc sends a coordinate loop to a nullhomotopic loop in C×. The nonnegative exponent column therefore gives the positive source meridian's image. The axes pivot matrix is `[[1,0],[1,1]]`; composition is `BA`. Target coordinate meridians commute, and global basepoint changes give simultaneous conjugacy.

**E1903 is confirmed but already known.** [Daniel Litt's author-hosted correction page](https://www.daniellitt.com/published-paper-reviews.html), P04 erratum **item 11**, identifies the normalization step in Lemma 8.3.3, published p. 868, and supplies resolution together with exceptional-boundary monodromy. The page describes AI-assisted audits and Litt's review/editing of the erratum. The packet's finding remains against the accessed arXiv v4 text: the journal full text was not inspected. The mathematical gap and repair were checked independently above; no claim of a new correction or failure of the integrality theorem is made. No source passage was added to the repository, and no restricted book was needed.

## Baseline, ownership and supplier contracts

The actual declarations and surrounding hypotheses were read at Mathlib **082e2d37e8b0463410cdb532e111cd43d5a66174**. The suggested file was elaborated with the shared Tau Ceti **f790474821cf4256814db967cb154e7af3d0c369** build.

| Confirmed declaration | Contribution and limit |
| --- | --- |
| `AlgebraicGeometry.Scheme.IdealSheafData` | Native quasi-coherent affine ideal data, operations, supports and closed subschemes. |
| `AlgebraicGeometry.Scheme.IdealSheafData.comap` | Actual contravariant scheme pullback ideal. |
| `AlgebraicGeometry.Scheme.IdealSheafData.comap_comp` | Correct chronological composition of ideal pullbacks. |
| `AlgebraicGeometry.Scheme.Hom.ker` | Native kernel ideal; the quasi-compact image case supplies schematic strict closure. Finite-type centres give quasi-compact complements on affine charts. |
| `MvPowerSeries.coeff` | Multi-index coefficient linear map. |
| `MvPowerSeries.pderiv` | Formal derivation over the coefficient ring; geometric completion compatibility is separate. |
| `MvPowerSeries.coeff_pderiv` | Shifted coefficient multiplied by the corresponding exponent plus one. |
| `FundamentalGroup.map` | Continuous-map homomorphism on actual based homotopy classes. |
| `FundamentalGroup.fundamentalGroupMulEquivOfPath` | Basepoint change through an actual path. |
| `Path.Homotopic.Quotient.mk` | Endpoint-fixed homotopy class of a native path. |

The library audit and current upstream were checked separately from the pins. Current TauCetiRoadmap main **070dc2becd74419e76303ede84b465ed4a69461f** and Tau Ceti **a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039** were inspected read-only. StableReduction's general blowup bullet, AlgebraicVectorBundles' algebraic infrastructure and analytic successor boundary, and all nine roadmaps newer than the atlas snapshot were screened. Current effective-Cartier, affine-blowup/Rees-chart and regular-fan analytic boundary declarations remain imports or packaging replacements. The new chart records a morphism and exponent matrix beyond the existing toric normal form.

The forty `importedTargets` exactly match the accepted core's forty node identifiers. The two principalization/embedded output certificates consume its algorithms; they do not duplicate them. **RT-AREA-algebraicgeometry/13 is satisfied**: ordinary blowups, universal property, charts, strict transforms and flat base change belong to StableReduction Layer 4. Both packet and reader explicitly import that owner. The old campaign wording is superseded by those owner contracts.

The seven open requests are precise: StableReduction's tower comparisons; SF.0 completion/branch-normalization and finite-cover normalization comparisons; SF.3 Cartier/divisor and supported-monomial dictionary; R09.3 descent of invariant centre ideals; R09.4's existing stable-moduli import and node charts; R09.5's characteristic-zero finite étale scheme cover and actual extension/coarse comparison; and SF.1's stack descent. Related supplier statements were read, not treated as automatically providing stronger interfaces. In particular, R09.5's DM ordinary normalization is distinct from normalization in an extended function field; its finite-surjective cover contract at wild primes is weaker than the required complex étale cover. A scheme cover of the open alone does not establish effective scheme realization at the boundary. Projectivity and the stack-to-coarse comparison retain their separate conditions.

## Validation and assembly actions

- `python3 scripts/check_blueprint.py` on this packet: **0 errors, 0 warnings**, including source-finding validation and pinned declaration checks.
- Embedded `check_errata.check` with the packet's roadmap identifier and errata envelope: **0 errors**, including both source-version records. The standalone errata CLI expects a separate `errata-v1` file, so its initial invocation on a blueprint was inapplicable.
- `lean-check` on the corrected suggested file: **exit 0**, **127 declaration-uses-sorry warnings**, no errors or other warnings. This checks native types and example statements; their mathematical proofs remain unfinished.
- Exact import-set, independent-review identifiers, all eleven verdicts, unchecked statuses, API/test-name coverage, allowed-file intake and whitespace checks passed.

The [reader](../readmes/AlgebraicModuliForArithmeticGeometry--R09.7a.md) was read but is not an editable deliverable of #347. **Assembly or packaging must synchronize it with the accepted packet**: use finite-type quasi-coherent centres on arbitrary schemes; require permissible centres in embedded certificates; route finite normalization and the cone comparison to SF.0's existing owner; reduce eight requests to seven; add the cubic test and increase 24 test groups to 25; strengthen the chart examples; and replace the unsuccessful-correction-search paragraph by the existing author-hosted erratum. Retain the native prototype omission ledger, including the stack carrier, stratum algorithm, smooth-pair comparison and completion reflection. The earlier core reader also needs its separately documented corrections.

There is no unresolved question requiring a revision round. The orchestrator should route the seven requests and perform those reader updates in an authorized assembly/package job. The accepted specification is this corrected packet and suggested file together with the accepted core. This worker completes only #347 and takes no second job.
