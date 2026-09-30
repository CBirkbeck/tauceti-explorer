# FIX-RT-PAPER-BENOIST-19

Codex, session `codex-rtOQ9t`, 30 September 2026. Issue [#5008](https://github.com/CBirkbeck/tauceti-explorer/issues/5008). Based on all 60 findings and their independent verification: **55 confirmed findings applied; five rejected proposals left unapplied**. This is a fix submission awaiting `REV-FIX`, not an independent review of this worker's changes.

The extraction now has **202 items: 14 library, 13 planned, 175 missing**, with each missing item routed once. All 187 inherited IDs and their statuses survive. The first ten route identities and positions survive; routes 11 (late SF.6 comparison) and 12 (the existing IG Artin-comparison owner) are appended. No Lean implementation is claimed.

## Source and baseline evidence

The [published article](https://www.numdam.org/item/10.1007/s10240-019-00108-7.pdf), [arXiv v2](https://arxiv.org/pdf/1804.03642v2) and [author copy](https://www.math.ens.psl.eu/~benoist/articles/realperiodindex.pdf) were fetched on 30 September. Their SHA-256 hashes are, respectively:

- `8dfc0f221ab510ba1ecfe7c5b5fde12c217019f33d704ea89ce1a0c144398d3b` (48 pages).
- `5dc12ae78790cfc5f2fb3ce9921269cbf593c38022a41a0c7da798795c9c3cda` (39 pages).
- `e4c90a314c6d9ea38d3bd8498a6ec050aa763c4150890c98cc295390ef4ece2a` (48 pages).

Fresh reading covers published pp.63–66, 69–71, 79–80, 84–96, 99–100, 103 and 106–110. Images of pp.79, 84, 92 and 95 were inspected, especially the easily lost `≠` and Greek locus names. Targeted preprint and author-copy comparisons are recorded in both files' `sourceVersions`; this does not claim a new complete reading of either copy. The earlier complete published reading remains attributed to PR2016 and the completed independent paper review. Page extraction used per-PDF-page arrays: literal form-feed characters also occur inside mathematical text, so splitting extracted text on that character does not reliably recover pages.

The author publication list, journal article record, arXiv version history, Crossref update metadata and exact-title correction searches yielded no correction for these passages. This is a bounded search. Some fresh prerequisite DOI metadata requests returned HTTP 429; those links retain the red team's independently verified identifiers, with that attribution. No failed metadata request is reported as a source reading.

Reviewed coverage audits for SF.2/SF.6 distinguish existing sheaf/derived carriers from absent comparison theorems. The relevant accepted extractions were reread for their statements and routing, including Kings–Sprang, Landesman–Litt, Benoist–Wittenberg, Česnavičius, Česnavičius–Scholze and Schröer. The active Part II co-proposers were recomputed through `accepted_routes`; Esnault–Groechenig's ID is **PAPER-ESNAULT-GROECHENIG-20**, and Heuer's is **PAPER-HEUER-25**.

Declaration statements were read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`:

| Supporting declaration | Pinned source |
| --- | --- |
| `RingPreordering`, `RingPreordering.IsOrdering` | `Mathlib/Algebra/Order/Ring/Ordering/Defs.lean`, lines 47, 193 |
| `IsFormallyReal`, `IsSemireal`, `IsRealClosed` | `Mathlib/Algebra/Ring/IsFormallyReal.lean:104`, `Algebra/Ring/Semireal/Defs.lean:38`, `FieldTheory/IsRealClosed/Basic.lean:48` |
| `groupCohomology.coindIso` | `Mathlib/RepresentationTheory/Homological/GroupCohomology/Shapiro.lean:59` |
| `isZero_groupCohomology_succ_of_subsingleton` (root namespace) | `Mathlib/RepresentationTheory/Homological/GroupCohomology/Basic.lean:218` |
| `Rep.indCoindIso` | `Mathlib/RepresentationTheory/FiniteIndex.lean:178` |
| `Equiv.Perm.sign` | `Mathlib/GroupTheory/Perm/Sign.lean:357` |
| `QuadraticForm.not_anisotropic_baseChange` | `TauCeti/LinearAlgebra/QuadraticForm/BaseChange.lean:312` |

The last four supporting inputs do not turn items 97, 101 or 106 into implemented theorems. In particular, the regular-representation/induction adapter still has to be built. Mathlib's ordering and real-closed predicates do not themselves construct an algebraic real closure at an ordering.

## Mathematical corrections and limits

**Real evaluation and parity.** The source uses `Θ={x:α_x≠0}` and `Θ⊂Ψ`. For period two the degree-zero component is 1 on Θ and 0 on Ψ∖Θ. The printed calculation can therefore fail on Ψ∖Θ when the covering class has nonzero first component there. In the main induction, `a=(n/2)α` has constant evaluation `t=n/2 mod 2` on Ψ=Θ(α). Both t=1 and t=0 are required. Nonconstant evaluation alone does not prove a nonzero residual, and no counterexample to the unrestricted propositions is claimed.

**The transported class.** Before deforming a fibre, subtract an extended Picard class so `β mod 2=p*α̃` on its unramified open, then apply the trace adjustment to that normalized representative. A trivialization of the compact fibre alone does not preserve the open complement or that equation. Item 202 requires transport of `(T,p⁻¹R)` and the pullback square. The missing relative-pair verification is **G13/E21**. [Mather, Proposition 11.1](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/matherj.pdf#page=142) supplies the ordinary stratified-isotopy theorem under properness and stratumwise submersion; its statement and short proof were read. Invariant control data, the C2 refinement and the specific family hypotheses still need verification. This is a concrete construction obligation; it is not claimed discharged by naming that theorem.

**Divisors and ramification.** The p.80 proof must include the smooth incidence-model P1 fibres over R∩D as well as resolution-exceptional P1 curves over Sing R. Both use the Gersten/Witt argument, and Witt must permit a ramified class on the transverse curve. For Lemma 6.4, the printed divisor choice has order `1+1=2` along R in the target-line trivialization, creating an unwanted double component. A signed real divisor H−R gives `−1+1=0`; its other poles can be cleared away from the real locus. Item 83 and E22 state this repair. Proposition 5.5 separately needs an ample A0 with `H¹(R,A0|R)=0`; very ampleness alone fails, for example on a plane quartic with `O_R(1)=K_R`.

**Circle stalks and Enriques points.** For n=2, the stalk presentation is `(Z/2⊕Z)/⟨(1,2)⟩≅Z/4`. In general it is Z/4 for n≡2 mod 4 and F2² for 4|n; the fibre over 1 still has two points. The Enriques half detector requires S(R) nonempty. With empty real locus, all three nonzero degree-one Kummer classes restrict to zero and its uniqueness claim would fail.

The unrestricted evaluation gaps G4a/G4b, the precise unread Jannsen contract G10, and pair transport G13 remain explicit. The inventory is complete as a paper extraction with recorded gaps; no unconditional proof of these repairs is asserted. Historical G11 demands for recursive proof extraction have been removed from proof-spine gates, in accordance with §16.

## One disposition for every finding

Numbers refer to `RT-PAPER-BENOIST-19/<n>`. “Applied” includes a requested source-gap record or an exact maintainer handoff when the affected file is outside this issue.

| Finding | Disposition and evidence in this submission |
| --- | --- |
| 1 | Applied. Routes 5–9 name their parent-grouped DESIGN identities, accepted co-proposers and mandatory supplier tranches. Queue changes are specified below. |
| 2 | Applied with the verifier's correction. Betti Kummer 33/55 → SF.6; topological Brauer 34/56 and cycle compatibility 148 → MC.2. Topology imports only early SF.2 carriers. Also removed unnecessary 55/56 edges from the purely cohomological item 158. |
| 3 | Applied. Item 141 allows ramification and uses Euclidean-dense unramified real evaluations; 64 depends on 141, which precedes it in the proof spine. |
| 4 | Applied. Item 75 requires H¹(R,A0|R)=0; 78 imports this hypothesis. A0 is distinct from the later A. |
| 5 | Applied. Items 85/87/166 and new 201/202 specify compatible lifts and pair transport; E21/G13 records the outstanding geometric verification. |
| 6 | Applied. Item 107 has the correct n mod 4 stalks and the n=2 presentation test. |
| 7 | Applied. Corrected Θ, Ψ and half-period parity in the reader, review correction note and active E3/E4 reasoning. Earlier review explanations are retained only as attributed history. |
| 8 | Applied. Both JSON files have the same 24 records by ID. E7/E8 are misprint/nothing; E10 uses the same w′ repair; E13 avoids zeros and poles at both points. Existing independent verdicts are adopted, not invented. Register deduplication is handed off below. |
| 9 | Applied. E22 and item 83 record the extra 2R and the H−R correction. |
| 10 | Applied. E20 and item 64 include P1 fibres over R∩D; E1's downstream-safety explanation is qualified. |
| 11 | Applied. Item 118 requires S(R)≠∅ and explains the empty-locus countercase. |
| 12 | Applied. Item 15 restricts the indicator formula to n=2 and gives the even-n reduced formula, with a dependency on 55. |
| 13 | Applied. New 188 gives the norm bound over every real closed base; 20/22/92/110/115/128 depend on it. |
| 14 | Applied. Item 16 and route 9 separate the owned unramified complex proof, characteristic-zero cited reduction, and broader context. Lieblich 17 is statement-only context. |
| 15 | Applied. New 189 cites Artin comparison and reuses Landesman–Litt/116(2) at IG.0/IG.1 (new route 12); 33/148 depend on it. |
| 16 | Applied. Route 8 is the common C_i/Tsen–Lang owner, including C1→Br=0. Schröer/206 coordination is handed off. |
| 17 | Applied. Route 9 names all four proposed tranches, actual queue IDs and DESIGN dependencies. |
| 18 | Rejected by verifier; unapplied. Item 151 and route 10 retain ShimuraData:D3. |
| 19 | Rejected by verifier; unapplied. Generic Hodge ownership coalesces in the existing parent group; no new Kodaira–Spencer owner is invented. |
| 20 | Applied. Item 91 moves to MC.2 and points to BW20/divisor-torsionfree; 90/135 stay MC.7. |
| 21 | Rejected by verifier; unapplied. Item 138 retains R09.1/A0-extension. |
| 22 | Rejected by verifier; unapplied. Ordinary Lefschetz 133 and Andreotti–Frankel 134 remain distinct from BW20's equivariant theorem. |
| 23 | Applied. Item 87 imports Landesman–Litt/135; only C2/stratified refinements are added here. Other owners are listed below. |
| 24 | Applied. Item 40 imports Kings–Sprang/026, requesting the C2 extension of /030 without pretending its free-abelian EΓ formula applies. 89 uses the imported spectral sequence; 195 separates the Ext-stalk refinement. |
| 25 | Applied. Item 113 is a BW20 localization/self-duality reference; the surface computation remains 112 on route 9. |
| 26 | Applied with the verifier's cycle guard. Item 148 contains only Kummer, product and cycle-class compatibility on the imported comparison and is placed at MC.2 after SF.6. |
| 27 | Applied. Item 114 imports Schröer/26,/28 and requests the characteristic-zero equivalence from that owner. 115/118 use BW20/enriques-pic. |
| 28 | Applied. 27/28/29/97 moved from route 8 to application route 9; no field-foundation prerequisite points back to the application. |
| 29 | Applied. 59/70/99/100/106 have generic hypotheses; 74/86/107 are on route 9. Also made 37/38/89 generic and separated application commentary from 142/143. |
| 30 | Applied. New library carriers 190, consumer-only realClosureAt interface 191 and Harrison input 192 feed 14/94/95/96. Upstream existence is imported, with the pending atlas refresh recorded. |
| 31 | Applied. Added Griffiths 193, Bredon 194, Ext stalk 195, BCR 196, Bröcker 197 and Harrison/Arason 192. Imported existing BW20 purity/pushforward/norm inputs and Česnavičius–Scholze/050 instead of duplicating them. |
| 32 | Applied. Replaced unrelated Benoist-PDF links with the cited work's DOI or full bibliographic citation, retaining all bundled works and metadata-read limits. |
| 33 | Applied. Added the missing bibliographic entries; Mangolte–van Hamel Thm1.1 is located on p.106. Already-owned Krasnov/Tohoku/SGA inputs are cross-referenced. |
| 34 | Applied. E19 is withdrawn using the existing independent errata rejection. Scaling the anti-invariant identification gives (1,rg) with g unchanged. |
| 35 | Applied. Matching top-level sourceVersions in both JSON files give date, URL, hash and actual targeted-reading scope. |
| 36 | Applied. E23 records the restricted pushforward vanishing; 165 explicitly lands on U and restricts to Ψ. |
| 37 | Applied. E24 and item 84 replace the stray Θ with Ψ=S(R)∖Ξ. |
| 38 | Rejected as already covered by E13; no duplicate source finding. The authorized /8 reconciliation supplies the complete E13 repair. |
| 39 | Applied. Corrected locators for 70 and 75–78,83–84. |
| 40 | Applied. Corrected locators for 17,20–22,24,31,38,39,114 and Conjecture 0.9. |
| 41 | Applied. Item 72 uses the normal sequence and vanishings; the extension/cup-injectivity argument belongs to 73. |
| 42 | Applied. Item 57 requires D disjoint from Sing R; item 59 vanishes only in degrees ≥2 and retains R¹. |
| 43 | Applied. Item 93 extends the half-period lift across the larger unramified open using Picard surjectivity and justifies Θ(a)⊂Θ(α). |
| 44 | Applied. Item 26 states the finitely generated function-field Tsen–Lang theorem. |
| 45 | Applied. Item 52 gives the even/odd stabilizer criterion for the real image of a double cover; item 160 retains the odd-action specialization. |
| 46 | Applied. Direct dependencies 162→64 and 166→64 added. |
| 47 | Applied. Item 128 allows any integral power of the positive Puiseux parameter; the exponent need not be positive. |
| 48 | Applied. Kahn 198 at MC.2 and degree-one Kummer 199 at SF.6 feed 118. |
| 49 | Applied. Item 124 defines the Puiseux field and IsRealClosed instance, importing BW20 semialgebraic cohomology and LD.6 geometry. |
| 50 | Applied with the verifier's base-field caution. Item 141 links its R specialization with BW20/witt-curve, retaining the latter's arbitrary-real-closed-base generality. |
| 51 | Applied. Item 136 names R09.7 first, specifically R09.7c/d; SF.4 is secondary. Cross-extraction ownership split handed off below. |
| 52 | Applied. Item 144 retains duality/UCT only; missing transverse-loop input 200 feeds 80/82/106/110. |
| 53 | Applied with exact namespaces. Pinned supporting declarations recorded for 97/101/106; statuses remain missing. |
| 54 | Applied with the verifier's scope correction. Removed the already-registered BW20 prerequisite; marked Lam/Brown/BBD/Voisin as already referenced while preserving uncovered co-cited works and exact locators. |
| 55 | Applied with the verifier's corrected supplier. Route 7 names the external PR196 complex-analytification layers and separately C0 coherent modules. |
| 56 | Applied. Routes 5–9 name imports by title and ID, including R03.3 normality, StableReduction Layer 4 blowups, SF.1 Stein factorization, ordinary topology and QFI 7B. |
| 57 | Applied. Route 9 states all hypotheses and conclusions of 0.3,0.6,0.13 and Proposition 0.7, including H¹(S(K),F2)=0. |
| 58 | Applied. The Jannsen prerequisite now says item 149 is routed to topology with G10, not unrouted. |
| 59 | Applied. Jannsen-16 is pending while its overall verdict is revise; route 8 imports the accepted Dittmann–Pop higher-Pfister tranche. |
| 60 | Applied. Route 1 and 09/10 name Česnavičius-19's existing Brauer/purity/residue/Kummer core and the two specific additions. |

## Maintainer actions outside these five deliverables

These are concrete integration instructions, not unperformed edits to files this issue permits changing.

1. **Queue generation (`make_queue.py`).** `paper_designs` currently groups all Part II calls by parent and tells the worker to choose the first independent direction and defer the rest. For AlgebraicTopologyPartII, HodgeStructuresPartII, QuadraticFormInvariantsPartII and SemisimpleAlgebrasPartII, include every accepted tranche needed by RealSurfacePeriodIndex in the job. Either preserve the combined parent job with explicit required subtranches, or split by `(parent, proposed roadmap)` and resolve overlapping generic interfaces before generation. Set `DESIGN-RealSurfacePeriodIndex.after` to the four corresponding DESIGN jobs (and retain their normal independent reviews). The present brief now names the same jobs, rather than relying on proposed IDs that the queue does not use.
2. **New route reviews.** `accepted_routes` enumerates existing review positions. Routes 1–10 stay at their old positions. The independent fix/paper-review integration must explicitly accept or reject new routes 11 and 12 before those source additions enter the queue; editing the old review JSON is outside this fix. Do not infer acceptance from this worker's report.
3. **Errata generation (`scripts/errata.py`, `research/errata/REGISTER.md`).** `collect` appends paper and errata copies without deduplicating IDs, and validates reviews against the files each review job wrote. Group by finding ID, preserve provenance, and prefer a valid finished independent review over an unreviewed duplicate. The canonical E19 verdict is the existing `REV-ERRATA` rejection; E16 is also rejected. E20–E24 await independent review. After deduplication, regenerate the register; do not hand-edit the generated register or count identical records twice. A copied `REV-ERRATA` verdict in the paper file does not automatically become valid for that file under `valid_reviews`.
4. **Other extractions.** BW20's early equivariant carrier should import Kings–Sprang SF.2, and its late étale-comparison block must not become a prerequisite of the topology tranche; cycle compatibility follows MC.2. Schröer/206 should import the common C_i/Tsen–Lang owner while retaining Picard descent. Schröer's Enriques owner should export the characteristic-zero definition equivalence required by 114; BW20/enriques-pic supplies the torsion facts. Gao–Habegger/26 and the AbelianSchemes A5 Ehresmann import should reuse Landesman–Litt/135; the C2 refinement remains here. The BKT analytic-carrier wording should distinguish PR196 Layers 0–2 from ComplexComparisonPartII:C0. Reconcile SF.4-only resolution pointers in BW20 and Harpaz–Wittenberg-20/23 with R09.7c/d. These files were not edited.
5. **Upstream note.** `tauceti:TauCetiRoadmap/RealAlgebraicGeometry` Layer 1 already plans ordered real-closure existence and ordering conversion in `data/tauceti-new-roadmaps.json`; it is not in the assembled atlas. Refresh the atlas before adding a checker-recognized `planned` stage reference. Item 191 packages the consumer interface and records the pending external supplier. No upstream roadmap or link between two upstream roadmaps is changed here.

## Validation

- `scripts/check_paper.py` and `scripts/check_errata.py`: pass.
- `check_errata.versions_checked` on both JSON files: pass; active source records agree exactly.
- Intake on the five authorized deliverables and `git diff --check`: pass.
- All inherited IDs/statuses and pinned baseline records preserved; rejected-finding guards leave 133/134/138/151 unchanged. All definition/construction interfaces have API/test outlines, apart from the two inherited explicitly statement-only conjectures.
- All 175 missing items occur in exactly one route. All external item IDs resolve. The explicit graph has **198 internal and 49 external dependencies**, with no internal cycle or late-comparison/application back-edge into the early SF.2, Brauer, topology, Hodge or quadratic-form tranches. The assembled graph already has SF.6→MC.2 and no reverse path.
- **218 finite diagnostics** checked half-period parity, circle-stalk presentations and their two-point fibres, the rational w′ identity, and the divisor-order distinction. These are examples/algebraic checks, not proofs of the geometric suppliers or G13.
- No Lean file is requested. No compilation was attempted: no existing build matching both pinned commits was available, and WORKERS forbids building or downloading a new one.

The five source records newly added here remain unreviewed. The remaining mathematical obligations and out-of-scope integration steps are visible in the extraction, this report and the reader; passing structural checks does not discharge them.
