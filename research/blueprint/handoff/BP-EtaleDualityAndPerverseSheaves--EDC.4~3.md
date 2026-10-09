# EDC.4–EDC.8: revision three

Job [#7558](https://github.com/CBirkbeck/tauceti-explorer/issues/7558), `BP-EtaleDualityAndPerverseSheaves--EDC.4~3`. Worker: Codex — codex-BONvP3, 2026-10-09.

This is a completed revision pass, submitted for independent review. The packet has status `complete`; EDC.4, EDC.5, EDC.6, EDC.7 and EDC.8 each have coverage `planned`. No stage is closed. All 117 incoming node IDs, accepted mathematics and unchecked implementation statuses are retained. The previous `review` object is unchanged, including its serialization; its negative verdict concerns revision two and must be replaced by the next independent reviewer. Historical dispositions are kept in the packet and review report; their paragraphs are removed from the reader so its mathematical statements stand on their own.

## What changed

The three defects identified in [the round-two report](../reviews/REV-EtaleDualityAndPerverseSheaves--EDC.4~2.md) now have corrected planning interfaces and discriminating examples. Their local gap records have been removed; the seven inherited gaps remain. This records completed statement design, not mathematical proofs or independent acceptance.

1. **Ambient coefficient operations.** Tensor, internal Hom and quotient-to-quotient reduction now land in the ambient unbounded derived category. Tor amplitude quantifies over every object of its native degree-zero heart. A bounded restriction requires a bounded-constructible essential-image witness, with a realization isomorphism; tensor and RHom receipts use actual finite-Tor source input. Normalized systems have ambient reduction isomorphisms with identity and triple coherence, uniform ordinary and Tor bounds, and common strata. Integral reduction and analytic comparison retain their ambient realization identities. Exterior products and trace evaluation use this same boundary.

   The ambient carrier is the native derived category of the coefficient-module sheaves supplied by EDC.0/SF.2. Finite torsion coefficients are identified with native ordinary small-étale module sheaves by a t-exact equivalence compatible with realization. Integral/rational coefficients use pro-étale modules over the completed coefficient sheaf, rather than ordinary étale constant-O sheaves (Bhatt–Scholze 6.8.1–6.8.2, p.58; Remark 6.8.15, p.62). This is a constraint on an existing supplier, not a new owner or competing category. Bounded duality on unrestricted Dbc has explicit finite-field, DVR, DVR-quotient and rational-adic coefficient regimes. Dbc still contains every finite module at a point. The new Z/ell² residue-module example has nonzero ambient Tor and Ext in arbitrarily large degrees and fails the finite-Tor predicate.

2. **Transition-compatible descent.** The datum exposes local objects, double-overlap transition isomorphisms, diagonal identity and the triple cocycle on native fibre products. The conclusion supplies global pullback identifications intertwining precisely those transitions. The new example recovers an input transition from a compatible trivialization. The proof still uses the conditional BBD 3.2.4 supplier: common bounds and negative-Ext vanishing, supplied for perverse components by a finite cover refinement and heart orthogonality.

3. **General named targets.** `perverse_recollement_five_term` gives both general sequences of BBD 1.4.19, p.52, for an arbitrary perverse K and complementary open/closed immersions. Its middle maps are the actual perverse cohomology maps of the adjunction counit and unit; the closed terms have degrees (-1,0) of i* and (0,1) of i!. There is no affine assumption or amplitude-one claim. The affine extension-comparison result remains separately named. A surface-to-point example detects degrees -2 and +2.

   `semismall_pushforward_perverse` acts on arbitrary source-stratum-adapted perverse inputs. It displays smooth locally closed strata, étale local product charts preserving the projection, and the dimension inequality for each source-stratum fibre intersection. A source stratum may cross target strata. The smooth-source constant-field result remains separately named. MV 4.3, pp.14–15 is a complex-topological model; the scheme statement is explicitly the proper-base-change and compact-support dimension argument, with its SF.2 inputs. Integral cosupport uses the costalk/adjunction argument retaining Ext-one, not integral p-self-duality.

These changes affect thirteen mathematical node records. Three additional normalized-system API records have the corrected Bhatt–Scholze source label: Theorem 6.7.1 and Lemma 6.7.2. The packet and reader agree on all statements, APIs, tests and active names.

## Checks of the reviewer's in-place corrections

The finite perverse branch remains a finite field; the separate DVR-quotient branch retains nonperfect point modules. The actual fibre-product projections still satisfy native `IsPullback`. Quasi-finite affine t-exactness and the two one-sided residue-reduction statements are retained. Conditional derived descent is retained and its missing compatibility is repaired above. The general-field simple-curve acceptance case, graph L/M direction, equal outer maps in self-correspondence trace pushforward, and zero-dimensional small-map boundary step are retained.

The categorical primitive split uses the kernel/section argument from hard Lefschetz 5.4.10, p.144, rather than local invariant cycles 5.4.9. The weight-flag construction keeps its finite-length and strict-weight Ext inputs. Relative hard Lefschetz keeps the universal-hyperplane argument, smooth full faithfulness, amplitude and arbitrary-K projective-bundle formula, proper base change and projection formula (BBD 5.4.11–5.4.15, pp.145–147). Constructible Hochschild–Serre keeps the adjacent coinvariant/invariant terms of 5.1.2.5, p.124 and its precise SF.2 request. SGA 4 XIV Corollaire 3.2 remains at printed p.160. Baseline contributions keep the positive-degree and admissibility hypotheses corrected by the reviewer.

The accepted RS-19 ownership boundaries and handed red-team dispositions are retained. Stack and perfect/equivariant transport remain Part II proposals; absolute scheme perversity does not provide relative perversity or ULA. EDC.5 supplies the Satake perversity input, and the proposed L1/L3 links and removal of unsupported D_lis edges remain orchestrator work. No atlas, other owner's packet, upstream roadmap or historical review was edited.

## Validation and inventory

There are 117 nodes: 46 theorems, 48 lemmas, ten constructions, ten definitions, two comparisons and one application. They carry 128 API items, 74 definition/construction unit tests and thirteen other named tests, for 87 active test examples. There are 21 planets (EDC.4: 3; EDC.5: 6; EDC.6: 2; EDC.7: 6; EDC.8: 4), eleven baseline declarations, twenty inherited public source copies, seventeen requests and seven gaps.

- `python3 scripts/check_blueprint.py research/blueprint/packets/EtaleDualityAndPerverseSheaves--EDC.4.json`: zero errors and zero warnings.
- The suggested file elaborated with `lean-check`, with only admitted-proof warnings. A separate scratch audit elaborated the same source with 326 unique packet declaration/API names checked by Lean. Every required test marker is present, and each packet statement, API statement and test statement occurs in the reader. All original IDs and the previous review were checked unchanged.
- All eleven baseline declarations and surrounding hypotheses were reread at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. The reviewed layer audit still reports missing target theories and partial native t-structure foundations. The Tau Ceti baseline remains `f790474821cf4256814db967cb154e7af3d0c369`. The shared build has another Tau Ceti head, but the suggested file imports only individual Mathlib modules at the exact pin; no Tau Ceti declaration contributes to elaboration.
- `git diff --check` passes. Validation does not prove the admitted mathematics or implementation of the supplier interfaces.

## What remains

| Stage | Coverage | Remaining work |
| --- | --- | --- |
| EDC.4 | planned | Existing-owner geometric bridges for ample sections, projective bundles and blow-ups. |
| EDC.5 | planned | Requested conditional descent and constructible formalism; separately owned stack, perfect/equivariant and relative-perverse/ULA extensions. |
| EDC.6 | planned | Euler characteristic of complete intersections; strong c* duality transport; normalized constructible and analytic orientation suppliers. |
| EDC.7 | planned | Broader coefficient descent; good restricted models, origin witnesses and constructible Hochschild–Serre suppliers. |
| EDC.8 | planned | Scheme targets are planned; stack and perfect-scheme local terms need the recorded Part II transports. |

The seven explicit gaps are stack sheaf theory; perfect/equivariant theory and hyperbolic localization; relative scheme perversity/ULA; general-base nearby cycles and boundary machinery; complete-intersection Euler characteristic; strong exceptional-pullback/duality transport to diamonds; and coefficient descent beyond BBD's chosen complex/Qbar-ell comparison. Their detailed consumers and ownership proposals remain in the packet.

The seventeen existing supplier requests are retained, with the coefficient-category and descent constraints strengthened in place:

1. SF.2: support-sensitive affine Artin vanishing and geometric finiteness.
2. SF.2: proper base change, compact-support base change and projection formula, including the arbitrary-K projective-bundle split.
3. SF.2: normalized bounded constructible adic formalism, correct coefficient-sheaf carrier, ambient operations and qualified bounded restrictions.
4. SF.2: smooth/proper and generic base change, with spreading out.
5. SF.2: algebraic/analytic comparison and positive Kummer/exponential orientation, with ambient-operation comparisons.
6. SF.2: topological invariance and geometric constructible finiteness.
7. SF.0: smooth-centre blow-up and exceptional normal-bundle geometry.
8. SF.0: affine ample-section complements and Veronese embeddings.
9. SF.0: universal smooth complete-intersection parameter family.
10. SF.0: native common-base geometry, strata, dimensions and actual fibre-product universal properties.
11. SF.3: bridge to the existing line-bundle carrier, sections and chosen projective embeddings.
12. SF.5: vector bundles, line-parametrizing projective bundles and normal-bundle geometry.
13. SF.2: BBD good models and restricted trait/fibre categories with their qualified exactness.
14. SF.2: actual geometric-origin spreading witnesses, without assuming their purity conclusion.
15. L3: strong exceptional-pullback/internal-Hom essential-image and counit results for diamond transport.
16. SF.2: ordinary-derived descent with common bounds, negative Ext, native transitions and compatible trivializations.
17. SF.2: constructible derived-Hom Hochschild–Serre over a finite field.

The next action is an independent review of these repaired signatures and their mathematical supplier boundaries. Closing a stage requires resolving its recorded gaps and requests; no replacement stage or second job was claimed in this run.

## Source provenance

Revision three fetched five public PDFs and matched the incoming SHA-256 hashes. Selected reading, in this run:

- BBD: 1.4.16–1.4.19, pp.51–53; 2.2.14, p.71; 3.2.2–3.2.5, pp.86–87; 3.2.17–3.2.18 and proof completion, pp.95–97; 5.1.2.3–5.1.2.5, pp.123–124; 5.4.10–5.4.15, pp.144–147.
- Mirković–Vilonen, arXiv v5: §4, definition preceding Lemma 4.3 and Lemmas 4.3–4.4, pp.14–15.
- Bhatt–Scholze, arXiv v2: Proposition 6.6.11, p.54; Theorem 6.7.1 and subsequent results 6.7.2–6.7.21, pp.55–58; 6.8.1–6.8.2, p.58; 6.8.11–6.8.15, pp.61–62.
- Varshavsky's Lefschetz–Verdier paper, arXiv v2: 1.1.1–1.2.6, pp.6–10.
- SGA 4 XIV: Théorème 3.1 and Corollaire 3.2, printed pp.159–160; the margin pagination confirms the latter at p.160.

The reader and packet retain earlier reading receipts for other locations, without claiming a fresh reading of all twenty sources. Public URLs and hashes are in their source records. Huber and Faltings–Chai were neither read nor fetched; the H5 comparison is an existing-owner import. No private library copy was used. AdicSpaces and AnalyticToricGeometry were read for upstream density and ownership. Source statements and this handoff are in the worker's own words; no source passage or section-by-section digest is included.
