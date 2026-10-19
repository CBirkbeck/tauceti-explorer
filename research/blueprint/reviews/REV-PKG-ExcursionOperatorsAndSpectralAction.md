# Review: ExcursionOperatorsAndSpectralAction

**Verdict: needs_changes.** This is a completed independent package review for #11083 by Codex, session `codex-BtZbVX`, on 2026-10-19. The package author was a different worker, `claude-eaapd2`. I fixed the defects below in the package. The remaining supplier and equivariant-comparison gaps prevent an accepted verdict; elaboration alone does not establish mathematical correctness or prerequisite closure.

## Changes made

1. **Global product functions, ES6:functoriality.3.** Replaced the claimed ordinary tensor-product isomorphism by the canonical ring map. For the full nonquasicompact parameter spaces of two tori, an arbitrary function on pairs of inertial-character components need not be a finite sum of separated functions. The diagonal matrix on infinitely many components gives a counterexample. The parameter formula and operator square remain, proved on finite-wild pieces without interchanging tensor products with inverse limits. Added `infinite_diagonal_not_finite_separable_sum` as a named Lean boundary target and recorded the discrepancy with the displayed arrow in Fargues–Scholze IX.6.2, p. 331.
2. **Haar normalization, ES7:function-field-automorphic.8.** Replaced the unnormalized indicator by `e_K = 1_K / vol(K)` in the selector construction. Its representation operator is the projector onto invariants, so the value at the identity is the stated dimension divided by the nonzero orthogonality constant. The new Check distinguishes Haar measures with volume different from one. No integral division assertion was introduced.
3. **Arbitrary Schur objects, ES5.2.** The previous construction evaluated only the compact finite-wild action, although the theorem applies to noncompact Schur objects. It now evaluates the global operators of ES0.3, uses the excursion algebra of the underlying abstract Weil group, and retains the condensed continuity input for tuples. A dense discretization is not substituted for that abstract group. Compact objects recover the finite-wild construction.
4. **Coefficient transport, ES1:spectral-center.3.** Stated unrestricted change of excursion data for every coefficient map, including nonflat reduction, by comparing creation, kernel, Weil action and annihilation. Spectral-centre maps still require their stated centre-order hypotheses. ES5.7 and ES7:parabolic.3 consume the unrestricted operator statement, avoiding an implicit good-prime restriction on modular parameters.
5. **Wild cutoffs, Conventions and ES1:finite-ramification.1.** Required the open subgroup of wild inertia to be normal in the full Weil group before using the quotient group.
6. **Universal integral range, ES3.7.** Removed an extra enrichment hypothesis on the category in the universal theorem. The target includes the canonical relatively discrete enrichment and proves its general finite-wild factorization here, rather than attributing the missing argument to E5.
7. **Nonsmooth centres, ES7:parabolic.4.** Replaced the unspecified equal-characteristic alternative to z-embeddings by a central-pushout reduction using closed-subgroup smooth induction. SR.2.1 already supplies surjectivity of `SmoothRep.indEval`. The explicit function supported on `HK` proves detection of central actions on every smooth representation, without admissibility, finite index, or rational centre surjectivity. Named the stratum square to be proved from centralizers and inner twisting; included the corresponding Levi square and preservation of the `2ρ` twist. The reduction uses the existing HS4.3 plain pullback comparison. It does not pretend that the inverse image of a stratum consists of one stratum. The stronger p-adic z-embedding theory remains in ES6:functoriality.10.
8. **Boyer input, ES7:equal-characteristic.22.** Acquired the primary paper, added exact deformation, action and realization locators, and distinguished its inverse division-algebra central character from Hausberger's convention. Added the rank-one non-self-dual-character Check. Marked the remaining action-preserving Hecke-fibre comparison explicitly; a multiplicity calculation does not supply it.
9. **Supplier accounting.** Distinguished additional contracts from supplied targets. Removed the redundant LP2c request: LP2c.3–LP2c.5 already supply reconstruction and continuity in positive coefficient characteristic. Identified concrete unsupplied interfaces instead of treating their written contracts as completed prerequisites. Added printed page numbers for the Scholze–Weinstein supplier citation.

No target was dropped to shorten the roadmap. There are still 15 layers and 112 numbered target subsections. `metadata.toml` is unchanged.

## Remaining defects and exact resumption points

### R1. Supplier contracts are not dependency closure

The README now says explicitly which stronger interfaces remain unsupplied. At least these have no exact supplying target in the cited packages:

| Consumers | Required result | What the named supplier actually states | Repair needed |
| --- | --- | --- | --- |
| ES5.5–ES5.6, ES6:functoriality.11, ES6:duality.2 | Admissibility and scalar endomorphisms of irreducibles, finite length of finitely generated admissible representations, and the required cuspidal-subquotient input, over every algebraically closed coefficient field of characteristic different from `p` | SR.0.4 defines admissibility; SR.3a's admissibility theorem and SR.3's finite-length theory are complex statements. The modular `GL_n` material does not give the general reductive-group assertion. | Add named general targets in the owning smooth-representation continuation and resolve their imports. Vignéras §§4–5, pp. 337–340, supports the admissibility/finite-length part; it is not itself an existing roadmap target. Keep arbitrary `ℓ ≠ p`. |
| ES3.2–ES3.3, and the related ES2 inputs | The exact representation category freely generates `Perf(BH)` stably over a DVR; the highest-weight filtration has graded copies of `Perf(R)` and yields the tensor identity | LP3.0 is highest-weight/good-filtration theory over a field. LP3.18 constructs the approximation, not these DVR results. | Give the DVR statements named supplier targets and a proof route compatible with the existing LP ownership. Fargues–Scholze X.3.1–X.3.2, pp. 348–349, uses precisely this input. |
| ES7:equal-characteristic.17 | Functional equation for compactly supported cohomology of lisse sheaves on open curves and Laumon's local-constant product formula | WC.2 treats smooth proper constant-coefficient duality and determinant assembly. | Name and source the stronger supplying targets and their owners; a phrase extending WC.2 does not add them to WC.2. Respect the maintainer's prohibition on Tate-thesis theorem targets. |

Other additional contracts remain itemized in the package, notably the exact derived coefficient range for LP1/VS3, condensed comparisons for noncompact stratum extensions, the BunG Kottwitz/Hecke-equivariance refinements, and central-pushout geometry. These have not been certified merely because the interface table names them. Closing the three concrete mismatches above is necessary, not a certificate that every other additional contract is already supplied.

`upstream/CaraianiNewton.md` does not assign this roadmap, LP, HS, VS or BunG a tier within its 94-roadmap ordering. Its focus areas are not declared bundles. In particular, an outside-list citation cannot silently be called a same-bundle citation. The order file also records SR's citations back to excursion theory; using only SR's earlier elementary layers matters. No new tier, bundle, or ownership move was invented in this review. The supplier targets and their acyclic delivery order must be made explicit before readiness is certified. There are no `UPSTREAM:` or FoundationsAndLibraryIntegration dependencies in the package.

### R2. Equal-characteristic two-operation comparison

ES7:equal-characteristic.22 must specify the equivariant maps between the two formal-module towers and the minuscule Hecke fibres. The existing phrase about a coordinate functor does not specify how the two group actions, Weil descent, shifts, twists and duals are transported. Boyer Theorem 3.2.4, p. 586, supplies a Lubin–Tate multiplicity theorem, while Hausberger Theorem 9.5, p. 1337, supplies the Drinfeld realization. Their division-algebra centre conventions differ. For `d = 1` and `ξ ≠ ξ⁻¹`, unchanged identification already fails.

Give the actual action conversions and a geometric proof/source for each operation, then derive `σ ⊗ ρ_π ⊗ ρ_π^∨` with independent Weil actions and the chosen Satake normalization. Fargues–Scholze p. 338 names the ingredients but does not by itself give those coordinate maps in equal characteristic. This target is retained at full generality and explicitly marked as unresolved. The primary Boyer locator problem is repaired; the equivariant bridge is not.

## Quality, coverage and existing work

Read `WORKERS.md`, `PROTOCOL.md`, the expansion protocol, `UPSTREAM_GUIDE.md` and `PACKAGE_REVIEW.md`. The upstream style models read were `DGAInfinity/README.md` and `RepresentationTheory/InductionRestriction/README.md`. The package has the required summary, boundaries, conventions, supplier inventory, ordered layers, APIs, Checks and sources. No source passage was inserted or copied.

Read all of the package and its author's handoff. Compared the accepted ES0, ES5, ES6 and ES7 inputs and their import reconciliation; ES6 introduces no new nodes. Acceptance of a packet with recorded gaps does not turn those gaps into supplied prerequisites. The 112 subsection anchors are unique; every target has a source and Needs clause. A scan of the Needs clauses found no numbered reference to a later local target. Forward mentions in explanatory prose and Checks were distinguished from prerequisites.

