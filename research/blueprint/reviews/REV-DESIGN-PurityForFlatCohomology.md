# Independent review: purity for flat cohomology

**Verdict: accepted.** Codex, session `codex-T956PW`, independently reviewed job #3597 (`REV-DESIGN-PurityForFlatCohomology`) on 2026-10-19. The original design was by Claude Opus 5.5, session `claude-Q5c44Q`. This is a completed review of the target-level pass. All four reviewed files were corrected in place.

Acceptance uses PROTOCOL §0: every target is represented and every prerequisite chain ends at a pinned declaration, a checked supplier contract or a named gap. It does not mean the seven layers are closed. The unread original homological argument behind Auslander’s criterion and the general-DVR residue descent step are now explicit gaps, rather than purported routine arguments. There is no remaining contradiction between the retained statements and their stated dependencies.

## Counts and coverage

- Nodes: 57 retained; 25 corrected, 32 verified; zero added or removed. The packet has exactly one review entry for each node.
- Kinds: five definitions, two constructions and 50 theorems. All seven definition/construction nodes have at least three discriminating tests.
- APIs: 52 entries; definition/construction tests: 34; planets: 24. Added one nested-support API and one zero-ring test.
- Baseline: all 22 declaration statements confirmed at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. No citation removed. Two descriptions narrowed, as detailed below.
- Seven stages planned, zero closed. Fourteen gaps (previously 12), nine requests (previously eight), six upstream import records (previously five), 80 extraction-route dispositions. All implementation statuses remain unchecked.
- Six source findings independently confirmed, with version-specific reading records. E6 is a proof gap, not an established false theorem.

## Corrections and closure

PF.0 imports LocalPurity §1.1 for the local carrier and SchemeAndStackFoundations §2.7 for general derived supports. It owns the semilocal and fppf adapters. The zero ring is separated from the nonzero dimension-zero characterization. Supported continuity descends a fixed support with quasi-compact complement. Faithful finite-flat descent and derived composition of nested supports are explicit. The regular-sequence proof uses finite Čech/Koszul supports before enlarging to the required support; it no longer assumes localization over an arbitrary non-quasi-compact complement.

PF.2’s descent reduction now proves the self-products are complete intersections using the complete-intersection closed fibre, its tensor powers, and the flat-local criterion. Being Artinian alone was insufficient. The μ_p checks in PF.2 and PF.4 distinguish the below-two bound from the additional degree-two vanishing required to extend torsors.

PF.3 separates base and group functoriality from covariant enlargement of supports. Its localization diagram retains restriction/intersection maps. The arbitrary finite-flat-group check over an algebraically closed valuation ring uses a generic point and finite proper extension. The Frobenius example uses p=3, and the surjectivity proof uses a fixed basis. The mixed-characteristic key-formula check retains mod-p support rather than replacing it by the entire spectrum.

PF.4’s regular top-degree proof uses the boundary descent edge after lower-degree vanishing on self-products. It no longer applies a lemma outside its strict degree range. The projective-dimension-one module vanishes below d, and the contraction argument uses the minimum signed exponent sum. The field non-example uses a constant group. Both regular tower targets are imported from PerfectoidSpaces P7, with only genuine refinements left to PerfectoidQuotientsPartII.

PF.5’s Cohen–Macaulay counterexample has nonzero supported cohomology in degree two. The elliptic cones and their dimensions are specified; the Segre example has dimension four and concerns nontorsion classes. The higher multiplicative-group torsion proof now uses the rationalized Leray argument and divisor sheaf in all stated degrees. The reduction for a group T of multiplicative type lifts a torsion class through T→S=image([m]), then through [n] on the torus S; the kernel T[mn] is finite flat. The original Auslander criterion is stated correctly through CS24 p. 88, but its unread homological proof is gap AUSLANDER-FREENESS.

PF.6 constructs coniveau using filtered closed supports of bounded codimension. The flasque non-example uses the sign lattice with trivial target lattice. Residues pull back to the completion; no completion isomorphism of Brauer groups is assumed. The valuation connecting map is inverted in the correct direction, cyclic generators fix the sign, and general-DVR middle exactness names gap BR-RESIDUE-DESCENT.

Every changed node field and its reason appear in the ledger below. Additional non-node edits are the two baseline scope descriptions; the summary’s nonfield hypothesis; exact source hashes, versions, public URLs and reading scopes; nine supplier contracts; coverage remaining lists; the two added gaps; source-finding verdicts and E6 classification; ownership adjustments and upstream import records; and the complete review object. The reader now reproduces the corrected statements, hypotheses, proof outlines, APIs, tests, checks, references, routes and gaps. The roadmap definition has synchronized sources, ownership, stage descriptions and the added PerfectoidSpaces P7 prerequisite.

