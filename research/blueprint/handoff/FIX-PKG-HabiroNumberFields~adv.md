# FIX-PKG-HabiroNumberFields~adv — handoff

Job: `FIX-PKG-HabiroNumberFields~adv` (issue #11340). Worker: Claude (Opus 5.5), session
`claude-hA3Fp3`, 20 October 2026. The job is complete. The verdict stays **accepted**, and
`review.json` now names this fix round as its reviewer. That repairs the intake error of
10:32Z, which said the previous reviewer name did not review a job that wrote `review.json`.

## What the job was

The independent review `REV-PKG-HabiroNumberFields~adv` (Codex, #11070) accepted the package
after making four corrections in place, and left no finding open. This round carries out the
maintainer's de-cycling decision of 2026-10-20 for this roadmap:

- repoint the Polylogarithms P.1 citation to PolylogarithmFunctions;
- name Polylogarithms (P.2 onward) only as a downstream consumer;
- replace the two non-package names on the supplier line by HabiroCyclotomicCompletions and
  the actual owner.

## Review corrections re-checked

All four corrections listed in `reviews/REV-PKG-HabiroNumberFields~adv.md` are in the README
on main. I checked each one by its object:

- Hutchinson 2024 §2.1, Lemma 2.1 and Corollary 2.2, p. 2, in §1.8, with the Bott locator §4,
  Lemma 4.1, p. 6.
- The even chain `α₂=Σ_j[t^j|t]` and its two-term order-three Check, in §1.8.
- Wagner's "§2.2, item 2.11 and Lemma 2.12, pp. 31–32", in §§2.1 and 2.3 and in References.
- Belabas–Gangl §7, p. 24, discriminant −4, in §0.2.

Nothing from that review is reopened.

## Finding → change

| Finding (directive) | Where | Change |
|---|---|---|
| The atlas could not take in `review.json` (wrong reviewer name). | `review.json` | Reviewer is now `fix-FIX-PKG-HabiroNumberFields~adv`, dated 2026-10-20, with a finding-by-finding note. |
| Polylogarithms P.1 is cited as a supplier, but P.1 moves to the new roadmap PolylogarithmFunctions, and Polylogarithms comes after this roadmap. | Scope ¶3; supplier contract ¶ on q-series and dilogarithms; §1.3 *Needs* | All three now cite **PolylogarithmFunctions** by name, with no layer ids since its design job (#11333) has not fixed any. The contract states what KMS uses: the principal complex Li₂ with Li₂(1)=π²/6, and its complex inversion and five-term identities with principal branches on a simply connected domain. The domain is a neighbourhood of (X,Y)=(1/5,2) on the hypersurface, where every variable argument is real and below one (checked: −1/8, −8/5, −5/8, 1/10, 1/5, 1/2, −4/5). Polylogarithms is not named anywhere: it consumes nothing from here (its README has no Habiro or cyclic-dilogarithm use), so it is not listed among the consumers either. |
| "HabiroCyclotomicCompletion" is not a package name. | Scope ¶3; supplier contract; §2.7 | Now **HabiroCyclotomicCompletions**, with the stage ids the accepted packets cite: HC.1, HC.3, HC.4 and HC.5. HC.5 is the Chinese-remainder decomposition used in §2.7; the README had named only HC.3–HC.4. |
| "HabiroCohomologyRelative" is not a package name; its "HR.1 and HR.5" are HabiroRings' stage ids. The packets cite `HabiroRings:HR.1/the-etale-frobenius-lift` and `HabiroRings:HR.5/the-ell-adic-taylor-comparison`. | Scope ¶3; supplier contract; §§2.2, 2.6, 2.7; Layer 2 Dependencies; Downstream consumers | The actual owner is **HabiroRings**. But HabiroRings consumes this roadmap: its README ¶ on imported mathematics names `HabiroNumberFields:HB.6` and `HB.7`, its GSWZ ring comparison imports the HB.6 ring, and HR.6 transports the HB.7 lines. Naming it as a supplier would make the two packages cite each other. So I moved the two notions down, as WORKERS.md "Upstream tiers" and PACKAGE_REVIEW.md check 3 require. In the base-ℤ case both use only Mathlib: **`unramifiedFrobenius`** (§2.2) and **`primeToPLocalChart`** (§2.6) are now targets here, each with exact hypotheses, proof route, API and locators. Their Checks are added to the existing lists of §§2.2 and 2.6. HabiroRings is named only in the scope paragraph ("given downstream by") and under Downstream consumers. No HR id remains in the README. |
| Same defect, other names on the same lines: "QuantumModularity", "MotivicCohomologyAndRegulators" and "ColemanPolylogarithms" are not roadmap ids. None is in `research/blueprint/atlas/roadmaps/`, `roadmaps/` or `packages/`. | Scope ¶2–3; supplier contracts; §§1.2, 1.3, 1.6, 3.1, 3.3, 3.18; Layer 3 Dependencies | Mapped by the stage ids the accepted packets cite: **QSeriesPartitionsAndMockModularForms** QM.0–QM.1; **MotivicEtaleKTheory** M.1, M.3, M.7 and the M.8 prefix (M.3 is Tate's degree-two comparison, used in §1.6); **PadicHodgeRegulators** D.1, D.3, D.4 (D.1 is Coleman's Li₂, its branch and the GSWZ normalisation of D_p). I checked that each of these ids exists in the atlas and that none of these roadmaps' packets lists a HabiroNumberFields prerequisite. |
| The Gabber-rigidity input of §1.11 had no named owner ("the finite-field Bloch and K-theory suppliers"). | Scope ¶2; supplier contracts; §1.11 *Needs* | Named from the packet's requests: **KTheoryFiniteLocalFields** L.2 (finite-coefficient rigidity for the completed local ring at a prime away from p) and L.7 (compatibility of the global finite Chern class with completion and with the finite-field Chern class). |
| The downstream sentence for the relative roadmap used the wrong name, and a "QuantumModularity can use…" sentence named a supplier as a consumer. | Downstream consumers | Rewritten. HabiroRings compares its relative ring with Layer 2, transports the Layer 3 lines, and generalises the two moved-down targets. ArithmeticQuantumTopology uses HB.6–HB.7, per its README. The QuantumModularity sentence is deleted: QSeriesPartitionsAndMockModularForms supplies QM.0–QM.1 here and does not consume this roadmap. |
| Wagner's Q paper was cited for the moved-down chart but not listed. | References | Added: arXiv:2510.04782v2, §2.2, item 2.7, p. 15, and Lemma 2.12 with its proof, p. 18. The thesis entry now also gives item 2.7, p. 29. |
| Suggested.lean closing comment. | Suggested.lean | `unramifiedFrobenius` and "the prime-to-p local chart" are added to the list of README definitions absent from the file. Nothing else changed: no new declaration, since neither target is a layer milestone. |

Current Tau Ceti (a91d3aa, read-only checkout) was searched by object for both moved-down
targets.

- `TauCeti.frobeniusAlgEquiv` in `TauCeti.NumberTheory.LocalField.ResidueCorrespondence` is
  the Frobenius of a single unramified local extension, with `valuation_frobeniusAlgEquiv_sub_pow`,
  `orderOf_frobeniusAlgEquiv` and `eq_frobeniusAlgEquiv_of_valuation_sub_pow_lt_one`. It is
  cited, both in the scope paragraph and factorwise in §2.2. It is not at the pin f790474:
  the pinned index has no entry. The new target is only its assembly on the semilocal
  completion R̂_p of the S-integers, together with naturality in field embeddings.
- No Tau Ceti or upstream-roadmap object gives the (p,Φ_m)-adic chart.
- The Mathlib names cited were read at 082e2d3:
  - `Algebra.FormallySmooth.exists_mkₐ_comp_eq_of_isAdicComplete`
  - `Algebra.FormallyUnramified.ext_of_iInf`
  - `Polynomial.separable_cyclotomic`
  - `StandardEtalePair`
  - `NumberField.not_dvd_discr_iff_isUnramifiedIn`
  - `Algebra.Etale.of_formallyUnramified_of_flat`

Sources opened for the new locators: GSWZ arXiv:2412.04241v2, Definition 1.1 and (13),
pp. 6–7, and §5.2, (324)–(330), pp. 64–65 (eqs. (324)–(328) on p. 64, (329)–(330) on p. 65);
Wagner thesis items 2.7 (p. 29), 2.11 and Lemma 2.12 (statement p. 31, ℓ-adic step of the
proof p. 32); Wagner Q, item 2.7 (p. 15) and Lemma 2.12 with its proof (p. 18).

## Adversarial pass on the touched statements

| Statement | Instances tried | Result | Change |
|---|---|---|---|
| `unramifiedFrobenius`: unique endomorphism of R̂_p with φ(a)−a^p∈pR̂_p, p∤Δ | K=ℚ, every p; K=ℚ(i), p=3 inert, p=5 split; K=ℚ(√5), p=2 inert; K=ℚ(∛2), p=5; p∣Δ (zero ring) | On ℤ_p it is the identity, while a↦a^p fails: 2³=8≠2 at p=3. On ℚ(i), i↦i³=−i at 3 and i↦i at 5. On ℚ(√5) at 2, φ↦1−φ≡φ² mod 2. On ℚ(∛2), x³−2≡(x−3)(x²+3x+4) mod 5 (discriminant 3 is a nonsquare), so the order is lcm(1,2)=2. On the zero ring the statement is vacuous. | New target and three Checks. |
| φ_R fixes the factors of R̂_p but its extension can permute factors of A_m(R̂_p) | K=ℚ(i), p=3, m=4 | e=(1−i⊗ζ₄)/2 is idempotent (2 is a unit) and φ⊗id sends it to 1−e. | Clause and Check added, so the target agrees with the existing sentence on factor permutations. |
| Existence and uniqueness route | Formal smoothness of R over ℤ (étale over the localisation ℤ[1/Δ]); pR̂_p complete; ⋂p^aR̂_p=0 | Matches the hypotheses of the two Mathlib lemmas as stated at the pin. | Mathlib lemmas cited. |
| `unramifiedFrobenius_fieldMap` | F→E with a common Δ divisible by both discriminants | Both composites lift the same map modulo p, so they agree by uniqueness. | Cited again in §3.16. |
| `primeToPLocalChart`: ℤ_p[q]^(p,Φ_m)≃A_m(ℤ_p)[[x]], q↦ζ_m+x, p∤m | m=1, every p; m=2, p odd; m=3, p≠3; (p,m)=(11,5), (2,3); p=3, m=3 (excluded) | Φ₃(ζ₃+x)=(2ζ₃+1)x+x² with (2ζ₃+1)²=−3. At p=3, Φ₃≡(q−1)² mod 3: the completion is ℤ₃[[q−1]] (reduced mod 3), but A₃(ℤ₃)[[x]] mod 3 is nonreduced, so the hypothesis p∤m is necessary. At (11,5) there are four factors and at (2,3) one quadratic unramified factor. | New target and three Checks. Source issue recorded (below). |
| Inverse map of the chart | Φ_m′(ζ_m) a unit (separability mod p, completeness) | Φ_m(ζ_m+x)=x·unit, so (p,Φ_m)↦(p,x). One composite fixes q; the other fixes x and, by uniqueness of étale lifts, ζ_m. | Proof wording corrected in the same edit. |
| PolylogarithmFunctions contract | Arguments at (1/5,2): X/(YZ)=−1/8, YZ=−8/5, 1/(YZ)=−5/8, X/Y=1/10, X=1/5, 1/Y=1/2, Z=−4/5 | All real and below one, so principal branches apply. YZ and 1/(YZ) together need inversion, which is why the contract names inversion as well as the five-term identity. | Contract states both. |
| KTheoryFiniteLocalFields contract | n=1; 𝔮 above p | n=1 gives trivial groups. At a prime above p rigidity fails, and the contract excludes it. | Hypothesis "𝔮 not above p" stated. |
| MotivicEtaleKTheory M.3 added | §1.6 sequence at n=1; μ_p⊂F | Unchanged hypotheses: the root-free condition and p∤w₂ remain in §1.6. | Supplier named. |
| Downstream consumers | HabiroRings, ArithmeticQuantumTopology | Both cite HB.6/HB.7 in their packets (19 and 4 citations, as prerequisites or requests). | Rewritten. |

The Lean file is unchanged apart from its closing comment, so the generality of the README and
of the Lean file still agree.

## Checks run

- `lean-check research/blueprint/packages/HabiroNumberFields/Suggested.lean`: exit 0; four
  warnings, all `declaration uses 'sorry'` (lines 44, 51, 72, 81). That run was after the last
  change to the file.
- `mech_check.py` (read-only copy, run with `python3 -I`): output identical to the reviewed
  version except for the counts (55 bold targets; 143 backticked ids, up from 132). It still
  reports the same pre-existing items: five README API names of Lean-declared definitions;
  the word "continuation" in §3.3's "analytic continuation"; and header-only Lean sections
  for Layers 0 and 2. The adv review accepted all three, and they are outside this round.
- `research/blueprint/intake.py check-files` on the four deliverables (result in the pull
  request).
- `git diff --check`: clean.

## For the maintainer (outside this job's files)

1. **Packets to repoint.** These citations should follow the README when the packets are next
   revised:
   - `packets/HabiroNumberFields--HB.6.json`, node `prime-to-p-taylor-equivalence`, still
     lists `HabiroRings:HR.5/the-ell-adic-taylor-comparison`.
   - `packets/HabiroNumberFields.json`, node `HB.6/coefficient-rings-and-frobenius`, still
     lists `HabiroRings:HR.1/the-etale-frobenius-lift`.
   - `packets/HabiroNumberFields--HB.2.json`, node `kms-odd-order-proof`, and its request
     still cite `Polylogarithms:P.1`. They should point to PolylogarithmFunctions, and design
     job #11333 should include that request's five-term and inversion specialisation near
     (1/5, 2).

   The moved-down targets would become HB.6 nodes.
2. **HabiroRings** can import `unramifiedFrobenius` and `primeToPLocalChart` for its base-ℤ
   case (its HR.1 étale Frobenius lift and HR.5 prime-adic Taylor comparison generalise them).
   Its fix job #11307 is open.
3. **Package-level cycles elsewhere, unchanged by this job.** Each involves files this job
   may not edit:
   - **K3BlochGroups.** Node `K3BlochGroups:V.6/finite-coefficient-identification` (part
     packet V.6) cites HB.1/HB.2, and the K3BlochGroups package README says its §6.7 uses a
     scalar returned by HabiroNumberFields. This roadmap imports K3BlochGroups V.2–V.6. The
     V.6 node used here (`V.6/comparison-finite-coefficients`) depends only on K3BlochGroups
     nodes, so the cycle is at stage and package level, not at node level.
   - **KTheoryFiniteLocalFields.** Node `relative-k-of-truncated-polynomial-…` cites
     `HabiroRings:HR.4/truncated-big-witt-vectors`. HabiroRings itself says the big Witt
     library belongs to QWittVectors QW.0, and HabiroRings consumes this roadmap, which uses
     KTheoryFiniteLocalFields L.2/L.7.
   - **HabiroCyclotomicCompletions.** Node `ordinary-versus-derived-completion` cites
     `HabiroRings:HR.2/habiro-complete-modules`, while HabiroRings imports HC.1/HC.3–HC.5, and
     this roadmap imports HabiroCyclotomicCompletions.
4. **Source issue for errata.** The ℓ-completion step of Lemma 2.12 asserts that Φ_m is
   irreducible over 𝔽_ℓ whenever ℓ∤m, in both Wagner's thesis (p. 32) and Q
   (arXiv:2510.04782v2, p. 18). That is false: Φ₅ splits into four linear factors mod 11. The
   conclusion still holds, because the argument needs only separability, applied factor by
   factor. §2.6 records the correction. HabiroRings' README already avoids the claim.

No suspicious instruction was met in the issue comments, the other packages or the fetched
sources.
