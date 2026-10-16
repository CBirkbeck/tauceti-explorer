# Independent package review: AInfCohomology, round 2

**Verdict: accepted, with the corrections below applied.** Codex, session `codex-0QrcTA`, reviewed issue #9877 on 2026-10-16. I did none of package jobs #9154 or #9876. This accepts the roadmap as a plan ready for a draft TauCetiRoadmap PR; it does not claim implementations or proofs of its heavy targets.

## Scope and coverage

I read WORKERS.md, PACKAGE_REVIEW.md, the required PROTOCOL sections, UPSTREAM_GUIDE.md, the previous review and the revision handoff. The upstream form comparison used current AdicSpaces and AlgebraicVectorBundles, including their Suggested.lean files. I read the package's mathematical exposition, definitions, API lists, Checks, examples and conventions in layer order.

The package retains all **226 accepted targets**: 137 from AI.0, 60 from AI.6 and 29 from the main packet. Two inherited heading changes are intentional: “Regularity and completeness of integral periods” becomes “Regularity of integral periods” because generic completeness is already supplied; “Torsion and lattice exports to CP.5” becomes “Torsion and lattice statements for proper cohomology,” removing a downstream planning label. The 38 supplier targets and the revision's three comparison targets give **267 targets**. No target was removed in this review. No packet was edited.

Every target has a Needs clause. All named internal references in those clauses resolve to earlier target headings. The 135 distinct named external supplier references resolve to actual packet or upstream roadmap titles. The remaining Mathlib and Tau Ceti inputs are existing carriers and APIs, rather than assumed geometric or derived constructions. The 59 main-packet baseline declarations were located in the pinned source; I read the relevant Witt, Fontaine, power-series, module, complex, completion and divided-power declarations. In particular, the ordinary derived category is not used as a substitute for the enhanced monoidal category, classical completion is not used as derived completion, and a divided power algebra is not a divided power envelope.

The external contracts use lower tiers or the tier-13 bundle AInfCohomology + PadicHodgeTheory + PerfectoidQuotients + PrismaticCohomology. They contain no FoundationsAndLibraryIntegration or UPSTREAM prerequisites. Bundle interleaving remains necessary: the coefficient prefix precedes R06.1; AI.3 precedes P8; the homological, period-sheaf and Witt-comparison inputs precede PR.3/PR.6; AI.2 precedes the PR.7 BKF interfaces; the trace comparisons come last. The earlier handoffs' ownership follow-up in CrystallineCohomology CR.5 and DerivedDeRhamCohomology DD.4/DD.6 remains an external manager task. This review neither edits those packages nor claims their upward citations have been repaired.

## Resolution of the previous review's two gaps

**G1: the actual trace/prismatic specialization maps.** The revised §AI.7.3 gives the three squares, rather than choosing new equivalences after specialization. On the Frobenius twist the maps are g, e_π and e₀; their composites with φ_𝔖 are respectively f, θ_𝔖 and c_𝔖. This identifies the exact scalar actions to compare, including Witt Frobenius. I checked the following construction-specific arguments against BS22 §15.2 / Proposition 15.7, p.105, and BMS2 Corollary 11.12, pp.304–305:

- The A_inf route compares the relative-to-absolute trace map with the prismatic envelope map before unfolding. After perfected coefficient extension the universal δ-presentation has the same coefficient map and structural generators on both routes. The absolute comparison then uses BS22 Theorem 13.1, pp.94–96, and BMS2 Theorem 9.6's perfectoid evaluation map, pp.286–288. This argument does not invoke uniqueness on a nonperfect Čech overlap.
- The de Rham route keeps the filtered map and its Beilinson connective-cover factorization. The new HKR target compares that particular factorization with BS22 Theorem 15.3 / Corollary 15.4, pp.103–104, using BMS2 Remark 11.17, pp.307–308. Its reduction is a map in the Beilinson heart, with degree-zero structural map and differential dx fixed by augmentation and Connes/Bockstein. The universal de Rham algebra then fixes the higher forms. Equality of cohomology groups alone is not the argument.
- The crystalline route compares the actual PD-envelope map of BMS2 Theorem 8.17, pp.276–279, with relative Frobenius in BS22 Theorem 5.2, pp.45–47. The generator calculation φ(y)/p = (p−1)!γ_p(y)+δ(y) fixes the direction. If E(0)=ap, the E-oriented multiplier is a⁻¹; in the transported Frobenius presentation it is φ_W(a)⁻¹. Keeping that coefficient transport prevents an implicit E(0)=p normalization. The proof retains derived reduction or flat presentations when passing to the special fibre.