## Pinned baseline ledger

The declaration names and modules are unchanged. `Submodule.spanFinrank` is now explicitly a finite-generation count, with zero for infinite rank; the Lean presentation inequality therefore requires a Noetherian presenting ring. `Localization.Away` is accurately described as the carrier at the monoid module, with its ring/algebra structures supplied by the separately read ring-localization companion. All other descriptions retain their verified scope.

| Declaration | Confirmed scope |
|---|---|
| `mathlib:AlgebraicGeometry.Scheme` | Schemes as locally ringed spaces locally isomorphic to spectra; the carrier of every scheme in this roadmap. (`Mathlib/AlgebraicGeometry/Scheme.lean`) |
| `mathlib:AlgebraicGeometry.Scheme.fppfTopology` | The fppf Grothendieck topology on the category of schemes, generated by the fppf precoverage; the big fppf site on which flat cohomology is taken. It provides no cohomology with supports. (`Mathlib/AlgebraicGeometry/Sites/Fpqc.lean`) |
| `mathlib:CategoryTheory.Sheaf.H` | Sheaf cohomology of an abelian sheaf on a site, as Ext from the constant sheaf; the cohomology groups whose relative (supported) version PF.0 constructs. (`Mathlib/CategoryTheory/Sites/SheafCohomology/Basic.lean`) |
| `mathlib:localCohomology` | Local cohomology of modules over a commutative ring with support in an ideal, as the colimit of Ext from R/J^t; compared with Zariski cohomology with supports by SchemeAndStackFoundations §2.7 for Noetherian rings. (`Mathlib/Algebra/Homology/LocalCohomology.lean`) |
| `mathlib:IsRegularLocalRing` | A Noetherian local ring whose maximal ideal is generated by dim R elements (spanFinrank = ringKrullDim). (`Mathlib/RingTheory/RegularLocalRing/Defs.lean`) |
| `mathlib:RingTheory.Sequence.IsWeaklyRegular` | Weakly regular sequences: each element is a nonzerodivisor modulo the previous ones (the EGA convention used by CS24 §1.4). (`Mathlib/RingTheory/Regular/RegularSequence.lean`) |
| `mathlib:RingTheory.Sequence.IsRegular` | Regular sequences: weakly regular with nonzero final quotient. (`Mathlib/RingTheory/Regular/RegularSequence.lean`) |
| `mathlib:ringKrullDim` | Krull dimension of a commutative ring in WithBot ℕ∞. (`Mathlib/RingTheory/KrullDimension/Basic.lean`) |
| `mathlib:Submodule.spanFinrank` | Natural-number truncation of spanRank: minimal generator count for finitely generated submodules, but zero for infinite rank. The virtual-dimension targets use Noetherian regular presentations, so the relevant ideals are finitely generated. (`Mathlib/Algebra/Module/SpanRank.lean`) |
| `mathlib:IsLocalRing.closedPoint` | The closed point of the prime spectrum of a local ring; its complement is the punctured spectrum. (`Mathlib/RingTheory/Spectrum/Prime/Topology.lean`) |
| `mathlib:AdicCompletion` | The I-adic completion of a module as an inverse limit of quotients; classical completion, not derived completion. (`Mathlib/RingTheory/AdicCompletion/Basic.lean`) |
| `mathlib:IsAlgClosed` | Algebraically closed fields: every polynomial splits. (`Mathlib/FieldTheory/IsAlgClosed/Basic.lean`) |
| `mathlib:frobenius` | The Frobenius ring endomorphism x ↦ x^p of a ring of characteristic p; the twist of Frobenius-semilinear maps. (`Mathlib/Algebra/CharP/Lemmas.lean`) |
| `mathlib:WittVector` | p-typical Witt vectors; A\_inf(A) = W(A^♭) and W(A) for perfect A. (`Mathlib/RingTheory/WittVector/Defs.lean`) |
| `mathlib:Localization.Away` | The localization-away carrier at the cited monoid module; its commutative-ring and algebra structures used for A[1/a] are supplied by Mathlib/RingTheory/Localization/Away/Basic.lean, also read at the pin. (`Mathlib/GroupTheory/MonoidLocalization/Away.lean`) |
| `mathlib:Module.FinitePresentation` | Finitely presented modules; the hypothesis of the product lemma for Dieudonné modules. (`Mathlib/Algebra/Module/FinitePresentation.lean`) |
| `mathlib:Module.Free` | Free modules; the conclusion of Auslander's criterion. (`Mathlib/LinearAlgebra/FreeModule/Basic.lean`) |
| `mathlib:Module.IsReflexive` | Reflexive modules: the evaluation map to the double dual is bijective. (`Mathlib/LinearAlgebra/Dual/Defs.lean`) |
| `mathlib:IsAzumaya` | Azumaya algebras over a commutative ring: finite projective, faithful, with A ⊗ A^op → End(A) bijective; the affine Azumaya notion behind SchemeAndStackFoundations §2.22. (`Mathlib/Algebra/Azumaya/Defs.lean`) |
| `mathlib:IsDiscreteValuationRing` | Discrete valuation rings; the local rings at height-one points in the residue sequences. (`Mathlib/RingTheory/DiscreteValuationRing/Basic.lean`) |
| `mathlib:UniqueFactorizationMonoid` | Unique factorization; factorial (strictly henselian) local rings in the divisor sequence for 𝔾\_m. (`Mathlib/RingTheory/UniqueFactorizationDomain/Defs.lean`) |
| `tauceti:TauCeti.AlgebraicGeometry.LineBundleClass` | The commutative group of isomorphism classes of invertible sheaves on a scheme; Pic(U\_R) of the punctured spectrum. (`TauCeti/AlgebraicGeometry/LineBundle/Class.lean`) |

