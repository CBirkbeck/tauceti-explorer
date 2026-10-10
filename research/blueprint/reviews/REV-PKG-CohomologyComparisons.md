# Independent package review: CohomologyComparisons

**Verdict: needs_changes.** Job REV-PKG-CohomologyComparisons, issue #7923. Reviewer: Codex / GPT-6, session codex-PdlqJB, 2026-10-10. This reviewer did none of PKG-CohomologyComparisons (codex-iE4zYZ). This is a completed independent review, not a checkpoint.

The README preserves all 83 accepted targets and gives a substantial, source-specific build. The final suggested file elaborates, but it omits an entire accepted comparison and the typed interfaces and geometric tests for three constructions now owned here. One original API also loses part of its mathematical statement. These are requirements of PROTOCOL §§13 and 20, so compilation alone cannot justify acceptance.

## The six required checks

| Check | Result | Evidence |
| --- | --- | --- |
| 1. Upstream form and density | Pass | Seven ordered layers, scope, normalization conventions, explicit supplier contracts, target statements, examples, prerequisites and bibliography. README: 141,900 bytes, below 200 KB. Compared with ClassFieldTheory and the current AlgebraicVectorBundles and DifferentialGeometry roadmaps; the last two README models were read in full. |
| 2. Fidelity of the README | Pass | All 83 accepted targets occur, including the relative filtered adapter moved to 6.3. Hypotheses and boundaries were compared with the accepted packet and supplier/link contracts. The three added constructions implement the mandatory movement of higher-tier prerequisites into this owner; they do not license general Shimura geometry or a general trace roadmap here. |
| 3. Own words and source locators | Pass after correction | Read the public primary versions named in the bibliography, checking the comparisons, hypotheses and difficult interfaces at the locators below. No source passages or source-by-source section summaries occur. A normalized 20-consecutive-word comparison against all fourteen PDFs found no match; this supplements the manual reading. Added the precise logarithmic Faltings-extension locator, DLLZ Corollary 2.4.5, p.21. |
| 4. No process in the README | Pass after correction | No packet filenames, job identifiers, review/checkpoint instructions or coverage statuses. Replaced two uses of “deferred” in ownership prose with direct supplier statements. Layer identifiers and commit pins describe mathematical dependencies. |
| 5. Suggested Lean file | **Needs changes** | Final `lean-check` exits 0: 419 warnings, all declaration uses of `sorry`; no errors or other warnings. Replaced the aggregate Mathlib import with individual modules. Declaration coverage still fails R1–R3 below. |
| 6. Metadata | Pass | Exactly one line: `topic = "math.NT"`, a fitting category for the p-adic arithmetic comparisons. |

The standard nonexhaustive note is appropriate: an ordinary derived-category prototype need not encode every enhanced coherence. PROTOCOL §13 also correctly forbids inventing a `Prop := sorry` to disguise a condition that cannot be expressed. Neither provision removes the obligation to give each locally owned construction its data, API signatures and tests, or to retain the plan's named comparison. The current closing comment is honest about omissions, but is not a typed interface.

## Corrections made in this review

1. Replaced `import Mathlib` by 54 individual Mathlib imports covering the existing declarations and tactic proofs. No theorem statement or proof was changed. The revised file was compiled independently at the prescribed pins.
2. Reworded the DifferentialGeometry and integral Tate-twist supplier sentences to remove process language while keeping ownership unchanged.
3. Added DLLZ Corollary 2.4.5, p.21, both at README 6.1 and in the bibliography. Corollary 2.4.2 supplies the logarithmic Poincaré sequence; 2.4.5 identifies the first graded logarithmic Faltings extension actually displayed in this target.

## Required revisions

### R1. Give the three newly owned constructions actual signatures, API and tests

README 3.7, 6.1 and 6.2 each introduce a construction with three checks. In Suggested.lean, the following ten promised API names occur only in the closing block comment:

| Construction | Missing typed API |
| --- | --- |
| Graded Beilinson square, 3.7 | `gradedBeilinsonSquare_map`, `gradedBeilinsonSquare_zero`, `gradedBeilinsonSquare_cartesian` |
| Modular-curve logarithmic sites and period construction, 6.1 | `panLogPeriod_restrict`, `panLogPeriod_theta`, `panLogPeriod_connection`, `panLogPeriod_faltings` |
| Modular-curve affinoid-perfectoid flag basis, 6.2 | `panBasis_perfectoid`, `panBasis_inter`, `panBasis_finiteLevel` |

