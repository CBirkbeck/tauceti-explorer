# REV-DESIGN-LocalGaloisDeformationRingsPartII

**Accepted after correction.** Issue #3562. Independent reviewer: Codex, session `codex-wt6jhc`, 19 October 2026. The original design was by a different session, `codex-Gy9mlR`; its merged handoff and all four design files were read.

The review verifies all 40 target nodes and all 14 baseline citations. Eighteen nodes have corrected test metadata or examples; the other 22 are verified unchanged. No nodes, APIs, gaps or prerequisites were added, removed or replaced. The main mathematical statements and the roadmap definition need no change. The resulting packet has 68 API items, 63 Checks, 33 planets, eight **planned** stages, no recorded gaps and six explicit supplier requests. Nothing is marked closed or implemented.

## Corrections made

1. `T.3/monomial-etale-module`: the star anti-automorphism is at the end of BHHMS §2.1, **p.13**, not p.12. Packet and reader now agree.
2. All 63 test kinds were `example`, outside PROTOCOL §12's five-kind vocabulary. They are now 34 computations, nine degenerate cases, four compatibility checks, six characterisations and ten non-examples. The reader displays these classifications.
3. `matrix_conjugation_order` was false as a distinguishing test: diagonal matrices cannot detect this order. With P the coordinate swap, D=diag(1,2) and C=E₁₂, the lower-left entries of Ad(P⁻¹D)(C) and Ad(DP⁻¹)(C) are respectively 1/2 and 2. Replaced the statement and added its two rational matrix products to the suggested file.
4. `matrix_embedding_sign` now uses degree three: in degree two the positive and negative indices coincide. `orientation_weighted` now computes the p=5 weighted exponents. `tameType_modp` uses a nontrivial p=7 character, so inverse reciprocity is detectable.
5. `monodromy_E_factor` now checks the trivial rank-one module on u′e using λ_an=(E/p)φ(λ_an). `monodromy_basis_derivative` computes the contribution of B=1+u′. `cyclofree_tensor_needed` uses the pair (1,ω). These replace instructions to find examples with actual examples.
6. `chart_residual` now sets all eight formal parameters to zero modulo ϖ, including the starred **increments**, while preserving the nonzero starred residual values. `chart_table_index` now uses two different degree-two Hodge labels to detect their reversal.
7. Added and independently confirmed two source misprints, E1 and E2, plus their version provenance. Their formulas already have the intended conventions in the target plan; no theorem statement changes. Added the reader's review/provenance note and this report.

Items 3–6 change nine test statements in total. All target statements, hypotheses, proof steps, acceptance conditions, APIs, tests and requests were compared with the reader after these edits. The roadmap JSON was reviewed and deliberately left unchanged.

## Source checks and versions

