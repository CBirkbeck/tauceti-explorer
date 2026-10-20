# BP-QSeriesPartitionsAndMockModularForms~3

Codex — codex-0bhjD9, 20 October 2026. Refs #10879.

This is the completed revision pass required by the issue's over-budget rule. The incoming packet had 537 nodes, so this pass adds none. It preserves every target id, every implementation status, the independent review object and its history. It does not certify mathematical closure or acceptance of its own changes. QM.4 remains planned; QM.0, QM.1, QM.2, QM.3, QM.5 and QM.6 remain partial. All seven layers have precise coverage and remaining-work records.

The deliverables are the packet, the complete reader, the compact suggested file and this note. No live atlas graph, supplier packet, upstream checkout or library file was edited.

## Counts and checks

| Item | Result |
| --- | ---: |
| Definitions | 113 |
| Constructions | 17 |
| Lemmas | 250 |
| Theorems | 153 |
| Comparisons | 4 |
| Total targets | 537 |
| API entries, all nodes | 792 |
| API entries on definitions/constructions | 774 |
| Unit tests, all nodes | 527 |
| Unit tests on definitions/constructions | 514 |
| Planets | 42, six per layer |
| Baseline records | 420 |
| Sources | 57 |
| Source findings | 88, with the inherited verdicts preserved |
| Remaining proof/source gaps | 19 |
| Supplier request contracts | 27 |

The 418 inherited reviewed baseline records are unchanged. The two additional pinned statements are `Complex.GammaSeq_tendsto_Gamma` and `Stirling.factorial_isEquivalent_stirling`, used as inputs to the explicit complex Stirling argument. Their complete statements were read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. Tau Ceti's baseline remains `f790474821cf4256814db967cb154e7af3d0c369`.

Validation:

- `python3 scripts/check_blueprint.py research/blueprint/packets/QSeriesPartitionsAndMockModularForms.json`: no errors or warnings.
- `lean-check research/blueprint/suggested/QSeriesPartitionsAndMockModularForms.lean`: elaborates at the pinned shared build; its only warnings are the nine admitted theorem targets.
- Reader synchronization checks: all 537 statements, every hypothesis, proof step, API statement, test statement and acceptance check are present. All 2,405 internal target/source links resolve to unique anchors. The introduction maps the nine selected Lean theorem names to their full target contracts.
- Original ids, original independent review/history and the 418 inherited baseline records are preserved; each definition/construction retains at least three tests. No excerpt field or private local path is introduced.
- `git diff --check` and the four-deliverable scope check pass.
- `python3 research/blueprint/intake.py check-files` on the four deliverables: zero problems. `python3 scripts/check_sorry_data.py` on the suggested file passes.

The checker reports 774 API items and 514 tests because it counts definitions/constructions; the larger totals above include the additional entries on other node kinds.

## Revised proof routes

Five former gap records are retained under `revision3Disposition.closedProofObligations` with their original detail and an explicit pending-review disposition. They are removed from the current gap list because the existing nodes now give the following arguments. An independent reviewer must judge these revisions; the old review verdict has not been replaced.

