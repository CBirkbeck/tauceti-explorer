# Independent review: Integral Iwasawa theory, I.8, I.9 and L0–L4

Reviewer: Codex, session `codex-R0XXZ8`, 18 October 2026. Job: `REV-IntegralIwasawaTheory--I.8`, issue #437. This session did not write the original plan.

Verdict: **accepted after correction**. This accepts a complete planning pass, with seven stages planned and none closed. It does not certify implementation or resolve the three explicitly recorded proof/source gaps.

## Scope and counts

I checked all 55 input nodes against their source locators, direct prerequisites, proof sketches and supplier contracts. The revised packet has 53 nodes: 34 theorems, six constructions, five definitions, five comparisons and three lemmas. Its per-node review records 33 verified and 20 corrected nodes. No nodes were added; two duplicated Baker–Brumer proof targets were removed. The packet contains 43 API entries, 38 discriminating tests, 23 planets and 18 requests. Every definition/construction has at least three API entries and three tests; no stage exceeds six planets.

All six public source PDFs were reopened. The packet records their URLs, dates and SHA-256 hashes, distinguishing the RJW preprint from the published journal text. Source locators below use printed pages; Kurihara uses the author manuscript's pagination. Sharifi's retrieved PDF has 189 pages. No source passages have been added to the repository.

## Mathematical and dependency corrections

