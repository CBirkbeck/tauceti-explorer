# BP-HabiroNumberFields--HB.6 handoff

Worker: Codex — codex-BX7VGH. Claimed issue #6495 with the required claim comment and received the bot's confirmation. This is a complete single-job submission, not a checkpoint.

## Result

`HabiroNumberFields:HB.6` is closed at target-level planning granularity. The supplement retains all ten accepted parent nodes by id, with their API, tests and planets. It supplies five distinct new declarations: one comparison, one construction, two theorems and one lemma. The new construction has eight API items and four discriminatory unit tests. Two new planets combine with the parent's two planets, giving four in the layer. Twelve pinned Mathlib declarations are cited. All implementation statuses remain unchecked.

The missing local bridge is proved via p-completeness of each finite monic quotient, an interchange of inverse limits, and cofinality modulo each p-power. Raw cofinality of the ideals in Z_p[q] is not asserted. The local Taylor chart imports the corrected `HabiroRings:HR.5/the-ell-adic-taylor-comparison`, retaining all residue factors. The full local range theorem and the additive/multiplicative coordinate bridge connect the accepted `HC.4/local-integrality-detection` to the rational image criterion for every positive Delta. There are no new mathematical gaps or supplier requests.

## Assembly instructions

Apply the packet's `imports` and `assembly` records without replacing parent node ids:

1. In `HB.6/the-p-adic-classical-ring`, replace the old raw-topology cofinality sketch with `p-chain-mixed-adic-comparison`, `prime-to-p-taylor-equivalence` and the full local range theorem.
2. In `HB.6/ring-operations-and-the-classical-comparison`, use `rational-gluing-image-criterion` for the missing image argument. Resolve its old stage-level HC.4 request with the accepted exact `HC.4/local-integrality-detection` and `HC.4/finite-taylor-injective` nodes. The coordinate lemma explicitly connects the two Taylor conventions.
3. Preserve the parent coefficient, gluing, restriction, domain-component and inverse-Frobenius scalar conventions, APIs and tests. The new comparisons do not depend on the two unfinished parent comparison nodes; the resulting graph is acyclic.

The rank-[K:Q] finite-etale comparison belongs to `HabiroRings:HR.5-number-field-comparison`, a consumer of HB.6. It is not an input and is not planned again here. The first isomorphism of GSWZ (14), concerning the p-adic completion of the global non-Noetherian ring, is still not proved by this supplement; it was already explicitly excluded from the parent p-completed construction's hypotheses. Do not mark the whole inherited source issue `HabiroNumberFields/E30` resolved: this job supplies its classical Z_p bridge. The scoped stage does not need the additional first-isomorphism assertion.

## Verified red-team finding

`RT-AREA-ktheory-2/16` is handled by the correct node-level dependency graph, the rescope proposal, and the explicit `dependencyCorrections` manifest. The maintainer must apply these legacy stage-edge changes:

- Remove `MotivicEtaleKTheory:M.1 -> HabiroNumberFields:HB.6`.
- Remove `HabiroNumberFields:KU-continuous` and `HabiroNumberFields:KU-existing` from `KU-habiroring`'s prerequisites.
- Retarget RS-08's three forwarded links from HB.6 to HB.1. Their sources are `ArithmeticGaloisDuality:D7`, `ArithmeticGaloisDuality:R02.1`, and `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees`.
- Add `HabiroRings:HR.1 -> HabiroNumberFields:HB.6`, `HabiroRings:HR.1 -> HabiroNumberFields:KU-habiroring`, and `HabiroCyclotomicCompletions:HC.4 -> HabiroNumberFields:HB.6`.

No data, content, other packet, or upstream roadmap file has been edited. HB.6 imports the exact local HR.5 chart, whose prerequisites are baseline declarations; it does not import HR.5's number-field specialization. The parent's HR.1 Frobenius supplier retains its own broader owner-side prerequisite requests; those objects are not re-planned here.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/HabiroNumberFields--HB.6.json`: zero errors and warnings.
- The same checker with an index generated from the existing pinned Mathlib source: every one of the twelve baseline declaration names resolves. Their statements were also read directly; the index does not replace statement checking.
- `lean-check research/blueprint/suggested/HabiroNumberFields--HB.6.lean`: compiled successfully against Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`; only the intended proof-placeholder warnings. It imports individual Mathlib modules, no Tau Ceti declarations. Compilation checks signatures, not proofs.
- Cross-packet prerequisite traversal with the two assembly substitutions: no cycles, and no dependency on continuous Galois cohomology, Tate twists or the downstream number-field specialization.
- Intake file-scope check: four deliverable files, zero problems. Source-issue/version validation and the small arithmetic checks (four distinct primitive fifth roots modulo 11, the mod-4 nilpotence example, and the vanishing-inequality counterexample) passed.
- Every new API name and each of the four named test examples occurs in the suggested file. Supplier models use actual compatible quotient families, cyclotomic quotients, explicit gluing equations and ring maps; missing mathematics is not encoded as an assumed proposition.

## Sources and corrections

Read on 2026-10-06:

- GSWZ, *The Habiro ring of a number field*, arXiv:2412.04241v2, §§1.3–1.4 (pp. 4–7), §§5.1–5.3 (pp. 59–66).
- Ferdinand Wagner, *q-Witt vectors and q-Hodge complexes*, arXiv:2410.23078v5, §2.1, Lemmas 2.1–2.5 (pp. 8–9).
- Ferdinand Wagner, *q-Hodge complexes over the Habiro ring*, arXiv:2510.04782v2, §2 around Definitions 2.7–2.9, Lemma 2.12 and Corollary 2.13 (pp. 15–19).
- The reviewed HB.6 library audit, all ten parent HB.6 statements and required proof/API sections, the accepted HC.4 supplement and its review, the independent HR.5 local chart, HR.1 Frobenius supplier, ownership boundaries and current stage/RS-08 links. Upstream Adic Spaces and Local Fields/Ramification documents supplied the reader-document models.

URLs, versions, read sections and SHA-256 hashes of the three PDFs are recorded in the packet. No required source is missing. The source's omitted local proof has been supplied explicitly rather than represented as an inaccessible citation.

New issue `HabiroNumberFields/EHB6.1` records GSWZ p. 4's reversed vanishing inequality: at a primitive m-th root the product vanishes for n>=m. The n=1,m=2 value is 2. The packet scopes this harmless misprint to the exact preprint version read, records the correction search, and awaits independent verification. Existing E22/E30 and the HR.5 irreducibility correction are referenced, with their boundaries; inherited E20/E21 corrections remain intact.

No mathematical follow-up in this part is needed before independent review. The reviewer should verify the supplied double-limit/cofinality proof, the coordinate compatibility and the source misprint. The maintainer's assembly/legacy-edge corrections remain necessary integration actions. Proof implementation and the downstream finite-etale/global-completion results retain their respective owners.
