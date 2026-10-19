# Independent package review: relative Jacobians and integral curve models

Reviewer: Codex, session codex-4iuk8j. Date: 2026-10-19. Job: REV-PKG-RelativeJacobiansAndIntegralCurveModels~codex, issue #11130.

**Verdict: accepted with the corrections in this submission.** The package is ready as a roadmap specification. This verdict does not assert that its admitted theorem targets are proved.

## Inputs and independence

I reviewed the package against the accepted packet's 28 nodes, 90 API items, 40 checks and 14 supplier requests, and read WORKERS, PROTOCOL, the expansion protocol, PACKAGE_REVIEW and UPSTREAM_GUIDE. The upstream form comparisons were JacobianChallenge and StableReduction. The original package was written in a different session, codex-xcfnZg, in PR #11126. I did not write that package.

The issue calls this revision round 2 and refers to a previous report and review object. Neither file existed at the starting atlas commit `3af833082ced78535d8fef8b3e6efc6b59fc1803`. I therefore performed the full review instead of inferring an unavailable defect list. The issue's parenthetical Mordell/Lawrence–Venkatesh title does not describe the named package or accepted packet; this review covers RelativeJacobiansAndIntegralCurveModels throughout.

The source audit used the maintainer-cleared BLR volume in place, public Stacks statements and Parson's public modular-curve notes. No source file or source passage was copied into the submission. The statements, proof routes and computed checks are expressed in our own words.

## Six acceptance criteria

| Criterion | Finding |
| --- | --- |
| Upstream form | Summary, scope, conventions, exact contracts, six ordered layers, APIs, discriminating Checks, worked examples and dependencies are present. The README is below 200 KB. The two group-space bridges are explicit mathematical targets. |
| Fidelity | Every accepted node is retained mathematically, either as a stronger specified target or as an exact existing supplier contract. Missing properness-localization, quotient, rigidificator and modular-comparison interfaces were made explicit. The coverage table below records the destinations. |
| Own words and sources | No reproduced source passages or section-by-section source digest. Fifteen randomly selected BLR locators and additional sensitive locators were checked directly. There were no author-flagged unverified locators or packet source issues. |
| No process residue | The README and Suggested.lean contain no issue identifiers, coverage statuses, checkpoint instructions or review narrative. Corrections and ownership findings are recorded here and in the handoff. |
| Suggested.lean | `lean-check` exited 0. The only warnings are the three theorem admissions. All eleven declarations were inspected: four real-bodied definitions, three theorem targets and four proved examples. No admitted data, artificial carrier, vacuous conclusion or admitted example. |
| Metadata | The file is exactly `topic = "math.NT"` followed by a newline, appropriate for these arithmetic-geometric targets. |

## Corrections applied

1. Added `isProper_iff_localize` in §0.1, including the dimension-zero base case. Properness descends from a localization by finite-presentation limit arguments, then is local on the base. Stacks Lemma 32.13.1, tag 081F, supplies the required spreading step.
2. Strengthened §3.1's universal property to maps into arbitrary separated schemes or algebraic spaces, without requiring a group homomorphism. The rigidified-presentation proof uses equality on the generic fibre, the closed diagonal and schematic density; the quotient epimorphism gives uniqueness. Added translation on an elliptic scheme as a check distinguishing this from the weaker homomorphism-only assertion.
3. Added the accepted flat-trait base-change API for E and P/E, with generic markings and identity/composition coherence. Included henselization, strict henselization, completion and ramified extensions. The nodal chart `xy = π` becoming `xy = (π′)²` distinguishes quotient compatibility from preservation of regularity or of a Néron mapping property.
4. Added the rigidificator `ofSection` and `closedImmersion_iff` interfaces. Universal restriction-injectivity is equivalent to a closed immersion of the function spaces; existence of some finite flat subscheme is insufficient.
5. Made the modular normalization comparison explicit with the actual supplier range: prime N ≥ 5 and diamond subgroup H. It is componentwise, because ModularCurves does not supply irreducibility. The comparison retains the j-map, marking and affine normalization charts; it uses the supplied finite normal interior, rather than a false uniqueness claim for arbitrary compactifications.
6. Moved the existing relative divisor notion and pullback/empty-divisor API to the boundaries with the current library declarations. The ModularCurves link map and current 0A contract additionally supply the fibre criterion, properness-to-finiteness, finite-flat rank and divisor operations. §1.6 now retains the genuinely additional fixed-degree Hilbert open-locus comparison on arbitrary fibres.
7. Added AlgebraicVectorBundles L1A–L1B as the owner of relative Spec and symmetric-algebra base change. §1.3 retains the cohomological corepresenting module, unit locus and rigidification sequence, rather than constructing relative Spec again.
8. Cited AlgebraicModuliForArithmeticGeometry §§7.6.1–7.6.1a for the section-rigidified comparison and `sectionPicardSplit`. §1.5 uses that input in the section case of the more general universal-family interface.
9. Separated the finite-flat suppliers: ModularCurves 0B supplies rank-annihilation; R07.1.2 supplies invertible-order étaleness; R07.1.30 supplies small-ramification full faithfulness. The previous description attributed rank-annihilation to R07.1.2, where that theorem is not stated.
10. Sharpened the BLR §8.3 Theorem 1/Remark 2 locator to printed p. 223. The former range included the preceding page as well.

