# REV-FIX-RT-AREA-iwasawa-2~2 — completed independent review

Reviewer: Codex (GPT-6), session `codex-nikABM`, 9 October 2026, issue [#6219](https://github.com/CBirkbeck/tauceti-explorer/issues/6219). Review input: `c019e3c9c8cc34332ff3b09424522a7db78fc2a2`. Submission integration base: `6ad161567` (including concurrent PR #7967).

This completes the review of `FIX-RT-AREA-iwasawa-2~2`, written by Claude Code, session `claude-6ZAIEy`, issue #6218, [PR #6786](https://github.com/CBirkbeck/tauceti-explorer/pull/6786). This session wrote none of that fix. It resumes the independent review saved by Claude, session `claude-D9I0pm`, in [PR #7313](https://github.com/CBirkbeck/tauceti-explorer/pull/7313). Earlier corrections are already in the input; this report distinguishes them from this continuation's changes. The dated earlier review objects remain in each packet's `reviewHistory`.

The review of the live issue's two named packets is complete. A `needs_changes` verdict is its result, not an unfinished review or a request to resume its mathematical checks. Queue metadata has a separate scope mismatch, described below.

## File verdicts

| Packet | Verdict | Reason |
|---|---|---|
| `DirichletPadicLFunctions--L3.json` | **accepted** for the fix review | The /1 and /2 handoffs preserve the accepted mathematics and name outstanding L3-2 and RD.6 obligations without claiming them discharged. |
| `PadicMeasuresIwasawaAlgebras.json` | **needs_changes** | The corrected 50-node L6 algebra meets /4's contract. Concurrent PR #7967 repairs the reader and supplies L4 interfaces, but 14 required L4 declaration names, 12 annotated test records and named source/proof inputs remain unresolved. |

During submission, [PR #7967](https://github.com/CBirkbeck/tauceti-explorer/pull/7967), `BP-PadicMeasuresIwasawaAlgebras~2` (#6472), merged. Its complete reader and all L4 edits are preserved. The reader now lists 50 L6 nodes and keeps higher Fitting algebra here; the stale-reader objection is superseded. Its remaining L4 interfaces and source inputs still require follow-up and independent review. This session checked the residual declaration inventory, not the revised L4 mathematics. The reader is not changed by this PR.

## Finding-by-finding verdicts

### /1 — Morita Gamma and Gross–Koblitz: correct handoff, partial discharge

The accepted L3 packet constructs signed natural Gamma values, their continuous extension to a unit-valued function on Z_p, uniqueness and both branches of the recurrence. Relevant nodes include `morita-natural-values`, `morita-natural-recurrence`, `morita-gamma`, `morita-gamma-value-continuous`, `morita-gamma-unique` and `morita-gamma-functional-equation`. Their locators remain Morita §1, published pp. 255–256. Continuity is not promoted to global analyticity.

For Gauss sums the packet retains the chosen trace character, π^(p−1)=−p, coefficient field, q=p^f, unit denominators and source-negative convention. `robert-gross-koblitz-comparison` retains two precise inputs from `PadicDifferentialEquationsAndRigidCohomology:RD.6`: the Dwork coefficient bound and the splitting-value identity for the actual chosen root. It uses Robert's comparison on 0≤a<q−1; it does not extend that range to a=q−1. Its source locators are Robert's 2001 article, pp. 164–169, and the previously recorded Robert 2000 VII.2.4/2.6 passages.

The coverage pointer identifies L3-2's `rjw2-gk-root-ideals`, `rjw2-gk-root-congruence` and `rjw2-gk-dyadic-root`. L3-2 has no accepted review at this input. These nodes and the RD.6 supplier inputs remain obligations, so the finding is not fully closed.

Three distinctions from the fix report remain essential. `gross-koblitz-gamma-source-product` is a multiplication-formula Gamma product, not Gross–Koblitz Theorem 1.7. The zero exponent belongs to Robert's range; the excluded endpoint is q−1. Robert's conditional comparison is planned for any prime, while the elementary normalized-π and Gauss-pair arguments impose odd p. None requires replacing an L3 node.

### /2 — Ferrero–Greenberg: correct assignment, still open

L3's coverage and gap point to the twelve `rjw2-fg-*`/`rjw2-ferrero-greenberg` nodes in L3-2. L3 does not identify a value-at-one formula, Gamma construction or conditional Gauss formula with the derivative-at-zero theorem.

L3-2's proposed statement uses the even character χω and retains the general correction `(1−χ(p)) B_(1,χ) log_p N`. Its exceptional specialization makes χ(p)=1 explicit. Nonvanishing has a separate node and separate Jacobi/Gauss-ideal and logarithmic-independence inputs. These boundaries are appropriate, but L3-2's independent review must still settle:

1. The any-prime claim, particularly dyadic ω of conductor 4, against the precise source range.
2. The original Ferrero–Greenberg 1978 proposition: that paper is absent from the five-source list.
3. An explicit comparison of the source's branch and derivative coordinate with the RJW function used here.

This continuation compares planned interfaces with the verified contract. It does not certify a fresh reading of Ferrero–Greenberg or Zhao, or accept L3-2 on their behalf. Finding /2 remains open until its assigned work is accepted.

### /3 — classical log-syntomic input: correctly carried outside these files

The earlier report's carrier status is stale. `PadicHodgeRegulators--D.1.json` now has an **accepted** review dated 8 October, `independent-review-REV-PadicHodgeRegulators--D.1~2`. Its former regulator-ownership sentence has been repaired.

The current `D.2/log-syntomic-complex` and `D.2/fontaine-messing-kato-period-map` request early `CohomologyComparisonsPartII:CS.0` and `CS.1` producers. They distinguish divided and undivided complexes, directed comparison maps and the modified integral twist. The proper rational CP.4 anchor is expressly insufficient for the general integral/open construction. D.2/D.5 consume the proposed carrier rather than creating another generic one. Acceptance of D.1 does not implement those requested producers.

No change to either reviewed packet is required. Source and all-weight comparison details belong to that accepted specification and its producer; this review does not override its newer source-based normalization.

### /4 — Dasgupta–Kakde algebra: correct after the inherited corrections

All 50 L6 nodes were reread, including statements, proof steps, acceptance examples, 172 API items and 57 tests. The 174 direct declaration prerequisites were read in 94 source modules authenticated against the pins. The other 436 packet nodes were not re-reviewed; the concurrent L4 revision is preserved without a source-verification verdict.

The source is [arXiv:2010.00657v3](https://arxiv.org/pdf/2010.00657v3), PDF SHA-256 `c1fe1cd8e1d218b4d44c58b1171c561b5955261340e345e51f9c82fa33b63099`. Direct readings covered §§2.2–2.3, pp. 15–18; Lemma 3.9, pp. 25–26; §5.1–5.2, pp. 32–34; §6.1, p. 40; §7.2.9, p. 49; the residue-ring observation in the proof of Lemma 8.22, p. 64; Lemma A.5/Remark A.7, pp. 85–86; and Appendix B.2/Lemma B.4/(171), pp. 93–94. Derived algebra lemmas are identified as supplied proofs, not separately stated source theorems.

The corrected plan has the required properties:

- R_Ψ is the evaluation **image**, with its congruences, rather than the entire character product. Coefficient hypotheses use `HasEnoughRootsOfUnity` and pinned character duality.
- Inversion identifies R_Ψ with R_(Ψ⁻¹). It is an endomorphism only for an inverse-stable set. No Gorenstein property is inferred for a general character image ring.
- Lemmas 2.4–2.5 retain non-zerodivisors and finite quotient hypotheses. The cardinality argument covers all PIDs, including finite fields, using the finite-ideal reduction below.
- Lemma 2.6 retains a square presentation of C, finite presentation where Fitting ideals require it, and the correctly signed off-diagonal block. The extension relation matrix and square-presentation result have their own nodes. Lemma 2.7 uses the resulting crossed product identity.
- Higher Fitting ideals have separate definition, redundant-generator comparison, independence and base-change nodes. The basic finite-presentation carrier is imported from StableReduction Layer 1 under accepted RS-16. This does not widen the upstream request to a higher-Fitting API.
- Compound matrices and complement signs use existing exterior-power/minor APIs. The higher adjugate has both multiplication identities; the annihilator argument gives an actual preimage using the right-sided one.
- Transpose reuses `TauCeti.AuslanderReitenTranspose`. Presentation dependence is expressed by projective stabilization. The higher-Fitting comparison covers finite projective presentations of constant rank as required by (171), rather than only globally free matrices.

The request and proofs respect upstream StableReduction Layer 1 and QuiverRepresentations Layer 6. QuiverRepresentations' finite-dimensional minimal-presentation theory is not rebuilt. Arithmetic consumers remain IntegralIwasawaTheory I.6/I.7. The missing consumer imports are recorded obligations; no link-map mutation is authorized here.

The earlier review added 25 nodes, corrected all 25 nodes of the fix and expanded the baseline to 525 entries. Its semantic corrections replaced duplicate plans for existing library constructions, split bundled claims, restored Lemma 2.4's PID generality, extended (171) to projective presentations, corrected extension signs and excluded empty character sets from nontrivial locality/existential-unit statements. Those edits are retained, not claimed as new work by this session. Their dated receipts remain in `reviewHistory`; the current rereading appears in `review.checked` and the ledger below.

### /5 — finite-slope complexes: correct assignment, still open

The current LocallyAnalyticDistributions packet records its assigned functional-analysis and derived finite-slope sources as unexamined. Module-level operator nodes do not claim to supply representative-independent finite-slope complexes. Blueprint job #641 remains the carrier for that plan.

The verifier's corrected contract continues to govern it: raw degreewise Fredholm products are auxiliary representative data; cohomological spectral support is invariant. BCGP25's solid derived construction `f_* f^*` cannot be replaced by merely inverting the monoid. Generic Stein/quasi-Stein foundations require a shared owner and early dependency prefix. The fix report's qualification of the inherited job wording is necessary. No affected file is authorized here; this finding is not closed.

### /6 — alleged duplicated cyclotomic endpoint: rejection retained

The verifier rejected this finding. Accepted RS-16 keeps independent Mazur–Wiles/Wiles Hecke-congruence routes and the cyclotomic Euler-system route. A common endpoint does not require one proof to replace the other. The fix preserves both. No ownership decision or endpoint mutation is made.

## Source findings E17–E20

These existing findings are independently reconfirmed here. The atlas errata register already contains all four; the dedicated DK extraction file separately records Proposition 8.6. This is not a claim of exhaustive publisher errata coverage.

| Finding | Locator in arXiv v3 | Check and reach |
|---|---|---|
| E17, gap | Lemma 3.9, p. 26 | The left-sided adjugate display does not construct a preimage. Extend `adj_r(A′)x` by zero, then apply `C_r(A′) adj_r(A′)=det(A′)I`. The lemma remains true. |
| E18, proof error | Lemma 2.4 and (27)–(28), pp. 16–17 | For the graph subring B of Z×F_p, x=(p,0) is regular on B but annihilates the finite-field factor. The multiplier map B′/B→xB′/xB is zero. Finite-ideal reduction repairs the proof, retaining the theorem. |
| E19, misprint | §6.1, (80)–(81), Lemma 6.1, p. 40 | An R_Ψ-module is divisible by every prime other than p, so the literal Z[G]-dual into Z[G] vanishes. The intended dual is Hom_R(M,R), transported to R^#. |
| E20, misprint | §2.3, p. 16 | The prose and square-presentation display name the same module with different letters. Use N consistently. No mathematical consequence. |

For E18, let K be the finite ideal of finite-field coordinates lying in B. Multiplication by x is injective and thus bijective on K. The adjugate identity then makes A bijective on K^m. Both relevant cokernels descend to B/K, where x remains regular and the remaining ambient PID factors are infinite. The finite-index argument applies there. This retains the full statement and isolates the original proof's failure.

Current confirmation is scoped to arXiv v3. The dated 7 October author-copy and TeX checks remain historical receipts. The [Annals article page](https://annals.math.princeton.edu/2023/197-1/p05) was checked for publication metadata; published full text was not obtained or read. No preprint finding is asserted against that unread text.

## Changes made in this continuation

1. Replaced both top-level review objects with 9 October verdicts, preserving the 7 October objects in `reviewHistory`. PMIA's 50 current verdicts distinguish retained mathematics from seven wording corrections.
2. Paraphrased source quotations in `character-group-ring`, `higher-fitting-ideal`, `relation-minors-add-generator`, `higher-fitting-independence`, `locally-quadratic-presentation`, `fitting-extension` and `fitting-fibre-product`. Mathematical statements and prerequisites are unchanged. Paraphrased E18's reason and E20's correction/reason; refreshed E17–E20's scoped confirmations/searches and the arXiv reading date. Both packets already contained no `excerpt` fields and still contain none.
3. In L3's suggested file, retained the exact inverse-character expression, used `Nat.Prime p` and scoped `quotPrecheck false` to its local notation. Lean's prechecker rejected the bound field projection and then the compound `.comp` syntax; ordinary term elaboration checks these after the scoped setting.
4. Updated PMIA's suggested-file commentary to distinguish the old missing-object limitation from current native elaboration. No PMIA signature or proof body changed in this review; the concurrent revision's new L4 code is preserved.
5. Replaced the report and handoff with the completion record, current outside-carrier status and reproducible follow-ups. Historical detailed correction evidence remains in PR #7313 and preserved review objects.

## Library, structure and validation

Reviewed library-coverage entries were read for PMIA L4/L6 and Dirichlet L3. They identify existing finite presentations/exterior powers and absent Fitting/exterior-bidual carriers. Exact pins:

- Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`: local source bytes compared with each pinned Git blob.
- Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`: local source bytes compared with each raw GitHub file at that commit.

All 94 audited modules matched. The 174 declaration statements were inspected, including attributed instances and aliases missed by a simple declaration-name regex. Consequential contracts include evaluation/orthogonality, the involutive antipode, subgroup sums, transpose quotient API, finite-projective dual base change, semilocal constant-rank freeness, finite-module adic completion, Smith bases and quotient cardinalities. No new baseline entry was needed.

The packet graph, prerequisite resolution, naming and L6 suggested API/test coverage were checked. L6 has five planets and remains partial: the Burns–Sakamoto–Sano order/exterior-bidual work and other listed targets are not inferred from these DK nodes. All implementation statuses remain unchecked.

Exact integer checks verified both higher-adjugate identities in 112 cases (sizes 1–4, every exterior degree), and the rectangular compound-image preimage in 320 cases (eight 3×5 matrices, ten column sets, four degrees). These support the sign/order check, not replace the general proof.

| Check | Result |
|---|---|
| `check_blueprint.py` — PMIA | 0 errors, 0 warnings; 486 nodes, 536 baseline entries after PR #7967 (525 before integration) |
| `check_blueprint.py` — L3 | 0 errors, 26 inherited short-API warnings; 1,663 nodes |
| Source-issue validation | E17–E20 have scoped locators, versions and confirmations |
| Native `lean-check` — PMIA | Final combined file: exit 0, 1,041 warnings, all `sorry`; before integration: 917 warnings |
| Native `lean-check` — L3 | Fails before declarations at missing `research.blueprint.suggested` modules |
| L3 dependency-concatenation diagnostic | Does not establish native full-file compilation; exact scope and dependency failures are in the handoff |
| L6 suggested coverage | 50 node declarations, 172 API items and 57 named test examples present |
| Git/JSON/scope checks | JSON parses; no new implementation claim, source excerpt field or unauthorized change |

The 26 L3 warnings were present before this continuation and concern small API outlines outside the two fix handoffs. No link map or restructuring proposal is under review, so their validators do not apply.

## Required follow-ups

The authorized two-packet review requires no further mathematical work. The next authorized workers should:

1. Preserve the reader repair merged in PR #7967; the former 25-node reader objection is closed. The shared L4 projector is now declared in L4 under the same interface and reused by L6.
2. Complete the residual L4 work inventoried by `handoff/BP-PadicMeasuresIwasawaAlgebras~2.md`: 14 absent declaration names, 12 annotated test records and the named source/proof inputs. This review does not accept the revised L4 layer.
3. Review L3-2's root and Ferrero–Greenberg interfaces with the source-range/convention checks above, and obtain the exact RD.6 inputs.
4. Repair inherited L1/L2 suggested-file dependency failures under their own scopes; the handoff names their locations. Supply their compiled planned-module artifacts in an appropriate build before claiming native L3 compilation.
5. Carry out the shared log-syntomic and solid finite-slope producer work with their distinct owners. D.1 is now accepted; the earlier report's assertion that it lacked a revision is superseded.

The earlier cross-owner questions remain maintainer notes: reconcile AdicSpacesPartII's higher-Fitting request and IntegralHeckeAndGaloisDeterminants' carrier with accepted RS-16 rather than silently broadening this request. I.6/I.7 should import L6's algebra when decomposed; the KTheoryLowDegrees compound-matrix consumer can reuse its exterior-power comparison. No upstream roadmap or link between upstream roadmaps was mutated.

## Concurrent revision integration

PR #7967 merged while this PR was being opened. The merge conflict was confined to suggested-file commentary. All of its 17 revised L4 nodes, 11 new baseline entries, coverage/gaps/checks and reader are preserved. A structural comparison confirms that every non-L6 node equals the integration base, and every L6 mathematical record equals the reviewed input apart from this review's seven wording changes. The projector moved from its L6 stand-in to the owning L4 block with the same definition and signature.

The final combined file elaborates natively with its own pinned imports: exit 0, no errors and 1,041 warnings, all `sorry`.

The revised packet retains a precise inventory of 14 missing declaration names. Independently checking declaration commands confirms these absences, including `charIdeal_baseChange`, `charIdeal_restrictScalars`, `card_quotient_omega_eq`, `coinvariants_euler_product` and `invariants_coinvariants_six_term_exact`. Its inventory also lists 12 missing annotated test records across five nodes, including the generator/ramified-normalization, characteristic-ideal norm/Fitting and integral-character controls. These are concrete required suggested-file interfaces; their absence is not an objection to an explicitly partial roadmap merely because it has open targets. The revision handoff lists further exact source/proof inputs and states that NSW, Bourbaki and the Coates–Sujatha appendix were not freshly authenticated. This review does not convert those limitations into source confirmations.

The reader now enumerates 50 L6 nodes and assigns the basic Fitting carrier to StableReduction while retaining higher algebra here. That resolves the old reader-count/ownership objection. The current `needs_changes` verdict is narrowed to the remaining interface/test correspondence and source/proof inputs, without claiming an independent review of the new L4 mathematics.

## Queue scope mismatch

The live GitHub issue #6219 was reread after final validation: its deliverables and full instructions name only L3 and PMIA as packets under review. The local queue entry additionally lists L3-2 and D.1 and their suggested files. `issues.deliverables_complete` requires every listed packet to carry this exact fix-review identifier; the other packets have their own review identifiers. As a result, the queue can classify this submission as a checkpoint even though the issue-authorized review is finished. The current predicate would also classify the earlier two-packet verdict record as incomplete.

The maintainer must reconcile the queue with the issue, or explicitly assign the additional review scope. This session follows WORKERS' restriction to named deliverables and leaves both extra packets and the queue unchanged. D.1's newer accepted independent review is not overwritten. No further source review of either extra packet is certified here.

## Current L6 rereading ledger

Each identifier below has prefix `PadicMeasuresIwasawaAlgebras:L6/`. The current verdict concerns the corrected planning contract. Earlier per-node edit details remain in `reviewHistory`; no implementation is certified.

| Node | Current verdict | Source locator / supplied proof boundary |
|---|---|---|
| `character-evaluation` | correct | §2.2, arXiv v3 PDF p. 15 |
| `joint-evaluation-injective` | correct | §2.2, arXiv v3 PDF p. 15 |
| `character-group-ring` | corrected | §2.2, arXiv v3 PDF p. 15 |
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
| `higher-fitting-ideal` | corrected | Appendix B.2, first paragraph, arXiv v3 PDF p. 93 |
| `relation-minors-add-generator` | corrected | Appendix B.2, the paragraph before Lemma B.5, arXiv v3 PDF p. 94 |
| `higher-fitting-independence` | corrected | Appendix B.2, first paragraph, arXiv v3 PDF p. 93 |
| `higher-fitting-base-change` | correct | Appendix B.2, after (172), arXiv v3 PDF p. 93 |
| `locally-quadratic-presentation` | corrected | Remark A.7, arXiv v3 PDF p. 86 |
| `extension-relation-matrix` | correct | Lemma 2.6, arXiv v3 PDF p. 18 |
| `quadratic-presentation-extension` | correct | Lemma 2.6, arXiv v3 PDF p. 18 |
| `fitting-extension` | corrected | Lemma 2.6, arXiv v3 PDF p. 18 |
| `fitting-fibre-product` | corrected | Lemma 2.7 and proof, arXiv v3 PDF p. 18 |
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
