# Independent review — HodgeStructuresPartII H.1

**Accepted as a complete target-level planning pass.** H.1 remains **planned**, not closed, with G1–G11 and eighteen supplier requests open. The acceptance concerns the correctness and honest boundaries of the plan; no node is implemented by this review.

Reviewer: Codex, session `codex-qhAh3J`, job `REV-HodgeStructuresPartII--H.1`, Refs #7025. Date: 7 October 2026. The input was written by Codex session `codex-w37Ylo` for #6938; this reviewer did none of that work. The bot confirmed this session’s claim before review began.

Files reviewed: the [packet](../packets/HodgeStructuresPartII--H.1.json), [reader](../readmes/HodgeStructuresPartII--H.1.md) and [suggested Lean file](../suggested/HodgeStructuresPartII--H.1.lean). This report and the [review handoff](../handoff/REV-HodgeStructuresPartII--H.1.md) complete the deliverables.

## Counts and scope

| Item | Input | Reviewed result |
| --- | ---: | ---: |
| Nodes | 36 | 36: 17 verified, 19 corrected |
| Definitions / constructions / lemmas / comparisons / theorems | 4 / 10 / 1 / 3 / 18 | unchanged |
| API items | 59 | 63 |
| Unit-test obligations | 56 | 59 |
| Planets | 6 | 6 |
| Baseline declarations | 13 | 13 confirmed |
| Gaps / requests / ownership proposals | 11 / 18 / 6 | unchanged counts, G1/G5 contracts strengthened |
| Source findings | 1 | 3 confirmed: one inherited, two added |
| Native / omitted node signatures | 2 / 34 | unchanged |

No nodes were added or removed. No baseline citation was removed or replaced. One previously listed baseline theorem was added to the prerequisites of the node whose abelian-rank-two test uses it. All eight scoped targets have exact node witnesses in `coverage.targets`: stable Betti, de Rham and Dolbeault moduli; Riemann–Hilbert; non-abelian Hodge topology; Hodge moduli; fixed-X étale local product; and Hodge flatness. All `implementationStatus` fields remain `unchecked`.

The complete/planned statuses satisfy PROTOCOL §0: one finished target-level pass within the node budget, with every stage target represented and precise remaining obligations. They do not assert closure. The stronger regularity of EG20 /006 remains G10; rigid-locus global splitting and arithmetic/p-adic continuation remain outside H.1, especially in H.5. The source-route manifest of the parent is retained.

## Corrections made in place

1. **Stability.** Both reduced-Hilbert-polynomial and slope tests now require `0<rk(F)<rk(E)`, matching Simpson I p.88. Testing every proper nonzero subsheaf would reject the slope-stable line `(O,0)` on P² because `I_p⊂O` has the same rank and degree. Added that test and allowed coherent-sheaf isomorphisms in the stability API.
2. **Coherent carriers.** H.0’s accepted intrinsic preconnection and symmetric-action nodes use finite locally free E. They do not yet provide the torsion-free coherent operator objects and invariant subsheaves needed here. G1, its consuming nodes, the H.0 request and `coverage.remaining` now explicitly require this extension. Local freeness on the Chern-zero component remains a theorem rather than a carrier assumption.
3. **Family and presentation API.** Added `FixedDeterminantFamily.mk`, `FixedDeterminantFamily.iso_ext`, `HarmonicBundlePresentation.mk` and `HarmonicBundlePresentation.hom_ext`; specified pullback identity/composition for presentation morphisms. Added a test distinguishing stable unrigidified scalar inertia C× from determinant-preserving μ_r. These new names are honest omissions until the carriers exist.
4. **Metric functional inputs.** Donaldson’s functional must be defined on a Higgs bundle with arbitrary background metrics before a harmonic metric is constructed. Removed the harmonic-presentation prerequisite, used direct operator/sheaf suppliers and added a nonharmonic diagonal-metric example with flat determinant but nonzero trace-free curvature. The printed S88 p.882 kernel is correct; its diagonal value 1/2 is obtained by a Taylor limit, not quoted as a separately printed value.
5. **Compactness.** Replaced unspecified Sobolev norms by the exact `1<q<∞`, strong `W^{1,q}→L^q` operator convergence of Simpson II Proposition 7.9. The coefficient bound is L¹, equivalent to any fixed norm on the finite-dimensional holomorphic section spaces. Metric-preserving identifications/unitary gauges and compact U(r) orbit fibres are retained; no q=∞ convergence or algebraic properness of de Rham moduli is asserted.
6. **Formal determinant convention.** End₀ controls based determinant-rigidified Artinian deformations, whose arrows preserve the chosen determinant and reduce to the identity. It does not supply the unrigidified scalar `1+m` automorphisms. The statement, proof, direct family prerequisite, G5 and R09.6 request now retain full determinant-preserving stabilizers and the separate central rigidification-to-coarse comparison. The rank-one acceptance case distinguishes the groupoids even though their coarse rings are both C[[λ]].
7. **Gauge formula.** The formal-product proof uses the genuine exponential action `η↦g⁻¹ηg+g⁻¹d(g)`, `g=exp(s)`. The read preprint’s missing nonlinear derivative term is recorded below; it is not propagated into the plan.
8. **Sources and synchronization.** Corrected twelve locator entries, including S92 Theorem 1 at p.19, Corollary 1.3 at p.20, operator boundedness through p.98, S96 relative quasi-isomorphisms through p.39 and Corollary 9.2 at p.39. Replaced two excerpts absent from their cited passages (`irreducible` and `co-represents`) with printed terms and clarified their mathematical match. Updated the S96 extent to distinguish Conjecture 9.3 on p.40. The reader, coverage remainder, signature register and Lean omission inventory agree with every change.

