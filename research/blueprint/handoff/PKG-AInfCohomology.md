# Handoff: PKG-AInfCohomology (issue #9154)

Worker: Claude (Opus), session `claude-Kna1KM`, 13–14 October 2026. Refs #9154. This is a complete package, not a checkpoint. I took no part in the plan, its parts or its reviews.

## Deliverables

- `research/blueprint/packages/AInfCohomology/README.md`: the roadmap, 3,637 lines (about 720 KB). It opens with a `**Summary.**`, then Scope and ownership, Conventions (with labelled standing-hypothesis blocks (C), (T), (Cx), (SS), (SS-prop), (VS), (dR), (Sp), (BK) and (Y)), Exact supplier contracts, How to read the build, and Layers AI.0, AI.0:integral, AI.0:period-comparison and AI.1–AI.7, each with `### k.n` subsections, `### Examples` and `### Dependencies`. It ends with Worked examples, Downstream consumers and References.
- `research/blueprint/packages/AInfCohomology/Suggested.lean`: 298 lines, in namespace `TauCetiRoadmap.AInfCohomology`. It contains `import Mathlib`, one module docstring, layer section comments and real-bodied light definitions: `mu`, `xi`, `tildeXi`, `xiLevel`, `tildeXiLevel`, `shiftedTheta`, `thetaTilde`, `integers`, `etaTerm`, `qInteger`, `coefficientFrobenius` and `crystallineCoefficient`. It states 15 milestone theorems with `sorry` proofs: the cyclotomic factorizations; the recursions for `ξ_r` and `ξ̃_r`; `θ̃` surjectivity and kernel; `θ̃` on Teichmüller lifts; `ker θ = (ξ)` and `ker θ̃ = (ξ̃)` for `O_C`; regularity of `(p, μ)`; the residue map on `μ` and `ξ`; the divisibility submodule; the `q`-integer factorization; and the Breuil–Kisin Frobenius coefficient formula with its crystalline compatibility. It also has 11 `example`s, including the negative controls `ε = 1` and length-two orientation. A closing comment names every README-only definition and construction.
- `research/blueprint/packages/AInfCohomology/metadata.toml`: `topic = "math.AG"`.

## How the plan was used

I built the source of truth exactly as the accepted plan's handoffs prescribe. I loaded the hash-pinned AI.0 and AI.6 packets (SHA-256 checked) plus the 29 main-packet targets, applied `assembly.importedNodeCorrections`, and replaced the prerequisites with `assembly.importedPrerequisites`, which gives 226 targets. A script rendered every target in the prose form of the accepted CrystallineCohomology package: bold title and statement, `*Hypotheses.*`, `The API:`, `*Construction.*` / `*Proof sketch.*` with locators, `*Needs:*`, and `**Checks.**` from the definition tests and acceptance clauses.

I hand-wrote the summary, scope, conventions, contracts, layer introductions, examples and consumers. I then made the following adjustments:

- **Notation.** The AI.0 part's ASCII notation is respelled in Unicode: μ, ξ, ξ̃, θ̃, φ, ε, O_C^♭, 𝔛, ℤ_p and so on. Code spans and identifiers were masked first.
- **Cross-references.** Every internal node reference is rewritten to the target's title and section (*title* (§AI.k.n)). Foreign references become "Roadmap, layer (*node title*)".
- **Process language.** 124 rewrite rules remove phrases about requests, suppliers, gaps, packets, imports, exports and readers from the rendered text.
- **Boilerplate.** Three boilerplate strings were dropped: "Retain every hypothesis…" (103 times) and two boilerplate source matches (84 times).
- **Grouping.** Each layer's targets are grouped into subsections in dependency order. The script verifies that no prerequisite points forward.

My own checks found no forbidden words (optional, deferred, later, sorry) and no local paths. Every `(§…)` reference resolves. Every API and test name of the plan occurs in the README. Every definition and construction has at least three Checks. Every name in the "`Suggested.lean` declares" lines exists in the Lean file.

