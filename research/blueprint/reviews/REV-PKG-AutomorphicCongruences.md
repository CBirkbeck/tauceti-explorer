# Independent package review: AutomorphicCongruences

**Verdict: needs_changes.** The review is complete, with the clear corrections applied to the package. The remaining defects concern prerequisite closure and exact source comparisons. They are listed below with consuming targets; the arithmetic endpoints have not been weakened to remove them. This is not an upstream approval.

Reviewer: Codex, session `codex-8KbFeA`, issue #10892, 2026-10-20. The reviewed package was written by session `codex-5MsNSf`; this reviewer did not write it. The accepted inputs are `AutomorphicCongruences--L0.json` and `AutomorphicCongruences--L5b.json`. Neither packet was edited.

## Coverage and form

Read the complete package README, Suggested.lean, metadata, both accepted packets and the package handoff. Compared the form with the upstream Multiquadratic, ArithmeticDirichletSeries and RepresentationTheory READMEs in the atlas, and with the current LocalGaloisGroups and ProfiniteArithmetic signature files. Applied WORKERS, PROTOCOL, UPSTREAM_GUIDE and PACKAGE_REVIEW, including the adversarial mathematics pass.

The README retains all 92 target anchors: L0.1–9, L1.1–11, L2s.1–8, L2.1–14, L3.1–10, L4.1–10, L5w.1–13, L5a.1–6, L5b.1–10 and L5.1. All 130 input API items remain; `KlingenEisenstein.normalized` makes the normalization comparison explicit as an additional item. All input tests and acceptance requirements remain represented. Each of the 18 definition/construction interfaces has at least three discriminating Checks. All ten layer example sections remain. Internal target links resolve.

The README has the required summary, boundaries, conventions, supplier contracts, ordered layers, dependencies and references. It is mathematical prose with source locators, rather than a packet catalogue. `metadata.toml` is the single line `topic = "math.NT"`. No source passage or section-by-section source summary was added. Mathematical formulas and numbered locators are retained in the package's own exposition.

## Corrections applied

1. **SU raw and normalized Eisenstein series, L1.4.** Separated raw E_D from G_D in SU (11.7.5.a), p.181, and C_D from the integral family coefficients c_D. Added the complete scalar and its API. Restricted integral singular-coefficient divisibility to the canonical-period-normalized family and the cusp/local-section hypotheses of Theorem 12.4.2(ii), p.203. The raw constant term is the inducing section, by Lemma 9.3.2(ii), pp.125–126; the L-value scalar belongs to the normalization. Replaced the old raw-series boundary Check accordingly. Corrected the §11 locator calling 11.7.3 a proposition: it is a lemma. The pullback still retains its local and L-value scalar.
2. **FW auxiliary field, L2.10.** Definition 4.24, p.51, ramifies the Steinberg witness prime; the package had selected it inert. Aligned the field choice, proof and 2-adic cases with FW. Kept SU's different inert choice in L1.11. Explicitly separated these field conditions from the additional Steinberg-twist/Hsieh hypotheses needed for the stronger divisibility. Added the source's odd-prime/split-p assumptions to L2.2 and L2.6.
3. **Original CM comparison, L0.9.** Added original HT93, Hid91 and Hid06 locators and hypotheses. Hid06 assumes p>3 and additional global character/conductor hypotheses; it cannot automatically supply the p=3 CLW application. Marked the exact integral congruence-lattice/Katz comparison as a gap, including p=3. Did not turn Petersson identities into an integral lattice equality.
4. **Vatsal, L1.5.** Recorded that Theorem 1.1 computes the valuation of congruence constants; it does not assert unconditional μ=0. The SU application must prove these constants are units and compare the specified periods. Located the constants, coefficient nonvanishing and proof reduction in the original paper.
5. **Paškūnas attribution and p=3.** Replaced the inherited Paškūnas–Tung attribution with Paškūnas's sole-authored 2016 paper. Its Propositions 2.13 and 2.33 are the results FW cites. Retained the local residual hypotheses and the need for a supplier adapter; a citation alone does not extend the written R30/R31 signatures.
6. **Pottharst and Betina–Williams, L2.12.** Added original numbered locators and the perfectness, amplitude, base-change, inertia-flatness, level and split-p qualifications. Distinguished a nonzero period scalar from an integral unit comparison, and nearly ordinary analytic complexes from the full finite-slope comparison required by FW.
7. **Current Kato package references.** Its rational zeta morphisms are now §§5.1 and 5.4; the cohomological bound is §7.2, elliptic ordinary bound §7.4 and modular ordinary bound §7.5. Corrected the corresponding L3, L4 and L5b references. Existing Layer 5 does not plan the BSTW two-variable construction: routed that proposed extension to KatoEulerSystems, Part II. The existing §§4.3–4.4 remain the early generic bound and module-structure suppliers.
8. **Existing owners.** Clarified that PMIA already plans normal-domain characteristic divisors and graded determinants; only its stated nonfactorial ideal, specialization and descent refinements are requested. Added EllipticCurves Layer 7's generic discrete Selmer kernel to the boundary. L0.1 remains the SU ordinary instance and tower comparison.
9. **Coefficient and algebraic Checks.** Made the L0.4 kernel base-change claim flat and compatible with the Hecke quotient; it does not assert arbitrary quotient specialization. Restricted the SU period formula's coefficient ring to the source's integral subring of Q̄_p. Made the 691 example compute an exact first power. Replaced process-oriented/vacuous Checks by split-scalar endomorphism, nonunit rank-one trivialization and zero augmentation computations. Corrected the L5b.6 matrix Check: for A=[[1,p],[0,1]] it is A−1, rather than invertible A, whose cokernel is Z_p⊕Z/p. Retained the original general targets and their other tests.
10. **Conditional field verification.** L5w.13 now states its field conditions without importing their later existence theorem, and no longer lists the completed quartic divisibility as an input. The engine is conditional; L5a supplies existence. The finite ramification condition excluding the narrow Hilbert class field is retained.

