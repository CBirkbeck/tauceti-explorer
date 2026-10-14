# PKG-PerfectoidShimuraVarieties — completed package

Issue: #9774. Agent: Codex. Session: codex-z5jR8P. Date: 2026-10-14.
Branch: `codex-z5jR8P-perfectoid-shimura-package`.
The bot confirmed the claim in issue comment 6172687879.

## Deliverables and preservation

The three upstream package files are complete. The README has 98 numbered target subsections across all eight accepted layers, with the 174 named API items and 111 named Checks in their corresponding target subsections. All 27 definition/construction targets have at least three discriminating Checks (range 3–7). The original 206 target citations, hypotheses, proof outlines, acceptance computations, worked examples and precise external interfaces are retained, with the locator clarifications below. Each layer ends with Examples and Dependencies. `metadata.toml` is exactly `topic = "math.NT"`.

The accepted packet, reader document and input Suggested file were left unchanged. The input is accepted by `independent-review-REV-PerfectoidShimuraVarieties~3`, 2026-10-14, as a complete target-level plan with honest gaps: eight stages planned, zero stages closed. Packaging preserves that distinction. It does not claim the seven missing proof inputs have been proved.

The package README removes programme identifiers and process commentary, replaces local node ids with numbered subsection references, and retains lower-tier supplier ids where those identify the mathematical interface. Source results are stated in our own words; no source passage or section-by-section source summary is included. The maintainer-cleared book was read in place, without copying its file or extracted passages.

## Lean shape and validation

`Suggested.lean` is 486 lines: 17 light definitions with real data bodies, 16 milestone theorems and 33 examples. Subgroup and homomorphism law fields are propositions; only those proofs are admitted. There are no admitted data definitions, synthetic geometric carriers, auxiliary lemma development, `#print axioms`, or Lean declarations claiming an absent analytic/moduli construction. The closing comment lists geometric definitions and their APIs that remain README targets, including completed-tower normalized trace and its linearity.

The retained algebraic portions have explicit namespaces and matching README scope: `SiegelTorsion.FiniteLevel` is a nonzero finite free algebra over a characteristic-zero field, `HodgeTate.MatrixChart` is matrix/pointwise geometry over its stated coefficient ring or normed p-adic extension, and `HilbertTower.Coefficients` is the matrix portion of the geometric level and pairing action. These do not replace completed tower rings, analytic affinoids or geometric Weil pairings.

Checks run successfully:

- `lean-check research/blueprint/packages/PerfectoidShimuraVarieties/Suggested.lean`: final run exited 0, with exactly 49 warnings, all declaration-uses-`sorry` warnings and no errors or other warnings. The existing shared build uses Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` and Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. One compilation ran at a time; 90 GB available memory was checked before the final run.
- `python3 scripts/check_blueprint.py research/blueprint/packets/PerfectoidShimuraVarieties.json`: 0 errors, 0 warnings; run read-only.
- `python3 scripts/check_sorry_data.py research/blueprint/packages/PerfectoidShimuraVarieties/Suggested.lean`: exited 0.
- `python3 research/blueprint/intake.py check-files` on exactly the four deliverables: 0 problems.
- Mechanical subsection mapping: all 98 targets, 174 API names and 111 Check names present in their matching sections; minimum three Checks for each definition/construction; no programme-id/private-path residue in the README.

Elaboration checks signatures and data shape, not the truth of admitted theorems. The mathematics pass below is separate.

## Current upstream/library duplication and tier boundary

Read the current upstream AdicSpaces and AlgebraicVectorBundles READMEs in full as style/density models, together with their Suggested declarations. Searched the mathematical objects and operators in current upstream Suggested files, including all nine roadmaps newer than the atlas snapshot and Completed, and in the current Tau Ceti library. The read-only upstream revision was `0d144d044dacebca17b654695b6f1ad58f159b27`; the current library revision was `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. No Lake commands were run there. All 21 baseline declaration statements were read at the pins.

One concrete duplicated generic construction was removed: input Lean `dualMatrix`, `dualMatrix_mul` and `dualMatrix_one` are supplied by `TauCeti.adjugateGL`, `TauCeti.adjugateGL_mul` and `TauCeti.adjugateGL_one` in `TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/Adjugate.lean`. The package imports that module and uses its actual definition. Both pinned and current declarations were checked. The README cites these results; the additional Hilbert moduli, polarization, target-generator and three-tower descent targets remain here.