1. **QM.4/residue-function-modularity.** Derive the weight-(k−1) law directly from the two residue-family Jacobi laws. For rational characteristics α, β choose D with Dα, Dβ integral. Under γ write (α′, β′)=(αa+βc, αb+βd). The modular exponential simplifies to the constant phase m(α′β′−αβ); the subsequent integral elliptic shift gives m(αμ−βλ+λμ). On Γ(D²) that phase is integral. This proves a finite-index transformation law without a cusp-growth assumption or an invalid holomorphic-Jacobi carrier. The generic MP.6 service is still requested.
2. **QM.5/incomplete-gamma-mellin-poles.** Absolute Fubini gives the incomplete-beta Mellin factor. After v=u/(1−u), subtract finitely many Taylor terms of (1+v)^(k−2). This proves continuation and uniform strip bounds from an integrable remainder. Gamma recurrence gives the integer-pole residues. The equivalent hypergeometric expression follows from its Euler integral and the substitution v=(1−t)/(1+t), continued along the negative real segment. No totalized ordinary hypergeometric value at −1 or unrecorded Pfaff theorem is used.
3. **QM.5/gamma-vertical-decay.** Starting from Euler's finite-product limit and real factorial Stirling, apply Euler summation twice to obtain an analytic logarithm of Gamma in Re z>0. The periodic quadratic Bernoulli remainder gives |R₁(z)|≤(2+π)/(24|z|). Taking real parts and shifting the strip by Gamma recurrence proves a relative error O(1/|Im z|), including an eventual positive lower bound. This supplies the denominator estimate needed by the twisted-L-function quotient. An upper bound or Phragmén–Lindelöf interpolation alone would not supply it.
4. **QM.6/lattice-vertex-algebra-invariant-form.** Roitman's Proposition 2 and Theorem 1 apply to the full graded sl₂ vertex algebra with locally nilpotent L₁, without nonnegative total weights or finite total weight spaces. The functional is minus the vacuum coefficient in momentum zero, zero on other momenta; it kills L₁ of weight one. The resulting identity-invariant form pairs opposite momenta. The oscillator adjoint recursion and normalized cocycle give the pure exponential value −1, finite oscillator-block nondegeneracy and algebraic nondegeneracy. This replaces the unread Dong/FHL proof input and avoids a restricted-dual argument for infinite total weight spaces.
5. **QM.6/no-ghost-transverse-generation.** First establish the nondegenerate restricted form that the old orthogonal-splitting argument lacked. Ordered PBW and the lowest-current-degree differentiation argument of Billig's Lemmas 2–3 are rederived at zero current and mixed central charges, with K₀=λ≠0. Every positive-level vector is moved by a positive mode. The induced contravariant form is therefore nondegenerate on each level; the level-one determinant is −λ² even when the highest weight is zero. Induct on the finite-dimensional conformal grades: earlier descendants are nondegenerate, their orthogonal complement is the new highest space, and its induced module embeds. Only then split the grade. The two downstream transverse/spurious nodes now use PBW independence as well as spanning. Billig's Theorem 1 assumes a nonzero mixed central charge and is expressly not applied at zero.

The new proofs are target-level arguments inside existing nodes. They do not add intermediate lemma nodes or claim Lean implementations of the theories.

## Corrections retained in the reader

The reader was regenerated from the corrected packet, including proof sketches and uses, rather than copying stale formulas. This carries all 37 round-2 correction indices listed in `revision3Disposition.correctionAudit`. The important conventions are:

- The extended Jacobi symbol has the negative-denominator sign and exceptional zero value; the Maass seed has positive m and the corrected lower-gamma normalization.
- Regularized products use effective cosets with the recorded full-index normalization. Bol coefficients use the strict geometric cusp period.
- Appell functions have an admissible domain; totalized off-domain values assert nothing. Residues use positive pole order and a holomorphic removable extension before differentiation.
- Cosh partial fractions use the specified rectangles, finite enclosed poles, winding numbers and vanishing boundary estimates. The indefinite-theta convergence proof keeps real auxiliary Gaussian directions separate from rational lattice covectors; coincident rays give zero. The already-correct Fourier Jacobian is preserved.
- The periodic even case retains its zero-term correction. Lower-half-plane powers include the central negative-real branch. The eta/Kontsevich multiplier, smoothness argument and exact inversion factor remain explicit.
- Lawrence–Zagier uses the corrected period coefficient and lower Fourier phase. S/T generator orders do not prove finite image; the exact finite Weil comparison remains a gap.
- Vertex existence has the correct Matsuo–Nagatomo locator. Identity-invariant and Cartan-twisted forms remain distinct, with local nilpotence and preservation of the conformal vector stated where needed.
- Moonshine grading includes q^(−1); a family of automorphisms includes identity and composition laws. Character identities use finite support below each degree bound. The general Cartan-avoiding presentation ideal is not replaced by the Cartan radical.
- The J locator is Milne Theorem 4.22, p.58; the Δ(2τ) slash comparison includes its nonzero scalar. Fifth-order vectors retain their explicit characteristics, negative-cone values and component signs. The index-13 example retains its actual theta quotient, residue and coefficient completion.

The source-finding list retains its inherited independent confirmations and rejections. Source descriptions are in our own words, with locators. No source passages or section-by-section source summaries are added. The source-findings renderer also now treats a string-valued affected-target field as a string, rather than rendering its individual characters.

