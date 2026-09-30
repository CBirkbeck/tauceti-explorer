# RT-AREA-iwasawa-1: fixes

Fixer: Claude Code, session `cc-f805bf` (with one forked sub-session per group of findings), 29 September 2026 (issue #3964, job FIX-RT-AREA-iwasawa-1).
- Findings: `RT-AREA-iwasawa-1.result.json`, by `cc-39fac3` (24 September). It has 39 findings. The issue lists the 36 high and medium ones (7 high, 29 medium; by kind 15 error, 13 missing, 7 duplicate, 1 library-claim). Findings /37–/39 are low and out of scope (see the end of this report).
- Verdicts: `RT-AREA-iwasawa-1.review.json` and `research/blueprint/reviews/REV-RT-AREA-iwasawa-1.md`, by `cc-7b31c4`. All 39 are confirmed and none is rejected. The verifier corrects the scope of the reasoning in three of them (/5, /19, /23), and in each the defect and the fix survive.
- Everything below was checked at origin/main `45d60f04` (29 September 2026, 19:20 UTC). The red team and the review worked at `45707f47` (24 September).
  - The graph checks use the atlas as `scripts/build.py` assembles it at `45d60f04`: accepted restructurings, promoted blueprints, integrated decompositions and new roadmaps included, 2840 stages and 7792 stage edges. The assembly was written to scratch only, and nothing in the repository was rebuilt.
  - "The cycle test for A → B" asks whether the assembled graph has a path B → … → A. "Acyclic" means it has none, so adding A → B closes no cycle.
- Library baseline: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`, and the declaration index built from them.

## How to read this report

This report is the job's only deliverable, and the intake accepts no other file for it. Every fix is therefore written as an exact edit, for the maintainer or for the design and blueprint jobs that will expand these roadmaps. It follows the conventions of `RT-AREA-iwasawa-2.fixes.md`, `RT-AREA-iwasawa-3.fixes.md` and `RT-AREA-etale.fixes.md`:
- **Roadmap prose** (`content/campaign/<Roadmap>/README.md`). The old sentence is quoted, and a script checked that it occurs exactly once in that file at `45d60f04`. The replacement is given in full.
- **Stage edges.** Each edge edit changes the consumer's `**Dependencies:**` or `**Inputs.**` line where its README has one. It also changes the `requires` list, the supplier's `consumers` and the `stageEdges` record in `data/atlas.json`. Removals are the maintainer's.
- **New stages** (for example `MIMC L1m`, `APL L3m`, `ES.8h`, `KatoEulerSystems:L5`) are given with a title, statement, hypotheses, source locators, requires and consumers. Suffix ids such as `GN.4:padic-unipotent-flows` follow the etale report's convention for a new stage after an existing one.
- **Decompositions and packets** (`data/decompositions/*.json`, `research/blueprint/packets/*.json`): the node id, the field, the old text and the new text, or a `requests` entry for the packet's next checkpoint.
- **Paper items and routes** (`research/blueprint/papers/PAPER-<id>.result.json`): the item or route, the field, the old value and the new value, and whether a review verdict is needed.
- **Library audits.** Each edit says whether the audit is merged into `data/library-coverage.json` (the orchestrator merges the edit) or pending.
- **Upstream Tau Ceti roadmaps and library.** These are notes for the Tau Ceti maintainer, never edits.

The binding rule is the verifier's: a confirmation authorizes only the corrected scope in its reason. Each section starts with those corrections, then says what `main` says now, then gives the fix. Where the mathematics or the graph forced a departure from the finding's own fix, the section says so under "Not done, and why", and the departures are listed together below.

Several findings edit the same README sentence or the same Dependencies line. Each section gives its own edit, and "Edits shared between findings", just before the sources, gives the merged text wherever two edits meet. The merged text supersedes the separate edits.

**Proposals still under review that these fixes touch.** None has a review.
- `RS-04` (Heegner, CM and adelic ownership). It agrees with /10's owners, ES.5 and ES.8.
- `RS-11` (AutomorphicCongruences and ModularIwasawaMainConjectures). /22 splits its owner entry for "the source-specific integral-period refinement", /27 changes its "Yager/exponential" entry, and /31 amends its row "Preserve the existing HE.8b comparison dependency". Its proposed edge KatoEulerSystems:L4 → AC:L5b is the one /31 adds.
- `RS-21` (Gross–Zagier family). Its link into HE.6 assumes the edge R17.5 → HE.6, which /8 removes, so that link should be dropped when RS-21 is reviewed. Its edge SR.5 → AC:L3 is left to it (/28).

**Packets and decompositions changed since the red team.** Each section says what the newer work already covers:
- the GZ.0 checkpoint `GrossZagierAndArithmeticHeights--GZ.0.json` (#3803, 28 September, session `cc-fb70e5`), which already pins /12's normalisation at node level;
- the SelmerIwasawaCohomology packet (checkpoints #3337, #3893, #3898 and #3909, 28–29 September), for /18–/21;
- the AutomorphicPadicLFunctions packet (#3100, 26 September), for /7, /11, /26 and /33;
- the SerreWeightAndLevelOptimisation packet (28 September), whose Diamond level-raising criterion does not discharge /2;
- the RankZeroOneBSD BSD.7 packet (#2951, 26 September), for /13, /15, /16 and /17.

The eight campaign READMEs, `data/decompositions/HeegnerPointEulerSystems.json` and `data/decompositions/GrossZagierAndArithmeticHeights.json` are unchanged since 15–16 September.

**Disclosure.** This session wrote neither the red team nor its review, and wrote none of these eight roadmaps, their decompositions or the GZ.0 checkpoint. It did write the paper extractions DELIGNE-74, SCHOLZE-13, DELIGNE-80, KOLYVAGIN-90, FARGUES-SCHOLZE-21 and LUST-STEVENS-20. It also wrote the audit fixes AUDIT-01/03/05/06/07/08/09/13/14/15/16/17/18 (not AUDIT-26) and the area fixes finitefields, pde and automorphic-1. Where a finding touches that work, the fix follows the verifier and nothing else:
- **PAPER-KOLYVAGIN-90** (no review yet) routes to ES.0–ES.4/ES.8 (route 1), KatoEulerSystems L3–L4 (route 2), HE.3–HE.8 (route 4) and BSD.5/BSD.9 (route 5). /1, /5, /8, /9, /10, /13, /16, /18, /30, /31, /35 and /36 touch those stages, and each section says how. Two findings correct my extraction:
  - /9: item `g-serre-open-image` says "planned" at HE.7, which is wrong. The item becomes missing, with R28.7 as the proposed owner.
  - /18: item `r3-cor-5.17` moves from missing to planned in SIC L3.
  
  Both are corrections to make before that paper's review.
- **The AUDIT-09 fix** (the Faltings layers): /9 adds R28.7 after R28.6. No AUDIT-09 target changes.
- None of the other extractions, audit fixes or area fixes is touched.

## Cycle test of all edits together

Every edge this report adds or removes was tested cumulatively against the assembled graph. The eight removals were applied first, then the 102 additions in finding order (101 distinct; /5 and /15 both add L3h → BSD.7a):
- **Removals:** R17.5 → HE.6 (/8); GZ.1 → BSD.1 (/3); MSPL L2 → GZ.9 (/11); PHR L1 → SIC L2 (/19); ES.7 → ES.8 (/35); ECMC L0 → KES L2 and ECMC L2 → KES L4 (/36); HE.8b → AC L5b (/31).
- **Additions:** every one is acyclic, including the edges into and out of the new stages GN.4:padic-unipotent-flows, R20.2:level-raising, HE.6z, R28.7, MIMC L1m, APL L3m, L3r, AC L0c, PHR L3u, ES.8h and KatoEulerSystems:L5.
- **Three edges between findings** (given in "Edits shared between findings"): L3r → KatoEulerSystems:L5, L3r → APL L3h and L3r → AC L2. They were tested on top of the whole set and are acyclic.
- **One conditional edge:** ES.8h → HE.8 (see /35). It was also tested on top of the whole set and is acyclic, but it is not added.

**The findings' own edges close a cycle when taken together.** The finding, the verifier and a separate test each found /8's edge MIMC:L1 → HE.6 and /10's edge HE.6 → HE.8 acyclic, but together they close

> HE.8 → GH.8 → AC:L2 → MIMC:L1 → HE.6 → HE.8.

/8 therefore puts Zhang's indivisibility theorem, with all its imports, in a new substage HE.6z after HE.6. HE.6 keeps Howard's Theorem A and feeds HE.8.

## Summary

The "When" column says when an edit takes effect:
- **now:** the maintainer can apply it to `main`: README prose, `data/atlas.json` records, decompositions, and edits to merged audits, which the orchestrator merges;
- **blueprint:** it goes into a packet through its blueprint job (a node or a `requests` entry);
- **verdict / paper review:** a paper item or route needs a review verdict first;
- **RS-xx:** it interacts with a pending restructuring proposal;
- **design #1884:** it waits for the pending design of the Part II CMAllPrimeMainConjectures;
- **upstream:** a note for the Tau Ceti maintainer.

| # | Finding | Fix | When |
|---|---|---|---|
| /1 | high, missing | New suffix stage GN.4:padic-unipotent-flows (Margulis–Tomanov Thm 11.2 and Ratner's twisted-diagonal theorem for F_P = Q_p), feeding HE.8. HE.8 gets named nodes for Cornut 2002, CV [5] Cor. 2.10 and CV Thm 1.10/4.1, and a split-p route through L3h. The elementary CV Prop. 4.4 is shown not to suffice. | now; blueprint |
| /2 | high, missing | New stage SWLO R20.2:level-raising: Zhang Thm 2.1 with exact level Nq (Diamond–Taylor, Duke 74, with prescribed local types), plus the JL transports, Helm's multiplicity one and Ihara for Shimura curves. The packet's Diamond criterion is imported but is not enough. HE's source line gains Zhang §2. The citation "Crelle 449" is corrected to Duke 74. | now; blueprint |
| /3 | high, duplicate | GZ.1 keeps YZZ's ⟨,⟩_L normalisation, the Poincaré pairing (Thm. 7.2) and the GL₂-type pairings. It imports the height machine, canonical heights and positivity/torsion (Northcott only) from RP.0, whose text is made explicit, and Mordell–Weil from RP.1 (Mathlib `AddCommGroup.fg_of_descent'` cited). Edges RP.0/RP.1 → GZ.1. BSD.1 keeps Layer 6 for Mordell–Weil, not RP.1; the maintainer removes GZ.1 → BSD.1. | now; audit record |
| /4 | high, missing | New stage MIMC L1m, Skinner's Theorem A for p ∥ N, seeded by L1's all-weight Skinner–Urban target. Greenberg–Stevens goes to PadicFamilies L3, and its L-invariant comparison (log_p q_E/ord_p q_E) to L4. Barré-Sirieix–Diaz–Gramain–Philibert (complex and p-adic) goes to DT.5. BSD.6 gets the Skinner §3.2 trivial-zero comparison and its own Dependencies line. | now; blueprint |
| /5 | high, missing | No new roadmap: the accepted Part II CMAllPrimeMainConjectures (BT26 route 7, CGLS22 route 8) already owns elliptic units and Rubin's theorem, with BSD.7a and HE.7s as consumers. Added edges: L3h → BSD.7a (Hida μ = 0, CGLS22 route 6) and /26's Hida–Tilouine layer → BSD.7a. Wüthrich's integral divisibility becomes a KatoEulerSystems L4 target, with IIT L4 → KES L4. BSD.7a names every import. | now; blueprint; design #1884 |
| /6 | high, error | AG2.6 → AC L1, L2, L2s, L5w (AG2.2 and AG2.5 come through AG2.3 → AG2.5 → AG2.6). L1 imports the Galois representation instead of establishing it. The CAP-exclusion step is named in all three routes: R22.5 → L1 and L2s, R32.2 → L2 (the GL₂ modularity inputs). Harris 1984 Thm 2.5.6 goes as a request with a proposed owner. | now; Harris request: blueprint (owner: maintainer) |
| /7 | high, missing | New stage AutomorphicPadicLFunctions:L3m (after L3; V5, IG.1, B5) owns Hida's mod-p linear independence (2010 Thm 3.20/Cor 3.21) and CM-point density reduction (2004 Thms 3.2–3.3), Hsieh 2012 Thms A–B, Vatsal 2003 and Finis 2006. Edges L3m → L3h, AC L1, AC L2s. L3h's Theorem C gains the omitted "p unramified in F" (a new Hsieh source issue). | now; blueprint (packet coverage, source issue) |
| /8 | medium, error | R17.5 → HE.6 is removed. Zhang's theorem becomes substage HE.6z, fed by R17.3, MIMC L1 (SU form, /14), Kato L4, GZ.5, BSD.5 (Ribet–Takahashi) and R20.2:level-raising, with Thm 7.1, Jochnowitz and Thm 6.4 nodes. The finding's direct edges into HE.6 would close a cycle with /10. | now; RS-21 (drop its HE.6 link) |
| /9 | medium, missing | New stage R28.7, Serre's open-image theorem (Invent. 15, intro (1)–(7)) with a GL₂-type analogue, fed by R28.6, R01.4 and R07.5. HE.7 imports it. The KOLYVAGIN-90 item g-serre-open-image changes from "planned" at HE.7 to missing, with R28.7 as the proposed owner. | now; KOLYVAGIN-90 review |
| /10 | medium, missing | Howard's DVR theorem (Thm 1.6.1, H.0–H.5) goes to ES.5 and the abstract Λ-adic Thm 2.2.10 to the rank-one ES.8. HE.6, HE.8 and GH.5 verify the hypotheses. Edges ES.5 → GH.5, ES.8 → GH.5 and HE.6 → HE.8; the last is acyclic only with /8's HE.6z. Decomposition nodes are narrowed. | now; blueprint |
| /11 | medium, duplicate | GZ.9 imports L3h's GL₂ distribution at F = ℚ and owns BDP's r = j = 0 Heegner-point formula, which GH.1's node imports for r = 0. GZ.9 keeps Brooks. Edges L3h → GZ.9 and GZ.9 → GH.1; the maintainer removes MSPL L2 → GZ.9. AUDIT-25's GH.4 duplicate note is corrected (CH Thm. 4.9 needs n > 1). | now; audit record |
| /12 | medium, library-claim | GZ.0's premise restated from the pinned code: ĥ is the (O)-height, the library pairing is the halved polar form, and the YZZ/Poincaré pairing is twice it (2^r on regulators). The GZ.0 checkpoint (#3803) already has this at node level. The README/docstring vs code disagreement goes to the Tau Ceti maintainer. | now; upstream |
| /13 | medium, error | Headings are added to HE.8b, BSD.6a and BSD.7a, and the atlas records are re-cut. HE.8 gets its own Dependencies line. The geometric Cornut–Vatsal input moves into HE.8. HE.8c keeps the L-value corollaries and BCGS, so both of its incoming edges stay and no edge is reversed. Two decomposition gaps are resolved. | now |
| /14 | medium, error | MIMC L1 gains a second target, Skinner's Theorem A with p ∤ N in all weights k ≡ 2 mod (p−1), with Skinner §2.5 integrality; FW 1.6 is kept. BSD.6 consumes the new target. Test curve 67.a1 at p = 3 (inside SU, outside FW 1.6). The finding's weight-two-only form is too narrow to seed L1m. | now |
| /15 | medium, missing | BSD.6a names Castella, Camb. J. Math. 6 (2018), with its 2024 erratum, and lists every input with an owner: BSD.7a's CGS Thm 6.5.1 (edge BSD.7a → BSD.6a), with the T_g extension proved here; BCK21 Thm 5.2 in an abstract form in HE.8; FW21 Cor 7.21 in AC L2 (the erratum's "FO12 Cor. 7.2.1" does not exist); CGS Prop 2.4.5 in L3h (edge L3h → BSD.7a); Greenberg via SIC L3; FO12 Lem 2.14 requested from R21.3; Skinner §3.1 proved in BSD.6a. Four erratum issues are recorded. | now; blueprint |
| /16 | medium, missing | A GZ.5 target L(1/2, π ⊗ χ) ≥ 0 for cuspidal π on PGL₂/ℚ and quadratic χ, by Waldspurger's coefficient formula (MP.7, with nonvanishing local data), Guo, or Lapid–Rallis. BSD.5 derives positivity in ranks 0 and 1 from it and GZ.8. Edge GZ.5 → BSD.5 (MP.7 → GZ.5 for route a). | now; blueprint |
| /17 | medium, missing | A GZ.3 target: the Manin constant of the X₀(N)-optimal curve is an integer, prime to every odd p of semistable reduction, and transfers across the class when E[p] is irreducible (and to E^D). Imported by BSD.6 (JSW), BSD.7a (explicit isogeny factor), MIMC L3. Edge GZ.3 → MIMC L3. | now; blueprint |
| /18 | medium, missing | SIC L3 gains Greenberg's surjectivity (with Σ-imprimitive variants and the Euler-factor formula), no-finite-submodule and, for one-variable Λ only, Fitt = char theorems. A PMIA L4 request supplies the Λ-module lemma. Edges SIC L3 → MIMC L1 and → BSD.6. | now; blueprint; verdict (KOLYVAGIN-90 item) |
| /19 | medium, error | The edge PHR L1 → SIC L2 is removed; PHR L1 → SIC L4 stays. Counts: raw 39 → 14, assembled 122 → 70. | now |
| /20 | medium, duplicate | The Layer 7 → SIC L2 link is already accepted (21 September). The SIC README and packet now import Layer 7's discrete Selmer structure, with a comparison node, and keep compact/rational, Greenberg, semilocal and mapping-fibre work. | now; blueprint |
| /21 | medium, duplicate | SIC L4 owns the Tate-twist dictionary; edge SIC L4 → ESCMC L3; ESCMC L3 is narrowed to the translation. The SIC packet's duplicate (and imprecise) even-twist node is deleted, which removes the packets' mutual import. | now; blueprint |
| /22 | medium, error | MIMC L1 and AC L1 are rewritten: FW Thm 1.6 is FW §4.8's route (Thm 7.32, Kings–Loeffler–Zerbes classes, Castella–Wan Thm 3.8 in weight k, §4.6.3's powers-of-p step), owned by AC L2 with a new edge Kato L4 → AC L2. AC L1 keeps Skinner–Urban with its weight and period gaps recorded. The RS-11 owner entry is split. | now; RS-11 |
| /23 | medium, missing | Edges R29.5 → MIMC L3 and R29.6 → MIMC L3. EllipticCurveModularity is added to MIMC's prerequisites, and L3 names the packet's parametrisation and modularity nodes. The verifier's six-step incidental paths are recorded. | now |
| /24 | medium, duplicate | Edge L2s → L2. L2 imports CLW's weight-two semi-ordinary theory and primitivity, and keeps FW §§7.2–7.4's general-weight additions. | now |
| /25 | medium, error | Edge L3h → AC L2s. L3h exports Theorems A, B and C to L2s (CLW §7.11, Thm 8.2.1(2), §5.6), and L2s verifies Hsieh's μ = 0 hypotheses. | now |
| /26 | medium, missing | New stages APL L3r (Hida's Rankin–Selberg p-adic L-function of a CM Hida family) and AC L0c (Hida–Tilouine/Hida anticyclotomic main conjecture for CM fields, single owner), both feeding L2s. L2s states CLW's integrality proof and records it as a gap until then. | now (stage records); blueprint (statements pinned from unread sources) |
| /27 | medium, duplicate | New stage PHR L3u (LZ14 §§3–4: Yager module, two-variable regulator, Prop. 4.11) imported by GH.7 and AC L2. AC L2 keeps only FW §4.2.1. The GH.8 packet request is redirected. | now; blueprint (GH.8 packet); RS-11 |
| /28 | medium, error | Edge R31.4 → AC L3 (Emerton's local–global compatibility; R30.1–R30.6 come through R31.4). A check that FW's Assumption 2.1 meets R31.4's hypotheses is added. SR.5 is left to the pending RS-21. | now; RS-21 |
| /29 | medium, error | L5a: "Theorem 4.2.1" becomes Prop 5.2.1 with Lemmas 5.1.1–5.1.2 and 5.2.3, importing Thm 4.1.3 and Cor 4.1.4 (the latter was missed by the red team) from KatoEulerSystems L5, and Prop 4.2.2 from L3h (Hsieh Thm B + CGS Prop 2.4.5). Thm 4.2.1 stays with HE.8/HE.8b. L2's integrality is a named input. | now |
| /30 | medium, duplicate | New KatoEulerSystems:L5 owns the BSTW ordinary two-variable zeta element (Thm 1.14, §§3–5) and Prop 9.18, stated as the identity ch(X_Gr)·(L_p) = ch(X_ord)·(L^Gr_p). Edges to AC L5a and BSD.6a. BSD.6a keeps the supersingular §6 and the supersingular case of 9.18, which BSTW leave to the reader. | now |
| /31 | medium, error | L5b: HE.8b → L5b is removed and KatoEulerSystems:L4 → L5b added (as pending RS-11 proposes; its "preserve HE.8b" row must be amended). The order becomes L5w → L5a → {L5b, HE.8b}; the L5b text follows BCS's proof of Thm 1.1.2; the order sentences in the AC, HE and MIMC READMEs are fixed. | now; RS-11 |
| /32 | medium, error | L4e states EW Thm 1.2's hypotheses: π tempered (removable only by the p. 34 remark) and pairwise distinct Satake characters (uniqueness in Prop. 4.8). AC L2, L2s and BSD.6a verify them. | now; blueprint |
| /33 | medium, error | L2's growth is split: growth and uniqueness only for F totally real (Leopoldt, tighter slope) or imaginary quadratic, from BS13/Wil17/Bergdall–Hansen. General F keeps only BSW's independence of choices up to fixed uniformisers (Prop. 9.6, after Thm 9.10). L0, the acceptance line, the handoff row and RS-14's L2 record are reworded. | now |
| /34 | medium, error | Edges ALS.1, ALS.2, ALS.3, ALS.5, AF.4 and R16.5 → APL L1, with L1's import text naming them. A packet request asks ALS.5 for BSW Thm 3.4's Eichler–Shimura–Harder injection over GL2/F (Hida 1994). | now; blueprint (request) |
| /35 | medium, error | ES.8 becomes rank-one on ES.5 + SIC L3 (edge ES.7 → ES.8 removed). New ES.8h (higher-rank Iwasawa variation) requires ES.7 and ES.8. | now |
| /36 | medium, error | Edges ES.2 → ECMC L0, ES.2 → KES L2, ES.4 and ES.8 → KES L4, plus IIT I.1 → KES L4; ECMC L0 → KES L2 and ECMC L2 → KES L4 are dropped. No Kato node cites cyclotomic units. | now |

## /1 (high, missing): the p-adic Ratner input behind Cornut and Cornut–Vatsal gets an owner, GN.4:padic-unipotent-flows, and HE.8 gets named CM-point nodes

### What the verifier corrected
- Confirmed without correction. HE.8 has no edge from `GeometryOfNumbersAndQuadraticArithmetic:GN.4` in any graph. No atlas stage plans the S-arithmetic Ratner theorem, and none plans a proven case of André–Oort.
- So the distribution theorem that HE.8 makes a proof target has no supplier on either of the two routes its source offers.

### State on main (45d60f04)
- **HE.8's text is unchanged since 15 September.** `content/campaign/HeegnerPointEulerSystems/README.md`, line 106: "Establish the geometric CM-point distribution and nonvanishing inputs of Cornut–Vatsal in the precise modular/quaternionic setting used here: these are construction/proof targets, not a consequence of a formal inverse limit." HE.8 has no Dependencies line of its own (see /13).
- **Requires.** HE.8's `requires` in the assembled atlas: ES.8, GZ.9, HE.3, HE.5, PadicFamilies:L1, SelmerIwasawaCohomology:L3, ModularSymbolsPadicLFunctions:L0–L2, and two Tau Ceti layers. There is no GN stage.
- **GN.4** (`content/campaign/GeometryOfNumbersAndQuadraticArithmetic/README.md`, line 65): "…separately schedule ergodic/mixing, unipotent-flow and nondivergence proofs needed for Oppenheim/Duke-type arithmetic applications." Its consumers are PM.4 and ST.2. The GN packet (`research/blueprint/packets/GeometryOfNumbersAndQuadraticArithmetic.json`, last changed 27 September) has 15 GN.4 nodes, all on lattice-point counting (Henk, successive minima). None is on dynamics.
- **André–Oort.** `LogicAndDefinabilityInNumberTheory:LD.6` says "Include source-scoped Andre-Oort and related proven cases". It names no theorem, and in particular not the Edixhoven–Yafaev case Cornut–Vatsal use. The verifier's "no stage plans a case of André–Oort" stands.
- **The integrated decomposition** (`data/decompositions/HeegnerPointEulerSystems.json`, unchanged since integration):
  - Node `HE.8/lambda-adic-heegner-kolyvagin-system-and-theorem-B`, hypothesis 2: "the class kappa^{Hg}_1 is nonzero BY THE WORK OF CORNUT AND VATSAL; this is an imported analytic/geometric nonvanishing input".
  - Its hypothesis 7 records the precise import in Howard's proof of Thm 2.3.7: "by the main result of [Cor02], one of the points Norm_{K_k[1]/K_k} P_k[1] has infinite order".
  - The gap "Nonvanishing inputs read only at the level of statements" says Cornut–Vatsal §§2–8 and Cornut's Theorems A/B were not read.
- **Libraries.** A case-insensitive grep over all `.lean` files at the pins (Mathlib 082e2d3, Tau Ceti f790474) finds nothing for `ratner`, `margulis`, `unipotent flow`, `unipotent orbit`, `andre.oort`, `cornut` or `vatsal`.
- **Pending RS-04** gives ES.8 the generic tower interfaces, and says HE.8 retains "Heegner nonvanishing and local checks". It does not touch this input.
- **Disclosure.** HE.8 is one of the stages targeted by route 4 of PAPER-KOLYVAGIN-90, an extraction this session wrote (Gross's exposition, clean case). That route does not concern Cornut–Vatsal. This fix follows the verifier only.

**Read at the source for this fix.**
- **Cornut–Vatsal, *CM points and quaternion algebras*** (the paper [5] of the finding). Author copy "Part2.pdf" dated 1 April 2005, the version published in Doc. Math. 10 (2005) 263–309.
  - Introduction: "The main theorems are given in Theorem 2.9 and Corollary 2.10 … in view of our earlier results [2], [18], [19], where all the main ideas are already present. As before, the basic ingredient is Ratner's theorem on unipotent flows on p-adic Lie groups." Here [2] is Cornut, Invent. Math. 148 (2002), and [18] is Vatsal, Invent. Math. 148 (2002). So Cornut's theorem, the one Howard actually imports, rests on the same input.
  - §2.7, Theorem 2.29, "a special case of a theorem of Margulis and Tomanov [11, Theorem 11.2] (see also Ratner's Theorem 3 in [15])". It concerns X = Γ\G^r with G = SL₂(F_P) and Γ a product of cocompact lattices, and V a one-parameter unipotent subgroup of G^r. There is a closed L ⊃ V with the closure of x·V equal to x·L, carrying an L-invariant probability measure μ, and the averages of f over x·v(t), t ∈ s·κ, tend to ∫f dμ.
  - Lemma 2.30 (the twisted diagonal): "This is Corollary 4 of Theorem 6 in [15] when F_P = Q_p … The case of general F_P seems to be well-known to the experts, see for instance the notes of N. Shah [17]".
  - Proposition 2.23 is "a special case of a theorem of Ratner, Margulis, and Tomanov". Corollary 2.10: for all but finitely many x in H, Red(G·x) = C⁻¹(G·x̄).
- **Cornut–Vatsal, *Nontriviality of Rankin–Selberg L-functions and CM points*.** The finding's file (sha256 bdf258c7…, the same hash).
  - The p. 18 and p. 19 quotations are verbatim, and so are §4.6's "First proof (using a proven case of the André-Oort conjecture)" and "Second proof (using a theorem of M. Ratner)".
  - The first proof uses Remark 3.21 of [5], whose hint cites Edixhoven–Yafaev, Ann. of Math. 157 (2003), §7.3.
  - Theorem 1.10, and Theorem 4.1 (for n ≫ 0 and a good CM point x ∈ CM(Pⁿ), some primitive χ of G(n) inducing a fixed χ₀ on G₀ has e_χ α(x) ≠ 0), were read.
- **A check of the mathematics: the Ratner input cannot be bypassed by the elementary argument.**
  - CV Proposition 4.4 is elementary: α is finite and the torsion of A(K[P^∞]) is finite, so α(x) is non-torsion for n ≫ 0. It yields only *some* character χ (Prop. 4.7), with no control of the tame part χ₀.
  - Howard needs Norm_{K_k[1]/K_k} P_k[1] non-torsion. That is the component with χ₀ trivial on the torsion subgroup G₀ ⊇ Gal(K[1]/K), which is exactly the fixed-tame-type statement.
  - CV Remark 4.8 says that statement "seems to entail a significantly deeper assertion". So κ^Hg_1 ≠ 0 does need Cornut's theorem, hence Ratner (or, for p split, the route below).
- **Hsieh**, *Special values of anticyclotomic Rankin–Selberg L-functions* (Doc. Math. 19 (2014) 709–767). Author copy VBDP.pdf, introduction, application II: "this gives a new proof of Cornut-Vatsal theorem on Mazur conjecture for higher Heegner points when p is split in the imaginary quadratic field." This matches the finding's quotation (Doc. Math. p. 714). That route rests on Hsieh's Theorem C, whose own inputs are the Hida mod-p results of /7.

### Fix
1. **New stage `GeometryOfNumbersAndQuadraticArithmetic:GN.4:padic-unipotent-flows`**, a suffix of GN.4. GN.4's own scope stays real/Oppenheim. Insert in `content/campaign/GeometryOfNumbersAndQuadraticArithmetic/README.md` after the GN.4 block (after its line 73, "**Execution state:** …"):

   > ### GN.4:padic-unipotent-flows Unipotent flows on products of p-adic quotients
   >
   > **Construct and export.** For a nonarchimedean local field F_P, G = SL₂(F_P), r ≥ 1 and Γ = Γ₁ × ⋯ × Γ_r a product of cocompact lattices in G, prove Margulis–Tomanov's orbit-closure and uniform-distribution theorem in the form used by Cornut–Vatsal (CM points and quaternion algebras, Thm 2.29, a special case of Margulis–Tomanov, Invent. Math. 116 (1994), Thm 11.2):
   > - for every x ∈ Γ\G^r and every one-parameter unipotent subgroup V = {v(t)} of G^r, there is a closed subgroup L ⊃ V with the closure of x·V equal to x·L, carrying an L-invariant Borel probability measure μ;
   > - for every continuous f and every compact κ ⊂ F_P of positive Haar measure, (1/λ(s·κ))∫_{s·κ} f(x·v(t)) dλ(t) → ∫ f dμ as |s| → ∞.
   >
   > Prove Ratner's classification of the invariance group for diagonal flows: for V = Δ(U), with U a nontrivial one-parameter unipotent subgroup of G, the invariance group contains a twisted diagonal c·Δ(G)·c⁻¹ with c ∈ U^r. This is Ratner, Duke Math. J. 77 (1995), Thm 6 Cor. 4, stated for F_P = Q_p. Export the case F_P = Q_p. For general F_P, Cornut–Vatsal cite only unpublished notes of N. Shah; keep that case as an open obligation, not a target.
   >
   > **Inputs.** `GeometryOfNumbersAndQuadraticArithmetic:GN.4`
   >
   > **Acceptance.** The lattices are cocompact (quaternion algebras ramified at the relevant places), the acting group is unipotent and the limit is over growing F_P-balls. The theorem for real Lie groups does not give the p-adic one. The consumer is HeegnerPointEulerSystems HE.8 (Cornut 2002; Cornut–Vatsal).
   >
   > **Source route.** Margulis–Tomanov, Invent. Math. 116 (1994) 347–392, Thm 11.2; Ratner, Duke Math. J. 77 (1995) 275–382, Thm 3 and Thm 6 Cor. 4. Neither has been read for this fix. Record the exact statements and proofs before decomposing.

   `data/atlas.json`: add the stage, with `requires` [GN.4]. Add the stageEdges GN.4 → GN.4:padic-unipotent-flows and GN.4:padic-unipotent-flows → HeegnerPointEulerSystems:HE.8. Add HE.8 to its `consumers`.
   - Cycle test for GN.4:padic-unipotent-flows → HE.8: acyclic (the assembled graph has no path HE.8 → GN.4).
2. **HE.8 text.** Replace the sentence of line 106 quoted above (it occurs exactly once) with:
   > Prove the geometric CM-point inputs as named results, importing the p-adic unipotent-flow theorem from GeometryOfNumbersAndQuadraticArithmetic GN.4:padic-unipotent-flows:
   > - Cornut–Vatsal's surjectivity and uniform distribution of reductions of Galois orbits of P-isogenous CM points (*CM points and quaternion algebras*, Thm 2.9 and Cor. 2.10);
   > - Cornut's theorem (Invent. Math. 148 (2002)) that some Norm_{K_k[1]/K_k} P_k[1] has infinite order, the input to Howard's Thm 2.3.7;
   > - Cornut–Vatsal's Theorems 1.10 and 4.1 (for n ≫ 0 and a good CM point x of conductor Pⁿ, some primitive χ inducing a fixed tame χ₀ has e_χ α(x) ≠ 0).
   >
   > The elementary finiteness argument (CV Prop. 4.4/4.7) gives non-torsion points but no control of the tame character χ₀, so it does not give κ^Hg_1 ≠ 0. For p split in K a Ratner-free route is also admissible: Hsieh's Theorem C (AutomorphicPadicLFunctions L3h, with its own Hida inputs) together with the BDP logarithm formula. The inert-p branch keeps the dynamical input. These are construction/proof targets, not a consequence of a formal inverse limit.
3. **HE.8's new Dependencies line.** See /13, edit 2; it names GN.4:padic-unipotent-flows and L3h. Add the stageEdge `AutomorphicPadicLFunctions:L3h → HeegnerPointEulerSystems:HE.8` and L3h to HE.8's `requires`.
   - Cycle test for L3h → HE.8: acyclic (no path HE.8 → L3h).
   - The BDP formula comes from its single owner as /11 settles it. If that owner is GZ.9, it is already a prerequisite of HE.8. If it is GH.1, the edge GH.1 → HE.8 must be cycle-tested with /11's edges.
4. **Decomposition `data/decompositions/HeegnerPointEulerSystems.json`: three new nodes under HE.8** (`parentStageId` HeegnerPointEulerSystems:HE.8, `kind` theorem, `implementationStatus` unchecked).
   - Each node carries the statement given in edit 2.
   - Their hypotheses are those of the cited theorems: CV [5] §2.2, R a finite set of Galois elements pairwise distinct modulo Gal_K^{P-rat}, H a P-isogeny class; Cornut's Heegner hypothesis and p ∤ N (as HE.8c records).
   - Their sources are the locators read above.
   - Their inputs are recorded as `links`, as this decomposition does elsewhere; its nodes have no `prerequisites` field:
     - GN.4:padic-unipotent-flows → cm-points-reduction-surjectivity;
     - `HE.1/heegner-points-of-conductor-m-and-the-modular-parametrisation` → cornut-higher-heegner-points-nontorsion.

   | Node id | Content |
   |---|---|
   | `HeegnerPointEulerSystems:HE.8/cm-points-reduction-surjectivity` | CV [5] Thm 2.9 and Cor. 2.10 |
   | `HeegnerPointEulerSystems:HE.8/cornut-higher-heegner-points-nontorsion` | Cornut 2002, the statement as Howard's proof of Thm 2.3.7 uses it |
   | `HeegnerPointEulerSystems:HE.8/cornut-vatsal-cm-point-nontriviality` | CV Thm 1.10 and Thm 4.1 |

   - Add the links cm-points-reduction-surjectivity → each of the other two, and cornut-higher-heegner-points-nontorsion → `HE.8/lambda-adic-heegner-kolyvagin-system-and-theorem-B`.
   - **Theorem B node, `hypotheses[1]`.** Old: "the class kappa^{Hg}_1 is nonzero BY THE WORK OF CORNUT AND VATSAL; this is an imported analytic/geometric nonvanishing input, not a formal consequence of the inverse limit". New:
     > the class kappa^{Hg}_1 is nonzero: Howard's Thm 2.3.7 uses Cornut's theorem (node HE.8/cornut-higher-heegner-points-nontorsion, proved here from GN.4:padic-unipotent-flows) and Perrin-Riou's Prop. 10; it is not a formal consequence of the inverse limit, and the elementary CV Prop. 4.4 does not suffice because it does not fix the tame character.

   Where the Cornut–Vatsal L-value node sits is settled in /13.

### Not done, and why
- **No new homogeneous-dynamics roadmap is proposed.** A suffix of GN.4 is the smaller change. The finding offers both, and GN.4 already owns "unipotent-flow" scheduling. If the maintainer prefers a separate roadmap for Ratner's theorems (real and S-arithmetic), the suffix moves there unchanged.
- **The André–Oort route is not given an edge.** It needs Edixhoven–Yafaev's case, which LD.6 does not name. Recording it in LD.6 is optional and does not close the gap alone, since the inert-p branch can use either route.
- **Shah's notes (general F_P)** are unpublished. The target is restricted to F_P = Q_p, which is all that E/ℚ and HE.8 need.

## /2 (high, missing): Zhang's level raising gets an owner, SerreWeightAndLevelOptimisation R20.2:level-raising, and HE.6's Zhang branch imports it

### What the verifier corrected
- Confirmed without correction:
  - no atlas stage plans Ribet or Diamond–Taylor level raising;
  - R20.2 owns level lowering, and R27.4 (after accepted RS-06) only the Khare–Wintenberger step;
  - the Tau Ceti `levelRaise` is the degeneracy operator;
  - HE's source line omits Zhang §2.

### State on main (45d60f04)
- **HE.6's text is unchanged.** `content/campaign/HeegnerPointEulerSystems/README.md`, line 84: "Instantiate Zhang's indivisibility theorem with its explicitly enumerated residual ramification assumptions, using the existing level-raising/transfer owners for their generic theory and proving the Heegner congruence/rank-lowering application here." Line 132 reads "Zhang, *Selmer groups and the indivisibility of Heegner points*, §§3–11".
- **New since the red team: the SerreWeightAndLevelOptimisation packet has changed.** `research/blueprint/packets/SerreWeightAndLevelOptimisation.json` gained R20.2 nodes on 28 September (#3315, "Diamond's criterion and the bad-fibre geometry"). They are:
  - `R20.2/q-new-subspace`;
  - `R20.2/auxiliary-prime`;
  - `R20.2/level-raising-diamond`: "Diamond's level-raising criterion (Ribet, Theorem 5.1)", from Ribet, *Report on mod ℓ representations of Gal(Q̄/Q)*;
  - `R20.2/degeneracy-map-and-eta` (Ribet Thm 6.1).

  So one level-raising theorem is now planned, but only in this form:
  - `level-raising-diamond` states, for ρ̄ irreducible from S_k(Γ₁(N)), N prime to ℓ, q ∤ Nℓ and 2 ≤ k ≤ ℓ+1, that (I) ρ̄ arises from a q-new eigenform on Γ₁(N) ∩ Γ₀(q) iff (II) the characteristic polynomial of ρ̄(Frob_q) is (T−a)(T−qa).
  - Its proof step for II ⇒ I reads only "Follow Diamond's intermediate results, within the stated weight range, to conclude I."
  - It gives a form new at q on Γ₁(N) ∩ Γ₀(q). It does not give a newform of exact level Nq with trivial nebentypus, which is what Zhang needs.
- **The Tau Ceti declaration.** `TauCeti.ModularForm.levelRaise`, `TauCeti/NumberTheory/ModularForms/Degeneracy.lean:278` (declarations.tsv line for that name). Its docstring at line 276 reads "The level-raising (degeneracy) operator `V_d`, `(V_d f) τ = f (d τ)`", and it is defined as `d^(1-k) • f ∣[k] diag(d,1)`. It is the degeneracy map, as the finding says. The packet node `R20.2/q-new-subspace` already uses it only as the degeneracy inclusion.
- **Libraries.** Neither pinned library has `ribet`, `diamond.taylor`, `jacquet.langlands` or `ihara` in a `.lean` file (Mathlib's one `ihara` hit is an unrelated partial-fractions file).
- **Graph.** R20.2 reaches HE.6 today only through R20.3 → R20.4 → R20.6 → R29.3 → R29.4 → HE.1 → … → HE.5 → HE.6. This is the path the finding means.

**Read at the source.** W. Zhang, Camb. J. Math. 2 (2014) 191–253, the International Press PDF the red team used (sha256 698eb8a6…).
- §2, p. 203, Theorem 2.1 (Ribet, Diamond–Taylor): "Let g be a newform of weight two of level N (and trivial nebentypus). Let p be a prime of O_g such that ρ_{g,p} is irreducible with residue characteristic p ≥ 5. Then for each admissible prime q, there exists a newform g′ of level Nq (and trivial nebentypus), with a prime p′ of O_{g′} … such that ρ_{g,p0} ≃ ρ_{g′,p′0}".
- Notation (xiv), p. 202: a prime q is admissible "if q is prime to NDp, inert in K, p does not divide q² − 1, and … v_p((q + 1)² − a_q²) ≥ 1".
- The proof applies "[11, Theorem 1] (cf. [10, Theorem B])" with the local type at q an unramified twist of Steinberg ("Such τ_q exists because a_q(g) ≡ ±(q + 1) mod p"). It keeps the inertial types at every ℓ ≠ p, so that the level is exactly Nq. It then shows the nebentypus is trivial by comparing determinants.
- [10] is Diamond–Taylor, *Nonoptimal levels of mod l modular representations*, Invent. Math. 115 (1994). [11] is Diamond–Taylor, *Lifting modular mod l representations*, **Duke Math. J. 74 (1994) 253–269**. The finding's "J. reine angew. Math. 449 (1994)" is not a reference of Zhang's; the correct second citation is the Duke paper.
- §4, p. 219: Zhang uses "Ihara's lemma in [10] for Shimura curves over Q" through Bertolini–Darmon Thm 9.2, and the Jacquet–Langlands transfer of g_{mq₁} to a Shimura set.

**The mathematics checked.**
- Diamond's criterion (the packet node) and Theorem 2.1 are different theorems. Ribet's theorem, and Diamond's extension, give *some* newform of level dividing Nq that is new at q.
- Theorem 2.1 needs a newform of **exact** level Nq, trivial nebentypus and the prescribed local type at every ℓ | N. That is a Diamond–Taylor lifting with prescribed inertial types.
- Zhang's rank-lowering induction (§§4–5) compares local conditions at every ℓ | N, so the exact level is used. The packet node alone is therefore not the supplier.

### Fix
1. **New stage `SerreWeightAndLevelOptimisation:R20.2:level-raising`**, beside R20.2. Insert in `content/campaign/SerreWeightAndLevelOptimisation/README.md` between R20.2's Dependencies line and `<a id="r20-3"></a>` (the two-line anchor "**Dependencies:** R20.1 (preceding layer).\n\n<a id=\"r20-3\"></a>" occurs exactly once):

   > <a id="r20-2-level-raising"></a>
   > ## R20.2:level-raising. Raising the level, with prescribed local types, and its quaternionic transports
   >
   > **Milestone:** `R20.2:level-raising`
   >
   > Prove Ribet's level-raising theorem and Diamond–Taylor's generalization in the form of W. Zhang, Camb. J. Math. 2 (2014), Thm 2.1. Let g be a weight-two newform of level N with trivial nebentypus, and 𝔭 a prime of O_g above p ≥ 5 with ρ̄_{g,𝔭} irreducible. Let q ∤ Np be a prime with p ∤ q² − 1 and a_q(g) ≡ ±(q+1) mod 𝔭. Then there is a newform g′ of level exactly Nq with trivial nebentypus, and a prime 𝔭′ of O_{g′}, such that ρ̄_{g,𝔭} ≅ ρ̄_{g′,𝔭′} over a common residue field. Equivalently, a_ℓ(g) ≡ a_ℓ(g′) for all ℓ ≠ q. Iterate this over a squarefree product m of such primes.
   >
   > The proof prescribes the inertial type at every ℓ ≠ p (Diamond–Taylor, Duke Math. J. 74 (1994), Thm 1; Invent. Math. 115 (1994), Thm B), with an unramified twist of Steinberg at q. It then derives exactness of the level from local–global compatibility, and triviality of the nebentypus from the determinant. Import Diamond's criterion (R20.2/level-raising-diamond) only for the q-new existence step; it does not give the exact level.
   >
   > Prove the Jacquet–Langlands transports Zhang §§3–6 use: g_m to the definite quaternion algebra of discriminant N⁻m (odd number of primes; the Shimura-set eigenfunction φ of Bertolini–Darmon §9) and to indefinite Shimura curves (even number). Include the multiplicity-one input (Helm, Israel J. Math. 160 (2007), Cor. 8.11, under Zhang's Hypothesis ♥) and Ihara's lemma for Shimura curves (Diamond–Taylor, Invent. Math. 115). The admissibility conditions that depend on an imaginary quadratic field (q inert in K) belong to the Heegner consumer, not here.
   >
   > **Dependencies:** R20.2; GL2AutomorphicRepresentationsAndTransfer R17.3 and R17.6; HilbertModularVarietiesAndShimuraCurves R18.6.

   `data/atlas.json`: add the stage, with `requires` [R20.2, GL2AutomorphicRepresentationsAndTransfer:R17.3, GL2AutomorphicRepresentationsAndTransfer:R17.6, HilbertModularVarietiesAndShimuraCurves:R18.6] and the four stageEdges. Add the stageEdge R20.2:level-raising → HeegnerPointEulerSystems:HE.6z; the new substage HE.6z is defined in /8.
   - Cycle tests: every edge into R20.2:level-raising is acyclic, since it is a new sink until its HE.6z edge. For R20.2:level-raising → HE.6z: acyclic (no path from HE.6z to R20.2, R17.3, R17.6 or R18.6).
2. **HE.6's Zhang sentence** (line 84, quoted above; it occurs exactly once) moves to HE.6z (see /8) and reads there:
   > Instantiate Zhang's indivisibility theorem (Camb. J. Math. 2 (2014), Thm 1.1: p ≥ 5 good ordinary, ρ̄ surjective, Hypothesis ♠, N⁻ squarefree with an even number of prime factors, p ∤ D_K N and (D_K, N) = 1) with its explicitly enumerated residual ramification assumptions. Import level raising (Zhang Thm 2.1) and the Jacquet–Langlands transports from SerreWeightAndLevelOptimisation R20.2:level-raising; they are imported, not "existing". Prove here the Heegner congruence and rank-lowering application: admissible primes (q inert in K), Zhang §§3–11.
3. **Sources line** (line 132). Replace "Zhang, *Selmer groups and the indivisibility of Heegner points*, §§3–11" (it occurs exactly once) with "Zhang, *Selmer groups and the indivisibility of Heegner points*, §2 (Theorem 2.1, imported from SerreWeightAndLevelOptimisation R20.2:level-raising) and §§3–11".
4. **Packet request.** Once the new stage exists, its blueprint job gets a `requests` entry to `SerreWeightAndLevelOptimisation:R20.2`: "Diamond's criterion R20.2/level-raising-diamond with the II ⇒ I proof decomposed (not 'follow Diamond's intermediate results'), for use as the q-new step of R20.2:level-raising."

### Not done, and why
- **Diamond's criterion node is not moved.** The packet's R20.2/level-raising-diamond stays where the SWLO blueprint put it. The new stage imports it and adds the exact-level lifting.
- **The citation "J. reine angew. Math. 449 (1994)" is not used.** Zhang's bibliography gives the Duke paper, which is the one used here.

## /3 (high, duplicate): GZ.1 keeps only the Gross–Zagier normalisations, and imports the height machine from RP.0 and Mordell–Weil from RP.1

### What the verifier corrected
- **Confirmed, and the graph was checked.** GZ.1's `requires` are A2, GZ.0 and three Tau Ceti layers. Neither RP.0 nor RP.1 is among its ancestors in any graph.
- **RS-03 is accepted.** It keeps exactly the height machine, the canonical and local heights of general abelian varieties, and abelian-variety descent in RP.0/RP.1. GZ.1 was not in RS-03's family, so nothing resolves the overlap.
- No narrowing of the fix. One correction of mine to the fix's last clause (BSD.1) is under "Not done, and why".

### State on main (45d60f04)
- **GZ.1's text is unchanged since 15 September.** In `content/campaign/GrossZagierAndArithmeticHeights/README.md`:
  - line 29 reads "Construct Weil heights for the line bundles used on projective abelian varieties, … Prove positivity for ample symmetric bundles and characterize the zero locus as torsion over a number field using Northcott and finite generation."
  - line 31 ends "General Mordell–Weil or projective-height lemmas absent from the imported owners are construction targets here, proved through weak descent and the height argument, not assumed positivity axioms."
  - line 33 reads "**Dependencies:** GZ.0; AbelianSchemesAndArithmeticModuli A1–A3; ArithmeticHeights #287 for existing general height APIs; EllipticCurves Layer 6 for its specialization."
- **Graph.** In the assembled graph, GZ.1 `requires` = [AbelianSchemesAndArithmeticModuli:A2, GZ.0, JacobianChallenge layers D and E, ModularCurves 2D, EllipticCurves Layer 6], and its consumers are [GZ.2, RankZeroOneBSD:BSD.1]. RP.0 and RP.1 both exist in `data/atlas.json`: "Height machine and canonical heights" and "Weak Mordell–Weil and descent".
- **RS-03** (`data/restructure/RS-03.result.json`, accepted):
  - RP.0 keeps "The divisor/line-bundle height machine, tensor and pullback functoriality, general-abelian-variety canonical/local heights, … Keep the original Northcott applications through import."
  - RP.1 keeps "General-abelian-variety Kummer/isogeny and descent geometry, … finite-quotient/height arguments for finite generation".
- **RP.0's README text** (`content/campaign/HeightsRationalPointsAndObstructions/README.md` line 24) reads "Construct divisor/line-bundle heights modulo bounded functions and their pullback/tensor laws; compare Néron–Tate and local heights on abelian varieties." It does not name the canonical limit, positivity or the torsion characterisation, though RS-03 keeps "general-abelian-variety canonical/local heights" there. Edit 4 below makes this explicit, so that GZ.1's imports have a stated target.
- **The integrated decomposition.** `data/decompositions/GrossZagierAndArithmeticHeights.json` (16 September) has one GZ.1 node, `GZ.1/neron-tate-height-and-the-poincare-pairing`. It states YZZ Thm 7.1 (positivity/torsion, quadraticity; proof "quoted by Yuan–Zhang–Zhang from Serre's book … not read here") and Thm 7.2 (⟨x,y⟩_L = ⟨x, φ_L y⟩_NT). Its acceptance records ⟨x,x⟩_L = 2ĥ_L(x). No GZ packet other than the GZ.0 checkpoint exists, and that checkpoint does not plan GZ.1 (its gap "The Poincaré-biextension pairing against ⟨,⟩_BSD" defers to GZ.1).
- **Library, at the pin.**
  - Mathlib 082e2d3, `Mathlib/GroupTheory/Descent.lean:149` (declarations.tsv: `CommGroup.fg_of_descent'`, theorem, line 149; the additive `AddCommGroup.fg_of_descent'` is generated by `@[to_additive]` at line 142). Its hypotheses are:
    - `(powMonoidHom 2).range.FiniteIndex`, i.e. G/2G finite;
    - `∀ x, 0 ≤ h x`;
    - the approximate parallelogram law `|h (x * y) + h (x / y) - 2 * (h x + h y)| ≤ C`;
    - `[Northcott h]`.

    It concludes `Group.FG G`. The module docstring calls this the descent theorem of the standard Mordell–Weil proof. So the "height argument" half of Mordell–Weil is in Mathlib, and weak Mordell–Weil plus a height with these properties is all that remains.
  - Tau Ceti f790474, `TauCeti/AlgebraicGeometry/EllipticCurve/CanonicalHeight.lean:323`, `Point.isOfFinAddOrder_of_canonicalHeight_eq_zero`, assumes `[W.toAffine.IsElliptic] [Northcott (Point.canonicalHeight (W := W))]` and nothing about finite generation.
- **The mathematics of the torsion clause.**
  - ĥ_L(nx) = n²ĥ_L(x). So ĥ_L(x) = 0 puts every multiple of x in the set of points of A(F(x)) of bounded height.
  - Northcott makes that set finite over the number field F(x). So x is torsion.
  - Finite generation of A(F) is not used, and the converse needs only quadraticity.
- **Audit.** `data/library-coverage.json` is merged with AUDIT-25. Its GZ.1 entry lists RP.0, RP.1 and ArithmeticDynamics:DY.1 as duplicates. Its torsion target reads "(via Northcott and finite generation)"; the note beside it already says the Tau Ceti instance needs only Northcott.
- **Disclosure.** None of this session's earlier work touches GZ.1, RP.0 or RP.1.

### Fix
1. **`content/campaign/GrossZagierAndArithmeticHeights/README.md`, GZ.1, line 29.** The old paragraph was checked by script to occur exactly once. Replace "Construct Weil heights for the line bundles used on projective abelian varieties, their bounded-error functoriality and the canonical limit for symmetric bundles. Prove convergence, uniqueness among bounded-error quadratic refinements, addition and multiplication formulas, isogeny pullback, and independence under finite extension with the specified arithmetic-degree normalization. Prove positivity for ample symmetric bundles and characterize the zero locus as torsion over a number field using Northcott and finite generation." with:
   > Import from HeightsRationalPointsAndObstructions RP.0 the Weil height machine for line bundles on projective varieties, its bounded-error functoriality, the canonical limit ĥ_L for symmetric L on an abelian variety with its uniqueness, quadraticity, multiplication and isogeny-pullback formulas, and positivity of ĥ_L for ample symmetric L with zero locus the torsion points. The torsion characterisation needs Northcott finiteness only, not finite generation. Here fix Yuan–Zhang–Zhang's normalisation: heights relative to the base number field F ("Our normalization of heights depends on F"), and ⟨x,y⟩_L = ĥ_L(x+y) − ĥ_L(x) − ĥ_L(y), so ⟨x,x⟩_L = 2ĥ_L(x) (YZZ §7.1.1, Thm. 7.1). Take the Poincaré bundle P on A × A∨, which is symmetric, and its canonical height as the bilinear pairing ⟨,⟩_NT : A(F̄) × A∨(F̄) → ℝ, and prove ⟨x,y⟩_L = ⟨x, φ_L(y)⟩_NT for ample symmetric L (YZZ Thm. 7.2). Prove adjunction of ⟨,⟩_NT under homomorphisms and their duals.
2. **Same stage, line 31.** Replace "Compare the dimension-one instance with EllipticCurves' existing height rather than defining a second public elliptic height. General Mordell–Weil or projective-height lemmas absent from the imported owners are construction targets here, proved through weak descent and the height argument, not assumed positivity axioms." (checked: occurs once) with:
   > Compare the dimension-one instance with EllipticCurves' existing height rather than defining a second public elliptic height: through the principal polarisation of (O), ⟨,⟩_NT restricts to twice the pinned Tau Ceti pairing (GZ.0). Mordell–Weil for abelian varieties over number fields is imported from HeightsRationalPointsAndObstructions RP.1, whose height half is Mathlib's `AddCommGroup.fg_of_descent'` (`Mathlib/GroupTheory/Descent.lean`, Mathlib 082e2d3: G/2G finite, a nonnegative height with the approximate parallelogram law and Northcott imply finite generation). Mordell–Weil for elliptic curves over number fields is EllipticCurves Layer 6. Neither is rebuilt here.

   The M-linear pairing sentence ("Pass to rational points modulo torsion … dual-endomorphism compatibility.") stays unchanged. It is Gross–Zagier-specific and stays in GZ.1.
3. **Same stage, Dependencies (line 33).** "**Dependencies:** GZ.0; AbelianSchemesAndArithmeticModuli A1–A3; ArithmeticHeights #287 for existing general height APIs; EllipticCurves Layer 6 for its specialization." → "**Dependencies:** GZ.0; HeightsRationalPointsAndObstructions RP.0 (height machine, canonical heights, positivity and torsion) and RP.1 (Mordell–Weil for abelian varieties); AbelianSchemesAndArithmeticModuli A1–A3; ArithmeticHeights #287 for existing general height APIs; EllipticCurves Layer 6 for its specialization."
4. **`content/campaign/HeightsRationalPointsAndObstructions/README.md`, RP.0, line 24.** This makes explicit what RS-03 already keeps there, so that GZ.1's imports have a target. Replace "Construct divisor/line-bundle heights modulo bounded functions and their pullback/tensor laws; compare Néron–Tate and local heights on abelian varieties." (checked: occurs once) with:
   > Construct divisor/line-bundle heights modulo bounded functions and their pullback/tensor laws. On an abelian variety over a number field construct the canonical height ĥ_L = lim 4^{−n} h_L(2^n x) for symmetric L, prove uniqueness among quadratic functions within a bounded distance of h_L, quadraticity, ĥ_L(nx) = n²ĥ_L(x) and isogeny pullback, and prove for ample symmetric L that ĥ_L ≥ 0 with ĥ_L(x) = 0 exactly for torsion x (Northcott only). Compare Néron–Tate and local heights on abelian varieties. GrossZagierAndArithmeticHeights GZ.1 imports these.
5. **`data/atlas.json`.**
   - Add `HeightsRationalPointsAndObstructions:RP.0` and `HeightsRationalPointsAndObstructions:RP.1` to GZ.1's `requires`, and GZ.1 to the `consumers` of each.
   - Add the stageEdges records `{"source": "HeightsRationalPointsAndObstructions:RP.0", "target": "GrossZagierAndArithmeticHeights:GZ.1"}` and `{"source": "HeightsRationalPointsAndObstructions:RP.1", "target": "GrossZagierAndArithmeticHeights:GZ.1"}`.
   - Cycle test for RP.0 → GZ.1: acyclic (no path GZ.1 → RP.0 in the assembled graph).
   - Cycle test for RP.1 → GZ.1: acyclic (no path GZ.1 → RP.1).
   - The GZ.1 stage description is regenerated from the README.
6. **`data/decompositions/GrossZagierAndArithmeticHeights.json`, node `GZ.1/neron-tate-height-and-the-poincare-pairing`, `proofSteps[0]`.** "The Weil height machine gives h_L up to bounded functions; the quadratic limit removes the ambiguity." → "The Weil height machine, the canonical limit and Thm. 7.1 (positivity, torsion by Northcott, quadraticity) are imported from HeightsRationalPointsAndObstructions:RP.0; this node fixes YZZ's normalisation of ⟨,⟩_L and proves Thm. 7.2 from them."
7. **Audit record (AUDIT-25, merged in `data/library-coverage.json`), GZ.1 target "Positivity for ample symmetric bundles, and zero locus equal to torsion over a number field (via Northcott and finite generation)".** Drop "and finite generation" from the target. The note already records that the instance hypothesis is Northcott alone. The orchestrator merges audit edits.

### Not done, and why
- **BSD.1 is not rerouted to RP.1. I disagree with the finding on this one point.**
  - BSD.1 concerns E/ℚ and its base change to a quadratic field K. Mordell–Weil for elliptic curves over number fields is Tau Ceti EllipticCurves Layer 6: its text reads "For `K` a number field, `E(K)` is a **finitely generated** abelian group", `content/tau-ceti/EllipticCurves/README.md` line 1153.
  - Accepted RS-30's owner entry "Mordell-Weil finite generation and finite rational-point torsion over number fields" names Layer 6, `formerly` BSD.1. Layer 6 → BSD.1 is already an edge.
  - Routing BSD.1 to RP.1 would import abelian-variety fppf descent that BSD.1 does not use.
  - So the correct fix is to remove BSD.1's reason to import GZ.1:
    - **README** (`content/campaign/RankZeroOneBSD/README.md` line 31, checked once): "**Dependencies:** EllipticCurves Layers 4–7; ArithmeticGaloisDuality R02.2–R02.4; NeronModelsAndSemistableAbelianVarieties R11; GrossZagierAndArithmeticHeights GZ.0–GZ.1." → "**Dependencies:** EllipticCurves Layers 4–7 (Layer 6 supplies Mordell–Weil over number fields); ArithmeticGaloisDuality R02.2–R02.4; NeronModelsAndSemistableAbelianVarieties R11; GrossZagierAndArithmeticHeights GZ.0."
    - **Maintainer's removal:** the stage edge GZ.1 → BSD.1, with GZ.1 dropped from BSD.1's `requires`.
  - Removing that edge costs BSD.1 exactly one ancestor, GZ.1 itself. No descendant of BSD.1 loses GZ.1, which all of them still reach through GZ.2 → … → GZ.8.
- **No ArithmeticDynamics:DY.1 edit.** The audit lists DY.1 as a third duplicate, but the finding and the review concern RP.0/RP.1 only.

## /4 (high, missing): the rank-zero multiplicative branch gets its three owners: Skinner's Theorem A for p ∥ N (new MIMC L1m), Greenberg–Stevens (PadicFamilies L3/L4) and Barré-Sirieix–Diaz–Gramain–Philibert (DT.5)

### What the verifier corrected
- Confirmed without correction. The three inputs the rank-zero multiplicative case of BSD.6 needs have no owner:
  - MIMC L1 is FW's theorem with p ∤ N, and MIMC L2's local hypothesis (1) excludes multiplicative p (E[p]|G_Qp has semisimplification ψ ⊕ ωψ with ψ unramified, which is the excluded shape χ ⊕ χ_cyc χ);
  - no stage plans the Greenberg–Stevens exceptional-zero theorem;
  - no stage plans the transcendence of the Tate period, on which the non-vanishing of the L-invariant rests.
- The branch is therefore stated without a route.

### State on main (45d60f04)
- **BSD.6 text is unchanged since 15 September.** `content/campaign/RankZeroOneBSD/README.md` line 85 reads: "- Analytic rank zero, p odd of good ordinary or multiplicative reduction, E[p] irreducible, and a multiplicative prime q where E[p] ramifies: the Skinner–Urban/Skinner branch summarized precisely in JSW Theorem 7.2.1(ii). For the supersingular branch use its semistable (or explicitly permitted twist) condition and a_p=0. These are named branches, not a universal good-prime formula." BSD.6 has no Dependencies line of its own; the one at line 102 follows the BSD.6a text (the record duplication of /13 and /39).
- **BSD.6's `requires`** (assembled atlas) are HE.6, HE.8b, MIMC L1, BSD.5, BSD.6a, BSD.1, GZ.0 and five Tau Ceti EllipticCurves layers. None is a multiplicative main conjecture, and neither is BSD.6a's.
- **MIMC L1** (`content/campaign/ModularIwasawaMainConjectures/README.md` line 45): "Let f be a normalized cuspidal eigenform of weight w≥2 on Gamma0(N), with trivial nebentypus and p not dividing N." **MIMC L2** (line 57): "For every residual character chi, the semisimplification of bar rho restricted to G_Qp is not chi ⊕ chi_cyc chi."
- **PadicFamilies.** `content/campaign/PadicFamilies/README.md`:
  - L1 (line 38) already constructs the ordinary two-variable measure: "Integrate universal characters against the universal ordinary symbol to obtain a cyclotomic measure with coefficients in the Hecke/period module." This is the Mazur–Kitagawa function. The packet `research/blueprint/packets/PadicFamilies.json` (checkpoint 5, 28 September) has nodes `PadicFamilies:L1/family-measure` and `L1/family-measure-specialisation` (Emerton–Pollack–Weston Prop. 4.1.4: specialisation at every classical height-one prime, possibly imprimitive).
  - L3 (lines 52–56) is the finite-slope family L-function with the Pollack–Stevens/Bellaïche critical results. Its packet nodes (`L3/two-variable-l-function`, `L3/secondary-l-functions`, …) are Bellaïche's critical-slope theory.
  - L4 (lines 58–64) constructs the ordinary big Galois representation with its local ordinary filtration.
  - No text or packet node mentions an exceptional zero, an L-invariant or Greenberg–Stevens.
- **DiophantineApproximationAndTranscendence DT.5** (`content/campaign/DiophantineApproximationAndTranscendence/README.md`): "**Construct and export.** Add Mahler functions, E/G-functions, algebraic independence and source-scoped functional-transcendence applications with explicit differential/difference equations. …" Inputs: DT.4 only; no consumers.
  - The DT packet (`research/blueprint/packets/DiophantineApproximationAndTranscendence.json`, 27 September) names the Barré-Sirieix–Diaz–Gramain–Philibert theorem only inside node `DT.5/nesterenko-theorem` (the complex case, "q or J(q) transcendental", as an input of Nesterenko's proof) and in a gap ("Nesterenko's theorem: no public proof"). It has no node for the theorem itself, and none for the p-adic (Manin) case.
- **GZ.9** is the only atlas mention of an exceptional-zero formula ("A multiplicative exceptional-zero formula is a separate construction …"), with no owner.
- **Libraries.** At Mathlib 082e2d3 and Tau Ceti f790474, a grep for `TatePeriod|tatePeriod|Tate period`, `TateCurve|Tate curve|Tate uniform`, `exceptional zero|trivialZero`, `Mahler.Manin|Barré` and `MainConjecture` finds nothing relevant. The matches for "trivial zero" are the Riemann/Hurwitz zeta trivial zeros in `Mathlib/NumberTheory/LSeries/`. The case-insensitive `Linvariant` matches are all `…WeylInvariant…` names.

**Checked at the source.** Skinner, *Multiplicative reduction and the cyclotomic main conjecture for GL2*, arXiv:1407.1093v1 (published Pacific J. Math. 283 (2016)):
- **Theorem A (p. 1–2).** p ≥ 3, f ∈ S_k(Γ0(N)) a newform ordinary at p, "(i) k ≡ 2 (mod p − 1); (ii) the reduction ρ̄_f … is irreducible; (iii) there exists a prime q ≠ p such that q ∥ N and ρ̄_f is ramified at q". Then Ch_L(f) = (L_f) in Λ_O. When p | N, ordinarity forces p ∥ N and k = 2.
- **§3.1 (pp. 18–20), the p | N proof.** For each m there is a newform f_m ∈ S_{k_m}(Γ0(M)), with N = pM, **k_m > 2** and k_m ≡ 2 mod (p − 1), such that f_m* ≡ f mod p^m and (L^Σ_f, p^m) = (L^Σ_{f_m}, p^m). Hida families supply f_m and the two-variable p-adic L-function supplies the congruence. The proof then compares Fitting ideals, using Greenberg's theorem that X^Σ has no nonzero finite Λ-submodule.
  - **So the p ∤ N seed is Theorem A itself in weights k_m > 2**, not a weight-two statement.
- **§2.2 (pp. 6–7).**
  - L(V_f) := −x⁻¹y, for 0 ≠ λ = xψ_cyc + yψ_ur in im(π_{V_f}).
  - Example: "L(V_f) = log_p q_E/ord_p(q_E). As the j-invariant j(q_E) = j(E) ∈ Q of E is algebraic, q_E is transcendental by a theorem of Barré-Sirieix, Diaz, Gramain, and Philibert [2], and so log_p q_E ≠ 0."
- **§2.4 (pp. 14–15).** "Greenberg and Stevens [11, Thm. 7.1] proved that L′_f(φ_0) … = (log_p u)⁻¹ L(V_f) L(f,1)/(−2πiΩ⁺_f)" (2.4.3); equivalently d/ds L_p(f,s)|_{s=1} = L(V_f)·L(f,1)/(−2πiΩ⁺_f) for L_p(f,s) = L_f(u^{s−1} − 1). This was conjectured by Mazur–Tate–Teitelbaum §13.
- **§3.2 (p. 20).**
  - Ch_L(f) = Ch_L(f)′·(γ − 1) exactly when α_p = 1 (split multiplicative reduction), and Ch_L(f) = Ch_L(f)′ otherwise.
  - (3.2.3) gives #Sel·#K = #O/((log_p u)⁻¹ L(V_f) L^alg(f,1)) when α_p = 1, and #O/((1 − α_p)² L^alg(f,1)) otherwise.
- **§3.3 (p. 25).** Theorem C (the elliptic-curve statement JSW 7.2.1(ii) cites) follows from Theorem B once L(V_f) ≠ 0 at split p and Ω_E is a Z_(p)^×-multiple of −2πiΩ⁺_f.

**Mathematics checked.**
- **At non-split multiplicative p**, α_p = −1 and (1 − α_p)² = 4, a p-adic unit for odd p. No exceptional zero occurs, so only (a) is needed.
- **At split p**, all three inputs are needed.
- **Why (c) gives L(V_f) ≠ 0.** With Iwasawa's branch (log_p p = 0), log_p q_E = 0 exactly when q_E/p^{ord_p q_E} is a root of unity, which would make q_E algebraic. The p-adic Mahler–Manin theorem (for q ∈ C_p with 0 < |q|_p < 1, q or J(q) is transcendental) excludes this, since J(q_E) = j(E) ∈ Q. ord_p q_E = −ord_p j(E) > 0, so L(V_f) is defined. The Tate period lies in Q_p only at split p, which is the only case where it is needed.
- **A concrete split test** (LMFDB, read 29 September 2026): the curve 14.a4, y² + xy + y = x³ − 11x + 12, has rank 0 and no 7-isogeny, so E[7] is irreducible.
  - It is split multiplicative at 7 and non-split multiplicative at 2 with ord_2 Δ = 1, so E[7] is ramified at 2.
  - It therefore satisfies Theorem A and Theorem C with p = 7 ∥ 14, q = 2, and it is an exceptional-zero case.

### Fix
1. **New stage `ModularIwasawaMainConjectures:L1m`.** In `content/campaign/ModularIwasawaMainConjectures/README.md`, insert before "## L2. Broader cohomological theorem (T2)" (occurs exactly once):
   ```markdown
   <a id="l1m"></a>
   ## L1m. Ordinary theorem at multiplicative p (Skinner Theorem A, p ∥ N)

   Prove Skinner's Theorem A (Pacific J. Math. 283 (2016); arXiv:1407.1093v1) in the case p | N: let p ≥ 3, let f ∈ S_2(Γ0(N)) be a newform with p ∥ N and a_p(f) = ±1 (ordinary at p), let ρ̄_f be irreducible, and let q ≠ p be a prime with q ∥ N at which ρ̄_f is ramified. Then X_{Q∞,L}(f) is Λ_O-torsion and Ch_L(f) = (L_f) in Λ_O, where L_f is the Mazur–Tate–Teitelbaum p-adic L-function of the p-new form (ModularSymbolsPadicLFunctions L2, "at p dividing the level use the actual Up eigenvalue") with the interpolation normalization of Skinner (2.4.1), including the factor (−2πi)^(m+1) (Skinner, footnote 6, corrects SU's (−2πi)^m).

   Follow Skinner §3.1: reduce to the Σ-imprimitive statement for any finite Σ ⊇ {ℓ | N} and to a finite extension of L; from PadicFamilies L1 take, for each m, the Hida-family member f_m ∈ S_(k_m)(Γ0(M)), N = pM, k_m > 2, k_m ≡ 2 mod (p−1), a_p(f_m) ∈ O^×, with T_f/p^m ≅ T_(f_m)/p^m compatibly with the ordinary filtrations, and the congruence (L^Σ_f, p^m) = (L^Σ_(f_m), p^m) from the two-variable function; apply L1's Skinner–Urban-form theorem to each f_m (its hypotheses pass to f_m because ρ̄ is unchanged and q ∥ M); use SelmerIwasawaCohomology L3's theorem that a torsion Σ-imprimitive Selmer dual has no nonzero finite Λ-submodule to replace characteristic ideals by Fitting ideals; conclude from (F^Σ_L(f), p^m) = (L^Σ_f, p^m) for all m and the non-vanishing of L^Σ_f. The seed is the all-weight Skinner–Urban form (k ≡ 2 mod p−1), not a weight-two statement and not FW Theorem 1.6, whose auxiliary-prime hypothesis is stronger.

   At split multiplicative p, L_f(φ_0) = 0 and the Selmer side has the matching factor (γ−1) (Skinner §3.2); record both, and do not divide either out in this layer.

   **Dependencies:** L0; L1 (Skinner–Urban-form target); PadicFamilies L1; ModularSymbolsPadicLFunctions L2; SelmerIwasawaCohomology L3.

   **Acceptance:** 14.a4 (y² + xy + y = x³ − 11x + 12) at p = 7, q = 2 (split at 7, E[7] irreducible, ord_2 Δ = 1): the hypotheses are verified from the curve's data, and the trivial zero L_f(φ_0) = 0 is exhibited. A non-split example is recorded with the unit factor (1 − a_p)² = 4.
   ```
   - **`data/atlas.json`.** Add the stage `ModularIwasawaMainConjectures:L1m` (title "Ordinary theorem at multiplicative p (Skinner Theorem A, p ∥ N)", sourceLine at the new heading).
     - `requires`: [MIMC:L0, MIMC:L1, PadicFamilies:L1, ModularSymbolsPadicLFunctions:L2, SelmerIwasawaCohomology:L3].
     - `consumers`: [MIMC:L5, RankZeroOneBSD:BSD.6].
     - Add the matching stageEdges records, and L1m to the `consumers` of each supplier.
   - **Cycle tests** for L0 → L1m, L1 → L1m, PadicFamilies:L1 → L1m, ModularSymbolsPadicLFunctions:L2 → L1m, SelmerIwasawaCohomology:L3 → L1m, L1m → MIMC:L5 and L1m → RankZeroOneBSD:BSD.6: all acyclic (L1m is new; no path BSD.6 → any supplier).
2. **Greenberg–Stevens, `content/campaign/PadicFamilies/README.md`.**
   - **L3.** After "Prove the Pollack–Stevens non-theta-critical and Bellaïche critical-point results by their respective arguments, with their local eigenvariety and multiplicity hypotheses." (occurs exactly once) insert:
     > At a weight-two newform f with p ∥ N and a_p(f) = 1 (split multiplicative), prove the Greenberg–Stevens exceptional-zero theorem (Invent. Math. 111 (1993), Thm. 7.1): L_f(φ_0) = 0 and d/ds L_p(f,s)|_(s=1) = L·L(f,1)/(−2πiΩ_f^+), with L_p(f,s) = L_f(u^(s−1) − 1), from the ordinary two-variable (Mazur–Kitagawa) function of L1 restricted to its weight-two slice and its functional equation. Record the variable normalization: in the Iwasawa variable the derivative carries (log_p u)^(−1) (Skinner (2.4.3)). Here L is the analytic L-invariant produced by the family (the logarithmic derivative of the U_p-eigenvalue along the family, in Greenberg–Stevens' normalization); its identification with the Galois-theoretic L-invariant is proved in L4.
   - **L4.** After "Derive the family reciprocity law rather than defining the family class by it." (occurs exactly once) insert:
     > For the ordinary family through a split multiplicative weight-two point, prove that the analytic L-invariant of L3's Greenberg–Stevens theorem equals the Galois-theoretic L-invariant L(V_f) = −x^(−1)y of the non-split extension 0 → L(1) → V_f → L → 0 (Skinner §2.2), and, for f attached to E/Q with Tate period q_E, that L(V_f) = log_p q_E/ord_p q_E (Kummer class of q_E; EllipticCurves Layer 4's Tate curve).
   - **`data/atlas.json`.** Add PadicFamilies:L3 and PadicFamilies:L4 to BSD.6's `requires`, with the matching consumers and stageEdges.
     - Cycle test for PadicFamilies:L3 → RankZeroOneBSD:BSD.6: acyclic (no path BSD.6 → L3).
     - Cycle test for PadicFamilies:L4 → RankZeroOneBSD:BSD.6: acyclic.
   - **Packet.** For the next PadicFamilies checkpoint, one node under L3 (Greenberg–Stevens Thm 7.1) and one under L4 (L-invariant comparison).
3. **Barré-Sirieix–Diaz–Gramain–Philibert, `content/campaign/DiophantineApproximationAndTranscendence/README.md`, DT.5.**
   - Replace "**Construct and export.** Add Mahler functions, E/G-functions, algebraic independence and source-scoped functional-transcendence applications with explicit differential/difference equations. Coordinate period statements with PS and unlikely intersections with RP." (occurs exactly once) with:
     > **Construct and export.** Add Mahler functions, E/G-functions, algebraic independence and source-scoped functional-transcendence applications with explicit differential/difference equations. Prove the Barré-Sirieix–Diaz–Gramain–Philibert theorem (Invent. Math. 124 (1996), 1–9, "Une preuve de la conjecture de Mahler–Manin") in both its complex and its p-adic form: for q ∈ C (resp. C_p) with 0 < |q| < 1, at least one of q and J(q) is transcendental, where J is the modular invariant as a q-series with integer coefficients. Export the corollary that the Tate period q_E ∈ Q_p of an elliptic curve over Q with split multiplicative reduction at p is transcendental, hence log_p q_E ≠ 0 for Iwasawa's branch, to RankZeroOneBSD BSD.6. Coordinate period statements with PS and unlikely intersections with RP.
   - Replace "**Inputs.** `DiophantineApproximationAndTranscendence:DT.4`" (occurs exactly once) with "**Inputs.** `DiophantineApproximationAndTranscendence:DT.4`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv` (the q-expansion of j and the Tate curve)".
   - **`data/atlas.json`.** Add the Tau Ceti Layer 4 id to DT.5's `requires`, and add DT.5 to BSD.6's `requires`, with the matching consumers and stageEdges.
     - Cycle test for the Layer 4 edge → DT.5: acyclic (an upstream layer).
     - Cycle test for DiophantineApproximationAndTranscendence:DT.5 → RankZeroOneBSD:BSD.6: acyclic.
   - **DT packet** (`research/blueprint/packets/DiophantineApproximationAndTranscendence.json`, next checkpoint): add a node `DT.5/barre-sirieix-diaz-gramain-philibert` with both cases, and point `DT.5/nesterenko-theorem`'s proof step at it.
4. **BSD.6, `content/campaign/RankZeroOneBSD/README.md` line 85.** Replace the bullet quoted above (occurs exactly once) with the text given in /14, Fix 3. It carries this finding's split/non-split branch and names L1m, PadicFamilies L3/L4 and DT.5.
   - After "The exact p=3 source upgrade beyond the specified branch requires its own verified theorem, not a comment that p≥5 “should” be unnecessary." (occurs exactly once) insert a BSD.6-only dependency line:
     > **Dependencies (BSD.6):** BSD.5, BSD.6a; HeegnerPointEulerSystems HE.6, HE.8b; ModularIwasawaMainConjectures L1 (Skinner–Urban form) and L1m; PadicFamilies L3–L4 (split multiplicative p); DiophantineApproximationAndTranscendence DT.5 (split multiplicative p); GrossZagierAndArithmeticHeights GZ.0; EllipticCurves Layers 4–7.
   - (This also gives BSD.6 the separate dependency record that /13 asks for.)
5. **Interim restriction.** Apply it only if 1–3 are not applied together with 4: until L1m, the PadicFamilies targets and the DT.5 target exist, the BSD.6 bullet reads "p odd of good ordinary reduction" and the multiplicative case is recorded as a gap in BSD.8's exceptional-prime list.

### Not done, and why
- **The owner of Greenberg–Stevens is split.** The finding puts the whole theorem in PadicFamilies L3. The comparison of the family L-invariant with log_p q_E/ord_p q_E needs the big Galois representation and its ordinary filtration, which L4 owns, so that comparison goes to L4. L3 is also the finite-slope/critical layer. The ordinary two-variable function itself is already L1's measure, so no new two-variable construction is planned.
- **Greenberg–Stevens was not read** (Invent. Math., subscription only). Their Theorem 7.1 is quoted from Skinner §2.4. Its internal normalization (the analytic L-invariant as −2 times the derivative of a_p along the family, and GS's own Galois comparison) is for the PadicFamilies blueprint job to fix against the paper.
- **BDGP was not read** (Invent. Math., subscription only). The statement is Waldschmidt's (PAMQ 2 (2006), p. 443) and Skinner's (§2.2), and the paper's title names the Mahler–Manin conjecture. The p-adic case is Manin's.
- **Period comparison.** Skinner §3.3 compares Ω_E with −2πiΩ⁺_f through an optimal parametrization, which is the Manin-constant question of /17 (another section of this report); it is not repeated here.

## /5 (high, missing): the Eisenstein branch imports elliptic units and Rubin's main conjecture from the accepted Part II CMAllPrimeMainConjectures, Hida's μ = 0 from L3h, Hida–Tilouine from /26's layer, and Wüthrich's integral divisibility from a new KatoEulerSystems L4 node

### What the verifier corrected
- **Confirmed, with one correction to the reasoning.** BSD.7a's `requires` are wider than the eight stages the finding lists: they also include BSD.5, BSD.1, GZ.0 and four Tau Ceti EllipticCurves layers.
- **The correction does not touch the substance.** None of those stages contains:
  - Rubin's main conjecture for imaginary quadratic fields;
  - the Hida–Tilouine anticyclotomic main conjecture;
  - Hida's vanishing of the anticyclotomic μ;
  - Wüthrich's integral form of Kato's divisibility.
- No atlas stage plans any of them, so the Eisenstein branch has no supplier.

### State on main (45d60f04)
- **BSD.7a's `requires`** in the assembled atlas: ES.4, ES.8, GZ.9, HE.8, KatoEulerSystems L4, MIMC L0, PadicHodgeRegulators L3, SelmerIwasawaCohomology L3, BSD.5, BSD.1, GZ.0 and Tau Ceti EllipticCurves Layers 4, 5, 6 and 7. That is the verifier's list.
  - The README's Dependencies line (`content/campaign/RankZeroOneBSD/README.md` line 119) reads: "**Dependencies:** BSD.5; HeegnerPointEulerSystems HE.8; GrossZagierAndArithmeticHeights GZ.9; ModularIwasawaMainConjectures; SelmerIwasawaCohomology; PadicFamilies; EulerSystemsAndKolyvaginSystems ES.4 and ES.8."
  - The BSD.7a text (line 117) imports "generic formulations from ModularIwasawaMainConjectures L0, SelmerIwasawaCohomology, PadicHodgeRegulators, and HE.8's actual anticyclotomic classes". It names no source for the Rubin, Hida–Tilouine, Hida or Wüthrich inputs.
- **KatoEulerSystems L4** (`content/campaign/KatoEulerSystems/README.md`): "Keep rational and integral statements separate, including possible powers of p in the latter when the large-image hypothesis is unavailable." Neither its integrated decomposition (`data/decompositions/KatoEulerSystems.json`, five L4 nodes) nor its packet (`research/blueprint/packets/KatoEulerSystems.json`, 24 September) has a node for the reducible-residual (Eisenstein) integral case.
- **What the red team and the verifier missed: two accepted paper routes already assign most of these inputs.**
  - **PAPER-BURUNGALE-TIAN-26, route 7** (`part-ii`, parent ModularIwasawaMainConjectures, roadmap `CMAllPrimeMainConjectures`, verdict accept on 22 September).
    - Its review says: "no layer plans elliptic units, the imaginary-quadratic main conjecture or Kato's §15 descent (the HE.7s stage records Rubin's elliptic-unit route as unresolved)".
    - Its brief puts "the elliptic-unit and tower-module foundations in an early layer that does not depend on the rational main conjecture … its consumers are the BKO designs (#1689, #1690) and HeegnerPointEulerSystems HE.7s, which needs Rubin 1987's elliptic-unit route. Then add an integral layer … JLK §5.4's classical form … for p ∤ #Δ, which is Rubin 1991 (i) … For p split, the same layer proves the Coleman-map/Katz form, Rubin 1991 (ii), including the anticyclotomic θ-components … Consumers of the integral layer: InertAnticyclotomicCMMainConjecture … and RankZeroOneBSD BSD.7a (PAPER-CASTELLA-ETAL-22 item 9). Neither the elliptic-unit layer nor the integral layer may depend, directly or transitively, on ModularIwasawaMainConjectures L6 or RankZeroOneBSD BSD.7a".
    - The design job is `DESIGN-CMAllPrimeMainConjectures` (issue #1884), still pending.
  - **PAPER-CASTELLA-ETAL-22** (CGLS, Invent. Math. 227 (2022)), accepted 23 September.
    - Route 8 sends item 9 (Rubin's theorem: char_Λ((𝒳_∞)^θ) is generated by the anticyclotomic θ-projection of the Katz p-adic L-function) to that same Part II.
    - Route 6 sends item 10, "Hida: μ = 0 for anticyclotomic Katz p-adic L-functions", to AutomorphicPadicLFunctions L3h, with reason "L3h owns the anticyclotomic μ = 0 theorems".
  - **So the elliptic units, Rubin 1991/1994 and the HE.7s consumer already have an owner** (a queued design, not yet in the atlas), and Hida's μ = 0 has an accepted owner stage.
    - What is still unowned is the Hida–Tilouine theorem and Wüthrich's integrality.
    - What is still missing is the graph: L3h is not an ancestor of BSD.7a (no path either way in the assembled graph).
- **Disclosure.** This session's extraction PAPER-KOLYVAGIN-90 has the item `r0-rubin-elliptic-units` (status missing, note "No atlas stage found that plans elliptic units or a CM-curve Euler system"), which is evidence of the same gap. Its route 5 targets BSD.5/BSD.9, not BSD.7a. The fix below follows the verifier and the two accepted routes, not that extraction.
- **Libraries.** At Mathlib 082e2d3 and Tau Ceti f790474, `ellipticUnit|EllipticUnit|elliptic unit` and `MainConjecture` have no matches. The `Iwasawa` matches are Mathlib's Iwasawa-algebra measure file and Iwasawa's criterion for simple groups.

**Checked at the sources** (read 29 September 2026):
- **CGS, arXiv:2303.04373v2 (Castella–Grossi–Skinner, *Mazur's main conjecture at Eisenstein primes*).**
  - Proof of Lemma 2.4.4 (p. 9): "By [HT94, Thm. 0.3] and Rubin's proof of the Iwasawa main conjecture for K, [Rub91], one has that such divisibility holds up to powers of the augmentation ideal (γ_v − 1)". The divisibility in question is H_g^cusp | h_K · L_v(K)^−, for the congruence ideal of the CM Hida family g.
  - Theorem 2.1.1 (p. 6): "The integrality of L^MSD_p(E/Q) is shown in [GV00, Prop. 3.7] in the case where E[p] is irreducible … and in [Wut14, Cor. 18] in the reducible case … Wüthrich shows the existence of an elliptic curve E_• /Q in the isogeny class of E with L^MSD_p(E_•/Q) ∈ Λ_Q and whose p-adic Tate module satisfies T_pE_• ≃ V_Zp(f)(1) … Building on the theorem of Ferrero–Washington [FW79], Kato's divisibility … for E_• … [Kat04, Thm. 12.5(4)] is shown to be integral".
  - [Wut14] is Wüthrich, *On the integrality of modular symbols and Kato's Euler system for elliptic curves*, Doc. Math. 19 (2014), 381–402.
- **Keller–Yin, arXiv:2402.12781v2, Theorem 1.2.2 and proof (pp. 13–14):** "The first part … is essentially proved in [Rub91] (with [Rub94] to remove the assumption on h_K) … That µ-invariants is 0 follows from the vanishing result of [Hid10] and the Iwasawa Main Conjectures in [Rub91] together with [CW78] (or more generally, [dS87, III.1.10] …)". [Hid10] is Hida, *The Iwasawa µ-invariant of p-adic Hecke L-functions*, Ann. of Math. 172 (2010).
- Rubin 1991, Hida–Tilouine 1994, Hida 2010 and Wüthrich 2014 were **not read** (subscription only, or not located in a public copy in this pass). Their use is recorded as CGS and Keller–Yin state it.

**Mathematics checked.** Each input is used where the finding places it.
- **Rubin's two-variable main conjecture for K, with p split and its anticyclotomic θ-projection,** identifies the characteristic ideal of the θ-part of the unramified-outside-v Iwasawa module with the Katz p-adic L-function. CGS and Keller–Yin use it for the residual characters φ, ψ of E[p]^ss.
- **Hida–Tilouine's anticyclotomic main conjecture for the CM field K** bounds the congruence ideal of the CM Hida family by the anticyclotomic Katz L-function. CGS combine it with Rubin to prove Lemma 2.4.4's integrality.
- **Hida's μ = 0** is an analytic statement about the anticyclotomic Katz L-function. Its natural owner is the layer that owns Hsieh's μ theorem (L3h), as CGLS route 6 decided.
- **Wüthrich's result** is an integral refinement of Kato's divisibility for a distinguished curve E_• in the isogeny class, with Ferrero–Washington as its input. It belongs beside Kato's rational divisibility in KatoEulerSystems L4.

### Fix
1. **No new roadmap.** The finding proposes "Elliptic units and the Iwasawa main conjectures for imaginary quadratic fields". That would duplicate the accepted Part II `CMAllPrimeMainConjectures` (PAPER-BURUNGALE-TIAN-26 route 7, with CGLS22 route 8). The Part II already owns:
   - elliptic units and their Euler system;
   - Rubin 1991 (i)/(ii) integrally, with the anticyclotomic θ-components;
   - Kato's elliptic-unit reciprocity;
   - consumers BSD.7a and HE.7s.
   - Its brief already imports Katz from AutomorphicPadicLFunctions L3 and CM.1–CM.4 from ComplexMultiplicationAndExplicitReciprocity.
   - **Note for the maintainer:** when DESIGN-CMAllPrimeMainConjectures (#1884) is claimed, make its integral layer's export include Rubin 1994's removal of the h_K hypothesis, which Keller–Yin cite. Give it the atlas links integral layer → RankZeroOneBSD:BSD.7a and elliptic-unit layer → HeegnerPointEulerSystems:HE.7s when the roadmap is promoted.
   - The brief already forbids the reverse dependence (no path from BSD.7a or MIMC L6 into either layer), so both links will be acyclic.
2. **Hida's μ = 0 → BSD.7a.**
   - **`data/atlas.json`:** add `AutomorphicPadicLFunctions:L3h` to BSD.7a's `requires`, BSD.7a to L3h's `consumers`, and the stageEdges record.
   - Cycle test for AutomorphicPadicLFunctions:L3h → RankZeroOneBSD:BSD.7a: acyclic (no path BSD.7a → L3h).
   - L3h already owns the theorem through the accepted CGLS22 route 6. If /7's mod-p layer (proposed as L3m) is added, it feeds L3h, not BSD.7a directly.
3. **Hida–Tilouine → BSD.7a.** The anticyclotomic main conjecture for CM fields (Hida–Tilouine, Invent. Math. 117 (1994), Thm 0.3, as CGS use it) has one owner: the AutomorphicCongruences layer that /26 of this report adds for CLW's integrality. The same theorem is used there for the same purpose, the congruence ideal of a CM Hida family.
   - Add that layer → RankZeroOneBSD:BSD.7a (`requires`, `consumers` and stageEdges).
   - Cycle test (with a placeholder id for the new layer): acyclic, since the layer is new and its inputs (AC L0/L2s, APL L3) are not descendants of BSD.7a.
4. **Wüthrich's integral divisibility, `content/campaign/KatoEulerSystems/README.md`, L4.** Replace "Keep rational and integral statements separate, including possible powers of p in the latter when the large-image hypothesis is unavailable." (occurs exactly once) with:
   > Keep rational and integral statements separate, including possible powers of p in the latter when the large-image hypothesis is unavailable. For E/Q with E[p] reducible (the Eisenstein case), prove Wüthrich's integral form (Doc. Math. 19 (2014), Cor. 18, as used in Castella–Grossi–Skinner Thm 2.1.1): there is a curve E_• in the isogeny class of E with T_pE_• ≅ V_(Z_p)(f)(1), Kato's lattice, for which the Mazur–Swinnerton-Dyer p-adic L-function is integral and Kato's divisibility [Kato, Thm. 12.5(4)] holds in Λ, using the Ferrero–Washington theorem from IntegralIwasawaTheory L4; transfer the integral p-adic L-function to every curve in the isogeny class by the isogeny invariance of the main conjecture. State Wüthrich's exact hypotheses on p and on the reduction at p from his paper.
   - **`data/atlas.json`:** add `IntegralIwasawaTheory:L4` to KatoEulerSystems L4's `requires`, with the matching consumers and stageEdges record.
     - Cycle test for IntegralIwasawaTheory:L4 → KatoEulerSystems:L4: acyclic.
     - It is currently transitive through EulerSystemsCyclotomicMainConjecture L2 → KES L4, an edge /36 of this report proposes to drop, so the direct edge is needed.
   - **Packet (KatoEulerSystems blueprint job):** a node `KatoEulerSystems:L4/wuthrich-integral-divisibility-at-eisenstein-primes` with the statement above.
5. **BSD.7a text, `content/campaign/RankZeroOneBSD/README.md`.**
   - After "Import generic formulations from ModularIwasawaMainConjectures L0, SelmerIwasawaCohomology, PadicHodgeRegulators, and HE.8's actual anticyclotomic classes; the irreducible cyclotomic theorem in L3 is not an Eisenstein supplier." (occurs exactly once) insert:
     > The character-side inputs are imported, not re-proved: Rubin's two-variable main conjecture for the auxiliary imaginary quadratic K (p split; Rubin 1991, with Rubin 1994 removing the h_K hypothesis), with its anticyclotomic θ-projections, and the elliptic units behind it, from the integral layer of the Part II CMAllPrimeMainConjectures; Hida's vanishing of μ for anticyclotomic Katz p-adic L-functions (Ann. of Math. 172 (2010)) from AutomorphicPadicLFunctions L3h; the Hida–Tilouine anticyclotomic main conjecture for CM fields (Invent. Math. 117 (1994), Thm 0.3), used for the congruence ideal of the CM Hida family in CGS Lemma 2.4.4, from its AutomorphicCongruences owner; and Wüthrich's integral form of Kato's divisibility for the distinguished curve E_• from KatoEulerSystems L4.
   - Replace the Dependencies line "**Dependencies:** BSD.5; HeegnerPointEulerSystems HE.8; GrossZagierAndArithmeticHeights GZ.9; ModularIwasawaMainConjectures; SelmerIwasawaCohomology; PadicFamilies; EulerSystemsAndKolyvaginSystems ES.4 and ES.8." (occurs exactly once) with:
     > **Dependencies:** BSD.5; HeegnerPointEulerSystems HE.8; GrossZagierAndArithmeticHeights GZ.9; ModularIwasawaMainConjectures; SelmerIwasawaCohomology; PadicFamilies; EulerSystemsAndKolyvaginSystems ES.4 and ES.8; KatoEulerSystems L4 (with Wüthrich's integral divisibility); AutomorphicPadicLFunctions L3h (Hida's anticyclotomic μ = 0); the AutomorphicCongruences Hida–Tilouine layer; and, once designed, the integral layer of CMAllPrimeMainConjectures (Rubin's main conjecture for K).
6. **HE.7s needs no edit here.** The Part II brief already names HE.7s as a consumer of the elliptic-unit layer. HE.7s's sentence "Its elliptic-unit route is not supplied by the cyclotomic unit roadmap." (occurs exactly once) may gain " It is supplied by the elliptic-unit layer of the Part II CMAllPrimeMainConjectures (PAPER-BURUNGALE-TIAN-26 route 7)." once that layer exists.

### Not done, and why
- **No new roadmap** (see Fix 1). If the maintainer prefers the finding's standalone roadmap, it must replace route 7's Part II, not sit beside it. The review of PAPER-BURUNGALE-TIAN-26 already asks for one owner of the elliptic-unit foundations shared with the BKO designs #1689 and #1690.
- **The atlas link to the Part II is deferred.** It waits on DESIGN-CMAllPrimeMainConjectures (#1884); no atlas id exists yet.
- **Wüthrich's hypotheses are not stated.** Their exact restriction on p and on the reduction type is left to the KatoEulerSystems blueprint job, because the paper was not read here.

## /6 (high, error): AC L1, L2, L2s and L5w import the unitary Galois representations from AG2.6, and the CAP-exclusion inputs are named

### What the verifier corrected
- Confirmed without correction. The verifier recomputed the graph three ways (raw atlas, with accepted restructurings, with accepted link maps). In each one the only `AutomorphicGaloisRepresentationsPartII` ancestors of AC `L1`, `L2`, `L2s` and `L5w` are `AG2.0` and `AG2.1a`.
- The confirmed scope: all three unitary routes (SU's GU(2,2), FW's and CLW's U(3,1), Wan 2015's GU(2,2) over a totally real field) argue with the Galois representations of regular-weight cusp forms and their pseudo-characters in families, with local–global compatibility at p. The owners of those representations (AG2.2, AG2.5, AG2.6) reach none of these stages. L1's text asks for the representation to be "established" there.

### State on main (45d60f04)
- **`content/campaign/AutomorphicCongruences/README.md`** is unchanged since 15 September (commit 0dc5f1fe). L1, line 30: "Establish the congruence with cusp forms and the associated Galois representation/extension." L2, L2s and L5w (lines 36–46, 72) name no Galois-representation supplier. AC has no `**Dependencies:**` lines; its roadmap-level line 10 is "**Campaign dependencies:** [IntegralHeckeAndGaloisDeterminants](…), [AutomorphicPadicLFunctions](…), [KatoEulerSystems](…), [SmoothRepresentationsOfLocalGroups](…), [PadicLocalLanglandsForGL2Qp](…)."
- **Assembled graph** (scripts/build.py at 45d60f04: 2840 stages, 7792 stage edges). Requires:
  - `L1`: L0, APL:L4, PadicFamilies:L1, ModularSymbolsPadicLFunctions L0–L2, Tau Ceti ModularForms layer 8, AutomorphicBundles B2/B3/B5, IG.1, PELModuli M5, ShimuraCompactifications C2/C5.
  - `L2`: L1, APL:L3h, APL:L4e, GH.8, KatoEulerSystems:L3, PadicFamilies:L4, OrdinaryAutomorphicFormsAndModularityLifting:R21.3.
  - `L2s`: L0, APL:L4e, MP.6, PadicFamilies:L0a.
  - `L5w`: L0, APL:L3, PadicFamilies:L5 (plus B5, DirichletPadicLFunctions L1/L2/L4, IG.1, V5 from restructurings).
  - AG2.6 is an ancestor of none of the four. AG2.2 → AG2.3 → AG2.5 → AG2.6 is a chain (AG2.3 requires AG2.2; AG2.5 requires AG2.3; AG2.6 requires AG2.5), so AG2.6 is the tip that carries all three.
- **AG2 stage texts** (`content/campaign/AutomorphicGaloisRepresentationsPartII/README.md`): AG2.2 (line 47) "identify the direct sum attached to a cohomological unitary automorphic representation with the required degree-2n Hecke polynomial"; AG2.6 (line 83) "Prove de Rham, crystalline at the stated unramified places and semistable/Iwahori variants". AG2.7 (the export package) is consumed only by PotentialAutomorphyInfrastructure PA.0.
- **Pending proposals.** RS-11 (AC/MIMC, no review) keeps AC L1, L2, L2s and L5w and adds no AG2 edge. RS-21 (no review) does not touch these stages. No AC packet or decomposition exists. The AC library audit is AUDIT-23, merged in `data/library-coverage.json`; its L1 target 4 reads "The congruence with cusp forms and the associated Galois representation/extension, giving the Selmer lower bound through L0".
- **Libraries.** No declaration mentions Klingen families, CAP representations or Galois representations of unitary groups at Mathlib 082e2d3 or Tau Ceti f790474 (searches for `Klingen`, `CAP`, `unitary` together with `galoisRep`, in the trees and in declarations.tsv: no hits).
- **Sources read for this fix** (29 September 2026):
  - SU, author copy (page numbers as printed in it), §7.1, p. 99–100, Theorem 7.1.1: for π on G_n = GU(n,n) with regular k*, "a continuous representation R_p(π): G_K → GL_2n(L)" with (i) polarization, (ii) unramified outside S_π with the base-change Hecke polynomial, (iii) Hodge–Tate weights κ_i, "(iv) If π_p is unramified, then R_p(π)|G_K,v0 is crystalline". Lemma 7.1.2 derives the ordinary (triangular) shape from (iv) and weak admissibility; it needs no separate ordinary local–global theorem.
  - SU §7.3, pp. 103–104: the 4-dimensional family pseudo-character; if it decomposes, "we will show that π_x is a CAP representation … However, if x is chosen to have sufficiently regular weight … then π_x is not CAP by a result of Harris [Ha84, Theorem 2.5.6]". The 2-dimensional constituent is shown to descend to G_Q (the obstruction in H²(Gal(K/Q), 1 + M_2(P)) vanishes since p is odd) and to be modular "from the modularity results in [Wi95, TW95, Di96, SW99]".
  - FW arXiv:2107.13726v3, proof of Theorem 7.32, pp. 96–97: "let R be the four dimensional Λ̃-valued pseudo-character of G_K corresponding to the space of semi-ordinary cuspidal families on U(3,1)"; the 2-dimensional constituent at a point of weight a2 − a3 ≫ 0, a3 + b1 ≫ 0 "is modular by the modularity lifting result of Pan in [95, Theorem 1.0.4] … These imply that R_x is CAP … contradicting the result of [51, Theorem 2.5.6]", where [51] is Harris, *Eisenstein series on Shimura varieties*, Ann. of Math. 119 (1984).
  - CLW arXiv:2109.08375v1, proof of Theorem 8.2.1, pp. 79–80: the pseudo-representation "as in [SU14, Proposition 7.2.1]"; ordinary branch "By the argument in [SU14, Theorem 7.5], we know that ρ′_{3,x} is modular and Π is CAP"; non-ordinary branch: Π_p is unramified, "It follows that ρ_Π|G_K,p is crystalline", ρ̄_{3,x} is not induced from Q(√p*), "Thus, we can apply [Kis09], we deduce that ρ′_{3,x} is modular"; both branches end with "[Har84, Theorem 2.5.6]" and the weight (0,0,t⁺;t⁻), 0 ≫ t⁺ ≫ −t⁻.
- **What this adds to the finding.** The CAP-exclusion step is also in L1 (SU §7.3), not only L2/L2s. The three routes use different GL₂ modularity theorems: nearly-ordinary lifting (SU), Pan's Theorem 1.0.4 (FW), and Kisin 2009 plus the SU ordinary argument (CLW). In each case the 2-dimensional constituent is residually a twist of ρ̄_f, so only residually modular lifting is needed.

### Fix

1. **Stage edges.** Add `AutomorphicGaloisRepresentationsPartII:AG2.6` to the `requires` of AC `L1`, `L2`, `L2s` and `L5w`, those four to AG2.6's `consumers`, and the four stageEdges records `{"source": "AutomorphicGaloisRepresentationsPartII:AG2.6", "target": "AutomorphicCongruences:<L1|L2|L2s|L5w>"}`.
   - AG2.2 and AG2.5 then become ancestors through AG2.2 → AG2.3 → AG2.5 → AG2.6. The finding's nine direct edges (AG2.2, AG2.5, AG2.6 into each of three stages) are replaced by these four, which give the same ancestry; the texts below still name all three stages.
   - `L2` gets its own edge although L1 → L2 exists, because /22 re-examines that edge.
   - Cycle test for AG2.6 → L1, L2, L2s, L5w: acyclic (no path from any of the four to AG2.6 in the assembled graph).
2. **GL₂ modularity edges** (the finding's "requests from L2/L2s", extended to L1, which uses the same step):
   - `GL2ModularityLifting:R22.5` → `AutomorphicCongruences:L1` and → `AutomorphicCongruences:L2s` (ordinary and finite-flat/Barsotti–Tate lifting under residual modularity: SU's nearly-ordinary branch; CLW's Kisin 2009 branch and its SU-type ordinary branch).
   - `GL2ModularityLifting:R32.2` → `AutomorphicCongruences:L2` (regular de Rham lifting for residually modular ρ̄, the branch of Pan's Theorem 1.0.4 that FW's application uses, since the residual representation is a twist of ρ̄_f, which FW assume absolutely irreducible). R32.1 records Pan's combined statement.
   - R22.5 is already an ancestor of L2 by an incidental path (R22.5 → R22.6 → R27.6 → R29.3 → R29.4 → HE.1 → L3h → L2), which carries Heegner material, not this import. It is not an ancestor of L1 or L2s. R32.2 is an ancestor of none.
   - Cycle tests: R22.5 → L1, R22.5 → L2s, R32.2 → L2: acyclic.
3. **README, AC L1.** Replace "Establish the congruence with cusp forms and the associated Galois representation/extension." (occurs once; checked by script) with:
   > Establish the congruence with cusp forms. Import the Galois representation of each regular-weight cuspidal representation of GU(2,2) from AutomorphicGaloisRepresentationsPartII AG2.2 (the unitary discrete-parameter system and its Hecke polynomial), AG2.5 (local–global compatibility away from p) and AG2.6 (crystalline at p when π_p is unramified), as in SU Theorem 7.1.1, passing from GU(2,2) to a U(2,2) constituent and its base change as SU §7.1 does. Derive the ordinary triangular shape at p from crystallinity and weak admissibility (SU Lemma 7.1.2), and interpolate the traces over the ordinary Hecke algebra as a pseudo-character (SU Proposition 7.2.1), with the pseudo-representation formalism of IntegralHeckeAndGaloisDeterminants. Construct the extension class through L0. For the case in which the family pseudo-character decomposes, prove SU §7.3's argument: a twist of the two-dimensional constituent descends to G_Q, it is modular by the nearly-ordinary lifting theorems imported from GL2ModularityLifting R22.5 (residual modularity holds because the constituent is congruent to a twist of ρ̄_f), so the specialization is CAP, which is excluded at sufficiently regular weight by Harris 1984, Theorem 2.5.6 (see the request below). Do not construct a second Galois representation here.
4. **README, AC L2.** After "L2 imports the finite-slope Klingen construction from AutomorphicPadicLFunctions L4e (Eischen–Wan), and Hsieh's μ/nonvanishing theorem from L3h." (once) insert:
   > It imports the Galois representations of regular-weight cuspidal representations of U(3,1) and their local–global compatibility from AutomorphicGaloisRepresentationsPartII AG2.2, AG2.5 and AG2.6 (crystalline at p where Π_p is unramified), and their interpolation over the semi-ordinary cuspidal Hecke algebra as a four-dimensional pseudo-character. In the proof of FW Theorem 7.32 the case of a decomposing pseudo-character is excluded by SU §7.3's descent argument (imported through L1), Pan's Theorem 1.0.4 in the residually modular branch owned by GL2ModularityLifting R32.2, and Harris 1984, Theorem 2.5.6, at a point of weight a₂ − a₃ ≫ 0 and a₃ + b₁ ≫ 0 (FW pp. 96–97).
5. **README, AC L2s.** After "Reuse L0's extension algebra and AutomorphicPadicLFunctions L4e's doubling construction, with explicit comparison maps, rather than duplicate them." (once) insert:
   > Import the U(3,1) Galois representations and their local–global compatibility from AutomorphicGaloisRepresentationsPartII AG2.2, AG2.5 and AG2.6; the pseudo-representation is formed as in SU Proposition 7.2.1. Property (9) of the lattice construction (CLW pp. 79–80) is proved here in both branches: if π is ordinary, by SU §7.3's argument with the ordinary lifting theorem of GL2ModularityLifting R22.5; if not, by showing that Π_p is unramified, so ρ_Π|G_K,p is crystalline (AG2.6), checking that ρ̄ is not induced from Q(√p*), and applying Kisin's Barsotti–Tate lifting theorem (R22.5). In both branches the resulting CAP specialization is excluded at weight (0,0,t⁺;t⁻) with 0 ≫ t⁺ ≫ −t⁻ by Harris 1984, Theorem 2.5.6.
6. **README, AC L5w.** After "Generic deformation/patching is imported from its canonical owners; the minimal local type and freeness proof for this source is owned here." (once) insert:
   > The Galois representations of the regular-weight GU(2,2) cusp forms over the CM field M, with local–global compatibility and crystallinity at the places above p, are imported from AutomorphicGaloisRepresentationsPartII AG2.2, AG2.5 and AG2.6; record which regular-weight and ordinary specializations Wan 2015's lattice construction uses.
7. **README, AC line 10 (roadmap prerequisites).** Replace the line (once) with:
   > **Campaign dependencies:** [IntegralHeckeAndGaloisDeterminants](../IntegralHeckeAndGaloisDeterminants/README.md), [AutomorphicPadicLFunctions](../AutomorphicPadicLFunctions/README.md), [KatoEulerSystems](../KatoEulerSystems/README.md), [SmoothRepresentationsOfLocalGroups](../SmoothRepresentationsOfLocalGroups/README.md), [PadicLocalLanglandsForGL2Qp](../PadicLocalLanglandsForGL2Qp/README.md), [AutomorphicGaloisRepresentationsPartII](../AutomorphicGaloisRepresentationsPartII/README.md), [GL2ModularityLifting](../GL2ModularityLifting/README.md), [CompletedCohomologyAndLocalGlobalCompatibility](../CompletedCohomologyAndLocalGlobalCompatibility/README.md), [PadicHodgeRegulators](../PadicHodgeRegulators/README.md).

   The last two entries carry /28 and /27; this is the one edit of the line for all three findings.
8. **Request, for the AC blueprint packet** (from L1, L2 and L2s; there is no AC packet yet):
   - supplier: to be chosen by the maintainer. The natural owner is AutomorphicBundles, whose B5 (holomorphic forms and Fourier–Jacobi expansions on the unitary Shimura varieties) is already an ancestor of L1, L2, L2s and L5w, so no new edge is needed. The alternative is a named target in AC L0.
   - need: "Harris, Eisenstein series on Shimura varieties, Ann. of Math. 119 (1984) 59–94, Theorem 2.5.6, in the form the three routes use: a cuspidal representation of GU(2,2) (SU p. 104, sufficiently regular weight) or U(3,1) (FW p. 97, a₂ − a₃ ≫ 0 and a₃ + b₁ ≫ 0; CLW p. 80, weight (0,0,t⁺;t⁻) with 0 ≫ t⁺ ≫ −t⁻) contributing to the relevant holomorphic families is not CAP, i.e. does not share its Hecke eigenvalues with a Klingen-type Eisenstein series."
   - The theorem's exact statement is not available to this fix (the paper is not public); the need is phrased from the three citations.
9. **Library audit AUDIT-23** (merged; the orchestrator applies audit edits). AC L1 target 4 becomes "The congruence with cusp forms, with the Galois representation imported from AG2.2/AG2.5/AG2.6 and the extension class through L0; the CAP exclusion of SU §7.3". Status stays not built.

### Not done, and why
- **Edges from AG2.2 and AG2.5 directly** are not added. They would duplicate the ancestry that AG2.6 already carries (AG2.2 → AG2.3 → AG2.5 → AG2.6).
- **No edge from AG2.7** (the integral/residual export package). The routes need characteristic-zero representations, local–global compatibility and pseudo-characters, which AG2.6 and IntegralHeckeAndGaloisDeterminants supply. Lattices are chosen in L0.
- **Harris 1984** is not assigned an owner: it needs the maintainer's choice, and its statement has not been read.

## /7 (high, missing): a new AutomorphicPadicLFunctions:L3m owns the mod-p nonvanishing theorems and Hida's CM-point inputs, feeding L3h, AC L1 and AC L2s

### What the verifier corrected
- Confirmed without correction. No atlas stage plans the mod-p nonvanishing theorems for anticyclotomic L-values, or Hida's density and linear-independence results behind them, and neither library has them.
- Three planned targets need them: L3h (Hsieh's Theorems B and C), AC L1 (Skinner–Urban's nonvanishing of Klingen–Eisenstein coefficients, via Vatsal and Finis) and AC L2s (CLW §5.6, via Hsieh 2012).

### State on main (45d60f04)
- **L3h's text is unchanged since 15 September.** `content/campaign/AutomorphicPadicLFunctions/README.md` line 60: "Prove the CM-integrality criterion and Theorem B's μ=0 with its additional p unramified in F, …. Prove Theorem C under its separate conductor conditions; distinguish all but finitely many characters in local degree one from a Zariski-dense set in higher dimension. … Assuming μ=0 is not a substitute for its proof." It names no input of those proofs.
- **AC L1** (`content/campaign/AutomorphicCongruences/README.md` line 30): "Prove nonvanishing/primitivity of the required nonconstant coefficients, including the local test-vector choices and the relevant auxiliary-prime hypotheses." No source for the nonvanishing is named.
- **AC L2s** (line 44) names no mod-p nonvanishing input. Its `requires` are `AC:L0`, `APL:L4e`, `MetaplecticAutomorphicForms:MP.6`, `PadicFamilies:L0a`.
- **No owner anywhere.** A sweep of all 2840 stage titles and descriptions of the assembled atlas finds "Vatsal" only as Cornut–Vatsal (AC L5, HE.8, HE.8b, HE.8c and the integrated HE nodes), and no Finis 2006, Hida 2004, Hida 2010 or Hsieh 2012.
- **Packets.** The APL blueprint packet `research/blueprint/packets/AutomorphicPadicLFunctions.json` (checkpoint #3100, 26 September) has L3h `not_read`. Its coverage entry asks to "Retain the extra unramified-p, residual irreducibility and prime-to-p character-image conditions for the stated mu result", but no node and no request covers the mod-p inputs. There is no AutomorphicCongruences packet.
- **Restructurings.** Accepted RS-14 keeps L3h "in full" ("every extra unramified-p/residual/character-image-order/conductor condition for mu=0 and nonvanishing"). It names the Hilbert/CM geometric suppliers of L3: `ShimuraVarieties:V5`, `AutomorphicBundles:B5`, `IgusaVarietiesAndTorsionConcentration:IG.1`. Pending RS-04 adds `ComplexMultiplicationAndExplicitReciprocity:CM.1`/`CM.2` → L3h. Pending RS-11 keeps AC L1 and L2s and says nothing about mod-p nonvanishing.
- **Audit.** AUDIT-23 (merged into `data/library-coverage.json`, reviewed by REV-AUDIT-24) covers APL: "Hilbert and Bianchi forms, Deligne–Ribet, Katz and Hsieh" are missing.
- **Libraries.** At the pins, `declarations.tsv` has 0 lines matching `igusa|hida|anticyclotomic|serreTate|CMPoint|heegner`. A case-insensitive search of the Mathlib and Tau Ceti source trees for `anticyclotomic|Igusa|Hida` finds only an unrelated local name (`hidApply`, in `TauCeti/Analysis/Normed/Algebra/LogOneAdd/Inverse.lean:87`).
- **Read at the sources** (29 September 2026):
  - Hsieh, Doc. Math. 19 (2014).
    - Proof of Theorem 6.1 (p. 757): "we deduce the theorem from the above equation by the linear independence of p-adic modular forms modulo p acted by the automorphisms in D0×D′1 ([Hid10b, Thm. 3.20, Cor. 3.21])". [Hid10b] is Hida, *The Iwasawa µ-invariant of p-adic Hecke L-functions*, Ann. of Math. 172 (2010) 41–137.
    - §7 (p. 760): "(3) The Zariski density of CM points in Hilbert modular varieties modulo p reduces the proof of Theorem 7.1 to the non-vanishing of certain Fourier coefficients … ([Hid04a, Thm. 3.2 and Thm. 3.3])". §7.4 (p. 763) uses the same. [Hid04a] is Hida, *Non-vanishing modulo p of Hecke L-values*, in *Geometric aspects of Dwork theory*, de Gruyter 2004, 735–784.
    - p. 714: "Skinner and Urban use results of Finis and Vatsal to show the non-vanishing modulo p of certain Klingen-Eisenstein series on U(2,2)." This confirms the SU use of [Vat03] (Duke 116 (2003) 219–261) and [Fin06] (Ann. of Math. 163 (2006) 767–807) from the citing side. Skinner–Urban itself could not be downloaded.
  - CLW arXiv:2109.08375v1, §5.6 (p. 36): "we can apply mod p nonvanishing results [Hsi14b] (for the L-values in (5.6.1)) and [Hsi12] (for the L-values in (5.6.3)(5.6.4)) … [the L-values] fall into the non-residually self-dual case for which [Hsi12, Theorem B] can be applied". In CLW's bibliography [Hsi14b] is Hsieh Doc. Math. 19 (2014) and [Hsi12] is Hsieh, Amer. J. Math. 134 (2012) 1503–1539.
  - Hsieh 2012 (arXiv:1208.4751, dated 12 August 2012). **The theorem numbers are right.**
    - Theorem A is the self-dual case.
    - Theorem B, "proved in Cor. 6.5", is the case where χ is not residually self-dual. Hypotheses: (unr) p > 2 unramified in F; (ord) Σ p-ordinary; (pl, D_{K/F}C) = 1; (L) μ_p(χ_v) = 0 for every v | C⁻; (N) χ not residually self-dual. Conclusion: (NV) for (χ, l).
    - Its Theorem 3.1 restates "Theorem 3.2 and Theorem 3.3 [Hid04a]": under (unr), (ord) and a Fourier-coefficient hypothesis (H) on an U_l-eigen Eisenstein series, ∫νdE ≢ 0 mod m_p for almost all ν ∈ X_l⁻. The Remark adds: "if l has degree one over Q, the above theorem is Theorem 3.2 [Hid04a]. In general, the theorem holds under the assumption (h) in Theorem 3.3".
- **A hypothesis the stage text must keep.** Hsieh's introductory statement of Theorem C (p. 713) lists (ord), (sf), Hypothesis A and conditions (1)–(3). It does not list p unramified in F. The body proves it as Theorem 7.1 (p. 759), which assumes "the same assumptions in Theorem 6.2", and Theorem 6.2 includes "p is unramified in F". Hida's method (Hsieh 2012's (unr)) needs this too. L3h's Theorem C sentence must therefore carry it. The packet should record it as a source issue.

### Fix
1. **New stage `AutomorphicPadicLFunctions:L3m`.** In `content/campaign/AutomorphicPadicLFunctions/README.md`, insert this section before "## L3h — Anticyclotomic toric distributions and Hsieh's μ theorem" (that heading occurs once):

   > ## L3m — Mod-p nonvanishing of anticyclotomic Hecke and Rankin–Selberg L-values
   >
   > Own Hida's mod-p geometry of CM points on Hilbert modular Igusa towers and the nonvanishing theorems proved from it. Here F is totally real, K/F is a CM quadratic extension with p-ordinary CM type Σ, and p > 2 is unramified in F, as in each source. Prove:
   >
   > (a) Hida's linear independence modulo p of p-adic modular forms under the automorphisms coming from the torus action, with the q-expansion principle (Hida, Ann. of Math. 172 (2010), Theorem 3.20 and Corollary 3.21). Hsieh uses exactly this in the proof of Theorem 6.1 (Doc. Math. 19 (2014), p. 757).
   >
   > (b) Hida's reduction of nonvanishing modulo p to Fourier coefficients: the Zariski density of CM points modulo p, and Theorems 3.2 (l of degree one over Q) and 3.3 (general l, under its hypothesis (h)) of Hida, *Non-vanishing modulo p of Hecke L-values* (2004). The measure attached to a U_l-eigenform with unit eigenvalue is nonzero modulo m_p on almost all characters of Γ_l⁻: all but finitely many if [F_l:Q_ℓ] = 1, a Zariski-dense set otherwise.
   >
   > (c) Hsieh, Amer. J. Math. 134 (2012), Theorem B (Cor. 6.5): under (unr), (ord), (pl, D_{K/F}C) = 1, μ_p(χ_v) = 0 for every v | C⁻ and χ not residually self-dual, the normalized Hecke L-values L^{alg,l}(0, χν) are nonzero modulo m for almost all ν ∈ X_l⁻. Also its Theorem A, the self-dual case, with (L), (R) root number +1, (C) R squarefree and l split in K.
   >
   > (d) Vatsal, Duke Math. J. 116 (2003), and Finis, Ann. of Math. 163 (2006), in the form Skinner–Urban use for the nonconstant Klingen–Eisenstein coefficients on U(2,2), with the hypotheses as those papers state them.
   >
   > Every input of these proofs is owned here or imported from its owner. That includes the geometric inputs of Hida's density and independence theorems, which are to be read in Hida 2004 and 2010 at decomposition. Import CM abelian varieties and the main CM theorem from ShimuraVarieties V5, special-fibre Igusa varieties from IgusaVarietiesAndTorsionConcentration IG.1, q-expansion principles from AutomorphicBundles B5, and Katz's ordinary CM setting from L3. Mixed-characteristic lifts that IG.1 does not supply are proved here. Export (a)–(b) to L3h, (c)–(d) to AutomorphicCongruences L1 and L2s, and (c) to L2s's auxiliary-character choice (CLW §5.6). "Almost all" keeps its two meanings. A characteristic-zero nonvanishing theorem (Cornut–Vatsal, HeegnerPointEulerSystems HE.8) is not a substitute.
   >
   > **Dependencies:** AutomorphicPadicLFunctions L3; ShimuraVarieties V5; IgusaVarietiesAndTorsionConcentration IG.1; AutomorphicBundles B5.

2. **`data/atlas.json`.**
   - Add the stage record `AutomorphicPadicLFunctions:L3m` (owner `AutomorphicPadicLFunctions`, key `L3m`, the title and description above, `sourcePath` the README).
   - Its `requires`: `AutomorphicPadicLFunctions:L3`, `ShimuraVarieties:V5`, `IgusaVarietiesAndTorsionConcentration:IG.1`, `AutomorphicBundles:B5`. The last three are the Hilbert/CM suppliers RS-14 names for L3.
   - Its consumers: `AutomorphicPadicLFunctions:L3h`, `AutomorphicCongruences:L1`, `AutomorphicCongruences:L2s`.
   - Add the seven matching stageEdges records.
   - Cycle tests (assembled graph, with L3m added):
     - L3 → L3m, IG.1 → L3m, V5 → L3m and B5 → L3m: acyclic (L3m is new, and none of L3m's consumers reaches any of these four).
     - L3m → L3h: acyclic (no path L3h → L3, IG.1, V5 or B5).
     - L3m → AC:L1: acyclic (no path AC:L1 → L3, IG.1, V5 or B5).
     - L3m → AC:L2s: acyclic (no path AC:L2s → L3, IG.1, V5 or B5).
   - If pending RS-04 is accepted, CM.1 → L3m is the natural analogue of its CM.1 → L3h link. That is for RS-04's owner, not added here.
3. **L3h, line 60.** Replace "Prove Theorem C under its separate conductor conditions; distinguish all but finitely many characters in local degree one from a Zariski-dense set in higher dimension." (occurs once) with:
   > Prove Theorem C under its separate conductor conditions and with p unramified in F: the published introduction omits this from Theorem C, but its proof (Theorem 7.1) assumes the hypotheses of Theorem 6.2, which include it. Distinguish all but finitely many characters in local degree one from a Zariski-dense set in higher dimension. Import from L3m Hida's linear independence modulo p (Hida 2010, Theorem 3.20 and Corollary 3.21), used in the proof of Theorem 6.1, and Hida's CM-point density reduction (Hida 2004, Theorems 3.2–3.3), used in §7.4. Neither is re-proved here.
   - Add `AutomorphicPadicLFunctions:L3m` to L3h's `requires`.
4. **AC L1, line 30.** Replace "Prove nonvanishing/primitivity of the required nonconstant coefficients, including the local test-vector choices and the relevant auxiliary-prime hypotheses." (occurs once) with:
   > Prove nonvanishing/primitivity of the required nonconstant coefficients, including the local test-vector choices and the relevant auxiliary-prime hypotheses; the mod-p nonvanishing of the L-values that control them (Vatsal 2003, Finis 2006) is imported from AutomorphicPadicLFunctions L3m.

   Add L3m to AC L1's `requires`. This sentence is independent of /22's rewrite of L1's FW paragraph; if both are applied, keep both.
5. **AC L2s, line 44.** After "Reuse L0's extension algebra and AutomorphicPadicLFunctions L4e's doubling construction, with explicit comparison maps, rather than duplicate them." (occurs once), insert:
   > The auxiliary characters of CLW §5.6 are chosen with Hsieh's mod-p nonvanishing theorems: Hsieh 2014 Theorem C for (5.6.1) through AutomorphicPadicLFunctions L3h, and Hsieh 2012 Theorem B for (5.6.3)–(5.6.4) through L3m. Verify here the non-residually-self-dual condition and the local root-number conditions that CLW check.

   Add L3m to L2s's `requires`. /25 adds L3h.
6. **APL packet** (`research/blueprint/packets/AutomorphicPadicLFunctions.json`, for its next checkpoint).
   - Add L3m to `scope` and a `coverage` entry `{"stageId": "AutomorphicPadicLFunctions:L3m", "status": "not_read", "remaining": ["Read Hida 2004 Thms 3.2-3.3 with hypothesis (H)/(h), Hida 2010 Thm 3.20/Cor 3.21 and their geometric inputs; Hsieh 2012 Thms A-B; Vatsal 2003 and Finis 2006 in Skinner-Urban's form."]}`.
   - Add a `sourceIssues` entry:
     - id `AutomorphicPadicLFunctions/E4`, source Hsieh 2014, kind `gap`, locator "Theorem C, p. 713, against Theorem 7.1, p. 759, and Theorem 6.2, p. 757".
     - printed: "Theorem C. In addition to (ord), (sf) and Hypothesis A, we further assume that (1) (pl, ncχ DK/F) = 1, (2) …, (3) …".
     - correction: "add: p is unramified in F (assumed by Theorem 7.1 through Theorem 6.2)".
     - affects "a stated result"; known "new", searched ["the published text read here"].

### Not done, and why
- **Hida 2004, Hida 2010, Vatsal 2003, Finis 2006 and Skinner–Urban 2014 were not read.** They are paywalled or not public in a form I could fetch. Their theorem numbers are the ones Hsieh 2012, Hsieh 2014 and CLW cite, and those citing texts were read. The exact hypotheses of (a), (b) and (d) are left to the L3m decomposition.
- **Hida's μ = 0 for anticyclotomic Katz p-adic L-functions** (Hida 2010, main theorem) is not put in L3m. /5 proposes to own it in the elliptic-units roadmap. Since it is proved in the same paper from the same Theorem 3.20, the maintainer may prefer L3m as its single owner, with that roadmap importing it.

## /8 (medium, error): HE.6's prerequisites are corrected, and Zhang's theorem becomes a substage HE.6z so that the new imports close no cycle

### What the verifier corrected
- Confirmed in all three parts:
  - HE.6's requires are ES.5, R17.5 and HE.5, and R17.3 (Jacquet–Langlands) is reached only transitively;
  - no main-conjecture or Kato supplier feeds HE.6;
  - BSD.6 cannot supply Zhang's Thm 7.1, since it requires HE.6 and covers another curve and field.
- The verifier did not test the finding's edges **together with /10's**. That combination is where this fix departs from the finding (see "The cycle").

### State on main (45d60f04)
- **HE.6.** In the assembled atlas its `requires` are ES.5, GL2AutomorphicRepresentationsAndTransfer:R17.5, HE.5 and the Tau Ceti EllipticCurves layer 7. Its consumers are HE.8b and BSD.6. The README Dependencies line (line 86) reads "**Dependencies:** HE.5; EulerSystemsAndKolyvaginSystems ES.4–ES.5; GrossZagierAndArithmeticHeights GZ.8 only when supplying analytic nonvanishing; GL2AutomorphicRepresentationsAndTransfer R17.2–R17.5." It occurs exactly once.
- **The two transfer stages.** R17.5 is "Automorphic induction and Langlands–Tunnell". R17.3 is "Global Jacquet–Langlands … Supply the definite and indefinite cases needed by R18/R22". R17.3 is an ancestor of HE.6 only through R17.4 → R17.5.
- **GZ.5** exports "the explicit split, ramified and definite-quaternionic specializations needed by Euler-system and level-raising consumers". Its consumers are GZ.6 and BSD.2 only.
- **BSD.5** ("build the precise Ribet–Takahashi character-group/degree calculation from R11 and the existing transfer APIs") lists "HeegnerPointEulerSystems HE.6" in its README Dependencies line. HE.6 is not in its `requires`, and there is no path HE.6 → BSD.5.
- **Pending RS-21** (no review) adds the link `tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-7-…` → HE.6. Its stated reason: "Direct component import formerly reached through GL2AutomorphicRepresentationsAndTransfer:R17.5 … retaining the original application edge". That link presupposes the R17.5 → HE.6 edge this fix removes.
- **Pending RS-04** keeps "Generic error-tolerant descent inequalities" at ES.4 and moves "Primitivity and sharp length bounds" to ES.5 from HE.6. It says nothing on Zhang.
- **Disclosure.** HE.6 is among the stages of route 4 of PAPER-KOLYVAGIN-90 (this session's extraction, not yet reviewed). That route is about Gross's exposition and does not concern Zhang. This fix follows the verifier only.

**Read at the source** (Zhang, CJM 2 (2014), sha256 698eb8a6…).
- §7.1, p. 231, Theorem 7.1 (Kato, Skinner–Urban). Its hypotheses:
  - "p is a good ordinary prime";
  - "The image of ρ_{A_g,p} contains SL₂(F_p)";
  - "There is a place ℓ||N such that the residue Galois representation ρ_{A_g,p} is ramified at ℓ".

  Then L(g/K,1) ≠ 0 iff Sel_{p∞}(A_g/K) is finite, with the p-part formula (7.1) against Ω_g^can and the Tamagawa lengths t_g(ℓ). The proof applies SU's Theorem 2 to A_g and to its twist A_g^K separately, extended to GL₂-type varieties, with Greenberg's control. This is "the only place we need to impose the ordinariness assumption".
- Theorem 6.4 (p. 229): v_p(η_{g,N⁺,N⁻}) equals the sum over ℓ | N⁻ of the lengths of the p-parts of the component groups Φ(A/K_ℓ), "(Ribet–Takahashi [35], Khare [22], Pollack–Weston [33])". Zhang's proof is Pollack–Weston Thm 6.8, Helm's multiplicity one, and the modular-degree results of Ribet–Takahashi, Takahashi (elliptic curves) and Khare (GL₂-type).
- Theorem 6.5 (p. 230), the Jochnowitz congruence. Under Hypothesis ♥ with ν(N⁻) even, c(1) is locally nontrivial at an admissible q iff L^alg(g′/K,1) is a p′-adic unit. Remark 12 credits Bertolini–Darmon.
- Remark 2, p. 198, lists the Gross formula mod p, the Bertolini–Darmon congruence and the main conjecture of Kato and Skinner–Urban.

**The mathematics checked.** Zhang's Theorem 7.1 needs **both** divisibilities of the rank-zero p-part:
- the SU lower bound (the main conjecture);
- Kato's upper bound;
- Greenberg's control for GL₂-type A_g, with coefficients O_g.

Its auxiliary hypothesis is SU's (some ℓ ∥ N with ρ̄ ramified at ℓ). /14 shows that MIMC L1's current FW 1.6 form carries a strictly stronger auxiliary condition. So HE.6z must consume the SU-form target that /14 adds to MIMC L1, not FW 1.6.

**The cycle.** The finding's edge ModularIwasawaMainConjectures:L1 → HE.6 and /10's edge HE.6 → HE.8 are each acyclic, but together they close a cycle in the assembled graph:

> HE.8 → GeneralizedHeegnerCycles:GH.8 → AutomorphicCongruences:L2 → ModularIwasawaMainConjectures:L1 → HE.6 → HE.8.

The two needs are different theorems:
- HE.8 needs Howard's Theorem A machinery (Thm 1.6.5's verification of H.0–H.5, reused in Howard's Prop. 2.1.3);
- only Zhang's indivisibility theorem needs the main conjecture, Kato, the Gross formula and level raising.

So Zhang's theorem is split off into a substage **HE.6z**. HE.6 keeps Howard's Theorem A and Kolyvagin's bound, and HE.8 imports HE.6 as /10 asks.

### Fix
1. **New substage `HeegnerPointEulerSystems:HE.6z`, "Zhang's indivisibility of Heegner points (Kolyvagin's conjecture)".** Insert in the README after HE.6's Dependencies line (line 86), before `<a id="he-7"></a>`:

   > <a id="he-6z"></a>
   > ### HE.6z — Zhang's indivisibility of Heegner points
   >
   > **Milestone:** `HE.6z`
   >
   > *[the Zhang paragraph given in /2, edit 2]*
   >
   > Prove Zhang's Theorem 7.1 for A_g/K: p ≥ 3 good ordinary, the image of ρ̄_{A_g,𝔭} contains SL₂(F_p), and some ℓ ∥ N at which ρ̄ is ramified. Then L(g/K,1) ≠ 0 iff Sel_{p∞}(A_g/K) is finite, with the p-part formula against Ω_g^can and the Tamagawa lengths. Derive it for A_g and for its twist A_g^K over ℚ from two imports: the Skinner–Urban-form weight-two main conjecture of ModularIwasawaMainConjectures L1 (not the Fouquet–Wan 1.6 form, whose auxiliary-prime hypothesis is stronger), and Kato's divisibility from KatoEulerSystems L4, with SelmerIwasawaCohomology control extended to GL₂-type coefficients. Ordinarity at p is a hypothesis of this branch.
   >
   > State as named results:
   > - the Gross formula mod p, imported from GrossZagierAndArithmeticHeights GZ.5's definite-quaternionic specialization;
   > - the Bertolini–Darmon Jochnowitz congruence (Zhang Thm 6.5; Bertolini–Darmon, Amer. J. Math. 121 (1999));
   > - the comparison of Zhang Thm 6.4, v_p(η_{g,N⁺,N⁻}) = Σ_{ℓ|N⁻} length Φ(A/K_ℓ)_p under Hypothesis ♥ (Pollack–Weston Thm 6.8, Helm's multiplicity one).
   >
   > For the last, import the elliptic-curve Ribet–Takahashi degree calculation from RankZeroOneBSD BSD.5, and prove here Khare's GL₂-type extension and the non-squarefree case Zhang describes.
   >
   > **Dependencies:** HE.6; SerreWeightAndLevelOptimisation R20.2:level-raising; GL2AutomorphicRepresentationsAndTransfer R17.3; ModularIwasawaMainConjectures L1; KatoEulerSystems L4; GrossZagierAndArithmeticHeights GZ.5; RankZeroOneBSD BSD.5.
2. **HE.6's README.**
   - Delete the Zhang sentence of line 84 (it moves to HE.6z). Keep "A non-torsion Heegner point alone does not imply its p-indivisibility." at the end of HE.6's paragraph, followed by "Zhang's indivisibility theorem is HE.6z."
   - Dependencies line (line 86), replace with: "**Dependencies:** HE.5; EulerSystemsAndKolyvaginSystems ES.4–ES.5; GrossZagierAndArithmeticHeights GZ.8 only when supplying analytic nonvanishing." Theorem A over X₀(N) uses no automorphic transfer.
3. **`data/atlas.json`.**
   - Remove the stageEdge GL2AutomorphicRepresentationsAndTransfer:R17.5 → HeegnerPointEulerSystems:HE.6, and R17.5 from HE.6's `requires` and HE.6 from R17.5's `consumers`. This is the maintainer's removal.
   - Add the stage HE.6z (owner HeegnerPointEulerSystems, title as above).
   - Add the stageEdges into HE.6z from:
     - HE.6;
     - SerreWeightAndLevelOptimisation:R20.2:level-raising (/2);
     - GL2AutomorphicRepresentationsAndTransfer:R17.3;
     - ModularIwasawaMainConjectures:L1;
     - KatoEulerSystems:L4;
     - GrossZagierAndArithmeticHeights:GZ.5;
     - RankZeroOneBSD:BSD.5.
   - Cycle tests, cumulative with /1, /2, /9 and /10, after the R17.5 removal: every one is acyclic. The assembled graph has no path from HE.6z to any of them, because HE.6z is a new sink.
   - The finding's direct edges into HE.6 are not added.
4. **Pending RS-21.** Its link from InductionRestriction layer 7 → HE.6 ("formerly reached through … R17.5") should be dropped at RS-21's review, since HE.6 no longer uses R17.5.
5. **Decomposition.** The HE.6 coverage record has "The stage asks to instantiate Wei Zhang's indivisibility theorem … BSD_ZhangIndivisibility.pdf … was NOT read." Move that entry to a new coverage record for HE.6z (status `not_read`).

### Not done, and why
- **The edges MIMC L1, Kato L4 and GZ.5 → HE.6 are not added.** Combined with /10's HE.6 → HE.8 they close the cycle shown above. They go to HE.6z, the consumer that actually uses them.
- **Ribet–Takahashi is not planned twice.** HE.6z imports BSD.5's elliptic calculation (BSD.5 → HE.6z is acyclic) and adds only Khare's GL₂-type case and Pollack–Weston. The finding's alternative "BSD.5 → HE.6" is not used. BSD.5's README already lists HE.6 as a dependency, so the edge BSD.5 → HE.6 would contradict that line.
- **No consumer of HE.6z is added.** No stage in this area consumes Zhang's theorem today (JSW's rank-one route does not). Consumers may add it later.

## /9 (medium, missing): Serre's open-image theorem gets an owner, FaltingsFinitenessAndIsogenyTheorems R28.7, imported by HE.7

### What the verifier corrected
- Confirmed without correction:
  - no atlas stage owns Serre's open-image theorem;
  - R28.6 avoids it, R29.1 avoids it after accepted RS-06, and R01.4 covers only finite subgroups;
  - irreducibility for almost all p is weaker, since excluding a large image in the normaliser of a Cartan is exactly Serre's content.

### State on main (45d60f04)
- **HE.7.** `content/campaign/HeegnerPointEulerSystems/README.md`, line 95, reads "For non-CM curves prove the required open-image/cohomological bounds and their uniformity; …". Its Dependencies line (line 99) reads "**Dependencies:** HE.4–HE.6; EulerSystemsAndKolyvaginSystems ES.4; ArithmeticGaloisRepresentations R01.5–R01.6; ArithmeticGaloisDuality R02.1–R02.4; EllipticCurves Layers 5–7; NeronModelsAndSemistableAbelianVarieties R11." Each occurs exactly once. HE.7's `requires`: R02.4, R01.6, ES.4, HE.5 and three EllipticCurves layers.
- **R28.6** (`content/campaign/FaltingsFinitenessAndIsogenyTheorems/README.md`, line 80): "R29 uses this to show only finitely many rational prime-degree isogenies without requiring the full Serre open-image theorem or excluding CM curves." The FaltingsFinitenessAndIsogenyTheorems stages are R28.1–R28.6. There is no R28.7, and the id is not reserved in `research/blueprint/reserved-ids.json`. The integrated Faltings decomposition has R28.6 nodes `commutant-statement-for-almost-all-primes` and `siegel-theorem-without-diophantine-approximation`, neither on images mod p.
- **New since the red team: a packet now plans Serre's §1 local inputs.**
  - `research/blueprint/packets/FiniteFlatGroupsAndIntegralPadicHodgeTheory.json` (28 September) plans, as R07.5 nodes, the tame-inertia and fundamental-character results of Serre 1972 §1: `R07.5/tame-inertia-characters`, `…/formal-group-torsion-inertia`, `…/ordinary-torsion-inertia`, `…/supersingular-torsion-inertia` and `…/multiplicative-torsion-inertia`.
  - Its source record is Serre, Invent. Math. 15 (1972) 259–331, the GDZ scan (sha256 cfa08081…).
  - These are the local inputs of the open-image proof, but not the global theorem.
- **The library audit is merged.** `data/library-coverage.json`, AUDIT-25, HE.7 target "Open-image and cohomological bounds for non-CM curves; …" is "absent", with the note "Absent: no Galois representations of elliptic curves and no open image theorem". The AUDIT-09 entry for R28.6 does not mention open image.
  - A grep of both pinned libraries for `open image`, `openImage` or Serre near image, restricted to elliptic curves, finds nothing relevant. The hits are Huber rings, topology and profinite groups.
  - Tau Ceti's `AlgebraicGeometry/EllipticCurve` has Galois descent and twists but no torsion Galois representation.
- **Disclosure: this touches two pieces of this session's own work.**
  - PAPER-KOLYVAGIN-90 (extraction; no review yet) has item `g-serre-open-image`, status "planned", planned [HE.7], from Gross §2 p. 237. The finding shows that "planned" is wrong. The paper also has items `r3-rem-5.9-serre` and `r3-prop-5.8-i` (Rubin III.5.8–5.9, status "missing", routed to KatoEulerSystems L3/L4), and `g-prop-2.1-almost-all-p` (route 4, to HE).
  - This session also wrote the AUDIT-09 fix (the Faltings layers). No R28.6 audit target changes.
  - The fix below follows the verifier only.

**Read at the source.** Serre, *Propriétés galoisiennes des points d'ordre fini des courbes elliptiques*, Invent. Math. 15 (1972), the GDZ scan above. Printed pp. 259–260 were read as page images.
- K is any number field and E has no complex multiplication.
- (4) "Pour tout l ∈ P, φ_{l∞}(G) est un sous-groupe ouvert de Aut(E_{l∞})". This is the result of MG (Serre's McGill book).
- The new result is (5): "Pour presque tout l ∈ P, le groupe φ_∞(G) contient le l-ième facteur", equivalently (7): "Pour presque tout l ∈ P, on a φ_l(G) = Aut(E_l)".
- (1)–(2): φ_∞(G) has finite index in GL₂(Ẑ), bounded in terms of E and K.

**The mathematics checked.**
- Over K ≠ ℚ, "surjective for almost all ℓ" is consistent with det ρ̄ = χ_cyc|_{G_K}. That determinant is onto F_ℓ^× whenever K ∩ ℚ(μ_ℓ) = ℚ, which holds for all ℓ unramified in K.
- For HE.7 (E/ℚ) both (4) and (7) are used:
  - (7) makes Kolyvagin's clean argument (Gross Prop. 2.1) apply for almost all p, giving Ш[p^∞] = 0 there;
  - (4) bounds H¹(Gal(K(E[p^∞])/K), E[p^∞]) and the other cohomological error terms at the finitely many remaining p (Rubin Prop. III.5.8(i)).

### Fix
1. **New stage `FaltingsFinitenessAndIsogenyTheorems:R28.7`.** Insert in `content/campaign/FaltingsFinitenessAndIsogenyTheorems/README.md` after R28.6's Dependencies line (line 82), before "## Required examples and checks":

   > <a id="r28-7"></a>
   > ## R28.7. Serre's open-image theorem
   >
   > **Milestone:** `R28.7`
   >
   > For an elliptic curve E without complex multiplication over a number field K, prove Serre's theorems (Invent. Math. 15 (1972), Introduction (1)–(7)):
   > - for every ℓ, ρ_{E,ℓ^∞}(G_K) is open in GL₂(Z_ℓ);
   > - for all but finitely many ℓ, ρ̄_{E,ℓ}(G_K) = GL₂(F_ℓ);
   > - the adelic image has finite index in GL₂(Ẑ).
   >
   > Use R28.6's finiteness of prime-degree isogenies to exclude Borel images for large ℓ. Use the tame-inertia and fundamental-character computations (FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.5) to exclude normalisers of Cartan subgroups and exceptional images, with the finite-subgroup classification of ArithmeticGaloisRepresentations R01.4. Irreducibility for almost all ℓ is not the conclusion.
   >
   > Separately, state and prove the GL₂-type analogue needed by HeegnerPointEulerSystems HE.7's Kolyvagin–Logachev branch: big image for almost all λ for the non-CM RM quotients it uses. The source is still to be selected (Ribet's theorem for newforms over ℚ; a Hilbert-modular big-image theorem for the totally real case).
   >
   > This stage exports the theorems. HE.7 keeps only their application and uniform bounds.
   >
   > **Dependencies:** R28.6; ArithmeticGaloisRepresentations R01.4; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.5.

   `data/atlas.json`: add the stage, with `requires` [R28.6, ArithmeticGaloisRepresentations:R01.4, FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.5] and the three stageEdges. R28.4 is reached through R28.6. Add the stageEdge R28.7 → HeegnerPointEulerSystems:HE.7.
   - Cycle test for R28.7 → HE.7: acyclic. R28.6 already reaches HE.7 (R28.6 → R29.2 → R29.3 → R29.4 → HE.1 → … → HE.5 → HE.7), and there is no path from HE.7 to R28.6, R01.4 or R07.5.
2. **R28.6's sentence** (line 80, quoted above). Append: "The full theorem is R28.7, for consumers that need it (HeegnerPointEulerSystems HE.7)."
3. **HE.7.**
   - Replace the sentence of line 95 quoted above with: "For non-CM curves import Serre's open-image theorem from FaltingsFinitenessAndIsogenyTheorems R28.7 (surjectivity mod p for almost all p; open p-adic image for the rest) and prove the resulting cohomological bounds and their uniformity here; for CM curves prove the corresponding character/decomposition bounds over the CM field and descent back, keeping the cases separate."
   - In the Kolyvagin–Logachev sentence (line 97), insert after "with their field of definition, Hecke compatibility and local hypotheses retained": "and the GL₂-type big-image theorem imported from R28.7".
   - Dependencies line (line 99): after "ArithmeticGaloisRepresentations R01.5–R01.6;" insert "FaltingsFinitenessAndIsogenyTheorems R28.7;".
4. **PAPER-KOLYVAGIN-90 items** (this session's extraction; the paper has no review yet, so these are corrections to make before its review).
   - `g-serre-open-image`: `status` "planned" → "missing"; `planned` [HeegnerPointEulerSystems:HE.7] → removed; note appended "Owner proposed: FaltingsFinitenessAndIsogenyTheorems R28.7 (RT-AREA-iwasawa-1/9). HE.7 applies it but does not prove it." When R28.7 enters the atlas, set status "planned" and planned [FaltingsFinitenessAndIsogenyTheorems:R28.7].
   - `r3-rem-5.9-serre` and `r3-prop-5.8-i`: append the same owner note.

### Not done, and why
- **No edge R28.7 → KatoEulerSystems:L4.** Rubin III.5.8–5.9 (Kato's application) would also use R28.7. That is a routing decision for the KatoEulerSystems blueprint, outside this finding's scope, and is only noted here.
- **Serre's proof, §§2–5, was not read.** Only the introduction was.
  - The proof route in edit 1 is the standard modern one: isogeny finiteness excludes the Borel case, inertia excludes Cartan normalisers and the exceptional images.
  - Serre's own 1972 proof predates Faltings and argues differently when j is integral.
  - The route must be checked against the source before the stage is decomposed.
- **The GL₂-type source is not chosen.** Neither Ribet's nor a Hilbert-modular big-image paper was read; the stage records the target and leaves source selection open.

## /10 (medium, missing): Howard's self-dual Kolyvagin-system theorems move to ES.5 (DVR) and ES.8 (Λ-adic); HE.6, HE.8 and GH.5 apply them

### What the verifier corrected
- Confirmed without correction. ES.4's two interfaces are the other two abstract theories, and ES.5 records only the square-index bound. The accepted decomposition realises Howard's structure theorem inside an HE node, so a general theory is planned inside an application layer.

### State on main (45d60f04)
- **ES text is unchanged since 15 September.** `content/campaign/EulerSystemsAndKolyvaginSystems/README.md`:
  - ES.5 (lines 59–65) ends its second paragraph with "Heegner descent can yield a square-index Sha bound through self-dual arithmetic structure; that factor of two is not a universal formula for every T."
  - ES.8 (lines 83–87) has "Several-variable variants retain Rubin's no-completely-split-finite-prime hypothesis and distinguish finite from pseudo-null modules."
  - Both sentences occur exactly once. There is no ES packet in `research/blueprint/packets/`.
- **The HE decomposition node** `HeegnerPointEulerSystems:HE.6/clean-rank-one-descent-theorem-A` states Howard's abstract Thm 1.6.1 over a DVR with H.0–H.5, then Thm 1.6.5 and Theorem A. The integrated link HE.6-node → `HE.8/lambda-adic-heegner-kolyvagin-system-and-theorem-B` gives the reason "Theorem B is proved by reducing … at each height-one prime … and applying 'the same machinery used to prove Theorem A'".
- **Requires.** HE.8's `requires` has no HE.6. GH.5 (`content/campaign/GeneralizedHeegnerCycles/README.md`, line 33) requires ES.3, ES.4 and GH.4. Its text ends "Derive Theorem 3.5's rank-one module, paired torsion pseudo-isomorphism and oriented characteristic-ideal divisibility." The integrated GH.5 node states LV Thm 3.5 under (H.1)–(H.5) and Assumption 3.2.
- **Pending RS-04** (no review) agrees with this finding on the owner:
  - owner entry "Primitivity and sharp length bounds under the precise DVR hypotheses" → ES.5, formerly HE.6;
  - "Generic Iwasawa tower and control interfaces" → ES.8, formerly HE.8.

  RS-04 does not name Howard's self-duality results. The fix below is compatible with RS-04 and does not wait for it.
- **Disclosure.** HE.6 and HE.8 are stages of route 4 of PAPER-KOLYVAGIN-90, and ES.4 and ES.8 of its route 1. That extraction is this session's, with no review yet. The fix follows the verifier only.

**Read at the source.** Howard, *The Heegner point Kolyvagin system*, arXiv:1202.6340v1 (sha256 d2d06e85…), the text of Compositio Math. 140 (2004).
- §1, p. 4: "Sections 1.1, 1.2, and 1.3 follow [MR04] very closely. Sections 1.5 and 1.6 do as well, but with modifications unique to the case of Heegner points. The results of Section 1.4, which rely crucially on the self-duality of the Tate module T_p(E), have no analogue in [MR04]."
- Theorem 1.6.1 is stated for an arbitrary Selmer triple (T, F, L) over a DVR R satisfying H.0–H.5 with L_s(T) ⊂ L. Theorem 1.6.5 verifies H.0–H.5 for T_p(E).
- Proposition 2.1.3 verifies H.0–H.5 for T_P = T ⊗ S_P at a height-one prime P "as in Theorem 1.6.5", and applies Thm 1.6.1.
- Theorem 2.2.10 (p. 26): if (T, F_Λ, L_s) has a Kolyvagin system with κ₁ ≠ 0, then:
  - (a) H¹_{F_Λ}(K,T) is torsion-free of rank one;
  - (b) X ∼ Λ ⊕ M ⊕ M with char(M) = char(M)^ι;
  - (c) char(M) divides char(H¹_{F_Λ}(K,T)/Λκ₁).

  Its proof uses only Prop. 2.1.3 at each P, the control Prop. 2.2.8, torsion-freeness (Lemma 2.2.9) and commutative algebra.
- The Longo–Vigni source record in `data/decompositions/GeneralizedHeegnerCycles.json` (arXiv:1605.03168v1) states Thm 3.5 in the same form for T over O under (H.1)–(H.5) and Assumption 3.2. Longo–Vigni prove it "by replacing Howard's Props. 2.1.3 and 2.2.8" and following Thm 2.2.10.

**The mathematics checked.** Howard's Thm 2.2.10 is proved for T = T_p(E) ⊗ Λ, but its proof is abstract once three things are known:
- H.0–H.5 for T ⊗ S_P at all but finitely many height-one P;
- control with bounded kernels and cokernels (Prop. 2.2.8);
- H¹_{F_Λ}(K,T) torsion-free.

The ι-symmetry in (b) comes from the Λ-adic self-duality twisted by the involution of the anticyclotomic Λ. So a generic Λ-adic statement with these three items as hypotheses is correct, and it is exactly what LV instantiate. It belongs in the rank-one ES.8 (see /35, which splits ES.8).

### Fix
1. **ES.5.** After the sentence quoted above, insert:
   > Own Howard's self-dual Kolyvagin-system theory over a DVR (The Heegner point Kolyvagin system, §§1.2–1.6): Selmer triples (T, F, L), the Kolyvagin-system relations twisted by G_n, the hypotheses H.0–H.5 (including H.4, the perfect symmetric pairing T × T → R(1) with F its own exact orthogonal complement, and H.5, the τ-eigenspace splitting of T̄), Proposition 1.5.9 and Theorem 1.6.1. If κ₁ ≠ 0 then H¹_F(K,T) is free of rank one and H¹_F(K,A) ≅ D ⊕ M ⊕ M with length(M) ≤ length(H¹_F(K,T)/Rκ₁). This is the self-dual variant absent from Mazur–Rubin §5.2; ES.4's two interfaces do not contain it. Applications (HeegnerPointEulerSystems HE.6, GeneralizedHeegnerCycles GH.5) verify H.0–H.5 for their own T and apply the theorem.
2. **ES.8** (the rank-one ES.8 after /35's split). After the sentence quoted above, insert:
   > Own the Λ-adic self-dual theorem of Howard (Thm 2.2.10) in abstract form, over Λ = O[[Γ]] for the anticyclotomic Γ with its involution ι. Suppose (T, F_Λ, L_s) is a Selmer triple such that:
   > - T ⊗ S_P satisfies H.0–H.5 for all but finitely many height-one primes P;
   > - the control maps have kernels and cokernels bounded in terms of [S_P : Λ/P];
   > - H¹_{F_Λ}(K,T) is Λ-torsion-free.
   >
   > If it admits a Kolyvagin system with κ₁ ≠ 0, then H¹_{F_Λ}(K,T) has rank one, X ∼ Λ ⊕ M ⊕ M with char(M) = char(M)^ι, and char(M) divides char(H¹_{F_Λ}(K,T)/Λκ₁). Import the DVR theorem from ES.5. HeegnerPointEulerSystems HE.8 (Howard §2) and GeneralizedHeegnerCycles GH.5 (Longo–Vigni Thm 3.5) verify the hypotheses and apply it.
3. **HE.6.** Replace "Apply the abstract descent engine to the actual Heegner system." (line 82, exactly once) with "Apply the abstract self-dual descent theorem of EulerSystemsAndKolyvaginSystems ES.5 (Howard Thm 1.6.1) to the actual Heegner system, verifying H.0–H.5 for T_p(E) (Howard Thm 1.6.5)."
4. **HE.8.** Replace "Apply the generic ES.8 and SelmerIwasawa control maps to obtain Howard's divisibility and its invariant paired torsion structure." (line 108, exactly once) with "Verify the hypotheses of ES.8's Λ-adic self-dual theorem for T_p(E) ⊗ Λ, reusing HE.6's verification of H.0–H.5 at each height-one prime (Howard Prop. 2.1.3), and apply it with the SelmerIwasawa control maps to obtain Howard's divisibility and its invariant paired torsion structure."
5. **GH.5.** Replace "Derive Theorem 3.5's rank-one module, paired torsion pseudo-isomorphism and oriented characteristic-ideal divisibility." (exactly once) with "Derive Theorem 3.5's rank-one module, paired torsion pseudo-isomorphism and oriented characteristic-ideal divisibility by applying EulerSystemsAndKolyvaginSystems ES.5's DVR theorem and ES.8's Λ-adic self-dual theorem; the verification of their hypotheses, not the theorems, is proved here."
6. **`data/atlas.json`.** Add the stageEdges, with `requires` and `consumers` to match:
   - EulerSystemsAndKolyvaginSystems:ES.5 → GeneralizedHeegnerCycles:GH.5;
   - EulerSystemsAndKolyvaginSystems:ES.8 → GeneralizedHeegnerCycles:GH.5;
   - HeegnerPointEulerSystems:HE.6 → HeegnerPointEulerSystems:HE.8.

   Cycle tests, cumulative with /1, /2, /8 and /9: all three acyclic.
   - HE.6 → HE.8 is acyclic **only because /8 moves the main-conjecture imports to HE.6z**. With the finding's MIMC L1 → HE.6 it would close HE.8 → GH.8 → AC:L2 → MIMC:L1 → HE.6 → HE.8.
   - If /35 splits ES.8, the edge ES.8 → GH.5 is from the rank-one ES.8.
7. **Decomposition `data/decompositions/HeegnerPointEulerSystems.json`, node `HE.6/clean-rank-one-descent-theorem-A`.**
   - `title` → "Kolyvagin's Theorem A: H.0-H.5 for T_p(E) (Thm. 1.6.5) and the resulting bound".
   - In `statement`, replace the opening "Let R be a discrete valuation ring … length_R(M) <= length_R(H^1_F(K,T)/R kappa_1)." with "Import from EulerSystemsAndKolyvaginSystems:ES.5 Howard's THEOREM 1.6.1 (DVR R, Selmer triple satisfying H.0-H.5, kappa_1 nonzero gives a free rank-one H^1_F(K,T) and H^1_F(K,A) = D + M + M with length(M) <= length(H^1_F(K,T)/R kappa_1))." Keep the rest (Thm 1.6.5, Theorem A).
   - Delete `proofSteps[0]`, the proof of Thm 1.6.1 "read only in outline"; that proof belongs to ES.5's blueprint. The HE node keeps `proofSteps[1]` (verification of H.0–H.5) and `proofSteps[2]`.
   - Add a `links` entry {source `EulerSystemsAndKolyvaginSystems:ES.5`, target this node, reason "Howard's Thm 1.6.1 over a DVR is ES.5's; this node verifies H.0-H.5 for T_p(E) and applies it"}. This decomposition records inputs as `links`; its nodes carry no `prerequisites` field.
   - Retarget the link HE.6-node → HE.8-node's reason to "HE.8 reuses Thm 1.6.5's verification of H.0-H.5 at each height-one prime (Prop. 2.1.3); the Lambda-adic theorem itself is ES.8's".
8. **Decomposition `data/decompositions/GeneralizedHeegnerCycles.json`, node `GH.5/longo-vigni-admissibility-and-the-lambda-adic-bound`.** Append to `hypotheses`: "Theorem 3.5 is the instance of EulerSystemsAndKolyvaginSystems ES.8's Lambda-adic self-dual theorem (Howard Thm 2.2.10); GH.5 proves its hypotheses (LV's replacements for Howard's Props. 2.1.3 and 2.2.8), not the theorem."

### Not done, and why
- **No ES nodes are written.** There is no ES packet. The generic nodes are specified in the README text (edits 1–2), for ES's blueprint job.
- **Howard's proof of Thm 1.6.1 (§§1.4–1.6) was not reread.** This fix moves the statement to ES.5 and leaves its decomposition to ES's blueprint.

## /11 (medium, duplicate): GZ.9 imports the GL₂ BDP distribution from L3h and owns BDP's r = j = 0 Heegner-point formula; GH.1 imports that case

### What the verifier corrected
- **Confirmed without correction.**
  - GZ.9's `requires` contain neither L3h nor any GeneralizedHeegnerCycles stage.
  - So two things are planned a second time here: the GL₂ construction, and the p-adic Waldspurger identity at the weight-two point.
  - No accepted proposal assigns an owner.
- **What is genuinely new in GZ.9** is kept, as the finding separates it:
  - Brooks's quaternionic variant;
  - the JSW comparisons;
  - the Bloch–Kato/Kummer identification with HE.3;
  - the exceptional-zero branch.

### State on main (45d60f04)
- **GZ.9 is unchanged since 15 September.** In `content/campaign/GrossZagierAndArithmeticHeights/README.md`:
  - line 117 begins "Construct the BDP/Brooks p-adic L-function for the weight-two Heegner setting at a good-reduction prime split in the imaginary quadratic field, with its actual interpolation range, CM periods and removed Euler factors."
  - the same paragraph contains "Prove the p-adic Waldspurger identity at the weight-two point outside the interpolation range: the specified specialization equals the square/product of the formal logarithm of the corresponding Heegner point times the explicit local factors."
  - line 121 is its Dependencies line, which names ModularSymbolsPadicLFunctions.
  - line 138 is its handoff row.
- **GZ.9 in the assembled graph.**
  - `requires` = [GZ.3, GZ.4, HE.3, ModularSymbolsPadicLFunctions:L2, PadicHodgeRegulators:L1, PadicMeasuresIwasawaAlgebras:L1, two Tau Ceti layers].
  - consumers = [AutomorphicCongruences:L5a, HE.8, HE.8b, BSD.6a, BSD.7a].
- **L3h exists.** `AutomorphicPadicLFunctions:L3h` is "Anticyclotomic toric distributions and Hsieh's μ theorem".
  - Its text (`content/campaign/AutomorphicPadicLFunctions/README.md` line 60) says "Export these exact statements to GeneralizedHeegnerCycles GH.6 and AutomorphicCongruences L2/L5a."
  - The AutomorphicPadicLFunctions packet (checkpoint of 26 September, #3100) has no L3h node.
- **The integrated node** `GeneralizedHeegnerCycles:GH.1/generalized-heegner-cycles-and-their-abel-jacobi-images` (`data/decompositions/GeneralizedHeegnerCycles.json`, 16 September) states BDP's Main Theorem for all r, "the general form being Thm. 5.13", and includes the r = 0 correction Δ_φ − ∞₁.
  - Its proof step says the Secs. 3–5 computation "was NOT read here".
  - Its displayed factor is [(1 − χ̄(p̄)a_p + χ̄(p̄)²p^{k−1})/j!]², which is (1 − χ̄(p̄)a_p + χ̄(p̄)²p)² at k = 2, j = 0.
- **The GH.0 packet** (`research/blueprint/packets/GeneralizedHeegnerCycles--GH.0.json`, 29 September) adds GH.1 nodes for BDP Prop. 2.7, Rem. 2.6, Def. 3.1 and Prop. 3.5, but none for Thm. 5.13.
- **The GH.8 packet** (27 September) plans the weight-two comparison with HE.3/HE.8 and does not touch the BDP formula.
- **GH.4** (README line 29) plans Castella–Hsieh Thm. 4.9 and Thm. 5.7.
- **Sources read.**
  - Hsieh, Doc. Math. 19 (2014) 709–767, https://ems.press/content/serial-article-files/26241, SHA-256 a662df67…0718. What it says:
    - the abstract says the construction generalises "the construction of Brakoc̆ević, Bertolini, Darmon and Prasanna in the elliptic case";
    - the Remark after Theorem A (p. 712): "When F = Q, π arises from an elliptic new form f of weight k and level n, the construction of L_Σp(π,λ) can be recovered from [BDP13, Theorem 5.4] under some extra assumptions p ∤ n and n⁻ is only divisible by ramified primes";
    - Hypothesis A (p. 710): "The local root number ε*(π_Kv, λ_v) = +1 for each v | n⁻. In particular, the above hypothesis holds if n⁻ = (1)."
    - So BDP's setting is the F = ℚ case of L3h under Hypothesis A. The square of Hsieh's element interpolates the central values.
  - BDP, Duke Math. J. 162 (2013), https://www.math.mcgill.ca/darmon/pub/Articles/Research/51.BDP1/duke-publishedversion.pdf, SHA-256 223bfdad…8fbc, p. 1038: "the simplest case r = j = 0, where f is a newform of weight 2 … our Main Theorem involves the formal group logarithms of points in the Jacobians of modular curves arising from certain divisors supported on Heegner points. It relates these p-adic logarithms to the values of the p-adic L-function L_p(f, χ) at characters of finite order (shifted by the norm). One thus obtains a new p-adic variant of the Gross–Zagier formula in the traditional setting of Heegner points on modular curves."
  - Castella–Hsieh, arXiv:1505.08165v2, SHA-256 a98f9f37…9755, Thm. 4.9 (p. 20): "… anticyclotomic Hecke character of infinity type (r + j, −j − r) with −r < j < r and conductor pⁿO_K with n > 1".
    - In CH, f has weight 2r. So r = 1, j = 0 is weight two, but only for characters of conductor pⁿ with n > 1.
    - It does not reach BDP's point, whose conductor is prime to p and which carries the Euler factor above. This confirms the finding's remark on AUDIT-25.
  - JSW, arXiv:1512.06894v1, SHA-256 908562ef…7d49d, §5.1.5: "We recall Brooks' formula [Bro14, Prop. 8.13]", stated as Proposition 5.1.6. It comes from a parametrisation by a Shimura curve X_{N⁺,N⁻}.
- **Audit.** AUDIT-25 (merged in `data/library-coverage.json`) lists two duplicates of GZ.9:
  - GH.4, with the note "Its weight-two case is this logarithm formula". That is wrong, by CH Thm. 4.9's n > 1.
  - L3h ("overlaps the construction").

### Fix
1. **`content/campaign/GrossZagierAndArithmeticHeights/README.md`, GZ.9, line 117.** Replace "Construct the BDP/Brooks p-adic L-function for the weight-two Heegner setting at a good-reduction prime split in the imaginary quadratic field, with its actual interpolation range, CM periods and removed Euler factors." (checked by script: occurs once) with:
   > Import the GL₂ anticyclotomic square-root distribution of AutomorphicPadicLFunctions L3h (Hsieh, Theorem A) specialised to F = ℚ, weight two and p split in K. This contains BDP's setting: p ∤ N, and n⁻ divisible only by ramified primes, in particular n⁻ = 1 (Hsieh, Remark after Theorem A). Its square is the BDP p-adic L-function, with its interpolation range, CM periods and removed Euler factors. Construct here only Brooks's quaternionic variant on the Shimura curve X_{N⁺,N⁻} attached to an indefinite quaternion algebra, which Hsieh's GL₂ construction does not cover.
2. **Same paragraph.** Replace "Prove the p-adic Waldspurger identity at the weight-two point outside the interpolation range: the specified specialization equals the square/product of the formal logarithm of the corresponding Heegner point times the explicit local factors." (checked: occurs once) with:
   > Own the case r = j = 0 of BDP's Main Theorem (Theorem 5.13), which BDP single out as the Heegner-point case (p. 1038). For χ a finite-order anticyclotomic character times the norm, which lies outside the interpolation range, the value of the BDP p-adic L-function at χ equals (1 − χ̄(p̄)a_p + χ̄(p̄)²p)² times the square of the formal-group logarithm of the χ-component of the Heegner divisor (a CM point minus a cusp), evaluated on ω_f. At r = j = 0 the period power Ω_p^{2(r−2j)} of the general theorem is 1. GeneralizedHeegnerCycles GH.1 imports this case and owns r ≥ 1. Prove Brooks's quaternionic analogue (Brooks Prop. 8.13 = JSW Prop. 5.1.6) here.
3. **Dependencies (line 121).** "**Dependencies:** GZ.0, GZ.3–GZ.4; HeegnerPointEulerSystems HE.3; PadicFamilies L0–L1 for the ordinary-family variant only; PadicMeasuresIwasawaAlgebras; PadicHodgeRegulators; ModularSymbolsPadicLFunctions; EllipticCurves formal groups." → "**Dependencies:** GZ.0, GZ.3–GZ.4; HeegnerPointEulerSystems HE.3; AutomorphicPadicLFunctions L3h (the GL₂ BDP square-root distribution); PadicFamilies L0–L1 for the ordinary-family variant only; PadicMeasuresIwasawaAlgebras; PadicHodgeRegulators; EllipticCurves formal groups."
4. **Handoff row (line 138).** "| `GZ.9` | Construct the good-reduction BDP/Brooks logarithm-square comparison without forcing ordinarity of f; the multiplicative exceptional-zero term is a separate extension. |" → "| `GZ.9` | Import L3h's GL₂ distribution at F = ℚ; own BDP's r = j = 0 logarithm-square formula (exported to GH.1) and Brooks's quaternionic construction and formula, without forcing ordinarity of f; the multiplicative exceptional-zero term is a separate extension. |"
5. **`content/campaign/AutomorphicPadicLFunctions/README.md`, L3h, line 60.** Replace "Export these exact statements to GeneralizedHeegnerCycles GH.6 and AutomorphicCongruences L2/L5a." (checked: occurs once) with "Export these exact statements to GeneralizedHeegnerCycles GH.6, AutomorphicCongruences L2/L5a and GrossZagierAndArithmeticHeights GZ.9 (Theorem A's construction at F = ℚ, weight two)." /25 edits the same sentence to add L2s; the two edits are merged in "Edits shared between findings" at the end of this report, whose text supersedes this one.
6. **`data/decompositions/GeneralizedHeegnerCycles.json`, node `GH.1/generalized-heegner-cycles-and-their-abel-jacobi-images`.**
   - `statement`: append "The case r = j = 0 (weight two, CM points on the modular curve) is owned by GrossZagierAndArithmeticHeights:GZ.9 and imported here; this node proves the cases r >= 1."
   - `hypotheses`: append "for r = 0 the formula is GZ.9's, with the CM point corrected by a cusp as in Prop. 2.7".
7. **`data/atlas.json`.**
   - Add `AutomorphicPadicLFunctions:L3h` to GZ.9's `requires`, and GZ.9 to L3h's `consumers`; add the stageEdges record L3h → GZ.9.
   - Add `GrossZagierAndArithmeticHeights:GZ.9` to GH.1's `requires`; add the stageEdges record GZ.9 → GeneralizedHeegnerCycles:GH.1.
   - Cycle test for L3h → GZ.9: acyclic (no path GZ.9 → L3h in the assembled graph).
   - Cycle test for GZ.9 → GH.1: acyclic (no path GH.1 → GZ.9).
   - **Maintainer's removal:** the stage edge ModularSymbolsPadicLFunctions:L2 → GZ.9, and L2 from GZ.9's `requires`.
     - No target of GZ.9, before or after this fix, uses p-stabilised modular-symbol measures. The BDP and Brooks constructions evaluate modular forms at CM points.
     - Of GZ.9's 24 descendants in the assembled graph, none loses ModularSymbolsPadicLFunctions:L2 as an ancestor when the edge goes. HE.8 and BSD.6a require L0–L2 directly.
8. **Audit record (AUDIT-25, merged; the orchestrator merges audit edits), GZ.9 `duplicates`.**
   - The GH.4 entry's note becomes: "Not a duplicate of the weight-two formula: Castella–Hsieh Thm. 4.9 requires conductor pⁿ with n > 1 (arXiv:1505.08165v2, p. 20). BDP's r = j = 0 formula is owned by GZ.9 and imported by GH.1."
   - The L3h entry's note becomes: "Resolved: GZ.9 imports L3h's distribution at F = ℚ and keeps only Brooks's quaternionic construction."

### Not done, and why
- **Why GZ.9 rather than GH owns the r = 0 case.** The finding offers either direction.
  - GZ.9's consumers (HE.8, HE.8b, BSD.6a, BSD.7a, AC L5a) are weight-two consumers.
  - Owning the case in GH would make them all descend from GH.0–GH.1, including MotivicEtaleKTheory M.4 and DeformationAndDerivedPatchingAlgebra P7, for a statement about CM points on a modular curve.
  - BDP themselves isolate r = j = 0 as the Heegner-point case. The general-r proof remains GH's, so no argument is written twice: the r ≥ 1 cases use the Kuga–Sato geometry that r = 0 does not need.
- **BDP Secs. 3–5 were not read** (by me or the integrated node). The r = 0 statement above follows the node and BDP's own p. 1038 description, not a line-by-line reading of Thm. 5.13's proof.
- **Brooks 2014 was not read.** Its locator (Prop. 8.13) is JSW's, read at JSW §5.1.5.

## /12 (medium, library-claim): GZ.0's premise restated from the pinned code; the README/code disagreement goes to the Tau Ceti maintainer

### What the verifier corrected
- **Confirmed; the verifier read the pinned definition.** `TauCeti/AlgebraicGeometry/EllipticCurve/CanonicalHeight.lean:124` defines the canonical height as lim h(2ⁿP)/(2·4ⁿ). Its docstring says h is attached to 2(O) and the Néron–Tate height to (O) is half of it.
- So the library height is the one attached to (O), not twice it, and GZ.0's premise is false. The Gram-determinant consequence follows.
- No narrowing of the fix.

### State on main (45d60f04)
- **GZ.0's stage text is unchanged since 15 September.** `content/campaign/GrossZagierAndArithmeticHeights/README.md` line 20: "The existing elliptic height is normalized using the logarithmic x-height, twice one common convention. Determine the induced bilinear-pairing convention from its actual definition and prove its comparison with each source's pairing." The atlas stage description and the extract `research/blueprint/atlas/roadmaps/GrossZagierAndArithmeticHeights.json` carry the same sentence.
- **Read at Tau Ceti f790474.**
  - `TauCeti/AlgebraicGeometry/EllipticCurve/CanonicalHeight.lean:124`: `noncomputable def Point.canonicalHeight (P : W.Point) : ℝ := limUnder atTop fun n : ℕ ↦ ((2 ^ n) • P).naiveHeight / (2 * 4 ^ n)`. The docstring (lines 116–119) reads "The `2` is the standard normalisation: `h` is the height of the `x`-coordinate, which has a double pole at infinity, so `h` is attached to `2(O)` and the Néron–Tate height to `(O)` is half of it."
  - `TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/NaiveHeight.lean:91`: `Point.naiveHeight P := logHeight P.xRep`. This is the height of the supplied `AdmissibleAbsValues F` structure.
  - `CanonicalHeight.lean:374`: `neronTatePairing := QuadraticMap.associated' (canonicalHeightQuadratic W)`, "the halved polar form". `neronTatePairing_apply` (line 384) gives ((P+Q).canonicalHeight − P.canonicalHeight − Q.canonicalHeight)/2, and `neronTatePairing_self` (line 390) gives ⟨P,P⟩ = P.canonicalHeight.
  - `MordellWeil/Regulator.lean:91`: `regulator` is |det| of the Gram matrix of that pairing on a basis of the points modulo torsion.
- **The mathematics, checked.**
  - Write h_x for the height of x. Since x has a double pole at O, h_x = h_{2(O)} + O(1), so lim h_x(2ⁿP)/4ⁿ = ĥ_{2(O)}(P) = 2ĥ_{(O)}(P). Tau Ceti's ĥ is therefore ĥ_{(O)}.
  - Its pairing has ⟨P,P⟩_TC = ĥ_{(O)}(P). YZZ's pairing for L = O((O)) is ⟨x,y⟩_L = ĥ_L(x+y) − ĥ_L(x) − ĥ_L(y). Since ĥ_L(2x) = 4ĥ_L(x), ⟨x,x⟩_L = 2ĥ_{(O)}(x).
  - By YZZ Thm. 7.2 with the principal polarisation of (O), this is also the Poincaré pairing. So ⟨,⟩_YZZ = ⟨,⟩_NT = 2·⟨,⟩_TC entrywise, and a rank-r Gram determinant differs by 2^r.
  - Under GZ.0's premise (library ĥ = ĥ_{2(O)} with the halved polar form) the two pairings would agree. So the premise predicts the wrong power of two.
  - The BSD regulator in the normalisation of Cremona and the LMFDB uses ⟨P,P⟩ = ĥ_x(P) = 2ĥ_{(O)}(P). So Reg_BSD = 2^r · `regulator`.
- **What already covers this.** The GZ.0 blueprint checkpoint `research/blueprint/packets/GrossZagierAndArithmeticHeights--GZ.0.json` was written after the red team (#3803, 28 September), by session `cc-fb70e5` (branch `cc-fb70e5-bp-gz0`), not this one. It has already made the correction at node level:
  - `GZ.0/x-height-canonical-height`: "It equals 2 · Point.canonicalHeight P … the height attached to the divisor (O) (Silverman's normalisation)".
  - `GZ.0/bsd-regulator`: "Reg_BSD … equals 2^r · regulator W".
  - `GZ.0/height-convention-dictionary`: lists both disagreeing Tau Ceti texts.
  - A `requests` entry to EllipticCurves Layer 7 asks for the BSD quotient with Reg_BSD.
  - A gap records that the [K:ℚ] normalisation of heights over number fields is not yet fixed, because neither library has an `AdmissibleAbsValues` instance for number fields.

  The defect that remains is the stage text (README and atlas description), which still states the false premise.
- **The upstream text.** `content/tau-ceti/EllipticCurves/README.md` lines 1178–1179 (the mirror of the Tau Ceti EllipticCurves roadmap, Layer 6) pin "`ĥ(P) = lim_n h(x(n • P))/n²` with `h` the logarithmic height of the `x`-coordinate, which is twice the normalisation some authors use; the regulator and the BSD quotient of §Layer 7 are stated against this one".
  - That formula is ĥ_x = 2 · the implemented `canonicalHeight`.
  - The module docstring (`CanonicalHeight.lean` lines 26–30) says the (O)-height is "the one the Néron–Tate pairing, the regulator and the BSD formula are stated with". That holds only with the unhalved polar form, and the code uses the halved one.
- **Audit.** AUDIT-25 (merged) records the contradiction at target level for GZ.0.
- **Disclosure.** Not this session's work.

### Fix
1. **`content/campaign/GrossZagierAndArithmeticHeights/README.md`, GZ.0, line 20.** Replace "The existing elliptic height is normalized using the logarithmic x-height, twice one common convention. Determine the induced bilinear-pairing convention from its actual definition and prove its comparison with each source's pairing." (checked by script: occurs once) with:
   > At Tau Ceti f790474 the existing elliptic canonical height is ĥ(P) = lim h_x(2ⁿP)/(2·4ⁿ), where h_x is the logarithmic height of the x-coordinate for the base field's admissible absolute values. Because x has a double pole at O, h_x is a height for 2(O), and ĥ is the Néron–Tate height for (O), half the x-height limit ĥ_x. The library pairing is the halved polar form ⟨P,Q⟩ = ½(ĥ(P+Q) − ĥ(P) − ĥ(Q)), so ⟨P,P⟩ = ĥ(P). The pairing of Yuan–Zhang–Zhang, ĥ_L(x+y) − ĥ_L(x) − ĥ_L(y) with L = O((O)), which is the Poincaré pairing through the principal polarisation, is therefore twice the library pairing on elliptic curves. A rank-r Gram determinant, and the BSD regulator, is 2^r times the library regulator. The acceptance test stays: determine the pairing convention from the actual definition at the pinned commit, and prove its comparison with each source's pairing, rather than from this paragraph.
2. **Handoff row, line 135.** "| `GZ.0` | Build one normalization table linking x-height, bilinear pairing, full real period, trace/average, unitary center and torus volume. Prove each rescaling before calculating a BSD p-part. |" → "| `GZ.0` | Build one normalization table linking x-height (ĥ_x = 2ĥ at the pin), bilinear pairing (YZZ/Poincaré = 2 × library pairing on elliptic curves, hence 2^r on regulators), full real period, trace/average, unitary center and torus volume. Prove each rescaling before calculating a BSD p-part. |"
3. **`data/atlas.json` and the extracts.** The GZ.0 stage description is regenerated from the corrected README. No edge changes.
4. **Note for the Tau Ceti maintainer** (upstream; nothing in this repository changes it).
   - At f790474 the EllipticCurves roadmap, Layer 6, pins ĥ(P) = lim h(x(nP))/n², that is ĥ_x, and says the regulator and the Layer 7 BSD quotient are stated against it.
   - The code implements half of that: `Point.canonicalHeight`, CanonicalHeight.lean:124. Its regulator is the Gram determinant of the halved polar form (`neronTatePairing`, `regulator` at MordellWeil/Regulator.lean:91).
   - So the implemented `regulator` is 2^{−r} times the BSD regulator. For 37.a1 it is 0.02556, against LMFDB's 0.05111, the example the GZ.0 checkpoint records.
   - The module docstring's claim that the (O)-height is the one the regulator and BSD formula are stated with is true only with the unhalved polar form.
   - Either the roadmap text and docstring should be changed to the implemented normalisation, with Layer 7's BSD quotient using 2^r·`regulator`, or the regulator should be built from the unhalved pairing.
   - This roadmap does not fix it. GZ.0 only records the comparison.

### Not done, and why
- **No change to the GZ.0 packet.** It already states the corrected normalisation and the upstream disagreement.
- **The [K:ℚ] normalisation over number fields** stays the packet's open gap. The replacement above says "for the base field's admissible absolute values" rather than asserting relative or absolute heights, since no number-field instance exists at the pin.

## /13 (medium, error): the HE.8/HE.8b and BSD.6/6a, BSD.7/7a records are cut apart; the geometric Cornut–Vatsal input moves up into HE.8 and HE.8c keeps its consequences

### What the verifier corrected
- Confirmed. The atlas descriptions of HE.8 and HE.8b are byte-identical, 5951 characters each. Both edges the finding names exist (HE.8 → BSD.7a and BSD.7a → HE.8b), so the separation that keeps the arrangement acyclic lives only in the prose.
- Finding /39 (low, out of scope here, confirmed) makes the same observation for BSD.6/BSD.6a and BSD.7/BSD.7a. The verifier notes that /13 and /39 are "one defect seen twice" and that "a fixer should split all three pairs together". The BSD pairs are named in /13's own fix, so they are repaired here.

### State on main (45d60f04)
- **`data/atlas.json`**, unchanged for these records since the snapshot:

  | Stage | sourceLine | context lines | Description | Title |
  |---|---|---|---|---|
  | HE.8 | 102 | 102–127 | 5951 chars | "Anticyclotomic families, nonvanishing and divisibility defects" |
  | HE.8b | 111 | 102–127 | identical to HE.8 | "HE.8. Anticyclotomic families, nonvanishing and divisibility defects" |
  | HE.8c | 118 | 118–123 | 1490 chars, opens "### HE.8c — Source hypotheses for anticyclotomic nonvanishing" | |
  | HE.7s | 124 | 124–127 | | |
  | BSD.6 | 78 | 78–104 | 5967 chars | |
  | BSD.6a | 91 | 78–104 | identical to BSD.6 | "BSD.6. Irreducible-prime leading-term formulas" |
  | BSD.7 | 105 | 105–121 | 2487 chars | |
  | BSD.7a | 114 | 105–121 | identical to BSD.7 | "BSD.7. …" |

- **The mechanism.**
  - `scripts/snapshot/build_data.py` copies each stage's `target_text`, `context_start_line` and `context_end_line` from the campaign queue (lines 520–533).
  - That extraction cuts at headings. HE.8c and HE.7s have `###` headings and got their own ranges.
  - HE.8b, BSD.6a and BSD.7a have no heading, only anchors and a `**Milestone:**` line, so each inherited its parent `##` section whole. The HE.8 record therefore also contains HE.8c and HE.7s.
  - The README anchors are unchanged since 15 September:
    - `content/campaign/HeegnerPointEulerSystems/README.md`: HE.8 at lines 101–108; HE.8b anchors at 110–111, milestone 112, text 114, Dependencies 116; HE.8c at 118–122; HE.7s at 124–126.
    - `content/campaign/RankZeroOneBSD/README.md`: BSD.6 at 77–88; BSD.6a anchors 90–91, milestone 92, text 94–100, Dependencies 102; BSD.7 at 104–111; BSD.7a anchors 113–114, milestone 115, text 117, Dependencies 119.
- **Edges.** HE.8c `requires` [HE.8, HE.8b].
- **The integrated decomposition** carries two gaps:
  - "Atlas observation: HE.8 and HE.8b carry identical descriptions";
  - "REVERSED EDGE: the atlas records HE.8 -> HE.8c, but the mathematical dependency runs the other way". It says a prerequisite edge HE.8c → HE.8 "was drafted … and then WITHDRAWN, because combined with the existing atlas edge it would create the stage-level cycle HE.8 -> HE.8c -> HE.8 (and, through RankZeroOneBSD:BSD.7a and AutomorphicCongruences:L5a, three further cycles)".

  The HE.8b coverage record is `not_read` for the same reason.
- **Other files.** The BSD packet `research/blueprint/packets/RankZeroOneBSD--BSD.7.json` (26 September) does not repair the records. The library audit AUDIT-27 (merged) records separate BSD.6a targets by hand, as /39 says.
- **Disclosure.** HE.8 is a route-4 stage of PAPER-KOLYVAGIN-90, and BSD.5 and BSD.9 are route-5 stages; this session wrote that extraction. Neither route bears on these records. The fix follows the verifier only.

**The mathematics of the HE.8c direction.**
- What Howard's Theorem B needs is **geometric**: Cornut's theorem that some Norm_{K_k[1]/K_k} P_k[1] has infinite order (Howard's proof of Thm 2.3.7; see /1).
- Cornut–Vatsal's Theorems 1.4 and 1.5 are **L-value** statements. CV derive them from the CM-point statements (Thm 1.10/4.1) by the Gross–Zagier and Waldspurger formulae: "Zhang's Gross-Zagier formula implies that Theorem 1.5 is now a consequence of the following result [Theorem 1.10]".
- So the input runs geometric CM-point theorem → HE.8, and the L-value theorems are consequences, downstream of the geometric statement and of GZ.8.
- HE.8c's second paragraph (BCGS Theorem A) discharges its main-conjecture hypothesis "only through HE.8b's named branches", so it genuinely consumes HE.8b.
- Hence neither of the finding's options is right as stated:
  - dropping HE.8b → HE.8c would lose a real dependency;
  - reversing HE.8 → HE.8c would recreate the packet's cycles.

  The right cut moves the geometric statements into HE.8 (/1 adds them) and leaves the L-value corollaries and BCGS hypotheses in HE.8c, whose two incoming edges are then correct.

### Fix
1. **`content/campaign/HeegnerPointEulerSystems/README.md`, headings.**
   - Replace the three lines `<a id="he-8b"></a>` / `<a id="stage-HE.8b"></a>` / `**Milestone:** \`HE.8b\`` (exactly once) with the same two anchors, then the heading `### HE.8b — The anticyclotomic Heegner-index main conjecture and its Greenberg/BDP form`, then the milestone line.
2. **HE.8's own Dependencies line.** Insert after line 108 (HE.8's second paragraph), before the HE.8b anchors:
   > **Dependencies:** HE.3, HE.5–HE.6; EulerSystemsAndKolyvaginSystems ES.8; SelmerIwasawaCohomology L3; PadicFamilies L1; ModularSymbolsPadicLFunctions L0–L2; GrossZagierAndArithmeticHeights GZ.9; GeometryOfNumbersAndQuadraticArithmetic GN.4:padic-unipotent-flows; AutomorphicPadicLFunctions L3h for the split-p route only. HE.7 and the main-conjecture results of HE.8b are not inputs.

   HE.6, GN.4:padic-unipotent-flows and L3h come from /10 and /1. The rest matches HE.8's current `requires`.
3. **HE.8c.** Replace "Prove the geometric CM distribution before applying GZ's formula." (exactly once) with "Import the geometric CM-point statements (Cornut 2002; Cornut–Vatsal Thm 1.10/4.1 and CM points and quaternion algebras Cor. 2.10) from HE.8, and derive Theorems 1.4 and 1.5 from them by GrossZagierAndArithmeticHeights GZ.8's formula; these L-value theorems are consequences, not inputs of Howard's Theorem B."
4. **`content/campaign/RankZeroOneBSD/README.md`, headings.** Two edits, as in 1:
   - `<a id="bsd-6a"></a>` / `<a id="stage-BSD.6a"></a>` / `**Milestone:** \`BSD.6a\`` (exactly once) gets the heading `### BSD.6a — Main-conjecture inputs for the named irreducible-prime branches` after the anchors;
   - `<a id="bsd-7a"></a>` / `<a id="stage-BSD.7a"></a>` / `**Milestone:** \`BSD.7a\`` (exactly once) gets `### BSD.7a — The CGS and Keller–Yin Eisenstein main-conjecture proofs`.
5. **`data/atlas.json`, stage records.** Until the snapshot is regenerated from the corrected READMEs these are hand edits for the maintainer. Each `description` is the README text of the stated lines after edits 1–4, with `contextStartLine` and `contextEndLine` set to match.

   | Stage | Description | Title |
   |---|---|---|
   | HE.8 | from "## HE.8." through the new Dependencies line of edit 2 (old lines 102–108 plus that line) | unchanged |
   | HE.8b | the new heading of edit 1 through its Dependencies line (old lines 112–116) | "The anticyclotomic Heegner-index main conjecture and its Greenberg/BDP form" |
   | HE.8c | old lines 118–122, with edit 3 applied | |
   | HE.7s | unchanged | |
   | BSD.6 | old lines 78–88 | unchanged |
   | BSD.6a | new heading through old line 102 | "Main-conjecture inputs for the named irreducible-prime branches" |
   | BSD.7 | old lines 105–111 | unchanged |
   | BSD.7a | new heading through old line 119 | "The CGS and Keller–Yin Eisenstein main-conjecture proofs" |

   No `requires` changes here. The edges HE.8 → HE.8c and HE.8b → HE.8c stay. With the separated records, HE.8's text no longer contains "imports the distinct CGS proof in BSD.7a", and HE.8b's text alone carries the sentence "BSD.7a consumes only early HE.8 classes, never this completed equality", which is what makes HE.8 → BSD.7a → HE.8b acyclic.
6. **Atlas extracts.** `research/blueprint/atlas/roadmaps/HeegnerPointEulerSystems.json` and `…/RankZeroOneBSD.json` are regenerated from `data/atlas.json`.
7. **Decomposition `data/decompositions/HeegnerPointEulerSystems.json`.**
   - Delete the gap "Atlas observation: HE.8 and HE.8b carry identical descriptions" (resolved by edits 1 and 5).
   - Replace the detail of the gap "REVERSED EDGE: …" with: "Resolved (RT-AREA-iwasawa-1/13 and /1): the geometric input to Theorem B (Cornut 2002; Cornut-Vatsal Thm 1.10/4.1, Cor. 2.10 of CM points and quaternion algebras) is now HE.8's own nodes, upstream of Theorem B; HE.8c keeps the L-value Theorems 1.4/1.5, which are consequences via GZ.8, and BCGS Theorem A, which consumes HE.8b. The edges HE.8 -> HE.8c and HE.8b -> HE.8c are therefore correct and no edge is reversed." The gap's title becomes "HE.8c direction (resolved)".
   - Node `HE.8c/cornut-vatsal-nonvanishing-with-its-exact-hypotheses`:
     - `proofSteps[2]`: replace "None of Thms. 1.10, 4.1 or the corresponding definite-case statement was read here." with "Thms. 1.10 and 4.1 are the HE.8 node HE.8/cornut-vatsal-cm-point-nontriviality, imported here."
     - Add a `links` entry from `HE.8/cornut-vatsal-cm-point-nontriviality` to this node, with reason "Theorems 1.4 and 1.5 are deduced from the CM-point statement by the Gross-Zagier/Waldspurger formulae (CV Sec. 1.3)".
   - HE.8b `coverage`: `remaining[0]` (the "OBSERVATION" entry) → "Stage text separated from HE.8 (RT-AREA-iwasawa-1/13); BCS/BCGS sources for HE.8b not yet read." Delete `remaining[1]`, since the scope is now stated.

### Not done, and why
- **Neither of the finding's options is taken.** Moving the whole Cornut–Vatsal node into HE.8 and dropping both edges would lose HE.8c's real dependency on HE.8b (BCGS Theorem A's Main Conjecture 1.2.10). Reversing the edges recreates the cycles the packet found. The split above follows the source: CV derive the L-value theorems from the CM-point theorem.
- **The BSD pairs get only the record repair.** Their mathematics belongs to /4, /14, /15 and /30. A combined BSD.6a text must merge those edits with edit 4 here.

## /14 (medium, error): MIMC L1 gains the Skinner–Urban-form theorem in all weights k ≡ 2 mod (p − 1), and BSD.6's rank-zero bullet consumes it instead of FW Theorem 1.6

### What the verifier corrected
- Confirmed without correction. The edge MIMC L1 → BSD.6 exists, and the two hypotheses differ as the finding says: FW's auxiliary-prime condition adds dim ρ̄^{G_ℓ} = 0, which the Skinner–Urban condition does not require.
- The finding's family where the extra condition fails stands, so the rank-zero ordinary branch imports a theorem that does not reach every case it claims.

### State on main (45d60f04)
- **MIMC L1 is unchanged since 15 September.** `content/campaign/ModularIwasawaMainConjectures/README.md` lines 45–47: "Prove the ordinary modular theorem in the form recorded as FW Theorem 1.6. … and a prime ell exactly dividing N such that dim(bar V_f)^(I_ell) = 1, dim(bar V_f)^(G_Qell) = 0."
- **BSD.6** (`content/campaign/RankZeroOneBSD/README.md` line 85) claims "a multiplicative prime q where E[p] ramifies: the Skinner–Urban/Skinner branch summarized precisely in JSW Theorem 7.2.1(ii)". Its only main-conjecture edge is MIMC L1 → BSD.6.
- **The same L1 paragraph is also the subject of /22**, which rewrites the FW §4.8 route and moves it to AutomorphicCongruences L2. The edit below adds a separate paragraph and does not touch that route text.
- No packet or decomposition exists for ModularIwasawaMainConjectures. The pending RS-11 touches L1's route (the §4.8 "period refinement" owner), not its hypotheses.

**Checked at the sources** (read 29 September 2026):
- **FW, arXiv:2107.13726v3, §1.1.1, Theorem 1.6** ("[117] Theorem 3.19").
  - Hypotheses: "f ∈ S_k(Γ0(N)) with p ∤ N … weight k ≥ 2 … 1. ρ̄_f absolutely irreducible. 2. There exists ℓ∥N, such that dim_F ρ̄_f^{I_ℓ} = 1 and dim_F ρ̄_f^{G_ℓ} = 0. 3. … 0 → χ1 → ρ_f|G_Qp → χ2 → 0 with χ̄1 ≠ χ̄2."
  - Its conclusion is one divisibility, which gives equality only "combined with theorem 1.4" (Kato).
  - FW say their Theorem 1.6 differs from SU: "[117] has the supplementary assumptions k ≡ 2 mod p − 1".
- **Skinner–Urban**, author copy (math.columbia.edu/~urban/eurp/MC.pdf), Theorem 1 (Theorem 3.6.4):
  - hypotheses: "χ = 1 and k ≡ 2 mod p − 1; … ρ̄_f … irreducible; there exists a prime q ≠ p such that q∥N and ρ̄_f is ramified at q; p ∤ N";
  - conclusion: equality in Λ ⊗ Q_p, and in Λ under the further hypothesis that the image of ρ_f contains SL₂(Z_p).
- **Skinner, arXiv:1407.1093v1:**
  - Theorem A: (i) k ≡ 2 mod (p − 1), (ii) ρ̄_f irreducible, (iii) q ≠ p, q ∥ N, ρ̄_f ramified at q ⇒ Ch_L(f) = (L_f) in Λ_O, and "When p ∤ N this is just Theorem 1 of [18]".
  - §2.5 (pp. 15–16) removes SU's SL₂(Z_p) hypothesis. Kato's Thm 15.5(4) needs only (a) ρ̄_f irreducible and (b) some g ∈ Gal(Q̄/Q(μ_p∞)) with T_f/(ρ_f(g) − 1)T_f free of rank one over O. Hypothesis (iii) gives (b): take a tame inertia generator at q, which acts unipotently and nontrivially mod p.
  - Footnote 6 corrects SU's (−2πi)^m to (−2πi)^{m+1}.
- **JSW, arXiv:1512.06894v1, Theorem 7.2.1(ii):** "If E has good ordinary or multiplicative reduction at p and there exists a prime q of multiplicative reduction for E at which the representation ρ_{E,p} is ramified, then (7.2.b)".

**Mathematics checked.**
- **The general claim.** Let q ∥ N with ρ̄ ramified at q. Then E[p]|G_Qq (for f attached to E: a Tate-curve twist) is a non-split extension 0 → ω ψ → E[p] → ψ → 0 with ψ unramified of order ≤ 2. The I_q-invariants are the line ωψ, and Frobenius acts on it by ψ(q)·q mod p. So dim E[p]^{G_Qq} = 1 exactly when ψ(q)q ≡ 1 mod p: q ≡ 1 mod p at split q, and q ≡ −1 mod p at non-split q.
- **A concrete rank-zero curve outside FW 1.6 but inside SU/Skinner** (LMFDB, read 29 September 2026): 67.a1, y² + y = x³ + x² − 12x − 21.
  - Conductor 67, rank 0, no rational isogeny (so E[p] is irreducible for every p), split multiplicative at 67 with ord_67 Δ = 1, a_3 = −2.
  - At p = 3: the curve is good ordinary at 3, E[3] is ramified at 67 (3 ∤ 1), and 67 ≡ 1 mod 3.
  - Hence dim E[3]^{G_Q67} = 1 at the only prime dividing N. FW 1.6's hypothesis 2 fails at every ℓ ∥ N, while SU/Skinner's (iii) holds with q = 67.
  - The same holds at p = 11, since 67 ≡ 1 mod 11 and a_11 = −4.
- **Correction to the finding's fix.** The finding asks for a *weight-two* SU-form target. That suffices for BSD.6, but /4's new L1m uses Theorem A with p ∤ N as its seed in the weights k_m > 2, k_m ≡ 2 mod (p − 1), of the Hida-family members f_m (Skinner §3.1). FW 1.6 serves as that seed only under FW's stronger hypothesis. So the Skinner–Urban-form target is stated in all weights k ≡ 2 mod (p − 1), as SU and Skinner state it.

### Fix
1. **MIMC L1, `content/campaign/ModularIwasawaMainConjectures/README.md`.** After "The older author manuscript of SU has different theorem numbering and a differently packaged hypothesis set. Do not substitute its 'up to a power of p' version for the integral theorem or identify those statements merely by title. The preserved source-theorem catalogue records the versions separately." (occurs exactly once) insert:
   > **Second target: the Skinner–Urban form.** Also prove Skinner's Theorem A in the case p ∤ N (Skinner, Pacific J. Math. 283 (2016), arXiv:1407.1093v1; SU Theorem 1 with its integrality completed by Skinner §2.5): let p ≥ 3, let f ∈ S_k(Γ0(N)) be a newform of trivial character with p ∤ N, ordinary at p, of weight k ≥ 2 with k ≡ 2 mod (p−1); assume ρ̄_f irreducible and that some prime q ≠ p with q ∥ N has ρ̄_f ramified at q. Then X_{Q∞,L}(f) is Λ_O-torsion and Ch_L(f) = (L_f) in Λ_O, for every finite Σ in the Σ-imprimitive form. The route is the Skinner–Urban U(2,2) divisibility (AutomorphicCongruences L1) plus Kato's divisibility (KatoEulerSystems L4), with integrality from Skinner §2.5: Kato's Theorem 15.5(4) holds with the SL₂(Z_p)-image hypothesis replaced by (a) ρ̄_f irreducible and (b) an element g ∈ Gal(Q̄/Q(μ_(p^∞))) with T_f/(ρ_f(g)−1)T_f free of rank one, and (b) follows from the auxiliary prime q by taking g a tame inertia generator at q. Use the (−2πi)^(m+1) interpolation normalization (Skinner footnote 6). This target does not assume dim(bar V_f)^(G_Qq) = 0 and is not a special case of the FW form above: at a split multiplicative q ≡ 1 mod p (or a non-split q ≡ −1 mod p) the FW auxiliary-prime condition fails while this one holds. Keep both targets; consumers name which one they use.
   - Add an acceptance line to L1:
     > **Acceptance (L1):** 67.a1 at p = 3 satisfies the Skinner–Urban form (q = 67, split, ord_67 Δ = 1) and fails FW Theorem 1.6's hypothesis 2 (67 ≡ 1 mod 3 gives dim E[3]^(G_Q67) = 1).
2. **Edges.** None needed.
   - MIMC L1 → BSD.6 exists.
   - KatoEulerSystems:L4 is already an ancestor of MIMC L1 (Kato L4 → MIMC L0 → L1).
   - AutomorphicCongruences:L1 → MIMC L1 exists.
3. **BSD.6, `content/campaign/RankZeroOneBSD/README.md` line 85.** Replace "- Analytic rank zero, p odd of good ordinary or multiplicative reduction, E[p] irreducible, and a multiplicative prime q where E[p] ramifies: the Skinner–Urban/Skinner branch summarized precisely in JSW Theorem 7.2.1(ii). For the supersingular branch use its semistable (or explicitly permitted twist) condition and a_p=0. These are named branches, not a universal good-prime formula." (occurs exactly once) with (this text also carries /4):
   > - Analytic rank zero, p odd of good ordinary or multiplicative reduction, E[p] irreducible, and a prime q ≠ p of multiplicative reduction at which E[p] is ramified: the Skinner–Urban/Skinner branch summarized in JSW Theorem 7.2.1(ii) and proved as Skinner's Theorem C (arXiv:1407.1093v1). At good ordinary p consume ModularIwasawaMainConjectures L1's **Skinner–Urban-form** target in weight two, not the FW Theorem 1.6 form, whose auxiliary prime additionally needs E[p]^(G_Qq) = 0. At multiplicative p consume ModularIwasawaMainConjectures L1m (Skinner Theorem A, p ∥ N). At split multiplicative p the p-adic L-function has a trivial zero: consume PadicFamilies L3's Greenberg–Stevens theorem, PadicFamilies L4's identification of its L-invariant with log_p q_E/ord_p q_E, and DiophantineApproximationAndTranscendence DT.5's Barré-Sirieix–Diaz–Gramain–Philibert theorem, which makes that L-invariant nonzero; at non-split multiplicative p the factor (1−a_p)² = 4 is a p-adic unit. Prove here the Selmer-side trivial-zero comparison of Skinner §3.2 ((3.2.1)–(3.2.5): the factor (γ−1) of the characteristic ideal at split p, the kernel K and its Tamagawa factors). For the supersingular branch use its semistable (or explicitly permitted twist) condition and a_p=0. These are named branches, not a universal good-prime formula.
4. **The finding's alternative is rejected.** Adding "E[p]^{G_Qq} = 0" to BSD.6 would exclude curves such as 67.a1 at p = 3, which the source covers.

### Not done, and why
- **Only the all-weight form is stated.** A separate weight-two-only target, as the finding proposes, is not added; see "Mathematics checked".
- **SU's published numbering was not checked.** The SU text read is the author copy on Urban's page, whose Theorem 1 is Theorem 3.6.4; the Invent. Math. 195 (2014) version was not available. L1 already warns that the numbering and packaging differ between versions. The new target is therefore sourced to Skinner's Theorem A, whose §2.5 supplies the integral form, and SU's Theorem 1 is cited only for the p ∤ N content.
- **The route rewrite is /22's.** Removing the claim that FW §4.8 is a "period refinement" of SU belongs to /22 and is not duplicated here.

## /15 (medium, missing): BSD.6a names Castella 2018 and its erratum and lists every input of the corrected proof, each with an owner

### What the verifier corrected
- Confirmed without correction. None of the four inputs is supplied to BSD.6a:
  - the Castella–Grossi–Skinner bound and factorization are owned by BSD.7a, which is not among BSD.6a's suppliers;
  - the other three are planned by no stage.
- The review asks for this finding to be settled together with /30. /30 moves the BSTW zeta element and comparison to a new KatoEulerSystems L5. Both BSD.6a edits are written so that they can be applied together; the Dependencies line below includes both.

### State on main (45d60f04)
- **`content/campaign/RankZeroOneBSD/README.md`, BSD.6a (lines 91–103)**, unchanged since 15 September. A script confirms that each quoted sentence occurs exactly once.
  - "For the multiplicative branch prove Castella's corrected anticyclotomic Theorem 1.1: an ideal N of O_K with O_K/N≅ℤ/Nℤ; …; and E(ℚ_p)[p]=0."
  - "The corrected multiplicative proof consumes GeneralizedHeegnerCycles GH.2–7: CH (4.7), §5.2 and Theorems 5.7/6.1, LV Theorem 4.7 and Cas Theorems 2.11/5.3. Its reverse divisibility imports AutomorphicCongruences L2's FW proof, AutomorphicPadicLFunctions L3h's Hsieh μ theorem and L4e's Eischen–Wan construction."
  - The source contracts (line 145) cite only "[Castella's erratum](https://web.math.ucsb.edu/~castella/Birch-erratum.pdf) Theorem A′". The corrected paper is never named.
- **`requires` of BSD.6a** (raw atlas): AC L2, L2s; APL L3h, L4e; GH.7; GZ.9; HE.8; KatoEulerSystems L4; MIMC L0, L4; PadicFamilies L1; PHR L3; SIC L3. BSD.7a and HE.8b are not ancestors. PadicFamilies L4 and OrdinaryAutomorphicFormsAndModularityLifting R21.3 are ancestors.
- **The atlas records.** BSD.6 and BSD.6a have byte-identical records (see /13). The edits below are to the README.
- **The audit** (merged; `data/library-coverage.json`, layer BSD.6a, job AUDIT-27) has the target "Castella's corrected anticyclotomic Theorem 1.1 and its congruence/control proof", marked absent.
  - Neither library has any Iwasawa-theoretic object. `declarations.tsv` has no declaration matching Heegner, Kolyvagin, main conjecture or characteristic ideal. The only "Iwasawa" declarations are Mathlib's `MulAction.IwasawaStructure` (Iwasawa's simplicity criterion, `Mathlib/GroupTheory/GroupAction/Iwasawa.lean:47`) and the PSL₂ Iwasawa decomposition. The absence verdict stands.
- **Packets and decompositions.**
  - No packet covers BSD.6a. The RankZeroOneBSD packet (#2951, 26 September) covers only BSD.8/BSD.9 nodes.
  - The GeneralizedHeegnerCycles packets (GH.0 on 29 September; GH.8 on 27 September) and the integrated GH decomposition cite Castella's JIMJ paper ("On the p-adic variation of Heegner points") and the Castella–Hsieh erratum. None of them cites the Camb. J. Math. paper or its erratum.
  - No accepted or pending RS touches BSD.6a's multiplicative inputs.
- **Sources, all read in full for this fix.**
  - **The erratum:** Castella, *Erratum to "On the p-part of the Birch–Swinnerton-Dyer formula for multiplicative primes"*, 5 pp.
  - **The corrected paper:** Castella, Camb. J. Math. 6 (2018) 1–23, arXiv:1704.06608v2. Its Theorem 4.4 is the one the erratum replaces.
  - **CGS:** arXiv:2303.04373 v1 and v2. v1 Theorem 5.5.1 and Proposition 1.4.5 are v2 Theorem 6.5.1 and Proposition 2.4.5.
  - **BCK21:** Burungale–Castella–Kim, arXiv:1908.09512v2, Theorem 5.2.
  - **FO12:** Fouquet–Ochiai, author copy of Crelle 666 (2012), Lemma 2.14.
  - **FW21:** Fouquet–Wan, arXiv:2107.13726v3, Theorem 4.41, Corollary 7.21 and Lemma 7.22.

### The corrected proof, as the erratum gives it
**Theorem 2.3** (weight k ≥ 2 ordinary g of level M, p ∤ M) is proved as follows:
- **(a) The Kolyvagin bound.** Castella–Hsieh classes (CH18 (4.7), §5.2, Thm 6.1) and the Longo–Vigni Kolyvagin system (LV19 Thm 4.7) feed CGS v2 Theorem 6.5.1, which gives the divisibility (2.2).
- **(b) Removing the p-power ambiguity.** This uses the CGLS22 §3.3.1 constants: C₂ = 0 by CGLS22 Rem. 3.3.5, and C₁ = 0 by Cha05 Thm 2.
- **(c) One divisibility.** CH18 Theorem 5.7 and "the same global duality argument as in [BCK21, Thm. 5.2]" give (2.3).
- **(d) The other divisibility.** FW21 Theorem 4.41 gives (2.4) ("uses the µ = 0 result of [Hsi14, Thm. B]").
- **(e) The factorization.** "[FO12, Cor. 7.2.1]" writes L^Gr_p(g) as h_K × Katz × Hida's Rankin series. Then "the same calculation as in [CGS23, Prop. 1.4.5]" together with JSW17 Cor. 3.4.2 and Thm. 6.1.6 gives (2.5).

**Lemma 2.2** (no proper finite-index submodules) cites Greenberg 2016, HL19 Lemma 3.12 and Ski16 Proposition 2.3.3(ii).

**Theorem 1.1** then follows "the approach in [Ski16, §3.1]":
- Hida-family congruent forms g_m (Ski16 §2.6), with the congruence of p-adic L-functions from Cas20 Theorem 2.11;
- Fitting ideal = characteristic ideal (Lemma 2.2);
- the argument of Ski16 p. 192, with the nonvanishing from Cornut–Vatsal and Cas20 Theorem 5.3 (or BCK21 Corollary 4.5);
- footnote 1: Ski20 Lemma 2.8.1, and "rigidity of automorphic types [FO12, Lem. 2.14]".

### Mistakes found in the erratum (for the source-issue register; to be recorded with `known: new`)
1. **A citation that does not exist.** "[FO12, Cor. 7.2.1]" is not in FO12. The author copy (https://www.math.titech.ac.jp/top/~ochiai/ControlF-O.pdf, 24 pp., PDF dated 5 December 2010) has §§1–4 only; its Lemma 2.14, "Rigidity of automorphic types", matches the erratum's other citation. The statement the erratum describes is FW21 v3 **Corollary 7.21**: "L^Hida_{f⊗g} · L^Katz_K · h_K = L^Gr_K(f)", together with Lemma 7.22 (integrality). Correction: [FW21, Cor. 7.21].
2. **A misprint.** In the proof of Theorem 2.3, "under hypothesis (i) one may take C₂ = 0" follows the sentence that already gives C₂ = 0 and is about C₁. Correction: C₁ = 0.
3. **A misprint.** Theorem 2.3(iv) reads "the local component π(f)_ℓ"; it should read π(g)_ℓ.
4. **A gap in scope.** The erratum applies CGS Theorem 5.5.1 (v2 6.5.1) to T_g for a weight-k form g. CGS state §6 for T = T_pE ⊗ R(α) of an elliptic curve, under E(K)[p] = 0 (the opening paragraph of v2 §6), and the erratum only says "in the same way". The extension to T_g, with the constants C₁ = C₂ = 0 under residual irreducibility, is an obligation of this plan, not an import. affects: the proof. The mathematics is expected to go through: CGS's argument is Kolyvagin-system linear algebra over R, and the error terms vanish under irreducibility.

### Fix
1. **`content/campaign/RankZeroOneBSD/README.md`, BSD.6a.** Replace "For the multiplicative branch prove Castella's corrected anticyclotomic Theorem 1.1:" with:
   > For the multiplicative branch prove Theorem 1.1 of Castella's erratum (web.math.ucsb.edu/~castella/Birch-erratum.pdf, 2024) to *On the p-part of the Birch–Swinnerton-Dyer formula for multiplicative primes*, Camb. J. Math. 6 (2018) 1–23 (arXiv:1704.06608); it replaces that paper's Theorem 4.4, and Theorem A′ replaces its Theorem A. The hypotheses are: E/Q with multiplicative reduction at p > 3;

   The existing list of hypotheses follows unchanged.
2. **The same README.** Replace "The corrected multiplicative proof consumes GeneralizedHeegnerCycles GH.2–7: CH (4.7), §5.2 and Theorems 5.7/6.1, LV Theorem 4.7 and Cas Theorems 2.11/5.3." with:
   > The corrected multiplicative proof (the erratum's Theorem 2.3, for p-ordinary g of weight k ≥ 2 and level M with p ∤ M, then Theorem 1.1) consumes:
   > - **(i) GH classes and laws.** GeneralizedHeegnerCycles GH.2–7: CH (4.7), §5.2 and Theorems 5.7/6.1, LV Theorem 4.7, Cas (JIMJ 2020) Theorems 2.11/5.3.
   > - **(ii) The Kolyvagin bound.** RankZeroOneBSD BSD.7a's Castella–Grossi–Skinner Kolyvagin-system bound, arXiv:2303.04373v2 Theorem 6.5.1 (v1 Theorem 5.5.1) with its Theorem 6.1.1 for the prime (γ⁻−1). CGS state it for T_pE ⊗ R(α) with E(K)[p] = 0; prove here its extension to T_g ⊗ Λ for ρ̄_g|G_K irreducible, with the CGLS22 §3.3.1 constants C₁ = C₂ = 0 (CGLS22 Remark 3.3.5; Cha 2005 Theorem 2). The erratum asserts this extension without proof.
   > - **(iii) The equivalence.** HeegnerPointEulerSystems HE.8's abstract form of Burungale–Castella–Kim Theorem 5.2 (Heegner-point versus BDP divisibility, both directions), applied with CH Theorem 5.7.
   > - **(iv) The other divisibility.** AutomorphicCongruences L2's Fouquet–Wan Theorem 4.41 and Corollary 7.21: the factorization L^Gr_p(g) = h_K · L^Katz · L^Hida (the erratum cites it as "[FO12, Cor. 7.2.1]", which does not exist).
   > - **(v) The projection.** AutomorphicPadicLFunctions L3h's comparison CGS v2 Proposition 2.4.5 (v1 Proposition 1.4.5): the anticyclotomic projection of L^Gr_p generates the ideal of the BDP function. Prove its Σ-imprimitive form here, with JSW Corollary 3.4.2 and the Σ-independence of JSW Theorem 6.1.6.
   > - **(vi) No finite submodules.** The erratum's Lemma 2.2: Greenberg's no-finite-submodule theorem (SelmerIwasawaCohomology L3; RT-AREA-iwasawa-1/18) in its Σ-imprimitive anticyclotomic form, so that the characteristic ideal equals the Fitting ideal.
   > - **(vii) Constancy of local types.** Constancy of the local type at ℓ | M along the Hida family: Fouquet–Ochiai, Crelle 666 (2012), Lemma 2.14. Request it from the owner of the ordinary big Galois representation, OrdinaryAutomorphicFormsAndModularityLifting R21.3 (after RS-08). Here prove that it and the Hecke relation a_ℓ² = ℓ^{k−2} carry hypothesis (iii) of Theorem 1.1 to hypotheses (iii)–(iv) of Theorem 2.3.
   > - **(viii) The deduction of Theorem 1.1.** The anticyclotomic form of Skinner's §3.1 argument (Pacific J. Math. 283 (2016)), proved here:
   >   - congruent p-ordinary forms g_m of weight k_m ≡ 2 mod p−1 with T_{g_m}/p^m ≅ T/p^m (Hida theory, Skinner §2.6);
   >   - equality of p-adic L-functions mod p^m (Cas Theorem 2.11);
   >   - (Fitt(X^Σ_ac), p^m) = (L^Σ_p, p^m) for every m;
   >   - Skinner's p. 192 conclusion, using nonvanishing of L_p(f) (Cornut–Vatsal; HE.8).
3. **`content/campaign/HeegnerPointEulerSystems/README.md`, HE.8.** Insert as a new paragraph at the end of HE.8, immediately before `<a id="he-8b"></a>` (occurs once):
   > Prove Burungale–Castella–Kim's Theorem 5.2 (Algebra Number Theory 15 (2021), from Castella 2017 App. A) in the generality its consumers need. Take a lattice T in a conjugate-self-dual p-ordinary G_K-representation over Λ = O[[Γ⁻_K]], with p split in K and H⁰(G_K, T̄) = 0, and a class κ_∞ ∈ H¹_{F_ord}(K, T) whose localisation at p̄ is related to a nonzero p-adic L-function L_p by an explicit reciprocity law. Then (i) and (ii) are equivalent, and so are their opposite divisibilities:
   > - (i) S and X have Λ-rank one and Char(X_tors) ⊃ Char(S/Λκ_∞)²;
   > - (ii) S_{0,∅} and X_{∅,0} are Λ-torsion and Char(X_{∅,0}) ⊃ (L_p)² in Λ^ur.
   >
   > This is a Poitou–Tate comparison, not a main-conjecture proof. HE.8b applies it for weight-two E (BCS Theorem 4.2.1(b)); RankZeroOneBSD BSD.6a applies it for weight-k g with Castella–Hsieh's Theorem 5.7.
4. **`content/campaign/AutomorphicPadicLFunctions/README.md`, L3h.** Insert after "Assuming μ=0 is not a substitute for its proof." (occurs once):
   > For F = ℚ also prove Castella–Grossi–Skinner's comparison (arXiv:2303.04373v2, Proposition 2.4.5; v1 Proposition 1.4.5): for p split in K, the anticyclotomic projection of L^Gr_p(f/K) := h_K · L_v(K)⁻ · L_p(f/K, Σ^{(2′)}) generates the same ideal of Λ^{−,ur}_K as the BDP function. This is a comparison of interpolation formulas with Dirichlet's class number formula. It uses Katz's function (L3) and Hida's Rankin–Selberg function against the CM family; the owner of the latter is requested in RT-AREA-iwasawa-1/26. Export it with Theorem B to AutomorphicCongruences L5a (BCS Proposition 4.2.2), HE.8b, RankZeroOneBSD BSD.6a and BSD.7a.
5. **BSD.6a's Dependencies line.** Replace "**Dependencies:** BSD.2–BSD.5; GrossZagierAndArithmeticHeights GZ.9; HeegnerPointEulerSystems HE.6–HE.8; GeneralizedHeegnerCycles GH.2–GH.7; AutomorphicCongruences L2; AutomorphicPadicLFunctions L3h/L4e; ModularIwasawaMainConjectures L0/L4 for signed local conditions and the Kobayashi comparison via PadicHodgeRegulators L4; SelmerIwasawaCohomology L3–L4 for control, not a second signed-condition definition." with:
   > **Dependencies:** BSD.2–BSD.5; BSD.7a for the Castella–Grossi–Skinner Kolyvagin-system bound (not its Eisenstein conclusions); GrossZagierAndArithmeticHeights GZ.9; HeegnerPointEulerSystems HE.6–HE.8 (HE.8 for the Burungale–Castella–Kim equivalence); GeneralizedHeegnerCycles GH.2–GH.7; AutomorphicCongruences L2 (Fouquet–Wan Theorem 4.41, Corollary 7.21); AutomorphicPadicLFunctions L3h (Hsieh's Theorem B; CGS Proposition 2.4.5)/L4e; KatoEulerSystems L4–L5 (L5: the BSTW ordinary zeta element and comparison); ModularIwasawaMainConjectures L0/L4 for signed local conditions and the Kobayashi comparison via PadicHodgeRegulators L4; SelmerIwasawaCohomology L3–L4 for control and Greenberg's no-finite-submodule theorem, not a second signed-condition definition; OrdinaryAutomorphicFormsAndModularityLifting R21.3 for the constancy of local types.
6. **BSD.7a's Dependencies line.** Replace "**Dependencies:** BSD.5; HeegnerPointEulerSystems HE.8; GrossZagierAndArithmeticHeights GZ.9; ModularIwasawaMainConjectures; SelmerIwasawaCohomology; PadicFamilies; EulerSystemsAndKolyvaginSystems ES.4 and ES.8." with the same line plus "; AutomorphicPadicLFunctions L3h (CGS Proposition 2.4.5)". Append to BSD.7a's text:
   > Export CGS Theorems 6.1.1 and 6.5.1 as stated (for T_pE ⊗ R(α)) to BSD.6a.
7. **`content/campaign/RankZeroOneBSD/README.md`, source contracts (line 145).** Replace "[Castella's erratum](https://web.math.ucsb.edu/~castella/Birch-erratum.pdf) Theorem A′." with:
   > [Castella's erratum](https://web.math.ucsb.edu/~castella/Birch-erratum.pdf) Theorems 1.1 and A′, correcting Castella, Camb. J. Math. 6 (2018) 1–23 (arXiv:1704.06608), Theorems 4.4 and A.
8. **`data/atlas.json`.**
   - Add RankZeroOneBSD:BSD.7a to BSD.6a's `requires` and BSD.6a to BSD.7a's `consumers`, with the stageEdges record {BSD.7a → BSD.6a}.
   - Add AutomorphicPadicLFunctions:L3h to BSD.7a's `requires`, with the record {L3h → BSD.7a}.
   - **Cycle tests**, cumulative with /30 and /31: BSD.7a → BSD.6a is acyclic (no path BSD.6a → BSD.7a). L3h → BSD.7a is acyclic (no path BSD.7a → L3h). HE.8, AC L2, L3h, SIC L3 and R21.3 are already ancestors of BSD.6a.
9. **Audit (merged, AUDIT-27, layer BSD.6a).** The target "Castella's corrected anticyclotomic Theorem 1.1 and its congruence/control proof" stays, marked absent. Its note gains: "Source: Castella, Camb. J. Math. 6 (2018), with the 2024 erratum (Theorems 1.1, 2.3, A′)."

### Not done, and why
- **BCK21 Theorem 5.2 goes to HE.8, not HE.8b.** The red team assigned it to HE.8b. It is an equivalence proved by Poitou–Tate duality from a reciprocity law and assumes no main conjecture. Placing it in the early HE.8 serves all its users without new edges: BCS Theorem 4.2.1(b) in HE.8b, and the erratum in BSD.6a. It also avoids the edge HE.8b → BSD.6a, which would make the multiplicative branch wait on BCS's anticyclotomic endpoint. HE.8 → BSD.6a and HE.8 → HE.8b already exist.
- **The erratum's "FO12 factorization" goes to AC L2, not AC L5a.** The red team put it in L5a, which "constructs Rankin/Katz factors". The cited corollary does not exist in FO12 (source issue 1). The statement is Fouquet–Wan Corollary 7.21, which belongs with FW's own construction of L^Gr in AutomorphicCongruences L2. L2 is already a supplier of BSD.6a, so no edge is needed.
- **CGS Proposition 2.4.5 goes to L3h, not BSD.7a.** The red team treats it as owned by BSD.7a. It is an interpolation identity with no Eisenstein content, and AC L5a (BCS Proposition 4.2.2, /29) and HE.8b (BCS Theorems 1.2.2/1.2.4) need it as well. L3h is already upstream of L5a, HE.8b and BSD.6a, and gains an edge to BSD.7a. Giving it to BSD.7a would have forced the cyclotomic BCS chain (L5a → L5b) to wait on the Eisenstein main conjecture. CGS Theorems 6.1.1/6.5.1 stay with BSD.7a, as the red team proposed.
- **Skinner's §3.1 argument is not given a separate owner.** Its anticyclotomic form is proved in BSD.6a (edit 2 (viii)). Its commutative-algebra step is Krull intersection over Λ. The cyclotomic Skinner Theorem A for p ∥ N is RT-AREA-iwasawa-1/4's new ModularIwasawaMainConjectures layer, and BSD.6a does not use it.
- **Integrality of the two-variable L^Gr** (CGS Lemma 2.4.4, which uses Hida–Tilouine Theorem 0.3 and Rubin's main conjecture) is not needed for the anticyclotomic identity used here. It is recorded under /29.

## /16 (medium, missing): GZ.5 owns nonnegativity of central values L(1/2, π ⊗ χ) ≥ 0, and BSD.5's positivity is derived from it

### What the verifier corrected
- **Confirmed without correction.**
  - No stage supplies nonnegativity of the central value for quadratic twists.
  - The alternatives do not give it: modular symbols give rationality, and the Gross–Zagier and Waldspurger formulas control only products or twisted values.
  - Without it the positivity of the defect is not available, and BSD.8's deduction from vanishing valuations does not close.

### State on main (45d60f04)
- **BSD.5** (`content/campaign/RankZeroOneBSD/README.md` line 71): "Prove the rationality and positivity of L*(E,1)/(Ω_E Reg_E) in analytic ranks 0 and 1: use modular-symbol rationality at rank zero and the Gross–Zagier/period/index comparison at rank one."
  - Its Dependencies line (line 75) names GZ.0, GZ.3 and GZ.8, and not GZ.5.
  - The handoff row (line 154) says "Prove the defect is a positive rational number".
  - Accepted RS-30 keeps in BSD.5 "Rationality and positivity of the actual normalized leading term in ranks zero and one".
- **BSD.8** (line 126) starts "For the positive nonzero rational BSD defect …".
  - The BSD.8 checkpoint `research/blueprint/packets/RankZeroOneBSD--BSD.7.json` (#2951, 26 September) takes positivity as a hypothesis supplied by BSD.5. Node `BSD.8/elliptic-endpoint` reads "Let d_E be the strictly positive rational defect constructed by BSD.5".
  - Its gap "BSD.5 actual positive rational defect interface" leaves the provider open. Nothing there supplies the sign.
- **GZ.5** (`content/campaign/GrossZagierAndArithmeticHeights/README.md` line 75) establishes the Waldspurger toric period formula.
  - The integrated node `GZ.5/waldspurger-period-formula-and-its-siegel-weil-proof` states YZZ Thm. 1.4: P_χ(f₁)P_{χ⁻¹}(f₂) = [ζ_F(2)L(1/2,π,χ)/(8L(1,η)²L(1,π,ad))]·α(f₁⊗f₂), with L(s,π,χ) the base change to E twisted by χ.
  - For χ trivial on E = ℚ(√d), L(1/2,π_E) = L(1/2,π)L(1/2,π⊗η_E). So the toric formula controls only a product, as the finding says.
- **MetaplecticAutomorphicForms:MP.7** exists: "Half-integral weight, metaplectic Fourier coefficients and twists".
  - Its text compares adelic genuine forms with classical half-integral-weight forms and defines the Bump–Friedberg–Hoffstein kernels.
  - It does **not** plan the Shimura–Waldspurger correspondence or Waldspurger's coefficient formula. A search of every stage description in the assembled atlas for "Shimura correspondence", "Shimura lift", "Kohnen", "Lapid" and "relative trace formula" finds none. GZ.5 already requires MP.6.
- **Libraries at the pins.**
  - Mathlib `WeierstrassCurve.LSeries` (`Mathlib/AlgebraicGeometry/EllipticCurve/LFunction.lean:84`) is the Dirichlet series of the Euler product, with no continuation or central value.
  - Tau Ceti's `TauCeti/NumberTheory/LSeries/Positivity.lean` concerns series with nonnegative coefficients, which a_p(E) are not.
  - No positivity of central values exists in either library.
- **Sources read.**
  - Lapid–Rallis, Ann. of Math. 157 (2003) 891–917. The abstract (https://annals.math.princeton.edu/2003/157-3/p05, read 29 September 2026) says: "Let π be a cuspidal generic representation of SO(2n+1, A). We prove that L(1/2, π) ≥ 0." For n = 1, SO(3) ≅ PGL₂, the dual group is SL₂(ℂ), and the standard L-function is L(s,π) of π on PGL₂. Every cuspidal π of PGL₂ is generic.
  - Guo, Duke Math. J. 83 (1996): only the Crossref record (doi:10.1215/S0012-7094-96-08307-6) was read. The Project Euclid page did not serve the text.
  - Waldspurger 1981 and 1991 were not read.
- **Disclosure.** KOLYVAGIN-90 (this session's extraction) routes Gross's Conjecture 1.2 and the 37a example to BSD.5/BSD.9 (route 5). This finding does not concern those items, and the fix follows the verifier only.

### The mathematics, checked
- **Twists stay on PGL₂.** For π cuspidal on PGL₂(A_ℚ) and χ quadratic, π ⊗ χ has central character χ² = 1, so it is again cuspidal on PGL₂. It is therefore enough to prove L(1/2, π) ≥ 0 for all such π, and the twisted statement follows.
- **Finite and completed values have the same sign.** At s = 1/2 the archimedean factor is a positive real: Γ_ℂ(s + (k−1)/2) for discrete series of weight k. The ramified factors are 1 or (1 ∓ p^{−1})^{−1}. The unramified factors are (1 − λ_p p^{−1/2} + p^{−1})^{−1} ≥ (1 + p^{−1/2})^{−2} > 0, by Deligne's bound for the holomorphic weight-two forms consumed here. So the finite and completed L-values have the same sign.
- **Rank zero.** L(E,1) = L(1/2, π_E) ≥ 0, and L(E,1) ≠ 0, so L(E,1) > 0.
- **Rank one.**
  - BSD.3 chooses K (through BSD.2) with L(E^K,1) ≠ 0, so L(E^K,1) > 0 by the node.
  - Gross–Zagier (GZ.8) gives L′(E/K,1) = L′(E,1)·L(E^K,1) = c·ĥ(y_K), with c > 0 and ĥ(y_K) ≥ 0.
  - Hence L′(E,1) ≥ 0. Since the analytic rank is one, L′(E,1) > 0.
- **The denominator.** Ω_E > 0, and Reg_E > 0 by positive definiteness modulo torsion (GZ.0 fixes the power of two). So L*(E,1)/(Ω_E Reg_E) > 0.
- **The Waldspurger route needs a nonvanishing choice.** The half-integral-weight route gives |c(|D|)|² = (positive constant)·L(1/2, π ⊗ χ_D)·(product of local factors). This yields a sign only when the local factors at the chosen data are nonzero. The node must therefore choose, for each χ, admissible local data (level, sign and quaternion data) with nonzero local factors. An identity with a vanishing local factor gives 0 = 0.

### Fix
1. **`content/campaign/GrossZagierAndArithmeticHeights/README.md`, GZ.5.** After "Export the explicit split, ramified and definite-quaternionic specializations needed by Euler-system and level-raising consumers." (line 75, checked by script: occurs once), insert the paragraph:
   > Prove nonnegativity of central values. For every cuspidal automorphic representation π of PGL₂(A_ℚ) and every quadratic or trivial Hecke character χ, L(1/2, π ⊗ χ) ≥ 0. This holds for the finite L-function, and equivalently for the completed one: π ⊗ χ is again on PGL₂, and the archimedean and finite local factors at s = 1/2 are positive reals. Prove it by one of three routes:
   > - (a) Waldspurger's Shimura-correspondence formula |c(|D|)|² = (positive constant)·L(1/2, π ⊗ χ_D)·(local factors). It goes through the theta correspondence between PGL₂ and the metaplectic cover of MetaplecticAutomorphicForms MP.0–MP.6 and the half-integral-weight Fourier coefficients of MP.7. For each χ, choose local data at which every local factor is nonzero; an identity whose local factor vanishes carries no sign.
   > - (b) Guo's relative trace formula (Duke Math. J. 83, 1996).
   > - (c) Lapid–Rallis (Ann. of Math. 157, 2003) for n = 1, through SO(3) ≅ PGL₂.
   >
   > The toric period formula above gives only L(1/2, π)·L(1/2, π ⊗ η_K) ≥ 0 and does not suffice. Export the result to RankZeroOneBSD BSD.5.
2. **Same stage, Dependencies (line 77).** "**Dependencies:** GZ.3–GZ.4; AutomorphicFormsOnReductiveGroups AF.1–AF.5; AutomorphicSpectralTheory AS.1–AS.4; AutomorphicLFunctionsAndLocalFactors AL.0–AL.3." → "**Dependencies:** GZ.3–GZ.4; AutomorphicFormsOnReductiveGroups AF.1–AF.5; AutomorphicSpectralTheory AS.1–AS.4; AutomorphicLFunctionsAndLocalFactors AL.0–AL.3; MetaplecticAutomorphicForms MP.7 for the half-integral-weight route to nonnegativity." This is needed only if route (a) is chosen. The blueprint job that picks (b) or (c) drops it and names that route's supplier.
3. **`content/campaign/RankZeroOneBSD/README.md`, BSD.5, line 71.** Replace "Prove the rationality and positivity of L*(E,1)/(Ω_E Reg_E) in analytic ranks 0 and 1: use modular-symbol rationality at rank zero and the Gross–Zagier/period/index comparison at rank one." (checked: occurs once) with:
   > Prove the rationality of L*(E,1)/(Ω_E Reg_E) in analytic ranks 0 and 1: use modular-symbol rationality at rank zero and the Gross–Zagier/period/index comparison at rank one. Prove its positivity from GrossZagierAndArithmeticHeights GZ.5's nonnegativity L(1/2, π ⊗ χ) ≥ 0.
   > - At rank zero, L(E,1) = L(1/2, π_E) is nonnegative and nonzero.
   > - At rank one, take the K of BSD.3 with L(E^K,1) ≠ 0, so L(E^K,1) > 0. GZ.8 gives L′(E,1)·L(E^K,1) = L′(E/K,1) = (positive constant)·ĥ(y_K) ≥ 0, hence L′(E,1) > 0.
   > - Ω_E > 0 and Reg_E > 0.
   >
   > Positivity depends on GZ.5. Modular symbols and the Gross–Zagier formula alone give only rationality and the sign of a product.
4. **Same stage, Dependencies (line 75).** "GrossZagierAndArithmeticHeights GZ.0, GZ.3, GZ.8" → "GrossZagierAndArithmeticHeights GZ.0, GZ.3, GZ.5 (nonnegativity of central values), GZ.8". The rest of the line is unchanged; other findings may edit the same line, and the edits are cumulative.
5. **`data/atlas.json`.**
   - Add `GrossZagierAndArithmeticHeights:GZ.5` to BSD.5's `requires`, and the stageEdges record GZ.5 → RankZeroOneBSD:BSD.5.
     - GZ.5 already reaches BSD.5, but only incidentally, through GZ.5 → BSD.2 → BSD.3 → BSD.5 (twist nonvanishing). The direct edge records the import.
     - Cycle test for GZ.5 → BSD.5: acyclic (no path BSD.5 → GZ.5).
   - For route (a): add `MetaplecticAutomorphicForms:MP.7` to GZ.5's `requires`, and the stageEdges record MP.7 → GZ.5.
     - Cycle test for MP.7 → GZ.5: acyclic (no path GZ.5 → MP.7). MP.7's only requirement is MP.6, which GZ.5 already requires.
6. **Packets.** The GZ.5 node belongs to a future GrossZagierAndArithmeticHeights checkpoint. It is `GrossZagierAndArithmeticHeights:GZ.5/central-value-nonnegativity`, kind theorem, with prerequisites GZ.5's Waldspurger node and MP.7 (route a).
   - Its acceptance tests:
     - it is stated for the finite and the completed L-function;
     - it covers χ trivial;
     - a non-example shows the toric product formula alone does not give the sign;
     - route (a) must exhibit, for every χ, data with nonzero local factors.
   - The BSD.8 checkpoint needs no change: it already takes positivity from BSD.5.

### Not done, and why
- **No route is chosen here.** Waldspurger 1981/1991 and Guo 1996 were not read, so route (a)'s exact local-factor statement and route (b)'s hypotheses are left to the blueprint job, which must read them. Lapid–Rallis is recorded only from its abstract.
- **BSD.8 is not edited.** It consumes BSD.5's positive defect, and the finding's fix places the input in GZ.5 and BSD.5.

## /17 (medium, missing): GZ.3 proves the integrality and p-integrality of the Manin constant, with its transfer across the isogeny class and to the twist

### What the verifier corrected
- **Confirmed without correction.**
  - No atlas stage plans the p-integrality of the Manin constant. GZ.3 constructs Manin constants only as comparison quantities, and neither library has one.
  - Without it, a p-part formula stated with the Néron period follows only up to that constant.

### State on main (45d60f04)
- **GZ.3** (`content/campaign/GrossZagierAndArithmeticHeights/README.md` line 53) ends "Construct differential pullbacks and Manin constants as comparison quantities with exact isogeny functoriality; never assume the Manin constant is universally one." Its Dependencies line is line 55. There is no GZ.3 node in the integrated decomposition about Manin constants; its one GZ.3 node is the ξ-normalised realisation.
- **The consumers, as they stand.**
  - BSD.6's JSW bullet (`content/campaign/RankZeroOneBSD/README.md`, BSD.6, first bullet) and its line 88: "Prove the auxiliary-field selection, p-adic logarithm identity, period/degree and local-factor comparisons, then match the two bounds."
  - BSD.7a (line 117) owns the CGS/Keller–Yin Eisenstein main-conjecture proofs.
  - ModularIwasawaMainConjectures L3 (`content/campaign/ModularIwasawaMainConjectures/README.md` line 76): "Construct the analytic L-function using R10 and the curve's modular form, and prove the comparison of canonical periods and lattices." L3 has no Dependencies line.
- **Graph.** GZ.3 is already an ancestor of BSD.6, BSD.6a and BSD.7a, directly through BSD.5, which requires GZ.3.
  - It reaches MIMC L3 only along GZ.3 → GZ.9 → HE.8b → AC L5b → AC L5 → MIMC L3. That path is incidental, and /31 of this report changes L5b's requirements.
  - GZ.3's ancestors already include FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1–R07.6 (Raynaud's theorem is R07.1), NeronModelsAndSemistableAbelianVarieties R11.1–R11.6 and ModularCurvesPartII R14.6. These are the inputs of the geometric proofs.
- **Libraries at the pins.**
  - `manin` occurs in Mathlib 082e2d3 only in `Mathlib/RingTheory/WittVector/Isocrystal.lean` (Dieudonné–Manin).
  - It occurs in no Tau Ceti f790474 file, and in no declaration name in declarations.tsv. The Manin constant is absent.
- **Packets.** No GZ packet plans GZ.3. The BSD.8 checkpoint (#2951) does not mention Manin constants.
- **Audit.** AUDIT-25 (merged), GZ.3 target "Differential pullbacks and Manin constants, with exact isogeny functoriality": "Manin constants are absent."
- **Sources read.**
  - JSW, arXiv:1512.06894v1 (SHA-256 908562ef…7d49d), Remark 7.3.3: "The comparison between the periods Ω_E of Ω_{E^D} of the elliptic curves and Ω_f^+ and Ω_{f_K}^+ is often done in terms of what is known as the Manin constants, as explained in [GV00, §3]. It is known by a result of Mazur that if p ∤ 2ND, then p does not divide either of the Manin constants (see, e.g., [Jet08, §1])." §7.4: "where c_E ∈ Z is the Manin constant of E (so p ∤ c_E in this case; see Remark 7.3.3)". JSW's argument assumes ρ̄_{E,p} irreducible (§7.3, before (7.3.d)).
  - Česnavičius–Neururer–Saha, *The Manin constant and the modular degree*, arXiv:1911.09446v3 (SHA-256 4d76a0da…5448), §1:
    - "one knows that c_φ ∈ Z";
    - footnote 1: "To establish it, one reduces to the case Γ = Γ₁(N) and then uses q-expansions, see Lemma 6.5";
    - "The initial theoretical results on the Manin conjecture were based on exactness properties of Néron models and showed that p ∤ c_φ for those p > 2 at which E has semistable reduction, see [Maz78] (and [AU96], [ARS06] for some sharpenings)";
    - "The conclusion p ∤ c_φ was established for all primes p of semistable reduction for E by a different method in [Čes18]";
    - Theorem 1.2: c_φ | 6·deg(φ), and c_φ | deg(φ) for cube-free N.

### The mathematics, checked
- **Scope.** The p-integrality statement is about the X₀(N)-optimal curve E₀ and its minimal parametrisation φ₀.
- **Transfer across the isogeny class.** For another curve E in the class, choose a cyclic isogeny ψ : E₀ → E and use φ = ψ∘φ₀.
  - ψ extends to Néron models, so ψ*ω_E = u·ω_{E₀} with u ∈ ℤ. The dual isogeny gives u·u′ = ± deg ψ, so u | deg ψ.
  - Hence c_{φ} = ±u·c_{φ₀}, and v_p(c_φ) = v_p(c_{φ₀}) whenever p ∤ deg ψ.
- **When is p ∤ deg ψ automatic?** When E[p] is irreducible. A cyclic ψ of degree divisible by p has a ℚ-rational subgroup of order p in its kernel, and E₀[p] and E[p] have the same semisimplification. So the transfer holds in the JSW branch and in MIMC L3, where E[p] is irreducible.
- **It fails in the Eisenstein branch.** BSD.7a's E[p] is reducible, so the p-power factor u is a genuine term of Greenberg–Vatsal's period comparison and must be computed, not assumed away.
- **The twist E^D.** For p ∤ 2ND, E^D has good reduction at p. The semistable statement applies to the optimal curve of E^D's class, and the transfer applies because E^D[p] ≅ E[p] ⊗ χ_D is irreducible when E[p] is.
- **The range.** The node takes the range CNS attribute to Mazur and its sharpenings: odd p of semistable reduction. This contains JSW's p ∤ 2ND, MIMC L3's p > 3 good ordinary, and the multiplicative-p branches of BSD.6. p = 2 (Česnavičius 2018) is not needed by any consumer here and is left out.

### Fix
1. **`content/campaign/GrossZagierAndArithmeticHeights/README.md`, GZ.3, line 53.** After "Construct differential pullbacks and Manin constants as comparison quantities with exact isogeny functoriality; never assume the Manin constant is universally one." (checked by script: occurs once), insert:
   > For E/ℚ of conductor N with optimal parametrisation φ₀ : X₀(N) → E₀ onto the X₀(N)-optimal curve of its isogeny class, prove that the Manin constant c₀, defined by φ₀*ω_{E₀} = c₀·2πi f(z)dz for a Néron differential, is an integer (reduction to Γ₁(N) and the q-expansion principle). Prove that p ∤ c₀ for every odd prime p at which E has semistable reduction, in particular for every odd p ∤ N (Mazur 1978, with the sharpenings of Abbes–Ullmo 1996). For another curve E in the class, reached by a cyclic isogeny ψ : E₀ → E, prove c_E = ±u·c₀ with ψ*ω_E = u·ω_{E₀} and u | deg ψ. Deduce that v_p(c_E) = v_p(c₀) when E[p] is irreducible, since then p ∤ deg ψ. Apply this to the quadratic twist E^D for p ∤ 2ND, as JSW Remark 7.3.3 does. For reducible E[p] (the Eisenstein branch) keep u as an explicit factor of the period comparison. Before fixing the range, check the statement against the later sharpenings (Agashe–Ribet–Stein 2006, Česnavičius 2018, Česnavičius–Neururer–Saha).
2. **Same stage, Dependencies (line 55).** No new stage is needed: Raynaud's theorem (R07.1), Néron models (R11) and X₀(N) (R14.6) are already GZ.3 ancestors. Append "; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1 (Raynaud's uniqueness theorem, for the Manin-constant integrality)" so the import is named.
3. **`content/campaign/RankZeroOneBSD/README.md`, BSD.6, line 88.** Replace "Prove the auxiliary-field selection, p-adic logarithm identity, period/degree and local-factor comparisons, then match the two bounds." (checked: occurs once) with:
   > Prove the auxiliary-field selection, p-adic logarithm identity, period/degree and local-factor comparisons, then match the two bounds. The comparison of Ω_E and Ω_{E^D} with the modular periods imports GrossZagierAndArithmeticHeights GZ.3's p-integrality of the Manin constants of E and E^D (JSW Remark 7.3.3), not the assumption c_E = 1.
4. **Same file, BSD.7a, line 117.** Replace "State each construction's source theorem and hypotheses before using its equality to prove BSD.7." (checked: occurs once) with:
   > State each construction's source theorem and hypotheses before using its equality to prove BSD.7. The Greenberg–Vatsal period/Manin comparison used by CGS §4.1 imports GZ.3's Manin-constant integrality for the optimal curve; because E[p] is reducible here, the isogeny factor u of GZ.3 is computed, not assumed prime to p.
5. **`content/campaign/ModularIwasawaMainConjectures/README.md`, L3, line 76.** Replace "Construct the analytic L-function using R10 and the curve's modular form, and prove the comparison of canonical periods and lattices." (checked: occurs once) with:
   > Construct the analytic L-function using R10 and the curve's modular form, and prove the comparison of canonical periods and lattices, importing from GrossZagierAndArithmeticHeights GZ.3 the integrality of the Manin constant and its prime-to-p transfer across the isogeny class (E[p] irreducible, p > 3 good).
6. **`data/atlas.json`.**
   - Add `GrossZagierAndArithmeticHeights:GZ.3` to ModularIwasawaMainConjectures:L3's `requires`, and the stageEdges record GZ.3 → ModularIwasawaMainConjectures:L3.
   - Cycle test for GZ.3 → MIMC L3: acyclic (no path L3 → GZ.3 in the assembled graph).
   - BSD.6, BSD.6a and BSD.7a already require BSD.5, which requires GZ.3, so no stage edge is added for them. The import is named in their text (edits 3–4) and belongs in their packet nodes' prerequisites.
7. **Packets.** The node belongs to a future GZ checkpoint: `GrossZagierAndArithmeticHeights:GZ.3/manin-constant-integrality-and-p-integrality`, kind theorem.
   - Its acceptance test is a regression test: 11a3, a model of X₁(11), with its least-degree parametrisation from X₀(11) has c_φ = deg φ = 5 (CNS footnote 4). Here E[5] is reducible, and v₅ of the Manin constant changes along the isogeny class 11a, while the optimal curve 11a1 has c = 1.
   - BSD.6/6a/7a and MIMC L3 packet nodes list it as a prerequisite.

### Not done, and why
- **Mazur 1978, Abbes–Ullmo 1996, Agashe–Ribet–Stein 2006 and Jetchev 2008 §1 were not read.** The statement and range above rest on the CNS summary and JSW's Remark, both read. The blueprint job must read Mazur's Corollary and Abbes–Ullmo before fixing the attribution per range: Mazur for odd p ∤ N, Abbes–Ullmo for odd p ∥ N, as CNS's summary implies.
- **The p = 2 semistable case (Česnavičius 2018) is not planned.** No consumer here needs it.

## /18 (medium, missing): SelmerIwasawaCohomology L3 owns Greenberg's surjectivity and no-finite-submodule theorems; the Fitting-ideal identity is stated for one-variable Λ only

### What the verifier corrected
- Confirmed without correction. L3 plans Iwasawa cohomology and control but neither of Greenberg's structural theorems:
  - surjectivity of the global-to-local map defining the Selmer group over Q_∞;
  - absence of nonzero finite Λ-submodules in its dual, and in the Σ-imprimitive duals.
- The main-conjecture arguments of this area use both, where the finding says (Skinner's p ∥ N deduction; the anticyclotomic analogue in Castella's corrected Theorem 1.1).
- The second theorem is what turns a characteristic ideal into a Fitting ideal, so its absence is not cosmetic.

### State on main (45d60f04)
- **README unchanged.** `content/campaign/SelmerIwasawaCohomology/README.md`, L3 (lines 44–48), still has only "Prove control statements with explicit kernels/cokernels expressed through H^0, inertia and local quotient terms." and "Torsion of a global H^2 or a Selmer dual is **not** a default theorem for every T."
- **The SIC packet has grown, but does not cover this.** `research/blueprint/packets/SelmerIwasawaCohomology.json` gained checkpoint 3 (L3, #3898, 29 September) and checkpoint 4 (L4, #3909).
  - L3 now has seven nodes: `iwasawa-cohomology`, `iwasawa-shapiro`, `iwasawa-descent`, `iwasawa-torsion-criterion` (Nekovář 8.4.8.5, a statement about RΓ_cont, not about Selmer groups), `universal-norms-unramified`, `semilocal-cohomology`, `iwasawa-twist`.
  - A search of the packet for "finite submodule", "pseudo-null", "Fitting", "almost divisible" and "LNM" finds nothing. The nine hits for "surjectiv" are all in L0's completion nodes.
  - The L3 coverage record lists as remaining: "Control theorems for Selmer groups (Mazur, Greenberg) beyond the cohomological descent planned here."
- **The algebra it rests on is partly planned.** In `research/blueprint/packets/PadicMeasuresIwasawaAlgebras.json`:
  - node `PadicMeasuresIwasawaAlgebras:L4/projective-dimension-and-resolution` states "pd_Λ M ≤ 1 ⇔ … ⇔ M has no nontrivial finite Λ-submodule" (NSW 5.3.19);
  - node `L4/characteristic-ideal` defines char;
  - no node states Fitt₀ = char.
  - The PMIA README, L4 (line 68), asks only to "Explain that finite modules have unit characteristic ideal but can have nonunit Fitting ideal". Line 8 names IntegralHeckeAndGaloisDeterminants as the owner of generic Fitting algebra.
  - PMIA L4 is already an ancestor of SIC L3 in the assembled graph.
- **Atlas search.** Over the 2,840 assembled stages, no stage plans either theorem. The only "finite submodule" match is IntegralIwasawaTheory I.2 (class-group modules).
- **Libraries (Mathlib 082e2d3, Tau Ceti f790474).**
  - No declaration or file mentions a Fitting ideal of a module: the "Fitting" names in `declarations.tsv` are all Lie-algebra Fitting components. There is no pseudo-null module, no characteristic ideal and no Iwasawa module.
  - There is no Galois-cohomological Selmer structure in either library. Tau Ceti's `WeierstrassCurve.Affine.selmerGroup₂` (TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/SelmerGroup.lean:104) is the algebraic 2-descent group inside `W.M`, not a subgroup of H¹.
- **Consumers.** In the assembled graph SIC L3 already reaches BSD.6a and BSD.7a by direct edges.
  - It reaches BSD.6 only through BSD.6a.
  - It reaches ModularIwasawaMainConjectures L1 only through PadicFamilies L4 → AutomorphicCongruences L2.
- **This session's work.** The session's KOLYVAGIN-90 extraction has item `PAPER-KOLYVAGIN-90/r3-cor-5.17` ("No nonzero finite submodules in Z_∞ (Corollary 5.17, Greenberg)", Rubin III.5.17), marked `missing`. That paper has no review yet. The fix below follows the verifier only; the item edit is listed for the paper's review.

**Sources read for this fix** (29 September 2026):
- **Skinner**, *Multiplicative reduction and the cyclotomic main conjecture for GL₂*, arXiv:1407.1093v1, SHA-256 `02d176d8…a988`.
  - §2.3, p. 8: the Selmer group Sel^Σ_{Q∞,L}(f), with M = T_f ⊗ Λ_O^*.
  - Prop. 2.3.2: "Suppose k ≡ 2 (mod p − 1), ρ̄_f is irreducible, and X_{Q∞,L}(f) is a torsion Λ_O-module. The restriction maps (2.3.2) and (2.3.3) are surjective."
  - Prop. 2.3.3: "(i) X has no non-zero finite-order Λ_O-submodules. (ii) … X^Σ_{Q∞,L}(f) has no non-zero finite-order Λ_O-submodules."
  - Lemma 2.3.4: "(i) Ch^Σ_L(f) = Ch_L(f)·(∏_{ℓ∈Σ,ℓ≠p} P_ℓ(Ψ^{−1}ε^{−1}(frob_ℓ))). (ii) F^Σ_L(f) = Ch^Σ_L(f)."
  - Skinner says: "The ideas behind the proofs of these propositions are due to Greenberg".
- **Greenberg**, *Iwasawa theory for elliptic curves* (CIME 1997; LNM 1716 (1999) 51–144). Author's copy `CIME.ps` from the author's publications page, SHA-256 `ab35c11b…c3e3`; page numbers are those of that copy.
  - Lemma 4.6, p. 38: "Assume that Sel_E(F_∞)_p is Λ-cotorsion. Then the map H¹(F_Σ/F_∞, E[p^∞]) → P_Σ E(F_∞) is surjective."
  - Prop. 4.14, p. 53: "Assume that E is an elliptic curve defined over F and that Sel_E(F_∞)_p is Λ-cotorsion. Assume that E(F)_p = 0. Then Sel_E(F_∞)_p has no proper Λ-submodules of finite index."
  - Prop. 4.15, pp. 53–54: the same conclusion under either (i) additive reduction at some v₀ ∤ p, or (ii) some v₀ | p with e_{v₀} ≤ p − 2 and good ordinary or multiplicative reduction there.
- **Greenberg**, *On the structure of Selmer groups* (in *Elliptic curves, modular forms and Iwasawa theory*, PROMS 188, 2016). Author's copy `Sel.pdf`, SHA-256 `63bcdc99…f36f`.
  - §1 lists the five equivalent forms of "almost divisible", ending with "The Λ-module X has no nonzero, pseudo-null submodules."
  - Prop. 4.1.1 (p. 15) proves almost divisibility of S_L(K, D) over any Λ ≅ Z_p[[T₁,…,T_m]], under hypotheses RFX(D), LEO(D), LOC^{(2)}_v for all v ∈ Σ, LOC^{(1)}_η for some η, L almost divisible, CRK(D, L), and one of (a)–(c).
  - Corollary 4.1.2 gives the non-primitive (Σ₀-imprimitive) version.
  - §4.2, p. 21: for T = T_p(E), (b) holds iff E(K)[p] = 0.
  - SUR(D, L), the surjectivity, is imported from [Gr5], *Surjectivity of the global-to-local map defining a Selmer group* (listed there as a preprint), which was not read.

**The mathematics, checked.**
- **The Fitting identity is one-variable only.** For Λ = O[[T]], a finitely generated torsion module X with no nonzero finite submodule has pd_Λ X ≤ 1. This is Auslander–Buchsbaum, and it is the PMIA node above. So X has a square presentation 0 → Λⁿ → Λⁿ → X → 0, and Fitt₀(X) = (det) = char(X).
- **In several variables it fails.** Over Λ = O[[T₁,…,T_m]] with m ≥ 2, "no nonzero pseudo-null submodule" gives depth ≥ 1 but not pd ≤ 1, and Fitt₀ = char can fail.
- **So the finding's "finite (pseudo-null)" needs a qualification.** Finite = pseudo-null only for one variable. Greenberg 2016 proves the pseudo-null statement in general. The identity Fitt = char must be stated for Λ = O[[Γ]], Γ ≅ Z_p. That covers the cyclotomic case and Castella's one-variable anticyclotomic case.
- **The residual hypothesis differs by source**, and each must be kept:
  - Greenberg's elliptic version needs E(F)[p] = 0, or Prop. 4.15's alternatives. Irreducibility of ρ̄ implies E(F)[p] = 0.
  - Skinner's version for f needs ρ̄_f irreducible and k ≡ 2 (mod p − 1).

### Fix
1. **`content/campaign/SelmerIwasawaCohomology/README.md`, L3.** After "Prove control statements with explicit kernels/cokernels expressed through H^0, inertia and local quotient terms." (occurs once; script-checked) insert:
   > Prove Greenberg's structural theorems for Greenberg-type Selmer groups over a Z_p-extension F_∞/F, with discrete coefficients D = T ⊗ Λ^∨ and the Selmer group S_L defined as the kernel of φ_L : H^1(F_Σ/F, D) → ∏_{v∈Σ} H^1(F_v, D)/L_v. (a) Surjectivity: if the dual of S_L is Λ-torsion then φ_L is surjective, together with the Σ₀-imprimitive variants and the resulting identity char(X^{Σ₀}) = char(X)·∏_{ℓ∈Σ₀, ℓ≠p} P_ℓ, where P_ℓ is the local Euler factor of the twisted dual evaluated along Γ (Greenberg, LNM 1716, Lemma 4.6; Skinner arXiv:1407.1093, Prop. 2.3.2 and Lemma 2.3.4(i); in general Greenberg's 'Surjectivity of the global-to-local map defining a Selmer group', cited as [Gr5] in Greenberg 2016). (b) No nonzero finite submodules: under the stated residual hypothesis, the dual X of S_L and every Σ₀-imprimitive dual X^{Σ₀} have no nonzero finite Λ-submodule. For E/F the hypothesis is E(F)[p] = 0, implied by irreducibility of E[p], or one of the alternatives of Greenberg's Prop. 4.15. For a newform f it is ρ̄_f irreducible with Skinner's weight condition k ≡ 2 (mod p − 1) (Greenberg LNM 1716 Props. 4.14–4.15; Skinner Prop. 2.3.3). Over several variables, state Greenberg's almost-divisibility theorem, "no nonzero pseudo-null submodule", with its hypotheses RFX, LEO, LOC, CRK and (a)–(c) (Greenberg, *On the structure of Selmer groups*, 2016, Prop. 4.1.1 and Cor. 4.1.2). (c) For Λ = O[[Γ]], Γ ≅ Z_p only, deduce Fitt_Λ(X^{Σ₀}) = char_Λ(X^{Σ₀}) from (b) and the Λ-module lemma of PadicMeasuresIwasawaAlgebras L4 (Skinner Lemma 2.3.4(ii)). This identity is false in general over several variables, where no pseudo-null submodule does not give projective dimension one. Instantiate (a)–(c) for the cyclotomic Z_p-extension of Q and, through the Shapiro identification of L3, for the anticyclotomic Z_p-extension of an imaginary quadratic field.
2. **Same README, L4 `**Acceptance:**` line.** Append: "Greenberg's surjectivity and no-finite-submodule theorems of L3 are instantiated for elliptic curves with E(F)[p] = 0 and for ordinary newforms under Skinner's hypotheses; a test module shows Fitt ≠ char for a finite module, so the no-finite-submodule hypothesis is used."
3. **`research/blueprint/packets/SelmerIwasawaCohomology.json`** (for its next checkpoint).
   - Add three L3 nodes realising edit 1:
     - `SelmerIwasawaCohomology:L3/greenberg-surjectivity` (a);
     - `SelmerIwasawaCohomology:L3/no-finite-submodules` (b);
     - `SelmerIwasawaCohomology:L3/fitting-equals-characteristic` (c).
   - Their prerequisites are `L2/selmer-structure-poitou-tate`, `L3/iwasawa-shapiro`, `L3/iwasawa-descent` and `PadicMeasuresIwasawaAlgebras:L4/projective-dimension-and-resolution`.
   - Replace the L3 coverage item "Control theorems for Selmer groups (Mazur, Greenberg) beyond the cohomological descent planned here." with "Mazur's control theorem for Selmer groups beyond the cohomological descent planned here; Greenberg's structural theorems are nodes greenberg-surjectivity, no-finite-submodules and fitting-equals-characteristic."
4. **`research/blueprint/packets/PadicMeasuresIwasawaAlgebras.json`, `requests`.** Add a self-contained request from SIC L3 (no new edge: PMIA L4 is already an ancestor of SIC L3):
   > {"supplier": "PadicMeasuresIwasawaAlgebras:L4", "need": "For Λ = O[[T]] and X a finitely generated torsion Λ-module with pd_Λ X ≤ 1 (equivalently, no nonzero finite Λ-submodule; node projective-dimension-and-resolution), a square presentation 0 → Λ^n → Λ^n → X → 0 and Fitt₀_Λ(X) = char_Λ(X), using the generic Fitting ideal of IntegralHeckeAndGaloisDeterminants. Include a finite X with char = Λ ≠ Fitt₀.", "neededBy": ["SelmerIwasawaCohomology:L3/fitting-equals-characteristic"], "status": "open"}
5. **`data/atlas.json`: two export edges.**
   - Add `SelmerIwasawaCohomology:L3` to the `requires` of ModularIwasawaMainConjectures:L1 and of RankZeroOneBSD:BSD.6. Add both to SIC L3's `consumers`, with the stageEdges records {"source": "SelmerIwasawaCohomology:L3", "target": "ModularIwasawaMainConjectures:L1"} and {"source": "SelmerIwasawaCohomology:L3", "target": "RankZeroOneBSD:BSD.6"}.
   - BSD.6a and BSD.7a already require SIC L3.
   - Cycle test for SIC:L3 → MIMC:L1: acyclic (no path MIMC:L1 → SIC:L3 in the assembled graph).
   - Cycle test for SIC:L3 → BSD.6: acyclic (no path BSD.6 → SIC:L3).
6. **`research/blueprint/papers/PAPER-KOLYVAGIN-90.result.json`, item `r3-cor-5.17`** (for the paper's review; the paper has no review, so no route is in force).
   - `status` "missing" → "planned".
   - Add `planned`: ["SelmerIwasawaCohomology:L3"].
   - `note`: prefix "Planned in SIC L3 after RT-AREA-iwasawa-1/18 (no-finite-submodules). Rubin's hypothesis p ∤ ∏_{q|N}|E(Q_q)_tors| is the local variant of Greenberg's Prop. 4.15 route; E(Q)[p] = 0 is Greenberg's Prop. 4.14."

### Not done, and why
- **The finding's "finite (pseudo-null)" and its unqualified Fitting-ideal = characteristic-ideal identity are narrowed** to one-variable Λ (edit 1(c)). In several variables the identity is false in general, and Greenberg 2016 proves only the pseudo-null statement.
- **Greenberg's [Gr5] was not read.** The general surjectivity is cited only as the source Greenberg 2016 names. The elliptic and Skinner cases rest on the texts read above.
- **Exports to BSD.7a and BSD.6a need no new edge**: both already require SIC L3.

## /19 (medium, error): the edge PadicHodgeRegulators L1 → SelmerIwasawaCohomology L2 is removed; L4 keeps its Bloch–Kato input

### What the verifier corrected
- **Confirmed; the counts depend on the graph.** On the raw atlas, SIC L2 has 39 ancestors with the edge and 14 without it: the finding's "39 instead of 14".
- On the verifier's restructured graph the numbers are 77 and 45, and with the accepted link maps 97 and 65.
- **The substance holds in every graph.** PadicHodgeTheory R06.1/R06.2, PerfectoidSpaces P0, AInfCohomology AI.0 and CrystallineCohomology CR.0 enter a generic Selmer layer's ancestry only through this edge, and the layer's own text says it needs them only at L4.

### State on main (45d60f04)
- **The edge is in `data/atlas.json`.**
  - `SelmerIwasawaCohomology:L2` `requires` is `["PadicHodgeRegulators:L1", "SelmerIwasawaCohomology:L1"]` (README lines 38–43).
  - `PadicHodgeRegulators:L1` ("Bloch–Kato maps") has `SelmerIwasawaCohomology:L2` among its `consumers`.
  - The stageEdges record {"source": "PadicHodgeRegulators:L1", "target": "SelmerIwasawaCohomology:L2"} exists.
  - SIC L4 also requires PHR L1, and that is where the README puts it.
- **The README contradicts the edge.**
  - Line 10: "**Campaign dependencies:** … [PadicHodgeTheory](../PadicHodgeTheory/README.md) for L4 only."
  - Line 40, L2: "Finite Bloch–Kato conditions are added in L4 after R09 supplies the period rings; they are not an input to the earlier cohomology construction."
  - The accepted RS-08 narrows SIC L1 with "period-defined conditions remain in L4". It has no layer entry for L2; its owner entry makes L2 the owner of "Generic Selmer local-condition maps, kernel and mapping-fibre complex with H0 correction".
- **The newer SIC packet agrees with the README.** `research/blueprint/packets/SelmerIwasawaCohomology.json`, checkpoints of 28–29 September:
  - no L2 node lists PadicHodgeRegulators among its prerequisites;
  - the only PHR L1 prerequisite is node `SelmerIwasawaCohomology:L4/bloch-kato-condition`;
  - the packet's request to `PadicHodgeRegulators:L1` names only that L4 node.
- **Counts, recomputed at 45d60f04.**
  - Raw atlas: 39 with the edge, 14 without (the finding's numbers).
  - Assembled graph (`scripts/build.py`: accepted restructurings, link maps, decompositions and promoted blueprints): 122 with, 70 without. The 52 lost ancestors include PHR L0–L1, PadicHodgeTheory R06.1–R06.2, PerfectoidSpaces P0–P3, AInfCohomology AI.0, CrystallineCohomology CR.0, AdicSpacesPartII R0–R3 and several ModularCurves layers.
- **Who else loses PHR L1.** Among L2's consumers, these no longer reach PHR L1 after the removal:
  - ArithmeticGaloisDuality D8, R02.5 and R02.6;
  - EulerSystemsAndKolyvaginSystems ES.0;
  - EulerSystemsCyclotomicMainConjecture L1;
  - SelmerIwasawaCohomology L3;
  - GlobalGaloisDeformations G7 and G8.

  None of their texts uses a Bloch–Kato or finite local condition from PHR L1. R02.5's finite-flat, ordinary and fixed-type tangent conditions come from its own supplier LocalGaloisDeformationRings R08.6. HE.3, MotivicEtaleKTheory M.8, PHR KU-padicreg, PeriodsAndSpecialValues PS.3, Polylogarithms KU-realregulators and SIC L4 still reach PHR L1 by other paths.

### Fix
1. **`data/atlas.json`** (maintainer's removal).
   - Remove `"PadicHodgeRegulators:L1"` from SelmerIwasawaCohomology:L2's `requires`, which becomes `["SelmerIwasawaCohomology:L1"]` in the raw atlas.
   - Remove `"SelmerIwasawaCohomology:L2"` from PadicHodgeRegulators:L1's `consumers`.
   - Delete the stageEdges record {"source": "PadicHodgeRegulators:L1", "target": "SelmerIwasawaCohomology:L2"}.
   - Keep {"source": "PadicHodgeRegulators:L1", "target": "SelmerIwasawaCohomology:L4"}.
2. **The atlas extracts** `research/blueprint/atlas/roadmaps/SelmerIwasawaCohomology.json` and `PadicHodgeRegulators.json` are regenerated from the corrected atlas.
3. **README: no change.** Lines 10 and 40 already state the intended dependency, and the SIC README has no per-stage Inputs line to edit.
4. **The removal creates no orphan and no cycle.** SIC L2 keeps its assembled suppliers: SIC L1, ArithmeticGaloisDuality D7/R02.3/R02.4, and the Tau Ceti EllipticCurves Layer 7, LocalFieldsRamification Layer 4 and NumberFieldArithmetic Layer 5 links. PHR L1 keeps six consumers.

### Not done, and why
- **Nothing is left.** The SIC packet already has no L2 use of PHR L1, so it needs no edit.

## /20 (medium, duplicate): SelmerIwasawaCohomology L2 extends the Tau Ceti EllipticCurves Layer 7 Selmer structure instead of re-planning it; the link already exists, so only the texts change

### What the verifier corrected
- **Confirmed.** EllipticCurves Layer 7 plans Selmer structures on a general discrete Galois module, SIC does not cite it, and PROTOCOL §15 forbids re-planning a Tau Ceti roadmap.
- **An existing edge does not settle it.** That Layer 7 is an ancestor of SIC L2 by other routes does not discharge the duplication, because the duplicated plan stays in both texts.

### State on main (45d60f04)
- **The link the finding asks for is already accepted.**
  - `data/links/tauceti_TauCetiRoadmap_EllipticCurves.json` has {"source": "tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4", "target": "SelmerIwasawaCohomology:L2", "reason": "Ownership handoff for the overlapping finite/discrete Selmer specialization: use Layer 7's Selmer structure and kernel carrier, and prove the comparison with L2's local-condition maps and H0-qualified mapping-fibre cohomology. Compact/rational coefficients, topology, duals and Greenberg/lattice formulas remain L2 work.", "addedBy": "REV-LINK-tauceti_TauCetiRoadmap_EllipticCurves"}.
  - It was promoted on 21 September (d076d939), before the red team's baseline.
  - In the assembled graph SIC L2 therefore `requires` the Layer 7 id directly.
  - The finding's "neither SIC's prerequisites nor its edges mention EllipticCurves" is true of `data/atlas.json` and the README only.
- **Layer 7's text.** `content/tau-ceti/EllipticCurves/README.md`, Layer 7 (line 1213 onward): "Selmer theory is set up **for a general Galois module first**: a **Selmer structure** `𝓕` on a discrete `Gal(Kˢᵉᵖ/K)`-module `M` — local-condition subgroups `H¹_𝓕(K_v, M) ⊆ H¹(K_v, M)` for each place `v`, unramified at almost all `v` — with its Selmer group `Sel_𝓕(M/K) ⊆ H¹(K, M)` … Cohomology is taken with the coefficient module **forced discrete**, and the **first named milestone of this layer is the constructor** — `H^i` of a topological group acting with **open stabilisers** on a bare abelian group, defined by locally constant cochains".
- **The SIC README is unchanged.**
  - L2 (line 40) begins "Define local conditions as submodules or maps of complexes on the actual cohomology groups."
  - Line 42 has "For a finite extension F'/F define the Selmer group as the kernel of the global-to-local quotient map, with semilocal direct sums over all places above each v."
  - The dependency line 20 does not name EllipticCurves.
- **The SIC packet (28–29 September) still builds its own discrete carrier.**
  - Node `SelmerIwasawaCohomology:L2/selmer-data` defines generic module-level Selmer data with the hypothesis "the same API serves discrete (Tau Ceti), compact and rational coefficients".
  - Nodes `selmer-kernel` and `galois-selmer-group` build Sel on H¹(G_{K,Σ}, M) for M "discrete, compact or rational".
  - Its only Layer 7 request is for the elliptic finite-level Sel_{p^m}(E/F), Kummer maps and Ш (for `L2/elliptic-selmer-instance`), not for the general discrete-module structure.
- **The ownership records.**
  - Accepted RS-08 gives L2 "Generic Selmer local-condition maps, kernel and mapping-fibre complex with H0 correction", without mentioning Layer 7.
  - Accepted RS-30 gives Layer 7 "General elliptic Selmer/Sha and Kummer carriers and exact sequences".
  - The merged audit AUDIT-27 (`data/library-coverage.json`, SIC L2) lists Layer 7 among L2's duplicates: "exactly L2's first target".
- **Libraries.** Neither library has a Galois-cohomological Selmer structure. Tau Ceti's `WeierstrassCurve.Affine.selmerGroup₂` (TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/SelmerGroup.lean:104) and `IsDedekindDomain.selmerGroup` (TauCeti/RingTheory/DedekindDomain/SInteger/SelmerGroup/Basic.lean) are the algebraic K(S, n)-type groups of 2-descent, not a Selmer structure on H¹.

### Fix
1. **`content/campaign/SelmerIwasawaCohomology/README.md`, L2.** Replace "Define local conditions as submodules or maps of complexes on the actual cohomology groups." (occurs once; script-checked) with:
   > Import from the Tau Ceti EllipticCurves Layer 7 the Selmer structure on a discrete Galois module — local-condition subgroups H¹_𝓕(K_v, M) ⊆ H¹(K_v, M), unramified at almost all v — its Selmer group Sel_𝓕(M/K) and the locally-constant-cochain cohomology constructor for discrete coefficients; do not define a second discrete Selmer structure. Extend it here: define local conditions for compact T and rational V as submodules or maps of complexes on the actual continuous cohomology groups, prove their propagation between T, V and A = V/T, and prove that on A the extended structure agrees with Layer 7's Sel_𝓕(A/K).
2. **Same paragraph, the following sentence stays**: "Define unramified, strict, relaxed and Greenberg conditions separately." Greenberg's condition, which Layer 7 does not plan, remains L2's.
3. **Same README, line 20.** Replace "**Dependencies:** R01, ProfiniteCohomology, ClassFieldTheory, LocalFieldsRamification, GlobalNumberFields and the homological algebra already in Mathlib." (occurs once) with "**Dependencies:** R01, ProfiniteCohomology, ClassFieldTheory, LocalFieldsRamification, GlobalNumberFields, EllipticCurves Layer 7 (Selmer structures on discrete modules; imported by L2) and the homological algebra already in Mathlib."
4. **Line 42 keeps** the semilocal sums over F'/F, the Pontryagin dual and the mapping-fibre Selmer complex, which Layer 7 does not plan. Append one sentence: "For discrete coefficients the kernel is Layer 7's Sel_𝓕; the mapping-fibre complex is compared with it through its H^1."
5. **`research/blueprint/packets/SelmerIwasawaCohomology.json`** (next checkpoint).
   - **Node `L2/selmer-data`, `hypotheses[0]`.** Replace "The data are module-theoretic, so the same API serves discrete (Tau Ceti), compact and rational coefficients (ArithmeticGaloisDuality:R02.1)." with:
     > The data are module-theoretic. For discrete coefficients the instance is the Selmer structure of Tau Ceti EllipticCurves Layer 7 (imported, not redefined); compact and rational coefficients come from ArithmeticGaloisDuality:R02.1.
   - **Add a node** `SelmerIwasawaCohomology:L2/layer7-comparison`: "For a discrete G_{K,Σ}-module A and conditions L_v ⊆ H¹(K_v, A), the Selmer module of L2/galois-selmer-group equals Layer 7's Sel_𝓕(A/K) for the Selmer structure with H¹_𝓕(K_v, A) = L_v (unramified outside Σ), with Layer 7's discrete cohomology constructor and ArithmeticGaloisDuality R02.1's discrete comparison." Its prerequisites are `L2/galois-selmer-group` and the Layer 7 id.
   - **Add a `requests` entry** to `tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4`: "The Selmer structure 𝓕 on a discrete Gal(K^sep/K)-module M (local conditions unramified at almost all v), Sel_𝓕(M/K) ⊆ H¹(K, M), and the locally-constant-cochain H^i constructor for discrete modules, for L2/selmer-data and L2/layer7-comparison."
6. **`data/atlas.json`.** No edge to add. The accepted link map already supplies Layer 7 → SIC L2, and the assembled graph is unchanged.
7. **Tau Ceti.** No change: Layer 7 already says it is set up "so the same API later serves abelian varieties and other Kummer sequences".

### Not done, and why
- **The link itself is not re-added.** It has been in the accepted link map since 21 September, and its reason already states the handoff this fix writes into the texts.
- **RS-08's owner entry is left as it is.** "Generic Selmer local-condition maps, kernel and mapping-fibre complex" remains L2's for compact and rational coefficients and for the complex. Edit 1 limits it to extending Layer 7 on discrete modules.

## /21 (medium, duplicate): SelmerIwasawaCohomology L4 owns the Tate-twist Selmer dictionary, and EulerSystemsCyclotomicMainConjecture L3 imports it; the two new packets' mutual imports are untangled

### What the verifier corrected
- **Confirmed.** SIC L4 is not an ancestor of ESCMC L3 in any graph, so neither stage imports the other, while both plan the same identification with the same restrictions.
- RS-16 moved only the tower carriers to IntegralIwasawaTheory I.2 and left the comparison where it was.

### State on main (45d60f04)
- **Both READMEs are unchanged.**
  - `content/campaign/SelmerIwasawaCohomology/README.md`, L4 (line 52): "Recover R06's class-group and p-ramified modules from the Selmer groups of Tate twists, including the even-positive/odd-negative restrictions in RJW §13.5. Prove the plus/minus, Tate-dual and involution comparisons instead of suppressing them in the notation."
  - `content/campaign/EulerSystemsCyclotomicMainConjecture/README.md`, L3 (line 54): "Prove all equivalent even-character, odd-character/class-group and Tate-twisted Selmer formulations."
  - In the assembled graph ESCMC L3 requires ESCMC L2, IntegralIwasawaTheory L1 and I.2, PadicMeasuresIwasawaAlgebras L4 and L5, and two Tau Ceti layers. There is no path either way between SIC L4 and ESCMC L3.
- **Accepted RS-16** has the owner entry "Maximal abelian pro-p ramified/unramified tower carriers and general class-field comparison" → IntegralIwasawaTheory:I.2, formerly [IntegralIwasawaTheory:L1, SelmerIwasawaCohomology:L4]. No accepted proposal touches ESCMC L3.
- **Both roadmaps got packets on 29 September, after the red team.** Each now plans part of the dictionary, and they import each other at node level.
  - **SIC packet** (`research/blueprint/packets/SelmerIwasawaCohomology.json`, checkpoint 4, #3909):
    - `L4/tate-twist-greenberg-selmer` is the dictionary: H¹_{L^Gr}(F, W_n) = Hom_cts(X_∞^{c=(−1)^n}, W_n) for n ≥ 1, Hom_cts(Y_∞^{c=(−1)^n}, W_n) for n ≤ 0, and dual X_∞^+(−n) for even n > 0.
    - `L4/criticality` and `L4/greenberg-main-conjecture` (Conjecture 13.21 as propositions).
    - `L4/greenberg-conjecture-tate-twists` is the application. It has prerequisite `EulerSystemsCyclotomicMainConjecture:L3/cyclotomic-main-conjecture` and says "Conjecture 13.21(ii) for V is equivalent to the Iwasawa main conjecture (RJW Theorem 13.8), hence holds".
  - **ESCMC packet** (`research/blueprint/packets/EulerSystemsCyclotomicMainConjecture.json`, checkpoint 7, #3903):
    - `L3/tate-twisted-selmer-formulation` states the Tate-twisted formulation for every n. Its prerequisites include `SelmerIwasawaCohomology:L4` (stage level) and `SelmerIwasawaCohomology:L2/greenberg-condition`.
    - It requests §13.5.2 for every n from SIC L4.
    - For even n ≥ 2 it gives char(S_n^∨) = Tw_n(I(Γ^+)ζ_p) = Tw_n(I(Γ^+))·∂^nζ_p, and it records that ∂^nζ_p ∉ Λ(Γ^+).
  - **The result is a two-way dependency.** SIC L4 → ESCMC L3 through the ESCMC node, and ESCMC L3 → SIC L4 through the SIC node: a stage-level cycle waiting to happen at integration. The application is also stated twice.
- **The two statements are not equal, and the ESCMC one is right.**
  - I checked the twist: the Pontryagin dual of Hom_cts(M, W_n) is M(−n), so char(M(−n)) = Tw_n(char M).
  - Theorem 13.8 is char(X_∞^+) = I(Γ^+)ζ_p. Tw_n(ζ_p) = ∂^nζ_p has a pole at the character x^{−n}, so (∂^nζ_p) is not an integral ideal.
  - Hence "13.21(ii) with L_p(V) = ∂^nζ_p holds" is not literally true, while the ESCMC node's Tw_n(I(Γ^+))·∂^nζ_p is. Its p = 3 acceptance test (X_∞^+ = 0) separates the two.
  - The RJW extraction `research/blueprint/papers/PAPER-RODRIGUES-JACINTO-WILLIAMS-23.result.json` (29 September; no review yet) records the same thing. Item `/485` says the SIC node "repeats RJW's imprecision (the literal (ii) with L_p = ∂^nζ_p is false; see PAPER-RODRIGUES-JACINTO-WILLIAMS-23/E89)".
- **Audit.** The merged AUDIT-27 record for SIC L4 (`data/library-coverage.json`) lists duplicates MotivicEtaleKTheory M.8, PHR L1, MIMC L5 and APL L5, but not ESCMC L3.

### Fix
1. **`content/campaign/SelmerIwasawaCohomology/README.md`, L4.** After "Recover R06's class-group and p-ramified modules from the Selmer groups of Tate twists, including the even-positive/odd-negative restrictions in RJW §13.5." (occurs once) insert: "This layer is the single owner of this class-group/Tate-twist Selmer dictionary, with the criticality count and Greenberg's conjecture as propositions; EulerSystemsCyclotomicMainConjecture L3 imports it and translates its characteristic-ideal equality through it. No statement here assumes or re-proves the cyclotomic main conjecture."
2. **`content/campaign/EulerSystemsCyclotomicMainConjecture/README.md`, L3.** Replace "Prove all equivalent even-character, odd-character/class-group and Tate-twisted Selmer formulations." (occurs once) with:
   > Prove the equivalent even-character and odd-character/class-group formulations. For the Tate-twisted Greenberg Selmer formulation import SelmerIwasawaCohomology L4's identification of H¹_{Gr}(ℚ(μ_{p^∞})^+, (ℚ_p/ℤ_p)(n)) with the twisted class-group modules (RJW §13.5.2, with its parity restrictions) and translate the characteristic-ideal equality through it, keeping the augmentation factor: for even n ≥ 2 the ideal is Tw_n(I(Γ^+))·∂^nζ_p, not (∂^nζ_p). Do not re-prove the identification here.
3. **`data/atlas.json`.** Add `"SelmerIwasawaCohomology:L4"` to ESCMC:L3's `requires` and ESCMC:L3 to SIC:L4's `consumers`, with the stageEdges record {"source": "SelmerIwasawaCohomology:L4", "target": "EulerSystemsCyclotomicMainConjecture:L3"}. Cycle test for SIC:L4 → ESCMC:L3: acyclic (no path ESCMC:L3 → SIC:L4 in the assembled graph). The ESCMC packet node already assumes this edge.
4. **`research/blueprint/packets/SelmerIwasawaCohomology.json`** (next checkpoint).
   - Delete node `SelmerIwasawaCohomology:L4/greenberg-conjecture-tate-twists`. Its content is ESCMC's `L3/tate-twisted-selmer-formulation` part (b), stated there correctly, and its prerequisite on ESCMC L3 is the reverse edge that would close the cycle.
   - In node `L4/greenberg-main-conjecture`, test `even_twist`: replace "(greenberg-conjecture-tate-twists)" with "(proved in EulerSystemsCyclotomicMainConjecture:L3/tate-twisted-selmer-formulation (b), with the augmentation factor Tw_n(I(Γ^+)))".
   - In the L4 coverage `notes`, replace "its even-twist case from Theorem 13.8, and the Bloch–Kato condition" with "and the Bloch–Kato condition; the even-twist case of the conjecture is EulerSystemsCyclotomicMainConjecture L3's (RT-AREA-iwasawa-1/21)".
   - The node `L4/local-units-iwasawa-cohomology` keeps its prerequisites on ESCMC L0. These are compatible with the new edge, since ESCMC L0 is upstream of ESCMC L3.
5. **`research/blueprint/packets/EulerSystemsCyclotomicMainConjecture.json`.** No change. Its node already imports SIC L4, and its request to SIC L4 matches the SIC node `L4/tate-twist-greenberg-selmer` (which covers every n).
6. **`research/blueprint/papers/PAPER-RODRIGUES-JACINTO-WILLIAMS-23.result.json`** (for its review).
   - Item `/485`: `planned` ["EulerSystemsCyclotomicMainConjecture:L3", "SelmerIwasawaCohomology:L4"] → ["EulerSystemsCyclotomicMainConjecture:L3"]. Drop the note's sentence on the SIC node, which edit 4 deletes.
   - Item `/477` keeps both stages: SIC L4 proves the identification, and ESCMC L3 restates it on import.
7. **`data/library-coverage.json`, SIC:L4 `duplicates`** (merged audit AUDIT-27; the orchestrator's merge). Append {"layer": "EulerSystemsCyclotomicMainConjecture:L3", "note": "Resolved by RT-AREA-iwasawa-1/21: SIC L4 owns the Tate-twist Selmer dictionary; ESCMC L3 imports it (edge SIC:L4 → ESCMC:L3) and proves the twisted characteristic-ideal equality."}

### Not done, and why
- **Nothing in the finding is declined.** Edit 4 goes beyond it: the packets written after the red team would otherwise have made the edge a cycle.

## /22 (medium, error): FW Theorem 1.6 is proved by FW §4.8's U(3,1)/Beilinson–Flach route, owned by AC L2; AC L1 keeps only Skinner–Urban, with its two gaps recorded

### What the verifier corrected
- Confirmed without correction. The verifier's reason separates three errors in MIMC L1's paragraph:
  - the attribution of the weight lifting (it is Wan's Forum Math. Sigma 2015 paper, which only AC L5w plans);
  - the description of FW §4.8 as a "period refinement" of Skinner–Urban (it is a different proof);
  - the missing import of the paper that proves the lifting.
- The finding carries the AC-part fix to apply with it:
  - move the "FW Theorem 1.6 via §4.8" target out of AC L1 into AC L2, or into a substage after L2 that also requires KatoEulerSystems:L4, since L2 → L1 would close a cycle with L1 → L2;
  - amend the pending RS-11 owner entry;
  - re-examine the edge L1 → L2.

### State on main (45d60f04)
- **`content/campaign/ModularIwasawaMainConjectures/README.md`**, L1 (lines 43–51, unchanged since 15 September):
  - "FW explicitly modifies the cited SU statement by lifting a weight restriction and using a different period argument; the proof route is SU together with those specified refinements, not SU alone."
  - "R12 gives one divisibility and R15.L1–L2, with FW §4.8’s period refinement, gives the opposite divisibility; their combination proves the equality."
  - /14 (another section of this report) edits the hypothesis sentences of the same paragraph. The two sets of edits touch different sentences.
- **`content/campaign/AutomorphicCongruences/README.md`**, L1, line 32: "For the FW Theorem 1.6 target, follow FW §4.8’s refined argument that bypasses the unavailable general comparison of canonical and Gross periods. Prove the specific exponential/local-factor comparisons used there, and transfer to the same lattice and analytic function as R10/R12. Retain any powers-of-p ambiguity in versions of the theorem for which that argument does not remove it; do not introduce a blanket canonical-period/Gross-period equality as a convenient lemma."
- **Assembled graph.**
  - MIMC L1 requires AC:L1, AC:L2 and MIMC:L0. KatoEulerSystems:L4 reaches MIMC L1 through MIMC L0.
  - AC L2 requires AC:L1 and KatoEulerSystems:L3, but KatoEulerSystems:L4 is not an ancestor of AC L2, and AC L2 is not an ancestor of KatoEulerSystems:L4.
  - AC:L5w → MIMC:L1 would be acyclic.
- **Pending RS-11** (no review):
  - owner entry "SU/FW ordinary congruence reverse divisibility, including the source-specific integral-period refinement" → AC:L1;
  - layer reason for AC:L1 "Own the SU U(2,2) congruence/Selmer reverse bound and the FW ordinary period refinement on the actual lattice and analytic function";
  - layer reason for MIMC:L1 "Own the ordinary FW 1.6 equality assembled from KatoEulerSystems L4 and the SU/FW reverse bound of AutomorphicCongruences L1-L2".
- **AUDIT-23** (merged), AC L1 target 5: "FW §4.8's refined period argument: the exponential and local-factor comparisons transferred to the same lattice and analytic function as R10/R12, …".
- **Sources read** (29 September 2026):
  - FW arXiv:2107.13726v3, §1.1.1, p. 6:
    - "[117] has the supplementary assumptions k ≡ 2 mod p − 1, which was lifted by the second named author in [124]" ([124] = Wan, *The Iwasawa main conjecture for Hilbert modular forms*, Forum Math. Sigma 3 (2015) e18);
    - "to deduce the following result from [117], one would need an argument comparing the canonical period and the Gross period, which might not exist in the relevant literature … indications on how to reprove theorem 1.6 in a way that bypasses this issue are given in section 4.8."
  - FW §4.8, p. 68:
    - "The argument is similar as that of section 4.6 but much easier. We first choose an auxiliary quadratic field K in the same way and prove the two-variable Iwasawa-Greenberg Rankin-Selberg Main Conjecture over K … by reducing it to the Greenberg type main conjecture (theorem 7.32) via explicit reciprocity law for Beilinson-Flach elements and Poitou-Tate exact sequence. The details of this argument are given in [21, Theorem 3.8] (there the result is proved for weight 2 …). Then completely as above, we combine it with Kato's result to get full equality";
    - [21] = Castella–Wan, *The Iwasawa main conjectures for GL2 and derivatives of p-adic L-functions* (Adv. Math., to appear).
  - FW §4.6 is split into §4.6.2 "Proof of the Iwasawa Main Conjecture up to powers of p" and §4.6.3 "Powers of p". The latter starts from the known Kato divisibility and computes at one generic arithmetic point with the Beilinson–Flach family and the unramified direction Γ_v̄0 (pp. 61–62).
  - Castella–Wan arXiv:2001.03878v1 (the only arXiv version), §3.3, Theorem 3.8: "Assume that ρ_f|G_K is irreducible. Then the following are equivalent: (i) … = Char(Sel_Gr,∅/ I[[Γ_K]]·BF†) up to powers of p. (ii) … (iii) Char(X_Gr(K∞, A†_f)) = (tw_Θ⁻¹(L^Hi_p(f/K))) up to powers of p." Its Theorem 3.6 (Kings–Loeffler–Zerbes) supplies the Beilinson–Flach class BF† and the Coleman maps, citing [KLZ17] Prop. 8.1.7 and Thm. 10.2.2.
  - SU, author copy, p. 2, Theorem 1 (published Theorem 3.6.4): it assumes "χ = 1 and k ≡ 2 mod p − 1", irreducibility of ρ̄_f, "a prime q ≠ p such that q‖N and ρ̄_f is ramified at q", p ∤ N. The equality is in Λ ⊗ Q_p, and integral under the extra condition that the image of ρ_f contains SL₂(Z_p).
- **Checked mathematics.**
  - The route has an integrality point that the finding does not mention. Castella–Wan's Theorem 3.8 is stated only up to powers of p, while FW Theorem 1.6 is integral. §4.8 says the argument is "similar as that of section 4.6", and §4.6 treats powers of p separately (§4.6.3, which uses Kato's divisibility and Beilinson–Flach elements at a generic point). The §4.8 target therefore needs the §4.6.3-type step, and so it needs Kato's divisibility inside the proof of the reverse bound, not only in the final assembly.
  - The same holds for separating the factors. Over K the cyclotomic restriction of the two-variable function is the product for f and f ⊗ χ_K. The reverse divisibility for f alone follows from the product divisibility only together with Kato's divisibility for f ⊗ χ_K.
  - That is why the target goes into L2 with a new edge from KatoEulerSystems:L4, which is the finding's second option merged into L2.

### Fix
1. **MIMC README, L1.** Replace "FW explicitly modifies the cited SU statement by lifting a weight restriction and using a different period argument; the proof route is SU together with those specified refinements, not SU alone." (once; checked by script) with:
   > FW Theorem 1.6 differs from Skinner–Urban's Theorem 1 (published Theorem 3.6.4) in two ways, which FW §1.1.1 records: SU assume k ≡ 2 mod p−1, a restriction FW attribute to Wan's separate paper (Forum Math. Sigma 3 (2015) e18) rather than lift themselves; and deducing Theorem 1.6 from SU would need a comparison of canonical and Gross periods that FW say may not exist in the literature. FW's own proof, sketched in §4.8, bypasses both: it proves the two-variable Iwasawa–Greenberg Rankin–Selberg main conjecture over an auxiliary imaginary quadratic field by reducing it, through the explicit reciprocity law for Beilinson–Flach classes and Poitou–Tate duality, to the U(3,1) Greenberg-type divisibility of FW Theorem 7.32, as in Castella–Wan Theorem 3.8 extended from weight two to weight k, and then combines it with Kato's divisibility.
2. **MIMC README, L1.** Replace "R12 gives one divisibility and R15.L1–L2, with FW §4.8’s period refinement, gives the opposite divisibility; their combination proves the equality." (once) with:
   > R12 (KatoEulerSystems L4) gives one divisibility, and AutomorphicCongruences L2 gives the opposite divisibility by FW §4.8's route; their combination proves the equality. The Skinner–Urban argument of AutomorphicCongruences L1 is an alternative route only: it proves Theorem 1.6 as stated only after the weight congruence is removed (Wan 2015) and the canonical and Gross periods are compared, and both are recorded there as gaps.
3. **AC README, L1.** Replace the whole line-32 paragraph quoted above (once) with:
   > L1 is the Skinner–Urban U(2,2) argument only. It proves the reverse divisibility of SU Theorem 3.6.1 and, with Kato, SU Theorem 1 (published Theorem 3.6.4) under SU's hypotheses, including k ≡ 2 mod p−1, with the p-adic L-function normalised by the canonical period. As a route to FW Theorem 1.6 it has two recorded gaps: the removal of the weight congruence, which FW attribute to Wan, Forum Math. Sigma 3 (2015) e18 (planned only in L5w, for Hilbert forms over a totally real field; its use over Q is not planned); and a comparison of canonical and Gross periods, which FW §1.1.1 says may not exist in the literature. Do not introduce a blanket canonical-period/Gross-period equality as a convenient lemma. The FW Theorem 1.6 target is owned by L2 (FW §4.8).
4. **AC README, L2.** Append to the end of its first paragraph, after "…the cyclotomic rank-one regulator alone is not that comparison." (that sentence is itself replaced by /27; append after /27's replacement):
   > For the FW Theorem 1.6 target, prove FW §4.8's argument. Choose the auxiliary imaginary quadratic field as in FW §4.6, so that the whole containment of FW Theorem 7.32 holds, not only away from the height-one primes pulled back from O[[Γ⁺]]. Construct the Kings–Loeffler–Zerbes Λ-adic Beilinson–Flach classes for the Hida family of f and the CM family over K, with their Coleman maps and explicit reciprocity law (Castella–Wan Theorem 3.6, from KLZ17 Proposition 8.1.7 and Theorem 10.2.2). Prove Castella–Wan Theorem 3.8's equivalence of the Greenberg, Beilinson–Flach and Perrin-Riou forms of the two-variable main conjecture by Poitou–Tate duality, extended from weight two to weight k with FW Theorem 7.32 in place of the Greenberg-type input. Castella–Wan state it up to powers of p (arXiv:2001.03878v1). Then prove the integral statement by the argument of FW §4.6.3, which starts from Kato's divisibility (KatoEulerSystems L4) and computes at one generic arithmetic point with the Beilinson–Flach family and the unramified direction. Restrict to the cyclotomic line, where the two-variable function is the product of the p-adic L-functions of f and f ⊗ χ_K with L0's periods, and use Kato's divisibility for f ⊗ χ_K to obtain the reverse divisibility for f over Q on the lattice and analytic function of R10/R12. Where the §4.6.3 argument does not remove a power of p, retain that ambiguity in the statement.
5. **Stage edge.** Add `KatoEulerSystems:L4` to AC L2's `requires`, AC L2 to Kato L4's `consumers`, and `{"source": "KatoEulerSystems:L4", "target": "AutomorphicCongruences:L2"}`.
   - Cycle test for KatoEulerSystems:L4 → AC:L2: acyclic (no path AC:L2 → KatoEulerSystems:L4). Also acyclic together with this report's other edges.
   - AC L2 already requires KatoEulerSystems:L3.
6. **Pending RS-11** (for its author or reviewer; When: RS-11).
   - Owner entry "SU/FW ordinary congruence reverse divisibility, including the source-specific integral-period refinement" (owner AC:L1): replace by two entries:
     - "Skinner–Urban U(2,2) ordinary reverse divisibility (SU Theorem 3.6.1), with the weight-congruence and canonical/Gross-period gaps recorded", owner `AutomorphicCongruences:L1`, `formerly` [ModularIwasawaMainConjectures:L1];
     - "FW Theorem 1.6 reverse divisibility by FW §4.8 (Theorem 7.32, Beilinson–Flach reciprocity, Castella–Wan Theorem 3.8 in weight k, the §4.6.3 powers-of-p argument)", owner `AutomorphicCongruences:L2`, `formerly` [ModularIwasawaMainConjectures:L1, AutomorphicCongruences:L1].
   - Layer reason for AC:L1: "…and the FW ordinary period refinement…" → "…; the FW Theorem 1.6 route is L2's".
   - Layer reason for MIMC:L1: "the SU/FW reverse bound of AutomorphicCongruences L1-L2" → "the FW §4.8 reverse bound of AutomorphicCongruences L2 (L1's Skinner–Urban bound is an alternative with recorded gaps)".
7. **AUDIT-23** (merged): move AC L1 target 5 ("FW §4.8's refined period argument …") to AC L2's targets, reworded as "FW §4.8: Castella–Wan Theorem 3.8 in weight k with FW Theorem 7.32, the Kings–Loeffler–Zerbes classes and Coleman maps, and the §4.6.3 powers-of-p argument". Status not built.

### Not done, and why
- **L1 → L2 is kept.** FW's proof of Theorem 7.32 argues "as in [117, Theorem 7.5]" (pp. 96–97): it reuses SU §7.3's descent and CAP argument for the decomposing pseudo-character, which L1 proves (see /6). So L1 supplies more than the lattice pattern that L0 owns.
- **No edge AC:L5w → MIMC:L1.** The Skinner–Urban route is kept only as an alternative with recorded gaps, and it would still lack the period comparison, so importing Wan 2015 would not make it a proof of Theorem 1.6. L5w also plans Wan 2015 only in BCS's real-quadratic application.
- **No new substage.** The finding offered a substage after L2 that requires KatoEulerSystems:L4. Putting the target in L2 with the Kato edge serves the same purpose with fewer records, since no consumer needs L2 without the §4.8 target.

## /23 (medium, missing): MIMC L3 takes the parametrisation from EllipticCurveModularity R29.5 and the modularity endpoint from R29.6, by direct edges

### What the verifier corrected
- **Confirmed, with a correction to its scope.**
  - On the raw atlas only EllipticCurveModularity R29.1–R29.4 are ancestors of MIMC L3, which is what the finding says.
  - With the accepted restructurings applied, R29.5 and R29.6 do become ancestors, but only along six-step incidental paths:
    - R29.5 → HE.1 → L3h → L5a → L5b → L5 → L3;
    - R29.6 → BSD.5 → BSD.7a → HE.8b → L5b → L5 → L3.
  - Those paths carry Heegner and BSD material, not the modular parametrization L3 asks for.
- There is still no direct edge, and the roadmap does not list EllipticCurveModularity as a prerequisite, so the defect stands.

### State on main (45d60f04)
- **L3's text is unchanged since 15 September.** `content/campaign/ModularIwasawaMainConjectures/README.md` line 76: "When using modularity of E, consume the actual modularity theorem from its owning roadmap; alternatively state and prove the comparison for a specified modular parametrization, with modularity added as a separate dependency rather than silently assumed."
  - Line 11, the roadmap's prerequisites: "**Campaign dependencies:** [AutomorphicCongruences](../AutomorphicCongruences/README.md), [KatoEulerSystems](../KatoEulerSystems/README.md), [PadicHodgeRegulators](../PadicHodgeRegulators/README.md), [SelmerIwasawaCohomology](../SelmerIwasawaCohomology/README.md), [PadicFamilies](../PadicFamilies/README.md)." It has no EllipticCurveModularity.
- **L3's `requires`.** In `data/atlas.json`: [AutomorphicCongruences:L5, ModularIwasawaMainConjectures:L0]. In the assembled atlas (2840 stages): these plus the Tau Ceti EllipticCurves Layers 4 and 2.
- **Graph recomputed on the assembled atlas.** Its ancestors include R29.1–R29.6, and the only paths from R29.5 and R29.6 are the two six-step paths the verifier names. So the verifier's correction holds at 45d60f04. It holds only as long as those incidental paths survive: /31 of this report drops HE.8b → AC L5b, which removes the R29.6 path.
- **Accepted RS-06** owners: "The elliptic modularity/parametrization endpoint" → R29.6; "The Q-isogeny A_f→E and nonconstant modular parametrization to the given E" → R29.5.
- **Since the red team:** the EllipticCurveModularity packet (`research/blueprint/packets/EllipticCurveModularity.json`, accepted after review on 28 September, #3840) now has the nodes L3 needs:
  - `EllipticCurveModularity:R29.5/modular-parametrisation`: "φ_E : X₀(N) → E … a nonconstant morphism of curves over ℚ with φ_E(∞) = O, and φ_E^*ω_E = c · 2πi F_E(z)dz for a constant c ∈ ℚ^×. … for the optimal curve … c is Manin's constant";
  - `EllipticCurveModularity:R29.6/modularity-theorem`: "Every elliptic curve E/ℚ of conductor N is modular …".
  - Neither lists an Iwasawa consumer.

### Fix
1. **`content/campaign/ModularIwasawaMainConjectures/README.md`.**
   - **Line 11.** Replace "**Campaign dependencies:** [AutomorphicCongruences](../AutomorphicCongruences/README.md), [KatoEulerSystems](../KatoEulerSystems/README.md), [PadicHodgeRegulators](../PadicHodgeRegulators/README.md), [SelmerIwasawaCohomology](../SelmerIwasawaCohomology/README.md), [PadicFamilies](../PadicFamilies/README.md)." (occurs exactly once) with the same line plus ", [EllipticCurveModularity](../EllipticCurveModularity/README.md) (R29.5–R29.6, for L3)".
   - **L3.** Replace "When using modularity of E, consume the actual modularity theorem from its owning roadmap; alternatively state and prove the comparison for a specified modular parametrization, with modularity added as a separate dependency rather than silently assumed." (occurs exactly once) with:
     > Consume modularity of E from EllipticCurveModularity R29.6 (the modularity theorem: the newform F_E ∈ S_2(Γ0(N)) with a_p(F_E) = a_p(E)) and the parametrization from R29.5 (φ_E : X0(N) → E through a chosen ℚ-isogeny λ : A_(F_E) → E, with φ_E^*ω_E = c·2πi F_E(z)dz, c ∈ ℚ^×). State the canonical-period and Tate-lattice comparison for that φ_E and track its dependence on λ and on c; the p-integrality of c is a separate input (see GrossZagierAndArithmeticHeights GZ.3's Manin-constant node) and is not assumed here.
2. **`data/atlas.json`.**
   - Add `EllipticCurveModularity:R29.5` and `EllipticCurveModularity:R29.6` to L3's `requires`, L3 to both stages' `consumers`, and the two stageEdges records.
   - Cycle test for EllipticCurveModularity:R29.5 → ModularIwasawaMainConjectures:L3: acyclic (no path L3 → R29.5).
   - Cycle test for EllipticCurveModularity:R29.6 → ModularIwasawaMainConjectures:L3: acyclic (no path L3 → R29.6).
   - R29.6 already requires R29.5, so the R29.5 edge is transitively implied. It is kept because RS-06 gives the parametrization and the endpoint separate owners and L3 uses both.

### Not done, and why
- **No new mathematics.** Both results are planned and now decomposed in the EllipticCurveModularity packet; only the imports were missing.
- **The Manin constant is /17's.** Its p-integrality (GZ.3 in /17 of this report) is referenced, not planned here.

## /24 (medium, duplicate): AC L2 imports CLW's weight-two semi-ordinary theory from L2s and keeps only FW Appendix B's general-weight additions

### What the verifier corrected
- Confirmed without correction. AC L2s is not an ancestor of AC L2. So L2 either plans CLW's semi-ordinary GU(3,1) Hida theory, Klingen family and Fourier–Jacobi functional a second time, or it has an unrecorded gap. FW's Appendix B reuses exactly those constructions.

### State on main (45d60f04)
- **Both stages exist** in `data/atlas.json` and in the assembled graph: `AutomorphicCongruences:L2` ("The distinct Fouquet–Wan automorphic input") and `AutomorphicCongruences:L2s` ("Semi-ordinary GU(3,1) congruences: the CLW replacement").
  - L2 requires L1, APL:L3h, APL:L4e, GH.8, KatoEulerSystems:L3, PadicFamilies:L4 and, from a restructuring, R21.3.
  - L2s requires L0, APL:L4e, MP.6 and PadicFamilies:L0a. Its only consumer is BSD.6a.
  - There is no path between L2 and L2s in either direction.
- **README** (`content/campaign/AutomorphicCongruences/README.md`, unchanged since 15 September).
  - L2 line 36: "Construct the U(3,1) Eisenstein/Rankin–Selberg families used by FW, with the auxiliary imaginary quadratic field and its two-variable extension. This is a distinct construction from the U(2,2) argument, not a renaming of it."
  - L2s line 44: "Construct the two-dimensional subspace of the three-dimensional weight space, its semi-ordinary Up operator, cuspidal and noncuspidal Hida control and the boundary exact sequence (Theorem 2.9.1, §§2–4), then the semi-ordinary Klingen family, degenerate/nondegenerate Fourier–Jacobi calculations, Eisenstein ideal and lattice-to-Selmer argument (§§5–8)… This supplier does not assume L2's completed Fouquet–Wan divisibility; shared local test data are constructed before either arithmetic conclusion."
- **Pending RS-11** keeps both stages ("Keep the distinct U(3,1) FW construction…"; "Keep CLW semi-ordinary GU(3,1) control…") and adds no edge between them. AUDIT-23 (merged) lists no duplicate for either.
- **Sources read** (29 September 2026).
  - FW arXiv:2107.13726v3, Appendix B:
    - §7.1, p. 80: "The Hida theory developed in [20, Sections 2-4] (especially the fundamental exact sequence there) for semi-ordinary forms enables us to construct a family of cusp forms, which is congruent to the Klingen Eisenstein family … there is a functional (constructed via Fourier-Jacobi expansion map) … (i.e. Proposition 7.11.3 of loc.cit. This is the hard part of the whole argument)";
    - §7.2: "All ingredients are available, except that we need some new idea in the vector valued case … (Archimedean argument involving Ikeda's theory), which are mainly in Subsection 7.4.2";
    - §7.3: "In [20] we developed Hida theory assuming the weight of f is two … See Proposition 2.9.1 and Remark 2.9.2 of op.cit.. Here for completeness we briefly develop the Hida theory needed here for general weight";
    - proof of Theorem 7.32, p. 96: "As in [20, Theorem 8.2.1], the main theorem can be proven from Proposition 7.29".
    - [20] is CLW, arXiv:2109.08375.
  - CLW arXiv:2109.08375v1: its Theorem 2.9.1 (§2.9, "Statement of main theorem"; proved in §§3–4) is what FW call "Proposition 2.9.1". The primitivity is Proposition 7.11.3, and the main theorem is Theorem 8.2.1.
- **Cycle test for L2s → L2:** acyclic (no path L2 → L2s). L2s's own statement that it "does not assume L2's completed Fouquet–Wan divisibility" is consistent with this direction.

### Fix
1. **Stage edge.** Add `AutomorphicCongruences:L2s` to L2's `requires`, L2 to L2s's `consumers`, and `{"source": "AutomorphicCongruences:L2s", "target": "AutomorphicCongruences:L2"}`. Cycle test: acyclic, alone and together with this report's other edges.
2. **README, AC L2.** After "This is a distinct construction from the U(2,2) argument, not a renaming of it." (once; checked by script) insert:
   > FW Appendix B is the general-weight extension of Castella–Liu–Wan, which L2s owns. Import from L2s CLW's weight-two semi-ordinary Hida theory (CLW Theorem 2.9.1, §§2–4, with its fundamental exact sequence), the semi-ordinary Klingen family, the Fourier–Jacobi functional and its primitivity (CLW Proposition 7.11.3), and the lattice-to-Selmer argument of the proof of CLW Theorem 8.2.1. Construct here only FW's additions in §§7.2–7.4: the general-weight semi-ordinary Hida theory and its control, the vector-valued Klingen Eisenstein family, and its primitivity through Ikeda's theory of Fourier–Jacobi coefficients (§7.4.2, the archimedean argument). Then prove FW Proposition 7.29 and, from it, FW Theorem 7.32 as in the proof of CLW Theorem 8.2.1, with the comparison maps between the weight-two and general-weight objects stated explicitly.
3. **README, AC L2s.** No change is needed: its text already says it is a supplier constructed before either arithmetic conclusion. In the handoff-table row for `L2s` ("Build the semi-ordinary operator and boundary exact sequence before the CLW Eisenstein ideal. Keep localization in the cyclotomic coefficient subring separate from inversion of p."), append " Export the weight-two semi-ordinary Hida theory, Klingen family and Fourier–Jacobi primitivity to L2, which extends them to general weight."
4. **AUDIT-23** (merged): AC L2 target 1 gains the note "CLW's weight-two semi-ordinary Hida theory, Klingen family and Fourier–Jacobi primitivity imported from L2s; L2 owns FW §§7.2–7.4's general-weight additions". Status unchanged.

### Not done, and why
- **CLW's weight-two argument is not moved into L2.** L2s is the older and smaller construction and BSD.6a consumes it on its own. The finding's direction L2s → L2 keeps one owner of each piece.

## /25 (medium, error): edge L3h → AC L2s, and L3h exports Theorems A, B and C to L2s

### What the verifier corrected
- Confirmed without correction.
- AutomorphicPadicLFunctions L3h is not an ancestor of AC L2s, although CLW uses three of Hsieh's Doc. Math. 2014 results.
- L3h's export list names other consumers and not L2s, so the omission is on both sides.

### State on main (45d60f04)
- **AC L2s `requires`** (assembled graph): `AutomorphicCongruences:L0`, `AutomorphicPadicLFunctions:L4e`, `MetaplecticAutomorphicForms:MP.6`, `PadicFamilies:L0a`. L3h is not an ancestor. `content/campaign/AutomorphicCongruences/README.md` has not changed since 15 September.
- **L3h's export sentence** (`content/campaign/AutomorphicPadicLFunctions/README.md` line 60) reads: "Export these exact statements to GeneralizedHeegnerCycles GH.6 and AutomorphicCongruences L2/L5a."
  - L3h's consumers in the assembled graph are AC L2, AC L5a, GH.4, GH.6 and BSD.6a.
  - BSD.6a's README (RankZeroOneBSD line 96) already imports "AutomorphicPadicLFunctions L3h's Hsieh μ theorem" for the same CLW-based branch.
- **Pending RS-11** keeps L2s unchanged. No accepted RS, link map, packet or decomposition adds this edge.
- **The three uses, read in CLW arXiv:2109.08375v1** (29 September 2026). CLW's [Hsi14b] is "Ming-Lun Hsieh. Special values of anticyclotomic Rankin-Selberg L-functions. Doc. Math., 19:709–767".
  - §5.6, p. 36 (auxiliary characters): "we can apply mod p nonvanishing results [Hsi14b] (for the L-values in (5.6.1)) … (The conditions in (3) on the conductors at non-split primes and the condition (5) implies that the local root numbers are +1 as required for applying [Hsi14b].)" This is Hsieh's Theorem C, whose Hypothesis A is the root-number condition.
  - §7.11, p. 70: "The existence of such a p-adic L-function L1 follows from [Hsi14b]." This is Theorem A.
  - Proof of Theorem 8.2.1(2), p. 81: "one can use the vanishing of the anticyclotomic µ-invariant proved in [Hsi14b] to deduce that the Lπ,K,ξ is not divisible by any height one prime ideal". This is Theorem B.
- **The finding's evidence is exact.** L2s itself states the conditions under which the second containment holds: "only after inverting p and also requires ξ|A_Q×=ω², k₀≡0 mod 2(p−1), local base-change root number +1 at every nonsplit finite place, and conductor supported at split primes."

### Fix
1. **`data/atlas.json`.**
   - Add `AutomorphicPadicLFunctions:L3h` to AC L2s's `requires`, and AC L2s to L3h's `consumers`.
   - Add the stageEdges record `{"source": "AutomorphicPadicLFunctions:L3h", "target": "AutomorphicCongruences:L2s"}`.
   - Cycle test for L3h → AC:L2s: acyclic (no path L2s → L3h in the assembled graph; L2s's only consumer is BSD.6a). It is also acyclic together with /7's L3m edges.
2. **`content/campaign/AutomorphicPadicLFunctions/README.md`, L3h.** Replace "Export these exact statements to GeneralizedHeegnerCycles GH.6 and AutomorphicCongruences L2/L5a." (occurs once) with the merged text in "Edits shared between findings" at the end of this report, which also carries /11's GZ.9 clause. This finding's part is:
   > Export these exact statements to GeneralizedHeegnerCycles GH.6 and AutomorphicCongruences L2/L5a, and Theorems A, B and C to AutomorphicCongruences L2s. CLW use Theorem A for the p-adic L-function L1 of §7.11, Theorem B for the second containment of Theorem 8.2.1(2), and Theorem C to choose the auxiliary characters of §5.6.
3. **`content/campaign/AutomorphicCongruences/README.md`, L2s.** The sentence inserted by /7 (edit 5) names L3h's Theorem C. Also append to the paragraph that begins "Theorem 8.2.1 uses §5.2", after "…and conductor supported at split primes.":
   > That second containment uses Hsieh's μ = 0 (AutomorphicPadicLFunctions L3h, Theorem B), whose own hypotheses — p unramified in the totally real field (here Q), absolute irreducibility of the residual representation restricted to G_K, and the prime-to-p local character-image condition — are verified here for π and ξ.

   Check that "…and conductor supported at split primes." occurs once: it does.

### Not done, and why
- **Which of Hsieh's hypotheses CLW's conditions discharge** (for example, whether ξ|A_Q× = ω² and k₀ ≡ 0 mod 2(p−1) are what make CLW's character anticyclotomic in Hsieh's sense) is not settled here. It is left to the L2s decomposition. The inserted sentence only requires that it be verified.

## /26 (medium, missing): new layers APL L3r (Hida's Rankin–Selberg p-adic L-function of a CM Hida family) and AC L0c (the anticyclotomic main conjecture for CM fields) supply the integrality in CLW Theorem 8.2.1(2)

### What the verifier corrected
- Confirmed without correction. No atlas stage plans either input, and neither library has them:
  - the anticyclotomic main conjecture for CM fields (Hida–Tilouine 1993/1994, Hida 2006);
  - Hida's GL₂ × GL₂ Rankin–Selberg p-adic L-function for a CM Hida family.
- So the integrality statement that L2s must prove has no route.

### State on main (45d60f04)
- **AC L2s** (`content/campaign/AutomorphicCongruences/README.md` line 46, unchanged since 15 September): "Under residual distinctness ξ_p≠ξ_p̄, prove integrality of the analytic function. The second containment is only after inverting p and also requires ξ|A_Q×=ω², k₀≡0 mod 2(p−1), local base-change root number +1 at every nonsplit finite place, and conductor supported at split primes."
- **Atlas.** A sweep of the 2840 assembled stage descriptions finds no "Tilouine", no "anticyclotomic main conjecture", no "congruence module" of a CM family and no Rankin–Selberg p-adic L-function of a family. The only "congruence module" hits are IntegralIwasawaTheory I.5 (the Mazur–Wiles programme) and PadicFamilies L1 (period and congruence modules of an ordinary family).
- **APL** (`content/campaign/AutomorphicPadicLFunctions/README.md`):
  - L3 (line 48) owns Katz's p-adic L-function for a CM field with a p-ordinary CM type.
  - L3h (Hsieh) and L4e (Eischen–Wan) are anticyclotomic and unitary constructions.
  - None is a GL₂ × GL₂ Rankin–Selberg construction for a Hida family.
  - The APL packet (`research/blueprint/packets/AutomorphicPadicLFunctions.json`, last checkpoint 26 September, #3100) covers the weighted-evaluation formalism and none of this.
- **Libraries.** No declaration matching `anticyclotomic`, `Tilouine`, `Rankin` (as a p-adic L-function) or `Klingen` exists at either pin (trees and declarations.tsv).
- **Interaction with /5 (another section of this report).** /5 proposes a new roadmap for elliptic units and the main conjectures for imaginary quadratic fields, which would include "the Hida–Tilouine (Invent. Math. 117, 1994) Thm 0.3 anticyclotomic form". This fix makes AC L0c the single owner of the Hida–Tilouine/Hida anticyclotomic main conjecture for CM fields. A roadmap created under /5 imports L0c for its imaginary-quadratic case rather than plan it again.
- **Other groups' new ids.** /7 (another section of this report) adds APL `L3m`. The id `L3r` below is distinct.
- **Source read** (29 September 2026): CLW arXiv:2109.08375v1, proof of Theorem 8.2.1(2), p. 81:
  > "Let g be the ordinary O_L^ur⟦Γ_K⟧-adic CM family passing through the CM form associated to ξ. As in [Wan20, §7E], one can construct a p-adic L-function L^Hida_{π,K,ξ} by taking the product of Hida's Rankin–Selberg p-adic L-functions for the family g and the newform f ∈ π and Katz's p-adic L-function restricted to the line of interpolating special values at 1. Note that although Hida's construction assumes that g and π are both ordinary, only the ordinarity of g is used. By using [HT93, Theorem 7.1, (8.8b)] and [Hid91, Lemma 5.3(vi)] (which relates the Petersson norm with the adjoint L-value at 1), one can check that L^Hida_{π,K,ξ} ∈ O_L^ur⟦Γ_K⟧ and the specializations of L^Hida_{π,K,ξ} and our L_{π,K,ξ} agree at a Zariski dense subsets of the weight space. Hence, L^Hida_{π,K,ξ} = L_{π,K,ξ}. Then under the conditions (dist) and (dist), by using the Iwasawa Main conjecture proved in [HT93, HT94, Hid06], one can check that L^Hida_{π,K,ξ} ∈ O_L^ur⟦Γ_K⟧."

  (irred) and (dist) are derived there from ξ_p ≢ ξ_p̄. The references:
  - [HT93] Hida–Tilouine, Ann. Sci. ÉNS 26 (1993) 189–259;
  - [HT94] Invent. Math. 117 (1994) 89–147;
  - [Hid06] Hida, *Anticyclotomic main conjectures*, Doc. Math. Extra Vol. (2006) 465–532;
  - [Hid91] Hida, *On p-adic L-functions of GL(2)×GL(2) over totally real fields*, Ann. Inst. Fourier 41 (1991) 311–391;
  - [Wan20] Wan, Algebra & Number Theory 14 (2020).
- **Checked mathematics.** The integrality claim has three distinct inputs, and the fix plans each:
  1. Hida's family Rankin–Selberg construction for (g, f), where only g need be ordinary. Its denominator is the congruence number of g, related to the adjoint L-value at 1 by Hid91 Lemma 5.3(vi).
  2. The identification of that product with CLW's function by Zariski density (CLW's own step, which stays in L2s).
  3. The anticyclotomic main conjecture for the CM field, used under (irred) and (dist) to show the product is integral.

  The finding folds (1) and (3) into "two inputs". That is right, provided the comparison with Katz and the HT93 Theorem 7.1 identification go with (1) and (3) respectively, as below.
- **Not read.** HT93, HT94, Hid06 and Hid91 could not be obtained: Hida's Documenta paper did not download from the mirrors tried, and the rest are behind publishers. Their theorem statements are therefore pinned below only by the locators CLW gives; stating them exactly is the blueprint job's first task.

### Fix
1. **New stage `AutomorphicPadicLFunctions:L3r`.** Insert in `content/campaign/AutomorphicPadicLFunctions/README.md` before "## L4e — Eischen–Wan finite-slope Klingen families":
   > ## L3r — Rankin–Selberg p-adic L-functions of a CM Hida family
   >
   > Construct Hida's GL₂ × GL₂ Rankin–Selberg p-adic L-function for an ordinary Hida family g and a fixed newform f (Hida, Ann. Inst. Fourier 41 (1991); over Q, Hida's earlier construction), by the Rankin–Selberg unfolding against an ordinary projection of a product of an Eisenstein measure and f, with the congruence number of g as its denominator. Only the ordinarity of g is used; do not assume f ordinary (CLW p. 81). Prove the interpolation formula with its Euler factors, periods and Petersson norm, and Hida's Lemma 5.3(vi) relating the Petersson norm of a specialization of g to the adjoint L-value at 1. For the ordinary CM family g through a Hecke character ξ of an imaginary quadratic K with p split, prove the factorization used in Wan (2020) §7E and CLW §8: the product of this function with Katz's p-adic L-function from L3, restricted to the line interpolating values at 1, and its comparison with Katz's function on the CM side. Retain the (irred) and (dist) hypotheses where they are used. This layer constructs the function and its interpolation; its integrality under those hypotheses uses AutomorphicCongruences L0c and is proved by the consumer.

   Atlas record: `requires` [AutomorphicPadicLFunctions:L3, PadicFamilies:L1, PadicFamilies:L3]; consumer AutomorphicCongruences:L2s. PadicFamilies L1 carries the congruence and period modules of an ordinary family, and L3 the family L-functions.
2. **New stage `AutomorphicCongruences:L0c`.** Insert in `content/campaign/AutomorphicCongruences/README.md` before "## L1. The Skinner–Urban automorphic argument":
   > ## L0c. The anticyclotomic main conjecture for CM fields
   >
   > Prove the anticyclotomic Iwasawa main conjecture for a CM field M over a totally real field F with a p-ordinary CM type, in the forms proved by Hida–Tilouine (Ann. Sci. ÉNS 26 (1993), Theorem 7.1 and (8.8b); Invent. Math. 117 (1994)) and Hida (Doc. Math. Extra Vol. (2006) 465–532), by their congruence-module method: the identification of the congruence module of the CM components of the ordinary Hilbert Hecke algebra (PadicFamilies L5) with the anticyclotomic projection of Katz's p-adic L-function (AutomorphicPadicLFunctions L3), and the resulting equality of characteristic ideals for the anticyclotomic Iwasawa module of each branch character. State each source's hypotheses separately (the residual (irred) and (dist) conditions, the branch and conductor conditions, and whatever μ-invariant input each version uses); pin the exact statements from the sources before decomposing. Congruence modules and extension classes are imported from L0 (IntegralHeckeAndGaloisDeterminants owns the general definition). This layer is the single owner of the Hida–Tilouine/Hida theorem; a roadmap for the imaginary-quadratic main conjectures imports it.

   Atlas record: `requires` [AutomorphicCongruences:L0, AutomorphicPadicLFunctions:L3, PadicFamilies:L5]; consumer AutomorphicCongruences:L2s.
3. **README, AC L2s.** Replace "Under residual distinctness ξ_p≠ξ_p̄, prove integrality of the analytic function." (once; checked by script) with:
   > Under residual distinctness ξ_p≠ξ_p̄, prove integrality of the analytic function as CLW do in the proof of Theorem 8.2.1(2): show that ρ_{σ_ξ} = Ind(ξ) satisfies (irred) and (dist); identify L_{π,K,ξ} with the product L^Hida of Hida's Rankin–Selberg p-adic L-function for the ordinary CM family through ξ and f ∈ π (AutomorphicPadicLFunctions L3r) and Katz's p-adic L-function, by comparing specializations on a Zariski-dense set with Hida–Tilouine 1993 Theorem 7.1 and (8.8b) and Hida 1991 Lemma 5.3(vi); then deduce integrality from the anticyclotomic main conjecture for CM fields (L0c). Until L3r and L0c are built, record this integrality, and the second containment stated on top of it, as a gap.
4. **Stage edges.**
   - For L3r: AutomorphicPadicLFunctions:L3 → L3r, PadicFamilies:L1 → L3r, PadicFamilies:L3 → L3r.
   - For L0c: AutomorphicCongruences:L0 → L0c, AutomorphicPadicLFunctions:L3 → L0c, PadicFamilies:L5 → L0c.
   - Into L2s: `AutomorphicPadicLFunctions:L3r` → `AutomorphicCongruences:L2s` and `AutomorphicCongruences:L0c` → `AutomorphicCongruences:L2s`, each with `requires`/`consumers` and stageEdges records.
   - Cycle test (new stages have no other edges): acyclic for all eight, alone and together with this report's other edges.
5. **AUDIT-23** (merged): AC L2s target 4 (CLW Theorem 8.2.1) gains the note "integrality in (2) needs AutomorphicPadicLFunctions L3r and AutomorphicCongruences L0c; recorded as a gap until they exist". The new stages L3r and L0c need audit entries (not built) when the orchestrator next merges.

### Not done, and why
- **Statements of HT93, HT94, Hid06 and Hid91 are not transcribed.** None of these sources was read. The new stages are specified by what CLW use them for, with their locators, and the stage texts require the exact statements to be pinned first.
- **Hida's vanishing of the anticyclotomic μ-invariant (Annals 2010)** is not placed in L0c. /5 assigns it to its proposed roadmap, and CLW's second containment uses Hsieh's μ = 0 from APL L3h instead (CLW p. 81; /25).

## /27 (medium, duplicate): Yager modules and the two-variable unramified regulator get one owner, a new PadicHodgeRegulators L3u, imported by GH.7 and AC L2

### What the verifier corrected
- Confirmed without correction. AC L2 and GeneralizedHeegnerCycles GH.7 both plan the unramified local Iwasawa theory and the Yager module, from the same source theory. GH.7 is already an ancestor of AC L2, so the duplication can be removed by an import.
- The pending RS-11 would keep the material in AC L2, but it is not accepted.

### State on main (45d60f04)
- **Both stages exist** (assembled graph), with the path GH.7 → GH.8 → AC:L2.
  - PadicHodgeRegulators:L3 ("The big logarithm and explicit interpolation") is a requirement of GH.7. It is not planned for the unramified direction.
- **README texts** (all unchanged since 15 September).
  - AC L2, line 36: "Construct the unramified local Iwasawa theory and Yager modules of FW §4.2, and prove their exponential-map comparison; the cyclotomic rank-one regulator alone is not that comparison."
  - GH.7 (`content/campaign/GeneralizedHeegnerCycles/README.md` line 41): "Build the unramified Yager-module exponential comparison and its ideal J=(Ψ(Frob_p)−1,γ₀−1) and pseudo-null correction where the source requires them; a one-variable Perrin–Riou map alone does not supply this."
  - PHR L3 (`content/campaign/PadicHodgeRegulators/README.md` lines 76–84) constructs L_V : H¹_Iw(Q_p,V) → H(G) ⊗ D_cris(V) for G = Gal(Q_p(μ_p∞)/Q_p) only.
- **Packets and decompositions.**
  - `research/blueprint/packets/PadicHodgeRegulators--L3.json` (26 September, #3111, partial) covers the Lei–Loeffler–Zerbes image modules and has no unramified or two-variable node.
  - The integrated GH decomposition (`data/decompositions/GeneralizedHeegnerCycles.json`) marks GH.7 "not_read", with "The Yager-module unramified exponential comparison, the ideal J … were not inspected."
  - `research/blueprint/packets/GeneralizedHeegnerCycles--GH.8.json` (27 September, #3138) has `requests[8]` to supplier GH.7, which includes "For local injectivity, realize LZ14 v3 Proposition 4.11 with its infinite unramified direction, … Retain Yager-module, completion and specialization corrections; the L3 cyclotomic packet does not supply this two-variable descent."
- **Pending RS-11**, layer reason for AC:L2: "Keep the distinct U(3,1) FW construction, Beilinson-Flach classes, Yager/exponential and integral period comparisons…". The merged AUDIT-23 records the duplicate at AC L2: "'layer': 'GeneralizedHeegnerCycles:GH.7', 'note': 'Also builds the unramified Yager-module exponential comparison…'".
- **Libraries.** No `Yager` declaration, and no two-variable/unramified Perrin-Riou regulator, at either pin (trees and declarations.tsv).
- **Sources read** (29 September 2026).
  - Loeffler–Zerbes, *Iwasawa theory and p-adic L-functions over Z_p²-extensions*, arXiv:1108.5954v3 (22 April 2014; Int. J. Number Theory 10 (2014)):
    - §3 "Local theory: Yager modules and Wach modules" (§3.2 "The Yager module", Definition 3.7);
    - §4, the regulator L_G for an unramified p-adic Lie extension F∞/F (Theorem 4.7), with "Proposition 4.11. If F∞/F is infinite, the regulator map L_G …" (injectivity);
    - the explicit formula Theorems 4.13 and 4.15, and the local reciprocity formula Theorem 4.17.
  - FW arXiv:2107.13726v3:
    - §4.2 "Unramified Iwasawa Theory" has §4.2.1 "Boundedness of the exponential map", §4.2.2 "Yager modules" ("We mainly follow [84, Section 3.2] to present the theory of Yager modules", [84] = LZ14) and §4.2.3 "Explicit description of the exponential map and Galois cohomology";
    - §4.6.3 uses the unramified direction Γ_v̄0 with these modules.

### Fix
1. **New stage `PadicHodgeRegulators:L3u`.** Insert in `content/campaign/PadicHodgeRegulators/README.md` before "## L4. Signed and noncrystalline extensions":
   > ## L3u. Yager modules and the two-variable unramified regulator
   >
   > For a finite unramified extension F of Q_p and an unramified p-adic Lie extension F∞/F (in particular the unramified Z_p-extension), construct the Yager module S_{F∞/F} and the Yager isomorphism from the trace-compatible system of integers (Loeffler–Zerbes, arXiv:1108.5954v3, §3.2, Definition 3.7). For a p-adic Lie extension K∞/F with Galois group G and F(μ_p∞) ⊆ K∞ ⊂ F·Q_p^ab, maximal unramified subfield F∞, and a crystalline T with non-negative Hodge–Tate weights such that K∞/F(μ_p∞) is infinite or T has no trivial quotient, construct the two-variable regulator L_G : H¹_Iw(K∞, T) → Ĥ_{F∞}(G) ⊗_F D_cris(V), compatible with L3's L_V at each finite unramified layer (LZ §4.2, Theorem 4.7, with its hypotheses kept), and prove its injectivity when F∞/F is infinite (Proposition 4.11), its explicit interpolation formulas (Theorems 4.13 and 4.15) and the local reciprocity formula (Theorem 4.17). Include the explicit description of the exponential map along unramified extensions in the form FW §4.2.2–4.2.3 use, with FW's change of convention for the Yager map recorded. This layer is the single owner of Yager modules and the unramified big exponential; GeneralizedHeegnerCycles GH.7 and AutomorphicCongruences L2 import it.

   Atlas record: `requires` [PadicHodgeRegulators:L3, tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius]; consumers GeneralizedHeegnerCycles:GH.7 and AutomorphicCongruences:L2.
2. **Stage edges.** PHR:L3 → L3u; the Tau Ceti LocalFieldsRamification layer 2 → L3u; L3u → `GeneralizedHeegnerCycles:GH.7`; L3u → `AutomorphicCongruences:L2`.
   - The last is also implied through GH.7 → GH.8 → L2. It is recorded because L2 imports L3u directly.
   - Cycle test: acyclic for all four, alone and together with this report's other edges.
3. **AC README, L2.** Replace "Construct the unramified local Iwasawa theory and Yager modules of FW §4.2, and prove their exponential-map comparison; the cyclotomic rank-one regulator alone is not that comparison." (once; checked by script) with:
   > Import the Yager modules and the two-variable unramified regulator from PadicHodgeRegulators L3u, and prove here only FW §4.2.1's boundedness of the Bloch–Kato exponential along the unramified extensions and its use in FW §§4.4–4.6; the cyclotomic rank-one regulator alone is not that comparison.
4. **GH README, GH.7.** Replace "Build the unramified Yager-module exponential comparison and its ideal J=(Ψ(Frob_p)−1,γ₀−1) and pseudo-null correction where the source requires them; a one-variable Perrin–Riou map alone does not supply this." (once) with:
   > Import the Yager module and the two-variable unramified regulator from PadicHodgeRegulators L3u, and prove here Castella's comparison through it, with its ideal J=(Ψ(Frob_p)−1,γ₀−1) and pseudo-null correction where the source requires them; a one-variable Perrin–Riou map alone does not supply this.
5. **PHR README, handoff table.** After the `L3` row insert:
   > | `L3u` | Construct the Yager module and the two-variable regulator before either consumer's reciprocity law; prove Proposition 4.11's injectivity only for an infinite unramified direction. |
6. **Packet `research/blueprint/packets/GeneralizedHeegnerCycles--GH.8.json`, `requests[8]`** (for its next checkpoint; When: blueprint).
   - In `need`, replace "For local injectivity, realize LZ14 v3 Proposition 4.11 with its infinite unramified direction, then identify" with "For local injectivity, import LZ14 v3 Proposition 4.11 from PadicHodgeRegulators:L3u, then identify".
   - Add a request `{"supplier": "PadicHodgeRegulators:L3u", "need": "LZ14 v3 §§3–4: the Yager module (Definition 3.7), the two-variable regulator L_G (Theorem 4.7) and its injectivity for an infinite unramified extension (Proposition 4.11), in the normalisation of Castella's two-variable reciprocity law.", "neededBy": ["GeneralizedHeegnerCycles:GH.8/ordinary-p-old-family"]}`.
7. **AUDIT-23 and AUDIT-24** (both merged).
   - AC L2 target 4 ("Unramified local Iwasawa theory and the Yager modules of FW §4.2, with their exponential-map comparison") becomes "FW §4.2.1 boundedness of the exponential along unramified extensions; Yager modules imported from PadicHodgeRegulators L3u". Its `duplicates` entry naming GH.7 is removed.
   - GH.7 target 3 ("…with the Yager-module exponential…") gets "Yager module and two-variable regulator imported from PadicHodgeRegulators L3u".
   - L3u needs a new audit entry (not built).
8. **Pending RS-11** (When: RS-11). AC:L2's layer reason "…Beilinson-Flach classes, Yager/exponential and integral period comparisons…" → "…Beilinson-Flach classes, the FW §4.2.1 exponential bound (Yager modules imported from PadicHodgeRegulators L3u) and integral period comparisons…".
9. **AC README, roadmap prerequisites.** PadicHodgeRegulators is added to AC's "Campaign dependencies" line in /6's single edit of that line.

### Not done, and why
- **The finding's alternative (keep the Yager module in GH.7, with AC L2 importing it)** is not taken. The finding prefers a generic local layer, and LZ14's theory is local p-adic Hodge theory with at least two consumers.
- **FW §4.2.1 stays in AC L2**, as the finding and review specify, although it is also local. Moving it would go beyond the confirmed scope.

## /28 (medium, error): AC L3 imports Emerton's local–global compatibility from R31.4, which also brings in the p-adic local Langlands stages

### What the verifier corrected
- Confirmed without correction. No stage of CompletedCohomologyAndLocalGlobalCompatibility or PadicLocalLanglandsForGL2Qp is an ancestor of AC L3 in any of the three graphs, with every accepted restructuring and link map applied. Yet L3's text says it imports from both.

### State on main (45d60f04)
- **AC L3** (`content/campaign/AutomorphicCongruences/README.md` line 52, unchanged since 15 September): "Import completed cohomology/local–global compatibility from CompletedCohomologyAndLocalGlobalCompatibility, derivatives/co-Whittaker/essential vectors from SmoothRepresentationsOfLocalGroups, and the p-adic local Langlands/Montréal/Paškūnas comparison from PadicLocalLanglandsForGL2Qp."
  - The roadmap's ownership bullet (line 8) says something different: "Completed cohomology imports the torsion/automorphic cohomology owner, local co-Whittaker/derivatives import SmoothRepresentationsOfLocalGroups."
  - The roadmap prerequisites (line 10) list PadicLocalLanglandsForGL2Qp but not CompletedCohomologyAndLocalGlobalCompatibility.
- **Assembled graph.**
  - AC L3 requires AC:L2 and PadicMeasuresIwasawaAlgebras:L5, plus DeformationAndDerivedPatchingAlgebra:P7 and SchemeKTheoryOperations:S.1 from restructurings.
  - No R31.* and no R30.* stage is an ancestor of L3.
  - R31.4 ("p-adic local–global compatibility") requires R31.3 and PadicLocalLanglandsForGL2Qp:R30.6. R30.6 requires R30.5, and R30.1–R30.5 form a chain, so every R30 stage is an ancestor of R31.4.
- **SmoothRepresentationsOfLocalGroups:SR.5** is already an ancestor of AC L3, but only by an incidental path: SR.5 → R16.2 → R18.3 → R18.4 → R18.5 → R19.5 → AC:L0 → … → L3. That path carries Hilbert-modular material, not the co-Whittaker import.
  - The pending RS-21 (no review) adds the direct link SR.5 → AC:L3 ("Local integral derivatives and co-Whittaker families") and makes SR.5 the owner of "Nonarchimedean derivatives, integral co-Whittaker families and their local center action", formerly including AC:L3.
- **R31.4's text** (`content/campaign/CompletedCohomologyAndLocalGlobalCompatibility/README.md`) pins Emerton's unpublished 2011 manuscript, Theorem 1.2.1. It requires V promodular with absolutely irreducible residual representation, and the residual local representation "not a twist of an extension of the mod-p cyclotomic character by the trivial character". The isomorphism statement additionally excludes "a twist of an extension of the trivial character by itself".
- **R31.6** is the export stage for the branches of R32 (Serre modularity, including p = 2, 3). It is not what FW Appendix A uses.
- **AUDIT-23** (merged), AC L3 target 2: "Nakamura's universal zeta morphism from the modular/Hecke-level classes with completed cohomology and local co-Whittaker input…".
- **Source read** (29 September 2026): FW arXiv:2107.13726v3.
  - Appendix A, §6.3, pp. 78–79, defines completed cohomology with compact support at tame level and states "Theorem 6.10. [M.Emerton] … There is an isomorphism of T^Σ_{m_ρ̄}[G_{Q,Σ} × GL₂(Q_p) × ∏_{ℓ∈Σ∖p} GL₂(Q_ℓ)]-modules H̃¹_c(O)_{m_ρ̄} ≃ ρ*_Σ(1) ⊗ π_p(ρ_Σ|G_Qp) ⊗̂ ⊗_ℓ π_ℓ(ρ_Σ|G_Qℓ)". It "combines the proof of the Local Langlands Correspondance in p-adic families ([52, 53, 54]) and [34, Theorem 6.2.13]", where [34] is Emerton's local–global compatibility manuscript.
  - The introduction (p. 12) names "the results of V.Paskunas on the explicit description of the so-called Montréal functor of P.Colmez ([25, 96])".
  - FW's Assumption 2.1 (p. 17) is: (1) ρ̄|G_Q(√p*) absolutely irreducible; (2) if ρ̄|G_Qp is an extension of χ₂ by χ₁, then χ₁⁻¹χ₂ ∉ {1, χ̄_cyc}.
- **Checked mathematics.** FW's Assumption 2.1(2) excludes exactly the two local cases that R31.4's theorem excludes:
  - χ₁⁻¹χ₂ = χ̄_cyc is a twist of an extension of the cyclotomic character by the trivial one;
  - χ₁⁻¹χ₂ = 1 is a self-extension of a character.
  - Twisting does not change χ₁⁻¹χ₂. Assumption 2.1(1) gives residual absolute irreducibility, and the V in FW come from the localized Hecke algebra, so they are modular.
  - So R31.4's isomorphism case applies under FW's standing hypotheses, and R31.4 is the right supplier. R31.6 is not.

### Fix
1. **Stage edge.** Add `CompletedCohomologyAndLocalGlobalCompatibility:R31.4` to AC L3's `requires`, AC L3 to R31.4's `consumers`, and `{"source": "CompletedCohomologyAndLocalGlobalCompatibility:R31.4", "target": "AutomorphicCongruences:L3"}`.
   - Cycle test for R31.4 → L3: acyclic (no path L3 → R31.4), alone and together with this report's other edges.
   - PadicLocalLanglandsForGL2Qp R30.1–R30.6 (Colmez's construction R30.3, Paškūnas's blocks and projective envelopes R30.5, R30.6) become ancestors through R30.6 → R31.4.
2. **AC README, L3.** Replace "Import completed cohomology/local–global compatibility from CompletedCohomologyAndLocalGlobalCompatibility, derivatives/co-Whittaker/essential vectors from SmoothRepresentationsOfLocalGroups, and the p-adic local Langlands/Montréal/Paškūnas comparison from PadicLocalLanglandsForGL2Qp." (once; checked by script) with:
   > Import completed cohomology and Emerton's p-adic local–global compatibility (FW Theorem 6.10, from Emerton's Theorem 6.2.13) from CompletedCohomologyAndLocalGlobalCompatibility R31.4; derivatives, co-Whittaker families and essential vectors, with the local Langlands correspondence in families, from SmoothRepresentationsOfLocalGroups (SR.5, the owner named by the pending RS-21); and the p-adic local Langlands/Montréal/Paškūnas comparison from PadicLocalLanglandsForGL2Qp R30.3–R30.6, which R31.4 already requires. Prove that FW's Assumption 2.1 implies R31.4's residual and local hypotheses in the isomorphism case: 2.1(2) excludes both local extension types R31.4 excludes, and 2.1(1) gives residual absolute irreducibility.
3. **AC README, ownership bullet (line 8).** Replace "- Completed cohomology imports the torsion/automorphic cohomology owner, local co-Whittaker/derivatives import SmoothRepresentationsOfLocalGroups." (once) with:
   > - Completed cohomology and its p-adic local–global compatibility import CompletedCohomologyAndLocalGlobalCompatibility R31.4 (with PadicLocalLanglandsForGL2Qp through it); local co-Whittaker/derivatives import SmoothRepresentationsOfLocalGroups.
4. **Roadmap prerequisites.** CompletedCohomologyAndLocalGlobalCompatibility is added to AC's "Campaign dependencies" line in /6's single edit of that line.
5. **SR.5.** Nothing is added here. The pending RS-21 link SR.5 → AC:L3 supplies the direct import once RS-21 is accepted; until then SR.5 reaches L3 only incidentally. When: RS-21.

### Not done, and why
- **No separate edge `PadicLocalLanglandsForGL2Qp:R30.6` → AC:L3.** R30.6 is already a requirement of R31.4, so after edit 1 it is an ancestor of L3 through the stage that consumes it for exactly this comparison; a second edge adds no ancestry.
- **No edge from R31.6.** Its exports are shaped for R32's Serre-modularity branches, and FW use R31.4's theorem directly.
- **The local Langlands correspondence in p-adic families** (FW's [52, 53, 54]; Helm, Emerton–Helm) is left to SmoothRepresentationsOfLocalGroups under RS-21. It is not in the finding. If SR.5 does not own it once RS-21 is decided, it needs a request from AC L3.

## /29 (medium, error): L5a names BCS Theorem 4.1.3 and Corollary 4.1.4, imported from a single owner, with Lemmas 5.1.1–5.1.2 and Propositions 4.2.2 and 5.2.1

### What the verifier corrected
- Confirmed without correction. The theorem L5a names, BCS v2 Theorem 4.2.1, is the one-variable anticyclotomic divisibility that HE.8 and HE.8b already own. The two-variable comparison L5a is meant to own is a different theorem of the same paper.
- The review asks for /29, /30 and /31 to be repaired in one pass. /30 settles who owns the comparison, and /31 settles L5b's prerequisites. This section changes L5a's text; the edge from the owner is /30's.

### State on main (45d60f04)
- **`content/campaign/AutomorphicCongruences/README.md`, L5a (line 66)**, unchanged since 15 September: "Own BCS v2 Theorem 4.2.1's two-variable Iwasawa–Greenberg comparison." The same paragraph also says "Prove the CM-evaluation/μ calculation via AutomorphicPadicLFunctions L3h and its BCS specialization." A script confirms that each of these sentences, and the string "Theorem 4.2.1", occurs exactly once in the file.
- **"L5's copy".** The atlas record `AutomorphicCongruences:L5` covers README lines 60–85 (5091 characters), so it contains the whole L5a text, including "Theorem 4.2.1". L5a's own record covers lines 64–69. Nothing needs editing by hand: once the README is corrected, re-extracting both records carries the fix into both (compare /13 for the HE and BSD pairs).
- **`requires` of L5a** (raw and assembled atlas): L5w, AutomorphicPadicLFunctions L3h, GZ.9 and HE.8. No stage owning the BSTW comparison is among its ancestors, and neither are KatoEulerSystems L3/L4 or RankZeroOneBSD BSD.6a/BSD.7a.
- **HE.8b (HeegnerPointEulerSystems README line 114)** already pins "BCS Theorems 1.2.2/1.2.4, Theorem 4.2.1 and §5".
- **Pending RS-11** (`research/blueprint/restructure/RS-11.md`, "The source-label correction in C.L5a") already found the same label error. It proposes Proposition 5.2.1 "and its preceding comparison inputs" as the locator, and says HE.8b keeps Theorem 4.2.1. RS-11 is unreviewed. This fix agrees with it and names the inputs exactly.
- **No packet or decomposition covers L5a.** No file under `research/blueprint/packets` or `data/decompositions` names AC L5a, and nothing has changed since 24 September.
- **Source, read for this fix.** BCS = Burungale–Castella–Skinner, *Base change and Iwasawa main conjectures for GL₂*, arXiv:2405.00270v2 (18 March 2025), pp. 8–11:
  - **§4.1, Theorem 4.1.3.** The hypotheses are: g ∈ S₂(Γ₀(N)); p ∤ 2N ordinary; K satisfying (spl), (D_K,N)=1 and (irr_K). Under them, X_ord(g/K∞) is torsion with (L^PR_p(g/K)) ⊃ ch(X_ord) in Λ_K ⊗ Q_p if and only if X_Gr(g/K∞) is torsion with (L^Gr_p(g/K)) ⊃ ch(X_Gr) in Λ^ur_K ⊗ Q_p. The theorem adds: "The same conclusion holds for the opposite divisibilities, and before inverting p." Its proof: "This is shown in [BSTW23, §9.3.2]".
  - **Corollary 4.1.4** is the same equivalence for products of two forms g, g′ ("Taking the direct sum of two pairs of four-term exact sequences").
  - **§4.2.** Theorem 4.2.1 is the anticyclotomic Heegner/BDP statement over Λ⁻_K. Its proof reads "Part (a) is contained in [CGS23, Thm. 5.5.2], and part (b) then follows from [BCK21, Thm. 5.2]".
  - **Proposition 4.2.2** states μ(L^Gr_p(g/K)) = μ(L^BDP_p(g/K)) = 0. Its proof cites "[Hsi14, Thm. B]" and "[CGS23, Prop. 1.4.5]"; the latter is v2 Proposition 2.4.5.
  - **§5.1:** Lemma 5.1.1, the base-change divisibility for π_K ch(X_ord(g/M∞)), from SU14 Props 3.6–3.7 and Cor 3.8; and Lemma 5.1.2, π_K(L_p(g_F/M)) = L^PR_p(g/K)·L^PR_p(g^F/K).
  - **Proposition 5.2.1.** Its proof uses Theorem 3.2.1 (L5w), Lemmas 5.1.1–5.1.2, then "Proposition 4.1.3 (and its proof)" twice, and Proposition 4.2.2 to make the Greenberg divisibility integral.
  - **The label.** The label "Proposition 4.1.3" in that proof is BCS's own name for Theorem 4.1.3; the paper has no other 4.1.3.
  - **Source issue.** "Proposition 4.1.3" and "Theorem 4.1.3" name one statement (a misprint in the source). It is recorded here for the source-issue register and does not affect the mathematics.

### Fix
1. **`content/campaign/AutomorphicCongruences/README.md`, L5a.** Replace "Own BCS v2 Theorem 4.2.1's two-variable Iwasawa–Greenberg comparison." with:
   > Own BCS v2 Proposition 5.2.1, the two-variable product divisibility for g and g^F over K (both the Perrin-Riou and the Greenberg forms, integrally), with its inputs Lemma 5.1.1 (base-change divisibility of characteristic ideals, from Skinner–Urban Props 3.6–3.8), Lemma 5.1.2 (factorization π_K(L_p(g_F/M)) = L^PR_p(g/K)·L^PR_p(g^F/K)) and Lemma 5.2.3 (existence of K and F). Import, do not reprove, BCS Theorem 4.1.3 and Corollary 4.1.4, the equivalence of the Perrin-Riou and Greenberg two-variable divisibilities (in both directions and before inverting p), from their single owner KatoEulerSystems L5 (BSTW §9.3.2; see RT-AREA-iwasawa-1/30). BCS cites Theorem 4.1.3 as "Proposition 4.1.3" in the proof of Proposition 5.2.1. BCS Theorem 4.2.1, the one-variable anticyclotomic Heegner/BDP divisibility, is not an L5a target: HE.8 and HE.8b own it.
2. **Same paragraph.** Replace "Prove the CM-evaluation/μ calculation via AutomorphicPadicLFunctions L3h and its BCS specialization." with:
   > Prove BCS Proposition 4.2.2, μ(L^Gr_p(g/K)) = μ(L^BDP_p(g/K)) = 0 under (disc), (Heeg), (spl) and (irr_K), by importing from AutomorphicPadicLFunctions L3h both Hsieh's Theorem B for L^BDP_p and the comparison CGS v2 Proposition 2.4.5 (the anticyclotomic projection of L^Gr_p(g/K) generates the ideal of L^BDP_p(g/K) in Λ^{−,ur}_K; see RT-AREA-iwasawa-1/15 for its owner). The μ statement for the two-variable L^Gr_p(g/K) also needs its integrality. That is CGS v2 Lemma 2.4.4, which uses Hida–Tilouine's Theorem 0.3 and Rubin's main conjecture for K, or equivalently FW21 Lemma 7.22 with Corollary 7.21. Record it as a named input with no supplier until the owners asked for in RT-AREA-iwasawa-1/5 and /26 exist.
3. **The same README, the paragraph after L5a.** "Export this early proof input to HE.8b," stays. HE.8b's proof of BCS Theorems 1.2.2/1.2.4 uses the Greenberg half of Proposition 5.2.1.
4. **Copies.** The atlas records `AutomorphicCongruences:L5` and `AutomorphicCongruences:L5a` are regenerated from the README; no hand edit is needed. The edges are in /30 (KatoEulerSystems:L5 → AC:L5a) and /15 (the owner of CGS Prop 2.4.5).

5. **Audits (merged in `data/library-coverage.json`).**
   - Layer AC:L5a (AUDIT-23), first target: "BCS v2 Theorem 4.2.1's two-variable Iwasawa–Greenberg comparison, using L5w's Wan–Fujiwara input" → "BCS v2 Proposition 5.2.1 (with Lemmas 5.1.1–5.1.2 and 5.2.3), using L5w's Wan–Fujiwara input and importing Theorem 4.1.3/Corollary 4.1.4 from KatoEulerSystems L5". Third target: "The CM-evaluation/μ calculation via AutomorphicPadicLFunctions L3h and its BCS specialization" → "BCS Proposition 4.2.2 from Hsieh's Theorem B and CGS Proposition 2.4.5 (AutomorphicPadicLFunctions L3h)". The verdict stays "not built", library "absent".
   - Layer HE.8b (AUDIT-25): drop the `duplicates` entry for AC:L5a, whose note is "Owns BCS v2 Theorem 4.2.1's two-variable Iwasawa–Greenberg comparison, which HE.8b also pins". After this fix L5a no longer claims Theorem 4.2.1, so there is no duplicate.

### Not done, and why
- **The red team's replacement text is widened.** It named "Theorem 4.1.3 … with Lemmas 5.1.1–5.1.2, Proposition 4.2.2 and Proposition 5.2.1". The proof of Proposition 5.2.1 actually applies the product form, Corollary 4.1.4 ("Proposition 4.1.3 (and its proof) implies" a divisibility for L_p(g/K)·L_p(g^F/K)). So Corollary 4.1.4 is named as well. It follows from Theorem 4.1.3's exact sequences because characteristic ideals are multiplicative; /30 states the identity that gives both at once.
- **L5a no longer "owns" Theorem 4.1.3.** Under /30 it imports it: the review confirms that BSD.6a already owns the BSTW comparison, so a second owner in L5a would be the duplicate that /30 removes.
- **RS-11's C.L5a row** ("Correct its BCS locator") is consistent with this fix and needs no amendment.

## /30 (medium, duplicate): the BSTW two-variable zeta element (ordinary case) and its main-conjecture comparison get one owner, a new KatoEulerSystems L5, upstream of AC L5a and BSD.6a

### What the verifier corrected
- Confirmed without correction. There is no edge between AC L5a and BSD.6a. BSD.6a already owns both the two-variable zeta element and the main-conjecture comparison that L5a claims. So the comparison is planned twice, and L5a has no supplier for the zeta element it needs.
- The review pairs /30 with /15: both concern BSD.6a's anticyclotomic inputs, and ownership is settled together. The decision is recorded in both sections.

### State on main (45d60f04)
- **`content/campaign/RankZeroOneBSD/README.md`, BSD.6a** (lines 91–103), unchanged since 15 September:
  - "Here own the source-specific two-variable zeta-element construction (Theorem 1.14, §§3–6), reusing KatoEulerSystems' actual Beilinson–Kato classes, PadicFamilies' CM family machinery and PadicHodgeRegulators' maps, and prove **both** explicit reciprocity laws and their common integral normalization."
  - "Prove the main-conjecture comparison and cyclotomic descent of §§9–10 using the genuinely separate CLW semi-ordinary congruence divisibility from AutomorphicCongruences L2s and the Kato signed bound."
  - A script confirms that each sentence occurs exactly once.
- **AC L5a** claims the same comparison (/29).
- **Both stages exist** in `data/atlas.json` and in the assembled graph (2840 stages, 7792 edges), and neither is an ancestor of the other.
- **The BSD.6/BSD.6a records.** Their atlas records are byte-identical (5967 characters; /13 and low finding /39). The edits below are to the README and reach both records when they are re-extracted.
- **KatoEulerSystems** has stages L0–L4 only. Its README (84 lines) has no zeta element over an imaginary quadratic field. `KatoEulerSystems:L5` is not used in `data/atlas.json`, `research/blueprint/reserved-ids.json` or `data/decompositions/KatoEulerSystems.json`.
- **Other files.**
  - The KatoEulerSystems decomposition (integrated 16 September) and packet (24 September) do not mention BSTW.
  - No packet covers BSD.6a. The only RankZeroOneBSD packet is BSD.7's, which covers BSD.8/BSD.9 nodes only.
  - No accepted or pending RS touches the zeta element.
- **Disclosure.** KatoEulerSystems L3/L4 are targets of route 2 of PAPER-KOLYVAGIN-90, which this session extracted. The new stage only imports L3/L4 and changes neither. The fix follows the verifier.
- **Source, read for this fix.** BSTW = Burungale–Skinner–Tian–Wan, *Zeta elements for elliptic curves and applications*, arXiv:2409.01350v2 (11 September 2024):
  - §1.2 fixes the setting: (1.3) (D_L, N) = 1; (1.4) p = v v̄ split in L; (1.5) E[p](L) = 0 or (1.6) E[p] irreducible over G_L; (1.7) a_p = 0 in the supersingular case.
  - **Theorem 1.14** gives a zeta element Z(E/L) ∈ H¹_rel,◦(O_L[1/p], T(1) ⊗̂ Λ_L) with Col_v̄(loc_v̄ Z) = L_p(E/L) and Log_v(loc_v Z) = L^Gr_p(E/L). Remark 1.15(i) says (1.3) and (1.5) "are not essential", but change the shape of the reciprocity laws.
  - §5 is the ordinary case and §6 the supersingular case.
  - **§9.3.2, Proposition 9.18.** The hypotheses are: g ∈ S₂(Γ₀(N)); p ∤ 2N ordinary or supersingular; L satisfying (2.15) (p split), (9.9) ((D_L, N) = 1) and (van_L) (T̄^{G_L} = 0, §2.2.5); and (nv) in the cyclotomic case. The conclusion is that a one-sided divisibility in one of Conjectures 9.10, 9.12 and 9.14 implies the analogous one in the others, integrally under (van_L) and in Λ ⊗ Q_p without it.
  - **Proof of 9.18.** "We present the ordinary case assuming the hypothesis (van_L), and leave the supersingular case to the interested reader." It uses the exact sequences (9.11)–(9.13), (rk) = Theorem 3.9(b), the nonvanishing (nv), Proposition 5.25 and Remark 3.21.
  - **BCS Theorem 4.1.3** (arXiv:2405.00270v2) is proved by citing exactly this ("[BSTW23, §9.3.2]").

### The mathematics the owner must state
From (9.12), 0 → H¹_rel,ord/Λ·Z → Λ^ur/(L^Gr_p) → X_Gr → X_st,ord → 0, and from (9.13), 0 → H¹_rel,ord/Λ·Z → Λ/(L_p) → X_ord → X_st,ord → 0 (after extending scalars to Λ^ur):
- ch(H/ΛZ)·ch(X_Gr) = (L^Gr_p)·ch(X_st), and
- ch(H/ΛZ)·ch(X_ord) = (L_p)·ch(X_st).

H has rank one (rk) and Z ≠ 0, so H/ΛZ is torsion. Both p-adic L-functions are nonzero, and X_st is torsion by (9.13). So both X_Gr and X_ord are torsion, and

  **ch(X_Gr)·(L_p) = ch(X_ord)·(L^Gr_p)** as ideals of Λ^ur_L (integrally under (van_L), otherwise after inverting p).

This one identity gives every direction of BCS Theorem 4.1.3, and by multiplicativity Corollary 4.1.4 for products. It is stated as the target, so that no consumer re-derives it.

### Fix
1. **`content/campaign/KatoEulerSystems/README.md`: new stage L5.** Insert immediately before "## Shared conventions and sources" (occurs once):
   ```markdown
   ## L5. Two-variable zeta elements over imaginary quadratic fields (ordinary case)

   **Milestone:** `L5`

   Let E/Q have conductor N and let p ∤ 2N be a prime of good ordinary reduction. Let L be an imaginary quadratic field with (D_L, N) = 1 in which p = v v̄ splits (v fixed by the embedding at p), with Z_p^2-extension L_∞, Λ_L = Z_p[[Gal(L_∞/L)]] and Λ_L^ur = Λ_L ⊗̂ W(F̄_p). Assume E[p](L) = 0 (BSTW (1.5)); the variants without (1.3) or (1.5) that BSTW Remark 1.15(i) mentions are not targets until their reciprocity laws are stated. From the Beilinson–Kato classes of L2–L3, varied along PadicFamilies L4's CM Hida family, construct the zeta element Z(E/L) ∈ H^1_rel,ord(O_L[1/p], T(1) ⊗̂ Λ_L), whose localisation at v lies in the image of H^1(L_v, T^+(1) ⊗̂ Λ_L). Prove BSTW Theorem 1.14 in the ordinary case: the first explicit reciprocity law Col_v̄(loc_v̄ Z) = L_p(E/L) and the second Log_v(loc_v Z) = L^Gr_p(E/L) in Λ_L^ur, with PadicHodgeRegulators L3's Coleman and Perrin-Riou maps and one common integral normalization (BSTW §§3–5). The zeta element is constructed, not defined by its images. Prove (rk): H^1_rel,ord(L, T ⊗ Λ_L) is Λ_L-torsion-free of rank one (BSTW Theorem 3.9(b)); and Z ≠ 0.

   Prove BSTW Proposition 9.18 in the ordinary case, over Λ_L and over its cyclotomic quotient (the latter under the non-torsion hypothesis (nv) on both localisations), in the following form. X_Gr(g/L) and X_ord(g/L) are Λ-torsion, and

       ch(X_Gr(g/L)) · (L_p(g/L)) = ch(X_ord(g/L)) · (L^Gr_p(g/L))   in Λ_L^ur,

   integrally under (van_L): T̄^{G_L} = 0, and after inverting p without it. Derive it from the Poitou–Tate sequences (9.11)–(9.13), (rk) and the two reciprocity laws. Export the equivalence of one-sided divisibilities in both directions (BCS v2 Theorem 4.1.3, which assumes (spl), (D_K,N)=1 and (irr_K), and (irr_K) implies (van_K)), its product form for two forms (BCS Corollary 4.1.4), and BSTW Lemma 9.17's relation with the cyclotomic conjectures for g and g ⊗ χ_L.

   The Greenberg function L^Gr_p(E/L) is Hida's Rankin–Selberg p-adic L-function against the CM family. Import it from its owner (see RT-AREA-iwasawa-1/26); do not construct a second one here. The supersingular zeta element (BSTW §6) and the supersingular case of Proposition 9.18 are RankZeroOneBSD BSD.6a's.

   **Inputs.** L3–L4; PadicFamilies L4; PadicHodgeRegulators L3; SelmerIwasawaCohomology L3; AutomorphicPadicLFunctions L3.

   Source: Burungale–Skinner–Tian–Wan, *Zeta elements for elliptic curves and applications*, arXiv:2409.01350v2, Theorem 1.14, §§3–5, Proposition 9.18 and Lemma 9.17.
   ```
   And in the same README, replace "**Producer–consumer handoff.** ModularIwasawaMainConjectures receives a precisely oriented divisibility from L4; AutomorphicCongruences constructs the independent reverse direction." with:
   > **Producer–consumer handoff.** ModularIwasawaMainConjectures receives a precisely oriented divisibility from L4; AutomorphicCongruences constructs the independent reverse direction. L5's zeta element and the Perrin-Riou/Greenberg comparison go to AutomorphicCongruences L5a and RankZeroOneBSD BSD.6a, which import them and do not reprove them.
2. **`data/atlas.json`.**
   - Add the stage `KatoEulerSystems:L5` (title "Two-variable zeta elements over imaginary quadratic fields (ordinary case)"), with `requires` [KatoEulerSystems:L3, KatoEulerSystems:L4, PadicFamilies:L4, PadicHodgeRegulators:L3, SelmerIwasawaCohomology:L3, AutomorphicPadicLFunctions:L3] and `consumers` [AutomorphicCongruences:L5a, RankZeroOneBSD:BSD.6a].
   - Add the stageEdges records for these six inputs and for L5 → AC:L5a and L5 → BSD.6a.
   - Add `KatoEulerSystems:L5` to the `requires` of AC:L5a and of BSD.6a.
   - **Cycle tests**, cumulative with this group's other edges (/15, /31) in the assembled graph: all eight edges are acyclic. There is no path from AC:L5a or BSD.6a back to any input; in particular AC:L5a is not an ancestor of KatoEulerSystems L4 or PadicFamilies L4.
3. **`content/campaign/RankZeroOneBSD/README.md`, BSD.6a.** Replace "Here own the source-specific two-variable zeta-element construction (Theorem 1.14, §§3–6), reusing KatoEulerSystems' actual Beilinson–Kato classes, PadicFamilies' CM family machinery and PadicHodgeRegulators' maps, and prove **both** explicit reciprocity laws and their common integral normalization." with:
   > Import from KatoEulerSystems L5 the ordinary-case zeta element (Theorem 1.14, §§3–5), both of its explicit reciprocity laws and the ordinary-case Perrin-Riou/Greenberg comparison (Proposition 9.18). Here own only the supersingular construction (BSTW §6: Kobayashi's signed local conditions, both signed reciprocity laws and their common integral normalization), built on L5's classes and PadicHodgeRegulators' maps, and the supersingular case of Proposition 9.18. BSTW prove that case only in outline ("leave the supersingular case to the interested reader"), so write its proof out here and record it as a source gap until it is written.
4. **The same README, BSD.6a.** Replace "Prove the main-conjecture comparison and cyclotomic descent of §§9–10 using the genuinely separate CLW semi-ordinary congruence divisibility from AutomorphicCongruences L2s and the Kato signed bound." with:
   > Prove the signed (supersingular) main-conjecture comparison and the cyclotomic descent of §§9–10, using the genuinely separate CLW semi-ordinary congruence divisibility from AutomorphicCongruences L2s and the Kato signed bound; the ordinary comparison is KatoEulerSystems L5's.
5. **BSD.6a's Dependencies line** gains "KatoEulerSystems L5". The full new line is in /15, edit 5.

6. **Audit (merged, AUDIT-27, layer BSD.6a).** The target "BSTW two-variable zeta-element construction and both explicit reciprocity laws" becomes "BSTW supersingular zeta element (§6), its signed reciprocity laws and the supersingular case of Proposition 9.18; the ordinary construction is imported from KatoEulerSystems L5". The new stage KatoEulerSystems:L5 has no audit entry. It is absent from both libraries: `declarations.tsv` has no zeta-element, Kolyvagin or Heegner declaration, and Mathlib's only "Iwasawa" declarations are group-theoretic.

### Not done, and why
- **Where the owner goes.** The red team offered a new AutomorphicCongruences substage, or a split into an early RankZeroOneBSD or KatoEulerSystems stage. KatoEulerSystems is chosen:
  - the zeta element is Beilinson–Kato elements varied in a CM family, and KatoEulerSystems owns those classes and their reciprocity laws;
  - KatoEulerSystems L4 is already a supplier of BSD.6a, and becomes one of AC L5b under /31;
  - a congruence roadmap (AC) is not the natural owner of an Euler-system construction.
- **The Greenberg p-adic L-function** L^Gr_p(E/L) has no owner in the atlas. It is Hida's Rankin–Selberg function against the CM family, which /26 asks to be planned. L5 imports it and gets no edge until that layer exists. The coordinator should cycle-test that layer → KatoEulerSystems:L5 when it is created.
- **What BSD.6a keeps.** The red team's phrase "BSD.6a keeps only the supersingular/signed specialisation" refers to the zeta element. BSD.6a also keeps, unchanged, the Castella multiplicative branch (/15) and the JSW supersingular route.

## /31 (medium, error): L5b requires KatoEulerSystems L4 instead of HE.8b, and the staged order becomes L5w → L5a → {L5b, HE.8b}

### What the verifier corrected
- Confirmed without correction. L5b's `requires` are AC L5a and HE.8b only. It requires the anticyclotomic endpoint that the cyclotomic proof does not use, and it has no Kato supplier, which that proof does use.
- **One detail of the red team's evidence differs in the assembled graph.** The red team says KatoEulerSystems L4 reaches L5b "only through BSD.7a -> HE.8b". In the graph `scripts/build.py` assembles, the shortest path is KatoEulerSystems:L4 → ModularIwasawaMainConjectures:L0 → HE.8b → AC:L5b. Both routes pass through HE.8b, so the defect and the fix are unchanged.

### State on main (45d60f04)
- **`content/campaign/AutomorphicCongruences/README.md`**, unchanged since 15 September. A script confirms that each quoted sentence occurs exactly once.
  - L5b (line 80): "After HE.8b's anticyclotomic endpoint, prove the local-control and quadratic-twist factorization arguments needed to descend and separate the cyclotomic factors in BCS Theorem 1.1.2."
  - Line 82: "Thus the staged order is early HE/GZ and L5w → L5a → HE.8b → L5b → ModularIwasawaMainConjectures L3."
  - Line 111: "**Producer–consumer handoff.** HE.8b imports L5a and its L5w supplier before L5b; ModularIwasawaMainConjectures receives the final reverse divisibility on Kato-compatible lattices."
- **Two more places state the same order.**
  - HeegnerPointEulerSystems README line 144: "L5b consumes HE.8b after its independent L5a supplier."
  - ModularIwasawaMainConjectures README line 109: "AutomorphicCongruences L5b's final cyclotomic descent comes after HE.8b."
  - Each occurs exactly once.
- **`data/atlas.json`.** L5b `requires` [AC:L5a, HE.8b]; stageEdges {AC:L5a → AC:L5b} and {HE.8b → AC:L5b}. HE.8b's `consumers` are AC:L5b, HE.8c, MIMC:L6 and BSD.6.
- **The Kato supplier exists.** KatoEulerSystems L4 owns Kato's Theorem 17.4, as node `KatoEulerSystems:L4/ordinary-selmer-divisibility` in `data/decompositions/KatoEulerSystems.json` (integrated 16 September). Its statement includes "(Thm. 17.4): (1) X(T) is a torsion Lambda-module; (2) … length_{Lambda_p}(X(T)_p) <= ord_p(L_{p-adic,…}(f)) for every height-one prime p not containing p; (3) … the same length inequality holds for every height-one prime p."
- **Pending RS-11** (`research/blueprint/restructure/RS-11.result.json`, unreviewed) already has the link {KatoEulerSystems:L4 → AC:L5b}, reason "Supply the independent Kato bounds for each factor in the BCS cyclotomic descent". But its C.L5b row in RS-11.md says: "Preserve the existing HE.8b comparison dependency". That conflicts with this confirmed finding.
- **Disclosure.** KatoEulerSystems L4 is a target of route 2 of PAPER-KOLYVAGIN-90 (this session's extraction). This fix only adds an edge from it and follows the verifier.
- **Source, read for this fix.** BCS arXiv:2405.00270v2, p. 10, "Proof of Theorem 1.1.2". It uses:
  - Proposition 5.2.1 (the Perrin-Riou product divisibility (5.2));
  - "[CGS23, Prop. 1.2.4]", which is CGS v1 numbering; in CGS arXiv:2303.04373v2 it is Proposition 2.2.4, L^PR_p(E/K)⁺ = L^MSD_p(E/Q)·L^MSD_p(E^K/Q) up to a unit (both versions read);
  - Skinner–Urban Propositions 3.6 and 3.9;
  - "[Kat04, Thm. 17.4]": "(L_p(g/Q)) ⊂ ch_Λ(X_ord(g/Q∞)) (5.4) in Λ if hypothesis (im) holds, and in Λ ⊗ Q_p otherwise".

  Theorem 4.2.1 is used only in the proof of Theorems 1.2.2/1.2.4 ("Together with Theorem 4.2.1, this concludes the proof"). The cyclotomic proof does not use it.
- **What removing the edge does to ancestry.** With HE.8b → L5b removed, HE.8b stops being an ancestor of AC:L5b, AC:L5 and MIMC:L3. It stays an ancestor of MIMC:L6, the anticyclotomic interface. MIMC L3's text (BCS Theorem 1.1.2, cyclotomic) does not use HE.8b.

### Fix
1. **`data/atlas.json`.**
   - L5b `requires` [AC:L5a, HE.8b] → [AC:L5a, KatoEulerSystems:L4].
   - Remove the stageEdges record {HE.8b → AC:L5b} (maintainer's removal); remove AC:L5b from HE.8b's `consumers`.
   - Add {KatoEulerSystems:L4 → AC:L5b}; add AC:L5b to KatoEulerSystems:L4's `consumers`.
   - Cycle test for KatoEulerSystems:L4 → AC:L5b, applied after the removal: acyclic (no path from AC:L5b to KatoEulerSystems:L4).
2. **`content/campaign/AutomorphicCongruences/README.md`, L5b.** Replace "After HE.8b's anticyclotomic endpoint, prove the local-control and quadratic-twist factorization arguments needed to descend and separate the cyclotomic factors in BCS Theorem 1.1.2." with:
   > Prove BCS Theorem 1.1.2 by its own proof, which does not use HE.8b's anticyclotomic endpoint or BCS Theorem 4.2.1:
   > - from L5a's Proposition 5.2.1 (the Perrin-Riou product divisibility (5.2)), project to the cyclotomic line with CGS v2 Proposition 2.2.4 (v1 Proposition 1.2.4: L^PR_p(E/K)⁺ = L^MSD_p(E/Q)·L^MSD_p(E^K/Q) up to a unit) and Skinner–Urban Propositions 3.6 and 3.9, obtaining the four-factor divisibility (5.3) for g, g^K, g^F and g^{FK};
   > - compare it with Kato's opposite divisibility (5.4), imported from KatoEulerSystems L4 (Kato's Theorem 17.4), for each of the four forms, integrally under (im) and after inverting p otherwise, and conclude equality factor by factor. A product bound alone is not an equality for one factor.
   >
   > Prove the local-control and quadratic-twist factorization arguments this needs.
3. **The same README, line 82.** Replace "Thus the staged order is early HE/GZ and L5w → L5a → HE.8b → L5b → ModularIwasawaMainConjectures L3." with:
   > Thus the staged order is early HE/GZ and L5w → L5a → {L5b, HE.8b}, with KatoEulerSystems L4 → L5b and L5b → ModularIwasawaMainConjectures L3. HE.8b and L5b are independent consumers of L5a.
4. **The same README, line 111.** Replace "**Producer–consumer handoff.** HE.8b imports L5a and its L5w supplier before L5b; ModularIwasawaMainConjectures receives the final reverse divisibility on Kato-compatible lattices." with:
   > **Producer–consumer handoff.** HE.8b and L5b each import L5a and its L5w supplier, independently of each other; ModularIwasawaMainConjectures receives the final reverse divisibility on Kato-compatible lattices.
5. **`content/campaign/HeegnerPointEulerSystems/README.md`, line 144.** Replace "L5b consumes HE.8b after its independent L5a supplier." with "L5b does not consume HE.8b; both consume L5a."
6. **`content/campaign/ModularIwasawaMainConjectures/README.md`, line 109.** Replace "AutomorphicCongruences L5b's final cyclotomic descent comes after HE.8b." with "AutomorphicCongruences L5b's final cyclotomic descent needs L5a and KatoEulerSystems L4, not HE.8b."
7. **Pending RS-11.** Keep its link KatoEulerSystems:L4 → AC:L5b. Amend its C.L5b row in RS-11.md, "Preserve the existing HE.8b comparison dependency", to "Drop the HE.8b dependency (RT-AREA-iwasawa-1/31); the cyclotomic proof uses L5a and Kato's Theorem 17.4 only." This is for the reviewer of RS-11. If RS-11 is accepted first, its link already supplies edit 1's addition, and only the removal is left.

### Not done, and why
- **CGS v2 Proposition 2.2.4** (the cyclotomic projection of L^PR_p) has no separate owner in the atlas. It is an interpolation comparison, and L5b proves it in place (edit 2). It is not an Eisenstein result, so it is not routed through BSD.7a.
- **HE.8b's own text** ("Do not import completed L5b's return cyclotomic descent") is already consistent and stays.

## /32 (medium, error): L4e carries Eischen–Wan's regular (pairwise distinct) Satake characters and temperedness, and its consumers verify them

### What the verifier corrected
- Confirmed without correction. The finding restores two hypotheses of Eischen–Wan Theorem 1.2 that L4e drops.
  - **Pairwise distinct χ_i.** Without it the p-stabilised vector is not unique.
  - **Temperedness.** The source calls it a convenience of the pullback computation, but does not remove it.

### State on main (45d60f04)
- **L4e has not changed since 15 September.** `content/campaign/AutomorphicPadicLFunctions/README.md` line 64: "Construct the genuinely distinct vector-valued Klingen family, Eisenstein measure, pullback identity and local zeta calculations for a cusp representation of definite GU(r,0), unramified principal series at an odd split p over an imaginary quadratic field."
- **Accepted RS-14** keeps L4e ("Retain the distinct Eischen–Wan arXiv:1404.7153v2 … construction") and names no hypothesis on π_p.
- **The APL packet** has L4e `not_read`. Its remaining item says: "Retain the rank r=2 restriction on the cited constant-term divisibility statements and all integral-section hypotheses." It names neither hypothesis.
- **The consumers' texts:**
  - AC L2 (line 40): "L2 imports the finite-slope Klingen construction from AutomorphicPadicLFunctions L4e (Eischen–Wan)".
  - AC L2s (line 44): "Reuse … AutomorphicPadicLFunctions L4e's doubling construction".
  - RankZeroOneBSD BSD.6a (line 96): "Its reverse divisibility imports AutomorphicCongruences L2's FW proof, AutomorphicPadicLFunctions L3h's Hsieh μ theorem and L4e's Eischen–Wan construction."
  - None states the hypotheses.
- **Read at the source** (arXiv:1404.7153v2, 29 September 2026):
  - Theorem 1.2 (p. 4): "Let π be a tempered irreducible cuspidal automorphic representation of GU(r, 0) of weight k = (a1, …, ar), a1 ≥ ··· ≥ ar ≥ 0, such that πp is the unramified principal series representation π(χ1, …, χr) for characters χ1, …, χr such that the χi's are pairwise distinct. Let ϕ ∈ π^{K0(p)} be an eigenvector for all the Hecke operators at p."
  - Proposition 4.8, proof (p. 25): "By assumption (τ2⁻¹, χ1, ···, χr, τ1) is regular in the sense of Casselman. … The uniqueness follows from the assumption that the χi's are pairwise distinct."
  - Section 5, printed p. 34: "(Although in our discussion for Klingen Eisenstein series we assumed the form we start with is tempered. However this is only for convenience of explicit calculation for pullback formula and is by no means serious. As long as the datum is in the absolutely convergence range the whole argument works.)"
- **The mathematics checks.**
  - For an unramified principal series π(χ1, …, χr), the Iwahori-fixed vectors that are U_{t_i}-eigen correspond to orderings of the Satake characters. They form one line per ordering only when the characters are regular in Casselman's sense.
  - Without distinctness, the ordering EW fix does not determine a unique stabilised line. So neither the family nor the Klingen section attached to ϕ is well defined.
  - Temperedness enters only the explicit pullback calculation (p. 34). Removing it needs the absolute-convergence argument EW only sketch.

### Fix
1. **`content/campaign/AutomorphicPadicLFunctions/README.md`, L4e.** Replace "Construct the genuinely distinct vector-valued Klingen family, Eisenstein measure, pullback identity and local zeta calculations for a cusp representation of definite GU(r,0), unramified principal series at an odd split p over an imaginary quadratic field." (occurs once) with:
   > Construct the genuinely distinct vector-valued Klingen family, Eisenstein measure, pullback identity and local zeta calculations for a tempered cusp representation π of definite GU(r,0), unramified principal series π_p = π(χ_1,…,χ_r) at an odd split p over an imaginary quadratic field, with pairwise distinct Satake characters χ_1,…,χ_r (regular p-stabilisation: EW Proposition 4.8's stabilised vector is unique only under this hypothesis), and ϕ ∈ π^{K_0(p)} an eigenvector for all Hecke operators at p, as in EW Theorem 1.2. Temperedness is EW's hypothesis for the pullback computation. It is removable only by the separate absolute-convergence argument sketched on p. 34, which is not a target here; until that argument is proved, keep temperedness as a hypothesis.
2. **Consumers.** Each checks both hypotheses where it applies L4e.
   - **AC L2, line 40.** Replace "L2 imports the finite-slope Klingen construction from AutomorphicPadicLFunctions L4e (Eischen–Wan), and Hsieh's μ/nonvanishing theorem from L3h." (occurs once) with:
     > L2 imports the finite-slope Klingen construction from AutomorphicPadicLFunctions L4e (Eischen–Wan), with its hypotheses that the definite unitary representation is tempered and has pairwise distinct Satake characters at p (verified here for the representation FW attach to f), and Hsieh's μ/nonvanishing theorem from L3h.
   - **AC L2s, line 44.** Replace "Reuse L0's extension algebra and AutomorphicPadicLFunctions L4e's doubling construction, with explicit comparison maps, rather than duplicate them." (occurs once) with:
     > Reuse L0's extension algebra and AutomorphicPadicLFunctions L4e's doubling construction, with explicit comparison maps, rather than duplicate them; verify L4e's temperedness and pairwise-distinct-Satake-character hypotheses for the representation attached to π.

     /7's inserted sentence follows this one.
   - **RankZeroOneBSD BSD.6a, line 96.** Replace "Its reverse divisibility imports AutomorphicCongruences L2's FW proof, AutomorphicPadicLFunctions L3h's Hsieh μ theorem and L4e's Eischen–Wan construction." (occurs once) with:
     > Its reverse divisibility imports AutomorphicCongruences L2's FW proof, AutomorphicPadicLFunctions L3h's Hsieh μ theorem and L4e's Eischen–Wan construction, the last under L4e's tempered and regular (pairwise distinct Satake characters at p) hypotheses as verified in AutomorphicCongruences L2/L2s.

     If /15 or /30 rewrites this sentence, carry the added clause over.
3. **How a consumer discharges the hypotheses.** This goes as guidance in the APL packet's L4e coverage, not as new README text. For the representation of GU(2,0) attached to a weight-k cuspidal newform f unramified at p, with p split in K, GU(2)(Q_p) ≅ GL_2(Q_p) × Q_p^×, so the Satake characters at p are twists of the roots α, β of X² − a_p X + ε(p)p^{k−1}.
   - **Distinctness** is α ≠ β.
     - For an elliptic curve (k = 2, a_p ∈ Z), α = β would force a_p² = 4p, which is impossible.
     - For general weight-2 newforms, α ≠ β is the Coleman–Edixhoven theorem (Math. Ann. 310 (1998)).
     - For k > 2 it is not known in general, so it must be kept as a hypothesis.
   - **Temperedness** follows at every place from Deligne's Ramanujan bound for f, transported through the Jacquet–Langlands/base-change construction the consumer uses.

   These are proof obligations of the consumers, stated here so they are not overlooked. Coleman–Edixhoven was not reread for this report; it is cited from memory of the published statement and is to be checked at decomposition.
4. **APL packet**, L4e `coverage.remaining`: append "Carry EW Theorem 1.2's hypotheses: π tempered (removable only via the p.34 absolute-convergence remark), π_p = π(χ_1,…,χ_r) with pairwise distinct χ_i (uniqueness in Proposition 4.8), ϕ Hecke-eigen at p."

### Not done, and why
- **No change to Theorem 1.2(iii)'s r = 2 restriction.** It is already in L4e. The r = 2 case also rests on the existence of a tempered, ℓ-ordinary form at a split ℓ, which EW Remark 1.4 derives from Sato–Tate. That is an input not named in L4e; it is outside this finding, and noted only.
- **CLW's use of L4e also invokes Eischen–Liu's archimedean computation** for general infinity type (CLW §1, Remark 1.0.2: "the interpolation formulas in [EW16] are completely computed for k1 = 0, and one can get the general case by using … [EL]"). This is outside this finding, and noted only.

## /33 (medium, error): L2's per-place growth is split — growth and uniqueness only for F totally real (Leopoldt, tighter slope) or imaginary quadratic, from the works BSW cite; for general F only BSW's independence of choices

### What the verifier corrected
- Confirmed without correction.
- The accepted RS-14 narrowing keeps per-place growth in L2.
- BSW prove admissibility only for totally real or imaginary quadratic base fields, under tighter conditions, and say that for a general number field the right notion is unclear.
- So the stage plans a theorem the source does not prove.

### State on main (45d60f04)
- **L2 has not changed since 15 September.** `content/campaign/AutomorphicPadicLFunctions/README.md` line 40: "Construct the automorphic cycles and their distribution-valued evaluations, prove distribution relations, independence of representatives and unit descent, and establish the order of growth at every q."
- **L0** (line 26): "Its uniqueness follows only in the range established by the relevant growth theorem."
- **The acceptance line** (line 72): "**Acceptance:** the BSW construction for all number fields in its actual small-slope range, with Q/Hilbert/Bianchi comparisons; …".
- **Accepted RS-14** (`data/restructure/RS-14.result.json`, L2 `keeps`): "Prove unit descent, distribution/norm relations, per-place growth and Theorem 11.1 …". The L0 entry keeps "the conditional cohomological evaluation principle with actual lifts, norm relations and growth/uniqueness hypotheses".
- **The APL packet already half-corrects this.** `research/blueprint/packets/AutomorphicPadicLFunctions.json` (#3100, 26 September) was committed after the red team.
  - Its L2 coverage item says: "Read and decompose the growth and Theorem 11.1 interpolation proof … Section 12 does not prove general-number-field uniqueness."
  - Its L0 item says: "Separate any interpolation uniqueness statement from construction; establish the precise determining family and growth hypotheses in cases where known."
  - Its gap "Control, norm relation and interpolation" says the checkpoint "does not prove … uniqueness by interpolation".
  - The stage text and RS-14's record still carry the general-F growth target.
- **Read at the source** (Barrera Salazar–Williams, *P-adic L-functions for GL2*, arXiv:1602.06244v3, 29 September 2026):
  - Introduction, p. 4: "In the case that F is totally real or imaginary quadratic, given slightly tighter conditions on the slope one can prove that the distribution we obtain is admissible, that is, it satisfies a growth property that then determines the distribution uniquely. In the general situation, it is rather more difficult to define the correct notion of admissibility; we discuss this further in Section 12. We instead settle for proving that our construction is independent of choice".
  - §12, p. 39:
    - "When F is a totally real or imaginary quadratic field, we can prove a uniqueness property … see [BS13] and [Wil17] for the totally real and imaginary quadratic situations respectively."
    - "When F is totally real, the unit group is in a sense 'maximal' if we assume Leopoldt's conjecture … the quotient is just one dimensional".
    - For F = Q(∛2) the distribution "can 'grow' in two independent directions" while Hecke characters are all of parallel type, so "there are simply not enough Hecke characters".
    - "Without the theory of admissibility at hand in the latter situation, however, we cannot show that the distribution constructed in this paper is (in general) unique."
  - Proposition 9.6 (p. 31): "For fixed f, this is independent of the choice of class group representatives."
  - After Theorem 9.10 (p. 34): "This is well-defined and independent of choices up to a fixed choice of uniformisers at primes above p."
  - p. 40: Bergdall–Hansen [BH17] "removes this dependency on uniformisers" in the Hilbert case.
- **One more restriction the finding did not state.** Even BSW's independence is only up to a fixed choice of uniformisers at the primes above p. L2's "independence of representatives" must not become independence of all choices.

### Fix
1. **L2, line 40.** Replace "Construct the automorphic cycles and their distribution-valued evaluations, prove distribution relations, independence of representatives and unit descent, and establish the order of growth at every q." (occurs once) with:
   > Construct the automorphic cycles and their distribution-valued evaluations, and prove distribution relations and unit descent. Prove independence of the class-group representatives (BSW Proposition 9.6) and of the remaining choices up to a fixed choice of uniformisers at the primes above p (BSW after Theorem 9.10); the dependence on uniformisers is removed only by Bergdall–Hansen's construction in the Hilbert case. Growth and uniqueness are split by base field.
   > - For F totally real, assuming Leopoldt's conjecture for F and p (so that the ray-class quotient has one direction), and for F imaginary quadratic, under the slightly tighter slope conditions of the works BSW cite: prove admissibility (the order of growth) and uniqueness of the distribution by its critical values. The sources are Barrera Salazar's thesis/Ann. Inst. Fourier paper [BS13] for F totally real and Williams, Proc. LMS 114 (2017), for F imaginary quadratic, or Bergdall–Hansen for the Hilbert case. Each hypothesis is taken from the source used.
   > - For general F no admissibility notion is established (BSW §12): state only BSW's independence of choices. Record per-place growth, and uniqueness by interpolation, as open statements. They are not BSW targets and nothing downstream may use them.
2. **L0, line 26.** Replace "Its uniqueness follows only in the range established by the relevant growth theorem." (occurs once) with:
   > Its uniqueness follows only in the range established by the relevant growth theorem; for GL2 over F this is F totally real (with Leopoldt's conjecture and the tighter slope condition) or F imaginary quadratic, and over a general number field no uniqueness is claimed.
3. **Acceptance line, line 72.** Replace "**Acceptance:** the BSW construction for all number fields in its actual small-slope range, with Q/Hilbert/Bianchi comparisons;" (occurs once) with:
   > **Acceptance:** the BSW construction for all number fields in its actual small-slope range, independent of choices up to the fixed uniformisers at p, with growth and uniqueness only for totally real (under Leopoldt) and imaginary quadratic F, and with Q/Hilbert/Bianchi comparisons;
4. **Handoff table, row `L2`** (line 102). Replace "| `L2` | Construct BSW cycles in degree r1+r2 and prove the ramification-normalized slope bound and each local interpolation factor on the actual Hecke-character domain. |" (occurs once) with:
   > | `L2` | Construct BSW cycles in degree r1+r2 and prove the ramification-normalized slope bound and each local interpolation factor on the actual Hecke-character domain; growth/uniqueness only for totally real (Leopoldt) or imaginary quadratic F. |
5. **Accepted RS-14's record** (`data/restructure/RS-14.result.json`, `layers["AutomorphicPadicLFunctions:L2"].keeps`). Replace "Prove unit descent, distribution/norm relations, per-place growth and Theorem 11.1" with "Prove unit descent, distribution/norm relations, independence of choices up to fixed uniformisers at p (BSW Prop. 9.6 and after Thm 9.10), per-place growth and uniqueness only for F totally real (under Leopoldt) or imaginary quadratic (from BS13/Wil17 or Bergdall–Hansen), and Theorem 11.1". This is a correction to an accepted record: the maintainer's edit.
6. **APL packet**, L2 coverage: no change needed. Its item "Section 12 does not prove general-number-field uniqueness" already matches, and the next checkpoint should cite edit 1.

### Not done, and why
- **The totally-real and imaginary-quadratic growth theorems were not read here.** Only BSW's description of them was read (Barrera Salazar's thesis and Ann. Inst. Fourier paper; Williams 2017; Bergdall–Hansen). The exact slope bound and whether Leopoldt is assumed are to be taken from those sources at decomposition. The replacement text says so rather than fixing a bound.
- **The finding's "(with the Leopoldt and slope conditions)" is kept.** BSW §12 ties the totally real case to Leopoldt's conjecture, and the introduction ties both cases to "slightly tighter conditions on the slope". Both are carried as hypotheses, not asserted as theorems.

## /34 (medium, error): APL L1's imports get their edges (ALS.1–ALS.3, ALS.5, AF.4, R16.5), and the GL2/F Eichler–Shimura–Harder map becomes a request

### What the verifier corrected
- Confirmed without correction.
- The graph statement is exact: in the atlas with the accepted restructurings, the only stages of ArithmeticLocallySymmetricSpaces, AutomorphicFormsOnReductiveGroups and AutomorphicLFunctionsAndLocalFactors among L1's ancestors are AL.0 and AL.1.
- Every other import the narrowed layer keeps has no edge.

### State on main (45d60f04)
- **L1 has not changed since 15 September.** `content/campaign/AutomorphicPadicLFunctions/README.md` line 30: "Import arithmetic quotients, Borel–Serre finiteness, Hecke local systems and automorphic-to-cohomology maps from [ArithmeticLocallySymmetricSpaces](../ArithmeticLocallySymmetricSpaces/README.md) and [AutomorphicFormsOnReductiveGroups](../AutomorphicFormsOnReductiveGroups/README.md). Import GL₂ Whittaker models, local zeta integrals and standard L-functions from [AutomorphicLFunctionsAndLocalFactors](../AutomorphicLFunctionsAndLocalFactors/README.md)."
- **Accepted RS-14's L1 `keeps`** includes: "Retain the imported arithmetic quotient, Borel–Serre, Hecke-local-system, automorphic-cohomology and GL2 L-function carriers", with `suppliedBy` only `ModularSymbolsPadicLFunctions:L1`.
- **L1's `requires` in the assembled graph** (2840 stages, 7792 edges): APL L0, ModularSymbolsPadicLFunctions L1, ModularForms layers 7–8, LocallyAnalyticDistributions L3, PadicMeasuresIwasawaAlgebras L0a/L1, ClassFieldTheory layer 11, GlobalNumberFields layers 2/9/10. Of the three roadmaps, the ancestors are exactly `AutomorphicLFunctionsAndLocalFactors:AL.0` and `AL.1`. L1 has 49 ancestors.
- **The supplier stages exist** (assembled graph):
  - ALS.1 "Local systems and chain complexes" (compact-support cochains, finite projective models);
  - ALS.2 "Borel–Serre compactification";
  - ALS.3 "Hecke correspondences on complexes";
  - ALS.5 "Duality and comparison". Its full part "compares Betti, de Rham and relative Lie algebra cohomology in characteristic zero via local systems, using AF.1a. It consumes AS.5 only for the further comparison with automorphic forms". It requires AutomorphicSpectralTheory AS.5, "Weighted cohomology and automorphic comparison".
  - AF.4 "Algebraic weights and rational structures" (cohomological representations, coefficient systems, rationality of cohomological cuspidal representations);
  - AL.2 "Godement–Jacquet standard GL_n factors";
  - GL2AutomorphicRepresentationsAndTransfer R16.5 "Integral formulas and converse-theorem prerequisites". It proves "the GL₂ global Whittaker expansion and its identification with those integral models" and requires AL.0–AL.3.
- **No stage owns the map BSW actually use.** BSW (arXiv:1602.06244v3, §3.3, p. 13; read 29 September 2026): "Theorem 3.4 (Eichler–Shimura). There is a Hecke-equivariant injection Sλ(Ω1(n)) ↪ Hqc(Y1(n), L1(Vλ(C)∗)). Proof. An explicit recipe is given in [Hid94]. Note we have composed the classical version of the theorem with the canonical inclusion of cuspidal into compactly supported cohomology." Here q = r₁ + r₂. [Hid94] is Hida, *On the critical values of L-functions of GL(2) and GL(2)×GL(2)*, Duke Math. J. 74 (1994).
  - A search of all atlas stage descriptions for "Eichler–Shimura", "Matsushima", "Harder", "cuspidal cohomology" and "(g,K)" finds Eichler–Shimura only in its classical elliptic senses (R19.1, R14.6, HE.2, a GZ.3 node).
  - ALS.5 and AS.5 compare cohomology with automorphic forms in general. None states the injection of weight-λ cusp forms on GL2/F into H^{r₁+r₂}_c.
- **Packets and audits.**
  - There is no packet or decomposition for ArithmeticLocallySymmetricSpaces, AutomorphicFormsOnReductiveGroups or GL2AutomorphicRepresentationsAndTransfer. AutomorphicLFunctionsAndLocalFactors has a packet, which does not mention APL L1.
  - The APL packet has L1 `not_read` ("Decompose the actual arithmetic locally symmetric spaces, coefficient local systems, compactly supported cohomology, oriented cycles of degree r1+r2, trace and integration").
  - AUDIT-23 (merged) records that "all cohomology of arithmetic groups over number fields" is missing from both libraries.
  - At the pins, `declarations.tsv` has no declaration matching `EichlerShimura|BorelSerre|locallySymmetric|Whittaker`.

### Fix
1. **`data/atlas.json`.**
   - Add to APL L1's `requires`: `ArithmeticLocallySymmetricSpaces:ALS.1`, `ALS.2`, `ALS.3`, `ALS.5`, `AutomorphicFormsOnReductiveGroups:AF.4` and `GL2AutomorphicRepresentationsAndTransfer:R16.5`.
   - Add APL L1 to each of their `consumers`, and add the six stageEdges records.
   - R16.5 is chosen over AL.2 alone because L1 needs the GL2 Whittaker expansion, which R16.5 owns. R16.5 requires AL.0–AL.3, so AL.2 becomes an ancestor.
   - ALS.5 (with AS.5 behind it) is the owner of the comparison of Betti and relative Lie algebra cohomology with automorphic forms. That comparison is what an "automorphic-to-cohomology map" needs, beyond the stages the finding lists.
   - No AF stage owns that map. AF.4 supplies the cohomological weights and coefficient systems.
   - Cycle tests (assembled graph):

     | Edge | Result |
     |---|---|
     | ALS.1 → L1 | acyclic (no path L1 → ALS.1) |
     | ALS.2 → L1 | acyclic |
     | ALS.3 → L1 | acyclic |
     | ALS.5 → L1 | acyclic |
     | AF.4 → L1 | acyclic |
     | R16.5 → L1 | acyclic |

     The six are also acyclic together, and together with /7's and /25's edges.
   - Effect: L1's ancestors grow from 49 to 120. ALS.3 alone adds 12, ALS.5 adds 44, AF.4 adds 23, and R16.5 adds 54 (AL.2 alone would add 23). The growth is the real prerequisite structure of BSW's general-F construction.
2. **`content/campaign/AutomorphicPadicLFunctions/README.md`, L1.**
   - Replace "Import arithmetic quotients, Borel–Serre finiteness, Hecke local systems and automorphic-to-cohomology maps from [ArithmeticLocallySymmetricSpaces](../ArithmeticLocallySymmetricSpaces/README.md) and [AutomorphicFormsOnReductiveGroups](../AutomorphicFormsOnReductiveGroups/README.md)." (occurs once) with:
     > Import arithmetic quotients, local systems and compact-support cochains (ArithmeticLocallySymmetricSpaces ALS.1), Borel–Serre finiteness (ALS.2), Hecke correspondences (ALS.3) and the comparison of Betti with relative Lie algebra cohomology and automorphic forms (ALS.5, with AutomorphicSpectralTheory AS.5) from [ArithmeticLocallySymmetricSpaces](../ArithmeticLocallySymmetricSpaces/README.md), and cohomological weights and coefficient systems (AF.4) from [AutomorphicFormsOnReductiveGroups](../AutomorphicFormsOnReductiveGroups/README.md). The Hecke-equivariant Eichler–Shimura–Harder injection S_λ(Ω_1(n)) ↪ H^{r₁+r₂}_c(Y_1(n), L(V_λ(C)^∗)) of BSW Theorem 3.4 (Hida 1994's recipe composed with cuspidal ⊂ compactly supported cohomology) is requested from ArithmeticLocallySymmetricSpaces; it is not constructed here.
   - Replace "Import GL₂ Whittaker models, local zeta integrals and standard L-functions from [AutomorphicLFunctionsAndLocalFactors](../AutomorphicLFunctionsAndLocalFactors/README.md)." (occurs once) with:
     > Import the GL₂ global Whittaker expansion from [GL2AutomorphicRepresentationsAndTransfer](../GL2AutomorphicRepresentationsAndTransfer/README.md) R16.5, and local zeta integrals and standard L-functions from [AutomorphicLFunctionsAndLocalFactors](../AutomorphicLFunctionsAndLocalFactors/README.md) AL.2 through it.
   - "**Campaign dependencies:**" line (occurs once): append ", [ArithmeticLocallySymmetricSpaces](../ArithmeticLocallySymmetricSpaces/README.md), [AutomorphicFormsOnReductiveGroups](../AutomorphicFormsOnReductiveGroups/README.md), [GL2AutomorphicRepresentationsAndTransfer](../GL2AutomorphicRepresentationsAndTransfer/README.md)". The roadmap record's `prerequisites` already has ALS, AF and AL; the edge R16.5 → L1 adds GL2AutomorphicRepresentationsAndTransfer.
3. **Request** in `research/blueprint/packets/AutomorphicPadicLFunctions.json` (blueprint, next checkpoint):
   ```json
   {"supplier": "ArithmeticLocallySymmetricSpaces:ALS.5",
    "need": "For GL2 over a number field F with r1 real and r2 complex places, admissible weight lambda=(k,v) and level Omega_1(n): a Hecke-equivariant injection S_lambda(Omega_1(n)) -> H^{r1+r2}_c(Y_1(n), L(V_lambda(C)^*)) from cusp forms to compactly supported cohomology (Eichler-Shimura-Harder; Hida, Duke Math. J. 74 (1994), as used in BSW arXiv:1602.06244v3 Thm 3.4), compatible with the action of {+-1}^{Sigma(R)} and with the decomposition into components Y_1^i(n). It is the classical injection into cuspidal cohomology composed with cuspidal -> compactly supported cohomology. ALS.5's Betti/relative-Lie-algebra comparison and AS.5's automorphic comparison are the inputs; the bottom-degree (g,K)-cohomology of the cohomological GL2(F_infinity) representation is part of the statement.",
    "neededBy": ["AutomorphicPadicLFunctions:L1"]}
   ```
   The maintainer may also record the same statement as a target sentence in ArithmeticLocallySymmetricSpaces ALS.5's text. That roadmap has no packet yet.
4. **Accepted RS-14's record.** `layers["AutomorphicPadicLFunctions:L1"].suppliedBy` becomes `["ModularSymbolsPadicLFunctions:L1", "ArithmeticLocallySymmetricSpaces:ALS.1", "ArithmeticLocallySymmetricSpaces:ALS.2", "ArithmeticLocallySymmetricSpaces:ALS.3", "ArithmeticLocallySymmetricSpaces:ALS.5", "AutomorphicFormsOnReductiveGroups:AF.4", "GL2AutomorphicRepresentationsAndTransfer:R16.5"]`. This is the maintainer's edit, which records RS-14's retained imports as its own `keeps` states them. If the maintainer prefers not to amend an accepted record, the atlas edges alone suffice.

### Not done, and why
- **L2's imports were not re-audited beyond the finding.** The finding says "(and L2)", but L2 reaches L1 directly, so the new ancestors reach L2 too.
- **AL.5 is not added.** As the finding says, the interface concerns AL.2 and the others, not AL.5.
- **Hida 1994 was not read.** The request cites it as BSW cite it.

## /35 (medium, error): ES.8 is split into a rank-one ES.8 on ES.5, and a new ES.8h for the higher-rank Iwasawa variation

### What the verifier corrected
- Confirmed. ES.8 requires ES.7 and SelmerIwasawaCohomology L3, so the rank-one statement its consumers use waits on the higher-rank theory and on the Gorenstein homological algebra behind it. The sharp rank-one statement needs only the earlier layers.

### State on main (45d60f04)
- **The chain is in the assembled graph.**
  - ES.8 `requires` [ES.7, SelmerIwasawaCohomology:L3].
  - ES.7 requires [ES.6].
  - ES.6 requires [ES.5, PadicMeasuresIwasawaAlgebras:L6, UPSTREAM:GorensteinHomologicalAlgebra, the Tau Ceti StableReduction Layer 1].
  - ES.7's only consumer is ES.8.
- **ES.8's consumers:**
  - EulerSystemsCyclotomicMainConjecture L2, which reads "Import the inverse-limit and multivariable bounds of Rubin II.3 from ES.8";
  - HeegnerPointEulerSystems HE.8, "Apply the generic ES.8 and SelmerIwasawa control maps to obtain Howard's divisibility";
  - RankZeroOneBSD BSD.7a, "EulerSystemsAndKolyvaginSystems ES.4 and ES.8";
  - the KatoEulerSystems decomposition node `KatoEulerSystems:L4/imported-euler-system-bound-over-the-cyclotomic-iwasawa-algebra` (Kato Thm. 13.4 imported from Perrin-Riou and Rubin; its gap compares it with Rubin Thm. II.3.3).

  All of these are rank-one uses.
- **The ES README is unchanged.** `content/campaign/EulerSystemsAndKolyvaginSystems/README.md`, ES.8 (lines 83–87): "Combine the Selmer owner's inverse-limit/control results with ES.3–ES.7 to construct the Iwasawa system maps. … In MR 2004 §5.3, characteristic divisibility becomes equality only with the additional core-rank/nonzero/Lambda-primitive conditions of Theorem 5.3.10."
  - ES.5 (line 61) owns "residual primitivity and the index of a system", which MR's Λ-primitivity criterion reduces to.
- **No ES packet or decomposition exists.** The merged audit AUDIT-24 (`data/library-coverage.json`) marks ES.8 "not built", with four targets: system maps, residual versus Λ-primitivity, the 5.3.10 criterion, and the adapters. All four are rank-one.
- **Graph effect of the split** (assembled graph, with the /36 edges): ECMC L2, ECMC L3, HE.8 and BSD.7a each lose exactly ES.6, ES.7, PadicMeasuresIwasawaAlgebras L6 and UPSTREAM:GorensteinHomologicalAlgebra from their ancestry, and nothing else of ES.
- **This session's work.** This session's KOLYVAGIN-90 extraction routes Rubin-book material to ES.0–ES.4 and ES.8 (route 1): Appendix B universal norms, and the Chapter IX variants. The paper has no review. All of that material is rank-one and stays with the rank-one ES.8. The fix follows the verifier only.

### Fix
1. **`content/campaign/EulerSystemsAndKolyvaginSystems/README.md`, ES.8.**
   - Replace "Combine the Selmer owner's inverse-limit/control results with ES.3–ES.7 to construct the Iwasawa system maps." (occurs once; script-checked) with:
     > Combine the Selmer owner's inverse-limit/control results with ES.3–ES.5 to construct the rank-one Iwasawa system maps: Rubin's inverse-limit and several-variable bounds (Rubin II.3) and the Λ-adic Kolyvagin systems of core rank one of MR 2004 §5.3. This stage uses no exterior bidual, Stark system or Gorenstein-order input; the higher-rank variation is ES.8h.
   - The rest of the ES.8 text (specialisation, the two primitivities, Theorem 5.3.10's conditions, the several-variable hypothesis and the application-adapter paragraph) stays.
2. **Same README.** Insert a new stage immediately before "## Completion and prototype contract" (occurs once):
   > ## ES.8h. Higher-rank Iwasawa variation
   >
   > Combine ES.6–ES.7's higher-rank Euler, Stark and Kolyvagin systems over Gorenstein coefficient orders with ES.8's rank-one Iwasawa maps and the Selmer owner's inverse-limit/control results. Construct the Iwasawa-theoretic higher-rank system maps along the Z_p^d-extension of ES.7's pinned BSS II v1 §§6.1–6.4 route, under exactly the hypotheses ES.7 records: reflexivity, H⁰(F,T)=0, no finite place splitting completely, and the Frobenius-power injectivity hypothesis 6.11. Prove that the rank-one specialisation recovers ES.8, and bound higher Fitting ideals over the Iwasawa order only under those hypotheses; over a non-domain order keep ideal containments, not valuation formulas. No rank-one consumer (cyclotomic units, Kato, Heegner, the BSD Eisenstein branch) requires this stage.
   >
   > **Inputs.** `EulerSystemsAndKolyvaginSystems:ES.7`, `EulerSystemsAndKolyvaginSystems:ES.8`.
3. **Same README, the handoff table.** After the row "| `ES.8` | Write the integral image/index and oriented characteristic containment before invoking primitivity; residual primitivity and Lambda-primitivity have different reduction maps. |" (occurs once) add the row "| `ES.8h` | Construct the higher-rank Iwasawa maps only after ES.8's rank-one maps exist; check the rank-one specialisation against ES.8. |"
4. **`data/atlas.json`.**
   - ES.8 `requires` [ES.7, SelmerIwasawaCohomology:L3] → [ES.5, SelmerIwasawaCohomology:L3]. Remove the stageEdges record ES.7 → ES.8 (the maintainer's removal); add ES.5 → ES.8. Set ES.5 `consumers` += ES.8 and ES.7 `consumers` [ES.8] → [ES.8h].
   - New stage `EulerSystemsAndKolyvaginSystems:ES.8h`, title "Higher-rank Iwasawa variation", description the text of edit 2, `requires` [ES.7, ES.8], no consumers. Add the stageEdges records ES.7 → ES.8h and ES.8 → ES.8h. Its sourceLine and context lines come from the regenerated README.
   - ES.8's consumers stay: ECMC L2, HE.8, BSD.7a and the KES L4 node.
   - Cycle tests, cumulative with /36:
     - ES.5 → ES.8: acyclic (no path ES.8 → ES.5).
     - ES.7 → ES.8h: acyclic, and so is ES.8 → ES.8h (ES.8h is new, with no consumers).
5. **`data/library-coverage.json`** (merged AUDIT-24; the orchestrator's merge). ES.8's four targets stay on ES.8. ES.8h gets no record until it is audited; its targets are all "absent", like ES.7's.

### Not done, and why
- **No new theorem numbers are introduced.** ES.8h reuses the BSS II v1 locators ES.7 already carries. The BSS papers and MR 2004 were not re-read for this fix, and a public MR 2004 text was not found on arXiv.
- **HE.8 is left on the rank-one ES.8, as the verifier confirmed.** HE.8's text also asks for "the determinant/Selmer-complex reformulation used by Castella–Sano" (arXiv:2601.14504, abstract only read here). If its blueprint job finds that this reformulation uses Stark-system or exterior-bidual machinery over Λ, it should add ES.8h → HE.8. That edge is acyclic, since HE.8 is not an ancestor of ES.7 or ES.8.

## /36 (medium, error): the application adapters import ES directly (ES.2 → ECMC L0 and Kato L2; ES.4 and ES.8 → Kato L4), and the Kato layers no longer route through the cyclotomic-unit layers

### What the verifier corrected
- Confirmed. ES.2 is an ancestor of neither EulerSystemsCyclotomicMainConjecture L0 nor KatoEulerSystems L2.
- KatoEulerSystems L4 reaches the Euler-system layers only through the cyclotomic-unit application (ECMC L2), so the generic handoffs run through one application.

### State on main (45d60f04)
- **`data/atlas.json`, `requires` (raw; the assembled graph adds only upstream Tau Ceti and ArithmeticGaloisDuality links):**
  - ECMC L0: [ColemanPowerSeries:L4, IntegralIwasawaTheory:L0, SelmerIwasawaCohomology:L0].
  - KES L2: [ArithmeticGaloisDuality:R02.2, AutomorphicGaloisRepresentations:R19.1, EulerSystemsCyclotomicMainConjecture:L0, KatoEulerSystems:L1].
  - KES L4: [EulerSystemsCyclotomicMainConjecture:L2, KatoEulerSystems:L3, SelmerIwasawaCohomology:L3].
  - ES.2's consumers are ES.3 and HeegnerPointEulerSystems HE.4.
  - The ES roadmap record lists KatoEulerSystems among its consumer roadmaps with no stage edge to it.
- **The texts all say "import from ES".**
  - ECMC README L0 (line 22): "Import ES.2's actual Euler-system carrier, field/conductor equivalence, twisting, smoothing and coefficient maps."
  - ECMC line 7: "Kato and Heegner applications import the same general theory without depending on this cyclotomic endpoint."
  - KES README line 8: "The cyclotomic-units construction in EulerSystemsCyclotomicMainConjecture is a separate client, not the owner of this general descent."
  - KES L4 (line 48): "Apply the generic bounds in EulerSystemsAndKolyvaginSystems, including its descent and integral finite-error analysis".
- **Nodes already import ES.** Checked before dropping any edge:
  - The ECMC packet (`research/blueprint/packets/EulerSystemsCyclotomicMainConjecture.json`, 29 September) cites `EulerSystemsAndKolyvaginSystems:ES.2` as a prerequisite of `L0/qab-euler-hypotheses`, `L0/cyclotomic-euler-system` and `L0/twisted-class-formula`. It has a request to ES.2 for the Euler-system carrier.
  - The integrated KES decomposition (`data/decompositions/KatoEulerSystems.json`) has the link `EulerSystemsAndKolyvaginSystems:ES.8 → KatoEulerSystems:L4/imported-euler-system-bound-over-the-cyclotomic-iwasawa-algebra`. Its review notes: "data/atlas.json does NOT carry the corresponding stage edge".
  - The KES packet (`research/blueprint/packets/KatoEulerSystems.json`) requests ES.8 for that node.
- **No Kato node cites a cyclotomic-unit statement.**
  - `EulerSystemsCyclotomicMainConjecture` occurs in the KES decomposition only in that review note, and not at all in the KES packet.
  - Neither file mentions cyclotomic units or Rubin III.2.x.
  - The L2 node `integrality-of-the-cyclotomic-limit-in-S-integral-cohomology` concerns the cyclotomic tower, not cyclotomic units.
  - So the finding's condition for dropping the two edges holds.
- **What the drop removes from ancestry** (assembled graph, cumulative with /35):
  - KES L2 loses ColemanPowerSeries L0–L4, DirichletPadicLFunctions L0–L3, LocallyAnalyticDistributions L0–L3, IntegralIwasawaTheory L0, PadicMeasuresIwasawaAlgebras L0a and ECMC L0.
  - KES L4 additionally loses ECMC L1–L2, IntegralIwasawaTheory L1, L2, L4, I.1 and I.2, and ES.6–ES.7.
  - No KES text or node uses Coleman power series, Kubota–Leopoldt, or class-group towers.
  - One loss matters. KES L4 works over Λ = O_λ[[G_∞]] with G_∞ = Gal(Q(ζ_{p^∞})/Q) (packet node `L4/cohomological-divisibility-one-direction`). IntegralIwasawaTheory I.1, "Cyclotomic towers and coefficient rings", is the stage that constructs that tower and the algebra Z_p[[G_∞]]. After the drop it is no longer an ancestor of KES L4, so it is re-added directly (edit 3).
- **This session's work.** This session's KOLYVAGIN-90 extraction routes Rubin III §5 (Kato's application) to KES L3/L4 (route 2) and the Rubin-book method to ES.0–ES.4 and ES.8 (route 1). The paper has no review. The fix follows the verifier only.

### Fix
1. **`data/atlas.json`: additions.** Add these requires, consumers and stageEdges records.
   - ES.2 → ECMC:L0.
   - ES.2 → KES:L2.
   - ES.4 → KES:L4.
   - ES.8 → KES:L4, the rank-one ES.8 of /35.
   - IntegralIwasawaTheory:I.1 → KES:L4, keeping the cyclotomic-tower Iwasawa algebra that ECMC L2 used to supply.
2. **`data/atlas.json`: removals** (the maintainer's).
   - Delete ECMC:L0 → KES:L2: remove it from KES L2's `requires`, KES L2 from ECMC L0's `consumers`, and the stageEdges record.
   - Delete ECMC:L2 → KES:L4 in the same way.
3. **Cycle tests** (cumulative, after the removals and /35's edits):
   - ES.2 → ECMC:L0: acyclic (no path ECMC:L0 → ES.2).
   - ES.2 → KES:L2: acyclic.
   - ES.4 → KES:L4: acyclic. ES.4 already reached KES L4 through ECMC; the new edge is the direct import.
   - ES.8 → KES:L4: acyclic.
   - IntegralIwasawaTheory:I.1 → KES:L4: acyclic (no path KES:L4 → I.1).
4. **`content/campaign/KatoEulerSystems/README.md`, L2.** After "Apply these regulators to the actual pairs of Siegel units on modular curves at varying level." (occurs once) insert: "The Euler-system carrier, its norm relations and its Frobenius/Tate-dual conventions are EulerSystemsAndKolyvaginSystems ES.2's; this layer proves that Kato's classes satisfy them."
5. **Same README, L4.** After "Do not rebuild abstract Kolyvagin derivative operators or generic Selmer bounds inside this arithmetic construction." (occurs once) insert: "The finite-level bounds are ES.4's and the Iwasawa-theoretic bound (Kato Thm. 13.4, imported from Perrin-Riou and Rubin) is the rank-one ES.8's; no cyclotomic-unit result of EulerSystemsCyclotomicMainConjecture is an input."
6. **ECMC README.** No change: L0 already imports ES.2.
7. **The integrated KES decomposition.** No node change. Its review note "data/atlas.json does NOT carry the corresponding stage edge" is discharged by the ES.8 → KES L4 edge.

### Not done, and why
- **The I.1 → KES L4 edge is this fixer's addition.** The finding did not ask for it. The finding's removal of ECMC L2 → KES L4 would otherwise leave KES L4 without the owner of the Iwasawa algebra it is stated over.
- **The atlas extracts** (`research/blueprint/atlas/roadmaps/*.json`) are regenerated from the corrected atlas.

## Edits shared between findings

Where two findings edit the same sentence or line, the merged text below supersedes the separate edits. The order of application is:
1. the eight edge removals;
2. the new headings and record cuts of /13;
3. the findings in numerical order;
4. the merges below.

**1. `content/campaign/AutomorphicPadicLFunctions/README.md`, L3h's export sentence (/11, /25).** Replace "Export these exact statements to GeneralizedHeegnerCycles GH.6 and AutomorphicCongruences L2/L5a." (occurs once) with:
> Export these exact statements to GeneralizedHeegnerCycles GH.6, AutomorphicCongruences L2/L5a, and GrossZagierAndArithmeticHeights GZ.9 (Theorem A's construction at F = ℚ, weight two). Export Theorems A, B and C to AutomorphicCongruences L2s. CLW use Theorem A for the p-adic L-function L1 of §7.11, Theorem B for the second containment of Theorem 8.2.1(2), and Theorem C to choose the auxiliary characters of §5.6.

/7 (the L3m inputs and Theorem C's "p unramified in F") and /15 (CGS Proposition 2.4.5) insert separate sentences into L3h. Neither touches this sentence.

**2. AC L2, the sentence "L2 imports the finite-slope Klingen construction from AutomorphicPadicLFunctions L4e (Eischen–Wan), and Hsieh's μ/nonvanishing theorem from L3h." (/6, /32).** Apply /32's replacement first. Then insert /6's paragraph after the replaced sentence.

The other L2 edits are anchored on different sentences, and they compose:
- /22 (the FW §4.8 paragraph);
- /24 (the CLW imports);
- /27 (the Yager sentence);
- /15 (the named target FW21 Corollary 7.21).

**3. AC L2s, the sentence "Reuse L0's extension algebra and AutomorphicPadicLFunctions L4e's doubling construction, with explicit comparison maps, rather than duplicate them." (/6, /7, /32).** Apply /32's replacement. Then insert, in this order:
- /6's paragraph (Galois representations and CAP exclusion);
- /7's paragraph (the auxiliary characters of CLW §5.6).

/25 and /26 edit other sentences of L2s.

**4. `content/campaign/RankZeroOneBSD/README.md`, BSD.7a's Dependencies line (/5, /15).** Replace "**Dependencies:** BSD.5; HeegnerPointEulerSystems HE.8; GrossZagierAndArithmeticHeights GZ.9; ModularIwasawaMainConjectures; SelmerIwasawaCohomology; PadicFamilies; EulerSystemsAndKolyvaginSystems ES.4 and ES.8." (occurs once) with:
> **Dependencies:** BSD.5; HeegnerPointEulerSystems HE.8; GrossZagierAndArithmeticHeights GZ.9; ModularIwasawaMainConjectures; SelmerIwasawaCohomology; PadicFamilies; EulerSystemsAndKolyvaginSystems ES.4 and ES.8; KatoEulerSystems L4 (with Wüthrich's integral divisibility); AutomorphicPadicLFunctions L3h (Hida's anticyclotomic μ = 0; CGS Proposition 2.4.5); AutomorphicCongruences L0c (the Hida–Tilouine anticyclotomic main conjecture for CM fields); and, once designed, the integral layer of CMAllPrimeMainConjectures (Rubin's main conjecture for K).

In `data/atlas.json` this adds `AutomorphicCongruences:L0c` and `AutomorphicPadicLFunctions:L3h` to BSD.7a's `requires`, and `KatoEulerSystems:L4` where it is not already there. /5's placeholder "the AutomorphicCongruences Hida–Tilouine layer" is /26's L0c.

**5. BSD.6's new Dependencies line (/4, /18).** /4 inserts a BSD.6-only line. It becomes:
> **Dependencies (BSD.6):** BSD.5, BSD.6a; HeegnerPointEulerSystems HE.6, HE.8b; ModularIwasawaMainConjectures L1 (Skinner–Urban form) and L1m; SelmerIwasawaCohomology L3 (Greenberg's surjectivity and no-finite-submodule theorems, one-variable Fitt = char); PadicFamilies L3–L4 (split multiplicative p); DiophantineApproximationAndTranscendence DT.5 (split multiplicative p); GrossZagierAndArithmeticHeights GZ.0; EllipticCurves Layers 4–7.

The BSD.6 bullet at line 85 has a single replacement, /14's Fix 3, which already carries /4's branch.

**6. BSD.6a.**
- The Dependencies line is /15's edit 5 alone; it already carries /30's KatoEulerSystems L5.
- /32 replaces a different sentence ("Its reverse divisibility imports …").
- /17 appends to BSD.6's text.
- Keep /13's new heading above all of these.

**7. HE.8's record (/1, /10, /13, /15).**
- /15's Burungale–Castella–Kim paragraph goes at the end of HE.8's text.
- /13's new HE.8 Dependencies line (edit 2) comes after that paragraph and before the HE.8b anchors. That line already names GN.4:padic-unipotent-flows and L3h (/1) and HE.6 (/10).
- /1's new CM-point nodes and /13's move of the geometric Cornut–Vatsal theorem into HE.8 are the same nodes. They are listed once, in /1.

**8. HE.6 (/8, /10).** /8 rewrites HE.6's Dependencies line and adds HE.6z. /10 adds only the edge HE.6 → HE.8 and the hypothesis-verification wording. They compose.

**9. `content/campaign/ModularIwasawaMainConjectures/README.md`, line 11 (/4, /17, /23).** Replace the "**Campaign dependencies:**" line (occurs once) with:
> **Campaign dependencies:** [AutomorphicCongruences](../AutomorphicCongruences/README.md), [KatoEulerSystems](../KatoEulerSystems/README.md), [PadicHodgeRegulators](../PadicHodgeRegulators/README.md), [SelmerIwasawaCohomology](../SelmerIwasawaCohomology/README.md), [PadicFamilies](../PadicFamilies/README.md), [EllipticCurveModularity](../EllipticCurveModularity/README.md) (R29.5–R29.6, for L3), [GrossZagierAndArithmeticHeights](../GrossZagierAndArithmeticHeights/README.md) (GZ.3's Manin constant, for L3), [ModularSymbolsPadicLFunctions](../ModularSymbolsPadicLFunctions/README.md) (L2's Mazur–Tate–Teitelbaum function, for L1m).

In MIMC L1's first paragraph, /14 inserts a new paragraph and /22 rewrites two different sentences, so the edits compose.

**10. `content/campaign/AutomorphicCongruences/README.md`, line 10 (/6, /26, /27, /28).** Use /6's edit 7 line, with ", [PadicFamilies](../PadicFamilies/README.md) (L5, for L0c)" appended before the final period.

**11. Three edges for Hida's Rankin–Selberg p-adic L-function of a CM Hida family (/15, /26, /30).** /26 creates its owner, AutomorphicPadicLFunctions:L3r. /15 and /30 found three further consumers, and the finding groups did not add the edges because L3r did not yet exist when they worked:
- KatoEulerSystems:L5 needs it for L^Gr_p(E/L);
- APL L3h needs it for CGS Proposition 2.4.5;
- AC L2 needs it for FW21 Corollary 7.21.

Add `AutomorphicPadicLFunctions:L3r` to the `requires` of KatoEulerSystems:L5 (new), APL:L3h and AC:L2, add those three to L3r's `consumers`, and add the three stageEdges records. Cycle tests on top of all this report's edits: acyclic, acyclic, acyclic.

**12. Hida's μ = 0 has a single owner.** It is APL L3h, through the accepted route 6 of PAPER-CASTELLA-ETAL-22 (/5). L3m (/7) owns the tools from Hida 2010 that the proof uses (Theorem 3.20 and Corollary 3.21) and feeds L3h. /26's L0c imports μ = 0 and does not own it.

## Where this report departs from a finding's fix

The review does not narrow any finding's fix beyond its three scope corrections. Every departure below comes from checking the mathematics, the sources or the graph, and each is argued in its section:
- **/2.** Zhang's reference is Diamond–Taylor, Duke Math. J. 74 (1994). The finding's J. reine angew. Math. 449 is not that paper.
- **/3.** BSD.1 is not rerouted to RP.1. Mordell–Weil for elliptic curves is Tau Ceti EllipticCurves Layer 6, the owner under accepted RS-30, so GZ.1 → BSD.1 is removed instead.
- **/4.** The Greenberg–Stevens L-invariant comparison, log_p q_E/ord_p q_E, goes to PadicFamilies L4, which owns the family Galois representation, and not to L3.
- **/5.** No new roadmap is proposed. The accepted Part II CMAllPrimeMainConjectures (PAPER-BURUNGALE-TIAN-26 route 7 and PAPER-CASTELLA-ETAL-22 route 8, both `accept`; design #1884) already owns elliptic units and Rubin's theorem.
- **/6.** One edge from AG2.6 replaces the nine edges the finding lists, since AG2.2 and AG2.5 reach AG2.6. The CAP-exclusion step is also in L1.
- **/8 and /10.** Zhang's theorem goes into a new HE.6z, because the edges the findings list close a cycle together. Ribet–Takahashi is imported BSD.5 → HE.6z: BSD.5's README lists HE.6 as a dependency, so the edge BSD.5 → HE.6 would contradict it.
- **/11.** GZ.9 is chosen as the owner of BDP's r = j = 0 formula.
- **/13.** Neither of the finding's options is taken. The geometric Cornut–Vatsal theorem moves into HE.8, and HE.8c keeps the L-value corollaries, which do consume HE.8b. No edge is reversed or dropped.
- **/14.** The Skinner–Urban-form target covers all weights k ≡ 2 mod (p − 1), not only weight two, because L1m's Hida-family seed needs them.
- **/15.**
  - BCK21 Theorem 5.2 goes to HE.8, not HE.8b.
  - The erratum's "FO12 Cor. 7.2.1" does not exist: the statement it describes is FW21 Corollary 7.21, which goes to AC L2.
  - CGS Proposition 2.4.5 goes to L3h.
- **/18.** Fitt = char is planned only for one-variable Λ, where no nonzero finite submodule gives projective dimension at most one. In several variables it does not.
- **/20.** The link from Layer 7 to SIC L2 already exists in an accepted link map.
- **/22.**
  - Castella–Wan Theorem 3.8 holds only up to powers of p. FW §4.6.3's step uses Kato's divisibility, so Kato L4 → AC L2 is added.
  - L5w → MIMC L1 is not added: the SU route would still lack the period comparison.
- **/28.** One edge from R31.4 replaces the finding's two, since R30.6 is already a requirement of R31.4.
- **/34.** The edge from ALS.5 is added as well. R16.5 is chosen over AL.2, because it owns the GL₂ Whittaker expansion.
- **/36.** IntegralIwasawaTheory I.1 → KES L4 is added, so that L4 keeps the owner of its Iwasawa algebra.

## Source issues found, for the errata register

These go to `research/errata/REGISTER.md` through the owning packets' `sourceIssues`. None is recorded yet, and each has `known: new` as far as the authors' pages show.
- **Castella's 2024 erratum** to Camb. J. Math. 6 (2018):
  - "[FO12, Cor. 7.2.1]" does not exist; it should be [FW21, Cor. 7.21].
  - "C₂ = 0" should be "C₁ = 0" in the proof of Theorem 2.3.
  - "π(f)_ℓ" should be "π(g)_ℓ" in Theorem 2.3(iv).
  - A gap: CGS Theorem 5.5.1/6.5.1 is applied to T_g, outside the T_pE setting in which CGS state it.
  
  All four are in /15.
- **Burungale–Castella–Skinner v2:** Theorem 4.1.3 is cited as "Proposition 4.1.3" in the proof of Proposition 5.2.1 (/29).
- **Hsieh, Doc. Math. 19 (2014):** Theorem C as stated in the introduction (p. 713) omits "p unramified in F", which its proof assumes (Theorem 7.1, through Theorem 6.2). This is proposed as `AutomorphicPadicLFunctions/E4` (/7).

## Out of scope: /37–/39

The issue lists only the high and medium findings, so these three low findings get no change here:
- **/37.** MIMC L0 and L4 cite "LLZ" for two different Lei–Loeffler–Zerbes papers. The verifier confirmed from both arXiv versions that 5.10 and 5.13 are Theorems only in *Coleman maps and the p-adic regulator*.
- **/38.** Locators in MIMC L6's branch table are imprecise.
- **/39.** The BSD.6/BSD.6a and BSD.7/BSD.7a atlas records are identical. This is the same defect as /13, and /13's fix (headings plus a re-cut of the records) repairs it too.

## Sources read

Every source below was read on 29 September 2026. Where a fix rests on a source that could not be read, its section says so, cites it through the sources that quote it, and keeps the claim as an open obligation.

**For /1, /2, /8, /9, /10, /13.**

- Cornut–Vatsal, *Nontriviality of Rankin–Selberg L-functions and CM points* (published in L-functions and Galois representations, LMS Lecture Note Ser. 320, 2007). Author preprint dated 1 April 2005, https://personal.math.ubc.ca/~vatsal/research/part1.pdf, read 29 September 2026, SHA-256 bdf258c742a88ce4328dcf3ef1df0dfe1235f1640c06bd66eeaaef2c1c6625e1 (the red team's file). Read: §1.3 Thm 1.10 and its derivation, §1.6 pp. 18–19, §4.1 Thm 4.1 and Remark 4.3, §4.2 Props. 4.4 and 4.7, Remark 4.8, §4.6 pp. 46–48 (both proofs, Prop. 4.17), references.
- Cornut–Vatsal, *CM points and quaternion algebras*, Doc. Math. 10 (2005) 263–309. Author copy dated 1 April 2005, https://personal.math.ubc.ca/~vatsal/research/Part2.pdf, read 29 September 2026, SHA-256 ace8a12c95dc6241a1e1ccb5445d46e91cc52f8ae8704fc7598f5ec9ae7ebf90. Read: introduction; §2.2 Thm 2.9 and Cor. 2.10; §2.5 Prop. 2.23; §2.7 Thm 2.29 and Lemma 2.30; Remark 3.21; references [2], [11], [15], [17], [18]. The EMS/Documenta PDF could not be fetched.
- W. Zhang, *Selmer groups and the indivisibility of Heegner points*, Camb. J. Math. 2 (2014) 191–253, https://archive.intlpress.com/site/pub/files/_fulltext/journals/cjm/2014/0002/0002/CJM-2014-0002-0002-a002.pdf, read 29 September 2026, SHA-256 698eb8a6d2297684c683c4c3f43a195cac1d8752ef0c8362ab90c74f5b3792ec. Read: Thm 1.1 and Hypothesis ♠ (pp. 194–195); notation (xiv)–(xv) (pp. 202–203); §2 Thm 2.1 and its proof (pp. 203–204); Lemma 3.3; §4 pp. 218–219; Remark 12; Thms 6.4 and 6.5; §7.1 Thm 7.1 and its proof (pp. 231–232); bibliography [10], [11], [18], [33]–[35], [38].
- B. Howard, *The Heegner point Kolyvagin system*, Compositio Math. 140 (2004); arXiv:1202.6340v1, https://arxiv.org/abs/1202.6340v1, read 29 September 2026, SHA-256 d2d06e851d6aa1fdc33a932b69b5c06a8c56dc2d9e05fb10d97c0358d6d6ea9a. Read: §0 pp. 1–2; §1 opening p. 4; Thm 1.6.1 statement; Thm 1.6.5 proof opening; Prop. 2.1.3 and its proof; Prop. 2.2.8, Lemma 2.2.9 and Thm 2.2.10 with the start of its proof; Thm 2.3.7 and the start of its proof.
- M.-L. Hsieh, *Special values of anticyclotomic Rankin–Selberg L-functions*, Doc. Math. 19 (2014) 709–767. Author copy https://www.math.ntu.edu.tw/~mlhsieh/research/VBDP.pdf, read 29 September 2026, SHA-256 7cba4331d6336b0709be80f5caa39318404a3ce0a8134e0c932c7c2cc5e6dcf0. Read: abstract and introduction, pp. 1–5 (Theorem C, applications I–II).
- J.-P. Serre, *Propriétés galoisiennes des points d'ordre fini des courbes elliptiques*, Invent. Math. 15 (1972) 259–331, GDZ scan https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0015/LOG_0024.pdf, read 29 September 2026, SHA-256 cfa08081727dfdeb8aa7ecc5f11592e2cb31bb1cf207e4b00a75f1e9409048b1 (the hash the FiniteFlatGroups packet records). Printed pp. 259–260 were read as page images; there is no text layer.
- Not read, and cited only as recorded by the sources above: Margulis–Tomanov (Invent. Math. 116, 1994); Ratner (Duke Math. J. 77, 1995); Cornut (Invent. Math. 148, 2002); Diamond–Taylor (Invent. Math. 115, 1994; Duke Math. J. 74, 1994); Helm (Israel J. Math. 160, 2007); Pollack–Weston (Compos. Math. 147, 2011); Bertolini–Darmon (Amer. J. Math. 121, 1999); Longo–Vigni (arXiv:1605.03168; its content was taken from the GH decomposition's record).

**For /3, /11, /12, /16, /17.**

- Hsieh, *Special values of anticyclotomic Rankin–Selberg L-functions*, Doc. Math. 19 (2014) 709–767, https://ems.press/content/serial-article-files/26241, read 29 September 2026, SHA-256 a662df673725f6abbdb5b3ee272e78973c125cbc5d6fd0ba9307c790e8070718; abstract, pp. 709–712 (Hypothesis A, Theorem A and the Remark after it), p. 714.
- Bertolini–Darmon–Prasanna, *Generalized Heegner cycles and p-adic Rankin L-series*, Duke Math. J. 162 (2013), https://www.math.mcgill.ca/darmon/pub/Articles/Research/51.BDP1/duke-publishedversion.pdf, read 29 September 2026, SHA-256 223bfdad6571c211a1b3e11c4688f2831f06a642eafef7c3552c9506a7188fbc; pp. 1037–1039 (Main Theorem, the r = j = 0 case), §5.3 (Assumption 5.12, the statement of Theorem 5.13).
- Castella–Hsieh, *Heegner cycles and p-adic L-functions*, arXiv:1505.08165v2, read 29 September 2026, SHA-256 a98f9f37a45f46b55968e1fde8fc952b909dda91e6239dafc1dd3688fd8b9755; Theorem 4.9 (p. 20).
- Jetchev–Skinner–Wan, *The Birch and Swinnerton-Dyer formula for elliptic curves of analytic rank one*, arXiv:1512.06894v1, read 29 September 2026, SHA-256 908562efdddaf46b2653317294cb65ae627802bc996400a779b1cd51b5a7d49d; §5.1.5 (Prop. 5.1.6 = Brooks Prop. 8.13), §7.3 (Remark 7.3.3), §7.4.
- Česnavičius–Neururer–Saha, *The Manin constant and the modular degree*, arXiv:1911.09446v3, read 29 September 2026, SHA-256 4d76a0daf4ffa103a4a96f6fafe6de22c44e194cd2c47489c75be8967f1d5448; §1 (pp. 1–3, footnotes 1–4, Theorems 1.1–1.2).
- Lapid–Rallis, *Positivity of L(1/2, π) for symplectic representations*, Ann. of Math. 157 (2003) 891–917; abstract at https://annals.math.princeton.edu/2003/157-3/p05, read 29 September 2026 (abstract only).
- Guo, *On the positivity of the central critical values of automorphic L-functions for GL(2)*, Duke Math. J. 83 (1996); Crossref record for doi:10.1215/S0012-7094-96-08307-6 only, 29 September 2026. The text was not served.
- Pinned libraries: Mathlib 082e2d3 `Mathlib/GroupTheory/Descent.lean` (lines 1–40, 105–160), `Mathlib/AlgebraicGeometry/EllipticCurve/LFunction.lean:84`; Tau Ceti f790474 `TauCeti/AlgebraicGeometry/EllipticCurve/CanonicalHeight.lean` (lines 22–34, 95–125, 320–342, 370–392), `MordellWeil/NaiveHeight.lean:91`, `MordellWeil/Regulator.lean:80–100`, `TauCeti/NumberTheory/LSeries/Positivity.lean`.

**For /4, /5, /14, /23.**

- C. Skinner, *Multiplicative reduction and the cyclotomic main conjecture for GL2*, arXiv:1407.1093v1 (4 July 2014; published Pacific J. Math. 283 (2016)), https://arxiv.org/abs/1407.1093v1, read 29 September 2026, SHA-256 02d176d8fd52b0159eecb448f4bea89bd29bdf73f3095a686d52ad96c0a9b988. Read Theorems A–C and §§1, 2.2, 2.4, 2.5, 3.1, 3.2 and 3.3 (opening).
- C. Skinner and E. Urban, *The Iwasawa main conjectures for GL2*, author copy, https://www.math.columbia.edu/~urban/eurp/MC.pdf, read 29 September 2026. Read §1.1–1.2 (Theorem 1 = Theorem 3.6.4; Theorem 2 = Theorem 3.6.11). The published Invent. Math. 195 (2014) version was not available.
- O. Fouquet and X. Wan, arXiv:2107.13726v3, https://arxiv.org/abs/2107.13726v3, read 29 September 2026, SHA-256 39cee6cec8a5d56baf5c0b19dd892a571bc7945eab281d6ec9a9c14fa70294ee. Read §1.1.1, Theorems 1.6 and 1.7 and the preceding remark on [117].
- D. Jetchev, C. Skinner and X. Wan, *The Birch–Swinnerton-Dyer formula for elliptic curves of analytic rank one*, arXiv:1512.06894v1, https://arxiv.org/abs/1512.06894v1, read 29 September 2026, SHA-256 908562efdddaf46b2653317294cb65ae627802bc996400a779b1cd51b5a7d49d. Read Theorem 7.2.1 and Remarks 7.2.2–7.2.3.
- F. Castella, G. Grossi and C. Skinner, *Mazur's main conjecture at Eisenstein primes*, arXiv:2303.04373v2, https://arxiv.org/abs/2303.04373v2, read 29 September 2026, SHA-256 5046d7571ed3a1b13baa56b2c94186d9c9488d76181062f4ba82b8ab5158af90. Read the Introduction (Theorem A discussion), Theorem 2.1.1 with proof, and Lemma 2.4.4 with proof.
- T. Keller and M. Yin, arXiv:2402.12781v2, https://arxiv.org/abs/2402.12781v2, read 29 September 2026, SHA-256 bb64820b49aa1eb2574c912c0d03067f904e52b9bf71f441fda78bb6dba9c90a. Read Theorem 1.2.2 with proof.
- M. Waldschmidt, *Transcendence of periods: the state of the art*, PAMQ 2 (2006), author PDF https://webusers.imj-prg.fr/~michel.waldschmidt/articles/pdf/TranscendencePeriods.pdf, read 29 September 2026, SHA-256 97428d55ee27acc74280f8d766d9bd3778bbf9f0ed2d7f38feda684052ed3bcc (the same file as the DT packet's source). Read p. 443 (the BDGP statement and the Mahler–Manin problem) and reference [8].
- LMFDB (https://www.lmfdb.org, API `ec_curvedata` and `ec_localdata`), read 29 September 2026: curves 67.a1, 14.a4, 14.a1 and 37.a/b (rank, isogeny degrees, a-invariants, local reduction types and discriminant valuations). a_3, a_5, a_7 and a_11 of 67.a1 were recomputed by point counting.
- Not read (cited through the sources above): Greenberg–Stevens, Invent. Math. 111 (1993); Barré-Sirieix–Diaz–Gramain–Philibert, Invent. Math. 124 (1996); Rubin, Invent. Math. 103 (1991) and 1994; Hida–Tilouine, Invent. Math. 117 (1994); Hida, Ann. of Math. 172 (2010); Wüthrich, Doc. Math. 19 (2014) (no public copy found in this pass).

**For /6, /22, /24, /26, /27, /28.**

- Skinner–Urban, *The Iwasawa main conjectures for GL₂*, Invent. Math. 195 (2014); author copy https://www.math.columbia.edu/~urban/eurp/MC.pdf, read 29 September 2026, SHA-256 f9faa40aa5e30eba705da88e3d68c8aa43069b5be01c1cc6ece212dd57879748; pp. 2–3 (Theorem 1), 99–105 (§§7.1–7.3).
- Fouquet–Wan, *The Iwasawa main conjecture for universal families of modular motives*, arXiv:2107.13726v3, read 29 September 2026, SHA-256 39cee6cec8a5d56baf5c0b19dd892a571bc7945eab281d6ec9a9c14fa70294ee; pp. 6, 12, 17 (Assumption 2.1), 42–44 (§4.2), 58–62 (§4.6), 68 (§4.8), 78–79 (§6.3), 80–97 (Appendix B, Theorem 7.32).
- Castella–Liu–Wan, *Iwasawa–Greenberg main conjecture for non-ordinary modular forms and Eisenstein congruences on GU(3,1)*, arXiv:2109.08375v1, read 29 September 2026, SHA-256 0dcb80a52de820ef08982a94211377a7a7b56e47a9305bf217ba38f57726e45e; §2.9, pp. 78–81 (Theorem 8.2.1 and proof), bibliography.
- Castella–Wan, *The Iwasawa main conjectures for GL₂ and derivatives of p-adic L-functions*, arXiv:2001.03878v1 (only version), read 29 September 2026, SHA-256 9bb85193d1b7591bd1abc5b7b5bbcee2164559733c5da6714f000f64761b0f5b; §3.2 Theorem 3.6, §3.3 Theorem 3.8.
- Loeffler–Zerbes, *Iwasawa theory and p-adic L-functions over Z_p²-extensions*, arXiv:1108.5954v3, read 29 September 2026, SHA-256 0da539348716fa2293377bba81b07de3d851f3e98bbc9b244b19e639a5ae5341; §3 (Definition 3.7), §4 (Theorems 4.7, 4.13, 4.15, 4.17; Proposition 4.11).
- Not read (not publicly available, or download failed): Harris, Ann. of Math. 119 (1984); Hida–Tilouine, Ann. Sci. ÉNS 26 (1993) and Invent. Math. 117 (1994); Hida, Doc. Math. Extra Vol. (2006); Hida, Ann. Inst. Fourier 41 (1991); Pan, Theorem 1.0.4; Kisin, Ann. of Math. 170 (2009); Wan, Forum Math. Sigma 3 (2015); Emerton's 2011 local–global manuscript.

**For /7, /25, /32, /33, /34.**

- Hsieh, *Special values of anticyclotomic Rankin–Selberg L-functions*, Doc. Math. 19 (2014) 709–767, published version, https://ems.press/content/serial-article-files/26241, read 29 September 2026, SHA-256 a662df673725f6abbdb5b3ee272e78973c125cbc5d6fd0ba9307c790e8070718. Read: introduction pp. 711–714 (Theorems A–C), pp. 756–763 (Theorems 6.1, 6.2, 7.1; §7 outline and §7.4), bibliography.
- Hsieh, *On the non-vanishing of Hecke L-values modulo p*, arXiv:1208.4751 (dated 12 August 2012; published Amer. J. Math. 134 (2012) 1503–1539), https://arxiv.org/pdf/1208.4751, read 29 September 2026, SHA-256 330cbaa073b6998f51647f34eff43b2c4d8293abaf236296477cc1953a9156c5. Read: pp. 1–3 (Theorems A, B) and Theorem 3.1 with its remark.
- Castella–Liu–Wan, *Iwasawa–Greenberg main conjecture for non-ordinary modular forms and Eisenstein congruences on GU(3,1)*, arXiv:2109.08375v1, https://arxiv.org/pdf/2109.08375v1, read 29 September 2026, SHA-256 0dcb80a52de820ef08982a94211377a7a7b56e47a9305bf217ba38f57726e45e. Read: introduction pp. 3–4, §5.6 (p. 36), §6.1 (p. 52), §7.11 (p. 70), proof of Theorem 8.2.1 (p. 81), bibliography.
- Eischen–Wan, *p-adic Eisenstein series and L-functions of certain cusp forms on definite unitary groups*, arXiv:1404.7153v2, https://arxiv.org/pdf/1404.7153v2, read 29 September 2026, SHA-256 df523d74a0bdf668ea619e82074721ca953874331a3289784bd94ad197a9f40e. Read: Theorem 1.2 and Remarks 1.3–1.4 (pp. 4–5), Proposition 4.8 (p. 25), p. 34.
- Barrera Salazar–Williams, *P-adic L-functions for GL2*, arXiv:1602.06244v3, https://arxiv.org/pdf/1602.06244v3, read 29 September 2026, SHA-256 4209161c0b5f139372833fd873cbaf2b99fcef3e6edef3ec50ba3869096d8d5f. Read: introduction pp. 3–4, §3.3 Theorem 3.4 (p. 13), Proposition 9.6 (p. 31), after Theorem 9.10 (p. 34), §12 (pp. 39–40), bibliography.
- Not read (paywalled or not fetched): Hida 2004 (*Geometric aspects of Dwork theory*), Hida, Ann. of Math. 172 (2010), Vatsal, Duke 116 (2003), Finis, Ann. of Math. 163 (2006), Skinner–Urban, Invent. Math. 195 (2014), Hida, Duke 74 (1994), Barrera Salazar 2013/2015, Williams 2017, Bergdall–Hansen 2017, Coleman–Edixhoven 1998. They are cited only as the texts above cite them.

**For /18–/21, /35, /36.**

- C. Skinner, *Multiplicative reduction and the cyclotomic main conjecture for GL₂*, arXiv:1407.1093v1, https://arxiv.org/pdf/1407.1093v1, read 29 September 2026, SHA-256 02d176d8fd52b0159eecb448f4bea89bd29bdf73f3095a686d52ad96c0a9b988. Read: §2.3 (pp. 8–13): Props. 2.3.2, 2.3.3, Lemma 2.3.4 and footnote 5.
- R. Greenberg, *On the structure of Selmer groups* (Elliptic curves, modular forms and Iwasawa theory, PROMS 188, 2016), author's copy https://sites.math.washington.edu/~greenber/Sel.pdf, read 29 September 2026, SHA-256 63bcdc99e58c510b54823b5c22f9c432141bbccbeda0881bd747c382426bf36f. Read: §1–§2.5, §4.1 (Prop. 4.1.1, Cor. 4.1.2, Remark 4.1.3) and §4.2 (pp. 1–9, 15–21).
- R. Greenberg, *Iwasawa theory for elliptic curves* (CIME 1997; LNM 1716, 1999), author's copy https://sites.math.washington.edu/~greenber/CIME.ps, read 29 September 2026, SHA-256 ab35c11b0c1093af5f59cc4db5fce96a4c98375e442605445ae8a7d1adc3cb3e. Read (as extracted text): Theorem 4.1, Lemma 4.6, Prop. 4.8, Prop. 4.13, Prop. 4.14, Prop. 4.15 (pp. 35–54 of that copy).
- F. Castella, T. Sano, *On refined nonvanishing conjectures by Kurihara and Kolyvagin*, arXiv:2601.14504v1 — abstract only (29 September 2026).
- Not re-read: Mazur–Rubin 2004 (no public arXiv version found), BSS II, Rubin's Euler systems draft; the fixes cite only locators already in the READMEs.

**For /15, /29–/31.**

- Castella, *Erratum to "On the p-part of the Birch–Swinnerton-Dyer formula for multiplicative primes"*, https://web.math.ucsb.edu/~castella/Birch-erratum.pdf (PDF dated 27 June 2024), read 29 September 2026, SHA-256 c04dff16c27bc3ca4f4e235e366fcd4c95a43cfb9215f75a2584dfeb7114edcf; all 5 pp.
- Castella, *On the p-part of the Birch–Swinnerton-Dyer formula for multiplicative primes*, arXiv:1704.06608v2 (Camb. J. Math. 6 (2018) 1–23), https://arxiv.org/abs/1704.06608, read 29 September 2026, SHA-256 23e3ab4e9d99ceba88d3aaf0fa0612b60ac728086f82555f951f4e1853323081; Theorem A and §4 (Theorems 4.2, 4.4).
- Burungale–Castella–Skinner, *Base change and Iwasawa main conjectures for GL₂*, arXiv:2405.00270v2 (18 March 2025), read 29 September 2026, SHA-256 bf87592cdbaabb5c57004bfd44dd5b4d712cb306bbbdc36520a3daf92fa416f3; §§4–5 in full (pp. 8–11).
- Burungale–Skinner–Tian–Wan, *Zeta elements for elliptic curves and applications*, arXiv:2409.01350v2 (11 September 2024), read 29 September 2026, SHA-256 18e05982cdb2ac57cd7fcdc4791e5db8bff2945755653a5b76dd94377ed11ecf; §1.2 (Theorem 1.14, Remark 1.15, (1.3)–(1.8)), §2.2.5 ((van_M)), §2.5.1, §9.3 (Lemma 9.17, Proposition 9.18 and proof, Proposition 9.20).
- Castella–Grossi–Skinner, *Mazur's main conjecture at Eisenstein primes*, arXiv:2303.04373v2 (15 October 2025), read 29 September 2026, SHA-256 5046d7571ed3a1b13baa56b2c94186d9c9488d76181062f4ba82b8ab5158af90: §2.2 (Proposition 2.2.4), §2.4 (Theorem 2.4.1, Lemma 2.4.4, Proposition 2.4.5), §6 opening, 6.1 (Theorem 6.1.1), 6.5 (Theorems 6.5.1, 6.5.2). v1, SHA-256 bd1e6c36d1fbe243dc6d41756abbd0773a5175200801e719e345e1a027bd2b8d, was read for the numbering: Proposition 1.2.4, Proposition 1.4.5, Theorems 5.1.1, 5.5.1, 5.5.2.
- Burungale–Castella–Kim, *A proof of Perrin-Riou's Heegner point main conjecture*, arXiv:1908.09512v2 (Algebra Number Theory 15 (2021)), read 29 September 2026, SHA-256 86504f717f309c3f967ab79bb29bef2a138e74a82d3e4b163ccd768d5b4a6496; §5 (Theorems 5.1, 5.2 and proof) and Corollary 4.5.
- Fouquet–Ochiai, *Control theorems for Selmer groups of nearly ordinary deformations* (Crelle 666 (2012) 163–187), author copy https://www.math.titech.ac.jp/top/~ochiai/ControlF-O.pdf (24 pp., PDF dated 5 December 2010), read 29 September 2026, SHA-256 ed908e9b9c5facbf47acc326e51239d97f8dc03d3d52f7387a9851e5f5b178c1; table of contents (§§1–4 only) and §2.1.4, Lemma 2.14. The published version was not read.
- Fouquet–Wan, *The Iwasawa main conjecture for universal families of modular motives*, arXiv:2107.13726v3, read 29 September 2026, SHA-256 39cee6cec8a5d56baf5c0b19dd892a571bc7945eab281d6ec9a9c14fa70294ee; Theorem 4.41, §7.4.1 (Lemma 7.20 proof, Corollary 7.21, Lemma 7.22).