These are adequate proof routes for the named comparison targets. They are additional mathematical arguments in the roadmap, not claims that a single cited theorem prints all three squares.

**G2: agreement with the wider smooth diagram.** The new coordinate crystalline and period/infinitesimal targets identify the extra maps required by §AI.7.4(b). I checked the all-coordinate construction of BS22 Theorem 17.2, pp.117–120, the relative-Frobenius construction of Theorem 5.2 and the q-crystalline comparison of Theorem 16.18, pp.113–114, against BMS1 Corollary 12.7, Lemma 12.8 and Proposition 12.9, pp.100–103. The ordinary-to-q Koszul map has degree-J factor ∏h_s, whereas its inverse has ∏h_s⁻¹. On x^p, h_s=ξ̃/p; omitting or reversing this factor fails. The bounded A_cris^(m) stages occur before the filtered colimit and p-completion; the proof does not commute décalage with an unsupported unbounded tensor product.

The integral evaluations agree on perfectoid algebras by the same Teichmüller maps. Étale fixed points are compared modulo pⁿ before the completed limit; μ and ξ̃ give the same finite-level localization, without asserting that uncompleted ξ̃-localization is Frobenius stable. The B_dR⁺ comparison uses the coordinate embedding-ideal completion and the convergent exponential operator, not inversion of a derivation. This agrees with the specified infinitesimal period map and BMS1 Proposition 13.23, p.117. Properness is retained for the global étale tensor product and finite-free B_dR⁺ realization. Finally, the de Rham square compares the factorized Frobenius maps and their Bockstein reductions, using θ̃φ=θ. BS22 Theorem 18.2, pp.122–123, is used only for its full smooth O_C/perfect-prism domain. Thus G2 no longer rests on an unsupported uniqueness claim over A_cris or the Breuil–Kisin prism.

Two unchanged nearby sentences still said that the θ and Witt map agreements were unproved. I replaced them by explicit references to the now supplied §AI.7.4(b), distinguishing the standalone base-change equivalences from that later compatibility result.

## Corrections applied in this review

| Location | Correction and discriminating witness |
| --- | --- |
| AI.0:integral.1 | Corrected the Witt-residue introduction locator to BMS1 v3 p.4. Replaced the automatic 1↦1 Check by the zeroth coordinate of [a]: a non-Frobenius-fixed residue distinguishes the intended map from its Frobenius composite. The period computations μ↦0 and ξ,ξ̃↦p remain. |
| AI.2.2 | Made the broad BKF tensor statement precise: the inherited exact sequences are preserved by tensoring with an A_inf-flat object; arbitrary tensor factors give right exactness. Added the counterexample obtained by tensoring 0→A_inf --p→ A_inf→A_inf/p→0 with A_inf/p: the first arrow becomes zero. Finite-free tensor/dual statements remain. |
| AI.2.3 | Separated the SW20 Theorem 14.2.1 statement, printed pp.116–117, from its proof in §14.3, pp.119–121. Corrected the same proof locator in the two-open gluing target. Replaced process wording in reconstruction by its actual interior/boundary supplier division. |
| AI.6.4 | Corrected the targets of the relative bounded crystalline augmentations: the absolute ring maps to O_C, while the rings for R and R_∞ map to R and R_∞. The API and a torus-coordinate Check now retain these domains and codomains. |
| AI.7.2 / references | Added §2.2, p.13, to the circle Tate spectral-sequence locator and pinned the arXiv BMS2 reference to v2, matching the page numbering used. |
| Worked torus example | Scoped the finite polynomial sum [n]_q to n≥0; supplied [n]_q=−q^n[−n]_q for negative n. At n=−1 this gives −q⁻¹ and then −1 at q=1. |
| Worked ramified example | Restricted the asserted factorization through ℤ_p to K=ℚ_p(p^{1/p}) with π=p^{1/p}. The equation π^p=p alone does not remove a larger residue coefficient ring. |
| Throughout | Removed paper-job identifiers, source-extraction commentary, numbered-process references and stale acceptance language while retaining the mathematical corrections and their source locators. No source quotation was retained or introduced. |

