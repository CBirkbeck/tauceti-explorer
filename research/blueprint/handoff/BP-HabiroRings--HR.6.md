# BP-HabiroRings--HR.6 handoff

Codex — codex-QDy6k1 completed this single target-level planning pass for issue [#6501](https://github.com/CBirkbeck/tauceti-explorer/issues/6501). The [claim confirmation](https://github.com/CBirkbeck/tauceti-explorer/issues/6501#issuecomment-6009651198) belongs to this session. This is a complete planning submission, not a checkpoint or an implementation claim.

## Delivered

- [Packet](../packets/HabiroRings--HR.6.json): scope exactly HabiroRings:HR.6, part HR.6, status complete; HR.6 coverage planned.
- [Reader](../readmes/HabiroRings--HR.6.md): conventions, all retained target contracts, new proof route, API/tests, owners and gaps.
- [Suggested signatures](../suggested/HabiroRings--HR.6.lean): genuine ordinary Mathlib interfaces and an exact omission ledger for unavailable imported carriers.

The five accepted parent HR.6 nodes are imported by their original IDs, without edits or duplicate declarations. Three new nodes comprise one construction, one theorem and one comparison. The construction has five API items and four named discriminating tests. Two new planets are nominated. There are 22 pinned baseline declarations, four explicit gaps and one request to HB.7. All declarations stay unchecked.

The downstream completion proof is now specified: use m=1 integral constant evaluation and the **finite sum** inverse-tensor certificate to trivialize R⊗_H M_ξ, then lift its generator to R[[X]]⊗_H M_ξ and apply ordinary Nakayama with (X) contained in the Jacobson radical. A surjection between invertible modules is bijective. This does not assume the original line free, R local, an integral full raw Taylor series, or a canonical lifted generator.

The field scalar comparison imports the actual conditional HB.7 scalar equivalence with a common Δ, transports it through the Taylor-compatible κ maps, and records the fibre/completion/Picard squares. Current HQ.3–5 packets already preserve the late edge into HR.6; the historical cycle concern is accounted for without a reverse prerequisite or a restructuring proposal.

## Validation

`python3 scripts/check_blueprint.py research/blueprint/packets/HabiroRings--HR.6.json` reports no errors or warnings, using the available declaration index. Submission file checks and whitespace checks passed. The suggested file elaborated with `lean-check` at Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174, with only intentional proof-hole warnings. No TauCeti module is imported, so the shared checkout's newer TauCeti head is irrelevant to that elaboration; the TauCeti library search itself used the exact f790474821cf4256814db967cb154e7af3d0c369 git object. No build, cache download or language server was started.

## Exact remaining work

1. **G-global-descent:** resolve the accepted HB.7 follow-up's additive closure, finite projectivity, actual chart base changes and conservative descent. Its inverse tensor bijectivity/certificate is conditional on these. The completion proof here does not supply them.
2. **G-arithmetic-naturality:** establish HB.7's supported field scalar equivalence and the existing D.1/D.4/M.8 restriction/regulator/torsor interfaces. Formal Picard functoriality alone is insufficient.
3. **HB.7 request:** add the m=1 integral constant-evaluation API, with semilinearity, addition and graded multiplication. This belongs in HB.7, which owns the sections; do not reconstruct them here.
4. **G-nonzero-regulator:** exhibit an actual F, Δ, ξ and prove M_ξ has Picard class different from 1. GSWZ's cubic discriminant −23 knot comparisons and numerical integrality checks do not prove nonfreeness. Neither ring noninjectivity nor nonzero K₃/local regulators suffice. No such witness was established.
5. **G-signatures-and-enhanced-inputs:** install genuine imported Habiro/K₃/q-Hodge/enhanced module carriers and discharge inherited HR.2/HR.4/HQ supplier refinements. Replace the exact omitted actual signatures with typed ones when those carriers exist. Preserve current suppliers until RS-10 is installed atomically.

Resume from the packet's four gap records and HB.7 request, not from a new plan of the five retained parent targets. In particular, do not interpret the conditional completion proof as closure of the supplier descent gap or as existence of a nonzero regulator class.

## Sources and inherited findings

Read GSWZ arXiv:2412.04241v2 §1.5, §§3.2–3.3 and §§4.5–4.6; Wagner arXiv:2510.04782v2 paragraph 1.4 and Theorem 3.11–Corollary 3.13, with the coefficient comparison checked at Corollary 2.13; Wagner arXiv:2410.23078v5 §3.4 étale base-change proof. Also checked the 14 January 2026 author-hosted q-Habiro PDF at the introductory/comparison passages. Exact URLs, hashes, editions, dates and read locators are in the packet. The AdicSpaces and HodgeStructures upstream documents supplied style examples.

Inherited HabiroRings/E6 persists in the current author copy; use Theorem 3.11(b) in Corollary 3.13. HB source issues E23/E24/E26 are carried by reference and their accepted dispositions are respected. No new source issue was asserted. No inaccessible source was substituted for missing evidence. The missing source-supported nonfreeness witness remains the explicit gap above.
