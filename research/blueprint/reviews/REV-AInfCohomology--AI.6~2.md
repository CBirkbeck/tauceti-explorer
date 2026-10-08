# REV-AInfCohomology--AI.6~2 — independent review

**Verdict: accepted as a target-level planning pass.** Codex, session codex-fYaxq2, issue #6984, 8 October 2026. This session wrote neither BP-AInfCohomology--AI.6 nor its round-two revision. Both stages remain planned, neither closed. Acceptance validates the stated plan and its explicit boundaries; it does not close the six recorded gaps or certify the geometric targets as formalized.

The previous review’s sole blocking request was synchronization of the reader. Round two supplies that synchronization. I checked the full packet, suggested file and reader afresh, including all earlier corrections, rather than accepting the former mathematical verdict as evidence.

## Counts and changes

| Item | Result |
| --- | --- |
| Nodes | 60: 4 definitions, 16 constructions, 38 theorems, 2 applications |
| Per-node verdicts | 49 verified, 11 corrected, none added or unverifiable |
| Mathematical proof-outline corrections | 2 |
| Editorially corrected nodes | 9, containing 10 short source quotations now paraphrased |
| Baseline citations | 34 confirmed; none added, removed or replaced |
| Definition/construction API and tests | 103 API items, 76 unit tests |
| Planets | 12, six in each stage |
| Supplier requests / explicit gaps | 18 / 6, unchanged |
| Direct prerequisites | 31 baseline uses, 200 local-node uses, 134 stage uses, 86 blueprint-node uses, 10 integrated-node uses |
| Coverage | AI.6: 43 targets; AI.7: 17 targets; all realized by nodes |
| Source findings | 14 independently confirmed, none added or rejected |

The two mathematical corrections are these:

1. **Constrained log-unit lifting.** `all-coordinates-pd` had asserted unique lifting of ordinary units through a log PD thickening. Ordinary units can differ by elements of 1+I, where I is the thickening ideal. CK Lemma 5.29, p.48, uses a different assertion: for fixed log sections t,t′ and a unit u₀ relating their restrictions, the unique lifted unit must satisfy t=u·t′. The corrected proof and CR.5 request say exactly what constrains uniqueness. Their reader passages agree.
2. **Global completed base change.** `ainf-base-change` had asserted that qcqs implies derived global sections are a finite affine limit and therefore commute with completed tensor. That reasoning does not follow from qcqs. PR.1/prismatic-base-change already states the needed global qcqs theorem. The corrected proof applies it to RΓ_Δ, then uses the natural PR.6 sheaf comparison and the ξ/ξ̃ Frobenius dictionary to obtain RΓ_Ainf. The direct E4/completed-sheaf-tensor citation was removed from this node and its reader and Lean inventory. The E4 stage request remains for the completed extension operation. G-MAPS still records the required PR.6 naturality and multiplicativity.

Ten proof passages in nine further nodes still contained short source quotations that the round-two reader had already expressed in its own words. I checked the mathematical equivalence of those paraphrases and used them in the packet: `bdr-comparison-map`, `crystalline-torsion`, `de-rham-torsion`, `de-rham-lattice-functor` (two passages), `coefficient-normalization`, `trace-descent`, `trace-prismatic-agreement`, `twist-compatibility` and `comparison-diagram-agreement`. These are editorial corrections, with no change of statement or proof route. No source passages are reproduced in this report.

The library-audit metadata was also stale. The aggregate `data/library-coverage.json` has no AInf entry and still lists AUDIT-35 as pending, but [REV-AUDIT-35](REV-AUDIT-35.md) is an accepted report and its reviewed result exists. I read that report and the AInf targets of [AUDIT-35.result.json](../audit/AUDIT-35.result.json), reconciled the packet and reader references, and independently rechecked the inputs. The aggregate registry was left to its owner.

## Sources and reading boundary

All four PDFs were independently obtained at the public URLs below; their SHA-256 hashes match `sourceVersions`. CK findings are scoped to arXiv v3, and BS22 findings to arXiv v4. No claim is made about corrections in a different published version.