For the current-work duplication audit I used the runner's read-only TauCetiRoadmap checkout at `0d144d044dacebca17b654695b6f1ad58f159b27`, including `Completed`, and current Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. I searched by objects, operations and hypotheses as well as names across the current trees, including the nine newer roadmaps. The atlas library-coverage entries were read as audit input, not as a substitute for these searches.

| Target families | Objects and hypotheses checked against existing work | Boundary retained |
| --- | --- | --- |
| ES0, classical centre, ES1 | Enhanced versus ordinary centre; natural transformations; condensed Weil descent; finite wild cutoffs; excursion coefficients and component idempotents | Mathlib owns `CatCenter`; LP owns the abstract excursion algebra and reconstruction. The geometric enhanced action is distinct. |
| ES2–ES3 | Stable categorical actions, animated mapping approximation, representation generation, sifted colimits and coefficient changes | E5 owns the categorical foundations; LP3.18 already owns `F♮`. ES3 owns the universal action and its geometric specialization. |
| ES5–ES6 | Scalar condensed endomorphisms, semisimple parameters, closed-orbit classification, Shapiro, torus reciprocity, closed cocompact induction, central pushouts and z-embeddings | LP2c.8 owns abstract Schur reconstruction. SR and ReductiveGroupsPartII own their existing general theory. No duplicate reconstruction was added. |
| ES7:parabolic, ES4, ES6:duality | Newton centralizers, restriction of centres, twisted Levi cocycles, annihilators, prime supports, localization and duality | Existing central algebra, cocharacters and duality suppliers are cited; geometric centre/support compatibilities are the kept variants. |
| All realization layers and ES7 | Tower cohomology, trace contractions, compact adelic quotients, elliptic sheaves, formal modules, uniformization and cuspidal realization | Completed RestrictedProducts and existing induction theory are suppliers. Real Euler–Poincaré functions remain AS; the building construction and equal-characteristic realization are distinct. |

No additional duplicate target was found to delete. The author's earlier removals of abstract Schur reconstruction and the construction of `F♮` remain correct. The current checkout's SR/RG2 content was treated as existing work regardless of the atlas snapshot's age. None of the read-only environments was built or changed.

## Source verification

The author's handoff verified the FS numbered labels and Kaletha/Hausberger locators but left the other source locators unread. I opened the public primary PDFs and checked those other locators: Scholze–Weinstein 24.2.5 and 24.3.5, pp. 227 and 231; Lafforgue Proposition 11.7 and Lemma 11.10 with the continuation through p. 147; Fargues Proposition 2.16, Remark 2.17 and Proposition 3.3, pp. 9–13; Kottwitz Proposition 10.4, p. 50; Conrad Proposition 4.1.7(i), p. 22; Henniart–Vignéras §2.2.4(2), Lemma 3.1 and Proposition 3.3, pp. 236 and 238–240; Vignéras §§4–5, pp. 337–340; and Stacks Tag 00H9. I also reread Kaletha's p-adic hypotheses and the Hausberger locators, rather than relying on the author's check.

For LRS I read the scanned pages at the cited statements: Theorems 4.1, 5.1 and 6.1/Corollary 6.2, pp. 236, 241 and 246; §13 and Proposition 13.3, pp. 290–292; §14.1–14.2, Theorem 14.9, Corollary 14.11 and Theorem 14.12, pp. 294–300; Lemma 14.14 and Proposition 14.17 with their argument, pp. 301–307; Lemma 15.10, Proposition 15.13 and Corollary 15.14, pp. 314–318; and Theorem 15.17 through Proposition 15.20, pp. 319–322. Both pages of Kaiser's correction were read. The corrected chain permits the zero-weight case and replaces the old duality argument; no integrality or self-duality assumption was restored.

The Hausberger checks cover Definition 1.1, Definition 3.1 and Theorem 3.4; Theorems 6.1/6.4; the Hecke actions and formal/rigid comparisons of §§6.3–8; Definition 9.3 and Theorems 9.1/9.2/9.5; Theorem 10.1, Lemmas 10.2–10.4, Proposition 10.5–10.6, Corollary 10.7 and Remark 10.8; Lemmas 10.14–10.15, Remark 10.16, Proposition 10.17 and §10.4; and Proposition A.12. Their relevant printed pages are 1292–1293, 1302–1304, 1311–1324, 1333–1342, 1353–1357 and 1364–1365. In particular Lemma 10.2 is on p. 1340; the README's range already includes it, although the author's handoff said p. 1339. Finite type in Proposition 10.6(i) was not promoted to admissibility. The package's earlier corrections of the false kernel argument and the index-`d` centre claim were preserved.

