# REV-AInfCohomology

**Verdict: accepted after correction.** Codex, session `codex-T6I7bf`, 13 October 2026. Refs #9377. This session did not write BP-AInfCohomology or either imported part.

Reviewed the [whole-roadmap packet](../packets/AInfCohomology.json), [reader](../readmes/AInfCohomology.md) and [suggested Lean file](../suggested/AInfCohomology.lean). The packet now records one verdict for every assembled target: **151 verified, 75 corrected, zero added and zero unverifiable**. All **59 baseline declarations** are confirmed; none was removed or replaced. Acceptance concerns the complete target-level planning pass. All ten stages remain **planned**, none **closed**, with **25 supplier requests and 17 explicit gaps**. Implementation statuses remain `unchecked`.

## Inventory and assembly

The inventory is 226 targets: 197 imported from accepted parts and 29 in the main packet. There are seven definitions, 48 constructions, 45 lemmas, 28 comparisons, five applications and 93 theorems; 249 API items, 190 definition tests and 44 planets.

| Stage | Targets | Planets | Review |
| --- | ---: | ---: | --- |
| AI.0 | 18 | 3 | planned targets checked |
| AI.0:integral | 6 | 2 | planned targets checked |
| AI.0:period-comparison | 2 | 1 | planned targets checked |
| AI.1 | 44 | 6 | planned targets checked |
| AI.2 | 24 | 6 | planned targets checked |
| AI.3 | 17 | 5 | planned targets checked |
| AI.4 | 18 | 5 | planned targets checked |
| AI.5 | 16 | 4 | planned targets checked |
| AI.6 | 55 | 6 | planned targets checked |
| AI.7 | 26 | 6 | planned targets checked |

Both accepted part files remain byte-for-byte unchanged, with the hashes in `assembly.imports` confirmed. Import those historical nodes, apply `assembly.importedNodeCorrections[id].fields` as authoritative field replacements, and replace their prerequisites with `assembly.importedPrerequisites[id]`. Coverage, `review.checked` and the reader describe this effective union. The ineffective historical substring rules have been removed; `importedTextReplacements` is empty. Ownership prose now has explicit field overrides.

The 75 corrected targets comprise 65 imported targets and ten main-packet targets. Sixty imported targets had historical Lean metadata that did not describe the current compact suggested file. Five further imported targets needed source or API corrections. Some of those sixty also received mathematical, API or ownership corrections described below. The per-target review notes and override reasons record these changes individually. No extra target is needed for the corrections.

## Corrections

