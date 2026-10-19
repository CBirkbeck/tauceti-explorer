# Handoff: DESIGN-PerfectoidQuotientsPartII (issue #3362)

Worker: Claude (Opus 5.5), session claude-hWS8KP, 2026-10-19.

## What was delivered

- `research/blueprint/roadmaps/PerfectoidQuotientsPartII.json`: the roadmap definition (area `padic`, parent
  `PerfectoidQuotients`), six layers Q5–Q10 continuing the parent's atlas numbering.
- `research/blueprint/packets/PerfectoidQuotientsPartII.json`: target-level packet, status `complete`, 36 nodes
  (26 theorems, 2 lemmas, 2 comparisons, 1 application, 3 definitions, 2 constructions), 47 API items, 22 unit tests,
  11 planets, 48 baseline declarations read at the pins, 6 requests (all to existing or upstream layers that state the
  needed result), 1 gap, 4 source issues, 5 restructure notes, 2 upstream notes, route coverage for every item of both
  paper routes. `scripts/check_blueprint.py`: 0 errors, 0 warnings (with the pinned declaration index).
- `research/blueprint/readmes/PerfectoidQuotientsPartII.md`: the reader document, rendered from the packet with
  hand-written front matter (scope, conventions, suppliers, how to read the build, examples).
- `research/blueprint/suggested/PerfectoidQuotientsPartII.lean`: 310 lines; **elaborates with `lean-check` at the pins
  (Mathlib 082e2d3, Tau Ceti f790474) with `sorry` as the only warning** (35 warnings, no errors); no sorry'd data
  (`scripts/check_sorry_data.py` passes). Typed: `tiltCoord` with its bijectivity and `fontaineTheta_unique`, the tilt of a
  complete valuation ring (`valuationRing_preTilt`), `IsIndFppf` with its API and tests, glueing of flatness, the blowup
  algebra of a regular pair, flatness of fibrewise nonzero hypersurfaces, `tiltValuation` (for ϖ = p), the valuative
  criterion for topological nilpotence in a Tate ring, `IsPZariski`/`PZariskization` with a proved `lift`. The closing
  comment lists every packet name that needs the integral perfectoid predicate, syntomic morphisms, perfectoidization or
  almost mathematics.

## Scope decisions (read before reviewing)

1. **Bhatt–Scholze §§8.2 and 10 are not planned here.** The design brief's second route (Proposition 8.5, Corollaries
   8.11–8.12, Definition 10.1–Lemma 10.5, Definition 10.6, Theorems 10.9 and 10.11, Lemma 10.12) is planned by
   TauCetiRoadmap's PrismaticCohomology, Part I (pull request #1057), §§2.30–2.31 (`perfectSite_equiv`, `arc_sections`,
   `arc_excision`, `integral_discrete`, `almostPurity`, `finiteStratification`, `ideal_tensor`, `connectivityCriterion`).
   An open TauCetiRoadmap pull request is existing work (PROTOCOL §15), so it is imported through
   `PrismaticCohomology:PR.2` with a request naming those sections. Remark 10.13 (not planned there) and Remark 3.11
   (owned nowhere) are planned in Q10.
2. **Česnavičius–Scholze §2.1 items already upstream are cited.** PerfectoidQuotients Layer 0 (pull request #1042,
   §§0.4–0.6) owns §§2.1.3, 2.1.6–2.1.8 and Proposition 2.1.11; PerfectoidSpaces P7.16a/P7.17 own Lemma 3.1.1's towers
   (RT-AREA-padic-1/7). Q5–Q6 plan only 2.1.1–2.1.2 (identities), 2.1.4–2.1.5, 2.1.9–2.1.10 and 2.1.12.
3. **Ind-fppf and ind-syntomic maps are planned here (Q7).** They were routed to the Scheme-and-stack-foundations Part II,
   which has no design yet (#3361). Syntomic morphisms themselves are cited from Tau Ceti StableReduction Layer 1
   (RT-PAPER-CESNAVICIUS-SCHOLZE-24/10).

## Moves and re-pointing for other plans (recorded in `restructure`)

- PerfectoidSpaces P8 (`P8/integral-extension-of-perfectoid-pair` and its gap), PerfectoidShimuraVarieties S2/S4 through
  P8, PrismaticCohomology PR.4's notes and the RT-AREA-padic-1 owners entries name this Part II as the owner of
  Bhatt–Scholze Theorems 10.9/10.11 and Corollary 8.11: point them at `PrismaticCohomology:PR.2` (upstream §§2.30–2.31).
- DESIGN-SchemeAndStackFoundationsPartII (#3361) and DESIGN-PurityForFlatCohomology should import Q7.1–Q7.3 instead of
  planning ind-fppf/ind-syntomic maps.
- ArcTopologyAndDescent AT.12/tilting-complete-arc-covers may cite Q6.4/Q6.7 for valuation rings of any rank (acyclic:
  this roadmap does not import ArcTopologyAndDescent).
- Bhatt–Scholze Remark 3.11 (item 20 of that paper) is owned by Q10.2; PerfectoidSpaces P7.17 keeps the perfect-residue
  tower.

## What remains

- **Gap:** a faithfully flat perfectoid cover R → R_∞ with an R-algebra map R_∞ → (R⁺)^∧ for complete regular local rings
  with imperfect residue field. Bhatt–Scholze Remark 10.13 asserts it by reference to Remark 3.11, which provides no
  such map; Q10.5 therefore takes the cover as a hypothesis and is unconditional for perfect residue fields (Q10.4).
  Recorded as source issue E4.
- Each stage is `planned`; its `remaining` names only the lemma-level splits to make when the roadmap moves to lemma
  level.

## Source issues recorded

E1 (Česnavičius–Scholze Corollary 2.3.7 cites Proposition 2.1.11(d) for (c); also found by RT-PAPER-CESNAVICIUS-SCHOLZE-24/45),
E2 (the reduction (i) → (ii) in Theorem 2.3.4 needs roots of ϖ̃ that Proposition 2.1.12 does not provide; corrected in
Q6.8(2), as RT-PAPER-CESNAVICIUS-SCHOLZE-24/5 proposed), E3 (Theorem 2.3.4's monic polynomials must have positive degree),
E4 (Bhatt–Scholze Remark 10.13's containment R_∞ ⊆ (R⁺)^∧ is unexplained for imperfect residue fields).

## Sources read (all freely available; hashes in the packet)

Česnavičius–Scholze arXiv:1912.10932v3 and its TeX source (§§1.4, 2.1, 2.3, 3.1, 6.2); Bhatt–Scholze arXiv:1905.08229v4
(Remark 3.11, §§8, 10); BMS1 arXiv:1602.03148v3 (§3.1–3.2); Wedhorn arXiv:1910.05934v1 (§7); Scholze arXiv:1111.4914
(§3); Česnavičius arXiv:1711.06456v4 (§§4–5); Heitmann–Ma arXiv:1708.05761v3 (Theorem 1.3); Stacks tags 0H7N, 0BIQ,
00SW, 00SL, 07C3, 0C33, 031A, 00HP, 07DV. The Annals versions were not read (subscription); findings are scoped to
the arXiv versions. Upstream READMEs read at their pull-request heads: PerfectoidQuotients (#1042), PerfectoidSpaces
(#818), PrismaticCohomology Parts I–IV (#1057, #1065, #1070, #1080), AInfCohomology (#1044), PerfectoidTowers (#816),
SchemeAndStackFoundations and StableReduction (main).
