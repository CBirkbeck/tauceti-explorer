# RT-PAPER-PAN-26: fixes

Fixer: Claude Code, session `cc-f805bf`, 30 September 2026 (issue #5017, job FIX-RT-PAPER-PAN-26).

- **Findings:** `RT-PAPER-PAN-26.result.json`.
- **Verdicts:** `RT-PAPER-PAN-26.review.json` and `reviews/REV-RT-PAPER-PAN-26.md` (verifier `cc-58621d`). All fourteen findings are confirmed: one high (/1), eight medium (/2–/6, /8–/10) and five low (/7, /11–/14).
- **What this job fixes:** the high and medium findings, /1–/6 and /8–/10, as the issue lists them.
  - Where the verifier's reason differs from the red team's fix text, I followed the reason. It sets the scope of each fix.
  - The low findings are recorded below and not applied (PROTOCOL §17).
- **Disclosure.**
  - This session (`cc-f805bf`) wrote the red team RT-PAPER-PAN-26 (PR #4768) whose findings are fixed here.
  - It also wrote the red team of PAPER-BREUIL-HELLMANN-SCHRAEN-19 (PR #4759), which /1 and /3 cite; reviewed PAPER-FARGUES-FONTAINE-18 (PR #4683), whose route 5 the new route 12 joins in DESIGN-PadicHodgeTheoryPartII; and wrote the fix of RT-PAPER-SCHOLZE-12.
  - It did not write this extraction, its review or the verification.
  - The fix follows only the scope that the independent verifier authorised. Where the verifier narrowed or changed my own red-team fix (/1–/6, /8–/10), I applied its version, as each section says.
- **Files changed. Only the deliverables:**
  - `papers/PAPER-PAN-26.result.json`;
  - `papers/PAPER-PAN-26.md`: the status line, the route table and route paragraphs, the planned items, the source issues (E4), the first gap, the validation line, and a closing section "Fixes after the red team";
  - this report.

  `make_queue.py`, `queue.json`, the review files and the other papers are not deliverables. Every change a finding asks of them is listed under "For the maintainer".
- **Result.** 284 items (273 missing, 11 planned), 13 routes, 4 source issues (E4 new), 7 gaps.
  - New items /557–/567. /300, /493, /494 became planned. /354 moved from RD.4 to RD.5.
  - Route sizes: route 1 216 (was 206); route 2 1 (was 17); route 5 1 planned (was 16); route 6 5 (was 7); route 7 1 (was 3); route 9 1 (was 2); route 10 1 planned (was 2); routes 3, 4, 8 unchanged; new routes 11 (17), 12 (17) and 13 (1).

## Route positions

The queue matches review verdicts to routes by position (`accepted_routes` in `make_queue.py`).

- **Nothing was deleted or moved.** Routes 1–10 keep their positions, kinds and roadmaps.
- **Routes 11–13 are new and appended**, and have no review verdict yet. Each reason says so. `accepted_routes` does not return them until the next review of the extraction accepts them. Each is keyed exactly as the accepted proposal it joins, so that `paper_designs` merges it into that design:
  - route 11: `new`, `LocallyAnalyticRepresentationsOfLocalGroups`, as PAPER-DING-25 route 1;
  - route 12: `part-ii`, parent `PadicHodgeTheory`. Grouping is by parent, so the id `PadicHodgeTheoryPartIIAlmostDeRham` is only a label;
  - route 13: `new`, `ProetaleCohomologyOfPAdicCurvesAndTowers`, as PAPER-COLMEZ-DOSPINESCU-NIZIOL-20-B route 1.
- **Routes 5, 6, 7 and 9** keep their stages. They only lose items, and route 5 gains the planned /450. Each reason ends with a dated correction.
- **Routes 2 and 10 had to be re-pointed in place.**
  - Findings /2 and /6 took away all their missing items. `check_paper.py` rejects a route with no items ("names the items it takes").
  - Dropping either route would pass its accepted verdict to the next route. Route 10 is last, but the appended routes would then take slot 10.
  - So each keeps its roadmap and one item, and its stages change within that roadmap:
    - Route 2 → `LocallyAnalyticDistributions:L4` with Example 2.2.2 (/107). The verifier authorised exactly this: "If a source route is kept for any of them, it should name L4, not L0."
    - Route 10 → `AlgebraicModularFormsAndSerreWeights:R15.1` with the Kodaira–Spencer item (/557, planned there). The verifier's alternative to dropping route 10 is "or correct its reason". It names R15.1 as the owner of the Kodaira–Spencer part of /300. It does not expressly authorise re-pointing the route, so this is the one place where I departed from the append rule. Without it, the alternatives were an empty route, which the checker rejects, or a new route in an old route's slot.
  - Both routes' reasons say that their verdict was given to the old target and that the next review should give a fresh one. Until then, `accepted_routes` returns them with the old "accept" (checked read-only; see Checks). The maintainer may hold them (see below).

## /1 (high, duplicate): route 1 feeds two design jobs: route 1 annotated; the rest is for the maintainer

I followed the verifier's version.

- **Checked myself.**
  - `make_queue.py` at origin/main:
    - `paper_designs` keys a part-ii route by its parent alone (`key = ("part-ii", route["parent"]) …`);
    - the fixed design list holds `("DESIGN-PAN", "LocallyAnalyticCompletedCohomology", "langlands", PAN_BRIEF, None)`;
    - `PAN_BRIEF` does not name PAPER-PAN-26.result.json.
  - `queue.json` holds DESIGN-PAN (order 5) and DESIGN-CompletedCohomologyAndLocalGlobalCompatibilityPartII (order 130). Both are pending.
  - Issue #3459, the grouped job, lists five proposals: Pan route 1 and the routes of BHS19, Ding, Newton–Thorne and Böckle–Iyengar–Paškūnas.
- **Attribution.** As the verifier corrected, the extraction and its review followed the maintainer's papers.json instruction. The fault is in the queue script.
- **Changed in the deliverables.** Route 1's reason ends with a dated correction:
  - the route is meant for DESIGN-PAN, not for a grouped Part II of the parent;
  - today it also feeds #3459, and the maintainer is asked to fold it into DESIGN-PAN and regenerate #3459 without it;
  - its id and parent are unchanged. Re-keying it would create a third job, which the verifier forbade.
- **Not in a deliverable:** `make_queue.py` and `queue.json`. See "For the maintainer".

## /2 (medium, error): §2 and the locally analytic induction had no owner: fixed

I followed the verifier's version.

- **New route 11** (`new`, `LocallyAnalyticRepresentationsOfLocalGroups`, "Locally analytic representations of p-adic reductive groups", area `representations`) takes /100–/106, /108–/116 and /357. The id, title and area are copied from PAPER-DING-25 route 1.
- **Its brief** asks for:
  - G_n-analytic vectors and V^la as a Hausdorff LB-space;
  - Prop. 2.1.5;
  - the compact-type criteria: Prop. 2.2.3, Cor. 2.2.4, Lemma 2.2.5;
  - R^i LA with (strong) LA-acyclicity (Prop. 2.3.6);
  - the locally analytic induction from B (5.1.10).
- **The verifier's addition.** DLB17's brief imports the underlying functional analysis, so the compact-operator items /106–/110 have no other owner. The brief says that this roadmap plans them.
  - The definition and basic API of compact operators are imported from Mathlib's `IsCompactOperator`.
  - The mod-p^k finiteness criterion, 2.2.3, 2.2.4 and 2.2.5 are planned here.
- **Route 2** keeps only /107 (Example 2.2.2, compact maps between Tate algebras) and is re-pointed to L4, as the verifier prescribed. Its reason says why and asks for a fresh verdict.
- **Route 9** keeps /356, and /357 moves to route 11. Route 9's reason and /357's note say so.
- **Route 1's "What to import"** now names route 11 for the locally analytic vectors and L4 for /107, in place of "LocallyAnalyticDistributions for the functional analysis of locally analytic vectors".
- **Checked.**
  - The stage texts of L0–L4 are in `atlas/roadmaps/LocallyAnalyticDistributions.json`. L4: "Prove continuity and compactness of the semigroup operators … in the precise compact-operator setting".
  - PAPER-DING-25 route 1 and PAPER-DOSPINESCU-LEBRAS-17 route 3 have the key and the briefs quoted.
  - DESIGN-LocallyAnalyticRepresentationsOfLocalGroups (#3411) is pending, and its issue lists Ding, DLB17 and BCGP25. No roadmap file exists, so the design has not landed and a `new` route is the right form.
  - `IsCompactOperator` is at Mathlib 082e2d3, Mathlib/Analysis/Normed/Operator/Compact/Basic.lean:71 (read, and listed in declarations.tsv). The unit-ball and bounded-set characterisations are at :189 and :151, composition at :276 and :290, and continuity at :364.

## /3 (medium, error): Fontaine's almost de Rham theory sat in a source route: fixed

I followed the verifier's version.

- **New route 12** (`part-ii`, parent `PadicHodgeTheory`, title "P-adic Hodge theory and geometric comparison, Part II: Fontaine's almost de Rham representations and the Fontaine operator in Banach and LB families", area `padic`) takes /20 and /451–/465, and /567 from /8.
- **Its brief** asks for:
  - [Fon04]: B_pdR, D_pdR, ν and the classification;
  - the paper's Banach and LB generalisations, which the verifier required: Props. 6.1.5, 6.1.8, 6.1.18, 6.1.20 with Cor. 6.1.21, Defs. 6.1.9 and 6.1.13, and Theorem 6.1.16, with the t^{k+1} correction (E4).
  - It cites PadicHodgeTheory P7, node P7/sen-module, for finite-dimensional Sen theory, as the verifier asked.
  - It imports R06.1, with the note that Mathlib has `WittVector.fontaineTheta`, `BDeRhamPlus` and `BDeRham` but not the DVR property, t or the Galois action.
  - It names all four PadicHodgeTheory Part II proposals it merges with. The verifier noted that the merge is wider than the finding said: Gleason–Lim–Xu and Guo–Reinecke join Fargues–Fontaine and Heuer.
- **Route 5** keeps its roadmap and stage R06.1, and now carries the planned /450. Its old verdict reason ("R06.1 owns … θ and the de Rham period rings, which is what the paper's … computations consume") fits /450. The reason says that /450 has no verdict on this route yet.
- **Route 1's imports** now take the almost de Rham theory from route 12, in place of "PadicHodgeTheory and CohomologyComparisons for … Fontaine's almost de Rham theory".
- **Checked.**
  - The R06.1 and P7 stage texts, and node P7/sen-module in `packets/PadicHodgeTheory--P7.json`.
  - DESIGN-PadicHodgeTheoryPartII (#3426) is pending and lists Fargues–Fontaine route 5, Gleason–Lim–Xu route 14, Guo–Reinecke route 2 and Heuer route 4. No PadicHodgeTheoryPartII roadmap exists, so no Part III question arises.
  - `BDeRhamPlus` (Mathlib/RingTheory/Perfectoid/BDeRham.lean:77), `BDeRham` (:90) and `WittVector.fontaineTheta` (FontaineTheta.lean:165) are at 082e2d3.
  - Props. 6.1.5–6.1.20 were read on pp. 84–92 of arXiv v1.

## /4 (medium, error): /493 and /494 were already planned: fixed

I followed the verifier's version, which splits /494.

- **/493** is planned at `HodgeTateAndCanonicalSubgroups:T6:log-sites`, `…:T6:comparison` and `PadicHodgeTheory:P8:local-rational`. Its note quotes the stage texts.
- **/494** keeps the log connection, the Poincaré lemma sequence and the log Faltings extension. It is planned at T6:comparison and P8:local-rational.
  - The clause specific to the modular curve is split off as the new **/559** (missing, route 1). That is the Kodaira–Spencer triviality of Ω¹_{V_0}(C), the filtration of gr^k OB^+_dR by Tate twists and the presentation (6.3.3). The verifier required this split.
  - /494's `uses` drops /300. /559 uses /494 and /557.
- **Route 6** loses /493 and /494. Its reason drops "the structural de Rham period sheaf … with the explicit power-series presentation of the period ring" and ends with a dated correction. Route 6 keeps /495, /496 and /545–/547.
- **Route 1's imports** name T6:log-sites, T6:comparison and P8:local-rational for the log period sheaf.
- **Not done:** the optional source route to HodgeTateAndCanonicalSubgroups. Planned items need no route, and a new route would need its own verdict.
- **Checked.** In `atlas/roadmaps/HodgeTateAndCanonicalSubgroups.json`:
  - T6:log-sites: "construct … the pro-Kummer-étale site of Diao–Lan–Liu–Zhu";
  - T6:comparison: "construct the logarithmic structural de Rham period sheaves, their connections and filtrations, and prove the logarithmic Poincaré lemma".

  P8:local-rational says that roadmap "owns the logarithmic Kummer-site extension". The paper's pp. 99–100 were read.

## /5 (medium, error): RD.4 does not include finiteness, and the Drinfeld tower is not rigid cohomology: fixed

The verifier confirmed the fix as it stood and added the refinement for /433, which I used.

- **/354** is planned at `PadicDifferentialEquationsAndRigidCohomology:RD.5`, not RD.4. Its new note says what nothing plans:
  - log-rigid cohomology of the overconvergent logarithmic F-isocrystal (Sym^k D, ∇_k) on the compactified Igusa curves;
  - its comparison with the open Igusa curve, or Coleman's computation ([Col96, §8], [Col97, Thm 2.1]).

  The nearest material is the overconvergent logarithmic de Rham complex of AutomorphicGaloisRepresentationsPartII AG2.4.
- **Route 1's brief** asks the Part II to prove that comparison or to import it from a named owner.
- **Route 7** keeps /353 at RD.4. Its reason no longer says "RD.4 constructs … its finiteness".
- **/433** (Def. 5.6.5, the j_! presentation, which is Pan's own) moves to route 1, with a note citing CDN20-B. This is the verifier's refinement.
- **/437** (5.6.9) moves to the new **route 13** (`new`, `ProetaleCohomologyOfPAdicCurvesAndTowers`), keyed as CDN20-B route 1.
  - Its brief lists the finite-level statements that roadmap owns: H^i_{dR,c}, the vanishing of higher coherent cohomology, Serre duality, CDN's H^1_c and the finite-dimensionality of H^2_{dR,c}.
  - It says that the j_! identification stays with route 1, which imports route 13 and is not imported by it. This keeps the new edge acyclic. /433 uses Pan's objects /390 and /394, so putting it on route 13 would have made route 13 import route 1 while route 1 imports route 13, a cycle.
- **Checked.**
  - RD.4: "Separate geometric construction from finite-dimensionality: a named finite-dimensional output type cannot replace the finiteness proof".
  - RD.5: "prove finite-dimensionality of H^i and H_c^i", with Kedlaya as the source route.
  - AG2.4's text.
  - p. 54: the proof of Prop. 5.1.7 cites [Col97, Theorem 2.1] and [Col96, §8] and says "log-rigid cohomology".
  - pp. 81–82.
  - CDN20-B items 4.1-thm-4-1 and 5.3-thm-5-8.
  - #3410 is pending, and no roadmap file exists.

## /6 (medium, error): route 10's layers plan none of its items: fixed

I followed the verifier's version, which names three more owners.

- **/300 is split in three.**
  - **/300** keeps the de Rham bundle, its Hodge filtration, the Gauss–Manin connection, the canonical extension with log connection and filtration, the cup product and Sym^k D with ∇_k. It is planned at `AbelianSchemesAndArithmeticModuli:A4` and `AutomorphicBundles:B3`.
  - **/557** (new) is the Kodaira–Spencer isomorphism with log poles, planned at `AlgebraicModularFormsAndSerreWeights:R15.1`. Its note says that the node R15.1/hodge-bundle-with-tate-curve-normalization only quotes it, from Katz A1.3.17 and Deligne, "no proof is given", so its proof is unowned. The verifier's "(proof unowned)".
  - **/558** (new, missing, route 1) is the Sym^k consequence of Kodaira–Spencer and the operators θ′_{k+1} and θ_{k+1}.
- **/326** moves to route 1, as the verifier decided. The red team's alternative, OverconvergentAutomorphicForms O8, was not taken.
- **Route 1's brief** constructs θ′_{k+1}, θ_{k+1} and the overconvergent forms, and imports A4, B3 and R15.1.
- **Route 10** is re-pointed to R15.1 with /557. See "Route positions" for why, and for the fresh verdict it needs. Its reason corrects the old claim.
- **Checked.**
  - A4: "Construct relative H¹_dR, its Hodge exact sequence, Gauss–Manin connection, cup-product pairing".
  - B3: "Construct the canonical extension … Establish extension of the logarithmic connection".
  - R15.2, R15.3 and R15.5 as the finding quotes them.
  - The R15.1 node in `packets/AlgebraicModularFormsAndSerreWeights.json`, whose proof step reads "is quoted with the references (cf. A1.3.17 and [7]) … no proof is given in 1.5".
  - p. 34 ("It is well-known that the composite map … is an isomorphism (Kodaira-Spencer isomorphism)").

## /8 (medium, missing): the imported theorems had no items: fixed

I followed the verifier's version: four Paper I items rather than seven, and Scholze's Proposition 7.9 missing, not planned at P8.

- **New items**, all on route 1 unless stated otherwise:
  - /560, Paper I Theorem 4.4.6. Completed cohomology is H^i(Fℓ, O_{K^p}), and its la vectors are H^i(Fℓ, O^la), with the Čech computation that pp. 28–30 use.
  - /561, Paper I Theorem 4.3.9: the power-series expansion.
  - /562, Paper I Theorem 4.2.2: Faltings's extension as minus a twist of the Hodge–Tate sequence.
  - /563, Paper I Theorem 5.1.8: θ_h(diag(0,1)) is the Sen operator.
  - /564, Emerton's local–global compatibility, **planned** at `CompletedCohomologyAndLocalGlobalCompatibility:R31.4`. Its note lists R31.4's hypotheses. It also records that the paper cites the result through [Pan22, Cor. 6.3.6], which Pan derives from Paškūnas's work. So the form used needs R31.4's residual hypotheses or that route.
  - /565, [LXZ12]/[Col14]: missing.
  - /566, Breuil's Σ(2, L): missing.
  - /567, [Sch13, Prop. 7.9]: missing, on **route 12**, since P8 does not plan it. Its note names HodgeTateAndCanonicalSubgroups T6:comparison ("Derive the Hodge–Tate filtration from the two de Rham lattices") as its logarithmic automorphic consumer.
- **The Paper I results that already have items** (/201, /237, /327, /545, /21) are unchanged, as the verifier found.
- **Route 1's "What to import"** adds:
  - R31.4 and PadicLocalLanglandsForGL2Qp, for the special case and the comparisons of Remarks 7.3.6–7.3.11 only;
  - items /560–/563, with the note that DESIGN-PAN's brief covers Paper I in full.

  The [Pan22] prerequisite entry was already present and is unchanged.
- **Checked.**
  - Paper I: arXiv:2008.07099v3 (8 July 2021, SHA-256 `c2fed4f1b9ae3c44b26cce3ee32b564afcdf430dde05163a233b1fe0b269b659`). I read Theorems 4.2.2, 4.2.7, 4.3.9, 4.4.6 and 5.1.8, Corollaries 4.2.8 and 6.3.6. Their numbering agrees with every [Pan22, …] citation checked in Pan II.
  - Scholze: arXiv:1205.3463v2 (SHA-256 `ed9187b3269adb7e9964369470073ce8760ef56ef0c0b89538c0a1509f811959`, the hash recorded in the Betts–Stix fix). I read Definitions 7.1, 7.4 and 7.5, Theorems 7.2 and 7.6 and Proposition 7.9. /567 states Proposition 7.9 with §7's hypotheses: X smooth over Spa(k, O_k), k discretely valued with perfect residue field.
  - R31.4's text, quoted in /564.
  - The Pan II pages: 17, 19–23, 28–30, 59, 65, 103, 106, 111 and 123–125.

## /9 (medium, error): hypotheses and status of the comparison items: fixed

I followed the verifier's version.

- **/554** now reads as follows:
  - H̃¹[λ_τ]^la_0 ≅ (π^{∞,p})^{K^p} ⊗ Ind D_cris/π_p;
  - "If moreover ρ|G_{Q_p} is absolutely irreducible, Emerton's local-global compatibility (item /564) gives Π(ρ|G_{Q_p})^la ⊗̂_E C = Ind_B^{GL_2(Q_p)} D_cris(ρ|G_{Q_p})/π_p";
  - "the local form of this isomorphism was conjectured by Berger-Breuil [BB10, Conjecture 5.3.7] and by Emerton [Eme06a, Conjecture 6.7.3], and proved by Liu-Xie-Zhang [LXZ12] and Colmez [Col14]". This is the verifier's citation, in place of the red team's "(dual) Berger–Breuil–Emerton conjecture".
- **/556.** The verifier noted that the item already had k = 1 and absolute irreducibility, so only the concluding equality changed. The item now says that the paper claims the equality without proof ("We claim that it is actually an equality", "it can be shown that") and sketches why. Its note says that the claim is for k = 1 and absolutely irreducible ρ|G_{Q_p}, is not proved in the paper, and imports /564–/566.
- **The first gap** is now titled "The special case is only claimed, with a sketch that imports the p-adic local Langlands correspondence", and its detail says the same.
- **/12** now reads "For π_p special (k = 1), Theorem 5.5.4 gives a three-step filtration on ker I^1_0[λ̃_τ]; the paper does not prove that ker I^1_0[λ̃_τ] is the eigenspace …". Its locator is "Remark 1.1.12, p. 5 (which points to Remark 7.3.10; the case is Remark 7.3.11, pp. 124-125)".
- **/552** now has both halves of Remark 7.3.6, and separates the two uses of [DLB17, Théorème 1.4], as the verifier required:
  - "see also" for the identification (H^1_{dR,c} ⊗ π′_p)^{O_D^×} ≅ D_dR ⊗ π_p;
  - the proof of the full Breuil–Strauch conjecture, "taking into account the Serre duality".

  The Breuil–Strauch half is the equivalence for ρ|G_{Q_p} via Emerton ([Pan22, Cor. 6.3.6]), "ρ|G_{Q_p} is absolutely irreducible as π_p is supercuspidal".
- **Checked** on pp. 5 and 123–125 of arXiv v1. Every quotation above is from there.

## /10 (medium, error): Proposition 6.1.20's t^k: fixed

I followed the verifier's version.

- **/465** uses B^+_dR/(t^{k+1}) throughout: in "B^+_dR/(t^{k+1})-linear", and in both places that say "flat", which now read "flat over B^+_dR/(t^{k+1})". Its note records the correction.
- **New source issue E4** (misprint, affects nothing, known "new"):
  - its locator is "Proposition 6.1.20 and Corollary 6.1.21, pp. 91-92 (arXiv v1)", the verifier's pages;
  - `printed` quotes all five occurrences of /(t^k);
  - the reason says that only Corollary 6.1.21 is vacuous as printed, while Proposition 6.1.20 is meaningful but misses the case applied. That is the verifier's correction. "Affects nothing" matches E2, as the verifier allowed.
- **Checked myself.**
  - pp. 89–92: 6.1.12 and Remark 6.1.14 use /(t^{k+1}), 6.1.15 has W := V ⊗ B^+_dR/(t^{k+1}), and 6.1.17 has "Hausdorff LB-B^+_dR/(t^{k+1})-modules".
  - p. 92 defines B^+_{dR,k} := B^+_dR/(t^k), and §6.2.4/6.2.14 apply the results to B^+_{dR,k+1}.
  - For a B^+_dR/(t^k)-module, t^kW = 0, so W_k = t^kW/t^{k+1}W = 0 and N_W : W_{0,0} → W_{k,−k} = 0.
- **Searched.**
  - arXiv still lists only v1 (API, 30 September 2026). The re-downloaded PDF has the recorded hash `0873b61a…31b4`.
  - The author's page (30 September 2026) lists the Annals reference and no erratum.
  - The Annals text is paywalled and was not read.

## /7 (low, error): not applied

This is a low finding, recorded only. /361, /363, /381, /382 and /383 are planned at ET.6a, since ET.6a plans the Lubin–Tate and Drinfeld towers and the Scholze–Weinstein duality. The verifier's nuance: keep ET.6 cited in /361's note for the finite-level deformation spaces, keep Pan's contravariant-convention remark, and keep /362 and /368 missing on route 4.

## /11 (low, error): not applied

This is a low finding, recorded only. The verifier confirmed (a) and (c)–(e); (b) is faithful.
- /1: "an open compact subgroup", with the p. 17 standing assumption.
- /202: cite Remark 3.2.9.
- /551: p. 122.
- /554: p. 124. The /9 fix rewrote /554's statement but left its locator.

## /12 (low, error): not applied

This is a low finding, recorded only. It lists sixteen further slips in arXiv v1, all confirmed, with the verifier's adjustments to (6), (12), (13) and (15).
- E4 is now taken by /10's misprint, so these entries should be numbered from E5.
- Slip (2) is the Remark 7.3.10 pointer. It was handled in /12's locator under /9, but its source issue is still to be recorded.
- /450's statement still copies (13): [ε] − 1 generates ker θ in B^+_dR only, not in A_inf[1/p].

## /13 (low, library-claim): not applied

This is a low finding, recorded only. The verifier's fix:
- /106's definitional part becomes `library`, citing `IsCompactOperator` and its API, with the mod-p^k criterion split off;
- /450 stays planned, with the Mathlib declarations cited in its note.

Route 11's brief already imports `IsCompactOperator`, and route 12's brief names `BDeRhamPlus`, `BDeRham` and `WittVector.fontaineTheta`. I read all four at 082e2d3. No item's status was changed.

## /14 (low, other): not applied

This is a low finding, recorded only. The fix adds to /2's note, and to route 1's brief, the cross-reference to R31.6: Pan's Theorem 1.1.2 proves the classicality step for all p, without R31.6's residual hypotheses and without R30.

## For the maintainer

These changes lie outside this job's deliverables.

- **One design job for Pan's Part II (/1).** Pan route 1 feeds both DESIGN-PAN (#950, order 5) and DESIGN-CompletedCohomologyAndLocalGlobalCompatibilityPartII (#3459, order 130). As the verifier recommends:
  - in `make_queue.py`'s `paper_designs`, fold any accepted `part-ii` or `new` route whose `roadmap` is the roadmap of a hand-coded design (here `LocallyAnalyticCompletedCohomology`) into that design, rather than grouping it by parent;
  - add to `PAN_BRIEF` a pointer to `research/blueprint/papers/PAPER-PAN-26.result.json`: route 1's brief and its now 216 items, the sourceIssues E1–E4 and the gaps;
  - regenerate #3459 without Pan, keeping BHS19 route 3, Ding route 4, Newton–Thorne route 4 and BIP route 7. RT-PAPER-BREUIL-HELLMANN-SCHRAEN-19/17 discusses whether those belong under this parent;
  - #3459 should not be claimed until then.

  The FIX-RT-PAPER-BETTS-STIX-25 report records the same bug for four pairs of jobs, this one among them.
- **Regenerate three design jobs once the next review accepts routes 11–13.**
  - DESIGN-LocallyAnalyticRepresentationsOfLocalGroups (#3411), for route 11.
  - DESIGN-PadicHodgeTheoryPartII (#3426), for route 12.
  - DESIGN-ProetaleCohomologyOfPAdicCurvesAndTowers (#3410), for route 13.

  They were generated before these routes existed, and all three are pending.
- **Routes 2 and 10 carry stale verdicts.** Until the next review re-reads them, `accepted_routes` will apply:
  - route 2 as a source of LocallyAnalyticDistributions L4 (/107);
  - route 10 as a source of AlgebraicModularFormsAndSerreWeights R15.1 (/557).

  Both are the owners the verifier named, but neither target was reviewed. Hold them if a reviewed verdict is required first.
- **Unowned inputs.**
  - The proof of the Kodaira–Spencer isomorphism with log poles (/557). The R15.1 node quotes it without a proof step.
  - The log-rigid/rigid comparison for Igusa curves, or Coleman's computation (/354). Route 1's brief asks its Part II for it. RD.5 or AG2.4 could own it instead.
  - Whoever owns [Sch13, Prop. 7.9] (/567, on route 12) should agree with HodgeTateAndCanonicalSubgroups T6:comparison, which derives the Hodge–Tate filtration from the two lattices.
- **The p-adic local Langlands inputs.** /565 and /566 are on route 1 for now. A PadicLocalLanglandsForGL2Qp Part II is the alternative the red team offered.
- **`research/errata/REGISTER.md`.** E4 is new. Let `scripts/errata.py` regenerate the register; this job did not run it.
- **Review of this fix and the next review of the extraction.** They should:
  - give verdicts on routes 11–13 and fresh verdicts on re-pointed routes 2 and 10;
  - check the new items /557–/567, the split items /300 and /494, and the restated /12, /465, /552, /554 and /556;
  - give a verdict on E4.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-PAN-26.result.json`: ok.
- `python3 research/blueprint/intake.py check-files` on the three deliverables: 3 files, 0 problems.
- **`make_queue.accepted_routes('PAPER-PAN-26')`**, run read-only, returns routes 1–10 in their order. Route 2 targets L4, route 10 targets R15.1, and routes 11–13 are not returned.
- **Edits.** One Python script edited the result and one edited the report.
  - The result script asserted that each old text occurred exactly once in its field and that each replaced field or route had its old value.
  - It also asserted the final invariants: 284 items numbered in order, 273 missing and 11 planned, every missing item taken by exactly one route, every `uses` resolved, and source issues E1–E4.
  - The result keeps its formatting: indent 2, non-ASCII characters written literally, final newline. I checked before editing that re-serialising the file gives it back unchanged.
- **Cycle test.** Read-only, on the atlas that `scripts/build.py` assembles in memory: 2,840 stages and 8,258 stage edges.
  - The model has placeholder nodes for route 1's Part II, route 11, route 12 and route 13, with 38 new edges:
    - every import named in the new briefs, among them T6, P8:local-rational, R06.1, P7, RD.4, RD.5, A4, B3, R15.1, L4, R31.x and R30.x;
    - route 11 → route 12 → route 1, and route 13 → route 1;
    - the Fargues–Fontaine export from the PadicHodgeTheory Part II. TriangulineVarietyAndItsLocalModel has no stages in the atlas yet.
  - No cycle.
- **Citations.**
  - Every paper locator was read in arXiv:2209.06366v1 (hash above).
  - Every stage and node cited was read in `research/blueprint/atlas/roadmaps/`, `research/blueprint/packets/` or the atlas assembled by `scripts/check_paper.py`.
  - The four Mathlib declarations were read at 082e2d3.
- No Lean was run. The scratch files were deleted after the checks.