## Sources checked directly

Sources were read as mathematical data. Main papers use the versions linked in the README: SU's author manuscript, FW arXiv v3, CLW v1 with the six-page addendum, Nakamura v2, CW v1, BCS v2 and the published BCS pagination, Wan 2015 and Fujiwara v2. A reproducible independent sample uses `random.Random(10892).sample` on the concatenated L0 then L5b packet node lists, selecting 15 nodes. The following table records every selected target and the passages inspected; this is not a claim that every proof in every paper was read.

| Selected target | Primary locators read and result |
| --- | --- |
| L5w.13 selected base-change hypotheses | BCS published Prop.5.2.1 and Lemma 5.2.3, pp.11–12; v2 pp.9–10. Wan Thm 103 proof, pp.91–92; Fujiwara Def.6.11, pp.54–55, Prop.9.8, p.83. Keep minimality, p=5 and finite-ramification checks. |
| L5a.2 quartic Selmer restriction | BCS v2 Lemma 5.1.1, p.9. The package correctly places the two Shapiro summands over K rather than M; η_F is trivial on G_M. Containment direction retained. |
| L4.3 universal-family theorem | FW Thm 5.2, p.69, Thm 1.8, p.8, Prop.5.6, p.71 and proof p.73. The theorem is over regular Λ, not the stronger full deformation ring. |
| L2.8 BF reciprocity | CW Thm 3.6, p.15; FW §§4.4–4.5, pp.51–57. Retain fractional congruence targets, local ordering and p-power ambiguity. |
| L2s.5 Eisenstein comparison | CLW Thm 8.1.1, p.77; addendum Thm 5.0.1, p.6. Two-family joint height-one avoidance replaces an unjustified single simultaneous-unit choice. |
| L5a.3 analytic restriction | BCS v2 Lemma 5.1.2, p.9, with §2, p.6. Rational scalar comparison does not give an integral unit identity. |
| L2.3 Greenberg factorization | FW Cor.7.21, p.89 and Prop.4.35, p.57. Keep Katz and class-number factors and the coefficient ring. |
| L5w.8 polarized Galois/Selmer instance | Wan Prop.98 and hypotheses, pp.84–86, Thm 100, pp.87–88. The polarized four-dimensional lattice, plus/minus disjointness and scalar-character Selmer term are essential. |
| L0.4 Eisenstein ideal | SU §6.5.3, pp.97–98; FW Def.7.30, p.96; CLW p.79. Hecke ideal and coefficient contraction are different ideals. |
| L0.6 extension local conditions | SU Prop.4.5.4, pp.59–60, §7.3.5, p.107; FW Thm 1.6, p.6 and Assumption3.7, p.25. Preserve local conditions and the chosen residual ramification witness. |
| L4.5 pointwise theorem | FW Thm 5.1, p.68, Thm 1.7, p.7, Cors 5.3–5.4, p.69 and proof p.73. T5.1 permits a trivial μ in the reducible-at-p case; T1.7 is narrower. |
| L1.4 Klingen series | SU Props 9.2.6, 9.3.3, 9.5.3, 9.6.1–2, selected §11 pullback and coefficient statements, (11.7.5.a), p.181 and Thms 12.4.1–2, pp.202–203. Corrected normalization, boundary and divisibility as above. |
| L3.10 generalized conjectures | FW Conjs3.24–3.27, p.34, Conj3.30, p.36, Conj1.5, p.6 and Thm 1.8, p.8. Keep S_Iw, the full/partial lines and Λ/T distinctions. |
| L0.8 canonical periods | SU Lemma 12.2.2 and family discussion, pp.194–195, Lemma 12.2.7, pp.197–198, Thm 12.3.1, p.199, Thms 12.4.1–2, pp.202–203. Stabilization scalar, period lattice and unit ambiguity remain explicit. |
| L2.6 GU(3, 1) divisibility | FW Thm 7.32, pp.96–97, Thm 4.41 and Def.4.39, pp.58–59, Thm 1.12, pp.10–11. Keep split-p, odd-p, local Steinberg and exceptional-prime distinctions. |

