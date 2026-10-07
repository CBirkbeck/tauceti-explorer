# Independent review: Hecke correspondences on the Fargues–Fontaine curve and local shtuka cohomology

**Verdict: needs_changes.** Job `REV-HeckeStacksAndLocalShtukas`, issue #427; reviewer Claude, session `claude-Zr9jnS`, 7 October 2026. This is a finished independent review of `BP-HeckeStacksAndLocalShtukas` (issue #750, written by Codex, session `codex-T2UIy2`); I did not write that blueprint.

The packet and the suggested Lean file have been corrected in place, and I would accept them as they now stand. The verdict is `needs_changes` for one reason, which a review cannot remove: the roadmap document `research/blueprint/readmes/HeckeStacksAndLocalShtukas.md` is not among this job's deliverables, and it still states what the review found false or replaced (list under *Reader document*). A packet goes live together with its document, so a revision round has one task: regenerate the document from the corrected packet. Nothing else is asked of it. The open requests and the eight recorded gaps are honest and are not grounds for the verdict.

## Counts

| Item | Submitted | After review |
|---|---:|---:|
| Nodes | 46 | 51 |
|   kinds | 15 theorem, 14 construction, 14 comparison, 1 lemma, 1 definition, 1 application | 18 theorem, 17 construction, 13 comparison, 2 definition, 1 application |
| API items | 47 | 215 |
| Unit tests | 46 | 94 |
| Planets | 19 | 22 |
| Baseline declarations | 24 | 8 |
| Source citations in nodes | 67 | 285 |
|   of which excerpts of at most 25 characters | 24 | 0 |
| Prerequisites inside the packet | 75 | 178 |
| Prerequisites in other roadmaps | 135 | 379 |
|   of which at stage level | 71 | 41 |
| Requests | 32 | 22 |
| Gaps | 7 | 8 |
| Mistakes in the sources recorded | no list | 46 |

Per-node verdicts: 46 corrected, 5 added. No node was left as submitted: every node needed at least literal excerpts in place of placeholders. All implementation statuses remain `unchecked`. All five stages are `planned`, none is closed; the packet status is `complete`.

## How the review was done

I fetched the five sources again and reproduced every recorded SHA-256: Fargues–Scholze (author-hosted 356-page file, the text of arXiv v4), Scholze–Weinstein (print-ready file of 27 March 2020), Howe–Klevdal (arXiv v2), Gleason–Lourenço (arXiv v2) and Gleason–Lim–Xu (published PDF). The work was done in passes, each by readers who had not seen the previous pass's findings:

1. **First reading.** Six readers, one per group of nodes, compared every statement, hypothesis, proof step, locator and excerpt with the source passage (statements and proofs), and rewrote API outlines and unit tests. A seventh read all 24 baseline declarations at the pinned commits and audited the Lean file; an eighth read the statement of every cross-roadmap prerequisite in its supplier packet.
2. **Second reading.** Six fresh readers re-derived the corrected nodes from the sources, recomputed every test value, and judged every recorded source mistake at its locator. The first reading recorded 56 errors, 45 gaps and 110 minor points; the second found a further 15 errors and 19 gaps in the rewritten text (for example a wrong definition of bounded substacks for non-split groups, the direction of the bound in the definition of local shtukas, and a proof step for Fargues–Scholze IX.2.3 that did not follow).
3. **Suppliers.** The cross-roadmap prerequisites and requests were reconciled after each reading, and twice more against the main branch (last at commit `bad0a156`), because the packets of v-stack sheaves, Bun_G, diamonds, parameter stacks, excursion operators and geometric Satake were rewritten by other jobs while this review ran.
4. **Final check.** Two readers read the result as a whole (12 more errors, among them one in the node I had added myself), and an extra verifier recomputed the constant-term computation of Fargues–Scholze IX.7.2 on GL_2.

My own checks: the red-team findings and their fix reports; the σ-conjugation counterexample (recomputed); the missing pro-p hypothesis in IX.3.2 (found independently); the sign of III.3.6(ii) on G_m; the orientation conventions of FS pp. 324 and 336–338; every baseline declaration that remains cited; the new source findings added at the second reading. Every excerpt in the packet (285) is verified by script to be a literal substring of the extracted source text, after normalising whitespace and Unicode compatibility forms. One derived statement comes from the final check alone and was not re-derived by a second reader: the direction of the Weil descent datum and its twist b·σ(b)⋯σ^{f−1}(b) on the period space when the reflex field is larger than E (`HS2/weil-descent-datum`). A session limit ended the verifier and the two final checkers once; they were rerun from scratch.

## Corrections, by stage

Every node changed; the list gives what mattered. "Beyond the sources" means: the node now says that the cited texts do not state the claim, and proves it in its proof steps.

**Packet-wide.**
- *Orientation.* The submitted packet carried a dictionary "μ_FS = μ_SW⁻¹" and no definition of the relative position of a modification. One convention is now fixed in `HS0/bounded-hecke-substacks` and used everywhere: (E_1, E_2, α) has position μ when E_1 lies in the cell of μ(ξ) in a trivialisation of E_2 (for G_m: E_1 = E_2(−D)); then κ(E_1) = κ(E_2) + μ♯, the kernel of T_V lives on positions bounded by the weights of V, and T_{V_n} for G_m raises the degree by n. This is the convention of Fargues–Scholze pp. 336–338 and of Scholze–Weinstein (b ∈ B(G, μ⁻¹)). FS p. 324 and Proposition III.3.6(ii) disagree with it and are recorded as mistakes of the source.
- *Hypotheses.* Two blanket strings ("Both characteristics of E are allowed unless a node explicitly says…", "…are distinct carriers…") were on every node, also on nodes that are about Q_p only. They are replaced by exact standing hypotheses; E = Q_p is stated where the sources need it (ten HS0/HS2 nodes).
- *Excerpts.* 24 excerpts were placeholders of at most 25 characters ("Proposition 19.5.3.", "Step 1.", "the pullback"); one was not in the source; one was on another page. All 67 citations were replaced by 285 literal passages with result number and printed page.
- *Process remarks* in statements, proof steps and acceptance items (instructions, ownership notes, remarks on the Lean prototype) were removed.

