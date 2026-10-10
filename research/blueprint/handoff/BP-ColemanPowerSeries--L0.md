# BP-ColemanPowerSeries--L0 — completed planning pass

Agent: Codex, session `codex-4N2rp5`. Issue: [#6478](https://github.com/CBirkbeck/tauceti-explorer/issues/6478). Branch: `codex-4N2rp5-6478-coleman-l0`.

## Delivered

This is a completed blueprint pass, not a checkpoint or an implementation. The packet has `status: complete`; the sole scope and coverage record is `ColemanPowerSeries:L0`, with coverage `planned`. It remains open for the two explicit receiver/comparison gaps below. Every node has implementation status `unchecked`.

The four deliverables are the [packet](../packets/ColemanPowerSeries--L0.json), [reader](../readmes/ColemanPowerSeries--L0.md), [suggested Lean file](../suggested/ColemanPowerSeries--L0.lean), and this handoff. The accepted parent packet was read and retained unchanged. Its L0 nodes are prerequisites by their stable ids. This refinement uses distinct `ColemanPowerSeries:L0/unramified-…` ids and separates named API lemmas into declaration nodes, as this issue requests.

Counts: **134 nodes** — 17 constructions, 7 definitions, 103 lemmas and 7 comparisons; **72 API items**, **72 unit tests**, **6 planets**, **20 pinned baseline declarations**, **2 gaps**, **8 supplier requests**. Each of the 24 definitions/constructions has exactly three discriminating tests. There are no new theorem, example or process nodes.

The pass specifies:

- The accepted integral closure versus the canonical local-field integer ring, residue map, unit filtration, integer-normalized valuation, normalized absolute value and native Teichmüller lift.
- The actual unramified coefficient levels E_n=E(ρ_n), their shifted Eisenstein polynomial, integral power basis, scalar-pinned residue field, relative degree/minimal polynomial/Galois extension and actual field-unit norms.
- Arithmetic coefficient Frobenius fixing ρ_n, cyclotomic actions fixing E, their norm equivariance and their actions on the genuine unit limits.
- The inverse-Frobenius residue and Teichmüller formulas. Full units split as kˣ×principal units; only the principal carrier receives the existing native scalar/completed modules.
- The signed dyadic roots τ_n=−ρ_n, with τ_0=1, and the continuous injective Tate coordinates. They are norm-compatible; they are not compatible under squaring. This does not extend the parent's odd-prime quotient results to p=2.
- Genuine finite semilocal integer products, componentwise norms, full/principal equalizers, coordinate shuffle, twisted splitting, coefficient Frobenius, coherent field transports, factor permutations and the product Tate comparison.
- The actual topologically nilpotent integral series evaluation point. The generic power-series evaluator and polynomial comparison are already in Mathlib and are imported.

All formulas assume finite unramified coefficient fields. The reader gives the ramified ℚ_2(i) counterexample to extending the degree-p and signed-norm assertions outside that hypothesis. The L1 interpolation convention is fixed to evaluation at ρ_n−1 with nth coefficient Frobenius twist; L1 operators are not replanned.

## Verification and its limits

`python3 scripts/check_blueprint.py research/blueprint/packets/ColemanPowerSeries--L0.json` reports **0 errors, 0 warnings**, using the machine's configured pinned declaration index. The baseline statements were independently opened at their pinned revisions.

The suggested file **elaborates with only warnings that declarations use proof placeholders**, through `lean-check research/blueprint/suggested/ColemanPowerSeries--L0.lean`, at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. No library build, update, cache acquisition or language server was run. The compilation checks native types and signatures; it proves no mathematics and certifies no canonical structure diamond.

A consistency check found no packet declaration or API without a named signature except the eight explicit `prototypeOmissions`. Every API and test is named in the reader. Definitions use actual native field, ring, residue, norm and pro-p types, with explicit arithmetic compatibility equations. No empty proposition or arbitrary assumed scalar/completed module stands in for an absent interface.

The eight omitted names are `coefficientTotallyRamified`, `coefficientRamification`, `coefficientAbsoluteRamification`, `coefficientResidueDegree`, `coefficientPrincipalScalar_eq`, `coefficientCompletedAction_eq`, `signedTateTower_scalar` and `semilocalPrincipalScalar_eq`, all in `ColemanUnramified`. The actual native ramification predicates and native scalar/completed module constructors are absent at the pin. The exact mathematical statements are retained in the packet and reader. The semilocal Tate comparison has its native continuous additive signature; its scalar and action refinements need the same current-only receivers.

The entire current LocalFieldsRamification and ProfiniteArithmetic reader documents and the relevant suggested interfaces were read. Current TauCetiRoadmap was `3c18d9fbfceed0dc5c1edb1070a3927152d19e28`; current Tau Ceti was `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Both were consulted read-only. Their canonical finite-field structures, unramified Frobenius, scalar powers and completed modules remain imports; no duplicate generic construction is planned.

## Exact follow-up

1. **G1 — canonical receiver audit at an approved supplier revision.** Instantiate the actual E_n and O_n structures using LocalFieldsRamification L0–L3. Audit valuation, topology, norm, scalar tower, consecutive inclusion and residue-map compatibility; supply the canonical arithmetic Frobenius on E. Compile the native ramification and current scalar/completed module comparison signatures against the approved library revision. The pin prototype's explicit supplier parameters do not close this audit.
2. **G2 — weak-measure/native completed algebra comparison.** Obtain from PadicMeasuresIwasawaAlgebras L1 the continuous ℤ_p-algebra equivalence from the parent's genuine weak-measure completed ring to native `completedGroupAlgebra ℤ_p Γ`, taking each Dirac measure to `completedGroupAlgebra.of ℤ_p Γ`. Transport the current native module and establish the actual arithmetic group, scalar and joint-continuity comparisons.
3. **Assembly.** Use the six-planet selection in `planetAssembly` in place of the parent's L0 selection, retaining all parent mathematics. Appending the two selections would violate the layer limit. No source text or scratch artifact is needed to resume; the exact formulas, locators, requests and receiver omissions are in the deliverables.

The eight recorded supplier contracts are LocalFieldsRamification L0 (canonical structures/norms), L1 (native principal units), L2 (unramified Frobenius), L3 (Eisenstein integral generation/ramification), ProfiniteProPGroups L3 (current arbitrary-product/subgroup pro-p closure), its historical L4 scalar reference resolved to current ProfiniteArithmetic §1.3 and native `IsProP.module`, PadicMeasuresIwasawaAlgebras L1 (the Dirac-preserving algebra comparison), and NumberFieldArithmetic L5 (existing semilocal completion/integer equivalences). These requests retain ownership; they do not ask for second implementations of current generic mathematics. No higher-tier definition was moved and no existing upstream roadmap was edited.

## Sources and corrections

The public sources read, with source hashes and exact version records in the packet, are:

- Romyar Sharifi, [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf): §5.4 opening and Theorem 5.4.9 through Corollary 5.4.13 with proofs, pp.143–147; §6.1 opening and Proposition 6.1.1, pp.157–158. A proof of Proposition 6.1.1 is not supplied in the passage read and is not claimed read.
- Romyar Sharifi, [Algebraic Number Theory](https://www.math.ucla.edu/~sharifi/algnum.pdf): §5.4 pp.104–109, including Newton/Eisenstein proofs; §6.1 Definitions 6.1.14–18 and Lemma 6.1.17 pp.118–119, Proposition 6.1.25 and its preceding explanation p.120; §6.3 Lemmas 6.3.3–6 and proofs pp.130–131; §6.4 Lemma 6.4.1 through Proposition 6.4.8, pp.133–134, including the Frobenius definitions and proofs.
- Rodrigues Jacinto–Williams, [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), published 2025 version: §9 pp.161–163; Proposition 12.1, Lemmas 12.2–12.3 and Proposition 12.5 pp.178–179.
- Current [TauCetiRoadmap](https://github.com/TauCetiProject/TauCetiRoadmap/tree/3c18d9fbfceed0dc5c1edb1070a3927152d19e28) and the current/pinned native library files cited above.

Four source issues are recorded in our own words: the interpolation root index in Sharifi IW Theorem 5.4.9/Definition 5.4.12; the value-1 semilocal normal-basis generator; the coefficient decomposition-group index in the same §6.1 opening; and the q versus q−1 root counts in the ANT proofs of Lemma 6.3.3 and Proposition 6.4.6. Author PDF/HTML copies and author-site correction searches were checked; no correction was located in those copies. The corrected formulas are used throughout. These are source notes arising from the blueprint, not a separately claimed errata job.

The original Coleman 1979 full text was not obtained freely; Sharifi supplies the unramified L0 proof material used here. Coates–Sujatha was not used. The maintainer library index was consulted and no uncleared book copy was read. No source passage, source PDF or extracted source text is in the repository.
