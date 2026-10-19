# REV-LogicAndDefinabilityInNumberTheory

**Accepted after correction.** Independent reviewer: Codex, session `codex-Cxzk98`, 19 October 2026. Refs #540. This session did not write BP-LogicAndDefinabilityInNumberTheory.

Reviewed the [packet](../packets/LogicAndDefinabilityInNumberTheory.json), [reader](../readmes/LogicAndDefinabilityInNumberTheory.md) and [suggested Lean file](../suggested/LogicAndDefinabilityInNumberTheory.lean). Read all 130 incoming targets and their cited assertions, relevant proof passages and supplier contracts. The resulting packet has **127 nodes: 95 verified, 32 corrected, none added or unverifiable**. Three routine bridge lemmas were absorbed into parent APIs. There are **60 confirmed baseline declarations, 165 API items, 154 discriminating tests and 31 planets**. All seven stages remain **planned**, none closed; **21 explicit gaps and nine supplier requests** retain the proof and implementation boundaries. Every implementation status remains `unchecked`.

## Mathematical and dependency corrections

| Targets | Correction |
| --- | --- |
| LD.0/fraction-interpretation | Restricted the denominator-two example to ℤ or the explicit condition 2≠0, and added native `IsFractionRing`. |
| LD.0/arithmetic-ultrapower | Made the nonprincipal ultrafilter and semiring arithmetic signature explicit. Removed the unrelated AT.3 prerequisite and request: native ultraproduct structure and formula transfer already construct the arithmetic extension. Updated the six routed Bhatt–Mathew dispositions so they retain their geometric owner without claiming an LD request. |
| LD.0/standard-part-interface | Added the pinned finite-domain addition, multiplication and infinitesimal uniqueness laws. The arbitrary-ultrafilter/native-hyperreal comparison remains a precise gap. |
| LD.1/kronecker-dimension | Replaced the irrelevant ring-language prerequisite by native cardinal transcendence degree and the characteristic-zero/positive-characteristic prime-subfield comparisons. |
| LD.1/coarsening-prime | Synchronized acceptance with the actual tests: zero lower coefficients belong to the prime, while a nonzero coefficient of lexicographically infinitesimal value becomes a unit after coarsening. |
| LD.2/cells | Replaced nonexistent numbered definitions by the unnumbered definitions in Cluckers–Loeser §7.1, p.37; 7.1.1 is a remark. |
| LD.2/jacobian-change-variables; gauge-measure | Distinguished the one-coordinate motivic Proposition 9.3.2, pp.58–59, from the general change-of-variables Theorem 12.1.1, p.74. Added the local-field analytic inverse/substitution, null-set and countable chart-gluing proof contract. Specified disjoint chart refinement and extension by zero on the singular locus. Generic real differential geometry is insufficient for these inputs. |
| LD.3/definable-subassignment | Corrected the locators to §§2.2–2.4, pp.10–13, and §15.1, pp.82–84. Replaced the false affine-open coordinate reduction by a closed-embedding, intrinsic-dimension and overlap-descent proof obligation, included in the motivic gap and SF.1 request. |
| LD.3/residue-grothendieck | Identified the current library's completion and ring-map declarations precisely. Only the definable scissor objects and their maps are new; general Grothendieck completion is reused. |
| LD.4/effective-polynomial-coding | Removed a purported computable reifier from bare native `Poly`, whose polynomiality witness lives in `Prop`. Effective inputs now carry finite syntax and evaluation certificates; normalization recurses on supplied code. Renamed the API entry to `normalize_code` and added a test distinguishing classical representation from effective input. |
| LD.4/diophantine-sequence-coding; bounded-universal-closure | Separated elementary CRT sequence coding from exponentiation, added native CRT, corrected the positive-integer pairing offset, and corrected the Davis locators. Made factorial, binomial and arithmetic-progression product steps explicit inside the bounded-universal proof; the reference is to Theorem 5.1 and Lemmas 5.1–5.2, not a nonexistent Corollary 5.2. |
| LD.4/dioph-to-re; recursive-computation-graphs; mrdp; h10-integers; LD.5/algorithmic-frontier | Corrected Davis theorem/section locators, including §7 Theorem 7.4, p.262, and §8, p.264. Distinguished the source's total recursive positive-integer functions from the still-required native partial-recursive adapter. |
| LD.4/ring-diophantine-sets; prime-class-rings; square-detection-unions | Removed stale acceptance statements inconsistent with the already-correct tests: the product equation for unions needs a domain; dyadic prime-class guards matter; the square-detection examples must satisfy Φ₁. |
| LD.4/existential-model-interfaces | Imported native `BoundedFormula.IsExistential` instead of planning its syntax again. Relative existential closure and model completeness remain separate targets. |
| LD.6/rough-curve-test | Added the directly used sector-exponential-decay prerequisite. The repaired all-width curve theorem and Hodge application remain explicit gaps. |
| LD.6/bounded-derivative-parametrization | Repaired the higher chain rule in Pila–Wilkie Corollary 4.4, p.607, using its full finite expansion. |
| LD.6/semi-rational-counting | Corrected the adapted-cell fibre dimension in Habegger–Pila Theorem 7.1, p.23. Preserved the distinct-second-projection conclusion and separate marked-endpoint strengthening gap. |
| LD.6/hermitian-structure-comparison | Replaced the false equality of the Borel–Serre and algebraic R_an structures by an R_an,exp-definable comparison. BKT Theorem 1.1(1)–(2) and Example 1.2, pp.3–4, are the relevant locators; there is no part (4). Fixed K and erratum morphism restrictions remain explicit. Added selected o-minimality as a prerequisite and the modular-cusp exp(−2π/t) countercheck. The exact geometric comparison is an independent supplier contract; definable Chow cannot establish its definability. |
| LD.6/abelian-ax-type-interface | Restored irreducibility, Γ-invariance, faithful action, the free subgroup/no fixed lattice vector assumptions and preservation of every abelian subvariety in the monodromy-type condition. The word-height constant bounds both generators and both inverses in a submultiplicative norm. |