**HS0.** The global Hecke stack is defined with its source, target and leg maps and repetition maps (the sources define it for one leg only: recorded). `descent-and-bounded-fibres` now states which maps are proper, representable in spatial diamonds and of finite dim.trg, and derives it. `chains-and-composition` cited Scholze–Weinstein Definition 23.4.1, which is the two-leg twisted Grassmannian; it now rests on SW 20.4.2 and FS VI.8–VI.9. `twisted-period-grassmannian`: the claim "canonically independent of b" (SW Remark 23.4.3) is replaced by what holds (the two charts differ by b·σ(b)⋯σ^{m−1}(b)). `structure-group-and-inner-form`: the Kottwitz sign is fixed and central characters are stated.

**HS1.** The kernel and Hecke-operator nodes were lists of instructions; they now state the objects with source and target categories (T_V: D_lis(Bun_G,Λ) → D_■(Bun_G×(Div¹)^I,Λ)). The node for FS IX.2.1 was a "lemma" under an HS0 id; it is the theorem itself. `continuous-weil-descent` cited Drinfeld's lemma IV.7 (torsion étale sheaves); the proof of IX.2.3 uses the solid VII.2.6–VII.2.8, and its reduction to one leg did not follow as written: rewritten with the W_E^I-torsor (Spd C)^I → (Div¹)^I. `coefficient-base-change` is a stage target that the source never states: proved, beyond the sources. Monoidality (T_1 = id, composition, fusion) had no node: added.

**HS2.** `local-shtuka-moduli`: the definition of SW 23.1.1 is now complete; the change-of-framing formula copied the source's misprint σ(y)by⁻¹ (correct: y·b·σ(y)⁻¹); the bound is on φ_P⁻¹. `framed-bundle-fibres`: the stage's two-bundle fibre has a source only when one class is trivial; defined exactly, the general case beyond the sources. `general-local-field` claimed that FS IX.3 "explicitly supplies" the tower for general E; the source has one sentence referring to a lecture about Q_p. It is now a construction (K-lattices in the G(E)-torsor over the admissible locus), beyond the sources, for both characteristics; its sentences on "partial Frobenius descent" were wrong for several legs and are replaced by the new node `weil-descent-datum`. `minuscule-rigidification`: partial properness is not in Scholze–Weinstein; proved. `classical-period-points` and `adjoint-period-and-tower-comparison` had dropped the hypothesis κ(b) = μ♮ of Gleason–Lim–Xu and are false without it (counterexamples in the nodes). `component-transitivity-source-gate` was a theorem whose proof step was "an explicit unresolved gap": it now has a proof for minuscule μ by two topological lemmas that replace the false Lemma 3.2 of the paper, and a precise gap for non-minuscule μ. The compactifiability of the structure map, which HS3 needs to form cohomology, had no node: added.

**HS3.** `satake-coefficients-and-partial-frobenius` and `compact-support-at-levels` depended on each other in the wrong order; the definitions now come first. The shift formulas for minuscule μ were recomputed and are right. `general-bound-compactness` and the packet's gap on "the compactness range of IX.3.2" are replaced by a source finding: the proposition is false for levels that are not pro-p. Finite generation of H^i_c needs noetherian Hecke algebras (Dat–Helm–Kurinczuk–Moss), now a prerequisite. The duality chain of p. 325 is exact only for basic b. "Λ = Q_ℓ" was Q̄_ℓ. `level-trace-and-pullback` cited a sentence about the period map; the identities are right, are in no cited source, and "finite p-power indices" holds only below a pro-p level. `classical-comparison`: the Dieudonné normalisation (slopes in [−1,0], so b ∈ B(GL_n, μ⁻¹)) and the shift d(n−d) are corrected. The stage asks for complexes with J_b(E), J_b′(E) and Weil actions; every node took b′ = 1: `hecke-operators-between-strata` added.

**HS4.** `monoidal-and-finite-set-functoriality` now states permutation, fusion, unit insertion and iterated modifications exactly. `creation-annihilation-and-triangles` gains the general (I, V, α, β) form that excursion operators use. `isogeny-product-and-weil-restriction-diagrams`: the displays agree with the source symbol by symbol; a proof step was false for several legs; part (d), T_{V′}(π^*A) ≅ (π×id)^*T_V(A), is added beyond the sources and was re-derived twice. `weil-restriction-hecke-diagram` had the inflation backwards and needs √q′ = (√q)^f. `levi-compatibility` stated no identity, only conditions; it now states what pp. 336–337 compute (torsion coefficients, one stratum), with the shift and twist in the packet's orientation, recomputed on GL_2 by two readers. `continuous-tensor-generator-export` had no mathematical content; it now lists the properties that the proof of IX.5.1 uses.

## Nodes added

- `HeckeStacksAndLocalShtukas:HS0/bounded-hecke-substacks` (definition): Relative position and the bounded substacks Hck^I_{G,≤μ•} and Hck^I_{G,W}. Stage target "bounded substacks for tuples of dominant cocharacters"; fixes the orientation used by all later nodes; non-split groups through Galois-stable sets of cocharacters.
- `HeckeStacksAndLocalShtukas:HS1/monoidality-of-hecke-operators` (theorem): Monoidality of V↦T_V and functoriality in the set of legs. Stage target "T_unit = identity, tensor/convolution composition and fusion"; the first step of the proofs of FS IX.2.1–IX.2.3, which no node stated.
- `HeckeStacksAndLocalShtukas:HS2/structure-map-compactifiable` (theorem): Structure maps of the tower: separated, compactifiable, of locally finite dim.trg. Stage target "boundedness conditions needed for compactly supported cohomology": f_K is compactifiable, representable in locally spatial diamonds, of locally finite dim.trg.
- `HeckeStacksAndLocalShtukas:HS2/weil-descent-datum` (construction): Weil descent datum of the one-leg tower. Stage target "descent to the reflex field of the bound and the resulting Weil action"; statements (1)–(3) are derived, not quoted.
- `HeckeStacksAndLocalShtukas:HS3/hecke-operators-between-strata` (construction): Hecke operators between two Newton strata. Stage target "complexes with commuting J_b(E), J_b′(E) and Weil actions": Φ^{b′,b}_V = i^{b*}T_Vπ_{b′♮}q_{b′}^*, compactness and adjunction by the argument of FS IX.3.1; written by the reviewer and checked by a final reader.

