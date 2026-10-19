# Independent review: Motivic and étale K-theory, M.6b–M.8

**Accepted after correction, 2026-10-19.** Reviewer: Codex, session
`codex-SFBYTt`, job `REV-MotivicEtaleKTheory--M.6b`, issue #10796. The input
was written for #10825 by the separate session `codex-OFMygv`.

This accepts a complete target-level planning pass. All three stages are
`planned`; none is `closed`. The eight recorded gaps and eighteen supplier
requests remain mathematical obligations. Acceptance supplies neither their
proofs nor implementations of the planned objects.

## Inventory and scope

| Item | Review result |
| --- | --- |
| New nodes | 18: 11 verified, 7 corrected, 0 added, 0 unverifiable |
| Kinds | 1 definition, 2 constructions, 3 comparisons, 11 theorems, 1 application |
| Imported targets | All 32 identifiers confirmed in accepted M.5d, reviewed by `REV-MotivicEtaleKTheory--M.5d~2` |
| Pinned baseline declarations | All 4 confirmed; none removed or replaced |
| Definition/construction API | 20 items, including 3 additions |
| Definition/construction tests | 12, distributed 3/4/5; 1 added |
| Planets | 12, distributed 3/5/4 over M.6b/M.7/M.8 |
| Source findings | All 5 independently confirmed; none added or rejected |
| Public source versions | 10 original PDFs retrieved with matching hashes; publisher version added for the stated-result finding |

The three-stage scope agrees with the live job and packet. The older embedded
M.6b-only description does not remove M.7/M.8 from the review. M.5d supplies
the existing target inventory, whereas the named M.1 predecessor does not
cover these stages. The refinement must be assembled with M.5d.

## Mathematical corrections

1. **Finite étale transfer.** A constant-degree finite étale map need not send
   the K-theory unit to the integer degree. Its pushforward sends it to
   `[f_*O_Y]`, whose rank is the degree, and the projection formula gives
   `f_!f^*(x)=[f_*O_Y]·x`. The scalar degree test now applies to the split
   cover. The cohomological trace on E₂ remains distinguished from the full
   K₀ class. The K.3 transfer/projection-formula node is a direct prerequisite.
2. **Coefficient transitions.** The arithmetic Bockstein proof now names the
   actual reduction maps on finite Tate twists. For weight `j≥2`, the inverse
   limit of its degree-zero term is `H⁰(R,Z_ℓ(j−1))=0`. Finiteness justifies
   the required Mittag–Leffler passages. An arbitrary constant-system
   identification cannot replace these maps, and finite-level H⁰ remains.
3. **Cubical orientation.** M.4 uses
   `∂_M=Σ_i(−1)^i(∂_i^∞−∂_i^0)`, the negative of the Burgos–Feliu boundary.
   The regulator now includes `J_n=(−1)^n`, satisfying
   `∂_BF J_n=J_(n−1)∂_M`, and the degeneracy-quotient/normalization comparison.
   The same transport acts on both total complexes and the higher Chern
   character. The transported signs cancel in the K-theory-to-Deligne
   composite. An orientation API and the degree-one/two test were added.
4. **Direct dependencies and product API.** The product roof now directly
   imports H.6's filtered spectral-sequence construction; the cycle-layer
   comparison directly imports the integer reindexing definition. Unit and
   associativity APIs specify the operations on exact couples, pages and
   abutment, using the supplied support tensor products and common moving
   refinements. They assert no additional E∞ structure.
5. **Suggested Lean and reader.** The inverse declaration now has the packet's
   `MotivicIndex.inverse` name. The file imports `Mathlib`, places the named
   rational Adams linear-algebra criterion first, and contains only the two
   light integer-coordinate definitions, five named theorem statements and
   three proved examples. The three unrelated admitted polynomial examples
   were removed; Euler-factor checks remain precise README targets. Test
   kinds and reader counts were synchronized. The imported real mod-two
   groups are described as groups, with zero groups rather than order zero.
6. **Source records.** The Levine PDF has 97 pages. The eleven structured
   `sourceVersions` entries record versions, URLs, dates and hashes. The
   Nekovář–Nizioł stated-result finding now cites the publisher's version,
   independently collated against the preprint.

## Node-by-node verdicts

Identifiers below are the final component of the packet's node IDs. The
packet's `review.checked` gives the individual rationale and locators.

