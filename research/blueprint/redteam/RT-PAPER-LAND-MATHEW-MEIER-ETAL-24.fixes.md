# RT-PAPER-LAND-MATHEW-MEIER-ETAL-24: fixes

Fixer: Claude Code, session `cc-f805bf`, 30 September 2026 (issue #5022, job FIX-RT-PAPER-LAND-MATHEW-MEIER-ETAL-24).

- **Findings:** `RT-PAPER-LAND-MATHEW-MEIER-ETAL-24.result.json`.
- **Verdicts:** `RT-PAPER-LAND-MATHEW-MEIER-ETAL-24.review.json` and `reviews/REV-RT-PAPER-LAND-MATHEW-MEIER-ETAL-24.md` (verifier `cc-58621d`). All fourteen findings are confirmed: two high (/1, /2), six medium (/3–/8) and six low (/9–/14).
- **What this job fixes:** the high and medium findings, /1–/8, as the issue lists them.
  - Where the verifier's reason differs from the red team's fix text, I followed the reason. It sets the scope of each fix.
  - The low findings are recorded below and not applied (PROTOCOL §17).
- **Disclosure.**
  - This session (`cc-f805bf`) wrote the red team RT-PAPER-LAND-MATHEW-MEIER-ETAL-24 (PR #4730).
  - It also wrote the red team of PAPER-NIKOLAUS-SCHOLZE-18 and its fix (PR #5208). That fix added NS18 items for Sp and p-completion, owned at StableHomotopyKTheory H.5/H.6 and EnhancedDerivedSheaves E5. None of the edits below relies on them.
  - It did not write the extraction, its review or the verification.
  - The fix follows only the scope that the independent verifier authorised. Where the verifier narrowed or changed my own red-team fix, I applied its version. That happened in /1, /2, /3, /5, /6 and /8, as each section says.
- **Files changed. Only the deliverables:**
  - `papers/PAPER-LAND-MATHEW-MEIER-ETAL-24.result.json`;
  - `papers/PAPER-LAND-MATHEW-MEIER-ETAL-24.review.json`. The route verdicts get dated corrections, and one verdict is renumbered (see "Route positions");
  - `reviews/REV-PAPER-LAND-MATHEW-MEIER-ETAL-24.md`. A dated correction is appended, and the text above it is unchanged;
  - `papers/PAPER-LAND-MATHEW-MEIER-ETAL-24.md`. The edits cover the header counts, "Routing" (the search sentence, the route table and the source-route paragraph), "Library and planned items", "Source issues" (E2), the summary of the independent review, and a new section "Fixes after the red team";
  - this report.
- **Result.** The extraction has 117 items (0 library, 6 planned, 111 missing), 29 prerequisites, 2 source issues (E2 withdrawn) and 4 routes.
  - Route 1, Part II `GeneralAlgebraicKTheoryPartIITelescopicLocalization`: 73 items (it was 57).
  - Route 2, new `ChromaticHomotopyTheory`: 34 items (it was 24).
  - Route 3, source `RefinedTraceMethods` RT.2/RT.3: 3 items. It was route 4.
  - Route 4, source `KTheoryLowDegrees` Z.1: 1 item. The route is new.
- **Route positions.** The queue matches review verdicts to routes by position (`accepted_routes` in `make_queue.py`).
  - Routes 1 and 2 keep their positions and targets. Their items, briefs and reasons change, and each reason ends with a dated correction.
  - The old route 3, the GeneralAlgebraicKTheory source route, is **deleted**, as finding /1 directs. The old route 4 therefore moves to position 3. Its accept verdict moves with it in `PAPER-LAND-MATHEW-MEIER-ETAL-24.review.json`: the entry is renumbered 3, its reason is kept verbatim and a dated renumbering note is added.
  - The old route 3's accept verdict is removed from `routes`. Its text is quoted in full in the review file's `notes`, in a dated correction that says why it was withdrawn. Without this renumbering, the RefinedTraceMethods route would have inherited a verdict given to a different route.
  - The new source route to KTheoryLowDegrees Z.1 is **appended** as route 4. It has no verdict, and its reason says so. `accepted_routes` now returns routes 1, 2 and 3 (Part II, new, RefinedTraceMethods), which I checked read-only.
- **Items.**
  - New items /102–/117, numbered after /101.
  - /68 and /82 are split.
  - /48 is restated.
  - /99–/101 are renotated.
  - Notes are added to /16, /17, /20, /21, /28 and /32.
- **Edits.** Each JSON file was edited by one Python script, and a third script edited the report.
  - Each substitution asserted that its old text occurred exactly once, and each replaced field asserted its old value.
  - The result script also asserted that the item ids run /1–/117 and that every missing item is taken by exactly one route.
  - Both JSON files keep their formatting: indent 1, non-ASCII characters written literally, final newline. I checked before editing that re-serialising each gives it back unchanged.

## /1 (high, error): the ∞-categorical K-theory has no owner: fixed

I followed the verifier's version, which adds a frontier condition to the red team's fix.

- **Checked myself.** The stage texts are those of `data/atlas.json` and of the atlas that `scripts/build.py`'s `assemble()` builds, run read-only in memory (2,840 stages, 8,258 stage edges).
  - K.4: "Define a Waldhausen category with zero object, cofibrations, weak equivalences".
  - K.6: "One concrete route uses flasque enlargement and suspension".
  - K.7: Morita invariance, products and filtered colimits.
  - None of them mentions stable ∞-categories, `Cat_∞^perf`, localizing invariants, ring spectra or t-structures.
  - The K.3 dévissage node `GeneralAlgebraicKTheory:K.3/devissage-theorem` exists in the K.1 packet. The node `GeneralAlgebraicKTheory:K.6/fundamental-theorem-with-nil-terms` exists in the K.6 packet.
- **Route 3 is deleted.** Its twelve items (/28, /29, /30, /32, /34, /40, /41, /43, /55, /56, /70, /76) are appended to route 1. Their statements are unchanged.
- **Route 1's brief** gets a new paragraph, "First layer: K-theory of small stable infinity-categories and localizing invariants (Blumberg-Gepner-Tabuada sections 5-9, Land-Tamme, Barwick, Hebestreit-Steimle)". It lists the twelve items and the route-1 inputs of /5, and says it compares them with the classical theories on Perf of a discrete ring.
  - **Frontier condition (verifier).** The layer "imports only EnhancedDerivedSheaves E0, E5:abstract and E5:presentability, StableHomotopyKTheory H.3, H.5:spectra and H.5:S-delooping, and GeneralAlgebraicKTheory K.1-K.6; it imports nothing from RefinedTraceMethods, so that RefinedTraceMethods RT.3 and RT.5 can import it without a cycle."
  - The paragraph names CLAUSEN-MATHEW-21/127–/130 and CLAUSEN-MATHEW-MORROW-21/074 as needing this owner, and RT.5 as a consumer. I checked those four items and their routes in their result files.
- **"Import, never re-plan" is replaced.** The new clause imports what the parent does plan:
  - K.2:plus with StableHomotopyKTheory H.3, for the plus construction of a discrete ring;
  - K.3 through its node K.3/devissage-theorem, the abelian half of the theorem of the heart;
  - K.4, for Waldhausen's S-construction and additivity;
  - K.5, for relative K-theory and excision, the classical cousin of /32;
  - K.6, for Bass and Schlichting K-theory and the Nil-terms node.

  It then imports the K₀ case from Z.1 (route 4, see /6). It plans the route-1 inputs of /5 and imports RT.2 and RT.3 only "in the layers after the first". K.7 is no longer imported, because the frontier condition confines the first layer to K.1–K.6.
- **Route 1's prerequisites** gain `KTheoryLowDegrees`, for the Z.1 import.
- **Notes.** /28 names CLAUSEN-MATHEW-21/127–/130 and RT.5. /32 says that CLAUSEN-MATHEW-MORROW-21/074, excision for K^inv at RT.3, is its excision corollary and should have this owner, as the verifier directed ("/32 should coalesce with CMM21/074").
- **Corrected elsewhere.**
  - Route 1's reason ends with a dated correction.
  - The review's route-1 reason and the withdrawn route-3 verdict are corrected in `review.json` (see "Route positions").
  - The report's "Routing" now calls the material "the Part II's first layer", with the old source list kept as what the extraction did.
- **Cycle test.** Read-only, on the assembled atlas.
  - None of the first layer's imports is reachable from RT.2, RT.3 or RT.5: E0, E5:abstract, E5:presentability, H.3, H.5:spectra, H.5:S-delooping, K.1, K.2, K.2:plus, K.3, K.4, K.4:construction, K.5 and K.6. So the edges first layer → RT.3 and first layer → RT.5 close no cycle.
  - Neither `GeneralAlgebraicKTheoryPartIITelescopicLocalization` nor `ChromaticHomotopyTheory` is yet the source of any stage edge. So no import into them closes a cycle.

## /2 (high, error): Kuhn's theorem was stated falsely: fixed

I followed the verifier's version, which restores the hypothesis that X is T(n)-local, missing from the red team's restatement.

- **/48** now reads: "Kuhn [Kuh04]: for a finite group G and a T(n)-local spectrum X with G-action, L_{T(n)}(X^{tG}) = 0, equivalently the T(n)-local norm L_{T(n)}(X_{hG}) → X^{hG} is an equivalence; in blueshift form, if X is L_n^{p,f}-local then X^{tC_p} is L_{n−1}^{p,f}-local, so (L_n^{p,f}S)^{tC_p} is an algebra over L_{n−1}^{p,f}S … The Tate construction itself need not vanish: (KU_p^∧)^{tC_p} has π_0 = Q_p(ζ_p)."
- **Checked myself.** For trivial action, π_{−*}E^{tC_p} = E^*((x))/[p](x). For KU_p^∧, [p](x) = (1+x)^p − 1 = x·Φ_p(1+x), and Φ_p(1+x) is an Eisenstein polynomial in x. So π_0 = (Z_p[[x]]/Φ_p(1+x))[1/x] = Z_p[ζ_p][1/(ζ_p − 1)] = Q_p(ζ_p).
  - This spectrum is rational, hence T(1)-acyclic, as the theorem predicts.
  - Without the hypothesis the statement fails: S^{tC_p} ≃ S_p^∧ by the Segal conjecture, and L_{T(n)}S_p^∧ = L_{T(n)}S ≠ 0 by Lemma 2.2(vi).
  - The paper states only the blueshift form. I read Remark 3.9 in the v5 source.
- **/48's note** records all of this. Its name is now "Kuhn's theorem: T(n)-local vanishing of Tate constructions, and blueshift".
- **Route 2's brief.** "Kuhn's blueshift theorem for the Tate construction." is replaced by the same formulation and the same warning.

## /3 (medium, duplicate): Clausen–Mathew's chromatic items: fixed

I followed the verifier's precisions.

- **Checked myself.**
  - CLAUSEN-MATHEW-21/118 has 'T(0) = HQ' and 'L_n^f : Sp → Sp_(p) is p-localization followed by finite localization'.
  - /118, /150, /024 and /142 are on its route 2 to MotivicEtaleKTheoryPartIISelmerAndEtaleKTheory.
  - LMMT's proof of Proposition 2.11 says "in Bousfield's convention T(0) is HQ".
- **Route 2's brief.**
  - The opening sentence now names PAPER-CLAUSEN-MATHEW-21 and its rejected route.
  - A new paragraph, "Clausen-Mathew is a second source and consumer", says that /118 is chromatic basics owned here. It says that /150, /024 and /142 are consumers that stay with their K-theory or motivic owners, as the verifier directed (precision (b)).
  - A new paragraph, "One convention, fixed here for every consumer", fixes T(0) = S[1/p] and L_n^{p,f} = L_{T(0)⊕⋯⊕T(n)}. It says that L_n^f, localization at the p-local HQ ⊕ T(1) ⊕ ⋯ ⊕ T(n), is Clausen–Mathew's L_n^f (precision (a)). HQ is written as HQ, and item /24 is the comparison lemma.
  - L_1 = L_{KU} is added to "Construct here".
- **Notes on /16 and /20** record Clausen–Mathew's convention. The Bousfield classes ⟨S[1/p]⟩ and ⟨HQ⟩ differ, and agree on p-local spectra, since X ⊗ S[1/p] ≃ X ⊗ HQ for p-local X.
- **Corrected.** Route 2's reason and the review's route-2 reason each end with a dated correction. The report's search sentence carries an inline dated correction, and so does the report's summary of the review.

## /4 (medium, duplicate): ko against ku: fixed

- **/82** is now ko, KO and β ∈ π_8ko. It stays missing on route 2, and its note quotes RT.4:topological.
- **New item /102** (ku, KU, β ∈ π_2ku, ku[1/β] ≃ KU) is `planned: RefinedTraceMethods:RT.4:topological`. I read that stage in the atlas: "define ku as the connective cover of KU. Identify π_*ku=ℤ[β] and π_*KU=ℤ[β,β⁻¹] with |β|=2".
- **Route 2's brief** replaces "connective and periodic real and complex topological K-theory with their Bott elements" by "connective and periodic real topological K-theory ko and KO with the Bott element beta in pi_8 ko (the complex ku and KU are imported)". The RT.4:topological import now names ku, KU and the Bott class.
- **Not applied:** the verifier's optional pointer to Tau Ceti SpinRepresentations Layer 7. It is optional, and I did not verify that stage.

## /5 (medium, missing): cited theorems without items: fixed

I followed the verifier's precisions. I located each citation in the v5 LaTeX source and PDF. They are my own downloads, and both SHA-256 hashes match the extraction's.

| Part | Item | Route | Locator (v5) |
|---|---|---|---|
| (a) Waldhausen and [LT19, Lemma 2.4] | /104 | 1 (with /34) | Prop. 3.1 p. 11; Cor. 4.4 p. 18; Cor. 4.7, Rem. 4.10 p. 19; Cor. 4.16 p. 21; Cor. 4.23 p. 23 |
| (b) Bousfield–Kuhn functor [Kuh08, Thm 1.1] | /105 | 2 | Prop. 2.9, p. 9 |
| (c) Bousfield [Bou01, Cor. 4.8], [BHM21, Thm 3.1, Lemma 3.3] | /106 | 2 | Prop. 2.11(i), pp. 9–10 |
| (c) Serre spectral sequence in T(i)-homology | /107 | 2, importing AlgebraicTopology Stage 5 | Prop. 2.11(ii), p. 10 |
| (d) nilpotence theorem [HS98, Thm 3] | /108 | 2 | Lemma 2.3, p. 7 |
| (d) thick subcategory theorem [HS98, Thm 7] | /109 | 2 | Lemmas 2.2(vii), 2.6, pp. 7–8 |
| (d) [HS98, Thm 11, Cor. 3.8] | /110 | 2 | Lemmas 2.2(vii), 2.3, p. 7 |
| (e) Mahowald–Sadofsky | notes on /17 and /21 | — | Lemma 2.1 p. 7, Prop. 3.3 p. 8 |
| (f) [BGT13, Thm 9.53] | /111 | 1 | Cor. 4.7, p. 19 |
| (g) [Wei81] and its Cor. 5.4 | /112 | 1, with K.6's Nil-terms node named | Cor. 4.25 p. 23; Ex. 4.8 p. 19 |
| (h) [Rav84, Thm 2.1] | /113 | 2 | Cor. 4.21, p. 22 |
| (h) L_{n−1}-local ⇒ T(n)-acyclic; L_{K(n)} = L_{T(n)} on L_n-local spectra | /114 | 2 | Cor. 4.21, p. 22 |
| (h) [MM15, Thm 7.6], L_{K(2)}TMF(3) ≃ E_2 | /115 | 2 | Cor. 4.21(iv), p. 22 |
| (h) [CMNN20, Thm 5.6, Cor. B.4] | /116 | 1 | Cor. 4.21(iv), p. 22 |
| (i) existence of E_∞ E_n and 𝒪^top | route 2's brief | — | Cor. 4.21 and §4.3 |
| (j) James splitting [Ada72, Ch. 10, Thm 5] | /117 | 2 | Cor. 4.14, p. 20 |

- **Checked myself.**
  - (h): I read CMNN20 in arXiv:1606.03328v2 (SHA-256 `117890c2…a351a`). Theorem 5.6 needs the rationalized transfer K_0(B) ⊗ Q → K_0(A) ⊗ Q to hit the unit, and gives L_n^fK(A) ≃ (L_n^fK(B))^{hG}. Corollary B.4 checks that condition for E(𝔾,k)^{hH} → E(𝔾,k). /116 states both.
  - (h), coalescing: as the verifier warned, CLAUSEN-MATHEW-21/142 (finite étale descent for L_n^fK_{≥0} of commutative rings) is a different statement. So /116 is not coalesced with it, and its note says so.
  - (h), /114: the argument is the paper's in-line proof (p. 22). The first clause needs L_{n−1} smashing and K(m) ⊗ T(n) = 0 for m ≠ n (Lemma 2.2(iii)).
  - (j): no atlas stage mentions a James construction. The only "James" in the atlas is G. James's Specht modules in Tau Ceti SchurWeyl.
  - (c): AlgebraicTopology Stage 5 plans the ordinary-homology spectral sequence over a path-connected finite CW base. /107, the E-homology form over an arbitrary base, is planned on route 2 and its note quotes the stage.
- **(i).** "Construct here" now names the Goerss–Hopkins–Miller theorem, which makes E_n an E_∞-ring functorial in (k, 𝔾) and so gives the stabilizer action. It also names the Goerss–Hopkins–Miller–Lurie construction of 𝒪^top, "as in Douglas-Francis-Henriques-Hill and Behrens".
- **Route 2's brief** lists all the route-2 inputs in its final-theorems paragraph. Route 1's brief lists /104 and /111 in the first layer, and /112 and /116 as further inputs planned there.
- **Prerequisites.** Seven works are added, with citations taken from the paper's `.bbl` and DOIs checked on Crossref:
  - CMNN20: JEMS 22 (2020), 1149–1200, doi:10.4171/jems/942;
  - Ravenel 1984: doi:10.2307/2374308;
  - Hebestreit–Steimle: arXiv:2103.13911;
  - Patchkoria–Pstrągowski: arXiv:2110.03669;
  - Hesselholt–Nikolaus: Handbook of Homotopy Theory, doi:10.1201/9781351251624-15;
  - Weibel 1981: doi:10.1007/BFb0089534;
  - Mahowald–Ravenel–Shick 2001: doi:10.1090/conm/271/04358.

  The listed "Clausen–Mathew–Naumann–Noel" entry is CMNN23, and it is kept.

## /6 (medium, error): /68 was not planned in degree zero: fixed

I followed the verifier's version: a source route to KTheoryLowDegrees Z.1.

- **/68** is now "Negative K-groups of quotients by nilpotent ideals": K_n(R) → K_n(R/I) is an isomorphism for n ≤ 0.
  - The case n = 0 is /103. The negative degrees follow by induction with the fundamental theorem, since I[t], I[t^{−1}] and I[t,t^{−1}] are nilpotent.
  - It is planned at GeneralAlgebraicKTheory:K.6 only. Its note names the nodes K.6/negative-k-groups and K.6/fundamental-theorem-with-nil-terms, and says why K.3 and S.5 are no longer cited.
- **New item /103, the nilpotent invariance of K₀,** is missing and routed to the **new route 4**, a source route to `KTheoryLowDegrees:Z.1`.
  - The statement: P ↦ P/IP is a bijection on isomorphism classes of finitely generated projectives, so K₀(R) ≅ K₀(R/I). Equivalently, idempotent matrices lift, because M_n(I) is nilpotent.
  - Its note and the route's reason cite `mathlib:exists_isIdempotentElem_eq_of_ker_isNilpotent` (Mathlib/RingTheory/Idempotents.lean:249), `mathlib:OrthogonalIdempotents.lift_of_isNilpotent_ker` (:274) and `mathlib:CompleteOrthogonalIdempotents.lift_of_isNilpotent_ker` (:325). All three were read at 082e2d3 and are in the baseline `declarations.tsv`. They are stated for `[Ring R]`, so they apply to matrix rings.
- **Checked myself.** Z.1 plans idempotent matrices and ring K₀. The KTheoryLowDegrees--U.1 packet (scope includes Z.1) is partial, and BP-KTheoryLowDegrees--U.1 is pending in `queue.json`.
- **A claim I did not repeat.** The verifier gives the split as necessary "since Z.1 is upstream of K.6". In the assembled atlas I found no path from Z.1 to K.6. Z.1 feeds K.2:plus, and K.6 descends from K.5, K.3 and K.4. So route 4's reason says only that Z.1 requires nothing from GeneralAlgebraicKTheory, so that K.6 can import it without a cycle.
- **Corrected.** The report's "Library and planned items" bullet, the report's summary of the review, the review's `notes` and the review report's correction.

## /7 (medium, error): E2 describes the source, not the print: fixed (E2 withdrawn)

- **E2's review block** now reads verdict "rejected", with the verifier's reason ("the \mathscr{Cyc}/\mathscr{C} difference exists only in the LaTeX source; the typeset v5 prints 𝒪_𝒞(G) in Proposition 4.33 and throughout Corollary 4.34").
  - The block also records the euscript mechanism and the verifier's 400 dpi check. It quotes REV-PAPER-LAND-MATHEW-MEIER-ETAL-24's earlier "confirmed" reason verbatim.
  - Its `by` is REV-RT-PAPER-LAND-MATHEW-MEIER-ETAL-24.
  - E2's `printed`, `correction` and `reason` fields are left as the extraction's record. The finding asks only for the verdict to change.
- **/99** writes 𝒪_𝒞(G), with a note giving the reason.
  - I also changed /100 and /101 (Proposition 4.33 and Corollary 4.34), which used the source-only 𝒪_𝒞yc(G) for the object /99 defines. Otherwise the file would print two symbols for the one object /99 defines.
  - This goes one step beyond the literal "In item /99" of the fix. It follows from the finding's claim that the printed paper uses one notation throughout.
- **Checked myself.** In the v5 source (my download, e-print SHA-256 `e7ab1af6…5d7d`), the preamble loads `\usepackage[mathscr]{euscript}`, and `\mathscr{Cyc}` occurs in Proposition 4.33 and in Corollary 4.34's display. I did not render the page images; the typeset claim rests on the verifier's 400 dpi check.
- **Corrected.** The report's E2 paragraph, the report's summary of the review, the review file's `notes` and the review report's appended correction.
- **Not in a deliverable:** `research/errata/REGISTER.md`. See "For the maintainer".

## /8 (medium, missing): Tau Ceti AlgebraicTopology and ModularCurves: fixed

I followed the verifier's two corrections: the ordinary Serre spectral sequence is Stage 5, and Postnikov and Eilenberg–MacLane objects are not AlgebraicTopology's.

- **Route 2's prerequisites** gain `tauceti:TauCetiRoadmap/AlgebraicTopology` and `tauceti:TauCetiRoadmap/ModularCurves`.
- **The import paragraph** imports three things:
  - from AlgebraicTopology: finite CW complexes and cofibrations (Stage 4), the ordinary Serre spectral sequence over a finite CW base (Stage 5), and Hurewicz and Whitehead (Stage 8);
  - Eilenberg–MacLane spectra from StableHomotopyKTheory H.5:spectra;
  - from ModularCurves 7E (PD-5): the supersingular one-dimensional formal group of height 2 and Lazard's classification, citing `tauceti:WeierstrassCurve.formalAdd`.

  It adds: "Plan here only the generalized-homology Serre spectral sequence over arbitrary bases and formal groups of arbitrary height." "Construct here" gains "formal groups of arbitrary height and their heights" and "Postnikov towers of spaces".
- **Checked myself.**
  - The stage texts are in the atlas. Stage 4 has CW pairs and cofibrations. Stage 5: "Construct the first-quadrant homology Serre spectral sequence … path-connected finite CW base". Stage 8: Hurewicz and Whitehead. 7E PD-5: "the one-dimensional commutative formal group of height `2` over `k`, unique up to isomorphism (Lazard's classification)".
  - `WeierstrassCurve.formalAdd` is at TauCeti/AlgebraicGeometry/EllipticCurve/FormalGroup/Add/Series.lean:84, and `formalAdd_assoc` at …/Add/Assoc.lean:657, at f790474. Both are in `declarations.tsv`.
- **Cycle test.** The new edges run from Tau Ceti stages into the new roadmap, which is the source of no stage edge. So they close no cycle.

## /9 (low, duplicate): /49 and NS18's Theorems I.3.3 and I.3.6: not applied

This is a low finding, recorded only. The verifier's fix keeps /49's statement. It adds a note: Theorems I.3.3 and I.3.6 are PAPER-NIKOLAUS-SCHOLZE-18 /24 and /26 (at E5:abstract/E5:presentability), and Lemma I.3.8 is its /28 (at RT.2), and the RT design imports them and plans only this application.

## /10 (low, other): two citation slips (E3, E4): not applied

This is a low finding, recorded only. The verifier's fix adds two source issues:
- E3: p. 23 cites "Corollary 4.30" where Corollary 4.23 is meant;
- E4: p. 15 cites "[CMNN23, Lemma 4.5]", which is Theorem 4.6 of arXiv:2011.08233v2. E4 is scoped to v2, and says the citation matched v1.

## /11 (low, error): /31, /47, /72, /99: partly overtaken, not applied

This is a low finding, recorded only.
- (a) /31's Waldhausen citation should be [Wal78], not the Aarhus paper [Wal84]. The new item /104 cites [Wal78] correctly; /31 itself is unchanged.
- (b) /47's CMNN strengthening holds for an arbitrary E_∞-ring.
- (c) /72's n is the height, and m is arbitrary.
- (d) is done under /7, since /99 now writes 𝒪_𝒞(G).

## /12 (low, library-claim): Bousfield localization and t-structures in Mathlib: not applied

This is a low finding, recorded only. The verifier's fix replaces the report's "the only relevant declaration is SSet.Quasicategory … no Bousfield localization" and the brief's "nothing else of this". The replacement cites:
- `ObjectProperty.isLocal` (the class of local morphisms) and `MorphismProperty.isLocal` (the local objects);
- `isLocalization_isLocal`, `isLocal_trW` and `IsVerdierRightLocalizing`;
- the triangulated localization instance;
- `TStructure.bounded` and `heart`.

Route 2's import paragraph was edited for /4 and /8, but its Mathlib sentence was left as it was.

## /13 (low, error): /1's note on the smash product: not applied

This is a low finding, recorded only. The verifier's fix adds `EnhancedDerivedSheaves:E5:spectra-comparison` to /1's planned list, without H.5:S-delooping. It also replaces "Nothing in the atlas fixes the smash product of a spectrum with a pointed space" by the RS-33 account: the generic smash product is H.5:spectra's.

## /14 (low, other): venue and `sourceVersions`: not applied

This is a low finding, recorded only. The verifier's fix:
- sets the venue to "Journal of the American Mathematical Society 37 (2024), no. 4, 1011–1040";
- adds only a preprint `sourceVersions` entry: arXiv:2001.10425v5, read 2026-09-23, SHA-256 `9eabee34…40baa2f`, with a note that the published text was not served. It adds no "published" entry, which `collation.provenance` would misread.

I re-downloaded both v5 files on 30 September 2026, and both hashes match.

## For the maintainer

These changes lie outside this job's deliverables.

- **`research/errata/REGISTER.md`: remove E2 from "New mistakes, confirmed".** The entry beginning "**Misprint** at Corollary 4.34, first sentence (page 26 of the arXiv v5 PDF)" (line 9080 at 8ed2baaa) should go. Let `scripts/errata.py` regenerate the register; this job did not run it.
  - `errata.valid_reviews` counts a verdict only from a finished review job that reviews a writer of the file. The rejection's `by`, REV-RT-PAPER-LAND-MATHEW-MEIER-ETAL-24, reviews the red team, not the extraction.
  - So `errata.collect()`, run read-only on the edited file, lists E2 as "awaiting review" and E1 as confirmed.
  - E2 drops out of "New mistakes, confirmed" at once. It moves to "rejected" when the review of this fix records the verdict under its own job id.
- **PAPER-CLAUSEN-MATHEW-21 (pending revision).**
  - Its /118 should import from ChromaticHomotopyTheory.
  - Its /127–/130 should import from the first layer of the GeneralAlgebraicKTheory Part II. /127 is now marked planned at K.6, RT.2 and RT.3, which do not plan K-theory of stable ∞-categories.
  - Its /150, /024 and /142 are consumers of the chromatic roadmap. /142 is related to, but not the same as, this extraction's /116.
- **PAPER-CLAUSEN-MATHEW-MORROW-21/074 and RefinedTraceMethods.** CMM21/074 (Land–Tamme excision at RT.3) is the excision corollary of /32. With one owner, RT.3's accepted Land–Tamme item imports the Part II's first layer, and so does RT.5 ("localizing motives … from enhanced small stable categories"). Cycle-tested read-only: nothing that layer imports is reachable from RT.2, RT.3 or RT.5.
- **KTheoryLowDegrees.** Once a review accepts route 4, BP-KTheoryLowDegrees--U.1 (pending) receives this paper as a source for Z.1. Its packet currently lists nilpotent-ideal invariance (Weibel II.2.2) as "not a target of Z.1", and that should change.
- **Design jobs.** DESIGN-GeneralAlgebraicKTheoryPartII and DESIGN-ChromaticHomotopyTheory are pending and were generated from the old briefs. Regenerate them after this merges.
- **Review of this fix.** It should:
  - give verdicts for the changed routes 1 and 2 and the new route 4;
  - record E2's rejection under its own job id, so that `errata.py` counts it;
  - check the sixteen new items.
- **`research/blueprint/reserved-ids.json`** is not touched: the new ids are paper items, not blueprint nodes.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-LAND-MATHEW-MEIER-ETAL-24.result.json`: ok.
- `python3 research/blueprint/intake.py check-files` on the five deliverables: 0 problems.
- **Assembled atlas.** `scripts/build.py`'s `assemble()` was run read-only in memory (2,840 stages, 8,258 stage edges). Every stage the extraction names now exists: RT.4:topological, KTheoryLowDegrees:Z.1, GeneralAlgebraicKTheory:K.6, AlgebraicTopology Stages 4, 5 and 8, ModularCurves 7E, and the first layer's imports.
- **`make_queue.accepted_routes`**, run read-only, returns routes 1–3: the Part II, ChromaticHomotopyTheory and the RefinedTraceMethods source route.
- **Sources.** Re-downloaded on 30 September 2026:
  - LMMT arXiv:2001.10425v5, PDF `9eabee34…40baa2f` and e-print `e7ab1af6…5d7d`, both matching the extraction;
  - CMNN20, arXiv:1606.03328v2 (`117890c2…a351a`).
- **Citations.**
  - Every Mathlib and Tau Ceti declaration was read at the pinned commits and found in the baseline `declarations.tsv`.
  - Every stage and node id was checked in the atlas or its packet.
  - Every item of another extraction was checked in its result file: CLAUSEN-MATHEW-21 /024, /118, /127–/130, /142, /150 and CLAUSEN-MATHEW-MORROW-21/074.
- No Lean was run.
