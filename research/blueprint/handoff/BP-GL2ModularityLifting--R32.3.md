# Handoff: BP-GL2ModularityLifting--R32.3 (second checkpoint)

Agent: Claude Code, session cc-fb70e5. Refs #736; the bot confirmed the claim. Date: 29 September 2026. **Status: partial.** RS-08 keeps all four stages unchanged.

## Checkpoint 2: wired to part 1's R32.1–R32.2 (no new nodes)

Part 1 (`GL2ModularityLifting--R22.1`, PR #3885, merged) now plans R32.1 (the statement table) and R32.2 (odd-prime de Rham lifting, p = 3 included). This checkpoint connects the two parts:
- **R32.3–R32.5.** `dyadic-de-rham-modularity-lifting`, `pan-residually-reducible-fontaine-mazur` and `p-three-residually-reducible-branch` now cite `R32.1/lifting-statement-table` and say which proposition they prove: (b), (c) and (d).
  - The dyadic node replaces its stage prerequisite R32.2 by `R32.1/non-solvable-residual-image`.
- **R32.6/transfer-residually-irreducible-odd.** It now cites `R32.2/odd-prime-statement-over-q` and `R32.1/quadratic-cyclotomic-irreducibility` in place of the stage R32.2, with Tung's Theorem 4.7 (p. 15) as a source. The remaining item "p = 3 rests on Tung, statement only" is closed.
- **R32.6/globalisation-dependency-audit** gains (e) and (f):
  - (e) the odd-prime theorem is used only in its forms that assume ρ̄ modular: Kisin (2.2.18), Hu–Tan 6.3 and Tung 4.7.
  - (f) Emerton's §7.3 uses Serre's conjecture, for promodularity only, and is not used. His §7.4, which completes Theorem 3.3.22, uses only an auxiliary CM-induced modular ρ̄ and the weight part of Serre's conjecture for it.
  - New sources: Emerton lg.pdf (sha bf4f855…) and Hu–Tan arXiv v2 (sha d36f237…).
- **Gap narrowed** to Tung's global inputs ([CEG+16], Emerton–Paškūnas, BLGG13 A.4.1) and Gee's Theorem 4.4.12, which Kisin's proof uses. The R31.6 request is narrowed to match, and a request to SerreWeightAndLevelOptimisation R20.6 is added.
- **Locator corrected.** Checkpoint 1 recorded Tung's (ANT 2021) Theorem 1.2 as pp. 1–2. It is on p. 4. The source record now lists the pages read: pp. 1–2, 4 and 14–15.
- **Finding resolved.** The OrdinaryAutomorphicFormsAndModularityLifting R21.5 finding below was fixed in PR #3881 (checkpoint 9 of that job).

Checks: `check_blueprint` with the pinned index gives 0 errors and 0 warnings; `check-files` gives 0 problems; every new excerpt was checked by script against its page's text. The Lean file is unchanged.

## Checkpoint 1

## Done (9 nodes, 4 planets)

- **R32.3:** the 2-adic de Rham modularity lifting theorem (Tung's Theorem A).
  - Paškūnas' earlier Theorem 1.1 and its local hypothesis (iv) are recorded; Tung removes (iv).
  - It is kept distinct from Kisin's potentially Barsotti–Tate theorem of the classical proof, which is part 1's node.
- **R32.4:** Pan's Theorems 1.0.2 and 1.0.4.
  - 1.0.2 is the residually reducible theorem: p odd, excluding p = 3 when χ̄₁χ̄₂⁻¹|_{G_{ℚ₃}} = ω.
  - 1.0.4 is the residually irreducible theorem; by Pan's Remark 8.0.4 it uses Khare–Wintenberger's Serre conjecture.
- **R32.5:** the p = 3 branch is imported from OrdinaryAutomorphicFormsAndModularityLifting R21.5. This part adds:
  - the precise reason Pan does not cover it: the excluded case is exactly ρ̄^{ss} ≅ 1 ⊕ χ̄₃;
  - the twisting normalisation.
- **R32.6:**
  - the three transfer statements (Dieulefait–Pacetti Theorems 1.4–1.6);
  - why de Rham lifting suffices at members of almost strictly compatible systems;
  - the globalisation dependency audit of the read sources.

## Findings for other packets (not edited here; they belong to other jobs)

- **OrdinaryAutomorphicFormsAndModularityLifting:R21.5/theorem-a-at-three** says Pan's theorem "needs p ≥ 5". Pan's Theorem 1.0.2 is for all odd p. It excludes, at p = 3, the case χ̄₁χ̄₂⁻¹|_{G_{ℚ₃}} = ω, which is the case of that node. The conclusion is right, but the stated reason should be corrected.
- **ClassicalSerreModularity--R27.3,** gap "DP Theorem 1.7: the second hypothesis and its check in Paso 6". This is resolved by Skinner–Wiles' Theorem (printed p. 6), whose hypothesis (i) is χ|_{D_p} ≠ 1, and it is already recorded as OrdinaryAutomorphicFormsAndModularityLifting/E9. The gap can be closed at the next checkpoint of that packet.
- **ClassicalSerreModularity:R33.5/globalisation-dependency-check** can now point to `R32.6/globalisation-dependency-audit`. For the read sources, no statement used by Dieulefait–Pacetti depends on the general Serre theorem. Pan's Theorem 1.0.4 does depend on it, and it is not used.

## Remaining

- The proofs of Kisin (JAMS 2009), Emerton (2011), Hu–Tan (2015) and Tung (p = 3, ANT 2021) are not read. Their globalisation audit is requested from CompletedCohomologyAndLocalGlobalCompatibility R31.6.
- The local p-adic Langlands inputs are requested from PadicLocalLanglandsForGL2Qp R30.6. The patched completed modules are requested from CompletedCohomologyAndLocalGlobalCompatibility R31.5.
- Pan's pseudo-deformation and classicality arguments, and Tung's Theorems B and C, are summarised at the level of their strategy. A continuation should decompose them once R30.6 and R31.5 exist.

## Checks

- `check_blueprint --index`: 0 errors, 0 warnings.
- The intake's `file_problems`: 0 problems.
- Every excerpt was located on its stated page. Skinner–Wiles' Theorem was read on the page image, and Dieulefait–Pacetti's Theorem 1.7 on its page image.

## Suggested Lean file

It imports Mathlib only. It was compiled with `lake env lean` against Mathlib 082e2d3: exit code 0, no warnings.

## Sources

The PDFs were downloaded and their SHA-256 hashes are recorded in the packet:

- Tung, arXiv:1908.06174v3 and 1803.07451v4;
- Paškūnas, arXiv:1509.00332v2;
- Pan, arXiv:1901.07166v2;
- Dieulefait–Pacetti, arXiv:2108.07577v2, the same hash as the other packets;
- Skinner–Wiles (Numdam), the same hash as OrdinaryAutomorphicFormsAndModularityLifting.

The arXiv ids were found by web search, because the arXiv API returned nothing.