The original constant and variable comparison nodes are now API laws of `LD.4/to-dioph-poly`; inverse evaluation is an API law of `LD.4/poly-mvpolynomial-equiv`. Their five surviving bridge consumers were reconciled: the forward map, evaluation, surjectivity, equivalence and finite normal form. All references were redirected and deduplicated. The classical inverse, arbitrary input type and witness-universe lifting remain explicit. No mathematical endpoint or planet was removed. The exact former-to-parent mapping is in `researchNotes.mergedNodeIds`.

The reader now includes every target's explicit hypothesis field and mirrors corrected statements, proofs, prerequisites, APIs, tests, acceptance criteria, source findings, baseline, requests and gaps. Coverage remaining-work lists were rebuilt from the direct consumers. Current coarsening paths and Grothendieck declarations were corrected in `upstreamNotes`.

## Sources and source defects

The review checked assertions at each node's locator, not every page of every cited work. The source and edition inventory retains dated provenance, URLs and available hashes. Original proof acquisition gaps, including Pas's scanned preparation proof, arbitrary-rank henselization, original o-minimality proofs and the remaining motivic integration construction, remain open. No source passage or section-by-section summary was added. No uncleared book was accessed.

All **22 inherited findings** were checked and given independent verdicts after correction. E10's repair now explicitly chooses a point with every coordinate nonzero over an infinite algebraic closure. E17's direct-image claim is on p.28, with the further §5.6 claim on p.30. **E19 partially withdraws the incoming allegation:** “1-gauge” correctly means tensor order one. Only the genuine relative-form-on-Y and top-form/tensor-degree slips remain confirmed. E20 is scoped to the author's addendum convention for paper [14], not a restriction of the separate specialization theorem.

Five further findings were confirmed in the recorded versions:

| Finding | Locator and independent check |
| --- | --- |
| E23 | Pila–Wilkie, Corollary 4.4 proof, p.607: f(t)=t, ψ(t)=t² and derivative order two refute the displayed single-product higher chain rule. The full chain rule repairs the bound. |
| E24 | Habegger–Pila v1, Theorem 7.1 proof, p.23: a fibre of (0,1)²×(0,1) over its two parameter coordinates has dimension one, not dim C−1=2. Use dim C−dim π(C). |
| E25 | Gao–Habegger v3, Lemma 5.2 proof, p.19: the word-height maximum repeats one generator. It must bound every generating letter, including inverses. Enlarging it preserves exponential growth. |
| E26 | Davis's 1973 Monthly scan, §1 p.236: the printed positive-integer pairing sends (1,1) to zero; remove the final offset or translate the entire convention. An author bibliography records a corrected Dover reprint, which was not accessed. This finding makes no claim about that reprint. |
| E27 | Cluckers–Loeser v3, §15.1 p.83: an affine elliptic curve cannot be an open subset of the affine line, by its genus. Closed embeddings exist; the required descent replacement is retained as a proof contract rather than asserted proved. |

The packet gives counterchecks, correction searches, version scope and independent reasons for all 27 findings. These identify defects in the specified arguments or documentation; they do not withdraw the main counting or integration endpoints.

## Baseline, ownership and assigned red-team findings

Confirmed all **51 incoming citations** at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`; none removed or renamed. Added nine confirmed citations: `IsFractionRing`, `ArchimedeanClass.stdPart_add`, `stdPart_mul`, `mk_sub_pos_iff`, `Algebra.trdeg`, `Subfield.bot_eq_of_charZero`, `bot_eq_of_zMod_algebra`, `Nat.chineseRemainder`, and `FirstOrder.Language.BoundedFormula.IsExistential`. Their actual statements, surrounding assumptions and conventions were read. The Tau Ceti baseline remains `f790474821cf4256814db967cb154e7af3d0c369`.

Read the reviewed library audit and the current upstream/library owners. Current RealAlgebraicGeometry owns semialgebraic syntax, CAD, projection and ordered-field elimination; DifferentialGeometry owns abstract boundary/local faces; AdicSpaces owns valuation spectra and patch topology. Current Tau Ceti's coarsening and general Grothendieck completion are imports, not new LD constructions or false pinned declarations. The reader preserves these boundaries. No higher arithmetic-statistics dependency was introduced.

- **RT-AREA-modeltheory/1:** the retired FoundationsAndLibraryIntegration stage is replaced by actual native/imported interfaces. The prerequisite graph and reader agree on arithmetic syntax, valued-field inputs and integration suppliers; explicit requests describe the extra contract rather than treating broad stage prose as a theorem.
- **RT-AREA-modeltheory/2:** native `FirstOrder.Language.Ultraproduct.«structure»` and Łoś transfer are baseline mathematics. LD adds the chosen arithmetic embedding and nonstandard element, not another general ultraproduct construction.

## Validation and orchestration

- `python3 scripts/check_blueprint.py research/blueprint/packets/LogicAndDefinabilityInNumberTheory.json`: **zero errors and warnings**, using the available pinned declaration index.
- Independent reader audit: all 127 cards, 165 API items, 154 tests, source locators, hypotheses, acceptance clauses, baseline rows and consumer references agree with the packet; removed IDs occur only in the explicit merge history. Review covers each surviving node once; the internal prerequisite graph is acyclic.
- Source-finding schema and edition validation through `source_issues.check_issues` and `check_errata.versions_checked`: **no errors**.
- `lean-check` on the unchanged suggested file: **exit zero, 28 warnings, all declaration uses sorry**. Three light definitions have real bodies. The file asserts endpoint signatures and examples on pinned carriers; the heavy carriers and their APIs remain reader targets under the current WORKERS shape rule. Elaboration is not proof verification.
- Deliverable intake, JSON and whitespace checks pass. No atlas data, other worker's output, source file or local path was added.

For the orchestrator: no new mathematical owner is proposed. Assign exact registry/import IDs for the current RealAlgebraicGeometry and DifferentialGeometry interfaces. Preserve the early LD.6 prefix → independent Part II geometry → LD.6 application suffix order when the Part II stages are registered. Supply the exact Hermitian comparison, abelian Ax and marked-endpoint counting contracts before source closure. The nine recorded requests and 21 gaps are the remaining implementation work; they do not contradict acceptance of this target-level pass.
