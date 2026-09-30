# RT-PAPER-KHARE-WINTENBERGER-09-II: red team of the extraction of Khare–Wintenberger, *Serre's modularity conjecture (II)*

Red team: Claude Code, session `cc-f805bf`, 30 September 2026 (issue #4602).

**Target.** `PAPER-KHARE-WINTENBERGER-09-II` extracts C. Khare and J.-P. Wintenberger, *Serre's modularity conjecture (II)*, [Invent. Math. 178 (2009), 505–586](https://doi.org/10.1007/s00222-009-0206-6). The extraction has:

- 340 items: 304 planned, 7 library, 29 missing;
- 11 source routes;
- 32 source issues.

**Who did what.**
- Claude Code `cc-48533a` wrote the extraction (PR #4560).
- Claude Code `cc-fb70e5` wrote `REV-PAPER-KHARE-WINTENBERGER-09-II` (PR #4562). It accepted all routes, confirmed 31 source issues and rejected E13.
- I did neither. The string `cc-f805bf` occurs in none of the four target files.

**Disclosure.**
- **BCDT review.** This session reviewed PAPER-BREUIL-CONRAD-DIAMOND-ETAL-01 (PR #4658). That extraction routes to:
  - ClassicalSerreModularity R26.1/R27.6;
  - GL2ModularityLifting R22.5;
  - LocalGaloisDeformationRings R08.3/R08.6;
  - FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1/R07.4.
- **Findings that touch the same layers.**
  - Findings 5–7 touch LocalGaloisDeformationRings R08.6 export nodes.
  - Finding 9 touches the R22.5 node kisin-potentially-bt-lifting.
  - None of them depends on the conclusions of that review.
- **KW I red team.** This session red-teamed KW I (PR #4744). No finding here repeats a KW I finding.
- **FIX-RT-AREA-automorphic-1.** This session wrote that fix, which amended GL2AutomorphicRepresentationsAndTransfer R16.x–R17.5. Finding 13 cites R16.2's stage text but does not depend on the fix.

**Result: 16 findings, 10 medium and 6 low.** The machine-readable file is [RT-PAPER-KHARE-WINTENBERGER-09-II.result.json](RT-PAPER-KHARE-WINTENBERGER-09-II.result.json).

- **Where the work is sound.**
  - The item-level reading is careful, and the locators are right.
  - All twelve library declarations hold at the pins.
  - E29, E11, E19 and E14 re-derive correctly.
  - The review's rejection of E13 is right: I rendered p. 39, and the bar is printed as an overline.
- **Where it breaks.**
  - The routing of §8 creates dependency cycles.
  - Grunwald–Wang gets a second owner.
  - Several planned statuses reach p = 2, or general unramified F_v, only on paper.

## Source

| Text | Where | SHA-256 |
| --- | --- | --- |
| Authors' copy, 98 pp., dated 30 May 2009 | [proofs.pdf](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), fetched 30 September 2026 | `53f45f8b…c86ed4` (matches the extraction) |

- **How I read it.** I read the whole text, dividing the sections among parallel readers. I re-checked every finding filed here myself at its locator.
- **Kisin.** I read the text of Kisin's Annals article for Corollary 3.1.11.
- **Version of record.** I did not read the Springer version of KW II. Findings that quote it are scoped to the authors' copy.

## Findings

### 1. The routing of §8 creates dependency cycles (medium, error)

**The routing.** Theorems 8.2 and 8.4 go to SerreWeightAndLevelOptimisation R20.6 (route 11). Their proofs use four items that other routes place after R20.6:

| Item | Content | Used in | Routed to |
| --- | --- | --- | --- |
| /252 | Lemma 7.10 | proof of Theorem 8.2 (p. 73) | GL2ModularityLifting R22.1 |
| /254 | the character ψ of §8.1 | Theorem 8.2 (p. 71) | GL2ModularityLifting R22.1 |
| /273 | Kisin's Corollary 3.1.11 and Lemma 3.5.3 | proof of Theorem 8.4 (p. 76) | GL2ModularityLifting R22.4 |
| /209 | Khare's Lemma 2.2 | proof of Theorem 8.2 (p. 73) | PotentialModularityAndCompatibleSystems R23.3 |

**Why this is a cycle.**
- R22.1 requires R20.6, and R22.4 comes after R22.1. So R20.6 would need layers that need R20.6.
- The R23.3 KW node imports Theorem 8.2, and R20.6 would need R23.3 for Khare's lemma.
- The R22.1 packet already asks R20.6, not R22.4, for Kisin's level changes.

**Fix.**
- Move /252, /254 and /273 to R20.6, or earlier.
- Move /209 to R18.3, together with Taylor's neatness lemma (/272), or to R20.6.

### 2. Grunwald–Wang has two owners (medium, duplicate)

**The conflict.**
- Route 8 sends Grunwald–Wang to InverseGaloisAndArithmeticFundamentalGroups IG.4.
- BCGE-25/84, BCGP-21/189 and ALLEN-23/328, all accepted, route the same theorem to ArithmeticGaloisDuality R02.2/R02.4. They also route the lemma that a character becomes a square after solvable base change, which is Lemma 7.10's p = 2 case.
- IG.4's stage text does not mention Grunwald–Wang.

**Fix.**
- Choose one owner. R02.2/R02.4 is the natural choice.
- Add p. 69 to /210's locator.

### 3. The §4 presentations are planned only for p > 2 (medium, error)

**The problem.**
- Items /143, /150, /151 and /153 cite R04.3 nodes whose hypotheses are "p > 2" in Gee's conventions. Those nodes use ad⁰(1) and frame only finite places.
- KW's p = 2 case needs three things those nodes lack:
  - the correction δ_2;
  - the dual (Ad⁰)*(1) ≅ Ad/Z;
  - framed infinite places.
- Lemma 4.4(2) (/144) has no node at all.

**Fix.**
- Request the p = 2 forms from GlobalGaloisDeformations.
- Cite the R03.2 decomposition node where it applies.
- Make /144 missing.

### 4. Theorem 6.1 at p = 2 rests on an unitemised claim (medium, missing)

**The problem.**
- On p. 55 KW assert without proof that Taylor's moduli problem has local points at 2 and at the auxiliary primes "as for p ≠ 2".
- No item records this.
- Every Taylor node in R23.2/R23.3 is stated for odd l.

**Fix.** Add an item, route it to R23.2 with a request, and flag /185, /186 and /204.

### 5. A missed source error: Savitt's ring at k(ρ̄_p) = 2 (medium, error)

**What the paper claims.** §3.2.4 (p. 24) gives 𝒪[[T₁,T₂]]/(T₁T₂ − p) for every irreducible ρ̄_p with p odd.

**Why it fails at k(ρ̄_p) = 2.**
- The weight-two type (ω^{k−2} ⊕ 1, 0) is then trivial.
- The lifts are the crystalline weight-2 lifts of §3.2.3, whose ring is formally smooth (𝒪[[T]]).
- Savitt's irreducible case needs a type ω̃^i ⊕ ω̃^j with i ≢ j. The atlas node R08.4/savitt-weight-two-rings states it that way.
- The two rings are not isomorphic: their special fibres differ.

**What it affects.** Theorem 3.1 is unaffected. Items /92 and /93, and R08.6/export-weight-two-irreducible, are wrong at k = 2.

**Fix.** Restrict them to 3 ≤ k(ρ̄_p) ≤ p and add a source issue.

### 6. §3.2.3 at k = p and p = 2 has no supplier (medium, error)

**The problem.**
- The cited Fontaine–Laffaille node (L7) needs Fil^{p−1} = 0, so it covers only k ≤ p − 1 with p odd.
- KW themselves only assert that the argument "extends".

**Fix.** Restrict /91's planned coverage and request the extension from R08.6.

### 7. Planned statuses that no node supports (medium, error)

**The items.** /32, /60, /291 and /310 are marked planned, but their own notes say no node states them.

**One node is wrong.** For /291, R22.6/dyadic-patched-ring sets D_m = D′_m/(d_m − 1). The paper (p. 85) calls that ring D″_m and only asks that ker(D″_m → D_m) ⊂ 𝔪^m.

**An inconsistency.** Lemma 3.5 is handled unevenly: parts (i) and (iii) (/83, /86) are planned, while part (ii) (/85) is missing for the same reason.

**Fix.** Make /32, /60, /291 and /310 missing and route them. Treat /83, /85 and /86 alike.

### 8. Kisin's Corollary 3.1.11 is misstated (medium, error)

**The problem.**
- Item /273 makes the corollary's hypothesis the Eisenstein support of the kernel. That is the Ihara-type input: Kisin's Lemma 3.1.8, and KW's Lemma 7.1.
- The corollary's actual hypothesis is the level-raising congruence (T_λ² − ψ(λ)(N(λ) + 1)²) S ⊂ m S. It also needs S(U, O)_m ≠ 0 and a non-Eisenstein m.

**Fix.** Restate the item with those hypotheses.

### 9. KW I Theorem 4.1 is planned at a node with a proof that cannot work (medium, error)

**The problem.**
- R24.4/kw-theorem-4-1 proves every case by Theorem 9.7 after base change.
- Theorem 9.7 needs F unramified at p, and its type (A) allows weight p + 1 only when k(ρ̄) = p + 1. So it cannot reach two kinds of lift:
  - potentially Barsotti–Tate lifts with wildly ramified type;
  - crystalline weight-(p + 1) lifts with k(ρ̄) = 2.
- §10.2 cites Kisin, Berger–Li–Zhu, Diamond, Wiles and Taylor–Wiles for exactly these cases.

**Fix.** Split /313 and /314 case by case to the nodes that plan those theorems, and send a request to R24.4.

### 10. Missing items that are partly planned or in the library (medium, library claim)

**Item /34: regularity and completion.**
- Tau Ceti's ModularCurves layer 4D plans the completion half.
- BIP-23/052, accepted, marks the same statement planned.

**Item /98: Kummer theory over F^nr.**
- Tau Ceti's ProfiniteCohomology layer 9 plans the Kummer isomorphism for any field.
- The library already has `TauCeti.kummerMap` and `TauCeti.ker_kummerMap` (FieldTheory/GaloisCohomology/Kummer.lean:187, 260).
- The KW-specific rest belongs with Lemma 3.7 in R08.6, not R02.5.

**Item /340.** Its note overlooks Mathlib's `Polynomial.isRegularRing_of_isRegularRing`.

### 11–16 (low)

11. **Jacobson facts routed twice.** The Jacobson facts /31 and /36 are routed to R03.4, while BIP-23/031–032 route the same facts to R03.1/R03.3.
12. **SL₂ cohomology owner.** H¹(SL₂(𝔽_{2^r}), M₂(𝔽)) = 0 (/141) belongs with R02.6/sl2-adjoint-h1-vanishing, its odd-characteristic analogue. R01.4 plans only subgroup facts.
13. **Definitions without items.** Two have none:
    - Serre's weight k(ρ̄) and k(ρ̄_v), including KW's convention for F_v ≠ ℚ_p (planned at R15.4);
    - newvector theory for GL₂(F_v) (planned at R16.2).
14. **Details in E8 and E17.**
    - E17's `known` cites PotentialModularityAndCompatibleSystems/E2, which is the "part (c)" misreference (E28 here), not the ℓ_i = 2 gap.
    - E8's correction is wrong at p = 2, where an unramified ρ̄_v does have k = 2 and crystallinity is imposed.
15. **Non-compact levels at p = 2.** The R19.4 and R19.6 nodes behind /221 and /223 take U open compact. They cannot accommodate KW's U_v = D_v^× at Σ₀ when p = 2. The R19.4 node also repeats E19.
16. **Two inaccurate notes.**
    - /129 claims R04.4 records the variable-determinant form of Proposition 4.1. It does not.
    - /317 says the Hasse invariant has no node, but R15.3 plans it.

## What I checked

The full list is in `checked` in the result file.

- **Items.** All 340, against the text, with hypotheses and locators. For planned items, every node their notes name.
- **Library claims.** All twelve library declarations, at the pins.
- **Missing items.** All 29, searched across:
  - packets, requests, reserved ids and stage texts;
  - the declaration index.
- **Routes.**
  - The eleven route stages.
  - The stage chain from R20 through R22 to R24.
  - Every accepted extraction touching the same mathematics.
- **Source issues.**
  - All 32 were checked at their locators. E29, E11, E19 and E14 were re-derived, and p. 39 was checked on the page image.
  - One missed error was found (finding 5).
