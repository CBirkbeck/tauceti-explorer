# RT-AREA-topology: fixes

**Job** FIX-RT-AREA-topology (issue #3990) · **Date** 29 September 2026 · Claude Code, session `cc-39fac3`.
The red team `RT-AREA-topology` is by Claude Code, session `cc-2aeb03` (issue #1547, PR #2758). Its review
`REV-RT-AREA-topology` is by Claude Code, session `cc-7b31c4` (issue #1546), and it confirmed all 123 findings. This
session wrote neither.

Repository baseline `31403074` (origin/main, 29 September 2026). Library pins: Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

## What this report is

- **The only deliverable.** The job's output is this one file, so every fix is written here as an exact edit. Prose
  edits give the file, the section, the old text quoted and the replacement in full. JSON edits give the file, the id
  or path, the field, and old → new. Edges give A → B and the result of the cycle test.
- **Two kinds of roadmap.**
  - **ArithmeticQuantumTopology** (/1–/21) is a campaign roadmap. Its fixes are edits to its README and to
    `data/atlas.json`, for the atlas maintainer.
  - **AlgebraicTopology, CombinatorialHeegaardFloer, GeometricTopology, HeegaardFloer and UniversalCovers** are
    snapshots of the upstream TauCetiRoadmap. Under PROTOCOL.md §15 the atlas never re-plans them, so their fixes are
    **notes for the Tau Ceti maintainer**, with exact replacement wording. The snapshots and extracts are then
    regenerated from upstream.
  - **Atlas-side edits** (stage edges and link entries, the restructurings RS-09, RS-10 and RS-33, paper extractions,
    PLAN-HABIRO, audit leads) are for the atlas maintainer and name their files.
- **Findings.** High and medium findings, which are the job proper, have four parts each: what the verifier corrected,
  the state on main at `31403074`, the fix, and what was not done and why. Low findings get a short fix. Each
  finding's section also records any place where the sources read correct the red team's fix or the verifier's.
- **The cycle test** for an edge A → B checks that the atlas as `scripts/build.py` assembles it at `31403074` (2840
  stages, 7792 edges) has no path B → A. "Acyclic" means the edge passes.
- **Sources.** Statements come from sources read at the locator given, with the URL, version and date collected under
  "Sources read" at the end. A statement whose source could not be read stays an obligation and is marked as such.
  Library claims name declarations read at the pins, with their hypotheses.
- **No review verdicts.** Where a fix touches a pending review (REV-RS-09, REV-RS-10~2, REV-RS-33,
  REV-ArithmeticQuantumTopology, AUDIT-44, AUDIT-45), it gives the edit or the lead, and the reviewer decides.

**Disclosure.** Round 2 of the Habiro restructuring, `RS-10~2`, was written by this session (`cc-39fac3`). /7 gives
an edit to `RS-10.result.json` and `RS-10.md`; it does not review RS-10~2, and REV-RS-10~2 (#3942) should weigh the
edit accordingly.

## Decisions that span roadmaps

1. **One owner for filtered complexes, their spectral sequences and the universal coefficient theorem over a PID**
   (/24, /51, /54, as the verifier requires). The owner is a new **AlgebraicTopology Stage 0**, which is pure
   homological algebra (/24). CombinatorialHeegaardFloer's Lane ALG keeps only the `K[U]`-bigraded specialisations
   (/51, /54). Edges from Stage 0 wait until the snapshot carries it; a new stage with only outgoing edges cannot
   close a cycle.
2. **`τ` and GeometricTopology Layer 6** (/60, /64, /79). GeometricTopology Layer 6 feeds milestone G.10 (the normal
   form of cobordisms and the smooth slice genus), so any edge from CombinatorialHeegaardFloer into Layer 6 closes a
   cycle. /79 splits off a **Layer 6b** (`τ` as a concordance homomorphism) that consumes G.6, G.10 and the new
   milestone G.14 of /60. The consumer edges then target Layer 6b and wait for both new stages.
3. **GeometricTopology Layer 4 → CombinatorialHeegaardFloer Lane K**, the direction Lane K's own text states ("consumes
   … layer 4"), is recorded once (/64, /91). /61's reverse edge is not, because it would make a two-cycle.
4. **Edges proposed in more than one section are recorded once.** Ten edges appear in two or more sections:
   - GT Layer 4 → CHF Lane K (/61, /64, /91);
   - GT Layer 4 → G.10 and GT Layer 6 → G.10 (/45, /64, /79);
   - GT Layer 11 → GT Layer 9 (/71, /87, /91);
   - GT Layer 1 → GT Layer 4 and AT Stage 6 → GT Layer 4 (/72, /91);
   - AT Stage 6 → GT Layer 10 (/29, /66, /88, /91);
   - GT Layer 1 → AT Stage 6 and AT Stage 7 → GT Layer 10 (/29, /91);
   - CHF H.1 → HF F4.3 (/57, /64, /109, /116).
5. **Joint cycle check.** All 197 distinct edges proposed in this report were added together to the assembled atlas,
   with the removals proposed for ArithmeticQuantumTopology applied and RT-AREA-diffgeom's three HopfRinow →
   GeometricTopology links included. The result is acyclic, and it stays acyclic with RS-33's links added. The check
   includes the edges into stages that the fixes create (GeometricTopology Layer 7a; HeegaardFloer's new F2.6, F5.x,
   O.x and R.x) as new nodes. Edges touching AlgebraicTopology Stage 0, GeometricTopology Layer 6b and
   CombinatorialHeegaardFloer G.14 are named but not proposed for recording yet.
6. **Owners proposed but not created.** These are for the Tau Ceti maintainer or a new-roadmap request:
   - differential forms on manifolds, at GeometricTopology Layer 1 (/103);
   - a GeometricTopology Part II for Heegaard diagrams, Cerf theory and handle calculus (/100);
   - a mapping-class-group roadmap as the owner of surface classification (/87);
   - a Legendrian-knots Part II (/50);
   - Khovanov homology for Rasmussen's `s` (/59, /72).

## ArithmeticQuantumTopology (/1–/21): conventions

**How the QT edits below apply.** ArithmeticQuantumTopology is a campaign roadmap, so every fix is an exact edit for the maintainer:
- **README** (`content/campaign/ArithmeticQuantumTopology/README.md`, unchanged since 16 September; line numbers as at 31403074). Each QT stage `description` in `data/atlas.json` is the README text between the stage's `contextStartLine` and `contextEndLine`, so it follows the README.
- **Prerequisites.** The stage's `requires` in `data/atlas.json` and its `stageEdges` record, with the README's **Inputs** line. Removals are the maintainer's. The extract `research/blueprint/atlas/roadmaps/ArithmeticQuantumTopology.json` is regenerated by `research/blueprint/make_atlas_extracts.py`.
- **Packet.** New since the red team: the QT blueprint packet `research/blueprint/packets/ArithmeticQuantumTopology.json`, with its document `research/blueprint/readmes/ArithmeticQuantumTopology.md` (BP-ArithmeticQuantumTopology, PRs #2767, #2898 and #2913, 24–25 September; 54 nodes, status `partial`; REV-ArithmeticQuantumTopology is pending). It already carries much of what these findings ask for. Packet edits below are for REV-ArithmeticQuantumTopology or the next blueprint pass.
- **Edge checks.** Every added edge passes the cycle test. The whole set was then tested together, with all additions and removals of /1–/21 applied (including GT L7 → P.2 of /7): acyclic.
- **Stage ids.** `GT L1`, `GT L4`, `GT L5`, `GT L7`, `GT L8` and `GT L11` stand for `tauceti:TauCetiRoadmap/GeometricTopology#layer-1-manifold-library-buildout-general-dimension-general-structure-group`, `#layer-4-knot-theory-done-properly-owned-here`, `#layer-5-dehn-surgery`, `#layer-7-riemannian-geometric-structures-and-volume`, `#layer-8-thurston-geometries-and-the-jsj--geometric-decomposition` and `#layer-11-triangulations-pl-structures-and-collapse`.
- **Page numbers.** "AE-HABIRO" is Habiro, arXiv:math/0605314v1, the only arXiv version. Its pages are those of that PDF; the Invent. Math. print, whose numbering may differ, was not seen.

Several findings rewrite the same stage. Each stage's replacement text is given once, under the first finding that rewrites it. Later findings point to it:

| Stage | Replacement text given under | Findings it serves |
|---|---|---|
| QT.0 | /1 | /1, /2, /20 |
| QT.1 and QT.2 | /3 | /3, /4, /5, /12, /16, /17 |
| QT.3 | /2 | /2, /3, /18 |
| QT.4 | /4 | /4 |
| QT.5 | /6 | /6, /7, /8, /9, /17 |
| QT.6 | /10 | /10, /11, /14, /21 |
| QT.7 | /12 | /12, /13, /15, /17 |
| Source list | /19 | /4, /19 |

## /1 (high, duplicate): QT.0 imports GeometricTopology Layers 1, 4 and 5, and keeps only the surgery calculus they do not plan

### What the verifier corrected
Nothing. The review confirms the finding and its fix:
- QT.0's only prerequisites are LI.0 and LI.4.
- GeometricTopology owns framed and oriented presentations (Layer 4) and surgery on framed links (Layer 5).
- The Tau Ceti declarations cited exist at the pin.
- "the import is the right fix".

### State on main (31403074)
**README, QT.0.**
- Line 15: "Construct oriented framed links/tangles, isotopy equivalence, composition and tensor product; prove the Reidemeister/framing rules used by the chosen combinatorial model. Construct surgery presentations of oriented closed three-manifolds and formulate/prove the needed Kirby move theorem through a sourced topology development. Fix framing anomaly and orientation conventions."
- Line 17: "**Inputs.** `FoundationsAndLibraryIntegration:LI.0`, `FoundationsAndLibraryIntegration:LI.4`".
- Line 21: "**Source route.** Acquire original Kirby-calculus/topological-category proofs; AE-HABIRO specifies the surgery conventions used downstream."

**Atlas.**
- `data/atlas.json` gives QT.0 `requires` [LI.0, LI.4], with a stage edge from each.
- FoundationsAndLibraryIntegration was retired on 16 September (`data/roadmap-retirements.json`). The assembled atlas and the extract therefore give QT.0 no prerequisite at all (see /20).
- Neither version has anything from GeometricTopology.

**Packet.** QT.0 has seven nodes: `framed-link-and-linking-matrix`, `surgery-presentation`, `admissible-framed-link`, `kirby-and-fenn-rourke-moves`, `hoste-move`, `refined-kirby-calculus` and `refined-presentation-existence`.
- The framed link node is built on `TauCeti.FramedOrientedGaussCode` and `BasedOrientedGaussCode.writhe`, not on Layer 4.
- Its `restructure` note asks for this import, and it has requests to GT L4 and GT L5.
- **The request to Layer 5 is wrong.** It asks Layer 5 for "the classical Kirby and Fenn-Rourke move theorems". The document goes further and says the geometric-topology roadmap "owns … surgery and the classical Kirby calculus". But Layer 5's "What to build" is:
  - complements;
  - slopes;
  - "Dehn filling / surgery … `n`-surgery, rational surgery, and surgery on framed links";
  - the unknot identities.

  Kirby calculus is not among these targets. Layer 5's reference list cites Rolfsen ch. 9 ("Dehn surgery, slopes, lens spaces, and the Lickorish–Wallace theorem") and Gompf–Stipsicz ch. 4–5, but only as references. A search of the assembled atlas finds Kirby calculus only in QT.0 ("the needed Kirby move theorem") and QT.3 ("independence under Kirby moves").

**Tau Ceti f790474, re-read.**
- `TauCeti.FramedOrientedPDCode` (`TauCeti/KnotTheory/PDCode/Basic.lean:129`): "The Seifert-relative framing coefficient", `framing : Fin (4 * n) → ℤ`.
- `OrientedPDCode` (`:109`), `crossingSign` (`:379`) and `writhe` (`:406`).
- `FramedOrientedGaussCode` (`KnotTheory/GaussCode/FramedUnbased.lean:25`) and `FramedBasedOrientedGaussCode` (`GaussCode/Basic.lean:64`).
- `FramedMarkovBraid` (`KnotTheory/Markov.lean:112`) and `MarkovEquiv` (`:203`).
- `SmoothLinkEmbedding` (`KnotTheory/SmoothLink/Basic.lean:61`) and `SmoothAmbientIsotopic` (`SmoothLink/Isotopy.lean:39`).
- `BraidGroup` (`GroupTheory/SpecificGroups/Braid.lean:97`).

None of these files contains `sorry`. The gaps the finding quotes are in the module docs: `PDCode/Basic.lean:26`, `GaussCode/Basic.lean:26` and `Markov.lean:20`.

### Fix
**1. README, QT.0, Construct and export (line 15).** Replace with:

> **Construct and export.** Import, and do not construct again: framed and oriented link presentations, their equivalences and the Reidemeister moves from the Tau Ceti roadmap GeometricTopology, Layer 4, with its convention table (standard orientation of S³; the Seifert framing is 0; the blackboard framing equals the writhe); link complements, Dehn filling and surgery on framed links from Layer 5; gluing and handle attachment from Layer 1. At the Tau Ceti pin the framed presentations are built: `TauCeti.FramedOrientedPDCode`, `TauCeti.FramedOrientedGaussCode` and `TauCeti.FramedBasedOrientedGaussCode` (framing integers relative to the Seifert framing), `TauCeti.FramedMarkovBraid` with `TauCeti.MarkovEquiv`, and `TauCeti.SmoothLinkEmbedding` with `TauCeti.SmoothAmbientIsotopic`. QT.0 owns what those layers do not plan:
> 1. framed oriented tangles and bottom tangles with their closures, composition and tensor product, on Layer 4's diagram presentation;
> 2. the linking matrix of a framed link, and its change under stabilization (blow-up and blow-down) and handle slides;
> 3. the Lickorish–Wallace theorem: every closed, connected, oriented 3-manifold is the result of surgery along a framed link in S³;
> 4. Kirby's theorem: two framed links in S³ have orientation-preserving homeomorphic results of surgery if and only if they are related by a sequence of stabilizations and handle slides; and Fenn and Rourke's form, with isotopies and Fenn–Rourke moves (surgery on an unknotted ±1-framed component, or the inverse operation);
> 5. admissible framed links (algebraically split and ±1-framed): surgery on one yields an integral homology sphere, and every integral homology sphere is the result of surgery on one; and Habiro's refined Kirby calculus: two admissible framed links have orientation-preserving homeomorphic results of surgery if and only if they are related by isotopies and Hoste moves, a Hoste move being a Fenn–Rourke move between two admissible framed links.
>
> Items 3–5 extend GeometricTopology Layer 5 in its own direction. Under PROTOCOL §15 their home is a roadmap "GeometricTopology, Part II: surgery calculus", with Layer 5 as its first prerequisite and QT.0 as a consumer; until it exists QT.0 plans them, as an extension of Layer 5.

**2. Inputs (line 17).** Replace with:

> **Inputs.** `tauceti:TauCetiRoadmap/GeometricTopology#layer-5-dehn-surgery`, `tauceti:TauCetiRoadmap/GeometricTopology#layer-4-knot-theory-done-properly-owned-here`, `tauceti:TauCetiRoadmap/GeometricTopology#layer-1-manifold-library-buildout-general-dimension-general-structure-group`

**3. Acceptance (line 19).** Replace "A surgery invariant must descend through actual Kirby equivalence." with:

> Surgery on an admissible link has a unimodular diagonal linking matrix, so it gives an integral homology sphere. An invariant defined on all framed links must descend through Kirby (Fenn–Rourke) equivalence. One defined only on admissible links, as QT.3's J_M is, must descend through Hoste equivalence.

**4. Source route (line 21).** Replace with:

> **Source route.** Habiro, *Refined Kirby calculus for integral homology spheres*, Geom. Topol. 10 (2006) 1285–1317 (arXiv:math/0509039v2):
> - introduction, p. 1285, for items 3 and 4 as stated;
> - p. 1286, for the admissible presentation;
> - Corollary 5.1, p. 1309 (Hoste's conjecture), for item 5.
>
> AE-HABIRO:
> - §4.1 (p. 14), for bottom tangles and closure;
> - §10.1 (pp. 34–35), for Fenn and Rourke's form and for Theorem 10.1.
>
> Primary proofs still to be decomposed:
> - Lickorish, Ann. of Math. 76 (1962) 531–540 (doi:10.2307/1970373);
> - Wallace, Canad. J. Math. 12 (1960) 503–528 (doi:10.4153/cjm-1960-045-7);
> - Kirby, Invent. Math. 45 (1978) 35–56 (doi:10.1007/BF01406222);
> - Fenn–Rourke, Topology 18 (1979) 1–15 (doi:10.1016/0040-9383(79)90010-7).
>
> Both Habiro papers state the existence of an admissible presentation as well known, with no proof and no citation. A primary proof is still to be sourced.

**5. `data/atlas.json`, QT.0.**
- `requires`: [`FoundationsAndLibraryIntegration:LI.0`, `FoundationsAndLibraryIntegration:LI.4`] → [GT L5, GT L4, GT L1].
- `stageEdges`: add GT L5 → QT.0, GT L4 → QT.0 and GT L1 → QT.0. Each is acyclic: there is no path from QT.0 to any of the three.
- Remove LI.0 → QT.0 and LI.4 → QT.0, which go through the retired roadmap.

**6. Packet, for REV-ArithmeticQuantumTopology.**
- **`QT.0/framed-link-and-linking-matrix`.** Add the prerequisite GT L4; the existing request covers it. Say that framed links are Layer 4's presentations, with the Tau Ceti declarations as their built carriers. The linking-matrix content stays, as QT.0's own.
- **The request to GT L5.**
  - Narrow `need` to "surgery on a framed link in S³ and the resulting closed oriented 3-manifold (Dehn filling along the framing slopes)".
  - Delete "and the classical Kirby and Fenn-Rourke move theorems".
  - Drop `QT.0/kirby-and-fenn-rourke-moves` from its `for`.
- **Two new theorem nodes**, sourced as in item 4 above:
  - `QT.0/kirby-fenn-rourke-theorem`: Kirby's theorem and Fenn–Rourke's form;
  - `QT.0/lickorish-wallace`.
- **The gap "The classical Kirby calculus is cited, not decomposed".** It stays, but its detail and the QT.0 `coverage` note should say that this calculus is QT.0's own, as an extension of Layer 5, and not the geometric-topology roadmap's.
- **Document, "Boundaries with neighbouring roadmaps".** Replace "owns framed and oriented link presentations, the Reidemeister moves, surgery and the classical Kirby calculus" with "owns framed and oriented link presentations, the Reidemeister moves and surgery on framed links; the classical Kirby calculus extends its Layer 5 and is planned in QT.0".

### Not done, and why
- **The Part II roadmap is not created.** A new roadmap definition is outside this report's single deliverable; the note above names it for the maintainer.
- **Four primary sources were not read:** Lickorish 1962, Wallace 1960, Kirby 1978 and Fenn–Rourke 1979. Their statements are taken from Habiro's two papers, which were read. Decomposing their proofs, and sourcing a proof of the admissible presentation, stay obligations.
- **Orientation: no edge is added.** The manifold-orientation API has no owner yet (finding /101). QT.0 takes only the orientation of S³, from Layer 4's convention table.

## /2 (high, missing): QT.3's invariance is Habiro's Theorem 10.2 under Hoste moves, through the refined Kirby calculus

### What the verifier corrected
Nothing. The review confirms both points:
- J_M is defined from an admissible presentation.
- Its independence needs the refined Kirby calculus, "because an ordinary Kirby move leaves the admissible class". So "independence under Kirby moves" is not the statement that can be proved.

### State on main (31403074)
**README.**
- QT.3, line 57: "Prove convergence in that completion, independence under Kirby moves and orientation compatibility."
- QT.0, line 15: "formulate/prove the needed Kirby move theorem".

Both are unchanged, and no stage of the atlas names the refined theorem.

**Packet.** It follows AE-HABIRO's §10 route:
- `QT.0/hoste-move` and `QT.0/refined-kirby-calculus` (Theorem 10.1);
- `QT.3/definition-of-JM` and `QT.3/JM-well-defined` (Theorem 10.2), which requires the refined calculus.

The route is not recorded in the README or the atlas, and nothing says why §11.4 is not used.

**Read in the sources.**
- AE-HABIRO §1.4 (p. 6): "To prove that J_M does not depend on the choice of L, we use the twisting property of ω (Theorem 9.4) and a refined version of Kirby's calculus for algebraically-split, ±1-framed links (see Theorem 10.1), which was conjectured by Hoste [28] and proved in [21]."
- It continues: "We also give an alternative proof of the existence of J_M which uses the existence of τ_ζ(M) but does not use Theorem 10.1". That proof is §11.4 (p. 38).
- Definition (10.1) (p. 35): "J_M = J_{L⁰}(ω^{−f_1}, ω^{−f_2}, …, ω^{−f_m}) ∈ Ẑ[q]".
- Theorem 10.2 (p. 35): "For an integral homology sphere M, the element J_M ∈ Ẑ[q] defined in (10.1) does not depend on the choice of L. Hence, the correspondence M ↦ J_M defines an invariant of integral homology spheres with values in Ẑ[q]."

### Fix
**1. QT.0.** The refined calculus, Kirby's and Fenn–Rourke's theorems and the admissible presentation are items 4 and 5 of QT.0's text under /1.

**2. README, QT.3, Construct and export (line 57).** Replace with:

> **Construct and export.** From QT.2 take the algebra P ⊂ R_{Q(v)}, its completion P̂ and the integrality of J_L on P̂ × ⋯ × P̂ for algebraically split 0-framed links (AE-HABIRO Theorem 8.2, Corollary 8.3). Construct the twist elements ω_± = Σ_{n≥0} (±1)ⁿ v^{±n(n+3)/2} P′_n ∈ P̂ (§9.1). Two facts about them:
> - ⟨ω_±, x⟩ = J_{U_±}(x) for the ±1-framed unknot U_± (Proposition 9.1);
> - ω_− = ω_+^{−1}; write ω := ω_+ (Proposition 9.2).
>
> Prove the twisting theorem (Theorem 9.4). Let L ∪ K be an algebraically split, 0-framed link with K an unknot, and let L_(K,±1) be obtained from L by ±1-framed surgery along K. Then J_{L∪K}(x_1, …, x_m, ω^{∓1}) = J_{L_(K,±1)}(x_1, …, x_m) for x_i ∈ P̂.
>
> Let M be the integral homology sphere obtained by surgery on an admissible link L with framings f_1, …, f_m ∈ {±1}, and let L⁰ be L with all framings 0. Define J_M := J_{L⁰}(ω^{−f_1}, …, ω^{−f_m}) in Ẑ[q], the Habiro ring of HabiroCyclotomicCompletions HC.1 (definition (10.1)).
>
> Prove that J_M does not depend on L (Theorem 10.2). The proof uses the twisting theorem and QT.0's refined Kirby calculus: J_{L⁰}(ω^{−f_1}, …) is unchanged by isotopies and Hoste moves of admissible links, so M ↦ J_M is an invariant of integral homology spheres. Prove Proposition 12.1:
> - J_{M♯M′} = J_M J_{M′} and J_{S³} = 1;
> - J_{−M} is the conjugate of J_M.
>
> Export M ↦ J_M ∈ Ẑ[q] with the exact ring-valued map used for later evaluations.
>
> The route is AE-HABIRO's §10 route. The alternative of §11.4 is not used. It derives the independence from the existence of the WRT invariants τ_ζ and the injectivity of the evaluations (Proposition 1.1), and would make QT.4's WRT construction an input of QT.3.

**3. Acceptance (line 61).** Replace "evaluate an explicitly presented integral homology sphere in two surgery presentations. The proof must use the completed-ring universal property and topological invariance." with:

> evaluate an explicitly presented integral homology sphere in two admissible surgery presentations related by Hoste moves. The proof must use the completed-ring universal property and the invariance under Hoste moves.

**4. Source route (line 63).** Replace with:

> **Source route.** AE-HABIRO:
> - §§8.1–8.2 (pp. 28–29): P, P̂, Lemma 8.1, Theorem 8.2, Corollary 8.3;
> - §9 (pp. 32–34): ω, Propositions 9.1–9.2, Theorem 9.4;
> - §10 (pp. 34–35): Theorem 10.1, definition (10.1), Theorem 10.2;
> - §12.1 (p. 39): Proposition 12.1.
>
> Theorem 10.1 is Corollary 5.1 of Habiro, Geom. Topol. 10 (2006).

**5. Packet.** No node change. Add to `QT.3/JM-well-defined` the route note of item 2's last paragraph: §10 is taken, and §11.4 is not.

### Not done, and why
Nothing is left open for this finding. Theorem 10.1 is proved in Habiro, Geom. Topol. 10 (2006); its statement was read, and decomposing its proof is part of QT.0's work (/1).

## /3 (high, missing): QT.1 builds Habiro's U_h(sl₂) machinery and the categorical structure Mathlib lacks; QT.2 builds P and P̂

### What the verifier corrected
Nothing. The review confirms both halves:
- **Wrong machinery.** The declared source needs U_h(sl₂) as a ribbon Hopf algebra, the universal invariant of bottom tangles in completed tensor powers of the even integral form, and ω ∈ P̂. QT.1 plans the Reshetikhin–Turaev route instead.
- **Duplication.** The three Mathlib citations resolve.

### State on main (31403074)
**README.**
- QT.1, line 29: "Construct ribbon categories, duals, braidings, twists and quantum traces, then the relevant Uq(sl2) modules and integral forms. … specialize at roots of unity through the admissible semisimplified/category construction."
- QT.2, line 43: "Construct colored link polynomials with the selected reduced/unreduced normalization. Prove Habiro cyclotomic expansion and divisibility for the exact link class used in surgery."

Neither names P, P̂ or ω.

**Packet.** It already has most of the sl₂ material:
- QT.1: `quantized-enveloping-algebra`, `ribbon-structure`, `braided-hopf-structure`, `bottom-tangle`, `universal-sl2-invariant` and `universal-invariant-integrality`;
- QT.2: `p-basis`, `algebra-P-and-completion`, `integrality-algebraically-split` (Theorem 8.2) and `cyclotomic-expansion`;
- QT.3: `twist-element` and `twisting-theorem`.

What it lacks:
- **The centre of the completed even form**, used as a black box (gap "The centre of the completed even integral form is used as a black box").
- **Corollary 8.3 and the Hopf-link pairing.**
- **τ_ζ.** The packet's `QT.4/WRT-invariant-at-a-root` has only the words "standard state sum".
- **The ribbon category structure.** `QT.1/topological-ribbon-hopf-algebras` says "The pinned libraries contain the categorical half of this". They contain braided and rigid categories, but no pivotal, balanced or ribbon structure.

**Mathlib 082e2d3, re-read.**
- `CategoryTheory.BraidedCategory` (`Mathlib/CategoryTheory/Monoidal/Braided/Basic.lean:50`).
- `CategoryTheory.ExactPairing` (`Monoidal/Rigid/Basic.lean:77`) and `CategoryTheory.RigidCategory` (`:732`).
- `HopfAlgebra` (`Mathlib/RingTheory/HopfAlgebra/Basic.lean:65`).
- `Rigid/Basic.lean:42` lists "Define pivotal categories" as future work.
- There is no pivotal, ribbon or quantum-group declaration in Mathlib or Tau Ceti. `CategoryTheory.Balanced` (`Mathlib/CategoryTheory/Balanced.lean:32`) is "monic and epic implies iso", which is unrelated.

### Fix
**1. README, QT.1, Construct and export (line 29).** Replace with:

> **Construct and export.** Four parts.
>
> **(a) Categorical structure.** Import Mathlib's braided and rigid monoidal categories (`CategoryTheory.BraidedCategory`, `CategoryTheory.ExactPairing`, `CategoryTheory.RigidCategory`) and Hopf algebras (`HopfAlgebra`). Construct what Mathlib lacks: pivotal, balanced and ribbon structures, the quantum trace, and the functor from QT.0's framed oriented tangles to a ribbon category.
>
> **(b) The quantum group of AE-HABIRO.**
> - U_h = U_h(sl₂) over Q[[h]], with v = exp(h/2) and q = v² (§2), as a ribbon Hopf algebra with universal R-matrix and ribbon element (§3.1).
> - The integral form U_q, its even part U_q^ev and their completions Ũ_q and Ũ_q^ev (§§2.3–2.6), with the braided Hopf algebra structure on Ũ_q^ev (§3.3).
> - Bottom tangles and the universal sl₂ invariant J_T (§4), with J_T in the completed tensor powers of Ũ_q^ev for algebraically split, 0-framed T (§4.3).
> - The centre of the completed even form: Z(Ũ_q^ev) ≅ lim_p Z[q, q⁻¹][C²]/(σ_p), with σ_p = ∏_{i=1}^{p}(C² − (qⁱ + 2 + q⁻ⁱ)) (AE-HABIRO Theorem 4.4). This is Theorem 11.2 of Habiro's integral-form paper.
> - The expansion J_T = Σ_p a_p(T) σ_p, a_p(T) ∈ Z[q, q⁻¹], of a bottom knot (Theorem 4.5).
>
> **(c) The WRT invariant τ_ζ(M) used by QT.4** (AE-HABIRO §11.1). Set Ω_r = Σ_{i=0}^{r−2} [i+1] V_i and I_r(L) = J_L(Ω_r, …, Ω_r). Then τ_ζ(L) = I_ζ(L)/(I_ζ(U_+)^{σ_+(L)} I_ζ(U_−)^{σ_−(L)}) ∈ Q(ζ^{1/4}), where σ_± counts the positive and negative eigenvalues of the linking matrix. It is invariant under Kirby moves (Reshetikhin–Turaev; Kirby–Melvin), and τ_1 = 1.
>
> **(d) General simple Lie algebras** (for QT.4's general Lie type only). For each finite-dimensional simple complex Lie algebra g:
> - the Drinfeld–Jimbo algebra U_h(g), with its universal R-matrix R = DΘ⁻¹ and ribbon element (Habiro–Lê §3.1.3, §3.7.2);
> - Lusztig's integral form U_Z and the De Concini–Procesi form V_Z (§§5.2–5.3);
> - the core subalgebra X_h (Theorem 4.9) and the integral core subalgebra X_Z (§5.12, Theorem 5.21);
> - twist systems and core subalgebras ("Definition 2." and "Definition 3.", §§2.13–2.14), the invariant built from them (Theorem 2.22) and its integrality (Theorems 2.29 and 7.3).
>
> Prove diagrammatic isotopy invariance. The root-of-unity values are evaluations of (b) and (c); no semisimplified category is used.

**2. QT.1, Acceptance (line 33).** Append:

> J_U(V_n) = [n + 1] for the 0-framed unknot U; τ_ζ(S³) = 1.

**3. QT.1, Source route (line 35).** Replace with:

> **Source route.**
> - AE-HABIRO §§2–5 and §11.1.
> - Habiro, *An integral form of the quantized enveloping algebra of sl₂ and its completions*, J. Pure Appl. Algebra 211 (2007) 265–292 (arXiv:math/0605313), Theorems 1.1 and 11.2.
> - Habiro, *Bottom tangles and universal invariants*, Algebr. Geom. Topol. 6 (2006) 1113–1214 (arXiv:math/0505219).
> - Reshetikhin–Turaev, Invent. Math. 103 (1991) 547–597 (doi:10.1007/BF01239527).
> - Kirby–Melvin, Invent. Math. 105 (1991) 473–545 (doi:10.1007/BF01232277).
> - AE-HABIRO-LE §§2–5 and 7, for (d).

**4. README, QT.2, Construct and export (line 43).** Replace with the text below. It also carries the edits owed to /5 (the Jones comparison), /12 (the Kashaev invariant), /16 (the two-variable invariant) and /17 (q-holonomicity), each flagged in brackets for the maintainer. Drop the brackets when applying.

> **Construct and export.**
> - **Colored Jones polynomials.** Construct J_L(V_{n_1}, …, V_{n_m}) from QT.1's universal invariant, normalised by J_U(V_n) = [n+1] for the 0-framed unknot (AE-HABIRO §5.2). Build them on GeometricTopology Layer 4's link presentations, not on a new link type.
> - **The cyclotomic expansion.** Define P_n = ∏_{i=0}^{n−1}(V_1 − v^{2i+1} − v^{−2i−1}) and P″_n = P_n/{2n+1}_{2n} (§6.1), and prove the cyclotomic expansion of a knot (§6).
> - **P and P̂.** Construct the algebra P = Span_{Z[q,q⁻¹]}{P̃′_n} ⊂ R_{Q(v)} (Lemma 8.1), its completion P̂ = lim_k P/P_k, and the Hopf-link pairing ⟨x, y⟩ = J_H(x, y) (§6.3.2).
> - **Theorem 8.2.** For an m-component, algebraically split, 0-framed link L and x_i ∈ P_{k_i}: J_L(x_1, …, x_m) ∈ ({2k+1}_{k+1}/{1}) Z[q, q⁻¹], with k = max k_i.
> - **Corollary 8.3.** J_L restricts to a Z[q, q⁻¹]-multilinear map P × ⋯ × P → Z[q, q⁻¹], which induces P̂ × ⋯ × P̂ → Ẑ[q].
> - **Truncations.** Build finite truncations and prove coefficient integrality and specialisation compatibility before passing to any completion.
> - **Comparison with the Jones polynomial.** AE-HABIRO §6.2 gives J_K(P″_1) = (J_K(V_1) − [2])/({2}{3}), and says "−q⁻²J_K(P″_1) is known as the reduced Jones polynomial of K". Prove that this invariant is GeometricTopology Layer 4's Jones polynomial V_K(t) (Kauffman bracket, t = A⁻⁴, V_unknot = 1). Fix the substitution between t and q, and the sign, by the right-handed trefoil value that Layer 4's convention table pins.
> - **The Kashaev invariant.** Define ⟨K⟩_N := J_K(V′_{N−1}) at q = e^{2πi/N}, with V′_{n} = V_n/[n+1]; AE-HABIRO §7.1: "known as the Kashaev invariant". Export the unified Kashaev invariant J_K(1, q) ∈ Ẑ[q], whose evaluation at every root of unity ζ of order r is J_K(V′_{r−1}) at ζ (§7.1).
>   - Comparison node: Kashaev's original R-matrix definition (Kashaev, Lett. Math. Phys. 39 (1997), which cites its definition from Mod. Phys. Lett. A 10 (1995) 1409–1418) and Murakami–Murakami's Theorem 4.9, "For any link L and any integer N ≥ 2, ⟨L⟩_N and J_N(L) coincide", with J_N normalised to 1 on the unknot and evaluated at exp(2πi/N).
>   - The comparison states the conversion between these conventions and the mirror convention J(x) = J_{K,N}(e(−x)) of Garoufalidis–Zagier.
> - **The two-variable invariant.** J_K(t, q) ∈ Λ = lim_k Z[q, q⁻¹][t + t⁻¹]/(σ_k), with J_K(qⁱ, q) the (i−1)st normalised colored Jones polynomial (AE-HABIRO §7.1). Also:
>   - the map γ: Λ → Z[[q − 1, α²]] and Proposition 7.2 (γ is injective and not surjective);
>   - Rozansky's rationality theorem, J^MMR_K = Σ_n P_{K,n}(t)/Δ_K(t)^{2n+1} (q − 1)ⁿ with P_{K,n}(t) ∈ Z[t + t⁻¹] (§7.2);
>   - the Melvin–Morton–Rozansky theorem J^MMR_K|_{q=1} = 1/Δ_K(t) (§7.2; Bar-Natan–Garoufalidis, Theorem 1).
>
>   The Alexander polynomial Δ_K comes from Layer 4. It is built at the Tau Ceti pin as `TauCeti.KnotTheory.alexander` and `burauAlexander`.
> - **q-holonomicity.** The colored Jones function of every knot, and of every link in all its colour variables, is q-holonomic: it satisfies a nonzero linear q-difference equation (Garoufalidis–Lê Theorems 1 and 3).

**5. QT.2, Inputs (line 45).** Replace with:

> **Inputs.** `ArithmeticQuantumTopology:QT.1`, `HabiroCyclotomicCompletions:HC.1`, `tauceti:TauCetiRoadmap/GeometricTopology#layer-4-knot-theory-done-properly-owned-here`

**6. QT.2, Source route (line 49).** Replace with:

> **Source route.**
> - AE-HABIRO §§5–8. Pages: §5.2 p. 19; §6 pp. 20–23; §7 pp. 24–27; §8 pp. 28–29.
> - Jones, Ann. of Math. 126 (1987) 335–388 (doi:10.2307/1971403), Proposition 12.5, as AE-HABIRO cites it.
> - Murakami–Murakami, Acta Math. 186 (2001) 85–104 (doi:10.1007/BF02392716; arXiv:math/9905075v2), Theorem 4.9.
> - Bar-Natan–Garoufalidis, Invent. Math. 125 (1996) 103–133 (doi:10.1007/s002220050070), Theorem 1.
> - Rozansky, Adv. Math. 134 (1998) 1–31 (doi:10.1006/aima.1997.1661).
> - Garoufalidis–Lê, Geom. Topol. 9 (2005) 1253–1293 (doi:10.2140/gt.2005.9.1253; arXiv:math/0309214v3), Theorems 1 and 3.

**7. QT.2, Known/conjectural boundary (line 51).** Append:

> Habiro's Conjectures 7.3–7.5 (AE-HABIRO p. 27) are conjectures. Garoufalidis–Wheeler's lift of the colored Jones polynomial to the Habiro ring of Z[t^{±1}] → Z[t^{±1}, Δ(t)⁻¹] proves Conjecture 7.4 (their Corollary 1.5). It is recorded here as a follow-up that would require HabiroRings HR.1, as PLAN-HABIRO decision D7(ii) sets; it is not a target of this stage.

**8. `data/atlas.json`.** QT.2 `requires`: add GT L4, with the stage edge GT L4 → QT.2 (acyclic). QT.1 and QT.3 edges are unchanged.

**9. Packet.**
- Add nodes:
  - `QT.1/ribbon-category-structure` (pivotal, balanced and ribbon structures, the quantum trace; Mathlib lacks them);
  - `QT.1/wrt-invariant` (τ_ζ as in (c), moved from `QT.4/WRT-invariant-at-a-root`, whose "standard state sum" it makes exact);
  - `QT.2/hopf-link-pairing` (§6.3.2);
  - `QT.2/corollary-8-3`.
- Correct `QT.1/topological-ribbon-hopf-algebras`: the pinned libraries have braided and rigid categories, but no ribbon structure.
- The centre gap stays; its source is now identified as Habiro, JPAA 211 (2007), Theorem 11.2.

### Not done, and why
- **Reshetikhin–Turaev 1991 and Kirby–Melvin 1991 were not read.** Only their bibliographic records were checked. Part (c) is stated as AE-HABIRO §11.1 states it, and their proofs stay obligations.
- **The Habiro–Lê sections behind (d) were located but not decomposed.** They are the sections the packet's gap names.
- **The J. Pure Appl. Algebra identification of arXiv:math/0605313 rests on Crossref alone.** Crossref matches the title and author; arXiv lists no DOI.

## /4 (medium, missing): QT.1 owns U_h(g) for every simple g, and QT.4 states Habiro–Lê's theorem with its exact set of roots

### What the verifier corrected
Nothing. The review confirms that no atlas stage has a quantum group of a general simple Lie algebra, and that the Habiro–Lê construction has no supplier.

### State on main (31403074)
**README.**
- QT.4, line 71: "Add simple-Lie-algebra variants with their separate integral forms and root-order hypotheses."
- QT.4, line 77: "AE-HABIRO-LE general Lie algebra statement and proof, not yet decomposed."
- Source list, line 130: "AE-HABIRO-LE: … (2015)".
- QT.1 names only U_q(sl₂).

**Atlas.** A search of the assembled atlas still finds no stage naming Drinfeld–Jimbo, Lusztig's form or a quantum group of a general g.

**Packet.**
- `QT.4/general-simple-lie-type` states Theorem 1.1, but says only that "the admissible set of orders depends on it and is listed in the source".
- `QT.1/core-subalgebras-and-twist-forms` has the abstract framework.
- The gap "The construction of the integral core subalgebra was not read" (Habiro–Lê §§3–7) stands.

**Read in Habiro–Lê** (arXiv:1503.03549v2; Geom. Topol. 20 (2016), no. 5, 2687–2835, doi:10.2140/gt.2016.20.2687, Crossref-verified).
- **Theorem 1.1** (p. 6): "For each simple Lie algebra g, there is a unique invariant J_M = J^g_M ∈ \widehat{Z[q]} of an integral homology sphere M such that for all ξ ∈ Z_g we have ev_ξ(J_M) = τ^g_M(ξ)."
- **Remark 8.2(a)** (p. 90): "Z_g = {ζ^{2D} | ζ ∈ Z′_g}".
- **§8.4.4** (p. 93): "Let Z′_g (resp. Z′_Pg) be the set of all roots of unity ζ such that Ω_g(ζ) (resp. Ω_Pg(ζ)) is a strong Kirby color."
- **Proposition 8.4** (p. 93): "Suppose ζ is a root of unity with ord(ζ^{2D}) > d(h∨−1). Then ζ ∈ Z′_g ∪ Z′_Pg. More specifically, if ord(ζ^{2D}) is odd then ζ ∈ Z′_Pg and if ord(ζ^{2D}) is even then ζ ∈ Z′_g."
- **Table 1** (p. 36) gives d and D = |X/Y|: d = 1, 2, 2, 1, 1, 1, 1, 2, 3 and D = ℓ+1, 2, 2, 4, 3, 2, 1, 1, 1 for A_ℓ, B_ℓ, C_ℓ, D_ℓ, E₆, E₇, E₈, F₄, G₂.
- **Proposition 1.2** (p. 7): "for ξ ∈ Z_Pg, we have ev_ξ(J_M) = τ^{Pg}_M(ξ). As a consequence, for ξ ∈ Z_g ∩ Z_Pg, we have τ^g_M(ξ) = τ^{Pg}_M(ξ)."
- **§1.3.1** (p. 7), on analytic continuation: "it would be natural to define the g WRT invariant τ^g_M(ξ) at ξ ∈ Z ∖ Z_g as ev_ξ(J_M)".
- **Main theorem.** It "follows from Theorems 2.22, 4.9, 7.3, and 8.1" (p. 7).

### Fix
The finding's option (a) is taken: QT.1 owns the quantum groups, since no other atlas stage uses them (PROTOCOL §15).

**1. README, QT.1.** Part (d) of QT.1's text under /3.

**2. README, QT.4, Construct and export (line 71).** Replace "Add simple-Lie-algebra variants with their separate integral forms and root-order hypotheses." with:

> For each finite-dimensional simple complex Lie algebra g, prove Habiro–Lê's Theorem 1.1. There is a unique invariant J^g_M ∈ Ẑ[q] of integral homology spheres with ev_ξ(J^g_M) = τ^g_M(ξ) for all ξ ∈ Z_g. The set of roots is defined as follows:
> - Z_g = {ζ^{2D} : ζ ∈ Z′_g}, where Z′_g is the set of roots of unity ζ for which Ω_g(ζ) is a strong Kirby colour;
> - d ∈ {1, 2, 3} and D = |X/Y| are as in Habiro–Lê's Table 1;
> - every root of unity ζ with ord(ζ^{2D}) > d(h∨ − 1) lies in Z′_g when ord(ζ^{2D}) is even and in Z′_{Pg} when it is odd (Proposition 8.4).
>
> Prove Proposition 1.2: ev_ξ(J^g_M) = τ^{Pg}_M(ξ) for ξ ∈ Z_{Pg}, hence τ^g_M = τ^{Pg}_M on Z_g ∩ Z_{Pg}.
>
> Outside Z_g, ev_ξ(J^g_M) is defined but is not a theorem about WRT invariants. Habiro–Lê (§1.3.1) propose it as the definition there, and it is labelled so.
>
> The construction is QT.1(d).

**3. QT.4, Source route (line 77).** Replace "AE-HABIRO-LE general Lie algebra statement and proof, not yet decomposed." with:

> AE-HABIRO-LE: Theorem 1.1 (p. 6), Proposition 1.2 and §1.3.1 (p. 7), Table 1 (p. 36), §8.1, Remark 8.2(a), §8.4.4 and Proposition 8.4 (pp. 90–93); the construction through Theorems 2.22, 4.9, 7.3 and 8.1, decomposed in QT.1(d).

**4. Source list.** The AE-HABIRO-LE locator is corrected in /19.

**5. Packet.**
- In `QT.4/general-simple-lie-type`, replace "the admissible set of orders depends on it and is listed in the source" with the definition of Z_g above.
- Add `QT.1/quantized-enveloping-algebra-simple-lie` (U_h(g), R, the ribbon element, U_Z and V_Z), and make `QT.4/general-simple-lie-type` require it.
- The existing gap on §§3–7 stays as the obligation to decompose it.

**6. Atlas.** No edge changes (QT.1 → QT.4 already, through QT.2 and QT.3).

### Not done, and why
- **Corollary C.6 is not quoted.** As printed it reads "ζ ∈ Z′_g if and only if ζ satisfies the condition of Proposition C.5(a)". C.5(a) lists the cases where G_g(ζ) = 0, so it looks like a slip for "does not satisfy".
- **No explicit formula for Z_{Pg} is given.** The paper gives none.

## /5 (medium, duplicate): QT.2 imports Layer 4's Jones polynomial and proves the comparison

### What the verifier corrected
Nothing. The review confirms three facts:
- Layer 4 owns the Jones polynomial via the Kauffman bracket with t = A⁻⁴ and V_unknot = 1.
- `TemperleyLieb.lean:107` exists at the pin.
- QT.2 neither imports it nor plans the comparison.

### State on main (31403074)
**README and atlas.**
- QT.2, line 43: "Construct colored link polynomials with the selected reduced/unreduced normalization."
- QT.2 `requires` [QT.1, HC.1]. There is no GeometricTopology edge.

**Packet.** Its `restructure` note and a request to GT L4 ask for this import. QT.2's `coverage` lists the comparison as "remaining".

**Tau Ceti f790474, re-read.** `TauCeti.TemperleyLieb.jones : BraidGroup n →* (TemperleyLieb R (jonesDelta a) n)ˣ` (`TauCeti/KnotTheory/TemperleyLieb.lean:107`). The module doc (lines 23–24) says "Composing this representation with the Markov trace is the braid route to the Jones polynomial; the trace is not built here". No Jones polynomial is built.

**Read in AE-HABIRO §6.2** (pp. 21–22): "We call J_K(P″_n) the nth reduced Jones polynomial of K. … J_K(P″_1) = (J_K(V_1) − [2])/{2}{3}. … The quantity −q⁻²J_K(P″_1) is known as the reduced Jones polynomial of K, and appears in the original paper of Jones [31, Proposition 12.5]."

### Fix
1. **QT.2's text** (under /3, item 4): the [/5] bullet (the comparison), the requirement that colored invariants are built on Layer 4's presentations, and the Jones reference in the source route.
2. **`data/atlas.json`**: GT L4 → QT.2 (/3, item 8). It is acyclic.
3. **Packet.**
   - Add `QT.2/jones-comparison`, a comparison node: the reduced invariant −q⁻²J_K(P″_1) equals Layer 4's V_K(t), with the substitution and the sign fixed by the trefoil.
   - Its prerequisites: GT L4 (the existing request) and `QT.2/coloured-jones`.
   - `QT.2/coloured-jones` takes Layer 4's link presentation as its carrier.

### Not done, and why
**The explicit substitution between q and t, and the sign, are not written here.** AE-HABIRO gives the reduced invariant but not Layer 4's normalisation. Stating the substitution without a source that compares the two would be a guess, so the node fixes it by the trefoil value that Layer 4's table pins. Masbaum's skein-theoretic cross-check (Algebr. Geom. Topol. 3 (2003) 537–556, doi:10.2140/agt.2003.3.537) is not added: the finding offers it as optional, and the protocol plans nothing as optional.

## /6 (medium, error): QT.5's prerequisites become what it uses, and the regulator comes from Polylogarithms

### What the verifier corrected
Nothing. The review read QT.5's `requires` directly: [QT.0, V.3, V.5]. It confirms (iv) too: Polylogarithms P.1 owns the Bloch–Wigner dilogarithm and P.2 the weight-two regulator and volume calculation, and K3BlochGroups has no regulator stage.

### State on main (31403074)
**README and atlas.**
- QT.5, line 87: "**Inputs.** `ArithmeticQuantumTopology:QT.0`, `K3BlochGroups:V.3`, `K3BlochGroups:V.5`".
- QT.5, line 91: "existing K3BlochGroups regulator owner supplies only the algebraic map."
- `data/atlas.json` has the same three edges.

**RS-10.** RS-10's round 2 (merged 29 September; REV-RS-10~2 pending) repeats the error in its QT.5 entry: "K3BlochGroups supplies the algebraic regulator" (see /7).

**Packet.**
- Its `restructure` note asks for this fix. It requests P.1 and P.2.
- It keeps a request to V.5 for "The algebraic regulator on the Bloch group", which no node uses.

**Neighbours.** The Polylogarithms and K3BlochGroups blueprints were accepted and promoted on 25 September (`data/blueprints/`). They supply the nodes QT.5 needs:
- `Polylogarithms:P.1/bloch-wigner-dilogarithm` and `P.1/bloch-wigner-five-term`;
- `P.2/weight-two-regulator` and `P.2/hyperbolic-volume`;
- `K3BlochGroups:V.4/suslin-exact-sequence` and `V.4/cross-ratio`;
- `V.6/bloch-element-constructor` and `V.6/five-term-certificate`.

### Fix
**1. README, QT.5.** Replace the stage's paragraphs as follows. This text also serves /7, /8, /9 and /17.

**Construct and export (line 85):**

> **Construct and export.** Import, and do not construct again:
> - hyperbolic 3-space, the Riemannian volume and complete hyperbolic metrics, from GeometricTopology Layers 7 and 8; link complements, from Layer 5;
> - the Bloch–Wigner dilogarithm D and its five-term identity, from Polylogarithms P.1;
> - the weight-two regulator, and the volume D(z) of an ideal tetrahedron with cross-ratio z, from Polylogarithms P.2, the only owner of that formula;
> - the pre-Bloch and Bloch groups (K3BlochGroups V.3), Suslin's exact sequence and the cross-ratio (V.4), and certified Bloch elements (V.6).
>
> Build:
> 1. **Cusped hyperbolic 3-manifolds and ideal triangulations**, extending GeometricTopology Layer 7, which states volume and Mostow invariance for closed manifolds only.
>    - Complete finite-volume hyperbolic structures on the interior of a compact 3-manifold with torus boundary. The volume is a topological invariant of such a manifold (Mostow–Prasad rigidity).
>    - Oriented ideal tetrahedra, with shape parameters z, z′ = 1/(1 − z) and z″ = 1 − 1/z, where z z′ z″ = −1; a tetrahedron is positively oriented when Im z > 0.
>    - Ideal triangulations, as face-pairings of ideal tetrahedra.
>    - The edge equations: around each edge the shape parameters multiply to 1 and their arguments sum to 2π.
>    - The completeness condition: the similarity structure on each cusp torus is Euclidean, equivalently its holonomy consists of isometries.
>    - The theorem that the hyperbolic structure extends over an edge exactly when its edge equation holds. So a positively oriented solution of the edge equations that satisfies the completeness condition gives the complete hyperbolic structure.
>    - The Neumann–Zagier symplectic property of the matrix of the gluing equations.
>    - The Epstein–Penner ideal polyhedral decomposition of a non-compact finite-volume hyperbolic 3-manifold, and its subdivision into an ideal triangulation, in which flat tetrahedra may be needed.
> 2. **The Bloch invariant.**
>    - β(M) = Σ_j [z_j] ∈ P(C), from a degree one ideal triangulation.
>    - β(M) lies in B(C) and does not depend on the triangulation.
>    - β(M) ∈ B(k(M)) ⊗ Q, where k(M) is the invariant trace field, and β(M) ∈ B(k(M)) when M is not compact.
>    - The real-regulator identity vol(β(M)) = Vol(M), where vol: P(C) → R is [z] ↦ D(z). So Vol(M) = Σ_j D(z_j) for a positively oriented ideal triangulation.
>
>    None of this needs item 3.
> 3. **The extended theory.**
>    - The extended pre-Bloch group P̂(C), defined by the lifted five-term and transfer relations, and the extended Bloch group B̂(C) = ker(ν: P̂(C) → C ∧ C).
>    - Combinatorial flattenings of an ideal triangulation.
>    - The extended Rogers dilogarithm R: P̂(C) → C/π²Z, and its well-definedness.
>    - The extended Bloch invariant β̂(M) ∈ B̂(C) of a true ideal triangulation with a strong flattening, which depends only on M.
>    - The exact sequence 0 → μ* → B̂(C) → B(C) → 0.
>    - The isomorphism λ: H₃(PSL(2, C)^δ; Z) → B̂(C), under which R becomes the characteristic class i(vol + i cs).
>    - For every oriented complete finite-volume hyperbolic 3-manifold M, i(Vol + i CS)(M) = R(β̂(M)) ∈ C/π²Z. Here CS is Meyerhoff's extension when M is not compact. For closed M it is defined from the Levi-Civita connection, imported through GeometricTopology Layer 7 (which takes it from HopfRinow Layer 1).
> 4. **Invariance.** β and β̂ are invariant under the allowed 2–3 moves, with flattening and branch data; the five-term relation is the algebraic form of a 2–3 move.
>
> Item 1 extends GeometricTopology Layers 7 and 11 in their own direction. Under PROTOCOL §15 its home is a roadmap "GeometricTopology, Part II: cusped hyperbolic 3-manifolds and ideal triangulations", with Layers 5, 7, 8 and 11 as prerequisites and QT.5 as a consumer. Until that roadmap exists, QT.5 plans item 1, as an extension of Layer 7.

**Inputs (line 87):**

> **Inputs.** `tauceti:TauCetiRoadmap/GeometricTopology#layer-7-riemannian-geometric-structures-and-volume`, `tauceti:TauCetiRoadmap/GeometricTopology#layer-5-dehn-surgery`, `tauceti:TauCetiRoadmap/GeometricTopology#layer-8-thurston-geometries-and-the-jsj--geometric-decomposition`, `Polylogarithms:P.1`, `Polylogarithms:P.2`, `K3BlochGroups:V.3`, `K3BlochGroups:V.4`, `K3BlochGroups:V.6`

**Acceptance (line 89):**

> **Acceptance.** Work out the figure-eight knot complement exactly, with its orientation:
> - two ideal tetrahedra with shapes z and w, whose edge equations reduce to z(z − 1)w(w − 1) = 1;
> - completeness forces z = w = ½ + (√3/2)i = e^{πi/3};
> - its Bloch invariant is 2[e^{πi/3}], and Vol = 2D(e^{πi/3}) = 2.0298832128…;
> - β̂ = [ω; 0, −1] − [ω⁻¹; 0, 1] with ω = e^{πi/3}, and vol + i cs = 2V₀ (Neumann 2004, Example 14.4, m004).
>
> Show that the five-term relation implements a 2–3 move. A numerical shape solution is insufficient.

**Source route (line 91):**

> **Source route.** Polylogarithms P.1–P.2 supply D, the five-term identity, the weight-two regulator and the ideal-tetrahedron volume. K3BlochGroups V.3, V.4 and V.6 supply the groups, Suslin's sequence and certified elements. Sources for this stage:
> - Thurston, *The Geometry and Topology of Three-Manifolds*, electronic version 1.1 (2002), §3.10 and §§4.1–4.4;
> - Neumann–Zagier, Topology 24 (1985) 307–332, §1 and Theorem 2.2;
> - Epstein–Penner, J. Differential Geom. 27 (1988) 67–80;
> - Prasad, Invent. Math. 21 (1973) 255–286, for the rigidity;
> - Neumann–Yang, Duke Math. J. 96 (1999), arXiv:math/9712224: Definition 2.5, Theorems 1.1–1.3, Proposition 4.3, Corollary 6.2 and §7;
> - Neumann, Geom. Topol. 8 (2004) 413–474, arXiv:math/0307092: Definitions 2.2, 2.4 and 3.1, Proposition 2.5, Theorems 2.6, 7.5, 12.1 and 14.2, Corollary 14.6 and Example 14.4;
> - Meyerhoff, "Hyperbolic 3-manifolds with equal volumes but different Chern–Simons invariants", LMS Lecture Note Ser. 112 (1986) 209–215, for CS of cusped manifolds.

**Known/conjectural boundary (line 93).** Keep the text and append:

> It is not known that every cusped hyperbolic 3-manifold has a positively oriented ideal triangulation: subdividing the Epstein–Penner decomposition may need flat tetrahedra. Statements therefore go through degree one ideal triangulations (β) and true ideal triangulations (β̂), as the sources do. Neumann 2004 identifies B̂(C) with H₃(PSL(2, C)^δ; Z), not with K₃^ind(C); a comparison with K₃^ind(C) through K3BlochGroups V.4 needs a source before it is stated. The A-polynomial of a knot and the AJ conjecture are not targets of this roadmap.

**2. `data/atlas.json`, QT.5.**
- `requires`: [QT.0, V.3, V.5] → [GT L7, GT L5, GT L8, P.1, P.2, V.3, V.4, V.6].
- Add the stage edges GT L7, GT L5, GT L8, P.1, P.2, V.4 and V.6 → QT.5. All are acyclic.
- Remove QT.0 → QT.5: no QT.5 target uses framed links or Kirby calculus.
- Remove V.5 → QT.5: no QT.5 target uses K₃(F_q), K₃(Z) or K₃(Q(i)). The stage's test is the figure-eight complement, over Q(√−3), not the Whitehead link. V.5 remains an ancestor through V.6.

**3. Packet.**
- Delete the request to V.5.
- Add requests by node id:
  - to V.4: `V.4/suslin-exact-sequence` and `V.4/cross-ratio`;
  - to V.6: `V.6/bloch-element-constructor`;
  - to GT L7: complete hyperbolic metrics and the Riemannian volume.
- Cite P.1 and P.2 by node id: `P.1/bloch-wigner-dilogarithm`, `P.1/bloch-wigner-five-term`, `P.2/hyperbolic-volume` and `P.2/weight-two-regulator`.

### Not done, and why
**K3BlochGroups V.5 itself is unchanged.** Nothing in QT.5 is owed to it.

## /7 (medium, duplicate): Polylogarithms P.2 is the only owner of the ideal-tetrahedron volume, and QT.5 keeps the manifold-level statements

### What the verifier corrected
Nothing. The review confirms the double plan and adds that nothing resolves it: RS-10 "is not in data/restructure and its review REV-RS-10 records 'needs changes'".

### State on main (31403074)
**Unchanged.**
- P.2, `content/campaign/Polylogarithms/README.md` line 31: "Develop the configuration/cross-ratio cocycle and hyperbolic-volume calculation used by Bloch to identify this map with the abstract regulator."
- QT.5, line 85: "Compare the real regulator with volume".
- No stage edge P.2 → QT.5.

**Changed since 24 September.**
- **The P.2 half is done.** The Polylogarithms blueprint, accepted and promoted on 25 September, has the node `Polylogarithms:P.2/hyperbolic-volume`:
  - it owns "vol I(z_1, …, z_4) = D(r(z_1, …, z_4))", with the five-term relation as additivity of volume;
  - it imports "Hyperbolic 3-space and its volume … from the Tau Ceti roadmap GeometricTopology, layer 7";
  - it records Milnor's Lobachevsky-function formula as a gap;
  - it says "the manifold-level comparison is ArithmeticQuantumTopology QT.5's", with the use "imports this identity … rather than proving it again".

  P.2's atlas stage still has no GT L7 edge.
- **The QT packet** requests P.2 for "the comparison of the Bloch-Wigner function with hyperbolic volume".
- **RS-10.** Round 2 was merged on 29 September (#3952) and is not accepted: REV-RS-10~2 is pending, and it is not in `data/restructure`.
  - Its QT.5 entry in `research/blueprint/restructure/RS-10.result.json` is `{"action": "keep", "reason": "Keep geometric Bloch classes, flattenings, Pachner invariance and volume/Chern–Simons comparison; K3BlochGroups supplies the algebraic regulator."}`.
  - `RS-10.md` line 103 repeats it.
  - It has no `owners` entry for the tetrahedron volume.

**Disclosure.** RS-10~2 is this session's own work (cc-39fac3). The maintainer's reviewer should weigh this edit accordingly. Its content is not reviewed or judged here; only the edit this finding needs is given.

### Fix
**1. README, QT.5.** Under /6: the P.2 import, and item 2's manifold-level identity vol(β(M)) = Vol(M), i.e. Vol(M) = Σ_j D(z_j) (Neumann–Yang §7, p. 13, and the proof of Lemma 4.2, p. 8, read).

**2. Polylogarithms README, P.2 (line 31).** Append to the paragraph:

> This layer is the only owner of the volume of an ideal tetrahedron, vol I(z₁, …, z₄) = D(r(z₁, …, z₄)), with hyperbolic 3-space and its volume imported from GeometricTopology Layer 7. ArithmeticQuantumTopology QT.5 imports it and owns the manifold-level statements.

**3. `data/atlas.json`.**
- P.2 → QT.5 (in /6's list).
- `Polylogarithms:P.2` `requires`: add GT L7, with the stage edge GT L7 → P.2. It is acyclic: there is no path from P.2 to GT L7. It records the import the P.2 node already names.

**4. `research/blueprint/restructure/RS-10.result.json`.**
- `layers["ArithmeticQuantumTopology:QT.5"]`: replace the entry with
  ```json
  {"action": "narrow",
   "keeps": "Cusped hyperbolic structures and ideal triangulations (an extension of GeometricTopology Layer 7), the Bloch and extended Bloch invariants of a hyperbolic 3-manifold with flattenings and Pachner invariance, and the manifold-level identities vol(beta(M)) = Vol(M) and R(beta-hat(M)) = i(Vol + i CS)(M).",
   "suppliedBy": ["Polylogarithms:P.2", "Polylogarithms:P.1"],
   "reason": "The volume of an ideal tetrahedron, D of its cross-ratio, is owned by Polylogarithms P.2 (node P.2/hyperbolic-volume), with the Bloch-Wigner function from P.1 and the weight-two regulator from P.2; K3BlochGroups V.3, V.4 and V.6 supply the groups, Suslin's sequence and certified elements. K3BlochGroups has no regulator stage."}
  ```
- `links`: add `{"source": "Polylogarithms:P.2", "target": "ArithmeticQuantumTopology:QT.5", "reason": "QT.5 imports the ideal-tetrahedron volume and the weight-two regulator instead of proving them."}` and the same record from `Polylogarithms:P.1` ("the Bloch-Wigner dilogarithm and its five-term identity").
- `owners`: add `{"target": "Volume of an ideal hyperbolic tetrahedron as the Bloch-Wigner dilogarithm of its cross-ratio", "owner": "Polylogarithms:P.2", "formerly": ["ArithmeticQuantumTopology:QT.5"]}`.
- **No §15 forwarding link is owed.** QT.5's consumers are QT.6 and HabiroNahmSeries HB.10. HB.10's blueprint request asks QT.5 for ideal triangulations, Neumann–Zagier matrices and gluing equations; QT.6 uses the complex volume. QT.5 keeps all of these.

**5. `RS-10.md`, line 103.** Replace the row with:

> | `ArithmeticQuantumTopology:QT.5` | narrow | Keeps cusped hyperbolic structures and ideal triangulations, the Bloch and extended Bloch invariants with flattenings and Pachner invariance, and the manifold-level identities vol(β(M)) = Vol(M) and R(β̂(M)) = i(Vol + i CS)(M). Suppliers: `Polylogarithms:P.2` (ideal-tetrahedron volume, weight-two regulator) and `Polylogarithms:P.1`. |

**6. Packet.**
- `QT.5/volume-and-chern-simons` and the new node `QT.5/bloch-invariant-and-volume` (/9) take `Polylogarithms:P.2/hyperbolic-volume` and `Polylogarithms:P.1/bloch-wigner-dilogarithm` as prerequisites.
- The request to P.2 names the node.

### Not done, and why
- **Milnor's formula stays P.2's own gap.** The P.2 node records the Lobachevsky-function formula for the volume of an ideal tetrahedron as a gap; it is not QT's.
- **Neumann–Yang's published numbering is not checked.** They number no stand-alone statement "D(β(M)) = Vol(M)". The identity is cited to §7 and the proof of Lemma 4.2 of the arXiv version (the Duke version was not seen).

## /8 (medium, missing): cusped hyperbolic 3-manifolds and ideal triangulations get an owner

### What the verifier corrected
Nothing. The review confirms both points:
- No atlas stage had ideal triangulations, cusped manifolds, or Thurston's gluing and completeness equations.
- Layer 7's volume and Mostow statement are for closed manifolds.

### State on main (31403074)
**GeometricTopology** (snapshot of 16 September; README lines 671–673):
- `hypVolume_indep (g g' : HyperbolicMetric M) [Closed M] (h : 3 ≤ dim M) … -- Mostow`;
- `hypVolume (M) [Closed M] …`.

Layer 11 has `IsTriangulable M := ∃ K, Nonempty (|K| ≃ₜ M)` for simplicial complexes.

**QT.5.** Line 85 reads "a source-admitted triangulated hyperbolic manifold", and line 89's test is the figure-eight complement.

**Assembled atlas.** A search finds ideal tetrahedra only in QT.5 and in the P.2 blueprint node `Polylogarithms:P.2/hyperbolic-volume` (/7). No stage has cusped manifolds, Mostow–Prasad or Epstein–Penner.

**Packet.**
- It has `QT.5/ideal-tetrahedron-and-shape` and `QT.5/gluing-and-completeness-equations`.
- The second states "A positively oriented solution of the gluing and completeness equations gives a complete finite-volume hyperbolic structure on the interior", but sources it to Neumann 2004 §3, which is not its source.
- Its `coverage` lists as remaining "Cusped hyperbolic three-manifolds, Mostow-Prasad rigidity and the theorem that a positively oriented solution gives the complete structure, which no layer of the atlas owns".

**Read in the sources.**
- **Thurston ch. 4** (electronic version 1.1).
  - §4.1, p. 48: the shape relations z₁z₂z₃ = −1 and 1 − z₁ + z₁z₂ = 0.
  - §4.2, pp. 49–50: "The hyperbolic structure extends over an edge e of M if and only if the similarity structure extends … The algebraic condition is 4.2.1. z(e₁) · z(e₂) · ··· · z(e_k) = 1", read in the universal cover of C*, with "4.2.2. arg z₁ + ··· + arg z_k = 2π".
  - §4.3, pp. 51–54: the figure-eight: "z(z − 1) w(w − 1) = 1", and completeness gives "w = z = ∛−1".
- **Thurston §3.10** (p. 42): "M is complete if and only if the similarity structure on each link of an ideal vertex is actually a Euclidean structure, or equivalently, if and only if the holonomy of these similarity structures consists of isometries."
- **Neumann–Zagier §1** (p. 307), for finite-volume M: "By Mostow rigidity the volume of M is a topological invariant".
- **Neumann–Yang.**
  - p. 3: "Epstein and Penner in [15] show that any non-compact M has a genuine ideal triangulation (they actually give an ideal polyhedral subdivision; … it is conceivable that one may need flat ideal tetrahedra …)".
  - §6, p. 12: the subdivision of the Epstein–Penner polyhedra.

### Fix
**1. Note for the maintainer: a new roadmap.** Under PROTOCOL §15, record "GeometricTopology, Part II: cusped hyperbolic 3-manifolds and ideal triangulations".
- Parent: `tauceti:TauCetiRoadmap/GeometricTopology`.
- Prerequisites: GT L5, GT L7 (first), GT L8 and GT L11.
- Consumer: ArithmeticQuantumTopology QT.5, and through it QT.6 and HabiroNahmSeries HB.10.
- Where it starts: where Layer 7 stops (volume and Mostow for closed manifolds) and where Layer 11 stops (simplicial triangulations).
- Its targets: item 1 of QT.5's text under /6, with the sources of QT.5's source route:
  - Thurston §3.10 and §§4.1–4.4;
  - Neumann–Zagier §1 and Theorem 2.2;
  - Epstein–Penner;
  - Prasad.

**2. Until it exists, QT.5 plans these targets** as item 1 of its text under /6, with GT L7 as its first input. The edges are given under /6.

**3. Packet.**
- Re-source `QT.5/gluing-and-completeness-equations` to Thurston §4.2 (4.2.1–4.2.2) and §3.10.
- Add `QT.5/cusped-hyperbolic-structure`: finite-volume hyperbolic structures on the interior of a compact manifold with torus boundary, with Mostow–Prasad invariance of volume, citing Neumann–Zagier §1 and Prasad 1973. It requests GT L7 (/6).
- Add `QT.5/epstein-penner-decomposition`: the ideal polyhedral decomposition and its subdivision, possibly with flat tetrahedra.
- Add `QT.5/neumann-zagier-symplectic`: Theorem 2.2, U J₂ₙ Uᵗ = 2(J₂ₕ 0; 0 0). It is also used by QT.6 (/10).

### Not done, and why
- **The Part II roadmap is not created.** A roadmap definition is outside this report's single deliverable; the note names it.
- **Prasad 1973 and Epstein–Penner 1988 were not read.** Only their bibliographic records were checked, with Crossref. Mostow–Prasad rigidity is stated as Neumann–Zagier §1 states it, and the decomposition as Neumann–Yang describe it. Reading both primaries stays an obligation.
- **Thurston ch. 4 has no single numbered theorem "positively oriented solution ⇒ complete structure".** The target combines §4.2 and §3.10, and says so.

## /9 (medium, missing): QT.5 names the extended Bloch group, flattenings, the extended Rogers dilogarithm and the Chern–Simons invariant, with Neumann's theorem

### What the verifier corrected
Nothing. The review confirms that none of these objects occurs in any atlas stage, and that QT.5 names "the extended-Bloch element" and "the specified Chern–Simons class" with no definition or source.

### State on main (31403074)
**README.** QT.5, line 85 is unchanged: "the Bloch/extended-Bloch element … Compare … the extended regulator with the specified Chern–Simons class". The source list has no Neumann entry.

**Packet.** New since the red team, decomposed from Neumann 2004 (arXiv:math/0307092v2):
- `QT.5/combinatorial-flattening`;
- `QT.5/five-term-and-pachner`;
- `QT.5/bloch-element-of-a-triangulation`;
- `QT.5/volume-and-chern-simons` (Proposition 2.5, Theorem 2.6).

It lacks:
- a definition of CS (closed: Levi-Civita connection; cusped: Meyerhoff);
- the manifold statement, Corollary 14.6;
- the exact sequence of Theorem 7.5;
- the real-regulator statement kept separate.

**Read in Neumann 2004** (Geom. Topol. 8 (2004) 413–474; Crossref-verified).
- Definitions 2.2 and 2.4 (pp. 417–418): P̂(C), and B̂(C) = ker ν.
- Definition 3.1 (pp. 421–422): combinatorial flattenings.
- Proposition 2.5 (p. 419): "R gives a well defined map R: Ĉ → C/π²Z".
- Theorem 2.6 (p. 420) and Theorem 12.1 (p. 459): λ: H₃(PSL(2, C); Z) → B̂(C) is an isomorphism, and R∘λ is the Cheeger–Chern–Simons class i(vol + i cs).
- Theorem 7.5 (p. 441): 0 → μ* → B̂(C) → B(C) → 0.
- Theorem 14.2 (p. 465): β̂(M).
- Corollary 14.6 (p. 469): "For any oriented complete finite volume hyperbolic 3-manifold M, i(vol + i cs)(M) = R(β̂(M)) ∈ C/π²Z, where cs(M) is Meyerhoff's extension of the Chern–Simons invariant if M is non-compact".
- Meyerhoff's extension is described on p. 469.

### Fix
**1. README, QT.5.** Items 2 and 3, and the boundary sentence on K₃^ind, in QT.5's text under /6. The real-regulator statement (item 2) is a separate, earlier item that needs none of item 3, as the finding asks. The source route lists Neumann 2004 and Meyerhoff (/6).

**2. Packet.**
- Add `QT.5/chern-simons-invariant`: for closed M, from the Levi-Civita connection, with a request to GT L7; for cusped M, Meyerhoff's extension as Neumann 2004 p. 469 gives it.
- Add `QT.5/bloch-invariant-and-volume`: Neumann–Yang, Definition 2.5, Theorems 1.1–1.2, §7.
- Add `QT.5/extended-bloch-exact-sequence`: Theorem 7.5.
- Add `QT.5/rogers-dilogarithm-and-complex-volume-of-M`: Corollary 14.6, with prerequisites `QT.5/bloch-element-of-a-triangulation`, `QT.5/volume-and-chern-simons` and `QT.5/chern-simons-invariant`.

### Not done, and why
- **B̂(C) ≅ K₃^ind(C) is not stated.** The finding asks for it, but Neumann 2004 never mentions K₃^ind; it identifies B̂(C) with H₃(PSL(2, C)^δ; Z). The comparison through K3BlochGroups V.4 stays an obligation until a source for it is read.
- **Meyerhoff's paper was not read.** It is not in Crossref; zbMATH has it as Zbl 0622.57009. Its definition is taken from Neumann 2004, p. 469.

## /10 (high, missing): QT.6 plans the bridge from ideal triangulations to GSWZ's Habiro modules

### What the verifier corrected
Nothing. The review confirms two things:
- HB.9 proves the Nahm-data half.
- Nothing supplies the topological input: the Neumann–Zagier datum, the Dimofte–Garoufalidis series and their invariance.

### State on main (31403074)
**README and atlas.**
- QT.6, line 99, is unchanged: "Define a selected convergent or formal state sum/integral with its contour, parameters and normalization. … Export only explicitly proven comparisons to HabiroNahmSeries and its arithmetic modules."
- `requires` is still [QT.4, QT.5, HB.5a, HB.9].

**Packet.**
- QT.6 has four nodes, from Garoufalidis–Zagier: the Kashaev invariant, the conjectured asymptotic series, the export boundary, and formal versus analytic asymptotics.
- There is no node for the Neumann–Zagier datum, the Dimofte–Garoufalidis series, their invariance or the GSWZ statement. Its gap "No state-integral source has been obtained" says so.
- Its requests to HB.4 and HB.9 name no consuming node.

**HabiroNahmSeries blueprint** (accepted and promoted 25 September).
- It has `HB.4/formal-gaussian-integration`: the Gaussian integration node is in HB.4, not HB.8.
- It has `HB.8/fgi-collection` and `HB.9/module-membership` (GSWZ Theorem 5).
- `HB.10/knot-matrices-and-the-topological-boundary` leaves topological invariance to QT.5–QT.7. It requests QT.5 for "Ideal triangulations, Neumann–Zagier matrices and gluing equations", which is the stage edge QT.5 → HB.10.

**Read in the sources.** Three points correct the finding's fix.
- **GSWZ's "main theorem" is Theorem 5** (arXiv:2412.04241v2, §1.7, p. 14): "Fix a symmetric matrix A with integer entries and a non-degenerate solution z of the Nahm equations with associated ξ. Then we have: Φ_{A,z}(q) ∈ 𝓗_{R[δ^{-1/2}],ξ}|_Δ." It is purely algebraic. The Chern–Simons reading is prose in §1.8 (pp. 16–17), not a separate theorem:
  - "The symplectic property of (A|B) the Neumann–Zagier matrix implies that when B is invertible over Z, then A = I − B⁻¹A is a symmetric N × N matrix with integer entries. Moreover, the Neumann–Zagier equations (45) are equivalent to the Nahm equations (41), and what's more the perturbative series at roots of unity defined by formal Gaussian integration syntactically matches that of the corresponding Nahm sum … and of the admissible series for general A."
  - "Theorem 5 contains the asymptotics of complex Chern–Simons theory when a 3-manifold with torus boundary has an (essential) ideal triangulation and a choice of quad with unimodular matrix B. While such a choice is not known to exist in general, it has been found for all knots with at most 14 crossings".
  - §1.5, p. 11: "the example coming from the figure eight knot, where ξ = 2[ζ_6]".
- **Topological invariance is proved only at q near 1.** Garoufalidis–Storzer–Wheeler (arXiv:2305.14884v2, a preprint) prove, as Theorem 1.1: "Φ^Ξ(ħ) is a topological invariant of a cusped hyperbolic 3-manifold". This is the series at q near 1:
  - it is independent of the non-degenerate quad (Theorem 5.1);
  - it is invariant under 2–3 moves among the regular refinements of the Epstein–Penner decomposition (Theorem 6.1);
  - changing the flattening multiplies it by e^{cħ}, c ∈ (1/8)Z (§4).

  At other roots of unity, independence is Dimofte–Garoufalidis's Conjecture 2.9 ("Quantum modularity and complex Chern–Simons theory", arXiv:1511.05628). Dimofte–Garoufalidis 2013 prove only the one-loop invariance (Theorems 1.3–1.4); the all-loop statement is their Conjecture 5.1.
- **Formal Gaussian integration is HB.4's**, as noted above.

### Fix
**1. README, QT.6, Construct and export (line 99).** Replace with the text below. It also serves /11, /14 and /21.

> **Construct and export.** Import, and do not construct again:
> - formal Gaussian integration and the Euler–Maclaurin, saddle-point and remainder estimates, from HabiroNahmSeries HB.4;
> - the collections Φ_{A,m} of a symmetric integral matrix, from HB.8;
> - GSWZ Theorem 5, from HB.9;
> - the modules H_{R,ξ}, from HabiroNumberFields HB.7;
> - the formal quantum pentagon identity, from HabiroCyclotomicCompletions HC.1;
> - the Kashaev invariant and the colored Jones polynomials, from QT.2;
> - ideal triangulations, shapes, the Neumann–Zagier symplectic property and the Bloch classes, from QT.5.
>
> Build:
> 1. **The Neumann–Zagier datum** of an ideal triangulation of a cusped hyperbolic 3-manifold, with a choice of quad and edge:
>    - integer matrices (𝐀|𝐁), the upper half of a matrix in Sp(2N, Q);
>    - a vector ν;
>    - a solution z of ∏_j z_j^{𝐀_ij}(1 − 1/z_j)^{𝐁_ij} = (−1)^{ν_i}.
>
>    Hence 𝐀𝐁ᵀ = 𝐁𝐀ᵀ, and 𝐁⁻¹𝐀 is symmetric when 𝐁 is non-degenerate.
> 2. **The perturbative series.** Dimofte–Garoufalidis's series at q near 1, Φ^Ξ(ħ) = ⟨f^Ξ_ħ(x, z)⟩_{x,Λ}, for det 𝐁 ≠ 0, and its extension to q near every root of unity. Both are defined by HB.4's formal Gaussian integration.
> 3. **Topological invariance at q near 1** (Garoufalidis–Storzer–Wheeler, Theorem 1.1):
>    - Φ^Ξ(ħ) is independent of the non-degenerate quad;
>    - it is invariant under 2–3 moves among the regular refinements of the Epstein–Penner decomposition;
>    - it is determined up to the factor e^{cħ}, c ∈ (1/8)Z, that a change of flattening introduces.
>
>    At the other roots of unity, independence of the triangulation is Dimofte–Garoufalidis's Conjecture 2.9, and is labelled conjectural.
> 4. **The passage to Nahm data.** When 𝐁 is invertible over Z, A := I − 𝐁⁻¹𝐀 is a symmetric integral matrix, the Neumann–Zagier equations are equivalent to the Nahm equations of A, and the perturbative series match GSWZ's series for A.
> 5. **The corollary.** Take an ideal triangulation with a quad whose 𝐁 is unimodular, and let ξ be the Bloch class of the geometric solution (QT.5), assumed non-degenerate (δ ≠ 0) as Theorem 5 requires. Then the collection of perturbative series lies in H_{R[δ^{−1/2}],ξ}|_Δ, with R, δ and Δ as in HB.9: this is GSWZ Theorem 5 applied through item 4. The unimodular-𝐁 triangulation is a hypothesis, since it is not known to exist in general.
> 6. **The figure-eight knot**, with ξ = 2[ζ_6].
> 7. **State integrals.**
>    - Faddeev's quantum dilogarithm Φ_b: its integral definition, the factorisation as a quotient of q-Pochhammer products for Im b² > 0, its zeros and poles, its behaviour at infinity, the inversion relation, the functional equations, unitarity, the operator pentagon, the Fourier transforms, the integral pentagon, and the asymptotics as b → 0.
>    - The Andersen–Kashaev partition function of a shaped ideal triangulation, as a tempered distribution, and its invariance under shaped 3–2 Pachner moves.
>    - Two statements are conjectural and labelled so: the relation of this partition function to the perturbative series of item 2, which Garoufalidis–Storzer–Wheeler state as a conjecture; and Andersen–Kashaev's volume conjecture for it, which they prove for 4_1 and 5_2.
>
> Relate critical points to gluing equations, and claim an analytic asymptotic expansion only with its error analysis. Export to HabiroNahmSeries only explicitly proved comparisons: HB.10's knot-derived Nahm data get their topological meaning from items 1–5.

**2. Inputs (line 101).** Replace with:

> **Inputs.** `ArithmeticQuantumTopology:QT.2`, `ArithmeticQuantumTopology:QT.5`, `HabiroNahmSeries:HB.4`, `HabiroNahmSeries:HB.8`, `HabiroNahmSeries:HB.9`, `HabiroNumberFields:HB.7`, `HabiroCyclotomicCompletions:HC.1`

The edges are given under /21.

**3. Acceptance (line 103).** Keep the text and append:

> For the figure-eight knot, give a Neumann–Zagier datum with 𝐁 invertible over Z and its Nahm matrix I − 𝐁⁻¹𝐀. Compare its series with those of HabiroNahmSeries HB.10's datum A_{4_1} = (1 1; 1 1) (GSWZ Remark 4.2), and conclude membership in H_{R[δ^{−1/2}],ξ}|_Δ with ξ = 2[ζ_6].

**4. Source route (line 105).** Replace with:

> **Source route.**
> - GSWZ, arXiv:2412.04241v2: §1.5 (p. 11), §1.7 (Theorem 5, p. 14) and §1.8 (pp. 15–17).
> - Neumann–Zagier, Topology 24 (1985), Theorem 2.2.
> - Dimofte–Garoufalidis, *The quantum content of the gluing equations*, Geom. Topol. 17 (2013) 1253–1315 (doi:10.2140/gt.2013.17.1253; arXiv:1202.6268v2): Definitions 1.1 and 1.9, §2.3, Theorems 1.3–1.4, Conjecture 5.1.
> - Dimofte–Garoufalidis, *Quantum modularity and complex Chern–Simons theory*, Commun. Number Theory Phys. 12 (2018) 1–52 (doi:10.4310/cntp.2018.v12.n1.a1; arXiv:1511.05628): Definition 2.5, Conjecture 2.9.
> - Garoufalidis–Storzer–Wheeler, *Perturbative invariants of cusped hyperbolic 3-manifolds*, arXiv:2305.14884v2 (preprint): (7), Theorems 1.1, 5.1 and 6.1, §4.
> - Garoufalidis–Zagier, *Asymptotics of Nahm sums at roots of unity*, Ramanujan J. 55 (2021) 219–238 (doi:10.1007/s11139-020-00266-x), for the matching.
> - Andersen–Kashaev, *A TQFT from quantum Teichmüller theory*, Comm. Math. Phys. 330 (2014) 887–934 (doi:10.1007/s00220-014-2073-2; arXiv:1109.6295v2): Theorems 4, 5 and 7, (28), §10.1, Conjecture 1, Appendix A ((42)–(58), §13.4).
> - Faddeev–Kashaev–Volkov, Comm. Math. Phys. 219 (2001) 199–219 (doi:10.1007/s002200100412; arXiv:hep-th/0006156), §6.

**5. Known/conjectural boundary (line 107).** Keep the text and append:

> The perturbative series at roots of unity other than 1 are not known to be topological invariants, and a triangulation with unimodular 𝐁 is not known to exist in general.

**6. Packet.**
- Add QT.6 nodes:
  - `nz-datum`;
  - `perturbative-series` (DG Definition 1.9 and DG2 Definition 2.5);
  - `invariance-at-q-near-1` (GSW Theorem 1.1, with DG2 Conjecture 2.9 as a labelled conjecture);
  - `nz-to-nahm` (GSWZ §1.8);
  - `perturbative-series-in-habiro-modules` (the corollary);
  - `figure-eight-perturbative`.
- Their prerequisites: `QT.5/neumann-zagier-symplectic` (/8), `HabiroNahmSeries:HB.4/formal-gaussian-integration`, `HB.8/fgi-collection`, `HB.9/module-membership` and `HabiroNumberFields:HB.7/the-global-module`.
- The requests to HB.4 and HB.9 then name these nodes, and a request to HabiroNumberFields HB.7 is added.

### Not done, and why
The finding's items (2)–(3) are narrowed to what the sources prove. Invariance is proved at q near 1 only, up to e^{cħ}; at other roots of unity it is a conjecture. GSWZ's Chern–Simons statement is their prose in §1.8, so the corollary of item 5 is QT.6's own and is proved from Theorem 5 and item 4, as that prose says. Garoufalidis–Zagier 2021 was not read; its bibliographic record was checked with Crossref, and GSWZ's description of it is what is cited.

## /11 (medium, duplicate): QT.6 owns every identification of a knot series with a topological invariant, and imports HB.4 and HB.8

### What the verifier corrected
Nothing. The review confirms both overlaps:
- HB.10 undertakes QT.6's topological content.
- QT.6 plans its own asymptotics without HB.4 or HB.8.

### State on main (31403074)
**README and atlas, unchanged.**
- HB.10, `content/campaign/HabiroNahmSeries/README.md` line 70: "For knot-related perturbative series, distinguish the formal series theorem from the assertion that the series represents a topological invariant or a particular Chern–Simons quantity. Prove the identification and independence of presentation whenever that stronger assertion is included; membership of a series in a Habiro module alone does not prove quantum modularity or topological invariance."
- QT.6, line 99: as under /10.
- There is no HB.4 → QT.6 or HB.8 → QT.6 edge.

**HabiroNahmSeries blueprint**, accepted and promoted 25 September. It has already narrowed HB.10. Its node `HB.10/knot-matrices-and-the-topological-boundary` says the theorems give membership, and "do NOT give that the series is a topological invariant, that it is independent of the triangulation, that it computes a Chern–Simons quantity, or that the knot invariant is quantum modular. Those are ArithmeticQuantumTopology's (QT.5 for triangulations and Pachner moves, QT.6 for the state-integral identification, QT.7 for quantum modularity), which import this roadmap and not conversely". The asymptotic toolkit is in HB.4's nodes:
- `HB.4/euler-maclaurin-with-remainder`;
- `HB.4/formal-gaussian-integration`;
- `HB.4/radial-asymptotic-expansion`.

The HB.10 README sentence has not caught up.

### Fix
**1. HabiroNahmSeries README, HB.10 (line 70).** Replace the sentence quoted above with:

> Knot-derived Nahm matrices, such as A_{4_1} = (1 1; 1 1) and the matrices of 5_2 and the (−2,3,7) pretzel knot (GSWZ Remark 4.2), are treated here as formal Nahm data: HB.9 puts their series in Habiro modules. Their identification with invariants of the knot (topological invariance, independence of the triangulation, the Chern–Simons meaning) is imported from ArithmeticQuantumTopology QT.6 and is not proved here. Membership of a series in a Habiro module alone proves neither quantum modularity nor topological invariance.

**2. QT.6.** QT.6's text under /10 imports HB.4 and HB.8, and owns items 1–5, which are the identification, and item 7, which is specific to state integrals. The atlas gets HB.4 → QT.6 and HB.8 → QT.6 (under /21; both acyclic).

**3. No QT.6 → HB.10 edge.** The finding makes it conditional on HB.10 stating the identification, and after item 1 HB.10 does not. The existing blueprint edge QT.5 → HB.10 stays.

**4. Packet.** The requests to HB.4 and HB.9 name the QT.6 nodes of /10.

### Not done, and why
The AUDIT-14 `duplicates` records in `data/library-coverage.json` are audit records, and are not edited here. Once the two README edits are applied they no longer describe a live duplication.

## /12 (medium, missing): the Kashaev invariant in QT.2, and the volume conjecture with its proved cases in QT.7

### What the verifier corrected
Nothing. The review confirms that neither the Kashaev invariant nor the volume conjecture occurs in the roadmap text, and that QT.7 names no proved case.

### State on main (31403074)
**README and atlas.**
- QT.2 (line 43) and QT.7 are unchanged. QT.7's line 113 reads "Formulate quantum modularity, refined volume and arithmetic resurgence conjectures …", and its line 119 "Primary-source selection for each proved quantum-modular or asymptotic example".
- There is no QT.2 → QT.7 edge.

**Packet.**
- `QT.6/the-kashaev-invariant-and-the-function-on-the-rationals` states the Kashaev invariant and the Murakami–Murakami identification, from Garoufalidis–Zagier §1. Its prerequisites are QT.2 nodes and HC.3.
- `QT.7/the-quantum-modularity-conjecture` and `QT.7/the-example-ledger`.
- The gap "The quantum modularity conjecture is proved for no hyperbolic knot here".
- The unified Kashaev invariant in Ẑ[q] and the proved cases are missing.

**Read in the sources.**
- **AE-HABIRO §7.1** (p. 25): "The right-hand side is known as the Kashaev invariant of K at ζ … J_K(1, q) ∈ Ẑ[q] may be regarded as a unified Kashaev invariant."
- **Murakami–Murakami** (arXiv:math/9905075v2).
  - Theorem 4.9: "For any link L and any integer N ≥ 2, ⟨L⟩_N and J_N(L) coincide".
  - Conjecture 5.1: "For any knot K, ‖K‖ = (2π/v₃) lim_{N→∞} log|J_N(K)|/N".
  - Remark 5.3: the conjecture fails for split links.
- **Kashaev 1997**, (1.1): "2π log|⟨L⟩| ∼ N V(L)".
- **Garoufalidis–Zagier** (arXiv:2111.06645v3; SIGMA 20 (2024) 055).
  - (1.1): "⟨K⟩_N ∼ N^{3/2} e^{v(K)N} Φ^{(K)}(2πi/N)".
  - (1.6): the quantitative quantum modularity conjecture.
  - p. 11: "will give a complete proof in the case of the 4₁ knot in Section 8. (This case and a few others were proven independently by Bettin and Drappeau [6].)"
- **Bettin–Drappeau**, Theorem 1: "Let K≠7₂ be a hyperbolic knot with at most 7 crossings. Then Conjecture 1 holds for K".
- **Andersen–Hansen**, Theorem 1: "J′_K(r) ∼ 3^{−1/4} r^{3/2} exp((r/2π) Vol(K)). As a corollary we obtain the volume conjecture for the figure 8 knot."
- **Ohtsuki 2016**, Theorem 1.1: the full expansion of ⟨5₂⟩_N.
- **Ohtsuki–Yokota 2018** and **Ohtsuki 2017**, abstracts: the expansions for the knots with six crossings (with "the volume conjecture for these knots") and for the hyperbolic knots with seven crossings.

### Fix
**1. README, QT.2.** The Kashaev-invariant bullet of QT.2's text under /3, item 4.

**2. README, QT.7, Construct and export (line 113).** Replace with the text below. It also serves /13, /15 and /17.

> **Construct and export.** Import:
> - from QSeriesPartitionsAndMockModularForms QM.5: Zagier's definition of a quantum modular form, Kontsevich's strange series with the strange identity, and the Lawrence–Zagier examples;
> - from QT.2: the Kashaev invariant ⟨K⟩_N and the unified Kashaev invariant J_K(1, q) ∈ Ẑ[q];
> - from QT.5: the complex volume;
> - from QT.6: the perturbative series.
>
> State exactly, and label as conjectures:
> 1. **The volume conjecture** (Kashaev; Murakami–Murakami, Conjecture 5.1): ‖K‖ = (2π/v₃) lim_{N→∞} log|J_N(K)|/N for every knot K, where ‖K‖ is the simplicial volume. For hyperbolic K this reads 2π lim_{N→∞} log|⟨K⟩_N|/N = Vol(S³ ∖ K), with the cusped volume of QT.5. The analogue fails for split links.
> 2. **The asymptotic expansion** ⟨K⟩_N ∼ N^{3/2} e^{v(K)N} Φ^{(K)}(2πi/N) to all orders, with the arithmeticity conjecture for its coefficients.
> 3. **Zagier's quantum modularity conjecture for the Kashaev invariant**, in Garoufalidis–Zagier's form (1.6) and in Bettin–Drappeau's form (their Conjecture 1), with the conversion between their conventions.
> 4. **Garoufalidis–Zagier's refinements**, each labelled as the source labels it. Their matrix invariant Φ_α(h) has as (σ₀, σ₁) entry the expansion of the Kashaev invariant at e^{2πiα}, as an element of the Habiro ring, and its columns are fundamental solutions of a linear q-difference equation. The refinements are this invariant, the SL₂(Z)-cocycle W_γ (whose extension to a smooth function is conjectural), and the refined quantum modularity conjecture.
>
> Proved cases, each with its primary source and exact family:
> - **the figure-eight knot 4_1:** the volume conjecture with its N^{3/2} term (Andersen–Hansen, Theorem 1), and Zagier's conjecture (Garoufalidis–Zagier §8; Bettin–Drappeau);
> - **5_2:** the full asymptotic expansion (Ohtsuki 2016, Theorem 1.1);
> - **the knots with six crossings:** the asymptotic expansions and the volume conjecture (Ohtsuki–Yokota 2018);
> - **the hyperbolic knots with seven crossings:** the asymptotic expansions (Ohtsuki 2017);
> - **every hyperbolic knot K ≠ 7_2 with at most seven crossings:** Zagier's conjecture (Bettin–Drappeau, Theorem 1).
>
> Maintain separate proved example theorems and conjectural families. Build a reproducible example ledger linking cyclotomic coefficients, WRT values, Bloch regulators and admissible asymptotic comparisons.

**3. QT.7, Inputs (line 115).** Replace with:

> **Inputs.** `ArithmeticQuantumTopology:QT.6`, `ArithmeticQuantumTopology:QT.2`, `QSeriesPartitionsAndMockModularForms:QM.5`

**4. QT.7, Source route (line 119).** Replace with:

> **Source route.**
> - Kashaev, Lett. Math. Phys. 39 (1997) 269–275 (doi:10.1023/A:1007364912784; arXiv:q-alg/9601025), (1.1).
> - Murakami–Murakami, Acta Math. 186 (2001) 85–104: Theorem 4.9, Conjecture 5.1, Remark 5.3.
> - Garoufalidis–Zagier, *Knots, perturbative series and quantum modularity*, SIGMA 20 (2024) 055 (doi:10.3842/SIGMA.2024.055; arXiv:2111.06645v3): §1 ((1.1), (1.6)), §2.2, §4.5, §8.
> - Bettin–Drappeau, Math. Ann. 382 (2022) 1631–1679 (doi:10.1007/s00208-021-02288-2; arXiv:1905.02045v3): Conjecture 1, Theorem 1.
> - Andersen–Hansen, J. Knot Theory Ramifications 15 (2006) 479–548 (doi:10.1142/S0218216506004555; arXiv:math/0506456): Theorem 1.
> - Ohtsuki, Quantum Topol. 7 (2016) 669–735 (doi:10.4171/QT/83): Theorem 1.1.
> - Ohtsuki–Yokota, Math. Proc. Cambridge Philos. Soc. 165 (2018) 287–339 (doi:10.1017/S0305004117000494).
> - Ohtsuki, Internat. J. Math. 28 (2017) 1750096 (doi:10.1142/S0129167X17500963).
> - Zagier, *Quantum modular forms*, Clay Math. Proc. 11 (2010) 659–675: Example 5 and its Conjecture (36), for the knot case.
>
> AE-HABIRO alone does not establish these conjectures.

**5. `data/atlas.json`.** QT.7 `requires`: [QT.6] → [QT.6, QT.2, QM.5]. Add the stage edges QT.2 → QT.7 and QM.5 → QT.7 (/13). Both are acyclic.

**6. Packet.**
- **Move the Kashaev node to QT.2.** Move `QT.6/the-kashaev-invariant-and-the-function-on-the-rationals` to QT.2 as `QT.2/kashaev-invariant`. Its prerequisites are only QT.2 nodes and HC.3, so the move closes no cycle. Add to it the unified Kashaev invariant J_K(1, q) (AE-HABIRO §7.1) and Murakami–Murakami's Theorem 4.9.
- **New QT.7 nodes:**
  - `volume-conjecture` (Murakami–Murakami Conjecture 5.1 with Remark 5.3);
  - `proved-cases`, with the sources above.
- **The gap "The quantum modularity conjecture is proved for no hyperbolic knot here" is answered** by Bettin–Drappeau Theorem 1 and Garoufalidis–Zagier §8. The ledger's asymptotic column can then be labelled proved for 4_1 and 5_2.

### Not done, and why
**Some of these sources were read only in part.** For Ohtsuki–Yokota 2018 and Ohtsuki 2017 only the abstracts were readable, so their main theorems stay to be read. The published numbering of Murakami–Murakami, Bettin–Drappeau and Andersen–Hansen was not checked: the cited numbers are those of the arXiv versions. Murakami–Yokota's book (SpringerBriefs Math. Phys. 30, 2018), which gives Ekholm's proof for 4_1, was not readable and is not cited.

## /13 (medium, duplicate): QM.5 owns quantum modular forms and their non-knot examples; QT.7 owns the knot statements

### What the verifier corrected
Nothing. The review confirms that QT.7 and QM.5 are both prospective owners, that neither defines a quantum modular form, and that no edge joins them.

### State on main (31403074)
**README and atlas, unchanged.**
- QM.5, `content/campaign/QSeriesPartitionsAndMockModularForms/README.md` line 77: "Develop source-scoped partition congruences, traces/special values and quantum modular examples, linking Habiro and ArithmeticQuantumTopology through exact radial-limit statements."
- QT.7, line 113.
- The only QT/QM edge is QT.4 → QM.5.

**QM blueprint packet** (`research/blueprint/packets/QSeriesPartitionsAndMockModularForms.json`; unreviewed, last changed 27 September). It already has the QM half of the split:
- `QM.5/quantum-modular-form` (Zagier's canonical definition) and `QM.5/quantum-modular-cocycle`;
- `QM.5/kontsevich-strange-series`, `QM.5/strange-identity` and `QM.5/kontsevich-quantum-modular`;
- the Lawrence–Zagier nodes (`lawrence-zagier-radial-limit`, `-ohtsuki-expansion`, `-theta-transformation`), `QM.5/poincare-sphere-quantum-modular` and `QM.5/poincare-sphere-unified-invariant-radial-limit`.

**QT packet.** Its request to QM.5 runs the wrong way: "The consumer of this roadmap's quantum modularity statements".

**Read in Zagier, "Quantum modular forms"** (Clay Math. Proc. 11 (2010)):
- the definition, p. 660;
- Kontsevich's function, Example 3, p. 668;
- the Kashaev invariant of 4_1, Example 5 (pp. 670–673), which Zagier says "is not a quantum modular form in the strict sense of the definition we gave in the introduction … because the associated cocycle is no longer analytic or even continuous".

So the knot statements are a distinct subject and belong in QT.7. The split is also consistent with PLAN-HABIRO decision D6, which excludes "quantum modularity beyond QT.7" from the Habiro family.

### Fix
**1. QM README, QM.5, Construct and export (line 77).** Replace the first sentence with:

> Develop source-scoped partition congruences, traces/special values and quantum modular forms: Zagier's definition (*Quantum modular forms*, Clay Math. Proc. 11 (2010) 659–675), Kontsevich's strange series and the strange identity (Zagier, Topology 40 (2001) 945–960, doi:10.1016/S0040-9383(00)00005-7), and the Lawrence–Zagier examples of the Poincaré sphere (Asian J. Math. 3 (1999) 93–108, doi:10.4310/AJM.1999.v3.n1.a5), linking Habiro and ArithmeticQuantumTopology through exact radial-limit statements. QM.5 owns the general notion and these examples; ArithmeticQuantumTopology QT.7 imports them and owns the statements about knots (the quantum modularity of the Kashaev invariant and its refinements).

The rest of the paragraph stays.

**2. QT.7.** QT.7's text under /12 imports from QM.5.

**3. `data/atlas.json`.** QM.5 → QT.7 (/12, item 5). It is acyclic: QM.5 requires QT.4, and QT.7 has no consumers.

**4. QT packet.** Replace the request to QM.5 with a request from QT.7 for `QM.5/quantum-modular-form` and `QM.5/quantum-modular-cocycle`. `QT.7/the-quantum-modularity-conjecture` takes them as prerequisites.

**5. QM packet**, for its blueprint job and review. Record the owner split in QM.5's `coverage` note.

### Not done, and why
Nothing. No new statement is made: the QM.5 nodes already carry the statements, sourced to the papers above, which were read for this fix. One correction to the finding: it gives Lawrence–Zagier as pp. 93–107, but Crossref and the printed header give 93–108.

## /14 (medium, missing): QT.6 plans Faddeev's quantum dilogarithm and the Andersen–Kashaev state integral; the formal pentagon has one owner

### What the verifier corrected
Nothing. The review confirms the finding, and notes that the formal pentagon is planned only in an unaccepted draft, which does not discharge the need.

### State on main (31403074)
**Atlas.** A search of the assembled atlas finds Faddeev's quantum dilogarithm in no stage. The only "Faddeev" hits are Delone–Faddeev in ArithmeticStatistics.

**The draft `research/blueprint/roadmaps/AnalyticHabiroStack.json`** (status draft, not in the atlas), stage HS.2:
- Inputs: "The quantum pentagon identity is proved here, following Faddeev–Kashaev."
- Targets: "The route adopted here is the quantum pentagon identity for (x;q)_∞ (Faddeev–Kashaev), transported to the rapid-decay torsors".

**PLAN-HABIRO** (`research/blueprint/plans/HABIRO.md`).
- Decision D11 makes HC.1 the owner of "the elementary q-analogue toolkit", by default.
- The §6.1 HC.1 row lists Pochhammer symbols, the q-binomial theorem and Euler's identities, but not the pentagon.
- The accepted HabiroCyclotomicCompletions blueprint records D11 as unsettled: "Settle D11 once: either apply PLAN-HABIRO §6.1 to the HC.1 stage text and have QM.0 import the toolkit from HC.1, or revise D11 so that QM.0 owns it".

**QT packet.** Its gap says "the non-compact quantum dilogarithm is unread".

**Read in the sources.**
- **Faddeev–Kashaev** (arXiv:hep-th/9310070; Mod. Phys. Lett. A 9 (1994) 427–434, doi:10.1142/S0217732394000447):
  - (1.4): "Ψ(x) = ∏_{n=1}^∞ (1 − xθⁿ)";
  - (2.1): "Û V̂ = θ V̂ Û";
  - (2.4), the pentagon: "Ψ(V̂)Ψ(Û) = Ψ(Û)Ψ(−ÛV̂)Ψ(V̂)".
- **Andersen–Kashaev**, Appendix A:
  - (42): the integral;
  - (44): Φ_b(z) = (e^{2π(z+c_b)b}; q²)_∞/(e^{2π(z−c_b)b⁻¹}; q̄²)_∞ for Im b² > 0;
  - (45): zeros and poles; (46): behaviour at infinity;
  - (47): inversion; (48): functional equations; (49): unitarity;
  - (50): the operator pentagon "Φ_b(p)Φ_b(q) = Φ_b(q)Φ_b(p+q)Φ_b(p)";
  - (56)–(58): Fourier transforms;
  - §13.4, Proposition 6 and Corollary 1: the asymptotics as b → 0.
- **The integral (Fourier-form) pentagon** is in Faddeev–Kashaev–Volkov §6.5.
- **Andersen–Kashaev's partition function**:
  - Theorem 4 and (28);
  - a tempered distribution (Theorem 7);
  - invariant under shaped 3–2 Pachner moves (§10.1).

### Fix
**1. QT.6.** Item 7 and the source route of QT.6's text under /10.

**2. One owner for the formal pentagon: the owner of the elementary q-toolkit under D11.** By PLAN-HABIRO's default that is HC.1.
- `research/blueprint/plans/HABIRO.md`, §6.1, HC.1 row. Between "(V5A2 Defs 5.4–5.5, the Λ-structure imported from QW.1 by HB.8, not here)" and ". Requirements unchanged. |", insert:
  > ; the quantum pentagon identity of Faddeev–Kashaev for Ψ(x) = ∏_{n≥1}(1 − xθⁿ) in variables with ÛV̂ = θV̂Û, Ψ(V̂)Ψ(Û) = Ψ(Û)Ψ(−ÛV̂)Ψ(V̂) (Mod. Phys. Lett. A 9 (1994), (2.1)–(2.4))

  The row then reads "… (V5A2 Defs 5.4–5.5, the Λ-structure imported from QW.1 by HB.8, not here); the quantum pentagon identity … (2.1)–(2.4)). Requirements unchanged. |".
- `research/blueprint/roadmaps/AnalyticHabiroStack.json`, stage HS.2, `description`. Replace "The quantum pentagon identity is proved here, following Faddeev–Kashaev." with:
  > The quantum pentagon identity (Faddeev–Kashaev) is imported from HC.1, which owns it with the elementary q-toolkit (PLAN-HABIRO decision D11).

  HS.2 already requires HC.1, so no edge changes.
- `research/blueprint/plans/HABIRO.md`, §1.3, the Faddeev–Kashaev row (line 139). Its last cell "HS.2" becomes "HC.1 (owner), HS.2, ArithmeticQuantumTopology QT.6".
- QT.6 imports it from HC.1 (/10), with the edge HC.1 → QT.6 (/21; acyclic).
- If D11 is settled the other way, the pentagon goes with the toolkit, and these edits name QM.0 instead of HC.1. That is the choice the HabiroCyclotomicCompletions blueprint leaves open.

**3. QT packet.**
- Add `QT.6/faddeev-quantum-dilogarithm` (Andersen–Kashaev Appendix A; Faddeev–Kashaev–Volkov §6) and `QT.6/andersen-kashaev-partition-function` (Theorems 4 and 7, §10.1).
- Close the gap "No state-integral source has been obtained": the sources are now read.

### Not done, and why
- **HC.1's own atlas text is unchanged.** Putting the toolkit there is the settlement of D11 itself, which is outside this finding.
- **Not read:** Faddeev 1995 (hep-th/9504111, Lett. Math. Phys. 34 (1995) 249–254), which GSWZ cite for Φ_b; only its identifiers were checked. Of Andersen–Kashaev only the arXiv v2 was read; the journal version was not.

## /15 (medium, missing): resurgence becomes a stated non-goal of QT.7

### What the verifier corrected
Nothing. The review confirms that no atlas stage defines Gevrey-1 series, the Borel transform, resurgent functions, Stokes constants or lateral Borel summation.

### State on main (31403074)
QT.7, line 113, reads "Formulate quantum modularity, refined volume and arithmetic resurgence conjectures …". A search of the assembled atlas for "resurgen", "Borel summ", "Borel transform", "Stokes constant" and "Gevrey" finds only QT.7. The QT packet states no resurgence claim.

### Fix
The finding's second option is taken.

**1. README, QT.7.** QT.7's text under /12 drops "arithmetic resurgence" from the targets. Append to QT.7's **Known/conjectural boundary** (line 121):

> Resurgence is not a target of this roadmap. Its statements for quantum knot invariants (Garoufalidis–Gu–Mariño, *The resurgent structure of quantum knot invariants*, Comm. Math. Phys. 386 (2021) 469–493, doi:10.1007/s00220-021-04076-0) need Gevrey-1 series, the Borel transform, resurgent functions, Stokes constants and lateral Borel sums. No roadmap of the atlas owns these; they are the subject of a theory of their own (for example Sauzin, *Introduction to 1-summability and resurgence*, arXiv:1405.0356).

**2. Packet.** No change.

### Not done, and why
The first option, planning the resurgence foundations in QT.7, is not taken. It would put a general analytic theory (Écalle's) inside a knot-invariant stage, against PROTOCOL §15's rule that a general notion is planned once, in the roadmap that owns it. No atlas roadmap owns it now. Garoufalidis–Gu–Mariño and Sauzin were checked by their bibliographic records only; no statement is taken from them.

## /16 (medium, missing): Habiro's two-variable invariant and the Melvin–Morton–Rozansky theorem go into QT.2; Garoufalidis–Wheeler's lift is recorded as PLAN-HABIRO D7(ii) sets

### What the verifier corrected
Nothing. The review confirms three points:
- The QT document mentions neither Habiro cohomology nor the relative Habiro ring.
- The atlas has no QT-to-HabiroRings edge, "although the programme's own plan file records the follow-up".
- The two Tau Ceti Alexander declarations exist at the pin.

### State on main (31403074)
**QT.** QT.2 is unchanged and has no HabiroRings edge.

**PLAN-HABIRO** (`research/blueprint/plans/HABIRO.md`; accepted by REV-PLAN-HABIRO).
- §9, D7(ii): "Add it to QT as a stage requiring HR.1? *Default: record as a QT follow-up; no stage yet.*"
- D7(iii), for Bouis–Gazda: "*Default: not included*".
- §6.6: "Decision D7 asks whether Garoufalidis–Wheeler's lift of the colored Jones polynomial (arXiv:2603.01619) extends QT.2/QT.4."

**QT packet.** QT.2's `coverage` lists as remaining "The two-variable and Melvin-Morton-Rozansky boundary material, which the source treats and which the stage text does not mention."

**Tau Ceti f790474, re-read.**
- `TauCeti.KnotTheory.alexander` (`TauCeti/KnotTheory/Alexander.lean:312`): `T (-((Fintype.card ι / 2 : ℕ) : ℤ)) * (alexanderMatrix V).det`.
- `burauAlexander` (`KnotTheory/Burau/Alexander.lean:329`).

**Read in the sources.**
- **AE-HABIRO §7.**
  - §7.1 (p. 24): Λ, and "J_K(t, q) ∈ Λ the two-variable colored Jones invariant".
  - Proposition 7.2 (p. 26): "The map γ is injective and non-surjective".
  - pp. 26–27: Rozansky's expansion J^MMR_K = Σ_n P_{K,n}(t)/Δ_K(t)^{2n+1} (q − 1)ⁿ, and "Melvin and Morton's conjecture (essentially) states that J^MMR_K|_{q=1} = 1/Δ_K(t)".
  - Conjectures 7.3–7.5 (p. 27).
- **Garoufalidis–Wheeler** (arXiv:2603.01619v1, 2 March 2026).
  - Theorem 1.3: a map K ↦ J_K(t, q) into the Habiro ring of Z[t^{±1}, Δ_K(t)⁻¹]/Z[t^{±1}], with J_K(q^{n−1}, q) = J_{K,n}(q).
  - Corollary 1.5: "(which proves Habiro's conjecture)", citing Conjecture 7.4.
  - Corollary 1.7: the Ohtsuki-type invariants of 0-surgeries.
- **Bar-Natan–Garoufalidis**, Theorem 1, from the author preprint of 15 January 1996.

### Fix
**1. QT.2.** The [/16] bullet and the boundary paragraph of QT.2's text under /3 (items 4 and 7):
- J_K(t, q) ∈ Λ, γ and Proposition 7.2, Rozansky's rationality theorem, and the Melvin–Morton–Rozansky theorem, with the Alexander polynomial imported from GeometricTopology Layer 4 (GT L4 → QT.2 is added under /3);
- Habiro's Conjectures 7.3–7.5, labelled as conjectures;
- Garoufalidis–Wheeler's lift, recorded as a follow-up that would require HabiroRings HR.1.

**2. No new stage and no HR.1 edge.** This follows D7(ii), whose default is "record as a QT follow-up; no stage yet". The finding allows it: "If no stage is added, record the paper in the document as a named follow-up with this dependency, as PLAN-HABIRO D7(ii) requires."

**3. Source list.** The Garoufalidis–Wheeler and Bouis–Gazda entries are given under /19; Bouis–Gazda is marked out of scope, per D7(iii).

**4. PLAN-HABIRO, §6.6.** Replace the paragraph "The roadmap uses HC.1, HC.3, HC.4, HC.6, HB.5a and HB.9, all kept. Decision D7 asks whether Garoufalidis–Wheeler's lift of the colored Jones polynomial (arXiv:2603.01619) extends QT.2/QT.4." with:

> The roadmap uses HC.1, HC.3, HC.4, HC.6, HB.4, HB.8, HB.9 and HabiroNumberFields HB.7, all kept; it no longer uses HB.5a. Under decision D7(ii), Garoufalidis–Wheeler's lift of the colored Jones polynomial (arXiv:2603.01619) is recorded in QT.2's boundary as a follow-up that would require HR.1; it proves Habiro's Conjecture 7.4 (their Corollary 1.5).

The first sentence reflects /10 and /21.

**5. Packet.**
- Add `QT.2/two-variable-colored-jones`: AE-HABIRO §7.1 and Proposition 7.2.
- Add `QT.2/melvin-morton-rozansky`: Rozansky's rationality theorem, and Bar-Natan–Garoufalidis Theorem 1, with a request to GT L4 for the Alexander polynomial.
- This closes QT.2's `coverage` item.

### Not done, and why
- **No stage for the Garoufalidis–Wheeler lift.** This follows PLAN-HABIRO D7(ii).
- **Rozansky 1998 was not read.** Only its bibliographic record was checked, with Crossref; its theorem is stated as AE-HABIRO §7.2 states it.
- **Two numberings are unchecked.** Bar-Natan–Garoufalidis was read in the author preprint, not the journal version. Garoufalidis–Wheeler cite the Invent. Math. print of Habiro, whose numbering of Conjecture 7.4 was not seen; arXiv v1 has it as Conjecture 7.4 (p. 27).

## /17 (low, missing): q-holonomicity goes into QT.2; the A-polynomial is a stated non-goal

Confirmed as low. Nothing has changed since 24 September, except that the QT packet (new) also has no q-holonomicity node. Garoufalidis–Lê (arXiv:math/0309214v3; Geom. Topol. 9 (2005) 1253–1293) was read:
- Theorem 1: "The colored Jones function of every knot is q–holonomic".
- Theorem 3: the same for links.

The fix:
- **QT.2.** The [/17] bullet of QT.2's text under /3, with this source in its source route.
- **QT.5.** The A-polynomial and the AJ conjecture are non-goals, in QT.5's boundary under /6. The A-polynomial is due to Cooper–Culler–Gillet–Long–Shalen, Invent. Math. 118 (1994) 47–84, doi:10.1007/BF01231526 (Crossref only).
- **QT.7.** The matrix invariants defined through the q-difference equation are item 4 of QT.7's text under /12.
- **PLAN-HABIRO, §6.5, HQ.9 row.** After "(GW25 §§2.6–2.7, 3.4)", insert:
  > ; its figure-eight example uses only the explicitly given curve xy + (1 − x²y)(1 − y) = 0 (GW25, (3), p. 3), and the A-polynomial as a knot invariant is not planned in the atlas (ArithmeticQuantumTopology QT.5)

  This is taken from Garoufalidis–Wheeler, arXiv:2505.19885v1: its abstract names "the A-polynomial curve of the figure eight knot", and its eq. (3) gives the curve.
- **Packet.** Add `QT.2/q-holonomicity`.

## /18 (low, other): QT.3 cites the rational-homology-sphere invariants and states them as non-goals

Confirmed as low. The README is unchanged. QT.3 line 65 reads "Rational homology spheres, including general lens spaces, need a separately defined coefficient completion and theorem; they are not silently in this domain." The QT packet's `QT.3/rational-homology-spheres-are-not-in-this-domain` cites only Habiro–Lê §1.

**Read in the sources.**
- **Beliakova–Bühler–Lê**, arXiv:0801.3893v3; Invent. Math. 185 (2011) 121–174, doi:10.1007/s00222-010-0304-5.
  - Theorem 1 (p. 2): I_{M,L} ∈ R_b, where R_b := lim_k Z[1/b][q]/((q; q²)_k).
  - p. 3: "If b = 1 and L is the empty link, I_M coincides with Habiro's unified invariant J_M".
- **Beliakova–Blanchet–Lê**, arXiv:0704.3669; Fund. Math. 201 (2008) 217–239, doi:10.4064/fm201-3-2.
  - Theorem 2 (p. 4): the unified invariant for H₁(M, Z) = (Z/2)ⁿ.

**Fix.** Append to QT.3's **Known/conjectural boundary** (line 65):

> The unified invariants of rational homology spheres are not targets of this roadmap: Beliakova–Bühler–Lê's SO(3) invariant in the rings R_b and S_b with b = |H₁(M, Z)| inverted (Invent. Math. 185 (2011), Theorem 1), which coincides with J_M when b = 1, and Beliakova–Blanchet–Lê's invariant for H₁(M, Z) = (Z/2)ⁿ (Fund. Math. 201 (2008), Theorem 2). Each needs its own coefficient ring and its own theorem; the restricted-root-order rings of HabiroCyclotomicCompletions HC.5 would be their supplier.

In the packet, `QT.3/rational-homology-spheres-are-not-in-this-domain` cites both papers. The non-goal is chosen because QT's declared scope, and its source AE-HABIRO, is integral homology spheres.

## /19 (low, other): the source list covers every stage

Confirmed as low. The README is unchanged. The source list, lines 129–130, has two entries: AE-HABIRO "(2006/2007)" and AE-HABIRO-LE "(2015)". Stages QT.0 and QT.5–QT.7 still say "acquire the original …".

The QT packet (new) records four sources with hashes: Habiro 2008, Neumann 2004, Habiro–Lê and Garoufalidis–Zagier 2024.

**Fix.** Replace lines 129–130 of "Source access and preparation" with the list below. The paragraphs before and after it stay. Every identifier was checked with the arXiv API or Crossref on 29 September 2026. The sections named were read for this report, except the entries marked "(record checked)".

> - **AE-HABIRO:** K. Habiro, *A unified Witten–Reshetikhin–Turaev invariant for integral homology spheres*, Invent. Math. 171 (2008) 1–81, https://doi.org/10.1007/s00222-007-0071-0; arXiv:math/0605314v1 (only version), https://arxiv.org/abs/math/0605314. Sections used: §§1–12 (QT.0–QT.4).
> - **AE-HABIRO-LE:** K. Habiro, T. T. Q. Lê, *Unified quantum invariants for integral homology spheres associated with simple Lie algebras*, Geom. Topol. 20 (2016), no. 5, 2687–2835, https://doi.org/10.2140/gt.2016.20.2687; arXiv:1503.03549v2. Sections used: Theorem 1.1, Proposition 1.2, §1.3.1, §§2–5, 7 and 8, Table 1 (QT.1(d), QT.4).
> - **QT.0:**
>   - Habiro, *Refined Kirby calculus for integral homology spheres*, Geom. Topol. 10 (2006) 1285–1317, https://doi.org/10.2140/gt.2006.10.1285 (arXiv:math/0509039v2): introduction, Theorem 1.1, Corollary 5.1.
>   - Habiro, *Bottom tangles and universal invariants*, Algebr. Geom. Topol. 6 (2006) 1113–1214, https://doi.org/10.2140/agt.2006.6.1113 (arXiv:math/0505219).
>   - Kirby, Invent. Math. 45 (1978) 35–56, https://doi.org/10.1007/BF01406222 (record checked).
>   - Fenn–Rourke, Topology 18 (1979) 1–15, https://doi.org/10.1016/0040-9383(79)90010-7 (record checked).
>   - Lickorish, Ann. of Math. 76 (1962) 531–540, https://doi.org/10.2307/1970373 (record checked).
>   - Wallace, Canad. J. Math. 12 (1960) 503–528, https://doi.org/10.4153/cjm-1960-045-7 (record checked).
> - **QT.1–QT.2:**
>   - Habiro, *An integral form of the quantized enveloping algebra of sl₂ and its completions*, J. Pure Appl. Algebra 211 (2007) 265–292, https://doi.org/10.1016/j.jpaa.2007.01.011 (arXiv:math/0605313): Theorems 1.1 and 11.2.
>   - Reshetikhin–Turaev, Invent. Math. 103 (1991) 547–597, https://doi.org/10.1007/BF01239527 (record checked).
>   - Kirby–Melvin, Invent. Math. 105 (1991) 473–545, https://doi.org/10.1007/BF01232277 (record checked).
>   - Jones, Ann. of Math. 126 (1987) 335–388, https://doi.org/10.2307/1971403, Proposition 12.5 (record checked).
>   - Murakami–Murakami, Acta Math. 186 (2001) 85–104, https://doi.org/10.1007/BF02392716 (arXiv:math/9905075v2): Theorem 4.9, Conjecture 5.1.
>   - Bar-Natan–Garoufalidis, Invent. Math. 125 (1996) 103–133, https://doi.org/10.1007/s002220050070: Theorem 1, from the author preprint https://www.math.toronto.edu/drorbn/papers/mmr/mmr.pdf.
>   - Rozansky, Adv. Math. 134 (1998) 1–31, https://doi.org/10.1006/aima.1997.1661 (record checked).
>   - Garoufalidis–Lê, Geom. Topol. 9 (2005) 1253–1293, https://doi.org/10.2140/gt.2005.9.1253 (arXiv:math/0309214v3): Theorems 1 and 3.
>   - Follow-up only: Garoufalidis–Wheeler, *A lift of the colored Jones polynomial of a knot*, arXiv:2603.01619v1: Theorem 1.3, Corollaries 1.5 and 1.7.
> - **QT.3:**
>   - Beliakova–Bühler–Lê, Invent. Math. 185 (2011) 121–174, https://doi.org/10.1007/s00222-010-0304-5 (arXiv:0801.3893v3): Theorem 1.
>   - Beliakova–Blanchet–Lê, Fund. Math. 201 (2008) 217–239, https://doi.org/10.4064/fm201-3-2 (arXiv:0704.3669): Theorem 2.
>
>   Both are non-goals.
> - **QT.5:**
>   - Thurston, *The Geometry and Topology of Three-Manifolds*, electronic version 1.1 (2002), https://library.slmath.org/books/gt3m/: §3.10 and §§4.1–4.4.
>   - Neumann–Zagier, Topology 24 (1985) 307–332, https://doi.org/10.1016/0040-9383(85)90004-7: §1, Theorem 2.2.
>   - Epstein–Penner, J. Differential Geom. 27 (1988) 67–80, https://doi.org/10.4310/jdg/1214441650 (record checked).
>   - Prasad, Invent. Math. 21 (1973) 255–286, https://doi.org/10.1007/BF01418789 (record checked).
>   - Neumann–Yang, Duke Math. J. 96 (1999), https://doi.org/10.1215/s0012-7094-99-09602-3 (arXiv:math/9712224v1): Definition 2.5, Theorems 1.1–1.3, Proposition 4.3, Corollary 6.2, §7.
>   - Neumann, Geom. Topol. 8 (2004) 413–474, https://doi.org/10.2140/gt.2004.8.413 (arXiv:math/0307092v2): §§2–4, 7, 12 and 14.
>   - Meyerhoff, in *Low-dimensional topology and Kleinian groups*, LMS Lecture Note Ser. 112 (1986) 209–215 (Zbl 0622.57009; record not in Crossref).
>   - Not a target: Cooper–Culler–Gillet–Long–Shalen, Invent. Math. 118 (1994) 47–84, https://doi.org/10.1007/BF01231526.
> - **QT.6:**
>   - Garoufalidis–Scholze–Wheeler–Zagier, *The Habiro ring of a number field*, arXiv:2412.04241v2: §§1.5, 1.7 and 1.8.
>   - Dimofte–Garoufalidis, Geom. Topol. 17 (2013) 1253–1315, https://doi.org/10.2140/gt.2013.17.1253 (arXiv:1202.6268v2).
>   - Dimofte–Garoufalidis, Commun. Number Theory Phys. 12 (2018) 1–52, https://doi.org/10.4310/cntp.2018.v12.n1.a1 (arXiv:1511.05628).
>   - Garoufalidis–Storzer–Wheeler, arXiv:2305.14884v2.
>   - Garoufalidis–Zagier, Ramanujan J. 55 (2021) 219–238, https://doi.org/10.1007/s11139-020-00266-x (record checked).
>   - Faddeev–Kashaev, Mod. Phys. Lett. A 9 (1994) 427–434, https://doi.org/10.1142/S0217732394000447 (arXiv:hep-th/9310070).
>   - Andersen–Kashaev, Comm. Math. Phys. 330 (2014) 887–934, https://doi.org/10.1007/s00220-014-2073-2 (arXiv:1109.6295v2).
>   - Faddeev–Kashaev–Volkov, Comm. Math. Phys. 219 (2001) 199–219, https://doi.org/10.1007/s002200100412 (arXiv:hep-th/0006156).
>
>   The sections read are given in QT.6's source route.
> - **QT.7:**
>   - Kashaev, Lett. Math. Phys. 39 (1997) 269–275, https://doi.org/10.1023/A:1007364912784 (arXiv:q-alg/9601025).
>   - Garoufalidis–Zagier, *Knots, perturbative series and quantum modularity*, SIGMA 20 (2024) 055, https://doi.org/10.3842/SIGMA.2024.055 (arXiv:2111.06645v3).
>   - Bettin–Drappeau, Math. Ann. 382 (2022) 1631–1679, https://doi.org/10.1007/s00208-021-02288-2 (arXiv:1905.02045v3).
>   - Andersen–Hansen, J. Knot Theory Ramifications 15 (2006) 479–548, https://doi.org/10.1142/S0218216506004555 (arXiv:math/0506456).
>   - Ohtsuki, Quantum Topol. 7 (2016) 669–735, https://doi.org/10.4171/QT/83.
>   - Ohtsuki–Yokota, Math. Proc. Cambridge Philos. Soc. 165 (2018) 287–339, https://doi.org/10.1017/S0305004117000494 (abstract read).
>   - Ohtsuki, Internat. J. Math. 28 (2017) 1750096, https://doi.org/10.1142/S0129167X17500963 (abstract read).
>   - Zagier, *Quantum modular forms*, Clay Math. Proc. 11 (2010) 659–675 (author copy on https://people.mpim-bonn.mpg.de/zagier/).
>
>   The sections read are given in QT.7's source route.
> - **Out of scope:**
>   - Bouis–Gazda, *The cyclosyntomic regulator of a number field*, arXiv:2602.21894 (PLAN-HABIRO D7(iii)).
>   - Garoufalidis–Gu–Mariño, Comm. Math. Phys. 386 (2021) 469–493, https://doi.org/10.1007/s00220-021-04076-0 (resurgence).

## /20 (low, other): QT.0's Inputs name a retired roadmap; the extract is right

Confirmed as low. The review reproduced the disagreement: `data/atlas.json` gives QT.0 `requires` [LI.0, LI.4] with both stage edges, while the extract gives `requires: []`.

**The cause, not stated in the finding or the review.** FoundationsAndLibraryIntegration was retired on 16 September (`data/roadmap-retirements.json`; commit 0b702e14). `make_atlas_extracts.py` applies `apply_retirements` to the immutable snapshot, and so does `scripts/build.py`. So the extract shows what the atlas actually uses. The stale item is the README's **Inputs** line (line 17), which still names the retired LI.0 and LI.4. The same diagnosis was made for LogicAndDefinabilityInNumberTheory in the merged `RT-AREA-modeltheory.fixes.md`, /1.

**Fix.**
- Under /1, items 2 and 5: the README Inputs line becomes GT L5, GT L4 and GT L1; the `data/atlas.json` `requires` and edges change to match; the two LI edges are removed.
- Then rerun `research/blueprint/make_atlas_extracts.py`. After that the snapshot, the README, the assembled atlas and the extract all give QT.0 the same three prerequisites.

## /21 (low, error): QT.6 requires what its text uses

Confirmed as low. QT.6 `requires` is still [QT.4, QT.5, HB.5a, HB.9], and the README's Inputs (line 101) says the same. The QT packet's `restructure` note makes the same point, and its request to HB.5a has no consuming node.

**Fix.**
- `data/atlas.json`, QT.6 `requires`: → [QT.2, QT.5, `HabiroNahmSeries:HB.4`, `HabiroNahmSeries:HB.8`, `HabiroNahmSeries:HB.9`, `HabiroNumberFields:HB.7`, `HabiroCyclotomicCompletions:HC.1`].
- Add the stage edges QT.2, HB.4, HB.8, HB.7 and HC.1 → QT.6. Each is acyclic: there is no path from QT.6 to any of them.
- Remove QT.4 → QT.6: QT.6 treats no WRT asymptotics of closed manifolds.
- Remove HB.5a → QT.6.
- The README Inputs line is given under /10.
- **HB.5a is dropped, not moved to QT.7.** No QT.7 statement uses cusp expansions of finite-index modular functions. The Kashaev-invariant conjectures are about the knot; the general quantum-modular theory is imported from QM.5 (/13).
- **Packet.** Delete the request to HB.5a.

## AlgebraicTopology and UniversalCovers (/22–/40, /118–/123): conventions

- **Snapshots.** `content/tau-ceti/AlgebraicTopology/README.md` and `content/tau-ceti/UniversalCovers/{README,STATUS,PROGRESS}.md` were last rebuilt on 16 September (`3d890fef`), and the extracts `research/blueprint/atlas/roadmaps/tauceti_TauCetiRoadmap_{AlgebraicTopology,UniversalCovers}.json` on 16 September (`9820e12a`). Every passage the findings quote is unchanged at `31403074`, at the same line numbers. Quotations below ignore line wrapping and runs of spaces, and each occurs once in its file.
- **Changes on main since 24 September that touch this range.**
  - `data/tauceti-progress.json` (28–29 September) reports UniversalCovers upstream as `"completed": true`, with its status at `Completed/UniversalCovers/STATUS.md`. For AlgebraicTopology it lists the frontier "Homology of spheres and disks", "Cellular homology", "Mapping cylinders, cellular approximation and skeletal induction", "The van Kampen colimit" and "Cohomology products and duality".
  - The queue (`1018ef24`, 28 September) has **`DESIGN-AlgebraicTopologyPartII`**: one design job for every paper Part II proposal with this parent (see /40).
  - Nothing else has changed. RS-09 and RS-33 are `done` with `REV-RS-09` and `REV-RS-33` pending; neither has a later round (`RS-09~2`, `RS-33~2`) or a review file. The jobs `LINK-tauceti_TauCetiRoadmap_AlgebraicTopology` (no packet yet) and `LINK-tauceti_TauCetiRoadmap_UniversalCovers` (partial packet, unreviewed) are pending, and `AUDIT-44` and `AUDIT-45` have no results.
- **Upstream, beyond the snapshot** (TauCetiRoadmap `main` at `ca2f063`, read through the GitHub API on 29 September). None of this is on main yet.
  - UniversalCovers was declared complete on 22 September and archived to `Completed/UniversalCovers/` on 27 September (TauCetiRoadmap #434). The README and STATUS were carried over byte-identical, together with a `sorry`-free `Suggested.lean` that states every milestone and closes it with a Tau Ceti declaration.
  - TauCetiRoadmap #468 then moved that file to Mathlib's `deck`, because Tau Ceti PR #6875 had deleted `TauCeti.Deck` (merged 21 September, after the pin).
  - The AlgebraicTopology README differs from the snapshot in three places: the link to UniversalCovers (line 48), a Stage 5 header exception for the product maps of item 1, and the dependency table.
  - The generated AlgebraicTopology `STATUS.md` (at Tau Ceti `759eb3e`, 26 September) reports declarations built after the pin: excision, Mayer–Vietoris, a `HomologyPretheory` instance, twisted chains, singular cohomology, cellular chains and CW cofibrations. **This report claims none of them.** Library claims below are at the pins, Mathlib `082e2d3` and Tau Ceti `f790474` (16 September), and every declaration cited was read there with its hypotheses.
- **Where the fixes go.**
  - AlgebraicTopology, UniversalCovers, BelyiMaps, LieGroups and GeometricTopology are Tau Ceti roadmaps, so their fixes are notes for the Tau Ceti maintainer.
  - Stage edges go into the link packets: AlgebraicTopology's (job pending, no packet yet) and UniversalCovers' (continuation pending). They join the atlas when REV-LINK accepts the packet (`scripts/decompositions.py`, `merge_links`). The build then recomputes the roadmaps' prerequisites and consumers from the edges.
  - **Every edge proposed below (47 distinct edges) passes the cycle check (`cyc`, result "acyclic") against the atlas as `scripts/build.py` assembles it at `31403074`.** The 47 were also added together, with and without RS-33's links: no cycle.

## /22 (high, missing): Stage 6 gains compactly supported cohomology, noncompact duality and an umkehr map

### What the verifier corrected
Nothing; the finding was confirmed as filed. The verifier could not read Hatcher and relied on the red team's locators. I read them in the public PDF, and every one is exact:
- p. 242: "The induction step requires a version of Poincaré duality for open subsets of M, which are noncompact and can satisfy Poincaré duality only when a different kind of cohomology called cohomology with compact supports is used";
- pp. 243–244: `C^i_c(X;G)` is the union of the `C^i(X, X−K; G)`, and `H^i_c(X;G)` is the direct limit of `H^i(X, X−K; G)` over compact `K`;
- p. 245: Theorem 3.35;
- p. 246: Lemma 3.36;
- p. 241: Theorem 3.30;
- p. 254: the proof of Theorem 3.43, "The case B = ∅ is proved by applying Theorem 3.35 to M−∂M. Via a collar neighborhood of ∂M we see that H^k(M,∂M;R) ≈ H^k_c(M−∂M;R)".

Two limits of the source:
- Hatcher proves Theorem 3.35 for an R-orientable manifold with constant coefficients. The twisted form is only remarked after Theorem 3H.6 (p. 336: "There is also a version for noncompact manifolds using cohomology with compact supports").
- For the umkehr map of a proper map on ordinary cohomology I read no source.

### State on main (31403074)
- **Stage 6 is unchanged** (README lines 304–347).
  - Line 306: "This stage consumes Stage 2 and the product maps of Stage 5."
  - Item 4 plans duality only for compact manifolds.
  - Dependency row (line 414): "| 6 cohomology/duality | 2, Stage 5 product maps, external orientation/collars | 1 |".
  - Upstream `main` has the same text for Stage 6.
- **Consumers.**
  - PAPER-BENOIST-WITTENBERG-20 `ordinary-topology` (status `planned`) imports "ordinary singular cohomology, cup products, orientation local coefficients, proper manifold pushforward and Poincaré duality from Algebraic Topology stage6".
  - PAPER-BROWNING-SAWIN-20 `ordinarytopology` (`planned`) imports "manifold duality". It lists the API `cup_compact_support`, with the unit test "homotopy-equivalent noncompact spaces need not have isomorphic compact-support cohomology".
  - Since 28 September both briefs feed `DESIGN-AlgebraicTopologyPartII`.
  - RS-09 (pending) narrows ArithmeticLocallySymmetricSpaces ALS.1 to keep its "compact-support complexes" of arithmetic local systems while importing generic cochains from this stage, so a generic `H^*_c` owned here also serves it.
- **Libraries.** Neither pin has singular cohomology. Upstream's later `TopPair.singularCohomology` has no compact supports.

### Fix
**Note for the Tau Ceti maintainer: `AlgebraicTopology/README.md`, Stage 6.**

1. **Stage header** (line 306). Replace "This stage consumes Stage 2 and the product maps of Stage 5." with:
   > This stage consumes Stages 2 and 3 and the product maps of Stage 5; the fundamental-class and duality inductions of items 3–4 use excision and Mayer--Vietoris.
2. **Item 4.** Replace the whole item, from "4. First prove Poincare duality by cap product" to "State connectedness in the corollary identifying top homology with the coefficient ring.", with:
   > 4. Define compactly supported singular cochains `C^*_c(M;L)`, the union over compact `K ⊆ M` of `C^*(M, M ∖ K; L)`, for Stage 2's local systems `L`. Identify `H^k_c(M;L)` with the direct limit of `H^k(M, M ∖ K; L)` over compact `K`. Prove that it is contravariant for proper maps, covariant for inclusions of open subsets, and has a Mayer--Vietoris sequence for an open cover `M = U ∪ V`.
   >
   > Prove duality first for every `n`-manifold without boundary, compact or not. Cap product with the local orientation classes is an isomorphism `D_M : H^k_c(M;L) -> H_(n-k)(M; L ⊗ or_M)`. The proof is an induction over open subsets, using the compatibility, up to sign, of the Mayer--Vietoris sequences of `H^*_c` and `H_*` with `D`.
   >
   > Then derive:
   > - Poincare duality for compact boundaryless `M`, where `H^*_c = H^*`;
   > - for compact `M` with boundary, the Poincare--Lefschetz form, through the collar identification `H^k(M, ∂M; L) ≅ H^k_c(M ∖ ∂M; L)` and the shared boundary model;
   > - the field-coefficient and integral orientable corollaries.
   >
   > State connectedness in the corollary identifying top homology with the coefficient ring.
3. **New item 6**, after item 5:
   > 6. For `R`-oriented manifolds `V`, `W` without boundary, of dimensions `v` and `w`, and a map `f : V -> W`, define the umkehr map on compactly supported cohomology, `f_! = D_W^(-1) ∘ f_* ∘ D_V : H^i_c(V;R) -> H^(i+w-v)_c(W;R)`, from item 4, and prove that it is functorial. For a proper map, construct the umkehr map on ordinary cohomology, `f_! : H^i(V; or_(V/W) ⊗ f^*L) -> H^(i+c)(W; L)` with `c = w - v`, and its projection formula. This is the supplier of the proper pushforward that the paper extensions of this roadmap import.
4. **Dependency table** (line 414). Replace "| 6 cohomology/duality | 2, Stage 5 product maps, external orientation/collars | 1 |" with:
   > | 6 cohomology/duality | 2; 3 for items 3, 4 and 6; Stage 5 product maps; external orientation/collars | 1 |

   Row 3's "1 and 6's cochain foundations" stays true for item 1.
5. **Source paragraph** (line 345). After "Hatcher Sections 3.1--3.3 for cohomology operations and duality" insert:
   > (Theorems 3.30, 3.35 and 3.43 and Lemma 3.36 for the compactly supported route)

**Atlas side.**
- **Edge.** Stage 3 → Stage 6 is in the /29 table.
- **`research/blueprint/papers/PAPER-BENOIST-WITTENBERG-20.result.json`, item `PAPER-BENOIST-WITTENBERG-20/ordinary-topology`, field `statement`.** Replace "Import ordinary singular cohomology, cup products, orientation local coefficients, proper manifold pushforward and Poincaré duality from Algebraic Topology stage6, with its stage2 and5 prerequisites;" with:
  > Import ordinary singular cohomology, cup products, orientation local coefficients and Poincaré duality from Algebraic Topology stage6, with its stage2 and5 prerequisites. Compactly supported cohomology, duality for noncompact manifolds and the proper pushforward are not planned in stage6 at the snapshot of 16 September; they are requested from the Tau Ceti maintainer (RT-AREA-topology.fixes.md /22), and until they are planned there the Part II's first layer plans them in their ordinary form;

  The rest of the statement stays.
- **`PAPER-BROWNING-SAWIN-20.result.json`, item `PAPER-BROWNING-SAWIN-20/ordinarytopology`, field `statement`.** Replace "Import relative singular chains, cohomology products, excision and manifold duality from the existing Tau Ceti AlgebraicTopology roadmap;" with:
  > Import relative singular chains, cohomology products, excision and manifold duality from the existing Tau Ceti AlgebraicTopology roadmap, and compactly supported cohomology from its Stage 6 once planned there (RT-AREA-topology.fixes.md /22), otherwise from the Part II's first layer;

### Not done, and why
- **The proper-map umkehr on ordinary cohomology** in new item 6 stays an obligation. It needs locally finite (Borel–Moore) homology and its duality with ordinary cohomology, or Verdier duality, and I read no source for it. The compactly supported umkehr is stated only because it follows from Theorem 3.35.
- **The twisted form of item 4** (coefficients `L ⊗ or_M`) is the generalisation the roadmap's current item 4 already asks for. Its proof should be taken from Dold, Chapter VIII, which the roadmap cites and which I did not read.

## /23 (high, error): relative homotopy groups for every based pair, and the fibration theorem as the export to H.2

### What the verifier corrected
Nothing. The locators, which the verifier could not read, are exact:
- Hatcher p. 343: relative groups "for a pair (X, A) with a basepoint x0 ∈ A", a group for n ≥ 2, abelian for n ≥ 3;
- p. 344: Theorem 4.3, "This sequence is exact";
- p. 376: Theorem 4.41.

### State on main (31403074)
- **Item 8.1** (lines 371–380) still reads "State relative groups for NDR pairs/cofibrations, rather than attaching them to arbitrary inclusions without hypotheses. The empty-subspace pair admits no such based carrier."
- **The encoding convention** (lines 101–106) asks only for a `BasedTopPair`.
- **RS-33** (pending) makes StableHomotopyKTheory H.2 keep "the fibre long exact sequence including pointed-set end terms" and import "the based-pair interface" from Stage 8. RS-33.md adds: "The based-pair LES does not by itself supply the fibre LES."
- Mathlib's `TopPair` (`Mathlib/Topology/Category/TopPair.lean:31`) is an arrow of embeddings.

### Fix
**Note for the Tau Ceti maintainer: `AlgebraicTopology/README.md`, Stage 8 item 1.** This also carries /33.

Replace the first paragraph of item 1, from "1. Define `BasedTopPair` from a `TopPair`" to "The empty-subspace pair admits no such based carrier.", with the text below. The paragraph beginning "Keep the low-degree algebra honest" stays.

> 1. Define `BasedTopPair` from a `TopPair` and an actual point of its subspace, together with basepoint-preserving maps of pairs.
>
> Import the absolute higher-homotopy API from the universal-covers roadmap (its Stage 3, built in Tau Ceti) and do not rebuild it:
> - `HomotopyGroup.map` and `HomotopyGroup.mapHom`;
> - `TauCeti.homotopyGroupEquivOfPath` and `TauCeti.homotopyGroupMulEquivOfPath`;
> - `HomotopyGroup.mulEquivOfHomotopyEquiv`, `TauCeti.homotopyGroupMulAction` and `HomotopyGroup.loopSpaceMulEquiv`.
>
> For every `BasedTopPair`, with no cofibration or NDR hypothesis, define:
> - the relative homotopy groups `pi_n(X,A,a_0)`: a pointed set for `n = 1`, a group for `n >= 2`, abelian for `n >= 3`;
> - their induced maps;
> - the boundary maps to `pi_(n-1)(A,a_0)`;
> - the long exact sequence of the based pair (Hatcher, pp. 343–344 and Theorem 4.3).
>
> Prove that the boundary maps commute with `homotopyGroupEquivOfPath`. The empty-subspace pair admits no based carrier. Cofibration, NDR or CW-pair hypotheses belong only on the theorems that use them: the compression lemma and items 4–5.
>
> Prove Hatcher's Theorem 4.41. Let `p : E -> B` have the homotopy lifting property for every disc `D^k`, and choose `b_0 ∈ B` and `x_0 ∈ F = p⁻¹(b_0)`. Then `p_* : pi_n(E,F,x_0) -> pi_n(B,b_0)` is an isomorphism for all `n >= 1`. When `B` is path connected this gives the long exact sequence of homotopy groups of `p`.
> - Stage 5's Serre-fibration carrier satisfies the hypothesis by definition, so this stage needs no Stage 5 input.
> - This is the theorem StableHomotopyKTheory H.2 imports; H.2 keeps its homotopy-fibre sequence.

**Consistency with RS-33.** H.2 keeps the homotopy-fibre long exact sequence and imports the based-pair interface, as RS-33 proposes. The new theorem is the bridge RS-33.md says the based-pair sequence lacks, so nothing is taken from H.2.

**Atlas side.** Two links: Stage 8 → StableHomotopyKTheory:H.2 is already among RS-33's links, and UniversalCovers#stage-3 → Stage 8 is in /29.

### Not done, and why
Nothing.

## /24 (high, missing): one generic owner for filtered complexes and their spectral sequences

### What the verifier corrected
Nothing; the verifier called this the sharpest AlgebraicTopology finding. **Its closing note binds here:** findings /24, /51 and /54 need one owner between AlgebraicTopology and CombinatorialHeegaardFloer's Lane ALG.

### State on main (31403074)
- **The Inventory is unchanged.** Line 124 still ends "category-theoretic colimits, chain homotopies, homology functors, and exact couples."
- **The six items are unchanged.** Each still states its own spectral sequence and convergence: 4.3 (skeletal exact couple), 5.1 (Kunneth), 5.3 (Cartan--Leray), 5.5 (Serre), 5.7 (Čech double complex) and 6.1 (`Ext` spectral sequence).
- **Libraries.**
  - **Mathlib `082e2d3`** has no exact couple (`grep -rni "exact couple"` finds nothing). It has:
    - `CategoryTheory.Abelian.SpectralObject` (`Mathlib/Algebra/Homology/SpectralObject/Basic.lean:41`);
    - the spectral sequence `Abelian.SpectralObject.spectralSequence` (`SpectralObject/SpectralSequence.lean`);
    - `SpectralObject.IsFirstQuadrant` (`HasSpectralSequence.lean:393`, the conditions "which allow to obtain a (convergent) first quadrant E₂ cohomological spectral sequence");
    - `HomotopyCategory.spectralObjectMappingCone` (`HomotopyCategory/SpectralObject.lean:46`): "to any functor ι ⥤ CochainComplex C ℤ (e.g. a filtered complex), there is an associated spectral object".

    `CategoryTheory/Triangulated/SpectralObject.lean`'s header TODO says "(the spectral sequence is already constructed: it remains to study convergence)". There is no filtered-complex constructor and no convergence theorem.
  - **Tau Ceti `f790474`** has no file mentioning a spectral sequence.
- **Other consumers found in the assembled atlas.**
  - The finding names StableHomotopyKTheory H.6, SchemeKTheoryOperations S.4 and DiamondsAndVStacks D0. Beyond them:
    - `DeformationAndDerivedPatchingAlgebra:P8/ultrapatching-of-perfect-complexes` uses "the spectral sequence of a filtered complex";
    - `StableHomotopyKTheory:H.4/quillen-localization-of-homology` builds a spectral sequence "from the double complex";
    - PAPER-BROWNING-SAWIN-20 `finitefiltration` asks for "The exact finite-closed-filtration convergence interface".
  - FoundationsAndLibraryIntegration LI.3 (in `data/atlas.json`) lists "spectral sequences" among library areas to unify. It is an integration checkpoint, not a construction, and not a stage of the assembled atlas.
- **RS-33 (pending)** keeps "filtered-spectrum exact couples, differentials and convergence" in H.6. It says "AT4 is the fixed ordinary special case, not a supplier of spectrum convergence."

### Fix
**Note for the Tau Ceti maintainer: `AlgebraicTopology/README.md`.**

1. **Inventory** (lines 123–124). Replace "category-theoretic colimits, chain homotopies, homology functors, and exact couples." with:
   > category-theoretic colimits, chain homotopies, homology functors, and the spectral-object machinery:
   > - `CategoryTheory.Abelian.SpectralObject` with its pages and the spectral sequence it yields (`Mathlib/Algebra/Homology/SpectralObject/`), including the first-quadrant case `SpectralObject.IsFirstQuadrant`;
   > - the spectral object of a functor to cochain complexes (`HomotopyCategory.spectralObjectMappingCone`).
   >
   > Mathlib has no exact couples, no spectral sequence of a filtered chain complex and no convergence theorem ("it remains to study convergence", `CategoryTheory/Triangulated/SpectralObject.lean`). Stage 0 supplies them.
2. **New section before Stage 1.** Stage 0 is pure homological algebra, so no stage is renumbered and Stages 4–6 can all consume it:
   > ## Stage 0: filtered complexes, spectral sequences and universal coefficients
   >
   > This stage uses no topology. Stages 4, 5 and 6 consume it, and so may every roadmap that needs the spectral sequence of a filtered complex or a double complex.
   >
   > 1. Define filtered chain complexes over an abelian category: complexes with an increasing `ℤ`-indexed filtration by subcomplexes. Define filtered maps, filtered chain homotopies, filtered quasi-isomorphisms and the associated graded complex, and name the conditions used below: exhaustive, bounded below in each degree, finite in each degree.
   > 2. Build the spectral sequence of a filtered complex on Mathlib's `SpectralObject`, through the spectral object of the filtration regarded as a functor to complexes. Identify:
   >    - `E^0 = gr`, with `d_0` induced by `d`;
   >    - `E^1 = H(gr)`, with `d_1` the connecting morphism of `0 -> gr_(p-1) -> F_p/F_(p-2) -> gr_p -> 0`.
   >
   >    Prove naturality in filtered maps.
   > 3. Prove convergence. When the filtration of each degree is finite, the spectral sequence is bounded, the induced filtration of homology is finite, and `E^∞_(p,q) ≅ gr_p H_(p+q)`. Prove the same under the vanishing and stabilization hypotheses on `H(F_p)` that replace finiteness. Give the edge maps.
   > 4. For a double complex, construct the two filtrations of the total complex and their spectral sequences, with `E^1` and `E^2` given by iterated homology. Prove convergence when each total degree has only finitely many nonzero terms, in particular for first-quadrant complexes.
   > 5. For a chain complex `C` of free modules over a principal ideal domain `R` and an `R`-module `M`, prove the natural short exact sequence `0 -> Ext^1_R(H_(n-1)(C), M) -> H^n(Hom_R(C, M)) -> Hom_R(H_n(C), M) -> 0`, and that it splits, though not naturally. Stage 6 item 1 applies it to singular chains.
   >
   > Items 4.3, 5.1, 5.3, 5.5, 5.7 and 6.1 import this construction and keep only their own filtrations and `E^2` identifications.
   >
   > *Source:* the Stacks Project, Section 12.24 (tag 012K), Lemmas 12.24.2, 12.24.3, 12.24.4, 12.24.11 and 12.24.13 (tags 012M, 012N, 012O, 012W, 0BK5), and Section 12.25 (tag 012X), Lemmas 12.25.1 and 12.25.3 (tags 0130, 0132). Stacks works with decreasing filtrations of cochain complexes; the chain-complex form here is the reindexing. For item 5: Hatcher, *Algebraic Topology*, Theorem 3.2 (p. 195) and the paragraph after Corollary 3.4 on modules over a principal ideal domain (p. 196).
3. **Items 4.3, 5.1, 5.3, 5.5, 5.7 and 6.1.** Append to each:
   > (the spectral sequence and its convergence are Stage 0's; this item supplies the filtration and the `E^2` identification)

   Append also to item 6.1:
   > (the universal coefficient sequence over a PID is Stage 0's item 5; this item applies it to singular cochains)
4. **Dependency table.** Insert above row 1:
   > | 0 filtered complexes, spectral sequences, universal coefficients | current Mathlib | 1--3 |

   In rows 4, 5 and 6, add "0" to "Depends on".
5. **References.** Add:
   > The Stacks Project, Sections 12.24–12.25 (tags 012K, 012X), for the spectral sequences of filtered and double complexes.

**Single owner for /24, /51 and /54 (proposed).** Stage 0 is the natural home for all three:
- ℤ-filtered chain complexes (/54);
- the algebraic universal coefficient theorem for complexes of free modules over a PID, which /51 asks for and which Stage 6.1 then specialises;
- the spectral sequences (/24).

CombinatorialHeegaardFloer Lane ALG then imports them and keeps its `K[U]`-specific results. /51 and /54 give the Lane ALG side, and item 5 of Stage 0 is the theorem /51 asks for.

**Offers to other consumers.**
- **StableHomotopyKTheory H.6.** Under RS-33, H.6 compares "the module/complex specialization" with established interfaces. It should compare its chain-level specialisation with Stage 0. That is a comparison, not an import of spectrum convergence, which stays with H.6.
- **SchemeKTheoryOperations S.4, DiamondsAndVStacks D0, `DeformationAndDerivedPatchingAlgebra:P8/ultrapatching-of-perfect-complexes`, `StableHomotopyKTheory:H.4/quillen-localization-of-homology` and PAPER-BROWNING-SAWIN-20 `finitefiltration`** import Stage 0 for their chain-level cases.

These edges attach to the new stage once the snapshot carries it. A new source-only node cannot close a cycle.

### Not done, and why
- **The consumer edges** above wait for upstream to adopt Stage 0.
- **If the Tau Ceti maintainer declines,** the atlas needs a proposed owner for this general notion. It cannot add a stage to a Tau Ceti roadmap. That is a coordinator decision shared with /51 and /54.
- **Convergence for exhaustive, bounded-below filtrations without stabilisation** is not stated in item 3. This is the classical convergence theorem that Stage 5.5's infinite-CW case uses (Weibel, §5.5), and I did not read it. The maintainer should add it from Weibel, which the roadmap cites.

## /25 (medium, missing): van Kampen on a set of base points, with the vertex-group algebra

### What the verifier corrected
Nothing. The fix is sharpened from two sources I read.
- **The general-cover theorem** is Brown and Razak Salleh (1984). Its hypothesis is that the set meets each path component of each **two-fold and three-fold** intersection of distinct members, not of each member.
- **That paper warns that the retraction argument** "(in which the general case is deduced from that for X₀ = X) seems to work only for certain kinds of covers (for example, finite covers)". So "derived from items 1–3 by Brown's retraction" is right only for finite covers. Brown's book (6.7.2–6.7.4) proves the two-set case that way.

### State on main (31403074)
- **The texts are unchanged.**
  - Completion criterion 1 (lines 23–25).
  - The convention (lines 82–84): "Van Kampen is first a colimit theorem for the fundamental groupoid on a set of basepoints."
  - Items 1.1–1.5 (lines 148–161). Item 1.4 is "the based theorem when the two opens and their intersection are path connected". Check 1.5 "must use more than one basepoint".
- **Mathlib has the algebra this needs:**
  - `CategoryTheory.Subgroupoid.full` (`Mathlib/CategoryTheory/Groupoid/Subgroupoid.lean:584`);
  - `IsFreeGroupoid` (`Mathlib/GroupTheory/FreeGroup/NielsenSchreier.lean:77`);
  - `IsFreeGroupoid.endIsFreeOfConnectedFree` (:312), "A vertex group in a free connected groupoid is free", for `[IsConnected G] [IsFreeGroupoid G]`.
- **Tau Ceti's `CoverGeneration.lean`** works with the full groupoid (see /34).

### Fix
**Note for the Tau Ceti maintainer: `AlgebraicTopology/README.md`, Stage 1.**

1. **Item 4.** Replace "4. Derive the two-open-set pushout theorem and the based theorem when the two opens and their intersection are path connected and contain the basepoint. Derive iterated finite-cover and group-presentation corollaries." with:
   > 4. For `A ⊆ X`, let `pi(X, A)` be the full subgroupoid of `FundamentalGroupoid X` on `A` (Mathlib's `CategoryTheory.Subgroupoid.full`).
   >
   > Prove the colimit theorem for `pi(-, A)`. Let the interiors of a family `(U_λ)` of subsets cover `X`, and let `A` meet each path component of every two-fold and three-fold intersection of distinct members. Then `pi(X, A)` is the coequaliser, in groupoids, of the two morphisms from the disjoint union of the `pi(U_λ ∩ U_μ, A)` to the disjoint union of the `pi(U_λ, A)`.
   >
   > For two sets `X_1`, `X_2` whose interiors cover `X`, with `A` meeting every path component of `X_1`, `X_2` and `X_1 ∩ X_2`, this is the pushout square of Brown, 6.7.2. For finite covers it follows from items 1–3 (the case `A = X`) by Brown's retraction lemma 6.7.3, which also shrinks `A` (6.7.4). For arbitrary covers, follow Brown–Razak Salleh, whose proof does not use the retraction.
   >
   > Derive the two-open-set pushout theorem, and the based theorem when the two opens and their intersection are path connected and contain the basepoint (`A` one point). Derive iterated finite-cover and group-presentation corollaries.
2. **Item 5.** Replace "5. Check the groupoid theorem on a circle covered by two arcs with disconnected intersection and on a wedge of circles." with:
   > 5. Compute vertex groups of groupoid colimits: free groupoids on graphs, and the vertex group of a connected free groupoid (Mathlib's `IsFreeGroupoid` and `IsFreeGroupoid.endIsFreeOfConnectedFree`). Check the groupoid theorem on a circle covered by two arcs with disconnected intersection, taking `A` to be one point in each component of the intersection, which gives `pi_1(S^1) ≅ Z` (Brown, 6.7.5). Check it also on a wedge of circles.

   The sentence "The first check must use more than one basepoint and the second must recover a free-group presentation." stays.
3. **Source paragraph** (line 163). Replace "Brown, *Topology and Groupoids*, Chapters 6--7" with:
   > Brown, *Topology and Groupoids*, Chapters 6, 7 and 9, and Brown and Razak Salleh for arbitrary covers
4. **References.** Change the Brown entry's "Chapters 6--7" to "Chapters 6, 7 and 9", and add:
   > Ronald Brown and Abdul Razak Salleh, *A van Kampen theorem for unions of non-connected spaces*, Archiv der Mathematik 42 (1984), 85--88, doi:10.1007/BF01198133.

**Atlas side.** Stage 1 → BelyiMaps Layer 5 is in /29 and /122.

### Not done, and why
Nothing.

## /26 (medium, missing): CW approximation, weak equivalences, and degree-one Hurewicz in Stage 8

### What the verifier corrected
Nothing. The Hatcher locators are exact:
- Lemma 4.6 (the compression lemma), p. 346;
- Proposition 4.13, p. 353, "Every space X has a CW approximation f : Z→X";
- Proposition 4.15, p. 353;
- Corollary 4.19, p. 355;
- Proposition 4.21, p. 356, for "all coefficient groups G";
- the proof of Theorem 4.32, p. 367, "We may assume X is a CW complex and (X, A) is a CW pair by taking CW approximations";
- Theorem 2A.1, p. 166.

**One locator is replaced.** For the higher connected covers K3BlochGroups V.1 needs, the red team pointed to "Section 4.3, Postnikov towers". The construction is Example 4.20 (Whitehead towers, p. 356): the tower of `n`-connected CW models of `(X, point)`, "with Zn n-connected and the map Zn→X inducing an isomorphism on all homotopy groups πi with i > n". It sits in Section 4.1, next to the CW approximations it uses.

### State on main (31403074)
- **Items 8.3 (lines 384–385) and 5.5 (lines 276–290) are unchanged.** No stage plans the compression lemma, CW approximation, Proposition 4.21 or `H_1 = pi_1^ab`.
- **RS-33 (pending)** makes Stage 8 the owner of "Hurewicz and CW-type Whitehead theorems applied to classifying spaces and plus constructions", formerly H.1, H.3, T.1:plus and V.1. It links Stage 8 to H.1 and to V.1.
- **Libraries.** Neither has a Hurewicz map or an abelianization comparison. The only Mathlib file mentioning Hurewicz is `Topology/Homotopy/Lifting.lean` ("a covering map is a Hurewicz fibration", :309).

### Fix
**Note for the Tau Ceti maintainer: `AlgebraicTopology/README.md`, Stage 8 item 3.**

Replace "3. Construct the Hurewicz homomorphism. Prove the absolute theorem:" with:
> 3. Prove the compression lemma (Hatcher, Lemma 4.6), and CW approximation of spaces and of pairs, unique up to homotopy (Propositions 4.13 and 4.15, Corollary 4.19).
> - Construct from them the `n`-connected covers of a CW complex (Example 4.20, Whitehead towers). K3BlochGroups V.1 needs these.
> - Prove that a weak homotopy equivalence induces isomorphisms on singular homology and cohomology with every coefficient group (Proposition 4.21). Stage 5 item 5 and the passage from CW complexes to arbitrary spaces in items 4–5 use it.
>
> Construct the Hurewicz homomorphism.
> - In degree one: for path-connected `X` it induces a natural isomorphism from the abelianization of `pi_1(X,x_0)` to `H_1(X;Z)` (Theorem 2A.1). StableHomotopyKTheory H.1 imports this.
> - Prove the absolute theorem:

Then the existing text ("an `(n-1)`-connected pointed space has reduced integral homology zero below `n` …") continues.

Two further edits in the same note:
- **Stage 5 header.** Append:
  > Item 5's fibre-transport local system also consumes Stage 8 item 3 (weak equivalences induce homology isomorphisms).

  This sentence fits both the snapshot's header and upstream's rewritten one.
- **Dependency table.** In row 5, "2--4" becomes "2--4; 8 (item 3) for item 5". In row 8, "Can proceed alongside" becomes "1, 6": Stage 7 now waits for Stage 5 item 5.

**Atlas side.** Stage 8 → Stage 5 is in the /29 table (acyclic). It concerns Stage 5 item 5 only.

**Consistency with RS-33.** This supplies the Stage 8 → H.1 export that RS-33's retained H.1 test ("the induced map on H₁ is abelianisation") relies on.

### Not done, and why
The coarse stage graph makes all of Stage 5 wait for Stage 8. If the atlas later splits Stage 5, as upstream's header now splits off item 1, the edge belongs to the second part. The finding's alternative, to prove item 8.3 through a simplicial Hurewicz theorem, is not taken. Proposition 4.21 is needed either way.

## /27 (medium, missing): the model complexes the checks compute, and the Hopf fibration

### What the verifier corrected
Nothing. Two points are sharpened:
- `D^n` has the cell structure `S^(n-1) ∪ e^n`; `e^0 ∪ e^n` is the sphere's.
- The locators are exact: Hatcher, Examples 0.3, 0.4 and 0.6 (pp. 6–7), Proposition A.1 (p. 520), Lemma 2.34 (p. 137; its infinite-dimensional case (c) uses A.1 on p. 138), and Examples 4.44–4.45 (p. 377, the Hopf bundle `S^1 -> S^3 -> S^2`).

### State on main (31403074)
- The prohibition (lines 11–12), item 4.6 (lines 237–238), 7.4 (lines 362–364) and the Serre check (lines 440–444) are unchanged.
- **Mathlib** has CW structures only for graphs (`Topology/CWComplex/Classical/Graph.lean`), no topology on `Projectivization` beyond the projective line, no Hopf fibration, and of the compactness facts only `RelCWComplex.isCompact_closedCell` and `isCompact_cellFrontier` (`Classical/Basic.lean:337, :346`).
- **Tau Ceti** has `TauCeti.RealProjectiveSpace` (`UniversalCover/RealProjective/Basic.lean:59`, the orbit quotient of `Sⁿ` by `ℤˣ`) and no `CWComplex` use.

### Fix
**Note for the Tau Ceti maintainer: `AlgebraicTopology/README.md`.**

1. **Stage 4 item 6.** Replace "6. Calculate projective spaces in their cellular ranges" with:
   > 6. Build the model CW complexes the checks compute with, as actual `CWComplex` structures:
   > - `S^n = e^0 ∪ e^n` and `D^n = S^(n-1) ∪ e^n`, compatible with Stage 8's cube-to-sphere map;
   > - finite products of finite CW complexes;
   > - `RP^n` on the universal-covers roadmap's `TauCeti.RealProjectiveSpace`, with `RP^k` as its `k`-skeleton;
   > - `CP^n`, defined as `S^(2n+1)/S^1`, with one cell in each even dimension up to `2n` (Hatcher, Examples 0.3, 0.4 and 0.6).
   >
   > Prove that a compact subspace of a CW complex lies in a finite subcomplex (Hatcher, Proposition A.1), and deduce `H_n(X) ≅ colim_k H_n(X^k)` for infinite-dimensional `X` (Lemma 2.34(c)). Then calculate projective spaces in their cellular ranges

   The rest of the item ("and a two-cell complex whose attaching map has degree `m`; …") stays.
2. **Stage 5 item 5.** After "every theorem starting from a `FiberBundle` uses that bridge explicitly." insert:
   > Construct the Hopf fibration `S^1 -> S^3 -> CP^1 = S^2` as a Mathlib `FiberBundle` (Hatcher, Examples 4.44–4.45); the Serre acceptance check uses it.

The ownership sentence already keeps geometric topology out of this: the Hopf fibration is algebraic-topology input, so no request to GeometricTopology is needed.

### Not done, and why
Nothing.

## /28 (medium, missing): one owner for ordinary characteristic classes

### What the verifier corrected
Nothing. The verifier notes that this is the package finding /88 hits from the GeometricTopology side.

### State on main (31403074)
- **No atlas stage owns** the Thom class, the Thom isomorphism, the Euler class, Stiefel–Whitney classes or Steenrod squares in topology. The only matches are QuadraticFormInvariants' Galois classes and ProfiniteCohomology Layer 13.
- **GeometricTopology** plans "The Euler class of an oriented plane bundle in degree-2 cohomology (a small standalone layer on top of Mathlib's bundle theory)" (README lines 797–798, emphasis dropped).
- **The paper items are unchanged:**
  - PAPER-BENOIST-19/111 ("tangentSW, totalClass, realDegree"; "not the quadratic-form Galois classes in QFI Layer 8");
  - PAPER-BENOIST-19/119 (`deg(w1(TM)^2) = χ(M)` mod 2);
  - PAPER-BENOIST-WITTENBERG-20 `steenrod` (semialgebraic `Sq^i`), `gamma-sw` and `wu-pushforward`.
- **Since 28 September** these items, and every other item of both paper routes, feed `DESIGN-AlgebraicTopologyPartII`.
- **Libraries.** Neither pin has any of these, and Mathlib has no orientation of a vector bundle.

### Fix
**Note for the Tau Ceti maintainer: `AlgebraicTopology/README.md`, Stage 6 new item 7.** This is the preferred home; add it after /22's item 6:
> 7. Characteristic classes of real vector bundles over paracompact bases.
> - The Thom class of an `R`-oriented rank-`n` bundle, and the Thom isomorphism `H^i(B;R) ≅ H^(i+n)(D(E), S(E); R)`, `b ↦ p^*b ⌣ c` (Hatcher, Corollary 4D.9), for `R = Z` and oriented bundles and for `R = Z/2` and all bundles.
> - The Gysin sequence of the sphere bundle (Hatcher, §4.D).
> - The Euler class, the restriction of the Thom class to the zero section (Hatcher, *Vector Bundles and K-Theory*, §3.2).
> - The mod-2 Steenrod squares `Sq^i`, with naturality, additivity, the Cartan formula, stability, `Sq^i x = x^2` for `i = |x|` and `0` for `i > |x|`, `Sq^0 = id`, `Sq^1` the Bockstein (Hatcher, §4.L, properties (1)–(7) and Theorem 4L.12), and the Adem relations.
> - Stiefel–Whitney classes, characterised by naturality, the Whitney sum formula, vanishing above the rank and normalisation on the canonical line bundle (*Vector Bundles and K-Theory*, Theorem 3.1).
> - Wu's formula for closed manifolds.
>
> GeometricTopology Layer 10 imports the Euler class, and the paper extensions import the rest.

In the References, add "4.D, 4.L" to the Hatcher sections, and add:
> Allen Hatcher, *Vector Bundles and K-Theory*, Chapter 3

**Atlas side (independent of upstream).**
- The route briefs are unchanged in substance. **Append to the `brief` of the `part-ii` route of `PAPER-BENOIST-19.result.json` and of `PAPER-BENOIST-WITTENBERG-20.result.json`:**
  > Ordinary characteristic classes of real vector bundles — the Thom class and isomorphism, the Gysin sequence, the Euler class, Stiefel–Whitney classes, mod-two Steenrod squares on ordinary cohomology and Wu's formula — are general algebraic topology, not real-locus theory. Import them from AlgebraicTopology Stage 6 if it plans them (RT-AREA-topology.fixes.md /28); otherwise plan them first, in their ordinary topological form, as this extension's first layer, and let the semialgebraic and Borel-equivariant versions (items steenrod, gamma-sw, wu-pushforward; Benoist19 items 111 and 119) consume them and prove their comparison over ℝ.
- `DESIGN-AlgebraicTopologyPartII` quotes each brief's opening and points to the full brief, so the sentence reaches the design job either way.
- **GeometricTopology Layer 10's Euler class** is /88's fix. It should import from the same owner.

### Not done, and why
- **Wu's formula** is named but not stated. I read no public source for it (the standard one is Milnor–Stasheff, *Characteristic Classes*, §11). It stays an obligation for whichever owner plans it.
- **The comparison of the semialgebraic `Sq` with the ordinary one** belongs to the Part II design.

## /29 (medium, missing): the stage edges of AlgebraicTopology

### What the verifier corrected
Nothing.

### State on main (31403074)
- **The extract is unchanged:** every stage has `"requires": []` and `"consumers": []`, and `"stageEdges": []`. The assembled atlas has **no stage edge touching AlgebraicTopology**.
- **The only roadmap-level edge** is the stage-free `declared` edge to ArithmeticLocallySymmetricSpaces, plus four document `reference` links (UniversalCovers, GeometricTopology, HeegaardFloer, ProfiniteCohomology).
- **The dependency table** (lines 405–420) is unchanged. Upstream `main` refines it: Stage 5's product maps (item 1) depend on Stage 2 only.
- **RS-09 and RS-33** (both pending) propose, respectively, 16 and 66 further outbound links from this roadmap; they take effect on acceptance.
- `LINK-tauceti_TauCetiRoadmap_AlgebraicTopology` is pending, with no packet.

### Fix
**Atlas side.** Record the edges below in the AlgebraicTopology link packet, each with its quoted evidence and confidence `explicit` unless marked. When REV-LINK accepts the packet, the build records them as stage `requires`, and recomputes the roadmap's prerequisites (UniversalCovers, GeometricTopology) and consumers (BelyiMaps, FuchsianOrbifolds, GeometricTopology, InverseGalois…) from them.

Every edge below passes the cycle check (`cyc`: "acyclic"). "AT" and "UC" abbreviate the stage ids `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-N-…` and `tauceti:TauCetiRoadmap/UniversalCovers#stage-N-…`.

**Internal edges.** Evidence: the dependency table (lines 405–420) and the stage headers: "This stage consumes Stage 2" (3), "Stages 2 and 3" (4), "Stages 2--4" (5, 8), "every one of Stages 2--6" (7).

| Supplier → consumer | Evidence |
| --- | --- |
| AT2 → AT3; AT2 → AT4; AT3 → AT4 | headers of Stages 3 and 4; "the chain `2 -> 3 -> 4` is strict" |
| AT2 → AT5; AT3 → AT5; AT4 → AT5 | "This stage consumes Stages 2--4." (Stage 5) |
| AT2 → AT6; AT5 → AT6 | "This stage consumes Stage 2 and the product maps of Stage 5." |
| AT3 → AT6 | /22: the duality inductions use excision and Mayer–Vietoris |
| AT2, AT3, AT4, AT5, AT6 → AT7 | "This stage consumes every one of Stages 2--6." |
| AT2 → AT8; AT3 → AT8; AT4 → AT8 | "This stage consumes Stages 2--4" (Stage 8) |
| AT8 → AT5 | /26: Stage 5 item 5 uses Proposition 4.21 |

**Inbound edges.**

| Supplier → consumer | Evidence |
| --- | --- |
| UC3 → AT8 | Stage 8: "the universal-covers roadmap's induced-map and basepoint API". Already in the UniversalCovers packet (/122): record it once. |
| UC0 → AT5 | Ownership: the universal-covers roadmap owns "deck transformations"; Stage 5.3's deck group. The deck group itself is now Mathlib's `deck`, see /39. Already in the UniversalCovers packet (/122): record it once. |
| `tauceti:TauCetiRoadmap/GeometricTopology#layer-1-manifold-library-buildout-general-dimension-general-structure-group` → AT6 | Stage 6: "the boundary/collar conventions owned by geometric topology"; GeometricTopology line 204, "Collar neighbourhoods" |

**Outbound edges.**

| Supplier → consumer | Evidence |
| --- | --- |
| AT1 → `tauceti:TauCetiRoadmap/BelyiMaps#layer-5-the-thrice-punctured-sphere-and-its-fundamental-group` | `data/library-coverage.json`, BelyiMaps Layer 5: "Stage 1 owns the two-open van Kampen theorem that 5.5 pins as a supplier contract" (see /122) |
| AT4, AT7, AT8 → `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-5-compact-surface-degree-theory-and-fuchsian-applications` | FuchsianOrbifolds lines 78–82: "The algebraic-topology roadmap owns finite CW models and Euler characteristic … applies `compactManifoldFiniteCWType` … transports `finiteCWEulerCharacteristic`" |
| AT6, AT7 → `tauceti:TauCetiRoadmap/GeometricTopology#layer-10-foliations-and-their-euler-class` | GeometricTopology lines 809–811: `SingularCohomology 2 M ℤ`, `fundamentalClass S`, `eulerChar S` |
| AT1 → `InverseGaloisAndArithmeticFundamentalGroups:IG.3` (confidence `inferred`) | IG.3 constructs "branched covers from generating tuples with product one via Riemann existence", which needs presentations of `pi_1` of punctured spheres |

**Not repeated here.**
- The HeegaardFloer edges (orientation/degree → AT6; AT3, AT4 → milestone M.1; AT6 → milestone F4.2) are filed under HeegaardFloer.
- The smooth-triangulation supplier edge into AT8 is /71's fix; none is added here.
- RS-09's and RS-33's links wait for their reviews.

### Not done, and why
The edges into the new Stage 0 (/24) wait for upstream to adopt it.

## /30 (medium, library-claim): Stage 2 is largely built at the pin

### What the verifier corrected
Nothing. **Two refinements from reading the pin.**
- **The pair connecting morphism has no naturality lemma at the pin.** Tau Ceti states naturality for triples (`TauCeti.TopTriple.singularHomologyδ_naturality`, `Singular/Triple.lean:175`) but not for pairs (`Singular/Relative.lean`); Mathlib's `SSetPair.homologyδ` (`SimplicialSet/Homology/Relative.lean:351`) has none either. Instantiating `HomologyPretheory`, whose `δ` field is a natural transformation, needs it. The proof is one application of `HomologicalComplex.HomologySequence.δ_naturality`, as in the triple case. So items 2.1 and 2.2 are built, and 2.3 is built except for that square.
- **The file the finding cites for absolute homotopy invariance is a deprecated shim.** `Mathlib/AlgebraicTopology/SingularHomology/HomotopyInvarianceTopCat.lean` is a `deprecated_module (since := "2026-04-10")`. The theorem is `TopCat.Homotopy.congr_homologyMap_singularChainComplexFunctor` in `SingularHomology/HomotopyInvariance.lean:58`.

### State on main (31403074)
- Stage 2 (lines 167–192) is unchanged and presented as a plan. The atlas `status` is `unknown`, and there is no mapped status report and no library-coverage record: `AUDIT-44` has no result, see /65.
- **Read at the pins.** Tau Ceti:
  - `TopPair.toSSetPair` (`Singular/Relative.lean:43`);
  - `TopPair.singularChainComplexFunctor` (:73);
  - `isColimitCokernelCoforkSingularChainComplex` (:139), the relative complex as a cokernel;
  - `shortExact_singularChainComplexShortComplex` (:154), in any abelian category with coproducts;
  - `TopPair.singularHomologyFunctor` (:176);
  - `singularHomologyδ` with `singularHomology_exact_subspace/space/relative` (:239–266);
  - `TopPair.singularHomologyInclIso` (`Singular/Empty.lean:122`), `H_*(X, ∅) ≅ H_*(X)` naturally;
  - `TauCeti.TopTriple` (`Topology/Category/TopTriple.lean:36`), `TopTriple.singularHomologyδ` (`Singular/Triple.lean:134`) and its naturality (:175);
  - `TauCeti.LocalCoefficientSystem R X := FundamentalGroupoid X ⥤ ModuleCat R` (`LocalCoefficient.lean:41`), with `constantFunctor` (:50), `pullback` (:73), `transport` (:203), `monodromyRepresentation` (:267) and `basepointChangeEquiv` (:348). There are no twisted chains.

  Mathlib:
  - `TopPair.HomologyPretheory` (`AlgebraicTopology/EilenbergSteenrod.lean:36`) and `IsHomotopyInvariant` (:144);
  - `TopPair.Homotopy` (`Topology/Category/TopPair.lean:126`);
  - `isZero_singularHomologyFunctor_of_totallyDisconnectedSpace` and `singularHomologyFunctorZeroOfTotallyDisconnectedSpace` (`SingularHomology/Basic.lean:123, :133`);
  - `TopCat.singularHomology₀Iso` (`HomologyZero.lean:36`);
  - `SSetPair.chainComplexFunctor` (`SimplicialSet/Homology/Relative.lean:118`), which is #41285's construction.

### Fix
**Note for the Tau Ceti maintainer: `AlgebraicTopology/README.md`, Stage 2.**
1. **Item 1** (lines 169–172). Replace the item with:
   > 1. **Built at Tau Ceti `f790474`.** Singular chains extend to `TopPair` by applying #41285's `SSetPair` relative-chain construction (in Mathlib: `SSetPair.chainComplexFunctor`) to `TopCat.toSSet` (`TopPair.toSSetPair`, `TopPair.singularChainComplexFunctor`). The relative complex is the cokernel of the subspace chains in the ambient chains (`TopPair.isColimitCokernelCoforkSingularChainComplex`). Import these.
2. **Item 2** (lines 173–175). Replace the item with:
   > 2. **Built at `f790474`.** The relative homology functor `TopPair.singularHomologyFunctor`, for coefficient objects of a preadditive category with coproducts and homology, and the natural comparison `H_*(X, ∅) ≅ H_*(X)` (`TopPair.singularHomologyInclIso`). Import these.
3. **Item 3** (lines 176–178). Replace the item with:
   > 3. **Built at `f790474`, except one square.**
   > - The short exact sequence of chain complexes of a pair (`TopPair.shortExact_singularChainComplexShortComplex`) and its long exact sequence (`TopPair.singularHomologyδ`, `singularHomology_exact_subspace`, `_space`, `_relative`).
   > - The sequence of a triple `B ⊆ A ⊆ X` with its natural connecting morphism (`TauCeti.TopTriple.singularHomologyδ`, `singularHomologyδ_naturality`).
   >
   > Still to prove: the naturality square of the pair connecting morphism, from `HomologicalComplex.HomologySequence.δ_naturality` as in the triple case.
4. **Item 4.** Replace "4. Instantiate `TopPair.HomologyPretheory` and prove homotopy invariance, dimension, additivity, and reduced/unreduced comparison in the interface shape of #38369." with:
   > 4. Instantiate Mathlib's `TopPair.HomologyPretheory` from `singularHomologyFunctor`, `singularHomologyInclIso` and the pair connecting morphism; its field `δ` is a natural transformation, so it needs item 3's square.
   >
   > Prove `IsHomotopyInvariant` for pairs from:
   > - Mathlib's absolute theorem `TopCat.Homotopy.congr_homologyMap_singularChainComplexFunctor`;
   > - `TopPair.Homotopy`;
   > - the five lemma, applied to the projection `(X × I, A × I) -> (X, A)`, whose components are homotopy equivalences.
   >
   > Prove dimension, additivity and the reduced/unreduced comparison in the interface shape of #38369.
5. **Item 5.** See /31.
6. **Item 6.** Replace "6. Define a local coefficient system as a functor from Mathlib's fundamental groupoid to the coefficient-module category. Construct twisted singular chains" with:
   > 6. The local coefficient system is built at `f790474`: `TauCeti.LocalCoefficientSystem R X := FundamentalGroupoid X ⥤ ModuleCat R`, with constant systems, pullback, transport, the monodromy representation and basepoint change (`constantFunctor`, `pullback`, `transport`, `monodromyRepresentation`, `basepointChangeEquiv`). On it, construct twisted singular chains

   The rest of item 6 ("and relative homology, pullback along maps, …") stays.

**Atlas side.** The library record belongs to `AUDIT-44` (pending; /65). The declarations above are its evidence at the pin.

### Not done, and why
Upstream has built more of Stage 2 since the pin (its `STATUS.md`, 26 September, reports the `HomologyPretheory` instance and twisted chains). Those declarations are not at the pin and are not claimed here. The audit should read them when the library pin moves.

## /31 (medium, error): the `(D^n, S^(n-1))` calculation and its sign move to Stage 3

### What the verifier corrected
Nothing. Locators read: Hatcher, Corollary 2.14 (p. 114), Proposition 2.22 (p. 124) and Example 2.23 (p. 125). Example 2.23 finds a generator of `H_n(Δ^n, ∂Δ^n)` "by induction on n", using the identity simplex.

Upstream confirms the point. Its `STATUS.md` records `H_(k+1)(D^n, S^(n-1)) ≅ H~_k(S^(n-1))` in Stage 2 but "not the reduced homology of the sphere or the connecting-map sign". Its frontier computes the spheres by suspension, a Stage 3 tool, and says that pinning the sign closes item 5 of Stages 2 and 3.

### State on main (31403074)
Unchanged:
- item 2.5, line 181: "Calculate `(D^n,S^(n-1))`, a point, a discrete space, and a disjoint union. These calculations fix the degree-zero and connecting-map conventions used in every downstream stage.";
- item 3.5, lines 209–210;
- the acceptance check, lines 426–427;
- the strictness sentence, lines 418–420.

### Fix
**Note for the Tau Ceti maintainer: `AlgebraicTopology/README.md`.**
1. **Item 2.5.** Replace the item with:
   > 5. Calculate a point, a discrete space and a disjoint union. Mathlib already has the first two: `isZero_singularHomologyFunctor_of_totallyDisconnectedSpace`, `singularHomologyFunctorZeroOfTotallyDisconnectedSpace` and, in degree zero, `TopCat.singularHomology₀Iso`. These calculations fix the degree-zero convention used downstream; Stage 3 item 6 fixes the connecting-map convention.
2. **New Stage 3 item 6.**
   > 6. Calculate `H_*(S^n)` and `H_*(D^n, S^(n-1))` with explicit generators: the identity simplex generates `H_n(Δ^n, ∂Δ^n)` (Hatcher, Example 2.23). Fix against them the sign of the connecting morphism `H_n(D^n, S^(n-1)) -> H~_(n-1)(S^(n-1))`; every later stage uses this convention.
3. **Acceptance check** (lines 426–427). Replace "Relative homology of `(D^n,S^(n-1))` and the connecting morphism to the sphere generator have the pinned sign." with:
   > Relative homology of `(D^n,S^(n-1))` and the connecting morphism to the sphere generator have the pinned sign (Stage 3 item 6).

### Not done, and why
Nothing.

## /32 (medium, error): finite-cover multiplicativity by lifting cells, not from transfer

### What the verifier corrected
Nothing. Locators read:
- Hatcher §2.2, Exercise 22 (p. 157): "For X a finite CW complex and p : X̃→X an n-sheeted covering space, show that χ(X̃) = nχ(X).";
- §3.G (p. 321): "The composition π♯τ is clearly multiplication by n", and Proposition 3G.1;
- Example 3G.2 (p. 322): for `X = S^1 ∨ S^k`, the invariant cohomology in degree `k` is one copy of `G`, while the cover has `n` spheres.

### State on main (31403074)
Item 7.3 (line 359) is unchanged: "Prove finite-cover multiplicativity from transfer and additivity for finite excisive decompositions from Mayer--Vietoris."

### Fix
**Note for the Tau Ceti maintainer: `AlgebraicTopology/README.md`, Stage 7 item 3.** Replace "Prove finite-cover multiplicativity from transfer and additivity" with:
> Prove finite-cover multiplicativity `chi(E) = d · chi(B)`, for a `d`-sheeted covering of a finite CW complex `B`, by lifting the CW structure. Characteristic maps lift from the simply connected discs, so `E` is a finite CW complex with `d` cells over each cell of `B` (Hatcher, §2.2, Exercise 22). This uses Stage 4's cellular chains and item 1. Over a disconnected base, state it componentwise with the locally constant degree. Prove additivity

The rest of the item stays. Stage 5.3's transfer keeps its rational statements.

### Not done, and why
Nothing.

## /33 (medium, duplicate): Stage 8.1 imports the absolute homotopy API, and 8.2 starts from Mathlib's Kan pieces

### What the verifier corrected
Nothing.

### State on main (31403074)
- **The texts are unchanged:**
  - item 8.1 (lines 371–373) plans "Extend cubical `HomotopyGroup` with pointed maps, functoriality, basepoint change";
  - the Ownership section (lines 48–51) gives those to UniversalCovers;
  - item 8.2 (lines 381–383) reads "Following #42435, construct homotopy groups of Kan simplicial sets".
- **The UniversalCovers link map (partial, unreviewed)** records overlap 3 with recommendation `rescope`, and a link from UC Stage 3 to AT Stage 8.
- **RS-33 (pending)** makes UC Stage 3 the owner of "Ordinary higher-homotopy induced maps and change of basepoint", but narrows only H.2.
- **Read at the pin:**
  - Tau Ceti: `HomotopyGroup.map` (`Topology/Homotopy/HomotopyGroup/Map.lean:119`), `HomotopyGroup.mapHom` (:222), `TauCeti.homotopyGroupEquivOfPath` (`BasepointChange.lean:349`), `TauCeti.homotopyGroupMulEquivOfPath` (:424), `HomotopyGroup.mulEquivOfHomotopyEquiv` (`HomotopyEquiv.lean:178`), `GenLoop.homotopic_iff_joined` (`Homotopy.lean:87`), `TauCeti.homotopyGroupMulAction` (`FundamentalGroupAction.lean:134`), `HomotopyGroup.loopSpaceMulEquiv` (`LoopSpace.lean:283`) and `TauCeti.isPathConnected_cubeBoundary` (`Topology/Homotopy/Cube/Basic.lean:122`, `[Nontrivial N]`).
  - Mathlib: `SSet.PtSimplex`, `PtSimplex.RelStruct` and `PtSimplex.MulStruct` (`SimplicialSet/KanComplex/MulStruct.lean:35, :98, :159`), but no Kan homotopy groups and no Kan instance for `TopCat.toSSet`.

### Fix
**Note for the Tau Ceti maintainer: `AlgebraicTopology/README.md`, Stage 8.**
- **Item 8.1.** The replacement is given under /23. It narrows 8.1 to the based pair, the relative groups, their induced and boundary maps, the long exact sequence and the fibration theorem. It imports the absolute API above by name, and asks for the compatibility of the relative boundary map with `homotopyGroupEquivOfPath`.
- **Item 8.2.** Replace "2. Following #42435, construct homotopy groups of Kan simplicial sets," with:
  > 2. Following #42435, and starting from Mathlib's `SSet.PtSimplex`, `PtSimplex.RelStruct` and `PtSimplex.MulStruct`, construct homotopy groups of Kan simplicial sets,

**Atlas side.** UC3 → AT8 is in /29.

### Not done, and why
Nothing.

## /34 (low, library-claim): generation and uniqueness in Stage 1 are built
**State.** Items 1.2–1.3 (lines 151–155) are unchanged.

**Read at `f790474`.** In `TauCeti/AlgebraicTopology/FundamentalGroupoid/CoverGeneration.lean`, for a family `U : ι → Set X` with `hU : ∀ x, ∃ i, U i ∈ 𝓝 x`:
- `TauCeti.FundamentalGroupoid.iSup_im_map_subtypeVal_eq_top` (:104) says the images of the inclusion functors generate `FundamentalGroupoid X`;
- `TauCeti.FundamentalGroupoid.functor_ext` (:127) says two functors agreeing after every inclusion are equal.

**Note for the Tau Ceti maintainer.**
- **Item 2.** Replace "2. Prove by subdivision of paths that every morphism in `FundamentalGroupoid X` is a composite of morphisms lying in cover members." with:
  > 2. Generation is built: for `U : ι → Set X` with `∀ x, ∃ i, U i ∈ 𝓝 x`, which includes open covers, `TauCeti.FundamentalGroupoid.iSup_im_map_subtypeVal_eq_top` proves by subdivision of paths that every morphism of `FundamentalGroupoid X` is a composite of morphisms lying in cover members.
- **Item 3.** After "prove its colimit universal property" insert:
  > (uniqueness of factorizations is built, `TauCeti.FundamentalGroupoid.functor_ext`; existence remains)
- **Item 1.** Replace "State the cover either as a jointly-surjective family or by `iSup U = top`, following #41603's chosen shape." with:
  > State the cover hypothesis as `∀ x, ∃ i, U i ∈ 𝓝 x`, the form the built generation theorem uses, unless #41603's final shape differs.

The relations, the existence half, naturality, refinement and items 4–5 stay open. Upstream has since built more of Stage 1 (its `STATUS.md`); none of that is claimed here.

## /35 (low, duplicate): one owner each for Euler–Poincaré and fibration multiplicativity
**State.** Items 4.4, 7.1, 5.5 and 7.2 are unchanged (lines 233, 353–358, 289–290).

**Note for the Tau Ceti maintainer.** I choose the split that keeps each theorem next to its machinery.
- **Item 7.1.** Replace "prove equality with the alternating rank of homology over a field." with:
  > import from Stage 4 item 4 its equality with the alternating rank of homology over a field.
- **Item 5.5.** Delete "Derive Euler-characteristic multiplicativity when base and fibre have finite CW type."
- **Item 7.2.** Replace "multiplicativity for fibre bundles with finite-CW base and fibre. The bundle theorem must be derived from Stage 5's chain or spectral-sequence machinery." with:
  > multiplicativity `chi(E) = chi(B) chi(F)` for Serre fibrations, in particular fibre bundles, with finite-CW base and finite-CW-type fibre, derived from Stage 5's Serre spectral sequence.

The Serre acceptance check keeps its wording.

## /36 (low, error): the fibre-bundle bridge needs no paracompact base
**State.** Line 277–278 is unchanged: "Prove that the projection of Mathlib's locally trivial `FiberBundle` over a paracompact base has this lifting property;".

**Read.** Hatcher, Proposition 4.48 (p. 379): "A fiber bundle p : E→B has the homotopy lifting property with respect to all CW pairs (X, A)". Huebsch–Hurewicz, over paracompact bases, gives lifting for all spaces.

**Note for the Tau Ceti maintainer.** Replace the quoted clause with:
> Prove that the projection of Mathlib's locally trivial `FiberBundle` has this lifting property over any base (Hatcher, Proposition 4.48); if the homotopy lifting property for all spaces is needed, state it separately over a paracompact base;

## /37 (low, error): Hatcher locators
**State.** Unchanged: line 401, line 240 and line 470.

**Read.** Hatcher's table of contents:
- 4.1: "Whitehead's Theorem 346. Cellular Approximation 348. CW Approximation 352";
- 4.2: "The Hurewicz Theorem 366";
- Theorem 4.8 (p. 349), Theorem 4.32 (p. 366), Theorem 4.37 (p. 371) and Theorem 2A.1 (p. 166).

**Note for the Tau Ceti maintainer.**
- **Line 401.** Replace "Hatcher Section 4.1 gives the absolute Hurewicz and Whitehead arguments;" with:
  > Hatcher Section 4.1 gives Whitehead's theorem, cellular approximation and CW approximation, Section 4.2 the Hurewicz theorems (Theorems 4.32 and 4.37), and Section 2.A `H_1 = pi_1^ab` (Theorem 2A.1);
- **Line 240.** Replace "Hatcher, Sections 0.4 and 2.2, supplies CW pairs, cellular approximation, and cellular homology." with:
  > Hatcher, Sections 0.4 and 2.2, supplies CW pairs and cellular homology, and Section 4.1 (Theorem 4.8) cellular approximation.
- **Line 470.** Replace "Sections 0.4, 1.2, 2.1--2.2, 3.1--3.3, 3.B, 3.G--3.H, 4.1, and 4.G." with:
  > Sections 0.4, 1.2, 2.1--2.2, 2.A, 3.1--3.3, 3.B, 3.G--3.H, 4.1--4.2, and 4.G.

  If /28 is adopted, add 4.D and 4.L.

## /38 (low, error): the homology-sphere corollary needs CW type
**State.** Item 8.7 (lines 398–399) is unchanged.

**Read.** Hatcher:
- Theorem 4.32 and Corollary 4.33 (pp. 366–367, homological Whitehead for simply connected CW complexes);
- Proposition A.11 (p. 528, "A space dominated by a CW complex is homotopy equivalent to a CW complex"), which is the step in the verifier's Warsaw-circle argument.

**Note for the Tau Ceti maintainer.** Replace "As a reusable corollary, prove that a simply connected integral homology `n`-sphere, `n>=2`, is homotopy equivalent to the standard `S^n`." with:
> As a reusable corollary, prove that a simply connected space of CW type with the integral homology of `S^n`, `n>=2`, is homotopy equivalent to `S^n`, by items 3 and 5. Deduce the closed-manifold case from the finite-CW-type theorem above.

The CW-type hypothesis cannot be dropped: `S^n ∨ W`, with `W` the Warsaw circle, is a counterexample.

## /39 (low, library-claim): deck groups are Mathlib's `deck`, and the permutation local system is a composite
**State.**
- Ownership (lines 48–51) and item 5.3 (lines 263–272) are unchanged.
- Upstream line 48 now links `../../Completed/UniversalCovers/README.md`; the quoted words below are the same there.

**Read.**
- Mathlib `082e2d3`: `deck` (`Topology/Covering/Deck.lean:41`, carrier `{h | p ∘ h = p}`, for any `p : E → X`); `IsCoveringMap.monodromyFunctor : FundamentalGroupoid X ⥤ Type _` (`Topology/Homotopy/Lifting.lean:456`); `ModuleCat.free R : Type u ⥤ ModuleCat R` (`Algebra/Category/ModuleCat/Adjunctions.lean:40`).
- Tau Ceti: `TauCeti.LocalCoefficientSystem` (`LocalCoefficient.lean:41`) and `TauCeti.ConnectedCoveringSpace.monodromyEquivalence` (`Classification/MonodromyEquivalence.lean:157`).

**Note for the Tau Ceti maintainer.**
- **Ownership.** Replace "owns universal-cover construction, deck transformations, quotient covers, basepoint change, and induced maps on homotopy groups." with:
  > owns universal-cover construction, the identification of deck groups with `pi_1` and with `N(H)/H`, quotient covers, basepoint change, and induced maps on homotopy groups; the deck transformation group itself is Mathlib's `deck`.
- **Item 5.3.** Replace "For a nonregular finite cover, encode the sheets by the permutation local system" with:
  > For a nonregular finite cover, encode the sheets by the permutation local system, Mathlib's `IsCoveringMap.monodromyFunctor` composed with `ModuleCat.free R`, as a `TauCeti.LocalCoefficientSystem`,
- **Item 5.3.** Replace "For a regular cover with finite deck group `G`" with:
  > For a regular cover with finite deck group `G = deck p`

## /40 (low, other): three extensions claim "Part II"; the papers' two are now one job, RS-33's still collides
**What changed since 24 September.**
- On 28 September the queue (`1018ef24`) turned every paper Part II proposal with this parent into one job, `DESIGN-AlgebraicTopologyPartII`, titled "Algebraic topology of spaces and manifolds, Part II" (`make_queue.py`, `paper_designs`). The job carries PAPER-BENOIST-19's and PAPER-BENOIST-WITTENBERG-20's EquivariantTopologyRealVarieties and PAPER-BROWNING-SAWIN-20's ConfigurationSpacesAndRationalLoops, with the instruction: "Plan them as this one roadmap, merging what overlaps; if they split into independent directions, plan the first here and record a restructure proposal for the rest".
- **What still collides.** RS-33 (review pending) retitles StableHomotopyKTheory "Algebraic topology of spaces and manifolds, Part II: homotopy foundations for algebraic K-theory". The generator detects an existing Part II only by the id `AlgebraicTopologyPartII` ("Where the atlas already has that Part II, the job plans a Part III on top of it"), so it will not see RS-33's.

**Coordinator decision.** Recommended: keep the extensions as siblings with distinct subtitles, not a numbered chain. None builds on another, and the generator reads "Part III" as built on Part II.

**Exact text once decided.**
1. **`research/blueprint/restructure/RS-33.result.json`, `roadmaps.StableHomotopyKTheory.reason`.** Append:
   > It is one of several extensions of AlgebraicTopology. It stops before configuration spaces, rational homotopy of spaces (Sullivan models, rational H-spaces) and C2-equivariant or semialgebraic cohomology, which the paper-driven extension plans. That extension imports this one's path-space fibrations, homotopy fibres and fibre sequence (H.2); rationalization here (H.6) is of spectra, not of spaces.
2. **The `brief` of each `part-ii` route** in `PAPER-BENOIST-19`, `PAPER-BENOIST-WITTENBERG-20` and `PAPER-BROWNING-SAWIN-20`. Append:
   > A sibling extension of the same parent, StableHomotopyKTheory (RS-33, "Part II: homotopy foundations for algebraic K-theory"), owns path-space homotopy fibres, the fibre sequence, group completion and spectra; import them, and give this extension its own subtitle. Ordinary characteristic classes are the parent's or this extension's first layer (RT-AREA-topology.fixes.md /28); rational homotopy of spaces is this extension's.
3. **Atlas maintainer, `make_queue.py` `paper_designs`.** A restructure that `extend`s the same parent (RS-33's StableHomotopyKTheory) should count as an existing sibling, not be missed. The consolidated job then takes a subtitle from its routes instead of the bare "Part II".

## CombinatorialHeegaardFloer (/41–/58, /60, /62–/65): conventions

**Common to every section below.**
- **CHF** is `content/tau-ceti/CombinatorialHeegaardFloer/README.md`, a snapshot of the upstream TauCetiRoadmap. Every fix to it is a note for the Tau Ceti maintainer (PROTOCOL.md §15). Atlas-side edits (stage edges, and the audit record) are exact edits for the atlas maintainer; they are collected in /64 and /65.
- **State since the review (24 September).** CHF last changed at `0dc5f1fe` (15 September). Its sha256 `b0a06bcb…` equals the README hash that `data/tauceti-progress.json` (29 September) records for upstream TauCetiRoadmap `912674d4`, so upstream has not changed it either. The extract `research/blueprint/atlas/roadmaps/tauceti_TauCetiRoadmap_CombinatorialHeegaardFloer.json` last changed on 16 September. At 31403074 all 22 CHF stages still have `requires: []` and `consumers: []`, and no stage edge touches CHF. The one new item is the Tau Ceti Progress overlay, which is covered in /65.
- **Quotations.** Quotations ignore the README's line wrapping; line numbers are at 31403074. Replacement texts are for the upstream README. They name book and paper locators, never this report's finding numbers.
- **"The book"** is Ozsváth–Stipsicz–Szabó, *Grid Homology for Knots and Links* (AMS SURV 208, 2015), preliminary version, cited by printed page numbers. I extracted the text of all 415 PDF pages. Only six blank pages gave no text, so every locator below was read, including those the verifier could not reach (Proposition 3.1.13 and the "untied" sentence on p. 49, Corollary 3.2.3 on p. 50, and Proposition 4.3.3 on p. 68).
- **Library citations** were read at Tau Ceti `f790474` and Mathlib `082e2d3`.

## /41 (high, error): the link normalisation is (n − ℓ) in the grading and in the stabilisation exponent

### What the verifier corrected
- Nothing was narrowed. The verifier found Lemma 8.2.1 on p. 136 and Lemma 8.2.3 on p. 137. In MOST's source it found the per-component shift `−(n_i − 1)/2` and the fully blocked factor `⊗ V_i^{⊗(n_i−1)}`, whose total exponent is `n − ℓ`.
- It also confirmed the Tau Ceti side: `Gradings.lean:91`, `Grading/Parity.lean:279` and `Algebra/Bigraded/Stabilization.lean:17`.
- **Binding:** fix this finding together with /42 (the knot/link boundary).

### State on main (31403074)
- **CHF lines 113–115:** "The fully blocked grid homology `GH̃(G)` depends on grid size: `GH̃(G) ≅ GĤ(L) ⊗ W^{⊗(n−1)}` with `W = 𝔽 ⊕ 𝔽` in bigradings (0,0), (−1,−1);"
- **Lines 119–120:** "Alexander via `A = ½(M_O − M_X) − (n−1)/2`: integer-valuedness is a lemma, not a definition."
- **G.2, lines 173–174:** "**Gradings.** The `J`-function, `M_O`, `M_X`, `A`; integer-valuedness of `A`; grading-change formulas across a rectangle."
- **Tau Ceti, read at the pin:**
  - `TauCeti.GridDiagram.alexander` (`TauCeti/KnotTheory/Grid/Gradings.lean:91`) is `(maslovO x − maslovX x)/2 − ((n : ℤ) − 1)/2`.
  - `TauCeti.GridDiagram.alexander_exists_int_iff` (`Grid/Grading/Parity.lean:279`): `(∃ a : ℤ, G.alexander x = a) ↔ Odd G.componentCount`.
  - Hence the bigraded statements are made for `TauCeti.OddComponentGridDiagram` (`Parity.lean:319`).
  - The module doc of `TauCeti/Algebra/Bigraded/Stabilization.lean` (line 17) already writes `W^{⊗(n-ℓ)}`.

### Fix: note for the Tau Ceti maintainer
The sources are the book's Eq. (8.2) and Lemma 8.2.1 (p. 136), Propositions 8.2.8 and 8.2.10 (p. 138), Eqs. (11.1) and (11.3) (p. 189), and Lemma 11.2.4 (p. 193).
1. **"Track stabilization factors explicitly" (lines 113–115).** Replace the quoted sentence with:
   > The fully blocked grid homology `GH̃(G)` depends on grid size: for an `n × n` grid of an `ℓ`-component link `L`, `GH̃(G) ≅ GĤ(L) ⊗ W^{⊗(n−ℓ)}` (book Proposition 8.2.8; Proposition 4.6.15 is the knot case `ℓ = 1`), where `GĤ(L)` blocks one `O`-marking on each component (Definition 8.2.7) and `W = 𝔽 ⊕ 𝔽` in bigradings (0,0), (−1,−1);
2. **"Mind the bigrading bookkeeping" (lines 119–120).** Replace "Alexander via `A = ½(M_O − M_X) − (n−1)/2`: integer-valuedness is a lemma, not a definition." with:
   > the collapsed Alexander grading of an `n × n` grid of an `ℓ`-component link via `A = ½(M_O − M_X) − (n−ℓ)/2` (book Eq. (8.2); `(n−1)/2` for a knot). Its integer-valuedness for every grid diagram is a lemma, not a definition (Lemma 8.2.1, from `M_X(x^{NW}_O) ≡ n − ℓ (mod 2)`). The Alexander multi-grading of G.9 shifts the `i`-th component by `(n_i − 1)/2`, where `n_i` is its number of `O`-markings (Eq. (11.1)); its components sum to `A` (Eq. (11.3), Lemma 11.2.4).
3. **G.2 (lines 173–174).** Replace with:
   > 2. **Gradings.** The `J`-function, `M_O`, `M_X`, and the collapsed Alexander grading `A` of the standing conventions; integer-valuedness of `A` for every grid diagram (book Lemma 8.2.1; Proposition 4.3.3 for knots); grading-change formulas across a rectangle.
4. **G.9 and G.10.** G.9's link Euler characteristics are the book's Proposition 8.2.10, (8.5)–(8.7), in this normalisation; that text is part of the G.9 replacement under /47. G.10's collapsed link complex is under /45.
5. **Library record, for the audit (/65).**
   - `TauCeti.GridDiagram.alexander` is the knot normalisation, and it is right for knots.
   - The link grading of items 1–2 is `alexander x + (ℓ − 1)/2`, with `ℓ = componentCount`. It is integral for every diagram. For odd `ℓ` both terms are integers. For even `ℓ` both are strict half-integers: `alexander` by `alexander_exists_int_iff` and the Parity docstring ("every Alexander grading is a strict half-integer").
   - So G.9's and G.10's link statements are not restricted to `OddComponentGridDiagram`.
   - The link grading is not built at the pin.

### Not done, and why
- The acceptance line 283–285 ("`GH̃` of an `n × n` unknot grid exhibits the `W^{⊗(n−1)}` factor") is correct as it stands (`ℓ = 1`) and is left unchanged.
- No Tau Ceti code change is proposed.

## /42 (medium, error): "all V_i act identically" holds for knots; for links the actions split by component

### What the verifier corrected
- Nothing was narrowed. The verifier read Remark 4.6.10 (p. 79) and MOST's lemma on `U_i`, `U_k` for markings on one component, and it confirmed `Grid/Chain/Complex.lean:25`.
- **Binding:** fix with /41.

### State on main (31403074)
- **G.6, lines 188–189:** "**All `V_i` act identically on homology**; `GH⁻` as `𝔽[U]`-module; the structure theorem for finitely generated bigraded `𝔽[U]`-modules; **τ**."
- **Tau Ceti.** The grid complexes and `TauCeti.GridLink` (`Grid/Move.lean:147`) are defined for every grid diagram. The module doc of `Grid/Chain/Complex.lean` (lines 25–28) says the one-variable specialisation "has the standard simply blocked interpretation for knot grids; for a multi-component link, that interpretation instead requires one blocked `O`-marking on each component".

### Fix: note for the Tau Ceti maintainer
Replace G.6 (lines 188–189) with:
> 6. **The `V_i` actions** (numbered 6, but part (a) is needed by G.5).
>    (a) *Knots.* For a grid diagram of a knot, multiplication by `V_i` and by `V_j` are chain homotopic as maps of bidegree `(−2, −1)` (book Lemma 4.6.9, by homotopies counting rectangles that contain one `X` in their interior). So `GH⁻(G)` is a bigraded `𝔽[U]`-module, `U` acting as any `V_i` (Definition 4.6.11). (That `GĤ(G)` does not depend on which `V_i` is set to zero is Corollary 4.6.17, from Proposition 4.6.15.)
>    (b) *Links.* `V_i ≃ V_j` when `O_i` and `O_j` lie on the same component (Lemma 8.2.3); for different components the actions are in general not chain homotopic (Remark 4.6.10). The link invariants are the collapsed `cGH⁻` over `𝔽[U]` (Definition 8.2.4, Theorem 8.2.5) and the homology over `𝔽[U₁, …, U_ℓ]` (Remark 8.2.6, Chapter 11); both are stated in G.9.
>    τ is defined in G.7, after the crossing-change maps. The structure theorem for finitely generated bigraded `𝔽[U]`-modules is Lane ALG's (book Proposition A.4.3) and is first used in G.8 (Proposition 7.3.3).

### Not done, and why
Nothing.

## /43 (medium, error): G.5 needs G.6(a) and switch invariance; τ comes after the crossing-change maps

### What the verifier corrected
- All four parts are confirmed, and nothing was narrowed. The locators all matched: p. 114 (the proof of Proposition 6.1.4), p. 107 (Theorem 5.3.1's appeal to Lemma 4.6.9), p. 99 (Proposition 5.1.8) and p. 105 (Proposition 5.2.17, a quasi-isomorphism).
- `IsMove` and the degenerate row-sharing commutations are as the finding describes.

### State on main (31403074)
- **Lines 164–165:** "Follow Ozsváth–Stipsicz–Szabó's book, whose chapters are nearly a blueprint already. Milestone order:"
- **G.5, lines 182–187:** "**Invariance over 𝔽₂.** Grid moves = commutation + (de)stabilization. Commutation: pentagon-counting chain maps with hexagon-counting homotopies. Stabilization: identify `GC⁻(G')` with the mapping cone of `V₁ − V₂ : GC⁻(G)[V₁] → GC⁻(G)[V₁]` (consume Mathlib's cones). ⚠ The homologies of the *blocked* theories depend on grid size through `⊗W` factors; only the stabilization-quotient (or `GĤ`, `GH⁻`) is the link invariant."
- **G.6** is quoted under /42. **G.7, lines 190–192:** "**`|τ(K)| ≤ u(K)`** via crossing-change maps; `τ(T_{p,q})` via the canonical cycle; **the Milnor conjecture** (book Chapter 6, after Sarkar [arXiv:1011.5265](https://arxiv.org/abs/1011.5265))."
- **Tau Ceti:**
  - `TauCeti.GridDiagram.IsMove` (`Grid/Move.lean:62`) has cyclic row and column permutations, commutations, stabilizations and destabilizations.
  - `IsStabilization` (`Grid/Stabilization/Basic.lean:305`) covers "the eight standard stabilization types" (module doc).
  - `ColumnsNoninterleaving` (`Grid/Commutation/Basic.lean:108`) is "robust in degenerate row-sharing cases", so `IsCommutation` (`Commutation/Move.lean:154`) admits switch configurations.
  - No pentagon, hexagon or stabilisation chain map exists at the pin; the commutation files defer them as "later".

### Fix: note for the Tau Ceti maintainer
1. **Line 165.** Replace "Milestone order:" with:
   > Milestones (numbered by topic; each states what it needs, and in one place the dependencies differ from the numbering: G.6(a) comes before G.5):
2. **G.5 (lines 182–187).** Replace with:
   > 5. **Invariance over 𝔽₂** (needs G.6(a) and Lane ALG's bigraded cones). The grid moves are those of Tau Ceti's `GridDiagram.IsMove`: cyclic permutations (the identity on the torus; the differentials are already intertwined), commutations including switch configurations, and (de)stabilizations of all eight types.
   > - Commutation and switch: pentagon-counting chain maps with hexagon-counting homotopies (book Propositions 5.1.7 and 5.1.8). For a switch, the `O` and `X` sharing a row lie in one square between the curved circles (Figure 5.10).
   > - Stabilization of type `X:SW`: a quasi-isomorphism of bigraded complexes over `𝔽[V₁,…,Vₙ]` from `GC⁻(G′)` to `Cone(V₁ − V₂ : GC⁻(G)[V₁] → GC⁻(G)[V₁])` (Proposition 5.2.17; not an identification), with `H(Cone(V₁ − V₂)) ≅ GH⁻(G)` (Lemma 5.2.16).
   > - Other types: every other type reduces to `X:SW` by switches and commutations (Corollary 3.2.3, Lemma 3.2.2). Alternatively, build the explicit maps for all four `X`-types (Proposition 5.4.1), which G.7 and G.11 reuse.
   > - That the `𝔽[U]`-module `GH⁻(G)` does not depend on which `V_i` acts as `U` uses G.6(a): the proof of Theorem 5.3.1 and the projection (5.24). For `GĤ` the corresponding independence is Corollary 4.6.17.
   >
   > ⚠ The homologies of the *blocked* theories depend on grid size through `⊗W` factors; only the stabilization-quotient (or `GĤ`, `GH⁻`) is the link invariant.
3. **G.6** takes /42's replacement: τ and the structure theorem leave G.6.
4. **G.7** takes the replacement under /44. In order it has the crossing-change maps (§6.2), the grid unknotting lemma (p. 49) and the rank-one theorem (Proposition 6.1.4), and only then τ (Definition 6.1.5).
5. **The structure theorem** is used at Proposition 7.3.3, in G.8 (under /46), and built in Lane ALG item 2 (under /51).
6. **Edges** G.6 → G.5, Lane ALG → G.5 and G.5 → G.7 are in /64.

### Not done, and why
The note names both routes for the stabilisation types (Corollary 3.2.3, or the explicit maps of Proposition 5.4.1); choosing between them is the maintainer's call.

## /44 (high, missing): the unknotting number gets an owner, and G.7 states its topology

### What the verifier corrected
- Nothing was narrowed. The verifier confirmed that "unknotting", "crossing change" and "torus knot" occur in no atlas stage, and that the README signatures and "nothing in Lane G waits for topology" are verbatim.
- It checked Definition 3.1.12 (p. 48), and Lemma 6.3.4 (p. 121, proof on p. 122).

### State on main (31403074)
- **v1 goal, lines 69–72:** the Milnor conjecture "`u(T_{p,q}) = (p−1)(q−1)/2` … by pure combinatorics".
- **Lean shapes, lines 88–90:** "`theorem tau_le_unknotting (K : GridKnot) : |τ K| ≤ unknottingNumber K`", "`theorem milnor_conjecture (p q : ℕ) (h : Nat.Coprime p q) : unknottingNumber (torusKnot p q) = (p - 1) * (q - 1) / 2`".
- **Lines 103–104:** "Reconciliation theorems connect representations later; nothing in Lane G waits for topology."
- **G.7** is quoted under /43.
- **Lane K, lines 226–234:** it consumes GeometricTopology layer 4 ("the presentations …, the maps between them, slice-ness, and the knot polynomials").
- **GeometricTopology Layer 4** ("What to build", lines 424–478) plans no crossing change and no unknotting number.
- **Atlas:** a search of every stage text of the assembled graph finds "unknotting", "crossing change" and "torus knot" in no stage.
- **Tau Ceti:** no declaration mentions unknotting or crossing changes. The only "cross-commutation" hits are in the Jordan-decomposition files.

### Fix: note for the Tau Ceti maintainer
1. **G.7 (lines 190–192).** Replace with:
   > 7. **Crossing changes, τ, and the Milnor conjecture** (needs G.5 and G.6(a); for the classical unknotting number, Lane K and the geometric-topology roadmap's layer 4). In order:
   >    (i) the crossing-change maps `C₋ : GH⁻(K₊) → GH⁻(K₋)` and `C₊ : GH⁻(K₋) → GH⁻(K₊)` with `C₋C₊ = U = C₊C₋`, on two grids that differ by a cross-commutation (book Proposition 6.1.1, §6.2; Definition 3.1.12);
   >    (ii) the grid unknotting lemma: every knot grid reaches a `2 × 2` unknot grid by commutations, switches, destabilizations and cross-commutations (p. 49);
   >    (iii) `GH⁻(K)/Tors ≅ 𝔽[U]`, supported where `d − 2s = 0` (Proposition 6.1.4, from (i), (ii), Lemma 6.1.3 and `GH⁻(O) ≅ 𝔽[U]`, Proposition 4.8.1);
   >    (iv) **τ** (Definition 6.1.5), `0 ≤ τ(K₊) − τ(K₋) ≤ 1` (Theorem 6.1.7) and `|τ(K)| ≤ u(K)` (Corollary 6.1.8);
   >    (v) the canonical grid cycles `x^±` (§6.4), and `τ(T_{−p,q}) = −(p−1)(q−1)/2` on the staircase grid (Proposition 6.3.1, Lemma 4.8.4), i.e. the grid of Exercise 3.1.5(c) with `σ_O` the identity and `σ_X` a cyclic shift, which represents the *negative* torus knot;
   >    (vi) **the Milnor conjecture** `u(T_{p,q}) = (p−1)(q−1)/2` for coprime `p, q ≥ 1` (Corollary 6.3.3), from (iv), (v), the upper bound `u(T_{p,q}) ≤ (p−1)(q−1)/2` (Lemma 6.3.4, on the standard braid diagram) and `u(T_{−p,q}) = u(T_{p,q})`.
   >
   > The value `τ(T_{p,q}) = (p−1)(q−1)/2` for the positive torus knot needs G.8's mirror formula (Corollary 7.4.5, Example 7.4.6). The book's proof is inspired by Sarkar ([arXiv:1011.5265](https://arxiv.org/abs/1011.5265)).
   >
   > Here `u(K)` is the unknotting number of the geometric-topology roadmap's layer 4. Lane K bridges diagrams and grids: a cross-commutation of grids is a crossing change, and a crossing change of a grid-approximated diagram is realised by a cross-commutation (Proposition 3.1.13, §6.2).
   >
   > A grids-only variant may define `u_grid(G)` as the least number of cross-commutations in a sequence of grid moves and cross-commutations ending at an unknot grid. Then (iv) holds for `u_grid`, and `u_grid = u` is a Lane K target.
2. **Lean shapes (lines 88–90).** Keep the two theorems. Append these comment lines:
   > `-- unknottingNumber: the unknotting number of GeometricTopology layer 4 (via Lane K), or u_grid with u_grid = u proved in Lane K`
   > `-- torusKnot p q: the positive torus knot of GeometricTopology layer 4; the staircase grid (Tau Ceti's GridDiagram.torusLink) represents the negative one`
3. **Standing conventions (lines 103–104).** Replace "Reconciliation theorems connect representations later; nothing in Lane G waits for topology." with:
   > Reconciliation theorems connect representations later. G.1–G.6, G.12 and G.13 need no topology. G.4's general statement and G.7–G.11 and G.14 are theorems about classical invariants (the Alexander polynomial, the unknotting number, the Seifert and slice genus, the signature, the multivariable Alexander polynomial, Legendrian knots, the concordance group). They consume the geometric-topology roadmap's layers 4 and 6 through Lane K, and each says so.
4. **Lane K (lines 224–238).** Replace the paragraph with the following. The existing text is kept except in three places: the layer 4 items are added, the list of supplies replaces "and checks G.4's grid determinant against that roadmap's Alexander polynomial", and a sentence on the Legendrian form of Cromwell's theorem is added. The two ⚠ sentences are kept verbatim.
   > The "no privileged representation" lane, which **consumes** the knot theory built in the [geometric-topology roadmap](../GeometricTopology/README.md) (layer 4: the presentations of a knot or link as first-class types, the maps between them, slice-ness, crossing changes and the unknotting number, Seifert surfaces and the Seifert genus, the link group, and the knot polynomials) and connects grid diagrams to it. Grid diagrams are one more presentation; this lane adds the grid-specific **adequacy theorem**, Cromwell's theorem (grid moves generate grid equivalence of links; book Appendix B.4, elementary but fiddly diagrammatic combinatorics), reconciling them with that roadmap's diagrams, braid closures, and embeddings `S¹ ↪ S³`. For the Lane G milestones about classical invariants it also supplies:
   > - the grid determinant is that roadmap's Alexander polynomial: `D_G(t) = Δ_L(t)` (book Theorem 3.3.6, via grid realisations of skein triples, Definition 3.3.9), for G.4;
   > - crossing changes: a cross-commutation of grids is a crossing change of the links (Proposition 3.1.13), and a crossing change of a diagram is realised by a cross-commutation of grid approximations (§6.2), for G.7;
   > - grid Seifert surfaces (§3.4, Proposition 3.4.9), and a grid realising the Seifert genus (Proposition 3.4.11, which isotopes a minimal-genus Seifert surface into disk-and-band position), for G.8;
   > - the presentation of the link group read off a grid (§3.5), for G.9;
   > - grid realisations of saddle moves and of adding unknotted, unlinked components (§§8.3–8.4), for G.10;
   > - a grid of a connected sum, identified with that roadmap's connected sum, for G.14.
   >
   > The Legendrian form of Cromwell's theorem (Theorem B.4.15) goes with G.11(b). ⚠ Prior art (Isabelle/AFP knot theory; the Lean `leanknot` experiment) shows diagram-calculus *adequacy* is where such projects stall, which is exactly why Lane G does not wait for this lane. ⚠ Coordinate the braid-group and diagram-calculus foundations with the geometric-topology roadmap (and Hannah Fechtner's braid-group program) rather than duplicating them here.
5. **v1 goal (line 71).** After "`u(T_{p,q}) = (p−1)(q−1)/2`" insert "(`u` the unknotting number of the geometric-topology roadmap; see G.7)".

**GeometricTopology (one line):** Layer 4 should own crossing changes of diagrams, the unknotting number `u(K)` with `u(m(K)) = u(K)` (book p. 24), and the standard diagram of `T_{p,q}` with the bound of Lemma 6.3.4.

**Atlas:** edges GT layer 4 → Lane K, GT layer 4 → G.7 and Lane K → G.7 are in /64.

### Not done, and why
The note does not choose between the classical `u(K)` and `u_grid`. Both are stated with their Lane K obligation.

## /45 (high, missing): G.10 is about smooth cobordisms, and the normal-form theorem has an owner

### What the verifier corrected
- Nothing was narrowed. No atlas stage plans normal forms of knot cobordisms. The category point is decisive: `W⁻₀(T_{−2,3})` has `Δ = 1`, so it is topologically slice by Freedman, and `τ = −1`.
- **Binding (REV):** findings 45, 59 and 79 are one knot of problems: the GeometricTopology–CHF exchange, its cycle, the normal form, and `s`. /59 and /79 are fixed under their own headings.

### State on main (31403074)
- **G.10, lines 200–203:** "**Slice genus:** `|τ(K)| ≤ g_s(K)` via saddle/birth/death maps and normal forms of knot cobordisms (book Appendix B.5): the most topologically substantial step of the combinatorial line; gives the combinatorial Kronheimer–Mrowka theorem."
- **GeometricTopology:**
  - Layer 4, lines 465–468, defines "`IsSmoothlySlice K` … and `IsTopologicallySlice K` …; the slice genus `g_s(K)` and the topological slice genus".
  - Layer 6, lines 591–593, plans "knot/link cobordisms as surfaces in `S³ × [0,1]`" with no normal form.
- **Atlas:** no stage plans the normal form (the only "normal form of" hits are lattice and profinite-group stages).

### Fix: note for the Tau Ceti maintainer
Replace G.10 (lines 200–203) with:
> 10. **Slice genus** (needs G.7, G.9's collapsed link homology and Lane K; the geometric-topology roadmap's layers 4 and 6).
>     - **Statement.** For knots `K₀` and `K₁` joined by a *smooth* oriented genus-`g` cobordism in `[0,1] × S³`, `|τ(K₀) − τ(K₁)| ≤ g` (book Theorem 8.1.1; Sarkar, [arXiv:1011.5265](https://arxiv.org/abs/1011.5265)). Hence `|τ(K)| ≤ g_s(K)` for the **smooth** slice genus of layer 4 (Corollary 8.1.2).
>     - **Combinatorial inputs, here:** the collapsed link homology `cGH⁻` (§8.2, in G.9); saddle maps and the link τ-invariants (§8.3); and `GH⁻` of `K` plus unknotted, unlinked components (§8.4).
>     - **Inputs from Lane K:** grid realisations of a saddle move and of adding an unknot.
>     - **Topological input**, from layer 6: the normal form of a smooth knot cobordism (Proposition 2.6.11, proved in Appendix B.5 via Lemma B.5.3, after Kawauchi, *A survey of knot theory*, Theorem 13.1.8).
>     - **Consequence:** `g_s(T_{p,q}) = g(T_{p,q}) = (p−1)(q−1)/2` (Corollary 8.1.3, the combinatorial Kronheimer–Mrowka theorem). Its upper bound is Seifert's algorithm on the standard diagram (layer 4).
>     - ⚠ **Regression test.** The bound is false for the topological slice genus. The 0-framed negative Whitehead double `W⁻₀(T_{−2,3})` has `Δ = 1`, so it is topologically slice (Freedman), and `τ = −1` (Corollary 8.6.4, Remark 8.6.5).

**GeometricTopology (one line):** Layer 6 should own the normal-form theorem for smooth knot cobordisms in `[0,1] × S³` (book Proposition 2.6.11 / B.5.1 and Lemma B.5.3; Kawauchi Theorem 13.1.8; Kawauchi–Shibuya–Suzuki 1982). Its two-dimensional Morse input can start from Tau Ceti's `TauCeti.IsNondegenerateCriticalPoint.exists_morse_chart` (`TauCeti/Analysis/Calculus/Morse/NormalForm.lean:362`), a Morse lemma on Banach spaces.

**Atlas:** edges GT layer 4 → G.10, GT layer 6 → G.10, G.9 → G.10, G.7 → G.10 and Lane K → G.10 are in /64. No CHF → GT layer 6 edge can be recorded (see /60).

### Not done, and why
- Kawauchi's book and Kawauchi–Shibuya–Suzuki were not read. The book's Lemma B.5.3, which I read on p. 395, is the locator given, and Kawauchi is named as the book's citation.
- The cycle through GT layer 6 needs a GeometricTopology split (/79).

## /46 (medium, missing): G.8's genus bound needs the Seifert genus and grid Seifert surfaces

### What the verifier corrected
Nothing was narrowed. "Seifert genus" occurs in no atlas stage. "Seifert surface" occurs only in GeometricTopology, whose layer 6 lists "Layer 4's knots, slice-ness, and Seifert surfaces" among its inputs, although layer 4 does not plan them.

### State on main (31403074)
- **G.8, lines 193–196:** "**Symmetries and the genus bound** `g(K) ≥ max{s : GĤ(K, s) ≠ 0}`. ⚠ The book is explicit that the combinatorial treatment "falls short of showing these bounds are sharp"; sharpness is holomorphic (the analytic roadmap's far future); state the bound, not detection."
- **GeometricTopology:** layer 4 (lines 470–478) has "Alexander from a Seifert matrix"; layer 6 (line 579) lists Seifert surfaces as an input.
- **Atlas:** "Seifert genus" occurs in no stage.
- **Tau Ceti:** Seifert matrices (`KnotTheory/Alexander.lean`, `Signature.lean`), but no Seifert surface or genus.

### Fix: note for the Tau Ceti maintainer
Replace G.8 (lines 193–196) with the text below. It also carries /43's structure theorem and /51's mirror formulas; this is its only occurrence.
> 8. **Symmetries, the structure of `GH⁻`, and the genus bound** (needs G.7 and Lane ALG; the genus bound also needs Lane K and the geometric-topology roadmap's layer 4).
>    (a) *Symmetries.*
>    - The Alexander symmetry (book Proposition 7.1.1) and independence of orientation (Proposition 5.3.2).
>    - The mirror formula `GĤ_d(K, s) ≅ GĤ_{2s−d}(m(K), s)` (Proposition 7.1.2, via the universal coefficient theorem over the field 𝔽).
>    - The mirror formula `GH⁻(m(K)) ≅ Hom(GH⁻(K), 𝔽[U]) ⊕ Ext(GH⁻(K), 𝔽[U])⟦1, 0⟧` (Proposition 7.4.3, via Lane ALG's bigraded dual complex and universal coefficient theorem, Theorem A.5.6).
>    - Hence `τ(m(K)) = −τ(K)` (Corollary 7.4.5) and `τ(T_{p,q}) = (p−1)(q−1)/2` (Example 7.4.6).
>
>    (b) *Structure.*
>    - `GH⁻(K) ≅ ⊕_i 𝔽[U]/U^{n_i}_{(d_i, s_i)} ⊕ 𝔽[U]_{(−2τ, −τ)}` (Proposition 7.3.3, from Propositions 7.3.1 and 6.1.4 and Lane ALG's bigraded structure theorem, Proposition A.4.3).
>    - `χ(GH⁻(K)) = Δ_K(t)/(1 − t^{−1})` (Proposition 7.3.2).
>
>    (c) *Genus bound.* `max{s : GĤ(K, s) ≠ 0} ≤ g(K)` for the Seifert genus `g(K)` of layer 4 (Proposition 7.2.2). It uses two facts:
>    - the associated genus of a grid is the maximal Alexander grading of its states (Proposition 7.2.1, via the grid Seifert surfaces of §3.4);
>    - some grid of `K` realises `g(K)` (Proposition 3.4.11, Lane K).
>
>    ⚠ The book is explicit that the combinatorial treatment "falls short of showing that these bounds are sharp" (p. 10); sharpness is holomorphic (the analytic roadmap's far future). State the bound, not detection.

**GeometricTopology (one line):** Layer 4 should own Seifert surfaces of an oriented link, the Seifert genus, Seifert's algorithm and the disk-and-band form (book §2.2 and B.3, where Theorem B.3.1 is Reidemeister–Singer for Seifert surfaces), which its layer 6 already assumes.

**Lane K** gets the grid Seifert surfaces (/44 item 4). **Atlas:** edges GT layer 4 → Lane K, Lane K → G.8, G.7 → G.8 and Lane ALG → G.8 are in /64.

### Not done, and why
Nothing.

## /47 (medium, missing): G.9's alternating-knot theorem names its classical inputs; G.9 restated in full

### What the verifier corrected
Nothing was narrowed. "Alternating knot" occurs only in this roadmap, and no stage mentions the Goeritz matrix, quasi-alternating links or the determinant of a link. The only signature planned is GeometricTopology layer 6's.

### State on main (31403074)
- **G.9, lines 197–199:** "**Skein exact sequence; alternating knots are thin; links** (multivariable Alexander polynomial as Euler characteristic; grid polytope vs Thurston norm, again bound only)."
- **Atlas:** "Goeritz" and "quasi-alternating" occur in no stage.
- **Tau Ceti:**
  - `TauCeti.KnotTheory.signature_trefoilSeifertMatrix` (`KnotTheory/Signature.lean:161`) gives signature `−2`.
  - `trefoilSeifertMatrix` (`Alexander.lean:453`) is documented as the right-handed trefoil's.

### Fix: note for the Tau Ceti maintainer
Replace G.9 (lines 197–199) with the text below. It carries /41 (normalisation), /42(b) (links), /47, /48 (multivariable Alexander) and /49 (Thurston polytope); those sections point here.
> 9. **Links, skein sequences, and alternating knots** (needs G.5, and G.8 for Corollary 10.3.2; Lane K; the geometric-topology roadmap's layers 4 and 6).
>    - **Link grid homology** (book §8.2, Chapter 11), in the `(n − ℓ)` normalisation of the standing conventions and for every grid diagram, not only those with an odd number of components:
>      - the collapsed complex `cGC⁻(G) = GC⁻(G)/(V_{j₁} = … = V_{j_ℓ})`, with one `O` per component (Definition 8.2.4), and `cGH⁻` a bigraded `𝔽[U]`-module invariant (Theorem 8.2.5, from G.6(b));
>      - the simply blocked `GĤ(L)` (Definition 8.2.7, Proposition 8.2.9) and `GH̃(G) ≅ GĤ(L) ⊗ W^{⊗(n−ℓ)}` (Proposition 8.2.8);
>      - the multi-graded theory over `𝔽[U₁, …, U_ℓ]` (Definition 11.1.8).
>    - **Euler characteristics.**
>      - `χ(GH̃(L)) = Δ_L(t)(1 − t^{−1})^{n−1} t^{(ℓ−1)/2}`, `χ(GĤ(L)) = Δ_L(t)(t^{1/2} − t^{−1/2})^{ℓ−1}` and `χ(cGH⁻(L)) = Δ_L(t) t^{1/2}(t^{1/2} − t^{−1/2})^{ℓ−2}` (Proposition 8.2.10, (8.5)–(8.7)).
>      - For `ℓ > 1`, the multi-graded `χ(GĤ(L)) = ±Δ_L(t₁, …, t_ℓ) ∏_i (t_i^{1/2} − t_i^{−1/2})` (Theorem 11.6.1). It goes through the refined grid matrix (Proposition 11.5.8) and the grid presentation of the link group (§3.5, Lane K).
>      - The multivariable Alexander polynomial, the link group, Fox calculus (Theorem 11.5.5, Corollary 11.5.6, Lemma 11.5.7) and Torres' symmetry (Theorem 11.5.3) come from layer 4.
>    - **Bounds for links.**
>      - `max{h₁ + … + h_ℓ : GĤ(L, h) ≠ 0} ≤ (ℓ − χ(F))/2` for every oriented surface `F` with `∂F = L` and no sphere components, so the bound is at most `g(L) + ℓ − 1` (Proposition 11.7.1).
>      - The Minkowski sum of the Alexander polytope and the symmetric unit hypercube lies in the grid polytope (Proposition 11.9.7).
>      - The equality of the grid polytope with the halved dual Thurston polytope plus the hypercube (Theorem 11.9.9, "which we state without proof"; Ozsváth–Szabó, [arXiv:math/0601618](https://arxiv.org/abs/math/0601618), Theorem 1.1) is holomorphic. It is not a target here; it belongs on the analytic roadmap's reconciliation list.
>    - **Skein sequences and alternating knots.**
>      - The oriented skein exact sequence (Theorems 9.1.1–9.1.2) and the unoriented one (Theorem 10.2.4, with its grading shifts in Proposition 10.2.9).
>      - For a quasi-alternating link, `GĤ_d(L, s)` is `𝔽^{|α_s|}` for `d = s + (σ − ℓ + 1)/2` and `0` otherwise, where `(t^{1/2} − t^{−1/2})^{ℓ−1} Δ_L(t) = Σ α_s t^s` (Theorem 10.3.3).
>      - For an alternating knot, `GĤ_d(K, s)` is `𝔽^{|a_s|}` for `d = s + σ/2` and `0` otherwise (Theorem 10.3.1). `GH⁻(K)` is as in Corollary 10.3.2, and `τ(K) = −σ(K)/2`.
>      - Inputs from the geometric-topology roadmap: from layer 4, alternating diagrams, the determinant of a link, the Goeritz matrix and the Gordon–Litherland formula (Theorem 2.7.4), Przytycki's skein criterion (Proposition 10.1.12), and alternating ⇒ quasi-alternating (Theorem 10.1.13); from layer 6, the signature.
>      - **Signature convention:** `σ` is the book's (Definition 2.3.3), under which positive torus knots have negative signature (`½σ(T_{3,7}) = −4`, p. 34). Tau Ceti's `signature_trefoilSeifertMatrix` (value `−2`, right-handed trefoil) agrees, so "an alternating knot is thin" can be tested against it.

**GeometricTopology (one line):** Layer 4 should own alternating diagrams, the determinant of a link, the Goeritz matrix, Gordon–Litherland and the skein-triple lemmas (book §§2.3, 2.7, 10.1). Layer 6's signature is imported by G.9.

**Atlas:** edges GT layer 4 → G.9, GT layer 6 → G.9, Lane K → G.9 and G.8 → G.9 are in /64 (G.5 → G.9 then follows through G.7 and G.8).

### Not done, and why
The finding's recommendation to keep the §10.2 skein sequence and Theorem 10.3.3 in CHF is followed. Nothing is dropped.

## /48 (medium, missing): the multivariable Alexander polynomial and its inputs belong to GeometricTopology

### What the verifier corrected
Nothing was narrowed. "Multivariable Alexander" occurs only in CHF, and Fox calculus, the link group and Torres occur in no stage.

### State on main (31403074)
- **G.9** is quoted under /47.
- **GeometricTopology layer 4** (lines 470–471): "The Alexander polynomial (Conway normalization), Jones, and HOMFLY".
- **Atlas:** "Fox calculus", "link group"/"knot group" and "Torres" occur in no stage.
- **Tau Ceti:** no Fox calculus, Wirtinger presentation, Alexander module or knot group.

### Fix
- **CHF:** G.9's second bullet (under /47) keeps Theorem 11.6.1, Proposition 11.5.8 and the grid presentation of the link group (§3.5, through Lane K; /44 item 4). It names the rest as layer 4's.
- **GeometricTopology (one line):** Layer 4 should own the link group, with the Wirtinger presentation, consuming AlgebraicTopology Stage 1's van Kampen and layer 5's link complement. It should also own the maximal abelian cover and the Alexander module over `ℤ[t₁^{±1}, …, t_ℓ^{±1}]` (from UniversalCovers' covering theory), Fox calculus with the book's Theorem 11.5.5 (cited there to Burde–Zieschang 9.10), the multivariable Alexander polynomial, Torres' symmetry (Theorem 11.5.3) and the specialisation of Proposition 11.5.2.
- **Atlas:** the edges GT layer 4 → Lane K → G.9 and GT layer 4 → G.9 are in /64.

### Not done, and why
- The book remarks (p. 200, Remark 11.6.2) that Torres' symmetry "follows from some properties of grid homology". I do not rely on it. The proof of Proposition 11.5.8 itself ends by invoking Theorem 11.5.3 (p. 203), and Theorem 11.6.1 is proved from Proposition 11.5.8, so that route is circular as written.
- The edges from AlgebraicTopology Stage 1 and UniversalCovers into GT layer 4 are GeometricTopology's to record.

## /49 (medium, error): G.9 promises no Thurston-norm comparison

### What the verifier corrected
Nothing was narrowed. "Thurston norm" occurs only in CHF. The book proves the comparison only in the direction `h₁ + … + h_ℓ`, and it states the full comparison without proof.

### State on main (31403074)
G.9 is quoted under /47. "Thurston norm" occurs only in CHF's Lane G and G.9.

### Fix
- **CHF:** G.9's third bullet (under /47) lists Proposition 11.7.1 and Proposition 11.9.7 as targets. It names Theorem 11.9.9 (Ozsváth–Szabó arXiv:math/0601618, Theorem 1.1) as holomorphic and not a target.
- **HeegaardFloer (one line):** add "grid homology polytope = ½·dual Thurston polytope + symmetric unit hypercube" (book Theorem 11.9.9) to the reconciliation list.
- **GeometricTopology** owns the Thurston norm only if the maintainer wants it; CHF no longer needs it.

### Not done, and why
No owner is assigned for the Thurston norm itself, since after this fix no CHF target uses it.

## /50 (medium, missing): G.11 splits into a combinatorial part and a contact-topology reconciliation

### What the verifier corrected
Nothing was narrowed. "Legendrian" occurs only in CHF, and "contact structure" and "transverse knot" occur in no stage. Without contact objects, G.11 states a theorem about grids modulo the restricted moves, which is not Chekanov's theorem.

### State on main (31403074)
- **G.11, lines 204–205:** "**Legendrian and transverse GRID invariants** `λ^±`; reprove Chekanov's Legendrian non-simplicity of `m(5₂)` combinatorially."
- **Atlas:** "Legendrian" occurs only in CHF.

### Fix: note for the Tau Ceti maintainer
Replace G.11 (lines 204–205) with:
> 11. **Legendrian and transverse grid invariants** (needs G.7: the canonical cycles `x^±` of §6.4, and the stabilization maps of Proposition 5.4.1).
>     (a) *Combinatorial, here.*
>     - Legendrian grid classes are toroidal grids modulo commutations and `X:NW`, `X:SE` (de)stabilizations; transverse classes are also taken modulo `X:SW`.
>     - The classes `λ^± = [x^±] ∈ GH⁻` are invariant under those moves (the proof of Theorem 12.3.3, which rests on §6.4). `θ = λ^+` is the transverse class (Theorem 12.5.13, via Theorem 12.3.4 for stabilizations). Their bigradings are given by `tb` and `r` read from the grid (Theorem 12.3.2).
>     - Chekanov's example in grid form: the two grids `G₁`, `G₂` of Figure 12.10 both represent `m(5₂)` and have `tb = 1`, `r = 0`. They are not related by commutations and `X:NW`, `X:SE` (de)stabilizations, because `λ^+(G₁) ≠ λ^−(G₁)` while `λ^+(G₂) = λ^−(G₂)` (Proposition 12.4.1, with Proposition 12.3.10 for the orientations).
>
>     (b) *Reconciliation, not a target here.*
>     - These grid classes are the Legendrian isotopy classes in `(ℝ³, ξ_std)` (Proposition 12.2.6, which uses the Legendrian Reidemeister theorem, Theorem 12.1.7, Świątkowski, proved in Appendix B.2).
>     - Transverse classes are Legendrian classes modulo negative stabilization (Theorem 12.5.9, Epstein–Fuchs–Meyer, proved in B.2).
>     - Only with (b) does (a) become Chekanov's theorem (Theorem 1.2.2).
>
>     ⚠ **Mirror convention:** the Legendrian knot of a grid represents the *mirror* of the grid's knot (Definition 12.3.1; Ozsváth–Szabó–Thurston, [arXiv:math/0611841](https://arxiv.org/abs/math/0611841), p. 1).

**Atlas (one line):** (b) and its contact prerequisites (the standard contact structure, Legendrian and transverse knots, `tb`, `rot`, `sl`, fronts, the Legendrian Reidemeister and Cromwell theorems) have no owner. This fix recommends a new-roadmap request, "GeometricTopology, Part II: Legendrian and transverse knots in the standard contact 3-sphere", with an edge to G.11 once it exists. It is not created here.

**Atlas:** edge G.7 → G.11 is in /64.

### Not done, and why
- The finding's wording "distinguished by λ^+" is replaced by the book's actual criterion, the unordered pair `{λ^−, λ^+}` (Proposition 12.4.1, p. 228).
- No Part II is created.

## /51 (medium, missing): duals and the universal coefficient theorem, and Lane ALG restated in full

### What the verifier corrected
- Nothing was narrowed. No atlas stage plans a universal coefficient theorem for complexes of free modules over a PID. AlgebraicTopology Stage 6 plans only the singular-cochain instance. The mirror formulas that the τ test needs rest on the algebraic theorem.
- **Binding (REV):** findings 24, 51 and 54 need one owner, between AlgebraicTopology and CHF's Lane ALG.
- **The owner is AlgebraicTopology, the foundational roadmap** (§15: "plan it once … usually the most foundational one"), in the new Stage 0 of /24: filtered complexes, their spectral sequences and the universal coefficient theorem over a PID. Lane ALG keeps only the `K[U]`-bigraded specialisations.

### State on main (31403074)
- **Lane ALG, lines 215–222:** "Mostly assembling Mathlib pieces into a working API, plus genuinely new material: bigraded modules over `𝔽₂[V₁,…,Vₙ]` with grading-shift conventions; mapping-cone API at the bigraded level; the **structure theorem for finitely generated bigraded `𝔽[U]`-modules** (the algebraic home of τ and of "tower plus torsion" decompositions); **filtered chain complexes** and filtered chain homotopy equivalence, new to Mathlib, needed only from G.13 onward, and reusable far beyond this roadmap. ⚠ No spectral sequences are needed anywhere on the main line; resist building them here."
- **AlgebraicTopology Stage 6**, item 1, states the universal coefficient sequence for singular cochains ("over a PID or hereditary ring, prove the natural short exact sequence `0 -> Ext^1_R(H_(n-1)(X;R),M) -> H^n(X;M) -> Hom_R(H_n(X;R),M) -> 0`"). Item 5 has "Derive universal-coefficient consequences".
- **Atlas (assembled graph):** "universal coefficient" occurs in applications only: `ArithmeticLocallySymmetricSpaces:ALS.1`, `TorsionCohomologyInfrastructure:TC.4`, AlgebraicTopology Stage 6, and the decomposition nodes `CohomologyComparisons:CP.5/…`, `CompletedCohomologyPartII:CC.2/…`, `CC.3/…` and `StableHomotopyKTheory:H.3/…`, `H.6/…`. None of them plans the theorem for complexes of free modules over a PID, and several consume it, which supports a single foundational owner.
- **Libraries:** neither Mathlib nor Tau Ceti has a universal coefficient theorem; I re-ran the search.

### Fix: note for the Tau Ceti maintainer
1. **G.8** carries Propositions 7.1.2 and 7.4.3 and Corollary 7.4.5 (under /46).
2. **Lane ALG (lines 215–222).** Replace the paragraph with:
   > Mostly assembling existing pieces into a working API, plus new material (book §4.5 and Appendix A):
   > 1. **Bigraded modules and complexes over `R = 𝔽[V₁, …, Vₙ]`** with each `V_i` of bidegree `(−2, −1)` (Definition 4.5.1): grading shifts `⟦a, b⟧`, differentials of bidegree `(−1, 0)`, homology as a bigraded `R`-module, bigraded homotopies, mapping cones and quotients `C/(V_i)` (§4.5, A.1–A.3).
   >    Since the homogeneous pieces are not `R`-submodules, build these as DG modules over `R` viewed as a graded algebra with zero differential (Maslov grading, cohomological degree `−M`). Use the DG-algebra roadmap's layer 1 and Tau Ceti's `IsDGLeftModule`. Carry the Alexander grading as a second grading, preserved by the differential and lowered by one by each `V_i`. Prove the comparison with the ungraded one-object complexes of G.3.
   > 2. **The structure theorem for finitely generated bigraded `K[U]`-modules** (Proposition A.4.3: a direct sum of shifted `K[U]/U^{n_i}` and `K[U]`), the algebraic home of τ. It rests on Mathlib's `Module.equiv_free_prod_directSum` for the ungraded statement.
   > 3. **Duals and universal coefficients over `K[U]`.**
   >    - The dual complex `Hom(C, K[U])` with the book's convention (§7.4, A.5): `U^k` has bidegree `(−2k, −k)`, and a map of bidegree `(d, s)` raises bidegrees by `(d, s)`.
   >    - The bigraded universal coefficient theorem for complexes of free `K[U]`-modules, `H(Hom(C, K[U])) ≅ Hom(H(C), K[U]) ⊕ Ext(H(C), K[U])⟦1, 0⟧` (Theorem A.5.6), and the field case (Theorem A.5.2).
   >    - The ungraded theorem for complexes of free modules over a PID is the algebraic-topology roadmap's (Stage 0); this item adds the bigradings.
   > 4. **Filtered complexes over `K[U]`**, needed only from G.13 on.
   >    - The ℤ-filtered, ℤ-graded notions of Definitions 13.1.1–13.1.9 are the algebraic-topology roadmap's general filtered chain complexes (Stage 0), specialised here.
   >    - This lane adds the grading shifts and the fact that filtered chain homotopy equivalence and filtered quasi-isomorphism agree for free complexes over `K[U]` (Proposition A.8.1).
   >    - It also adds the small models of §A.7, built with the DG-algebra roadmap's perturbation lemma for complete filtered contractions (layer 3) and Tau Ceti's `Contraction` and `Contraction.normalize`.
   >
   > ⚠ No spectral sequences are needed anywhere on the main line; resist building them here.

**AlgebraicTopology (one line, with /24):** Stage 0 item 5 (/24) states, as its own declaration, the universal coefficient theorem for chain complexes of free modules over a PID (`0 → Ext¹(H_{n−1}(C), M) → H^n(Hom(C, M)) → Hom(H_n(C), M) → 0`, split). Stage 6's singular-cochain sequence and CHF's Lane ALG then both consume it (edge AT Stage 0 → Lane ALG, once the snapshot carries Stage 0; /64).

**Library pointers (read at the pin):**
- `TauCeti.IsDGLeftModule` (`TauCeti/Algebra/Homology/DG/Module/Defs.lean:96`);
- `Module.equiv_free_prod_directSum` (`Mathlib/Algebra/Module/PID.lean:257`: `M ≃ₗ[R] (Fin n →₀ R) × ⨁ i, R ⧸ R ∙ p i ^ e i` for finite `M` over a PID);
- `TauCeti.Contraction` (`Algebra/Homology/Contraction.lean:97`) and `TauCeti.Contraction.normalize` (`:339`), which make a contraction special by changing only the homotopy.

### Not done, and why
- The finding's "edge G.8 → the acceptance test τ(T_{3,4}) = 3" is not an atlas edge, because acceptance criteria are not stages. The dependency is written into the acceptance text instead (/52).
- Whether AlgebraicTopology accepts ownership is for the /24 fix; if it does not, only item 3's last sentence changes.

## /52 (low, error): pin the chirality of the τ and trefoil tests

`TauCeti.GridDiagram.torusLink` (`Grid/TorusLink.lean:100`) puts `O` on the diagonal and `X` on the diagonal shifted up by `q + 1` rows, on a grid of size `(p+1)+(q+1)`. That is the book's grid of Exercise 3.1.5(c) (p. 46), which represents the negative torus knot. So `torusLink 2 3` is `T_{−3,4}` and `torusLink 1 2` is `T_{−2,3}` in the book's conventions, up to `T_{a,b} = T_{b,a}` (Tau Ceti's docstring calls the classical names labels only).

**Note for the maintainer.**
- **Lines 282–283.** Replace "`GĤ` of the unknot (2×2 grid) and the trefoil (5×5)" with "`GĤ` of the unknot (2×2 grid) and of the left-handed trefoil `T_{−2,3}` (the 5×5 staircase grid, Tau Ceti's `torusLink 1 2`)". The expected value is `GH⁻(T_{−2,3}) ≅ (𝔽[U]/U)_{(1,0)} ⊕ 𝔽[U]_{(2,1)}` (Example 7.4.4, p. 134), hence `GĤ ≅ 𝔽_{(1,0)} ⊕ 𝔽_{(0,−1)} ⊕ 𝔽_{(2,1)}` by Eq. (7.7).
- **Lines 288–289.** Replace "`τ(T_{3,4}) = 3`;" with "`τ = −3` on the staircase grid `torusLink 2 3` (the book's grid for `T_{−3,4}`; Proposition 6.3.1), and `τ = 3` on its mirror (reflection in a horizontal axis, Exercise 3.1.5(f)), which is `τ(T_{3,4})` and needs G.8's Corollary 7.4.5;". Keep the rest of the bullet.
- G.7's text (under /44) already says which torus knot the staircase grid carries.

## /53 (medium, library-claim): Mathlib's complexes are not bigraded complexes over 𝔽[V₁,…,Vₙ]

### What the verifier corrected
Nothing was narrowed; "the algebra is exactly right". With `V_i` of bidegree `(−2, −1)`, the pieces `GC_{d,s}` are not submodules over `𝔽[V₁,…,Vₙ]`. Tau Ceti's one-object packaging (`Grid/Chain/Complex.lean:15`) is the workaround.

### State on main (31403074)
- **CHF lines 132–139:** "complexes over any `ComplexShape ι` (so ℤ×ℤ-bigraded complexes are immediate), … All of it applies over `ModuleCat (MvPolynomial (Fin n) (ZMod 2))` directly."
- **Tau Ceti:**
  - `TauCeti.GridDiagram.unblockedComplex` (`Grid/Chain/Complex.lean:97`) is a `HomologicalComplex (ModuleCat (MvPolynomial (Fin n) R)) (ComplexShape.refl Unit)`.
  - The module doc of `Grid/Grading/UnblockedChain.lean` (lines 42–44) reads: "The homogeneous piece `OddComponentGridDiagram.bigradedChainMinusPiece` is a submodule over the coefficient ring `R` only, not over `R[V₀, …, V_{n-1}]`: the variables move the bidegree."

### Fix: note for the Tau Ceti maintainer
Inventory, first bullet (lines 132–139). Replace "complexes over any `ComplexShape ι` (so ℤ×ℤ-bigraded complexes are immediate)," with "complexes over any `ComplexShape ι`,". Replace the last sentence ("All of it applies over `ModuleCat (MvPolynomial (Fin n) (ZMod 2))` directly.") with:
> This applies over `ModuleCat (MvPolynomial (Fin n) (ZMod 2))` to the *ungraded* grid complexes, and Tau Ceti packages them so, with the one-object shape `ComplexShape.refl Unit` (`GridDiagram.unblockedComplex`). It does **not** give bigraded complexes over `𝔽[V₁, …, Vₙ]`. Each `V_i` has bidegree `(−2, −1)` (book Definition 4.5.1), so the homogeneous pieces `GC_{d,s}` are not `𝔽[V₁, …, Vₙ]`-submodules, and a `ℤ × ℤ`-indexed `HomologicalComplex` in that module category cannot carry the action. The bigraded category is Lane ALG's first item.

Lane ALG item 1 (under /51) is the rest of the fix, and the edge DGAInfinity layer 1 → Lane ALG is in /64.

### Not done, and why
Nothing.

## /54 (medium, duplicate): one owner for filtered chain complexes; G.13 reconciled

### What the verifier corrected
- Nothing was narrowed. Only CHF's Lane ALG mentions filtered chain complexes, while AlgebraicTopology Stage 4 needs "the filtered derived or chain-homotopy category" and DGAInfinity layer 3 plans the filtered perturbation lemma.
- The verifier calls the mismatch between Lane ALG (filtered homotopy equivalence) and G.13 (filtered quasi-isomorphism type) "a second, independent defect".
- **Binding:** one owner for /24, /51 and /54 (see /51).

### State on main (31403074)
- **Lane ALG** is quoted under /51. **G.13, lines 208–211:** "**The filtered theory** (book Chapters 13–14): the Alexander filtration on the grid complex over `𝔽[V]`; invariant = filtered quasi-isomorphism type: the combinatorial stand-in for `CFK^∞`, and the door to Υ-type concordance invariants. Needs Lane ALG's filtered-complex API."
- **Inventory, lines 152–155:** "filtered complexes and filtered homotopy type (Mathlib's spectral-sequence machinery is young and has no filtered-complex constructor, …, so only the filtered-complex API is needed);"
- **Atlas:** "filtered complex" occurs only in Lane ALG and in one decomposition node (`DeformationAndDerivedPatchingAlgebra:P8/…`, an application).
- **Tau Ceti:** `Algebra/Homology/Contraction.lean`, and the plumbing weight filtration (`LowDimTopology/Plumbing/Filtration/`); no general filtered complex.

### Fix
1. **Owner.** ℤ-filtered chain complexes of modules (filtered maps, filtered homotopies, filtered quasi-isomorphisms, the associated graded) belong to AlgebraicTopology's new Stage 0 (/24, item 1).
   - **AlgebraicTopology (one line):** Stage 4 item 3's skeletal-filtration comparison consumes them from Stage 0.
   - Lane ALG item 4 (under /51) specialises them to `K[U]`, adds Proposition A.8.1 and the small models of §A.7, and consumes DGAInfinity layer 3.
   - The edge DGAInfinity layer 3 → Lane ALG is in /64. AT Stage 0 → Lane ALG waits until the snapshot carries Stage 0.
2. **G.13 (lines 208–211).** Replace with the following (it also carries /63):
   > 13. **The filtered theory** (book Chapters 13–14; needs G.5 and Lane ALG item 4).
   >     - The Alexander filtration on `GC⁻(G)` over `𝔽[U]` (Theorem 13.2.4) and on the simply blocked complex. The invariant is the filtered quasi-isomorphism type (Theorem 13.2.9); since the complexes are free over `𝔽[U]`, it is equivalently the filtered chain homotopy type (Proposition A.8.1).
   >     - The filtered `GC⁻` is the grid analogue of `CFK^{−,*}` (book p. 8), from which `CFK^∞` is obtained by inverting `U`.
   >     - Targets: the invariants read off the filtered type (§14.1; the Legendrian and transverse refinements of §14.3); and Földvári's grid `Υ_K(t)` ([arXiv:1903.05893](https://arxiv.org/abs/1903.05893), Definition 5.1), with its invariance (Theorem 5.2) and unknotting bound (Corollary 5.10).
   >     - The agreement with the holomorphic `Υ` (Kubota, [arXiv:2412.08146](https://arxiv.org/abs/2412.08146), Theorem 1.1) is a reconciliation for the analytic roadmap.
3. **Inventory, missing (lines 152–155).** Replace "filtered complexes and filtered homotopy type (Mathlib's spectral-sequence machinery is young and has no filtered-complex constructor, and the grid main line deliberately avoids spectral sequences, so only the filtered-complex API is needed);" with:
   > duals and the universal coefficient theorem over `𝔽[U]`, and filtered complexes and filtered homotopy type over `𝔽[U]` (the general ℤ-filtered chain complexes, and the universal coefficient theorem over a PID, are the algebraic-topology roadmap's; Mathlib's spectral-sequence machinery is young and has no filtered-complex constructor, and the grid main line deliberately avoids spectral sequences, so only the filtered-complex API is needed);

**HeegaardFloer (one line):** add "grid `Υ` = holomorphic `Υ`" (Kubota arXiv:2412.08146, Theorem 1.1) to the reconciliation list.

### Not done, and why
Kubota's concordance invariance of the grid `Υ` (his reference [2], cited in arXiv:2412.08146) was not read, so it is not listed as a target.

## /55 (medium, missing): Lane H names all of its external inputs

### What the verifier corrected
Nothing was narrowed. "Kneser" occurs in no stage. The `S¹ × S²` splitting enters OSS's Definition 1.2 itself, so it "cannot be absorbed into 'diagrams modulo moves'". Reidemeister–Singer with basepoints was filed by the HeegaardFloer red team and is not repeated here.

### State on main (31403074)
- **H.1, lines 255–257:** "Pointed multi-pointed Heegaard diagram *combinatorics* (the diagram as data: surface genus, attaching-curve combinatorics, basepoints, no smooth topology yet); generators, domains, periodic domains, weak/strong **admissibility**."
- **H.2, lines 258–259:** "The nice-move calculus and "convenient" diagrams from pair-of-pants decompositions; the chain complex (every count is a bigon or square)."
- **H.3, lines 260–261:** "`HF̂_st(Y)` over 𝔽₂: well-definedness and the purely topological invariance proof; lens spaces and `S¹ × S²` as the first computations."
- **Lines 266–273:** "⚠ The serious topological input is **Reidemeister–Singer with basepoints** … Treat it the way Lane G treats Cromwell: make "diagrams modulo moves" the *definition* of the input equivalence class, …"
- **Atlas:** "Kneser" occurs in no stage; "prime decomposition" occurs only in GeometricTopology layer 8, which assigns it to layer 1 (lines 714–715, 728–729). Layer 1 (lines 222–230) plans connected sum and independence of the balls only.

### Fix: note for the Tau Ceti maintainer
Source: OSS arXiv:0912.0830v3 (PDF pages): Definitions 1.1–1.2 (p. 2); the list of external inputs (p. 4); Theorem 2.3 and Remark 2.4 (pp. 7–8); Lemma 2.7 and Corollary 2.8 (p. 8); Proposition 6.10 (p. 52); Theorem 7.13 (p. 68); Theorem 8.2 (p. 85); Theorem 11.1 (p. 92).
1. **H.1.** Replace with:
   > 1. Pointed multi-pointed Heegaard diagram *combinatorics* (the diagram as data: surface genus, attaching-curve combinatorics, basepoints, no smooth topology yet).
   >    - Generators, domains, periodic domains, the Euler and point measures, and the combinatorial Maslov index `μ(D) = e(D) + p(D)` (arXiv:0912.0830, §6).
   >    - Sarkar's theorem that `μ` is additive under juxtaposition, whose proof is combinatorial (arXiv:0912.0830, Theorem 7.13, citing Sarkar [arXiv:math/0609673](https://arxiv.org/abs/math/0609673), Theorems 3.2 and 4.1; in the current version v4 the additivity for domains is Theorem 3.3).
   >    - Weak/strong **admissibility** is defined here only as a supplier to the analytic roadmap's Lane F4. The combinatorial invariant of H.3 needs none, since its diagrams are nice; OSS use admissibility only in their Appendix 10.
2. **H.2.** Replace with:
   > 2. The nice-move calculus and "convenient" diagrams from pair-of-pants decompositions. The chain complex counts empty embedded bigons and rectangles. These are exactly the nonnegative index-one domains avoiding the basepoints (arXiv:0912.0830, Proposition 6.10), whose last step "proceeds exactly as in" Sarkar–Wang ([arXiv:math/0607777](https://arxiv.org/abs/math/0607777), Ann. of Math. 171 (2010), proof of Theorem 3.3) and is combinatorial.
3. **H.3.** Replace with:
   > 3. `HF̂_st(Y)` over 𝔽₂ (arXiv:0912.0830, Definitions 1.1–1.2, Theorems 1.3 and 8.2).
   >    - **Definition.** Write `Y = Y₁ # n(S¹ × S²)` with `Y₁` having no `S¹ × S²` summand. Then `HF̂_st(Y) = [H̃F(D) ⊗ (𝔽 ⊕ 𝔽)^n, b(D)]` for a convenient diagram `D` of `Y₁` with `b(D)` basepoints. It is an equivalence class of pairs `(V, b)`, where `(V₁, b₁) ~ (V₂, b₂)` when `V₁ ≅ V₂ ⊗ (𝔽 ⊕ 𝔽)^{b₁−b₂}`; it is not a vector space.
   >    - **Invariance, purely combinatorial.** Any two convenient diagrams of a manifold with no `S¹ × S²` summand are connected by nice isotopies, handle slides and stabilizations (Theorem 5.2), and these do not change `[H̃F, b]` (Corollary 7.2).
   >    - **The input class** is therefore pairs (a convenient diagram of a manifold with no `S¹ × S²` summand, `n`), or diagrams modulo nice moves with an explicit `S¹ × S²` count. ⚠ The hypothesis "no `S¹ × S²` summand" is itself topological (Lemma 2.7, Corollary 2.8).
   >    - **The twisted invariant** `HF̂^T(Y)` (§9) and its invariance over 𝔽₂ (Theorem 9.4) belong here too.
   >    - **First computations:** see the acceptance criteria.
4. **Lines 266–273.** Replace the first ⚠ paragraph (to "…will eventually feed).") with the following; keep the final "⚠ This package has no absolute gradings…" sentence.
   > ⚠ The topological inputs are the classical theorems OSS name (arXiv:0912.0830, p. 4):
   > - **Reidemeister–Singer with basepoints** (any two pointed Heegaard diagrams of `Y` are connected by moves);
   > - **Kneser–Milnor**: existence and uniqueness of `Y = Y₁ # n(S¹ × S²)` with `Y₁` having no `S¹ × S²` summand. It enters Definition 1.2 itself and the proofs of Theorems 8.2 and 9.4;
   > - **Luo's theorem** that two markings of a surface determine the same handlebody iff they differ by flips (Theorem 2.3; OSS prove in their Appendix 11 the g-flip version they use, Theorem 11.1).
   >
   > Treat these the way Lane G treats Cromwell. Make "(convenient diagram of a manifold with no `S¹ × S²` summand, `n`) modulo nice moves" the *definition* of the input class, and state the invariance theorem against it. Put the identification with closed oriented 3-manifolds in a separable reconciliation target. Its inputs come from the geometric-topology roadmap (Kneser–Milnor with its layer 1 prime decomposition; Luo with its layer 9 Heegaard splittings) and from the analytic roadmap's Morse theory (Reidemeister–Singer).

**GeometricTopology (one line):** Layer 1 (as layer 8's text already assigns) should own the Kneser–Milnor theorem (existence and uniqueness of the prime decomposition of a closed oriented 3-manifold). Layer 9 should own Luo's flip theorem for handlebody markings, with OSS Appendix 11 as a proof route.

**Atlas:** edges GT layer 1 → H.3, GT layer 9 → H.3, H.1 → H.2 → H.3 are in /64.

### Not done, and why
- Luo's paper (Math. Res. Lett. 4 (1997)) was not read. The statement is taken from OSS Theorem 2.3 and their own proof of the g-flip version (Theorem 11.1), which I read.
- The finding's wording "(a Heegaard diagram of Y₁ without S¹ × S² summands, n)" is kept, with the ⚠ that the hypothesis is topological.

## /56 (medium, error): HF̂^T ≅ HF̂ is a reconciliation, not a combinatorial result

### What the verifier corrected
Nothing was narrowed. The identification for rational homology spheres is proved in the holomorphic appendix. The combinatorial invariance theorem itself is kept.

### State on main (31403074)
- **Organizing dichotomy item 2, lines 49–54:** "… the *unique* published fully-combinatorial definition-plus-invariance of a Heegaard Floer 3-manifold invariant: HF̂ up to tracked `(𝔽 ⊕ 𝔽)`-tensor factors, exactly HF̂ for `b₁(Y) = 0` via a twisted refinement."
- **H.4, lines 262–264:** "ℤ coefficients via sign assignments ([arXiv:1301.0480]); the twisted refinement recovering `HF̂(Y)` on the nose for `b₁(Y) = 0`."
- **HeegaardFloer**, Reconciliation 1 (lines 266–270), already claims "exactly `HF̂` for `b₁(Y) = 0`".

### Fix: note for the Tau Ceti maintainer
Source: arXiv:0912.0830v3, Theorem 9.4 (p. 88), Theorem 9.5 and the sentence before it (p. 89), and Theorems 10.2–10.4 (p. 91): Theorem 10.4 is "using the holomorphic theory". Also arXiv:1301.0480v1, Theorems 1.1–1.2 (p. 3) and Corollaries 3.8–3.9 (p. 27).
1. **Lines 51–54.** Replace "the *unique* published fully-combinatorial definition-plus-invariance of a Heegaard Floer 3-manifold invariant: HF̂ up to tracked `(𝔽 ⊕ 𝔽)`-tensor factors, exactly HF̂ for `b₁(Y) = 0` via a twisted refinement." with:
   > the *unique* published fully-combinatorial definition-plus-invariance of a Heegaard Floer 3-manifold invariant: the stable class `HF̂_st(Y)` and the twisted group `HF̂^T(Y)`, each with a purely topological invariance proof (arXiv:0912.0830, Theorems 8.2 and 9.4; over ℤ, arXiv:1301.0480, Corollaries 3.8–3.9). Their agreement with holomorphic `HF̂` (up to tracked `(𝔽 ⊕ 𝔽)`-factors, and exactly `HF̂` for `b₁(Y) = 0` via `HF̂^T`) is proved in the paper's appendix with the holomorphic theory (Theorems 10.3–10.4) and is the analytic roadmap's first reconciliation.
2. **H.4.** Replace with:
   > 4. ℤ coefficients via sign assignments ([arXiv:1301.0480](https://arxiv.org/abs/1301.0480)): existence and uniqueness of sign assignments up to gauge (Theorem 1.1), the ℤ-complex and its invariance under nice moves (Theorem 1.2), and hence `HF̂_st(Y; ℤ)` (Corollary 3.8) and the twisted `HF̂^T(Y; ℤ)` (Corollary 3.9) as invariants of `Y`. No comparison with holomorphic `HF̂` is stated here.

**HeegaardFloer (one line):** Reconciliation 1 stays as it is, but it should cite arXiv:0912.0830 Theorems 10.3–10.4, and say that "exactly `HF̂` for `b₁ = 0`" is via `HF̂^T`.

### Not done, and why
Nothing.

## /57 (low, error): restate the HF̂_st acceptance test

- **Lines 294–295.** Replace the bullet with:
  > - **`HF̂_st` computes:**
  >   - For `S¹ × S²`, Definition 1.2 gives `[H̃F(D) ⊗ (𝔽 ⊕ 𝔽), b(D)]` for a convenient diagram `D` of `S³`, expected `[𝔽 ⊕ 𝔽, 1]` (given `HF̂_st(S³) = [𝔽, 1]`). This tests the `S¹ × S²` bookkeeping, not admissibility.
  >   - For small lens spaces `L(p, q)`, compute `H̃F(D)` from an explicit convenient diagram. The expected stable class is `[𝔽^p, 1]`, i.e. `dim H̃F(D) = p · 2^{b(D)−1}`. That value comes from the holomorphic computation, `HF̂(L(p, q), 𝔰) = ℤ` for each of the `p` spin^c structures (Ozsváth–Szabó, [arXiv:math/0105202](https://arxiv.org/abs/math/0105202), Proposition 3.1), transported by arXiv:0912.0830 Theorem 10.3. This check confirms it combinatorially, diagram by diagram.
  >   - No spin^c splitting is claimed: arXiv:0912.0830 defers spin^c structures to a sequel (p. 4) and never mentions lens spaces.
- H.1's admissibility is kept only as a supplier to HeegaardFloer Lane F4 (under /55). **Atlas:** edge H.1 → `tauceti:TauCetiRoadmap/HeegaardFloer#milestone-f4-3` (admissibility energy bounds; cycle check: acyclic) is in /64. /109's edge H.1 → F4.2 is compatible with it (also acyclic, checked together).

## /58 (medium, error): Lane L's invariance target is Némethi's blow-up invariance for negative-definite graphs

### What the verifier corrected
Nothing was narrowed. Lattice homology is defined for negative-definite graphs. Its graph-independence is proved under the blow-ups and blow-downs that connect such graphs, and Neumann's full calculus passes through graphs outside the class. `BlowUp.lean:609` supports the finding.

### State on main (31403074)
- **Lane L, lines 242–244:** "Némethi's lattice (co)homology `ℍ⁻`/`ℍ⁰` as a `ℤ[U]`-module from lattice points and weight functions; invariance under **Neumann moves**;"
- **Dichotomy item 3, lines 57–58:** "pure lattice combinatorics, invariance under Neumann moves, and Zemke's theorem …".
- **Tau Ceti:**
  - `TauCeti.PlumbingGraph.blowUpVertex` (`LowDimTopology/Plumbing/BlowUp.lean:230`) adds a `(−1)`-vertex of degree one and lowers the old weight by one.
  - `TauCeti.PlumbingGraph.blowUpEdge` (`EdgeBlowUp.lean:224`) inserts a `(−1)`-vertex of degree two on an edge.
  - `isNegativeDefinite_blowUpVertex_iff` (`BlowUp.lean:609`) and `isNegativeDefinite_blowUpEdge_iff` (`EdgeBlowUp.lean:633`) show that each blow-up preserves and reflects negative definiteness.
  - `BlowUp.lean:58` says "invariance of lattice homology under the Neumann moves is a separate (later) target".
  - Plumbing graphs carry sphere vertices only (a weight per vertex, `IntersectionForm.lean:88`), and coefficients are `𝔽₂[U]` (`PlumbingCoefficient`, `Differential.lean:66`).

### Fix: note for the Tau Ceti maintainer
Source: Némethi arXiv:0709.0841v1, 3.4.1 and Proposition 3.4.2 with its proof (p. 9).
1. **Lane L, lines 243–244.** Replace "`ℍ⁻`/`ℍ⁰` as a `ℤ[U]`-module from lattice points and weight functions; invariance under **Neumann moves**;" with:
   > `ℍ⁻`/`ℍ⁰` as a `ℤ[U]`-module from lattice points and weight functions, for **negative-definite** plumbing graphs; invariance under blow-up and blow-down of a genus-0 `(−1)`-vertex with at most two incident edges (Némethi, Proposition 3.4.2). Its proof treats "blowing up a smooth point" and "blowing up an intersection point", which are Tau Ceti's `blowUpVertex` and `blowUpEdge`, both already shown to preserve and reflect negative definiteness. ⚠ That any two negative-definite plumbing graphs of the same 3-manifold are related by these moves (Némethi 3.4.1, stated there without proof) is topology: it rests on Neumann's plumbing calculus, whose other moves leave the negative-definite class, where the invariant is undefined. It is a separate reconciliation owned outside this lane;
2. **Dichotomy item 3 (line 58).** Replace "invariance under Neumann moves" with "invariance under the blow-ups and blow-downs connecting negative-definite plumbing graphs (Némethi, Proposition 3.4.2)".

**Other roadmaps (one line):** the statement of Némethi 3.4.1 (the negative-definite restriction of Neumann's plumbing calculus) needs an owner, in GeometricTopology (plumbing calculus) or HeegaardFloer.

### Not done, and why
- "Zemke's theorem … all plumbed manifolds" (lines 58–60) is left alone. Its scope was filed by the HeegaardFloer red team with a note for this lane.
- Neumann's calculus paper was not read. 3.4.1 is quoted from Némethi, who states it without proof or citation; its attribution to Neumann's calculus is the finding's and the review's.

## GeometricTopology (/59, /61, /66–/80): conventions

**Scope and baseline.** Findings /59, /61 and /66–/80, all on the Tau Ceti roadmap `GeometricTopology`
(`content/tau-ceti/GeometricTopology/README.md`; extract `research/blueprint/atlas/roadmaps/tauceti_TauCetiRoadmap_GeometricTopology.json`).
- **Nothing has changed since the verification.** The README was last rebuilt on 16 September (3d890fef) and the extract on
  16 September (9820e12a). The line numbers below are those of `main` at 31403074, and they match the review's.
- **Edges at 31403074.** The extract has 11 stages (Layers 1–11), all `requires: []`, and no stage edges. In the assembled
  atlas the only stage edges touching the roadmap are two reviewed LieGroups links into Layers 8 and 10, promoted on
  23 September, before the review. No stage edge joins GeometricTopology to CombinatorialHeegaardFloer, AlgebraicTopology or
  FuchsianOrbifolds.
- **Every fix is a note for the Tau Ceti maintainer** (PROTOCOL.md §15), with exact replacement wording. Quotations ignore
  the README's line wrapping. Each one was checked to occur exactly once in the snapshot.
- **The atlas side is the same for every note.** Once upstream applies a note, the atlas maintainer regenerates the
  snapshot and the stage descriptions. A regenerated extract alone is not the repair. The only direct atlas edits are the
  stage links listed under /61, /71, /72, /77 and /79.
- **Cycle checks.** Every link was tested on the assembled graph, cumulatively. The internal Layer 1–11 edges from
  /91 were added first as context. "Acyclic" means that no path leads from the target back to the source.
- **Library claims.** Library claims name declarations read at Tau Ceti `f790474` and Mathlib `082e2d3`.

## /59 (medium, missing): Layer 6 stops importing `s`; Rasmussen's `s` is recorded as unowned, with a proposed owner

### What the verifier corrected
Nothing is narrowed. The verifier confirms the following:
- Layer 6 imports "`τ`, and ideally `s`" from CombinatorialHeegaardFloer (CHF).
- Layer 4 credits `[Kir97, 1.41]` "jointly with" CHF's `τ`.
- "Rasmussen" occurs in no atlas stage, and no roadmap plans Khovanov homology or Lee's deformation.
- `τ` cannot replace `s`. Piccirillo's shake-genus argument bounds the slice genus with `s`, and in the Conway-knot paper
  `τ` vanishes on the whole `0`-trace family.

### State on main (31403074)
- **Layer 6, lines 576–577:** "*consumes* the homological concordance invariants (`τ`, and ideally `s`) from the
  combinatorial Heegaard Floer roadmap".
- **Layer 6, lines 600–602:** "the import of `τ : C → ℤ` and `s` as consumers of the combinatorial Heegaard Floer roadmap".
- **Layer 6, lines 617–618:** "`τ` and `s` arrive later as imports".
- **"How to drive it", lines 1126–1128:** "The homological concordance invariants (`τ`, `s`) are coordinated with the
  combinatorial Heegaard Floer roadmap".
- **Layer 4 Unlocks, lines 514–515:** unchanged; see /72.
- **Atlas search.** "Rasmussen" occurs in no stage. "Khovanov" occurs only in ZigzagPreprojective Layer 8 (braid
  complexes).

### Fix
**Note for the Tau Ceti maintainer (GeometricTopology README).**
1. **Layer 6 introduction, "From Mathlib" and the invariants bullet** (lines 573–582 and 600–602). These are rewritten once,
   under /79, and the rewrite drops `s`.
2. **Layer 6 design notes.** Replace "`τ` and `s` arrive later as imports, so state the signature results without waiting
   on them." with:
   > `τ` arrives later, in layer 6b, so state the signature results without waiting on it. Rasmussen's `s` does not come
   > from the combinatorial Heegaard Floer roadmap, which builds Heegaard Floer invariants only. It is defined from
   > Khovanov homology through Lee's deformation, which no roadmap yet plans.
3. **"How to drive it".** Replace "The homological concordance invariants (`τ`, `s`) are coordinated with the combinatorial
   Heegaard Floer roadmap, which consumes layer 4's knot types in return." with:
   > The concordance invariant `τ` and its slice-genus bound come from the combinatorial Heegaard Floer roadmap. That
   > roadmap consumes layer 4's knot types and layer 6's cobordisms in return, and `τ` comes back only in layer 6b.
   > Rasmussen's `s` needs a Khovanov-homology roadmap, which does not yet exist.
4. **Layer 4 Unlocks and the Piccirillo references.** See /72.

**Note for the maintainer: a proposed owner for `s`.** Plan a new roadmap, "Khovanov homology, Lee's deformation and
Rasmussen's `s`": either a new Tau Ceti roadmap or an atlas roadmap under PROTOCOL.md §7. The contract its consumers need
is the one Piccirillo, *Shake genus and slice genus*, arXiv:1803.09834v2, Theorem 2.1 (p. 7) quotes from Rasmussen. For
every knot `K` in `S³`:
- `|s(K)| ≤ 2 g_4(K)`, with `g_4` the smooth slice genus;
- `s` induces a homomorphism from the smooth concordance group to `ℤ`;
- `rank Kh^{0, s(K) ± 1}(K) ≠ 0`.

The primary source is J. Rasmussen, *Khovanov homology and the slice genus*, Invent. Math. 182 (2010) 419–447,
doi:10.1007/s00222-010-0275-6, arXiv:math/0402131. Its abstract states the concordance invariance and the slice-genus bound.
The consumers are GeometricTopology Layer 4's `[Kir97, 1.41(A)]` target (/72) and the Conway-knot target.

**Other side (CombinatorialHeegaardFloer), in one line.** CHF's README should say that it supplies `τ` and its
slice-genus bound, and not `s`. The concordance-homomorphism assembly of `τ` is /60.

### Not done, and why
- **No Khovanov roadmap is drafted.** It needs its own design job.
- **Rasmussen's paper was read only at its abstract.** The three properties above are quoted from Piccirillo's Theorem 2.1,
  which cites it.

## /60 (medium, missing): τ as a concordance homomorphism gets its own milestone

### What the verifier corrected
Nothing was narrowed. GeometricTopology layer 6 calls τ "a homomorphism on the concordance group", no CHF stage plans a connected-sum formula, and the other ingredients (G.5, G.8, G.10) are not assembled.

### State on main (31403074)
- **GeometricTopology:** layer 6 lines 579–581 read "the combinatorial Heegaard Floer roadmap's `τ` (a homomorphism on the concordance group)"; lines 588–589 read "Connected sum is the group operation and the reverse mirror the inverse".
- **CHF** has no connected-sum item.
- **Sources read:**
  - The book only asserts additivity: "It follows from a Künneth principle that τ(K, ℤ/pℤ) is additive under connected sums" (§17.2, p. 344).
  - Ozsváth–Szabó prove additivity from "the Künneth principle for the knot filtration" (arXiv:math/0301149v4, §3.2, Proposition 3.2).
  - Kubota's combinatorial Künneth theorem (arXiv:2308.03324v3, Corollary 1.8) is for `ĤFK = GĤ` "as bigraded 𝔽-vector spaces" only.

### Fix: note for the Tau Ceti maintainer
Add a milestone after G.13. It is numbered 14 so that G.11–G.13 keep their numbers.
> 14. **τ as a concordance homomorphism** (needs G.8, G.10 and Lane K; consumed by the geometric-topology roadmap's layer 6b).
>     - A grid diagram of `K₁ # K₂` built from grids of `K₁` and `K₂`, identified by Lane K with that roadmap's connected sum.
>     - The Künneth formula `GĤ(K₁ # K₂) ≅ GĤ(K₁) ⊗ GĤ(K₂)` (Kubota, [arXiv:2308.03324](https://arxiv.org/abs/2308.03324), Corollary 1.8, proved combinatorially through grid homology of spatial graphs, Theorem 1.7).
>     - Additivity `τ(K₁ # K₂) = τ(K₁) + τ(K₂)`.
>     - Hence τ descends to a homomorphism from the smooth concordance group to `ℤ`, using concordance invariance (G.10 at `g = 0`), `τ(−K) = τ(K)` (Proposition 5.3.2) and `τ(m(K)) = −τ(K)` (Corollary 7.4.5).
>
>     ⚠ Additivity needs a Künneth theorem for the Alexander-filtered complex (or for `GH⁻` as an `𝔽[U]`-module), not only for `GĤ`. Ozsváth–Szabó derive it holomorphically from the Künneth principle for the knot filtration ([arXiv:math/0301149](https://arxiv.org/abs/math/0301149), Proposition 3.2). The book only asserts it (§17.2). A combinatorial proof of that filtered Künneth theorem is still to be located or written before this milestone is scheduled.

**GeometricTopology (one line, with /79):** Layer 6's τ import comes from CHF milestone 14. At layer granularity, GT layer 6 → G.10 → milestone 14 → GT layer 6 is a cycle (cycle check: adding G.10 → GT layer 6 on top of the /64 edges gives CYCLE), so GeometricTopology must split layer 6 before the consumer edge can be recorded. /79 does this: the consumer is its new Layer 6b, and the edge is G.14 → Layer 6b.

**Atlas:** nothing now. Milestone 14 does not exist in the snapshot. After the upstream revision and a snapshot refresh, record G.8 → G.14, G.10 → G.14 and Lane K → G.14, and G.14 → GT Layer 6b once /79's Layer 6b exists.

### Not done, and why
- No combinatorial source for the filtered Künneth theorem was found among the papers read (Kubota's is for `GĤ` only), so additivity stays an explicit obligation.
- The `s` invariant is /59's.

## /61 (low, duplicate): Cromwell's theorem is CHF Lane K's; Layer 4 cites it

**State.** Layer 4 still builds the grid correspondence itself:
- lines 449–450 give "(Markov's theorem for braid-to-diagram, Cromwell's for grid-to-diagram)";
- lines 462–463 give the direct edge "(grid-to-diagram for the Heegaard Floer roadmap, braid-to-diagram via Markov)".

CHF Lane K (lines 229–231 of its README) plans the same theorem. The library side:
- Tau Ceti `f790474` has the grid moves `GridDiagram.IsMove` (`TauCeti/KnotTheory/Grid/Move.lean:62`) and the quotient
  `GridLink` (`:147`);
- the docstring of `GridLink` leaves "the separate Cromwell-reconciliation target" open.

**Note for the maintainer.**
- Replace "(Markov's theorem for braid-to-diagram, Cromwell's for grid-to-diagram)" with "(Markov's theorem for
  braid-to-diagram; the grid-to-diagram correspondence, Cromwell's theorem, is built by the combinatorial Heegaard Floer
  roadmap's Lane K and only cited here)".
- Replace "(grid-to-diagram for the Heegaard Floer roadmap, braid-to-diagram via Markov)" with "(braid-to-diagram via
  Markov; the grid-to-diagram edge is Lane K's)".

**Link (atlas).** Add GT Layer 4 → CHF `lane-k-knot-theory-reconciliation` (acyclic).
- The same edge is in /64's list. Record it once.
- The reverse edge that the red team proposed is not added, because together with this one it would be a 2-cycle. No
  GeometricTopology stage consumes the grid presentation.

**Other side (CombinatorialHeegaardFloer), in one line.** Lane K keeps Cromwell's theorem (book Appendix B.4), as its README already says.

## /62 (low, error): three locators

- **G.12 (lines 206–207).** Replace "(existence and uniqueness up to gauge; MOST §15.2, or Gallais's spin-extension construction)" with "(needs G.5; existence and uniqueness up to gauge: MOST, Definition 4.1 and Theorem 4.2, proved in §4.1; the book's §15.2, which follows Gallais's spin-extension construction, [arXiv:0706.0089](https://arxiv.org/abs/0706.0089))". MOST v3 has six sections: 1 Introduction, 2 Properties of `C⁻(G)`, 3 Invariance, 4 Signs, 5 More properties, 6 Relation to the Alexander polynomial. Definition 4.1 and Theorem 4.2 are on PDF p. 25. The book's §15.2 starts on p. 295 ("based on Gallais' approach").
- **References (lines 305–306).** Replace "Appendix A is Lane ALG's contents, Appendix B is Lane K's." with:
  > Appendix A is Lane ALG's contents. Of Appendix B, B.4 (Cromwell's theorem) is Lane K's. B.1 (Reidemeister's theorem) and B.3 (Reidemeister–Singer for Seifert surfaces, with Seifert's algorithm) are the geometric-topology roadmap's layer 4. B.2 (Legendrian and transverse Reidemeister moves) belongs to G.11's contact reconciliation. B.5 (normal forms of knot cobordisms) is that roadmap's layer 6 input to G.10.
- **References.** Add the entry:
  > - S. Sarkar, [arXiv:1011.5265](https://arxiv.org/abs/1011.5265) (Math. Res. Lett. 18 (2011)): the grid proof of `|τ(K₀) − τ(K₁)| ≤ g` (G.10), which inspired the book's Chapter 6 (G.7).

  G.10's text (under /45) cites it.

## /63 (low, other): G.13's object and Υ

Covered by G.13's replacement under /54. It names `CFK^{−,*}` as the grid analogue (book p. 8 dictionary: "The filtered knot complex … `CFK^{−,*}(S³, K)` … `GC⁻(G)` (Unblocked) filtered grid complex") and `CFK^∞` as its `U`-localisation. It makes Földvári's grid `Υ` (arXiv:1903.05893v1: Definition 5.1, Theorem 5.2, Corollary 5.10) a target, and routes the comparison with holomorphic `Υ` (Kubota arXiv:2412.08146v1, Theorem 1.1) to the HeegaardFloer reconciliation list (one line under /54).

## /64 (medium, other): the stage edges, and "How to drive it"

### What the verifier corrected
Nothing was narrowed. All 22 stages have `requires: []` and `consumers: []`, and the only CHF edges are three roadmap-level `declared` edges with `stageCount` 0.

### State on main (31403074)
- **Unchanged since the review:**
  - The extract has `"stageEdges": []`.
  - `data/atlas.json` has no stage edge touching CHF.
  - The roadmap edges GeometricTopology → CHF, CHF → GeometricTopology and CHF → HeegaardFloer are all `declared`, `stageCount` 0.
- **"How to drive it", lines 329–333:** "Lanes G.1–3 (with ALG), L, and K can all start immediately and independently. … Lane H follows G once the nice-move idiom is established. …"
- **G.4, lines 180–181:** "**Euler characteristic = Alexander polynomial**, via the grid determinant formula (book, Chapter 3.3): an early, decidable, self-validating milestone."

### Fix
**1. Note for the Tau Ceti maintainer.**
- Each milestone's replacement text above opens with its "needs" clause, so that a snapshot refresh derives the edges as README-evidenced ones.
- **G.4 (lines 180–181).** Replace with:
  > 4. **Euler characteristic = Alexander polynomial** (needs G.3; for the classical Alexander polynomial, Lane K). The graded Euler characteristic of the chain module is a sign times a monomial times the grid determinant (book Proposition 4.7.5's computation). It equals that of homology by Euler–Poincaré in each Alexander degree, and the grid determinant is the Alexander polynomial (Theorem 3.3.6, Lane K). Hence `χ(GĤ(K)) = Δ_K(t)` (Theorem 4.7.6); the link case is Proposition 8.2.10 (G.9). The first two steps are combinatorial and already built at the chain level in Tau Ceti (`OddComponentGridDiagram.gradedEulerChar_eq_smul_T_mul_det_weightMatrix`), with Euler–Poincaré available as `AbelianK0.eulerChar_eq_homologyEulerChar` and `HomologicalComplex.eulerChar_forgetFG_eq_homologyEulerChar`. An early, decidable, self-validating milestone.
- **"How to drive it" (lines 329–333).** Replace the paragraph with:
  > Lanes G.1–G.6 (with ALG), G.12, G.13, L, and K can all start immediately and independently; within them, G.6(a) comes before G.5. G.4's general statement, and G.7–G.11 and G.14, are theorems about classical invariants and also wait for Lane K and the geometric-topology roadmap's layers 4 and 6:
  > - G.4, the Alexander polynomial;
  > - G.7, the unknotting number;
  > - G.8, the Seifert genus;
  > - G.9, alternating diagrams, the determinant, the signature and the multivariable Alexander polynomial;
  > - G.10, the smooth slice genus and the normal form of cobordisms;
  > - G.11(b), Legendrian knots;
  > - G.14, connected sum and the concordance group.
  >
  > The spine to push hardest is **G**: it reaches a famous theorem (Milnor conjecture) entirely within reach of current technology. Lane H follows G once the nice-move idiom is established. Its identification with 3-manifolds needs the Kneser–Milnor and Luo theorems from the geometric-topology roadmap. Nothing here waits for the analytic roadmap; the seams between them are the reconciliation theorems, which the analytic roadmap states and tracks.
- The standing-conventions sentence on topology is under /44.

**2. Atlas edits: `data/atlas.json`.**
- **What to add.** For each edge A → B in the table, add the `stageEdges` record `{"source": A, "target": B}`, add A to B's `requires`, and add B to A's `consumers`.
- **Afterwards.** The build recomputes the roadmap-level `edges` counts. Then regenerate the extracts with `research/blueprint/make_atlas_extracts.py`, since they are generated and must not be edited by hand.
- **Abbreviations.**
  - `G.n`, `H.n`, `ALG` and `K` are `tauceti:TauCetiRoadmap/CombinatorialHeegaardFloer#milestone-g-n`, `#milestone-h-n`, `#lane-alg-bigraded-and-filtered-homological-algebra` and `#lane-k-knot-theory-reconciliation`.
  - `GT1`, `GT4`, `GT6` and `GT9` are the GeometricTopology stages `#layer-1-manifold-library-buildout-general-dimension-general-structure-group`, `#layer-4-knot-theory-done-properly-owned-here`, `#layer-6-knot-concordance-and-4d-cobordism-owned-here` and `#layer-9-heegaard-splittings-and-heegaard-genus`.
  - `DGA1` and `DGA3` are `tauceti:TauCetiRoadmap/DGAInfinity#layer-1-dg-algebras-categories-modules-and-bimodules` and `#layer-3-minimal-models-and-homological-transfer`.
  - `F4.3` is `tauceti:TauCetiRoadmap/HeegaardFloer#milestone-f4-3`.
- **Cycle check.** Every edge was checked on its own on the assembled graph at 31403074, and all 35 were checked together against the 7792 edges of the assembled graph. All are acyclic.

| Edge | What is supplied (locator) | From |
| --- | --- | --- |
| G.1 → G.2 | grid states for the gradings | /64 |
| G.2 → G.3 | gradings of the complexes | /64 |
| G.3 → G.4 | the complex, for χ of homology | /64 |
| K → G.4 | `D_G = Δ_L` (Theorem 3.3.6) | /64 |
| G.3 → G.6 | `GC⁻`, for `V_i ≃ V_j` (Lemma 4.6.9) | /42, /43 |
| G.6 → G.5 | Lemma 4.6.9 in Theorem 5.3.1 and (5.24) | /43 |
| ALG → G.5 | bigraded cones (Proposition 5.2.17) | /43, /53 |
| G.5 → G.7 | invariance; commutation-style maps (§6.2) | /43 |
| K → G.7 | crossing change = cross-commutation (Proposition 3.1.13) | /44 |
| GT4 → G.7 | `u(K)`, `T_{p,q}`, Lemma 6.3.4 | /44 |
| G.7 → G.8 | τ, Proposition 6.1.4 (Proposition 7.3.3, Corollary 7.4.5) | /46, /51 |
| ALG → G.8 | structure theorem, duals, universal coefficients (A.4.3, A.5.6) | /51 |
| K → G.8 | grid realising the Seifert genus (Proposition 3.4.11) | /46 |
| G.8 → G.9 | Eq. (7.6) and Proposition 7.3.2 in Corollary 10.3.2 (and, through G.7, G.5's invariance for links, Theorem 8.2.5) | /47, /64 |
| K → G.9 | grid presentation of the link group (§3.5) | /48 |
| GT4 → G.9 | alternating diagrams, determinant, Goeritz, multivariable Δ | /47, /48 |
| GT6 → G.9 | the signature | /47 |
| G.9 → G.10 | collapsed link homology (§8.2) | /45 |
| G.7 → G.10 | τ | /45 |
| K → G.10 | grid saddles and unknots (§§8.3–8.4) | /45 |
| GT4 → G.10 | smooth `g_s` | /45 |
| GT6 → G.10 | normal form of cobordisms (B.5) | /45 |
| G.7 → G.11 | canonical cycles `x^±` (§6.4); via G.5, Proposition 5.4.1 | /50 |
| G.5 → G.12 | invariance over ℤ adapts G.5's maps | /62 |
| ALG → G.13 | filtered complexes (item 4) | /54 |
| G.5 → G.13 | filtered invariance adapts G.5's maps (Theorem 13.2.9) | /54 |
| H.1 → H.2 | diagrams, domains, `μ` | /55 |
| H.2 → H.3 | nice moves, complex | /55 |
| H.3 → H.4 | the invariant over 𝔽₂ | /56 |
| GT4 → K | Lane K "consumes" layer 4 (README line 226, explicit) | /44 |
| GT1 → H.3 | Kneser–Milnor (layer 8 assigns it to layer 1) | /55 |
| GT9 → H.3 | Luo's theorem | /55 |
| DGA1 → ALG | DG modules over a graded algebra | /53 |
| DGA3 → ALG | filtered perturbation lemma | /54 |
| H.1 → F4.3 | admissibility | /57 |

- **Not recorded, and why:**
  - **Edges into G.14 (/60).** The milestone is not in the snapshot yet.
  - **Any CHF → GT layer 6 edge.** Cycle check: adding G.10 → GT6 on top of these edges gives CYCLE. Such edges wait for /79's Layer 6b and then target it.
  - **AT Stage 0 → ALG (/51, /54).** The new AlgebraicTopology Stage 0 (/24) owns ℤ-filtered chain complexes and the universal coefficient theorem over a PID. The edge waits until the snapshot carries Stage 0. A stage with only outgoing edges cannot close a cycle.
  - **The reverse edge K → GT4 proposed in /61.** It would close a 2-cycle with GT4 → K (cycle check: CYCLE). The GT4 → K direction follows Lane K's own README text ("consumes … layer 4") and /44, /46, /48.
  - **Transitive duplicates** (for example G.6 → G.7 and G.5 → G.9) are left out.
- **Durability.** A snapshot refresh (`scripts/snapshot/`) keeps a Tau Ceti stage edge only when upstream README evidence supports it. The intra-CHF edges therefore last once upstream adopts the "needs" wording above. The cross-roadmap ones also belong in a CHF link map (`data/links/tauceti_TauCetiRoadmap_CombinatorialHeegaardFloer.json`, a LINK job under §10). No such map exists yet.

### Not done, and why
No link map is written, because this job's only deliverable is the report.

## /65 (low, library-claim): record what is built, for AUDIT-44

- **State on main (31403074), changed since the review.**
  - `data/tauceti-progress.json` (added 28 September, refreshed 29 September) overlays Tau Ceti's Progress-page lane states on every leaf (`scripts/tauceti_progress.py`, `apply`). G.1–G.13 now all read `in_progress` (Lane G "partial"), and H.1–H.4 and Lane K read `planned`.
  - This overrides the per-milestone statuses of `data/stage-status-reports.json` (8 September: G.1 and G.2 complete, G.6–G.13 planned).
  - At build time the snapshot copy of `STATUS.md` is replaced by a link to upstream's, which is still the 8 September report (`b53ed55`) and still lists "`∂⁻ ∘ ∂⁻ = 0`" as frontier.
  - Stage `status` is still `unknown`, `data/library-coverage.json` still has no CHF entry, and `research/blueprint/audit/AUDIT-44.json` (which includes CHF) still has no result. The build applies reviewed library coverage after the Progress overlay, so an accepted AUDIT-44 result is what restores per-milestone statuses.
- **For AUDIT-44** (all read at `f790474`; no `sorry` under `TauCeti/KnotTheory`, `TauCeti/LowDimTopology` or `TauCeti/Algebra/Bigraded`, as the verifier checked):
  - **G.1, built.** `GridState` (`Grid/Diagram/Basic.lean:63`, wrapping `Equiv.Perm (Fin n)`), `GridDiagram` (`:764`), `GridRectangleBetween` (`Rectangle/Basic.lean:393`), `emptyRectangles` (`:678`).
  - **G.2, built for knots.** `maslovO` (`Gradings.lean:66`), `alexander` (`:91`, knot normalisation, /41), `alexander_sub_alexander_eq_card_sub_card` (`Grading/MarkingCount.lean:417`), `maslovO_sub_maslovO_eq_one_sub_two_mul_card` (`:453`), `alexander_exists_int_iff` (`Grading/Parity.lean:279`).
  - **G.3, built.**
    - Square-zero in characteristic 2: `unblockedDifferential_comp_self_eq_zero` (`Differential/Square/Zero.lean:132`, over any `CommSemiring R` with `CharP R 2`), `simplyBlockedDifferential_comp_self_eq_zero` (`:142`), `fullyBlockedDifferential_comp_self_eq_zero` (`:174`).
    - The complexes: `fullyBlockedComplex` / `unblockedComplex` / `simplyBlockedComplex` (`Chain/Complex.lean:65, 97, 129`).
  - **G.4, partial (chain level).** `stateSum_eq_smul_T_mul_det_weightMatrix` (`Determinant.lean:170`), `OddComponentGridDiagram.gradedEulerChar_eq_smul_T_mul_det_weightMatrix` (`EulerCharacteristic.lean:260`), whose doc says the comparison with homology "is not formalized here". Not matched to `Δ_K`.
  - **G.5, partial (moves only).** `IsMove` (`Move.lean:62`), `GridLink` (`:147`), `toGridLink_eq_iff_movesTo` (`:159`), and the differentials intertwined by cyclic permutations (`Differential/CyclicPermutation.lean:129, 228`). No pentagon or stabilisation maps.
  - **G.6–G.13, Lane H and Lane K: missing.** The only grid homology computed is for `n ≤ 2` (`finrank_fullyBlockedHomology_of_two`, `Homology.lean:167`).
  - **Lane L, partial.** `latticeDifferential_comp_self` (`Plumbing/Differential.lean:386`, over `𝔽₂[U]`), `exists_injective_latticeHomologyCycleMap` (`Tower.lean:263`), `coefficientEquivOneVertexPlumbingLatticeHomology` (`OneVertex.lean:424`), `e8Plumbing_not_isZero_latticeHomology` (`E8.lean:214`), and both blow-ups (/58). No invariance of homology and no `ℤ[U]`.
  - **Lane ALG, partial.** `Bigraded.isStablyEquiv_iff_reducedRep_eq` (`Algebra/Bigraded/Stabilization.lean:334`), at the level of Poincaré series only.
- **Unused library inputs.** Euler–Poincaré (`TauCeti.AbelianK0.eulerChar_eq_homologyEulerChar`, `CategoryTheory/GrothendieckGroup/EulerCharacteristic.lean:300`, for strictly bounded cochain complexes; `HomologicalComplex.eulerChar_forgetFG_eq_homologyEulerChar`, `Algebra/Homology/EulerCharacteristic/FiniteDimensional.lean:143`) is cited in G.4's text (/64). `Module.equiv_free_prod_directSum` is cited in Lane ALG item 2 (/51).
- **Note for the Tau Ceti maintainer.**
  - G.1's caveat (lines 169–172, "⚠ Encoding choice … deserves a short experiment before committing; the 2025 summer project (acknowledgements) tried all three.") can be replaced by "Encoding (settled): Tau Ceti's `GridState` wraps `Equiv.Perm (Fin n)`, with cyclic permutations as explicit moves."
  - Upstream's CHF `STATUS.md` (report of `b53ed55`, 8 September) should be regenerated, because `∂² = 0` is proved at `f790474`.

## /66 (high, error): Layer 10 states Thurston's inequality as a theorem and disproves its converse, with the Thurston norm

### What the verifier corrected
The verifier checked the vacuity argument and found it decisive:
- As sketched, `EulerClassBounded` quantifies over every embedded surface with right-hand side `−χ(S)`. An embedded
  2-sphere gives `0 ≤ −2`, so the predicate holds of no foliation, and `gabai_yazdi` is vacuously true.
- With `|χ|`, or with spheres excluded, the target contradicts Thurston's inequality, which is a theorem.
- The direction is also reversed. The inequality is Thurston's theorem, and what was disproved is the Euler class one
  conjecture.
- The layer plans neither the Thurston norm nor its dual.

### State on main (31403074)
The defect is unchanged:
- lines 783–785 read "Thurston conjectured a bound on this class; Gabai and Yazdi disproved it";
- lines 802–805 give the "Euler-class bound" bullet;
- lines 811–812 give `EulerClassBounded` and `gabai_yazdi`;
- lines 816–818 give the design note;
- lines 820–821 give the Unlocks;
- lines 1097–1098 read "D. Gabai, M. Yazdi, *On Thurston's Euler class-one conjecture*". That paper is by Yazdi alone.

"Thurston norm" occurs only in CHF (the Lane G overview and G.9), which has no owner for it. That is /49.
Neither library has foliations or the Thurston norm.

### Fix
**Note for the Tau Ceti maintainer (GeometricTopology README, Layer 10).**

1. **Introduction.** Replace "Thurston conjectured a bound on this class; Gabai and Yazdi disproved it, and stating that
   needs foliations and the Euler class as first-class objects." with:
   > Thurston proved that the Euler class of a taut foliation has dual Thurston norm at most one. He conjectured the
   > converse: on a closed hyperbolic 3-manifold, every integral class of dual norm one is the Euler class of a taut
   > foliation. Yazdi disproved the converse, using Gabai and Yazdi's fully marked surface theorem. Stating both needs
   > foliations, the Euler class and the Thurston norm as first-class objects.

2. **"What to build".** Replace the bullet from "- The **Euler-class bound** statement" to "Define the surface class and the
   pairing before the inequality." with the following, taken from Yazdi, arXiv:1603.03822v4, §1 (pp. 1–3), unless marked:
   > - **The Thurston norm and its dual.** Let `M` be a compact orientable 3-manifold. For a compact orientable surface `S`
   >   with components `S_i`, set `χ₋(S) = Σ_{χ(S_i) < 0} |χ(S_i)|`. For an integral class `a` of `H₂(M)` or `H₂(M, ∂M)`,
   >   let `x(a)` be the minimum of `χ₋(S)` over properly embedded oriented surfaces `S` with `[S] = a`. Extend `x` linearly
   >   to rational classes and continuously to real ones; it is a seminorm. Define `x*` on `H²(M; ℝ)` and on
   >   `H²(M, ∂M; ℝ)` as the dual norm. Include the bounded case, since link complements need it (the combinatorial Heegaard Floer
   >   roadmap's G.9).
   > - **Thurston's inequality (a theorem).** Let `M` be closed, orientable and irreducible, and `F` a taut foliation. For
   >   every properly embedded, oriented, incompressible surface `S` (no sphere or disc components),
   >   `|⟨e(F), [S]⟩| ≤ |χ(S)|`; equivalently `x*(e(F)) ≤ 1`. Equality holds when `F` has a compact leaf of negative
   >   Euler characteristic (Yazdi §1, p. 2). The integral Euler class of a transversely oriented plane field satisfies
   >   the *parity condition* `e(F) ∈ 2 H²(M; ℤ)` (Yazdi, the definition on p. 2).
   > - **The Euler class one conjecture, and its failure.** `EulerClassOne M` means: for every `a ∈ H²(M; ℤ)` with
   >   `a ∈ 2 H²(M; ℤ)` and `x*(a) = 1` there is a taut foliation `F` with `e(F) = a`. This is Thurston's conjecture as
   >   Yazdi states it, for `M` closed, orientable, irreducible and atoroidal (p. 2), with the parity condition added,
   >   which Yazdi takes as part of the hypotheses. **Theorem:** there are infinitely many closed hyperbolic 3-manifolds
   >   `M` with `¬ EulerClassOne M` (Yazdi, Main Theorem, p. 3, conditional on the fully marked surface theorem; Gabai and
   >   Yazdi, arXiv:2008.07223v1, §1, p. 2, which proves that theorem and states the combined result).
   > - **Unit tests.** A foliation with a compact leaf of negative Euler characteristic attains `x*(e(F)) = 1`, so the
   >   bound is sharp and not vacuous. ⚠ Never quantify a bound over all embedded surfaces with right-hand side `−χ(S)`:
   >   an embedded 2-sphere gives `0 ≤ −2`, so such a predicate holds of no foliation.

3. **Lean sketch.** Replace the two lines `-- def EulerClassBounded …` and `-- theorem gabai_yazdi …` with:
   ```lean
   -- def thurstonNorm (M) : H₂(M, ∂M; ℝ) → ℝ              -- x: χ₋ of embedded representatives, extended from integral classes
   -- def dualThurstonNorm (M) : H²(M; ℝ) → ℝ≥0∞            -- x*, the dual of x
   -- theorem thurston_inequality (hM : ClosedOrientableIrreducible3 M) (F : Foliation M) (hF : Taut F) :
   --     dualThurstonNorm M (eulerClass F.dist).toReal ≤ 1
   -- def EulerClassOne (M) : Prop := ∀ a : SingularCohomology 2 M ℤ, a ∈ 2 • ⊤ → dualThurstonNorm M a.toReal = 1 →
   --     ∃ F : Foliation M, Taut F ∧ eulerClass F.dist = a
   -- theorem not_eulerClassOne : ∃ M : ClosedHyperbolic3, ¬ EulerClassOne M   -- Yazdi; Gabai–Yazdi (infinitely many)
   ```

4. **Design notes.** Replace "State Thurston's conjecture as the *bounded* predicate and the Gabai–Yazdi result as its
   negation on an explicit example, so the disproof is a witness rather than a universal statement." with:
   > Thurston's inequality is a theorem, not the conjecture. The conjecture is its converse, `EulerClassOne`, and the
   > disproof is a witness `M` with `¬ EulerClassOne M`.

5. **Unlocks.** Replace "Gabai–Yazdi's disproof of Thurston's foliation Euler-class conjecture (no Kirby number)." with:
   > Thurston's inequality `x*(e(F)) ≤ 1` for taut foliations, and the disproof of Thurston's Euler class one conjecture
   > (Yazdi, with Gabai–Yazdi's fully marked surface theorem; no Kirby number).

6. **References.** Replace the item "- D. Gabai, M. Yazdi, *On Thurston's Euler class-one conjecture*, Acta Math. 225
   (2020), [arXiv:1603.03822](https://arxiv.org/abs/1603.03822): the disproof." with:
   > - M. Yazdi, *On Thurston's Euler class-one conjecture*, Acta Math. 225 (2020) 313–368,
   >   doi:10.4310/ACTA.2020.v225.n2.a3, [arXiv:1603.03822](https://arxiv.org/abs/1603.03822): the counterexamples,
   >   conditional on the fully marked surface theorem. D. Gabai, M. Yazdi, *The fully marked surface theorem*, Acta Math.
   >   225 (2020) 369–413, doi:10.4310/ACTA.2020.v225.n2.a4, [arXiv:2008.07223](https://arxiv.org/abs/2008.07223). The two
   >   together are the disproof.

   In the Thurston memoir item already listed ("W. Thurston, *A norm for the homology of 3-manifolds*, Mem. Amer. Math. Soc.
   59 (1986)"), add after "(1986)": "no. 339, 99–130: the norm, the inequality, and the Euler class one conjecture (p. 129,
   Conjecture 3, as Yazdi cites it)".

**Inputs are not re-planned here.** Singular cohomology, the Kronecker pairing, fundamental classes of embedded surfaces
and the Euler class through a Thom class are /88's. The link AlgebraicTopology Stage 6 → Layer 10 is in /88 and
/91 (acyclic).

### Not done, and why
- **Thurston's memoir was not read.** It is not freely available. Every statement above is taken from the introductions of
  Yazdi and of Gabai–Yazdi, which quote it.
- **The relative (sutured, toral-boundary) versions are not planned.**

## /67 (high, error): Layer 2's "PL embeddings are locally flat" holds only away from codimension two

### What the verifier corrected
Nothing is narrowed. The PL half is false in codimension two:
- The cone on a nontrivial knot in `S³ = ∂D⁴` is a PL disc that is not locally flat at the cone point. Local flatness
  there would make every knot topologically slice.
- In codimension at least three, PL embeddings are locally flat.
- `LocallyFlat/Smooth.lean:213` and `Signature.lean:161` exist at the pin.

### State on main (31403074)
- **Lines 326–327:** "- **Smooth and PL embeddings are locally flat**, stated against layer 1's structure groups".
- **Sketch, line 337:** "-- theorem isLocallyFlat_of_smoothEmbedding … : IsLocallyFlat f".
- **Built at `f790474`.**
  - `TauCeti.IsLocallyFlat` (`Geometry/Manifold/LocallyFlat/Basic.lean:288`): slice charts onto `univ ×ˢ {0}` in a model
    `F × F'`, so the domain has no boundary model.
  - `IsLocallyFlat.of_isSmoothEmbedding` (`LocallyFlat/Smooth.lean:213`), under `[I.Boundaryless] [J.Boundaryless]`.
  - `signature_trefoilSeifertMatrix` (`KnotTheory/Signature.lean:161`, value `−2`). It is stated for a matrix, not for a
    knot; see /78.
- **Not built.** There is no PL local-flatness result and no boundary version.

### Fix
**Note for the Tau Ceti maintainer (Layer 2).** Replace the bullet "- **Smooth and PL embeddings are locally flat**, stated
against layer 1's structure groups, so the low-codimension subtleties are isolated in this one predicate." with:
> - **Smooth embeddings are locally flat.** This is built for boundaryless source and target
>   (`IsLocallyFlat.of_isSmoothEmbedding`). Extend it to proper embeddings of manifolds with boundary, with the half-space
>   pair `(ℝⁿ₊, ℝᵐ₊)` as the model at boundary points (Daverman–Venema, *Embeddings in Manifolds*, §1.3, p. 32, defines
>   local flatness for embedded ∂-manifolds). Slice discs `D² ↪ D⁴` and concordance annuli in `S³ × [0,1]` are of this
>   kind.
> - **PL embeddings away from codimension two.** If `Mᵐ` is a PL manifold tamely (for instance PL) embedded in a PL
>   manifold `Nⁿ` with `n − m ≠ 2`, then `M` is locally flat in `N` at every point (Daverman–Venema, Theorem 1.2.1, p. 29;
>   for `n − m ≥ 3` it cites Rourke–Sanderson, Corollary 7.2).
> - ⚠ **Not in codimension two.** For every `n ≥ 4` there are PL embeddings `Sⁿ⁻² → Sⁿ` that are not locally flat: the
>   suspension of a knot with non-abelian group (Daverman–Venema, Example 1.4.2, p. 36). Likewise, every knot `K ⊂ S³`
>   bounds the PL disc `cone(K) ⊂ D⁴` (Levine, arXiv:1405.1125v2, §1, p. 1). **Regression test:** the cone on the trefoil
>   is not locally flat. If it were, the trefoil would be topologically slice. The proof that slice knots are
>   algebraically slice uses only a normal bundle of the slice disc (Livingston, arXiv:math/0307077v4, §2, p. 5), and a
>   locally flat disc has one (§6, p. 13). So the trefoil would be algebraically slice, and a metabolic Seifert form has
>   signature `0` (§3, p. 7). The trefoil's signature is `−2`.
>   Never state "PL embeddings are locally flat" without the codimension hypothesis.

In the sketch, replace "-- theorem isLocallyFlat_of_smoothEmbedding … : IsLocallyFlat f" with:
```lean
-- theorem IsLocallyFlat.of_isSmoothEmbedding …                   -- built (boundaryless); add the proper, with-boundary case
-- theorem isLocallyFlat_of_plEmbedding (hf : IsPLEmbedding f) (hcod : dim M - dim N ≠ 2) : IsLocallyFlat f
-- example : ∃ d : PLEmbedding (closedBall 2) (closedBall 4), ¬ IsLocallyFlat d   -- the cone on the trefoil
```

### Not done, and why
- **The boundary case of smooth ⇒ locally flat is kept as a target.** Its proof source was not read, so it is an
  obligation.
- **The red team's item (c) is not adopted.** It proposed "locally flat at a vertex iff the link pair is unknotted". No
  source was read for it, and it describes PL rather than topological local flatness.
- **Zeeman's and Rourke–Sanderson's texts were not read** (not public). The codimension ≥ 3 statement is taken from
  Daverman–Venema's Theorem 1.2.1, which cites them.

## /68 (high, error): Geometrization in the form Morgan–Tian proved; the Poincaré conjecture becomes a derived target

### What the verifier corrected
All four parts are confirmed:
- A compact piece with torus boundary cannot carry a complete locally homogeneous metric modelled on a boundaryless `X`.
- The proved statement puts the structure on the interior and asks for finite volume.
- The cited `math/0607607` proves only the Poincaré conjecture.
- The Poincaré conjecture is not an instance of the statement.

### State on main (31403074)
- **Lines 704–706** define a geometric structure on `M` as "a complete locally homogeneous metric modeled on one of them".
- **Lines 713–715** give the geometrization bullet.
- **Lines 719 and 724–725** give `HasGeometricStructure` and `geometrization` over `J.pieces`.
- **Lines 732–734** say that Poincaré "falls out as an instance".
- **Lines 1078–1080** cite `math/0607607` for "Geometrization, `[Kir97, 3.45]`".
- **Mathlib `082e2d3`** pins `SimplyConnectedSpace.nonempty_homeomorph_sphere_three` and
  `SimplyConnectedSpace.nonempty_sdiffeomorph_sphere_three` as `proof_wanted`
  (`Wanted/Geometry/Manifold/PoincareConjecture.lean:32, :37`, outside the `Mathlib/` tree).

### Fix
**Note for the Tau Ceti maintainer (Layer 8).**

1. **First bullet.** Replace "a **geometric structure** on `M` as a complete locally homogeneous metric modeled on one of
   them (equivalently `M = X / Γ` for a discrete `Γ ≤ Isom X`)." with:
   > a **geometric structure** on a *boundaryless* 3-manifold `N`: a complete locally homogeneous Riemannian metric
   > modelled on one of them, equivalently `N = X / Γ` for a discrete subgroup `Γ ≤ Isom X` acting freely (Thurston,
   > Bull. AMS 6 (1982), §1, pp. 357–358; Morgan–Tian, arXiv:0809.4040v1, Introduction, p. 1). A compact manifold with
   > boundary is *geometric* when its interior is (Kirby, Problem 3.45, Remarks). A *finite-volume* structure also asks
   > that the metric have finite volume, and that clause is part of the proved theorem below.

2. **Geometrization bullet.** Replace "- **Geometrization** as the statement that each piece of the JSJ decomposition of a
   closed orientable prime 3-manifold admits a geometric structure (after also splitting along the prime/connected-sum
   decomposition, which is layer 1)." with:
   > - **Geometrization**, in the form proved (Morgan–Tian, arXiv:0809.4040v1, Introduction, p. 1): *any closed, orientable,
   >   prime 3-manifold `M` contains a disjoint union of embedded 2-tori and Klein bottles such that each connected
   >   component of the complement admits a locally homogeneous Riemannian metric of finite volume.* The cutting family
   >   includes Klein bottles, and the structures live on the open complementary pieces. Morgan–Tian's "prime" excludes
   >   `S³`. The JSJ decomposition (below) is a separate theorem. Morgan–Tian also note that the finite-volume
   >   conclusion excludes the Seifert pieces `T² × I` and the twisted `I`-bundle over the Klein bottle (§1, p. 9), which is
   >   why their form cuts along Klein bottles. Any JSJ-piece form of geometrization must treat those two pieces
   >   separately.

3. **Lean sketch.** Replace "-- def HasGeometricStructure (M) (G : ModelGeometry) : Prop := ∃ metric, LocallyHomogeneous
   metric G" with the first two lines below. Replace the two lines "-- theorem geometrization (M : ClosedOrientablePrime3) (J :
   JSJDecomposition M) :" and "--     ∀ p ∈ J.pieces, ∃ G : ModelGeometry, HasGeometricStructure p G" with the rest.
   ```lean
   -- def IsGeometric (N) [BoundarylessManifold N] (G : ModelGeometry) : Prop := ∃ Γ : DiscreteFreeSubgroup G.isom, Nonempty (N ≃ₘ G.X ⧸ Γ)
   -- def IsFiniteVolumeGeometric (N) (G : ModelGeometry) : Prop := IsGeometric N G ∧ FiniteVolume (inducedMetric …)
   -- theorem geometrization (M) [ClosedOrientable3 M] (hM : IsPrime M) :
   --     ∃ S : EmbeddedSurfaceFamily M, (∀ s ∈ S, IsTorus s ∨ IsKleinBottle s) ∧
   --       ∀ C ∈ components (M \ ⋃ S), ∃ G : ModelGeometry, IsFiniteVolumeGeometric C G     -- Morgan–Tian
   -- theorem poincare_three_of_geometrization : …  -- discharges Mathlib's proof_wanted, Wanted/…/PoincareConjecture.lean:32, :37
   ```

4. **Design notes.** Replace "The Poincaré conjecture is the special case "`S³` is the only simply-connected closed
   3-manifold" and falls out as an instance." with:
   > Geometrization subsumes the Poincaré conjecture (Thurston 1982, p. 358; Morgan–Tian, p. 1), but the conjecture is not
   > an instance of the statement above. Deriving it needs two further inputs:
   > - the prime decomposition (Kneser–Milnor; Hatcher, *Notes on Basic 3-Manifold Topology*, Theorem 1.5, p. 5);
   > - the fact that a closed geometric 3-manifold with trivial fundamental group is `S³`, through the spherical geometry.
   >
   > The target is to derive Mathlib's `SimplyConnectedSpace.nonempty_homeomorph_sphere_three` and
   > `SimplyConnectedSpace.nonempty_sdiffeomorph_sphere_three` (`Wanted/Geometry/Manifold/PoincareConjecture.lean:32, :37`)
   > from `geometrization`.

5. **Unlocks.** Replace "Geometrization, `[Kir97, Problem 3.45]` (Perelman)." with:
   > Geometrization, `[Kir97, Problem 3.45]` (Perelman; complete accounts in Morgan–Tian, arXiv:0809.4040, and
   > Bessières–Besson–Boileau–Maillot–Porti), and, derived from it, Mathlib's 3-dimensional Poincaré statements.

6. **References.** Replace "J. Morgan, G. Tian, *Ricci Flow and the Poincaré Conjecture*, Clay Math. Monographs 3 (2007),
   full text at [arXiv:math/0607607](https://arxiv.org/abs/math/0607607): Geometrization, `[Kir97, 3.45]`." with:
   > J. Morgan, G. Tian, *Ricci Flow and the Poincaré Conjecture*, Clay Math. Monographs 3 (2007),
   > [arXiv:math/0607607](https://arxiv.org/abs/math/0607607), which proves the Poincaré conjecture only. J. Morgan,
   > G. Tian, *Completion of the proof of the geometrization conjecture*,
   > [arXiv:0809.4040](https://arxiv.org/abs/0809.4040), with the statement in its Introduction. L. Bessières, G. Besson,
   > M. Boileau, S. Maillot, J. Porti, *Geometrisation of 3-manifolds*, EMS Tracts in Mathematics (2010),
   > doi:10.4171/082. These give geometrization, `[Kir97, 3.45]`. W. Thurston, *Three dimensional manifolds, Kleinian
   > groups and hyperbolic geometry*, Bull. AMS 6 (1982) 357–382, doi:10.1090/S0273-0979-1982-15003-0: Conjecture 1.1
   > and the eight geometries (§§1, 4).

**Cross-references.**
- The prime decomposition, irreducibility, Seifert-fibred spaces and atoroidality get their owner in /84; they
  are not planned here.
- /94 adds the Wanted Poincaré file to the inventory.

### Not done, and why
- **The spherical step of the Poincaré derivation is left as an obligation.** No source was read for it: Scott (1983) is not
  freely available, and Kirby's 3.45(I) states it only as part of the conjecture.
- **BBBMP was not read.** Only its existence was verified (Crossref).
- **The red team's JSJ-piece form is not adopted.** It proposed "M itself geometric when a JSJ piece is `T² × I` or the
  twisted `I`-bundle over the Klein bottle". No source read states that; Morgan–Tian avoid it by cutting along Klein
  bottles.
- **The Clay monograph version of 0809.4040 is not cited.** It could not be verified.

## /69 (high, error): the JSJ family is minimal, the manifold irreducible, and uniqueness is up to isotopy

### What the verifier corrected
Without minimality the family is not unique: a vertical torus over an essential curve of a Seifert piece's base gives a
second admissible family. Jaco–Shalen–Johannson canonicity is for the minimal family, and the standard hypothesis is
irreducibility, which "prime" does not give (`S² × S¹`).

### State on main (31403074)
- **Lines 708–712:** "A `JSJDecomposition M` bundles the family of disjoint incompressible embedded tori, … existence and
  canonicity (up to isotopy) are then *theorems* about this object".
- **Lines 720–723:** a structure with no minimality field, and `jsj_exists_unique (M : ClosedOrientablePrime3)`.

### Fix
**Note for the Tau Ceti maintainer (Layer 8).**

1. In the JSJ bullet, replace "existence and canonicity (up to isotopy) are then *theorems* about this object, not built
   into a `def JSJ`." with:
   > The family must be **minimal**: minimal with respect to inclusion among such families. Existence, and uniqueness of a
   > minimal family up to isotopy, are then *theorems* about this object, not built into a `def JSJ`. They hold for
   > compact, orientable, **irreducible** `M` (Hatcher, *Notes on Basic 3-Manifold Topology*, Theorem 1.9, p. 14): *there
   > is a collection of disjoint incompressible tori such that each component of the split manifold is either atoroidal or
   > a Seifert manifold, and a minimal such collection is unique up to isotopy.* The hypothesis is irreducibility, not
   > primality: the only orientable prime 3-manifold that is not irreducible is `S¹ × S²` (Hatcher, Proposition 1.4, p. 4).

2. Replace the sketch lines from "-- structure JSJDecomposition (M) where" to "-- theorem jsj_exists_unique (M :
   ClosedOrientablePrime3) : ∃ J : JSJDecomposition M, …  -- canonical up to isotopy" with:
   ```lean
   -- structure JSJFamily (M) where
   --   tori : Finset ι; emb : ι → EmbeddedTorus M; disjoint : …; incompressible : …
   --   pieces : Finset Piece; cut : M ≃ₜ glueUp pieces; seifertOrAtoroidal : ∀ p ∈ pieces, IsSeifertFibered p ∨ IsAtoroidal p
   -- def JSJFamily.IsMinimal (J : JSJFamily M) : Prop := ∀ J' : JSJFamily M, J'.toriSet ⊆ J.toriSet → J'.toriSet = J.toriSet
   -- theorem jsj_exists (M) [CompactOrientable3 M] (hM : Irreducible M) : ∃ J : JSJFamily M, J.IsMinimal
   -- theorem jsj_unique (hM : Irreducible M) {J J' : JSJFamily M} (hJ : J.IsMinimal) (hJ' : J'.IsMinimal) : IsotopicFamilies J J'
   ```
   The `geometrization` line that follows is replaced under /68.

3. **Unit test, showing that minimality is load-bearing.** Use Hatcher's example (§1.2, p. 13). Glue four solid tori
   cyclically along annuli that wind `qᵢ > 1` times, with the `qᵢ` distinct primes. The result `M` contains two tori `T₁`
   and `T₂`. Each of `{T₁}` and `{T₂}` satisfies the conditions, and their complements are not homeomorphic, so the two
   families are not isotopic. `M` is itself a Seifert manifold (Hatcher, p. 13), so the minimal family is empty.

**Definitions.** "Atoroidal" (Hatcher, p. 12), "incompressible" and "Seifert-fibred" get one owner in /84.

### Not done, and why
The red team's "equivalently, no torus parallel to another … fibrations that match" characterisation of minimality is not
adopted. Hatcher's uniqueness proof uses such arguments, but states no equivalence.

## /70 (high, error): Levine's theorem is stated in homology concordance, where Matsumoto's question lives

### What the verifier corrected
The target as written is trivially true. The Poincaré homology sphere has Rokhlin invariant one, so it is not homology
cobordant to `S³`, and no knot in it is concordant to a knot in `S³`. Kirby 1.31 (Matsumoto) is about knots in homology
3-spheres that bound PL acyclic 4-manifolds, modulo homology bordism of pairs. The layer plans none of the objects this
needs.

### State on main (31403074)
- **Line 612:** "-- theorem levine_homologySphere_not_S3 : -- a knot in a homology sphere not smoothly concordant to any
  in S³".
- **Lines 618–620:** "…needs the knot type generalized to ambient homology spheres, which is a small extension…".
- **Lines 623–624:** "(Levine, disproved smoothly)".
- **Lines 1051–1053:** the reference gloss.
- Nothing in either library covers homology 3-spheres or homology concordance.

### Fix
**Note for the Tau Ceti maintainer (Layer 6).**

1. **Add to "What to build":**
   > - **Knots in homology spheres, and homology concordance** (for `[Kir97, 1.31]`). This needs:
   >   - integral homology 3-spheres, smooth homology cobordisms between them, and homology 4-balls;
   >   - *homology concordance*: knots `K₀ ⊂ Y₀` and `K₁ ⊂ Y₁` are homology concordant if they cobound a smoothly embedded
   >     annulus in some homology cobordism `W` between `Y₀` and `Y₁`;
   >   - the group `Ĉ_ℤ` of homology concordance classes of knots in homology spheres that bound homology 4-balls;
   >   - the group `C_ℤ` of knots in `S³` modulo cobounding an annulus in a smooth manifold with the integral homology of
   >     `S³ × I`, and the natural map `C_ℤ → Ĉ_ℤ`;
   >   - the lemma that `K ⊂ Y` bounds a PL disc in some homology 4-ball iff `K` is homology concordant to a knot in `S³`.
   >
   >   All of this is in Levine, arXiv:1405.1125v2, §1 and Remark 1.5 (pp. 2, 4). The last lemma is stated there as a
   >   note, with the cone-point argument in the proof of Proposition 1.3.
   >
   >   **Levine's theorem** (Theorem 1.1, p. 1): *there are a smooth, compact, contractible 4-manifold `X` and a knot
   >   `J ⊂ ∂X` such that `J` bounds no PL disc in `X` or in any rational homology 4-ball `X'` with `∂X' = ∂X`; moreover
   >   `J` can be taken topologically slice in `X`.* Equivalently, `C_ℤ → Ĉ_ℤ` is not surjective (Remark 1.5), which
   >   answers Matsumoto's question.
   >
   >   **Regression test:** the Rokhlin invariant is defined on the homology cobordism group, with `μ(S³) = 0` and `μ = 1`
   >   for the Poincaré homology sphere (Manolescu, arXiv:1607.08163v3, §2, p. 6). So the Poincaré sphere is not homology
   >   cobordant to `S³`, and no knot in it is homology concordant to a knot in `S³`. Without the hypothesis that the
   >   ambient sphere bounds a homology 4-ball, the question is empty.

2. **Sketch.** Replace "-- theorem levine_homologySphere_not_S3 : -- a knot in a homology sphere not smoothly concordant to
   any in S³" with:
   ```lean
   -- theorem levine_not_surjective : ¬ Function.Surjective (homologyConcordanceMap : C_ℤ → Ĉ_ℤ)   -- Levine, Remark 1.5
   -- theorem levine_no_PL_disc : ∃ (X : ContractibleSmooth4 ) (J : KnotIn (∂ X)),
   --     ∀ X' : RationalHomologyBall4, ∂ X' = ∂ X → ¬ BoundsPLDisc J X'                           -- Levine, Theorem 1.1
   ```

3. **Design notes.** Replace "Concordance in homology spheres (`[Kir97, 1.31]`) needs the knot type generalized to ambient
   homology spheres, which is a small extension of layer 4's geometric presentation; note it as a dependency." with:
   > Concordance in homology spheres (`[Kir97, 1.31]`) is not a small extension. It needs homology 3-spheres, homology
   > cobordisms, homology 4-balls and homology concordance (the bullet above), and it is stated in the smooth category with
   > PL discs.

4. **Unlocks.** Replace "concordance of knots in homology spheres to knots in `S³`, `[Kir97, Problem 1.31]` (Levine,
   disproved smoothly)." with:
   > Matsumoto's question `[Kir97, Problem 1.31]`: is the natural map `C^{PL} → H_A` an isomorphism, where `H_A` consists
   > of the knots in homology 3-spheres that bound PL acyclic 4-manifolds, modulo homology bordism of pairs? No: `C_ℤ → Ĉ_ℤ`
   > is not surjective (Levine).

   The `[Kir97, 1.53]` clause before it is /92's.

5. **References.** Replace ", a knot in a homology sphere not smoothly concordant to any knot in `S³`, `[Kir97, 1.31]`."
   in the Levine item with:
   > , doi:10.1017/fms.2016.31, [arXiv:1405.1125](https://arxiv.org/abs/1405.1125): a knot in the boundary of a
   > contractible 4-manifold that bounds no PL disc in any rational homology 4-ball with that boundary (Theorem 1.1);
   > equivalently `C_ℤ → Ĉ_ℤ` is not surjective (Remark 1.5), `[Kir97, 1.31]`.

### Not done, and why
Nothing is left out. The Rokhlin homomorphism is imported as a statement from Manolescu's lectures; its owner is the
HeegaardFloer / AlgebraicTopology side and is not re-planned here.

## /71 (high, missing): smooth triangulation gets an owner stage (Layer 11), with the simplicial-to-CW bridge on the consumer side

### What the verifier corrected
Nothing is narrowed:
- "Smooth triangulation" occurs only in AlgebraicTopology Stage 8, which consumes it.
- GeometricTopology puts it in a far-horizon section that is not a stage, so there is no supplier.
- `TauCeti/Topology/Triangulable.lean:40` defines `IsTriangulable` through the realization of an abstract simplicial
  complex, and nothing bridges that realization to Mathlib's `RelCWComplex`.

### State on main (31403074)
- **GeometricTopology, lines 894–915:** the far-horizon section ("It sits here, after the layers, on purpose…"), with
  item 1: "**Smooth implies PL.** Every smooth manifold has an essentially unique PL structure (a smooth triangulation,
  Whitehead)."
- **Layer 9, lines 755–757:** splitting existence is "from a triangulation or a Morse function".
- **Layer 11, lines 845–848:** Moise is cited only for the dimension-3 existence.
- **AlgebraicTopology README:**
  - lines 51–56 say that geometric topology "owns smooth and PL triangulations";
  - Stage 8's header (lines 368–369) consumes "geometric topology's smooth-triangulation result";
  - item 7 (lines 397–398) proves finite CW type "by consuming smooth triangulation".
- **FuchsianOrbifolds README:** lines 78–82 apply `compactManifoldFiniteCWType`, and Layer 5, item 1, consumes
  AlgebraicTopology's finite CW model.
- **At `f790474`:**
  - `TauCeti.IsTriangulable` (`Topology/Triangulable.lean:40`) over `AbstractSimplicialComplex.Realization`
    (`AlgebraicTopology/SimplicialComplex/Realization.lean:67`), whose docstring gives it the weak topology;
  - Mathlib's `RelCWComplex` (`Topology/CWComplex/Classical/Basic.lean:99`);
  - no theorem joins the two, and neither library has a triangulation theorem for manifolds.

### Fix
**Note for the Tau Ceti maintainer (GeometricTopology).**

1. **Layer 11, "What to build".** After the "Triangulation of a space" bullet, add:
   > - **Smooth manifolds are triangulable (existence).** Every smooth manifold is triangulable. Indeed it has an
   >   essentially unique PL structure (Cairns 1935, Whitehead 1940; Manolescu, *Lectures on the triangulation
   >   conjecture*, arXiv:1607.08163v3, §2, Question 1, p. 3). State it first in the consumer's form: every compact smooth
   >   manifold is homeomorphic to the realization of a *finite* simplicial complex. Finiteness comes from compactness: a
   >   compact subspace of a CW complex lies in a finite subcomplex (Hatcher, *Algebraic Topology*, Proposition A.1,
   >   p. 520), applied to the CW structure of the realization (Hatcher, §2.1, p. 104). The compact-with-boundary case,
   >   which FuchsianOrbifolds needs for surfaces with discs removed, is a separate target with its own source.
   > - **Moise's theorem.** Every 3-manifold is triangulable, and every surface is too (Radó) (Manolescu, §2, Question 2,
   >   p. 3; E. Moise, Ann. of Math. 56 (1952) 96–114). Layer 9's existence of Heegaard splittings uses it.

2. **Far-horizon section, item 1.** Replace "**Smooth implies PL.** Every smooth manifold has an essentially unique PL
   structure (a smooth triangulation, Whitehead)." with:
   > **Smooth implies PL.** The *existence* of a smooth triangulation is Layer 11's target, since AlgebraicTopology
   > Stage 8 consumes it. What stays here is the *uniqueness* of the PL structure of a smooth manifold and the full
   > Whitehead comparison.

**Note for the Tau Ceti maintainer (AlgebraicTopology README).**

1. **Stage 4.** Add an item:
   > Prove that the realization of an abstract simplicial complex (Tau Ceti's `AbstractSimplicialComplex.Realization`,
   > with its weak topology) is a `RelCWComplex` relative to `∅`. Its open cells are the open simplices, with the simplex
   > maps as characteristic maps (Hatcher, §2.1, p. 104, through Proposition A.2, p. 521, after ordering the vertices of
   > each simplex as on p. 107). It is finite when the complex is.

2. **Stage 8, item 7.** Replace "by consuming smooth triangulation." with:
   > by consuming GeometricTopology Layer 11's triangulation theorem for compact smooth manifolds and Stage 4's
   > simplicial-to-CW bridge. Hatcher's Corollary A.12 (p. 529) does not suffice: it gives a CW complex of the same
   > homotopy type, but not a finite one, and Hatcher notes that a space dominated by a finite complex need not be
   > homotopy equivalent to one (p. 529). Until the supplier exists the item is blocked.

3. **Stage 8 header.** Replace "and geometric topology's smooth-triangulation result for the manifold corollaries" with
   "and GeometricTopology Layer 11's smooth-triangulation theorem for the manifold corollaries". The same phrase in the
   Ownership section (lines 55–56) can stay.

**Link (atlas).** Add GT Layer 11 → AlgebraicTopology `stage-8-relative-homotopy-hurewicz-and-whitehead` (acyclic).
- This is the "smooth-triangulation supplier → 8" edge of /29 and /91. Record it once.
- The edges AlgebraicTopology Stages 4, 7, 8 → FuchsianOrbifolds Layer 5 are in /29.
- GT Layer 11 → Layer 9 (acyclic) is /87's choice for Heegaard-splitting existence.

### Not done, and why
- **The with-boundary triangulation is kept as a target.** Whitehead 1940 and Munkres, *Elementary Differential Topology*
  (Theorem 10.6) were not read; they are not freely available.
- **Moise's GTM 47 was not read.** The statement is taken from Manolescu's lectures.
- **The red team's Morse-theory alternative for item 8.7 is not adopted.** Its source (Milnor, *Morse Theory*, Theorem 3.5)
  was not read.

## /72 (medium, error): `[Kir97, 1.41]` goes to Piccirillo's shake-genus paper, with `s`; the knot trace and shake genus are planned

### What the verifier corrected
Confirmed from Kirby's list: 1.41(A) is the Akbulut–Kirby 0-shake-genus problem. The resolution bounds the slice genus with
`s`, and `τ` vanishes on the Conway knot's whole 0-trace family, so `τ` cannot give the argument. No stage plans Khovanov
homology or `s`. The README attaches the Conway-knot paper to 1.41.

### State on main (31403074)
- **Lines 514–515:** "(Piccirillo, via the Conway knot, jointly with the combinatorial Heegaard Floer roadmap's `τ`)".
- **Lines 1029–1030:** "L. Piccirillo, *The Conway knot is not slice*, …, `[Kir97, 1.41]`".
- **Atlas.** "shake genus" occurs only in this unlock line, and no stage mentions knot traces.

### Fix
**Note for the Tau Ceti maintainer (Layer 4).** This also carries /59's Layer 4 edit.

1. **Unlocks.** Replace "`0`-shake genus vs slice genus, `[Kir97, Problem 1.41]` (Piccirillo, via the Conway knot, jointly
   with the combinatorial Heegaard Floer roadmap's `τ`);" with:
   > `0`-shake genus vs slice genus, `[Kir97, Problem 1.41(A)]`: there are infinitely many knots with
   > `g_sh⁰(K) < g_4(K)` (Piccirillo, *Shake genus and slice genus*, Theorem 1.1 and Corollary 1.2). The lower bound on
   > `g_4` is Rasmussen's `s` from Khovanov homology, which neither this roadmap nor the combinatorial Heegaard Floer
   > roadmap builds. `τ` cannot replace it: it is unknown whether `τ` is a `0`-trace invariant.

2. **"What to build".** After the "Slice-ness" bullet, add:
   > - **Knot traces and shake genus.** For a knot `K` and `n ∈ ℤ`, the *`n`-trace* `X_n(K)` is `B⁴` with a 2-handle
   >   attached along `K` with framing `n` (layer 1's handle attachment; framing measured against the Seifert framing of
   >   the convention table).
   >   - The *`n`-shake genus* `g_sh^n(K)` is the minimal genus of a smoothly embedded closed oriented surface representing
   >     a generator of `H₂(X_n(K))` (Kirby, Problem 1.41(A); Piccirillo, §1, p. 1).
   >   - Capping a slice surface with the core of the handle gives `g_sh^n(K) ≤ g_4(K)` (Piccirillo, p. 1).
   >   - Homology classes of embedded surfaces come from AlgebraicTopology Stage 6's fundamental class.
   >   - Target: `∃ K, g_sh⁰(K) < g_4(K)`.

3. **References.** Replace "- L. Piccirillo, *The Conway knot is not slice*, Ann. of Math. 191 (2020),
   [arXiv:1808.02923](https://arxiv.org/abs/1808.02923), `[Kir97, 1.41]`;" with:
   > - L. Piccirillo, *Shake genus and slice genus*, Geom. Topol. 23 (2019) 2665–2684, doi:10.2140/gt.2019.23.2665,
   >   [arXiv:1803.09834](https://arxiv.org/abs/1803.09834), `[Kir97, 1.41(A)]`. L. Piccirillo, *The Conway knot is not
   >   slice*, Ann. of Math. 191 (2020), doi:10.4007/annals.2020.191.2.5,
   >   [arXiv:1808.02923](https://arxiv.org/abs/1808.02923). Its lower bound is also Rasmussen's `s`, and `τ` vanishes on
   >   every knot sharing the Conway knot's `0`-trace (p. 3).

**Links (atlas).**
- Add GT Layer 1 → GT Layer 4, for the handle attachment the trace needs (acyclic). /91's internal list omits it.
- AlgebraicTopology Stage 6 → GT Layer 4 is already in /91's list (acyclic). Record it once.

The owner of `s` is proposed under /59.

### Not done, and why
No Khovanov owner is created here (see /59). The Conway-knot entry is kept, because Layer 6 cites it for 1.53 (/92).

## /73 (medium, error): the Kirby numbers are corrected against the list

### What the verifier corrected
All four parts are confirmed against the list: 3.34 is Smale's conjecture, 4.34 asks about `π₀ Diff(S⁴)` and
`Diff(S⁴) ≃ O(5)`, 1.16 is Property R, 3.2 is Waldhausen's virtual Haken question, 3.51 is virtual fibering, and 4.4 is the
Rokhlin-invariant-one question answered by Manolescu.

### State on main (31403074)
The mislabels are unchanged:
- lines 405–406 give 4.34 and 4.126;
- line 567 gives 1.82;
- line 686 gives 3.51 for both;
- line 891 says "no Kirby number";
- lines 1007–1009, 1044 and 1067 repeat them in the References.

I read the list myself (see Sources). The problems are: 3.34 (p. 121, update "True, as proved by Hatcher"), 4.34 (p. 199),
4.126(C) (p. 247), 1.16 (pp. 17–18, update: Gabai), 3.2 (p. 100), 3.51 (p. 142) and 4.4 (p. 183).

### Fix
**Note for the Tau Ceti maintainer.**

1. **Layer 3 Unlocks.** Replace "The Smale conjecture `Diff(S³) ≃ O(4)` (Hatcher), `[Kir97, Problem 4.34]`, and Watanabe's
   disproof of the 4-dimensional Smale conjecture, `[Kir97, Problem 4.126]`." with:
   > The Smale conjecture `Diff(S³) ≃ O(4)` (Hatcher), `[Kir97, Problem 3.34]`, and Watanabe's disproof of the
   > 4-dimensional Smale conjecture, `[Kir97, Problem 4.126(C)]`. The disproof also answers the second question of
   > `[Kir97, Problem 4.34]`, "is `Diff(S⁴) ≃ O(5)`?", negatively. It gives no information on `π₀`, the first question of
   > 4.34 (Watanabe, arXiv:1812.02448v3, Theorem 1.1 and Remark 1.2, p. 1).

2. **References.** In the Hatcher item, replace "`[Kir97, 4.34]`" with "`[Kir97, 3.34]`". In the Watanabe item, replace "the
   4-dimensional disproof, `[Kir97, 4.126]`" with "the 4-dimensional disproof, `[Kir97, 4.126(C)]`, and a negative answer
   to the second question of 4.34".

3. **Layer 5 Unlocks.** This replacement serves /73(b), /74, /76 and /77, and is given once. Replace "Property P
   `[Kir97, Problem 1.15]`, Property R `[Kir97, Problem 1.82]`, Akbulut–Kirby `0`-surgery concordance
   `[Kir97, Problem 1.19]`, and chirally cosmetic surgery `[Kir97, Problem 1.81]`." with:
   > Property P, `[Kir97, Problem 1.15]` (Kronheimer–Mrowka), and Property R, `[Kir97, Problem 1.16]` (Gabai).
   > Stated, but open: the Generalized Property R Conjecture, `[Kir97, Problem 1.82]`, and the cosmetic surgery
   > conjecture, `[Kir97, Problem 1.81(A)]`. The existence of inequivalent chirally cosmetic surgeries is a theorem here;
   > the failure of `[Kir97, Problem 1.81(B)]` is stated in layer 7. The Akbulut–Kirby conjecture,
   > `[Kir97, Problem 1.19]`, is stated and refuted in layer 6, which has concordance.

4. **References.** In the Gabai item, replace "for Property R, `[Kir97, 1.82]`" with "for Property R, `[Kir97, 1.16]`".

5. **Layer 7 Unlocks.** Replace "Virtual fibering and virtually Haken, `[Kir97, Problem 3.51]` (Agol);" with:
   > Virtually Haken, `[Kir97, Problem 3.2]` (Waldhausen's question), and virtual fibering, `[Kir97, Problem 3.51]`
   > (Thurston's question), both by Agol with Groves–Manning;

   In the Agol reference, replace "`[Kir97, 3.51]`" with "`[Kir97, 3.2, 3.51]`". The Agol–Groves–Manning abstract
   (arXiv:1204.2810) resolves "the virtual Haken question of Waldhausen and Thurston's virtual fibering question".

6. **Layer 11 Unlocks.** Replace "Manolescu's disproof of the triangulation conjecture (no Kirby number);" with:
   > Manolescu's disproof of the triangulation conjecture. It answers `[Kir97, Problem 4.4]` negatively: no homology
   > 3-sphere of Rokhlin invariant one has `H # H` bounding an acyclic 4-manifold. By Galewski–Stern and Matumoto this
   > gives non-triangulable manifolds in every dimension `≥ 5` (Manolescu, arXiv:1303.2354, abstract; lectures,
   > arXiv:1607.08163, Theorem 1.1 and §2);

   In the Manolescu reference, add "`[Kir97, 4.4]`" after "arXiv:1303.2354".

**Coordination.** /95 fixes the Smale sketch itself; only the numbers change here.

### Not done, and why
- **Whether `π₀ Diff(S⁴)` is still open is not claimed.** The list's 1995 update says "No progress", and no later source was
  read.
- **Hatcher's and Agol's own papers were not read.** The labels rest on Kirby's list and the abstracts.

## /74 (medium, other): 1.82 is stated as open; Gabai's theorem is 1.16

### What the verifier corrected
Confirmed from the list (p. 60). 1.82 asks for a characterisation of the framed links in `S³` that produce a connected
sum of copies of `S¹ × S²`, and conjectures handle slides from the 0-framed unlink. Its remarks credit Gabai with the
one-component case, Property R, which is 1.16.

### State on main (31403074)
Line 567 lists "Property R `[Kir97, Problem 1.82]`" among solved unlocks, and lines 1043–1044 repeat it.

### Fix
- **Unlocks and the Gabai reference.** Done under /73(3–4).
- **Note for the maintainer: add to Layer 5 "What to build".**
  > - **Handle slides and the Generalized Property R Conjecture (open).** Define handle slides of framed links in `S³`
  >   and the predicate "surgery on `L` gives `#ₙ(S¹ × S²)`". State `[Kir97, 1.82]` as a conjecture, not attached to a
  >   solver: a framed link surgers to `#ₙ(S¹ × S²)` iff it is obtained from the `0`-framed `n`-component unlink by handle
  >   slides (no stabilisation). Gompf–Scharlemann–Thompson give a family of links that are "probably counterexamples"
  >   (Geom. Topol. 14 (2010) 2305–2347, doi:10.2140/gt.2010.14.2305, arXiv:1103.1601). Stable handle-slide triviality of
  >   these links is still being tested (Diao–Pan–Yan, arXiv:2604.17737, 2026).
- **Add the two references to Layer 5's list.**

### Not done, and why
Neither paper was read beyond its abstract. They are cited only for the conjecture's status.

## /75 (medium, error): `[Kir97, 4.82]` moves to Layer 6's topological 4-manifold input, with the right gloss and a source

### What the verifier corrected
4.82 is Teichner's "does `⋆RP⁴ # ⋆CP²` have a smooth structure?", a question about the connected sum. `⋆RP⁴` has nonzero
Kirby–Siebenmann invariant and is not smoothable, so the README's gloss is wrong. No resolving reference is attached.

### State on main (31403074)
Lines 285–286 read "Smoothability of `⋆RP⁴ # ⋆CP²`, `[Kir97, Problem 4.82]` (connected sum plus a smooth structure on a
fake `RP⁴`)", and the References have no entry for 4.82.

### Fix
**Note for the Tau Ceti maintainer.**

1. **Layer 1 Unlocks.** Replace "Smoothability of `⋆RP⁴ # ⋆CP²`, `[Kir97, Problem 4.82]` (connected sum plus a smooth
   structure on a fake `RP⁴`), and, as infrastructure, every gluing and surgery below." with:
   > As infrastructure, every gluing and surgery below. (Smoothability of `⋆RP⁴ # ⋆CP²`, `[Kir97, Problem 4.82]`, is
   > stated in layer 6, which has the topological 4-manifold input.)

2. **Layer 6.** After "**The 4-manifold input to topological sliceness**", add:
   > - **`⋆CP² # ⋆RP⁴` is smoothable** (`[Kir97, Problem 4.82]`, Teichner; Ruberman–Stern, *A fake smooth CP² # RP⁴*,
   >   Math. Res. Lett. 4 (1997) 375–378, doi:10.4310/MRL.1997.v4.n3.a6, arXiv:dg-ga/9702003, Theorem 1.1).
   >   - `⋆M` denotes a topological 4-manifold homotopy equivalent to `M` with the opposite Kirby–Siebenmann invariant
   >     (Kirby 4.82, remarks, pp. 225–226).
   >   - `⋆CP²` is Freedman's: a 0-handle, a 2-handle on the trefoil with framing one, and a contractible topological
   >     4-manifold.
   >   - `⋆RP⁴` was constructed by Ruberman (Ruberman–Stern, §1), and by Hambleton–Kreck–Teichner from `RP⁴ # E₈`
   >     (Kirby 4.82).
   >   - Each has nonzero Kirby–Siebenmann invariant, so neither is smoothable. Their connected sum has zero invariant and
   >     is homotopy equivalent but not homeomorphic to `CP² # RP⁴` (Ruberman–Stern, §1).
   >
   >   Prerequisites: topological 4-manifolds and topological connected sum (layer 1's gluing in the Top category); the
   >   Kirby–Siebenmann invariant of a topological 4-manifold (the far-horizon section, item 3); and Freedman's
   >   construction of `⋆CP²`.

3. **Layer 6 Unlocks.** Append "; smoothability of `⋆CP² # ⋆RP⁴`, `[Kir97, Problem 4.82]` (Ruberman–Stern)". Add the
   Ruberman–Stern reference to Layer 6's list.

**Coordination.** /91 makes the same move in its edge list. The text is here; record it once.

### Not done, and why
Freedman's theorem that a homology 3-sphere bounds a contractible topological 4-manifold, which the construction of `⋆CP²`
uses, is a prerequisite without a source read here (Freedman 1982, Freedman–Quinn). It is kept as an obligation.

## /76 (medium, other): `[Kir97, 1.81]` is split into its parts, each with status and source

### What the verifier corrected
Kirby's 1.81 is Bleiler's cosmetic-surgery problem, with parts of different status. Calling it solved, without naming a
part or citing anything, is the defect.

### State on main (31403074)
- **Lines 568–569:** "chirally cosmetic surgery `[Kir97, Problem 1.81]`".
- **Lines 563–565:** the design note ("state it as a property of the slope pair").
- There is no reference for 1.81. I read 1.81 in the list (pp. 59–60), including the (A) and (B) conjectures and the
  remark on Mathieu's trefoil examples.

### Fix
**Note for the Tau Ceti maintainer.** Layer 5's Unlocks were rewritten under /73(3).

1. **Layer 5 design notes.** Replace "Cosmetic surgery compares two fillings of the *same* complement, so state it as a
   property of the slope pair, not of two abstract manifolds." with:
   > Cosmetic surgery compares two fillings of the *same* manifold `N` with torus boundary, so state it as a property of
   > the slope pair (Kirby 1.81; Bleiler–Hodgson–Weeks, §1; Futer–Purcell–Schleimer, Definition 1.1). For distinct slopes
   > `s, s'`:
   > - the pair is *purely cosmetic* if there is an orientation-preserving homeomorphism `N(s) ≅ N(s')`;
   > - it is *chirally cosmetic* if there is an orientation-reversing one;
   > - `s` and `s'` are *equivalent* if a homeomorphism of `N` takes one to the other.

2. **Layer 5 "What to build".** Add:
   > - **Cosmetic-surgery targets, each with its status.**
   >   - *Theorem:* inequivalent chirally cosmetic slopes exist. The `9` and `9/2` surgeries on the right-handed trefoil
   >     give oppositely oriented copies of the same Seifert fibred space. The slopes are inequivalent, since they lie at
   >     different distances from the meridian and every homeomorphism of the exterior fixes the meridian (Mathieu;
   >     Bleiler–Hodgson–Weeks, *Cosmetic surgery on knots*, Geom. Topol. Monogr. 2 (1999) 23–34,
   >     doi:10.2140/gtm.1999.2.23, §1, p. 3).
   >   - *Open:* the cosmetic surgery conjecture `[Kir97, 1.81(A)]`: `N` has no purely cosmetic pair when `∂N` is an
   >     *incompressible* torus. This is Futer–Purcell–Schleimer's Conjecture 1.2, after Gordon. Kirby's wording omits
   >     the hypothesis, and for the solid torus, the unknot's exterior, swapping the sides of a Heegaard splitting of
   >     certain lens spaces gives exotic purely cosmetic surgeries (Bleiler–Hodgson–Weeks, §1). It has been verified for
   >     all knots up to 19 crossings and for the one-cusped SnapPy census (Futer–Purcell–Schleimer, J. Comput. Geom. 16
   >     (2025) 694–736, arXiv:2403.10448, abstract).

3. **Layer 7 Unlocks.** Append:
   > ; the failure of `[Kir97, Problem 1.81(B)]` ("no cosmetic surgeries, pure or chiral, on hyperbolic manifolds which
   > yield hyperbolic manifolds"). Ichihara–Jong give a hyperbolic knot with exotic chirally cosmetic surgeries yielding
   > hyperbolic manifolds (*Cosmetic banding on knots and links*, with an appendix by Masai, Osaka J. Math. 55 (2018)
   > 731–745, arXiv:1602.01542). Dunfield's census manifold `o9_39009` has chirally cosmetic slopes `(−1, 3)` and
   > `(−3, 2)` (reported by Futer–Purcell–Schleimer, §1.2, p. 2, who call 1.81(B) "too strong to be true").

4. **References (Layer 5).** Add Bleiler–Hodgson–Weeks, Futer–Purcell–Schleimer and Ichihara–Jong. Add Y. Mathieu, *Closed
   3-manifolds unchanged by Dehn surgery*, J. Knot Theory Ramifications 1 (1992) 279–296, doi:10.1142/S0218216592000161,
   as cited by Bleiler–Hodgson–Weeks.

### Not done, and why
- **Mathieu's paper was not read.** Its example is taken from Bleiler–Hodgson–Weeks and from Kirby's remark.
- **Ichihara–Jong was read at its introduction only.** It calls the refuted statement "a conjecture raised by Bleiler,
  Hodgson and Weeks". Bleiler–Hodgson–Weeks's Concluding Remarks (p. 10) state it as "Cusped hyperbolic manifolds admit
  no cosmetic fillings, true or reflective, yielding hyperbolic manifolds", which is Kirby's 1.81(B). Ichihara–Jong's
  conjecture numbers do not match the arXiv text of Bleiler–Hodgson–Weeks.

## /77 (medium, missing): `[Kir97, 1.19]` moves to Layer 6, stated and refuted, with sources

### What the verifier corrected
Kirby's 1.19 is the Akbulut–Kirby conjecture. Layer 5 cannot state it, since concordance is built in Layer 6, and no
resolving reference is attached.

### State on main (31403074)
Lines 567–568 list "Akbulut–Kirby `0`-surgery concordance `[Kir97, Problem 1.19]`" under Layer 5, with no reference. The
list gives 1.19 on p. 20 (update: "Still open").

### Fix
**Note for the Tau Ceti maintainer.** The Layer 5 Unlocks were rewritten under /73(3).

1. **Layer 6 "What to build".** Add:
   > - **Equal `0`-surgeries do not imply concordance** (`[Kir97, Problem 1.19]`, the Akbulut–Kirby conjecture). There are
   >   knots `K, K'` with `S³₀(K) ≅ S³₀(K')` (layer 5's `0`-surgery) that are not smoothly concordant for any choice of
   >   orientations, and infinitely many such pairs (Yasui, *Corks, exotic 4-manifolds and knot concordance*, J.
   >   Differential Geom. 132 (2026), doi:10.4310/jdg/1770827024, arXiv:1505.02551v4, Theorem 1.9, p. 4). Some of these
   >   pairs are topologically concordant but not smoothly (Yasui, the corollary in §4), so the target is smooth. Miller
   >   and Piccirillo give non-concordant knots with diffeomorphic `0`-traces (*Knot traces and concordance*, J. Topol. 11
   >   (2018) 201–220, doi:10.1112/topo.12054, arXiv:1702.03974).
   >   ```lean
   >   -- theorem akbulut_kirby_false : ∃ K K' : SmoothLink (sphere 3), Nonempty (zeroSurgery K ≃ₘ zeroSurgery K') ∧
   >   --     ∀ o o', ¬ Concordant (K.withOrientation o) (K'.withOrientation o')
   >   ```

2. **Layer 6 Unlocks.** Append "; the Akbulut–Kirby `0`-surgery conjecture, `[Kir97, Problem 1.19]`, is false (Yasui)".
   Add the two references to Layer 6's list.

**Link (atlas).** Add GT Layer 5 → GT Layer 6 (acyclic; `0`-surgery). /91 moves the target but does not list
this edge.

### Not done, and why
Miller–Piccirillo was read at its abstract only.

## /78 (medium, missing): Layer 4 plans Seifert surfaces, the Seifert form and the knot-level invariants

### What the verifier corrected
"Seifert genus" occurs in no stage. Layer 6's inputs name "Layer 4's … Seifert surfaces", while Layer 4 plans only the
Alexander polynomial from a Seifert matrix and the Seifert framing. `Alexander.lean:312` defines `alexander` from a matrix,
which is the built half, not a surface.

### State on main (31403074)
- **Line 579:** "Layer 4's knots, slice-ness, and Seifert surfaces".
- **Lines 581–582:** "built here from layer 4's Seifert matrix".
- **Convention table, line 504:** "the Seifert (`0`-) framing is the canonical longitude".
- **Layer 4's "What to build" (lines 424–478)** has no Seifert-surface, linking-number or S-equivalence item.
- **Built at `f790474`, at matrix level only:**
  - `TauCeti.KnotTheory.alexander` (`KnotTheory/Alexander.lean:312`);
  - its invariance under the S-equivalence moves: `alexander_congruence_of_det_sq_eq_one` (`:351`),
    `alexander_enlargeColumn` (`:423`) and `alexander_enlargeRow` (`:433`);
  - `signature_enlargeColumn` (`Signature.lean:115`) and `signature_enlargeRow` (`:150`).
- **Not built.** Tau Ceti has no Seifert-surface or linking-number declaration.

### Fix
**Note for the Tau Ceti maintainer (Layer 4, "What to build").** Add:
> - **Seifert surfaces and the Seifert form.**
>   - The *linking number* of disjoint oriented closed curves in `S³`.
>   - A *Seifert surface* for an oriented knot `K`: an oriented surface `F ⊂ S³` with `∂F = K` (Livingston,
>     arXiv:math/0307077v4, §2, Definition, p. 4). Its existence comes from Seifert's algorithm on a diagram, and the
>     *genus* `g(K)` is the least genus of a Seifert surface.
>   - The *Seifert form* `V(x, y) = lk(x, i₊ y)` on `H₁(F)`, with `i₊` the positive push-off. `V − Vᵀ` is the
>     (unimodular) intersection form of `F` (Livingston, §2, pp. 4–5).
>   - The *Seifert framing*: the longitude with linking number `0`. The convention table's `0`-framing should point here
>     (Levine, arXiv:1405.1125v2, §1, p. 2, uses the Seifert framing to define satellites; the linking-number
>     characterisation is to be sourced with the linking number).
>   - **Knot-level invariants.** The theorem that any two Seifert matrices of isotopic knots are S-equivalent. With the
>     built matrix-level lemmas (`alexander_*`, `signature_enlarge*`), it makes `alexander` and the signature invariants
>     of the knot.
>   - Independently, and already enough for concordance: Seifert forms of concordant knots satisfy "`V₁ ⊕ −V₂` is
>     metabolic", so the algebraic concordance class, and every signature `σ_ω`, are concordance invariants (Livingston,
>     §2, the Theorem, Corollary and Levine's homomorphism `φ`, p. 5; §3, p. 7).

In Layer 6's "From Mathlib" line, "Layer 4's knots, slice-ness, and Seifert surfaces" then becomes true as written. /79
rewrites the rest of that sentence.

### Not done, and why
Four statements are kept as obligations, because their sources were not read: Seifert's algorithm (existence), the
S-equivalence theorem, the definition and symmetry of the linking number, and the characterisation of the Seifert framing
by linking number `0`. Lickorish, GTM 175, Chapters 6 and 8 (the
README's own spine) is not freely available, and Livingston's survey does not state them. Livingston does give the
Alexander polynomial up to `±tⁿ` for Seifert matrices of the same knot (§3, p. 7).

## /79 (medium, error): the GT–CHF exchange is made acyclic; Layer 6 owns the cobordism normal form; `τ` moves to a sub-layer 6b

### What the verifier corrected
The cycle is real at layer granularity. Layer 6 imports `τ` from G.10, which needs Layer 4's slice genus and Layer 6's
knot cobordisms, and the atlas carries declared roadmap edges in both directions. Neither side plans the normal-form
theorem. Layer 6's import of `s` is /59.

### State on main (31403074)
- **Layer 6, lines 575–582 and 600–602:** quoted under /59.
- **CHF G.10 (its README, lines 200–203):** "Slice genus: `|τ(K)| ≤ g_s(K)` via saddle/birth/death maps and normal forms
  of knot cobordisms (book Appendix B.5)".
- **Atlas.** The roadmap-level edges GeometricTopology → CombinatorialHeegaardFloer and the reverse are both "declared",
  with `stageCount` 0. There is no stage edge between the two roadmaps.
- **Built at `f790474`:** the Morse lemma `TauCeti.IsNondegenerateCriticalPoint.exists_morse_chart`
  (`Analysis/Calculus/Morse/NormalForm.lean:362`).

### Fix
**Note for the Tau Ceti maintainer (Layer 6).** This carries /59's Layer 6 edits.

1. **Introduction.** Replace "This layer owns the concordance group and the cobordism category, building on layer 4's knots
   and layer 1's gluing, and *consumes* the homological concordance invariants (`τ`, and ideally `s`) from the combinatorial
   Heegaard Floer roadmap." with:
   > This layer owns the concordance group, the cobordism category and the normal form of smooth knot cobordisms, building
   > on layer 4's knots and layer 1's gluing. It supplies the combinatorial Heegaard Floer roadmap's slice-genus bound
   > (G.10), so it does not import `τ` itself. `τ` as a concordance homomorphism is layer 6b, after G.10.

2. **"From Mathlib / earlier layers".** Replace the paragraph "**From Mathlib / earlier layers.** Layer 4's knots,
   slice-ness, and Seifert surfaces; layer 1's gluing and connected sum; the combinatorial Heegaard Floer roadmap's `τ` (a
   homomorphism on the concordance group). The classical signature invariant is built here from layer 4's Seifert
   matrix." with:
   > **From Mathlib / earlier layers.** Layer 4's knots, slice-ness, and Seifert surfaces (see its Seifert-surface
   > bullet); layer 1's gluing and connected sum; Tau Ceti's Morse lemma
   > (`IsNondegenerateCriticalPoint.exists_morse_chart`) for the normal form. The classical signature invariant is built
   > here from layer 4's Seifert form.

3. **After the cobordism-category bullet,** add:
   > - **Normal form of smooth knot cobordisms.**
   >   - A *link cobordism* from `L₁` to `L₂` is a properly embedded oriented surface `S ⊂ S³ × [0,1]` with
   >     `∂S ∩ (S³ × {0}) = −L₁ × {0}` and `∂S ∩ (S³ × {1}) = L₂ × {1}`.
   >   - After a small isotopy rel boundary, the projection to `[0,1]` restricted to `S` is Morse. Its critical points of
   >     index 0, 1 and 2 are births, saddles and deaths.
   >   - *Theorem:* a connected knot cobordism can be isotoped rel boundary, preserving the numbers of births, saddles and
   >     deaths, so that all births happen at time `1/4`, all saddles at `1/2` and all deaths at `3/4`, with product
   >     cobordisms near both ends (Sarkar, arXiv:1011.5265v3, §2 and Lemma 2.1, pp. 2–3; Math. Res. Lett. 18 (2011)
   >     1239–1257, doi:10.4310/MRL.2011.v18.n6.a13).
   >   - The grid-homology book's version (Appendix B.5) is the one CHF G.10 cites. This is G.10's topological input.

4. **Replace the invariants bullet** "- **Concordance invariants**: the Tristram–Levine signature function from layer 4's
   Seifert matrix (built here), and the import of `τ : C → ℤ` and `s` as consumers of the combinatorial Heegaard Floer
   roadmap." with:
   > - **Concordance invariants**: the Tristram–Levine signature function from layer 4's Seifert form (built here). `τ` is
   >   not imported into this layer (see layer 6b). `s` has no supplier: it needs Khovanov homology.

5. **After Layer 6's Unlocks, add a new section:**
   > ### Layer 6b: `τ` as a concordance homomorphism
   >
   > This consumes layer 6's smooth concordance group and three inputs from the combinatorial Heegaard Floer roadmap:
   > `τ` (G.6), its bound `|τ(K)| ≤ g_s(K)` for the *smooth* slice genus (G.10, which itself consumes layers 4 and 6),
   > and additivity under connected sum (the milestone that roadmap adds after G.10). It states that `τ` descends to a
   > homomorphism `C → ℤ`. It is kept apart from layer 6 so that the dependencies run layer 6 → G.10 → layer 6b, with no
   > cycle.

**Links (atlas).**
- Add GT Layer 4 → CHF `milestone-g-10` (smooth `g_s`) and GT Layer 6 → CHF `milestone-g-10` (normal form). Both are
  acyclic, and they are the same edges as /45's and /64's. Record them once.
- **No CHF → GT Layer 6 edge may be recorded.** Any edge from G.6, G.10 or /60's additivity milestone into Layer 6 closes
  the cycle Layer 6 → G.10 → Layer 6. Those edges wait for the upstream Layer 6b heading and the regenerated snapshot,
  then target the new Layer 6b stage.
- **For /60 and /64.** Their edge "τ-homomorphism milestone → GT layer 6" must target Layer 6b.
- **Roadmap level.** Once the stage edges exist, derive the roadmap-level relation from them (GeometricTopology →
  CombinatorialHeegaardFloer, and back only through Layer 6b), instead of keeping the two declared edges.

### Not done, and why
- **The grid-homology book and Kawauchi's text were not read**, so no locator from them is added. Sarkar's Lemma 2.1 is the
  source read.
- **The genericity step is imported from Sarkar's text.** The Morse lemma at the pin is local; "small isotopy makes the
  height Morse" is quoted from Sarkar.

## /80 (medium, error): concordance is an annulus from `K₀ × {0}` to `K₁ × {1}`, with no mirror

### What the verifier corrected
With "mirror" read as the Layer 4 convention (a reflection negating every crossing), the relation is not reflexive. The
product annulus gives `K` and `K`, and a trefoil is not concordant to its mirror (signatures `−2` and `2`). The standard
definition runs the annulus from `K × {0}` to `K' × {1}`, and the orientation reversal comes from the boundary orientation.

### State on main (31403074)
- **Line 608:** "-- def Concordant (K K' : SmoothLink (sphere 3)) : Prop := ∃ Σ : Annulus (sphere 3 ×ₘ I), boundary Σ =
  K ⊔ K'.mirror".
- **Line 503:** "mirror is reflection (negates every crossing)".
- **Signature.lean:** its docstring says "the mirror image, whose Seifert matrix is `-Vᵀ`, negates the signature", and
  `:161` gives the trefoil's `−2`. At the pin this is stated for a matrix, not proved as a lemma about the mirror.

### Fix
**Note for the Tau Ceti maintainer (Layer 6).**

1. **Sketch.** Replace the line 608 definition with:
   ```lean
   -- def Concordant (K₀ K₁ : SmoothLink (sphere 3)) : Prop :=
   --   ∃ A : ProperSmoothEmbedding (circle ×ₘ I) (sphere 3 ×ₘ I),
   --     A.restrict0 = K₀ × {0} ∧ A.restrict1 = K₁ × {1}          -- oriented boundary ∂A = −(K₀ × {0}) ⊔ K₁ × {1}
   ```
   Add the topological variant with a locally flat annulus (/67's with-boundary local flatness).

2. **Concordance bullet.** Before "Connected sum is the group operation", add:
   > Oriented knots `K₀, K₁` are concordant if a smoothly (resp. locally flatly) embedded annulus `A ⊂ S³ × [0,1]` has
   > oriented boundary `−K₀ × {0} ⊔ K₁ × {1}` (Levine, arXiv:1405.1125v2, §1, p. 1). Equivalently, `K₀ # −K₁` is slice,
   > where `−K` reverses the orientations of both `S³` and `K` (Livingston, arXiv:math/0307077v4, §2, Definition, p. 4).
   > No mirror appears in the definition: the orientation reversal comes from the boundary orientation of `S³ × [0,1]`.

   The sentence "the reverse mirror the inverse" stays, as the inverse in `C`.

3. **Acceptance examples.** Add:
   > Reflexivity: the product annulus `K × [0,1]` witnesses `Concordant K K`. The trefoil is not concordant to its mirror.
   > Their signatures are `−2` (`signature_trefoilSeifertMatrix`) and `2`, since the mirror's Seifert matrix is `−Vᵀ` (the
   > review's argument; at the pin only the docstring of `Signature.lean` records the mirror rule), and the signature is a
   > concordance invariant (Livingston, §3, p. 7).

### Not done, and why
The mirror-negates-signature step is at present a docstring claim in Tau Ceti, with no lemma. It becomes a theorem once
/78's Seifert-surface items exist.

## GeometricTopology (/81–/95): conventions

**Scope and conventions for /81–/95.**
- **The roadmap.** Every finding here is on `content/tau-ceti/GeometricTopology/README.md` (atlas ids
  `tauceti:TauCetiRoadmap/GeometricTopology#layer-N-…`). It is a Tau Ceti snapshot, so the README changes are notes
  for the Tau Ceti maintainer (PROTOCOL.md §15). The atlas-side items are exact edits for the atlas maintainer:
  link entries, the snapshot builder, one paper route brief and one packet proposal.
- **State on main.** The README is unchanged since the snapshot rebuild of 16 September (`3d890fef`), and the two
  commits after `31403074` do not touch it. Line numbers are as on `31403074`. Every quoted old text below was
  checked to occur exactly once in the README, ignoring line wrapping.
- **Changes in the atlas since 24 September.** The assembled atlas (`scripts/build.py` at `31403074`) now has two
  accepted `reviewed_link` edges into this roadmap, both from `data/links/tauceti_TauCetiRoadmap_RepresentationTheory_LieGroups.json`:
  - LieGroups Layer 5 → GT Layer 8, the `SL₂~` covering group;
  - LieGroups Layer 4 → GT Layer 10, the Frobenius theorem.

  The raw `data/atlas.json` and the extract still show no edge, and every stage is still `unknown`.
- **Libraries.** Every declaration cited was opened at Mathlib `082e2d3` and Tau Ceti `f790474`.
- **Coordination with /59–/80**, on the same README:
  - /73 owns the Kirby numbers in the Layer 3, 5, 7 and 11 Unlocks lines.
  - /68 and /69 own the Layer 8 geometrization and JSJ statements.
  - /66 owns the Layer 10 target.
  - /71 owns the smooth-triangulation stage.
  - /75 and /77 move the 4.82 and 1.19 targets.
  - /79 owns the CHF G-6/G-10 → Layer 6 τ edges.

  The edits below avoid those spans, or say how to merge with them.

## /81 (medium, missing): Layer 1 builds the closed ball and manifolds with corners, and fixes its boundary claim

### What the verifier corrected
Nothing. The verifier confirmed all four parts:
- the closed ball is never given a manifold-with-boundary structure, and neither library has one, yet four layers use it;
- handles and products of manifolds with boundary are manifolds with corners;
- Mathlib's product of two half-space models is not its quadrant model;
- no straightening-the-angle step is planned.

### State on main (31403074)
- **README, Layer 1.**
  - Lines 199–203 still end "generalise to other models (and corners, whose boundary is again a manifold-with-corners)
    only afterwards."
  - Line 211 reads "producing `M ∪_f N` with corners along `∂A`".
  - Line 241 is `connectedSum (e₁ : Embedding (closedBall n) M) …`.
- **Mathlib 082e2d3.**
  - `Mathlib/Geometry/Manifold/Instances/` holds only `Icc`, `Quotient`, `Real`, `Sphere` and `UnitsOfNormedAlgebra`.
  - The model for a closed ball is the interval: `instIccChartedSpace` and `instIsManifoldIcc` (`Instances/Real.lean:439, 504`), with `boundary_Icc : (𝓡∂ 1).boundary (Icc x y) = {⊥, ⊤}` (`:480`).
  - The quadrant model is `modelWithCornersEuclideanQuadrant` (`:208`).
  - `ModelWithCorners.prod` (`IsManifold/Basic.lean:496`) is a model on the product of the two model spaces, so two half-space models give a model on `EuclideanHalfSpace m × EuclideanHalfSpace n`, not on the quadrant.
  - `ModelWithCorners.boundary_prod` (`IsManifold/InteriorBoundary.lean:508`) gives `∂(M × N) = M × ∂N ∪ ∂M × N` as sets.
- **Tau Ceti f790474.** The boundary files assume `[ChartedSpace (EuclideanHalfSpace (n + 1)) M]` (`Boundary/Charts.lean:80`). There is no ball instance, and a search for `EuclideanQuadrant` finds nothing.
- **Consumers.**
  - `ArithmeticLocallySymmetricSpaces:ALS.2` still requires only ALS.1, and asks to "prove the manifold-with-corners structure at neat level, compactness of the quotient and the homotopy equivalence from the interior".
  - `ALS.5:finite-level-duality` works "On the actual finite-level manifolds with corners".

### Fix
**Note for the Tau Ceti maintainer: `GeometricTopology/README.md`, Layer 1, "What to build, gluing track".**

1. **"Boundary as a manifold".** Replace "generalise to other models (and corners, whose boundary is again a
   manifold-with-corners) only afterwards." with:
   > generalise to the quadrant model only afterwards. For a manifold with corners the subset `I.boundary M` is not in
   > general a manifold with corners (D. Joyce, *On manifolds with corners*, arXiv:0910.3518v2, Remark 2.11, p. 7).
   > Use either its faces or Joyce's abstract boundary `∂X`: a manifold with corners with a smooth immersion
   > `i_X : ∂X → X` whose fibre over `x` has `depth x` points, so it is not injective over corners (Definition 2.6,
   > p. 5; Theorem 3.4(iv), p. 11). It satisfies `∂(X × Y) ≅ (∂X × Y) ⊔ (X × ∂Y)` (Proposition 2.12, p. 8).
2. **Two new bullets** after the "Boundary as a manifold" bullet:
   > - **The closed ball `Dⁿ`.** Give `Metric.closedBall (0 : EuclideanSpace ℝ (Fin n)) 1` a smooth
   >   manifold-with-boundary structure on `𝓡∂ n`. Prove that its boundary is `Metric.sphere 0 1`, and that the
   >   boundary-manifold structure above agrees with Mathlib's sphere instance
   >   (`Mathlib/Geometry/Manifold/Instances/Sphere.lean`) up to diffeomorphism, with the standard orientation.
   >
   >   Neither library has this. Mathlib's `[x, y]` is the one-dimensional model (`instIsManifoldIcc`,
   >   `Instances/Real.lean:504`, with `boundary_Icc` at `:480`). `connectedSum`, the slice discs of layer 4, the
   >   solid tori of layer 5 and the handlebodies of layer 9 all use `Dⁿ`.
   > - **Manifolds with corners.**
   >   - The quadrant model `modelWithCornersEuclideanQuadrant n`, with faces.
   >   - Products of manifolds with boundary or corners as manifolds with corners: `Dᵏ × Dⁿ⁻ᵏ`, `S¹ × D²`,
   >     `Σ × [0,1]`. Mathlib's `ModelWithCorners.prod` of two half-space models lives on
   >     `EuclideanHalfSpace m × EuclideanHalfSpace n`, not on the quadrant, so the comparison chart is part of the
   >     work.
   >   - Two theorems the gluing track needs:
   >     - **corner straightening:** gluing along a proper face leaves a codimension-2 corner, and straightening it
   >       gives a manifold with boundary, unique up to diffeomorphism;
   >     - **collars of manifolds with corners**, with the corollary that for a compact manifold with corners the
   >       inclusion of the interior is a homotopy equivalence.
   >
   >     ⚠ Take both statements from a source before stating them.
   >   - The second theorem is what the Borel–Serre compactification of `ArithmeticLocallySymmetricSpaces` ALS.2
   >     consumes ("the homotopy equivalence from the interior"). ALS.5's finite-level duality works on the same
   >     manifolds with corners.
3. **"Gluing along a piece of the boundary".** After "producing `M ∪_f N` with corners along `∂A`." insert "(corner
   straightening, above, returns it to a manifold with boundary)."

**Atlas.** Two link entries, GT Layer 1 → `ArithmeticLocallySymmetricSpaces:ALS.2` and GT Layer 1 →
`ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality`, are in /91's table (rows 8 and 9).
- Cycle check on the assembled atlas at `31403074`: both acyclic.

### Not done, and why
- **No source for the corner theorems.** No public source was read for corner straightening, collars of corners or
  the interior homotopy equivalence, so they stay obligations: "⚠ Take both statements from a source" above.
- **Douady.** Joyce cites Douady's Séminaire Cartan exposé (numdam) for the boundary. It was fetched, but its text
  layer is too poor to locate a straightening statement.

## /82 (medium, missing): Layer 1 cites the ambient disc theorem and plans isotopy extension

### What the verifier corrected
Nothing. The verifier confirmed three points:
- isotopy extension occurs in no atlas stage;
- Hirsch 4.6.6 gives only an isotopy of the disc embeddings, not the ambient isotopy that transports the construction;
- `AmbientIsotopic` is the carrier but not the theorem. The review cites `Isotopy/Basic.lean:108`, which is
  `Isotopic`; `AmbientIsotopic` is at `AmbientIsotopic/Basic.lean:58`.

A consumer asks for "isotopy extension (GeometricTopology Layer 1)".

### State on main (31403074)
- **README lines 222–230.** They are unchanged: "proved from the disc theorem (any two orientation-compatible ball embeddings
  into a connected manifold are ambient isotopic; Palais …; Hirsch GTM 33, Chapter 4 §6, Theorem 6.6, extract)".
- **The consumer.** `MordellLawrenceVenkatesh` LV.5 lists "cutting, gluing, collars and isotopy extension (`GeometricTopology` Layer 1)"
  in `research/blueprint/roadmaps/MordellLawrenceVenkatesh.json`, and LV.9 asks for "cutting and gluing". That
  roadmap is a draft whose review is `needs_changes`, so it is not in the assembled atlas.
- **The atlas.** In the assembled atlas, "isotopy extension" matches no stage.
- **Tau Ceti f790474.** It has `TauCeti.Isotopic` (`Topology/Homotopy/Isotopy/Basic.lean:108`) and `TauCeti.AmbientIsotopic`
  (`Topology/Homotopy/AmbientIsotopic/Basic.lean:58`). No declaration mentions isotopy extension or homogeneity of
  manifolds.
- **Palais, read.** The README's first source already has the ambient form. Palais, *Extending diffeomorphisms*
  (Proc. AMS 11 (1960) 274–277) proves two results:
  - **Theorem B (p. 275).** For two differentiable `k`-cells `φ`, `ψ` in `M` (with the same orientation if `k = n`
    and `M` is orientable) there is a diffeomorphism `F` of `M` with `ψ = F ∘ φ`.
  - **Corollary 1 (p. 276).** `F` can be taken in `G₀`, the diffeomorphisms isotopic to the identity through
    diffeomorphisms each fixing the complement of a compact set.

  His footnote 1 says that "it is precisely Theorem B which is needed to show that the sum (to within diffeomorphism)
  is independent of the choice". Connectedness of `M` is implicit: the statement fails otherwise.

### Fix
**Note for the Tau Ceti maintainer: `GeometricTopology/README.md`, Layer 1.**

1. **The connected-sum bullet.** Replace "Independence of the balls is then a *theorem*, not part of the definition, proved from the disc theorem (any
   two orientation-compatible ball embeddings into a connected manifold are ambient isotopic; Palais, *Extending
   diffeomorphisms*, Proc. AMS 11 (1960) 274–277; Hirsch GTM 33, Chapter 4 §6, Theorem 6.6, extract)." with:
   > Independence of the balls is then a *theorem*, not part of the definition. Its input is the ambient disc
   > theorem: for two differentiable `k`-cells `φ`, `ψ` in a connected `n`-manifold `M` (with the same orientation
   > when `k = n` and `M` is orientable) there is a diffeomorphism `F` of `M` with `ψ = F ∘ φ`. Moreover `F` is
   > isotopic to the identity through compactly supported diffeomorphisms (Palais, *Extending diffeomorphisms*,
   > Proc. AMS 11 (1960) 274–277, Theorem B and Corollary 1, pp. 275–276; his footnote 1 says this is exactly what
   > connected-sum independence needs).
   >
   > The case `k = 0` is the homogeneity lemma: two points of a connected manifold are exchanged by such an `F`.
   > Hirsch GTM 33, Chapter 4 §6, Theorem 6.6 (extract) gives only an isotopy of the two disc embeddings rel the
   > centre, on a manifold without boundary. Deriving the ambient form from it needs isotopy extension, below.
2. **Two new bullets** after the connected-sum bullet:
   > - **Isotopy extension.** An isotopy of a compact submanifold, or of an embedding of a compact manifold,
   >   extends to a compactly supported diffeotopy of the ambient manifold. State it with
   >   `TauCeti.AmbientIsotopic` as the carrier. Its corollary: ambient-isotopic gluing data give diffeomorphic
   >   gluings. ⚠ Take the statement from a source before stating it. `MordellLawrenceVenkatesh` LV.5 consumes it.
   > - **Cutting along a hypersurface.** For a closed two-sided codimension-1 submanifold `S ⊂ M`, form `M‖S` by
   >   deleting an open tubular neighbourhood of `S` (Hatcher, *Notes on Basic 3-Manifold Topology*, §1.1, p. 3,
   >   "splitting along S"). Its boundary gains two copies of `S`, and regluing them recovers `M` up to
   >   diffeomorphism. The introduction's "cut a manifold open along a submanifold and reglue" is planned nowhere
   >   else, and LV.5 and LV.9 consume it.
3. **References.** Replace "the isotopy uniqueness of ball embeddings, used for connected-sum well-definedness." with:
   > Theorem B and Corollary 1 (pp. 275–276), the ambient disc theorem used for connected-sum well-definedness, whose
   > case `k = 0` is the homogeneity lemma; DOI 10.1090/S0002-9939-1960-0117741-0.

### Not done, and why
- **The isotopy-extension statement.** The red team's locator (Hirsch GTM 33, Chapter 8, Theorem 1.3) is a book that
  is not public, and no other public statement was found. The theorem is kept as an obligation, with no statement
  written for it.
- **No atlas edge.** LV is a draft outside the assembled atlas, and it already lists GT Layer 1 in its `requires`.

## /83 (medium, missing): Layer 2 plans Jordan–Brouwer separation and the generalized Schoenflies theorem

### What the verifier corrected
Nothing. Confirmed: the target's "inside" and "region between" are Jordan–Brouwer separation and the generalized
Schoenflies theorem, which neither library has.

### State on main (31403074)
- **README.** Lines 321–354 are unchanged, including the sketch `annulus_conjecture … (h : Σ₂ ⊆ inside Σ₁) : regionBetween Σ₁ Σ₂ ≃ₜ …`
  (339–340).
- **Mathlib 082e2d3.** It has no Jordan curve theorem and no Schoenflies theorem.
- **Tau Ceti f790474.**
  - `BrownBicollaring` (`Geometry/Manifold/LocallyFlat/Sphere.lean:69`) is a `Prop`: every locally flat
    `f : Sⁿ → Sⁿ⁺¹` `IsBicollared`. Its only consequence is a local two-sidedness lemma (`:93`).
  - In the plane it has separation tools but no Jordan curve theorem:
    - `TauCeti.janiszewski` (`Analysis/Complex/PlaneSeparation/Basic.lean:262`);
    - the winding-number crossing lemma (`Analysis/Contour/Winding/Separation.lean:53`);
    - `IsJordanCurve` (`Topology/JordanCurve/Basic.lean:108`).
  - Its own docstrings say so: `PlaneSeparation/Basic.lean:76`; `Conformal/Caratheodory.lean:235`, "the Schoenflies
    theorem, which this development does not have".
- **The atlas.** No stage mentions Jordan–Brouwer, Schoenflies or Alexander duality.

### Fix
**Note for the Tau Ceti maintainer: `GeometricTopology/README.md`, Layer 2.**

1. **A new bullet** before "- **The Annulus Conjecture**, stated from the right hypothesis:":
   > - **Separation and Schoenflies**, which the annulus statement's `inside` and `regionBetween` need.
   >   - *Jordan–Brouwer separation*: if `Σ ⊂ Sⁿ` is homeomorphic to `Sⁿ⁻¹`, then `Sⁿ ∖ Σ` has exactly two
   >     components and `Σ` is the frontier of each (Daverman–Venema, Exercise 0.3.2, p. 8).
   >     - The homology computation behind it is Hatcher, *Algebraic Topology*, Proposition 2B.1(b), p. 169. It
   >       consumes the singular homology of the AlgebraicTopology roadmap.
   >     - For `Σ ⊂ ℝⁿ`, `inside Σ` is the bounded component, through `Sⁿ = ℝⁿ ∪ {∞}`.
   >   - *Generalized Schoenflies*: if `h : Sⁿ⁻¹ × [−1, 1] → Sⁿ` is an embedding, the closure of each component
   >     of `Sⁿ ∖ h(Sⁿ⁻¹ × {0})` is an `n`-cell (M. Brown, Bull. AMS 66 (1960) 74–76, Theorem 5, p. 76;
   >     Daverman–Venema, Theorem 2.4.8, p. 62). With Brown's bicollaring theorem above it applies to every locally
   >     flat `(n−1)`-sphere in `Sⁿ` (Daverman–Venema, Corollary 2.4.13, p. 64).
   >   - In the plane, Tau Ceti already has two separation tools, but no Jordan curve theorem:
   >     - `TauCeti.janiszewski` (`TauCeti/Analysis/Complex/PlaneSeparation/Basic.lean:262`);
   >     - `TauCeti.Contour.notMem_connectedComponentIn_compl_of_isPreconnected_sdiff_singleton`
   >       (`TauCeti/Analysis/Contour/Winding/Separation.lean:53`).
2. **The Lean sketch.** Replace the two lines "-- theorem annulus_conjecture (Σ₁ Σ₂ : LocallyFlatSphere (n-1) (ℝ^n))
   (h : Σ₂ ⊆ inside Σ₁) : / --     regionBetween Σ₁ Σ₂ ≃ₜ (sphere (n-1) ×ₜ I)" with:
   ```lean
   -- theorem jordanBrouwer (Σ : Set (sphere n)) (h : Nonempty (Σ ≃ₜ sphere (n-1))) :
   --     two components of Σᶜ, each with frontier Σ                  -- Daverman–Venema, Ex. 0.3.2
   -- theorem generalizedSchoenflies (h : sphere (n-1) × Icc (-1) 1 → sphere n) (he : IsEmbedding h) :
   --     the closure of each component of (h '' (sphere (n-1) ×ˢ {0}))ᶜ ≃ₜ closedBall   -- Brown 1960, Thm 5
   -- def inside (Σ : LocallyFlatSphere (n-1) (ℝ^n)) : Set (ℝ^n) := the bounded component of Σᶜ
   -- def regionBetween Σ₁ Σ₂ : Set (ℝ^n) := closure (inside Σ₁) \ inside Σ₂
   -- theorem annulus_conjecture (Σ₁ Σ₂ : LocallyFlatSphere (n-1) (ℝ^n)) (h : Σ₂ ⊆ inside Σ₁) :
   --     regionBetween Σ₁ Σ₂ ≃ₜ (sphere (n-1) ×ₜ I)
   ```
3. **Unlocks.** After "two disjoint nested locally flat spheres cobound a product region." add:
   > Daverman–Venema state the theorem for a flat `n`-cell in the interior of an `n`-cell, `n > 4` (Theorem 7.5.3,
   > p. 374), and describe the region between two disjoint spheres in Exercise 2.4.5 and its footnote (p. 65).
   > Dimensions 2 and 3 need their own citation.
4. **References, Layer 2.** After the bullet "M. Brown, *Locally flat imbeddings of topological manifolds*, …", add:
   > M. Brown, *A proof of the generalized Schoenflies theorem*, Bull. Amer. Math. Soc. 66 (1960) 74–76,
   > DOI 10.1090/S0002-9904-1960-10400-4, Theorem 5 (p. 76).

### Not done, and why
- **Dimensions 2 and 3.** The red team credits them to Radó and Moise. No source was read for these attributions, so
  the note leaves them open ("need their own citation") rather than name them.
- **The Alexander-duality route.** Not used, since Hatcher's Proposition 2B.1 needs only homology.

## /84 (medium, missing): one owner for 3-manifold basics, a new Layer 7a

### What the verifier corrected
Nothing. The verifier confirmed all five parts:
- Layer 8 defers the prime decomposition to Layer 1, which does not plan it;
- Seifert-fibred spaces are used and never defined;
- incompressible surfaces are planned twice, with no shared definition;
- the Haken definition omits irreducibility;
- "atoroidal" has two inequivalent readings.

### State on main (31403074)
- **README.**
  - Line 664: "is *Haken* (contains an incompressible surface)".
  - Line 711: "the proof each piece is Seifert-fibered or atoroidal".
  - Lines 714–715: "(after also splitting along the prime/connected-sum decomposition, which is layer 1)".
  - Line 728: "State the prime decomposition (connected-sum, layer 1)".
- **Tau Ceti f790474.** No file mentions Seifert fibrations, Haken, incompressible, atoroidal or Kneser.
- **The atlas.** Only GT Layers 7 and 8 mention "incompressible", "Haken" or "JSJ".

### Fix
**Placement.** Layer 7 needs incompressible surfaces and Layer 8 needs Layer 7's hyperbolic structures, so the owner
must come before both. A sub-layer of Layer 8 would close the cycle Layer 7 → Layer 8 → Layer 7.

**Note for the Tau Ceti maintainer: `GeometricTopology/README.md`.**

1. **A new section** before "### Layer 7: Riemannian geometric structures and volume":
   > ### Layer 7a: 3-manifold basics (shared by layers 7–10)
   >
   > Layer 7a builds on layer 1.
   >
   > **What to build.** Following Hatcher, *Notes on Basic 3-Manifold Topology* (§1.1–1.2; manifolds compact,
   > connected and orientable, p. 1):
   > - **Spheres.** Embedded 2-spheres; `M` is **prime** if `M = P # Q` forces `P` or `Q` to be `S³`, and
   >   **irreducible** if every embedded `S²` bounds a ball (p. 4). The only orientable prime 3-manifold that is not
   >   irreducible is `S¹ × S²` (Proposition 1.4, p. 4).
   > - **The Kneser–Milnor prime decomposition.** A compact connected orientable `M` is `P₁ # ⋯ # Pₙ` with each
   >   `Pᵢ` prime, uniquely up to inserting or deleting `S³` summands (Theorem 1.5, p. 5). This uses layer 1's
   >   connected sum and its independence theorem.
   > - **Surfaces.** Properly embedded surfaces, two-sidedness, compressing discs and ∂-parallel surfaces:
   >   - **incompressible**: a two-sided surface with no `S²` or `D²` components, every compressing disc of which
   >     has its boundary bounding a disc in the surface (p. 10);
   >   - **∂-incompressible** (p. 14).
   > - **Atoroidal**, in two separate predicates, never identified:
   >   - geometric: an irreducible `M` is atoroidal if every incompressible torus is ∂-parallel (Hatcher, p. 12);
   >   - algebraic: each `ℤ ⊕ ℤ` in `π₁(N)` is conjugate into `π₁(∂N)` ([Kir97, 3.45], Remarks, p. 131).
   >
   >   Use the geometric one by default.
   > - **Haken**: compact, orientable, irreducible and containing an incompressible surface (M. Yazdi,
   >   arXiv:1603.03822v4, §1, p. 2).
   > - **Seifert fibrings and Seifert manifolds** (Hatcher, pp. 13–14).
   >   - The model fibrings of `S¹ × D²` with a `2πp/q` twist, and the multiplicity of a fibre.
   >   - Regular and exceptional fibres.
   >   - The base surface `B = M/fibres`, over which the projection is a bundle off the exceptional fibres.
   >
   > Layers 7, 8, 9 and 10 import these predicates and do not redefine them.
2. **Layer 7, "Fibering and Haken-ness".** Replace "is *Haken* (contains an incompressible surface)" with:
   > is *Haken* (layer 7a: compact, orientable, irreducible and containing an incompressible surface)
3. **Layer 8, geometrization bullet.** Replace "(after also splitting along the prime/connected-sum decomposition,
   which is layer 1)" with:
   > (after also splitting along the Kneser–Milnor prime decomposition of layer 7a)

   If /68's rewrite of this bullet lands first, carry the parenthetical over.
4. **Layer 8, design notes.** Replace "State the prime decomposition (connected-sum, layer 1)" with:
   > State the prime decomposition (connected sum, layer 7a)
5. **Layer 8, JSJ bullet.** After "the proof each piece is Seifert-fibered or atoroidal" insert:
   > (layer 7a's predicates, atoroidal in the geometric sense)

   Keep this across /69's minimality rewrite.

**Atlas.** The new heading becomes a stage `…#layer-7a-3-manifold-basics-shared-by-layers-710` (key `Layer 7a`). Its
edges are in /91's builder list.

### Not done, and why
- **Comparing the two atoroidal notions.** No source was read for a comparison theorem, so the note keeps the
  predicates apart and identifies neither with the other.
- **Seifert invariants and the JSJ statement.** Classifying Seifert invariants (Hatcher §2.1, not read) is left to the
  layer. The JSJ statement is /69's.

## /85 (medium, missing): Layer 7 builds the model ℍⁿ and pins the curvature −1 normalisation

### What the verifier corrected
Nothing. The verifier confirmed the normalisations:
- Mathlib's `UpperHalfPlane` distance is the curvature −1 metric;
- Tau Ceti's `hyperbolicDist` is `artanh` of the pseudo-hyperbolic distance, for the curvature −4 metric
  `|dz|/(1−|z|²)`, exactly half the curvature −1 distance;
- the layer plans no `ℍⁿ` and no isometry group.

### State on main (31403074)
- **README.** Lines 655–658: "(a complete metric of constant curvature `−1`, on the model `ℍⁿ`)". No item constructs
  `ℍⁿ`.
- **Mathlib 082e2d3.**
  - `UpperHalfPlane.dist_eq` (`Analysis/Complex/UpperHalfPlane/Metric.lean:42`) and `cosh_dist` (`:67`):
    `cosh d = 1 + |z − w|²/(2 Im z Im w)`.
  - The volume `UpperHalfPlane.volume_def` (`Measure.lean:49`) has density `1/(Im z)²` ("dx dy / y ^ 2", `:44`).
- **Tau Ceti f790474.**
  - `TauCeti.hyperbolicDist z w = artanh (pseudoHyperbolicExpr z w)` (`Analysis/Complex/Conformal/Hyperbolic/Distance.lean:68`),
    normalised to `|dz|/(1 − |z|²)`.
  - `pseudoHyperbolicExpr z w = ‖(z − w)/(1 − w̄ z)‖` (`Conformal/PseudoHyperbolic.lean:48`).
  - Neither library has a Cayley map.
- **The consumer.** `FuchsianOrbifolds` Layer 2, item 1, still reads "Compare it with hyperbolic Riemannian volume", and the
  atlas has no edge.
- **Isometries, elsewhere.** RT-AREA-diffgeom /15 (on main) already notes that GT Layer 7 should use Hopf–Rinow Layer 4's smooth
  Riemannian isometries. That edits lines 640–641 and 645, not the lines below.

### Fix
**Note for the Tau Ceti maintainer: `GeometricTopology/README.md`, Layer 7.**

1. **A new bullet** before "- **Hyperbolic structures**, with the volume problem handled":
   > - **The model `ℍⁿ`.**
   >   - Construct the upper half-space `{x ∈ ℝⁿ : xₙ > 0}` with metric `(dx₁² + ⋯ + dxₙ²)/xₙ²` (Cannon–Floyd–
   >     Kenyon–Parry, *Hyperbolic Geometry*, MSRI Publ. 31 (1997), §7, p. 71, model `H`) as a Riemannian
   >     manifold. Prove it has constant sectional curvature `−1` (Thurston, *The Geometry and Topology of
   >     Three-Manifolds*, §2.5, for the hyperboloid, which CFKP §7 shows is isometric to `H`).
   >   - Its isometry group is the group of Lorentz matrices preserving the upper sheet of the hyperboloid, which is
   >     `O⁺(n,1)` (CFKP Theorems 10.1–10.2, p. 82: linear, Riemannian and distance-preserving isometries of `L`
   >     coincide). Isometries are the smooth Riemannian isometries of the Hopf–Rinow roadmap, Layer 4.
   >   - For `n = 2`, three unit tests pin the normalisation:
   >     - the Riemannian distance of `ℍ²` is Mathlib's `UpperHalfPlane` distance (`cosh_dist`,
   >       `Mathlib/Analysis/Complex/UpperHalfPlane/Metric.lean:67`);
   >     - the Riemannian volume of `ℍ²` is Mathlib's `UpperHalfPlane.volume`, density `1/(Im z)²`
   >       (`…/UpperHalfPlane/Measure.lean:44–49`);
   >     - under the Cayley map `z ↦ (z − i)/(z + i)` it is `2 · TauCeti.hyperbolicDist`, since Tau Ceti's disc
   >       distance is normalised to the curvature `−4` metric `|dz|/(1 − |z|²)`
   >       (`TauCeti/Analysis/Complex/Conformal/Hyperbolic/Distance.lean:68`), while CFKP's disc model `I` is
   >       `4(dx₁² + ⋯ + dxₙ²)/(1 − |x|²)²`.
   >   - FuchsianOrbifolds Layer 2 consumes the volume comparison.
2. **"Hyperbolic structures".** Replace "(a complete metric of constant curvature `−1`, on the model `ℍⁿ`)" with:
   > (a complete metric of constant sectional curvature `−1`, locally isometric to the model `ℍⁿ` above)

**Atlas.** A link entry, GT Layer 7 → FuchsianOrbifolds Layer 2, is /91 row 12.
- Cycle check on the assembled atlas at `31403074`: acyclic.

### Not done, and why
- **`n = 3`.** The Möbius description for `n = 3` is not added. The hyperboloid form covers every `n`, and no source for
  the Möbius form was read.

## /86 (medium, missing): a Weeks-manifold node, the uniqueness half, and the right locator

### What the verifier corrected
Nothing. The verifier confirmed three points:
- the target's own signature needs a proof that the Weeks manifold is hyperbolic, and no layer plans the construction;
- uniqueness is omitted;
- the survey is not where the theorem is proved.

### State on main (31403074)
- **README.**
  - Line 673: `hypVolume (M) [Closed M] (h : Nonempty (HyperbolicMetric M))`.
  - Line 674: `weeks_minimal_volume … : hypVolume weeksManifold ≤ hypVolume M`.
  - Lines 680–683: "pick one".
  - Lines 1067–1071: the closed case is cited to arXiv:0910.5043.
- **Sources read.**
  - Gabai–Meyerhoff–Milley, arXiv:0705.4325v1, Corollary 1.3 (p. 1): "The Weeks manifold is the unique closed
    orientable hyperbolic 3-manifold of smallest volume." It rests on Milley's analysis [MM] of the fillings, as
    p. 1 says. The paper is J. Amer. Math. Soc. 22 (2009) 1157–1215, DOI 10.1090/S0894-0347-09-00639-0 (Crossref).
  - The survey (arXiv:0910.5043v1, p. 2) is "an expository paper". Its Theorem 1.1 says the Matveev–Fomenko–Weeks
    manifold is the unique smallest-volume closed hyperbolic 3-manifold, "In particular v1 = 0.9427 . . .". It
    describes the manifold as "the (5, 1), (5, 2) Dehn filling on the complement of the Whitehead link".
  - Kirby 3.60(A) (p. 147) gives the same filling of the right-handed Whitehead link. The decoded PostScript reads
    "0.9247…" for the volume, which does not match the survey's `0.9427…`; use the survey's value.

### Fix
**Note for the Tau Ceti maintainer: `GeometricTopology/README.md`, Layer 7.**

1. **The Lean sketch.** Replace the line "-- theorem weeks_minimal_volume (M) (h : ClosedOrientableHyperbolic3 M) :
   hypVolume weeksManifold ≤ hypVolume M" with:
   ```lean
   -- def weeksManifold : Manifold …   -- the (5,1), (5,2) filling of the right-handed Whitehead link complement (layer 5)
   -- theorem weeksManifold_closed_orientable : Closed weeksManifold ∧ Orientable weeksManifold
   -- theorem weeksManifold_hyperbolic : Nonempty (HyperbolicMetric weeksManifold)   -- needs a construction, see below
   -- theorem weeks_minimal_volume (M) (h : ClosedOrientableHyperbolic3 M) :
   --     hypVolume weeksManifold weeksManifold_hyperbolic ≤ hypVolume M h.hyp ∧
   --     (hypVolume M h.hyp = hypVolume weeksManifold weeksManifold_hyperbolic → Nonempty (M ≃ₘ weeksManifold))
   ```
2. **Design notes.** Replace "The Weeks manifold needs a concrete construction (as a surgery on the Whitehead link,
   layer 5, or by face-pairings of a polytope); pick one and make "this is the Weeks manifold" a definition, not a
   black box." with:
   > The Weeks manifold is a node of this layer.
   > - **Definition:** the (5, 1), (5, 2) Dehn filling of the Whitehead link complement (layer 5; Gabai–Meyerhoff–
   >   Milley, arXiv:0910.5043, p. 2; [Kir97, 3.60], Remarks, for the right-handed link), with layer 5's slope
   >   convention.
   > - **Theorems:** it is closed and orientable, and it carries a hyperbolic metric. That metric is the `Nonempty`
   >   argument `hypVolume` takes. Choose one route and record it:
   >   - an explicit discrete `Γ ≤ PSL(2, ℂ)` with `ℍ³/Γ ≅` Weeks;
   >   - a face-pairing, which needs a three-dimensional Poincaré polyhedron theorem that no layer plans.
   > - **Numerical unit test:** its volume is `0.9427…` (arXiv:0910.5043, Theorem 1.1, p. 2).
   >
   > The target includes uniqueness: equality of volumes forces `M ≃ₘ` Weeks.
3. **References.** Replace "D. Gabai, R. Meyerhoff, P. Milley, *Minimum volume cusped hyperbolic three-manifolds*,
   J. Amer. Math. Soc. 22 (2009), [arXiv:0705.4325](https://arxiv.org/abs/0705.4325), with the closed case (the Weeks
   manifold) in *Mom technology and hyperbolic 3-manifolds*, [arXiv:0910.5043](https://arxiv.org/abs/0910.5043),
   `[Kir97, 3.60]`." with:
   > D. Gabai, R. Meyerhoff, P. Milley, *Minimum volume cusped hyperbolic three-manifolds*, J. Amer. Math. Soc. 22
   > (2009) 1157–1215, [arXiv:0705.4325](https://arxiv.org/abs/0705.4325), Corollary 1.3: the Weeks manifold is
   > the unique closed orientable hyperbolic 3-manifold of smallest volume, `[Kir97, 3.60]`. The first paper of the
   > series is *Mom technology and volumes of hyperbolic 3-manifolds*, Comment. Math. Helv. 86 (2011) 145–188,
   > [arXiv:math/0606072](https://arxiv.org/abs/math/0606072). The expository *Mom technology and hyperbolic
   > 3-manifolds*, Contemp. Math. 510 (2010) 81–107, [arXiv:0910.5043](https://arxiv.org/abs/0910.5043), is
   > background (the construction and `v₁ = 0.9427…`).

**Atlas.** The Weeks filling adds the internal edge Layer 5 → Layer 7 (/91).

### Not done, and why
- **The hyperbolicity route.** It is left to the maintainer. No source for either route was read.
- **Milley.** Milley's [MM] is cited only through GMM's own account.

## /87 (medium, missing): Layer 9 takes its inputs from real owners

### What the verifier corrected
Nothing. The verifier confirmed three points:
- no GeometricTopology layer plans the classification of surfaces;
- Layer 3 plans diffeomorphism groups, not mapping classes;
- existence of a splitting has no supplier.

### State on main (31403074)
- **README.**
  - Lines 745–748: "(a handlebody is a boundary-sum of solid tori, built from layer 1's gluing)" and "the surface
    (closed orientable 2-manifold) classification for the splitting surface".
  - Line 753: "consume layer 3's surface mapping classes".
  - Lines 755–757: "from a triangulation or a Morse function".
- **Neither library** has the classification of surfaces or mapping class groups.
- **Two proposals already point at one owner.**
  - `PAPER-LANDESMAN-LITT-24` (accepted 23 September) routes the mapping-class-group material, including Dehn twists
    (item 128), to a new roadmap `MappingClassGroupsAndCanonicalRepresentations`. Its design job is pending. Item
    128's note, "the tauceti GeometricTopology roadmap treats diffeomorphism groups, not surface mapping classes", is
    accurate and stays.
  - The draft `MordellLawrenceVenkatesh` packet (review `needs_changes`) records a gap for the classification of
    surfaces. Its `restructure[0]` proposes a roadmap "MappingClassGroups" owning Farb–Margalit Chapters 1–6 and the
    classification of compact surfaces.
- **Morse functions.** HeegaardFloer Lane M plans Morse *homology*. It does not plan existence of Morse functions or
  handle decompositions, so it cannot supply a splitting.
- **Scharlemann** (arXiv:math/0007144v1) gives:
  - §1 (p. 2): a genus-`g` handlebody is `B³` with `g` 1-handles `D² × I` attached;
  - §2.1 (p. 3): a triangulation gives a splitting, through regular neighbourhoods of the 1-skeleton and of the dual
    1-skeleton;
  - §5 (pp. 19–20): a genus-`g` splitting gives a presentation of `π₁(M)` with `g` generators.

### Fix
**Note for the Tau Ceti maintainer: `GeometricTopology/README.md`, Layer 9.**

1. **"From Mathlib / earlier layers".** Replace "Layer 1's handlebodies (a handlebody is a boundary-sum of solid tori,
   built from layer 1's gluing) and boundary-gluing; `FundamentalGroup` (`Mathlib/AlgebraicTopology/FundamentalGroupoid/`)
   and `Group.rank` for the rank side; the surface (closed orientable 2-manifold) classification for the splitting
   surface." with:
   > Layer 1's handle attachment and boundary gluing: a genus-`g` handlebody is `B³` with `g` 1-handles `D² × I`
   > attached (Scharlemann §1, p. 2).
   > - `FundamentalGroup` (`Mathlib/AlgebraicTopology/FundamentalGroupoid/`) and `Group.rank` for the rank side.
   > - The classification of closed orientable surfaces and the mapping class group `Mod(Σ_g)`, from the
   >   mapping-class-group roadmap of the atlas; this roadmap does not plan them.
   > - Existence of a splitting from the triangulation theorem that layer 11 owns (Moise; for smooth `M`, the
   >   smooth-triangulation theorem).
2. **Handlebodies bullet.** Replace "(consume layer 3's surface mapping classes; Scharlemann, *Heegaard splittings of
   compact 3-manifolds*, is the survey)" with:
   > (its mapping class lies in `Mod(Σ_g)` of the mapping-class-group roadmap; layer 3 plans `Diff(M)` and its
   > topology, not mapping classes; Scharlemann, *Heegaard splittings of compact 3-manifolds*, is the survey)
3. **Genus bullet.** Replace "(every closed 3-manifold has a splitting, from a triangulation or a Morse function)"
   with:
   > (every closed 3-manifold has a splitting: triangulate it, then take regular neighbourhoods of the 1-skeleton
   > and of the dual 1-skeleton, Scharlemann §2.1, p. 3; smoothing these PL handlebodies is part of the proof when
   > splittings are stated up to `≃ₘ`)
4. **Layer 1, a new bullet** after the connected-sum bullet:
   > **Boundary connected sum** `M ♮ N` of manifolds with boundary, gluing along discs in the boundaries, with the
   > same explicit choices as `connectedSum`. A handlebody is also `♮ᵍ (S¹ × D²)`; prove that this agrees with the
   > 1-handle description.

**Atlas.**
1. **`research/blueprint/papers/PAPER-LANDESMAN-LITT-24.result.json`, `routes[0].brief`** (`route: new`, roadmap
   `MappingClassGroupsAndCanonicalRepresentations`). This brief is the design job's instructions (PROTOCOL §16).
   - Old: "Cover, in layers: the surface Σ_{g,n}, its fundamental group and standard presentation,"
   - New:
     > Cover, in layers: the surface Σ_{g,n} and the classification of compact surfaces with boundary and
     > punctures, its fundamental group and standard presentation,
   - Append at the end of the brief:
     > This roadmap is the atlas's single owner of the classification of compact surfaces and of the mapping class
     > group Mod(Σ_g) with its action on homology. MordellLawrenceVenkatesh LV.5 and the Heegaard splittings of the
     > Tau Ceti roadmap Geometric topology (tauceti:TauCetiRoadmap/GeometricTopology, Layer 9) import them.
     > Surfaces are built on the manifolds with boundary, collars and gluing of GeometricTopology Layer 1.
     > State the classification from a source proof, including triangulability. Record the link from the
     > classification stage to GeometricTopology Layer 9.
2. **`research/blueprint/packets/MordellLawrenceVenkatesh.json`, `restructure[0].proposal`.**
   - Old: "Create a roadmap MappingClassGroups (group topology) owning"
   - New:
     > Give this material to the proposed roadmap MappingClassGroupsAndCanonicalRepresentations (route 1 of
     > PAPER-LANDESMAN-LITT-24, design job DESIGN-MappingClassGroupsAndCanonicalRepresentations), which then owns
3. **The existence edge.** Layer 11 (or /71's triangulation stage) → Layer 9 is in /91's builder list, and /71
   records it too.

### Not done, and why
- **No link from the mapping-class-group roadmap yet.** That roadmap does not exist, so no stage exists to link. Its
  design job records the link.
- **No HeegaardFloer Lane M edge.** Lane M plans no Morse functions or handle decompositions.
- **Moise's theorem.** /71 adds it as a Layer 11 target.

## /88 (medium, missing): Layer 10's cohomology, Euler class and Frobenius inputs

### What the verifier corrected
Nothing. The verifier confirmed three points:
- Mathlib has singular homology but no singular cohomology, and no stage plans de Rham cohomology;
- the Euler class needs a Thom class or obstruction theory, which nothing plans;
- a Lie bracket is not a distribution.

### State on main (31403074)
- **README.**
  - Lines 787–789: "singular and the implied de Rham / `H²` cohomology for the Euler class; vector bundles and their
    (to-be-built) Euler class".
  - Line 798: "(a small standalone layer on top of Mathlib's bundle theory)".
  - Line 793: "equivalently a maximal atlas of flat charts".
- **Mathlib 082e2d3.**
  - `AlgebraicTopology/SingularHomology/` has Basic, HomologyZero and HomotopyInvariance only.
  - `VectorField.mlieBracket` (`Geometry/Manifold/VectorField/LieBracket.lean:73`).
  - No subbundle or distribution notion under `Geometry/Manifold`.
- **Neither library** has an orientation of vector bundles, an Euler class or a Thom class. Tau Ceti's only
  `moduleEulerClass` is a K-theoretic class in `Algebra/Category/ModuleCat/CartanMap.lean`.
- **New since 24 September.** The accepted link LieGroups Layer 4 → GT Layer 10 supplies "the general constant-rank
  smooth Frobenius prerequisite named in LieGroups Layer 4 … built for arbitrary finite-dimensional smooth manifolds".
- **The suppliers.** AlgebraicTopology Stage 6 plans singular cochains, cup and cap products and fundamental classes;
  Stage 7 plans the Euler characteristic.

### Fix
**Note for the Tau Ceti maintainer: `GeometricTopology/README.md`, Layer 10.**

1. **"From Mathlib / earlier layers".** Replace "singular and the implied de Rham / `H²` cohomology for the Euler class;
   vector bundles and their (to-be-built) Euler class; layer 1's manifolds." with:
   > the Lie bracket `VectorField.mlieBracket` (`Mathlib/Geometry/Manifold/VectorField/LieBracket.lean:73`) and
   > Mathlib's smooth vector bundles. From other roadmaps:
   > - AlgebraicTopology Stage 6: singular cochains, cup and cap products, the Kronecker pairing and fundamental
   >   classes. Mathlib has singular homology only.
   > - AlgebraicTopology Stage 7: the Euler characteristic.
   > - RepresentationTheory/LieGroups Layer 4: the Frobenius theorem, involutive ⇒ integrable with flat charts,
   >   stated for arbitrary finite-dimensional smooth manifolds.
   >
   > Also layer 1's manifolds, and layer 7a's irreducible and atoroidal 3-manifolds. No de Rham cohomology is used.
2. **Foliation bullet.** Replace "(a distribution closed under Lie bracket), equivalently a maximal atlas of flat
   charts" with:
   > (a smooth subbundle of `TM` closed under `VectorField.mlieBracket`; smooth subbundles are built here, since
   > Mathlib has none), equivalently, by the Frobenius theorem of LieGroups Layer 4, a maximal atlas of flat charts
3. **Euler-class bullet.** Replace "(a small standalone layer on top of Mathlib's bundle theory)" with:
   > (built here, on AlgebraicTopology Stage 6)
   > - An orientation of a real rank-2 vector bundle, which Mathlib does not define.
   > - The Thom class of the disc bundle and the Thom isomorphism.
   > - `e(E)` as the restriction of the Thom class to the zero section (Hatcher, *Vector Bundles and K-Theory*,
   >   version 2.2, §3.2, pp. 88 and 91).
   > - Unit test: `e(TS²)` is twice a generator of `H²(S²; ℤ)` (ibid., Proposition 3.14, p. 92).

   *Maintainer note, no edge:* the same class is what HeegaardFloer F4's spinᶜ structures (Turaev's vector-field
   model) need for `c₁`.

**Atlas.** Link entries, each acyclic on the assembled atlas at `31403074`:
- AlgebraicTopology Stage 6 → GT Layer 10 (/91 row 2);
- AlgebraicTopology Stage 7 → GT Layer 10 (row 3).

LieGroups Layer 4 → GT Layer 10 is already recorded.

### Not done, and why
- **The Frobenius node.** It is not added to Layer 10: the accepted LieGroups link already makes Layer 4 its owner, and
  a second copy would duplicate it.

## /89 (medium, error): Zeeman's conjecture is about the polyhedron, not one triangulation

### What the verifier corrected
Nothing. Confirmed: collapsibility belongs to a cell structure, and non-collapsible triangulated 3-balls exist. So
requiring the staircase triangulation to collapse is strictly stronger than Zeeman's conjecture.

### State on main (31403074)
- **README.** Line 881: `zeeman_conjecture (K) (h : Contractible2Complex K) : Collapsible (K ×ₛ I)`. Lines 869–871:
  "the product `K × I` is collapsible".
- **Tau Ceti f790474.** `TauCeti.ZeemanConjecture` (`AlgebraicTopology/SimplicialComplex/Zeeman.lean:124`) quantifies
  over every `ι` with `[LinearOrder ι]` and `K` with `K.Contractible2Complex` (`:62`: finite, dimension ≤ 2,
  `ContractibleSpace (Realization K)`). It asks that
  `Collapsible K.orderedCylinder.toPreAbstractSimplicialComplex`, where:
  - `orderedCylinder` (`Product.lean:347`) is the ordered product with the 1-simplex;
  - `Collapsible` (`Collapse/Basic.lean:160`) means `∃ v, CollapsesTo K (point v)`.
- **Tau Ceti also has the subdivision tools.**
  - `stellarSubdivision` (`Subdivision/Stellar/Basic.lean:106`).
  - `StellarEquivalent`, the equivalence relation generated by stellar moves (`Subdivision/Stellar/Equivalence.lean:100`).
  - `StellarEquivalentUpToRelabeling` (`:201`).

  Its docstring cites Lickorish, and says the Newman–Alexander theorem (stellar equivalence = PL homeomorphism) is
  not proved.
- **Sources read.**
  - Dynnikov, arXiv:2608.23331v1, Conjecture 1.1 (p. 1): "Let K be a contractible compact two-dimensional
    polyhedron. Then K×[0; 1] is collapsible". Definition 2.2 (p. 3): "A polyhedron without a fixed cell structure
    is called collapsible if it admits a collapsible cell structure."
  - Benedetti–Lutz, arXiv:1303.2070v2 (Electron. J. Combin. 20(3) (2013) P31):
    - Main Theorem 3 (p. 4): the 3-ball `B₁₅,₆₆` "is not collapsible";
    - Main Theorem 1 (p. 3): the 3-ball `B₁₂,₃₈` is collapsible.
  - Lickorish, *Simplicial moves on complexes and manifolds*, Geom. Topol. Monogr. 2 (1999) 299–320
    (arXiv:math/9911256), Theorem 4.5 (p. 311): "Two n-dimensional simplicial complexes are piecewise linearly
    homeomorphic if and only if they are stellar equivalent". Here stellar moves are taken together with simplicial
    isomorphisms.

### Fix
**Note for the Tau Ceti maintainer: `GeometricTopology/README.md`, Layer 11.**

1. **Collapse bullet.** Replace "**Zeeman's conjecture**: for a contractible `2`-complex `K`, the product `K × I` is
   collapsible." with:
   > **Zeeman's conjecture**: for a finite contractible `2`-complex `K`, the polyhedron `|K| × [0,1]` is
   > collapsible, i.e. admits a collapsible triangulation ([Kir97, 5.2(A)]; Dynnikov, arXiv:2608.23331, Conjecture
   > 1.1 and Definition 2.2).
   > - **Collapsibility depends on the triangulation.** Benedetti–Lutz's 3-ball `B₁₅,₆₆` is not collapsible, while
   >   their 3-ball `B₁₂,₃₈` is (arXiv:1303.2070, Main Theorems 3 and 1). Record the pair as the regression test.
   > - **In simplicial terms**, quantify over the complexes stellar equivalent to `K.orderedCylinder` up to
   >   relabelling. Two simplicial complexes are PL homeomorphic iff stellar equivalent (Lickorish, *Simplicial moves
   >   on complexes and manifolds*, Theorem 4.5).
   > - **The staircase variant.** Requiring the one staircase triangulation `orderedCylinder` to collapse is a
   >   strictly stronger statement. Keep it as a separately named variant.
2. **The Lean sketch.** Replace the line "-- theorem zeeman_conjecture (K) (h : Contractible2Complex K) : Collapsible
   (K ×ₛ I)   -- [Kir97, 5.2]" with:
   ```lean
   -- theorem zeeman_conjecture (K : AbstractSimplicialComplex ι) (h : Contractible2Complex K) :
   --     ∃ L : PreAbstractSimplicialComplex ((ι × Fin 2) ⊕ ℕ),
   --       StellarEquivalent (K.orderedCylinder.map Sum.inl) L ∧ Collapsible L   -- [Kir97, 5.2]
   -- theorem zeeman_conjecture_orderedCylinder (K) (h : Contractible2Complex K) :
   --     Collapsible K.orderedCylinder        -- stronger: one fixed (staircase) triangulation
   ```

**Tau Ceti library.** `TauCeti.ZeemanConjecture` (`Zeeman.lean:124`) is the staircase variant. Rename it (for example
`ZeemanConjecture.orderedCylinder`) and add the stellar-equivalence form under the name `ZeemanConjecture`.

### Not done, and why
- **Cell structures.** Dynnikov's definition allows cell structures. Whether a collapsible cell structure always gives
  a collapsible triangulation was not established from a source, so the simplicial form above is stated as the Tau
  Ceti encoding, and that comparison stays an obligation.
- **Dynnikov's new results.** His equivalence of Zeeman's conjecture with the stable Andrews–Curtis conjecture
  (Theorems 1.4–1.5) is not added: nothing in the atlas needs it.

## /90 (medium, library-claim): record GeometricTopology's built parts through AUDIT-45

### What the verifier corrected
Nothing. The verifier confirmed four points:
- every stage is `unknown`;
- no accepted audit covers the roadmap;
- the per-layer verdicts are the record the audit needs;
- there is no `sorry` in the cited trees.

### State on main (31403074)
- **The extract.** Every stage is `"status": "unknown"`.
- **`data/library-coverage.json`.**
  - It has no GeometricTopology layer.
  - Its header says it is "Generated by scripts/merge_library_audit.py; do not edit by hand".
  - It records `AUDIT-01` to `AUDIT-31` as reviewed and `AUDIT-32` to `AUDIT-42` as pending review. `AUDIT-45` is in
    neither.
- **`research/blueprint/queue.json`.** `AUDIT-45` and `REV-AUDIT-45`, which cover GeometricTopology, HeegaardFloer and
  UniversalCovers, are `pending`. `research/blueprint/audit/AUDIT-45.json` lists the eleven GT layers.
- **`STATUS.md`.** Generated upstream to `8745177` (1 September). It says "Layers 6 to 10: untouched".
- **The cited declarations.** All 36 file:line citations of the finding resolve at `f790474` to the named declaration.
  The trees `Geometry/Manifold`, `Geometry/Diffeomorphism`, `KnotTheory`, `LowDimTopology`, `Topology/Homotopy`,
  `Topology/PL` and `AlgebraicTopology/SimplicialComplex` contain no `sorry`. The scope-setting statements were read:
  - `IsCollar` (`Boundary/Collar/Global.lean:40`) is data: an open embedding of `N × Ico 0 1` with zero slice `f`.
    The collar theorem itself is still a target.
  - `BrownBicollaring` (`LocallyFlat/Sphere.lean:69`) and `ZeemanConjecture` are `Prop`s.
  - `IsLocallyFlat.of_isSmoothEmbedding` (`LocallyFlat/Smooth.lean:213`) assumes `[I.Boundaryless] [J.Boundaryless]`.
  - `BraidGroup n := ArtinGroup (CoxeterMatrix.A (n - 1))`, a `PresentedGroup` (`Braid.lean:97`, `Artin.lean:121`).
  - `Signature.lean`'s docstring says the Murasugi signature is built and the Tristram–Levine family is not.
  - `Diff` (`Diffeomorphism/Group.lean:178`) carries no topology.
  - There is no declaration for a connected sum, handles, tubular neighbourhoods (docstring mentions only), a Dehn
    filling, slice predicates, a Jones polynomial, or `HyperbolicMetric`, `sectionalCurvature`, `ModelGeometry`,
    `JSJ`, `HeegaardSplitting` or `Foliation`.

### Fix
**Atlas: no hand edit to `data/library-coverage.json`.** It is generated. The verdicts go into `AUDIT-45`'s result, and
the coverage overlay follows once `REV-AUDIT-45` accepts it. The raw stage `status` is not rewritten; RT-AREA-diffgeom
/6 does the same. Leads for the AUDIT-45 worker, in `research/blueprint/audit/AUDIT-45.result.json` under
`roadmaps["tauceti:TauCetiRoadmap/GeometricTopology"].layers[<stage id>]`, in AUDIT-17's `verdict` / `targets` /
`declarations` format:

| Layer | verdict | built at `f790474` (`TauCeti/…`) | not built |
|---|---|---|---|
| 1 | partly built | `isManifold_boundary` (`Geometry/Manifold/Boundary/Charts.lean:342`); `IsProductCollarChart` (`Boundary/Collar/Local.lean:224`); `diffeomorphProd` (`Collar/Diffeomorph.lean:184`); `IsCollar` data (`Collar/Global.lean:40`); `PLGroupoid`, `PLGroupoid_le_continuousGroupoid` (`PLGroupoid.lean:106, 117`); `IsPLOn` (`Topology/PL/Map.lean`) | collar theorem, gluing, handles, tubular neighbourhoods, connected sum, `Dⁿ`, corners |
| 2 | partly built | `IsLocallyFlat` (`LocallyFlat/Basic.lean:288`); `IsLocallyFlat.of_isSmoothEmbedding`, boundaryless (`Smooth.lean:213`); `isLocallyFlat_iff_isEmbedding_and_isLocallyBicollared` (`Bicollar.lean:352`); `BrownBicollaring` as a `Prop` (`Sphere.lean:69`) | Brown's theorem, separation, Schoenflies, annulus |
| 3 | partly built | `Diff` (`Geometry/Diffeomorphism/Group.lean:178`), relative subgroups, diffeotopies; `orthogonalToDiffSphere` (`Diffeomorphism/Sphere.lean:168`) | the `C^∞` topology, the smooth-families map |
| 4 | partly built | `BraidGroup` (`GroupTheory/SpecificGroups/Braid.lean:97`); `burau` (`KnotTheory/Burau/Basic.lean:440`); `jones` (`KnotTheory/TemperleyLieb.lean:107`); `MarkovEquiv` (`Markov.lean:203`); `alexander`, `alexander_trefoilSeifertMatrix` (`Alexander.lean:312, 472`); `SmoothCircleEmbedding` (`SmoothCircle.lean:108`); `SmoothLinkEmbedding` (`SmoothLink/Basic.lean:61`); `BasedOrientedGaussCode`, `FramedBasedOrientedGaussCode` (`GaussCode/Basic.lean:48, 64`); `PDCode` (`PDCode/Basic.lean:98`); `Isotopic`, `AmbientIsotopic` (`Topology/Homotopy/Isotopy/Basic.lean:108`, `AmbientIsotopic/Basic.lean:58`) | planar diagrams, Reidemeister and Markov theorems, Jones polynomial, slice predicates |
| 5 | partly built | `Slope`, `slopeEquiv` (`LowDimTopology/DehnSurgery/Slope.lean:122, 410`) | complements, fillings, unknot identities |
| 6 | partly built | Murasugi signature with S-equivalence invariance, `signature_trefoilSeifertMatrix` (`KnotTheory/Signature.lean:161`) | Tristram–Levine family, concordance, cobordisms |
| 7–10 | not built | — | everything |
| 11 | partly built | `Realization` (`AlgebraicTopology/SimplicialComplex/Realization.lean:67`); `realizationStandardSuccSimplexBoundaryHomeomorphSphere` (`Simplex/BoundarySphere.lean:330`); `IsCombinatorialManifold` (`CombinatorialManifold.lean:191`); `IsTriangulable` (`Topology/Triangulable.lean:40`); `Collapsible` (`Collapse/Basic.lean:160`); `orderedCylinder` (`Product.lean:347`); stellar and barycentric subdivision; `Contractible2Complex`, `ZeemanConjecture` as statements (`Zeeman.lean:62, 124`) | reconciliation with `PLGroupoid`, Manolescu, Zeeman |

The layer 4 grid-diagram files belong to CombinatorialHeegaardFloer Lane G, not to this roadmap.

**Note for the Tau Ceti maintainer.**
1. **`STATUS.md`.** Regenerate it at or after `f790474`. Layer 6 is partly built: the Murasugi signature of a Seifert
   matrix, with S-equivalence invariance and the trefoil value. A global collar structure exists, though the collar
   theorem is unproved.
2. **README, Layer 4, "From Mathlib / earlier layers".** Replace "`PresentedMonoid` (`Mathlib/Algebra/PresentedMonoid/Basic.lean`,
   from Hannah Fechtner's braid program) for braid groups" with:
   > Tau Ceti's braid group `BraidGroup n := ArtinGroup (CoxeterMatrix.A (n - 1))`, a `PresentedGroup`
   > (`TauCeti/GroupTheory/SpecificGroups/Braid.lean:97`)
3. **README, line 431.** Replace "(over `PresentedMonoid` braid groups with the Artin relations)" with:
   > (over that braid group)

### Not done, and why
- **No audit and no status.** AUDIT-45 itself was not run, and no status was written, since that is the audit's job.
  The table gives it leads, not verdicts.

## /91 (medium, missing): GeometricTopology's stage edges

### What the verifier corrected
Nothing. Confirmed: every layer has empty `requires` and `consumers` while the prose states an order, and the misplaced
unlocks follow from the other findings.

### State on main (31403074)
- **The extract.** It still has `"stageEdges": []`, all 11 stages have `"requires": []`, and the only roadmap
  prerequisite is `tauceti:TauCetiRoadmap/CombinatorialHeegaardFloer`.
- **`data/atlas.json`.** No `stageEdges` entry touches the roadmap.
- **The assembled atlas.** It now has the two accepted LieGroups links into GT Layers 8 and 10 (see the scope note).
- **How edges are recorded.** Internal Tau Ceti edges are declared in the snapshot builder,
  `scripts/snapshot/build_data.py`: `stage_dep(owner, producer_key, consumer_key, needle)` (lines 425–433) records
  an edge with its needle as evidence; the needle must occur in the README, or the edge is recorded without
  evidence. Cross-roadmap edges come from reviewed link packets, and `LINK-tauceti_TauCetiRoadmap_GeometricTopology`
  is `pending`.
- **The README's order.** Several layers name their suppliers in prose, for example line 523 ("a direct application of
  layer 1's gluing to layer 4's knots") and line 576 ("building on layer 4's knots and layer 1's gluing"). But phrases
  such as "layer 1's manifolds" recur in five layers, so they cannot serve as needles.

### Fix
**1. Note for the Tau Ceti maintainer: `GeometricTopology/README.md`.** Give each layer one unambiguous dependency
sentence, placed at the start of its "From Mathlib / earlier layers" paragraph (Layer 1 has none):
- "Layer 2 builds on layer 1."
- "Layer 3 builds on layer 1." Diff(M, ∂M) and Watanabe's `D⁴` need layer 1's boundary and ball.
- "Layer 4 builds on layers 1 and 2."
- "Layer 5 builds on layers 1 and 4."
- "Layer 6 builds on layers 1, 2 and 4."
- "Layer 7a builds on layer 1." This is in /84's new section.
- "Layer 7 builds on layers 1, 5 and 7a." Layer 5 is for the Weeks filling (/86).
- "Layer 8 builds on layers 1, 5, 7 and 7a."
- "Layer 9 builds on layers 1, 7 and 11." Layer 7 is for Li's hyperbolic target (/93); layer 11 is for existence
  (/87, /71).
- "Layer 10 builds on layers 1, 7 and 7a." These are the closed hyperbolic, irreducible and atoroidal hypotheses of
  the Gabai–Yazdi statement (/66).
- "Layer 11 builds on layer 1."

Three further moves:
- **Layer 3.** Replace "(consume `Matrix.orthogonalGroup`, layer 7's isometry action, and the sphere instance)" with:
  > (restrict the linear action of `Matrix.orthogonalGroup` to the sphere instance; built as a group homomorphism,
  > `TauCeti.orthogonalToDiffSphere`, `TauCeti/Geometry/Diffeomorphism/Sphere.lean:168`; continuity waits for the
  > `C^∞` topology)
- **Freedman's theorem moves from Layer 4 to Layer 6**, which owns the topological 4-manifold input:
  - In Layer 4, delete "and the topological 4-manifold input of layer 6" (line 468). Delete the two sketch lines
    "-- theorem freedman_alexanderOne_slice (f) (h : alexanderOfDiagram (diagramOf f) = 1) : / --
    IsTopologicallySlice f -- needs layer 6". Delete "Alexander-polynomial-one knots are topologically slice,
    `[Kir97, Problem 1.36]` (Freedman)." from the Unlocks.
  - In Layer 6, add the same two sketch lines, without "-- needs layer 6", to its Lean block. Replace "layer 4's
    `IsTopologicallySlice` and the Freedman unlock consume it" with:
    > the Freedman unlock, stated here, consumes it (layer 4's `IsTopologicallySlice` needs only layer 2's locally
    > flat discs)
  - Add "Alexander-polynomial-one knots are topologically slice, `[Kir97, Problem 1.36]` (Freedman)." to Layer 6's
    Unlocks, merged with /92.
- **The 1.19 and 4.82 moves** are /77's and /75's.

**2. Atlas: `scripts/snapshot/build_data.py`, after line 438** (the OneParameterSemigroups edge), before the loop at
line 439 that copies `new_stage_edges` into `requires` and `consumers`, add:
```python
    for c, ps in [('Layer 2', ['Layer 1']), ('Layer 3', ['Layer 1']), ('Layer 4', ['Layer 1', 'Layer 2']),
                  ('Layer 5', ['Layer 1', 'Layer 4']), ('Layer 6', ['Layer 1', 'Layer 2', 'Layer 4']),
                  ('Layer 7a', ['Layer 1']), ('Layer 7', ['Layer 1', 'Layer 5', 'Layer 7a']),
                  ('Layer 8', ['Layer 1', 'Layer 5', 'Layer 7', 'Layer 7a']),
                  ('Layer 9', ['Layer 1', 'Layer 7', 'Layer 11']), ('Layer 10', ['Layer 1', 'Layer 7', 'Layer 7a']),
                  ('Layer 11', ['Layer 1'])]:
        needle = {'Layer 2': 'Layer 2 builds on layer 1.', 'Layer 3': 'Layer 3 builds on layer 1.',
                  'Layer 4': 'Layer 4 builds on layers 1 and 2.', 'Layer 5': 'Layer 5 builds on layers 1 and 4.',
                  'Layer 6': 'Layer 6 builds on layers 1, 2 and 4.', 'Layer 7a': 'Layer 7a builds on layer 1.',
                  'Layer 7': 'Layer 7 builds on layers 1, 5 and 7a.', 'Layer 8': 'Layer 8 builds on layers 1, 5, 7 and 7a.',
                  'Layer 9': 'Layer 9 builds on layers 1, 7 and 11.', 'Layer 10': 'Layer 10 builds on layers 1, 7 and 7a.',
                  'Layer 11': 'Layer 11 builds on layer 1.'}[c]
        for p in ps:
            stage_dep('GeometricTopology', p, c, needle)
```
- **Timing.** Apply it only after the README sentences land upstream: `evidence()` returns `None` for a missing needle,
  and `stage_dep` does not guard against that.
- **The internal graph.** It is 24 edges and a DAG (topological order 1, 2, 3, 4, 5, 6, 7a, 7, 8, 11, 9, 10). There is
  no Layer 11 → Layer 1 edge: the `PLGroupoid` reconciliation sits in Layer 11 and uses Layer 1, so the red team's
  "L11 ↔ L1" would be a cycle.

**3. Atlas: link entries for `LINK-tauceti_TauCetiRoadmap_GeometricTopology`.** These are thirteen `links-v1` entries.
Each quote is verbatim at `31403074`.
- **Checked.** In a trial link packet, run against `31403074`'s `data/atlas.json`, roadmaps and link packets,
  `scripts/check_links.py` reports 0 errors and 0 warnings. A corrupted quote was rejected.
- **Cycles.** All thirteen, the 24 internal edges (with Layer 7a as a new node) and RT-AREA-diffgeom's three HopfRinow
  → GT links, added to the assembled graph together, give no cycle. Each is also acyclic on its own.
- **Re-quoting.** If a README note above lands before the link job, re-quote rows 3 and 4 from the new text.

| # | source → target | conf. | reason | source quote | target quote |
|---|---|---|---|---|---|
| 1 | GT L1 → AlgebraicTopology Stage 6 | explicit | Stage 6's manifold statements use the collar conventions GT owns | "A boundary component has a neighbourhood diffeomorphic to `∂M × [0, 1)`" (l. 204–205) | "the boundary/collar conventions owned by geometric topology" |
| 2 | AlgebraicTopology Stage 6 → GT L10 | inferred | cohomology, Kronecker pairing and fundamental classes (/88) | "Define absolute and relative singular cochains by applying `Hom` to singular chains." | "Be explicit that this is singular *cohomology* `H²(M; ℤ)`, not homology" (l. 799–800) |
| 3 | AlgebraicTopology Stage 7 → GT L10 | inferred | Euler characteristic of the surface (/88) | "Define Euler characteristic of a finite CW complex as the alternating sum of cell numbers" | "`\|⟨e(F), [S]⟩\| ≤ −χ(S)`" (l. 804) |
| 4 | AlgebraicTopology Stage 6 → GT L4 | inferred | 1.41's 0-shake genus needs fundamental classes of embedded surfaces | "construct the integral fundamental class" | "`0`-shake genus vs slice genus, `[Kir97, Problem 1.41]`" (l. 514) |
| 5 | AlgebraicTopology Stage 5 → GT L7 | inferred | one mapping-torus construction | "Derive the Wang long exact sequence for a mapping torus from a mapping-cone model." | "a 3-manifold *fibers over the circle* (is a mapping torus)" (l. 663–664) |
| 6 | UniversalCovers Stage 2 → GT L7 | inferred | finite covers for "virtually" | "**unpointed** connected covers ↔ **conjugacy classes** of subgroups." | "and is *virtually* so (a finite cover is)" (l. 665) |
| 7 | UniversalCovers Stage 3 → GT L3 | inferred | the `π_n` API for the Smale and Watanabe targets | "functoriality (`π_n` of a continuous map), pointed maps" | "`HomotopyGroup` (`Mathlib/Topology/Homotopy/HomotopyGroup.lean`) for the conclusions" (l. 368) |
| 8 | GT L1 → ArithmeticLocallySymmetricSpaces:ALS.2 | inferred | corners and the interior homotopy equivalence (/81) | "State gluing in the corners category from the start" (l. 276–277) | "prove the manifold-with-corners structure at neat level, compactness of the quotient and the homotopy equivalence from the interior" |
| 9 | GT L1 → ALS.5:finite-level-duality | inferred | duality on the same manifolds with corners (/81) | same as 8 | "On the actual finite-level manifolds with corners and their compactification/orientation systems" |
| 10 | GT L7 → OptimalTransport L7 | explicit | OT names GT L7 as the volume and curvature supplier | "The **Riemannian volume measure** from the metric" (l. 644) | "Layer 7, consumes that connection and supplies Riemannian volume and curvature" |
| 11 | GT L7 → OptimalTransport L14 | explicit | same | same as 10 | "This consumes curvature and volume from the geometric-topology roadmap." |
| 12 | GT L7 → FuchsianOrbifolds L2 | inferred | the hyperbolic volume comparison (/85) | same as 10 | "Compare it with hyperbolic Riemannian volume" |
| 13 | GT L4 → CombinatorialHeegaardFloer Lane K | explicit | Lane K consumes the Layer 4 presentations | "Coordinate the braid-group and diagram-calculus work with the combinatorial Heegaard Floer roadmap's Lane K" (l. 509–510) | "which **consumes** the knot theory built in the [geometric-topology roadmap](../GeometricTopology/README.md) (layer 4" |

The roadmap-level prerequisites follow from these links when the atlas is rebuilt. AlgebraicTopology and
UniversalCovers join; HeegaardFloer does not, since no Lane M edge is chosen (/87).

### Not done, and why
- **Links owned elsewhere.**
  - GT smooth triangulation → AlgebraicTopology Stage 8 is /71's.
  - The CHF G-6/G-10 → Layer 6 τ edges are /79's.
  - HopfRinow → GT Layers 7 and 8 were filed by RT-AREA-diffgeom /14–/15.
- **Links with no possible target.** GT Layer 1 → LV.5 and LV.9 already appear in LV's own `requires`. LV.5 → GT Layer
  9 is replaced by the mapping-class-group owner (/87), which has no stage yet.
- **A two-cycle.** /61 proposes both GT Layer 4 → CHF Lane K and CHF Lane K → GT Layer 4.
  Together they form a two-cycle. Row 13 keeps the direction Lane K's own text states. The grid-presentation citation
  should be a README reference, not a reverse edge.

## /92 (low, error): credit [Kir97, 1.53] to Kearton, positive mutants to Kirk–Livingston, the smooth refinement to Piccirillo

- **State on main (31403074).**
  - The README is unchanged:
    - line 622, "Conway mutation does not preserve concordance, `[Kir97, Problem 1.53]`";
    - lines 1050–1051, which credit it to "The Conway and Kinoshita–Terasaka pair … via Piccirillo";
    - the sketch `mutation_not_concordance_invariant : ∃ K, ¬ Concordant K (mutate K)` (line 611).
  - Kearton, *Mutation of knots*, Proc. AMS 105 (1989) 206–208 (DOI 10.1090/S0002-9939-1989-0929430-1), was read:
    - the Lemma (p. 206): `k + kʳ` is a mutant of `k + k`;
    - p. 207: by Livingston there are knots `k` not concordant to `kʳ`, "hence … mutation does not preserve the
      concordance class in general".
  - Kirk–Livingston (Geom. Topol. 5 (2001) 831–883, arXiv:math/9912174v2, DOI 10.2140/gt.2001.5.831), abstract
    (p. 831): "the first infinite families of knots that are distinct from their positive mutants, even up to
    concordance". Their §2.1 says the results carry over to the topological locally flat setting.
  - Piccirillo (arXiv:1808.02923; Ann. of Math. 191 (2020), DOI 10.4007/annals.2020.191.2.5), abstract: "a non-slice
    knot which is both topologically slice and a positive mutant of a slice knot".
  - Kirby's list, Problem 1.53 (p. 35): "Update: No [Kearton, 1989] … if … the mutation is the one (of three types)
    which preserves orientation, then the problem is still open."
- **Fix. Note for the Tau Ceti maintainer, Layer 6.**
  1. **Mutation bullet.** Replace "(Conway mutation by a `(±1)`-tangle replacement) and the statement that it does
     *not* preserve the smooth concordance class." with:
     > (rotating a tangle inside a Conway sphere, the sphere and the rotation taken as data, with the
     > orientation-preserving *positive* mutation singled out; Kearton, Figures 1–4). The statements:
     > - mutation does not preserve the concordance class (Kearton);
     > - there are knots not concordant to their positive mutants (Kirk–Livingston);
     > - there are positive mutants that are topologically but not smoothly concordant (the Conway and
     >   Kinoshita–Terasaka pair, Piccirillo).
  2. **The Lean sketch.** Replace "-- theorem mutation_not_concordance_invariant : ∃ K, ¬ Concordant K (mutate K)"
     with:
     ```lean
     -- theorem mutation_not_concordance_invariant : ∃ K c, ¬ Concordant K (mutate K c)   -- Kearton: k # k, k # kʳ
     -- theorem positive_mutant_topConcordant_not_concordant :
     --     ∃ K c, IsPositive c ∧ TopConcordant K (mutate K c) ∧ ¬ Concordant K (mutate K c)   -- Conway / KT
     ```
  3. **Unlocks.** Replace "Conway mutation does not preserve concordance, `[Kir97, Problem 1.53]`;" with:
     > Conway mutation does not preserve concordance, `[Kir97, Problem 1.53]` (Kearton 1989); positive mutation does
     > not either (Kirk–Livingston 2001), and smoothly not even among topologically concordant knots (Piccirillo);

     Add /91's 1.36 sentence to the same paragraph. /70 owns the 1.31 clause.
  4. **References.** Replace "The Conway and Kinoshita–Terasaka pair, mutants with different smooth concordance type
     via Piccirillo (above), `[Kir97, 1.53]`;" with:
     > C. Kearton, *Mutation of knots*, Proc. Amer. Math. Soc. 105 (1989) 206–208, `[Kir97, 1.53]`; P. Kirk,
     > C. Livingston, *Concordance and mutation*, Geom. Topol. 5 (2001) 831–883,
     > [arXiv:math/9912174](https://arxiv.org/abs/math/9912174), for positive mutants; the Conway and
     > Kinoshita–Terasaka pair, positive mutants of which one is slice and the other topologically but not smoothly
     > slice (Piccirillo, above);
- **Not done.** Livingston's paper on knots not concordant to their reverses was not read. Kearton is cited for that
  step as he states it.

## /93 (low, error): credit the rank-versus-genus disproof to Boileau–Zieschang, and Li for hyperbolic manifolds

- **State on main (31403074).**
  - The README is unchanged:
    - line 778, "(disproved by Li; no Kirby number)";
    - lines 1086–1088, Li as "the disproof";
    - the sketch `waldhausen_false : ∃ M, groupRank (FundamentalGroup M) < heegaardGenus M` (line 767).
  - Kirby's list, Problem 3.15, Update (vi) (p. 110): "There are examples of 3-manifolds for which the rank of the
    fundamental group is 2 but the Heegaard genus is 3. See [Boileau & Zieschang, 1984, Invent. Math.]".
  - Boileau–Zieschang, Invent. Math. 76 (1984) 455–468, DOI 10.1007/BF01388469 (Crossref).
  - Li's abstract (arXiv:1106.6302v2): "a closed orientable hyperbolic 3-manifold with rank of its fundamental group
    smaller than its Heegaard genus". The paper is J. Amer. Math. Soc. 26 (2013) 777–829,
    DOI 10.1090/S0894-0347-2013-00767-5.
- **Fix. Note for the Tau Ceti maintainer, Layer 9.**
  1. **Unlocks.** Replace "Waldhausen's rank-versus-genus conjecture (disproved by Li; no Kirby number)." with:
     > Waldhausen's rank-versus-genus conjecture, disproved by Boileau–Zieschang with Seifert fibred 3-manifolds of
     > rank 2 and Heegaard genus 3 (`[Kir97, Problem 3.15]`, Update (vi)); Li disproved the hyperbolic version.
  2. **The Lean sketch.** After the `waldhausen_false` line add:
     ```lean
     -- theorem waldhausen_false_hyperbolic : ∃ M, ClosedOrientableHyperbolic3 M ∧
     --     Group.rank (FundamentalGroup M) < heegaardGenus M        -- Li; needs layer 7
     ```
  3. **References.** Replace "the disproof of Waldhausen's rank-versus-genus conjecture." with:
     > a closed orientable hyperbolic counterexample to Waldhausen's rank-versus-genus conjecture. The first
     > counterexamples are M. Boileau, H. Zieschang, *Heegaard genus of closed orientable Seifert 3-manifolds*,
     > Invent. Math. 76 (1984) 455–468.
- **Atlas.** The internal edge Layer 7 → Layer 9 is in /91's list.
- **Not done.** Boileau–Zieschang itself was not read. The statement is Kirby's Update (vi).

## /94 (low, library-claim): add seven Mathlib files to the inventory and the layers

- **State on main (31403074).** The Inventory (lines 97–157) is unchanged. Each file was checked at Mathlib `082e2d3`,
  with its hypotheses:
  - (a) `SingularManifold` (`Geometry/Manifold/Bordism.lean:110`): a closed manifold with a continuous map to `X`.
    The file "defines the beginnings of unoriented bordism theory", and bordism groups are future work.
  - (b) `[x, y]` as a manifold with boundary: `instIccChartedSpace` and `instIsManifoldIcc` (`Instances/Real.lean:439,
    504`) and `boundary_Icc` (`:480`). `Instances/Icc.lean` relates it to `ℝ`, for example
    `isSmoothEmbedding_subtypeVal_Icc` at `:119`. The finding's `Icc.lean:64` is only the tangent vector `1`.
  - (c) `proof_wanted SimplyConnectedSpace.nonempty_homeomorph_sphere_three` (`Wanted/Geometry/Manifold/PoincareConjecture.lean:32`)
    and `…nonempty_sdiffeomorph_sphere_three` (`:37`), both under `[T2Space M] [ChartedSpace ℝ³ M]
    [SimplyConnectedSpace M] [CompactSpace M]`. The smooth one also assumes `[IsManifold (𝓡 3) ∞ M]`.
  - (d) `CovariantDerivative.leviCivitaConnection` and `isLeviCivitaConnection_leviCivitaConnection`
    (`VectorBundle/CovariantDerivative/LeviCivita.lean:359, 408`), for `[IsManifold I 2 M]`, a `C¹` Riemannian
    bundle and `[FiniteDimensional ℝ E]`. There is no curvature tensor and no Riemannian volume under `Geometry/Manifold`.
  - (e) `Group.rank [h : FG G]` (`GroupTheory/Rank.lean:33`).
  - (f) `VectorField.mlieBracket` (`VectorField/LieBracket.lean:73`).
  - (g) `IsImmersionAt` and `IsImmersion` (`Immersion.lean:194, 805`).
- **Verifier.** Confirmed, and it checked the same lines.
- **Diffgeom's correction applies to (d).** RT-AREA-diffgeom /6 found that Hopf–Rinow Layer 1 delivers Mathlib's
  construction with Tau Ceti's regularity, and that GT line 630 stays accurate. So (d) is an inventory line, not
  "rather than wait for HopfRinow".
- **Fix. Note for the Tau Ceti maintainer.**
  1. **The Inventory.** Before "Everything geometric-topological past this smooth-manifold-and-tangent-bundle level is
     missing from Mathlib" add a bullet:
     > - **Also in Mathlib at the pin, consumed below.**
     >   - `[x, y]` as a manifold with boundary (`instIsManifoldIcc`, `boundary_Icc`,
     >     `Mathlib/Geometry/Manifold/Instances/Real.lean:504, 480`; `Instances/Icc.lean`), the model for `Dⁿ`,
     >     collars and `S³ × [0, 1]` (layers 1 and 6).
     >   - Immersions `IsImmersionAt` / `IsImmersion` (`Mathlib/Geometry/Manifold/Immersion.lean:194, 805`).
     >   - `SingularManifold` (`Mathlib/Geometry/Manifold/Bordism.lean:110`), "the beginnings of unoriented bordism
     >     theory" (layer 6 builds its cobordisms on it, adding orientations).
     >   - `CovariantDerivative.leviCivitaConnection` (`…/VectorBundle/CovariantDerivative/LeviCivita.lean:359`),
     >     which the Hopf–Rinow roadmap's Layer 1 delivers with Tau Ceti's regularity; there is no curvature and no
     >     Riemannian volume.
     >   - `VectorField.mlieBracket` (`…/VectorField/LieBracket.lean:73`, layer 10).
     >   - `Group.rank` under `[Group.FG G]` (`Mathlib/GroupTheory/Rank.lean:33`, layer 9).
     >   - The `proof_wanted` three-dimensional Poincaré statements (`Wanted/Geometry/Manifold/PoincareConjecture.lean:32, 37`,
     >     layer 8).
  2. **Layer 6, "From Mathlib / earlier layers".** After "The classical signature invariant is built here from layer
     4's Seifert matrix." add:
     > The cobordism category starts from Mathlib's `SingularManifold` (`Mathlib/Geometry/Manifold/Bordism.lean`).
  3. **Layer 8, design notes.** After "and falls out as an instance." add:
     > It discharges Mathlib's `proof_wanted` statements `SimplyConnectedSpace.nonempty_homeomorph_sphere_three` and
     > `…_sdiffeomorph_sphere_three`.
  4. **Layer 9.** Replace "⚠ Confirm the rank invariant exists in the intended form: Mathlib may not provide exactly
     `Group.rank (FundamentalGroup M)`, so name the minimal-generators invariant explicitly and check before relying
     on it." with:
     > The rank is Mathlib's `Group.rank` (`Mathlib/GroupTheory/Rank.lean:33`), which needs `[Group.FG G]`. A
     > genus-`g` splitting gives a presentation of `π₁(M)` with `g` generators (Scharlemann §5, pp. 19–20), which
     > supplies `Group.FG`.

     In the sketch, `groupRank` becomes `Group.rank`.
  5. **Layer 10** takes `mlieBracket` in /88's replacement.
  6. **Layer 1 and Layer 7.** Layer 1's `Icc` model is in /81. Layer 7's connection line is diffgeom /15's.
- **Not done.** No Mathlib-side change is needed.

## /95 (low, error): state the Smale conjecture as "the inclusion is a homotopy equivalence", on 𝓡 3

- **State on main (31403074).** The README is unchanged:
  - line 394, `smale_conjecture : Nonempty (HomotopyEquiv (Diff 𝓘 (sphere 3)) (orthogonalGroup 4 ℝ))`;
  - lines 397–399, the design note "the inclusion `O(4) → Diff(S³)` being a homotopy equivalence is the sharp form".
- **Tau Ceti f790474.**
  - `TauCeti.orthogonalToDiffSphere (n) (m) : Matrix.orthogonalGroup (Fin (n + 1)) ℝ →* Diff (𝓡 n) (sphere (0 :
    EuclideanSpace ℝ (Fin (n + 1))) 1) m` (`Geometry/Diffeomorphism/Sphere.lean:168`). It is an injective group
    homomorphism on the `𝓡 n` model, and its docstring says continuity waits for the `C^∞` topology.
  - `Diff` (`Group.lean:178`) has no topology.
- **Mathlib.** `ContinuousMap.HomotopyEquiv` has forward map `toFun : C(X, Y)` (`Topology/Homotopy/Equiv.lean:43–47`).
- **Kirby's list, Problem 4.126(C) (p. 247).** "4-dim Smale Conjecture: The inclusion SO(5) → SDiff(S⁴) is a homotopy
  equivalence". Its remarks record the case `n = 3` as Hatcher's.
- **Watanabe.** arXiv:1812.02448v3, abstract: "the 4-dimensional Smale conjecture is disproved". The addendum
  arXiv:2109.01609v3 gives "a differential form interpretation of the proof". arXiv lists no journal reference for
  either (checked 2026-09-29).
- **Fix. Note for the Tau Ceti maintainer, Layer 3.**
  1. **The Lean sketch.** Replace the line "-- theorem smale_conjecture : Nonempty (HomotopyEquiv (Diff 𝓘 (sphere 3))
     (orthogonalGroup 4 ℝ))" with:
     ```lean
     -- def orthogonalToDiffSphereC (n) : C(Matrix.orthogonalGroup (Fin (n + 1)) ℝ,
     --     Diff (𝓡 n) (sphere (0 : EuclideanSpace ℝ (Fin (n + 1))) 1) ∞)   -- orthogonalToDiffSphere n ∞, continuous
     -- theorem smale_conjecture : ∃ e : Matrix.orthogonalGroup (Fin 4) ℝ ≃ₕ
     --     Diff (𝓡 3) (sphere (0 : EuclideanSpace ℝ (Fin 4)) 1) ∞, e.toFun = orthogonalToDiffSphereC 3   -- Hatcher
     -- theorem smale_conjecture_four_false : ¬ ∃ e : SO(5) ≃ₕ SDiff(S⁴), e.toFun = the inclusion   -- Watanabe
     ```
  2. **Design notes.** After "the inclusion `O(4) → Diff(S³)` being a homotopy equivalence is the sharp form." add:
     > The sketch states exactly that: the forward map of the homotopy equivalence is the inclusion, built as
     > `TauCeti.orthogonalToDiffSphere` (`TauCeti/Geometry/Diffeomorphism/Sphere.lean:168`), with the sphere on its
     > `𝓡 3` model. The four-dimensional statement is `[Kir97, 4.126(C)]`, "The inclusion SO(5) → SDiff(S⁴) is a
     > homotopy equivalence", whose negation Watanabe proves (arXiv:1812.02448; addendum arXiv:2109.01609; arXiv
     > preprints).
- **Coordination.** The Kirby numbers in the Unlocks line and the Watanabe reference line are /73's.
- **Not done.** Nothing further.

## HeegaardFloer (/96–/117): conventions

Every finding in this range is about the Tau Ceti roadmap `content/tau-ceti/HeegaardFloer/README.md` (upstream `TauCetiRoadmap/HeegaardFloer/README.md`; atlas stages `tauceti:TauCetiRoadmap/HeegaardFloer#…`). Under PROTOCOL.md §15 the fixes are **notes for the Tau Ceti maintainer** with exact replacement wording; the snapshot and the extract are then regenerated from upstream. The atlas-side edits are /114's audit verdicts, /115's regeneration and /116's link entries. /114 also carries a note for the Tau Ceti *library* maintainer.

**State.** The README, the extract `research/blueprint/atlas/roadmaps/tauceti_TauCetiRoadmap_HeegaardFloer.json`, `data/library-coverage.json` and the link maps are unchanged since 24 September: `git log 45707f47..origin/main` touches none of them, and the README at `31403074` is identical to the one at origin/main (`546852b1`). Line numbers below are those of that README. The extract has 22 stages, all `status: "unknown"` with `requires: []` and `consumers: []`, and `stageEdges: []`; the integrated atlas (7792 stage edges) has no edge with a HeegaardFloer endpoint.

**Quotations ignore line wrapping.**

**Where each passage is rewritten.** Several findings touch the same passage, so each passage gets one replacement, written out in full once:

| Passage (README lines) | Full replacement in | Also applies |
| --- | --- | --- |
| "Why this is less hopeless", 2nd bullet (36–40) | /97 | /107 |
| End goals, v3 bullet (49–50) | /100 | |
| Standing conventions, 1st bullet (69–72) | /111 | |
| Inventory, both lists (90–124) | /114 | /101, /103 |
| Lane M, item 1 (147–149); Lane F0 (161–167) | /114 | |
| Lane F1, item 2 (177–179) | /102 | |
| Lane F2, item 1 (189–191) | /103 | |
| Lane F2, item 3's ⚠ (196–198) and new item 6 | /97 | |
| Lane F3 (208–216) | /110 | /96 |
| Lane F4 heading paragraph (220–222) | /100 | /109, /117 |
| F4.1 (224–227) | /106 | /96 |
| F4.2 (228–230) | /104 | /108, /109 |
| F4.3 (231–232) | /117 | |
| F4.4 (233–238) | /96 | /97, /107 |
| F4.5 (239–242) | /105 | /97, /111, /112 |
| Lane F5 (244–254) | /99 | /98, /108 |
| New Lane O (orientations and degree) | /101 | |
| Reconciliations section (256–284) | /115 | /98, /99, /113 |
| Acceptance criteria, last two bullets (294–298) | /113 | /107 |
| "How to drive it" (334–336) | /103 | |
| References (302–330) | below | |

**Stages created by the upstream edits.** The snapshot builder makes a stage of every heading beginning "Lane …" and of every numbered item under such a heading (key `<lane>.<n>`, anchor `milestone-<lane>-<n>`). After regeneration the new stages are `…#milestone-f2-6` (/97), `…#milestone-f5-1` to `…#milestone-f5-4` (/99), `…#lane-o-manifold-orientations-and-degree`, `…#milestone-o-1` and `…#milestone-o-2` (/101), and `…#lane-r-reconciliations-the-seams-and-the-long-pole` with `…#milestone-r-1` to `…#milestone-r-3` (/115). No existing stage id changes, because every new numbered item is appended after the existing ones.

**References (README lines 302–330).** Replace the Perutz entry (lines 315–316) and the Zemke/MOS entry (lines 320–322) with:
> - T. Perutz, [arXiv:0801.0564](https://arxiv.org/abs/0801.0564): an alternative route to handleslide invariance through Hamiltonian isotopies, with the prerequisites listed in F4.4.
> - I. Zemke, [arXiv:2111.14962](https://arxiv.org/abs/2111.14962) (lattice homology = completed `HF⁻` for plumbing trees, Reconciliation R.2); Manolescu–Ozsváth–Sarkar [arXiv:math/0607691](https://arxiv.org/abs/math/0607691) (grid homology = `HFK̂`, R.3): the reconciliation targets, owned by this roadmap.

and add after the JTZ entry:
> - P. Ozsváth, Z. Szabó, [arXiv:math/0110169](https://arxiv.org/abs/math/0110169) (absolute grading, Theorem 7.1) and [arXiv:math/0110170](https://arxiv.org/abs/math/0110170) (correction terms, Definitions 4.1 and 4.9): F4.5.
> - P. Ozsváth, Z. Szabó, [arXiv:math/0512286](https://arxiv.org/abs/math/0512286), Algebr. Geom. Topol. 8 (2008) 615–692: multi-pointed diagrams and link Floer homology, F5.2.
> - S. Sarkar, [arXiv:math/0609673](https://arxiv.org/abs/math/0609673), J. Symplectic Geom. 9 (2011) 251–270: the Maslov index of Whitney `n`-gons, F4.5.
> - C. Manolescu, P. Ozsváth, [arXiv:1011.1317](https://arxiv.org/abs/1011.1317), Geom. Topol. 29 (2025) 2783–3062; I. Zemke, [arXiv:2109.11520](https://arxiv.org/abs/2109.11520): surgery formulas, F5.3.
> - M. Gartner, [arXiv:1908.06237](https://arxiv.org/abs/1908.06237), Algebr. Geom. Topol. 23 (2023) 963–1054: projective naturality over ℤ, F4.5.
> - M. Abouzaid, [arXiv:1312.3354](https://arxiv.org/abs/1312.3354): `C⁰` bounds and the maximum principle for Floer curves in cotangent bundles, F3.
> - C. Wendl, [arXiv:1011.1690](https://arxiv.org/abs/1011.1690), §2.5: the Calderón–Zygmund inequality with its hypotheses, F1.2.

## /96 (high, error): handleslide invariance goes through Ozsváth–Szabó's triangles; Perutz is an alternative with its own prerequisites

### What the verifier corrected
Nothing; confirmed as stated. The review's point is that F4.4 cannot follow Perutz's route and keep F4.1's instruction ("T_alpha is only ever needed totally real ... do not chase Lagrangian-ness") at once, and that "invariance reduces to F3's continuation maps instead of a new moduli problem" is not what Perutz gives.

### State on main (31403074)
- F4.4, lines 233–238: "**`HF̂` over 𝔽₂:** `∂² = 0` (boundary degenerations have `n_z ≥ 1`, so they are absent from the hat differential); `J`-independence and isotopy invariance by continuation; **handleslides via Perutz** ([arXiv:0801.0564](https://arxiv.org/abs/0801.0564)): the handleslid torus is Hamiltonian-isotopic, so invariance reduces to F3's continuation maps instead of a new (triangle) moduli problem; stabilization."
- F4.1, lines 226–227: "⚠ `T_α` is only ever needed *totally real* (with a taming form); do not chase Lagrangian-ness."
- F3, lines 214–216: "⚠ Skip monotone Floer theory entirely: Heegaard Floer replaces monotonicity with admissibility, so the monotone chapter is a detour on this roadmap."
- F4.5, lines 240–241 lists "holomorphic triangles and cobordism maps" as post-v3.
- Perutz (arXiv:0801.0564v2), read: Theorem 1.2 needs "`γ_0 ∩ γ_1` is a transverse intersection consisting of precisely two points", a Kähler form `ω_λ` in class `η + λθ` with `λ > 0`, and gives a Hamiltonian isotopy only "if and only if ∫_D α = (1+λ) ∫_A α − 2λ"; Corollary 1.3 assumes "`z` lies outside the handlesliding region". §6: "it is important to work with Lagrangian (not merely totally real) submanifolds"; "Heegaard tori are monotone Lagrangians of minimal Maslov index 2 … they always do so in cancelling pairs [OS, Theorem 3.15]"; the continuation-map energy bound uses "[OS, Section 9.2], the number of finite-energy holomorphic triangles … is finite"; closing remark: the continuation isomorphisms agree with the triangle maps via "a gluing theorem for holomorphic sections".
- Ozsváth–Szabó arXiv:math/0101206v4 (numbering computed from the source): triangle maps Theorem 8.12 with Propositions 8.13–8.14; §8.4 rectangles; associativity Theorem 8.16; handleslide invariance Theorem 9.5, whose Lemma 9.6 ends "The result is now a direct application of Theorem 8.16", and Proposition 9.8.
- Also relevant: the appendix of arXiv:0912.0830v3 (Reconciliation 1's source) sets up `CF̂(D)` "with the symplectic form ω provided by [perutz] having the property that T_α and T_β are Lagrangian".

### Fix
**Note for the Tau Ceti maintainer.**
1. **F4.4.** Replace lines 233–238 ("4. **`HF̂` over 𝔽₂:** … stabilization.") with (this includes /97's and /107's parts):
   > 4. **`HF̂` over 𝔽₂:**
   >    - `∂² = 0` (boundary degenerations have `n_z ≥ 1`, so they are absent from the hat differential);
   >    - `J`-independence (OS §6) and isotopy invariance (OS §7) by continuation (Lane F3);
   >    - **holomorphic triangles** and the maps they induce (OS §8: Theorem 8.12; independence of `J` and isotopy invariance, Propositions 8.13–8.14);
   >    - their **associativity** (Theorem 8.16), which counts holomorphic rectangles of varying conformal modulus (F2.6);
   >    - **handleslide invariance** from these (OS §9: Theorem 9.5, through Lemma 9.6 and Proposition 9.8);
   >    - **stabilization** (OS Theorem 10.1). For `HF̂` no gluing is needed: for a path `J_s` agreeing with `Sym^g(j)` near the connected-sum point, the classes with `n_z = 0` have their holomorphic representatives in `Sym^g(Σ − B) × {c}`;
   >    - the **polygon counts** that the acceptance checks and Reconciliations R.1 and R.3 use: an index-one class whose domain is an embedded bigon or an embedded rectangle has an odd number of holomorphic representatives modulo `ℝ` (arXiv:0912.0830, appendix, proof of Theorem 10.3, item (4)). In genus one this is the Riemann mapping theorem with boundary correspondence for the polygon (Tau Ceti's conformal-mapping roadmap, L3 and L5). For rectangles in `Sym²`, it follows from the tautological correspondence (OS Lemma 3.6) and `α`-injective transversality (OS Proposition 3.9): the moduli space corresponds to the involutions of the rectangle that exchange opposite sides, and there is exactly one (Manolescu–Ozsváth–Sarkar, arXiv:math/0607691, §3).
   >
   >    Invariance is stated for pointed diagrams modulo these moves (see the ⚠ at the head of this lane).
   >
   >    **Perutz's route** ([arXiv:0801.0564](https://arxiv.org/abs/0801.0564)) is an alternative for handleslides only; it does not avoid triangles. Its inputs, none planned here, are:
   >    - Kähler forms `ω_λ` on `Sym^g(Σ)` in the class `η + λθ`, `λ > 0` small, making the tori Lagrangian (Proposition 1.1, §7);
   >    - the hypotheses of Theorem 1.2 and Corollary 1.3: the handleslid circles meet in exactly two transverse points, an area constraint holds, and `z` lies outside the handlesliding region;
   >    - the symplectic-sum construction of the isotopy (§§2–4);
   >    - monotone Lagrangian Floer theory with minimal Maslov index 2, where disc bubbles cancel in pairs by OS Theorem 3.15 (§6);
   >    - continuation maps of Hamiltonian fibrations, whose energy bound itself uses the finiteness of triangle classes (OS §9.2);
   >    - and, to identify the result with the triangle maps that F4.5's cobordism maps use, a gluing theorem for holomorphic sections (§6, final remark).
2. **F4.1's warning** is restricted to the Ozsváth–Szabó route; see /106's replacement of F4.1.
3. **F4.5** no longer lists "holomorphic triangles"; see /105.
4. **F3's ⚠** points at F4.4 for the monotone alternative; see /110.
5. **References:** Perutz entry as in the preface.

**Edges** (in /116's list): `…#lane-f3-lagrangian-floer-homology-exact-case → …#milestone-f4-4`, reason "`J`-independence and isotopy invariance by continuation"; `…#milestone-f2-6 → …#milestone-f4-4`, reason "rectangles for associativity" (/97).

### Not done, and why
- Of Perutz I read §1 (Proposition 1.1, Theorem 1.2, Corollary 1.3) and §6 in full. §§2–5 and §7 are cited only through the paper's own plan of sections.
- The paper is published in the Proceedings of the Gökova Geometry–Topology Conference 2007, 15–35 (arXiv comments; OSS's bibliography). There is no DOI, so the arXiv id is cited.

## /97 (high, error): two degenerations beyond fixed strips become F2.6

### What the verifier corrected
Nothing; confirmed, with the theorem numbers checked in the source (8.16 `thm:Associativity`, 9.5 `thm:HandleslideInvariance`, 9.6 `lemma:Assoc`). I recomputed the numbering and it agrees.

**A narrowing, from reading OS §10.** `HF̂`'s stabilization invariance, OS Theorem 10.1 ("We begin with the much simpler case of `CF̂`"), needs no gluing. For a path `J_s` agreeing with `Sym^g(j)` near the connected-sum point, "if `n_z(φ)=0`, then any `J_s`-holomorphic representative for `φ` must have its image in `Sym^g(Σ−B_ε)`". The neck stretching serves Theorem 10.2 ("The corresponding fact for `HF^±` and `HF^∞` is more subtle, and depends on a gluing theorem"). So:
- piece (a), rectangles, is what blocks v3;
- piece (b), neck stretching, blocks F4.5's flavors and the exact triangles.

The fix is otherwise unchanged.

### State on main (31403074)
- F2.3, lines 194–198: "… **Gromov compactness for strips/disks with totally real boundary under energy bounds**, bubbling into trees of disks and spheres. ⚠ No Deligne–Mumford, no varying-domain stable maps: fixed genus-zero domains only; resist the general theory."
- F2.5, lines 201–204: "**Gluing** (Schwarz's model, then MS Chapter 10): pregluing, uniformly bounded right inverses, quadratic estimates, Newton iteration, …".
- Lines 36–38: "fixed strip domain, genus-zero disk-tree bubbling only, no Riemann mapping theorem, no Deligne–Mumford, no SFT compactness."
- OS §8.4 (read): "the space of conformal structures on the rectangle, `Mod(R)`, is identified with `ℝ` … As this parameter goes to `±∞`, the corresponding rectangle breaks up conformally into a pair of triangles meeting at a vertex". OS §10: "a subset of `Sym^{g+1}(Σ ∨ E)`, which in turn can be thought of as a degenerated version of `Sym^{g+1}(Σ')` … A Gromov compactness argument shows that for sufficiently large `T`, all of the moduli spaces … lie in the domain of this gluing map" (Theorem 10.4, Propositions 10.15–10.16, Lemmas 10.17–10.18). arXiv:math/0105202v4 Theorem 9.4 glues triangles across `Σ # E`.

### Fix
**Note for the Tau Ceti maintainer.**
1. **F2.3's ⚠.** Replace "⚠ No Deligne–Mumford, no varying-domain stable maps: fixed genus-zero domains only; resist the general theory." with:
   > ⚠ No general Deligne–Mumford theory and no varying-domain stable maps beyond the two cases of item 6: fixed genus-zero domains otherwise; resist the general theory.
2. **New F2.6.** Insert after item 5 of Lane F2 (after line 204):
   > 6. **Two degenerations beyond fixed strips** (still no general Deligne–Mumford theory):
   >    - (a) compactness and gluing for disks with three and four boundary punctures in `Sym^g(Σ)`, including the one-parameter family of conformal structures on the four-punctured disk, whose two ends break a rectangle into a pair of triangles meeting at a vertex (OS [arXiv:math/0101206](https://arxiv.org/abs/math/0101206), §8.4). This gives associativity of triangle maps (Theorem 8.16), hence handleslide invariance (Theorem 9.5, via Lemma 9.6), and it is needed for v3.
   >    - (b) neck stretching: Gromov compactness and gluing as `Σ #_T E` degenerates to `Σ ∨ E` inside `Sym^{g+1}`, splicing in spheres of `Sym²(E)` (OS §10: Theorem 10.4, Propositions 10.15–10.16, Lemmas 10.17–10.18). It gives the stabilization invariance of `HF^±` and `HF^∞` (Theorem 10.2) and the gluing of triangles across `Σ # E` in the surgery exact triangles ([arXiv:math/0105202](https://arxiv.org/abs/math/0105202), Theorem 9.4); it is needed for F4.5, not for v3.
   >    - Lipshitz's cylindrical setting (Lane F5) is an alternative for (b): there the gluing takes place "in a four-manifold, along a singular set which is a manifold" (Ozsváth–Szabó, arXiv:math/0512286, §5).
   >    - `HF̂`'s own stabilization invariance needs neither (OS Theorem 10.1).
3. **Lines 36–40.** Replace the bullet "- The **`Sym^g` route is analytically lighter for a formalizer than the cylindrical one**: … Atiyah–Singer never appears." with (this includes /107):
   > - The **`Sym^g` route is analytically lighter for a formalizer than the cylindrical one**: the hat differential counts strips with a fixed domain, bubbling is genus-zero disk trees, and there is no general Deligne–Mumford theory and no SFT compactness. Two degenerations beyond fixed strips are still needed (F2.6):
   >   - holomorphic rectangles of varying conformal modulus, for associativity of triangle maps and hence handleslide invariance (OS [arXiv:math/0101206](https://arxiv.org/abs/math/0101206), §8.4 and Theorem 9.5);
   >   - neck stretching of `Σ #_T E`, for the non-hat flavors and the exact triangles (OS §10).
   >
   >   The explicit computations need the Riemann mapping theorem with boundary correspondence, for the counts of embedded bigons and rectangles (F4.4; Tau Ceti's conformal-mapping roadmap, L3 and L5). The only index theorem the whole tower needs is Riemann–Roch-with-boundary via Robbin–Salamon spectral flow; Atiyah–Singer never appears.
4. F4.4 and F4.5 cite F2.6 (see /96 and /105).

**Edges** (in /116): `…#milestone-f2-3 → …#milestone-f2-6`, `…#milestone-f2-5 → …#milestone-f2-6`, `…#milestone-f2-6 → …#milestone-f4-4`, `…#milestone-f2-6 → …#milestone-f4-5`. `…#milestone-f2-6` exists only after regeneration; the combined check is acyclic.

### Not done, and why
- Lipshitz's own stabilization section (§12 of arXiv:math/0502404) was not read. Nor were Ionel–Parker and Li–Ruan, which OS §10 cites for the degeneration.

## /98 (high, error): Reconciliation R.2 is Zemke's theorem, for plumbing trees and the completed `HF⁻`

### What the verifier corrected
Nothing; confirmed. The review notes that the missing completion is the same gap as /112, so both use F4.5's completed-flavor bullet (/105).

### State on main (31403074)
- Lines 271–274: "**Lattice homology = `HF⁻` of plumbed manifolds** (Zemke [arXiv:2111.14962](https://arxiv.org/abs/2111.14962)): Némethi's `ℍ⁻` computes the holomorphic `HF⁻` of every plumbed 3-manifold. Depends on the staged `HF^-`/`HF^∞` flavors of F4.5 and the combinatorial Lane L."
- Zemke arXiv:2111.14962v4 (read; "Accepted version, Duke Math. Journal" per its arXiv comments):
  - Theorem 1.1: "If `G` is a plumbing tree, then there is an isomorphism of `𝔽[[U]]`-modules `ℍ𝔽(G) ≅ 𝐇𝐅⁻(Y(G))`. When `b₁(Y(G))=0`, the isomorphism is relatively graded", where the bold `𝐇𝐅⁻` is "the `𝔽[[U]]` module obtained by completing `HF⁻(Y(G))` with respect to the `U` action".
  - Right after the theorem: "If `Y(G)` is a rational homology 3-sphere, no information is lost … The same holds if we restrict to torsion `Spin^c` structures".
  - Conjecture 1.2 concerns the `Λ*H₁(Y(G))/Tors` action.
  - The proof "uses the link surgery formula of Manolescu and Ozsváth" and "the techniques of [ZemBordered]", and it uses "the description given by Ozsváth, Stipsicz and Szabó", "defined for arbitrary plumbing trees".

### Fix
**Note for the Tau Ceti maintainer.**
- R.2 is restated in /115's Lane R.
- The surgery formulas become F5.3 in /99's Lane F5.
- The completed flavor is a bullet of F4.5 (/105).

**Other side, one line (CombinatorialHeegaardFloer, /58):** Lane L builds Ozsváth–Stipsicz–Szabó's homological lattice complex for arbitrary plumbing trees, or its comparison with Némethi's complex for negative-definite graphs, and the CHF README's "computes `HF⁻` of all plumbed manifolds" is corrected to Zemke's statement.

**Edges** (in /116): `…#milestone-f4-5 → …#milestone-r-2`, `…#milestone-f5-3 → …#milestone-r-2`, `CombinatorialHeegaardFloer#lane-l-lattice-homology → …#milestone-r-2`, `…#milestone-f5-2 → …#milestone-f5-3`.

### Not done, and why
- Of Manolescu–Ozsváth I read the Introduction and §11's opening and Proposition 11.5. Zemke's bordered paper (arXiv:2109.11520v6) was checked by id only.
- Ozsváth–Stipsicz–Szabó's lattice papers were not read; the description of their complex is Zemke's.

## /99 (high, missing): multi-pointed Heegaard Floer homology becomes F5.2, and R.1 and R.3 depend on it

### What the verifier corrected
Nothing; confirmed.

### State on main (31403074)
- Lane F5, lines 246–254, names only "Knot Floer homology via doubly-pointed diagrams lives here too; it is what the **grid homology = HFK** reconciliation (below) is stated against."
- R.1's dependencies (lines 269–270): "Depends on F4.4 (stabilization and diagram-move invariance) and the combinatorial Lane H."
- R.3 (lines 275–279): "…computed holomorphically from doubly-pointed diagrams via the cylindrical reformulation of Lane F5. Depends on F5 and the combinatorial Lane G."
- Sources read:
  - Ozsváth–Szabó arXiv:math/0512286v2: Definition 3.1 (balanced `ℓ`-pointed diagrams), Proposition 3.3 (moves), Lemma 4.3 (`∂⁻` is a differential), Theorem 4.4 (invariance), Theorem 4.5 ("The complex `CF̂(Σ,α,β,w)` calculates `HF̂(Y#(#^{ℓ−1}(S²×S¹)))`"), Theorem 4.7 (link filtration), and §5 ("A much simpler approach can be given using Lipshitz's cylindrical reformulation … We turn to this approach").
  - OSS arXiv:0912.0830v3, appendix: Theorem 10.2 (`H_*(CF̂(D)) ≅ HF̂(Y) ⊗ (𝔽⊕𝔽)^{b(D)−1}`) and the proof of Theorem 10.3, items (1)–(4).
  - MOS arXiv:math/0607691v2: Proposition 2.3 and Theorem 1.1 ("`H_*(C(Γ),∂)` is isomorphic to the bigraded group `HFK̂(K) ⊗ V^{⊗(n−1)}`").

### Fix
**Note for the Tau Ceti maintainer.** Replace Lane F5 (lines 244–254, from "### Lane F5: beyond" to "nothing here needs them.") with (this includes /98 and /108):
> ### Lane F5: beyond (far horizon, named so nobody mistakes the scope)
>
> ⚠ Polyfolds and virtual techniques stay off this roadmap: nothing here needs them.
>
> 1. **Lipshitz's cylindrical reformulation** ([arXiv:math/0502404](https://arxiv.org/abs/math/0502404) **with** the erratum [arXiv:1301.4919](https://arxiv.org/abs/1301.4919)), with varying source curves and SFT/Bourgeois–Eliashberg–Hofer–Wysocki–Zehnder compactness ([arXiv:math/0308183](https://arxiv.org/abs/math/0308183)). It proves the index formula `Mas(φ) = e(D(φ)) + n_x(D(φ)) + n_y(D(φ))` (Corollary 4.10); the erratum (its §1.2) repairs the proof, a gap found by Pardon. F4.5 and Reconciliation R.1 take the formula from here.
> 2. **Multi-pointed Heegaard Floer and link Floer homology** (Ozsváth–Szabó, [arXiv:math/0512286](https://arxiv.org/abs/math/0512286), §§3–6):
>    - balanced `ℓ`-pointed diagrams (Definition 3.1) and their moves (Proposition 3.3);
>    - `CF⁻` over `𝔽[U₁, …, U_ℓ]` with `∂² = 0` (Lemma 4.3), and its invariance (Theorem 4.4);
>    - `CF̂` computes `HF̂(Y # (#^{ℓ−1}(S² × S¹)))` (Theorem 4.5), that is `HF̂(Y) ⊗ (𝔽 ⊕ 𝔽)^{ℓ−1}` ([arXiv:0912.0830](https://arxiv.org/abs/0912.0830), Theorem 10.2);
>    - the link filtration (Theorem 4.7);
>    - the analytic input (§5): gluing across a connected sum of diagrams, done in item 1's cylindrical setting.
>
>    Knot Floer homology via doubly-pointed diagrams is the one-component case. With `k` pairs of basepoints it gives `HFK̂(K) ⊗ V^{⊗(k−1)}` (Manolescu–Ozsváth–Sarkar, [arXiv:math/0607691](https://arxiv.org/abs/math/0607691), Proposition 2.3). This item is what Reconciliations R.1 and R.3 are stated against.
> 3. **Surgery formulas:** the Manolescu–Ozsváth link surgery formula ([arXiv:1011.1317](https://arxiv.org/abs/1011.1317)) and Zemke's bordered link-surgery modules ([arXiv:2109.11520](https://arxiv.org/abs/2109.11520)), over the completed `HF⁻` of F4.5. These are the inputs of Reconciliation R.2.
> 4. **Bordered Floer homology** ([arXiv:0810.0687](https://arxiv.org/abs/0810.0687)), through item 1.

R.1 and R.3 are restated in /115's Lane R, with these dependencies.

**Edges** (in /116), each to a stage created by this edit:
- `…#milestone-f5-1 → …#milestone-f5-2`;
- `…#milestone-f4-4 → …#milestone-f5-2`, since OS §6 adapts the single-pointed proofs;
- `…#milestone-f5-2 → …#milestone-r-1`;
- `…#milestone-f5-2 → …#milestone-r-3`;
- `…#milestone-f5-1 → …#milestone-r-1`.

### Not done, and why
- MOS's "simply blocked form without the `V` factors", which the red team's fix asks to state, is not in the parts of MOS I read (Theorem 1.1, Proposition 2.3, §3, Theorems 3.3 and 3.5). It is left out rather than stated unsourced.
- Sarkar–Wang (arXiv:math/0607777v4) was checked by id only; R.1 cites OSS Proposition 6.10, which OSS prove after Sarkar–Wang.

## /100 (high, missing): nothing links a diagram to a 3-manifold; state v3 for diagrams modulo moves and propose one owner

### What the verifier corrected
Nothing; confirmed.

### State on main (31403074)
- End goal, lines 49–50: "**v3 (the long game, analytic).** Morse homology; Lagrangian Floer homology of exact Lagrangians; `HF̂(Y)` over 𝔽₂ via holomorphic disks in `Sym^g(Σ)`."
- F4, lines 220–222: "Ozsváth–Szabó ([arXiv:math/0101206](https://arxiv.org/abs/math/0101206)) §§2–4 over 𝔽₂, consuming Lanes F0–F3 and the diagram combinatorics of the combinatorial roadmap's Lane H.1:".
- CHF Lane H: "put the identification with smooth 3-manifolds in a separable reconciliation target (which the analytic roadmap's Morse theory will eventually feed)".
- GeometricTopology Layer 9 plans "the **Heegaard splitting** of a closed 3-manifold" and genus, with no attaching circles.
- Lane M plans Morse homology only.
- OS Proposition 2.2 (read): "Any two Heegaard diagrams … which specify the same three-manifold are diffeomorphic after a finite sequence of Heegaard moves", with "Most of Proposition 2.2 follows from the usual handle calculus". Proposition 7.1 is its pointed form.
- JTZ arXiv:1210.4996v4 has §4 "Singularities of smooth functions", §5 "Generic 1- and 2-parameter families of gradients", §6 "Translating bifurcations of gradients to Heegaard diagrams", and Appendix A "The 2-complex of handleslides" ("The complex `X_2(B)` is connected and simply-connected").

### Fix
**Note for the Tau Ceti maintainer.**
1. **Lines 49–50.** Replace the v3 bullet with:
   > - **v3 (the long game, analytic).** Morse homology; Lagrangian Floer homology of exact Lagrangians; `HF̂` over 𝔽₂ via holomorphic disks in `Sym^g(Σ)`, first as an invariant of pointed Heegaard diagrams modulo pointed Heegaard moves, and as `HF̂(Y)` once the existence of pointed diagrams and pointed Reidemeister–Singer have an owner (see Lane F4).
2. **Lines 220–222.** Replace the paragraph under "### Lane F4" (from "Ozsváth–Szabó" to "Lane H.1:") with (this includes /109 and /117):
   > Ozsváth–Szabó ([arXiv:math/0101206](https://arxiv.org/abs/math/0101206), v4) over 𝔽₂: definitions in §§2–4, invariance in §§5–10, assembled in §11. The lane consumes Lanes F0–F3. From the combinatorial roadmap's Lane H.1 it imports the diagram combinatorics: generators, domains, periodic domains, admissibility, and the combinatorial index `μ(D) = e(D) + n_x(D) + n_y(D)` as a definition.
   >
   > ⚠ No layer yet links a diagram to a smooth 3-manifold. Missing are:
   > - the existence of pointed Heegaard diagrams;
   > - pointed Reidemeister–Singer: any two pointed diagrams of `Y` are related by pointed Heegaard moves (OS Propositions 2.2 and 7.1, by handle calculus and Cerf theory);
   > - a Morse function compatible with a diagram, used to define `s_z` (F4.2);
   > - the Cerf-theoretic inputs of naturality (Juhász–Thurston–Zemke, [arXiv:1210.4996](https://arxiv.org/abs/1210.4996), §§4–6 and Appendix A).
   >
   > Until an owner exists, v3's invariance theorem is stated for pointed diagrams modulo the named moves, as the combinatorial roadmap's Lane H does.

**Atlas side: a proposed owner.** The most foundational owner is an extension of GeometricTopology: "Geometric topology and the solved Kirby-list problems, Part II: handle decompositions, Heegaard diagrams and Cerf theory". Its first prerequisite is GeometricTopology (Layers 1 and 9), and it consumes HeegaardFloer Lane M's Morse functions. It would own:
1. the existence of pointed Heegaard diagrams, from self-indexing Morse functions or from Layer 9's splittings;
2. pointed Reidemeister–Singer (OS Propositions 2.2 and 7.1), through Cerf's one-parameter theory;
3. JTZ's topological inputs (§§4–6; Appendix A's simply connected 2-complex of handleslides);
4. the handle decompositions of 4-dimensional cobordisms up to handle moves that /105 needs.

Its consumers are HeegaardFloer F4.2, F4.4 and F4.5, and CombinatorialHeegaardFloer H.3. This report cannot create the roadmap. It is recorded here for the atlas maintainer as the owner that the notes above point to.

**Edge** (in /116), until the Part II exists: `tauceti:TauCetiRoadmap/GeometricTopology#layer-9-heegaard-splittings-and-heegaard-genus → …#lane-f4-heegaard-floer-homology-holomorphically`, confidence `inferred`. It is acyclic, also together with /87's candidate `…#milestone-m-1 → GeometricTopology#layer-9-…`.

### Not done, and why
- The Part II is not designed here; that is a design job's work.
- Cerf's theory, Gompf–Stipsicz and JTZ §§4–6 were read only through JTZ's outline and section titles.

## /101 (high, error): Lane O, the orientation-and-degree API that AlgebraicTopology assigns to this roadmap

### What the verifier corrected
Nothing; confirmed. The review re-ran the library searches: Mathlib `082e2d3` has no orientation of a manifold and no degree of a map.

### State on main (31403074)
- AlgebraicTopology README: "The [Heegaard Floer roadmap](../HeegaardFloer/README.md) owns the Mathlib-compatible manifold orientation and degree API. This roadmap consumes it to construct integral fundamental classes". Its Stage 6: "Its manifold statements also consume the orientation-and-degree API owned by Heegaard Floer", and item 5: "the shared manifold degree … do not define a competing degree invariant".
- HF README line 124 only lists "manifold orientations and degree theory" as missing. No HF stage plans them.
- At the pins:
  - Mathlib has orientations of modules only: `abbrev Orientation := Module.Ray R (M [⋀^ι]→ₗ[R] R)` (`Mathlib/LinearAlgebra/Orientation.lean:51`).
  - The declaration index has no manifold-orientation or map-degree declaration in either library.
  - Tau Ceti's Morse–Sard theorem is `ContDiff.addHaar_image_criticalPoints_eq_zero` (`TauCeti/Analysis/Calculus/Sard/OutermostStratum.lean:372`): for `f : E → F` between finite-dimensional real normed spaces, `ContDiff ℝ n f` with `finrank E * finrank E + 1 ≤ n` gives `ν (f '' {x | ¬ Surjective (fderiv ℝ f x)}) = 0`.

### Fix
**Note for the Tau Ceti maintainer.** Insert before "### Lane M: Morse homology (Stage 0)" (line 140):
> ### Lane O: manifold orientations and degree
>
> Owned here: the algebraic-topology roadmap assigns this API to this roadmap and consumes it for fundamental classes, duality and the shared manifold degree (its Stage 6), and geometric topology's oriented connected sum (Layer 1) needs it too. Mathlib has orientations of modules (`Orientation`, `Mathlib/LinearAlgebra/Orientation.lean`) but none of manifolds, and no degree of a map.
>
> 1. **Orientations.**
>    - An orientation of a finite-dimensional real manifold with boundary or corners (a `ModelWithCorners` manifold) as a continuous choice of `Orientation ℝ (TangentSpace I x) (Fin n)`.
>    - Orientation-preserving diffeomorphisms; the product orientation.
>    - The boundary orientation, outward normal first, agreeing with geometric topology's collars.
>    - Orientations of the unstable manifolds that Lane M needs for ℤ coefficients.
> 2. **Degree.**
>    - The degree of a proper smooth map between oriented boundaryless manifolds of the same dimension, as the signed count of preimages of a regular value.
>    - Its independence of the regular value, and invariance under proper homotopy.
>    - The regular-value step uses Morse–Sard, which Tau Ceti has on finite-dimensional normed spaces (`ContDiff.addHaar_image_criticalPoints_eq_zero`, for `C^n` maps with `n ≥ (dim E)² + 1`), transported through charts.
>    - The homological characterization of the degree is the algebraic-topology roadmap's (Stage 6), which defines no competing degree.

Line 124's "manifold orientations and degree theory" then points to Lane O; see /114's Inventory text.

**Edges** (in /116), all from stages created by this edit:
- `…#milestone-o-1 → …#milestone-o-2`;
- `…#milestone-o-1 → AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`;
- `…#milestone-o-2 → AlgebraicTopology#stage-6-…`;
- `…#milestone-o-1 → GeometricTopology#layer-1-manifold-library-buildout-general-dimension-general-structure-group`;
- `…#milestone-o-1 → …#milestone-m-1`.

All are acyclic in the combined check. Lane O's placement ahead of Lane M keeps AlgebraicTopology's ownership sentence true without change.

### Not done, and why
- The degree theorem is stated without a source read here; Milnor's and Guillemin–Pollack's texts are not public. The maintainer should fix the reference.
- Neither library has Sard on manifolds, so the chart transport is itself work.

## /102 (high, error): F1.2 states the Calderón–Zygmund inequality with its hypotheses

### What the verifier corrected
Nothing; confirmed. `u ≡ 1` is decisive, and both missing hypotheses are the right ones.

### State on main (31403074)
- F1.2, lines 177–179: "The Calderón–Zygmund inequality `‖u‖_{W^{1,p}} ≤ C‖∂̄u‖_{L^p}` via the Cauchy kernel; interior elliptic bootstrapping; **boundary regularity for totally real boundary conditions** (Schwarz reflection)." The stage `…#milestone-f1-2` has the same text.
- Wendl, arXiv:1011.1690v2 (PDF "Version 3.2"; read):
  - Theorem 2.62 (p. 49): "For each `p ∈ (1,∞)`, there is a constant `c > 0` such that for every `u ∈ C₀^∞(B,ℂⁿ)`, `‖u‖_{W^{1,p}} ≤ c‖∂̄u‖_{L^p}`".
  - Exercise 2.63 (p. 50) extends it to `W^{k,p}_0(B)` by density.
  - Proposition 2.64 (p. 50): "Suppose `u ∈ W^{1,p}(B,ℂⁿ)` and `∂̄u ∈ W^{k,p}(B,ℂⁿ)` for some `p ∈ (1,∞)`. Then … `‖u‖_{W^{k+1,p}(B_r)} ≤ c‖u‖_{W^{k,p}(B)} + c‖∂̄u‖_{W^{k,p}(B)}`".
  - Lemma 2.69 (p. 53) gives the `L^p` bounds, for `p ∈ (1,∞)`, of the Cauchy transform `T` and of `Π = ∂T`, "complete proofs … [MS04, Appendix B]".
- PDE Lane B.10 warns: "A CZ operator is **not** bounded on `L¹` or `L^∞`".

### Fix
**Note for the Tau Ceti maintainer.** Replace item 2 of Lane F1 (lines 177–179) with:
> 2. The Calderón–Zygmund inequality, with its hypotheses:
>    - (a) for `1 < p < ∞` there is `c_p` with `‖u‖_{W^{1,p}} ≤ c_p‖∂̄u‖_{L^p}` for all `u ∈ C₀^∞(B, ℂⁿ)`, `B` the unit disk, and hence for `u ∈ W^{1,p}_0(B)` by density (Wendl, [arXiv:1011.1690](https://arxiv.org/abs/1011.1690), Theorem 2.62 and Exercise 2.63). It comes from the `Lᵖ`-boundedness of the Cauchy transform `T` and of `∂T` (Wendl, Lemma 2.69; McDuff–Salamon, Appendix B).
>    - (b) the interior estimate with a lower-order term, `‖u‖_{W^{1,p}(B_r)} ≤ c(‖∂̄u‖_{L^p(B)} + ‖u‖_{L^p(B)})` for `r < 1`, by a cutoff, and its higher-order form (Wendl, Proposition 2.64). Then interior elliptic bootstrapping.
>    - (c) **boundary regularity for totally real boundary conditions** (Schwarz reflection): the same estimate on a half-disk, again with the lower-order term.
>
>    ⚠ Neither hypothesis of (a) can be dropped. Any holomorphic `u`, for instance `u = 1`, has `∂̄u = 0` (keep it as a regression test). The operators behind (a) are unbounded on `L¹` and `L^∞` (the PDE roadmap's B.10 warning).

**Edge** (in /116): `tauceti:TauCetiRoadmap/ConformalMapping#milestone-l4--analytic-continuation--the-reflection-principle → …#milestone-f1-2`, for Schwarz reflection; AUDIT-05 already records F1.2 as L4's consumer. The PDE → F1 edges are RT-AREA-pde/11 and /33 and are not repeated.

### Not done, and why
- McDuff–Salamon could not be fetched here: the author's server answered 403, and the book is not otherwise public. Wendl's public notes stand in for (a) and (b).
- The half-disk statement (c) is unsourced here. For the linear boundary condition `u(ℝ) ⊂ ℝⁿ` it reduces to (b) by the reflection `ũ(z) = conj u(z̄)`, for which `∂̄ũ(z) = conj((∂̄u)(z̄))`. The general totally real case should be stated from McDuff–Salamon Appendix B by the maintainer.

## /103 (medium, missing): symplectic manifolds wait on differential forms on manifolds, which nothing plans

### What the verifier corrected
Nothing; confirmed at the pin.

### State on main (31403074)
- F2.1, lines 189–191: "**Definitions land immediately** (almost nothing to wait for): almost complex structures, tame/compatible `J`, symplectic manifolds, `J`-holomorphic maps, energy. Even Darboux/Moser are self-contained early targets."
- Inventory, lines 122–123: "almost complex structures and symplectic manifolds (*even the definitions*, which can land immediately)".
- "How to drive it", lines 334–336: "and so do the bare symplectic/almost-complex definitions of F2.1; none of them waits for the".
- At the pins:
  - Mathlib's `Mathlib/Analysis/Calculus/DifferentialForm/Basic.lean` is headed "Exterior derivative of a differential form on a normed space", with the TODO "same for manifolds (not defined yet)".
  - Tau Ceti's `TauCeti/Geometry/Symplectic/Manifold/TwoForm.lean`: "Closedness is not included: the pinned Mathlib has no exterior derivative of manifold differential forms."
  - Built: `SmoothTwoForm` (`TauCeti/Geometry/Manifold/TwoForm.lean:60`); `SmoothTwoForm.IsNondegenerate`, `Tames`, `Compatible` (`Geometry/Symplectic/Manifold/TwoForm.lean:63, 101, 144`); `SmoothAlmostComplexStructure` (`…/Manifold/AlmostComplex.lean:67`); `IsPseudoholomorphic` (`…/Manifold/JHolomorphic.lean:103`); `SmoothTwoForm.stdComplexLineEnergy` (`…/Manifold/Energy.lean:373`).
- No atlas stage plans `d`, pullback or Stokes on manifolds.

### Fix
**Note for the Tau Ceti maintainer.**
1. **F2.1.** Replace item 1 of Lane F2 (lines 189–191) with:
   > 1. **Definitions.**
   >    - Almost complex structures, tame/compatible `J`, `J`-holomorphic maps and energy land immediately. Tau Ceti has `SmoothAlmostComplexStructure`, `SmoothTwoForm` with `IsNondegenerate`, `Tames` and `Compatible`, `IsPseudoholomorphic`, and the energy `stdComplexLineEnergy`.
   >    - A **symplectic manifold** (a closed nondegenerate two-form), exactness `ω = dλ` and `λ|_L = df`, Moser and Darboux wait on differential forms on manifolds: the exterior derivative with `d² = 0`, pullback, the Cartan formula, integration of top forms on oriented manifolds (Lane O) and Stokes' theorem on manifolds with corners.
   >    - ⚠ None of these exists (Mathlib's exterior derivative is on normed spaces only), and no roadmap in the atlas plans them. F3's action–energy identity needs Stokes on the strip.
2. **"How to drive it", lines 334–336.** Replace "and so do the bare symplectic/almost-complex definitions of F2.1" with "and so do the almost-complex and pseudoholomorphic definitions of F2.1 (symplectic manifolds wait on differential forms on manifolds)".
3. **Inventory:** see /114.

**Owner (one line for the other side).** Differential forms on manifolds, `d`, pullback, Cartan and Stokes should be planned once, in the most foundational manifold layer: GeometricTopology Layer 1 is the natural home. If its maintainer declines, the atlas needs a new roadmap, "Differential forms and Stokes' theorem on manifolds". Either way the consumers are HeegaardFloer F2.1 and F3, ArithmeticLocallySymmetricSpaces:ALS.5 and AutomorphicFormsOnReductiveGroups:AF.1a.

No edge is recorded, since there is no supplier stage yet.

### Not done, and why
- No owner can be chosen by this job: it is a cross-roadmap decision for the Tau Ceti maintainer, or a new atlas roadmap.

## /104 (medium, missing): F4.2 names the inputs of `Spin^c` structures and `s_z`

### What the verifier corrected
Nothing; confirmed. Lemma 2.19 is `lemma:VarySpinC` and Definition 4.10 is `def:NonTorsionAdmissible`; I get the same numbering.

**One refinement, from the source.** Definition 4.10 states *both* strong and weak admissibility through `⟨c₁(s), H(D)⟩`. So `c₁(s)` enters v3 too for non-torsion `s`, not only the non-hat flavors; Remark 4.11 notes that for torsion `c₁(s)` the two coincide.

### State on main (31403074)
- F4.2, lines 228–230: "**Spin^c structures** (Turaev's vector-field model) and `s_z`; domains and the combinatorial Maslov index (Lipshitz's formula `e(D) + n_x(D) + n_y(D)`, stateable now, against F1.3 later)."
- OS §2.6 (read):
  - "Fixing an ortho-normal trivialization `τ` of the tangent bundle `TY` … it follows from elementary obstruction theory that the assignment which associates to a map from `Y` to `S²` the pull-back of `μ` induces an identification between the space of homology classes of maps from `Y` to `S²` and the cohomology group `H²(Y;ℤ)` … `w` is the generator of `H²(SO(3);ℤ) ≅ ℤ/2`".
  - `s_z` is defined from "a Morse function `f` on `Y` compatible with the attaching circles", by extending `grad f` "as a nowhere vanishing vector field over `Y`".
  - Lemma 2.19: `s_z(y) − s_z(x) = PD[ε(x,y)]`.

### Fix
**Note for the Tau Ceti maintainer.** Replace item 2 of Lane F4 (lines 228–230) with (this includes /108 and /109):
> 2. **Spin^c structures** (Turaev's vector-field model) and `s_z` (OS §2.6), with their inputs named:
>    - a trivialization of `TY`, which OS §2.6 fixes;
>    - the identification, by elementary obstruction theory, of homology classes of maps `Y → S²` with `H²(Y; ℤ)`, and `H²(SO(3); ℤ) ≅ ℤ/2` for independence of the trivialization. Together they make `Spin^c(Y)` an `H²(Y; ℤ)`-torsor. These are owned here unless the algebraic-topology roadmap takes them.
>    - a Morse function compatible with the diagram (see the ⚠ at the head of this lane), and the extension of a nonvanishing vector field over balls;
>    - Poincaré duality, for `s_z(y) − s_z(x) = PD[ε(x, y)]` (OS Lemma 2.19): the algebraic-topology roadmap's Stage 6;
>    - `c₁(s)`, the Euler class of the orthogonal plane field: geometric topology's Layer 10. It enters weak and strong admissibility alike (OS Definition 4.10).
>
>    Domains, periodic domains and the combinatorial index `μ(D) = e(D) + n_x(D) + n_y(D)` are the combinatorial roadmap's (Lane H.1); this item does not redefine them. The theorem that `μ` computes the Maslov index, `Mas(φ) = μ(D(φ))`, is Lipshitz's (Lane F5.1). F4's definitions do not need it, since the differential counts classes of analytic index one (F1.3); its consumers, F4.5's triangle computations and Reconciliation R.1, take it from F5.1. Sarkar ([arXiv:math/0609673](https://arxiv.org/abs/math/0609673), §4) extends it to Whitney `n`-gons in `Sym^g` by induction from the bigon case. His base case is Lipshitz's theorem, so he gives no second proof of it.

**Edges** (in /116):
- `AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality → …#milestone-f4-2`;
- `GeometricTopology#layer-10-foliations-and-their-euler-class → …#milestone-f4-2`;
- `…#milestone-f4-1 → …#milestone-f4-2`;
- `…#milestone-f4-2 → …#milestone-f4-3`, since admissibility uses `c₁(s)`.

### Not done, and why
- "Closed oriented 3-manifolds are parallelizable" (Stiefel) is not stated as a theorem, because no source for it was read here. The note names only what OS §2.6 uses: a fixed trivialization.

## /105 (medium, missing): F4.5 names its four-dimensional input, the absolute grading and the flavors

### What the verifier corrected
Nothing; confirmed. 8.2 is `prop:HomologyOfX`, 8.4 `prop:AssocSpinC` and 8.5 `prop:SpinCForTriangles`, as I also compute.

### State on main (31403074)
- F4.5, lines 239–242: "**Then, staged:** orientation systems and ℤ; `HF^±`, `HF^∞` (boundary degenerations now matter: OS Theorem 3.15); holomorphic triangles and cobordism maps; surgery exact triangles; `d`-invariants; naturality (JTZ) as the capstone. Each is its own milestone; none blocks v3."
- Sources read:
  - OS arXiv:math/0110169v2 Theorem 7.1: an absolute grading for torsion `Spin^c` structures, with "`gr(F_{W,s}(ξ)) − gr(ξ) = (c₁(s)² − 2χ(W) − 3σ(W))/4`".
  - OS arXiv:math/0110170v2: Definition 4.1 ("Let `Y` be a rational homology three-sphere. The correction term `d(Y,t)` is the minimal grading …") and Definition 4.9 (`d_{±1/2}` when `H₁(Y₀;ℤ) ≅ ℤ`).
  - OS arXiv:math/0101206v4: Example 8.1 and Propositions 8.2, 8.4, 8.5.

### Fix
**Note for the Tau Ceti maintainer.** Replace item 5 of Lane F4 (lines 239–242) with (this includes /97, /111 and /112; triangles have moved to F4.4 by /96):
> 5. **Then, staged** (each its own milestone; none blocks v3):
>    - orientation systems and ℤ coefficients (ℤ-naturality: see the last bullet);
>    - `HF^±`, `HF^∞` (boundary degenerations now matter: OS Theorem 3.15), with their stabilization invariance (OS Theorem 10.2), which needs F2.6's neck stretching;
>    - the **`U`-completed `HF⁻`** over `𝔽₂[[U]]` as its own flavor. The uncompleted `HF⁻` "is functorial under cobordisms equipped with `Spin^c` structures, but it is not functorial under cobordisms per se, whereas the completed version is" (Manolescu–Ozsváth, [arXiv:1011.1317](https://arxiv.org/abs/1011.1317), Introduction);
>    - **four-dimensional input, named.** Owned here: the 4-manifold `X_{α,β,γ}` of a Heegaard triple, its homology (OS Proposition 8.2), and the map `s_z` from triangle classes to `Spin^c(X)` (Propositions 8.4–8.5). Imported: `Spin^c` structures on 4-manifolds (an `H²`-torsor, with `c₁`); the signature of an oriented 4-manifold with boundary, from the algebraic-topology roadmap's intersection pairing (Stage 6); and handle decompositions of cobordisms up to handle moves, which no layer plans yet and which belong with the handle calculus of the ⚠ at the head of this lane;
>    - **cobordism maps** `F_{W,s}`, indexed by `Spin^c(W)`, built from the triangle maps of F4.4; the uncompleted `HF⁻` only for `Spin^c`-decorated cobordisms;
>    - **surgery exact triangles**, by flavor: for `HF⁺` ([arXiv:math/0105202](https://arxiv.org/abs/math/0105202), Theorems 9.1 and 9.12) and `HF̂` (Theorem 9.16), with twisted coefficients (Theorem 9.21), and for the completed `HF⁻` (Manolescu–Ozsváth, Proposition 11.5, framed links in integral homology spheres). Their proofs glue triangles across `Σ # E` (Theorem 9.4), F2.6's neck stretching; the Maslov index of the triangles is Sarkar's formula (F4.2, F5.1);
>    - the **absolute ℚ-grading** for torsion `Spin^c` structures, fixed through the cobordism maps by `(c₁(s)² − 2χ(W) − 3σ(W))/4` (OS [arXiv:math/0110169](https://arxiv.org/abs/math/0110169), Theorem 7.1);
>    - then the **`d`-invariant** of a rational homology sphere (OS [arXiv:math/0110170](https://arxiv.org/abs/math/0110170), Definition 4.1), with `d_{±1/2}` for `H₁ ≅ ℤ` (Definition 4.9) as a separate target;
>    - **naturality** as the capstone, in the form proved: functors `HF̂, HF⁻, HF⁺, HF^∞ : Man_* → 𝔽₂[U]-Mod` on based 3-manifolds (Juhász–Thurston–Zemke, [arXiv:1210.4996](https://arxiv.org/abs/1210.4996), §1.2). Over ℤ the published statement is projective: functors to transitive systems in `P(ℤ[U]-Mod)`, maps well defined up to sign (Gartner, [arXiv:1908.06237](https://arxiv.org/abs/1908.06237), Theorem 1.1). Naturality over ℤ without the sign is not a target.

**Other sides, one line.** 4-dimensional handle calculus goes to the GeometricTopology Part II proposed in /100, whose Layers 1 and 6 already plan handle attachment and the cobordism category. ArithmeticQuantumTopology:QT.0 plans a Kirby move theorem for surgery presentations; /1 rescopes QT.0, and the Kirby calculus should have one owner with it.

**Edges** (in /116), all to `…#milestone-f4-5`:
- from `GeometricTopology#layer-1-…`, `#layer-5-dehn-surgery` and `#layer-6-knot-concordance-and-4d-cobordism-owned-here`;
- from `AlgebraicTopology#stage-6-…`;
- from `…#milestone-f4-1`, for `c₁` and sphere bubbles (/106);
- from `…#milestone-f2-6` and `…#milestone-f5-1`.

### Not done, and why
- No existing layer plans `Spin^c` structures on 4-manifolds; they are named as an import with the owner left to the Part II decision.

## /106 (medium, missing): F4.1 names the topology of `Sym^g(Σ)` that OS §§2–3 use

### What the verifier corrected
Nothing; confirmed. Every reference resolves (Lemma 2.6, Proposition 2.7, Lemma 2.8, Proposition 2.15, Remark 2.16, Lemma 3.3), as I also compute. Lemma 3.6 is `lemma:Correspondence` and Proposition 3.9 is `prop:MoveToriTransversality`.

### State on main (31403074)
- F4.1, lines 224–227: "**`Sym^g(Σ)` geometry:** smooth complex structure (elementary symmetric functions), the totally real tori `T_α`, `T_β`, `π₂ ≅ ℤ` for `g > 2`, the basepoint divisor and positivity `n_z(φ) ≥ 0`. ⚠ `T_α` is only ever needed *totally real* (with a taming form); do not chase Lagrangian-ness."
- OS's proof of Proposition 2.7 (read) identifies `Sym^g(ℂ − {z₁,…,z_{2g}})` with "the space of monic degree `g` polynomials", that is "`ℂ^g` minus `2g` generic hyperplanes", and then uses "A theorem of Hattori". For `g = 2`, "`Sym²(Σ)` is diffeomorphic to the blowup of `T⁴`".
- At the pin:
  - `TauCeti.Sym.coeffHomeomorph : Sym K n ≃ₜ (Fin n → K)` (`TauCeti/Analysis/Polynomial/SymmetricPower.lean:262`) is that monic-polynomial chart;
  - `TauCeti.symChartedSpace` (`TauCeti/Geometry/Manifold/SymmetricPower.lean:258`) is a charted space only. Its module doc: "Upgrading it to a *complex* manifold … is the next step of Lane F4.1 and is not done here; so are the totally real tori".

### Fix
**Note for the Tau Ceti maintainer.** Replace item 1 of Lane F4 (lines 224–227) with (this includes /96's restriction of the warning):
> 1. **`Sym^g(Σ)` geometry:** smooth complex structure (elementary symmetric functions; Tau Ceti has the charted space `TauCeti.symChartedSpace` and the chart `TauCeti.Sym.coeffHomeomorph`), the totally real tori `T_α`, `T_β`, the basepoint divisor and positivity `n_z(φ) ≥ 0`, and the topology that OS §§2–3 use before any count is defined:
>    - `π₁(Sym^g(Σ)) ≅ H₁(Sym^g(Σ)) ≅ H₁(Σ)` (OS Lemma 2.6), for `ε(x, y)` and the `Spin^c` splitting;
>    - `π₂'(Sym^g(Σ)) ≅ ℤ` for `g > 1`, where `π₂'` is `π₂` modulo the `π₁`-action, and `π₂ ≅ ℤ` for `g > 2` (OS Proposition 2.7); genus-2 diagrams need the `π₂'` form. The proof identifies `Sym^g(ℂ − {2g points})` with monic polynomials, which is Tau Ceti's chart above, and then uses Hattori's theorem on complements of generic hyperplanes;
>    - `c₁(Sym^g(Σ_g)) = U − Σᵢ μ(Aᵢ)μ(Bᵢ)` (OS Lemma 2.8, from Macdonald), or at least `⟨c₁, [S]⟩ = 1`. This gives `Mas(φ + k[S]) = Mas(φ) + 2k` (OS Lemma 3.3), which F4.5's sphere bubbles need;
>    - `π₂(x, x) ≅ ℤ ⊕ H¹(Y; ℤ)` for `g > 1` (OS Proposition 2.15). For `g = 1` only injectivity of `π₂(x, y) → ℤ ⊕ H¹(Y; ℤ)` holds (Remark 2.16), and the genus-1 acceptance checks use exactly this case;
>    - the tautological correspondence between holomorphic disks and branched `g`-fold covers of the strip (OS Lemma 3.6), and transversality for `Sym^g(j)` on `α`-injective classes (OS Proposition 3.9); F4.4's polygon counts use both.
>
>    ⚠ On the Ozsváth–Szabó route `T_α` is only ever needed *totally real* (with a taming form); do not chase Lagrangian-ness there. Routes through Lagrangian Floer theory need Kähler forms that make `T_α` Lagrangian (Perutz, [arXiv:0801.0564](https://arxiv.org/abs/0801.0564), Proposition 1.1 and §7). These are Perutz's handleslides (F4.4) and the symplectic form used in the appendix of [arXiv:0912.0830](https://arxiv.org/abs/0912.0830).

**Edges** (in /116): `…#milestone-f4-1 → …#milestone-f4-2` and `…#milestone-f4-1 → …#milestone-f4-5`.

### Not done, and why
- Macdonald's and Hattori's papers were not read; the note cites them as OS does.

## /107 (medium, missing): the polygon counts get a home in F4.4, and ConformalMapping supplies them

### What the verifier corrected
Nothing; confirmed. `TauCeti/Analysis/Complex/Conformal/RiemannMapping/Existence.lean:69` exists at the pin.

### State on main (31403074)
- Line 37 claims "no Riemann mapping theorem". No layer plans the odd-count lemma.
- OSS appendix, proof of Theorem 10.3, item (4) (read): "in the case where `D` is a polygon, `#(M(D)/ℝ) = 1 (mod 2)`, see [KT, Rasmussen]"; [KT] is Ozsváth–Szabó, *Knot Floer homology, genus bounds, and mutation*, Topology Appl. 141 (2004).
- MOS §3 (read): "the number of pseudo-holomorphic representatives of `r` is odd … the moduli space `M(r)/ℝ` can be seen to correspond to involutions of `r` … which switch opposite sides of the rectangle. It is a simple exercise in conformal geometry that for any rectangle, there is a unique such involution."
- At the pin:
  - `TauCeti.riemannMapping` (`RiemannMapping/Existence.lean:69`): for open simply connected `Ω ≠ univ`, there is `f` with `BijOn f Ω (ball 0 1)`, `DifferentiableOn ℂ f Ω` and nonvanishing derivative.
  - `TauCeti.exists_homeomorph_closedBall_closure_of_isJordanCurve_frontier` (`TauCeti/Analysis/Complex/Conformal/Jordan/Approach.lean:213`): for `Ω` open, simply connected and bounded with Jordan-curve frontier, the Riemann map extends to a homeomorphism `closedBall 0 1 ≃ₜ closure Ω`.
  - `data/library-coverage.json` records ConformalMapping L3 "built" and L5 "partly built".

### Fix
**Note for the Tau Ceti maintainer.** The polygon counts are the last bullet of F4.4 (full text in /96). Line 37 is corrected in /97's replacement of lines 36–40. Acceptance and Reconciliations R.1 and R.3 cite F4.4 (/113, /115).

**Edges** (in /116):
- `tauceti:TauCetiRoadmap/ConformalMapping#milestone-l3--the-riemann-mapping-theorem-summit → …#milestone-f4-4`;
- `tauceti:TauCetiRoadmap/ConformalMapping#milestone-l5--carathéodory-boundary-correspondence → …#milestone-f4-4`;
- `…#milestone-f4-4 → …#milestone-r-1`;
- `…#milestone-f4-4 → …#milestone-r-3`.

### Not done, and why
- The red team's "immersed bigon" case for genus one has no source among those read (OSS and MOS treat embedded polygons), so the note states only embedded bigons and rectangles.
- [KT] and Rasmussen's thesis were not read.
- The coverage verdict "partly built" for L5 predates `Approach.lean:213`. The mismatch is for the ConformalMapping audit, not this job; axiom-freeness of that theorem was not checked, since Lean tools were not used.

## /108 (medium, missing): the index formula's proof route is Lipshitz's, in F5; Sarkar extends it to n-gons but does not replace it

### What the verifier corrected
The review endorses naming Sarkar's `Sym^g` proof as an alternative that "also serves F4.5's triangles". **Reading Sarkar shows that it is not an independent proof for bigons.** The proof of the main theorem in §4 of arXiv:math/0609673v4 is an induction on `n`: "The case for `n=2` is a theorem of Robert Lipshitz [Corollary 4.10], which was also partially proved by Jacob Rasmussen in [Theorem 9.1]".

So:
- Sarkar serves F4.5's triangles once the bigon formula is available;
- the bigon formula itself is Lipshitz's Corollary 4.10, in the cylindrical setting, as repaired by the erratum.

The finding's main point stands: F4.2 as planned depends silently on F5 and on the erratum. The fix follows the red team's second option (Lipshitz plus the erratum), placing the theorem in F5.

### State on main (31403074)
- F4.2 (lines 229–230): "the combinatorial Maslov index (Lipshitz's formula `e(D) + n_x(D) + n_y(D)`, stateable now, against F1.3 later)".
- Lipshitz arXiv:math/0502404v2, §4.3 (read): Corollary 4.10, "In Heegaard Floer homology, the Maslov index of a domain `D` is given by `μ(D)=n_x(D)+n_y(D)+e(D)`". Proposition 4.8 notes "It is possible to give a direct proof (see [Rasmussen, proof of Theorem 9.1])".
- Erratum arXiv:1301.4919v1 (read): "a serious gap in the proof of the index formula … discovered by John Pardon"; §1.2: "We can salvage the main result by weakening the conditions in Lemmas 4.1 and 4.9 … and strengthening Proposition 4.2, Corollary 4.3 and the proofs of Propositions 4.8 and Corollary 4.10 to curves with double points."

### Fix
**Note for the Tau Ceti maintainer.**
- The theorem moves to F5.1 (full text in /99). F4.2 keeps the definition as an import from CombinatorialHeegaardFloer H.1, and says who proves what (full text in /104).
- F4.5 cites Sarkar for the triangles (/105).
- `Mas(φ)` equal to the Fredholm index stays in F1.3.

**Edges** (in /116): `…#milestone-f5-1 → …#milestone-f4-5` and `…#milestone-f5-1 → …#milestone-r-1`. There is no `F5 → F4.2` edge, because F4's definitions do not use the formula.

### Not done, and why
- Rasmussen's thesis (Theorem 9.1) was not read. An intrinsic `Sym^g` proof of the bigon formula is therefore not claimed.

## /109 (medium, duplicate): one owner for domains and `μ(D)`: CombinatorialHeegaardFloer H.1; HF F4.2 imports them

### What the verifier corrected
Nothing; confirmed.

A locator note: in arXiv:0912.0830v3 the definition `μ(D) = e(D) + p(D)` (label `eq:MaslovIndex`, before Remark 6.6) is in §6 "The chain complex associated to a nice diagram" by source order, not §5.

### State on main (31403074)
- HF F4.2 plans "domains and the combinatorial Maslov index" (lines 228–230).
- HF F4 (lines 221–222) says it consumes "the diagram combinatorics of the combinatorial roadmap's Lane H.1".
- CHF H.1: "generators, domains, periodic domains, weak/strong **admissibility**"; CHF Lane H: "The diagram combinatorics of H.1 are also the input the analytic roadmap's Lane F4 consumes".

### Fix
**HeegaardFloer side (note for the Tau Ceti maintainer).**
- F4's heading paragraph imports generators, domains, periodic domains, admissibility and `μ(D)` from H.1 (full text in /100).
- F4.2 defines none of them and owns only `s_z` and its inputs; the theorem `Mas = μ` is F5.1's (full text in /104).

**Other side, one line (CombinatorialHeegaardFloer):** CHF H.1 lists the Euler measure for general domains (by corners or Gauss–Bonnet, not only `2n`-gons), the point measure and `μ(D) = e(D) + p(D)` as its definitions.

**Edges** (in /116): `tauceti:TauCetiRoadmap/CombinatorialHeegaardFloer#milestone-h-1 → …#milestone-f4-2` and `CombinatorialHeegaardFloer#milestone-h-1 → …#milestone-f4-3` (admissibility).

### Not done, and why
Nothing further.

## /110 (medium, missing): F3's setting is a Liouville manifold, with `C⁰` bounds first

### What the verifier corrected
Nothing; confirmed.

### State on main (31403074)
- F3, lines 208–216: "Floer's theorem in its cleanest nontrivial generality, and the first genuine Floer homology in any prover: **exact Lagrangians in an exact symplectic manifold** (zero section vs its Hamiltonian image in `T*S¹`, then `T*M`); exactness kills bubbling outright, so F2.3's bubbling analysis is not yet load-bearing. Generators, the action functional, moduli of strips, `∂² = 0` by gluing + compactness, continuation maps, Hamiltonian-isotopy invariance, and `HF(L, φ(L)) ≅ H_*(L)`-type computations in cotangent bundles. ⚠ Skip monotone Floer theory entirely: Heegaard Floer replaces monotonicity with admissibility, so the monotone chapter is a detour on this roadmap."
- Abouzaid arXiv:1312.3354v2 (read):
  - §1.3.3: "On a general open symplectic manifold, the Gromov-Floer procedure may not produce a compactification of the moduli space of holomorphic curves. The issue is that a sequence of such curves could escape to infinity … This can be shown using a standard version of the maximum principle".
  - §5.2.7 treats Riemann surfaces with boundary and Lagrangian conditions: "the maximum principle can be used as long as Neumann conditions are satisfied at the boundary", under "`J_z` is convex near" the level set.
- Tau Ceti has only the linear cotangent model (`cotangentSymplecticForm`, `Geometry/Symplectic/Cotangent/Basic.lean:80`; `neg_extDeriv_cotangentLiouvilleForm`, `Cotangent/Liouville.lean:153`).

### Fix
**Note for the Tau Ceti maintainer.** Replace the F3 paragraph (lines 208–216) with:
> Floer's theorem in its cleanest nontrivial generality, and the first genuine Floer homology in any prover: **closed exact Lagrangians in a Liouville manifold** (an exact symplectic manifold convex at infinity), with almost complex structures of contact type near infinity and compactly supported Hamiltonians. The model is the zero section against its image under a compactly supported Hamiltonian isotopy, in `T*S¹` and then `T*M` with the standard Liouville structure. Exactness `ω = dλ`, `λ|_L = df` needs F2.1's differential forms.
>
> Exactness kills bubbling outright, so F2.3's bubbling analysis is not yet load-bearing. But on a non-compact manifold exactness does not give compactness, since strips can escape to infinity. So the **`C⁰` bounds / maximum principle** for Floer strips come first (Abouzaid, [arXiv:1312.3354](https://arxiv.org/abs/1312.3354), §1.3.3 and §5.2.7).
>
> Then: generators, the action functional, moduli of strips, `∂² = 0` by gluing + compactness, continuation maps, Hamiltonian-isotopy invariance, and `HF(L, φ(L)) ≅ H_*(L)`-type computations, including the comparison with Morse homology for `C²`-small Hamiltonians, which also rests on the `C⁰` bounds.
>
> ⚠ On the Ozsváth–Szabó route, skip monotone Floer theory entirely: Heegaard Floer replaces monotonicity with admissibility (F4.3). Perutz's alternative for handleslides would need it (F4.4).

**Edges** (in /116): `…#milestone-f2-1`, `…#milestone-f2-3`, `…#milestone-f2-4` and `…#milestone-f2-5` → `…#lane-f3-lagrangian-floer-homology-exact-case`.

### Not done, and why
- Abouzaid works with cylinders and cotangent fibres for symplectic cohomology. His passages are cited for the compactness principle and its hypotheses, not for a statement about the zero section.

## /111 (medium, other): the naturality capstone is an 𝔽₂[U] statement; over ℤ only projective naturality is proved

### What the verifier corrected
Nothing; confirmed.

### State on main (31403074)
- F4.5 stages "orientation systems and ℤ" before "naturality (JTZ) as the capstone" (lines 239–242).
- Standing conventions, lines 69–72: "State every 𝔽₂ theorem so the coefficient ring can be generalized without restating the geometry."
- JTZ arXiv:1210.4996v4 §1.2 (read): "There are functors `HF̂, HF⁻, HF⁺, HF^∞ : Man_* → 𝔽[U]-Mod`", with `𝔽 = 𝔽₂` in its macros.
- Gartner arXiv:1908.06237v2 (read):
  - Theorem 1.1: "There are functors `HF̂, HF⁻, HF⁺, HF^∞ : Man_* → Trans(P(ℤ[U]-Mod))`";
  - §4: the ℤ-valued morphism of graphs "may not be a strong Heegaard invariant. We will however be able to establish that [it] satisfies the axioms … up to an overall sign";
  - arXiv comments: "Modified the approach to the main results in section 8, which were not sound".

### Fix
**Note for the Tau Ceti maintainer.**
1. **F4.5's capstone bullet** (full text in /105).
2. **Standing conventions.** Append to the first bullet (after "without restating the geometry.", line 72):
   > ⚠ A ℤ statement is a target only in the form a source proves. Naturality is proved over `𝔽₂[U]` (Juhász–Thurston–Zemke); over ℤ it is proved only projectively, up to sign (Gartner, [arXiv:1908.06237](https://arxiv.org/abs/1908.06237), Theorem 1.1).

### Not done, and why
- Gartner §§5–9 were not read beyond the introduction and the §4 passage.
- Whether sign-exact naturality over ℤ has been proved since is not established here, so the note says "not a target" rather than "open".

## /112 (medium, error): F4.5 says which flavor satisfies what; the completed `HF⁻` is its own flavor

### What the verifier corrected
Nothing; confirmed. Its completion gap is shared with /98.

### State on main (31403074)
- F4.5 lists "`HF^±`, `HF^∞` … holomorphic triangles and cobordism maps; surgery exact triangles" without flavors (lines 239–242).
- OS arXiv:math/0105202v4 §9 (read, numbering computed): Theorem 9.1 (`HF⁺`, "+1 surgeries on an integral homology three-sphere"), 9.12 (`HF⁺`, general), 9.16 (`HF̂`), 9.21 (twisted). The section opens "We consider first the effect on `HF⁺` … We then give analogous results for `HF̂`".
- Manolescu–Ozsváth arXiv:1011.1317v6 (read): Introduction, quoted in /105; Proposition 11.5 is the exact sequence for the completed `HF⁻` of framed links in integral homology spheres.

### Fix
The completed-flavor, cobordism-map and exact-triangle bullets of F4.5 (full text in /105). No other edit.

### Not done, and why
Nothing further.

## /113 (medium, error): the acceptance checks exercise holomorphic counts; the lens-space check tests only generators

### What the verifier corrected
Nothing; confirmed. The `L(p,q)` check is vacuous as a test of the holomorphic theory.

**Consistency with /57.** CombinatorialHeegaardFloer's `HF̂_st` has no `Spin^c` splitting. So the combinatorial side of "The two definitions meet" can compare only dimensions for `L(p,q)`, and the seam is moved to a diagram where counts occur.

### State on main (31403074)
- Lines 294–298: "**`HF̂` computes:** `HF̂(L(p,q))` over 𝔽₂ from the genus-1 diagram (every moduli count a bigon) gives `𝔽^p`, one generator per spin^c structure. … **The two definitions meet:** `HF̂(L(p,q))` computed analytically from the genus-1 diagram agrees with the combinatorial roadmap's Lane H computation: the first reconciliation seam crossed end to end."
- Line 281: "The first seam crossed end to end is the genus-1 computation below: …".
- Sources read:
  - OS arXiv:math/0105202v4, Proposition 3.1, proof: "Each intersection point corresponds to a different `Spin^c` structure, and, of course, all boundary maps are trivial". Its `S¹ × S²` paragraph gives two disks joining `x⁺`, `x⁻` in a diagram "weakly admissible for all `Spin^c` structures", and notes that with disjoint curves "the Heegaard diagram is not weakly admissible".
  - OS arXiv:math/0101206v4: Theorem 7.3 (isotopy invariance) and Proposition 2.15.

### Fix
**Note for the Tau Ceti maintainer.** Replace the last two bullets of "Acceptance criteria" (lines 294–298, from "- **`HF̂` computes:**" to "crossed end to end.") with:
> - **`HF̂` generators and `Spin^c`:** `HF̂(L(p,q))` over 𝔽₂ from the standard genus-1 diagram gives `𝔽^p`, one generator per `Spin^c` structure. This tests generators and the `Spin^c` splitting only. The `p` intersection points lie in `p` different `Spin^c` structures, so `π₂(x, y)` is empty for `x ≠ y` and no nonconstant moduli space occurs ([arXiv:math/0105202](https://arxiv.org/abs/math/0105202), Proposition 3.1).
> - **`HF̂` counts:** checks that a definition with vanishing counts fails.
>   - `HF̂(S³) = 𝔽` from a genus-1 diagram in which `β` meets `α` in three points: a finger move away from `z` adds a cancelling pair to the one-point diagram. The complex has three generators, so the answer `𝔽` (Proposition 3.1 with `p = 1`, and isotopy invariance, OS Theorem 7.3) forces the embedded bigons avoiding `z` to count `1` mod 2; zero counts would give `𝔽³`.
>   - `HF̂(S¹ × S²) = 𝔽²` in the torsion `Spin^c` structure, from the weakly admissible genus-1 diagram with two intersection points joined by two bigons avoiding `z`, which cancel mod 2 ([arXiv:math/0105202](https://arxiv.org/abs/math/0105202), §3). This tests admissibility: the diagram with disjoint `α` and `β` is not weakly admissible and has no generators. It also tests that both bigons are counted.
> - **The two definitions meet:** on a nice diagram (every region away from the basepoint is a bigon or a rectangle), such as the three-point diagram of `S³` above, the holomorphic differential equals the combinatorial roadmap's Lane H differential, which counts empty bigons and rectangles once each. This uses F4.4's polygon counts, and it is the first reconciliation seam crossed end to end (Reconciliation R.1). For `L(p,q)` the comparison with Lane H is one of dimensions only.

Line 281's paragraph is removed by /115's Lane R, which moves its ⚠ into Lane R's introduction.

### Not done, and why
- The three-point `S³` check is a direct consequence of the two cited results and linear algebra over 𝔽₂. No source states it as a worked example among those read.

## /114 (medium, library-claim): record what is built for F0, M, F2.1, F3 and F4.1; retire Tau Ceti's duplicate Fredholm results

### What the verifier corrected
Nothing in the fix. The review lists `TauCeti/Analysis/Fredholm/ClosedRange.lean:133` among Tau Ceti's re-proofs, but at the pin it is not a duplicate. `TauCeti.isFredholm_iff_finite_ker_coker` has no Mathlib counterpart, and Mathlib's `IsFredholm` docstring says the finite kernel-and-cokernel criterion is "not in Mathlib yet". The red team's fix treats it correctly, as an upstream candidate.

### State on main (31403074)
- All 22 HF stages are `status: "unknown"`.
- `data/library-coverage.json` (generated 2026-09-21, "do not edit by hand") has no HeegaardFloer layer.
- `AUDIT-45` (GeometricTopology, HeegaardFloer, UniversalCovers) is `pending` with no result.
- README lines 116–117: "Fredholm operators and index theory (nothing exists); **Sard's theorem, even finite-dimensional** (an explicit Mathlib TODO)".

**Read at the pins.**

Mathlib `082e2d3` (the Fredholm files):
- `structure IsFredholm (u : E →L[𝕜] F)` (`Mathlib/Analysis/Normed/Operator/Fredholm/Basic.lean:123`);
- `IsFredholm.index_comp` (`Basic.lean:613`): `(g ∘L f).index = g.index + f.index`, over any `NontriviallyNormedField` on topological vector spaces;
- `IsFredholm.eventually_nhds` (`Open.lean:77`), `isOpen_setOfPred_isFredholm` (`:84`), `IsFredholm.eventually_nhds_index_eq` (`:89`) and `index_continuousOn_isFredholm` (`:104`). These are between normed spaces with `[CompleteSpace E]` and, per theorem, `[CompleteSpace 𝕜]`.

Tau Ceti `f790474` (no `sorry` under the directories below):
- **Same statements as Mathlib, same hypotheses:**
  - `ContinuousLinearMap.index_comp` (`TauCeti/Analysis/Fredholm/Comp.lean:53`), stated for Tau Ceti's own `ContinuousLinearMap.index` (`Fredholm/Index.lean:52`, `:= (T : E →ₗ[𝕜] F).index`, which is what Mathlib's `.index` on a continuous linear map elaborates to through the `LinearMap` parent);
  - `ContinuousLinearMap.IsFredholm.eventually_isFredholm_and_index_eq` (`Fredholm/SmallPerturbation.lean:199`) and `TauCeti.isOpen_setOf_isFredholm` (`:255`), both under `[CompleteSpace 𝕜] [CompleteSpace E]`.
- **Built, no Mathlib counterpart:**
  - `isOpen_setOf_isFredholm_index_eq` (`SmallPerturbation.lean:265`);
  - `IsFredholm.add_of_isCompactOperator` and `index_add_of_isCompactOperator` (`CompactPerturbation.lean:87, 137`);
  - `isFredholm_iff_finite_ker_coker` (`ClosedRange.lean:133`, over an `IsRCLikeNormedField`, Banach `E`, `F`);
  - the Lyapunov–Schmidt normal form (`Fredholm/NormalForm.lean`);
  - `isManifold_levelSet` (`Fredholm/LevelSet/Manifold.lean:142`);
  - `isMeagre_image_criticalPoints_of_isFredholm` (`Fredholm/SardSmale.lean:470`);
  - `ContDiff.addHaar_image_criticalPoints_eq_zero` (`Analysis/Calculus/Sard/OutermostStratum.lean:372`);
  - `IsNondegenerateCriticalPoint.exists_morse_chart` (`Analysis/Calculus/Morse/NormalForm.lean:362`), `morseIndex` (`Morse/Index.lean:117`) and the genericity results of `Morse/Generic.lean`;
  - `negativeGradientFlow` (`Morse/FlowExistence.lean:65`) and the stable/unstable sets of `Morse/Stable.lean`, whose doc says "The stable-manifold and Morse–Smale theorems will later put smooth manifold structures on these sets";
  - F2.1's declarations as in /103; the cotangent model as in /110; `symChartedSpace` and `Sym.coeffHomeomorph` as in /106.

### Fix
**1. Note for the Tau Ceti roadmap maintainer.**

(a) *Inventory, "consume" list:* append after the "Analysis, genuinely ready" bullet (after line 112):
> - **Fredholm operators** (`Mathlib/Analysis/Normed/Operator/Fredholm/Basic.lean`, `Open.lean`): `ContinuousLinearMap.IsFredholm`, index additivity (`IsFredholm.index_comp`), openness of the Fredholm set and local constancy of the index (`isOpen_setOfPred_isFredholm`, `IsFredholm.eventually_nhds_index_eq`, `index_continuousOn_isFredholm`).

(b) *Inventory, "missing" paragraph:* replace lines 116–124 (from "Ranked by load-bearing weight:" to "manifold orientations and degree theory.") with (this includes /101 and /103):
> Ranked by load-bearing weight, with what Tau Ceti (`f790474`) already has:
> - **Fredholm theory beyond the operator level.** On Mathlib's `IsFredholm`, Tau Ceti has compact-perturbation invariance, the finite kernel-and-cokernel criterion, the Lyapunov–Schmidt normal form, the regular-level-set manifold theorem and Sard–Smale (`TauCeti/Analysis/Fredholm/`). Missing: the strip operator `d/ds + A(s)` and Fredholm sections of Banach bundles.
> - **Sard's theorem** in finite dimensions is built in Tau Ceti (`ContDiff.addHaar_image_criticalPoints_eq_zero`), and so is Sard–Smale; transversality is what remains.
> - **Sobolev spaces** in the shape PDE needs them (`W^{k,p}` on domains, embeddings, multiplication, Rellich: the **shared spine with the PDE roadmap**, which builds exactly this in its Lane A).
> - **Elliptic estimates** for the first-order operator ∂̄: Calderón–Zygmund with its hypotheses (F1.2), boundary regularity for totally real boundary conditions, bootstrapping.
> - **Almost complex and symplectic manifolds.** Tau Ceti has smooth almost complex structures, smooth two-forms with nondegeneracy, taming and compatibility, pseudoholomorphic maps and energy (`TauCeti/Geometry/Symplectic/Manifold/`). Symplectic manifolds wait on differential forms on manifolds (F2.1).
> - **Morse theory.** Tau Ceti has the Morse lemma, the Morse index, genericity of Morse functions, and negative gradient flows with their stable and unstable sets, on finite-dimensional normed spaces (`TauCeti/Analysis/Calculus/Morse/`). Missing: the stable-manifold theorem, the λ-lemma, Morse–Smale transversality, the Morse complex, and all of it on manifolds.
> - **Manifold orientations and degree theory** (Lane O).

(c) *Lane M, item 1 (lines 147–149):* replace "Morse–Smale transversality via finite-dimensional **Sard** (also new, and an explicit Mathlib TODO blocking Whitney embedding improvements)" with "Morse–Smale transversality via finite-dimensional **Sard** (built in Tau Ceti: `ContDiff.addHaar_image_criticalPoints_eq_zero`)".

(d) *Lane F0 (lines 161–167):* replace the paragraph from "Finite-dimensional **Sard**;" to "(McDuff–Salamon, Appendix A)." with:
> Built at the pins, to be consumed: finite-dimensional **Sard** (Tau Ceti); **Fredholm operators** with index additivity, openness and local constancy of the index (Mathlib); invariance under compact perturbation, the kernel/cokernel criterion, the Lyapunov–Schmidt normal form, **Sard–Smale** (Smale 1965) and the regular-level-set manifold theorem (Tau Ceti). To build: the Fredholm property of `d/ds + A(s)` on the strip with invertible asymptotics, and the "moduli space = zero set of a Fredholm section of a Banach bundle, generically a manifold of dimension = index" package (McDuff–Salamon, Appendix A).

  The rest of the paragraph ("Banach IFT: consume from Mathlib. ⚠ No Atiyah–Singer: …") stays.

**2. Note for the Tau Ceti library maintainer.**
- Deprecate `TauCeti.isOpen_setOf_isFredholm` in favour of Mathlib's `ContinuousLinearMap.isOpen_setOfPred_isFredholm`.
- Deprecate `ContinuousLinearMap.IsFredholm.eventually_isFredholm_and_index_eq` in favour of `IsFredholm.eventually_nhds` together with `IsFredholm.eventually_nhds_index_eq`; the hypotheses are the same.
- Deprecate `ContinuousLinearMap.index_comp` in favour of `IsFredholm.index_comp`. Mathlib's statement is more general (topological vector spaces). Because Tau Ceti's lemma is about its own `ContinuousLinearMap.index`, first make that definition an abbreviation of the `LinearMap.index` of the underlying map, or restate its API through `index_def`.
- Keep `isOpen_setOf_isFredholm_index_eq`, which Mathlib states only through `index_continuousOn_isFredholm`.
- Offer `isFredholm_iff_finite_ker_coker` upstream.

**3. Atlas side.** `data/library-coverage.json` is generated, so no hand edit is made. The verdicts go to the pending `AUDIT-45` as its HeegaardFloer input, citing the declarations above:

| Layer | Verdict |
| --- | --- |
| Lane F0 | partly built (as in 1(d)) |
| Lane M, M.1 | partly built (normed-space Morse lemma, index, genericity, flows, stable/unstable sets) |
| M.2 | absent |
| F1, F1.1–F1.3 | absent |
| Lane F2, F2.1 | partly built |
| F2.2–F2.5 | absent |
| F3 | absent apart from the linear cotangent model |
| Lane F4, F4.1 | partly built (charted space and chart only) |
| F4.2–F4.5, F5 | absent |

The atlas statuses follow once AUDIT-45 is reviewed and merged.

### Not done, and why
- The deprecations are not carried out: they are Tau Ceti library changes, outside this report.
- AUDIT-45 is not run here.

## /115 (medium, missing): the reconciliations become Lane R, so the extract gets R.1–R.3

### What the verifier corrected
Nothing; confirmed.

### State on main (31403074)
- The extract's 22 stages are Lane M, M.1–M.2, F0, F1, F1.1–F1.3, F2, F2.1–F2.5, F3, F4, F4.1–F4.5 and F5.
- The README's section "## Reconciliations (the seams, and the long pole)" (line 256) and its three numbered items produce no stage. The snapshot builder (`scripts/snapshot/build_data.py`) makes stages only of headings beginning "Layer", "Lane", "Stage", "Part" or "Milestone", and of numbered items under a "Lane …" heading.
- Line 55 links to the section by the anchor `#reconciliations-the-seams-and-the-long-pole`.

### Fix
**Note for the Tau Ceti maintainer.** Replace lines 256–284 (from "## Reconciliations (the seams, and the long pole)" to "not a bare rank equality.") with (this includes /98, /99 and /113):
> ## Lane R: reconciliations (the seams, and the long pole)
>
> These are the "the two definitions agree" theorems that join each combinatorial invariant (built in the [combinatorial roadmap](../CombinatorialHeegaardFloer/README.md)) to its holomorphic counterpart built here. Every one depends on the analytic tower above, so the analytic track is the blocker, and the reconciliations are owned and tracked here rather than split across both roadmaps. The combinatorial side keeps only pointers back to this section. ⚠ State each reconciliation naturality-ready (JTZ): the agreement is an isomorphism attached to a specific identification of the two complexes, not a bare rank equality. The first seam crossed end to end is the nice-diagram check under Acceptance criteria.
>
> 1. **`HF̂_st` = stabilized holomorphic `HF̂`** (the appendix of [arXiv:0912.0830](https://arxiv.org/abs/0912.0830), Theorems 10.2–10.4). For a nice multi-pointed diagram `D` of `Y` with `b(D)` basepoints, the combinatorial homology is `HF̂(Y) ⊗ (𝔽 ⊕ 𝔽)^{b(D)−1}`. So the Ozsváth–Stipsicz–Szabó stable invariant agrees with the holomorphic `HF̂` up to the tracked `(𝔽 ⊕ 𝔽)`-factors, and the twisted invariant is `HF̂(Y)` when `b₁(Y) = 0`.
>
>    The proof uses:
>    - the multi-pointed theory (F5.2);
>    - Lipshitz's index formula (F5.1);
>    - a generic `J` for which only nonnegative domains carry holomorphic disks;
>    - the classification of the nonnegative index-one domains of a nice diagram as bigons and rectangles (arXiv:0912.0830, Proposition 6.10, after Sarkar–Wang);
>    - F4.4's polygon counts.
>
>    Depends on F4.4, F5.1, F5.2 and the combinatorial Lane H.
> 2. **Lattice homology = completed `HF⁻` of plumbing trees** (Zemke, [arXiv:2111.14962](https://arxiv.org/abs/2111.14962) v4, Theorem 1.1). If `G` is a plumbing tree of disk bundles over `S²`, the lattice homology `ℍ𝔽(G)` is isomorphic as an `𝔽[[U]]`-module to the `U`-completion of `HF⁻(Y(G))`, relatively graded when `b₁(Y(G)) = 0`. Here `ℍ𝔽(G)` is taken in Ozsváth–Stipsicz–Szabó's homological form, which is defined for arbitrary plumbing trees.
>    - Completion loses nothing for rational homology spheres and for torsion `Spin^c` structures.
>    - Graphs with cycles and higher-genus bases are not covered.
>    - Compatibility with the `Λ*(H₁(Y)/Tors)` action is Zemke's Conjecture 1.2 and is not a target.
>
>    Depends on the completed `HF⁻` of F4.5, the link Floer complexes of F5.2, the surgery formulas of F5.3, and the combinatorial Lane L.
> 3. **Grid homology = knot Floer homology** (Manolescu–Ozsváth–Sarkar, [arXiv:math/0607691](https://arxiv.org/abs/math/0607691)). For a grid presentation `Γ` of a knot `K` with grid number `n`, `H_*(C(Γ)) ≅ HFK̂(K) ⊗ V^{⊗(n−1)}` as bigraded groups (Theorem 1.1), and `C⁻(Γ)` has the filtered chain homotopy type of `CFK⁻(S³, K)` (Theorem 3.3); for links, Theorem 3.5.
>
>    The proof identifies the grid complex with the Heegaard Floer complex of a `2n`-pointed genus-1 diagram. There the positive index-one domains are rectangles, each with an odd number of holomorphic representatives (F4.4's polygon counts), and Proposition 2.3 (F5.2) finishes.
>
>    Depends on F4.4, F5.2 and the combinatorial Lane G.

On line 55, replace `(#reconciliations-the-seams-and-the-long-pole)` with `(#lane-r-reconciliations-the-seams-and-the-long-pole)`.

**Atlas side.** Nothing is hand-edited in the generated extract. After upstream carries the edit, the snapshot and extract are regenerated. The new stages are:
- `tauceti:TauCetiRoadmap/HeegaardFloer#lane-r-reconciliations-the-seams-and-the-long-pole`;
- `…#milestone-r-1`, `…#milestone-r-2` and `…#milestone-r-3`, with keys R.1–R.3 and parent the lane.

Their edges are /116's rows marked R.

### Not done, and why
Nothing further. The OSS twisted theorem (10.4) and Theorems 10.2–10.3 were read; the CombinatorialHeegaardFloer side of the seams is in /56–/58.

## /116 (medium, other): HeegaardFloer's stage edges, as link entries for the pending link job

### What the verifier corrected
Nothing; confirmed. The internal edges follow from the document's own text.

### State on main (31403074)
- No HeegaardFloer stage has an edge, in the extract or in the integrated atlas.
- `LINK-tauceti_TauCetiRoadmap_HeegaardFloer` (output `research/blueprint/links/tauceti_TauCetiRoadmap_HeegaardFloer.json`) and its review are `pending` in `research/blueprint/queue.json`.
- The only roadmap-level edge is CombinatorialHeegaardFloer → HeegaardFloer, `declared`, `stageCount: 0`.

### Fix
**Atlas side.** The link job should record the entries below, supplier → consumer, as `links-v1` entries with their quoted evidence. Short ids: `HF` = `tauceti:TauCetiRoadmap/HeegaardFloer#`, `CHF` = `tauceti:TauCetiRoadmap/CombinatorialHeegaardFloer#`, `CM` = `tauceti:TauCetiRoadmap/ConformalMapping#`, `AT` = `tauceti:TauCetiRoadmap/AlgebraicTopology#`, `GT` = `tauceti:TauCetiRoadmap/GeometricTopology#`.
- Rows marked **new** end at a stage that exists only after the upstream edits of /97, /99, /101 and /115; the link job records them after regeneration.
- The roadmap-level prerequisites (AlgebraicTopology, GeometricTopology, ConformalMapping) then follow as `stage_supported` edges, with no separate edit.
- The PDE → F1 edges are RT-AREA-pde/11 and /33, and the manifold-flow edge into Lane M is RT-AREA-diffgeom/2; they are not repeated.

**Checks.** The cycle test reports *acyclic* for all 35 rows between existing stages. The 24 rows with a new endpoint are acyclic in the base graph, since the new stages have no edges. All 59 together, added to the 7792 existing edges and also with /87's candidate `HF milestone-m-1 → GT layer-9`, form an acyclic graph.

| # | Supplier → consumer | Reason (quoted text is from the stage descriptions) |
| --- | --- | --- |
| 1 | HF `lane-f0-the-nonlinear-analysis-substrate` → HF `milestone-m-2` | M.2: "zero sets of a Fredholm section of a Banach bundle … transversality by Sard–Smale"; F0: "**Sard–Smale** (Smale 1965)" |
| 2 | HF `lane-f0-…` → HF `milestone-f1-3` | F1.3: "Fredholm operators between Sobolev completions"; F0: "the Fredholm property of `d/ds + A(s)`" |
| 3 | HF `lane-f0-…` → HF `milestone-f2-4` | F2.4: "Sard–Smale via somewhere-injectivity" |
| 4 | HF `milestone-m-1` → HF `milestone-m-2` | Lane M: "Do it twice, deliberately" |
| 5, 6 | HF `milestone-f1-2` → HF `milestone-f2-2`, `milestone-f2-3` | elliptic regularity ("interior elliptic bootstrapping; **boundary regularity for totally real boundary conditions**") under the local theory and compactness |
| 7 | HF `milestone-f1-3` → HF `milestone-f2-4` | transversality needs the linearized operators Fredholm |
| 8–11 | HF `milestone-f2-1`, `-f2-3`, `-f2-4`, `-f2-5` → HF `lane-f3-lagrangian-floer-homology-exact-case` | F3: "moduli of strips, `∂² = 0` by gluing + compactness" |
| 12 | HF `milestone-f2-2` → HF `milestone-f4-3` | F4.3: "OS Theorem 3.4 = Sard–Smale + Oh"; F2.2: "Oh's boundary-injectivity" |
| 13 | HF `milestone-f2-4` → HF `milestone-f4-3` | same |
| 14, 15 | HF `milestone-f2-3`, `-f2-5` → HF `milestone-f4-4` | compactness and gluing for `∂² = 0` |
| 16 | HF `lane-f3-…` → HF `milestone-f4-4` | F4.4: "`J`-independence and isotopy invariance by continuation" |
| 17–20 | HF `milestone-f4-1` → `-f4-2` → `-f4-3` → `-f4-4` → `-f4-5` | the F4 order: `ε` needs `π₁` (/106); admissibility needs `c₁(s)` (/104); `HF̂` needs both; "Then, staged" |
| 21 | HF `milestone-f4-1` → HF `milestone-f4-5` | `c₁(Sym^g)`, sphere bubbles (/106) |
| 22, 23 | CHF `milestone-h-1` → HF `milestone-f4-2`, `-f4-3` | CHF: "The diagram combinatorics of H.1 are also the input the analytic roadmap's Lane F4 consumes"; H.1 lists "weak/strong **admissibility**" |
| 24, 25 | CM `milestone-l3--the-riemann-mapping-theorem-summit`, CM `milestone-l5--carathéodory-boundary-correspondence` → HF `milestone-f4-4` | polygon counts (/107) |
| 26 | CM `milestone-l4--analytic-continuation--the-reflection-principle` → HF `milestone-f1-2` | L4: "Morera-based **Schwarz reflection**"; F1.2: "(Schwarz reflection)"; AUDIT-05 names F1.2 as L4's consumer |
| 27, 28 | AT `stage-3-subdivision-excision-and-mayer--vietoris`, AT `stage-4-cw-pairs-cellular-homology-and-cofibrations` → HF `milestone-m-1` | M.1: "Morse homology ≅ singular homology"; the comparison needs excision and cellular homology, and Mathlib has absolute singular homology only (`AlgebraicTopology/SingularHomology/`: Basic, HomologyZero, HomotopyInvariance) |
| 29 | AT `stage-6-cohomology-products-and-manifold-duality` → HF `milestone-f4-2` | Poincaré duality for OS Lemma 2.19 (/104) |
| 30 | AT `stage-6-…` → HF `milestone-f4-5` | the "intersection pairing" gives the signature (/105) |
| 31 | GT `layer-10-foliations-and-their-euler-class` → HF `milestone-f4-2` | "The **Euler class** of an oriented plane bundle"; `c₁(s)` (/104) |
| 32–34 | GT `layer-1-manifold-library-buildout-general-dimension-general-structure-group`, GT `layer-5-dehn-surgery`, GT `layer-6-knot-concordance-and-4d-cobordism-owned-here` → HF `milestone-f4-5` | "**handle attachment**"; "surgery on framed links"; "The **4D cobordism category**" (/105) |
| 35 | GT `layer-9-heegaard-splittings-and-heegaard-genus` → HF `lane-f4-heegaard-floer-homology-holomorphically` | "the **Heegaard splitting** of a closed 3-manifold"; confidence `inferred` until /100's owner exists |
| 36 | HF `milestone-f2-3` → HF `milestone-f2-6` **new** | F2.6 extends F2.3's compactness (/97) |
| 37 | HF `milestone-f2-5` → HF `milestone-f2-6` **new** | and F2.5's gluing (/97) |
| 38, 39 | HF `milestone-f2-6` **new** → HF `milestone-f4-4`, `-f4-5` | rectangles; neck stretching (/97) |
| 40 | HF `milestone-o-1` **new** → HF `milestone-o-2` **new** | degree needs orientations (/101) |
| 41, 42 | HF `milestone-o-1`, `-o-2` **new** → AT `stage-6-…` | AT: "consume the orientation-and-degree API owned by Heegaard Floer" |
| 43 | HF `milestone-o-1` **new** → GT `layer-1-…` | GT Layer 1: "an orientation on each summand" |
| 44 | HF `milestone-o-1` **new** → HF `milestone-m-1` | ℤ coefficients need orientations of unstable manifolds |
| 45 | HF `milestone-f5-1` **new** → HF `milestone-f5-2` **new** | OS arXiv:math/0512286 §5 works in Lipshitz's setting |
| 46 | HF `milestone-f4-4` → HF `milestone-f5-2` **new** | the multi-pointed proofs adapt the single-pointed ones (OS §6) |
| 47 | HF `milestone-f5-2` **new** → HF `milestone-f5-3` **new** | the surgery formula uses link Floer complexes |
| 48 | HF `milestone-f5-1` **new** → HF `milestone-f4-5` | Sarkar's `n`-gon formula starts from Lipshitz's (/108) |
| 49–52 | HF `milestone-f5-1` **new**, HF `milestone-f5-2` **new**, HF `milestone-f4-4`, CHF `milestone-h-3` → HF `milestone-r-1` **new** | R.1's inputs (/99, /115) |
| 53–55 | HF `milestone-f4-5`, HF `milestone-f5-3` **new**, CHF `lane-l-lattice-homology` → HF `milestone-r-2` **new** | R.2's inputs (/98); CHF Lane L: "Far-future reconciliation: Zemke's `ℍ⁻ ≅ HF⁻`" |
| 56–59 | HF `milestone-f5-2` **new**, HF `milestone-f4-4`, CHF `milestone-g-3`, CHF `milestone-g-5` → HF `milestone-r-3` **new** | R.3's inputs (/99, /115) |

### Not done, and why
- The entries are not written as a `links-v1` file: the link job owns that output, and this report is the only file the job may change.
- `scripts/check_links.py` was not run on these entries; the link job runs it on its packet. The cycle checks used the cycle test and a combined check over the same assembled graph.

## /117 (low, error): correct F4's section locator and F4.3's lemma numbers

Confirmed; the review checked both against the source, and my numbering from the arXiv:math/0101206v4 source agrees.
- F4 (line 220) cites "§§2–4"; /100's replacement of that paragraph reads "definitions in §§2–4, invariance in §§5–10, assembled in §11".
- F4.3 (lines 231–232): replace "**admissibility energy bounds** (OS Lemmas 4.12–4.13) replacing monotonicity." with:
  > the energy bound for a fixed class (OS Lemma 3.5); and, replacing monotonicity, finiteness of the positive classes of given Maslov index: under weak admissibility with `n_z` fixed (OS Lemma 4.13) and under strong admissibility (OS Lemma 4.14), with the area-form criterion for weak admissibility for all `Spin^c` structures (OS Lemma 4.12).

The rest of item 3 stays.

## UniversalCovers (/118–/123)

The conventions are those given before /22 above.

## /118 (medium, other): UniversalCovers is complete; the atlas and the README still read as a plan

### What the verifier corrected
Nothing. **One correction on the atlas side.** The stage records do say `status: unknown` (as every Tau Ceti stage does), but the mapped status layer already says complete. Since 16 September, `data/stage-status-reports.json` maps all five stages to `"status": "complete", "percent": 100` from STATUS.md, and the assembled atlas carries that under `mappedStageStatuses`. So the remaining atlas defect is the roadmap's lifecycle, its place among the Tau Ceti roadmaps, and the missing edges (/122).

### State on main (31403074)
- **The README is unchanged**, and still reads as a plan:
  - lines 49–56, "What is missing (port / build here)", list #31576, #38292 and #40135 as closed or open;
  - line 93, "⚠ Convention check first";
  - line 135, "this is the bulk of the work".
- **The extract has `"lifecycle": "active"`.** `data/tauceti-progress.json` (29 September) says `"completed": true`, with status at `Completed/UniversalCovers/STATUS.md`.
- **Upstream** archived the roadmap to `Completed/UniversalCovers/` (declared complete 22 September, archived 27 September) with a byte-identical README and STATUS.
- **STATUS.md** is generated to `f95cc2f` (7 September), before the pin. Its frontier says the fibre functor's automorphism group "is not identified", which the pin contradicts (/120).
- **Read at `f790474`.** All thirteen of the finding's citations resolve; every declaration named in this section was read there.
  - Stage 0: `Path.tube_subset_homotopy_class` (`UniversalCover/PathHomotopyDiscreteness.lean:615`); `TauCeti.UniversalCover` (`Basic.lean:66`); `isCoveringMap`, `discreteTopology_fiber`, `pathConnectedSpace`, `simplyConnectedSpace` and `existsUnique_continuousMap_lifts` (`Covering.lean:46, :75, :109, :203, :236`); the `MulAction`, `FaithfulSMul` and `ContinuousConstSMul` instances (`Action.lean:80, :91, :101`); `isQuotientCoveringMap` (:158); and `TauCeti.Deck` (`Deck/Basic.lean:40`).
  - Stage 1: `TauCeti.UniversalCover.deckFundamentalGroupEquiv : Deck (proj : UniversalCover x₀ → X) ≃* (FundamentalGroup X x₀)ᵐᵒᵖ` (`Deck/FundamentalGroup/UniversalCover.lean:108`), under `[LocallyPathConnectedSpace X] [PathConnectedSpace X] [SemilocallySimplyConnectedSpace X]`. The action is `g • mk x q = mk x (g⁻¹.toPath.trans q)` (`Action.lean`).
  - Stage 2:
    - `isCoveringMap_subgroupQuotientProj` (`Classification/Existence.lean:64`);
    - `range_mapOfEq_subgroupQuotientProj` (`RecoveredSubgroup.lean:212`);
    - `IsCoveringMap.exists_homeomorph_comp_eq_iff_exists_range_eq_map_conj` (`Unpointed.lean:144`);
    - `existsUnique_subgroup_homeomorph_subgroupQuotient` and `isRegular_subgroupQuotientProj_iff_normal` (`Bijection.lean:97, :142`);
    - `deckSubgroupQuotientProjEquiv` and `…OfNormal` (`DeckGroup.lean:62, :97`);
    - `IsCoveringMap.isRegular_iff_normal_range` (`Regular.lean:50`);
    - `TauCeti.CoveringSpace.fiberActionEquivalence` (`FundamentalGroupAction.lean:157`) and `TauCeti.CoveringSpace.monodromyEquivalence` (`MonodromyEquivalence.lean:204`);
    - beyond the text, `TauCeti.CoveringSpace.monodromyEquivalenceOfLocallyPathConnectedSpace` (`Components.lean:102`), with no path-connectedness hypothesis.
  - Stage 3: see /33; plus `IsCoveringMap.homotopyGroupMulEquiv` (`HomotopyGroup/Covering.lean:160`, `[Nontrivial N]`).
  - Stage 4: `AddCircle.homotopyGroupPi_eq_one` (`Circle/HigherHomotopy.lean:62`), `Circle.fundamentalGroupMulEquiv` (`Circle/FundamentalGroup.lean:287`), `AddCircle.piFundamentalGroupMulEquiv` (`Torus/FundamentalGroup.lean:83`), `AddCircle.homotopyGroupPi_pi_eq_one` (`Torus/HigherHomotopy.lean:51`), `TauCeti.RealProjectiveSpace.fundamentalGroupMulEquivAt` (`hn : 2 ≤ n`, `RealProjective/FundamentalGroup/Basic.lean:134`), `TauCeti.IsAspherical`, `IsEilenbergMacLaneSpaceOne` and their `.pi` forms (`EilenbergMacLane/Basic.lean:59, :123, :111, :186`), `IsCoveringMap.isAspherical_totalSpace` (`EilenbergMacLane/Covering.lean:99`), and `UniversalCover.isAspherical_iff` and `isEilenbergMacLaneSpaceOne` (`Classification/EilenbergMacLane.lean:72, :84`).

### Fix
**Atlas maintainer.** Rebuild the Tau Ceti snapshot from upstream `main`. UniversalCovers then moves to `content/tau-ceti/Completed/UniversalCovers/` with lifecycle `completed`, as for the four `tauceti:Completed/*` roadmaps. Its stage ids change from `tauceti:TauCetiRoadmap/UniversalCovers#…` to `tauceti:Completed/UniversalCovers#…`. Re-key every reference to the old ids in the same change, or carry an alias:
- RS-33's 23 links, three owners and the `suppliedBy` lists of H.1–H.3;
- the UniversalCovers link packet;
- the LieGroups packet's `alreadyRecorded` entries;
- the SpinRepresentations reviewed link (the one edge on main, UC0 → SpinRepresentations Layer 7);
- the edges of /29 and /122.

**Note for the Tau Ceti maintainer: `Completed/UniversalCovers/README.md`.** The archived README is what consumers read.
1. **Replace the section "What is missing (port / build here)"** (the three bullets and the "Plus, on top of these" line) with:
   > ## What was built (complete; Tau Ceti `f790474`)
   >
   > - #31576's discreteness of homotopy-class fibres: `Path.tube_subset_homotopy_class`, `TauCeti.UniversalCover.discreteTopology_fiber`.
   > - #38292's construction: `TauCeti.UniversalCover` with `isCoveringMap`, `pathConnectedSpace`, `simplyConnectedSpace`, `existsUnique_continuousMap_lifts` and `isQuotientCoveringMap`.
   > - #40135 is merged into Mathlib as `deck`. The earlier Tau Ceti port `TauCeti.Deck` has been replaced by it (Tau Ceti #6875).
   > - The Galois correspondence, deck groups `N(H)/H`, regular covers, the monodromy and `pi_1`-set classifications (also over bases that are not path-connected), the Galois category of finite covers with `Aut` of its fibre functor identified with the profinite completion of `pi_1`, and the higher-homotopy API.
   >
   > Outside this roadmap:
   > - existence of `K(G, 1)` for an arbitrary group;
   > - higher homotopy of spheres and `RP^n` beyond vanishing;
   > - bases that are not locally path-connected or not semilocally simply connected.
2. **Stage 1.** In the item title, replace "`Deck(proj) ≃* π₁(X, x₀)`" with "`Deck(proj) ≃* π₁(X, x₀)ᵐᵒᵖ`". Then replace the text from "⚠ Convention check first:" to "Pin the convention before stating the target." with:
   > Pinned: `Deck(proj) ≃* (FundamentalGroup X x₀)ᵐᵒᵖ` (`TauCeti.UniversalCover.deckFundamentalGroupEquiv`). `pi_1` acts on the left, `g • [q] = [g⁻¹ · q]`, by prepending the inverse loop, and Mathlib's `End` multiplication reverses composition, which forces the opposite group.
3. **Stage 3 item 9.** Replace "Mathlib's `HomotopyGroup` is thin here; this is the bulk of the work." with:
   > Built in Tau Ceti: `HomotopyGroup.map`, `HomotopyGroup.mapHom`, `TauCeti.homotopyGroupEquivOfPath`, `TauCeti.homotopyGroupMulAction`, `HomotopyGroup.loopSpaceMulEquiv` and `TauCeti.isPathConnected_cubeBoundary`.
4. **STATUS.md** is generated. Regenerate it past `f790474`: its frontier bullet on the fibre functor is out of date (/120).

**Consumer note: `BelyiMaps/README.md`, supplier table (lines 490–494).** It still marks built UniversalCovers targets "unresolved supplier contract".
- **Row "5.1, 6.2 | UniversalCovers Stage 0.2 | semilocal simple connectivity".** The class is built: `TauCeti.SemilocallySimplyConnectedSpace` (`SemilocallySimplyConnected/Basic.lean:74`). An open subset of `ℂ` gets it from `SemilocallySimplyConnectedSpace.of_forall_exists_mem_nhds_isSimplyConnected` (:112), since every point has a convex ball as a neighbourhood.
- **Row 6.3.** `TauCeti.FundamentalGroup.basepointChangeSubgroup` is built (`FundamentalGroup/BasepointChange.lean:84`), and milestone 8's equivalences are the Stage 2 declarations above.
- **Row 6.4.** It names `Deck`; since Tau Ceti #6875 the carrier is Mathlib's `deck`.
- **Row 5.6** is /122's.

### Not done, and why
Upstream completion is a maintainer's declaration, which I record but do not re-audit. `AUDIT-45` (pending; /114) is where the library record belongs.

## /119 (medium, library-claim): consume Mathlib's `deck` and its `π₁` equivalences

### What the verifier corrected
Nothing. The verifier could not check the Mathlib merge commit, and nor can I (the pinned checkout is shallow). The declaration is present at `082e2d3`.

**Changed since.** Tau Ceti PR #6875 ("use Mathlib's deck transformation group", merged 21 September, after the pin) deleted `TauCeti.Deck`. The upstream archived `Suggested.lean` now states milestone 4 with `deck` (TauCetiRoadmap #468). **So the migration item of the finding's fix is done upstream**; only the README wording remains.

### State on main (31403074)
- The README is unchanged: Stage 0 item 4 (lines 84–87) ports `Deck p` "from #40135", and line 56 reads "(*Deck transformation group*): open."
- **Read at the pins.**
  - Mathlib: `deck` (`Topology/Covering/Deck.lean:41`, carrier `{h | p ∘ h = p}`), `deck.mem_iff` (:51), `deck.proj_smul` (:56), and the `ContinuousConstSMul` instance (:59).
  - Mathlib: `IsQuotientCoveringMap.fundamentalGroupEquiv [SimplyConnectedSpace E] : FundamentalGroup X x ≃* Gᵐᵒᵖ` (`Topology/Homotopy/Lifting.lean:690`) and `IsAddQuotientCoveringMap.fundamentalGroupEquiv : … ≃* (Multiplicative G)ᵐᵒᵖ` (:772).
  - Mathlib: `AddCircle.isAddQuotientCoveringMap_coe : IsAddQuotientCoveringMap ((↑) : 𝕜 → AddCircle p) (zmultiples p)` (`Topology/Covering/AddCircle.lean:28`, under `[DiscreteTopology (zmultiples p)]`, an instance for real `p` at `Topology/Instances/ZMultiples.lean:39`).
  - Tau Ceti: `TauCeti.Deck` (`UniversalCover/Deck/Basic.lean:40`, carrier `∀ e, p (φ e) = p e`), referred to in 36 files.

### Fix
**Note for the Tau Ceti maintainer: `Completed/UniversalCovers/README.md`.**
1. **"What Mathlib already has".** Add:
   > - **Deck transformations:** `Mathlib/Topology/Covering/Deck.lean` (`deck`, from #40135).
   > - **`pi_1` of the base of a simply connected quotient cover:** `IsQuotientCoveringMap.fundamentalGroupEquiv : FundamentalGroup X x ≃* Gᵐᵒᵖ` and `IsAddQuotientCoveringMap.fundamentalGroupEquiv : … ≃* (Multiplicative G)ᵐᵒᵖ` (`Mathlib/Topology/Homotopy/Lifting.lean`), for `[SimplyConnectedSpace E]`.

   Remove the #40135 bullet from "What is missing" (/118 rewrites that section).
2. **Stage 0 item 4.** Replace the whole item (lines 84–87, from "4. **Deck transformation group** (from #40135): `Deck p` as a `Subgroup (E ≃ₜ E)`" to "`ContinuousConstSMul E`.") with:
   > 4. **Deck transformation group: consume Mathlib's `deck`** (merged from #40135). `deck p : Subgroup (E ≃ₜ E)`, for `p : E → X`, comes with `deck.mem_iff`, `deck.proj_smul` and `ContinuousConstSMul (deck p) E`; subgroup transfer gives its `Group`, `MulAction E` and `FaithfulSMul E`. Tau Ceti's earlier port `TauCeti.Deck` is the same subgroup with a pointwise carrier; it is in the pinned library and has since been replaced by `deck` (Tau Ceti #6875).
3. **Stage 4 item 12.** Replace "(Mathlib has the covering map but, as far as the pin shows, not the `π₁ ≅ ℤ` statement, so this is an application target, not a reconciliation.)" with:
   > (Mathlib's `IsAddQuotientCoveringMap.fundamentalGroupEquiv` at `AddCircle.isAddQuotientCoveringMap_coe` already gives `π₁(AddCircle p, x) ≃* (Multiplicative (zmultiples p))ᵐᵒᵖ`. The target, built as `Circle.fundamentalGroupMulEquiv : FundamentalGroup Circle x ≃* Multiplicative ℤ`, is its identification with `ℤ`.)

### Not done, and why
Nothing.

## /120 (medium, duplicate): the Galois category of finite covers is built; BelyiMaps 12.6 imports it

### What the verifier corrected
Nothing.

### State on main (31403074)
- **UniversalCovers Stage 2's "Alternative lens"** (lines 121–124) is unchanged, and so is STATUS.md's frontier ("the automorphism group of that functor is not identified", generated to `f95cc2f`).
- **BelyiMaps 12.6** is unchanged in the snapshot (lines 3866–3869 and 3900–3903) and upstream. Its Layer 12 is owned by the successor `BelyiArithmeticActions` (line 3664).
- **Read at `f790474`.** Under `[PathConnectedSpace X] [LocallyPathConnectedSpace X] [SemilocallySimplyConnectedSpace X]`, all in namespace `TauCeti.FiniteCoveringSpace`:
  - `instFiberFunctor : PreGaloisCategory.FiberFunctor (fiberFunctor x₀)` (`Classification/GaloisCategory.lean:324`);
  - `instGaloisCategory : GaloisCategory (FiniteCoveringSpace X)` (:329);
  - `instProfiniteCompletionIsFundamentalGroup` (`ProfiniteFiberFunctor.lean:69`);
  - `profiniteCompletionAutFiberFunctorMulEquiv : ProfiniteGrp.ProfiniteCompletion.completion (GrpCat.of (FundamentalGroup X x₀)) ≃* Aut (fiberFunctor x₀)` (:94);
  - `profiniteCompletionAutFiberFunctorMulEquiv_isHomeomorph` (:152).

### Fix
**Note for the Tau Ceti maintainer.**
1. **`Completed/UniversalCovers/README.md`, Stage 2.** After the "Alternative lens" bullet add:
   > - *Delivered on both lenses.*
   >   - The `pi_1`-set and monodromy classifications: `TauCeti.CoveringSpace.fiberActionEquivalence`, `TauCeti.CoveringSpace.monodromyEquivalence`, `TauCeti.ConnectedCoveringSpace.monodromyEquivalence`, and over bases that are not path-connected, `…monodromyEquivalenceOfLocallyPathConnectedSpace`.
   >   - The Galois category: finite covering spaces form a Galois category (`TauCeti.FiniteCoveringSpace.instGaloisCategory`) with the fibre over `x₀` as fibre functor (`instFiberFunctor`). The profinite completion of `pi_1(X, x₀)` is its fundamental group (`instProfiniteCompletionIsFundamentalGroup`), and `profiniteCompletionAutFiberFunctorMulEquiv`, a homeomorphism, identifies it with `Aut` of the fibre functor.
2. **`BelyiMaps/README.md`, 12.6, step 1.** Replace "Prove it satisfies the pin's `PreGaloisCategory` and `FiberFunctor` axioms." with:
   > Its axioms are imported, not proved again: `TauCeti.FiniteCoveringSpace.instGaloisCategory` and `instFiberFunctor` for `X = U`, whose three hypotheses `U` satisfies (5.1). Compare Layer 6.1's carrier with `TauCeti.FiniteCoveringSpace (TopCat.of U)`.
3. **`BelyiMaps/README.md`, 12.6, step 5.** Replace "and `Aut(Fib_top) ≃ₜ* profiniteCompletion (FreeGroup (Fin 2))`, through Layer 5.6's free generation and the completion's universal property." with:
   > and `Aut(Fib_top) ≃ₜ* profiniteCompletion (FreeGroup (Fin 2))`: import `TauCeti.FiniteCoveringSpace.profiniteCompletionAutFiberFunctorMulEquiv`, a homeomorphism by `…_isHomeomorph`, and transport Layer 5.6's `π₁(U, b) ≃* FreeGroup (Fin 2)` along profinite completion.

   In 12.6's prerequisites add:
   > UniversalCovers Stage 2 (the Galois-category lens)

**Atlas side.**
- **Edge** UC2 → `tauceti:TauCetiRoadmap/BelyiMaps#layer-12-profinite-powers-the-fundamental-group-and-the-branch-cycle-theorem`, **acyclic**, filed in /122's table.
- **Library record.** `data/library-coverage.json` already cites `TauCeti.FiniteCoveringSpace.instGaloisCategory` for `AnabelianGeometryAndNonabelianChabauty:NC.0`, so no audit change is needed there.

### Not done, and why
The algebraic side of 12.6 (steps 2–4 and the other half of step 5) stays with BelyiArithmeticActions.

## /121 (medium, duplicate): LieGroups imports the universal cover

### What the verifier corrected
Nothing. **One refinement.** For semilocal simple connectivity of a Lie group the finding points to `SemilocallySimplyConnectedSpace.of_locallyContractibleSpace`. At the pin nothing proves that a manifold is locally contractible: Mathlib's `Topology/Homotopy/LocallyContractible.lean` lists "Add examples: convex sets, real vector spaces" as a TODO. The shorter route is `SemilocallySimplyConnectedSpace.of_forall_exists_mem_nhds_isSimplyConnected` (`SemilocallySimplyConnected/Basic.lean:112`), applied to chart balls. Local path-connectedness comes from Mathlib's `ChartedSpace.locallyPathConnectedSpace` (`Geometry/Manifold/ChartedSpace.lean:270`).

### State on main (31403074)
- LieGroups Layers 4 and 5 are unchanged, in the snapshot (README lines 330–359) and upstream.
- **The LieGroups link packet is accepted** (REV-LINK, 23 September). It records UC0 → LieGroups Layer 5 and UC1 → LieGroups Layer 5 as `alreadyRecorded` "in its owning sibling packet": the UniversalCovers packet, which is unreviewed, so neither edge is on main.
- No restructuring covers LieGroups.

### Fix
**Note for the Tau Ceti maintainer: `RepresentationTheory/LieGroups/README.md`.**
1. **Layer 5.** Replace "This construction (the covering space, the lifted group law, and the transported Lie-group structure) is **independent of Lie's third theorem** and is exactly the prerequisite Layer 4 draws on; presented here it is logically prior." with:
   > The covering space is imported, not built: `TauCeti.UniversalCover (1 : G)` with `TauCeti.UniversalCover.isCoveringMap`, `simplyConnectedSpace` and `existsUnique_continuousMap_lifts`. A connected Lie group satisfies its hypotheses: local path-connectedness from its charts (`ChartedSpace.locallyPathConnectedSpace`), and semilocal simple connectivity from its chart balls (`TauCeti.SemilocallySimplyConnectedSpace.of_forall_exists_mem_nhds_isSimplyConnected`). This layer builds the lifted group law and the transported Lie-group structure, which are **independent of Lie's third theorem** and are exactly the prerequisite Layer 4 draws on; presented here they are logically prior.
2. **Layer 5.** After "The kernel `ker p` is a discrete central subgroup isomorphic to `π₁(G)`" insert:
   > , through `TauCeti.UniversalCover.deckFundamentalGroupEquiv : Deck proj ≃* (FundamentalGroup G 1)ᵐᵒᵖ`; keep its `ᵐᵒᵖ`
3. **Layer 4.** Replace "The covering-space construction is the topological half of Layer 5 and does **not** depend on Lie's third, so it is a prerequisite developed first," with:
   > The covering space is the universal-covers roadmap's `TauCeti.UniversalCover`, and its group law and Lie structure are the first half of Layer 5; neither depends on Lie's third, so both are prerequisites developed first,

**Atlas side.** These edges are filed in /122's table; each is **acyclic**:
- UC0 → `tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-4-frobenius-lies-third-theorem-and-the-equivalence-of-categories` (new);
- UC0 → LieGroups Layer 5;
- UC1 → LieGroups Layer 5.

### Not done, and why
The lifted group law, the smooth structure, `lieMap p` and the kernel stay LieGroups', as the finding says.

## /122 (low, missing): the stage edges of UniversalCovers
**State.**
- The extract has empty `requires` and `consumers` and `"stageEdges": []`. On main the only stage edge touching UniversalCovers is the reviewed link UC0 → `tauceti:TauCetiRoadmap/RepresentationTheory/SpinRepresentations#layer-7-real-clifford-algebras-bott-periodicity-and-spinp-q` (the SpinRepresentations packet, accepted 21 September).
- The UniversalCovers packet's 11 links (8 explicit, 3 inferred) are not on main: the packet is `partial` and has no review.
- BelyiMaps still names UniversalCovers as the van Kampen supplier: lines 71, 126–128, 141–147, 156–157, 491, 1540–1543, 1648–1649, 1776–1781, 1815, 1840 and 4588–4590.

**Fix: atlas side.** In the UniversalCovers link packet (continuation job pending, then REV-LINK), record the edges below; each is **acyclic**. Re-key them if /118's snapshot move lands first.

| Edges | Evidence or source |
| --- | --- |
| UC0 → UC1, UC0 → UC2, UC1 → UC2, UC0 → UC3; UC1, UC2, UC3 → UC4 | "Ordering": "Stage 0 first … Then Stage 1 (5), then Stage 2 (7)/(8) … Stage 3 is a larger, separable track". Stage 4's applications use Stages 1–3. |
| UC0 → AT5, UC3 → AT8; UC0, UC1, UC2 → BelyiMaps L5; UC0, UC1, UC2 → BelyiMaps L6; UC2 → BelyiMaps L7 (inferred); UC0, UC1 → LieGroups L5 (inferred) | the packet's 11 links, as they stand |
| UC2 → BelyiMaps L12 | /120 |
| UC0 → LieGroups L4 | /121 |
| UC2 → `InverseGaloisAndArithmeticFundamentalGroups:IG.3` (inferred) | covers from branch-cycle tuples rest on classifying covers of a punctured sphere by transitive `π₁`-sets |

RS-33's links wait for REV-RS-33.

**Note for the Tau Ceti maintainer: `BelyiMaps/README.md`.** The van Kampen supplier is AlgebraicTopology Stage 1, as AUDIT-11's duplicate note records.
- **Line 71.** Replace "| the two-open Seifert–van Kampen theorem | 5.5 | roadmap **`UniversalCovers`** |" with:
  > | the two-open Seifert–van Kampen theorem | 5.5 | roadmap **`AlgebraicTopology`**, Stage 1 |
- **Lines 126–128, 141–147, 156–157, 491, 1540–1543, 1648–1649, 1776–1781, 1815 and 1840.** Make the same change: the van Kampen supplier becomes "[AlgebraicTopology](../AlgebraicTopology/README.md), Stage 1 (its based two-open theorem, item 4)". UniversalCovers keeps the covering-space rows.
- **Lines 4588–4590.** Replace "is UniversalCovers' (Layer 5.5 records the contract), and the general pushout theorem is on no roadmap here" with:
  > is AlgebraicTopology Stage 1's (Layer 5.5 records the contract), as is the general groupoid pushout theorem
- **5.5.** Its signature contract stays as the consumer's statement of what it applies.

The edge AT1 → BelyiMaps L5 is in /29.

## /123 (low, error): `LocPathConnectedSpace` is a deprecated alias
**Read.** Mathlib `082e2d3`, `Topology/Connected/LocallyPathConnected.lean`: `class LocallyPathConnectedSpace` (:61) and `@[deprecated (since := "2026-06-21")] alias LocPathConnectedSpace := LocallyPathConnectedSpace` (:65). Tau Ceti's `TauCeti.UniversalCover.isCoveringMap` (`Covering.lean:46`) uses `[LocallyPathConnectedSpace X]`.

**Note for the Tau Ceti maintainer.** Replace `LocPathConnectedSpace` with `LocallyPathConnectedSpace`:
- in `UniversalCovers/README.md` lines 74 and 103;
- in `BelyiMaps/README.md` lines 463, 1576, 1631, 1996 and 2070 (upstream: 503, 1617, 1672, 2037, 2111).

The state is unchanged on main and upstream.

## Sources read

All sources were read on 29 September 2026. arXiv ids were checked with the arXiv API and DOIs with Crossref.

### ArithmeticQuantumTopology (/1–/21)

All were read on 29 September 2026. Identifiers were checked with the arXiv API (export.arxiv.org) or Crossref (api.crossref.org). PDFs were fetched from the URLs given, and text was extracted with PyMuPDF. Page numbers are those of the version named.

**Pinned libraries.**
- **Mathlib 082e2d3:**
  - `Mathlib/CategoryTheory/Monoidal/Braided/Basic.lean:50`;
  - `Mathlib/CategoryTheory/Monoidal/Rigid/Basic.lean:42, 77, 732`;
  - `Mathlib/RingTheory/HopfAlgebra/Basic.lean:65`;
  - `Mathlib/CategoryTheory/Balanced.lean:32`.

  A search found no pivotal or ribbon category.
- **Tau Ceti f790474**, under `TauCeti/KnotTheory/`:
  - `PDCode/Basic.lean:26, 109, 129, 379, 406`;
  - `GaussCode/Basic.lean:26, 64` and `GaussCode/FramedUnbased.lean:25`;
  - `Markov.lean:20, 112, 203`;
  - `SmoothLink/Basic.lean:61` and `SmoothLink/Isotopy.lean:39`;
  - `TemperleyLieb.lean:23–24, 107`;
  - `Alexander.lean:312` and `Burau/Alexander.lean:329`.

  Also `TauCeti/GroupTheory/SpecificGroups/Braid.lean:97`. There is no `sorry` under `TauCeti/KnotTheory`.

**Repository at 31403074.** Read with `git show`:
- the QT README, `data/atlas.json`, the QT extract and `data/roadmap-retirements.json`;
- the QT packet and its document, and the QM packet;
- the promoted blueprints of HabiroNahmSeries, Polylogarithms, HabiroCyclotomicCompletions, HabiroNumberFields and K3BlochGroups;
- `research/blueprint/plans/HABIRO.md` (PLAN-HABIRO) and `research/blueprint/handoff/PLAN-HABIRO.md`;
- `research/blueprint/roadmaps/AnalyticHabiroStack.json`;
- `RS-10.result.json`, `RS-10.md`, REV-RS-10 and the RS-10~2 handoff;
- the READMEs of GeometricTopology, HabiroNahmSeries, Polylogarithms, QSeriesPartitionsAndMockModularForms and K3BlochGroups;
- PROTOCOL.md §§0, 3, 7, 11, 15 and 17.

**Papers read.** URLs are arXiv or the publisher unless stated. Sections are those cited in the fixes above.
- **Habiro:**
  - arXiv:math/0605314v1: §§1–12;
  - arXiv:math/0509039v2 (and v1, for numbering): introduction, Theorem 1.1, §5;
  - arXiv:math/0605313v1: Theorems 1.1, 9.13 and 11.2;
  - arXiv:math/0505219v2: the cited results.
- **Habiro–Lê,** arXiv:1503.03549v2: §§1–8, Appendix C.
- **Neumann–Yang,** arXiv:math/9712224v1.
- **Neumann,** arXiv:math/0307092v2 (the Geom. Topol. typeset).
- **Thurston,** chapters 3 and 4 of the electronic version 1.1 (https://library.slmath.org/books/gt3m/PDF/3.pdf and /4.pdf).
- **Neumann–Zagier,** published scan on Zagier's MPIM page (https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1016/0040-9383(85)90004-7/fulltext.pdf): §1, §2, Theorem 2.2.
- **GSWZ,** arXiv:2412.04241v2, PDF and TeX: §§1.5–1.8.
- **Dimofte–Garoufalidis,** arXiv:1202.6268v2 and arXiv:1511.05628.
- **Garoufalidis–Storzer–Wheeler,** arXiv:2305.14884v2.
- **Andersen–Kashaev,** arXiv:1109.6295v2.
- **Faddeev–Kashaev,** arXiv:hep-th/9310070v1.
- **Faddeev–Kashaev–Volkov,** arXiv:hep-th/0006156, §6.
- **Kashaev,** arXiv:q-alg/9601025v2.
- **Murakami–Murakami,** arXiv:math/9905075v2.
- **Garoufalidis–Zagier,** arXiv:2111.06645v3: §§1, 2.2, 4.2, 4.5 and 8.
- **Bettin–Drappeau,** arXiv:1905.02045v3.
- **Andersen–Hansen,** arXiv:math/0506456v1.
- **Ohtsuki,** Quantum Topol. 7 (2016), EMS Press open PDF: Theorem 1.1.
- **Ohtsuki–Yokota** (Cambridge) and **Ohtsuki 2017** (Crossref): abstracts only.
- **Zagier,** *Quantum modular forms* (Clay Math. Proc. 11, published volume PDF and author PDF): pp. 659–675.
- **Zagier,** Topology 40 (2001), MPIM copy of the published PDF: (7) and Theorems 1–3.
- **Lawrence–Zagier,** Asian J. Math. 3 (1999), MPIM copy: Theorems 1–3.
- **Garoufalidis–Wheeler:** arXiv:2603.01619v1 and arXiv:2505.19885v1.
- **Beliakova–Bühler–Lê,** arXiv:0801.3893v3.
- **Beliakova–Blanchet–Lê,** arXiv:0704.3669v1.
- **Garoufalidis–Lê,** arXiv:math/0309214v3.
- **Bar-Natan–Garoufalidis,** author preprint (15 January 1996).

**Records only, not read.** Bibliographic records were checked, with Crossref or zbMATH:
- Kirby 1978; Fenn–Rourke 1979; Lickorish 1962; Wallace 1960;
- Reshetikhin–Turaev 1991; Kirby–Melvin 1991; Jones 1987; Rozansky 1998;
- Epstein–Penner 1988; Prasad 1973; Meyerhoff 1986;
- Cooper–Culler–Gillet–Long–Shalen 1994; Garoufalidis–Zagier 2021; Faddeev 1995;
- Garoufalidis–Gu–Mariño 2021; Sauzin (arXiv:1405.0356); Bouis–Gazda (arXiv:2602.21894);
- Masbaum 2003; Murakami–Yokota 2018.

Their statements, where used, are taken from the papers read above, as each section says.

### AlgebraicTopology and UniversalCovers (/22–/40, /118–/123)

All read on 29 September 2026, with the header `User-Agent: tauceti-worker (mailto:worker@example.org)`.
- **Hatcher, *Algebraic Topology*.** Public PDF <https://pi.math.cornell.edu/~hatcher/AT/AT.pdf>, Last-Modified 26 October 2022, sha256 `bebb3032bf90…`; printed pages read: the table of contents, 6–7, 114, 124–125, 137–138, 157, 166, 241–246, 254, 321–322, 336, 343–344, 346, 349, 353, 355–356, 366–367, 371, 376–377, 379, 438, 441, 487–489, 496, 504, 520 and 528.
- **Hatcher, *Vector Bundles and K-Theory*.** Public PDF <https://pi.math.cornell.edu/~hatcher/VBKT/VB.pdf> (version of 7 January 2022): Theorem 3.1 (p. 77) and "The Euler Class" (p. 91).
- **Brown, *Topology and Groupoids*.** e-version <https://groupoids.org.uk/pdffiles/topgrpds-e.pdf> (Last-Modified 21 January 2020): 6.7.1–6.7.5 and Exercise 6.7.7 (pp. 240–249). Also the book page <https://groupoids.org.uk/topgpds.html> for the chapter list.
- **Brown and Razak Salleh**, *A van Kampen theorem for unions of non-connected spaces*, Arch. Math. 42 (1984) 85–88, doi:10.1007/BF01198133 (verified on Crossref). Author's scan <https://groupoids.org.uk/pdffiles/Br-razak-vKT.pdf>, pp. 85–87, read as page images since the scan has no text layer.
- **The Stacks Project**, online, most recent change listed 14 July 2026: Section 12.24 (tag 012K) and Section 12.25 (tag 012X).
- **Pinned libraries.** Mathlib `082e2d3` and Tau Ceti `f790474`: every file and line cited above.
- **Upstream repositories**, through the GitHub API:
  - TauCetiRoadmap `main` at `ca2f063`: `Completed/README.md`, `Completed/UniversalCovers/{README,STATUS}.md` and `Suggested.lean`, `TauCetiRoadmap/AlgebraicTopology/{README,STATUS}.md`, and the BelyiMaps and LieGroups READMEs;
  - commits `8679fd62a5` (#434) and `cbab78a08d` (#468);
  - Tau Ceti PR #6875.
- **Repository at `31403074`:**
  - the AlgebraicTopology, UniversalCovers, BelyiMaps, LieGroups, GeometricTopology and FuchsianOrbifolds snapshots;
  - both extracts and the UniversalCovers, LieGroups and SpinRepresentations link packets;
  - RS-09 and RS-33 (`.md`, `.result.json`) with their queue states;
  - PAPER-BENOIST-19, PAPER-BENOIST-WITTENBERG-20 and PAPER-BROWNING-SAWIN-20 (`.result.json`: routes and the items cited);
  - `data/stage-status-reports.json`, `data/tauceti-progress.json`, `data/library-coverage.json`, `queue.json`, `make_queue.py` (`paper_designs`), `scripts/decompositions.py` (`merge_links`) and PROTOCOL.md §§15–16.

### CombinatorialHeegaardFloer (/41–/58, /60, /62–/65)

All were read on 2026-09-29, fetched with the `tauceti-worker` user agent. Every arXiv id was verified with the arXiv API (export.arxiv.org), which returned the title, authors, current version and journal reference listed.
- **Book.** P. Ozsváth, A. Stipsicz, Z. Szabó, *Grid Homology for Knots and Links*, AMS SURV 208 (2015), preliminary version. URL https://web.math.princeton.edu/~petero/GridHomologyBook.pdf, sha256 `f914fc3181dcbd086577750e3c3f5325f653531aef93d3374fec1e965bf51ed9` (the review's hash), 415 PDF pages; printed page = PDF page − 5. Pages read, in full or at the cited statement: 5, 8–10, 22–25, 34–35, 38, 43–50, 53, 60–61, 68, 73, 79–80, 83, 85–86, 99–100, 105–108, 113–115, 120–122, 127–134, 135–139, 148–149, 152–153, 167, 172–175, 177, 183–184, 188–193, 199–204, 213, 216, 218, 221–224, 228–229, 235–236, 247–250, 253–254, 295, 344, 349, 358, 360–361, 363, 365, 367, 373, 382, 387, 391–392, 394–395, and the bibliography, pp. 399–406.
- **Manolescu–Ozsváth–Szabó–Thurston**, *On combinatorial link Floer homology*, arXiv:math/0610559v3 (Geom. Topol. 11 (2007) 2339–2412, doi 10.2140/gt.2007.11.2339). https://arxiv.org/abs/math/0610559. Read: Eq. (2) (PDF p. 3), the organisation (p. 4), Lemma 2.11 (p. 9), Proposition 2.15 (p. 11), the section headings, Definition 4.1 and Theorem 4.2 (p. 25), and §4.1 (p. 26).
- **Ozsváth–Stipsicz–Szabó**, *Combinatorial Heegaard Floer homology and nice Heegaard diagrams*, arXiv:0912.0830v3. https://arxiv.org/abs/0912.0830. Read PDF pp. 2–4, 7–8, 52, 67–68, 85, 88–89, 91–92 and 95–96 (references).
- **Ozsváth–Stipsicz–Szabó**, *Combinatorial Heegaard Floer homology and sign assignments*, arXiv:1301.0480v1. https://arxiv.org/abs/1301.0480. Read PDF pp. 3, 10 and 27.
- **Némethi**, *Lattice cohomology of normal surface singularities*, arXiv:0709.0841v1. https://arxiv.org/abs/0709.0841. Read PDF pp. 9–10 (3.4.1–3.4.3).
- **Sarkar**, *Grid diagrams and the Ozsváth–Szabó tau-invariant*, arXiv:1011.5265v3 (Math. Res. Lett. 18 (2011) 1239–1257). https://arxiv.org/abs/1011.5265. Read the abstract, §§1–2 (pp. 1–2) and the §4 heading.
- **Sarkar**, *Maslov index formulas for Whitney n-gons*, arXiv:math/0609673v4 (J. Symplectic Geom. 9 (2011)). https://arxiv.org/abs/math/0609673. Read the abstract and Theorems 3.2, 3.3 and 4.1 (pp. 6–8).
- **Sarkar–Wang**, *An algorithm for computing some Heegaard Floer homologies*, arXiv:math/0607777v4 (Ann. of Math. 171 (2010) 1213–1236, as OSS's reference [23] gives it). https://arxiv.org/abs/math/0607777. Read Theorems 1.1–1.2 and 3.3 with its proof.
- **Ozsváth–Szabó**, *Knot Floer homology and the four-ball genus*, arXiv:math/0301149v4 (Geom. Topol. 7 (2003) 615–639). https://arxiv.org/abs/math/0301149. Read Theorems 1.1–1.2 (PDF p. 3) and §3.2, Proposition 3.2 (PDF p. 12).
- **Ozsváth–Szabó**, *Holomorphic disks and three-manifold invariants: properties and applications*, arXiv:math/0105202v4 (Ann. of Math. 159 (2004) 1159–1245, as OSS's reference [13] gives it; the API returns no journal reference). https://arxiv.org/abs/math/0105202. Read Proposition 3.1 (lens spaces, PDF p. 10).
- **Ozsváth–Szabó**, *Holomorphic disks and topological invariants for closed three-manifolds*, arXiv:math/0101206v4. https://arxiv.org/abs/math/0101206. Consulted p. 13 (genus-one diagrams) only.
- **Ozsváth–Szabó**, *Link Floer homology and the Thurston norm*, arXiv:math/0601618v3. https://arxiv.org/abs/math/0601618. Read the abstract and Theorem 1.1 (pp. 1–2).
- **Ozsváth–Szabó–Thurston**, *Legendrian knots, transverse knots and combinatorial Floer homology*, arXiv:math/0611841v2 (Geom. Topol. 12 (2008) 941–980). https://arxiv.org/abs/math/0611841. Read p. 1.
- **Gallais**, *Sign refinement for combinatorial link Floer homology*, arXiv:0706.0089v3 (Algebr. Geom. Topol. 8 (2008) 1581–1592). https://arxiv.org/abs/0706.0089. Read the abstract and introduction.
- **Kubota**, *Grid homology for spatial graphs and a Künneth formula of connected sum*, arXiv:2308.03324v3. https://arxiv.org/abs/2308.03324. Read pp. 1–5 (Theorems 1.4, 1.7 and 1.9; Corollaries 1.6 and 1.8).
- **Földvári**, *The knot invariant Υ using grid homologies*, arXiv:1903.05893v1. https://arxiv.org/abs/1903.05893. Read pp. 1–2, Definition 5.1, Theorem 5.2 and Corollary 5.10.
- **Kubota**, *On the Upsilon invariant in grid homology*, arXiv:2412.08146v1. https://arxiv.org/abs/2412.08146. Read pp. 1–3 (Theorems 1.1 and 1.3, Proposition 1.2).
- **Verified by the API but not read beyond the abstract:** Manolescu–Ozsváth–Sarkar arXiv:math/0607691v2, Manolescu–Ozsváth–Thurston arXiv:0910.0078v4, Zemke arXiv:2111.14962v4, Ozsváth–Szabó arXiv:math/0203265v2, Juhász–Thurston–Zemke arXiv:1210.4996v4, and Piccirillo arXiv:1803.09834v2. None of these is used for a new statement here.
- **Repository and libraries.**
  - At origin/main 31403074: the CHF, GeometricTopology, HeegaardFloer and AlgebraicTopology READMEs; the CHF extract; the `data/atlas.json` stage-edge records; `data/tauceti-progress.json`; `scripts/build.py`, `scripts/tauceti_progress.py`, `scripts/decompositions.py` and `scripts/snapshot/README.md`; PROTOCOL.md §§10, 11 and 15.
  - Tau Ceti `f790474` and Mathlib `082e2d3`: every declaration cited above, read with its hypotheses.

### GeometricTopology (/59, /61, /66–/80)

All were fetched on 2026-09-29 with the worker User-Agent. Every arXiv id was checked through the arXiv API, and every DOI
through Crossref, on that date.

**Kirby's problem list.**
- R. Kirby (ed.), *Problems in Low-Dimensional Topology*: https://math.berkeley.edu/~kirby/problems.ps.gz. It is dvips
  PostScript dated 25 April 1996, 380 pages, sha256 prefix `8287809cc661744752f0`, decoded from its show-strings.
- Problems read: 1.15 (p. 16), 1.16 (pp. 17–18), 1.19 (p. 20), 1.31 (p. 23), 1.41 (pp. 28–29), 1.81 (pp. 59–60),
  1.82 (p. 60), 3.2 (p. 100), 3.34 (p. 121), 3.45 (pp. 131–132), 3.51 (p. 142), 4.4 (p. 183), 4.34 (p. 199),
  4.82 (pp. 225–226) and 4.126 (p. 247).

**Foliations (/66).**
- M. Yazdi, arXiv:1603.03822v4 (Acta Math. 225 (2020) 313–368, doi:10.4310/ACTA.2020.v225.n2.a3), §1, pp. 1–3.
- D. Gabai, M. Yazdi, arXiv:2008.07223v1 (Acta Math. 225 (2020) 369–413, doi:10.4310/ACTA.2020.v225.n2.a4), abstract and
  §1, p. 2.

**Embeddings (/67).**
- R. Daverman, G. Venema, *Embeddings in Manifolds*: the preprint copy at
  https://webhomes.maths.ed.ac.uk/~v1ranick/papers/davenema.pdf (PDF dated 2009-09-01; published as AMS GSM 106).
  Pages read: p. 23 (Chapter 1 introduction), p. 29 (Theorem 1.2.1), p. 32 (§1.3, the ∂-definition) and p. 36
  (Example 1.4.2).

**Concordance (/67, /70, /78, /80).**
- A. S. Levine, arXiv:1405.1125v2 (Forum Math. Sigma 4 (2016) e34, doi:10.1017/fms.2016.31), §1, Theorem 1.1,
  Proposition 1.3, Remarks 1.4–1.5, pp. 1–4.
- C. Livingston, *A survey of classical knot concordance*, arXiv:math/0307077v4 (Handbook of Knot Theory (2005) 319–347,
  doi:10.1016/B978-044451452-3/50008-3): §2, pp. 4–5; §3, p. 7; §6, p. 13.

**Three-manifolds (/68, /69).**
- J. Morgan, G. Tian, arXiv:0809.4040v1: the Introduction (p. 1) and §1 (p. 9).
- W. Thurston, Bull. AMS 6 (1982) 357–382, doi:10.1090/S0273-0979-1982-15003-0, from the AMS site: §1, pp. 357–358, and
  §4, p. 368.
- A. Hatcher, *Notes on Basic 3-Manifold Topology*, https://pi.math.cornell.edu/~hatcher/3M/3M.pdf: Proposition 1.4
  (p. 4), Theorem 1.5 (p. 5), the definition of atoroidal (p. 12), the Example (p. 13) and Theorem 1.9 (p. 14).
- Mathlib `082e2d3`, `Wanted/Geometry/Manifold/PoincareConjecture.lean:28–51`.

**Triangulation (/70, /71, /73).**
- C. Manolescu, *Lectures on the triangulation conjecture*, arXiv:1607.08163v3: §1, Theorem 1.1; §2, pp. 3–4, 6, 8.
- A. Hatcher, *Algebraic Topology*, the online edition at https://pi.math.cornell.edu/~hatcher/AT/AT.pdf (PDF dated
  2022-10-26): pp. 104 and 107 (§2.1), p. 520 (Proposition A.1), p. 521 (Proposition A.2), p. 527 (Corollaries A.8–A.10) and p. 529
  (Proposition A.11, Corollary A.12, and the remark on finiteness).

**Shake genus and knot traces (/59, /72, /77).**
- L. Piccirillo, arXiv:1803.09834v2 (Geom. Topol. 23 (2019) 2665–2684, doi:10.2140/gt.2019.23.2665): abstract, §1 with
  Theorem 1.1 and Corollaries 1.2–1.3 (pp. 1–2), and Theorem 2.1 (p. 7).
- L. Piccirillo, arXiv:1808.02923v1 (doi:10.4007/annals.2020.191.2.5), §1, p. 3.
- K. Yasui, arXiv:1505.02551v4 (J. Differential Geom. 132 (2026), doi:10.4310/jdg/1770827024), §1: Conjectures 1.7–1.8
  and Theorem 1.9 (p. 4), and the §4 corollary on topologically concordant pairs.

**Cobordism normal form (/79).**
- S. Sarkar, arXiv:1011.5265v3 (Math. Res. Lett. 18 (2011) 1239–1257, doi:10.4310/MRL.2011.v18.n6.a13), §2 and Lemma 2.1,
  pp. 2–3.

**Cosmetic surgery (/76).**
- S. Bleiler, C. Hodgson, J. Weeks, arXiv:math/9911247v1 (Geom. Topol. Monogr. 2 (1999) 23–34,
  doi:10.2140/gtm.1999.2.23): §1 (pp. 2–3) and the Concluding Remarks (p. 10).
- D. Futer, J. Purcell, S. Schleimer, arXiv:2403.10448v3 (J. Comput. Geom. 16 (2025) 694–736,
  doi:10.20382/jocg.v16i1a19): abstract, Definition 1.1, Conjecture 1.2 and §1.2, pp. 1–2.
- K. Ichihara, I. D. Jong (appendix by H. Masai), arXiv:1602.01542v2: abstract and §1, pp. 1–3.

**4.82 (/75).**
- D. Ruberman, R. Stern, arXiv:dg-ga/9702003v2 (Math. Res. Lett. 4 (1997) 375–378, doi:10.4310/MRL.1997.v4.n3.a6): §1 and
  Theorem 1.1, p. 1.

**Smale conjectures (/73).**
- T. Watanabe, arXiv:1812.02448v3: §1, Theorem 1.1 and Remark 1.2, p. 1. It has no DOI; it is an unpublished preprint.

**Read at the abstract only (arXiv API).**
- I. Agol (with D. Groves and J. Manning), arXiv:1204.2810v1.
- C. Manolescu, arXiv:1303.2354v4.
- R. Gompf, M. Scharlemann, A. Thompson, arXiv:1103.1601v1 (doi:10.2140/gt.2010.14.2305).
- W. Diao, H. Pan, C. Yan, arXiv:2604.17737v1.
- A. Miller, L. Piccirillo, arXiv:1702.03974v3 (doi:10.1112/topo.12054).
- J. Rasmussen, arXiv:math/0402131v1 (doi:10.1007/s00222-010-0275-6).

**Existence checked only (Crossref), not read.**
- L. Bessières, G. Besson, M. Boileau, S. Maillot, J. Porti, *Geometrisation of 3-manifolds* (doi:10.4171/082).
- Y. Mathieu, J. Knot Theory Ramifications 1 (1992) 279–296 (doi:10.1142/S0218216592000161).

**Libraries, read at the pin.**
- Tau Ceti `f790474`:
  - `Geometry/Manifold/LocallyFlat/Basic.lean:273–289`;
  - `Geometry/Manifold/LocallyFlat/Smooth.lean:195–220`;
  - `KnotTheory/Signature.lean:1–40, 108–170`;
  - `KnotTheory/Alexander.lean:300–440`;
  - `KnotTheory/Grid/Move.lean:62–160`;
  - `Topology/Triangulable.lean:25–60`;
  - `AlgebraicTopology/SimplicialComplex/Realization.lean:1–80`;
  - `Analysis/Calculus/Morse/NormalForm.lean:1–40, 362`.
- Mathlib `082e2d3`: `Topology/CWComplex/Classical/Basic.lean:99, 135`.

### GeometricTopology (/81–/95)

All read on 2026-09-29 and fetched with the worker User-Agent. arXiv ids were checked with the arXiv API and DOIs with
Crossref.

**Papers and notes.**
- D. Joyce, *On manifolds with corners*, arXiv:0910.3518v2: Definition 2.6 (p. 5), Remark 2.11 (p. 7), Proposition
  2.12 (p. 8), Theorem 3.4(iv) (p. 11).
- R. Palais, *Extending diffeomorphisms*, Proc. AMS 11 (1960) 274–277, DOI 10.1090/S0002-9939-1960-0117741-0
  (ams.org PDF): Theorems A–C, Corollaries 1–2, footnote 1.
- M. Brown, *A proof of the generalized Schoenflies theorem*, Bull. AMS 66 (1960) 74–76,
  DOI 10.1090/S0002-9904-1960-10400-4 (ams.org PDF): Theorems 0–5.
- A. Hatcher:
  - *Algebraic Topology*, online edition (pi.math.cornell.edu/~hatcher/AT/AT.pdf): Proposition 2B.1 and its comments,
    p. 169.
  - *Notes on Basic 3-Manifold Topology* (…/3M/3M.pdf): §1.1–1.2, pp. 1–15.
  - *Vector Bundles and K-Theory*, version 2.2, November 2017 (…/VBKT/VB.pdf): §3.2, pp. 88–93.
- R. Daverman, G. Venema, *Embeddings in Manifolds*, AMS GSM 106, from the Ranicki archive URL the README gives
  (webhomes.maths.ed.ac.uk/~v1ranick/papers/davenema.pdf): Exercise 0.3.2 (p. 8), Theorem 2.4.8 (p. 62), Corollaries
  2.4.11–2.4.13 (p. 64), Exercise 2.4.5 and footnote 2 (p. 65), Theorem 7.5.3 and Historical Notes (pp. 374–376),
  §8.8 (pp. 439–441).
- M. Yazdi, *On Thurston's Euler class one conjecture*, arXiv:1603.03822v4: §1, p. 2.
- J. Cannon, W. Floyd, R. Kenyon, W. Parry, *Hyperbolic Geometry*, MSRI Publ. 31 (1997)
  (library.slmath.org/books/Book31/files/cannon.pdf): §7 (pp. 69–71), Theorems 10.1–10.2 (p. 82).
- W. Thurston, *The Geometry and Topology of Three-Manifolds*, Chapter 2 (library.slmath.org/nonmsri/gt3m/PDF/2.pdf):
  pp. 2.1 and §2.5.
- D. Gabai, R. Meyerhoff, P. Milley:
  - arXiv:0705.4325v1: §1, Corollary 1.3 (p. 1); J. Amer. Math. Soc. 22 (2009) 1157–1215,
    DOI 10.1090/S0894-0347-09-00639-0.
  - arXiv:0910.5043v1: abstract, Theorem 1.1 (p. 2); Contemp. Math. 510 (2010) 81–107, DOI 10.1090/conm/510/2581832.
  - arXiv:math/0606072v2: abstract; Comment. Math. Helv. 86 (2011) 145–188, DOI 10.4171/CMH/221.
- M. Scharlemann, *Heegaard splittings of compact 3-manifolds*, arXiv:math/0007144v1: §1 (p. 2), §2.1 (p. 3), §2.4
  (p. 6), §5 (pp. 19–20).
- I. Dynnikov, arXiv:2608.23331v1: §1–2 (pp. 1–3).
- B. Benedetti, F. Lutz, arXiv:1303.2070v2 (Electron. J. Combin. 20(3) (2013) P31): Main Theorems 1–3 (pp. 3–4).
- W. B. R. Lickorish, *Simplicial moves on complexes and manifolds*, arXiv:math/9911256v1 (Geom. Topol. Monogr. 2
  (1999) 299–320): §3–4, Theorem 4.5 (p. 311).
- C. Kearton, *Mutation of knots*, Proc. AMS 105 (1989) 206–208, DOI 10.1090/S0002-9939-1989-0929430-1 (ams.org PDF).
- P. Kirk, C. Livingston, *Concordance and mutation*, arXiv:math/9912174v2 (Geom. Topol. 5 (2001) 831–883,
  DOI 10.2140/gt.2001.5.831): abstract, §2.1.
- L. Piccirillo, arXiv:1808.02923v1 (abstract); DOI 10.4007/annals.2020.191.2.5.
- T. Li, arXiv:1106.6302v2 (abstract); DOI 10.1090/S0894-0347-2013-00767-5.
- T. Watanabe, arXiv:1812.02448v3 and arXiv:2109.01609v3: abstracts.

**Kirby's problem list.** R. Kirby (ed.), *Problems in Low-Dimensional Topology* (math.berkeley.edu/~kirby/problems.ps.gz,
SHA-256 `8287809c…`), decoded from its PostScript: Problems 1.53 (p. 35), 3.15(vi) (p. 110), 3.45 Remarks (p. 131),
3.60(A) (pp. 146–147), 4.126(C) (p. 247), 5.2(A) (p. 260).

**DOIs checked, not read.** Boileau–Zieschang, Invent. Math. 76 (1984) 455–468, DOI 10.1007/BF01388469.

**Fetched but not usable.** A. Douady, *Variétés à bord anguleux et voisinages tubulaires*, Séminaire Henri Cartan
14 (1961–62), exp. 1 (numdam): the text layer is unusable.

**Not public, not read.** Hirsch GTM 33 (isotopy extension); the attributions to Radó and Moise; Livingston 1983.

### HeegaardFloer (/96–/117)

All fetched on 2026-09-29 with the header `User-Agent: tauceti-worker (mailto:worker@example.org)`. Every arXiv id below, and math/0607777 and 2109.11520, was verified with the arXiv API. The five DOIs were verified with Crossref.

Theorem numbers for TeX sources were computed from the `\include` order and the shared theorem counters.

| Source (version; URL) | Parts read |
| --- | --- |
| P. Ozsváth, Z. Szabó, *Holomorphic disks and topological invariants for closed three-manifolds*, arXiv:math/0101206v4 (TeX; https://arxiv.org/abs/math/0101206) | §2 (Propositions 2.2, 2.7 with proof, 2.15; Lemmas 2.6, 2.8; Remark 2.16; §2.6 in full); §3 (Lemmas 3.3, 3.5, 3.6; Proposition 3.9; Theorem 3.15 statement); §4.2 (Definition 4.10, Remark 4.11, Lemmas 4.12–4.14); Proposition 7.1 with proof; Theorem 7.3 statement; §8.1 statements 8.1–8.5; §8.3 statements 8.12–8.14; §8.4 text; Theorem 8.16; §9.1 opening; Theorem 9.5; Lemma 9.6 with proof; Proposition 9.8 statement; §10 opening, Theorem 10.1 with proof, the sketch of Theorem 10.2 |
| P. Ozsváth, Z. Szabó, *Holomorphic disks and three-manifold invariants: properties and applications*, arXiv:math/0105202v4 (TeX) | §3.1 (Proposition 3.1 and proof, the `S¹ × S²` computation); §9 opening; Theorems 9.1, 9.4, 9.12, 9.16, 9.21 (statements) |
| P. Ozsváth, Z. Szabó, arXiv:math/0110169v2 (TeX) | §7, Theorem 7.1 |
| P. Ozsváth, Z. Szabó, arXiv:math/0110170v2 (TeX) | §4: Definitions 4.1 and 4.9 |
| P. Ozsváth, Z. Szabó, *Holomorphic disks and link invariants*, arXiv:math/0512286v2 (TeX); Algebr. Geom. Topol. 8 (2008) 615–692, DOI 10.2140/agt.2008.8.615 | §3 (Definition 3.1, Proposition 3.3); §4 (Lemma 4.3, Theorems 4.4, 4.5, 4.7); §5 opening to the start of §5.2 |
| P. Ozsváth, A. Stipsicz, Z. Szabó, arXiv:0912.0830v3 (TeX) | §6 (Definition 6.2, the definition of `μ(D)`, Remark 6.6, Proposition 6.10 statement); §10 appendix (Lemma 10.1, Theorems 10.2–10.4, proof of 10.3); bibliography entries [KT], [perutz], [Rasmussen], [SW] |
| C. Manolescu, P. Ozsváth, S. Sarkar, arXiv:math/0607691v2 (TeX) | Theorem 1.1; §2 (Proposition 2.3); §3 (rectangle classification and count; Theorems 3.3, 3.5) |
| R. Lipshitz, arXiv:math/0502404v2 (TeX); Geom. Topol. 10 (2006) 955–1096, DOI 10.2140/gt.2006.10.955 | §4.3: Proposition 4.8 and Corollary 4.10 |
| R. Lipshitz, errata, arXiv:1301.4919v1 (TeX); Geom. Topol. 18 (2014) 17–30, DOI 10.2140/gt.2014.18.17 | opening; §1.2 first paragraph |
| S. Sarkar, arXiv:math/0609673v4 (TeX); J. Symplectic Geom. 9 (2011) 251–270 | §§1–4 |
| T. Perutz, arXiv:0801.0564v2 (TeX) | §1 (Proposition 1.1, Theorem 1.2, Corollary 1.3); §6 in full |
| I. Zemke, arXiv:2111.14962v4 (TeX) | §1: Theorem 1.1, Conjecture 1.2 and surrounding text; §1.2 opening |
| C. Manolescu, P. Ozsváth, arXiv:1011.1317v6 (TeX); Geom. Topol. 29 (2025) 2783–3062, DOI 10.2140/gt.2025.29.2783 | Introduction (completion paragraph); §11 opening; Proposition 11.5 |
| A. Juhász, D. Thurston, I. Zemke, arXiv:1210.4996v4 (TeX) | §1.2 (the Heegaard Floer functor theorem, outline); section list; Appendix A statement on `X_2(B)` |
| M. Gartner, arXiv:1908.06237v2 (TeX); Algebr. Geom. Topol. 23 (2023) 963–1054, DOI 10.2140/agt.2023.23.963 | abstract; §1.1 (Theorem 1.1); the §4 passage on signs |
| M. Abouzaid, arXiv:1312.3354v2 (TeX) | §1.3.3; §5.2.7 opening |
| C. Wendl, arXiv:1011.1690v2 (PDF, "Version 3.2", https://arxiv.org/pdf/1011.1690v2) | §2.5, pp. 49–53: Theorem 2.62, Exercise 2.63, Proposition 2.64, Lemma 2.69 |

**Library declarations** were read at Mathlib `082e2d3` and Tau Ceti `f790474`, at the file:line given in each section.

**Not available:**
- McDuff–Salamon, *J-holomorphic curves and symplectic topology* (author's server answered 403; not otherwise public);
- Milnor's and Guillemin–Pollack's degree theory;
- Rasmussen's thesis; Hattori; Macdonald;
- Sarkar–Wang (id only);
- Zemke arXiv:2109.11520 (id only).

Kutluhan–Lee–Taubes and Colin–Ghiggini–Honda were not needed: no finding in /96–/117 concerns the HF = HM = ECH reconciliation.