## Independent source sample

I selected 15 targets without replacement using `random.Random(9877).sample` on the 267-target inventory, before applying the fixes. The table records direct readings of the indicated primary sources. Source abbreviations and versions are those in the package references: BMS1 arXiv v3, BMS2 published unless marked v2, BS22 arXiv v4, ČK arXiv v3 and SW20 with printed pagination. Maintainer-cleared materials were read in place. No source text or restricted file was copied into the repository.

| Sampled target | Locator checked and outcome |
| --- | --- |
| Finite free A_inf modules and bundles on punctured analytic Y | SW20 Theorem 14.2.1, pp.116–117; proof §14.3, pp.119–121. Fixed the proof page range; retained the full analytic locus and the finite-free conclusion. |
| Quasisyntomic unfolding of the trace coefficient sheaf | BMS2 Proposition 4.31, p.230; Theorems 7.1–7.2, pp.254–256; Constructions 7.4/7.7, Proposition 7.9 and Corollary 7.10, pp.256–259. Checked the Nygaard/Bott indexing and the distinction between a discrete value on the basis and its unfolded complex. |
| Vector bundle criterion for A_inf-modules | BMS1 Lemma 4.10, pp.36–37, and Corollary 4.12, p.37. Retained finite presentation, the free torsion-free part and p-local projectivity. |
| Breuil–Kisin A_inf base change | BS22 Theorem 1.8(5), p.4, Example 1.9(2), p.5, and Theorem 17.2, pp.117–120; BMS2 Theorem 1.2(1), p.201, and Theorem 11.2(1), p.298. Checked the shifted coefficient embedding and affine completed tensor. |
| Décalage of a Koszul complex | BMS1 Definition 7.1, Example 7.2 and Lemma 7.9, pp.56–59. Checked the divided differential, unit case and two-operator sign. |
| Relative Breuil–Kisin trace coefficients | BMS2 Proposition 11.10, pp.302–303. Checked can(u)=Eσ, can(v)=σ⁻¹ and the different cyclotomic-Frobenius values. |
| Compatibility of period evaluation and infinitesimal realization | BS22 Theorem 9.1 and proof, pp.71–73; BMS2 Theorem 9.6, pp.286–288; BMS1 Corollary 12.7 / Proposition 12.9, pp.100–103, Theorem 13.1, pp.104,115, and Proposition 13.23, p.117. Checked evaluation maps, finite-level fixed points and the infinitesimal completion. |
| Semistable cohomological BKF modules | ČK §§7.2–7.3 / Theorem 7.4, pp.68–69, and §8.3, p.72; BMS1 Corollary 4.20, p.40. Checked properness, finite presentation and p-local freeness rather than an unconditional integral freeness claim. |
| The primitive comparison over A_inf | BMS1 Lemma 5.6 / Theorem 5.7, p.47; Scholze 2013 Lemmas 4.10/4.12 and Theorem 5.1, pp.26–28. Kept almost acyclicity local and proper smoothness in the global comparison. |
| Perfectoidness of products of root towers | ČK §5.18, p.41, and Lemma 5.37, pp.53–54. Checked the finite-étale stages versus the perfectoid completed limit. |
| Circle actions, homotopy fixed points and Tate constructions | BMS2 v2 §1.2, pp.3–5, and §§2.2–2.3, pp.13–16. Corrected the spectral-sequence locator; retained conditional convergence and Laurent Tate periodicity. |
| Witt residue specialization | BMS1 Introduction, p.4, and §4.2, pp.34–44. Corrected the introduction pages; the additional period values follow from Witt functoriality and the displayed cyclotomic polynomial. |
| Continuous cochains of a procyclic p-adic group | BMS1 Lemma 7.3(ii), p.56. Kept the inverse system of discrete p-power-torsion coefficients and the two-term continuous model. |
| Integral crystalline coefficient interface | BMS1 Definition 3.22(i), p.27, and §12.1, pp.96–97. Checked the integral PD completion before rational localization. |
| Integral Witt Frobenius descent and no-leg shtukas | BMS1 Lemma 4.26, pp.41–42, and SW20 Theorem 12.3.4, p.104. Distinguished the torsion-inclusive integral statement from SW's finite-free analytic statement. |