No packet, library file, other roadmap or other worker's deliverable was edited. Suggested.lean needed no changes.

## Accepted-plan coverage and adversarial mathematics

The following table covers every accepted node. The additional §1.8 bridges and finite-level construction follow it. Existing objects remain supplier inputs; none is claimed implemented merely because it occurs in a roadmap.

| Packet target | README | Instances and hypotheses checked; disposition |
| --- | --- | --- |
| RJ.0/dedekind-model | §0.1 | Field versus DVR, P¹_Z versus A¹_Z, and Z[x]/(2x). Flatness excludes the torsion model, properness stays separate, and generic markings are data. Added properness localization. |
| RJ.0/proper-model-points | §0.2 | Proper P¹, affine nonextension, and a section through `xy = π²`. Properness gives extension; regularity of the total space is needed to put the section in the smooth locus. No arbitrary generic morphism extension is asserted. |
| RJ.0/normalised-projective-line | §0.3 | Rational function field, degree-two map t = u², GL₂(R) versus t ↦ πt, and split constant extensions. Checked the two opposite universal-property directions. Added the componentwise modular marking comparison. |
| RJ.0/normalised-model-properties | §0.4 | Q(√2)(t) over Z has constants Z[√2]; field and trait dimensions differ. Finiteness requires Nagata or the stated finite-separable extension argument. Normality/regularity over an imperfect field does not imply smoothness. |
| RJ.0/two-chart-cech | §0.5 | First restriction minus second, H¹(P¹,O(−2)) generated by t⁻¹, and punctured affine two-space. H⁰ needs only a cover; H¹ needs quasi-coherence and the stated affine opens. Scalar and base-change comparisons remain targets. |
| RJ.0/normalised-model-cohomology | §0.6 | P¹ gives zero overlap quotient; an elliptic example has rank one. A summand R/(π^m) contributes one fibre dimension. The quotient is additive, and the Tor term prevents a false universal base-change claim. |
| RJ.1/fibre-multiplicities | §1.1 | Smooth fibre, double line, blowup and anisotropic real conic. The geometric multiplicity gcd differs from the closed-point index. Locally varying degree is retained on disconnected tests. |
| RJ.1/index-representability | §1.2 | Rank-one and coprime-rank quasi-sections; double component; pointless conic. Norms multiply the class by the rank. Ordinary global functions permit only flat tests; universal global functions permit all tests. |
| RJ.1/rigidificator | §1.3 | One versus two rigidifying points on P¹; a disconnected curve with the subscheme in only one component. Restriction must be universally injective. Added the section and closed-immersion criteria. |
| RJ.1/rigidified-picard-representability | §1.4 | The n-point rigidification kernel is G_m^(n−1) for n ≥ 1; n = 0 is rejected. Cohomology jumps do not prevent rigidified representability. H² vanishing is a curve statement, not a surface theorem. |
| RJ.1/universal-rigidified-bundle | §1.5 | P¹ degree pieces, genus zero, and elliptic two-axis normalization. The base-line factor in the elliptic formula is necessary. A real point of Pic¹ of a pointless conic does not give a universal actual line bundle. |
| RJ.1/relative-cartier-divisors | §1.6 and boundaries | Degree zero, degree one, binary forms on P¹ and the length-one node. A finite flat Hilbert point on a singular curve need not be Cartier. Existing carrier, fibre criterion and finite-flat degree are imported; the Hilbert open-locus theorem remains. |
| RJ.1/abel-map | §1.7 | P¹, elliptic degree one, genus at least two and reducible fibres. Full P(Q_L) fibres require geometric integrality; Q_L is the dual of f_*L only under cohomological flatness. Translation by −re gives total degree zero, not automatically Pic⁰. |
| RJ.2/pointed-smooth-curve | §2.1 | P¹, an elliptic scheme and a disconnected smooth proper family. Geometric connectedness is essential for universal functions. The section gives fibrewise ampleness and projectivity over affine bases; no global trivialization of a P¹-bundle is assumed. |
| RJ.2/jacobian-rigidified-representability | §2.2 | Positive genus uses JacobianChallengePartII; genus zero is handled separately. Nonreduced and non-noetherian test schemes remain in the functor comparison. The universal bundle retains both axis trivializations. |
| RJ.2/jacobian-points-divisor-classes | §2.3 | P¹, elliptic classes and the unpointed conic obstruction. Checked every field extension and Galois naturality. Actual line bundles descend before a divisor representative is selected. |
| RJ.2/good-reduction-specialisation | §2.4 | Colliding rational sections, principal relations and arbitrary DVR extensions in the good-reduction range. The comparison is with actual restricted line bundles and the abelian scheme; it is not extended to a fixed bad-reduction model under ramification. |
| RJ.3/degree-zero-quotient | §3.1 | P¹, blowup, unrepresented Pic, nongroup translation and ramified node. Full Pic has extraneous degree components. The three representability cases, generic isomorphism and largest separated universal property are all specified. |
| RJ.3/raynaud-representability | §3.2 | Normal versus regular, geometric multiplicity gcd one versus the conic's point index. The normal-model theorem keeps f_*O = O; the regular pointed case supplies the stronger comparison. |
| RJ.3/raynaud-neron-model | §3.3 | Nonreduced regular fibres, imperfect residue fields with an étale quasi-section, and the failure of a normal-model-only proof. Finiteness and the full smooth-test mapping property are separate from quotient construction; the component isomorphism is not used circularly. |
| RJ.3/rational-singularities-criterion | §3.4 | Resolution identity, R¹ vanishing and positive-genus exceptional behaviour. Normality, gcd one and the residue/quasi-section alternative stay explicit. A Lie-algebra isomorphism alone is not used to identify arbitrary smooth groups. |
| RJ.3/global-neron-jacobian | §3.5 | Smooth open plus finitely many bad points; field base; nontrivial components. Local quotients glue through marked generic fibres and Néron uniqueness. The full Néron model is not replaced by its identity subgroup. |
| RJ.4/reduction-homomorphism | §4.1 | G_m, constant groups, an abelian scheme and μ₃ over Z_(7). Henselianity is needed for smooth point lifting. Rational component lifting also requires the torsor obstruction to vanish; finite residue fields use Lang. |
| RJ.4/torsion-specialisation | §4.2 | Characteristic-zero residue field, μ_p over Z_p[ζ_p], and −1 over Z₂. The strict inequality e < p−1 is essential. Closure of finitely many sections supplies the finite flat cyclic subgroup inside a separated finite-type ambient group. |
| RJ.4/global-torsion-injection | §4.3 | Good and bad primes, two residue characteristics, and nontrivial Φ. Prime-to-p torsion injection bounds the full Néron special-fibre group, not only its connected part. Component counts require the rational lifting hypotheses. |
| RJ.4/component-multidegree | §4.4 | Blowup lattice, I₂, one component, weighted formal data and a nonzero component class. Row normalization, column action, β α = 0 and negative vertical correction are consistent. The δ > 1 proof includes the finite-level lifting argument. |
| RJ.5/regular-model-existence | §5.1 | Field base, P¹, a singular plane closure and nonreduced regular fibres. Excellence is used for normalization and surface resolution, with finite singular support and marking retained. No canonical resolution or automatic good reduction. |
| RJ.5/specialisation-package | §5.2 | Genus zero, bad and semistable places, perfect and imperfect residues, unramified versus ramified extensions. The section yields multiplicity one and the étale quasi-section. All arithmetic maps factor through the canonical Néron comparison. |

