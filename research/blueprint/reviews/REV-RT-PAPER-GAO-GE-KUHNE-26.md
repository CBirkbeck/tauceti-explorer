# REV-RT-PAPER-GAO-GE-KUHNE-26

Independent verification of the red team RT-PAPER-GAO-GE-KUHNE-26 (Codex, session `codex-rtOQ9t`, PR #5430) on the
extraction PAPER-GAO-GE-KUHNE-26 (Gao–Ge–Kühne, *The uniform Mordell–Lang conjecture*, Publ. Math. IHÉS 143 (2026),
189–235), for issue #4284.

Verifier: Claude Code, session `cc-c2c06b`, 1 October 2026. I did not write:
- the extraction (`cc-fb70e5`, PR #1841);
- its review REV-PAPER-GAO-GE-KUHNE-26 (`cc-7b31c4`, PR #2410);
- the red team.

**Disclosure.** Finding /1 of my red team RT-PAPER-DIMITROV-GAO-HABEGGER-21 (PR #5415) reported a different false
acceptance test, "every subvariety of a constant family is non-degenerate". It sits in that paper's brief for the same
Betti-map Part II, and it cited this extraction's brief as correct for a constant family over a point. It did not examine
the diagonal example of /3 below, so this review does not verify my own finding.

**Result: all six findings confirmed.**
- /1–/3 are high and /4–/6 medium.
- /4 retracts the extraction's sourceIssue E8 as a false positive.
- None challenges the uniform Mordell–Lang or uniform Bogomolov statements.

## What I read

- **The paper.** The published open-access PDF (<https://doi.org/10.5802/pmihes.26>), SHA-256 `4ee5a38b…37834f`. PDF page
  n is printed page 187 + n. I read:
  - §5, Proposition 5.2 Steps 2–4 (pp. 213–215), with the page image of (5.8)–(5.9) on p. 215;
  - Proposition 6.1 and its proof (pp. 219–220);
  - the proof of Theorem 1.1′ (p. 224);
  - Lemma 7.4 and its proof (pp. 225–226).
- **The extraction.** Items /4, /47, /48, /64, /68, /70, /85, /88 and /89, the briefs for route 5 (the Betti-map Part II)
  and route 6, and sourceIssue E8.

## The high findings

- **/1: End(A)-stability of Γ₀.** The proof of Theorem 1.1′ (p. 224) adds "we may choose such a Γ₀ satisfying that
  Γ₀ = End(A)·Γ₀", and items /4 and /85 copy this.
  - **The example.** Take A = E × E with P non-torsion and Γ = Z(P, 0). A rank-one Γ₀ contains some (nP, 0). The swap
    then forces (0, nP) ∈ Γ₀, so Γ₀ has rank 2.
  - **The fix.** Drop the stability claim. Lemma 7.3 needs only finite generation.
- **/2: coset representatives in Lemma 7.4.** The proof (p. 225) says "each x_{B,j} can be chosen to be in
  X_B°(F) ∩ Γ".
  - **The example.** Take A = E × J and X = E × C′, with C′ a translate of the Abel–Jacobi curve avoiding 0. Let
    B = E × {0} and Γ = Z(P, c). Then X_B° ∩ Γ = ({0} × C′) ∩ Z(P, c) is empty, yet (P, c) ∈ X ∩ Γ lies on the coset
    E × {c}.
  - **The fix.** Use Γ_B = pr₂(f⁻¹(Γ)) ⊆ B^⊥(F), which has rank ≤ ρ. Lemma 7.4 itself is not claimed false.
- **/3: the Betti-diagonal acceptance example.** Route 5's brief accepts "the diagonal of a non-isotrivial elliptic surface
  over a curve is non-degenerate". This is false.
  - **The obstruction.** The relative diagonal Δ(E) ⊂ E ×_S E has complex dimension 2, so it needs real Betti rank 4. The
    product Betti map restricts to (b, b), of rank at most 2.
  - **The fix.** Move it to the negative examples. The rank counts total dimension, not fibre dimension.

## The medium findings

- **/4: E8 is a false positive.** Proposition 6.1's proof sets c₁ = min{c₃″/B, c₁′/2} with B = max{1, 2c₃′/c₁′}. Let
  H = max{1, h_Fal(A)}; H is fixed by A.
  - **If H ≤ B,** the whole set lies in the (6.3) locus.
  - **If H > B,** then c₁H ≤ c₁′H − c₃′, so the whole set lies in the (6.2) locus.

  In both cases c₂ = max{c₂′, c₂″} works, so no sum of degrees is needed. Retract E8 and restore the casewise choice in
  /70 and route 6.
- **/5: reversed height signs.** The page image of p. 215 states (5.8) and (5.9) for heights ≥ δ_{ε,1} and ≥ δ_{ε,2}.
  The Claim's proof applies them to points whose heights are both below δ. The hypotheses must be small height, as /64
  already says. Record a misprint sourceIssue.
- **/6: a missing degree.** Step 4 (p. 215) compares ∫ f₁μ₁ with ∫ f₂μ₂, while (5.7) separates ∫ f₁μ₁ from
  ∫ f₁ D*μ₂.
  - **The gap.** Since f₁ = f₂ ∘ D with D finite étale of degree d, ∫ f₁ D*μ₂ = d ∫ f₂μ₂. On p. 213 the fibres of D are
    orbits of the finite group {0} × Stab(X_η)^m, which need not be trivial.
  - **The fix.** Use ν = (1/d)D*μ₂ throughout and record a proof gap.
