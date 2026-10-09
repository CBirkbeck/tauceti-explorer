# REV-FIX-RT-AREA-iwasawa-2~2 — independent review

Codex, session `codex-KQjyXV`, 9 October 2026, issue [#6219](https://github.com/CBirkbeck/tauceti-explorer/issues/6219). Input commit: `2a38118862ebfcc8d34e96438ab58cd077626d7b`.

This is an independent recheck of Claude Code's `FIX-RT-AREA-iwasawa-2~2`, session `claude-6ZAIEy`, [PR #6786](https://github.com/CBirkbeck/tauceti-explorer/pull/6786). This session wrote none of that fix or its earlier reviews. The input includes the corrections from [PR #7313](https://github.com/CBirkbeck/tauceti-explorer/pull/7313), the earlier review [PR #7969](https://github.com/CBirkbeck/tauceti-explorer/pull/7969), and the L4 revision [PR #7967](https://github.com/CBirkbeck/tauceti-explorer/pull/7967). Those are inherited work, not corrections made here.

The named two-packet review is complete. A queue/issue scope discrepancy prevents completing the queue's additional outputs without further authorization; the submission is a checkpoint for that administrative blocker. The mathematical verdicts below do not await another pass over these same fixes.

## Verdicts and scope

| Packet | Verdict | Reason |
|---|---|---|
| `DirichletPadicLFunctions--L3.json` | **accepted** within this fix review | Findings /1 and /2 have accurate, explicit handoffs to L3-2 and RD.6. Their remaining obligations are not claimed discharged. This is not a new review of all 1,663 nodes. |
| `PadicMeasuresIwasawaAlgebras.json` | **needs_changes** | Finding /4's corrected L6 algebra is sound. The whole packet still has unresolved L4 declaration/test correspondence and source/proof inputs. This review does not accept its other 436 nodes. |

All 50 L6 nodes were independently reread with their statements, proof steps, 172 API items, 57 tests, locators, prerequisites and ownership. No new mathematical correction was necessary. L6's five planets and its partial status do not imply completion of the exterior-bidual/order targets left as gaps. Implementation statuses remain unchecked.

## Verified findings

### /1 — Morita Gamma and Gross–Koblitz: correct handoff; partial discharge

L3 retains the signed natural values, continuous unit-valued extension on Z_p, uniqueness and both recurrence branches. Its Morita locators are §1, published pp. 255–256. Global analyticity is not inferred from continuity.

The Robert comparison retains the trace character, chosen root with π^(p−1)=−p, coefficient field, q=p^f and the source-negative Gauss convention. Its source locators are Robert (2001), pp. 164–169, and the previously recorded Robert (2000), VII.2.4/2.6. The all-prime comparison is conditional on RD.6's exact Dwork coefficient bound and splitting-value identity for that chosen root. The elementary normalized-root/Gauss-pair arguments separately impose odd p. The exponent range includes zero and excludes q−1; the Gamma multiplication-product node is not mislabeled as Gross–Koblitz Theorem 1.7.

L3's coverage names `rjw2-gk-root-ideals`, `rjw2-gk-root-congruence` and `rjw2-gk-dyadic-root` in L3-2. Those nodes and the RD.6 producers remain review/implementation obligations. The finding is partially discharged, not closed. No new Morita/Robert source confirmation or L3-2 acceptance is recorded here.

### /2 — Ferrero–Greenberg: correct assignment; still open

L3 points explicitly to L3-2's twelve derivative/nonvanishing nodes. It does not treat a value-at-one formula or the Gamma construction as the derivative-at-zero theorem. The assigned general formula retains `(1−χ(p)) B_(1,χ) log_p N`, uses the even character χω, and removes that correction only under χ(p)=1. Nonvanishing has separate Jacobi/Gauss-ideal and logarithmic-independence inputs.

The L3-2 review must authenticate the source's any-prime range, particularly p=2 and ω of conductor 4; add/check the original Ferrero–Greenberg (1978) proposition missing from its source list; and reconcile the source branch and derivative coordinate with RJW. This session did not reread Ferrero–Greenberg/Zhao and does not certify L3-2. The finding remains open under its assigned owner.

### /3 — log-syntomic input: correct outside-owner handoff

D.1 already has an accepted independent review dated 8 October, `independent-review-REV-PadicHodgeRegulators--D.1~2`. Its acceptance is a specification verdict, not implementation of the requested producers.

D.2's log-syntomic and period-map contracts request early `CohomologyComparisonsPartII:CS.0/CS.1` after CR.5/CR.6. They preserve divided versus undivided complexes, comparison direction and modified integral twists. Small-weight and all-weight scopes must remain distinct. Proper rational CP.4 does not supply the general integral/open construction. D.2/D.5 are consumers. No change in the two named packets is required, and D.1's newer review is preserved.

### /4 — Dasgupta–Kakde algebra: correct after inherited repairs

The fresh primary-source reading was [arXiv:2010.00657v3](https://arxiv.org/pdf/2010.00657v3), PDF SHA-256 `c1fe1cd8e1d218b4d44c58b1171c561b5955261340e345e51f9c82fa33b63099`: §§2.2–2.3, pp. 15–18; Lemma 3.9, pp. 25–26; §§5.1–5.2, pp. 32–34; §6.1, p. 40; §7.2.9, p. 49; the residue-ring step in Lemma 8.22's proof, p. 64; Lemma A.5/Remark A.7, pp. 85–86; Appendix B.2/Lemma B.4/(171), pp. 93–94. Derived helper lemmas are supplied proofs, not separately stated source theorems. Published Annals full text was not read; no finding is newly attributed to that version.

The current contracts pass the independent check:

- R_Ψ is the character-evaluation image with its congruences. Joint injectivity uses the pinned roots-of-unity and character-duality assumptions. Inversion transports R_Ψ to R_(Ψ⁻¹); a self-map requires inverse stability. No general Gorenstein claim survives.
- Lemmas 2.4–2.5 retain regularity and finite-quotient hypotheses. The repaired cardinality proof covers finite-field PID factors through a finite-ideal reduction, rather than imposing extra infinitude on the general theorem.
- Square presentations, finite presentation at Fitting operations, the extension relation matrix's off-diagonal sign, and the crossed-product consequence of Lemmas 2.6–2.7 are explicit.
- Basic Fitting ideals remain owned by StableReduction Layer 1 under accepted RS-16. Higher ideals, redundant-generator comparison, independence and base change are separate L6 nodes.
- Compound matrices reuse exterior-power/minor APIs. Both higher-adjugate multiplication identities are stated; the annihilator argument supplies an actual preimage using the right-sided identity and extension by zero.
- Transpose reuses `TauCeti.AuslanderReitenTranspose` and its quotient API. Presentation dependence is modulo projective stabilization. The (171) comparison covers finite projective presentations of constant rank, with a separate free case.

StableReduction Layer 1, QuiverRepresentations Layer 6 and ProfiniteProPGroups' completed algebra contracts were inspected for ownership. Existing upstream mathematics is not replanned. IntegralIwasawaTheory I.6/I.7 remain arithmetic consumers. Cross-owner import adjustments and the other partial L6 targets are follow-ups, not implicit additions to this review.

The fresh reading also reconfirms the already registered preprint findings:

| Finding | Locator | Independent check |
|---|---|---|
| E17, proof gap | Lemma 3.9, p. 26 | The displayed left-sided adjugate identity does not itself supply a preimage. Extend `adj_r(A′)x` by zero and use `C_r(A′) adj_r(A′)=det(A′)I`. |
| E18, proof error | Lemma 2.4, (27)–(28), pp. 16–17 | For the graph subring of Z×F_p and x=(p,0), x is regular on the subring but kills the finite-field factor. The asserted multiplier quotient is not injective. Reduce by the finite ideal before applying the infinite-PID argument. |
| E19, misprint | §6.1, (80)–(81), p. 40 | The literal Z[G]-dual vanishes for the relevant prime-to-p divisible module. Use Hom_R(M,R) and transport scalars to R^#. |
| E20, misprint | §2.3, p. 16 | The square-presentation prose/display use inconsistent module letters. The plan consistently uses N. |

For E18, regularity makes multiplication by x bijective on the finite ideal K. The adjugate identity then makes the presentation matrix bijective on K^m. The cokernels descend to B/K, where the remaining ambient PID factors are infinite and x remains regular. This repairs the argument while retaining the theorem. Earlier author-copy/TeX receipts remain historical; no source-finding field was changed here.

### /5 — finite-slope perfect complexes: correct assignment; still open

Job #641 owns the finite-slope carrier. Its unexamined functional-analysis sources are not certified by this fix review. Raw degreewise Fredholm products are auxiliary data dependent on a representative; cohomological spectral support must be invariant. The BCGP25 solid derived `f_* f^*` construction is stronger than monoid inversion. Shared Stein/quasi-Stein foundations need an early dependency prefix. These are the verified contract's requirements, not a claim of a fresh BCGP25 source audit. No authorized file here supplies that producer.

### /6 — duplicate cyclotomic endpoint: verifier rejection retained

Accepted RS-16 allows independent Hecke-congruence and cyclotomic Euler-system proof routes to a common endpoint. The fix correctly keeps both routes. No endpoint or ownership mutation is needed.

## Validation and exact edit inventory

The direct L6 baseline audit inspected 174 declaration statements in 94 modules, including aliases and instances. Shared source bytes matched the Git objects at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. This covers L6's direct references, not all 536 packet baseline entries. Reviewed library-coverage rows were read before making the verdict. No new definition or baseline was planned.

The namespace-aware suggested-file inventory accounts for all 172 L6 API items: 169 explicit commands and three generated `QuadraticPresentation` projections (`size`, `rel`, `gen`). All 57 node-tagged examples are present. The signatures and mathematical contracts were read; a lexical match alone is not a semantic proof.

| Check | Fresh result |
|---|---|
| PMIA packet checker | 486 nodes, 536 baseline entries; zero errors/warnings |
| L3 packet checker | 1,663 nodes; zero errors, 26 inherited short-API warnings |
| Native PMIA `lean-check` | Exit 0; 1,041 warnings, all admitted proofs; no other warning |
| Native L3 `lean-check` | Exit 1 before declarations: missing planned `research` dependency artifacts |
| Exact integer controls, seed 6219 | Both compound/adjugate identities in 112 square cases; explicit rectangular preimages in 320 cases |
| Lean sign-parsing control | The two complementary index sums have the intended exponent; exit 0 |

The integer and sign controls check order/sign errors; they do not prove the general results. No concatenation harness was run in this session. PR #7969's L1/L2 diagnostics remain historical follow-ups and do not establish native L3 compilation.

Only four files changed: the two top-level packet review objects/history, this report and the handoff. The previous current review objects are appended to `reviewHistory`; PMIA's 50 current node verdicts record retained correct contracts rather than claiming inherited edits as new corrections. All node records, baselines, prerequisites, requests, source findings, gaps, coverage, suggested files and reader documents are unchanged.

## Remaining packet obligations

PMIA's current L4 inventory still names these 14 absent declaration interfaces, all under `TauCeti.Iwasawa`:

`card_quotient_omega_eq`, `charIdeal_baseChange`, `charIdeal_restrictScalars`, `character_orbit_coefficients`, `characteristic_finite_fitting_control`, `coinvariants_euler_product`, `delta_cyclotomic_elementary_factors`, `disjoint_torsion_extension`, `finite_coinvariants_iff`, `finite_index_inclusion`, `invariants_coinvariants_six_term_exact`, `invariants_generator_indep`, `pseudoiso_maximal_ideal_control`, `regular_parameter_reflexivity_criterion`.

There are 12 absent annotated test records across five nodes: `generator_dependence` and `ramified_normalisation` on each of `iwasawa-invariants`, `iwasawa-invariants-api-1`, `iwasawa-invariants-api-2`; `finite_vs_fitting` and `norm_formula` on `characteristic-ideal`; `order_two`, `teichmuller`, `p_divides`, `trivial_group` on `character-decomposition`. Reconcile equivalent existing declarations/tests where appropriate: absence of an exact name/tag alone does not prove absence of its mathematics. The current inventory and `handoff/BP-PadicMeasuresIwasawaAlgebras~2.md` still leave that correspondence and precise proof/source inputs unresolved. NSW, Bourbaki and Coates–Sujatha were not freshly authenticated here. The `needs_changes` verdict concerns those concrete interface and authentication obligations, not the layer's partial label.

L3-2/RD.6, shared log-syntomic producers and #641 retain their assigned obligations above. Preserve PR #7967's reader repair and L4 projector ownership. The packet does not need another duplicate generic projector or basic Fitting carrier.

## Queue blocker and where to resume

The bot confirmed this session's claim in [comment 6080449449](https://github.com/CBirkbeck/tauceti-explorer/issues/6219#issuecomment-6080449449). The live issue names L3 and PMIA packets/suggested files plus this report. The local queue additionally requires L3-2 and D.1 packets/suggested files. Its `deliverables_complete` predicate requires this exact review identifier on every listed packet. That makes the authorized two-packet result incomplete in queue terms, as happened to PR #7969.

WORKERS restricts edits to named deliverables. Additional scope was requested, but no authorization had arrived when this submission was prepared. Neither the extra packets nor the queue is changed. In particular D.1's newer accepted review must not be replaced merely to satisfy the predicate. The maintainer must reconcile the queue with the live issue or authorize the additional independent review scope. Resume at that decision, not by repeating the completed L6 audit. The handoff retains all material follow-ups without depending on scratch artifacts.

## L6 rereading ledger

Each node has prefix `PadicMeasuresIwasawaAlgebras:L6/`. All verdicts below are this session's planning checks of the inherited corrected contracts. Implementation remains unchecked.

| Node | Current verdict | Source locator / supplied proof boundary |
|---|---|---|
| `character-evaluation` | correct | §2.2, arXiv v3 PDF p. 15 |
| `joint-evaluation-injective` | correct | §2.2, arXiv v3 PDF p. 15 |
| `character-group-ring` | correct | §2.2, arXiv v3 PDF p. 15 |
| `character-group-ring-scaled-idempotent` | correct | Proof of Lemma 2.5, arXiv v3 PDF p. 17 |
| `character-group-ring-lattice` | correct | §2.2, arXiv v3 PDF p. 15 |
| `character-group-ring-finite-index` | correct | §2.2, arXiv v3 PDF p. 15 |
| `character-group-ring-nonzerodivisor` | correct | Proof of Lemma 2.5, arXiv v3 PDF p. 17 |
| `norm-element-kernel` | correct | Lemma 2.2 and proof, arXiv v3 PDF p. 16 |
| `character-idempotent-evaluation` | correct | §2.2, arXiv v3 PDF p. 15 |
| `component-character-group-ring` | correct | §2.2, arXiv v3 PDF p. 15 |
| `component-group-ring-equiv` | correct | §2.2, arXiv v3 PDF p. 15 |
| `group-ring-component-decomposition` | correct | §2.2, arXiv v3 PDF p. 15 |
| `component-norm-quotient` | correct | Corollary 2.3, arXiv v3 PDF p. 16 |
| `character-group-ring-unit-criterion` | correct | §2.3, arXiv v3 PDF p. 18 |
| `character-group-ring-unit-one-character` | correct | §5.2, arXiv v3 PDF p. 34 |
| `character-group-ring-local` | correct | §2.2, arXiv v3 PDF p. 15 |
| `character-group-ring-maximal-ideal-power` | correct | §7.2.9, arXiv v3 PDF p. 49 |
| `character-group-ring-eval-local-hom` | correct | §5.1, arXiv v3 PDF p. 34 |
| `character-group-ring-residue-field` | correct | Proof of Lemma 8.22, arXiv v3 PDF p. 64 |
| `character-group-ring-adic-complete` | correct | §7.2.9, arXiv v3 PDF p. 49 |
| `character-group-ring-index` | correct | Lemma 2.5, arXiv v3 PDF p. 17 |
| `sharp-involution` | correct | §6.1, arXiv v3 PDF p. 40 |
| `contragredient-dual` | correct | §6.1, equation (80), arXiv v3 PDF p. 40 |
| `quadratic-presentation` | correct | §2.3, arXiv v3 PDF p. 16 |
| `fitting-quadratic` | correct | §2.3, arXiv v3 PDF p. 16 |
| `higher-fitting-ideal` | correct | Appendix B.2, first paragraph, arXiv v3 PDF p. 93 |
| `relation-minors-add-generator` | correct | Appendix B.2, the paragraph before Lemma B.5, arXiv v3 PDF p. 94 |
| `higher-fitting-independence` | correct | Appendix B.2, first paragraph, arXiv v3 PDF p. 93 |
| `higher-fitting-base-change` | correct | Appendix B.2, after (172), arXiv v3 PDF p. 93 |
| `locally-quadratic-presentation` | correct | Remark A.7, arXiv v3 PDF p. 86 |
| `extension-relation-matrix` | correct | Lemma 2.6, arXiv v3 PDF p. 18 |
| `quadratic-presentation-extension` | correct | Lemma 2.6, arXiv v3 PDF p. 18 |
| `fitting-extension` | correct | Lemma 2.6, arXiv v3 PDF p. 18 |
| `fitting-fibre-product` | correct | Lemma 2.7 and proof, arXiv v3 PDF p. 18 |
| `pid-cokernel-cardinality` | correct | Proof of Lemma 2.4, the case of a PID, arXiv v3 PDF pp. 16–17 |
| `finite-index-cokernel-descent` | correct | Proof of Lemma 2.4, displays (27) and (28), arXiv v3 PDF p. 17 |
| `cokernel-modulo-finite-ideal` | correct | Proof of Lemma 2.4, arXiv v3 PDF p. 17 |
| `finite-index-subring-nonzerodivisor` | correct | Proof of Lemma 2.4, arXiv v3 PDF p. 17 |
| `quadratic-cardinality` | correct | Lemma 2.4, arXiv v3 PDF p. 16–17 |
| `compound-matrix` | correct | Proof of Lemma 3.9, arXiv v3 PDF p. 26 |
| `complement-shuffle-sign` | correct | Proof of Lemma 3.9, arXiv v3 PDF p. 26 |
| `generalised-laplace-expansion` | correct | Proof of Lemma 3.9, arXiv v3 PDF p. 26 |
| `higher-adjugate` | correct | Proof of Lemma 3.9, arXiv v3 PDF p. 26 |
| `compound-image-determinant` | correct | Proof of Lemma 3.9, last step, arXiv v3 PDF p. 26 |
| `exterior-cokernel-annihilator` | correct | Lemma 3.9, arXiv v3 PDF p. 25–26 |
| `presentation-transpose` | correct | §6.1, (81), arXiv v3 PDF p. 40 |
| `transpose-stable-equivalence` | correct | §6.1, arXiv v3 PDF p. 40 |
| `transpose-fitting` | correct | Lemma 6.1, arXiv v3 PDF p. 40 |
| `transpose-higher-fitting-free` | correct | Proof of Kurihara's conjecture after Lemma B.4, arXiv v3 PDF p. 94 |
| `transpose-higher-fitting` | correct | Proof of Lemma B.4, equation (171), arXiv v3 PDF p. 93 |
