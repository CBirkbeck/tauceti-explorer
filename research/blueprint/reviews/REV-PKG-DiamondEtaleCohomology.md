# Independent package review: étale cohomology of diamonds

**Verdict: accepted after correction.** Codex, session `codex-aouMvF`, 9 October 2026. This worker did none of the original package work. The bot confirmed the claim for [issue #7512](https://github.com/CBirkbeck/tauceti-explorer/issues/7512#issuecomment-6073626815) before the review began.

Reviewed the [package](../packages/DiamondEtaleCohomology/README.md) against the accepted [C0–C7 plan](../packets/DiamondEtaleCohomology--C0.json) and [C8–C9 plan](../packets/DiamondEtaleCohomology--C8.json), following Protocol §§5, 13 and 20 and UPSTREAM_GUIDE. This verdict concerns faithful package transfer. The plan's twelve gaps and twenty-five supplier requests remain mathematical work; no stage is declared proved or closed.

## Six required checks

| Criterion | Result and evidence |
| --- | --- |
| Upstream form | Pass. Compared scope, motivation, conventions, layer ordering, target density, API and examples with the upstream AdicSpaces and DGAInfinity READMEs. The ten layers have thematic subsections and precise prerequisites. The final README is 185,074 UTF-8 bytes, below 200,000. |
| Fidelity | Pass after reference corrections. Every target, API statement and test contract was compared with its plan entry. All 184 targets, 256 API items and 176 tests are present, with all six separately listed hypotheses and all source locators retained. Rewritten statements have the same mathematical content. Every direct local prerequisite is retained; external prerequisites identify their owning layers or actual baseline declarations. The 184-vertex graph has 535 internal edges and no cycle. |
| Own words | Pass after rewriting seven source-like statements. The document specifies definitions, interfaces and theorems in mathematical development order; it does not narrate a paper section by section. Every target has numbered theorem/definition or section locators and printed pages, with stable Stacks tags where applicable. Passage comparison and a supplementary normalized 18-token scan against six public sources found no remaining matching run. No source passages or source files are submitted. |
| No process | Pass after comment corrections. The README and Suggested.lean contain no packet filenames, job identifiers, reviews, checkpoints or coverage statuses. The standard opening prototype note, mathematical roadmap identifiers and baseline pins are retained. |
| Suggested.lean | Pass under Protocol §13's explicit omission rule. The final `lean-check` exited 0: no errors and 729 warnings, all `declaration uses sorry`. The declarations were checked against the retained target/API/test contracts and their marked limitations. Active Lean content is unchanged from the accepted assembly. There are 71 unique individual Mathlib imports, 768 named declarations (including instances) and 159 typed examples. The file contains no axiom, arbitrary proposition placeholder or assumed theorem record. |
| Metadata | Pass. The file is exactly `topic = "math.AG"` followed by a newline; TOML parsing confirms one key. Algebraic geometry fits the diamond geometry and étale cohomology scope. |

| Layer | Targets |
| --- | ---: |
| C0 | 24 |
| C1 | 12 |
| C2 | 14 |
| C3 | 11 |
| C4 | 18 |
| C5 | 9 |
| C6 | 7 |
| C7 | 24 |
| C8 | 51 |
| C9 | 14 |
| Total | 184 |

## Corrections applied

- Replaced 52 internal references written as slugs or full local identifiers with numbered targets. This includes base-change hypotheses, coreflection formulas, compactification consequences, annuli, point cohomology and the uniform-bound/compact-generator chain.
- Rephrased C0.10, C2.1, C2.8, C4.16, C4.18, C6.5 and C7.7. Their quantifiers, geometry, coefficient assumptions, conclusions, API and citations are preserved. In C7.7, finite presentability is explicitly characterized by preservation of filtered colimits, keeping the plan's ordinary-category meaning of compactness.
- Made `IsPerfectLocalSystem.dualizable` at C7.12 an explicit input to C9.10 while retaining its existing prerequisites.
- Removed the remaining packet, handoff and Protocol references from Lean comments. Added target markers for the modified invariant, its tower/base-change laws, finite monotonicity and finite equality. Clarified that the shared `CommRing` carrier displays the commutative special case of site results stated for arbitrary rings in the README. No active declaration changed.

## Mathematical fidelity and ownership

The introduction and entries retain arbitrary-rank `C⁺` in geometric stalks, the adequate-cardinal cutoff, derived rather than ordinary Postnikov limits, and the distinction between local finiteness and one uniform cohomological bound. Constructibility and its stalk criterion keep noetherian coefficients. Tensor and perfect-constructible results keep commutative coefficients; prime-to-p results keep an explicit annihilator. Geometric dimensions use `WithBot ENat`, with empty spaces at bottom, while field degrees use `ENat`.

C4 keeps `R⁺ ⊂ R°`, unique valuative extensions and the quasiseparated-target qualification in the converse of ECD Proposition 18.9, p. 106. A quasicompact source is not confused with a quasicompact structure map. The separated pro-étale hull need not be open at arbitrary valuation rank, and the compactification is not claimed spatial.

C8 separates the generating, independent and modified degrees. The field inclusions are isometric; finite monotonicity and finite comparison retain their finiteness hypotheses. Point-quotient, stabilizer and cohomological-dimension statements remain separate targets. The quasi-augmentation of specialization chains retains the original specialization relation and the normalized-support comparison. C9 retains the spatial, commutative-coefficient and uniform-bound hypotheses, and its general compact-object criterion uses perfect-constructibility rather than bounded constructible cohomology.

The geometric suppliers remain DiamondsAndVStacks and PerfectoidSpaces; coherent enhancements remain with EnhancedDerivedSheaves. ClassicalAdicEtaleCohomology supplies the stated valuation and annulus inputs. The ProfiniteProPGroups link maps agree with reuse of Layers 2–3 for Sylow/pro-p theory. LocalFieldsRamification's discretely valued theory does not replace the general valued-field argument in C8. Tau Ceti DGAInfinity Layers 5–6 supply the compact/thick-envelope theorem. The early C8 point inputs to C7 filtration do not depend back on C7, as confirmed by the local graph check.

The library audit has no direct DiamondEtaleCohomology entry. Its adjacent ClassicalAdicEtaleCohomology entries distinguish existing valuation/henselian/Kummer interfaces from absent sheaf-cohomological geometry. All 39 distinct declaration statements cited in the two baseline records were checked at the exact pins. No new library-coverage assertion or supplier revision is made here. Canonical compactification remains with C4 as reconciled by the accepted assembly; the older RS-05 ownership entry is not changed by this review.

## Source verification

Fetched the six public editions below on **2026-10-09** into disposable scratch. Their SHA-256 values match the accepted source records. These are checks of source-sensitive package statements, not a fresh proof review of every theorem in the accepted plans.

- [ECD v4](https://arxiv.org/pdf/1709.07343v4): checked the hull/properness qualifications around Lemma 14.5 and Definitions 18.1/18.4, pp. 82–83 and 101–103; Proposition 18.9, p. 106; perfect-constructibility at Propositions 20.12–20.17, pp. 118–122; and the field/point/cohomological bounds of §21, pp. 122–127. The general-coefficient descent and higher-positive-degree vanishing obligations remain explicit.
- [Temkin v2](https://arxiv.org/pdf/1610.09162v2): checked §§2.1–2.2 and Theorems 3.2.1/3.2.3, pp. 4–8. The finite theorem is kept separate from the infinite-degree questions and still requires its perturbation input.
- [Caraiani–Scholze](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf): checked Propositions 4.2.19/4.2.21 and Remark 4.2.20, pp. 711–712. These require partial properness and the rank-one residue-field setup.
- [Kelly–Saito–Tamme v3](https://arxiv.org/pdf/2407.04378v3): checked Lemma 6.6 and its proof, p. 24. Its Scheiderer quasi-augmented and normalized-support inputs remain named obligations.
- [Conrad](https://math.stanford.edu/~conrad/248APage/handouts/algclosurecomp.pdf): checked Theorem 1.1 and §2, pp. 1–3. The completion route works in arbitrary characteristic; the pinned characteristic-zero dense-range lemma does not replace it.
- [Fargues–Scholze v4](https://arxiv.org/pdf/2102.13459v4): checked Problem I.11.1 and the discussion of dimension, §I.11, pp. 41–42. The open problem is not asserted as a theorem.
- [Stacks Lemma 21.23.10, Tag 0D6P](https://stacks.math.columbia.edu/tag/0D6P): checked the site-level object-wise Postnikov comparison. It does not by itself supply the full enhanced equivalence with compatible towers.

| Public edition | SHA-256 |
| --- | --- |
| ECD | `78ca42bba46f1d43c894b0dbfdfb41105efab4959ba5ba6e32e1e5cf7ef33efc` |
| CS17 | `4f9449e5ecfd8fb8b43a04acef73060f531be995babaa9f744f3db36aaa5e61a` |
| KST | `c59e68e75491735ed87ec32264e1a6985f22f8dd6d47a8201efd39d9a64ccba4` |
| TEMKIN | `df32be2841a71677ded61b9957fe50e650b2e41ba9874daf96b15330bc4c75af` |
| CONRAD | `07052ff7a8c1a25ce876ca984f28d62e513998259906bd994d3dc1622cda3f5b` |
| FS | `1f8040751d3424f59ae56651d990d7b2d5030e6b7cae58bc2fc683358dfc2027` |

No restricted library book was used. In particular, this review does not claim direct verification of Huber 1996 or of the earlier primitive perturbation source used by Temkin. Their supplier/proof obligations stay explicit.

## Lean scope and omissions

The shared build's Mathlib sources are exactly `082e2d37e8b0463410cdb532e111cd43d5a66174`. Pinned Tau Ceti declarations were read at `f790474821cf4256814db967cb154e7af3d0c369`; the suggested file imports no Tau Ceti modules, so elaboration exercises only the exact Mathlib baseline. No Tau Ceti import compilation is claimed. There were 114 GB available before the final check. Only `lean-check` was used; no language server, build, dependency update or cache fetch was started.

The 159 examples and the presence of all API/test names do not mean every full contract is executable. Nineteen API items remain comment-only: `squareBaseChange.paste`, `pull_twoCell`, and the analytic/diamond dimension, local-finiteness and point-dimension APIs named in the final ledger. Other signatures represent only their typable geometric or homotopy-category portions. C9.3 gives object-wise Postnikov convergence, with realization of all compatible towers and the enhanced categorical comparison still assigned to E2. The shared commutative coefficient carrier does not reduce the README's arbitrary-ring site results.

The final ledger explicitly omits these **32 whole-target signatures**, retaining their mathematics in the README:

| Target | Required statement |
| --- | --- |
| C8.14 | Geometric transcendence dimension of an analytic map |
| C8.15 | Topological dimension bounded by geometric transcendence dimension |
| C8.16 | Geometric transcendence dimension of a diamond map |
| C8.17 | Geometric transcendence dimension under pullback |
| C8.18 | Geometric transcendence dimension of a composite |
| C8.19 | Local finiteness of geometric transcendence dimension |
| C8.24 | A one-point diamond as a profinite quotient |
| C8.25 | Uniqueness of the profinite point presentation |
| C8.26 | Sheaves at a diamond point as discrete modules |
| C8.27 | Point cohomology is canonical continuous cohomology |
| C8.28 | Cohomological dimension at a maximal point |
| C8.29 | Closed inclusion of specialization stabilizers |
| C8.30 | Cohomology with support at the closed point |
| C8.31 | Closed-point support and generic-point cohomological dimension |
| C8.32 | Cohomological dimension of a profinite extension |
| C8.35 | Removing a pro-p kernel from cohomological dimension |
| C8.36 | The residue action as an absolute Galois group |
| C8.37 | Residue-field transcendence bound |
| C8.38 | The tame-inertia character embedding |
| C8.39 | Cohomological dimension of tame inertia |
| C8.40 | Residue and value-group transcendence inequality |
| C8.41 | Maximal-point cohomological dimension bound |
| C8.43 | Cohomology from the quasi-augmented chain space |
| C8.45 | Dimension drop at the boundary of an open stratum |
| C8.46 | Constructible reduction with controlled support |
| C8.47 | The local stalk bound for topological direct image |
| C8.48 | Cohomological dimension of a spatial diamond |
| C8.49 | Dimension of a rank-one closure in a partially proper adic space |
| C8.50 | Dimension of a partially proper adic space |
| C8.51 | Closure dimension along a partially proper analytic map |
| C8.20 | Topological fibre dimension can be tested on field points |
| C9.14 | Compact generation from finite dimension bounds |

These omissions are inherited from the accepted assembly and explained by missing supplier interfaces: completed adic residue fields and valued embeddings; faithful profinite point presentations and discrete-module/continuous-cohomology comparisons; cohomological-dimension and inertia APIs; the quasi-augmented comparison; or the enhanced compact-generation consequence. Protocol §13 permits omitting an unstatable condition rather than replacing it by an arbitrary proposition. This review leaves those obligations visible and makes no implementation claim.

## Validation

```sh
lean-check research/blueprint/packages/DiamondEtaleCohomology/Suggested.lean
python3 scripts/check_blueprint.py research/blueprint/packets/DiamondEtaleCohomology--C0.json research/blueprint/packets/DiamondEtaleCohomology--C8.json --json
```

Both commands exited 0. Lean reported exactly 729 `sorry` warnings and no other warnings or errors. Each unchanged packet reported zero errors and zero warnings. Independent checks passed for all target/API/test names and statements, explicit hypotheses, prerequisite and locator transfers, acyclicity, import uniqueness, active Lean equality, size, process/private-path absence, and JSON/TOML syntax. The normalized overlap scan supplements the direct passage comparison rather than establishing originality by itself.

The final suggested file SHA-256 is `41fc9f87f880d7165da6f18425f73092321abb397a20a26919e5829cf5826c04`. Nothing remains for this review job; normal intake handles package promotion. No packet, atlas data, supplier document or upstream roadmap is edited.