The mathematical constructions themselves also need types that identify their data and maps. Give the finite-weight graded square its actual four vertices and comparison maps, with the pullback property and naturality, before using it to obtain the nearby-cycle square. AMMN Theorems 6.17, 7.10 and 7.13 (pp.44–45, 52, 54) and Construction 7.12 (pp.53–54) distinguish the local finite-weight construction, the derived Frobenius fixed fibre and the filtered nearby-cycle application. A generic assumed cartesian square cannot substitute for these maps.

For the logarithmic construction, the types must carry the finite modular curve with cusp divisor, the tower/site projections, the full-kernel logarithmic period construction, its quotient, connection and first graded extension. Check DLLZ Definition 2.2.10 (p.13), Corollaries 2.4.2 and 2.4.5 (pp.20–21), and Pan II §§6.3.5–6.3.8 (pp.99–101). Completing only the coefficient kernel loses the chart variables; an ordinary derivative calculation does not test the logarithmic structure quotient or cusp residue.

For the basis, specify the fixed-tame-level genus-one tower, its Hodge–Tate map and the relevant inverse images of flag opens. State affinoid perfectoidness, finite-intersection refinement and finite-level preimage/density with their actual maps, using Scholze, *On torsion in the cohomology of locally symmetric varieties*, Theorem 3.1.2(i)–(iii), printed pp.971–972 (PDF pp.27–28). Generic rational-open intersection theory in Tau Ceti supplies part of this input, not that tower theorem.

Add at least three typed `example`s for each construction corresponding to its README checks. The existing scalar calculations in weights zero and one and the two polynomial derivative examples elaborate, but do not exercise the missing square, sheaf or perfectoid-basis definitions. Genuine geometric/enhanced supplier types may have admitted bodies with specified mathematical meaning; do not replace the interfaces by arbitrary propositions or assume their desired conclusions. This repair is more than a bounded import or citation correction and was not fabricated during review.

### R2. Restore the accepted relative filtered comparison target

`CP3.relative_filtered_prismatic_agreement` is the one accepted target with no declaration in this package. README 6.3 retains it; the suggested file's closing comment lists its omission. Excluding comments, the other 82 accepted target declaration names occur. This is a whole-target omission, not just an unexpressed coherence of a stated comparison.

Supply a typed representative that identifies the comparison map and its two realizations and retains the load-bearing conditions of Guo–Reinecke Convention 10.12, Theorem 10.13 and Remark 10.14, pp.99–100: proper smooth f over the stated smooth base; a crystalline Z_p-lisse local system and associated analytic prismatic F-crystal; a perfect prism p-completely flat over (A_inf,[p]_q); and the compatible section into A tensor over W(k) with O_K for the scalar formulation. The period filtration is I-adic and the de Rham filtration is the convolution with the Hodge filtration. The structural OB_dR formulation additionally carries the connection and explains how the auxiliary section disappears.

Keep the supplier limitation explicit: PR.7's single-base equivalence does not on its own supply the analytic F-crystal/family range used here; GR Theorem 9.15, p.92, is the relevant comparison input. A bare isomorphism of arbitrary modules, a theorem assuming the sought agreement, or an unqualified filtration-preservation claim would not repair this omission. The README already gives the necessary scope extension, so a replacement signature must express that contract rather than silently shrink the target.

### R3. Complete the relative-envelope API's diagonal self-products

The accepted `RelativeInfinitesimalSite.envelope` API and README 2.18 require both weak finality and identification of the envelope's self-products with diagonal embedding envelopes (Guo–Reinecke Lemma 10.3(i)–(ii), p.94). Suggested.lean supplies only the local lifting/cover statement and explicitly says its self-products are not stated. Thus counting all 24 original API names does not establish fidelity of their statements.

Add the typed ind-envelope diagonal/self-product identification, indexed by the number of factors and compatible with the Čech maps needed in 2.19. Preserve weak finality rather than claiming a unique map into an ambient lift or a single final thickening. The current opaque `SmoothAmbient` and `envelopeObject` interfaces do not expose the diagonal-embedding data; adding a vacuous product equality would not supply it. The repair must expose that data and its supplier contract first.

## Accepted-target coverage of the README

| Accepted group | Targets | README locations |
| --- | ---: | --- |
| CP.0 | 5 | 0.1–0.5 |
| CP.1 | 10 | 1.1–1.10 |
| CP.3 | 24 | 2.1–2.23 and 6.3 |
| CP.2 | 7 | 3.1–3.6 and 3.8 |
| CP.4 | 12 | 4.1–4.12, including the later-added proper-curve interface |
| CP.5 | 13 | 5.1–5.13 |
| CP.6 | 12 | 6.4–6.15 |
| **Total** | **83** | **86 topics including the three additional constructions** |

The 24 original API names remain in the file; R3 demonstrates why statement inspection matters. The 13 original test cases are retained among 29 examples (17 proved without admissions and 12 with admitted proofs). R1 concerns the missing tests of the three additional constructions, not proof completion of the existing geometric examples.

