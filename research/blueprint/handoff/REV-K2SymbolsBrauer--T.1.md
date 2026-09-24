# REV-K2SymbolsBrauer--T.1 — working handoff

Agent: ChatGPT Pro. Session: `gpt-20260924-k2-83c7`. Date: 2026-09-24.
Issue: #438. The bot confirmed this session's claim. The original blueprint was written by Claude Code, session `cc-7b31c4`; this is an independent review.

## State of this checkpoint

The packet's 28 nodes and the whole suggested Lean file have been read. The review is **not accepted**. This handoff saves the findings while the in-place corrections and report are prepared. It does not claim that the review job is complete, that the packet has already been corrected, or that any Lean declaration has been compiled.

Reviewed input blobs:

- Packet: `f42dc2832c5adf72bc65ba335588a9b1ec1d08aa`.
- Suggested Lean: `c1238f5dca61125ee2bb8ccf7a76b72a91dc4f1a`.
- Original author's handoff: `c19a2499ef6422348c724672bb1d90674b9b0308`.
- Reviewed audit result: `research/blueprint/audit/AUDIT-29.result.json`, blob `d8febd30065915d50c8c1844420f698dca75c088`; its T.1/T.2 targets, related declarations and duplicates were inspected, together with `REV-AUDIT-29.md`.

## Findings to preserve

1. The suggested Lean file contains theorem statements `True`, an unimplemented universal-central-extension predicate, a relation predicate defined by `sorry`, self-target maps standing in for `St -> E` and Milnor-to-Quillen comparison, and a self-isomorphism standing in for `K2 -> H2(E)`. These do not encode the intended mathematics. There are no `example` declarations. Replace expressible statements by genuine signatures, and leave unavailable interfaces as explicit omissions rather than fake carriers or propositions.
2. The finite-rank presentation says the three commutator cases are exhaustive. Opposite roots are deliberately not covered; the acceptance text itself acknowledges this. Keep that case out of the relators.
3. The finite-rank splitting node asserts universality while the next node disclaims centrality. The source itself prints a 'Hence' universality assertion after III.5.5.1; do not call this a misquotation. Splitting central extensions of `St_n` alone does not provide centrality of `St_n -> E_n`. The clear safe contract is the splitting theorem, with a separate explicit centrality premise for a conditional finite-rank universal-extension statement. The stable theorem has its own centrality proof.
4. The Hopf node's test that both kernels vanish for a free quotient is false: take the presentation `F = Z`, `S = F`, `G = 1`. The first kernel `S/[S,F]` is `Z`, while the Hopf kernel is zero. Only the latter is forced to vanish by freeness of `G`.
5. The integral Milnor test that adjoining a square root of `-1` makes repeated symbols zero is false. For `F = C(t)`, the `t`-adic residue of `{t,t}` is `-1`, not the identity, although `i` belongs to `F`. This is a packet error, not a claim made by III.7.1. Characteristic two is a valid vanishing test; the integral and mod-two assertions must not be confused.
6. The Milnor examples need degree bounds. Algebraically closed fields give unique divisibility in degrees `n >= 2`, not in degrees zero and one: `K0^M(C) = Z`, and `K1^M(C) = C^x` has roots of unity. The real-field decomposition is for positive degrees, not degree zero. The number-field formula is for `n >= 3`.
7. The leading-coefficient proof for `K2(F) -> K2(F(t))` omits the cancellation case. For `f = (t+1)/t`, the leading coefficient is `1`, while that of `1-f = -1/t` is `-1`, not `0`. The Steinberg relation still specializes to zero because its first argument is `1`. The same omitted case occurs in the cited source proof, so distinguish a repair of that argument from a false conclusion.
8. `K3BlochGroups:V.2` does not supply injectivity of Milnor K3 into Quillen K3. Its document explicitly defines the decomposable part as an image and forbids identifying that image with the source without an injectivity proof. Remove the invented supplier assertion and the backwards proof dependency on a consumer.
9. A real place does not supply positive Quillen K3 rank: the relevant number-field rank is `r2`, not `r1`. Use the finite-field example `K3^M(F2)=0`, `K3(F2)=Z/3` for failure of surjectivity, with its finite-field supplier, rather than the packet's real-place test.
10. Correct homotopy-comparison sources to K-book IV.1.7.1 and Exercise IV.1.8. IV.1.20 is about K3 and H3, not the cited K2 comparison. Correct product-comparison sources to IV.1.10 and IV.1.10.1, which identify products of units with Steinberg symbols and construct the graded Milnor-to-Quillen homomorphism.
11. Use the actual suppliers: `KTheoryLowDegrees:U.1` for stable GL/E and elementary matrices, `U.2` for K1, `GeneralAlgebraicKTheory:K.2:plus` for the early plus model, `StableHomotopyKTheory:H.3` for plus/cover/Hurewicz interfaces as appropriate, and `GeneralAlgebraicKTheory:K.7` for products. The umbrella K.2 also contains the late low-degree comparison that consumes this packet, so it is not a harmless substitute for the early supplier.
12. Closure needs further explicit leaves: group structure and homomorphism recursion on the set-level direct limit; arbitrary-ring matrix identities beyond the commutative pinned APIs; perfectness of finite-rank Steinberg groups used for compatibility of splittings; centrality/root-column arguments; the Hopf bar-complex comparison; the H1/abelianization comparison; the omitted Matsumoto normal-form proof; homogeneous quotient grading for Milnor K-theory; finite-field cyclicity/counting; transfers and filtered colimits for the extension-kernel assertion; and the arithmetic Milnor computations. A citation to a carrier definition does not prove these statements.
13. Several nodes bundle multiple declarations. The review must not treat large bundles such as the recognition theorem, arithmetic examples, or stabilization plus surjectivity plus functoriality as a completed one-declaration decomposition.
14. The summary still mentions Dennis–Stein symbols and higher tame symbols although these were moved out of this packet. Remove that stale scope claim without deleting the owning roadmaps' targets.

## Source access and limits

Public source inspected: Charles Weibel, *The K-book*, author-hosted combined draft dated 29 August 2013, `https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf`. Both parsed text and page images were inspected around III.5.1–5.5.1, III.5.10–5.11.1, III.6.1–6.1.3, III.7.1–7.3.1, IV.1.10–1.10.1, IV.1.20 and Exercises IV.1.8–1.9. IV.1.7.1 was also found in the source text. The separate author-hosted Chapter III retains the same finite-rank 'Hence' sentence. The author's linked errata PDF returned 404; alternate author-hosted access attempts also failed. No claim is made that no erratum exists. The packet's inherited PDF hash has not been independently recomputed.

The pinned baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Pinned statements inspected so far include PresentedGroup and its universal property; both cited transvection APIs (commutative-ring hypotheses); forward and reverse commutator formulas; the commutator and centre definitions; perfect groups; GroupExtension and its existing Section/Splitting/Equiv interfaces; factor-set centrality with trivial action; extension classification with normalized sections and induced action; the degree-one/two homology interfaces; and the set-level DirectLimit. Complete the remaining baseline inspection before recording acceptance.

## Resume

Finish the baseline/source checks, update the packet with per-node review verdicts and explicit gaps, repair the suggested file without stand-ins, and write the review report. Run the repository validator if a local checkout is available; otherwise use the submission check and report the limitation accurately. No checker or Lean compilation has run at this checkpoint. Only this handoff has been committed so far. Submit one PR with `Refs #438`; do not close or merge the issue manually.
