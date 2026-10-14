# REV-PKG-AutomorphicGaloisRepresentations~2 — completed independent review

Issue #7918. Codex, session `codex-VHGxgz`, 14 October 2026.

The review is complete with verdict **needs_changes**. The report is
[REV-PKG-AutomorphicGaloisRepresentations~2](../reviews/REV-PKG-AutomorphicGaloisRepresentations~2.md).
The package review.json records the exact independent reviewer name and date.
This is not a review checkpoint. No second issue was claimed.

## What changed

- Corrected §1.5's classical irreducibility reference to §4.8.
- Removed the generic `hilbertGeomCharpoly_normTwist` Lean theorem and its extra
  README API. Current IntegralHeckeAndGaloisDeterminants Layer 3a.1 owns generic
  scaling/duality. Boundaries name that deferral; no removed-target stub remains.
- Corrected §7.1's unconditional almost-strict operation claim. Rank-two direct
  sums/tensors leave its domain; restriction or ramified twisting can require
  new unramified coefficient-place comparisons. Added two negative controls.
- Replaced Kisin's inaccessible AMS locator with verified public author-copy
  pages, and supplied the full continuation hypotheses of Proposition 5.14 and
  Corollary 5.15. Corrected the Buzzard compactness/gluing/classicality locators
  and added Wintenberger's verified alternative theorem.
- Scoped finite untwisting and the proved ordinary quotient dictionary to the
  parallel-weight theorem. Marked the remaining general-multiweight comparison
  explicitly and added a `(2,4)` principal-unit test detecting its algebraic
  factor. The fixed-DVR-lattice algebra remains valid in its stated generality.

All 66 original targets, 90 API names and 66 tests remain. The previous package
handoff's target-to-section map is still the durable map; no packet edit was
made. Five downward interfaces remain. The 12 October amendment permits heavy
arithmetic objects to stay in the README, and supersedes the older request to
put all those signatures into Lean.

## Exact remaining work

Repair §4.10/§5.1's general-weight Hilbert quotient-character comparison.
Hida Theorem I(iv), printed p. 118, provides existence of a rational filtration;
BGV §3, internal pp. 7–8, shows a labelled algebraic factor on principal units.
Skinner–Wiles §3.3, pp. 38–39, covers the parallel-weight formula. These do not
supply the package's complete general-weight normalization dictionary.

State a sourced comparison with exact weight, Hecke action, reciprocity and
representation conventions: quotient on all units, value at a chosen
uniformizer, change-of-uniformizer identity, and transport to §3.11's geometric
ρ/arithmetic-dual objects. Recover the other character from determinant. Give
exact locators or explicit intermediate comparison targets with hypotheses.
Do not infer these characters from mere triangularizability or saturation;
do not claim finite twisting removes a nonzero labelled algebraic factor.
No implementation of a Hida family or heavy Lean carrier is needed.

The report records all source checks and distinguishes inaccessible original
proofs from conclusions directly sourced in Kisin, Skinner, Ribet or Saito's
supplement. Those already explicit geometric/source supplier obligations are
not a demand to implement the imported theories in this package.

## Validation and ownership

The current upstream revision checked was
`0d144d044dacebca17b654695b6f1ad58f159b27`; current Tau Ceti was
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Read two complete upstream models,
relevant current ModularForms/IHG/StableReduction contracts and current library
declarations; screened all nine newer roadmaps and Completed ownership matches.
No additional duplicate modular target was found. The report lists the one
removal and every adversarial target check.

Fresh final lean-check exited 0: 20 warnings, all uses of sorry. The Lean file
has 325 lines, nine light definitions with real bodies, nine named theorems and
18 examples. Ten signatures were compared with the README. Imported Landau
source matched the exact pinned git object. No language server or forbidden
lake command was used.

Packet validation: zero errors/warnings, input unchanged. Sorry-data and
intake file checks pass; internal anchors/prerequisite ordering and diff
whitespace pass. Metadata unchanged. Only the package README, Suggested.lean,
review.json, this handoff and the independent report change.

Sources were paraphrased. No restricted book or source asset was copied into
the repository. Nothing in disposable scratch is needed to resume: follow the
remaining-work paragraph and the durable report/source links.