## Ownership and current upstream

**RT-AREA-automorphic-1/20:** generic Jacobi groups/forms, Fourier–Jacobi coefficients and theta decomposition belong to MP.6. QM.1 keeps the rank-one comparison and theta/eta/q-series applications; MP.8 specializes the generic service. The exact MP.6 request remains; an incomplete bounded adapter is not treated as its fulfillment. No reverse MP.7 dependency is used to close the QM.1 theta proof. The inherited coarse-stage cycle warning remains a maintainer integration obligation.

**RT-AREA-topology/13:** QM.5 owns the scalar quantum definition, scalar period cocycle, Kontsevich and Lawrence–Zagier analytic examples. QT.7 imports those services and owns the knot-specific statements and matrix cocycles. The generic matrix extension remains a separate Part II request; QT.7 is not a prerequisite of base QM.5. QT.4 still supplies the actual normalized WRT invariant for the analytic comparison.

Current TauCetiRoadmap `0d144d044dacebca17b654695b6f1ad58f159b27` was read without modification or build commands. IntegralLattices README Layer 6E explicitly constructs the rootless rank-24 reference row; its carrier boundary was read in Suggested.lean. Thus the old coding link's ACT-R06 unowned-Leech request is superseded for this consumer. No new Leech construction is planned. The FLM gap still requires the exact rational-to-real form-preserving comparison and the VOA/twisted-module construction.

Completed/ContourIntegration supplies the homological contour service. The complete statement of `TauCeti.Contour.classicalResidueTheorem_nullHomologous`, Cycle.lean lines 226–234, was read in current Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The finite-pole/null-homology hypotheses match the local rectangle application. This is a current upstream import, distinct from the earlier pinned baseline. The existing contour request records the contract; it is not a missing theorem to replan here.

Every link-map entry naming this roadmap was read. Current ModularForms and LieHighestWeight roadmap contracts were checked for the relevant analytic, Hecke, sl₂ and PBW services. Generic modular curves, compact-surface degree theory and Lie representation theory are imported through their exact named suppliers. This job makes no edits to those suppliers or to link maps.

## Remaining mathematical work

The packet's 19 gap records give the exact affected ids and the missing source or supplier statement. Their scope has not been weakened:

1. The eta/Dedekind Jacobi-symbol phase identity, including composite and even moduli.
2. Hickerson's seventh-order Eulerian identifications.
3. Winquist's identity and the crank 11-dissection.
4. Atkin–Swinnerton-Dyer rank dissections.
5. Choi's identity and the Bringmann–Folsom dissection of R.
6. Character and multiplier versions of the Bringmann–Rolen theorem.
7. The FLM construction, twisted module and compatible Monster action.
8. Identification of the VOA automorphism group with the presented Monster.
9. The exact Monster character-table input in the final step.
10. Conway–Norton function data and replicability.
11. The Selberg–Whiteman Dedekind-to-root-sum bridge, beyond the already planned finite phase reductions.
12. Finite Weil image and the scalar-subgroup comparison for the Lawrence–Zagier pair.
13. Alternation of the zero-mode quotient over rings with 2-torsion. The characteristic-zero argument does not discharge this target.
14. General Borcherds Serre presentation and root-pairing nondegeneracy. The restricted no-orthogonal-imaginary-root theorem does not discharge the general target.
15. Fifth-order Eulerian-series identifications.
16. Exact Weil, scalar Kohnen and shifted multivariate Poisson adapters. The torsion-specialization argument has been separated from this request.
17. Equality of the actual normalized Poincaré-sphere WRT invariant with the displayed closed form.
18. The analytic JInputs and all-index weight-zero Hecke comparisons.
19. Arithmetic containment for the moonshine-type Fuchsian groups.

The 27 supplier contracts cover metaplectic/Weil/Jacobi theory, modular-curve and line-bundle geometry, shifted Poisson, Habiro completion/evaluation/rigidity, WRT normalization, modular functions and Hecke operators, Fuchsian geometry/degree theory, sl₂ and arbitrary-dimensional PBW, and the current contour import. Their complete hypotheses and consumers remain in the packet and reader.

