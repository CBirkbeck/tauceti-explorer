# REV-PKG-RefinedTraceMethods~codex

Independent review by Codex, session **codex-TBjuiV**, 20 October 2026. Refs #11269; input package #11265, authored by a different session. **Verdict: needs_changes.** This is the completed fixing review, not an acceptance of the package or a checkpoint.

The package keeps the full integral, genuine, modern, relative and refined programme. The fixes below remove duplication and correct statements without restricting the roadmap to its finite-local-field consumers. Four groups of prerequisite/proof gaps prevent a draft upstream submission.

## Defects that remain

1. **Unlocated supplier contracts.** Neither the current upstream main tree nor the open new-folder pull requests inspected supplies HabiroRings, HabiroCohomologyFoundations, K2SymbolsBrauer or KTheoryFiniteLocalFields. Their atlas packets are not upstream supplier layers. The README now marks the contracts explicitly: scalar/solid Habiro and q-Hodge objects for Layers 6–8, relative Dennis–Stein symbols for §4.19, and the ordinary π₀TR/Witt and full truncated-polynomial inputs for §2.14 and the low-degree checks. KTheoryLowDegrees §§13.2–13.4 supplies a Steinberg/plus comparison, which does not close the relative Dennis–Stein contract. Locate actual upstream layers or provide complete correctly owned extensions before treating these as imports.
2. **Concrete K-theory on general small stable infinity categories.** GeneralAlgebraicKTheory §13.6 explicitly confines its derived invariance to enhanced DG/Waldhausen/Frobenius models. It does not supply the arbitrary stable-category K and IK used in §§4.6 and 4.9–4.11 and Layer 7. The required extension includes the stable S-construction, nonconnective suspension/delooping, model comparisons, localization, Morita invariance and filtered-colimit compatibility. The motive mapping-spectrum theorem cannot define a replacement for the concrete K spectrum it identifies: see BGT Theorems 7.13 and 9.8, pp. 49 and 58, after the constructions in §§7.1 and 9.1. The README records this gap rather than claiming that changing a stage alias fixes it.
3. **Chromatic input for j.** StableHomotopyKTheory Layer 7 supplies prime completion and Moore towers, not K(1)-Bousfield localization or the structured Adams fixed-point identification of the local sphere. §6.8 needs those constructions, the odd-prime Adams summand, the prime-two variant and their coherent E∞ maps. The j and j_{p,0} definitions and their distinct THH comparisons remain targets with this unresolved prerequisite. Neither ordinary p-completion nor the newly retained localized stable Adams maps closes it.
4. **The syntomic K-sheaf application.** §8.12 still lacks finite-coefficient henselian rigidity, prime-to-p rigidity, and the derived syntomic-to-étale change-of-site/descent argument. Bhatt–Mathew Example 1.6, p. 2, announces the result but does not prove it there. CMM Theorem 4.36, p. 36, is an additional input; nilpotent DGM is insufficient. Retain n≥1 and weights i≥0, sheafify before derived pushforward, and prove the site comparison on the full stated p-quasisyntomic domain. This was already disclosed by the author; this review confirms it remains a gap.

These are construction-sized defects, not missing citations that can be repaired by asserting a supplier. The review does not modify packets or neighboring roadmaps, invent an upstream section, or declare the missing general theory proved. The other flagged foundations below remain explicitly stated construction targets with sources and proof routes; their future formalization is not itself a reason for this verdict.

## Fixes applied

- Corrected **F V on genuine Prüfer TR** in §2.14: it is the residual Cₚ norm on homotopy, not always multiplication by p. The latter follows for trivial residual action, in particular the connected-circle situation used by the Cartier comparison. For the regular Z[Cₚ] module, the norm of the identity basis vector is the sum of all basis vectors, different from p times that vector. A blanket p formula failed this test.
- Deleted thirteen duplicate targets and renumbered Layer 5 to three sections. The exact inventory appears below. Kept Snaith, coherent localized stable Adams lifts and relative graded cyclic coefficients as explicit additional structures/comparisons. The opening summary and layer descriptions no longer claim to construct supplied KU/ku or ordinary topological K-theory.
- Replaced non-existent or merely atlas-style supplier locators by actual contracts: GeneralizedCohomology G2–G3/G5.4; StableHomotopyKTheory Layers 5 and 7, including **§§7.29 and 7.31**, not the author's §§7.32/7.34; GeneralAlgebraicKTheory actual sections; KTheoryLowDegrees §§3.2–3.7; DerivedDeRhamCohomology layer numbers; AInf AI.3/AI.4; and the three distinct prismatic packages. Distinguished the unresolved imports above from the verified ones.
- Repaired §3.4's generated cyclotomic t-structure argument: construct the terminal connective slice/truncation adjoint using Higher Algebra Proposition 1.4.4.11(1), p. 160; use the separate product/separatedness criterion in Proposition 1.2.1.19, pp. 45–46. Presentability alone neither gives the right truncation argument nor proves completeness. This specific construction is a target here, not an assumed E5 theorem.
- Distinguished the roles of Elliptic Cohomology II Theorem 6.5.1 and Keller §§2.1–2.3 in §5.2. The former supplies the Snaith coefficient comparison, the latter mixed DG formalism. The displayed graded HKR formula comes from the stated Koszul diagonal calculation; it is not falsely attributed to an ordinary degree-zero HKR theorem.
- Separated Hatcher's bibliography anchor from Higher Algebra. The Hatcher Proposition 3.3, p. 80, citation is a mod-two result and did not source the former integral flag-cohomology assertion; that duplicate target now consumes CharacteristicClasses' integral contract. Replaced garbled verbatim PDF extraction around the NS citations by precise theorem/page locators in our own words. Removed the packet-specific B.19 correction label while preserving the mathematical circle-action correction.
- Replaced weak Checks: the nonzero ground-ring hypothesis for the mixed-complex counterexample; the product/direct-sum failure of strong continuity; a concrete negative-K witness for connective K; both module orders for a noncommutative discrete solid ring; the semilinear basis-change law for a Breuil–Kisin line; a nonzero almost-zero module; and the degree −2 obstruction to an unfiltered equivalence for the Beilinson map.
- Expanded the closing Lean comment to account for the heavy README definitions in layer order, while keeping their absent coherent carriers out of Lean. Metadata stays `topic = "math.KT"`.

