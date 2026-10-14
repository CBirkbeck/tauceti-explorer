# REV-OrdinaryAutomorphicFormsAndModularityLifting — independent review

Reviewer: Claude (session `claude-Zf3Kq2`), 14 October 2026. Refs #458.

The review covers the complete target-level packet of BP-OrdinaryAutomorphicFormsAndModularityLifting. Its last pass is by Codex (`codex-jCEuMc`, PR #9691); earlier checkpoints are by Claude Code (`cc-39fac3`, `cc-fb70e5`). The reviewer did none of that work.

**Verdict: accepted, after corrections.** Every node is verified or corrected, and every baseline citation is confirmed or replaced. No contradiction is left unresolved. The six stages stay `planned`. Their open supplier contracts and six proof/source gaps are recorded honestly and listed precisely in `coverage`.

## Counts

| | before | after |
| --- | --- | --- |
| nodes | 96 | 93 (3 duplicates removed; 1 rewritten as a comparison) |
| nodes moved between layers (ids kept) | — | 6 (R21.2 → R21.3) |
| nodes corrected (statement, prerequisites, locator or layer) | — | 35 of the 93 |
| nodes added | — | 0 |
| API items / unit tests | 117 / 82 | 106 / 74 (the removed duplicates’ items belong to their owner; one compatibility item added) |
| planets | 31 | 29 (R21.1’s three moved with their objects; one new R21.1 planet) |
| baseline declarations | 12 | 12 (1 replaced, 1 description corrected) |
| requests | 29 | 25 (4 answered by supplier nodes and removed; the rest sharpened) |
| bare-stage prerequisites | 102 | 91 |
| gaps | 6 | 6 |
| source issues | 15 | 16 (all 15 confirmed; E16 new) |

`python3 scripts/check_blueprint.py` (with the pinned declaration index): 0 errors, 0 warnings. An in-memory `merge_blueprints` with the corrected packet succeeds with no skipped links. The suggested file passes `lean-check` at the pins (Mathlib 082e2d3, Tau Ceti f790474) with no warnings and no proof placeholders. A `run_cmd` audit, run on a copy with all 34 examples made into theorems, found no placeholder in any statement or value. `scripts/check_sorry_data.py` and `intake.py check-files` pass.

## Sources

All twelve public PDFs were downloaded again, and their SHA-256 hashes match the packet. The ACC+ author copy cleared in the maintainer’s library was read in place and not copied. What was checked:

- **Skinner–Wiles 1999 and 2001** (Numdam scans). Checked on the OCR text, and on page images wherever formulas mattered. Page images: SW99 pp. 42, 73, 75, 85; SW01 pp. 198, 200, 202–204. A script checked every SW locator in the packet. In each one the cited lemma, proposition or displayed equation occurs on the cited page, or is a "proof of" locator continuing from the previous page. Four locators, all written in the last pass, were wrong and are corrected:
  - Proposition 4.1 is on p. 64, not p. 63.
  - (5.1)–(5.11) are on pp. 80–82, and (7.17)–(7.25) on pp. 107–110 (`formal-patching-datum`).
  - Lemma 3.11 and Corollaries 3.12–3.13 are on pp. 41–42, and (8.8)–(8.10) on pp. 121–122 in §8.4 (`ordinary-local-tangent-hecke-comparison`).
  - (3.5)–(3.6) are on p. 41 (`nearly-ordinary-arithmetic-control`).
- **BLGG12** Propositions 6.1.3–6.1.4 and Theorem 6.1.9 (page image of p. 44): εψ of finite order, type determinant (ψε)|_{I_v}, l ≥ 7, [F(ζ_l):F] > 4. **BLGG13** Theorem A, Proposition 2.1.1, Theorems 2.1.2 and 3.1.1–3.2.1. **Newton–Thorne v2** Lemma 2.6, §3 conditions (1)–(5), Lemma 3.1 and Proposition 6.1. **BCGP** Proposition 10.1.3. The R21.6 nodes and `hilbert-ordinary-weight-change` match these sources, with one exception, corrected: BCGP treats p = 5 only for representations valued in GL₂(F₅). The node’s F̄₅ generality rests on its own scalar argument. The review checked that argument and it is correct: the order-four tame inertia element has nonzero trace, the derived subgroup is SL₂(F₅), and a determinant-one element would leave PSL₂(F₅). The attribution now says so.
- **ACC+** Proposition 6.2.12: n = 2 needs [F_v:ℚ_p] > 4, and the components have dimension 5 + 3d_v and at most 3 + 3d_v. This matches `ordinary-determinant-flag-contract` and its supplier node.
- **Pan** Theorem 1.0.2: the case χ̄₁/χ̄₂|_{G_{ℚ₃}} = ω is excluded at p = 3. **Dieulefait–Pacetti** Theorem 1.7. **EPW** §2.3. **BLZ** (E10).

One statement was made faithful to its source. `theorem-a-over-q` had "ρ̄^ss ≅ 1 ⊕ χ after a twist"; the SW introduction theorem has no twist. Its reduction to Theorem A now labels χ₁ and χ₂ by the local unramified quotient.

## Baseline

All twelve declarations were read at Mathlib 082e2d3.

- `mathlib:ZMod.pow_totient` is about units of ℤ/n, and does not give the step t^{p^m−1} ∈ 1 + m_i on the residue fields k_i in `projector-exponent-comparison`. It is replaced by `mathlib:FiniteField.pow_card_sub_one_eq_one`, which does (line 218, `FiniteField` namespace).
- The description of `IsLocalRing` claimed commutativity; it does not include it, and the description is corrected.
- The other ten citations are confirmed.

## Structure: duplication, layer order and closure

1. **Notions moved down to PadicFamilies.** BP-PadicFamilies (PR #9686, merged on 14 October 27 minutes before this blueprint) applied the upstream order, under which PadicFamilies is tier 16 and this roadmap tier 20. It moved R21.1’s quaternionic projector, nearly ordinary Hecke algebra T_∞(U, 𝒪), level independence and tower duality into PadicFamilies L5, and Hida’s big Galois representation over ℚ into L4. Its handoff asks R21.1 to point at them. The changes here:
   - `R21.1/quaternionic-ordinary-projector`, `R21.1/ordinary-level-independence` and `R21.1/ordinary-towers-duality` duplicated the moved nodes. Nothing outside this packet cites them, so they are removed, and every consumer now cites `PadicFamilies:L5/…`.
   - `R21.1/quaternionic-nearly-ordinary-hecke-algebra` is cited by AutomorphicGaloisRepresentations R19.2, so it keeps its id. It is now a comparison: the Jacquet–Langlands–Shimizu identification of the imported T₂(U_a, 𝒪) and T_∞(U, 𝒪) with Skinner–Wiles’ eT*₂(U_a, 𝒪), using the accepted node R18.3/definite-jl, and the coordinates this roadmap uses.
   - `R21.6/hida-family-galois-representation-over-q` imports existence from `PadicFamilies:L4/ordinary-big-galois-representation` and keeps EPW’s refinements.
2. **Pairing.** The weighted pairing and Hecke adjoint in `R21.1/ordinary-hecke-adjoint-pairing` are the accepted node `HilbertModularVarietiesAndShimuraCurves:R18.3/integral-pairing`, now cited. The node keeps the twisted action t ↦ t⁺ and the ordinary pairing, and gains a compatibility API item and R21.1’s planet.
3. **Layer cycle.** Six R21.2 nodes used R21.3 Galois families while the R21.3 stage requires R21.2:
   - `characteristic-p-primes-auxiliary`
   - `auxiliary-trace-identity`
   - `deformation-hecke-rings`
   - `minimal-hecke-ring-decomposition`
   - `level-raising-congruence-modules`
   - `nearly-ordinary-arithmetic-control`
   
   They are moved to R21.3 (`parentStageId`, `realises` and order; ids kept, because other packets cite them). The layer graph is now R21.1 → R21.2 → R21.3 → R21.4 → R21.5 → R21.6.
4. **Closure.** Sixteen bare-stage prerequisites had no matching entry in `requests`; all are now listed. Bare stages were replaced by supplier nodes where those state exactly what is needed:
   - R02.4/global-euler-characteristic
   - R02.5/greenberg-wiles-formula
   - R03.2/rim-schlessinger-condition-and-prorepresentability (unreviewed packet)
   - R03.3/auslander-buchsbaum (also added to `permissible-localisation-finite`, whose proof uses it)
   - PadicFamilies L0/primitive-components (unreviewed packet)
   - PadicHodgeTheory R06.4/khare-wintenberger-ordinarity-branches
   - GL2AutomorphicRepresentationsAndTransfer R17.5/quadratic-induction and R17.5/residual-lt-application
   - HilbertModularVarietiesAndShimuraCurves R18.3/integral-pairing and R18.3/definite-jl
   
   Four requests are answered and removed (R02.3, R02.4, R03.2, R06.4). `irreducible-nice-prime-r-equals-t` cited two nodes stated for the residually reducible datum 𝒟_c; it now cites the abstract patching request R03.5, which is what SW01 applies.
5. **Not substituted, on purpose.** AutomorphicGaloisRepresentations has nodes that state exactly Skinner–Wiles (3.2) and (3.3): R19.2/wiles-ordinary-hilbert-representation, R19.4/nearly-ordinary-hilbert-compatibility-away-from-p and R19.4/all-hilbert-local-global-compatibility. Their prerequisite closures reach ClassicalSerreModularity, GL2ModularityLifting, PotentialModularityAndCompatibleSystems, SmallRamificationAndAbelianVarietyBaseCases and this roadmap’s own R21.3. They do so through upward citations inside that packet, for example R19.2/hilbert-uniqueness-determinant-oddness-irreducibility → PotentialModularity R24.5/character-system. Citing them would put Serre’s conjecture in the closure of Theorem A and create cycles. The bare R19.2 and R19.4 stages stay, and the reason is recorded in those two requests.
6. **Independence from Serre.** The prerequisite closure of `R21.5/theorem-a` was recomputed over all packets and atlas stage links: 1,242 references, none in ClassicalSerreModularity, GL2ModularityLifting, PotentialModularity or PotentialAutomorphy. Its ℚ specialisations and the export are different. They cite AutomorphicGaloisRepresentations R19.1/newform-rank-two-realisation, and R19.1/parabolic-realisation-premotive cites GeneralizedHeegnerCycles GH.0 (outside the 94). From there the closure runs through HeegnerPointEulerSystems and EllipticCurveModularity to ClassicalSerreModularity and back to R21.6. That is a supplier defect, not mathematics. `independence-from-serre` now claims only what the graph shows, and names the defect.

## Library audit and the newer upstream roadmaps

Nothing that the libraries contain is planned as a node. Searches for Hida theory, pseudo-representations and modularity lifting in the current Tau Ceti library and in the current TauCetiRoadmap found nothing. The Tau Ceti carriers the reader cites are only the Mathlib ones above.

## Red-team findings handed to the blueprint

- **RT-AREA-langlands-2/17 and /31.** Correct. The local BLZ nodes are gone. R21.5 now imports the single owner directly, `PadicHodgeTheory:R06.4/khare-wintenberger-ordinarity-branches` (accepted; KW II Lemma 3.5(i), including k = p + 1 over ℚ_p). The Wach/(φ,Γ) calculation stays with R06.4 and its PG.6 supplier. Two edits outside this packet remain for the maintainer: the atlas link R06.4 → LocalGaloisDeformationRings R08.5, and the RS-06/RS-08 owner records.
- **RT-AREA-langlands-2/32.** Correct. Washington’s theorem is requested from IntegralIwasawaTheory L4 and cited by `theorem-a`.
- **RT-AREA-langlands-2/33.** Correct. `main-theorem`, `theorem-b` and `nearly-ordinary-irreducible-lifting` cite R17.4. The residual-level base change of SW01 has its own request and gap.
- **RT-AREA-langlands-2/34.** Correct. BLGG13 Theorem A is `R21.6/blgg-ordinary-modular-lift`, and BCGP’s exact hypotheses are in `R21.6/small-prime-ordinary-weight-two-lift`. Neither cites a higher roadmap; the automorphy inputs are an explicit gap (see the questions below).

## Source issues

E1–E15 are all confirmed at their locators. E3, E11, E13, E14 and E15 were checked on page images, and the CM count δ⁻_{F′} = d behind E11 was re-derived. Each finding now carries the review’s verdict.

New: **E16** (misprint, SW01 p. 189). δ_F is defined as the rank of the Galois group of the maximal abelian pro-p extension of F, with no ramification condition. That rank is infinite. Page 191 and the cited SW99 Proposition 2.4 use the extension unramified away from p. `R21.3/irreducible-presentation-bound` now states the corrected definition.

## API, tests, planets

Every remaining definition and construction keeps at least three tests, and the R21.6 numerical tests were re-checked. The new comparison node needs none, and its API, tests and planet belong to its PadicFamilies owner. R21.1 has one planet, "Twisted Hecke pairing on ordinary parts"; no layer has more than six.

## Questions for the orchestrator

1. **AutomorphicGaloisRepresentations upward citations.**
   - R19.2/wiles-ordinary-hilbert-representation and several R19.2/R19.5 nodes cite this roadmap’s R21.3 stage. The first also cites R21.1/quaternionic-nearly-ordinary-hecke-algebra, which should be re-pointed to PadicFamilies:L5/nearly-ordinary-hecke-algebra.
   - R19.2/wiles-ordinary-hilbert-representation states that R21.3 owns the ordinary local shape at p, while R21.3 imports it from R19.2. By the upstream order R19.2 owns it.
   - R19.1/parabolic-realisation-premotive cites GeneralizedHeegnerCycles GH.0, which closes a loop through ClassicalSerreModularity.
   
   Once these are removed, this packet’s bare R19.2 and R19.4 prerequisites should become the matching nodes listed in those two requests.
2. **The R21.6 BLGG/Newton–Thorne/BCGP block** rests on unitary-group automorphy lifting (BLGG12 §§3, 5; the BLGG Serre-weights appendix; Thorne 2012; BG19). No roadmap below tier 20 plans it, and the only owners are GL2ModularityLifting (tier 21) and PotentialAutomorphyInfrastructure (tier 23). The packet records a gap and a `restructure` entry (rescope) with two options: move those inputs down, or move the block up after PotentialAutomorphyInfrastructure’s lifting layers.
3. **PadicFamilies L5/ordinary-towers-duality** describes ⁺ as a subspace cut out by a central-character condition. In Skinner–Wiles ⁺ is the module with the adjoint Hecke action (see the request to PadicFamilies L5). The PadicFamilies review (#461) should correct it.
4. **AutomorphicPadicLFunctions L3 and IntegralIwasawaTheory L4** are outside the 94 roadmaps. `drops.json` moves L3 down into PadicFamilies L5. Washington’s theorem moves down into this roadmap if IntegralIwasawaTheory stays outside. Both requests carry the note.
5. **HilbertModularVarietiesAndShimuraCurves R18.3** now has accepted nodes close to several needs here: R18.3/definite-degeneracy against SW Lemma 3.26, R18.3/tw-freeness against Lemma 3.19, and R18.3/effective-neat-level against Lemma 3.5 and Corollary 3.6. They are close but not exact, and the R18.3 request lists what is still missing.