Read every node locator in the four public PDFs listed in the packet, and independently verified all four SHA-256 hashes. The BHHMS text is [arXiv:2009.03127v7](https://arxiv.org/pdf/2009.03127v7), with its own pagination: §§2–4, pp.10–45; Lemma8.1.2, p.88; Theorem8.3.9 proof, pp.101–102; references, pp.110–112. The other source checks are [Elkik, §0.2 and Lemme1, pp.555–557](https://www.numdam.org/item/10.24033/asens.1258.pdf), [GHLS v3, TheoremD p.4, conventions pp.5–6 and Theorem3.1.5 p.21](https://arxiv.org/pdf/1506.01050v3), and [Hamann, Theorem4 and proof, pp.155–156](https://msp.org/pjm/1975/61-1/pjm-v61-n1-p17-p.pdf). No restricted book was needed. No source passages or source-section summaries were added.

**E1** concerns BHHMS Table5's final note, v7 p.45: its U₂,U₃ coefficients come from Tables2–3, rather than Tables1–2. Figure2 and the displayed chart formulas determine the correction.

**E2** concerns the displayed type-label bijection in the proof of Theorem8.3.9, v7 p.102: its domain needs the inverse-determinant norm twist on σ_v, matching the type-indexing condition immediately above. The positive exponent in that one line is inconsistent with that condition and §4.3. This changes the label, not a theorem conclusion or the roadmap's existing convention.

Both slips remain in the [Herzig author PDF](https://www.math.toronto.edu/~herzig/GK.pdf), printed pp.47 and105, respectively. The packet records its hash and distinguishes it from v7. Checked the latest arXiv history, the publisher article page, Crossref update/relationship metadata and Herzig, Breuil and Schraen publication pages; no correction for these slips was found. The [journal landing page](https://link.springer.com/article/10.1007/s00222-023-01202-8) offers subscription access; its PDF endpoint served HTML. The full journal text was not read, and neither finding makes a claim about it. Both findings have their own confirmed reviewer verdict and are limited to the two texts read.

## Baseline confirmation

Every declaration below was read with its ambient variables and typeclass hypotheses at **Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174**, the checked shared source revision. Tau Ceti's declared baseline remains **f790474821cf4256814db967cb154e7af3d0c369**; no Tau Ceti declaration is cited in this packet's baseline list. No baseline citations were removed or fixed.

| Declaration | Confirmed statement needed by this plan |
| --- | --- |
| `MvPowerSeries` | Existing coefficient-function carrier for formal series. |
| `MvPowerSeries.C` | Constant-series ring homomorphism. |
| `MvPowerSeries.X` | The single-variable monomial series. |
| `Ideal.span` | Submodule-generated ideal. |
| `Ideal.span_le` | Containment iff every generator belongs to the target ideal. |
| `Ideal.Quotient.ring` | Ring quotient by a two-sided ideal; all uses here are commutative. |
| `Matrix.det_fin_two` | Two-by-two determinant formula over a commutative ring. |
| `Polynomial.derivative` | Formal derivative as a coefficient-linear map. |
| `IsAdicComplete` | Separatedness and precompleteness for powers of the specified ideal. |
| `Fintype.card_fin` | Fin n has cardinal n. |
| `PowerSeries.exists_isWeierstrassFactorization` | Maximal-adically complete local coefficients and nonzero residue series give a distinguished polynomial times a unit. |
| `PowerSeries.isWeierstrassDivision_weierstrassDiv_weierstrassMod` | Division under the same complete-local/nonzero-residue assumptions, with the stated distinguished-degree remainder. |
| `IsLocalRing.maximalIdeal` | Nonunits form the maximal ideal in a commutative local semiring. |
| `IsLocalRing.notMem_maximalIdeal` | Exclusion from that ideal is equivalent to being a unit. |

The exact modules are retained in `baseline.declarations`. In particular, neither completeness alone nor a name match was treated as supplying Weierstrass preparation without its nonzero-residue hypothesis.

## Closure, ownership and downstream work

Read the actual direct supplier statements: completed evaluation/tensor products, Artinian limits and relative cotangent spaces in R03.1; regularity/UFD/descent in R03.3; flat reduced quotients by points and component tensor products in R03.4; square-free monomial components in R03.6; R07.4's coefficient, finite-height and étale-module nodes; R08.1/R08.3 and the parent's height-lattice moduli target L7; MP.3's weight/translation/tame-weight objects; and MP.5's adjoint decomposition and lifting-length results. The packet does not mistake their weaker special cases for the requested family interfaces.

The six remaining contracts are precise and have named direct consumers:

- ClassFieldTheory Layer7: geometric fundamental characters, arithmetic Artin/Frobenius and reduction compatibility. Its existing geometric map is explicitly defined by inversion.
- LocalFieldsRamification Layer4: the tame quotient after the specified Kummer tower, preserving the chosen unramified coordinate. Its existing tame-quotient objects remain the carriers.
- R07.4: arbitrary finite height, complete local coefficients and tame descent; contravariant realization; relative analytic monodromy and complete-family comparison; the Kummer-invariant theorem.
- R08.3: compact tame-type normalization and lattice reduction; extended-Fontaine–Laffaille crystalline seeds, GHLS lifting and the Hodge-sign/dual dictionary. GHLS requires n≠p and width≤p−n, and uses the opposite cyclotomic-weight convention.
- MP.3: finite-group Deligne–Lusztig reduction in its existing translation coordinates, including its depth and ν conditions.
- R03.3: Hamann's local power-series cancellation and the finite-residue-field correction making the crossing isomorphism F-linear. No preferred cancellation map is asserted.

These requests remain open; a planned stage is not a closed stage. None of the targets claims general arbitrary henselian approximation, a new Kisin carrier, a second weight lattice or a second universal deformation ring. The eight-stage local dependency graph is acyclic and every stated stage target is represented: counts are 5,4,3,9,3,8,3,5. The delicate closure checks are recorded individually below, especially actual coupled tails, geometric integrality after coefficient extension, nonempty Hodge profiles, stable versus cancelled presentations, and the integral intersection witness.

The reviewed library audit has no entry for this new PartII or its parent. Read the related deformation-algebra audit, treating built evaluation, regularity and Weierstrass infrastructure as imports. Checked current Tau Ceti and the nine post-snapshot roadmap Suggested files, including OperatorTheory's nested files: no Kisin gauge/monodromy or potentially crystalline presentation target duplicates these nodes. Read LocalGaloisGroups and ProfiniteArithmetic as upstream style/comparison references. Current roadmap and library checkouts were read only. Their newer work is not represented as a declaration at the older baseline.

This extension is downstream of its parent and all its listed suppliers. The current Caraiani–Newton order places R03/R07 at tier10 and the parent at tier15; this new extension and the MP roadmap are outside that 94-roadmap list. No upward citation is imposed on a current-tier plan by this review, and no target moves owner. Packaging must wait for its suppliers, including the requested interfaces.

The BHHMS incoming tame route has **34 items**, with exact coverage including the imported MP.3 tame-weight set. Its old Barsotti–Tate title does not restrict the actual Hodge profiles (3,0),(2,1). Independently compared the split proposals to their extraction routes: **102 BIP items**, **65 PQ items**, and **29 weight-zero items**, with no loss or addition. The original ComponentsAndNormality identity/brief and weight-zero identity/brief are preserved. These are separate design proposals, not prerequisites or purportedly reviewed mathematical plans. No source rereading for those separate directions is claimed here.

## Per-node verification

All BHHMS locators below refer to v7. “Corrected” includes the test-kind repairs; mathematical target statements remain verified. Full ids have the prefix `LocalGaloisDeformationRingsPartII:`. The packet's `review.checked` contains the same verdicts and reasons.

| Target | Verdict | Locator | Check |
| --- | --- | --- | --- |
| `T.0/tame-type` | corrected | BHHMS23: Definition 2.3.1, equations (11)–(12), p. 14; §2.2, p. 13 | The geometric fundamental-character convention, Teichmüller lift and reduction agree with the source; the new p=7 check distinguishes inversion. Test kinds now follow PROTOCOL §12. |
| `T.0/genericity` | corrected | BHHMS23: Definitions 2.3.3–2.3.4, pp. 14–15 | The strict inequalities and existential presentation are retained; semisimplified-inertia genericity does not imply semisimplicity. The p≥29 boundary is correct. Test kinds now follow PROTOCOL §12. |
| `T.0/orientation` | corrected | BHHMS23: Remark 2.3.6 and equation (13), p. 15 | The endpoint f′−1−j′ orders the weighted exponents, not their individual digits. The new p=5 example detects both errors. Test kinds now follow PROTOCOL §12. |
| `T.0/presentation-depth` | verified | BHHMS23: Remark 2.3.5, p. 15; §4.1, pp. 24–25 | The one-unit loss is exactly the source remark; 13-generic normalization supplies the chosen 12-deep input without strengthening the claim. |
| `T.0/type-jordan-holder` | verified | BHHMS23: Proposition 2.4.3, p. 16; Remark 2.4.5(iv), p. 17 | The Jordan–Hölder formula keeps its 1-deep and ν∈η+Λ_R hypotheses and norm-determinant twist. Missing compact-type and finite-group comparisons are explicitly requested. |
| `T.1/eigenbasis-matrices` | corrected | BHHMS23: Definition 3.1.1 and Remarks 3.1.2–3.1.3, pp. 18–19 | The negative embedding index and ordered conjugation match the definition. Replaced the false diagonal test by two distinct off-diagonal rational products and fixed the degree-two sign-test degeneracy. Test kinds now follow PROTOCOL §12. |
| `T.1/shape` | corrected | BHHMS23: Definition 3.1.4 and the preceding minor criterion, p. 19 | The Iwahori is upper triangular modulo v; the double coset and permutation-times-translation convention give the three stated sample shapes. Test kinds now follow PROTOCOL §12. |
| `T.1/gauge-basis` | corrected | BHHMS23: Definition 3.1.6 and Proposition 3.1.5(i)–(ii), pp. 19–20 | The degree bounds, pivot units and lower-left v factor match the gauge predicate; the diagonal action preserves the fixed residual basis only in its reduction kernel. Test kinds now follow PROTOCOL §12. |
| `T.1/gauge-existence` | verified | BHHMS23: Proposition 3.1.5, p. 19 | The (h+1)-generic existence theorem and diagonal torsor, including the fixed residual basis, agree with the source. Completeness is imported for the limiting construction. |
| `T.2/monodromy-derivation` | corrected | BHHMS23: Proposition 3.1.7 and the series preceding (16), pp. 20–21 | The relative coefficient hypotheses, Leibniz rule, E-twisted Frobenius equation and normalization are retained. The new rank-one calculations detect a missing E or derivative term. Test kinds now follow PROTOCOL §12. |
| `T.2/monodromy-condition` | corrected | BHHMS23: Definition 3.1.8 and following paragraph, p. 20 | Analytic regularity is the stated condition; at height h it has h−1 jets. Height one is empty and height three requires both value and derivative. Test kinds now follow PROTOCOL §12. |
| `T.2/jet-equations` | verified | BHHMS23: Equation (16), Proposition 3.1.9, pp. 21–22; proof of Proposition 4.2.1, p. 29 | The source bounds L≥2h−3 and (L−1)(p−1)≥h are retained. At h=3,L=N−1 the two errors have exponents N−3 and N−4; they are the actual coupled tails. |
| `T.3/good-pair` | corrected | BHHMS23: Definition 3.2.1 and Remark 3.2.2, p. 22 | Orbit primitiveness is the nondivisibility condition in the definition. Singleton orbits impose no condition, while the nonsplit scalar example fails it. Test kinds now follow PROTOCOL §12. |
| `T.3/deep-pair-good` | verified | BHHMS23: Lemma 3.2.3 and proof, p. 22 | For a two-cycle the strict digit differences give 0<|c₀−c₁|<q; the highest nonzero digit dominates all smaller ones. Reduction modulo q+1 proves the required nondivisibility. |
| `T.3/monomial-etale-module` | corrected | BHHMS23: Definition 3.2.4, p. 22; end of §2.1, p. 13 | The monomial matrices and contravariant realization agree. Corrected the star anti-automorphism reference from p.12 to p.13; reversal, coefficient change and Laurent entries remain explicit. Test kinds now follow PROTOCOL §12. |
| `T.3/tame-representation` | corrected | BHHMS23: Definition 3.2.5 and preceding paragraph, pp. 22–23 | The constructed representation is the unique tame extension of the restricted module, using the requested tame-quotient equivalence. This does not assert uniqueness for arbitrary Galois extensions. Test kinds now follow PROTOCOL §12. |
| `T.3/unramified-twist` | verified | BHHMS23: Lemma 3.2.6, p. 23 | The product of diagonal coefficients gives the unramified character at arithmetic Frobenius, with the source contravariance and no extra inverse. |
| `T.3/tame-classification` | verified | BHHMS23: Proposition 3.2.7 and equation (19), p. 23 | Classification retains the finite coefficient extension and scalar unramified twist. It does not assert uniqueness of the diagonal data D. |
| `T.3/cyclotomic-free` | corrected | BHHMS23: Paragraph before Lemma 3.2.8, p. 23 | The prime-to-p unramified triangularizing extension and exclusion of ω are retained. The new pair (1,ω) distinguishes cyclotomic freeness of ρ₁ from that of ρ₁∨⊗ρ₂. Test kinds now follow PROTOCOL §12. |
| `T.3/restriction-hom` | verified | BHHMS23: Lemma 3.2.8, pp. 23–24 | Full faithfulness assumes the tensor representation is cyclotomic free; its nontrivial invariant theorem is an explicit R07.4 request, not a routine consequence of irreducibility. |
| `T.3/restriction-isom` | verified | BHHMS23: Corollary 3.2.9 and proof, p. 24 | The source imposes 2-genericity on ρ₁ and obtains isomorphism descent via the adjoint obstruction; no stronger full-faithfulness assertion is substituted. |
| `T.4/admissible-types` | corrected | BHHMS23: §4.1, equations and discussion before Lemma 4.1.1, p. 25 | The three admissible shapes, reversed star convention and N−1 depth agree with §4.1; the normalized semisimple N≥12 data remain separate hypotheses. Test kinds now follow PROTOCOL §12. |
| `T.4/residual-kisin-module` | verified | BHHMS23: Lemma 4.1.1 and proof, pp. 25–26 | Existence and uniqueness concern the semisimple residual Kisin module of the specified shape. The coefficient/descent extension needed by its category is explicitly requested. |
| `T.4/weight-shape-bijection` | verified | BHHMS23: Lemma 4.1.2 and equations (20)–(21), pp. 26–27 | The excluded label is an extreme shape, and the allowed tuples give exactly 2^f types. The MP.5 lifting-length input is present for exhaustiveness, not just injectivity. |
| `T.5/small-hodge-quotient` | corrected | BHHMS23: Opening of §4.2, pp. 27–28 | The finite union is defined by the intersection of the existing fixed-profile kernels, with both (3,0) and (2,1), framing and unrestricted determinant. Test kinds now follow PROTOCOL §12. |
| `T.5/chart-models` | corrected | BHHMS23: Tables 1–3, pp. 41–43; proof of Proposition 4.2.1 and equation (23), pp. 28–31 | Checked all three matrices, five-equation lists, units and Hodge factors directly against Tables1–3. Corrected the residual specialization to kill starred increments and made the reversed Hodge index a degree-two example. Test kinds now follow PROTOCOL §12. |
| `T.5/irreducible-crossing` | verified | BHHMS23: Lemma 3.3.1 and proof, p. 24 | The crossing lemma applies over any complete DVR with a unit perturbation; irreducibility plus the imported regular-local UFD result gives a prime. Different residues are a sufficient distinction test, not an iff. |
| `T.5/jacobian-bound` | verified | BHHMS23: Lemma 4.2.3, p. 31 | The eliminated middle equation has the two distinct factors and the exact identity gives p³ in its Jacobian ideal; the outer charts give the stronger p² bound. Unit b−1 is essential. |
| `T.5/chart-approximation` | verified | BHHMS23: Proof of Proposition 4.2.1, pp. 31–32; Elkik73: §0.2 and Lemme 1, pp. 555–557 | Elkik specializes to k=0,h=3 and n>6. Newton correction is p^(n−3); n=N−5 yields N−8 precision, and the cotangent argument gives surjectivity rather than injectivity. |
| `T.5/nonempty-profiles` | verified | BHHMS23: Proof of Proposition 4.2.1 and equation (26), p. 32; GHLS17: Theorem D, p. 4; §1.2, pp. 5–6; Theorem 3.1.5, p. 21 | Nonemptiness uses an actual extended-Fontaine–Laffaille crystalline seed and the GHLS criterion with n≠p and width≤p−n. The seed and Hodge-sign dictionary are explicitly requested; dimension alone is not used. |
| `T.5/gauge-galois-comparison` | verified | BHHMS23: Equation (22) and its explanation, p. 29 | The comparison retains 2f gauge variables versus four framing variables, the unfixed determinant and the complete-family monodromy interface; no missing Kisin carrier is silently assumed implemented. |
| `T.5/ambient-automorphism` | verified | BHHMS23: Lemma 4.2.4 and proof of Proposition 4.2.1, pp. 30–33 | One ambient automorphism transports all polynomial factors and the actual coupled tails modulo p^(N−8). Nonemptiness, geometrically integral components and the point criterion supply injectivity. |
| `T.6/single-presentation` | verified | BHHMS23: Proposition 4.2.1, pp. 28–33 | The stable single-type presentation, reversed embedding labels and globally summed component kernels agree with Proposition4.2.1; no independent local perturbations are introduced. |
| `T.6/single-components` | verified | BHHMS23: Proposition 4.2.1, pp. 28–33; dimension statements in the proof of Proposition 4.3.1, p. 38 | The two factors per embedding remain distinct after finite coefficient extension, giving 2^f components. The smooth-variable balance gives relative dimension 3f+4−2f=f+4. |
| `T.6/special-fibres` | verified | BHHMS23: Corollary 4.2.6 and equations (27)–(28), pp. 33–34; Lemma 8.1.2, p. 88; Hamann75: Theorem 4 and proof, pp. 155–156 | The disjoint square-free crossing factors give reduced special fibres with smooth components. Hamann cancellation and finite-residue coefficient correction are explicitly requested; smoothness of the entire crossing is not claimed. |
| `T.7/common-charts` | corrected | BHHMS23: Proposition 4.3.1, pp. 34–38; Figure 2, p. 38; Tables 4–5, pp. 44–45 | Checked Figure2 and Tables4–5, including the ninth parameter and outer linear equations. Actual tails and a_i can depend on the whole type. E1 corrects only a source cross-reference. Test kinds now follow PROTOCOL §12. |
| `T.7/weight-union` | corrected | BHHMS23: Opening of §4.3, p. 34 | For a fixed weight, precisely the allowed 2^f types form a finite union by intersection of their kernels, with the existing norm-determinant convention. Test kinds now follow PROTOCOL §12. |
| `T.7/multiple-presentation` | verified | BHHMS23: Proposition 4.3.1 and proof, pp. 34–38 | The tangent pole inequality retains r_j+3<p−1. The complete-local point criterion and restriction descent give the presentation; distinct type branches separate after inverting p, yielding 4^f components. |
| `T.7/exact-q-ideals` | corrected | BHHMS23: Lemma 4.3.2, p. 39; Remark 4.2.5, p. 33 | All six generators of each exact Q ideal match Lemma4.3.2. Local containment is into the global sum of profile ideals; equality is asserted only after summing in the all-(2,1) case. Test kinds now follow PROTOCOL §12. |
| `T.7/p-membership` | verified | BHHMS23: Proposition 4.3.3 and proof, pp. 39–40 | The witness uses (Q₁∩Q₂)+P_(3,0), or its table5 counterpart, with the actual transported middle ideal. After dividing the displayed relation by p, the remaining coefficient is a unit; the conclusion concerns p, not ϖ. |

## API, Lean and validation

All 18 definitions/constructions have at least three mathematical Checks and a usable API tied to recorded downstream uses. The 68 API items distinguish constructors, matrix projections, intrinsic characterisations, coefficient/basis compatibility and the finite-union quotient maps. Extensionality for predicates is logical; existing ring/module structures and their universal properties stay with their suppliers. All 33 planets name source definitions, constructions or central theorems, at most six per layer.

The suggested file remains compact: **220 lines**, three light definitions with actual bodies on existing matrix/ring/ideal carriers, finite algebraic milestones and representative examples. Heavy Kisin/analytic/Galois carriers stay in the reader. There is no sorry-defined data, fabricated carrier or claim that the Galois presentations have been formalized. The newer compact-file rule in WORKERS.md governs the subset shown in Lean.

Validation completed on 19 October 2026:

- `python3 scripts/check_blueprint.py research/blueprint/packets/LocalGaloisDeformationRingsPartII.json`: zero errors and zero warnings.
- Source-issue and source-version validators: no errors.
- Independent consistency checks: all 40 node statements/hypotheses/proof steps/acceptance conditions, 68 API items, 63 typed Checks, source locators and six requests agree with the reader; stage coverage, local acyclicity and all route sets verified.
- Independently evaluated the two repaired rational matrix products.
- `lean-check research/blueprint/suggested/LocalGaloisDeformationRingsPartII.lean`: exit0 at the pinned shared build, with only declaration-uses-sorry warnings. Available memory was 85GiB before the final check; no build, cache fetch or language server was started.
- `research/blueprint/intake.py check-files` on the five changed deliverables/handoff: zero problems; `scripts/check_sorry_data.py` on the suggested file: clean.
- `git diff --check`: clean.

## Questions for the orchestrator

No mathematical clarification blocks acceptance. Retain the six open contracts when packaging, and route the two independent continuation proposals to their own design jobs. E1/E2 are confirmed preprint/author-copy findings; a journal-text comparison would be a separate collation task if the version of record becomes accessible. No upstream files or other jobs were changed.