| Key | Public version | Relevant material read |
| --- | --- | --- |
| CK | [1710.06145v3](https://arxiv.org/pdf/1710.06145v3), 4 October 2018 | Chart/log hypotheses §§1.5–1.7, pp.4–6; coefficients and proper comparisons §2, pp.7–9; local monomial/edge and finite-PD arguments §§3–5, pp.10–59; topology and non-unit embeddings §§6.1–6.4 and maps §§6.5–6.8, pp.60–67; torsion/BKF/lattice arguments §§7–8, pp.68–77. |
| BMS1 | [Published IHÉS 128](https://www.numdam.org/item/10.1007/s10240-019-00102-z.pdf), pp.219–397 | Integral-perfectoid and coefficient inputs; §§4.1–4.4, pp.261–283; Theorem 5.7, p.287; Lemma 8.11, p.309; finite-PD estimates and map construction §§12.2–12.3, pp.358–368; the §13 deformation/topology/freeness construction, pp.368–389; Theorem 14.1, p.389. |
| BMS2 | [Published IHÉS 129](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), pp.199–310 | Definition 1.1, Theorem 1.2 and arithmetic consequences, pp.199–202; the entire §11 relative coefficient, trace, Bott-inversion and descent proof, pp.298–308, including all affected locators. |
| BS22 | [1905.08229v4](https://arxiv.org/pdf/1905.08229v4), 12 January 2022 | Examples 1.3/1.9 and Theorem 1.8, pp.2–6; Nygaard/trace argument §15, pp.102–105; AΩ comparison, Hodge–Tate map compatibility and uniqueness §§17–18, pp.117–123. |

Each node’s source locators and mathematical match descriptions were checked against these versions. The node notes below identify the result and the load-bearing hypothesis or proof issue. This is a review of the targets and the arguments they require, not a transcription or sequential summary of a paper.

Inputs quoted or cited by these papers were checked at the statements the four papers supply and, when an external packet exists, at its precise supplier statement. I did not independently verify every proof in Beilinson, Kato, Scholze, Fujiwara–Kato, Ullrich or Gabber–Ramero. The general rank-one GAGA/fin-iteness, log-PD foundations and auxiliary geometric inputs remain requests or gaps at their owners. No restricted book copy was used. The four freely available source versions suffice for the corrections made here.

## Closure, ownership, APIs and tests

Every stage target in `coverage.targets` has its own node. At target granularity the local monomial analysis, finite PD approximation, exactification, comparison maps, degreewise obstructions and arithmetic examples are represented without splitting each proof into low-level lemmas. The 60-node pass is complete at this granularity; its seven explicit remaining tasks across the two stages and six gaps are not implementation claims.

I read the actual statements of every named external supplier node, including PR.0’s Breuil–Kisin prism; PR.1’s relative complex, Hodge–Tate, crystalline and global base-change contracts; PR.3’s Frobenius, Nygaard, trace, twist and de Rham results; PR.6’s AΩ comparison and uniqueness hypotheses; PR.7’s prismatic coefficient dictionary; DD1’s complete faithfully flat Čech descent; the enhanced derived sheaf interfaces; the perfectoid chart criterion; R07.4’s coefficient rings and finite-free classification; AI.1’s décalage results; and the corrected adic pro-étale site. Stage requests give exact hypotheses and required statements rather than treating layer titles as proved theorems. Supplier packets with their own open reviews remain plans.

The full stage graph, accepted restructuring links and this packet’s direct external dependencies have no supplier return path from AI.6 or AI.7. The packet checker also finds no local dependency cycle. In particular the Fargues/BKF and Kisin classification inputs do not depend on the geometric cohomology being defined here, and CP.5 is a consumer rather than a hidden proof input.

**RT-AREA-padic-2/13 is resolved in both packet and reader.** CP.3 owns the canonical B_dR⁺ deformation target of BMS1 §13. AI.6 adds the semistable comparison and CK’s étale-topology/non-unit-coordinate extension, so the required direction is CP.3→AI.6. The explicit packet link records that direction even though the aggregate stage graph does not yet contain it. CP.4 and CP.5 consume the resulting rational comparison and torsion/lattice interfaces. This avoids replanning CP.3 or reversing the edge.

The reviewed library audit’s AI.6/AI.7 targets are absent at the pin; its existing A_inf/θ/B_dR and ordinary algebra inputs are reused. Fresh concept searches of the pinned Mathlib and Tau Ceti trees found no implementation of the log/prismatic/trace geometric targets. Reading the upstream [AdicSpaces](../../../content/tau-ceti/AdicSpaces/README.md) roadmap and [ProfiniteCohomology](../../../content/tau-ceti/ProfiniteCohomology/README.md) conventions and contracts confirms two scope boundaries: rank-one formal GAGA exceeds the elementary adic geometry, and the discrete-coefficient cohomology contracts do not supply CK’s complete coefficient Koszul computations. Existing upstream roadmaps were not replanned or edited.

All 20 definitions and constructions have at least three discriminating tests and operational API outlines. I checked constructors, restrictions, extensionality or presentation-independence where appropriate, universal properties, completion and Frobenius normalizations, and downstream use. Tests distinguish p-adic from coordinate-adic completion; nonflat integral root levels; fractional monomial weights; nonexact from exactified PD envelopes; varying-coordinate invariance; θ from θ̃ and f from g; relative from absolute trace; and coherent descent from detection. Recomputed the root-cover length, monomial and coefficient examples, Nφ=pφN matrix example, ramified length divisibility and the genus-zero conic reasoning. Missing curve geometry is still G-CURVE rather than a claimed Lean test.

The twelve planet names describe mathematical constructions and central comparisons, with six per stage. None is merely a source locator. The comparison-map agreement planet represents a qualified target whose unproved compatibility checks are explicit in G-MAPS. The proposed three-way AI.6 display grouping preserves the 43-node stage and partitions its nodes correctly.

## Baseline and suggested Lean file

All 34 packet citations were opened in their actual Mathlib source at `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti searches used `f790474821cf4256814db967cb154e7af3d0c369`. Names, binders and conventions agree with their uses. In particular:

- `Finset.min'` is generated by the dual attribute on `Finset.max'`; a failed literal-name definition search would not disprove its presence.
- Power-series substitution requires `HasSubst`, and expansion/substitution by X^p uses nonzero p.
- Witt Frobenius is only an equivalence under the perfect characteristic-p hypotheses; Fontaine θ requires the stated p-completeness and nonunit hypotheses.
- Ordinary faithful-flat detection is not itself derived Čech descent. The latter is requested from DD1.
- `DerivedCategory`, `DividedPowers` and `DividedPowerAlgebra` are not substitutes for enhanced derived categories, derived completion or PD envelopes.
- The PID structure theorems require finitely generated modules, provided by the proper cohomology hypotheses in the arithmetic example.

The exact citation list is:

- `mathlib:MvPolynomial` — `Mathlib/Algebra/MvPolynomial/Basic.lean`.
- `mathlib:Ideal.Quotient.mk` — `Mathlib/RingTheory/Ideal/Quotient/Defs.lean`.
- `mathlib:AdicCompletion` — `Mathlib/RingTheory/AdicCompletion/Basic.lean`.
- `mathlib:AdicCompletion.evalₐ` — `Mathlib/RingTheory/AdicCompletion/Algebra.lean`.
- `mathlib:Finset.max'` — `Mathlib/Data/Finset/Max.lean`.
- `mathlib:MvPolynomial.pderiv` — `Mathlib/Algebra/MvPolynomial/PDeriv.lean`.
- `mathlib:PowerSeries` — `Mathlib/RingTheory/PowerSeries/Basic.lean`.
- `mathlib:PowerSeries.map` — `Mathlib/RingTheory/PowerSeries/Basic.lean`.
- `mathlib:PowerSeries.substAlgHom` — `Mathlib/RingTheory/PowerSeries/Substitution.lean`.
- `mathlib:PowerSeries.constantCoeff` — `Mathlib/RingTheory/PowerSeries/Basic.lean`.
- `mathlib:WittVector` — `Mathlib/RingTheory/WittVector/Defs.lean`.
- `mathlib:WittVector.frobenius` — `Mathlib/RingTheory/WittVector/Frobenius.lean`.
- `mathlib:DerivedCategory` — `Mathlib/Algebra/Homology/DerivedCategory/Basic.lean`.
- `mathlib:DividedPowers` — `Mathlib/RingTheory/DividedPowers/Basic.lean`.
- `mathlib:DividedPowerAlgebra` — `Mathlib/RingTheory/DividedPowerAlgebra/Init.lean`.
- `mathlib:AdicCompletion.evalₐ_of` — `Mathlib/RingTheory/AdicCompletion/Algebra.lean`.
- `mathlib:AdicCompletion.liftRingHom` — `Mathlib/RingTheory/AdicCompletion/Algebra.lean`.
- `mathlib:IsAdicComplete.liftRingHom` — `Mathlib/RingTheory/AdicCompletion/RingHom.lean`.
- `mathlib:AdicCompletion.isAdicComplete` — `Mathlib/RingTheory/AdicCompletion/Completeness.lean`.
- `mathlib:PowerSeries.expand` — `Mathlib/RingTheory/PowerSeries/Expand.lean`.
- `mathlib:PowerSeries.HasSubst.X_pow` — `Mathlib/RingTheory/PowerSeries/Substitution.lean`.
- `mathlib:PowerSeries.coeff_subst_X_pow` — `Mathlib/RingTheory/PowerSeries/Substitution.lean`.
- `mathlib:PowerSeries.constantCoeff_subst_X_pow` — `Mathlib/RingTheory/PowerSeries/Substitution.lean`.
- `mathlib:PowerSeries.substAlgHom_X` — `Mathlib/RingTheory/PowerSeries/Substitution.lean`.
- `mathlib:WittVector.frobeniusEquiv` — `Mathlib/RingTheory/WittVector/Frobenius.lean`.
- `mathlib:WittVector.fontaineTheta` — `Mathlib/RingTheory/Perfectoid/FontaineTheta.lean`.
- `mathlib:PreTilt` — `Mathlib/RingTheory/Perfection.lean`.
- `mathlib:PreTilt.untilt` — `Mathlib/RingTheory/Perfectoid/Untilt.lean`.
- `mathlib:WittVector.teichmuller` — `Mathlib/RingTheory/WittVector/Teichmuller.lean`.
- `mathlib:WittVector.map` — `Mathlib/RingTheory/WittVector/Basic.lean`.
- `mathlib:Module.FaithfullyFlat.zero_iff_lTensor_zero` — `Mathlib/RingTheory/Flat/FaithfullyFlat/Basic.lean`.
- `mathlib:Module.FaithfullyFlat.lTensor_bijective_iff_bijective` — `Mathlib/RingTheory/Flat/FaithfullyFlat/Basic.lean`.
- `mathlib:Module.equiv_free_prod_directSum` — `Mathlib/Algebra/Module/PID.lean`.
- `mathlib:Module.equiv_directSum_of_isTorsion` — `Mathlib/Algebra/Module/PID.lean`.

I read the whole active suggested file, and checked its named inventory against all 60 signatures, 103 API names and 76 test names. It contains 205 declarations/examples, 182 with completed prototype proofs and 23 unfinished proofs. Seventeen API items and eighteen tests have active Lean forms; the remaining geometric material is deliberately omitted from the active declarations because supplier carriers are missing. The file does not encode missing geometry using arbitrary carriers or assumed proposition fields. The only change to Lean in this review is the corrected prerequisite list in its comment inventory.

`lean-check research/blueprint/suggested/AInfCohomology--AI.6.lean` completed with exit code 0 at the pin: 23 warnings, all for declarations using unfinished proofs; no other warnings or errors. Memory was checked before the single compilation. No language server or library build was started. Compilation does not verify the commented geometric inventory or the unavailable period-kernel principality assertions.

## Source findings

Every entry has a fresh review verdict by this job. All fourteen survive independent inspection. The packet records the corrections in its own words and the nodes use them. No new source mistake was found; the two new proof-outline mistakes above belong to the packet, not the papers.

| Finding | Verdict and reason |
| --- | --- |
| `AInfCohomology/E-AI6-1` | Confirmed. BMS1 §4.4, p.280 describes an automorphism, but reduction modulo p has image k[[T^p]], so T has no preimage. The coefficient Frobenius is bijective; the power-series substitution is only an endomorphism. |
| `AInfCohomology/E-AI6-2` | Confirmed. BMS2 p.306 omits the relative base in the Bott-inverted definition. Proposition 11.15, p.305, and the composite in the same proof use TC⁻ relative to 𝕊[z]. This is the same omission already registered as PAPER-BHATT-MORROW-SCHOLZE-19/E12. |
| `AInfCohomology/E-AI6-3` | Confirmed. CK §6.3, p.62 indexes the ring of definition by Σ, although the defining deformation algebra immediately above uses Ψ for the invertible-coordinate family. Replacing Σ by Ψ restores the declared generators. |
| `AInfCohomology/E-AI6-4` | Confirmed. CK footnote 18, p.61 starts the polynomial list at T₁ but its relation involves T₀. The surrounding chart (6.3.1) includes T₀, so it is a missing generator in the list. |
| `AInfCohomology/E-AI6-5` | Confirmed. CK §7.2, p.68 refers to (2.3), while the étale specialization used in (7.2.1) is the display (2.3.1) of Theorem 2.3. The remaining two referenced displays match. |
| `AInfCohomology/E-AI6-6` | Confirmed. CK Question 7.13, p.72 drops the special-fibre subscript. The crystalline complex throughout §7 is over 𝔛_k/W(k); the formal mixed-characteristic model itself is not the object of that crystalline specialization. |
| `AInfCohomology/E-AI6-7` | Confirmed. CK p.24 drops the p from Z_p[[T]]. The coefficient morphism and Proposition 3.29, p.21 specify Z_p[[T]]; BMS1 Remark 4.31 supplies this completed coefficient-ring flatness. |
| `AInfCohomology/E-AI6-8` | Confirmed. CK §4.15, p.30 uses the algebraic model over the integral closure of W(k), but the formal GAGA theorem and the displayed differentials require its base change to O_C. Remark 4.19 uses that base change explicitly. This is a notation correction in an otherwise valid argument. |
| `AInfCohomology/E-AI6-9` | Confirmed. BS22 §15.2, p.105 points to BMS2 Proposition 11.5. In the published BMS2, 11.5 is the relative cyclotomic construction on p.300; the Bott-inverted definition needed here is Proposition 11.15, p.305. |
| `AInfCohomology/E-AI6-10` | Confirmed. BMS2 Notation 11.1, p.298 omits completeness. A discretely valued extension with perfect residue field need not admit the claimed W(k)[[z]] coefficient surjection: the maximal unramified algebraic extension of Q_p has perfect residue field but is not complete. The packet uses complete K, as in BMS1 §4.1 and BS22 Example 1.3(3). |
| `AInfCohomology/E-AI6-11` | Confirmed. BMS1 p.265 gives the image of T but omits the action on W(k). The θ̃-square forces Witt Frobenius on coefficients; a W(k)-linear assignment would send a coefficient through φ_W^{-1}. Section 4.4, pp.280–281 gives the normalized map explicitly. |
| `AInfCohomology/E-AI6-12` | Confirmed. CK Theorem 3.9, p.13 checks a quotient by f-torsion, whereas Lemma 3.4 and BMS1 Lemma 8.11(i), p.309 require the reduction M/fM. The missing hypothesis follows from the cohomology sequence for multiplication by f on R_∞ and Proposition 3.8 with b=f. The packet uses this repair. |
| `AInfCohomology/E-AI6-13` | Confirmed. BMS2 Remark 11.16, p.307 proposes an elliptic j-invariant outside W(k)[π^p] for general K. That subring equals O_K in the unramified case. The packet correctly separates the p∤e obstruction to descending the coefficient ideal from the ramified case where the elliptic argument applies. |
| `AInfCohomology/E-AI6-14` | Confirmed. BMS2 Notation 11.1, p.298 cites BMS1 Lemma 4.30 and its proof for faithful flatness and topological freeness. The cited proof, p.281, establishes flatness only. The two stronger true conclusions need the additional local-ring and lifted-basis arguments recorded in flat-coefficient-extension. |

## Per-node audit

The following is the independently checked register. Source pages refer to the public versions above; full locators and proof boundaries remain in the packet. Corrections include the nine editorial nodes listed earlier.

| Node | Verdict | Check |
| --- | --- | --- |
| `AInfCohomology:AI.6/chart-ring` | verified | CK §1.5, (1.5.1), p.4; CK §1.5, sentence after (1.5.1), p.4. The polynomial quotient followed by p-adic completion gives the restricted chart, with torus variables forced invertible. The lift API requires p in the target ideal; reduction and the restricted-series test distinguish coordinate-adic completion. |
| `AInfCohomology:AI.6/divisorial-log` | verified | CK §1.6 (1), p.5; CK §1.6 (2), p.5. The associated pushout chart gives the divisorial structure. Integrality, quasi-coherence and the possible failure of fineness are retained; generic-fibre triviality concerns the log structure, not the special-fibre chart. |
| `AInfCohomology:AI.6/root-tower` | verified | CK §3.1, (3.1.1), p.10; CK §3 (introduction), p.10. Relations and compatible roots give the completed tower and Δ of rank d. Recomputed the p=2 fibre-length test: length three versus generic degree two. Perfectoidness imports the integral criterion; flatness is not inferred. |
| `AInfCohomology:AI.6/monomial-exponents` | verified | CK §3.2, (3.2.1), p.10; CK §3.2, (3.2.1), p.10. Subtracting the branch minimum retains the scalar factor. Exact level, transitions and Δ-weights are compatible with this normal form; the nodal, smooth and fractional tests distinguish wrong indices. |
| `AInfCohomology:AI.6/monomial-splitting` | verified | CK §3.2, (3.2.2), p.10; CK §3.2, p.11. The completed module decomposition and its integral/nonintegral summands agree with the source. The lift is used before the splitting; the nonintegral weight calculation explains μ-annihilation. |
| `AInfCohomology:AI.6/ainf-chart-lift` | verified | CK §3.14, (3.14.2), p.15; CK §3.14, (3.14.2), p.15. The formal étale lift is along θ and is (p,μ)-complete. Frobenius and Δ lift uniquely, Δ becomes trivial modulo μ, and dividing δ−1 by μ requires the supplied torsion-freeness. |
| `AInfCohomology:AI.6/structure-sheaf-edge` | verified | CK §3.3, (3.3.1), p.11; CK Lemma 3.5, p.12. The almost edge map becomes an integral equivalence after décalage. Checked the repair of the M/(ζ_p−1)M hypothesis through Proposition 3.8, rather than substituting M/M[ζ_p−1]. |
| `AInfCohomology:AI.6/nonintegral-annihilation` | verified | CK Proposition 3.19, p.16; CK Proposition 3.19 (last sentence), p.16. The monomial weights provide an invertible residual character in the nonintegral summands, giving annihilation before using the décalage edge criterion. The almost-to-integral hypotheses are explicit. |
| `AInfCohomology:AI.6/local-edge` | verified | CK Theorem 3.20, p.18; CK Theorem 3.20 (proof), p.18. The direct monomial split, torsion control and almost comparison justify the local décalage equivalence. The base changes use the separately supplied décalage statements and their nonzerodivisor hypotheses. |
| `AInfCohomology:AI.6/aomega` | verified | CK §1.5, (1.5.5), p.5; CK §2.2, (2.2.3), p.9. The presheaf-site construction and its sheafification are distinguished. API records restriction and the comparison maps without assuming the later sheaf-completeness theorem; the torus and chart tests are discriminating. |
| `AInfCohomology:AI.6/aomega-frobenius` | verified | CK §2.1, p.8; CK §2.2, (2.2.5), p.9. The linearized Frobenius factors through décalage by φ(ξ), with the stated localization and normalization. It precedes the de Rham comparison and does not require that comparison as an input. |
| `AInfCohomology:AI.6/hodge-tate-comparison` | verified | CK Theorem 4.2, (4.2.1), p.25; CK Theorem 4.2 (proof), p.25. The θ̃ reduction and cohomology twists match logarithmic forms. The vector-bundle extension uses the rank-one formal GAGA input, explicitly left in G-GAGA, and Zariski claims retain the coordinate hypothesis. |
| `AInfCohomology:AI.6/aomega-sheaf-completeness` | verified | CK Remark 4.5, p.26; CK Remark 4.5, p.26. Completeness and presheaf/sheaf agreement follow after Hodge–Tate, as required. ξ and (p,ξ) completions and the Zariski-coordinate restriction are not interchanged. |
| `AInfCohomology:AI.6/log-de-rham` | verified | CK Theorem 4.17, (4.17.1), p.30; CK Theorem 4.17 (proof), p.30. Frobenius, Bockstein reduction and logarithmic Hodge–Tate identify the θ specialization with the log de Rham differential. The source does not provide unrestricted global multiplicativity or non-étale functoriality. |
| `AInfCohomology:AI.6/proper-perfectness` | verified | CK Corollary 4.20, p.31; CK Corollary 4.20 (proof), p.31. Proper coherent finiteness plus derived completeness imply perfectness of the complex. The rank-one finiteness input remains G-GAGA; perfectness alone does not assert free cohomology. |
| `AInfCohomology:AI.6/finite-level-acris` | verified | CK §3.26, p.19; CK §3.26, p.19. The finite generated PD subrings, their completions and relative versions are separate from the full period ring. The m≥p² threshold for the exponential and unit estimates is preserved. |
| `AInfCohomology:AI.6/finite-pd-base-change` | verified | CK §3.28, (3.28.1), p.21; CK Proposition 3.32, p.23. The regular-sequence flatness and Mittag–Leffler arguments precede commuting completed tensor with continuous cohomology. The almost ideal and μ-torsion hypotheses are kept through the finite approximants. |
| `AInfCohomology:AI.6/log-derivations` | verified | CK §5.9, p.36; CK §5.10, (5.10.1), p.36. Generator values preserve the product relation; the polynomial operators commute and descend to the quotient. Logarithmic derivations, PD extension and termwise completion are explicit, and the Frobenius factor p is retained. |
| `AInfCohomology:AI.6/local-crystalline` | verified | CK §5.14, p.38; BMS1 Lemma 12.8, p.364. The convergent exponential gives unit changes between the group-action and log-derivation Koszul operators. This is an equivalence of complexes; it is not promoted to a differential graded algebra map. |
| `AInfCohomology:AI.6/all-coordinates` | verified | CK §5.17, p.40; CK §5.17, p.40. Finite coordinate sets, sufficiently large indices and filtered transition maps are part of the presentation. The API and tests do not identify a singleton coordinate set with an arbitrary single chart. |
| `AInfCohomology:AI.6/log-exactification` | verified | CK §5.25, p.45; CK §5.25, p.45. The selected-branch ratios and their product relation give the exact immersion. Changing the selected branch is coherent, and the node imports general log-monoid algebra rather than duplicating its owner. |
| `AInfCohomology:AI.6/all-coordinates-pd` | corrected | CK §5.22, p.43; CK §5.22, (5.22.2), p.43. Corrected the lifting step: uniqueness is for a unit satisfying a specified relation between log sections, not for an arbitrary unit lift. The CR.5 request and reader now state that constraint. Classical p-completion is essential because envelope p-torsion-freeness is not known. |
| `AInfCohomology:AI.6/all-coordinates-aomega` | verified | CK §5.19, p.42; CK Proposition 5.20, (5.20.1), p.42. The all-coordinates Koszul model is invariant under enlarging indices and computes the presheaf AΩ object after décalage. Independence is not inferred from the singleton-chart tests. |
| `AInfCohomology:AI.6/all-coordinates-log-crystalline` | verified | CK Proposition 5.23, (5.23.1), p.44; CK Proposition 5.23, (5.23.1), p.44. The exactified log PD de Rham model computes log crystalline cohomology via the requested Poincaré theorem. Nonfine integral quasi-coherent log structures and classical termwise p-completion remain explicit. |
| `AInfCohomology:AI.6/all-coordinates-map` | verified | CK Lemma 5.33, p.51; CK Proposition 5.34, (5.34.1), p.51. The chain map uses the exponential/unit formulas and is compatible with the filtered coordinate maps. Frobenius-equivariance is stated without asserting an unsupported global algebra enhancement. |
| `AInfCohomology:AI.6/absolute-crystalline` | verified | CK Theorem 5.4, (5.4.1), p.33; CK Theorem 5.4, p.33. The comparison combines the explicit chain maps and all-coordinates models. The log special fibre and the A_cris base are preserved, and the source theorem supplies Frobenius-equivariance rather than arbitrary-morphism functoriality. |
| `AInfCohomology:AI.6/crystalline-de-rham-square` | verified | CK Proposition 5.41, (5.41.1), p.56; CK Proposition 5.41, p.56. The commuting specialization triangle uses the locally multiplicative map established in Proposition 5.41. This does not imply multiplicativity of the exponential comparison; θ and the log de Rham differential agree. |
| `AInfCohomology:AI.6/global-crystalline` | verified | CK §5.42, p.58; CK Corollary 5.43, (5.43.1), p.58. The qcqs statement uses completed tensor, while the proper statement removes completion and gives finite freeness after p-inversion. The different log points and coefficient bases are kept separate. |
| `AInfCohomology:AI.6/hyodo-kato-interface` | verified | CK Corollary 5.43, (5.43.2), p.58; CK Remark 5.44, p.59. The ℕ log point over W(k₀) is reached by log-structure and coefficient changes. The W(k₀)→W(k̄) cohomological base change is an identified input in G-INPUTS; the monodromy convention agrees with Nφ=pφN. |
| `AInfCohomology:AI.6/bdr-cohomology-etale-embeddings` | verified | CK §6.2, p.60; CK §6.2, (6.2.1), p.60. Strong noetherianity and the non-unit-coordinate completion are read before the comparison map. This is the CK étale-topology extension of CP.3’s canonical target, not a second construction of that target. |
| `AInfCohomology:AI.6/bdr-comparison-map` | corrected | CK §6.5, map (6.5.1), p.64; CK §6.5, (6.5.2), p.64. The explicit exactification ratios define the map to the B_dR⁺ deformation target. Replaced a short source quotation with the reader’s paraphrase; boundedness and nilpotence still use the named inputs. |
| `AInfCohomology:AI.6/bdr-comparison` | verified | CK Theorem 6.6, p.66; CK Theorem 6.6, mod-ξ clause, p.66. The proper comparison retains its finite-freeness proof and de Rham reduction. CP.3 owns the target; AI.6 owns the semistable map to it. This checks RT-AREA-padic-2/13. |
| `AInfCohomology:AI.6/etale-comparison` | verified | CK §1.5, p.5; CK §2.2, p.9. Properness is load-bearing in the μ-inverted comparison. The nonproper torus test rules out the formerly asserted qcqs generalization, and the revised reader now retains properness. |
| `AInfCohomology:AI.6/etale-bdr-agreement` | verified | CK Proposition 6.8, p.66 (proof pp.67–68); CK Proposition 6.8, conclusion, p.66. The proper hypotheses and scalar extensions match the source commuting diagram. Equality of maps is a theorem here, rather than inferred merely from existence of both equivalences. |
| `AInfCohomology:AI.6/cohomological-bkf` | verified | CK Theorem 7.4 with proof, p.69; CK §7.3, p.69. The finitely presented cohomological module may have torsion, but becomes free after p-inversion. The linearized Frobenius localization and the scope of the AI.5 algebra input are retained. |
| `AInfCohomology:AI.6/degreewise-specializations` | verified | CK §7.6, (7.6.1)–(7.6.2), p.69; CK §7.6, (7.6.3), p.69. The adjacent-degree ξ-torsion and Tor terms are present. Derived comparison alone does not give an unconditional degreewise isomorphism; the node’s exact sequences state the necessary correction. |
| `AInfCohomology:AI.6/freeness-criterion` | verified | CK Proposition 7.7, p.70; CK Proposition 7.7, proof, p.70. The single-degree crystalline torsion-freeness criterion is distinct from the two-degree hypothesis of model independence. The linear-algebra inputs give freeness over A_inf, not just after localization. |
| `AInfCohomology:AI.6/rank-equality` | verified | CK Corollary 7.5, p.69; CK Corollary 7.5, proof, p.69. The three rational ranks agree under the proper hypotheses, using the comparison complexes. Torsion does not alter rank, and the result does not assert equality of integral lengths. |
| `AInfCohomology:AI.6/crystalline-torsion` | corrected | CK Theorem 7.9, p.70; CK Theorem 7.9, proof, p.70. Rechecked the DVR length calculation and rank cancellation in the torsion inequality. Replaced a quoted notation word with ordinary prose; the theorem asserts a length bound, not an injection. |
| `AInfCohomology:AI.6/de-rham-torsion` | corrected | CK §7.10, p.71; CK §7.10, Fitting ideal, p.71. The normalized valuation length and its truncations agree with the source proof. Replaced a quoted notation word with prose; no discrete O_C valuation or canonical injection is invented. |
| `AInfCohomology:AI.6/de-rham-lattice-functor` | corrected | CK §8.1, p.72; CK §8.1, Galois action, p.72. The invariant lattice follows by commensurability and Ax–Sen–Tate, with finite-Galois descent checked. Replaced two source quotations with the reader’s paraphrases. Extension to O_C need not recover the entire invariant ambient lattice. |
| `AInfCohomology:AI.6/model-independent-lattice` | verified | CK Theorem 8.7, p.74; CK Theorem 8.7, freeness hypothesis, p.74. Freeness in degrees i and i+1 removes the specialization obstruction and identifies the intrinsic de Rham lattice. Both degrees, the proper arithmetic model, and the Galois normalization are retained. |
| `AInfCohomology:AI.6/nodal-conic` | verified | CK §1.5, (1.5.1), p.4; CK §1.5, (1.5.3), p.4. Recomputed the genus-zero model: the dualizing sheaf restricts to O(−1) on both components, giving log de Rham groups O_K,0,O_K and N=0. The rank-two nonzero-monodromy test is a separate algebra example; geometric curve inputs stay G-CURVE. |
| `AInfCohomology:AI.7/coefficient-normalization` | corrected | BMS1 §4.4, first paragraph, pp.280–281; BMS1 Remark 3.11, p.250. Recomputed f=g∘φ_𝔖=φ_A∘g, θ̃_A∘f=θ̃_𝔖, θ_A∘f=θ_𝔖, and c=φ_W∘constantCoeff. Frobenius on Witt coefficients is indispensable. Replaced the quoted source compatibility phrases with the reader’s paraphrase. |
| `AInfCohomology:AI.7/flat-coefficient-extension` | verified | BMS1 Lemma 4.30, p.281; BMS1 Lemma 4.30, proof, p.281. Flatness is BMS1 Lemma 4.30; faithful flatness uses the local-ring criterion, and topological freeness uses a lifted residue basis and regular-sequence completeness. Detection and coherent descent are distinct from an arbitrary descent of every map. |
| `AInfCohomology:AI.7/cohomology` | verified | BS22 Example 1.3(3), pp.2–3; BS22 Theorem 1.8, opening, p.4. Relative prismatic cohomology of the bounded Breuil–Kisin prism is the definition. Its Frobenius isogeny, global sections and specializations are requested at their existing owners; the torus test distinguishes θ̃ from θ. |
| `AInfCohomology:AI.7/twisted-trace` | verified | BMS2 §11.2, first two paragraphs, p.302; BMS2 Proposition 11.10, pp.302–303. The relative base is 𝕊[z], and gr⁰ is unfolded from quasiregular semiperfectoid algebras. Coefficient grading, Bott maps and the Frobenius twist distinguish this construction from absolute TC⁻ or π₀ of a smooth algebra. |
| `AInfCohomology:AI.7/trace-descent` | corrected | BMS2 Proposition 11.15, p.305; BMS2 Proposition 11.15, p.305, last sentence. Bott inversion and the cyclotomic Frobenius give descent through φ_𝔖 with the specified Frobenius. Replaced a source quotation with prose; the displayed composite verifies the compatibility left implicit in the paper. |
| `AInfCohomology:AI.7/trace-prismatic-agreement` | corrected | BS22 Example 1.9(3), pp.5–6; BS22 §15.2, first paragraph, p.105. The colimit construction identifies the trace and prismatic complexes using the Nygaard graded pieces. Replaced quotation punctuation around the incorrect reference with prose; agreement of specialization maps remains the explicitly open clause (b). |
| `AInfCohomology:AI.7/ainf-base-change` | corrected | BS22 Theorem 1.8(5), p.4; BS22 Example 1.9(2), p.5. Corrected the global step to use PR.1’s qcqs global prismatic base-change theorem followed by the natural PR.6 sheaf comparison. Removed the completed-sheaf-tensor citation that cannot justify arbitrary global Čech interchange; naturality and multiplicativity retain G-MAPS. |
| `AInfCohomology:AI.7/de-rham-base-change` | verified | BS22 Theorem 1.8(3), p.4; BS22 Theorem 1.8(3), p.4, second sentence. The scalar map is θ̃_𝔖∘φ_𝔖, not evaluation u↦π. Perfection of O_K as a 𝔖-module permits ordinary derived tensor and global sections; equality with the prior AΩ comparison remains an additional map-agreement question. |
| `AInfCohomology:AI.7/crystalline-base-change` | verified | BS22 Theorem 1.8(1), p.4; BS22 Theorem 1.8(5), p.4. The scalar map is Witt Frobenius followed by u↦0. The source crystalline comparison includes the Frobenius twist; equality with the CK map after the appropriate base change is not silently assumed. |
| `AInfCohomology:AI.7/perfect-cohomological-modules` | verified | BMS2 Definition 1.1, p.201; BMS2 Theorem 1.2(1), p.201. Proper smooth cohomology is perfect and gives finitely presented broad Breuil–Kisin modules that become free after p-inversion. The request extends R07.4 beyond its finite-free bounded-height category. |
| `AInfCohomology:AI.7/bkf-tensor-functor` | verified | BMS1 Proposition 4.32, p.281; BMS1 Proposition 4.32, proof, p.281. Base change along f gives the BKF object, with Frobenius and completed descent detected by the flat coefficient extension. Existing module classification and prismatic evaluation are imported, not replanned. |
| `AInfCohomology:AI.7/twist-compatibility` | corrected | BMS1 Corollary 4.33, proof, pp.281–282; BMS1 Corollary 4.33, p.281. Recomputed the period-ring twist through finite-level conormal generators and transition maps, preserving G_{K∞}-equivariance. Replaced the source quotation with the reader’s cotangent-complex paraphrase. |
| `AInfCohomology:AI.7/frobenius-decalage` | verified | BS22 Theorem 15.3, p.103; BS22 Theorem 15.3, p.103, last sentence. The décalage/Frobenius factorization is on the required Frobenius pullback. The derived completion and E-inversion hypotheses match the imported PR.3 statements; no untwisted filtration is claimed. |
| `AInfCohomology:AI.7/nygaard-nondescent` | verified | BMS2 Remark 11.16, p.307; BMS2 Remark 11.16, p.307. Checked both cases: for p∤e, the coefficient projection already cannot descend; if the ideal descends, the elliptic-curve obstruction applies. For unramified K the suggested elliptic counterexample does not exist. The ramified j-invariant repair is explicit. |
| `AInfCohomology:AI.7/choice-transport` | verified | BMS2 §1.1, p.200; BMS2 Notation 11.1, p.298. Transport is first over A_inf through intrinsic AΩ, with identity and cocycle. Descent to coefficient rings needs coherent Čech data supplied by DD1; object detection alone does not descend the map. |
| `AInfCohomology:AI.7/comparison-diagram-agreement` | corrected | BS22 §17, first paragraph, p.117; BS22 Theorem 17.2, p.117. Perfect-prism uniqueness requires functors on all smooth algebras over the perfectoid ring, plus checking generator maps. It does not apply to the Breuil–Kisin or A_cris base. Replaced the source quotation with a paraphrase; remaining checks stay G-MAPS. |
| `AInfCohomology:AI.7/de-rham-torsion-divisibility` | verified | BMS2 Remark 1.4, p.202; BMS2 Remark 1.4, p.202. For π^p=p, θ_𝔖 factors through Z_p and proper cohomology base changes from a perfect Z_p-complex. DVR decomposition then makes every cyclic torsion length a multiple of p, not merely the total length. |

## Validation and orchestration

- Packet checker with the pinned declaration index: **0 errors, 0 warnings**.
- Suggested Lean file: **exit 0**, only 23 unfinished-proof warnings.
- Reader: every node statement, hypothesis, proof step, acceptance condition and direct prerequisite matches the packet. All signature/API/test names occur in both reader and suggested file. The old properness, multiplicativity, completeness-ordering and omitted-node divergences are resolved.
- Target coverage, internal cycles, supplier return paths and planet caps checked; all fourteen source-finding review records belong to this job.
- Submission-path and JSON checks are run on the final five deliverables before submission; the handoff records their result.

No clarification is needed to accept this pass. The orchestrator should incorporate the already accepted AUDIT-35 review into the aggregate library-coverage register, retain CP.3→AI.6 when integrating links, and route the rank-one GAGA extension to AdicSpacesPartII:F0 or its immediate successor. G-MAPS needs exact specialization-map agreement proofs, not merely object isomorphisms. G-INPUTS, G-CURVE, G-LEAN-GEOMETRY and G-LEAN-CONTINUATIONS likewise remain the precise follow-up boundaries already listed in the packet. This review claims no second job and does not promote or alter atlas data.