There are no remaining author-flagged unverified locators in the package. The previous review's original-book versus secondary-source qualifications remain recorded in that review; I do not claim to have independently reread every unchanged original book. Beyond the random sample, I directly checked the BS22/BMS1/BMS2 constructions needed for G1/G2 and the other changed locators above.

## Adversarial mathematics pass

I checked all 267 targets and the standing conventions, using their displayed hypotheses rather than treating elaboration as evidence of truth. The grouped rows below record the main probes across the complete layer walk. They include the new comparison targets and recheck the earlier review's corrections.

| Target families | Instances and outcome |
| --- | --- |
| AI.0 cyclotomic periods, finite Witt maps and kernels | ε=1 gives μ=0 and ξ=p, so geometric regularity needs primitivity. r=0 gives 1; r=1 and r=2 distinguish inverse from forward Frobenius. At p=2 the integer 2 is still nonzero in the Witt ring. θ(μ)=0 and θ̃(μ)=ζ_p−1 fix the shift. |
| AI.0 regularity, flatness, coherence and almost coefficients | Length-one Witt vectors reduce to the valuation ring. Nonzero nonunits are needed for the local power-series specialization; an arbitrary perfectoid map is not asserted flat. The square-zero coherence test retains finite generation. The Witt almost ideal contains μ but not p. |
| AI.0 integral twists and rational period interfaces | The zero tensor twist is the unit; dlog keeps its (ζ_p−1) factor. The residue map cannot pass through μ-inversion. B_dR⁺/ξ² remains a nonreduced thickening, so field arguments cannot be used there. |
| AI.1 divisibility terms, differentials, maps and principal cohomology | f=0 defines cocycles but not décalage. For f=p and C=[ℤ --p→ ℤ], the divided differential is 1; with p² it is p. For f=1 recover C. These tests fix both the divisibility direction and removal of only one f-torsion step. |
| AI.1 invertible ideals, derived functors, monoidality and truncation | The unit ideal gives the identity. Changing generator by −1 changes degree i by (−1)^i; negative powers use the dual line. Good τ≤0 of [ℤ --2→ℤ] is zero, not ℤ[0]. Strong monoidality retains the valuation-ring hypothesis. |
| AI.1 Bockstein, completeness, colimits and nonflat base change | The p differential gives Bockstein id; p² gives zero. Completion at the décalage ideal retains the comparison; the finite-support shift is injective but its unrelated completion has kernel (a,xa,x²a,…). A quotient needs regularity of the image of f: f=g=p is excluded. |
| AI.1 Koszul and continuous cochains | For two operators d⁰(m)=(xm,ym), d¹(a,b)=xb−ya, so d¹d⁰=0 and the basis images are −y,x. A regular scalar sequence has top cochain cohomology. For the trivial group the unnormalized differential alternates 0,id; normalized cochains give the degree-zero complex. |
| AI.2 valuation algebra, patching and finite presentation | Zero/rank-one modules check the dimension and free cases; nonprincipal fractional ideals are retained. Generic freeness over the valuation ring is not attributed to a PID theorem. Unit-divisor patching is trivial; p-local projectivity is not discarded in the vector-bundle criterion. |
| AI.2 BKF categories, realizations and analytic reconstruction | A_inf/p is allowed but is not finite free, and its tensor product kills the p-injection. A_inf/(μ) fails p-local projectivity. Finite-free duality stays in its proper subcategory. Étale realization uses W(C^♭), not uncompleted ξ̃-localization. The analytic reconstruction retains both boundary ends and the specified lattice Ξ. |
| AI.3 period sheaves, AΩ and toric models | Perfectoid sections have almost higher acyclicity; derived and classical sheaves are compared by their named target. A zero-dimensional torus gives the coefficient ring. At q=1, [n]_q=n; at n=0 it is zero; n=−1 gives −q⁻¹. The characteristic-two Sq⁰ test distinguishes E∞ cochains from a strict exterior model. |
| AI.4 finite Witt and crystalline comparisons | At Witt length one keep θ versus θ̃ and the Bockstein differential. For m<p the bounded PD coefficient ring is A_inf; m≥p² supplies the stronger unit estimates. The unbounded quotient by μ is not assumed separated. Completion and décalage are exchanged only through the bounded-stage argument. |
| AI.5 proper cohomology, torsion and lattices | The point gives A_inf in degree zero. Torsion-free adjacent-degree conditions remain where required; they are not replaced by a rank equality. The crystalline and étale length comparisons include all p-power truncations. Recovering the de Rham lattice retains the actual B_dR comparison. |
| AI.6 charts, log structures, towers and monomial splitting | The nodal chart has q>0; the smooth r=0 chart eliminates the dependent coordinate. Root depth zero recovers the original chart, whereas an infinite tower is not a finite étale map. Integral/fractional weights are distinguished, with μ annihilating the indicated nonintegral cohomology. |
| AI.6 local edge, Hodge–Tate and log de Rham comparisons | The smooth one-coordinate chart checks the divided logarithmic differential and its twist. Almost-to-integral upgrades keep their no-almost-torsion hypothesis. The semistable node has opposite residues at its branches; ordinary differentials cannot replace the logarithmic complex. |
| AI.6 relative crystalline rings and all-coordinate maps | At the coefficient point θ has target O_C; at a torus it has target R and carries the coordinate to that coordinate. Adding redundant coordinates adds a PD Poincaré resolution, not a new comparison. Frobenius and Δ actions retain their specified coefficient linearity. |
| AI.6 infinitesimal B_dR⁺ constructions and descent | A redundant variable requires embedding-ideal completion, not only ξ-completion. The chosen lift to B_dR⁺ is retained. A connection gives local freeness on the smooth characteristic-zero base; O/ξ over O/ξ² supplies the counterexample to an unrestricted thickening claim. |
| AI.6 global comparisons, torsion lengths and model independence | Properness stays in the global étale/B_dR and cohomological finiteness statements. n=0 gives zero truncated torsion length. Valuation length is normalized by val(p)=1. The nodal conic and smooth P¹ have the same degree-two lattice with the required twist. |
| AI.7 coefficients, flatness and trace constructions | f(u)=[π^♭]^p, g(u)=[π^♭], θ_𝔖(u)=π^p and e_π(u)=π. can(b)=Eσ and can(v)=σ⁻¹ differ from the Frobenius map. Homological degrees +2 and −2 are not the degree-zero formal parameter. The circle Tate term is Laurent and only conditionally convergent under the stated bounds. |
| AI.7 new coordinate crystalline and period targets | The empty coordinate set gives the identity. On x^p, q differentiation has coefficient ξ̃ and ordinary differentiation p, detecting h_s and its direction even at p=2. θ(h_s)=1. The infinitesimal period factor on x^p is (q^p−1)/p, interpreted by a series rather than division by an operator. |
| AI.7 new HKR target and trace/prismatic agreement | x maps to x and dx to dx after the specified heart reduction, not to p x^(p−1)dx. Two-coordinate wedges fix the sign. The nonperfect overlap is excluded from perfect-prism uniqueness. E(0)=ap with non-Frobenius-fixed a checks the transported unit φ_W(a). |
| AI.7 specializations, BKF functor, twists and choice transport | The coefficient point checks all three maps. Exactness of the BK-to-BKF extension uses flatness of f; it does not assert exactness of arbitrary tensor factors in the target category. Uniformizer transport is asserted after the specified common extension. The ℤ_p factorization and p-divisible torsion length are restricted to the stated ramified field. |

