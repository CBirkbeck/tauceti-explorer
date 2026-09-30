# REV-RT-PAPER-BERGSTROM-FABER-PAYNE-24

**Complete: all ten findings confirmed.** Seven fixes are corrected or narrowed below.

- **Job.** Refs #4518.
- **Verifier.** Claude Code, session `cc-48533a`, 30 September 2026.
- **Independence.** The extraction, its review and the red team (RT-PAPER-BERGSTROM-FABER-PAYNE-24, session `cc-f805bf`) were done by other sessions.
- **Verdicts.** They are in `research/blueprint/redteam/RT-PAPER-BERGSTROM-FABER-PAYNE-24.review.json`, and `python3 scripts/check_redteam.py` reports it `ok`.

## Evidence and scope

**Source.** arXiv:2206.07759v2 (SHA-256 36beb2d3…6758), the file the extraction read. The paper was published in Ann. of Math. 199 (2024), doi:10.4007/annals.2024.199.3.7, but no open copy of the published text was reachable. Every verdict is about v2.

**Method.** Three verifiers worked in parallel:
- findings 2 and 6 (the weight spectral sequence and Arbarello–Cornalba);
- findings 1, 3, 4 and 5 (ownership);
- findings 7–10.

**What was read:**
- the paper's quoted passages, on the page images;
- every cited extraction, route and review verdict;
- the red-team area files RT-AREA-etale and FIX-RT-AREA-etale;
- the named packet nodes and stage texts;
- the libraries at the pinned commits.

**Computation.** Finding 2 was checked in two ways. The stable graphs of type (1,2) were enumerated by hand. #M_{1,2}(F_p) was counted by computer for p = 5, …, 19.

## /1 — confirmed; fix changed (high)

**The duplication is real:**
- PAPER-YUAN-26 route 10 founds StableReductionPartII (accepted 23 September).
- The confirmed RT-AREA-etale/4 widened that roadmap to every (g, n) with 2g − 2 + n > 0 and made it the single owner of M̄_{g,n} and its finite covers.
- MotivicStructuresInModuliOfCurves was proposed by PAPER-CANNING-LARSON-PAYNE-24 route 1. This extraction only joins it.

**The fix needs three changes:**
1. **Apply with the fix report.** FIX-RT-AREA-etale is merged only as a report of edits. YUAN-26's brief still reads "for g > 1", and the paper needs g = 0 (Keel) and g = 1 (M̄_{1,11}). So this fix must be applied together with that report's Edits 1 and 3.
2. **Split, do not delete.** Keep `moduli-stacks` with Knudsen's statement and move it, with `boggi-pikaart`, to a source or Part II route into StableReductionPartII. Add a new item `boundary-strata` for the stable-graph stratification and keep it in route 1. The Boggi–Pikaart cover is a finite level cover of M̄_{g,n}, the same kind of object the Part II owns.
3. **Record a verdict for the new route**, so that the queue applies it.

**Separate point.** The `boggi-pikaart` item says "smooth projective … over Q". The paper uses the cover over F_q, and Remark 9.4 calls it "smooth and proper". Its base and projectivity should be checked against Boggi–Pikaart before the brief fixes them.

## /2 — confirmed; fix narrowed (high)

**The printed formula omits the twist.** Display (3) (p. 7) gives E₁^{j,k} = ⊕_{|E(G)|=j} H^k(M̃_G) with plain Aut(G)-invariants. The paper's own citation, Payne–Willwacher arXiv:2110.05711 §2.3, states E₁^{j,k} ≅ ⊕ (H^k(M̄_Γ) ⊗ det E(Γ))^{Aut(Γ)}. The same paragraph also writes M_{g,n} where the argument concerns M_{g′,n′}.

**The M_{1,2} counterexample holds:**
- With the twist, the E₁ page gives e_c = L² and χ = 1.
- Without it, the page gives L² + 1 and χ = 2.
- The truth is χ = 1. The Leray spectral sequence over M_{1,1} gives H^•(M_{1,2}) = ℚ in degree 0, and the computer count confirms #M_{1,2}(F_p) = p² for 5 ≤ p ≤ 19.

**The paper's conclusions stand.** Proposition 4.2 uses only the Frobenius eigenvalues and dimensions, and the sign twist changes neither. It is a new source issue: not among E1–E6, and not in the review.

