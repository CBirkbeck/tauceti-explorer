# FIX-PKG-InductionRestrictionPartII~adv — handoff

Job: FIX-PKG-InductionRestrictionPartII~adv (issue #10389). Worker: Claude (Opus 5.5), session
claude-F73HUu, 2026-10-18.

## Findings resolved

No file `reviews/REV-PKG-InductionRestrictionPartII~adv.md` exists; the findings are those of
`reviews/REV-PKG-InductionRestrictionPartII.md` and the package `review.json` (needs_changes,
2026-10-14). That review corrected everything else in place and left one defect: the package
re-planned 43 targets that InverseGaloisAndArithmeticFundamentalGroups (IG, tier 6, TauCetiRoadmap
PR #850, README at head 164e3b1, still open) owns in IG.3.4–IG.3.5, and Layer RS.0 overlapped IG's
class map, universal coefficient, Schur-cover comparison and complement-conjugacy statements.

| Finding (review step) | Change |
| --- | --- |
| 1. Import the 43 targets from IG.3.4–IG.3.5 under a supplier heading with IG's names, delete their subsections | Deleted RS.1.1–1.3, 1.5–1.10, 1.14, all of RS.2, RS.3.1–3.5, 3.8 and all of RS.5. New `## Scope and ownership` block "Imported from InverseGalois…" and supplier section `### From TauCetiRoadmap.InverseGaloisAndArithmeticFundamentalGroups (pull request #850)` list them by IG subsection with IG's `ReducedSchur.*` names. |
| 2. Re-point every *Needs* of the kept targets to the IG subsections | Done for RS.1 (old 1.4, 1.11–1.13), RS.3 (old 3.6, 3.7, 3.9–3.11), all of RS.4 (RS.1.7 → IG *Reduced Schur covers*, RS.2.3 → *The class degree map*, RS.3.5 → *Central power corrections*, *The discrete action of units*) and all of RS.6 (RS.1.1 → *Commutators of lifts…*, RS.1.7/RS.0.5 → *Reduced Schur covers*, RS.1.10 → *Conjugacy classes lift bijectively*, RS.0.7 → RS.0.4 + IG *Coprime semidirect products…* items 1–2). Scripted check: no forward, unknown or dangling RS reference. |
| 3. Cut RS.0 to what IG does not state | RS.0 now has five targets: RS.0.1 the class map on cycle representatives (`cyclePairing`, `integralEvaluation_mk`, naturality in group and coefficients, `extensionClassMap_apply`, `extensionClassMap_natural`, splitting); RS.0.2 the free and divisible cases of IG's universal coefficient theorem and `card_schurMultiplier_complex` (|H²(G, ℂˣ)| = |M(G)|, on Tau Ceti's `schurMultiplier`), which is what makes InductionRestriction's representation groups satisfy IG's Schur-cover comparison; RS.0.3 the five-term sequence (old RS.0.4), now also for an arbitrary extension through its central quotient E/[E, N] (`extensionFiveTerm_general`); RS.0.4 finite homology in every positive degree (old RS.0.6); RS.0.5 the Hall part, in every positive degree with range and kernel forms (`integralHomology_hallPart`; old `multiplier_hallPart` is its degree-two case). Deleted: the universal coefficient surjectivity/kernel and `integralExtInclusion` (IG's UCT, stated for every G and trivial A), `IsSchurCover` with `isSchurCover_of_stem_card` (IG *Reduced Schur covers*; existence now follows from RS.0.2 and InductionRestriction Layer 7), `multiplier_complementPart` and the primary decomposition (IG *Coprime semidirect products*, items 1–2), RS.0.8 complement conjugacy (IG.4 *Coprime profinite complements*; its only consumer was RS.5). |
| 4. Rewrite title, Summary, layer table, scope, build guide, consumers; decide on renumbering | All rewritten. Layer labels RS.0, RS.1, RS.3, RS.4, RS.6 kept (ArithmeticStatistics packets cite RS.4/involution-abelianization, RS.6/order96-type, RS.6/reduction-certificate; ArithmeticStatisticsPartV cites RS.6.4–RS.6.6 and links the RS.1 heading anchor, which is unchanged). Subsections renumbered inside RS.0, RS.1 and RS.3 only; RS.4 and RS.6 numbers unchanged. |
| 5. Remove the dropped targets' declarations from Suggested.lean; keep light real-bodied carriers | Removed all RS.2, RS.5, RS.3 power/twist declarations, `multiplier_complementPart` and the complement-conjugacy theorems. IG's carriers needed by kept statements (`commutingCycle`, `homologicalCommutator`, `schurRelations`, `reducedMultiplier`, `liftCommutator`) are stated in `ReducedSchur` with IG's README signatures and a docstring saying they are IG's. |
| Upstream note (RS.2.16 torsion needs finite G) | RS.2.16 is now IG's. IG's current README (head 164e3b1) opens the target with "Assume G is finite", so the note is resolved there. |

## Label map for consumers

Old → new: RS.0.1 + RS.0.3 → RS.0.1; RS.0.2 free/divisible cases → RS.0.2; RS.0.4 → RS.0.3;
RS.0.6 → RS.0.4; RS.0.7 (Hall part) → RS.0.5;
RS.1.4 → RS.1.1; RS.1.11 → RS.1.2; RS.1.12 → RS.1.3; RS.1.13 → RS.1.4; RS.3.6 → RS.3.1;
RS.3.7 → RS.3.2; RS.3.9 → RS.3.3; RS.3.10 → RS.3.4; RS.3.11 → RS.3.5. Moved to IG: old RS.0.2
surjectivity/kernel, RS.0.5, RS.0.7 complement part, RS.0.8, RS.1.1–1.3, 1.5–1.10, 1.14, RS.2.*, RS.3.1–3.5, 3.8, RS.5.*.

Consumers to repoint (not edited here, outside this job's files):
- `packages/ArithmeticStatisticsPartV/README.md` lines 17, 47, 1526, 1528, 1550: `ReducedMultiplier`
  and `ReducedCover` are IG.3.4 *The reduced Schur multiplier* / *Reduced Schur covers*
  (`ReducedSchur.reducedMultiplier`, `ReducedSchur.ReducedCover`), and "RS.3 the cyclotomic power
  action" is IG.3.5 *The discrete action of units* / *The cyclotomic twist of a set*. Its RS.6.4–RS.6.6
  citations are unchanged.
- `packets/ArithmeticStatistics--ST.0.json`, `--ST.3.json`: `RS.1/reduced-multiplier` and
  `RS.1/reduced-cover` → IG.3.4. `RS.4/involution-abelianization`, `RS.6/order96-type`,
  `RS.6/reduction-certificate` unchanged.

## Generalisations made (maintainer rule 2026-10-16)

- RS.0.2: the divisible case for every group G (Ext¹ into an injective group vanishes), not only
  finite G.
- RS.0.3: the five-term sequence for an arbitrary extension (through E/[E, N]); the central case is
  the specialisation.
- RS.0.5: the Hall part in every degree n ≥ 1, not only for M(G).
- RS.1.1: bilinearity `⟨ab, y⟩ = ⟨a, y⟩ + ⟨b, y⟩` on C_G(y) (a, b need not commute), the right law,
  the power law for all integers, `⟨x, x⟩ = 0`; the old natural-number power law is a corollary.
- RS.1.2: normalisation with a representative per class; the single-class case is Wood's.
- RS.1.3, RS.4.1, RS.4.12: stated for any central extension (and any involution), the reduced cover
  being the specialisation; this also made the old `c = ∅` Checks of RS.4.1 well posed.
- RS.6.1: `schurRelations_eq_bot_of_coprime` (Q_c = 0 when every element of c has order prime to
  |M(G)|), of which the index-two statement is a case.

## Adversarial pass on the touched statements

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| Class-map sign (RS.0.1) | integral Heisenberg group, X = (1,0,0), Y = (0,1,0); section (a,b) ↦ (a,b,0) | XYX⁻¹Y⁻¹ = (0,0,1); factor set ad; pairing +1 agrees | new two-term witness Check |
| Class-map naturality (RS.0.1) | (a,b,z) ↦ (2a,b,2z) over (a,b) ↦ (2a,b) | both sides 2; dropping the kernel map gives 1 | new Check |
| Splitting converse (RS.0.1) | C₂ → C₄ → C₂ | τ = 0, no splitting, class in Ext¹(C₂, C₂) | Check now names the Ext hypothesis |
| UCT corollaries (RS.0.2) | C₂ with ℤ; ℤ²; C₄ with ZMod 2 (C₈); C₂² and C₆ with ℂˣ | Ext C₂, 0, C₂; orders 2, 1 | old Checks kept |
| General five-term (RS.0.3) | A₃ → S₃ → C₂ | [S₃, A₃] = A₃, N̄ = 1, sequence 0 → 0 → C₂ ≅ C₂ exact; with N in place of N̄ exactness fails at that term | new Check (first draft misplaced the failing term; corrected) |
| Finite homology (RS.0.4) | trivial group; C₂ all degrees; H₀; H₃(S₃) = ℤ/6 | killed by 6, not 2 or 3 | new Check |
| Hall part (RS.0.5) | G = H; (C₃²) ⋊ C₂; S₃ in degrees 1 and 3 (Löh Ex. 3.2.16: action (−1)^{k+1}); C₂ × C₂ with H = C₂ | coinvariants 0 in degree 1, C₃ in degree 3; non-coprime case not onto | new degree-1/3 Check; degree-0 excluded in Lean by n+1 |
| Bilinearity (RS.1.1) | chain identity d₃T(a,b;y) expanded term by term; ℤ²; C₂²; S₃ × ℤ (Künneth, M ≅ C₂) | holds without [a,b] = 1; ⟨x⁻¹,y⟩ = −⟨x,y⟩ | new statements and Checks |
| Local normalisation (RS.1.2) | S₃ transpositions; S₆ with two involution classes | unique conjugate over x_d; one c₀ cannot serve two classes | generalised; Check reworded |
| Homology image (RS.1.4) | C₂² with c = ∅ (D₈, Q₈) and c = all | image 0 resp. M(G) | unchanged |
| Kernel action (RS.3.1) | S₃ transpositions, α = −1 | on U: ((12)(23),2) ↦ (((12)(23))⁻¹,2), not multiplicative; on K ≅ 2ℤ identity | Check made explicit |
| Finite level (RS.3.2) | C₃: units 2, 11 (mod 9); 2, 5 (mod 3); 1, 2 | |G|² suffices; here level 3 already | Check rewritten (old wording implied |G|² is attained) |
| Slices, fixed lattices, orbits (RS.3.3–3.5) | D empty; |D| = 2, n = 3, M = 1; C₃, q = 2 | as stated | M now an integer bound, matching Lean |
| Fixed-fibre equation (RS.4.3) | expansion with Y² central, z(q) = (X²)^{−r}; q = 3 | h^{q−1} = b^{−r} | proof sketch now shows the computation |
| Square-torsion (RS.4.4) | C₈, r = 2 and 8 | both sides fail, both hold | unchanged |
| Two-adic survival (RS.4.10) | C₈ generator (16 ∣ q − 1); C₂ generator, q = 3, 5; trivial A | thresholds 3, 1, 0 | new C₂ Check and Lean example |
| Parity cosets (RS.4.14–4.19) | S₃; S₆; N = 2 coset weights; a = 0, s = id | as stated | unchanged |
| Coprime Q_c (RS.6.1) | C₂² with its involutions; C₃² × C₂ with its unique involution | Q_c = M(G) resp. 0 | new statement; first draft wrongly called (a,t) involutions in the direct product, corrected |
| Index-two reduction (RS.6.1) | complement from g^k (g² ∈ H of odd order k); C₂ × C₂, H = C₂ | as stated | proof step made explicit |
| Lift-commutator homomorphism, generators (RS.6.2–6.3) | D₈ over C₂²; S₃ | κ(x, −) kills x; S₃ generators outside the centraliser | Checks made explicit |

## Lean

`lean-check` of Suggested.lean: exit 0, 63 warnings, all `declaration uses sorry` (672 lines). A
`run_cmd` audit over the 99 declarations of the namespace found no `sorry` in any statement type and
none in any definition body. The proof obligations inside data definitions now have real proofs:
`ReducedSchur.commutingCycle` (cycle membership by `d₂₁_single` and `abel`),
`ReducedSchur.commutator_surjInv_mem_range`, `prodComm_two_nsmul`, `swapAction_ofAdd_one` and
`abelianizedSum_swap` (previously proved by `sorry`). New declarations: `homologyMap`,
`integralHomology_hallPart_range`, `integralHomology_hallPart_ker`, `homologicalCommutator_mul_left`,
`homologicalCommutator_mul_right`, `homologicalCommutator_self`, integer `commutator_order`,
`local_factors_commute`, `DegreeOrbitSet` with examples, `involution_square_central`,
`card_schurMultiplier_complex` (on `TauCeti.schurMultiplier ℂ G`, a new import of the compiled
`TauCeti.RepresentationTheory.ProjectiveRepresentation.SchurMultiplier`),
`schurRelations_eq_bot_of_coprime`, and examples for the new Checks.

## Cross-check

A Sonnet agent compared the old README, the new one and IG's README at 164e3b1 target by target. Every
deleted target is stated in IG.3.4–IG.3.5 or IG.4 with the same or weaker hypotheses, except the
residues listed under the upstream notes below (none has a consumer among the kept targets). Its
findings acted on: the universal-coefficient corollaries were restored as RS.0.2 rather than called
instances of IG's theorem; the D₈/Q₈ value Check of the old class map (now `extensionClassMap_test_4`)
and the orientation / non-commuting bullet of the old power law (now
`homologicalCommutator_orientation_test`) were restored; the old five-term Check on S₃ keeps its tail
values. Every `RS.k.n` cited in the new README exists, and every IG subsection title it names occurs
in IG.

## Upstream notes for InverseGalois (PR #850)

- Generalities of the deleted targets that IG does not state, for IG's maintainers: U(G, c)ᵃᵇ ≅ ℤ^D
  for every G generated by c, finite or not (old RS.2.8; its old Lean form omitted the generation
  hypothesis and was false: for G = S₃ and c the two 3-cycles, U ≅ ℤ² while ℤ^D = ℤ);
  [P, P] = [S, S] × 0 for the pullback of any π : S → G along a surjective δ (old RS.2.10); the
  splitting of the pulled-back marked extension as a named target (old RS.2.12; it is in IG's proof
  sketch); M(H ⋊ Γ) → M(Γ) onto for every semidirect product, coprime or not (old RS.5.1); the
  reusable lemma that a central extension of a finite group by a finite kernel of coprime order
  splits uniquely (old RS.5.3); and the correction identity f(W^G_α(m)) = W^Γ_α(classMap m) (old
  RS.5.11, in IG's proof sketch).

- IG.3.4 *Reduced Schur covers* uses |H²(G, ℂˣ)| = |M(G)| for the representation groups of
  InductionRestriction Layer 7; it follows from its own universal coefficient target (Ext into a
  divisible group vanishes) and is RS.0.2 here, but IG is the lower tier, so it should state it
  itself or cite Tau Ceti once RS.0.2 lands there.
- IG.3.6 defines the normalisation z(f) inline; RS.1.2 here names it.
