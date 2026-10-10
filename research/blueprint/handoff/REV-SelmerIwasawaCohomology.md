# REV-SelmerIwasawaCohomology — completed review

Issue #485; Codex session `codex-yn9tA2`; independent of BP authors `cc-39fac3` and `codex-lvrBpD`. Bot confirmed this session's claim. This run handles this issue only.

The packet is accepted as a finished target-level planning pass: 95 nodes (68 verified, 27 corrected), all 38 pinned baseline declarations confirmed, no nodes added and no baseline citations removed. Five stages remain planned, none closed; 154 API items, 108 required definition/construction tests, 178 tests overall, 26 planets, 20 requests and three explicit gaps. Every node has its own review verdict and check note. The report records the complete correction list, source verdicts, ownership decisions and reader synchronization locations.

Major corrections are discrete corank versus compact-dual rank, completed elliptic local points before rationalization, Qp-linear Frobenius and the local degree factor, compact/discrete Greenberg dual notation, closed dual local conditions, free split Fontaine–Laffaille filtrations, and the direct Kummer/Shapiro/inertia/Mackey/twist/depth inputs. The adjoint descent objection is a proof gap, not a counterexample under the source's enormous-image hypotheses. The Artin class-group argument has finite errors but preserves its finiteness conclusion. E7 duplicates the existing unit-rank finding PAPER-RODRIGUES-JACINTO-WILLIAMS-23/E80; do not publish it as a new discovery.

Current TauCetiRoadmap main `618e0b30d21791d6a492ce88ba8602745697b21a` and library `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` were checked read-only. Import the current local completion carrier, finite local power classes, Kummer isomorphisms and all-degree discrete Shapiro. The missing Shapiro input is only the complete-coefficient extension with the transition square. The pinned baseline remains Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

Sources are listed by edition, locator and URL in the packet. Eighteen public primary-source PDFs and the additional published Rodrigues Jacinto–Williams copy were read at the relevant loci. Liu et al.'s Inventiones 228 (2022), *On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives*, was read from the maintainer-cleared edition under the user's explicit authorization; no file or passage was copied. No source scratch is needed to resume: use the recorded URLs or the maintainer's cleared library index.

## Follow-up for packaging and the manager

- The issue does not authorize editing `research/blueprint/readmes/SelmerIwasawaCohomology.md`. That reader was reviewed but is unchanged. Synchronize it from the accepted packet before packaging; the review report's table gives section titles and reviewed line numbers, including the wrong corank examples, uncompleted elliptic local points, missing scalar degree, dual notation and p=2 claims. The corrected packet is authoritative for this review.
- Retain the two existing parity gaps: Nekovar's ordinary-family/nonvanishing/Heegner proof inputs, and the primary Monsky congruent-number two-primary parity input. Both statements are checked at the cited secondary locators, but their proof chains are not claimed closed.
- Retain the new real-place gap: AGD D7's current derived compact-support/duality/Euler statements assume condition P (odd p or no real places). Supply a modified derived real-place complex and its Iwasawa amplitude before claiming the p=2 real-place extension. Finite modified Poitou–Tate terms alone do not discharge it.
- Keep generic discrete Selmer with upstream EllipticCurves Layer7. Keep minimal period/Fontaine–Laffaille finite-condition foundations and the Tate/class-unit dictionary in this tier-8 L4; higher-tier period and integral Iwasawa plans import them. EulerSystemsCyclotomicMainConjecture imports the dictionary and retains its Euler-system/main-conjecture proofs. Integrate Hodge stage edges externally.
- Unavailable canonical cochain/derived/period/determinant carrier declarations are intentionally omitted from the typed suggested subset under PROTOCOL13. Their named mathematical/API/test contracts are recorded in comments; instantiate them when the requested suppliers land. Do not report those comments as compiled declarations or the proposed tests as proved tests.

## Checks

`python3 scripts/check_blueprint.py research/blueprint/packets/SelmerIwasawaCohomology.json` reports zero errors and warnings. `lean-check research/blueprint/suggested/SelmerIwasawaCohomology.lean` finished with exit0 and only `declaration uses sorry` warnings. Subsequent changes to the suggested file only synchronize contract comments/source locators. Memory availability exceeded 20GB, one Lean process ran at a time, and no build, update, language server or current-upstream Lake command was run.

This is a completed review, not a checkpoint. No second job is claimed.