Every class of original source flagged unread in the package handoff was investigated:

| Original source | Direct verification or remaining limitation |
| --- | --- |
| HT93 | Theorem 7.1 and (7.3a–b), printed pp.240–242; (8.8b), p.251. Read the primitive and Euler-factor qualifications. These formulas alone do not identify the integral CM congruence lattice. |
| Hid91 | Lemma 5.3(i–vi), printed pp.353–355. Its final part is an adjoint/Petersson comparison; integral normalization still needs its own comparison. |
| Hid06 | Main theorem, pp.466–467; Thm 6.3, p.509, (7.15–7.17), pp.526–527. p>3, unramified CM, ordinary CM type, prime-to-p order, split-conductor and residual/global character hypotheses are not consequences of p-distinguishedness alone. |
| Vatsal | Thm 1.1, author-copy p.3; §2.4, pp.10–11; §4.6 and Prop.4.7, pp.18–19; §5.9, p.26. The formula μ=ord_λ(C_Eis²C_csp) requires a unit/period comparison in the SU application. |
| Paškūnas 2016 | Props 2.13 and 2.33, printed pp.1312 and 1327–1328, PDF pp.14 and 29–30. Verified the original statements and their role in FW's p.24 remark; corrected the attribution. |
| Pottharst | Thms 1.11–1.13, printed pp.1585–1586, PDF pp.16–17; Thm 3.13, pp.1608–1609, PDF pp.39–40. Exact complex and specialization hypotheses recorded. |
| Betina–Williams v2 | ThmsA–C, pp.2–4, compared with FW (4.7.4–4.7.5), p.68. Family/factorization results do not by themselves assert the required integral period unit. |
| HT94 | Publisher/author-index/archive routes identified the paper but did not provide a readable original theorem in this review. No original theorem locator is certified; L0.9 explicitly retains this comparison gap. |
| Harris 1984 | Annals confirms the article, volume119(1), pp.59–94. The original Thm 2.5.6 was not accessible through the attempted primary routes. Its exact weight/regularity range remains a source gap. |
| Ikeda 1994 | Primary publisher routes for J.Math.Kyoto Univ.34(3), pp.615–636, DOI10.1215/kjm/1250518935 did not yield a readable original. The source gap is explicit in the MP.6 contract. |
| Ichino 2008 | Primary publisher/author routes did not supply the original theorem and exact unitary/local comparison during this review. The gap is explicit in the AL.3 contract. |

