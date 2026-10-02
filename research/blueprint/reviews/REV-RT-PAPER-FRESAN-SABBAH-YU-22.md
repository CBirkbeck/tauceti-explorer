# Independent verification of the Fresán–Sabbah–Yu red team

Codex — `codex-5ebb6f`, 2 October 2026. Refs #4183.

All **55 findings are confirmed**: 7 high, 29 medium and 19 low. Several proposed fixes need qualification; the machine-readable [55 verdicts](../redteam/RT-PAPER-FRESAN-SABBAH-YU-22.review.json) contain the correction for each finding. Confirmation means that I would correct the extraction or record the missing input. It does not certify every suggested replacement proof or declare the paper's conclusions false.

I did not author the paper extraction, its independent review, or this red team. The extraction and completion identify Claude sessions cc-7b31c4/cc-442dc5, the independent review cc-fb70e5, and the red team cc-c2c06b. The shared GitHub account is not the worker identity. My previous verification of the separate Landesman–Litt red team does not make me an author of its paper extraction; I use that extraction here only to inspect a competing proposed foundation.

## Sources and scope

The primary text is [arXiv:1810.06454v5](https://arxiv.org/abs/1810.06454v5), dated 13 June 2022 and labelled final published version, using the [74-page v5 PDF](https://arxiv.org/pdf/1810.06454v5). Its SHA-256 is `835580aa6314798e2866c248d6f7179379698d61a7baae0136806d4755b1f20a`, matching the extraction's PDF. Every page number below is this PDF's page number. I did not inspect the separately typeset 99-page Duke publication.

I read the source statements and surrounding arguments at the findings' locators, the extraction's 92 items, six routes and 36 prerequisites, its recorded source issues and relevant reader/review passages, and every red-team finding. In particular I inspected the defining setup on pp. 3–9, the D-module and motive constructions in §§2–3, the local/Hodge calculations in §4, the local arithmetic and automorphy arguments on pp. 39–59, and the appendix statements on pp. 60–72. I also checked page images for pp. 5, 8, 28, 35, 50 and 63, where extension symbols, shifts and local-model exponents are decisive. This is a locator-driven verification, not a claim to have re-proved every result or read every cited monograph.

Additional public primary texts consulted:

- [Mochizuki, arXiv:1501.04146](https://arxiv.org/abs/1501.04146), Definition 2.6, Remarks 2.7–2.8 and §2.2.2, for the condition near the poles. Downloaded PDF SHA-256: `944dd74d087724c5dc638661509e3dc3a56085809b4fda9555e9dbea62191690`.
- [Patrikis–Taylor, arXiv:1307.1640](https://arxiv.org/abs/1307.1640), opening compatible-system definition and Corollary 2.2, for continuity, semisimplicity and the strict-purity/functional-equation conclusion. PDF SHA-256: `518b7b1c5dd353eceb645066d9749f25aa638536537ea776d94876501ead1f0a`.
- [Evans, Seventh power moments of Kloosterman sums](https://mathweb.ucsd.edu/~revans/seventh2010.pdf), abstract, for level 525 and character conductor 105.
- [Haessig's 2020 source](https://arxiv.org/abs/2012.00570) and the [unrelated physics paper at the erroneous identifier](https://arxiv.org/abs/1607.06821), for the citation/link discrepancy.

The library baseline is [Mathlib 082e2d3](https://github.com/leanprover-community/mathlib4/tree/082e2d37e8b0463410cdb532e111cd43d5a66174) and [Tau Ceti f790474](https://github.com/TauCetiProject/TauCeti/tree/f790474821cf4256814db967cb154e7af3d0c369). I read the actual `Gammaℝ`, `Gammaℂ`, gamma duplication and `jacobiSym` declarations and the `TauCeti.Toric.Fan` and `Fan.IsRegular` statements. Declaration-index searches did not find a D-module carrier, toric-variety construction or the required symmetric-power irreducibility theorem. Such negative searches support bounded absence claims, not a claim that no related algebra exists.

Ownership checks use this repository at `21a789c`, the assembled 2,956-stage atlas, its actual directed edges and current supplier packets. These include DWP, EDC, LPV, RD, FF, MC.5, ML, R06, R24, R19, ET.6, G7 and PS; Tau Ceti's AnalyticToricGeometry, Chebotarev, QuadraticFormInvariants and representation-theory roadmaps; and the Breuil–Hellmann–Schraen, Landesman–Litt, Qian and Xu–Zhu route briefs. Proposed and packet-planned mathematics is kept distinct from declarations already in the pinned libraries.

## Corrections to the most consequential proposed fixes

**Findings 1–3: ownership and closure.** Lemma 5.40 needs epsilon factors as well as the Weil–Deligne carrier. Assigning it wholesale to R01.2 creates a cycle because ET.6 is downstream. A current shorter path is R01.2 → DWP.4 → AG2.1a → ET.6; the red team's longer path also explains the dependency. Move the lemma to a consumer or an appropriately linked PS.1 source extension. The five rigid-route items need to be split into general suppliers and Kloosterman applications. The generic D-module foundation must also be coordinated with the already accepted Breuil–Hellmann–Schraen route.

**Finding 4: a genuinely false unqualified weight statement.** For a split nodal proper rational curve, the normalization sequence

```text
0 → Q_X → ν_*Q_P¹ → Q_node → 0
```

has zero global branch-difference map Q → Q. Consequently H¹(X,Q) is weight zero, although the claimed general lower bound would require weight at least one. Smoothness and lissity are essential to the ordinary lower bound. The compact-support upper bound has a broader valid scope and should be stated separately.

**Finding 7: thickness and the unverified repair.** In the odd case p. 41 gives the critical value c=2ap; p. 45 gives c=2bp in the even case. With π=√(-p), its valuation is 2e, where e=1+v_p(a) or 1+v_p(b). At k=9, p=3, a=3, the formal Morse normal form has c=18=2π⁴. The π-chart of one blow-up has strict transform Q(z')−uπ², with a quadratic-cone special fiber and a singular vertex. This contradicts the p. 50 claim that every relevant original singularity has thickness two and one blow-up gives the needed semistable model.

This confirms a gap in the proof used for Proposition 5.23 and Corollary 5.27 at these small primes. It does not establish that their conclusions are false. I did not obtain and audit Mieda's original theorem; iterated blow-ups and their comparison hypotheses remain to be checked. Remark 5.41 may provide a separate route to a representation-theoretic conclusion once its inputs are available, but does not by itself prove the missing rigid-to-de Rham comparison or Newton inequality. Do not describe the gap as having reach “nothing.” The even-k assertion at p=2 must also retain its separate limitation.

**Findings 19, 21–22 and 28–29: reuse with exact scope.** Laumon's Fourier source is already registered in FF: request its missing convolution theorem there instead of registering a duplicate paper. The sl₂ symmetric-power construction is explicitly planned in Tau Ceti's LieHighestWeight Layer 0; ClassicalGroups and SchurWeyl supply the general highest-weight/Schur framework. Add the required missing adapters and symplectic identification without rebuilding that framework. MC.5's category does not automatically provide the required weight filtration. AnalyticToricGeometry supplies shared fan/complex geometry, but its analytic compactness theorem is not algebraic properness over Q or Z. Finally, the existing RD Gysin and weight nodes retain lift-coordinate and ι-realizability hypotheses; the application must supply or extend them.

**Finding 26: the original definition resolves the ambiguity.** Mochizuki's Definition 2.6 places its non-degeneracy requirement in a neighborhood of the pole divisor. It does not prohibit interior critical points or impose a pole normal form on a holomorphic zero boundary. Correct the paper's all-X paraphrase and the exponent dimension. New source issues for this and finding 7 need distinct IDs; both findings proposed E8.

**Findings 51, 54–55: do not enlarge the correction silently.** The local gluing formula using N is the unipotent sector of a fuller monodromy quiver. R19.3 is now an eigenform-family consumer: generic compatibility belongs to R24.5:operations, alongside the separate p-adic Weil–Deligne supplier R06.3. The final polygon-proof lead needs its lost middle slopes and additional R_k factors accounted for by an actual inequality. Symmetry alone is a proposed repair, not an independently verified proof. The determinant's quadratic factor can be locally trivial and must be distinguished from the full determinant's unramified twist.

## Finding coverage

All entries below have an individual reason in the JSON; the grouping does not combine or omit finding IDs.

| Findings | Independently checked issue | Verdict |
|---|---|---|
| 1–3 | epsilon dependency cycle, rigid applications, duplicate D-module foundation | confirmed |
| 4–7 | missing smoothness, wrong extension, semisimple systems, local-model thickness | confirmed |
| 8–15 | classical/étale distinctions, shared VHS, automorphy split, general suppliers and wrong stages | confirmed |
| 16–17 | incorrect/duplicate citations, missing proof sources and existing covered sources | confirmed |
| 18–23 | FF imports, two stationary-phase inputs, Fourier convolution, representation theory, Nori weights, missing definitions | confirmed |
| 24–30 | projector image, étale GOS, pole definition, formal transform, toric scope, rigid inputs, nonclosed forms | confirmed |
| 31–36 | known archimedean sign, perverse shift, supports cohomology, filtered comparison, epsilon reciprocity, Chebotarev recognition | confirmed |
| 37–40 | supplier attribution, unused zeta citation, named dependency contracts, stale reader | confirmed |
| 41–44 | source coefficient/degree/level errors and actual statement locators | confirmed |
| 45–50 | proof notes, undefined m, conjecture sources, degenerate acceptance case, basis symbols, omitted vanishing-cycle data | confirmed |
| 51–55 | local gluing, localization scope, ML source relationship, p-adic compatibility imports, final source-proof leads | confirmed |

Fixers should consolidate overlapping actions while retaining traceability to each finding. In particular bibliography, theorem-input and reader edits overlap; they should produce one coherent corrected result rather than mechanically appending duplicate prerequisites or source issues. Existing Tau Ceti roadmaps remain suppliers; missing upstream scope becomes a request or note under the programme's rules.

## Validation and limits

The two deliverables pass `scripts/check_redteam.py` and `research/blueprint/intake.py check-files`. A separate comparison verifies all 55 input finding IDs occur exactly once and in the input order; the staged diff passes `git diff --cached --check` and contains only this issue's two authorized files.

No Lean file is a deliverable, and no Lean compilation, Lake project, library build or language server was started. This review verifies source/plan discrepancies and the required corrective scope. It does not formalize the paper, certify the unexamined proofs of every external source, or supply the unresolved small-prime resolution and polygon arguments.