## Inputs, coverage and supplier evidence

Read WORKERS, PACKAGE_REVIEW, UPSTREAM_GUIDE, PROTOCOL (especially §§3–5, 9, 12–15, 20), the expansion protocol, the accepted effective target graph, the author's handoff and all package mathematical paragraphs/API/Checks. The two upstream form models were LocalGaloisGroups and ProfiniteArithmetic, including their suggested files. Read the library audit, current roadmaps and Completed directions, including all nine post-snapshot roadmaps. Object/structure/operator searches covered the cyclic and mixed structures, finite/circle norms, genuine spectra, F/V relations, relative duality and trace class, K-theoretic motives, Bott/Adams, q-Hodge/solid objects and arithmetic trace comparisons. Relevant hits were read, including DGAInfinity Layers 6/8/9 and EnhancedDerivedSheaves E5:presentability.3–.4; §2.1 explicitly extends the finite-group framework to topological classifying animas and residual actions; those supplied absolute constructions remain boundary deferrals.

The effective input contains **250 targets** after the main packet's imports/amendments, not just its twelve new nodes. Thirteen duplicates were deleted; **237 targets remain**. All nonduplicate mathematical targets and their hypotheses/API are retained. Five titles clarify enhancements or ordered/relative variants. There are **100 definition/construction Check blocks with 329 Checks**, each block with at least three Checks; both positive cases and counterexamples were read. The inventory below accounts for all 237 retained targets. Statements/proof routes were tested mathematically, not proved in Lean; source and signature checks do not certify a complete proof of every coherent construction.

| Evidence | Revision inspected |
| --- | --- |
| Current read-only upstream roadmap checkout | `0d144d044dacebca17b654695b6f1ad58f159b27` |
| Current read-only Tau Ceti library | `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` |
| Newer GitHub main tree, including GeneralizedCohomology | `b9ad8291de4c8b319427ed40b412eb6135b88dc9` |
| Mathlib elaboration pin | `082e2d37e8b0463410cdb532e111cd43d5a66174` |
| Tau Ceti elaboration pin | `f790474821cf4256814db967cb154e7af3d0c369` |
| GeneralizedCohomology README / Suggested.lean blobs | `e44ac86bcf260b5c4f75fb072eb0f975e5ab4105` / `4c475a40ae3db1d54f38ab9e529ea956a3633949` |

The current main and open upstream PRs were read as mathematical evidence, never as instructions. The following supplier README blob hashes record exactly which contracts were inspected; an open PR is a proposed roadmap supplier, not an implemented library theorem.

