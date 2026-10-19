# Independent review: RankZeroOneBSDPartII

**Verdict: accepted after interface corrections.** Reviewer: Codex, session
`codex-ep4lv6`, job `REV-DESIGN-RankZeroOneBSDPartII` (#3601), 2026-10-19.
The reviewed design was produced by a different session, `codex-U5afty`.

This accepts the target-level planning pass, with its recorded supplier frontier;
it does not certify an implementation. All six layers remain `planned`, every
node remains `unchecked`, and no layer is closed. The p∞ converse has a coherent
route through the named suppliers. The finite-Selmer and density applications
also require the explicitly requested Cassels–Tate endpoint, GAP-CT. No
unrecorded mathematical contradiction was found.

## Inventory and changes

| Item | Before | After |
| --- | ---: | ---: |
| Target nodes | 17 | 17 |
| Definitions / comparisons / theorems / applications | 3 / 3 / 10 / 1 | 3 / 3 / 10 / 1 |
| Definition API items | 14 | 18 |
| Definition tests | 12 | 12 |
| Planets | 13 | 13 |
| Baseline declarations | 13 | 13 |
| Requests / explicit gaps | 10 / 1 | 10 / 1 |
| Planned / closed layers | 6 / 0 | 6 / 0 |

Two nodes were corrected; fifteen were verified. No node was added or removed,
and no baseline citation was removed or replaced.

1. `EC.0/eisenstein-converse-data`: specify a **Prop-valued** bundle over the
   fixed actual curve, prime and isogeny. Add `EisensteinConverseData.mk`,
   `transport_refl` and `transport_trans`. These cover construction
   and the identity/composition laws needed
   to use diagram transport. They do not introduce a freely chosen residual
   constituent or another elliptic-curve carrier. Witness equality uses existing
   proof irrelevance instead of a bespoke extensionality lemma.
2. `EC.4/admissible-twists`: add
   `mem_admissibleTwists_iff_converseData`. A twist's family membership is
   equivalent to the good odd-prime converse bundle for its actual twisted
   isogeny. This makes the interface used by the statistical application
   explicit in both directions.
3. Synchronize the reader's definition, API lists and counts. The four added
   interfaces stay in the reader because their arithmetic carriers are absent
   at the pins. The roadmap definition and suggested Lean statements need no
   correction and were left unchanged.
4. Add an independent verdict to every node and confirm both `sourceIssues`
   entries with reasons. All source descriptions remain in our own words;
   there are no source-excerpt fields.

## Node-by-node assessment

The packet's `review.checked` contains the individual verdicts and reasons.
The following records the substantive checks; node suffixes are relative to
`RankZeroOneBSDPartII`.

| Node | Verdict | Check |
| --- | --- | --- |
| EC.0/eisenstein-converse-data | corrected | Good odd prime, actual kernel, both excluded characters, duality and nonsplit residual extensions; complete the bundle API. |
| EC.0/small-selmer-corank | verified | Finite-level coefficient identification plus paired primary quotient modulo divisible Sha; GAP-CT stays explicit. |
| EC.1/auxiliary-fields | verified | Both complementary nonvanishing branches, ordinary modular parity, splitting at p and every level prime, odd D<−4. |
| EC.1/selmer-corank-over-k | verified | Forward theorem on the already understood twist, then odd-primary quadratic decomposition; no forward use of the desired conclusion for E. |
| EC.2/augmentation-control | verified | Ordinary rank-one X, rational discrete control, height-one localization, compact injection and retained cokernel errors. |
| EC.2/heegner-specialization-factor | verified | Exact stabilized bottom factor, unit index and Howard comparison; no division by the class number. |
| EC.2/heegner-point-nontorsion | verified | Index-square equality at augmentation, compact specialization, positive height and the classical Gross–Zagier specialization. |
| EC.3/p-converse | verified | Subtract the known complementary twist order from the simple base-change order for each r=0,1. |
| EC.3/rank-and-sha | verified | Arithmetic rank and full Sha finiteness follow after the analytic converse. |
| EC.3/mod-p-converse | verified | Low finite-Selmer dimension uses the paired-primary argument, with p=3 included. |
| EC.4/admissible-twists | corrected | Actual twisted kernel, good reduction, four local squareclasses, duality, representative independence; add the converse-bundle bridge. |
| EC.4/admissible-ratio-strata | verified | Fix the admissible class at 3, choose ratios 1 elsewhere and use the real sign; retain local-density counting. |
| EC.4/relative-proportion-bounds | verified | Restricted-family Selmer bounds, actual stratum masses and lower limits. |
| EC.4/positive-twist-proportions | verified | The existence of a good-at-3 twist remains an explicit hypothesis. |
| EC.5/nineteen-a3-model | verified | Exact existing-carrier coefficients, invariants, base change, raw twist normalization and four tests. |
| EC.5/nineteen-a3-admissibility | verified | Rational flex, good ordinary reduction, admissible class and signed-squarefree density 3/8. |
| EC.5/no-good-three-twist | verified | Rational flex and negative 3-adic j valuation exclude every good-at-3 quadratic twist. |

## Sources and proof contracts

Public copies were fetched and read independently at the packet's locators.
All three principal PDF hashes and the additional arXiv-v2 hash match the
packet. Pagination below is version-specific.

- [CGLS, published author copy](https://web.math.ucsb.edu/~castella/Eisenstein-print.pdf):
  standing hypotheses and Theorem E, pp.517–521; §3.4, especially Corollary
  3.4.2, pp.564–566; §4.1, Theorems 4.1.1–4.1.2 and Remark 4.1.3,
  pp.566–569; §4.2 through Corollary 4.2.3, pp.569–570; §5.2,
  Theorem 5.2.1, Corollaries 5.2.2–5.2.3 and Remark 5.2.4, pp.573–575.
- [BKLOS, 25-page author copy](https://lemkeoliver.github.io/papers/19-3IsogenySelmer.pdf):
  §2, pp.2–5; §9.1–§9.2, p.14; §10, pp.14–17, including Propositions
  10.1 and 10.7 and Theorem 10.5; §11 proof of Theorem 2.6, p.18.
- [Poonen–Stoll, corrected author copy](https://math.mit.edu/~poonen/papers/sha.pdf):
  §§1–2, pp.2–4; §6, Theorem 8 and Corollary 9, pp.11–12. Elliptic
  alternation and the divisible kernels support the finite paired-primary
  quotient; they do not permit assuming the entire Sha finite in advance.
- [CGLS arXiv v2](https://arxiv.org/pdf/2008.02571v2): §5.2, pp.31–32,
  independently collated with the published pp.574–575. The relevant density
  proof and numerical example persist. The arXiv version history, author
  publication listing and journal page were also checked; no separate
  correction to these two points was located in those listings.

The proof uses the **ordinary rank-one** dual X, not the primitive torsion
Greenberg dual X_E. At P₀=(γ−1), the free rank-one summand already exhausts
the rational coinvariant dimension. Any nonzero localized torsion summand
would increase that dimension. Finite errors disappear after inverting p;
inverting γ−1 instead would destroy the needed argument. The parent supplies
the Heegner characteristic-ideal equality under (Sel). The compact control
request retains local saturation and H²/Tor cokernel terms. A generic control
node alone is not presented as a proved arithmetic instantiation.

Remark 4.1.3, equations (4.4)–(4.5), pp.568–569, supplies the actual bottom
normalization. The local exclusion makes α−1 a unit, while β=p/α makes β−1
a unit. Thus the comparison with the traced classical point preserves
nonvanishing. The Gross–Zagier supplier includes the general classical X₀(N)
specialization; a squarefree-conductor restriction is not needed here. The
pinned height comparison changes the relevant height by positive factors,
which suffice for the qualitative nonvanishing conclusion.

I read the direct supplier statements for the parent BSD.0/.1/.2/.4/.7a,
SI L2/L3/L4, HE.8, PMIA L4, GZ.0/GZ.8, ArithmeticStatistics ST.0/ST.5 and
the shared CM p-converse predicate. Their exact arithmetic conventions and
scope match the uses. Stage references without exact endpoints have precise
requests. The source-extension ownership of the missing pairing remains with
SI L1–L2; this review creates no duplicate pairing development.

## Source findings

Both findings are **confirmed as proof gaps**, with `affects: the proof`.

- **E1:** CGLS Corollary 5.2.3, p.575, uses a good-prime converse after
  arranging a character condition by twisting. For W:y²+xy+3y=x³, the
  nonidentity rational flex gives a 3-isogeny, but Δ=−2160, c₄=−71 and
  j=357911/2160 give v₃(j)=−3. Since j is twist invariant, no quadratic
  twist is good at 3. The roadmap correctly retains existence of a good-at-3
  twist in its version of the density application. This is not a
  counterexample to the qualitative density conclusion by other methods.
- **E2:** CGLS Remark 5.2.4, p.575, transfers the unrestricted BKLOS bounds
  to analytic ranks for 19a3. For its displayed rational kernel, good
  character-admissible twists have signed squarefree d≡2 mod3. Their mass
  is 3/8: the mass prime to 3 is 3/4, split equally between unit classes.
  Consequently that conversion alone cannot produce a rank-one set of
  density 41.6%. Each valid bound must retain the intersection with A₃ and
  its mass. This likewise does not disprove the actual full-family
  percentages, and the packet correctly avoids asserting replacement
  numerical bounds without computing the intersections.

## Baseline, ownership and scope

All thirteen baseline entries were checked by reading their Lean statements
at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`, including their surrounding
hypotheses:

- `NumberField.finite_setOfPred_logHeight₁_le` and
  `WeierstrassCurve.Affine.finite_naiveHeight_le` provide the Northcott route.
- `WeierstrassCurve.Affine.Point.canonicalHeight_nonneg` and
  `canonicalHeight_eq_zero_iff_isOfFinAddOrder` require the stated elliptic,
  admissible-height and decidable-equality instances, and Northcott for the
  latter. Those hypotheses are retained; zero height is not used as a
  torsion criterion over an arbitrary field.
- `WeierstrassCurve`, `Δ`, `c₄`, `c₆`, `IsElliptic`, `j` and `map` are the
  existing five-coefficient carrier, invariant formulas, unit-discriminant
  predicate, instance-dependent j and coefficientwise base change.
- `WeierstrassCurve.quadraticTwistOf` and `Δ_quadraticTwistOf` use trace/norm
  parameters t,n and discriminant parameter t²−4n. Thus (0,−2) scales the
  raw discriminant by 8⁶, as the suggested test states.

The reviewed AUDIT-27 entries for the parent and Selmer suppliers and
AUDIT-07 ST.5 distinguish existing heights, twists and finite 2-descent from
the absent general p∞/Sha/converse and statistical theories. The plan reuses
the former. I also inspected the current read-only roadmap tree at
`0d144d044dacebca17b654695b6f1ad58f159b27` and Tau Ceti library at
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, screened the nine newer roadmap
families, and checked the relevant EllipticCurves and ModularForms README
contracts. No duplicate of this converse or the exact pairing endpoint was
found. EllipticCurves Layer 7's Selmer/Sha and isogeny-invariance targets are
not silently substituted for a pairing modulo divisible kernels.

The aggregate brief's CM and Skinner endpoints already exist in the accepted
CMRankZeroConverse and RankOneConverse packets. Their targetCoverage entries
and routing reconciliation preserve those owners. The new layers form an
acyclic EC.0→EC.1→EC.2→EC.3→EC.4→EC.5 development; they neither redo those
branches nor import Skinner's irreducibility and p≥5 restrictions into this
Eisenstein argument. All stated stage targets have nodes at target granularity.

## Validation and handoff

- `python3 scripts/check_blueprint.py research/blueprint/packets/RankZeroOneBSDPartII.json --index <pinned-declarations.tsv>`:
  **0 errors, 0 warnings**. The index checks declaration identity; the source
  readings above separately check mathematical fit.
- Shared `source_issues.check_issues` and `check_errata.versions_checked`:
  pass; all four recorded PDF hashes match the independently downloaded files.
- `lean-check research/blueprint/suggested/RankZeroOneBSDPartII.lean`:
  exit 0 at the pinned shared build, **zero errors and ten warnings, all
  declaration-uses-sorry warnings**. Available memory was above the required
  threshold. The 83-line file has one real-bodied data definition, five API
  statements and five examples. Elaboration validates signatures, not proofs.
- Independent exact rational computations confirm both models' discriminants,
  c₄ and j, nineteenA3's c₆=8, its five affine points over F₃, and W's negative
  j valuation. These calculations complement the source checks; they do not
  formalize the local-family theorems.
- Every definition has four discriminating tests. Their wrong-model,
  bad-prime, excluded-character, squareclass, empty-family and normalization
  checks are substantive. Thirteen planets stay within the per-layer limit.

This review job is complete. No unfinished review work or local scratch file
is needed by the next worker. The maintainer/orchestrator should retain the
existing routing reconciliation and register the shared SI Cassels–Tate
modulo-divisible endpoint once its owner supplies it. The ten precise requests
and layer `remaining` lists identify implementation obligations. No request
to change upstream TauCetiRoadmap, no second job, and no claim of formalized
converse or density theorem is made.
