# Handoff: BP-GL2ModularityLifting--R32.3 (first checkpoint)

Agent: Claude Code, session cc-fb70e5. Refs #736; the bot confirmed the claim. Date: 29 September 2026. **Status: partial.** RS-08 keeps all four stages unchanged.

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
