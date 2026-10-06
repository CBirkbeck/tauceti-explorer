# Independent review: PrismaticCohomology PR.8

**Verdict: needs_changes. Review complete; do not promote this packet.**

Job `REV-PrismaticCohomology--PR.8`, issue #476. Reviewer: Codex, session `codex-h3vyiy`, 6 October 2026. The original writer was Claude, session `claude-DAYn2t` (PR #6677); this session did none of that work. This is a completed independent review, not a checkpoint of an unfinished review.

The packet has substantial target-level coverage of Koshikawa I and Koshikawa–Yao II, but its original completion claim cannot stand. Clear corrections have been applied in the packet and suggested file. The Laurent equivalences require the full text of a published corrigendum, some proof inputs exceed their suppliers’ stated ranges, and most suggested names are documentation rather than Lean signatures/examples. The packet and PR.8 coverage are now `partial`, with explicit remaining work. The review itself is complete.

## Counts and scope

| Item | Result |
|---|---|
| Nodes | 76: 18 definitions, 14 constructions, 8 lemmas, 35 theorems, 1 application |
| Per-node findings | 41 verified; 22 corrected; 13 unverifiable |
| Nodes added or removed | 0; this is target-level review, so proof interiors were not split into lemma nodes |
| API / tests | 202 API items (2 added), 130 tests; all 32 definition/construction nodes have at least 3 tests |
| Suggested file | Originally 38 typed API/test forms of 330; now 40 of 332, with 292 still only comments |
| Planets | 6; unchanged, all short mathematical noun phrases |
| Baseline | 14 names confirmed; no name removed; `PreTilt` provision corrected |
| Requests / gaps | 18 / 5, from 15 / 2; precise added requests and explicit unresolved issues |
| Source findings | Original 5 independently confirmed; 4 added, all with review reasons |

“Verified” in the node table means the cited statement, hypotheses and target-level sketch were checked in the identified public source range. It does **not** certify that missing Lean signatures exist, that an unimplemented supplier has been formalised, or that downstream recorded gaps have been discharged. The file-wide §13 failure applies even to source-verified nodes. Entries marked unverifiable identify a particular source-version or proof-interface problem; they are not accepted by substituting a broad supplier label.

All stated PR.8 targets were screened: δ_log algebra and envelopes; relative/absolute sites and derived log theory; Hodge–Tate/base change/crystalline/de Rham comparisons; Nygaard/Lη/Frobenius; log diamonds and Kummer comparisons; Laurent coefficients and BKF; the semistable application. The last family has provisional source or dependency issues, so the stage is partial. Target-level granularity is appropriate; no demand for a full lemma-level source extraction has been added.

## Source versions and access

The three original PDFs were independently obtained and their SHA256 hashes agree with the packet:

