# REV-PadicHodgeTheory

**Verdict: accepted after correction.** Claude, session `claude-Zh4gK9`, 13 October 2026. Refs #9398. This session did not write BP-PadicHodgeTheory (Codex, `codex-B5fK6x`, PR #9459) or either of the earlier partial drafts.

Reviewed the [packet](../packets/PadicHodgeTheory.json), the [reader](../readmes/PadicHodgeTheory.md) and the [suggested Lean file](../suggested/PadicHodgeTheory.lean) for all ten stages: R06.1–R06.6, P7, P7:annulus-foundations, P8 and P8:local-rational. The packet's `review.checked` gives one verdict per target: **210 verified, 32 corrected, none added, none unverifiable**. Implementation statuses stay `unchecked`, and the packet status stays `complete`. Annulus-foundations stays closed. The other nine stages stay planned. Their 34 gaps and `remaining` lists are honest records of follow-up work.

## What was checked

- **Mathematics.** I read all 242 statements, with their hypotheses and prerequisites, and checked them against the theory. Spot checks covered the conventions that recur throughout: HT(χ_p) = +1, the dual filtration Fil^i(D^∨) = (Fil^{1−i}D)^⊥, Nφ = pφN, Fontaine's N = −d/du, and the Weil–Deligne recipe r(w) = w̄∘φ^{−α(w)}. The recurring computations also agree with each other:
  - the Tate-curve module D_q and its L-invariant log_K(q)/v_p(q);
  - the Kummer periods;
  - the twist rules D⟨i⟩ and WD(V(n)) = WD(V)⊗ω^n;
  - the Frobenius characteristic polynomials.
- **Sources.** I fetched 53 public editions and checked them against the hashes in `sourceVersions`. All agree except four, whose versions are now recorded. A text-layer script searched every node locator (512 citations) for its label and printed page. Haiku retrieval agents pulled the cited statements for the 67 targets written in this pass and for all 56 source issues. I read the flagged passages myself; the decisions below rest on that reading. Cleared books were not needed. No passage of any source was copied into the deliverables.
- **Baseline.** All 77 cited declarations exist under the cited names, in the cited modules, at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. A Sonnet agent copied the signatures, and I compared them with each `provides` text.
- **Closure.** I checked every cross-roadmap prerequisite and request. All 18 foreign roadmaps cited are in tier 13 or below, and none is retired. I also checked the same-roadmap layer order against the atlas `requires`.
- **Red-team findings and planets.** Each assigned red-team finding was checked against the nodes. The planets are at most six per layer and are named from the sources.

## Corrections