| Target or field | Correction and reason |
| --- | --- |
| AI.0/local-power-series-flatness | Restored the noetherian source and p-adic completeness and p-torsion-freeness hypotheses in BMS1 Remark 4.31, v3 printed p.43. The cyclotomic specialization satisfies them; the general criterion previously omitted them. |
| AI.0/theta-witt-family | Added BMS1 Lemma 3.9(v), v3 pp.21–22, for the surjectivity assertion, rather than relying only on construction and kernel locators. |
| AI.1/bockstein-map-surjectivity | The relevant proof of BMS1 Proposition 6.12 is on v3 p.53, not p.52. |
| AI.4/fv-precomplex API | Reindexed the Teichmüller F–d relation from level r+1 to level r for r≥1. This avoids an undefined length-zero object and agrees with BMS1 Definition 10.5, v3 p.81. |
| AI.4/relative-witt-comparison | BMS1 Proposition 11.17, v3 p.95, uses restriction W_(r+s)(O_C)→W_r(O_C), the φ^s scalar identification, and the quotient by V^rW_s. It does not assert the former W_r(O_C)/p^s reduction. Added the proof route through Lemmas 9.18 and 3.13 and retained the Breuil–Kisin twist. |
| AI.4/mu-inverted-etale | Cited the local Theorem 14.1(iv) and Remark 14.2, v3 p.118, with Definition 9.1, p.69. The later proper theorem was not the locator for the statement already given. |
| AI.7/cohomology API | Retained the affine or qcqs hypothesis for the global Frobenius linearization after E-inversion, already present in the statement. The sheaf Frobenius does not by itself justify arbitrary global scalar interchange. |
| AI.6/nodal-conic and G-11 | Replaced the purported two-chart cohomology argument by the normalization exact sequence for the two special-fibre components, Serre duality and cohomology/base change. These remain explicit unsupplied inputs; the calculation O_K,0,O_K and N=0 is unchanged. |
| AI.0:period-comparison/bdr-finite-level-compatibility; AI.6/bdr-tate-thickenings; AI.6/canonical-bdr-deformation | Corrected the beginning of CK §§6.1–6.2 to v3 printed p.60. |
| AI.6/bdr-envelope-contraction | Required sufficiently large coordinate sets for the equivalence in BMS1 Lemma 13.13, v3 pp.111–112, alongside Lemma 13.12. An arbitrary undersized embedding does not satisfy the claimed independence. |
| AI.6/bdr-infinitesimal-envelope | The acceptance clause now names bdr-envelope-contraction as the embedding-independence input, matching the reader and proof order. |
| AI.6/canonical-bdr-etale-comparison | Synchronized the final remaining map-agreement clause between packet and reader and named its comparison-assembly owner, CohomologyComparisons. No prerequisite on that higher roadmap was introduced. |
| AI.7/absolute-perfectoid-trace-coefficients | Made the normalized coefficient formula a compatible choice of kernel and graded generators, as in BMS2 Proposition 6.2, journal pp.243–244. It cannot be asserted for an arbitrary previously fixed generator ξ. |
| AI.7/qrsp-trace-unfolding | Added BMS2 Construction 7.7 and Proposition 7.9, journal p.257, for the actual π₀TC⁻ map and its de Rham compatibility; corrected Theorems 7.1–7.2 to p.254. |
| AI.7/absolute-trace-aomega-comparison | Replaced Hodge–Tate detection by the source's mod-ξ de Rham comparison, Claim 9.7 modulo (p,ξ) and Lemma 9.9 Bockstein identification, BMS2 journal pp.287–289. |
| Eleven imported AI.6/AI.7 targets | Replaced stale CP.3 and RT.6 references in statements and proof routes by the moved AI.6 canonical deformation and AI.7 relative trace targets. Corrected the resulting grammar. The definitive dependency lists already used those lower owners. |
| Sixty imported Lean metadata records | Marked the geometric and enhanced targets `readme-only`; marked AI.7/coefficient-normalization `partial` for its actual coefficient formulas. Historical part prototypes do not describe the 164-line whole-roadmap file. No mathematical target or test was deleted. |
| Source findings and version metadata | Rephrased source wording in original prose, retained earlier review provenance, installed this review's independent verdicts, and added E8–E11. Corrected four incomplete version records to carry valid edition kinds and reading dates, retaining their scope. |
| Reader and library-audit metadata | Synchronized every corrected statement, hypothesis, proof, source locator, API and acceptance clause; documented authoritative assembly overrides and current upstream scope checks. |

## Sources, baseline and libraries

Read every target's cited assertions and relevant proof passages, comparing exact hypotheses, conventions, `match`, prerequisites, APIs and tests. This was a reading of the required locators, not an exhaustive reading of every source. All prose in the deliverables is original; no source excerpt or section-by-section source summary was added. Public URLs, editions and available PDF digests remain in the packet. Cleared local editions were read in place, without copying their files or passages. BLM findings remain restricted to the December 2019 author copy; they make no claim about an inaccessible published interior.

The source checks include BMS1 coefficient, décalage, module, sheaf, local/proper and canonical deformation assertions; BMS2 filtered décalage and the absolute/relative trace comparisons; CK's semistable charts, all-coordinate constructions, comparison maps, torsion bounds and lattice results; Scholze's corrected pro-étale site and primitive comparison; SW's analytic reconstruction; Zavyalov's flatness result; the Anschütz–Le Bras minuscule dictionary and its erratum; the BLM completion, fixed-point and saturated-complex interfaces; and BS22's prismatic comparisons, Nygaard/Frobenius and uniqueness assertions. Exact theorem, section and page references are retained per target. Stacks Tags 077J, 091N, 03EW and 06XX were read where used as flatness, completion and coherent-cohomology leads.

