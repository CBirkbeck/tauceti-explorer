# Handoff: PAPER-BARYSOROKER-KOUKOULOPOULOS-KOZMA-23

Issue #1248; Codex session codex-a71f92; 22 September 2026. Status: partial.

## Done

Read all65 pages of arXiv2007.14567v3, including all remarks and references. Recorded version/hash and limited publication comparison. Extracted130 items, with15 pinned-library credits,3 planned suppliers and112 missing items routed once. Forty definitions have120 API contracts and120 proposed tests. Seven routes comprise two Part IIs and five source routes. Read actual pinned statements and the relevant reviewed audit. Recorded18 source findings, without self-review or contacting authors.

The report embeds the full exact-rational Fourier certificate:76,860 inequalities and the residue-class reduction prove α_210(N)^2<997/1000 for allN≥35. Paper/intake and structural checks pass; no Lean file was compiled.

## Resume in this order

1. Obtain and collate the published proof with v3. Findings currently refer to v3 only. The publisher PDF endpoint returned HTML; do not claim published-version identity.
2. Independently inspect E12 at Lemma12.9 pp62–63: the auxiliary part k can exceed n/4, outside E₁. Supply a large-part argument or a stronger good event with a justified probability bound. Keep dependent Galois endpoints gated.
3. Repair E4 at p25: four primes give P² of order x^8, hence the checked log-height exponent9, not the printed5. Do not restore5 without another proof. Recover the fixed-d height bound in E18 before asserting Theorem4's exact n-range.
4. Verify the explicit E17 counterexample and corrected moment inequalities. Check all remaining findings E1–E18; review verdicts belong to an independent job.
5. Close S2 with rational certificates for Table1 and the P=1155 Littlewood calculation, retaining γ=.5000197 and the δ=.00068053 rounding margin. C1 is already supplied and need not be rediscovered.
6. Acquire the original suppliers S4–S10,S12: divisor/PNT/Mertens and large sieve, both Rosen prime-polynomial counts, Mignotte Theorem1′, concentration, inverse-totient, Dobrowolski/degree-drop and primitive-group minimum degree. Existing generic Mahler and Frobenius APIs are not substitutes.
7. Write the omitted general upper-tail proof83 and the square-coefficient/near-half-factor sketch123. Perform a second complete inventory for small background definitions and proof leaves, expand the route/API contracts, then reassess closure. S1–S15 in the JSON are the authoritative gate list.

## Conventions to preserve

Condition on a₀≠0 only where specified; keep joint bad-event probabilities distinct from conditional probabilities. Nonconstant divisors exclude units; smooth parts excludeT; full cycle type includes1s and factor degrees count multiplicity. Use separability for transitivity iff irreducibility. Reuse ramified Frobenius existence already in Tau Ceti. The group layer proves an arbitrary partition-law theorem before the probability layer instantiates it, avoiding circular imports.

## Files and checks

Only the result JSON, report and this handoff are deliverables. Pins: Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174, TauCetif790474821cf4256814db967cb154e7af3d0c369. Evidence file hashes are in the result; the certificate is fully embedded in the report, so no private scratch file is needed.

Run:

```sh
python3 scripts/check_paper.py research/blueprint/papers/PAPER-BARYSOROKER-KOUKOULOPOULOS-KOZMA-23.result.json
python3 research/blueprint/intake.py check-files research/blueprint/papers/PAPER-BARYSOROKER-KOUKOULOPOULOS-KOZMA-23.result.json research/blueprint/papers/PAPER-BARYSOROKER-KOUKOULOPOULOS-KOZMA-23.md research/blueprint/handoff/PAPER-BARYSOROKER-KOUKOULOPOULOS-KOZMA-23.md
```

Also verify the item dependency DAG, exact route coverage and API/test counts, and rerun the report's Python certificate. None of these establishes full mathematical closure or Lean compilation.