Additional definitions, identities and conventions:

| Item | Adversarial check and result |
| --- | --- |
| §1.8 group-space quotient | H = 1, H = G and μ_n in G_m, including characteristic dividing n. Quotients are fppf sheaf quotients before representability. Flatness and local finite presentation are retained. |
| §1.8 scheme theorem | A smooth group space over a field and the infinite constant group Z over a trait. Connected translation acts on every component; locally finite type does not imply finite type. BLR's scheme-neighbourhood argument is explicitly required before applying its connected-action theorem. |
| §4.4 Greenberg ring spaces | n = 1, equal-characteristic truncated polynomials, mixed characteristic and units of R/(π^n). The mixed-characteristic construction uses Witt-vector ring spaces rather than an invalid k-algebra Weil restriction. |
| §4.4 identity lifting | Surjectivity at finite levels is followed by stabilization of closed kernel images in finite-type groups. The passage to inverse limits does not rely on an unsupported choice of compatible lifts. The complete algebraically closed residue-field range is explicit. |
| Degree and component conventions | d_i, e_i and δ_i = d_i e_i are separate positive integers. e_i divides the partial degree before division; β is nonzero and the finite component set is nonempty. The characteristic exponent is 1 in characteristic zero. |
| Matrix direction and sign | Formal d = (1,1), e = (1,2), intersection matrix ((−2,2),(2,−2)) gives α = ((−2,2),(1,−1)), β = (1,2) and first column (−2,1). The raw vector (−2,2) has β-value 2. For αc = ρ, the correction is L(−Σc_iC_i). |
| Linear systems and rigidification | Quotients of Q_L parametrize lines of sections, so locally free Q_L is (f_*L)^∨. Normalizing along a section includes its pulled-back base line. In the elliptic formula the additional base line cancels both axis restrictions. |
| Finite lattice | For a one-component fibre ker β = 0. In larger rank, coker α has a rank-one free quotient and its torsion is ker β/im α; this justifies the Smith-factor and maximal-minor formulas even when gcd δ_i > 1. |