All 59 baseline entries are Mathlib declarations, independently read at **082e2d37e8b0463410cdb532e111cd43d5a66174**. The historical Tau Ceti baseline remains **f790474821cf4256814db967cb154e7af3d0c369**. Existing Witt, PreTilt, Fontaine theta, BDeRham, completion, module, complex, tensor and polynomial carriers are reused. Root-namespace names and generated completeness instances were checked under their actual declarations. Ordinary derived categories do not provide coherent enhancements; TopModuleCat's N-indexed continuous cochains do not provide the requested completed Z-indexed comparison; BDeRham's carrier does not supply a DVR or topology theorem. Those distinctions remain explicit requests.

The aggregate library register has no AInf entry. Read the accepted AUDIT-35 entry and REV-AUDIT-35 report instead. Current upstream reuse was checked at TauCetiRoadmap **0d144d044dacebca17b654695b6f1ad58f159b27**, Tau Ceti **a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039**, and its Mathlib **6b7abb3c7686292736be2955bd3eb9ebf63b456a**. Inspected the scopes and Suggested inventories of the nine newer roadmap families and four Completed roadmaps named by WORKERS. Read the relevant AdicSpaces/AlgebraicVectorBundles interfaces and current Fargues–Fontaine Y, Window and Quotient declarations. No additional overlapping target was found.

Current Tau Ceti distinguishes the interior D(p)∩D([ϖ]) from the analytic locus D(p)∪D([ϖ]). Its locus equalities, radius windows and quotient are reused. SW's endpoint neighborhoods, interval section rings, stalks and analytic extension theorem remain the precise lower-owner extension in G-04/REQ-13–14. Scheme/QCoh vector-bundle operations do not supply that analytic theorem. The topology bridge retains its cofinality hypotheses and supplies no automatic ξ-adic or derived-completion equivalence.

## Source findings

All **21 inherited findings** were independently confirmed at their edition-specific locators and now name this reviewer; earlier verdicts remain in `reviewHistory`. The packet has **25 findings**: one error, 21 misprints and three proof gaps. The descriptions and corrections use original prose. Added four confirmed entries:

| Entry | Checked correction |
| --- | --- |
| E8 | BMS2 Definition 5.1, journal p.233/v2 p.28: a decreasing filtration has gr^i=cofib(F(i+1)→F(i)). Already recorded in the DD/prismatic source work. |
| E9 | BMS2 Corollary 5.10 proof, journal pp.239–240/v2 p.33: the third functor recovers the underlying object by the negative-infinity colimit. The positive-infinity limit vanishes for a nonzero complete step filtration. The recorded version/publisher/author searches found no separate correction; novelty is not established. |
| E10 | BS22 v4 Corollary 15.5, p.104: V_i runs from H^i(Δ)⊗I^i to H^i(Δ^(1)), inverse to Frobenius up to I^i. Already corrected in the PR.3 supplier and paper extraction. |
| E11 | BS22 v4 Corollary 15.4, p.104: the de Rham complex is the sheaf complex of X; R is not declared for a general formal scheme. Already recorded in the PR.3 supplier and paper extraction. |

## Closure, APIs and assigned findings

Read the actual supplier statements and all 25 extension contracts. The effective graph has 97 distinct external prerequisite references, with no internal cycle or dependency on the higher CP.3/RT.6 owners. Some suppliers still need their named Part II contract or an accepted plan; their present statements are not treated as containing the extensions. Every construction/definition has at least three tests that distinguish plausible errors, such as a wrong scalar twist, completion, degree, root normalization, coordinate ideal or specialization. All 249 API items and 190 tests were checked. Planets select source-named definitions and central results; every normal layer has at most six, and the three AI.0 entries have six in total.