## Definitions and Lean

All **67 API-bearing definition/construction blocks** retain at least three Checks. I checked the 55 accepted definition/construction nodes and the additional suppliers against these blocks and the Lean declarations or closing list. The tests include computed values, degenerate cases, agreement with the nearest existing notion and non-examples. The residue Check was strengthened as recorded above. The relative augmentation and broad-category tensor corrections have explicit negative controls in the README.

Suggested.lean is unchanged: **327 lines, 12 light real-bodied definitions/abbreviations, 15 theorem signatures and 18 examples**. Heavy definitions remain README targets and appear in its closing list. There is no sorry'd data, theory development, vacuous True target or theorem assuming its own conclusion. I checked the following ten signatures in detail:

| Lean declaration | README agreement |
| --- | --- |
| `mu_factorization` | Polynomial factorization over a perfect characteristic-p base; no primitivity needed. |
| `frobenius_mu` | Forward Witt Frobenius gives ξ̃μ, not ξμ. |
| `xiLevel_succ` | The new factor is φ^(-r)(ξ), including r=0. |
| `tildeXiLevel_succ` | The new factor is φ^(r+1)(ξ), including r=0. |
| `shiftedTheta_ker` | Transports an existing principal kernel along an automorphism; it does not assume the shifted conclusion. |
| `thetaTilde_teichmuller` | Untilts the inverse-Frobenius root; retains p-adic completeness and p nonunit. |
| `ker_fontaineTheta_eq_span_xi` | Retains complete algebraically closed mixed-characteristic C and the primitive first-root condition on ε. |
| `isRegular_p_mu` | The same geometric and primitive-root hypotheses supply regularity of the ordered pair p,μ. |
| `mem_etaTerm` | Describes a divisibility submodule without requiring f regular; only the décalage interpretation needs that hypothesis. |
| `coefficientFrobenius_formula` | Uses arbitrary coefficient ring homomorphism F and p≠0 for substitution; its n-th coefficient is zero unless p divides n. |

