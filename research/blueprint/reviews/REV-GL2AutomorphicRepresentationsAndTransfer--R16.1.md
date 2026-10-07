# Independent review of GL₂ automorphic representations and transfer, R16.1–R17.2

Accepted after corrections. Reviewer: Codex, session `codex-Xbu7dT`, issue #410, 7 October 2026. Review identifier: `independent-review-REV-GL2AutomorphicRepresentationsAndTransfer--R16.1`. This is an independent review of the finished target-level pass, not an implementation or a declaration that its supplier work is finished.

The [packet](../packets/GL2AutomorphicRepresentationsAndTransfer--R16.1.json) contains a verdict and reason for every node. All baseline citations were independently confirmed. The eight stages remain `planned`; none is `closed`. Their targets have nodes, and their `remaining` lists now identify the requests and gaps affecting each stage. Packet status `complete` means this pass is finished under the protocol's budget.

| Item | Received | Reviewed result |
| --- | ---: | ---: |
| Nodes | 54 | 55: 38 verified, 16 corrected, 1 added, 0 unverifiable |
| Node kinds | — | 38 theorems, 7 constructions, 5 definitions, 4 comparisons, 1 application |
| API items | 47 | 48 |
| Unit tests | 37 | 37, including two corrected statements |
| Planets | 42 | 42, all retained |
| Baseline declarations | 17 | 17 confirmed; 0 removed or replaced |
| Public sources | 18 | 19 |
| Supplier requests | 29 | 32 |
| Gaps | 7 | 8 |
| Source issues | 4 | 4 confirmed; 0 rejected or newly added |

**Corrections and the added node.** Node names below have the common prefix `GL2AutomorphicRepresentationsAndTransfer:`. Every substantive change to the mathematical plan is listed here.

| Node | Correction |
| --- | --- |
| `R16.1/k1` | Added `k1_mono` to the API and suggested Lean file: increasing the ideal-power level decreases the subgroup. The last-row convention agrees with AKY. |
| `R16.1/local-adelic-compact-comparison` | Integral-point topology comes from RG2.0, rather than the RG2.4 decomposition stage. Added that request; archimedean compact groups come from AF.1, and AA.1 supplies restricted-product topology. |
| `R16.1/iwasawa-cartan` | Corrected JL printed page 45 to page 46, equation (3.1). Retained the normalized modulus `|a/d|`; distinguished RG2.4's finite-place decomposition from AF.1's archimedean input. |
| `R16.2/newvector-conductor` | Replaced the forward reference to the subsequent Casselman theorem by the independent existence node below. Changed the ramified Steinberg test to `a ≥ 2` and `2a ≠ 1+a`: at `a=1` the two expressions coincide, so that case cannot distinguish them. The Lean example agrees. |
| `R16.2/cdt-vexing-type` | Replaced the broad R01.1 prerequisite/request by `R01.1/compact-subgroups-stabilise-lattices`, whose statement supplies the actual stable-lattice input. No canonical lattice is asserted. |
| `R16.3/principal-series-parameter` and `R16.3/cdt-inertia-multiplicity` | Added CFT Layer 9 and its precise request for the topological Weil-abelianization reciprocity theorem over finite extensions of ℚp. Corrected the Layer 7 request: the absolute Artin map has dense image, and is not a surjective identification of the full absolute Galois abelianization with the local multiplicative group. |
| `R16.4/strong-multiplicity-one` | Added Cogdell's public Fields notes, Theorem 9.3, printed pages 74–75. Casselman's Theorem 2 has a finite exceptional set of finite valuations and already assumes agreement at infinity; it is retained with that weaker scope. The Rankin–Selberg proof and AL.3 request now require the omitted archimedean factors, as well as the omitted finite factors, to be zero- and pole-free at the comparison point. |
| `R16.4/cohomological-rationality` | Added ModularForms Layer 8G and its request for Galois stability and the coefficient-field input already used by the proof. Checked the algebraic twist `π_f ⊗ |det|^{−(k−2)/2}`, the `T₁` and `T₀` scalings, and the character-field inclusion. |
| `R16.5/whittaker-integral-comparison` | Corrected the JL unfolding/product locator to pages 183–184, including (11.1.2) and Lemma 11.1.3. The functional equation remains Theorem 11.1 on page 180. |
| `R16.6/primitive-classical-bijection` | Changed “nonunit scalar” to `c ≠ 1` in the normalization counterexample. Every nonzero complex scalar is a unit. The existing Lean example already had the correct condition. |
| `R17.1/real-quaternionic-comparison` | Removed ET.6 as an archimedean supplier: its current contract concerns finite extensions of ℚp. Expanded AF.1's request and the archimedean gap to require the SU(2)/GL₂(ℝ) character comparison, including the elliptic minus sign. Retained degree `k−2`, weight `k`, and norm/determinant twists. Updated the Lean comment. |
| `R17.1/swapped-quaternion-invariants` | Made the swap example conditional on the chosen global algebras `D₀,D`. QFI Layer 6D classifies local quaternion algebras; it does not construct a global algebra with prescribed ramification. Corrected that request, added the global-realization gap, and corrected the Lean parity comment. |
| `R17.2/quaternionic-orbital-matching` | Removed the unrelated equation (16.1.7) from the pages 269–270 locator. Page 270 supplies the elliptic character/orbital-integral relation, with the minus sign and common torus quotient measure. |
| `R17.2/continuous-residual-ledger` | Replaced AS.5, which owns weighted cohomology, by AS.2 for normalized intertwiners in the statement, hypotheses, prerequisites, request and Lean comment. AS.4 supplies the spectral decomposition and AS.6 the invariant distributions and derivative terms. |
| `R17.2/strong-cuspidal-vanishing` | Equation (16.1.7) is on printed page 277, not page 270. Distinguished the preceding K-averaged trace calculation from strong cuspidality's induced-operator vanishing for every left/right translate. The determinant-character trace `−1` remains present. |