- [Koshikawa I, arXiv:2007.14037v3](https://arxiv.org/pdf/2007.14037v3), 15 September 2022, 64 pages.
- [Koshikawa–Yao II, arXiv:2306.00364v1](https://arxiv.org/pdf/2306.00364v1), 1 June 2023, 98 pages.
- [Kato II, arXiv:1905.10678](https://arxiv.org/pdf/1905.10678), PDF dated 1 October 2019.

The original nodes’ locators/excerpts were compared with these texts at target level. Mathematical overbars and diagram labels were checked visually where text extraction loses them. The erroneous omitted bars in Lemma 4.12 were a packet transcription error, not an error in Koshikawa’s displayed PDF formula. Full proof-interior decomposition of the packet’s listed follow-up lemmas is not claimed.

Two additional readable primary sources were used for independent corrections: [Ogus’s 2006 draft](https://math.colorado.edu/~casa/seminars/reading/logG/papers/oguslogbook.pdf), Proposition I.4.3.17(1), and [Česnavičius–Koshikawa v3](https://arxiv.org/pdf/1710.06145v3), §6.7 and Proposition 6.8. Their hashes and read ranges are recorded. The draft’s numbering differs from the 2018 Ogus book; the exactness-descent statement, not a guessed book number, supplies the evidence.

KY was published as Advances in Mathematics 479 (2025), 110446, [DOI 10.1016/j.aim.2025.110446](https://doi.org/10.1016/j.aim.2025.110446). A [2026 corrigendum by Inoue–Koshikawa–Yao](https://doi.org/10.1016/j.aim.2026.111223) says it corrects published Theorems 7.35 and 7.36. The [authors’ institutional record](https://keio.elsevierpure.com/en/publications/corrigendum-to-logarithmic-prismatic-cohomology-ii-adv-math-479-2/) confirms this scope. Publisher PDF requests returned HTTP 403; the Elsevier full-text API required an API key; public author-page/arXiv searches did not yield the corrected statements. Only metadata/abstracts were read. **No corrected hypotheses, counterexample to the equivalences, or numbering correspondence with preprint 7.36–7.37 is invented here.** Node 71 is unverifiable; node 72 must be rechecked when the correction is available. This is recorded in `sourceVersions`, `sourceIssues` and a gap.

## Corrections applied

Every node-level correction is also identified in the table below. Suggested documentation was updated wherever it repeated the corrected statement. These are the material changes:

1. **δ_log algebra (nodes 1, 6, 7):** the free example needs the variables y₀,y₁,…; the groupification map uniquely extends the original δ_log; exactification gives an integral map M_B → M′, not a nonexistent canonical N → M′; its ring construction is algebraic before completion. Added `DeltaLogRing.ext` and `DeltaLogRing.Hom.ext` as actual typed API. The exactification test now states the full preimage characterization instead of merely inclusion of M.
2. **Sites and Hodge–Tate (18, 20, 21, 23, 25):** forgetting logs still gives an ordinary prism object, though cohomology changes; absolute fibre products need log envelopes; presentation-compatible base change is distinct from the strictly functorial all-elements choice. Lemma 4.12 concerns Δ̄ ⊗̂^L_R S ≅ Δ̄_S, not Δ ⊗̂^L_R S. Non-log differential compatibility is along a canonical map, not a presumed inclusion.
3. **Crystalline/q-crystalline (30, 36, 37, 40):** a rank-one affine-line lift is not generally weakly final; the free δ_log PD envelope is needed. Expanded all envelope hypotheses of Lemma 7.4. A q-PD ideal contains the base q-PD ideal and need not contain [p]_q; J=(ξ) in A_inf is the distinguishing case. Imported AI.1’s existing commuting-endomorphism Koszul interface.
4. **Period/Breuil–Kisin (42, 43):** repaired the intended B_dR⁺ diagram using ČK Proposition 6.8. The first period comparison map becomes an isomorphism over B_dR; it is not asserted one over B_dR⁺. The middle qCRYS base is A_inf before tensoring with A_crys. Frobenius isogeny now has node 58 as a direct dependency.
5. **Derived/Nygaard (45, 47, 51, 55):** clarified the log cotangent criterion, fixed the tautological chart sentence, restored integral M_A in descent, and stated i≥0 in the periodicity formula.
6. **Kummer/log diamonds (59, 62, 64, 65, 66, 69, 71):** added positive/nontrivial index conditions. Saturation is terminal for maps from saturated objects to Y. Component splitting is stated after a geometric base change with roots of unity. Zero-valued positive generators give the intended Q≥0 and N characteristic monoids; p-valued charts on Ô=C are trivial. Replaced unrestricted two-out-of-three by the source’s cancellation direction. A finite-cover pushforward has rank n; a root torsor is not a rank-one linear local system. The power-tower theorem needs torsion-free P^gp, with a concrete excluded case below.
7. **Coverage and registers:** added the missing version/corrigendum evidence, 3 explicit supplier requests, 3 gaps, all 76 review entries and the partial-coverage worklist. Existing pending proof refinements remain; no claim of full source decomposition or formalisation is made.

The power-tower defect deserves an explicit check. For the fs group monoid P=ℤ/2ℤ and n=2, take Q=P^{1/2} in the preprint’s notation. The ring Q_p⟨P⟩ is Q_p[t]/(t²−1)≅Q_p×Q_p. The ring map induced by the power map sends t to t²=1, so the diamond map misses the t=−1 component. Since all chart elements are units, both associated log structures are trivial, and log saturation does not supply the missing component. Thus the asserted general-fs cover is not surjective. Sharp fs P has torsion-free group completion and the written proof works there; the packet retains the torsion-free range for the power towers and chart-local general-fs site statements. The fully general printed power-tower statement is not silently accepted.

## Source-issue decisions

| Finding | Decision and reach |
|---|---|
| E8.1 | Confirmed: KY footnote says Corollary 7.30; the actual item is Theorem 7.30. Bibliographic only. |
| E8.2 | Confirmed: topoi morphism is K1 Remark 4.5, not 4.4. Bibliographic only. |
| E8.3 | Confirmed: smooth cotangent input is K1 Proposition 5.1, not Proposition 6.1. Bibliographic only. |
| E8.4 | Confirmed: chart of M_Y, not M_X, in KY Definition 7.4. Variable slip only. |
| E8.5 | Confirmed: K1 Remark A.1 needs Lemma A.9; A.8 is a definition. Bibliographic only. |
| E8.6 | Added/confirmed: M_B → M′ is the integral map in K1 Remark 2.18. Affects the proof. |
| E8.7 | Added/confirmed: K1 Theorem 8.5 diagram coefficients and period isomorphism label. Affects the stated diagram. |
| E8.8 | Added: known published correction to the Laurent equivalences. Confirmed existence/advertised scope; full corrected mathematics unavailable. Affects stated results; content remains a gap. |
| E8.9 | Added/confirmed: torsion units invalidate general-fs power-tower surjectivity in KY Proposition 7.22. Affects the stated result. |

All nine entries carry the required `review` verdict, reason and reviewer. The first five decisions are scoped to the cited preprints; they do not assert the same misprints remain in the published article. The search for prior correction and the known corrigendum are recorded separately from the independent mathematical arguments.

## Baseline, audit and ownership

Mathlib was checked at the exact pinned commit `082e2d37e8b0463410cdb532e111cd43d5a66174`. Each cited declaration exists under its name and supplies the limited carrier/property described below. None supplies a full prismatic, perfectoid, derived-completion or log-diamond development. The Tau Ceti pin is `f790474821cf4256814db967cb154e7af3d0c369`; there are no Tau Ceti baseline declarations or imports in this file, so no newer Tau Ceti API was used as evidence.

| Declaration | Source at pin | Verified provision |
|---|---|---|
| `MonoidAlgebra` | [Pinned module](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/MonoidAlgebra/Defs.lean) | The monoid algebra R[M] of a monoid over a semiring; used for Z_(p)[M], A[P] and the chart rings A⟨P⟩ before completion. |
| `WittVector.teichmuller` | [Pinned module](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/WittVector/Teichmuller.lean) | The Teichmüller lift R →* 𝕎 R as a monoid homomorphism; it gives the rank-1 prelog structures R♭ → W(R♭) and M♭ → A_inf(R). |
| `Ideal.jacobson` | [Pinned module](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Jacobson/Ideal.lean) | The Jacobson radical (infimum of maximal ideals containing an ideal); the hypothesis p ∈ rad(A) of the monoid Frobenius and of the extension to M^gp. |
| `MvPolynomial` | [Pinned module](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/MvPolynomial/Basic.lean) | Multivariate polynomial rings; the free δ_log-ring on one generator is a polynomial ring on x, δ_log(x), δ^n(δ_log(x)). |
| `Algebra.GrothendieckGroup` | [Pinned module](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/MonoidLocalization/GrothendieckGroup.lean) | The group completion M^gp of a commutative monoid as the localization at ⊤, with of: M →* M^gp injective for cancellative M (of_injective). |
| `TensorProduct` | [Pinned module](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/TensorProduct/Defs.lean) | Tensor products of modules; carrier of A ⊗_{Z_(p)[M]} Z_(p)[N] in the extension of δ_log along M ⊂ N ⊂ M^gp. |
| `PowerSeries` | [Pinned module](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/PowerSeries/Basic.lean) | Formal power series; the ring W(k)[[u]] of the Breuil–Kisin prelog prism. |
| `Perfection` | [Pinned module](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Perfection.lean) | The perfection {f : ℕ → α // f (n+1)^p = f n} of a monoid (with a CommMonoid instance via Perfection.submonoid); it is the tilt M♭ = lim_{m ↦ m^p} M of KY Definition 2.18. |
| `PreTilt` | [Pinned module](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Perfection.lean) | For a commutative ring O, PreTilt O p = Perfection (ModP O p) p, the inverse Frobenius perfection of O/p. This provides the pre-tilt carrier; identifying it with the tilt of a perfectoid ring requires the perfectoid theory of PR.0. |
| `CategoryTheory.GrothendieckTopology` | [Pinned module](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Sites/Grothendieck.lean) | Grothendieck topologies on a category; the étale and flat topologies on log prismatic sites, the Kummer étale and quasisyntomic topologies are instances. |
| `DerivedCategory` | [Pinned module](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Homology/DerivedCategory/Basic.lean) | The derived category of an abelian category (homological complexes up to quasi-isomorphism); a 1-categorical shadow of D(A) in which log prismatic cohomology lives. |
| `CategoryTheory.CosimplicialObject` | [Pinned module](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicTopology/SimplicialObject/Basic.lean) | Cosimplicial objects SimplexCategory ⥤ C; carriers of Čech–Alexander nerves C^• and of the cosimplicial algebras of Appendix B. |
| `KaehlerDifferential` | [Pinned module](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Kaehler/Basic.lean) | Kähler differentials Ω[S⁄R] as the cotangent module of the diagonal ideal; the non-log Ω^1 with which log differentials are compared (Ω^1 → Ω^1_log). |
| `DividedPowers` | [Pinned module](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/DividedPowers/Basic.lean) | Divided power structures on an ideal; the PD ideals J of δ_log-PD triples. |

The only repaired baseline claim is `PreTilt`: it is a construction on a commutative ring O, namely the inverse Frobenius perfection of O/p, not “the tilt of an O-algebra” supplied together with perfectoid theory. TensorProduct is a module carrier; DerivedCategory is a 1-categorical derived-category shadow, not the E∞/stable ∞-categorical interface. Perfection here is the inverse-limit monoid construction. DividedPowers is a PD structure, not a PD envelope.

The reviewed `data/library-coverage.json` was screened. It contains no direct PrismaticCohomology PR.8 audit row; nearby Habiro/trace audit rows mentioning prismatics do not certify PR.8 as built. No audited existing declaration is introduced as a new blueprint node. The elementary Lean use of Perfection, group completion, Jacobson radical, monoid algebra and Witt lifts builds on their actual pinned shapes. The local δ-structure prototype is identified as PR.0’s stand-in; it must eventually be replaced by its owner’s interface, rather than turned into a second PR.8 δ-ring target.

Supplier statements were read in the current atlas/blueprint material. The mathematical boundaries are appropriate: CR.5 owns integral log algebra and log crystalline cohomology; DD.6 owns animated log cotangent/de Rham; PR.0–7 own ordinary prismatics; AI.6 owns semistable AΩ. These labels are requests for work, not evidence all requested ranges are present. The following exact mismatches remain:

- T6:log-sites currently supplies smooth adic pairs with a strict normal-crossings boundary. Nodes 60/62 ask for general fs log adic spaces, including perfectoid cases. Reconcile this expansion with its owner.
- PR.4 currently gives the smooth formal étale comparison. Node 61 uses the arbitrary p-complete bounded-torsion derived ring comparison. A new explicit PR.4 request records the missing scope.
- PR.7’s crystalline-lattice classification for Spf(O_K) does not by itself supply the Laurent/perfect-complex equivalence and Drinfeld–Mathew/Bhatt–Mathew descent. A precise request records the distinction; it also requires the corrected KY theorem.
- CR.6 currently concerns proper semistable models over a mixed-characteristic DVR. Node 74 uses proper Cartier-type fs objects over O_C, with the section k→O_C/p and rational crystalline extension. Its existing request is precise, but its full scope is not yet an export.
- C0 supplies sites and bounded comparisons; it does not explicitly export the completed structure sheaves and condensed/profinite module interfaces used by the new objects. These interfaces need exact ownership before closure can be verified.
- The existing characteristic-p Riemann–Hilbert and arc-descent gaps are real. This review did not create duplicate developments or claim their roles were discharged by unrelated supplier names.

AI.1 explicitly owns Koszul calculations for commuting endomorphisms; it is now a direct prerequisite/request for node 40. This avoids making a second generic Koszul complex here. As concrete upstream style comparisons, AdicSpaces, LocalGaloisGroups and AlgebraicTopology show explicit imported interfaces, genuine carriers and map-level comparison statements; a list of names in comments falls below that standard.

## Lean/API/test verification

All 332 packet API/test names occur in the suggested file, but mere occurrence does not satisfy §13. The 292 documentation entries do not elaborate a signature or an example. Their honest “not typed” explanation is preferable to vacuous `Prop` fields, but it is not the required suggested declaration. The named geometric comparison theorems are also prose comments. No opaque `Prop` stand-in was introduced in this review.

The algebraic core uses real Mathlib carriers. The review adds typed extensionality and strengthens the exactification test. Remaining examples are still weaker than the packet: an arbitrary-unit identity over Z_p does not compute δ_log(1+p) in Z_(p); a monoid-algebra structure supplied with δ(generator)=0 does not compute the specific δ-ring; the Frobenius example proves a generic identity rather than the free-ring calculation; Breuil–Kisin tests act through α rather than stating equality of the monoid Frobenius. The δ_log-triple carrier used for PrelogPrism/IsPerfect omits prism and boundedness hypotheses, as documented; those are not full prism signatures.

The six planets are δ_log-ring, log prism, log prismatic site, logarithmic Hodge–Tate comparison, log Nygaard filtration and Kummer-étale comparison. They meet the six-per-layer limit and identify the source’s central mathematical objects/results.

## Per-node audit

The suffixes below identify nodes in `PrismaticCohomology:PR.8/`. The packet has the identical 76-entry review manifest. Full file-wide suggested-signature concerns above apply throughout.

| # | Node | Verdict | Finding |
|---|---|---|---|
| 1 | `delta-log-ring` | corrected | K1 Definition 2.2/Remark 2.5: checked the three axioms and Witt formulation; fixed the free-generator ring in the test and added typed structure/morphism extensionality. The promised Z_(p) computation and computed monoid-algebra structure still need matching Lean examples. |
| 2 | `delta-log-frobenius` | verified | K1 Remark 2.3: the Jacobson-radical and associated-log hypotheses make the unit correction well-defined; rank-one prelog case is separate. Typed Breuil–Kisin/non-rank-one examples are weaker than the promised concrete monoid computations. |
| 3 | `delta-log-free` | verified | K1 Remarks 2.6–2.8/Proposition 2.11: free δ_log objects, polynomial variables and completed inversion match. Ordinary δ theory belongs to PR.0; the free log API/tests remain comments. |
| 4 | `delta-log-completion-etale` | verified | K1 Lemmas 2.9/2.13: retained finite generation and p in the completion ideal; uniqueness and étale lifting use PR.0 completion/lifting, not arbitrary completion. |
| 5 | `delta-log-associated-log` | verified | K1 Proposition 2.14/Corollary 2.15: checked the units pushout, affine étale sections and finite-generation/completeness range; log algebra remains a precise CR.5 request. |
| 6 | `delta-log-groupification` | corrected | K1 Proposition 2.16: uniqueness must be for extensions of the given map on M. Added that condition; the typed groupification signature already has it. |
| 7 | `delta-log-exactification` | corrected | K1 Construction 2.17/Remark 2.18: corrected integrality to M_B → M′, removed unintended completion of the algebraic exactification, and strengthened the typed test to the full inverse-image membership equivalence. Ogus draft I.4.3.17(1) proves integrality descent. |
| 8 | `prelog-prism` | verified | K1 Definition 3.3/rigidity: prism, boundedness and rank-one conditions match PR.0. The Lean δ_log-triple carrier honestly omits actual prism conditions; it is not a full PrelogPrism signature. |
| 9 | `log-prism` | verified | K1 Definition 3.3/Remark 3.5 and KY Convention 2.34: distinguished formal-scheme log structures from a log ring on A; the bounded associated-log construction and its morphisms match. |
| 10 | `standard-log-prisms` | verified | K1 Example 3.4 and introductory examples: checked Teichmüller, zero-log crystalline and Breuil–Kisin charts and both maps; π♭ requires compatible roots, as implicit in the chosen element. |
| 11 | `prelog-prismatic-envelope` | verified | K1 Proposition 3.6: orientability, integral source/target monoids and exact surjection are retained; groupification plus the ordinary PR.0 envelope gives the universal construction. |
| 12 | `log-prismatic-envelope` | verified | K1 Proposition 3.7/Lemma 3.8: boundedness and integral formal log structures are explicit; checked exact quotient sections and the (1+I)-torsor argument. |
| 13 | `envelope-flatness-smooth` | verified | K1 Propositions 3.9/3.11: both smooth/free alternatives retain injectivity, integrality, free group quotient and completeness assumptions. Proof uses the corrected exactification integrality, not N → M′. |
| 14 | `perfectoid-monoid` | verified | KY Definitions 2.18/2.25/Construction 2.22: inverse-limit tilt, perfect/pseudo-perfectoid distinction and characteristic quotient match. Mathlib Perfection is an inverse limit, not colimit perfection. |
| 15 | `perfect-log-prism` | verified | KY Definition 2.35/Remark 2.36/Example 2.37: integral monoid plus bijective ring/monoid Frobenius are retained; colimit perfection is separate from tilt. Lean IsPerfect acts on the triple carrier and omits actual prism hypotheses. |
| 16 | `perfect-log-prisms-perfectoid` | verified | KY Proposition 2.39/Lemma 2.40: the perfect-prism/perfectoid-log-ring equivalence and lifting from a perfectoid integral prelog ring use PR.0 and DD.6; rank-one charts are a conclusion, not imposed on every input. |
| 17 | `perfectoid-prelog-cotangent` | verified | KY Lemma 2.28/Corollary 2.29: checked p-completed log cotangent vanishing for perfectoid/pseudo-perfectoid input and maps between perfectoid prelog rings; DD.6 supplies the log transitivity. |
| 18 | `log-prismatic-site` | corrected | K1 Definition 4.1/Remarks 4.2–4.5: objects and exact immersion match. Fixed the false non-example: forgetting logs does give an underlying ordinary prism object; the Hodge–Tate differential map is multiplication by X and need not be an isomorphism. |
| 19 | `log-prismatic-cohomology` | verified | K1 §4.1–4.2: checked structure/reduced sheaves, E∞-A cohomology, Frobenius and derived completion. An R-module structure is attached to reduced cohomology, not assumed on unreduced Δ. |
| 20 | `absolute-log-prismatic-site` | corrected | K1 §4.4 and KY §7.5: distinguished integral/strict/saturated absolute sites; added the direct log-envelope dependency used in fibre products of covers. |
| 21 | `cech-alexander-log` | corrected | K1 Construction 4.7/Remarks 4.8–4.10: separated base change of a chosen presentation from the all-elements strictly functorial presentation, which does not commute with arbitrary base change. |
| 22 | `log-prismatic-weak-base-change` | verified | K1 Lemma 4.11: bounded integral bases and finite complete Tor amplitude are explicit; cohomology base change follows from the chosen Čech complex, not arbitrary commutation of totalisation. |
| 23 | `log-prismatic-etale-localization` | corrected | K1 Lemma 4.12, displayed PDF p.22: restored both overbars and the R-linear reduced structure sheaf. Added smooth/bounded/integral base hypotheses and corrected the quasi-coherence claim. |
| 24 | `smooth-chart-covers` | verified | K1 Proposition 4.13/Lemma 4.14: smooth lift/envelope products are completely faithfully flat; Breuil–Kisin is a cover of the final topos object, not a canonical final prism. |
| 25 | `log-hodge-tate-map` | corrected | K1 Construction 5.1/§5.2: corrected non-log compatibility to a commuting square along Ω¹ → Ω¹_log, without an injectivity claim; corrected R/P differential notation. Log dlog square/Bockstein relations match. |
| 26 | `hodge-tate-group-lemma` | verified | K1 Lemma 5.7: finite abelian groups without p-torsion, orientation and group-ring Čech coefficients match. The calculation uses the ordinary PR.1 Hodge–Tate comparison rather than assuming the log theorem. |
| 27 | `hodge-tate-log-affine-line` | verified | K1 Proposition 5.8: the log affine-line computation uses exactified ratios, the group lemma and smooth covers; H¹ is generated by dlog X with the twist. |
| 28 | `log-hodge-tate-comparison` | verified | K1 Theorem 5.3/KY introduction: smooth integral bounded range and perfectness are retained. Direct prerequisites supply the affine-line and group calculations and DD.6 cotangent comparison. |
| 29 | `log-prismatic-base-change` | verified | K1 Corollary 5.5/KY Theorem 2(2): checked qcqs global completed base change with bounded integral prism bases; this is stronger than the preliminary finite-Tor lemma after Hodge–Tate. |
| 30 | `delta-log-crystalline-site` | corrected | K1 Definition 6.4/Construction 6.6: fixed the affine-line weak-finality test. The rank-one lift is an object; free δ_log data followed by a log PD envelope are needed for weak finality. |
| 31 | `delta-log-crystalline-vs-log-crystalline` | verified | K1 Proposition 6.8/Remarks 6.7/6.9: big/small log crystalline comparison, reduction mod p^m and completed limits match; the smooth log PD computation is requested from CR.5. |
| 32 | `cartier-type-cosimplicial-frobenius` | verified | K1 Appendix B Propositions B.1/B.3: integral injection, exact relative Frobenius, and free group quotient for the final quasi-isomorphism are explicit; the projection is read via its inclusion back into A•. |
| 33 | `crystalline-comparison-map` | verified | K1 Construction 6.5: checked φ_* coefficients, pushout monoid M_B^(1), PD ideal containing p and factorisation ψ; the twist is required to get a map from B/p. |
| 34 | `local-crystalline-comparison` | verified | K1 Theorem 6.1: local Cartier-type integral chart, finite-generation and exact smooth-lift hypotheses are retained; proof rests on the comparison functor and Appendix B. |
| 35 | `log-crystalline-comparison` | verified | K1 Theorem 6.3 and KY Theorem 2(3): checked Cartier type and distinction between the prism ideal (p) and the PD ideal; global completed scalar extension has the φ twist. |
| 36 | `log-q-pd-triple` | corrected | K1 Definitions 7.1–7.2/Lemma 7.4: expanded the previously implicit envelope hypotheses, including both smooth δ_log and completely free alternatives, and defined I₂ from the kernel. |
| 37 | `log-q-crystalline-site` | corrected | K1 Definition 7.5/Construction 7.8: removed the false requirement J ⊃ ([p]_q); the q-PD ideal contains the base PD ideal and satisfies its γ/φ conditions. A_inf with J=(ξ) distinguishes the ideals. |
| 38 | `log-q-crystalline-vs-crystalline` | verified | K1 Theorem 7.10: q=1 completed specialization lands in δ_log crystalline cohomology, then CR.5 comparison; no uncompleted tensor or arbitrary base change is used. |
| 39 | `log-q-crystalline-vs-prismatic` | verified | K1 Theorem 7.13: rank-one or log-ring base and mod-p Cartier type are explicit; ψ and φ_* base explain the q-crystalline/prismatic twist. |
| 40 | `log-q-de-rham-complex` | corrected | K1 Constructions 7.15–7.16/Theorem 7.17/Remark 7.18: log q-derivative divides by q−1, not (q−1)X. Added AI.1 as owner of commuting-endomorphism Koszul complexes and their décalage calculation. |
| 41 | `semistable-aomega-comparison` | verified | K1 Theorem 8.1/Remarks 8.3–8.4: semistable canonical log charts, q-PD base A_inf and φ-pullback/completion match; AI.6 supplies AΩ on precisely the overlap. |
| 42 | `semistable-crys-bdr-diagram` | corrected | K1 Theorem 8.5 compared with ČK Proposition 6.8: repaired coefficients and the B_dR^+ period arrow, which is not labelled an isomorphism in the correcting diagram. The left qCRYS base is A_inf before tensoring with A_crys. Source error E8.7 is recorded. |
| 43 | `breuil-kisin-log-cohomology` | corrected | K1 Example 1.6 and comparison/base change: added log-frobenius-isogeny as the direct input for the Cartier-type isogeny claim, separate from semilinearity; properness is retained for perfectness. |
| 44 | `log-quasisyntomic-site` | verified | KY Definition 3.1/Proposition 3.4: checked log Tor amplitude, p-complete flatness/faithful flatness, pushouts and non-log restriction; ordinary ring-flat covers cannot replace the log conditions. |
| 45 | `log-qrsp` | corrected | KY Definitions 3.11/3.15 and Lemma 3.16: clarified that the relative cotangent criterion is log L_(S,M)/R, with trivial prelog structure on R; bounded torsion and log-semiperfect hypotheses are explicit in the API. |
| 46 | `log-qrsp-basis` | verified | KY Lemma 3.18/Corollary 3.20: checked QRSP covers, p-divisible charts, Čech stability and restriction equivalence for presentable coefficient ∞-categories; descent uses DD.6, not naive monoid flatness. |
| 47 | `derived-log-prismatic` | corrected | KY Construction 4.1/Remark 4.11: replaced the tautological sections-to-sections chart claim by the actual need to sheafify constant prelog charts on smaller étale opens; animation/completion conventions match. |
| 48 | `derived-log-hodge-tate` | verified | KY Proposition 4.5/Remark 4.10: conjugate filtration uses derived exterior powers and the {−i}[−i] shift; global version uses sheafification of the log cotangent complex. |
| 49 | `derived-log-properties` | verified | KY Proposition 4.7/Remark 6.2: associated-log invariance, homotopy base change/pushouts, completed colimits and pseudo-perfectoid base removal match; no ordinary tensor substitutes for the derived one. |
| 50 | `derived-vs-site` | verified | KY Proposition 4.12/Corollary 4.6: smooth-chart and affine-site comparisons match, with the canonical truncation filtration under smoothness; source misreference E8.3 confirmed. |
| 51 | `log-quasisyntomic-descent` | corrected | KY Corollary 4.15 and surrounding setup: restored standing integrality of M_A; small versus big log quasisyntomic sites and perfectoid hypothesis for the latter stay separate. |
| 52 | `initial-log-prism-qrsp` | verified | KY initial-prism proposition in §4.3: the A_inf(R) completed tensor with Z_p⟨M♭⟩ is over Z_p, as printed; no unsupported identification with ordinary derived cohomology is introduced. |
| 53 | `log-nygaard-filtration` | verified | KY Definitions/Constructions 5.5/5.9/5.11/5.13: pullback Δ^(1), Nygaard maps, flat base change and sheafification match. Arbitrary smooth base change is not substituted for the stated flat one. |
| 54 | `log-nygaard-graded` | verified | KY Theorem 5.1/Corollary 5.27: Nygaard graded pieces identify with the increasing conjugate filtration, and only smooth inputs replace it by τ≤i. |
| 55 | `nygaard-hodge-fiber-sequence` | corrected | KY Construction 5.21/Corollaries 5.33–5.35: stated i≥0 in the periodicity range j≥D; the fibre sequence and Cartier-type Hodge replacement keep completion and global finite rank. |
| 56 | `log-l-eta-factorization` | verified | KY Corollary 5.17/Proposition 5.29: checked the Frobenius factorisation through Lη and the Cartier-type condition for it to be an isomorphism, including the affine-site sheaf assertion. |
| 57 | `log-de-rham-comparison` | verified | KY Corollary 5.18/Theorem 2(4): ordinary log de Rham for smooth Cartier-type inputs versus animated derived log de Rham for general simplicial prelog inputs; φ-twisted scalar extension is retained. |
| 58 | `log-frobenius-isogeny` | verified | KY Corollary 5.31: checked V_i, truncations and I^i scalings; qcqs finite differential rank provides a global exponent. No isogeny is inferred from semilinearity alone. |
| 59 | `kummer-etale-site-log-scheme` | corrected | Kato II Definitions 2.1–2.3 and KY §6: added n≥1 for the natural-number Kummer map, n>1 for the nonzero log-point cohomology test, and retained invertibility of the covering index. |
| 60 | `log-scheme-vs-log-adic-kummer` | unverifiable | KY Lemma 6.5 matches the topologically finite/noetherian fs statement. Closure is unverified: the named T6:log-sites supplier only exports smooth pairs with strict normal-crossings boundary, not these general fs log adic spaces. |
| 61 | `affine-kummer-etale-comparison` | unverifiable | KY Theorem 6.1 matches the perfect-prism, saturated-chart, bounded-torsion derived statement. PR.4 only exports a smooth-formal comparison; added a request for the arbitrary bounded-ring comparison needed in the reduction, so closure remains unverified. |
| 62 | `log-diamond` | unverifiable | KY Definitions 7.1/7.4/Lemma 7.8: corrected saturation to its terminal property for maps FROM saturated objects and restricted the n-component splitting test to geometric base change with chosen roots of unity. General log-adic and completed-sheaf supplier exports remain unverified. |
| 63 | `log-diamond-generic-fibre` | unverifiable | KY Example 7.6 and introductory generic fibre: the non-sheafy Huber-pair case is intentional and belongs to D6. The fs associated-log construction also requires the general log-adic/completed-sheaf extension recorded as a gap. |
| 64 | `stdisc-log-perfectoid` | corrected | KY Definition 7.12/Remark 7.13: replaced p-valued charts by zero-valued positive generators to obtain genuine characteristic Q≥0 and N. On Ô=C, p is a unit and gives a trivial log structure. |
| 65 | `quasi-pro-kummer-etale-site` | corrected | KY Definitions 7.14/7.18 and Proposition 7.16: removed full two-out-of-three; stated the proved cancellation direction g and gf imply f. Added n>1 to the ramified-root non-example. |
| 66 | `kummer-tower-covers` | corrected | KY Proposition 7.22/Corollary 7.23: counterexample P=Z/2, n=2 disproves unrestricted power-tower surjectivity. Restricted assertions (1)–(2) to torsion-free P^gp and retained chart-local general-fs site statements; recorded E8.9. |
| 67 | `kummer-etale-vs-qpket` | unverifiable | KY Theorem 7.25/Corollary 7.27 statements match torsion coefficients and bounded p^∞-torsion. The arc-descent input remains ownerless in the original gap, so proof closure is not verified. |
| 68 | `global-etale-comparison` | unverifiable | KY Theorem 7.30/Corollary 7.31: perfect log prism, descending fs model, qcqs and mod-p Cartier-type hypotheses match. Closure inherits the arc-descent gap; the ordinary-étale replacement is allowed only with trivial generic log structure. |
| 69 | `kummer-local-systems` | unverifiable | KY Definition 7.32 matches the condensed coefficient local-system definition. Corrected the torsor/module confusion to a finite-cover pushforward of rank n; C0 does not explicitly export the required condensed/profinite module interface, so closure remains unverified. |
| 70 | `laurent-f-crystal` | unverifiable | KY Definitions 7.34–7.35 match Laurent coefficient inversion, p-completion and Frobenius-equivalent perfect objects. Étale-realisation API depends on node 71 and its unresolved corrigendum; coefficient/descent interfaces are not verified. |
| 71 | `laurent-f-crystals-local-systems` | unverifiable | Preprint KY Theorems 7.36–7.37 match the packet, but a 2026 corrigendum identifies published Theorems 7.35–7.36 for correction, requiring a version and hypothesis check. Only its abstract was retrievable; the corrected hypotheses and published/preprint numbering are unverified. Fixed the rank-one torsor test; do not accept this equivalence or its descent sketch yet. |
| 72 | `smooth-proper-pushforward` | unverifiable | Preprint KY Proposition 7.38 matches smooth proper bounded fs pushforward. Its use of the Laurent equivalence cannot be verified until the corrigendum is read and the pushforward consequences are checked. |
| 73 | `etale-comparison-over-ainf` | unverifiable | KY Proposition 8.3 matches proper Cartier-type input and localization at φ^−1(μ). The Bhatt–Lurie characteristic-p Riemann–Hilbert construction in Lemma 8.5 remains an ownerless recorded gap; this review does not certify proof closure. |
| 74 | `log-hyodo-kato-isomorphism` | unverifiable | KY Propositions 8.8–8.9 match proper Cartier-type fs input, rationalization and the chosen section k → O_C/p. CR.6 currently states proper semistable DVR models, not this full range; the requested general extension is not a verified export. |
| 75 | `log-prismatic-bkf-module` | unverifiable | KY Theorem 8.2/Definition 8.1 match the φ-twisted BKF module with the source’s ξ/φ(ξ) localization convention. Proof closure inherits the Riemann–Hilbert and rational crystalline supplier gaps in nodes 73–74. |
| 76 | `semistable-chart-application` | verified | Standard semistable chart: diagonal N → N^r, relative rank d−1 and the dlog relation are correct. The generic log structure is trivial since each x_j is a unit after inverting p; application comparisons are conditional on their explicitly recorded supplier gaps. |

## Validation and orchestrator follow-up

- `python3 scripts/check_blueprint.py research/blueprint/packets/PrismaticCohomology--PR.8.json`: 0 errors, 0 warnings.
- `lean-check research/blueprint/suggested/PrismaticCohomology--PR.8.lean`: elaborates; only declaration-uses-sorry warnings. This validates the typed subset, not documentation-only comparisons.
- Name/manifest checks: all 76 nodes have one review entry; 332 API/test names occur; 292 remain comments; 32 definition/construction nodes have at least 3 tests; 6 planets; source findings have independent verdicts.
- Deliverable-path/private-path checks and `git diff --check`: pass before submission. Only this issue’s packet, suggested file, review report and own handoff are changed.

The original reader document is outside this issue’s allowed paths and still contains the old errors. **It must be synchronised in a revision job before acceptance.** No upstream document, atlas data or another job’s deliverable was edited.

For the orchestrator: obtain the corrigendum and establish the corrected theorem/version correspondence; assign the exact supplier extensions (Part II where the existing scope ends), together with the two ownerless proof inputs; schedule the missing Lean signatures and concrete examples; reconcile the reader document and coverage. The claimed equivalences and diagram must not be promoted on the strength of a successful Lean compile of the elementary core. The review issue can finish with this `needs_changes` verdict; the next action is revision of the plan, not continuation of this review checkpoint.