The readable original sources are linked directly in the README reference list. The Vatsal and auxiliary period checks establish what the sources say, rather than closing every proof or supplier obligation. No inaccessible theorem has been silently certified from a secondary invocation.

## Libraries, current roadmaps and closure

Checked Mathlib at `082e2d37e8b0463410cdb532e111cd43d5a66174` and the cited Tau Ceti declarations at `f790474821cf4256814db967cb154e7af3d0c369`. Read the package's ten entries in `data/library-coverage.json`. Independently inspected the baseline signatures, including `Module.length`, `LocalizedModule`, ideal span/map/comap and their product/unit APIs, the valuation/local/reduced/UFD classes, `Matrix.charpoly`, `MvPowerSeries`, continuous H¹, quadratic-twist point equivariance, multiquadratic splitting and Galoisness. A declaration's existence is not a proof of the arithmetic comparison that consumes it.

Also audited the current read-only upstream roadmap tree at `0d144d044dacebca17b654695b6f1ad58f159b27` and Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Screened all target families by their mathematical objects and hypotheses, not only proposed names. The nine newer roadmaps checked were AlgebraicVectorBundles, DifferentialGeometry, IntegralLattices, LocalGaloisGroups, OperatorTheory, OrthogonalSpinGroups, PeripheralActions, ProfiniteArithmetic and RealAlgebraicGeometry, together with Completed/ContourIntegration, EffectiveBounds, OrthogonalL2Bases and RestrictedProducts. OperatorTheory's signature files are in subdirectories. No lake command was run in either read-only tree.

| Existing owner or carrier | Boundary verified |
| --- | --- |
| IHG Layers2, 4, 6 and later two-character Ribet statements | Integral Hecke/determinant/GMA and rank-two results are imported. Even allowing coincident residual characters does not give a polarized 1+n+1 or 1+2+1 theorem. |
| EllipticCurves Layers2, 7 | Torsion/Tate modules and generic discrete-coefficient Selmer kernels belong there. AC keeps the integral twist, ordinary local-condition and tower comparisons. |
| ProfiniteCohomology Layer 7 | Discrete-coefficient continuous Shapiro; a compact lattice cannot simply be substituted for that carrier. |
| Current Tau Ceti Fitting/compact/completed algebra APIs | These carriers are already implemented. They do not supply normal-domain characteristic/divisor comparisons, arithmetic control, or regulator periods. |
| IntegralLattices and AlgebraicVectorBundles | Quadratic-form lattice theory and geometric vector-bundle/divisor theory do not supply the polarized Galois lattice or Iwasawa characteristic-ideal theorems. No duplicate generic construction was added. |
| Other newer and Completed roadmaps | Their analytic, orthogonal, geometric, profinite and restricted-product infrastructure remains with its existing owner; none supplies the retained source-specific arithmetic targets. |
| Current atlas PMIA package | Normal-domain `charDivisor` and graded `detLine` already planned. AC requests their exact divisorial-ideal, majorant-specialization and faithful-descent refinements. |
| Current atlas Kato package | §§4.3–4.4, 5.1–5.4, 7.2–7.5 supply distinct early structure, rational maps and upper bounds. BSTW two-variable data are absent and need Part II. |

No target was removed as a duplicate: the package already deferred the generic constructions. The boundary corrections above prevent its requested refinements from being mistaken for new generic definitions.

**Remaining prerequisite defects:**