Every definition subsection has at least three discriminating prose checks. The extra ring-space construction has its own four checks. The checks include computed examples and actual exclusions, rather than only statements that operations exist.

## Direct source checks

For a reproducible random sample I used seed 11130 to select 15 locators from the package's BLR spine. Each selected numbered statement was opened in the cleared volume; this table gives the precise printed-page location and the mathematical match. I also checked the sources listed after the table. No flagged-unverified item was left unexamined: neither the package nor the packet flagged one.

| Selected BLR locator | Comparison |
| --- | --- |
| §9.6, Theorem 1, pp. 274–275 | Component quotient uses intersection entries divided by geometric multiplicity and degree weights d_i e_i. The proof allows flat trait extensions. |
| §8.1, Theorem 7, pp. 206–207 | Sections are corepresented by a finitely presented module; local freeness is equivalent to degree-zero cohomological flatness. |
| §8.1, Proposition 11, p. 209 | The function-unit/rigidified/unrigidified sequence is exact as étale sheaves. |
| §9.6, Corollary 3, p. 277 | Smith factors and the maximal-minor order formula match the stated lattice. |
| §9.4, Theorem 2, pp. 259–260 | Normality, global functions and geometric multiplicity gcd one are retained in the representability criterion. |
| §8.2, Lemma 6, p. 213 | The effective-Cartier condition is an open condition in the flat family of closed subschemes. |
| §8.1, Proposition 9, p. 208 | Universal restriction-injectivity is equivalent to a closed immersion of function spaces; added explicitly. |
| §8.3, Theorem 3, pp. 223–224 | Rigidified representability and a universal family do not require cohomological flatness of the original family. |
| §8.1, Definition 5, p. 205 | The finite flat finitely presented rigidifying subscheme has the required universal injectivity property. |
| §9.1, Corollary 9, pp. 241–242 | Strict-local quasi-sections have the geometric multiplicity as their finite-flat rank. |
| §6.6, Corollary 3, p. 164 | The printed conclusion is finite type. The needed locally finite-type extension has its scheme-locus and connected-action argument specified in §1.8. |
| §7.5, Lemma 5, p. 187 | Small ramification controls finite-flat generic isomorphisms, not arbitrary ambient group schemes directly; the section-union argument bridges that difference. |
| §6.6, Theorem 2(b), pp. 164–165 | The acting connected smooth group may be an algebraic group space. A scheme open whose translates cover gives scheme representability. |
| §8.3, Theorem 1 and Remark 2, p. 223 | The algebraic-space Picard criterion and reduced-base converse use cohomological flatness. Sharpened the locator. |
| §9.3, Lemma 5, p. 256 | The nonspecial degree-g smooth-support locus gives the required open immersion. |