## Supplier requests and gaps: 38 targets moved down

The plan left 25 supplier requests and 17 gaps open. A Sonnet cross-check against every lower-tier and bundle packet split them into 185 items: 45 found, 56 partial, 84 not found. I read the found nodes and wired them into the consuming targets as exact contracts (55 node ids). Every id was validated against the packets.

For items that no lower or bundled roadmap states, I wrote 38 new targets here, each with a statement, hypotheses, proof route and locator. They live in the layer that first uses them. The 10 definitions and constructions among them have API lists and three Checks each. The consumer column lists the original targets that now cite each one:

| § | New target | Consumers |
| --- | --- | --- |
| §AI.1.2 | Tensor powers of an invertible ideal sheaf | AI.1/decalage-products, AI.1/ideal-decalage-complex |
| §AI.1.7 | Koszul complex of commuting endomorphisms | AI.1/continuous-cochains-koszul, AI.1/koszul-decalage-calculation, AI.1/koszul-products-and-cohomology, AI.3/q-de-rham-model |
| §AI.1.7 | Continuous cochains as an integer-indexed complex | AI.1/continuous-cochains-koszul, AI.3/toric-perfectoid-cover |
| §AI.1.5 | Completed extension of scalars along a map of adic rings | AI.6/absolute-crystalline, AI.6/finite-pd-base-change, AI.6/global-crystalline, AI.7/ainf-base-change, AI.7/crystalline-base-change, AI.7/de-rham-base-change |
| §AI.1.5 | Derived p-completion on a site that is not replete | AI.6/absolute-crystalline, AI.6/finite-pd-base-change, AI.6/global-crystalline |
| §AI.2.1 | Finitely generated torsion-free modules over a valuation ring | AI.2/valuation-lattice-criterion, AI.2/valuation-special-fiber-bound |
| §AI.2.1 | Finitely presented modules over a valuation ring and their Fitting ideals | AI.6/normalized-valuation-length, AI.6/valuation-length-specialization |
| §AI.2.4 | Admissible prismatic Dieudonné modules over A_inf | AI.2/minuscule-prismatic-dictionary |
| §AI.2.3 | Boundary neighbourhoods and section rings of Y^an | AI.2/analytic-vector-bundle-extension, AI.2/annulus-isocrystal-classification, AI.2/fargues-essential-surjectivity, AI.2/frobenius-extension-infinity, AI.2/integral-robba-frobenius-descent |
| §AI.2.3 | Vector bundles on Y^an by gluing two opens | AI.2/analytic-vector-bundle-extension, AI.2/fargues-essential-surjectivity |
| §AI.3.1 | The projection from the pro-étale site of the generic fibre | AI.3/aomega, AI.6/aomega, AI.6/local-edge |
| §AI.3.3 | The operation Sq^0 on E∞-𝔽_2-algebras | AI.3/enhanced-noncommutative-regression |
| §AI.5.1 | The primitive comparison over A_inf | AI.5/global-etale, AI.6/canonical-bdr-etale-comparison, AI.6/canonical-bdr-etale-map, AI.6/etale-comparison |
| §AI.5.1 | Rational Frobenius bijectivity over A_cris | AI.5/global-bkf, AI.5/rational-crystalline-frobenius |
| §AI.6.1 | Log regularity and the divisorial log structure | AI.6/divisorial-log |
| §AI.6.1 | Algebraization and descent of semistable charts | AI.6/bdr-comparison-map, AI.6/divisorial-log, AI.6/hodge-tate-comparison, AI.6/root-tower, AI.6/structure-sheaf-edge |
| §AI.6.1 | Perfectoidness of products of root towers | AI.6/all-coordinates, AI.6/all-coordinates-map |
| §AI.6.3 | Formal GAGA over a complete rank-one valuation ring | AI.6/hodge-tate-comparison |
| §AI.6.3 | Finiteness and base change for proper formal schemes over O_C | AI.6/bdr-comparison, AI.6/model-independent-lattice, AI.6/proper-perfectness |
| §AI.6.3 | The first higher direct image of the completed structure sheaf | AI.6/hodge-tate-comparison |
| §AI.6.3 | Extension of vector bundles across codimension two over a valuation base | AI.6/hodge-tate-comparison |
| §AI.6.2 | Acyclicity of quasi-coherent sheaves on affine formal schemes | AI.6/aomega-sheaf-completeness, AI.6/local-crystalline |
| §AI.6.4 | Unique lifting of units along log divided power thickenings | AI.6/all-coordinates-pd, AI.6/log-exactification |
| §AI.6.4 | Base change for log crystalline cohomology of Cartier type | AI.6/global-crystalline, AI.6/hyodo-kato-interface, AI.6/local-crystalline |
| §AI.6.4 | Rational finiteness of log crystalline cohomology over A_cris | AI.6/global-crystalline, AI.6/hyodo-kato-interface |
| §AI.6.4 | Descent of the semistable special fibre to a finite level | AI.6/global-crystalline |
| §AI.6.5 | Smooth noetherian approximation of very small affinoids | AI.6/bdr-envelope-normal-form, AI.6/canonical-bdr-freeness |
| §AI.6.5 | Coherent modules with integrable connection in characteristic zero | AI.6/canonical-bdr-freeness |
| §AI.6.5 | Descent of proper flat formal deformations to a noetherian base | AI.6/canonical-bdr-freeness, AI.6/proper-smooth-spreading |
| §AI.6.6 | Integral models and power-bounded elements for B_dR⁺-thickenings | AI.6/bdr-cohomology-etale-embeddings, AI.6/bdr-comparison-map |
| §AI.6.7 | Ax–Sen–Tate and Tate–Sen over a complete discretely valued field | AI.6/de-rham-lattice-functor, AI.6/model-independent-lattice |
| §AI.6.7 | Étale cohomology over K̄ and over C | AI.6/crystalline-torsion, AI.6/de-rham-lattice-functor, AI.6/de-rham-torsion, AI.6/model-independent-lattice |
| §AI.6.7 | Log differentials of a semistable curve | AI.6/nodal-conic |
| §AI.7.2 | Circle actions, homotopy fixed points and Tate constructions | AI.7/absolute-perfectoid-trace-coefficients, AI.7/relative-cyclotomic-traces |
| §AI.7.2 | Topological Hochschild homology as a cyclotomic spectrum | AI.7/absolute-perfectoid-trace-coefficients, AI.7/qrsp-trace-unfolding, AI.7/relative-cyclotomic-traces |
| §AI.7.2 | Bökstedt periodicity | AI.7/absolute-perfectoid-trace-coefficients |
| §AI.7.1 | Finite freeness of the Breuil–Kisin Frobenius | AI.7/bkf-tensor-functor, AI.7/perfect-cohomological-modules |
| §AI.7.3 | π_0 TP over the sphere polynomial base and the Nygaard-completed prism | AI.7/qrsp-trace-unfolding, AI.7/trace-prismatic-agreement |

