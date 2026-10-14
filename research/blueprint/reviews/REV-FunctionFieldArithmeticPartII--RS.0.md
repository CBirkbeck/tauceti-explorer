# Independent review: finite native root comparisons

**Verdict: accepted after corrections.** Job `REV-FunctionFieldArithmeticPartII--RS.0`, issue #8951; reviewer Codex, session `codex-iOFbXE`, 2026-10-14. The reviewed planning pass was written by the separate session `codex-Bh4iCE` for #8916. This review changes only the named continuation deliverables, this report and its handoff.

The packet is a complete target-level planning pass, with RS.0 **planned**, rather than closed or implemented. It retains four precise supplier requests and the exhaustive `RS0-NATIVE-SIGNATURES` gap. Those boundaries are compatible with acceptance under the issue's instructions. The native targets have sound statements and construction sketches once the recorded inputs are supplied.

## Inventory and corrections

There are 13 nodes: five constructions, one definition, three theorems and four comparisons; 36 API items and 24 discriminating tests; 12 baseline declarations; four requests; one signature gap; and four new planets. Eleven nodes are verified and two corrected. No node, API item, test, baseline citation or planet was removed; no new node was needed. The accepted parent contributes the other two RS.0 planets, so the layer has six altogether.

1. **Finite normalization, including exponent zero.** The parent bundled `normalization-base-change-natural-iso` assumes a positive exponent. The continuation nevertheless includes scheme-level arrow naturality at n=0. Added `normalization-change-arrow`, whose ring-map square allows all natural exponents, and explained passage through Spec and both pullback projections. The positive bundled natural isomorphism is used only in its stated range. Added the direct `normalization-change-chart-factorization` dependency for the positive chart triangle. The packet, reader and Lean omission ledger agree. A new acceptance example, Q[T]/(1−2)=0 at n=0 and u=f=2, detects an erroneous cover claim.
2. **Full fibres in the universe comparison.** Restricting the enlarged test site to lifted schemes does not itself prove that every enlarged root line is a lift. Strengthened `UNIVERSE-GEOMETRY-RS0` to require essential surjectivity onto the full invertible-sheaf groupoid on every matched scheme, full faithfulness and section bijections. The inverse construction now recovers the line, section, identification and arrows from those inputs. There is no requested equivalence of arbitrary module categories across universes. The reader includes the same hypothesis, construction, acceptance condition and supplier contract.
3. **Inherited source findings.** Added the required independent `review` object to each of E2, E5 and E12, confirming the findings at their stated locators. Their previous searches remain attributed to the earlier passes; this review claims no new erratum search or discovery.

## Every target

IDs in the table have prefix `FunctionFieldArithmeticPartII:RS.0/`. The packet's `review.checked` records the same individual verdicts and reasoning.

| Target | Verdict | Independent check |
| --- | --- | --- |
| `native-power-pullback` | Verified | κ points from the power of the pulled line to the pullback of the power. Its zero and successor clauses use the inverse unit/tensor comparisons. The section law follows by induction from the imported section equations. |
| `native-root-pullback` | Verified | The identification is h*φ composed with κ; pulling an arrow preserves its section equation and power-identification square separately. Arbitrary pullback may collapse automorphism labels. |
| `native-root-coherence` | Verified | The identity/composition comparisons correct both M and the pulled target L. Supplier coherence restricts to root arrows and gives triangle, pentagon and finite-chain compatibility. |
| `native-framed-category` | Verified | A frame is extra object data, while Hom is exactly the underlying root Hom. Forgetting is fully faithful and its essential image is precisely globally trivializable root lines. |
| `native-framed-equivalence` | Verified | The coordinate and conjugated unit label satisfy both arrow equations. The inverse is the actual trivial line with its section and l⁻¹ mul(u)c_n; frames give unit/counit and their triangles. |
| `native-frame-change` | Verified | The inverse-power coefficient and source/target conjugation factors preserve both equations. Composition of frame changes supplies the cocycles without cancelling a section. |
| `native-coefficient-naturality` | Verified | Native unit/tensor comparisons and ΓSpec naturality give the images of u, y and every label w. The square remains valid for nonflat and noninjective maps. |
| `native-chart-realization` | Verified | Its three constituent functors give the Hom bijection with stabilizers intact. The Z/4 example correctly rules out objectwise essential surjectivity. |
| `native-local-normalization` | Verified | Refine both frame covers by affine opens, then use the positive-exponent finite-free unit-root cover. The native normalization isomorphism has label r and preserves both defining equations. |
| `native-stackification-equivalence` | Verified | The supplied root descent theorem makes the destination an fppf stack. Full faithfulness and local essential surjectivity identify its stackification; extending beyond the affine basis is an explicit request. |
| `native-chart-frame-independence` | Verified | Intrinsic roots compare the two associated stacks. Transition-unit roots realize that comparison locally; their ratios give the labelled modifications and overlap cocycle. |
| `native-finite-normalization-coherence` | Corrected | Added the all-exponent arrow square and the positive chart dependency. Induction and pullback uniqueness cover arbitrary finite bracketings and identity insertions, including the empty chain. |
| `native-universe-adapter` | Corrected | Required full invertible-fibre essential surjectivity and section/arrow comparison, so the inverse covers all roots on matched schemes. The test site remains the essential-image site. |

