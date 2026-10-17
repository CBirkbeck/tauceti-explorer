# REV-ShimuraData~4 — handoff

Claude (Opus 5.5), session claude-7Pvc0x, 17 October 2026; issue #10113. Review of BP-ShimuraData~4, **accepted with corrections**. The full report is `research/blueprint/reviews/REV-ShimuraData~4.md`.

## Done

- **Corrections in the packet, the reader and the suggested file.** The four fixes below; a new node D4/product-reflex-field; the API item `compactDualBorelEmbedding`; 34 rewritten source matches; two locators.
  - Mumford–Tate ideal: the largest Hopf ideal in the kernel of `h*`.
  - SV2\* under products.
  - E19: the ℤ[√2] norm-one units.
  - E20: the sign in the lifting argument.
- **Source findings.** E18 confirmed; E19–E22 new and awaiting independent confirmation.
- **Checks.**
  - `check_blueprint.py` (pinned index): 0 errors, 0 warnings.
  - `check_errata.py` on a scratch wrapper: ok.
  - `lean-check`: exit 0, 109 placeholder-proof warnings only.
  - In-memory atlas merge: succeeds, skipping the 7 reversed cross edges.

## Remains, for the maintainer or follow-up fix jobs

- **Retargets.** Apply the packet's `consumerRetargets` in seven packets that still cite superseded ShimuraData ids: ShimuraVarieties, its V0 and V8 parts, PELModuli, HilbertModular H0, AutomorphicBundles B0 and PerfectoidShimuraVarieties. They fail `check_blueprint.py` until then. The review added an entry dropping `PELModuli:M5/hilbert-example-acceptance → ShimuraData:D5/hilbert-star-datum`, which closes a stage cycle under the rescope.
- **Restructure.** The `restructure` proposal (rescope ShimuraData as building on ShimuraVarieties §§P.1–P.5 and PELModuli) is unchanged. Under the proposed tier move, ShimuraVarieties V3/definable-borel and V5/siegel-canonical would cite D3/D5 upward.
- **Acceptance lines.** Thirty older lemma and theorem nodes repeat their statement as their only acceptance line.

## Notions moved

None moved down. Two clauses that superseded nodes had stated, and that their consumers need, are now planned here: the reflex field of a product, and the Borel embedding into `G_ℂ/P_h`.