| Defect | Exact work required and affected targets |
| --- | --- |
| R1: tier/bundle closure | AutomorphicCongruences has no entry in the checked CaraianiNewton order, so no lower-tier/bundle justification exists for all its suppliers. Kato is outside that order; AutomorphicPadicLFunctions and PadicHodgeRegulators are explicitly omitted from it. Their moved-down L3/L1 notions are not the whole unitary/Yager contracts here. Assign a valid order or bundle and reconcile every supplier edge. This reviewer cannot change the programme's tier files in this job. |
| R2: exact external theorem refinements | IHG Part II's polarized lattice/length theorem (L0.7,L5w.8), PadicHodgeRegulators Part II's integral Yager comparison (L2.11–13), Selmer's finite-slope analytic comparison and the equal-Satake period adapter (L2.12), and Kato Part II's ordinary BSTW element/reciprocity/duality (L5a.1, 6) are requests, not existing exact theorem targets that close the imports. Supply those plans in their owners, or valid local targets and a reconciled dependency order. Preserve the Hilbert period/control and integral elliptic image/period refinements as well. |
| R3: full CM congruence comparison | L0.9 and L2s.8 require the exact integral congruence/Katz comparison over the stated ring and tame level, including p=3. Hid06's p>3 theorem and the displayed Petersson identities do not discharge this. Verify the alternative theorem, hypotheses and lattice map; do not remove p=3 from the endpoint. |
| R4: original-source and general-weight gaps | Verify HT94 and the original Harris, Ikeda and Ichino comparison statements and their local/weight hypotheses. The FW vector-valued analogue of the scalar CLW two-family repair also remains an explicit target/proof gap (L2.4, 6, 12–14 and L4 seed arguments); the scalar addendum does not prove it. |

The input packets already contain 26 gaps and 43 requests; those counts are not themselves a new mathematical objection. The defects above identify particular unresolved contracts and hypotheses that prevent an assertion of closed upstream readiness. The review does not require that a roadmap's proposed theorems already be formalised.

## Adversarial mathematics pass

The following range table covers every one of the 92 targets, including the theorems, comparisons and application statements. Every range was checked against the hypotheses and earlier-layer route in the README; original-source rechecking is the scoped sample above. Empty, zero, unit and excluded-prime cases were evaluated where they make mathematical sense, rather than treating a source hypothesis as optional.