**The fix must be narrowed.** Its parts (1) and (2), correcting the item and recording the issue, are right. The second half of part (3) is wrong: "every graph sum over boundary strata is taken with det E(G)" would break the point counts.
- Only the E₁ page, which sums over *closed* strata, carries the twist.
- The boundary point counts over *open* strata (Proposition 4.2(3), Proposition 9.6) use plain invariants, correctly. For type (1,2), the boundary count 2q + 1 requires the double-edge stratum to count 1.

## /3 — confirmed; owner changed (medium)

Poincaré duality for smooth proper DM stacks has two owners: WC.2 here, and SF.2 through PAPER-CANNING-LARSON-PAYNE-24/14. The finding proposes SF.2 as the single owner. That is wrong: SF.2's text, as narrowed by RS-25, covers compact support and base change but not duality. Duality for schemes with its Frobenius action is EDC.2's, and WC.2 imports it from there.

FIX-RT-AREA-etale/3 proposes a new Part II, EtaleDualityAndPerverseSheavesPartIIStacks, as the single owner of ℓ-adic sheaf theory on stacks. It recommends moving CLP-24/14 there.

**Right fix:**
- Split the item. The point-count consequence for schemes (Remark 9.4, first paragraph) stays at WC.2.
- The DM-stack duality takes the same single owner as CLP-24/14, preferably that Part II. Until the maintainer settles it, follow whatever CLP-24/14 cites, so that no third owner appears.

## /4 — confirmed; owner reversed (medium)

The squarefree count has two owners: the ArithmeticStatistics node ST.4/count-of-squarefree-monic-polynomials-over-a-finite-field, and FF.3 here. WOOD-19/89 and ELLENBERG-VENKATESH-WESTERLAND-16/89 route the same count.

The finding says FF.3 plans only algorithms. That is wrong: the FF.3 packet already plans Gauss's count, the irreducible counts and the prime polynomial theorem. ST.4, on the other hand, is the Selmer-groups stage, with 232 upstream stages.

**Right fix:**
- Keep this route to FF.3 and have ST.4's node import from FF.3. An FF.3 → ST.4 edge closes no cycle.
- Bind WOOD-19/89 and EVW-16/89 to FF.3 as well.

Check: #P_g = (q−1)(s_{2g+2} + s_{2g+1}) = (q−1)(q^{2g+2} − q^{2g}).

## /5 — confirmed; fix adjusted (medium)

WC.3 only consumes purity for smooth projective varieties. The smooth proper case is planned by the decomposition nodes WC.6/purity-for-proper-smooth-varieties and DWP.7. The paper also needs purity for DM stacks: Proposition 3.1 via van den Bogaart–Edixhoven Lemma 4.1, and Proposition 4.2. The extension is correct, through the coarse space and Weil II 3.3.11, or through invariants on a global finite quotient.

**Right fix:**
- Keep `deligne-purity` as the variety statement, planned at WC.6 and DWP.7.
- Put the DM-stack case in a separate missing item routed to WC.6, next to the vdBE items that use it. It should not go to the finding's "MotivicStructuresInModuliOfCurves / WC.5".
- The global-quotient argument needs such a presentation, which M̄_{g,n} has.

## /6 — confirmed; fix replaced (medium)

**The gap is real.** The items for Arbarello–Cornalba Lemma 2.6 and for the pure-Tate claim name no input and no owner.

**The proposed new item is unnecessary.** For M̄_{g,n}, Lemma 2.6 is the (0,k) corner of the weight spectral sequence the extraction already has, routed to DWP.8. Since it degenerates at E₂, ker(H^k(M̄) → H^k(∂̃M̄)) = gr^W_k H^k_c(M_{g,n}). One-edge graphs carry no twist.

**The proposed fix fails in three ways:**
- its purity part duplicates /5;
- sending the kernel statement to DWP.7 adds an unneeded target;
- its "Hodge-theoretic owner" does not exist in the atlas.

**Right fix:**
- Add no item. Have the Lemma 2.6 item cite the weight spectral sequence (DWP.8), stack purity (per /5) and the étale–singular comparison (WC.4), and add the same line to route 1's brief.
- The pure-Tate claim needs the Hodge decomposition of smooth projective varieties, planned only in the draft roadmap SeveralComplexVariablesKahlerGeometry (CV.5), and the p-adic comparison at CohomologyComparisons CP.3. Name these instead.

