# RT-PAPER-SCHOLZE-26: fixes

Fixer: Claude Code, session `cc-c2c06b`, 30 September 2026 (issue #5005, job FIX-RT-PAPER-SCHOLZE-26).

**Scope.**
- **Findings:** `RT-PAPER-SCHOLZE-26.result.json`, by cc-f805bf.
- **Verdicts:** `RT-PAPER-SCHOLZE-26.review.json` and `reviews/REV-RT-PAPER-SCHOLZE-26.md`, by Codex session
  codex-J6LwjP. All ten findings are confirmed.
- **This job:** the issue lists /1 (high) and /2–/7 (medium), and this job applies them. The three low ones (/8–/10)
  are not part of it.
- **Corrections:** where the verifier qualified a fix, I applied its version. Each section says how.

**Files changed.**
- `papers/PAPER-SCHOLZE-26.result.json`, edited by a script that asserts each replaced string occurs once. The JSON
  keeps its own format (indent 2, UTF-8).
- `papers/PAPER-SCHOLZE-26.md`. Finding 1 asks for the same correction in the report, so its summary counts, "What the
  atlas already has", "Routes" and "Prerequisites" sections are corrected in place, and a closing section is added.

**Result.** Before and after:

| | Before | After |
|---|---|---|
| Items | 55 (5 planned, 50 missing) | 64 (5 planned, 59 missing) |
| Routes | 6 (one Part II, five sources) | 9 (three Part II, six sources) |
| Route 1 | 42 items, "coalesced" with BKV | 45 items, self-contained |
| Prerequisites | 12 | 12 (2 removed, 2 added) |

**Independence.** I did none of:
- the extraction (cc-39fac3);
- its review (cc-7b31c4);
- the red team (cc-f805bf);
- the verification (codex-J6LwjP).

**What I read, on 30 September 2026.**
- **arXiv v3** (sha256 `440b4a82…7d484`, matching the extraction's hash), at pp. 5–7, 24, 34, 37, 47–49, 53 and the
  bibliography.
- **The review of PAPER-BINDA-KATO-VEZZANI-25**: verdict revise, route 13 rejected.
- **Design issue #3463**: open and available.
- **`research/blueprint/roadmaps/AnalyticStacks.json`**, stages AS.0–AS.2. It is proposed, not yet in the atlas.
- **The routes and items of other extractions:** LMMT-24 (route 1, items 90 and 93), ZHANG-21 (route 10) and
  BHATT-MATHEW-21 (accepted).
- **The EnhancedDerivedSheaves packets:** the E2 nodes and the six E5:presentability nodes.
- **In the atlas:** L5, R11.4, SF and SchemeKTheoryOperations S.1–S.7.
- **Crossref**, for de Jong, van der Put and Mondal–Reinecke.

## /1 (high, error): route 1 stands alone

**The check.**
- PAPER-BINDA-KATO-VEZZANI-25.review.json has verdict "revise", and its route 13 (MotivesRigidAnalyticPartII) has
  verdict "reject".
- The verifier opened #3463 and found Scholze's route as its only continuation.

**Route 1's brief is rewritten to stand alone.**
- It states the final theorems in full: Theorem 1.7 (𝒦 ⊗ ℚ and the 1-unit cofibre), Theorem 1.9 (cancellation over
  any base), Theorem 1.12 (compact generation and rigidity, good-reduction generation), Proposition 1.13 (D_mot(k) =
  DM_ét(k, ℤ)) and Theorem 1.14 (nearby cycles as the (A, N) equivalence).
- It keeps the original nine blocks verbatim, plus three additions: the DM_ét layer (/3), the Lemma 6.4 inputs (/6)
  and the arc-site repleteness (/6).
- It deletes "keep its id, title, parent, area and brief", "reusing the Part II's formal layers" and "reprove several
  of its planned endpoints".
- It adds the finding's sentence: BKV's proposal is under revision, and should coalesce into this roadmap when
  resubmitted.

**The RigDA comparison** is recorded as a gap, since no RigDA owner exists; the verifier said future reuse needs an
accepted supplier.

**Title and reason.**
- The title drops "and logarithmic".
- The route id is kept, so a resubmitted BKV route can join it.
- The reason now says that nothing plans rigid-analytic motives, that BKV's route was rejected, and that RigDA, Vezzani's
  tilting and BGV are prior literature.

**Item notes 17, 27, 44, 50 and 52** are rewritten the same way.

**The report** is corrected in "What the atlas already has" and "Routes", as the finding asked.

**The design job.** The verifier says the pending design should be regenerated through the normal queue process. The
maintainer should rebuild the queue after this merges, so that #3463's prompt carries the new brief. I left a comment
on #3463 pointing to this fix.

## /2 (medium, error): six functors come from AnalyticStacks

- **Item 42's note** names AnalyticStacks AS.0: the construction principle, Scholze Theorem 5.19 = Heyer–Mann Theorem
  3.4.11, and cohomologically smooth, proper and étale maps. The arc-stack application (Propositions 9.4, 9.5,
  Corollaries 9.6, 10.2) stays missing, since AnalyticStacks excludes the motivic lectures.
- **Item 14's note** names AS.1 for the topological formalism.
- **Route 1's brief** imports "six-functor formalisms and analytic stacks (AS.0, AS.1)".
- **Status.** AnalyticStacks is a proposed roadmap (`research/blueprint/roadmaps/`), not an atlas roadmap yet, so the
  items stay missing and name it as supplier.
- **Prerequisites.** Entries 1 (Six-Functor Formalisms; Heyer–Mann) and 12 (Bhatt–Mathew) are removed.
- **Bhatt–Mathew.** Following the verifier, item 7's note cites ArcTopologyAndDescent, BHATT-MATHEW-21's accepted
  route 1, as the scheme-side owner. It says that the scheme arc-site is not the Banach-ring arc-site, and that their
  comparison is not planned.

## /3 (medium, error): Voevodsky's étale motives

- **Item 49** is now missing, with no planned stage, and is routed with route 1.
- **Its note** keeps MC.4 (Nisnevich DM, triangulated, with transfers) and M.5a as partial inputs only. It also records
  the verifier's two requirements: keep Proposition 1.13's field and coefficient hypotheses, and keep the descent versus
  hyperdescent qualification for any general-field extension.
- **Route 1's brief** adds the DM_ét(k, ℤ) layer.
- **Item 48's note** records the choice.

## /4 (medium, error): the K-theory inputs are split

The paper, pp. 47–49, uses Thomason–Trobaugh (p. 47), Gabber–Suslin rigidity (p. 48), 𝔸¹-invariance over valuation
rings (pp. 47, 49), and "either … Cisinski's cdh-descent for KH … Alternatively … pro-cdh descent" (p. 49).

**The split.**
- **Item 37** keeps Thomason–Trobaugh, and route 4 now has only stage S.3, with a rewritten reason.
- **Item 56** is Cisinski's cdh descent for KH. It joins LMMT's GeneralAlgebraicKTheoryPartIITelescopicLocalization
  (route 7) with the same id, title, parent and area; LMMT's item 93 note assigns cdh descent for KH to that Part II.
  Following the verifier, the brief and note make the KH statement explicit and distinct from LMMT's item 90, which is
  K(1)-local.
- **Items 57–59** are pro-cdh descent (Morrow, Kerz–Strunk–Tamme), 𝔸¹-invariance over valuation rings (O_C not
  noetherian) and Gabber–Suslin rigidity. They go to a new part-ii route 8 of SchemeKTheoryOperations, with the paper's
  hypotheses in the brief.

**Route 8's id.** The only other SchemeKTheoryOperations Part II, ZHANG-21's FormalSupportedIntersections, is on a
different topic. So route 8 has its own id, `SchemeKTheoryOperationsPartIIDescentAndRigidity`. The queue merges it
into the pending DESIGN-SchemeKTheoryOperationsPartII by parent.

**The verifier's qualification.** Items 56 and 57 say that the cdh and pro-cdh arguments are alternatives, not both
mandatory.

## /5 (medium, error): dualizable and compactly assembled categories

**The check.** E5:presentability's text works "under the appropriate compact-generation hypotheses". Its six packet
nodes are compact objects, Ind-completion, its universal property, stability of Ind, presentable categories and
coherent group actions.

**Item 60** is new. It covers Ramzi's compactly assembled ⟺ dualizable, Efimov Prop. 1.72, Gaitsgory–Rozenblyum
(local) rigidity, Ramzi's trace-class generation and rigidity of relative tensor products, stated without compact
generation.

**Item 47** keeps Robalo, Nikolaus–Scholze I.3.6, Barr–Beck–Lurie and descendable algebras.

**The routing.** Following the verifier, both items stay in route 6, now with stages E5:presentability and E5:abstract,
as requests for precise E5 nodes rather than claims that E5 plans them. Item 60's note asks E5 to drop its
compact-generation restriction for this theory, which RT.5 (item 38) and route 1 import. The verifier said RT.5's
compact and dualizable objects are not the dualizability of presentable categories, so item 60 is not routed to RT.5.
Item 38's note says it imports item 60.

**Route 6's reason** is rewritten.

## /6 (medium, missing): four cited inputs

- **Item 61, de Jong's alterations.** It is planned at AdicCoefficientsAndComparisons L5, which plans Theorems 4.1 and
  6.5. As the verifier asked, it is stated as an alteration (proper, dominant, generically finite, with snc
  boundary), not a resolution. The paper says "Using alterations" in the proof of Proposition 10.1, p. 53. Items 44
  and 48 cite it.
- **Item 62, van der Put's compactification.** Following the verifier, it keeps the shrinking of U around x and x′, and
  says that van der Put's Corollary 1.3 concerns a normal connected affinoid and its reduction. It is routed with
  route 1.
- **Item 63, the marked-point generalised Jacobian.** It is semiabelian, hence p-divisible. It is separate from item
  62, as the verifier asked, and routed with route 1. Its note coordinates with JacobianChallenge (smooth proper
  Jacobians) and R11.4, whose text is about generalised Jacobians of semistable curves.
- **Item 64, Mondal–Reinecke Theorem A.** A replete hypercomplete ∞-topos is Postnikov complete, and the hypercomplete
  qualification is kept. Following the verifier, it is not routed with route 1: it is a request to EnhancedDerivedSheaves
  E2 (new source route 9), importing E2's replete and Postnikov nodes. Route 1 proves repleteness of the arc-site.

**Other changes.**
- Items 15 and 26 cite the new items.
- **Prerequisites** gain van der Put 1980 (doi:10.5802/aif.812) and Mondal–Reinecke 2025
  (doi:10.4310/HHA.2025.v27.n1.a10).

## /7 (medium, error): Proposition 5.17

**The check.** v3 p. 34 has the characteristic polynomial Symⁿ(G_m) ≅ 𝔸^{n−1} × G_m in the upper row. The lower map
Symⁿ(Ḡ_m) → Ḡ_m is an isomorphism "when mapping to ball-invariant sheaves". The vertical maps are colimits of
𝔹-homotopy equivalences, via Ḡ_m = |G_m × (1 + O_{<1})^•|.

**Item 22's clause** is replaced by the finding's text. The verifier's distinction between the localized lower map and
the unlocalized isomorphism is stated explicitly.

## Not applied, and why

- **The three low findings (/8–/10)** are outside this issue. /8 and /9 are v3 misprints; /10 covers the library
  pointers.

## For the maintainer

- **Verdicts.** Record verdicts in `PAPER-SCHOLZE-26.review.json`:
  - for route 1, whose brief, reason and title changed;
  - for the new routes 7 (join LMMT's Part II), 8 (SchemeKTheoryOperations Part II) and 9 (E2 source);
  - for route 6, whose stages and items changed;
  - for route 4, which dropped S.5.
- **Rebuild the queue** so that DESIGN-MotivesAndAlgebraicCyclesPartII (#3463) carries the self-contained brief.
- **Requests entries.** Add them in the EnhancedDerivedSheaves E5 packet (item 60, and the precise nodes of item 47) and
  the E2 packet (item 64).

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/*.result.json`: every extraction ok.
- `research/blueprint/intake.py check-files` on the three deliverables: no problems.
- Every missing item is routed exactly once. Route 7 matches LMMT's Part II id, title, parent and area.
