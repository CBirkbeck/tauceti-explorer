# RT-AREA-etale: fixes

Fixer: Claude Code, session `cc-39fac3`, 29 September 2026 (issue #3978, job FIX-RT-AREA-etale).
- Findings: `RT-AREA-etale.result.json`: 40 findings (6 high, 30 medium, 4 low), by `cc-38267a`.
- Verdicts: `RT-AREA-etale.review.json` and `research/blueprint/reviews/REV-RT-AREA-etale.md`, by `codex-hjdg0j`:
  37 confirmed, 3 rejected (/10, /24, /36).
- Everything below was checked at origin/main `1b1aeb19`.
  - The graph checks use the atlas as `scripts/build.py` assembles it at that commit (2840 stages, 7792 stage edges):
    accepted restructurings, promoted blueprints, decompositions and new roadmaps included.
  - Every edge this report adds was tested for a reverse path in that graph. "The cycle test for A → B" asks whether the assembled graph has a path B → … → A. "Acyclic" means it has none, so adding A → B closes no cycle.

## How to read this report

This report is the job's only deliverable, and the intake accepts no other file for it. Every fix is therefore
written as an exact edit for the maintainer, or for the design and blueprint jobs that will expand these roadmaps:
- **Roadmap prose** (`content/campaign/<Roadmap>/README.md`): the old sentence is quoted and the replacement is
  given in full.
- **Stage edges**: an edit to the consumer's `**Dependencies:**` or `**Inputs.**` line where its README has one, and
  to its `requires` list and the `stageEdges` record in `data/atlas.json`. Removals are marked as the maintainer's.
- **Paper items and routes** (`research/blueprint/papers/PAPER-<id>.result.json`): the item or route, the field,
  the old value and the new value.
- **New stages, suffixes and Part II briefs**: the statements with their hypotheses and the source locators read.

The binding rule is the verifier's: a confirmation authorizes only the corrected scope in its reason. Each
section starts with those corrections, then says what `main` says now, then gives the fix.

**Proposals still under review that these fixes touch.**
- `RS-10~2` (Habiro, submitted 29 September 2026, review pending).
- `RS-27` (algebraic moduli, modular curves and stable reduction, review pending).

Where a fix depends on one of them, its section says so.

**Routes that are not in force.** Six papers' overall reviews are still `revise`: ABE-25, YANG-ZHAO-25,
SHENDE-TSIMERMAN-17, HARPAZ-WITTENBERG-16, BRIGHT-NEWTON-23 and JANNSEN-16. The queue applies none of their routes.
Edits to those routes are corrections to make before those papers are accepted; they are not changes to active
design jobs.

**Review verdicts.** Some fixes add a paper route or change a route's kind. `make_queue` applies a route only when
the paper's review file carries a verdict for it. This report writes no verdicts: it names, for each such route, the
entry to record. The maintainer decides whether to record `accept` on the strength of the confirmed finding, or to
wait for the paper's next review.

**Disclosure.** This session did not write the red team or its verification, and wrote none of the eight roadmaps.
It did write or check other work that some findings touch:
- `RS-10~2`, the pending Habiro restructuring;
- the extractions of HARPAZ-WITTENBERG-16, BRIGHT-NEWTON-23 and JANNSEN-16 (routes the findings correct);
- with its sibling session `cc-fb70e5`, other extractions and reviews of papers routed into this area.

Where a finding concerns that work, the fix follows the verifier's reason and nothing else.

## Summary

The "When" column says when an edit takes effect:
- **now:** the maintainer can apply it to `main`;
- **blueprint:** it goes into a packet through its blueprint job;
- **verdict:** a new or re-kinded route needs a review verdict first;
- **revision:** a route of a paper whose overall review is still `revise`;
- **QW promotion:** it waits for the draft QWittVectors to enter the atlas.

| # | Finding | Fix | When |
|---|---|---|---|
| /1 | high, missing | New stage DWP.8:equidistribution (Weil II §§2.1, 3.5). Schiffmann's density leaves DWP.0 for the LPV universal-monodromy Part II, with Katz–Sarnak's curve families. Three Schiffmann source issues. | now; route: verdict |
| /2 | high, duplicate | Absolute purity has one owner, the EDC absolute-purity Part II (AP.0–AP.3). SF.2 keeps its site prefix; a new sink SF.2:brauer-purity imports purity. Supports go to EDC.0. | brief now; CS19 route: verdict |
| /3 | high, missing | New Part II on Artin and Deligne–Mumford stacks (ST.0–ST.6), carried by Lafforgue route 5. The Yun–Zhang items move there. No D_c^b and no stack decomposition theorem is promised. | verdict |
| /4 | high, missing | StableReductionPartII owns M̄_{g,n} (2g−2+n > 0, Knudsen) and de Jong's projective covers (n ≥ 3). L5:alterations, Landesman–Litt and the moduli-motives roadmap import them. | brief now; LL route: verdict |
| /5 | high, missing | New suffix H3:smooth-duality: compact-support comparison, trace and relative duality in every dimension, in Huber's scope. It feeds H5; H3 keeps curves. | now |
| /6 | high, missing | HQ.5 keeps Theorem 4.22(a), with Meyer–Wagner v4 Lemma 3.16. HQ.5-trace takes 4.22(b), a lift of R_∞. RT.4:q-Hodge gets the E₁ target (ku 4.14, 4.16, 4.17). Locators corrected. | now |
| /7 | medium, missing | FF.2 owns Lang–Weil in families and Chebotarev in families with FA.5's constant-field coset (two packet nodes). The HW16 and BN23 routes point to FF.2. WC.5 gets a boundary note. | now; blueprint; revision |
| /8 | medium, duplicate | Seven supplier fields point to RS-17's owners: DWP.1; FA.5 with WC.1 or DWP.3; DWP.7 with DWP.6. Skinner keeps R19.1. | now (records) |
| /9 | medium, duplicate | RD.6 imports DWP.0's Weil numbers and ι-weights. Edge DWP.0 → RD.6; the RS-17 owner entry gains RD.6. | now |
| /10 | rejected | No change. | — |
| /11 | medium, duplicate | The Gysin class of a regular immersion has one early owner, AP.0 of the purity Part II. It uses only EDC.0's closed-immersion i^!. | with /2 |
| /12 | medium, missing | Characteristic cycles in characteristic 0: a new Lawrence–Sawin route 6 into the Microlocal Part II. The ℓ-adic/complex comparison is an open obligation. One Lawrence–Sawin misprint. | verdict |
| /13 | medium, library-claim | The IndConstructibles Part II imports Mathlib's Serre-class localization (declarations read at the pin). The items keep the remaining obligations. | now |
| /14 | medium, duplicate | FF.2 is the single owner of L_ψ, widened to finite coefficients, arbitrary F-schemes and F_q/F_p. A normalized global–local Fourier comparison goes to the LPV Part II. | blueprint; now; revision |
| /15 | medium, duplicate | The general-bases Part II imports L2 (Abe's Lemma 1.4, routed to L2) and H1's valuation stages, with comparison obligations. A07 and A14 are not re-marked. | revision |
| /16 | medium, error | Zhu route 7 becomes a Part II on perfect schemes, equivariant coefficients and hyperbolic localization (PE.0–PE.4), with every proof gate kept. | verdict |
| /17 | medium, error | Edge L3 → EDC.6; the decomposition's integration gap is closed. | now |
| /18 | medium, error | New prefix LPV.2:transcendental: SGA 7 XIV comparison, the complex formula, the cup/trace compatibility and XIX n°4. Illusie's algebraic route is recorded, not planned. | now |
| /19 | medium, other | The make_queue collision was repaired upstream on 28 September. Merged briefs are given for the two shared ids, with maintainer notes. | revision |
| /20 | medium, duplicate | Arc imports Huber 3.2.11 from H1:henselian and plans only the strongly-noetherian case. Gabber's theorem is not re-marked; its single owner is left to two pending reviews. | now (records) |
| /21 | medium, duplicate | New schematic prefix L5:alterations (de Jong 4.1, 5.8, 6.5), needing neither H1 nor H5. SF.4, RD.5, AdicSpacesPartII F1 and eight papers import it. | now |
| /22 | medium, error | One merged Part II brief for prime-to-ℓ alterations: ILO X 2.1 and 2.4, Dittmann–Pop's case, and the proof branch. Jannsen's reason is corrected. | now; revision |
| /23 | medium, error | Edge SF.2 → L1, naming Bhatt–Scholze's pro-étale exports and the unbounded caveat. | now |
| /24 | rejected | No change. | — |
| /25 | medium, duplicate | A0-extension owns the classical coherent duality core. A new suffix takes Zavyalov §2.2; AS.1 keeps its formalism and proves a comparison. Six consumer briefs are re-pointed. | now; Zavyalov route: verdict |
| /26 | medium, error | New late suffix H1:henselian:perfectoid-limit (Česnavičius 4.10), requiring P7 (not P5); footnote 3 becomes a P7 target. | now |
| /27 | medium, duplicate | PLAN-HABIRO §6.5 applied with QWittVectors' promotion: node moves, new HQ.4 text, edge removals. The conflict with RS-10~2 is flagged. | QW promotion |
| /28 | medium, duplicate | New draft stage QW.6:framings, shared by PR.6 and HQ.1. | QW promotion |
| /29 | medium, missing | q-connections in HQ.1 (the torus equivalence is a gap); Example 3.12 and Corollary 3.54 in HQ.3; the twisted branch in HQ.2. | now; QW promotion |
| /30 | medium, missing | HQ.6 names its draft analytic suppliers; the comparison stays a stated problem. | now |
| /31 | medium, error | Theorem 3.11(b) is stated on the Habiro–Hodge quotient; the completed statement is separate. | now |
| /32 | medium, error | Edge HR.1 → HQ.1 (QW.1 later). | now |
| /33 | medium, error | Edge HQ.5-trace → HQ.7. The maintainer removes HQ.6 → HQ.7; the RS-10~2 conflict is flagged. | now |
| /34 | medium, error | HQ.2 names DD.1 and DD.2. DD.3 → HQ.1 is added; the maintainer removes DD.6 → HQ.2. | now |
| /35 | medium, other | HQ.5's scheme descent and perfectness become separate targets, with their source status and four named gaps. | now |
| /36 | rejected | No change. | — |
| /37 | low, error | WC.2's trace-formula node moves to EDC.8. A new WC.2 node derives the functional equation (Milne 27.12–27.13). | now |
| /38 | low, error | Edge DWP.4 → DWP.5 removed. | now |
| /39 | low, other | The invalid area `cohomology` becomes `etale`; the Microlocal title is restored; SemistablePotentialMaps imports LPV.7:semistable-curves with a named SNC extension. | now; revision |
| /40 | low, other | HQ.5 and HQ.5-trace get separate text blocks. | now |

**Sources no one here could read.** What depends on them is kept as an open obligation, not stated as fact:
- Huber 1996;
- Illusie 2002, *Sur la formule de Picard–Lefschetz* (only its erratum);
- Lang–Weil 1954, Nisnevič 1954 and Ekedahl 1990;
- Kashiwara–Schapira, Kashiwara's index theorem and Ginzburg 1986;
- ILO Exposés VI, VIII and IX, Vidal 2004b, de Jong 1997 and Temkin 2010;
- Fujiwara 2002, Braden 2003 and Varshavsky's contracting correspondences;
- Sutor's thesis;
- the V5A4 course notes.

## /1 (high, missing): Schiffmann's density of curve Weil numbers leaves DWP.0; a new DWP.8:equidistribution owns Weil II §3.5, and the LPV Part II gains Katz–Sarnak's curve families

### What the verifier corrected

- Schiffmann v2 Proposition 4.8 and Appendix B (pp. 35–36) prove that the Frobenius tuples that occur are dense. They do not prove purity of one tuple. Route 3's assignment to DWP.0's spectral bookkeeping is wrong; DWP.0 keeps weights.
- Two inputs are missing and distinct: equidistribution (Weil II 3.5.1–3.5.3, pp. 210–211) and maximal monodromy (Katz–Sarnak 10.1.16/10.2.2, pp. 299/301).
- Add them downstream of the actual Weil II estimates and monodromy suppliers, extending the existing LPV Part II direction.
- Keep arithmetic and geometric monodromy apart, with their component and coset hypotheses. Katz–Sarnak's statements concern explicit hyperelliptic and Artin–Schreier families, so a moduli-family passage is needed.
- Do not copy Appendix B's twist (−1) as a weight-zero normalization: the normalized eigenvalues are q^{−n/2} times the weight-one ones and need an explicitly chosen unramified scalar.
- Correct Schiffmann's [D1] reference to Weil II. Claim no new dependency closed.

How the fix follows this:
- the equidistribution theorem becomes a DWP substage below DWP.7 and DWP.8;
- the monodromy theorem, the moduli-family passage and the density corollary go to the pending LPV Part II design, in Browning–Sawin route 6's direction;
- the twist is the half twist by a chosen square root of q, which is DWP.5's rank-one twist;
- the reference goes in as a `sourceIssues` entry.
The red team's "re-route /36 to the new DWP layer" is not followed. The density needs the monodromy as well, and the verifier puts that in the LPV Part II, so /36 goes there and imports the DWP layer.

### State on main (1b1aeb19)

**The route and the item are unchanged since the verification.** `research/blueprint/papers/PAPER-SCHIFFMANN-16.result.json` was last changed on 2026-09-23.
- Route 3 (`routes[2]`) is `"route": "source"` to `DeligneWeightsAndPurity:DWP.0` with item `PAPER-SCHIFFMANN-16/36`. Its reason says: "The statement proved in this paper's Appendix B is of the same kind and is not planned there".
- The review (`PAPER-SCHIFFMANN-16.review.json`, route 3) says "accept". Its reason: "the item is the purity/weight statement about Frobenius eigenvalues that the paper cites".
- The paper's overall verdict is accept, so the route is live: `make_queue.py` adds it to DeligneWeightsAndPurity's source list.
- Item /36: `"status": "missing"`, `"planned": []`. Locator: "arXiv:1406.3839v2 (4 October 2014), Proposition 4.8, proved in Appendix B".
- Route 1 (`routes[0]`, the new roadmap CountingBundlesAndHallAlgebrasOfCurves; design job `DESIGN-CountingBundlesAndHallAlgebrasOfCurves`, pending) says two things that must change:
  - "the density is what gives uniqueness in Theorem 1 and is routed separately as a source of DeligneWeightsAndPurity";
  - "Weil q-numbers, their weights and the functorial linear algebra of eigenvalues from Deligne weights, purity and the Weil bounds (DeligneWeightsAndPurity), stage DWP.0, of which this paper is also a source".
- `RT-PAPER-SCHIFFMANN-16` (red team) is pending.

**DWP.0 and its packet.**
- DWP.0 still reads "Sources: Weil I §§1.4–1.7/3.1; Weil II §§1.2/1.6; no general weight theorem".
- Its packet `research/blueprint/packets/DeligneWeightsAndPurity--DWP.0.json` (checkpoint 4, 2026-09-29) gives DWP.0 coverage `source_decomposed` with `remaining: []`. It never planned /36.

**Weil II §3.5 is now routed, but no stage owns it.**
- DWP.8's sources are "Weil II3.4.1–3.4.13,6.1.1–6.1.12,6.2.1–6.2.6". LPV.7:invariant-cycles starts at "Deligne II 3.6.1".
- No stage text in DWP, LPV, EDC, WIC or WC mentions equidistribution or Katz–Sarnak (atlas grep).
- New since the verification: `PAPER-DELIGNE-80` (Weil II) was extracted and accepted on 2026-09-29, before 1b1aeb19.
  - Its accepted route 1 is a source route to DWP.5, DWP.6, DWP.7, DWP.8 and DWP.10. It carries the items `s2-2.1.10-*` to `s2-2.1.13-*` and `s3-3.5.1-*` to `s3-3.5.7-*`, all `missing`.
  - The route's reason says 3.5.3 and 3.5.7 are something "which DWP.10's arithmetic interfaces should export", but names no owning stage.
  - Its item notes record that DWP.5 plans only the non-vanishing argument (2.2.10), not 2.1.10–2.1.13 or 3.5.
  - Its confirmed `sourceIssues` bear on §3.5: E36 (G⁰(F) in 2.2.4 b)), E38 and E72 (the weight in 2.2.8(i) and 3.5.1 is −2ℛ(τ), not 2ℛ(τ)), E48 ((3.5.2.1) indices), E50 (the Sato–Tate measure is (2/π) sin²θ dθ, not (1/2π) sin²θ dθ) and E51 (the point count is 1 − 2cos θ(x)·q^{n/2} + q^n).

**The LPV Part II.**
- It is `PAPER-BROWNING-SAWIN-20` route 6 (`routes[5]`): `"route": "part-ii"`, `"parent": "LefschetzPencilsAndVanishingCycles"`, `"roadmap": "UniversalHypersurfaceMonodromy"`, title "Lefschetz pencils, nearby cycles and vanishing cycles, Part II: universal hypersurface monodromy". The review accepts it and the paper is accept.
- Its brief has Katz–Sarnak 11.4.9 as the exact target: "for hypersurface dimension s≥1 and k≥3, excluding (s,k)=(2,3), geometric Zariski monodromy is Sp for odd s and full O for even s".
- The design job is `DESIGN-LefschetzPencilsAndVanishingCyclesPartII`, pending, order 29, roadmap id `LefschetzPencilsAndVanishingCyclesPartII`.
  - `make_queue.py` (`paper_designs`) merges into it every accepted part-ii route whose parent is LefschetzPencilsAndVanishingCycles: Browning–Sawin route 6, KISIN-ZHOU-25 route 11 and LIU-ETAL-22 route 16.
  - ABE-25 route 5 and YANG-ZHAO-25 route 4 are left out while those papers are revise.
  - Prompts are regenerated on every queue build and are not committed, so an accepted route added now reaches the job. No packet or roadmap file exists for it yet.

**Both versions of Schiffmann, read.**
- The published version (Annals of Mathematics 183 (2016), Appendix B, p. 357) already fixes two things:
  - the twist: "Let us fix … a square root q^{1/2} of q in Q̄l … Set F = R¹ρ!(Ql)(1/2), a pure lisse sheaf of weight zero";
  - the moduli passage: "In [KS99, §10.1, 10.2], Katz and Sarnak constructed a family ρ : X → Ug of smooth projective curves over Fq of genus g".
- Its reference is still wrong: "[Del74, 3.5.3]", with [Del74] = Weil I, Publ. Math. IHÉS 43 (1974), 273–307 (p. 359).
- Proposition 4.8 of v2 is Proposition 4.7 in print (p. 321).

**Libraries.** Neither pinned library has Weil numbers, equidistribution of Frobenius classes, Sato–Tate or curve-family monodromy. The declaration index has no match for `SatoTate|equidistrib|LangWeil|IsWeilNumber`, and the only Chebotarev is number-field (`NumberField.Chebotarev.*`, Tau Ceti). Tau Ceti does have:
- Haar probability, `TauCeti.haarProb` (`TauCeti/RepresentationTheory/Compact/Haar.lean:93`);
- the Peter–Weyl uniform density `TauCeti.dense_representativeSubmodule` (`TauCeti/RepresentationTheory/Compact/RepresentativeDensity.lean:117`: "The representative ring `𝓡(G)` of a compact group is uniformly dense in `C(G, 𝕜)`").

### Fix

The edits are in dependency order: the stage (1.1) before the routes that name it.

**1.1 `content/campaign/DeligneWeightsAndPurity/README.md`: new substage after DWP.8.** Insert this before `<a id="dwp-9"></a>`:

> <a id="stage-DWP.8:equidistribution"></a>
> ## DWP.8:equidistribution. Deligne's equidistribution theorem
>
> **Milestone:** `DWP.8:equidistribution`
>
> This substage owns Weil II §3.5 and the part of §2.1 it rests on. It proves no new
> weight bound: it is downstream of DWP.7's estimates. Work in the setting of Weil II
> 2.2.4 and 3.5.1:
> - X₀ is normal and geometrically connected of dimension N over F_q, with a base point x̄;
> - there is a morphism from the extension π₁(X, x̄) → W(X₀, x̄) → ℤ to an extension G⁰ → G → ℤ;
> - (a) G⁰ is an algebraic group over Q̄_ℓ, an extension of a finite group by a semisimple group;
> - (b) π₁(X, x̄) maps continuously into some G⁰(E_λ), with Zariski-dense image;
> - (c) some representation of G with finite kernel on G⁰ gives an ι-mixed lisse sheaf.
>
> Import from DWP.5:
> - the compact form G_ℝ (2.2.1);
> - the conjugacy of the semisimple part (ιF_x)_s into G_ℝ, unique up to G_ℝ-conjugacy (2.2.2, 2.2.6);
> - the dictionary 2.2.8: an irreducible τ of G_ℝ gives a punctually ι-pure sheaf of weight −2ℛ(τ) (the sign as corrected in PAPER-DELIGNE-80/E38 and E72), and L(τ, s) = Z(𝓕(τ_ℓ), q^{−s});
> - the non-vanishing theorem 2.1.4.
>
> For a punctually ι-pure lisse sheaf on a normal X₀, get (a)–(c) from DWP.8's geometric
> semisimplicity (3.4.1(iii)) and Weil II 1.3.9, as in Example 2.2.5.
>
> Prove here:
> 1. Weil II 2.1.10–2.1.13 for Γ ≅ ℤ. Non-vanishing on ℛ(τ) = 1 gives equidistribution
>    of the classes after translation by a central element z of degree d > 0, with the Weyl-criterion
>    form 2.1.13.
> 2. Weil II 3.5.1. By 2.2.8.1, Grothendieck's cohomological formula for L-functions and DWP.7's
>    bound 3.3.4 with its variant 3.3.10, L(τ) is meromorphic, with zeros and poles only where
>    ℛ(τ) is an integer or a half-integer. For ℛ(τ) > N − 1/2 it is holomorphic and invertible,
>    except for a simple pole at τ = ω_N.
> 3. Theorem 3.5.3. For every i, the measures
>    z^{−n}(q^{−N(nd+i)} Σ_{x∈X₀(F_{q^{nd+i}})} δ[(ιF_x)_s]) on the degree-i conjugacy classes
>    of G_ℝ converge vaguely to μ₀^♮ restricted to them, where μ₀ is Haar measure normalised
>    by vol(G_ℝ⁰) = 1. Use (3.5.2.1) with the indices of PAPER-DELIGNE-80/E48.
>
> The Frobenius class of an F_{q^m}-point has degree m, and the theorem says nothing about
> classes of any other degree. For a finite G⁰ it is Chebotarev with the constant-field
> condition, not a statement about every class of G.
>
> Also export the weight-zero form, Katz–Sarnak Theorem 9.2.6(1). Let X/k be smooth and
> geometrically connected, and 𝓕 lisse and ι-pure of weight 0. Let G_geom be the Zariski closure
> of its geometric monodromy, and suppose the arithmetic image lies in G_geom(Q̄_ℓ). Then the
> classes ϑ(E, x) are equidistributed for the Haar probability measure of a maximal compact
> subgroup K ⊂ G_geom(ℂ) as Card(E) → ∞.
> - The containment of the arithmetic image is a hypothesis that each consumer checks. It usually
>   holds only after DWP.5's rank-one twist by a chosen square root of q, which is not a Tate twist.
> - Plan one proof route, not both. Either Deligne's, above, or Katz–Sarnak's: the Weil II bound,
>   the trace formula, the Lang–Weil count 9.0.15.2 and Peter–Weyl.
> - The uniform density of characters in continuous class functions follows from
>   `TauCeti.dense_representativeSubmodule` by averaging over conjugation. Plan that step here
>   unless CompactGroups Layer 6 supplies it.
>
> Acceptance:
> - Weil II 3.5.4–3.5.7 for a family of elliptic curves with non-constant j. Take Lemma 3.5.5
>   (G⁰ = SL(V)) as a hypothesis, since its proof uses the transcendental monodromy of modular curves.
>   Then G_ℝ = SU(2) × ℤ, and the limit law is (2/π) sin²θ dθ, not the printed
>   (1/2π) sin²θ dθ (PAPER-DELIGNE-80/E50).
> - A finite geometric monodromy group, where 3.5.3 is Chebotarev with the constant-field coset.
> - A constant rank-one sheaf on which Frobenius acts by a scalar of absolute value 1 that is not a
>   root of unity. Its arithmetic image is not in G_geom, so the 9.2.6 form does not apply.
>
> **Dependencies:** DWP.5 (Weil II 1.2.7, 1.3.9, 2.1.1–2.1.4, 2.2.1–2.2.9); DWP.7 (3.3.4, 3.3.10);
> DWP.8 (3.4.1(iii)); PR196 sheaf L-functions; Tau Ceti RepresentationTheory/CompactGroups
> Layers 0, 5 and 6.
> **Sources:** Weil II 2.1.10–2.1.13, 3.5.1–3.5.7 (pp. 191–192, 210–212); Katz–Sarnak, Random
> Matrices, Frobenius Eigenvalues, and Monodromy, 9.2.6 (pp. 276–278).

For `data/atlas.json`, the maintainer adds the matching stage record:
- id `DeligneWeightsAndPurity:DWP.8:equidistribution`, key `DWP.8:equidistribution`, `parentStageId` `DeligneWeightsAndPurity:DWP.8`, like `WeilConjectures:WC.5:power-sum-converse`;
- `requires`: `DeligneWeightsAndPurity:DWP.5`, `DeligneWeightsAndPurity:DWP.7`, `DeligneWeightsAndPurity:DWP.8`, `tauceti:TauCetiRoadmap/RepresentationTheory/CompactGroups#layer-0-normalized-haar-measure-and-averaging`, `…#layer-5-the-peter-weyl-theorem`, `…#layer-6-characters-of-compact-groups`.

Edges and cycle checks (on the assembled graph at 1b1aeb19; "acyclic" means no path back from the target to the source):

| Edge | Result |
|---|---|
| DWP.5 → DWP.8:equidistribution | acyclic |
| DWP.7 → DWP.8:equidistribution | acyclic |
| DWP.8 → DWP.8:equidistribution | acyclic |
| CompactGroups Layer 0 → DWP.8:equidistribution | acyclic |
| CompactGroups Layer 5 → DWP.8:equidistribution | acyclic |
| CompactGroups Layer 6 → DWP.8:equidistribution | acyclic |

The stage is new and has no out-edges, so no edge into it can close a cycle. Its consumers are the LPV Part II below and, through it, CountingBundlesAndHallAlgebrasOfCurves. Both are drafts, so these are links for the design jobs, not atlas edges.

The anchor follows LPV's convention for substages (`stage-LPV.7:invariant-cycles`). The substage should join the scope of `BP-DeligneWeightsAndPurity--DWP.7` (pending; scope DWP.7, DWP.8, DWP.9).

**1.2 `research/blueprint/papers/PAPER-DELIGNE-80.result.json`, `routes[0]` (route 1).** This names the owner of the routed §2.1/§3.5 items.
- `stages`: append `"DeligneWeightsAndPurity:DWP.8:equidistribution"`.
- `reason`: replace "and the equidistribution theorem (3.5.3) with the function-field Sato–Tate theorem (3.5.7), which DWP.10's arithmetic interfaces should export." with:
  > and the equidistribution theorem (3.5.3) with the function-field Sato–Tate theorem (3.5.7) and the method (2.1.10)–(2.1.13), which DWP.8:equidistribution owns and DWP.10's arithmetic interfaces re-export.

If the maintainer prefers not to touch a route accepted the same day, 1.1 alone is enough. The new stage names these items, and the DWP blueprint job reads both.

**1.3 `research/blueprint/papers/PAPER-SCHIFFMANN-16.result.json`, `routes[2]` (route 3).** Replace the whole object with:

```json
{
 "route": "part-ii",
 "parent": "LefschetzPencilsAndVanishingCycles",
 "roadmap": "UniversalHypersurfaceMonodromy",
 "title": "Lefschetz pencils, nearby cycles and vanishing cycles, Part II: universal hypersurface monodromy",
 "area": "etale",
 "items": ["PAPER-SCHIFFMANN-16/36"],
 "reason": "Proposition 4.8 (Proposition 4.7 in print) says which tuples of Frobenius eigenvalues occur, not what one Weil number satisfies, so DWP.0 cannot own it (REV-RT-AREA-etale/1). Its proof needs two inputs. The first is the big geometric monodromy of an explicit family of curves (Katz–Sarnak 10.1.16), which LPV.5 does not plan: LPV.5 proves open symplectic monodromy for pencil radical quotients. The second is Deligne's equidistribution theorem (Weil II 3.5.3), which DeligneWeightsAndPurity:DWP.8:equidistribution supplies. Browning–Sawin route 6 opens this Part II for Katz–Sarnak's universal-family monodromy (11.4.9). This continuation adds the curve families of their Chapter 10 and the density corollary.",
 "brief": "Extend the universal-family monodromy direction of Browning–Sawin route 6 (Katz–Sarnak 11.4.9) with the families of curves of Katz–Sarnak Chapter 10, and derive Schiffmann's density of Weil numbers from them. Import LefschetzPencilsAndVanishingCycles LPV.0–5, EtaleDualityAndPerverseSheaves EDC.2–4, DeligneWeightsAndPurity DWP.0 (Weil numbers), DWP.5 (the rank-one twist) and DWP.8:equidistribution, and Tau Ceti RepresentationTheory/LieGroups Layer 6 (maximal tori and the Weyl group). (1) Katz–Sarnak Theorem 10.1.16 (p. 299; setting 10.1.1–10.1.3, p. 293). Let k be a finite field of characteristic p ≠ 2, g ≥ 1, and f ∈ k[X] of degree 2g with 2g distinct roots in k̄. The family Y² = f(X)(X − T) over U = Spec(k[T][1/f(T)]) is proper and smooth, with geometrically connected fibres of genus g. For every ℓ ≠ p, the Zariski closure G_geom of the geometric monodromy of R¹π_!Q̄_ℓ on U is Sp(2g). Decompose the proof as the source does: Lemma 10.1.9 (lisse of rank 2g, pure of weight one, with a symplectic autoduality with values in Q̄_ℓ(−1), so G_geom ⊆ Sp(2g)); 10.1.12 (tame at ∞, by the Euler–Poincaré formula); 10.1.13 (local monodromy at each root of f is trivial or a unipotent pseudoreflection); 10.1.14 (G_geom is connected and generated by unipotent pseudoreflections); 10.1.15 (irreducibility, by the diophantine criterion, using the Weil II bound on H¹_c and the Riemann hypothesis for y² = f(x)); and the Kazhdan–Margulis step of 10.1.16 ([Ka-ESDE, 1.5]). Request the Euler–Poincaré formula from its owner; do not plan it here. (2) Katz–Sarnak Theorem 10.2.2 (p. 301): the characteristic-2 family Y² − Y = X^{2g−1} + T/X over G_{m,F₂} also has G_geom = Sp(2g). Katz and Sarnak only sketch its proof and refer to Sutor's 1992 Princeton thesis, which was not read. Step (3) does not need it (take q odd), so plan it only for a characteristic-2 consumer, and then as a source-closure task. (3) Schiffmann, Proposition 4.8 of arXiv v2 = Proposition 4.7 of Annals 183 (2016), p. 321, proved in Appendix B (v2 pp. 35–36; published pp. 357–358). Fix ℓ and ι : Q̄_ℓ → C. The set W of classes σ_X ∈ T_g/W_g of the Weil numbers of smooth projective geometrically connected curves of genus g over finite fields of characteristic ≠ ℓ is Zariski dense. Follow the published proof. Fix q odd and prime to ℓ, and a square root q^{1/2} ∈ Q̄_ℓ with ι(q^{1/2}) = +√q. Let F = R¹π_!Q̄_ℓ(1/2), where Q̄_ℓ(1/2) is DWP.5's rank-one twist, on which a geometric Frobenius of degree n acts by (q^{1/2})^{−n}; it is not a Tate twist. Then F is ι-pure of weight 0, its arithmetic image lies in Sp(2g) (the pairing of (1) now takes values in Q̄_ℓ), and G_geom = Sp(2g) by (1). These are the hypotheses of the Katz–Sarnak 9.2.6 form of DWP.8:equidistribution. So the classes with eigenvalues (q^{1/2})^{−n}σ_i are equidistributed in the conjugacy classes of USp(2g), hence dense in T/W_g, for the maximal torus T ≅ (S¹)^g. Chenevier's argument (published p. 358) then gives Zariski density of W_q, hence of W: use the map T × R^× → T_g, (z, t) ↦ tz, and the leading coefficient in t of a function vanishing on W_qW_g. Every fibre of the family is a curve of Schiffmann's class X_g, so no moduli space of curves or universal curve over it is needed. This is how the published version replaces v2's open subset M°_g. Do not normalise by v2's ordinary twist (−1): it gives weight 3. Consumer: CountingBundlesAndHallAlgebrasOfCurves, the uniqueness half of Theorem 1. Tests: g = 1, against Weil II 3.5.6–3.5.7 with the measure (2/π) sin²θ dθ (PAPER-DELIGNE-80/E50); a value t that is a root of f, excluded from U; the other choice of ι(q^{1/2})."
}
```

The route's title and roadmap id are those of Browning–Sawin route 6. That marks the same direction, and `paper_designs` merges both into `DESIGN-LefschetzPencilsAndVanishingCyclesPartII` anyway.

**1.4 `research/blueprint/papers/PAPER-SCHIFFMANN-16.review.json`, `routes[2]`.** The route changes kind, so its verdict needs a fresh decision (see "Review verdicts" at the top). If the maintainer records `accept` on the strength of REV-RT-AREA-etale/1, the `reason` changes as follows.
- Old: "Source route into DeligneWeightsAndPurity DWP.0, 1 item. Accepted. DWP.0 is 'Eigenvalue weights and functorial linear algebra'; the item is the purity/weight statement about Frobenius eigenvalues that the paper cites, and E4's two summation-index slips are in exactly the statements that consume it, so the design job inherits them corrected."
- New:
  > Re-routed by FIX-RT-AREA-etale after REV-RT-AREA-etale/1 confirmed that DWP.0 cannot own the item: a part-ii continuation of LefschetzPencilsAndVanishingCycles, 1 item, extending Browning–Sawin route 6 to Katz–Sarnak's curve families and importing DeligneWeightsAndPurity:DWP.8:equidistribution. The item is a density statement about the Frobenius tuples that occur, not a purity statement about one of them. E4's two summation-index slips are in the statements that consume it, so the design jobs inherit them corrected.

The pending `RT-PAPER-SCHIFFMANN-16` should re-check this route.

**1.5 The same result file, item `PAPER-SCHIFFMANN-16/36`.**
- `locator` becomes:
  > arXiv:1406.3839v2 (4 October 2014), Proposition 4.8, p. 14, proved in Appendix B, pp. 35–36; published version (Annals 183 (2016)), Proposition 4.7, p. 321, proved in Appendix B, pp. 357–358
- `note`: replace "DeligneWeightsAndPurity DWP.0 owns Weil q-numbers and their properties but plans no density statement of this kind." with:
  > It is a density statement, not a weight statement: DWP.0 owns Weil q-numbers but not this. Its proof combines big geometric monodromy of an explicit family of curves (Katz–Sarnak 10.1.16) with Deligne's equidistribution theorem (Weil II 3.5.3, DeligneWeightsAndPurity:DWP.8:equidistribution); route 3 sends it to the LefschetzPencilsAndVanishingCycles Part II. Normalise with a chosen square root of q, as the published version does (E6).

**1.6 The same result file, `routes[0]` (route 1) `brief`.**
- Replace "and is routed separately as a source of DeligneWeightsAndPurity." with:
  > and is imported from the LefschetzPencilsAndVanishingCycles Part II (route 3: Katz–Sarnak's curve-family monodromy with DeligneWeightsAndPurity:DWP.8:equidistribution).
- Replace "stage DWP.0, of which this paper is also a source;" with "stage DWP.0;".

**1.7 The same result file: append to `sourceIssues`, and add `sourceVersions`.**

```json
{"id": "PAPER-SCHIFFMANN-16/E5", "kind": "misprint",
 "locator": "Appendix B, proof of Proposition 4.8, the reference '[D1, 3.5.3]', p. 35, and the bibliography entry [D1], p. 37, arXiv v2. Published version: Appendix B, proof of Proposition 4.7, the reference '[Del74, 3.5.3]', p. 357, and the entry [Del74], p. 359.",
 "printed": "arXiv v2: 'By Deligne's equidistribution theorem (see [D1, 3.5.3] and [KS, Thm. 9.2.6])', with '[D1] P. Deligne, La conjecture de Weil I., Inst. Hautes Etudes Sci. Publ. Math. 52 (1981), 313-428.' Published: 'see [Del74, 3.5.3] and [KS99, Th. 9.2.6]', with '[Del74] P. Deligne, La conjecture de Weil. I, Inst. Hautes Études Sci. Publ. Math. 43 (1974), 273–307.'",
 "correction": "Deligne's equidistribution theorem is Théorème 3.5.3 of P. Deligne, La conjecture de Weil. II, Publ. Math. IHÉS 52 (1980), 137–252 (doi:10.1007/BF02684780), p. 211.",
 "reason": "Weil I has no 3.5.3 and no equidistribution theorem; its §3 is the fundamental estimate, with Lemmas (3.5) and (3.6) on power series (p. 284). Weil II's Théorème 3.5.3 (p. 211) is the equidistribution theorem, and Katz–Sarnak's Theorem 9.2.6, the other reference, says 'compare [De-Weil II, 3.5.3]' (p. 276). The v2 entry is Weil II under the title of Weil I: volume 52 and pages 313–428 are Weil II's, 313–428 being the numbers printed at the foot of its pages 137–252; the year is 1980. The published version replaced the entry by Weil I in full, which is still not the paper cited. PAPER-ABE-18/E3 records the same 313–428 page range for Weil II.",
 "affects": "nothing", "known": "new",
 "searched": ["the arXiv listing of 1406.3839: v2 (4 October 2014) is the last version (arXiv API, 29 September 2026)", "the published version, Annals of Mathematics 183 (2016), 297–362, read 29 September 2026: it cites Weil I (43 (1974)) for 3.5.3", "the erratum search recorded for E1–E4: none found"]}
```

```json
{"id": "PAPER-SCHIFFMANN-16/E6", "kind": "misprint",
 "locator": "Appendix B, proof of Proposition 4.8, definition of F, p. 35, arXiv v2. Published version: corrected, Appendix B, p. 357.",
 "printed": "set F = R1ρ!(Ql)(−1), a pure lisse sheaf of weight zero whose stalk at a point Spec(Fqn) → M◦g corresponding to a curve X defined over Fqn is equal to H1(X ⊗ Fq, Ql)(−1).",
 "correction": "Fix a square root q^{1/2} of q in Q̄_l and set F = R¹ρ_!(Q̄_l)(1/2), the twist by the rank-one character on which a geometric Frobenius of degree n acts by (q^{1/2})^{−n}. This F is pure of weight zero, and its Frobenius eigenvalues at a degree-n point are the q^{−n/2}σ_i that the proof uses.",
 "reason": "R¹ρ_! of a family of curves is pure of weight one, and the twist (−1) raises weights by 2, so the printed sheaf is pure of weight three: its eigenvalues at a degree-n point are q^nσ_i, not the unitary q^{−n/2}σ_i displayed a few lines later. Weight zero needs a half twist, which depends on the chosen square root of q.",
 "affects": "nothing",
 "known": "corrected in the published version: Annals of Mathematics 183 (2016), Appendix B, p. 357, which fixes 'a square root q^{1/2} of q in Q̄l' and sets 'F = R1ρ!(Ql)(1/2), a pure lisse sheaf of weight zero'",
 "searched": ["as for E5"]}
```

```json
{"id": "PAPER-SCHIFFMANN-16/E7", "kind": "gap",
 "locator": "Appendix B, proof of Proposition 4.8, the monodromy over M◦g, p. 35, arXiv v2. Published version: corrected, Appendix B, p. 357.",
 "printed": "Let M◦g be a smooth open subset of the moduli space of smooth projective curves over Fq of genus g. Let ρ : X → M◦g denote the universal curve […] By [KS, Thm 10.1.16, Thm. 10.2.2], the Zariski closure of ρ(πgeom1(M◦g)) is equal to Sp(2g, Ql).",
 "correction": "Use the families of the cited theorems directly, as the published proof does. These are Katz–Sarnak 10.1.16 (p ≠ 2: Y² = f(X)(X − T) over Spec(k[T][1/f(T)])) and 10.2.2 (p = 2). Their fibres are smooth projective geometrically connected curves of genus g, so their Weil numbers lie in W.",
 "reason": "Katz–Sarnak 10.1.16 and 10.2.2 compute the geometric monodromy of explicit one-parameter families of hyperelliptic and Artin–Schreier curves over an open subset of the T-line (pp. 293, 299, 301). Neither is about a family over an open subset of M_g, and the proof gives no passage from one to the other. The passage is also unnecessary: density of W needs only one family of genus-g curves with big monodromy.",
 "affects": "the proof",
 "known": "corrected in the published version: Annals of Mathematics 183 (2016), Appendix B, p. 357: 'In [KS99, §10.1, 10.2], Katz and Sarnak constructed a family ρ : X → Ug of smooth projective curves over Fq of genus g'",
 "searched": ["as for E5"]}
```

The file has no `sourceVersions` yet. Add:

```json
"sourceVersions": [
 {"kind": "preprint", "url": "https://arxiv.org/pdf/1406.3839v2", "read": "2026-09-29", "sha256": "7e5cbf6e3bb9caf4c48959493987c4543c2244cccdf17fa0fa426593a8639bb2"},
 {"kind": "published", "url": "https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n1-p06-p.pdf", "read": "2026-09-29", "sha256": "8e486963410368afe461a6f2a848eb7ddb618aa48fda7db2c0bd51710286c7a5"}
]
```

### Not done, and why

- **DWP.0 is unchanged.** It keeps its weight contract, as the verifier requires.
- **No proof is claimed.** The new stage and the Part II continuation are contracts, and every input stays open:
  - the Euler–Poincaré formula for 10.1.12 has no atlas owner (RT-AREA-finitefields/3 asks for one);
  - Kazhdan–Margulis ([Ka-ESDE, 1.5]) was not read;
  - Sutor's thesis for 10.2.2 was not read;
  - Weil II 3.5.5 rests on the transcendental monodromy of modular curves, so it is an acceptance hypothesis, not a target;
  - maximal-torus conjugacy for USp(2g) is imported from LieGroups Layer 6, not checked here.
- **The rest is for the design jobs.**
  - The LPV Part II's roadmap, packet and node ids belong to `DESIGN-LefschetzPencilsAndVanishingCyclesPartII`.
  - CountingBundles imports the density theorem by the id that job creates.
  - Neither roadmap exists yet, so the links DWP.8:equidistribution → Part II → CountingBundles are recorded here, not as atlas edges.

## /2 (high, duplicate): absolute purity gets one owner, the EDC Part II; SF.2 splits into a site prefix and a Brauer-purity suffix

### What the verifier corrected
- Both routes are live. PAPER-CESNAVICIUS-19 route 3 and PAPER-CESNAVICIUS-SCHOLZE-24 route 4 have overall **accept** reviews.
- The shared theorem is the prime-to-characteristic purity of regular pairs: ILO XVI Définition 2.3.1 and Théorème 3.1.1. CS24 3.1.3–3.1.4 is its local case.
- **One owner:** the EDC Part II. It imports the early scheme site and six-operation prefix.
  - The SF.2 Brauer suffix imports the theorem.
  - Cohomology with supports imports EDC.0.
- **No coarse SF.2 ↔ Part II cycle.** Absolute purity must not be confused with smooth-pair purity.
- **LI-LIU-21/79 is unreviewed.** Re-routing it is a correction for its future review, not an accepted route.

### State on main (1b1aeb19)
None of the files below has changed since the verification.

**PAPER-CESNAVICIUS-19** (last changed 2026-09-23)
- Route 3 is a `source` route to `SchemeAndStackFoundations:SF.2` with 59 items. Its reason ends:
  > "Split an early site/Kummer prefix from the completion/perfectoid-dependent Brauer-purity suffix and an AppendixA field prefix; add no blanket SF.2↔SF.4 or SF.2↔adic-roadmap cycle. EDC.2 smooth purity is NOT Gabber absolute purity …"
- Item `absolute-purity-input` (missing):
  > "For strictly henselian regular local R of dimension≥2 and prime ℓ invertible in R, the absolute purity theorem gives H²(U_R,μ_ℓ)=0 in the use made by Theorem 5.3."
- Item `supports` (missing):
  > "For closed Z⊂X and abelian étale sheaf F, construct H_Z^q(X,F), its local sheaf ℋ_Z^q, and the localization maps for j:X\Z→X; use the derived sections-with-support construction."

**PAPER-CESNAVICIUS-SCHOLZE-24, route 4.** The Part II has roadmap id `EtaleDualityAbsolutePurityPartII`, title "Étale duality, cycle classes and perverse sheaves, Part II: absolute cohomological purity and Gabber's local theorems", area `etale`, and items 030, 041, 042, 046, 047 and 048. Its brief ends:
> "Imports: EDC.0–EDC.2 (parent), SchemeAndStackFoundations SF.2, PerfectoidQuotients Q0 and PrismaticCohomology PR.0."

The review of route 4 says:
> "Absolute purity for étale cohomology is the étale-duality roadmap's own direction and is not planned by any of its stages".

That review missed the earlier CS19 route.

**The design job.** `research/blueprint/queue.json` has no job named after `EtaleDualityAbsolutePurityPartII`.
- `make_queue.paper_designs` merges every accepted `part-ii` route whose parent is EtaleDualityAndPerverseSheaves into one job: `DESIGN-EtaleDualityAndPerverseSheavesPartII` (state `pending`; roadmapIds `["EtaleDualityAndPerverseSheavesPartII"]`; name "Étale duality, cycle classes and perverse sheaves, Part II").
- Today it receives CS24 route 4 and YUN-ZHANG-19 route 9 (IndConstructibles).
- No roadmap json, packet or README exists for it.

**SchemeAndStackFoundations README, SF.2** (lines 39–49, unchanged since 2026-09-15):
> "Own Zariski, etale, fppf and pro-etale site comparisons at the appropriate coefficient level; construct sheaf cohomology, localization, proper/smooth base change and compact support. …"

- **Inputs.** `SF.1`.
- **Blueprint job.** `BP-SchemeAndStackFoundations` is `external` (claimed on issue #642). No SF packet is on main.

**RS-19** (accepted) has this owner entry:
> "Scheme cohomology-with-support and compatibility of the imported finite-level coefficient/Rf! objects with the enhancement …"

Its owner is `EtaleDualityAndPerverseSheaves:EDC.0`. EDC.0 says:
> "Construct cohomology with support as the localization fiber, retaining the closed immersion rather than only its underlying point set."

EDC's principal category is "separated finite-type schemes over a field k" (README line 30).

**Graph.** `SF.2 → AdicSpacesPartII:F0 → … → EtaleDualityAndPerverseSheaves:EDC.2:trace-purity → EDC.2` exists. The Part II imports EDC.0–EDC.2, so it lies below SF.2, and a coarse Part II → SF.2 edge would close a cycle:
- The cycle test for EtaleDualityAndPerverseSheaves:EDC.2 → SchemeAndStackFoundations:SF.2 (reachability in the assembled stage graph) reports a cycle, by the path above.
- CS19's suffix inputs cannot enter SF.2 either. The same test reports a cycle for PerfectoidSpaces:P7, SF.4, PerfectoidQuotients:Q0:integral-algebra, ClassicalAdicEtaleCohomology:H1:henselian, PerfectoidSpaces:P3 and EDC.3 → SF.2. For P7 the path is SF.2 → AdicSpacesPartII:F0 → ClassicalAdicEtaleCohomology:H0 → P7.
- It gives acyclic for L2, R03.3 and EDC.0 → SF.2.

**Other items routed to SF.2.**
- **LI-LIU-21/79**, "Absolute purity (Gabber; Fujiwara)". Status missing. Unreviewed route 6 → SF.2. Its review job `REV-PAPER-LI-LIU-21` is pending (issue #1116).
- **BRIGHT-NEWTON-23/48**, Brauer purity, → SF.2. The paper's review verdict is revise.

**Pending jobs.** `RT-PAPER-CESNAVICIUS-19` and `RT-PAPER-CESNAVICIUS-SCHOLZE-24` are pending red teams on the same routes. No restructuring proposal touches SF.2; RS-27 does not mention it.

### Fix

The owner is the purity Part II. Its layers are named below with provisional keys AP.0–AP.3; the design job assigns the final stage ids.

**PAPER-CESNAVICIUS-SCHOLZE-24.result.json**

1. **Route 4, field `brief`.** Replace the whole string with:
   > Extend Étale duality, cycle classes and perverse sheaves (EtaleDualityAndPerverseSheaves), whose EDC.2 proves smooth purity and explicitly excludes Gabber's absolute purity for regular schemes, with that theorem in its general form and the local results on excellent schemes it needs. This Part II is the single owner of absolute cohomological purity in the atlas (RT-AREA-etale/2): SchemeAndStackFoundations SF.2:brauer-purity, PurityForFlatCohomology and the RelativeTraces continuation import it from here.
   >
   > Final theorems:
   > (a) Illusie–Laszlo–Orgogozo, Travaux de Gabber (arXiv:1207.3648v1), XVI Théorème 3.1.1: for a regular ℤ[1/n]-scheme X and a regular closed subscheme i: Y → X of codimension c, the Gysin morphism Cl_i: Λ → i^!Λ(c)[2c], Λ = ℤ/n, is an isomorphism in D⁺(Y_ét, Λ).
   > (b) Česnavičius–Scholze, Purity for flat cohomology, Theorem 3.1.3: for a regular local (R, 𝔪) and a finite étale commutative G of order invertible in R, H^i_𝔪(R, G) = 0 for i < 2 dim(R). And Remark 3.1.4: ℋ^i_𝔪(−, ℤ/n) = 0 for i ≠ 2 dim R, and the cycle class map ℤ/n(−dim R) → ℋ^{2 dim R}_𝔪(−, ℤ/n) is an isomorphism. This is the pointwise purity of regular local rings.
   > (c) Theorem 2.2.7 (algebraic tilting of idempotents and étale cohomology: RΓ_ét(U, G) ≅ RΓ_ét(U^♭, G) and RΓ_Z(A, G) ≅ RΓ_Z(A^♭, G)).
   > (d) Lemma 3.2.3 (the local Lefschetz hyperplane theorem).
   >
   > Layers, in order.
   >
   > AP.0, Gysin classes over general bases (ILO XVI §§1–2).
   > - Chern classes of vector bundles on arbitrary ℤ[1/n]-schemes, from the Kummer c₁ and the projective bundle formula (Théorèmes 1.2–1.3).
   > - The generalized classes of 2.2, and the class Cl_i: Λ → i^!Λ(c)[2c] of a regular immersion of ℤ[1/n]-schemes (Définition 2.3.1). The printed "i^? = i^⋆(c)[2c]" there is to be read i^!(c)[2c], as in Théorème 3.1.1 and Définition 2.5.3.
   > - Its transitivity (Théorème 2.3.2).
   > - Its agreement with the class of SGA 4½ [Cycle] 2.2 (Proposition 2.3.4), and through it the comparison with EDC.3's class for smooth pairs over a perfect field (EDC.3 follows SGA 4½ [Cycle]).
   > - The self-intersection identity (restriction of the class to Y equals (−1)^c c_c of the conormal sheaf) used in the proof of 2.3.2.
   >
   > The ambient scheme may be singular, and AP.0 claims no isomorphism. AP.0 needs only the exceptional pullback along a closed immersion, that is, EDC.0's cohomology with supports on arbitrary schemes. It imports no general-base constructibility, finiteness or biduality theorem, so there is no class → six operations → purity cycle.
   >
   > AP.1, local purity (CS24 §§2.2, 3.1): (c), Lemma 3.1.2 and (b), by the perfectoid proof. The proof uses:
   > - Artin's case in equal characteristic;
   > - finite flat traces (EDC.2);
   > - the towers and completed ind-étale perfectoids of this extraction's PerfectoidQuotients Part II;
   > - tilting by arc descent from ArcTopologyAndDescent;
   > - the perfection invariance of étale cohomology.
   >
   > The cycle-class isomorphism of Remark 3.1.4 uses AP.0's class. Its injectivity step ("as in [Fuj02, Lemma 2.3.1]") and its stalk bound are only sketched in the source and must be written out. Gabber's and Thomason's proofs are alternatives.
   >
   > AP.2, purity for regular pairs: (a) from (b). The route is ILO XVI Définitions 3.1.4 and 3.2.1–3.2.2 and Proposition 3.2.3: for a closed immersion of regular schemes, of the three conditions
   > - the pair is pure,
   > - Y is pointwise pure,
   > - X is pointwise pure along Y,
   >
   > it never happens that exactly two hold.
   >
   > AP.2 records the consequences its importers use, such as H²(U_R, μ_ℓ) = 0 for a strictly henselian regular local R of dimension ≥ 2 with ℓ invertible (PAPER-CESNAVICIUS-19/absolute-purity-input). This is not smooth-pair purity, which stays with EDC.2–EDC.3.
   >
   > AP.3: the local Lefschetz theorem (d), and these inputs from ILO:
   > - the affine Lefschetz theorem (XV 1.2.4);
   > - dualizing complexes on excellent regular schemes with their normalization (XVI 3.1.1, XVII 0.2);
   > - local duality (SGA 5 I).
   >
   > AP.3 also needs the right adjoint f^! of Rf_! for compactifiable morphisms of qcqs ℤ[1/n]-schemes (SGA 4 XVIII 3.1.4, used by ILO XVI 2.4–2.5 and 3.1.2). Construct it formally on AdicCoefficientsAndComparisons L2's qcqs Rf_!, extending EDC.1:adjoint. Do not take it from the RelativeTraces continuation, which imports this Part II.
   >
   > Imports:
   > - from the parent: EDC.0 (cohomology with supports and i^! for closed immersions of arbitrary schemes), EDC.1:adjoint, EDC.2:trace-purity, and EDC.3 and EDC.4 (the special cases AP.0 is compared with);
   > - SchemeAndStackFoundations SF.0 (relative Proj and blowups) and SF.2 (sites and the Kummer sequence; never SF.2:brauer-purity, which imports this Part II);
   > - AdicCoefficientsAndComparisons L2, and the upstream EtaleBaseChange proper base change;
   > - PerfectoidQuotients Q0 and PrismaticCohomology PR.0;
   > - the proposed PerfectoidQuotients Part II and ArcTopologyAndDescent.
   >
   > Tests:
   > - equal characteristic k⟦x, y⟧;
   > - W(k)⟦x⟧ and W(k)⟦x, y⟧/(p − xy) with ℓ ≠ p;
   > - the tilt of W(k)⟦x^{1/p^∞}⟧/(p − x);
   > - a regular pair (X, Y) with Y not a point (the reduction of AP.2);
   > - a regular immersion into a singular X, where AP.0 constructs Cl_i but asserts no isomorphism.
2. **Route 4, field `reason`.** Append:
   > " It is the single owner: PAPER-CESNAVICIUS-19 routes its prime-to-p input (absolute-purity-input) here too, and SF.2:brauer-purity imports AP.2 (RT-AREA-etale/2)."

**PAPER-CESNAVICIUS-19.result.json**

3. **Item `absolute-purity-input`, field `note`.**
   - Old: "EDC.2's smooth purity is not this Gabber absolute purity theorem."
   - New: "EDC.2's smooth purity is not this Gabber absolute purity theorem. Its owner is the absolute-purity layer AP.2 of the EtaleDualityAndPerverseSheaves Part II (PAPER-CESNAVICIUS-SCHOLZE-24 route 4; general form ILO XVI Théorème 3.1.1); it is routed there by route 18. Re-mark it planned at that stage id once the design job has written it."
   - `status` stays `missing`: the Part II has no roadmap file yet (§16's definition of planned).
4. **Item `supports`.**
   - `status`: `missing` → `planned`.
   - `planned`: `null` → `["EtaleDualityAndPerverseSheaves:EDC.0"]`.
   - Add `note`: "RS-19 makes EDC.0 the owner of scheme cohomology with supports; EDC.0 builds it on arbitrary schemes (RT-AREA-etale/2)."
5. **Route 3.**
   - `items`: remove `PAPER-CESNAVICIUS-19/absolute-purity-input` and `PAPER-CESNAVICIUS-19/supports`.
   - `stages`: `["SchemeAndStackFoundations:SF.2"]` → `["SchemeAndStackFoundations:SF.2", "SchemeAndStackFoundations:SF.2:brauer-purity"]`.
   - `reason`: append
     > " Items of §§2–6 that need purity, completions or perfectoids are sources of SF.2:brauer-purity: finite-flat-brauer, lci-flat-brauer, cech-alternative, completion-inject, completion-surject, punctured-completion, affine-charp-cd, perfectoid-p-vanish, perfectoid-brauer-vanish, purity-dim2, purity-dim3, prime-to-p-purity, equal-char-purity, mixed-char-purity, strict-local-purity, local-torus-h2, support-local-global, strict-support-stalk, support-coniveau, low-support-vanish, global-purity-h0, global-purity-h1, global-purity-h2, global-purity-h3, global-gm-purity, global-gm-h3, codim1-intersection, brauer-intersection, global-residue-exact, residue-primary-boundary. The rest are sources of SF.2. Absolute purity is the EDC Part II's (route 18); cohomology with supports is EDC.0's (RS-19)."
   - This list is every descendant of absolute-purity-input among the route's items, plus the §§2–5 finite-flat, completion and perfectoid steps and the Theorem 5.3 and 6.1 inputs that only these use. No remaining SF.2 item has a prerequisite in the list, so SF.2 does not depend on its suffix.
6. **New route 18.**
   ```json
   {"route": "part-ii", "parent": "EtaleDualityAndPerverseSheaves", "roadmap": "EtaleDualityAbsolutePurityPartII",
    "title": "Étale duality, cycle classes and perverse sheaves, Part II: absolute cohomological purity and Gabber's local theorems",
    "area": "etale", "items": ["PAPER-CESNAVICIUS-19/absolute-purity-input"],
    "brief": "This route adds a consumer to the Part II proposed by PAPER-CESNAVICIUS-SCHOLZE-24 route 4; follow that brief. Česnavičius, Purity for the Brauer group (arXiv:1711.06456v4), uses the prime-to-residue-characteristic case in Theorem 5.3 (p. 2, case (iii)): for a strictly henselian regular local R of dimension ≥ 2 and ℓ invertible in R, H²(U_R, μ_ℓ) = 0, from absolute purity (layer AP.2) and the localization sequence for the closed point.",
    "reason": "Absolute purity has one owner, the EDC Part II (RT-AREA-etale/2, confirmed by REV-RT-AREA-etale); SF.2:brauer-purity imports it."}
   ```
7. **PAPER-CESNAVICIUS-19.review.json, `routes`.** Route 18 needs a verdict before the queue applies it (see "Review verdicts" at the top). The entry to record, if the maintainer accepts it on the strength of the confirmed finding:
   > `{"route": 18, "verdict": "accept", "reason": "Added by the RT-AREA-etale fix (finding /2, confirmed): the item moves from SF.2 to the single owner of absolute purity."}`

**content/campaign/SchemeAndStackFoundations/README.md**

8. **SF.2, "Construct and export".** After "…rather than inventing a parallel six-operations API." insert:
   > "Kummer sequences, G_m- and torus cohomology, the cohomological Brauer group, and its finite-étale and finite-flat descent statements that need no purity input belong here. Cohomology with supports is EtaleDualityAndPerverseSheaves EDC.0's (RS-19). Nothing in SF.2 uses absolute cohomological purity or purity for the Brauer group: those results are SF.2:brauer-purity, which comes after this stage."
9. **New sub-stage** after the SF.2 block. The key has a colon, so the build makes SF.2 its container. SF.2 does not require it; the same pattern as AInfCohomology:AI.0:integral.
   > <a id="stage-SF.2:brauer-purity"></a>
   >
   > ### SF.2:brauer-purity Purity for the Brauer group of regular schemes
   >
   > **Construct and export.** Česnavičius, *Purity for the Brauer group* (arXiv:1711.06456v4):
   > - For a strictly henselian regular local ring R of dimension ≥ 2, H²_ét(U_R, G_m) = 0 on the punctured spectrum (Theorem 1.3 = 5.3).
   > - For a scheme X, an X-torus T and a closed Z ⊂ X such that every O_{X,z} (z ∈ Z) is regular of dimension ≥ 2 and X∖Z → X is quasi-compact: H^q(X, T) ≅ H^q(X∖Z, T) for q ≤ 2, and H³(X, T) ↪ H³(X∖Z, T) (Theorem 6.1). Theorem 1.1 is the locally Noetherian G_m case.
   > - For a Noetherian integral regular X with function field K, H²(X, G_m) is the intersection of the H²(O_{X,x}, G_m) over the points x of height 1, inside H²(K, G_m) (Theorem 1.2 = 6.2).
   > - The finite-flat, completion and perfectoid steps of §§2–5.
   >
   > The prime-to-residue-characteristic part is absolute purity (p. 2, (iii)). It is imported from EtaleDualityAndPerverseSheaves, Part II (absolute purity), not proved here.
   >
   > **Inputs.** SF.2, EtaleDualityAndPerverseSheaves:EDC.0, SF.4, PerfectoidSpaces:P3, PerfectoidSpaces:P7, PerfectoidQuotients:Q0:integral-algebra, ClassicalAdicEtaleCohomology:H1:henselian:perfectoid-limit (the late suffix of /26, which brings H1:henselian and P7 with it), AdicCoefficientsAndComparisons:L2, DeformationAndDerivedPatchingAlgebra:R03.3, and the absolute-purity layer of the EDC Part II.
   >
   > **Acceptance.**
   > - dim R = 2 and 3 are the known special cases.
   > - The complement of the coordinate axes in A²_ℂ shows that codimension ≥ 2 is needed ([DF84, Rem. 3], cited p. 1).
   > - No p-primary statement is drawn from the prime-to-p argument, or conversely.

**data/atlas.json**

10. **Add the stage.** `SchemeAndStackFoundations:SF.2:brauer-purity`: owner SchemeAndStackFoundations, key `SF.2:brauer-purity`, the title above, and `requires` the nine inputs of edit 9. Until /26's suffix H1:henselian:perfectoid-limit exists, use ClassicalAdicEtaleCohomology:H1:henselian in its place.
    - Add it to each input's `consumers`, and add the nine `stageEdges`.
    - Add the Part II → SF.2:brauer-purity link when that roadmap exists.
    - **Cycles.** The new stage has no consumers, so none of these edges closes a cycle. The cycle test cannot run on a stage absent from the assembled atlas. The CYCLE results listed under State show why the same inputs cannot go into SF.2 itself.

**content/campaign/EtaleDualityAndPerverseSheaves/README.md**

11. **EDC.0.** Replace "Construct cohomology with support as the localization fiber, retaining the closed immersion rather than only its underlying point set." with:
    > "Construct cohomology with support as the localization fiber, retaining the closed immersion rather than only its underlying point set. This construction, unlike the rest of EDC.0, is made for an arbitrary scheme X and closed immersion i: Z → X (abelian étale sheaves, any coefficient ring), not only in the principal category. It comprises:
    > - RΓ_Z(X, −) and the local sheaves ℋ^q_Z;
    > - the right adjoint i^! of i_*;
    > - the localization triangle RΓ_Z(X, F) → RΓ(X, F) → RΓ(X∖Z, F);
    > - the local-to-global spectral sequence H^a(X, ℋ^b_Z(F)) ⇒ H^{a+b}_Z(X, F) (SGA 4 V 6.4).
    >
    > Česnavičius's Theorem 6.1 uses it on arbitrary schemes. The absolute-purity Part II uses i^! of a regular immersion of arbitrary ℤ[1/n]-schemes."

    This makes CS19/supports and CESNAVICIUS-SCHOLZE-24/039 (already `planned` at EDC.0) honest.
12. **EDC.2:pairings.** After "…not the unrelated general Gabber absolute-purity theorem for arbitrary regular arithmetic schemes." add:
    > " That theorem is owned by EtaleDualityAndPerverseSheaves, Part II (absolute purity)."

### Not done, and why
- **LI-LIU-21/79 (unreviewed).**
  - Note for REV-PAPER-LI-LIU-21: its route 6 should go to the purity Part II (AP.2), not SF.2.
  - Its Q_ℓ(j) form must be derived from the finite-coefficient theorem by passing to the limit. That is an obligation of the route, not something ILO XVI 3.1.1 states.
  - Fujiwara's semi-purity (§8), also cited there, is not in ILO XVI 3.1.1. The design job must source it before planning it. I did not read Fujiwara.
- **BRIGHT-NEWTON-23/48 (revise)** should, at its revision, name SF.2:brauer-purity (Česnavičius Theorem 1.2).
- **HARPAZ-WITTENBERG-20/16 (accepted, SF.2)** states Brauer purity for smooth characteristic-zero schemes. Whether it needs the regular case (the suffix) or only smooth-pair purity is for the SF blueprint (external, #642) to decide.
- **The item partition is minimal.** Edit 5 lists only the items forced into the suffix. The SF blueprint may move more; it may not move any suffix item back into SF.2.
- **The generated design job merges directions.** DESIGN-EtaleDualityAndPerverseSheavesPartII merges every accepted EDC `part-ii` route. With /3 and /16 below, it would receive four independent directions: purity, stacks, perfect schemes and ind-constructibles. Its template says to plan the first and record a restructure proposal for the rest. Separate design ids need a maintainer decision about make_queue's grouping; see also /19.
- **Candidate misprint, not registered.** ILO arXiv v1 prints "i^? = i^⋆(c)[2c]" in XVI Définition 2.3.1. Théorème 3.1.1, footnote vii and 2.5.3 read i^!. The Astérisque edition was not checked.
- **Out of scope.** Brauer purity for complete-intersection singularities (CS24 Theorems 7.2.8–7.2.9, route 1) generalizes SF.2:brauer-purity. That ownership question is not part of this finding.

## /3 (high, missing): a Part II for ℓ-adic sheaves on Artin and Deligne–Mumford stacks

### What the verifier corrected
- **Scope.** EDC is scheme-only. Lafforgue v10 §4.2 p. 65 applies Rf_! to an IC on a finite-type Deligne–Mumford shtuka stack via LMB/LO. GS.1/GS.3 and ET.2b need that scope.
- **Unowned items.** YZ17/35 and YZ19/120 are missing items routed to scheme EDC.8, not existing stack theorems. RS-22 leaves stack descent in GS.3.
- **Plan one shared stack extension.** It imports the scheme theory, the stack geometry and abstract descent.
- **Boundedness.** Laszlo–Olsson II pp. 1–2 uses D_c, D_c^+ and D_c^−, and needs unbounded complexes. Do not promise that all six operations preserve D_c^b on Artin stacks. Do not promise an unrestricted stack decomposition or trace theorem.
- **Hypotheses.** State the finite-type, stabilizer, representability, coefficient and support hypotheses separately.
- **Immediate consumer.** The proper smooth separated DM correspondence case is what YZ needs.
- **Left to consumers.** Shtuka truncations and colimit/Hecke-finiteness stay application work.
- **General correction (REV-RT-AREA-etale).** Stack operations need separate boundedness hypotheses.

### State on main (1b1aeb19)
**EDC README**, line 30 (unchanged since 2026-09-15):
> "The principal geometric category is separated finite-type schemes over a field k".

No EDC stage and no Part II proposal plans sheaves on stacks.

**The atlas and the paper routes.** I searched all 234 paper extractions on main for Laszlo, Olsson, Liu–Zheng, Artin stack and Deligne–Mumford stack. No route proposes an owner for sheaf operations on stacks. One accepted brief plans the Deligne–Mumford trace formula inside another Part II (GROECHENIG-WYSS-ZIEGLER-20-B, below). The uses are:
- **LAFFORGUE-18/48** (accept): "The six operations on stacks with adic coefficients …", status `planned`, planned `["EtaleDualityAndPerverseSheaves:EDC.0", "SchemeAndStackFoundations:SF.1"]`. Its own note: "no stage of the atlas names the Laszlo–Olsson six operations on Artin stacks".
- **YUN-ZHANG-17/35**: missing, route 4 (`source` → EDC.8). Its only item.
- **YUN-ZHANG-19/120**: missing, route 6 (`source` → EDC.8). Its only item; "Retain its proper, representable-left-projection, smooth/separated-M and SCHEME-base hypotheses".
- **ABDURRAHMAN-VENKATESH-25/57**: "Uses étale cohomology of Artin stacks (Laszlo–Olsson)". Route 6, Part II SymplecticLFunctionsModSquares.
- **CANNING-LARSON-PAYNE-24/14**: "Poincaré duality on a smooth proper Deligne–Mumford stack". Route 4 → SF.2.
- **GROECHENIG-WYSS-ZIEGLER-20-B**, route 1 (EndoscopicTransferAndUnitaryTraceComparisonPartII): "State separately, as its own layer, the Grothendieck–Lefschetz trace formula for Deligne–Mumford stacks over a finite field ([Sun12]), which no roadmap owns …". GWZ-20 route 5 asks for the same.
- **The shtuka Part II briefs** (FENG-YUN-ZHANG-24 r1, YUN-ZHANG-17 r1, YUN-ZHANG-19 r7) import only "EDC.5 and EDC.7 …" and EDC.8. The RamifiedGeometricClassFieldTheory brief (YUN-ZHANG-19 r8) imports only "EDC.5/7/8".

**Stages.**
- GS.1: "bounded Hecke stacks … rational ell-adic intersection complexes". Inputs GS.0 and EDC.5.
- GS.2: shtuka stacks, with "representability/Deligne--Mumford and finite-type statements".
- GS.3: "compactly supported intersection cohomology on bounded truncations …".
- ET.2b: "the stack of G-bundles … perverse direct images".
- The RS-22 link EDC.5 → GS.3: "Descent to the actual shtuka stack and truncation/colimit support control remain GS.3 work."
- EnhancedDerivedSheaves:E3 follows Liu–Zheng §2 "without assuming their Artin-stack six-operation theorem".

**The GS packet** (research/blueprint/packets, partial, 2026-09-24). It requests the stack formalism from SF.0/SF.2, and scheme sheaf theory from EDC stages under the wrong numbers (its "EDC.2" is correspondences, its "EDC.4" perverse sheaves). It requests no stack sheaf operations.

**Libraries.**
- Mathlib has `CategoryTheory.Pseudofunctor.IsStack` (Sites/Descent/IsStack.lean:49), which is effective descent for a pseudofunctor.
- The pinned index has no algebraic, Deligne–Mumford or lisse-étale stack declaration in either library.

**Pending jobs.** DESIGN-GlobalShtukasAndFunctionFieldLanglandsPartII, DESIGN-EndoscopicTransferAndUnitaryTraceComparisonPartII and DESIGN-FunctionFieldArithmeticPartII are pending. Red teams on LAFFORGUE-18, YUN-ZHANG-17 and YUN-ZHANG-19 are pending.

### Fix
The owner is a new Part II proposal.
- **Roadmap id** `EtaleDualityAndPerverseSheavesPartIIStacks`, area `etale`.
- **Title** "Étale duality, cycle classes and perverse sheaves, Part II: Artin and Deligne–Mumford stacks".
- **Layers** ST.0–ST.6 (provisional keys).
- **Design job.** Under make_queue it joins DESIGN-EtaleDualityAndPerverseSheavesPartII (see /2, Not done).

**PAPER-LAFFORGUE-18.result.json**

1. **Item 48.**
   - `status`: `planned` → `missing`; `planned` → `null`.
   - `note`: append "Routed to the stacks Part II (route 5, layers ST.1–ST.2). The §8 conventions (geometric points, specialization maps of SGA 4 VIII §7) are EDC.0's interface, which the Part II imports. Lafforgue's (4.1), p. 65, needs Rp_! of the IC of a finite-type Deligne–Mumford truncation to lie in D_c^b; for Artin stacks LO give only D_c^±."
2. **New route 5.**
   - `route` `part-ii`; `parent` `EtaleDualityAndPerverseSheaves`; `roadmap` `EtaleDualityAndPerverseSheavesPartIIStacks`; the title above; `area` `etale`.
   - `items`: `["PAPER-LAFFORGUE-18/48"]`.
   - `reason`: "EDC's principal category is finite-type schemes over a field; the stack six operations, perverse sheaves and IC on stacks, and correspondences and trace formulas on Deligne–Mumford stacks have no owner (RT-AREA-etale/3, confirmed)."
   - `brief`:
   > Extend Étale duality, cycle classes and perverse sheaves (EtaleDualityAndPerverseSheaves) to algebraic stacks. This Part II is the one owner of ℓ-adic sheaf theory on Artin and Deligne–Mumford stacks. It imports the scheme theory (EDC.0–EDC.8), the stack geometry (SchemeAndStackFoundations SF.1; AlgebraicModuliForArithmeticGeometry R09.4–R09.5), and abstract descent and coherent diagrams (EnhancedDerivedSheaves E2–E3, with E4 for adic completion). It builds no second scheme theory.
   >
   > Every theorem states separately its hypotheses on:
   > - the base;
   > - the finiteness of the morphism;
   > - stabilizers and representability;
   > - coefficients;
   > - the boundedness and support of the complexes.
   >
   > Sources:
   > - Laszlo–Olsson, The six operations for sheaves on Artin stacks I (arXiv:math/0512097v2) and II (arXiv:math/0603680v1);
   > - Laszlo–Olsson, Perverse sheaves on Artin stacks (arXiv:math/0606175v1);
   > - Liu–Zheng, Enhanced six operations and base change theorem for higher Artin stacks (arXiv:1211.5948v4);
   > - Sun, L-series of Artin stacks over finite fields (arXiv:1008.3689v2).
   >
   > **ST.0 Sheaves on stacks.**
   > - The lisse-étale site of an algebraic stack locally of finite type over S, and cartesian sheaves.
   > - D_c and D_c^* for * ∈ {+, −, b, ∅, [a, b]} (LO I p. 1).
   > - The étale topos and D(X_ét, Λ) for Deligne–Mumford stacks, and D(X, Λ) ≃ D_cart(X_lis-ét, Λ) (LZ pp. 3–4).
   > - Cohomological descent for unbounded complexes along smooth presentations.
   >
   > **ST.1 Six operations, torsion coefficients.** For f of finite type:
   > - Rf_*: D_c^+ → D_c^+ and Rf_!: D_c^− → D_c^−;
   > - Lf^* and Rf^! on D_c;
   > - RHom: (D_c^−)^op × D_c^+ → D_c^+, and ⊗^L on D_c^−.
   >
   > These carry the usual adjunctions. Rf_! and Rf^! are defined by duality, with the dualizing complex glued (LO I pp. 1–2).
   >
   > Hypotheses, stated per theorem, are either:
   > - LO's: S affine regular Noetherian of dimension ≤ 1, ℓ invertible, finite ℓ-cohomological dimension of finite-type S-schemes, Λ a 0-dimensional Gorenstein local ring of characteristic ℓ; or
   > - LZ's: □-coprime Artin stacks, □-torsion Λ and f locally of finite type, or Deligne–Mumford stacks with any torsion Λ (LZ p. 4).
   >
   > Also in ST.1:
   > - Base change in the derived category and the Künneth formula (LZ Theorem 0.1.1, Corollary 0.1.2). LO construct base change only on cohomology sheaves (LZ p. 3).
   > - Purity for a closed immersion of smooth stacks, i^!A = i^*A(−c)[−2c] (LO I Proposition 4.9.1), deduced from EDC's smooth-pair purity. This is not absolute purity.
   >
   > Boundedness. D_c^b is not preserved in general: Artin-stack pushforward needs unbounded complexes (LO II pp. 1–2), and H^*(BG_m, Q_ℓ) = Q_ℓ[T] (Sun p. 2). Each case a consumer needs in D_c^b gets its own hypotheses and proof. One such case is Lafforgue's (4.1), p. 65: Rp_! of the IC of a finite-type Deligne–Mumford truncation, which he takes from [LMB99, LO08].
   >
   > **ST.2 Adic and rational coefficients.**
   > - Λ a complete discrete valuation ring; D_c(X, Λ) built from projective systems modulo AR-null complexes; Ekedahl's normalization; the same functors with the same ranges (LO II pp. 1–2; LZ §7).
   > - Then E-coefficients for finite E/Q_ℓ, and Q̄_ℓ.
   > - Import EDC.6 and the upstream EllAdicRealization for the scheme systems.
   >
   > **ST.3 Perverse sheaves over a field.**
   > - The perverse t-structure on stacks locally of finite type. It exists because perverse sheaves form a stack for the smooth topology (BBD 3.2.4; LO perverse p. 1). Finite and adic coefficients.
   > - Recollement for a closed substack and its complement (LO perverse Example 2.1), intermediate extension and IC.
   > - The derived category of perverse sheaves is not D(X): see BG_m (LO perverse Remark 1.1).
   > - General perversities after LZ §8.
   > - ET.2b's decomposition for the proper map from the smooth anisotropic Deligne–Mumford stack is not asserted here. Source a Deligne–Mumford decomposition theorem, with its hypotheses, before planning it.
   >
   > **ST.4 Quotient stacks and equivariant categories**, shared with the perfect-scheme Part II (PAPER-ZHU-17 route 7). For a smooth affine group H over a field acting on a finite-type algebraic space X:
   > - P_H(X), and its identification with perverse sheaves on [X/H] up to the shift by dim H.
   > - Descent along a free action of a closed normal subgroup whose quotient is an algebraic space.
   > - P_H(X) ≃ P_{H/H₁}(X) for a connected closed normal H₁ acting trivially.
   > - Equivariant cohomology by finite approximations E_n → B_n (Stiefel varieties, with H ⊂ GL_r and GL_r/H quasi-affine), and H^*(BH) = R_G for connected H with reductive quotient G.
   > - The classical forms of Zhu (A.3.3)–(A.3.6) (arXiv:1407.8519v3 pp. 55–57). Zhu refers their classical proofs to [Zh2, Lemma A.1.4], not read here.
   > - The comparison with the cohomology of [X/H] from ST.1.
   >
   > **ST.5 Correspondences on Deligne–Mumford stacks.**
   > - Cohomological correspondences, and their composition via proper base change on Deligne–Mumford stacks (Lafforgue p. 65).
   > - Varshavsky's trace maps.
   > - PAPER-YUN-ZHANG-17/35 with its exact hypotheses: k finite, S a scheme, M a smooth separated Deligne–Mumford stack of pure dimension n, f: M → S proper, and C a self-correspondence whose left projection is representable and proper. Then ⟨ζ, Γ(Fr_M)⟩_s = Tr((f_!cl_C(ζ))_s ∘ Frob_s, (f_!Q_ℓ)_s) for ζ ∈ Ch_n(C)_Q and s ∈ S(k).
   > - Import EDC.8, EDC.3 and SchemeAndStackFoundations SF.5 (refined Gysin maps and excess intersection on Deligne–Mumford stacks).
   >
   > **ST.6 The Grothendieck–Lefschetz trace formula for stacks.**
   > - For an Artin stack X₀ of finite type over F_q and a fixed ι: Q̄_ℓ ≅ ℂ: Σ_n (−1)^n Tr(F_q, H^n_c(X, Q̄_ℓ)) converges absolutely and equals Σ_{x ∈ [X₀(F_q)]} 1/#Aut_x(F_q) (Sun Theorem 1.1).
   > - For complexes, only under ι-convergence, ι-mixedness and stratifiability (Sun §4).
   > - The finite-type Deligne–Mumford case is the one GROECHENIG-WYSS-ZIEGLER need.
   > - Import DeligneWeightsAndPurity DWP.8 and the upstream TraceFormula.
   >
   > **Not here:**
   > - shtuka truncations, colimits over truncations and Hecke-finiteness (GS.3);
   > - the Hitchin support theorem (ET.2b);
   > - v-stack sheaves (VStackSheavesAndLisseCategories).
   >
   > **Tests:**
   > - BG_m: unbounded cohomology, and perverse sheaves whose derived category is not D(BG_m);
   > - [X/G] for a finite group of order prime to ℓ;
   > - a Deligne–Mumford stack against its coarse space;
   > - M = S with C the diagonal in ST.5, which recovers the scheme trace formula.
3. **PAPER-LAFFORGUE-18.review.json.** Route 5 needs a verdict (see "Review verdicts" at the top). The entry to record, if the maintainer accepts it: `{"route": 5, "verdict": "accept", "reason": "Added by the RT-AREA-etale fix (finding /3, confirmed)."}`.

**PAPER-YUN-ZHANG-17.result.json**

4. **Route 4.**
   - `route`: `source` → `part-ii`. Add `parent` `EtaleDualityAndPerverseSheaves`, `roadmap` `EtaleDualityAndPerverseSheavesPartIIStacks`, the same `title`, and `area` `etale`. Remove `stages`.
   - `brief`: "This route adds a consumer to the stacks Part II proposed by PAPER-LAFFORGUE-18 route 5; follow that brief. Lemma A.11 and Proposition A.12 are ST.5's acceptance statement, with the hypotheses of item 35."
   - `reason`: prefix "EDC.8 is scheme-only (RT-AREA-etale/3). ".
   - Item 35 `note`: replace "Routed to EtaleDualityAndPerverseSheaves EDC.8 as a source." with "Routed to the stacks Part II (ST.5)."
   - Review route 4: the route changes kind, so its verdict needs a fresh decision (see "Review verdicts" at the top). If it is kept, append "Converted to the stacks Part II by the RT-AREA-etale fix."
5. **Route 1 `brief`.** Replace "EDC.8 for cohomological correspondences and trace classes, together with the Frobenius-graph trace formula of §A.4 (Lemma A.11 and Proposition A.12), also routed as a source of EDC.8 here;" with:
   > "EDC.8 for cohomological correspondences and trace classes on schemes; EtaleDualityAndPerverseSheavesPartIIStacks (the stacks Part II) for sheaf operations, perverse sheaves and IC on the shtuka and Hecke stacks and for the Frobenius-graph trace formula of §A.4 (Lemma A.11 and Proposition A.12), routed there by this extraction;"

**PAPER-YUN-ZHANG-19.result.json**

6. **Route 6.** The same conversion as edit 4 (its only item is 120). Item 120's note: replace "Routed to the EtaleDualityAndPerverseSheaves source route." with "Routed to the stacks Part II (ST.5), with YZ17/35 as its statement." Review route 6: note the conversion.
7. **Route 7 `brief`.** Replace "Étale duality, cycle classes and perverse sheaves (EtaleDualityAndPerverseSheaves EDC.5/7/8) plus its IndConstructibles extension;" with:
   > "Étale duality, cycle classes and perverse sheaves (EtaleDualityAndPerverseSheaves EDC.5/7/8) plus its IndConstructibles and stacks (EtaleDualityAndPerverseSheavesPartIIStacks, ST.1–ST.5) extensions;"
8. **Route 8 `brief`.** After "(EtaleDualityAndPerverseSheaves EDC.5/7/8)" insert " and its stacks Part II (ST.1, ST.4) for sheaves and traces on the root-Picard stacks".

**PAPER-FENG-YUN-ZHANG-24.result.json**

9. **Route 1 `brief`.** After "- EtaleDualityAndPerverseSheaves EDC.5 and EDC.7 for the perverse t-structure, intermediate extensions, smallness and the decomposition theorem;" insert:
   > "\n- EtaleDualityAndPerverseSheavesPartIIStacks (ST.1–ST.5) for these operations on the Hecke and shtuka stacks and for correspondences on Deligne–Mumford stacks; truncations, colimits and Hecke-finiteness stay here;"

**Links for the maintainer.** These go into each target's `requires` once the Part II exists; the source is a draft.
- ST.3–ST.4 → GlobalShtukasAndFunctionFieldLanglands:GS.1. GS.2 inherits it through GS.1.
- ST.1–ST.3 and ST.5 → GS.3.
- ST.1 and ST.3 → EndoscopicTransferAndUnitaryTraceComparison:ET.2b.
- **Cycle check.** In the assembled atlas none of GS.1, GS.2, GS.3 or ET.2b reaches any import of the Part II (EDC.0–EDC.8, SF.1, SF.5, R09.4, R09.5, E2, E3, E4, L2, DWP.7–DWP.9), so all are acyclic.

**EDC README**

10. **"Conventions and dependency order".** After "General arbitrary Noetherian bases are not silently included in every constructibility statement." add:
    > "Algebraic stacks are not in the principal category. ℓ-adic sheaf theory on Artin and Deligne–Mumford stacks is 'Étale duality, cycle classes and perverse sheaves, Part II: Artin and Deligne–Mumford stacks', which imports EDC.0–EDC.8. This covers the Laszlo–Olsson and Liu–Zheng operations, perverse sheaves and IC on stacks, equivariant categories on quotient stacks, and correspondences and trace formulas on Deligne–Mumford stacks."

### Not done, and why
- **The Deligne–Mumford decomposition theorem for ET.2b** is kept as a stated obligation: I read no source for it. Hypotheses to settle: finite inertia, separatedness, properness, pure coefficients.
- **Varshavsky's contracting-correspondence theorem** (an input to YZ17 A.12) is proved inside ET.5. ST.5 must not import ET.5 as a whole stage: ET.2b → ET.3 → ET.4 → ET.5, and ET.2b imports this Part II. The maintainer must settle a single early owner. I did not read Varshavsky.
- **Recommended, beyond the finding's list** (maintainer to confirm):
  - **CANNING-LARSON-PAYNE-24/14** (SF.2) cannot be supplied to SF.2 by this Part II: SF.2 → … → EDC.2 would close a cycle. Route it to the Part II (ST.1–ST.2).
  - **GROECHENIG-WYSS-ZIEGLER-20-B route 1 and -20 route 5** should import ST.6 instead of planning "its own layer". Replace "State separately, as its own layer, the Grothendieck–Lefschetz trace formula … which no roadmap owns …" with "Import the Grothendieck–Lefschetz trace formula for finite-type stacks over F_q from EtaleDualityAndPerverseSheavesPartIIStacks (ST.6)".
  - **ABDURRAHMAN-VENKATESH-25 route 6.** After "(EtaleDualityAndPerverseSheaves EDC.2, EDC.4, EDC.8)" add "and its stacks Part II for the Hurwitz stacks".
- **The GS packet** should add a `requests` entry for stack operations (ST.1–ST.5). That is the GS blueprint job's to do.
- **Not read:** YZ17 (its statement is the reviewed extraction item), the published Laszlo–Olsson versions, and Liu–Zheng beyond pp. 1–4.

## /4 (high, missing): stable pointed moduli and de Jong's projective covers get one owner, StableReductionPartII, which supplies L5:alterations

### What the verifier corrected

- This is a missing source and hypothesis closure. It is not a claim that Tau Ceti StableReduction proves that a moduli stack is proper.
- Extend StableReductionPartII to the stable pointed range 2g − 2 + n > 0, together with the finite-cover/compactification theorem. It imports generic stack and coarse-space machinery and the upstream DVR stable-reduction theorem.
- Retarget the shared pointed-moduli content, meaning LANDESMAN-LITT-24/106.
- The specific supplier edge goes to the scheme-alteration prefix of L5 (finding /21), not to L5 as it stands.
- The verifier read de Jong 2.24 (p. 62), 4.17 (p. 71) and 5.13 (p. 80). The actual inputs are pointed stable-curve moduli, projective finite scheme covers carrying a curve, and the closure construction. 2.24 is stated for n ≥ 3.

### State on main (1b1aeb19)

The defect is still there. The texts of L5, its decomposition and Tau Ceti StableReduction are unchanged since the verification; what is new is listed below (MotivicStructuresInModuliOfCurves, RS-27).

- **L5 task 2** (`content/campaign/AdicCoefficientsAndComparisons/README.md`, unchanged since 2026-09-15) names no supplier:
  > 2. Establish the curve-fibration construction, extension of the generic curve and marked boundary, finite base extension, and stable/semistable reduction of that family. Consume a proved stable-curve supplier where its hypotheses agree; otherwise the needed curve-family theorem is a task of this stage, not an unexplained import.
- **The reviewed decomposition** (`data/decompositions/AdicCoefficientsAndComparisons.json`) stops before the moduli input.
  - The proof step of node `L5/de-jong-5-8-curve-fibration-alteration` reads "(unread) three-point-stabilisation and the stable reduction of the generic curve."
  - Its gap "de Jong proofs beyond the reduction steps" asks to read "§5.11-5.13 (including the stable-reduction input, [dJ96, §3] and the citation of Deligne-Mumford/Knudsen)".
- **Tau Ceti StableReduction** (`content/tau-ceti/StableReduction/README.md`) stops before any moduli object.
  - Its introduction: "It does **not** construct a moduli functor, stack, or coarse moduli space, and it does not yet claim that such an object is proper."
  - Layer 9, last bullet: "Express the result as essential existence after finite DVR extension and unique extension over a fixed DVR. This is the precise input a future properness proof for `Mbar_{g,n}` and for stable-map moduli should consume."
- **The design job.** In `research/blueprint/queue.json`, `DESIGN-StableReductionPartII` is pending (kind design, priority 1, order 12, outputs `research/blueprint/roadmaps/StableReductionPartII.json` and its packet, readme and suggested file); so is `REV-DESIGN-StableReductionPartII`. Its prompt is generated by `make_queue.py` and is not tracked. `paper_designs` folds every accepted Part II route whose parent is `tauceti:TauCetiRoadmap/StableReduction`. There are two, and both are unpointed:
  - **PAPER-YUAN-26 route 10** (19 items; overall review "accept"). Its brief says "Construct M_g, barM_g and their universal curves for g>1 over Z" and "Construct projective finite scheme covers and the smooth fine full-level moduli with N≥3 invertible, without pretending naive level structure extends across every node".
  - **PAPER-DIMITROV-GAO-HABEGGER-21 route 7** (accepted). It adds the fine level-ℓ moduli M_{g,ℓ} for g ≥ 2 and the Torelli morphism.
- **LANDESMAN-LITT-24/106** ("The moduli stack of n-pointed genus g curves and its Deligne–Mumford compactification", status missing) is routed by the accepted route 5 to R09.4, R09.5 and R09.7. The route itself concedes: "The stated targets of R09.4 today are generalised elliptic curves and polarised abelian schemes, so M_{g,n} is not yet planned there". The text of R09.4 confirms this: "moduli-stack algebraicity results used for generalised elliptic curves and polarised abelian schemes".
- **New since the verification: a third planner.** PAPER-CANNING-LARSON-PAYNE-24 route 1 (proposed before the verification, accepted by its review on 2026-09-28) and PAPER-BERGSTROM-FABER-PAYNE-24 route 1 (accepted 2026-09-29) found the new roadmap MotivicStructuresInModuliOfCurves; `DESIGN-MotivicStructuresInModuliOfCurves` is pending. Its brief says:
  > The roadmap must cover, in order: the moduli stacks M_{g,n} and M̄_{g,n} as smooth proper Deligne–Mumford stacks with their boundary stratification by stable graphs, …

  Its items CANNING-LARSON-PAYNE-24/2 and BERGSTROM-FABER-PAYNE-24/moduli-stacks are the same objects.
- **RS-27** (`research/blueprint/restructure/RS-27.*`, review pending) is consistent with this fix and touches it in three places:
  - It narrows R09.4 to "… the algebraicity of the moduli stacks of generalised elliptic curves and polarised abelian schemes …", with no M_{g,n}. LANDESMAN-LITT-24 route 5 therefore adds to R09.4 a source outside RS-27's `keeps`, a latent conflict RS-27 does not mention. Moving /106 out (Edit 2) removes it.
  - It keeps in R09.5 "normalisation, schematic closure and descent of finite correspondences for Deligne–Mumford stacks". That is exactly the input for de Jong's normalizations of M̄_{g,n}[1/ℓ], so StableReductionPartII imports it from R09.5.
  - It makes Tau Ceti StableReduction Layer 4 the owner of the Rees blowup, and A0-extension keeps "finiteness of normalisation under excellence". L5:alterations imports from exactly these owners (finding /21).
  - RS-27 does not mention M_{g,n}, de Jong or LANDESMAN-LITT-24.
- **Libraries.** There is no stable-curve family and no moduli stack in either pinned library.
  - Tau Ceti f790474 has `TauCeti.Model` (`TauCeti/AlgebraicGeometry/Curves/StableReduction/Model/Basic.lean:44`), a flat finitely presented model over a DVR with a generic-fibre identification. It also has `TauCeti.FiniteDVRExtension` (`…/StableReduction/DVRExtension/Basic.lean:85`) and numerical-type and Picard files.
  - Name searches of both indexes for AlgebraicStack, DeligneMumford, AlgebraicSpace, StableCurve, Semistable, Prestable, Nodal and Alteration find nothing relevant.

### Fix

**The supplier theorem**, stated from the sources read:

- **(a) Moduli** (Knudsen, *The projectivity of the moduli space of stable curves II*, Math. Scand. 52 (1983), Definition 1.1, p. 162, and Theorem 2.7, p. 179).
  - For g, n ≥ 0 with 2g − 2 + n > 0, the stack M̄_{g,n} of stable n-pointed genus-g curves "is an algebraic stack, proper and smooth over Spec (Z)".
  - The substack of singular curves "is a divisor with normal crossings relative to Spec (Z)".
  - M̄_{g,n+1} is the universal curve over M̄_{g,n} (Introduction, p. 162).
- **(b) Projective covers** (de Jong 1996, 2.24, p. 62), for n ≥ 3 and a prime ℓ ≥ 3.
  - The finite étale cover ℓM_{g,n} → M_{g,n}[1/ℓ] trivialising the ℓ-torsion of the Jacobian of the universal curve is a scheme.
  - The normalization ℓM̄_{g,n} of M̄_{g,n}[1/ℓ] in the function field of ℓM_{g,n} is a projective scheme over Z[1/ℓ]. It carries the stable n-pointed curve pulled back from M̄_{g,n}[1/ℓ].
  - For distinct primes ℓ₁, ℓ₂ ≥ 3, the normalization M̄ of M̄_{g,n} in the function field of ℓ₁ℓ₂M_{g,n} is a projective scheme over Z. It has a finite dominant morphism M̄ → M̄_{g,n} and a universal curve.
- **(c) Compactification after alteration**, in the form de Jong uses it (4.17, pp. 71–72; 5.13, pp. 80–81).
  - Setting: Y is integral (a variety over a field k, or an integral excellent scheme), U ⊂ Y is dense open, and (X_U, σ₁, …, σₙ) is a smooth stable n-pointed genus-g curve over U with n ≥ 3.
  - Take the closure Y′ of an irreducible component U′ of U ×_{M_{g,n}} ℓM_{g,n} in Y × ℓM̄_{g,n}, with ℓ prime to char k. Alternatively, take the closure of a component of M̄ ×_{M̄_{g,n}} U in M̄ × Y.
  - Then Y′ → Y is a projective alteration, generically étale in the first case, and X_U extends to a stable n-pointed curve over Y′.

**Edit 1: PAPER-YUAN-26 route 10, field `brief`** (`research/blueprint/papers/PAPER-YUAN-26.result.json`). Append:

> Pointed range (FIX-RT-AREA-etale /4, confirmed by REV-RT-AREA-etale). Also construct, for all g, n ≥ 0 with 2g − 2 + n > 0, the stack barM_{g,n} over Z of stable n-pointed genus-g curves (Knudsen, Math. Scand. 52 (1983), Definition 1.1), its open substack M_{g,n} of smooth curves and the universal curve barM_{g,n+1} → barM_{g,n}; prove Knudsen's Theorem 2.7: barM_{g,n} is an algebraic stack, proper and smooth over Z, and the substack of singular curves is a divisor with normal crossings relative to Z. For n ≥ 3 construct de Jong's projective scheme covers (Publ. Math. IHÉS 83 (1996), 2.24): for a prime ℓ ≥ 3 the finite étale cover ℓM_{g,n} → M_{g,n}[1/ℓ] trivialising the ℓ-torsion of the Jacobian of the universal curve, which is a scheme; the normalization ℓbarM_{g,n} of barM_{g,n}[1/ℓ] in the function field of ℓM_{g,n}, a projective Z[1/ℓ]-scheme carrying the pulled-back stable n-pointed curve; and, for distinct primes ℓ₁, ℓ₂ ≥ 3, the normalization barM of barM_{g,n} in the function field of ℓ₁ℓ₂M_{g,n}, a projective Z-scheme with a finite dominant morphism to barM_{g,n} and a universal curve. Export the compactification theorem in de Jong's form (4.17, 5.13): a smooth stable n-pointed curve, n ≥ 3, over a dense open U of an integral Y (a variety over a field, or an integral excellent scheme) extends to a stable n-pointed curve over the closure Y′ of a component of U ×_{M_{g,n}} ℓM_{g,n} in Y × ℓbarM_{g,n} (ℓ prime to the characteristic; Y′ → Y a generically étale projective alteration), or of barM ×_{barM_{g,n}} U in barM × Y (a projective alteration). Import generic stacks and the normalization and closure of Deligne–Mumford stacks from AlgebraicModuliForArithmeticGeometry R09.4–R09.5, and the pointed DVR stable-reduction theorem from Tau Ceti StableReduction Layer 9 for properness. Put barM_{g,n}, the covers and the compactification theorem in a stage that does not require the Torelli, ShimuraCompactifications C5 or JacobianChallengePartII inputs, since AdicCoefficientsAndComparisons L5:alterations imports it. Consumers: L5:alterations, PAPER-LANDESMAN-LITT-24/106 and MotivicStructuresInModuliOfCurves. For n ≤ 2 a finite projective scheme cover is a separate target: de Jong 2.24 assumes n ≥ 3, and this route's item 84 gives a cover only for g > 1 and n = 0; prove it only from a source read at that step.

**Edit 2: LANDESMAN-LITT-24/106 moves to the Part II** (`research/blueprint/papers/PAPER-LANDESMAN-LITT-24.result.json`, with the matching `.review.json`).

- **Route 5.** In `items`, remove `"PAPER-LANDESMAN-LITT-24/106"`.
  - In `reason`, replace "The two items routed here are the algebraicity of the moduli stack M_{g,n} of smooth n-pointed genus g curves, with its Deligne–Mumford compactification and the existence of finite étale covers that are schemes, and" with "The item routed here is".
  - Also delete the sentence "The stated targets of R09.4 today are generalised elliptic curves and polarised abelian schemes, so M_{g,n} is not yet planned there, but it is precisely the same kind of statement and PROTOCOL.md section 15 asks that a general missing notion be planned once in the layer that owns it rather than duplicated."
  - Append: "Item 107 imports barM_{g,n+1} from StableReductionPartII, which owns pointed moduli of curves (FIX-RT-AREA-etale /4)."
- **New route 6:**

```json
{"route": "part-ii", "parent": "tauceti:TauCetiRoadmap/StableReduction", "roadmap": "StableReductionPartII",
 "title": "Stable reduction of curves and stable maps, Part II: moduli of curves and stable compactifications",
 "area": "arithmeticgeometry", "items": ["PAPER-LANDESMAN-LITT-24/106"],
 "brief": "This is the pending PAPER-YUAN-26 Part II of the same id; its brief, with the pointed range 2g − 2 + n > 0 added by FIX-RT-AREA-etale /4, remains binding. This paper needs M_{g,n} as a smooth separated Deligne–Mumford stack of dimension 3g − 3 + n, its compactification barM_{g,n} with normal-crossings boundary, and finite étale covers of M_{g,n} that are schemes ([PdJ95, Proposition 2.3.4], cited at Lemma 2.1.4, p. 13). Export them to MappingClassGroupsAndCanonicalRepresentations (route 1) and to item 107 at R09.7.",
 "reason": "Pointed moduli of curves have one owner, StableReductionPartII (FIX-RT-AREA-etale /4, confirmed by REV-RT-AREA-etale). R09.4 keeps general stacks and the elliptic and abelian moduli, as RS-27 proposes."}
```

- **Review file.** Route 6 needs a verdict, because `accepted_routes` applies only routes with one (see "Review verdicts" at the top). The entry to record, if the maintainer accepts it: `{"route": 6, "verdict": "accept", "reason": "Applies the confirmed finding REV-RT-AREA-etale /4."}`.

**Edit 3: MotivicStructuresInModuliOfCurves imports the moduli** (`research/blueprint/papers/PAPER-CANNING-LARSON-PAYNE-24.result.json`).

- **Route 1, `brief`.** Replace "the moduli stacks M_{g,n} and M̄_{g,n} as smooth proper Deligne–Mumford stacks with their boundary stratification by stable graphs," with:
  > the boundary stratification by stable graphs of the moduli stacks M_{g,n} ⊂ M̄_{g,n}, which, with their algebraicity, smoothness, properness and normal-crossings boundary, are imported from StableReductionPartII (FIX-RT-AREA-etale /4),
- **Item /2, `note`.** Replace the note with:
  > Constructed in StableReductionPartII, the single owner of pointed stable-curve moduli (FIX-RT-AREA-etale /4); this roadmap imports it.

**Edit 4: L5 task 2 becomes an import.** It is rewritten as task 2 of the new prefix L5:alterations (finding /21, Edit 1). There it imports M̄_{g,n}, the covers of 2.24 and the compactification theorem from StableReductionPartII.

**Edit 5: the decomposition** (`data/decompositions/AdicCoefficientsAndComparisons.json`; node ids as renamed in /21, Edit 3).

- **Node `…L5:alterations/de-jong-5-8-curve-fibration-alteration`.**
  - In `proofSteps`, replace "(unread) three-point-stabilisation and the stable reduction of the generic curve." with:
    > make Z finite flat over an open and add sections (5.11); obtain at least three special points on each fibre component (5.12, Lemma 5.2); map the smooth stable n-pointed generic curve to M̄_{g,n}, take a component of M̄ ×_{M̄_{g,n}} U and its closure S′ in M̄ × S, a projective alteration since M̄ is projective over Z, over which the curve extends to a stable n-pointed curve (5.13, 2.24; StableReductionPartII); extend the identification to a morphism after modifying the base (5.14, using 4.18–4.21); pass to all-smooth components and split semi-stability (5.15–5.17).
  - In `hypotheses`, replace "Proof beyond 5.10 not read" with:
    > 5.11–5.17 read on the page images (pp. 80–81); 4.18–4.21 and the section lemmas of §5 not read; the moduli input is imported from StableReductionPartII
- **Node `…/de-jong-4-1-alteration-field-case`.** In `hypotheses`, replace "Steps 4.12-4.22 and the curve-fibration input (Theorem 5.8 / stable reduction) not read" with:
  > 4.15–4.18 read (pp. 71–72): 4.17 makes the alteration generically étale using de Jong's cover ℓM̄_{g,n} with ℓ ≥ 3 prime to char k (imported from StableReductionPartII); 4.12–4.14 and 4.19–4.22 not read
- **Both nodes, `sources`.** Add these verbatim excerpts:
  - `{"sourceId": "deJong-Alterations-1996", "locator": "§2, 2.24, p. 62", "excerpt": "Fix g ≥ 0, n ≥ 3 and let M̄_{g,n} denote the algebraic stack over Z classifying stable n-pointed curves of genus g.", "match": "The moduli input and its range."}`
  - `{"sourceId": "deJong-Alterations-1996", "locator": "§4, 4.17, p. 72", "excerpt": "It is clear that Y′ is a projective variety over k and that ψ : Y′ → Y is an alteration which is generically étale.", "match": "Compactification after a generically étale alteration."}`
  - `{"sourceId": "deJong-Alterations-1996", "locator": "§5, 5.13, p. 81", "excerpt": "Remark that S′ → S is a projective alteration as M̄ is projective over Spec Z.", "match": "Compactification over an excellent base."}`
- **Gap "de Jong proofs beyond the reduction steps", `detail`.** Replace "§5.11-5.13 (including the stable-reduction input, [dJ96, §3] and the citation of Deligne-Mumford/Knudsen)" with:
  > the section lemmas of §5, 4.18–4.21 and §3 (2.24, 4.15–4.18 and 5.8–5.17 are now read; the moduli input is Knudsen II and Deligne's 'Le lemme de Gabber', [16] and [6] of de Jong, supplied by StableReductionPartII)
- **Source `deJong-Alterations-1996`, `readSections`.** Add "§2, 2.19–2.24 (pp. 60–62); §4, 4.15–4.18 (pp. 71–72); §5, 5.8–5.17 (pp. 79–81), from the page images".

**Edges.**

- **A link for the maintainer:** StableReductionPartII (its M̄_{g,n} stage) → L5:alterations, applied once the Part II is designed; both ends are new.
- **Acyclicity.** It cannot close a cycle if none of the Part II's likely imports is reachable from a consumer of L5:alterations. The likely imports are R09.1, R09.3, R09.4, R09.5, SF.0, SF.1, StableReduction Layers 2, 8 and 9, JacobianChallenge Layer D and ShimuraCompactifications C5; the consumers are L5, L6, SF.4, RD.5 and AdicSpacesPartII:F1.
- The cycle test for `R` → `C` over all 55 such pairs gives "acyclic" every time.
- **Imports named in Edit 1.** The imports R09.4, R09.5 and Layer 9 → StableReductionPartII target a draft, so they add no atlas edge.

### Not done, and why

- **Covers for n ≤ 2.** A finite projective scheme cover for n ≤ 2 (g ≥ 1) has no source read here. It is recorded as a target of the Part II (Edit 1), not stated as a theorem.
- **Proofs not read.** Knudsen's proof and Deligne's "Le lemme de Gabber" (de Jong's [6], cited for the projectivity of ℓM̄_{g,n}) were not read. The Part II must close them from a source read at that step.
- **Stage boundaries** inside StableReductionPartII belong to its design job. Edit 1 only requires that the M̄_{g,n} stage does not need the Torelli inputs.

## /5 (high, missing): relative duality for smooth morphisms of every dimension, for H5's characteristic-p comparison

### What the verifier corrected
- ECD Proposition 27.2 (pp. 163–164) applies Hub96 Theorem 3.8.1 in characteristic p, after reducing to perfected affine m-space for every finite m.
- Hub96 p. 228 sends the characteristic-p proof of 3.8.1 to Berkovich §7.5. That proof needs the compact-support comparison 5.7.2 and duality 7.5.3.
- Berkovich Lemma 7.5.2 (printed p. 147) uses relative duality for smooth morphisms of pure dimension d, after shrinking the base until the compactly supported direct images are locally constant.
- H3 restricts its duality to curves. Zavyalov's accepted route 5 adds absolute duality and traces in all dimensions and the Huber–Berkovich interfaces, but not this relative theorem.
- The fix is to add a relative smooth suffix, import it into H5, and keep the curve prefix early.
- State Huber's actual scope (7.5.1–7.5.3): separated, taut, smooth morphisms of analytic pseudo-adic spaces of pure dimension d, a quasi-separated target, and torsion prime to the relevant residue characteristics. Do not state duality for arbitrary smooth analytic maps or for residue-characteristic torsion.

### State on main (1b1aeb19)
- **H3** (`content/campaign/ClassicalAdicEtaleCohomology/README.md`) is titled "Proper support, traces and Poincaré duality for curves". Its text says "For smooth analytic curves over a complete algebraically closed nonarchimedean field, construct the trace and the duality pairing." It also says "The explicit Hub96 outputs are Proposition 5.5.8 (dimension bound), Theorem 7.2.2 (trace) and Theorem 7.5.3 (duality)."
- **H5** says "Prove the cases of Hub96 Theorems 3.7.2 and 3.8.1, and Proposition 6.1.1, used in ECD §27". With the RS-05 links, H5 requires:
  - L2, H0, H1 and its four substages;
  - H3 and H4;
  - AdicSpacesPartII R1–R2, D0 and E1.

  Only H3 supplies duality.
- **Nothing else owns the theorem.** A search of all 2840 stage texts for "7.5.3", "Ber93", "relative Poincaré" and "Poincaré … smooth/rigid/analytic" finds nothing that owns relative duality for smooth analytic morphisms in dimension > 1.
- **The reviewed decomposition.** Node `H5/comparison-over-nonarchimedean-fields-3-8-1` records the route "if char k > 0, as Berkovich's comparison [Ber1, 7.5], using cohomology with proper support … (5.7.2) and Poincaré duality (7.5.3)". Its gap "H5 inputs beyond §§3.7-3.8" is open.
- **No change since 24 September.** The README last changed on 15 September, the decomposition on 16 September and PAPER-ZAVYALOV-25 on 23 September.
- **One pending packet touches H3.** The blueprint packet `ClassicalAdicEtaleCohomology--H0` (job BP-ClassicalAdicEtaleCohomology--H0, scope H0–H3, committed 27 September, #3281) plans H3 at declaration level:
  - it proves the curve trace and curve duality over Spa(C, O_C) by transplanting Berkovich §§6–7;
  - it records the Huber–Berkovich comparison (Hub96 §8.3) and the higher-rank plus-ring case as gaps;
  - it plans nothing in dimension > 1;
  - its rescope proposal says H5 "proves only the general dimension" of the algebraic–analytic comparison.
- **Paper routes aimed at H3.** Both papers have overall verdict accept.
  - PAPER-ZAVYALOV-25 route 5 sends items 2, 121–123 and 136–139 to H3. These include item 2 (Theorem 1.1.3, duality for smooth proper spaces in all dimensions) and item 123 (Theorem 5.3.3, the trace for smooth partially proper morphisms of pure dimension d).
  - PAPER-GUO-REINECKE-24 route 8 sends item 195, the Berkovich–Zavyalov trace in every relative dimension, to H3.

  So the curve stage is at present the named owner of the all-dimensional traces.
- **TB.0 is already upstream.** TropicalAndBerkovichArithmetic:TB.0, which owns ZAVYALOV-25/133–135 (Huber's equivalence with Berkovich spaces), is already an ancestor of H3: TB.0 → AdicSpacesPartII:R3 → AdicEtaleGeometry:A1 → A2 → H3.

### Fix

**1. New stage `ClassicalAdicEtaleCohomology:H3:smooth-duality`.** Insert this section in `content/campaign/ClassicalAdicEtaleCohomology/README.md` after the H3 section and before "## H4.":

> <a id="h3-smooth-duality"></a>
> <a id="stage-H3:smooth-duality"></a>
> ### H3:smooth-duality — Compact-support comparison, traces and duality for smooth morphisms of every dimension
>
> This suffix comes after H3. It is not an input of DiamondSixOperations S4–S5, which need only the curve case above. H5 imports it for the characteristic-p proof of Hub96 Theorem 3.8.1, which Hub96 (p. 228) gives as Berkovich's comparison theorem [Ber1, 7.5] and which ECD 27.2 applies to perfected affine m-space for every m. Prove:
>
> 1. **Compact-support comparison (Hub96 5.7.2).** For a compactifiable morphism φ : 𝒴 → 𝒳 of schemes locally of finite type over Spec 𝒜, 𝒜 a k-affinoid algebra, and an abelian torsion sheaf F on 𝒴, (R^qφ_!F)^an ≅ R^qφ^an_!F^an for all q (Berkovich 1993, Theorem 7.1.1 and Corollary 7.1.4), with base change for quasi-algebraic pairs (Corollary 7.1.5). H3 already needs the curve case. The trace below needs the case of affine space.
> 2. **Trace (Hub96 7.2.2).** Let n be prime to char(k). Every separated smooth morphism φ : Y → X of pure dimension d has a trace Tr_φ : R^{2d}φ_!(μ_n^{⊗d}) → ℤ/n.
>    - It is characterised by compatibility with base change and composition, by the étale trace when d = 0, and by H3's curve trace when d = 1 (Berkovich 7.2.1–7.2.3).
>    - It is an epimorphism when the fibres are nonempty.
>    - It is an isomorphism when the geometric fibres are nonempty and connected and n is prime to char(k̃).
>
>    For partially proper smooth morphisms of rigid spaces this is Zavyalov's Theorem 5.3.3.
> 3. **Relative Poincaré duality (Hub96 7.5.3).** If n is prime to char(k̃), the duality morphism Rφ_*RHom(G, φ^*F(d)[2d]) → RHom(Rφ_!G, F) is an isomorphism for G ∈ D⁻(Y, ℤ/n) and F ∈ D⁺(X, ℤ/n) (Berkovich 7.3.1). It is false without that hypothesis (Berkovich Remark 6.2.10). Derive:
>    - Rφ_*φ^*F ≅ RHom(Rφ_!ℤ/n, F(−d)[−2d]) (Berkovich 7.4.1);
>    - R^qφ_*F ≅ (R^{2d−q}φ_!(F^∨))^∨(−d) when F and all R^qφ_!(F^∨) are finite locally constant (Berkovich 7.4.9). This is the form Berkovich 7.5.2 uses.
>
> **Scope.** State the adic theorem as Hub96 7.5.1–7.5.3 do: separated, taut, smooth morphisms of analytic pseudo-adic spaces of pure dimension d, with quasi-separated target and torsion prime to the relevant residue characteristics.
> - This is not a duality theorem for arbitrary smooth analytic maps.
> - It is not a duality theorem for torsion divisible by a residue characteristic. Mod-p duality belongs to the proposed Part II for mod-p Poincaré duality (PAPER-ZAVYALOV-25 route 1).
>
> **Proof route.** Prove Berkovich's theorems on Berkovich spaces and transport them through Huber's comparison:
> - from TropicalAndBerkovichArithmetic TB.0: the equivalence of taut adic spaces locally of finite type with Hausdorff strictly analytic spaces, and what it does to partially proper and smooth maps (Zavyalov Lemma A.7, Lemma A.8 and Corollary A.11; PAPER-ZAVYALOV-25/134–135);
> - from H3: the strict étale site and θ (Definition A.13), compact supports for partially proper maps (Theorem A.15), overconvergent sheaves (Lemma A.18) and étale traces (Lemma A.19); these are PAPER-ZAVYALOV-25/136–139.
>
> This transport covers partially proper smooth morphisms of taut rigid spaces. The scheme side of Berkovich 7.5.2 ("Theorem 7.4.9 and its analog for schemes") is EDC.2's smooth trace and f^*Λ(d)[2d] ≅ f^!Λ, which is imported. No diamond cohomological smoothness and no Rf^! is used.
>
> **Open obligations.** These are gaps, not assumptions:
> - the rest of Huber's scope (maps that are not partially proper, and higher-rank plus rings), which only Hub96 proves;
> - a proof that the analytification of a smooth morphism of finite-type k-schemes, the case H5 uses, lies in the transported class.

Stage record in `data/atlas.json`: `requires` = [`ClassicalAdicEtaleCohomology:H3`, `TropicalAndBerkovichArithmetic:TB.0`, `EtaleDualityAndPerverseSheaves:EDC.2`], and consumer H5. TB.0 and EDC.2 are already ancestors of H3; they are listed as the named suppliers of the imports.

**2. H3 text.** Replace "The explicit Hub96 outputs are Proposition 5.5.8 (dimension bound), Theorem 7.2.2 (trace) and Theorem 7.5.3 (duality)." with:

> The explicit Hub96 outputs are Proposition 5.5.8 (dimension bound), and Theorem 7.2.2 (trace) and Theorem 7.5.3 (duality) for smooth curves. Their forms for smooth morphisms of every pure dimension d are the later suffix [H3:smooth-duality](#h3-smooth-duality). This curve part stays before it, because DiamondSixOperations S4–S5 consume it.

**3. H5.**
- **Text.** After "Supply the exhaustion-by-balls and overconvergent-sheaf continuity statements used in 27.2.", insert:
  > ECD 27.2 (pp. 163–164) applies 3.8.1 over the completed algebraic closure of 𝔽̄_p((t)) to perfected affine m-space for every finite m. In characteristic p, Hub96 (p. 228) proves 3.8.1 as Berkovich's comparison theorem (Berkovich 1993, Theorem 7.5.1 and Corollary 7.5.3). Its Lemma 7.5.2 needs relative duality for smooth morphisms of every pure dimension d, and the compact-support comparison. Import both from [H3:smooth-duality](#h3-smooth-duality); H5 does not reprove them.
- **Edge.** Add `ClassicalAdicEtaleCohomology:H3:smooth-duality` to H5's `requires` (edge H3:smooth-duality → H5).
- **Cycle check.** The suffix is new. Its inputs are H3, TB.0 and EDC.2, and its only consumer is H5. A path search finds no path from H5 to H3, to TB.0 or to EDC.2, so no cycle arises. The cycle test for `ClassicalAdicEtaleCohomology:H3` → `ClassicalAdicEtaleCohomology:H5` reports acyclic.

**4. Paper routes.** Move the all-dimensional items off the curve stage.
- **`research/blueprint/papers/PAPER-ZAVYALOV-25.result.json`, route 5:**
  - `stages`: `["ClassicalAdicEtaleCohomology:H3"]` → `["ClassicalAdicEtaleCohomology:H3", "ClassicalAdicEtaleCohomology:H3:smooth-duality"]`;
  - append to `reason`: "Split by dimension (RT-AREA-etale fixes, /5): items 121 and 136–139 (dimension, and the Huber–Berkovich interfaces that the curve proofs already need) stay at H3; items 2, 122 and 123 (duality, the bound R^if_! = 0 for i > 2d, and the trace in every relative dimension) go to H3:smooth-duality."
- **Items /2, /122, /123:** append to each `note`: "Planned by route 5 at ClassicalAdicEtaleCohomology:H3:smooth-duality, not at the curve stage H3."
- **`research/blueprint/papers/PAPER-GUO-REINECKE-24.result.json`, route 8.** This is for consistency, since item 195 is the same trace (Zavyalov 5.3.3).
  - `stages`: `["ClassicalAdicEtaleCohomology:H3"]` → `["ClassicalAdicEtaleCohomology:H3:smooth-duality"]`.
  - In `reason`, replace "H3 owns traces and Poincaré duality in the classical adic étale theory; the Berkovich–Zavyalov trace for smooth proper rigid spaces is the general-dimensional form of that trace" with "ClassicalAdicEtaleCohomology:H3:smooth-duality owns traces and duality for smooth morphisms of every dimension in the classical adic étale theory (H3 keeps the curve case); the Berkovich–Zavyalov trace for smooth proper rigid spaces is that trace".

  Both routes change stage, so the maintainer should have them re-reviewed.

**5. Decomposition (`data/decompositions/ClassicalAdicEtaleCohomology.json`).** In the gap "H5 inputs beyond §§3.7-3.8", replace "and to Berkovich (char p) with 5.7.2 and 7.5.3" with "and to Berkovich (char p) with 5.7.2 and 7.5.3, which ClassicalAdicEtaleCohomology:H3:smooth-duality supplies (Berkovich 1993, Lemma 7.5.2, p. 147: relative duality 7.4.9 for smooth φ of pure dimension d, and the compact-support comparison 7.1.4–7.1.5)".

**6. Blueprint jobs.**
- Add the suffix to the scope of BP-ClassicalAdicEtaleCohomology--H0. Its H3 nodes already transplant Berkovich §§6–7 and carry the §8.3 comparison gap.
- In that packet's first `restructure` proposal, replace "H5 cites ClassicalAdicEtaleCohomology:H3/algebraic-curve-comparison for the curve case and proves only the general dimension" with "H3:smooth-duality proves the general dimension of the compact-support comparison (the trace of affine space needs it), and H5 imports it together with the curve case".

### Not done, and why
- **Huber is not read here.** Huber's book is not publicly readable. Two things therefore rest on the verifier's reading and are not re-read here:
  - the scope sentence;
  - the locators 5.7.2, 7.2.2 and 7.5.1–7.5.3.

  Every statement in the new stage comes from Berkovich, Zavyalov and ECD, at the locators given.
- **Parts of Huber's scope have no public proof.** Maps that are not partially proper and higher-rank plus rings stay gaps, together with the H3 packet's §8.3 gap.
- **No proof is claimed.** Hub96 3.8.1's characteristic-0 route (SGA 4 XVI 4 with 3.9.1(b)) is unaffected.

## Common points for the Habiro findings (/6, /27–/35, /40)

- **Where the edges live.** The campaign READMEs of HQ, HR, PR, CR, DD and RT have no "**Dependencies:**" line. Their stage edges are the `requires` lists and `stageEdges` records of `data/atlas.json`, with the matching `consumers` lists. "Add A → B" below means: add A to B's `requires`, add the record `{"source": A, "target": B}` to `stageEdges`, and add B to A's `consumers`. A removal is the reverse, and is for the maintainer. Additions may instead be made as restructuring links.
- **Descriptions are a snapshot.** Each campaign stage's `description` in `data/atlas.json` is the README text between its `contextStartLine` and `contextEndLine`. Every README replacement below is to be made, in the same words, in the `description` of each stage whose range contains it. For RT.4 that means four stages, which share the section: RT.4, RT.4:topological, RT.4:q-Hodge and RT.4:Habiro-comparison. The HQ README has one line per paragraph, and the edits below keep its line count. So no line range moves, except the HQ.5/HQ.5-trace ranges that /40 resets.
- **Three batches.**
  - *Now:* /6 (text and locators), /30 (text), /31, /32, /33, /34, /35, /40, and the q-connection part of /29.
  - *Q, atomically with the promotion of the draft QWittVectors:* /27, /28, the framed-Habiro and twisted-q-de-Rham parts of /29, and the QW.1 part of /32. At 1b1aeb19 no queue job exists for QWittVectors, so its promotion is a maintainer action.
  - *H, with the draft AnalyticHabiroStack:* the HS.3 → HQ.6 edge of /30. That edge is already an RS-10~2 link.
- **The packet.** `research/blueprint/packets/HabiroCohomologyFoundations--HQ.1.json` covers HQ.1–HQ.7, including HQ.5-trace. Its review verdict is needs_changes (2026-09-25), but only because its roadmap document must be regenerated. It already carries much of what these findings ask for. Each section says what it carries. The HQ.8 packet is not affected.
- **RS-10~2 (review REV-RS-10~2 pending).**
  - Consistent with this report: its links HR.1 → HQ.1, HQ.5-trace → HQ.7 and HS.3 → HQ.6, and its QW links.
  - In conflict with this report:
    - it keeps HQ.4 → HQ.3, CR.4 → HQ.4 and HR.4 → HQ.4 (/27, /29);
    - it keeps HQ.6 → HQ.7 (/33);
    - its HQ.5 `keeps` names "Meyer–Wagner Lemma 3.17" (/6);
    - its links QW.6 → HQ.1 and QW.6 → HQ.2 should come from the new prefix (/28).
- **Graph check.** The union graph was checked for cycles. It contains:
  - the assembled atlas at 1b1aeb19;
  - the stage `requires` of the five draft Habiro roadmaps (QWittVectors, SolidAnalyticRings, AnalyticStacks, RingStacksAndTransmutation, AnalyticHabiroStack);
  - all 133 RS-10~2 links;
  - the requirement changes of PLAN-HABIRO §6 for HQ, HR, HB and KU-habiroring, and the new HQ.9;
  - every edge added below, including the new prefix `QWittVectors:QW.6:framings`;
  - the removals HQ.4 → HQ.3, CR.4 → HQ.4, HR.4 → HQ.4, HQ.6 → HQ.7 and DD.6 → HQ.2.

  Result: 7993 edges on 2505 nodes, acyclic (a depth-first search and a topological sort agree). With RS-10~2's order instead (no HQ.3 → HQ.4, no removals) the union is also acyclic. Every edge added inside the atlas was also checked with the cycle test; the results are quoted in its section.

## /6 (high, missing): Theorem 4.22 split by case, with both proof inputs owned

### What the verifier corrected
- Case (b) of Wagner v2 Theorem 4.22 goes to HQ.5-trace, as PLAN-HABIRO §6.5 already decides. This is partly an unapplied accepted decision, not a missing owner.
- Hypothesis (b) is a lift of **R_∞ := (R⊗_A A_∞)^∧_p**, not of R. The standing hypotheses are those of pp. 62–63: A is a p-completely perfectly covered δ-ring, and R is p-torsion-free and quasi-lci with R/p relatively semiperfect over A.
- The proof of (b) is "a special case of [Wag25, Theorem 4.17]", the ku paper (p. 66). That theorem (p. 45) includes p = 2, through Theorems 4.14 and 4.16 (pp. 43–45). Live RT.4:q-Hodge states only the 2-inverted E₂ theorem.
  - Add a separately scoped E₁ target to RT.4:q-Hodge, and import it into HQ.5-trace.
  - Keep the stronger E₂ theorem separate.
- For (a), Meyer–Wagner v4 Lemma 3.16 (pp. 38–40) constructs the divided-power lifts. Lemma 3.17 (p. 40) is its auxiliary torsion-freeness lemma. Correct the locator in the plan as well as in the live stage.
- Record the 3.16/3.17 numbering as a version-specific discrepancy, not as a new mathematical error.

### State on main (1b1aeb19)
- **The live HQ text, unchanged since the verification.**
  - HQ README, HQ.5 second paragraph (line 41): "Theorem 4.22 further requires either a regular sequence of powers x_i^(a_i) with a_i≥2, or a spherical E₁-lift; the latter gives existence without a canonical choice of that lift."
  - HQ.5-trace paragraph (line 45): "Any separate p=2/E₁ refinement must carry its additional even-resolution assumptions; it is not this theorem with hypotheses removed."
  - Both paragraphs sit in the one section that is the `description` of both HQ.5 and HQ.5-trace (see /40).
- **RT.4:q-Hodge.** RefinedTraceMethods README, line 39: "The odd-prime restriction in the underlying Devalapurkar comparison must not be erased; an E₁/p=2 variant requires the source's separate even-resolution hypothesis." There is no E₁ target. The blueprint job whose scope contains this stage, BP-RefinedTraceMethods--RT.1, is pending.
- **PLAN-HABIRO** names "Meyer–Wagner Lemma 3.17" in three places: §1.4 (bullet "S. Meyer, F. Wagner, *Derived q-Hodge complexes and refined TC⁻*, Lemma 3.17"), §6.5 (HQ.5 row) and §8 item 29. It puts the reduction "on p. 65". The proof of Theorem 4.22 begins on p. 65, and both citations, of ku 4.17 and of MW Lemma 3.17, are on p. 66.
- **Sources as read.** The arXiv API gives the Meyer–Wagner title as "q-Hodge complexes and refined TC⁻" (v4, updated 2025-10-08). Wagner v2 cites "[MW24] Samuel Meyer and Ferdinand Wagner, Derived q-Hodge complexes and refined TC−, 2024. arXiv: 2410.23115", with no version.
- **The HQ.1 packet already implements the split:**
  - HQ.5/when-the-naive-filtration-deforms-the-hodge-filtration: case (a), with the lifts from "Lemma 3.16 in arXiv v4";
  - HQ.5-trace/the-spherical-e1-lift-case-of-the-well-behavedness-theorem: case (b), with the lift of R_∞;
  - HQ.5-trace/the-one-disc-refinement-and-the-prime-two: ku 4.14, 4.16 and 4.17;
  - source issue E302 (kind misprint, "affects": "nothing"; correction "[MW24, Lemma 3.16]");
  - a request to RT.4:q-Hodge for ku Theorems 1.2, 4.27, 4.8, 4.14 and 4.17.
- **RS-10~2** moves 4.22(b) to HQ.5-trace (owners entry "The spherical E1-lift case of Wagner Theorem 4.22(b)"), which agrees with this fix. It has two defects here:
  - Its HQ.5 `keeps` reads "keep Meyer–Wagner Lemma 3.17 as the named proof input"; in v4 this is Lemma 3.16.
  - It gives RT.4:q-Hodge no E₁ target.

### Fix
1. **HQ README and the HQ.5 / HQ.5-trace descriptions (batch now).** These are sentence replacements. /40, edit 1, gives the whole section after all edits.
   - Line 41: replace "Theorem 4.22 further requires either a regular sequence of powers x_i^(a_i) with a_i≥2, or a spherical E₁-lift; the latter gives existence without a canonical choice of that lift." with:
     > HQ.5 owns case (a) of Wagner v2 Theorem 4.22 (pp. 62–63). Let A be a p-completely perfectly covered δ-ring and R a p-torsion-free, p-quasi-lci A-algebra (in the sense of 4.17) with R/p relatively semiperfect over A, and suppose R≅B/J is a perfect-regular presentation with J generated by a Koszul-regular sequence of higher powers (x_1^{α_1},…,x_r^{α_r}), every α_i≥2 (no restriction at p=2). Then the naive filtration of Construction 4.21 is a q-deformation of the Hodge filtration: fil^⋆_{q-Hdg}q-dR_{R/A}/(q−1)≃fil^⋆_{Hdg}dR_{R/A}, with q−1 in filtration degree 1. The surjectivity half reduces to the universal case A=ℤ_p{x}, R=ℤ_p{x}/x^α with α≥2 (p. 66). There the lifts of the iterated divided powers γ^{(n)}(x^α) into fil^{p^n}_{q-Hdg} are Meyer–Wagner Lemma 3.16 (arXiv:2410.23115v4, pp. 38–40), which HQ.5 owns; Lemma 3.17 there (p. 40) is the auxiliary p-torsion-freeness lemma used in its proof. Wagner v2 cites the lifts as "[MW24, Lemma 3.17]" without a version; this is a numbering difference between versions, not a mathematical error. Case (b) is HQ.5-trace's.
   - Line 45: replace "Any separate p=2/E₁ refinement must carry its additional even-resolution assumptions; it is not this theorem with hypotheses removed." with:
     > Separately, import RT.4:q-Hodge's E₁ target: ku Theorem 4.17, with Theorems 4.14 and 4.16, p=2 included. Its resolution and identity-cover hypotheses replace the E₂-lift; it is not the E₂ theorem with hypotheses removed. With it prove Wagner v2 Theorem 4.22(b) (pp. 62–63, proof pp. 65–66). Let A be a p-completely perfectly covered δ-ring and R a p-torsion-free, p-quasi-lci A-algebra with R/p relatively semiperfect over A. If **R_∞:=(R⊗_A A_∞)^∧_p** (not R) lifts to a p-complete connective E₁-ring spectrum S_{R_∞} with R_∞≃S_{R_∞}⊗_{𝕊_p}ℤ_p, then fil^⋆_{q-Hdg}q-dR_{R/A}/(q−1)≃fil^⋆_{Hdg}dR_{R/A}. The proof reduces by flat base change (Lemmas 4.26–4.27) to A perfect and then to A=ℤ_p, where case (b) is a special case of ku Theorem 4.17. The lift is existence data only: the filtration is HQ.5's naive filtration and does not depend on it. For p>2 a presentation as in (a) yields such a lift (Remark 4.23); at p=2 this holds only when every α_i is even and ≥4, so HQ.5's case (a) is not subsumed.
2. **RT.4:q-Hodge (RefinedTraceMethods README line 39, and the four RT.4 descriptions).** Replace "The odd-prime restriction in the underlying Devalapurkar comparison must not be erased; an E₁/p=2 variant requires the source's separate even-resolution hypothesis." with:
   > The odd-prime restriction in the underlying Devalapurkar comparison must not be erased. **Separately scoped E₁ target** (ku paper arXiv:2510.06057v1, §§4.2–4.3), exported to Habiro HQ.5-trace.
   >
   > *Setting.* Fix a prime p, **p=2 allowed**, and a p-complete, p-completely perfectly covered δ-ring A with the p-complete spherical lift S_A of 3.1(tCp) (p. 24).
   >
   > *Ad-hoc filtration.* Let R be a p-complete A-algebra with bounded p^∞-torsion, p-quasi-lci over A, satisfying 3.2(E₁): R is p-torsion-free and has a p-quasi-syntomic cover R→R_∞ with R_∞/p relatively semiperfect over A, and the p-completed Čech nerve R→R^•_∞ lifts to an augmented cosimplicial diagram of p-complete connective E₁-algebras in S_A-modules. Construct from this resolution the ad-hoc even filtration, and prove the conclusions of Theorem 4.8 at every prime. At p=2 this is Theorem 4.14 (pp. 43–44, whose proof in the source is a sketch). It uses Theorem 4.16: for all p, an S¹-equivariant E₁-equivalence THH(ℤ_p[ζ_p]/𝕊_p⟦q−1⟧)^∧_p≃τ_{≥0}(ku^{tC_p}), compatible with THH(𝔽_p)≃τ_{≥0}(ℤ_p^{tC_p}). The source attributes 4.16 to Nikolaus (unpublished) and gives an argument; record that status.
   >
   > *Explicit description.* For the identity cover (R/p relatively semiperfect over A, with a p-complete connective E₁-lift S_R in Alg_{E₁}(Mod_{S_A})), prove Theorem 4.17 (p. 45): the q-Hodge filtration is the 1-categorical preimage of the combined Hodge and (q−1)-adic filtration under q-dR_{R/A}→dR_{R/A}[1/p]⟦q−1⟧. Hence it is independent of the E₁-lift and canonically a filtered E∞-algebra over (q−1)^⋆A⟦q−1⟧.
   >
   > This target is not the E₂ theorem above with hypotheses removed.
3. **PLAN-HABIRO (`research/blueprint/plans/HABIRO.md`), locators only.**
   - §1.4: replace "S. Meyer, F. Wagner, *Derived q-Hodge complexes and refined TC⁻*, Lemma 3.17:" with:
     > S. Meyer, F. Wagner, *q-Hodge complexes and refined TC⁻* (arXiv:2410.23115v4), Lemma 3.16 (pp. 38–40; Wagner v2 cites it as "[MW24, Lemma 3.17]", and 3.17 in v4 is the auxiliary p-torsion-freeness lemma, p. 40):
   - In the same bullet, replace "(p. 65)" with "(pp. 65–66)".
   - §6.5, HQ.5 row: replace "Meyer–Wagner Lemma 3.17" (twice) with "Meyer–Wagner Lemma 3.16 (v4)", and "(Wagner v2, p. 65)" with "(Wagner v2, pp. 65–66)".
   - §8 item 29: replace "is reduced on p. 65" with "is reduced on pp. 65–66". Replace "from Meyer–Wagner Lemma 3.17" with "from Meyer–Wagner Lemma 3.16 (v4; cited by Wagner v2 as 3.17)". Replace "HQ.5 therefore owns Lemma 3.17", which is wrapped over two lines, with "HQ.5 therefore owns Lemma 3.16".
   - REV-PLAN-HABIRO (T2, S5 and question 10) uses the same locators. It is a review record and is left as it is; the plan's text is what the blueprint jobs follow.
4. **HQ README, line 7 (source list).** After "[ku and q-de Rham](https://arxiv.org/abs/2510.06057v1)," insert:
   > Meyer–Wagner, [q-Hodge complexes and refined TC⁻, v4](https://arxiv.org/abs/2410.23115v4) (Lemma 3.16 for HQ.5),
5. **HQ.1 packet, request to RefinedTraceMethods:RT.4:q-Hodge.** Append to `need`:
   > and Theorem 4.16 (for all p an S¹-equivariant E₁-equivalence THH(ℤ_p[ζ_p]/𝕊_p⟦q−1⟧)^∧_p ≃ τ_{≥0}(ku^{tC_p}), attributed to Nikolaus, unpublished, with the argument given on pp. 43–44), which Theorem 4.14 uses at p = 2.
6. **For REV-RS-10~2** (`research/blueprint/restructure/RS-10.result.json`), `layers."HabiroCohomologyFoundations:HQ.5".keeps`: replace "keep Meyer–Wagner Lemma 3.17 as the named proof input requiring source verification at blueprint time" with "keep Meyer–Wagner Lemma 3.16 (arXiv:2410.23115v4; cited by Wagner v2 as 3.17) as the named proof input".
   - Make the same correction in `RS-10.md`: in the HQ.5 row of the layer table, in the Theorem 4.22 source bullet ("the proof of 4.22(a) names Meyer–Wagner Lemma 3.17 on that same page": add that this is Lemma 3.16 of v4), and in item 4 of the open questions.
   - RS-10~2 is this session's work. A follow-up pull request with exactly these three changes (#4608) was closed unmerged: the intake binds `RS-10.result.json` to round 1 of RS-10, which is done. REV-RS-10~2, whose outputs include `RS-10.result.json`, can apply them.

### Not done, and why
- **No new source issue.** E302 already records the discrepancy as a misprint that affects nothing. No mathematical error is claimed.
- **V5A4 items.** The plan also puts V5A4 Theorem 1.7, Conjecture 6.4, Theorem 6.5, Examples 6.6–6.7 and Remarks 6.8–6.9 in HQ.5-trace. They are not restated here: the notes are not public and were not read.
- **Open proofs.** The proofs of ku 4.14 and 4.17 stay RT.4:q-Hodge's (BP-RefinedTraceMethods--RT.1). The packet gap "The trace-theoretic construction was imported, not decomposed" stays open. So does its gap on the structured-ring-spectra inputs of Remark 4.23 (Burklund).

## /7 (medium, missing): FF.2 owns Lang–Weil uniform in families and Chebotarev in families with the constant-field coset; the HW16 and BN23 routes point to FF.2

### What the verifier corrected

- The accepted Browning–Sawin route gives FF.2 only a fixed-variety Lang–Weil asymptotic over extension fields. The rejected HW16 and BN23 routes supply no usable plan.
- HW16 v4 p. 44 needs two things. The first is rational points on the fibres of a good model, uniformly. The second is Ekedahl's Lemma 1.2, which realises the permitted geometric Galois elements after the specified splitting of constants. WC.5's smooth-projective contract replaces neither.
- Extend FF.2 to estimates that are uniform in bounded embedding and boundary data, and to the geometric Chebotarev application, with FA.5's constant-field conventions. BN23/87 imports the fixed-variety case; HW16 needs the model-uniform one.
- The original Lang–Weil and Ekedahl proofs remain explicit source-closure tasks.
- Do not demand every arithmetic conjugacy class at an arbitrary residue degree.

### State on main (1b1aeb19)

**The FF.2 stage text is unchanged.** It does not mention Lang–Weil: "State polynomial/rational exponential-sum bounds via curves and l-adic trace functions. … do not treat H_c^2 as automatically zero." Its inputs are "`FiniteFieldsAndCharacterSums:FF.1`, `WeilConjectures:WC.3`, `DeligneWeightsAndPurity:DWP.7`". RS-03 leaves FF.2 as it is and makes it the owner of the "General Weil/Deligne finite-field sum estimate handoff".

**The FF packet has changed since the verification.** `research/blueprint/packets/FiniteFieldsAndCharacterSums.json` was committed on 2026-09-25 in #2910. Its status is partial, `BP-FiniteFieldsAndCharacterSums` is pending (claimed, #1029) and its review has not been done. It now has:
- `FF.2/lang-weil-estimate`: V geometrically irreducible, separated of finite type, of dimension e, with |#V(F_{q^r}) − q^{re}| ≤ C_V q^{r(e−1/2)} and C_V = Σ_{i<2e} dim H^i_c;
- `FF.2/uniform-lang-weil-estimate`: Ghorpade–Lachaud Theorem 11.1, for projective V of degree d cut out by m equations of degree ≤ δ, with an affine variant. Its gap is Katz's Betti-number bound, not read;
- `FF.2/dimension-from-point-counts`;
- `FF.2/geometric-chebotarev`. Its only hypothesis is "Y₀ geometrically irreducible, so the geometric and arithmetic monodromy groups coincide (no constant-field coset condition)".

FF.2's coverage `remaining` already names the open work: "Ekedahl's Lemma 1.2 (1990, not public) was not read; add the variant for Y₀ geometrically connected only over a constant extension … as RT-AREA-etale/7 asks". So the fixed-variety form is planned, and neither the family-uniform form nor the coset variant is.

**HW16 (overall `revise`, so its routes are inactive).**
- Route 4 (`routes[3]`) is a source route to `WeilConjectures:WC.5` with items /24 and /88. Its review is `reject`: "WC.5 states smooth-projective cohomological bounds, while24/88 need uniform quasi-projective/model estimates and a constant-field Frobenius-coset condition".
- Both items are `missing`.

**BN23 (overall `revise`).**
- Route 2 (`routes[1]`) goes to WC.5 with item /87. Its review is `reject`: "Identify or extend the genuine general owner before accepting this route".
- /87 is `missing`.

**BS20.** `PAPER-BROWNING-SAWIN-20/langweil` is routed to FF.2 by accepted route 2, and BS20 is accept, so this route is live.

**WC.5 is for smooth projective varieties only.** Its text says "For a smooth projective geometrically connected d-dimensional variety, derive the all-extension estimate". RS-17's owner entry for WC.5 is "Higher-dimensional all-power point-count error inequalities and recurrence normalization" (formerly DWP.10). Neither covers arbitrary varieties or families.

**Libraries.** Nothing. The only Chebotarev is number-field (`NumberField.Chebotarev.*`, Tau Ceti).

**How HW16 v4 uses the two results.** Every use is "after enlarging S", that is, for all closed fibres of a model over O_S outside a finite set of places:
- Lemma 3.2 (p. 11): "a consequence of the moving lemma …, of the Lang–Weil–Nisnevich estimates (cf. [LW54], [Nis54]) and of Hensel's lemma";
- §5.3 (p. 17): "the fiber of f above any closed point of C⁰ contains a rational point";
- Theorem 6.2 (p. 21) and Theorem 9.22 (p. 47): X_h(k_v) ≠ ∅ for all v outside S;
- the proof of Theorem 9.17 (p. 44): "by the Lang–Weil–Nisnevich bounds [LW54] [Nis54] and by a geometric version of Chebotarev's density theorem [Eke90, Lemma 1.2], that the following statements hold". The fourth statement is: for i > n and w a place of k_i splitting completely in L_i, "any element of H_i can be realised as the Frobenius automorphism of the irreducible abelian étale cover E_i → Y⁰_i at some rational point of the fiber of Y⁰_i → ẽ_{m_i} above the closed point corresponding to w". Here H_i = Gal(E_i/k(Y_i)K_i) and K_i = L_i is the algebraic closure of k_i in E_i (p. 43). The models are smooth over O_S.

### Fix

**7.1 `content/campaign/FiniteFieldsAndCharacterSums/README.md`, FF.2.**
- After "do not treat H_c^2 as automatically zero." add:
  > Own Lang–Weil: the fixed-variety estimate over all finite extensions for geometrically irreducible separated finite-type varieties (the form Browning–Sawin and Bright–Newton use); its uniform version over the closed fibres of a model of finite type over ℤ[1/ℓ] (Katz–Sarnak 9.0.15.2 with Lemma 9.3.3), keeping the explicit projective bound in terms of embedding data as a separate node; and Chebotarev for finite étale Galois covers in the same families, with FunctionFieldArithmetic FA.5's constant-field convention: the Frobenius of a rational point of the fibre over w lies in the coset of the geometric group fixed by w's Frobenius on the constants, and only classes in that coset are asserted. WeilConjectures WC.5's smooth-projective bounds are a different theorem. The original Lang–Weil and Ekedahl proofs remain source-closure tasks.
- Inputs line: "**Inputs.** `FiniteFieldsAndCharacterSums:FF.1`, `WeilConjectures:WC.3`, `DeligneWeightsAndPurity:DWP.7`" → the same followed by ", `FunctionFieldArithmetic:FA.5`". Add `FunctionFieldArithmetic:FA.5` to FF.2's `requires` in `data/atlas.json` too. Cycle check FA.5 → FF.2: acyclic. FA.5 is already an ancestor through DWP.3 → DWP.4 → FF.2.

**7.2 `research/blueprint/packets/FiniteFieldsAndCharacterSums.json`.** For the blueprint job, or the maintainer.

Add two nodes under FF.2.

(A) **`FiniteFieldsAndCharacterSums:FF.2/lang-weil-in-families`** (theorem).
- Statement: Let ℓ be a prime, S a separated scheme of finite type over ℤ[1/ℓ], and X → S smooth, with all geometric fibres connected of dimension d. There is A(X/S) such that for every finite field k, every s ∈ S(k) and every finite extension E/k:
  - Σ_{i<2d} h^i_c(X_s ⊗ k̄, Q_ℓ) ≤ A(X/S);
  - |#X_s(E) − |E|^d| ≤ A(X/S)·|E|^{d−1/2}.

  In particular X_s(k) ≠ ∅ once |k|^{1/2} > A(X/S).
- Consequence, in HW16's form: for X → S of finite type over ℤ, surjective, smooth, with geometrically connected fibres, every closed fibre outside a finite set of residue characteristics has a smooth rational point. Take two primes ℓ₁ ≠ ℓ₂ and apply the statement over S[1/ℓ₁] and S[1/ℓ₂].
- Proof:
  - Lemma 9.3.3: constructibility of R^i f_!Q_ℓ and proper base change bound the fibre Betti numbers. Request both from SchemeAndStackFoundations SF.2, as the packet's other Rf_! requests are.
  - 9.0.15.2: the trace formula, H^{2d}_c = Q_ℓ(−d) and DWP.7's bound "H^i_c mixed of weight ≤ i" give the estimate.
  - For geometrically irreducible, not necessarily smooth, fibres, the same bound follows from `FF.2/lang-weil-estimate`'s constant together with the constructibility bound. This is a proof step to check, not a quotation.
- Prerequisites: `FF.2/lang-weil-estimate`, `DeligneWeightsAndPurity:DWP.7`, SF.2 (request).
- Sources:
  - Katz–Sarnak, 9.0.15.2, p. 270, excerpt "we get the Lang-Weil estimate [Lang-Weil]";
  - Katz–Sarnak, Lemma 9.3.3, p. 280, excerpt "There exists an integer A(X/S) such that for all finite fields k, and all k-valued points s in S(k), we have the inequality", with the proof "This is immediate from the constructibility of the higher direct images with compact support";
  - HW16 v4, p. 44, as the consumer: "by the Lang–Weil–Nisnevich bounds [LW54] [Nis54]".
- Acceptance:
  - A^d over ℤ: A = 0.
  - An elliptic curve over ℤ[1/N]: A = 3, from h⁰ = 1 and h¹ = 2; compare the Hasse bound 2√q, and note that A bounds the whole lower cohomology.
  - The punctured conic x² + y² = 0, (x, y) ≠ (0, 0), over ℤ[1/2]. It is smooth, but at a prime p ≡ 3 mod 4 its fibre is irreducible and not geometrically connected (two conjugate punctured lines), and it has no F_p-point where the bound would promise about p. This shows the geometric connectedness hypothesis is needed.

(B) **`FiniteFieldsAndCharacterSums:FF.2/chebotarev-in-families`** (theorem).
- Statement: Let B be of finite type over ℤ[1/ℓ], Y → B smooth with geometrically connected fibres of dimension r, and π : E → Y a finite étale Galois cover with group G acting over Y. Let K be the constant field of E over the base, with the finite Galois extension it defines, and H ⊆ G the geometric group, the subgroup acting trivially on the constants. For a closed point w of B, let g_w H ∈ G/H be the Frobenius of w on the constants, in FA.5's convention. Then:
  1. For every y ∈ Y_w(κ(w)), Frob_y lies in the coset g_w H.
  2. For every union C of G-conjugacy classes contained in g_w H, #{y ∈ Y_w(κ(w)) : Frob_y ⊆ C} = (|C|/|H|)·|κ(w)|^r + O(|κ(w)|^{r−1/2}), with the O-constant independent of w.
  3. In particular, every element of g_w H is a Frobenius at some rational point of Y_w once |κ(w)| is large. At w splitting completely in K, g_w H = H, which is HW16's fourth statement.
- Nothing is asserted about classes outside g_w H.
- Proof route (a plan to check, not a quotation): untwist as in `FF.2/geometric-chebotarev`, component by component, and apply (A) to the twisted fibres. Their geometric fibres, and hence their Betti numbers, are those of E, so the constant is uniform in w.
- Prerequisites: (A), `FF.2/geometric-chebotarev`, `FunctionFieldArithmetic:FA.5` (constant-field convention), SF.1 (twisting, already requested).
- Sources: HW16 v4, proof of Theorem 9.17, pp. 43–44, as the consumer contract, with the fourth statement quoted above. Ekedahl's Lemma 1.2 (Progr. Math. 91 (1990), 241–249) was not read.
- Acceptance:
  - G = H trivial: this is (A).
  - A constant-field extension, E = Y ⊗ F_{q^2} over Y, with G = ℤ/2 and H = 1. Frobenius at every rational point of the fibre over w is the image of w's Frobenius, and the other class never occurs. This is the degree-congruence test of FA.5.
  - HW16's case: G abelian and w split in K.

Also update the packet in four places:
- **Gap.** Add: "Ekedahl, Lemma 1.2 not read (not public): the uniform twisted Chebotarev of `FF.2/chebotarev-in-families` is planned from (A) and untwisting; a source for the uniform count must be read before the node can close." Keep the existing gap on Ghorpade–Lachaud and Katz's Betti bound.
- **Coverage.** Replace FF.2's `remaining` entry "Geometric Chebotarev (FF.2/geometric-chebotarev): Ekedahl's Lemma 1.2 … as RT-AREA-etale/7 asks." with: "FF.2/chebotarev-in-families (constant-field coset, uniform in a family) is planned from FF.2/lang-weil-in-families; its source gap (Ekedahl, Lemma 1.2) remains."
- **`sources`.** Add Katz–Sarnak (KATZ-SARNAK-99, https://web.math.princeton.edu/~nmk/RMFEM.pdf, pp. 269–270 and 279–280 read) and HW16 v4 (https://arxiv.org/pdf/1409.0993v4, pp. 11, 17, 21, 42–45, 47, 51, 53 read).
- **`requests`.** Add FA.5, for the constant-field coset convention of finite-cover Chebotarev (RS-17's owner entry 13).

**7.3 `research/blueprint/papers/PAPER-HARPAZ-WITTENBERG-16.result.json`.**
- Route 4 (`routes[3]`): set `roadmap` "WeilConjectures" → "FiniteFieldsAndCharacterSums" and `stages` ["WeilConjectures:WC.5"] → ["FiniteFieldsAndCharacterSums:FF.2"]. Replace `reason` with:
  > FF.2 owns Lang–Weil (the accepted Browning–Sawin route 2) and plans the fixed-variety estimate, Ghorpade–Lachaud's explicit bound and geometric Chebotarev. Items 24 and 88 need its extension by FIX-RT-AREA-etale/7: the Lang–Weil bound uniform over the closed fibres of a smooth model over O_S (Katz–Sarnak 9.0.15.2 with Lemma 9.3.3; node FF.2/lang-weil-in-families), and Chebotarev in the same families realising each element of the geometric group H_i at a rational point of the fibre over a place w split in the constant field, with FA.5's constant-field coset (node FF.2/chebotarev-in-families). WC.5's smooth-projective contract supplies neither. Ekedahl's Lemma 1.2 is not public and remains a source-closure task.
- Item /24 `note`: replace with "Planned by FiniteFieldsAndCharacterSums FF.2 (FF.2/lang-weil-in-families, from Katz–Sarnak 9.0.15.2 and Lemma 9.3.3); route 4. The original Lang–Weil and Nisnevich papers were not read."
- Item /88 `note`: replace with "Planned by FF.2/chebotarev-in-families with FA.5's constant-field coset; route 4. Only the coset fixed by w's Frobenius on the constants is realised, as HW16 p. 44 says. Ekedahl's Lemma 1.2 was not read."
- The route 4 review verdict stays `reject` until HW16's next review round re-checks the re-pointed route. HW16 is `revise`, so nothing enters the queue meanwhile.

**7.4 `research/blueprint/papers/PAPER-BRIGHT-NEWTON-23.result.json`.**
- Route 2 (`routes[1]`): set `roadmap` → "FiniteFieldsAndCharacterSums" and `stages` → ["FiniteFieldsAndCharacterSums:FF.2"]. Replace `reason` with:
  > Lemmas 9.2 and 9.5 need only the fixed-variety Lang–Weil estimate over all large finite extensions, for geometrically irreducible varieties including open loci and torsors. FF.2 owns it (FF.2/lang-weil-estimate, planned under the accepted Browning–Sawin route 2).
- Item /87 `note`: replace with "The fixed-variety Lang–Weil estimate; planned at FF.2 (FF.2/lang-weil-estimate). Route 2."
- The review stays `reject` until BN23's next round; BN23 is `revise`.

**7.5 `content/campaign/WeilConjectures/README.md`, WC.5 (a boundary note, with no edge).** After "In dimension one identify b_1=2g using the actual curve/Jacobian cohomology supplier, obtaining |N_r−(q^r+1)|≤2g q^{r/2}." add:
> Lang–Weil estimates for arbitrary geometrically irreducible varieties, their uniform versions in families and geometric Chebotarev are FiniteFieldsAndCharacterSums FF.2's, not WC.5's.

This departs from the red team's fix, which asked WC.5 to "import" these counts from FF.2. WC.5 does not use them, so a boundary note is enough.

### Not done, and why

- **The original sources were not read.** Lang–Weil (Amer. J. Math. 76 (1954), 819–827, doi:10.2307/2372655, JSTOR), Nisnevič (Dokl. 1954) and Ekedahl (1990) are not public.
  - (A) is sourced to Katz–Sarnak's cohomological proof, which covers HW16's smooth models.
  - The explicit-constant form (Lang–Weil's Theorem 1, Ghorpade–Lachaud 11.1) keeps its gap.
  - (B)'s uniform count keeps the Ekedahl gap.
- **The review verdicts are left alone.** Re-checking the HW16 and BN23 routes is for their next review rounds.
- **BS20/langweil is unchanged.** It is already live through its accepted route and planned by `FF.2/lang-weil-estimate`.

## /8 (medium, duplicate): paper supplier fields are brought to RS-17's owners

### What the verifier corrected

- Update the supplier fields to RS-17's canonical owners:
  - curve RH → DWP.1;
  - divisor-series rationality → FA.5, with WC.1 as comparison;
  - finite-field Chebotarev → FA.5, with DWP.3's ℓ-adic passage;
  - proper-smooth and sheaf-coefficient purity → DWP.7, with DWP.6 for the curve intermediate.
- Keep the application adapters. SKINNER-20/71 keeps AutomorphicGaloisRepresentations:R19.1 for Eichler–Shimura.
- ST17 is `revise`, so its accepted routes are not active. CARO-PASTEN-23 and LI-LIU-21 have no review. Do not describe these records as accepted jobs.

### State on main (1b1aeb19)

The seven items are unchanged since the verification. The RS-17 owner entries, in `data/restructure/RS-17.result.json` `owners[]`, are:

| Index | Target | Owner | Formerly |
|---|---|---|---|
| 1 | curve and abelian Weil estimate | DWP.1 | R34.2, WC.5, WC.5:surface-alternative |
| 13 | finite-cover function-field Chebotarev | FA.5 | DWP.3 ("DWP.3 adds compact l-adic exceptional-set passage") |
| 21 | Weil II 3.2.3 | DWP.6 | — |
| 22 | proper-smooth purity | DWP.7 | R34.5, WC.6, FF.2 |
| 35 | zeta object | TraceFormula:13 ("FA.5 retains its independent Riemann–Roch and Artin ramification route") | — |
| 36 | WC-specific zeta comparison | WC.1 | — |

Current values and verdicts:

| Item | Status, planned | Paper verdict |
|---|---|---|
| ST17/curve-rh | planned, ["WeilConjectures:WC.5"]; also in route 10 → WC.5 | revise |
| ST17/curve-zeta | planned, ["WeilConjectures:WC.1"]; also in route 9 → WC.1, WC.2 | revise |
| SKINNER-20/71 | planned, ["AutomorphicGaloisRepresentations:R19.1", "WeilConjectures:WC.5"] | accept |
| CARO-PASTEN-23/curve-weil | planned, ["WeilConjectures:WC.5"]; also in route 9 | no review |
| KISIN-ZHOU-25/P16 | planned, ["DeligneWeightsAndPurity:DWP.3"]; `owner` DWP.3 | accept |
| LI-LIU-21/73 | planned, ["WeightsInEtaleCohomology:R34.5"] | no review |
| LI-LIU-22/82 | planned, ["WeightsInEtaleCohomology:R34.5"] | accept |
| FRESAN-SABBAH-YU-22/5 | planned, ["DeligneWeightsAndPurity:DWP.4", "WeightsInEtaleCohomology:R34.5"] | accept |

ST17 lists 15 items as both `planned` and routed (routes 9 and 10 among them). This is an older inconsistency, outside this finding.

### Fix

Field edits in `research/blueprint/papers/`:

1. **`PAPER-SHENDE-TSIMERMAN-17.result.json`**
   - Route 10 (`routes[9]`): `roadmap` "WeilConjectures" → "DeligneWeightsAndPurity"; `stages` ["WeilConjectures:WC.5"] → ["DeligneWeightsAndPurity:DWP.1"]. `reason` becomes:
     > RS-17 makes DWP.1 the single owner of the curve all-conjugates Weil estimate and the all-extension curve bound; WC.5 imports it as the b₁ = 2g compatibility case.
   - Item curve-rh: `planned` → ["DeligneWeightsAndPurity:DWP.1"]. `note` "WC.5 consumes the RH supplier; no pinned general-genus implementation was found." → "DWP.1 owns the curve RH and the all-extension bound (RS-17); WC.5 imports it. No pinned general-genus implementation was found."
   - Item curve-zeta: `planned` → ["FunctionFieldArithmetic:FA.5", "WeilConjectures:WC.1"]. Prefix the note with "The effective-divisor series and its Riemann–Roch rationality are FA.5's (RS-17 owner entry 35); WC.1 supplies the comparison with the point-count zeta (entry 36). ".
   - Route 9 keeps its stages, since it also carries curve-reciprocity for WC.2. Append to its `reason`: " The divisor-series rationality of curve-zeta is FA.5's; WC.1 is its comparison."
2. **`PAPER-SKINNER-20.result.json`, item /71**
   - `planned` → ["AutomorphicGaloisRepresentations:R19.1", "DeligneWeightsAndPurity:DWP.1"]. R19.1 is kept for Eichler–Shimura.
   - In `note`, replace "and the Weil bound for curves (WC.5)." with "and the Weil bound for curves and abelian varieties (DWP.1, RS-17's single owner; WC.5 imports it)."
3. **`PAPER-CARO-PASTEN-23.result.json`, item curve-weil:** `planned` → ["DeligneWeightsAndPurity:DWP.1"]. The paper has no review, so this is a record correction only. Route 9 still lists the item: remove it from route 9 when the paper is reviewed.
4. **`PAPER-KISIN-ZHOU-25.result.json`, item P16**
   - `owner` → "FunctionFieldArithmetic:FA.5".
   - `planned` → ["FunctionFieldArithmetic:FA.5", "DeligneWeightsAndPurity:DWP.3"].
   - `note` and `proofSteps[0]` ("The exact curve-specific owner is DWP.3, not number-field Chebotarev.") → "Finite-cover function-field Chebotarev with the constant-field degree congruences is FA.5's (RS-17 owner entry 13, formerly DWP.3); DWP.3 adds the compact ℓ-adic density passage. Not number-field Chebotarev."
5. **`PAPER-LI-LIU-21.result.json`, item /73:** `planned` → ["DeligneWeightsAndPurity:DWP.7"]. `note` "R34.5 plans Weil I and the required Weil II results." → "DWP.7 owns proper-smooth purity and the smooth-variety weight bounds (RS-17 owner entry 22, formerly R34.5)." The paper has no review, so this is a record correction only.
6. **`PAPER-LI-LIU-22.result.json`, item /82:** `planned` → ["DeligneWeightsAndPurity:DWP.7"]. `note` → "DWP.7 owns proper-smooth purity (RS-17 owner entry 22, formerly R34.5)."
7. **`PAPER-FRESAN-SABBAH-YU-22.result.json`, item /5:** `planned` → ["DeligneWeightsAndPurity:DWP.7", "DeligneWeightsAndPurity:DWP.6"]. `note` → "The bounds for H_c and H are Weil II 3.3.1 and 3.3.4–3.3.5 (DWP.7); the purity of the middle-extension cohomology of the lisse sheaf on G_m is Weil II 3.2.3 (DWP.6). RS-17 owner entries 21–22. The paper uses the statement as a black box."

No route or item here changes a job. ST17's routes 9 and 10 stay inactive while ST17 is `revise`, and the two unreviewed papers are inactive until reviewed.

### Not done, and why

- **R34.5 is not added back for LI-LIU or FSY.** Its RS-17 contract is the arithmetic realization of Kuga–Sato and weight-two Jacobian cohomology, which neither paper uses here.
- **ST17's other planned-and-routed items** are left to the paper's next review.

## /9 (medium, duplicate): RD.6 imports DWP.0's Weil numbers and ι-weights

### What the verifier corrected

- DWP.0 owns the coefficient-independent Weil-number and ι-weight predicates and the spectral algebra. RD.6 imports them.
- RD.6 keeps the isocrystal pointwise purity, the Fourier transform, the trace formula and the p-adic weight estimates.
- The move from ℓ-adic to p-adic coefficients does not justify a second definition.
- Add DWP.0 → RD.6 after an acyclicity check.

### State on main (1b1aeb19)

- **RD.6's text is unchanged.** `content/campaign/PadicDifferentialEquationsAndRigidCohomology/README.md`, RD.6, has "**Inputs:** `PadicDifferentialEquationsAndRigidCohomology:RD.5`." and "…, normalize q-Frobenius and Tate twists, and define algebraic/iota weights using an embedding of algebraic coefficient eigenvalues into C."
- **The atlas has no DWP.0 → RD.6 edge.** The assembled graph has no path DWP.0 → RD.6.
- **RS-17's owner entry 0 does not list RD.6.** The entry reads: target "Weil-number/iota-weight definitions and Frobenius-equivariant reciprocal-spectrum linear algebra (no eigenbasis or arithmetic semisimplicity)", owner DWP.0, `formerly` [R34.1, WC.2, DWP.5, R34.5].
- **The RD packet already imports DWP.0.** This changed after the verification: `research/blueprint/packets/PadicDifferentialEquationsAndRigidCohomology.json` was committed on 2026-09-25 (#2916) and is not promoted.
  - Node `RD.6/pointwise-iota-weights` lists `DeligneWeightsAndPurity:DWP.0` as a prerequisite and says "The same predicates for a K'-linear endomorphism T … are those of DeligneWeightsAndPurity:DWP.0".
  - A `requests` entry to DWP.0 asks for the ι-weight predicates, Weil q-numbers and the all-embeddings bridge.
  - So the defect remains only in the atlas stage, its edge and RS-17's owner record.
- **The red team's evidence is not a live route.** BINDA-KATO-VEZZANI-25 route 11, cited as "accepted", is accepted individually, but the paper is `revise`, so the route is inactive.

### Fix

1. **`content/campaign/PadicDifferentialEquationsAndRigidCohomology/README.md`, RD.6.**
   - Inputs line: "**Inputs:** `PadicDifferentialEquationsAndRigidCohomology:RD.5`." → "**Inputs:** `PadicDifferentialEquationsAndRigidCohomology:RD.5`, `DeligneWeightsAndPurity:DWP.0`."
   - Replace "Over F_q, construct the rigid Lefschetz trace formula for all finite extensions, normalize q-Frobenius and Tate twists, and define algebraic/iota weights using an embedding of algebraic coefficient eigenvalues into C." with:
     > Over F_q, construct the rigid Lefschetz trace formula for all finite extensions and normalize q-Frobenius and Tate twists. Import DeligneWeightsAndPurity:DWP.0's Weil q-numbers, ι-weight predicates and eigenvalue-weight linear algebra, with its normalization by q^a for an F_{q^a}-structure; define here only the pointwise ι-purity and ι-mixedness of overconvergent F-isocrystals, by applying those predicates to Frobenius at each closed point.
   - The rest of the paragraph stays, including "Retain algebraicity/all-conjugates restrictions where asserted."
2. **`data/atlas.json`.** Add `DeligneWeightsAndPurity:DWP.0` to RD.6's `requires`, RD.6 to DWP.0's `consumers`, and the stage edge DWP.0 → RD.6. Cycle check DWP.0 → RD.6: acyclic (no path RD.6 → DWP.0), as the verifier also found.
3. **`data/restructure/RS-17.result.json`, `owners[0]` (the DWP.0 entry).** `formerly` becomes [WeightsInEtaleCohomology:R34.1, WeilConjectures:WC.2, DeligneWeightsAndPurity:DWP.5, WeightsInEtaleCohomology:R34.5, PadicDifferentialEquationsAndRigidCohomology:RD.6]. RS-17's owner entries already name stages outside its four roadmaps: entry 38 lists RD.7 and entry 35 lists FA.5. `scripts/check_restructure.py` only requires that each former owner be an atlas stage.

### Not done, and why

- **The RD packet needs no change.** It already imports DWP.0.

## /11 (medium, duplicate): the Gysin class of a regular immersion gets one early owner

### What the verifier corrected
- **The class and the isomorphism are separate.** ILO XVI 2.3.1 (the class of any regular immersion) differs from 3.1.1 (an isomorphism when both schemes are regular).
- **EDC.3 does not cover this scope.** Its construction is for smooth pairs over a field.
- **One early owner,** with general-base exceptional pullback as a prerequisite. RelativeTraces and the purity proof import it.
- **YZ25 is revise.** This is a conflict in a proposed extension, not between two active routes.
- **No purity in a singular ambient scheme.** No class → six operations → purity cycle.

### State on main (1b1aeb19)
**YANG-ZHAO-25/T16** (route 3, RelativeTraces; the paper's overall verdict is revise; unchanged since 2026-09-23):
> "Under B for regular η:P→Q of codimension c, construct Cl_η:Λ→η!Λ(c)[2c] and the self-intersection top Chern class. Do not assert Cl is an isomorphism for a singular ambient scheme without the source purity hypotheses."

- Its prerequisite is B02, "General-base six-operation extension". Convention B: "S Noetherian".
- T17 (Lemma 2.10) uses T16.

**CESNAVICIUS-SCHOLZE-24/042:**
> "… ℋ^{2 dim R}_𝔪(−, ℤ/n) ≅ ℤ/n(−dim R) via the cycle class map …"

- No prerequisites.
- The route 4 brief names no construction of the class.

**EDC.3:** "For a smooth closed pair Z⊂X … a regular immersion into an arbitrary singular ambient scheme does not satisfy this formula merely by analogy."

**ILO XVI.** Définition 2.3.1 (printed pp. 233–234) builds Cl_i for any regular immersion of ℤ[1/n]-schemes. It uses:
- the Chern classes of §1 (on arbitrary ℤ[1/n]-schemes);
- the deformation Écl_{Y,E}(X) = Proj;
- a class in H^{2c}_Y(U, Λ(c)), that is, a map Λ → i'^!Λ(c)[2c] for the closed immersion Y → U.

So the only exceptional pullback it needs is i^! of a closed immersion.

### Fix
1. **The owner is layer AP.0 of the purity Part II.** Its text is in /2 edit 1 (CS24 route 4 brief).
   - **Prerequisite.** EDC.0's i^! for closed immersions of arbitrary schemes (/2 edit 11). This is the general-base exceptional pullback the class needs.
   - AP.0 imports no general-base constructibility or biduality. The formal compactifiable f^! is needed only in AP.3.
   - So the class does not depend on YZ25/B02. B02 sits in RelativeTraces, below the Part II, and may use purity without closing a cycle.
2. **PAPER-CESNAVICIUS-SCHOLZE-24, item 042.** Add `note`: "Uses the Gysin class of AP.0 (ILO XVI 2.3.1–2.3.4); the isomorphism is asserted only for X and Y regular (ILO XVI 3.1.1, via Proposition 3.2.3), never for a singular ambient scheme."
3. **PAPER-YANG-ZHAO-25** (for its revision, since the review says revise):
   - **Route 3 `brief`.** After "First close the Noetherian-base/coefficient six-operation and ULA-dualizability interfaces; ordinary field duality does not suffice." insert:
     > " Import the Gysin class Cl_η: Λ → η^!Λ(c)[2c] of a regular immersion and its self-intersection identity (ILO XVI 2.3.1–2.3.4; item T16) from layer AP.0 of the absolute-purity Part II (PAPER-CESNAVICIUS-SCHOLZE-24 route 4). Prove only Lemma 2.10 (T17) here. AP.0 needs only EDC.0's closed-immersion i^!, not B02, so there is no class → six operations → purity cycle."
   - **T16.** Remove it from route 3's `items`. Route it with the purity Part II (a `part-ii` route, parent EtaleDualityAndPerverseSheaves, roadmap EtaleDualityAbsolutePurityPartII, brief "adds T16 to layer AP.0 of the Part II proposed by PAPER-CESNAVICIUS-SCHOLZE-24 route 4; follow that brief"). Or mark it `planned` at AP.0's stage id once the design job has written it.
4. **EDC README, EDC.3.** After "…does not satisfy this formula merely by analogy." add:
   > " The Gysin class of an arbitrary regular immersion of ℤ[1/n]-schemes, without the isomorphism, is built in EtaleDualityAndPerverseSheaves, Part II (absolute purity), layer AP.0, which proves it agrees with this stage's class for smooth pairs."

   Acyclic: the Part II imports EDC.3.

### Not done, and why
- **The compactifiable f^! for AP.3** (SGA 4 XVIII 3.1.4) gets no separate owner here. The brief asks the design job to build it formally on L2's qcqs Rf_!. Whether L2 or EDC.1:adjoint should own it is a design decision.
- **YZ25 is revise,** so edit 3 is for its revision and is not active now.
- **Dependency:** this finding shares /2's edit 1.

## /12 (medium, missing): a sourced characteristic-zero owner for characteristic cycles, imported by the convolution roadmap

### What the verifier corrected

- Lawrence–Sawin (v5, pp. 21–22, Lemmas 3.8–3.9) use the conormal characteristic cycle of a smooth hypersurface and Krämer's clean-cycle and Gauss-map criteria, in characteristic zero. The accepted convolution brief (LAWRENCE-SAWIN-25 route 2) imports perverse sheaves but no characteristic-cycle foundation.
- YANG-ZHAO-25 route 5 is characteristic p > 0 only. Its instruction to preserve "its characteristic-zero polar-bound branch" is unsupported: that branch was SHENDE-TSIMERMAN-17 route 14, which is rejected.
- YANG-ZHAO-25 is overall **revise**, so even its accepted route 5 is inactive.
- Required, and nothing more: a sourced characteristic-zero microlocal foundation; its comparison with the complex/étale coefficient realization actually used; and an import of its conormal, index and Gauss-map interfaces into the convolution application. Krämer's convolution-specific criteria may stay in the application.
- Saito's positive-characteristic theory is not assumed to cover characteristic zero.

### State on main (1b1aeb19)

- **Nothing changed since the verification.** The result and review files of LAWRENCE-SAWIN-25, YANG-ZHAO-25 and SHENDE-TSIMERMAN-17 were last changed on 2026-09-23.
- **Verdicts.** LAWRENCE-SAWIN-25: accept (routes 1–5 accepted). YANG-ZHAO-25: revise (route 5 accepted). SHENDE-TSIMERMAN-17: revise (route 14 rejected).
- **No microlocal proposal is active.** The pending EDC Part II design, `DESIGN-EtaleDualityAndPerverseSheavesPartII` (issue #3363, available), lists two continuations: Česnavičius–Scholze's absolute purity and Yun–Zhang's ind-objects.
- **The convolution design has no characteristic-cycle import.** `DESIGN-SheafConvolutionOnAbelianVarieties` (issue #3353, available) follows LAWRENCE-SAWIN-25 route 2. Its import list is:
  > Import, never re-plan: perverse sheaves, the perverse t-structure, intermediate extensions and Verdier duality from EtaleDualityAndPerverseSheaves EDC.1 and EDC.5;

  Its cover list includes "minisculeness and simplicity of the distinguished representation through Krämer's characteristic-cycle criteria, with the modification needed when H is not invariant under inversion".
- **YANG-ZHAO-25 route 5, as it stands.**
  - The brief opens: "Extend the existing Microlocal brief, preserving its characteristic-zero polar-bound branch and its single ownership."
  - The reason reads: "Reuse the shared microlocal continuation from PAPER-SHENDE-TSIMERMAN-17. Its brief already demands a separately sourced positive-characteristic Beilinson–Saito branch. This extraction supplies that branch's precise characteristic-class comparison target; it does not infer it from characteristic-zero conormal topology."
- **No atlas owner.** No stage text mentions characteristic cycles, micro-support, singular support, Euler obstructions or Kashiwara. The "conormal" hits are unrelated: LPV.3's dual variety, and conormal sheaves in AdicEtaleGeometry A3, HodgeTateAndCanonicalSubgroups T0 and ModularCurves.
- **What Lawrence–Sawin use** (read, arXiv v5):
  - p. 14: ℚ_p-perverse sheaves on an abelian variety A over a field k of characteristic zero.
  - p. 21, Lemma 3.8: "Because H is smooth, the characteristic cycle of i∗Q[n] is simply the conormal bundle of H with multiplicity 1 … The representation is then irreducible minuscule by [42, Corollary 1.0]".
  - p. 22: clean and negligible components through the Gauss map; cc(K) "[43, Definition 2.1.1]"; Λ₁∘Λ₂ "[43, Example 1.3.2]"; deg(Λ₁∘Λ₂) = deg Λ₁ · deg Λ₂; "[43, Proposition 6.1.1]"; "the degree of the Gauss map of the conormal bundle to H is … the Euler characteristic of H, which is d · n!".
- **Krämer states his results for complex D-modules.**
  - Krämer I (arXiv 1604.02389v3, p. 2): "Let A be a complex abelian variety"; the objects are holonomic D_A-modules.
  - Krämer II (arXiv 1807.01929v2, §1.1, p. 7), Theorem 1.1.1: "χ(A, DR(M)) = deg(CC(M)) ≥ 0", "a special case of Kashiwara's index formula … shown more generally … by Franecki and Kapranov".
  - Lawrence–Sawin state no comparison between their ℚ_p-étale sheaves over k and Krämer's setting.
- **Two citation discrepancies in Lawrence–Sawin.**
  - Lemma 3.8 cites "[42, Corollary 1.0]", and [42] is "https://arxiv.org/pdf/1604.02389v3.pdf". Krämer I v3 has no Corollary 1.0. Its minuscule criterion is Corollary 1.10, p. 12.
  - For cc, p. 22 cites "[43, Definition 2.1.1]". In the arXiv v2 of Krämer II, cc is Definition 2.2.1 (p. 13), and 2.1.1 is the microlocalization Theorem. But [43] is the Crelle version, which I did not read, so its numbering may differ. This one is not recorded as a mistake.
- **The extraction misdates Krämer I.** Its `prerequisites` entry cites Krämer I as "Geom. Funct. Anal. 32 (2022), 1180–1231". Crossref gives Ann. Sci. Éc. Norm. Supér. (4) 55 (2022), 1475–1527, DOI 10.24033/asens.2522, and the arXiv v3 comment says "To appear in Ann. Sci. ENS".

### Fix

**The owner.** The characteristic-zero branch goes under the shared continuation id `EtaleDualityAndPerverseSheavesPartIIMicrolocal`, proposed from the accepted LAWRENCE-SAWIN-25 as a new route 6.
- The positive-characteristic branch stays YANG-ZHAO-25 route 5.
- Krämer's convolution-specific material stays in `SheafConvolutionOnAbelianVarieties` (route 2), as the verifier allows.
- Under the current generator (see /19), both branches reach the one EDC Part II design job as separate proposals.

**Edits to `research/blueprint/papers/PAPER-LAWRENCE-SAWIN-25.result.json`**

1. **`items`: append three items.** All have status `missing`, `library: []` and `planned: []`, and all are routed by route 6.

| id | kind | name | statement | locator |
|---|---|---|---|---|
| `PAPER-LAWRENCE-SAWIN-25/83` | definition | Characteristic cycles in characteristic zero (used in Lemmas 3.8–3.9) | For a smooth complex variety X and a bounded constructible complex K on X(ℂ), CC(K) = Σ n_ν[Λ_ν] is a ℤ-combination of irreducible conic Lagrangian subvarieties of T*X, each the closure T*_Z X of the conormal bundle of the smooth locus of an irreducible closed Z ⊆ X. If K is perverse, every n_ν ≥ 0. For Z smooth and closed in a (semi)abelian variety A, CC(ℂ_Z[dim Z]) = [T*_Z A] with multiplicity one. For a holonomic D_X-module M, CC(M) is the cycle of gr M on T*X for a good filtration. For regular holonomic M it agrees with the constructible CC of DR(M). | Lawrence–Sawin v5 §3, pp. 21–22; Franecki–Kapranov, arXiv math/9909088v1, §1, pp. 1–2 (Corollaries 1.4–1.5 and their proofs) and §3, p. 4 (the D-module/constructible compatibility "follows from the results of [7]", Ginzburg 1986); Krämer II, arXiv 1807.01929v2, pp. 2, 4–5 (DR, Riemann–Hilbert, CC(M) from a good filtration after Hotta–Takeuchi–Tanisaki Def. 2.2.2) and p. 17 (every conic Lagrangian is a conormal variety) |
| `PAPER-LAWRENCE-SAWIN-25/84` | theorem | Gauss map, degree and the index formula on abelian varieties | Let A be a complex abelian variety of dimension g, V = H⁰(A, Ω¹_A) and T*A = A × V. For Λ ⊆ T*A of pure dimension g, the Gauss map γ_Λ : Λ → V is either generically finite (Λ clean) or not dominant (Λ negligible). deg Λ := deg γ_Λ vanishes exactly on negligible Λ and extends additively. For every bounded constructible K on A with CC(K) = Σ n_ν[Λ_ν], χ(A, K) = Σ n_ν deg Λ_ν. Hence χ(A, K) ≥ 0 for K perverse, and (−1)^{dim Z} χ(Z, ℂ) = deg T*_Z A for Z ⊆ A smooth and closed. For a smooth hypersurface H with d = [H]^n/n!, deg Λ_H = d·n!. | Franecki–Kapranov math/9909088v1: (1.1) p. 1 (Kashiwara's index formula, their [13]); Theorem 1.3 and Corollaries 1.4–1.5, p. 2; Proposition 2.2, p. 4; p. 8 (for G = A compact, 1.3 follows from (1.1) and 2.2). Krämer II §1.1, p. 7, Theorem 1.1.1. Lawrence–Sawin v5 p. 22 and item 14 |
| `PAPER-LAWRENCE-SAWIN-25/85` | comparison | The ℓ-adic convolution setting over a field of characteristic zero against Krämer's complex setting | Let A be an abelian variety over a field k of characteristic zero, reduced to a finitely generated field of definition. Choose σ : k̄ → ℂ and a field isomorphism ι : ℚ̄_p ≅ ℂ. Base change along σ, Artin's comparison and ι identify D^b_c(A_k̄, ℚ̄_p) with the bounded constructible derived category of A_σ(ℂ) with ℂ-coefficients. The identification is compatible with Ra_*, ⊠, Verdier duality, [−1]^*, the perverse t-structure and Euler characteristics. Riemann–Hilbert then identifies perverse sheaves with regular holonomic D-modules, compatibly with convolution. Under these identifications: negligible objects correspond (χ = 0 on both sides); the Tannakian group of an object of Lawrence–Sawin's geometric category P/N becomes, after ι, Krämer's G(M) of the corresponding module; and CC is defined through the complex realization, independent of σ and ι. Consequently Krämer I Corollary 1.10 and Krämer II Proposition 6.1.1 and Theorem 6.2.1 apply to G_H. | Used implicitly in Lawrence–Sawin v5 §3, pp. 21–22, which apply [42], [43], stated for complex abelian varieties (Krämer I p. 2; Krämer II p. 2), to the ℓ-adic setting of §2, p. 14. Krämer II p. 12: χ(A, DR(M)) = 0 iff M is negligible |

   **Notes to set on the three items:**
   - **83:** "The general definition of CC for constructible complexes is Kashiwara–Schapira's (Sheaves on Manifolds), cited by Franecki–Kapranov as [14]. It was not read here: no public copy. Nor was Ginzburg 1986, the source for the D-module compatibility. The design job must source both before closing this item (RT-AREA-etale/12)."
   - **84:** "Franecki–Kapranov's Gaussian degree (Proposition 2.2) is the number of points of Λ on the graph of a generic invariant form γ. On an abelian variety that graph is A × {γ}, so it is deg γ_Λ as used by Krämer and Lawrence–Sawin. Kashiwara's index theorem (Astérisque 130) is cited, not read."
   - **85:** "No read source proves this comparison. It is an explicit obligation of route 6. The analytic comparison of operations is EDC.6's (through the ComplexComparison PR196 supplier). Regular holonomic D-modules are proposed in MixedHodgeModulesAndIrregularHodgeTheory (PAPER-FRESAN-SABBAH-YU-22 route 1)."

2. **`routes`: append route 6.**
   ```json
   {"route": "part-ii",
    "parent": "EtaleDualityAndPerverseSheaves",
    "roadmap": "EtaleDualityAndPerverseSheavesPartIIMicrolocal",
    "title": "Étale duality, cycle classes and perverse sheaves, Part II: characteristic cycles and polar bounds",
    "area": "etale",
    "items": ["PAPER-LAWRENCE-SAWIN-25/83", "PAPER-LAWRENCE-SAWIN-25/84", "PAPER-LAWRENCE-SAWIN-25/85"],
    "reason": "Lemmas 3.8–3.9 (v5 pp. 21–22) apply the conormal characteristic cycle of a smooth hypersurface, the Gauss-map degree and Krämer's clean-cycle criteria to ℚ_p-perverse sheaves over a field of characteristic zero. Krämer states these for holonomic D-modules on complex abelian varieties. No atlas stage plans characteristic cycles. The shared microlocal continuation's only characteristic-zero proposal (PAPER-SHENDE-TSIMERMAN-17 route 14) is rejected, and PAPER-YANG-ZHAO-25 route 5 supplies only the positive-characteristic branch. This route supplies the characteristic-zero foundation and its comparison with the ℓ-adic setting under the same continuation id. The convolution-specific criteria stay with route 2 (RT-AREA-etale/12).",
    "brief": "<the brief below>"}
   ```
   The brief:
   > The characteristic-zero branch of the shared microlocal continuation of Étale duality, cycle classes and perverse sheaves (EtaleDualityAndPerverseSheavesPartIIMicrolocal). Its positive-characteristic branch (Beilinson's singular support, Saito's characteristic cycle and the characteristic-class comparison) is sourced separately by PAPER-YANG-ZHAO-25 route 5, and is neither assumed nor supplied here.
   >
   > Import:
   > - perverse sheaves, intermediate extension and Verdier duality from EtaleDualityAndPerverseSheaves EDC.5 and EDC.1;
   > - the analytic comparison of operations from EDC.6, requesting from it the constructible and perverse form of Artin's comparison if its blueprint does not state it;
   > - cycles on T*X from SchemeAndStackFoundations SF.5;
   > - regular holonomic D-modules from the D-module layer of MixedHodgeModulesAndIrregularHodgeTheory (PAPER-FRESAN-SABBAH-YU-22 route 1), or as a request to it.
   >
   > Plan, for a smooth complex variety X:
   > - the characteristic cycle of a bounded constructible complex, as a ℤ-combination of closures of conormal bundles;
   > - its effectivity on perverse sheaves, and CC(ℂ_Z[dim Z]) = [T*_Z X] for Z smooth and closed (Franecki–Kapranov, Corollaries 1.4–1.5);
   > - the characteristic cycle of a holonomic D-module from a good filtration, and its agreement with the constructible one under the de Rham functor (Franecki–Kapranov §3, after Ginzburg);
   > - on an abelian variety A with T*A = A × H⁰(A, Ω¹): the Gauss map, clean and negligible cycles, the degree, and the index formula χ(A, K) = Σ n_ν deg Λ_ν (Franecki–Kapranov Theorem 1.3 with Proposition 2.2; Krämer II Theorem 1.1.1).
   >
   > Then prove the comparison of item 85. For an abelian variety over a field of characteristic zero, the ℓ-adic perverse and convolution setting of Lawrence–Sawin §2 is identified with complex constructible complexes and regular holonomic D-modules. The identification is made after an embedding of an algebraic closure of a finitely generated field of definition into ℂ and a field isomorphism of the coefficient field with ℂ. It must be compatible with convolution, duality, [−1]^*, the perverse t-structure, Euler characteristics and characteristic cycles, so that Krämer's Tannakian groups and criteria apply to Lawrence–Sawin's convolution groups.
   >
   > Before closing items 83–84, source the definition of characteristic cycles and Kashiwara's index theorem (Kashiwara–Schapira, Sheaves on Manifolds; Kashiwara, Astérisque 130). No read source proves item 85: it stays an explicit obligation until one is read or the proof is written.
   >
   > Tests:
   > - a point: CC = T*_p A, of degree 1, and χ = 1;
   > - ℚ_A[g]: the zero section, negligible, of degree 0, and χ = 0;
   > - a smooth curve C in an abelian surface: degree 2g(C) − 2 = −χ(C);
   > - an abelian subvariety: negligible, of degree 0.
   >
   > Consumers:
   > - SheafConvolutionOnAbelianVarieties (items 15–16), which keeps Krämer's clean-cycle ring, the convolution of cycles, the microlocalization functor, and his minuscule and almost-simplicity criteria;
   > - the Jacobian Part II of PAPER-SHENDE-TSIMERMAN-17 when it is revised.
   >
   > Polar multiplicities, local Euler obstructions and Massey's inequalities (PAPER-SHENDE-TSIMERMAN-17 route 14, rejected) are not planned here.

3. **Route 2, `brief`: add the import.** Replace
   > Import, never re-plan: perverse sheaves, the perverse t-structure, intermediate extensions and Verdier duality from EtaleDualityAndPerverseSheaves EDC.1 and EDC.5;

   with
   > Import, never re-plan: perverse sheaves, the perverse t-structure, intermediate extensions and Verdier duality from EtaleDualityAndPerverseSheaves EDC.1 and EDC.5; characteristic cycles in characteristic zero, conormal cycles of smooth subvarieties, the Gauss map and its degree, the index formula, and the comparison of the ℓ-adic setting with Krämer's complex D-module setting from the characteristic-zero branch of EtaleDualityAndPerverseSheavesPartIIMicrolocal (route 6 of this extraction, items 83–85), as requests to it if it has not yet been designed;

4. **Route 2, `brief`: say what stays here.** Replace
   > minisculeness and simplicity of the distinguished representation through Krämer's characteristic-cycle criteria, with the modification needed when H is not invariant under inversion;

   with
   > minisculeness and simplicity of the distinguished representation through Krämer's characteristic-cycle criteria (his ring of clean cycles and their convolution, the microlocalization functor, Krämer I Corollary 1.10 and Krämer II Proposition 6.1.1 and Theorem 6.2.1, planned here on the imported foundation), with the modification needed when H is not invariant under inversion;

5. **Items 15 and 16, `note`:** append "Characteristic-cycle foundation: items 83–85 (route 6), RT-AREA-etale/12."
6. **`sourceIssues`, now `[]`: add one misprint.** Alternatively, the maintainer can put it in the errata file of a future `ERRATA-PAPER-LAWRENCE-SAWIN-25` job; none is queued.
   ```json
   {"id": "PAPER-LAWRENCE-SAWIN-25/E1", "kind": "misprint",
    "locator": "Proof of Lemma 3.8, p. 21, arXiv v5",
    "printed": "The representation is then irreducible minuscule by [42, Corollary 1.0]",
    "correction": "[42, Corollary 1.10]",
    "reason": "[42] is arXiv 1604.02389v3. It has no Corollary 1.0; its Corollary 1.10 (p. 12) is the criterion used: an irreducible Lagrangian Λ not stable under any translation, with CC(M) ≡ Λ modulo degenerate subvarieties, gives a minuscule representation.",
    "affects": "nothing", "known": "new",
    "searched": ["arXiv 2004.09046 version list (v1–v5; v5 of 16 October 2025 is the latest), read 2026-09-29"]}
   ```
7. **`prerequisites`, the Krämer entry: correct the venue.** Replace "Geom. Funct. Anal. 32 (2022), 1180–1231" with "Ann. Sci. Éc. Norm. Supér. (4) 55 (2022), 1475–1527". This was verified by Crossref (DOI 10.24033/asens.2522); arXiv 1604.02389v3 says "To appear in Ann. Sci. ENS".
8. **`PAPER-LAWRENCE-SAWIN-25.md`:** add row 6 to the route table.

**The review verdict.** `PAPER-LAWRENCE-SAWIN-25.review.json` needs a verdict for route 6 from a review job before `make_queue` applies it (`accepted_routes`, make_queue.py:390–401). Until then the route is a proposal.

**Edits to `research/blueprint/papers/PAPER-YANG-ZHAO-25.result.json`, route 5.** These are proposals, applied when the extraction is revised. The title is fixed under /39.

9. **`reason`:** replace the whole text quoted above with
   > Use the shared microlocal continuation id EtaleDualityAndPerverseSheavesPartIIMicrolocal. This extraction sources its positive-characteristic branch: Beilinson's singular support, Saito's characteristic cycle, and the precise characteristic-class comparison target. It does not infer that branch from characteristic-zero conormal topology. The characteristic-zero branch is sourced separately (PAPER-LAWRENCE-SAWIN-25 route 6) and is neither supplied nor certified here. PAPER-SHENDE-TSIMERMAN-17 route 14 is rejected.
10. **`brief`, first sentence:** replace "Extend the existing Microlocal brief, preserving its characteristic-zero polar-bound branch and its single ownership." with
    > This is the positive-characteristic branch of the shared Microlocal continuation, under its single ownership. Its characteristic-zero branch (conormal characteristic cycles, the index formula and Gauss-map degrees over ℂ, and the comparison with ℓ-adic coefficients) is proposed separately by PAPER-LAWRENCE-SAWIN-25 route 6 and is not planned here.

**Stage links.** The Part II is a draft, not an atlas stage.
- EDC.5 → Part II and EDC.6 → Part II: the cycle test gives "acyclic (no path EtaleDualityAndPerverseSheavesPartII → …)" for both.
- Part II → SheafConvolutionOnAbelianVarieties: both are drafts with no stage edges at 1b1aeb19.

### Not done, and why

- **Three sources were not read.** Kashiwara–Schapira's definition of characteristic cycles, Kashiwara's index theorem and Ginzburg 1986 have no public copy. They are stated obligations in items 83–84, not closed.
- **Item 85 stays a gap.** The comparison of Lawrence–Sawin's ℓ-adic setting with Krämer's complex D-module setting has no read source.
- **Route 6 needs a review verdict.** The maintainer should not accept it here.
- **The YANG-ZHAO-25 route-5 review reason** still says "Use the reviewed Microlocal continuation shared with Shende–Tsimerman, preserving its separate positive-characteristic branch". The next review of that extraction should drop "shared with Shende–Tsimerman".
- **SHENDE-TSIMERMAN-17 route 14 stays rejected.** When it is revised, its complex conormal and polar-cycle nodes should build on items 83–85, not plan them a second time.

## /13 (medium, library-claim): the ind-constructible Part II imports Mathlib's Serre-class localization

### What the verifier corrected

**Mathlib 082e2d3 already supplies:**
- `ObjectProperty.IsSerreClass` (Basic.lean:47);
- `isoModSerre`, which is Yun–Zhang's kernel/cokernel criterion (MorphismProperty.lean:66), with its two-out-of-three instance at line 161;
- `SerreClassLocalization.map_eq_zero_iff` (Localization.lean:141), the image criterion;
- the calculus of fractions, `abelian`, `preservesFiniteLimits`, `preservesFiniteColimits` and `isIso_map_iff` (lines 417–444).

Route 9 must import this, not plan it again.

**The corrections to keep:**
- Items 63, 64 and 176 **remain partial**, not library-built. Still to do:
  - the Serre-class instance for the essential image of an essentially small finite-length abelian category in Ind(C);
  - universes and skeletons;
  - the constructible-perverse hypotheses.
- The paper works with mc-maps and mc-actions (pp. 445, 448) and constructs no quotient. Keep that distinction and the extraction's supplement.
- Do not compress the remaining obligations into "one trivial lemma". So the red team's option of folding the Part II into EDC.5 as a single lemma is not taken.

### State on main (1b1aeb19)

- **Unchanged since 2026-09-23**, and live. YUN-ZHANG-19 is overall accept, and route 9 is in the pending design `DESIGN-EtaleDualityAndPerverseSheavesPartII` (issue #3363). The issue quotes the opening of the route-9 brief ("…using the EXISTING Mathlib CategoryTheory.Ind, fully faithful Yoneda embedding and abelian Ind instance. First work for an essentially small finite-length abelian category C, proving that its essential image is Serre in Ind(C), then construct the exact Serre quotient Ind(C)/C with its universal property …") and points to the full brief.
- **Route 9 `reason`:** "EDC.5 explicitly stops at bounded constructible perverse sheaves; Mathlib already provides Ind and abelianness, but not the paper's mc quotient interface. GS.3 needs a reusable exact categorical contract. IG.4 has a different filtered-colimit support criterion; import/reconcile rather than assert it is the same theorem."
- **Items 63, 64 and 176** have status `missing` and no `library` list. Items of a part-ii route must stay `missing`: `scripts/check_paper.py` line 93 rejects any other status. Many extractions record partial library support on a missing item in `library` plus `note`; for example PAPER-BHATT-SCHOLZE-22/102 does.
- **The source** (read, published version, p. 445), Definition 3.32: "(1) We say ϕ is an mc-isomorphism (mc for modulo constructibles) if the kernel and cokernel of ϕ are in the essential image of the natural embedding Perv((Xr × S∞) ⊗ k̄, Qℓ) ↪ indPerv(…). (2) We say ϕ is mc-zero if its image is in the essential image …". On p. 448 an mc-action is one where "the endomorphism a(uv) − a(u)a(v) … is … a mc-zero map".

**Read at the Mathlib pin.** All paths are under `Mathlib/CategoryTheory/`.

| Declaration | Location | What it gives |
|---|---|---|
| `ObjectProperty.IsSerreClass` | `Abelian/SerreClass/Basic.lean:47` | contains zero; closed under subobjects, quotients and extensions |
| `ObjectProperty.isoModSerre` (with `monoModSerre`, `epiModSerre`) | `…/MorphismProperty.lean:66` (52, 59) | P(kernel f) and P(cokernel f): mc-isomorphism |
| instances `IsMultiplicative`, `HasTwoOutOfThreeProperty` | `…/MorphismProperty.lean:145, 161` | composition; two out of three |
| `ObjectProperty.isoModSerre_isInvertedBy_iff` | `…/MorphismProperty.lean:178` | an exact F inverts isoModSerre iff P ≤ F.kernel |
| instances `HasLeftCalculusOfFractions`, `HasRightCalculusOfFractions` | `…/Localization.lean:102, 113` | the localization |
| `SerreClassLocalization.isZero_obj_iff`, `map_eq_zero_iff` | `…/Localization.lean:132, 141` | L.obj X = 0 iff P X; L.map f = 0 iff P (image f): mc-zero |
| `SerreClassLocalization.abelian`, `preservesFiniteLimits`, `preservesFiniteColimits`, `isIso_map_iff` | `…/Localization.lean:417, 429, 435, 441` | abelian, exact quotient; L.map f iso iff isoModSerre f |
| `SerreClassLocalization.essImage_whiskeringLeft` | `…/Localization.lean:538` | universal property for exact functors |
| `Ind`, `Ind.yoneda`, `Ind.yoneda.fullyFaithful` | `Limits/Indization/Category.lean:71, 101, 113` | Ind(C), the embedding |
| `PreservesLimits Ind.yoneda`, `PreservesFiniteColimits Ind.yoneda` | `Limits/Indization/Category.lean:175, 206` | the embedding is exact |
| `instance : Abelian (Ind C)` | `Abelian/Indization.lean:41`, under `{C : Type v} [SmallCategory C] [Abelian C]` (line 28) | needs a **small** C |
| `IsNoetherianObject`, `IsArtinianObject` | `Subobject/NoetherianObject.lean:55`, `Subobject/ArtinianObject.lean:56` | finite-length carriers |
| `MorphismProperty.Localization`, `Localization.HasSmallLocalizedHom` | `Localization/Construction.lean:107`, `Localization/SmallHom.lean:50` | hom universe of the quotient |

**What the pin lacks.** No declaration shows that the essential image of `Ind.yoneda` is a Serre class. The only `IsSerreClass` instances are the generic ones in `SerreClass/Basic.lean` (⊤, `IsZero`, inverse images under exact functors) and `Algebra/Category/Grp/IsFinite.lean:39`.

### Fix

**Edits to `research/blueprint/papers/PAPER-YUN-ZHANG-19.result.json`.**

1. **Route 9, `reason`:** replace the whole text quoted above with
   > EDC.5 explicitly stops at bounded constructible perverse sheaves. Mathlib (082e2d3) provides Ind(C) with its abelian structure for a small abelian C, the exact fully faithful Ind.yoneda, and the Serre-class localization: IsSerreClass; isoModSerre with composition and two-out-of-three; both calculi of fractions; and the abelian, exact localization with map_eq_zero_iff, isIso_map_iff and the universal property for exact functors. Not in Mathlib, and planned here: that the essential image of an essentially small finite-length abelian C is a Serre class in Ind(C); the universe and skeleton choices; the passage from mc-actions to actions; and the application to C = Perv_c under proved finite-length hypotheses. GS.3 needs this exact categorical contract. IG.4 has a different filtered-colimit support criterion; import/reconcile rather than assert it is the same theorem.
2. **Route 9, `brief`:** replace its first four sentences and the clause after them. The exact text replaced runs from "Build a narrow reusable extension of Étale duality, cycle classes and perverse sheaves (EtaleDualityAndPerverseSheaves EDC.5), using the EXISTING Mathlib CategoryTheory.Ind, fully faithful Yoneda embedding and abelian Ind instance." through "…and the passage from mc-commuting squares/actions to genuine commuting squares/actions in the quotient. Supply explicit universe/skeleton choices;". The replacement:
   > Build a narrow reusable extension of Étale duality, cycle classes and perverse sheaves (EtaleDualityAndPerverseSheaves EDC.5) on Mathlib's existing machinery. That machinery is imported and not planned again: Ind(C) with its abelian structure for a small abelian C and the exact, fully faithful Ind.yoneda (Limits/Indization/Category.lean:71, 101, 113, 175, 206; Abelian/Indization.lean:41); and the Serre-class localization, meaning ObjectProperty.IsSerreClass (Abelian/SerreClass/Basic.lean:47), isoModSerre with its composition and two-out-of-three instances (SerreClass/MorphismProperty.lean:66, 145, 161), the two calculi of fractions and SerreClassLocalization.map_eq_zero_iff, abelian, preservesFiniteLimits, preservesFiniteColimits, isIso_map_iff and essImage_whiskeringLeft (SerreClass/Localization.lean:102, 113, 141, 417, 429, 435, 441, 538).
   >
   > Plan only what Mathlib lacks:
   > 1. For an essentially small abelian C of finite length, replaced by an equivalent small category, prove that the essential image of Ind.yoneda is a Serre class in Ind(C) (the supplement recorded in item 63).
   > 2. State Yun–Zhang's mc-isomorphisms and mc-zero maps (Definition 3.32, p. 445) as isoModSerre and as having image in that Serre class. Deduce from isIso_map_iff and map_eq_zero_iff that they become isomorphisms and zero maps in the quotient. The quotient Ind(C)/C is Mathlib's localization at isoModSerre, not a new construction; the paper itself works with mc-maps and builds no quotient.
   > 3. Prove that mc-zero maps form a two-sided ideal, and that mc-commutative squares and mc-actions (p. 448) become commutative squares and actions in the quotient.
   > 4. Record the universe and skeleton choices. Mathlib's Ind C and its Abelian instance need C : Type v with [SmallCategory C], and the hom universe of the localization must be controlled (MorphismProperty.Localization, Localization.HasSmallLocalizedHom).
   > 5. From EDC.5, prove the finite-length, essential-smallness and universe hypotheses for C = Perv_c((X_r × S_∞) ⊗ k̄, ℚ_ℓ) before applying 1–4.

   The rest of the brief is kept unchanged, from "do not declare every ind-perverse sheaf constructible…" to "…follows merely from this quotient construction.", with its first word capitalised.
3. **Item 63:** add `"library": ["mathlib:CategoryTheory.ObjectProperty.IsSerreClass", "mathlib:CategoryTheory.ObjectProperty.isoModSerre", "mathlib:CategoryTheory.Ind.yoneda"]` and append to `note`:
   > Partial library support (RT-AREA-etale/13). The kernel/cokernel criterion is Mathlib's isoModSerre (Abelian/SerreClass/MorphismProperty.lean:66) for a Serre class (Basic.lean:47), with composition and two-out-of-three (instances at lines 145, 161). Still missing, and planned by route 9: that the essential image of a small finite-length abelian C is a Serre class in Ind(C) (Ind C needs a small C: Abelian/Indization.lean:28, 41); the universe and skeleton choices; and the hypotheses for C = Perv_c. The status stays missing.
4. **Item 64:** add `"library": ["mathlib:CategoryTheory.ObjectProperty.SerreClassLocalization.map_eq_zero_iff", "mathlib:CategoryTheory.ObjectProperty.SerreClassLocalization.isZero_obj_iff"]` and set `note` to
   > Partial library support (RT-AREA-etale/13). mc-zero means image in the Serre class. SerreClassLocalization.map_eq_zero_iff (Localization.lean:141) says these are exactly the maps the localization kills; the ideal property and mc-commutation then follow from additivity and functoriality of the localization. Planned by route 9: the statement for Yun–Zhang's mc-notions and the passage from mc-actions to actions (p. 448). The status stays missing.
5. **Item 176:** add `"library": ["mathlib:CategoryTheory.ObjectProperty.SerreClassLocalization.abelian", "mathlib:CategoryTheory.ObjectProperty.SerreClassLocalization.isIso_map_iff", "mathlib:CategoryTheory.ObjectProperty.SerreClassLocalization.essImage_whiskeringLeft"]` and append to `note`:
   > Partial library support (RT-AREA-etale/13). The quotient is Mathlib's localization at isoModSerre: the calculi of fractions (Localization.lean:102, 113); abelian (417); exact (429, 435); isIso_map_iff (441); and the universal property for exact functors (essImage_whiskeringLeft, 538). Planned by route 9: the Serre-class instance for the image of C; universes (MorphismProperty.Localization, Localization.HasSmallLocalizedHom); and the application to Perv_c. The extraction supplement stands: the paper constructs no quotient (pp. 445, 448). The status stays missing.
6. **`PAPER-YUN-ZHANG-19.md`:** the route-9 row's reason follows edit 1.

**For the maintainer.** Issue #3363 quotes the old opening of the route-9 brief. After edit 2, regenerate the issue body, or comment on #3363 with the new opening, so that the design job does not plan the quotient again.

No stage edge changes.

### Not done, and why

- **The Part II is not folded into EDC.5**, as the red team proposed. The verifier forbids reducing the remaining obligations to one lemma.
- **No item is re-marked `library`.** The review says partial, and `check_paper.py` requires `missing` for items of a part-ii route.
- **The finite-length and essential-smallness of Perv_c** are EDC.5's to prove. They are not claimed here.

## /14 (medium, duplicate): one owner for the Artin–Schreier sheaf, and a normalized global–local Fourier comparison

### What the verifier corrected

- **The same local system.** Browning–Sawin v3 p. 8 and Fresán–Sabbah–Yu v5 p. 4 use the same rank-one additive-character local system. Yang–Zhao v4 Theorem 6.3 and §6.4 (pp. 45–46) build the local Fourier kernels from it.
- **Three routes plan it.** The extractions assign its construction to FF.2, to the proposed GeneralBasesFourier Part II, and to the Kloosterman roadmap independently.
- **One shared owner.** Give the finite-étale-torsor/isotypic construction one owner; FF.2's accepted route is available. The owner must cover:
  - F_p and F_q, through trace and scalar pullback;
  - finite coefficients containing the character;
  - their characteristic-zero realizations.
- **What stays with the consumers.** Kloosterman direct images and the local nearby-cycle kernels stay with their consumers.
- **The two transforms.** Link the global Fourier transform to the local one by a precisely normalized comparison.
- **ABE-25 and YANG-ZHAO-25 are revise.** These are duplicates to resolve before their design activates, not active blueprints.
- **Nothing at the pin.** No pinned sheaf-theoretic Artin–Schreier construction exists; the elementary Artin–Schreier results do not supply it.

### State on main (1b1aeb19)

**Changed since the verification: FF.2 now declares itself the single owner.** The FF packet `research/blueprint/packets/FiniteFieldsAndCharacterSums.json` was committed on 2026-09-25 (3684dfac).
- Node `FiniteFieldsAndCharacterSums:FF.2/artin-schreier-sheaf` constructs L_ψ(f) "for a separated F-scheme X₀ of finite type", with "a finite extension E of ℚ_ℓ containing the p-th roots of unity; let ψ : F → E^× be a nontrivial additive character". It has trace ψ(Tr(f(x))), additivity, duality, triviality on h^q − h, L_{ψ(a·)}(f) ≅ L_ψ(af) and pull-back.
- Its `uses` already say: "AS_ψ is the input of the Kloosterman sheaf Kl₂ … FF.2 is the single owner (RT-AREA-etale/14)".
- Node `FF.2/fourier-deligne-transform` defines "FT_ψ(K) := R pr_{2!}(pr₁^*K ⊗ L_ψ(xy))[1] … (Laumon Définition 1.2.1.1 …)". Its `uses` include "LefschetzPencilsAndVanishingCycles Part II (general bases, local Fourier transforms): the global transform to be compared with Laumon's local Fourier transforms (RT-AREA-etale/14)".

**What the FF.2 node does not cover:**
- finite coefficient rings, such as Abe's torsion Λ and Yang–Zhao's "finite local ring whose residue field is of characteristic ℓ≠p" (Yang–Zhao §6.1, p. 45);
- F_p-schemes that are not of finite type over F, such as strictly henselian traits over k;
- the F_p/F_q comparison (Yang–Zhao and Fresán–Sabbah–Yu take ψ on F_p, Browning–Sawin on F_q);
- reduction and realization maps between coefficient rings.

**The duplicates, unchanged:**
- ABE-25/A19: "construct the rank-one Artin–Schreier sheaf Lψ from the finite étale torsor u↦u^p−u";
- YANG-ZHAO-25/A02: "form its rank-one Artin–Schreier sheaf Lψ";
- FRESAN-SABBAH-YU-22/33: "the Artin–Schreier sheaf AS_ψ on A¹_{F_p} and the Kloosterman sheaf Kl₂ = Rπ_! f^* AS_ψ[1]". This is status `missing`, in route 2 (new roadmap KloostermanMomentsAndPotentialAutomorphy, accepted; design #3441). That route's brief imports "Weil's bound for Kloosterman sums from FiniteFieldsAndCharacterSums FF.2" but not the sheaf.
- **One more consumer not named by the finding:** XU-ZHU-22 route 4 (same design, #3441), item 2. Its brief says "Deligne's Kl_n = Rmult_!(add^*AS_ψ)[n−1]((n−1)/2)", with no owner for AS_ψ.

**Sources read.**
- Browning–Sawin v3 p. 8: "Let Lψ be the Artin–Schreier sheaf on A1 associated to the character ψ on Fq."
- Fresán–Sabbah–Yu v5 p. 4: "a rank one ℓ-adic local system Lψ on the affine line A1_Fp with trace function z ↦ ψ(tr_Fq/Fp(z))".
- Yang–Zhao v4 p. 45: "We choose a non-trivial additive character ψ : Fp → Λ*, and let L be the Artin-Schreier sheaf on A1_Fp associated with ψ".
- Laumon 1987 (Publ. Math. IHÉS 65):
  - Définition (1.2.1.1), p. 141: F_ψ(K) = R pr′_!(pr^*K ⊗ L_ψ(⟨ , ⟩))[r], the same normalization as FF.2.
  - Proposition (2.3.3.1)(iii), p. 161: for K ∈ ob Perv(A, Q̄_ℓ), F′_{η̄∞′} ≃ ⊕_{s∈S} Ind^{G∞′}_{G_{s×∞′}}(R^{−1}Φ_{η̄∞′}(pr̄^*(α_!K) ⊗ L̄(x.x′)[1])_{(s̄,∞̄′)}) ⊕ R^{−1}Φ_{η̄∞′}(pr̄^*(α_!K) ⊗ L̄(x.x′)[1])_{(∞̄,∞̄′)}.
  - Lemme (2.4.2.1), p. 162: the local stalks correspond, after π ↦ x (resp. 1/x) and π′ ↦ 1/x′ and a shift [2], to RΦ_{η′}(pr^*(V_!) ⊗ L̄_ψ(π/π′)) (resp. L̄_ψ(1/ππ′)).
  - Définition (2.4.2.3) and Théorème (2.4.3), pp. 163–164: the local Fourier transforms and their properties.

### Fix

**Owner: FF.2, node `FiniteFieldsAndCharacterSums:FF.2/artin-schreier-sheaf`.** The global transform stays FF.2's (`FF.2/fourier-deligne-transform`). The LPV Part II gets only the product kernels, the local transforms and the comparison.

**1. Edits to the FF packet**, for the maintainer or the next checkpoint of the FF blueprint job. The packet belongs to its own job and is not this job's file.
- **Node `FF.2/artin-schreier-sheaf`, `statement`:** append
  > More generally, for any ring Λ in which p is invertible and a character ψ : F → Λ^×, L_ψ is the rank-one lisse Λ-sheaf on A¹_F obtained by pushing the Lang torsor along ψ^{−1}. Λ may be a finite local ring of residue characteristic ℓ ≠ p (Abe; Yang–Zhao §6.1), O_E or E. For an arbitrary F-scheme X, not necessarily of finite type (a strictly henselian trait over k ⊇ F, for example), and g : X → A¹_F, L_ψ(g) := g^*L_ψ. Formation of L_ψ commutes with change of coefficients Λ → Λ′: reduction modulo ℓ^n, O_E → E, and a finite étale enlargement Λ → B through which ψ factors. For F = F_q ⊇ F_p and ψ = ψ₀ ∘ Tr_{F_q/F_p}, L_ψ on A¹_{F_q} is the base change of L_{ψ₀} on A¹_{F_p}, with trace function x ↦ ψ₀(tr_{F_{q^ν}/F_p}(x)). This is Browning–Sawin's reviewed item `schreier`, and Fresán–Sabbah–Yu v5 p. 4.
- **Same node, `hypotheses`:** replace "ℓ ≠ p; E ⊇ μ_p (a nontrivial rank-one ψ has no values in ℚ_ℓ when p is odd: BS's unit test)." with "ℓ ≠ p; the coefficient ring (a finite local ring of residue characteristic ℓ, O_E or E) contains the values of ψ, so a nontrivial ψ needs μ_p (BS's unit test). A ring without them is enlarged by the consumer (Yang–Zhao Q01), not here."
- **Same node, `tests`:** add
  - "for q = p², the trace of L_{ψ₀} at x ∈ F_q is ψ₀(x + x^p)";
  - "for Λ = F₂ and p = 3 there is no nontrivial ψ : F₃ → Λ^×".
- **Same node, `uses`:** add the proposed consumers ABE-25/A19 and YANG-ZHAO-25/A02 (the local-Fourier kernels of LefschetzPencilsAndVanishingCyclesPartII) and XU-ZHU-22/2 (Deligne's Kl_n).
- **Node `FF.2/fourier-deligne-transform`, `uses`:** append to the LPV Part II entry: "The comparison node of that Part II imports this normalization, R pr′_!(pr^*K ⊗ L_ψ(xx′))[1] with r = 1 (Laumon Définition 1.2.1.1, p. 141)."
- **The packet's FF.2 `split` proposal in `restructure`:** its FF.2c puts `artin-schreier-sheaf`, `kummer-sheaf`, `trace-function` and `character-sheaf-cohomology-vanishes` together with the Deligne-bound nodes, and FF.2d holds the Fourier–Deligne nodes. Put these construction nodes and `fourier-deligne-transform`/`-inversion` in an early sub-layer whose prerequisites are SF.2, EDC.0–2 and FF.1 only. The reason: a coarse stage edge from FF.2 carries its 142 ancestors, including DWP.4–7 and WC.3, into the early local-Fourier prefix.

**2. `PAPER-FRESAN-SABBAH-YU-22.result.json`** (accepted).
- **Route 2, `brief`:** replace "Weil's bound for Kloosterman sums from FiniteFieldsAndCharacterSums FF.2;" with
  > the Artin–Schreier sheaf AS_ψ = L_ψ on A¹_{F_p} (construction, trace function ψ(tr_{F_q/F_p}(z)), additivity and pull-back; node FF.2/artin-schreier-sheaf) and Weil's bound for Kloosterman sums from FiniteFieldsAndCharacterSums FF.2;
- **Item 33, `note`:** append "AS_ψ is FF.2's (FF.2/artin-schreier-sheaf, RT-AREA-etale/14) and is not constructed here. This item keeps Kl₂ = Rπ_!f^*AS_ψ[1], Kl_{n+1} and the cohomological interpretation of the moments." The status stays `missing`, which check_paper requires for a new-roadmap route.

**3. `PAPER-XU-ZHU-22.result.json`** (accepted).
- **Route 4, `brief`:** replace "Deligne's Kl_n = Rmult_!(add^*AS_ψ)[n−1]((n−1)/2)," with "Deligne's Kl_n = Rmult_!(add^*AS_ψ)[n−1]((n−1)/2), with AS_ψ imported from FiniteFieldsAndCharacterSums FF.2 (FF.2/artin-schreier-sheaf),".
- **Item 2, `note`:** append the same sentence.

**4. `PAPER-ABE-25.result.json` and `PAPER-YANG-ZHAO-25.result.json`** (proposals, applied on revision).
- **ABE-25/A19, `statement`:** replace "construct the rank-one Artin–Schreier sheaf Lψ from the finite étale torsor u↦u^p−u." with "import the rank-one Artin–Schreier sheaf Lψ from FiniteFieldsAndCharacterSums FF.2 (FF.2/artin-schreier-sheaf; finite coefficients and F_p/F_q as stated there)."
- **ABE-25/A19, `planningAPI` A19.api1:** replace "Construct the ψ-isotypic local system with its coefficient hypothesis." with "Import L_ψ with its coefficient hypothesis from FF.2."
- **YANG-ZHAO-25/A02, `statement`:** replace "form its rank-one Artin–Schreier sheaf Lψ," with "import its rank-one Artin–Schreier sheaf Lψ from FiniteFieldsAndCharacterSums FF.2 (FF.2/artin-schreier-sheaf),".
- **Both items stay `missing` in their Part II routes.** Their remaining content is the product kernel and its zero extension.
- **The two routes' briefs** change through the merged GeneralBasesFourier brief of /19. Its part (3) imports L_ψ and FT_ψ from FF.2 and states the comparison as a node obligation:
  > Prove the precisely normalized global–local comparison. For K perverse on A¹, with FT_ψ normalized as in FF.2 (Laumon Définition 1.2.1.1, r = 1), Laumon's Proposition (2.3.3.1)(iii) (p. 161) identifies the generic stalk at ∞′ of the lisse part of FT_ψ(K), as a G_∞′-module, with ⊕_{s∈S} Ind^{G∞′}_{G_{s×∞′}} R^{−1}Φ(pr̄^*(α_!K) ⊗ L̄(x.x′)[1])_{(s̄,∞̄′)} ⊕ R^{−1}Φ(…)_{(∞̄,∞̄′)}. Lemme (2.4.2.1) (p. 162) identifies these stalks with Laumon's local Fourier transforms of the local monodromy, after π ↦ x (resp. 1/x), π′ ↦ 1/x′ and the shift [2]. Yang–Zhao's L_!(t/t′) at (0, 0′) and Abe's L(f t′) at ∞′ are the same kernel in the coordinates t′ = π′ = 1/x′.

**Stage links.** Link FF.2 → LefschetzPencilsAndVanishingCyclesPartII (a draft; its local-Fourier layer).
- The cycle test for `FiniteFieldsAndCharacterSums:FF.2` → `LefschetzPencilsAndVanishingCyclesPartII`: acyclic.
- The link FF.2 → KloostermanMomentsAndPotentialAutomorphy exists already, since that brief imports FF.2. Acyclic.
- Import at node level (FF.2/artin-schreier-sheaf, whose prerequisites are SF.2 and Mathlib) until the FF.2 split above is accepted.

### Not done, and why

- **BROWNING-SAWIN-20/fourierdeligne is not moved to the LPV Part II**, as the red team suggested. The verifier allows either option, and FF.2 already plans the global transform with the matching normalization.
- **The FF packet edits** are for its blueprint job or the maintainer, not this job.
- **FRESAN-SABBAH-YU-22 has an open red-team job (#4184).** Its fixer should keep edit 2.
- **Laumon's Proposition (2.3.3.1)** was read at its statement, from the numdam page images, not through its proof.
- **The coefficient enlargement** (Yang–Zhao Q01, a ring lacking ψ) stays with Yang–Zhao's consumer. It is about the consumer's descent argument, not the sheaf.

## /15 (medium, duplicate): the general-bases Part II imports L2 and H1's valuation stages, with comparison obligations

### What the verifier corrected

- **The overlap with L2 is confirmed.** Abe's Lemma 1.4 (arXiv, pp. 4–5) overlaps directly with L2's expressly owned continuity and derived-coefficient work for general schemes.
- **Import or extend L2** for Hom continuity and the 2-colimit equivalence of D^b_c, with the actual hypotheses: coherent schemes, affine transition maps, Noetherian coefficients.
- **The second claim is narrowed.** Huber 4.2.4–4.2.5 give base change and degreewise constructibility of RΨ over valuation bases. They do not prove Abe's Theorem 1.5 over an arbitrary absolutely integrally closed coherent base (p. 6), nor the Hansen–Scholze ULA equivalence and perfect-constructibility used by Yang–Zhao §6.4.
- **So:** import H1's matching valuation specializations with comparison maps, and keep the broader ULA, oriented-topos and modification theorem as an extension. **A14 and A07 are not re-marked as supplied by H1.**
- **Both briefs stay inactive** while their papers' overall verdict is revise.

### State on main (1b1aeb19)

- **Unchanged since 2026-09-23.** ABE-25 route 5 and YANG-ZHAO-25 route 4 are individually accepted but inactive.
- **ABE-25 route 5 brief:** "Import the actual trait RΨ/RΦ and strict-local Milnor-fiber API from … LPV.0, constructible coefficients from EtaleDualityAndPerverseSheaves:EDC.0 and enhancement from EnhancedDerivedSheaves:E1. First prove continuity of Hom and bounded constructible derived categories over affine inverse limits of coherent schemes with Noetherian coefficients."
- **YANG-ZHAO-25 route 4** imports LPV.0, EDC.0 and E0–E3. Neither route names L2 or H1.
- **L2's text** (unchanged): "First develop noetherian approximation: limits of schemes with affine transition maps, finite-presentation descent of morphisms and diagrams, eventual recognition of the relevant properties, and étale/cohomological continuity … Missing approximation, schematic closure, compactification and derived-coefficient lemmas are owned here." L2's reviewed decomposition has one node, on Nagata factorisation, and none on continuity.
- **H1:valuation-nearby-cycles:** "Define `RΨ_L(F)=i*Rj*j*F` … Prove 4.2.4: for a Cartesian change of valuation bases the actual base-change map is an isomorphism for torsion F whose torsion is prime to the residue characteristic exponent at s. Prove 4.2.5: if X/S is locally finite type, B is noetherian and annihilated by an integer invertible in k(s), and F is constructible over B, each `R^nΨ_L(F)` is constructible."
- **H1:valuation-exports** derives 4.2.6–4.2.9.
- **Abe arXiv v2, read.**
  - Lemma 1.4 (pp. 4–5): "Assume that Λ is a noetherian ring. Let I be a (small) filtered category, and consider a functor X• : I^op → Sch_coh … Assume that for any morphism i → j, Xj → Xi is affine. … We have a canonical equivalence ρ: 2−lim D^b_c(Xi, Λ) ∼→ D^b_c(X∞, Λ)." Full faithfulness is proved "for any F ∈ D^−_c(Xi) and G ∈ D^+(Xi)", by [SGA 4, IX, 2.7] and [SGA 4, VI, 8.7.9].
  - Theorem 1.5 (p. 5): Λ finite with p invertible, S coherent with finitely many irreducible components, f of finite presentation, and F f_U-universally locally acyclic. Its proof (p. 6) uses Orgogozo's Theorems 2.1, 7.1 and 8.1, oriented topoi, Gabber XI 2.3.2, and "[HS, Thm 4.1]".
- **Yang–Zhao §6.4 (p. 46)** uses "[12, Corollary 3.10 and Theorem 4.1]" and "[12, Corollary 4.2]", Hansen–Scholze, for the absolutely integrally closed base.
- **The graph:** LPV.0 → H1:valuation-nearby-cycles already, and there is no path between L2 and LPV.0 in either direction.

### Fix

**Edits to `PAPER-ABE-25.result.json`** (proposals, applied on revision).

1. **Route 5, `items`:** remove "PAPER-ABE-25/A10" and "PAPER-ABE-25/A11".
2. **`routes`: append route 7**, which extends L2 by Abe's lemma as a source:
   ```json
   {"route": "source", "roadmap": "AdicCoefficientsAndComparisons",
    "stages": ["AdicCoefficientsAndComparisons:L2"],
    "items": ["PAPER-ABE-25/A10", "PAPER-ABE-25/A11"],
    "reason": "L2 owns noetherian approximation, étale/cohomological continuity and the derived-coefficient lemmas for limits of qcqs schemes with affine transition maps. Abe's Lemma 1.4 (arXiv v2 pp. 4–5; published pp. 609–610) is such a lemma: for a Noetherian ring Λ, a small filtered I and X• : I^op → coherent (qcqs) schemes with affine transition maps, colim_j Hom(π_j^*F, π_j^*G) ≅ Hom(π_∞^*F, π_∞^*G) for F ∈ D^−_c, G ∈ D^+, and 2-colim D^b_c(X_i, Λ) ≃ D^b_c(X_∞, Λ). It reduces to the étale cohomology continuity L2 plans. The general-bases Part II imports it from L2 (RT-AREA-etale/15)."}
   ```
   The items stay `missing`: a source route adds Abe as a source of L2's blueprint through `ADDED_SOURCES`.
3. **Route 5, `brief`:** replace "First prove continuity of Hom and bounded constructible derived categories over affine inverse limits of coherent schemes with Noetherian coefficients." with
   > Import from AdicCoefficientsAndComparisons:L2 its noetherian approximation for limits of qcqs schemes with affine transition maps, its étale/cohomological continuity and Abe's Lemma 1.4 (A10–A11, routed to L2 by route 7), with their hypotheses: Λ Noetherian, I small filtered, affine transition maps, F ∈ D^−_c and G ∈ D^+ for Hom continuity. Do not prove them again here.

   Then, after "…construct the absolute-integral-closure extension Rj*Fξ with constructibility, finite Tor and ULA proofs.", insert:
   > Import ClassicalAdicEtaleCohomology H1:valuation-nearby-cycles and H1:valuation-exports (RΨ over valuation bases, Huber 4.2.4–4.2.9, under their torsion and finiteness hypotheses) and prove the comparison maps. Over the spectrum of a valuation ring with generic point η and closed point s (in particular an absolutely integrally closed one), the restriction to X_s of Rj_*F_η is H1's RΨ_L(F) for the quadruple (X, S, η, s), compatibly with H1's base-change maps. These specializations do not give Theorem 1.5 over an arbitrary absolutely integrally closed coherent base, nor its ULA and finite-Tor conclusions, which stay here as an extension: oriented-topos points, Orgogozo's goodness and modification, and descent along surjective maps of coherent schemes.
4. **Item A14, `note`** (none now): set to
   > Not supplied by ClassicalAdicEtaleCohomology H1 (RT-AREA-etale/15). Over a valuation-ring base, H1's RΨ_L gives base change (Huber 4.2.4) and degreewise constructibility (4.2.5). The route must compare E with it there, but constructibility, finite Tor and ULA over the normalization of an arbitrary integral coherent base are proved here.
5. **The item edits already listed**, with the report's route table: A10 and A11 are now routed by route 7.

**Edits to `PAPER-YANG-ZHAO-25.result.json`** (proposals, applied on revision).

6. **Route 4, `brief`:** replace "and Enhanced derived categories of sheaves (EnhancedDerivedSheaves:E0–E3) for the actual enhancement." with
   > Enhanced derived categories of sheaves (EnhancedDerivedSheaves:E0–E3) for the actual enhancement, AdicCoefficientsAndComparisons:L2 for continuity over affine inverse limits (Abe's Lemma 1.4, routed there), and ClassicalAdicEtaleCohomology H1:valuation-nearby-cycles and H1:valuation-exports for RΨ over valuation bases.
7. **Item A07, `note`** (none now): set to
   > Not supplied by ClassicalAdicEtaleCohomology H1 (RT-AREA-etale/15). Comparison obligation: over S = Spec V, V absolutely integrally closed, the restriction of Rj_*F to X_s is H1's RΨ_L(F), and H1's 4.2.4–4.2.5 give base change and degreewise constructibility of R^nΨ under H1's hypotheses. The Hansen–Scholze equivalence D_ULA(X/S) ≃ D_cons(X_η), perfect-constructibility and the flat base change, duality and product compatibilities are not in H1 and are proved here.

**Stage links.** All three go into the draft LefschetzPencilsAndVanishingCyclesPartII:
- AdicCoefficientsAndComparisons:L2 → Part II;
- ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles → Part II;
- ClassicalAdicEtaleCohomology:H1:valuation-exports → Part II.

The cycle test gives "acyclic (no path LefschetzPencilsAndVanishingCyclesPartII → …)" for each. The Part II is not a stage and has no out-edges.

### Not done, and why

- **The red team would have moved A11 to L2 and re-marked A10 planned there.** Here both go to L2 by a source route instead. L2's text names continuity and "derived-coefficient lemmas" but not the D^b_c 2-colimit itself. A `planned` status would claim more than L2 states; a source route asks L2's blueprint to plan it.
- **A14 and A07 are not re-marked**, following the verifier's narrowing.
- **Huber 1996 was not read**: no public copy. The H1 contents are quoted from the stage text.
- **ABE-25's review must accept route 7** before it takes effect.

## /16 (medium, error): Zhu's perfect-space coefficients become a Part II

### What the verifier corrected
- **What Zhu does.** A.3.1–A.3.3 (arXiv v3 pp. 54–55) move coefficients and operations through finite-type models to separated pfp perfect algebraic spaces. §2.2 (2.2.10), p. 24, applies Braden's theorem to a model.
- **Scope.** Both lie outside EDC's scheme scope. Equivariance is a further boundary.
- **Route kind.** Route 7 is accepted, but under §16 its extension needs Part II layers, not a blanket source route to EDC.0–7.
- **Reuse:**
  - GS0:Witt-geometry's perfect-space carrier and L2's invariance;
  - finite-level equivariant descent, shared with the stack extension;
  - in-scope model results, kept as imports.
- **Hyperbolic localization** carries its G_m-monodromic hypothesis.
- **Keep the A.3 gates.** The normalization and connected-kernel proof gates stay. The wrong route kind does not license correcting or claiming those proofs.

### State on main (1b1aeb19)
**PAPER-ZHU-17** (unchanged since 2026-09-23; verdict accept). Route 7 is `source` to EDC.0, EDC.1:adjoint, EDC.1:biduality, EDC.2:trace-purity, EDC.3–EDC.7, with 21 items. Its reason:
> "Extend the shared ordinary coefficient/duality/perverse theory to perfect models and finite-level equivariance. … The A.3 orientation problem remains a proof gate."

- Review route 7: "accept … own this".
- The source is arXiv:1407.8519v3 (Annals 185 (2017)). Checked: arXiv:1603.05593 is Zhu's separate lecture notes, *An introduction to affine Grassmannians and the geometric Satake equivalence*.
- **Gates recorded in the extraction:**
  - E25: IC normalization, A.3.1 (Zhu's "Q̄_ℓ[2 dim X](dim X)" should be Q̄_ℓ[dim X]).
  - E26: a scalar c_X needs geometric irreducibility.
  - E27: c_X depends on the model up to p^ℤ; confirmed by REV-PAPER-ZHU-17.
  - E71: J₁ must be connected. A.3.5 last paragraph omits it, while (A.3.4) assumes it (arXiv v3 pp. 56–57).
  - E09: the source gate for Braden/Drinfeld–Gaitsgory.
  - E34: Proposition B.1 is stated without proof.

**GS0:Witt-geometry:** "Use Zhu §§1.1–1.4 and Appendix A for the perfect-space carrier and its relation to finite-type models".

**L2:** "Pass to perfections through the proved invariance theorem."

**Coupling with route 6.** Route 6 items B02 and B03 (Proposition B.1, → GS0:Witt-geometry) use E06, E13 and E14. Left there, GS0:Witt-geometry would consume the new Part II, which imports it: a cycle.

**Hyperbolic localization.** Its only plans are for diamonds and v-stacks (VS1; the GS1 node). No stage plans scheme-level Braden. Neither library has perfect schemes under AlgebraicGeometry. The only hits for "perfect" there are the perfect-field smooth-locus lemmas, Mathlib Morphisms/Smooth.lean:333 and :352.

**Pending.** RT-PAPER-ZHU-17 is pending.

### Fix
**PAPER-ZHU-17.result.json**

1. **Route 7 becomes the Part II.**
   - `route` → `part-ii`; `parent` `EtaleDualityAndPerverseSheaves`; `roadmap` `EtaleDualityAndPerverseSheavesPartIIPerfectEquivariant`; `area` `etale`.
   - `title`: "Étale duality, cycle classes and perverse sheaves, Part II: perfect schemes, equivariant coefficients and hyperbolic localization".
   - Remove `stages`, `imports` and `suggestedLeanFile`.
   - `items`: the 21 current items minus E06 and IC-stalk-parity, plus B02 and B03.
   - `reason`: "EDC's principal category is finite-type schemes over a field; pfp perfect spaces, perfect-group equivariance and hyperbolic localization need new layers (§16; RT-AREA-etale/16, confirmed)."
   - `brief`:
   > Extend Étale duality, cycle classes and perverse sheaves (EtaleDualityAndPerverseSheaves) in three directions: to separated pfp perfect algebraic spaces over a perfect field k of characteristic p, to equivariant coefficients for perfect group schemes, and to hyperbolic localization. The source is Zhu, Affine Grassmannians and the geometric Satake in mixed characteristic (arXiv:1407.8519v3), Appendix A.3 (pp. 54–57) and (2.2.10) (p. 24).
   >
   > **PE.0 Coefficients through models.** For a separated pfp perfect algebraic space X with a model ε: X → X':
   > - ε^*: D_c^b(X', Q̄_ℓ) ≃ D_c^b(X, Q̄_ℓ): ε_* (A.3.1);
   > - the six operations through models (Proposition A.17);
   > - proper and smooth base change for perfectly proper and perfectly smooth maps;
   > - Verdier duality, perverse sheaves, intermediate extension and IC_X.
   >
   > Gate E25: on a perfectly smooth open, IC_X is Q̄_ℓ[dim X].
   >
   > **PE.1 Classes.**
   > - Chern classes, and characteristic classes c(E): R_{G,ℓ} → H^*(X_k̄, Q̄_ℓ) of torsors (A.3.2, Remark A.33). Where X is a scheme, import AP.0's general-base Chern classes (ILO XVI §1 holds on any ℤ[1/ℓ]-scheme); otherwise pass through models (Remark A.33).
   > - c_X, Borel–Moore homology, [X] and cl(Z) (A.3.3).
   >
   > Gates E26 and E27: a scalar c_X needs geometric irreducibility, and it depends on the model up to p^ℤ. Either fix a model or carry the ambiguity. Zhu's model-independence claim is not asserted.
   >
   > **PE.2 Trace functions** and the proper-pushforward trace formula through a model (A.3.4, gate E28), importing the upstream TraceFormula.
   >
   > **PE.3 Equivariant coefficients.** For an affine pfp perfect group J acting on X:
   > - P_J(X) (A.3.5).
   > - P_J := P_{J/J₁} and H^*_J := H^*_{J/J₁}, for a closed normal J₁ of finite codimension acting trivially, where J₁ is the perfection of a pro-unipotent group. These are independent of J₁ only for connected J₁ (gate E71).
   > - (A.3.3)–(A.3.6) and equivariant cohomology by finite approximations, transported through models from the stacks Part II's ST.4, not reproved.
   >
   > **PE.4 Hyperbolic localization.** For a G_m-action on a finite-type algebraic space Z over a field, with fixed locus, attractor and repeller: the map between the two hyperbolic restrictions is an isomorphism on G_m-monodromic complexes. These form the subcategory generated by pullbacks from Z/G_m. Source: Drinfeld–Gaitsgory, arXiv:1308.3786v4, Theorem 3.1.6 (p. 26, for D-modules) and §0.4 (p. 5, for constructible Q̄_ℓ-sheaves over any field).
   >
   > The monodromic hypothesis is part of every statement. Drinfeld–Gaitsgory only say the ℓ-adic proof goes through "with modifications". That adaptation, or Braden's original proof, must be written out first (gate E09). Then (2.2.10) follows through a model.
   >
   > **Also here, as tests:** the semismall-map lemma [MV07, 4.3] on perfect spaces, and Proposition B.1 (B02, B03), which is unproved in the source (gate E34).
   >
   > **Imports:**
   > - GeometricSatakeAndFusion GS0:Witt-geometry (the carrier and models, G05);
   > - AdicCoefficientsAndComparisons L2 (passage to perfections), and the étale-site invariance under perfection (ZHU-17/A09, planned at SF.0);
   > - EDC.0–EDC.7 on models (E06 stays with EDC.7);
   > - the stacks Part II, ST.3–ST.4.
   >
   > **Consumers:** GeometricSatakeAndFusion GS1–GS4 (route 8), and the Part IIs of routes 15 and 18.
   >
   > **Tests:** (P¹)^{p^{−∞}} and its Frobenius (E27), and the semi-infinite orbits S_λ, S_λ^− of (2.2.10).
2. **New route 19.**
   ```json
   {"route": "source", "roadmap": "EtaleDualityAndPerverseSheaves", "stages": ["EtaleDualityAndPerverseSheaves:EDC.7"],
    "items": ["PAPER-ZHU-17/E06"],
    "reason": "The decomposition theorem for proper maps of the finite-type models is EDC.7's, with its purity hypotheses; the perfect-space transport is the Part II's (route 7)."}
   ```
3. **Route 8.** Add `PAPER-ZHU-17/IC-stalk-parity` to `items`. It is Satake geometry of Gr, used by S02 and Corollary 2.9, not sheaf theory.
4. **Route 6.** Remove B02 and B03 from `items` (the cycle reason above).
5. **Notes of E01–E05 and E07.** Replace "and its source route extends the same owner" with "and it is routed to the perfect-scheme Part II, which imports the finite-type theorem from EDC".
6. **PAPER-ZHU-17.review.json.**
   - Route 7 changes kind, so its verdict needs a fresh decision (see "Review verdicts" at the top). If it is kept, append to its reason "Converted to a Part II by the RT-AREA-etale fix (finding /16)."
   - Route 19 needs a verdict (see "Review verdicts" at the top). The entry to record, if the maintainer accepts it: `{"route": 19, "verdict": "accept", "reason": "Added by the RT-AREA-etale fix: E06 is in EDC.7's scope."}`.

**Links and pointers**

7. **GeometricSatakeAndFusion README, GS0:Witt-geometry.** After "a perfect scheme need not itself be finite type." add:
   > " The ℓ-adic sheaf theory of Zhu's Appendix A.3 on these spaces is EtaleDualityAndPerverseSheaves, Part II (perfect schemes), which imports this carrier."
8. **Link** PE → GeometricSatakeAndFusion:GS1, for the maintainer.
   - **Cycles.** In the assembled atlas, GS1, GS2:correspondences, GS2:Satake-closure, GS4:rational-reductivity, GS4:integral-dual-group and GS0 reach none of the Part II's imports (GS0:Witt-geometry, L2, SF.0, SF.1, EDC.0–EDC.7, E2–E3, DWP.7, DWP.9, RG2.2, RG2.4). So the link is acyclic.
   - **GS1** should import PE.0 for its "transport through perfection", rather than rebuild it.

### Not done, and why
- **The gates** E25, E26, E27, E28, E34, E71 and E09 are carried, not closed.
- **Published pagination.** I read Zhu's arXiv v3, not the published Annals PDF. The extraction's page locators are to the published version.
- **Braden's 2003 paper** was not read.
- **IC-stalk-parity to route 8** (edit 3) is my judgement. The finding did not name it.

## /17 (medium, error): the coarse edge L3 → EDC.6 is added and the integration gap closed

### What the verifier corrected
- The fine supplier links already exist, so this is graph and record consistency only.
- Add the coarse L3 → EDC.6 stage dependency.
- Close only that integration gap.
- L4 and H5 already reach EDC.6. Do not duplicate them.

### State on main (1b1aeb19)
**data/atlas.json** (last changed 2026-09-16). `EtaleDualityAndPerverseSheaves:EDC.6` `requires`:
> `["AdicCoefficientsAndComparisons:L2", "AdicCoefficientsAndComparisons:L5", "AdicCoefficientsAndComparisons:L6", "DerivedDeRhamCohomology:DD.1", "EtaleDualityAndPerverseSheaves:EDC.1", "EtaleDualityAndPerverseSheaves:EDC.2", "EtaleDualityAndPerverseSheaves:EDC.3", "EtaleDualityAndPerverseSheaves:EDC.5", "UPSTREAM:CohomologicalPointCounting:ComplexComparison:10-12", "UPSTREAM:CohomologicalPointCounting:EllAdicRealization:0-10"]`

**Assembled graph.**
- Accepted RS-05 adds H5 → EDC.6.
- A path search finds L4 → L6 → EDC.6.
- L3's only consumer is VS3. There is no path L3 → … → EDC.6.
- The node links `L3/full-faithfulness-27-2` and `L3/rf-shriek-comparison-27-4` → `EDC.6/scheme-adic-diamond-operation-comparisons-index` exist.

**data/decompositions/EtaleDualityAndPerverseSheaves.json** (2026-09-16). Its `gaps` has the entry "Integration consequence: three of this packet's supplier links are not yet stage edges", whose detail ends:
> "ORCHESTRATOR DECISION: add the three edges, or widen EDC.6's requires list, or route the L3/L4/H5 material through L2/L5/L6."

### Fix
1. **data/atlas.json.**
   - Add `"AdicCoefficientsAndComparisons:L3"` to EDC.6's `requires`.
   - Add `"EtaleDualityAndPerverseSheaves:EDC.6"` to L3's `consumers`.
   - Add the stageEdges record `{"source": "AdicCoefficientsAndComparisons:L3", "target": "EtaleDualityAndPerverseSheaves:EDC.6"}`.
   - Cycle test for AdicCoefficientsAndComparisons:L3 → EtaleDualityAndPerverseSheaves:EDC.6: acyclic (no path EDC.6 → L3).
   - The verifier checked this edge together with /23's SF.2 → L1 and found the union acyclic.
2. **data/decompositions/EtaleDualityAndPerverseSheaves.json.** Delete the `gaps` entry titled "Integration consequence: three of this packet's supplier links are not yet stage edges". The other two gaps (BBD OCR; SGA 4 XVIII unread) stay. Its resolution, recorded here:
   - L3 → EDC.6 is added by edit 1.
   - L4 reaches EDC.6 through L6.
   - H5 → EDC.6 is RS-05's link.
   - No L4 or H5 proof is duplicated.

### Not done, and why
- Nothing is left. The EDC README already says "Through AdicCoefficientsAndComparisons L2–L6".

## /18 (medium, error): LPV.2's odd-dimensional Picard–Lefschetz formula has no supplier for its transcendental input

### What the verifier corrected
- LPV.2 calls the complex comparison optional but demands an algebraic proof; its own decomposition records the transcendental input as unclosed.
- SGA 7 II XV 3.3.3–3.3.6 and the proof (A)–(C) (pp. 191–193) invoke XIV 2.1, XIV 3.2.11 and a cup-product/trace compatibility, then transfer the local model to other characteristics.
- **Choose one route and source-close it:** either make the complex comparison and the topological calculation required, or add Illusie's algebraic route with its early local semistable input.
- Do not connect the downstream LPV.7 back to LPV.2.
- The two-component prefix still needs the 2002 proof read and closed; citing Illusie's survey is not enough. Illusie 2021 §6.1 (p. 103) confirms the algebraic proof uses Rapoport–Zink, and the erratum corrects |i| > −1 to |i| > 1 at p. 251.

### State on main (1b1aeb19)
- **LPV.2 text.** `content/campaign/LefschetzPencilsAndVanishingCycles/README.md`, LPV.2, still says "Sources: SGA 7 II XII–XV; Deligne I 4.1–4.4. The complex Milnor-fiber comparison is an optional verification through PR196 ComplexComparison and SGA 7 XIV; the all-characteristic algebraic proof may not assume a characteristic-zero lift of every degeneration."
- **LPV.2 has no complex-comparison ancestor.** It requires EDC.2, EDC.3, EDC.4, LPV.0, LPV.1 and ArithmeticGaloisRepresentations:R01.2. Among its 92 ancestors there is no ComplexComparison node; PR196 ComplexComparison enters the atlas only as external `UPSTREAM:CohomologicalPointCounting:ComplexComparison…` ids, which LPV.5, EDC.6 and WC.4 use.
- **Nothing in the atlas plans the transcendental side.** No stage plans SGA 7 XIV (Betti nearby cycles, the comparison theorem, the topological formula).
- **The decomposition gap is open.** `data/decompositions/LefschetzPencilsAndVanishingCycles.json` (unchanged since 16 September) keeps the gap "Transcendental inputs XIV 2.1, XIV 3.2.11 and the compatibility caveat" on node `LPV.2/odd-relative-dimension-picard-lefschetz-3-3`.
- **The pending LPV.0 packet carries the same gap.** Packet `LefschetzPencilsAndVanishingCycles--LPV.0` (BP job, checkpoints 1–3 committed 29 September, #3940/#3947/#3951) plans SGA 7 XII, XV §§1–2 and Weil I §4. Its LPV.2 coverage says: "the mixed-characteristic step (C) and XIV 2.1/3.2.11 are not read, and λ_X of XV 2.2.5 F is fixed only through them".
- **No other route or job exists.** No pending proposal chooses a route. LPV.7:semistable-curves is downstream of LPV.2.

### Fix

**The route: the complex comparison is made required.** Illusie's algebraic route is not taken, for three reasons.
- **The 2002 paper could not be read.** Illusie, "Sur la formule de Picard–Lefschetz", Adv. Stud. Pure Math. 36 (2002) 249–268, DOI 10.2969/aspm/03610249 (checked on Crossref).
  - Illusie's Orsay page lists only the erratum (ErrPL.pdf).
  - Project Euclid refused automated access.
  - No other public copy was reachable.

  The verifier requires that proof to be read and closed before the prefix is planned.
- **Its local input is heavier than stated.** Illusie 2021 §6.3 (p. 104) says that Rapoport and Zink had to prove the absolute-purity input for the semistable model. The two-component prefix would therefore bring purity for regular pairs in mixed characteristic ahead of LPV.2.
- **The complex route can be closed from public sources.** SGA 7 II (public, IAS) was read at every step the proof uses. It is also the proof the LPV.0 packet already follows, since its λ_X is fixed through XIV.

**1. New stage `LefschetzPencilsAndVanishingCycles:LPV.2:transcendental`.** It is a prefix consumed only by LPV.2. Insert it in the README immediately before "## LPV.2.":

> <a id="stage-LPV.2:transcendental"></a>
> ### LPV.2:transcendental — The transcendental comparison and the complex Picard–Lefschetz formula
>
> LPV.2 imports this prefix for the odd-dimensional formula, following SGA 7 II XV 3.3.5 (A)–(E). Prove:
> 1. **The transcendental nearby-cycle formalism (SGA 7 XIV §1).** For f : X → S separated of finite type, S a smooth complex curve and 0 ∈ S(ℂ), construct RΨ_cl : D(X_cl, Λ) → D((X₀)_cl × 𝔇, Λ) over a small disc, with the sign conventions for π₁ of the punctured disc (XIV 1.1) and the variation.
> 2. **The comparison theorem (XIV 2.2–2.8, pp. 132–134, which XV cites as "XIV 2.1").** The morphisms c : ε*RΨ(K) → RΨ_cl(ε*K) and c_η are isomorphisms for K with constructible cohomology sheaves, Λ a noetherian torsion ring (Théorème 2.8).
>    - Its proof reduces, by the dévissages of XIII 2.3.1, to X regular, f⁻¹(0) a normal-crossings divisor and F = ℤ/ℓ, and compares I 3.3 with its transcendental analogue. These are inputs of this stage.
>    - For XV 3.3.5 (A) only the standard model f = Σ_{i=1}^{n+1} z_i² is needed. A direct proof of the comparison for that model is acceptable.
> 3. **The complex Picard–Lefschetz formula (XIV 3.2.1–3.2.11, pp. 146–151).** For f = Σ_{i=1}^{n+1} z_i² on ℂ^{n+1}, with Milnor fibre V in the box B_{a,b} and interior V°:
>    - H̃ⁿ_c(V°) ≅ ℤ, generated by the vanishing cycle δ;
>    - H̃ⁿ(V) ≅ ℤ, dual to it, and the other reduced groups vanish;
>    - Var(x) = −(−1)^{n(n−1)/2}(x·δ)δ and (δ, δ) = (−1)^{n(n−1)/2}(1 + (−1)ⁿ);
>    - T(δ) = (−1)^{n+1}δ, with the n mod 4 table;
>    - the conventions are the orientation ε′ and the trace given by integration (3.2.10).
> 4. **The compatibility SGA 7 does not prove.** XV p. 193 notes that the comparison isomorphism of item 2 must be checked against cup products and traces ("en toute rigueur, il faudrait avoir vérifié une compatibilité …"). Prove it; it is not assumed.
> 5. **The reduction to ℂ.** XV 3.3.5 (A) reduces an algebraically closed field of characteristic 0 to ℂ ("principe de Lefschetz"). Prove this reduction, including the invariance it uses.
> 6. **Non-torsion of δ_x (XV 3.3.7, step (D)).** Prove it by the purely transcendental variant SGA 7 XIX n° 4, which "ne dépend que de XIV 3.2" (p. 194). The alternative through Lefschetz pencils (XVIII 6.6.1) would make LPV.2 depend on LPV.4, which consumes LPV.2.
>
> Imports: LPV.0 (the algebraic RΨ), LPV.1 (variation and the tame character), and PR196 ComplexComparison for the étale–Betti comparison of separated finite-type ℂ-schemes with finite coefficients.

Stage record in `data/atlas.json`: `requires` = [`LefschetzPencilsAndVanishingCycles:LPV.0`, `LefschetzPencilsAndVanishingCycles:LPV.1`, `UPSTREAM:CohomologicalPointCounting:ComplexComparison`]; consumer LPV.2. The external id is the one LPV.5 and WC.4 already use. The maintainer names the PR196 layer that proves Artin's comparison: that roadmap is not in this repository and was not read.

**2. LPV.2.**
- **Edge.** Add `LefschetzPencilsAndVanishingCycles:LPV.2:transcendental` to LPV.2's `requires`. LPV.2 is not an ancestor of LPV.0 or LPV.1 (a path search finds no path), and the external node has no prerequisites, so the new stage closes no cycle. LPV.7 is untouched.
- **Text.** Replace "The complex Milnor-fiber comparison is an optional verification through PR196 ComplexComparison and SGA 7 XIV; the all-characteristic algebraic proof may not assume a characteristic-zero lift of every degeneration." with:
  > The odd-n formula is proved as in SGA 7 XV 3.3.5–3.3.6 (pp. 191–194), in three steps:
  > - **(A)** the standard model is treated over ℂ through the comparison and the complex calculation imported from [LPV.2:transcendental](#stage-LPV.2:transcendental);
  > - **(B)–(C)** the result passes to the strict henselization of Spec ℤ[T] at (p, T) by XIII 2.4.6.2, local constancy off T = 0 and Abhyankar's lemma;
  > - **(E)** it passes to an arbitrary trait through the henselian local isomorphism with a base change of that model (XV 1.3.2 (i)).
  >
  > Only this local universal model is lifted to characteristic 0; no global degeneration is. Illusie's purely algebraic proof (Sur la formule de Picard–Lefschetz, Adv. Stud. Pure Math. 36 (2002), with the author's erratum: p. 251, l. 18, |i| > −1 should read |i| > 1) is a possible later alternative. It is not planned here.

**3. The LPV.0 blueprint (BP-LefschetzPencilsAndVanishingCycles--LPV.0).**
- Add the new stage to the job's scope in `research/blueprint/queue.json` next to LPV.2.
- Its next checkpoint turns the gap "Transcendental inputs XIV 2.1, XIV 3.2.11 and the compatibility caveat" into nodes of LPV.2:transcendental, or into a request to it.
- It makes `LPV.2/odd-relative-dimension-picard-lefschetz-3-3` depend on those nodes.

### Not done, and why
- **Illusie 2002 was not read**, so the algebraic route is recorded, not planned. Nothing from it is stated except the verified citation and the erratum line, both read.
- **The inputs of XIV 2.8 were not read** (XIII 2.3.1 and SGA 7 I 3.3). They are obligations of the new stage.
- **Every consumer of LPV.2 now inherits the transcendental prefix.** This includes ClassicalAdicEtaleCohomology:H1 and so the diamond chain. H1's text asks LPV.0–2 only for the trait theory; whether H1 should require LPV.2 at all is outside this finding.

## /19 (medium, other): the shared Part II ids: generator repaired upstream, merged briefs for when ABE-25 and YANG-ZHAO-25 activate

### What the verifier corrected

- **The generator collision was real.** The verifier located it at make_queue.py:719–724, 832–842 and 852–860 (baseline eeb25aee). Because Yang–Zhao come after Abe in the registry, the extending brief replaced Abe's.
- **What to do.** Merge briefs, items and provenance for each shared id, and surface the conflicts.
- **It was latent, not active.** `accepted_routes` returns nothing unless the overall verdict is accept, and both reviews are revise.
- **HKW-22/049 stays conditional.** Its import from Abe's generic prefix waits for a valid accepted owner.

### State on main (1b1aeb19)

**The generator was changed on 2026-09-28.** Commit 7685a59f made it "one design job per Part II parent, and per new roadmap"; commit 4d2c057a made it "quote a proposal's brief briefly and point to the full brief"; commit 2b93a6ff followed. The current `research/blueprint/make_queue.py`:
- `accepted_routes`, lines 390–401. Line 398 still returns nothing unless the overall verdict is `"accept"`.
- `paper_designs`, lines 413–448:
  - lines 423–424 group calls by `("part-ii", route["parent"])` (by `route["roadmap"]` for new roadmaps);
  - line 427 takes the area as the most common route area;
  - lines 430–431 list every proposal as its title, paper, item count and the first 500 characters of its brief, then "Full brief and items: research/blueprint/papers/<paper>.result.json, the route to <roadmap>";
  - line 447 appends one `DESIGN-<parent>PartII` job, or PartIII if the atlas already has the Part II.
- `add()`, lines 796–802. It still keys one prompt per job id, but job ids are now one per parent.
- The design loop is at lines 916 (collecting calls), 925 (skipping the fixed designs) and 926–940.

**Regression tests.** `tests/test_papers_queue.py` (class `PaperDesigns`) has `test_every_part_ii_proposal_for_one_parent_is_one_design`, `test_a_long_brief_is_quoted_briefly_and_pointed_to` and `test_a_new_roadmap_several_papers_call_for_is_one_design`.

**A simulation.** I ran the current `paper_designs` on these proposals with ABE-25 and YANG-ZHAO-25 marked accepted:
- `DESIGN-EtaleDualityAndPerverseSheavesPartII` lists Abe's RelativeTraces (12 items) and Yang–Zhao's RelativeTraces (78 items) as separate entries, each with its own brief opening and full-brief pointer. Nothing is overwritten.
- The same holds for the LPV Part II job (31 and 12 items).
- Two defects remain. The job sees two openings for one continuation, with no marker that they are the same id. And the invalid area `cohomology` takes part in the area vote (see /39).

**The live jobs.** `DESIGN-EtaleDualityAndPerverseSheavesPartII` (#3363) and `DESIGN-LefschetzPencilsAndVanishingCyclesPartII` (#3359) are pending and available, with neither Abe nor Yang–Zhao among their proposals. If they finish before ABE-25 and YANG-ZHAO-25 are accepted, the generator gives these proposals Part III jobs. The route ids and titles "…, Part II: …" then no longer name the job.

**HKW/049:** "The Abe extraction proposes the same generic interface in EtaleDualityAndPerverseSheavesPartIIRelativeTraces (still a proposal); if that is accepted, this item should be imported from it." HANSEN-KALETHA-WEINSTEIN-22 is accept, and route 2 is active in `DESIGN-VStackSheavesAndLisseCategoriesPartII`.

### Fix

**1. Merged briefs.** When ABE-25 and YANG-ZHAO-25 are revised, set the `brief` of both routes of each shared id to the same merged text below. Each route keeps its own `items` and `reason`, so provenance is kept and the design job sees one brief for one continuation.

**EtaleDualityAndPerverseSheavesPartIIRelativeTraces** (ABE-25 route 4, YANG-ZHAO-25 route 3):
> Shared continuation of PAPER-ABE-25 route 4 and PAPER-YANG-ZHAO-25 route 3: one brief for both, each route keeping its own items.
>
> Import:
> - ordinary six operations, duality, purity, cycle classes, blowups and cohomological correspondences from Étale duality, cycle classes and perverse sheaves (EtaleDualityAndPerverseSheaves:EDC.0, EDC.1, EDC.1:adjoint, EDC.2:trace-purity, EDC.3, EDC.4, EDC.8);
> - stable categories, straightening, monoidal enhancement, mates, the generic coefficient functor and the split-detection facts from Enhanced derived categories of sheaves (EnhancedDerivedSheaves:E0, E1, E3, E5:abstract);
> - the generic existing triangulated K0;
> - the scalar perfect trace from GrothendieckEulerFormsPartIIEquivariantTraces.
>
> (1) The generic prefix, owned once here (A01–A03): dualizable objects in a symmetric monoidal 2-category, End(C) and ΩC, the categorical trace, and its symmetric monoidal naturality (Lu–Zheng Definition 1.1, Construction 1.6, Remark 1.9). Coordinate its reusable home with the existing categorical owners without duplicating their carriers.
>
> (2) Construct Corr(S) with proper 2-morphisms and the right-lax symmetric monoidal Grothendieck construction for g_!f^*. Under the Noetherian base and coefficient hypotheses of Lu–Zheng Theorem 2.16, prove the LA/ULA-dualizability criterion and identify the dual with relative Verdier duality. Construct the fixed-locus trace and prove Proposition 2.26 base change. Close these Noetherian-base six-operation and ULA-dualizability interfaces first: ordinary field duality does not suffice.
>
> (3) Abe's application. Use one chosen σ at a time. Normalize the curve alteration to a connected finite cover; A24 is justified without the separate Abe–Gabber refinement. Identify the relative trace target with Λ by nil-invariance and connectedness, and compare with the scalar perfect trace.
>
> (4) Yang–Zhao's additions:
> - generalized transversality c, the diagonal evaluation condition C1, the explicit closed-diagonal defect functor and K_X/Y/S;
> - relative characteristic classes with ULA globally, or uniquely extended across H0/H1 support vanishing;
> - C̃ with coefficients K_X/Y/S under C1 and C3, and only then C^Z with coefficients K_X/S under C2;
> - base change, proper pushforward, independent étale locality in X and Y, and trait specialization with the exact source and target vanishings;
> - the coherent ∞-categorical upgrade of the correspondence construction, importing the generic stable-category, lifting and nine-diagram machinery from EDS;
> - the fibration equality C_X/S = δ^!C_X/Y + C^Z under C1–C3, by either fully recorded proof;
> - the cohomological Milnor formula C^{x} = −dimtot RΦ_x, for a perfect field k of characteristic p > 0, finite local Λ of residue characteristic ℓ ≠ p, separated f : X → a smooth curve, ULA off a closed x, without smoothness of X; and the finite-Z and cohomological GOS formulas;
> - for proper f, ULA off f^{−1}(y): ν_Y^{−1}f^*C̃ = −a_y(Rf_*F), without imposing source C2;
> - finite faithfully free coefficient transport of ULA, transversality, supported non-acyclicity classes and local Milnor descent (Q04–Q07, Q10), preserving the supported factorization. Never multiply a B-valued trace by rank_Λ B, or divide by it: a Λ-linear retraction detects equality even for F₂ → F₄;
> - A14, from J08's smooth-proper trace calculation and J09's integral Whitney/projection calculation after the cycle map, retaining only the global pushed equality.
>
> (5) Import the general-base ULA extension and the local-Fourier identities from the Lefschetz pencils Part II (general bases and local Fourier transforms), not as axioms. Do not import the late Artin theorem or the Saito comparison back into that prefix.
>
> Tests: a point; a disconnected parameter countertest; a nonreduced fixed scheme; F₂ → F₄ for coefficient transport.
>
> Boundaries:
> - Characteristic cycles and polar statements belong to EtaleDualityAndPerverseSheavesPartIIMicrolocal. The cohomological characteristic and non-acyclicity classes above stay here; the comparison cl(cc_X(F)) = C_X/k(F) stays in the microlocal owner.
> - The non-isolated localized-Bloch equality stays conjectural.
> - VStackSheavesLefschetzVerdierPartII (PAPER-HANSEN-KALETHA-WEINSTEIN-22 route 2) imports the prefix A01–A03 only once this continuation is accepted. Its decent-v-stack operations and geometric ULA criterion stay there.
> - Schemes and v-stacks do not acquire a common geometric six-functor theorem from the abstract trace formalism alone.

**LefschetzPencilsAndVanishingCyclesPartIIGeneralBasesFourier** (ABE-25 route 5, YANG-ZHAO-25 route 4; this includes /14 and /15):
> Shared continuation of PAPER-ABE-25 route 5 and PAPER-YANG-ZHAO-25 route 4: one brief for both, each route keeping its own items.
>
> Import:
> - the actual trait RΨ/RΦ and strict-local Milnor-fiber API from LefschetzPencilsAndVanishingCycles:LPV.0;
> - constructible coefficients from EtaleDualityAndPerverseSheaves:EDC.0;
> - the enhancement from EnhancedDerivedSheaves:E0–E3;
> - from AdicCoefficientsAndComparisons:L2: noetherian approximation, étale/cohomological continuity, and Abe's Lemma 1.4 (A10–A11, routed to L2) for Λ Noetherian, I small filtered and affine transition maps;
> - from ClassicalAdicEtaleCohomology H1:valuation-nearby-cycles and H1:valuation-exports: RΨ over valuation bases, with base change (Huber 4.2.4) and constructibility (4.2.5) under their hypotheses;
> - from FiniteFieldsAndCharacterSums FF.2: the Artin–Schreier sheaf L_ψ (FF.2/artin-schreier-sheaf) and the global transform FT_ψ(K) = R pr′_!(pr^*K ⊗ L_ψ(xx′))[1] (FF.2/fourier-deligne-transform);
> - only the early geometric numerical/projective Swan and torsion scalar-extension prefix of ArithmeticGaloisRepresentationsPartIIGeometricArtin (PAPER-ABE-25 B21, B03, B06, B07), never its late Artin theorem;
> - the equivariant perfect-trace/tensor prefix of GrothendieckEulerFormsPartIIEquivariantTraces.
>
> Retain the existing modular K0 and decomposition interfaces.
>
> (1) General bases.
> - Define goodness and strict-local cohomological properness after Orgogozo, and transcribe the alteration and modification theorems with their full hypotheses.
> - Construct nearby cycles for a geometric specialization (Yang–Zhao §3.16) and prove the applicable goodness, constructibility and base-change results.
> - Compare with H1: over a valuation-ring base with generic point η and closed point s, the restriction to X_s of Rj_*F_η is H1's RΨ_L(F) for the quadruple (X, S, η, s), compatibly with H1's base-change maps.
> - Huber's valuation results do not give the following, which stays here:
>   - the absolute-integral-closure extension E = Rj_*F_ξ over the normalization of an integral coherent base in an algebraic geometric generic point, with constructibility, finite Tor and ULA (oriented-topos points, Orgogozo's modification, descent along surjective maps of coherent schemes);
>   - the Hansen–Scholze equivalence D_ULA(X/S) ≃ D_cons(X_η), with inverse Rj_* and perfect-constructibility, over an absolutely integrally closed valuation ring (A07);
>   - Abe's Theorem 1.5 exactly, by descending the complex, the open identification and the chosen endomorphism. Its hypotheses: Λ finite with p invertible; S coherent with finitely many irreducible components; f of finite presentation; F f_U-universally locally acyclic; σ an S-endomorphism; α : σ_U^*F → F. Its conclusion: a surjective alteration T → S and a universally locally acyclic extension (G, β).
> - Do not assume f proper, and do not extend to a simultaneous coherent G-action without proof.
> - Treat the finite-cover refinement as a separate Abe–Gabber input. Yang–Zhao's finite integral cover of the parameter curve (A06) follows Abe's argument, which they cite as "[3, Lemma 1.5]": it is Theorem 1.5 of Abe arXiv v2.
>
> (2) Coefficients. In the perfect characteristic-p, finite-local setting, when Λ lacks a nontrivial ψ : F_p → Λ^×:
> - enlarge to B = R_q, with R = Λ[T]/(Φ_p) and q a maximal ideal, importing the pinned monic power basis, Artinian-localization surjectivity and finite-flat local freeness (Q01);
> - prove the nearby-cycle coefficient comparison and invariance of the integer Swan and total dimensions (Q08–Q09). The extension degree need not be prime to ℓ.
>
> (3) Local Fourier transforms.
> - From the imported L_ψ, form the product kernels L_ψ(f t′) and L_ψ(t/t′) and their zero extensions, distinguishing j_! at infinity from j_*.
> - Define Laumon's local Fourier functors F^{(0,∞′)}, F^{(∞,0′)} and F^{(∞,∞′)} (Laumon 1987 Définition 2.4.2.3). Prove concentration in degree one (Proposition 2.4.2.2), exactness, and the rank and Swan formulas (Théorème 2.4.3).
> - Prove the precisely normalized global–local comparison. For K perverse on A¹, with FT_ψ normalized as in FF.2 (Laumon Définition 1.2.1.1, r = 1), Laumon's Proposition 2.3.3.1(iii) identifies the generic stalk at ∞′ of the lisse part of FT_ψ(K), as a G_∞′-module, with ⊕_{s∈S} Ind^{G∞′}_{G_{s×∞′}} R^{−1}Φ(pr̄^*(α_!K) ⊗ L̄(x.x′)[1])_{(s̄,∞̄′)} ⊕ R^{−1}Φ(…)_{(∞̄,∞̄′)}. Lemme 2.4.2.1 identifies these stalks with the local transforms of the local monodromy, after π ↦ x (resp. 1/x), π′ ↦ 1/x′ and the shift [2]. Yang–Zhao's L_!(t/t′) at (0, 0′) and Abe's L(f t′) at ∞′ are this kernel with t′ = π′ = 1/x′.
> - Then prove, in order:
>   - the group-ring-perfect regular Fourier class;
>   - derived tensor interchange;
>   - finite-to-adic comparisons (a K0 lift, not an exact lift of each modular representation);
>   - the local total-dimension identity −dimtot RΦ_0(F, id) = χ(Ψ_pr2(pr₁^*F ⊗ L_ψ,!(t/t′))_{(0,0′)}) (Yang–Zhao Theorem 6.3);
>   - support at the isolated point, independently of the geometric trace theorem;
>   - and then Abe's Proposition 2.5(2).
>
> (4) The exponential family:
> - ULA of the zero-extended exponential family off the isolated point, and its finite-cover ULA extension, descending both the complex and the open identification (A05–A06);
> - the isolated Fourier stalk reduction by strict-local cohomology, smooth base change, projection against a flat local system and Ψ-goodness, never arbitrary nonproper base change (A08);
> - export these identities to the relative-traces continuation's cohomological Milnor proof.
>
> The late Artin theorem, the Saito comparison and all characteristic-cycle comparisons consume these outputs; never impose a cyclic whole-roadmap prerequisite.
>
> Tests:
> - a full-trait constant sheaf against j_! of its generic restriction, and against punctured-trait zero extension;
> - the degree-one negative Euler sign;
> - regular against augmentation input;
> - finite-level against rational coefficients;
> - reject the nonexistent character F₃ → F₂^×.
>
> Identifying finite-coefficient Swan dimension with the wild-invariant sum before A01/Q09 remains a supplier obligation.

**Conflicts surfaced**, each resolved in the merged text and not silently overwritten:
- **Imports.** The two routes listed different EDC and EDS stages; the merged briefs take the union.
- **Coefficients.** Abe's traces use a torsion Λ with mΛ = 0, m prime to p, over Noetherian bases. Yang–Zhao use a finite local Λ of residue characteristic ℓ ≠ p over a perfect k. The merged brief keeps them per theorem.
- **Boundary with the microlocal continuation.** Abe gives "characteristic-cycle/polar statements" to Microlocal; Yang–Zhao put cohomological characteristic classes in RelativeTraces and Saito's CC in Microlocal. These are consistent once "characteristic class" (cohomological) is kept apart from "characteristic cycle" (on T*X), and the merged brief says so.
- **The finite-cover lemma.** Yang–Zhao cite "[3, Lemma 1.5]" (§6.4, p. 46); in Abe arXiv v2 (§1.5, p. 5) it is a Theorem. The merged brief uses v2's numbering.
- **Kernels.** Abe's L(f t′) at ∞′, Yang–Zhao's L_!(t/t′) at (0, 0′) and Laumon's L_ψ(π/π′) are normalized in (3).
- **Owners.** L_ψ, Hom continuity and valuation RΨ now come from FF.2, L2 and H1 (/14, /15).
- **Items the design job should check at their locators and, if they coincide, plan as one node carrying both ids:**
  - ABE/A19 and YZ/A02 (the kernel);
  - ABE/F10–F11 and YZ/A03 (the local total-dimension identity);
  - ABE/A17 and YZ/A06 (the ULA extension after a finite cover or alteration);
  - ABE/F18 and YZ/A08 (support at the isolated point).

**2. HKW-22/049: no change.** Its status stays `missing` in route 2, and its note already makes the import conditional on Abe's route being accepted. The verifier requires exactly that. The red team's re-marking as planned at RelativeTraces is not done.

**3. Maintainer note on `make_queue.py`.**
- The overwrite is fixed (7685a59f), and its regression tests exist.
- **Residual 1: equal ids are not marked.** Inside `paper_designs` (lines 423–431), sort the members of a parent by `route["roadmap"]`, and when two papers share one, print them as one entry: "<roadmap> (shared by PAPER-A route m, n items, and PAPER-B route k, j items)". Add a test with two papers sharing a roadmap id.
- **Residual 2: the area vote can pick a non-galaxy.** Line 427 can pick a non-galaxy area; see /39.
- **Residual 3: job ids have changed.** Route ids no longer name design jobs (`DESIGN-<parent>PartII`/`PartIII`). The "Part II: …" titles of routes that activate after their parent's Part II is designed will be planned as a Part III.

### Not done, and why

- **The merged briefs are not applied now.** Both papers are revise. The briefs are for their revision.
- **`make_queue.py` is not edited.** It is not a deliverable of this job, and the maintainer's commits already contain the requested repair.
- **The coincidence of ABE F10–F11 with YZ A03** (and the other pairs) was not checked at the source; it is left to the design job.

## /20 (medium, duplicate): henselian comparisons shared between ArcTopologyAndDescent and H1:henselian

### What the verifier corrected
- **The only confirmed overlap is proper GAGA.**
  - Huber 3.2.11 (p. 181) covers a noetherian henselian pair and a proper scheme over Spec A ∖ V(I).
  - Bhatt–Mathew Corollary 6.18 (p. 52) includes that case and refers to Huber 3.2.10.
  - H1:henselian supplies the classical case, and ArcTopologyAndDescent imports and compares it, keeping its own extensions and descent applications.
- **The rigidity theorem is different.** BM 1.18(1), CLAUSEN-MATHEW-MORROW-21/113 and CESNAVICIUS-SCHOLZE-24/029 are the algebraic rigidity theorem RΓ(A, F) ≃ RΓ(A/I, F). Huber 3.2.9 is a different theorem, and RS-05's owner entry does not state the rigidity theorem. Do not re-mark the three as planned at H1 on that evidence.
- **Keep the general Gabber theorem at Arc**, or explicitly extend and source a single common owner. Distinguish its hypotheses from BM's restricted new proof.
- **The non-noetherian variants need their own comparison.** The strongly-noetherian-Tate variant is not transferred automatically from the noetherian example.

### State on main (1b1aeb19)
- **Where the ArcTopologyAndDescent design is.** Only in `research/blueprint/queue.json`: job DESIGN-ArcTopologyAndDescent (pending, order 34) and REV-DESIGN-ArcTopologyAndDescent (pending). Neither `research/blueprint/roadmaps/ArcTopologyAndDescent.json` nor a packet exists. The design prompt is generated from the accepted `new` routes:
  - BHATT-MATHEW-21 route 1;
  - BHATT-SCHOLZE-17 route 17;
  - CLAUSEN-MATHEW-MORROW-21 route 3;
  - CESNAVICIUS-SCHOLZE-24 route 5;
  - GUO-REINECKE-24 route 3.

  All five papers have overall verdict accept, and their result files are unchanged since 23 September.
- **The four items are all `missing` and routed to Arc:**
  - BM/25: "Corollary 1.18(1)", whose note already says Gabber and Huber prove it "without the hypothesis that R be an algebra over a henselian local ring";
  - BM/134: Corollary 6.18;
  - CMM/113, whose note says "Routed with the same statement of the Bhatt–Mathew arc-topology extraction (PAPER-BHATT-MATHEW-21/25)";
  - CS24/029, whose note says "The Bhatt–Mathew extraction already routes this theorem to ArcTopologyAndDescent (its item 25)".

  Those last two notes are wrong: BM/25 carries the extra hypothesis.
- **BM route 1's `reason` still says** "none plans excision, formal glueing, the Gabber–Huber and Fujiwara–Gabber theorems or Artin–Grothendieck vanishing in rigid geometry".
- **What H1:henselian says.** Its text includes "Source: Hub96 3.2.5, 3.2.9–3.2.12". The reviewed decomposition node `H1:henselian/relative-comparison-3-2-9-3-2-12` states Example 3.2.11 with the acceptance item "3.2.11 recovers Fujiwara's theorem with A noetherian henselian along I and X proper over the complement of V(I)".
- **New since the verification (for the worker's attention).**
  - The pending H1 packet `ClassicalAdicEtaleCohomology--H0` (27 September) now has node `H1:henselian/affine-henselian-comparison-3-2-5`. It states the general theorem ((A, I) any henselian pair, F any torsion sheaf, "No noetherian hypothesis") with a public proof, Stacks Theorem 59.82.7 (Tag 09ZI, read). Its sources are Huber 1996 Lemma 3.2.5 and Huber 1993.
  - The same packet also has node `fujiwara-comparison-3-2-11`.
  - Accepted RS-05 keeps "Hub96 3.2.5/3.2.9-12 cohomological comparisons" at H1:henselian (its `layers` entry). Huber's Lemma 3.2.5, as excerpted in the reviewed decomposition, is the general statement.

  So the verifier's second option, a single sourced common owner, now exists in a pending packet. Gabber's theorem is at present planned both there and by the Arc routes.

### Fix
Following the verifier, BM/25, CMM/113 and CS24/029 are **not** re-marked planned at H1. The fix corrects the records and states the ownership rule once.

**1. BM route 1's reason (`research/blueprint/papers/PAPER-BHATT-MATHEW-21.result.json`, route 1, `reason`).** Replace "and none plans excision, formal glueing, the Gabber–Huber and Fujiwara–Gabber theorems or Artin–Grothendieck vanishing in rigid geometry." with:

> and none plans excision, formal glueing, the Fujiwara–Gabber theorem (Theorem 6.11) or Artin–Grothendieck vanishing in rigid geometry. Two classical statements are nearby and are imported or compared, not re-planned:
> - ClassicalAdicEtaleCohomology:H1:henselian plans Huber's Example 3.2.11 (Fujiwara), which is the noetherian case of Corollary 6.18;
> - Accepted RS-05 keeps Huber's Lemma 3.2.5, the Gabber–Huber theorem, at H1:henselian. That theorem stays routed here until its single owner is fixed (RT-AREA-etale fixes, /20).

**2. The design brief.** Edit the identical sentence in the `brief` of BHATT-MATHEW-21 route 1 and of BHATT-SCHOLZE-17 route 17. Replace "the Gabber–Huber affine analogue of proper base change in the stated class of examples," with:

> the Gabber–Huber affine analogue of proper base change in the stated class of examples (Corollary 1.18(1) assumes that R is an algebra over a henselian local ring; the general theorem, for any henselian pair and any torsion sheaf, is Gabber's and Huber's, with a complete public proof in the Stacks Project, Theorem 59.82.7, Tag 09ZI). State that general theorem once. Huber's Lemma 3.2.5 states it, and accepted RS-05 keeps it at ClassicalAdicEtaleCohomology:H1:henselian, where the pending blueprint plans it with the Stacks proof. So either import it from there, or own it in an early stage that H1:henselian can import. Such a stage may not import GeometricSatakeAndFusion:GS0:Witt-geometry or anything else downstream of H1:henselian, since GS0:Witt-geometry already descends from H1:henselian. Corollary 1.18(1) is then a second proof under its extra hypothesis,

Also replace "GAGA for the étale cohomology of proper rigid spaces (their Corollary 6.18)," with:

> GAGA for the étale cohomology of proper rigid spaces (their Corollary 6.18); its noetherian case is Huber's Example 3.2.11, imported from ClassicalAdicEtaleCohomology:H1:henselian together with the identification of X^ad with X ×_{Spec A} Spa(A, A) over the analytic locus. Plan only the case where A is not noetherian but Â_t[1/t] is strongly noetherian, with its own comparison,

**3. Item notes.**
- **BM/134.** Its `note` changes from "The comparison of algebraic and analytic étale cohomology in the proper case, deduced from arc_t-descent." to:
  > The comparison of algebraic and analytic étale cohomology in the proper case, deduced from arc_t-descent. The noetherian case is Huber 1996 Example 3.2.11 (A noetherian and henselian along (t), X proper over Spec A[1/t]), planned at ClassicalAdicEtaleCohomology:H1:henselian; Bhatt–Mathew point to Huber 3.2.10 for a more general statement (p. 52). ArcTopologyAndDescent imports that case and plans only the strongly-noetherian-Tate case, with its own comparison.

  The status stays `missing`, because the second case is not planned.
- **CLAUSEN-MATHEW-MORROW-21/113.** Its `note` changes from "Routed with the same statement of the Bhatt–Mathew arc-topology extraction (PAPER-BHATT-MATHEW-21/25)." to:
  > Gabber's general theorem ((R, I) any henselian pair). PAPER-BHATT-MATHEW-21/25 is Bhatt–Mathew's reproof under the extra hypothesis that R is an algebra over a henselian local ring (Corollary 1.18(1) and footnote 5, p. 6); ArcTopologyAndDescent must state the general theorem, not only the reproof.
- **CESNAVICIUS-SCHOLZE-24/029.** Its `note` changes from "Cited from Gabber, Israel J. Math. 87 (1994), Theorem 1. The Bhatt–Mathew extraction already routes this theorem to ArcTopologyAndDescent (its item 25)." to:
  > Cited from Gabber, Israel J. Math. 87 (1994), Theorem 1. The Bhatt–Mathew extraction routes a restricted reproof of it to ArcTopologyAndDescent (its item 25, which assumes R an algebra over a henselian local ring); the general statement is routed there by this item and PAPER-CLAUSEN-MATHEW-MORROW-21/113.

**4. Link for the maintainer.** ArcTopologyAndDescent is a draft, so this is a link, not a `requires` edit: ClassicalAdicEtaleCohomology:H1:henselian → the Arc stage that proves Corollary 6.18.
- It cannot close a cycle while that stage differs from any Arc stage H1:henselian imports.
- That stage's other imports, such as GS0:Witt-geometry, are either unrelated to H1:henselian or already downstream of it (a path search finds H1:henselian → … → GS0:Witt-geometry).

### Not done, and why
- **The single owner of Gabber's theorem is not chosen here.** The verifier's reason rules out re-marking at H1 on this evidence, and the Arc design does not exist yet. The two pending reviews, REV-ClassicalAdicEtaleCohomology--H0 and REV-DESIGN-ArcTopologyAndDescent, must settle it, using the rule in edit 2. If the H1 node is accepted as the single owner, a later routing correction can re-point BM/25, CMM/113 and CS24/029. Until then Gabber's theorem is planned twice: by that pending node and by the Arc routes.
- **A second overlap is outside the confirmed scope.** BM p. 52 also says their Corollary 6.17 "is equivalent to Huber's affinoid comparison theorem [Hub96, Corollary 3.2.2]", which H1:henselian plans. It is recorded here only.

## /21 (medium, duplicate): de Jong's alterations move to one schematic prefix, L5:alterations, which SF.4, RD.5, AdicSpacesPartII F1 and the prime-to-degree Part II import

### What the verifier corrected

- **One scheme-alteration prefix** carries tasks 1–3, with the exact excellence, finite-type and base-extension hypotheses. Its pointed stable-moduli input comes from finding /4.
- **Descent and the local comparisons stay in L5** as consumers.
- **SF.4 and RD.5 import the geometric theorem** and keep their own applications.
- **Import A0-extension's normalization and other generic geometry only as far as needed.** No new duplicate blowup or compactification theory.
- **The prefix and its dependency graph must be validated here.** Suggested edges may not be assumed valid. In particular, the red team's requirement "L2" is not taken over (see below).

### State on main (1b1aeb19)

The defect is still there. Three things have changed since the verification.

- **L5 plans the alterations and requires the rigid-analytic stages.**
  - Its atlas record (`data/atlas.json`) requires H1, H5, E2, E3, `UPSTREAM:ECD:SCH_BC` and `UPSTREAM:ECD:SCH_SUPPORT_NOETH`, plus RS-05's four H1 substages.
  - Its text: "Prove the forms of de Jong, *Smoothness, semi-stability and alterations*, Theorems 4.1 and 6.5 used by the comparison proof".
  - The README introduction nevertheless says "the purely schematic work L2 and L5 can proceed independently of the diamond six-operation construction".
- **SF.4 still owns alterations.**
  - Its README: "Develop infinitesimal lifting and obstruction complexes; formal schemes, algebraization, semistable reduction and alterations."
  - The accepted RS-25 `keeps`: "…; source-scoped alterations, modifications and proved resolution settings." Its `suppliedBy` does not name L5.
- **RD.5** (README): "then devissage and alterations/descent", with Inputs RD.2 and RD.4 only.
- **Change 1, the RD packet** (`research/blueprint/packets/PadicDifferentialEquationsAndRigidCohomology.json`, updated 2026-09-25; `BP-PadicDifferentialEquationsAndRigidCohomology` pending). Its node `RD.5/smooth-proper-hypercovering` lists the prerequisite "AdicCoefficientsAndComparisons:L5". Request 13 asks L5 for "de Jong's alteration theorem … Theorem 4.1 … and the construction of proper hypercoverings". When integrated, RD.5 would inherit H1 and H5.
- **Change 2, AdicSpacesPartII** (promoted `data/blueprints/AdicSpacesPartII.json`, 2026-09-28). Two F1 nodes list `AdicCoefficientsAndComparisons:L5/de-jong-6-5-strictly-semistable-alteration` as a prerequisite: `F1/quasi-algebraic-affinoid-finiteness` and `F1/dagger-de-rham-finiteness-and-base-change`. This creates the atlas edge L5 → F1 (kind blueprint) for a purely geometric theorem.
- **Change 3, PAPER-TEMKIN-17** (accepted 2026-09-29). It marks four items planned at L5 (dejong-alterations, flattening, normalization-japanese, semistable-curve-alteration). Its Part II brief imports "de Jong's Theorem 4.1, flattening, normalization and semistable curve reduction from AdicCoefficientsAndComparisons L5".
- **Other items planned at L5:**
  - BINDA-KATO-VEZZANI-25/103 (the extraction is under "revise");
  - BOXER-PILLONI-26/flattening-by-blow-up;
  - CADORET-HUI-TAMAGAWA-17/32;
  - DISEGNI-LIU-24/62;
  - SCHOLZE-12/148;
  - SCHOLZE-17/617;
  - SCHOLZE-17/596, which is 27.6 itself and stays at L6 and L5.
- **The H0 packet** (`research/blueprint/packets/ClassicalAdicEtaleCohomology--H0.json`, gap "Public alternative route: Orgogozo's modification theorem") records the cost of the current boundary: "De Jong's alterations are owned by AdicCoefficientsAndComparisons:L5, which consumes this stage, so importing the route here would create a stage cycle".
- **Duplicate normalization.** PAPER-IYENGAR-KHARE-MANNING-24 records that L5's "normalization under the applicable excellence hypotheses" duplicates A0-extension's "prove finite normalization under excellence".
- **No pending restructuring** covers L5, SF.4's alterations or RD.5. RS-27 (pending) keeps the Chow lemma in R09.2, finiteness of normalisation in A0-extension and the Rees blowup in Tau Ceti StableReduction Layer 4. Those are exactly the owners the prefix imports.
- **Libraries.**
  - Mathlib has the relative normalization `AlgebraicGeometry.Scheme.Hom.normalization` (`Mathlib/AlgebraicGeometry/Normalization.lean:123`) and Noether normalization `exists_finite_inj_algHom_of_fg` (`Mathlib/RingTheory/NoetherNormalization.lean:287`).
  - Neither library has alterations, excellence, flattening or semi-stable curves (name searches).

### Fix

**The requirements, validated.**

- **What de Jong actually uses** (pp. 60–67):
  - Chow's lemma (4.6);
  - the projective closure of a quasi-projective variety (4.7: "Let j : X → X̄ be an open immersion of X into a projective variety"), not Nagata compactification;
  - blowups and strict transforms (2.18, 4.8);
  - normalization, which is finite under excellence (4.10, 5.10);
  - flattening of a projective (or étale-locally projective) morphism by a modification of the base, proved from the Hilbert scheme (2.19, pp. 60–61: "This will suffice for the applications we have in mind"; Raynaud–Gruson [22, Theorem 5.2.2] is cited only for arbitrary finite-type morphisms).
- **What the prefix therefore requires:**
  - R09.2, which owns the Hilbert scheme and "the noetherian Chow-lemma/proper-modification package";
  - A0-extension, for finiteness of normalization only;
  - Tau Ceti StableReduction Layers 3 and 4;
  - StableReductionPartII.
- **Not L2.** The red team proposed L2, but L2 is the cohomological compact-support extension and requires E1, E2, E3 and D0.

**Edit 1: `content/campaign/AdicCoefficientsAndComparisons/README.md`.**

- **(a) In the introduction**, replace "In particular the purely schematic work L2 and L5 can proceed independently of the diamond six-operation construction." with:
  > In particular the purely schematic work L2 and L5:alterations can proceed independently of the diamond six-operation construction; L5:alterations needs neither H1 nor H5.
- **(b) Replace the whole section** from "## L5. Alterations and the local normal-crossing calculations" up to (not including) "## L6." with:

```markdown
## L5. Alterations and the local normal-crossing calculations

This is a required proof branch for 27.6, not an optional geometric application. The curve
stable-reduction theorem alone does not supply alterations in arbitrary dimension.

The alteration theorems are proved in the schematic prefix L5:alterations below (tasks 1–3),
which requires neither H1 nor H5; consumers that need only the geometry import that prefix.
This stage applies them in the comparison proof and keeps tasks 4–5:

4. Develop proper hypercovers by the alterations of L5:alterations and their cohomological
   descent, using scheme proper base change and E2's enhanced descent. An alteration may have
   degree divisible by `ℓ`; do not divide its degree to manufacture a trace splitting.
5. Compute the local étale purity/Kummer and nearby-cycle descriptions for the smooth
   strata and normal-crossing boundaries, with their maps, Galois actions and compatible
   analytic versions from H1/H5. Prove the gluing and dimension-induction statements used
   to reduce a comparison to the remaining closed strata.

These tasks have schematic proofs independent of the conclusion of L6.

<a id="l5-alterations"></a>
<a id="stage-L5:alterations"></a>
### L5:alterations — Scheme alterations (de Jong 1996, Theorems 4.1, 5.8 and 6.5)

Prove the following forms of de Jong, *Smoothness, semi-stability and alterations*, Publ. Math.
IHÉS 83 (1996), 51–93, with the source's definitions (variety 2.9, alteration 2.20, strict
normal crossings divisor 2.4, trait 2.12, S-variety 2.15, split semi-stable curve 2.21–2.22,
strict semi-stable pair 6.3):

- Theorem 4.1 (p. 66). For a variety X over a field k and a proper closed Z ⊂ X there are an
  alteration φ₁ : X₁ → X and an open immersion j₁ : X₁ → X̄₁ with X̄₁ a projective variety and
  a regular scheme and j₁(φ₁⁻¹(Z)) ∪ (X̄₁ ∖ j₁(X₁)) a strict normal crossings divisor; if k is
  perfect, φ₁ may be chosen generically étale. With Remark 4.2: X̄₁ is geometrically
  irreducible and smooth over a finite extension k₁ of k.
- Theorem 5.8 (p. 79). For a projective morphism f : X → S of integral excellent schemes whose
  fibres are all nonempty and equidimensional of dimension 1, with smooth locus dense in every
  fibre, there are alterations ψ₁ : S₁ → S and φ₁ : X₁ → X and a projective split semi-stable
  curve f₁ : X₁ → S₁ with smooth generic fibre; for a proper closed Z ⊂ X they may be chosen with
  mutually disjoint sections σ₁, …, σₙ of f₁ into sm(X₁/S₁) and a divisor D₁ ⊂ S₁ such that
  φ₁⁻¹(Z)_red ⊂ f₁⁻¹(D₁)_red ∪ σ₁(S₁) ∪ … ∪ σₙ(S₁).
- Theorem 6.5 (p. 83). For a trait S (the spectrum of a complete discrete valuation ring), an
  S-variety X and a proper closed Z ⊂ X containing the special fibre, there are a trait S₁
  finite over S, an S₁-variety X₁, an alteration φ₁ : X₁ → X of schemes over S and an open
  immersion j₁ : X₁ → X̄₁ of S₁-varieties with X̄₁ a projective S₁-variety with geometrically
  irreducible generic fibre and (X̄₁, φ₁⁻¹(Z)_red ∪ X̄₁ ∖ j₁(X₁)) a strict semi-stable pair.

The finite base extension (k₁/k, S₁ → S) is part of each conclusion; excellence is used for the
finiteness of normalizations; generic étaleness is asserted only for perfect k; the degree of
an alteration is not controlled and may be divisible by `ℓ`. None of these is resolution of
singularities.

The internal proof tasks are:

1. Establish the required finite-type scheme geometry, importing what other stages own:
   finiteness of normalization under excellence from AlgebraicModuliForArithmeticGeometry
   A0-extension (only that theorem), the noetherian Chow lemma and projective Hilbert schemes
   from AlgebraicModuliForArithmeticGeometry R09.2, and the Rees-algebra blowup with its strict
   transform from Tau Ceti StableReduction Layer 4. Prove here: flattening (for a projective
   morphism by a modification of the base, de Jong's Hilbert-scheme argument 2.19; the
   Raynaud–Gruson blowup form that the planned consumer items record), generic smoothness,
   the generic projection and curve fibration of Lemma 4.11, the projective closure of a
   quasi-projective pair (4.7) and the induction on dimension.
2. Establish the curve-fibration step: semi-stable curves and their local description
   (2.21–2.23, §3), on the prestable, semistable and pointed stable families of Tau Ceti
   StableReduction Layer 3; the addition of sections after alteration; and the extension of a
   smooth n-pointed curve (n ≥ 3) over a dense open to a stable n-pointed curve after a
   projective alteration of the base (4.17, 5.13), using the stack of stable n-pointed curves,
   de Jong's projective scheme covers (2.24) and the compactification theorem imported from
   StableReductionPartII. No stable-curve moduli is constructed here.
3. Carry out de Jong's inductive alteration construction (4.12–4.22, 5.9–5.17, 6.7–6.14),
   including the modifications and boundary control. Prove the normal-crossing and strictly
   semistable conclusions in the form used in ECD. Do not require a characteristic-zero
   resolution route for the positive-characteristic case.

Inputs: AlgebraicModuliForArithmeticGeometry R09.2 and A0-extension; Tau Ceti StableReduction
Layers 3 and 4; the StableReductionPartII stage owning stable pointed moduli. Not H1, H5, E2,
E3, L2 or the ECD cohomology upstreams.

Acceptance: each theorem states its base (field, integral excellent base, complete trait) and
its finite base extension; for dim X = 1 the field theorem is realised by normalization (4.3);
an alteration of degree divisible by `ℓ` is a valid output.

The bibliography references the primary alteration paper; the implementation must prove the
required forms, not register them as opaque facts from algebraic geometry.
```

**Edit 2: `data/atlas.json`.**

- Add the stage record:

```json
{"id": "AdicCoefficientsAndComparisons:L5:alterations", "owner": "AdicCoefficientsAndComparisons",
 "key": "L5:alterations", "title": "Scheme alterations (de Jong 1996, Theorems 4.1, 5.8 and 6.5)",
 "requires": ["AlgebraicModuliForArithmeticGeometry:R09.2", "AlgebraicModuliForArithmeticGeometry:A0-extension",
  "tauceti:TauCetiRoadmap/StableReduction#layer-3-prestable-semistable-stable-and-pointed-curves",
  "tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces"],
 "parentStageId": "AdicCoefficientsAndComparisons:L5", "origin": "campaign",
 "sourcePath": "content/campaign/AdicCoefficientsAndComparisons/README.md"}
```

- Append `"AdicCoefficientsAndComparisons:L5:alterations"` to L5's `requires`. This is the pattern of H1 and its substages.
- The table in `DIAMONDS_DEPENDENCY_ORDER.md` is unchanged: it lists no substages, as for H1.
- StableReductionPartII → L5:alterations is the link of /4.

**Edit 3: the decomposition** (`data/decompositions/AdicCoefficientsAndComparisons.json`).

- **Rename the three nodes** and set `parentStageId` to `AdicCoefficientsAndComparisons:L5:alterations`:
  - `AdicCoefficientsAndComparisons:L5/de-jong-4-1-alteration-field-case` → `AdicCoefficientsAndComparisons:L5:alterations/de-jong-4-1-alteration-field-case`;
  - the same for `de-jong-5-8-curve-fibration-alteration` and `de-jong-6-5-strictly-semistable-alteration`.
- **Update every reference:** the four `links`, and the `neededBy` of the gap "de Jong proofs beyond the reduction steps".
- **Coverage.** Split L5's record.
  - L5's `remaining` becomes the single entry:
    > de Jong's alteration theorems moved to L5:alterations. Tasks 4 and 5 of the stage (proper hypercover descent; local purity/Kummer and nearby-cycle computations) have no source read here; SGA 4 XVI (purity) and SGA 7 (nearby cycles) are the intended sources.
  - Add a record for L5:alterations, status "partial", with `remaining`:
    > de Jong: statements of 4.1 (with 4.2–4.11), 5.8 (with 5.9–5.10), 6.5 (with 6.2–6.4, 6.7–6.9) and 2.16 read; 2.18–2.24, 4.15–4.18, 5.1–5.2 and 5.11–5.17 read (FIX-RT-AREA-etale); the proofs 4.12–4.14, 4.19–4.22, the section lemmas 5.3–5.6, 6.10–6.14 and §3 (semi-stable curves) not read. Task 1 inputs (flattening beyond 2.19, generic smoothness, the generic projection of 4.11) have no source read here.
- **The same renaming elsewhere:**
  - `data/blueprints/AdicSpacesPartII.json` and `research/blueprint/packets/AdicSpacesPartII.json`: nodes `AdicSpacesPartII:F1/quasi-algebraic-affinoid-finiteness` (prerequisites[7] and proofSteps[1]) and `AdicSpacesPartII:F1/dagger-de-rham-finiteness-and-base-change` (prerequisites[12]). The blueprint edge L5 → F1 becomes L5:alterations → F1.
  - The generated naming files under `research/expansion/naming/` follow from the maintainer's pipeline.

**Edit 4: SF.4 imports.**

- **`content/campaign/SchemeAndStackFoundations/README.md`, SF.4 "Construct and export".** Replace "Develop infinitesimal lifting and obstruction complexes; formal schemes, algebraization, semistable reduction and alterations. Route Neron models and stable reduction through existing owners." with:
  > Develop infinitesimal lifting and obstruction complexes; formal schemes and algebraization. Route Neron models, semistable and stable reduction, and de Jong's alterations through existing owners; the alterations are imported from `AdicCoefficientsAndComparisons:L5:alterations` (de Jong 1996, Theorems 4.1, 5.8 and 6.5, with their field, excellent-base and trait hypotheses and finite base extension).
- **"Inputs".** Replace "`SchemeAndStackFoundations:SF.3`" with "`SchemeAndStackFoundations:SF.3`, `AdicCoefficientsAndComparisons:L5:alterations`".
- **`data/restructure/RS-25.result.json`, `layers["SchemeAndStackFoundations:SF.4"]`:**
  - In `keeps`, replace "source-scoped alterations, modifications and proved resolution settings." with "modifications and proved resolution settings." In the next sentence, after "Reduction outputs remain available as named imports, not new proofs:", insert "de Jong's alterations from AdicCoefficientsAndComparisons:L5:alterations,".
  - In `suppliedBy`, append `"AdicCoefficientsAndComparisons:L5:alterations"`.
  - In the file's top-level `links`, add `{"source": "AdicCoefficientsAndComparisons:L5:alterations", "target": "SchemeAndStackFoundations:SF.4", "reason": "Named import of de Jong's alteration theorems (1996, 4.1, 5.8, 6.5) with their hypotheses; SF.4 keeps its own applications (FIX-RT-AREA-etale /21)."}`.
  - In the top-level `owners`, add `{"target": "De Jong's alteration theorems (Smoothness, semi-stability and alterations, 1996, Theorems 4.1, 5.8 and 6.5) in their source scope", "owner": "AdicCoefficientsAndComparisons:L5:alterations", "formerly": ["SchemeAndStackFoundations:SF.4", "AdicCoefficientsAndComparisons:L5"]}`.

**Edit 5: RD.5 imports.**

- **`content/campaign/PadicDifferentialEquationsAndRigidCohomology/README.md`, RD.5.**
  - Inputs: add ", `AdicCoefficientsAndComparisons:L5:alterations`".
  - Replace "then devissage and alterations/descent." with:
    > then devissage and descent along proper hypercoverings built from de Jong's alterations (1996, Theorem 4.1 with Remark 4.2, imported from `AdicCoefficientsAndComparisons:L5:alterations`); the hypercovering and rigid cohomological descent are this stage's.
- **RD packet.**
  - Node `RD.5/smooth-proper-hypercovering`, prerequisite: "AdicCoefficientsAndComparisons:L5" → "AdicCoefficientsAndComparisons:L5:alterations/de-jong-4-1-alteration-field-case".
  - Its `hypotheses[0]`: "…requested from AdicCoefficientsAndComparisons:L5 together with the simplicial construction." → "…imported from AdicCoefficientsAndComparisons:L5:alterations; the coskeleton construction is this node's (Tsuzuki §4, as cited by Kedlaya)."
  - Its `proofSteps[0]`: "from AdicCoefficientsAndComparisons:L5" → "from AdicCoefficientsAndComparisons:L5:alterations".
  - `requests[13]`: set `supplier` to "AdicCoefficientsAndComparisons:L5:alterations". Set `need` to:
    > de Jong's alteration theorem (Smoothness, semi-stability and alterations, 1996, Theorem 4.1 with Remark 4.2) over an arbitrary field k of characteristic p: an alteration X' → X with X' regular and smooth over a finite extension of k, with strict normal crossings boundary. The passage to finite purely inseparable extensions k_n and the coskeleton hypercovering are RD.5's own construction (Tsuzuki, Invent. Math. 151, Section 4).
  - The RD.5 coverage note "requests to AdicCoefficientsAndComparisons:L5" → "requests to AdicCoefficientsAndComparisons:L5:alterations".

**Edit 6: planned markers and briefs (paper files).**

- Change `planned: ["AdicCoefficientsAndComparisons:L5"]` to `["AdicCoefficientsAndComparisons:L5:alterations"]` for:
  - BINDA-KATO-VEZZANI-25/103, and route 12's `stages` of that paper;
  - BOXER-PILLONI-26/flattening-by-blow-up;
  - CADORET-HUI-TAMAGAWA-17/32;
  - DISEGNI-LIU-24/62;
  - SCHOLZE-12/148;
  - SCHOLZE-17/617;
  - TEMKIN-17/dejong-alterations, /flattening and /semistable-curve-alteration.
- **TEMKIN-17/normalization-japanese:** set `planned` to `["AlgebraicModuliForArithmeticGeometry:A0-extension"]`, and add to its note "A0-extension owns finiteness of normalisation; the item's universally Japanese hypothesis must be stated there, since A0-extension's text says 'under excellence'".
- **SCHOLZE-17/596** (27.6) is unchanged.
- **TEMKIN-17 route 1, `brief`.** Replace "de Jong's Theorem 4.1, flattening, normalization and semistable curve reduction from AdicCoefficientsAndComparisons L5;" with:
  > de Jong's Theorem 4.1, flattening and semistable curve reduction from AdicCoefficientsAndComparisons L5:alterations, and finiteness of normalization from AlgebraicModuliForArithmeticGeometry A0-extension;
- **DITTMANN-POP-23 route 6:** see /22.

**Edges, each checked with the cycle test.**

- **The new stage.** For each requirement R ∈ {R09.2, A0-extension, StableReduction Layer 3, Layer 4} and each consumer C ∈ {L5, L6, SF.4, RD.5, AdicSpacesPartII:F1, HL.6}, the cycle test for `R` → `C` reports "acyclic". That is 24 checks. HL.6 is the export of the Part II of /22.
- **These pairs cover every edge added:**
  - R09.2, A0-extension, SR3, SR4 → L5:alterations;
  - L5:alterations → L5, SF.4 and RD.5;
  - L5:alterations → F1 (retargeted);
  - L5:alterations → L6 (through the renamed node links);
  - L5:alterations → AdicCoefficientsAndComparisonsPartII (draft).
- **Removed:** the blueprint edge L5 → F1.
- **Possible, not added:** L5:alterations is not downstream of H0 (the cycle test for `R` → `ClassicalAdicEtaleCohomology:H0` is acyclic for all four R). The cycle obstacle recorded in the H0 packet's Orgogozo gap is therefore gone. No edge is added, because that route also needs de Jong 1997's plurinodal fibrations.

### Not done, and why

- **Hypercovering lemma.** The geometric coskeleton construction is used both by L5 task 4 and by the node RD.5/smooth-proper-hypercovering. If its proof needs only Theorem 4.1, the blueprint job may state it once in L5:alterations. No source for it (Tsuzuki, Kedlaya) was read here, so it is not moved.
- **Unread proofs.** The proofs of 4.12–4.14, 4.19–4.22, the §5 section lemmas and 6.10–6.14 stay unread. The decomposition gap keeps them.
- **The table.** `DIAMONDS_DEPENDENCY_ORDER.md` is not edited.

## /22 (medium, error): one Part II brief for prime-to-ℓ alterations, with the field and one-dimensional-base scopes and the proof branch ILO actually uses

### What the verifier corrected

- **Jannsen's reason is wrong.** ILO X 2.1 is over a field. ILO X 2.4 gives a regular alteration over an excellent regular one-dimensional base with extra boundary and local-model data. JANNSEN-16's "same theorem" reason is inaccurate, and its overall review is "revise".
- **Not an assertion that de Jong proves odd degree.** The accepted Dittmann–Pop brief already says arbitrary de Jong alterations do not suffice and names the log-modification proof as supplier work. It is an unclosed proof programme.
- **The brief states both scopes under one Part II.** It adds the log-regular/log-smooth modification and the Gabber–Vidal or Temkin branch actually used.
- **Keep:**
  - both prime-to-ℓ degree conditions;
  - no blanket separability;
  - the projectivity/composition step for the projective DVR consumer.
- **Import L5's ordinary geometry** without pretending it supplies equivariance or prime-to-degree control.

### State on main (1b1aeb19)

- **DITTMANN-POP-23 route 6** (overall "accept"; route accepted). Its brief:
  > Prove the following exact consumer of ILO Exposé X Theorem 2.4: for an excellent henselian DVR R with residue characteristic different from two and an integral projective flat R-model X, obtain a projective regular integral alteration Y→X whose function-field degree is odd … Do not assert separability. Import L5 alteration/model/boundary infrastructure …
- **JANNSEN-16 route 7** (route accepted; the extraction is overall "revise", so `accepted_routes` does not apply it). Reason: "The same theorem as Dittmann–Pop's route, at a general prime ℓ; one owner avoids a duplicate." Its brief imports "L5's ordinary alteration, compactification and normal-crossing infrastructure".
- **New since the verification: TEMKIN-17 route 1** (extracted and accepted 2026-09-29). It joins the same Part II with the Temkin P-alteration branch. Its items include:
  - `gabber-lprime`: ILO X 2.1, 2.4, 3.4, 3.5, 3.9, cited;
  - `gabber-modification`: ILO X 1.1 and the monoidal desingularization F^log;
  - tame distillation and Theorems 1.2.5 and 1.2.9.

  Its route 3 adds Kato's log regularity to CrystallineCohomology:CR.5:log-algebra. So part of (b) is now planned: the log modification and a Temkin branch. Nothing plans the Gabber–Vidal branch, the Sylow step or both scopes stated together.
- **The design job.** `make_queue.py` folds every accepted Part II route with parent AdicCoefficientsAndComparisons into one job: `DESIGN-AdicCoefficientsAndComparisonsPartII` (pending, order 55), which plans the roadmap under id `AdicCoefficientsAndComparisonsPartII`. "PrimeToDegreeAlterations" is only the routes' proposed id. Today the job gets DITTMANN-POP-23 route 6 and TEMKIN-17 route 1, not JANNSEN-16 route 7.
- **Source check** (ILO arXiv:1207.3648v1, Exposé X).
  - **Introduction, p. 135:** "the results of [de Jong, 1996] do not provide equivariant alterations … the recent work [Temkin, 2010] resolves this issue". The §2 method "uses inseparable Galois alterations. In particular, even when k is perfect, one cannot obtain a separable alteration". [Temkin, 2010] is *Stable modification of relative curves* (J. Algebraic Geom. 19), not Temkin 2017.
  - **Theorem 2.1 and Lemma 2.2, p. 149.** Lemma 2.2 is the Gabber–Vidal variant of de Jong **1997** (5.7, 5.9, 5.11; Vidal 2004b, 4.4.1–4.4.4). The proofs of 2.1 (2.3, pp. 150–152) and 2.4 (2.6, pp. 154–155) quotient by an ℓ-Sylow subgroup, then apply Theorem 1.1, then a log étale monoidal modification, then the preparation lemma 1.2.
  - **Theorem 2.4, p. 152.**
  - **Theorem 3.5, p. 162**, is the Temkin route, under a universal ℓ′-resolvability assumption on the base.
- **Jannsen, Annals 183 (2016), Theorem 2.11, p. 24:** "(Gabber; see [ILO14]). If X is separated and integral of finite type over a field L and ℓ is a prime which is invertible in L, and Y ⊂ X is a proper closed subscheme, then there exists a finite extension L′/L of degree prime to ℓ and a connected, smooth quasi-projective variety X′ over L′ together with a proper surjective L-morphism π : X′ → X such that the extension of function fields L′(X′)/L(X) is finite of degree prime to ℓ, and such that Y′ = π^{−1}(Y), with the reduced subscheme structure, is a divisor with strict normal crossings on X′."

### Fix

**Edit 1: the merged Part II brief.** It replaces the `brief` of DITTMANN-POP-23 route 6 (`research/blueprint/papers/PAPER-DITTMANN-POP-23.result.json`), the lead member the design job reads:

> Extend Adic coefficients and comparison with schemes (AdicCoefficientsAndComparisons) beyond L5:alterations with prime-to-ℓ degree control: Gabber's refinements of de Jong's theorems, Illusie–Laszlo–Orgogozo (eds.), Travaux de Gabber, Exposé X (arXiv:1207.3648v1). The design job plans this as AdicCoefficientsAndComparisonsPartII. Final theorems, at a general prime ℓ, with both scopes explicit. An ℓ′-alteration (Exp. X §2, p. 148) is a proper, surjective, generically finite, maximally dominating morphism such that the degrees of the residual extensions k(x′)/k(x) over each maximal point x of the target are prime to ℓ.
> (A) Field (Exp. X, Theorem 2.1, p. 149). Let k be a field, ℓ ≠ char k, X separated of finite type over k, Z ⊂ X nowhere dense closed. There are a finite extension k′/k of degree prime to ℓ and a projective ℓ′-alteration h : X̃ → X above Spec k′ → Spec k with X̃ smooth and quasi-projective over k′ and h⁻¹(Z) the support of a relative strict normal crossings divisor. Jannsen (Ann. of Math. 183 (2016), Theorem 2.11, p. 24) states it for X integral, with X′ connected and [L′(X′) : L(X)] prime to ℓ; export that form to HigherLocalFieldsAndHigherClassFieldTheory HL.6 (PAPER-JANNSEN-16 route 7, which joins when that extraction is accepted).
> (B) One-dimensional base (Exp. X, Theorem 2.4, p. 152). Let S be separated, integral, noetherian, excellent and regular of dimension 1 with generic point η, X separated, flat and of finite type over S, ℓ invertible on S, Z ⊂ X nowhere dense closed. There are a finite extension η′/η of degree prime to ℓ and a projective ℓ′-alteration h : X̃ → X above S′ → S, S′ the normalization of S in η′, with X̃ regular and quasi-projective over S′, a strict normal crossings divisor T̃ on X̃ and a finite closed Σ ⊂ S′ such that (i) outside Σ, X̃ → S′ is smooth and T̃ → S′ is a relative normal crossings divisor; (ii) étale locally at each geometric point of X̃ over s′ ∈ Σ, (X̃, T̃) is isomorphic to S′[u₁^{±1},…,u_s^{±1}, t₁,…,t_n]/(u₁^{b₁}⋯u_s^{b_s} t₁^{a₁}⋯t_r^{a_r} − π) with T̃ = V(t_{r+1}⋯t_m), 1 ≤ r ≤ m ≤ n, gcd(p, a₁,…,a_r, b₁,…,b_s) = 1 for p the characteristic exponent of k(s′); (iii) h⁻¹(Z)_red is a sub-divisor of ∪_{s′∈Σ}(X̃_{s′})_red ∪ T̃.
> (C) Dittmann–Pop's consumer (PAPER-DITTMANN-POP-23/odd-degree-alteration, their Proposition 3.4): (B) with ℓ = 2 and Z = ∅ over an excellent henselian DVR R of residue characteristic ≠ 2 and an integral projective flat R-model X, followed by the projectivity/composition step: h projective and X projective over S make X̃ proper over S and quasi-projective over S′, hence projective over S′ and over S; take a regular integral component dominating X with the degree control of the ℓ′-alteration.
> Keep both prime-to-ℓ conditions (on k′/k resp. η′/η, and on the residual degrees of h). Assert no separability of either extension: the §2 method uses inseparable Galois alterations and gives no separable alteration even for perfect k (Exp. X, p. 135); separability is available only through §3 (Theorem 3.5(iii), for perfect k). Tests: an arbitrary even-degree alteration does not satisfy (C); Y = ∅; the reduced structure of the boundary.
> Proof layers. (1) Log geometry: fs log schemes, log regularity, log smoothness, Kummer étale covers and tame group actions (ILO Exposés VI and IX, as Exp. X cites them, e.g. (VI-3.4) in Proposition 1.2 and IX-2.1 in Step 10 of the proof of 3.5); import the log prefix from CrystallineCohomology CR.5:log-algebra, which with PAPER-TEMKIN-17 route 3 also takes Kato's log regularity. (2) Functorial monoidal desingularization of log regular pairs, the saturated F^log of (VIII-3.4.9) used in Exp. X, pp. 152 and 162. (3) Gabber's modification theorem in the log smooth case (Exp. X, Theorem 1.1, pp. 135–136, deduced from VIII-1.1) with the preparation lemma Exp. X 1.2. (4) One equivariant-alteration branch: either Gabber–Vidal (Exp. X, Lemma 2.2, p. 149, over a field; Lemma 2.5, p. 153, over the base), resting on Vidal 2004b, 4.4.1–4.4.4, and de Jong 1997 (Families of curves and alterations), 5.7, 5.9, 5.11 (pluri-nodal fibrations, not de Jong 1996); or Temkin: Exp. X §3, Theorems 3.4–3.5, through Temkin 2010 (Stable modification of relative curves) under universal ℓ′-resolvability of the base, or the P-alteration theorems of PAPER-TEMKIN-17 route 1. Record which branch proves which clause of (A)–(C), including (B)(ii). (5) The Sylow step and assembly (Exp. X 2.3 and 2.6, pp. 150–155): quotient by an ℓ-Sylow subgroup L of the Galois group G₁ to get S₁/L → S of degree prime to ℓ and the ℓ′-alteration X₂/L → X, then apply (3), a log étale modification to a regular source with snc boundary (2), and the preparation lemma for smoothness (A) or the local model (B)(ii).
> Import, never re-plan: AdicCoefficientsAndComparisons L5:alterations (de Jong 1996 alterations, normalization, blowups, flattening, projective closure), which supplies neither equivariance nor prime-to-ℓ control; Nagata compactification (step 1 of Exp. X 2.3 and 2.6) from its owner AdicCoefficientsAndComparisons L2; SchemeAndStackFoundations for scheme operations; restriction/corestriction and the purely inseparable étale comparison from a HigherLocalFieldsAndHigherClassFieldTheory stage upstream of HL.6 (HL.6 imports (A)) and Tau Ceti ProfiniteCohomology Layer 10. The general Gabber theorem is supplier work of this Part II; it claims no resolution of singularities.

**Edit 2: PAPER-JANNSEN-16 route 7** (`research/blueprint/papers/PAPER-JANNSEN-16.result.json`).

- **`reason`.** Replace "The same theorem as Dittmann–Pop's route, at a general prime ℓ; one owner avoids a duplicate." with:
  > Not the same theorem as Dittmann–Pop's route. Jannsen's Theorem 2.11 is Gabber's field case (ILO Exposé X, Theorem 2.1, p. 149); Dittmann–Pop use the one-dimensional-base case (Exposé X, Theorem 2.4, p. 152) at ℓ = 2, which gives a regular model over the base that the field theorem does not. Both are Gabber's prime-to-ℓ refinements of de Jong, proved by the same method (Exposé X §2, or §3), so one Part II owns both and states each scope (FIX-RT-AREA-etale /22).
- **`brief`.**
  - Replace "especially L5's ordinary alteration, compactification and normal-crossing infrastructure" with "especially L5:alterations' ordinary alteration, compactification and normal-crossing infrastructure (de Jong 1996), which supplies neither equivariance nor degree control".
  - Append "The merged statement of both scopes is the brief of PAPER-DITTMANN-POP-23 route 6."
- **Queue behaviour.** These edits take effect in the queue only when the JANNSEN-16 extraction is accepted.

**Edges.**

- **Links for the maintainer.** The Part II is a draft, so these are links, applied when it is designed: L5:alterations, CR.5:log-algebra and L2 → AdicCoefficientsAndComparisonsPartII, and AdicCoefficientsAndComparisonsPartII → HL.6.
- **Acyclicity.** the cycle test for `R` → `HigherLocalFieldsAndHigherClassFieldTheory:HL.6` is "acyclic" for every import R: CR.5:log-algebra, L2, Tau Ceti AdicSpaces Layer 1, and the four requirements of L5:alterations.
- **A constraint for the design job.** The Part II must not import HL.6 or anything downstream of it.

### Not done, and why

- **Unread exposés.** ILO Exposés VI, VIII and IX (log geometry, monoidal desingularization, VIII-1.1, Kummer étale covers) were not read; they are named only at the places where Exposé X cites them. Vidal 2004b, de Jong 1997 and Temkin 2010 were not read either.
- **Dittmann–Pop.** Their Proposition 3.4 was not re-read. (C) relays the accepted item.
- **Choice of branch.** Choosing between the Gabber–Vidal and Temkin branches is left to the design job, as the verifier allows.

## /23 (medium, error): L1 and L3 need SF.2's pro-étale exports, named precisely

### What the verifier corrected
- ECD §27 (p. 163) takes L1's source category to be the left-completed étale derived category inside the pro-étale one.
- Bhatt–Scholze v2 Proposition 5.3.2 (p. 38) supplies that identification; 5.2.6 (p. 37) is only its bounded-below predecessor.
- At the verified baseline SF.2 had no path to L1 or L3. The pinned Mathlib `Proetale.lean` (lines 52–160) builds the sites and topologies but not repleteness or the derived equivalence.
- **Fix:** add an SF.2 supplier edge to L1 and name the repleteness and left-completion outputs.
- Keep the distinction from the unbounded D(X_ét), which need not be left-complete. Carry the theorem through L1 to L3 rather than building a second site.

### State on main (1b1aeb19)
- **L1** says "Construct the étale/pro-étale comparison morphisms of sites." **L3** says "Construct the comparison pullback and right adjoint, and prove 27.1–27.3."
- **SF.2** (`content/campaign/SchemeAndStackFoundations/README.md`) says "**Construct and export.** Own Zariski, etale, fppf and pro-etale site comparisons at the appropriate coefficient level; …". It names no repleteness or left-completion result.
- **Changed since the verification.** SF.2 now reaches L1 and L3: SF.2 → AdicSpacesPartII:F0 → L1 → L3.
  - The first edge comes from the AdicSpacesPartII blueprint promoted on 28 September, for an unrelated reason ("Cohomology of an inverse limit of sheaves").
  - The second is RS-05's link F0 → L1.

  So the ordering holds, but no text or link names the Bhatt–Scholze inputs.
- **The ACC decomposition** (`data/decompositions/AdicCoefficientsAndComparisons.json`, 16 September) has node `L1/char-p-scheme-diamond-and-comparison-functor`. It defines "D_ét(X,Λ) ⊆ D(X_proét,Λ) … A ⊗^L Λ/I in the left completion D̂(X_ét,Λ) ⊆ D(X_proét,Λ)", with no supplier.
- **Jobs.** BP-AdicCoefficientsAndComparisons is pending; BP-SchemeAndStackFoundations is external (#642). No proposal touches this.
- **The libraries**, read at the pins:
  - Mathlib has `AlgebraicGeometry.Scheme.proetaleTopology` (Sites/Proetale.lean:66), the small site `Scheme.ProEt` (:100) with `ProEt.topology` (:151), and `etaleTopology_le_proetaleTopology` (:79);
  - `Scheme.smallEtaleTopology` is in Sites/Etale.lean:50;
  - neither Mathlib nor Tau Ceti has a morphism ν between the small étale and pro-étale topoi, repleteness, left-completeness or D_cc. A search of the declaration index for "replete", "leftComplete" and "weaklyContractible" finds nothing.

### Fix

**1. SF.2.** Replace "Own Zariski, etale, fppf and pro-etale site comparisons at the appropriate coefficient level;" with:

> Own Zariski, etale, fppf and pro-etale site comparisons at the appropriate coefficient level, building on Mathlib's `Scheme.proetaleTopology` and small site `Scheme.ProEt`. For the pro-étale site, export the following (Bhatt–Scholze, The pro-étale topology for schemes, arXiv:1309.1198v2):
> - **the morphism of topoi** ν : Shv(X_proét) → Shv(X_ét) (§5) and its functoriality in X (Lemma 5.4.1);
> - **repleteness:** Shv(X_proét) is locally weakly contractible (Proposition 4.2.8), hence replete (Proposition 3.2.3(1)), so D(X_proét) is left-complete (Proposition 3.3.3);
> - **the bounded-below comparison:** for K ∈ D⁺(X_ét), K ≅ ν_*ν^*K and RΓ(U, ν^*K) = colim_i RΓ(U_i, K) (Corollary 5.1.6); ν^* is fully faithful on D⁺ with essential image the complexes with classical cohomology sheaves (Proposition 5.2.6);
> - **the left-completion:** D̂(X_ét) is identified with D_cc(X_proét), with the adjunction (ν^*_cc, ν_cc,*) matched to the left-completion adjunction (Definition 5.3.1, Proposition 5.3.2).
>
> State these for sheaves of Λ-modules over a discrete ring Λ, as ECD §27 uses them; Bhatt–Scholze write them for abelian sheaves. Export no unbounded equivalence. ν^* : D(X_ét) → D(X_proét) is not fully faithful in general, because D(X_ét) need not be left-complete (Remarks 5.1.8 and 5.4.4). It is fully faithful when D(X_ét) is left-complete, for instance when X_ét is locally of finite cohomological dimension (Remark 5.2.8).

**2. L1.**
- **Edge.** Add `SchemeAndStackFoundations:SF.2` to L1's `requires`: the named supplier. The cycle test for `SchemeAndStackFoundations:SF.2` → `AdicCoefficientsAndComparisons:L1` reports acyclic, since there is no path from L1 to SF.2. The edge is already implied by SF.2 → F0 → L1; it is added to name the import.
- **Text.** Replace "Construct the étale/pro-étale comparison morphisms of sites." with:
  > Construct the étale/pro-étale comparison morphisms of sites. Import ν, repleteness of the pro-étale topos and the identification D̂(X_ét, Λ) ≃ D_cc(X_proét, Λ) (Bhatt–Scholze 5.3.2) from [SchemeAndStackFoundations SF.2](../SchemeAndStackFoundations/README.md); do not build a second pro-étale site. Define ECD's source category D_ét(X, Λ) ⊂ D(X_proét, Λ) for adic Λ as on ECD p. 163: derived I-complete A such that A ⊗^L_Λ Λ/I lies in the left-completion, equivalently has classical cohomology sheaves. This is not the unbounded D(X_ét, Λ/I), which need not be left-complete; the two agree when D(X_ét) is left-complete.

**3. L3.** After "Construct the comparison pullback and right adjoint, and prove 27.1–27.3.", insert:

> The source category is L1's D_ét(X, Λ), with the left-completion identification imported through L1 from SF.2. The Postnikov reduction in the proof of 27.2 to A ∈ D⁺_ét(X, Λ) = D⁺(X_ét, Λ) uses Bhatt–Scholze 5.2.6 (bounded below). No statement is made about the unbounded D(X_ét, Λ).

No new edge into L3 is needed, because L1 → L3 already exists.

**4. For the ACC blueprint (BP-AdicCoefficientsAndComparisons).** The packet gets:
- a `requests` entry to SF.2 for the four exports above, needed by `L1/char-p-scheme-diamond-and-comparison-functor` and `L3/full-faithfulness-27-2`;
- the stage-level prerequisite `SchemeAndStackFoundations:SF.2` on the L1 node.

### Not done, and why
- **The Λ-module form is an obligation.** Bhatt–Scholze §5 was read for abelian sheaves. The Λ-module form that ECD needs is SF.2's obligation, not a claim.
- **SF.2's own blueprint is external (#642).** It receives this text as a request; this fix writes no packet.

## /25 (medium, duplicate): the classical coherent duality core is consolidated at A0-extension, Zavyalov's universally coherent extension becomes its suffix, and AS.1 keeps its formalism with a comparison

### What the verifier corrected

- **Consolidate the classical scheme duality core**, reasonably at A0-extension. Explicitly add Zavyalov's universally-coherent extension before rerouting its consumers.
- **Keep AS.1's own formalism.** It keeps its derived/solid realization and a comparison; its distinct formalism is not deleted.
- **Do not move ZAVYALOV-25/12–30 mechanically.** Compactification, reflexivity and other general prerequisites keep their existing owners, with import links.
- **Overlap plus a scope extension.** The noetherian theorem and the universally coherent theorem are not equal.

### State on main (1b1aeb19)

The defect is still there, and it is wider than the finding says.

- **Routes that give A0-extension coherent duality** (all accepted):
  - PILLONI-20 route 10: Hartshorne's duality for embeddable morphisms, f^! for lci maps, fundamental classes;
  - CALEGARI-GERAGHTY-18 route 18: Grothendieck–Serre duality with trace over O/ϖ^n;
  - BOXER-CALEGARI-GEE-PILLONI-21 route 11. Its reason: "It already receives Hartshorne's duality for embeddable morphisms, f^!O_Y for lci morphisms and fundamental classes from Pilloni (2020), Grothendieck–Serre duality with trace from Calegari–Geraghty (2018)…";
  - BOXER-PILLONI-26 route 13: the fundamental class for quasi-finite lci maps.
- **Routes that give AS.1 classical coherent duality** (all accepted):
  - ZAVYALOV-25 route 2 (items /12–/30). Its reason: "AS.1 owns the quasi-coherent Grothendieck duality formalism";
  - BHATT-ETAL-23 route 5 and HACON-WITASZEK-23 route 5: normalized dualizing complexes, finite traces, proper local duality;
  - **new since the verifier's baseline:** CESNAVICIUS-21 route 5 (reviewed 2026-09-24). It routes dualizing complexes of noetherian rings and schemes, their normalization and local duality to AS.1. Its reason adds: "If the maintainer judges AS.1 … too heavy a home for the Noetherian ring case, these items and the accepted ones should move together to a single new owner."
- **AS.1** (`research/blueprint/roadmaps/AnalyticStacks.json`, a draft) lists "Grothendieck–Serre duality for proper smooth maps (Theorem 8.1)". Scholze, *Six-Functor Formalisms*, arXiv:2510.26269v2, p. 68, Theorem 8.1: "Let f : X → Y be a proper smooth map of schemes of relative dimension d. Then f_* : D_qc(X) → D_qc(Y) has a right adjoint given by Ω^d_{X/Y}[d] ⊗ f^*". That is the classical scheme theorem. AS.1 also plans "The statement of Theorem 8.10" (p. 71: proper f_* preserves pseudocoherent and coherent objects of derived schemes), "its proof is Theorem 9.18 in AS.3".
- **Consumers that import classical duality from AS.1.** Their design jobs are all pending:
  - the mod-p Part II brief (ZAVYALOV-25 route 1): "Six-functor formalisms and analytic stacks (AnalyticStacks) AS.1 (with this paper's source route, Grothendieck duality for universally coherent schemes, §§2.2–2.3: f^!, relative dualizing complexes, ω_X and its reflexivity)";
  - BHATT-ETAL-23 routes 10 and 15;
  - HACON-WITASZEK-23 route 6;
  - CESNAVICIUS-21 routes 1 and 2.
- **A0-extension's README** does not mention duality. **RS-27** (pending) narrows it, and its `keeps` does not mention duality either: "Coherent cohomology and base change for proper flat morphisms of finite presentation over non-Noetherian bases …; … finiteness of normalisation under excellence". So if RS-27 is accepted as written, the duality routed to A0-extension falls outside its `keeps`. RS-27 also adds the link StableReduction Layer 2 → A0-extension. That layer builds "the relative dualizing complex/sheaf for proper flat finitely presented relative Cohen–Macaulay curves" (Stacks 0E6N).
- **Source check** (Zavyalov arXiv:2111.01830v3, pp. 10–17).
  - §2.1 (Definition 2.1.1, Lemma 2.1.4, Corollary 2.1.5): finitely presented compactifications. Route 3 sends these to L2.
  - §2.2: Definition 2.2.1, Theorems 2.2.2–2.2.3, Lemmas 2.2.4–2.2.7, Construction 2.2.8, Lemma 2.2.9, Corollary 2.2.10, Lemma 2.2.11, Corollary 2.2.12, Lemma 2.2.13, Definition 2.2.14, Lemma 2.2.16. The noetherian case is the Stacks Project duality chapter (Tag 0DWE), which "works almost verbatim in this more general setup". The two new ingredients are Theorem 2.2.2 (Kiehl, Fujiwara–Kato) and Corollary 2.1.5.
  - §2.3: depth and reflexivity of ω_X over a rank-one valuation ring. It uses Corollary 2.2.10 and Lemma 2.2.13.
  - Item /20 is narrower than the source. Corollary 2.2.10 allows any "morphism of qcqs universally coherent schemes" g : S′ → S, not only g in FPS_S.
- **Libraries.** Neither has f^!, dualizing complexes or coherent duality. The name searches for dualiz, shriek, GrothendieckDuality and Serre duality find only Cartier and Tannaka duality. Mathlib has the derived category (`DerivedCategory`, `Mathlib/Algebra/Homology/DerivedCategory/Basic.lean:87`).

### Fix

The edits apply in order: first the owner and its extension (Edits 1–3), then the rerouting of items (Edits 4–5), then the consumers (Edits 6–7).

**Edit 1: A0-extension owns the core** (`content/campaign/AlgebraicModuliForArithmeticGeometry/README.md`). After the paragraph ending "…so R09.1–R09.5 do not import local deformation geometry.", add:

> Own the classical coherent Grothendieck duality core for schemes: for separated finite-type morphisms of noetherian schemes, the pseudo-functor f^! on D^+_qc with f^! ≅ f^* for open immersions and f^! right adjoint to Rf_* for proper f, flat base change, f^!K ≅ Lf^*K ⊗ f^!O for perfect f, f^!O ≅ Ω^d[d] for smooth f of pure relative dimension d, relative dualizing complexes and their base change, and traces of finite and finite locally free morphisms (the Stacks Project duality chapter, Tag 0DWE, as recalled in Zavyalov, arXiv:2111.01830v3, §2.2); dualizing complexes of noetherian rings and schemes, their normalization and local duality, with derived Matlis duality as a named import, not rebuilt here; and the embeddable, lci and fundamental-class forms routed here by PILLONI-20, CALEGARI-GERAGHTY-18, BOXER-CALEGARI-GEE-PILLONI-21 and BOXER-PILLONI-26. Compare with, and do not rebuild, the nodal-curve dualizing sheaf of Tau Ceti StableReduction Layer 2. The universally coherent extension is the suffix A0-extension:universally-coherent-duality; AnalyticStacks AS.1 imports this core and proves the comparison with its D_qc formalism.

Add StableReduction Layer 2 to A0-extension's atlas `requires` (RS-27 proposes the same link). R03.3 is not added: see "Not done".

**Edit 2: the suffix stage.** Add to the same README:

```markdown
<a id="a0-extension-universally-coherent-duality"></a>
<a id="stage-A0-extension:universally-coherent-duality"></a>

## A0-extension:universally-coherent-duality: Grothendieck duality over universally coherent bases

Extend A0-extension's duality core from noetherian to qcqs universally coherent bases S (every
finitely presented S-scheme coherent), following Zavyalov, arXiv:2111.01830v3, §2.2
(pp. 11–15), on the category FPS_S of separated finitely presented S-schemes: proper
pushforward preserves D^∗_coh for ∗ = ∅, +, −, b (Theorem 2.2.2, Kiehl; Fujiwara–Kato); the
pseudo-functor f^! with X^! = D^+_qc(X), f^! ≅ Lf^* for open immersions and f^! right adjoint
to Rf_* for proper f (Theorem 2.2.3), using the finitely presented compactifications of
Corollary 2.1.5 imported from AdicCoefficientsAndComparisons L2; flat base change (2.2.4);
f^! of perfect morphisms (2.2.5); f^!O ≅ O[d] on A^d and O(−d−1)[d] on P^d (2.2.6);
coherence and boundedness (2.2.7); the relative dualizing complex for flat f and its base
change along any morphism of qcqs universally coherent schemes (2.2.8–2.2.10); f^!O ≅
Ω^d_{X/S}[d] for smooth f, compatibly with base change (2.2.11); étale f (2.2.12); amplitude
[−d, 0] (2.2.13); ω_X = H^{−d}(f^!O) (2.2.14); and the trace of a finite flat map (2.2.16).
Record the printed slips: Theorem 2.2.3 reads FPS_R for FPS_S, and Lemma 2.2.7(2) has the
categories reversed.

Inputs: A0-extension; AdicCoefficientsAndComparisons L2. Consumers: the mod-p Poincaré
duality Part II of ClassicalAdicEtaleCohomology; AnalyticStacks AS.1 (comparison, and
Zavyalov §2.3). Acceptance: over a noetherian S the construction agrees with A0-extension's.
```

Add the atlas record `{"id": "AlgebraicModuliForArithmeticGeometry:A0-extension:universally-coherent-duality", "owner": "AlgebraicModuliForArithmeticGeometry", "key": "A0-extension:universally-coherent-duality", "title": "Grothendieck duality over universally coherent bases", "requires": ["AlgebraicModuliForArithmeticGeometry:A0-extension", "AdicCoefficientsAndComparisons:L2"], "parentStageId": null, "origin": "campaign", "sourcePath": "content/campaign/AlgebraicModuliForArithmeticGeometry/README.md"}`. It is a suffix that requires its base, as HQ.5-trace does, so A0-extension does not require it. A0-extension and its 755 descendants therefore do not inherit L2's derived-sheaf ancestors.

**Edit 3: a note for RS-27's author and reviewer** (`research/blueprint/restructure/RS-27.result.json`, `layers["AlgebraicModuliForArithmeticGeometry:A0-extension"].keeps`). Append:

> ; and the classical coherent Grothendieck duality core for schemes (f^! for separated finite-type morphisms of noetherian schemes, dualizing complexes, smooth, lci and embeddable forms, fundamental classes and finite traces, as routed here by PILLONI-20, CALEGARI-GERAGHTY-18, BOXER-CALEGARI-GEE-PILLONI-21, BOXER-PILLONI-26, BHATT-ETAL-23, HACON-WITASZEK-23 and CESNAVICIUS-21), compared with StableReduction Layer 2's nodal-curve dualizing sheaf; its universally coherent extension is the suffix A0-extension:universally-coherent-duality

Without it, RS-27 would narrow A0-extension below the accepted routes.

**Edit 4: split ZAVYALOV-25 route 2** (`research/blueprint/papers/PAPER-ZAVYALOV-25.result.json` and `.review.json`).

- **Route 2 keeps §2.3 at AS.1.** Its `items` become /26–/30, the depth and reflexivity items: the verifier's "retain their appropriate existing owners". Its `reason` becomes:
  > AS.1 keeps Zavyalov's §2.3 (depth via local cohomology, weakly associated primes, flatness and reflexivity of ω_X over a rank-one valuation ring), importing ω_X and the relative dualizing complex from AlgebraicModuliForArithmeticGeometry A0-extension:universally-coherent-duality. §2.2 moved to that suffix (FIX-RT-AREA-etale /25).
- **New route 9:** `{"route": "source", "roadmap": "AlgebraicModuliForArithmeticGeometry", "stages": ["AlgebraicModuliForArithmeticGeometry:A0-extension:universally-coherent-duality"], "items": ["PAPER-ZAVYALOV-25/12", …, "PAPER-ZAVYALOV-25/25"], "reason": "Zavyalov §2.2 extends the classical noetherian duality core of A0-extension to qcqs universally coherent bases; it is owned by A0-extension's suffix (FIX-RT-AREA-etale /25). Compactifications (§2.1) stay at L2 (route 3) and are imported."}`.
- **Review file.** Route 9 needs a verdict (see "Review verdicts" at the top). The entry to record, if the maintainer accepts it: `{"route": 9, "verdict": "accept", "reason": "Applies the confirmed finding REV-RT-AREA-etale /25."}`.
- **Item /20, `statement`.** Replace "and any g : S′ → S in FPS_S" with "and any morphism g : S′ → S of qcqs universally coherent schemes".

**Edit 5: reroute the classical items to A0-extension.**

- **BHATT-ETAL-23 route 5, HACON-WITASZEK-23 route 5 and CESNAVICIUS-21 route 5.** In each, set `roadmap` to "AlgebraicModuliForArithmeticGeometry" and `stages` to `["AlgebraicModuliForArithmeticGeometry:A0-extension"]`.
- **The `reason` fields:**
  - **BHATT-ETAL-23 route 5.** Replace "adapters to the existing coherent formalism." with "adapters to A0-extension, the owner of the classical coherent duality core (FIX-RT-AREA-etale /25)." The rest stays, including "Matlis duality is imported from R03.3" (see "Not done").
  - **HACON-WITASZEK-23 route 5.** Replace "The classical quasi-coherent formalism already owns coherent duality." with "A0-extension owns the classical coherent duality core (FIX-RT-AREA-etale /25)."
  - **CESNAVICIUS-21 route 5.** Replace the text from "Six-functor formalisms and analytic stacks AS.1 owns" up to "confirms the choice." with:
    > With the accepted routes 5 of PAPER-HACON-WITASZEK-23 and PAPER-BHATT-ETAL-23, these items move to A0-extension, the single owner of the classical coherent duality core (FIX-RT-AREA-etale /25), as the last sentence of this reason anticipated.
- **The matching `.review.json` route reasons** each open with "Source of AnalyticStacks AS.1" or "…make AS.1 the single owner…". The maintainer updates them to name A0-extension.

**Edit 6: the consumers' briefs.** Each quoted phrase is replaced as shown.

- **ZAVYALOV-25 route 1.** Replace "Six-functor formalisms and analytic stacks (AnalyticStacks) AS.1 (with this paper's source route, Grothendieck duality for universally coherent schemes, §§2.2–2.3: f^!, relative dualizing complexes, ω_X and its reflexivity);" with:
  > Algebraic moduli (AlgebraicModuliForArithmeticGeometry) A0-extension:universally-coherent-duality (Grothendieck duality for universally coherent schemes, §2.2: f^!, relative dualizing complexes, ω_X, finite traces); Six-functor formalisms and analytic stacks (AnalyticStacks) AS.1 for §2.3 (depth and the reflexivity of ω_X);
- **BHATT-ETAL-23 route 10.** "singular coherent-duality adapters from Six-functor formalisms and analytic stacks (AnalyticStacks:AS.1)" → "singular coherent-duality adapters from AlgebraicModuliForArithmeticGeometry:A0-extension".
- **BHATT-ETAL-23 route 15.** "singular duality from AnalyticStacks:AS.1" → "singular duality from AlgebraicModuliForArithmeticGeometry:A0-extension".
- **HACON-WITASZEK-23 route 6.** "Import coherent duality from Six-functor formalisms and analytic stacks (AnalyticStacks:AS.1)" → "Import coherent duality from AlgebraicModuliForArithmeticGeometry:A0-extension".
- **CESNAVICIUS-21 route 1.** "from Six-functor formalisms and analytic stacks (AnalyticStacks) AS.1 for dualizing complexes on Noetherian schemes" → "from Algebraic moduli (AlgebraicModuliForArithmeticGeometry) A0-extension for dualizing complexes on Noetherian schemes".
- **CESNAVICIUS-21 route 2.** "from Six-functor formalisms and analytic stacks (AnalyticStacks) AS.1, dualizing complexes over a Noetherian ring" → "from Algebraic moduli (AlgebraicModuliForArithmeticGeometry) A0-extension, dualizing complexes over a Noetherian ring".

**Edit 7: AS.1 keeps its formalism and proves the comparison** (`research/blueprint/roadmaps/AnalyticStacks.json`, stage AS.1).

- **`description`.** Replace "Grothendieck–Serre duality for proper smooth maps (Theorem 8.1)." with:
  > Grothendieck–Serre duality for proper smooth maps (Theorem 8.1), the classical scheme theorem imported from `AlgebraicModuliForArithmeticGeometry` A0-extension and realised in this formalism. Prove the comparison: on classical schemes and D^+_qc, the right adjoint of f_* for proper f agrees with A0-extension's f^!, and the statement of Theorem 8.10 restricted to classical coherent schemes agrees with Theorem 2.2.2 of A0-extension:universally-coherent-duality.
- **"Inputs".** At the end of the "**Inputs.**" paragraph of the description, append: "From `AlgebraicModuliForArithmeticGeometry`: A0-extension and A0-extension:universally-coherent-duality (the classical duality core and its extension, for the comparison and for Zavyalov §2.3)."
- **`requires`.** Append "AlgebraicModuliForArithmeticGeometry:A0-extension" and "AlgebraicModuliForArithmeticGeometry:A0-extension:universally-coherent-duality".

**Edges.**

- **Checked with the cycle test, all "acyclic":**
  - L2 → A0-extension, standing in for L2 → the suffix;
  - StableReduction Layer 2 → A0-extension;
  - R03.3 → A0-extension, in case the maintainer adds it.
- **A0-extension → suffix** is new and trivially acyclic.
- **Draft links:** suffix → mod-p Part II, and A0-extension and suffix → AS.1. They cannot close a cycle:
  - A0-extension has 5 ancestors (R09.1–R09.4 and ModularCurves 0C). L2 has 10 (D0, E0–E3, four ECD upstreams, Tau Ceti AdicSpaces Layer 1).
  - None of these is reachable from AS.1 or its only draft consumers, AnalyticHabiroStack and RingStacksAndTransmutation.
  - No atlas stage requires an AnalyticStacks stage.
  - RS-10's 133 links add no edge into these ancestors.

### Not done, and why

- **§2.3 left at AS.1.** Whether §2.3 (depth and reflexivity over a rank-one valuation ring) would sit better in the mod-p Part II, its only consumer, is left to the design jobs. The verifier asks that it keep its owner.
- **Kiehl–Fujiwara–Kato moves with the extension.** Theorem 2.2.2 moves with the extension because Zavyalov calls it "the main technical ingredient" of that extension. AS.1's derived Theorem 8.10 stays and is compared (Edit 7), not rebuilt.
- **Matlis duality has no stated owner.** BHATT-ETAL-23's accepted routes say it is "imported from R03.3", but no stage text states Matlis duality, and R03.3's text covers depth, Cohen–Macaulay and complete-intersection theory. Adding R03.3 would also bring its ancestors (R03.1–R03.2, ModularCurves 4D, 7D, 7F) into A0-extension. The blueprint job for A0-extension should record it as a request, or prove it.
- **Unread sources.** The Stacks Project duality chapter, Kiehl and Fujiwara–Kato were not read. Their statements are taken as Zavyalov recalls them.

## /26 (medium, error): H1:henselian's perfectoid-limit extension needs a later suffix and a named noetherian-stage limit theorem

### What the verifier corrected
- **The route and the gap.** CS19 route 14 asks for the perfectoid-limit extension "through P5/H0/L2", but P5 has no path to H1:henselian.
- **The proof of Theorem 4.10** (pp. 10–11) uses three things: Huber 3.2.9 at the noetherian stages, scheme continuity, and étale-site descent to the perfectoid limit.
- **Where it goes.** Put it in a later suffix supplied by H1:henselian and by the precise limit theorem, without making every early henselian comparison wait on perfectoid inputs.
- **Scope correction.** P5 constructs limits of affinoid perfectoid pairs, whereas CS19 footnote 3 allows noetherian Tate stages with a perfectoid completed limit.
  - That extension must be an explicit target or request at the limit owner; an edge alone does not prove it.
  - Keep the henselization at the finite stages and the actual normalized plus rings.

### State on main (1b1aeb19)
- **H1:henselian** requires L2, A2 and H0, plus the RS-05 links. Its text ends "Source: Hub96 3.2.5, 3.2.9–3.2.12 and their proofs in §§3.3–3.4." Neither P5 nor P7 is an ancestor, and H1:henselian is an ancestor of neither.
- **CESNAVICIUS-19 (overall accept, unchanged since 23 September).**
  - Route 14 sends `noetherian-huber` (planned) and `perfectoid-huber` (missing) to H1:henselian, with the reason "… Extend from the verified Noetherian specialization through P5/H0/L2 to the perfectoid limit. …".
  - Route 12 sends `noetherian-approx`, `qcqs-site-limit` (footnote 3), `adic-spectral-limit`, `adic-finite-etale-limit` and `perfectoid-qcqs-limit` to P5.
  - Route 13 sends `adic-cohom-limit` to H0.
  - Route 3 sends the consumers (`perfectoid-p-vanish` and the purity items) to SF.2.
- **P5's text** plans "cofiltered limits of affinoid perfectoid pairs" and "ECD 6.4(i)–(iii)". **P7's text** plans Huber tilde-limits. Accepted RS-05 keeps at P7 "the extra perfectoid/Sch12 7.16-19 comparisons".
- **Pending since the verification: the PerfectoidSpaces packet `PerfectoidSpaces--P0`** (layers P0–P7, 26 September; review `needs_changes`).
  - Its P5 nodes are all for affinoid perfectoid stages (ECD 6.4).
  - Its P7 has `P7/tilde-limit-qcqs-etale-finite-stage-descent`: 2-colim_i (X_i)_ét,qcqs ≃ X_ét,qcqs for X ~′ lim X_i with X_i qcqs locally noetherian analytic and X perfectoid.
  - It also has `P7/tilde-limit-from-completed-colimit` and `P7/tilde-limits-and-etale-topos-comparison` (cohomology continuity, Sch12 7.18).
  - Its P5 and P7 nodes do not mention Česnavičius.

  So the noetherian-stage theorem is planned at P7, not at P5.

### Fix
The limit owner here is **P7**, not P5.
- **Why not P5.** P5's ECD 6.4 needs affinoid perfectoid stages. The noetherian-stage comparison is what RS-05 keeps at P7, and the pending packet plans it there. Placing the footnote at P5 would duplicate P7's node, and P5 cannot import from P7.
- **P5 is still upstream.** P5 is an ancestor of P7 (P7 requires P5), so P5 enters the suffix through P7.

**1. New stage `ClassicalAdicEtaleCohomology:H1:henselian:perfectoid-limit`.** Insert this section in the README after the H1:henselian subsection:

> <a id="h1-henselian-perfectoid-limit"></a>
> <a id="stage-H1:henselian:perfectoid-limit"></a>
> ### H1:henselian:perfectoid-limit — Huber's comparison at a perfectoid limit (late suffix)
>
> This suffix is late: it imports the noetherian-stage descent of [PerfectoidSpaces P7](../PerfectoidSpaces/README.md). It is not an input of H1:henselian or of any early H1 consumer.
>
> **Statement** (Česnavičius, Purity for the Brauer group, Theorem 4.10, (4.10.2) and (4.10.4), pp. 9–11). Let R be a p-torsion-free perfectoid ring with R = (R[1/p])°, and G a commutative finite étale R[1/p]-group scheme. Prove H^i_ét(Spec R[1/p], G) ≅ H^i_ét(Spa(R[1/p], R), G) for all i. Prove the same for the tilt (R♭[1/ϖ♭], R♭), with ϖ♭ in place of p.
>
> **Proof, keeping the source's finite stages.**
> - **The finite stages.** Write R as the filtered colimit of p-torsion-free finite-type ℤ_p-subalgebras R_j, integrally closed in R_j[1/p], and also as the colimit of their henselizations R_j^h along (p). Descend G to a finite stage.
> - **The scheme side.** Compare H^i(R[1/p], G) with colim_j H^i(R_j^h[1/p], G) by scheme continuity (from AdicCoefficientsAndComparisons L2).
> - **The adic side.** Compare H^i(Spa(R[1/p], R), G) with colim_j H^i(Spa(R_j[1/p], R_j), G). Use the homeomorphism Spa(R[1/p], R) → lim_j Spa(R_j[1/p], R_j), which respects rational subsets, and the qcqs étale-site descent of footnote 3; both are imported from P7.
> - **The stages.** Apply Hub96 3.2.9 (H1:henselian) at each noetherian stage, where it identifies H^i(Spa(R_j[1/p], R_j), G) with H^i(R_j^h[1/p], G).
>
> Hub96's blanket noetherian hypothesis is used only at the stages. Do not replace R_j^h by R_j or by its completion, and use the integrally closed plus rings R_j, not arbitrary models.

Stage record in `data/atlas.json`: `requires` = [`ClassicalAdicEtaleCohomology:H1:henselian`, `PerfectoidSpaces:P7`]. H0 and L2 are already ancestors of both.
- **No cycle.** The stage is new, and H1:henselian and P7 are incomparable (a path search finds no path either way).
- **Its consumer must not be SF.2 itself.** The consumer is CESNAVICIUS-19's purity content, now routed to SF.2 by route 3. The cycle test for `ClassicalAdicEtaleCohomology:H1:henselian` → `SchemeAndStackFoundations:SF.2` reports CYCLE: SF.2 → AdicSpacesPartII:F0 → H1:henselian. The same holds for P7, through SF.2 → F0 → H0 → P7. The edge must go to the late Brauer-purity part of SF.2 that finding /2's fix creates.

Add to H1:henselian's text, after "…their proofs in §§3.3–3.4.":

> Huber's comparison at a perfectoid limit (Česnavičius's Theorem 4.10) is the later suffix [H1:henselian:perfectoid-limit](#h1-henselian-perfectoid-limit); nothing in this stage depends on perfectoid limits.

**2. The explicit target at P7.** In `content/campaign/PerfectoidSpaces/README.md`, P7, after "Prove restriction to compatible rational opens, cofinal change of index, finite étale base change, and gluing of the resulting limits.", insert:

> Include as an explicit target the noetherian-stage descent of Česnavičius, Purity for the Brauer group, footnote 3 (p. 10). Let (A_j[1/ϖ], A_j) be a filtered system of affinoid Tate rings with a common pseudouniformizer ϖ, each A_j noetherian, a ring of definition, and integrally closed in A_j[1/ϖ], whose ϖ-adically completed colimit A has A[1/ϖ] perfectoid. Then base change induces 2-colim_j Spa(A_j[1/ϖ], A_j)_ét,qcqs ≃ Spa(A[1/ϖ], A)_ét,qcqs.
>
> Derive it from the Sch12 7.16–7.19 comparison kept here:
> - show that the completed stages are qcqs locally noetherian analytic adic spaces;
> - show that Spa(A[1/ϖ], A) is their tilde-limit, with the homeomorphism of (4.10.6) and density of the colimit.
>
> P5's ECD 6.4 assumes affinoid perfectoid stages and does not give it.

**3. Paper routes (`research/blueprint/papers/PAPER-CESNAVICIUS-19.result.json`).**
- **Route 12.**
  - `stages`: `["PerfectoidSpaces:P5"]` → `["PerfectoidSpaces:P5", "PerfectoidSpaces:P7"]`;
  - remove `PAPER-CESNAVICIUS-19/noetherian-approx` from `items`;
  - append to `reason`: "qcqs-site-limit (footnote 3, noetherian stages) is planned at P7 with the Sch12 7.16–7.19 comparison that RS-05 keeps there; P5 keeps the three parts of ECD 6.4 for affinoid perfectoid stages. The approximation system noetherian-approx moves to route 14."
- **Route 14.**
  - `stages`: `["ClassicalAdicEtaleCohomology:H1:henselian"]` → `["ClassicalAdicEtaleCohomology:H1:henselian", "ClassicalAdicEtaleCohomology:H1:henselian:perfectoid-limit"]`;
  - add `PAPER-CESNAVICIUS-19/noetherian-approx` to `items`;
  - in `reason`, replace "Extend from the verified Noetherian specialization through P5/H0/L2 to the perfectoid limit." with "noetherian-huber (Hub96 3.2.9 at the noetherian stages) stays at H1:henselian; perfectoid-huber and the approximation system noetherian-approx go to the late suffix H1:henselian:perfectoid-limit, which imports the footnote 3 descent from P7 (not P5, whose ECD 6.4 assumes affinoid perfectoid stages), cohomological continuity from H0 and scheme continuity from L2."

  Both routes change, so the maintainer should have them re-reviewed.

**4. For the PerfectoidSpaces blueprint (under revision).** The P7 node `tilde-limit-qcqs-etale-finite-stage-descent` takes CS19 footnote 3 as a named acceptance case, with the two checks of edit 2.

### Not done, and why
- **Sch12 §7 was not read.** Its content is used only as RS-05's keeps text and the pending packet's node statements. That footnote 3 follows from P7's node is recorded as the obligation of edit 2, not as a fact.
- **The consumer edge waits on /2.** It depends on the SF.2 Brauer-purity suffix of that finding, which another group owns.

## /27 (medium, duplicate): one owner for q-Witt and q-de Rham–Witt theory, applied with QWittVectors' promotion

### What the verifier corrected
- The live HQ.4/HR.4 texts and the draft QW.1–QW.7 do plan the same q-Witt constructions, operators and derived comparison twice, and CR.4 still names HQ.4.
- PLAN-HABIRO §6.5 and its accepted review already decide the ownership. Fix the implementation lag, not the accepted decision.
- Promote the suppliers before, or atomically with, narrowing their consumers.
- Keep ordinary restriction maps (CR.4) distinct from q-V/q-FV systems.
- Edge removals go through a maintainer mechanism. A §15 links-only proposal cannot remove HQ.4 → HQ.3, and adding the reverse link alone is cyclic. Recheck the complete forwarded graph after splitting stages.

### State on main (1b1aeb19)
- **HQ.4 (README line 33)** still owns the positive-degree theory: "Import degree-zero q-Witt rings and their operations from HR.4. Own the **positive-degree q-de Rham–Witt complex**, its differential, truncation sets, Frobenius/Verschiebung extensions … Prove the smooth derived-to-underived q-Witt-form comparison of q-Hodge v2 Corollary 3.31, with all shifts." Line 35 holds the cyclotomic descent.
- **The promoted HabiroRings blueprint** (`data/blueprints/HabiroRings.json`, accepted 2026-09-25) plans in HR.1 and HR.4 what draft QW.0–QW.4 plan (table below).
- **The HQ.1 packet** plans the positive-degree theory in HQ.4. Its restructure note says those nodes must not be planned again in QWittVectors once RS-10 is accepted.
- **CR.4** (CrystallineCohomology README, lines 164–165): "Habiro HQ.4 owns the q-deformation and specialization maps into these objects;"
- **The graph:**
  - HQ.3 requires HQ.4;
  - HQ.4 requires CR.4, HQ.2 and HR.4;
  - The cycle test for `HQ.3` → `HQ.4` gives "CYCLE: HQ.4 -> HQ.3".
- **QWittVectors** is a draft with no queue job.
- **RS-10~2** supplies every QW → HQ/HR link the plan needs (QW.1 → HR.1, HQ.1, HQ.2, HQ.8; QW.2–QW.4 → HR.4; QW.5 → HQ.3, HQ.4, HQ.5, HQ.8, HR.6; QW.7 → HQ.2, HQ.3, HQ.4, HQ.5, HQ.8, HR.6; and more), together with interim holders and owners entries.
  - **Conflict:** it keeps HQ.4 → HQ.3, CR.4 → HQ.4 and HR.4 → HQ.4. It re-scopes instead: HQ.3 absorbs the framed application and comparison, and HQ.4 keeps constructions. That is the first option in REV-RS-10.
  - The plan's §6.5 rows say otherwise: HQ.3 "drop HQ.4"; HQ.4 "add … HQ.3", applying Example 3.12 and Corollary 3.54.
  - This fix follows the plan, as the binding review requires. The choice is flagged under "Not done".

### Fix (batch Q: all of it in one maintainer change, together with the promotion of QWittVectors)
1. **Promote QWittVectors with a blueprint that takes the existing nodes over, not re-plans them.** The locators are those recorded in the nodes (q-Witt v5 numbering); the targets follow plan §4.2 L8/L9 and review §8.3.

   | Existing node | New owner |
   |---|---|
   | HR.4/truncated-big-witt-vectors (2.6, Remark 2.7) | QW.0 |
   | HR.1/lambda-rings-with-commuting-adams-operations, HR.1/perfectly-covered, HR.1/the-colimit-perfection | QW.1 |
   | HR.4/q-witt-vectors (2.8, 2.9, 2.13, 2.23), HR.4/there-is-no-restriction-map (2.14) | QW.2 |
   | HR.4/the-lambda-ring-comparison-maps (2.31–2.37), HR.4/relative-q-witt-rings (2.40–2.47) | QW.3 |
   | HR.4/q-witt-vectors-of-etale-maps (2.48, 2.50), HR.4/ghost-maps-and-etale-base-change (2.51), HR.4/an-isomorphism-with-the-naive-quotient-forces-a-frobenius-lift (2.52) | QW.4 |
   | HQ.1 packet: HQ.4/q-v-systems-of-differential-graded-algebras, /q-fv-systems, /there-are-no-restriction-operators-and-what-replaces-them (its 2.14 part cites QW.2), /the-q-de-rham-witt-complex, /ghost-maps-and-what-they-do-not-define, /etale-base-change-and-the-sheaf-property, /the-frobenius-operators-on-q-de-rham-witt-complexes, /the-comparison-map-from-ordinary-de-rham-witt, /etale-extension-of-a-differential-graded-algebra (v5 §3) | QW.5 |
   | HQ.4/the-p-completion-of-the-q-de-rham-witt-complex (4.1, 4.2, 4.27), /the-p-local-decomposition (4.36), /the-arithmetic-fracture-square-for-q-de-rham-witt-complexes (4.37), /the-rescaled-frobenius-is-the-crystalline-frobenius (4.38) | QW.6 |
   | HQ.4/the-nygaard-filtration-on-q-de-rham-witt-complexes (v2 3.21), /the-divided-frobenius-on-nygaard-graded-pieces (3.23), /the-kernel-of-the-frobenius (3.24), /the-nygaard-cofibre-sequence (3.25), /nygaard-descent-and-smooth-agreement (3.26), /the-prismatic-nygaard-fibre-sequence (3.27), /the-derived-q-de-rham-witt-complex-and-its-stupid-filtration (§3.5 opening), /hodge-against-nygaard (3.30), /derived-q-de-rham-witt-forms-of-smooth-algebras (3.31), /no-functorial-q-hodge-complex-with-q-witt-cohomology (v5 5.1) | QW.7 |
   | HQ.4/twisted-q-de-rham-complexes (3.14, 3.16), /the-arithmetic-fracture-squares-and-cyclotomic-descent (3.15), /the-twisted-complex-deforms-the-q-de-rham-witt-complex (3.19), /the-nygaard-filtration-on-twisted-q-de-rham-complexes (3.20), /the-nygaard-comparison (3.22), /the-nygaard-filtration-after-inverting-p (3.29) | HQ.2 (/29) |
   | HQ.4/no-automatic-multiplicative-upgrade (§3.8) | HQ.3 |

   HR.1 keeps the-etale-frobenius-lift, morphisms-of-pairs and relative-frobenius-of-an-etale-algebra. HR.4 keeps the-finite-relative-habiro-rings, the-etale-lift, the-transitions-are-frobenius and the-limit-of-the-finite-stages-is-static. Prerequisites that point at a moved node are re-pointed to its new id.
2. **Edges, for the maintainer.**
   - Remove HQ.4 from HQ.3's `requires`.
   - Remove CR.4 and HR.4 from HQ.4's `requires`.
   - Add HQ.3 → HQ.4.
   - Add the plan's other §6.5 requirements: QW.7 → HQ.3, and HR.1, HR.5, QW.6, QW.7 → HQ.4. These are RS-10~2 links, and apply once QWittVectors is installed.

   the cycle test for `HQ.3` → `HQ.4` reports a cycle only through the edge being removed. The union check (see the preamble) is acyclic after the removals.
3. **HQ README, HQ.4, lines 31–36.** Replace the section with:
   > ## HQ.4. Framed Habiro rings and the q-Habiro–Hodge complex
   >
   > Let S be smooth over a perfectly covered Λ-ring A, with an étale framing □: A[x_1,…,x_n]→S, and give A[x_1,…,x_n] the toric Λ-structure ψ^m(x_i)=x_i^m. Construct the automorphisms γ_i of HabiroRings HR.5's relative Habiro ring ℋ_{S/A[x]} extending x_i↦qx_i. As in Wagner v2 Example 3.12 (pp. 25–26), define them on each factor of HR.5's equaliser presentation (Lemma 2.12) by the infinitesimal lifting property of S→S^{(m)}⟦q−ζ_m⟧, where S^{(m)}:=(S⊗_{A[x],ψ^m}A[x])[ζ_m]. Prove γ_i≡id mod x_i and that the operators (γ_i−id)/x_i commute, and form their Koszul complex. For a toric framing (each x_i invertible in S), rescaling the i-th generator by x_i identifies it with the Koszul complex of the γ_i−id. Prove that this complex represents the Habiro–Hodge complex q-𝓗dg_{S/A,□} of HQ.3's framed q-Hodge filtration. The source only says this "can be shown by unravelling the proof of Theorem 3.11", so it is a gap until written. Then deduce from HQ.3's Corollary 3.54 the uncompleted computation H^*(Koszul complex/(q^m−1))≅q-W_mΩ^*_{S/A}, with the q-de Rham–Witt differential as the Bockstein differential. Its (q−1)-completed form is QWittVectors QW.6's Theorem 4.27. The V5A4 framed-Habiro items that PLAN-HABIRO §6.5 lists for HQ.4 belong here: Definitions 3.19–3.23, 4.1–4.2 and 4.6; Theorems 4.8–4.9 in uncompleted form; Theorems 5.4 and 5.7; and the remarks, examples, lemmas and propositions listed there. V5A4 Proposition 4.15 and Remarks 4.16–4.17 are QW.2's.
   >
   > HQ.4 builds no q-Witt theory of its own. Positive-degree q-de Rham–Witt complexes, their q-V- and q-FV-systems and the Langer–Zink comparison are QWittVectors QW.5's. Animated forms, Nygaard filtrations and Corollary 3.31 are QW.7's. Degree-zero q-Witt rings, ghost maps and the restriction obstruction are QW.2–QW.4's. Cyclotomic descent is HQ.3's, and the twisted q-de Rham complexes are HQ.2's. HQ.4 imports all of these. CrystallineCohomology CR.4's de Rham–Witt complexes keep their genuine restriction maps; the q-objects have none (q-Witt v5 2.14 and 3.11), and the two operator systems are never identified.

   The new text has the same six lines: heading, blank, paragraph, blank, paragraph, blank. In `data/atlas.json` it becomes HQ.4's `description`, and its `title` becomes "Framed Habiro rings and the q-Habiro–Hodge complex".
4. **HQ README, HQ.3, line 29.**
   - Replace "with its degree/shift convention recorded in HQ.4" with "with its degree/shift convention recorded in QWittVectors QW.7".
   - HQ.4's old second paragraph (line 35, "Build the compatible complexes over each cyclotomic completion. …") is the cyclotomic descent. Edit 3 removes it from HQ.4. Its construction is the one /31 puts in HQ.3, line 27 (Wagner v2 3.42–3.45, with HR.2–3). At the end of line 29, append its two remaining instructions:
     > Preserve the distinction between a descended complex and a collection of homotopy groups. Carry derived commutative algebra descent only when the input supplies the required multiplicative coherences (§3.8); do not silently upgrade all smooth instances to E∞ algebras.
5. **HabiroRings README, HR.4, first paragraph (line 41).** Replace the paragraph with:
   > Import the degree-zero q-Witt theory from QWittVectors: absolute and relative q-Witt rings qW_m(R/A), their Frobenius, Verschiebung and ghost maps, étale base change (QW.2–QW.4), and the source's obstruction to restriction maps (q-Witt v5 2.14, QW.2). Do not construct them again, and do not introduce a Res_(m/d) API or an unrestricted big q-Witt ring.
6. **HabiroRings README, HR.1, first paragraph (line 17).** Replace the paragraph with:
   > Import torsion-free Λ-rings with commuting Adams operations ψ^m and perfectly covered bases, with their equivalent descriptions, from QWittVectors QW.1, and the generic δ-ring API from [PrismaticCohomology](../PrismaticCohomology/README.md) PR.0.
   
   The second paragraph (étale Frobenius lifts) stays. The Taylor-glued ring of the plan's decision D3 is not part of this finding.
7. **CrystallineCohomology README, CR.4 (lines 164–165).** Replace "Habiro HQ.4 owns the q-deformation and specialization maps into these objects;" with:
   > QWittVectors QW.5 owns the q-deformation and specialization maps into these objects (q-Witt v5 Remark 3.18: maps W_{α+1}Ω → q-W_{p^α}Ω compatible with Frobenius and Verschiebung, not with restriction);
8. **QWittVectors (`research/blueprint/roadmaps/QWittVectors.json`), QW.5 `description`.** After "the latter is initial among $F$-$V$-systems without restrictions." insert:
   > CR.4's Langer–Zink complexes keep their genuine restriction maps. The $q$-V- and $q$-FV-systems of Definitions 3.1, 3.6 and 3.9 have none, and the comparison maps of Remark 3.18 are compatible with $F$ and $V$ only. The two operator systems are never identified.
9. **Graph.** In the union described in the preamble, the edge removals and HQ.3 → HQ.4 give no cycle, and neither do the prefix split of /28 or the /29 placements.

### Not done, and why
- **Plan order or RS-10~2 order.** This is for REV-RS-10~2 and the maintainer. Both graphs are acyclic.
  - Keep the plan: apply edit 2, which needs the removal mechanism REV-RS-10 asked the orchestrator for.
  - Accept RS-10~2's order: drop edit 2. The plan's HQ.3/HQ.4 rows then need an amendment moving the identification of Example 3.12 and the uncompleted V5A4 Theorems 4.8–4.9 to HQ.3. Also check that HQ.4's framed no-go theorem (V5A4 Theorem 5.7) does not use Theorem 4.8: plan §8 item 7 says the notes' outline does, and gives reduction to QW.7 as the alternative.
- **No queue job.** None exists for QWittVectors. Its creation and the promotion are maintainer actions.
- **Outside this finding.** HR.1's Taylor-glued ring (plan decision D3), HQ.9 and the HB changes follow the plan's own integration.

## /28 (medium, duplicate): one framed-q-derivative prefix, shared by PR.6, HQ.1 and QW.6

### What the verifier corrected
- The framing automorphisms, q-derivatives, twisted Leibniz rule and framed Koszul complexes should be built once. PR.6 keeps the q-crystalline site, the envelopes and the prismatic comparison.
- The prefix must not depend on QW.5, and must state the flatness and completeness hypotheses needed to divide γ_i−1 by (q−1)T_i.
- The ordinary and p-completely smooth instances are not interchangeable: they need a completed étale-lifting and base-change comparison.
- Do not make PR.6 import the whole of QW.6, which includes the later q-Witt comparison. HQ.1 imports the right instance, as PLAN-HABIRO requires.

### State on main (1b1aeb19)
- **PR.6** (PrismaticCohomology README, lines 184–186): "Construct q-PD pairs, q-crystalline envelopes and the q-crystalline site of BS22 §16. Prove the q-Poincare lemma, framed polynomial computation, change of framing and cocycle descent." PR.6 requires AI.4 and PR.3.
- **Draft QW.6** has the bullets "*Framings and $q$-derivatives*" and "*Framed complexes*" and requires QW.5.
- **QWittVectors, section "Boundaries":** "PR.6 builds them without importing QW, and `HabiroCohomologyFoundations` HQ.1 records the comparison."
- **HQ.1** (line 11): "Import the local q-crystalline site, framed q-difference complex and its p-complete q-prismatic comparison from PrismaticCohomology PR.6."
- **A third copy.** The HQ.1 packet plans the uncompleted instance itself, as node HQ.1/the-coordinate-dependent-q-de-rham-complex. Its hypotheses: an étale framing, "x_i and q−1 form a regular sequence on S⟦q−1⟧, since S is flat over A[x_1, …, x_d]".
- **RS-10~2:** HQ.1 is the interim holder of the uncompleted framed complex "until QWittVectors is in the atlas (then QW.6)". It adds the links QW.6 → HQ.1 and QW.6 → HQ.2, and has no prefix.

### Fix (batch Q)
1. **New stage `QWittVectors:QW.6:framings`**, "Framings, q-derivatives and framed q-de Rham and q-Hodge complexes". It is added to `stages` of `research/blueprint/roadmaps/QWittVectors.json` before QW.6, with `requires`: ["AInfCohomology:AI.1", "DerivedDeRhamCohomology:DD.1"]. It needs no q-Witt theory. Targets (q-Witt v5, arXiv:2410.23078v5, 4.7–4.8, p. 57):
   - **Setting and γ_i.** A is a ring; the Λ-structure is not used. R is smooth over A with an étale framing □: A[T_1,…,T_n]→R. □ makes A[T]⟦q−1⟧→R⟦q−1⟧ (q−1)-completely étale, and R⟦q−1⟧→R is a (q−1)-complete pro-infinitesimal thickening. So the A-algebra map T_i↦qT_i lifts uniquely to γ_i on R⟦q−1⟧. Lifting against R⟦q−1⟧/(q−1)T_i shows γ_i≡id mod (q−1)T_i. The γ_i commute (infinitesimal lifting again), and they are automorphisms.
   - **Hypotheses for the division.** (q−1)T_i must be a non-zero-divisor on R⟦q−1⟧, so that q-∂_i f:=(γ_i f−f)/(qT_i−T_i) is well defined. This holds because □ is flat, so T_i is a non-zero-divisor on R.
   - **Leibniz rule and complexes.** The twisted Leibniz rule q-∂_i(fg)=f q-∂_i g+γ_i(g) q-∂_i f holds. q-Ω^*_{R/A,□} is the Koszul complex of the q-∂_i, and q-Hdg^*_{R/A,□} the Koszul complex of the (q−1)q-∂_i. Both carry the non-commutative dg-algebra structure of 4.8, and q-Ω^*_{R/A,□}/(q−1)≅Ω^*_{R/A}.
   - **The (p,q−1)-complete instance** (the one PR.6 uses). For a p-completely smooth algebra with a p-completely étale framing over Â_p, the same construction lifts against the (p,q−1)-complete thickening. Record the non-zero-divisor hypothesis: T_i acts injectively on R̂⟦q−1⟧, for example when R̂ is p-torsion-free and p-completely flat over Â⟨T⟩. This is a proof obligation: the argument of 4.7 with (p,q−1)-complete thickenings, not stated in a source read.
   - **Completed base change.** For R smooth over A with étale □, the (p,q−1)-completion of q-Ω^*_{R/A,□} is the complex of (R̂_p,□̂), with the γ_i matching by uniqueness of lifts. The same holds for q-Hdg^*. Wagner v2 uses this identification in the proof of Theorem A.1(d) (p. 75) without stating it. Proof obligation.
   - **Acceptance.** R=A[T] with the identity framing gives the Jackson derivative T^n↦[n]_qT^{n−1}. For ℤ[T] with the framings T and T+1 the two complexes differ.
2. **QW.6 `description`.** Replace the text from "- *Framings and $q$-derivatives.*" up to and including "Both carry the non-commutative dg algebra structures of Wagner 4.8, and" (the first bullet and the first three sentences of the second) with:
   > - *Framed complexes.* Imported from QW.6:framings: the framings, the $\gamma_i$, the $q$-derivatives, the twisted Leibniz rule, $q\Omega^*_{R/A,\square}$ and $q\mathrm{Hdg}^*_{R/A,\square}$ with their non-commutative dg algebra structures (Wagner 4.7–4.8, with the V5A4 definitions cited there).

   The text then continues unchanged with " Lemma 4.17 identifies that graded algebra structure together with the Bockstein differentials. Moreover …". Add "QWittVectors:QW.6:framings" to QW.6's `requires`. The new stage's `description` carries the V5A4 locators now in the removed text (Definitions 2.1, 2.3, 2.7, 2.10, 2.12, 3.1–3.2; Remarks 2.4–2.5; Lemma 2.6; Example 3.4). They are the plan's and were not re-read.
3. **QWittVectors `readme`.** In "## Layers", before "- **QW.6**", insert "- **QW.6:framings** Framings, $q$-derivatives and framed $q$-de Rham and $q$-Hodge complexes (needs no $q$-Witt theory)." In "## Boundaries", replace the PR.6 bullet with:
   > - `PrismaticCohomology` PR.6 owns $q$-PD pairs, $q$-crystalline envelopes, the $q$-crystalline site and the $p$-complete comparison of framed $q$-de Rham complexes with prismatic cohomology. It imports the framed complexes, in their $(p,q-1)$-complete instance, from QW.6:framings, which also proves their completed base change from the uncompleted instance. `HabiroCohomologyFoundations` HQ.1 imports both instances from QW.6:framings.
4. **PrismaticCohomology README, PR.6** (the README is wrapped, so sentences span lines).
   - Lines 185–186: replace "Prove the q-Poincare lemma, framed polynomial computation, change of framing and cocycle descent." with:
     > Import the framings, q-derivatives and framed q-de Rham and q-Hodge complexes, in their p-completed instance, from QWittVectors QW.6:framings; do not construct them again. Prove the q-Poincare lemma, the computation of q-crystalline cohomology of a framed algebra by that complex, change of framing and cocycle descent.
   - Lines 201–202: replace "it imports these exact local chart computations and DD's q=1 specialization." with:
     > it imports the framed complexes from QW.6:framings, this stage's q-crystalline and prismatic comparisons, and DD's q=1 specialization.
   - Add QW.6:framings → PR.6.
5. **HQ README, HQ.1, line 11.** Replace "Import the local q-crystalline site, framed q-difference complex and its p-complete q-prismatic comparison from PrismaticCohomology PR.6." with:
   > Import the framed q-de Rham and q-Hodge complexes of an étale-framed smooth algebra, in the uncompleted and the (p,q−1)-completed instance together with their completed base-change comparison, from QWittVectors QW.6:framings, and the local q-crystalline site and the p-complete q-prismatic comparison from PrismaticCohomology PR.6.

   Add QW.6:framings → HQ.1. The packet node HQ.1/the-coordinate-dependent-q-de-rham-complex moves to QW.6:framings, and its consumers re-point to it.
6. **For REV-RS-10~2.** Replace the links QW.6 → HQ.1 and QW.6 → HQ.2 (the forwarding for the narrowed HQ.1) with QW.6:framings → HQ.1 and QW.6:framings → HQ.2. The other QW.6 links stay, because they need Theorem 4.27. Also add QW.6:framings → PR.6.
7. **Graph.** the cycle test for `AI.1` → `PR.6`, the cycle test for `DD.1` → `PR.6`, the cycle test for `AI.1` → `HQ.1` and the cycle test for `DD.1` → `HQ.1` are all acyclic: there is no path from PR.6 or HQ.1 back to AI.1 or DD.1. In the union there is no path between QW.6:framings and QW.5 in either direction, and none from PR.6 to QW.6:framings.

### Not done, and why
- **No forwarding needed.** AI.7, CP.1 and the draft RS.1 consume PR.6's comparison theorems, which PR.6 keeps.
- **Interim holders.** Until QWittVectors is promoted, PR.6 and the HQ.1 packet keep their current framed computations. This follows RS-10~2's interim rule.
- **Unread source.** BS22 §16 was not re-read. The p-complete instance and the completed base change are kept as proof obligations.

## /29 (medium, missing): q-connections, the framed Habiro complex and the twisted branch, placed as PLAN-HABIRO decides

### What the verifier corrected
- The live HQ stages lack two things. One is the module-with-q-connection target that draft HS.1 imports. The other is the framed Habiro complex, which the accepted plan assigns to HQ.4. Add them by implementing the plan.
- **Sources.**
  - Wagner v2 Example 3.12 (pp. 25–26) constructs γ_i on ℋ_{S/A[x]} and the Koszul complex of (γ_i−1)/x_i. On a torus γ_i−1 may be used after the basis change.
  - Corollary 3.54 (pp. 51–52) gives the graded and Bockstein comparison.
  - Scholze 1606.01796 §7 (pp. 15–16) supports Definition 7.3 only. Coordinate independence is his Conjecture 7.5, and he proves none of the modified-connection or quotient-stack claims.
- Supply the precise semilinear-automorphism and descent construction for the torus equivalence, and keep any missing proof as a gap.
- The twisted q-de Rham constructions 3.14–3.20, 3.22 and 3.29 belong to HQ.2, not HQ.3.

### State on main (1b1aeb19)
- **No q-connections anywhere.** No HQ stage mentions q-connections. HS.1 (draft AnalyticHabiroStack) targets "The algebraic identification of $D_{qc}(\mathbb G_{m,\mathcal H}/q^{\mathbb Z})$ with modules with modified $q$-connection, imported from HQ.1", and requires HQ.1. The HQ.1 packet has no q-connection node. RS-10~2's HQ.1 `keeps` says "retain PLAN-HABIRO q-connection/module applications", which is consistent.
- **Example 3.12.** The packet node HQ.3/the-coordinate-model-and-the-etale-case already states it, both the framed filtration and the Koszul model, with the gap "The Koszul model of the framed Habiro-Hodge complex is asserted without proof". HQ.3/the-cohomology-of-the-reduction-for-smooth-algebras states Corollary 3.54.
- **The plan's placement.** Example 3.12 and Corollary 3.54 are HQ.3's (review S4). The framed Habiro ring, the identification of its Koszul complex and the uncompleted V5A4 Theorems 4.8–4.9 are HQ.4's, with HQ.3 → HQ.4.
- **The twisted branch** is in the packet's HQ.4 (see the /27 table).
- **RS-10~2** places the Example 3.12 identification in HQ.3 permanently. That is the conflict recorded in /27.

### Fix
1. **HQ README, HQ.1, end of line 13 (batch now).** Append:
   > Own modules with q-connection. In Scholze's form (arXiv:1606.01796v1, Definition 7.3, p. 15): for a smooth ℤ-algebra R with framing □: ℤ[T_1,…,T_d]→R, a finite projective R⟦q−1⟧-module M with d commuting maps ∇_{q,i}: M→M satisfying ∇_{q,i}(fm)=γ_i(f)∇_{q,i}(m)+∇_{q,i}(f)m, where ∇_{q,i}(f)=(γ_i(f)−f)/(qT_i−T_i). Framing independence of this category is Scholze's Conjecture 7.5 (p. 16) and is not a target. The relative definition over a Λ-ring base, modified q-connections with their twisted tensor product, and the other V5A4 module statements are owned here as PLAN-HABIRO §6.5 lists them (V5A4 Definitions 2.15 and 2.18, Remark 2.20 and the rest of that row). For AnalyticHabiroStack HS.1, prove the torus description. Let T^d:=Spec ℋ[x_1^{±1},…,x_d^{±1}] over the Habiro ring ℋ, where q is a unit, with σ_i(x_j)=q^{δ_{ij}}x_j. Descent along the (q^ℤ)^d-torsor T^d→T^d/(q^ℤ)^d gives D_qc(T^d/(q^ℤ)^d)≃D(ℋ[x^{±1}])^{hℤ^d}, the homotopy fixed points of the action by the σ_i^*. On the heart these are ℋ[x^{±1}]-modules with d commuting σ_i-semilinear automorphisms γ_{i,M}; equivalently, modules over the skew group ring ℋ[x^{±1}]⋊ℤ^d. Identify them with modified q-connections through γ_{i,M}=∇̃_{i,M}+id, deciding from V5A4 whether invertibility of γ_{i,M} is part of the definition. No source read writes this equivalence out, so it is a proof obligation.
2. **Example 3.12 and Corollary 3.54 in HQ.3 (batch now).** At the end of HQ.3's line 29 (after the /31 edit) append:
   > Own Wagner v2 Example 3.12 (pp. 25–26): the framed filtration fil^n_{q-Hdg,□}:=(q−1)^{max(n−∗,0)}q-Ω^∗_{S/A,□} of an étale-framed smooth S, pulled back to q-dR_{S/A}, an E₀-algebra in the category of pairs whose q-Hodge complex is q-Hdg^∗_{S/A,□}. Own also Corollary 3.54 (pp. 51–52): for smooth S the filtration of Theorem 3.11(b) is the Whitehead filtration, H^∗(q-𝓗dg_{S/A}/(q^m−1))≅q-W_mΩ^∗_{S/A} as graded A[q]/(q^m−1)-modules (as algebras when the pair is at least E₁), and the q-de Rham–Witt differential is the Bockstein differential. The explicit Koszul model of q-𝓗dg_{S/A,□} (the second half of Example 3.12) is HQ.4's under PLAN-HABIRO, and is held here until HQ.3 precedes HQ.4 in the atlas.
3. **The framed Habiro ring in HQ.4 (batch Q, with /27 edit 2).** This is /27 edit 3: γ_i on ℋ_{S/A[x]}; the Koszul complex of (γ_i−id)/x_i, or of γ_i−id after rescaling for a toric framing; its identification with q-𝓗dg_{S/A,□} as a gap; and the uncompleted computation from Corollary 3.54. The packet's Koszul-model half of HQ.3/the-coordinate-model-and-the-etale-case then moves to HQ.4, with its gap.
4. **The twisted branch in HQ.2 (batch Q).** Append to HQ.2's line 21:
   > Own Wagner v2's twisted q-de Rham branch (PLAN-HABIRO §6.5): the twisted complexes q-Ω^{(m)}_{S/A} glued by the fracture squares of Lemma 3.15 (3.14–3.18, pp. 28–30); Proposition 3.19 (p. 31: q-Ω^{(m)}_{S/A}/(q^m−1)≃q-W_mΩ_{S/A} for smooth S over a perfectly covered base); the Nygaard filtration on q-Ω^{(p^α)} (3.20, p. 32); Proposition 3.22 (p. 32); and Lemma 3.29 (p. 38). Import the q-Witt objects and their Nygaard filtrations from QWittVectors QW.7 and the descent principle from HabiroRings HR.3. HQ.3 uses these for the twisted q-Hodge filtration (3.32–3.41) and does not own them.

   The edges QW.7 → HQ.2 and HR.3 → HQ.2 are RS-10~2 links. They stay acyclic in the union. The six packet nodes listed in the /27 table move from HQ.4 to HQ.2.

### Not done, and why
- **V5A4 is not public.** V5A4's module statements are not restated. Their locators are the plan's, and the blueprint job must read the notes. The notes' printed claims about the torus (plan §3.3) were not checked here.
- **The torus equivalence** is stated with its construction and kept as a gap.
- **The Example 3.12 identification** stays a gap. It is the packet's existing gap, which plan §8 item 5 also records.

## /30 (medium, missing): HQ.6 names its analytic suppliers and keeps the comparison a stated problem

### What the verifier corrected
- HQ.6 has no analytic supplier in the atlas, although PLAN-HABIRO §6.5 names draft HS.3.
- Name SolidAnalyticRings, AnalyticStacks and RingStacksAndTransmutation. Record the import as unresolved until HS.3 is promoted, and then link the base-change functor HS.3 actually supplies.
- **Sources.** Aoki 2603.01877v1 Theorem 1.7 (p. 4) gives a realization functor, not the algebraic–analytic identification. Wagner's thesis §1.45 (printed p. 20, PDF p. 24) still treats compatibility as future work.
- Keep HQ.6 a precisely stated comparison problem, and introduce no equivalence theorem.

### State on main (1b1aeb19)
- **HQ.6 (line 53):** "The campaign's condensed/analytic stack and six-operation owners supply a language for a future analytic comparison. They do not imply that analytic and algebraic Habiro theories coincide."
- **Graph.** HQ.6 requires only HQ.5. The three named ids exist only as draft definitions (`research/blueprint/roadmaps/SolidAnalyticRings.json`, `AnalyticStacks.json`, `RingStacksAndTransmutation.json`, status "draft"), together with AnalyticHabiroStack. None is in the atlas.
- **HS.3** (draft) targets the functor "from $D_{qc}(\mathbb G_{m,\mathcal H}/q^{\mathbb Z})$ to $D_{\mathrm{Hab}}(\mathbb G_m)$ … its comparison with the $q$-Hodge and Habiro–Hodge complexes is owned by `HabiroCohomologyFoundations` HQ.6".
- **The packet** already records the unresolved import: a request to AnalyticHabiroStack:HS.3, and the gap "The analytic side of the comparison layer has no obtainable source and no atlas owner".
- **RS-10~2** has the link HS.3 → HQ.6, which will apply when HS.3 exists.

### Fix
1. **HQ README, HQ.6, line 53 (batch now).** Replace "The campaign's condensed/analytic stack and six-operation owners supply a language for a future analytic comparison." with:
   > The analytic side has no owner in the atlas yet. Its suppliers are draft roadmaps of the accepted PLAN-HABIRO (`research/blueprint/roadmaps/`): SolidAnalyticRings (light condensed and solid mathematics, analytic rings), AnalyticStacks (six-functor formalisms and analytic stacks) and RingStacksAndTransmutation (ring stacks and transmutation). They feed AnalyticHabiroStack HS.3, which owns X↦X^Hab, D_Hab and the base-change functor from D_qc(𝔾_{m,ℋ}/q^ℤ) to D_Hab(𝔾_m). HQ.6 owns only the comparison. Until HS.3 is in the atlas, HQ.6 records this import as unresolved and states the comparison without it; after that, HQ.6 requires HS.3 and uses that functor. Aoki (arXiv:2603.01877v1, Theorem 1.7, p. 4) shows only that Scholze's analytic Habiro stack determines a realization functor. Wagner's thesis (§1.45, printed p. 20) hopes that its three candidates are compatible: the analytic stack, the generic-fibre construction and the algebraic Habiro–Hodge complexes. It does not know how to compare the analytic stack with the generic-fibre construction and leaves that to future work. It says only that the comparison of the generic-fibre and algebraic candidates "should work by a variant of Theorem 1.32".

   The next sentence ("They do not imply that analytic and algebraic Habiro theories coincide.") becomes "Neither implies that analytic and algebraic Habiro theories coincide, and HQ.6 asserts no equivalence."
2. **HQ README, line 7 (batch now).** After "…it is not a complete proof source for a six-functor comparison theorem." append:
   > Aoki's [Berkovich 2-motives and normed ring stacks](https://arxiv.org/abs/2603.01877v1) (Theorem 1.7) gives a Habiro realization functor, not a comparison with algebraic Habiro cohomology.
3. **Edge (batch H).** Add HS.3 → HQ.6 (RS-10~2's link) once AnalyticHabiroStack is promoted. Union check: acyclic. The cycle test cannot run on it, because HS.3 is not an atlas stage.

### Not done, and why
- **No equivalence claimed.** Wagner v2 1.17 (p. 8) expects agreement only after a suitably completed localisation, so nothing stronger is stated.
- **What HQ.6 gains on promotion.** The draft roadmaps' own promotion is a maintainer action. HQ.6 gains its import at that point, and not before.

## /31 (medium, error): Theorem 3.11(b) is stated on the Habiro–Hodge complex

### What the verifier corrected
- Theorem 3.11 (Wagner v2 p. 25) distinguishes q-Hdg from q-𝓗dg: (a) recovers q-Hdg by (q−1)-completing q-𝓗dg, and (b) gives the uncompleted q-Witt graded pieces on q-𝓗dg.
- HQ.3 defines only the completed colimit and puts the uncompleted pieces on it.
- Construct the Habiro object by 3.42–3.45 and state (b) there. Keep the completed comparison separate, with completed graded pieces and its filtration and completion justification. This is not a notation-only correction.

### State on main (1b1aeb19)
- **HQ.3 (line 29), unchanged:** "For each positive m construct the exhaustive ascending filtration on qHdg/(q^m−1) whose graded pieces are Σ^(−i)qW_m dR^i, using the **derived** m-truncated q-de Rham–Witt objects of Wagner v2 Theorem 3.11(b)." Line 27 constructs only "qHdg as the (q−1)-completed colimit".
- **The rendered p. 25** reads "the quotient q-𝓗dg_{−/A}/(q^m−1) admits an exhaustive ascending filtration". This was checked on the rendered page.
- **The packet is already right:**
  - HQ.3/the-m-truncated-descent (3.42);
  - HQ.3/the-habiro-hodge-complex (3.45);
  - HQ.3/habiro-descent-the-q-de-rham-witt-filtration (3.11(b) on "the quotient of the Habiro-Hodge complex by q^m-1").
- **RS-10~2** does not touch this.

### Fix (batch now)
1. **HQ README, line 27.** Replace "Prove Theorem 3.11: the functor on the category of **chosen q-Hodge-filtered inputs** factors through HR.2's Habiro-complete category and is symmetric monoidal there." with:
   > Construct the Habiro–Hodge complex separately (Wagner v2 3.42–3.45, pp. 45–47). For each m, the (q^m−1)-complete descent q-𝓗dg_{R/A,m} is the (q^m−1)-completed colimit of the twisted q-de Rham complex q-dR^{(m)}_{R/A} (3.14; HQ.2's under PLAN-HABIRO, held by HQ.4 until QWittVectors is installed) along the twisted q-Hodge filtration (Proposition 3.39). Prove the equivalences (q-𝓗dg_{R/A,m})^∧_{(q^n−1)}≃q-𝓗dg_{R/A,n} for n∣m (Proposition 3.43), and set q-𝓗dg_{R/A}:=lim_m q-𝓗dg_{R/A,m} (3.45); it is symmetric monoidal (Lemma 3.46). Prove Theorem 3.11(a): on the category of **chosen q-Hodge-filtered inputs**, the q-Hodge complex functor factors symmetric monoidally as q-𝓗dg_{−/A} into HR.2's Habiro-complete category followed by (q−1)-completion, so qHdg≃(q-𝓗dg)^∧_{(q−1)}.
2. **HQ README, line 29.** Replace "For each positive m construct the exhaustive ascending filtration on qHdg/(q^m−1) whose graded pieces are Σ^(−i)qW_m dR^i, using the **derived** m-truncated q-de Rham–Witt objects of Wagner v2 Theorem 3.11(b)." with:
   > For each positive m construct the exhaustive ascending filtration of Wagner v2 Theorem 3.11(b) (p. 25) on the **Habiro–Hodge** quotient q-𝓗dg_{−/A}/(q^m−1), not on qHdg/(q^m−1). It is lax symmetric monoidal, and its graded pieces are Σ^(−i)q-W_m dR^i_{−/A}, the **derived** m-truncated q-de Rham–Witt objects. The (q−1)-complete object carries only the completed statement, which is proved separately. qHdg/(q^m−1)≃(q-𝓗dg/(q^m−1))^∧_{(q−1)} carries the completed filtration, whose graded pieces are (Σ^(−i)q-W_m dR^i)^∧_{(q−1)} and whose (q−1)-completed colimit is qHdg/(q^m−1). For smooth S this filtration is finite, and H^∗(qHdg_{S/A}/(q^m−1))≅(q-W_mΩ^∗_{S/A})^∧_{(q−1)}. This is Wagner v2 p. 6 (the framed case is q-Witt v5 Theorem 4.27), and it uses the bounded (q−1)^∞-torsion of q-W_mΩ^∗_{S/A} (q-Witt v5 Lemma 4.6). Test: for A=R=ℤ and m=2, q-𝓗dg_{ℤ/ℤ}/(q²−1)=ℋ/(q²−1)=q-W_2(ℤ)≅ℤ[q]/(q²−1), which is countable. But qHdg_{ℤ/ℤ}/(q²−1)=ℤ⟦q−1⟧/(q²−1) surjects onto ℤ⟦q−1⟧/(q+1)≅ℤ_2, so it is uncountable.

   The test's inputs are Corollary 3.13 (p. 27), Remark 2.14 (p. 19), Theorem 2.9 (p. 16), Theorem 3.11(a), and q-Witt v5 Corollary 2.37 (p. 29).

### Not done, and why
- **Nothing is left for HQ.3.** The packet nodes already carry the construction. If HQ.3's packet adds the (q−1)-completed statement, it is an import of QW.6's Theorem 4.27, held by HQ.4 until QWittVectors is installed. It is not a second proof.

## /32 (medium, error): HR.1 → HQ.1

### What the verifier corrected
- There is no path from HR.1 to HQ.1 or HQ.2. HQ.1 assumes a perfectly covered Λ-ring, and HR.1 owns that coefficient structure.
- Add HR.1 → HQ.1 (there is no reverse path) and keep HQ.1 → HQ.2.
- When QW.1 owns general Λ-rings, replace the generic request with QW.1's precise export rather than leave a second owner.

### State on main (1b1aeb19)
- **Graph.** HQ.1 requires DD.2 and PR.6. A path search from `HR.1` to `HQ.1` gives "no path".
- **HR.1 owns the structure.** The promoted HR.1 has the nodes HR.1/lambda-rings-with-commuting-adams-operations and HR.1/perfectly-covered.
- **The packet uses it.** HQ.1/what-this-layer-imports-and-what-it-owns lists HabiroRings:HR.1/lambda-rings-with-commuting-adams-operations as a prerequisite; HQ.5/the-quasi-lci-inputs-and-condition-R lists HR.1/perfectly-covered; and the packet's request to HR.1 asks for both.
- **What Theorem A.1 needs** (Wagner v2 p. 69) is only "a Λ-ring that is p-torsion free for all primes p".
- **RS-10~2** has the link HR.1 → HQ.1 and, later, QW.1 → HQ.1.

### Fix
1. **Edge (batch now).** Add HR.1 → HQ.1: HQ.1 `requires` becomes ["DerivedDeRhamCohomology:DD.2", "DerivedDeRhamCohomology:DD.3", "HabiroRings:HR.1", "PrismaticCohomology:PR.6"] (DD.3 is from /34). The cycle test for `HabiroRings:HR.1` → `HabiroCohomologyFoundations:HQ.1` gives "acyclic (no path HQ.1 -> HR.1)". HQ.1 → HQ.2 stays.
2. **HQ README, line 13.** After "Own the global arithmetic gluing over a perfectly covered Λ-ring A and its admitted algebras, following Wagner Appendix A." insert:
   > Import Λ-rings with commuting Adams operations and perfectly covered bases from HabiroRings HR.1 (QWittVectors QW.1 once it is installed); Theorem A.1 itself needs only a Λ-ring that is p-torsion-free for every p, and perfect covering is used from HQ.3 on.
3. **Batch Q.** Add QW.1 → HQ.1 (an RS-10~2 link).
   - In the HQ.1 packet, re-point the prerequisite HabiroRings:HR.1/lambda-rings-with-commuting-adams-operations, and the request to HabiroRings:HR.1, to the QW.1 nodes that take over HR.1's Λ-ring and perfectly-covered nodes (/27 table).
   - In HQ.1's inserted sentence, drop "HabiroRings HR.1 (" and ")".
   - HR.1 → HQ.1 then remains only as a coarse edge. Its removal is optional and for the maintainer.

### Not done, and why
- **Nothing else.** The edge also documents a requirement the packet already has.

## /33 (medium, error): HQ.5-trace → HQ.7, and the plan's HQ.7 requirements

### What the verifier corrected
- HQ.7 tests the spherical-lift trace instance, but there is no path HQ.5-trace → HQ.7, and HQ.5-trace has no consumers. Add the edge; there is no reverse path.
- PLAN-HABIRO §6.5 already specifies this, together with replacing HQ.6 by HQ.4, HQ.5 and HQ.5-trace. Coordinate with those decisions.

### State on main (1b1aeb19)
- **Graph.** HQ.7 requires HQ.6 only. HQ.5-trace has no outgoing edges.
- **HQ.7 text (line 57):** "…and a 2-inverted trace-theoretic input with an explicit spherical lift."
- **RS-10~2** has the links HQ.4 → HQ.7, HQ.5 → HQ.7 and HQ.5-trace → HQ.7, but **keeps HQ.6 → HQ.7**. The plan (review S3) drops it, so that the algebraic tests do not wait for the analytic track once HQ.6 requires HS.3.

### Fix
1. **Edges (batch now).** Add HQ.5-trace → HQ.7, and the plan's HQ.4 → HQ.7 and HQ.5 → HQ.7. The last two are already implied through HQ.6 and are added only to document the imports. The cycle test gives "acyclic (no path HQ.7 -> …)" for all three.
2. **Removal, for the maintainer.** Remove HQ.6 from HQ.7's `requires` (plan S3), no later than when HS.3 → HQ.6 is applied (/30, batch H). HQ.7 has no consumers, so this cannot create a cycle, and the union check confirms it.

### Not done, and why
- **Conflict with RS-10~2** on HQ.6 → HQ.7, for REV-RS-10~2. This report follows the plan. If RS-10~2's choice stands, HQ.7 will wait for SolidAnalyticRings → AnalyticStacks → RingStacksAndTransmutation → AnalyticHabiroStack HS.3 once HS.3 → HQ.6 is applied.

## /34 (medium, error): HQ.2's DerivedDeRham imports corrected, and the log edge removed

### What the verifier corrected
- The direct DD.6 → HQ.2 edge imposes log-crystalline geometry on an ordinary derived-de-Rham consumer. Request its removal from the maintainer.
- HQ.2 attributes generic complete filtered modules to EnhancedDerivedSheaves; they are DD.1's.
- DD.2 and DD.1 are already ancestors, through DD.2 → HQ.1 → HQ.2 and DD.1 → AI.1 → HQ.2. Direct links only document the imports; they do not repair an unavailable theorem.

### State on main (1b1aeb19)
- **Graph.** HQ.2 requires AI.1, DD.6 and HQ.1.
- **Line 17:** "Import ordinary derived de Rham and the Hodge filtration from DerivedDeRhamCohomology; … Build complete filtered modules over the (q−1)-filtered coefficient ring, their associated graded, completion and filtered tensor products from EnhancedDerivedSheaves."
- **What the removal changes.** Without DD.6 → HQ.2, the ancestors of HQ.2–HQ.5 lose CR.5, CR.5:log-algebra, DD.6 and **DD.3**, and those of HQ.8 lose DD.3 and DD.6 (computed). But the HQ.1 packet requests DD.3 (derived Cartier and the conjugate filtration) for HQ.1/the-local-derived-q-de-rham-complex and HQ.5/staticity-for-quasi-lci-inputs. So DD.3 must enter directly.
- **The packet already has it right.** It requests DD.1 for "Complete filtered objects in an enhanced derived category over a filtered coefficient ring, with their associated graded, completion, Rees description and completed filtered tensor product", and DD.2 for the Hodge-filtered derived de Rham complex.
- **RS-10~2** does not touch DD.6 → HQ.2.

### Fix (batch now)
1. **HQ README, line 17.**
   - Replace "Import ordinary derived de Rham and the Hodge filtration from DerivedDeRhamCohomology;" with:
     > Import ordinary derived de Rham and its Hodge filtration (the filtered object, its Hodge completion and filtered base change) from DerivedDeRhamCohomology DD.2;
   - Replace "Build complete filtered modules over the (q−1)-filtered coefficient ring, their associated graded, completion and filtered tensor products from EnhancedDerivedSheaves." with:
     > Specialize DerivedDeRhamCohomology DD.1's complete filtered modules, associated graded, completion and completed filtered tensor products to the (q−1)-adically filtered coefficient ring; EnhancedDerivedSheaves supplies only the ambient enhanced categories and E4's sheaf-level application of DD.1, not a second generic completion. HQ.2 uses no logarithmic geometry: DerivedDeRhamCohomology DD.6 is not an input.
2. **Edges.**
   - Add DD.2 → HQ.2 and DD.1 → HQ.2, to document the imports. HQ.2 `requires` becomes ["AInfCohomology:AI.1", "DerivedDeRhamCohomology:DD.1", "DerivedDeRhamCohomology:DD.2", "HabiroCohomologyFoundations:HQ.1"].
   - Add DD.3 → HQ.1, so that the packet's DD.3 inputs stay upstream.
   - The cycle test gives "acyclic" for all three.
3. **Removal, for the maintainer.** Remove "DerivedDeRhamCohomology:DD.6" from HQ.2's `requires` and the matching `stageEdges` record, and remove HQ.2 from DD.6's `consumers`. The union check confirms no path from HQ.2 to DD.6.

### Not done, and why
- **DD.4 (observation only).** The packet also requests DD.4 for HQ.1 nodes, and DD.4 is not an ancestor of HQ.1 even now. That is outside this finding's authorized scope, and is left to the maintainer.

## /35 (medium, other): descent and perfectness as separate targets, with source status and named gaps

### What the verifier corrected
- This is an insufficiently expanded proof obligation, not evidence that the conclusions are false.
- Wagner v2 §1.16 (p. 8) states the scheme construction and smooth-proper perfectness. The body develops the algebra-level filtrations, and thesis §1.45(c) only summarizes the sheaf construction.
- Give separate descent and perfectness targets, with the exact base, dimension and localization hypotheses, the source status and the imported lemmas.
- Appendix B.2–B.4 detect completion and vanishing only. So a perfection criterion, a uniform-amplitude and finite-presentation argument, and compatibility of RΓ with the completed base changes must be supplied or recorded as gaps.
- Declare no new source error.

### State on main (1b1aeb19)
- **HQ.5 (line 39):** "Extend to smooth schemes by descent; for smooth proper schemes retain the perfectness result over the **Habiro completion of the localized ring**, not a raw localization of H."
- **Wagner v2 1.16 (p. 8)** defines q-𝓗dg_{X/ℤ}∈D(X,ℋ) "for any smooth scheme X over Z such that all primes p⩽dim(X/Z) are invertible on X", and says RΓ(X,q-𝓗dg_{X/ℤ}) "will be a perfect complex over the Habiro-completion of H[1/N]". "Perfect complex" occurs nowhere else in v2 or in the thesis. Thesis 1.45(c) (PDF p. 24) only summarizes the sheaf on X_{ℤ[1/n!]}.
- **The packet already has two separate nodes:**
  - HQ.5/algebraic-habiro-cohomology-of-a-scheme: over ℤ only, "the source asserts the gluing without proof"; the node supplies a proof route.
  - HQ.5/perfectness-for-smooth-proper-schemes: its gap names perfectness modulo q^m−1 and a Nakayama-type criterion.
- **Source issue E303** records the status as kind "gap" ("affects": "a stated result"), not "error".
- **RS-10~2's HQ.5 `keeps`** lists "scheme descent and smooth-proper perfectness" without their status.

### Fix
1. **HQ README, line 39 (batch now; consolidated in /40).** Replace "Extend to smooth schemes by descent; for smooth proper schemes retain the perfectness result over the **Habiro completion of the localized ring**, not a raw localization of H." with:
   > Two scheme-level targets are stated separately, each with the status the source gives it. **Descent.** For a smooth scheme X over ℤ on which every prime p≤dim(X/ℤ) is invertible, glue the Habiro–Hodge complexes of Theorem 4.11's canonical filtrations on affine opens to q-𝓗dg_{X/ℤ}∈D(X,ℋ) (Wagner v2 1.16, p. 8; thesis 1.45(c)). The source states this in its introduction without a body proof, so HQ.5 proves Zariski (or étale) descent for S↦q-𝓗dg_{S/ℤ} on Sm_{ℤ[dim!^{−1}]}, using functoriality in open immersions and étale maps, which preserve the dimension bound. The source states it over ℤ only; no version over a general perfectly covered Λ-ring is claimed. **Perfectness.** For X smooth and proper over ℤ[1/N], with every prime p≤dim(X/ℤ) dividing N, the source expects RΓ(X,q-𝓗dg_{X/ℤ}) to be a perfect complex over the **Habiro completion of ℋ[1/N]**, not over a raw localization of ℋ (1.16, stated without proof). This is a proof obligation with four named gaps: (i) perfectness of RΓ(X,q-W_mΩ^i_{X/ℤ}) over ℤ[1/N][q]/(q^m−1); (ii) compatibility of RΓ with reduction modulo q^m−1 and with the completed base change to the Habiro completion of ℋ[1/N]; (iii) a uniform bound on Tor-amplitude and a finite-presentation argument across all m; (iv) a perfectness criterion for Habiro-complete modules. Appendix B supplies none of (iv): B.2–B.4 detect only completeness and vanishing.
2. **HQ.1 packet, gap "Perfectness of algebraic Habiro cohomology is asserted in the source without proof".** Append to `detail`:
   > Besides (i) and (ii), a proof also needs: a uniform bound on the Tor-amplitude of RΓ(X, q-Hdg_{X/Z})/(q^m − 1) over Z[1/N][q]/(q^m − 1), independent of m, with a finite-presentation argument; and the compatibility of RΓ with the completed base change to the Habiro completion of H[1/N] and with reduction modulo q^m − 1 (FIX-RT-AREA-etale /35). Lemmas B.2–B.4 of the q-Hodge paper detect completeness and vanishing only.
3. **For REV-RS-10~2**, `layers."HabiroCohomologyFoundations:HQ.5".keeps`: replace "scheme descent and smooth-proper perfectness over the Habiro completion of the localized base" with "scheme descent (over ℤ, primes up to the dimension inverted) and smooth-proper perfectness over the Habiro completion of the localized base, both stated by the source in its introduction (1.16) without a body proof and planned as proof obligations with named gaps".

### Not done, and why
- **No new source issue.** E303 stays kind "gap". It is not upgraded to an error: the review finds no evidence the statement is false.
- **The gaps stay open.** The four named inputs are not proved here.

## /37 (low, error): WC.2's decomposition node moves to EDC.8, and a functional-equation node replaces it

### What the verifier corrected

- WC.2's only node proves the proper-smooth Lefschetz trace formula, which belongs to EDC.8. Keep it there, or as an import.
- Add the missing WC.2 derivation from the graded Poincaré pairing and EDC.8's determinant relation, together with WC.1's rationality.
- Keep Δ² = q^{dχ}, the descent of the multiplier to ℚ and the parity and sign justification. Do not replace Δ by an unexplained fractional power of q.

### State on main (1b1aeb19)

- **The decomposition is unchanged since 2026-09-16.** In `data/decompositions/WeilConjectures.json`, node `WeilConjectures:WC.2/lefschetz-trace-formula-proper-smooth-via-duality` has one incoming link, from EDC.2, and no consumers. Its source match says "the functional equation is not derived here".
- **WC.2's coverage records what is missing:** "The exact functional equation Z(X, 1/(q^d T)) = ± q^{dχ/2} T^χ Z(X, T) and the determinant identity were not read from any source". Gap "Functional equation not read from a source".
- **EDC.8's coverage in the EDC decomposition is "not_read".** EDC.8's stage text exports "the graded Poincaré pairing and Frobenius similitude … the determinant relation".
- **The WC.0 packet already asks for this node.** `research/blueprint/packets/WeilConjectures--WC.0.json` (scope WC.0–WC.5; job `BP-WeilConjectures--WC.0` pending) lists WC.2 as `not_read`, with remaining "Refine the preserved integrated WC.2 duality argument, with actual cohomological pairings, determinant sign, reciprocal polynomial identities and descent of the functional-equation multiplier." It has no WC.2 node.
- **RS-17's WC.2 keeps:** "Retain the middle determinant, Delta^2=q^(d chi), parity, integral/rational descent and justification before writing fractional powers of q, including ell=2 and dimension-zero tests."
- **RS-17's owner entry 37** gives EDC.8 "Actual graded Poincare/Frobenius pairing and geometric reciprocal characteristic-polynomial/determinant relation".

### Fix

**37.1 Move the node to EDC.8.**
- In `data/decompositions/EtaleDualityAndPerverseSheaves.json`, add the node with every field unchanged except:
  - `id` → `EtaleDualityAndPerverseSheaves:EDC.8/lefschetz-trace-formula-proper-smooth-via-duality`;
  - `parentStageId` → `EtaleDualityAndPerverseSheaves:EDC.8`.
- Copy its source record `sga4half` into that file's `sources`.
- Add the link EDC.2 → the moved node, with the existing reason and sources. Cycle check EDC.2 → EDC.8: acyclic.
- EDC.8's coverage becomes `partial`, remaining: "Only [Cycle] §3 (3.1–3.8) is decomposed, moved from WeilConjectures; its §§1–2 inputs (trace map, cycle class, Remark 3.5's Tor formula) and the graded-pairing determinant relation are not."
- In `data/decompositions/WeilConjectures.json`:
  - delete the node and its link from EDC.2;
  - remove its id from the `neededBy` of the gap "Grothendieck's trace formula is imported, not decomposed", keeping the WC.1 node.

**37.2 New node in `data/decompositions/WeilConjectures.json`.** `BP-WeilConjectures--WC.0` keeps this id when it refines WC.2.

```json
{
 "id": "WeilConjectures:WC.2/zeta-functional-equation-from-poincare-duality",
 "parentStageId": "WeilConjectures:WC.2",
 "title": "Z(X₀, 1/(q^d T)) = (−1)^χ Δ T^χ Z(X₀, T) with Δ² = q^{dχ}, and its form ±q^{dχ/2} over ℚ",
 "kind": "theorem",
 "statement": "Let X₀ be smooth and proper over F_q of pure dimension d, X = X₀ ⊗ F̄_q, ℓ ≠ p, H^i = H^i(X, Q_ℓ) with geometric Frobenius F, b_i = dim H^i, P_i(T) = det(1 − FT | H^i), χ = Σ_i (−1)^i b_i and Δ = Π_i det(F | H^i)^{(−1)^i}. (i) F is invertible on each H^i, b_{2d−i} = b_i, and P_{2d−i}(T) = (−1)^{b_i} q^{d b_i} det(F | H^i)^{−1} T^{b_i} P_i(1/(q^d T)). (ii) Z(X₀, 1/(q^d T)) = (−1)^χ Δ T^χ Z(X₀, T) in Q_ℓ(T), and Δ² = q^{dχ}. (iii) dχ is even, and ε := (−1)^χ Δ lies in ℚ with ε = ±q^{dχ/2}: ε = q^{dχ/2} if d is odd, and ε = (−1)^m q^{dχ/2} if d is even, where m is the multiplicity of q^{d/2} as a root of det(T − F | H^d).",
 "hypotheses": [
  "Pure dimension d, so that EDC.2's trace map and the perfect pairing H^i × H^{2d−i} → H^{2d} → Q_ℓ(−d) exist. X₀ need not be geometrically connected.",
  "Geometric Frobenius, acting on Q_ℓ(−d) by q^d, as in the DWP/WC conventions. Multiplicities are those of characteristic polynomials; F need not be semisimple.",
  "Z(X₀, T) = Π_i P_i(T)^{(−1)^{i+1}} (WC.1/cohomological-formula-from-the-trace-formula) and Z(X₀, T) ∈ ℚ(T) (WC.1/rationality-over-q-via-hankel-determinants) are imported.",
  "Δ is the determinant product of WC.2, not the diagonal: Milne writes χ = (Δ·Δ) for the self-intersection of the diagonal."
 ],
 "proofSteps": [
  "(i) Import from EDC.8 the Frobenius similitude ⟨Fx, Fy⟩ = q^d⟨x, y⟩ of the perfect pairing H^i × H^{2d−i} → Q_ℓ(−d). It gives invertibility of F, b_{2d−i} = b_i, and the roots of P_{2d−i} as the q^d/α for the roots α of P_i, with multiplicity (DWP.0's reciprocal-pairing lemma). Expand P_i(1/(q^d T)) = Π_α(1 − α/(q^d T)).",
  "(ii) Substitute (i) into Z(1/(q^d T)) = Π_i P_i(1/(q^d T))^{(−1)^{i+1}} and reindex i ↦ 2d − i, which leaves (−1)^{i+1} unchanged. The power of T is T^χ and the scalar is Π_i((−1)^{b_i} q^{−d b_i} det(F|H^i))^{(−1)^{i+1}} = (−1)^χ q^{dχ} Δ^{−1}. Since det(F|H^{2d−i}) = q^{d b_i}/det(F|H^i), the factors of Δ for i and 2d − i (i < d) multiply to q^{d b_i (−1)^i}. Since the roots of P_d are stable under α ↦ q^d/α, det(F|H^d)² = q^{d b_d}. Hence Δ² = q^{dχ} and q^{dχ}Δ^{−1} = Δ.",
  "(iii) Parity. For d odd the cup-product pairing on H^d is alternating, by graded commutativity x ∪ y = (−1)^{d·d} y ∪ x, and a perfect alternating form over a field of characteristic 0 forces b_d even. Q_ℓ has characteristic 0 for every ℓ, including ℓ = 2. So χ = 2Σ_{i<d}(−1)^i b_i − b_d is even for d odd, and dχ is always even.",
  "(iii) Descent. Z(X₀, T) ∈ ℚ(T), so ε = Z(X₀, 1/(q^d T))/(T^χ Z(X₀, T)) is a constant in ℚ(T) ∩ Q_ℓ = ℚ. As ε² = Δ² = q^{dχ} with dχ even, ε = ±q^{dχ/2}, an integral power of q (negative if χ < 0). No fractional power is written.",
  "(iii) Sign. For d odd, choose s ∈ Q̄_ℓ with s² = q^d. Then F/s preserves the alternating form on H^d ⊗ Q̄_ℓ, so det(F/s) = 1 (in a symplectic basis, Mathlib's SymplecticGroup.det_eq_one). Hence det(F|H^d) = q^{d b_d/2}, Δ = q^{dχ/2} and ε = q^{dχ/2}. For d even, the roots of P_d other than ±q^{d/2} pair off with equal multiplicities and product q^d, so det(F|H^d) = (−1)^{m′} q^{d b_d/2} with m′ the multiplicity of −q^{d/2}. Then ε = (−1)^{χ+m′} q^{dχ/2}, and χ ≡ b_d ≡ m + m′ (mod 2) gives ε = (−1)^m q^{dχ/2}, Milne's Remark 27.13."
 ],
 "acceptance": [
  "P¹: F = 1 on H⁰ and F = q on H²; χ = 2, Δ = q, Z(1/(qT)) = qT²Z(T).",
  "P²: χ = 3, q occurs once on H², so ε = −q³, as Z(1/(q²T)) = −q³T³Z(T) shows directly.",
  "A smooth projective geometrically connected curve of genus g: ε = q^{1−g}, and the numerator satisfies P(1/(qT)) = q^{−g}T^{−2g}P(T) (compare PAPER-SHENDE-TSIMERMAN-17/curve-reciprocity).",
  "Dimension zero, X₀ = Spec F_{q^m}: χ = m, Δ = det of an m-cycle = (−1)^{m−1}, Z(T) = (1 − T^m)^{−1}, and ε = −1 for every m.",
  "ℓ = 2: the parity step uses only that Q_2 has characteristic 0."
 ],
 "prerequisites": ["EtaleDualityAndPerverseSheaves:EDC.8", "EtaleDualityAndPerverseSheaves:EDC.2", "DeligneWeightsAndPurity:DWP.0", "WeilConjectures:WC.1/cohomological-formula-from-the-trace-formula", "WeilConjectures:WC.1/rationality-over-q-via-hankel-determinants", "mathlib:SymplecticGroup.det_eq_one"],
 "sources": [
  {"sourceId": "milne-lec", "locator": "Theorem 27.12 and its proof, p. 158", "excerpt": "For any complete nonsingular variety X0 over Fq,", "match": "Z(X₀, 1/q^d t) = ±q^{dχ/2} t^χ Z(X₀, t) with χ = Σ(−1)^r β_r, proved from the pairing H^{2d−r}(X, Q_ℓ) × H^r(X, Q_ℓ(d)) → H^{2d}(X, Q_ℓ) → Q_ℓ and F^* = q^d/F_* (Remark 27.4(a))."},
  {"sourceId": "milne-lec", "locator": "Remark 27.13, p. 159", "excerpt": "The sign is + if d is odd or q^{d/2} occurs an even number of times as an eigenvalue of F acting on H^d(X, Qℓ), and is − otherwise.", "match": "The sign in (iii)."}
 ],
 "implementationStatus": "unchecked"
}
```

Add the source record:

```json
{"id": "milne-lec", "title": "Lectures on étale cohomology", "authors": "J. S. Milne", "edition": "Version 2.21, 22 March 2013, 202 pages", "url": "https://www.jmilne.org/math/CourseNotes/LEC.pdf", "sha256": "ac4f122f371d38a44c58c296b7dbf88081d89d2de2334070bff3606771c01077", "readSections": ["§27, 27.1–27.14, pp. 154–159, read 29 September 2026 (text layer, and page images of pp. 158–159)"]}
```

Add links into the new node:

| Link | Reason | Stage-level cycle check |
|---|---|---|
| EtaleDualityAndPerverseSheaves:EDC.8 → node | graded pairing and reciprocal characteristic polynomials | stage edge exists; cycle check acyclic |
| WC.1/cohomological-formula-from-the-trace-formula → node | Z = Π P_i^{(−1)^{i+1}} | cycle check WC.1 → WC.2: acyclic |
| WC.1/rationality-over-q-via-hankel-determinants → node | descent of ε | cycle check WC.1 → WC.2: acyclic |
| DeligneWeightsAndPurity:DWP.0 → node | reciprocal-spectrum lemma | cycle check DWP.0 → WC.2: acyclic |

Replace WC.2's coverage `remaining` with: "The EDC.8 inputs (Frobenius similitude of the Poincaré pairing, reciprocal characteristic polynomials, graded commutativity of the cup product) are imported. Milne proves the pairing identity through F_*F^* = q^d (Remark 27.4(a)); EDC.8 must supply it in the étale setting." Delete the gap "Functional equation not read from a source": Milne 27.12–27.13 is now read, and the node carries the derivation.

### Not done, and why

- **The EDC.8 inputs are not decomposed.** Those are the similitude, graded commutativity and the reciprocal characteristic polynomial; they belong to `BP-EtaleDualityAndPerverseSheaves--EDC.4`, which covers EDC.4–EDC.8.
- **The source reads the pairing another way.** Milne proves the Frobenius relation through F_*, which EDC.8 must provide in the étale setting.
- **Parts of the node are derived here, not quoted.** The Δ-form, the parity step and the descent step are elementary consequences of the pairing, written for this node. Only the ±q^{dχ/2} statement and its sign come from Milne.

## /38 (low, error): DWP.5 no longer requires DWP.4

### What the verifier corrected

- The DWP.4 → DWP.5 edge and the Dependencies entry exist, but DWP.5's proof inputs do not need Weil I's dimension induction. Weil II 1.8.1–1.8.5 (pp. 175–176) and 2.2.8–2.2.10 (pp. 195–196) use the trace formula and rationality, tensor and dual arguments, local monodromy and the analytic positivity package.
- RS-17's DWP.5 supplier list omits DWP.4.
- Remove the blanket prerequisite, keeping DWP.0 and DWP.2, sheaf L-functions, duality, monodromy and the upstream positivity inputs.
- Weil II's introductory phrase alone would not prove the claim.

### State on main (1b1aeb19)

- **The Dependencies line is unchanged.** `content/campaign/DeligneWeightsAndPurity/README.md`, DWP.5 (line 242): "**Dependencies:** DWP.0/DWP.2/DWP.4; EDC.1–2; LPV.0–2; PR196 sheaf L-functions."
- **The atlas has the edge.** In `data/atlas.json`, DWP.5's `requires` includes DWP.4, and there is a stage edge DWP.4 → DWP.5.
- **RS-17 keeps DWP.4 out.** DWP.5's `suppliedBy` is [DWP.0, LPV.1, ArithmeticDirichletSeries Layer 8].
- **Three RS-17 links came from the old edge.** Links 153 (EDC.4 → DWP.5), 196 (LPV.3 → DWP.5) and 204 (LPV.4 → DWP.5) are "Direct handoff of the imported part of DeligneWeightsAndPurity:DWP.4".
- **The Weil II extraction does not need DWP.4 either.** It routes DWP.5's missing steps as a source; none of those items names DWP.4.
- **The DWP.0 packet has not planned DWP.5 yet.** DWP.5 is `not_read` there. Its remaining entry names LPV.1 as the import, not DWP.4.
- **Read at Weil II pp. 175–176.** 1.8.1 uses the cohomological L-function formula (1.4.7.2), convergence (1.4.6) and tensor powers. 1.8.4 uses 1.8.1, finite covers, twisting (1.2.7) and the monodromy-filtration algebra 1.6.14. Neither uses Weil I §7.

### Fix

1. **`content/campaign/DeligneWeightsAndPurity/README.md`, DWP.5.** "**Dependencies:** DWP.0/DWP.2/DWP.4; EDC.1–2; LPV.0–2; PR196 sheaf L-functions." → "**Dependencies:** DWP.0/DWP.2; EDC.1–2; LPV.0–2; PR196 sheaf L-functions."
2. **`data/atlas.json`.** Remove `DeligneWeightsAndPurity:DWP.4` from DWP.5's `requires` and DWP.5 from DWP.4's `consumers`, and delete the stage edge DWP.4 → DWP.5.

The kept inputs stay:
- DWP.0 and DWP.2, EDC.1–2 and LPV.0–2, by the line;
- LPV.1, EDC.2, R01.2, TraceFormula:14 and the ArithmeticDirichletSeries Layer 8 positivity, by RS-17 links 184, 131, 10, 270 and 236.

Computed on the assembled graph with the edge removed:
- no other path DWP.4 → DWP.5 remains;
- only DWP.5 and DWP.6 stop being descendants of DWP.4;
- DWP.5 loses 28 ancestors: DWP.1, DWP.3, DWP.4, FA.5, LPV.5, WC.0, WC.1 and their upstream;
- its remaining ancestors include DWP.0, DWP.2, EDC.0–4, LPV.0–4, TraceFormula:8 and ADS Layer 8.

### Not done, and why

- **RS-17 links 153, 196 and 204 are left in place.** They hand DWP.4's imports (EDC.4, LPV.3, LPV.4) to DWP.5 and lose their basis with the edge, but they add only early geometric suppliers, not Weil I §7, and they belong to an accepted restructuring. The maintainer may drop them; this fix does not.
- **DWP.7 still waits for DWP.4, through WC.3.** RS-17 adds WC.3 → DWP.7 for the integral-factor lemma of 3.3.9, and WC.3 requires DWP.4. That is outside this finding.

## /39 (low, other): Part II metadata: invalid areas, the Microlocal title, and the semistable import

### What the verifier corrected

- **Fix only the invalid area.** `cohomology` is not a galaxy. `arithmeticgeometry` and `algebraicgeometry` are valid galaxy ids; do not mass-rewrite them because the routes are Part IIs.
- **Choose `etale`** for the EDC/LPV sheaf-theory extensions, and keep the justified `algebraicgeometry` of the same-field local-curve continuation.
- **The Microlocal title** drops the parent's "cycle classes" wording; correct it, coordinating shared ids.
- **RS-17 narrows LPV.7 to navigation.** SemistablePotentialMaps should import the early child, LPV.7:semistable-curves, plus an explicitly supplied higher-dimensional SNC weight-spectral-sequence extension. It must not pretend that the curve theorem proves its inputs of arbitrary relative dimension.
- **Abe and Yang–Zhao route changes stay proposals** while both are revise.

### State on main (1b1aeb19)

**`data/galaxies.json` has `etale` (line 479)**, "Étale and ℓ-adic cohomology with its duality and operations, … vanishing cycles and perverse sheaves". "cohomology" occurs only in its `caption`, never as an `id`.

**Current routes:**

| Route | Roadmap id | Area | Title |
|---|---|---|---|
| ABE-25 route 4 | …PartIIRelativeTraces | `cohomology` | "Étale duality, cycle classes and perverse sheaves, Part II: relative categorical traces" |
| ABE-25 route 5 | …PartIIGeneralBasesFourier | `cohomology` | "Lefschetz pencils, nearby cycles and vanishing cycles, Part II: general bases and local Fourier transforms" |
| YANG-ZHAO-25 route 3 | …PartIIRelativeTraces | `cohomology` | as ABE-25 route 4 |
| YANG-ZHAO-25 route 4 | …PartIIGeneralBasesFourier | `cohomology` | as ABE-25 route 5 |
| YANG-ZHAO-25 route 5 | …PartIIMicrolocal | `arithmeticgeometry` | "Étale Duality and Perverse Sheaves, Part II: characteristic cycles and polar bounds" |
| SHENDE-TSIMERMAN-17 route 14 (rejected) | …PartIIMicrolocal | `arithmeticgeometry` | the same wrong title |
| YUN-ZHANG-19 route 9 | …PartIIIndConstructibles | `arithmeticgeometry` | parent title, correct |
| KISIN-ZHOU-25 route 11 | LefschetzFiniteFieldBertiniPartII | `algebraicgeometry` | "…, Part II: prescribed finite-field points" (brief: "the same-field local curve supplier") |
| LIU-ETAL-22 route 16 | SemistablePotentialMaps | `etale` | title correct (fixed by its review) |

- **The area matters now.** Under the current generator, the area of a design job is a vote over all Part II proposals of a parent (make_queue.py:427: `Counter(...).most_common(1)`, ties going to the first proposal). The prompt then says "Area: … (an area of data/galaxies.json …)". I simulated with every current accepted proposal, plus ABE-25 and YANG-ZHAO-25 marked accepted:
  - LPV: `algebraicgeometry` 1, `etale` 2, `cohomology` 2. `etale` wins only on the tie-break.
  - EDC: `etale` 1, `arithmeticgeometry` 2, `cohomology` 2. `arithmeticgeometry` wins.
  - With only the two papers' routes, the LPV vote is `cohomology`.
  - After edit 1 below, both jobs come out `etale`.
- **The checker does not validate areas.** `scripts/check_paper.py` lines 113–114 check only that an area is present.
- **The live LPV design (#3359) includes LIU-ETAL-22 route 16.** Its brief opens with the old title, "Lefschetz pencils and vanishing cycles, Part II: semistable potential maps, for Liu–Tian–Xiao–Zhang–Zhu …", and imports:
  > Import LefschetzPencilsAndVanishingCycles LPV.7 (weight spectral sequence and monodromy), EtaleDualityAndPerverseSheaves EDC.3–EDC.4 (cycle classes, Gysin maps, purity) and MotivesAndAlgebraicCycles MC.2 (Abel–Jacobi maps).
- **What RS-17 says:**
  - LPV.7 keeps: "Stable aggregate/navigation contract … It owns no second proof of either child. Consumers asking only for curve monodromy import the early child, never the whole late aggregate."
  - LPV.7:semistable-curves keeps: "Retain explicitly sourced higher-dimensional SNC nearby-cycle/spectral-sequence extension, without asserting universal semistable reduction or degeneration."
  - The stage text: "For higher-dimensional strict normal-crossing models, construct only the source-qualified nearby-cycle description and weight spectral sequence actually used by the analytic/Shimura consumer, with intersection-stratum restriction/Gysin maps from EDC.3."
- **The Liu items.** LIU-ETAL-22/P01–P04 apply Liu [47] §2 to X proper strictly semistable of relative dimension d, and in LTXZZ to Q with d = 2n − 1. Item P02 records the weight spectral sequence ^rE_1^{p,q} = ⊕_{i≥max(0,−p)} H^{q−2i}(X^{(p+2i)}_{κ̄}, Λ(r−i)) ⇒ H^{p+q}(X_{K̄}, Λ(r)) and the monodromy map of Saito 2003, Cor. 2.8(2).

### Fix

1. **`area`: `"cohomology"` → `"etale"`** (proposals, applied on revision) in:
   - `PAPER-ABE-25.result.json` routes 4 and 5;
   - `PAPER-YANG-ZHAO-25.result.json` routes 3 and 4.
2. **`title` of YANG-ZHAO-25 route 5**, and of SHENDE-TSIMERMAN-17 route 14 so that the shared id stays consistent: "Étale Duality and Perverse Sheaves, Part II: characteristic cycles and polar bounds" → "Étale duality, cycle classes and perverse sheaves, Part II: characteristic cycles and polar bounds". The new LAWRENCE-SAWIN-25 route 6 (/12) uses this title, with area `etale`.
3. **`PAPER-LIU-ETAL-22.result.json` route 16, `brief`** (accepted, so this edit reaches #3359):
   - The opening words "Lefschetz pencils and vanishing cycles, Part II: semistable potential maps," → "Lefschetz pencils, nearby cycles and vanishing cycles, Part II: semistable potential maps,".
   - Replace the import sentence quoted above with:
     > Import LefschetzPencilsAndVanishingCycles LPV.7:semistable-curves, the early child that RS-17 makes the owner of semistable nearby cycles: nearby cycles and N for proper strictly semistable curves, together with its retained, explicitly sourced higher-dimensional strict-normal-crossing extension. Name that extension explicitly as an input: for X proper strictly semistable over O_K of relative dimension d (here Q, d = 2n − 1), the nearby-cycle description, the weight spectral sequence of item P02 (Liu [47] §2.3, after T. Saito 2003, Cor. 2.8) with the intersection-stratum restriction and Gysin maps of EDC.3, and its monodromy map. The curve theorem does not prove it. If the blueprint of LPV.7:semistable-curves does not state the relative-dimension-d sequence in this form, record it as a request to that stage, not as a node here. Degeneration at E_2 and weight–monodromy are not claimed; they enter only through the nice-coefficient hypotheses (N1)–(N3). Do not import the aggregate LPV.7 or LPV.7:invariant-cycles. Import EtaleDualityAndPerverseSheaves EDC.3–EDC.4 (cycle classes, Gysin maps, purity) and MotivesAndAlgebraicCycles MC.2 (Abel–Jacobi maps).
   - **Stage link** LPV.7:semistable-curves → LefschetzPencilsAndVanishingCyclesPartII (a draft): the cycle test is acyclic.
4. **Kept unchanged, as the verifier requires:**
   - `arithmeticgeometry` for YANG-ZHAO-25 route 5, SHENDE-TSIMERMAN-17 route 14 and YUN-ZHANG-19 route 9: valid galaxies, and the EDC area vote becomes `etale` anyway once edit 1 is applied;
   - `algebraicgeometry` for KISIN-ZHOU-25 route 11, the same-field local-curve continuation.
5. **Maintainer notes.**
   - Make `scripts/check_paper.py` (lines 113–114) reject a route `area` that is not an `id` of `data/galaxies.json`.
   - In `make_queue.py` line 427, count only valid galaxy ids in the vote.
   - Apply this with /19's note on shared ids.

### Not done, and why

- **The red team's blanket change to `etale`** of the Microlocal, IndConstructibles and FiniteFieldBertini areas is not made; the verifier forbids it.
- **The ABE-25 and YANG-ZHAO-25 edits wait** for their revision.
- **Liu 2019 (JEMS) was not read.** The spectral sequence is quoted from the reviewed extraction item P02, not restated from the source.

## /40 (low, other): HQ.5 and HQ.5-trace get separate text blocks

### What the verifier corrected
- The two atlas descriptions are identical, including the trace anchor and the finite-étale export paragraph. The README places the export under the anchor, but the graph sends HQ.5 to HR.6 and gives HQ.5-trace no consumers.
- Separate the source blocks and the extraction boundaries, so that general existence and the coefficient export belong to HQ.5 and the trace theorem to HQ.5-trace. Preserve the two theorem scopes and HR.6's explicit ownership (plan review §8.4.2).
- The rejected /36 is preserved: HQ.5 supplies the cohomology functor, and HR.6 identifies it in degree zero. The ambiguous sentence about the q−1 comparison is only clarified.

### State on main (1b1aeb19)
- **README lines 37–48:** heading (37), smooth paragraph (39), quasi-regular paragraph (41), anchor `<a id="stage-HQ.5-trace"></a>` (43), trace paragraph (45), export paragraph (47).
- **In `data/atlas.json`,** HQ.5 and HQ.5-trace both have `contextStartLine` 37, `contextEndLine` 48 and the same 2461-character `description`. HQ.5-trace has `sourceLine` 43.
- **Nothing pending touches this.** Neither RS-10~2 nor the packet does; the packet's nodes are already split by stage.

### Fix (batch now)
1. **HQ README, lines 37–48.** Replace them with the 12 lines below (line 48 stays blank). The paragraphs keep one line each, so HQ.6–HQ.8 keep their line ranges. The block already contains the /6 and /35 replacements.

   ```text
   ## HQ.5. Existence classes and number fields

   Prove Theorem 4.11 for smooth algebras over a perfectly covered Λ-ring A after inverting every prime p≤relative dimension. Carry both the base and dimension bound in the theorem. Prove Corollary 4.16's **partial-operad** multiplicativity: the admitted smooth category is not closed under tensor products. If a d-dimensional input needs multiplication, the corresponding product requires primes through 2d inverted; coherence through r factors requires the source's r·d bound. Inverting primes through d alone does not provide an unrestricted E∞ algebra structure. Two scheme-level targets are stated separately, each with the status the source gives it. **Descent.** For a smooth scheme X over ℤ on which every prime p≤dim(X/ℤ) is invertible, glue the Habiro–Hodge complexes of Theorem 4.11's canonical filtrations on affine opens to q-𝓗dg_{X/ℤ}∈D(X,ℋ) (Wagner v2 1.16, p. 8; thesis 1.45(c)). The source states this in its introduction without a body proof, so HQ.5 proves Zariski (or étale) descent for S↦q-𝓗dg_{S/ℤ} on Sm_{ℤ[dim!^{−1}]}, using functoriality in open immersions and étale maps, which preserve the dimension bound. The source states it over ℤ only; no version over a general perfectly covered Λ-ring is claimed. **Perfectness.** For X smooth and proper over ℤ[1/N], with every prime p≤dim(X/ℤ) dividing N, the source expects RΓ(X,q-𝓗dg_{X/ℤ}) to be a perfect complex over the **Habiro completion of ℋ[1/N]**, not over a raw localization of ℋ (1.16, stated without proof). This is a proof obligation with four named gaps: (i) perfectness of RΓ(X,q-W_mΩ^i_{X/ℤ}) over ℤ[1/N][q]/(q^m−1); (ii) compatibility of RΓ with reduction modulo q^m−1 and with the completed base change to the Habiro completion of ℋ[1/N]; (iii) a uniform bound on Tor-amplitude and a finite-presentation argument across all m; (iv) a perfectness criterion for Habiro-complete modules. Appendix B supplies none of (iv): B.2–B.4 detect only completeness and vanishing.

   Treat quasi-regular inputs separately. Require the source's condition (R): for every p, p-torsion-freeness, static p-completed derived de Rham, and Hodge filtration given by the stated ideals. A useful class is a quotient of an étale algebra over a perfect Λ-ring by a Koszul-regular ideal. HQ.5 owns case (a) of Wagner v2 Theorem 4.22 (pp. 62–63). Let A be a p-completely perfectly covered δ-ring and R a p-torsion-free, p-quasi-lci A-algebra (in the sense of 4.17) with R/p relatively semiperfect over A, and suppose R≅B/J is a perfect-regular presentation with J generated by a Koszul-regular sequence of higher powers (x_1^{α_1},…,x_r^{α_r}), every α_i≥2 (no restriction at p=2). Then the naive filtration of Construction 4.21 is a q-deformation of the Hodge filtration: fil^⋆_{q-Hdg}q-dR_{R/A}/(q−1)≃fil^⋆_{Hdg}dR_{R/A}, with q−1 in filtration degree 1. The surjectivity half reduces to the universal case A=ℤ_p{x}, R=ℤ_p{x}/x^α with α≥2 (p. 66). There the lifts of the iterated divided powers γ^{(n)}(x^α) into fil^{p^n}_{q-Hdg} are Meyer–Wagner Lemma 3.16 (arXiv:2410.23115v4, pp. 38–40), which HQ.5 owns; Lemma 3.17 there (p. 40) is the auxiliary p-torsion-freeness lemma used in its proof. Wagner v2 cites the lifts as "[MW24, Lemma 3.17]" without a version; this is a numbering difference between versions, not a mathematical error. Case (b) is HQ.5-trace's. Theorem 4.29's canonical section is on the specifically defined subcategory where each constructed local filtration actually q-deforms Hodge. Do not generalize to every regular quotient. Record the additional finite-order comparisons or ℤ_p×-action used in the source's uniqueness statements.

   For finite étale arithmetic inputs export the completed cohomology object to HR.6, which owns its degree-zero comparison with HR.5 and HB.6's explicit GSWZ ring. HQ.5 proves the generic functorial comparison: the (q−1)-completion of the Habiro–Hodge complex is the q-Hodge complex (Theorem 3.11(a)), which for étale R/A is R⟦q−1⟧; the comparison map ℋ_{R/A}→R⟦q−1⟧ is the Taylor map at q=1 of HR.5's Frobenius-glued presentation, and HQ.5 carries it with those actual maps. HR.6/HB.7 owns the line-module comparison and possible loss of K₃-indexed information on completion. A zero-dimensional ring comparison does not identify every K₃ module with a cohomology class on a higher-dimensional scheme.

   <a id="stage-HQ.5-trace"></a>

   **Trace-theoretic existence (HQ.5-trace).** For trace-theoretic instances import RT.4:q-Hodge: R is quasi-syntomic, **2 is invertible**, and R has a **connective spherical E₂-lift** S_R with S_R⊗Hℤ≃HR (Wagner ku Theorem 1.2 / 4.27). A lift merely over ku is not enough. Separately, import RT.4:q-Hodge's E₁ target: ku Theorem 4.17, with Theorems 4.14 and 4.16, p=2 included. Its resolution and identity-cover hypotheses replace the E₂-lift; it is not the E₂ theorem with hypotheses removed. With it prove Wagner v2 Theorem 4.22(b) (pp. 62–63, proof pp. 65–66). Let A be a p-completely perfectly covered δ-ring and R a p-torsion-free, p-quasi-lci A-algebra with R/p relatively semiperfect over A. If **R_∞:=(R⊗_A A_∞)^∧_p** (not R) lifts to a p-complete connective E₁-ring spectrum S_{R_∞} with R_∞≃S_{R_∞}⊗_{𝕊_p}ℤ_p, then fil^⋆_{q-Hdg}q-dR_{R/A}/(q−1)≃fil^⋆_{Hdg}dR_{R/A}. The proof reduces by flat base change (Lemmas 4.26–4.27) to A perfect and then to A=ℤ_p, where case (b) is a special case of ku Theorem 4.17. The lift is existence data only: the filtration is HQ.5's naive filtration and does not depend on it. For p>2 a presentation as in (a) yields such a lift (Remark 4.23); at p=2 this holds only when every α_i is even and ≥4, so HQ.5's case (a) is not subsumed.

   ```

   The export paragraph moves above the anchor. Its sentence "Prove the q−1 completion comparison and carry its actual Frobenius-glued Taylor maps." is replaced by the sentence beginning "HQ.5 proves the generic functorial comparison", which matches the packet node HQ.5/the-export-to-the-coefficient-roadmap. HR.6's ownership sentence is kept word for word.
2. **`data/atlas.json`.**
   - Stage HabiroCohomologyFoundations:HQ.5: `description` := new lines 37–43 (heading to the export paragraph); `sourceLine` 37, `contextStartLine` 37, `contextEndLine` 44.
   - Stage HabiroCohomologyFoundations:HQ.5-trace: `description` := new lines 45–47 (anchor and trace paragraph); `sourceLine` 45, `contextStartLine` 45, `contextEndLine` 48.
   - The HQ.5-trace title stays "Trace-theoretic existence", from the bold label.
   - No edge changes here: HQ.5 → HR.6 stays, and HQ.5-trace → HQ.7 comes from /33.

### Not done, and why
- **Nothing is moved out of HQ.5.** No q−1 comparison leaves it, as the /36 rejection requires. HR.6's text is unchanged.

## The three rejected findings

The verifier rejected /10, /24 and /36. None of them is applied. The fixes above keep the boundaries the verifier
said to preserve.

### /10 (medium, duplicate, rejected): WeightsInEtaleCohomology R34.4 stays

- **The verdict.** RS-17 deliberately keeps R34.4 as a supplier-indexed arithmetic pencil adapter, with LPV.3–5
  owning the geometric theorems. RS-17 also keeps the independent R34.1–4 prefixes, so R34.3's LPV-only
  prerequisites are a recorded design decision.
- **On main.** R34.4 still reads "Import LPV.3–5's Veronese/Bertini existence, blowup/pencil maps, vanishing-cycle
  radical quotient and proved irreducible/open symplectic monodromy". It requires LPV.3, LPV.4, LPV.5 and EDC.4,
  and has no consumers.
- **Change.** None. The verifier's remark that consumer links could be improved later is left to the blueprint job
  for WeightsInEtaleCohomology.

### /24 (medium, duplicate, rejected): L0 keeps its E4 handoff

- **The verdict.** E4 re-exports DD.1's generic completion. It owns the sheaf and coefficient-system reconstruction,
  the completed operations and the regular-sequence dévissage. L0 applies these to étale objects and builds the six
  operations.
- **On main.** E4 → L0 is an edge. E4 still says it "reexports that interface and owns its extension to sheaves and
  compatible coefficient systems". L0 still begins "Using E4, define `D_ét(X,Λ)` inside the v-derived category".
- **Change.** None. A future blueprint of AdicCoefficientsAndComparisons should attach generic lemma-level requests
  to E4, as the verifier says, and should not narrow L0.

### /36 (medium, duplicate, rejected): the HQ.5 → HR.6 handoff stays

- **The verdict.** HQ.5 builds the cohomology functor and exports its étale degree-zero instance. HR.6 identifies
  that instance with the independently built ring (Wagner, Corollary 3.13). This is a construction followed by a
  comparison. REV-RS-10 accepts it as a handoff.
- **Change.** None. The separation of the HQ.5 and HQ.5-trace texts under /40 keeps the HR.6 export in HQ.5, where
  the edge HQ.5 → HR.6 already puts it.

## Sources read

### For weights and the Weil conjectures (/1, /7, /8, /9, /37, /38)

All read on 29 September 2026. Printed pages unless stated.

- **Schiffmann, arXiv:1406.3839v2** (4 October 2014; the arXiv API lists v2 as the last version). https://arxiv.org/pdf/1406.3839v2. Pages 1, 14 (Proposition 4.8), 35–36 (Appendix B), 37 (bibliography). SHA-256 7e5cbf6e…9bb2.
- **Schiffmann, published.** Annals of Mathematics 183 (2016), 297–362, https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n1-p06-p.pdf. Pages 321 (Proposition 4.7), 357–358 (Appendix B), 359 and 361 (bibliography). SHA-256 8e486963…c7a5.
- **Deligne, La conjecture de Weil. II.** Publ. Math. IHÉS 52 (1980), 137–252, doi:10.1007/BF02684780 (Crossref). https://www.numdam.org/item/PMIHES_1980__52__137_0.pdf. SHA-256 b06eea61…. Pages:
  - 137 and 252, for the foot pagination 313 and 428;
  - 158–159 (1.3.7–1.3.10) and 175–176 (1.8.1–1.8.5);
  - 187–188 (2.1.1–2.1.4) and 191–196 (2.1.10–2.2.10);
  - 209–212 (3.4.8–3.5.7), with pp. 211–212 checked on page images.
- **Deligne, La conjecture de Weil. I.** Publ. Math. IHÉS 43 (1974), 273–307, doi:10.1007/BF02684373 (Crossref). https://www.numdam.org/item/PMIHES_1974__43__273_0.pdf. Pages 284–285 (Lemmas 3.5–3.7). SHA-256 8392b345….
- **Katz and Sarnak, Random Matrices, Frobenius Eigenvalues, and Monodromy.** AMS Colloquium Publications 45, doi:10.1090/coll/045 (Crossref). https://web.math.princeton.edu/~nmk/RMFEM.pdf. SHA-256 39beb011…. Pages:
  - 269–270 (9.0.13–9.0.16), 275–278 (9.2.1–9.2.6) and 279–280 (9.3.1–9.3.4);
  - 293–301 (10.0–10.2.3), with pp. 276, 293, 299 and 301 checked on page images;
  - the bibliography entries [Sut] and [Ka-ESDE].
- **Harpaz and Wittenberg, arXiv:1409.0993v4** (final version; Annals 183 (2016), 229–295, per arXiv). https://arxiv.org/pdf/1409.0993v4. Pages 11–12, 16–17, 21, 42–45 and 47, and the bibliography, pp. 51 and 53. SHA-256 3338fb53…7369.
- **Milne, Lectures on étale cohomology**, version 2.21 (22 March 2013). https://www.jmilne.org/math/CourseNotes/LEC.pdf. Pages 154–159 (27.1–27.14), with pp. 158–159 checked on page images. SHA-256 ac4f122f…1077.
- **DOIs and arXiv ids.**
  - Crossref, for Weil I and II, Lang–Weil (Amer. J. Math. 76 (1954), p. 819, doi:10.2307/2372655) and Katz–Sarnak. Lang–Weil itself was not read.
  - The arXiv API, for 1409.0993 and 1406.3839.
  - Ekedahl, Progr. Math. 91 (1990), 241–249, is cited from HW16's bibliography. Crossref has no record for it, and it was not read.

### For étale duality and its Part IIs (/2, /3, /11, /16, /17)

All read on 2026-09-29.

**Cited in the drafts**

| Source | URL | Pages read |
| --- | --- | --- |
| Illusie–Laszlo–Orgogozo, Travaux de Gabber, arXiv v1 (hash matches REV-RT-AREA-etale) | https://arxiv.org/pdf/1207.3648v1 | Exposé XVI, PDF pp. 231–233, 239–240, 243–244, 248–250 (printed 225–227, 233–234, 237–238, 242–244): Déf. 1.1, Th. 1.2–1.3, Déf. 2.3.1, Th. 2.3.2 and its proof's end, Prop. 2.3.4, §§2.4–2.5 definitions, Th. 3.1.1, Cor. 3.1.2–3.1.3, Déf. 3.1.4, 3.2.1–3.2.2, Prop. 3.2.3 with proof |
| Česnavičius–Scholze, Purity for flat cohomology, arXiv v3 | https://arxiv.org/pdf/1912.10932v3 | PDF pp. 30–31 (Lemma 3.1.2, Th. 3.1.3, Rem. 3.1.4) and p. 86 (Lemma 7.1.1) |
| Česnavičius, Purity for the Brauer group, arXiv v4 | https://arxiv.org/pdf/1711.06456v4 | pp. 1–2 (Th. 1.1–1.3, known cases) and p. 13 (Th. 6.1 with proof, Th. 6.2 statement) |
| Laszlo–Olsson I, arXiv v2 | https://arxiv.org/pdf/math/0512097v2 | pp. 1–3 and 29–30, 38 (Prop. 4.9.1) |
| Laszlo–Olsson II, arXiv v1 | https://arxiv.org/pdf/math/0603680v1 | pp. 1–3 |
| Laszlo–Olsson, Perverse sheaves on Artin stacks, arXiv v1 | https://arxiv.org/pdf/math/0606175v1 | pp. 1–2 |
| Liu–Zheng, arXiv v4 | https://arxiv.org/pdf/1211.5948v4 | pp. 1–4 |
| Sun, L-series of Artin stacks over finite fields, arXiv v2 (Algebra Number Theory 6:1 (2012)) | https://arxiv.org/pdf/1008.3689v2 | pp. 1–3 |
| Lafforgue, Chtoucas pour les groupes réductifs…, arXiv v10 (hash matches REV-RT-AREA-etale) | https://arxiv.org/pdf/1209.5352v10 | p. 65 |
| Zhu, Affine Grassmannians and the geometric Satake in mixed characteristic, arXiv v3 (hash matches REV-RT-AREA-etale) | https://arxiv.org/pdf/1407.8519v3 | pp. 23–24 and 54–57 |
| Drinfeld–Gaitsgory, On a theorem of Braden, arXiv v4 | https://arxiv.org/pdf/1308.3786v4 | pp. 1–3, 5, 24–26 |

**Checked, not read in the body**
- arXiv abstract pages were checked for all these ids.
- arXiv:1603.05593 is Zhu's lecture notes, not this paper.
- Varshavsky, arXiv:math/0505564, was checked but not read.

### For the proposed Part IIs (/12–/15, /19, /39)

All were read on 2026-09-29. Pages are PDF pages unless marked printed. SHA-256 is of the file read.

| Source | Version and URL | Pages read | SHA-256 |
|---|---|---|---|
| Lawrence–Sawin, The Shafarevich conjecture for hypersurfaces in abelian varieties | arXiv 2004.09046v5, https://arxiv.org/pdf/2004.09046v5 | 14–15, 21–23, 120 (bibliography) | `5e5f829e2841637de38852bde0d5f0a0b80183e6f9d23b60250cc2be1ee21d97` |
| Krämer, Characteristic cycles and the microlocal geometry of the Gauss map, I | arXiv 1604.02389v3, https://arxiv.org/pdf/1604.02389v3 | 1–4, 10–14 (Corollary 1.10, p. 12) | `908a40d6dc4ccdee9f56ea570eb493b8561c87f3122043a695295768803fda7f` |
| Krämer, Characteristic cycles and the microlocal geometry of the Gauss map, II | arXiv 1807.01929v2, https://arxiv.org/pdf/1807.01929 | 1–17, 29–32 | `44ae6bdcf9574eee1a0bab6698f3c29e35f3c89286e58fe301c5d2cf7f057d8d` |
| Franecki–Kapranov, The Gauss map and a noncompact Riemann–Roch formula for constructible sheaves on semiabelian varieties | arXiv math/9909088v1, https://arxiv.org/pdf/math/9909088 | 1–9 (all) | `52cfb568951f195f96ca14a0048063be4fbe3af24a99164b053a7d5883010f2e` |
| Abe, On the Serre conjecture for Artin characters in the geometric case | arXiv 2405.19601v2, https://arxiv.org/pdf/2405.19601v2 | 4–6 | `56d897a77e1a3ef0455c861d0f5bd5b499f47ea9420fd5fcca0594e794c020a6` |
| Yang–Zhao, Cohomological Milnor formula and Saito's conjecture on characteristic classes | arXiv 2209.11086v4, https://arxiv.org/pdf/2209.11086v4 | 44–46 | `e3da9817bc372ce4b72e475ed790ba3e4346de83ccda9751fe37bd02c0e1eb2e` |
| Browning–Sawin, A geometric version of the circle method | arXiv 1711.10451v3, https://arxiv.org/pdf/1711.10451v3 | 8 | `4518f88842e2bc19d2b2e0634f1df54c96d36164331e88fc30ef892f3c879072` |
| Fresán–Sabbah–Yu, Hodge theory of Kloosterman connections | arXiv 1810.06454v5, https://arxiv.org/pdf/1810.06454v5 | 4 | `835580aa6314798e2866c248d6f7179379698d61a7baae0136806d4755b1f20a` |
| Laumon, Transformation de Fourier, constantes d'équations fonctionnelles et conjecture de Weil, Publ. Math. IHÉS 65 (1987) 131–210, DOI 10.1007/BF02698937 (Crossref-verified) | numdam, http://www.numdam.org/item/10.1007/BF02698937.pdf | printed 141 (Déf. 1.2.1.1) and 157–164 (2.3.1–2.4.3); pp. 161–162 checked as page images | `c666e214ae586651b9f171f6a39d755e58f96379970ffa98bafb2d9be591fc8e` |
| Yun–Zhang, Shtukas and the Taylor expansion of L-functions (II), Ann. of Math. 189 (2019) | author copy of the published version, https://math.mit.edu/~zyun/GZW_ramified_published.pdf | printed 445 (Definition 3.32), 448 (mc-actions) | `700e0b09f2320912b75f5a16968c5aa3f96a0ad74e3ca375aacedec7e85d296c` |
| Mathlib at 082e2d37e8b0463410cdb532e111cd43d5a66174 | https://github.com/leanprover-community/mathlib4/tree/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory | Abelian/SerreClass/{Basic, MorphismProperty, Localization, Bousfield}.lean (all); Abelian/Indization.lean; Limits/Indization/Category.lean:60–210; Subobject/NoetherianObject.lean:50–60; Localization/Construction.lean:105–112; Localization/SmallHom.lean:45–52 | — |

Crossref was used to verify three references: Krämer I (10.24033/asens.2522), Krämer II (10.1515/crelle-2020-0048) and Laumon 1987 (10.1007/bf02698937). The arXiv abstract pages were used to verify every arXiv id and version above.

**Not read, and so kept as stated obligations:**
- Kashiwara–Schapira, Sheaves on Manifolds;
- Kashiwara, Index theorem for constructible sheaves (Astérisque 130);
- Ginzburg 1986;
- Huber 1996;
- Hansen–Scholze, Relative perversity;
- Liu 2019 (JEMS);
- the Crelle version of Krämer II.

### For alterations, moduli and coherent duality (/4, /21, /22, /25)

All read on 29 September 2026. Printed page numbers unless stated. PDF SHA-256 in brackets.

- **de Jong**, *Smoothness, semi-stability and alterations*, Publ. Math. IHÉS 83 (1996), 51–93. DOI 10.1007/BF02698644, checked with Crossref. Numdam https://www.numdam.org/item/PMIHES_1996__83__51_0 [9e4e7dab…ffb7].
  - Read: pp. 54–62 (§2, incl. 2.9, 2.12–2.13, 2.15, 2.18–2.24), 66–67 (4.1–4.11), 71–72 (4.15–4.18), 76 (5.1–5.2), 79–81 (5.7–5.17), 83 (6.5–6.9), 88 (7.3), 93 (references).
  - Displays were read on page images.
- **Knudsen**, *The projectivity of the moduli space of stable curves, II: The stacks M_{g,n}*, Math. Scand. 52 (1983), 161–199. DOI 10.7146/math.scand.a-12001, checked with Crossref. https://journals.msp.org/mscand/article/view/1622 [18e04bbf…e230]. Read: pp. 161–162 (introduction, Definition 1.1), p. 179 (Theorem 2.7), on page images of the scan.
- **Illusie, Laszlo, Orgogozo (eds.)**, *Travaux de Gabber sur l'uniformisation locale et la cohomologie étale des schémas quasi-excellents*, arXiv:1207.3648v1, checked with the arXiv API. https://arxiv.org/pdf/1207.3648v1 [18a6193d…a644]. Exposé X, read:
  - pp. 135–136 (introduction, Theorem 1.1);
  - pp. 148–155 (definition of ℓ′-alteration, Theorem 2.1, Lemma 2.2, proof 2.3, Theorem 2.4, Lemma 2.5, proof 2.6);
  - pp. 161–163 (end of the proof of 3.4, Remark 3.4.1, Theorem 3.5 and the first steps of its proof);
  - bibliography entries [Temkin, 2010], [Vidal, 2004b] and [de Jong, 1997].
- **Jannsen**, *Hasse principles for higher-dimensional fields*, Ann. of Math. 183 (2016). https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n1-p01-p.pdf [26dde926…7d71]. Read: p. 24 (Theorem 2.11).
- **Zavyalov**, *Mod-p Poincaré Duality in p-adic Analytic Geometry*, arXiv:2111.01830v3 (21 February 2024), checked with the arXiv API. https://arxiv.org/pdf/2111.01830v3 [a984d973…c951]. Read: pp. 10–17 (§2.1–§2.3 to Theorem 2.3.7).
- **Scholze**, *Six-Functor Formalisms*, arXiv:2510.26269v2 (22 January 2026), checked with the arXiv API. https://arxiv.org/pdf/2510.26269v2 [bef03551…8276]. Read: pp. 68–71 (Lecture VIII: Theorem 8.1 to Theorem 8.10).

### For classical adic cohomology and pro-étale comparisons (/5, /18, /20, /23, /26)

All read on 29 September 2026. Pages are printed pages unless marked PDF. Every SHA-256 matches the verifier's ledger where the verifier read the same file.
- **ECD.** P. Scholze, *Étale cohomology of diamonds*, arXiv:1709.07343v4 (14 Apr 2026; arXiv API checked), https://arxiv.org/pdf/1709.07343. §§26–27, pp. 162–164 (Proposition 27.2 and proof).
- **Berkovich 1993.** V. Berkovich, *Étale cohomology for non-Archimedean analytic spaces*, Publ. Math. IHÉS 78 (1993), 5–161, numdam PMIHES_1993__78__5_0, https://www.numdam.org/item/PMIHES_1993__78__5_0.pdf; the same scan at https://www.wisdom.weizmann.ac.il/~vova/IHES_1993_78_etale.pdf.
  - §7.1–7.5, pp. 127–150: Theorem 7.1.1, Corollaries 7.1.4–7.1.5, 7.2.1–7.2.3, 7.3.1 with the proof's steps, 7.4.1–7.4.10, 7.5.1, Lemma 7.5.2 (p. 147), Corollary 7.5.3.
  - The hypotheses on char k and char k̃ were checked on rendered pages 131, 132, 135, 143, 145, 146 and 147.
- **Zavyalov.** B. Zavyalov, *Mod-p Poincaré duality in p-adic analytic geometry*, arXiv:2111.01830v3 (21 Feb 2024), https://arxiv.org/pdf/2111.01830v3. P. 3 (Theorem 1.1.3), p. 78 (Theorem 5.3.3), pp. 86–88 (Corollary A.11 to Lemma A.19).
- **SGA 7 II.** P. Deligne, N. Katz, *Groupes de monodromie en géométrie algébrique* (SGA 7 II), IAS scan https://publications.ias.edu/sites/default/files/Number12.pdf (SHA-256 fa679deb…). Read on rendered page images: Exposé XIV, pp. 116, 132–134 (2.2–2.8), 146 (3.2.1), 150–151 (3.2.10–3.2.11); Exposé XV, pp. 191–194 (3.3.2–3.3.7, proof (A)–(E)).
- **Illusie 2021.** L. Illusie, *Grothendieck and vanishing cycles*, Ann. Fac. Sci. Toulouse Math. (6) 30 (2021), 83–115, doi:10.5802/afst.1667, https://afst.centre-mersenne.org/item/10.5802/afst.1667.pdf. §6.1 p. 103, §6.3 pp. 104–105 with footnotes (20)–(21), and references [34]–[37] and [56].
- **Illusie's erratum and page.** L. Illusie, erratum to *Sur la formule de Picard–Lefschetz*, https://www.imo.universite-paris-saclay.fr/~luc.illusie/ErrPL.pdf (one page). Illusie's page https://www.imo.universite-paris-saclay.fr/~luc.illusie/ was checked: it lists the erratum, not the paper.
- **Illusie 2002, not read.** Adv. Stud. Pure Math. 36 (2002) 249–268, doi:10.2969/aspm/03610249 (Crossref checked). Project Euclid refused automated access and no public copy was reachable.
- **Bhatt–Mathew.** B. Bhatt, A. Mathew, *The arc-topology*, arXiv:1807.04725v4 (14 Dec 2020), https://arxiv.org/pdf/1807.04725v4. Pp. 6–7 (Corollaries 1.17–1.18, footnotes 4–5), p. 38 (proof of 1.18(1)), pp. 50–52 (Theorem 6.11 to Corollary 6.18).
- **Bhatt–Scholze.** B. Bhatt, P. Scholze, *The pro-étale topology for schemes*, arXiv:1309.1198v2 (17 Dec 2014), https://arxiv.org/pdf/1309.1198v2.
  - pp. 18–19 (Proposition 3.2.3, Proposition 3.3.3);
  - p. 29 (Proposition 4.2.8);
  - pp. 34–39 (§5: Corollary 5.1.6, Remarks 5.1.8 and 5.2.8, Proposition 5.2.6, Definition 5.3.1, Proposition 5.3.2, Lemma 5.4.1, Remark 5.4.4).
- **Česnavičius.** K. Česnavičius, *Purity for the Brauer group*, arXiv:1711.06456v4 (1 Dec 2018), https://arxiv.org/pdf/1711.06456v4. Pp. 9–11: 4.9, Theorem 4.10, its proof and footnotes 2–4.
- **Stacks Project.** Tag 09ZI, Theorem 59.82.7 (Gabber), https://stacks.math.columbia.edu/tag/09ZI.
- **Mathlib at 082e2d3.** `Mathlib/AlgebraicGeometry/Sites/Proetale.lean` (lines 1–192) and `Mathlib/AlgebraicGeometry/Sites/Etale.lean` (lines 25–70).
- **Not read: Huber 1996** (*Étale cohomology of rigid analytic varieties and adic spaces*). It is not publicly readable. Its locators and the 7.5.1–7.5.3 scope are the verifier's.

### For Habiro cohomology (/6, /27–/35, /40)

All were fetched on 2026-09-29 with the worker user agent. The arXiv identifiers and versions were checked against the arXiv API the same day. The SHA-256 values match the verifier's. Pages are PDF pages; they equal the printed pages except in the thesis.
- F. Wagner, *q-Hodge complexes over the Habiro ring*, https://arxiv.org/abs/2510.04782v2 (v2, 8 Oct 2025), SHA-256 591d0bdf…373b. Pages 1, 5–9, 15–16, 19, 25–32, 38, 45–47, 50–52, 58, 60–63, 65–66, 69, 75, 77–78. Theorem 3.11 was also read on the rendered page 25.
- F. Wagner, *q-de Rham cohomology and topological Hochschild homology over ku*, https://arxiv.org/abs/2510.06057v1 (v1, 7 Oct 2025), SHA-256 fe9d7d71…a7d. Pages 1, 24–25 (3.1, 3.2), 39 (Theorem 4.8), 42–46 (Theorems 4.14, 4.16, 4.17, 4.18).
- S. Meyer, F. Wagner, *q-Hodge complexes and refined TC⁻*, https://arxiv.org/abs/2410.23115v4 (v4, 8 Oct 2025), SHA-256 4479788e…6dd4. Pages 1, 37–40 (3.15, Lemmas 3.16–3.17).
- F. Wagner, *q-Witt vectors and q-Hodge complexes*, https://arxiv.org/abs/2410.23078v5 (v5, 6 Oct 2025), SHA-256 c1c7426f…ed01. Pages 13 (2.14), 29 (2.37), 40 (3.1, 3.9, 3.11), 42 (Remark 3.18), 56 (Lemma 4.6), 57 (4.7–4.8).
- P. Scholze, *Canonical q-deformations in arithmetic geometry*, https://arxiv.org/abs/1606.01796v1 (v1, 6 Jun 2016), SHA-256 ce060b41…7273. Pages 15–17 (§7: Conjectures 7.1–7.2, Definition 7.3, Remark 7.4, Conjecture 7.5).
- K. Aoki, *Berkovich 2-motives and normed ring stacks*, https://arxiv.org/abs/2603.01877v1 (v1, 2 Mar 2026), SHA-256 a178c823…bfc. Pages 1, 3–4 (Theorems A–D, Theorem 1.7).
- F. Wagner, *q-Hodge filtrations, Habiro cohomology, and ku* (thesis), https://ferdinand-wagner.github.io/papers/q-Thesis.pdf (PDF creation date 15 Aug 2025), SHA-256 d074047f…876c. PDF pages 1–3 and 23–24 (printed 19–20, §§1.44–1.45).
- Not read: the V5A4 course notes (not public; their locators above are PLAN-HABIRO's) and BS22 §16.