## Corrections to the plan made in the README

1. **`AI.0/witt-almost-ideal`.** It cited `AI.0:integral/residue-map`, which reverses the layer order (flagged by the assembly). It now cites Mathlib `WittVector.map` and `TruncatedWittVector`, which is all it uses.
2. **`AI.4/bounded-pd-coefficients`.** It stated all of BMS1 Lemma 12.8 under `m ≥ p²`. In BMS1 v3, p.100, only (i) and (iv) need `m ≥ p²`; (ii) and (iii) hold for every `m`. The statement now says so.
3. **A_cris^(m) was defined twice** (`AI.4/bounded-pd-coefficients` and `AI.6/finite-level-acris`). The absolute rings are now defined once, in AI.4.3. `AI.6/finite-level-acris` cites it and defines only the relative rings.
4. **Title change.** "Torsion and lattice exports to CP.5" (a process title naming a higher-tier consumer) is now "Torsion and lattice statements for proper cohomology".
5. **Upstream roadmaps.** The Koszul complex of a sequence is cited from TauCetiRoadmap IntegralHeckeAndGaloisDeterminants, Layer 6 (§6.4), which is now upstream. The `A_inf` Huber ring, `𝒴`, windows and interval rings are cited from TauCetiRoadmap AdicSpaces, Layer 6. Neither is re-planned.

