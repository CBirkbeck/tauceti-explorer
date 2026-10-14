# BP-FunctionFieldArithmeticPartII--RS.0 handoff

Job [#8916](https://github.com/CBirkbeck/tauceti-explorer/issues/8916), agent Codex, session `codex-Bh4iCE`, 14 October 2026. The bot confirmed the claim in [comment 6163405054](https://github.com/CBirkbeck/tauceti-explorer/issues/8916#issuecomment-6163405054). This run takes exactly one job.

## Result and scope

The planning pass is complete. The packet has exact scope `FunctionFieldArithmeticPartII:RS.0`, part `RS.0`, packet status `complete`, and stage coverage `planned`. It has 13 new, disjoint target-level nodes: five constructions, three theorems, one definition and four comparisons; 36 API items and 24 unit tests; four new planets and 12 exact pinned baseline declarations. The accepted parent's two RS.0 planets bring the layer total to six. No parent, supplier, library, atlas, queue or reserved-ID file is changed.

Deliverables are the [packet](../packets/FunctionFieldArithmeticPartII--RS.0.json), [reader](../readmes/FunctionFieldArithmeticPartII--RS.0.md) and [suggested file](../suggested/FunctionFieldArithmeticPartII--RS.0.lean), plus this note. All declarations have implementation status unchecked. This is a roadmap planning result, not an implemented root stack or a closed supplier graph.

The reader specifies the native tensor-power pullback comparison and section law; root pullback with both arrow squares and pseudofunctor coherence; the actual chosen-frame category and coordinate equivalence; root/target frame changes; arbitrary coefficient naturality; chart realization retaining every labelled arrow; local normalization on the parent's positive-exponent fppf cover; the associated-stack equivalence; chart-frame independence; arbitrary finite normalization-chain coherence; and a universe comparison restricted to the essential-image lifted site.

The suggested file is compact and uses actual pinned carriers. It states six coordinate end conditions, three native carrier checks and worked examples. It introduces no substitute root data structure, arbitrary proposition field, admitted data definition or developed auxiliary theory. All 13 whole native signatures, and every API/test requiring those absent carriers, are exhaustively listed as README targets in the compilation-boundary ledger. Compilation of scalar statements is not evidence that the geometric targets are implemented.

## Reuse and ownership

The accepted parent `FunctionFieldArithmeticPartII.json` is unchanged. Its RS.0 tensor/section powers, scalar root equations, framed coordinate groupoid, normalized embedding, algebra, covers, coefficient maps and two-/three-step chosen normalization comparisons are prerequisites by their existing IDs. The continuation does not copy them into new nodes. The existing `RS.2/root-point-groupoid` is the finite point-action groupoid already used by the parent RS.0 embedding; infinite towers, coherent infinite reindexing and genuine 2-limits remain RS.2.

The parent `RS.1/root-fpqc-descent` supplies root descent, with native quasi-coherent and finite locally free descent from `AlgebraicModuliForArithmeticGeometry:R09.3`. The continuation does not replan those results. Generic stackification and groupoid quotient machinery are `DiamondsAndVStacks:D0/stackification` and `D0/groupoid-quotients-and-two-fibre-products`. The Picard pseudofunctor is `SchemeAndStackFoundations:SF.3/picard-groupoid` in its SF.3 part packet.

Current TauCetiRoadmap commit `0d144d044dacebca17b654695b6f1ad58f159b27` was read directly. AlgebraicVectorBundles L0A–L0B already specifies generic tensorSection, unit and strong symmetric monoidal module pullback, section pullback and the native rank-one comparison. Those are imported, not new root-specific targets. JacobianChallenge Layer A was read as the existing invertible-sheaf/Picard owner. The atlas snapshot is not the authority for these imports.

Current Tau Ceti commit `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` was read directly. Native trivialization coordinates, their local frame/generator laws, scalar endomorphism/unit-automorphism equivalences and ordinary line pullback with identity/composition comparisons already exist. Their exact modules/declarations are recorded under `currentLibraryImports`; none is presented as a new target or an old-pin declaration.

## Remaining contracts and review resumption

The plan has four precise supplier requests, not four unspecified mathematical steps:

- `JAC-A-RS0`, SF.3: integrate the existing AlgebraicVectorBundles tensorSection, unit and coherent monoidal pullback interfaces with native line coordinates; supply pure-tensor multiplication, the unit-section coordinate and section/pullback naturality with identity/composition diagrams. It refines the parent's JAC-A boundary.
- `AFFINE-BASIS-RS0`, SF.1: stack restriction/extension between the full scheme fppf site and its affine test basis, with the induced covering topology and native pullback compatibility.
- `UNIVERSE-GEOMETRY-RS0`, SF.0: actual coherent lifts of schemes, modules and invertible sheaves, with section, tensor, units, Spec/Γ and pullback comparisons on their essential images.
- `UNIVERSE-STACKS-RS0`, D0: transport of pseudofunctors, IsStack, stackification, transformations and modifications across the named equivalent lifted sites.

The single recorded gap `RS0-NATIVE-SIGNATURES` is the boundary between these mathematical signatures and the older compilation baseline. The whole native root, section/monoidal, stackification and universe-adapter signatures are README targets until their carriers and supplier interfaces exist. The packet is complete under the protocol's target-level planning rule; it is not marked closed. Follow-up work discharges these exact contracts and replaces the enumerated signature omissions, without rebuilding generic supplier objects. Formal proof implementation remains the work specified by the roadmap.

An independent review can resume from the reader's comparison architecture and then check all 13 targets against their listed parent/supplier statements. In particular check: arrow power squares; frame-change direction `u′=b*u*a^{-n}`; the normalized root section `r*y` with `r^n=u`; objectwise full faithfulness versus local essential surjectivity; the affine-basis adapter; and the restriction of universe equivalence to matched lifted objects. Distinct labels at zero sections, Z/9 nilpotents, infinitesimal μ_p and nonflat maps are explicit regression requirements. No new higher-tier ownership move or restructuring is proposed.

## Sources

Read only the relevant passages, stated in our own words in all deliverables:

- Abramovich–Graber–Vistoli, arXiv:math/0603151v2, Appendix B.1–B.2, printed pp.52–54.
- Talpo–Vistoli, arXiv:1410.1164v2, §3 opening and Remark 3.1, pp.12–13; Proposition 3.4, p.13; finite local models and Corollary 3.13, pp.14–16. Infinite results provide context only.
- Yun–Zhang, author-hosted published copy, Appendix A.1, Definitions A.1–A.2 and A.1.1–A.1.3, pp.514–516.
- Stacks Lemma 59.28.3, Tag040N; Lemmas 8.9.1–8.9.3, Tags02ZO/02ZP; Lemma 8.8.4, Tag04Y1.
- Current AlgebraicVectorBundles L0A–L0B README and the relevant Suggested tensor/section/pullback targets; JacobianChallenge Layer A; current native LineBundle source modules.

Public URLs, access date, precise reading scope and PDF byte hashes are in the packet. No book or restricted source was needed, and no source needed by this planning pass is unavailable. Three accepted parent corrections E2, E5 and E12 were retained with corresponding passages reread; old searches remain explicitly inherited. This pass makes no fresh erratum-search or whole-paper-audit claim. No source excerpt or source file enters the repository.

## Validation

`lean-check` succeeded at the recorded atlas pins, with exactly ten declaration-uses-sorry warnings and no errors or other warnings. The suggested file has fewer than 200 lines and no admitted data. The baseline is Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`, Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. Statements and hypotheses of all 12 cited declarations were read; the eight containing files were byte-compared with the exact pinned GitHub sources. Their receipts, preserved here because scratch is removed after submission, are:

| Source file | SHA-256 |
| --- | --- |
| `TauCeti/AlgebraicGeometry/LineBundle/Basic.lean` | `a5b3a45ddf3e6d8ecee349b6a85d8e6381127b7bfbe6a4d70ac761c0340e3e43` |
| `TauCeti/Algebra/Category/ModuleCat/Sheaf/Invertible/LocalTriviality.lean` | `7996f0502b918063a75a7a445d65a622654c5a8a19a182db254bbb5d1b80871e` |
| `TauCeti/Algebra/Category/ModuleCat/Sheaf/Free.lean` | `0d23279d7c4883929a50c1e3cb5164b1eda157884aeefe51b2cccda1d7715b47` |
| `Mathlib/AlgebraicGeometry/Modules/Sheaf.lean` | `533643aaa7cfe615c84d1313d7b4e34b8b5cde3a26a4a9f5bca66e5a173fbff6` |
| `Mathlib/AlgebraicGeometry/Scheme.lean` | `7252c65ef22e7b5fd516392a4e062f0d12150924ea055b65f08bc707db9d814a` |
| `Mathlib/AlgebraicGeometry/Sites/Fpqc.lean` | `258918aa1cfc26d5244255741a1c96abdd4f909f07b460cbd71ea305d835f708` |
| `Mathlib/CategoryTheory/Limits/Shapes/Pullback/HasPullback.lean` | `5d22a345f48f72cfd01ea8e354aed46df7d88dc829d349ed32807f198a154bd8` |
| `Mathlib/AlgebraicGeometry/Cover/Open.lean` | `8d130d92c2597ca90827e1d63e1ad99467a96831771f6831596f9b932597dce8` |

The packet checker with the pinned declaration index reports zero errors and zero warnings. The admitted-data check and intake file checks pass; the final submission also checks whitespace and exact changed-file scope. API/test names in the packet all occur in the reader; new node IDs are disjoint from the accepted parent. No Lean language server, library build or dependency update was started.

## Selection and stopping

At selection, none of the manager's priority issues was available. The available top candidates had maintainer blocks about their current upstream authority, and the higher-priority focus review candidates lacked the scoped finished inputs or were already completed. This narrow available blueprint continuation was selected after those eligibility checks. The run claims no second issue and does not review or red-team its own work. Scratch is removed after opening the pull request; this note and the deliverables carry everything needed for independent review or a supplier follow-up.