General Huber-pair spectra and gluing are imported from AdicSpaces Layers 0–5; general analytic regular-cone charts/fan boundaries from AnalyticToricGeometry Layers 2–5; generic finite locally free/polynomial/total-space interfaces from AlgebraicVectorBundles L0B–L2B; and generic profinite completion/powers/automorphisms from ProfiniteArithmetic Layers 0–2. No new target replans those theories. Heavy absent geometry from the old Lean is retained in the detailed README rather than represented by invented carriers.

PerfectoidShimuraVarieties is Tier 17. Consumed roadmap suppliers are lower tier, including HodgeTateAndCanonicalSubgroups (Tier 16), AutomorphicBundles and ShimuraCompactifications (Tier 15), and HilbertModularVarietiesAndShimuraCurves (Tier 14). There are no `FoundationsAndLibraryIntegration` or `UPSTREAM:` references. No new ownership move is proposed. The accepted ownership direction remains Layer 0 → T2 → Layer 3; the characteristic-p extension/good-triple work belongs to Layer 1 before its downstream torsion-cohomology consumers. The exact supplier additions below still need implementation in their owners, rather than being treated as existing theorems.

## Source pass

All 15 principal input PDFs were obtained in their specified versions and their SHA-256 values matched the accepted packet. The 15-citation random sample is reproducible by flattening node source lists in packet order and using `random.Random(9774).sample(citations, 15)`. Each source passage was read, including hypotheses and nearby proof steps. Results:

| README section | Source locator checked | Result |
| --- | --- | --- |
| 1.6 | Scholze, Lemma 2.3.10(i)–(v), pp. 968–969 | Finite/normal/étale and codimension hypotheses retained. |
| 3.11 | Pan, §4.2.3, p. 38 | Wedge-square Tate and inverse determinant Hecke normalization retained. |
| 6.11 | Revised Boxer–Pilloni, Remark 4.6.4, pp. 90–91 | Modified Hodge–Tate lattice distinguished from the semiabelian integral lattice. |
| 1.8 | Scholze, Lemma 3.2.14, pp. 984–985 | Frobenius square/radius change retained. |
| 1.30 | Scholze, footnote 7, p. 971 | Semilinear cyclotomic-base action retained. |
| 6.7 | Boxer–Pilloni arXiv v1, proof of Lemma 4.4.50, p. 84 | Connected/image tower construction retained. |
| 5.2 | Heuer, Proposition 3.19 and Theorem 3.22 | Corrected the locator to pp. 22–23 and 24–26 respectively; Proposition 3.19 starts on p. 22. |
| 1.18 | Scholze, Lemmas 3.2.25–3.2.26 and preceding paragraphs, pp. 997–998 | Tilted finite torsion-ring construction retained. |
| 6.12 | Revised Boxer–Pilloni, Lemma 3.3.14 and Proposition 3.3.15, p. 41 | Actual level-group depth conditions retained. |
| 1.30 | Scholze, Theorem 3.1.2(i), p. 971 | Open perfectoid tower distinguished from compactification. |
| 3.4 | Birkbeck–Heuer–Williams, Lemma 3.19/proof, p. 13 | Row-graph factor and inverse action convention retained. |
| 2.4 | Scholze, proof of Theorem 4.1.1, p. 1020 | Image compactification, not normalization or restricted structure sheaf. |
| 3.8 | Boxer–Pilloni arXiv v1, §4.4.27, p. 74 | Genuine minimal tilde-limit property remains unknown. |
| 4.1 | Hansen–Johansson revised v2, Proposition 5.16/Definition 5.17, p. 36 | Property P and neutral-component distinction retained. |
| 1.24 | Scholze, Lemma 3.3.6/Remark 3.3.7, pp. 1006–1007 | Target is dual Lie, with the stated rational-flag condition. |

Additional checks read the sources controlling the seven missing proof inputs: Scholze Lemma 3.2.35, pp. 1001–1002; Hansen–Johansson Lemmas 5.9–5.10, pp. 31–32; Pilloni–Stroh Théorème 1.9/Remarque 1.10, p. 5, and Théorème A.11, p. 27; revised Boxer–Pilloni §§4.4.38–4.4.45, pp. 79–85, and Proposition 4.6.19/Lemma 4.6.20, pp. 97–99. None removes the accepted gap it controls.