Added `R16.2/newvector-level-exists`, with `addedBy` equal to this review's job identifier and the matching `newvectorLevelExists` Lean signature. For irreducible admissible infinite-dimensional complex smooth GL₂(F), it establishes a nonzero last-row K₁ fixed vector at some level before taking a minimum. Its direct prerequisites are the K₁ definition, local classification, existing invariants, SR.3 and SR.5. With ψ of conductor O, the Kirillov model of π∨ contains the function supported on O× with value ωπ∨(u). Upper triangular matrices act through the top-left character. Smoothness supplies a small lower-unipotent stabilizer; Casselman's K₀ factorization on page 303 gives the same character on K₀ at a sufficiently large positive level. The requested identity `π∨ ≅ π ⊗ ωπ⁻¹det` converts it to the bottom-right character, which is trivial on K₁ after enlarging the level past the central-character conductor. This uses neither the least conductor nor the subsequent dimension formula. It is a target-level prerequisite, not a decomposition of the dimension proof into implementation lemmas.

Other packet changes are the per-node review object, independent confirmation notes on all baseline entries, review verdicts on all four source issues, the new source record and hash, request consumer lists, and the stage `remaining` lists. No new planet is needed for the auxiliary existence theorem.

**Pinned baseline.** Read declarations and their surrounding variables at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The packet records each module and its exact qualified name. All 17 citations provide the claimed inputs with the recorded scope.

| Declarations | Confirmed scope |
| --- | --- |
| `Matrix.GeneralLinearGroup`, `.det`, `.scalar`, `.det_scalar`, `.map`, `.mkOfDetNeZero` | Existing matrix-unit carrier; determinant over a commutative ring, scalar units and their rank-two square determinant, coefficient ring map, and field construction from a nonzero determinant. No second GL₂ carrier. |
| `Representation`, `Representation.invariants`, `Representation.mem_invariants` | Existing monoid representation and group fixed submodule. The invariants statements use commutative-ring coefficients; subgroup invariants are restriction. These declarations do not supply smoothness or admissibility. |
| `MeasureTheory.Measure.haarMeasure`, `.haarMeasure_self` | Existing locally compact topological-group Haar measure normalized on a positive compact with nonempty interior. Its mass is one. The declarations do not construct a central automorphic quotient measure. |
| `HeckeRing.GL2.Newform`, `.qExpansion_coeff_one` | Positive level, integral weight, nebentypus, new-space membership and normalization. Eigenconditions are at good indices away from the level; bad-prime eigenconditions are not structure fields. |
| `HeckeRing.GL2.Newform.eq_of_forall_notMem_eigenvalue_eq` | Fixed level, weight and character; good-index agreement outside a finite set. This classical theorem does not prove adelic strong multiplicity one over number fields. |
| `CuspForm.LSeries_qExpansion_coeff_eq` | Positive weight and arithmetic level, with `Re(s)>k/2+1`; includes the strict cusp-width factor to power `−s`. |
| `TauCeti.symPowerRep` | Existing symmetric power of the standard GL(n) representation over a commutative ring. The Hilbert tensor/dual conventions are further comparisons, not a replacement carrier. |
| `TauCeti.simple_indFDRep_ofLinearCharacter_iff` | Finite group, normal subgroup, algebraically closed characteristic-zero field. It supplies a finite Mackey analogue; the general Weil-group induction criterion remains a supplier request. |