## Sources and attribution

Every retained node’s primary locator was read, with statement, hypotheses, proof route and match checked. The source metadata distinguishes direct reading from secondary credit. In particular, CS24 v3 and C19 v4 are the texts checked; the journal printings were not used to assert any source error. The read public sources include SGA 2, Katz Proposition 4.1.1, Colliot-Thélène–Sansuc Theorem 2.2(ii) and Lemma 2.4, Bouthier–Česnavičius Lemma 2.3.2, Poonen §6.8, ILO XVIII-A §2.2 and Grothendieck’s 1966 Bourbaki exposition. EGA IV₄ §21.13 was read from the maintainer-cleared Numdam copy. No source passage or full-source summary was added.

The original Auslander text did not load from its public publisher endpoint. Its exact criterion is verified through CS24, and the missing original proof is recorded explicitly. Avramov, Moret-Bailly, Boutot, DeMeyer–Ford and the 1968 Dix exposés edition remain secondary credits through the two primary papers. Their unread original arguments are not represented as independently checked. Grothendieck’s public 1966 exposition is separately identified as Gro66, not confused with Gro68.

| Finding | Independent verdict |
|---|---|
| `PurityForFlatCohomology/E1` (arXiv:1912.10932v3, Theorem 7.1.2, p. 87) | confirmed: Confirmed in arXiv v3: for d=1 a field component satisfies the printed regular dimension bound but supports nonzero constant sections. The proof needs the nonfield hypothesis of 6.2.7. |
| `PurityForFlatCohomology/E2` (arXiv:1912.10932v3, Proof of Theorem 3.3.1(b), p. 35) | confirmed: Confirmed in arXiv v3: the extra d in the displayed ring name has no defined referent; the theorem and argument concern R. |
| `PurityForFlatCohomology/E3` (arXiv:1912.10932v3, Proof of Theorem 6.2.7, p. 85) | confirmed: Confirmed in arXiv v3: the presentation uses d variables, but the square of the maximal ideal in this line is indexed by n. |
| `PurityForFlatCohomology/E4` (arXiv:1912.10932v3, Proof of Theorem 7.2.1, p. 89) | confirmed: Confirmed in arXiv v3: the Kummer step requires a positive integer annihilator; the printed nonnegative range inadvertently includes zero. |
| `PurityForFlatCohomology/E5` (arXiv:1912.10932v3, Proof of Theorem 7.2.5, p. 90) | confirmed: Confirmed in arXiv v3: the Kummer identification used here requires n>0, not the printed nonnegative range. |
| `PurityForFlatCohomology/E6` (arXiv:1711.06456v4, Proposition 2.2 and its proof, p. 4) | confirmed: Confirmed as a proof gap in arXiv v4: triviality of the distinguished H¹ fibre does not establish injectivity of all nonabelian fibres. The commutative restriction suffices for the cited uses. This does not establish that the unrestricted theorem is false. |