Added precise references read directly: Faltings–Chai V, Theorem 2.5(4)–(6), pp. 152–153, for full principal-level boundary strata; Bhatt–Scholze arXiv v4 Theorem 1.17(1), p. 9, = Theorem 10.11, p. 82, and Theorem 7.4/Remark 7.5, p. 56; Lovering §§4.6.1–4.6.6, pp. 1877–1881, and Lemma 3.1.6, p. 1857; Lan Theorem 2.2, author PDF p. 4, and §6/Proposition 6.1, pp. 18–20. Bibliographic versions and hashes for the three added public papers are in the README. The full-level Faltings–Chai/Pilloni–Stroh descriptions do not prove the general-ε full-to-Γ₁ inertia argument. In §5.4 the open PEL tilde-limit is cited from §2.3; §2.6's genuine minimal diamond limit is not used to infer that property.

Katz–Mazur 8.11.10 is explicitly a secondary attribution through Heuer §2.3/Lemma 2.9. The cleared collection contains only Katz–Mazur Chapter 5; no other copy was used. The source pass is the random sample and named additional checks above, not a new independent certification of all 206 citations or all accepted errata dispositions.

## Adversarial mathematics pass

The pass covers each target in the indicated subsection ranges, its API/tests and its defining conventions. It uses actual supplied Shimura objects; constant arbitrary towers are negative controls, not replacement definitions.

| Statements/definitions checked | Instances and calculations | Outcome |
| --- | --- | --- |
| 0.1–0.9 | g=1 congruence indices; m=0 zero residue ring; p=2; g=2 diagonal (1,1,−1,−1); GL₂ full tame level; torus and trivial local group; opposite right-translation composition; unipotent intersection of Γ₁ levels | Multiplier congruence rather than determinant congruence; all depth-zero groups full; Γ₁ not cofinal; central arithmetic kernel and neutral stabilizer preserved. |
| 0.general.1–0.general.2 | General pure datum versus Hodge type; deeper cusp lattice; genus-two rank-one ray (2,−1)(2,−1)ᵀ = [[4,−2],[−2,1]] | No general perfectoid toroidal claim; base fan smoothness does not imply smoothness at changed lattice; root/ray inequalities are checked in the actual lattice. |
| 1.1–1.31 | Genus one cusp versus g≥2 codimension/Hartogs; ε=0 versus 0<ε<1/2; p=2; zero boundary ideal; finite free trace degree 1 and split degree 2; characteristic-p denominator control; strict diagonal Iwahori versus upper unipotent; rational/nonrational flags | Frobenius radii, normalization and actual degree retained; genus-one boundary proof separately supplied; general-ε boundary inertia remains conditional; no almost-purity-only plus-ring inference. |
| 2.1–2.10 | Identity Siegel embedding; normalization of a nonnormal image; arbitrary tame level including full tame level; constant positive-dimensional tower | Open/image/genuine minimal towers distinguished; no closed-set-only construction and no tilde-limit deduced from diamond representability; integral-algebra perfectoidization dependency explicit. |
| 3.1–3.13 | Lower versus upper block parabolic; row (1,z), factor a+zc, diagonal multiplier a·d; symmetric versus nonsymmetric genus-two matrices; identity chart; nonunit zero factor; radius 0 over a normed p-adic extension; ramified/equal-characteristic coefficient exclusions; p=2 integral estimate | Row frame and W-dual factor c⁻¹ fixed; unit determinant is required; radius-zero domain is embedded ℤ_p rather than all norm≤1 elements; modified-model p=2 estimate remains conditional. |
| 4.1–4.7 | Neutral closed fibre in profinite component family; nontrivial fixed finite quotient; pre-abelian datum without abelian-type lift; prescribed reflex embedding | Representability only for arbitrary pre-abelian data; no period map inferred; genuine minimal statement is a diamond limit over C, conditional on perfectoidization. |
| 5.1–5.11 | Modular cusp q-root rotation; F=ℚ versus [F:ℚ]>1; diagonal level matrix (a,d) with dual (d,a); generator 6 changed by unit 2 gives 3; p ramified/unramified in F; η changing polarization | Left level action and right translation by adjugate distinguished; determinant/generator factors and polarization inverse retained; full profinite deck group differs from bounded component stabilizer; p-unramified splitting hypothesis retained where used. |
| 6.1–6.15 | Finite Kummer chart versus completed diamond overlap; ramified boundary quotient versus étale interior; effective central kernel in Gᶜ; nonsplit Res GL₂ with split parabolic B×GL₂; strict >m depth; cyclotomic containment; common cone refinement | Universal openness, central-character fibre product and inertia-trivial torsor descent remain separate inputs; projected nonsplit compact Levi group retained; M_dR descends after twist, whereas M_HT need not descend untreated; no single fan is asserted Hecke-compatible for every t. |
| All retained GSp definitions/milestones | Finite arbitrary index with nonempty hypothesis only where multiplier uniqueness is needed; trivial coefficient ring; p=2; m=0; degree/index computations; integral Γ cofinality | Coefficient generality matches README; generic GSp is not confused with its ℤ_p level subgroups. |
| Finite trace, matrix and coefficient definitions/milestones | Nonzero characteristic-zero finite free algebra; K×K trace 2a; inverse matrix requires unit determinant; empty matrix index; scalar diagonal; unit inverse versus division by arbitrary element; integral Z versus extension-valued Z | Denominators have stated nonvanishing/unit arguments; analytic and completed-ring generalizations remain named README targets. |
| Conditional double-coset theorem and local Hecke target | t=1, k=u and k′=u⁻¹ with nonidentity upper unipotents; P=1, H=Ubar=G, t≠1; nonsplit unramified quadratic example at m=n=1 | Unipotents can cancel without separate vanishing. t∈P is essential. Both factorization orders are explicit hypotheses. The nonsplit example refutes the auxiliary factorization, not the actual Levi-image equality. |

