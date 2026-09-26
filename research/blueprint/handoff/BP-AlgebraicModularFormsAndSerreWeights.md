# BP-AlgebraicModularFormsAndSerreWeights — partial checkpoint

Issue: #671. Agent/model: ChatGPT Pro / GPT-6 Astra Pro. Session and branch: `cgpt-20260926-serre-a7d4`. Date: 26 September 2026.

## State and integration boundary

The bot confirmed this session's claim on #671 (claim comment 5848784663; confirmation 5848785718). This submission is a **partial checkpoint**, not a completed six-stage blueprint and not ready for wholesale promotion over the reviewed decomposition. No stage is marked closed. Only the four issue deliverables are changed.

The accepted RS-06 title and base are used. The existing main node ID `AlgebraicModularFormsAndSerreWeights:R15.5/deligne-serre-eigenvalue-lifting-lemma` is retained. Twelve additional nodes expand its proof and tests. The remaining reviewed nodes, especially `R15.5/reduction-to-weight-at-least-two-and-to-a-true-eigenform`, are not discarded: they remain continuation inputs. Do not interpret their absence from this partial packet as a deletion request.

## What was supplied

The R15.5 algebraic core is split into an invariant-line lemma, an actual algebra-homomorphism construction with API, the horizontal prime and dominating-DVR character lift, a nilpotent-ideal lemma, localization descent, faithful occurrence of a character, generic-action faithfulness, denominator clearing and the retained main theorem. The normalization argument uses the existing separability-free Tau Ceti integral-closure theorem. The proof explicitly descends the localized annihilated vector and checks faithfulness of the **scalar-extended** operator algebra.

Three regression examples reject false strengthenings: lifting a prescribed residual vector, avoiding a necessary ramified extension, and omitting faithfulness. In particular, equal-characteristic-two inseparability is not silently excluded. The suggested file states the construction, all API/test items, theorem interfaces and the regression equations using existing carriers rather than unspecified predicates.

Counts: **13 nodes** (8 lemmas, 1 construction, 1 theorem, 3 applications); **3 API items; 3 construction unit tests; 2 planets; 8 pinned baseline declarations; 4 gaps; 3 requests**. All implementation statuses are unchecked.

## Checks actually run

Local Python checks passed for JSON syntax; six-stage scope and coverage; unique IDs; prerequisite resolution within the displayed packet/baseline list; acyclicity; required node/source fields; nonempty acceptance lists; API/test correspondence with suggested declarations; planet constraints; and absence of Lean proof text or private paths in the packet/document. These are local structural checks, not the repository-wide checker or its declaration index.

SymPy checked the symbolic identities for the two matrices. Exhaustive small-domain tests covered **5,324 integer parameter tuples** and **2,620 tuples over the prime fields of orders 2, 3, 5 and 7**. A further reduction checked the eigenvector identity in the quadratic quotient over F_2(t). These are regression computations, not a replacement for the uniform proofs, and the quotient calculation does not itself prove irreducibility.

**The suggested Lean file was not compiled.** No Lean/Lake installation or repository checkout was available. Direct source downloads failed DNS resolution; source reading and submission used the connected GitHub tools. The repository-wide `scripts/check_blueprint.py` and pinned declaration-index check must run in pull-request CI. Check the PR's actual CI result; this handoff does not pre-claim a pass.

## Sources and inputs read

The actual published Numdam scan of Deligne–Serre, *Formes modulaires de poids 1* (1974), printed p. 522, sections 6.8–6.11: the lemma, proof and warning were inspected in the page image. The source URL and reading date are in the packet. No new error is alleged in this checked passage; the empty source-issues list does not certify unread parts of the bibliography.

Repository inputs: WORKERS, blueprint PROTOCOL, BROWSER_AGENTS, UPSTREAM_GUIDE and expansion PROTOCOL; this roadmap's atlas extract and document; the reviewed decomposition's relevant R15.4–R15.6 nodes and source/gap register; the RS-06 proposal/report and accepted REV-RS-06 review; relevant portions of the scoped AUDIT-13 report; ModularForms conventions and Layers 8/8W/8G; the EllipticCurves roadmap's carrier/ownership discussion. The eight listed baseline statements were read at the exact pinned commits, not inferred from current-branch search hits.

The aggregate `data/library-coverage.json` exceeded the file-reader limit. Its full review-state reconciliation and every applicable link-map entry were not completed. The scoped audit was used as a lead, and the claimed baseline declarations were independently read at the pins. This limitation is an explicit packet gap.

## Exact continuation worklist

1. Finish baseline/API reconciliation for the displayed proof: finite/free operator subalgebras; the finite generic field of a finite domain algebra; lying over; localization of a Dedekind domain at a nonzero prime; flat tensor inclusions; finite-free endomorphism base change; coordinate clearing; scalar-extension reassociation. Prefer existing declarations, not new nodes duplicating those theories. Elaborate the suggested file at the pins and correct its instance/import details before claiming validation.
2. Refine the existing R15.5 application node while preserving its identifier or recording explicit child refinements. Supply the actual finite free integral modular-form module and a reduction-image witness. State the precise operator family, the coefficient/prime maps, controlled weight/level/character, and the newform/normalization conclusion. Separate the weight shift and R19 Galois attachment. DS 6.9 and 6.10 are on printed page 522. Do not infer arbitrary Katz weight-one lifting from the algebraic lemma or from ModularForms 8W.
3. Resolve the three packet requests: R15.2's module and reduction-image comparison; ModularForms Layer 8/8W's exact integral input; Layer 4's full-eigenform/newform and normalization interface. Proposition 2.7 and Lemme 6.11 are different results. The algebraic R15.5 proof has no prerequisite on R15.4.
4. Reconstruct R15.1–R15.4 and R15.6 from their reviewed source nodes under RS-06, retaining IDs or recording explicit refinement. The document and coverage records specify the Hodge/descent, all-cusp, characteristic-p, extension-sensitive weight, dyadic and residual-modularity obligations. Read the still-required Katz, Serre, Edixhoven and Raynaud passages; nothing here certifies their full proof coverage.
5. Reconcile the full reviewed library audit and link maps, prune unused broad stage edges, and check integration against the complete world. Keep the packet partial until the mathematical and baseline gaps really close. A successful schema check is not a claim that they have closed.