## Mathematical and ownership checks

The source audit checked the following load-bearing distinctions across the target ranges, rather than treating a source title as evidence of a general comparison:

- The primitive-root specialization maps and Tate signs; O_C/p versus the residue field; derived base change versus degreewise tensor; proper perfectness versus freeness; and the Frobenius pullback in the prismatic comparison. Sources: BMS1 §§4.4, 13.1–13.4 and Theorems 14.3–14.6, pp.37–44, 108–116, 119–122; Bhatt–Scholze Theorem 17.2, p.117, and Theorem 18.2, p.122.
- Full embedding-ideal completion, refinement, proper spreading, filtered de Rham comparison and the relative weakly final envelope. Sources: BMS1 Proposition 13.13, p.111, Corollary 13.19, p.114, Proposition 13.21, p.116; Guo–Reinecke Definition 10.1, Example 10.5, Lemma 10.3, Theorems 10.7/10.13 and Remark 10.14, pp.94–100; Guo Theorems 1.2.7/1.2.11, pp.5–6. No uniqueness of ambient lifts or singular extension of a smooth comparison was inferred.
- Semistable chart/log-base conditions, Frobenius and monodromy transport, the next cohomological degree's torsion-freeness, and normalized lengths. Sources: Česnavičius–Koshikawa Theorems 7.9/7.12, pp.70–71, Theorem 8.7, p.74, and Theorem 9.5, p.76. The algebraic h-descent range is distinguished from proper smooth rigid comparisons; Colmez–Nizioł II Theorems 6.2/6.4/6.8, pp.40–42, retain their respective coefficient and Hom/duality conventions.
- The untwisting convention and algebraic proper trace/cycle range in Betts–Stix Theorem 3.20 and Remark 3.21, pp.27–28; in particular the normalization is not asserted to have an already-proved canonical Fontaine identification. The Pan II §§6.3.5–6.3.9, pp.99–101, and Proposition 7.2.5, p.119, distinguish logarithmic graded sheaves, locally analytic vectors and bounded-torsion inverse limits.

Read the reviewed library audit, including AUDIT-35's direct result and review, and checked the current read-only upstream and Tau Ceti trees. Upstream HEAD checked: `dea8191cc6047d6142a65872ebce6eeeb841a29b`; current Tau Ceti: `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Searches covered the nine named post-snapshot roadmaps by period/cohomology objects as well as names. No duplicate geometric p-adic comparison was identified. AlgebraicVectorBundles supplies vector-bundle foundations, while its projective/flag and characteristic-class successors are motivation; DifferentialGeometry's de Rham theory is over the reals. Current Tau Ceti's integral Tate twists and generic rational bases are existing inputs, not targets to rebuild here. The additional geometric assertions in R1 are not consequences of those generic inputs.

The three tier moves remain appropriate: the restricted graded square moves from RefinedTraceMethods RT.3b, the modular-curve log construction from HodgeTateAndCanonicalSubgroups T6, and the genus-one flag basis from PerfectoidShimuraVarieties S3. Keep these owners and the restricted scope when repairing the typed interfaces. Existing supplier gaps documented by the accepted plan are not new rejection reasons. This review does not certify proof closure of the supplier network.

## Reproducible validation

- `lean-check research/blueprint/packages/CohomologyComparisons/Suggested.lean`: initial aggregate-import file and final individual-import file both exit 0. Final output: 419 `sorry` warnings, zero errors and zero other warnings. Compilation used the shared pinned environment, one process at a time, with available memory above 20 GB. No build, cache download, update or language server was started; no compile remains running.
- Mathlib pin: `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti pin: `f790474821cf4256814db967cb154e7af3d0c369`.
- `python3 scripts/check_blueprint.py research/blueprint/packets/CohomologyComparisons.json`: zero errors and zero warnings. The accepted input was not edited.
- Package intake path/content validation and `git diff --check` are run on the submission. These checks do not discharge R1–R3.

| Reviewed final artifact | SHA-256 |
| --- | --- |
| README.md | `623e340caa57485d7461d8ae1628aface061bce4f17dffbac46b13821214f047` |
| Suggested.lean | `fde418c279339176c64861fdb6b56962ab007e8f84b5bb34167ea39e854fd7c1` |
| metadata.toml | `d303572d699e7ef5619039e39ca2cc23feb22354dad61e5014fe05151078b2a7` |

All fourteen primary-source PDFs were read from the public versions linked in the README. Their SHA-256 hashes match the reproduction table in the package author's handoff; the twelve accepted-plan PDFs also match the packet's recorded hashes. No source file or source passage is submitted. The verdict concerns interface completeness; it does not claim any admitted comparison theorem has been formalized.
