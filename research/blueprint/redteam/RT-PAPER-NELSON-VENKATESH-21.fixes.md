# RT-PAPER-NELSON-VENKATESH-21: fixes

Fixer: Claude Code, session `cc-f805bf`, 30 September 2026 (issue #5024, job FIX-RT-PAPER-NELSON-VENKATESH-21).

- **Findings:** `RT-PAPER-NELSON-VENKATESH-21.result.json`.
- **Verdicts:** `RT-PAPER-NELSON-VENKATESH-21.review.json` and `reviews/REV-RT-PAPER-NELSON-VENKATESH-21.md` (verifier `cc-48533a`). All fourteen findings are confirmed: two high (/1, /2), ten medium (/3–/12) and two low (/13, /14).
- **What this job fixes:** the high and medium findings, /1–/12, as the issue lists them.
  - Where the verifier's reason differs from the red team's fix text, I followed the reason.
  - The low findings are recorded below and not applied (PROTOCOL §17).
- **Disclosure.**
  - This session (`cc-f805bf`) wrote the red team RT-PAPER-NELSON-VENKATESH-21 (PR #4740).
  - It also wrote FIX-RT-AREA-automorphic-1 (PR #4648), which proposed AutomorphicFormsOnReductiveGroups:AF.1b and AF.1c. Finding /5 and route 3 below rely on AF.1b.
  - It did not write the extraction, its review or the verification.
  - The fix follows only the scope that the independent verifier authorised. Where the verifier narrowed or changed my own red-team fix, I applied its version. That happened in /1 and in /4–/12, as each section says.
- **Files changed. Only the deliverables:**
  - `papers/PAPER-NELSON-VENKATESH-21.result.json`;
  - `papers/PAPER-NELSON-VENKATESH-21.md`. The edits cover the header, "What the paper proves", "What the atlas has", the routes, the mistakes, the gaps, the item index and a new section "Fixes after the red team". The route, mistake, gap and index sections are re-rendered from the result, in the report's own format. The renderer reproduces the original sections exactly from the original result;
  - this report.
- **Result.** The extraction has 113 items (4 library, 5 planned, 104 missing), 33 source issues and 9 routes.
  - Route 1, new QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups: 76 items (it was 74).
  - Route 2, new GanGrossPrasadConjecturesForClassicalGroups: 20 items (it was 18).
  - Routes 3–9 are new, with 1, 1, 1, 1, 2, 1 and 1 items.
- **Route positions.** The queue matches review verdicts to routes by position (`accepted_routes` in `make_queue.py`).
  - Routes 1 and 2 keep their positions and their targets, the targets their accepted verdicts cover. Their item lists change, and so do parts of their briefs and reasons.
  - Every new or changed-target route is **appended**, as routes 3–9. None was put into an existing slot.
  - `PAPER-NELSON-VENKATESH-21.review.json` is a dated record and was left unchanged. It has verdicts for routes 1 and 2 only. So routes 3–9 have no verdict yet, and they are not applied until the next review of the extraction accepts them. Each of their reasons says so.
- **Items.**
  - New items /100–/113, numbered after /99.
  - /89 changes from planned to missing.
  - /28 is narrowed.
  - /64 and /59 are split: the p-adic half of /64 becomes /100, and the local period of /59 becomes /101.

## /1 (high, error): Theorem 27.1 and Theorem 31.11 are false for (SO3, SO2) with Π dihedral: fixed

I followed the verifier's version. It extends the red team's fix to items /94 and /95, and it corrects the wording of E1.

- **Checked myself.**
  - I read §25.7, §27.1–27.2 (pp. 180–182), §31 (pp. 202–204) and the proof of Lemma 27.3 in the published text (SHA-256 `85e14654…`, the hash the extraction records). The proof of Lemma 27.3 is identical in arXiv v3 (`9bce49cb…`).
  - The reduction holds: [a] is a function on the finite group ε. If the image of H(A) is ker χ, of index 2, then (27.1) ⟺ ∫_{[G]}[a]χ = 0.
  - The vanishing mechanism holds. χ = η_K∘Nrd is trivial on H(A), so the H-period is unchanged by multiplication by χ. That multiplication is an involution M = ⊗M_v of Π. At ∞, M_∞ commutes with PGL₂(R)⁺ and anticommutes with an element of determinant −1, which swaps D_k^±, so M_∞ = c·sgn(weight). Toric multiplicity one then forces the period to vanish for one sign of the weight at q, once σ′ is fixed.
  - The hypotheses of §25.7 are met: D is indefinite, so G_∞ = PGL₂(R) is quasi-split; D is a division algebra and K is imaginary, so G and H are anisotropic; D_k is tempered and generic.
  - The repair holds under Π ≇ Π ⊗ χ, because Π ⊥ Π ⊗ χ.
  - The real-place remark holds: θ is trivial on a definite SO_{n−1}(R).
- **E1** is rewritten.
  - kind `gap` → `error`; affects stays "a stated result".
  - The correction says that Theorems 27.1, 30.1 and 31.11 (and Corollaries 31.4 and 31.8) are false for (SO3, SO2) whenever Π ≅ Π ⊗ (η_{K/F}∘θ). The vanishing is stated for fixed σ′ at R∖{q}, and the correction covers K split at q.
  - It says that (1.4) survives, losing at most a factor 2, and that the statements hold under the added hypothesis.
  - It adds the real-place remark: local surjectivity fails at definite real places even for n − 1 ≥ 3, and Kneser's theorem repairs this globally for dim V_H ≥ 3.
  - The reason gives the counterexample (a)–(d) as the verifier checked it. The printed text, `known` and `searched` are unchanged.
- **Items /85, /86, /94, /95 and /98** carry the hypothesis "if (G, H) = (SO3, SO2), then Π ≇ Π ⊗ (η_{K/F}∘θ)". Each note says that the statement is false without it. /94's note says that Lemma 30.4 applies (27.1).
- **Item /99's note** says that (1.4) holds in all §25.7 cases (for its wording, see /4).
- **Gap G-SO3:** status `resolved`, recording that the theorems fail in the dihedral case.
- **Both briefs.** Route 1's "Keep visible … or a new argument" and route 2's "Record that … does not establish Theorem 31.11" are replaced by the fix's sentence: the theorem is false for (SO3, SO2) with Π dihedral for K, and must be stated with the hypothesis in that case. Route 2 adds that (1.4) holds in all cases.
- **Summary and report:** the header bullet, "What the paper proves", E1 and the gaps.

## /2 (high, error): /48 and /56 dropped hypotheses: fixed

I followed the verifier's version, which confirms the fix but replaces the evidence for /56.

- **/48** starts "Over an algebraically closed field k of characteristic 0 (§14.3):" and ends "Over R (Theorem 17.1) a fibre is empty or an H-torsor." Its note gives the compact (SO(3), SO(2)) example. I checked the example: the real image of x ↦ (|v|², v₃) is {A ⩾ b²}.
- **/56:** "when stable" becomes "when (λ_π, λ_σ) is stable and O_{π,σ} is non-empty". Its note cites the verifier's (U(1,1), U(1)) example, not the red team's SO(2,1) reason, which the verifier showed to be wrong.
- **Route 1's brief** says that stable fibres are H-torsors over an algebraically closed field, and are empty or H-torsors over R.

## /3 (medium, error): four slips copied into items: fixed, with E16–E19

The fix is applied as proposed. I read each passage in the published text:

| Item | Change | New source issue |
|---|---|---|
| /26 | "converges strongly (in the strong operator topology)" | E16 (error), Lemma 8.10, pp. 61–62, with the orthogonal-projection counterexample |
| /23 | h^{−dim g−\|α\|} | E17 (error), (8.3), p. 57, with the scaling argument |
| /3 | Op_h(a⋆_h b, χ′) | E18 (misprint), §2.5, p. 28, with the recurrence on p. 62 that the verifier noted |
| /22 | h^j | E19 (misprint), Lemma 7.14, p. 56, checked against (4.1) on p. 35 |

- Each new entry affects nothing, has `known: new`, and says "also arXiv v3".
- Each item's note points to its source issue.

## /4 (medium, error): further dropped hypotheses: fixed

I followed the verifier's version.

- **/75:** "φ₊ positive definite".
- **/68:** (22.8) is now a hypothesis in the statement (read on p. 146), with the sentence "The implied constants depend on (N, k, a, ε) but not on (π, σ, h)" (p. 147). See also /12(ii).
- **/40:** "for F archimedean and π irreducible admissible, … for τ-isotypic v". Its note gives the SL₂(R) counterexample and points to E24.
- **/50:** "Over R (K = R, §15.2)". Temperedness is attached only to the Γ_R-product clause, as the verifier directed.
- **/49 and /51:** "Over R". /51 gets no temperedness.
- **/61:** "(G, H) a GGP pair over an archimedean local field, and π, σ tempered". **/62:** "(G, H) a GGP pair over an archimedean local field".
  - The verifier found that "Lemma 19.1(iii)" does not exist, so I used §19's standing assumption rather than the red team's "part iii".
- **/99:** "Under the assumptions of Theorem 31.11 (§25.7), for fixed Π and Σ traversing a sequence (in the families F_h) whose archimedean parameters at q tend to ∞ at the same rate".

## /5 (medium, duplicate): the real Langlands classification and the real Plancherel formula: fixed

I followed the verifier's version, not the red team's fix. The red team's fix would have left /30 missing and unrouted, which fails the checker.

- **/30** stays missing and moves to **route 3**, a new source route to AutomorphicFormsOnReductiveGroups, stage AF.1.
  - Its reason and /30's note say that AF.1b takes it once the RT-AREA-automorphic-1 fixes are applied, as their §7 does for the AF.1 routes of CHENEVIER-TAIBI-20 and GAN-ICHINO-18.
  - AF.1b is not in `data/atlas.json`: the assembled atlas has no AF.1b stage.
- **/64** is now the real Plancherel theorem only. Its statement: G real reductive, complex groups included by restriction of scalars; f ∈ C_c^∞(G); the extension to n-fold differentiable f (§A.3, p. 138).
  - It moves to **route 4**, a new part-ii route with parent AutomorphicSpectralTheory. The route uses BEUZARTPLESSIS-LIU-ZHANG-ETAL-21's roadmap id and title, AutomorphicSpectralTheoryPartIISchwartzMultipliers, so the queue merges it into DESIGN-AutomorphicSpectralTheoryPartII.
  - Its brief says that the Part II is the single owner. It asks for the form f(1) = ∫χ_π(f), derived from BLZZ-21/25's L² form by polarisation and Dixmier–Malliavin.
- **The p-adic half** (Waldspurger's Plancherel formula and ∫ dim π^U < ∞, §A.4.1) is split off as the new item **/100**. It stays in route 1, because nothing else plans it; see /6.
- **Route 1's brief** imports the classification from AF.1 (AF.1b) and the real Plancherel formula from the Part II. The same choice is stated in the reasons of routes 3 and 4.

## /6 (medium, duplicate): Lemma 23.4 goes to SR.3: fixed; Waldspurger stays in route 1

I followed the verifier's version.

- **/72** moves to **route 5**, a new source route to SmoothRepresentationsOfLocalGroups:SR.3. Its note and the route's reason name GAN-SAVIN-23's item rev-langlands-classification-and-harish-chandra on that paper's route 3 (checked in its result file). I checked the statement on p. 155.
- The fix's second half is not applied. The verifier found that SR.3 does not plan the p-adic Plancherel formula, and moving it there "would add a major theorem to SR.3 under the label of an import". It is /100, in route 1, with the alternative owner (a SmoothRepresentationsOfLocalGroups Part II) named in its note.

## /7 (medium, duplicate): affine GIT and Hilbert–Mumford: fixed

I followed the reason in `RT-PAPER-NELSON-VENKATESH-21.review.json`.

- **/46** moves to **route 6**, a new part-ii route with parent `tauceti:TauCetiRoadmap/ReductiveGroups`. It uses FINTZEN-21 route 4's id and title (ReductiveCoadjointInvariantTheoryPartII), so the queue merges it into DESIGN-ReductiveGroupsPartIII.
- **The brief** asks that design for the verifier's four things:
  - the categorical quotient;
  - openness of M^s and φ(M^s);
  - the principal-bundle statement [MFK, Prop. 0.9];
  - the stability form of Hilbert–Mumford, via the closed-orbit form and Matsushima's theorem.

  It names the LP2/LP3 routes of BOCKLE-HARRIS-KHARE-ETAL-19 (/4) and LAFFORGUE-18 (/35), and says that one owner must be chosen with the maintainer. Route 1's brief imports these results.
- **/46's statement** says "x is not H-stable iff" instead of "x is unstable iff". Its note gives the verifier's counterexample: G_m acting trivially on A¹, with x = 1.
- **A note on the review file.** The summary line of `REV-RT-PAPER-NELSON-VENKATESH-21.md` reads "/7: import from LP2/LP3". The verdict's reason calls the Part II/III design "the most foundational owner under §15", and it offers LP2/LP3 as the maintainer's alternative. I applied the reason. The alternative is under "For the maintainer".

## /8 (medium, duplicate): the local period belongs to the GGP roadmap: fixed

I followed the verifier's version.

- **New item /101:** the convergence (18.1) and the local period ∫_H⟨sv1, v2⟩⟨u1, su2⟩ for each pair of vectors, for orthogonal, unitary and general linear pairs. It is missing, on route 2. Its note names BEUZARTPLESSIS-CHAUDOUARD-ZYDOR-22/4 (checked: route 4, to the GGP roadmap).
- **/59** stays in route 1. It is now H_σ as the sum over B(σ), with Lemma 18.1(i)–(iii), importing /101. Its proof uses Appendix A (/65).
- **/60's positivity** is now stated for the local period, and H_σ ⩾ 0 follows by summing over B(σ).
- **Both briefs** say so.

## /9 (medium, error): Ratner is not planned at GN.4: fixed

I took the verifier's option: GN.4, with a source route while the request is pending.

- **/89** changes from planned to missing. It is restated for a connected real Lie group, a lattice and a subgroup generated by Ad-unipotent one-parameter subgroups, and it includes the ergodic decomposition.
- **New item /113, Borel's density theorem** (proof of Lemma 27.8, p. 184, [Mo, Prop. 4.7.1]).
- **Both go to route 7**, a new source route to GeometryOfNumbersAndQuadraticArithmetic:GN.4. Route 1's brief imports them from GN.4 (route 7).
- **The packet request.** The verifier asks for a `requests` entry in the GeometryOfNumbersAndQuadraticArithmetic packet. That packet is not a deliverable of this job, so the request is under "For the maintainer".

## /10 (medium, error): the reductive Harish-Chandra isomorphism: fixed

I followed the verifier's primary option, a LieHighestWeight Part II.

- **/28** is narrowed to the semisimple Harish-Chandra isomorphism. It stays planned at LieHighestWeight layer 7 only, and AF.1 is dropped. Its locator is §9.1 and §9.4.
- **New item /102:** Chevalley's restriction theorem and the Harish-Chandra isomorphism for reductive g_C, with Example 9.1 for GL_n.
  - It is missing, on **route 8**, a new part-ii route with parent `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight`. The queue merges it into DESIGN-LieHighestWeightPartII.
  - The route's title uses the parent's title, as BOXER-CALEGARI-GEE-PILLONI-25's LieHighestWeight routes do.
  - Its brief names BLZZ-21/16, PILLONI-20/harish-chandra-isomorphism-infinitesimal-character and BCGP-25/2.3.9-HC as the items that should import it (checked in their result files).
- **New item /103:** the real form [ig*] and λ_π, §§9.3–9.5, in route 1, as the verifier directed ("the real form [ig*] and the definition of λ_π stay in route 1").
- **Route 1's brief** imports /102.

## /11 (medium, missing): cited theorems without items: fixed

I followed the verifier's corrections.

- **(a) /104, local multiplicity one:** missing, route 2. Its note gives the ℓ = 0 case of JIANG-ZHANG-20/bessel-uniqueness and the general linear case (AGRS, Sun–Zhu).
- **(b) /105, the Schwartz kernel theorem:** missing. It goes on **route 9**, a new source route to AutomorphicSpectralTheory:AS.0, which the verifier preferred.
  - Mathlib has only a docstring mention: `Mathlib/Analysis/Distribution/Distribution.lean:79`.
- **(c) /106, Riesz–Markov–Kakutani:** library.
  - It cites `mathlib:RealRMK.rieszMeasure` (Real.lean:65) and `mathlib:RealRMK.integral_rieszMeasure` (Real.lean:345), both read at 082e2d3 and in `declarations.tsv`.
  - The statement is stated as the library states it: X locally compact Hausdorff, Λ positive on C_c(X, R).
- **(d) /107, spinor norms and G(F_v)/G(F_v)⁺:** missing, route 1, with the unitary determinant step.
  - Its note cites `tauceti:CliffordAlgebra.spinorNorm` (SpinorNorm/Basic.lean:213) and `tauceti:CliffordAlgebra.range_spinToSpecialOrthogonal_eq_ker_spinorNorm` (line 323). Both were read at f790474 and are in `declarations.tsv`.
  - Kneser's Hasse principle is not an item, since the paper does not use it. It appears only in E1's repair remark.
- **(e) /108, the compactness criterion:** planned at AdelicAlgebraicGroups:AA.3. The note says that Lemma 27.8 uses the converse, which AA.3 only states.
- **(f) /109, Nelson and Nelson–Stinespring:** missing, route 1, including π^∞ = ∩D(∆^n) (p. 28).
- **(g) /110, Ranga Rao:** missing, route 1.
- **(i) /112, É. Cartan's connectedness theorem:** missing, route 1 (p. 185).
- **(h) /111, uniform admissibility:** planned at SmoothRepresentationsOfLocalGroups:SR.3a. The verifier corrected the red team's "missing, route 1".
- **(j) Borel's density theorem** is /113. It is routed with Ratner to GN.4 (route 7), following the verifier's /9 reason, rather than to route 1 as the /11 reason suggested. That keeps the Lemma 27.8 inputs with one owner.
- **Route 1's brief** lists the imports (AA.3, SR.3a, AS.0, Mathlib, Tau Ceti) and the cited inputs it plans. **Route 2's brief** lists /101 and /104.

## /12 (medium, missing): further mistakes: fixed, with E20–E33 and amendments to E3 and E15

I followed the verifier's refinements. I read every locator in the published text.

| Sub-item | Entry | Refinement applied |
|---|---|---|
| (i) | E20, p. 136 | — |
| (ii) | E21, pp. 146–147 | gap, affects "a stated result" (Theorem 22.2(iii)); the repair adds the support condition on a and the + O(h^N); /68 now states (22.10) with + O(h^N) |
| (iii) | amends E3 | not a new entry: Θ^unit and Θ^nt with the negative interval and the endpoints q^{±1/2}; odd n; Lemmas 24.8 and 24.10 survive |
| (iv) | E22, p. 185 | — |
| (v) | E23, p. 4 | against Lemma 31.10, p. 202 |
| (vi) | E24, p. 136 | error, with κ = (1 − Σx²)^N |
| (vii) | E25, p. 110 | — |
| (viii) | E26, p. 95 | published text only (the v3 text has ", y") |
| (ix) | E27, p. 134 | — |
| (x) | E28, p. 79 | — |
| (xi) | E29, p. 69 | the whole recursion q_j = −(Σ_{l<j} q_l ⋆_{j−l} Z)/Z |
| (xii) | E30, p. 43 | — |
| (xiii) | E31, pp. 88 and 176 | p. 176 added |
| (xiv) | E32, p. 191 | — |
| (xv) | E33, pp. 3 and 204 | misprint in the citation; /81's note is corrected as the fix says |
| (xvi) | amends E15 | locator: p. 154 (Lemma 23.3) and p. 155 (Lemma 23.4); the §23.1 (p. 152) and Lemma 23.2 (pp. 153–154) slips added |

- **The mathematics, checked by me.**
  - (x): the h² coefficient qb₂ + q⋆₁b₁ + q⋆₂b₀.
  - (xi): (q₀Z)⋆₁q₀ = −q₀(q₀⋆₁Z) for a Poisson-bracket ⋆₁.
  - (vii): dim(O^λ × O^µ) = 2 dim H for (U(n+1), U(n)) and (SO3, SO2).
  - (vi): for SO(4), Σ κ_τ^{−1} diverges when κ_τ ≍ |λ|².
  - (iii): f(−α) = −f(α) for odd n.
- **The source issues' records.**
  - Every new entry records `known: new`. Its `searched` list names what I checked on 30 September 2026: the Acta PDF, Crossref (no update registered) and the arXiv listing (v1–v3; v3 is the latest), together with the red team and its verification.
  - No new entry has a `review` block. PROTOCOL §18 leaves that block to the reviewer of this fix.
- **(xv).** The [Z1] attribution was checked by the verifier on Zhang's author copy. The refined formula is Zhang, J. Amer. Math. Soc. 27 (2014), 541–612.

## /13 (low, other): the list of GGP proposers: not applied

This is a low finding, recorded only. The verifier's fix:
- route 2's brief should name only the four accepted proposers, JIANG-ZHANG-20, BEUZARTPLESSIS-LIU-ZHANG-ETAL-21, BEUZARTPLESSIS-CHAUDOUARD-ZYDOR-22 and LIU-ETAL-22;
- "six extractions" in route 2's reason and in the report should be replaced likewise.

MAO-WAN-ZHANG-26 never had a GGP route. Route 2's brief and reason were edited for /1, /8 and /11, but their proposer list and "six extractions" were left as they were.

## /14 (low, other): `sourceVersions` and review blocks: not applied

This is a low finding, recorded only. The verifier's fix:
- add `sourceVersions` for the published PDF (`85e14654…`) and arXiv v3 (`9bce49cb…`). I reproduced both hashes on 30 September 2026;
- add review blocks crediting REV-PAPER-NELSON-VENKATESH-21 to E1, E8, E9, E11 and E14 only.

Since E1 has been rewritten here, its review block should now come from the review of this fix.

## For the maintainer

These changes lie outside this job's deliverables.

- **GN packet request (/9).** Add a `requests` entry to the GeometryOfNumbersAndQuadraticArithmetic packet asking GN.4 to plan three things:
  - Ratner's measure classification, for a connected real Lie group, a lattice and a subgroup generated by Ad-unipotent one-parameter subgroups;
  - the ergodic decomposition for such actions;
  - Borel's density theorem in the form of [Mo, Prop. 4.7.1].

  Once GN.4 plans them, /89 and /113 can become planned and route 7 can be dropped.
- **Affine GIT (/7).** One owner must be chosen for the categorical quotient and Hilbert–Mumford. The candidates are DESIGN-ReductiveGroupsPartIII (FINTZEN-21 route 4, now also NV21 route 6) and LanglandsParameterStacks LP2/LP3 (BOCKLE-HARRIS-KHARE-ETAL-19 route 2 /4, LAFFORGUE-18 route 3 /35). If LP2/LP3 is preferred, mark the quotient and Hilbert–Mumford parts of /46 planned there, and route only the stable-locus and principal-bundle parts.
- **AF.1b (/5).** When the RT-AREA-automorphic-1 fixes are applied, retarget route 3 from AF.1 to AF.1b. BEUZARTPLESSIS-LIU-ZHANG-ETAL-21/20(b) should import the real Langlands classification from AF.1b.
- **Tempered classification (/6).** GAN-SAVIN-23 route 3 (SR.3) and LIU-ETAL-22 route 12 (ET.4/ET.7a) plan the same theorem. ET should import it from SR.3.
- **Reductive Harish-Chandra isomorphism (/10).** The "planned" statuses of BEUZARTPLESSIS-LIU-ZHANG-ETAL-21/16 (AF.1) and PILLONI-20/harish-chandra-isomorphism-infinitesimal-character (layer 7, AF.1, AF.4) rest on the same gap. They should import from the LieHighestWeight Part II (NV21 route 8). ET.2b's Chevalley quotient should import the restriction theorem where the characteristic allows.
- **Design jobs.** DESIGN-QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups and DESIGN-GanGrossPrasadConjecturesForClassicalGroups are pending, and were generated from the old briefs. Regenerate them after this merges. Routes 3–9 join the queue only after a review accepts them.
- **Review of this fix.** It should:
  - give verdicts for routes 3–9;
  - add `review` blocks to E16–E33 and to the rewritten E1;
  - check the amendments to E3 and E15.
- **`PAPER-NELSON-VENKATESH-21.review.json`** is a dated record and was not edited. Its route reasons still describe 74 and 18 items.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-NELSON-VENKATESH-21.result.json`: ok.
- `python3 research/blueprint/intake.py check-files` on the three deliverables: 0 problems.
- **Assembled atlas.** `scripts/build.py`'s `assemble()` was run read-only in memory (2,840 stages, 8,258 stage edges). Every planned stage and every source-route stage the extraction names exists: LieHighestWeight layer 7, AA.3, AA.4, SR.1, SR.3, SR.3a, AF.1, GN.4 and AS.0.
- **Cycle test.** Read-only.
  - The new imports all run from atlas stages or proposed Part IIs into the new roadmaps. The atlas stages are AF.1, SR.3, SR.3a, AA.3, GN.4 and AS.0. The Part IIs are those of AutomorphicSpectralTheory, ReductiveGroups and LieHighestWeight.
  - The new roadmaps are QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups and GanGrossPrasadConjecturesForClassicalGroups. In the assembled atlas neither they nor the three Part II roadmaps is the source of any stage edge, so no new edge can close a cycle.
  - The GGP roadmap's local period imported by route 1 runs in the same direction as route 1's existing GGP imports.
- **Formatting and edits.**
  - The result keeps its formatting: indent 2, non-ASCII characters written literally, final newline. I checked before editing that re-serialising it gives it back unchanged.
  - One script applied every JSON edit. Each substitution asserted that its old text occurred exactly once in its field, and each replaced field asserted its old value. The script also asserted that every missing item is taken by exactly one route.
  - A second script edited the report under the same assertions.
- **Sources.** Both were re-downloaded and read on 30 September 2026, and both hashes match the extraction's:
  - the Acta PDF (`85e14654…`);
  - arXiv v3 (`9bce49cb…`).

  The arXiv listing shows v1–v3. Crossref registers no update for 10.4310/acta.2021.v226.n1.a1.
- **Citations.** Every stage id was checked against the assembled atlas. Every item id of another extraction was checked in its result file. The four library declarations were read at the pinned commits and found in the baseline `declarations.tsv`.
- No Lean was run.
