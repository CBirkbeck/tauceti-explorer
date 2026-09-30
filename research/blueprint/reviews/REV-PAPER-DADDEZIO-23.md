# REV-PAPER-DADDEZIO-23: review of the extraction of D'Addezio, *Parabolicity conjecture of F-isocrystals*

**Verdict: accept, after corrections made in place.**

- **Routes.** All six are accepted. Routes 1, 3 and 6 are corrected in place:
  - route 1 gains the stage its items need;
  - route 3 moves from a number-field layer to the function-field one;
  - route 6's brief now states its theorems exactly.
- **Mistakes.** All nine recorded mistakes are confirmed, including the gap E5 in the proof of Proposition 4.2.12. The review adds five:
  - an error in the statement of Lemma 4.4.7 that affects nothing (E13);
  - four misprints.
- **Items.**
  - One item is removed (Remark 3.1.7) and one added (item 71).
  - Twenty items are corrected.
  - The result has 70 items: 63 missing and 7 planned.
- **Version.** The published Annals text is not freely served, so everything rests on arXiv v4, the "final version, to appear". `sourceVersions` now says so in a single preprint entry.

Reviewer: Claude Code, session `cc-58621d`, 30 September 2026 (issue #1098). Extraction under review: Claude Code `cc-fb70e5` (issue #1097, PR #4272). At review it had 70 items (63 missing, 7 planned), six routes and nine `sourceIssues`, with status `complete`. `cc-58621d` appears nowhere in its files.

Sources:

- **Preprint.** arXiv 2012.12879v4 (8 February 2023, 30 pages), SHA-256 `f92379be…a07a8`, matching the record. It was posted two days after acceptance, as the "final version, to appear in Annals of Mathematics". Every finding and every ambiguous formula was read on a rendered page.
- **Version of record.** Ann. of Math. 198 (2023) 619–656, doi:10.4007/annals.2023.198.2.3. It is not freely served, so it was not read.
- **Libraries and atlas.** Mathlib 082e2d37 and Tau Ceti f790474, and the atlas as `scripts/build.py` assembles it at `e7dff59e`.

Method:
- Three read-only readers checked the items:
  - items 1–19: §§1–2 and the imported inputs;
  - §3 and §§4.1–4.2;
  - §§4.3–5.
- A fourth reader checked the routes and the other fields.
- I read §1, §4.2 (Lemmas 4.2.10–4.2.11, Proposition 4.2.12 and Theorem 4.2.13) and the statements of the final theorems myself.
- I rechecked every finding and every graph claim before applying a fix.

## 1. Items

**Removed.** Item 38, Remark 3.1.7. It asserts without proof, pointing to [Ked06], that ω_{Q_p^ur} of rigid cohomology gives a Q_p^ur-linear cohomology theory. Nothing later uses it, so it is not an item on the way to the main results (PROTOCOL §16).

**Added.** Item 71: Frobenius acts semi-simply on the cohomology of an abelian variety over a finite field.
- The proof of Theorem 5.1.6 uses it: "this Frobenius is in the centre of End(A_x)" (p. 25).
- AbelianSchemesAndArithmeticModuli A6 plans the semisimple endomorphism algebra, of which it is a short corollary, but no layer states it.
- It goes to route 6.

**Corrected statements.**
- **6.** Adds a step the proof of Proposition 4.3.5 uses: a normal subgroup of a reductive group that meets a maximal torus trivially is finite.
- **7.** The Riemann hypothesis is applied to the *crystalline* Frobenius. PadicDifferentialEquationsAndRigidCohomology RD.7, which compares crystalline and ℓ-adic characteristic polynomials, joins the planned list.
- **18.** Restated for the only case used: Chebotarev density for a smooth curve over F_q (route 3).
- **20–21.** The †-hull exists only in a †-extendable M, and "smallest" needs †-extendable subobjects to be closed under intersection, which holds because restriction is exact and fully faithful. MS is defined only for constant slopes.
- **27.** It is the *kernel* of B̃_n ↠ B_n that p^{n−1} kills; the identity ū₁ⁱtⁱ − pⁱ = p^{i−1}(ū_i tⁱ − p) was checked.
- **33, 34, 36, 37, 39, 41, 43.**
  - G(M, η) is Crew's DGal only for convergent M (33).
  - Item 34 adds the Tannakian tools §3 cites: Stalder's K/F-full faithfulness and comparison theorem, and [DE22, Prop. A.13].
  - Lemma 3.1.3 needs Hypothesis 3.1.1 (36).
  - The Dieudonné–Manin structure is the Q_p^ur-*span* of the Frobenius eigenvectors (37). The set of eigenvectors is not closed under addition once there are two slopes.
  - Lemma 3.2.2's uniqueness is "up to isomorphism" (39).
  - Remark 3.2.9's isomorphism is asserted without proof (41).
  - Corollary 3.3.6 assumes the slope filtration exists (43).
- **44, 47, 52, 59.**
  - Chevalley's theorem is for affine groups (44).
  - Proposition 4.3.2 gains §4.3's standing assumptions (47).
  - Lemma 4.4.7 is stated in the form the paper proves and uses (52; E13).
  - Theorem 5.1.2 needs (M†, Φ†_M) semi-simple as an F^n-isocrystal (59).
- **Notes.**
  - Item 1's note records what RD.3 does not name.
  - Item 5's note records that MC.6 plans only neutral Tannakian categories, while G(M, η) uses a fibre functor with values in K(Ω), which needs Deligne's non-neutral theory.
  - Item 29's note no longer credits Tsuzuki with Proposition 4.2.12 itself: [Tsu23] proves Theorem 4.2.13 and Proposition 4.2.2.

## 2. Statuses

- **Planned.** The planned items stand.
  - Items 2 and 3 are planned in RD.3 and VB0.
  - Item 3 also cites Mathlib's rank-one classification, `WittVector.isocrystal_classification`, in `RingTheory/WittVector/Isocrystal.lean`.
  - Item 4 is planned in RD.1.
  - Item 6 is planned in Tau Ceti ReductiveGroups layer 7 ("parabolic subgroups and Levi decomposition").
  - Item 5, in MC.6, holds for the neutral case; see its note.
  - Item 7 is planned in R34.2, now with RD.7.
- **Missing.** No stage mentions any of the following, and neither library has them:
  - †-hulls, minimal slopes, docility or Q_p^ur-structures;
  - observable functors, Crew's monodromy groups, Chevalley's theorem or Saavedra's filtered fibre functors;
  - Albert's classification, the Abe–Esnault Lefschetz theorem, or a Bertini theorem with tangency conditions.

  The only slope filtrations the atlas plans are local (RD.1, RD.2).

## 3. Routes

1. **RD source: accept as corrected.**
   - In the atlas RD.1 → RD.2, while RD.3 is unrelated to both. So Kedlaya's full faithfulness (items 9–10, RD.1 with RD.3) and docility and semistable reduction (items 13–14, RD.2 with RD.3) cannot sit in the listed stages.
   - RD.5 is downstream of all three and already plans "the relative local-monodromy input used in Kedlaya's proof, then devissage and alterations/descent". It is added.
   - Links needed, none closing a cycle: CrystallineCohomology CR.3 → RD.3 for Étesse (item 15) and VectorBundlesAndIsocrystals VB0 → RD.3 for item 8.
2. **R07.2: accept.**
   - BBM (item 16) needs CR.3, which is neither ancestor nor descendant of R07.2, so the link CR.3 → R07.2 is needed.
   - De Jong's theorem (item 17) goes beyond perfect fields.
   - For the orchestrator: CR.7's description exports crystals "to R07's Dieudonne crystal", but R07.2 → CR.7 is an edge.
3. **Chebotarev: accept as corrected.**
   - The route went to AnalyticNumberTheory AN.4, which is number-field only. The precedent it cited, PAPER-SCHMIDT-STIX-16's AN.4 route, was rejected.
   - The paper uses Chebotarev only for a curve over a finite field (Theorem 5.3.3), so the route now targets FunctionFieldArithmetic FA.5, which plans "a function-field Chebotarev statement".
4. **Part II of GlobalShtukasAndFunctionFieldLanglands: accept.** It coalesces exactly with PAPER-ABE-18's accepted route 2.
5. **Minimal-slope Part II: accept.** It coalesces exactly with PAPER-TSUZUKI-23's accepted route 3 and is correctly ordered before route 6.
6. **Monodromy-groups Part II: accept as corrected.**
   - Nothing else plans Crew's monodromy groups or parabolicity. PAPER-XU-ZHU-22's accepted Kloosterman roadmap should import them from here.
   - The brief's final theorems now carry their hypotheses:
     - constant slopes and a perfect point (Theorem 4.4.12);
     - constant slopes (Theorem 5.1.6);
     - the two cases of Theorem 5.2.2;
     - the hypotheses of Theorem 4.4.3;
     - the curve over a finite field (Theorem 5.3.3).
   - Its Chebotarev import is FA.5.

Coverage: every missing item is routed exactly once, and no planned item is routed.

## 4. Source findings

**E1–E9 are confirmed** on the rendered pages.

**E5** is the substantive one. The proof of Proposition 4.2.12 claims that inf{‖f_n(m)‖ : m ∈ Q_{W,n} ∖ pQ_{W,n}} = p^{−s_n}, so that the p^∞-torsion of P_W/f(Q_{W,n}) is bounded.
- For N = M trivial of rank one, every element of A_n has u^{nj}-coefficient of valuation at least j. So p^j u^{nj} lies in A_n but not in pA_n, while its norm p^{−j} tends to 0.
- The infimum is therefore 0, and the torsion is unbounded.
- In this example the needed injectivity still holds, so the fault is in the argument, not the statement.
- Theorem 4.2.13, the proposition's only use, is independently [Tsu23, Prop. 6.1].

**E8** is a misstatement, not merely a slip. A proper parabolic subgroup is not normal. What the proof needs is that G(M†, η) is normal in the arithmetic group, and then its intersection with the parabolic is parabolic.

**E10–E14 are new.**

| id | kind | where | finding |
|---|---|---|---|
| E10 | misprint | Theorem 1.1.3, p. 2 | "two case" |
| E11 | misprint | proof of Lemma 3.2.3, p. 9 | "(M, Φ_M) irreducible" for (M, V_M); with the printed hypothesis, M = L ⊕ F*L shows the next sentence can fail |
| E12 | misprint | proof of Lemma 4.1.4, p. 12 | the chain starts ⊕(Fⁱ)*N where ⊕(Fⁱ)*S₁(N) is meant |
| E13 | error | Lemma 4.4.7, p. 21 | "for every quotient H ↠ G with G cyclic" is false (Π = H = Z_p, n = 1, G = Z/p²); the proof covers, and Lemma 4.4.6 uses, only prime-order quotients |
| E14 | misprint | proof of Lemma 4.4.7, p. 21 | "distinguish to cases" |

None of E10–E14 affects a stated result used later.

The §§4.3–5 reader also raised two questions on Theorem 5.2.2. The first is its reduction to a geometrically simple A. The second is its use of Corollary 5.2.1 for a unit-root quotient, which implicitly needs the dual statement. Neither could be settled into a finding, and both are recorded in the readers' notes, not in the file.

## 5. Other fields

- **`sourceVersions`.** It had a "published" entry saying the Annals text was not read, so `collation.py` classified the paper as read in its published version. That entry is now folded into the v4 entry's note, and the classification is preprint.
- **`summary`.** It no longer calls the missing RD foundations planned, and it counts fourteen mistakes.
- **PAPER-DADDEZIO-23.md.** It gains a post-review summary. It now calls the two coalesced Part IIs accepted, not pending, and corrects the Schmidt–Stix precedent.

## 6. For the orchestrator

- **Links needed**, none closing a cycle:
  - CrystallineCohomology:CR.3 → PadicDifferentialEquationsAndRigidCohomology:RD.3 and → FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2;
  - VectorBundlesAndIsocrystals:VB0 → RD.3.
- **CR.7 and R07.2** disagree about where the Dieudonné crystal is built.
- **KloostermanSheavesAndBesselIsocrystals** (PAPER-XU-ZHU-22) should import Crew's monodromy groups from route 6's Part II.

## 7. Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-DADDEZIO-23.result.json`: ok.
- `source_issues.check_issues` and `check_errata.versions_checked`: no errors.
- **Intake file validation** on the four deliverables: 0 problems.

Pre-review inputs at `e7dff59ef0d5995904be8ca352560510acd7a5bb` (SHA-256):

| Input | SHA-256 |
| --- | --- |
| PAPER-DADDEZIO-23.result.json | `3dc47a0e74fcf19057e6d236128d84caa1b0e885b0b78b73dbc9d741244405f7` |
| PAPER-DADDEZIO-23.md | `feca0bbe458d3d449d0d87777fd810c9cd37a0eeeba636c3440e956d33efb4ba` |
| data/atlas.json | `62ab6c2ccb94ee9c4d99813da02b69656941721d30fc29384e2b7e6e86361c56` |

No Lean file is a deliverable, and no Lean was run.