The six definition/construction targets each have six API items and four tests. Constructors and projections specify the actual native data; Hom equivalences supply arrow extensionality; functoriality, reconstruction and comparison maps let a user operate without unfolding the objects. The tests detect a reversed comparison, deleted stabilizers, illicit frame preservation, erased nilpotent sections, a falsely surjective chart, or an equivalence with unrelated larger test schemes. The Z/4, Z/9, n=1, n=0 and arbitrary-coefficient-change cases were checked mathematically as well as against the suggested scalar statements.

## Sources, suppliers and existing work

Read the full cited root passages in [Abramovich–Graber–Vistoli, arXiv v2](https://arxiv.org/pdf/math/0603151v2), Appendix B.1–B.2, printed pp.52–54; [Talpo–Vistoli, arXiv v2](https://arxiv.org/pdf/1410.1164v2), §3, Remark 3.1 and Proposition 3.4, pp.12–13, and the chart discussion through Corollary 3.13, pp.14–16; and [Yun–Zhang's published author-hosted copy](https://math.mit.edu/~zyun/GZW_ramified_published.pdf), Appendix A.1, Definition A.1 through A.1.3 and diagram (A.1), pp.514–516. The three PDF hashes match the packet. No restricted book was needed.

Read the complete [Stacks Kummer Lemma 59.28.3, Tag 040N](https://stacks.math.columbia.edu/tag/040N) proof and [stackification Lemmas 8.9.1–8.9.3, Tags 02ZO/02ZP](https://stacks.math.columbia.edu/tag/02ZO), including the supporting [Lemma 8.8.4, Tag 04Y1](https://stacks.math.columbia.edu/tag/04Y1) proof. The unit-root cover uses n≥1. Lemma 8.9.1 supplies the stackification characterization. The source matches distinguish those printed results from the authored native, frame, finite-chain and universe deductions. Talpo–Vistoli's fine saturated logarithmic hypotheses are not silently presented as the proof of the arbitrary pair-level formulas; those formulas have their own native construction sketches.

E5 and E12 were also checked on rendered page images. E2 follows from the full fibre and squaring diagram: a nonzero square-zero section over dual numbers remains different from the zero section under any unit isomorphism. The correction concerns the full nonreduced quotient fibre. The reduced Bμ₂ description uses the paper's tame setting. E12 is scoped to the specified preprint; no claim about the inaccessible version of record was added. No source passages or source excerpts were added to the repository.

Read the accepted parent's directly used root-power, framed-category, normalization, coefficient-change and descent targets. The all-exponent `normalization-change-arrow` explicitly sends the adjoined root using the inverse unit label; its range is adequate for the corrected n=0 argument. Read the exact SF.3 Picard-groupoid and D0 stackification/quotient contracts, plus R09.3 `fpqc-quasicoherent-descent` and `finite-locally-free-descent` in the accepted A0-extension packet. Those supply effective module descent and rank-one detection, rather than deriving effectiveness from an affine chart. The remaining affine-basis and universe operations are precisely requests, with their use and required equations stated.

Read the SF.1/SF.3 reviewed library audit, the stage brief and upstream order/links. FunctionFieldArithmeticPartII is outside the listed Caraiani–Newton 94; its imported foundational suppliers occupy tiers 2–4. No link file adds an overlooked RS.0 requirement, and no new upward citation or ownership move was introduced.

Read both complete current upstream AlgebraicVectorBundles and JacobianChallenge roadmaps at commit `0d144d044dacebca17b654695b6f1ad58f159b27`, and the cited AlgebraicVectorBundles suggested section/tensor/pullback declarations. Generic line theory and monoidal infrastructure remain imports. Read the current Tau Ceti coordinate, automorphism and line-pullback declarations at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, including their surrounding assumptions. Current native coordinates and ordinary line pullback are already implemented and are not new nodes. Root-specific native comparison targets were not found in those current library/roadmap searches. Current imports are kept separate from the older compilation baseline.

## Pinned declarations and validation

All 12 baseline names and their statements were independently read at Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` and Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. All eight containing source files were checked byte-for-byte against the exact pinned GitHub files. No baseline citation needed removal or replacement.

| Declaration | What was checked |
| --- | --- |
| `TauCeti.AlgebraicGeometry.InvertibleSheaf.trivial` | Native rank-one free-PUnit line; not a root-object carrier. |
| `TauCeti.SheafOfModules.freePUnitIsoUnit` | Free-PUnit-to-structure-module isomorphism, including its sheafification and universe assumptions. |
| `TauCeti.SheafOfModules.LocalTrivializations.ofIsInvertible` | Actual open atlas with CoversTop and rank-one trivialization isomorphisms. |
| `AlgebraicGeometry.Scheme.Modules.pullback` | Native module pullback for arbitrary scheme morphisms. |
| `AlgebraicGeometry.Scheme.Modules.pullbackId` | Pullback of the identity to the identity functor, with its actual direction. |
| `AlgebraicGeometry.Scheme.Modules.pullbackComp` | Successive pullback to composite pullback, with its actual direction. |
| `AlgebraicGeometry.Scheme.ΓSpecIso` | Ring isomorphism from affine global functions to the specified ring. |
| `AlgebraicGeometry.Scheme.ΓSpecIso_naturality` | The coordinate square uses the actual appTop map and the two affine comparisons. |
| `AlgebraicGeometry.Scheme.affineCover` | A jointly covering native open cover by spectra, without quasi-compactness. |
| `AlgebraicGeometry.Scheme.fppfTopology` | Generated by jointly surjective flat locally finitely presented families. |
| `AlgebraicGeometry.Scheme.zariskiPrecoverage_le_fppfPrecoverage` | Zariski families are fppf; the module also provides composition/base-change stability. |
| `CategoryTheory.Limits.pullback.hom_ext` | Two projection equalities imply equality of morphisms into the chosen pullback. |

The suggested file follows the binding compact shape in WORKERS.md. Absent root, monoidal, stackification and universe carriers stay in the complete README signature ledger. There are no admitted data definitions or replacement predicate carriers. Its scalar equations are mathematical consequences to be implemented, not certificates of the native geometric comparisons.

Validation on the final deliverables:

- `python3 scripts/check_blueprint.py research/blueprint/packets/FunctionFieldArithmeticPartII--RS.0.json`: zero errors and zero warnings, using the pinned declaration index.
- `lean-check research/blueprint/suggested/FunctionFieldArithmeticPartII--RS.0.lean`: exit 0; ten warnings, all declaration uses of `sorry`; no other diagnostics.
- `python3 research/blueprint/intake.py check-files` on the five changed deliverables: passed.
- `git diff --check`: passed.

No unresolved contradiction remains. The orchestrator should retain the four supplier requests and signature gap through assembly; future discharge must establish the strengthened universe fibre comparison and all native equations. Acceptance supplies a reviewed plan, not a proof implementation. No additional question or ownership decision is needed to finish this review.