| Stage | Status | Follow-up beyond the existing target ledger |
| --- | --- | --- |
| QM.0 | partial | Yu's coefficientwise plethystic/Adams/cycle-index and arithmetic-integrality contracts; Liu's Appendix-B Gaussian identities and d/d-bullet normalizations |
| QM.1 | partial | Exact generic MP.6 supplier dictionary, half-weight conventions and remaining eta/source comparisons |
| QM.2 | partial | Exact Dedekind/eta phase and Selberg–Whiteman bridge, including general composite-modulus Gauss evaluations |
| QM.3 | partial | AGHMP representation/conjugation ξ normalization; Shankar vector-valued Hejhal series; Gross–Zagier weight-two Hecke-trick Poincaré/Eisenstein families |
| QM.4 | planned | Discharge its recorded Eulerian, Weil/Kohnen/Poisson and MP.6 supplier obligations; independently check the new growth-free torsion calculation |
| QM.5 | partial | Exact character/multiplier, finite Weil, WRT and dissection inputs; preserve the scalar/matrix owner split |
| QM.6 | partial | The nine moonshine/VOA/modular-function obligations above and exact suppliers; independently check the new lattice-form and no-ghost proofs |

No new routed-paper nodes were added: the issue explicitly forbids additions once the inherited packet exceeds 300 nodes. The coverage records preserve the exact paper/item worklists so a subsequent scoped pass can extend the plan without losing those targets.

## Source receipts and unavailable inputs

Three public proof sources were added, with access date, URL, SHA-256 and target-specific passages in `sources` and `sourceVersions`:

| Source | Passages read | SHA-256 |
| --- | --- | --- |
| [Brent, arXiv:1609.03682v2](https://arxiv.org/pdf/1609.03682) | §2, (5)–(12), Theorem 1, pp.3–5, remainder representation and bound | `835821fff6b3ef5634e00a1893b71763288149571ead013829f4eccc72b25abe` |
| [Billig, arXiv:math/0201314v2](https://arxiv.org/pdf/math/0201314) | §1 relations, pp.2–3; §2 PBW (2.2), Lemmas 2–3 and their proofs, pp.5–7 | `c8454e2fca2fc1d1c81fedadf113828de80d15e1a83461b4be5f7f0aa3f37a38` |
| [Roitman, arXiv:math/0210432v5](https://arxiv.org/pdf/math/0210432) | §1.2 p.2; Proposition 2 and Theorem 1 with proofs, pp.4–7; §5.2 p.9 to distinguish the radical quotient | `9776d2942de0795e5a67c634ce6e0477342dfbaabec219f323f7b696885e25a9` |

The packet also records new limited receipts for the pertinent Zwegers, Savitt, Bruinier–Ono–Rhoades, Bringmann–Rolen, Zagier, Lawrence–Zagier, Borcherds, Jurisich and Matsuo–Nagatomo passages. These are not claims of a fresh full-source verification of all inherited targets or all predecessor source inventories. Milne v1.31 Theorem 4.22 was checked in the public PDF at printed p.58; direct byte download returned 406, so no new byte-hash receipt is claimed for that source.

The cleared-library index was checked. No uncleared copy of FLM, Kac, Dong/FHL or the other book proofs named by the remaining gaps was used. No source file or extracted passage is committed. Public source statements and other authors' reviews were treated as evidence only; no suspicious embedded instruction was observed.

## Suggested file and next review

Suggested.lean is 176 lines: `import Mathlib`, seven light definitions on existing carriers, nine end-theorem signatures and thirteen proved examples, at most two per retained definition. It contains no admitted data definition, invented replacement carrier or chain of auxiliary lemmas. The complete definition/API/test ledger is retained in the reader, including the negative controls and all three-or-more test contracts for every definition/construction. Its compact form follows the current WORKERS.md shape rule, which supersedes the older issue boilerplate calling for an expanded native development.

The independent reviewer should begin with the five revised proof routes, compare their direct prerequisites and new sources, then check the packet/reader agreement and retained round-2 corrections. The 54-node unresolved ledger in the previous full review remains intact as historical evidence; this worker has neither rewritten it into an acceptance nor reviewed its own changes. Stage follow-ups should use the precise coverage and gap lists above. This run claims and submits only #10879.