**Notes for the maintainer:**
- The normal-crossings weight spectral sequence is routed both to DWP.8 here and to DWP.10 by PAPER-JANNSEN-16 route 5. That route was accepted within a review whose overall verdict is "revise".
- Rational Hodge weights (Corollary 9.5, Remarks 1.6 and 2.3) have no owner. The ℓ-adic version suffices for this paper.

## /7 — confirmed; fix corrected (medium)

§§9 and 11 (pp. 22–23, 25, 29–30) compute in the ring of symmetric functions, and none of the 80 items covers it. The correction:

- **R(G) is library, not planned.** Tau Ceti has `TauCeti.repRing` (RepresentationRing/Basic.lean:106), `repRingCharacter` (:127) and `repRingCharacter_injective` (Injective.lean:50).
- **The fixed-degree Frobenius characteristic** is planned at SchurWeyl L7, and its ingredients are in the libraries: `TauCeti.schurPoly`, `spechtChar`, `symmetricCharacterTable` and Mathlib's `MvPolynomial.psum`.
- **Plethysm and Exp/Log are not "planned nowhere".**
  - λ-rings and Adams operations are planned at KTheoryLowDegrees Z.3. Its node Z.3/adams-line-element (ψ^k(ℓ) = ℓ^k) is the abstract form of p_n ∘ q = q^n.
  - Plethystic Exp/Log is routed by accepted routes of PAPER-YU-23/044 (to QM.0) and PAPER-SCHIFFMANN-16/5 (to CountingBundlesAndHallAlgebrasOfCurves).
  - This paper should import both, not plan them again.
- **What is missing** is the ring of symmetric functions in infinitely many variables, the stable Frobenius characteristic and plethysm on that ring. These belong in a new Part II of Tau Ceti SchurWeyl, whose L7 defers them. It needs its own id: the existing SchurWeyl Part II (Cadoret–Hui–Tamagawa) is unrelated.
- **The GSp(8) local systems** of §11 should cite ClassicalGroups Layer 3 and the accepted ClassicalGroupsPartII of PAPER-YU-23 route 13.

**Note for the maintainer.** Plethystic Exp/Log has two accepted owners, QM.0 and CountingBundlesAndHallAlgebrasOfCurves, which should be reconciled.

## /8 — confirmed (low)

Proposition 1.3(ii) rests on Lang's theorem for counts (4) and (5). The accepted route 13 of PAPER-LIPNOWSKI-TSIMERMAN-18 puts Lang's theorem in ReductiveGroupsPartII RG2.3.

**Refinements to the fix:**
- The new item should state Lang's theorem alone. The point count is Proposition 1.3(ii) itself.
- The note should say that RG2.3 owns it through that accepted route, since RG2.3's stage text does not mention Lang.

## /9 — confirmed (low)

The groupoid mass Σ 1/#Aut(x) is also defined by PAPER-YU-23/138, routed by an accepted route to a Global Shtukas Part II. WC.1 should be the single owner. The import note must go on both sides; a note here alone does not change YU-23's plan. The proposed rewording of the report is accurate: no other extraction or stage mentions Behrend.

## /10 — confirmed; fix corrected (low)

**FF already plans most of the count.** The finding says FF plans it only for elliptic curves. But FF.5/double-cover-point-count gives the affine count for every polynomial, and FF.2/kummer-curve-point-count covers odd degree. Only the points at infinity are unplanned. The new item should cite FF.5/double-cover-point-count, and route 4 should add FF.5.

**The evaluation at ∞ is wrong in the fix.** "The leading coefficient" gives the wrong count when deg f = 2g+1, where C_f has exactly one point at infinity. The value at ∞ is the coefficient of x^{2g+2}, which is zero in that case. This matches the chart of P(1,1,g+1), the extraction's own convention and the paper's computation on p. 8.

## For the fix job

**High and medium findings.** Findings 1–7 become FIX-RT-PAPER-BERGSTROM-FABER-PAYNE-24. Apply them with the corrections above:
- /1: together with FIX-RT-AREA-etale's Edits 1 and 3;
- /2: the twist only on the E₁ page over closed strata;
- /3: the same owner as CLP-24/14;
- /4: FF.3 as owner;
- /5: a separate DM-stack purity item at WC.6;
- /6: citations only;
- /7: library R(G), imports for plethysm and Exp/Log, and a SchurWeyl Part II for the infinite-variable ring.

**New source issue.** Record /2 as a misprint or error in display (3), affecting nothing, with the M_{1,2} check.
