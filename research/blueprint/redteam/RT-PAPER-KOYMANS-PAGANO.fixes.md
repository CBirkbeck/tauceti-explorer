# RT-PAPER-KOYMANS-PAGANO: fixes

Fixer: Claude Code, session `cc-f805bf`, 30 September 2026 (issue #5026, job FIX-RT-PAPER-KOYMANS-PAGANO).

- **Findings:** `RT-PAPER-KOYMANS-PAGANO.result.json`.
- **Verdicts:** `RT-PAPER-KOYMANS-PAGANO.review.json` and `reviews/REV-RT-PAPER-KOYMANS-PAGANO.md` (verifier `cc-58621d`). All thirteen findings are confirmed: five medium (/1–/5) and eight low (/6–/13).
- **What this job fixes:** the five medium findings, /1–/5, as the issue lists them.
  - Where the verifier's reason differs from the red team's fix text, I followed the reason.
  - The low findings are recorded below and not applied (PROTOCOL §17).
- **Disclosure.**
  - This session (`cc-f805bf`) wrote the red team RT-PAPER-KOYMANS-PAGANO (PR #4705).
  - It also wrote FIX-RT-AUDIT-07 (the ArithmeticStatistics / sieve audit) and the verification of the Koymans–Milovic red team (PR #4945).
  - It did not write the extraction, its review or this verification.
  - The fix stays within the scope that the independent verifier authorised. Where the verifier narrowed or changed my own red-team fix, I applied its version. That happened in every finding: /1 (items 21 and 83 stay planned; item 52 is library for another reason), /2 (item 227 stays planned), /3 (the ordering of the variables; part (b) is void), /4 (the new item is missing) and /5 (the per-item split).
- **Files changed. Only the deliverables:**
  - `papers/PAPER-KOYMANS-PAGANO.result.json`;
  - `papers/PAPER-KOYMANS-PAGANO.md`: counts, "What the atlas already has", §7, routes 2, 3, 5 and 7, the prerequisites, and a closing section "Fixes after the red team";
  - `packets/ClassicalArithmeticCompletion.json`: one new CA.5 node, one baseline declaration and the CA.5 coverage note (/5);
  - this report.

  `packets/ArithmeticStatistics.json` is a deliverable but needed no change (/4).
- **Result.** 265 items (9 library, 14 planned, 242 missing) and 7 routes:
  - route 1 (Part II): 219 items;
  - route 2 (CA.4): 3 items;
  - route 3 (ST.0/ST.3/ST.5): 6 items;
  - route 4 (AN.2/AN.4/AN.5): 9 items;
  - routes 5 (SV.2) and 6 (PM.1): 1 item each;
  - route 7 (CA.5, new): 3 items.
- **Route positions.** The queue matches review verdicts to routes by position (`accepted_routes` in `make_queue.py`).
  - Routes 1–6 keep their positions and their targets. Route 2 loses three items, route 3 gains one, and routes 1, 3 and 5 change only their text.
  - The CA.5 route that the verifier prescribed for /5 is the new last route, **route 7**, rather than an extra stage of route 2. Adding CA.5 to route 2 would have let route 2's CA.4-only verdict cover a target its reviewer never saw.
  - The extraction's review (`PAPER-KOYMANS-PAGANO.review.json`, a dated record left unchanged) has no verdict for route 7, so the route is not applied until the next review of the extraction accepts it. Its reason says so.

## /1 (medium, library-claim): built ProfiniteCohomology and ProfiniteProPGroups layers described as plans: fixed

I followed the verifier's item-by-item version. An item is library when a declaration states it as the item states it. Otherwise the item keeps its status and its note cites the declarations (the reading of REV-RT-PAPER-TEMKIN-17).

- **Item 36 → library.**
  - It cites `TauCeti.ContCohomology.C1`, `Z1`, `d1`, `d1_apply`, `mem_Z1_iff` and `d1_apply_eq_zero_iff`.
  - The note says that `d1_apply` is d_x term by term for the action σ·n = (−1)^{χ_x(σ)}n, and that the twisted module N(χ) is item 35 (missing, route 1). It no longer calls that module "new work".
- **Item 52 → library, for the verifier's reason.**
  - It cites `mathlib:inhomogeneousCochains.d` and `mathlib:Rep.trivial`, together with Tau Ceti's `d1` and `d2`.
  - The note records that the paper applies d to 1-cochains and to 2-cochains: the proof of Proposition 2.16, p. 18, and §5, p. 40. It does not say that only k = 1 is used.
  - I read the Mathlib formula at 082e2d3 (Basic.lean:86): ρ(g₀)f(g₁, …) + Σ_{j=0}^{n} (−1)^{j+1} f(contractNth j g), whose j = n term drops the last argument. With trivial action over 𝔽₂ this is the paper's p. 14 formula in every degree.
- **Item 28 → library, restated in the library's form.**
  - Statement: G_ℚ ⧸ proPKernel 2 G_ℚ with its quotient map. The paper's Gal(ℚ^{pro-2}/ℚ) is described in the statement's last sentence and in the note.
  - It cites `proPKernel`, `maximalProPQuotient`, `proPKernel_le`, `isClosed_proPKernel`, `isProP_maximalProPQuotient`, `maximalProPQuotient.lift` and `lift_unique`, and `mathlib:InfiniteGalois.normalAutEquivQuotient`, the fixed-field identification for a closed normal subgroup.
- **Item 83 stays planned** (ProfiniteCohomology Layers 6 and 9, as before).
  - The note is rewritten. It says that Layer 6 is built but no declaration states the index-2 criterion.
  - It cites `cochainsCor1` with `cochainsCor1_apply_of_smul_eq_self`, `explicitCor1Transversal` with `explicitCor1Transversal_mk`, `explicitCor1_eq_transversal`, `TauCeti.lWord` and `H1EquivOfSmulEqSelf`.
  - It gives the computation. I checked it: with t(U) = 1 and t(σU) = σ, the words are ℓ_U(σ) = σ², ℓ_{σU}(σ) = 1, ℓ_U(τ) = τ and ℓ_{σU}(τ) = σ⁻¹τσ. That gives (3.1)–(3.2), because χ(σ⁻¹τσ) = χ(σ⁻²·στσ⁻¹·σ²) = χ(στσ⁻¹) with σ² ∈ U.
- **Item 21 stays planned** at Layer 9, the red team's own fallback.
  - The note cites `kummerMap`, `kummerMap_eq_kummerCocycleClass` and `H1EquivOfSmulEqSelf`, and says the Kummer isomorphism is not needed.
  - It names QuadraticFormInvariants 7a as the owner of μ₂ ≅ 𝔽₂. The reviewed audit rates that coefficient identification absent, and it rates Layer 9's mod-2 specialization partial; I read both entries in `data/library-coverage.json`.
- **Counts:** 9 library and 14 planned, in the report.
- **The report's "What the atlas already has"** lists the three new library items and the corrected planned list. It adds a "Built in Tau Ceti" paragraph.
- **Route 1's brief** now says, after its Tau Ceti import list, that ProfiniteCohomology Layers 2 and 6, the Kummer map of Layer 9, ProfiniteProPGroups Layer 3 and Multiquadratic Layers 2–3 are built at f790474.
- **The planned list, checked.** It was missing Multiquadratic Layer 0 (item 25) and ProfiniteCohomology Layer 11 (item 134), and I added both, so that it matches the 14 items.

## /2 (medium, library-claim): genus theory is built: fixed

I followed the verifier's primary option.

- **Item 227 stays planned** at Multiquadratic Layers 2–3, with its note rewritten.
  - The note says both layers are built.
  - It cites `NumberField.NarrowClassGroup.mem_closure_of_sq_eq_one`, `mk0_sq_eq_one_of_map_ringOfIntegersQuadraticConj_eq_self`, `genusCharFunElementaryTwoQuotientFamilyLinearMap_injective`, `mem_range_genusCharFunElementaryTwoQuotientFamilyLinearMap_iff`, `narrowTwoRank_eq_ncard_ramifiedPrimes_sub_one` and the Artin bridge `autCandidateGenusFieldEquivNarrowElementaryTwoQuotient_artinHomAway`.
  - It lists the remaining glue: (i) the square of Up(p_i); (ii) the step from generation to the surjection; (iii) duality, the transpose of the injective family map; (iv) the identification of Galois characters with ideal-theoretic ones; (v) the prime-discriminant indexing, where p_i ≡ 1 (mod 4), 8 occurs when 2 | x (the discriminant is 8m with m ≡ 1 mod 4), and χ₈ = χ₂.
- **Item 5** now cites `tauceti:NumberField.card_ker_toClassGroup_le_two` for the 2-Sylow step, in place of calling it missing. It stays missing because of /5.
- **The report's** planned list names item 227 at Multiquadratic Layers 2–3, and its "Built in Tau Ceti" paragraph says what remains.

## /3 (medium, error): Jutila's lemma, not Heath-Brown's large sieve: fixed

I followed the verifier's version.

- **Item 189** is renamed "Bilinear Legendre-symbol estimate (Smith, Prop. 6.6, from Jutila's mean-value lemma), and (7.11)".
  - The Heath-Brown sentences in its note are replaced by Jutila's Lemma 3, with Cauchy–Schwarz and reciprocity on the four classes mod 4.
  - The note names the ordering. With x_i outer, the bound is t_i t₁^{1/2} + t_i^{3/4} t₁ log³t₁ ≪_ε t_i t₁^{3/4+ε}. With x₁ outer, a factor log³t_i remains, which (ii) allows to be as large as t₁^{3c₂}.
  - It says SV.2 is to plan Jutila's lemma and Proposition 6.6, and that the item must not coalesce with PAPER-SKOROBOGATOV-SOFOS-23's Heath-Brown item.
  - The sentence on the classical large sieve (enough only for t_i ≥ t₁^{3/2}) is kept.
  - I checked the swapped bound. Σ_{x_i}|Σ_{x₁} c(x₁)(x_i/x₁)| ≤ |X_i|^{1/2}(t_i|X₁| + t_i^{1/2}t₁² log⁶t₁)^{1/2}, and t_i^{3/4}t₁ log³t₁ ≤ t_i t₁^{3/4+ε} because t₁ < t_i.
- **Item 263** is unchanged. As the verifier found, part (b) is void: its note names no Heath-Brown result.
- **The summary field:** "Heath-Brown's large sieve for Legendre symbols in boxes (§7)" is replaced.
- **Route 1's brief:** all three mentions are replaced (layer 5, the SV.2 import and the list of prerequisite papers).
- **Route 5's reason** says SV.2 is to plan Jutila's lemma and Smith's Proposition 6.6, not Heath-Brown's large sieve. The owner stays SV.2.
- **Prerequisites.** The Heath-Brown 1995 entry is replaced by Jutila, Acta Arith. 27 (1975), 191–198, doi:10.4064/aa-27-1-191-198. Its "why" is the verifier's.
- **The report:** §7, route 5 and the prerequisites.
- **Left in place.** `source.readSections` still lists "Heath-Brown [HB]" among the cited inputs not read. That is the paper's reference [22], which the paper does cite (in §1), so it is a correct record.

## /4 (medium, duplicate): P(m, n, j) had two planned owners: fixed

I followed the verifier's version.

- **Item 211** is renamed "D_{k,n} and D_{k,n}(N)". Its statement drops P(m, n, j), and its note points to item 265. It stays on route 1, which keeps 219 items.
- **New item 265** (definition, missing, route 3, locator "§8, p. 75 (arXiv v1)").
  - The statement is P(m, n, j) as the paper defines it, and the note quotes that definition.
  - The note cites ArithmeticStatistics:ST.5/matrix-kernel-law-over-a-finite-field. It records that the packet is merged but not accepted, that the Part II imports the definition, and that item 218 ((A.2)) uses it.
- **Route 3** gains item 265 (5 → 6 items). Its ST.5 sentence names P(m, n, j).
- **Route 1's brief** now says "ST.5 owns P(m, n, j), P_Sym and the identity (A.2); the Part II imports them."
- **The report's** route 3 entry is updated.
- **The ArithmeticStatistics packet** needed no change. Its node already quotes p. 75 and says that ArithmeticStatisticsPartIISmithMethod, route 1's roadmap id, imports it. ST.5 also has the node ST.5/koymans-pagano-rank-identity for (A.2).
- **Cycle test.** Following the verifier, ST.5 has no consumers in the atlas. The Part II is a new roadmap with no consumers, so no import into it can close a cycle.

## /5 (medium, error): the 𝒪_K/ℤ[√d] passage belongs to CA.5, and CA.5 missed d ≡ 1 (mod 4): fixed

I followed the verifier's version in substance. Its one change of form is the route position, explained above.

- **The routes.**
  - Route 2 keeps CA.4 with items 2–4 (the set 𝒟⁻, Hasse–Minkowski, Dirichlet). Its reason says that items 5, 9 and 12 moved to route 7.
  - The new **route 7** (source, ClassicalArithmeticCompletion, stage CA.5) takes items 5, 9 and 12. Its reason gives the finding's sentence, the built half and the route-position note.
  - CA.4 → CA.5 is an atlas edge (`data/atlas.json` stageEdges).
- **Items 5, 9 and 12.** Their notes carry the sentence: items 5, 9 and 12 need the passage for all squarefree d > 1, and the node covers only d ≢ 1 (mod 4). They cite both built declarations, `NumberField.NarrowClassGroup.toClassGroup_injective_iff_exists_norm_eq_neg_one` and `NumberField.exists_norm_eq_neg_one_of_sq_sub_mul_sq_eq_neg_one`, so that only the converse is missing. Each now points to route 7.
- **Route 1's brief** imports CA.5 as well as CA.1 and CA.4.
- **The CA packet.** The finding says the cases d ≡ 1 (mod 8) and d ≡ 5 (mod 8) "are to be added" to CA.5. The packet is a deliverable, so I added them as a node. I did not widen the existing node, so that its consumers and its index and generation clauses, which fail for d ≡ 5 (mod 8), stay as they are.
  - **New node** ClassicalArithmeticCompletion:CA.5/negative-pell-iff-unit-of-norm-minus-one-for-d-one-mod-four, inserted after the existing node. For squarefree d > 1 with d ≡ 1 (mod 4):
    - (i) if d ≡ 1 (mod 8), 𝒪_K^× ⊆ ℤ[√d];
    - (ii) if d ≡ 5 (mod 8), u³ = (a(a² − 3ν) + b(a² − ν)√d)/2 ∈ ℤ[√d] for every unit u = (a + b√d)/2 of norm ν;
    - (iii) x² − dy² = −1 is soluble iff 𝒪_K has a unit of norm −1.

    Together with the existing node, this covers every squarefree d > 1.
  - The node has four proof steps and four acceptance tests: d = 5, 13, 17 and 21 (d = 21 is the norm-one case with no solution).
  - Its prerequisites are CA.5/zsqrtd-into-the-ring-of-integers, CA.5/index-of-the-order-z-sqrt-d, Tau Ceti's `adjoin_halfGen_eq_top_of_mod_four_eq_one` and `exists_norm_eq_neg_one_of_sq_sub_mul_sq_eq_neg_one`, and `mathlib:Zsqrtd.norm`.
  - Its sources are two existing packet excerpts, reused verbatim with new "match" text: Conrad, "Factoring in quadratic fields", Theorem 3.4 (the ring 𝒪_K), and Conrad, "Pell's equation, I", Theorem 7.5. I re-fetched both PDFs, and their SHA-256 match the packet's.
  - No public source I found states the mod-8 dichotomy itself. The node's argument is the short computation above, and it is checked by the tests.
  - `exists_norm_eq_neg_one_of_sq_sub_mul_sq_eq_neg_one` was added to `baseline.declarations` (read at Norm.lean:108).
  - The CA.5 coverage note now mentions the d ≡ 1 (mod 4) case.
- **The mathematics, checked.**
  - The cube identity: (a³ + 3ab²d)/8 = a(a² − 3ν)/2 and (3a²b + b³d)/8 = b(a² − ν)/2 when db² = a² − 4ν. Checked by hand, and on 200 random rational instances.
  - For a odd, a² − 3ν and a² − ν are even.
  - A search over squarefree d ≡ 1 (mod 4) below 2000 and odd b < 400 found 157 half-integral units. All have d ≡ 5 (mod 8), and every cube is an integral solution of x² − dy² = ν. No such unit exists for d ≡ 1 (mod 8).
  - The acceptance values: ((1 + √5)/2)³ = 2 + √5; ((3 + √13)/2)³ = 18 + 5√13, with 324 − 325 = −1; ((5 + √21)/2)³ = 55 + 12√21, with 3025 − 3024 = 1; and 16 − 17 = −1.
- **Cycle test.** The node's prerequisites are nodes of the same stage (CA.5) and baseline declarations, so it adds no stage edge. Route 7 adds none either, and the Part II's new import of CA.5 goes into a roadmap with no consumers.

## /6 (low, error): E12's strike was wrong: not applied

- This is a low finding, recorded only.
- The verifier's fix restores E12's "at most 2" half without "(as in every application)". Item 104 states "is at most 2", with the printed "equals 2" as a remark. The report's header and E12 paragraph are corrected too.
- I checked the counterexample. 65 = 5·13 ≡ 1 (mod 8), so (2) splits in ℚ(√65). With k = 1 and ψ₂(65) = 0, L(0) = ℚ, so the ramification index at 5 is 1.

## /7 (low, error): the note on the rank of Art_s: not applied

- This is a low finding, recorded only; the red team's replacement sentence stands.
- I checked the example. For A = ℤ/4 and s = 1, A[2] = 2A[4] = {0, 2}. The pairing therefore has rank rk₂ − rk₄ = 1 − 1 = 0, while the note's formula would give rk₂(ℤ/4) = 0 instead of 1.

## /8 (low, other): a > 1 in the profitable-triple set-up: not applied

- This is a low finding, recorded only.
- The verifier's fix: 'a > 1' goes in item 98's statement, and items 107–108 may repeat it. E52's reason uses the verifier's sentence on §5 and §8.4 (p. 93), and its searched list is dated afresh.

## /9 (low, error): Smith's Lemma 4.1 and Proposition 4.4: not applied

- This is a low finding, recorded only.
- The verifier's fix: item 154 gets r ≥ 2. Item 159's note cites Smith's Proposition 4.4 on p. 40, and covers |S| ≥ 2. Item 159 should carry S ≠ ∅ (or |S| ≥ 2), as a misprint that affects nothing, recorded with E53–E54.

## /10 (low, other): effectivity of the m = 2 step: not applied

- This is a low finding, recorded only.
- The verifier's fix to E55:
  - cite Watkins [47] as the effective source for m = 2;
  - require the box form of E41 to be effective too;
  - put the pointer in items 8 and 214.

## /11 (low, other): missing prerequisites: not applied

- This is a low finding, recorded only.
- The verifier's list: Rédei–Reichardt [40] for (7.27); Rédei [39] for Rédei symbols and reciprocity (item 80); Rédei [38], optional; Heilbronn; MacWilliams; and Watkins [46] and [47], with their URLs and the retrieval-date caveat.
- Jutila is already added by /3.
- [38]'s printed year 1935 (Crossref and zbMATH: 1934) may be recorded as a misprint.

## /12 (low, other): "(issues file)" tags: not applied

- This is a low finding, recorded only.
- The verifier's fix:
  - item 13's (1.3) indexing slip becomes a new misprint entry;
  - item 23's tag is deleted;
  - item 93's note gets the replacement text with the transitivity-of-norms step;
  - optionally, the other eleven tags name E2–E9.

## /13 (low, other): sourceVersions: not applied

- This is a low finding, recorded only.
- The verifier's fix: add a single preprint `sourceVersions` entry, with the TeX-source hash and a note to collate E4, E7 and the locators against the Acta version. Add no "published" entry, since that would take the paper off the collation worklist.
- `collation.published_exists` needs a publisher DOI in `papers.json`; a year in the citation is not enough.

## For the maintainer

These changes lie outside this job's deliverables.

- **Route 7 needs a review verdict.** The next review of PAPER-KOYMANS-PAGANO should give route 7 (CA.5, items 5, 9 and 12) a verdict. Only then does the paper become a source of the CA.5 blueprint for those items. If the maintainer prefers the verifier's literal form (CA.5 added to route 2's stages), the same review can accept that instead.
- **The CA packet's suggested file and reader document.** `suggested/ClassicalArithmeticCompletion.lean` and `readmes/ClassicalArithmeticCompletion.md` are not deliverables. They should gain the new node CA.5/negative-pell-iff-unit-of-norm-minus-one-for-d-one-mod-four, as a theorem signature beside `negative-pell-iff-unit-of-norm-minus-one`. The packet is under review (#532), so that review, or its next round, should check the node (PROTOCOL §17: a fix to a packet is reviewed by REV-FIX-RT-PAPER-KOYMANS-PAGANO).
- **ST.5's reuse.** Nothing to do in the ArithmeticStatistics packet for /4. When the Part II design runs, it should import ST.5/matrix-kernel-law-over-a-finite-field and ST.5/koymans-pagano-rank-identity.
- **SV.2.** When the SieveMethodsAndPrimePatterns blueprint plans SV.2, it should plan Jutila's Lemma 3 and Smith's Proposition 6.6, and keep them separate from PAPER-SKOROBOGATOV-SOFOS-23's Heath-Brown item.
- **Low findings.** /6–/13 are recorded above with the verifier's fixes, for a later round or the next review of the extraction.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-KOYMANS-PAGANO.result.json`: ok.
- `python3 scripts/check_blueprint.py research/blueprint/packets/ClassicalArithmeticCompletion.json --index <baseline>/declarations.tsv`: 0 errors, 0 warnings (330 nodes, 19 requests).
- The same for `packets/ArithmeticStatistics.json` (unchanged): 0 errors, 0 warnings.
- `python3 research/blueprint/intake.py check-files` on the five deliverables: no problems.
- **Formatting and edits.** The JSON files keep their formatting: indent 2, non-ASCII characters written literally, final newline. I checked before editing that re-serialising each file gives it back unchanged.
  - One script per JSON file applied the edits. Each asserted that the replaced text occurred exactly once in its field, or that the whole field equalled its old value.
  - A further script edited the report under the same assertion.
- **Library citations.** Every declaration cited above was checked against the baseline `declarations.tsv` and read in its file, at Tau Ceti f790474 and Mathlib 082e2d3. Every node and stage id cited was checked against the current packet texts and `data/atlas.json`.
- No Lean was run.
