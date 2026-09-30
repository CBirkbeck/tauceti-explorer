# RT-PAPER-BETTS-STIX-25: fixes

Fixer: Claude Code, session `cc-f805bf`, 30 September 2026 (issue #5019, job FIX-RT-PAPER-BETTS-STIX-25).

- **Findings:** `RT-PAPER-BETTS-STIX-25.result.json`.
- **Verdicts:** `RT-PAPER-BETTS-STIX-25.review.json` and `reviews/REV-RT-PAPER-BETTS-STIX-25.md` (verifier `cc-48533a`). All fourteen findings are confirmed: one high (/2), four medium (/1, /3, /4, /5) and nine low (/6–/14).
- **What this job fixes:** the high and medium findings, /1–/5, as the issue lists them.
  - Where the verifier's reason differs from the red team's fix text, I followed the reason. It sets the scope of each fix.
  - The low findings are recorded below and not applied (PROTOCOL §17).
- **Disclosure.**
  - This session (`cc-f805bf`) wrote the red team RT-PAPER-BETTS-STIX-25 (PR #4718).
  - It also wrote the red team of the Lawrence–Venkatesh roadmap (PR #4763), whose layers LV.1–LV.3 and LV.7 this extraction's source routes serve, and the fix FIX-RT-AUDIT-07. None of the edits below relies on them.
  - It did not write the extraction, its review or the verification.
  - The fix follows only the scope that the independent verifier authorised. Where the verifier narrowed or changed my own red-team fix, I applied its version. That happened in /1, /2, /3, /4 and /5, as each section says.
- **Files changed. Only the deliverables:**
  - `papers/PAPER-BETTS-STIX-25.result.json`;
  - `papers/PAPER-BETTS-STIX-25.md`. The edits cover the header, route 1's reason and brief, route 6's reason and item list, the Shimizu prerequisite, E1, the new E7 and E8, the gaps, the item index and a new section "Fixes after the red team". Each changed passage is the corresponding text of the result;
  - this report.
- **Not changed:** `papers/PAPER-BETTS-STIX-25.review.json` and `reviews/REV-PAPER-BETTS-STIX-25.md`. They are dated records and not deliverables of this job.
- **Result.** The extraction has 103 items (1 library, 19 planned, 83 missing), 6 prerequisites, 8 source issues (E7 and E8 new) and 7 routes.
  - Route 1, Part II `GaloisSectionsPadicPeriodMaps`: 48 items, unchanged.
  - Route 6, source `PadicHodgeTheory:P8`: 19 items (it was 16).
  - Routes 2–5 and 7 are unchanged.
- **Route positions.** The queue matches review verdicts to routes by position (`accepted_routes` in `make_queue.py`).
  - No route was added, deleted, moved or retargeted. Every route keeps its position, its kind, its roadmap and its stages, so each review verdict still belongs to the route it was given to.
  - Routes 1 and 6 change only in their reason, route 1 also in its brief, and route 6 in its items. Each reason ends with a dated correction.
  - Route 6's three new items (/101–/103) have no review verdict yet, and its reason says so.
  - `make_queue.accepted_routes('PAPER-BETTS-STIX-25')`, run read-only, still returns all seven routes in their order.
- **Items.**
  - New items /101–/103, numbered after /100, all missing and taken by route 6.
  - /24, /25, /77, /78 and /99 are restated.
  - Notes are added or extended on /24, /25, /38, /46, /77, /78, /79 and /99.
- **Edits.**
  - One Python script edited the result and one edited the report.
  - Each substitution asserted that its old text occurred exactly once, and each replaced field asserted its old value.
  - The result script also asserted that the item ids run /1–/103, that the coverage counts match the statuses, that every missing item is taken by exactly one route, and that the source issues run E1–E8.
  - The result keeps its formatting: indent 2, non-ASCII characters written literally, final newline. I checked before editing that re-serialising it gives it back unchanged.
- **Sources read for this fix (30 September 2026).**
  - Betts–Stix arXiv:2204.13674v1 PDF (SHA-256 `7d4b7d49…`, the hash the extraction records) and its LaTeX source. arXiv still lists only v1.
  - Shimizu arXiv:2003.10951v2 (SHA-256 `782fa215…`), the version the paper's bibliography names.
  - Scholze, *p-adic Hodge theory for rigid-analytic varieties*, arXiv:1205.3463v2 (SHA-256 `ed9187b3…`), for Theorem 8.8, Proposition 6.10 and Corollary 6.15.

## /1 (medium, duplicate): the paper is queued for design twice: route 1 annotated; the rest is for the maintainer

I followed the verifier's version. It corrects two details of the finding and widens the generator fix.

- **Checked myself.**
  - In `make_queue.py` at origin/main, the fixed list holds `("DESIGN-BETTS-STIX", "GaloisSectionsPadicPeriodMaps", "arithmeticgeometry", BETTS_STIX_BRIEF, None)`. `BETTS_STIX_BRIEF` does not name PAPER-BETTS-STIX-25.
  - `queue.json` holds DESIGN-BETTS-STIX (order 7, roadmap GaloisSectionsPadicPeriodMaps, `after` empty). It also holds DESIGN-AnabelianGeometryAndNonabelianChabautyPartII (order 146 today, roadmap AnabelianGeometryAndNonabelianChabautyPartII, `after` empty). Both are pending.
- **Two details of the finding, as the verifier corrected them.**
  - Route 1's reason already named DESIGN-BETTS-STIX. That part of the fix was already done.
  - Nothing supports the claim that the four LV source routes import from GaloisSectionsPadicPeriodMaps by id. I did not repeat it.
- **Changed in the deliverables.** Route 1's reason ends with a dated correction:
  - its design job is DESIGN-BETTS-STIX;
  - the generated DESIGN-AnabelianGeometryAndNonabelianChabautyPartII duplicates it, and the maintainer is asked to fold the route into DESIGN-BETTS-STIX and retire the generated job;
  - its design must plan Proposition 2.19 for Q_p^×-valued characters and the trichotomy with Σ_A the Q_p-points of A (findings 2 and 3).
- **Not in a deliverable:** `make_queue.py` and `queue.json`. See "For the maintainer".

## /2 (high, error): Proposition 2.19 with Q̄_p-values is false: fixed

I followed the verifier's version, which makes /25 self-contained.

- **/24** now reads "Let χ: G_K → Q_p^× be unramified and pure of weight n outside a finite set …", the paper's hypothesis.
  - Its note gives the counterexample to the Q̄_p^× version and says why Q_p-values matter: η_p^alg is a product of local norms with values in Q_p^×.
  - It also records the verifier's point that the Q̄_p^× version holds when K has no CM subfield.
- **/25** now begins "For χ: G_K → Q_p^× as in Proposition 2.19 (Q_p^×-valued, unramified and pure of weight n outside a finite set, de Rham at all p-adic places), if v is self-conjugate …". A note says why the Q̄_p-valued CM character breaks it.
- **Route 1's brief** now reads "Proposition 2.19 for Q_p^×-valued characters, as the paper states it: the Q̄_p^×-valued version is false when K has a CM subfield, see item /24". Route 1's reason says that its design must plan the Q_p-valued statement.
- **Checked myself.**
  - reps.tex l.329 reads `\chi\colon G_K\rightarrow\bQ_p^\times`, and `\bQ` is `\mathbb Q` (preamble.tex l.148). Remark 2.20 (p.14) is stated under "the conditions of Proposition 2.19".
  - The counterexample, as the verifier checked it: K = Q(i), p ≡ 3 mod 4, and v = (p), which is inert, so conjugation fixes it and v is self-conjugate. E: y² = x³ − x has CM by Z[i], defined over K, and good reduction away from 2. G_K acts on V_pE, of rank 1 over K ⊗ Q_p = Q_{p²}, through ρ: G_K → Q_{p²}^×. Then χ = ι∘ρ has Frobenius eigenvalues π_𝔮 with π_𝔮π̄_𝔮 = N𝔮, so it is pure of odd weight. At v it is Lubin–Tate for the uniformiser −p, so it is crystalline with Hodge–Tate weights 0 and 1 at the two embeddings. "n even, r_v = n/2" fails.
- **Not applied here:** "route 1's design must plan the Q_p-valued statement". It is an instruction to the design job, and route 1's brief and reason now carry it.

## /3 (medium, error): Σ_A is the set of Q_p-points; E1's 'A étale' repair is false: fixed

I followed the verifier's version, which leaves Definition 6.8 (item /79) as printed.

- **/78** now reads "Σ = Σ_A = Hom_{Q_p-alg}(A, Q_p), and V_ψ = Q_p ⊗_{A,ψ} V", and its (c) ends "which is ≥ dim_{Q_p}(A)/(d + 1) when A is split (A ≅ Q_p^n as a Q_p-algebra)".
  - In its note, "Every use has A étale" is now "Every use has A split: A|G_v ≅ H^0_ét(X_{y_v,K̄_v}, Q_p) = ∏ Q_p (Remark 6.6)".
  - The note adds a dated correction.
- **/77** now reads "Q_p-algebra maps ψ from it to Q_p". Its new note says the algebra is split.
- **E1's correction** now reads: "Replace dim_{Q_p}(A) by #Σ_A in (c), or assume A split (A ≅ Q_p^n as a Q_p-algebra), where #Σ_A = dim_{Q_p}(A). Reduced or étale is not enough: A = Q_{p²} gives Σ_A = ∅. …".
  - E1's reason gains the Q_{p²} example and a dated note that the earlier alternative was wrong.
  - E1's `printed`, `locator`, `known` and `searched` are unchanged. The ε³ counterexample and the verdict stand, as the verifier found.
- **/79 is kept as printed.** It gets a note saying that type (c) is evaluated only on split algebras, where dim_{Q_p}(A) = #Σ_A. The red team asked for the same change in /79. The verifier rejected that, since a definition cannot be false, and I followed the verifier.
- **Route 1's brief** now says "Σ_A = Hom_{Q_p-alg}(A, Q_p), the Q_p-points of A, and #Σ_A in (c), which equals dim_{Q_p}(A) when A is split".
- **Checked myself.**
  - locus.tex l.108: `\Sigma_A \colonequals \Spec(A)(\bQ_p) = \{\psi : A \to \bQ_p ; \text{$\bQ_p$-algebra homomorphism}\}`.
  - Proposition 6.7 (p.46): "Let Σ = Σ_A be the set of Q_p-algebra homomorphisms A → Q_p". Remark 6.6 uses Q_p-algebra homomorphisms from H^0_ét(X_{y_v,K̄_v}, Q_p) = ∏ Q_p.
  - For A = Q_{p²}, Hom_{Q_p-alg}(Q_{p²}, Q_p) = ∅, because the minimal polynomial of a generator has no root in Q_p. With d = 1 (V free of rank 2 over A), (c) as printed asks 0 ≥ 2/2 = 1.

## /4 (medium, missing): Shimizu's monodromy theorem has no item: fixed, owner left to the maintainer

I followed the verifier's version. It corrects the citation to Theorem 7.4 and adds a third candidate owner.

- **New item /101**, "Shimizu's relative p-adic monodromy theorem on polyannuli (cited)", is missing and taken by route 6.
  - It is set on R_v = O_v⟨t_1^{±1}, …, t_n^{±1}⟩, which satisfies Set-up 3.1 and (BR).
  - A de Rham Ẑ_p-local system with a full basis of horizontal sections corresponds to a horizontal de Rham G_{R_v}-representation, by Lemma 3.27 and [Shi20, Lemma 8.9]. By [Shi20, Theorem 7.4] it becomes horizontal semistable over a finite L_w/K_v. So dim D^∇_pst(E) = rank E, the rank of E ⊗ Q_p.
- **New item /102**, [Shi20, Proposition 4.9]: (B^∇_dR(R_v))^{G_{R_v}} = K_v, in the paper's notation B_dR(R_v)^{G_{R_v}, ∇=0} = K_v. It is missing and taken by route 6.
- **/46's note** names /101 and /102 as inputs of its proof.
- **New source issue E8** (misprint, affects nothing). The verifier offered it as optional. It records two slips:
  - the paper cites Lemma 8.9 where Theorem 7.4 is needed;
  - its "Definition 4.15" is Definition 5.6 in v2, where 4.15 is a lemma.
- **The Shimizu prerequisite** now names v2, Theorem 7.4 and Definition 5.6.
- **Checked myself**, in arXiv:2003.10951v2:
  - Theorem 7.4 (p.44): "Assume that R satisfies Condition (BR). … If V is horizontal de Rham, then there exists a finite extension L of K such that V|G_{R_L} is horizontal semistable." Its proof uses Theorem 7.1 (Ohkubo) and Theorem 6.1 (purity).
  - Lemma 8.9 identifies D_dR(L) with D_dR(V), compatibly with connections and filtrations, and says that L is de Rham iff V is.
  - §9.4 (proof of Theorem 9.2) applies Lemma 8.9 and then Theorem 7.4 on T^n = Spa(A, A°), exactly the paper's deduction.
  - Proposition 4.9: (B^∇_dR(R))^{G_{R_K}} = K, citing [Bri08, Corollaire 5.3.7]. Set-up 3.1 starts from O_K⟨T_1^{±1}, …, T_n^{±1}⟩, and (BR) (Definition 3.2) is R = R̃, which R_v satisfies.
  - Lemma 4.15 and Definition 5.6 are as E8 says. Definition 4.7, Lemma 4.4, Corollary 4.10, Lemma 4.12 and Theorem 9.7 exist under those numbers.
  - In Betts–Stix (p.31) the proof of Theorem 3.22 says "we have that E is potentially horizontal semistable [Shi20, Lemma 8.9]". On p.32 it uses "B_dR(R_v)^{G_{R_v},∇=0} = K_v [Shi20, Proposition 4.9]". The bibliography entry is "arXiv:2003.10951v2".
  - P8's stage text in `atlas/roadmaps/PadicHodgeTheory.json` covers period sheaves, local acyclicity, the Poincaré lemma and the proper-smooth comparison. It has no monodromy theorem. R06.3 is the absolute p-adic monodromy theorem.
- **Owner: a maintainer decision.** The items stay on route 6, beside /48–/50, and route 6's reason names the three options:
  - (a) extend P8's contract explicitly to the relative (horizontal) p-adic monodromy theorem;
  - (b) move /48–/50, /101 and /102 into route 1's Part II, which owns Theorem 3.22;
  - (c) give them to PadicHodgeTheoryPartII (DESIGN-PadicHodgeTheoryPartII, pending, order 99), the verifier's third candidate.

  Moving them now would change route 1's or route 6's contents against their review verdicts, so they are left in place.
- **No new edge.** Route 6 was already a source route to P8, so nothing new needs a cycle test.

## /5 (medium, missing): Lemma A.2 and the proof of Theorem 3.12(2): fixed

I followed the verifier's version: the lemma is ambiguous, not false in the reading its proof uses, and the real gap is on p.22.

- **/99** now reads: "… whose filtration satisfies F^pA^n = 0 for p ≫ 0 in each degree (for instance a finite filtration …), and its spectral sequence degenerates at the first page, then each H^j(A) is filtered, i.e. every H^j(F^{p+1}A) → H^j(F^pA) is injective [Del71, Prop. 1.3.2]". A note gives the two readings.
- **New source issue E7** (gap, affects the proof, known: new). Its locator is Lemma A.2, p.57, and its use in the proof of Theorem 3.12(2), p.22.
  - The printed text quotes both passages.
  - The correction restates the lemma and repairs Theorem 3.12(2): apply Lemma A.2 to Rπ_dR*E, use E₁-degeneration, then compute the tensor product's cohomology with the tensor filtration.
  - As the verifier required, the correction names flatness of every quotient Fil^a/Fil^b OB_dR,U over O_U as the ingredient this needs, and records it as missing, since [Sch13] does not state it.
  - The correction also says what [Sch13] gives towards it. Proposition 6.10 and Corollary 6.15 describe gr^i OB_dR locally as ξ^i Ô_X[X_1/ξ, …, X_n/ξ], a free Ô_X-module. Since extensions of flat modules are flat, flatness of every Fil^a/Fil^b follows from flatness of Ô_X over O_X. I did not find that flatness stated in [Sch13].
  - The reason gives the counterexample to the other reading. I checked it: gr^pA^1 = 0 for all p, E₁ = E₁^{0,0} = K, but H^1(F^1A) = K → H^1(F^0A) = 0.
- **New item /103**, "Relative Hodge–de Rham degeneration (Scholze, cited)", is missing and taken by route 6.
  - It states [Sch13, Theorem 8.8(ii)]: the relative Hodge cohomology is locally free, the Hodge–de Rham spectral sequence degenerates, and R^iπ_*𝔼 is de Rham with bundle R^iπ_dR*E.
  - It is placed with /38, as the finding asks. /38 is planned at P8, not routed. So /103 goes on route 6, P8's source route, because P8's text names the proper-smooth comparison but not this degeneration. The verifier asked for a citation, not a new argument, and that is what the item is.
  - /38's note now points to E7 and /103.
- **Checked myself.**
  - In the TeX PDF: Lemma A.2 and its proof (p.57), and the sentence on p.22 that applies it.
  - Scholze arXiv:1205.3463v2, Theorem 8.8(ii): "Then the relative Hodge cohomology R^{i−j,j}f_Hodge*(E) is a locally free O_Y-module of finite rank for all i, j, the relative Hodge-de Rham spectral sequence … degenerates, and R^if_proét*L is de Rham". The theorem assumes R^if_proét*L lisse. The item takes that from [DLLZ19, Corollary 6.3.5], as the paper does.

## /6 (low, error): the period map (5.1) uses T where T⁻¹ is meant: not applied

This is a low finding, recorded only. The verifier's fix adds a source issue for (5.1) with T⁻¹ in item /67, and records the misprint 'Z_∞ ⊆ P^N_{K_v}' (for P^N_C) in the proof of Lemma 5.6. E7 and E8 are now taken, so that fix should use E9 onwards.

## /7 (low, other): Remark 6.23(I) and E6: not applied

This is a low finding, recorded only. The verifier's fix:
- amends E6's reason with the explicit instance r_0 = 101, q = 3458351945918277637129653220997634107, which is proved prime by Pocklington, 2749 | q − 1, and K = Q(√2749) or the cubic subfield of Q(ζ_2749);
- changes the wording of the correction's ramification remark.

## /8 (low, missing): seven further slips: not applied

This is a low finding, recorded only. The verifier's fix covers seven slips:
- Remark 5.11 needs Y proper; record it as an error that affects nothing;
- Lemma 4.7 needs π proper, so add 'π proper' to /57;
- p.36: X ×_{Y′} X′ should be X ×_{Y′} X^∨;
- the index in (4.3);
- p.29: Theorem 3.3 should be Theorem 3.22;
- p.50: 'for all i' should be 'for all j';
- p.54: 'prime factors of q' should be 'of q − 1'.

It numbers them from the next free E.

## /9 (low, error): item /93 (Remark 6.23): not applied

This is a low finding, recorded only. The verifier's fix:
- makes condition (2) read 'q − 1 is not divisible by 4 or by any odd prime dividing q_v ∏_{i≤3}(q_v^i − 1)';
- adds the good-reduction qualifier to (III), 11 with n_v replaced by 2;
- optionally notes that without the modification the least q is 23.

## /10 (low, error): hypotheses dropped from /32, /44, /45, /68, /79: not applied

This is a low finding, recorded only. The verifier's fix adds the quoted hypotheses. For /32 it includes y_0 ∈ Y(K_v). For /79 it adds that type (c) is relative to d > 0 and type (a) to a finite set S.

## /11 (low, library-claim): BDeRham and the symplectic group: not applied

This is a low finding, recorded only. The verifier's fix corrects the report's library sentence. Mathlib 082e2d3 has `BDeRhamPlus` and `BDeRham` (Mathlib/RingTheory/Perfectoid/BDeRham.lean) and `Matrix.symplecticGroup`. Tau Ceti f790474 has `TauCeti.Symplectic.groupScheme`. In the note for /33, 'sections over affinoid perfectoids' should replace 'stalks'. Statuses stay unchanged. This fix cites none of these declarations.

## /12 (low, error): Example 2.2 and [Del74]: not applied

This is a low finding, recorded only. The verifier's fix adds DeligneWeightsAndPurity:DWP.7 to /11's planned layers. It also adds a low source issue: [Del74, Théorème 1.6] is projective only, and the proper case is Weil II 3.3.9 with SGA 7 XXI 5.

## /13 (low, error): /28 is missing in the paper's generality: not applied

This is a low finding, recorded only. The verifier's fix marks /28 missing and moves it to route 4's missing items. The counts would then become 1 library, 18 planned and 81 missing, before this fix's three new items.

## /14 (low, other): route 4's reading of footnote 1: not applied

This is a low finding, recorded only. The verifier's fix replaces the last sentence of route 4's reason, and of the report's route 4 paragraph, with the suggested text on [LV20, §3.4]. It rejects the finding's secondary point about 'without a model'.

## For the maintainer

These changes lie outside this job's deliverables.

- **One design job for this paper (finding 1).** The paper has two design jobs: DESIGN-BETTS-STIX (#952, order 7) and the generated DESIGN-AnabelianGeometryAndNonabelianChabautyPartII (#3475, order 146 at origin/main today). Keep DESIGN-BETTS-STIX. As the verifier recommends:
  - in `make_queue.py`'s `paper_designs`, fold any accepted `part-ii` or `new` route whose `roadmap` is the roadmap of a maintainer-fixed design job into that job, instead of generating a second job. Do not drop the route;
  - add to DESIGN-BETTS-STIX's instructions the route's brief and a pointer to `research/blueprint/papers/PAPER-BETTS-STIX-25.result.json` (route 1's brief and items, and the corrected statements under `sourceIssues`, now E1–E8);
  - make the Part III check recognise an atlas roadmap whose recorded parent is the base, not only the literal id `<base>PartII`;
  - retire #3475 once the job leaves the queue.
- **The same bug elsewhere.** The verifier found three more twins, and the dedupe should check every route's roadmap against all fixed jobs:
  - DESIGN-BCGP18 and DESIGN-BCGP25;
  - DESIGN-SKINNER and DESIGN-RankZeroOneBSDPartII;
  - DESIGN-PAN and DESIGN-CompletedCohomologyAndLocalGlobalCompatibilityPartII.

  I checked only that these jobs are pending in `queue.json`.
- **The owner of Shimizu's relative monodromy theorem (finding 4).** Items /48–/50, /101 and /102 stay on route 6 (P8) for now. Choose one of three owners:
  - (a) P8, with its contract extended explicitly to a relative (horizontal) p-adic monodromy theorem;
  - (b) route 1's Part II, which owns Theorem 3.22;
  - (c) PadicHodgeTheoryPartII, whose Guo–Reinecke proposal covers relative p-adic Hodge theory of local systems.

  Then move the items with a fix to this extraction, keeping route positions. A changed target is appended as a new route, not written into an existing slot.
- **Flatness of Fil^a/Fil^b OB_dR over O_X (finding 5, E7).** It is the missing ingredient of the repaired proof of Theorem 3.12(2). Whoever blueprints P8 (where /38 is planned) should state it, or prove it from flatness of Ô_X over O_X.
- **`research/errata/REGISTER.md`.** E1's correction changed, and E7 and E8 are new. Let `scripts/errata.py` regenerate the register; this job did not run it.
- **Review of this fix.** It should:
  - check the new items /101–/103 and route 6's changed reason;
  - give verdicts on E7 and E8 and on E1's changed correction;
  - check the restated /24, /25, /77, /78 and /99.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-BETTS-STIX-25.result.json`: ok.
- `python3 research/blueprint/intake.py check-files` on the three deliverables: 0 problems.
- **`make_queue.accepted_routes('PAPER-BETTS-STIX-25')`**, run read-only, returns all seven routes, in order and with their original targets. Route 6 has 19 items.
- **Citations.**
  - Every paper locator was read in arXiv:2204.13674v1 and its TeX source.
  - Every Shimizu citation was read in arXiv:2003.10951v2, and every Scholze citation in arXiv:1205.3463v2.
  - The stage texts of PadicHodgeTheory:P8 and R06.3 were read in `research/blueprint/atlas/roadmaps/PadicHodgeTheory.json`.
  - This fix cites no Mathlib or Tau Ceti declaration.
- No Lean was run.