| Target or field | Correction and reason |
|---|---|
| Stage cycles (3) | `P7/plan/sen-module` moved to **R06.2**. Its proof uses only the R06.1 Tate–Sen descent (Brinon–Conrad 14.2.8, 15.1.1–15.1.7), and its overconvergence prerequisite was spurious. R06.2/arithmetic-sen-descent and almost-C-representations cite it, so as placed it closed R06.2 → P7 → R06.2. `R06.2/weight-zero-and-finite-inertia` moved to **R06.3**, because its de Rham clause uses the p-adic monodromy theorem. `P8/plan/lisse-zp-sheaf` moved to **P8:local-rational**, because the early relative primitive comparison cites it. The reader sections moved with them. |
| `P7:annulus-foundations/plan/annulus-derivation` | The image of d/dT is all residue-free series only on open intervals. The packet's hypotheses allow closed endpoints, and on |T| = 1 the series Σ p^k T^{p^k−1} has no primitive. Corrected the statement and proof step, and added this example as a unit test and acceptance item. |
| `R06.1/plan/tate-trace-almost-surjective`, `…/tate-sen-axioms-cyclotomic` | Herbrand and the upper-numbering different formula were used with no prerequisite at all. Added tauceti LocalFieldsRamification layer 3, the supplier that the packet's LocalFieldsRamification request already named. Added Mathlib `Algebra.normalizedTrace` (FieldTheory/NormalizedTrace.lean) as the carrier of Tate's traces on K_∞, following RT-AREA-padic-2/20; it is now a baseline declaration. |
| `R06.6/plan/tate-curve-tate-module`, `…/multiplicative-reduction-elliptic-curves`, `…/good-reduction-iff-crystalline` | Added tauceti EllipticCurves layer 4: Tate uniformisation, the quadratic-twist classification, and v(j) ≥ 0 ⇔ potentially good. The nodes used these facts, but they were cited only in a request. |
| `P8/geometric-hodge-tate-direct-images` | Added PerfectoidSpaces:P6 (toric towers and their Z_p^d-cohomology), which the first proof step uses and the packet's toric-tower request names. |
| `R06.1/plan/bdr-plus-of-perfectoid-affinoid-algebras` | The proof now checks that ξ is primitive and cites PerfectoidSpaces:P1/fontaine-theta-and-primitive-kernel for generation and the nonzerodivisor property, instead of reproving them (RT-AREA-padic-2/21). |
| `R06.1/plan/crystalline-period-ring` | The unit test "B_cris is not a field, ξ is a non-unit" was justified by regularity, which does not show that an element is a non-unit. Replaced it with a discriminating test: t^{−1} ∈ B_cris ∖ B_cris^+. |
| 20 source locators | Corrected the following locators: <ul><li>**Fontaine 1994:** §1.5 is on pp.71–73; there is no §1.6, and pp.66–69 hold §§1.3–1.4.</li><li>**Colmez–Fontaine:** the period functors are §4.1, p.23, and §§5.1–5.3 are on pp.26–28.</li><li>**Nakamura:** E-B-pairs are Definition 1.2, p.8.</li><li>**Ding:** only §2.1 exists.</li><li>**Shimizu:** there is no §8.3; de Rham local systems are Definition 8.6, p.47.</li><li>**Kedlaya–Liu:** Proposition 5.1.2, not a lemma; Corollaries 7.3.8 and 7.3.10 are on p.151; Theorems 8.5.5 and 8.5.12 are on pp.171–173.</li><li>**BMS:** Proposition 13.21, not Theorem 13.21.</li><li>**Betts–Stix:** Proposition 3.20 is on p.27.</li><li>**Brinon 2008:** Corollary 6.1.2 and Proposition 6.1.3 are on p.63.</li><li>**Berger 2002:** Proposition 2.11 is on p.19.</li><li>**Scholze 2013:** Definition 5.9, not "Lemma 5.9"; Theorem 8.8 is on p.51.</li><li>**Tan–Tong:** the sheaf sequence sits in the proof of Theorem 3.18.</li><li>**Gleason–Lim–Xu:** footnote 14, p.32.</li><li>**Brinon–Conrad:** there is no Remark 8.2.5.</li><li>**Scholze 2015:** pp.1021–1023.</li><li>**Scholze erratum:** item (3).</li></ul>The matching texts were revised to say what each place states. |
| Requests | Fifteen `neededBy` lists had been inflated to transitive consumers: 125 nodes for AI.0:integral, 99 for CR.0, 32 for R07.4. Each now lists exactly the nodes that cite the supplier. 21 citations that no request covered were attached to the matching request. Two requests were added: AdicSpacesPartII:R0 for the partially proper pure and étale loci, and RD.1 for the étale slope criterion over the Robba ring. The coverage "Supplier interface" lines were regenerated from these lists. |
| Baseline descriptions | Added the hypotheses the pinned signatures carry: `cyclotomicCharacter.spec` needs enough roots of unity; `PreTilt.val` takes a valuation on a field with its ring of integers; `Tilt` needs `Fact (v p ≠ 1)`; the isocrystal classes need a perfect domain of characteristic p; the Hilbert 90 lemma is the elementary cocycle form under `FiniteDimensional`. |
| Outgoing interfaces | Recorded three outgoing interfaces for the assigned findings: R06.1 → RelativeFarguesFontaine:RF2:untilts, R06.4 → LocalGaloisDeformationRings:R08.5, and P8:local-rational → the primitive-comparison consumers. |
| Reader | Re-rendered from the corrected packet. All 242 target sections now equal their packet rendering; before the review, three of them lagged behind the packet. The request contracts and the library table were also re-rendered. The suggested file's docstrings now name the packet API items `Filtration.dual_dual` and `Filtration.dual_shift` instead of calling them end theorems. |

## Source issues

The 56 recorded issues were checked at their locators: **54 confirmed, 2 rejected, 1 added**. Every entry now has a `review` object naming this job. Selected verdicts:

| Entry | Verdict |
|---|---|
| E8 | Confirmed: γ(π) ≡ χ(γ)π mod π², so the correct exponent is +j. |
| E11 | **Rejected.** "A basis contained in φ(D_r)" already forces Mat(φ) ∈ GL_d. Berger's 2026 errata only calls the generation wording preferable. |
| E20 | Confirmed: the characteristic polynomial is X² + 4p. |
| E24 | Confirmed: Brinon–Conrad give Q_p(n) weight −n, so their example V′ = Q_p(r) contradicts their own inequality. |
| E32 | Confirmed: Corollaire III.2.5 uses the essential image of Théorème III.2.4 and, through III.2.3, the monodromy theorem. |
| E37 | Confirmed: Fontaine–Ouyang's τ_k is geometric with χ(τ_K) = q^{−1}. |
| E40, E44, E46 | Confirmed with explicit checks (valuation p/(p−1) at p = 2; isogeny q ↦ q²). |
| E52 | Confirmed, with a corrected description: the undefined subscript is F, not the coefficient field. |
| E53 | Confirmed; locator corrected. |
| E54 | Confirmed: the sign of deg is inconsistent with the proof of Lemma 5.3. |
| E55 | **Rejected as located.** The recorded Inventiones copy has no Lemma 2.3.2 and no unbounded maximum. Its Lemma 2.4 runs over i = 1…n. |
| E59 | Confirmed by a two-term counterexample under the other reading of "bounded below". |
| **E60 (new)** | Brinon–Conrad Example 6.3.6 (p.79) has a side remark: only a one-dimensional space of extensions of Q_p by Q_p(1) is semistable. In fact all of them are semistable, as Kummer theory and the D_q modules show; the crystalline ones form a hyperplane. Recorded with kind error, affects nothing. |