## Baseline citations

All 24 submitted declarations exist under the cited names and modules at Mathlib `082e2d3` and Tau Ceti `f790474`, and none had the `kind` field. Sixteen were cited by no node (`WittVector`, `ReductiveAffineGroupSchemeCat`, `Representation`, `Equivalence`, `Karoubi`, `Sheaf`, `DerivedCategory`, `Profinite`, `CompHaus`, `Huber.Pair`, `ValuationSpectrum.spa`, `IsSmoothDiscrete`, `SmoothDiscreteTopRep`, `Subgroup`, `Subgroup.quotientMapOfLE`, `ExactPairing`) and are removed from the list, except `ExactPairing`, which is the declaration the nodes use. `mathlib:CategoryTheory.LeftRigidCategory` was a near miss: it gives left duals only, while FS IX.2.2 needs exact pairings of V and V^∨ in both orders; the two nodes now cite `mathlib:CategoryTheory.ExactPairing`. I read the statement of each remaining declaration at the pinned commit. `TauCeti.SmoothDiscreteTopRep` is the right carrier of smooth representations only for a coefficient ring with the discrete topology; this is recorded in `libraryAudit`.

| Declaration | Kind | Module | Cited by |
|---|---|---|---|
| `mathlib:CategoryTheory.Adjunction` | structure | `Mathlib/CategoryTheory/Adjunction/Basic.lean` | HS1/hecke-operator-via-relative-homology, HS1/properties-and-weil-equivariance |
| `mathlib:CategoryTheory.ExactPairing` | class | `Mathlib/CategoryTheory/Monoidal/Rigid/Basic.lean` | HS1/properties-and-weil-equivariance, HS4/creation-annihilation-and-triangles |
| `mathlib:CategoryTheory.Functor.Monoidal` | class | `Mathlib/CategoryTheory/Monoidal/Functor.lean` | HS4/creation-annihilation-and-triangles, HS1/monoidality-of-hecke-operators |
| `mathlib:CategoryTheory.MonoidalCategory` | class | `Mathlib/CategoryTheory/Monoidal/Category.lean` | HS1/monoidality-of-hecke-operators |
| `mathlib:Condensed` | abbrev | `Mathlib/Condensed/Basic.lean` | HS1/condensed-enrichment |
| `mathlib:CondensedMod` | abbrev | `Mathlib/Condensed/Module.lean` | HS1/condensed-enrichment |
| `mathlib:WittVector.Isocrystal` | class | `Mathlib/RingTheory/WittVector/Isocrystal.lean` | HS2/local-shtuka-moduli |
| `tauceti:TauCeti.AffineGroupSchemeCat` | abbrev | `TauCeti/AlgebraicGeometry/AffineGroupScheme/Basic.lean` | HS2/local-shtuka-moduli |

## Closure: prerequisites, requests, gaps, stage order

The submitted packet had 135 cross-roadmap prerequisites, 71 of them whole stages. Many stage prerequisites had a finer node (FS VI.2.7 in `GS0:loop-geometry`, III.2.4 in `BG2:uniformization`, SW 22.6.1 in `VectorBundlesAndIsocrystals:VB4`), some named the wrong owner (`RF4:G-torsors` for the integral local-system equivalence, `SR.0` for the topology of G(E), `GS0:Witt-geometry` for bounded properness), and three node-level prerequisites were the wrong node. The prerequisites now follow the proof steps result by result. Requests are statements with their source numbers, and each `neededBy` equals the set of nodes that list the stage. The gap that listed all 46 nodes ("conditions omitted from Lean prototypes") named no missing input and is removed; the gap on IX.3.2 became a source finding.

Stage order, by script: no path from a consuming stage HS0–HS4 to any of its supplier stages in the live graph, and the atlas build assembles with the packet in a scratch copy of the live blueprints. With the links that unpromoted packets would add there are latent cycles that do not come from this packet (see the questions). `SmoothRepresentationsOfLocalGroups:SR.6` is a new supplier of HS3 (one clause of one node); it puts HS3 after the excursion stages that SR.6 uses, without a cycle.

Requests after the review (supplier stage: consuming nodes):