## Sources and findings

Downloaded all six public primary PDFs afresh and reproduced every packet SHA-256. The source URLs and version receipts are stored in `sources` and `sourceVersions`. Read the cited statements and supporting proofs in the packet’s precise extent register: Simpson I pp.69–74 and 86–119; Simpson II pp.11–12 and 16–38; Simpson 1992 pp.11–28 and 32–40; Simpson 1988 pp.874–895; S96 pp.18–19 and 36–40; and the EG20 moduli/comparison/Hodge passages. This is not a claim to have read every paper in full. Generic imported proofs remain the named gaps, and the Corlette proof remains unread as G8 states.

**Inherited EG20 finding confirmed.** The [published Acta text](https://intlpress.com/site/pub/files/_fulltext/journals/acta/2020/0225/0001/ACTA-2020-0225-0001-a002.pdf), p.108, prints the integrality/variety-name slips recorded by the earlier extraction. The intended exterior integrability conditions and fixed variety justify the corrections. This review adds its verdict and does not claim a new discovery.

**Added published-source finding `E11-S94II-P6.6-H1`.** The last sentence of [Simpson II Proposition 6.6](https://www.numdam.org/item/PMIHES_1994__80__5_0.pdf), published p.17, overstates its degree-zero sub-Higgs-sheaf conclusion. On P² take `(E,θ)=(O²,0)` and `F=I_p⊕0`. E is semistable with all rational Chern classes zero. F is invariant of rank one and degree zero but is not locally free at p, and `E/F=O⊕O_p` has torsion; moreover `c₂(I_p)=[p]`. Thus saturation, equivalently torsion-free quotient, is required. The H.1 node already had that hypothesis; the proof wording and source-match explanation now retain it. The error affects the unrestricted last sentence, not the main local-freeness theorem. Checked the actual printed image. Numdam metadata, title/author/quoted-phrase searches, the author’s current papers page and the atlas register disclosed no correction in this limited search; the packet records these receipts.

**Added preprint finding `E12-S96-gauge-H1`.** In the [S96 arXiv v1](https://arxiv.org/pdf/alg-geom/9604005), §9 p.37, the gauge derivative is printed as `d(s)`. It must be `exp(−s)d(exp(s))`. This is a preprint finding only: arXiv lists only v1, correction searches and the author page found none, and the attempted AMS version-of-record PDF returned HTTP 403. No claim about the published formula is made.

For an explicit check, let `A=C[t]/(t³)`, `η=0`, `s=t(zS+T)`, `S=diag(1,−1)` and `T=E₁₂`. At z=0, `ST=T`, `TS=−T`, `T²=0` and `ST+TS=0`. Hence `d(s)=tS dz`, while multiplication of the finite exponential series gives

`exp(−s)d(exp(s)) = tS dz + t²T dz`.

The missing term is nonzero. Both S and T are trace-free. The correct nilpotent exponential gauge action preserves the intended deformation theory and is explicitly required in G5. This is a formula correction, not a claim that Theorem 9.1 fails. The packet gives independent confirmed verdicts for both added findings and published/preprint version and search receipts for all three.

## Baseline, suppliers and ownership

Read every declaration statement in its cited module at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. Also matched all seven module files byte-for-byte against that commit. The declaration index was used only to locate declarations.

| Pinned declaration | Statement and use verified |
| --- | --- |
| `Representation` | Native monoid homomorphism to module endomorphisms; accepts the coordinate matrix action. |
| `Representation.IsIrreducible` | `IsSimpleOrder (Subrepresentation ρ)` includes nonzero dimension. |
| `Representation.Equiv` | Intertwining linear equivalence supplies the actual class relation. |
| `…algebraMap_intertwiningMap_bijective_of_isAlgClosed` | Finite-dimensional irreducible representation over an algebraically closed field has scalar endomorphisms. |
| `…finrank_eq_one_of_isMulCommutative` | Same field/finite-dimensional/irreducible hypotheses plus commutative action monoid imply dimension one; now directly cited for the abelian test. |
| `Matrix.GeneralLinearGroup` | Units of square matrices, including empty index; no scheme structure supplied. |
| `Matrix.GeneralLinearGroup.det` | Multiplicative determinant to ring units over a commutative ring. |
| `Matrix.GeneralLinearGroup.scalar` | Scalar units give the matrix-unit homomorphism. |
| `Matrix.GeneralLinearGroup.det_scalar` | Determinant of a scalar unit is its power by the index cardinality. |
| `Matrix.GeneralLinearGroup.toLin` | Matrix units identify multiplicatively with invertible coordinate linear endomorphisms. |
| `Units.coeHom` | Underlying monoid homomorphism turns those units into an ordinary representation. |
| `isOfFinOrder_iff_pow_eq_one` | One positive power of the group element is one; using the character as that element enforces a uniform exponent. |
| `SheafOfModules.IsLocallyFree` | Existing module-sheaf local generator/isomorphism predicate; does not by itself assert finite rank or analytic geometry. |

The inspected Tau Ceti `HolomorphicSheaf` source was also matched to `f790474821cf4256814db967cb154e7af3d0c369`. Its functions/germs on C do not provide the general analytic spaces or coefficient bundles required here. No Tau Ceti declaration is mis-cited as that supplier.

Read the reviewed library audit before the review corrections: existing linear HodgeStructures layers are reused; the relevant R09, C0/C1/C2/C5, E1 and SF.5 audit entries do not certify the missing generic exports. Read the precise supplier stage statements for R09.1/.2/.5/.6, C0/C1/C2/C5, E1, SF.5 and MC.2, the accepted H.0 nodes and the finer coherent-analytification node. MC.2 is an explicit realization specification, not an implemented Chern–Weil theorem. Read upstream HodgeStructures and UniversalCovers documents for the roadmap standard, and the actual PDE estimates and DGAInfinity layer 4 for their narrower scopes.

Supplier ownership is sound with the recorded extensions: generic moduli/Quot/reductive GIT under R09; coherent analytification/GAGA and an added compact Kähler bridge under ComplexComparisonPartII; sheaf tensor/exterior under E1; algebraic Chern/realization under SF.5/MC.2; coherent operator/Rees/determinant under H.0. Nonlinear heat/gauge, projective topology and geometric dg Lie interfaces are requested through the six recorded ownership/Part II proposals. No upstream roadmap or another worker’s packet was changed. Every prerequisite resolves to a native declaration, a supplier node/stage, or an honest gap; no circular metric/moduli construction is introduced.

## Node-by-node disposition

The following is the same 36-node register as the packet’s review object. Supplier proof gaps remain open even when the source-backed planned statement is verified.

| Node suffix | Verdict | Evidence and boundary |
| --- | --- | --- |
| `betti-stable-representation` | corrected | Native determinant equality, nonzero irreducibility and intertwining equivalence checked against all seven pinned carriers. Replaced an excerpt absent from the cited S94II pages by representations, separating the irreducible restriction from the source construction. |
| `betti-stable-classes` | corrected | Native quotient has the equality and invariant-function universal properties, without a scheme claim. Added the pinned commutative-monoid finrank theorem used by the abelian rank-two test. |
| `stable-automorphisms` | verified | S94I p.90 scalar endomorphism argument and p.104 base-line ambiguity agree with native Schur and det_scalar. Unrigidified C× and determinant-preserving μ_r are distinct, including rank one. |
| `torsion-determinant-dictionary` | verified | Finite order is one uniform exponent of the character, not pointwise torsion. The torsion-line trivialization induces the finite-monodromy connection in characteristic zero; scaling its trivialization by a projective global constant does not change that connection. Cover/descent and GAGA inputs are requested. |
| `stability` | corrected | Corrected both p- and μ-stability to test 0<rk(F)<rk(E), as in S94I p.88; corrected the S92 polystability locator to pp.18–19. Added the ideal-of-a-point equal-rank test and explicit coherent-operator extension gap/request. |
| `parameter-families` | corrected | Relative λ-differentials and the family determinant condition retain Artinian directions. Added data constructor, arrow extensionality and rigidification-inertia test; scalar inertia is not confused with a determinant frame or a universal coarse bundle. |
| `betti-framed` | verified | S94II pp.11–12 realizes the finite-presentation relations as an affine representation scheme. Irreducibility is open by proper invariant-plane incidence; scheme/fundamental-group supplier gaps are explicit. |
| `betti-coarse` | verified | S94II Proposition 6.1 gives an affine invariant quotient with semisimple Jordan representatives; the irreducible open has ordinary isomorphism classes. Its quasi-affine stable structure does not make it a fine family moduli space. G2 retains the reductive quotient theorem. |
| `operator-boundedness` | corrected | S94I Lemmas 3.3–3.6 and Theorem 3.8 use operator-generation slope bounds, Quot/Hom equations and openness. Extended the locator through p.98 to include the complete proof; global coherent operators and generic boundedness remain supplier obligations. |
| `chern-component` | verified | S94II pp.16–17 imposes all rational Chern classes, not only rank/Hilbert polynomial or torsion determinant. GRR yields rP_O and flat bundles retain possible integral torsion. Family local constancy/Chern–Weil realization is explicitly G4. |
| `higgs-restriction` | verified | S92 pp.32–39 prove finite-extension comparison using dg completion and then operator restriction/Hom comparison. The source-specific statements are nodes; generic restriction and projective Lefschetz proofs remain G6, coherent carriers G1. |
| `higgs-local-freeness` | corrected | S92 Theorem 2 and S94II Proposition 6.6 support the Chern-zero local-freeness theorem. Clarified torsion-free quotients in the proof sketch; independently recorded the missing saturation hypothesis in the printed final sentence, already corrected in this node statement. |
| `dolbeault-coarse` | corrected | S94II pp.16–17 gives the Chern-zero semistable coarse scheme and stable open, with étale-local universal-family ambiguity. Replaced the absent co-represents excerpt by the printed corepresented; fixed Higgs determinant includes trace zero. |
| `derham-coarse` | verified | S94II Theorem 6.13 uses coherent connection local freeness and the operator moduli construction. Stability means irreducibility of the flat object; fixing the algebraic line alone does not fix its connection. G1–G2 retain the required interfaces. |
| `hodge-coarse` | verified | S96 Proposition 4.1 and EG20 pp.131–132 construct relative λ-moduli with exact zero and one fibres. The determinant is (L,λ∇L), nilpotents are retained and flatness is a separate later theorem. |
| `horizontal-sections` | verified | Read the full S94II Lemma 7.4–Corollary 7.6 proof: Artinian uniqueness, one-dimensional extension, induction on relative dimension and horizontal frames. It works over nonreduced analytic bases; scalar C5 alone is insufficient, as recorded in G3. |
| `riemann-hilbert-framed` | verified | S94II Lemmas 7.2–7.7 compare represented framed functors on analytic bases, then Theorem 7.1 gives the analytic isomorphism equivariant for frame change. Universal-cover descent/GAGA and relative Quot/Grauert bridges are explicit inputs. |
| `riemann-hilbert-coarse` | verified | S94II Proposition 7.8 descends the equivariant framed isomorphism through analytic universal categorical quotients. Read S94I Proposition 5.5 proof; its generic analytic reductive quotient and compact-lift inputs remain G2/G9. A point bijection is not used as the proof. |
| `harmonic-bundle` | corrected | The flat metric presentation agrees with S92 metric operators and harmonic-bundle definition through p.18. Corrected the locator, added constructor and morphism extensionality, and specified pullback identity/composition; morphisms need not be unitary and tensor need not preserve stability. |
| `kahler-identities` | corrected | The first-order identities and Lemma 1.2 have different page ranges, now pp.14–17 and pp.19–20. The compact coefficient identities prove integrability/full faithfulness; elliptic Hodge decomposition and integration by parts remain G4. |
| `donaldson-functional` | corrected | Verified the printed S88 p.882 kernel and computed diagonal limit 1/2. Removed a harmonic-presentation prerequisite: the functional must accept arbitrary fixed-determinant background metrics before solving HYM. Added a nonharmonic diagonal-metric test and direct sheaf/operator suppliers. |
| `higgs-metric-existence` | corrected | Read S88 Theorem 1, coercivity, weak eigenprojections, Proposition 5.8, heat continuation and convergence. Corrected S92 Theorem 1(2) to p.19. Compact specialization and polystable summands are valid; generic nonlinear/weak-subbundle machinery remains G7. |
| `chern-weil-flatness` | corrected | S88 Proposition 3.4 and S92 curvature norm argument use degree zero and ch₂ pairing zero, with the curve exception stated. Corrected the S92 locator to pp.16–17 and p.19; primitive-form normalization and Chern–Weil realization remain G4. |
| `flat-metric-existence` | corrected | Corrected the S92 Theorem 1(1) locator to p.19. It states the semisimple harmonic metric criterion; the packet explicitly does not claim to have read Corlette’s existence proof, retained as G8. |
| `harmonic-correspondence` | corrected | S92 Lemma 1.2 and Corollary 1.3 prove operator/morphism compatibility and the semisimple category equivalence. Tightened the locator to pp.19–20. Stable restrictions and torsion determinant agree; underlying bundle stability is not substituted. |
| `hitchin-map` | verified | S94II pp.20–21 and EG20 p.109 give characteristic coefficients with the stated det(tI−θ) signs, weighted scaling and trace-zero fixed determinant. It descends through Jordan equivalence, and zero coefficients mean nilpotent rather than θ=0. |
| `hitchin-properness` | verified | Read S94II Lemmas 6.8–6.10 and complete Theorem 6.11 proof, pp.18–23: spectral support stays finite and the Quot/Hilbert compactification plus invariant quotient gives properness. A closed fixed-det fibre preserves this; the stable open need not. |
| `harmonic-compactness` | corrected | Specified the source L¹ characteristic-coefficient bound, 1<q<∞ and strong W^{1,q}→L^q operator convergence from S94II Proposition 7.9. Normalized-frame fibres are compact U(r) orbits with stabilizers. Generic gauge/Ahlfors/Kempf–Ness inputs remain G9. |
| `nonabelian-hodge-topology` | verified | Read both continuity/properness directions in S94II Lemmas 7.16–7.17 and Theorem 7.18. The conclusion is the global coarse homeomorphism and isolated-point preservation; the stronger EG20 real-analytic wording remains the precisely scoped G10. |
| `hodge-scaling` | verified | S96 pp.18–19 and EG20 Lemma 4.9 scale operator and λ together. Division by nonzero λ is an algebraic family isomorphism preserving the determinant section; no fixed-λ connection scaling or global A¹ product is inferred. |
| `two-types-formality` | corrected | S92 Lemmas 2.1–2.2/Corollary 2.3 supply the two-types dg argument. The S96 relative quasi-isomorphisms reach p.39; locator corrected to pp.38–39. Trace commutes with both operators, permitting the End₀ restriction; generic dg Lie gauge/coarse comparison remains G5. |
| `hodge-formal-product` | corrected | Restricted the End₀ Maurer–Cartan groupoid to based determinant-rigidified deformations, retaining full stabilizers and a separate central coarse-ring bridge. Corrected exponential gauge to g⁻¹dg and locator through p.39; rank-one inertia distinguishes the two groupoids. G5 records the precise supplier obligation. |
| `hodge-etale-product` | corrected | Corrected S96 Theorem 9.1 full-proof locator to pp.36–39. The formal coarse-ring product and Artin approximation yield common étale neighborhoods for fixed X, including nilpotents; Conjecture 9.3 for varying X is not asserted. |
| `hodge-flatness` | corrected | Corrected Corollary 9.2 locator to p.39. Flatness follows by étale descent from products over the field, plus nonzero scaling, not from flat universal quotient sheaves. Smoothness/reducedness are not inferred. |
| `operator-git` | verified | S94I pp.98–104 proves the operator-specific Hilbert criterion, orbit/Jordan comparison and quasi-projective quotient; the delegated pp.71–73 argument gives coarse universality/base-line ambiguity. Generic GIT/Luna remains G2, not replanned here. |
| `operator-framed` | verified | Read S94I pp.105–109, pp.110–114 and p.119: auxiliary frames, free descent, representation of analytic family functors and framed uniqueness. Base-point frames kill inertia; an unframed coarse scheme is not made fine. Global operators and relative analytic Quot remain G1/G3. |

## Validation and prototype boundary

- `python3 scripts/check_blueprint.py research/blueprint/packets/HodgeStructuresPartII--H.1.json`: **0 errors, 0 warnings**. The graph is acyclic, supplier identifiers resolve and the one scoped stage has all target witnesses.
- Source-issue schema and `sourceVersions` validation: **no errors**. Three independent confirmed verdicts, each with a version and locator.
- `lean-check research/blueprint/suggested/HodgeStructuresPartII--H.1.lean`: **exit 0, eighteen `sorry` warnings, no other warnings**. Memory was checked first; only the permitted shared checker was used, with no build or language server.
- Reader/packet/signature inventory checks and `git diff --check`: passed. Only the three reviewed files, this report and this job’s handoff are changed.

Elaboration uses the exact pinned Mathlib revision. The shared Tau Ceti checkout is newer, but the file imports no Tau Ceti module, so the result certifies the native Mathlib subset only. It contains two set-level Betti carriers, eleven API declarations and eight admitted examples. The other 34 nodes, 52 API items and 51 test obligations remain explicit omissions until their actual supplier carriers arrive. Compilation is signature checking, not proofs or executed mathematical tests. That limitation is accepted under the issue’s honest-partial-plan rule and remains G11.

All six planets are central named spaces/comparisons, not source locators or proof fragments. All fourteen definition/construction nodes have at least three discriminating mathematical tests; the new tests expose the three corrected convention/input failures.

## Follow-up decisions for the orchestrator

No blocking clarification is needed for this review. To close H.1, route the existing requests/proposals with these explicit refinements:

1. Extend H.0 to coherent operator modules before implementing stability, boundedness and restriction; do not assume local freeness before its theorem.
2. Export the determinant-rigidified End₀ gauge and full-stabilizer/coarse-ring bridge from the deformation owners. Compare inertia rather than identifying the two groupoids.
3. Keep the PDE Part II and compact Kähler supplier work open, including arbitrary background metrics and the precise compactness norm contract.
4. Obtain Corlette’s accessible primary proof for G8 and source-check the stronger real-analytic interpretation of EG20 /006 for G10.
5. Collate the S96 gauge formula against the published AMS chapter when accessible. The current confirmed finding is deliberately preprint-scoped.
6. Replace the 34 omitted node signatures only after supplying their native carriers; G11 is not closed by this successful Betti-subset elaboration.

This is a finished review, not a checkpoint. Continuation belongs to supplier/follow-up jobs; this session claims no second job.