Additional direct checks: BLR §3.1 Proposition 2, p. 61; §8.2 Proposition 7, pp. 214–215; §8.3 Proposition 9, p. 231; §8.4 Proposition 2, p. 232; §9.1 Corollary 10 and Proposition 11, pp. 242–243; §9.3 Lemma 4, p. 255; §9.5 Lemma 2, Proposition 3, Theorem 4 and their proofs, pp. 265–268; §9.6 Lemma 2 and proof, pp. 275–277; §9.7 Theorem 1 and Proposition 3, pp. 286–288. These checks cover the regular-section smooth-locus assertion, projectivization convention, norm obstruction, three quotient cases, full Néron comparison, Greenberg step and modular normal-model example.

Public Stacks statements checked directly: Definition 29.54.3 and Lemma 29.54.4 (035H, 035I), Lemma 10.161.8 (032L), Lemma 15.22.11 (0AUW), Lemmas 30.2.2 and 30.2.6 (01XB, 01XD), Lemma 33.44.14 (0B5X), Lemmas 37.50.1 and 37.50.3 (0B45, 0D2S), Lemma 32.13.1 (081F), and Theorem 54.14.5 (0BGP). Their exact hypotheses support the stated uses; in particular, resolution is used only for the excellent normal surface, and relative ampleness implies projectivity here on affine bases.

Parson, *Moduli of elliptic curves*, §§8.1–8.3, pp. 14–16, supports the X₀(11) example. I recomputed the Weierstrass invariants, point multiples, point counts and node slopes independently with rational and modular arithmetic. The displayed short model has c₄ = 496, c₆ = 20008 and Δ = −161051 = −11⁵. The successive multiples of (5,5) are (16,−61), (16,60), (5,−6), O. The projective point counts at 2 and 3 are both 5. At 11 the unique singular affine point is (5,5), and the tangent slopes are 5 and 6. Thus the split multiplicative calculation uses prime 11; the package already corrects the notes' isolated prime-5 typo from the equation. The blowup and I₂ rank-one minor gcds are 1 and 2, respectively.

## Library, roadmap and dependency audit

Pinned source statements were read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Current duplicate checking used TauCetiRoadmap `0d144d044dacebca17b654695b6f1ad58f159b27` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. I searched mathematical carriers and hypotheses, not only proposed declaration names.

| Area | Existing contract read and disposition |
| --- | --- |
| DVR models and fibres | `Curves.StableReduction.Model.Basic:Model`, its marked morphisms and properness predicate; `Fibers:genericFiber`, `genericFiberι`, `specialFiber`. The kept structure extends the base to Dedekind domains and does not reconstruct the DVR category. |
| Normalization | Mathlib `AlgebraicGeometry.Normalization`: `Scheme.Hom.normalization`, `fromNormalization`, `normalizationDesc` and affine integral-closure descriptions. General normalization remains a boundary; the integral marked two-chart model and its arithmetic properties are the targets. |
| Cohomology | `Cohomology.Basic` and `Cohomology.MayerVietoris`: actual cohomology, restrictions, difference sign and exactness. The existing noetherian two-affine higher-vanishing theorem is imported. The specified H⁰/H¹ kernel/cokernel identifications retain the structural maps and scalar comparisons. |
| Rigidification | Current `LineBundle.Rigidified.Basic` and `PicardFunctor.Rigidified:rigidifiedPicardFunctor`. The latter is a functor of actual rigidified classes; it does not prove general rigidificator representability. Section splitting is supplied by the moduli roadmap. |
| Actual degree-zero classes | Current `WeilDivisor.Scheme.PicZero`: `LineBundleClass.picZero`, `SchemeWeilDivisor.map_picZero`, with proper integral noetherian curve hypotheses. These are inputs, not a new class-group theorem. |
| Relative divisors | Current `EffectiveCartierDivisor.Relative:IsRelativeEffectiveCartier`, arbitrary comap and empty divisor; `EffectiveCartierDivisor.Functor:relativeEffectiveCartierSubfunctor`. ModularCurves 0A supplies the additional criterion and finite-flat degree. Only the Hilbert-locus comparison is kept. |
| Numerical Picard groups | `Curves.StableReduction.Picard.Basic`: weighted relation rows, total-degree weights and comparison with the raw cokernel. Constant-field weights are not automatically geometric multiplicities over an imperfect field. The geometric Φ comparison remains new. |
| Field/smooth curves | AlgebraicCurves Layers 2/12; JacobianChallenge A–F; JacobianChallengePartII 0–3. The field curve, Jacobian, polarization and smooth Abel constructions remain imports. The rigidified comparison, genus-zero case and arithmetic specialization are retained. |
| Existing Néron comparison | NeronModelsAndSemistableAbelianVarieties §§3.8–3.9 and 4.7 cover the semistable and algebraically closed residue-field gcd-one cases. The normal-model quotient, imperfect-residue normalization and gcd-greater-than-one proof are explicitly stronger. |
| Group-space bridges | ReductiveGroupsPartII RG2.3.1 is scheme-valued. The package supplies the algebraic-space quotient and locally finite-type scheme bridge rather than assuming the stronger statement from that supplier. |
| Newer upstream roadmaps | Searched README and representative Lean files of AlgebraicVectorBundles, DifferentialGeometry, IntegralLattices, LocalGaloisGroups, OperatorTheory (including its subroadmaps), OrthogonalSpinGroups, PeripheralActions, ProfiniteArithmetic and RealAlgebraicGeometry. Only relative Spec in AlgebraicVectorBundles needed an additional ownership boundary here. |
| Completed work | Searched Completed, including ContourIntegration, EffectiveBounds, OrthogonalL2Bases, RestrictedProducts and IntegralLattices. General Smith/lattice machinery is an input; these do not supply this Picard/Néron component theorem. |