| Targets | Instances and mathematical checks | Outcome |
| --- | --- | --- |
| L0.1–3 | T=0 gives Selmer/dual zero and characteristic ideal (1); Σ containing p does not remove the p-condition; T_v=0 allows nonzero unramified classes; finite pseudo-null errors need not vanish as modules; specialization at a zero analytic value cannot be canceled. | Keep discrete/compact distinction, derived/Tor terms, normal-domain divisor and nonzero-majorant hypotheses. |
| L0.4–9 | Empty operator differences, one difference 5, a unit difference, noninjective Z→Z/5, middle rank n=0, coincident residual characters, nonunit period rescaling, ramified O with p=uϖ^e, p=3 versus Hid06 p>3. | Clarified flat kernel transport, exact 691 valuation, period coefficient ring and CM source gap. Polarized hypotheses remain. |
| L1.1–4 | Zero q-expansion at all cusps; boundary form outside cuspidal kernel; trace at identity 1+2+1=4; specialization's three variables; raw E versus scalar multiple G; vanishing holomorphic intertwining term. | Corrected raw constant term and normalized coefficient API; no scalar is inserted twice. |
| L1.5–11 | Vatsal congruence constants nonunits; singular versus nonsingular coefficients; nonzero boundary reduced modulo the analytic product; residual-disjointness failures; Euler factors at nonminimal levels; SU inert auxiliary witness. | Retain exact canonical periods, ramification and localized congruence hypotheses. No unconditional μ=0 or global period-unit comparison inferred. |
| L2s.1–8 | Supersingular a_p=0 with unitary semi-ordinary normalization; ordinary projection zero; weight-space dimension; two proper Fourier–Jacobi value ideals whose joint support is empty; a pulled-back height-one prime that survives p-inversion. | Semi-ordinary and ordinary carriers remain distinct; choose a family separately at each prime. Cyclotomic localization is not identified with p-inversion. |
| L2.1–6 | General even weight versus scalar weight two; nonunit Steinberg Euler factor; a pulled-back height-one prime; p=2 excluded by source; p split in K. | General-weight repair remains explicit. Kept both forms of FW's containment and all stronger local hypotheses. |
| L2.7–14 | BF specialized L-value zero; smoothing augmentation zero; fractional versus integral reciprocity; ramified versus inert auxiliary witness including ℓ=2; φ=1 exponential; equal Satake parameters; rational rank-one quotient with integral torsion. | No arbitrary inversion of smoothing factors. Fixed field choice; retain rescaling, period and integral Kato-witness obligations before descent. |
| L3.1–3 | Split scalar local representation has endomorphism dimension 4; local character ratio1 passes A3.5's ratio condition but fails A2.1; trivial μ distinguishes T5.1 from T1.7; p=3/p=5 supplier boundaries. | Replaced vacuous Check, retained residual/local hypotheses and corrected original attribution. Complete-intersection does not imply regular deformation ring. |
| L3.4–10 | [A→dA] in degrees0, 1 maps determinant basis to d and inverse determinant to d⁻¹; d=0 has no acyclic trivialization; A/(x,y) is pseudo-null with Fitt₀=(x,y); zero zeta map; trivial smoothing character; images A,ϖA,(γ−1)A. | All denominators require nonzero elements. Rank-one fraction-field isomorphism is not an integral basis. The coefficient ring is S_Iw and Λ/T are distinct. |
| L4.1–10 | Unit/nonunit primal and dual images; a finite étale fiber multiplies dual images; ramified coefficient valuation differs from a p-valuation; nonétale specialization has Tor terms; residual Euler1−γ is nonzero and nonunit. | Kept determinant norm, local corrections and distinction between full T theorem and proved Λ theorem. No residual Euler unit inferred. |
| L5w.1–5 | p=5 and weight2 boundary cases; odd versus even [F:Q]; induced exceptional inertia type; rational projectors with denominators; empty N⁻=1 case. | Keep exact minimality, freeness, period and local-type suppliers; finite flatness alone does not imply regularity. |
| L5w.6–10 | Integer differences0, 5, 1 and noninjective coefficient kernel; two split Satake families; localization before quotient length; residual 1+2+1 blocks; plus/minus intersection; non-torsion characteristic zero convention. | General algebraic coefficient ideal agrees with Lean; polarized theorem and scalar-character Selmer estimate remain necessary. No torsion proof from characteristic zero. |
| L5w.11–13 | Nonprincipal characteristic ideal versus principal majorant; zero specialization; O→O′ faithful flat descent; finite ramification outside D_F excludes the narrow class field; q=ℓ²≡1 when ℓ≡−1 mod p. | Keep arithmetic control corrections. Conditional local verification is independent of the final endpoint and later field existence. |
| L5a.1–6 | irr_K forces H⁰(K,g[p])=0; Shapiro summands over K; p-adic rational scalar versus unit; D=−7 and13 at 2; vanishing specialized analytic function. | Retain van_K, exact BSTW data, field selection, torsion and nonzero-function conditions. Product containment direction remains correct. |
| L5b.1–10 | Finite-level discrete Shapiro with 2 invertible; ordinary filtration under unramified twist; A−1 for A=[[1,p],[0,1]] has a cokernel with torsion; σ²−1=2N and failure at 2; a zero analytic factor; CM curve versus non-CM image hypothesis. | Keep exact integral (im), all four opposite bounds, period units, torsion and coefficient descent. Algebraic separation uses nonzero factors in a domain. |
| L5.1 | A defect divisible byϖ disappears rationally; CM and non-CM routes have different upper-bound inputs. | Aggregate adds no new proof; rational and conditional integral conclusions stay separate. |

For the definitions/constructions, the following witnesses supplement the range table and identify three genuinely discriminating tests per interface. Extra input Checks were preserved, including repeated agreement checks.

