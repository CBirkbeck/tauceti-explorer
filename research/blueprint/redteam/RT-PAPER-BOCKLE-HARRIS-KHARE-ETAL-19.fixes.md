# RT-PAPER-BOCKLE-HARRIS-KHARE-ETAL-19: fixes

Fixer: Claude Code, session `cc-c2c06b`, 1 October 2026 (issue #5014, job FIX-RT-PAPER-BOCKLE-HARRIS-KHARE-ETAL-19).

- **Findings:** `RT-PAPER-BOCKLE-HARRIS-KHARE-ETAL-19.result.json` (red team `cc-f805bf`, PR #4725).
- **Verdicts:** `RT-PAPER-BOCKLE-HARRIS-KHARE-ETAL-19.review.json` (verifier `cc-48533a`, PR #4752). Of the 17
  findings, 15 are confirmed and 2 rejected (/1 and /13).
- **What this job fixes:** the nine confirmed medium findings that the issue lists: /2–/8, /10 and /11.
  - Where the verifier's reason changes the red team's fix, I followed the verifier. That happened in /2, /3, /4,
    /5, /6, /7 and /10, as each section says.
  - The six confirmed low findings (/9, /12, /14–/17) are recorded below and not applied (PROTOCOL §17).
- **Independence.** This session wrote none of:
  - the extraction (`cc-fb70e5`, PR #1993);
  - its review (`cc-d67081`, PR #2470);
  - the red team;
  - the verification.
- **Sources.** On 1 October 2026 I re-fetched:
  - arXiv 1609.03491v2, with SHA-256 `ec54cf92…9743b9`, equal to the record, and its TeX source;
  - the published Acta Mathematica PDF, with SHA-256 `15c4b966…ba2c`, equal to the review's record.

  Every new item was stated from the TeX, and every new locator was checked against both texts. Published pages are
  given where I located them.
- **Files changed. Only the deliverables:**
  - `papers/PAPER-BOCKLE-HARRIS-KHARE-ETAL-19.result.json`;
  - `papers/PAPER-BOCKLE-HARRIS-KHARE-ETAL-19.md`. The edits are the header counts, "What the atlas already has", the
    routes, the source-issue table, the checks and a new section "Fixes after the red team";
  - this report.
- **Result.** 53 items (10 planned, 43 missing; 36 before), 9 routes (5 before), 43 prerequisites (unchanged) and 18
  source issues (16 before).
  - Route 1, Part II `GValuedDeformationsAndPotentialAutomorphy`: 28 items (22 before).
  - Route 2, source LP2/LP3: 4 items (3 before).
  - Routes 3, 4 and 5: 4, 1 and 1 items, unchanged.
  - Route 6, source GS.5: 1 item. New.
  - Route 7, source GlobalGaloisDeformations R04.1/R04.2: 2 items. New.
  - Route 8, source SR.2: 1 item. New.
  - Route 9, Part II `SmoothRepresentationsPartIIParahoricCenters`: 1 item. New.
- **Route positions.** Routes 1–5 keep their positions, so `accepted_routes` in `make_queue.py` still returns them with
  their verdicts; I checked this read-only. Routes 6–9 are appended. They have no verdict yet, and their reasons say
  so.
- **Edits.** One Python script edited the JSON and a second edited the report.
  - Every substitution asserted that its old text occurred exactly once.
  - The JSON script asserted that the item ids run /1–/53, that every missing item is in exactly one route, and that
    every planned item, and only those, carries `planned`.
  - The file keeps its formatting: indent 2, non-ASCII written literally, final newline. I checked that re-serialising
    the original gives it back unchanged.

## /2 (medium, duplicate): item 34 has two owners. Fixed, in the verifier's version.

The verifier confirmed the duplicate with one change. Item 34 stays `missing`, because GS.5's stage text does not
mention integral or mod-l coefficients, and PAPER-LAFFORGUE-18/41 itself reaches GS.5 only through a source route. So
item 34 is routed beside that item rather than marked planned.

- **Checked myself.** I read the proof of Proposition 8.10 in the TeX: "This will follow from [Lafa, Proposition
  13.1]" plus the Lemme 10.5 rewriting. The finite flatness sentence and Corollary 8.11 are on published pp. 58–59.
- **Item 34.** The note is rewritten and both wrong sentences are corrected:
  - PAPER-LAFFORGUE-18/41 does give the integral statement;
  - §3.2 enters through Theorem 4.10 in Lemma 8.19, not in Corollary 8.11.

  The locator gains published pp. 58–59.
- **Route 6 (new).** A source route to GlobalShtukasAndFunctionFieldLanglands GS.5 with item 34. Its reason asks GS.5's
  node for Proposition 13.1 and Theorem 13.2 to be stated:
  - at arbitrary level U ⊆ ∏_v G(O_{K_v});
  - with the finite flat O-algebra B(U, O) and Θ_U valued in it;
  - with the indexing by f ∈ Z[Ĝ^n]^Ĝ through the Lemme 10.5 recipe.
- **Route 1.** Item 34 is removed. The brief's construction bullet "The integral excursion algebra B(U, O) …" now
  imports B(U, O) and σ̄_m from GS.5 and constructs only the freeness of §8.3 and R = B. GS.5's import line names them.

## /3 (medium, duplicate): one owner for the reconstruction theorem. Owner recorded; edits elsewhere handed on.

I chose IHG.1, the verifier's and the red team's first option. Route 3's reason now records:

1. **The general statement.** The owned statement is the general one: a possibly disconnected reductive H with
   H^0-conjugacy, over an algebraically closed field of any characteristic. Theorem 4.5 here covers connected Ĝ, while
   LAFFORGUE-18/34, Fargues–Scholze VIII.3.8 and PASKUNAS-QUAST-26/40 need the general form.
2. **The input link.** IHG.1 needs an input link from the LanglandsParameterStacks stage that owns the closed-orbit and
   complete-reducibility theory: LP3, or the substage LP2:excursion-presentation.
   - The parent LP2 will not do. LP2:semisimple-characters feeds LP2, so a link LP2 → IHG.1 →
     LP2:semisimple-characters would close a cycle.
   - I checked the stage graph of `data/atlas.json` with the links LP3 → IHG.1, IHG.1 → LP2:semisimple-characters and
     IHG.1 → GS.5 added: it stays acyclic.
3. **The importers.** LP2:semisimple-characters and GS.5 import the theorem and prove only their specialisations.

Item 8's note points to the owner.

**For the maintainer and the owning jobs.** These files are not deliverables of this job, so these edits are handed on:
- the stage links LP3 (or LP2:excursion-presentation) → IHG.1, IHG.1 → LP2:semisimple-characters and IHG.1 → GS.5;
- in PAPER-LAFFORGUE-18:
  - redirect /37 and /42 to IHG.1;
  - name IHG.1 in /34's note;
- in PAPER-PASKUNAS-QUAST-26, name IHG.1 in /40's note;
- recast two nodes as specialisations that import the general theorem:
  - the GlobalShtukasAndFunctionFieldLanglands packet node GS.5/reconstruction-of-a-langlands-parameter;
  - the LanglandsParameterStacks node LP2:semisimple-characters/character-bijection.

## /4 (medium, error): item 21 was not planned. Fixed, in the verifier's version.

The verifier confirmed the finding but corrected the fix: routing the Bernstein presentation to SR.4 would create a
second owner. Item 21 is split four ways, and only the H_V part stays planned.
- **Item 21**: the §7 setup and the Hecke algebras H_V, including the non-unital inclusions. Planned at SR.1 only, with
  a note explaining the correction.
- **Item 37** (new, missing): the Iwahori–Hecke algebra over O, with:
  - the Bernstein presentation (7.1) and relation (7.2);
  - the normalization e_λ ↦ q^{−⟨ρ,λ⟩}[U_0λ(ϖ_K)U_0];
  - the central O[X_*(T)]^W.

  It goes to route 9, a part-ii route that coalesces with SmoothRepresentationsPartIIParahoricCenters, as
  PAPER-CLOZEL-THORNE-17 route 6 does. The title, parent and area are copied from that route. The brief records the
  integral form BHKT needs, with q ∈ O^×.
- **Item 38** (new, missing): Casselman's isomorphism ([Cas80, Props. 2.4–2.5]) and Lemma 7.2(i) with [BZ77, 2.9]. It
  goes to route 8, a source route to SR.2.
- **Item 39** (new, missing): Lemma 7.2(ii), integrality and the 0-or-1-dimensional localization. It goes to route 1
  beside item 22.
- **Item 40** (new, planned): Lemma 7.1, planned at FunctionFieldArithmetic FA.4 and ReductiveGroupsPartII RG2.5.

The report's sentence in "What the atlas already has" is corrected.

## /5 (medium, missing): two planned items hid unplanned statements. Fixed, in the verifier's version.

- **Item 41** (new, missing): Proposition 8.3, Chevalley restriction over Z for standard Levis. As the verifier
  specified, it is added to route 2 (LP3) rather than RG2.5, whose text excludes invariant theory.
  - Item 32's statement now points to item 41.
  - Item 32's locator drops Proposition 8.3.
  - Item 32's note says the statement was split off.
- **Item 42** (new, missing): Definition 8.7 and Lemma 8.8, with the paper's warning and the proof through Proposition
  6.4. It goes to route 1, and the brief's §8 bullet lists it.
  - Item 33 keeps Proposition 8.4, Theorem 8.5, Corollary 8.6 and Theorem 8.9 as planned.
  - Item 33's statement points to item 42.
  - Item 33's note is corrected.

## /6 (medium, missing): cited inputs that were not items. Fixed, in the verifier's version.

The verifier corrected the red team in three places, and I followed it: the owner of Weil II (DWP.7, not DWP.6), the
split of input 3 into 3a and 3b, and the routing of input 8. New items:

| Item | Input | Status |
|---|---|---|
| 43 | [Laf02, Thm VII.6]: purity, and compatible systems with finite-order determinants | planned, GS.6 |
| 44 | Weil II: H^j of a pure lisse sheaf on an open curve has weights ≥ j | planned, DWP.7 |
| 45 | Euler characteristic and Poitou–Tate with coefficients prime to p ([Mil06], [Ces]) | planned, R02.3/R02.4 |
| 46 | flat Cassels–Poitou–Tate for Z_G of order divisible by p ([Ces, Thm 6.2]), Proposition 11.2 | missing, route 1 |
| 47 | de Jong's conjecture ([Gai07, Thm 3.6]) | missing, route 1 |
| 48 | Chin's Theorems 1.4 and 6.12 and Lemma 6.4 | missing, route 1 |
| 49 | Chin's Theorem 4.6 | planned, GS.6 (via PAPER-KISIN-ZHOU-25 route 3) |
| 50 | [SW, Prop. 7.1] after Larsen | missing, route 1 |
| 51 | Völklein's H^1(Ĝ(F_l), ĝ_{F_l}) = 0 | missing, route 1 |
| 52 | residual representations of the cuspidal spectrum of proper Levis, matched with Satake mod m_R | missing, route 1 |

- **Item 52.** It follows the verifier's routing. The characteristic-zero input is GS.5, already imported. The item is
  only the reduction modulo l, through item 10 and item 41, and its note says that the paper leaves this step implicit.
- **The brief.** It now imports GS.6, DWP.7 and R02.3/R02.4. A new bullet lists the imported black boxes 46–48, 50 and
  51.
- **Prerequisites.** Every cited work was already in `prerequisites`.
- **"As used".** Items 43–51 state each input as the paper uses it. Item 45 quotes the Cassels–Poitou–Tate sequence of
  Proposition 5.19 as printed; the unapplied low finding /14 points out a gap there when S ≠ ∅.

## /7 (medium, duplicate): Ĝ-valued deformation functors had a second owner. Fixed, in the verifier's version.

The verifier added a claimant the red team missed: PAPER-PASKUNAS-QUAST-26 route 2 already sends the framed G-valued
functor, its representability and its presentation to LocalGaloisDeformationRings R08.1. I took the verifier's first
option.

- **Route 7 (new).** A source route to GlobalGaloisDeformations R04.1/R04.2 with item 12 and item 53. Item 12 is the
  unframed theory: Lemma 5.1, Definitions 5.2–5.4, Remark 5.3 and Propositions 5.5–5.6. Item 53 is Lemma 5.9, split
  from item 14.
  - Its reason records the owners: unframed theory at R04.1/R04.2, framed at R08.1.
  - It names both Part IIs as importers.
- **Items.** Item 14 keeps Proposition 5.12.
  - Item 12's note withdraws "Ĝ-valued deformations are not planned anywhere".
  - Item 13 stays in the Part II, with the note the verifier allowed.
- **Route 1.** Its reason has a dated correction, and its brief imports the functor from R04.1/R04.2 and R08.1.
- **Not a deliverable.** FKP-22's brief (GlobalGaloisDeformationsPartIIGValuedLifting, layer (0)) should name the same
  owner; this is handed to the maintainer.

## /8 (medium, error): the route 1 brief. Fixed.

- **Scope.** "for every reductive group" is now "for every split semisimple group G".
- **Tests.** The verifier's tests replace the old ones:
  - Ĝ = SL_2 (G = PGL_2), with dihedral Coxeter parameters (h = 2);
  - the rank-one Taylor–Wiles count g = h¹ = #Q, checked against dim S_∞;
  - PGL_n compared with L. Lafforgue (GS.6), not derived from him.
- **Record.** A dated note in the brief says why the old tests (GL_n, tori, r = 0, K′ = K) were dropped.

## /10 (medium, missing): Theorem 11.9 lacks its matching condition. Fixed.

- **Checked.** I checked the wording in v2 (p. 65) and in print (pp. 97–98); it is identical.
- **E17** (misprint, affects: the proof, known: new) records the missing condition and the reused letter φ. I set
  "affects" to "the proof", following the verifier: as printed the theorem is true but too weak for its use in
  Theorem 11.8.
- **Item 31** now states Theorem 11.9 with these additions:
  - the matching condition χ_V(φ_λ(Frob_v)) = eigenvalue of T_{V,v} on π^{G(Ô_K)}, as in Theorem 10.11;
  - the place λ, with l ∤ q;
  - the coefficient field E;
  - the embedding renamed ι.

## /11 (medium, missing): Appendix A's strong-regularity claim is false. Fixed.

- **Checked.** I checked Appendix A step 3 in v2 (p. 68) and in print (pp. 100–101); the text is the same.
- **E18** (error, affects: the proof, known: new) records the G_2 counterexample, as the verifier checked it step by
  step. I re-checked the two facts it turns on:
  - −1 = w³ ∈ W(G_2) acts trivially on Ť[2];
  - the 2-division polynomial of y² = x³ − x + 1 has no root in F_3.

  The source issue leaves open whether the general cuspidality statement holds, and it records why the application to
  Coxeter parameters is safe.
- **Item 28** now states Appendix A under the strong-regularity hypothesis (w′ ≠ 1) and says it holds for Coxeter
  parameters.

## Low findings: recorded, not applied

- **/9:** item 3's §2.1 package has owners beyond RG2.5.
- **/12:** the proof of Theorem 5.13 assumes l > 2, but l = 2 is very good for SL_3, SL_5, … — a gap.
- **/14:** the Cassels–Poitou–Tate sequence in Proposition 5.19 omits a Sha term when S ≠ ∅.
- **/15:** further slips in the paper that no source issue records.
- **/16:** item statements that drop hypotheses, in items 4, 6, 27, 35, 36 and others.
- **/17:** provenance errors in the review, which credits the extraction to `cc-442dc5`.

These remain for a later pass. /1 and /13 were rejected, and nothing changed for them.

## For the maintainer

- **Review verdicts.** Routes 6–9 need verdicts from the independent REV-FIX review. The source issues E17 and E18 need
  review blocks.
- **The /3 edits** to other files, listed in that section.
- **FKP-22's brief** should name the owner of Ĝ-valued deformation functors (/7).
- **Route 9** coalesces with the pending SmoothRepresentationsPartIIParahoricCenters. Its brief should be merged into
  that candidate's design job, not opened as a new roadmap.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-BOCKLE-HARRIS-KHARE-ETAL-19.result.json`: ok.
- `research/blueprint/intake.py check-files` on the three deliverables: no problems.