| Assigned finding | Outcome |
| --- | --- |
| RT-AREA-padic-1/19 | AI.2 distinguishes BMS1 full faithfulness from SW essential surjectivity and retains the analytic endpoint reconstruction gap; it does not obtain classification by a return path through RF4. |
| RT-AREA-padic-2/1 | Generic integral coefficients and AI.2 module/classification inputs precede their rational and relative consumers. Existing period carriers are reused with explicit missing structure. |
| RT-AREA-padic-2/3 | Proper étale finiteness and primitive integral comparison are the early P8 child in REQ-05/G-07. Local rational period acyclicity does not supply them. The local AI.4 comparison now has its direct source locator. |
| RT-AREA-padic-2/9 | AI.3 distinguishes ordinary Witt coefficients from derived p-completion, using the corrected site; the two explicit sheaf targets and their comparison preserve the distinction. |
| RT-AREA-padic-2/10 | Integral AI.3 construction does not depend on P8 rational B_dR acyclicity. Later proper and rational consumers have their own explicit inputs. |
| RT-AREA-padic-2/11 | BMS1 Proposition 13.21 over nonnoetherian A_crys remains the early CR.3 extension in REQ-12/G-08. The current Noetherian-base theorem cannot establish it. |
| RT-AREA-padic-2/13 | Ten canonical deformation targets now belong to AI.6 before its semistable map consumers. CP.3 imports this prefix; it is not a dependency of AInf. |
| RT-AREA-padic-2/15 | Commuting-endomorphism Koszul and completed cochain inputs remain the generic DD.1 contract, with signs and limit hypotheses retained. Scalar décalage does not silently supply the general version. |
| RT-AREA-padic-2/17 | Existing Fontaine/Witt/PreTilt carriers are cited under their pinned names. The primitive kernel and comparison structure are separate source-supported targets or requests. |

The remaining gaps concern enhancement and completed cochains, minuscule windows, analytic reconstruction, comparison-map agreement, integral descent proof refinements, primitive proper comparison, the nonnoetherian crystalline bridge, valuation-ring GAGA/coherent finiteness, external log/curve inputs, relative trace foundations, smooth spreading, period topology and normalized valuation lengths. Each names its needed targets and required mathematics. These gaps prevent closure without contradicting the source-supported plan.

## Validation and orchestration

- `python3 scripts/check_blueprint.py research/blueprint/packets/AInfCohomology.json`: **0 errors, 0 warnings** with the declaration index. The stock checker sees the main packet's 29 nodes; it does not certify assembly overlays.
- Separate effective-assembly audit: both part hashes and accepted verdicts match; the imported inventory and coverage equal the 226-target union; every target has one review verdict; effective prerequisites form an acyclic graph; statements, hypotheses, proof routes, locators, API/test names and statements, and acceptance clauses match the reader. Definition/test counts and all planet caps pass.
- Source-finding schema and edition checks through `source_issues.check_issues` and `check_errata.versions_checked`: **no errors**. The standalone errata CLI expects an `errata-v1` file, so it is not the validator for this `blueprint-v1` packet.
- `lean-check research/blueprint/suggested/AInfCohomology.lean`: **exit 0, 16 warnings, all declaration uses sorry**. The unchanged 164-line file has ten light real definitions, nine theorem statements and seven examples. It imports Mathlib only and elaborates at the pinned Mathlib; it contains no sorry'd data definition. Its coefficient signatures do not implement the reader's geometric or spectral theory.
- Final JSON, allowed-file and whitespace checks passed. No local paths or source passages were added.

No clarification is needed for this acceptance. The package worker must use the effective union and authoritative overrides, not concatenate the historical parts. The orchestrator should redirect the CP.3, RT.6, CP.0 and CP.5 consumers recorded in `assembly.moves`, retain the exact Part II supplier contracts and open map-agreement gaps, and incorporate the already accepted AUDIT-35 AInf audit into the aggregate register. No other owner's files or atlas data were changed.