The remaining signatures were also compared: residue periods, shifted-map surjectivity, the p-th-power Teichmüller formula, the q-integer identity and crystalline coefficient compatibility. Their algebraic generality does not silently impose the geometric conclusions.

`lean-check` in the shared pinned environment exited **0**, with **33 warnings, all `declaration uses sorry`**, and no errors or other warnings. Memory was checked before the single compile. The build uses Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. This verifies elaboration of statements only.

## Current upstream audit and final checks

I independently confirmed current TauCetiRoadmap commit `0d144d044dacebca17b654695b6f1ad58f159b27` and current Tau Ceti commit `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Searches included Completed and the nine roadmaps newer than the atlas snapshot, using mathematical objects and hypotheses: Witt coefficient/adic ideals, Frobenius and Fontaine maps, cochain grading and continuous coefficients, valuation modules, vector bundles, PD/prismatic envelopes and comparison maps.

The current library's Witt completeness, Huber/non-Tate criterion, Teichmüller Frobenius formulas, interior `spaY`, Frobenius homeomorphism, windows and quotient are already boundary inputs. AdicSpaces supplies the interior and interval geometry; AI.2 adds the boundary-neighbourhood and BKF reconstruction statements. AlgebraicVectorBundles concerns algebraic quasi-coherent/locally free sheaves and geometric total spaces, rather than this analytic extension theorem. The commuting-endomorphism cochain Koszul target differs from the sequence chain complex in IntegralHeckeAndGaloisDeterminants §6.4. The inverse-limit topological coefficient target differs from the discrete profinite cochain model. I found **no additional whole-target duplication**, so there is no removal list beyond the earlier review's recorded reuse. No upstream checkout was edited or built.

Final validation:

- All three input packets: `scripts/check_blueprint.py`, exit 0, zero errors and zero warnings each. Their historical gap/request records remain untouched; the package supplies its named local or external contracts rather than rewriting accepted packets.
- `scripts/check_sorry_data.py` on Suggested.lean: exit 0.
- Target, supplier-reference, prerequisite-order and definition-Check audits: pass.
- `research/blueprint/intake.py check-files` on the changed deliverables and handoff: zero problems.
- `git diff --check`: pass. Metadata remains the single line `topic = "math.AG"`.

No unresolved defect remains within this package review. The next step is the maintainer's bundled upstream submission, with the external ownership follow-up noted above kept visible.