| Node | Verdict | Principal check |
| --- | --- | --- |
| `motivic-native-index-transport` | corrected | Levine Appendix D.1 pp.93–94 and Theorem 14.7 pp.73–74; Weibel VI (4.2) pp.480–481. Native `s` becomes public `s+1`; total K degree drops by one. |
| `simultaneously-moved-product-roof` | corrected | Levine §11.2–11.8 pp.43–48, Appendix C pp.90–91, D pp.94–96. Common quotient width and both connecting maps survive the moving roof. |
| `product-cycle-layer-identification` | corrected | Levine §11.14–11.15 pp.51–52 and Lemma D.6 pp.95–96. Intersection/shuffle product and total-degree Leibniz sign agree after reindexing. |
| `adams-support-boundary-comparison` | verified | Levine §12.5–12.12 pp.54–59 and Theorem 14.7 pp.73–74; Weibel VI §4.9 pp.485–486. Finite-support operations and their boundary comparison retain their supplier obligation. |
| `motivic-quotient-completion` | verified | Levine coniveau Proposition 2.1.3/Corollary 2.1.4 pp.11–12; Levine 2001 Theorem 14.5/Lemma 14.6 pp.71–72 and D.2 p.94. Eventual degreewise vanishing uses dimension/connectivity and the actual Milnor sequence. |
| `corrected-thomason-descent` | verified | Original Theorems 2.43–2.46 pp.498–501, §3.34 and Theorems 4.1/4.11 pp.516–520; entire 1989 erratum pp.675–677. Countably generated comparison and general Bott annihilation are separate inputs. |
| `finite-etale-descent-transfer` | corrected | Blumberg–Mandell v3 Theorem 10.1, Lemma 10.2, Proposition 10.4 and proofs pp.43–46. Strictified transfers and compatible Godement resolutions give the filtered trace. |
| `arithmetic-bockstein-comparison` | corrected | Weibel VI §4.6 pp.483–484 and Theorem 8.2/proof pp.513–514. Correct finite-level transitions precede completion; arithmetic finite generation is for S-integers. |
| `real-restriction-boundary-square` | verified | Weibel VI Theorem 9.1/proof pp.517–518 and §9.2–9.4 pp.518–520. Restriction fibre, coefficient boundary and page kernels are distinct objects. |
| `dyadic-mod-two-filtration` | verified | Weibel VI §9.6–9.7 pp.520–522, including the rendered theorem and table. All eight residues and extension orientations agree. |
| `dyadic-integral-torsion-filtration` | verified | Weibel VI Theorem 9.5 p.520, Corollary 9.10 p.523, Theorem 9.11/proof pp.524–525, including the rendered table. The integral torsion calculation uses Q₂/Z₂, not the mod-two table. |
| `cubical-deligne-regulator-roof` | corrected | Burgos–Feliu pp.11–19: semipurity, cubical normalization, support-cone truncation and Proposition 3.3. The M.4 boundary is transported explicitly. |
| `beilinson-character-comparison` | corrected | Burgos–Feliu Theorem 3.5/proof pp.20–23; Weibel V §11 pp.455–462. Orientation, higher additive factorial and the separate K₀ Newton formula agree. |
| `native-tate-euler-normalizations` | verified | Bloch–Kato §5.1 p.369 and §5.5.1–5.7 p.372; Weibel V §11.12 pp.457–459; R01.6/ES.2 contracts. Duality and twisting give the stated polynomials, including the `j−1` homological shift. |
| `local-tate-regulator-finite-condition` | verified | Nekovář–Nizioł Proposition 5.7 p.58; Bloch–Kato (3.7.3) p.354, Example 3.9/Definition 3.10 p.359 and Example 3.10.1 pp.359–360. Kummer and higher Tate cases keep their local hypotheses. |
| `elliptic-kummer-selmer-adapter` | verified | Bloch–Kato pp.353–354,359–360,369; Nekovář–Nizioł Theorem 5.9/proof p.59, publisher pp.1778–1779. General H¹_st factorization does not supply unconditional H¹_f or a map of Selmer complexes. |
| `selmer-local-determinant-comparison` | verified | Kato §1.2 p.165/§2.1 pp.166–168; Bloch–Kato §5.1 p.369; D7/L2/L4/L5/MC.2/PS.0 contracts. The determinant sign follows the selected triangle; perfection and period factors remain inputs. |
| `number-field-chern-lattice-index` | verified | Weibel V §11 pp.455–462 and VI §8.1–8.2 pp.513–514; Bloch–Kato §5.1 p.369; pinned covolume theorem. The factorial and index have the correct direction under the stated full-lattice hypotheses. |

All cited PDFs are public. Their exact URLs and hashes are in the packet's
source/version ledger and the reader's source ledger. Results above are stated
in our own words; no source passage is reproduced.