## Library and duplication check

A Sonnet survey covered current TauCetiRoadmap main (0d144d0), current Tau Ceti (a91d3aaf) and the pinned Mathlib. No target is duplicated. Four partial overlaps are noted in the README contracts:

- `surjective_fontaineTheta` gives `θ̃` surjectivity.
- `WittVector.map_teichmuller`, `map_surjective` and `frobenius_eq_map_frobenius` give three residue-map API items.
- Tau Ceti's `WittVector.isAdicComplete_span_p_teichmuller` and `Valuation.Integers.isAdicComplete_span_p_teichmuller` give the completeness clauses of AI.0.2 and AI.0:integral.2. These are in current Tau Ceti, not at the pin f790474.
- Mathlib `BDeRhamPlus` is the completion used in AI.0:period-comparison.

## Lean

`lean-check research/blueprint/packages/AInfCohomology/Suggested.lean` at Mathlib 082e2d37e8 exits 0 with 26 warnings, all `declaration uses 'sorry'`. `scripts/check_sorry_data.py` exits 0. I checked every statement by hand at its degenerate cases: `ε = 1`, lengths 0, 1 and 2, `f = 0` and `f = 1`, `q = 1`, and `F = id`. `ker_fontaineTheta_eq_span_xi` is stated for the valuation ring of a complete algebraically closed nonarchimedean field of characteristic 0 with `|p| < 1`, taking p-adic completeness as an instance hypothesis.

## For the reviewer

- **Locators of the new targets.** I checked them in the public texts I fetched: BMS1 arXiv v3 (printed page = PDF page), ČK arXiv v3 (printed = PDF), BMS2 arXiv (printed = PDF), BS22 arXiv v4, SW20 (printed = PDF − 10), Scholze 2013 (printed = PDF), ALB arXiv v4 and the Stacks tags 0539, 0ASU, 0ASP, 09IL, 04D1, 0940, 0944, 0A07, 0C46 and 0E34. SHA-256 prefixes match the plan's records.
- **Results I did not read.** Results quoted from Beilinson (On the crystalline period map), Kato, Gabber–Ramero, Fujiwara–Kato, Ullrich, Raynaud–Gruson, EGA, Huber and Nikolaus–Scholze are cited through the place where ČK, BMS1 or BMS2 quote them, and the README says so. These are the locators to sample first.
- **Plan targets carried as written.** The plan's own targets keep their reviewed locators; I did not re-verify them beyond spot checks.
- **Upward citations into this roadmap.** CrystallineCohomology (tier 9) cites AI.0:integral twice, from `CR.5:log-algebra/valuation-log` and `CR.5/a-cris-log`, and DerivedDeRhamCohomology (tier 9) cites AI.0:integral three times, from DD.4 and DD.6. Those notions should move down into those roadmaps, or the citations should be removed there; this package does not change it.
- **Bundle order.** The AInf, PadicHodgeTheory and PrismaticCohomology layers interleave without cycles: R06.1 follows AI.0:integral, P8 follows AI.3, PR.3/PR.6 follow AI.1/AI.3/AI.4, PR.7 follows AI.2, and AI.7 follows all of them.

## Checks run

- `python3 research/blueprint/intake.py check-files` on the three package files: 0 problems.
- `lean-check`: exit 0, 26 `sorry` warnings.
- `scripts/check_sorry_data.py`: exit 0.
- The scratch package checks described above (forbidden words, references, API and test coverage, Checks counts, Lean names).