| Interface | Positive/computed, degenerate/agreement and negative witnesses |
| --- | --- |
| SigmaSelmer | T_v=T gives full relaxed cohomology; T=0 gives zero; T_v=0 admits an unramified class that strict zero rejects. |
| EisensteinIdeal | Operator difference 0 gives(0); difference 5 gives(5); unit gives(1); noninjective coefficient kernel is retained. |
| LatticeDatum | SU/CLW/FW have middle rank2; source twists give trace χ+trρ₀+χ′; n=0 and coincident outer characters fail the datum. |
| GU22Forms | Degree-one agreement; zero all-cusp expansion detects zero; nonzero boundary rejects the cuspidal kernel. |
| EisensteinDatum | Trace1+2+1 and degree4; arithmetic coefficient quotient has dimension 4; GL₂ degree2 fails the operator dictionary. |
| KlingenEisenstein | Raw constant term equals the inducing section; normalized coefficients scale by the exact scalar; a Siegel series and a nonunit-rescaled lattice fail the specified construction. |
| GU22PseudoChar | Identity trace 4; quotient agrees with the Eisenstein residual trace; dimension 2 fails specialization. |
| SemiOrd | Unit eigenvalue factorial powers tend to1; nonunit eigenvalue powers tend to0; supersingular GL₂ gives a semi-ordinary unitary instance killed by the ordinary projector. |
| SemiOrdKlingen | Arithmetic interpolation/constant terms match; constituent dimensions2+1+1; ordinary projector rejects the supersingular instance. |
| BF | Two reciprocity maps and CM Shapiro agree; local conditions distinguish the two p-places; single-form Kato classes and forbidden smoothing conductors fail the construction. |
| FWResidual | Dihedral restriction fails A2.1; Tate-curve inertia supplies A3.7; scalar local endomorphisms and trivial μ distinguish the separate predicates. |
| FundLine | Unit differential gives unit lattice; d≠0 gives dA versus d⁻¹A; d=0 and noninvertible Fitt₀(A/(x,y)) reject false trivializations. |
| CompZeta | Weight2 coefficients are trivial with finite-level coinvariants; bad-level corestriction has no extra Euler factor; trivial smoothing augmentation is zero and cannot be inverted. |
| NakamuraZeta | Good-prime corestriction has degree2 Euler polynomial; empty tame set gives empty product; residual Eisenstein input is excluded. |
| ZetaTriv | Classical unit lattice agrees with characteristic equality; unobstructed T=Λ agrees with restriction of scalars; zero generic map and inversion of primal/dual lattice fail. |
| GenMC | Images A andϖA distinguish integrality; γ−1 vanishes at augmentation; unobstructed and classical comparisons retain their coefficient ring. |
| ResZeta | Minimal ramification change is identity; modular point reduction includes Euler factors; 1−γ is nonzero and nonunit, so erasing it fails. |
| Wan coefficient ideal | Differences 0, 5, 1 produce(0),(5),(1); Z→Z/5 retains(5) on coefficients despite zero Hecke ideal; split operator indices are distinct. |

## Lean signature check and validation

Suggested.lean is 101 lines with two real-bodied definitions, two theorem milestones and four proved examples. All eight declarations were checked against the README; there are fewer than ten signatures to sample.

| Declaration | README agreement |
| --- | --- |
| `EisensteinIdeal.hecke` | Ideal generated by operator differences over arbitrary commutative rings. |
| `EisensteinIdeal.base` | Contraction along the supplied coefficient map, without an injectivity assumption. |
| `EisensteinIdeal.quotientEquiv` | Quotient presentation requires surjectivity onto the Hecke quotient and retains the coefficient map. |
| Two `hecke` examples | Differences 0 and5 give the prescribed ideals, proved without sorry. |
| Two `base` examples | Noninjective coefficient kernel and unit ideal, proved without sorry. |
| `factorSeparation` | Any finite family of ideals in a domain, each containing its nonzero analytic principal ideal, and the reverse product containment; concludes each equality. Empty index type is harmless. |

The domain hypothesis permits cancellation: multiply any element of J_i by the other nonzero analytic factors, use product containment, then cancel their product. No UFD or DVR restriction is hidden in this algebraic statement. Arithmetic construction and comparison of the ideals requires the stronger conditions in L5b. No heavy arithmetic carrier was introduced as sorry'd data. All other README definition names occur in the closing comment; Wan's ideal is explicitly an instance of the two kept definitions.

- `lean-check` on Suggested.lean: exit 0, exactly two warnings, both `declaration uses sorry` at lines39 and 82. Memory was checked before elaboration. No Lean server or lake build/update/cache command was started.
- `scripts/check_blueprint.py` on both accepted packets: exit 0, zero errors and warnings; 69+23 nodes, 125+5 API items, 68+4 input unit tests.
- Target/anchor/API inventory and internal-link check: all 92 targets retained; all 18 interfaces have at least three Checks; no missing internal anchor.
- `intake.py check-files` on the six review deliverables: zero problems.
- `git diff --check`: clean. Suggested.lean and metadata remain unchanged because their statements and form pass.

The original-source and supplier limitations above remain material. Passing elaboration validates signatures, not the unresolved arithmetic or the truth of all theorem targets.
