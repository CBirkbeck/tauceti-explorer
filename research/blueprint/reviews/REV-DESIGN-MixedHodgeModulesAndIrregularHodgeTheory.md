# Independent review: mixed Hodge modules, exponential mixed Hodge structures and the irregular Hodge filtration

Accepted as a complete **target-level planning pass**, after corrections made in place, with five explicit proof gaps and six supplier requests. The review does not certify any target as formalised or any recorded gap as closed.

Reviewer: Claude, session claude-LpvqSo, `independent-review-REV-DESIGN-MixedHodgeModulesAndIrregularHodgeTheory`, 2026-10-19 (issue #3570). Original author: Codex, session codex-eYL6kd (DESIGN job, issue #3448, pull request #10711, commit `c3ac8ca03`).

## Counts

All 60 nodes were checked: 20 constructions, 5 definitions and 35 theorems. No node was added or removed. 38 nodes were corrected and 22 verified unchanged apart from test-kind normalisation. There are 98 API items, 80 unit tests and 54 planets, unchanged; every definition and construction keeps at least three tests and every implementation status is `unchecked`. Baseline declarations went from 10 to 13. Requests fell from 11 to 6, and gaps rose from 4 to 5. All twelve layers remain `planned`, none closed. All 25 routed FSY items keep their targets.

## Sources

Fresh downloads of all sixteen public sources matched the packet's SHA-256 records. The Duke journal PDF (`FSY-journal`) was fetched over plain HTTP because the author site's certificate does not match its host name; its hash matches the record. Dimca was read in place in the maintainer-cleared copy. I read the FSY appendix (pp. 59–74) in full, together with the proofs it cites in KS §4.2–§4.4, ESY §1.2, §1.7 and §3.3–§3.4, Yu §1 and §4, the Matsui–Takeuchi appendix by Sabbah (pp. 36–40), Sabbah 2010 §6, and Saito 1988 §3.4. Every other node's locator was checked at its page, with Haiku retrieval agents doing the page lookup and every flag re-read at the source.

About forty locators were corrected. The main errors:

- **Labels that do not exist in FSY v5.** The packet cited Lemma A.7, Remark A.20, Proposition A.17, (A.29), Lemma A.32 and Proposition A.5. The places meant are the displays (A.7)–(A.8), Example A.20 and Proposition A.19, the displays (A.16)–(A.17), the proof of Theorem A.24(2) on p. 70, and the display (A.5).
- **KS numbering.** EMHS is KS Definition 7 (p. 31). Definition 11 is the weight filtration.
- **Page ranges.** Corrected in ESY (Theorem 3.3.1 is on p. 25, and E₁ is Remark 3.3.2), Yu (§1 is lettered (a)–(d), and Lemma 1.6 is on p. 9), MT (Lemma A.4 is on p. 39), Saito 1988 (5.1.8–5.1.10 are lemmas; §2.1–§2.2 is pp. 876–886), Saito 1990 (Remark 3.29 is on p. 313; §4.2–§4.5 is pp. 315–325), Kashiwara (§7 is pp. 355–358) and Dimca (§4.2 is pp. 103–110, Theorem 5.2.21 is on p. 139, and the Verdier-duality locators 3.2.1, 3.2.3 and 3.3.10 were added).

FSY prove two steps by citing works the packet does not list. The strict bifiltered functoriality in Proposition A.10 comes from Sabbah's *Irregular Hodge theory*, Theorems 0.2(2), 0.3(4) and 0.3(2). The filtered identifications (A.16)–(A.17) come from Sabbah–Yu (2015), Theorem 1.3(4). The plan routes around both through ESY. The review now says so at I/strict-bifiltered-realisation and P/pair-fibre.

## Mathematical corrections

1. **F/localized-fourier.** The stationary-phase step said the regular input infinity contributes slope zero at output infinity. It contributes only at output zero, where the result is regular singular. The slope-zero part at output infinity comes from the input point 0, and each input point c≠0 gives E^{ct} times a regular factor.
2. **B/regular-riemann-hilbert.** The node claimed compatibility with nearby and vanishing cycles, but its proof did not establish it. That comparison is Saito 1988, Proposition 3.4.12 (p. 924), now cited and written into H.0/v-filtration, where the plan actually uses it. Deligne's regular-singular equivalence (ComplexComparisonPartII C5/deligne-regular-singular-equivalence) is now the exact base case of the reduction.
3. **N/model-independence.** The node no longer needs weak factorization. ESY identify Yu's filtration on each good model with the Deligne filtration (Proposition 1.7.4, Corollary 1.7.6). The proof of their Theorem 3.3.1 shows that the image filtration is that of the pushforward module on the line, which is independent of the model. Yu's own route (Theorem 1.7, through weak factorization) is recorded as not used. Weak factorization is planned nowhere in the atlas, so the requested input would have stayed unowned.
4. **P/pair-fibre** now cites I/irregular-e1 directly, as the filtered pushforward input.
5. **I/strict-bifiltered-realisation.** The node now writes out why W_n∩F^λ strictness holds. F,V-bistrictness of morphisms of mixed Hodge modules makes the Deligne-filtered fibre exact. E₁ then makes F^λ_irr∘ω exact, and W-strictness handles the weight pieces.
6. **H.0/abelian-strictness.** The node now cites the pinned bigrading lemma `MixedHodgeStructure.Hom.range_inf_iSup_deligneSplittingFamily_eq_map_iSup`. With the bidegrees {p≤r, r+s≤k}, it gives the point case of simultaneous strictness. The suggested Lean file now states that milestone.
7. **Tau Ceti carrier comparison.** The Tau Ceti `MixedHodgeStructure` sits on an integral group with rational and complex models, and its morphisms are already rational-linear. H.0/mixed-hodge-module (API `MixedHodgeModule.point`), C/classical-embedding and the reader now say exactly how rational mixed Hodge structures are realised on it.
8. **Smaller fixes.** The degenerate-face test of N/newton-complex is restated (the face is the edge joining (2,0) and (0,2)). 48 unit-test kinds were mapped to the PROTOCOL §12 list (value→computation, agreement→compatibility).

I re-derived the conventions and found them right: side change F_p(M^r)=ω⊗F_{p+d}M, filtered pDR, D(pQ_X)=pQ_X(d), i*pQ_U=pQ_D[1], i!pQ_U=pQ_D(−1)[−1], the Fourier kernel E^{tτ} with t=−∂_τ and ∂_t=τ, ∂_x−x⁻² at infinity, and the Π, K and EMHS weight statements. I also checked every worked example, including the torus sums, the tg zero-locus cases, the Newton volumes and the costalk-versus-stalk tests.

## Supplier citations

A Sonnet cross-check of all 59 (node, external prerequisite) pairs, re-read by me, found that several stage citations named the wrong owner:

- **SchemeAndStackFoundations SF.0 and SF.4.** These plan no analytification, no Whitney stratification, no Hironaka resolution and no weak factorization. SchemeAndStackFoundations is also merged upstream now.
- **Replacements by exact nodes.** Resolution, principalization and SNC compactification are now AlgebraicModuliForArithmeticGeometry `R09.7/embedded-resolution`, `/principalization` and `/snc-compactification`. Lefschetz pencils are `LefschetzPencilsAndVanishingCycles:LPV.3/existence-of-lefschetz-pencils`. Monodromy-filtration linear algebra is LPV.1 (`monodromy-filtration`, `relative-monodromy-uniqueness`, `primitive-decomposition-and-strictness`), which HodgeStructuresPartII itself imports.
- **SF.2 and SF.3.** These already contain what their requests asked for. The packet now cites `SF.2/serre-proper`, `/tor-independent-base-change`, `/derived-pullback-pushforward-qcoh`, `/cech-to-cohomology`, `/projective-space-cohomology`, `SF.3/nonsingular-projective-model` and `/vector-bundle-riemann-roch`. The formal carriers of layer D are Mathlib's `LaurentSeries` and `PowerSeries`, and place expansions are AlgebraicCurves Layer 9.
- **EnhancedDerivedSheaves E1.** Its four ringed-topos nodes supply the derived categories of sheaves on X_an with constant coefficients, so that request was dropped.
- **HodgeStructuresPartII.** Its exact H.0 Rees nodes and H.2 nodes (graded-polarizable, admissible-variation, canonical-extension, limit-mhs, residue-monodromy, mixed-fixed-part) now cover the old H.0 and H.2 requests. The A¹ fixed-part theorem follows from `H.2/mixed-fixed-part` together with strictness. The residue sign conversion N=−Res is now done at H.1/hodge-cycles.
- **Analytification** is cited at `ComplexComparisonPartII:C0/repair-analytification`, which points to the upstream CohomologicalPointCounting/ComplexComparison carrier (TauCetiRoadmap pull request 196).
- **Unused prerequisites removed.** NT.0 from N/filtered-blowup, SF.4 from N/constant-gauss-manin-cone, and SF.3 from N/filtered-kunneth-duality.

Remaining requests:

- HodgeStructuresPartII H.6: the rational-polarization form of the one-variable nilpotent-orbit theorem and norm estimates.
- AnalyticToricGeometry Layer 0: normal fans and refinements.
- AnalyticToricGeometryPartII NT.0: the rounded Newton-divisor vanishing.
- Springer H/regular-holonomic: b-functions and specializability.
- AlgebraicModuli R09.7: the projective-bundle structure of exceptional divisors.
- AlgebraicCurves Layer 9: existing place expansions; no addition is asked for.

**New gap G5.** No atlas packet or upstream roadmap plans algebraic Whitney stratifications with stratified local triviality for complex algebraic maps. B/constructible-six-operations and B/middle-perverse need it. The upstream ComplexComparison proposal supplies triangulations compatible with a stratification, but not the relative triviality of a map. G2's detail now names all four twistor results the proof of Sabbah 2010, Proposition 6.10, invokes.

## Baseline

All ten declarations exist at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` under their names and in their modules, and all are in the declaration index. Three `provides` texts were wrong and are corrected:

- `tate` is ℤ(m) on ℤ, not Q(m).
- `HodgeStructureOn` imposes no finiteness.
- `MixedHodgeStructure` lives on an integral group with rational and complex models.

Added: the Tau Ceti bigrading-strictness lemma above, and Mathlib `LaurentSeries` and `PowerSeries`. None of the planned nodes exists in the pinned libraries; the Tau Ceti tree has no variations, local systems, perverse sheaves or D-modules.

## Source findings

- **E1, misprint.** FSY print the left-to-right side change as ω⊗F_{•−dim X}M. Confirmed on the rendered journal p. 1726 and arXiv p. 61; Saito's introduction gives F_{p+n}.
- **E2, misprint.** FSY print D(pQ_U) as pQ_U(−d). Confirmed on journal p. 1727; the twist must be (d).
- **E5, error in KS's proof of Proposition 3.** The proof gives the wrong ambient weights and the wrong direction for Π(F). Confirmed: δ₀ is a subobject of K=Πδ₀, and the constant quotient has weight 1.
- **E6, error in Yu.** Yu claims that a convenient polynomial is proper. Confirmed, but `affects` is changed from "the proof" to "nothing", since only the exhaustiveness of the filtration is used afterwards.
- **E3 and E4.** These duplicate PAPER-FRESAN-SABBAH-YU-22/E6 and E7, which the paper extraction's review already confirmed. They are now listed in `inheritedSourceIssues` instead of being recorded twice.

I found no further mistakes beyond these. FSY's "[36, Prop. 4.3]" is KS Proposition 4 in the preprint numbering; I did not record it, because the published numbering could not be checked.

## Ownership and upstream

TauCetiRoadmap main (69bd802a) has no Hodge-module, EMHS or irregular-Hodge roadmap. Two overlaps are recorded in `restructure`:

- **FormalConnectionsOpers** (open TauCetiRoadmap pull request 1056, F6) plans the formal normal form of differential modules over ℂ((t)). Layer D should import it once the pull request merges.
- **Regular holonomic Riemann–Hilbert.** SheafConvolutionOnAbelianVarieties request R8 asks ComplexComparisonPartII:C5 for regular holonomic Riemann–Hilbert, which this roadmap plans at B/regular-riemann-hilbert. The proposal makes B the single owner and redirects R8 to it.

The SchemeAndStackFoundations rescope (a proposed Part II for weak factorization) is withdrawn, because weak factorization is not needed.

## Files and checks

- **Packet.** `python3 scripts/check_blueprint.py` with the real declaration index reports 0 errors and 0 warnings. A cycle check over all research packets finds no strongly connected component containing a node of this roadmap.
- **Roadmap definition.** Stage `requires` now list stage ids and the new suppliers; Springer node ids are no longer used there.
- **Reader.** It is generated from the packet. A renderer that reproduces every generated block of the original reader byte for byte from the original packet re-rendered it from the corrected packet. The introductory conventions, baseline paragraph, Lean-file note and source-corrections introduction were edited by hand to match.
- **Suggested Lean file.** It gained the point-level W_k∩F^p strictness theorem, now 111 lines. `lean-check` elaborates it at the pinned shared build with 13 warnings, every one a placeholder proof. `check_sorry_data.py` passes.

## Questions for the orchestrator

1. G5 needs an owner for Verdier's stratification theorem, or Hardt triviality, for complex algebraic maps. It could be this layer B, or a semialgebraic-topology roadmap shared with AlgebraicTopologyPartII and the upstream ComplexComparison proposal.
2. When TauCetiRoadmap pull request 1056 merges, layer D should be narrowed as recorded.
3. SheafConvolutionOnAbelianVarieties R8 should be redirected to B/regular-riemann-hilbert.