Read the eight relevant entries of the reviewed library audit and the supplier statements. There is no new planning of the classical Newform, symmetric-power, finite induction or upstream modular-form trace work. The specialized adelic GL₂ trace comparison requires additional singular and continuous distributions beyond the classical Eichler–Selberg formula.

**Public-source checks.** Downloaded and checked the hashes of all 18 received sources, and recorded the nineteenth source's hash. Each node's cited locator, excerpt, hypotheses and use were checked; the packet's individual review notes identify the result. Casselman's scanned pages 301–308 were read visually. The principal passages are listed below; locators refer to printed pagination when the source distinguishes it from PDF pagination.

| Public source | Passages checked |
| --- | --- |
| [Jacquet–Langlands](https://publications.ias.edu/sites/default/files/automorphic-forms-on-gl2_rpl_9.pdf) | Central characters/measures, §3 page 46, §§5–6 and pages 96–97, Definition 10.2, §11 pages 180–187, §15 pages 249–250, §16 pages 262, 268–270 and 277, and the introductory analytical caveat. |
| [Casselman](https://lesesvre.perso.math.cnrs.fr/newforms-references/casselman.pdf) | Entire printed pages 301–308: subgroup convention, Kirillov action, dimension proof, classification, epsilon remark, and the precise scope of Theorem 2. |
| [Newton–Thorne](https://arxiv.org/pdf/2212.03595v2) | Pages 8–11 and 14: Tate normalization, coefficient dual, non-CM and tame induction. |
| [Dospinescu–Le Bras](https://arxiv.org/pdf/1509.00606v2) | Theorem 5.5, scalar-extension/Kirillov discussion and page 64 footnote 52. |
| [Breuil–Mézard, Henniart appendix](https://www.imo.universite-paris-saclay.fr/m/~breuil/PUBLICATIONS/multiplicite.pdf) | Appendix A.1.4–A.1.5, pages 75–76. |
| [Conrad–Diamond–Taylor](https://math.stanford.edu/~conrad/papers/cdtmaster.pdf) | Proposition 4.2.4(3), pages 17–18, and §5 type/lattice input. |
| [Calegari–Geraghty 2018](https://math.uchicago.edu/~fcale/papers/CG.pdf) | §3.9.2, type and lattice conventions. |
| [Calegari–Geraghty 2020](https://math.uchicago.edu/~fcale/papers/Siegel.pdf) | Pages 805–806, oldform dimensions and the one-dimensional exception. |
| [Boxer–Calegari–Gee–Pilloni](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00128-2.pdf) | Pages 178–179, especially §2.4.15 and its GL₂ Hecke symbol. |
| [Haines–Kottwitz–Prasad](https://www.math.umd.edu/~tjh/IHA.apr.09.pdf) | §2.3 Lemma 2.3.1 and §4.6 equation (4.6.1), including normalized spherical projection. |
| [Atobe–Kondo–Yasuda](https://arxiv.org/pdf/2110.09070v4) | Pages 3–4, the K(n,λ) last-row convention. |
| [Colmez–Dospinescu–Nizioł 2020](https://www.ams.org/journals/jams/2020-33-02/S0894-0347-2019-00935-5/S0894-0347-2019-00935-5.pdf) | §5.2.1, pages 347–348, geometry and local/global normalizations. |
| [Colmez–Dospinescu–Nizioł 2023](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/79733067FC7CB7574B408744E4387F91/S205050862300015Xa.pdf/factorisation-de-la-cohomologie-etale-p-adique-de-la-tour-de-drinfeld.pdf) | §4.1.2, pages 38–39, chosen quaternion algebras and local factors. |
| [Pan](https://arxiv.org/pdf/2209.06366) | Corollary 5.4.11 and Proposition 5.5.5, pages 71 and 75–76; retained contextual source. |
| [Cogdell, converse theorems](https://people.math.osu.edu/cogdell.1/PSCT-www.pdf) | Pages 5–6, all twists and analytic niceness requirements. |
| [Langlands, base change](https://sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/book-ps.pdf) | §4 Lemmas 4.5–4.8, §§10–11 openings, including the analytical caveat and quadratic exceptional half-weight. |
| [Arthur–Clozel](https://www.claymath.org/library/cw/arthur/pdf/30.pdf) | Chapter 1 §3 Proposition 3.1, pages 20–22, and §4 opening page 32; compatible centralizer measures and norm matching. |
| [Getz](https://sites.math.duke.edu/~jgetz/aut_reps.pdf) | Pages 32–34, the Casimir calculation and the discrete-series/limit conventions. |
| [Cogdell, Fields lectures](https://people.math.osu.edu/cogdell.1/fields-www.pdf) | Added source: Theorem 9.3 and proof, pages 74–75. The exceptional set may include all infinite places. |

All four received source issues were confirmed at their stated versions: E12 reverses induction from an extension subgroup to its base group; E13 must exclude all one-dimensional representations, rather than only the trivial representation; E14 needs the GL₂ superscript on the Hecke generator; E15 replaces `(k²−1)/4` by `k(k−2)/4` for the notes' stated Casimir. The weight-two value zero distinguishes the latter error. Each issue now has the required review verdict, reason and reviewer job identifier.

**API, tests, signatures and ownership.** Checked every definition/construction's API and at least three tests, including subgroup orientation, normalized vectors, equal Satake roots, nonzero Steinberg monodromy, tame nonexamples and quotient conventions. The suggested file includes the added API, theorem and corrected discriminator. Its opening and adjacent comments expressly identify unavailable supplier conditions, as protocol §13 permits. These prototypes assert no unconditional mathematics for arbitrary carrier parameters. The missing pinned Tau Ceti `.olean` files are disclosed; the file uses parameters for those existing objects, rather than new definitions or a rebuild. All 42 planets denote key definitions, constructions or named theorems.

Checked the confirmed RT-AREA-automorphic-1 findings /2, /9 and /14 against their verification and the accepted RS-21 owner entry, and against both packet and reader. Archimedean limits and the full O(2) model are assigned to the proposed AF.1b/current AF.1 supplier; the installation is still pending. Global Whittaker expansion occurs in R16.4 before multiplicity one, while Mellin/functional equations are in R16.5. AL.0 owns Schwartz–Bruhat theory; AA.0 Haar normalization, AA.1 adelic group points and AA.2 central quotient measures remain distinct interfaces. These corrections already appear in the reader's convention and red-team sections.

**Remaining gaps and questions for the orchestrator.** The eight explicit gaps concern complete archimedean signatures, supplier carriers in Lean, full newvector/ramified-factor interfaces, a worked primitive dyadic example, the downstream Galois normalization handoff, concrete singular/continuous trace calculations, full tensor/supplier conditions in the suggested file, and global realization of prescribed quaternion ramification. Their consumer lists and explanations remain in the packet. General projectivity at fixed central character and analytic Rankin–Selberg input remain precise supplier requests, not claims established by the excerpts.

1. Synchronize the [reader](../readmes/GL2AutomorphicRepresentationsAndTransfer--R16.1.md) with this corrected packet when promoting the review. The issue does not authorize editing it. In particular, update the counts, insert the independent existence step, use the corrected locators and scalar/conductor tests, and propagate CFT Layer 9, ModularForms Layer 8G, AS.2, the finite/archimedean supplier split and the conditional global quaternion example. The reader currently reports the original 54 nodes/47 API items and has the original supplier/citation wording in its node entries.
2. Which owner will supply global prescribed-ramification existence and uniqueness on the existing quaternion carrier, including the global Brauer/degree-index comparison, before R17.3? Local classification and the parity obstruction alone do not suffice. This review introduces no R17.3-to-R17.1 prerequisite cycle.
3. Apply the accepted ownership changes when updating the live campaign: its older R16.5 description still places global expansion there. The reviewed packet and reader correctly place it in R16.4. Install the proposed AF.1b contract or retain the explicit current AF.1 request until installation. These are orchestrator/upstream actions, outside this review's editable files.

**Validation.** `python3 scripts/check_blueprint.py research/blueprint/packets/GL2AutomorphicRepresentationsAndTransfer--R16.1.json` reports zero errors and zero warnings. `lean-check research/blueprint/suggested/GL2AutomorphicRepresentationsAndTransfer--R16.1.lean` exits successfully in the shared pinned Mathlib build; every warning is a declaration using `sorry`. This checks proposed signatures and examples, not proofs of the mathematical targets. `git diff --check` passes. No library build or language server was started.
