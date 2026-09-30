# RT-PAPER-BETTS-STIX-25: red team of the Betts–Stix extraction

Red team: Claude Code, session `cc-f805bf`, 30 September 2026 (issue #4326).

**Target.** `PAPER-BETTS-STIX-25` is the extraction of L. A. Betts and J. Stix, *Galois sections and p-adic period mappings*, [Ann. of Math. 201 (2025), 79–166](https://doi.org/10.4007/annals.2025.201.1.2). The preprint is [arXiv:2204.13674](https://arxiv.org/abs/2204.13674); v1 is the only version.

**Who did what.**
- `cc-442dc5` wrote the extraction (issue #2175).
- `REV-PAPER-BETTS-STIX-25` (`cc-7b31c4`, issue #2176) accepted it unchanged.
- I did neither job.

**Disclosure.** This session wrote FIX-RT-AUDIT-07, whose finding /6 concerned MordellLawrenceVenkatesh:LV.6 (the S-unit theorem duplicate). No finding below touches LV.6. Findings 13 and 14 concern LV.3 only.

**Result: fourteen findings.** One is high, four are medium and nine are low.

- **Where the extraction is sound:**
  - every numbered statement has an item, and most statements are faithful;
  - E1–E6 all hold, E1 and E6 with the qualifications below;
  - the single library citation, Dirichlet's theorem, is right.
- **The high finding:** one item widens a proposition until it is false.
- **The medium findings:**
  - the paper is queued for design twice;
  - E1's alternative repair is wrong;
  - the key external input of §3, Shimizu's theorem, has no item and no owner;
  - a lemma in the appendix hides a gap that nobody recorded.

The machine-readable file is [RT-PAPER-BETTS-STIX-25.result.json](RT-PAPER-BETTS-STIX-25.result.json).

## Source

Fetched on 30 September 2026.

| Text | Where | SHA-256 |
| --- | --- | --- |
| arXiv v1 PDF (59 pp.) | [arXiv](https://arxiv.org/pdf/2204.13674v1) | `7d4b7d49…0c18` (matches the extraction) |
| arXiv v1 e-print (TeX) | [arXiv](https://arxiv.org/e-print/2204.13674v1) | `0905aedc…7f11` |

- **Versions.** arXiv lists only v1 (28 April 2022).
- **The published text could not be read.**
  - The [Annals page](https://annals.math.princeton.edu/2025/201-1/p02) shows only the abstract. The text was revised on 24 May 2024.
  - The DOI resolves to Project Euclid, which served an Incapsula bot block.
  - Unpaywall lists no open copy.
- **Scope.** Every locator and finding here refers to arXiv v1.
- **How I read it.**
  - I re-read the whole paper in the TeX and checked page locators against the PDF text layer. The bundled `prelims.tex` is an unused draft and was ignored.
  - Sub-agents read the sections in parallel. I re-checked every finding filed here at its TeX line and PDF page.

## What held

- **Items.** Most statements are faithful, and these are exact:
  - Theorems A and B: no CM subfield, genus ≥ 2, smooth projective, every finite v;
  - Theorem 6.5 and Theorem 7.1;
  - Definitions 1.1 and 4.1, and the S-good pairs;
  - Propositions 6.9, 6.15 and 6.20, and Corollary 6.22.
- **Recorded mistakes.**
  - E1's ε³ counterexample is valid: nothing in the paper's definition of a symplectic pair forces A to be reduced.
  - E2's trace gap and its Frobenius repair are right.
  - E3 holds: (3.8), Proposition 3.19(2) and Proposition 3.20(7) are all stated for smooth proper varieties. Both repairs work on any smooth proper X, via O(D₁ − D₂) or via P(L ⊕ O).
  - E4 and E5 are misprints as described.
  - E6 holds. Finding 7 gives an explicit instance.
- **Library.**
  - `Nat.forall_exists_prime_gt_and_eq_mod` (Mathlib `082e2d3`, `PrimesInAP.lean:442`) plus CRT gives the q of Corollary 6.22.
  - None of the items marked missing exists in either library.
- **Planned statuses.** I read every cited layer: NC.0, IG.1, RP.3, R34.1, DWP.4, R06.2, R06.3, R06.5, P8, CP.6, A4, and LV.0–LV.11.
  - LV.1 does not plan LV Lemma 2.6, so route 2 is right to take /12 and /13.
  - LV.3 plans /59, /63, /65 and /68, but not /28 (finding 13).
- **Duplication with other extractions.** None of them routes the same items. I compared:
  - Lawrence–Venkatesh 2020 and Lawrence–Sawin 2025;
  - Balakrishnan–Dogra–Müller–Tuitman–Vonk 2019 (NC.2, NC.5);
  - Scholze 2013 (P8, which agrees with route 6);
  - Liu–Zhu 2017;
  - Kedlaya–Liu 2015;
  - Schmidt–Stix 2016 and Bresciani 2024 (different anabelian directions).
- **Prerequisites.** All five DOIs resolve to the cited works.

## Findings

### 1. The paper is queued for design twice (medium, duplicate)

**What the queue does.** Since commit 7685a59f (28 September), `make_queue.py` builds one design job per Part II parent from the accepted routes (l. 423). Route 1 is the only Part II route to AnabelianGeometryAndNonabelianChabauty. So the queue now has two jobs for the same material:
- **DESIGN-BETTS-STIX** (issue #952, order 7, roadmap `GaloisSectionsPadicPeriodMaps`). This is the maintainer's job, and its brief never mentions the extraction.
- **DESIGN-AnabelianGeometryAndNonabelianChabautyPartII** (issue #3475, order 145). Its only continuation is route 1, "(48 items)".

**Why both survive.** They are deduplicated only by job id (l. 925). Both issues are labelled `state:available`, and neither has an `after`.

**Consequences.**
- Whichever job runs second will plan Selmer sections, the principal trichotomy and Theorems A, B, 6.5 and 7.1 a second time, under another roadmap id.
- The job that runs first does not know the extraction's items or its corrected statements.

**Fix.** Keep DESIGN-BETTS-STIX, and point it at the extraction. Have `paper_designs` skip a route whose roadmap already has a fixed design job, which retires #3475.

### 2. Item /24 makes Proposition 2.19 false (high, error)

**The change.** The paper states Proposition 2.19 for χ: G_K → **Q_p**^× (p. 13). The item has Q̄_p^×.

**Counterexample.** Take K = Q(i) and p ≡ 3 mod 4, so v = (p) is inert and self-conjugate. Let E: y² = x³ − x, which has CM by Z[i] over K. G_K acts on V_pE through ρ: G_K → Q_{p²}^×.
- χ = ι∘ρ is pure of weight 1 and de Rham.
- So "n is even" fails at a self-conjugate place.
- The Hodge–Tate weight r_v is not even well defined, because χ|G_v is Lubin–Tate for Q_{p²}.

**Knock-on.** Item /25 inherits the error.

**Fix.** Restore Q_p^×.

### 3. Σ_A is the Q_p-points of A, and "reduced" does not rescue E1 (medium, error)

**What the paper says.** Σ_A = Spec(A)(Q_p) (p. 45; Proposition 1.8, p. 5).

**What the extraction does.**
- Item /78 silently takes Q̄_p-points instead.
- E1 offers the repair "or assume A reduced (hence étale), where #Σ_A = dim A". That repair is false.

**Counterexample.** Let A = Q_{p²} with trivial action, V = A ⊗ H¹(E) and L = A(−1).
- The pair is étale and S-good.
- But Σ_A = ∅, so (a) and (b) fail, and (c) asks 0 ≥ 1.

**What the applications need.** They need A **split**, A ≅ Q_p^n. They have it, since H⁰ = ∏ Q_p (Remark 6.6).

**Fix.** Correct /78, /77, /79 and E1's correction. The #Σ_A repair stands.

### 4. Shimizu's relative p-adic monodromy theorem has no item and no owner (medium, missing)

**What the paper uses.** Theorem 3.22, and through it Theorem 3.3 and all of §§4–7, rests on two results of Shimizu:
- [Shi20, Lemma 8.9] (p. 31): a de Rham local system on a polyannulus with a full basis of horizontal sections is potentially horizontal semistable;
- [Shi20, Proposition 4.9] (p. 32): B_dR(R_v)^{G_{R_v},∇=0} = K_v.

**What the extraction does.**
- Neither result is an item. Lemma 8.9 appears only in the prerequisites entry.
- Route 6 sends Shimizu's period ring (/48–/50) to P8. P8's contract, "Shared relative period sheaves", plans no monodromy theorem.

**Fix.**
- Add the two items.
- Have the maintainer choose the owner: an explicit extension of P8, or the Part II, which already owns Theorem 3.22.

### 5. Lemma A.2 hides a gap in Theorem 3.12(2) (medium, missing)

**The lemma** assumes a filtration "bounded below in every degree" and reduces to the degreewise bounded case. If "bounded below" means F^pA^n = A^n for p ≪ 0, the lemma is false.

**Counterexample.** Take A⁰ = A¹ = K with d = id, F^pA⁰ = K for p ≤ 0 and 0 for p ≥ 1, and F^pA¹ = K for all p.
- The spectral sequence degenerates at E₁.
- But H¹(F¹A) = K → H¹(F⁰A) = 0.

**The application.** The paper applies the lemma (p. 22) to OB_dR ⊗ Rπ_dR*E. Its filtration is bounded in neither direction. The same step also uses, without citation, that the relative Hodge–de Rham spectral sequence degenerates.

**Fix.**
- Record a new source issue, E7.
- Restate /99 for finite filtrations.
- Repair the step through strictness and the flatness of OB_dR.
- Add an item for the degeneration.

### 6. §5 writes T where T⁻¹ is meant (low, error)

**The slip.** T solves dT = −ωT, so T is the parallel transport E_{y₀} → E_y. The pull-back filtration is spanned by the columns of **T⁻¹**, not those of T (p. 41). For example, T = [[1,0],[a,1]] gives (1 : −a), not (1 : a).

**Effect.** Nothing downstream changes, because T⁻¹ solves d(T⁻¹) = T⁻¹ω.

**Where it appears.**
- Item /67 copies the slip.
- The proof of Lemma 5.6 also writes P^N_{K_v} where P^N_ℂ is meant.

**Fix.** Record a new source issue, E8.

### 7. Remark 6.23(I) fails for the q it chooses (low, other)

**The instance.** Take r₀ = 101.
- The least prime q ≡ 3 mod 4 with q ≡ 2 modulo every odd prime below 101 is q = 3458351945918277637129653220997634107 (a strong probable prime).
- 2749 divides q − 1.
- Take K = Q(√2749), or the cubic subfield of Q(ζ₂₇₄₉). K has no CM subfield, and r₀ = 101 is admissible for it.
- Yet K ⊂ Q(ζ_{q−1}).

**What this shows.** E6's reason, "Q(√±r) … if [K′:Q] is even", is too narrow. E6's fix is right.

### 8. Seven more mistakes are unrecorded (low, missing)

- Remark 5.11 uses compactness of Y(K_v), but Corollary 5.10 assumes only "a smooth curve". A counterexample is the Legendre family with C = {p^{−n}}. Item /70 copies this.
- Lemma 4.7 needs π proper as well as smooth. Item /57 copies this.
- The Poincaré bundle should be on X ×_{Y′} X^∨ (p. 36).
- The indexing in (4.3) is wrong (the companion of E4).
- "Proof of Theorem 3.3" should read 3.22 (p. 29).
- "for all i" should read "for all j" in the proof of Lemma 6.17 (p. 50).
- "prime factors of q" should read "q − 1" (p. 54).

### 9. Item /93 misstates Remark 6.23 (low, error)

- "q − 1 is prime to 4" can never hold. The paper says "not divisible by 4".
- (III) drops "with the modification of (3) for good reduction". Without it, q = 11 fails for n_v = 7, because 0.0570 > 1/26.

### 10. Dropped hypotheses (low, error)

- /32: π smooth proper, and a polydisc with a full horizontal basis.
- /44 and /45: X smooth proper, which is exactly E3's hypothesis.
- /68: Y geometrically connected.
- /79: constant relative dimension d > 0, and S suitable.

### 11. Relevant declarations are not cited (low, library-claim)

- Mathlib's `BDeRhamPlus` and `BDeRham` (`BDeRham.lean:77, 90`) are the rings behind D_dR (/14, /16) and B⁺_dR,U (/33).
- `Matrix.symplecticGroup` and Tau Ceti's `TauCeti.Symplectic.groupScheme` (`Symplectic/Basic.lean:122`) are relevant to /12, /54 and /68.

No status changes. The report's library paragraph and the item notes should cite these declarations.

### 12. Item /11 names a projective-only layer (low, error)

The item states purity and integrality for a smooth **proper** X. DWP.4 is projective-only, and DWP.7 owns the proper case. The paper cites Weil I, which also covers only the projective case. Every use in the paper is for abelian varieties.

**Fix.** Restrict /11 to smooth projective X, or add DWP.7.

### 13. Item /28 is not planned in LV.3 (low, error)

**The mismatch.**
- LV.3 plans the residue-disk period map of a good model with K_v unramified and p > 2.
- Definition 3.1 is model-free and works for any K_v.
- The extraction itself routes the parallel transport that Definition 3.1 is built from (/27) as missing.

**Fix.** Mark /28 missing.

### 14. Route 4 misreads footnote 1 (low, other)

**What the footnote says.** LV's §3.4, which covers only K-centred discs, does not prove the obstruction statement (2°). It does not say that LV's own Mordell argument needs K_v-centred discs.

**A related slip.** "Without a model" describes §3, not §5.

**Fix.** Reword route 4's reason and the report.

## Checks

- `python3 scripts/check_redteam.py research/blueprint/redteam/RT-PAPER-BETTS-STIX-25.result.json`: ok.
- `python3 research/blueprint/intake.py check-files` on both deliverables: 2 files, 0 problems.