Sixteen retained theorem signatures were matched with their README scope: similitude specification; integral congruence cofinality and genus-one compatibility; exact similitude images; finite trace retraction; strict Iwahori containment; graph/frame identities and determinant-unit estimate; pointwise distance zero/stability; Hilbert level composition/pairing/generator identities; conditional double-coset identity. Examples pin the determinant, inverse, row-frame, trace and action directions. No new false unconditional identity was found in these retained signatures.

## Seven proof inputs still required

These are mathematical implementation prerequisites, not unfinished package deliverables. The README states them precisely and preserves conditional conclusions:

1. **Integral-algebra universal perfectoidization:** Bhatt–Scholze 1.17(1)=10.11 must reach the exact P8 integral-extension/finite-tower interfaces used by §2.6 and §§4.3–4.5. General semiperfectoid quotient results Q2/Q4 alone are insufficient. The additional construction belongs in PerfectoidQuotients, coordinated with P8. Open and image-compactified Hodge towers do not consume it.
2. **Full-to-Γ₁ higher-genus boundary inertia:** constancy along lower-genus strata plus ordinary density, for general ε, in ShimuraCompactifications C5. Needed by §1.22. ε=0 and genus-one proofs do not settle it.
3. **Completed log-chart universal openness:** prove openness after completion, inverse limit and diamond base change, including the fs/adic product comparison. Owned here in §6.1, with general foundations in T6:log-sites; needed by its density/descent clauses and §§6.2–6.3, 6.11. The effective deck kernel and joint v-cover have separate arguments.
4. **Lovering B₁/reflex norm and Gᶜ Levi fibre product:** D4 needs the norm/cocharacter/data maps and the coefficient central-character calculation, not merely a derived central isogeny. Needed by §§6.4–6.6, 6.9. The smooth-surjective torsor fibre-product principle is conditional on these group identities.
5. **Boundary torsor descent:** AutomorphicBundles B3.general with ShimuraCompactifications C3.general must show boundary inertia acts trivially on pushed-out canonical Levi torsor fibres and provide logarithmic/coarse quotient descent. Needed by §6.9; interior finite étale descent is insufficient.
6. **p=2 truncated integral Hodge–Tate estimate:** the replacement bound 2 is reported without proof in Pilloni–Stroh Remarque 1.10. T5 modified-model interfaces using n₀=2g+1 and exponent n₀−2g keep this hypothesis in §3.9. It is independent of all-prime Siegel representability.
7. **Nonsplit local Hecke Levi image:** prove the actual Boxer–Pilloni Lemma 4.6.20 equality by a Galois-compatible argument or explicitly restrict its hypotheses. Needed by the Bruhat clause of §6.15. The cancellation theorem is valid with t∈P, P∩Ubar=1 and both H factorizations; rational Iwahori decomposition does not imply those factorizations for the split-field parabolic in the accepted Res GL₂ example.

## Next action

Independent package review can start from these four files. There is no remaining packaging work or checkpoint. No second job is claimed in this run. All scratch retrievals, scripts and compile logs can be deleted after submission; nothing needed to resume is confined to scratch.