To meet the separate random check of already checked locators, I used Python `random.Random(11083).sample(eligible, 15)`, where `eligible` is the ordered list of 50 target headings outside ES7:equal-characteristic whose opening paragraph cites an FS numbered Definition/Proposition/Theorem/Corollary in Chapter IX or X. This excludes the non-FS locators the author left unverified. The sample, in draw order, was:

| Target | Locator opened | Result |
| --- | --- | --- |
| ES6:duality.1 | IX.5.3, pp. 329–330 | Chevalley/duality square; proof on p. 330 |
| ES7:GLn-comparison.5 | IX.7.4, p. 338 | Reduction from general irreducibles uses parabolic compatibility |
| ES7.1 | IX.7.4, p. 338 | Both local-field characteristics; semisimplified parameter |
| ES7:GLn-comparison.1 | Proof of IX.7.4, p. 338 | Two tower operations; normalized shifts/twists |
| ES4.6 | IX.3.2, pp. 326–327 | Partial Frobenii and compact Hecke-fibre object |
| ES1:spectral-center.2 | IX.5.2, p. 329 | Centre-order hypothesis present |
| ES3.8 | X.0.1 and X.3.1, pp. 339–340, 348–349 | General stable category; integral approximation range |
| ES6:functoriality.5 | IX.6.4, p. 333 | Torus Bernstein map; separate degree components |
| ES5.1 | IX.4.1 and IX.1.2, pp. 327, 320–321 | Condensed Schur condition; compactness only in the latter proposition |
| ES7:parabolic.3 | Proof of IX.7.2, p. 335 | Torsion reduction; unrestricted coefficient transport made explicit |
| ES7:parabolic.5 | Proof of IX.7.2, pp. 335–336 | Instability chosen after a bounded Hecke type |
| ES7:parabolic.6 | IX.7.2, pp. 335–337 | Levi comparison, twist and degree-zero shift cancellation |
| ES1:finite-ramification.4 | IX.1.2 and IX.5.1, pp. 320–321, 327–328 | Compact relative discreteness and wild factorization |
| ES4.7 | Definition X.2.1, p. 346 | Finite centralizer modulo fixed centre, not finite centralizer |
| ES5.3 | IX.4.1, p. 327 | Arbitrary Schur object, not merely a compact one |

An additional random 15-target scan across all 112 subsections exercised selectors, independence of globalization, cohomological finiteness, elliptic sheaves, compact spectrum, Kaiser, finite-wild descent, the animated module presentation, level moduli, coefficient reduction, the equal-characteristic local correspondence, derived reduction, the classical centre, flat support change and ellipticity. It exposed the selector normalization error and confirmed the scope limitations in the report. Neither scan certifies the missing supplier interfaces or R2.

Public-source URLs, hashes and the access date are recorded below. Only public papers were downloaded; the cleared-library index was read and no restricted book was used. Secondary citations to Deligne–Kazhdan, Henniart, Badulescu and the Euler–Poincaré computations remain identified as secondary in the package; this review does not claim to have audited their complete original proofs.

## Definitions, signatures and adversarial mathematics

All 24 definition/construction subsections found by the definition/construction scan have at least three prose Checks. These were inspected for their mathematical discrimination, not just counted. Heavy objects remain in the README/closing comment; the Lean file has eight light real-bodied definitions and no sorry-bodied data. The twelve examples are proved, with at most two per kept definition. The new infinite-diagonal control is a named theorem target because it is not yet proved.

Pinned declarations actually read include `CatCenter.app`, `naturality`, `mul_app`, `Linear.toCatCenter`, `CatCenter.localizationRingHom`; `PrimeSpectrum.zeroLocus`, its union and comap rules; and `Module.Flat.lTensor_exact`. Their directions and hypotheses agree with the uses here. At pinned Tau Ceti I read the discrete-topology/open-stabilizer fields of `IsSmoothDiscrete`, the full-subcategory definition of `SmoothDiscreteTopRep`, and the dynamic `Cocharacter.parabolic`/`levi` definitions. These pinned reads were separate from the current-tree duplication search.

Ten signature comparisons against the README:

| Signature | Hypotheses and conclusion checked |
| --- | --- |
| `heckeCompatibleCentre_comp` | Additive functors; both individual compatibility equalities imply the composite equality |
| `IsSchurIrreducible.sections_bijective` | The specified scalar unit is invertible as a condensed-algebra morphism; sections are bijective, not merely scalar global endomorphisms |
| `excursionCharacter_spec` | Algebra action and scalar algebra equivalence give the actual scalar-action identity |
| `stratum_centre_embedding_independence` | Two retractions and their comparison compatibility are present; their transported central actions agree |
| `restrictCentre_comp` | Both functors fully faithful and additive; restriction has the contravariant composition order |
| `twistedLeviCocycle_isCocycle` | Equivariance of the inclusion, invariance of `t` and commutation with its image are explicit |
| `support_exact_operations` | Central action commutes with shifts; all three triangle inclusions, biproduct union and retract containment have the correct directions |
| `support_coefficient_change` | Flatness, evaluated module actions, linear End comparison and preservation of the identity are explicit |
| `centralSupport_subset_principal_iff` | Support in `V(f)` means a power of `f` kills the identity, including the zero object and exponent zero |
| `two_leg_excursion_is_trace` | Finite dimension; dual action gives `tr(ρ(g h⁻¹))`, not `tr(ρ(gh))` |

The ordinary categorical signatures are expressly the parts statable at the pins. They do not assert that the enhanced stable or geometric carriers have been formalized, and were not weakened into substitutes for missing headline carriers.

| Statements/conventions checked | Instances and computation | Outcome |
| --- | --- | --- |
| Enhanced/ordinary/Hecke centre | Zero category; `Perf(k) × Perf(k)`; `Perf(A)`; missing Hecke functors versus an extra functor | Centre is not End of one chosen object; Hecke compatibility is a genuine condition |
| Finite wild quotient and tensor family | Trivial group; nontrivial finite wild regular action; intersections of cutoffs | Normality added before writing `W_E/P`; no common cutoff assumed for an arbitrary noncompact object |
| Schur and scalar reconstruction | Zero object; scalar rank one; two copies with matrix endomorphisms; a noncompact Schur object | Zero/matrix examples fail Schur; noncompact construction repaired |
| Coefficients and prime hypotheses | `SL₂`, `ℓ = 2`, reduction to an algebraic closure of `F₂`; rational coefficients at the same prime | Excursion parameter construction retained without a spectral-centre map; unrestricted operator transport added |
| Universal actions | Empty anima, point, free group of rank zero; DVR versus field | Approximation is not replaced by actual `Perf` integrally; category range repaired |
| Global product functions | `G_m × G_m`; infinitely many inertial characters; diagonal matrix versus rank at most `n` | False tensor isomorphism removed; named Lean negative control added |
| Twisted Levi and induction normalization | Upper Borel of `GL₂`; degree zero; `t = 1`; opposite/dual convention | Frobenius witness `diag(√q, 1/√q)` retained; normalized trivial induction gives `1 ⊕ 1` |
| Central pushout reduction | `SL_p` over `F_q((t))`; `H = J`; closed infinite-index `H`; torsion coefficients | Failed centre surjectivity is unnecessary for detection; the new evaluation argument has no index denominator |
| Torus, Shapiro and central character | Trivial torus; `Eˣ/O_Eˣ = ℤ`; split and nonsplit torus; one extension of residue degree `f` | Discrete quotients need not be finite; reciprocity and `√q` powers remain explicit |
| Support, exactness and base change | Zero object; rank-one free module; dual numbers; unit ideal; flat identity with zero functor; `ℤ → ℤ/2` killing `ℚ` | Empty/full reduced support and both necessary base-change hypotheses retained; localization uses `V(f)` in the right direction |
| Duality, ellipticity and trace | Torus inversion; trivial `GL₂` parameter; irreducible versus reducible semisimple Weil representation; `g = h` and dimension zero | Centre is quotiented in ellipticity; contraction gives dimension at the identity and zero in dimension zero |
| Selectors and compact quotient | Arbitrary positive Haar volume; projector trace; infinitely many compact-open double cosets | Projector normalization fixed; compactness is not finiteness of the double quotient |
| Elliptic sheaves/formal modules | `d = 1`, `d = 2`; rank `d²`; tangent eigenspaces; different ramified places | Period/rank and specialness Checks discriminate the proposed definitions |
| Corrected local factors and realization | Zero Kaiser weight; full graded chain; `d = 1` twist; `diag(ϖ,1)` when `d = 2` | Kaiser correction retained; false index-one centre generation not restored |
| Boyer/Hausberger actions | Rank-one finite-order `ξ ≠ ξ⁻¹`; source multiplicities with contragredient | New Check exposes a missing action conversion; R2 remains explicit |

