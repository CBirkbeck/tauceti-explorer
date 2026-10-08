# Independent review: REV-FIX-RT-AREA-automorphic-1~4

**Completed independent fix review, 8 October 2026.** Refs #7281. Reviewer: Claude (Claude Code), session `claude-95TvAO`. The claim comment (6052086202) was confirmed by the bot before work started.

**Independence.** This session wrote none of the work under review:
- the fix round FIX-RT-AREA-automorphic-1~4 (Codex `codex-Z0ErNN`, issue #7280, PR #7314, merged as `42f6798e8`);
- the earlier rounds and their reviews, including FIX~3 (`codex-2k3LL6`, PR #7260) and REV~3 (`gpt6astra-e19d65722997`, PR #7302);
- the red team RT-AREA-automorphic-1, its verification, or any of the thirteen blueprints.

The review was made at origin/main `bc922e658`.

## Verdict

| Packet | Status | Why |
|---|---|---|
| `IntegralHeckeAndGaloisDeterminants` | **accepted** | /18 producer unchanged and right. Three paraphrased source-issue records corrected; nothing else changed since the accepted REV~3. |
| `GL2AutomorphicRepresentationsAndTransfer--R17.3` | needs_changes | Packet and suggested file are now right (one attribution fixed; 41 false declarations and 12 tests repaired). The reader still contradicts the /1 fix (§ Reader synchronization). |
| `GL2AutomorphicRepresentationsAndTransfer--R16.1` | needs_changes | Packet and suggested file are now right (one stale gap fixed; 31 false declarations and 7 tests repaired). The reader still contradicts the /9 fix and describes the suggested file wrongly. |
| `ArithmeticLocallySymmetricSpaces` | needs_changes | Packet right after a one-word correction. The reader is unchanged since promotion and contradicts the /6 fix. |
| `HilbertModularVarietiesAndShimuraCurves--R18.2` | needs_changes | Packet right after one scope correction. The reader is unchanged since promotion and contradicts the /31 residual-coefficient correction. |
| `AutomorphicFormsOnReductiveGroups` | needs_changes | Fixes right after corrections (/26 supplier, Hecke operator signature). Own blueprint review not accepted; revision pending; reader contradictions. |
| `AutomorphicLFunctionsAndLocalFactors` | needs_changes | Fixes right. Own blueprint review not accepted; revision pending; six reader contradictions. |
| `AutomorphicSpectralTheory` | needs_changes | Fixes right after one correction. Own blueprint review not accepted; revision pending; reader contradictions. |
| `AdelicAlgebraicGroups` | needs_changes | Fixes right after corrections (split proposal cycle, two Lean signatures). Own blueprint review not accepted; revision pending. |
| `GrossZagierAndArithmeticHeights--GZ.0` | needs_changes | /19 right. Own blueprint review not accepted; revision pending; one reader contradiction. |
| `MetaplecticAutomorphicForms--MP.0` | needs_changes | /19–/23 right after corrections to /22 (real place, Hermitian routing) and /20 (direction). Own blueprint review not accepted; revision pending; reader contradictions. |
| `MetaplecticAutomorphicForms--MP.8` | needs_changes | /20 right and survives the MP.8 revision. That revision's own review (REV-MetaplecticAutomorphicForms--MP.8~2) is pending. |
| `QSeriesPartitionsAndMockModularForms` | needs_changes | /20 right. Own blueprint review not accepted; revision pending; two reader contradictions. |

Each packet's `review` object is replaced by this review's; the REV~3 object is appended to `reviewHistory`.

## How the verdicts were decided

The thirteen packets fall into two groups.

**Already live (five packets).** R17.3, R16.1, ALS, R18.2 and IHG were promoted after accepted reviews (promoted versions `96bcc4f3c`, `3827d0154`, `76f959c6e`, `e90263172`, `5bb996373`). For these the scope is exact: every change since the promoted version is checked, because acceptance would put exactly those changes live. That diff includes the fix rounds, REV~3's in-place corrections, the maintainer's no-quotation paraphrases (`17860e6ad`, `2704589fc`) and, for R18.2, the assembly commit `ea9ed1fa8`. The reader is promoted with the packet, so a reader that still states what a fix corrected means the fix is incomplete. Readers are outside this review's files, so those packets go back with an exact list.

**Never accepted (eight packets).** AF, AL, AS, AA, GZ.0, MP.0, MP.8 and QM have blueprint reviews that did not accept them, and their revisions (`BP-…~2`) are pending; MP.8's revision is done but unreviewed. Accepting a narrow fix would promote the whole packet past its own review. This follows REV-FIX-RT-AREA-padic-2~2 and REV-FIX-RT-AREA-automorphic-1~2. For these, each finding's fix was still checked and clear errors in the fix regions were corrected. Two kinds of remaining work are kept apart:
- **fix obligations:** in practice, reader synchronization;
- **blueprint-revision obligations:** the broad review's false suggested signatures and unread proofs, which belong to the pending `BP-…~2` jobs.

For the eight, **no finding needs another packet fix**: every finding's packet-side fix is right as it now stands.

## What was checked

Eight read-only passes in this session, each scoped to one group of packets and findings, compared the files with:
- the red-team claims and the verifier's binding qualifications (`RT-AREA-automorphic-1.result.json`, `.review.json`);
- the round-3 and round-4 fix reports;
- REV~3's list of residual defects;
- the supplier packets;
- the public sources (§ Sources).

Every finding they reported was then rechecked at its evidence before it was accepted or applied. Mechanical checks were run over all thirteen packets (§ Validation). Node-by-node: all changed nodes of the five live packets, and all fix-region nodes of the other eight. A fresh audit of the untouched parts of the eight unaccepted packets is not claimed; that is their revision jobs' work.

## Findings /1–/31

All identifiers have the prefix `RT-AREA-automorphic-1/`. "Right" means the files now carry the correction the verifier asked for.

| Finding | Files | Verdict | Notes |
|---|---|---|---|
| 1 | R17.3 (R17.4 nodes), AL.3 | right, corrected | gl3-recognition uses AL.3/gln-converse-reduced-rank at n=3, rs-global-poles and rs-boundary-nonvanishing; statements match Cogdell PSCT Thms 3.1/3.3 and Fields Thm 9.3. Corrected: finiteness of omitted local factors at ramified/archimedean places was credited to the unramified AL.2/jacquet-shalika-satake-bound; now requested from AL.3. Original JPSS/GJ proofs and the highly ramified T variant remain recorded gaps. Reader: § R17.3. |
| 2 | AF.1, R16.2/R16.3, AS gap, AL | right, corrected | Exact AF.1 nodes imported; Knapp Thms 2 and 5 at printed pp.403, 406 verified. Corrected R16.1 gap text that still described AF.1 as fragments. Reader: AF ~1243; R16.1 ~1325. |
| 3 | (CC/NE) | right handoff | Carried by BP-CompletedCohomologyPartII--CC.0 (#701), which lists the finding. |
| 4 | AS.6, AS.2 | right | Local real Paley–Wiener via AF.1/sf-representation plus a local-induction request; BDK a recorded gap (no SmoothRepresentationsCharactersPartII stage exists). Reader: § AS. |
| 5 | AS.1–AS.3 | right, corrected | Pseudo-Eisenstein prefix, fixed-centre and full-height variants, E37 checked at Arthur 2005 pp.34, 135. Corrected the API contour to ρ_P + positive chamber. Reader: § AS. |
| 6 | ALS.4, AF.1a request | right, corrected | Corrected "radical" to "unipotent radical" and an HR locator. Reader: § ALS. |
| 7 | AA.4 | right | RG2.4 Kneser–Tits request; Rapinchuk Thm 2.3 and Remark 1 (p.12) and the Q/one-prime proof sketch (pp.16–17) checked. |
| 8 | AL.3 | right | Fourier expansion along the last column precedes factorization; mirabolic poles depend on the character (Cogdell Fields Prop. 5.4). Reader: § AL. |
| 9 | AL.3, R16.4 | right | AL.3/global-multiplicity-one (Cogdell Thm 4.2) imported by R16.4 before strong multiplicity one. Reader: AL ~1829–1837; R16.1 ~882–890. |
| 10 | AL.2/AL.3 | right | All AF/AA/SR supplier ids exist; no AF node credited with genericity or ordinary multiplicity one. |
| 11 | R16.4→R17.3, R16.6→R17.5 | right | R17.3's request to R16.4 still asks for isobaric strong multiplicity one, which the R16.4 node does not yet state; the request is precise and pending. |
| 12 | R17.3→R18.3/R18.4 | right | All six imported R17.3 ids exist; norm characters excluded; no integral lattice equality inferred. |
| 13 | AL.5 | right | GL₂/ℚ interface to ModularSymbols L1; general GL₂/F with AutomorphicPadicLFunctions L1 (#689 lists the finding); no AL.5→L1 import. Reader: AL ~2175, ~2354. |
| 14 | R16.1, AL.0, AA | right | AL.0 sole Schwartz–Bruhat owner; AA owns none. The old "sole owners" sentence survives only in atlas stage data (maintainer). |
| 15 | (CC.8/TC.2) | right handoff | #702 and #1000 list it. |
| 16 | (CC.8/R31) | right handoff | #702 and #700 list it. |
| 17 | (CC.0/R30) | right handoff | #701 and #970 list it. |
| 18 | IHG.2 (+ CC.8/R31) | right | Producer unchanged: a finite-level theorem over a complete noetherian local ring. Consumer with #702/#700. |
| 19 | MP.6, GZ.5 | right | GQT v3 Thm 7.3(ii) p.34 and Thm 8.1 p.35 verified; `normTheta_integralRange` true as written; no MP→GZ import. Reader: MP.0 ~4811–4823; GZ.0 ~1654–1662. |
| 20 | MP.6, MP.8, QM.1, AS.0 | right, corrected | Request (e) matches Skoruppa Thm 5 (balanced tensor, finite image, dual Weil module). Corrected an MP.6 statement that described MP.8 as its supplier. MP.8 reader line 19 is resolved by #7324. Reader: QM ~958, ~4156. |
| 21 | MP.3 | right | SR.0, SR.2, SR.3, AF.1 stage imports; cover-specific results stay source-qualified. |
| 22 | MP.2, MP.6 | right, corrected | QFI 6C assumes a nonarchimedean local field; the real-place laws are Global Quadratic Forms 4.4's. MP.2 and the request now say so, and the GQF Layer 4 prerequisite and request were added. Global Hermitian existence was still routed to QFI in MP.6/pi-coherence-parity, two coverage entries and a gap; now a separately sourced Hermitian input. Reader: MP.0 ~4151, ~4203/4208, ~6795. |
| 23 | MP.5 | right | AA.3 Siegel-set/height and AF.2/AF.3 nodes exist and supply what is used. |
| 24 | AS.6, ET.1 | right | ET.1 ordinary integral imported; rank-one test with r ≥ 0. #717 lists the finding. Reader: AS ~4728. |
| 25 | AF.4 | right | Wigner, Borel–Wallach and Vogan–Zuckerman carry their central and equal-rank hypotheses. Reader: AF ~2124, ~2146. |
| 26 | AF.2 | right, corrected | Hyperspecial places at almost all v come from a reductive model (RG2.3, as AA.3 uses), not the bare Hopf model of AA.1/integral-model-exists. Prerequisite and request added. |
| 27 | ALS.4 | right | SR.2/SR.4/RG2.4 requests; integral unnormalized Satake. |
| 28 | AA.4, ALS.0 | right, corrected | Node statements right. Corrected the AA.4 split proposal, which made neat-levels and level-maps require each other. |
| 29 | AF.1a | right | Single cochain owner; local finiteness kept distinct from countability. Reader: AF ~374, ~393. |
| 30 | AF.4, ALS | right | Local prefix imports no ALS/AS node; rationality suffix imports ALS.1/3/5 and AS.5 stages; ALS imports only AF.4 prefix nodes. |
| 31 | AF.5, R18.3 | right, corrected | AF.5 carriers and the central-quotient request. Corrected the Hecke-operator signature in AF's suggested file and R18.3/norm-branch's scope. Reader: R18.2 ~528/530; AF ~2664–2707. |

## Corrections made in this review

All corrections are in the files under review and recorded here. Nothing in another job's files was changed.

**IntegralHeckeAndGaloisDeterminants (packet).**
- E17's paraphrased `printed` text had dropped the claimed equivalence in Chenevier's Definition 2.19 (split determinant ⇔ faithful quotient a product of matrix algebras), which the correction refutes; restored in own words (checked at arXiv:0809.0415v2 p.33).
- E7 now attributes the finite filtration to Definition 4.6 as used in Theorem 4.10, matching its locator.
- E14 spacing.

**GL2AutomorphicRepresentationsAndTransfer--R17.3.**
- Packet: the gap on GL₃ converse and pole inputs and the AL.3 request now ask AL.3 for holomorphy on Re s ≥ 1 of the local Rankin–Selberg factors of unitary generic representations at ramified and archimedean places. The unramified AL.2/jacquet-shalika-satake-bound does not give it.
- Packet: the signature-omission gap records the repair below and lists the 26 affected nodes.
- Packet: a bare "Round3:" coverage item replaced by a remaining-work sentence.
- Suggested file: the declarations false as written over arbitrary types and functions are replaced by §13 omission blocks, generated from the packet (node, statement, hypotheses, API and test lines). This covers cyclic and solvable base change with their API and tests, quadratic induction, the eight R17.4 interface theorems, the Artin-lifting, characteristic-two and transfer-export prototypes; in total 41 declarations and API lemmas and 12 tests. Counterexamples include Unit→Empty for the class maps, `Bool.not` for the Galois-invariance lemma and ℓ=0 for the descent fibres.
- Kept, as true as written: the Satake and adjoint matrix fragments, `indefinite_parity`, `tate_vanishing`, `finite_projective_lift`, `determinant_untwist`, `teichmuller_conductor`, `disjoint_irreducibility`, `compatible_base_change`.
- `quadratic_restriction` now assumes an algebraically closed coefficient field, as its node does; over ℚ it fails.
- The header now says every remaining declaration is intended to be true as written.

**GL2AutomorphicRepresentationsAndTransfer--R16.1.**
- Packet: the archimedean-owner gap described AF.1 as giving only W_ℝ and D_k fragments; it now names the AF.1 nodes R16.2 imports.
- Packet: the Lean-carrier gap no longer says false prototypes remain, and lists the 22 newly omitted nodes.
- Suggested file: 31 declarations and API lemmas and 7 tests false as written are replaced by §13 omission blocks generated from the packet. They include:
  - the six REV~3 listed (Iwahori oldforms, supercuspidal Kirillov, Henniart unicity, spectral ledger, strong cuspidal vanishing, specialized trace comparison);
  - the archimedean classification and factor prototypes, with their stale "AF.1b" comment;
  - the Steinberg-projector trace pair (trace 1 and trace −1 for the same arguments, which proved False);
  - `cyclicMatching` (no function Unit→Empty);
  - the local-classification, newvector, parameter, CDT-multiplicity, tamely-dihedral-supercuspidal, Hilbert-weight-dimension, R17.1 and R17.2 prototypes.
- Suggested file: true archimedean fragments added from pinned Mathlib (`Complex.Gammaℝ`, `Complex.Gammaℂ`, `Complex.Gammaℝ_mul_Gammaℝ_add_one`).

**ArithmeticLocallySymmetricSpaces.**
- ALS.4/nomizu-van-est said "N is the radical of P=M⋉N" in its statement, a hypothesis and the suggested docstring. The solvable radical of a proper parabolic contains the split centre of M, so the Levi-action clause was vacuous; now "unipotent radical of a rational parabolic".
- ALS.2/stratum-nilmanifold-fibration's Harder–Raghuram locator moved from §4.1 to §4.2.1, p.25, agreeing with ALS.4/levi-hochschild-serre.
- That node's second acceptance test now carries the splitting-field and dominant-weight conditions.
- ALS.0/cartan-involution's source note names the Cartan-involution definition.

**HilbertModularVarietiesAndShimuraCurves--R18.2.** R18.3/norm-branch was stated only for O-free coefficients. The corrected definite-degeneracy proof (Khare–Wintenberger II Lemma 7.1) applies it to residual k-coefficients on which the level acts trivially. The statement, hypothesis and suggested ledger now cover that case; the computation is the same.

**AutomorphicFormsOnReductiveGroups.**
- AF.2/spherical-dimension-one: hyperspecial places at almost all v now come from the RG2.3 reductive model; prerequisite and request added (/26).
- Suggested file: `AlgebraicModularForm.hecke` and `hecke_apply` used an "iff with unique representative" hypothesis that allows extra representatives outside JgJ. In Sym(3) with J=⟨(01)⟩, g=1 and reps={1,(02),(02)(01)}, the formula is not J-invariant. They now require reps ⊆ JgJ and one-way coset uniqueness.

**AutomorphicSpectralTheory.** The `eisenstein_integral` API of AS.1/pseudo-eisenstein took the contour in the positive chamber. For SL₂ with 0<Λ<ρ the contour shift crosses the pole at s=1. It now takes Λ−ρ_P in the open positive chamber.

**AdelicAlgebraicGroups.**
- Packet: the AA.4 split proposal placed level-action-free-at-neat in neat-levels although it needs level-quotient (level-maps), while level-maps needs it back. It is moved to level-maps, and ALS.0's extra import is noted.
- Suggested file: `levelMap_isCoveringMap` is false as written. It allows arbitrary topologies on both quotients and neatness for an arbitrary point homomorphism (trivial ρ makes it vacuous; GL₂ at full level ramifies at elliptic points), and U' need not be open. It becomes a §13 omission stating the node's hypotheses.
- Suggested file: `hecke_cartesian` is false with trivial ρ (a G_m counterexample at the primes 2 and 3). It now assumes finite type, compact U and K∞, and neatness for a faithful algebraic representation.

**MetaplecticAutomorphicForms--MP.0.**
- MP.2/weil-index-identities and the QFI 6C request scope 6C to nonarchimedean fields. The real place uses Global Quadratic Forms 4.4; that layer is added as a prerequisite and request. GQF 4.4 states that 6C's symbol theorems assume a nonarchimedean local field.
- MP.6/pi-coherence-parity's proof step, two MP.6 coverage entries and the parity gap no longer route global Hermitian existence to QFI. That routing contradicted request 6 and coherent-incoherent-sections.
- MP.6/jacobi-theta-decomposition-interface states that MP.8 specializes it, not that it imports MP.8.

## What remains

### Reader synchronization (fix obligations for the next round)

Each item is a passage that states what the corrected packet says is false. Line numbers are at `bc922e658`. Render the cited packet field to fix it.

**R17.3 reader.**
- ~916, tetrahedral step 3: uses GL₃ strong multiplicity one. The packet compares Ad(π) with the cubic induction through equal Rankin–Selberg factors and the cuspidal pole criterion (gl3-recognition (ii)), because at places inert in E only cubes of Satake classes agree.
- ~1542: says a GL₃ multiplicity-one extension is proposed; the packet requests only the AL.3b converse.
- ~33: the paragraph on the suggested file. It now has §13 omissions, elaborates at the pin, and every remaining declaration is intended to be true.
- ~704–726 (gl3-recognition): lags. Add proof step 2 and the AL.2 prerequisite with the corrected attribution, and the Cogdell Fields source.
- The R17.5 heading and the R17.4 layer-status block, deleted by the round-3 sync, should be restored.

**R16.1 reader.**
- ~882–890, R16.4/global-multiplicity-one: argues from SR.5 alone, which is p-adic, and omits AL.3/global-multiplicity-one and continuous archimedean Whittaker uniqueness.
- ~1759 (Gap 2) and ~1843: describe the suggested file as giving every target signature, or as signature checks only. Render the packet's two gaps.
- ~1325–1329, R17.1/real-quaternionic-comparison: cites ET.6, which the packet says covers finite places only; render its proof steps and prerequisites.
- ~1753 and ~15: render the corrected archimedean gap.

**ALS reader (unchanged since promotion).**
- ~1503, ~1505, ~1509, ~1511 (nomizu-van-est): render the packet statement, hypotheses and proof steps. The current text gives a Levi action without a P-extension and an invariant-form isomorphism over any characteristic-zero field.
- ~2302: the AF.1a request section states Kostant for any reductive Lie algebra over any characteristic-zero field; render the current request.
- ~1521, ~1545, ~1569, ~971: Harder–Raghuram §4.1 locators become §4.2.1 / §4.2.3, as in the packet.
- ~1527–1535 and ~68: lag. Render the packet.

**R18.2 reader (unchanged since promotion).**
- ~528/530: claims degeneracy injectivity over arbitrary coefficient algebras from Lemma 7.1; render R18.3/definite-degeneracy (residual k-module).
- ~663: render tw-localised-control's integral-control route.
- ~115: identity pro-components are identified over an algebraic closure, with descent over K a recorded gap, not "over K".
- Line 5 and the gap list: add the descent-over-K gap (from the assembly).
- The ψ hypothesis paragraphs need the quotient domain A_{F,f}^×/F^×.

**AF reader.**
- ~393: local finiteness is not countability.
- ~2685: base change need not fail when p divides |Γ_i|; use the C₂ sign module.
- ~1153: non-splitting from (jz)² = −|z|², not the order of j.
- ~1243: Knapp is read.
- ~374: GSp₄ pair after central balancing.
- ~2124: Borel–Wallach range for the split-centre quotient pair.
- ~2146: Vogan–Zuckerman in the equal-rank setting.
- ~2664: p-adic coefficients need not have open kernel.
- ~2687: class number, not type number.
- ~2705: compact modulo centre.
- ~2707: definite-quaternion constants are cuspidal.
- ~1503: the RG2.3 reductive model.

**AL reader.**
- ~15: z and z/L rescale with the Haar measure.
- ~1657/1659: Jacquet's vertical-strip class, and finite sums when n=m.
- ~1691, ~1709, ~1713: genericity proved from the Fourier expansion; Flath from AF.2; last column.
- ~1829–1837: AL.3/global-multiplicity-one, which also needs its own section.
- ~2175: the Gauss-period twisting law is AL's G12 work.
- ~2354/2356: GL₂/ℚ scope of ModularSymbols L1.

**AS reader.**
- ~4466, ~4488, ~6346: no global induced family as Paley–Wiener supplier.
- ~1560/1599: fixed-centre versus full-height pseudo-Eisenstein targets.
- ~1589: exp(z⁴)v excluded only for v≠0.
- ~1583: contour in ρ_P + chamber.
- ~4521: irreducible π.
- ~4728: r ≥ 0.
- ~919: no uniform differentiated bound.

**MP.0 reader.**
- ~4151, ~4577: Gan–Qiu–Takeda Theorems 7.3(ii)/8.1 locators.
- ~4203/4208, ~6795: global quadratic classification is Global Quadratic Forms 3/7/8, not QFI.
- ~4811–4823: toric pairing evidence; remove the GZ.5 prerequisite.
- The new real-place and Hermitian wording from this review.

**GZ.0 reader.**
- ~1654–1662: the split pairing is not given by the generic first- and second-term identities.

**QM reader.**
- ~958: balanced tensor product and finite image.
- ~4156: refined MP.7 imports.

### Blueprint-revision obligations (not fix obligations)

These belong to the pending revisions and their reviews; they are listed so they are not lost.

- **AS** (BP-AutomorphicSpectralTheory~2): the broad review's false suggested signatures B1 `schwartz_family_continuation`, B2 `lf_dual_continuation`, B3 `yu_149` and B4, and others of the same kind: `dit_113`, `gm_splitting`, `gz_217`, `coarse_trace_identity`, `automorphic_kernel.operator`, `yu_169`.
- **MP.0** (BP-MetaplecticAutomorphicForms--MP.0~2): the false suggested signatures in the /19–/23 regions (lines ~412–419, 489, 516, 519, 757, 799, 949, 957, 978–1000 at `bc922e658`).
- **AA** (BP-AdelicAlgebraicGroups~2): `Approximation.kneser_local` is vacuously true. Its hypothesis, applied to the counit, forces the group to be trivial. The ShimuraData D5 packet does not yet import AA.4 neatness.
- **AF, AL, GZ.0, QM**: the broad reviews' remaining items, unchanged by this round.
- **MP.8**: REV-MetaplecticAutomorphicForms--MP.8~2 reviews the revision itself.

## Sources consulted

All public; read on 8 October 2026 for the passages named. Each hash prefix is of the file obtained, and each matches the packet record where one exists.

| Source | URL | SHA-256 prefix | Passages |
|---|---|---|---|
| Knapp, Local Langlands correspondence: the archimedean case | https://www.math.stonybrook.edu/~aknapp/pdf-files/motives.pdf | 684de4bcfc50e448 | §§2–4, printed pp.399–406 (Thms 2, 5) |
| Cogdell, Piatetski-Shapiro's work on converse theorems | https://people.math.osu.edu/cogdell.1/PSCT-www.pdf | 0c922b6e6c26bc6d | §2, Thms 3.1, 3.3 |
| Cogdell, Lectures on L-functions, converse theorems, and functoriality for GL(n) | https://people.math.osu.edu/cogdell.1/fields-www.pdf | 2c5ec050a6db216d | Lectures 4–5 (Thm 4.2, Prop. 5.4), Lecture 9 Thm 9.3 pp.74–75 |
| Harder–Raghuram, arXiv:1405.6513v2 | https://arxiv.org/abs/1405.6513v2 | 1d3af2de1c1a370d | §§4.1–4.2.3, pp.23–28 |
| Milne, Introduction to Shimura varieties | https://www.jmilne.org/math/xnotes/svi.pdf | f637e61735ff9cf9 | §1, display (9), p.15 |
| Khare–Wintenberger II, author copy | https://www.math.ucla.edu/~shekhar/papers/proofs.pdf | 53f45f8be3b3c7de | §7, pp.57–66 (Lemma 7.1, Cor. 7.5) |
| Chenevier, arXiv:0809.0415v2 | https://arxiv.org/pdf/0809.0415v2 | f3c0e0d86e803301 | Definition 2.19, p.33 |
| Rapinchuk, arXiv:1207.4425 | https://arxiv.org/abs/1207.4425 | 43f6a45ceb9e51e1 | Thm 2.3, Remark 1, p.12; pp.16–17 |
| Gan–Qiu–Takeda, arXiv:1207.4709v3 | https://arxiv.org/pdf/1207.4709v3 | cde6b7ad22b974d4 | §1.7, §3.1 p.14, Thm 7.3(ii) p.34, Thm 8.1 p.35 |
| Skoruppa, arXiv:0707.0718v1 | https://arxiv.org/pdf/0707.0718v1 | a4cc378e16a7dfb3 | §4, Thm 5, p.13 |
| Arthur, An introduction to the trace formula | https://www.claymath.org/library/cw/arthur/pdf/62.pdf | 2b6623010ce5d854 | pp.34, 64–66, 102, 135 |
| Arthur, Acta 1983 | https://www.claymath.org/library/cw/arthur/pdf/15.pdf | a78240ce1095e2a1 | III §4, Thm 4.2, pp.85–86 |
| Clozel–Delorme II | https://www.numdam.org/article/ASENS_1990_4_23_2_193_0.pdf | dd70f4069fdeec6f | Thm 1, pp.194–195 |

Upstream contracts read at the explorer commit:
- `content/tau-ceti/QuadraticFormInvariants/README.md` (scope, Layer 6, 6C);
- `content/tau-ceti/GlobalQuadraticForms/README.md` (Layer 4.4, "The archimedean symbol").

## Library pins

Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. No baseline declaration citation was added or removed.

New Lean uses only pinned names whose statements were read at the pins:
- `Complex.Gammaℝ`, `Complex.Gammaℂ`, `Complex.Gammaℝ_mul_Gammaℝ_add_one` (Mathlib `Analysis/SpecialFunctions/Gamma/Deligne.lean`);
- `IsAlgClosed`;
- the AA file's own `Neat.IsFaithfulAlgebraicPointHom`.

The Tau Ceti modules inlined for the AA check were taken from commit f790474.

## Validation

- `python3 scripts/check_blueprint.py` on all thirteen packets: 0 errors, 0 warnings each. Locally there is no declaration index, so baseline names are checked for form; no baseline name changed.
- `python3 research/blueprint/intake.py check-files` on every changed file: no problems.
- Every node-id prerequisite in the thirteen packets resolves to an existing node, and every stage id to an atlas stage.
- No cycle in the node-level prerequisite graph of all packets.
- `git diff --check` is clean.
- No "sorry" in any packet text.
- `lean-check` at the Mathlib pin:

| Suggested file | Result |
|---|---|
| R17.3 (repaired) | elaborates; 26 placeholder-proof warnings, no other warnings or errors |
| R16.1 (repaired) | elaborates; 84 placeholder-proof warnings only |
| AutomorphicFormsOnReductiveGroups | elaborates; 49 placeholder-proof warnings only |
| R18.2 | elaborates; 33 placeholder-proof warnings only |
| AdelicAlgebraicGroups | elaborates once its nine Tau Ceti f790474 imports are inlined (the shared build lacks those object files); placeholder-proof warnings in the suggested part, otherwise only `@[expose]` notices from the inlined modules |

ArithmeticLocallySymmetricSpaces, IHG, AS, MP.0, MP.8, GZ.0, AL and QM suggested files were not recompiled. Their only change in this review is ALS's docstring word.

## Questions for the orchestrator

1. Four of the twelve packets sent back (R17.3, R16.1, ALS, R18.2) need reader synchronization only; their packets and suggested files are right. The list above is exact. A reader regeneration from the corrected packets may be quicker than another full fix round.
2. For AF, AL, AS, AA, GZ.0, MP.0 and QM, no finding needs another packet fix. They go live through their own revisions and reviews (`BP-…~2`, `REV-…~2`), which should inherit the reader lists above. A further FIX round for these packets would only repeat this outcome.
3. The R16.1 stage description in `data/atlas.json` still names RG2/SR/AF as "sole owners" of the Schwartz–Bruhat space (/14). RS-21's owner entry is also still uncorrected. Both are maintainer actions.
4. The IHG reader still renders the older verbatim `printed` fragments of its source issues, which the packets have since paraphrased.

## Summary

This review checked fix round 4 for red-team findings /1–/31 across thirteen packets.

For the five live packets, every change since promotion was checked; for the other eight, the fix regions. All 31 fixes are right as the packets now stand. This review made these corrections:
- a GL₃ local-factor attribution (R17.3);
- a stale archimedean gap (R16.1);
- "unipotent radical" (ALS);
- the norm-branch scope (R18.2);
- the RG2.3 reductive-model source of hyperspecial places (AF);
- a pseudo-Eisenstein contour (AS);
- a cyclic split proposal (AA);
- the real-place Hilbert symbol and Hermitian routing (MP.0);
- three source-issue paraphrases (IHG).

It also repaired 72 false-as-written declarations and 19 tests in the R17.3 and R16.1 suggested files, and false Hecke and level-map signatures in AF and AA. All of these elaborate at the pin.

IntegralHeckeAndGaloisDeterminants is accepted. The other four live packets need reader synchronization only, listed line by line. The eight never-accepted packets stay needs_changes until their own pending revisions are reviewed.