## Assigned red-team findings

| Finding | Outcome |
|---|---|
| RT-AREA-padic-1/20, 2/21 | R06.1/complete-algebraically-closed-bdr owns B_dR^+(C) as a complete DVR on Mathlib `BDeRhamPlus`. The perfectoid target now cites P1's primitive-kernel theorem. The R06.1 → RF2:untilts interface is recorded in `outgoingInterfaces`. The atlas link must be added by the maintainer. |
| RT-AREA-padic-1/24, 2/3 | Scholze Theorem 5.1, Corollary 5.11 and Theorem 8.4 are targets of P8:local-rational, upstream of CP.3. The proof of Theorem 5.1 uses Lemma 4.12, not Theorem 4.9, which is used only for Proposition 8.2 in P8. Consumers are recorded in `outgoingInterfaces`. The logarithmic version stays with HodgeTateAndCanonicalSubgroups T6. |
| RT-AREA-padic-2/18 | One route is fixed: Colmez–Fontaine's analytic proof. It needs only R06.1 periods, with no slope-filtration supplier. |
| RT-AREA-padic-2/19 | R06.3 cites R01.2 and this roadmap's own P7 realization (the moved ownership of PG.0–PG.2). The atlas lacks the edges P7 → R06.3 and P7:annulus-foundations → R06.3; see below. |
| RT-AREA-padic-2/20 | The Tate–Sen theorem, Tate's traces and Tate's criterion are R06.1 and R06.2 targets. The traces are built on Mathlib `Algebra.normalizedTrace`. |
| RT-AREA-padic-2/22 | R06.5 keeps the general proper-smooth, semistable and abelian comparisons. The modular-curve applications are in `outgoingTargets` for R19.1 and R19.5. |
| RT-AREA-langlands-2/17 | R06.4/khare-wintenberger-ordinarity-branches owns KW II Lemma 3.5, including the Berger–Li–Zhu weight-(p+1) branch. The R08.5 interface is recorded. |

## Questions and actions for the orchestrator

1. **Undeclared same-roadmap layer edges.** Promotion does not draw these edges, so they should be declared in the atlas: P7 → R06.3, P7:annulus-foundations → R06.3, R06.3 → R06.4, R06.3 → R06.6, R06.2 → P8, R06.3 → P8, P8 → R06.5 and P8:local-rational → R06.5. None of them closes a cycle in this roadmap's own `requires`. The atlas `requires` of P8 (CP.3, CP.4) and R06.5 (CP.2–CP.4, R34.3, DD.2) still name higher-tier stages that this packet no longer uses. The R06.5 stage text still claims the modular-curve applications.
2. **Cross-roadmap atlas links** recorded in `outgoingInterfaces`: R06.1 → RF2:untilts, R06.4 → R08.5, and P8:local-rational → CP.3, CP.4, TC.2, IG.3 and AI.5.
3. **Unaccepted foreign nodes.** Prerequisites cite 18 distinct node ids in `PerfectoidSpaces--P0.json` (needs_changes) and `PadicDifferentialEquationsAndRigidCohomology.json` (not yet reviewed). If those packets rename the nodes, retarget the citations here.
4. **Packaging.** Several source ids are duplicates of one edition and should be merged when the package is written: bc/brinon-conrad, fo/fontaine-ouyang, berger02/berger-2002, berger08/berger-2008, sch13 with scholze-arxiv, kedlaya-liu/kedlaya-liu-15, bms/bhatt-morrow-scholze, kw2/khare-wintenberger-09-ii, sch-errata/sch16-erratum and tt/tan-tong. Twenty sources are cited by no target. Only paper coverage or outgoing work uses them.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/PadicHodgeTheory.json --index …/declarations.tsv`: **0 errors, 0 warnings**. The packet has 242 nodes, 78 baseline declarations, 65 requests, 34 gaps and 57 planets.
- Source issues pass `check_errata.check` for the roadmap: no errors.
- Separate checks:
  - every request lists exactly the nodes that cite its supplier;
  - every cited foreign stage is covered by a request;
  - the same-roadmap layer graph has no cycle against the atlas `requires`;
  - all 242 reader sections are byte-identical to their packet rendering and sit under their parent layer.
- `lean-check research/blueprint/suggested/PadicHodgeTheory.lean`: **exit 0, 21 warnings, all `declaration uses sorry`**. The file is 153 lines, imports only Mathlib, and has three light definitions on existing submodule carriers. I re-checked every filtration statement by hand.
- `research/blueprint/intake.py check-files` on the four files: 0 problems.
