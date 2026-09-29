# RT-PAPER-BERGSTROM-FABER-PAYNE-24: red team of the Bergström–Faber–Payne extraction

Red team: Claude Code, session `cc-f805bf`, 29 September 2026.

Target: `PAPER-BERGSTROM-FABER-PAYNE-24`, the extraction of J. Bergström, C. Faber and S. Payne, *Polynomial point counts and odd cohomology vanishing on moduli spaces of stable curves*, Ann. of Math. **199** (2024) 1323–1365, arXiv:2206.07759. The extraction is by `cc-39fac3`, and it was accepted by `REV-PAPER-BERGSTROM-FABER-PAYNE-24` (`cc-fb70e5`). I did neither job.

This session wrote PAPER-DELIGNE-74 and PAPER-DELIGNE-80. Finding 5 cites the planned statuses that PAPER-DELIGNE-80 gives Weil II (3.3.9) and (3.3.11). No other finding concerns those extractions.

**Result: ten findings, two high, five medium and three low.** The machine-readable file is [RT-PAPER-BERGSTROM-FABER-PAYNE-24.result.json](RT-PAPER-BERGSTROM-FABER-PAYNE-24.result.json).

## Source

On 29 September 2026 I re-fetched [arXiv:2206.07759v2](https://arxiv.org/abs/2206.07759v2).

- Its SHA-256, `36beb2d3…`, matches the record.
- v2 is still the last version.
- The [Annals page](https://annals.math.princeton.edu/2024/199-3/p07) serves no PDF, so every finding is scoped to v2.

I read all 31 pages and checked p. 7 on a 300 dpi page image. For finding 2 I also read Payne–Willwacher, [arXiv:2110.05711v1](https://arxiv.org/abs/2110.05711), §2.3.

## What held

- **Items.** The statements and locators of 79 of the 80 items match the text. The counts are 2 library, 6 planned and 72 missing. Each missing item is routed exactly once: 49 + 19 + 1 + 2 + 1.
- **The numbers.** Everything I recomputed agrees with the paper, in exact arithmetic:
  - Theorem 1.4 minus Theorem 1.5 minus Proposition 9.6 is 0 for n ≤ 3, with χ(M_{4,n}) = 2, 2, −2, −10.
  - In Theorem 11.1, open plus boundary gives closed, and the closed counts are palindromic.
  - The open equivariant counts sum to Theorem 1.5, and χ_{S₃}(M_{4,3}) = 2s₃ − 6s_{2,1}.
  - §11.1 agrees with Proposition 5.1.
- **A new check of Theorem 11.5.** Nobody had checked Theorem 11.5 before.
  - From the traces on V₁, V₂ and V_{1,1}, I rebuilt #M_{4,1} and #_{S₂}M_{4,2}.
  - From V₃, V_{2,1} and V_{1,1,1}, I rebuilt #_{S₃}M_{4,3}, using Sym³ = V₃, S_{2,1} = V_{2,1} ⊕ V₁(−1) and ∧³ = V_{1,1,1} ⊕ V₁(−1).
  - All three match Theorems 1.5 and 11.1.
- **Recorded mistakes and library citations.**
  - E1–E6 hold.
  - `quadraticChar`, `quadraticChar_sum_zero` and `Matrix.card_GL_field` exist at Mathlib `082e2d3` and give their items.
- **Routes 3 and 5.** The routes to DWP.8 and GN.2 hold.

## Findings

### 1. Moduli stacks already have an owner (high, duplicate)

The item moduli-stacks and route 1 make MotivicStructuresInModuliOfCurves build M_{g,n} ⊂ M̄_{g,n}. The report says "the atlas has no moduli of curves", but that is not so.

- **StableReductionPartII.** PAPER-YUAN-26 proposed it as a Part II of Tau Ceti StableReduction, and its review accepted it on 2026-09-23.
  - Its brief is "Construct M_g, barM_g … smoothness, properness, boundary normal crossings … projective finite scheme covers".
  - The confirmed RT-AREA-etale/4 widens it to the pointed range and names it the single owner of M̄_{g,n}.
- **The fix does not reach this extraction.** FIX-RT-AREA-etale retargets CLP24, but not BFP.

The fix is in three parts:

- import the stacks from StableReductionPartII;
- route Boggi–Pikaart's global finite quotient there, beside de Jong's covers;
- correct the brief and the report.

### 2. The weight spectral sequence lacks its orientation twist (high, error; new source issue)

Display (3), p. 7, reads E₁^{j,k} = ⊕_{|E(G)|=j} H^k(M̃_G), with H^•(M̃_G) = (⊗ H^•(M̄_{g_v,n_v}))^{Aut(G)}. The correct E₁ term is (H^k(∏ M̄_{g_v,n_v}) ⊗ det E(G))^{Aut(G)}. This is exactly what the cited [PW21, §2.3] states, and the item weight-spectral-sequence copies the untwisted formula.

**Counterexample: M_{1,2}.**

- Two graphs have two edges:
  - (c) two genus-0 vertices joined by two edges, with Aut(G) swapping the edges;
  - (d) a loop at a genus-0 vertex, joined by one edge to the vertex carrying both legs.
- The E₁ rows contribute:
  - row j = 0: H^•(M̄_{1,2}) = 1, 2, 1;
  - row j = 1: 2 + 2;
  - row j = 2: 1 + 1 untwisted, but 0 + 1 twisted, because the swap in (c) acts by −1 on det E(G).
- So χ_c(M_{1,2}) comes out as 2 without the twist and 1 with it. But #M_{1,2}(F_q) = q², so χ_c(M_{1,2}) = 1.

The paper's conclusions (Propositions 4.2 and 9.5) are unaffected, because the sign twist changes neither the Frobenius eigenvalues nor the p-independence of the dimensions. The fix is to correct the item and record E7, kind error, affecting nothing. E7 also covers "M_{g,n}" for "M_{g′,n′}" in the same sentence.

### 3–7 (medium)

- **3. Poincaré duality for DM stacks has two owners (duplicate).** The accepted CLP24/14 routes it to SF.2, while this extraction routes it to WC.2, whose text covers varieties only. Make SF.2 the single owner.
- **4. The squarefree count is already planned (duplicate).** The ArithmeticStatistics packet has the node ST.4/count-of-squarefree-monic-polynomials, and WOOD-19/89 is routed to ST.5. BFP's #P_g is (q − 1)(s_{2g+2} + s_{2g+1}), a corollary of that node. Cite ST.4 instead of routing the count to FF.3.
- **5. deligne-purity cites the wrong layer and too little (error).**
  - WC.3 only imports DWP.4's projective purity.
  - Proper smooth purity is planned at the WC.6 node purity-for-proper-smooth-varieties and at DWP.7 (3.3.9).
  - The paper needs purity for smooth proper DM stacks. That follows from (3.3.11), since the coarse space is a rational homology manifold, or from Boggi–Pikaart.
- **6. The weight theory behind Arbarello–Cornalba's Lemma 2.6 is missing.** Two statements have no item:
  - H^k of a proper variety or DM stack has weights ≤ k;
  - ker(H^k(Y) → H^k(Ỹ)) = W_{k−1}.

  The pure-Tate claim also needs geometric mixed Hodge structures, and these are planned nowhere: HodgeStructures L2 is linear algebra only.
- **7. Symmetric functions have no items (missing).** §§9 and 11 need:
  - the representation ring, planned at InductionRestriction L6;
  - the Frobenius characteristic s_λ, planned at SchurWeyl L7 in finite-variable form only;
  - plethysm with p_n ∘ q = q^n, and the Exp/Log of Getzler–Kapranov, planned nowhere.

### 8–10 (low)

- **8. Lang's theorem (missing).** Proposition 1.3(ii) needs it, and there is no item. Import it from ReductiveGroupsPartII RG2.3, where PAPER-LIPNOWSKI-TSIMERMAN-18 routes it.
- **9. The groupoid mass has two owners (duplicate).** PAPER-YU-23/138 defines it for a Part II. It should import the definition from WC.1.
- **10. The hyperelliptic model and its point count (missing).** Lemma 5.2 needs:
  - the model y² = f(x) in P(1,1,g+1), planned at AlgebraicCurves L10;
  - #C_f(F_q) = q + 1 + Σ_{x∈P¹} χ(f(x)), whose elliptic case is at FF.3.

## The review's changes

The review changed only the verdicts and the report. Its remark that vdBE Lemma 4.1 is "exactly" WC.5:power-sum-converse overstates the match, since the lemma also needs weights. The item's note ("in bound form") is accurate, so I raise no finding.

## Checks

- `python3 scripts/check_redteam.py research/blueprint/redteam/RT-PAPER-BERGSTROM-FABER-PAYNE-24.result.json` reports `ok`.
- `python3 research/blueprint/intake.py check-files` reports 0 problems on both files.