This pass covers the conventions and all target families; it is not a proof of the 112 roadmap targets. Unproved geometric comparisons were kept out of the Lean file rather than encoded using invented carriers.

## Validation

- `lean-check` on the revised `Suggested.lean`: exit 0, 24 warnings, all `declaration uses sorry`; no errors or other warnings. It has 492 lines, eight real-bodied definitions, 24 theorem targets and twelve proved examples. The shared pinned environment uses Mathlib `082e2d3` and Tau Ceti `f790474`; 73 GB was available before the final run.
- `python3 scripts/check_sorry_data.py` on the revised Lean file: exit 0.
- `python3 research/blueprint/intake.py check-files` on the changed deliverables and handoff: zero problems.
- `git diff --check`: clean. No packet, supplier package, current upstream checkout, library checkout or metadata was changed. No source files or passages were committed.

No suspicious instructions were encountered in the issue/source material. This review does not authorize another job or alter another job's files.

## Public-source acquisition record

Accessed 2026-10-19. Hashes identify the PDFs, except Tag 00H9, whose hash identifies the fetched HTML. No source content is reproduced here.

| Source | Public copy | SHA-256 |
| --- | --- | --- |
| FS | [Public source](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf) | `9ab9efbd0df251bfa3b610d1d1d88a8dfb1bdf7c397bd04f4c277280d98ae905` |
| Hau | [Public source](https://aif.centre-mersenne.org/item/AIF_2005__55_4_1285_0.pdf) | `d51dc22168dcd4831726197b1cef252ea784cc9abbce4cf521465423638daf48` |
| Kai | [Public source](https://www.math.uni-bonn.de/people/rapoport/myalggeom/preprints/ErratumvonChrKaiser.pdf) | `6aa9e01d3551e3f0e3d8ca3d98acba98a1e163e723d342f9ccd719ae4dc02c54` |
| LRS | [Public source](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0113/LOG_0019.pdf) | `05ea7ab8cb64577f5d421f37255a7cfd58b6fc763294038cd2e87475d80ab87e` |
| SW | [Public source](https://people.mpim-bonn.mpg.de/scholze/Berkeley.pdf) | `225505171ef809aa0070c023c881ff1da844923775f2d631474c0b42eea4bffc` |
| Laf | [Public source](https://arxiv.org/pdf/1209.5352v10) | `b37715f9c42862b7560d8b71da07924376e3cbbbe862ef9e89a57d8c91a64295` |
| Kal | [Public source](https://arxiv.org/pdf/1502.00650v2) | `067aa7999a96980da07ebf90ab5cf7b30819a34235460c0818ad6d96dae2cfb3` |
| Far | [Public source](https://webusers.imj-prg.fr/~laurent.fargues/cdc.pdf) | `35c7268fd6ce086f1267a00c18e02900c87ed5da65781d3b8695644d6e8fef73` |
| Kot | [Public source](https://arxiv.org/pdf/1401.5728) | `37c9980b749d315d014c5046f486ea9d8bac1acc3753fe766ae45ac7907f12a4` |
| Con | [Public source](https://math.stanford.edu/~conrad/papers/cosetfinite.pdf) | `a1b909e7fdaaf56a21811e0379c9370ae8e9e51e75e047c6f1db927e278fca3c` |
| HV | [Public source](https://msp.org/pjm/2025/335-2/pjm-v335-n2-p02-s.pdf) | `55f167816a1ba5a084a8bf19ac9786a8d443e45e72bff9a789c39709ade87095` |
| Vig | [Public source](https://ems.press/content/book-chapter-files/33125) | `7db5e703a2d1c29e902731d82a744c2a860a5d8eaf8ae2c50c2c841eeeca4936` |
| Boy | [Public source](https://www.math.univ-paris13.fr/~boyer/recherche/invent-these.pdf) | `cbd33657ed522d9bdc3d8e0567f378a0cb04c6cce8ebed7ff9bba0bf7231cf41` |
| Stacks 00H9 | [Public source](https://stacks.math.columbia.edu/tag/00H9) | `2a8b0d6e5e27464d05517762910d5420d4c1fade42f4ec742b821cdaaf59925c` |