| Supplier | Reference | README blob |
| --- | --- | --- |
| [EnhancedDerivedSheaves](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/EnhancedDerivedSheaves/README.md) | `main` | `b97014d13cc2ba58bf009753a163d7704a89618e` |
| [TopologicalKTheory](https://github.com/TauCetiProject/TauCetiRoadmap/blob/roadmap/topological-k-theory/TauCetiRoadmap/TopologicalKTheory/README.md) | `roadmap/topological-k-theory` | `40e77e9ded895f9ab8dd8342573df937fb99fc26` |
| [CharacteristicClasses](https://github.com/TauCetiProject/TauCetiRoadmap/blob/roadmap/characteristic-classes/TauCetiRoadmap/CharacteristicClasses/README.md) | `roadmap/characteristic-classes` | `269186f10d251dde895b547ea982c3bdf7515a3c` |
| [StableHomotopyKTheory](https://github.com/TauCetiProject/TauCetiRoadmap/blob/roadmap/stable-homotopy-k-theory/TauCetiRoadmap/StableHomotopyKTheory/README.md) | `roadmap/stable-homotopy-k-theory` | `fe140a8c25a43184c7ef3724b81aa38297cc141a` |
| [GeneralAlgebraicKTheory](https://github.com/TauCetiProject/TauCetiRoadmap/blob/roadmap/general-algebraic-k-theory/TauCetiRoadmap/GeneralAlgebraicKTheory/README.md) | `roadmap/general-algebraic-k-theory` | `6fe7e2c92e7ddba6fb0691ab555adccc2ad03394` |
| [KTheoryLowDegrees](https://github.com/TauCetiProject/TauCetiRoadmap/blob/roadmap/k-theory-low-degrees/TauCetiRoadmap/KTheoryLowDegrees/README.md) | `roadmap/k-theory-low-degrees` | `eef4dd2020cac42416c5cafae6d81a39acef5b52` |
| [VStackSheavesAndLisseCategories](https://github.com/TauCetiProject/TauCetiRoadmap/blob/roadmap/v-stack-sheaves-and-lisse-categories/TauCetiRoadmap/VStackSheavesAndLisseCategories/README.md) | `roadmap/v-stack-sheaves-and-lisse-categories` | `276ac93646adfb15ea8cd36af3bde6cbac58a0ae` |
| [DerivedDeRhamCohomology](https://github.com/TauCetiProject/TauCetiRoadmap/blob/roadmap/derived-de-rham-cohomology/TauCetiRoadmap/DerivedDeRhamCohomology/README.md) | `roadmap/derived-de-rham-cohomology` | `619e5782790d41bf38b46e5d93474a83b92382dd` |
| [AInfCohomology](https://github.com/TauCetiProject/TauCetiRoadmap/blob/roadmap/a-inf-cohomology/TauCetiRoadmap/AInfCohomology/README.md) | `roadmap/a-inf-cohomology` | `0f1910610414307663f3b59874f2e5b02c2a0302` |
| [CrystallineCohomology](https://github.com/TauCetiProject/TauCetiRoadmap/blob/roadmap/crystalline-cohomology/TauCetiRoadmap/CrystallineCohomology/README.md) | `roadmap/crystalline-cohomology` | `b94d2f28a70bdc4f817bc9a34a07841a420c524b` |
| [PrismaticCohomology](https://github.com/TauCetiProject/TauCetiRoadmap/blob/roadmap/prismatic-cohomology/TauCetiRoadmap/PrismaticCohomology/README.md) | `roadmap/prismatic-cohomology` | `69683f44a122df0ee7c94a797022a266055b6745` |
| [PrismaticCohomologyPartII](https://github.com/TauCetiProject/TauCetiRoadmap/blob/roadmap/prismatic-cohomology-part-ii/TauCetiRoadmap/PrismaticCohomologyPartII/README.md) | `roadmap/prismatic-cohomology-part-ii` | `5950139d95d12afcf1ba5b5c1d0956783aa19d1c` |
| [PrismaticCohomologyPartIII](https://github.com/TauCetiProject/TauCetiRoadmap/blob/roadmap/prismatic-cohomology-part-iii/TauCetiRoadmap/PrismaticCohomologyPartIII/README.md) | `roadmap/prismatic-cohomology-part-iii` | `f8ae7013ed22faeb729c21868ce290d51d44368c` |

The Caraiani–Newton ordering excludes these K-theory/Habiro directions from its 94-roadmap tier list. I did not invent a tier or a bundle for them. The earlier intrinsic prismatic, AΩ and derived-de-Rham contracts are inputs; their later trace comparisons are consumers. The general TR/Cartier machinery remains Layer 3 and the uncompleted graded trace extension remains §9.5; neither is imported upward from a Beilinson consumer. A missing supplier is recorded as a gap rather than hidden in that ordering.

## Every duplicate removed

Section numbers in this table are those of the input package. All thirteen target paragraphs, associated API/Checks and removed-section scaffolding were deleted, not left as removal stubs. Surviving references point to the supplier; Layer 5 was renumbered.

| Input target | Supplier replacing it |
| --- | --- |
| §5.1 (Complex topological K-theory of a compact space) | TopologicalKTheory T1 and T2.1 |
| §5.1 (Reduced, relative and negative topological K-groups) | TopologicalKTheory T3 |
| §5.2 (Bott periodicity) | TopologicalKTheory T4 |
| §5.2 (Representability by ℤ × BU and the space-level Bott equivalence) | TopologicalKTheory T1.6, T2.1 and T4 |
| §5.3 (The splitting principle) | TopologicalKTheory T5.1 |
| §5.3 (Exterior powers make K(X) a special λ-ring) | TopologicalKTheory T2.3 |
| §5.3 (Adams operations on topological K-theory) | TopologicalKTheory T2.5 |
| §5.6 (Chern classes and the cohomology of BU) | CharacteristicClasses C3 and C5 |
| §5.6 (The Chern character) | CharacteristicClasses C6.2–C6.3 |
| Original §5.4 (The periodic complex K-theory spectrum KU) | GeneralizedCohomology G5.4 |
| Original §5.4 (Connective complex K-theory ku) | GeneralizedCohomology G5.4 and G3.8 |
| Original §5.4 (Homotopy rings of ku and KU) | GeneralizedCohomology G5.4 (with TopologicalKTheory T4) |
| Original §5.4 (KU is the Bott localisation of ku) | GeneralizedCohomology G5.4 and G2.8 |

## Source checks

All sources below were accessed on **2026-10-20**. The required sample was selected before editing, using `random.Random(11269)` on the original citation-bearing mathematical paragraphs, excluding the separately flagged inputs. The fifteen sampled occurrences, including repeated sources and the subsequently deleted splitting target, are retained in the table so the selection is reproducible. References use the versions in the package bibliography and the byte identities below.

| Sample | Input/current location | Source locator actually read | Finding |
| --- | --- | --- | --- |
| 1 | §7.3 | MW Lemma 2.18, Corollary 2.19, pp. 18–19; E-mot §1.5, p. 19 | Smooth/proper normalization needs both hypotheses; retained. |
| 2 | §8.2 | BMS2 Proposition 6.4 and proof, pp. 247–248 | The TP quotient uses φ(ξ); can and Frobenius have different coefficient maps. |
| 3 | §6.9 | W §4.3, Theorem 4.17, p. 45 | Quasiregular quotient and compatible spherical lift retained. |
| 4 | §4.18 | CMM Remark 2.8, p. 9; Theorem F, p. 4, restated as 5.5, p. 39 | Kinv truncation and K continuity have different hypotheses; the latter retains noetherian, F-finite and p-complete assumptions. |
| 5 | §7.3 | MW Lemmas 2.16/2.18 and Corollary 2.19, pp. 17–19 | Base-change and smooth/proper requirements match the relative statement. |
| 6 | §6.10 | W Theorem 1.4, p. 3, restated as 6.10, p. 83 | Framed q-de Rham comparison is attributed to Raksit as in W; no independent unpublished proof was obtained. |
| 7 | §9.1 | AMMN Proposition 2.5, p. 8 | Bounded-below input and the suspended orbit fiber are retained. |
| 8 | §6.14 | HA Theorem 7.5.0.6, p. 1374; W Example 6.7, p. 82 | Étale spherical lifting, not an arbitrary ring lift. |
| 9 | §8.1 | BMS2 Corollary 3.4/Remark 3.5, pp. 218–219, and Lemmas 4.28–4.30/Proposition 4.31, pp. 229–230 | The supplied fpqc/quasisyntomic Čech descent is not silently promoted to unrestricted hyperdescent. |
| 10 | Original §5.7, now §5.2 | EC2 Theorem 6.5.1, pp. 273–275; Keller §§2.1–2.3, pp. 5–7 | Corrected which source supplies Snaith and which supplies mixed DG formalism; graded formula is proved by the displayed Koszul route. |
| 11 | Original §5.3, deleted | Hatcher Theorem 2.25/Example 2.26, pp. 68–71; Proposition 3.3, p. 80 | K-theoretic splitting locator is right; Proposition 3.3 is mod two, not the claimed integral cohomology source. Import integral CharacteristicClasses instead. |
| 12 | §6.4 | Pstrągowski Definition 6.15, Remarks 6.16–6.18, Proposition 6.19, p. 44; W Definition 2.18/Theorem 2.19, p. 22 | Ordered E₁ modules, Assumption R and completed solid operations retained. |
| 13 | §2.14 | NS Definition II.4.4, p. 263; R/F discussion p. 262; pullback (1)/footnote 22, p. 266 | Corrected residual norm versus multiplication by p. |
| 14 | §4.5 | E-cont Definition 8.5, Propositions 8.6–8.8, pp. 105–106; Theorem 8.10, pp. 106–107 | Accessibility/cardinal and strongly continuous functor hypotheses retained. |
| 15 | §4.4 | E-cont Definition 2.58, pp. 50–51; Propositions 2.59/2.61, p. 51 | Calkin construction uses its specified Ind envelope; it is not an unrestricted ordinary quotient. |

All eleven source/foundation flags in the author's opening handoff table were also checked:

| Flag | Reading and disposition |
| --- | --- |
| Orthogonal/genuine cyclotomic comparison | NS Theorem II.3.7, p. 260, was read, together with the genuine/naive comparison statements in II.4. Its external Barwick–Glasman proof was not independently obtained. §§2.14–2.16 therefore retain the coherent localization equivalence as a construction target. I also read the published 2019 NS erratum, pp. 215–218: it corrects typesetting, the tensor choice on p. 301 and the missing BG reference. It is distinct from the atlas's B.19 circle-action correction. No complete external model proof is certified here. |
| Light solid spectra | W §§2.1–2.4, pp. 11–23, including Assumption 2.13(R), Lemma 2.14, Definition 2.18/Theorem 2.19, were read. The lecture-based spectral extension is not supplied by abelian light condensed carriers. It remains the construction in §6.2, with both module orders and even-descent targets afterwards. |
| Sketched Wagner comparisons | W Theorems 4.14, 4.17, 4.18, 5.51 and 5.63 and their stated proof reductions were checked. Prime two has the E₁ conclusion and R² is not dropped; global/twisted targets require coherent lifts. Theorem 5.63 remains a graded-module comparison with 2 invertible and A₂, rather than an unsupported multiplicative descent theorem. Raksit's unpublished comparison was checked only through W's statements. |
| Missing coherent carriers | Rechecked the pins and actual Lean carriers. No spectral/cyclotomic/motive placeholder, sorry'd data or ad hoc substitute was introduced. The closing comment now covers the heavy definitions explicitly. |
| General rigidification | Ramzi v2 Construction 4.79, Observation 4.80, Theorem 4.81 and Lemmas 4.82–4.83, pp. 43–46; MW Construction 1.3 and its hypotheses. The cardinal-controlled rational-index construction is retained; the sequential special case is not silently generalized. |
| Relative multiplicative motives | E-mot §§1.2/1.5 and BGT's concrete K/corepresentability order were checked. §§4.6–4.8 retain the enriched E-linear localization, relation/tensor compatibility and compact-unit argument. An absolute symmetric theorem alone is insufficient, and the additional general stable-K supplier gap is now explicit. |
| Moore/finite q-Hodge compatibility | MW Lemmas 2.27–2.30 and the current StableHomotopyKTheory contracts were read. Corrected the supplier to §§7.29/7.31. §7.8 retains the separate sufficiently separated bimodule factorization and deformation argument; a Moore spectrum alone proves neither. |
| BM K-sheaf announcement | BM Example 1.6, p. 2, and CMM Theorem 4.36, p. 36: remaining gap 4 above. |
| Habiro multiplicativity/periodicity | W §§5–6 comparison hypotheses were checked. Cyclonic coherence does not include a cyclotomic geometric-fixed-point equivalence or an R-map; periodic KU reconstruction is separate. Number-field comparison retains the source's 6/discriminant divisibility. The missing scalar/cohomological suppliers are gap 1. |
| Grading and spectral realization | BMS2 Propositions 6.2–6.4, pp. 245–248, were read. The ordinary uv quotient and its universal maps are distinct from graded/spectral realization. φ acts on coefficients; graded completions are not unrestricted Laurent products. |
| Hidden moved-down inputs | AN's TR/Cartier convention and AMMN's graded Beilinson targets were checked. Layer 3 retains the general V-complete/null-Frobenius/convergence interfaces. §9.5 uses uncompleted derived de Rham and remains an earlier input to §9.6 and the later consumers. |

The original public-source notes also distinguish AΩ over O_C from any flat-over-Z_p shorthand; the current AΩ and perfectoid coefficient hypotheses were retained. These checks establish source locations and mathematical obligations, not new proofs of the external coherent frameworks.

## Adversarial pass and Lean correspondence

All retained target statements, associated API and conventions were read. The following table records the principal computed witnesses; the section inventory afterwards names every target to which the pass applied. Degenerate examples were evaluated under the actual standing hypotheses, rather than dropping smoothness, boundedness, prime or completion assumptions.

| Statements checked | Instances and computations | Outcome |
| --- | --- | --- |
| Layer 1 cyclic/mixed constructions, comparisons, products and HKR (§§1.1–1.11) | Degree zero and one; unsigned τ versus signed t; B(x^m)=m x^{m−1}dx; the two-term b=B=id counterexample; ground-ring HC/HC⁻ with opposite degree ranges; sum versus product totalization; πε=n!; the singular dual numbers; derived HH₂(F_p/Z)=F_p, HH₁=0. | Require nonzero k in the mixed counterexample. Rational π/n! and the cyclic shuffle correction remain explicit; integral HKR is not a strict rational mixed comparison. |
| Layer 2 actions, norms, Tate, cyclotomic and genuine models (§§2.1–2.18) | Trivial finite group gives norm=id and Tate=0; regular induced module gives zero Tate; a trivial F_p action has nonzero Tate; the circle norm has a suspension; sphere Frobenius is the canonical map; bounded-below hypotheses for the Tate orbit/comparison lemmas; regular Z[C_p] norm differs from p; π_i=Ĥ^{−i}. | Fixed genuine FV. Distinguish p-typical Prüfer from circle-equivariant objects and strict spectra from coherent localized models; retain source-model construction obligations. |
| Layer 3 Cartier/t-structure/convergence (§§3.1–3.6) | Z with F=p,V=1; on (F_p)², F(x,y)=(x,0), V(x,y)=(0,x): FV=0 but VF≠0; zero morphism; denominators n and n² in isogeny detection; Prüfer derived V-completion versus ordinary p-completion; positive grading excludes weight zero. | No extra VF=p axiom. Fixed truncation-adjoint argument and separatedness input. The isogeny proof multiplies the inverse by n to annihilate both commutator defects. |
| Layer 4 relative duality, motives, traces and DGM (§§4.1–4.20) | Zero category; Perf(R)/Mod_R; finite-rank versus infinite identity in D(k); product/direct-sum witness; cone/suspension localization with K_{−1}≠0; identity/nilpotent/square-zero maps; nonnilpotent ideals excluded from DGM; connective versus nonconnective relative fibers; K continuity needs its additional noetherian/F-finite assumptions. | Replaced weak tests, retained ordered tensor directions and no monoidal category of arbitrary left E₁ modules. Stable-K and low-degree supplier gaps are explicit. |
| Layer 5 Snaith/stable operations and relative coefficients (§§5.1–5.3) | ψ¹=id, ψ²β=2β; β invertible requires 2 inverted for a periodic unital map; |σβ|=3, (σβ)²=0, Bβ≠0; after localization δ=β⁻¹σβ has degree 1 and Bβ^j=jβ^jδ for negative as well as positive j; q−1=βt. | Corrected source roles and deleted thirteen supplied targets. Kept only additional comparisons/operations. |
| Layer 6 solid/even and q-Hodge comparisons (§§6.1–6.14) | Discrete Z and its p-completion; the discrete matrix ring checks both module orders; F_p is not a flat Z-module; p=2 uses E₁, odd p has the stronger comparison; A₂ gives higher Adams coherence; m=1 versus m>1; 2-invertibility and 6/discriminant conditions. | No arbitrary-module or E∞ upgrade. The image-of-J and Habiro supplier gaps remain. |
| Layer 7 refined invariants (§§7.1–7.9) | Zero/unit killing pro-algebras; smooth/proper versus a general category; realize only after forming the nuclear ind-object; high-powered 1 admitted, 0/8/32 excluded, fourth powers cofinal; finite coefficients retain their transition exponent bounds; β and t grading distinguished from ungraded completion. | Retain cardinal/rational-index hypotheses, positive indexing and the source-specific bimodule factorization. General stable-K/Habiro gaps propagate. |
| Layer 8 arithmetic filtrations (§§8.1–8.13) | Base ring and QRSP covers; uv=ξ; can(u)=ξσ, can(v)=σ⁻¹, φ(u)=σ, φ(v)=φ(ξ)σ⁻¹; derived quotient/Tor retained; rank-one twist basis change d′=da/φ(a); nonzero almost-zero O_C/m_C; perfect F_p syntomic weight zero versus positive weights; p=2 and relative z↦π versus z↦π^{1/p}. | No quotient forgets semilinearity or negative generator; almost comparison needs free extraction; no arbitrary DVR is replaced by Z_p. Syntomic K-sheaf proof remains gap 4. |
| Layer 9 reduction and Beilinson (§§9.1–9.7) | R=0, R=Z_p, weights n=0/1 and their explicit degree shifts; complete then invert p; π₀β=Q_p→Q_p while π_{−2}β is 0→Q_p; composition β∘tr; ordinary versus spectral reduction; uncompleted de Rham versus Hodge completion. | Added the negative-degree obstruction to an unfiltered equivalence. Preserved the full graded square and moved-down polynomial extension. |

Ten representative Lean signatures were checked against the README:

| Declaration | Signature check |
| --- | --- |
| `CartierStructure` | Additive F and V with FV=p only; no VF axiom. |
| `CartierStructure.IsMorphism` | Requires separate commutation with F and V; identity and zero are proved examples. |
| `CartierModule.isogeny_iff_underlying` | Has the Cartier-map hypothesis and a positive integer denominator on both sides. The nontrivial implication can replace g by n·g and n by n². |
| `HighPowered` | m>0, odd exponents absent or ≥2, and a present 2-exponent even and ≥4. No inference from the factorization of zero. |
| `HighPowered.fourthPower` | Requires d>0 and asserts both admissibility and divisibility, not just existence of some index. |
| `TracePresentation` | Actual two-variable polynomial quotient by uv−ξ, for arbitrary commutative A and ξ. It claims only the ordinary underlying carrier. |
| `TracePresentation.coeff` | The quotient's canonical coefficient ring homomorphism. |
| `TracePresentation.u` and `v` | Separate actual quotient elements; the README gives their grades, absent from this ordinary carrier. Their product relation has a proved example. |
| `TracePresentation.lift` | a·b=f(ξ), with existence and uniqueness and all three coefficient/generator equations. |
| `TracePresentation.can_and_frobenius` | Two ring maps to Laurent polynomials, distinct generator values and coefficient homomorphisms id and φ. The statement does not require ξ fixed by φ. |

`lean-check` on the final Suggested.lean **exits 0** at the pins above, with exactly four warnings, all admitted theorem proofs. There is a single `import Mathlib`, no Tau Ceti import because none is used, no `set_option`, axiom/True placeholder, sorry'd data or admitted example. All seven examples are proved and concern the package's kept definitions; there are at most two examples per kept real-bodied definition. The file states representative signatures only; it does not formalize the 237-target roadmap. Heavy definition coverage is explicit in its closing comment. No build or Lake invocation was made in either read-only checkout.

## Validation

- Each of the three unchanged input packets passes `scripts/check_blueprint.py`: zero errors and zero warnings. Their recorded gaps remain; passing the schema check does not override this mathematical verdict.
- `research/blueprint/intake.py check-files` on the six validated files: zero problems.
- All 949 named internal target references agree with their actual subsection; external source locators were checked separately from Layer 5 renumbering.
- `git diff --check`: clean. Metadata is the one-line `math.KT` entry. JSON is valid, no local paths are present, and only authorized deliverables/handoff changed.
- Own-words pass: removed the NS extraction residues; the mathematical document contains no source passage or source-by-section summary. The report gives locator checks, not reproduced passages.

## Retained target inventory for the adversarial pass

Each row lists the mathematical statements read in that subsection; all API items and Checks attached to those statements were included. The preceding witness table records the computations and fixes, and the unresolved-defect section states where prerequisites are not closed. The inventory is bookkeeping for this review, not additional roadmap content.

| README subsection | Retained target statements |
| --- | --- |
| §1.1 | Connes' cyclic category and cyclic objects; The cyclic bar construction of an algebra; The cyclic enhancement of supplied derived Hochschild chains |
| §1.2 | Connes' operator B; Mixed complexes |
| §1.3 | Derived category of mixed complexes; Functorial precyclic mixed cone |
| §1.4 | Cyclic, negative cyclic and periodic cyclic homology; Connes' SBI exact sequence |
| §1.5 | The mixed-complex comparison compatibility |
| §1.6 | Morita invariance of Hochschild and cyclic homology; Shuffle and external products |
| §1.7 | Hochschild homology of a commutative ring is its tensor with the circle |
| §1.8 | Base change and flat base change for Hochschild homology; Étale base change (Weibel–Geller) |
| §1.9 | The antisymmetrisation map and the HKR projection; The Hochschild–Kostant–Rosenberg theorem; Connes' operator is the de Rham differential under HKR |
| §1.10 | Cyclic homology of smooth algebras in characteristic zero |
| §1.11 | The derived HKR filtration; Hochschild homology of 𝔽_p over ℤ |
| §2.1 | Spectra with an action of a group; Homotopy orbits and homotopy fixed points |
| §2.2 | The norm map and the Tate construction; Tate spectra of Eilenberg–Mac Lane spectra are Tate cohomology |
| §2.3 | Tate constructions vanish on induced objects; Multiplicativity of the Tate construction; Tate endomorphisms in the finite-action Verdier quotient |
| §2.4 | Tate constructions at C_p: convergence, vanishing and p-completeness; The Tate orbit lemma; The Tate fixpoint lemma |
| §2.5 | The Tate construction for a Kan complex and the dualizing spectrum; The circle norm and the T-Tate construction; Iterated Tate constructions for bounded below spectra |
| §2.6 | Geometric realisation of cyclic objects and the circle action; Edgewise subdivision and Tate constructions of realisations |
| §2.7 | The Tate diagonal; Topological Hochschild homology of an E_1-ring; The cyclotomic Frobenius of THH |
| §2.8 | THH relative to an E_∞-ring; THH relative to THH(ℤ) is Hochschild homology; Mixed complexes model complexes with circle action; The norm sequence for cyclic homology; Circle and finite Tate constructions for HZ-module spectra |
| §2.9 | THH is symmetric monoidal; THH of E_∞-rings; Lax equalizers of ∞-categories; Cyclotomic spectra |
| §2.10 | Negative topological cyclic and periodic topological cyclic homology; Topological cyclic homology; The Nikolaus–Scholze formula for TC; p-completion of TC; TC is right adjoint to the trivial cyclotomic structure; Frobenius on connective covers |
| §2.11 | THH and TC of spherical group rings and loop spaces; THH of spectral and stable ∞-categories |
| §2.12 | Orthogonal spectra; Genuine G-spectra, genuine and geometric fixed points; Geometric fixed points via complete universes |
| §2.13 | Borel-complete genuine spectra; Isotropy separation for cyclic p-groups; Geometric fixed points as a localisation |
| §2.14 | Genuine C_{p^∞}-spectra and F-genuine T-spectra; Genuine cyclotomic spectra; Orthogonal cyclotomic spectra model genuine ones; TR and genuine TC |
| §2.15 | Coalgebras and fixed points of endofunctors; Genuine cyclotomic spectra coreflect; Genuine and naive cyclotomic spectra agree on bounded below objects |
| §2.16 | The Bökstedt construction and classical THH; The two THH agree as cyclotomic spectra |
| §2.17 | The restriction pullback for genuine fixed points; Genuine and Nikolaus–Scholze TC agree on bounded below spectra |
| §2.18 | Hesselholt’s de Rham–Witt comparison for TR |
| §3.1 | Circle-equivariant p-typical cyclotomic spectra |
| §3.2 | Classical p-typical Cartier modules; Topological Cartier modules |
| §3.3 | Derived V-completeness |
| §3.4 | The cyclotomic t-structure; TR as V-complete topological Cartier modules; The derived V-complete Cartier heart |
| §3.5 | TR detects cyclotomic quasi-isogenies; TR with a null cyclotomic Frobenius |
| §3.6 | Positively graded cyclotomic spectra; Graded cyclotomic torsion and connective convergence |
| §4.1 | Relative dualizable presentable stable categories |
| §4.2 | Ordered trace-class morphisms and the symmetric comparison; Functoriality and preduals of trace-class maps |
| §4.3 | E₁ rigidity extending the supplied symmetric notion; Nuclear objects; Trace-class generation criterion for rigidity; Closure and generation of nuclear objects |
| §4.4 | The continuous Calkin category; Accessible localizing invariants |
| §4.5 | Continuous extensions of localizing invariants; Uniqueness of continuous extension |
| §4.6 | The category of relative localizing motives |
| §4.7 | Nuclear E-modules; The nuclear resolution of length one |
| §4.8 | Rigidity of relative localizing motives; Enriched trace-class duality |
| §4.9 | Localizing and truncating invariants |
| §4.10 | The Dennis trace; K-theory units of finitary invariants |
| §4.11 | The cyclotomic trace; Uniqueness and multiplicativity of the trace |
| §4.12 | Relative K-theory, relative TC and K^inv |
| §4.13 | THH with bimodule coefficients |
| §4.14 | Goodwillie derivatives; Connective bimodules and square-zero extensions |
| §4.15 | Stable K-theory is THH (Dundas–McCarthy); Stable TC is THH, compatibly with the trace |
| §4.16 | Convergence: from derivatives to nilpotent extensions; Pseudo-extensible functors; Postnikov-convergent algebra functors; Infinitesimal sifted-colimit preservation |
| §4.17 | The Dundas–Goodwillie–McCarthy theorem; Goodwillie's rational theorem |
| §4.18 | K^inv is truncating; Truncating invariants: nil-invariance and excision; The trace square for filtered towers |
| §4.19 | The TC assembly map for C_p; Low-degree tests: dual numbers and truncated polynomials |
| §4.20 | Continuous K-theory of almost modules |
| §5.1 | Coherent stable lifts of the supplied Adams operations; Snaith construction of stable Adams operations |
| §5.2 | THH relative to ku and KU; Graded polynomial and Laurent HKR for ku and KU |
| §5.3 | ku and KU with circle and cyclic-group actions |
| §6.1 | Spherical lifts and the base hypotheses; Compatible local and global spherical lifts |
| §6.2 | Light condensed and solid spectra; Trace-class maps and nuclear modules |
| §6.3 | Perfect even modules and the even site; Homological evenness and even homotopy sheaves |
| §6.4 | Even flat and solid even flat modules; Faithfully even flat ring maps; Solid duality assumption R |
| §6.5 | Even filtrations (Hahn–Raksit–Wilson and Pstrągowski); The solid even filtration |
| §6.6 | Even-filtered circle fixed points and Tate; Synthetic finite cyclic fixed points and Tate |
| §6.7 | Even filtrations on solid relative THH |
| §6.8 | The connective image-of-J spectrum j; THH(ℤ_p) and the image of J (Devalapurkar–Raksit); Devalapurkar's comparison of THH(ℤ_p[ζ_p]) with ku; Nikolaus's E_1 comparison at all primes |
| §6.9 | The comparison map ψ^0_R and the q-Hodge filtration; The p-complete q-Hodge comparison for p > 2 (Wagner Theorem 4.8); The p-complete q-Hodge comparison at p = 2 (Wagner Theorem 4.14); q-Hodge filtrations of quasi-regular quotients (Wagner Theorem 4.17) |
| §6.10 | Global even filtrations by profinite and rational gluing; q-Hodge filtrations from THH over ku (Wagner Theorems 1.2 and 4.27); Completeness, multiplicativity and the graded comparison; The coordinate q-de Rham complex from THH(ku[x]/ku) |
| §6.11 | Cyclonic spectra; Cyclonic ku and KU; Cyclonic Adams lift coherence |
| §6.12 | The invariants TC^{−(m)}; Cyclonic even filtrations and the KU construction |
| §6.13 | TC^{−(m)} over ku and twisted q-Hodge filtrations (Wagner Theorem 5.51); The Habiro–Hodge complex from TC^{−(m)} over KU (Wagner Theorem 5.63) |
| §6.14 | Étale algebras lift uniquely to étale E_∞-algebras; The Habiro ring of a number field from KU (Wagner Corollary 6.15) |
| §7.1 | The refined localizing invariant; Rigidification of the target |
| §7.2 | Killing an idempotent pro-algebra |
| §7.3 | Smooth and proper E-linear categories; Base change in the refined construction; Refined invariants of smooth proper categories |
| §7.4 | The refined localization cofiber |
| §7.5 | Refined THH and TC⁻; Circle fixed points and oriented completion |
| §7.6 | High-powered positive integers; Finite-coefficient TC⁻ and q-Hodge complexes |
| §7.7 | Filtered derived Hom of even spectra; The dual finite-coefficient TC⁻ spectra; The completed tensor filtration |
| §7.8 | Pro-idempotence of the finite-coefficient q-Hodge system; Trace-class finite-coefficient transitions |
| §7.9 | Refined TC⁻ of rational ku; Refined TC⁻ of rational KU |
| §8.1 | Flat and quasisyntomic descent for trace spectra; Even Hochschild homology on quasiregular covers; Negative and periodic cyclic homology from derived de Rham |
| §8.2 | The perfectoid trace coefficient presentation; THH of a perfectoid ring; Perfectoid TC⁻ and TP with can and Frobenius; TC⁻/v and TP/φ(ξ) |
| §8.3 | THH as a deformation of Hochschild homology; Antisymmetrization into THH; The cotangent filtration of THH |
| §8.4 | Even THH on quasiregular semiperfectoid covers; TC⁻, TP and the trace Nygaard filtration on covers; The trace Nygaard complex; Frobenius factorization for smooth trace complexes; The non-Nygaard-completed trace extension |
| §8.5 | The BMS2 motivic filtrations; Invertibility in the complete filtered category; The trace Breuil–Kisin twist; Agreement with the BMS1 twist; Filtered can, Frobenius and the TC fiber |
| §8.6 | The crystalline trace comparison; The root group algebra trace calculation; The Segal comparison in characteristic p |
| §8.7 | The root ideals controlling almost comparison; The almost décalage limit comparison; Almost elements of a completed free module |
| §8.8 | The animated extension of imported AΩ; The almost comparison map to AΩ; Completed freeness on projective QRSP covers; Cartier and Bockstein recognition of the comparison; The honest trace-to-AΩ comparison; Nygaard agrees with the AΩ décalage filtration; The Segal comparison over O_C |
| §8.9 | Trace-to-prismatic Nygaard completion; The graded BMS2 trace comparison; Syntomic complexes as graded TC |
| §8.10 | Derived convergence of the trace spectral sequences; The TC-internal negative-degree calculation |
| §8.11 | The p-adic Adams operations on traces; THH of the sphere polynomial ring; Relative cyclotomic THH over S[z]; The two base changes of relative THH; The relative DVR coefficient calculation; Relative evenness and acyclicity on QRSP covers |
| §8.12 | The even TC sheaf in characteristic p; Syntomic complexes from sheafified even K-groups |
| §8.13 | The coherent trace interface for Habiro cohomology |
| §9.1 | ℤ_p- and ℚ_p-coefficients: p-complete first, then invert p; THH(𝔽_p) versus ℤ with trivial cyclotomic structure |
| §9.2 | From R ⊗_S 𝔽_p to R/p: a quasi-isogeny |
| §9.3 | The comparison map β : TC(R/p; ℚ_p) → HP(R; ℚ_p); The Beilinson square with the spectral reduction (AMMN Theorem 2.12) |
| §9.4 | The Beilinson fibre square (AMMN Corollary 3.9); The Beilinson fibre sequence and its shift dictionary |
| §9.5 | Polynomial extension of the graded trace |
| §9.6 | The Beilinson fibre square on graded pieces (AMMN Theorem 6.17) |
| §9.7 | The filtered trace interface for the Beilinson bridge |

## Public-source byte identities

These public files were downloaded as data for the specified checks, not executed. URLs and SHA-256 values identify the versions actually read; all were accessed 20 October 2026. Keller's author PDF was read through the browser but no local byte copy was obtained, so no hash is asserted for it. The source audit does not imply that every page of each file was read.

| Source | Public file | SHA-256 |
| --- | --- | --- |
| econt | [PDF](https://arxiv.org/pdf/2405.12169v4) | `9ba8f87032b58ae70ab8597b01d8f5fd1a8e6740a131664d21a34b6ade03fb0b` |
| ha | [PDF](https://www.math.ias.edu/~lurie/papers/HA.pdf) | `112b145a95a62daefb8275851cac9ab6430004cfc8f751a33a8d981fd7ad68c3` |
| ec2 | [PDF](https://www.math.ias.edu/~lurie/papers/Elliptic-II.pdf) | `741e87d7eed621a2f4c4f91ed7ba2a255b47255a16644d55e7b5f6270e22ee5d` |
| ns | [PDF](https://archive.intlpress.com/site/pub/files/_fulltext/journals/acta/2018/0221/0002/ACTA-2018-0221-0002-a001.pdf) | `8b1856fa8faefa3efebd64580249aa6fbc0c918f69820bba01410ab0ef1eb8ef` |
| an | [PDF](https://arxiv.org/pdf/1809.01714v2) | `9ca2657c1f23542b91a34b37ee9115e719f14401074e48c188cfb2be9f204d63` |
| ammn | [PDF](https://arxiv.org/pdf/2003.12541v2) | `2a0224b2e8b7c5f19f326886b130f8be0158ba4cb602ba7eb5821990ca22b3fd` |
| raskin | [PDF](https://arxiv.org/pdf/1807.06709v1) | `3ae1b7a88baa13c939ef64015b9fd9a2b5e09a5cb6c8577e19f436f4c3c18cd1` |
| bms | [PDF](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf) | `6b43d1ff3c3f345db85100562a30c2bcbb6fcbfc2874ce899f8b4ded23ff23dd` |
| bm | [PDF](https://arxiv.org/pdf/2202.04818v2) | `12eb19e417531addbcf70d85facf33b1649ba5d8845c31ade9128c6000032955` |
| cmm | [PDF](https://arxiv.org/pdf/1803.10897v2) | `ad23c1d7b818b85e1752cdc4b01ec9442a9c62c3c8e85ebd7cf6f4584c6abd9c` |
| mw | [PDF](https://arxiv.org/pdf/2410.23115v4) | `4479788e04da71cfb76596b4375b6b1e4c9bcd940ad92e1ab7c8ededba446dd4` |
| wagner | [PDF](https://arxiv.org/pdf/2510.06057v1) | `fe9d7d71478eb546f89784f2eabdb15ec4f1e5ff8870c6c84909896c1543ea7d` |
| ramzi | [PDF](https://arxiv.org/pdf/2410.21524v2) | `6c881bfa001b8103080a82f3cb880395f3737669d3abecf676c09256a6ac577a` |
| hrw | [PDF](https://arxiv.org/pdf/2206.11208v3) | `8c79a5fa38c2e5beb09ecdf937b8b511dd8156777f357a2102e9ba9411f1b734` |
| pstragowski | [PDF](https://arxiv.org/pdf/2304.04685v2) | `37cd80d462acf94fca5c6ffb30e4b0bc2728ba245927e30fb68d0217e4786210` |
| efimov | [PDF](https://arxiv.org/pdf/2510.17010v1) | `0969afe53a4f9f3f46a369d0d533e53bd2c7cc093aabe9e76ffe6ba5a224d6d6` |
| bgt | [PDF](https://arxiv.org/pdf/1001.2282v4) | `08a8ae7fb5715d8269fd728c8a20d72403527aaefbeaa974b7040ec21d667a2d` |
| bgtmult | [PDF](https://arxiv.org/pdf/1103.3923v3) | `3bf564f86fda5425038fcea4afb681280ee75e88918585cf87daad8dcb76001a` |
| hoyois | [PDF](https://arxiv.org/pdf/1506.07123v2) | `a51aa52ec74e195e9028e963e6b1dcd80ecc834fb7a4c712a873b786f502529d` |
| hatcher | [PDF](https://pi.math.cornell.edu/~hatcher/VBKT/VB.pdf) | `04282b30dfa6305183827d399deddd0bd98240c2e6d2d0c416b06e2d4e1fa097` |
| weik | [PDF](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.III.pdf) | `ba1bc2d25680ab25c4baadc5ab28e39d1077dc66bb12ca4e2174b6cb55f81307` |
| ns-erratum | [PDF](https://archive.ymsc.tsinghua.edu.cn/pacm_download/117/10541-ACTA-2019-0222-0001-a002.pdf) | `0b98fb63029a31324ad23504f584e3f414b03f4734ba63f49b943b0bd5f27944` |

No suspicious instruction in untrusted issue/PR/source data was encountered. No credentials were used at a source's request, no fetched content was executed, and no source PDF or passage was put in the repository. The companion handoff records where the missing mathematics must be resumed.