The full [reader references](../readmes/PurityForFlatCohomology.md#references-and-reading-scope) give public URLs, precise sections/pages and the reading limits; sourceVersions records the preprint hashes and dates.

## Suppliers, audit and ownership

The reviewed library audit has no direct PurityForFlatCohomology entry, so it is not treated as proof that a carrier is missing. The actual pinned declarations and current Tau Ceti source were inspected. The current readonly upstream snapshots were TauCetiRoadmap `0d144d044dacebca17b654695b6f1ad58f159b27` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Suggested files for all nine post-snapshot roadmap families were searched; the relevant AlgebraicVectorBundles statements and README were read. They supply no duplicate purity target. No build was run in those readonly checkouts.

All 26 distinct external node references and the requested-stage statements were read. In particular, DD.1 defines complete flatness but does not supply the required Yekutieli flatness theorem; that remains an exact request. PD.6 supplies the three individually inspected classification/normalisation/base-change targets, but its whole packet remains needs_changes because of PD.7. No supplier review was promoted. Stacks 0EJP now includes the full Situation 0EHC hypotheses, including the dualizing complex, equidimensionality, Cohen–Macaulay complement, dimension bound and formal completed-stalk condition.

| Existing owner | Checked revision and scope |
|---|---|
| TauCetiRoadmap SchemeAndStackFoundations | `f30bfe0a3b9d28515e04a1b779af08792e57ea76 (main)`; §0.3; §0.4; §0.6 coherent\_hartogs, reflexive\_extension\_normal; §0.14 henselian\_finiteEtale\_equivalence; §0.17 depth; §§1.15, 1.18 torsors and gerbes; §§2.1–2.3; §2.7 cohomology with supports; §2.9; §2.10; §2.11; §2.15; §2.22 Brauer groups; §3.4 Picard groups |
| TauCetiRoadmap DeformationAndDerivedPatchingAlgebra (pull request #1034) | `e0abc60100ba74746306a44d12ac151d5dc6cc9a`; §3.4 absolute local complete intersections and the flat-local criterion; §6.9 localCI\_parafactorial and punctured regular Picard triviality |
| TauCetiRoadmap LefschetzPencilsAndVanishingCycles (draft pull request #873) | `4c9b59c5f758c3964ca73ce60826b2c52d5f1f90`; §0.10 absolute cohomological purity |
| TauCetiRoadmap LocalPurity (pull request #1102) | `6fd7dbe7d6eb7d835483f6ed90fbe305ec65e664`; §1.1 IsLocalRing.puncturedSpectrum and its basic-open/compactness API; §2.1 purity for regular local rings (Stacks 0BMA); §2.2 extension across points where purity holds (Stacks 0EY7) |
| TauCetiRoadmap PurityOfBranchLocus (pull request #1103) | `8ba23ff82baa03183998c791a4565ff2f6a5fdf8`; §0.3 auslander\_buchsbaum |
| TauCetiRoadmap PerfectoidSpaces (pull request #818) | `506f5211b5d2e497588b614fcb008f54adfb0688`; §P7.16a regular-finite-flat-residue-tower; §P7.17 regular-finite-flat-perfectoid-tower |

The six upstream contracts are imports, including open or draft upstream plans. They are not claims of implementation. Absolute purity and local Grothendieck–Lefschetz are not replanned here. The LocalPurity local carrier and SchemeAndStackFoundations general support formalism are reused. PerfectoidSpaces P7.16a–P7.17 is the new ninth request and sixth upstream import. Q0 already supplies completed localization, so the PQ-PII request no longer asks for that again.

## Lean and validation

The 331-line suggested file keeps only light definitions over pinned carriers. The product-module map now lands in the idempotent components e_iM rather than copies of all of M. The presentation virtual-dimension inequality now has the needed Noetherian hypothesis. Its comments and register were synchronized with the new nested-support API, zero-ring test and imported local carrier. Heavy targets remain mathematical statements in the reader.

- `lean-check research/blueprint/suggested/PurityForFlatCohomology.lean`: passed at the prescribed pins; 29 warnings, all declaration uses of sorry; no errors or other warnings.
- `python3 scripts/check_blueprint.py research/blueprint/packets/PurityForFlatCohomology.json --index <pinned declaration index>`: zero errors, zero warnings.
- Source-finding structure and source-version checks: passed using `source_issues.check_issues` and `check_errata.versions_checked`.
- `scripts/check_sorry_data.py`: passed; no sorry-bodied data.
- Consistency checks: all 57 node statements, hypotheses, proofs, acceptance checks, APIs and tests occur in the reader; all 86 API/test names occur as a signature or an explicit README-only entry in the Lean file; source records match the roadmap; every definition/construction has at least three tests.
- `git diff --check`: passed. Only the five issue deliverables and this job’s handoff are changed.

## Nodewise ledger

Verified rows retain their statements and proof routes. Corrected rows name every changed node field; the packet’s checked ledger records the corresponding mathematical reason. Source metadata and supplier-contract edits are counted separately above.

| Node | Verdict | Changed fields and reason, or checked source |
|---|---|---|
| `PurityForFlatCohomology:PF.0/punctured-spectrum` | corrected | `statement`, `hypotheses`, `proofSteps`, `prerequisites`, `sources`, `tests`. Import the existing LocalPurity local carrier; keep the semilocal adapter. Separate the zero-ring dimension and use a uniformizer in the DVR test. |
| `PurityForFlatCohomology:PF.0/flat-cohomology-with-supports` | corrected | `hypotheses`, `proofSteps`, `sources`, `api`. State faithful descent with semilocal self-products, descend a fixed support with qc complement in continuity, and expose derived nested-support composition. Read BC22 directly. |
| `PurityForFlatCohomology:PF.0/regular-sequence-support-vanishing` | corrected | `proofSteps`, `prerequisites`. Replace the unsupported non-qc localization step by finite Čech/Koszul vanishing on V(a), followed by nested-support composition; request the regular-power lemma explicitly. |
| `PurityForFlatCohomology:PF.0/hartogs-regular-sequence` | verified | `CS24`: Lemma 7.2.7 and its proof, pp. 90–91; `C19`: §2.4 via EGA IV₂ 5.10.5, used in the proof of Corollary 2.4, p. 5. Statement, hypotheses, prerequisites, proof route and checks verified at target level. |
| `PurityForFlatCohomology:PF.1/virtual-dimension` | verified | `CS24`: Paragraph 3.2.1, p. 32, equations (3.2.1.1)–(3.2.1.3); `SGA2`: Exposé XIV, Proposition 5.2 and Définition 5.3, pp. 198–200; Propositions 5.4–5.5, p. 200. Statement, hypotheses, prerequisites, proof route and checks verified at target level. |
| `PurityForFlatCohomology:PF.1/virtual-dimension-flat-additivity` | verified | `CS24`: Paragraph 3.2.1, p. 32, equation (3.2.1.3) and the sentence after it, p. 33; `Avr77`: Proposition 3.6 and equations (3.2.1)–(3.2.2). Statement, hypotheses, prerequisites, proof route and checks verified at target level. |
| `PurityForFlatCohomology:PF.1/depth-virtual-dimension-incomparable` | verified | `CS24`: Remark 3.2.2, p. 33; `SGA2`: Exposé XIV, Proposition 5.4, p. 200. Statement, hypotheses, prerequisites, proof route and checks verified at target level. |
| `PurityForFlatCohomology:PF.1/etale-depth-virtual-dimension` | corrected | `hypotheses`. Fix the forward reference to PF.4 for the general finite-étale theorem. |
| `PurityForFlatCohomology:PF.1/zariski-nagata-virtual-dimension` | verified | `CS24`: Theorem 3.3.1 and its proof, pp. 34–35; Remark 3.3.2, p. 35; `SGA2`: Exposé X, Définitions 3.1–3.2 and Théorème 3.4, p. 94; `STACKS`: Lemmas 52.11.3 (0DXR), 51.4.3 (0DX9), 52.22.5 (0EJP), 15.13.2 (09ZL). Statement, hypotheses, prerequisites, proof route and checks verified at target level. |
| `PurityForFlatCohomology:PF.2/additive-group-depth-vanishing` | verified | `CS24`: Example 4.1.10, p. 39, equation (4.1.10.1); `SGA2`: Exposé III, Proposition 3.3(iv). Statement, hypotheses, prerequisites, proof route and checks verified at target level. |
| `PurityForFlatCohomology:PF.2/root-extraction-comparison` | verified | `CS24`: Lemma 4.1.11 and its proof, p. 39; `CS24`: §1.3, p. 7 (last paragraph) to p. 8; `STACKS`: Lemma 10.68.9 (07DV). Statement, hypotheses, prerequisites, proof route and checks verified at target level. |
| `PurityForFlatCohomology:PF.2/finite-flat-cover-reduction` | corrected | `proofSteps`. Repair the self-product argument: its closed fibre is a tensor power of the complete-intersection k-algebra R′/𝔪R′, not just an Artinian algebra; specify the stability input in R03.3. |
| `PurityForFlatCohomology:PF.2/char-p-complete-intersection-purity` | corrected | `acceptance`. Correct the degree range in the μ\_p check: vanishing only below two does not by itself extend all torsors. |
| `PurityForFlatCohomology:PF.3/dieudonne-side-complex` | corrected | `api`. Type base/group maps separately from the covariant enlargement of supports, and specify the principal-open localization diagram. |
| `PurityForFlatCohomology:PF.3/perfectoid-low-degree-cohomology` | corrected | `acceptance`. Justify the 𝒪\_C check for arbitrary finite flat G by a generic point and properness, rather than only checking Kummer and Artin–Schreier coefficients. |
| `PurityForFlatCohomology:PF.3/dieudonne-side-arc-descent` | verified | `CS24`: Proposition 4.2.7 and its proof, pp. 42–43; Lemma 4.2.6, p. 42. Statement, hypotheses, prerequisites, proof route and checks verified at target level. |
| `PurityForFlatCohomology:PF.3/finitely-presented-modules-over-products` | verified | `CS24`: Lemma 4.2.8 and its proof, p. 43. Statement, hypotheses, prerequisites, proof route and checks verified at target level. |
| `PurityForFlatCohomology:PF.3/dieudonne-modules-over-products` | verified | `CS24`: Proposition 4.2.9 and its proof, p. 43. Statement, hypotheses, prerequisites, proof route and checks verified at target level. |
| `PurityForFlatCohomology:PF.3/frobenius-fixed-points-algebraically-closed` | corrected | `proofSteps`, `sources`, `acceptance`. Use the fixed basis of V^{-1} for surjectivity, correct the kernel scheme wording and use p = 3 in the non-example. Read Katz directly. |
| `PurityForFlatCohomology:PF.3/product-valuation-local-analysis` | verified | `CS24`: Proposition 4.2.10 and its proof with Claims 4.2.10.1–4.2.10.2, pp. 43–45; `CS24`: Lemma 2.2.4, p. 19; Proposition 2.1.9, p. 14. Statement, hypotheses, prerequisites, proof route and checks verified at target level. |
| `PurityForFlatCohomology:PF.3/flat-side-arc-descent` | verified | `CS24`: Theorem 5.5.1 and its proof, pp. 68–69; announced as Theorem 1.2.3, p. 6. Statement, hypotheses, prerequisites, proof route and checks verified at target level. |
| `PurityForFlatCohomology:PF.3/key-formula` | corrected | `acceptance`. Restrict the absolute-cohomology check to characteristic p; mod-p support is not the whole spectrum in mixed characteristic. |
| `PurityForFlatCohomology:PF.3/perfectoid-purity` | verified | `CS24`: Theorem 6.1.2 and its proof, pp. 82–83; announced as Theorem 1.1.5, p. 4; `CS24`: §1.1, p. 5. Statement, hypotheses, prerequisites, proof route and checks verified at target level. |
| `PurityForFlatCohomology:PF.4/completion-regular-sequence` | verified | `CS24`: Lemma 6.2.2 and its proof, p. 83. Statement, hypotheses, prerequisites, proof route and checks verified at target level. |
| `PurityForFlatCohomology:PF.4/flat-purity-complete-intersection` | corrected | `prerequisites`, `acceptance`. Correct the μ\_p torsor check and import the existing PerfectoidSpaces tower targets rather than request them again. |
| `PurityForFlatCohomology:PF.4/etale-purity-virtual-dimension` | verified | `CS24`: Theorem 6.2.4 and its proof, pp. 84–85; announced as Theorem 1.3.1, p. 8; `CS24`: Remark 6.2.5, p. 85. Statement, hypotheses, prerequisites, proof route and checks verified at target level. |
| `PurityForFlatCohomology:PF.4/virtual-dimension-flat-counterexample` | verified | `CS24`: Remark 6.2.6, p. 85. Statement, hypotheses, prerequisites, proof route and checks verified at target level. |
| `PurityForFlatCohomology:PF.4/flat-purity-regular` | corrected | `proofSteps`, `prerequisites`, `acceptance`. Repair boundary-degree descent, the pd-one vanishing bound, signed-exponent contraction and the field counterexample; import existing towers. |
| `PurityForFlatCohomology:PF.5/global-flat-purity` | verified | `CS24`: Theorem 7.1.2 and its proof, pp. 86–87; Lemma 7.1.1, p. 86; `CS24`: Source issue E1 of the paper extraction (Theorem 7.1.2, p. 87). Statement, hypotheses, prerequisites, proof route and checks verified at target level. |
| `PurityForFlatCohomology:PF.5/auslander-endomorphism-freeness` | corrected | `proofSteps`. Verify the exact criterion at CS24 p. 88; remove the unverified depth-induction sketch and expose its original homological proof as gap AUSLANDER-FREENESS. The criterion stays owned here. |
| `PurityForFlatCohomology:PF.5/torsor-gerbe-purity` | verified | `CS24`: Theorem 7.1.3 and its proof, pp. 87–88; Remark 7.1.4, p. 88; `MB85`: Lemme 2. Statement, hypotheses, prerequisites, proof route and checks verified at target level. |
| `PurityForFlatCohomology:PF.5/parafactorial-local-ring` | verified | `EGA44`: Définition 21.13.7, Proposition 21.13.8, Exemples 21.13.9 (i)–(ii), pp. 316–317; Corollaire 21.13.6 (iii), p. 316; Proposition 21.13.10, p. 319; 21.13.12.1, pp. 320–321; `CS24`: Footnote 26 to Theorem 7.2.8, p. 91; `SGA2`: Exposé XI §3, Définitions 3.1–3.2 and Lemme 3.6, pp. 101–102; `C19`: Proof of Corollary 2.5, p. 5. Statement, hypotheses, prerequisites, proof route and checks verified at target level. |
| `PurityForFlatCohomology:PF.5/local-picard-torsion-vanishing` | corrected | `acceptance`. Specify a smooth plane cubic so the elliptic cone is actually a complete intersection. |
| `PurityForFlatCohomology:PF.5/cohen-macaulay-counterexample` | corrected | `proofSteps`, `acceptance`. Correct supported degree one to degree two and give the localization-boundary argument. |
| `PurityForFlatCohomology:PF.5/global-complete-intersection-picard` | corrected | `statement`. Make algebraic closedness explicit in the elliptic sharpness example. |
| `PurityForFlatCohomology:PF.5/gm-cohomology-torsion` | corrected | `proofSteps`, `sources`. Supply the all-degree torsion argument rather than only the i ≤ 2 edge injection; read and cite Grothendieck’s public 1966 version. |
| `PurityForFlatCohomology:PF.5/regular-dimension-two-extension` | verified | `CS24`: Proof of Theorem 7.2.5, p. 90; `C19`: Theorem 1.3 case (i), p. 2; proof of Theorem 5.3, p. 12; `Gro68`: Le groupe de Brauer III, 6.1 b). Statement, hypotheses, prerequisites, proof route and checks verified at target level. |
| `PurityForFlatCohomology:PF.5/brauer-purity-complete-intersection` | verified | `CS24`: Theorem 7.2.5 and its proof, p. 90; announced as Theorem 1.1.3(b), p. 3; `C19`: Theorem 1.3 and Theorem 5.3, p. 2 and p. 12. Statement, hypotheses, prerequisites, proof route and checks verified at target level. |
| `PurityForFlatCohomology:PF.5/brauer-purity-sharpness` | corrected | `statement`, `hypotheses`, `proofSteps`, `acceptance`. Fix the elliptic embedding, distinguish dimensions three and four, and identify the Segre obstruction as nontorsion; strictly local H^2 is zero. |
| `PurityForFlatCohomology:PF.5/multiplicative-type-purity-low-degree` | corrected | `hypotheses`, `proofSteps`. Provide the finite-coefficient lift of a bounded torsion class, and correct the nonexistent gap identifier. |
| `PurityForFlatCohomology:PF.5/multiplicative-type-purity-higher` | verified | `CS24`: Theorem 7.2.9 and its proof, pp. 92–93; footnote 28, p. 92. Statement, hypotheses, prerequisites, proof route and checks verified at target level. |
| `PurityForFlatCohomology:PF.6/strict-local-brauer-purity` | verified | `C19`: Theorem 5.3 (= Theorem 1.3) and its proof, p. 12; Theorem 1.3 cases (i)–(iii), p. 2; `CS24`: Theorem 1.1.3(b) and the paragraph after it, p. 4; proof of Theorem 7.2.5, p. 90. Statement, hypotheses, prerequisites, proof route and checks verified at target level. |
| `PurityForFlatCohomology:PF.6/henselian-torus-punctured-vanishing` | verified | `C19`: Theorem 1.4, p. 3; §5.4, p. 13; Corollary 2.4, p. 5; Definition A.1 and Lemma A.2, p. 15. Statement, hypotheses, prerequisites, proof route and checks verified at target level. |
| `PurityForFlatCohomology:PF.6/coniveau-spectral-sequence` | corrected | `statement`, `hypotheses`, `proofSteps`, `sources`. Replace the false closed-codimension-stratum construction by filtered families of closed supports; fix the ILO preprint locator. |
| `PurityForFlatCohomology:PF.6/torus-low-support-vanishing` | verified | `C19`: Proof of Theorem 6.1, p. 13. Statement, hypotheses, prerequisites, proof route and checks verified at target level. |
| `PurityForFlatCohomology:PF.6/torus-purity` | verified | `C19`: Theorem 6.1 and its proof, p. 13. Statement, hypotheses, prerequisites, proof route and checks verified at target level. |
| `PurityForFlatCohomology:PF.6/brauer-purity-regular` | verified | `C19`: Theorem 1.1, p. 1; deduced in §6, p. 13. Statement, hypotheses, prerequisites, proof route and checks verified at target level. |
| `PurityForFlatCohomology:PF.6/generic-h2-injectivity` | verified | `C19`: Theorem 6.2, condition (6.2.1), p. 13; Remark 6.3, p. 14. Statement, hypotheses, prerequisites, proof route and checks verified at target level. |
| `PurityForFlatCohomology:PF.6/codimension-one-torus-intersection` | verified | `C19`: Theorem 6.2 and its proof, (6.2.2), pp. 13–14. Statement, hypotheses, prerequisites, proof route and checks verified at target level. |
| `PurityForFlatCohomology:PF.6/brauer-codimension-one-intersection` | verified | `C19`: Theorem 1.2 (= Theorem 6.2 for 𝔾\_m), p. 2; Lemma 3.2, p. 7. Statement, hypotheses, prerequisites, proof route and checks verified at target level. |
| `PurityForFlatCohomology:PF.6/flasque-generic-injectivity` | corrected | `hypotheses`, `proofSteps`, `sources`, `acceptance`. Correct Theorem 2.2’s designation, the Ext target in the sign-lattice test and the gap identifier; read CTS87 directly. |
| `PurityForFlatCohomology:PF.6/norm-torus-counterexample` | corrected | `sources`. Replace the indirect CTS87 citation by the directly read polynomial-invariance lemma. |
| `PurityForFlatCohomology:PF.6/brauer-residue` | corrected | `statement`, `proofSteps`, `api`, `tests`. Define residue by pullback to completion without a false Brauer isomorphism, and fix its sign by an explicit crossed product. |
| `PurityForFlatCohomology:PF.6/dvr-brauer-residue-sequence` | corrected | `proofSteps`. Separate the complete-DVR kernel calculation from the general unramified descent theorem, recording the latter as an explicit supplier gap. |
| `PurityForFlatCohomology:PF.6/global-brauer-residue-sequence` | verified | `C19`: Remark 6.4, (6.4.4), p. 14; `Poo17`: Theorem 6.8.3 and Warning 6.8.4, p. 197. Statement, hypotheses, prerequisites, proof route and checks verified at target level. |
| `PurityForFlatCohomology:PF.6/imperfect-residue-exclusion` | verified | `C19`: Footnote 5 to Remark 6.4, p. 14. Statement, hypotheses, prerequisites, proof route and checks verified at target level. |
| `PurityForFlatCohomology:PF.6/codimension-one-deletion-example` | corrected | `proofSteps`, `acceptance`. Give cyclic-algebra generators so the worked residue has the declared sign. |

## Questions and follow-up for the orchestrator

No unanswered question blocks acceptance of this pass. The following recorded inputs still prevent closure and must remain visible in refinement/package work.

1. Keep the SF-PII, PQ-PII and EDP-PII contracts with the designated Part II owners. PQ-PII imports PerfectoidSpaces P7 and Q0, and plans only the remaining valuation, radical/torsion and explicit-tilt refinements.
2. Obtain a readable original proof of Auslander Theorem 1.3 and fill the internal PF.5 gap without creating a second owner for the criterion.
3. Supply the general-DVR unramified descent argument and the maximal-unramified Brauer vanishing inputs through the Brauer foundations owner. Preserve the completion pullback and residue conventions.
4. Keep the three PD.6 imports conditional on that supplier’s resolution; this review does not settle PD.7.
5. Carry the existing upstream pointer notes to the maintainer. They are observations, not edits to another roadmap.