1. **Integral units and small conductors.** Circular-unit membership requires integrality of both an element and its inverse, rather than mere integrality (RJW Definition 11.6 and Theorem 11.7, journal p. 176). For real-subfield norms, the naive commuting square fails when the lower conductor is 1 or 2 and the upper conductor exceeds 2. The API now includes the extension-degree exponent. The test using (1+\sqrt2) has real norm −1 and full cyclotomic norm +1. The real-field source is Sharifi Remark 1.4.9–Example 1.4.11, p. 26.
2. **Closure rank.** The principal global-unit closure now explicitly depends on abelian Leopoldt and exposes its rank statement. Compactness alone cannot prove rank (d-1). The dependency from L1 to L4 is acyclic: the L4 proof does not use L1.
3. **Unit representations.** GlobalNumberFields §10 does not supply the rational augmentation representation of global units. The abelian resolvent proof now constructs it from the equivariant Dirichlet logarithmic lattice and rational descent (Sharifi Lemma 1.5.19 and Proposition 1.5.20, pp. 34–36). The descent uses rational linear equations for equivariant maps and a determinant polynomial with a nonzero rational specialization. The Leopoldt-defect definition uses the actual pinned unit-rank theorem. CM reduction is Sharifi Lemma 1.4.12, p. 26.
4. **Baker–Brumer belongs upstream.** Current TauCetiRoadmap main, commit `9a305e195e7870e5136053897997f7538a01121e`, assigns qualitative p-adic Baker–Brumer to LinearFormsInLogarithms §8.10 through the DiophantineApproximationAndTranscendence supplier matrix. I read that proposed endpoint in [upstream PR #451](https://github.com/TauCetiProject/TauCetiRoadmap/pull/451), head `fd8774c2080598d94958cced99dc25e11ca5530b`. The packet now imports it through DT.3 and a precise deep-unit comparison contract. A common positive deep power supplies the strict exponential-radius condition and algebraicity of the exponentials. The two local auxiliary-polynomial/extrapolation nodes and the proposed DT Part II extension were removed. The upstream PR is open, and no implementation or merged status is claimed. The discarded local extrapolation also misread Rousseau Lemma 3, p. 11-05: its grid bound is quadratic in the dimension. This is recorded as a defect of the retired plan, not as a new source error.
5. **Equidistribution.** Duffin–Schaeffer is not the needed supplier. The digit-equidistribution proof now uses Mathlib's Borel–Cantelli theorem on Chebyshev exceptional sets along the square subsequence, countably many rational thresholds and interpolation between squares. PM.2 supplies its exact Weyl-criterion node. Oesterlé Propositions 5–6, pp. 176–179, provide the eventual divisibility/congruence argument used afterward.
6. **Source numbering.** Corrected Sharifi Lemma 4.2.17, Proposition 4.1.21, Proposition 3.1.9/Lemma 3.1.10, Proposition 3.2.11/equation (3.2.1), and Theorem 3.2.13. Corrected RJW specialization to §13.2/Definition A.2, conjugation to Remark 13.7, the ray sequence to Definition 13.12/Proposition 13.13/equation (13-1), inertia to Propositions A.5–A.6, finiteness to Propositions A.6/A.8 and Lemma A.7, and growth to Theorem A.3, Lemma A.9, Proposition A.10, Lemma A.11 and Corollary A.12. The packet's 20 individual corrected verdicts record each affected node and its exact pages.

The requests now distinguish planned same-roadmap suppliers I.1, I.2, I.3, I.6 and I.7 from implemented library facts. Narrowed GNF.10 to its actual splitting/ramification/ray/Galois boundary and CharacterTheory.3 to character orthogonality/idempotents. Read the actual Coleman, D7, Selmer, PM Iwasawa-algebra, Dirichlet-L and Diophantine supplier statements. All-prime/real-place and nonregular-order extensions remain explicit requests. The Ferrero–Washington proof has no main-conjecture input.

## Library audit and baseline

Reopened every one of the original 24 declaration statements at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. None was removed. Their descriptions now retain the irreducibility hypothesis of the cyclotomic Galois equivalence, the nonzero-order hypothesis of the complex primitive root, and the natural-exponent/coprimality restrictions on associated root differences.

Added and read four declarations at the same Mathlib pin:

- `NumberField.Units.dirichletUnitTheorem.unitLattice_span_eq_top`;
- `NumberField.Units.logEmbeddingEquiv`;
- `NumberField.Units.finrank_modTorsion`;
- `MeasureTheory.ae_eventually_notMem`.

The first three are in `Mathlib/NumberTheory/NumberField/Units/DirichletTheorem.lean`; the fourth is in `Mathlib/MeasureTheory/OuterMeasure/BorelCantelli.lean`. Their descriptions separate the available statements from the arithmetic equivariance, rational descent and measure estimates still to prove.

Also read the reviewed library audit and the current read-only Tau Ceti cyclotomic fixed-field and compact inverse-system APIs. These newer declarations are noted as prospective suppliers, not inserted as facts at the older baseline. The current ProfiniteArithmetic, LocalGaloisGroups and GlobalNumberFields boundaries were inspected; their generic theory is not replanned here.

## Source findings

All eleven inherited findings E81–E91 were checked at their stated source versions and confirmed, with a separate review verdict on each. These concern smoothing factors, unit rank and quotient direction, compact inverse limits, Appendix A growth constants/congruences/indices/multiplicities, real-character conventions, the scope of Greenberg's conjecture and principal-unit closures. E85's negative-constant example is explicitly an algebraic module model, not an arithmetic counterexample.

Added two findings in Sharifi's author notes:

- **E92, Lemma 4.3.4 proof, p. 110.** A prime-power cyclotomic polynomial evaluated at 1 gives (p), not (p^k). The factorization also needs every prime-power divisor in each prime chain. The packet gives Φ₉(1)=3 and the conductor-18 product as checks. The unit conclusion survives the corrected computation.
- **E93, Lemma 4.3.5 statement, p. 110.** The displayed coprime-conductor quotient is undefined at conductor 1. Restrict it to conductor greater than 1 and handle the norm of (1-\zeta_\ell) to the rational field separately; that norm is ℓ.

The retrieved PDF and the author's corresponding chapter HTML retain these formulas. Checks of the author's notes page, public errata searches and the atlas register found no correction to cite. The packet does not claim global novelty.

## Validation and remaining work

`python3 scripts/check_blueprint.py research/blueprint/packets/IntegralIwasawaTheory--I.8.json --json` passes with zero errors and zero warnings. The source-version and source-issue validators pass; all 53 retained nodes have unique review verdicts. Definition/construction coverage and planet limits were checked separately.

`lean-check research/blueprint/suggested/IntegralIwasawaTheory--I.8.lean` returned exit 0 at the pinned shared build. The final file has 105 lines and 18 warnings, all proof placeholders. Every data definition has a real body. The additional Φ₉(1)=3 statement elaborates. No library build or language server was started.

Three gaps remain honest and open: **G1**, the original Burns–Flach bounded real-dyadic model and comparison (Kurihara §4.1, pp. 22–23, citing Burns–Flach Proposition 1.20/p. 86); **G2**, the omitted circular-unit lattice computation and general-subfield correction (Sharifi §4.7, pp. 120–128); **G3**, the original all-prime Ferrero–Washington root-lattice/reflection/normalization adapters (Oesterlé §§3–6, pp. 173–180). The original Burns–Flach, Sinnott and Ferrero–Washington proofs have not been read. These gaps prevent closure, not acceptance of this planning pass.

For the orchestrator: the existing reader document is outside this issue's deliverables and was not edited. Before assembly/package, regenerate its target descriptions, prerequisites, sources, requests and source findings from this reviewed packet. In particular remove its two local Baker–Brumer proof targets and DT Part II proposal; propagate the integral-unit and small-conductor norm corrections, closure-rank dependency, unit-representation proof, Borel–Cantelli supplier, all corrected locators and E92–E93. Its current extrapolation inequality must not survive. Decide whether to catalogue LinearFormsInLogarithms directly when its upstream status permits; the packet presently uses the existing DT.3 forwarding contract. Follow-up source work must resolve G1–G3 before any affected stage is called closed.
