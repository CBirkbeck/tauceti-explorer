# RT-PAPER-BREUIL-HELLMANN-SCHRAEN-19: red team of the extraction of Breuil–Hellmann–Schraen, *A local model for the trianguline variety and applications*

Red team: Claude Code, session `cc-f805bf`, 30 September 2026 (issue #4304).

**Target.** `PAPER-BREUIL-HELLMANN-SCHRAEN-19` extracts C. Breuil, E. Hellmann and B. Schraen, *A local model for the trianguline variety and applications*, [Publ. Math. IHÉS 130 (2019), 299–412](https://doi.org/10.1007/s10240-019-00111-y). The extraction has:

- 135 items: 12 planned and 123 missing;
- 7 routes:
  - two new roadmaps, SpringerResolutionAndCharacteristicCycles and TriangulineVarietyAndItsLocalModel;
  - one Part II of CompletedCohomologyAndLocalGlobalCompatibility;
  - four source routes;
- 11 source issues.

**Who did what.**
- Claude Code `cc-fb70e5` wrote the extraction (issue #1456, PR #2022), according to the extraction's provenance line and the errata register.
- Claude Code `cc-d67081` wrote `REV-PAPER-BREUIL-HELLMANN-SCHRAEN-19` (issue #1457, PR #2464). It accepted all routes, confirmed all 11 source issues and changed nothing. It names the extractor as `cc-442dc5`, which is wrong (finding 14).
- I did neither. The string `cc-f805bf` occurs in none of the four target files.

**Disclosure.**
- This session reviewed PAPER-FARGUES-FONTAINE-18 (PR #4683). That paper's route 5 sends B_dR-representations and B-pairs to the PadicHodgeTheory Part II and "export[s] B-pairs … to TriangulineVarietyAndItsLocalModel, which currently expects them from P7". **Finding 3 relies on that route.**
- This session also wrote PAPER-LUST-STEVENS-20. No finding touches it.

**Result: 20 findings, 4 high, 7 medium and 9 low.** The machine-readable file is [RT-PAPER-BREUIL-HELLMANN-SCHRAEN-19.result.json](RT-PAPER-BREUIL-HELLMANN-SCHRAEN-19.result.json).

- **Where the work is sound.**
  - Nearly every numbered statement has an item.
  - Most item statements are faithful.
  - E2–E7 and E9–E11 are real. E6 was confirmed on a page image.
  - There are no cycles.
  - The review changed nothing, so it introduced no error.
- **Where it breaks.**
  - The 12 `planned` statuses. The review checked only that the named layers exist, not what they plan. Five of the twelve point at layers that do not plan the item.
  - §4.3. It contains a dimension error that nobody recorded (finding 4).

## Source

| Text | Where | SHA-256 |
| --- | --- | --- |
| Published version (Numdam), 114 pp., printed page = PDF page + 298 | [numdam.org PDF](https://www.numdam.org/item/10.1007/s10240-019-00111-y.pdf) | `34ffd697…6993967a` (matches) |
| arXiv v1 (7 February 2017), the only arXiv version | [arxiv.org/pdf/1702.02192v1](https://arxiv.org/pdf/1702.02192v1) | `4c967337…dbcf961` (matches) |
| Authors' copy (1 July 2019), used for finding 4 only | [Schraen's page, BHS3.pdf](https://math.univ-lyon1.fr/homes-www/schraen/BHS3.pdf) | `7d81e52a…4f3bb5f0` |

- All three were fetched on 30 September 2026.
- **Errata.**
  - Crossref lists no update for the DOI.
  - Schraen's page lists an erratum only for a different paper, on GL₃.
  - A web search found none.
- **How I read it.**
  - Three parallel readers covered the whole published text: §§1–2, §3, and §§4–5 with the references.
  - I re-checked every finding myself.
  - I read four pages as rendered images: pp. 305, 323, 381 and 405.
- Page numbers below are printed pages.

## How statuses and route order were checked

- **Planned layers.** I read every planned layer's atlas text, and its accepted packet where one exists, and asked whether it plans the item in the paper's generality.
- **Ancestor sets.** I computed the ancestors of every routed stage from three sources:
  - `data/atlas.json`: stage requirements, parent stages and stageEdges;
  - every restructure, packet and link-file link (4,642 extra links);
  - unaccepted links are included, so a "not upstream" claim is conservative.
- **No cycles.**
  - None of the routed stages has CompletedCohomologyAndLocalGlobalCompatibility or either new roadmap upstream.
  - So the planned imports are acyclic: TriangulineVariety → {P7, PG, RD.0, R08, SpringerResolution}, and the Part II → {parent, TriangulineVariety}.
- **Designs.** The three proposed roadmaps have no design yet: their DESIGN jobs are pending in the queue, so there was nothing accepted to compare with.

## High

### 1. Category O and Kazhdan–Lusztig theory are "planned" where Tau Ceti explicitly does not plan them

- **The item.** Item 2.4-category-O is planned at LieHighestWeight Layer 3. It states three things:
  - category O and O(0);
  - Kazhdan–Lusztig polynomials;
  - the multiplicity formula [M(ww₀·0) : L(w′w₀·0)] = P_{w₀w,w₀w′}(1), i.e. the Kazhdan–Lusztig conjecture as proved by Beilinson–Bernstein and Brylinski–Kashiwara (p. 320, via Humphreys §8.4).
- **The brief.** Route 1's brief says to "Import category O, Verma modules and Kazhdan–Lusztig polynomials from the Tau Ceti representation-theory roadmaps".
- **What Tau Ceti actually plans.** LieHighestWeight plans Verma modules and L(λ) only.
  - Layer 6: "Do **not** invoke a full BGG resolution or category `O`; those are a separate development".
  - Layer 7: the full linkage principle "is strictly stronger and is a separate development".
- **The rest of the atlas.**
  - No atlas stage mentions category O or D-modules.
  - "Kazhdan" appears only in ET.6, on Kazhdan–Varshavsky transfer.
- **Also missing: D-modules.** The D-module foundations of §2.4 (good filtrations, characteristic cycles, regular holonomic equivariant D-modules, Beilinson–Bernstein) have no items either.
- **Why it matters.** The multiplicity theorem drives Theorem 2.4.7, Corollary 4.3.2, Theorem 4.3.8 and the cycle identities of §5.3, yet it has no owner.
- **Same problem elsewhere.** PAPER-DING-25's route 1 brief makes the same assumption.
- **Fix.**
  - Verma modules M(μ) and L(μ) become library items (TauCeti.VermaModule, TauCeti.irreducibleQuotient).
  - Category O and Kazhdan–Lusztig theory go to a Part II of LieHighestWeight.
  - The D-module foundations go to route 1.
  - Correct route 1's brief to match.

### 2. The trianguline variety itself has no owner

- **The routing.** Item 3.7-xtri (X_tri(r̄) as the Zariski closure (3.29), reduced and equidimensional of dimension n² + [K:Q_p]n(n+1)/2) is "planned" at LocalGaloisDeformationRings R08.3.
- **What R08.3 plans.** Kisin's potentially semistable deformation rings, and its packet nodes are all of that kind.
- **Contradictions.**
  - Route 2's own reason says X_tri is planned nowhere.
  - Route 2's brief never asks for X_tri to be constructed.
- **Order problem.** The Kedlaya–Pottharst–Xiao global triangulation that X_tri needs lives at PG.7, which is not upstream of R08.3.
- **Item 3.6-galois-groupoids.** Only its X_r part is R08.1's. The trianguline groupoids X_{V,M•} and X_{r,M•} are not planned there.
- **Same problem elsewhere.** PAPER-DING-25's item 4.1-xtri has the same error.
- **Fix.** Make item 3.7-xtri missing on route 2, and add "construct X_tri(r̄)" to route 2's brief.

### 3. Fontaine's almost de Rham theory and Berger's functors are "planned" at P7, which plans neither

- **The routing.** Items 3.1-bdr-reps, 3.1.1-equivalence and 3.3.5-WdR are planned at P7.
- **What P7 plans.**
  - Its text covers Robba rings, the étale (φ,Γ) import and Wach comparisons.
  - Its 60-node packet covers Robba rings, ι_n, D_Sen, D_dif and D_dR.
  - Neither has B_dR-representations, almost de Rham representations, B_pdR, D_pdR, the G_a-equivalence, or W⁺_dR of a general (φ,Γ_K)-module with coefficients.
- **Double routing.** Route 2's brief constructs the same objects.
- **The accepted Fargues–Fontaine routing** (route 5, reviewed by this session) owns B_dR-representations and B-pairs in the PadicHodgeTheory Part II. B-pairs and Berger's equivalence are used in Proposition 3.5.1 but have no item.
- **Fix.** Give all of Fontaine's and Berger's theory one owner. The preferred owner is the PadicHodgeTheory Part II, which make_queue merges with Fargues–Fontaine route 5. Route 2 then imports it.

### 4. The codimension of the character-fibre cycles is wrong when [K:Q_p] > 1

- **What is printed.**
  - Theorem 1.9 (p. 305, page image), Conjecture 4.3.4 (p. 381, page image), (4.12), Proposition 4.3.7 and Theorem 4.3.8 all use codimension [K:Q_p]·n(n+3)/2.
  - Remark 4.3.5 gives fibre dimension n² + [K:Q_p]n(n−3)/2.
- **The paper's own dimensions.**
  - Spec Ô_{𝔛_r̄,r} has dimension n² + dn², where d = [K:Q_p] (p. 377).
  - The weight fibre has codimension d·n(n+1)/2 (p. 379).
  - (4.11) takes "the fibers over δ ∈ Spec Ô_{T^n_{L,wt(δ)},δ}" (p. 382).
  - T^n_{L,wt(δ)} has dimension n: the character space of K^× has dimension d+1, and Lemma 3.5.5 gives relative dimension n over t.
- **The correct values.** Codimension d·n(n+1)/2 + n and fibre dimension n² − n + d·n(n−1)/2.
- **A check.** Take n = 1 and d = 2.
  - The ring has dimension 3 and the fibre is a point, so the codimension is 3.
  - The paper gives codimension 4 and fibre dimension −1.
- **When the formulas agree.** They agree for K = Q_p, which is why the GL₂(Q_p) example is consistent.
- **Scope.** §5 uses only weight fibres and is unaffected.
- **Where else the error appears.** The same numbers are in arXiv v1 and in the authors' copy.
- **What the extraction does with it.** Five items copy the error, and so do the extraction's conventions and gaps.
- **Fix.** Record it as E12 and correct the five items, the conventions, the gap and route 2's brief.

## Medium

| # | Where | What | Fix |
| --- | --- | --- | --- |
| 5 | 5.1-completed-cohomology, route 6, route 3's brief | Planned at R31.2 (GL₂/Q classical specialisations). The owner of completed cohomology for general groups, including unitary towers, Hecke localisation and admissibility, is CompletedCohomologyPartII CC.2/CC.5/CC.8. Route 3's brief says to construct it again. | Plan at CC.2/CC.5/CC.8; the Part II imports it. |
| 6 | 5.1-patched | Planned at R31.5, which plans GL₂/Q patching only: no CEGGPS Π_∞ for GL_n, no patched eigenvariety, and no trianguline or Jacquet input upstream. PAPER-BOCKLE-IYENGAR-PASKUNAS-23 records CEGGPS as missing. | Mark missing and move to route 3, split in two. |
| 7 | 5.1-eigenvariety, route 3 reason | "Nothing plans an eigenvariety for a definite unitary group". AutomorphicGaloisRepresentationsPartII AG2.3 does, on PadicFamilies L2a, and PAPER-DING-25 cites it. | Import AG2.3, L2a and L0a; plan only Emerton's Jacquet-module construction and its comparison. |
| 8 | §5 items, route 3's brief | The Orlik–Strauch functor and theorem, Emerton's J_B and the adjunction have no items. Route 3's brief says "Develop the Orlik–Strauch functor", duplicating LocallyAnalyticRepresentationsOfLocalGroups (PAPER-DING-25 route 1). | Add items and route them there, with Remark 5.1.2's products-of-groups obligation. |
| 9 | 2.1-setting | Planned at LieGroups Layer 8, which works with a complex G_ℂ and G_ℂ/B as a complex manifold. BHS need split G over a field, G/B as a scheme, and Schubert cells U_w and their closures. | Cite ReductiveGroups Layer 7 and the library; make G/B and U_w geometry missing on route 1. |
| 10 | 2.3.2-miracle-flatness | Lemma 2.3.2 is false as printed. Counterexample: Spec k ⊔ A¹ → A¹. Every use in the paper is fine. | Add the local-dimension hypothesis; record a source issue. |
| 11 | E8, 3.2.2 | E8's correction, graded pieces "free over A⊗K", is itself wrong. L⊗K ≅ ∏_τ L, and τ-dependent jumps give non-free graded pieces; the paper (p. 340) uses "free A-modules". | Require finite projective A⊗K-modules (A-free τ-components). |

## Low

| # | What |
| --- | --- |
| 12 | Several objects are in the pinned libraries, although the extraction and the review say nothing is: B⁺_dR and B_dR (Mathlib BDeRham.lean:77, :90); the Bruhat order (Tau Ceti Coxeter/Bruhat.lean:240); w₀ (LongestElement.lean:194); the dot action (DotAction.lean:108); Verma modules and L(λ) (Verma.lean:196, :416). |
| 13 | E1 is Remark 1.1, the authors' own printed correction of [19] and [20], recorded as a "new misprint". The preprint arXiv v1 lacks ᵖ√1 ∉ F in (ii) and in Theorems 1.1, 1.2, 5.1.3, 5.3.3, 5.4.1 and 5.4.2, and nothing records that. E2 and E3 are misprints, not errors. |
| 14 | Five item notes cite the wrong E-number. The report's "seven (E5–E11)" is followed by a list of twelve slips. The review names the wrong extractor session and gives an inconsistent co-proposer count. |
| 15 | Theorem 1.7 (geometry of X_w) is routed to the Part II instead of route 1. The Bruhat-interval Lemma 5.2.7 is routed to the Part II instead of the Coxeter owner. Route 2's reason still names RD.0–RD.1 for (φ,Γ). |
| 16 | PG.7 does not explicitly plan (φ,Γ_K)-modules over R_{A,K}[1/t], R(δ), the classification of submodules t^kR(δ), or the Ext comparisons (3.11)–(3.13). |
| 17 | Route 3's parent is the GL₂/Q roadmap, whose summary confines it to modular and Shimura curves. make_queue merges it with Pan's and Böckle–Iyengar–Paškūnas's Part IIs. Refer to the maintainer with the title point. |
| 18 | Two proof gaps, both repairable. Proposition 2.3.3 goes from Cohen–Macaulayness along the special fibre to the generic fibre of a non-proper X_A. Proposition 3.7.2 claims injectivity of Ô_{U,x} → Ô_{Ũ,x̃} for a single x̃. |
| 19 | Four slips: p. 405, "lg(w′) ≥ lg(w_i) + 2" (should be "− 2"; page image); p. 303, "Q_p-vector space" (should be K); p. 338, "B⁺_dR-representations" (should be G_a); p. 408's second admission about [20, Cor. 5.18] is missing from E1. |
| 20 | Six unfaithful items: 3.7.1 drops x ∈ X_tri; 3.33 misdescribes the rows; 3.6-galois-groupoids overstates trivial automorphisms; 5.4.1 omits "U^p small enough"; the locators of 2.1-setting and 3.3-characters are wrong. |

## What the review got wrong

- It changed nothing, so it introduced no error into the extraction.
- **Library.** It asserted that nothing in the paper is in the pinned libraries (finding 12).
- **Planned statuses.** It checked planned statuses only by "naming atlas layers that exist" (findings 1–3, 5, 6, 9).
- **Source issues.** It confirmed E8's wrong correction and E1's "known: new" (findings 11 and 13).
- **Provenance.** It misattributed the extraction (finding 14).
- **Title.** It rightly referred the Part II title to the maintainer, but missed the parent mismatch behind it (finding 17).

## Not filed

- **p. 324, "T*(G/B×G/B) ≃ g̃ × g̃".** Ñ × Ñ is meant. Not filed because it turns on a glyph I did not render.
- **[16, Conj. 6.5] against [16, Conj. 6.6].** [16] was not read.
- **Non-negativity of a_{w,w′}.** True, since characteristic cycles are effective; only the proof is terse.
- **Remark 2.4.5, "true for n ≤ 7".** Not checked against [47].