## Pinned libraries, suppliers and existing work

Mathlib was checked at `082e2d37e8b0463410cdb532e111cd43d5a66174`, with
Tau Ceti baseline `f790474821cf4256814db967cb154e7af3d0c369`.

| Baseline declaration | What its actual statement supplies |
| --- | --- |
| `CategoryTheory.E₂CohomologicalSpectralSequence` | Abelian-category pages beginning at 2, differential bidegree `(r,1−r)` and next-page identifications. It does not construct the motivic tower. |
| `CategoryTheory.Abelian.SpectralObject` | Interval cohomology, connecting morphisms and exactness. This algebraic interface does not supply the stable support diagrams. |
| `Module.End.mem_eigenspace_iff` | The actual eigenvector equation for a linear endomorphism, used by the rational scalar-difference criterion. |
| `ZLattice.covolume_div_covolume_eq_relIndex` | Relative index equals the covolume ratio for nested full discrete Z-lattices in finite real coordinates. Both lattices and the coordinate comparison are required in the application. |

The accepted M.5d target statements and the direct supplier statements were
read, including M.4/M.6a, H.6, S.4/S.6, K.2/K.3, ArithmeticGaloisDuality,
Hodge Part II, arithmetic representations, Euler systems, p-adic Hodge,
Selmer/determinant, regulator and period-space interfaces. The source-dependent
proof obligations inherited from M.5d were preserved. A traversal through
available named-node prerequisites reached 2,040 nodes and found no cycle;
stage-only references remain requested interfaces, rather than invented
whole-stage dependencies. This is a graph check, not a mathematical review of
all those transitively reachable nodes.

The reviewed library audit and maintained upstream checkouts were checked
read-only. In particular, current AlgebraicVectorBundles owns the geometric
bundle/determinant direction, EllipticCurves and the current library supply
native Tate modules, their Galois representation and Weil pairing, and
IntegralLattices identifies the generic covolume/index machinery as existing.
The nine roadmaps newer than the atlas snapshot were included in the overlap
search. The proposed arithmetic lattice and Euler-polynomial nodes compare
these objects; they do not recreate them. No upstream file was edited and no
Lake command was run there.

## Source findings

All five findings have the required independent verdict and reason in the
packet:

- **E-M6b-1:** confirmed by the published Thomason erratum, pp.675–677;
  already known in print.
- **E-M6b-2:** confirmed in the rendered Levine p.96. Interchange on
  `S¹∧S¹` and on `S⁰∧S¹` distinguishes exponent `nm` from `n+m`.
- **E-M6b-3:** confirmed at Weibel p.513. Localization makes `K₂(Q)`
  surject onto the infinite sum of the finite residue-field unit groups;
  the intended finite-generation statement concerns S-integers.
- **E-M6b-4:** confirmed in arXiv v5 p.59 and the publisher's rendered
  Theorem 5.9, p.1779. The regulator definition on p.1778 and final proof
  diagram/Remark 5.10 use geometric degree `i`; the theorem display uses
  `i+1`. The finding is now against the version of record.
- **E-M6b-5:** confirmed at Weibel p.525 against Theorem 9.11 p.524.
  The relevant even-group order uses the H² numerator. The theorem's ratio
  and this packet's integral torsion table remain valid.

No novelty is asserted for the four findings without a located erratum.
Inherited Levine E6/E7/E8 are not new findings of this review; their existing
verdicts and convergence obligations remain attached to the imported work.

## Validation and handoff

- `python3 scripts/check_blueprint.py research/blueprint/packets/MotivicEtaleKTheory--M.6b.json`:
  zero errors and zero warnings.
- `python3 scripts/check_sorry_data.py research/blueprint/suggested/MotivicEtaleKTheory--M.6b.lean`:
  passes.
- Intake `check-files` on the five deliverables: zero problems. The source
  version schema check and `git diff --check` also pass.
- `lean-check research/blueprint/suggested/MotivicEtaleKTheory--M.6b.lean`:
  elaborates at the pinned Mathlib; the only diagnostics are five permitted
  admitted-theorem warnings. All three examples are proved.

No orchestrator decision blocks acceptance. Follow-up work must keep the eight
gap families: coherent support/global models; finite-diagram Adams comparison;
norm-residue/rigidity/Dedekind proof imports; real KO and dyadic connecting maps;
logarithmic/supported character imports; integral and higher-weight local
Selmer lifts; perfect determinants and independent period factors; and the full
integral motivic image lattice. Assembly must retain the M.5d targets and
their hypotheses, and avoid reversing the early comparison-to-application
dependency order.