The accepted supplier requests were compared with the actual package contracts and available AlgebraicCurves/ModularCurves link maps. No link map contains a direct edge mentioning this new roadmap. The ModularCurves map supplied the important 0A ownership correction and its Layer-10 prime-level/diamond-quotient range. The two group-space bridges and the finite-level Greenberg argument close stronger contracts that cannot be obtained merely by citing the scheme-valued or gcd-one suppliers.

The tier order places ReductiveGroupsPartII in tier 1, SchemeAndStackFoundations in 2, AlgebraicModuliForArithmeticGeometry in 4, AbelianSchemesAndArithmeticModuli in 6, NeronModelsAndSemistableAbelianVarieties in 8 and FiniteFlatGroupsAndIntegralPadicHodgeTheory in 10. This roadmap and JacobianChallengePartII are outside that 94-roadmap tier list. Their dependency order is explicit: the relative-Jacobian supplier and all cited finite-flat/Néron suppliers precede this package. No artificial tier assignment or upward citation was introduced. HeightsRationalPointsAndObstructions remains a compatibility boundary, not a prerequisite. The final package has no `UPSTREAM:` or FoundationsAndLibraryIntegration dependency.

## Lean comparison and validation

The Lean file keeps only statements easily expressed on the pinned carriers. `DedekindModel` records all three finite-presentation constituents and the marked generic isomorphism. `ofModel` has a real body and preserves both the structure map and marking. `IsProper` is the actual morphism property. `existsUnique_section` retains the over-base and generic-point equations; it is meaningful over a field as well as a DVR.

`twoChartDifferential` has the first-minus-second sign. Its two proved biproduct examples pin both maps. `cohomologyZero` needs only the cover, and identifies the kernel inclusion. `cohomologyOne` keeps quasi-coherence and the affine-intersection hypotheses and identifies the cokernel map with the supplied connecting morphism. Its more general non-noetherian statement is mathematically supported by affine quasi-coherent acyclicity; it does not pretend that the existing noetherian higher-vanishing theorem supplies that generality. All four examples are proved and concern the definitions introduced here. The two model examples preserve the actual DVR input rather than calculate unrelated library objects.

The heavy Picard, quotient, group-space and Greenberg carriers stay in the README and the closing inventory. No headline was forced through an admitted carrier. There are only three theorem signatures to compare; I inspected all eleven declarations instead of adding seven artificial signatures to meet a numerical spot-check target.

Validation: `lean-check` exited 0 with exactly three `declaration uses sorry` warnings; `python3 scripts/check_blueprint.py research/blueprint/packets/RelativeJacobiansAndIntegralCurveModels.json` exited 0 with 0 errors and 0 warnings. Submission-file validation and whitespace checks are recorded with the handoff. No unresolved mathematical or scope defect remains from this review.