- `AdicEtaleGeometry:A2`: HS2/minuscule-rigidification
- `BunGAndNewtonStrata:BG2:uniformization`: HS4/weil-restriction-hecke-diagram
- `BunGAndNewtonStrata:BG3`: HS2/nonemptiness-and-period-connectedness, HS4/levi-compatibility
- `EndoscopicTransferAndUnitaryTraceComparison:ET.6a`: HS3/classical-comparison
- `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2`: HS3/classical-comparison
- `GeometricSatakeAndFusion:GS0:Schubert-smoothness`: HS2/minuscule-rigidification, HS2/classical-period-points
- `GeometricSatakeAndFusion:GS0:loop-geometry`: HS0/descent-and-bounded-fibres, HS0/chains-and-composition, HS0/twisted-period-grassmannian
- `GeometricSatakeAndFusion:GS1`: HS0/demazure-generators-of-ULA-kernels
- `GeometricSatakeAndFusion:GS3:fusion`: HS3/satake-coefficients-and-partial-frobenius
- `GeometricSatakeAndFusion:GS4:integral-dual-group`: HS1/continuous-weil-descent, HS4/weil-restriction-hecke-diagram, HS3/satake-coefficients-and-partial-frobenius
- `LanglandsParameterStacks:LP3`: HS0/demazure-generators-of-ULA-kernels, HS1/continuous-weil-descent
- `PadicHodgeTheory:R06.2`: HS2/classical-period-points, HS2/admissible-period-torsor
- `ReductiveGroupsPartII:RG2.0`: HS2/levels-and-tower-limit, HS2/torus-products-and-determinant
- `SmoothRepresentationsOfLocalGroups:SR.0:derived-extension`: HS3/compact-support-at-levels, HS3/admissibility-duality-and-adjunction
- `SmoothRepresentationsOfLocalGroups:SR.1`: HS3/compact-support-at-levels, HS3/admissibility-duality-and-adjunction, HS3/level-trace-and-pullback
- `SmoothRepresentationsOfLocalGroups:SR.2`: HS3/hecke-cohomology-comparison, HS3/compactness-of-shtuka-cohomology, HS3/general-bound-compactness, HS3/admissibility-duality-and-adjunction
- `SmoothRepresentationsOfLocalGroups:SR.3`: HS3/admissibility-duality-and-adjunction
- `SmoothRepresentationsOfLocalGroups:SR.6`: HS3/compactness-of-shtuka-cohomology
- `VStackSheavesAndLisseCategories:VS0`: HS4/levi-compatibility
- `VStackSheavesAndLisseCategories:VS2`: HS1/coefficient-base-change
- `VStackSheavesAndLisseCategories:VS4`: HS1/condensed-enrichment, HS3/hecke-cohomology-comparison, HS3/admissibility-duality-and-adjunction
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group`: HS1/condensed-enrichment, HS1/continuous-weil-descent, HS2/weil-descent-datum

Gaps after the review:

- **Classical O_E-linear and EL/PEL comparison inputs** (needed by HS3/classical-comparison).
- **Comparison of classical and diamond compact support, and duality in dimension d** (needed by HS3/huber-cohomology-comparison, HS3/satake-coefficients-and-partial-frobenius).
- **Connectedness and density after removing a locus of smaller dimension** (needed by HS2/nonemptiness-and-period-connectedness).
- **Dimension theory for stacky maps used in the connectedness proof** (needed by HS2/nonemptiness-and-period-connectedness).
- **Open connected components of finite-level local shtuka spaces for non-minuscule μ** (needed by HS2/component-transitivity-source-gate).
- **Compactness of the level colimit for compact ρ** (needed by HS3/admissibility-duality-and-adjunction).
- **Geometric description of Hecke operators from a non-basic stratum** (needed by HS3/hecke-operators-between-strata).
- **Non-emptiness of the weakly admissible locus (Rapoport–Viehmann, Proposition 3.1)** (needed by HS2/nonemptiness-and-period-connectedness).

## API and unit tests

The 46 submitted unit tests were functor laws and identities of a Lean prototype ("the image of id_A is id", "changing framing by 1 leaves b unchanged", "at K = G the fibre is a singleton"): the audit proved all of them from library facts without using any object of the roadmap, so none could fail for a wrong definition. They are replaced by 94 tests about the objects, each with the wrong definition it excludes recorded in the working notes, and each value recomputed by a second reader: for example no legs and b = 1 gives G(Q_p)/𝒢(Z_p); for G_m with one leg the space is non-empty exactly for κ(b) = −μ♯; the Lubin–Tate tower for GL_2 with its components and the degree of level maps; S′_V = i_{μ♮}Λ[−d](−d/2) for minuscule μ; T_{V_n} raises the degree by n on Bun_{G_m}; the composite id → T_{V⊠V^∨} → id is rank V; c-Ind from a level that is not pro-p is not compact. API outlines went from three items per object (constructor and two projections of the prototype) to 215 items covering structure maps, extensionality, functoriality, base cases and the comparisons that consumers use; `uses` lists were checked and two fictitious uses removed.

## Suggested Lean file

The submitted file modelled every object by arbitrary categories and functors. It elaborated, but the audit proved all 46 of its examples from library facts, with no object of the roadmap in them; five "constructions" were identity functions or bare functor application, `LevelTower` was a placeholder for a functor that can be written in four lines, and the period torsor was a chosen bijection, against the node's own statement. The file is rewritten (9,521 lines):

- a section *Imported interfaces*: opaque stand-ins, each with its owning roadmap in the docstring, for perfectoid test objects and v-stacks, Div¹, Bun_G and its strata, the local Hecke stack and Grassmannians, the Satake category, D_■, D_lis and D_ét with their functors, derived smooth representations, rigid spaces; built on Mathlib where Mathlib has the ambient notion (sheaves on a site, limits, adjunctions, monoidal functors, exact pairings, open subgroups, indices);
- a group-theoretic layer with no placeholder: σ-conjugation in the orientation g·b·σ(g)⁻¹, B(G), σ-centralisers, levels as compact open subgroups, coset maps;
- the packet stage by stage: all 215 API items and all 94 unit tests as declarations and examples under the packet's names, and the 32 theorem, comparison and application nodes under their slugs. A script finds no API item without a declaration and no test without an example.

Of these 341 items, 210 are stated in full and 131 carry a mark `-- Omitted:` for a clause that the interfaces cannot express (bundles and lattices over B_dR, ∞-categorical coherences, colimits in stable ∞-categories). The file elaborates with `lean-check` at the pinned Mathlib in the shared build: exit 0, 991 messages, every one the warning for the proof placeholder. Elaboration certifies types, not mathematics. The two triangle identities for creation and annihilation are proved rather than left open.

Two things a reader of PROTOCOL §13 should know. (1) Properties of morphisms and objects that other roadmaps own (proper, étale, compactifiable, cohomologically smooth, lisse, universally locally acyclic) are opaque `MorphismProperty` and `ObjectProperty` values. They are imported notions, not conditions of this packet's objects left out, and no structure has a proposition-valued field standing for a missing condition; but they are placeholders with propositional values, and if §13 is read as excluding them they have to become omitted clauses. (2) The file imports no `TauCeti.*` module, because the shared build has no object files for the group-scheme, comodule and smooth-representation modules; reductive groups and smooth representations are stand-ins. While typing the statements the writers reported 39 defects of the packet (undefined notation, two conventions for one action, a test with a coefficient ring that is not allowed, a uniqueness claim without "perverse"); all were settled in the packet before the file was finished.

## Mistakes in the sources (PROTOCOL §18)

The submitted packet had no `sourceIssues` list, although it cites passages with fourteen mistakes already in the register and its own gap text described one more. The list now has 46 entries, each found by one reader and judged at its locator on the PDF page by a second one; my verdict is recorded in each entry. `sourceVersions` says what was read: the findings about Fargues–Scholze are scoped to the author-hosted copy (text of arXiv v4; Astérisque 466 was not read), those about Scholze–Weinstein to the print-ready file (the published volume was not collated).

| Id | Source | Locator | Kind | Affects | Status |
|---|---|---|---|---|---|
| E1 | Fargues–Scholze | Chapter III, §III.3, Proposition III.3.6(ii), p. 100, and item (ii) of the non-split case on the same page … | error | a stated result | new |
| E2 | Scholze–Weinstein | Lecture 23, Remark 23.4.3 and the proof of Proposition 23.4.2, p. 222 (print-ready copy of 27 March 2020) | gap | the proof | new |
| E3 | Scholze–Weinstein | Lecture 23, Proposition 23.4.2 (p. 222) and Definition 23.5.1 (p. 223) (print-ready copy of 27 March 2020) | misprint | nothing | new |
| E4 | Fargues–Scholze | Chapter IX, introduction, p. 317, and §IX.2, pp. 321–322 (author-hosted 356-page copy) | gap | nothing | new |
| E5 | Fargues–Scholze | Chapter VI, §VI.2, Definition VI.2.6, p. 200 | misprint | nothing | in the register: PAPER-FARGUES-SCHOLZE-21/E38 |
| E6 | Scholze–Weinstein | Lecture 20, Definition 20.4.2 and Definition 20.4.4, p. 187 | misprint | nothing | in the register: PAPER-SCHOLZE-WEINSTEIN-20/E6 |
| E7 | Fargues–Scholze | Chapter III, §III.3, p. 100, non-split case, item (i) | misprint | nothing | in the register: PAPER-FARGUES-SCHOLZE-21/E18 |
| E8 | Fargues–Scholze | Chapter VII, §VII.7, Proposition VII.7.9, p. 275 | misprint | nothing | in the register: PAPER-FARGUES-SCHOLZE-21/E110 |
| E9 | Fargues–Scholze | Chapter VII, §VII.7, Proposition VII.7.10, p. 276 | misprint | nothing | in the register: PAPER-FARGUES-SCHOLZE-21/E56 |
| E10 | Fargues–Scholze | Chapter IX, §IX.2, proof of Theorem IX.2.2, last sentence, p. 323 (author-hosted 356-page file) | misprint | nothing | new |
| E11 | Scholze–Weinstein | Lecture 22, §22.4, p. 210 (paragraph after Definition 22.4.1), and Lecture 23, Remark 23.1.3, p. 217; print… | misprint | nothing | new |
| E12 | Scholze–Weinstein | Lecture 23, proof of Proposition 23.3.1, p. 218; print-ready file of 27 March 2020 | gap | the proof | new |
| E13 | Scholze–Weinstein | Lecture 23, Proposition 23.3.1 (first bullet), p. 218, and the description of Sht_{G,b,µ,∞}, p. 219; print-… | misprint | nothing | new |
| E14 | Scholze–Weinstein | Lecture 23, §23.1, the two displays of the second paragraph, p. 216, and Definition 23.1.1, third bullet, p… | misprint | nothing | new |
| E15 | Scholze–Weinstein | Lecture 23, §23.4, first display, p. 221; print-ready file of 27 March 2020 | misprint | nothing | new |
| E16 | Scholze–Weinstein | Lecture 23, proof of Proposition 23.2.1, p. 218; print-ready file of 27 March 2020 | error | nothing | new |
| E17 | Gleason–Lim–Xu | Proposition 6.6(1), (6.4), p. 849, and Step 1 of its proof, p. 850 (published version) | misprint | nothing | new |
| E18 | Gleason–Lim–Xu | Lemma 3.2, p. 820, and the proof of Proposition 3.12, p. 828 (published version) | error | a stated result | in the register: PAPER-GLEASON-LIM-XU-26/E01 |
| E19 | Howe–Klevdal | Proposition 7.3.3, p. 43 (arXiv v2) | misprint | nothing | in the register: PAPER-HOWE-KLEVDAL-26/E7 |
| E20 | Gleason–Lourenço | Proof of Theorem 3.2, p. 10 (arXiv v2) | misprint | nothing | new |
| E21 | Fargues–Scholze | Chapter IX, §IX.3, Proposition IX.3.2, p. 326; the same omission in Chapter I, §I.7, Corollary I.7.3, pp. 3… | error | a stated result | new |
| E22 | Fargues–Scholze | Chapter IX, §IX.3, Proposition IX.3.2, last sentence, and the end of its proof, pp. 326–327; the same sente… | gap | the proof | new |
| E23 | Fargues–Scholze | Chapter IX, §IX.3, the two sentences after Theorem IX.3.1, p. 324 | gap | the proof | new |
| E24 | Fargues–Scholze | Chapter IX, §IX.3, first paragraph and proof of Theorem IX.3.1, p. 324; compare §IX.7.2, proof of Corollary… | misprint | nothing | new |
| E25 | Fargues–Scholze | Chapter IX, §IX.3, displayed chain of isomorphisms on p. 325, second line | error | nothing | new |
| E26 | Fargues–Scholze | Chapter IX, §IX.3, proof of Proposition IX.3.2, p. 326 | misprint | nothing | new |
| E27 | Fargues–Scholze | Chapter IX, §IX.3, first line of p. 326; the same in Chapter I, §I.7, p. 31 | misprint | nothing | new |
| E28 | Scholze–Weinstein | Lecture 24, proof of Theorem 24.2.5, pp. 227 and 228 (two displays) | misprint | nothing | new |
| E29 | Scholze–Weinstein | Lecture 24, §24.3, footnote 1, p. 230 | misprint | nothing | new |
| E30 | Scholze–Weinstein | Lecture 24, proof of Corollary 24.3.5, p. 231, first sentence | misprint | nothing | new |
| E31 | Fargues–Scholze | Chapter IX, §IX.6.1, proof of Theorem IX.6.1, p. 331 | misprint | nothing | in the register: PAPER-FARGUES-SCHOLZE-21/E70 |
| E32 | Fargues–Scholze | Chapter IX, §IX.6.1, Theorem IX.6.1, p. 330, the diagram | misprint | nothing | in the register: PAPER-FARGUES-SCHOLZE-21/E122 |
| E33 | Fargues–Scholze | Chapter IX, §IX.6.1, proof of Theorem IX.6.1, p. 330 | misprint | nothing | new |
| E34 | Fargues–Scholze | Chapter IX, §IX.6.1, proof of Theorem IX.6.1, p. 331, sentence after the displayed computation | misprint | nothing | new |
| E35 | Fargues–Scholze | Chapter IX, §IX.6.2, Proposition IX.6.2, p. 331, top row of the diagram | misprint | nothing | in the register: PAPER-FARGUES-SCHOLZE-21/E66 |
| E36 | Fargues–Scholze | Chapter IX, §IX.6.2, Proposition IX.6.2, second paragraph, p. 331 | misprint | nothing | in the register: PAPER-FARGUES-SCHOLZE-21/E67 |
| E37 | Fargues–Scholze | Chapter IX, §IX.6.3, proof of Proposition IX.6.3, p. 332 | error | the proof | in the register: PAPER-FARGUES-SCHOLZE-21/E121 |
| E38 | Fargues–Scholze | Chapter IX, §IX.6.3, proof of Proposition IX.6.3, p. 332, second half | gap | the proof | new |
| E39 | Fargues–Scholze | Chapter IX, §IX.7.1, p. 334, the formula for Z¹(W_E, Ĝ_b) → Z¹(W_E, Ĝ) | misprint | nothing | in the register: PAPER-FARGUES-SCHOLZE-21/E124 |
| E40 | Fargues–Scholze | Chapter IX, §IX.7.1, proof of Theorem IX.7.2, pp. 335–336 | misprint | nothing | new |
| E41 | Fargues–Scholze | Chapter VIII, §VIII.4, first line of p. 291 | misprint | nothing | in the register: PAPER-FARGUES-SCHOLZE-21/E117 |
| E42 | Scholze–Weinstein | Lecture 23, §23.3, the two paragraphs before the display of the period morphism, p. 220 (lines 1, 4 and 11 … | misprint | nothing | new |
| E43 | Gleason–Lourenço | Section 3, the sentence after (3.1) and the definition of d^M_{μ,b} before Theorem 3.2, p. 10 (arXiv v2) | misprint | nothing | new |
| E44 | Scholze–Weinstein | Lecture 24, §24.3, paragraph before Definition 24.3.2, p. 230 (print-ready copy of 27 March 2020) | misprint | nothing | new |
| E45 | Fargues–Scholze | Chapter IX, §IX.5, proof of Proposition IX.5.1, p. 328 | gap | the proof | new |
| E46 | Fargues–Scholze | Chapter IX, §IX.7.1, proof of Theorem IX.7.2, pp. 336–337 | gap | the proof | new |

The entries that matter most for formalisers: **E21** (Fargues–Scholze IX.3.2 and I.7.3 assert compactness and perfectness for every compact open level; false unless the level is pro-p: for G_m, the trivial cocharacter, K = Z_p^× and ℓ dividing p − 1 the complex is c-Ind F_ℓ and Ext^n into the trivial representation is H^n(F_p^×, F_ℓ) ≠ 0 for all n); **E1** (III.3.6(ii): the composite of the Beauville–Laszlo map with κ is +μ♯ on Gr_{G,μ}, not its opposite, by the G_m case with the lattice ξB⁺_dR, O ≅ I(1) and c_1 = −κ); **E11** (Scholze–Weinstein pp. 210, 217 print σ-conjugation as φ(y)by⁻¹; this relates 1 to an element σ-conjugate to diag(p, p⁻¹)); **E24** (p. 324: b ∈ B(G,μ) against the tower of Scholze–Weinstein and the convention of pp. 336–338); **E25** (the duality chain of p. 325 for non-basic b); **E22** and **E23** (two assertions after IX.3.1 and in IX.3.2 without proof); **E38** (the Satake step of IX.6.3 is asserted); **E40** (orientation of P and b_N in the proof of IX.7.2); **E45** (the ⊗-generator step of IX.5.1 does not follow with Z_ℓ-coefficients); and the gap in the proof of IX.7.2 on pp. 336–337 (the character of G_b(E) on Rπ_!Λ is never tracked; the statement of the theorem is not affected). Fourteen entries repeat register entries (`known` names them) and are listed because nodes cite those passages; the nodes use the corrected statements.

Candidate findings rejected at the second reading and not recorded:
- FS-geometrization, Chapter IX, §IX.2, proof of Proposition IX.2.1, p. 322 (author-hosted 356-page file): The map q of the proof of IX.2.1 is defined in §I.7, p. 30; not a mistake.
- FS-geometrization, Chapter IX, §IX.3, paragraph before Proposition IX.3.2, p. 325 (author-hosted 356-page fil: A remark on the scope of a citation ("As in [SW20, Lecture XXIII]" for a general E); nothing stated is false.
- HK23v2, Proposition 7.3.4, p. 43 (arXiv v2): Proposition 7.3.4 without the hypothesis on [b] is wrong only if the empty space is not called connected; a matter of convention.
- FS-geometrization, Chapter IX, §IX.3, first paragraph, p. 324: A citation remark ([SW20, Lecture 24] does not state partial properness or a Weil descent datum); nothing stated is false.

One further observation is not recorded: whether the sentence of p. 337 on CT_P(S_V) has the wrong orientation. Two readers computed that, in the orientation of the Hecke operators of pp. 337–338, Rg_!S_V is the constant term of sw^*S_V (shift [−deg_P], inverse twist); but the text does not fix which parabolic and which orientation of the local Hecke stack are meant, and under the other reading the sentence is numerically right. The node `HS4/levi-compatibility` states the result in the packet's orientation.

## Red-team findings handed to the blueprint (item 9a)

- **RT-AREA-geomlanglands/2** (owner of the comparison with classical towers). Not settled by the packet, and it cannot be. The verifier and both fix reports chose that the two-tower layer ET.6a owns the comparison; the stage texts of ET.6a ("export … to HS3's Hecke-fibre comparison") and the accepted RS-22 still place it with HS2/HS3, and the fix reports edited no stage text. The packet keeps `HS3/classical-comparison` (Scholze–Weinstein 24.2.5, 24.3.5, corrected) with ET.6a asked only for the independently built towers, and its first `restructure` entry states both options with their links. ET.6a → HS3 is acyclic. See question 1.
- **/13** (VS5 → HS1 for VII.7.6, VII.7.9). Right: `HS1/ula-preservation` and `HS1/duality-exchange` cite the supplier's lisse nodes, which exist on main since the supplier packet was rewritten; the request to VS5 is no longer needed.
- **/19** (owner of the perfect-complex extension). The Satake packet took the branch "GS4 owns it": `GS4:integral-dual-group/enhanced-perfect-satake-extension` states the extension with LP3 and LP4 as its prerequisites. The submitted packet also listed LP3 and LP4 on the kernel node, planning the same statement twice; removed. HS1 asks LP3 only for the reductions to exterior tensor products in IX.2.1 and IX.2.3, and GS4 for the convergence of the infinite resolution, which the extension to perfect complexes does not give.
- **/20** (rigid tower; Huber's RΓ_c). Right in substance: `HS2/minuscule-rigidification` with the étale-site comparison of D6 and the minuscule cell of GS0; the non-emptiness criterion is separate. Partial properness, which FS attribute to Scholze–Weinstein and which is not there, is now proved in the node. The Huber-versus-diamond comparison is `HS3/huber-cohomology-comparison` with a gap and a restructure entry, since no layer owns it.
- **/21** (the Demazure node under HS0). Right: parent and `realises` are HS1; the node is now FS IX.2.1 itself. Its id still begins `HS0/`, which only a rename can cure (question 5).
- **/22** (general E). The submitted node claimed the source supplies it. Now right: `HS2/general-local-field` is a construction with API and tests for E of either characteristic, marked as beyond the sources, and SW 23.1.1 stays the Q_p case. The integral description over a general O_E is not needed by any node and is no longer requested.
- **/29** (lisse VII.7.6–VII.7.10 in VS5). Outside this packet; the supplier packet on main now has those nodes, and this packet cites them.

## Library audit (item 7)

The reviewed audit (AUDIT-21) says that nothing of the five layers is built; that holds. No node plans anything the audit or the pinned libraries have. Library notions that the old Lean file re-declared under new names (coset maps, torsors, compact induction, exact pairings, Stonean spaces, open subgroups) are now used directly in the Lean file.

## Reader document

Not editable by this job. It is the rendering of the submitted packet and disagrees with the corrected one throughout; the statements below are ones the review found false, with their lines in the document:

- line 13 (and 704, 904): the dictionary "μ_FS = μ_SW⁻¹";
- line 189: the twisted Grassmannian "canonically independent of b";
- line 234: "the Kottwitz difference of a modification is μ^natural" without orientation;
- line 591: change of framing by σ(y)by⁻¹;
- line 835: FS IX.3 "explicitly supplies this general-E tower", and "partial Frobenius descent over Spd F̆_i/φ^Z";
- line 936: a theorem whose proof step is "an explicit unresolved source-proof gap";
- line 1261: "For Λ = Q_ℓ"; line 1309: "covariant Dieudonné isocrystal" with the wrong sign of slopes;
- line 1464: "projection/inflation from Ĝ⋊W_E′ to Ĝ′⋊W_E′" (backwards);
- line 1486: the Levi node as a list of conditions; line 1745: "Compactness range of IX.3.2" as a gap;
- lines 5 and 50: 46 prototype unit tests, 24 baseline declarations, `LeftRigidCategory`.

The document also lacks the five added nodes, the 94 tests and the source findings.

## Questions for the orchestrator

1. **Owner of the comparison with classical towers** (Scholze–Weinstein 24.2.5, 24.3.5). The verifier of RT-AREA-geomlanglands/2 and both fix reports say ET.6a; the stage texts, RS-22 and the consumer `ES7:GLn-comparison` (which cites the stage HS3) say HS2/HS3. No packet exists for ET.6a. Please decide; the packet's first `restructure` entry gives the links for both answers. If ET.6a owns it, `HS3/classical-comparison` moves there unchanged.
2. **SR.6 as supplier of HS3.** Finite generation of each H^i_c (asserted after FS IX.3.1) needs noetherian Hecke algebras over Z_ℓ, which Dat–Helm–Kurinczuk–Moss prove using the Fargues–Scholze map to the Bernstein centre. `HS3/compactness-of-shtuka-cohomology` therefore cites SR.6, which orders HS3 after ES1, ES6:functoriality and ES7:parabolic. There is no cycle. If the order is unwanted, the clause can go back to a gap.
3. **Latent stage cycles from other packets.** With the links that unpromoted packets would add, 38 pairs (supplier layer, HS stage) lie on a cycle; the set is the same with the submitted packet. All pass through `GlobalShtukasAndFunctionFieldLanglands:GS.1` (which cites `HS0/global-hecke-correspondence`, and through GS.5 → LP2 → LP3 → … → RF4 comes back to HS0) or through `IgusaVarietiesAndTorsionConcentration:IG.3`. RS-22 says that the function-field roadmap is neither base nor supplier of this one, so the GS.1 citation looks like the link to drop.
4. **The reader document** has to be regenerated (the reason for the verdict).
5. **Two node ids no longer fit their content**: `HS0/demazure-generators-of-ULA-kernels` is the HS1 theorem FS IX.2.1, and `HS4/isogeny-product-and-weil-restriction-diagrams` states only the case of maps inducing an isomorphism of adjoint groups. I kept the ids because consumers cite them. A rename needs the consumers' packets.
6. **Register duplicates.** Fourteen source findings repeat register entries (their `known` field names the entry). They are listed so that the packet's nodes point at the corrected statements; drop them from this packet's list if the register should not count them twice.
7. **Sources outside the packet's five.** Three statements now rest on papers the packet does not list as sources: Dat–Helm–Kurinczuk–Moss (arXiv:2203.04929) for noetherian Hecke algebras, Hamann–Hansen–Scholze (arXiv:2409.07363, Theorem 7.1.4) for compactness of the level colimit, which the readers did not read in full, and Hamann–Imai (arXiv:2401.06342v4, Proposition 4.1) as a check of the modulus character. A revision round or the lemma-level job should add them as sources with read sections.

## Notes for the owners of other roadmaps

- `BunGAndNewtonStrata:BG2:uniformization/beauville-laszlo-surjectivity` repeats the sign printed in Fargues–Scholze III.3.6(ii) ("the OPPOSITE of it") and says it "makes the connected-component count come out right". With cells the orbits of μ(ξ) the composite is +μ♯; the count does not depend on the sign.
- `ExcursionOperatorsAndSpectralAction:ES6:functoriality/products` and `/weil-restriction` cite `HS4/isogeny-product-and-weil-restriction-diagrams`; what they use is in `HS4/product-hecke-diagram` and `HS4/weil-restriction-hecke-diagram`. `ES6:duality/bernstein-zelevinsky-duals` and `ES5/excursion-character-of-a-schur-object` cite `HS1/properties-and-weil-equivariance` for statements that are in `HS1/duality-exchange` and `HS1/continuous-weil-descent`.
- `ES1:finite-ramification/uniform-wild-subgroup` closes the class of representations with trivial action of P "under duals, subquotients and extensions"; exactness gives sums, summands and cones only, and with Z_ℓ-coefficients a tensor generator does not generate in that sense (for GL_2 and ℓ = 2 the determinant is not reached from std and its dual). That node has to prove the generation statement.
- `ES7:parabolic/increasingly-unstable-sequence` and `/twisted-levi-inclusion` copy b_N = bμ(π)^N with "the canonical parabolic containing B" and "2ρ_Ĝ − 2ρ_{Ĝ_b}" without a positive system; `ES7:parabolic/constant-term-computation` reads the constant term with the source's orientation and without the character of G_b(E) on Rπ_!Λ. The outcome for the identification of strata by pullback: the excursion operators of G on the sheaf of σ on Bun_G^{b} are those of M on σ for the embedding twisted by (2ρ̂_G − 2ρ̂_M)(√q)^{|w|}, with 2ρ̂ taken for the Harder–Narasimhan parabolic (ν_b anti-dominant), as in Hamann–Imai, Lemma 4.7.
- `ES5/condensed-schur-from-admissibility` asks `HS1/condensed-enrichment` for relative discreteness of Hom(A, B) without A compact; the source and the node have it for compact A only.
- `ES7:equal-characteristic` nodes ask HS2 for formal O_K-modules and their deformation theory; HS2 now has the local shtuka tower in equal characteristic, but formal modules are outside its stage.
- `GeometricSatakeAndFusion:GS4:integral-dual-group/weil-restriction-naturality` should fix √q′ = (√q)^f for a finite separable E′/E of residue degree f; the comparison of Satake sheaves under Weil restriction is asserted, not proved, in the source (recorded as a source gap), so the proof obligation is there.

## Checks run

- `TAUCETI_BASELINE=<pinned trees> python3 scripts/check_blueprint.py research/blueprint/packets/HeckeStacksAndLocalShtukas.json`: 0 errors, 0 warnings (51 nodes, 215 API items, 94 unit tests, 22 planets, 8 baseline declarations), on a branch at the current main.
- `check_issues` and `versions_checked` of `scripts/check_errata.py` on the packet's `sourceIssues` and `sourceVersions`: no error.
- Every excerpt is a literal substring of its source text (script; 285 of 285).
- Requests equal stage-level prerequisites (22 and 22, each `neededBy` exact); every prerequisite id resolves against the current main; no cycle among nodes; no path from a consuming stage to a supplier stage in the live graph (script).
- Atlas build dry run: `assemble(require_distances=False, blueprints=<scratch copy of data/blueprints plus this packet>)` completes.
- `lean-check research/blueprint/suggested/HeckeStacksAndLocalShtukas.lean`: elaborates, placeholder warnings only (see above).
- No file outside the three deliverables and the handoff note is changed. Nothing is promoted; no implementation is claimed.
